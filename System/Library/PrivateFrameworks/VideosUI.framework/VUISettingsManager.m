@interface VUISettingsManager
+ (BOOL)isPostPlayAutoPlayEnabledForType:(unint64_t)a3;
+ (id)sharedInstance;
+ (unint64_t)_wlkTypeFromVUIPostPlayType:(unint64_t)a3;
- (BOOL)_hasPreferredVideoFormatChanged;
- (BOOL)_hasRTLChanged;
- (BOOL)_hasRestrictionsChanged;
- (BOOL)_hasUpNextLockupsUseCoverArtChanged;
- (BOOL)_upNextLockupsUseCoverArt;
- (BOOL)isAppInstallationAllowed;
- (BOOL)upNextLockupsUseCoverArt;
- (NSNumber)isRTL;
- (NSNumber)maxMovieRank;
- (NSNumber)maxTVShowRank;
- (NSString)preferredVideoFormat;
- (NSString)restrictions;
- (VUISettingsManager)init;
- (WLKSystemPreferencesStore)preferencesStore;
- (id)_formatStringForVideoFormat:(unint64_t)a3;
- (id)_init;
- (id)_isRTL;
- (id)_restrictionsMaximumEffectiveMovieRanking;
- (id)_restrictionsMaximumEffectiveTVShowRanking;
- (id)preferencesJSONData;
- (unint64_t)_preferredVideoFormat;
- (void)_handlePreferencesChange:(id)a3;
- (void)_sendSettingsValuesToJS:(id)a3;
- (void)_setupNotificationObservers;
- (void)_teardownNotificationObservers;
- (void)checkAndUpdateSettings;
- (void)createSettingsStore;
- (void)dealloc;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setIsRTL:(id)a3;
- (void)setMaxMovieRank:(id)a3;
- (void)setMaxTVShowRank:(id)a3;
- (void)setPreferencesStore:(id)a3;
- (void)setPreferredVideoFormat:(id)a3;
- (void)setUpNextLockupsUseCoverArt:(BOOL)a3;
@end

@implementation VUISettingsManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_3 != -1) {
    dispatch_once(&sharedInstance___onceToken_3, &__block_literal_global_27);
  }
  v2 = (void *)sharedInstance___instance_1;
  return v2;
}

void __36__VUISettingsManager_sharedInstance__block_invoke()
{
  id v0 = [[VUISettingsManager alloc] _init];
  v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;
}

- (id)preferencesJSONData
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v4 = [(VUISettingsManager *)self maxMovieRank];
  if (v4)
  {
    [v3 setObject:v4 forKey:@"maxMovieRank"];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v5 forKey:@"maxMovieRank"];
  }
  v6 = [(VUISettingsManager *)self maxTVShowRank];
  if (v6)
  {
    [v3 setObject:v6 forKey:@"maxTVShowRank"];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v7 forKey:@"maxTVShowRank"];
  }
  v8 = [(VUISettingsManager *)self preferredVideoFormat];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v8, @"preferredVideoFormat");

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUISettingsManager upNextLockupsUseCoverArt](self, "upNextLockupsUseCoverArt"));
  [v3 setObject:v9 forKey:@"upNextLockupsUseCoverArt"];

  v10 = [(VUISettingsManager *)self isRTL];
  [v3 setObject:v10 forKey:@"isRTL"];

  return v3;
}

- (BOOL)upNextLockupsUseCoverArt
{
  return self->_upNextLockupsUseCoverArt;
}

- (NSString)preferredVideoFormat
{
  return self->_preferredVideoFormat;
}

- (NSNumber)maxTVShowRank
{
  return self->_maxTVShowRank;
}

- (NSNumber)maxMovieRank
{
  return self->_maxMovieRank;
}

