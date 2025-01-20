@interface ICDeviceSetupStatusMonitor
+ (ICDeviceSetupStatusMonitor)sharedMonitor;
- (BOOL)isDeviceSetupComplete;
- (BOOL)isSetupAssistantComplete;
- (id)_init;
- (void)_runAllPendingBlocksOfType:(int64_t)a3;
- (void)dealloc;
- (void)nanoPairedDeviceStatusMonitor:(id)a3 didChangeClientSyncState:(unint64_t)a4;
- (void)performBlockAfterBuddySetup:(id)a3;
- (void)performBlockAfterDeviceSetup:(id)a3;
- (void)setSetupAssistantComplete:(BOOL)a3;
@end

@implementation ICDeviceSetupStatusMonitor

- (BOOL)isDeviceSetupComplete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = +[ICDeviceInfo currentDeviceInfo];
  int v5 = [v4 isWatch];
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 41;
  }
  char v7 = *((unsigned char *)&self->super.isa + v6);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

+ (ICDeviceSetupStatusMonitor)sharedMonitor
{
  if (sharedMonitor_sOnceToken_18273 != -1) {
    dispatch_once(&sharedMonitor_sOnceToken_18273, &__block_literal_global_18274);
  }
  v2 = (void *)sharedMonitor_sSharedMonitor_18275;

  return (ICDeviceSetupStatusMonitor *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSetupCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_pendingBuddyCompleteBlocks, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_runAllPendingBlocksOfType:(int64_t)a3
{
  int v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v5 = 24;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v5 = 32;
LABEL_5:
    uint64_t v6 = (void *)[*(id *)((char *)&self->super.isa + v5) copy];
    [*(id *)((char *)&self->super.isa + v5) removeAllObjects];
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  char v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v22 = self;
    __int16 v23 = 1024;
    int v24 = [v6 count];
    __int16 v25 = 1024;
    int v26 = v3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Running %d blocks of type %d", buf, 0x18u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        workQueue = self->_workQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__ICDeviceSetupStatusMonitor__runAllPendingBlocksOfType___block_invoke;
        block[3] = &unk_1E5ACD170;
        block[4] = v13;
        dispatch_async(workQueue, block);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

id __57__ICDeviceSetupStatusMonitor__runAllPendingBlocksOfType___block_invoke(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)nanoPairedDeviceStatusMonitor:(id)a3 didChangeClientSyncState:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a4 == 3)
  {
    self->_watchInitialSyncIsComplete = 1;
    char v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[ICDeviceInfo currentDeviceInfo];
      int v9 = 138543618;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Device %{public}@ has completed setup and initial sync", (uint8_t *)&v9, 0x16u);
    }
    [(ICDeviceSetupStatusMonitor *)self _runAllPendingBlocksOfType:1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)performBlockAfterDeviceSetup:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = +[ICDeviceInfo currentDeviceInfo];
    int v7 = [v6 isWatch];
    uint64_t v8 = 40;
    if (v7) {
      uint64_t v8 = 41;
    }
    int v9 = *((unsigned __int8 *)&self->super.isa + v8);

    if (v9)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke_10;
      block[3] = &unk_1E5ACD170;
      __int16 v11 = &v22;
      id v22 = v4;
      dispatch_async(workQueue, block);
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      v14 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A2D01000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ICInitialSync", (const char *)&unk_1A305A88B, buf, 2u);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke;
      v23[3] = &unk_1E5ACA758;
      v24[1] = v13;
      __int16 v11 = (id *)v24;
      v24[0] = v4;
      long long v16 = (void *)MEMORY[0x1A6240BF0](v23);
      long long v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = +[ICDeviceInfo currentDeviceInfo];
        *(_DWORD *)buf = 138543618;
        int v26 = self;
        __int16 v27 = 2114;
        v28 = v18;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Device %{public}@ has not completed setup and initial sync", buf, 0x16u);
      }
      pendingSetupCompleteBlocks = self->_pendingSetupCompleteBlocks;
      v20 = (void *)MEMORY[0x1A6240BF0](v16);
      [(NSMutableArray *)pendingSetupCompleteBlocks addObject:v20];
    }
    os_unfair_lock_unlock(p_lock);
  }
}

