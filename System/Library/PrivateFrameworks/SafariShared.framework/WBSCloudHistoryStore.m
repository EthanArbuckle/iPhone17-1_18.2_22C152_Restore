@interface WBSCloudHistoryStore
- (BOOL)_shouldTryToResetRecordZoneForError:(id)a3;
- (BOOL)useManateeContainer;
- (WBSCloudHistoryStore)initWithConfiguration:(id)a3 useManateeContainer:(BOOL)a4;
- (id)_prepareRecordZoneWithoutCachingWithError:(id *)a3;
- (id)_recordDataForDictionary:(id)a3;
- (id)_recordWithCloudHistoryVisits:(id)a3 profileServerIdentifier:(id)a4;
- (id)_recordWithHistoryTombstones:(id)a3 version:(unint64_t)a4;
- (id)_recordWithType:(id)a3 version:(unint64_t)a4 dataDictionary:(id)a5;
- (id)_recordsWithCloudHistoryVisits:(id)a3;
- (void)_batchSaveRecords:(id)a3 useLongLivedOperation:(BOOL)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6;
- (void)_configureFetchChangesOperation:(id)a3;
- (void)_fetchAllRecordsWithQueryOperation:(id)a3 enumerationBlock:(id)a4 completionBlock:(id)a5;
- (void)_fetchRecordsWithServerChangeToken:(id)a3 numberOfFetchRecordsOperationsPerformedSoFar:(unint64_t)a4 result:(id)a5 completion:(id)a6;
- (void)_prepareRecordZoneWithCompletion:(id)a3;
- (void)_resetRecordZone;
- (void)_saveCloudHistoryVisits:(id)a3 tombstones:(id)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6;
- (void)_saveRecords:(id)a3 withCompletion:(id)a4;
- (void)_scheduleOperation:(id)a3;
- (void)deleteHistoryZoneWithCompletion:(id)a3;
- (void)fetchNumberOfDevicesInSyncCircleWithCompletion:(id)a3;
- (void)fetchRecordsForProfileServerIdentifier:(id)a3 completion:(id)a4;
- (void)fetchRecordsWithServerChangeTokenData:(id)a3 completion:(id)a4;
- (void)initializePushNotifications:(id)a3;
- (void)replayPersistedLongLivedSaveOperationWithID:(id)a3 completion:(id)a4;
- (void)saveCloudHistoryVisits:(id)a3 tombstones:(id)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6;
@end

@implementation WBSCloudHistoryStore

- (WBSCloudHistoryStore)initWithConfiguration:(id)a3 useManateeContainer:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSCloudHistoryStore;
  v8 = [(WBSCloudHistoryStore *)&v22 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SafariShared.WBSCloudHistoryStore", 0);
    databaseQueue = v8->_databaseQueue;
    v8->_databaseQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    cloudKitOperationQueue = v8->_cloudKitOperationQueue;
    v8->_cloudKitOperationQueue = (NSOperationQueue *)v11;

    [(NSOperationQueue *)v8->_cloudKitOperationQueue setQualityOfService:17];
    v13 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSCloudHistoryStore.%@.%p.operationQueue", objc_opt_class(), v8];
    [(NSOperationQueue *)v8->_cloudKitOperationQueue setName:v13];

    objc_storeStrong((id *)&v8->_configuration, a3);
    if (NSClassFromString(&cfstr_Ckdatabase.isa))
    {
      v8->_useManateeContainer = v4;
      if (v4) {
        objc_msgSend(MEMORY[0x1E4F19EC0], "safari_historyManateeContainer");
      }
      else {
      v14 = objc_msgSend(MEMORY[0x1E4F19EC0], "safari_historyContainer");
      }
      uint64_t v15 = [v14 privateCloudDatabase];
      database = v8->_database;
      v8->_database = (CKDatabase *)v15;

      id v17 = objc_alloc(MEMORY[0x1E4F1A328]);
      uint64_t v18 = [v17 initWithZoneName:@"History" ownerName:*MEMORY[0x1E4F19CC0]];
      recordZoneID = v8->_recordZoneID;
      v8->_recordZoneID = (CKRecordZoneID *)v18;
    }
    v20 = v8;
  }

  return v8;
}

