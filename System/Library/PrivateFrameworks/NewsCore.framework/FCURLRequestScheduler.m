@interface FCURLRequestScheduler
- (FCURLRequestScheduler)initWithURLSession:(id)a3;
- (id)scheduleURLRequest:(id)a3 destination:(int64_t)a4 priority:(int64_t)a5 loggingKey:(id)a6 completion:(id)a7;
- (void)_resumeURLTaskForRequest:(uint64_t)a1;
- (void)_serviceRequests;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation FCURLRequestScheduler

- (FCURLRequestScheduler)initWithURLSession:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCURLRequestScheduler;
  v6 = [(FCURLRequestScheduler *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URLSession, a3);
    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    requests = v7->_requests;
    v7->_requests = v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    inFlightURLTasks = v7->_inFlightURLTasks;
    v7->_inFlightURLTasks = (NSMapTable *)v10;

    v12 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E4F81C18]);
    lock = v7->_lock;
    v7->_lock = v12;

    v14 = [v5 configuration];
    v7->_maxInFlightURLTasks = 2 * [v14 HTTPMaximumConnectionsPerHost];

    v7->_maxInFlightLowPriorityURLTasks = v7->_maxInFlightURLTasks;
  }

  return v7;
}

- (id)scheduleURLRequest:(id)a3 destination:(int64_t)a4 priority:(int64_t)a5 loggingKey:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  v15 = [FCURLRequest alloc];
  objc_super v16 = [MEMORY[0x1E4F1C9C8] date];
  id v17 = v12;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  if (v15)
  {
    v52.receiver = v15;
    v52.super_class = (Class)FCURLRequest;
    v15 = [(FCURLRequestScheduler *)&v52 init];
    if (v15)
    {
      uint64_t v21 = [v17 copy];
      URLRequest = v15->_URLRequest;
      v15->_URLRequest = (NSURLRequest *)v21;

      v15->_destination = a4;
      v15->_priority = a5;
      uint64_t v23 = [v18 copy];
      dateInitiated = v15->_dateInitiated;
      v15->_dateInitiated = (NSDate *)v23;

      uint64_t v25 = [v19 copy];
      loggingKey = v15->_loggingKey;
      v15->_loggingKey = (NSString *)v25;

      uint64_t v27 = [v20 copy];
      id completion = v15->_completion;
      v15->_id completion = (id)v27;

      v15->_remainingRetries = 2;
    }
  }

  if (self) {
    lock = self->_lock;
  }
  else {
    lock = 0;
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke;
  v50[3] = &unk_1E5B4BE70;
  v50[4] = self;
  v30 = v15;
  v51 = v30;
  [(NFUnfairLock *)lock performWithLockSync:v50];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4BE70;
  aBlock[4] = self;
  v31 = v30;
  v49 = v31;
  v32 = _Block_copy(aBlock);
  uint64_t v42 = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  v44 = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_4;
  v45 = &unk_1E5B4C8D0;
  v46 = self;
  v47 = v31;
  v33 = v31;
  v34 = _Block_copy(&v42);
  v35 = [FCPseudoOperation alloc];
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  v38 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v38);
  v40 = -[FCPseudoOperation initWithCancelBlock:priorityBlock:shortDescription:longDescription:](v35, "initWithCancelBlock:priorityBlock:shortDescription:longDescription:", v32, v34, v37, v39, v42, v43, v44, v45, v46);

  return v40;
}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[2];
  }
  v3 = v2;
  v4 = [v3 array];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5) {
    id v5 = (void *)v5[2];
  }
  v7 = v5;
  uint64_t v8 = [v7 count];
  self;
  uint64_t v9 = objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v8, 1024, &__block_literal_global_51_2);

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    v11 = *(void **)(v10 + 16);
  }
  else {
    v11 = 0;
  }
  [v11 insertObject:*(void *)(a1 + 40) atIndex:v9];
  uint64_t v12 = *(void *)(a1 + 32);
  -[FCURLRequestScheduler _serviceRequests](v12);
}

