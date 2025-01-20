@interface FCModifyRecordsCommand
+ (BOOL)supportsSecureCoding;
+ (id)desiredKeys;
- (BOOL)canCoalesceWithCommand:(id)a3;
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyRecordsCommand)init;
- (FCModifyRecordsCommand)initWithCoder:(id)a3;
- (FCModifyRecordsCommand)initWithLocalRecords:(id)a3 merge:(BOOL)a4;
- (FCModifyRecordsCommand)initWithLocalRecordsGenerator:(id)a3 merge:(BOOL)a4;
- (void)_didSaveRecords:(uint64_t)a1;
- (void)coalesceWithCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)handleLocalRecordsFromStream:(void *)a3 internalPrivateDataContext:(void *)a4 delegate:(uint64_t)a5 qualityOfService:;
- (void)localRecords;
@end

@implementation FCModifyRecordsCommand

+ (id)desiredKeys
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCModifyRecordsCommand desiredKeys]";
    __int16 v9 = 2080;
    v10 = "FCModifyRecordsCommand.m";
    __int16 v11 = 1024;
    int v12 = 50;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCModifyRecordsCommand desiredKeys]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCModifyRecordsCommand)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCModifyRecordsCommand init]";
    __int16 v9 = 2080;
    v10 = "FCModifyRecordsCommand.m";
    __int16 v11 = 1024;
    int v12 = 55;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCModifyRecordsCommand init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCModifyRecordsCommand)initWithLocalRecordsGenerator:(id)a3 merge:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCModifyRecordsCommand;
  v7 = [(FCModifyRecordsCommand *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id localRecordsGenerator = v7->_localRecordsGenerator;
    v7->_id localRecordsGenerator = (id)v8;

    v7->_merge = a4;
  }

  return v7;
}

- (FCModifyRecordsCommand)initWithLocalRecords:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)[a3 copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCModifyRecordsCommand_initWithLocalRecords_merge___block_invoke;
  aBlock[3] = &unk_1E5B505B0;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = _Block_copy(aBlock);
  __int16 v9 = [(FCModifyRecordsCommand *)self initWithLocalRecordsGenerator:v8 merge:v4];

  return v9;
}

id __53__FCModifyRecordsCommand_initWithLocalRecords_merge___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (FCModifyRecordsCommand)initWithCoder:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"localRecords"];
  __int16 v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"merge"];

  v10 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v8, [v9 BOOLValue]);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  BOOL v4 = -[FCModifyRecordsCommand localRecords](self);
  [v7 encodeObject:v4 forKey:@"localRecords"];

  if (self) {
    BOOL merge = self->_merge;
  }
  else {
    BOOL merge = 0;
  }
  uint64_t v6 = [NSNumber numberWithBool:merge];
  [v7 encodeObject:v6 forKey:@"merge"];
}

- (void)localRecords
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[3];
    if (!v3)
    {
      v3 = (void *)a1[2];
      if (v3)
      {
        BOOL v4 = (void (*)(void))v3[2];
        id v5 = v3;
        uint64_t v6 = v4();
        id v7 = (void *)v2[3];
        v2[3] = v6;

        v3 = (void *)v2[3];
      }
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCModifyRecordsCommand mergeLocalRecord:withRemoteRecord:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCModifyRecordsCommand.m";
    __int16 v16 = 1024;
    int v17 = 106;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCModifyRecordsCommand mergeLocalRecord:withRemoteRecord:]"];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
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
    id v12 = [v8 internalPrivateDataContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__FCModifyRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
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
      __int16 v14 = v13;
      uint64_t v15 = (objc_class *)objc_opt_class();
      __int16 v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will not execute because CloudKit is not reachable", buf, 0x16u);
    }
    [v9 command:self didFinishWithStatus:1];
  }
}

void __71__FCModifyRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = v4;
      __int16 v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138543874;
      id v18 = v15;
      __int16 v19 = 2048;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, "<%{public}@ %p> failed to prepare zones for use with error: %{public}@", (uint8_t *)&v17, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 48), "command:didFinishWithStatus:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "statusForCloudKitError:", v3));
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v6 = -[FCModifyRecordsCommand localRecords](*(void **)(a1 + 32));
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = MEMORY[0x1E4F1CBF0];
    }
    id v9 = (void *)[v5 initWithArray:v8 copyItems:1];

    v10 = [[FCArrayStream alloc] initWithArray:v9];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) internalPrivateDataContext];
    -[FCModifyRecordsCommand handleLocalRecordsFromStream:internalPrivateDataContext:delegate:qualityOfService:](v11, v10, v12, *(void **)(a1 + 48), *(void *)(a1 + 56));
  }
}