- (void)initializePushNotifications:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_2;
  v4[3] = &unk_1E5C8DD50;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _prepareRecordZoneWithCompletion:v4];
}

void __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1A1E8]);
    [v5 setShouldSendContentAvailable:1];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A338]) initWithZoneID:*(void *)(*(void *)(a1 + 32) + 32) subscriptionID:@"ZoneSubscription"];
    [v6 setNotificationInfo:v5];
    id v7 = objc_alloc(MEMORY[0x1E4F1A1B0]);
    v12[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    dispatch_queue_t v9 = (void *)[v7 initWithSubscriptionsToSave:v8 subscriptionIDsToDelete:0];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_3;
    v10[3] = &unk_1E5C8DD28;
    id v11 = *(id *)(a1 + 40);
    [v9 setModifySubscriptionsCompletionBlock:v10];
    [*(id *)(a1 + 32) _scheduleOperation:v9];
  }
}

uint64_t __52__WBSCloudHistoryStore_initializePushNotifications___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldTryToResetRecordZoneForError:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 26) & 1) != 0
    || (objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 28) & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 5001);
  }

  return v4;
}

- (void)saveCloudHistoryVisits:(id)a3 tombstones:(id)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke;
  block[3] = &unk_1E5C8DD78;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(databaseQueue, block);
}

void __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke_2;
  v5[3] = &unk_1E5C8DC00;
  v5[4] = v1;
  id v6 = *(id *)(a1 + 64);
  [v1 _saveCloudHistoryVisits:v2 tombstones:v3 longLivedOperationPersistenceCompletion:v4 completion:v5];
}

void __109__WBSCloudHistoryStore_saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldTryToResetRecordZoneForError:")) {
    [*(id *)(a1 + 32) _resetRecordZone];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_saveCloudHistoryVisits:(id)a3 tombstones:(id)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  v41 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 count])
  {
    uint64_t v14 = [(WBSCloudHistoryStore *)self _recordsWithCloudHistoryVisits:v10];
    if (!v14)
    {
      v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistoryStoreErrorDomain" code:1 userInfo:0];
      v13[2](v13, v36);

      goto LABEL_32;
    }
    id v15 = (void *)v14;
    [v41 addObjectsFromArray:v14];
  }
  v37 = v13;
  id v38 = v12;
  id v39 = v11;
  id v40 = v10;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v46;
    uint64_t v20 = *MEMORY[0x1E4F980C8];
LABEL_6:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v46 != v19) {
        objc_enumerationMutation(v16);
      }
      id v22 = *(void **)(*((void *)&v45 + 1) + 8 * v21);
      id v23 = [v16 objectForKeyedSubscript:v22];
      if (([v22 isEqualToString:v20] & 1) == 0)
      {
        if ([v23 count]) {
          break;
        }
      }
      if ([v23 count])
      {
        v26 = [MEMORY[0x1E4F1CA48] array];
        v27 = [MEMORY[0x1E4F1CA48] array];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __110__WBSCloudHistoryStore__saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke;
        v42[3] = &unk_1E5C8DDA0;
        id v25 = v26;
        id v43 = v25;
        id v28 = v27;
        id v44 = v28;
        [v23 enumerateObjectsUsingBlock:v42];
        if ([v25 count])
        {
          uint64_t v29 = [(WBSCloudHistoryStore *)self _recordWithHistoryTombstones:v25 version:2];
          if (!v29) {
            goto LABEL_26;
          }
          v30 = (void *)v29;
          [v41 addObject:v29];
        }
        if ([v28 count])
        {
          uint64_t v31 = [(WBSCloudHistoryStore *)self _recordWithHistoryTombstones:v28 version:1];
          if (!v31)
          {
LABEL_26:
            v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistoryStoreErrorDomain" code:1 userInfo:0];
            id v13 = v37;
            v37[2](v37, v35);

LABEL_29:
            goto LABEL_31;
          }
          v32 = (void *)v31;
          [v41 addObject:v31];
        }
        goto LABEL_21;
      }
