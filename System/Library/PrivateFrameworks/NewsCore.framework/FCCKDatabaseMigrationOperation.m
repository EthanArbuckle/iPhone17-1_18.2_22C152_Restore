@interface FCCKDatabaseMigrationOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)validateOperation;
- (void)_migrateZoneIDs:(void *)a3 completion:;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setDatabase:(uint64_t)a1;
- (void)setMigrator:(uint64_t)a1;
@end

@implementation FCCKDatabaseMigrationOperation

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self && self->_database)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)[[NSString alloc] initWithFormat:@"can't migrate without a database"];
      int v8 = 136315906;
      v9 = "-[FCCKDatabaseMigrationOperation validateOperation]";
      __int16 v10 = 2080;
      v11 = "FCCKDatabaseMigrationOperation.m";
      __int16 v12 = 1024;
      int v13 = 35;
      __int16 v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
    char v3 = 0;
    if (!self) {
      goto LABEL_9;
    }
  }
  if (self->_migrator)
  {
    char v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"can't migrate without a migrator"];
    int v8 = 136315906;
    v9 = "-[FCCKDatabaseMigrationOperation validateOperation]";
    __int16 v10 = 2080;
    v11 = "FCCKDatabaseMigrationOperation.m";
    __int16 v12 = 1024;
    int v13 = 39;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  char v4 = 0;
  return v4 & v3;
}

- (void)prepareOperation
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, v3);
  }

  char v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = v4;
  if (self)
  {
    v6 = v4;
    objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, v4);
    v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)performOperation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    char v3 = self->_database;
    migrator = self->_migrator;
  }
  else
  {
    char v3 = 0;
    migrator = 0;
  }
  v5 = migrator;
  v6 = FCCKDatabaseZoneIDsToMigrate(v3, v5);

  v7 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v10 = v6;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Migration: Performing Migration {zones: %{public}@}", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__FCCKDatabaseMigrationOperation_performOperation__block_invoke;
  v8[3] = &unk_1E5B4FD28;
  v8[4] = self;
  -[FCCKDatabaseMigrationOperation _migrateZoneIDs:completion:]((void **)&self->super.super.super.isa, v6, v8);
}

uint64_t __50__FCCKDatabaseMigrationOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)_migrateZoneIDs:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 count])
    {
      v7 = [v5 firstObject];
      int v8 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__FCCKDatabaseMigrationOperation__migrateZoneIDs_completion___block_invoke;
      v19[3] = &unk_1E5B55918;
      v19[4] = a1;
      id v20 = v8;
      id v21 = v6;
      id v9 = v8;
      __int16 v10 = v19;
      id v11 = v7;
      __int16 v12 = objc_alloc_init(FCCKDatabaseZoneMigrationOperation);
      -[FCCKDatabaseZoneMigrationOperation setDatabase:]((uint64_t)v12, a1[46]);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v13, v11, 376);
      }
      -[FCCKDatabaseZoneMigrationOperation setMigrator:]((uint64_t)v12, a1[47]);
      __int16 v14 = a1[46];
      v15 = [v11 zoneName];

      uint64_t v16 = -[FCCKPrivateDatabase pruningAssistantForZoneName:](v14, v15);

      -[FCCKDatabaseZoneMigrationOperation setPruningAssistant:]((uint64_t)v12, v16);
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __60__FCCKDatabaseMigrationOperation__migrateZoneID_completion___block_invoke;
      newValue[3] = &unk_1E5B549E8;
      newValue[4] = a1;
      v18 = v10;
      id v23 = v18;
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v17, newValue, 400);
      }
      [a1 associateChildOperation:v12];
      [(FCOperation *)v12 start];
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  int v6 = objc_msgSend(a3, "fc_hasIdentityLostError");
  if (v6)
  {
    v7 = objc_alloc_init(FCOperationExternalSignal);
    int v8 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
    id v9 = v8;
    if (self) {
      database = self->_database;
    }
    else {
      database = 0;
    }
    [(FCCKSecureDatabaseResetOperation *)v8 setDatabase:database];
    [(FCCKSecureDatabaseResetOperation *)v9 setDeleteZones:1];
    [(FCCKSecureDatabaseResetOperation *)v9 setRestoreSecureSentinel:1];
    [(FCCKSecureDatabaseResetOperation *)v9 setRestoreZoneContents:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__FCCKDatabaseMigrationOperation_canRetryWithError_retryAfter___block_invoke;
    v14[3] = &unk_1E5B4FD28;
    v15 = v7;
    id v11 = v7;
    [(FCCKSecureDatabaseResetOperation *)v9 setResetCompletionHandler:v14];
    [(FCOperation *)self associateChildOperation:v9];
    [(FCOperation *)v9 start];
    __int16 v12 = v11;
    *a4 = v12;
  }
  return v6;
}

uint64_t __63__FCCKDatabaseMigrationOperation_canRetryWithError_retryAfter___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) triggerWithRetry:a2 == 0];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  uint64_t started = FCCKDatabaseStartUpResultFromError(v9);
  if (self)
  {
    id v5 = self->_migrator;
    [(FCCKDatabaseMigrator *)v5 databaseMigrationDidFinishForDatabase:self->_database result:started];

    id migrationCompletionHandler = self->_migrationCompletionHandler;
    if (!migrationCompletionHandler) {
      goto LABEL_5;
    }
    v7 = (void (**)(id, NSMutableArray *, NSMutableArray *, id))migrationCompletionHandler;
    int v8 = self->_resultZoneIDsEligibleForDeletion;
    v7[2](v7, v8, self->_resultRecordIDsEligibleForDeletion, v9);
  }
  else
  {
    [0 databaseMigrationDidFinishForDatabase:0 result:started];
    v7 = 0;
  }

LABEL_5:
}

uint64_t __61__FCCKDatabaseMigrationOperation__migrateZoneIDs_completion___block_invoke(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else {
    return -[FCCKDatabaseMigrationOperation _migrateZoneIDs:completion:](a1[4], a1[5], a1[6]);
  }
}

void __60__FCCKDatabaseMigrationOperation__migrateZoneID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    int v8 = *(void **)(v7 + 392);
  }
  else {
    int v8 = 0;
  }
  id v12 = a4;
  id v9 = a3;
  [v8 addObjectsFromArray:a2];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 400);
  }
  else {
    id v11 = 0;
  }
  [v11 addObjectsFromArray:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (void)setMigrator:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, 0);
  objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, 0);
  objc_storeStrong(&self->_migrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end