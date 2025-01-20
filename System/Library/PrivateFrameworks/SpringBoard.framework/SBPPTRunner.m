@interface SBPPTRunner
+ (BOOL)isAppLibraryTest:(id)a3;
+ (BOOL)isFocusModeTest:(id)a3;
+ (BOOL)isPageManagementTest:(id)a3;
+ (id)_operationToPutVideoInPIP;
+ (id)_operationToRestoreVideoFromPIP;
+ (id)_operationToStashPIP;
+ (id)_operationToUnstashStashedPIP;
+ (id)sharedInstance;
- (BOOL)_runCoverSheetTestWithName:(id)a3 options:(id)a4;
- (BOOL)_runDashBoardTestWithName:(id)a3 options:(id)a4;
- (BOOL)runTestWithName:(id)a3 options:(id)a4;
- (id)_libraryViewController;
- (id)_mainDisplayWindowScene;
- (id)_operationToDismissCoverSheetForTestWithName:(id)a3;
- (id)_operationToDismissDashBoardForTestWithName:(id)a3;
- (id)_operationToPresentCoverSheetForTestWithName:(id)a3;
- (void)_configureParams:(id)a3 forScrollView:(id)a4;
- (void)_runAppLibraryPadPresentTestWithOptions:(id)a3;
- (void)_runAppLibraryTestWithName:(id)a3 options:(id)a4;
- (void)_runCoverSheetDismissTestWithOptions:(id)a3;
- (void)_runCoverSheetDismissToSafariTestWithOptions:(id)a3;
- (void)_runCoverSheetPresentOverSafariTestWithOptions:(id)a3;
- (void)_runCoverSheetPresentTestWithOptions:(id)a3;
- (void)_runDashBoardDismissTestWithOptions:(id)a3;
- (void)_runFloatingDockBringupTestWithOptions:(id)a3;
- (void)_runFloatingDockDismissTestWithOptions:(id)a3;
- (void)_runFocusModePresentTestWithName:(id)a3 options:(id)a4;
- (void)_runFocusModeTestWithName:(id)a3 options:(id)a4;
- (void)_runLibrarySearchTestWithOptions:(id)a3;
- (void)_runNotificationBannerTransitionTestWithOptions:(id)a3;
- (void)_runNotificationClearLongLookTransitionTestWithOptions:(id)a3;
- (void)_runNotificationReParkLongLookTransitionTestWithOptions:(id)a3;
- (void)_runNotificationShortToLongLookTransitionTestWithOptions:(id)a3;
- (void)_runPIPAutoStashByEnteringSwitcherTestWithOptions:(id)a3;
- (void)_runPIPAutoUnstashAndRestoreByExitingSwitcherBackToAppTestWithOptions:(id)a3;
- (void)_runPIPBasicRestoreTestWithOptions:(id)a3;
- (void)_runPIPManualStashTestWithOptions:(id)a3;
- (void)_runPIPManualUnstashTestWithOptions:(id)a3;
- (void)_runPageManagementPresentTestWithName:(id)a3 options:(id)a4;
- (void)_runPageManagementTestWithName:(id)a3 options:(id)a4;
- (void)_runPullToAppLibrarySearchTestWithOptions:(id)a3;
- (void)_runScrollDeweyTestWithOptions:(id)a3;
- (void)_runScrollWithinExpandedPodTestWithOptions:(id)a3;
- (void)_runSiriTestWithName:(id)a3 options:(id)a4;
- (void)_runSwipeFromDeweyTestWithOptions:(id)a3;
- (void)_runSwipeToDeweyTestWithOptions:(id)a3;
- (void)_setCoverSheetPresentationManagerTransitionCallbacksForTestName:(id)a3 operation:(id)a4;
- (void)assistantDidAppear:(id)a3 windowScene:(id)a4;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)longLookDidDismissForNotificationViewController:(id)a3;
- (void)longLookDidPresentForNotificationViewController:(id)a3;
- (void)longLookWillDismissForNotificationViewController:(id)a3;
- (void)longLookWillPresentForNotificationViewController:(id)a3;
- (void)prepareForControlCenterPPTHostState:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation SBPPTRunner

- (BOOL)runTestWithName:(id)a3 options:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogPPT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "-[SBPPTRunner runTestWithName:%@ options:%@]", buf, 0x16u);
  }

  v9 = +[SBControlCenterController sharedInstance];
  v10 = [v9 viewController];
  char v11 = [v10 runTest:v6 options:v7 delegate:self];

  if ((v11 & 1) == 0
    && ![(SBPPTRunner *)self _runCoverSheetTestWithName:v6 options:v7]
    && ![(SBPPTRunner *)self _runDashBoardTestWithName:v6 options:v7])
  {
    if ([v6 hasPrefix:@"Siri"])
    {
      [(SBPPTRunner *)self _runSiriTestWithName:v6 options:v7];
    }
    else if ([(id)objc_opt_class() isAppLibraryTest:v6])
    {
      [(SBPPTRunner *)self _runAppLibraryTestWithName:v6 options:v7];
    }
    else if ([(id)objc_opt_class() isFocusModeTest:v6])
    {
      [(SBPPTRunner *)self _runFocusModeTestWithName:v6 options:v7];
    }
    else if ([(id)objc_opt_class() isPageManagementTest:v6])
    {
      [(SBPPTRunner *)self _runPageManagementTestWithName:v6 options:v7];
    }
    else
    {
      v12 = [NSString stringWithFormat:@"_run%@TestWithOptions:", v6];
      SEL v13 = NSSelectorFromString(v12);

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        BOOL v14 = 0;
        goto LABEL_17;
      }
      ((void (*)(SBPPTRunner *, SEL, id))[(SBPPTRunner *)self methodForSelector:v13])(self, v13, v7);
    }
  }
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_runDashBoardTestWithName:(id)a3 options:(id)a4
{
  id v6 = a4;
  int v7 = [a3 isEqualToString:@"DashBoardSwipeDismissWhileAuthenticated"];
  if (v7) {
    [(SBPPTRunner *)self _runDashBoardDismissTestWithOptions:v6];
  }

  return v7;
}

