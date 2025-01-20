@interface WBSSpotlightReindexingBackgroundSystemTaskManager
- (WBSSpotlightReindexingBackgroundSystemTaskManager)init;
- (void)registerAndSubmitRequestForTask:(id)a3;
@end

@implementation WBSSpotlightReindexingBackgroundSystemTaskManager

- (WBSSpotlightReindexingBackgroundSystemTaskManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSSpotlightReindexingBackgroundSystemTaskManager;
  v2 = [(WBSSpotlightReindexingBackgroundSystemTaskManager *)&v13 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.SafariShared.%@.%p", v5, v2];
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)registerAndSubmitRequestForTask:(id)a3
{
  id v4 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke;
  v21[3] = &unk_1E5C9E6C0;
  id v5 = v4;
  id v22 = v5;
  id v6 = (void *)MEMORY[0x1AD0C4F80](v21);
  v7 = [MEMORY[0x1E4F4F440] sharedScheduler];
  int v8 = [v7 registerForTaskWithIdentifier:@"com.apple.SafariShared.SpotlightReindexing" usingQueue:self->_internalQueue launchHandler:v6];

  dispatch_queue_t v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Successfully registered background system task to reindex all items to Spotlight.", buf, 2u);
    }
    v11 = [MEMORY[0x1E4F4F440] sharedScheduler];
    v12 = [v11 taskRequestForIdentifier:@"com.apple.SafariShared.SpotlightReindexing"];

    if (v12)
    {
      objc_super v13 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Not submitting background system task to reindex all items to Spotlight due to an existing pending task request.", buf, 2u);
      }
    }
    else
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F4F418]) initWithIdentifier:@"com.apple.SafariShared.SpotlightReindexing"];
      [v12 setPriority:2];
      [v12 setRequiresExternalPower:1];
      [v12 setResourceIntensive:1];
      v14 = [MEMORY[0x1E4F4F440] sharedScheduler];
      id v19 = 0;
      char v15 = [v14 submitTaskRequest:v12 error:&v19];
      v16 = (__CFString *)v19;

      v17 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_INFO, "Submitted background system task request to reindex all items to Spotlight.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[WBSSpotlightReindexingBackgroundSystemTaskManager registerAndSubmitRequestForTask:](v16, v18);
      }
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Failed to register background system task to reindex all items to Spotlight.", buf, 2u);
  }
}

void __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_2;
  v10[3] = &unk_1E5C8C9B8;
  v10[4] = &v11;
  [v3 setExpirationHandler:v10];
  if (*((unsigned char *)v12 + 40))
  {
    id v9 = 0;
    char v4 = [v3 setTaskExpiredWithRetryAfter:&v9 error:0.0];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_cold_1((uint64_t)v5, v6);
      }
      [v3 setTaskCompleted];
    }
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Background system task to reindex all items to Spotlight is running.", v8, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [v3 setTaskCompleted];
  }
  _Block_object_dispose(&v11, 8);
}

void __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Background system task to reindex all items to Spotlight is expiring.", v3, 2u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 1;
}

- (void).cxx_destruct
{
}

- (void)registerAndSubmitRequestForTask:(__CFString *)a1 .cold.1(__CFString *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"Unknown";
  if (a1) {
    v2 = a1;
  }
  int v3 = 138412290;
  char v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to submit background system task to reindex all items to Spotlight with error: %@", (uint8_t *)&v3, 0xCu);
}

void __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to expire background system task to reindex all items to Spotlight with error: %@", (uint8_t *)&v2, 0xCu);
}

@end