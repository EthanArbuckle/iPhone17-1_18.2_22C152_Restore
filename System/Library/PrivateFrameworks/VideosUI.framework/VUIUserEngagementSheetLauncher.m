@interface VUIUserEngagementSheetLauncher
+ (id)sharedInstance;
- (BOOL)hasAppLostConnectivity;
- (BOOL)isAnotherSheetShowingToUser;
- (NSString)lastTabIdentifier;
- (VUIUserEngagementSheetLauncher)init;
- (id)_init;
- (unint64_t)firstPromptLaunchNumberAfterGDPR;
- (unint64_t)lastPromptLaunchNumberAfterGDPR;
- (void)_deleteKeysUsedForSheetPresentation;
- (void)_handleNetworkReachabilityDidChangeNotification:(id)a3;
- (void)_handleTabBarChange:(id)a3;
- (void)_handleUserNotificationAction:(int64_t)a3;
- (void)_showNotificationAuthorizationSheet;
- (void)dealloc;
- (void)handleAMSEngagementPresentationSheet:(BOOL)a3 isRepromptSupported:(BOOL)a4;
- (void)handleEngagementRequest:(id)a3 completion:(id)a4;
- (void)setFirstPromptLaunchNumberAfterGDPR:(unint64_t)a3;
- (void)setHasAppLostConnectivity:(BOOL)a3;
- (void)setLastPromptLaunchNumberAfterGDPR:(unint64_t)a3;
- (void)setLastTabIdentifier:(id)a3;
@end