- (BOOL)_runCoverSheetTestWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"CoverSheetPresent"])
  {
    [(SBPPTRunner *)self _runCoverSheetPresentTestWithOptions:v7];
  }
  else if ([v6 isEqualToString:@"CoverSheetPresentOverSafari"])
  {
    [(SBPPTRunner *)self _runCoverSheetPresentOverSafariTestWithOptions:v7];
  }
  else if ([v6 isEqualToString:@"CoverSheetDismiss"])
  {
    [(SBPPTRunner *)self _runCoverSheetDismissTestWithOptions:v7];
  }
  else
  {
    if (![v6 isEqualToString:@"CoverSheetDismissToSafari"])
    {
      BOOL v8 = 0;
      goto LABEL_10;
    }
    [(SBPPTRunner *)self _runCoverSheetDismissToSafariTestWithOptions:v7];
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

+ (BOOL)isPageManagementTest:(id)a3
{
  uint64_t v3 = isPageManagementTest__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isPageManagementTest__onceToken, &__block_literal_global_272);
  }
  char v5 = [(id)isPageManagementTest__pageManagementPPTTests containsObject:v4];

  return v5;
}

+ (BOOL)isFocusModeTest:(id)a3
{
  uint64_t v3 = isFocusModeTest__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isFocusModeTest__onceToken, &__block_literal_global_271);
  }
  char v5 = [(id)isFocusModeTest__focusModePPTTests containsObject:v4];

  return v5;
}

+ (BOOL)isAppLibraryTest:(id)a3
{
  uint64_t v3 = isAppLibraryTest__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isAppLibraryTest__onceToken, &__block_literal_global_413);
  }
  char v5 = [(id)isAppLibraryTest__appLibraryTests containsObject:v4];

  return v5;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SBPPTRunner_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once_13 != -1) {
    dispatch_once(&sharedInstance___once_13, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_30;
  return v2;
}

- (void)_runDashBoardDismissTestWithOptions:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[SBPPTOperation operationToLockInterface];
  id v6 = +[SBPPTOperation operationToUnlockInterfaceFinishingUIUnlock:](SBPPTOperation, "operationToUnlockInterfaceFinishingUIUnlock:", 0, v5);
  v10[1] = v6;
  id v7 = [v4 objectForKey:@"testName"];

  BOOL v8 = [(SBPPTRunner *)self _operationToDismissDashBoardForTestWithName:v7];
  v10[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  +[SBPPTOperation enqueueOperations:v9];
}

- (id)_operationToDismissDashBoardForTestWithName:(id)a3
{
  return +[SBPPTOperation operationToMonitorCoverSheetTransitionWithTestName:a3 execute:&__block_literal_global_70];
}

void __74__SBPPTRunner_DashBoardPPTs___operationToDismissDashBoardForTestWithName___block_invoke()
{
  SBPPTEventActionsToSwipeUpFromBottomOfInterface();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  SBPPTSynthesizeEventsForEventActions(v0, 0);
}

- (void)prepareForControlCenterPPTHostState:(unint64_t)a3 completionHandler:(id)a4
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __94__SBPPTRunner_ControlCenterPPTSupport__prepareForControlCenterPPTHostState_completionHandler___block_invoke;
  __int16 v18 = &unk_1E6AFE608;
  id v6 = v5;
  id v19 = v6;
  id v7 = +[SBPPTBlockOperation operationWithBlock:&v15];
  switch(a3)
  {
    case 2uLL:
      BOOL v8 = +[SBPPTOperation operationToPreventSystemIdle];
      v20[0] = v8;
      v9 = +[SBPPTOperation operationToUnlockInterface];
      v20[1] = v9;
      v10 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.mobilesafari"];
      v20[2] = v10;
      v20[3] = v7;
      char v11 = +[SBPPTOperation operationToResumeSystemIdle];
      v20[4] = v11;
      v12 = (void *)MEMORY[0x1E4F1C978];
      SEL v13 = v20;
LABEL_7:
      BOOL v14 = [v12 arrayWithObjects:v13 count:5];
      +[SBPPTOperation enqueueOperations:v14];

      goto LABEL_8;
    case 1uLL:
      BOOL v8 = +[SBPPTOperation operationToPreventSystemIdle];
      v21[0] = v8;
      v9 = +[SBPPTOperation operationToUnlockInterface];
      v21[1] = v9;
      v10 = +[SBPPTOperation operationToTransitionToHomeScreen];
      v21[2] = v10;
      v21[3] = v7;
      char v11 = +[SBPPTOperation operationToResumeSystemIdle];
      v21[4] = v11;
      v12 = (void *)MEMORY[0x1E4F1C978];
      SEL v13 = v21;
      goto LABEL_7;
    case 0uLL:
      BOOL v8 = +[SBPPTOperation operationToPreventSystemIdle];
      v22[0] = v8;
      v9 = +[SBPPTOperation operationToLockInterface];
      v22[1] = v9;
      v22[2] = v7;
      v10 = +[SBPPTOperation operationToResumeSystemIdle];
      v22[3] = v10;
      char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
      +[SBPPTOperation enqueueOperations:v11];
LABEL_8:

      break;
  }
}

void __94__SBPPTRunner_ControlCenterPPTSupport__prepareForControlCenterPPTHostState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  [v4 finish];
}

- (void)_runFloatingDockBringupTestWithOptions:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v18[0] = v5;
  id v6 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.mobilesafari"];
  v18[1] = v6;
  id v7 = +[SBPPTOperation operationToDismissFloatingDock];
  v18[2] = v7;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke;
  uint64_t v15 = &unk_1E6AFE548;
  uint64_t v16 = self;
  id v17 = v4;
  id v8 = v4;
  v9 = +[SBPPTBlockOperation operationWithBlock:&v12];
  v18[3] = v9;
  v10 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v18[4] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  +[SBPPTOperation enqueueOperations:v11];
}

void __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _mainDisplayWindowScene];
  id v5 = [v4 floatingDockController];
  id v6 = [*(id *)(a1 + 40) objectForKey:@"testName"];
  [(id)*MEMORY[0x1E4F43630] startedTest:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke_2;
  v9[3] = &unk_1E6AF4A98;
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  id v8 = v6;
  [v5 presentFloatingDockIfDismissedAnimated:1 completionHandler:v9];
}

uint64_t __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke_2(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] finishedTest:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 finish];
}

