@interface FCCommandQueue
- (BOOL)_isEmpty;
- (FCCommandQueue)initWithContext:(id)a3 storeDirectory:(id)a4 storeFilename:(id)a5 urgency:(int64_t)a6 suspended:(BOOL)a7 delegate:(id)a8;
- (FCCommandQueue)initWithContext:(id)a3 urgency:(int64_t)a4 suspended:(BOOL)a5 delegate:(id)a6;
- (id)initWithContext:(void *)a3 persistentStorePath:(void *)a4 urgency:(int)a5 suspended:(void *)a6 delegate:;
- (uint64_t)_qualityOfServiceForNextCommand;
- (void)_addCommand:(void *)a3 saveCompletion:;
- (void)_executeNextCommand;
- (void)_savePendingCommands;
- (void)_scheduleCommandExecution;
- (void)activityObservingApplicationDidEnterBackground;
- (void)addCommand:(id)a3;
- (void)addCommand:(id)a3 saveCompletion:(id)a4;
- (void)clear;
- (void)command:(id)a3 didFinishWithStatus:(unint64_t)a4;
- (void)dealloc;
- (void)flushWithCompletionHandler:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
- (void)resume;
@end

@implementation FCCommandQueue

- (FCCommandQueue)initWithContext:(id)a3 storeDirectory:(id)a4 storeFilename:(id)a5 urgency:(int64_t)a6 suspended:(BOOL)a7 delegate:(id)a8
{
  BOOL v9 = a7;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a3;
  if (![v15 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)[[NSString alloc] initWithFormat:@"expecting a valid storeFilename"];
    int v22 = 136315906;
    v23 = "-[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:]";
    __int16 v24 = 2080;
    v25 = "FCCommandQueue.m";
    __int16 v26 = 1024;
    int v27 = 129;
    __int16 v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v22, 0x26u);
  }
  v18 = [v14 stringByAppendingPathComponent:v15];
  v19 = (FCCommandQueue *)-[FCCommandQueue initWithContext:persistentStorePath:urgency:suspended:delegate:]((id *)&self->super.isa, v17, v18, (void *)a6, v9, v16);

  return v19;
}

void __31__FCCommandQueue__loadFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[2];
  }
  v3 = v2;
  v4 = [v3 appActivityMonitor];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    v6 = *(void **)(v5 + 16);
  }
  else {
    v6 = 0;
  }
  v7 = [v6 backgroundTaskable];
  v8 = +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:v4 backgroundTaskable:v7];

  BOOL v9 = [FCKeyValueStore alloc];
  v10 = *(void **)(a1 + 32);
  if (v10) {
    v10 = (void *)v10[3];
  }
  v11 = v10;
  v12 = [v11 lastPathComponent];
  v13 = *(void **)(a1 + 32);
  if (v13) {
    v13 = (void *)v13[3];
  }
  id v14 = v13;
  id v15 = [v14 stringByDeletingLastPathComponent];
  id v16 = [(FCKeyValueStore *)v9 initWithName:v12 directory:v15 version:3 options:0 classRegistry:0 migrator:0 savePolicy:v8];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    objc_storeStrong((id *)(v17 + 40), v16);
  }

  v18 = *(id **)(a1 + 32);
  if (v18)
  {
    id v19 = v18[5];
    v20 = [v19 objectForKey:@"pendingCommands"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __48__FCCommandQueue__deserializeCommandsFromStore___block_invoke;
    v36[3] = &unk_1E5B55100;
    v36[4] = v18;
    objc_msgSend(v20, "fc_arrayByTransformingWithBlock:", v36);
    v18 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v21 = v18;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(a1 + 32);
        if (v25) {
          __int16 v26 = *(void **)(v25 + 72);
        }
        else {
          __int16 v26 = 0;
        }
        [v26 addObject:*(void *)(*((void *)&v32 + 1) + 8 * v24)];
        uint64_t v27 = *(void *)(a1 + 32);
        if (v27) {
          __int16 v28 = *(NSObject **)(v27 + 88);
        }
        else {
          __int16 v28 = 0;
        }
        dispatch_group_enter(v28);
        ++v24;
      }
      while (v22 != v24);
      uint64_t v29 = [v21 countByEnumeratingWithState:&v32 objects:v37 count:16];
      uint64_t v22 = v29;
    }
    while (v29);
  }

  uint64_t v30 = *(void *)(a1 + 32);
  if (v30) {
    v31 = *(NSObject **)(v30 + 88);
  }
  else {
    v31 = 0;
  }
  dispatch_group_leave(v31);
  -[FCCommandQueue _scheduleCommandExecution](*(void *)(a1 + 32));
}

