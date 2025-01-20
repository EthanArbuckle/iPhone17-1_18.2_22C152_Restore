@interface FCRemoveRecordsCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)canCoalesceWithCommand:(id)a3;
- (FCRemoveRecordsCommand)init;
- (FCRemoveRecordsCommand)initWithCoder:(id)a3;
- (FCRemoveRecordsCommand)initWithRecordIDs:(id)a3;
- (void)coalesceWithCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)handleRecordIDsFromStream:(void *)a3 context:(void *)a4 delegate:(uint64_t)a5 qualityOfService:;
@end

@implementation FCRemoveRecordsCommand

- (FCRemoveRecordsCommand)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRemoveRecordsCommand init]";
    __int16 v9 = 2080;
    v10 = "FCRemoveRecordsCommand.m";
    __int16 v11 = 1024;
    int v12 = 42;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCRemoveRecordsCommand init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCRemoveRecordsCommand)initWithRecordIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCRemoveRecordsCommand;
  v5 = [(FCRemoveRecordsCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v6;
  }
  return v5;
}

- (FCRemoveRecordsCommand)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"recordIDs"];

  objc_super v9 = [(FCRemoveRecordsCommand *)self initWithRecordIDs:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    recordIDs = self->_recordIDs;
  }
  else {
    recordIDs = 0;
  }
  [a3 encodeObject:recordIDs forKey:@"recordIDs"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 networkReachability];
  int v11 = [v10 isCloudKitReachable];

  if (v11)
  {
    int v12 = [v8 internalPrivateDataContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__FCRemoveRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
    v17[3] = &unk_1E5B54D48;
    v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    int64_t v20 = a5;
    [v12 prepareRecordZonesForUseWithCompletionHandler:v17];
  }
  else
  {
    __int16 v13 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      uint64_t v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will not execute because CloudKit is not reachable", buf, 0x16u);
    }
    [v9 command:self didFinishWithStatus:1];
  }
}

void __71__FCRemoveRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      id v9 = v4;
      v10 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v10);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543874;
      v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "<%{public}@ %p> failed to prepare zones for use with error: %{public}@", (uint8_t *)&v13, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 48), "command:didFinishWithStatus:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "statusForCloudKitError:", v3));
  }
  else
  {
    id v5 = [FCArrayStream alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [(FCArrayStream *)v5 initWithArray:v7];
    -[FCRemoveRecordsCommand handleRecordIDsFromStream:context:delegate:qualityOfService:](*(void *)(a1 + 32), v8, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56));
  }
}

- (void)handleRecordIDsFromStream:(void *)a3 context:(void *)a4 delegate:(uint64_t)a5 qualityOfService:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke;
    aBlock[3] = &unk_1E5B54D98;
    aBlock[4] = a1;
    id v17 = v10;
    uint64_t v20 = a5;
    id v12 = v9;
    id v18 = v12;
    id v19 = v11;
    int v13 = _Block_copy(aBlock);
    v14 = FCDispatchQueueForQualityOfService(a5);
    id v15 = (id)[v12 fetchMoreResultsWithLimit:100 qualityOfService:a5 callbackQueue:v14 completionHandler:v13];
  }
}

