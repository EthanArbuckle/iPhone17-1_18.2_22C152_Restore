@interface FCCKDatabaseEncryptionStartUpMiddleware
- (id)initWithEncryptionMigrator:(id *)a1;
- (void)_adoptSentinel:(void *)a3 secureSentinel:(void *)a4 forDatabase:(void *)a5 completion:;
- (void)_associateChildOperation:(uint64_t)a1;
- (void)_createSentinelsIfNeededForDatabase:(void *)a3 completion:;
- (void)_deleteOldDataIfDesiredWithSentinel:(void *)a3 secureSentinel:(void *)a4 database:(void *)a5 completion:;
- (void)performStartUpForDatabase:(id)a3 completion:(id)a4;
@end

@implementation FCCKDatabaseEncryptionStartUpMiddleware

- (id)initWithEncryptionMigrator:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FCCKDatabaseEncryptionStartUpMiddleware;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (void)performStartUpForDatabase:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  if (!v6 || (id WeakRetained = objc_loadWeakRetained(v6 + 2), WeakRetained, !WeakRetained))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)[[NSString alloc] initWithFormat:@"can't perform encryption startup without an encryption delegate"];
      *(_DWORD *)buf = 136315906;
      v28 = "-[FCCKDatabaseEncryptionStartUpMiddleware performStartUpForDatabase:completion:]";
      __int16 v29 = 2080;
      v30 = "FCCKDatabaseEncryptionStartUpMiddleware.m";
      __int16 v31 = 1024;
      int v32 = 54;
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke;
  aBlock[3] = &unk_1E5B4E7A8;
  id v9 = v7;
  id v26 = v9;
  v10 = v6;
  v25 = v10;
  v11 = _Block_copy(aBlock);
  if (v6 && (id v12 = objc_loadWeakRetained(v10 + 2), v12, v12))
  {
    v13 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "will fetch desired private database version", buf, 2u);
    }
    id v14 = objc_loadWeakRetained(v10 + 2);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_9;
    v19[3] = &unk_1E5B5C2C8;
    v15 = &v21;
    v21 = v11;
    v19[4] = self;
    v20 = v10;
    id v16 = v11;
    [v14 fetchDesiredVersionForDatabase:v20 completion:v19];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_3;
    v22[3] = &unk_1E5B4CA88;
    v15 = &v23;
    v23 = v11;
    id v18 = v11;
    __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_3((uint64_t)v22);
  }
}

void __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v6 = (void (**)(id, id))*(id *)(a1 + 40);
    id v5 = v3;
    v6[2](v6, v5);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      *(unsigned char *)(v4 + 8) = 1;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Encryption startup middleware requires an encryption delegate";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"FCErrorDomain" code:16 userInfo:v3];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

void __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2_10;
    v32[3] = &unk_1E5B4CC80;
    id v33 = v5;
    id v34 = *(id *)(a1 + 48);
    __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2_10((uint64_t)v32);
  }
  else
  {
    id v7 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      id v9 = FCCKPrivateDatabaseVersionString(a2);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "did fetch desired private database version with result: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v13 = v10;
    id v14 = v12;
    if (v11)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke;
      aBlock[3] = &unk_1E5B5C430;
      void aBlock[4] = v11;
      id v31 = v13;
      id v15 = v13;
      id v41 = v15;
      id v16 = v14;
      id v42 = v16;
      v17 = _Block_copy(aBlock);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2;
      v35[3] = &unk_1E5B5C2F0;
      uint64_t v39 = a2;
      id v37 = v17;
      v35[4] = v11;
      id v18 = v15;
      id v36 = v18;
      id v38 = v16;
      id v30 = v17;
      v19 = v35;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke;
      v45[3] = &unk_1E5B5C340;
      v20 = v19;
      id v46 = v20;
      id v21 = v18;
      v22 = _Block_copy(v45);
      v23 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
      v24 = +[CKRecordID fc_staticSentinelRecordID]();
      v56[0] = v24;
      v25 = +[CKRecordID fc_staticSecureSentinelRecordID]();
      v56[1] = v25;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
      [(FCCKPrivateFetchRecordsOperation *)v23 setRecordIDs:v26];

      *(void *)&long long buf = @"version";
      *((void *)&buf + 1) = @"encryptionKey";
      v48 = @"migratedUnencryptedData";
      v49 = @"deletedUnencryptedData";
      v50 = @"migratedSubscriptions";
      v51 = @"deletedSubscriptions";
      v52 = @"migratedToVersion";
      v53 = @"deletedToVersion";
      v54 = @"encryptionKey";
      v55 = @"version";
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:10];
      [(FCCKPrivateFetchRecordsOperation *)v23 setDesiredKeys:v27];

      [(FCCKPrivateDatabaseOperation *)v23 setSkipPreflight:1];
      [(FCCKPrivateDatabaseOperation *)v23 setHandleIdentityLoss:0];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_2;
      v43[3] = &unk_1E5B4CA60;
      id v44 = v22;
      id v28 = v22;
      [(FCCKPrivateFetchRecordsOperation *)v23 setFetchRecordsCompletionBlock:v43];
      __int16 v29 = v23;
      [(FCOperation *)v29 setQualityOfService:25];
      [(FCOperation *)v29 setRelativePriority:2];

      -[FCCKPrivateDatabase addOperation:]((uint64_t)v21, v29);
      id v13 = v31;
    }
  }
}