- (void)_scheduleCommandExecution
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)FCCommandQueueWorkQueueUnique;
    if (dispatch_get_specific((const void *)FCCommandQueueWorkQueueUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)[[NSString alloc] initWithFormat:@"accessing private structures outside the work queue"];
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCCommandQueue _scheduleCommandExecution]";
      __int16 v19 = 2080;
      v20 = "FCCommandQueue.m";
      __int16 v21 = 1024;
      int v22 = 263;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 2)
    {
      -[FCCommandQueue _executeNextCommand](a1);
    }
    else
    {
      v4 = *(void **)(a1 + 80);
      if (!v4)
      {
        uint64_t v5 = *(id *)(a1 + 64);
        dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
        v7 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v6;

        v8 = *(id *)(a1 + 80);
        uint64_t v9 = -[FCCommandQueue _qualityOfServiceForNextCommand](a1);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__FCCommandQueue__scheduleCommandExecution__block_invoke;
        block[3] = &unk_1E5B4C018;
        block[4] = a1;
        v10 = FCBlockWithQualityOfService(v9, block);
        dispatch_source_set_event_handler(v8, v10);

        dispatch_resume(*(dispatch_object_t *)(a1 + 80));
        uint64_t v3 = *(void *)(a1 + 48);
        v4 = *(void **)(a1 + 80);
      }
      v11 = v4;
      if (v3 == 1) {
        int64_t v12 = 5000000000;
      }
      else {
        int64_t v12 = 60000000000;
      }
      if (v3 == 1) {
        uint64_t v13 = 2000000000;
      }
      else {
        uint64_t v13 = 15000000000;
      }
      dispatch_time_t v14 = dispatch_time(0, v12);
      dispatch_source_set_timer(v11, v14, 0xFFFFFFFFFFFFFFFFLL, v13);
    }
  }
}

- (uint64_t)_qualityOfServiceForNextCommand
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = (id *)(result + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 56));
    if (WeakRetained
      && (v4 = WeakRetained,
          id v5 = objc_loadWeakRetained(v2),
          char v6 = objc_opt_respondsToSelector(),
          v5,
          v4,
          (v6 & 1) != 0))
    {
      id v7 = objc_loadWeakRetained(v2);
      uint64_t v8 = [v7 qualityOfServiceForNextCommandInCommandQueue:v1];

      return v8;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

- (id)initWithContext:(void *)a3 persistentStorePath:(void *)a4 urgency:(int)a5 suspended:(void *)a6 delegate:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v14 = a6;
  if (a1)
  {
    if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCCommandQueue initWithContext:persistentStorePath:urgency:suspended:delegate:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCCommandQueue.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v38) = 82;
      WORD2(v38) = 2114;
      *(void *)((char *)&v38 + 6) = v35;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v36.receiver = a1;
    v36.super_class = (Class)FCCommandQueue;
    id v15 = (id *)objc_msgSendSuper2(&v36, sel_init);
    a1 = v15;
    if (v15)
    {
      if (v12)
      {
        objc_storeStrong(v15 + 2, a2);
        uint64_t v16 = [v13 copy];
        id v17 = a1[3];
        a1[3] = (id)v16;

        v18 = [v13 lastPathComponent];
        uint64_t v19 = [v18 stringByDeletingPathExtension];
        id v20 = a1[4];
        a1[4] = (id)v19;

        uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
        id v22 = a1[9];
        a1[9] = (id)v21;

        dispatch_group_t v23 = dispatch_group_create();
        id v24 = a1[11];
        a1[11] = v23;

        dispatch_group_t v25 = dispatch_group_create();
        id v26 = a1[12];
        a1[12] = v25;

        a1[6] = a4;
        *((unsigned char *)a1 + 8) = a5;
        objc_storeWeak(a1 + 7, v14);
        uint64_t v27 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = @"resumed";
          id v29 = a1[4];
          if (a5) {
            __int16 v28 = @"suspended";
          }
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          uint64_t v30 = v27;
          _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "<%{public}@> command queue created in %{public}@ state", buf, 0x16u);
        }
        self;
        if (qword_1EB5D1660 != -1) {
          dispatch_once(&qword_1EB5D1660, &__block_literal_global_86);
        }
        objc_storeStrong(a1 + 8, (id)_MergedGlobals_177);
        v31 = [v12 networkReachability];
        [v31 addObserver:a1];

        long long v32 = [v12 appActivityMonitor];
        [v32 addObserver:a1];

        [MEMORY[0x1E4F29060] isMainThread];
        if (a1[3])
        {
          dispatch_group_enter((dispatch_group_t)a1[11]);
          long long v33 = a1[8];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __31__FCCommandQueue__loadFromDisk__block_invoke;
          *(void *)&long long v38 = &unk_1E5B4C018;
          *((void *)&v38 + 1) = a1;
          dispatch_async(v33, buf);
        }
      }
      else
      {

        a1 = 0;
      }
    }
  }

  return a1;
}