- (void)_serviceRequests
{
  if (a1 && [*(id *)(a1 + 16) count])
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__43;
    v22 = __Block_byref_object_dispose__43;
    id v23 = 0;
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__43;
    objc_super v16 = __Block_byref_object_dispose__43;
    id v17 = 0;
    id v2 = *(id *)(a1 + 16);
    v3 = [v2 array];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_10;
    v11[3] = &unk_1E5B566D0;
    v11[4] = a1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_2;
    v10[3] = &unk_1E5B50690;
    v10[4] = &v18;
    v10[5] = &v12;
    objc_msgSend(v3, "fc_splitArrayWithTest:result:", v11, v10);

    uint64_t v4 = [(id)v13[5] count];
    id v5 = (void *)v19[5];
    if (v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_3;
      v9[3] = &unk_1E5B566F8;
      v9[4] = a1;
      [v5 enumerateObjectsUsingBlock:v9];
      uint64_t v6 = (void *)v13[5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_4;
      v8[3] = &unk_1E5B566F8;
      v8[4] = a1;
      [v6 enumerateObjectsUsingBlock:v8];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_5;
      v7[3] = &unk_1E5B566F8;
      v7[4] = a1;
      [v5 enumerateObjectsUsingBlock:v7];
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    id v2 = *(void **)(v1 + 48);
  }
  else {
    id v2 = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_3;
  v3[3] = &unk_1E5B4BE70;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performWithLockSync:v3];
}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1 && [*(id *)(v1 + 16) containsObject:v2])
  {
    v3 = [*(id *)(v1 + 24) objectForKey:v2];
    [*(id *)(v1 + 16) removeObject:v2];
    [*(id *)(v1 + 24) removeObjectForKey:v2];
    if (v3)
    {
      id v4 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        if (v2) {
          id v5 = (void *)v2[5];
        }
        else {
          id v5 = 0;
        }
        id v6 = v5;
        v7 = v4;
        uint64_t v8 = [v3 longOperationDescription];
        *(_DWORD *)uint64_t v10 = 138543618;
        *(void *)&v10[4] = v5;
        *(_WORD *)&v10[12] = 2114;
        *(void *)&v10[14] = v8;
        _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will cancel URL task %{public}@", v10, 0x16u);
      }
      [v3 cancel];
      -[FCURLRequestScheduler _serviceRequests](v1);
    }
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    if (v2 && v2[6])
    {
      *(void *)uint64_t v10 = MEMORY[0x1E4F143A8];
      *(void *)&v10[8] = 3221225472;
      *(void *)&v10[16] = __40__FCURLRequestScheduler__cancelRequest___block_invoke;
      v11 = &unk_1E5B4C018;
      uint64_t v12 = v2;
      dispatch_async(v9, v10);
    }
  }
}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 48);
  }
  else {
    v3 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_5;
  v4[3] = &unk_1E5B4E490;
  v4[4] = v2;
  uint64_t v6 = a2;
  id v5 = *(id *)(a1 + 40);
  [v3 performWithLockSync:v4];
}

uint64_t __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  id v4 = v3;
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v5 = v3 ? v3[3] : 0;
  if (v5 == v1) {
    goto LABEL_12;
  }
  v11 = v3;
  uint64_t v6 = [*(id *)(v2 + 24) objectForKey:v3];
  v7 = v6;
  if (v6) {
    [v6 setRelativePriority:v1];
  }
  id v8 = *(id *)(v2 + 16);
  self;
  [v8 sortUsingComparator:&__block_literal_global_51_2];

  if (!v11)
  {
    if ((v1 & 0x8000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v9 = v11[3];
  if (v9 > -2)
  {
    if (v1 < 0 == (v9 == -1)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((v1 & 0x8000000000000000) == 0) {
LABEL_10:
  }
    -[FCURLRequestScheduler _serviceRequests](v2);
LABEL_11:

  id v4 = v11;
LABEL_12:
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)FCURLRequestSchedulerKVOContext == a6)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4, a5);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (self)
    {
      uint64_t v9 = v7;
      objc_setProperty_nonatomic_copy(self, v7, v7, 56);
      id v8 = v9;
    }
    MEMORY[0x1F41817F8](v7, v8);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FCURLRequestScheduler;
    -[FCURLRequestScheduler observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __41__FCURLRequestScheduler__serviceRequests__block_invoke_10(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 24) >> 63;
  }
  else {
    LODWORD(v2) = 0;
  }
  if (*(void *)(a1 + 32)) {
    return v2;
  }
  else {
    return 0;
  }
}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    id v4 = [*(id *)(v2 + 24) objectForKey:v3];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
      v7 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        if (v3) {
          id v8 = (void *)v3[5];
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;
        objc_super v10 = v7;
        v11 = [v6 longOperationDescription];
        int v12 = 138543618;
        uint64_t v13 = v8;
        __int16 v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ will cancel URL task %{public}@ to make way for higher-priority requests", (uint8_t *)&v12, 0x16u);
      }
      [*(id *)(v2 + 24) removeObjectForKey:v3];
      [v6 cancel];
    }
  }
}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[3];
  }
  v7 = v6;
  unint64_t v8 = [v7 count];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    unint64_t v10 = v8;
    unint64_t v11 = *(void *)(v9 + 32);
    *a4 = v8 >= v11;

    if (v10 < v11) {
      -[FCURLRequestScheduler _resumeURLTaskForRequest:](*(void *)(a1 + 32), v12);
    }
  }
  else
  {
    *a4 = 1;
  }
}

