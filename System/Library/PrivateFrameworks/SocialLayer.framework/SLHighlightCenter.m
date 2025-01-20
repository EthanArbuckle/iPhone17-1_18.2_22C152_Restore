@interface SLHighlightCenter
+ (BOOL)_bundleIDExistsInPreferences:(id)a3;
+ (BOOL)_isShareWithYouEnabled;
+ (BOOL)_isShareWithYouOnboarded;
+ (BOOL)isAutomaticSharingEnabled;
+ (BOOL)isEnabled;
+ (BOOL)isMessagesLocked;
+ (BOOL)isPhotosProcess;
+ (BOOL)shouldShowOnboardingShieldView;
+ (NSString)displayName;
+ (id)SLVariantDefault;
+ (id)SLVariantNewsToday;
+ (id)highlightCenterQueue;
+ (id)rapportClient;
+ (void)_checkAndInitializeBundleIDToAppPreferences:(id)a3;
+ (void)_isShareWithYouEnabled;
+ (void)_isShareWithYouOnboarded;
+ (void)isAutomaticSharingEnabled;
+ (void)isEnabled;
+ (void)shouldShowOnboardingShieldViewForNearbyDevice:(id)a3;
- (NSArray)highlights;
- (NSDate)latestHighlightDate;
- (NSString)displayName;
- (NSString)variant;
- (SLHighlightCenter)init;
- (SLHighlightCenter)initWithAppIdentifier:(id)a3;
- (SLHighlightCenterAPIAdapting)apiAdapterDelegate;
- (SLHighlightCenterDelegate)delegate;
- (SLHighlightsCache)highlightsCache;
- (SLInteractionHandler)interactionHandler;
- (double)decay;
- (double)highlightsRankingScore;
- (id)_initWithAppIdentifier:(id)a3 apiAdapterDelegate:(id)a4;
- (id)appIdentifierForHighlightsCache;
- (id)fetchAttributionForAttributionIdentifier:(id)a3;
- (id)fetchAttributionsForHighlight:(id)a3;
- (int)notificationTokenAppSettingsChanges;
- (int)notificationTokenSettingsChanges;
- (void)_fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 completionBlock:(id)a5;
- (void)_legacyNotifyDelegateDidAddHighlights;
- (void)_legacyNotifyDelegateDidRemoveHighlights:(id)a3;
- (void)_notifyAPIAdapterDelegateHighlightsChanged;
- (void)_registerNotifications;
- (void)appEnablementStateChanged;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)enablementStateChanged;
- (void)feedbackForHighlight:(id)a3 withType:(unint64_t)a4;
- (void)feedbackForHighlight:(id)a3 withType:(unint64_t)a4 completionBlock:(id)a5;
- (void)fetchHighlights:(id)a3;
- (void)fetchHighlightsWithLimit:(unint64_t)a3 completionBlock:(id)a4;
- (void)fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 completionBlock:(id)a5;
- (void)highlightsRankingScore;
- (void)latestHighlightDate;
- (void)runAfterInitialFetch:(id)a3 onQueue:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHighlightsCache:(id)a3;
- (void)setInteractionHandler:(id)a3;
- (void)setVariant:(id)a3;
- (void)updateHighlights;
@end

@implementation SLHighlightCenter

uint64_t __63__SLHighlightCenter__initWithAppIdentifier_apiAdapterDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerNotifications];
}

- (void)_registerNotifications
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
}

+ (id)highlightCenterQueue
{
  if (highlightCenterQueue_onceToken != -1) {
    dispatch_once(&highlightCenterQueue_onceToken, &__block_literal_global_132);
  }
  v2 = (void *)highlightCenterQueue_queue;
  return v2;
}

void __70__SLHighlightCenter__fetchHighlightsWithLimit_reason_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 highlights];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);
}

void __69__SLHighlightCenter_fetchHighlightsWithLimit_reason_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 count];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)appIdentifierForHighlightsCache
{
  uint64_t v2 = [(SLHighlightCenter *)self interactionHandler];
  uint64_t v3 = [v2 appIdentifier];

  return v3;
}

- (SLInteractionHandler)interactionHandler
{
  return self->_interactionHandler;
}

+ (BOOL)isAutomaticSharingEnabled
{
  if ([(id)objc_opt_class() isEnabled]
    && [(id)objc_opt_class() _isShareWithYouEnabled])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 bundleIdentifier];

    if ([(id)objc_opt_class() _bundleIDExistsInPreferences:v3])
    {
      id v4 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
      id v5 = [v4 objectForKey:v3];
      uint64_t v6 = [v5 BOOLValue];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[SLHighlightCenter isAutomaticSharingEnabled];
  }

  return v6;
}

