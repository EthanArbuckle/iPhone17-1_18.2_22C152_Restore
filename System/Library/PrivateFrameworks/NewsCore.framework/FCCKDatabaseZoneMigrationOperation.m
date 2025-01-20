@interface FCCKDatabaseZoneMigrationOperation
- (BOOL)validateOperation;
- (void)_continueGatheringRecordsWithPreviousServerChangeToken:(void *)a3 recordsAlreadyFetched:(void *)a4 completionHandler:;
- (void)_migrateAndUpdateRecords:(void *)a3 completion:;
- (void)_saveMigratedRecords:(void *)a3 completion:;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setDatabase:(uint64_t)a1;
- (void)setMigrator:(uint64_t)a1;
- (void)setPruningAssistant:(uint64_t)a1;
@end

@implementation FCCKDatabaseZoneMigrationOperation

- (BOOL)validateOperation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self && self->_database)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)[[NSString alloc] initWithFormat:@"can't migrate a zone without a database"];
      int v10 = 136315906;
      v11 = "-[FCCKDatabaseZoneMigrationOperation validateOperation]";
      __int16 v12 = 2080;
      v13 = "FCCKDatabaseZoneMigrationOperation.m";
      __int16 v14 = 1024;
      int v15 = 41;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
    char v3 = 0;
    if (!self)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)[[NSString alloc] initWithFormat:@"can't migrate a zone without a migrator"];
        int v10 = 136315906;
        v11 = "-[FCCKDatabaseZoneMigrationOperation validateOperation]";
        __int16 v12 = 2080;
        v13 = "FCCKDatabaseZoneMigrationOperation.m";
        __int16 v14 = 1024;
        int v15 = 45;
        __int16 v16 = 2114;
        v17 = v8;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
      }
      char v4 = 0;
      if (!self) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  if (!self->_migrator) {
    goto LABEL_9;
  }
  char v4 = 1;
LABEL_12:
  if (self->_recordZoneID)
  {
    char v5 = 1;
    return v5 & v3 & v4;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"can't migrate a zone without a record zone ID"];
    int v10 = 136315906;
    v11 = "-[FCCKDatabaseZoneMigrationOperation validateOperation]";
    __int16 v12 = 2080;
    v13 = "FCCKDatabaseZoneMigrationOperation.m";
    __int16 v14 = 1024;
    int v15 = 49;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  char v5 = 0;
  return v5 & v3 & v4;
}

