@interface ICSecurityInfo
+ (ICSecurityInfo)sharedSecurityInfo;
- (BOOL)isContentProtectionEnabled;
- (BOOL)isDeviceClassCUnlocked;
- (BOOL)isDeviceUnlocked;
- (ICSecurityInfo)init;
- (void)_getContentProtectionEnabled:(BOOL *)a3 isDeviceClassCUnlocked:(BOOL *)a4;
- (void)_loadContentProtectionEnabled:(BOOL)a3 isDeviceClassCUnlocked:(BOOL)a4;
- (void)_processFirstUnlockNotification;
- (void)dealloc;
- (void)performBlockAfterFirstUnlock:(id)a3;
@end

@implementation ICSecurityInfo

void *__70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[4] + 10);
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(result[4] + 11);
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = *(unsigned char *)(result[4] + 8);
  *(unsigned char *)(*(void *)(result[8] + 8) + 24) = *(unsigned char *)(result[4] + 9);
  return result;
}

- (void)_getContentProtectionEnabled:(BOOL *)a3 isDeviceClassCUnlocked:(BOOL *)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke;
  block[3] = &unk_1E5ACC1D0;
  block[4] = self;
  block[5] = &v23;
  block[6] = &v19;
  block[7] = &v15;
  block[8] = &v11;
  dispatch_sync(accessQueue, block);
  if (a3 && !*((unsigned char *)v24 + 24) || a4 && !*((unsigned char *)v16 + 24))
  {
    v8 = self->_accessQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_2;
    v9[3] = &unk_1E5ACC1F8;
    v9[7] = a3;
    v9[8] = a4;
    v9[4] = self;
    v9[5] = &v19;
    v9[6] = &v11;
    dispatch_barrier_sync(v8, v9);
  }
  if (a3) {
    *a3 = *((unsigned char *)v20 + 24);
  }
  if (a4) {
    *a4 = *((unsigned char *)v12 + 24);
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

+ (ICSecurityInfo)sharedSecurityInfo
{
  if (sharedSecurityInfo_sOnceToken != -1) {
    dispatch_once(&sharedSecurityInfo_sOnceToken, &__block_literal_global_35112);
  }
  v2 = (void *)sharedSecurityInfo_sSharedInstance;

  return (ICSecurityInfo *)v2;
}

- (BOOL)isContentProtectionEnabled
{
  BOOL v3 = 0;
  [(ICSecurityInfo *)self _getContentProtectionEnabled:&v3 isDeviceClassCUnlocked:0];
  return v3;
}

- (BOOL)isDeviceClassCUnlocked
{
  BOOL v3 = 0;
  [(ICSecurityInfo *)self _getContentProtectionEnabled:0 isDeviceClassCUnlocked:&v3];
  return v3;
}

uint64_t __70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _loadContentProtectionEnabled:*(void *)(a1 + 56) != 0 isDeviceClassCUnlocked:*(void *)(a1 + 64) != 0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 11);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 9);
  return result;
}

- (void)_loadContentProtectionEnabled:(BOOL)a3 isDeviceClassCUnlocked:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  if (!self->_hasLoadedContentProtectionEnabled && v5)
  {
    int v8 = MKBDeviceFormattedForContentProtection();
    if ((v8 & 0x80000000) == 0)
    {
      self->_hasLoadedContentProtectionEnabled = 1;
      self->_isContentProtectionEnabled = v8 == 1;
    }
  }
  if (!self->_hasLoadedDeviceClassCUnlocked && v4)
  {
    int v10 = MKBDeviceUnlockedSinceBoot();
    if (v10 < 0) {
      goto LABEL_22;
    }
    int v11 = v10;
    self->_hasLoadedDeviceClassCUnlocked = 1;
    self->_isDeviceClassCUnlocked = v10 == 1;
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "Initially Class C unlocked.", buf, 2u);
    }

    if (v11 != 1)
    {
LABEL_22:
      if (!self->_firstUnlockNotificationToken)
      {
        accessQueue = self->_accessQueue;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke;
        handler[3] = &unk_1E5ACD450;
        handler[4] = self;
        notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockNotificationToken, accessQueue, handler);
        if (MKBDeviceUnlockedSinceBoot() == 1)
        {
          char v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "Class C unlocked!", buf, 2u);
          }

          [(ICSecurityInfo *)self _processFirstUnlockNotification];
        }
      }
    }
  }
}

