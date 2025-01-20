@interface SFExternalCredentialIdentityStore
- (BOOL)_fetchStoreIsEmpty;
- (SFExternalCredentialIdentityStore)initWithURL:(id)a3;
- (SFExternalCredentialIdentityStore)initWithURL:(id)a3 protectionType:(int64_t)a4;
- (id)_credentialIdentityFromRow:(id)a3;
- (id)_fetchCredentialIdentities;
- (id)_fetchCredentialIdentitiesMatchingDomains:(id)a3 credentialIdentityType:(id)a4;
- (id)_fetchCredentialIdentitiesWithType:(int64_t)a3;
- (int)_createFreshDatabaseSchema;
- (int)_currentSchemaVersion;
- (int)_insertCredentialIdentity:(id)a3;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_removeAllCredentialIdentities;
- (int)_removeCredentialIdentities:(id)a3;
- (int)_removeCredentialIdentity:(id)a3;
- (int)_saveCredentialIdentities:(id)a3;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (int)_updateCredentialIdentity:(id)a3;
- (int)_vacuum;
- (int64_t)_rowIDOfCredentialIdentityIfExists:(id)a3;
- (void)_databaseWillClose;
- (void)_removeAllCredentialIdentities;
- (void)_vacuum;
- (void)fetchAllPasskeyCredentialIdentitiesWithCompletion:(id)a3;
- (void)fetchCredentialIdentitiesWithCompletion:(id)a3;
- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchPasskeyCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchStoreEmptyStateWithCompletion:(id)a3;
- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 lockingPolicy:(int64_t)a6 completionHandler:(id)a7;
- (void)removeAllCredentialIdentitiesWithCompletion:(id)a3;
- (void)removeCredentialIdentities:(id)a3 completion:(id)a4;
- (void)replaceCredentialIdentitiesWithIdentities:(id)a3 completion:(id)a4;
- (void)saveCredentialIdentities:(id)a3 completion:(id)a4;
@end

@implementation SFExternalCredentialIdentityStore

- (SFExternalCredentialIdentityStore)initWithURL:(id)a3
{
  return [(SFExternalCredentialIdentityStore *)self initWithURL:a3 protectionType:2];
}

- (SFExternalCredentialIdentityStore)initWithURL:(id)a3 protectionType:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFExternalCredentialIdentityStore;
  id v7 = [(WBSSQLiteStore *)&v18 initWithURL:v6 protectionType:a4];
  if (v7)
  {
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [v8 stringWithFormat:@"com.apple.SafariFoundation.%@.%p", v10, v7];
    v12 = (const char *)[v11 UTF8String];
    v13 = [v7 databaseQueue];
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2(v12, 0, v13);
    v15 = (void *)*((void *)v7 + 9);
    *((void *)v7 + 9) = v14;

    dispatch_suspend(*((dispatch_object_t *)v7 + 9));
    id v16 = v7;
  }

  return (SFExternalCredentialIdentityStore *)v7;
}

- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 lockingPolicy:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke;
  v15[3] = &unk_264390DB0;
  v15[4] = self;
  id v16 = v12;
  v14.receiver = self;
  v14.super_class = (Class)SFExternalCredentialIdentityStore;
  id v13 = v12;
  [(WBSSQLiteStore *)&v14 openAndCheckIntegrity:v10 createIfNeeded:v9 fallBackToMemoryStoreIfError:v8 lockingPolicy:a6 completionHandler:v15];
}

void __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) databaseQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2;
  block[3] = &unk_264390D88;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v9 = a2;
  block[4] = v5;
  id v8 = v6;
  dispatch_async(v4, block);
}