- (void)prepareOperation
{
  char v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    objc_storeStrong((id *)&self->_createdZones, v3);
  }

  char v4 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, v4);
  }

  char v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = v5;
  if (self)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, v5);
    v6 = v7;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)performOperation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v3 = (id)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(FCOperation *)self shortOperationDescription];
    if (self)
    {
      char v5 = self->_database;
      recordZoneID = self->_recordZoneID;
    }
    else
    {
      char v5 = 0;
      recordZoneID = 0;
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v45 = recordZoneID;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will migrate with database: %{public}@, zone ID: %{public}@", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__FCCKDatabaseZoneMigrationOperation_performOperation__block_invoke;
  aBlock[3] = &unk_1E5B4FD28;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  if (self)
  {
    v8 = self->_migrator;
    v9 = self->_recordZoneID;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  int v10 = v9;
  v11 = [(CKRecordZoneID *)v10 zoneName];
  int v12 = [(FCCKDatabaseMigrator *)v8 databaseMigrationShouldMigrateEntireZone:v11];

  if (v12)
  {
    id v13 = v7;
    id v14 = v13;
    if (self)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke;
      v39 = &unk_1E5B51660;
      id v15 = v13;
      v40 = self;
      id v41 = v15;
      __int16 v16 = &v36;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __83__FCCKDatabaseZoneMigrationOperation__gatherRecordsToMigrateWithCompletionHandler___block_invoke;
      v45 = (CKRecordZoneID *)&unk_1E5B55940;
      v46 = self;
      v17 = v16;
      v47 = v17;
      -[FCCKDatabaseZoneMigrationOperation _continueGatheringRecordsWithPreviousServerChangeToken:recordsAlreadyFetched:completionHandler:]((uint64_t *)self, 0, 0, buf);
    }
  }
  else
  {
    id v14 = v7;
    if (self)
    {
      migrator = self->_migrator;
      v19 = self->_recordZoneID;
      v20 = migrator;
      v21 = [(CKRecordZoneID *)v19 zoneName];
      v22 = self->_database;
      v23 = v22;
      if (v22) {
        int64_t migratingFromVersion = v22->_migratingFromVersion;
      }
      else {
        int64_t migratingFromVersion = 0;
      }
      v25 = self->_database;
      v26 = v25;
      if (v25) {
        int64_t currentVersion = v25->_currentVersion;
      }
      else {
        int64_t currentVersion = 0;
      }
      v28 = [(FCCKDatabaseMigrator *)v20 databaseMigrationRecordNamesToMigrateInZone:v21 fromVersion:migratingFromVersion toVersion:currentVersion];

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke;
      v43[3] = &unk_1E5B4DDA8;
      v43[4] = self;
      v29 = objc_msgSend(v28, "fc_arrayByTransformingWithBlock:", v43);
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke_2;
      v39 = &unk_1E5B55918;
      v40 = self;
      id v41 = v29;
      id v42 = v14;
      id v30 = v29;
      v31 = &v36;
      v32 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
      [(FCCKPrivateFetchRecordsOperation *)v32 setRecordIDs:v30];
      [(FCCKPrivateDatabaseOperation *)v32 setSkipPreflight:1];
      [(FCCKPrivateDatabaseOperation *)v32 setHandleIdentityLoss:0];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __74__FCCKDatabaseZoneMigrationOperation__migrateRecordIDs_completionHandler___block_invoke;
      v45 = (CKRecordZoneID *)&unk_1E5B4C9A8;
      v46 = self;
      v33 = (uint64_t *)v30;
      v47 = v33;
      v34 = v31;
      v48 = v34;
      [(FCCKPrivateFetchRecordsOperation *)v32 setFetchRecordsCompletionBlock:buf];
      [(FCOperation *)self associateChildOperation:v32];
      -[FCCKPrivateDatabase addOperation:]((uint64_t)self->_database, v32);
    }
  }
}

uint64_t __54__FCCKDatabaseZoneMigrationOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  if (self)
  {
    id migrationCompletionHandler = self->_migrationCompletionHandler;
    if (migrationCompletionHandler)
    {
      char v5 = (void (**)(id, NSMutableArray *, NSMutableArray *, id))migrationCompletionHandler;
      v6 = self->_resultZoneIDsEligibleForDeletion;
      v5[2](v5, v6, self->_resultRecordIDsEligibleForDeletion, v7);
    }
  }
}

void __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke_2;
    id v13 = &unk_1E5B4C7C0;
    id v15 = (void (**)(id, id))*(id *)(a1 + 40);
    id v14 = v5;
    v15[2](v15, v14);

    v6 = v15;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E5B558F0;
    v8[4] = v7;
    v9 = (void (**)(id, id))*(id *)(a1 + 40);
    -[FCCKDatabaseZoneMigrationOperation _migrateAndUpdateRecords:completion:](v7, a2, v8);
    v6 = v9;
  }
}

