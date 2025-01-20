@interface VUIAppReviewManager
+ (id)sharedInstance;
- (BOOL)_isYouthAccount;
- (BOOL)_shouldAttemptToPrompt;
- (VUIAppReviewManager)init;
- (unint64_t)lastPlaybackEvent;
- (void)_attemptToPrompt;
- (void)_handleIsPlaybackUIBeingShownDidChange:(id)a3;
- (void)_resetStates;
- (void)dealloc;
- (void)isFeatureEnabled:(id)a3;
- (void)processAddToUpNext;
- (void)reportApplicationDidForegroundtoAMSSharedStoreReview;
- (void)setLastPlaybackEvent:(unint64_t)a3;
- (void)setMostRecentPlaybackProgressForNonTrailerContent:(double)a3;
@end

@implementation VUIAppReviewManager

- (void)reportApplicationDidForegroundtoAMSSharedStoreReview
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_50);
  }
  v2 = (void *)sharedInstance_singleton_0;
  return v2;
}

- (void)isFeatureEnabled:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VUIAppReviewManager_isFeatureEnabled___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __40__VUIAppReviewManager_isFeatureEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __37__VUIAppReviewManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIAppReviewManager);
  v1 = (void *)sharedInstance_singleton_0;
  sharedInstance_singleton_0 = (uint64_t)v0;
}

- (VUIAppReviewManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)VUIAppReviewManager;
  v2 = [(VUIAppReviewManager *)&v24 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_numberOfAddToUpNexts = [v3 integerForKey:@"AppReviewNumberOfAddToUpNexts"];

    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_numberOfPlaybacks = [v4 integerForKey:@"AppReviewNumberOfPlaybacks"];

    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 integerForKey:@"AppReviewAfterNthAddToUpNext"];
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 3;
    }
    v2->_numberOfAddToUpNextsBeforePrompting = v7;

    id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v9 = [v8 integerForKey:@"AppReviewAfterNthPlaybacks"];
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 3;
    }
    v2->_numberOfPlaybacksBeforePrompting = v10;

    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v11 doubleForKey:@"AppReviewMinCompletionThreshold"];
    v2->_double completionThreshold = v12;

    double completionThreshold = v2->_completionThreshold;
    if (completionThreshold <= 0.0 || completionThreshold > 1.0) {
      v2->_double completionThreshold = 0.7;
    }
    v2->_lastPlaybackEvent = 0;
    v15 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F4DE18]) initWithBag:v15];
    sharedStoreReview = v2->_sharedStoreReview;
    v2->_sharedStoreReview = (AMSSharedStoreReview *)v16;

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v19 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    v20 = +[VUIPlaybackManager sharedInstance];
    [v18 addObserver:v2 selector:sel__handleIsPlaybackUIBeingShownDidChange_ name:v19 object:v20];

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.tv.appreviewmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v21;
  }
  return v2;
}

void __40__VUIAppReviewManager_isFeatureEnabled___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained) {
    char v4 = [WeakRetained[7] isEnabled];
  }
  else {
    char v4 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  uint64_t v6 = __40__VUIAppReviewManager_isFeatureEnabled___block_invoke_2;
  uint64_t v7 = &unk_1E6DF6338;
  id v8 = *(id *)(a1 + 32);
  char v9 = v4;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v5[0], 3221225472)) {
    v6((uint64_t)v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)processAddToUpNext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(VUIAppReviewManager *)self _isYouthAccount])
  {
    v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Skip Add to Up Next -- Ineligible Account", buf, 2u);
    }
  }
  else
  {
    char v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    ++self->_numberOfAddToUpNexts;
    objc_msgSend(v4, "setInteger:forKey:");

    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numberOfAddToUpNexts = self->_numberOfAddToUpNexts;
      unint64_t numberOfAddToUpNextsBeforePrompting = self->_numberOfAddToUpNextsBeforePrompting;
      *(_DWORD *)buf = 134218240;
      unint64_t v12 = numberOfAddToUpNexts;
      __int16 v13 = 2048;
      unint64_t v14 = numberOfAddToUpNextsBeforePrompting;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Add to Up Next -- up next: %lu/%lu", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__VUIAppReviewManager_processAddToUpNext__block_invoke;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __41__VUIAppReviewManager_processAddToUpNext__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _shouldAttemptToPrompt])
  {
    v2 = VUIDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: initiate user prompt triggered by Add to Up Next", v3, 2u);
    }

    [WeakRetained _attemptToPrompt];
  }
}