- (NSNumber)isRTL
{
  return self->_isRTL;
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)VUISettingsManager;
  v2 = [(VUISettingsManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(VUISettingsManager *)v2 _restrictionsMaximumEffectiveMovieRanking];
    maxMovieRank = v3->_maxMovieRank;
    v3->_maxMovieRank = (NSNumber *)v4;

    uint64_t v6 = [(VUISettingsManager *)v3 _restrictionsMaximumEffectiveTVShowRanking];
    maxTVShowRank = v3->_maxTVShowRank;
    v3->_maxTVShowRank = (NSNumber *)v6;

    uint64_t v8 = [(VUISettingsManager *)v3 _formatStringForVideoFormat:[(VUISettingsManager *)v3 _preferredVideoFormat]];
    preferredVideoFormat = v3->_preferredVideoFormat;
    v3->_preferredVideoFormat = (NSString *)v8;

    uint64_t v10 = [(VUISettingsManager *)v3 _isRTL];
    isRTL = v3->_isRTL;
    v3->_isRTL = (NSNumber *)v10;

    [(VUISettingsManager *)v3 createSettingsStore];
  }
  [(VUISettingsManager *)v3 _setupNotificationObservers];
  return v3;
}

- (void)checkAndUpdateSettings
{
  if (self->_preferencesStore)
  {
    v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings", buf, 2u);
    }

    BOOL v4 = [(VUISettingsManager *)self _hasRestrictionsChanged];
    BOOL v5 = [(VUISettingsManager *)self _hasPreferredVideoFormatChanged];
    BOOL v6 = [(VUISettingsManager *)self _hasUpNextLockupsUseCoverArtChanged];
    BOOL v7 = [(VUISettingsManager *)self _hasRTLChanged];
    if (v4 || v5 || v6 || v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__VUISettingsManager_checkAndUpdateSettings__block_invoke;
      v9[3] = &__block_descriptor_33_e8_v12__0B8l;
      BOOL v10 = v6;
      [(VUISettingsManager *)self _sendSettingsValuesToJS:v9];
    }
    else
    {
      uint64_t v8 = VUIDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings - nothing has changed", buf, 2u);
      }
    }
  }
}

- (BOOL)_hasUpNextLockupsUseCoverArtChanged
{
  int upNextLockupsUseCoverArt = self->_upNextLockupsUseCoverArt;
  int v4 = [(VUISettingsManager *)self _upNextLockupsUseCoverArt];
  self->_int upNextLockupsUseCoverArt = v4;
  return upNextLockupsUseCoverArt != v4;
}

- (BOOL)_upNextLockupsUseCoverArt
{
  v2 = [MEMORY[0x1E4FB5178] sharedPreferences];
  char v3 = [v2 upNextLockupsUseCoverArt];

  return v3;
}

- (BOOL)_hasRestrictionsChanged
{
  char v3 = [(VUISettingsManager *)self _restrictionsMaximumEffectiveMovieRanking];
  int v4 = [(VUISettingsManager *)self _restrictionsMaximumEffectiveTVShowRanking];
  BOOL v5 = [NSString stringWithFormat:@"%@-%@", v3, v4];
  id v6 = [(VUISettingsManager *)self restrictions];
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {

LABEL_10:
    v11 = (NSNumber *)[v3 copy];
    maxMovieRank = self->_maxMovieRank;
    self->_maxMovieRank = v11;

    objc_super v13 = (NSNumber *)[v4 copy];
    maxTVShowRank = self->_maxTVShowRank;
    self->_maxTVShowRank = v13;

    BOOL v15 = 0;
    goto LABEL_14;
  }
  if (v7) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
  }
  else
  {
    char v10 = [v6 isEqual:v7];

    if (v10) {
      goto LABEL_10;
    }
  }
  v16 = VUIDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_INFO, "VUISettingsManager - Content restrictions did change", buf, 2u);
  }

  v17 = (NSNumber *)[v3 copy];
  v18 = self->_maxMovieRank;
  self->_maxMovieRank = v17;

  v19 = (NSNumber *)[v4 copy];
  v20 = self->_maxTVShowRank;
  self->_maxTVShowRank = v19;

  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_46_0);
  BOOL v15 = 1;