uint64_t __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78__FCCKDatabaseZoneMigrationOperation__migrateEntireZoneWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!v7)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      char v4 = *(void **)(v3 + 416);
      uint64_t v5 = *(void *)(v3 + 376);
    }
    else
    {
      char v4 = 0;
      uint64_t v5 = 0;
    }
    id v6 = v4;
    [v6 addObject:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_migrateAndUpdateRecords:(void *)a3 completion:
{
  v93[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v72 = a1;
  if (!a1) {
    goto LABEL_29;
  }
  id v7 = objc_msgSend(v5, "fc_uniqueByValueBlock:", &__block_literal_global_82);
  uint64_t v8 = [v7 count];
  if (v8 != [v5 count])
  {
    v9 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      uint64_t v11 = [(id)v72 shortOperationDescription];
      uint64_t v12 = [v5 count];
      *(_DWORD *)buf = 138543618;
      v85 = v11;
      __int16 v86 = 2048;
      uint64_t v87 = v12 - [v7 count];
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ removed %lu duplicates before migration", buf, 0x16u);
    }
  }
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v74 = __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_32;
  v75 = &unk_1E5B54DC0;
  uint64_t v76 = v72;
  id v77 = v7;
  id v78 = v6;
  id v13 = v7;
  v66 = v73;
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v13;
  uint64_t v70 = [obj countByEnumeratingWithState:&v79 objects:buf count:16];
  if (!v70)
  {
    id v56 = 0;
    goto LABEL_28;
  }
  id v64 = v6;
  id v65 = v5;
  uint64_t v69 = *(void *)v80;
  uint64_t v67 = *MEMORY[0x1E4F28568];
  *(void *)&long long v14 = 138543874;
  long long v63 = v14;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v80 != v69) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(*((void *)&v79 + 1) + 8 * v15);
      v17 = *(void **)(v72 + 384);
      uint64_t v18 = *(void **)(v72 + 368);
      id v83 = 0;
      id v19 = v18;
      id v20 = v17;
      v21 = [v20 databaseMigrationMigrateRecord:v16 database:v19 error:&v83];
      id v22 = v83;

      v23 = [v21 recordID];
      v24 = [v16 recordID];
      int v25 = [v23 isEqual:v24];

      if (v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)[[NSString alloc] initWithFormat:@"we currently only support migrations that produce an entirely new record"];
        *(_DWORD *)v89 = 136315906;
        *(void *)&v89[4] = "-[FCCKDatabaseZoneMigrationOperation _migratedRecord:error:]";
        __int16 v90 = 2080;
        v91 = "FCCKDatabaseZoneMigrationOperation.m";
        __int16 v92 = 1024;
        LODWORD(v93[0]) = 396;
        WORD2(v93[0]) = 2114;
        *(void *)((char *)v93 + 6) = v53;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v89, 0x26u);

        if (v21)
        {
LABEL_13:
          id v26 = objc_alloc(MEMORY[0x1E4F1A2D8]);
          v27 = [v21 recordType];
          v28 = [v21 recordID];
          v29 = (void *)[v26 initWithRecordType:v27 recordID:v28];

          id v30 = [v21 creationDate];
          [v29 setCreationDate:v30];

          v31 = [v21 modificationDate];
          [v29 setModificationDate:v31];

          v32 = [v21 creatorUserRecordID];
          [v29 setCreatorUserRecordID:v32];

          v33 = [v21 lastModifiedUserRecordID];
          [v29 setLastModifiedUserRecordID:v33];

          v34 = [v21 modifiedByDevice];
          [v29 setModifiedByDevice:v34];

          v35 = [v21 valueStore];
          uint64_t v36 = [v35 values];
          uint64_t v37 = (void *)[v36 mutableCopy];
          v38 = [v29 valueStore];
          [v38 setValues:v37];

          v39 = (void *)MEMORY[0x1E4F1CA80];
          v40 = [v21 valueStore];
          id v41 = [v40 allKeys];
          id v42 = [v39 setWithArray:v41];
          v43 = [v29 valueStore];
          [v43 setChangedKeysSet:v42];

          v44 = [v21 encryptedValueStore];
          v45 = [v44 values];
          v46 = (void *)[v45 mutableCopy];
          v47 = [v29 encryptedValueStore];
          [v47 setValues:v46];

          v48 = (void *)MEMORY[0x1E4F1CA80];
          uint64_t v49 = [v21 encryptedValueStore];
          v50 = [v49 allKeys];
          v51 = [v48 setWithArray:v50];
          v52 = [v29 encryptedValueStore];
          [v52 setChangedKeysSet:v51];

          goto LABEL_14;
        }
      }
      else if (v21)
      {
        goto LABEL_13;
      }
      v54 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        v57 = v54;
        v58 = [(id)v72 shortOperationDescription];
        id v59 = *(id *)(v72 + 384);
        uint64_t v60 = objc_opt_class();
        *(_DWORD *)v89 = v63;
        *(void *)&v89[4] = v58;
        __int16 v90 = 2112;
        v91 = (char *)v60;
        __int16 v92 = 2112;
        v93[0] = v16;
        _os_log_error_impl(&dword_1A460D000, v57, OS_LOG_TYPE_ERROR, "%{public}@ migrator %@ failed to migrate record %@", v89, 0x20u);

        if (v22) {
          goto LABEL_18;
        }