uint64_t __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
  int v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2D01000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ICInitialSync", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ICDeviceSetupStatusMonitor_performBlockAfterDeviceSetup___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBlockAfterBuddySetup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_setupAssistantComplete)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__ICDeviceSetupStatusMonitor_performBlockAfterBuddySetup___block_invoke;
      block[3] = &unk_1E5ACD170;
      id v10 = v4;
      dispatch_async(workQueue, block);
    }
    else
    {
      pendingBuddyCompleteBlocks = self->_pendingBuddyCompleteBlocks;
      uint64_t v8 = (void *)MEMORY[0x1A6240BF0](v4);
      [(NSMutableArray *)pendingBuddyCompleteBlocks addObject:v8];
    }
    os_unfair_lock_unlock(p_lock);
  }
}

uint64_t __58__ICDeviceSetupStatusMonitor_performBlockAfterBuddySetup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSetupAssistantComplete:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Setup assistant has completed:%{BOOL}u", (uint8_t *)&v9, 0x12u);
  }

  self->_setupAssistantComplete = v3;
  if (v3)
  {
    [(ICDeviceSetupStatusMonitor *)self _runAllPendingBlocksOfType:0];
    int v7 = +[ICDeviceInfo currentDeviceInfo];
    char v8 = [v7 isWatch];

    if ((v8 & 1) == 0) {
      [(ICDeviceSetupStatusMonitor *)self _runAllPendingBlocksOfType:1];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSetupAssistantComplete
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = !v2->_setupAssistantComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  BOOL v3 = +[ICDeviceInfo currentDeviceInfo];
  int v4 = [v3 isWatch];

  if (v4)
  {
    uint64_t v5 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
    [v5 removeObserver:self];
  }
  int setupAssistantLaunchedNotifyToken = self->_setupAssistantLaunchedNotifyToken;
  if (setupAssistantLaunchedNotifyToken)
  {
    notify_cancel(setupAssistantLaunchedNotifyToken);
    self->_int setupAssistantLaunchedNotifyToken = 0;
  }
  int setupAssistantFinishedNotifyToken = self->_setupAssistantFinishedNotifyToken;
  if (setupAssistantFinishedNotifyToken)
  {
    notify_cancel(setupAssistantFinishedNotifyToken);
    self->_int setupAssistantFinishedNotifyToken = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICDeviceSetupStatusMonitor;
  [(ICDeviceSetupStatusMonitor *)&v8 dealloc];
}

- (id)_init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)ICDeviceSetupStatusMonitor;
  v2 = [(ICDeviceSetupStatusMonitor *)&v25 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    int v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICDeviceSetupStatusMonitor.callBackQueue", v4);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    pendingBuddyCompleteBlocks = v3->_pendingBuddyCompleteBlocks;
    v3->_pendingBuddyCompleteBlocks = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    pendingSetupCompleteBlocks = v3->_pendingSetupCompleteBlocks;
    v3->_pendingSetupCompleteBlocks = (NSMutableArray *)v9;

    __int16 v11 = v3->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__ICDeviceSetupStatusMonitor__init__block_invoke;
    block[3] = &unk_1E5ACD750;
    BOOL v12 = v3;
    int v24 = v12;
    dispatch_sync(v11, block);
    uint64_t v13 = +[ICDeviceInfo currentDeviceInfo];
    int v14 = [v13 isWatch];

    if (v14)
    {
      v15 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
      [v15 addObserver:v12];
      v12[41] = [v15 isInitialSyncComplete];
    }
    long long v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = v12[40];
      long long v18 = +[ICDeviceInfo currentDeviceInfo];
      int v19 = [v18 isWatch];
      uint64_t v20 = 40;
      if (v19) {
        uint64_t v20 = 41;
      }
      int v21 = v12[v20];
      *(_DWORD *)buf = 138543874;
      __int16 v27 = v12;
      __int16 v28 = 1024;
      int v29 = v17;
      __int16 v30 = 1024;
      int v31 = v21;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized. isSetupAssistantComplete=%{BOOL}u, isDeviceSetupComplete=%{BOOL}u", buf, 0x18u);
    }
  }
  return v3;
}