LABEL_14:

  return v15;
}

- (id)_restrictionsMaximumEffectiveTVShowRanking
{
  return (id)MEMORY[0x1F41682C0](self, a2);
}

- (id)_restrictionsMaximumEffectiveMovieRanking
{
  return (id)MEMORY[0x1F41682B8](self, a2);
}

- (NSString)restrictions
{
  return (NSString *)[NSString stringWithFormat:@"%@-%@", self->_maxMovieRank, self->_maxTVShowRank];
}

- (BOOL)_hasRTLChanged
{
  char v3 = self->_isRTL;
  int v4 = [(VUISettingsManager *)self _isRTL];
  isRTL = self->_isRTL;
  self->_isRTL = v4;
  id v6 = v4;

  return v3 != v6;
}

- (id)_isRTL
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v3 = [v2 userInterfaceLayoutDirection];

  int v4 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v4 numberWithBool:v3 == 1];
}

- (BOOL)_hasPreferredVideoFormatChanged
{
  uint64_t v3 = [(VUISettingsManager *)self _formatStringForVideoFormat:[(VUISettingsManager *)self _preferredVideoFormat]];
  int v4 = self->_preferredVideoFormat;
  BOOL v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    if (v5 && v4) {
      char v7 = [(NSString *)v4 isEqual:v5];
    }
  }

  uint64_t v8 = (NSString *)[(NSString *)v6 copy];
  preferredVideoFormat = self->_preferredVideoFormat;
  self->_preferredVideoFormat = v8;

  if ((v7 & 1) == 0) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_48_0);
  }

  return v7 ^ 1;
}

- (unint64_t)_preferredVideoFormat
{
  v2 = (void *)CFPreferencesCopyAppValue(@"PreferredPurchaseResolution", @"com.apple.videos-preferences");
  unint64_t v3 = v2 && (objc_opt_respondsToSelector() & 1) != 0 && [v2 integerValue] == 1;

  return v3;
}

- (id)_formatStringForVideoFormat:(unint64_t)a3
{
  unint64_t v3 = @"SD";
  if (a3 != 1) {
    unint64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"HD";
  }
}

- (void)createSettingsStore
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__VUISettingsManager_createSettingsStore__block_invoke;
  aBlock[3] = &unk_1E6DF58F8;
  aBlock[4] = self;
  unint64_t v3 = _Block_copy(aBlock);
  int v4 = [MEMORY[0x1E4FB5178] isSystemPreferencesStoreInitializing];
  BOOL v5 = VUIDefaultLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings - WLKSystemPreferencesStore is initializing", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    char v7 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__VUISettingsManager_createSettingsStore__block_invoke_29;
    v10[3] = &unk_1E6DF4D78;
    objc_copyWeak(&v12, &buf);
    id v11 = v3;
    dispatch_async(v7, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&buf);
  }
  else
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUISettingsManager - checkAndUpdateSettings - WLKSystemPreferencesStore already initialized", (uint8_t *)&buf, 2u);
    }

    uint64_t v8 = [MEMORY[0x1E4FB5178] sharedPreferences];
    preferencesStore = self->_preferencesStore;
    self->_preferencesStore = v8;

    (*((void (**)(void *, VUISettingsManager *))v3 + 2))(v3, self);
  }
}

void __41__VUISettingsManager_createSettingsStore__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = a2;
  v3[8] = [v2 _upNextLockupsUseCoverArt];
  [v3 checkAndUpdateSettings];
}

- (void)_setupNotificationObservers
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handlePreferencesChange_ name:*MEMORY[0x1E4FB52A8] object:0];

  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  [v4 registerObserver:self];
}

- (VUISettingsManager)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unimplemented", @"-[VUISettingsManager init] not supported, use +sharedInstance instead", 0 reason userInfo];
  objc_exception_throw(v2);
}