+ (BOOL)isEnabled
{
  if ([a1 isMessagesLocked])
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    uint64_t v2 = [(id)objc_opt_class() _isShareWithYouOnboarded];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[SLHighlightCenter isEnabled];
    }
  }
  return v2;
}

+ (BOOL)isMessagesLocked
{
  if (!_os_feature_enabled_impl() || ![a1 isPhotosProcess]) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:@"com.apple.MobileSMS"];
  char v4 = [v3 isLocked];

  return v4;
}

+ (BOOL)isPhotosProcess
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.mobileslideshow"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.mobileslideshow.PhotosReliveWidget"];
  }

  return v4;
}

+ (BOOL)_isShareWithYouOnboarded
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"SharedWithYouEnabled", @"com.apple.SocialLayer", &keyExistsAndHasValidFormat);
  uint64_t v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[SLHighlightCenter _isShareWithYouOnboarded];
  }

  return keyExistsAndHasValidFormat != 0;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    uint64_t v7 = [(SLHighlightCenter *)self highlights];
    uint64_t v8 = [v7 count];

    if (v8) {
      uint64_t v5 = [(SLHighlightCenter *)self _legacyNotifyDelegateDidAddHighlights];
    }
    else {
      uint64_t v5 = [(SLHighlightCenter *)self updateHighlights];
    }
    id v6 = obj;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (NSArray)highlights
{
  uint64_t v2 = [(SLHighlightCenter *)self highlightsCache];
  uint64_t v3 = [v2 highlights];

  return (NSArray *)v3;
}

- (id)_initWithAppIdentifier:(id)a3 apiAdapterDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SLHighlightCenter;
  uint64_t v8 = [(SLHighlightCenter *)&v27 init];
  if (v8)
  {
    uint64_t v9 = [[SLInteractionHandler alloc] initWithAppIdentifier:v6];
    interactionHandler = v8->_interactionHandler;
    v8->_interactionHandler = v9;

    *(void *)&v8->_notificationTokenSettingsChanges = -1;
    highlights = v8->_highlights;
    v8->_highlights = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];

    if (([v13 isEqualToString:@"com.apple.SLTester"] & 1) != 0
      || [v13 containsString:@"com.apple.sociallayer.GelatoTester"])
    {
      +[SLHighlightCenter _checkAndInitializeBundleIDToAppPreferences:v13];
    }
    v14 = +[SLHighlightCenter SLVariantDefault];
    [(SLHighlightCenter *)v8 setVariant:v14];

    v15 = +[SLHighlightsCache sharedCache];
    [(SLHighlightCenter *)v8 setHighlightsCache:v15];

    v16 = [(SLHighlightCenter *)v8 highlightsCache];
    [v16 addDelegate:v8];

    v17 = [(SLHighlightCenter *)v8 highlightsCache];
    v18 = [v17 highlights];
    uint64_t v19 = [v18 count];

    if (!v19)
    {
      v20 = [(SLHighlightCenter *)v8 highlightsCache];
      [v20 updateHighlights];
    }
    objc_storeWeak((id *)&v8->_apiAdapterDelegate, v7);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SLHighlightCenter__initWithAppIdentifier_apiAdapterDelegate___block_invoke;
    block[3] = &unk_1E58A8720;
    v21 = v8;
    v26 = v21;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (_os_feature_enabled_impl())
    {
      v22 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
      id v23 = (id)[v22 addMonitor:v21 subjectMask:1];
    }
  }

  return v8;
}

- (SLHighlightsCache)highlightsCache
{
  return self->_highlightsCache;
}

- (void)setVariant:(id)a3
{
}

- (void)setHighlightsCache:(id)a3
{
}

+ (id)SLVariantDefault
{
  return (id)*MEMORY[0x1E4F8A190];
}

- (void)updateHighlights
{
}

- (SLHighlightCenter)init
{
  return (SLHighlightCenter *)[(SLHighlightCenter *)self _initWithAppIdentifier:0 apiAdapterDelegate:0];
}

void __41__SLHighlightCenter_highlightCenterQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SocialLayer.HighlightCenterQueue", v2);
  v1 = (void *)highlightCenterQueue_queue;
  highlightCenterQueue_queue = (uint64_t)v0;
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 completionBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "Fetching highlights as a result of a legacy client calling with limit: %lu", (uint8_t *)&v8, 0xCu);
  }

  [(SLHighlightCenter *)self fetchHighlightsWithLimit:a3 reason:0 completionBlock:v6];
}