- (void)handleLocalRecordsFromStream:(void *)a3 internalPrivateDataContext:(void *)a4 delegate:(uint64_t)a5 qualityOfService:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke;
    aBlock[3] = &unk_1E5B54D98;
    void aBlock[4] = a1;
    id v17 = v10;
    uint64_t v20 = a5;
    id v12 = v9;
    id v18 = v12;
    id v19 = v11;
    __int16 v13 = _Block_copy(aBlock);
    __int16 v14 = FCDispatchQueueForQualityOfService(a5);
    id v15 = (id)[v12 fetchMoreResultsWithLimit:100 qualityOfService:a5 callbackQueue:v14 completionHandler:v13];
  }
}

- (BOOL)canCoalesceWithCommand:(id)a3
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
  uint64_t v6 = v5;

  BOOL v7 = v6 && (!self || !self->_merge) && v6[8] == 0;
  return v7;
}

- (void)coalesceWithCommand:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v41 = v4;
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
  uint64_t v6 = v5;
  v40 = self;
  BOOL v7 = -[FCModifyRecordsCommand localRecords](self);
  uint64_t v8 = objc_msgSend(v7, "fc_dictionaryWithKeySelector:", sel_recordID);

  v38 = v6;
  id v9 = -[FCModifyRecordsCommand localRecords](v6);
  id v10 = objc_msgSend(v9, "fc_dictionaryWithKeySelector:", sel_recordID);

  id v11 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = [v8 allKeys];
  __int16 v13 = (void *)v12;
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  if (v12) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend(v11, "addObjectsFromArray:", v15, v38);

  uint64_t v16 = [v10 allKeys];
  id v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v14;
  }
  [v11 addObjectsFromArray:v18];

  id v19 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v11;
  uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v52;
    v43 = v19;
    v44 = v10;
    uint64_t v42 = *(void *)v52;
    do
    {
      uint64_t v23 = 0;
      uint64_t v45 = v21;
      do
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * v23);
        uint64_t v25 = [v8 objectForKey:v24];
        v26 = [v10 objectForKey:v24];
        unint64_t v27 = (unint64_t)v26;
        if (v25) {
          BOOL v28 = v26 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (!v28)
        {
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v29 = [v26 changedKeys];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v48 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                v35 = [(id)v27 objectForKeyedSubscript:v34];
                [(id)v25 setObject:v35 forKeyedSubscript:v34];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
            }
            while (v31);
          }

          id v19 = v43;
          id v10 = v44;
          uint64_t v22 = v42;
          uint64_t v21 = v45;
        }
        if (v25 | v27)
        {
          if (v25) {
            uint64_t v36 = v25;
          }
          else {
            uint64_t v36 = v27;
          }
          [v19 addObject:v36];
        }

        ++v23;
      }
      while (v23 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v21);
  }

  if (v40) {
    objc_setProperty_nonatomic_copy(v40, v37, v19, 24);
  }
}

