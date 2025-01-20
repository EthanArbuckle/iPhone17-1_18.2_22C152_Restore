@interface MFPersistenceDatabase_iOS
+ (OS_os_log)log;
- (BOOL)_migrateWithDatabaseConnection:(id)a3 migrator:(id)a4;
- (BOOL)createdTempTable;
- (BOOL)enforceDataProtection;
- (BOOL)mailMessageLibraryMigrator:(id)a3 attachProtectedDatabaseWithName:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)migrationHasRun;
- (MFPersistenceDatabase_iOS)initWithBasePath:(id)a3 databaseName:(id)a4 maxConcurrentReaders:(unint64_t)a5 schema:(id)a6 protectedSchema:(id)a7 propertyMapper:(id)a8 protectedDatabasePersistence:(id)a9;
- (NSMutableArray)postMigrationSteps;
- (id)checkOutConnectionIsWriter:(BOOL)a3;
- (id)migrationLock;
- (id)openConnectionIsWriter:(BOOL)a3;
- (void)addPostMigrationStep:(Class)a3;
- (void)checkInConnection:(id)a3;
- (void)handleExceptionCreatingConnection:(id)a3;
- (void)mailMessageLibraryMigrator:(id)a3 detachProtectedDatabaseWithConnection:(id)a4;
- (void)mailMessageLibraryMigrator:(id)a3 isInitializingDatabaseWithConnection:(id)a4;
- (void)mailMessageLibraryMigratorScheduleSpotlightReindex:(id)a3;
- (void)setCreatedTempTable:(BOOL)a3;
- (void)setMigrationHasRun:(BOOL)a3;
- (void)setPostMigrationSteps:(id)a3;
@end

@implementation MFPersistenceDatabase_iOS

- (BOOL)enforceDataProtection
{
  return 1;
}

- (void)checkInConnection:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFPersistenceDatabase_iOS.m" lineNumber:60 description:@"Got wrong type of connection"];
  }
  ECEndDisallowingNetworkActivity();
  v7.receiver = self;
  v7.super_class = (Class)MFPersistenceDatabase_iOS;
  [(EDPersistenceDatabase *)&v7 checkInConnection:v5];
}

- (id)checkOutConnectionIsWriter:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[MFMailMessageLibrary canUsePersistence])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MFPersistenceDatabase_iOS.m" lineNumber:47 description:@"Trying to access the database in MobileMail"];
  }
  v11.receiver = self;
  v11.super_class = (Class)MFPersistenceDatabase_iOS;
  v6 = [(EDPersistenceDatabase *)&v11 checkOutConnectionIsWriter:v3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MFPersistenceDatabase_iOS.m" lineNumber:50 description:@"Got wrong type of connection"];
  }
  ECBeginDisallowingNetworkActivity();
  objc_super v7 = +[MFMailMessageLibrary defaultInstance];
  [v7 reloadMailboxCacheIfNecessaryWithConnection:v6];

  return v6;
}

- (id)openConnectionIsWriter:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MFPersistenceDatabaseConnection_iOS alloc];
  v6 = [(EDPersistenceDatabase *)self basePath];
  objc_super v7 = [(EDPersistenceDatabase *)self databaseName];
  v8 = [(EDPersistenceDatabaseConnection *)v5 initWithBasePath:v6 databaseName:v7 isWriter:v3 delegate:self];

  [(EDPersistenceDatabaseConnection *)v8 open];
  v9 = [(MFPersistenceDatabase_iOS *)self migrationLock];
  objc_sync_enter(v9);
  if (![(MFPersistenceDatabase_iOS *)self migrationHasRun])
  {
    v10 = [[MFMailMessageLibraryMigrator alloc] initWithDelegate:self];
    if (![(EDPersistenceDatabaseConnection *)v8 isValid]
      || ![(MFPersistenceDatabase_iOS *)self _migrateWithDatabaseConnection:v8 migrator:v10])
    {
      [(EDPersistenceDatabaseConnection *)v8 close];

      objc_super v11 = +[MFMailMessageLibrary defaultInstance];
      [v11 handleFailedMigration];

      v8 = 0;
    }
    [(MFPersistenceDatabase_iOS *)self setMigrationHasRun:1];
  }
  if (![(MFPersistenceDatabase_iOS *)self createdTempTable] && v3)
  {
    sqlite3_exec([(EDPersistenceDatabaseConnection *)v8 sqlDB], "CREATE TEMPORARY TABLE temp_selected_messages (message_id INTEGER);",
      0,
      0,
      0);
    [(MFPersistenceDatabase_iOS *)self setCreatedTempTable:1];
  }
  objc_sync_exit(v9);

  return v8;
}

- (id)migrationLock
{
  return self->_migrationLock;
}

- (BOOL)migrationHasRun
{
  return self->_migrationHasRun;
}

- (BOOL)createdTempTable
{
  return self->_createdTempTable;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MFPersistenceDatabase_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_28 != -1) {
    dispatch_once(&log_onceToken_28, block);
  }
  v2 = (void *)log_log_28;
  return (OS_os_log *)v2;
}