uint64_t __36__ICSecurityInfo_sharedSecurityInfo__block_invoke()
{
  sharedSecurityInfo_sSharedInstance = objc_alloc_init(ICSecurityInfo);

  return MEMORY[0x1F41817F8]();
}

- (ICSecurityInfo)init
{
  v12.receiver = self;
  v12.super_class = (Class)ICSecurityInfo;
  v2 = [(ICSecurityInfo *)&v12 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_firstUnlockNotificationToken = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    pendingFirstUnlockBlocks = v3->_pendingFirstUnlockBlocks;
    v3->_pendingFirstUnlockBlocks = (NSMutableArray *)v4;

    v6 = MEMORY[0x1E4F14430];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunescloud.ICSecurityInfo.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.itunescloud.ICSecurityInfo.calloutQueue", v6);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

- (BOOL)isDeviceUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_pendingFirstUnlockBlocks, 0);
}

- (void)_processFirstUnlockNotification
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  *(_WORD *)&self->_hasLoadedDeviceClassCUnlocked = 257;
  int firstUnlockNotificationToken = self->_firstUnlockNotificationToken;
  if (firstUnlockNotificationToken)
  {
    notify_cancel(firstUnlockNotificationToken);
    self->_int firstUnlockNotificationToken = 0;
  }
  uint64_t v4 = (void *)[(NSMutableArray *)self->_pendingFirstUnlockBlocks copy];
  [(NSMutableArray *)self->_pendingFirstUnlockBlocks removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        calloutQueue = self->_calloutQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke;
        block[3] = &unk_1E5ACD170;
        block[4] = v10;
        dispatch_async(calloutQueue, block);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_super v12 = self->_calloutQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke_2;
  v13[3] = &unk_1E5ACD750;
  v13[4] = self;
  dispatch_async(v12, v13);
}

uint64_t __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICSecurityInfoFirstUnlockNotification" object:*(void *)(a1 + 32)];
}

void __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke(uint64_t a1, int token)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  BOOL v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = state64;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "kMobileKeyBagFirstUnlockNotificationID state changed to %llu", buf, 0xCu);
  }

  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_9;
    v6[3] = &unk_1E5ACD750;
    v6[4] = v4;
    dispatch_barrier_async(v5, v6);
  }
}

uint64_t __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_9(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Class C unlocked!", v4, 2u);
  }

  return [*(id *)(a1 + 32) _processFirstUnlockNotification];
}

- (void)performBlockAfterFirstUnlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  __int16 v9 = 0;
  [(ICSecurityInfo *)self _getContentProtectionEnabled:(char *)&v9 + 1 isDeviceClassCUnlocked:&v9];
  if (HIBYTE(v9)) {
    BOOL v5 = v9 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke;
    block[3] = &unk_1E5ACD2F0;
    block[4] = self;
    uint64_t v8 = v4;
    dispatch_barrier_async(accessQueue, block);
  }
  else
  {
    v4[2](v4);
  }
}

void __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadContentProtectionEnabled:1 isDeviceClassCUnlocked:1];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 11) && !*(unsigned char *)(v2 + 9))
  {
    BOOL v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Device locked, waiting for first unlock.", buf, 2u);
    }

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = (void *)MEMORY[0x1A6240BF0](*(void *)(a1 + 40));
    [v6 addObject:v4];
  }
  else
  {
    BOOL v3 = *(NSObject **)(v2 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke_7;
    block[3] = &unk_1E5ACD170;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v3, block);
    uint64_t v4 = v8;
  }
}

uint64_t __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  int firstUnlockNotificationToken = self->_firstUnlockNotificationToken;
  if (firstUnlockNotificationToken)
  {
    notify_cancel(firstUnlockNotificationToken);
    self->_int firstUnlockNotificationToken = 0;
  }
  [(NSMutableArray *)self->_pendingFirstUnlockBlocks removeAllObjects];
  v4.receiver = self;
  v4.super_class = (Class)ICSecurityInfo;
  [(ICSecurityInfo *)&v4 dealloc];
}

@end