void __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = *(unsigned char **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  v43 = __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke_2;
  v44 = &unk_1E5B54D70;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v45 = v7;
  uint64_t v46 = v8;
  id v47 = v9;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  id v48 = v10;
  uint64_t v49 = v11;
  id v12 = a2;
  id v13 = v4;
  uint64_t v14 = &v41;
  if (v5)
  {
    if ([v12 count])
    {
      uint64_t v15 = [v13 privateDatabase];
      if (v5[8])
      {
        uint64_t v16 = objc_msgSend(v12, "fc_dictionaryWithKeySelector:", sel_recordID);
        id v17 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
        uint64_t v18 = [v16 allKeys];
        [(FCCKPrivateFetchRecordsOperation *)v17 setRecordIDs:v18];

        [(FCOperation *)v17 setQualityOfService:v6];
        id v39 = v13;
        if (v6 == 9)
        {
          id v19 = v15;
          uint64_t v20 = -1;
        }
        else if (v6 == 33 || v6 == 25)
        {
          id v19 = v15;
          uint64_t v20 = 1;
        }
        else
        {
          id v19 = v15;
          uint64_t v20 = 0;
        }
        -[FCOperation setRelativePriority:](v17, "setRelativePriority:", v20, v39, v41, v42);
        v26 = [(id)objc_opt_class() desiredKeys];
        [(FCCKPrivateFetchRecordsOperation *)v17 setDesiredKeys:v26];

        id v27 = [(FCOperation *)v17 operationID];
        BOOL v28 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          uint64_t v30 = (objc_class *)objc_opt_class();
          uint64_t v31 = NSStringFromClass(v30);
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2114;
          long long v51 = v27;
          _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform fetch operation, operationID=%{public}@", buf, 0x20u);
        }
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke;
        long long v51 = &unk_1E5B54DE8;
        id v52 = v16;
        id v53 = v5;
        uint64_t v56 = v6;
        v55 = v14;
        uint64_t v15 = v19;
        uint64_t v32 = v19;
        long long v54 = v32;
        id v33 = v16;
        [(FCCKPrivateFetchRecordsOperation *)v17 setFetchRecordsCompletionBlock:buf];
        -[FCCKPrivateDatabase addOperation:]((uint64_t)v32, v17);

        id v13 = v40;
      }
      else
      {
        id v17 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
        [(FCCKPrivateFetchRecordsOperation *)v17 setRecordsToSave:v12];
        [(FCOperation *)v17 setQualityOfService:v6];
        if (v6 == 9) {
          uint64_t v25 = -1;
        }
        else {
          uint64_t v25 = v6 == 33 || v6 == 25;
        }
        [(FCOperation *)v17 setRelativePriority:v25];
        [(FCCKPrivateFetchRecordsOperation *)v17 setSavePolicy:1];
        uint64_t v34 = [(FCOperation *)v17 operationID];
        v35 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = v35;
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2114;
          long long v51 = v34;
          _os_log_impl(&dword_1A460D000, v36, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform save operation, operationID=%{public}@", buf, 0x20u);
        }
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_33;
        long long v51 = &unk_1E5B54DC0;
        id v52 = v5;
        id v53 = v34;
        long long v54 = v14;
        id v27 = v34;
        [(FCCKPrivateFetchRecordsOperation *)v17 setSaveRecordsCompletionBlock:buf];
        -[FCCKPrivateDatabase addOperation:]((uint64_t)v15, v17);
      }
    }
    else
    {
      uint64_t v21 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = v21;
        uint64_t v23 = (objc_class *)objc_opt_class();
        uint64_t v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> skipping work because CloudKit is not available", buf, 0x16u);
      }
      v43((uint64_t)v14, 0);
    }
  }
}

uint64_t __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2)
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
    return -[FCModifyRecordsCommand handleLocalRecordsFromStream:internalPrivateDataContext:delegate:qualityOfService:](v7, v8, v9, v10, v11);
  }
}

