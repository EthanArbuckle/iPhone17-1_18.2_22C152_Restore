@interface ML3TerminationCoordinator
+ (ML3TerminationCoordinator)sharedCoordinator;
- (BOOL)isSigned;
- (BOOL)isSignedForReason:(int64_t)a3;
- (ML3TerminationCoordinator)init;
- (void)_performTermination;
- (void)dealloc;
- (void)execute;
- (void)secedeForReason:(int64_t)a3;
- (void)signForReason:(int64_t)a3;
@end

@implementation ML3TerminationCoordinator

void __43__ML3TerminationCoordinator_signForReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v1 addObject:v2];
}

+ (ML3TerminationCoordinator)sharedCoordinator
{
  if (sharedCoordinator___once != -1) {
    dispatch_once(&sharedCoordinator___once, &__block_literal_global_4455);
  }
  id v2 = (void *)sharedCoordinator___sharedCoordinator;

  return (ML3TerminationCoordinator *)v2;
}

- (BOOL)isSigned
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ML3TerminationCoordinator_isSigned__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)signForReason:(int64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__ML3TerminationCoordinator_signForReason___block_invoke;
  v4[3] = &unk_1E5FB2738;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __37__ML3TerminationCoordinator_isSigned__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t __46__ML3TerminationCoordinator_sharedCoordinator__block_invoke()
{
  sharedCoordinator___sharedCoordinator = objc_alloc_init(ML3TerminationCoordinator);

  return MEMORY[0x1F41817F8]();
}

- (ML3TerminationCoordinator)init
{
  v13.receiver = self;
  v13.super_class = (Class)ML3TerminationCoordinator;
  id v2 = [(ML3TerminationCoordinator *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ML3TerminationCoordinator", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    signatures = v2->_signatures;
    v2->_signatures = v5;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__ML3TerminationCoordinator_init__block_invoke;
    v10[3] = &unk_1E5FB7FA0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.MusicLibrary.execute-coordinated-termination", &v2->_notifyToken, v7, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_performTermination
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    signatures = self->_signatures;
    int v5 = 138543362;
    uint64_t v6 = signatures;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Received notification to perform coordinated termination. Reasons signed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  exit(0);
}

- (void)execute
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    v4 = [v3 processName];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ is requesting coordinated termination", (uint8_t *)&v5, 0xCu);
  }
  notify_post("com.apple.MusicLibrary.execute-coordinated-termination");
}

- (BOOL)isSignedForReason:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ML3TerminationCoordinator_isSignedForReason___block_invoke;
  block[3] = &unk_1E5FB7B10;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__ML3TerminationCoordinator_isSignedForReason___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 16);
  id v3 = [NSNumber numberWithInteger:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v2 containsObject:v3];
}

- (void)secedeForReason:(int64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__ML3TerminationCoordinator_secedeForReason___block_invoke;
  v4[3] = &unk_1E5FB2738;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

void __45__ML3TerminationCoordinator_secedeForReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v1 removeObject:v2];
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)ML3TerminationCoordinator;
  [(ML3TerminationCoordinator *)&v3 dealloc];
}

uint64_t __33__ML3TerminationCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    if ([WeakRetained isSigned]) {
      [v3 _performTermination];
    }
  }

  return MEMORY[0x1F41817F8]();
}

@end