LABEL_22:

      if (v18 == ++v21)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v18) {
          goto LABEL_6;
        }
        goto LABEL_24;
      }
    }
    v24 = [(WBSCloudHistoryStore *)self _recordWithHistoryTombstones:v23 version:3];
    if (!v24)
    {
      id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistoryStoreErrorDomain" code:1 userInfo:0];
      id v13 = v37;
      v37[2](v37, v25);
      goto LABEL_29;
    }
    id v25 = v24;
    [v24 setObject:v22 forKeyedSubscript:@"ProfileUUID"];
    [v41 addObject:v25];
LABEL_21:

    goto LABEL_22;
  }
LABEL_24:

  BOOL v33 = [(WBSCloudHistoryConfiguration *)self->_configuration shouldBatchSaveRecords];
  v34 = (void *)[v41 mutableCopy];
  if (v33)
  {
    id v13 = v37;
    id v12 = v38;
    [(WBSCloudHistoryStore *)self _batchSaveRecords:v34 useLongLivedOperation:[(WBSCloudHistoryConfiguration *)self->_configuration shouldUseLongLivedOperationsToSaveRecords] longLivedOperationPersistenceCompletion:v38 completion:v37];

    id v11 = v39;
    id v10 = v40;
  }
  else
  {
    id v13 = v37;
    [(WBSCloudHistoryStore *)self _saveRecords:v34 withCompletion:v37];

LABEL_31:
    id v11 = v39;
    id v10 = v40;
    id v12 = v38;
  }
LABEL_32:
}

void __110__WBSCloudHistoryStore__saveCloudHistoryVisits_tombstones_longLivedOperationPersistenceCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = [v5 isSecure];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

- (void)_saveRecords:(id)a3 withCompletion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 lastObject];
    [v6 removeLastObject];
    id v9 = objc_alloc(MEMORY[0x1E4F1A1A0]);
    v15[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v11 = (void *)[v9 initWithRecordsToSave:v10 recordIDsToDelete:0];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke;
    v12[3] = &unk_1E5C8DDC8;
    id v14 = v7;
    v12[4] = self;
    id v13 = v6;
    [v11 setPerRecordCompletionBlock:v12];
    [(WBSCloudHistoryStore *)self _scheduleOperation:v11];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    NSLog(&cfstr_FailedToSaveRe.isa, v4);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke_2;
    block[3] = &unk_1E5C8C8F8;
    block[4] = v6;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
  }
}

uint64_t __52__WBSCloudHistoryStore__saveRecords_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveRecords:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_batchSaveRecords:(id)a3 useLongLivedOperation:(BOOL)a4 longLivedOperationPersistenceCompletion:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (objc_class *)MEMORY[0x1E4F1A1A0];
  id v13 = a3;
  id v14 = (void *)[[v12 alloc] initWithRecordsToSave:v13 recordIDsToDelete:0];

  if (v10 && v7)
  {
    id v15 = [v14 operationID];
    [v14 setLongLived:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke;
    v20[3] = &unk_1E5C8DDF0;
    id v21 = v15;
    id v22 = v10;
    id v16 = v15;
    [v14 setLongLivedOperationWasPersistedBlock:v20];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2;
  v18[3] = &unk_1E5C8DD28;
  id v19 = v11;
  id v17 = v11;
  [v14 setModifyRecordsCompletionBlock:v18];
  [(WBSCloudHistoryStore *)self _scheduleOperation:v14];
}

uint64_t __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2_cold_1(v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_recordsWithCloudHistoryVisits:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v33 = [MEMORY[0x1E4F1CA48] array];
  v37 = [MEMORY[0x1E4F1CA48] array];
  v34 = self;
  unint64_t v5 = [(WBSCloudHistoryConfiguration *)self->_configuration maximumRequestCharacterCount];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v4;
  uint64_t v31 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v31)
  {
    uint64_t v7 = 0;
    uint64_t v28 = *MEMORY[0x1E4F980C8];
    uint64_t v29 = *(void *)v43;
    v30 = v6;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
        id v10 = [v6 objectForKeyedSubscript:v9];
        if ([v9 isEqualToString:v28]) {
          id v11 = 0;
        }
        else {
          id v11 = v9;
        }
        id v35 = v11;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = v10;
        uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
        uint64_t v32 = v8;
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(obj);
              }
              id v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              id v17 = [v16 visitIdentifier];
              uint64_t v18 = [v17 urlString];
              uint64_t v19 = [v18 length];
              uint64_t v20 = [v16 title];
              unint64_t v21 = [v20 length] + v19;

              if (v21 <= v5)
              {
                if (v21 + v7 > v5)
                {
                  v24 = [(WBSCloudHistoryStore *)v34 _recordWithCloudHistoryVisits:v37 profileServerIdentifier:v35];
                  if (v24) {
                    [v33 addObject:v24];
                  }
                  [v37 removeAllObjects];

                  uint64_t v7 = 0;
                }
                [v37 addObject:v16];
                v7 += v21;
              }
              else
              {
                id v22 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  long long v47 = v16;
                  _os_log_error_impl(&dword_1A6B5F000, v22, OS_LOG_TYPE_ERROR, "Skipping large WBSCloudHistoryVisit: %p", buf, 0xCu);
                }
                id v23 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138477827;
                  long long v47 = v16;
                  _os_log_debug_impl(&dword_1A6B5F000, v23, OS_LOG_TYPE_DEBUG, "Skipping large WBSCloudHistoryVisit: %{private}@", buf, 0xCu);
                }
              }
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
          }
          while (v13);
        }

        id v6 = v30;
        if ([v37 count])
        {
          id v25 = [(WBSCloudHistoryStore *)v34 _recordWithCloudHistoryVisits:v37 profileServerIdentifier:v35];
          if (!v25)
          {

            v26 = v33;
            goto LABEL_33;
          }
          [v33 addObject:v25];
          [v37 removeAllObjects];
        }
        uint64_t v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  v26 = v33;
  id v25 = v33;