- (void)_runFloatingDockDismissTestWithOptions:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v18[0] = v5;
  id v6 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.mobilesafari"];
  v18[1] = v6;
  id v7 = +[SBPPTOperation operationToPresentFloatingDock];
  v18[2] = v7;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke;
  uint64_t v15 = &unk_1E6AFE548;
  uint64_t v16 = self;
  id v17 = v4;
  id v8 = v4;
  v9 = +[SBPPTBlockOperation operationWithBlock:&v12];
  v18[3] = v9;
  id v10 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v18[4] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  +[SBPPTOperation enqueueOperations:v11];
}

void __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _mainDisplayWindowScene];
  id v5 = [v4 floatingDockController];
  id v6 = [*(id *)(a1 + 40) objectForKey:@"testName"];
  [(id)*MEMORY[0x1E4F43630] startedTest:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke_2;
  v9[3] = &unk_1E6AF4A98;
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  id v8 = v6;
  [v5 dismissFloatingDockIfPresentedAnimated:1 completionHandler:v9];
}

uint64_t __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke_2(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] finishedTest:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 finish];
}

uint64_t __48__SBPPTRunner_DockPPTs___mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

- (void)_runNotificationShortToLongLookTransitionTestWithOptions:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v16[0] = v5;
  id v6 = +[SBPPTOperation operationToPresentBannerNotification];
  v16[1] = v6;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke;
  uint64_t v13 = &unk_1E6AFE548;
  id v14 = v4;
  uint64_t v15 = self;
  id v7 = v4;
  id v8 = +[SBPPTBlockOperation operationWithBlock:&v10];
  v16[2] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 3, v10, v11, v12, v13);
  +[SBPPTOperation enqueueOperations:v9];
}

void __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:@"testName"];
  id v5 = [(id)SBApp notificationDispatcher];
  id v6 = [v5 bannerDestination];

  id v7 = [v6 presentedBanner];
  [v7 addObserver:*(void *)(a1 + 40)];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_2;
  v17[3] = &unk_1E6AF4AC0;
  id v8 = v4;
  id v18 = v8;
  [v7 setPPTLongLookWillPresentBlock:v17];
  objc_initWeak(&location, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_4;
  v13[3] = &unk_1E6AFC630;
  id v9 = v8;
  id v14 = v9;
  objc_copyWeak(&v15, &location);
  [v7 setPPTLongLookDidPresentBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_5;
  v11[3] = &unk_1E6AF4AC0;
  id v10 = v3;
  id v12 = v10;
  [v7 setPPTLongLookDidDismissBlock:v11];
  [v7 _recapSwipePresentLongLook];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_3;
  v4[3] = &unk_1E6AF4AC0;
  id v5 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v4];
}

uint64_t __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"animation" forTest:v4];
}

void __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  [*v2 finishedTest:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _recapDismissLongLookViaTapOutside];
}

uint64_t __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (void)_runNotificationReParkLongLookTransitionTestWithOptions:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v18[0] = v5;
  id v6 = +[SBPPTOperation operationToActivateNullOffscreenApp];
  v18[1] = v6;
  id v7 = +[SBPPTOperation operationToPresentBannerNotification];
  v18[2] = v7;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke;
  id v15 = &unk_1E6AFE548;
  id v16 = v4;
  id v17 = self;
  id v8 = v4;
  id v9 = +[SBPPTBlockOperation operationWithBlock:&v12];
  v18[3] = v9;
  id v10 = +[SBPPTOperation operationToTerminateNullOffscreenApp];
  v18[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  +[SBPPTOperation enqueueOperations:v11];
}

void __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:@"testName"];
  id v5 = [(id)SBApp notificationDispatcher];
  id v6 = [v5 bannerDestination];

  id v7 = [v6 presentedBanner];
  [v7 addObserver:*(void *)(a1 + 40)];
  objc_initWeak(&location, v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_2;
  v14[3] = &unk_1E6AFC630;
  id v8 = v4;
  id v15 = v8;
  objc_copyWeak(&v16, &location);
  [v7 setPPTLongLookDidPresentBlock:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_4;
  v11[3] = &unk_1E6AF5290;
  id v9 = v8;
  id v12 = v9;
  id v10 = v3;
  id v13 = v10;
  [v7 setPPTLongLookDidDismissBlock:v11];
  [v7 _recapSwipePresentLongLook];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_3;
  v5[3] = &unk_1E6AF4AC0;
  id v6 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _recapDismissLongLookViaTapOutside];
}

uint64_t __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"animation" forTest:v4];
}

uint64_t __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  [*v2 finishedTest:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  return [v3 finish];
}

- (void)_runNotificationClearLongLookTransitionTestWithOptions:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v16[0] = v5;
  id v6 = +[SBPPTOperation operationToPresentBannerNotification];
  v16[1] = v6;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke;
  id v13 = &unk_1E6AFE548;
  id v14 = v4;
  id v15 = self;
  id v7 = v4;
  id v8 = +[SBPPTBlockOperation operationWithBlock:&v10];
  v16[2] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 3, v10, v11, v12, v13);
  +[SBPPTOperation enqueueOperations:v9];
}

void __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:@"testName"];
  id v5 = [(id)SBApp notificationDispatcher];
  id v6 = [v5 bannerDestination];

  id v7 = [v6 presentedBanner];
  [v7 addObserver:*(void *)(a1 + 40)];
  objc_initWeak(&location, v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_2;
  v14[3] = &unk_1E6AFC630;
  id v8 = v4;
  id v15 = v8;
  objc_copyWeak(&v16, &location);
  [v7 setPPTLongLookDidPresentBlock:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_4;
  v11[3] = &unk_1E6AF5290;
  id v9 = v8;
  id v12 = v9;
  id v10 = v3;
  id v13 = v10;
  [v7 setPPTLongLookDidDismissBlock:v11];
  [v7 _recapSwipePresentLongLook];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_3;
  v5[3] = &unk_1E6AF4AC0;
  id v6 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _recapDismissLongLookViaPullDown];
}

uint64_t __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"animation" forTest:v4];
}

uint64_t __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  [*v2 finishedTest:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  return [v3 finish];
}

- (void)_runNotificationBannerTransitionTestWithOptions:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[SBPPTOperation operationToUnlockInterface];
  id v10 = v3;
  v11[0] = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke;
  v9[3] = &unk_1E6AFE570;
  id v5 = v3;
  id v6 = +[SBPPTBlockOperation operationWithBlock:v9];
  v11[1] = v6;
  id v7 = +[SBPPTOperation operationToDismissBannerNotification];
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  +[SBPPTOperation enqueueOperations:v8];
}

