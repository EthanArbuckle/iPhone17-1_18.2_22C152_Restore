@interface FCCKSecureDatabaseResetOperation
- (BOOL)deleteZones;
- (BOOL)restoreSecureSentinel;
- (BOOL)restoreZoneContents;
- (BOOL)validateOperation;
- (FCCKPrivateDatabase)database;
- (FCCKSecureDatabaseResetOperation)init;
- (id)_deleteZones;
- (id)_rawRecordsToSave;
- (id)_rawZoneIDsToDelete;
- (id)_rawZonesToRecreate;
- (id)_recreateZones;
- (id)_restoreSecureSentinel;
- (id)_restoreZoneContents;
- (id)resetCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDatabase:(id)a3;
- (void)setDeleteZones:(BOOL)a3;
- (void)setResetCompletionHandler:(id)a3;
- (void)setRestoreSecureSentinel:(BOOL)a3;
- (void)setRestoreZoneContents:(BOOL)a3;
@end

@implementation FCCKSecureDatabaseResetOperation

- (FCCKSecureDatabaseResetOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCCKSecureDatabaseResetOperation;
  result = [(FCOperation *)&v3 init];
  if (result)
  {
    result->_deleteZones = 1;
    result->_restoreSecureSentinel = 1;
    result->_restoreZoneContents = 1;
  }
  return result;
}

- (BOOL)validateOperation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(FCCKSecureDatabaseResetOperation *)self database];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"zone reset operation requires a private database"];
    int v10 = 136315906;
    v11 = "-[FCCKSecureDatabaseResetOperation validateOperation]";
    __int16 v12 = 2080;
    v13 = "FCCKSecureDatabaseResetOperation.m";
    __int16 v14 = 1024;
    int v15 = 43;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  v4 = [(FCCKSecureDatabaseResetOperation *)self database];
  if (v4 && (uint64_t v5 = v4[5], v4, v5 > 0))
  {
    BOOL v6 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)[[NSString alloc] initWithFormat:@"zone reset is only valid when encryption is enabled"];
      int v10 = 136315906;
      v11 = "-[FCCKSecureDatabaseResetOperation validateOperation]";
      __int16 v12 = 2080;
      v13 = "FCCKSecureDatabaseResetOperation.m";
      __int16 v14 = 1024;
      int v15 = 47;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
    BOOL v6 = 0;
  }
  return v3 && v6;
}

- (void)performOperation
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke;
  v19[3] = &unk_1E5B4E758;
  v19[4] = self;
  v13 = [MEMORY[0x1E4F81BF0] firstly:v19];
  objc_super v3 = zalgo();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_2;
  v18[3] = &unk_1E5B4DC20;
  v18[4] = self;
  v4 = [v13 thenOn:v3 then:v18];
  uint64_t v5 = zalgo();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_3;
  v17[3] = &unk_1E5B4DC20;
  v17[4] = self;
  BOOL v6 = [v4 thenOn:v5 then:v17];
  v7 = zalgo();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_4;
  v16[3] = &unk_1E5B4DC20;
  v16[4] = self;
  v8 = [v6 thenOn:v7 then:v16];
  v9 = zalgo();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_5;
  v15[3] = &unk_1E5B4DC20;
  v15[4] = self;
  int v10 = [v8 thenOn:v9 then:v15];
  v11 = zalgo();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_6;
  v14[3] = &unk_1E5B4FD28;
  v14[4] = self;
  id v12 = (id)[v10 errorOn:v11 error:v14];
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteZones];
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recreateZones];
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreSecureSentinel];
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreZoneContents];
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_5(uint64_t a1)
{
  return 0;
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v6 = a3;
  v4 = [(FCCKSecureDatabaseResetOperation *)self resetCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCCKSecureDatabaseResetOperation *)self resetCompletionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)_deleteZones
{
  if ([(FCCKSecureDatabaseResetOperation *)self deleteZones])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_2;
    v6[3] = &unk_1E5B4EEF0;
    v6[4] = self;
    v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    v4 = [MEMORY[0x1E4F81BF0] asVoid];
  }
  return v4;
}