void __44__VUISettingsManager_checkAndUpdateSettings__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"VUIUpNextLockupArtSettingDidChangeNotification" object:0];
  }
}

void __41__VUISettingsManager_createSettingsStore__block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_initWeak(&location, WeakRetained);
  unint64_t v3 = [MEMORY[0x1E4FB5178] sharedPreferences];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__VUISettingsManager_createSettingsStore__block_invoke_2;
  v5[3] = &unk_1E6DF43D0;
  objc_copyWeak(&v8, &location);
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__VUISettingsManager_createSettingsStore__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong(WeakRetained + 6, *(id *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)isPostPlayAutoPlayEnabledForType:(unint64_t)a3
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = [a1 _wlkTypeFromVUIPostPlayType:a3];
    id v6 = [MEMORY[0x1E4FB5128] defaultManager];
    char v7 = [v6 isEnabledForType:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB5178] sharedPreferences];
    char v7 = [v6 postPlayAutoPlayNextVideo];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)isAppInstallationAllowed
{
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isUIAppInstallationAllowed];

  return v3;
}

- (void)dealloc
{
  [(VUISettingsManager *)self _teardownNotificationObservers];
  v3.receiver = self;
  v3.super_class = (Class)VUISettingsManager;
  [(VUISettingsManager *)&v3 dealloc];
}

+ (unint64_t)_wlkTypeFromVUIPostPlayType:(unint64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (void)_teardownNotificationObservers
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  [v4 unregisterObserver:self];
}

- (void)_sendSettingsValuesToJS:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[VUITVAppLauncher sharedInstance];
  id v6 = [v5 appController];

  char v7 = [v6 appContext];
  BOOL v8 = [(VUISettingsManager *)self preferencesJSONData];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke;
  v13[3] = &unk_1E6DF5920;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke_44;
  v11[3] = &unk_1E6DF3D80;
  id v12 = v4;
  id v9 = v4;
  id v10 = v8;
  [v7 evaluate:v13 completionBlock:v11 completionQueue:MEMORY[0x1E4F14428]];
}

void __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"wlSettings"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([v5 hasProperty:@"onPreferencesChange"])
  {
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUISettingsManager - updating user preferences - calling JS", v9, 2u);
    }

    v10[0] = *(void *)(a1 + 32);
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v8 = (id)[v5 invokeMethod:@"onPreferencesChange" withArguments:v7];
  }
}

uint64_t __46__VUISettingsManager__sendSettingsValuesToJS___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUISettingsManager - received notice from MCProfileConnection that content restrictions did change", v6, 2u);
  }

  [(VUISettingsManager *)self checkAndUpdateSettings];
}

void __45__VUISettingsManager__hasRestrictionsChanged__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"VUIRestrictionsDidChangeNotification" object:0];
}

void __53__VUISettingsManager__hasPreferredVideoFormatChanged__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"VUIPreferredVideoFormatDidChangeNotification" object:0];
}

- (void)_handlePreferencesChange:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUISettingsManager - received preferences did change notification", v5, 2u);
  }

  [(VUISettingsManager *)self checkAndUpdateSettings];
}

- (void)setMaxMovieRank:(id)a3
{
}

- (void)setMaxTVShowRank:(id)a3
{
}

- (void)setPreferredVideoFormat:(id)a3
{
}

- (void)setUpNextLockupsUseCoverArt:(BOOL)a3
{
  self->_int upNextLockupsUseCoverArt = a3;
}

- (void)setIsRTL:(id)a3
{
}

- (WLKSystemPreferencesStore)preferencesStore
{
  return self->_preferencesStore;
}

- (void)setPreferencesStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesStore, 0);
  objc_storeStrong((id *)&self->_isRTL, 0);
  objc_storeStrong((id *)&self->_preferredVideoFormat, 0);
  objc_storeStrong((id *)&self->_maxTVShowRank, 0);
  objc_storeStrong((id *)&self->_maxMovieRank, 0);
}

@end