- (void)_resumeURLTaskForRequest:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_17;
  }
  id v4 = [*(id *)(a1 + 24) objectForKey:v3];

  if (v4) {
    goto LABEL_17;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43;
  v33 = __Block_byref_object_dispose__43;
  id v34 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_2;
  v24 = &unk_1E5B56748;
  uint64_t v25 = a1;
  v28 = &v29;
  id v6 = (id *)v3;
  v26 = v6;
  id v7 = v5;
  id v27 = v7;
  unint64_t v8 = _Block_copy(&v21);
  if (!v6)
  {
    id v10 = *(id *)(a1 + 8);
    id v13 = 0;
    goto LABEL_8;
  }
  id v9 = v6[2];
  if (!v9)
  {
    id v10 = *(id *)(a1 + 8);
    id v13 = v6[1];
LABEL_8:
    id v11 = v13;
    uint64_t v12 = objc_msgSend(v10, "downloadTaskWithRequest:completionHandler:", v11, v8, v21, v22, v23, v24, v25, v26);
    goto LABEL_9;
  }
  if (v9 == (id)1)
  {
    id v10 = *(id *)(a1 + 8);
    id v11 = v6[1];
    uint64_t v12 = objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v11, v8, v21, v22, v23, v24, v25, v26);
LABEL_9:
    __int16 v14 = (void *)v30[5];
    v30[5] = v12;
  }
  id v15 = *(id *)(a1 + 24);
  [v15 setObject:v30[5] forKey:v6];

  if (v6) {
    id v16 = v6[3];
  }
  else {
    id v16 = 0;
  }
  objc_msgSend((id)v30[5], "setRelativePriority:", v16, v21, v22, v23, v24, v25);
  [(id)v30[5] addObserver:a1 forKeyPath:@"countOfBytesReceived" options:0 context:FCURLRequestSchedulerKVOContext];
  id v17 = (id)FCOperationLog;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v18 = v6[5];
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
    uint64_t v20 = [(id)v30[5] longOperationDescription];
    *(_DWORD *)buf = 138543618;
    id v36 = v19;
    __int16 v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ will start URL task %{public}@", buf, 0x16u);
  }
  [(id)v30[5] resume];

  _Block_object_dispose(&v29, 8);
LABEL_17:
}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[3];
  }
  id v7 = v6;
  unint64_t v8 = [v7 count];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    unint64_t v10 = v8;
    unint64_t v11 = *(void *)(v9 + 40);
    *a4 = v8 >= v11;

    if (v10 < v11) {
      -[FCURLRequestScheduler _resumeURLTaskForRequest:](*(void *)(a1 + 32), v12);
    }
  }
  else
  {
    *a4 = 1;
  }
}

void __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  unint64_t v10 = *(void **)(a1 + 32);
  if (v10) {
    unint64_t v10 = (void *)v10[6];
  }
  unint64_t v11 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_3;
  v18[3] = &unk_1E5B56720;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 56);
  v18[4] = v12;
  id v19 = v13;
  id v20 = *(id *)(a1 + 48);
  id v14 = v9;
  id v21 = v14;
  id v23 = &v24;
  [v11 performWithLockSync:v18];

  if (*((unsigned char *)v25 + 24))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15)
    {
      id v16 = *(void **)(v15 + 48);
      if (v16)
      {
        id v17 = v16;
        v17[2](v17, v7, v8, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v14);
      }
    }
  }

  _Block_object_dispose(&v24, 8);
}

