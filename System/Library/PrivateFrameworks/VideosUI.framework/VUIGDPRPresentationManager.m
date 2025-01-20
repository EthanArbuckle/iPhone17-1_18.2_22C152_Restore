@interface VUIGDPRPresentationManager
+ (BOOL)shouldShowWelcomeScreen;
+ (BOOL)showGDPRWelcomeScreen:(id)a3;
+ (id)_sharedInstance;
+ (void)_performRequestsIfNeeded;
+ (void)acceptGDPRAndSyncWithServers:(id)a3;
+ (void)checkGDPRConsentAndPerformRequests:(id)a3;
+ (void)showOfflineGDPRWelcomeScreen;
- (BOOL)hasShownWelcome;
- (BOOL)isShowing;
- (UINavigationController)navigationController;
- (VUIAppContext)appContext;
- (VUIGDPRPresentationManager)init;
- (id)_currentWindowRootViewController;
- (void)_dismissAllModalsIfPresent:(id)a3;
- (void)_handleContinueButton;
- (void)_handleOfflineContinueButton;
- (void)_showIOSWelcomeControllerWithAppContext:(id)a3 offline:(BOOL)a4;
- (void)accept:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setHasShownWelcome:(BOOL)a3;
- (void)setNavigationController:(id)a3;
@end

@implementation VUIGDPRPresentationManager

+ (void)checkGDPRConsentAndPerformRequests:(id)a3
{
  v7 = (void (**)(void))a3;
  if (+[VUIGDPRPresentationManager shouldShowWelcomeScreen])
  {
    v3 = (void *)requestBlocks;
    if (!requestBlocks)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      v5 = (void *)requestBlocks;
      requestBlocks = v4;

      v3 = (void *)requestBlocks;
    }
    v6 = (void *)[v7 copy];
    [v3 addObject:v6];
  }
  else
  {
    v7[2]();
  }
}

+ (BOOL)shouldShowWelcomeScreen
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.ShouldShowWelcomeScreen", "", (uint8_t *)&v16, 2u);
  }

  v3 = [MEMORY[0x1E4FB3C80] sharedInstance];
  if ([v3 gdprFirstTimeFlowEnabled])
  {

    goto LABEL_6;
  }
  uint64_t v4 = [MEMORY[0x1E4FB3C80] sharedInstance];
  int v5 = [v4 gdprWhatsNewFlowEnabled];

  if (v5)
  {
LABEL_6:
    v6 = [(id)objc_opt_class() _sharedInstance];
    char v7 = [v6 hasShownWelcome];

    v8 = VUIDefaultLogObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v16) = 0;
        v10 = "VUIGDPRPresentationManager - GDPR has already shown because of user defaults override";
LABEL_11:
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v16) = 0;
      v10 = "VUIGDPRPresentationManager - GDPR is shown because of user defaults override";
      goto LABEL_11;
    }

    v11 = [(id)objc_opt_class() _sharedInstance];
    int v12 = [v11 hasShownWelcome] ^ 1;
    goto LABEL_13;
  }
  LOBYTE(v12) = [MEMORY[0x1E4F4DBA8] acknowledgementNeededForPrivacyIdentifier:@"com.apple.onboarding.tvapp"];
  v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = VUIBoolLogString();
    int v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR needed? [%@]", (uint8_t *)&v16, 0xCu);
  }
  v11 = VUISignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.ShouldShowWelcomeScreen", "", (uint8_t *)&v16, 2u);
  }
LABEL_13:

  return v12;
}

+ (BOOL)showGDPRWelcomeScreen:(id)a3
{
  id v3 = a3;
  int v4 = [(id)objc_opt_class() shouldShowWelcomeScreen];
  if (v4)
  {
    int v5 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    int v6 = [v5 isNetworkReachable];

    char v7 = [(id)objc_opt_class() _sharedInstance];
    [v7 _showIOSWelcomeControllerWithAppContext:v3 offline:v6 ^ 1u];
  }
  else if (([MEMORY[0x1E4FB5100] isOptedIn] & 1) == 0)
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - Starting GAC patch-up flow", v10, 2u);
    }

    [MEMORY[0x1E4FB5100] optInUserIfNeededAndRefreshConfig:&__block_literal_global_160];
  }

  return v4;
}

void __52__VUIGDPRPresentationManager_showGDPRWelcomeScreen___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = VUIBoolLogString();
    int v6 = 138412546;
    char v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GAC patch-up flow: Successful OptIn: %@ Err: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (VUIGDPRPresentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIGDPRPresentationManager;
  result = [(VUIGDPRPresentationManager *)&v3 init];
  if (result) {
    result->_hasShownWelcome = 0;
  }
  return result;
}