- (void)_executeNextCommand
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)FCCommandQueueWorkQueueUnique;
    if (dispatch_get_specific((const void *)FCCommandQueueWorkQueueUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)[[NSString alloc] initWithFormat:@"accessing private structures outside the work queue"];
      int v19 = 136315906;
      id v20 = "-[FCCommandQueue _executeNextCommand]";
      __int16 v21 = 2080;
      id v22 = "FCCommandQueue.m";
      __int16 v23 = 1024;
      *(_DWORD *)id v24 = 296;
      *(_WORD *)&v24[4] = 2114;
      *(void *)&v24[6] = v18;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v19, 0x26u);
    }
    if (*(unsigned char *)(a1 + 8) || *(unsigned char *)(a1 + 9) || ![*(id *)(a1 + 72) count])
    {
      uint64_t v3 = (void *)FCCommandQueueLog;
      if (!os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v4 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 8)) {
        id v5 = @"true";
      }
      else {
        id v5 = @"false";
      }
      if (*(unsigned char *)(a1 + 9)) {
        char v6 = @"true";
      }
      else {
        char v6 = @"false";
      }
      id v7 = *(id *)(a1 + 72);
      id v8 = v4;
      uint64_t v9 = v3;
      uint64_t v10 = [v7 count];
      int v19 = 138544130;
      id v20 = (const char *)v4;
      __int16 v21 = 2114;
      id v22 = (char *)v5;
      __int16 v23 = 2114;
      *(void *)id v24 = v6;
      *(_WORD *)&v24[8] = 2048;
      *(void *)&v24[10] = v10;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@> not executing next command because suspended=%{public}@, executing=%{public}@, commandCount=%lu", (uint8_t *)&v19, 0x2Au);
    }
    else
    {
      *(unsigned char *)(a1 + 9) = 1;
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 96));
      id v11 = *(id *)(a1 + 72);
      uint64_t v9 = [v11 firstObject];

      id v12 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = v13;
        id v15 = v12;
        uint64_t v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        id v17 = (char *)objc_claimAutoreleasedReturnValue();
        int v19 = 138543874;
        id v20 = (const char *)v13;
        __int16 v21 = 2114;
        id v22 = v17;
        __int16 v23 = 2048;
        *(void *)id v24 = v9;
        _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@> will execute next command: <%{public}@ %p>", (uint8_t *)&v19, 0x20u);
      }
      id v8 = *(id *)(a1 + 16);
      -[NSObject executeWithContext:delegate:qualityOfService:](v9, "executeWithContext:delegate:qualityOfService:", v8, a1, -[FCCommandQueue _qualityOfServiceForNextCommand](a1));
    }
  }
}

