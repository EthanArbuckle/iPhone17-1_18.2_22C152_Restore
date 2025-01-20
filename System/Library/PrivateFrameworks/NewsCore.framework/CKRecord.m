@interface CKRecord
+ (id)secureSentinelRecordWithEncryptionKey:(uint64_t)a1;
- (id)fc_secureSentinel_encryptionKey;
- (id)fc_sentinel_encryptionKey;
- (uint64_t)fc_sentinel_databaseVersion;
- (uint64_t)fc_sentinel_deletedToDatabaseVersion;
- (void)fc_sentinel_finishedDeletion;
- (void)fc_sentinel_finishedDeletionToVersion;
- (void)fc_sentinel_finishedMigration;
- (void)fc_sentinel_finishedMigrationToVersion;
- (void)fc_sentinel_finishedSubscriptionDeletion;
- (void)fc_sentinel_finishedSubscriptionMigration;
- (void)setFc_sentinel_databaseVersion:(void *)a1;
- (void)setFc_sentinel_deletedToDatabaseVersion:(void *)a1;
- (void)setFc_sentinel_encryptionKey:(void *)a1;
- (void)setFc_sentinel_finishedDeletion:(void *)a1;
- (void)setFc_sentinel_finishedDeletionToVersion:(void *)a1;
- (void)setFc_sentinel_finishedMigration:(void *)a1;
- (void)setFc_sentinel_finishedMigrationToVersion:(void *)a1;
- (void)setFc_sentinel_finishedSubscriptionDeletion:(void *)a1;
- (void)setFc_sentinel_finishedSubscriptionMigration:(void *)a1;
- (void)setFc_sentinel_version:(void *)a1;
@end

@implementation CKRecord

- (id)fc_sentinel_encryptionKey
{
  if (a1)
  {
    v1 = [a1 encryptedValuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"encryptionKey"];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setFc_sentinel_encryptionKey:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [a1 encryptedValuesByKey];
    [v4 setObject:v3 forKeyedSubscript:@"encryptionKey"];
  }
}