uint64_t __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2_10(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "failed to fetch desired private database version with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = a1[4];
  id v9 = a3;
  id v10 = a2;
  id v11 = v7;
  id v36 = v11;
  if (!v10 || !v8)
  {

    uint64_t v13 = a1[4];
LABEL_10:
    id v26 = v10;
    id v27 = v9;
    id v28 = v36;
    __int16 v29 = v28;
    if (v13)
    {
      if (v10)
      {
        int v30 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v26) == 0;
        goto LABEL_15;
      }
      if ([v28 code] == 2)
      {
        id v31 = [v29 userInfo];
        int v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

        id v33 = +[CKRecordID fc_staticSentinelRecordID]();
        id v34 = [v32 objectForKeyedSubscript:v33];

        int v30 = objc_msgSend(v34, "fc_isCKUnknownItemError");
LABEL_15:

        if (v30)
        {
          -[FCCKPrivateDatabase reportRecoverableStartUpError:](a1[5], v29);
          uint64_t v35 = *(void (**)(void))(a1[6] + 16);
LABEL_19:
          v35();
          goto LABEL_20;
        }
LABEL_18:
        uint64_t v35 = *(void (**)(void))(a1[6] + 16);
        goto LABEL_19;
      }
    }

    goto LABEL_18;
  }
  int v12 = objc_msgSend(v11, "fc_hasIdentityLostError");

  uint64_t v13 = a1[4];
  if (!v12) {
    goto LABEL_10;
  }
  id v14 = (void *)a1[6];
  id v15 = (id)a1[5];
  id v16 = v10;
  id v17 = v9;
  id v18 = v14;
  if (v13)
  {
    uint64_t v19 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v16);
    if (v15) {
      v15[5] = v19;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke;
    aBlock[3] = &unk_1E5B5C430;
    v20 = v15;
    id v44 = v20;
    uint64_t v45 = v13;
    id v46 = v18;
    id v21 = _Block_copy(aBlock);
    v22 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
    [(FCCKSecureDatabaseResetOperation *)v22 setDatabase:v20];
    [(FCCKSecureDatabaseResetOperation *)v22 setDeleteZones:1];
    [(FCCKSecureDatabaseResetOperation *)v22 setRestoreSecureSentinel:0];
    [(FCCKSecureDatabaseResetOperation *)v22 setRestoreZoneContents:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_3;
    v37[3] = &unk_1E5B5C480;
    id v38 = v16;
    id v42 = v21;
    id v39 = v17;
    uint64_t v40 = v13;
    id v41 = v20;
    id v23 = v21;
    [(FCCKSecureDatabaseResetOperation *)v22 setResetCompletionHandler:v37];
    v24 = v22;
    [(FCOperation *)v24 setQualityOfService:25];
    [(FCOperation *)v24 setRelativePriority:2];

    v25 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v25 addOperation:v24];
  }