void __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:@"testName"];
  id v5 = [(id)SBApp notificationDispatcher];
  id v6 = [v5 bannerDestination];

  id v7 = +[SBNotificationBannerDestination _test_notificationRequestForBannerWithIcon];
  id v8 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:v4];
  [*v8 startedSubTest:@"delay" forTest:v4];
  id v9 = *v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_2;
  v14[3] = &unk_1E6AF59B8;
  id v15 = v4;
  id v16 = v6;
  id v17 = v7;
  id v18 = v3;
  id v10 = v3;
  id v11 = v7;
  id v12 = v6;
  id v13 = v4;
  [v9 installCACommitCompletionBlock:v14];
}

void __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_3;
  v5[3] = &unk_1E6AF5290;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_test_postNotificationRequest:completion:", v4, v5);
}

uint64_t __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  [*v2 finishedTest:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  return [v3 finish];
}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id v4 = a3;
  id v3 = [v4 pptLongLookWillPresentBlock];
  if (v3)
  {
    [v4 setPPTLongLookWillPresentBlock:0];
    v3[2](v3);
  }
}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  id v4 = a3;
  id v3 = [v4 pptLongLookDidPresentBlock];
  if (v3)
  {
    [v4 setPPTLongLookDidPresentBlock:0];
    v3[2](v3);
  }
}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  id v4 = a3;
  id v3 = [v4 pptLongLookWillDismissBlock];
  if (v3)
  {
    [v4 setPPTLongLookWillDismissBlock:0];
    v3[2](v3);
  }
}

- (void)longLookDidDismissForNotificationViewController:(id)a3
{
  id v4 = a3;
  id v3 = [v4 pptLongLookDidDismissBlock];
  if (v3)
  {
    [v4 setPPTLongLookDidDismissBlock:0];
    v3[2](v3);
  }
}

- (void)_runSiriTestWithName:(id)a3 options:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v8 = [v7 policyAggregator];
  int v9 = [v8 allowsCapability:5];

  if (v9)
  {
    if ([v15 hasPrefix:@"SiriBringup"])
    {
      id v10 = +[SBAssistantController sharedInstance];
      [v10 addObserver:self];

      [(id)*MEMORY[0x1E4F43630] startedIPTest:v15];
    }
    id v11 = (void *)MEMORY[0x1E4F1CC08];
    if (v6) {
      id v11 = v6;
    }
    id v12 = v11;
    id v13 = objc_opt_new();
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F9F978]) initWithPPTContext:v12];

    [v13 activateWithContext:v14];
  }
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v4 = +[SBApplicationTestingManager sharedInstance];
  id v5 = [v4 currentTestName];

  id v6 = (void *)*MEMORY[0x1E4F43630];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SBPPTRunner_SiriPPTSupport__assistantWillAppear_windowScene___block_invoke;
  v8[3] = &unk_1E6AF4AC0;
  id v9 = v5;
  id v7 = v5;
  [v6 _performBlockAfterCATransactionCommits:v8];
}

uint64_t __63__SBPPTRunner_SiriPPTSupport__assistantWillAppear_windowScene___block_invoke(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"appear" forTest:*(void *)(a1 + 32)];
}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  id v5 = +[SBAssistantController sharedInstance];
  [v5 removeObserver:self];

  id v6 = +[SBApplicationTestingManager sharedInstance];
  id v7 = [v6 currentTestName];

  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"appear" forTest:v7];
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_after(v8, MEMORY[0x1E4F14428], v10);
}

void __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F43630];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_2;
  v5[3] = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _performBlockAfterCATransactionCommits:v5];
}

void __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_2(int8x16_t *a1)
{
  [(id)*MEMORY[0x1E4F43630] startedSubTest:@"disappear" forTest:a1[2].i64[0]];
  uint64_t v2 = +[SBAssistantController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_3;
  v5[3] = &unk_1E6AF5290;
  int8x16_t v4 = a1[2];
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  [v2 dismissAssistantViewInEverySceneIfNecessaryWithAnimation:1 completion:v5];
}

uint64_t __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = +[SBAssistantController sharedInstance];
  [v2 removeObserver:*(void *)(a1 + 32)];

  id v3 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"disappear" forTest:*(void *)(a1 + 40)];
  int8x16_t v4 = *v3;
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 finishedTest:v5];
}

void __52__SBPPTRunner_FocusModePPTSupport__isFocusModeTest___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"FocusMode";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)isFocusModeTest__focusModePPTTests;
  isFocusModeTest__focusModePPTTests = v2;
}

- (void)_runFocusModeTestWithName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isEqualToString:@"FocusMode"]) {
    [(SBPPTRunner *)self _runFocusModePresentTestWithName:v7 options:v6];
  }
}

- (void)_runFocusModePresentTestWithName:(id)a3 options:(id)a4
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBPPTOperation operationToUnlockInterface];
  id v6 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v11[1] = v6;
  id v7 = +[SBPPTOperation operationToStartTest:v4];
  v11[2] = v7;
  dispatch_time_t v8 = +[SBPPTOperation operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName:v4];
  v11[3] = v8;
  id v9 = +[SBPPTOperation operationToFinishTest:v4];

  void v11[4] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  +[SBPPTOperation enqueueOperations:v10];
}

void __62__SBPPTRunner_PageManagementPPTSupport__isPageManagementTest___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PresentPageManagement";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)isPageManagementTest__pageManagementPPTTests;
  isPageManagementTest__pageManagementPPTTests = v2;
}

- (void)_runPageManagementTestWithName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isEqualToString:@"PresentPageManagement"]) {
    [(SBPPTRunner *)self _runPageManagementPresentTestWithName:v7 options:v6];
  }
}

- (void)_runPageManagementPresentTestWithName:(id)a3 options:(id)a4
{
  v13[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBPPTOperation operationToUnlockInterface];
  id v6 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v13[1] = v6;
  id v7 = +[SBPPTOperation operationToStartTest:v4];
  v13[2] = v7;
  dispatch_time_t v8 = +[SBPPTOperation operationToPresentPageManagementForTestWithName:v4];
  v13[3] = v8;
  id v9 = +[SBPPTOperation operationToWaitForTimeInterval:2.0];
  void v13[4] = v9;
  id v10 = +[SBPPTOperation operationToDismissPageManagementForTestWithName:v4];
  v13[5] = v10;
  id v11 = +[SBPPTOperation operationToFinishTest:v4];

  v13[6] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];
  +[SBPPTOperation enqueueOperations:v12];
}