uint64_t __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 48);
  if (*(void *)(a1 + 48))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2_cold_1(v2, v3);
    }
  }
  else
  {
    v4 = [*(id *)(a1 + 32) database];
    uint64_t v5 = (sqlite3 *)[v4 handle];

    if (v5) {
      sqlite3_create_function_v2(v5, "sf_identity_matches_domains", 3, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))credentialIdentityMatchesDomains, 0, 0, 0);
    }
    id v6 = objc_alloc(MEMORY[0x263F66378]);
    id v7 = [*(id *)(a1 + 32) database];
    uint64_t v8 = [v6 initWithDatabase:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, *v2);
  }
  return result;
}

- (void)_databaseWillClose
{
  [(WBSSQLiteStatementCache *)self->_statements invalidate];
  statements = self->_statements;
  self->_statements = 0;
}

- (int)_createFreshDatabaseSchema
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 1;
  v2 = [(WBSSQLiteStore *)self database];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke;
  v6[3] = &unk_264390DD8;
  id v7 = v2;
  uint64_t v8 = &v9;
  id v3 = v2;
  [v3 tryToPerformTransactionInBlock:v6];
  int v4 = *((_DWORD *)v10 + 6);

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  v6[3] = *MEMORY[0x263EF8340];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(a1 + 32), 0, @"CREATE TABLE credential_identities (id INTEGER PRIMARY KEY AUTOINCREMENT,identity_type INTEGER DEFAULT 0,service_id TEXT NOT NULL,service_id_type INTEGER NOT NULL DEFAULT 0,external_record_id TEXT DEFAULT NULL,user TEXT DEFAULT NULL,rank INTEGER NOT NULL DEFAULT 0,UNIQUE(service_id, service_id_type, external_record_id, user, identity_type) ON CONFLICT REPLACE)");
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 101)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(a1 + 32), 0, @"CREATE INDEX credential_identities__service_id ON credential_identities (service_id)");
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 101) {
      return 1;
    }
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) lastErrorMessage];
      __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_1(v5, (uint64_t)v6);
    }
  }
  else
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = [*(id *)(a1 + 32) lastErrorMessage];
      __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_2(v4, (uint64_t)v6);
    }
  }

  return 0;
}

- (int)_currentSchemaVersion
{
  return 3;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(WBSSQLiteStore *)self database];
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"BEGIN TRANSACTION");

  if (v6 == 101)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke;
    v12[3] = &unk_264390E00;
    v12[4] = self;
    id v7 = (void (**)(void))MEMORY[0x21D47DB00](v12);
    if (v3 != 3 && v3 != 2
      || (int v6 = [(SFExternalCredentialIdentityStore *)self _migrateToSchemaVersion], v6 == 101))
    {
      if ([(SFExternalCredentialIdentityStore *)self _setDatabaseSchemaVersion:v3] != 101)
      {
        v7[2](v7);
        int v6 = 101;
        goto LABEL_15;
      }
      uint64_t v9 = [(WBSSQLiteStore *)self database];
      int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v9, 0, @"COMMIT TRANSACTION");

      if (v6 == 101)
      {
LABEL_15:

        return v6;
      }
      BOOL v10 = WBS_LOG_CHANNEL_PREFIXCredentials();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SFExternalCredentialIdentityStore _migrateToSchemaVersion:](v3, v10);
      }
    }
    v7[2](v7);
    goto LABEL_15;
  }
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SFExternalCredentialIdentityStore _migrateToSchemaVersion:](v8);
  }
  return v6;
}

void __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) database];
  int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v1, 0, @"ROLLBACK TRANSACTION");

  if (v2 != 101)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke_cold_1(v3);
    }
  }
}