LABEL_33:

  return v25;
}

- (id)_recordWithCloudHistoryVisits:(id)a3 profileServerIdentifier:(id)a4
{
  uint64_t v29 = self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v30 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "dictionaryRepresentation", v29);
        if (v13)
        {
          [v6 addObject:v13];
        }
        else
        {
          uint64_t v14 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            long long v38 = v12;
            _os_log_error_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_ERROR, "Skipping invalid WBSCloudHistoryVisit: %{private}@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }

  v35[0] = @"Visits";
  v35[1] = @"ClientVersion";
  v36[0] = v6;
  v36[1] = &unk_1EFC22570;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  if (v30) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  id v17 = [(WBSCloudHistoryStore *)v29 _recordWithType:@"Visits", v16, v15, v29 version dataDictionary];
  uint64_t v18 = v17;
  if (v30) {
    [v17 setObject:v30 forKeyedSubscript:@"ProfileUUID"];
  }
  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    uint64_t v20 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[WBSCloudHistoryStore _recordWithCloudHistoryVisits:profileServerIdentifier:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }

  return v18;
}

- (id)_recordWithHistoryTombstones:(id)a3 version:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (void)v27);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v10);
  }

  v31[0] = @"Tombstones";
  v31[1] = @"ClientVersion";
  v32[0] = v7;
  v32[1] = &unk_1EFC22570;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  id v15 = [(WBSCloudHistoryStore *)self _recordWithType:@"Tombstones" version:a4 dataDictionary:v14];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    uint64_t v18 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WBSCloudHistoryStore _recordWithHistoryTombstones:version:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }

  return v16;
}

- (void)replayPersistedLongLivedSaveOperationWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke;
  block[3] = &unk_1E5C8C8F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