@implementation VUIUserEngagementSheetLauncher

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_0 != -1) {
    dispatch_once(&sharedInstance___onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

void __48__VUIUserEngagementSheetLauncher_sharedInstance__block_invoke()
{
  id v0 = [[VUIUserEngagementSheetLauncher alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

- (VUIUserEngagementSheetLauncher)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (id)_init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VUIUserEngagementSheetLauncher;
  v2 = [(VUIUserEngagementSheetLauncher *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[VUIBarItemSelectionManager lastSelectedIdentifier];
    lastTabIdentifier = v2->_lastTabIdentifier;
    v2->_lastTabIdentifier = (NSString *)v3;

    v2->_hasAppLostConnectivity = 0;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleNetworkReachabilityDidChangeNotification_ name:*MEMORY[0x1E4FB3E08] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleTabBarChange_ name:@"TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification" object:0];

    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_unint64_t firstPromptLaunchNumberAfterGDPR = [v7 integerForKey:@"KettleFirstPromptLaunchNumberAfterGDPR"];

    if (!v2->_firstPromptLaunchNumberAfterGDPR) {
      v2->_unint64_t firstPromptLaunchNumberAfterGDPR = 1;
    }
    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_unint64_t lastPromptLaunchNumberAfterGDPR = [v8 integerForKey:@"KettleLastPromptLaunchNumberAfterGDPR"];

    if (!v2->_lastPromptLaunchNumberAfterGDPR) {
      v2->_unint64_t lastPromptLaunchNumberAfterGDPR = 3;
    }
    v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t firstPromptLaunchNumberAfterGDPR = v2->_firstPromptLaunchNumberAfterGDPR;
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = firstPromptLaunchNumberAfterGDPR;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - firstPromptLaunchNumberAfterGDPR:%lu", buf, 0xCu);
    }

    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unint64_t lastPromptLaunchNumberAfterGDPR = v2->_lastPromptLaunchNumberAfterGDPR;
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = lastPromptLaunchNumberAfterGDPR;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - lastPromptLaunchNumberAfterGDPR:%lu", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIUserEngagementSheetLauncher;
  [(VUIUserEngagementSheetLauncher *)&v4 dealloc];
}

- (void)_handleNetworkReachabilityDidChangeNotification:(id)a3
{
  self->_hasAppLostConnectivity = 1;
}

- (void)handleAMSEngagementPresentationSheet:(BOOL)a3 isRepromptSupported:(BOOL)a4
{
  if (+[VUIGDPRPresentationManager shouldShowWelcomeScreen]|| a3)
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - handleAMSEngagementPresentationSheet additional requirements to show sheet not met.", v9, 2u);
    }
  }
  else
  {
    v7 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke;
    v10[3] = &unk_1E6DF4A80;
    v10[4] = self;
    BOOL v11 = a4;
    [v7 getNotificationSettingsWithCompletionHandler:v10];
  }
}

void __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v8 = __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke_2;
  v9 = &unk_1E6DF4A58;
  objc_copyWeak(&v12, &location);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = v5;
  char v13 = *(unsigned char *)(a1 + 40);
  v6 = v7;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v8((uint64_t)v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - handleAMSEngagementPresentationSheet being called", (uint8_t *)&v25, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"KettleShouldStopShowingAMSSheet"];

  if (![*(id *)(a1 + 32) authorizationStatus]
    && (v5 & 1) == 0
    && ([WeakRetained hasAppLostConnectivity] & 1) == 0
    && ([*(id *)(a1 + 40) isAnotherSheetShowingToUser] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:@"KettleNumberOfAppLaunch"];

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithInt:", objc_msgSend(v7, "intValue") + 1);
    v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Total number of launches: %@", (uint8_t *)&v25, 0xCu);
    }

    id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v10 setValue:v8 forKey:@"KettleNumberOfAppLaunch"];

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    int v12 = [v8 intValue];
    if ([WeakRetained firstPromptLaunchNumberAfterGDPR] == v12)
    {
      char v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v13 setObject:v11 forKey:@"KettleFirstPromptTimestamp"];

      if (!*(unsigned char *)(a1 + 56))
      {
        objc_super v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v14 setBool:1 forKey:@"KettleShouldStopShowingAMSSheet"];
      }
      [*(id *)(a1 + 40) _showNotificationAuthorizationSheet];
    }
    else if (*(unsigned char *)(a1 + 56))
    {
      v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      unint64_t v16 = [v15 objectForKey:@"KettleFirstPromptTimestamp"];

      [v16 timeIntervalSince1970];
      double v18 = v17;
      [v11 timeIntervalSince1970];
      double v20 = v19;
      LODWORD(v15) = [v8 intValue];
      if ([WeakRetained lastPromptLaunchNumberAfterGDPR] <= (unint64_t)(int)v15
        && v18 > 0.0
        && v20 - v18 >= 259200.0)
      {
        v21 = VUIDefaultLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Reprompting for the notification sheet for the last time.", (uint8_t *)&v25, 2u);
        }

        v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v22 setBool:1 forKey:@"KettleShouldStopShowingAMSSheet"];

        [*(id *)(a1 + 40) _showNotificationAuthorizationSheet];
      }
    }
    v23 = VUIDefaultLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [*(id *)(a1 + 40) lastTabIdentifier];
      int v25 = 138412290;
      v26 = v24;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Current tab identifier:%@", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)_handleTabBarChange:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKey:@"VUIMetricsTabBarItemNotificationKey"];
  [(VUIUserEngagementSheetLauncher *)self setLastTabIdentifier:v4];
}

- (void)_showNotificationAuthorizationSheet
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F4DEA8]);
  [v3 setAuthorizationOptions:7];
  id v4 = +[VUIAuthenticationManager DSID];
  v16[0] = @"pageContext";
  uint64_t v5 = [(VUIUserEngagementSheetLauncher *)self lastTabIdentifier];
  v6 = (void *)v5;
  v7 = &stru_1F3E921E0;
  if (v5) {
    v8 = (__CFString *)v5;
  }
  else {
    v8 = &stru_1F3E921E0;
  }
  v17[0] = v8;
  v17[1] = @"xp_amp_tv_main";
  v16[1] = @"topic";
  v16[2] = @"dsId";
  if (v4) {
    v7 = v4;
  }
  v17[2] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  [v3 setMetricsOverlay:v9];
  id v10 = objc_alloc(MEMORY[0x1E4F4DEB0]);
  uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
  int v12 = [v11 bundleIdentifier];
  char v13 = (void *)[v10 initWithBundleIdentifier:v12 options:v3];

  [v13 setDelegate:self];
  objc_super v14 = [v13 requestAuthorization];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__VUIUserEngagementSheetLauncher__showNotificationAuthorizationSheet__block_invoke;
  v15[3] = &unk_1E6DF4AA8;
  v15[4] = self;
  [v14 addFinishBlock:v15];
}