- (int)_migrateToSchemaVersion_2
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"ALTER TABLE credential_identities ADD COLUMN credential_id TEXT DEFAULT NULL");

  if (v4 != 101)
  {
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = [(WBSSQLiteStore *)self database];
      uint64_t v11 = [v10 lastErrorMessage];
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_error_impl(&dword_218FBF000, v6, OS_LOG_TYPE_ERROR, "Failed to add credential_id column to credential_identities table: %{public}@ (%d)", (uint8_t *)&v12, 0x12u);
    }
    goto LABEL_7;
  }
  uint64_t v5 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, @"ALTER TABLE credential_identities ADD COLUMN user_handle TEXT DEFAULT NULL");

  if (v4 != 101)
  {
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(WBSSQLiteStore *)self database];
      uint64_t v8 = [v7 lastErrorMessage];
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_error_impl(&dword_218FBF000, v6, OS_LOG_TYPE_ERROR, "Failed to add user_handle column to credential_identities table: %{public}@ (%d)", (uint8_t *)&v12, 0x12u);
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::WBSSQLiteDatabaseFetch<>(v3, @"SELECT * FROM credential_identities");

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v5) {
    goto LABEL_33;
  }
  uint64_t v6 = *(void *)v45;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v45 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v44 + 1) + 8 * v7);
      uint64_t v43 = 0;
      uint64_t v43 = [v8 int64AtIndex:0];
      uint64_t v9 = [v8 int64AtIndex:1];
      BOOL v10 = [v8 stringAtIndex:2];
      uint64_t v41 = 0;
      id v42 = v10;
      uint64_t v41 = [v8 int64AtIndex:3];
      id v40 = [v8 stringAtIndex:4];
      uint64_t v11 = [v8 stringAtIndex:5];
      uint64_t v38 = 0;
      id v39 = v11;
      uint64_t v38 = [v8 int64AtIndex:6];
      id v37 = [v8 stringAtIndex:7];
      id v36 = [v8 stringAtIndex:8];
      if (!v9)
      {
        v20 = objc_msgSend(v42, "safari_bestURLForUserTypedString");
        if (v20)
        {
          BOOL v21 = [v39 length] == 0;

          if (!v21)
          {
            id v22 = [(WBSSQLiteStore *)self database];
            id v23 = objc_alloc(MEMORY[0x263F66370]);
            *(void *)buf = 0;
            v24 = (void *)[v23 initWithDatabase:v22, @"UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ? WHERE id = ?", buf query error];
            id v25 = *(id *)buf;
            v26 = v25;
            if (v24)
            {
              id v27 = v24;
              [v27 bindInt64:1 atParameterIndex:1];
              SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(v27, &v42, &v41, &v40, &v39, &v38, &v43);

              uint64_t v19 = [v27 execute];
              [v27 invalidate];
              if ((v19 - 100) >= 2 && v19) {
                objc_msgSend(v22, "reportErrorWithCode:statement:error:", v19, objc_msgSend(v27, "handle"), 0);
              }
            }
            else
            {
              LODWORD(v19) = [v25 code];
            }

            if (v19 != 101)
            {
              v28 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                v31 = [(WBSSQLiteStore *)self database];
                v32 = [v31 lastErrorMessage];
                *(_DWORD *)buf = 138543362;
                *(void *)&buf[4] = v32;
                _os_log_error_impl(&dword_218FBF000, v28, OS_LOG_TYPE_ERROR, "Failed to recover a password identity with error: %{public}@", buf, 0xCu);
              }
LABEL_29:

              int v12 = 0;
              int v34 = v19;
              goto LABEL_30;
            }
          }
        }
      }
      int v12 = 1;
      if (v9 == 1 && v37 && v36)
      {
        id v13 = [(WBSSQLiteStore *)self database];
        id v14 = objc_alloc(MEMORY[0x263F66370]);
        *(void *)buf = 0;
        int v15 = (void *)[v14 initWithDatabase:v13, @"UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ?, credential_id = ?, user_handle = ? WHERE id = ?", buf query error];
        id v16 = *(id *)buf;
        v17 = v16;
        if (v15)
        {
          id v18 = v15;
          [v18 bindInt64:2 atParameterIndex:1];
          SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v18, &v42, &v41, &v40, &v39, &v38, &v37, &v36, &v43);

          uint64_t v19 = [v18 execute];
          [v18 invalidate];
          if ((v19 - 100) >= 2 && v19) {
            objc_msgSend(v13, "reportErrorWithCode:statement:error:", v19, objc_msgSend(v18, "handle"), 0);
          }
        }
        else
        {
          LODWORD(v19) = [v16 code];
        }

        if (v19 == 101)
        {
          int v12 = 1;
          goto LABEL_30;
        }
        v28 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = [(WBSSQLiteStore *)self database];
          v30 = [v29 lastErrorMessage];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v30;
          _os_log_error_impl(&dword_218FBF000, v28, OS_LOG_TYPE_ERROR, "Failed to recover a passkey identity with error: %{public}@", buf, 0xCu);
        }
        goto LABEL_29;
      }