LABEL_20:
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    id v44 = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_3;
    uint64_t v45 = &unk_1E5B4F0D0;
    v49 = (void (**)(id, id, id, id))*(id *)(a1 + 48);
    id v46 = v7;
    id v47 = v8;
    id v48 = v9;
    v49[2](v49, v46, v47, v48);

    id v10 = v49;
  }
  else
  {
    if (v7)
    {
      id v11 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v11;
        uint64_t v13 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v7);
        id v14 = FCCKPrivateDatabaseVersionString(v13);
        uint64_t v15 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v7);
        id v16 = FCCKPrivateDatabaseVersionString(v15);
        *(_DWORD *)long long buf = 138543618;
        v51 = v14;
        __int16 v52 = 2114;
        v53 = v16;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "fetched sentinel with database version=%{public}@, cleaned up to version=%{public}@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 64))
    {
      if (v7 && v8 && -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v7) >= *(void *)(a1 + 64))
      {
        uint64_t v22 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v7);
        uint64_t v24 = *(void *)(a1 + 32);
        id v23 = *(void **)(a1 + 40);
        if (v22 >= *(void *)(a1 + 64))
        {
          -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](*(void *)(a1 + 32), v7, v8, v23, *(void **)(a1 + 56));
          goto LABEL_17;
        }
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2_14;
        v30[3] = &unk_1E5B5C430;
        v30[4] = v24;
        id v31 = v23;
        id v32 = *(id *)(a1 + 56);
        -[FCCKDatabaseEncryptionStartUpMiddleware _deleteOldDataIfDesiredWithSentinel:secureSentinel:database:completion:](v24, v7, v8, v31, v30);

        id v10 = (void (**)(id, id, id, id))v31;
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_3_15;
        aBlock[3] = &unk_1E5B5C2F0;
        id v17 = (void (**)(id, id, id, id))*(id *)(a1 + 48);
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void **)(a1 + 40);
        id v27 = v17;
        void aBlock[4] = v18;
        uint64_t v29 = *(void *)(a1 + 64);
        id v26 = v19;
        id v28 = *(id *)(a1 + 56);
        v20 = _Block_copy(aBlock);
        id v21 = v20;
        if (v7 && v8) {
          (*((void (**)(void *, id, id, void))v20 + 2))(v20, v7, v8, 0);
        }
        else {
          -[FCCKDatabaseEncryptionStartUpMiddleware _createSentinelsIfNeededForDatabase:completion:](*(void *)(a1 + 32), *(void **)(a1 + 40), v20);
        }

        id v10 = v27;
      }
    }
    else
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      uint64_t v35 = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_13;
      id v36 = &unk_1E5B55018;
      uint64_t v37 = *(void *)(a1 + 32);
      id v38 = v7;
      id v39 = v8;
      id v40 = *(id *)(a1 + 40);
      id v41 = *(id *)(a1 + 56);
      -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](v37, v38, v39, v40, v41);

      id v10 = (void (**)(id, id, id, id))v38;
    }
  }

LABEL_17:
}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_13(uint64_t a1)
{
}

- (void)_adoptSentinel:(void *)a3 secureSentinel:(void *)a4 forDatabase:(void *)a5 completion:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    int v12 = a5;
    uint64_t v13 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v9);
    if (v11)
    {
      v11[5] = v13;
      objc_setProperty_atomic(v11, v14, v9, 64);
    }
    uint64_t v15 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v9);
    id v16 = FCPrivateDataEncryptionLog;
    BOOL v17 = os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        int v24 = 138412546;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Sentinel says migration has finished -- going online with encryption {sentinel: %@, secure sentinel: %@}", (uint8_t *)&v24, 0x16u);
      }
      v20 = -[CKRecord fc_sentinel_encryptionKey](v9);
      if (v11) {
        objc_setProperty_atomic(v11, v19, v20, 48);
      }

      uint64_t v22 = -[CKRecord fc_secureSentinel_encryptionKey](v10);
      if (v11) {
        objc_setProperty_atomic(v11, v21, v22, 56);
      }
    }
    else
    {
      if (v17)
      {
        int v24 = 138412546;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Sentinel says migration has not finished -- going online without encryption {sentinel: %@, secure sentinel: %@}", (uint8_t *)&v24, 0x16u);
      }
      if (v11)
      {
        objc_setProperty_atomic(v11, v18, 0, 48);
        objc_setProperty_atomic(v11, v23, 0, 56);
      }
    }
    v12[2](v12, 0);
  }
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2_14(uint64_t a1, void *a2, void *a3)
{
}

