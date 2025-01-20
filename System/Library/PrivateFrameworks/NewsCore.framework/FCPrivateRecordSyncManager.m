@interface FCPrivateRecordSyncManager
- (BOOL)isAwaitingFirstSync;
- (BOOL)isDirty;
- (FCPrivateRecordSyncManager)init;
- (NSDate)lastCleanDate;
- (id)initWithRecordID:(void *)a3 desiredKeys:(void *)a4 currentState:;
- (void)_stateDidChange;
- (void)fetchChangesWithContext:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)markAsDirty;
- (void)notifyObservers;
@end

@implementation FCPrivateRecordSyncManager

- (id)initWithRecordID:(void *)a3 desiredKeys:(void *)a4 currentState:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_10;
  }
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordID != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPrivateRecordSyncManager initWithRecordID:desiredKeys:currentState:]";
    __int16 v27 = 2080;
    v28 = "FCPrivateRecordSyncManager.m";
    __int16 v29 = 1024;
    int v30 = 36;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "desiredKeys != nil");
        *(_DWORD *)buf = 136315906;
        v26 = "-[FCPrivateRecordSyncManager initWithRecordID:desiredKeys:currentState:]";
        __int16 v27 = 2080;
        v28 = "FCPrivateRecordSyncManager.m";
        __int16 v29 = 1024;
        int v30 = 37;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  v24.receiver = a1;
  v24.super_class = (Class)FCPrivateRecordSyncManager;
  a1 = (id *)objc_msgSendSuper2(&v24, sel_init);
  if (a1)
  {
    uint64_t v10 = [v7 copy];
    id v11 = a1[1];
    a1[1] = (id)v10;

    uint64_t v12 = [v8 copy];
    id v13 = a1[3];
    a1[3] = (id)v12;

    uint64_t v14 = [v9 copy];
    id v15 = a1[4];
    a1[4] = (id)v14;

    if (!a1[4])
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F82B38]);
      id v17 = a1[4];
      a1[4] = v16;

      v18 = [v7 recordName];
      [a1[4] setRecordName:v18];

      v19 = [v7 zoneID];
      v20 = [v19 zoneName];
      [a1[4] setRecordZoneName:v20];
    }
  }
LABEL_10:

  return a1;
}

- (FCPrivateRecordSyncManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPrivateRecordSyncManager init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCPrivateRecordSyncManager.m";
    __int16 v11 = 1024;
    int v12 = 58;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPrivateRecordSyncManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSDate)lastCleanDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  if (self) {
    self = (FCPrivateRecordSyncManager *)self->_currentState;
  }
  v3 = [(FCPrivateRecordSyncManager *)self lastCleanDate];
  uint64_t v4 = [v2 dateWithPBDate:v3];

  return (NSDate *)v4;
}

- (BOOL)isDirty
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self) {
    currentState = self->_currentState;
  }
  else {
    currentState = 0;
  }
  uint64_t v4 = currentState;
  v5 = [(NTPBPrivateRecordSyncState *)v4 lastCleanDate];
  if (v5)
  {
    if (self) {
      id v6 = self->_currentState;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    id v8 = [(NTPBPrivateRecordSyncState *)v7 lastDirtyDate];
    [v8 timeIntervalSince1970];
    double v10 = v9;
    if (self) {
      __int16 v11 = self->_currentState;
    }
    else {
      __int16 v11 = 0;
    }
    int v12 = [(NTPBPrivateRecordSyncState *)v11 lastCleanDate];
    [v12 timeIntervalSince1970];
    BOOL v14 = v10 > v13;
  }
  else
  {
    BOOL v14 = 1;
  }

  uint64_t v15 = (id)FCPrivateDataLog;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    if (self) {
      recordID = self->_recordID;
    }
    else {
      recordID = 0;
    }
    v19 = recordID;
    uint64_t v20 = [(CKRecordID *)v19 recordName];
    v21 = (void *)v20;
    v22 = " not";
    int v24 = 138543874;
    v25 = v17;
    if (v14) {
      v22 = "";
    }
    __int16 v26 = 2114;
    uint64_t v27 = v20;
    __int16 v28 = 2080;
    __int16 v29 = v22;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ for %{public}@ is discovering he is%s dirty on being asked", (uint8_t *)&v24, 0x20u);
  }
  return v14;
}

