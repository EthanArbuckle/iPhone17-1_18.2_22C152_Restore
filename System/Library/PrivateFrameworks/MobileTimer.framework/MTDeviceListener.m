@interface MTDeviceListener
+ (BOOL)_latestKeyBagValueForHasBeenUnlockedSinceBoot;
+ (BOOL)hasBeenUnlockedSinceBoot;
+ (id)sharedDeviceListener;
+ (void)_latestKeyBagValueForHasBeenUnlockedSinceBoot;
- (BOOL)_hasBeenUnlockedSinceBoot;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (BOOL)internalHasBeenUnlockedSinceBoot;
- (MTDeviceListener)init;
- (NAScheduler)workScheduler;
- (id)gatherDiagnostics;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)printDiagnostics;
- (void)setInternalHasBeenUnlockedSinceBoot:(BOOL)a3;
- (void)setWorkScheduler:(id)a3;
@end

@implementation MTDeviceListener

+ (id)sharedDeviceListener
{
  if (sharedDeviceListener_onceToken != -1) {
    dispatch_once(&sharedDeviceListener_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)sharedDeviceListener__sharedDeviceListener;
  return v2;
}

uint64_t __40__MTDeviceListener_sharedDeviceListener__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedDeviceListener__sharedDeviceListener;
  sharedDeviceListener__sharedDeviceListener = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTDeviceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTDeviceListener;
  v2 = [(MTDeviceListener *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTDeviceUtilities.work-queue", +[MTScheduler defaultPriority]);
    workScheduler = v2->_workScheduler;
    v2->_workScheduler = (NAScheduler *)v3;
  }
  return v2;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", @"com.apple.mobile.keybagd.first_unlock", a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void (**)(void))a5;
  v7 = MTLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received notification", buf, 0xCu);
  }

  v8 = [(MTDeviceListener *)self workScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke;
  v9[3] = &unk_1E59150A8;
  v9[4] = self;
  [v8 performBlock:v9];

  if (v6) {
    v6[2](v6);
  }
}

void __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() _latestKeyBagValueForHasBeenUnlockedSinceBoot];
  [*(id *)(a1 + 32) setInternalHasBeenUnlockedSinceBoot:v2];
  uint64_t v3 = MTLogForCategory(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v5;
      objc_super v6 = "%{public}@ device has been unlocked";
LABEL_6:
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v7;
    objc_super v6 = "%{public}@ device hasn't been unlocked";
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke_9;
  block[3] = &unk_1E59150A8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ posting MTDeviceHasBeenUnlockedForFirstTime notification", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MTDeviceHasBeenUnlockedForFirstTime" object:0];
}

+ (BOOL)hasBeenUnlockedSinceBoot
{
  uint64_t v2 = [a1 sharedDeviceListener];
  char v3 = [v2 _hasBeenUnlockedSinceBoot];

  return v3;
}

- (BOOL)_hasBeenUnlockedSinceBoot
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(MTDeviceListener *)self workScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MTDeviceListener__hasBeenUnlockedSinceBoot__block_invoke;
  v7[3] = &unk_1E5917F40;
  v7[4] = self;
  v9 = &v10;
  int v5 = v3;
  v8 = v5;
  [v4 performBlock:v7];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __45__MTDeviceListener__hasBeenUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) internalHasBeenUnlockedSinceBoot] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternalHasBeenUnlockedSinceBoot:", objc_msgSend((id)objc_opt_class(), "_latestKeyBagValueForHasBeenUnlockedSinceBoot"));
    uint64_t v2 = MTLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v3 = *(void **)(a1 + 32);
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 1024;
      int v8 = [v3 internalHasBeenUnlockedSinceBoot];
      _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Found initial hasBeenUnlockedSinceBoot value of [%d]", (uint8_t *)&v5, 0x12u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) internalHasBeenUnlockedSinceBoot];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)_latestKeyBagValueForHasBeenUnlockedSinceBoot
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v11 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v7[3] = &unk_1E5914EC0;
    v7[4] = &v8;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v7);
    uint64_t v2 = (uint64_t (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2) {
    +[MTDeviceListener _latestKeyBagValueForHasBeenUnlockedSinceBoot]();
  }
  uint64_t v3 = v2();
  uint64_t v4 = v3;
  if ((v3 & 0x80000000) == 0) {
    return v3 == 1;
  }
  uint64_t v6 = MTLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[MTDeviceListener _latestKeyBagValueForHasBeenUnlockedSinceBoot];
  }

  return 0;
}

- (void)printDiagnostics
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "-----MTDeviceListener-----", (uint8_t *)v5, 2u);
  }

  uint64_t v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(id)objc_opt_class() hasBeenUnlockedSinceBoot];
    v5[0] = 67240192;
    v5[1] = v4;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Unlocked since boot: %{public}d", (uint8_t *)v5, 8u);
  }
}

- (id)gatherDiagnostics
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"Unlocked since boot";
  int v2 = [(id)objc_opt_class() hasBeenUnlockedSinceBoot];
  uint64_t v3 = @"NO";
  if (v2) {
    uint64_t v3 = @"YES";
  }
  v7[0] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (NAScheduler)workScheduler
{
  return self->_workScheduler;
}

- (void)setWorkScheduler:(id)a3
{
}

- (BOOL)internalHasBeenUnlockedSinceBoot
{
  return self->_internalHasBeenUnlockedSinceBoot;
}

- (void)setInternalHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_internalHasBeenUnlockedSinceBoot = a3;
}

- (void).cxx_destruct
{
}

+ (void)_latestKeyBagValueForHasBeenUnlockedSinceBoot
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Received an error when calling MKBDeviceUnlockedSinceBoot().  Error code: [%@]", (uint8_t *)&v4, 0xCu);
}

@end