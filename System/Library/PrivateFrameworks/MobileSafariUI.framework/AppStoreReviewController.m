@interface AppStoreReviewController
+ (id)sharedController;
- (AppStoreReviewController)init;
- (void)_setupSharedStoreReviewIfNeeded;
- (void)applicationDidEnterForeground;
- (void)showAppReviewPromptInSceneIfNeeded:(id)a3;
@end

@implementation AppStoreReviewController

uint64_t __57__AppStoreReviewController_applicationDidEnterForeground__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupSharedStoreReviewIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 applicationDidForeground];
}

- (void)_setupSharedStoreReviewIfNeeded
{
  if (!self->_sharedStoreReview)
  {
    id v7 = [MEMORY[0x1E4F4DE18] bagSubProfile];
    v3 = [MEMORY[0x1E4F4DE18] bagSubProfileVersion];
    v4 = [MEMORY[0x1E4F4DBD8] bagForProfile:v7 profileVersion:v3];
    v5 = (AMSSharedStoreReview *)[objc_alloc(MEMORY[0x1E4F4DE18]) initWithBag:v4];
    sharedStoreReview = self->_sharedStoreReview;
    self->_sharedStoreReview = v5;
  }
}

- (void)applicationDidEnterForeground
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AppStoreReviewController_applicationDidEnterForeground__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

void __44__AppStoreReviewController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(AppStoreReviewController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;
}

- (AppStoreReviewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AppStoreReviewController;
  v2 = [(AppStoreReviewController *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobilesafari.AMSSharedStoreReviewQueue", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)showAppReviewPromptInSceneIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"DebugReviewShouldAlwaysShowPromptPreferenceKey"];

  if (v6)
  {
    [MEMORY[0x1E4F3C318] requestReviewInScene:v4];
  }
  else
  {
    internalQueue = self->_internalQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke;
    v8[3] = &unk_1E6D77D90;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(internalQueue, v8);
  }
}

void __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupSharedStoreReviewIfNeeded];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) shouldAttemptReview];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2;
  v5[3] = &unk_1E6D7AB18;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 addFinishBlock:v5];
}

void __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 BOOLValue] & 1) == 0)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXAppReviewPrompt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2_cold_1(v7, v6);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_7;
    block[3] = &unk_1E6D77E20;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    [*(id *)(*(void *)(a1 + 40) + 8) didAttemptPromptReview];
  }
}

uint64_t __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_7(uint64_t a1)
{
  return [MEMORY[0x1E4F3C318] requestReviewInScene:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_sharedStoreReview, 0);
}

void __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Failed to get result from AMS: %@", (uint8_t *)&v5, 0xCu);
}

@end