-- Table: public.account_saved_keys
CREATE TABLE IF NOT EXISTS public.accounts (
    user_id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ),
    email VARCHAR(255) NOT NULL,
    hash_password VARCHAR(255) NOT NULL,
    username VARCHAR(255),
    CONSTRAINT accounts_pkey PRIMARY KEY (user_id),
    CONSTRAINT uk_email UNIQUE (email)
);
CREATE INDEX IF NOT EXISTS idx_email ON public.accounts USING btree (email);
-- Table: public.public_posts
CREATE TABLE IF NOT EXISTS public.public_posts (
    post_id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1
    ),
    access_key VARCHAR(63),
    date_created TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    number_of_like INTEGER NOT NULL DEFAULT 0,
    post_content VARCHAR(2047) NOT NULL,
    post_description VARCHAR(255) NOT NULL,
    post_title VARCHAR(127) NOT NULL,
    server_random_salt BYTEA NOT NULL,
    user_id BIGINT,
    CONSTRAINT public_posts_pkey PRIMARY KEY (post_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.accounts (user_id) ON UPDATE CASCADE ON DELETE
    SET NULL
);
CREATE INDEX IF NOT EXISTS idx_date_created ON public.public_posts USING btree (date_created);
-- Table: public.account_saved_keys
CREATE TABLE IF NOT EXISTS public.account_saved_keys (
    access_key VARCHAR(63),
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    CONSTRAINT account_saved_keys_pkey PRIMARY KEY (post_id, user_id),
    CONSTRAINT fk_post FOREIGN KEY (post_id) REFERENCES public.public_posts (post_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_user_saved_keys FOREIGN KEY (user_id) REFERENCES public.accounts (user_id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- -- Create a user for backend server
-- CREATE USER admin WITH PASSWORD 'admin';
-- GRANT ALL PRIVILEGES ON DATABASE sealidea_db TO admin;
-- ALTER ROLE admin WITH SUPERUSER;