- (void)_deleteOldDataIfDesiredWithSentinel:(void *)a3 secureSentinel:(void *)a4 database:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    if (v11) {
      id WeakRetained = objc_loadWeakRetained(v11 + 2);
    }
    else {
      id WeakRetained = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __114__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataIfDesiredWithSentinel_secureSentinel_database_completion___block_invoke;
    v14[3] = &unk_1E5B5C3B8;
    id v19 = v12;
    id v15 = v9;
    id v16 = v10;
    uint64_t v17 = a1;
    uint64_t v18 = v11;
    [WeakRetained fetchCleanupToVersionForDatabase:v18 completion:v14];
  }
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_3_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v48 = a2;
  id v47 = a3;
  id v7 = a4;
  if (v7)
  {
    v53[1] = MEMORY[0x1E4F143A8];
    v53[2] = 3221225472;
    v53[3] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_4;
    v53[4] = &unk_1E5B4F0D0;
    id v8 = (id *)&v57;
    id v9 = (void (**)(id, id, id, id))*(id *)(a1 + 48);
    v57 = v9;
    id v10 = &v54;
    id v11 = v48;
    id v54 = v11;
    id v12 = v47;
    id v55 = v12;
    id v56 = v7;
    v9[2](v9, v11, v12, v56);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v50 = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_5;
    v51 = &unk_1E5B5C430;
    id v8 = (id *)v53;
    int64_t v15 = *(void *)(a1 + 64);
    v53[0] = *(id *)(a1 + 56);
    id v10 = (id *)v52;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    v52[0] = v16;
    v52[1] = v17;
    id v18 = v48;
    id v46 = v47;
    id v19 = v14;
    v20 = v49;
    if (v13)
    {
      if (-[CKRecord fc_sentinel_databaseVersion]((uint64_t)v18) >= v15)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke;
        v62 = &unk_1E5B4F080;
        id v38 = v20;
        id v39 = v20;
        v65 = v39;
        id v40 = v18;
        id v63 = v40;
        id v64 = v46;
        uint64_t v41 = (uint64_t)v39;
        v20 = v38;
        uint64_t v37 = (id *)&v65;
        id v8 = (id *)v53;
        id v42 = v40;
        uint64_t v43 = &v63;
        v50(v41, v42, v64, 0);
        id v32 = v64;
      }
      else
      {
        uint64_t v45 = v20;
        uint64_t v21 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v18);
        if (v19)
        {
          v19[4] = v21;
          void v19[5] = v15;
          uint64_t v22 = -[CKRecord fc_sentinel_encryptionKey](v18);
          objc_setProperty_atomic(v19, v23, v22, 48);
        }
        else
        {
          uint64_t v22 = -[CKRecord fc_sentinel_encryptionKey](v18);
        }

        id v25 = -[CKRecord fc_secureSentinel_encryptionKey](v46);
        if (v19) {
          objc_setProperty_atomic(v19, v24, v25, 56);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2;
        aBlock[3] = &unk_1E5B5C318;
        __int16 v26 = v19;
        v59 = v26;
        id v27 = v45;
        id v60 = v27;
        id v44 = _Block_copy(aBlock);
        uint64_t v28 = *(void *)(v13 + 8);
        uint64_t v29 = FCPrivateDataEncryptionLog;
        BOOL v30 = os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEFAULT, "Sentinel is valid and migration is needed: %@", buf, 0xCu);
          }
          id v31 = objc_alloc_init(FCCKDatabaseMigrationOperation);
          -[FCCKDatabaseMigrationOperation setDatabase:]((uint64_t)v31, v26);
          -[FCCKDatabaseMigrationOperation setMigrator:]((uint64_t)v31, *(void **)(v13 + 8));
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_17;
          v62 = &unk_1E5B5C390;
          id v32 = v44;
          id v67 = v44;
          id v63 = v18;
          id v33 = v46;
          int64_t v68 = v15;
          id v64 = v33;
          v65 = (void *)v13;
          v66 = v26;
          id v8 = (id *)v53;
          if (v31) {
            objc_setProperty_nonatomic_copy(v31, v34, buf, 384);
          }
          uint64_t v35 = v31;
          [(FCOperation *)v35 setQualityOfService:25];
          [(FCOperation *)v35 setRelativePriority:2];

          id v36 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
          [v36 addOperation:v35];

          uint64_t v37 = (id *)&v59;
        }
        else
        {
          if (v30)
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v26;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEFAULT, "Sentinel is valid and migration is not needed {database: %@, sentinel: %@}", buf, 0x16u);
          }
          uint64_t v35 = (FCCKDatabaseMigrationOperation *)[v18 copy];
          -[CKRecord setFc_sentinel_databaseVersion:](v35, v15);
          -[CKRecord setFc_sentinel_deletedToDatabaseVersion:](v35, v15);
          v50((uint64_t)v27, v35, v46, 0);
          id v8 = (id *)v53;
          uint64_t v37 = (id *)&v59;
          id v32 = v44;
        }

        id v10 = (id *)v52;
        v20 = v45;
        uint64_t v43 = &v60;
      }
    }
  }
}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (FCCKDatabaseStartUpResultFromError(v9) == 1)
  {
    id v11 = (void (**)(id, id))*(id *)(a1 + 48);
    id v10 = v9;
    v11[2](v11, v10);
  }
  else
  {
    if (v9) {
      -[FCCKPrivateDatabase reportEncryptionMigrationError:](*(void *)(a1 + 32), v9);
    }
    -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](*(void *)(a1 + 40), v7, v8, *(void **)(a1 + 32), *(void **)(a1 + 48));
  }
}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_createSentinelsIfNeededForDatabase:(void *)a3 completion:
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "fc_randomDataWithLength:", 32);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "fc_randomDataWithLength:", 32);
    id v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1A2D8]);
      id v12 = +[CKRecordID fc_staticSentinelRecordID]();
      uint64_t v13 = (void *)[v11 initWithRecordType:@"Sentinel" recordID:v12];

      -[CKRecord setFc_sentinel_encryptionKey:](v13, v7);
      -[CKRecord setFc_sentinel_version:](v13, 1);
      id v14 = +[CKRecord secureSentinelRecordWithEncryptionKey:](MEMORY[0x1E4F1A2D8], v9);
      int64_t v15 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
      v23[0] = v13;
      v23[1] = v14;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      [(FCCKPrivateSaveRecordsOperation *)v15 setRecordsToSave:v16];

      [(FCCKPrivateSaveRecordsOperation *)v15 setSavePolicy:0];
      [(FCCKPrivateDatabaseOperation *)v15 setSkipPreflight:1];
      [(FCCKPrivateDatabaseOperation *)v15 setHandleIdentityLoss:0];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke;
      uint64_t v21 = &unk_1E5B559D8;
      id v22 = v6;
      [(FCCKPrivateSaveRecordsOperation *)v15 setSaveRecordsCompletionBlock:&v18];
      uint64_t v17 = v15;
      -[FCOperation setQualityOfService:](v17, "setQualityOfService:", 25, v18, v19, v20, v21);
      [(FCOperation *)v17 setRelativePriority:2];

      -[FCCKPrivateDatabase addOperation:]((uint64_t)v5, v17);
    }
  }
}