- (void)clear
{
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__FCCommandQueue_clear__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)addCommand:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCCommandQueue _addCommand:saveCompletion:]((uint64_t)self, v5, 0);
}

- (void)_addCommand:(void *)a3 saveCompletion:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1 && v5)
  {
    id v7 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v8;
      uint64_t v10 = v7;
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      int v19 = v8;
      __int16 v20 = 2114;
      __int16 v21 = v12;
      __int16 v22 = 2048;
      id v23 = v5;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> will add command <%{public}@ %p>", buf, 0x20u);
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 88));
    id v13 = *(id *)(a1 + 64);
    uint64_t v14 = -[FCCommandQueue _qualityOfServiceForNextCommand](a1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__FCCommandQueue__addCommand_saveCompletion___block_invoke;
    v15[3] = &unk_1E5B4E088;
    v15[4] = a1;
    id v16 = v5;
    id v17 = v6;
    FCDispatchAsyncWithQualityOfService(v13, v14, v15);
  }
}

void __23__FCCommandQueue_clear__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if ((!v2 || !*(unsigned char *)(v2 + 8)) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"should only clear the command queue when it's suspended"];
    int v10 = 136315906;
    id v11 = "-[FCCommandQueue clear]_block_invoke";
    __int16 v12 = 2080;
    id v13 = "FCCommandQueue.m";
    __int16 v14 = 1024;
    int v15 = 240;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  while (1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = v3 ? *(void **)(v3 + 72) : 0;
    uint64_t v5 = [v4 count];
    isa = *(NSObject **)(a1 + 32);
    if (!v5) {
      break;
    }
    if (isa) {
      isa = isa[11].isa;
    }
    dispatch_group_leave(isa);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(void **)(v7 + 72);
    }
    else {
      id v8 = 0;
    }
    [v8 removeObjectAtIndex:0];
  }
  -[FCCommandQueue _savePendingCommands]((uint64_t)isa);
}

- (void)_savePendingCommands
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)FCCommandQueueWorkQueueUnique;
    if (dispatch_get_specific((const void *)FCCommandQueueWorkQueueUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"accessing private structures outside the work queue"];
      *(_DWORD *)id v8 = 136315906;
      *(void *)&v8[4] = "-[FCCommandQueue _savePendingCommands]";
      *(_WORD *)&v8[12] = 2080;
      *(void *)&v8[14] = "FCCommandQueue.m";
      *(_WORD *)&v8[22] = 1024;
      LODWORD(v9) = 366;
      WORD2(v9) = 2114;
      *(void *)((char *)&v9 + 6) = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v8, 0x26u);
    }
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = *(id *)(a1 + 72);
      *(void *)id v8 = MEMORY[0x1E4F143A8];
      *(void *)&v8[8] = 3221225472;
      *(void *)&v8[16] = __45__FCCommandQueue__serializeCommands_toStore___block_invoke;
      *(void *)&long long v9 = &unk_1E5B55AF8;
      *((void *)&v9 + 1) = a1;
      id v5 = v3;
      id v6 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v8);
      [v5 setObject:v6 forKey:@"pendingCommands"];
    }
  }
}

void __33__FCCommandQueue_sharedWorkQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("FCCommandQueue.workQueue", v0);
  uint64_t v2 = (void *)_MergedGlobals_177;
  _MergedGlobals_177 = (uint64_t)v1;

  uint64_t v3 = _MergedGlobals_177;
  id v4 = (const void *)FCCommandQueueWorkQueueUnique;
  id v5 = (void *)FCCommandQueueWorkQueueUnique;
  dispatch_queue_set_specific(v3, v4, v5, 0);
}