- (void)_runCoverSheetPresentTestWithOptions:(id)a3
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBPPTOperation operationToUnlockInterface];
  v11[0] = v5;
  id v6 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v11[1] = v6;
  id v7 = [v4 objectForKey:@"testName"];

  dispatch_time_t v8 = [(SBPPTRunner *)self _operationToPresentCoverSheetForTestWithName:v7];
  v11[2] = v8;
  id v9 = +[SBPPTOperation operationToDismissCoverSheet];
  v11[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  +[SBPPTOperation enqueueOperations:v10];
}

- (void)_runCoverSheetDismissTestWithOptions:(id)a3
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBPPTOperation operationToUnlockInterface];
  v11[0] = v5;
  id v6 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v11[1] = v6;
  id v7 = +[SBPPTOperation operationToPresentCoverSheet];
  v11[2] = v7;
  dispatch_time_t v8 = [v4 objectForKey:@"testName"];

  id v9 = [(SBPPTRunner *)self _operationToDismissCoverSheetForTestWithName:v8];
  v11[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  +[SBPPTOperation enqueueOperations:v10];
}

- (void)_runCoverSheetPresentOverSafariTestWithOptions:(id)a3
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBPPTOperation operationToUnlockInterface];
  v11[0] = v5;
  id v6 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.mobilesafari"];
  v11[1] = v6;
  id v7 = [v4 objectForKey:@"testName"];

  dispatch_time_t v8 = [(SBPPTRunner *)self _operationToPresentCoverSheetForTestWithName:v7];
  v11[2] = v8;
  id v9 = +[SBPPTOperation operationToDismissCoverSheet];
  v11[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  +[SBPPTOperation enqueueOperations:v10];
}

- (void)_runCoverSheetDismissToSafariTestWithOptions:(id)a3
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBPPTOperation operationToUnlockInterface];
  v11[0] = v5;
  id v6 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.mobilesafari"];
  v11[1] = v6;
  id v7 = +[SBPPTOperation operationToPresentCoverSheet];
  v11[2] = v7;
  dispatch_time_t v8 = [v4 objectForKey:@"testName"];

  id v9 = [(SBPPTRunner *)self _operationToDismissCoverSheetForTestWithName:v8];
  v11[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  +[SBPPTOperation enqueueOperations:v10];
}

- (id)_operationToPresentCoverSheetForTestWithName:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBPPTRunner_CoverSheetPPTs___operationToPresentCoverSheetForTestWithName___block_invoke;
  v8[3] = &unk_1E6AFE548;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[SBPPTBlockOperation operationWithBlock:v8];

  return v6;
}

void __76__SBPPTRunner_CoverSheetPPTs___operationToPresentCoverSheetForTestWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setCoverSheetPresentationManagerTransitionCallbacksForTestName:*(void *)(a1 + 40) operation:a2];
  SBPPTEventActionsToSwipeDownFromTopOfInterface();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  SBPPTSynthesizeEventsForEventActions(v2, 0);
}

- (id)_operationToDismissCoverSheetForTestWithName:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBPPTRunner_CoverSheetPPTs___operationToDismissCoverSheetForTestWithName___block_invoke;
  v8[3] = &unk_1E6AFE548;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[SBPPTBlockOperation operationWithBlock:v8];

  return v6;
}

void __76__SBPPTRunner_CoverSheetPPTs___operationToDismissCoverSheetForTestWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setCoverSheetPresentationManagerTransitionCallbacksForTestName:*(void *)(a1 + 40) operation:a2];
  SBPPTSynthesizeEventsForCommandString(@"b h", 0);
}

- (void)_setCoverSheetPresentationManagerTransitionCallbacksForTestName:(id)a3 operation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SBCoverSheetPresentationManager sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke;
  v14[3] = &unk_1E6AF4AC0;
  id v8 = v5;
  id v15 = v8;
  objc_msgSend(v7, "setPpt_transitionBeginsCallback:", v14);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_3;
  v11[3] = &unk_1E6AF5290;
  id v12 = v8;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  objc_msgSend(v7, "setPpt_transitionEndsCallback:", v11);
}

void __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke(uint64_t a1)
{
  id v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  id v5 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v4];
}

uint64_t __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_2(uint64_t a1)
{
  id v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"animation" forTest:v4];
}

uint64_t __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  [*v2 finishedTest:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  return [v3 finish];
}

+ (id)_operationToPutVideoInPIP
{
  return +[SBPPTBlockOperation operationWithBlock:&__block_literal_global_346];
}

void __49__SBPPTRunner_PIPPPTs___operationToPutVideoInPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspace mainWorkspace];
  id v4 = [v3 pipControllerForType:0];

  [v4 _startPictureInPictureTestActionForApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  [v2 finish];
}

+ (id)_operationToRestoreVideoFromPIP
{
  return +[SBPPTBlockOperation operationWithBlock:&__block_literal_global_3_1];
}

void __55__SBPPTRunner_PIPPPTs___operationToRestoreVideoFromPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspace mainWorkspace];
  id v4 = [v3 pipControllerForType:0];

  [v4 _restorePictureInPictureForTestForApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  [v2 finish];
}

+ (id)_operationToStashPIP
{
  return +[SBPPTBlockOperation operationWithBlock:&__block_literal_global_5_0];
}

void __44__SBPPTRunner_PIPPPTs___operationToStashPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspace mainWorkspace];
  id v8 = [v3 pipControllerForType:0];

  id v4 = [(id)SBApp windowSceneManager];
  id v5 = [v4 embeddedDisplayWindowScene];
  uint64_t v6 = [v8 acquireStashAssertionForWindowScene:v5 withReason:1 identifier:@"SB-PPT-Testing"];
  id v7 = (void *)_stashAssertion;
  _stashAssertion = v6;

  [v2 finish];
}

+ (id)_operationToUnstashStashedPIP
{
  return +[SBPPTBlockOperation operationWithBlock:&__block_literal_global_8_5];
}

void __53__SBPPTRunner_PIPPPTs___operationToUnstashStashedPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)_stashAssertion;
  id v4 = a2;
  [v2 invalidate];
  id v3 = (void *)_stashAssertion;
  _stashAssertion = 0;

  [v4 finish];
}