uint64_t __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v15 = a2;
  if (v7) {
    *(void *)(v7 + 32) = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    *(void *)(v11 + 40) = 0;
    id v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_setProperty_atomic(v12, v10, 0, 48);
      id v14 = *(void **)(a1 + 32);
      if (v14) {
        objc_setProperty_atomic(v14, v13, 0, 56);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
  else
  {
    id v6 = (void *)[*(id *)(a1 + 32) copy];
    -[CKRecord setFc_sentinel_databaseVersion:](v6, *(void *)(a1 + 72));
    uint64_t v7 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v17[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(FCCKPrivateSaveRecordsOperation *)v7 setRecordsToSave:v8];

    [(FCCKPrivateSaveRecordsOperation *)v7 setSavePolicy:1];
    [(FCCKPrivateDatabaseOperation *)v7 setSkipPreflight:1];
    [(FCCKPrivateDatabaseOperation *)v7 setHandleIdentityLoss:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2_20;
    v11[3] = &unk_1E5B5C368;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 48);
    id v12 = v6;
    id v13 = v9;
    id v14 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 32);
    id v10 = v6;
    [(FCCKPrivateSaveRecordsOperation *)v7 setSaveRecordsCompletionBlock:v11];
    -[FCCKDatabaseEncryptionStartUpMiddleware _associateChildOperation:](*(void *)(a1 + 48), v7);
    -[FCCKPrivateDatabase addOperation:](*(void *)(a1 + 56), v7);
  }
}