LABEL_30:

      if (!v12) {
        goto LABEL_34;
      }
      ++v7;
    }
    while (v5 != v7);
    uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v5);
LABEL_33:
  int v34 = 101;
LABEL_34:

  return v34;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(WBSSQLiteStore *)self database];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", v3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, v6);

  if (v7 != 101)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = [(WBSSQLiteStore *)self database];
      uint64_t v11 = [v10 lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v13 = v3;
      __int16 v14 = 2114;
      int v15 = v11;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_error_impl(&dword_218FBF000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (void)saveCredentialIdentities:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke;
  block[3] = &unk_264390E50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  int v2 = [*(id *)(a1 + 32) database];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke_2;
  v6[3] = &unk_264390E28;
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(a1 + 40);
  uint64_t v8 = &v9;
  void v6[4] = v3;
  id v7 = v4;
  [v2 tryToPerformTransactionInBlock:v6];

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *((unsigned __int8 *)v10 + 24));
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _saveCredentialIdentities:*(void *)(a1 + 40)] == 101;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)replaceCredentialIdentitiesWithIdentities:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke;
  block[3] = &unk_264390E78;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int v2 = [*(id *)(a1 + 32) _removeAllCredentialIdentities];
  *((unsigned char *)v12 + 24) = v2 == 101;
  if (v2 == 101)
  {
    [*(id *)(a1 + 32) _vacuum];
    uint64_t v3 = [*(id *)(a1 + 32) database];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke_2;
    v8[3] = &unk_264390E28;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    id v10 = &v11;
    v8[4] = v4;
    id v9 = v5;
    [v3 tryToPerformTransactionInBlock:v8];

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, *((unsigned __int8 *)v12 + 24));
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _saveCredentialIdentities:*(void *)(a1 + 40)] == 101;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)removeAllCredentialIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__SFExternalCredentialIdentityStore_removeAllCredentialIdentitiesWithCompletion___block_invoke;
  v7[3] = &unk_264390EA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __81__SFExternalCredentialIdentityStore_removeAllCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _removeAllCredentialIdentities] == 101) {
    [*(id *)(a1 + 32) _vacuum];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeCredentialIdentities:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SFExternalCredentialIdentityStore_removeCredentialIdentities_completion___block_invoke;
  block[3] = &unk_264390E50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __75__SFExternalCredentialIdentityStore_removeCredentialIdentities_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeCredentialIdentities:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (int)_removeCredentialIdentities:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = -[SFExternalCredentialIdentityStore _removeCredentialIdentity:](self, "_removeCredentialIdentity:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v9 != 101)
          {
            id v10 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              [(WBSSQLiteStore *)self database];
              [(id)objc_claimAutoreleasedReturnValue() lastErrorMessage];
              objc_claimAutoreleasedReturnValue();
              -[SFExternalCredentialIdentityStore _removeCredentialIdentities:]();
            }

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int v9 = 101;
LABEL_14:
  }
  else
  {
    int v9 = 101;
  }

  return v9;
}