- (void)_runPIPBasicRestoreTestWithOptions:(id)a3
{
  v15[8] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKey:@"testName"];
  id v14 = +[SBPPTOperation operationToUnlockInterface];
  v15[0] = v14;
  id v13 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v15[1] = v13;
  id v12 = [(id)objc_opt_class() _operationToPutVideoInPIP];
  v15[2] = v12;
  id v4 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsActive" object:0 timeout:10.0];
  v15[3] = v4;
  id v5 = [(id)objc_opt_class() _operationToRestoreVideoFromPIP];
  uint64_t v6 = [v5 markStartedTest:v3];
  v15[4] = v6;
  id v7 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsNoLongerActive" object:0 timeout:10.0];
  id v8 = [v7 markFinishedTest:v3];
  v15[5] = v8;
  id v9 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v15[6] = v9;
  id v10 = +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v15[7] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:8];
  +[SBPPTOperation enqueueOperations:v11];
}

- (void)_runPIPManualStashTestWithOptions:(id)a3
{
  v16[9] = *MEMORY[0x1E4F143B8];
  id v12 = [a3 objectForKey:@"testName"];
  id v15 = +[SBPPTOperation operationToUnlockInterface];
  v16[0] = v15;
  id v14 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v16[1] = v14;
  id v13 = [(id)objc_opt_class() _operationToPutVideoInPIP];
  v16[2] = v13;
  id v3 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsActive" object:0 timeout:10.0];
  v16[3] = v3;
  id v4 = [(id)objc_opt_class() _operationToStashPIP];
  id v5 = [v4 markStartedTest:v12];
  void v16[4] = v5;
  uint64_t v6 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsStashed" object:0 timeout:10.0];
  id v7 = [v6 markFinishedTest:v12];
  v16[5] = v7;
  id v8 = [(id)objc_opt_class() _operationToUnstashStashedPIP];
  v16[6] = v8;
  id v9 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v16[7] = v9;
  id v10 = +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v16[8] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:9];
  +[SBPPTOperation enqueueOperations:v11];
}

- (void)_runPIPManualUnstashTestWithOptions:(id)a3
{
  v18[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v17 = +[SBPPTOperation operationToUnlockInterface];
  v18[0] = v17;
  id v16 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v18[1] = v16;
  id v15 = [(id)objc_opt_class() _operationToPutVideoInPIP];
  v18[2] = v15;
  id v14 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsActive" object:0 timeout:10.0];
  v18[3] = v14;
  id v4 = [(id)objc_opt_class() _operationToStashPIP];
  v18[4] = v4;
  id v5 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsStashed" object:0 timeout:10.0];
  v18[5] = v5;
  uint64_t v6 = [(id)objc_opt_class() _operationToUnstashStashedPIP];
  id v13 = (void *)v3;
  id v7 = [v6 markStartedTest:v3];
  void v18[6] = v7;
  id v8 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsNoLongerStashed" object:0 timeout:10.0];
  id v9 = [v8 markFinishedTest:v3];
  v18[7] = v9;
  id v10 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v18[8] = v10;
  id v11 = +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v18[9] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:10];
  +[SBPPTOperation enqueueOperations:v12];
}

- (void)_runPIPAutoStashByEnteringSwitcherTestWithOptions:(id)a3
{
  v16[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v15 = +[SBPPTOperation operationToUnlockInterface];
  v16[0] = v15;
  id v14 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v16[1] = v14;
  id v13 = [(id)objc_opt_class() _operationToPutVideoInPIP];
  v16[2] = v13;
  id v4 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsActive" object:0 timeout:10.0];
  v16[3] = v4;
  id v5 = +[SBPPTOperation operationToPresentAppSwitcher];
  id v12 = (void *)v3;
  uint64_t v6 = [v5 markStartedTest:v3];
  void v16[4] = v6;
  id v7 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsStashed" object:0 timeout:10.0];
  id v8 = [v7 markFinishedTest:v3];
  v16[5] = v8;
  id v9 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v16[6] = v9;
  id v10 = +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v16[7] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:8];
  +[SBPPTOperation enqueueOperations:v11];
}

- (void)_runPIPAutoUnstashAndRestoreByExitingSwitcherBackToAppTestWithOptions:(id)a3
{
  v19[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v18 = +[SBPPTOperation operationToUnlockInterface];
  v19[0] = v18;
  id v17 = +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v19[1] = v17;
  id v16 = [(id)objc_opt_class() _operationToPutVideoInPIP];
  v19[2] = v16;
  id v15 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsActive" object:0 timeout:10.0];
  v19[3] = v15;
  id v4 = +[SBPPTOperation operationToPresentAppSwitcher];
  v19[4] = v4;
  id v5 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsStashed" object:0 timeout:10.0];
  v19[5] = v5;
  uint64_t v6 = +[SBPPTOperation operationToWaitForTimeInterval:1.0];
  v19[6] = v6;
  id v7 = +[SBPPTOperation operationToDismissAppSwitcherAndReturnToSource];
  id v14 = (void *)v3;
  id v8 = [v7 markStartedTest:v3];
  v19[7] = v8;
  id v9 = +[SBPPTOperation operationToWaitForNotificationName:@"SBApplicationTestingPIPIsNoLongerActive" object:0 timeout:10.0];
  id v10 = [v9 markFinishedTest:v3];
  v19[8] = v10;
  id v11 = +[SBPPTOperation operationToTransitionToHomeScreen];
  v19[9] = v11;
  id v12 = +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:@"com.apple.test.FullscreenVideoPlayer"];
  v19[10] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:11];
  +[SBPPTOperation enqueueOperations:v13];
}

void __54__SBPPTRunner_AppLibraryPPTSupport__isAppLibraryTest___block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"SwipeToDewey";
  v4[1] = @"SwipeFromDewey";
  void v4[2] = @"ScrollDewey";
  v4[3] = @"ScrollDeweyLibrarySearch";
  void v4[4] = @"ScrollDeweyWithinExpandedPod";
  v4[5] = @"DeweyPullToLibrarySearch";
  v4[6] = @"PresentAppLibraryPad";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)isAppLibraryTest__appLibraryTests;
  isAppLibraryTest__appLibraryTests = v2;
}