- (void)accept:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4FB3CF8], "sharedInstance", a3);
  int v5 = [v4 isNetworkReachable];

  if (v5)
  {
    [(VUIGDPRPresentationManager *)self _handleContinueButton];
  }
  else
  {
    [(VUIGDPRPresentationManager *)self _handleOfflineContinueButton];
  }
}

+ (void)showOfflineGDPRWelcomeScreen
{
  if ([(id)objc_opt_class() shouldShowWelcomeScreen])
  {
    id v2 = [(id)objc_opt_class() _sharedInstance];
    [v2 _showIOSWelcomeControllerWithAppContext:0 offline:1];
  }
}

+ (void)acceptGDPRAndSyncWithServers:(id)a3
{
  id v3 = a3;
  +[VUIOfferUtilities registerDeviceForCommerceOffers];
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DBA8]) initWithPrivacyIdentifier:@"com.apple.onboarding.tvapp"];
  int v5 = [v4 acknowledgePrivacy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke;
  v10[3] = &unk_1E6DF8228;
  id v6 = v3;
  id v11 = v6;
  [v5 addErrorBlock:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_6;
  v8[3] = &unk_1E6DF3DD0;
  id v9 = v6;
  id v7 = v6;
  [v5 addSuccessBlock:v8];
}

void __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR flow: Privacy acknowledgement failed", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_6(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB5100];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_2;
  v2[3] = &unk_1E6DF49E8;
  id v3 = *(id *)(a1 + 32);
  [v1 optInUserIfNeededAndRefreshConfig:v2];
}

void __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = VUIBoolLogString();
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR flow: Successful OptIn: %@ Err: %@", (uint8_t *)&v10, 0x16u);
  }
  if (a2)
  {
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR flow: failed to opt in: %@", (uint8_t *)&v10, 0xCu);
    }

    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_12_2);
  }
  id v2 = (void *)_sharedInstance_sPresentationManager;
  return v2;
}

void __45__VUIGDPRPresentationManager__sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIGDPRPresentationManager);
  v1 = (void *)_sharedInstance_sPresentationManager;
  _sharedInstance_sPresentationManager = (uint64_t)v0;
}

- (BOOL)isShowing
{
  id v3 = [(VUIGDPRPresentationManager *)self navigationController];
  int v4 = [v3 presentingViewController];

  id v5 = [(VUIGDPRPresentationManager *)self navigationController];
  char v6 = [v5 isBeingPresented];
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (void)_showIOSWelcomeControllerWithAppContext:(id)a3 offline:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VUIGDPRPresentationManager *)self setAppContext:v6];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke;
  v7[3] = &unk_1E6DFD660;
  objc_copyWeak(&v8, &location);
  BOOL v9 = v4;
  +[VUIGDPRViewControllerFactory createViewController:v4 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - Welcome Controller created. Error:%@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isShowing])
  {
    BOOL v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - Welcome Controller has already been presented, ignoring this request.", buf, 2u);
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_14;
    v23[3] = &unk_1E6DFD638;
    char v24 = *(unsigned char *)(a1 + 40);
    v23[4] = WeakRetained;
    [v5 setPrimaryButtonCallback:v23];
    if (+[VUIUtilities isSUIEnabled])
    {
      +[VideosUI initializeWelcomeScreenControllerPresenterIfNeeded];
      int v10 = +[VUIInterfaceFactory sharedInstance];
      [v10 welcomeScreenControllerPresenter];
    }
    else
    {
      int v10 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
      [v10 rootViewController];
    id v11 = };

    [WeakRetained _dismissAllModalsIfPresent:v11];
    BOOL v9 = v5;
    __int16 v12 = [v9 view];
    [v12 setAccessibilityIdentifier:@"UIA.TV.Dialog.GDPR"];

    id v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    v15 = (Class *)&off_1E6DF2C98;
    if (v14) {
      v15 = (Class *)0x1E4FB19E8;
    }
    int v16 = (void *)[objc_alloc(*v15) initWithRootViewController:v9];
    [v16 setModalPresentationStyle:2];
    [v16 setNavigationBarHidden:1];
    [WeakRetained setNavigationController:v16];
    objc_initWeak((id *)buf, WeakRetained);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_2;
    block[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v22, (id *)buf);
    id v20 = v16;
    id v21 = v11;
    id v17 = v11;
    id v18 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_14(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v2 = +[VUIMetricsController sharedInstance];
  v6[0] = @"targetId";
  v6[1] = @"targetType";
  v7[0] = @"continue";
  v7[1] = @"button";
  v6[2] = @"actionType";
  v6[3] = @"dialogId";
  v7[2] = @"gdprConsent";
  v7[3] = @"GDPR";
  v6[4] = @"dialogType";
  void v7[4] = @"GDPR";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  [v2 recordClick:v3];

  BOOL v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [v4 _handleOfflineContinueButton];
  }
  else {
    return [v4 _handleContinueButton];
  }
}