- (int)_removeCredentialIdentity:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"DELETE FROM credential_identities WHERE service_id = ? AND service_id_type = ? AND external_record_id = ? AND user = ? AND identity_type = ?" error:0];
    id v12 = [v4 serviceIdentifier];
    v13[0] = [v4 serviceIdentifierType];
    id v11 = [v4 externalRecordIdentifier];
    id v10 = [v4 user];
    uint64_t v9 = [v4 type];
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v5, &v12, v13, &v11, &v10, &v9);

    int v6 = [v5 execute];
    if (v6 != 101)
    {
      uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteStore *)self database];
        [(id)objc_claimAutoreleasedReturnValue() lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[SFExternalCredentialIdentityStore _removeCredentialIdentity:]();
      }
    }
    [v5 reset];
  }
  else
  {
    int v6 = 101;
  }

  return v6;
}

- (int)_removeAllCredentialIdentities
{
  uint64_t v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"DELETE FROM credential_identities");

  if (v4 != 101)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteStore *)self database];
      [(id)objc_claimAutoreleasedReturnValue() lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFExternalCredentialIdentityStore _removeAllCredentialIdentities]();
    }
  }
  return v4;
}

- (int)_vacuum
{
  uint64_t v3 = [(WBSSQLiteStore *)self database];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, @"VACUUM");
  if (v4 != 101)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteStore *)self database];
      [(id)objc_claimAutoreleasedReturnValue() lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFExternalCredentialIdentityStore _vacuum]();
    }
  }
  return v4;
}

- (int)_saveCredentialIdentities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v8, "rowIdentifier", (void)v13);
      if (v9 == -1) {
        uint64_t v9 = [(SFExternalCredentialIdentityStore *)self _rowIDOfCredentialIdentityIfExists:v8];
      }
      if (v9 == -1)
      {
        int v10 = [(SFExternalCredentialIdentityStore *)self _insertCredentialIdentity:v8];
      }
      else
      {
        objc_msgSend(v8, "setRowIdentifier:");
        int v10 = [(SFExternalCredentialIdentityStore *)self _updateCredentialIdentity:v8];
      }
      int v11 = v10;
      if (v10 != 101) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    int v11 = 101;
  }

  return v11;
}

- (int)_insertCredentialIdentity:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v24 = [v4 type];
  uint64_t v5 = &stru_26CA7A2D0;
  int v6 = 1;
  switch(v24)
  {
    case 0:
      goto LABEL_15;
    case 1:
    case 4:
      uint64_t v5 = @"INSERT INTO credential_identities (identity_type, service_id, service_id_type, external_record_id, user, rank) VALUES (?, ?, ?, ?, ?, ?)";
      goto LABEL_4;
    case 2:
      uint64_t v5 = @"INSERT INTO credential_identities (identity_type, service_id, service_id_type, external_record_id, user, rank, credential_id, user_handle) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      goto LABEL_4;
    default:
LABEL_4:
      uint64_t v7 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:v5 error:0];
      int v6 = 1;
      switch(v24)
      {
        case 0:
          goto LABEL_14;
        case 1:
          uint64_t v23 = [v4 serviceIdentifier];
          v25[0] = [v4 serviceIdentifierType];
          id v22 = [v4 externalRecordIdentifier];
          id v21 = [v4 user];
          uint64_t v20 = [v4 rank];
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v7, &v24, &v23, v25, &v22, &v21, &v20);

          id v8 = &v23;
          goto LABEL_8;
        case 2:
          uint64_t v19 = [v4 serviceIdentifier];
          v25[0] = [v4 serviceIdentifierType];
          id v18 = [v4 externalRecordIdentifier];
          id v17 = [v4 user];
          uint64_t v20 = [v4 rank];
          id v16 = [v4 credentialID];
          id v15 = [v4 userHandle];
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v7, &v24, &v19, v25, &v18, &v17, &v20, &v16, &v15);

          id v8 = &v19;
          goto LABEL_8;
        case 4:
          uint64_t v14 = [v4 serviceIdentifier];
          v25[0] = [v4 serviceIdentifierType];
          id v13 = [v4 externalRecordIdentifier];
          id v12 = [v4 user];
          uint64_t v20 = [v4 rank];
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v7, &v24, &v14, v25, &v13, &v12, &v20);

          id v8 = &v14;
