@interface FCPrivateZoneSyncManager
- (BOOL)isAwaitingFirstSync;
- (BOOL)isDirty;
- (FCPrivateZoneSyncManager)init;
- (NSDate)lastCleanDate;
- (id)initWithRecordZoneID:(void *)a3 desiredKeys:(char)a4 requiresBatchedSync:(void *)a5 currentState:;
- (void)_stateDidChange;
- (void)fetchChangesWithContext:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)markAsDirty;
- (void)notifyObservers;
@end

@implementation FCPrivateZoneSyncManager

- (id)initWithRecordZoneID:(void *)a3 desiredKeys:(char)a4 requiresBatchedSync:(void *)a5 currentState:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (!a1) {
    goto LABEL_10;
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordZoneID != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPrivateZoneSyncManager initWithRecordZoneID:desiredKeys:requiresBatchedSync:currentState:]";
    __int16 v27 = 2080;
    v28 = "FCPrivateZoneSyncManager.m";
    __int16 v29 = 1024;
    int v30 = 39;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v10)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "desiredKeys != nil");
        *(_DWORD *)buf = 136315906;
        v26 = "-[FCPrivateZoneSyncManager initWithRecordZoneID:desiredKeys:requiresBatchedSync:currentState:]";
        __int16 v27 = 2080;
        v28 = "FCPrivateZoneSyncManager.m";
        __int16 v29 = 1024;
        int v30 = 40;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v10)
  {
    goto LABEL_5;
  }
  v24.receiver = a1;
  v24.super_class = (Class)FCPrivateZoneSyncManager;
  a1 = (id *)objc_msgSendSuper2(&v24, sel_init);
  if (a1)
  {
    uint64_t v12 = [v9 copy];
    id v13 = a1[2];
    a1[2] = (id)v12;

    uint64_t v14 = [v10 copy];
    id v15 = a1[4];
    a1[4] = (id)v14;

    *((unsigned char *)a1 + 8) = a4;
    uint64_t v16 = [v11 copy];
    id v17 = a1[5];
    a1[5] = (id)v16;

    if (!a1[5])
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F82B40]);
      id v19 = a1[5];
      a1[5] = v18;

      v20 = [v9 zoneName];
      [a1[5] setZoneName:v20];
    }
  }
LABEL_10:

  return a1;
}

- (FCPrivateZoneSyncManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPrivateZoneSyncManager init]";
    __int16 v9 = 2080;
    id v10 = "FCPrivateZoneSyncManager.m";
    __int16 v11 = 1024;
    int v12 = 61;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPrivateZoneSyncManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSDate)lastCleanDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  if (self) {
    self = (FCPrivateZoneSyncManager *)self->_currentState;
  }
  v3 = [(FCPrivateZoneSyncManager *)self lastCleanDate];
  uint64_t v4 = [v2 dateWithPBDate:v3];

  return (NSDate *)v4;
}

- (BOOL)isDirty
{
  if (self) {
    currentState = self->_currentState;
  }
  else {
    currentState = 0;
  }
  uint64_t v4 = currentState;
  v5 = [(NTPBPrivateZoneSyncState *)v4 lastCleanDate];
  if (v5)
  {
    if (self) {
      id v6 = self->_currentState;
    }
    else {
      id v6 = 0;
    }
    v7 = v6;
    v8 = [(NTPBPrivateZoneSyncState *)v7 lastDirtyDate];
    [v8 timeIntervalSince1970];
    double v10 = v9;
    if (self) {
      __int16 v11 = self->_currentState;
    }
    else {
      __int16 v11 = 0;
    }
    int v12 = [(NTPBPrivateZoneSyncState *)v11 lastCleanDate];
    [v12 timeIntervalSince1970];
    BOOL v14 = v10 > v13;
  }
  else
  {
    BOOL v14 = 1;
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
  [(NTPBPrivateZoneSyncState *)currentState setLastDirtyDate:v3];

  -[FCPrivateZoneSyncManager _stateDidChange]((id *)&self->super.isa);
}

- (void)_stateDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)[a1[5] copy];
    v3 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = a1[2];
      v8 = [v7 zoneName];
      int v10 = 138543874;
      __int16 v11 = v6;
      __int16 v12 = 2114;
      double v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v2;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ for zone %{public}@ did change his state to %{public}@", (uint8_t *)&v10, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    [WeakRetained zoneSyncManager:a1 stateDidChange:v2];
  }
}