id __45__FCCommandQueue__serializeCommands_toStore___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void __45__FCCommandQueue__addCommand_saveCompletion___block_invoke(uint64_t *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[9];
  }
  uint64_t v3 = v2;
  id v4 = [v3 lastObject];

  uint64_t v5 = a1[4];
  if (!v5)
  {
LABEL_6:
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(v5 + 9))
  {
    LOBYTE(v5) = [*(id *)(v5 + 72) count] == 1;
    goto LABEL_6;
  }
  LOBYTE(v5) = 0;
  if (!v4) {
    goto LABEL_18;
  }
LABEL_9:
  if ((v5 & 1) != 0 || ![v4 canCoalesceWithCommand:a1[5]])
  {
LABEL_18:
    uint64_t v18 = a1[4];
    if (v18) {
      int v19 = *(void **)(v18 + 72);
    }
    else {
      int v19 = 0;
    }
    [v19 addObject:a1[5]];
    goto LABEL_21;
  }
  id v6 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    if (v7) {
      id v8 = *(void **)(v7 + 32);
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = v6;
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    uint64_t v13 = a1[5];
    __int16 v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    int v21 = 138544386;
    __int16 v22 = v8;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2114;
    __int16 v28 = v15;
    __int16 v29 = 2048;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> will coalesce command <%{public}@ %p> with <%{public}@ %p>", (uint8_t *)&v21, 0x34u);
  }
  [v4 coalesceWithCommand:a1[5]];
  uint64_t v16 = a1[4];
  if (v16) {
    id v17 = *(NSObject **)(v16 + 88);
  }
  else {
    id v17 = 0;
  }
  dispatch_group_leave(v17);
LABEL_21:
  -[FCCommandQueue _savePendingCommands](a1[4]);
  -[FCCommandQueue _scheduleCommandExecution](a1[4]);
  uint64_t v20 = a1[6];
  if (v20) {
    (*(void (**)(void))(v20 + 16))();
  }
}

- (FCCommandQueue)initWithContext:(id)a3 urgency:(int64_t)a4 suspended:(BOOL)a5 delegate:(id)a6
{
  return (FCCommandQueue *)-[FCCommandQueue initWithContext:persistentStorePath:urgency:suspended:delegate:]((id *)&self->super.isa, a3, 0, (void *)a4, a5, a6);
}

- (void)dealloc
{
  if (self) {
    context = self->_context;
  }
  else {
    context = 0;
  }
  id v4 = context;
  uint64_t v5 = [(FCCloudContext *)v4 networkReachability];
  [v5 removeObserver:self];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)FCCommandQueue;
  [(FCCommandQueue *)&v7 dealloc];
}

- (void)resume
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v3 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v9 = name;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@> will resume", buf, 0xCu);
  }
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__FCCommandQueue_resume__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __24__FCCommandQueue_resume__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 8)) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"can't resume the command queue unless it's suspended"];
    int v5 = 136315906;
    id v6 = "-[FCCommandQueue resume]_block_invoke";
    __int16 v7 = 2080;
    id v8 = "FCCommandQueue.m";
    __int16 v9 = 1024;
    int v10 = 152;
    __int16 v11 = 2114;
    __int16 v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_8;
  }
LABEL_5:
  *(unsigned char *)(v2 + 8) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
LABEL_6:
  -[FCCommandQueue _scheduleCommandExecution](v3);
}

- (void)addCommand:(id)a3 saveCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F29060];
  id v7 = a4;
  id v8 = a3;
  [v6 isMainThread];
  -[FCCommandQueue _addCommand:saveCompletion:]((uint64_t)self, v8, v7);
}