LABEL_8:

          break;
        default:
          break;
      }
      int v6 = [v7 execute];
      if (v6 == 101)
      {
        uint64_t v9 = [(WBSSQLiteStore *)self database];
        objc_msgSend(v4, "setRowIdentifier:", objc_msgSend(v9, "lastInsertRowID"));

        [v7 reset];
        int v6 = 101;
      }
      else
      {
        int v10 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteStore *)self database];
          [(id)objc_claimAutoreleasedReturnValue() lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[SFExternalCredentialIdentityStore _insertCredentialIdentity:]();
        }

        [v7 reset];
      }
LABEL_14:

LABEL_15:
      return v6;
  }
}

- (int)_updateCredentialIdentity:(id)a3
{
  v24[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = 0;
  uint64_t v23 = [v4 type];
  int v6 = 1;
  switch(v23)
  {
    case 0:
      goto LABEL_11;
    case 1:
      uint64_t v5 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ? WHERE id = ?" error:0];
      uint64_t v22 = [v4 serviceIdentifier];
      v24[0] = [v4 serviceIdentifierType];
      id v21 = [v4 externalRecordIdentifier];
      id v20 = [v4 user];
      uint64_t v19 = [v4 rank];
      uint64_t v18 = [v4 rowIdentifier];
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v5, &v23, &v22, v24, &v21, &v20, &v19, &v18);

      id v7 = (id)v22;
      goto LABEL_5;
    case 2:
      id v7 = v4;
      uint64_t v5 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ?, credential_id = ?, user_handle = ? WHERE id = ?" error:0];
      id v17 = [v7 serviceIdentifier];
      v24[0] = [v7 serviceIdentifierType];
      id v16 = [v7 externalRecordIdentifier];
      id v15 = [v7 user];
      uint64_t v19 = [v7 rank];
      id v14 = [v7 credentialID];
      id v13 = [v7 userHandle];
      uint64_t v18 = [v7 rowIdentifier];
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v5, &v23, &v17, v24, &v16, &v15, &v19, &v14, &v13, &v18);

      goto LABEL_5;
    case 4:
      uint64_t v5 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ? WHERE id = ?" error:0];
      uint64_t v12 = [v4 serviceIdentifier];
      v24[0] = [v4 serviceIdentifierType];
      id v11 = [v4 externalRecordIdentifier];
      id v10 = [v4 user];
      uint64_t v19 = [v4 rank];
      uint64_t v18 = [v4 rowIdentifier];
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v5, &v23, &v12, v24, &v11, &v10, &v19, &v18);

      id v7 = (id)v12;
LABEL_5:

      break;
    default:
      break;
  }
  int v6 = [v5 execute];
  if (v6 == 101)
  {
    [v5 reset];
    int v6 = 101;
  }
  else
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteStore *)self database];
      [(id)objc_claimAutoreleasedReturnValue() lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFExternalCredentialIdentityStore _updateCredentialIdentity:]();
    }

    [v5 reset];
  }
LABEL_11:

  return v6;
}

- (void)fetchCredentialIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__SFExternalCredentialIdentityStore_fetchCredentialIdentitiesWithCompletion___block_invoke;
    v7[3] = &unk_264390EC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __77__SFExternalCredentialIdentityStore_fetchCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _fetchCredentialIdentities];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__SFExternalCredentialIdentityStore_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke;
    block[3] = &unk_264390EF0;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

void __97__SFExternalCredentialIdentityStore_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v1 = a1[6];
  uint64_t v3 = (void *)a1[4];
  id v5 = +[_SFCredentialIdentityTypeMatcher singleType:1];
  id v4 = objc_msgSend(v3, "_fetchCredentialIdentitiesMatchingDomains:credentialIdentityType:", v2);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

- (void)fetchPasskeyCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__SFExternalCredentialIdentityStore_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke;
    block[3] = &unk_264390EF0;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