void __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[4] preferredContentSize];
  double v3 = v2;
  double v5 = v4;
  id v6 = +[VUIFeaturesConfiguration sharedInstance];
  BOOL v7 = [v6 gdprConfig];
  [v7 popoverHeight];
  double v9 = v8;

  if (v9 <= 0.0) {
    double v10 = v5;
  }
  else {
    double v10 = v9;
  }
  objc_msgSend(a1[4], "setPreferredContentSize:", v3, v10);
  [a1[5] presentViewController:a1[4] animated:1 completion:0];
  [WeakRetained setHasShownWelcome:1];
}

- (void)_dismissAllModalsIfPresent:(id)a3
{
  id v6 = a3;
  int v3 = [v6 conformsToProtocol:&unk_1F3F5D0F8];
  double v4 = v6;
  if (v3)
  {
    double v5 = [v6 currentNavigationController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v5) {
      [v5 dismissAllModals:&__block_literal_global_78];
    }

    double v4 = v6;
  }
}

- (id)_currentWindowRootViewController
{
  double v2 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  int v3 = [v2 rootViewController];

  return v3;
}

- (void)_handleContinueButton
{
  int v3 = +[VUIMetricsController sharedInstance];
  [v3 forceGDPRConsentStatus:1];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  BOOL v7 = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke;
  double v8 = &unk_1E6DF3D58;
  double v9 = self;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v7((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  double v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_3;
  v5[3] = &unk_1E6DF75C0;
  v5[4] = self;
  [v4 acceptGDPRAndSyncWithServers:v5];
}

void __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _currentWindowRootViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_2;
  v3[3] = &unk_1E6DF3D58;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "vui_dismissViewControllerAnimated:completion:", 1, v3);
}

void __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNavigationController:0];
  id v4 = +[VUIInterfaceFactory sharedInstance];
  double v2 = [v4 openURLHandler];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [v2 handleDeferredURLWithAppContext:WeakRetained];
}

void __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  double v2 = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_4;
  int v3 = &unk_1E6DF3D58;
  uint64_t v4 = *(void *)(a1 + 32);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_4(uint64_t a1)
{
  double v2 = +[VUIInterfaceFactory sharedInstance];
  int v3 = [v2 openURLHandler];
  char v4 = [v3 openedByDeeplink];

  if ((v4 & 1) == 0)
  {
    double v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR Accept button -- Check if there is any pending offer to present", v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    +[VUIOfferUtilities fetchAndPresentOffer:WeakRetained sourceEvent:@"GDPRJustAccepted" completion:&__block_literal_global_84_1];
  }
  BOOL v7 = dispatch_get_global_queue(0, 0);
  dispatch_async(v7, &__block_literal_global_87_0);

  +[VideosUI handleGDPRDidChangeSignal];
  double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"VUIGDPRUserDidConsentNotification" object:0 userInfo:0];

  return +[VUIGDPRPresentationManager _performRequestsIfNeeded];
}

uint64_t __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_5()
{
  return +[VideosUI handleAppDidFinishLoading];
}

uint64_t __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_85()
{
  return +[VideosUI initializeGroupActivities];
}

- (void)_handleOfflineContinueButton
{
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F4DBA8]) initWithPrivacyIdentifier:@"com.apple.onboarding.tvapp"];
  char v4 = [v3 acknowledgePrivacy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke;
  v5[3] = &unk_1E6DF75C0;
  v5[4] = self;
  [v4 addFinishBlock:v5];
}

void __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  double v10 = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2;
  id v11 = &unk_1E6DF6B68;
  char v14 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v6;
  BOOL v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = v5;
  if ([v7 isMainThread]) {
    v10((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR offline flow: Privacy acknowledgement success:%d err:%@", buf, 0x12u);
  }

  id v5 = [*(id *)(a1 + 40) _currentWindowRootViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_89;
  v7[3] = &unk_1E6DF3D58;
  void v7[4] = *(void *)(a1 + 40);
  objc_msgSend(v5, "vui_dismissViewControllerAnimated:completion:", 1, v7);
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"VUIGDPRUserDidConsentNotification" object:0 userInfo:0];

  +[VUIGDPRPresentationManager _performRequestsIfNeeded];
}

void __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_89(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  double v2 = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2_90;
  int v3 = &unk_1E6DF3D58;
  uint64_t v4 = *(void *)(a1 + 32);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2_90(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNavigationController:0];
}

+ (void)_performRequestsIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(id)requestBlocks count])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = (id)requestBlocks;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    objc_msgSend((id)requestBlocks, "removeAllObjects", (void)v7);
  }
}

- (BOOL)hasShownWelcome
{
  return self->_hasShownWelcome;
}

- (void)setHasShownWelcome:(BOOL)a3
{
  self->_hasShownWelcome = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end