void __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObserver:*(void *)(a1 + 32) forKeyPath:@"countOfBytesReceived"];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 24);
  }
  else {
    id v3 = 0;
  }
  id v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  if (*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40) == v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(void **)(v7 + 24);
    }
    else {
      id v8 = 0;
    }
    [v8 removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 32);
    unint64_t v10 = *(void **)(a1 + 48);
    unint64_t v11 = *(void **)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v13 = v10;
    id v14 = v11;
    uint64_t v15 = v14;
    int v16 = 0;
    if (v9 && v12)
    {
      if (*((uint64_t *)v12 + 7) < 1) {
        goto LABEL_16;
      }
      id v17 = [v14 domain];
      int v18 = [v17 isEqualToString:*MEMORY[0x1E4F289A0]];

      if (!v18 || [v15 code] != -1001) {
        goto LABEL_16;
      }
      id v19 = *(id *)(v9 + 56);
      if (v19)
      {
        id v20 = v19;
        id v21 = *(id *)(v9 + 56);
        objc_msgSend(v21, "fc_timeIntervalUntilNow");
        double v23 = v22;
        [*((id *)v12 + 1) timeoutInterval];
        double v25 = v24;

        if (v23 < v25) {
          goto LABEL_15;
        }
      }
      objc_msgSend(v13, "fc_timeIntervalUntilNow");
      double v27 = v26;
      [*((id *)v12 + 1) timeoutInterval];
      if (v27 > v28 + v28) {
LABEL_15:
      }
        int v16 = 1;
      else {
LABEL_16:
      }
        int v16 = 0;
    }

    uint64_t v29 = (void *)FCOperationLog;
    BOOL v30 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v30)
      {
        uint64_t v31 = *(void *)(a1 + 40);
        if (v31) {
          v32 = *(void **)(v31 + 40);
        }
        else {
          v32 = 0;
        }
        v33 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        id v34 = v32;
        v35 = v29;
        id v36 = [v33 longOperationDescription];
        *(_DWORD *)buf = 138543618;
        v50 = v32;
        __int16 v51 = 2114;
        objc_super v52 = v36;
        _os_log_impl(&dword_1A460D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ will retry URL task %{public}@", buf, 0x16u);
      }
      uint64_t v37 = *(void *)(a1 + 40);
      if (v37) {
        --*(void *)(v37 + 56);
      }
    }
    else
    {
      if (v30)
      {
        uint64_t v38 = *(void *)(a1 + 40);
        if (v38) {
          uint64_t v39 = *(void **)(v38 + 40);
        }
        else {
          uint64_t v39 = 0;
        }
        v40 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        id v41 = v39;
        uint64_t v42 = v29;
        uint64_t v43 = [v40 longOperationDescription];
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        __int16 v51 = 2114;
        objc_super v52 = v43;
        _os_log_impl(&dword_1A460D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ did complete URL task %{public}@", buf, 0x16u);
      }
      uint64_t v44 = *(void *)(a1 + 32);
      if (v44) {
        v45 = *(void **)(v44 + 16);
      }
      else {
        v45 = 0;
      }
      [v45 removeObject:*(void *)(a1 + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    -[FCURLRequestScheduler _serviceRequests](*(void *)(a1 + 32));
  }
  else
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_4;
    v46[3] = &unk_1E5B4F3B0;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 64);
    id v47 = v5;
    uint64_t v48 = v6;
    __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_4((uint64_t)v46);
  }
}

void __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      id v4 = *(void **)(v3 + 40);
    }
    else {
      id v4 = 0;
    }
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v6 = v4;
    uint64_t v7 = v2;
    id v8 = [v5 longOperationDescription];
    int v9 = 138543618;
    unint64_t v10 = v4;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring URL task completion due to prior cancellation %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

void __40__FCURLRequestScheduler__cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void (***)(void, void, void, void, void))(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F289A0];
  id v5 = v2;
  id v6 = [v3 errorWithDomain:v4 code:-999 userInfo:MEMORY[0x1E4F1CC08]];
  ((void (**)(void, void, void, void, id))v2)[2](v5, 0, 0, 0, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastProgress, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_inFlightURLTasks, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
}

@end