void __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 count] == 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v9 = *(void **)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_3;
    v10[3] = &unk_1E5B5C340;
    id v11 = *(id *)(a1 + 72);
    -[FCCKDatabaseEncryptionStartUpMiddleware _deleteOldDataIfDesiredWithSentinel:secureSentinel:database:completion:](v6, v7, v8, v9, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_associateChildOperation:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    [v2 setQualityOfService:25];
    [v2 setRelativePriority:2];
  }
}

void __114__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataIfDesiredWithSentinel_secureSentinel_database_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v46 = (void (**)(id, id, id, id))*(id *)(a1 + 64);
    id v43 = *(id *)(a1 + 32);
    id v44 = *(id *)(a1 + 40);
    id v45 = v5;
    v46[2](v46, v43, v44, v45);
  }
  else
  {
    uint64_t v6 = -[CKRecord fc_sentinel_databaseVersion](*(void *)(a1 + 32));
    if (a2 >= v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = a2;
    }
    if (-[CKRecord fc_sentinel_deletedToDatabaseVersion](*(void *)(a1 + 32)) >= v7)
    {
      uint64_t v34 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = *(void *)(a1 + 32);
        id v36 = v34;
        uint64_t v37 = -[CKRecord fc_sentinel_deletedToDatabaseVersion](v35);
        id v38 = FCCKPrivateDatabaseVersionString(v37);
        LODWORD(block) = 138543362;
        *(void *)((char *)&block + 4) = v38;
        _os_log_impl(&dword_1A460D000, v36, OS_LOG_TYPE_DEFAULT, "Data cleanup is unnecessary because we've cleaned up to version=%{public}@", (uint8_t *)&block, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      id v9 = *(void **)(a1 + 56);
      id v11 = *(void **)(a1 + 64);
      id v12 = *(id *)(a1 + 32);
      id v42 = v8;
      id v13 = v9;
      id v40 = v11;
      if (v10)
      {
        uint64_t v14 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v12);
        uint64_t v15 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v12);
        if (v13)
        {
          v13[4] = v15;
          v13[5] = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v12);
          id v16 = -[CKRecord fc_sentinel_encryptionKey](v12);
          objc_setProperty_atomic(v13, v17, v16, 48);
        }
        else
        {
          -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v12);
          id v16 = -[CKRecord fc_sentinel_encryptionKey](v12);
        }

        uint64_t v19 = -[CKRecord fc_secureSentinel_encryptionKey](v42);
        if (v13) {
          objc_setProperty_atomic(v13, v18, v19, 56);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke;
        aBlock[3] = &unk_1E5B5C318;
        v20 = v13;
        id v58 = v20;
        id v59 = v40;
        id v39 = _Block_copy(aBlock);
        v55[0] = 0;
        v55[1] = v55;
        v55[2] = 0x3032000000;
        v55[3] = __Block_byref_object_copy__91;
        v55[4] = __Block_byref_object_dispose__91;
        id v56 = 0;
        v53[0] = 0;
        v53[1] = v53;
        v53[2] = 0x3032000000;
        v53[3] = __Block_byref_object_copy__91;
        v53[4] = __Block_byref_object_dispose__91;
        id v54 = 0;
        uint64_t v21 = dispatch_group_create();
        id v22 = *(id *)(v10 + 8);
        uint64_t v41 = FCCKDatabaseZoneIDsToDeleteAfterMigration(v14, v7, v22);

        if ([v41 count])
        {
          SEL v23 = objc_alloc_init(FCCKPrivateDeleteRecordZonesOperation);
          [(FCCKPrivateDatabaseOperation *)v23 setDatabase:v20];
          [(FCCKPrivateDeleteRecordZonesOperation *)v23 setRecordZoneIDsToDelete:v41];
          [(FCCKPrivateDatabaseOperation *)v23 setSkipPreflight:1];
          [(FCCKPrivateDatabaseOperation *)v23 setHandleIdentityLoss:0];
          dispatch_group_enter(v21);
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_25;
          v50[3] = &unk_1E5B5C3E0;
          __int16 v52 = v55;
          v51 = v21;
          [(FCCKPrivateDeleteRecordZonesOperation *)v23 setDeleteRecordZonesCompletionBlock:v50];
          int v24 = v23;
          [(FCOperation *)v24 setQualityOfService:25];
          [(FCOperation *)v24 setRelativePriority:2];

          id v25 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
          [v25 addOperation:v24];
        }
        id v26 = *(id *)(v10 + 8);
        id v27 = FCCKDatabaseRecordIDsToDeleteAfterMigration(v14, v7, v26);

        if ([v27 count])
        {
          uint64_t v28 = objc_alloc_init(FCCKPrivateBatchedDeleteRecordsOperation);
          [(FCCKPrivateBatchedDeleteRecordsOperation *)v28 setDatabase:v20];
          [(FCCKPrivateBatchedDeleteRecordsOperation *)v28 setRecordIDsToDelete:v27];
          [(FCCKPrivateBatchedDeleteRecordsOperation *)v28 setSkipPreflight:1];
          [(FCCKPrivateBatchedDeleteRecordsOperation *)v28 setHandleIdentityLoss:0];
          dispatch_group_enter(v21);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_2;
          v47[3] = &unk_1E5B5C3E0;
          v49 = v53;
          id v48 = v21;
          [(FCCKPrivateBatchedDeleteRecordsOperation *)v28 setDeleteRecordsCompletionBlock:v47];
          uint64_t v29 = v28;
          [(FCOperation *)v29 setQualityOfService:25];
          [(FCOperation *)v29 setRelativePriority:2];

          BOOL v30 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
          [v30 addOperation:v29];
        }
        id v31 = dispatch_get_global_queue(25, 0);
        *(void *)&long long block = MEMORY[0x1E4F143A8];
        *((void *)&block + 1) = 3221225472;
        v61 = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_3;
        v62 = &unk_1E5B5C408;
        int64_t v68 = v55;
        uint64_t v69 = v53;
        id v32 = v12;
        uint64_t v70 = v7;
        id v63 = v32;
        id v67 = v39;
        id v64 = v42;
        uint64_t v65 = v10;
        v66 = v20;
        id v33 = v39;
        dispatch_group_notify(v21, v31, &block);

        _Block_object_dispose(v53, 8);
        _Block_object_dispose(v55, 8);
      }
    }
  }
}