LABEL_23:
        v61 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v88 = v67;
        *(void *)v89 = @"Failed to migrate record but received no error";
        v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1, v63);
        id v22 = [v61 errorWithDomain:@"FCErrorDomain" code:16 userInfo:v21];
        v29 = 0;
LABEL_14:

        goto LABEL_19;
      }
      if (!v22) {
        goto LABEL_23;
      }
LABEL_18:
      v29 = 0;
LABEL_19:
      id v55 = v22;

      id v56 = v55;
      if (!v29) {
        goto LABEL_26;
      }
      [v71 addObject:v29];

      ++v15;
    }
    while (v70 != v15);
    uint64_t v62 = [obj countByEnumeratingWithState:&v79 objects:buf count:16];
    uint64_t v70 = v62;
  }
  while (v62);
  id v56 = 0;
LABEL_26:
  id v6 = v64;
  id v5 = v65;
LABEL_28:

  v74((uint64_t)v66, v71, v56);
LABEL_29:
}

id __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 376);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)[v5 initWithRecordName:v4 zoneID:v7];

  return v8;
}

void __85__FCCKDatabaseZoneMigrationOperation__migrateIndividualRecordsWithCompletionHandler___block_invoke_2(void *a1, void *a2)
{
  id v5 = a2;
  if (!v5)
  {
    uint64_t v3 = a1[4];
    if (v3) {
      id v4 = *(void **)(v3 + 424);
    }
    else {
      id v4 = 0;
    }
    [v4 addObjectsFromArray:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __83__FCCKDatabaseZoneMigrationOperation__gatherRecordsToMigrateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v5;
    v9 = v8;
    if (v7)
    {
      *(void *)v23 = MEMORY[0x1E4F143A8];
      *(void *)&v23[8] = 3221225472;
      *(void *)&v23[16] = __52__FCCKDatabaseZoneMigrationOperation__pruneRecords___block_invoke;
      v24 = &unk_1E5B4D118;
      uint64_t v25 = v7;
      uint64_t v10 = objc_msgSend(v8, "fc_arrayByRemovingObjectsPassingTest:", v23);
      uint64_t v11 = *(void **)(v7 + 392);
      if (v11)
      {
        id v12 = *(id *)(v7 + 376);
        id v13 = v11;
        long long v14 = [v12 zoneName];
        uint64_t v15 = [v13 pruneRecords:v10 forZoneName:v14];

        uint64_t v10 = (void *)v15;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }

    uint64_t v16 = [v10 count];
    if (v16 != [v9 count])
    {
      v17 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void **)(a1 + 32);
        id v19 = v17;
        id v20 = [v18 shortOperationDescription];
        uint64_t v21 = [v9 count];
        uint64_t v22 = [v10 count];
        *(_DWORD *)v23 = 138543874;
        *(void *)&v23[4] = v20;
        *(_WORD *)&v23[12] = 2048;
        *(void *)&v23[14] = v21;
        *(_WORD *)&v23[22] = 2048;
        v24 = (void *)v22;
        _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ pruned %lu records down to %lu", v23, 0x20u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_continueGatheringRecordsWithPreviousServerChangeToken:(void *)a3 recordsAlreadyFetched:(void *)a4 completionHandler:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = a2;
    uint64_t v10 = objc_alloc_init(FCCKPrivateFetchRecordZoneChangesOperation);
    [(FCCKPrivateFetchRecordZoneChangesOperation *)v10 setRecordZoneID:a1[47]];
    [(FCCKPrivateFetchRecordZoneChangesOperation *)v10 setPreviousServerChangeToken:v9];

    [(FCCKPrivateDatabaseOperation *)v10 setSkipPreflight:1];
    [(FCCKPrivateDatabaseOperation *)v10 setHandleIdentityLoss:0];
    [(FCCKPrivateFetchRecordZoneChangesOperation *)v10 setFetchNewestChangesFirst:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke;
    v11[3] = &unk_1E5B55968;
    v11[4] = a1;
    id v13 = v8;
    id v12 = v7;
    [(FCCKPrivateFetchRecordZoneChangesOperation *)v10 setFetchRecordZoneChangesCompletionBlock:v11];
    [a1 associateChildOperation:v10];
    -[FCCKPrivateDatabase addOperation:](a1[46], v10);
  }
}

void __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, int a5, void *a6)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  id v12 = a6;
  if (!objc_msgSend(v12, "fc_isMissingZoneError"))
  {
    if (v12)
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_16;
      v50[3] = &unk_1E5B4E088;
      v50[4] = *(void *)(a1 + 32);
      id v51 = v12;
      id v52 = *(id *)(a1 + 48);
      __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_16(v50);

      id v13 = v51;
      goto LABEL_5;
    }
    long long v14 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = v14;
      v17 = [v15 shortOperationDescription];
      uint64_t v18 = [v10 count];
      id v19 = @"no";
      *(_DWORD *)buf = 138544130;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&uint8_t buf[4] = v17;
      if (a5) {
        id v19 = @"yes";
      }
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      id v56 = v11;
      LOWORD(v57) = 2112;
      *(void *)((char *)&v57 + 2) = v19;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch-changes returned %lu records, token %@, more coming %@", buf, 0x2Au);
    }
    id v20 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", v10, *(void *)(a1 + 40));
    if ((a5 & 1) == 0)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_24;
      v47 = &unk_1E5B4C7C0;
      uint64_t v49 = (void (**)(id, id, void))*(id *)(a1 + 48);
      id v48 = v20;
      v49[2](v49, v48, 0);

      v31 = v49;
LABEL_25:

LABEL_28:
      goto LABEL_6;
    }
    uint64_t v21 = *(void *)(a1 + 32);
    id v40 = v10;
    id v39 = v20;
    if (v21)
    {
      uint64_t v22 = *(void **)(v21 + 392);
      id v23 = *(id *)(v21 + 376);
      id v24 = v22;
      uint64_t v25 = [v23 zoneName];
      [v24 softMaxRecordAgeWhenMigratingZoneName:v25];
      double v27 = v26;

      if (v27 == 0.0)
      {
        int v30 = 0;
      }
      else
      {
        v28 = [MEMORY[0x1E4F1C9C8] date];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __97__FCCKDatabaseZoneMigrationOperation__shouldStopGatheringAfterFetchingRecords_cumulativeRecords___block_invoke;
        id v56 = &unk_1E5B55990;
        *(void *)&long long v57 = v28;
        *((double *)&v57 + 1) = v27;
        id v29 = v28;
        int v30 = objc_msgSend(v40, "fc_containsObjectPassingTest:", buf);
      }
      v32 = *(void **)(v21 + 392);
      id v33 = *(id *)(v21 + 376);
      id v34 = v32;
      v35 = [v33 zoneName];
      unint64_t v36 = [v34 softMaxRecordCountWhenMigratingZoneName:v35];

      if (v36)
      {
        uint64_t v37 = v39;
        if ([v39 count] >= v36) {
          char v38 = 1;
        }
        else {
          char v38 = v30;
        }

        if ((v38 & 1) == 0) {
          goto LABEL_27;
        }
        goto LABEL_24;
      }
      uint64_t v37 = v39;

      if (v30)
      {
LABEL_24:
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2_25;
        v41[3] = &unk_1E5B4E088;
        v41[4] = *(void *)(a1 + 32);
        id v42 = v37;
        id v43 = *(id *)(a1 + 48);
        __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2_25((uint64_t)v41);

        v31 = v42;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v37 = v39;
    }
LABEL_27:
    -[FCCKDatabaseZoneMigrationOperation _continueGatheringRecordsWithPreviousServerChangeToken:recordsAlreadyFetched:completionHandler:](*(void *)(a1 + 32), v11, v37, *(void *)(a1 + 48));
    goto LABEL_28;
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2;
  v53[3] = &unk_1E5B4CC80;
  v53[4] = *(void *)(a1 + 32);
  id v54 = *(id *)(a1 + 48);
  __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2((uint64_t)v53);
  id v13 = v54;
LABEL_5:

LABEL_6:
}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (id)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) shortOperationDescription];
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      id v4 = (void *)v4[47];
    }
    id v5 = v4;
    uint64_t v6 = [v5 zoneName];
    int v8 = 138543618;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch-changes returned empty because zone '%@' doesn't exist", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_16(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)a1[4];
    id v5 = v2;
    uint64_t v6 = [v4 shortOperationDescription];
    uint64_t v7 = a1[5];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ fetch-changes failed with error %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __133__FCCKDatabaseZoneMigrationOperation__continueGatheringRecordsWithPreviousServerChangeToken_recordsAlreadyFetched_completionHandler___block_invoke_2_25(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 shortOperationDescription];
    uint64_t v6 = [*(id *)(a1 + 40) count];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch-changes is stopping early with %lu records because we've reached our soft limits", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __97__FCCKDatabaseZoneMigrationOperation__shouldStopGatheringAfterFetchingRecords_cumulativeRecords___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a2 modificationDate];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 >= *(double *)(a1 + 40);

  return v6;
}

