--! Previous: sha1:ac06834674084dc237f4ac9168dfc87d7e85931c
--! Hash: sha1:3b8b51c55efc545e42e1c0400f12685733aff4b3
--! Message: add-tables-for-channels

DROP TABLE IF EXISTS app_public.channel CASCADE;
CREATE TABLE app_public.channel(
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  dash_stream_url TEXT,
  hls_stream_url TEXT,
  key_id TEXT
);

DROP TABLE IF EXISTS app_public.channel_images CASCADE;
CREATE TABLE app_public.channel_images(
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  channel_id TEXT REFERENCES channel ON DELETE CASCADE,
  type TEXT,
  path TEXT,
  width INTEGER,
  height INTEGER
);
CREATE INDEX ON app_public.channel_images (channel_id);

GRANT SELECT, INSERT, UPDATE, DELETE ON
  app_public.channel,
  app_public.channel_images TO ":DATABASE_GQL_ROLE";