void __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_alloc_init(FCCKPrivateDeleteRecordZonesOperation);
  v8 = [*(id *)(a1 + 32) database];
  [(FCCKPrivateDatabaseOperation *)v7 setDatabase:v8];

  v9 = [*(id *)(a1 + 32) _rawZoneIDsToDelete];
  [(FCCKPrivateDeleteRecordZonesOperation *)v7 setRecordZoneIDsToDelete:v9];

  [(FCCKPrivateDeleteRecordZonesOperation *)v7 setSecureDatabaseOnly:1];
  [(FCCKPrivateDatabaseOperation *)v7 setSkipPreflight:1];
  [(FCCKPrivateDatabaseOperation *)v7 setHandleIdentityLoss:0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_3;
  __int16 v16 = &unk_1E5B514F8;
  id v17 = v5;
  id v18 = v6;
  id v10 = v6;
  id v11 = v5;
  [(FCCKPrivateDeleteRecordZonesOperation *)v7 setDeleteRecordZonesCompletionBlock:&v13];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v13, v14, v15, v16);
  id v12 = [*(id *)(a1 + 32) database];
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v12, v7);
}

void __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "fc_isCKUnknownItemError") & 1) != 0
    || objc_msgSend(v6, "fc_isMissingZoneError"))
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (id)_recreateZones
{
  if ([(FCCKSecureDatabaseResetOperation *)self deleteZones])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_2;
    v6[3] = &unk_1E5B4EEF0;
    v6[4] = self;
    v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    v4 = [MEMORY[0x1E4F81BF0] asVoid];
  }
  return v4;
}

void __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
  id v8 = [*(id *)(a1 + 32) database];
  [(FCCKPrivateDatabaseOperation *)v7 setDatabase:v8];

  v9 = [*(id *)(a1 + 32) _rawZonesToRecreate];
  [(FCCKPrivateSaveRecordZonesOperation *)v7 setRecordZonesToSave:v9];

  [(FCCKPrivateDatabaseOperation *)v7 setSkipPreflight:1];
  [(FCCKPrivateDatabaseOperation *)v7 setHandleIdentityLoss:0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_3;
  __int16 v16 = &unk_1E5B514F8;
  id v17 = v5;
  id v18 = v6;
  id v10 = v6;
  id v11 = v5;
  [(FCCKPrivateSaveRecordZonesOperation *)v7 setSaveRecordZonesCompletionBlock:&v13];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v13, v14, v15, v16);
  id v12 = [*(id *)(a1 + 32) database];
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v12, v7);
}

uint64_t __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_restoreSecureSentinel
{
  if ([(FCCKSecureDatabaseResetOperation *)self restoreSecureSentinel])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_2;
    v6[3] = &unk_1E5B4EEF0;
    v6[4] = self;
    v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    v4 = [MEMORY[0x1E4F81BF0] asVoid];
  }
  return v4;
}

void __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MEMORY[0x1E4F1A2D8];
  Property = [*(id *)(a1 + 32) database];
  id v10 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v9, 56, 1);
  }
  id v11 = Property;
  id v12 = +[CKRecord secureSentinelRecordWithEncryptionKey:](v7, v11);

  uint64_t v13 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
  uint64_t v14 = [*(id *)(a1 + 32) database];
  [(FCCKPrivateDatabaseOperation *)v13 setDatabase:v14];

  v25[0] = v12;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [(FCCKPrivateSaveRecordsOperation *)v13 setRecordsToSave:v15];

  [(FCCKPrivateSaveRecordsOperation *)v13 setSavePolicy:0];
  [(FCCKPrivateDatabaseOperation *)v13 setSkipPreflight:1];
  [(FCCKPrivateDatabaseOperation *)v13 setHandleIdentityLoss:0];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_3;
  v22 = &unk_1E5B514F8;
  id v23 = v5;
  id v24 = v6;
  id v16 = v6;
  id v17 = v5;
  [(FCCKPrivateSaveRecordsOperation *)v13 setSaveRecordsCompletionBlock:&v19];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v13, v19, v20, v21, v22);
  id v18 = [*(id *)(a1 + 32) database];
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v18, v13);
}