void __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  int v3 = [*(id *)(*(void *)(a1 + 32) + 24) container];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_32;
  v9[3] = &unk_1E5C8DE18;
  uint64_t v11 = &v12;
  id v5 = v2;
  id v10 = v5;
  [v3 fetchLongLivedOperationWithID:v4 completionHandler:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v13[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = (id)v13[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_2;
    v7[3] = &unk_1E5C8DD28;
    id v8 = *(id *)(a1 + 48);
    [v6 setModifyRecordsCompletionBlock:v7];
    [*(id *)(a1 + 32) _scheduleOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(&v12, 8);
}

void __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_32(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __79__WBSCloudHistoryStore_replayPersistedLongLivedSaveOperationWithID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRecordsWithServerChangeTokenData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke;
  block[3] = &unk_1E5C8C8F8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = objc_alloc_init(WBSCloudHistoryFetchResult);
  if (*(void *)(a1 + 32))
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28DC0]);
    uint64_t v4 = *(void *)(a1 + 32);
    v13[0] = 0;
    id v5 = (void *)[v3 initForReadingFromData:v4 error:v13];
    id v6 = v13[0];
    if (v6)
    {
      id v7 = (id)WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_msgSend(v6, "safari_privacyPreservingDescription");
        __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_cold_2(v8, buf, v7);
      }
    }
    id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v5 finishDecoding];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_37;
  v11[3] = &unk_1E5C8DE40;
  v11[4] = v10;
  id v12 = *(id *)(a1 + 48);
  [v10 _fetchRecordsWithServerChangeToken:v9 numberOfFetchRecordsOperationsPerformedSoFar:1 result:v2 completion:v11];
}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_37(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v6 = a4;
  if ([*(id *)(a1 + 32) _shouldTryToResetRecordZoneForError:v6]) {
    [*(id *)(a1 + 32) _resetRecordZone];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_configureFetchChangesOperation:(id)a3
{
  id v3 = a3;
  [v3 setFetchAllChanges:0];
  id v4 = [v3 configuration];
  [v3 setConfiguration:v4];
}

- (void)_fetchRecordsWithServerChangeToken:(id)a3 numberOfFetchRecordsOperationsPerformedSoFar:(unint64_t)a4 result:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A050]) initWithRecordZoneID:self->_recordZoneID previousServerChangeToken:v10];
  [(WBSCloudHistoryStore *)self _configureFetchChangesOperation:v13];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke;
  v26[3] = &unk_1E5C8DE68;
  id v14 = v11;
  id v27 = v14;
  long long v28 = self;
  [v13 setRecordChangedBlock:v26];
  objc_initWeak(&location, v13);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2;
  uint64_t v20 = &unk_1E5C8DEB8;
  id v15 = v12;
  id v23 = v15;
  id v16 = v14;
  id v21 = v16;
  v24[1] = (id)a4;
  objc_copyWeak(v24, &location);
  uint64_t v22 = self;
  [v13 setFetchRecordChangesCompletionBlock:&v17];
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v13, v17, v18, v19, v20);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
}

uint64_t __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendRecord:a2 usingConfiguration:*(void *)(*(void *)(a1 + 40) + 48)];
}

void __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    int v8 = [WeakRetained moreComing];

    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(NSObject **)(v9 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_3;
      block[3] = &unk_1E5C8DE90;
      void block[4] = v9;
      id v11 = v6;
      uint64_t v12 = *(void *)(a1 + 64);
      id v18 = v11;
      uint64_t v21 = v12;
      id v19 = *(id *)(a1 + 32);
      id v20 = *(id *)(a1 + 48);
      dispatch_async(v10, block);
    }
    else
    {
      id v16 = 0;
      id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v16];
      id v14 = v16;
      if (v14)
      {
        id v15 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2_cold_1(v15);
        }
      }
      [*(id *)(a1 + 32) _setServerChangeTokenData:v13];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRecordsWithServerChangeToken:*(void *)(a1 + 40) numberOfFetchRecordsOperationsPerformedSoFar:*(void *)(a1 + 64) + 1 result:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_scheduleOperation:(id)a3
{
  database = self->_database;
  id v5 = a3;
  [v5 setDatabase:database];
  id v6 = [v5 configuration];
  [v5 setConfiguration:v6];
  [(NSOperationQueue *)self->_cloudKitOperationQueue addOperation:v5];
}