void __35__ICDeviceSetupStatusMonitor__init__block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  v2 = (id *)getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr;
  v46 = (void *)getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_block_invoke;
    v48 = &unk_1E5ACD4F0;
    v49 = &v43;
    BOOL v3 = SetupAssistantLibrary();
    int v4 = dlsym(v3, "BYSetupAssistantLaunchedDarwinNotification");
    *(void *)(v49[1] + 24) = v4;
    getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr = *(void *)(v49[1] + 24);
    v2 = (id *)v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (!v2)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = [NSString stringWithUTF8String:"NSString *getBYSetupAssistantLaunchedDarwinNotification(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"ICDeviceSetupStatusMonitor.m", 23, @"%s", dlerror());

    goto LABEL_29;
  }
  id v5 = *v2;
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering for darwin notification: %{public}@", buf, 0x16u);
    }

    id v9 = v5;
    id v10 = (const char *)[v9 UTF8String];
    __int16 v11 = *(int **)(a1 + 32);
    BOOL v12 = v11 + 12;
    uint64_t v13 = *((void *)v11 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35__ICDeviceSetupStatusMonitor__init__block_invoke_3;
    handler[3] = &unk_1E5AC9510;
    v41 = v11;
    id v42 = v9;
    notify_register_dispatch(v10, v12, v13, handler);

    uint64_t v6 = v41;
  }
  else if (v7)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to weak link symbol BYSetupAssistantLaunchedDarwinNotification", buf, 0xCu);
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  v15 = (id *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  v46 = (void *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke;
    v48 = &unk_1E5ACD4F0;
    v49 = &v43;
    long long v16 = SetupAssistantLibrary();
    int v17 = dlsym(v16, "BYSetupAssistantFinishedDarwinNotification");
    *(void *)(v49[1] + 24) = v17;
    getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = *(void *)(v49[1] + 24);
    v15 = (id *)v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (!v15)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = [NSString stringWithUTF8String:"NSString *getBYSetupAssistantFinishedDarwinNotification(void)"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"ICDeviceSetupStatusMonitor.m", 24, @"%s", dlerror());

LABEL_29:
    __break(1u);
  }
  id v18 = *v15;
  int v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering for darwin notification: %{public}@", buf, 0x16u);
    }

    id v22 = v18;
    __int16 v23 = (const char *)[v22 UTF8String];
    int v24 = *(int **)(a1 + 32);
    objc_super v25 = v24 + 11;
    int v26 = *((void *)v24 + 2);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __35__ICDeviceSetupStatusMonitor__init__block_invoke_5;
    v37[3] = &unk_1E5AC9510;
    v38 = v24;
    id v39 = v22;
    notify_register_dispatch(v23, v25, v26, v37);

    int v19 = v38;
  }
  else if (v20)
  {
    uint64_t v27 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v27;
    _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to weak link symbol BYSetupAssistantFinishedDarwinNotification", buf, 0xCu);
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  __int16 v28 = (unsigned int (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v46 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v48 = &unk_1E5ACD4F0;
    v49 = &v43;
    int v29 = SetupAssistantLibrary();
    __int16 v30 = dlsym(v29, "BYSetupAssistantNeedsToRun");
    *(void *)(v49[1] + 24) = v30;
    getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(v49[1] + 24);
    __int16 v28 = (unsigned int (*)(void))v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (v28)
  {
    [*(id *)(a1 + 32) setSetupAssistantComplete:v28() ^ 1];
  }
  else
  {
    int v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "%{public}@ Could not determine if setup assistant needs to run - assume its not needed", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setSetupAssistantComplete:1];
  }
}

uint64_t __35__ICDeviceSetupStatusMonitor__init__block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Received darwin notification: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) setSetupAssistantComplete:0];
}

uint64_t __35__ICDeviceSetupStatusMonitor__init__block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Received darwin notification: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) setSetupAssistantComplete:1];
}

uint64_t __43__ICDeviceSetupStatusMonitor_sharedMonitor__block_invoke()
{
  id v0 = [[ICDeviceSetupStatusMonitor alloc] _init];
  uint64_t v1 = sharedMonitor_sSharedMonitor_18275;
  sharedMonitor_sSharedMonitor_18275 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end