- (void)fc_sentinel_finishedMigration
{
  if (result)
  {
    v1 = [result valuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"migratedUnencryptedData"];
    uint64_t v3 = [v2 BOOLValue];

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedMigration:(void *)a1
{
  if (a1 && -[CKRecord fc_sentinel_finishedMigration](a1) != a2)
  {
    id v5 = [NSNumber numberWithBool:a2];
    id v4 = [a1 valuesByKey];
    [v4 setObject:v5 forKeyedSubscript:@"migratedUnencryptedData"];
  }
}

- (void)fc_sentinel_finishedDeletion
{
  if (result)
  {
    v1 = [result valuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"deletedUnencryptedData"];
    uint64_t v3 = [v2 BOOLValue];

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedDeletion:(void *)a1
{
  if (a1 && -[CKRecord fc_sentinel_finishedDeletion](a1) != a2)
  {
    id v5 = [NSNumber numberWithBool:a2];
    id v4 = [a1 valuesByKey];
    [v4 setObject:v5 forKeyedSubscript:@"deletedUnencryptedData"];
  }
}

- (void)fc_sentinel_finishedSubscriptionMigration
{
  if (result)
  {
    v1 = [result valuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"migratedSubscriptions"];
    uint64_t v3 = [v2 BOOLValue];

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedSubscriptionMigration:(void *)a1
{
  if (a1 && -[CKRecord fc_sentinel_finishedSubscriptionMigration](a1) != a2)
  {
    id v5 = [NSNumber numberWithBool:a2];
    id v4 = [a1 valuesByKey];
    [v4 setObject:v5 forKeyedSubscript:@"migratedSubscriptions"];
  }
}

- (void)fc_sentinel_finishedSubscriptionDeletion
{
  if (result)
  {
    v1 = [result valuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"deletedSubscriptions"];
    uint64_t v3 = [v2 BOOLValue];

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedSubscriptionDeletion:(void *)a1
{
  if (a1 && -[CKRecord fc_sentinel_finishedSubscriptionDeletion](a1) != a2)
  {
    id v5 = [NSNumber numberWithBool:a2];
    id v4 = [a1 valuesByKey];
    [v4 setObject:v5 forKeyedSubscript:@"deletedSubscriptions"];
  }
}

- (void)fc_sentinel_finishedMigrationToVersion
{
  if (result)
  {
    v1 = [result encryptedValuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"migratedToVersion"];
    uint64_t v3 = [v2 unsignedIntegerValue];

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedMigrationToVersion:(void *)a1
{
  if (a1 && -[CKRecord fc_sentinel_finishedMigrationToVersion](a1) != a2)
  {
    id v5 = [NSNumber numberWithInteger:a2];
    id v4 = [a1 encryptedValuesByKey];
    [v4 setObject:v5 forKeyedSubscript:@"migratedToVersion"];
  }
}

- (void)fc_sentinel_finishedDeletionToVersion
{
  if (result)
  {
    v1 = [result encryptedValuesByKey];
    v2 = [v1 objectForKeyedSubscript:@"deletedToVersion"];
    uint64_t v3 = [v2 integerValue];

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedDeletionToVersion:(void *)a1
{
  if (a1 && -[CKRecord fc_sentinel_finishedDeletionToVersion](a1) != a2)
  {
    id v5 = [NSNumber numberWithInteger:a2];
    id v4 = [a1 encryptedValuesByKey];
    [v4 setObject:v5 forKeyedSubscript:@"deletedToVersion"];
  }
}

- (void)setFc_sentinel_version:(void *)a1
{
  if (a1)
  {
    id v4 = [a1 valuesByKey];
    id v5 = [v4 objectForKeyedSubscript:@"version"];
    uint64_t v6 = [v5 integerValue];

    if (v6 != a2)
    {
      id v8 = [NSNumber numberWithUnsignedInteger:a2];
      v7 = [a1 valuesByKey];
      [v7 setObject:v8 forKeyedSubscript:@"version"];
    }
  }
}

+ (id)secureSentinelRecordWithEncryptionKey:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v4 = +[CKRecordID fc_staticSecureSentinelRecordID]();
  id v5 = (void *)[v3 initWithRecordType:@"SentinelSecure" recordID:v4];

  if (v5)
  {
    id v6 = v2;
    v7 = [v5 encryptedValuesByKey];
    [v7 setObject:v6 forKeyedSubscript:@"encryptionKey"];

    id v8 = [v5 valuesByKey];
    v9 = [v8 objectForKeyedSubscript:@"version"];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if (v10 == 1) {
      goto LABEL_5;
    }
    id v2 = [NSNumber numberWithUnsignedInteger:1];
    v11 = [v5 valuesByKey];
    [v11 setObject:v2 forKeyedSubscript:@"version"];
  }
LABEL_5:
  return v5;
}

- (id)fc_secureSentinel_encryptionKey
{
  if (a1)
  {
    v1 = [a1 encryptedValuesByKey];
    id v2 = [v1 objectForKeyedSubscript:@"encryptionKey"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (uint64_t)fc_sentinel_databaseVersion
{
  if (result)
  {
    v1 = (void *)result;
    if (-[CKRecord fc_sentinel_finishedMigrationToVersion]((void *)result))
    {
      return (uint64_t)-[CKRecord fc_sentinel_finishedMigrationToVersion](v1);
    }
    else if (-[CKRecord fc_sentinel_finishedSubscriptionMigration](v1))
    {
      return 2;
    }
    else
    {
      return -[CKRecord fc_sentinel_finishedMigration](v1);
    }
  }
  return result;
}

- (void)setFc_sentinel_databaseVersion:(void *)a1
{
  if (a1)
  {
    -[CKRecord setFc_sentinel_finishedMigrationToVersion:](a1, (void *)a2);
    if (a2 <= 3)
    {
      -[CKRecord setFc_sentinel_finishedMigration:](a1, (0xEu >> (a2 & 0xF)) & 1);
      -[CKRecord setFc_sentinel_finishedSubscriptionMigration:](a1, (0xCu >> (a2 & 0xF)) & 1);
    }
  }
}

- (uint64_t)fc_sentinel_deletedToDatabaseVersion
{
  if (result)
  {
    v1 = (void *)result;
    if (-[CKRecord fc_sentinel_finishedDeletionToVersion]((void *)result))
    {
      return (uint64_t)-[CKRecord fc_sentinel_finishedDeletionToVersion](v1);
    }
    else if (-[CKRecord fc_sentinel_finishedSubscriptionDeletion](v1))
    {
      return 2;
    }
    else
    {
      return -[CKRecord fc_sentinel_finishedDeletion](v1);
    }
  }
  return result;
}

- (void)setFc_sentinel_deletedToDatabaseVersion:(void *)a1
{
  if (a1)
  {
    -[CKRecord setFc_sentinel_finishedDeletionToVersion:](a1, (void *)a2);
    if (a2 <= 3)
    {
      -[CKRecord setFc_sentinel_finishedDeletion:](a1, (0xEu >> (a2 & 0xF)) & 1);
      -[CKRecord setFc_sentinel_finishedSubscriptionDeletion:](a1, (0xCu >> (a2 & 0xF)) & 1);
    }
  }
}

@end