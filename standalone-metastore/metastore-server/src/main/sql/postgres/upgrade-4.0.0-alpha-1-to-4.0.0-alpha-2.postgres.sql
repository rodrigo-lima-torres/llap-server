SELECT 'Upgrading MetaStore schema from 4.0.0-alpha-1 to 4.0.0-alpha-2';

-- HIVE-26280
ALTER TABLE "COMPLETED_COMPACTIONS" ADD "CC_NEXT_TXN_ID" bigint;
ALTER TABLE "COMPLETED_COMPACTIONS" ADD "CC_TXN_ID" bigint;
ALTER TABLE "COMPLETED_COMPACTIONS" ADD "CC_COMMIT_TIME" bigint;

-- HIVE-26324
ALTER TABLE "NOTIFICATION_SEQUENCE" ADD CONSTRAINT "ONE_ROW_CONSTRAINT" CHECK ("NNI_ID" = 1);

-- These lines need to be last. Insert any changes above.
UPDATE "VERSION" SET "SCHEMA_VERSION"='4.0.0-alpha-2', "VERSION_COMMENT"='Hive release version 4.0.0-alpha-2' where "VER_ID"=1;
SELECT 'Finished upgrading MetaStore schema from 4.0.0-alpha-1 to 4.0.0-alpha-2';