- (void)_runAppLibraryTestWithName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isEqualToString:@"SwipeToDewey"])
  {
    [(SBPPTRunner *)self _runSwipeToDeweyTestWithOptions:v6];
  }
  else if ([v7 isEqualToString:@"SwipeFromDewey"])
  {
    [(SBPPTRunner *)self _runSwipeFromDeweyTestWithOptions:v6];
  }
  else if ([v7 isEqualToString:@"ScrollDewey"])
  {
    [(SBPPTRunner *)self _runScrollDeweyTestWithOptions:v6];
  }
  else if ([v7 isEqualToString:@"ScrollDeweyLibrarySearch"])
  {
    [(SBPPTRunner *)self _runLibrarySearchTestWithOptions:v6];
  }
  else if ([v7 isEqualToString:@"ScrollDeweyWithinExpandedPod"])
  {
    [(SBPPTRunner *)self _runScrollWithinExpandedPodTestWithOptions:v6];
  }
  else if ([v7 isEqualToString:@"DeweyPullToLibrarySearch"])
  {
    [(SBPPTRunner *)self _runPullToAppLibrarySearchTestWithOptions:v6];
  }
  else if ([v7 isEqualToString:@"PresentAppLibraryPad"])
  {
    [(SBPPTRunner *)self _runAppLibraryPadPresentTestWithOptions:v6];
  }
}

- (void)_runAppLibraryPadPresentTestWithOptions:(id)a3
{
  v12[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v4 = +[SBPPTOperation operationToUnlockInterface];
  id v5 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1, v4);
  v12[1] = v5;
  id v6 = +[SBPPTOperation operationToStartTest:v3];
  v12[2] = v6;
  id v7 = +[SBPPTOperation presentAppLibrary:1 forTestWithName:v3];
  v12[3] = v7;
  id v8 = +[SBPPTOperation dismissAppLibraryPad:1 forTestWithName:v3];
  v12[4] = v8;
  id v9 = +[SBPPTOperation operationToFinishTest:v3];
  v12[5] = v9;
  id v10 = +[SBPPTOperation resetAndPrepareforNextTest];
  v12[6] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:7];
  +[SBPPTOperation enqueueOperations:v11];
}

- (void)_runSwipeToDeweyTestWithOptions:(id)a3
{
  void v11[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v4 = +[SBPPTOperation operationToUnlockInterface];
  v11[0] = v4;
  id v5 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:1];
  v11[1] = v5;
  id v6 = +[SBPPTOperation operationToStartTest:v3];
  v11[2] = v6;
  id v7 = +[SBPPTOperation presentAppLibraryPhoneForTestWithName:v3];
  v11[3] = v7;
  id v8 = +[SBPPTOperation operationToFinishTest:v3];
  void v11[4] = v8;
  id v9 = +[SBPPTOperation resetAndPrepareforNextTest];
  void v11[5] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];
  +[SBPPTOperation enqueueOperations:v10];
}

- (void)_runSwipeFromDeweyTestWithOptions:(id)a3
{
  v12[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v4 = +[SBPPTOperation operationToUnlockInterface];
  id v5 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1, v4);
  v12[1] = v5;
  id v6 = +[SBPPTOperation presentAppLibraryForTestWithName:v3];
  v12[2] = v6;
  id v7 = +[SBPPTOperation operationToStartTest:v3];
  v12[3] = v7;
  id v8 = +[SBPPTOperation dismissAppLibraryOverlay];
  v12[4] = v8;
  id v9 = +[SBPPTOperation operationToFinishTest:v3];
  v12[5] = v9;
  id v10 = +[SBPPTOperation resetAndPrepareforNextTest];
  v12[6] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:7];
  +[SBPPTOperation enqueueOperations:v11];
}

- (void)_runScrollDeweyTestWithOptions:(id)a3
{
  v20[7] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"testName"];
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v20[0] = v5;
  id v6 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:1];
  v20[1] = v6;
  id v7 = +[SBPPTOperation configureAppLibraryForEachAppHavingOwnPod];
  v20[2] = v7;
  id v8 = +[SBPPTOperation presentAppLibraryForTestWithName:v4];
  v20[3] = v8;
  id v9 = +[SBPPTOperation resetAppLibraryToTop];
  v20[4] = v9;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke;
  id v17 = &unk_1E6B0E408;
  id v18 = self;
  id v19 = v4;
  id v10 = v4;
  id v11 = +[SBPPTRecapPerformanceTestingOperation scrollViewRecapPerformanceTestOperationWithBlock:&v14];
  void v20[5] = v11;
  id v12 = +[SBPPTOperation resetAndPrepareforNextTest];
  v20[6] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];
  +[SBPPTOperation enqueueOperations:v13];
}

id __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _libraryViewController];
  uint64_t v3 = [v2 containerViewController];
  objc_msgSend(v3, "ppt_setDisablePullToSearch:", 1);

  id v4 = [v2 podFolderViewController];
  id v5 = [v4 contentScrollView];

  [v5 _scrollToTopIfPossible:0];
  id v6 = objc_alloc(MEMORY[0x1E4F94840]);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke_2;
  v11[3] = &unk_1E6AF4AC0;
  id v12 = v2;
  id v8 = v2;
  id v9 = (void *)[v6 initWithTestName:v7 scrollView:v5 completionHandler:v11];
  [*(id *)(a1 + 32) _configureParams:v9 forScrollView:v5];

  return v9;
}

void __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerViewController];
  objc_msgSend(v1, "ppt_setDisablePullToSearch:", 0);
}

- (void)_runLibrarySearchTestWithOptions:(id)a3
{
  void v20[8] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"testName"];
  id v17 = +[SBIconController sharedInstance];
  id v16 = [v17 iconManager];
  uint64_t v15 = [v16 rootFolderController];
  id v5 = +[SBPPTOperation operationToUnlockInterface];
  v20[0] = v5;
  id v6 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToPage:animated:completion:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToPage:animated:completion:", [v15 lastIconPageIndex], 1, 0);
  v20[1] = v6;
  uint64_t v7 = +[SBPPTOperation presentAppLibraryForTestWithName:v4];
  v20[2] = v7;
  id v8 = +[SBPPTOperation presentAppLibrarySearchByTappingSearchField];
  v20[3] = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__SBPPTRunner_AppLibraryPPTSupport___runLibrarySearchTestWithOptions___block_invoke;
  v18[3] = &unk_1E6B0E408;
  v18[4] = self;
  id v19 = v4;
  id v14 = v4;
  id v9 = +[SBPPTRecapPerformanceTestingOperation scrollViewRecapPerformanceTestOperationWithBlock:v18];
  v20[4] = v9;
  id v10 = +[SBPPTOperation operationToWaitForTimeInterval:1.0];
  void v20[5] = v10;
  id v11 = +[SBPPTOperation dismissAppLibrarySearch];
  v20[6] = v11;
  id v12 = +[SBPPTOperation resetAndPrepareforNextTest];
  v20[7] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:8];
  +[SBPPTOperation enqueueOperations:v13];
}