void __96__SFExternalCredentialIdentityStore_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v1 = a1[6];
  uint64_t v3 = (void *)a1[4];
  id v5 = +[_SFCredentialIdentityTypeMatcher singleType:2];
  id v4 = objc_msgSend(v3, "_fetchCredentialIdentitiesMatchingDomains:credentialIdentityType:", v2);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

- (void)fetchAllPasskeyCredentialIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __87__SFExternalCredentialIdentityStore_fetchAllPasskeyCredentialIdentitiesWithCompletion___block_invoke;
    v7[3] = &unk_264390EC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __87__SFExternalCredentialIdentityStore_fetchAllPasskeyCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _fetchCredentialIdentitiesWithType:2];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__SFExternalCredentialIdentityStore_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke;
    block[3] = &unk_264390EF0;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

void __100__SFExternalCredentialIdentityStore_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v1 = a1[6];
  uint64_t v3 = (void *)a1[4];
  id v5 = +[_SFCredentialIdentityTypeMatcher singleType:4];
  id v4 = objc_msgSend(v3, "_fetchCredentialIdentitiesMatchingDomains:credentialIdentityType:", v2);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

- (id)_credentialIdentityFromRow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 int64AtIndex:0];
  id v5 = [v3 stringAtIndex:2];
  uint64_t v6 = [v3 int64AtIndex:3];
  id v7 = [v3 stringAtIndex:4];
  id v8 = [v3 stringAtIndex:5];
  uint64_t v9 = [v3 int64AtIndex:6];
  id v10 = [v3 stringAtIndex:7];
  id v11 = [v3 stringAtIndex:8];
  uint64_t v12 = [v3 int64AtIndex:1];
  switch(v12)
  {
    case 1:
      id v13 = off_264390380;
      goto LABEL_6;
    case 2:
      id v14 = [[SFPasskeyCredentialIdentity alloc] initWithRowIdentifier:v4 serviceIdentifier:v5 serviceIdentifierType:v6 externalRecordIdentifier:v7 user:v8 rank:v9 credentialID:v10 userHandle:v11];
      goto LABEL_8;
    case 4:
      id v13 = off_264390370;
LABEL_6:
      id v14 = (SFPasskeyCredentialIdentity *)[objc_alloc(*v13) initWithRowIdentifier:v4 serviceIdentifier:v5 serviceIdentifierType:v6 externalRecordIdentifier:v7 user:v8 rank:v9];
LABEL_8:
      id v15 = v14;
      goto LABEL_10;
  }
  id v15 = 0;
LABEL_10:

  return v15;
}

- (id)_fetchCredentialIdentitiesMatchingDomains:(id)a3 credentialIdentityType:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v33 = a4;
  v31 = v6;
  if ([v6 count])
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "safari_highLevelDomainFromHost");
          id v14 = (void *)v13;
          if (v13) {
            id v15 = (void *)v13;
          }
          else {
            id v15 = v12;
          }
          id v16 = v15;

          id v17 = [v16 lowercaseString];
          [v7 addObject:v17];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v9);
    }

    id v18 = objc_alloc(MEMORY[0x263F66370]);
    uint64_t v19 = [(WBSSQLiteStore *)self database];
    v32 = (void *)[v18 initWithDatabase:v19, @"SELECT * FROM credential_identities WHERE sf_identity_matches_domains(service_id, service_id_type, ?) == 1" query];

    sqlite3_bind_pointer((sqlite3_stmt *)[v32 handle], 1, v7, "domainSet", 0);
    v30 = [v32 fetch];
    id v20 = [MEMORY[0x263EFF980] array];
    char v21 = [v33 matchAllTypes];
    uint64_t v22 = [v33 typeToMatch];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v30;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v23);
          }
          id v27 = [(SFExternalCredentialIdentityStore *)self _credentialIdentityFromRow:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          v28 = v27;
          if (v27 && ((v21 & 1) != 0 || [v27 type] == v22)) {
            [v20 addObject:v28];
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v24);
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (int64_t)_rowIDOfCredentialIdentityIfExists:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F66370]);
  id v6 = [(WBSSQLiteStore *)self database];
  id v7 = (void *)[v5 initWithDatabase:v6 query:@"SELECT * FROM credential_identities WHERE service_id = ? AND service_id_type = ? AND user = ? AND identity_type = ?"];

  id v16 = [v4 serviceIdentifier];
  uint64_t v15 = [v4 serviceIdentifierType];
  id v14 = [v4 user];
  uint64_t v13 = [v4 type];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},long>(v7, &v16, &v15, &v14, &v13);

  id v8 = [v7 fetch];
  uint64_t v9 = [v8 nextObject];
  uint64_t v10 = v9;
  if (v9) {
    int64_t v11 = [v9 int64AtIndex:0];
  }
  else {
    int64_t v11 = -1;
  }

  return v11;
}