- (void)fetchHighlights:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "Fetching highlights as a result of a legacy client calling", v6, 2u);
  }

  [(SLHighlightCenter *)self _fetchHighlightsWithLimit:0x7FFFFFFFFFFFFFFFLL reason:0 completionBlock:v4];
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 completionBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v15 = a3;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "Fetching highlights as a result of a legacy client calling with limit: %lu", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SLHighlightCenter_fetchHighlightsWithLimit_reason_completionBlock___block_invoke;
  v12[3] = &unk_1E58A87C0;
  id v13 = v8;
  id v11 = v8;
  [(SLHighlightCenter *)self _fetchHighlightsWithLimit:a3 reason:v9 completionBlock:v12];
}

- (void)_fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "Fetch highlights with limit from SLHighlightCenter", buf, 2u);
  }

  id v11 = [(SLHighlightCenter *)self highlightsCache];
  uint64_t v12 = [(SLHighlightCenter *)self variant];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__SLHighlightCenter__fetchHighlightsWithLimit_reason_completionBlock___block_invoke;
  v14[3] = &unk_1E58A87E8;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 fetchHighlightsWithLimit:a3 reason:v9 variant:v12 completionBlock:v14];
}

- (NSString)variant
{
  return self->_variant;
}

+ (NSString)displayName
{
  uint64_t v2 = SLFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"SHARED_WITH_YOU" value:&stru_1EEC19158 table:@"SocialLayer"];

  return (NSString *)v3;
}

+ (BOOL)_bundleIDExistsInPreferences:(id)a3
{
  id v3 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:v3];

    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)_checkAndInitializeBundleIDToAppPreferences:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length])
  {
    id v6 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[SLHighlightCenter _checkAndInitializeBundleIDToAppPreferences:]();
    }
    goto LABEL_14;
  }
  if (([a1 _isShareWithYouOnboarded] & 1) == 0)
  {
    id v6 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[SLHighlightCenter _checkAndInitializeBundleIDToAppPreferences:]();
    }
    goto LABEL_14;
  }
  if (([(id)objc_opt_class() _bundleIDExistsInPreferences:v4] & 1) == 0)
  {
    uint64_t v5 = CFPreferencesCopyAppValue(@"SharedWithYouApps", @"com.apple.SocialLayer");
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 mutableCopy];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v8 = (void *)v7;
    id v9 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_INFO, "Adding bundleID:%@ to the Shared With You Preferences", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isShareWithYouEnabled"));
    [v8 setObject:v10 forKey:v4];

    CFPreferencesSetAppValue(@"SharedWithYouApps", v8, @"com.apple.SocialLayer");
    CFPreferencesAppSynchronize(@"com.apple.SocialLayer");

LABEL_14:
  }
}

+ (BOOL)_isShareWithYouEnabled
{
  if (([a1 isMessagesLocked] & 1) == 0)
  {
    if ([a1 _isShareWithYouOnboarded])
    {
      id v3 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouEnabled", @"com.apple.SocialLayer");
      char v4 = [v3 BOOLValue];
      CFRelease(v3);
      return v4;
    }
    id v6 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[SLHighlightCenter _isShareWithYouEnabled]();
    }
  }
  return 0;
}

+ (id)rapportClient
{
  if (rapportClient_onceToken != -1) {
    dispatch_once(&rapportClient_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)rapportClient_client;
  return v2;
}

uint64_t __34__SLHighlightCenter_rapportClient__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F946E0]);
  v1 = (void *)rapportClient_client;
  rapportClient_client = (uint64_t)v0;

  uint64_t v2 = [(id)rapportClient_client controlFlags] | 6;
  id v3 = (void *)rapportClient_client;
  return [v3 setControlFlags:v2];
}

+ (BOOL)shouldShowOnboardingShieldView
{
  if ([a1 isMessagesLocked]) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"com.apple.SocialLayer.OnboardingVersionSeen"];

  return v4 ^ 1;
}

+ (void)shouldShowOnboardingShieldViewForNearbyDevice:(id)a3
{
  id v4 = a3;
  if ([a1 shouldShowOnboardingShieldView])
  {
    uint64_t v5 = [a1 rapportClient];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke;
    v7[3] = &unk_1E58A8770;
    char v10 = 1;
    id v8 = v5;
    id v9 = v4;
    id v6 = v5;
    [v6 activateWithCompletion:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SLFrameworkLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_2(v3);
    }
  }
  else if (v5)
  {
    __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_1();
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "sl_phoneAndPadDevices");
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, [v7 count] != 0);
  }
  else
  {
    (*(void (**)(void, void))(v6 + 16))(*(void *)(a1 + 40), 0);
  }
}