id __70__SBPPTRunner_AppLibraryPPTSupport___runLibrarySearchTestWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _libraryViewController];
  uint64_t v3 = [v2 contentScrollView];
  [v3 _scrollToTopIfPossible:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F94840]) initWithTestName:*(void *)(a1 + 40) scrollView:v3 completionHandler:0];
  [*(id *)(a1 + 32) _configureParams:v4 forScrollView:v3];

  return v4;
}

- (void)_runScrollWithinExpandedPodTestWithOptions:(id)a3
{
  v23[10] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"testName"];
  uint64_t v20 = +[SBPPTOperation operationToUnlockInterface];
  v23[0] = v20;
  id v19 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:0];
  v23[1] = v19;
  id v18 = +[SBPPTOperation configureAppLibraryForAllAppsInOnePod];
  v23[2] = v18;
  id v17 = +[SBPPTOperation presentAppLibraryForTestWithName:v4];
  v23[3] = v17;
  id v16 = +[SBPPTOperation operationToStartTest:v4];
  v23[4] = v16;
  uint64_t v15 = +[SBPPTOperation appLibraryExpandFirstPod];
  id v5 = [v15 markStartSubTest:@"ExpandPod" forTestName:v4];
  id v6 = [v5 markFinishedSubTest:@"ExpandPod" forTestName:v4];
  v23[5] = v6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke;
  v21[3] = &unk_1E6B0E408;
  v21[4] = self;
  id v22 = v4;
  id v7 = v4;
  id v8 = +[SBPPTRecapPerformanceTestingOperation scrollViewRecapPerformanceTestOperationWithBlock:v21];
  v23[6] = v8;
  id v9 = +[SBPPTOperation appLibraryDismissExpandedPod];
  id v10 = [v9 markStartSubTest:@"CollapsePod" forTestName:v7];
  id v11 = [v10 markFinishedSubTest:@"CollapsePod" forTestName:v7];
  v23[7] = v11;
  id v12 = +[SBPPTOperation operationToFinishTest:v7];
  v23[8] = v12;
  id v13 = +[SBPPTOperation resetAndPrepareforNextTest];
  v23[9] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:10];
  +[SBPPTOperation enqueueOperations:v14];
}

id __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _libraryViewController];
  uint64_t v3 = [v2 contentScrollView];
  [v3 _scrollToTopIfPossible:0];
  [(id)*MEMORY[0x1E4F43630] startedSubTest:@"ScrollDeweyExpandedPod" forTest:*(void *)(a1 + 40)];
  id v4 = objc_alloc(MEMORY[0x1E4F94840]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke_2;
  v7[3] = &unk_1E6AF4AC0;
  id v8 = *(id *)(a1 + 40);
  id v5 = (void *)[v4 initWithTestName:0 scrollView:v3 completionHandler:v7];
  [*(id *)(a1 + 32) _configureParams:v5 forScrollView:v3];

  return v5;
}

uint64_t __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke_2(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"ScrollDeweyExpandedPod" forTest:*(void *)(a1 + 32)];
}

- (void)_runPullToAppLibrarySearchTestWithOptions:(id)a3
{
  v14[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"testName"];
  id v13 = +[SBPPTOperation operationToUnlockInterface];
  v14[0] = v13;
  id v12 = +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:1];
  v14[1] = v12;
  id v4 = +[SBPPTOperation presentAppLibraryForTestWithName:v3];
  v14[2] = v4;
  id v5 = +[SBPPTOperation resetAppLibraryToTop];
  v14[3] = v5;
  id v6 = +[SBPPTOperation operationToStartTest:v3];
  void v14[4] = v6;
  id v7 = +[SBPPTOperation pullToAppLibrarySearch];
  v14[5] = v7;
  id v8 = +[SBPPTOperation dismissAppLibrarySearch];
  v14[6] = v8;
  id v9 = +[SBPPTOperation operationToFinishTest:v3];
  v14[7] = v9;
  id v10 = +[SBPPTOperation resetAndPrepareforNextTest];
  v14[8] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:9];
  +[SBPPTOperation enqueueOperations:v11];
}

- (void)_configureParams:(id)a3 forScrollView:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  [v25 setPreventSheetDismissal:1];
  RPTAmplitudeFromPagesOfView();
  objc_msgSend(v25, "setAmplitude:");
  id v7 = [(SBPPTRunner *)self _libraryViewController];
  id v8 = [v6 window];

  [v8 bounds];
  id v9 = [v7 containerViewController];
  id v10 = [v9 searchBar];
  [v10 frame];
  CGRectGetMaxY(v27);
  UIRectInset();

  UIRectInset();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    UIRectInset();
    double v12 = v21;
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
  }
  objc_msgSend(v25, "setScrollingBounds:", v12, v14, v16, v18);
}

- (id)_mainDisplayWindowScene
{
  uint64_t v2 = [(id)SBApp windowSceneManager];
  uint64_t v3 = [v2 connectedWindowScenes];
  id v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_56_3);

  return v4;
}

uint64_t __60__SBPPTRunner_AppLibraryPPTSupport___mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

- (id)_libraryViewController
{
  uint64_t v3 = +[SBIconController sharedInstance];
  if ([v3 isModalAppLibrarySupported])
  {
    id v4 = [(SBPPTRunner *)self _mainDisplayWindowScene];
    id v5 = [v4 modalLibraryController];
    id v6 = [v5 libraryViewController];
  }
  else
  {
    id v6 = [v3 overlayLibraryViewController];
  }

  return v6;
}

void __29__SBPPTRunner_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)sharedInstance___sharedInstance_30;
  sharedInstance___sharedInstance_30 = (uint64_t)v1;
}

@end