- (void)setMostRecentPlaybackProgressForNonTrailerContent:(double)a3
{
  if (self->_highestPlaybackProgress < a3) {
    self->_highestPlaybackProgress = a3;
  }
}

- (void)_handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  if ([(VUIAppReviewManager *)self _isYouthAccount])
  {
    char v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Skip Playback -- Ineligible Account", buf, 2u);
    }
  }
  else
  {
    v5 = +[VUIAppReviewManager sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke;
    v6[3] = &unk_1E6DF5B20;
    v6[4] = self;
    [v5 isFeatureEnabled:v6];
  }
}

void __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = +[VUIPlaybackManager sharedInstance];
    char v4 = [v3 isPlaybackUIBeingShown];

    if ((v4 & 1) == 0)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      dispatch_time_t v5 = dispatch_time(0, 1000000000);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke_2;
      v6[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v7, &location);
      dispatch_after(v5, MEMORY[0x1E4F14428], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[VideosUI handlePlaybackDidEndForTCC];
  v2 = +[VideosUI getFullorHalfSheetPromptedAt];

  if (!v2)
  {
    v3 = +[VUIPlaybackManager sharedInstance];
    int v4 = [v3 isPlaybackUIBeingShown];

    if (v4)
    {
      dispatch_time_t v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        uint64_t v6 = "VUIAppReviewManager: Skip Playback -- Playback UI being shown";
LABEL_16:
        char v9 = v5;
        uint32_t v10 = 2;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    if ([WeakRetained lastPlaybackEvent] == 1)
    {
      dispatch_time_t v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        uint64_t v6 = "VUIAppReviewManager: Skip Playback -- There was an error";
        goto LABEL_16;
      }
LABEL_18:

      [WeakRetained _resetStates];
      goto LABEL_19;
    }
    if (*((double *)WeakRetained + 6) < *((double *)WeakRetained + 5))
    {
      dispatch_time_t v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = WeakRetained[5];
        uint64_t v8 = WeakRetained[6];
        int v16 = 134218240;
        uint64_t v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = v8;
        uint64_t v6 = "VUIAppReviewManager: Skip Playback -- live events or less than completion threshold %.02f -- progress %.02f";
        char v9 = v5;
        uint32_t v10 = 22;
LABEL_17:
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v16, v10);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    ++WeakRetained[2];
    objc_msgSend(v11, "setInteger:forKey:");

    unint64_t v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = WeakRetained[2];
      uint64_t v14 = WeakRetained[4];
      int v16 = 134218240;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Playback did end -- playback: %lu/%lu", (uint8_t *)&v16, 0x16u);
    }

    if ([WeakRetained lastPlaybackEvent] == 2)
    {
      dispatch_time_t v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        uint64_t v6 = "VUIAppReviewManager: Skip Playback -- Upsell presented";
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    [WeakRetained _resetStates];
    if ([WeakRetained _shouldAttemptToPrompt])
    {
      uint64_t v15 = VUIDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Initiate prompt. Triggered by playback", (uint8_t *)&v16, 2u);
      }

      [WeakRetained _attemptToPrompt];
    }
  }
LABEL_19:
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIAppReviewManager;
  [(VUIAppReviewManager *)&v4 dealloc];
}

- (void)_resetStates
{
  self->_lastPlaybackEvent = 0;
  self->_highestPlaybackProgress = 0.0;
}

- (BOOL)_isYouthAccount
{
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  objc_super v4 = objc_msgSend(v3, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E4F4D9E0]);
  dispatch_time_t v5 = v4;
  BOOL v6 = v4 && ([v4 BOOLValue] & 1) != 0;

  return v6;
}