uint64_t __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_restoreZoneContents
{
  if ([(FCCKSecureDatabaseResetOperation *)self restoreZoneContents])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_2;
    v6[3] = &unk_1E5B4EEF0;
    v6[4] = self;
    v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    v4 = [MEMORY[0x1E4F81BF0] asVoid];
  }
  return v4;
}

void __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(FCCKPrivateBatchedSaveRecordsOperation);
  id v8 = [*(id *)(a1 + 32) database];
  [(FCCKPrivateBatchedSaveRecordsOperation *)v7 setDatabase:v8];

  v9 = [*(id *)(a1 + 32) _rawRecordsToSave];
  [(FCCKPrivateBatchedSaveRecordsOperation *)v7 setRecordsToSave:v9];

  [(FCCKPrivateBatchedSaveRecordsOperation *)v7 setSkipPreflight:1];
  [(FCCKPrivateBatchedSaveRecordsOperation *)v7 setHandleIdentityLoss:0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_3;
  int v15 = &unk_1E5B514F8;
  id v16 = v5;
  id v17 = v6;
  id v10 = v6;
  id v11 = v5;
  [(FCCKPrivateBatchedSaveRecordsOperation *)v7 setSaveRecordsCompletionBlock:&v12];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v12, v13, v14, v15);
  [(FCOperation *)v7 start];
}

uint64_t __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_rawZoneIDsToDelete
{
  id v3 = [(FCCKSecureDatabaseResetOperation *)self database];
  v4 = -[FCCKPrivateDatabase zoneIDsUsingSecureContainer](v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCCKSecureDatabaseResetOperation__rawZoneIDsToDelete__block_invoke;
  v7[3] = &unk_1E5B54A10;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v7);

  return v5;
}

id __55__FCCKSecureDatabaseResetOperation__rawZoneIDsToDelete__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 zoneName];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19D88]];

  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) database];
    -[FCCKPrivateDatabase _clientToServerRecordZoneID:](v7, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_rawZonesToRecreate
{
  v2 = [(FCCKSecureDatabaseResetOperation *)self _rawZoneIDsToDelete];
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_26_1);

  return v3;
}

id __55__FCCKSecureDatabaseResetOperation__rawZonesToRecreate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 zoneName];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F19D88]];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v2];
  }

  return v5;
}

- (id)_rawRecordsToSave
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke;
  v7[3] = &unk_1E5B4BF30;
  v7[4] = self;
  id v3 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v7);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke_2;
  v6[3] = &unk_1E5B570E0;
  v6[4] = self;
  char v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);

  return v4;
}

void __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = a1;
  uint64_t v4 = [*(id *)(a1 + 32) database];
  int v5 = (void *)v4;
  if (v4) {
    id v6 = *(void **)(v4 + 184);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  obuint64_t j = v7;
  uint64_t v24 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v10 = [*(id *)(v23 + 32) database];
        id v11 = -[FCCKPrivateDatabase zoneIDsUsingSecureContainer](v10);

        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              id v17 = [v16 zoneName];
              int v18 = [v9 canHelpRestoreZoneName:v17];

              if (v18)
              {
                uint64_t v19 = [v16 zoneName];
                uint64_t v20 = [v9 recordsForRestoringZoneName:v19];
                [v3 addObjectsFromArray:v20];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v13);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
}

id __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 database];
  int v5 = -[FCCKPrivateDatabase _clientToServerRecord:]((uint64_t)v4, v3);

  return v5;
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (BOOL)deleteZones
{
  return self->_deleteZones;
}

- (void)setDeleteZones:(BOOL)a3
{
  self->_deleteZones = a3;
}

- (BOOL)restoreSecureSentinel
{
  return self->_restoreSecureSentinel;
}

- (void)setRestoreSecureSentinel:(BOOL)a3
{
  self->_restoreSecureSentinel = a3;
}

- (BOOL)restoreZoneContents
{
  return self->_restoreZoneContents;
}

- (void)setRestoreZoneContents:(BOOL)a3
{
  self->_restoreZoneContents = a3;
}

- (id)resetCompletionHandler
{
  return self->_resetCompletionHandler;
}

- (void)setResetCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetCompletionHandler, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end