- (void)notifyObservers
{
  v2 = self;
  if (self) {
    self = (FCPrivateZoneSyncManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  v3 = self;
  [(FCPrivateZoneSyncManager *)self zoneSyncManagerNotifyObservers:v2];
}

- (BOOL)isAwaitingFirstSync
{
  if (self) {
    self = (FCPrivateZoneSyncManager *)self->_currentState;
  }
  v2 = [(FCPrivateZoneSyncManager *)self lastCleanDate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)fetchChangesWithContext:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (self) {
    recordZoneID = self->_recordZoneID;
  }
  else {
    recordZoneID = 0;
  }
  int v10 = recordZoneID;
  id v11 = a3;
  __int16 v12 = [(CKRecordZoneID *)v10 zoneName];

  double v13 = [v11 recordZoneWithName:v12];

  if (v13)
  {
    __int16 v14 = [MEMORY[0x1E4F1C9C8] pbDate];
    if (self) {
      currentState = self->_currentState;
    }
    else {
      currentState = 0;
    }
    uint64_t v16 = currentState;
    id v17 = [(NTPBPrivateZoneSyncState *)v16 changeToken];

    if (v17)
    {
      id v18 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:0];
    }
    else
    {
      id v18 = 0;
    }
    v20 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543874;
      v36 = v23;
      __int16 v37 = 2114;
      v38 = v12;
      __int16 v39 = 2114;
      id v40 = v17;
      _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ for zone %{public}@ will fetch changes with token %{public}@", buf, 0x20u);
    }
    if (self)
    {
      objc_super v24 = self->_desiredKeys;
      char v25 = !self->_requiresBatchedSync;
    }
    else
    {
      objc_super v24 = 0;
      char v25 = 1;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_17;
    v28[3] = &unk_1E5B57130;
    v28[4] = self;
    id v29 = v12;
    id v30 = v14;
    id v31 = v8;
    id v26 = v8;
    id v27 = v14;
    id v19 = v12;
    -[FCCKRecordZone fetchChangesWithChangeToken:desiredKeys:fetchAllChanges:qualityOfService:completion:]((uint64_t)v13, v18, v24, v25, a4, v28);
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke;
    v32[3] = &unk_1E5B4C7C0;
    id v33 = v12;
    id v34 = v8;
    id v18 = v8;
    id v17 = v12;
    __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke((uint64_t)v32);

    id v19 = v34;
  }
}

void __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_unknownRecordZoneErrorWithZoneName:", *(void *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, void *, id))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, &__block_literal_global_114, v2);
}

void __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_17(uint64_t a1, int a2, void *a3, void *a4, uint64_t a5, void *a6, int a7)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    id v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    uint64_t v21 = *(void *)(a1 + 40);
    v22 = "un";
    *(_DWORD *)buf = 138544386;
    v23 = "";
    __int16 v37 = v20;
    __int16 v38 = 2112;
    if (a2) {
      v22 = "";
    }
    uint64_t v39 = v21;
    __int16 v40 = 2080;
    if (!a7) {
      v23 = " no";
    }
    uint64_t v41 = v22;
    __int16 v42 = 2080;
    v43 = v23;
    __int16 v44 = 2114;
    v45 = v16;
    _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ for zone %@ fetched changes %ssuccessfully with%s more changes to fetch and token %{public}@", buf, 0x34u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_22;
  aBlock[3] = &unk_1E5B57108;
  id v24 = v15;
  uint64_t v25 = *(void *)(a1 + 32);
  id v31 = v24;
  uint64_t v32 = v25;
  id v26 = v16;
  id v33 = v26;
  char v35 = a7;
  id v34 = *(id *)(a1 + 48);
  id v27 = _Block_copy(aBlock);
  uint64_t v28 = *(void *)(a1 + 56);
  if (a2)
  {
    (*(void (**)(uint64_t, id, id, uint64_t, void *, void))(v28 + 16))(v28, v13, v14, a5, v27, 0);
  }
  else
  {
    id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:16 userInfo:0];
    (*(void (**)(uint64_t, id, id, uint64_t, void *, void *))(v28 + 16))(v28, v13, v14, a5, v27, v29);
  }
}

void __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_22(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 48);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 40);
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      uint64_t v4 = *(void **)(v5 + 40);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v2 = 0;
  }
  [v4 setChangeToken:v2];
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      id v7 = *(void **)(v6 + 40);
    }
    else {
      id v7 = 0;
    }
    [v7 setLastCleanDate:*(void *)(a1 + 56)];
  }
  id v8 = *(id **)(a1 + 40);
  -[FCPrivateZoneSyncManager _stateDidChange](v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end