- (void)markAsDirty
{
  v3 = [MEMORY[0x1E4F1C9C8] pbDate];
  if (self) {
    currentState = self->_currentState;
  }
  else {
    currentState = 0;
  }
  [(NTPBPrivateRecordSyncState *)currentState setLastDirtyDate:v3];

  -[FCPrivateRecordSyncManager _stateDidChange]((uint64_t)self);
}

- (void)_stateDidChange
{
  if (a1)
  {
    id v3 = (id)[*(id *)(a1 + 32) copy];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained recordSyncManager:a1 stateDidChange:v3];
  }
}

- (void)notifyObservers
{
  v2 = self;
  if (self) {
    self = (FCPrivateRecordSyncManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  id v3 = self;
  [(FCPrivateRecordSyncManager *)self recordSyncManagerNotifyObservers:v2];
}

- (BOOL)isAwaitingFirstSync
{
  if (self) {
    self = (FCPrivateRecordSyncManager *)self->_currentState;
  }
  v2 = [(FCPrivateRecordSyncManager *)self lastCleanDate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)fetchChangesWithContext:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  v25[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a3;
  __int16 v11 = [v9 pbDate];
  int v12 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
  if (self)
  {
    v25[0] = self->_recordID;
    double v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = v25[0];
    uint64_t v15 = [v13 arrayWithObjects:v25 count:1];

    [(FCCKPrivateFetchRecordsOperation *)v12 setRecordIDs:v15];
    desiredKeys = self->_desiredKeys;
  }
  else
  {
    v25[0] = 0;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [(FCCKPrivateFetchRecordsOperation *)v12 setRecordIDs:v21];

    desiredKeys = 0;
  }
  [(FCCKPrivateFetchRecordsOperation *)v12 setDesiredKeys:desiredKeys];
  [(FCOperation *)v12 setQualityOfService:a4];
  if (a4 == 9) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = a4 == 33 || a4 == 25;
  }
  [(FCOperation *)v12 setRelativePriority:v17];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke;
  v22[3] = &unk_1E5B4C9A8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v8;
  id v18 = v8;
  id v19 = v11;
  [(FCCKPrivateFetchRecordsOperation *)v12 setFetchRecordsCompletionBlock:v22];
  uint64_t v20 = [v10 privateDatabase];

  -[FCCKPrivateDatabase addOperation:]((uint64_t)v20, v12);
}

void __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  if (objc_msgSend(v5, "fc_isCKUnknownItemError"))
  {
    id v7 = (void *)a1[4];
    if (v7) {
      id v7 = (void *)v7[1];
    }
    v22[0] = v7;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    double v9 = v7;
    id v10 = [v8 arrayWithObjects:v22 count:1];

    __int16 v11 = 0;
  }
  else
  {
    id v10 = 0;
    __int16 v11 = v5;
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_2;
  id v19 = &unk_1E5B4BE70;
  int v12 = (void *)a1[5];
  uint64_t v20 = a1[4];
  id v21 = v12;
  double v13 = _Block_copy(&v16);
  uint64_t v14 = a1[6];
  uint64_t v15 = objc_msgSend(v6, "allValues", v16, v17, v18, v19, v20);

  (*(void (**)(uint64_t, void *, void *, void, void *, void *))(v14 + 16))(v14, v15, v10, 0, v13, v11);
}

void __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  [v4 setLastCleanDate:v2];
  uint64_t v5 = *(void *)(a1 + 32);
  -[FCPrivateRecordSyncManager _stateDidChange](v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end