void __74__FCCKDatabaseZoneMigrationOperation__migrateRecordIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && !objc_msgSend(v6, "fc_isCKUnknownItemError"))
  {
    uint64_t v16 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 32);
      uint64_t v18 = v16;
      id v19 = [v17 shortOperationDescription];
      int v20 = 138543618;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v7;
      _os_log_error_impl(&dword_1A460D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ fetch failed with error %@", (uint8_t *)&v20, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      __int16 v10 = v8;
      uint64_t v11 = [v9 shortOperationDescription];
      uint64_t v12 = [v5 count];
      uint64_t v13 = [*(id *)(a1 + 40) count];
      int v20 = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ fetch returned %lu of %lu records", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = [v5 allValues];
    -[FCCKDatabaseZoneMigrationOperation _migrateAndUpdateRecords:completion:](v14, v15, *(void **)(a1 + 48));
  }
}

uint64_t __52__FCCKDatabaseZoneMigrationOperation__pruneRecords___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = *(void **)(v3 + 384);
    uint64_t v5 = *(void *)(v3 + 368);
  }
  else
  {
    id v4 = 0;
    uint64_t v5 = 0;
  }
  id v6 = v4;
  uint64_t v7 = [v6 databaseMigrationShouldDropRecord:a2 database:v5];

  return v7;
}