- (void)flushWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (-[FCCommandQueue _isEmpty]((BOOL)self))
    {
      int v5 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        if (self) {
          name = self->_name;
        }
        else {
          name = 0;
        }
        *(_DWORD *)buf = 138543362;
        int v15 = (const char *)name;
        id v7 = v5;
        _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> no need to flush command queue because it's empty", buf, 0xCu);
      }
      v4[2](v4, 1);
    }
    else
    {
      if (self) {
        workQueue = self->_workQueue;
      }
      else {
        workQueue = 0;
      }
      int v10 = workQueue;
      uint64_t v11 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __45__FCCommandQueue_flushWithCompletionHandler___block_invoke;
      v12[3] = &unk_1E5B4CC80;
      v12[4] = self;
      uint64_t v13 = v4;
      FCDispatchAsyncWithQualityOfService(v10, v11, v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    int v15 = "-[FCCommandQueue flushWithCompletionHandler:]";
    __int16 v16 = 2080;
    id v17 = "FCCommandQueue.m";
    __int16 v18 = 1024;
    int v19 = 207;
    __int16 v20 = 2114;
    int v21 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (BOOL)_isEmpty
{
  if (result)
  {
    uint64_t v1 = result;
    [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v2 = *(void **)(v1 + 88);
    return FCDispatchGroupIsEmpty(v2);
  }
  return result;
}

void __45__FCCommandQueue_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = (void *)v3[4];
      uint64_t v3 = (void *)v3[9];
    }
    else
    {
      id v4 = 0;
    }
    int v5 = v3;
    id v6 = v4;
    id v7 = v2;
    *(_DWORD *)buf = 138543618;
    __int16 v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> need to flush %lu commands from the command queue", buf, 0x16u);
  }
  -[FCCommandQueue _executeNextCommand](*(void *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    __int16 v9 = *(NSObject **)(v8 + 96);
  }
  else {
    __int16 v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__FCCommandQueue_flushWithCompletionHandler___block_invoke_27;
  v11[3] = &unk_1E5B4C7C0;
  id v10 = *(id *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v10;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v11);
}

uint64_t __45__FCCommandQueue_flushWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  BOOL v2 = -[FCCommandQueue _isEmpty](*(void *)(a1 + 32));
  uint64_t v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);
  return v3(v1, v2);
}

void __43__FCCommandQueue__scheduleCommandExecution__block_invoke(uint64_t a1)
{
  -[FCCommandQueue _executeNextCommand](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(NSObject **)(v2 + 80);
  }
  else {
    uint64_t v3 = 0;
  }
  dispatch_source_cancel(v3);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 80), 0);
  }
}

uint64_t __48__FCCommandQueue__applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  -[FCCommandQueue _executeNextCommand](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(NSObject **)(v2 + 96);
  }
  else {
    uint64_t v3 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_3;
  block[3] = &unk_1E5B4C4D0;
  block[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_group_notify(v3, MEMORY[0x1E4F14428], block);
}

void __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_4;
  v6[3] = &unk_1E5B4F3B0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 saveWithCompletionHandler:v6];
}

void __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_5;
  v4[3] = &unk_1E5B4F3B0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  FCPerformBlockOnMainThread(v4);
}

uint64_t __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)command:(id)a3 didFinishWithStatus:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    __int16 v9 = name;
    id v10 = v7;
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    uint64_t v13 = FCCommandStatusDescription(a4);
    *(_DWORD *)buf = 138544130;
    int v19 = name;
    __int16 v20 = 2114;
    int v21 = v12;
    __int16 v22 = 2048;
    id v23 = v6;
    __int16 v24 = 2114;
    __int16 v25 = v13;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> finished executing command: <%{public}@ %p> with status: %{public}@", buf, 0x2Au);
  }
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  __int16 v15 = workQueue;
  uint64_t v16 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__FCCommandQueue_command_didFinishWithStatus___block_invoke;
  v17[3] = &unk_1E5B51AE8;
  v17[4] = self;
  v17[5] = a4;
  FCDispatchAsyncWithQualityOfService(v15, v16, v17);
}