- (id)_fetchCredentialIdentities
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(WBSSQLiteStore *)self database];
  id v5 = SafariShared::WBSSQLiteDatabaseFetch<>(v4, @"SELECT * FROM credential_identities");

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = -[SFExternalCredentialIdentityStore _credentialIdentityFromRow:](self, "_credentialIdentityFromRow:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)_fetchCredentialIdentitiesWithType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = objc_alloc(MEMORY[0x263F66370]);
  uint64_t v7 = [(WBSSQLiteStore *)self database];
  uint64_t v8 = (void *)[v6 initWithDatabase:v7 query:@"SELECT * FROM credential_identities WHERE identity_type = ?"];

  [v8 bindInt64:a3 atParameterIndex:1];
  [v8 fetch];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = -[SFExternalCredentialIdentityStore _credentialIdentityFromRow:](self, "_credentialIdentityFromRow:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        long long v14 = v13;
        if (v13 && [v13 type] == a3) {
          [v5 addObject:v14];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)fetchStoreEmptyStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __72__SFExternalCredentialIdentityStore_fetchStoreEmptyStateWithCompletion___block_invoke;
    v7[3] = &unk_264390EC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __72__SFExternalCredentialIdentityStore_fetchStoreEmptyStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _fetchStoreIsEmpty];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (BOOL)_fetchStoreIsEmpty
{
  uint64_t v2 = [(WBSSQLiteStore *)self database];
  id v3 = SafariShared::WBSSQLiteDatabaseFetch<>(v2, @"SELECT EXISTS(SELECT 1 FROM credential_identities)");
  id v4 = [v3 nextObject];

  if (v4) {
    BOOL v5 = [v4 int64AtIndex:0] < 1;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statements, 0);
}

void __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Failed to open credential identities database with error %ld", (uint8_t *)&v3, 0xCu);
}

void __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_1(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_0((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v3, v4, "Failed to create index on identities table with error %{public}@", v5);
}

void __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_2(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_0((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v3, v4, "Failed to create identities table with error %{public}@", v5);
}

- (void)_migrateToSchemaVersion:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Failed to commit the transaction while migrating database to schema version %d", (uint8_t *)v2, 8u);
}

- (void)_migrateToSchemaVersion:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "Failed to start a transaction", v1, 2u);
}

void __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "Failed to roll back transaction", v1, 2u);
}

- (void)_removeCredentialIdentities:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v4, v5, "Failed to delete an entry from identities table with error %{public}@", v6);
}

- (void)_removeCredentialIdentity:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v4, v5, "Failed to delete an item from identities table with error %{public}@", v6);
}

- (void)_removeAllCredentialIdentities
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v4, v5, "Failed to delete entries from identities table with error %{public}@", v6);
}

- (void)_vacuum
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v4, v5, "Failed to vacuum identities table with error %{public}@", v6);
}

- (void)_insertCredentialIdentity:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v4, v5, "Failed to insert an item into identities table with error %{public}@", v6);
}

- (void)_updateCredentialIdentity:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_218FBF000, v4, v5, "Failed to update an item of identities table with error %{public}@", v6);
}

@end