- (id)_recordWithType:(id)a3 version:(unint64_t)a4 dataDictionary:(id)a5
{
  int v8 = (objc_class *)MEMORY[0x1E4F1A2D0];
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithRecordType:v10 zoneID:self->_recordZoneID];

  uint64_t v12 = [(WBSCloudHistoryStore *)self _recordDataForDictionary:v9];

  if (v12)
  {
    id v13 = objc_msgSend(v11, "safari_encryptedValues");
    [v13 setObject:v12 forKeyedSubscript:@"EncryptedData"];

    id v14 = [MEMORY[0x1E4F29128] UUID];
    id v15 = [v14 UUIDString];
    [v11 setObject:v15 forKeyedSubscript:@"UUID"];

    id v16 = [NSNumber numberWithUnsignedInteger:a4];
    [v11 setObject:v16 forKeyedSubscript:@"Version"];

    id v17 = v11;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_recordDataForDictionary:(id)a3
{
  if (a3)
  {
    id v8 = 0;
    id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      id v5 = objc_msgSend(v3, "safari_dataByCompressingData");
    }
    else
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[WBSCloudHistoryStore _recordDataForDictionary:](v6);
      }
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_prepareRecordZoneWithoutCachingWithError:(id *)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__4;
  long long v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = objc_alloc(MEMORY[0x1E4F1A088]);
  v33[0] = self->_recordZoneID;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v8 = (void *)[v6 initWithRecordZoneIDs:v7];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke;
  id v16 = &unk_1E5C8DF08;
  id v17 = self;
  id v19 = &v27;
  id v20 = &v21;
  id v9 = v5;
  id v18 = v9;
  [v8 setFetchRecordZonesCompletionBlock:&v13];
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v8, v13, v14, v15, v16, v17);
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistoryStoreErrorDomain" code:2 userInfo:0];
      id v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    if (a3) {
      *a3 = (id) v22[5];
    }
    id v11 = (id)v28[5];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a2 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A318]) initWithZoneID:*(void *)(*(void *)(a1 + 32) + 32)];
    id v9 = objc_alloc(MEMORY[0x1E4F1A188]);
    v15[0] = v8;
    dispatch_time_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v11 = (void *)[v9 initWithRecordZonesToSave:v10 recordZoneIDsToDelete:0];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke_2;
    v12[3] = &unk_1E5C8DEE0;
    int8x16_t v14 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v13 = *(id *)(a1 + 40);
    [v11 setModifyRecordZonesCompletionBlock:v12];
    [*(id *)(a1 + 32) _scheduleOperation:v11];
  }
}

void __66__WBSCloudHistoryStore__prepareRecordZoneWithoutCachingWithError___block_invoke_2(uint64_t a1, void *a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v11 = obj;
  id v7 = a2;
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_prepareRecordZoneWithCompletion:(id)a3
{
  if (self->_recordZone)
  {
    id v3 = (void (*)(void))*((void *)a3 + 2);
    id v4 = a3;
    v3();
  }
  else
  {
    id v10 = 0;
    id v6 = (void (**)(id, CKRecordZone *, id))a3;
    id v7 = [(WBSCloudHistoryStore *)self _prepareRecordZoneWithoutCachingWithError:&v10];
    id v4 = v10;
    recordZone = self->_recordZone;
    self->_recordZone = v7;
    uint64_t v9 = v7;

    v6[2](v6, self->_recordZone, v4);
  }
}

- (void)_resetRecordZone
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WBSCloudHistoryStore__resetRecordZone__block_invoke;
  block[3] = &unk_1E5C8C880;
  void block[4] = self;
  dispatch_async(databaseQueue, block);
}

uint64_t __40__WBSCloudHistoryStore__resetRecordZone__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Resetting Cloud History record zone.", v6, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  return [*(id *)(a1 + 32) _prepareRecordZoneWithCompletion:&__block_literal_global_18];
}

void __40__WBSCloudHistoryStore__resetRecordZone__block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __40__WBSCloudHistoryStore__resetRecordZone__block_invoke_51_cold_1(v4);
    }
  }
}

- (void)deleteHistoryZoneWithCompletion:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A188]);
  v7[0] = *(void *)(*(void *)(a1 + 32) + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = (void *)[v2 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v3];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5C8DD28;
  id v6 = *(id *)(a1 + 40);
  [v4 setModifyRecordZonesCompletionBlock:v5];
  [*(id *)(a1 + 32) _scheduleOperation:v4];
}

void __56__WBSCloudHistoryStore_deleteHistoryZoneWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  int v5 = objc_msgSend(v8, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 26);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v7 = v8;
    if (v5) {
      id v7 = 0;
    }
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