- (MFPersistenceDatabase_iOS)initWithBasePath:(id)a3 databaseName:(id)a4 maxConcurrentReaders:(unint64_t)a5 schema:(id)a6 protectedSchema:(id)a7 propertyMapper:(id)a8 protectedDatabasePersistence:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MFPersistenceDatabase_iOS;
  v21 = [(EDPersistenceDatabase *)&v27 initWithBasePath:v15 databaseName:v16 maxConcurrentReaders:a5 schema:v17 protectedSchema:v18 propertyMapper:v19 protectedDatabasePersistence:v20];
  if (v21)
  {
    uint64_t v22 = objc_opt_new();
    id migrationLock = v21->_migrationLock;
    v21->_id migrationLock = (id)v22;

    uint64_t v24 = objc_opt_new();
    postMigrationSteps = v21->_postMigrationSteps;
    v21->_postMigrationSteps = (NSMutableArray *)v24;
  }
  return v21;
}

- (BOOL)_migrateWithDatabaseConnection:(id)a3 migrator:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(EDPersistenceDatabase *)self schema];
  int v9 = [v7 migrateWithDatabaseConnection:v6 schema:v8];

  if (v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = [(MFPersistenceDatabase_iOS *)self postMigrationSteps];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          int v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) runWithConnection:v6];
        }
        int v15 = v14;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
      LOBYTE(v9) = v15 == 0;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)addPostMigrationStep:(Class)a3
{
  id v4 = [(MFPersistenceDatabase_iOS *)self postMigrationSteps];
  [v4 addObject:a3];
}

- (void)handleExceptionCreatingConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFPersistenceDatabase_iOS;
  [(EDPersistenceDatabase *)&v5 handleExceptionCreatingConnection:v4];
  memset(__b, 170, sizeof(__b));
  __b[8] = 0;
  *(void *)v8 = 0xE00000001;
  int v9 = 1;
  pid_t v10 = getpid();
  size_t v6 = 648;
  if (!sysctl(v8, 4u, __b, &v6, 0, 0) && (__b[8] & 0x800) != 0) {
    __debugbreak();
  }
}

- (BOOL)mailMessageLibraryMigrator:(id)a3 attachProtectedDatabaseWithName:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(EDPersistenceDatabase *)self urlFileProtectionTypeForDatabaseType:1];
  if ([v11 isEqualToString:*MEMORY[0x1E4F1C570]])
  {
    id v12 = (id)*MEMORY[0x1E4F1C578];

    uint64_t v11 = v12;
  }
  v13 = [(EDPersistenceDatabase *)self protectedDatabasePath];
  int v14 = [(EDPersistenceDatabase *)self urlForDatabasePath:v13 type:1 fileProtection:v11];

  char v15 = [v10 attachProtectedDatabaseWithName:v9 url:v14 error:a6];
  return v15;
}

- (void)mailMessageLibraryMigrator:(id)a3 detachProtectedDatabaseWithConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a4, "detachProtectedDatabase", a3);
  objc_super v5 = [(EDPersistenceDatabase *)self urlFileProtectionTypeForDatabaseType:1];
  if (v5)
  {
    size_t v6 = [(EDPersistenceDatabase *)self protectedDatabasePath];
    id v7 = [(EDPersistenceDatabase *)self urlForDatabasePath:v6 type:1];

    id v16 = 0;
    char v8 = [MEMORY[0x1E4F60E90] setFileProtection:v5 forDatabaseAtURL:v7 error:&v16];
    id v9 = v16;
    id v10 = v9;
    if (v8)
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v11 = [v9 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F60D10]])
    {
      BOOL v12 = [v10 code] == 23;

      if (v12)
      {
        v13 = +[MFPersistenceDatabase_iOS log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v14 = objc_msgSend(v10, "ef_publicDescription");
          *(_DWORD *)buf = 138543362;
          long long v18 = v14;
          _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_INFO, "Couldn't reset file protection of protected database. The device is probably locked. %{public}@", buf, 0xCu);
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    v13 = +[MFPersistenceDatabase_iOS log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v15 = objc_msgSend(v10, "ef_publicDescription");
      -[MFPersistenceDatabase_iOS mailMessageLibraryMigrator:detachProtectedDatabaseWithConnection:](v15, buf, v13);
    }
    goto LABEL_10;
  }
LABEL_12:
}

- (void)mailMessageLibraryMigrator:(id)a3 isInitializingDatabaseWithConnection:(id)a4
{
  id v6 = a4;
  id v4 = +[MFMailMessageLibrary defaultInstance];
  objc_super v5 = [v4 hookRegistry];
  [v5 persistenceIsInitializingDatabaseWithConnection:v6];
}

- (void)mailMessageLibraryMigratorScheduleSpotlightReindex:(id)a3
{
  id v5 = +[MFMailMessageLibrary defaultInstance];
  BOOL v3 = [v5 persistence];
  id v4 = [v3 searchableIndexManager];
  [v4 setNeedsToRedonate];
}

- (void)setMigrationHasRun:(BOOL)a3
{
  self->_migrationHasRun = a3;
}

- (void)setCreatedTempTable:(BOOL)a3
{
  self->_createdTempTable = a3;
}

- (NSMutableArray)postMigrationSteps
{
  return self->_postMigrationSteps;
}

- (void)setPostMigrationSteps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postMigrationSteps, 0);
  objc_storeStrong(&self->_migrationLock, 0);
}

- (void)mailMessageLibraryMigrator:(os_log_t)log detachProtectedDatabaseWithConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to reset file protection of protected database: %{public}@", buf, 0xCu);
}

@end