void __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || objc_msgSend(v6, "fc_isCKUnknownItemError"))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (!v10) {
      goto LABEL_15;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v15 = [*(id *)(a1 + 32) objectForKey:v14];
        uint64_t v16 = [v5 objectForKey:v14];
        if (v16)
        {
          if (![*(id *)(a1 + 40) mergeLocalRecord:v15 withRemoteRecord:v16]) {
            goto LABEL_13;
          }
          id v17 = v8;
          uint64_t v18 = v16;
        }
        else
        {
          id v17 = v8;
          uint64_t v18 = v15;
        }
        [v17 addObject:v18];
LABEL_13:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (!v11)
      {
LABEL_15:

        id v19 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = v19;
          uint64_t v21 = (objc_class *)objc_opt_class();
          uint64_t v22 = NSStringFromClass(v21);
          uint64_t v23 = *(void *)(a1 + 40);
          uint64_t v24 = [v5 count];
          uint64_t v25 = [v8 count];
          *(_DWORD *)buf = 138544130;
          uint64_t v56 = v22;
          __int16 v57 = 2048;
          uint64_t v58 = v23;
          __int16 v59 = 2048;
          uint64_t v60 = v24;
          __int16 v61 = 2048;
          uint64_t v62 = v25;
          _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> fetched %lu records, and has %lu records to save after merging", buf, 0x2Au);
        }
        if ([v8 count] == 1)
        {
          v26 = (void *)FCCommandQueueLog;
          if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = v26;
            BOOL v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            uint64_t v30 = *(void *)(a1 + 40);
            uint64_t v31 = [v8 firstObject];
            uint64_t v32 = [v31 changedKeys];
            *(_DWORD *)buf = 138543874;
            uint64_t v56 = v29;
            __int16 v57 = 2048;
            uint64_t v58 = v30;
            __int16 v59 = 2114;
            uint64_t v60 = (uint64_t)v32;
            _os_log_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will save record with changed keys: %{public}@", buf, 0x20u);
          }
        }
        if ([v8 count])
        {
          id v33 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
          [(FCCKPrivateSaveRecordsOperation *)v33 setRecordsToSave:v8];
          [(FCOperation *)v33 setQualityOfService:*(void *)(a1 + 64)];
          uint64_t v34 = *(void *)(a1 + 64);
          if (v34 == 9) {
            uint64_t v35 = -1;
          }
          else {
            uint64_t v35 = v34 == 33 || v34 == 25;
          }
          [(FCOperation *)v33 setRelativePriority:v35];
          [(FCCKPrivateSaveRecordsOperation *)v33 setSavePolicy:1];
          v37 = [(FCOperation *)v33 operationID];
          v38 = (void *)FCCommandQueueLog;
          if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
          {
            id v39 = v38;
            v40 = (objc_class *)objc_opt_class();
            uint64_t v41 = NSStringFromClass(v40);
            uint64_t v42 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            uint64_t v56 = v41;
            __int16 v57 = 2048;
            uint64_t v58 = v42;
            __int16 v59 = 2114;
            uint64_t v60 = (uint64_t)v37;
            _os_log_impl(&dword_1A460D000, v39, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform save operation, operationID=%{public}@", buf, 0x20u);
          }
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_31;
          v48[3] = &unk_1E5B54DC0;
          v48[4] = *(void *)(a1 + 40);
          id v49 = v37;
          id v50 = *(id *)(a1 + 56);
          id v43 = v37;
          [(FCCKPrivateSaveRecordsOperation *)v33 setSaveRecordsCompletionBlock:v48];
          -[FCCKPrivateDatabase addOperation:](*(void *)(a1 + 48), v33);
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }

        goto LABEL_35;
      }
    }
  }
  uint64_t v36 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
  {
    v44 = v36;
    id v45 = (objc_class *)objc_opt_class();
    uint64_t v46 = NSStringFromClass(v45);
    uint64_t v47 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v56 = v46;
    __int16 v57 = 2048;
    uint64_t v58 = v47;
    __int16 v59 = 2114;
    uint64_t v60 = (uint64_t)v7;
    _os_log_error_impl(&dword_1A460D000, v44, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error fetching records: %{public}@", buf, 0x20u);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [*(id *)(a1 + 40) statusForCloudKitError:v7]);
LABEL_35:
}

void __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_31(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = a1[4];
      int v20 = 138543874;
      uint64_t v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error saving records after merge: %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    -[FCModifyRecordsCommand _didSaveRecords:](a1[4], v5);
  }
  uint64_t v12 = [(id)a1[4] statusForCloudKitError:v6];
  id v13 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    uint64_t v17 = a1[4];
    uint64_t v18 = a1[5];
    id v19 = FCCommandStatusDescription(v12);
    int v20 = 138544130;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v17;
    __int16 v24 = 2114;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    id v27 = v19;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> did perform save operation, operationID=%{public}@, status=%{public}@", (uint8_t *)&v20, 0x2Au);
  }
  (*(void (**)(uint64_t, uint64_t))(a1[6] + 16))(a1[6], [(id)a1[4] statusForCloudKitError:v6]);
}

- (void)_didSaveRecords:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];
    char v6 = [v5 isEqualToString:@"com.apple.news"];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __42__FCModifyRecordsCommand__didSaveRecords___block_invoke_2;
      v20[3] = &unk_1E5B4C2F0;
      id v21 = v3;
      id v9 = objc_msgSend(v8, "fc_set:", v20);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = FCZoneLastModifiedExternallySharedPreferenceKey(*(void *)(*((void *)&v16 + 1) + 8 * v13));
            uint64_t v15 = NewsCoreUserDefaults();
            [v15 setObject:v7 forKey:v14];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
}

void __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_33(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = a1[4];
      int v20 = 138543874;
      id v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error saving records: %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    -[FCModifyRecordsCommand _didSaveRecords:](a1[4], v5);
  }
  uint64_t v12 = [(id)a1[4] statusForCloudKitError:v6];
  uint64_t v13 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    uint64_t v15 = (objc_class *)objc_opt_class();
    long long v16 = NSStringFromClass(v15);
    uint64_t v17 = a1[4];
    uint64_t v18 = a1[5];
    long long v19 = FCCommandStatusDescription(v12);
    int v20 = 138544130;
    id v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v17;
    __int16 v24 = 2114;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    id v27 = v19;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> did perform save operation, operationID=%{public}@, status=%{public}@", (uint8_t *)&v20, 0x2Au);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __42__FCModifyRecordsCommand__didSaveRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "recordID", (void)v12);
        uint64_t v10 = [v9 zoneID];
        uint64_t v11 = [v10 zoneName];
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecords, 0);
  objc_storeStrong(&self->_localRecordsGenerator, 0);
}

@end