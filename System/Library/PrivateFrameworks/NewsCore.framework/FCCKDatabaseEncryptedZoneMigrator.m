@interface FCCKDatabaseEncryptedZoneMigrator
- (BOOL)databaseMigrationShouldDropRecord:(id)a3 database:(id)a4;
- (BOOL)databaseMigrationShouldMigrateEntireZone:(id)a3;
- (id)databaseMigrationMigrateRecord:(id)a3 database:(id)a4 error:(id *)a5;
- (id)databaseMigrationRecordNamesToMigrateInZone:(id)a3 fromVersion:(int64_t)a4 toVersion:(int64_t)a5;
- (id)databaseMigrationZoneNamesFromVersion:(int64_t)a3 toVersion:(int64_t)a4;
- (id)initWithSchema:(void *)a3 recordEncryptionMiddleware:(void *)a4 deprecatedBlock:;
@end

@implementation FCCKDatabaseEncryptedZoneMigrator

- (id)initWithSchema:(void *)a3 recordEncryptionMiddleware:(void *)a4 deprecatedBlock:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)FCCKDatabaseEncryptedZoneMigrator;
    v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      uint64_t v12 = [v10 copy];
      id v13 = a1[3];
      a1[3] = (id)v12;
    }
  }

  return a1;
}

- (id)databaseMigrationZoneNamesFromVersion:(int64_t)a3 toVersion:(int64_t)a4
{
  if (self) {
    self = (FCCKDatabaseEncryptedZoneMigrator *)self->_schema;
  }
  return -[FCCKPrivateDatabaseSchema zoneNamesWithChangesFromVersion:toVersion:](self, a3, a4);
}

- (BOOL)databaseMigrationShouldMigrateEntireZone:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F19D88]] ^ 1;
}

- (id)databaseMigrationRecordNamesToMigrateInZone:(id)a3 fromVersion:(int64_t)a4 toVersion:(int64_t)a5
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F19D88]])
  {
    if (self) {
      schema = self->_schema;
    }
    else {
      schema = 0;
    }
    id v9 = -[FCCKPrivateDatabaseSchema recordNamesInDefaultZoneChangedFromVersion:toVersion:](schema, a4, a5);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (BOOL)databaseMigrationShouldDropRecord:(id)a3 database:(id)a4
{
  id v5 = a3;
  if (self)
  {
    id v6 = self->_deprecatedBlock;
    if (v6)
    {
      v7 = v6;
      LOBYTE(self) = (*((uint64_t (**)(void))self->_deprecatedBlock + 2))();
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (id)databaseMigrationMigrateRecord:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self || !self->_recordEncryptionMiddleware)
  {
    v26[1] = (id)MEMORY[0x1E4F143A8];
    v26[2] = (id)3221225472;
    v26[3] = __83__FCCKDatabaseEncryptedZoneMigrator_databaseMigrationMigrateRecord_database_error___block_invoke;
    v26[4] = &unk_1E5B5AE28;
    id v27 = v8;
    id v23 = v27;
    id v12 = v23;
    goto LABEL_11;
  }
  id v10 = v8;
  v11 = self->_schema;
  id v12 = v10;
  if (v9) {
    uint64_t v13 = v9[5];
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = -[FCCKPrivateDatabaseSchema mappingFromRecord:toVersion:]((FCCKRecordZoneIDMapping *)v11, v12, v13);

  int v15 = [v14 hasChanges];
  if (!v15)
  {
    id v23 = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v16 = (void *)MEMORY[0x1A6260FD0]();
  recordEncryptionMiddleware = self->_recordEncryptionMiddleware;
  v26[0] = 0;
  v18 = recordEncryptionMiddleware;
  v19 = [(FCCKDatabaseRecordMiddleware *)v18 serverToClientRecord:v12 inDatabase:v9 error:v26];
  id v20 = v26[0];

  v21 = self->_recordEncryptionMiddleware;
  id v25 = v20;
  v22 = v21;
  id v12 = [(FCCKDatabaseRecordMiddleware *)v22 clientToServerRecord:v19 inDatabase:v9 error:&v25];
  id v23 = v25;

  if (a5)
  {
LABEL_10:
    id v23 = v23;
    *a5 = v23;
  }
LABEL_11:

  return v12;
}

id __83__FCCKDatabaseEncryptedZoneMigrator_databaseMigrationMigrateRecord_database_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deprecatedBlock, 0);
  objc_storeStrong((id *)&self->_recordEncryptionMiddleware, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end