- (void)_attemptToPrompt
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_super v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setValue:v4 forKey:@"AppReviewLastPromptedAt"];

  dispatch_time_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 systemVersion];
  [v5 setValue:v7 forKey:@"AppReviewLastPromptedOSVersion"];

  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setInteger:0 forKey:@"AppReviewNumberOfPlaybacks"];

  char v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v9 setInteger:0 forKey:@"AppReviewNumberOfAddToUpNexts"];

  self->_unint64_t numberOfAddToUpNexts = 0;
  self->_numberOfPlaybacks = 0;
  [(AMSSharedStoreReview *)self->_sharedStoreReview didAttemptPromptReview];
  uint32_t v10 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  v11 = [v10 windowScene];
  +[VUIAppStoreReviewWrapper requestReview:v11];

  unint64_t v12 = VUIDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Attempted to prompt", v13, 2u);
  }
}

- (BOOL)_shouldAttemptToPrompt
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = +[VUITVAppLauncher sharedInstance];
  objc_super v4 = [v3 appController];

  dispatch_time_t v5 = +[VUIApplicationRouter topPresentedViewController];
  BOOL v6 = [v5 presentedViewController];
  if (v6) {
    goto LABEL_4;
  }
  BOOL v6 = +[VUIApplicationRouter currentNavigationController];
  uint64_t v7 = [v6 presentedViewController];
  if (v7)
  {

LABEL_4:
LABEL_5:
    uint64_t v8 = VUIDefaultLogObject();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      BOOL v12 = 0;
      goto LABEL_10;
    }
    LOWORD(v22) = 0;
    char v9 = "VUIAppReviewManager: Already presenting";
    goto LABEL_7;
  }
  uint64_t v14 = [v4 navigationController];
  uint64_t v15 = [v14 presentedViewController];

  if (v15) {
    goto LABEL_5;
  }
  if (self->_numberOfAddToUpNexts < self->_numberOfAddToUpNextsBeforePrompting
    && self->_numberOfPlaybacks < self->_numberOfPlaybacksBeforePrompting)
  {
    uint64_t v8 = VUIDefaultLogObject();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    unint64_t numberOfAddToUpNexts = self->_numberOfAddToUpNexts;
    unint64_t numberOfPlaybacks = self->_numberOfPlaybacks;
    unint64_t numberOfAddToUpNextsBeforePrompting = self->_numberOfAddToUpNextsBeforePrompting;
    unint64_t numberOfPlaybacksBeforePrompting = self->_numberOfPlaybacksBeforePrompting;
    int v22 = 134218752;
    unint64_t v23 = numberOfAddToUpNexts;
    __int16 v24 = 2048;
    unint64_t v25 = numberOfAddToUpNextsBeforePrompting;
    __int16 v26 = 2048;
    unint64_t v27 = numberOfPlaybacks;
    __int16 v28 = 2048;
    unint64_t v29 = numberOfPlaybacksBeforePrompting;
    char v9 = "VUIAppReviewManager: -- conditions not met -- up next: %lu/%lu -- playback: %lu/%lu";
    uint32_t v10 = v8;
    uint32_t v11 = 42;
    goto LABEL_8;
  }
  int v20 = [(AMSSharedStoreReview *)self->_sharedStoreReview shouldAttemptPromptReview];
  uint64_t v8 = VUIDefaultLogObject();
  BOOL v21 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v20)
  {
    if (!v21) {
      goto LABEL_9;
    }
    LOWORD(v22) = 0;
    char v9 = "VUIAppReviewManager: [AMSSharedStoreReview shouldAttemptPromptReview] returned NO";
LABEL_7:
    uint32_t v10 = v8;
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v22, v11);
    goto LABEL_9;
  }
  if (v21)
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: [AMSSharedStoreReview shouldAttemptPromptReview] returned YES", (uint8_t *)&v22, 2u);
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (unint64_t)lastPlaybackEvent
{
  return self->_lastPlaybackEvent;
}

- (void)setLastPlaybackEvent:(unint64_t)a3
{
  self->_lastPlaybackEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sharedStoreReview, 0);
}

@end