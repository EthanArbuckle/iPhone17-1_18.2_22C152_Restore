@interface WBSBannerTracker
+ (id)sharedTracker;
- (BOOL)shouldBlockForIdentifier:(id)a3 withDismissCount:(unint64_t)a4;
- (NSString)categoryName;
- (WBSBannerTracker)init;
- (id)_filePath;
- (int64_t)basis;
- (void)_saveOnInteralQueue;
- (void)blockBannerForIdentifier:(id)a3;
- (void)clear;
- (void)isBannerBlockedForIdentifier:(id)a3 completion:(id)a4;
- (void)load;
- (void)unblockBannerForIdentifier:(id)a3;
@end

@implementation WBSBannerTracker

void __24__WBSBannerTracker_load__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[1])
  {
    v3 = (void *)MEMORY[0x1E4F1C9B8];
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = [v2 _filePath];
    v6 = [v4 fileURLWithPath:v5 isDirectory:0];
    v7 = [v3 dataWithContentsOfURL:v6 options:8 error:0];

    if (v7)
    {
      id v16 = 0;
      uint64_t v17 = 200;
      uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:1 format:&v17 error:&v16];
      id v9 = v16;
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 8);
      *(void *)(v10 + 8) = v8;
    }
    else
    {
      id v9 = 0;
    }
    if (!*(void *)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 8);
      *(void *)(v13 + 8) = v12;

      if (v9)
      {
        v15 = WBS_LOG_CHANNEL_PREFIXBanners();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __24__WBSBannerTracker_load__block_invoke_cold_1(v15, v9);
        }
      }
    }
  }
}

- (id)_filePath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WBSBannerTracker__filePath__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  if (_filePath_once != -1) {
    dispatch_once(&_filePath_once, block);
  }
  return (id)_filePath_path;
}

- (void)load
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__WBSBannerTracker_load__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __29__WBSBannerTracker__filePath__block_invoke(uint64_t a1)
{
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = objc_msgSend(v11, "safari_mobileSafariContainerDirectoryURL");
  v3 = [v2 path];
  v4 = [v3 stringByAppendingPathComponent:@"Library"];

  v5 = [v4 stringByAppendingPathComponent:@"WebKit"];
  objc_msgSend(v11, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v5, 0);
  v6 = NSString;
  v7 = [*(id *)(a1 + 32) categoryName];
  uint64_t v8 = [v6 stringWithFormat:@"%@.plist", v7];
  uint64_t v9 = [v5 stringByAppendingPathComponent:v8];
  uint64_t v10 = (void *)_filePath_path;
  _filePath_path = v9;
}

- (WBSBannerTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSBannerTracker;
  v2 = [(WBSBannerTracker *)&v11 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.%@", v5];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = v2;
  }

  return v2;
}

+ (id)sharedTracker
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__WBSBannerTracker_sharedTracker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTracker_once != -1) {
    dispatch_once(&sharedTracker_once, block);
  }
  v2 = (void *)sharedTracker_sharedTracker;
  return v2;
}

void __33__WBSBannerTracker_sharedTracker__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedTracker_sharedTracker;
  sharedTracker_sharedTracker = (uint64_t)v0;
}

- (NSString)categoryName
{
  return 0;
}

- (int64_t)basis
{
  return 0;
}

- (void)clear
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WBSBannerTracker_clear__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __25__WBSBannerTracker_clear__block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v7 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Clearing banner tracker plist which will reset all dismissed banners", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [*(id *)(a1 + 32) _filePath];
  objc_msgSend(v5, "_web_removeFileOnlyAtPath:", v6);
}

- (void)_saveOnInteralQueue
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to serialize banner tracker plist: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)isBannerBlockedForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    [(WBSBannerTracker *)self load];
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke;
    block[3] = &unk_1E5C8C8F8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(internalQueue, block);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) basis];
  if (v2 == 1)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v7 = (int)[v6 intValue];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_3;
    v11[3] = &unk_1E5C8C8D0;
    uint64_t v5 = (id *)v13;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    v13[0] = v8;
    v11[4] = v9;
    id v12 = v10;
    v13[1] = v7;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else
  {
    if (v2) {
      return;
    }
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
    BOOL v4 = v3 != 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_2;
    block[3] = &unk_1E5C8C8A8;
    uint64_t v5 = &v15;
    id v15 = *(id *)(a1 + 48);
    BOOL v16 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 32) shouldBlockForIdentifier:*(void *)(a1 + 40) withDismissCount:*(void *)(a1 + 56)];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)blockBannerForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(WBSBannerTracker *)self load];
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__WBSBannerTracker_blockBannerForIdentifier___block_invoke;
    v6[3] = &unk_1E5C8C920;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(internalQueue, v6);
  }
}

uint64_t __45__WBSBannerTracker_blockBannerForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) basis];
  if (v2 == 1)
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v11 = (int)([v10 intValue] + 1);

    id v12 = [NSNumber numberWithUnsignedInteger:v11];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];

    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)BOOL v16 = 138478083;
      *(void *)&v16[4] = v14;
      *(_WORD *)&v16[12] = 2048;
      *(void *)&v16[14] = v11;
      id v6 = "User has closed Banner for identifier '%{private}@' %lu time(s)";
      id v7 = v13;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 22;
      goto LABEL_7;
    }
  }
  else if (!v2)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

    id v4 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)BOOL v16 = 138543362;
      *(void *)&v16[4] = v5;
      id v6 = "Identifier <%{public}@> is blocked from showing banner.";
      id v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_impl(&dword_1A6B5F000, v7, v8, v6, v16, v9);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_saveOnInteralQueue", *(_OWORD *)v16, *(void *)&v16[16]);
}

- (void)unblockBannerForIdentifier:(id)a3
{
  id v4 = a3;
  [(WBSBannerTracker *)self load];
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__WBSBannerTracker_unblockBannerForIdentifier___block_invoke;
  v7[3] = &unk_1E5C8C920;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __47__WBSBannerTracker_unblockBannerForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Identifier <%{public}@> is unblocked from showing banner.", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _saveOnInteralQueue];
  }
}

- (BOOL)shouldBlockForIdentifier:(id)a3 withDismissCount:(unint64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_blockedBanners, 0);
}

void __24__WBSBannerTracker_load__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to read banner tracker plist: %{public}@", v7, v8, v9, v10, 2u);
}

@end