uint64_t __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

void __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(void **)(a1 + 32);
    id v9 = v7;
    __int16 v10 = [v8 shortOperationDescription];
    uint64_t v11 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138543874;
    id v52 = v10;
    __int16 v53 = 2048;
    uint64_t v54 = v11;
    __int16 v55 = 2048;
    uint64_t v56 = [v5 count];
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ migration of %lu records produced %lu records to save", buf, 0x20u);
  }
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v41 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v5;
    id v39 = v13;
    if (v12)
    {
      uint64_t v14 = v13;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v16 = *(id *)(v12 + 408);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:buf count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v48;
        uint64_t v21 = *MEMORY[0x1E4F19D88];
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = [*(id *)(*((void *)&v47 + 1) + 8 * i) recordID];
            __int16 v24 = [v23 zoneID];

            uint64_t v25 = [v24 zoneName];
            if (([v16 containsObject:v25] & 1) == 0
              && ([v25 isEqualToString:v21] & 1) == 0)
            {
              [v15 addObject:v24];
              [v16 addObject:v25];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:buf count:16];
        }
        while (v19);
      }
    }
    else
    {
      id v15 = 0;
    }

    uint64_t v26 = [v15 count];
    double v27 = *(uint64_t **)(a1 + 32);
    id v6 = 0;
    if (v26)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_33;
      v42[3] = &unk_1E5B55918;
      v42[4] = v27;
      id v43 = v39;
      id v44 = *(id *)(a1 + 48);
      id v28 = v15;
      id v29 = v42;
      int v30 = v29;
      if (v27)
      {
        id v40 = v29;
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v28, "count"));
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v32 = v28;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:buf count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v48 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(*((void *)&v47 + 1) + 8 * j)];
              [v31 addObject:v37];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:buf count:16];
          }
          while (v34);
        }

        char v38 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
        [(FCCKPrivateSaveRecordZonesOperation *)v38 setRecordZonesToSave:v31];
        [(FCCKPrivateDatabaseOperation *)v38 setSkipPreflight:1];
        [(FCCKPrivateDatabaseOperation *)v38 setHandleIdentityLoss:0];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __62__FCCKDatabaseZoneMigrationOperation__createZones_completion___block_invoke;
        v45[3] = &unk_1E5B559D8;
        int v30 = v40;
        id v46 = v40;
        [(FCCKPrivateSaveRecordZonesOperation *)v38 setSaveRecordZonesCompletionBlock:v45];
        [v27 associateChildOperation:v38];
        -[FCCKPrivateDatabase addOperation:](v27[46], v38);
      }
      id v6 = 0;
    }
    else
    {
      -[FCCKDatabaseZoneMigrationOperation _saveMigratedRecords:completion:](*(void **)(a1 + 32), v39, *(void **)(a1 + 48));
    }

    id v5 = v41;
  }
}