void __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v29 = __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke_2;
  v30 = &unk_1E5B54D70;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v31 = v7;
  uint64_t v32 = v8;
  id v33 = v9;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  id v34 = v10;
  uint64_t v35 = v11;
  id v12 = a2;
  id v13 = v4;
  v14 = v28;
  if (v5)
  {
    id v15 = [v13 networkReachability];
    int v16 = [v15 isCloudKitReachable];

    if (v16)
    {
      *(void *)aBlock = MEMORY[0x1E4F143A8];
      *(void *)&aBlock[8] = 3221225472;
      *(void *)&aBlock[16] = __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke;
      v41 = &unk_1E5B55FC0;
      id v17 = v12;
      uint64_t v46 = v6;
      id v42 = v17;
      uint64_t v43 = v5;
      id v18 = v14;
      id v45 = v18;
      id v44 = v13;
      id v19 = (void (**)(void))_Block_copy(aBlock);
      if ([v17 count])
      {
        v19[2](v19);
      }
      else
      {
        v24 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = v24;
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          __int16 v38 = 2048;
          uint64_t v39 = v5;
          _os_log_impl(&dword_1A460D000, v25, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> succeeded because there are no record IDs to delete", buf, 0x16u);
        }
        v29((uint64_t)v18, 0);
      }
    }
    else
    {
      uint64_t v20 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = (objc_class *)objc_opt_class();
        __int16 v23 = NSStringFromClass(v22);
        *(_DWORD *)aBlock = 138543618;
        *(void *)&aBlock[4] = v23;
        *(_WORD *)&aBlock[12] = 2048;
        *(void *)&aBlock[14] = v5;
        _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> skipping work because CloudKit is not available", aBlock, 0x16u);
      }
      v29((uint64_t)v14, 1);
    }
  }
}

uint64_t __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 || ([*(id *)(a1 + 32) isFinished] & 1) != 0)
  {
    id v4 = *(void **)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 command:v5 didFinishWithStatus:a2];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    return -[FCRemoveRecordsCommand handleRecordIDsFromStream:context:delegate:qualityOfService:](v7, v8, v9, v10, v11);
  }
}

void __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(FCCKPrivateDeleteRecordsOperation);
  [(FCCKPrivateDeleteRecordsOperation *)v2 setRecordIDsToDelete:*(void *)(a1 + 32)];
  [(FCOperation *)v2 setQualityOfService:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(a1 + 64);
  BOOL v4 = v3 == 33 || v3 == 25;
  if (v3 == 9) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = v4;
  }
  [(FCOperation *)v2 setRelativePriority:v5];
  uint64_t v6 = [(FCOperation *)v2 operationID];
  uint64_t v7 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    __int16 v23 = v6;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform delete operation, operationID=%{public}@", buf, 0x20u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke_17;
  v15[3] = &unk_1E5B54DC0;
  v15[4] = *(void *)(a1 + 40);
  id v16 = v6;
  id v17 = *(id *)(a1 + 56);
  id v12 = v6;
  [(FCCKPrivateDeleteRecordsOperation *)v2 setDeleteRecordsCompletionBlock:v15];
  id v13 = [*(id *)(a1 + 48) internalPrivateDataContext];
  v14 = [v13 privateDatabase];
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v14, v2);
}

void __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "fc_isCKUnknownItemError"))
  {
    id v5 = 0;
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
      {
        v14 = v6;
        id v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        __int16 v20 = v16;
        __int16 v21 = 2048;
        uint64_t v22 = v17;
        __int16 v23 = 2114;
        id v24 = v4;
        _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error deleting records: %{public}@", buf, 0x20u);
      }
    }
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)FCRemoveRecordsCommand;
    id v5 = objc_msgSendSuper2(&v18, sel_statusForCloudKitError_, v4);
  }
  uint64_t v7 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v13 = FCCommandStatusDescription((uint64_t)v5);
    *(_DWORD *)buf = 138544130;
    __int16 v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    __int16 v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> did perform delete operation, operationID=%{public}@, status=%{public}@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)coalesceWithCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v12 = v5;

  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = v6;
  if (self) {
    recordIDs = self->_recordIDs;
  }
  else {
    recordIDs = 0;
  }
  [v6 addObjectsFromArray:recordIDs];
  if (v12) {
    uint64_t v9 = v12[1];
  }
  else {
    uint64_t v9 = 0;
  }
  [v7 addObjectsFromArray:v9];
  uint64_t v11 = [v7 allObjects];
  if (self) {
    objc_setProperty_nonatomic_copy(self, v10, v11, 8);
  }
}

- (void).cxx_destruct
{
}

@end