uint64_t __114__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataIfDesiredWithSentinel_secureSentinel_database_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v15 = a2;
  if (v7) {
    *(void *)(v7 + 32) = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    *(void *)(v11 + 40) = 0;
    id v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_setProperty_atomic(v12, v10, 0, 48);
      uint64_t v14 = *(void **)(a1 + 32);
      if (v14) {
        objc_setProperty_atomic(v14, v13, 0, 56);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_25(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_3(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v2 && !objc_msgSend(v2, "fc_isCKUnknownItemError")
    || (id v3 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) != 0
    && !objc_msgSend(v3, "fc_isCKUnknownItemError"))
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (!v7) {
      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = v7;
    -[FCCKPrivateDatabase reportPostMigrationCleanupError:](v8, v9);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) copy];
    -[CKRecord setFc_sentinel_deletedToDatabaseVersion:](v4, *(void *)(a1 + 88));
    id v5 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v14[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(FCCKPrivateSaveRecordsOperation *)v5 setRecordsToSave:v6];

    [(FCCKPrivateSaveRecordsOperation *)v5 setSavePolicy:1];
    [(FCCKPrivateDatabaseOperation *)v5 setSkipPreflight:1];
    [(FCCKPrivateDatabaseOperation *)v5 setHandleIdentityLoss:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_4;
    v10[3] = &unk_1E5B4EBA8;
    id v13 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    [(FCCKPrivateSaveRecordsOperation *)v5 setSaveRecordsCompletionBlock:v10];
    -[FCCKDatabaseEncryptionStartUpMiddleware _associateChildOperation:](*(void *)(a1 + 48), v5);
    -[FCCKPrivateDatabase addOperation:](*(void *)(a1 + 56), v5);
  }
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v9 count];
  uint64_t v7 = a1[6];
  if (v6 == 1)
  {
    uint64_t v8 = [v9 firstObject];
    (*(void (**)(uint64_t, void *, void, void))(v7 + 16))(v7, v8, a1[4], 0);
  }
  else
  {
    (*(void (**)(void, void, void, id))(v7 + 16))(a1[6], a1[5], a1[4], v5);
  }
}