- (void)fetchNumberOfDevicesInSyncCircleWithCompletion:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v13 = 0;
  id v3 = [v2 _prepareRecordZoneWithoutCachingWithError:&v13];
  id v4 = v13;
  if (![v3 deviceCount])
  {
    int v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchAllRecordsWithQueryOperation:(id)a3 enumerationBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke;
  v21[3] = &unk_1E5C8DF50;
  id v10 = v8;
  id v22 = v10;
  id v11 = a3;
  [v11 setRecordMatchedBlock:v21];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke_2;
  id v17 = &unk_1E5C8DF78;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 setQueryCompletionBlock:&v14];
  -[WBSCloudHistoryStore _scheduleOperation:](self, "_scheduleOperation:", v11, v14, v15, v16, v17, v18);
}

uint64_t __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __92__WBSCloudHistoryStore__fetchAllRecordsWithQueryOperation_enumerationBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A2C0]) initWithCursor:v4];
    [v3 setZoneID:*(void *)(*(void *)(a1 + 32) + 32)];
    [*(id *)(a1 + 32) _fetchAllRecordsWithQueryOperation:v3 enumerationBlock:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchRecordsForProfileServerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(WBSCloudHistoryFetchResult);
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"ProfileUUID", v6];
  dispatch_group_t v10 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__4;
  v28[4] = __Block_byref_object_dispose__4;
  id v29 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke;
  v22[3] = &unk_1E5C8DFF0;
  id v11 = v10;
  uint64_t v23 = v11;
  id v12 = v9;
  id v24 = v12;
  uint64_t v25 = self;
  id v13 = v8;
  id v26 = v13;
  uint64_t v27 = v28;
  uint64_t v14 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v22);
  ((void (**)(void, __CFString *))v14)[2](v14, @"Visits");
  ((void (**)(void, __CFString *))v14)[2](v14, @"Tombstones");
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_6;
  block[3] = &unk_1E5C8E018;
  id v19 = v13;
  id v20 = v7;
  uint64_t v21 = v28;
  id v16 = v13;
  id v17 = v7;
  dispatch_group_notify(v11, databaseQueue, block);

  _Block_object_dispose(v28, 8);
}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A298]) initWithRecordType:v4 predicate:*(void *)(a1 + 40)];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2C0]) initWithQuery:v5];
  [v6 setZoneID:*(void *)(*(void *)(a1 + 48) + 32)];
  id v7 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E5C8DE68;
  void v12[4] = v7;
  id v13 = *(id *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_4;
  v9[3] = &unk_1E5C8DFC8;
  uint64_t v8 = *(void *)(a1 + 64);
  void v9[4] = *(void *)(a1 + 48);
  uint64_t v11 = v8;
  id v10 = *(id *)(a1 + 32);
  [v7 _fetchAllRecordsWithQueryOperation:v6 enumerationBlock:v12 completionBlock:v9];
}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5C8CD20;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendRecord:*(void *)(a1 + 40) usingConfiguration:*(void *)(*(void *)(a1 + 48) + 48)];
}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_5;
  block[3] = &unk_1E5C8DFA0;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_5(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v2);
  }
  id v3 = a1[5];
  dispatch_group_leave(v3);
}

uint64_t __74__WBSCloudHistoryStore_fetchRecordsForProfileServerIdentifier_completion___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (BOOL)useManateeContainer
{
  return self->_useManateeContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_cloudKitOperationQueue, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
}

void __115__WBSCloudHistoryStore__batchSaveRecords_useLongLivedOperation_longLivedOperationPersistenceCompletion_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to save Visits record: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_recordWithCloudHistoryVisits:(uint64_t)a3 profileServerIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_recordWithHistoryTombstones:(uint64_t)a3 version:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to decode server change token with exception: %{public}@", buf, 0xCu);
}

void __73__WBSCloudHistoryStore_fetchRecordsWithServerChangeTokenData_completion___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to read from server change token data: %{public}@", buf, 0xCu);
}

void __122__WBSCloudHistoryStore__fetchRecordsWithServerChangeToken_numberOfFetchRecordsOperationsPerformedSoFar_result_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to archive server change token: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_recordDataForDictionary:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to serialize dictionary: %{public}@", v6, v7, v8, v9, v10);
}

void __40__WBSCloudHistoryStore__resetRecordZone__block_invoke_51_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Resetting Cloud History record zone failed: %{public}@", v6, v7, v8, v9, v10);
}

void __71__WBSCloudHistoryStore_fetchNumberOfDevicesInSyncCircleWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end