void __69__VUIUserEngagementSheetLauncher__showNotificationAuthorizationSheet__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 localizedDescription];
    uint64_t v9 = [v6 code];
    id v10 = [*(id *)(a1 + 32) lastTabIdentifier];
    int v12 = 138412802;
    char v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    double v17 = v10;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Promise result. Error description:%@; error code:%ld; tab identifier:%@",
      (uint8_t *)&v12,
      0x20u);
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserNotificationAction:", objc_msgSend(v5, "authorizationStatus"));
  }
  else if ([v6 code] == 11)
  {
    uint64_t v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - User has already granted or denied notification authorization", (uint8_t *)&v12, 2u);
    }

    [*(id *)(a1 + 32) _deleteKeysUsedForSheetPresentation];
  }
}

- (void)_deleteKeysUsedForSheetPresentation
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"KettleNumberOfAppLaunch"];

  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObjectForKey:@"KettleFirstPromptTimestamp"];
}

- (void)_handleUserNotificationAction:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - User notification authorization status:%ld", (uint8_t *)&v6, 0xCu);
  }

  if ((unint64_t)(a3 - 1) <= 1) {
    [(VUIUserEngagementSheetLauncher *)self _deleteKeysUsedForSheetPresentation];
  }
}

- (BOOL)isAnotherSheetShowingToUser
{
  v2 = +[VUITVAppLauncher sharedInstance];
  id v3 = [v2 appController];

  id v4 = +[VUIApplicationRouter topPresentedViewController];
  id v5 = [v4 presentedViewController];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    int64_t v7 = +[VUIApplicationRouter currentNavigationController];
    uint64_t v8 = [v7 presentedViewController];
    if (v8)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v9 = [v3 navigationController];
      id v10 = [v9 presentedViewController];
      BOOL v6 = v10 != 0;
    }
  }

  return v6;
}

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__VUIUserEngagementSheetLauncher_handleEngagementRequest_completion___block_invoke;
  v9[3] = &unk_1E6DF4AD0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __69__VUIUserEngagementSheetLauncher_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  v2 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4DFB8]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
    id v6 = (void *)[v3 initWithRequest:v4 bag:v5 presentingViewController:v2];

    id v7 = [v6 presentEngagement];
    [v7 addFinishBlock:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - failed to handle dialog request because there is no presenting view controller", v9, 2u);
    }
  }
}

- (BOOL)hasAppLostConnectivity
{
  return self->_hasAppLostConnectivity;
}

- (void)setHasAppLostConnectivity:(BOOL)a3
{
  self->_hasAppLostConnectivity = a3;
}

- (NSString)lastTabIdentifier
{
  return self->_lastTabIdentifier;
}

- (void)setLastTabIdentifier:(id)a3
{
}

- (unint64_t)firstPromptLaunchNumberAfterGDPR
{
  return self->_firstPromptLaunchNumberAfterGDPR;
}

- (void)setFirstPromptLaunchNumberAfterGDPR:(unint64_t)a3
{
  self->_unint64_t firstPromptLaunchNumberAfterGDPR = a3;
}

- (unint64_t)lastPromptLaunchNumberAfterGDPR
{
  return self->_lastPromptLaunchNumberAfterGDPR;
}

- (void)setLastPromptLaunchNumberAfterGDPR:(unint64_t)a3
{
  self->_unint64_t lastPromptLaunchNumberAfterGDPR = a3;
}

- (void).cxx_destruct
{
}

@end