void __74__FCCKDatabaseZoneMigrationOperation__migrateAndUpdateRecords_completion___block_invoke_33(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    -[FCCKDatabaseZoneMigrationOperation _saveMigratedRecords:completion:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
}

- (void)_saveMigratedRecords:(void *)a3 completion:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 count])
    {
      uint64_t v7 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = v7;
        id v9 = [a1 shortOperationDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v9;
        __int16 v25 = 2048;
        uint64_t v26 = [v5 count];
        _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to write %lu records", buf, 0x16u);
      }
      __int16 v10 = objc_alloc_init(FCCKPrivateBatchedSaveRecordsOperation);
      [(FCCKPrivateBatchedSaveRecordsOperation *)v10 setDatabase:a1[46]];
      [(FCCKPrivateBatchedSaveRecordsOperation *)v10 setRecordsToSave:v5];
      [(FCCKPrivateBatchedSaveRecordsOperation *)v10 setSavePolicy:0];
      [(FCCKPrivateBatchedSaveRecordsOperation *)v10 setSkipPreflight:1];
      [(FCCKPrivateBatchedSaveRecordsOperation *)v10 setHandleIdentityLoss:0];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      id v13 = __70__FCCKDatabaseZoneMigrationOperation__saveMigratedRecords_completion___block_invoke_35;
      uint64_t v14 = &unk_1E5B54DC0;
      id v15 = a1;
      id v16 = v5;
      id v17 = v6;
      [(FCCKPrivateBatchedSaveRecordsOperation *)v10 setSaveRecordsCompletionBlock:&v11];
      objc_msgSend(a1, "associateChildOperation:", v10, v11, v12, v13, v14, v15);
      [(FCOperation *)v10 start];
    }
    else
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __70__FCCKDatabaseZoneMigrationOperation__saveMigratedRecords_completion___block_invoke;
      uint64_t v21 = &unk_1E5B4CA88;
      __int16 v22 = (FCCKPrivateBatchedSaveRecordsOperation *)v6;
      ((void (*)(FCCKPrivateBatchedSaveRecordsOperation *, void))v22->super.super._iop.__nextOp)(v22, 0);
      __int16 v10 = v22;
    }
  }
}

uint64_t __70__FCCKDatabaseZoneMigrationOperation__saveMigratedRecords_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__FCCKDatabaseZoneMigrationOperation__saveMigratedRecords_completion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && !objc_msgSend(v6, "fc_isCKErrorWithCode:", 14))
  {
    id v15 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      id v16 = *(void **)(a1 + 32);
      id v17 = v15;
      uint64_t v18 = [v16 shortOperationDescription];
      int v19 = 138543618;
      uint64_t v20 = v18;
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v7;
      _os_log_error_impl(&dword_1A460D000, v17, OS_LOG_TYPE_ERROR, "%{public}@ save failed with error %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    int v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      __int16 v10 = v8;
      uint64_t v11 = [v9 shortOperationDescription];
      uint64_t v12 = [v5 count];
      uint64_t v13 = [*(id *)(a1 + 40) count];
      int v19 = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = v12;
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully wrote %lu of %lu records", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v14();
}

uint64_t __62__FCCKDatabaseZoneMigrationOperation__createZones_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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
    objc_storeStrong((id *)(a1 + 384), a2);
  }
}

- (void)setPruningAssistant:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordIDsEligibleForDeletion, 0);
  objc_storeStrong((id *)&self->_resultZoneIDsEligibleForDeletion, 0);
  objc_storeStrong((id *)&self->_createdZones, 0);
  objc_storeStrong(&self->_migrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pruningAssistant, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end