+ (id)SLVariantNewsToday
{
  return (id)*MEMORY[0x1E4F8A198];
}

- (SLHighlightCenter)initWithAppIdentifier:(id)a3
{
  return (SLHighlightCenter *)[(SLHighlightCenter *)self _initWithAppIdentifier:a3 apiAdapterDelegate:0];
}

- (double)decay
{
  [MEMORY[0x1E4F89F30] decayInterval];
  return result;
}

- (NSDate)latestHighlightDate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SLHighlightCenter *)self highlights];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) timestamp];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  uint64_t v7 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(SLHighlightCenter *)v7 latestHighlightDate];
  }

  id v15 = [MEMORY[0x1E4F1C9C8] distantPast];

  return (NSDate *)v15;
}

- (double)highlightsRankingScore
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SLHighlightCenter *)self highlights];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    double v6 = 2.22507386e-308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v20 + 1) + 8 * i) score];
        [v8 doubleValue];
        double v10 = v9;

        if (v10 >= v6) {
          double v6 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 2.22507386e-308;
  }
  uint64_t v11 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(SLHighlightCenter *)v11 highlightsRankingScore];
  }

  return v6;
}

- (NSString)displayName
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 displayName];
}

void __43__SLHighlightCenter__registerNotifications__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 enablementStateChanged];

  objc_destroyWeak(&to);
}

void __43__SLHighlightCenter__registerNotifications__block_invoke_148(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 appEnablementStateChanged];

  objc_destroyWeak(&to);
}

- (void)enablementStateChanged
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "Informing the delegate that the enablement has changed", v2, v3, v4, v5, v6);
}

- (void)appEnablementStateChanged
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "Skipping informing the delegate that the enablement for %@ has changed", v2, v3, v4, v5, v6);
}

- (void)_notifyAPIAdapterDelegateHighlightsChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) apiAdapterDelegate];

  if (v2)
  {
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke_cold_1();
    }

    uint64_t v4 = [*(id *)(a1 + 32) apiAdapterDelegate];
    [v4 apiAdapterHighlightsDidChange:*(void *)(a1 + 32)];
  }
}

- (void)_legacyNotifyDelegateDidAddHighlights
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint8_t v6 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke_cold_1();
      }

      uint64_t v7 = [*(id *)(a1 + 32) delegate];
      [v7 highlightCenterDidAddHighlights:*(void *)(a1 + 32)];
    }
  }
}

- (void)_legacyNotifyDelegateDidRemoveHighlights:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke;
  v6[3] = &unk_1E58A8680;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint8_t v6 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke_cold_1(a1);
      }

      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 highlightCenter:*(void *)(a1 + 32) didRemoveHighlights:*(void *)(a1 + 40)];
    }
  }
}

- (void)runAfterInitialFetch:(id)a3 onQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SLHighlightCenter *)self highlightsCache];
  [v8 runAfterInitialFetch:v7 onQueue:v6];
}

- (id)fetchAttributionsForHighlight:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 attributions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA48];
    id v8 = [v4 attributions];
    double v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v10 = objc_msgSend(v4, "attributions", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [(SLHighlightCenter *)self interactionHandler];
          uint64_t v17 = [v15 uniqueIdentifier];
          uint64_t v18 = [v16 fetchAttributionForAttributionIdentifier:v17];

          if (v18) {
            [v9 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    long long v19 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      [(SLHighlightCenter *)v9 fetchAttributionsForHighlight:v19];
    }

    id v20 = [v9 copy];
    [v4 setAttributions:v20];
  }
  else
  {
    double v9 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SLHighlightCenter fetchAttributionsForHighlight:](v4, v9);
    }
  }

  return v4;
}

- (id)fetchAttributionForAttributionIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = SLGeneralTelemetryLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = SLGeneralTelemetryLogHandle();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLHighlightCenterFetchAttributionWithIdentifier", "", buf, 2u);
  }

  double v9 = [(SLHighlightCenter *)self interactionHandler];
  double v10 = [v9 fetchAttributionForAttributionIdentifier:v4];

  uint64_t v11 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SLHighlightCenter fetchAttributionForAttributionIdentifier:]();
  }

  uint64_t v12 = SLGeneralTelemetryLogHandle();
  uint64_t v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v13, OS_SIGNPOST_INTERVAL_END, v6, "SLHighlightCenterFetchAttributionWithIdentifier", "", v15, 2u);
  }

  return v10;
}