void __46__FCCommandQueue_command_didFinishWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(unsigned char *)(v2 + 9) = 0;
  }
  switch(*(void *)(a1 + 40))
  {
    case 0:
    case 3:
      uint64_t v3 = (void *)FCCommandQueueLog;
      BOOL v4 = os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT);
      uint64_t v5 = *(void *)(a1 + 32);
      if (v4)
      {
        if (v5) {
          uint64_t v5 = *(void *)(v5 + 32);
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v5;
        id v6 = v3;
        _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@> will move on to the next command", buf, 0xCu);

        uint64_t v5 = *(void *)(a1 + 32);
      }
      if (v5) {
        id v7 = *(NSObject **)(v5 + 88);
      }
      else {
        id v7 = 0;
      }
      dispatch_group_leave(v7);
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        __int16 v9 = *(void **)(v8 + 72);
      }
      else {
        __int16 v9 = 0;
      }
      [v9 removeObjectAtIndex:0];
      -[FCCommandQueue _savePendingCommands](*(void *)(a1 + 32));
      -[FCCommandQueue _executeNextCommand](*(void *)(a1 + 32));
      break;
    case 1:
      id v10 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11) {
          uint64_t v11 = *(void *)(v11 + 32);
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v11;
        id v12 = v10;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@> will try to execute the next command when the network is available", buf, 0xCu);
      }
      break;
    case 2:
      uint64_t v13 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        if (v14) {
          uint64_t v14 = *(void *)(v14 + 32);
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v14;
        __int16 v15 = v13;
        _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@> will try to execute the next command in 60s since we got a retry-later error", buf, 0xCu);
      }
      dispatch_time_t v16 = dispatch_time(0, 60000000000);
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        __int16 v18 = *(void **)(v17 + 64);
      }
      else {
        __int16 v18 = 0;
      }
      int v19 = v18;
      uint64_t v20 = -[FCCommandQueue _qualityOfServiceForNextCommand](v17);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__FCCommandQueue_command_didFinishWithStatus___block_invoke_47;
      block[3] = &unk_1E5B4C018;
      block[4] = *(void *)(a1 + 32);
      int v21 = FCBlockWithQualityOfService(v20, block);
      dispatch_after(v16, v19, v21);

      break;
    default:
      break;
  }
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    id v23 = *(NSObject **)(v22 + 96);
  }
  else {
    id v23 = 0;
  }
  dispatch_group_leave(v23);
}

void __46__FCCommandQueue_command_didFinishWithStatus___block_invoke_47(uint64_t a1)
{
}

id __48__FCCommandQueue__deserializeCommandsFromStore___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28DC0];
    id v3 = a2;
    BOOL v4 = objc_msgSend(v2, "nf_securelyUnarchiveObjectOfClass:withData:", objc_opt_class(), v3);
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (void)networkReachabilityDidChange:(id)a3
{
  if ([a3 isNetworkReachable])
  {
    if (self) {
      workQueue = self->_workQueue;
    }
    else {
      workQueue = 0;
    }
    uint64_t v5 = workQueue;
    uint64_t v6 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__FCCommandQueue_networkReachabilityDidChange___block_invoke;
    v7[3] = &unk_1E5B4C018;
    v7[4] = self;
    FCDispatchAsyncWithQualityOfService(v5, v6, v7);
  }
}

void __47__FCCommandQueue_networkReachabilityDidChange___block_invoke(uint64_t a1)
{
}

- (void)activityObservingApplicationDidEnterBackground
{
  if (self)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    id v3 = [(FCCloudContext *)self->_context networkReachability];
    int v4 = [v3 isNetworkReachable];

    if (v4)
    {
      uint64_t v5 = self->_context;
      uint64_t v6 = [(FCCloudContext *)v5 backgroundTaskable];

      uint64_t v18 = 0;
      int v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke;
      v15[3] = &unk_1E5B4F3B0;
      id v7 = v6;
      id v16 = v7;
      uint64_t v17 = &v18;
      uint64_t v8 = objc_msgSend(v7, "fc_beginBackgroundTaskWithName:expirationHandler:", @"Command Queue Flush", v15);
      v19[3] = v8;
      __int16 v9 = self->_workQueue;
      uint64_t v10 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_2;
      v12[3] = &unk_1E5B4C4D0;
      v12[4] = self;
      id v11 = v7;
      id v13 = v11;
      uint64_t v14 = &v18;
      FCDispatchAsyncWithQualityOfService(v9, v10, v12);

      _Block_object_dispose(&v18, 8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executingCommandsGroup, 0);
  objc_storeStrong((id *)&self->_pendingCommandsGroup, 0);
  objc_storeStrong((id *)&self->_cooldownTimer, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_persistentStorePath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end