uint64_t __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 allValues];
  uint64_t v7 = objc_msgSend(v6, "fc_firstObjectPassingTest:", &__block_literal_global_189);

  uint64_t v8 = [v5 allValues];

  id v9 = objc_msgSend(v8, "fc_firstObjectPassingTest:", &__block_literal_global_31_2);

  if (v7 && v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v10, "fc_isCKUnknownItemError");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Sentinel"];

  return v3;
}

uint64_t __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"SentinelSecure"];

  return v3;
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v5, "fc_firstObjectPassingTest:", &__block_literal_global_36_0);
  uint64_t v7 = objc_msgSend(v5, "fc_firstObjectPassingTest:", &__block_literal_global_38_3);

  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F19D10];
    id v9 = +[CKRecordID fc_staticSentinelRecordID]();
    uint64_t v6 = objc_msgSend(v12, "fc_underlyingCKErrorUserInfoValueForKey:forItemID:", v8, v9);

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F19D10];
  id v11 = +[CKRecordID fc_staticSecureSentinelRecordID]();
  uint64_t v7 = objc_msgSend(v12, "fc_underlyingCKErrorUserInfoValueForKey:forItemID:", v10, v11);

LABEL_3:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Sentinel"];

  return v3;
}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"SentinelSecure"];

  return v3;
}

void __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    *(void *)(v11 + 40) = 0;
    id v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_setProperty_atomic(v12, v9, 0, 48);
      uint64_t v14 = *(void **)(a1 + 32);
      if (v14) {
        objc_setProperty_atomic(v14, v13, 0, 56);
      }
    }
  }
  if (v8 || !-[CKRecord fc_sentinel_databaseVersion]((uint64_t)v7))
  {
    -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](*(void *)(a1 + 40), v7, v8, *(void **)(a1 + 32), *(void **)(a1 + 48));
  }
  else
  {
    id v16 = (void (**)(id, id))*(id *)(a1 + 48);
    id v15 = v10;
    v16[2](v16, v15);
  }
}

uint64_t __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[CKRecord fc_sentinel_databaseVersion](*(void *)(a1 + 32)))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void **)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_4;
    v7[3] = &unk_1E5B5C430;
    id v8 = v4;
    id v6 = *(id *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = v6;
    -[FCCKDatabaseEncryptionStartUpMiddleware _createSentinelsIfNeededForDatabase:completion:](v5, v8, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    uint64_t v9 = -[CKRecord fc_sentinel_encryptionKey](v5);
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      objc_setProperty_atomic(v10, v8, v9, 48);
    }

    id v12 = -[CKRecord fc_secureSentinel_encryptionKey](v7);
    id v13 = *(void **)(a1 + 32);
    if (v13) {
      objc_setProperty_atomic(v13, v11, v12, 56);
    }

    uint64_t v14 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
    [(FCCKSecureDatabaseResetOperation *)v14 setDatabase:*(void *)(a1 + 32)];
    [(FCCKSecureDatabaseResetOperation *)v14 setDeleteZones:0];
    [(FCCKSecureDatabaseResetOperation *)v14 setRestoreSecureSentinel:0];
    [(FCCKSecureDatabaseResetOperation *)v14 setRestoreZoneContents:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_5;
    v16[3] = &unk_1E5B5C458;
    id v19 = *(id *)(a1 + 48);
    id v17 = v5;
    id v18 = v7;
    [(FCCKSecureDatabaseResetOperation *)v14 setResetCompletionHandler:v16];
    -[FCCKDatabaseEncryptionStartUpMiddleware _associateChildOperation:](*(void *)(a1 + 40), v14);
    id v15 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v15 addOperation:v14];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_5(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

- (void).cxx_destruct
{
}

@end