- (void)feedbackForHighlight:(id)a3 withType:(unint64_t)a4
{
}

- (void)feedbackForHighlight:(id)a3 withType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SLHighlightCenter feedbackForHighlight:withType:completionBlock:]();
  }

  uint64_t v11 = [(SLHighlightCenter *)self interactionHandler];
  uint64_t v12 = [v8 identifier];
  uint64_t v13 = [(SLHighlightCenter *)self variant];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__SLHighlightCenter_feedbackForHighlight_withType_completionBlock___block_invoke;
  v16[3] = &unk_1E58A8810;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v9;
  unint64_t v20 = a4;
  id v14 = v9;
  id v15 = v8;
  [v11 feedbackForHighlightIdentifier:v12 withType:a4 variant:v13 completionBlock:v16];
}

void __67__SLHighlightCenter_feedbackForHighlight_withType_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = SLFrameworkLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!a2)
  {
    if (v7)
    {
      id v9 = [*(id *)(a1 + 32) identifier];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_INFO, "Error registering feedback for Highlight: %@. Error: %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_8;
  }
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) identifier];
    int v11 = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_INFO, "Feedback for Highlight: %@ was successfully registered", (uint8_t *)&v11, 0xCu);
  }
  if (*(void *)(a1 + 56) == 2)
  {
    os_signpost_id_t v6 = [*(id *)(a1 + 40) highlightsCache];
    [v6 didDeleteHighlightsOrAttributions];
LABEL_8:
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

- (void)dealloc
{
  id v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "In %@ dealloc", v4, v5, v6, v7, v8);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v11 = [v10 bundleIdentifier];
          int v12 = [v11 isEqual:@"com.apple.MobileSMS"];

          if (v12) {
            [(SLHighlightCenter *)self enablementStateChanged];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (SLHighlightCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SLHighlightCenterDelegate *)WeakRetained;
}

- (SLHighlightCenterAPIAdapting)apiAdapterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_apiAdapterDelegate);
  return (SLHighlightCenterAPIAdapting *)WeakRetained;
}

- (void)setInteractionHandler:(id)a3
{
}

- (int)notificationTokenSettingsChanges
{
  return self->_notificationTokenSettingsChanges;
}

- (int)notificationTokenAppSettingsChanges
{
  return self->_notificationTokenAppSettingsChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_highlightsCache, 0);
  objc_storeStrong((id *)&self->_interactionHandler, 0);
  objc_destroyWeak((id *)&self->_apiAdapterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlights, 0);
}

+ (void)isEnabled
{
}

+ (void)isAutomaticSharingEnabled
{
}

+ (void)_checkAndInitializeBundleIDToAppPreferences:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "Not adding bundleID: %@ to App Preferences since its invalid", v2, v3, v4, v5, v6);
}

+ (void)_checkAndInitializeBundleIDToAppPreferences:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "Not adding bundleID: %@ to App Preferences since SharedWithYouEnabled key is not set up yet", v2, v3, v4, v5, v6);
}

+ (void)_isShareWithYouEnabled
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "Did not find Shared With You Enabled Preference", v2, v3, v4, v5, v6);
}

+ (void)_isShareWithYouOnboarded
{
}

void __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "RPCompanionLinkClient activated successfully", v2, v3, v4, v5, v6);
}

void __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "RPCompanionLinkClient activation failed. %@", v4, v5, v6, v7, v8);
}

- (void)latestHighlightDate
{
}

- (void)highlightsRankingScore
{
}

void __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "Informing API adapter delegate highlights did change.", v2, v3, v4, v5, v6);
}

void __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "Informing the delegate didAddHighlights", v2, v3, v4, v5, v6);
}

void __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v1, v2, "Informing the delegate that there are %lu deleted content", v3, v4, v5, v6, v7);
}

- (void)fetchAttributionsForHighlight:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "No attributions in highlight with identifier %@", v4, 0xCu);
}

- (void)fetchAttributionsForHighlight:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  uint64_t v6 = [a2 identifier];
  int v7 = 134218242;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_19BE17000, a3, OS_LOG_TYPE_DEBUG, "Got %lu updated attributions for highlight with identifier %@", (uint8_t *)&v7, 0x16u);
}

- (void)fetchAttributionForAttributionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "Got attributions for identifier %@", v2, v3, v4, v5, v6);
}

- (void)feedbackForHighlight:withType:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "Sending highlight feedback of type %lu to PersonalizationPortrait", v2, v3, v4, v5, v6);
}

@end