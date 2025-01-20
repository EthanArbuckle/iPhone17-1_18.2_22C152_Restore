@interface SBPPTOperation
+ (BOOL)_isLibraryDismissalAllowedWithCompletion:(id)a3;
+ (BOOL)_isLibraryPresentationAllowedWithCompletion:(id)a3;
+ (BOOL)isLibraryPresented;
+ (id)_libraryViewController;
+ (id)_mainDisplayWindowScene;
+ (id)appLibraryDismissExpandedPod;
+ (id)appLibraryExpandFirstPod;
+ (id)configureAppLibraryForAllAppsInOnePod;
+ (id)configureAppLibraryForEachAppHavingOwnPod;
+ (id)dismissAppLibraryOverlay;
+ (id)dismissAppLibraryPad:(BOOL)a3 forTestWithName:(id)a4;
+ (id)dismissAppLibrarySearch;
+ (id)dismissOverlaysAndResetHomeScreenToFirstIconPageAnimated:(BOOL)a3;
+ (id)dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:(BOOL)a3;
+ (id)dismissOverlaysAndResetHomeScreenToPage:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
+ (id)operationToActivateApplicationWithBundleIdentifier:(id)a3;
+ (id)operationToActivateNullOffscreenApp;
+ (id)operationToCreateFolderWithName:(id)a3 containingIconsForBundleIdentifiers:(id)a4;
+ (id)operationToDismissAppSwitcherAndReturnToSource;
+ (id)operationToDismissBannerNotification;
+ (id)operationToDismissCoverSheet;
+ (id)operationToDismissFloatingDock;
+ (id)operationToDismissPageManagementForTestWithName:(id)a3;
+ (id)operationToFinishTest:(id)a3;
+ (id)operationToLoadPPTAppSwitcherState;
+ (id)operationToLockInterface;
+ (id)operationToMonitorCoverSheetTransitionWithTestName:(id)a3 execute:(id)a4;
+ (id)operationToOpenFolderWithName:(id)a3;
+ (id)operationToPresentAppSwitcher;
+ (id)operationToPresentBannerNotification;
+ (id)operationToPresentCoverSheet;
+ (id)operationToPresentFloatingDock;
+ (id)operationToPresentPageManagementForTestWithName:(id)a3;
+ (id)operationToPreventSystemIdle;
+ (id)operationToPublishExampleNotificationsWithNotificationCount:(unint64_t)a3 threadCount:(unint64_t)a4;
+ (id)operationToRemoveExampleNotifications;
+ (id)operationToRestoreAppSwitcherState;
+ (id)operationToRestoreHomeScreenState;
+ (id)operationToResumeSystemIdle;
+ (id)operationToSaveAppSwitcherState;
+ (id)operationToSaveHomeScreenState;
+ (id)operationToSetAllApplicationsBlockedForScreenTime:(BOOL)a3;
+ (id)operationToSetApplicationWithBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4;
+ (id)operationToSetInterfaceOrientation:(int64_t)a3;
+ (id)operationToStartTest:(id)a3;
+ (id)operationToSwipeDownInMiddleOfInterface;
+ (id)operationToSwipeLeftInMiddleOfInterface;
+ (id)operationToSwipeRightInMiddleOfInterface;
+ (id)operationToSwipeUpInMiddleOfInterface;
+ (id)operationToSynthesizeEventsForCommandString:(id)a3;
+ (id)operationToSynthesizeEventsForEventActions:(id)a3;
+ (id)operationToSynthesizeEventsForEventStream:(id)a3;
+ (id)operationToTerminateApplicationWithBundleIdentifier:(id)a3;
+ (id)operationToTerminateNullOffscreenApp;
+ (id)operationToTransitionToHomeScreen;
+ (id)operationToUnlockInterface;
+ (id)operationToUnlockInterfaceFinishingUIUnlock:(BOOL)a3;
+ (id)operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName:(id)a3;
+ (id)operationToWaitForNotificationName:(id)a3 object:(id)a4 timeout:(double)a5;
+ (id)operationToWaitForTimeInterval:(double)a3;
+ (id)performTapAtPointWithBlock:(id)a3;
+ (id)presentAppLibrary:(BOOL)a3 forTestWithName:(id)a4;
+ (id)presentAppLibraryForTestWithName:(id)a3;
+ (id)presentAppLibraryPhone;
+ (id)presentAppLibrarySearchByTappingSearchField;
+ (id)pullToAppLibrarySearch;
+ (id)resetAndPrepareforNextTest;
+ (id)resetAppLibraryToTop;
+ (void)_appLibrarySupport__performPanGesturesOnScreenFromPage:(unint64_t)a3 toPage:(unint64_t)a4 completion:(id)a5;
+ (void)_appLibrarySupport_performDragFromPoint:(CGPoint)a3 andDragTo:(CGPoint)a4 duration:(double)a5 fromView:(id)a6 withCompletion:(id)a7;
+ (void)_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:(double)a3 completion:(id)a4;
+ (void)_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:(double)a3 completion:(id)a4;
+ (void)_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:(double)a3 completion:(id)a4;
+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnDefaultHomeScreenIconPageWithCompletion:(id)a3;
+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion:(id)a3;
+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnPage:(unint64_t)a3 withCompletion:(id)a4;
+ (void)_appLibrarySupport_performPanWithComposer:(id)a3 startLocation:(CGPoint)a4 endLocation:(CGPoint)a5 duration:(double)a6;
+ (void)_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:(double)a3 completion:(id)a4;
+ (void)_appLibrarySupport_performTapAtPoint:(CGPoint)a3 fromView:(id)a4 withCompletion:(id)a5;
+ (void)_dismissOverlaysAndResetHomeScreenToPage:(unint64_t)a3 animated:(BOOL)a4 operation:(id)a5 completion:(id)a6;
+ (void)enqueueOperations:(id)a3;
- (NSString)operationName;
- (SBPPTOperation)init;
- (id)markFinishedSubTest:(id)a3 forTestName:(id)a4;
- (id)markFinishedTest:(id)a3;
- (id)markStartSubTest:(id)a3 forTestName:(id)a4;
- (id)markStartedTest:(id)a3;
- (void)operationDidFinish;
- (void)operationWillStart;
- (void)setOperationName:(id)a3;
@end

@implementation SBPPTOperation

- (id)markStartedTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SBPPTOperation_markStartedTest___block_invoke;
  v9[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x1D948C7A0](v9);
  id startTestBlock = self->_startTestBlock;
  self->_id startTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

void __34__SBPPTOperation_markStartedTest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 startedTest:*(void *)(a1 + 32)];

  id v4 = SBLogPPT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained operationName];
    v6 = (void *)v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = (uint64_t)WeakRetained;
    }
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting testname '%@'", (uint8_t *)&v9, 0x16u);
  }
}

- (id)markFinishedTest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__SBPPTOperation_markFinishedTest___block_invoke;
  v9[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x1D948C7A0](v9);
  id finishTestBlock = self->_finishTestBlock;
  self->_id finishTestBlock = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return self;
}

void __35__SBPPTOperation_markFinishedTest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 finishedTest:*(void *)(a1 + 32)];

  id v4 = SBLogPPT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained operationName];
    v6 = (void *)v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = (uint64_t)WeakRetained;
    }
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@'", (uint8_t *)&v9, 0x16u);
  }
}

- (id)markStartSubTest:(id)a3 forTestName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SBPPTOperation_markStartSubTest_forTestName___block_invoke;
  v13[3] = &unk_1E6AFB8D8;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = (void *)MEMORY[0x1D948C7A0](v13);
  id startSubTestBlock = self->_startSubTestBlock;
  self->_id startSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

void __47__SBPPTOperation_markStartSubTest_forTestName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 startedSubTest:*(void *)(a1 + 32) forTest:*(void *)(a1 + 40)];

  id v4 = SBLogPPT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained operationName];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = (uint64_t)WeakRetained;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138412802;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' started testname '%@' / sub test %@", (uint8_t *)&v10, 0x20u);
  }
}

- (id)markFinishedSubTest:(id)a3 forTestName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__SBPPTOperation_markFinishedSubTest_forTestName___block_invoke;
  v13[3] = &unk_1E6AFB8D8;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  int v10 = (void *)MEMORY[0x1D948C7A0](v13);
  id finishSubTestBlock = self->_finishSubTestBlock;
  self->_id finishSubTestBlock = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

void __50__SBPPTOperation_markFinishedSubTest_forTestName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 finishedSubTest:*(void *)(a1 + 32) forTest:*(void *)(a1 + 40)];

  id v4 = SBLogPPT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained operationName];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = (uint64_t)WeakRetained;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138412802;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@' / sub test %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)operationWillStart
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_operationStartTime = CFAbsoluteTimeGetCurrent();
  v3 = SBLogPPT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (SBPPTOperation *)self->_operationName;
    if (!operationName) {
      operationName = self;
    }
    int v9 = 138412290;
    int v10 = operationName;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting", (uint8_t *)&v9, 0xCu);
  }

  id startTestBlock = (void (**)(void))self->_startTestBlock;
  if (startTestBlock)
  {
    startTestBlock[2]();
    id v6 = self->_startTestBlock;
    self->_id startTestBlock = 0;
  }
  id startSubTestBlock = (void (**)(void))self->_startSubTestBlock;
  if (startSubTestBlock)
  {
    startSubTestBlock[2]();
    id v8 = self->_startSubTestBlock;
    self->_id startSubTestBlock = 0;
  }
}

- (void)operationDidFinish
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_operationEndTime = CFAbsoluteTimeGetCurrent();
  v3 = SBLogPPT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    operationName = (SBPPTOperation *)self->_operationName;
    if (!operationName) {
      operationName = self;
    }
    double v5 = self->_operationEndTime - self->_operationStartTime;
    int v10 = 138412546;
    uint64_t v11 = operationName;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' executed in %f seconds", (uint8_t *)&v10, 0x16u);
  }

  id finishSubTestBlock = (void (**)(void))self->_finishSubTestBlock;
  if (finishSubTestBlock)
  {
    finishSubTestBlock[2]();
    id v7 = self->_finishSubTestBlock;
    self->_id finishSubTestBlock = 0;
  }
  id finishTestBlock = (void (**)(void))self->_finishTestBlock;
  if (finishTestBlock)
  {
    finishTestBlock[2]();
    id v9 = self->_finishTestBlock;
    self->_id finishTestBlock = 0;
  }
}

+ (void)enqueueOperations:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F08];
  id v4 = a3;
  id v5 = [v3 mainQueue];
  [v5 addOperations:v4 waitUntilFinished:0];
}

+ (id)operationToUnlockInterface
{
  v3 = [a1 operationToUnlockInterfaceFinishingUIUnlock:1];
  id v4 = NSStringFromSelector(a2);
  [v3 setName:v4];

  return v3;
}

+ (id)operationToUnlockInterfaceFinishingUIUnlock:(BOOL)a3
{
  id v4 = NSStringFromSelector(a2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke;
  v7[3] = &__block_descriptor_33_e29_v16__0__SBPPTBlockOperation_8l;
  BOOL v8 = a3;
  id v5 = +[SBPPTBlockOperation operationWithName:v4 block:v7];

  return v5;
}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBLockScreenManager sharedInstance];
  int v5 = [v4 isUILocked];

  if (v5)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    __int16 v12 = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_3;
    double v13 = &unk_1E6AF5D38;
    char v15 = *(unsigned char *)(a1 + 32);
    id v14 = v3;
    id v6 = (void (**)(void))MEMORY[0x1D948C7A0](&v10);
    id v7 = +[SBBacklightController sharedInstance];
    int v8 = [v7 screenIsOn];

    if (v8)
    {
      v6[2](v6);
    }
    else
    {
      __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_2();
      dispatch_time_t v9 = dispatch_time(0, 2000000000);
      dispatch_after(v9, MEMORY[0x1E4F14428], v6);
    }
  }
  else
  {
    [v3 finish];
  }
}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_2()
{
  v0 = [(id)SBApp lockHardwareButton];
  id v1 = [v0 buttonActions];

  [v1 performInitialButtonDownActions];
  [v1 performButtonUpPreActions];
  [v1 performSinglePressAction];
}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_3(uint64_t a1)
{
  v2 = +[SBLockScreenManager sharedInstance];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_4;
  v4[3] = &unk_1E6AFA1B8;
  id v5 = *(id *)(a1 + 32);
  [v2 attemptUnlockWithPasscode:@"1111" finishUIUnlock:v3 completion:v4];
}

void __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_5;
    block[3] = &unk_1E6AF4AC0;
    id v7 = *(id *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    [v5 cancelAndFailTestWithReason:@"Couldn't unlock user interface"];
  }
}

uint64_t __62__SBPPTOperation_operationToUnlockInterfaceFinishingUIUnlock___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToLockInterface
{
  uint64_t v3 = +[SBBacklightController sharedInstance];
  +[SBScreenWakeAnimationController backlightFadeDurationForSource:isWake:](SBScreenWakeAnimationController, "backlightFadeDurationForSource:isWake:", 1, [v3 screenIsOn]);
  uint64_t v5 = v4;
  +[SBScreenWakeAnimationController backlightFadeDurationForSource:1 isWake:1];
  uint64_t v7 = v6;
  int v8 = NSStringFromSelector(a2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke;
  v12[3] = &unk_1E6AFE468;
  id v13 = v3;
  uint64_t v14 = v5;
  uint64_t v15 = v7;
  id v9 = v3;
  uint64_t v10 = +[SBPPTBlockOperation operationWithName:v8 block:v12];

  return v10;
}

void __42__SBPPTOperation_operationToLockInterface__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_2;
  v5[3] = &unk_1E6AF7748;
  uint64_t v8 = *(void *)(a1 + 40);
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v4 = v3;
  SBPPTSynthesizeEventsForCommandString(@"b w", v5);
}

void __42__SBPPTOperation_operationToLockInterface__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_3;
  block[3] = &unk_1E6AF6FC0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __42__SBPPTOperation_operationToLockInterface__block_invoke_3(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_4;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = *(id *)(a1 + 32);
  dispatch_time_t v2 = (void (**)(void))MEMORY[0x1D948C7A0](v6);
  if ([*(id *)(a1 + 40) screenIsOn])
  {
    v2[2](v2);
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__SBPPTOperation_operationToLockInterface__block_invoke_5;
    v3[3] = &unk_1E6AFE440;
    uint64_t v5 = *(void *)(a1 + 48);
    id v4 = v2;
    SBPPTSynthesizeEventsForCommandString(@"b w", v3);
  }
}

uint64_t __42__SBPPTOperation_operationToLockInterface__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void __42__SBPPTOperation_operationToLockInterface__block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  id v3 = *(void **)(a1 + 32);
  id v4 = MEMORY[0x1E4F14428];
  dispatch_after(v2, v4, v3);
}

+ (id)operationToSetInterfaceOrientation:(int64_t)a3
{
  id v4 = NSStringFromSelector(a2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v7[4] = a3;
  uint64_t v5 = +[SBPPTBlockOperation operationWithName:v4 block:v7];

  return v5;
}

void __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x1E4F43630];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_2;
  v7[3] = &unk_1E6AF5350;
  id v8 = v3;
  id v6 = v3;
  [v4 rotateIfNeeded:v5 completion:v7];
}

void __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __53__SBPPTOperation_operationToSetInterfaceOrientation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToMonitorCoverSheetTransitionWithTestName:(id)a3 execute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke;
  v13[3] = &unk_1E6AFE4B0;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = +[SBPPTBlockOperation operationWithName:v8 block:v13];

  return v11;
}

void __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBCoverSheetPresentationManager sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_2;
  v9[3] = &unk_1E6AF4AC0;
  id v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setPpt_transitionBeginsCallback:", v9);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_4;
  v6[3] = &unk_1E6AF5290;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  objc_msgSend(v4, "setPpt_transitionEndsCallback:", v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_3;
  v4[3] = &unk_1E6AF4AC0;
  id v5 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v4];
}

uint64_t __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"animation" forTest:v4];
}

uint64_t __77__SBPPTOperation_operationToMonitorCoverSheetTransitionWithTestName_execute___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:*(void *)(a1 + 32)];
  [*v2 finishedTest:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  return [v3 finish];
}

+ (id)operationToPreventSystemIdle
{
  dispatch_time_t v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_31_1];

  return v3;
}

void __46__SBPPTOperation_operationToPreventSystemIdle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  SBWorkspaceSetPreventIdleSleepForReason(1, @"SBWorkspacePreventIdleSleepReasonPPT");
  [v2 finish];
}

+ (id)operationToResumeSystemIdle
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_33_0];

  return v3;
}

void __45__SBPPTOperation_operationToResumeSystemIdle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  SBWorkspaceSetPreventIdleSleepForReason(0, @"SBWorkspacePreventIdleSleepReasonPPT");
  [v2 finish];
}

+ (id)operationToWaitForTimeInterval:(double)a3
{
  uint64_t v4 = NSStringFromSelector(a2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  *(double *)&void v7[4] = a3;
  id v5 = +[SBPPTBlockOperation operationWithName:v4 block:v7];

  return v5;
}

void __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 32) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __49__SBPPTOperation_operationToWaitForTimeInterval___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToWaitForNotificationName:(id)a3 object:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = NSStringFromSelector(a2);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke;
  v15[3] = &unk_1E6AFE520;
  id v16 = v8;
  id v17 = v9;
  double v18 = a5;
  id v11 = v9;
  id v12 = v8;
  id v13 = +[SBPPTBlockOperation operationWithName:v10 block:v15];

  return v13;
}

void __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  id v5 = (void *)*((void *)a1 + 4);
  dispatch_time_t v4 = (void *)*((void *)a1 + 5);
  double v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke_2;
  v8[3] = &unk_1E6AFE4F8;
  id v9 = v3;
  id v10 = v5;
  uint64_t v11 = *((void *)a1 + 6);
  id v7 = v3;
  SBPPTObserveNotification(v5, v4, v8, v6);
}

void __68__SBPPTOperation_operationToWaitForNotificationName_object_timeout___block_invoke_2(void *a1, uint64_t a2)
{
  id v2 = (void *)a1[4];
  if (a2)
  {
    id v3 = (void *)a1[4];
    [v3 finish];
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"Didn't observe %@ within %f seconds", a1[5], a1[6]];
    [v2 cancelAndFailTestWithReason:v4];
  }
}

+ (id)operationToTransitionToHomeScreen
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_40_0];

  return v3;
}

void __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspace mainWorkspace];
  id v4 = [v3 createRequestWithOptions:0];

  [v4 modifyApplicationContext:&__block_literal_global_44];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_3;
  v8[3] = &unk_1E6AF5350;
  id v9 = v2;
  id v5 = v2;
  id v6 = (id)[v4 addCompletionHandler:v8];
  id v7 = +[SBWorkspace mainWorkspace];
  [v7 executeTransitionRequest:v4];
}

void __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspaceEntity entity];
  [v2 setActivatingEntity:v3];
}

void __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_3(uint64_t a1)
{
  id v2 = +[SBMainWorkspace sharedInstance];
  id v3 = [v2 eventQueue];
  id v4 = (void *)MEMORY[0x1E4F624D8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_4;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = *(id *)(a1 + 32);
  id v5 = [v4 eventWithName:@"PPTHomeScreenTransition" handler:v6];
  [v3 executeOrAppendEvent:v5];
}

uint64_t __51__SBPPTOperation_operationToTransitionToHomeScreen__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToSaveHomeScreenState
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_52_0];

  return v3;
}

void __48__SBPPTOperation_operationToSaveHomeScreenState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBIconController sharedInstance];
  id v8 = 0;
  objc_msgSend(v3, "_ppt_pushHomeScreenStateWithError:", &v8);
  id v4 = v8;

  if (v4)
  {
    uint64_t v5 = [v4 description];
    [v2 cancelAndFailTestWithReason:v5];

    id v2 = (id)v5;
  }
  else
  {
    id v6 = +[SBIconController sharedInstance];
    id v7 = [v6 iconManager];
    [v7 relayout];

    [v2 finish];
  }
}

+ (id)operationToRestoreHomeScreenState
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_58_1];

  return v3;
}

void __51__SBPPTOperation_operationToRestoreHomeScreenState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = +[SBIconController sharedInstance];
  objc_msgSend(v2, "_ppt_popHomeScreenState");

  [v3 finish];
}

+ (id)operationToCreateFolderWithName:(id)a3 containingIconsForBundleIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__SBPPTOperation_operationToCreateFolderWithName_containingIconsForBundleIdentifiers___block_invoke;
  v13[3] = &unk_1E6AFE548;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = +[SBPPTBlockOperation operationWithName:v8 block:v13];

  return v11;
}

void __86__SBPPTOperation_operationToCreateFolderWithName_containingIconsForBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  id v3 = +[SBIconController sharedInstance];
  id v4 = [v3 rootFolder];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v4 indexPathForNodeIdentifier:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        id v12 = [v4 iconAtIndexPath:v11];

        if (v12 && [v12 isApplicationIcon]) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  id v13 = [v3 model];
  id v14 = [v13 makeFolderWithDisplayName:*(void *)(a1 + 40)];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        [v4 removeIcon:v20 options:0];
        id v21 = (id)[v14 addIcon:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  v22 = (void *)[objc_alloc(MEMORY[0x1E4FA61D8]) initWithFolder:v14];
  id v23 = (id)[v4 addIcon:v22];
  v24 = [v3 iconManager];
  [v24 layoutIconListsWithAnimationType:-1 forceRelayout:1];
  [v25 finish];
}

+ (id)operationToOpenFolderWithName:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke;
  v9[3] = &unk_1E6AFE570;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = +[SBPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

void __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SBIconController sharedInstance];
  id v5 = [v4 rootFolder];
  id v6 = [v5 allIcons];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v12 isFolderIcon])
        {
          id v13 = [v12 displayName];
          int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

          if (v14)
          {
            uint64_t v16 = [v4 iconManager];
            [v16 scrollToIconListContainingIcon:v12 animate:0];

            [v12 launchFromLocation:*MEMORY[0x1E4FA66D0] context:0];
            dispatch_time_t v17 = dispatch_time(0, 1000000000);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke_2;
            block[3] = &unk_1E6AF4AC0;
            id v19 = v3;
            dispatch_after(v17, MEMORY[0x1E4F14428], block);

            id v15 = v7;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = [NSString stringWithFormat:@"Couldn't find folder named %@", *(void *)(a1 + 32)];
  [v3 cancelAndFailTestWithReason:v15];
LABEL_12:
}

uint64_t __48__SBPPTOperation_operationToOpenFolderWithName___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToPresentAppSwitcher
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_65];

  return v3;
}

void __47__SBPPTOperation_operationToPresentAppSwitcher__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [v3 embeddedDisplayWindowScene];

  id v5 = [v4 switcherController];
  if ([v5 unlockedEnvironmentMode] == 2)
  {
    [v2 finish];
  }
  else
  {
    [v5 activateMainSwitcherWithSource:21 animated:1];
    id v6 = +[SBMainWorkspace sharedInstance];
    id v7 = [v6 eventQueue];
    uint64_t v8 = (void *)MEMORY[0x1E4F624D8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__SBPPTOperation_operationToPresentAppSwitcher__block_invoke_2;
    v10[3] = &unk_1E6AF4AC0;
    id v11 = v2;
    uint64_t v9 = [v8 eventWithName:@"PPTAppSwitcherPresentation" handler:v10];
    [v7 executeOrAppendEvent:v9];
  }
}

uint64_t __47__SBPPTOperation_operationToPresentAppSwitcher__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToDismissAppSwitcherAndReturnToSource
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_70];

  return v3;
}

void __64__SBPPTOperation_operationToDismissAppSwitcherAndReturnToSource__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [v3 embeddedDisplayWindowScene];

  id v5 = [v4 switcherController];
  if ([v5 unlockedEnvironmentMode] == 2)
  {
    [v5 dismissMainSwitcherWithSource:21 animated:1];
    id v6 = +[SBMainWorkspace sharedInstance];
    id v7 = [v6 eventQueue];
    uint64_t v8 = (void *)MEMORY[0x1E4F624D8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__SBPPTOperation_operationToDismissAppSwitcherAndReturnToSource__block_invoke_2;
    v10[3] = &unk_1E6AF4AC0;
    id v11 = v2;
    uint64_t v9 = [v8 eventWithName:@"PPTAppSwitcherDismissal" handler:v10];
    [v7 executeOrAppendEvent:v9];
  }
  else
  {
    [v2 finish];
  }
}

uint64_t __64__SBPPTOperation_operationToDismissAppSwitcherAndReturnToSource__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToSaveAppSwitcherState
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_75_0];

  return v3;
}

void __49__SBPPTOperation_operationToSaveAppSwitcherState__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!SBPPTOperationAppSwitcherStateStack)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = (void *)SBPPTOperationAppSwitcherStateStack;
    SBPPTOperationAppSwitcherStateStack = (uint64_t)v2;
  }
  id v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v5 = [v4 _recentAppLayoutsController];
  id v6 = objc_msgSend(v5, "_ppt_currentModel");

  if (v6)
  {
    [(id)SBPPTOperationAppSwitcherStateStack addObject:v6];
    [v7 finish];
  }
  else
  {
    [v7 cancelAndFailTestWithReason:@"Couldn't save app switcher state (nothing to save)"];
  }
}

+ (id)operationToRestoreAppSwitcherState
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_81];

  return v3;
}

void __52__SBPPTOperation_operationToRestoreAppSwitcherState__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = [(id)SBPPTOperationAppSwitcherStateStack lastObject];
  if (v2)
  {
    [(id)SBPPTOperationAppSwitcherStateStack removeLastObject];
    id v3 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    id v4 = [v3 _recentAppLayoutsController];
    objc_msgSend(v4, "_ppt_setModel:", v2);

    [v5 finish];
  }
  else
  {
    [v5 cancelAndFailTestWithReason:@"Couldn't restore app switcher state (nothing to restore)"];
  }
}

+ (id)operationToLoadPPTAppSwitcherState
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_86_0];

  return v3;
}

void __52__SBPPTOperation_operationToLoadPPTAppSwitcherState__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v3 = [v2 _recentAppLayoutsController];
  id v4 = (id)objc_msgSend(v3, "_ppt_loadStashedModel");

  [v5 finish];
}

+ (id)operationToPresentCoverSheet
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_88_0];

  return v3;
}

void __46__SBPPTOperation_operationToPresentCoverSheet__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBCoverSheetPresentationManager sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SBPPTOperation_operationToPresentCoverSheet__block_invoke_2;
  v5[3] = &unk_1E6AF4AC0;
  id v6 = v2;
  id v4 = v2;
  [v3 setCoverSheetPresented:1 animated:1 withCompletion:v5];
}

uint64_t __46__SBPPTOperation_operationToPresentCoverSheet__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToDismissCoverSheet
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_90];

  return v3;
}

void __46__SBPPTOperation_operationToDismissCoverSheet__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBCoverSheetPresentationManager sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SBPPTOperation_operationToDismissCoverSheet__block_invoke_2;
  v5[3] = &unk_1E6AF4AC0;
  id v6 = v2;
  id v4 = v2;
  [v3 setCoverSheetPresented:0 animated:1 withCompletion:v5];
}

uint64_t __46__SBPPTOperation_operationToDismissCoverSheet__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToPresentFloatingDock
{
  id v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v4 = +[SBPPTBlockOperation operationWithName:v3 block:v6];

  return v4;
}

void __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _mainDisplayWindowScene];
  id v5 = [v4 floatingDockController];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_2;
    v6[3] = &unk_1E6AF5350;
    id v7 = v3;
    [v5 presentFloatingDockIfDismissedAnimated:0 completionHandler:v6];
  }
  else
  {
    [v3 cancelAndFailTestWithReason:@"Floating dock not supported"];
  }
}

void __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 48000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __48__SBPPTOperation_operationToPresentFloatingDock__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToDismissFloatingDock
{
  id v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v4 = +[SBPPTBlockOperation operationWithName:v3 block:v6];

  return v4;
}

void __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _mainDisplayWindowScene];
  id v5 = [v4 floatingDockController];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_2;
    v6[3] = &unk_1E6AF5350;
    id v7 = v3;
    [v5 dismissFloatingDockIfPresentedAnimated:0 completionHandler:v6];
  }
  else
  {
    [v3 cancelAndFailTestWithReason:@"Floating dock not supported"];
  }
}

void __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 48000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __48__SBPPTOperation_operationToDismissFloatingDock__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToPresentBannerNotification
{
  dispatch_time_t v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_95];

  return v3;
}

void __54__SBPPTOperation_operationToPresentBannerNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBNotificationBannerDestination _test_notificationRequestForBannerWithIcon];
  id v4 = [(id)SBApp notificationDispatcher];
  id v5 = [v4 bannerDestination];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SBPPTOperation_operationToPresentBannerNotification__block_invoke_2;
  v7[3] = &unk_1E6AF4AC0;
  id v8 = v2;
  id v6 = v2;
  objc_msgSend(v5, "_test_postNotificationRequest:completion:", v3, v7);
}

uint64_t __54__SBPPTOperation_operationToPresentBannerNotification__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToDismissBannerNotification
{
  id v2 = NSStringFromSelector(a2);
  id v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_98];

  return v3;
}

void __54__SBPPTOperation_operationToDismissBannerNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)SBApp;
  id v3 = a2;
  id v4 = [v2 notificationDispatcher];
  id v5 = [v4 bannerDestination];

  objc_msgSend(v5, "_test_dismissNotificationRequest:", 0);
  [v3 finish];
}

+ (id)operationToPublishExampleNotificationsWithNotificationCount:(unint64_t)a3 threadCount:(unint64_t)a4
{
  id v6 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke;
  v9[3] = &__block_descriptor_48_e29_v16__0__SBPPTBlockOperation_8l;
  void v9[4] = a3;
  v9[5] = a4;
  id v7 = +[SBPPTBlockOperation operationWithName:v6 block:v9];

  [v7 setTimeoutInterval:30.0];
  return v7;
}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBExampleUserNotificationCenter sharedInstance];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2;
  v8[3] = &unk_1E6AF4AC0;
  id v9 = v3;
  id v7 = v3;
  [v4 publish:v6 numberOfUniqueThreads:v5 completion:v8];
}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2(uint64_t a1)
{
  id v2 = +[SBCoverSheetPresentationManager sharedInstance];
  id v3 = [v2 coverSheetViewController];

  id v4 = [v3 mainPageContentViewController];
  uint64_t v5 = [v4 combinedListViewController];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__31;
  void v12[4] = __Block_byref_object_dispose__31;
  id v13 = 0;
  uint64_t v6 = dispatch_queue_create("com.apple.springboard.ppt.ExampleUserNotificationCenter", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_101;
  block[3] = &unk_1E6AF6380;
  id v11 = v12;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v6, block);

  _Block_object_dispose(v12, 8);
}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_101(uint64_t a1)
{
  id v2 = +[SBExampleUserNotificationCenter sharedInstance];
  id v3 = [v2 latestNotificationRequestIdentifier];
  id v4 = [v2 sectionIdentifier];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = MEMORY[0x1E4F14428];
    do
    {
      usleep(0x186A0u);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2_102;
      block[3] = &unk_1E6AFDBE0;
      uint64_t v12 = *(void *)(a1 + 48);
      id v9 = *(id *)(a1 + 32);
      id v10 = v3;
      id v11 = v4;
      dispatch_async(v5, block);
    }
    while (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_3;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_2_102(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _testingNotificationRequestWithIdentifier:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __90__SBPPTOperation_operationToPublishExampleNotificationsWithNotificationCount_threadCount___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToRemoveExampleNotifications
{
  uint64_t v2 = NSStringFromSelector(a2);
  uint64_t v3 = +[SBPPTBlockOperation operationWithName:v2 block:&__block_literal_global_105];

  return v3;
}

void __55__SBPPTOperation_operationToRemoveExampleNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v2 = +[SBExampleUserNotificationCenter sharedInstance];
  [v2 removeAllNotifications];

  [v3 finish];
}

+ (id)operationToActivateApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6AFE570;
  id v10 = v4;
  id v6 = v4;
  id v7 = +[SBPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

void __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBApplicationController sharedInstance];
  uint64_t v5 = [v4 applicationWithBundleIdentifier:*(void *)(a1 + 32)];

  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_2;
    v7[3] = &unk_1E6AFE5B8;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    SBWorkspaceActivateApplicationWithActionsAndResult(v5, 0, v7);
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Couldn't find application with bundle identifier: %@", *(void *)(a1 + 32)];
    [v3 cancelAndFailTestWithReason:v6];
  }
}

void __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v5 = [NSString stringWithFormat:@"Couldn't activate application with bundle identifier: %@", *(void *)(a1 + 40)];
    [v3 cancelAndFailTestWithReason:v5];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_3;
    block[3] = &unk_1E6AF5290;
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

void __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [NSString stringWithFormat:@"PPTApplicationActivation (%@)", *(void *)(a1 + 32)];
  id v3 = +[SBMainWorkspace sharedInstance];
  dispatch_time_t v4 = [v3 eventQueue];
  id v5 = (void *)MEMORY[0x1E4F624D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_4;
  v7[3] = &unk_1E6AF4AC0;
  id v8 = *(id *)(a1 + 40);
  id v6 = [v5 eventWithName:v2 handler:v7];
  [v4 executeOrAppendEvent:v6];
}

uint64_t __69__SBPPTOperation_operationToActivateApplicationWithBundleIdentifier___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToTerminateApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6AFE570;
  id v10 = v4;
  id v6 = v4;
  id v7 = +[SBPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

void __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBApplicationController sharedInstance];
  id v5 = [v4 applicationWithBundleIdentifier:*(void *)(a1 + 32)];

  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke_2;
    v7[3] = &unk_1E6AF4A98;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    SBWorkspaceTerminateApplication(v5, 7, 0, @"Terminating for PPT", v7);
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Couldn't find application with bundle identifier: %@", *(void *)(a1 + 32)];
    [v3 cancelAndFailTestWithReason:v6];
  }
}

void __70__SBPPTOperation_operationToTerminateApplicationWithBundleIdentifier___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finish];
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"Couldn't terminate application with bundle identifier: %@", *(void *)(a1 + 40)];
    [v2 cancelAndFailTestWithReason:v4];
  }
}

+ (id)operationToActivateNullOffscreenApp
{
  id v3 = [a1 operationToActivateApplicationWithBundleIdentifier:@"com.apple.perf.NullOffscreen"];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  return v3;
}

+ (id)operationToTerminateNullOffscreenApp
{
  id v3 = [a1 operationToTerminateApplicationWithBundleIdentifier:@"com.apple.perf.NullOffscreen"];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  return v3;
}

+ (id)operationToSetApplicationWithBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4
{
  id v6 = a3;
  id v7 = NSStringFromSelector(a2);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__SBPPTOperation_operationToSetApplicationWithBundleIdentifier_blockedForScreenTime___block_invoke;
  v11[3] = &unk_1E6AFE5E0;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  id v9 = +[SBPPTBlockOperation operationWithName:v7 block:v11];

  return v9;
}

void __85__SBPPTOperation_operationToSetApplicationWithBundleIdentifier_blockedForScreenTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  +[SBScreenTimeTestRecipe _setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:](SBScreenTimeTestRecipe, "_setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:", v5, *(unsigned __int8 *)(a1 + 40), v6, v7);

  [v4 finish];
}

+ (id)operationToSetAllApplicationsBlockedForScreenTime:(BOOL)a3
{
  id v4 = NSStringFromSelector(a2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SBPPTOperation_operationToSetAllApplicationsBlockedForScreenTime___block_invoke;
  v7[3] = &__block_descriptor_33_e29_v16__0__SBPPTBlockOperation_8l;
  BOOL v8 = a3;
  id v5 = +[SBPPTBlockOperation operationWithName:v4 block:v7];

  return v5;
}

void __68__SBPPTOperation_operationToSetAllApplicationsBlockedForScreenTime___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[SBApplicationController sharedInstance];
  id v4 = [v3 allBundleIdentifiers];
  +[SBScreenTimeTestRecipe _setApplicationBundleIdentifiers:v4 blockedForScreenTimeExpiration:*(unsigned __int8 *)(a1 + 32)];

  [v5 finish];
}

+ (id)operationToSynthesizeEventsForEventActions:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke;
  v9[3] = &unk_1E6AFE608;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = +[SBPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

void __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke_2;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = v3;
  id v5 = v3;
  SBPPTSynthesizeEventsForEventActions(v4, v6);
}

uint64_t __61__SBPPTOperation_operationToSynthesizeEventsForEventActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToSynthesizeEventsForCommandString:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke;
  v9[3] = &unk_1E6AFE570;
  id v10 = v4;
  id v6 = v4;
  id v7 = +[SBPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

void __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke_2;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = v3;
  id v5 = v3;
  SBPPTSynthesizeEventsForCommandString(v4, v6);
}

uint64_t __62__SBPPTOperation_operationToSynthesizeEventsForCommandString___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToSynthesizeEventsForEventStream:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke;
  v9[3] = &unk_1E6AFE570;
  id v10 = v4;
  id v6 = v4;
  id v7 = +[SBPPTBlockOperation operationWithName:v5 block:v9];

  return v7;
}

void __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke_2;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = v3;
  id v5 = v3;
  SBPPTSynthesizeEventsForEventStream(v4, v6);
}

uint64_t __60__SBPPTOperation_operationToSynthesizeEventsForEventStream___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)operationToSwipeUpInMiddleOfInterface
{
  id v4 = SBPPTEventActionsToSwipeUpInMiddleOfInterface();
  id v5 = [a1 operationToSynthesizeEventsForEventActions:v4];

  id v6 = NSStringFromSelector(a2);
  [v5 setName:v6];

  return v5;
}

+ (id)operationToSwipeDownInMiddleOfInterface
{
  id v4 = SBPPTEventActionsToSwipeDownInMiddleOfInterface();
  id v5 = [a1 operationToSynthesizeEventsForEventActions:v4];

  id v6 = NSStringFromSelector(a2);
  [v5 setName:v6];

  return v5;
}

+ (id)operationToSwipeLeftInMiddleOfInterface
{
  id v4 = SBPPTEventActionsToSwipeLeftInMiddleOfInterface();
  id v5 = [a1 operationToSynthesizeEventsForEventActions:v4];

  id v6 = NSStringFromSelector(a2);
  [v5 setName:v6];

  return v5;
}

+ (id)operationToSwipeRightInMiddleOfInterface
{
  id v4 = SBPPTEventActionsToSwipeRightInMiddleOfInterface();
  id v5 = [a1 operationToSynthesizeEventsForEventActions:v4];

  id v6 = NSStringFromSelector(a2);
  [v5 setName:v6];

  return v5;
}

+ (id)operationToStartTest:(id)a3
{
  id v4 = a3;
  id v5 = +[SBPPTBlockOperation operationWithBlock:&__block_literal_global_129];
  id v6 = NSString;
  id v7 = NSStringFromSelector(a2);
  BOOL v8 = [v6 stringWithFormat:@"%@%@", v7, v4];
  [v5 setOperationName:v8];

  id v9 = (id)[v5 markStartedTest:v4];
  return v5;
}

uint64_t __39__SBPPTOperation_operationToStartTest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finish];
}

+ (id)operationToFinishTest:(id)a3
{
  id v4 = a3;
  id v5 = +[SBPPTBlockOperation operationWithBlock:&__block_literal_global_134];
  id v6 = NSString;
  id v7 = NSStringFromSelector(a2);
  BOOL v8 = [v6 stringWithFormat:@"%@%@", v7, v4];
  [v5 setOperationName:v8];

  id v9 = (id)[v5 markFinishedTest:v4];
  return v5;
}

uint64_t __40__SBPPTOperation_operationToFinishTest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finish];
}

- (SBPPTOperation)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBPPTOperation;
  uint64_t v2 = [(SBPPTOperation *)&v9 init];
  if (v2)
  {
    id v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = [v3 stringWithFormat:@"<%@: %p>", v5, v2];
    operationName = v2->_operationName;
    v2->_operationName = (NSString *)v6;
  }
  return v2;
}

+ (id)_mainDisplayWindowScene
{
  uint64_t v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 connectedWindowScenes];
  id v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_140);

  return v4;
}

uint64_t __41__SBPPTOperation__mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationName, 0);
  objc_storeStrong(&self->_startSubTestBlock, 0);
  objc_storeStrong(&self->_finishSubTestBlock, 0);
  objc_storeStrong(&self->_startTestBlock, 0);
  objc_storeStrong(&self->_finishTestBlock, 0);
}

+ (id)operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName:(id)a3
{
  id v4 = a3;
  id v5 = +[SBIconController sharedInstance];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  BOOL v13 = __105__SBPPTOperation_FocusModePPTSupport__operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName___block_invoke;
  int v14 = &unk_1E6AFE548;
  id v15 = v4;
  id v16 = v5;
  id v6 = v5;
  id v7 = v4;
  BOOL v8 = +[SBPPTBlockOperation operationWithBlock:&v11];
  objc_super v9 = NSStringFromSelector(a2);
  objc_msgSend(v8, "setName:", v9, v11, v12, v13, v14);

  return v8;
}

void __105__SBPPTOperation_FocusModePPTSupport__operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  id v4 = (id)[v6 markStartSubTest:@"UpdateHomeScreenPagesForActiveFocusMode" forTestName:v3];
  [*(id *)(a1 + 40) updateRootFolderWithCurrentDoNotDisturbState];
  id v5 = (id)[v6 markFinishedSubTest:@"UpdateHomeScreenPagesForActiveFocusMode" forTestName:*(void *)(a1 + 32)];
  [v6 finish];
}

+ (id)operationToPresentPageManagementForTestWithName:(id)a3
{
  id v4 = a3;
  id v5 = +[SBIconController sharedInstance];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke;
  id v15 = &unk_1E6AFE548;
  id v16 = v5;
  id v17 = v4;
  id v6 = v4;
  id v7 = v5;
  BOOL v8 = +[SBPPTBlockOperation operationWithBlock:&v12];
  objc_super v9 = NSStringFromSelector(a2);
  objc_msgSend(v8, "setName:", v9, v12, v13, v14, v15);

  id v10 = (id)[v8 markStartSubTest:@"PresentPageManagement" forTestName:v6];
  return v8;
}

void __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _presentPageManagement:v6];
}

uint64_t __92__SBPPTOperation_PageManagementPPTSupport__operationToPresentPageManagementForTestWithName___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) markFinishedSubTest:@"PresentPageManagement" forTestName:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  return [v3 finish];
}

+ (id)operationToDismissPageManagementForTestWithName:(id)a3
{
  id v4 = a3;
  id v5 = +[SBIconController sharedInstance];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke;
  id v15 = &unk_1E6AFE548;
  id v16 = v5;
  id v17 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = +[SBPPTBlockOperation operationWithBlock:&v12];
  objc_super v9 = NSStringFromSelector(a2);
  objc_msgSend(v8, "setName:", v9, v12, v13, v14, v15);

  id v10 = (id)[v8 markStartSubTest:@"DismissPageManagement" forTestName:v6];
  return v8;
}

void __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _dismissPageManagementIfPresented:v6];
}

uint64_t __92__SBPPTOperation_PageManagementPPTSupport__operationToDismissPageManagementForTestWithName___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) markFinishedSubTest:@"DismissPageManagement" forTestName:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  return [v3 finish];
}

+ (id)presentAppLibrary:(BOOL)a3 forTestWithName:(id)a4
{
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke;
  v13[3] = &__block_descriptor_41_e29_v16__0__SBPPTBlockOperation_8l;
  void v13[4] = a1;
  BOOL v14 = a3;
  id v8 = +[SBPPTBlockOperation operationWithBlock:v13];
  objc_super v9 = NSStringFromSelector(a2);
  [v8 setOperationName:v9];

  [v8 setTimeoutInterval:30.0];
  id v10 = (id)[v8 markStartSubTest:@"AppLibraryPresent" forTestName:v7];
  id v11 = (id)[v8 markFinishedSubTest:@"AppLibraryPresent" forTestName:v7];

  return v8;
}

void __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBIconController sharedInstance];
  id v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_2;
  v9[3] = &unk_1E6AFC6D0;
  id v6 = v3;
  id v10 = v6;
  if ([v5 _isLibraryPresentationAllowedWithCompletion:v9])
  {
    if ([v4 isModalAppLibrarySupported])
    {
      id v7 = [*(id *)(a1 + 32) _mainDisplayWindowScene];
      id v8 = [v7 modalLibraryController];

      [v8 presentLibraryAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
    }
    else
    {
      [v4 presentLibraryFromOverlayControllerAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
    }
  }
}

void __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [a2 description];
    [v2 cancelAndFailTestWithReason:v3];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_3;
    v4[3] = &unk_1E6AF4AC0;
    id v5 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v4, 1.0);
  }
}

uint64_t __73__SBPPTOperation_SBAppLibrarySupport__presentAppLibrary_forTestWithName___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)dismissAppLibraryPad:(BOOL)a3 forTestWithName:(id)a4
{
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke;
  v13[3] = &__block_descriptor_41_e29_v16__0__SBPPTBlockOperation_8l;
  void v13[4] = a1;
  BOOL v14 = a3;
  id v8 = +[SBPPTBlockOperation operationWithBlock:v13];
  objc_super v9 = NSStringFromSelector(a2);
  [v8 setOperationName:v9];

  [v8 setTimeoutInterval:30.0];
  id v10 = (id)[v8 markStartSubTest:@"AppLibraryPadDismiss" forTestName:v7];
  id v11 = (id)[v8 markFinishedSubTest:@"AppLibraryPadDismiss" forTestName:v7];

  return v8;
}

void __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBIconController sharedInstance];
  id v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_2;
  v9[3] = &unk_1E6AFC6D0;
  id v6 = v3;
  id v10 = v6;
  if ([v5 _isLibraryDismissalAllowedWithCompletion:v9])
  {
    if ([v4 isModalAppLibrarySupported])
    {
      id v7 = [*(id *)(a1 + 32) _mainDisplayWindowScene];
      id v8 = [v7 modalLibraryController];

      [v8 dismissLibraryAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
    }
    else
    {
      [v4 dismissLibraryFromOverlayControllerAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
    }
  }
}

void __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [a2 description];
    [v2 cancelAndFailTestWithReason:v3];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_3;
    v4[3] = &unk_1E6AF4AC0;
    id v5 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v4, 1.0);
  }
}

uint64_t __76__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryPad_forTestWithName___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (BOOL)_isLibraryPresentationAllowedWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = +[SBIconController sharedInstance];
  if (([v4 isAppLibraryAllowed] & 1) == 0)
  {
    if (v3)
    {
LABEL_6:
      id v7 = SBHLibraryPresentationErrorForCode();
      v3[2](v3, v7);
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  id v5 = +[SBLockScreenManager sharedInstance];
  int v6 = [v5 isUILocked];

  if (v6)
  {
    if (v3) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  id v10 = [(id)SBApp windowSceneManager];
  id v11 = [v10 activeDisplayWindowScene];
  uint64_t v12 = [v11 layoutStateProvider];
  uint64_t v13 = [v12 layoutState];
  if ([v13 unlockedEnvironmentMode] == 1)
  {
  }
  else
  {
    char v14 = [v4 isModalAppLibrarySupported];

    if ((v14 & 1) == 0)
    {
      if (!v3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (v3) {
    v3[2](v3, 0);
  }
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

+ (BOOL)_isLibraryDismissalAllowedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = +[SBIconController sharedInstance];
  int v6 = [a1 _mainDisplayWindowScene];
  if (([v5 isAppLibraryAllowed] & 1) == 0)
  {
    if (!v4) {
      goto LABEL_18;
    }
LABEL_17:
    char v14 = SBHLibraryPresentationErrorForCode();
    v4[2](v4, v14);

    goto LABEL_18;
  }
  if ([v5 isModalAppLibrarySupported])
  {
    id v7 = [v6 modalLibraryController];
    char v8 = [v7 isPresentingLibrary];
  }
  else
  {
    id v7 = [v5 iconManager];
    char v8 = [v7 isMainDisplayLibraryViewVisible];
  }
  char v9 = v8;

  if ((v9 & 1) == 0)
  {
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v10 = [v6 layoutStateProvider];
  id v11 = [v10 layoutState];
  if ([v11 unlockedEnvironmentMode] != 1)
  {
    char v12 = [v5 isModalAppLibrarySupported];

    if (v12) {
      goto LABEL_13;
    }
    if (v4) {
      goto LABEL_17;
    }
LABEL_18:
    BOOL v13 = 0;
    goto LABEL_19;
  }

LABEL_13:
  if (v4) {
    v4[2](v4, 0);
  }
  BOOL v13 = 1;
LABEL_19:

  return v13;
}

+ (id)resetAndPrepareforNextTest
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v3 = +[SBPPTBlockOperation operationWithBlock:v6];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  [v3 setTimeoutInterval:30.0];
  return v3;
}

void __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBIconController sharedInstance];
  id v5 = [v4 iconManager];
  int v6 = [v5 rootFolderController];

  id v7 = [*(id *)(a1 + 32) _libraryViewController];
  [v7 dismissSearch];
  [v7 _dismissExpandedPods:0 completion:0];
  char v8 = [v7 podFolderViewController];
  char v9 = [v8 contentScrollView];

  [v9 _scrollToTopIfPossible:0];
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v6 firstIconPageIndex];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_2;
  v13[3] = &unk_1E6AF5350;
  id v14 = v3;
  id v12 = v3;
  [v10 _dismissOverlaysAndResetHomeScreenToPage:v11 animated:0 operation:0 completion:v13];
}

void __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_2(uint64_t a1, char a2)
{
  id v4 = +[SBIconController sharedInstance];
  [v4 resetCategories];

  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_3;
    v6[3] = &unk_1E6AF4AC0;
    id v7 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v6, 1.0);
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    [v5 cancelAndFailTestWithReason:@"unable to reset home screen"];
  }
}

uint64_t __65__SBPPTOperation_SBAppLibrarySupport__resetAndPrepareforNextTest__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)presentAppLibrarySearchByTappingSearchField
{
  id v4 = [a1 _libraryViewController];
  id v5 = [v4 containerViewController];
  int v6 = [v5 searchBar];

  id v7 = +[SBApplicationTestingManager sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke;
  v13[3] = &unk_1E6AFE520;
  id v14 = v7;
  id v15 = v6;
  id v16 = a1;
  id v8 = v6;
  id v9 = v7;
  id v10 = +[SBPPTBlockOperation operationWithBlock:v13];
  uint64_t v11 = NSStringFromSelector(a2);
  [v10 setOperationName:v11];

  return v10;
}

void __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4FA65E0];
  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_2;
  v13[3] = &unk_1E6AF7EE0;
  id v14 = v3;
  id v7 = v3;
  [v4 installNotificationObserverForNotificationName:v5 notificationCenter:v6 forOneNotification:1 usingBlock:v13];

  id v8 = [*(id *)(a1 + 40) searchTextField];
  [v8 center];
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(*(id *)(a1 + 48), "_appLibrarySupport_performTapAtPoint:fromView:withCompletion:", *(void *)(a1 + 40), &__block_literal_global_90_2, v10, v12);
}

void __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_3;
  v1[3] = &unk_1E6AF4AC0;
  id v2 = *(id *)(a1 + 32);
  SBPPTPerformAfterCommitWithDelay(v1, 1.0);
}

uint64_t __82__SBPPTOperation_SBAppLibrarySupport__presentAppLibrarySearchByTappingSearchField__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)resetAppLibraryToTop
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v3 = +[SBPPTBlockOperation operationWithBlock:v6];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  return v3;
}

void __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _libraryViewController];
  uint64_t v5 = [v4 podFolderViewController];
  int v6 = [v5 contentScrollView];

  [v6 _scrollToTopIfPossible:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke_2;
  v8[3] = &unk_1E6AF4AC0;
  id v9 = v3;
  id v7 = v3;
  SBPPTPerformAfterCommitWithDelay(v8, 0.0);
}

uint64_t __59__SBPPTOperation_SBAppLibrarySupport__resetAppLibraryToTop__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)dismissAppLibrarySearch
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v3 = +[SBPPTBlockOperation operationWithBlock:v6];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  [v3 setTimeoutInterval:30.0];
  return v3;
}

void __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBApplicationTestingManager sharedInstance];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  int v6 = [v4 currentTestName];
  uint64_t v7 = *MEMORY[0x1E4FA65E8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_2;
  v19[3] = &unk_1E6AF7EE0;
  id v8 = v6;
  id v20 = v8;
  [v4 installNotificationObserverForNotificationName:v7 notificationCenter:v5 forOneNotification:1 usingBlock:v19];
  uint64_t v9 = *MEMORY[0x1E4FA65D8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_3;
  v16[3] = &unk_1E6B02DA8;
  id v17 = v8;
  id v18 = v3;
  id v10 = v3;
  id v11 = v8;
  [v4 installNotificationObserverForNotificationName:v9 notificationCenter:v5 forOneNotification:1 usingBlock:v16];
  double v12 = [*(id *)(a1 + 32) _libraryViewController];
  BOOL v13 = [v12 containerViewController];
  id v14 = [v13 searchBar];

  id v15 = [v14 cancelButton];
  [v15 sendActionsForControlEvents:64];
}

uint64_t __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_2(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"DeweyPullToLibrarySearchDismiss" forTest:*(void *)(a1 + 32)];
}

void __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_3(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"DeweyPullToLibrarySearchDismiss" forTest:*(void *)(a1 + 32)];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_4;
  v2[3] = &unk_1E6AF4AC0;
  id v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);
}

uint64_t __62__SBPPTOperation_SBAppLibrarySupport__dismissAppLibrarySearch__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)pullToAppLibrarySearch
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v3 = +[SBPPTBlockOperation operationWithBlock:v6];
  id v4 = NSStringFromSelector(a2);
  [v3 setOperationName:v4];

  return v3;
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBApplicationTestingManager sharedInstance];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_defaultPPTNotificationCenter");
  int v6 = [v4 currentTestName];
  uint64_t v7 = [*(id *)(a1 + 32) _libraryViewController];
  id v8 = [v7 containerViewController];
  uint64_t v9 = [v8 searchBar];

  id v10 = [v7 contentScrollView];
  id v11 = [v10 window];

  [v11 center];
  double v13 = v12;
  double v15 = v14;
  [v11 center];
  double v17 = v16;
  double v19 = v18;
  [v11 size];
  double v21 = v19 + v20 * 0.75;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_2;
  v34[3] = &unk_1E6AF5290;
  id v22 = v3;
  id v35 = v22;
  id v36 = v9;
  id v23 = v9;
  +[SBPPTOperation _appLibrarySupport_performDragFromPoint:andDragTo:duration:fromView:withCompletion:](SBPPTOperation, "_appLibrarySupport_performDragFromPoint:andDragTo:duration:fromView:withCompletion:", 0, v34, v13, v15, v17, v21, 1.0);
  uint64_t v24 = *MEMORY[0x1E4FA65F0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_4;
  v32[3] = &unk_1E6AF7EE0;
  id v25 = v6;
  id v33 = v25;
  [v4 installNotificationObserverForNotificationName:v24 notificationCenter:v5 forOneNotification:1 usingBlock:v32];
  uint64_t v26 = *MEMORY[0x1E4FA65E0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_5;
  v29[3] = &unk_1E6B02DA8;
  id v30 = v25;
  id v31 = v22;
  id v27 = v22;
  id v28 = v25;
  [v4 installNotificationObserverForNotificationName:v26 notificationCenter:v5 forOneNotification:1 usingBlock:v29];
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_3;
  v3[3] = &unk_1E6AF5290;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    dispatch_time_t v2 = [*(id *)(a1 + 40) searchTextField];
    char v3 = [v2 isFirstResponder];

    if ((v3 & 1) == 0)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 cancelAndFailTestWithReason:@"Search bar still active; test failed."];
    }
  }
}

uint64_t __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_4(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"DeweyPullToLibrarySearchPresent" forTest:*(void *)(a1 + 32)];
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_6;
  v2[3] = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 0.75);
}

void __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_6(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"DeweyPullToLibrarySearchPresent" forTest:*(void *)(a1 + 32)];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_7;
  v2[3] = &unk_1E6AF4AC0;
  id v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);
}

uint64_t __61__SBPPTOperation_SBAppLibrarySupport__pullToAppLibrarySearch__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)presentAppLibraryForTestWithName:(id)a3
{
  return (id)[a1 presentAppLibrary:1 forTestWithName:a3];
}

+ (id)presentAppLibraryPhone
{
  id v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v4 = +[SBPPTBlockOperation operationWithName:v3 block:v6];

  return v4;
}

void __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_2;
  v6[3] = &unk_1E6AF5350;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion:", v6);
}

void __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_3;
    v3[3] = &unk_1E6AF4AC0;
    id v4 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v3, 0.0);
  }
  else
  {
    dispatch_time_t v2 = *(void **)(a1 + 32);
    [v2 cancelAndFailTestWithReason:@"Unable to pan HomeScreen to App Library overlay"];
  }
}

uint64_t __61__SBPPTOperation_SBAppLibrarySupport__presentAppLibraryPhone__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)dismissOverlaysAndResetHomeScreenToPage:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = NSStringFromSelector(a2);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__SBPPTOperation_SBAppLibrarySupport__dismissOverlaysAndResetHomeScreenToPage_animated_completion___block_invoke;
  v14[3] = &unk_1E6B0E450;
  id v16 = a1;
  unint64_t v17 = a3;
  BOOL v18 = a4;
  id v15 = v9;
  id v11 = v9;
  double v12 = +[SBPPTBlockOperation operationWithName:v10 block:v14];

  return v12;
}

uint64_t __99__SBPPTOperation_SBAppLibrarySupport__dismissOverlaysAndResetHomeScreenToPage_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _dismissOverlaysAndResetHomeScreenToPage:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56) operation:a2 completion:*(void *)(a1 + 32)];
}

+ (void)_dismissOverlaysAndResetHomeScreenToPage:(unint64_t)a3 animated:(BOOL)a4 operation:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = +[SBIconController sharedInstance];
  double v12 = [v11 iconManager];
  double v13 = [v12 rootFolderController];
  double v14 = [v11 homeScreenOverlayController];
  id v31 = +[SBApplicationTestingManager sharedInstance];
  long long v32 = [v31 currentTestName];
  SBDismissSpotlight();
  id v29 = a1;
  id v30 = v12;
  unint64_t v15 = a3;
  if ([v11 isModalAppLibrarySupported])
  {
    id v16 = [a1 _mainDisplayWindowScene];
    unint64_t v17 = [v16 modalLibraryController];

    BOOL v18 = [v17 libraryViewController];
    int v19 = [v17 isPresentingLibrary];
  }
  else
  {
    BOOL v18 = [v11 overlayLibraryViewController];
    int v19 = [v12 isMainDisplayLibraryViewVisible];
    unint64_t v17 = 0;
  }
  double v20 = v9;
  if ([v18 isPresentingSearch]) {
    [v18 dismissSearch];
  }
  [v18 _dismissExpandedPods:0 completion:0];
  [v31 setupKeyboardAnimationSubTestsForTestName:v32];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke;
  v37[3] = &unk_1E6B0A188;
  id v21 = v13;
  id v38 = v21;
  unint64_t v42 = v15;
  id v22 = v14;
  id v39 = v22;
  id v23 = v10;
  id v41 = v23;
  id v24 = v20;
  id v40 = v24;
  uint64_t v25 = MEMORY[0x1D948C7A0](v37);
  uint64_t v26 = (void *)v25;
  if (v19)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_4;
    v33[3] = &unk_1E6B0E478;
    id v35 = v23;
    id v34 = v24;
    id v36 = v26;
    id v27 = v30;
    if ([v29 _isLibraryDismissalAllowedWithCompletion:v33])
    {
      if (v17) {
        id v28 = v17;
      }
      else {
        id v28 = v11;
      }
      [v28 dismissLibraryAnimated:0 completion:0];
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v25 + 16))(v25);
    id v27 = v30;
  }
}

void __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_2;
  v6[3] = &unk_1E6B0A188;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = v4;
  uint64_t v11 = v5;
  id v8 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  [v4 setCurrentPageIndex:v3 animated:0 completion:v6];
}

void __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = (void *)*MEMORY[0x1E4F43630];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_3;
  v5[3] = &unk_1E6B0A188;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = v3;
  uint64_t v10 = v4;
  id v7 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  [v2 _performBlockAfterCATransactionCommits:v5];
}

uint64_t __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) currentPageIndex] == *(void *)(a1 + 64)
    && ([*(id *)(a1 + 40) isPresented] & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
    id v6 = *(void **)(a1 + 48);
    return [v6 finish];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    }
    id v3 = *(void **)(a1 + 48);
    return [v3 cancelAndFailTestWithReason:@"Unable to scroll to page!"];
  }
}

void __110__SBPPTOperation_SBAppLibrarySupport___dismissOverlaysAndResetHomeScreenToPage_animated_operation_completion___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[5];
  id v7 = v3;
  if (v3)
  {
    if (v4)
    {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
      id v3 = v7;
    }
    uint64_t v5 = (void *)a1[4];
    id v6 = [NSString stringWithFormat:@"Unable to dismiss home screen overlay controller: %@", v3];
    [v5 cancelAndFailTestWithReason:v6];
  }
  else
  {
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __62__SBPPTOperation_SBAppLibrarySupport___mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

+ (id)_libraryViewController
{
  id v3 = +[SBIconController sharedInstance];
  if ([v3 isModalAppLibrarySupported])
  {
    uint64_t v4 = [a1 _mainDisplayWindowScene];
    uint64_t v5 = [v4 modalLibraryController];
    id v6 = [v5 libraryViewController];
  }
  else
  {
    id v6 = [v3 overlayLibraryViewController];
  }

  return v6;
}

+ (BOOL)isLibraryPresented
{
  id v3 = +[SBIconController sharedInstance];
  if ([v3 isModalAppLibrarySupported])
  {
    uint64_t v4 = [a1 _mainDisplayWindowScene];
    uint64_t v5 = [v4 modalLibraryController];

    char v6 = [v5 isPresentingLibrary];
  }
  else
  {
    uint64_t v5 = [v3 iconManager];
    char v6 = [v5 isMainDisplayLibraryViewVisible];
  }
  BOOL v7 = v6;

  return v7;
}

+ (id)dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v6 = +[SBIconController sharedInstance];
  BOOL v7 = [v6 iconManager];
  id v8 = [v7 rootFolderController];
  id v9 = objc_msgSend(a1, "dismissOverlaysAndResetHomeScreenToPage:animated:completion:", objc_msgSend(v8, "lastIconPageIndex"), v3, 0);
  [v9 setTimeoutInterval:30.0];
  uint64_t v10 = NSStringFromSelector(a2);
  [v9 setOperationName:v10];

  return v9;
}

+ (id)dismissOverlaysAndResetHomeScreenToFirstIconPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v6 = +[SBIconController sharedInstance];
  BOOL v7 = [v6 iconManager];
  id v8 = [v7 rootFolderController];
  id v9 = objc_msgSend(a1, "dismissOverlaysAndResetHomeScreenToPage:animated:completion:", objc_msgSend(v8, "firstIconPageIndex"), v3, 0);
  [v9 setTimeoutInterval:30.0];
  uint64_t v10 = NSStringFromSelector(a2);
  [v9 setOperationName:v10];

  return v9;
}

+ (id)appLibraryExpandFirstPod
{
  BOOL v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  uint64_t v4 = +[SBPPTBlockOperation operationWithName:v3 block:v6];

  [v4 setTimeoutInterval:30.0];
  return v4;
}

void __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _libraryViewController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_2;
  v6[3] = &unk_1E6AF5350;
  id v7 = v3;
  id v5 = v3;
  [v4 _expandPodAtIndex:0 animated:1 completion:v6];
}

void __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_3;
    v3[3] = &unk_1E6AF4AC0;
    id v4 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v3, 1.0);
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 cancelAndFailTestWithReason:@"Unable to expand pod"];
  }
}

uint64_t __63__SBPPTOperation_SBAppLibrarySupport__appLibraryExpandFirstPod__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)appLibraryDismissExpandedPod
{
  id v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  id v4 = +[SBPPTBlockOperation operationWithName:v3 block:v6];

  [v4 setTimeoutInterval:30.0];
  return v4;
}

void __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _libraryViewController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_2;
  v6[3] = &unk_1E6AF5350;
  id v7 = v3;
  id v5 = v3;
  [v4 _dismissExpandedPods:1 completion:v6];
}

void __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_3;
    v3[3] = &unk_1E6AF4AC0;
    id v4 = *(id *)(a1 + 32);
    SBPPTPerformAfterCommitWithDelay(v3, 1.0);
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 cancelAndFailTestWithReason:@"Unable to dismiss expanded pods."];
  }
}

uint64_t __67__SBPPTOperation_SBAppLibrarySupport__appLibraryDismissExpandedPod__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)performTapAtPointWithBlock:(id)a3
{
  id v5 = a3;
  char v6 = NSStringFromSelector(a2);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke;
  double v13 = &unk_1E6B0E4A0;
  id v14 = v5;
  id v15 = a1;
  id v7 = v5;
  id v8 = +[SBPPTBlockOperation operationWithName:v6 block:&v10];

  objc_msgSend(v8, "setTimeoutInterval:", 30.0, v10, v11, v12, v13);
  return v8;
}

void __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = 0;
  double v5 = (*(double (**)(void))(v4 + 16))();
  double v7 = v6;
  id v8 = v13;
  id v9 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke_2;
  v11[3] = &unk_1E6AF4AC0;
  id v12 = v3;
  id v10 = v3;
  objc_msgSend(v9, "_appLibrarySupport_performTapAtPoint:fromView:withCompletion:", v8, v11, v5, v7);
}

uint64_t __66__SBPPTOperation_SBAppLibrarySupport__performTapAtPointWithBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)dismissAppLibraryOverlay
{
  id v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v16__0__SBPPTBlockOperation_8l;
  void v6[4] = a1;
  uint64_t v4 = +[SBPPTBlockOperation operationWithName:v3 block:v6];

  [v4 setTimeoutInterval:30.0];
  return v4;
}

void __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isLibraryPresented])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_2;
    v5[3] = &unk_1E6AF4A70;
    double v7 = v4;
    id v6 = v3;
    objc_msgSend(v4, "_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v5, 0.25);
  }
  else
  {
    [v3 cancelAndFailTestWithReason:@"Library isn't visible; cannot dismiss!"];
  }
}

void __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_3;
  v3[3] = &unk_1E6AF4A70;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  SBPPTPerformAfterCommitWithDelay(v3, 0.0);
}

uint64_t __63__SBPPTOperation_SBAppLibrarySupport__dismissAppLibraryOverlay__block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) isLibraryPresented];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 cancelAndFailTestWithReason:@"Library was not dismissed!"];
  }
  else
  {
    return [v3 finish];
  }
}

+ (id)configureAppLibraryForAllAppsInOnePod
{
  id v3 = +[SBIconController sharedInstance];
  long long v4 = NSStringFromSelector(a2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke;
  v8[3] = &unk_1E6AFE570;
  id v9 = v3;
  id v5 = v3;
  id v6 = +[SBPPTBlockOperation operationWithName:v4 block:v8];

  [v6 setTimeoutInterval:30.0];
  return v6;
}

void __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_2;
  v5[3] = &unk_1E6AF5290;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  SBPPTPerformAfterCommitWithDelay(v5, 0.0);
}

void __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureDeweyOneCategoryWithAllApps];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_3;
  v2[3] = &unk_1E6AF4AC0;
  id v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);
}

uint64_t __76__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForAllAppsInOnePod__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (id)configureAppLibraryForEachAppHavingOwnPod
{
  id v3 = +[SBIconController sharedInstance];
  id v4 = NSStringFromSelector(a2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke;
  v8[3] = &unk_1E6AFE570;
  id v9 = v3;
  id v5 = v3;
  id v6 = +[SBPPTBlockOperation operationWithName:v4 block:v8];

  [v6 setTimeoutInterval:30.0];
  return v6;
}

void __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_2;
  v5[3] = &unk_1E6AF5290;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  SBPPTPerformAfterCommitWithDelay(v5, 0.0);
}

void __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureDeweyEachAppHasItsOwnCategory:30];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_3;
  v2[3] = &unk_1E6AF4AC0;
  id v3 = *(id *)(a1 + 40);
  SBPPTPerformAfterCommitWithDelay(v2, 1.0);
}

uint64_t __80__SBPPTOperation_SBAppLibrarySupport__configureAppLibraryForEachAppHavingOwnPod__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

+ (void)_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:(double)a3 completion:(id)a4
{
  id v6 = (void *)*MEMORY[0x1E4F43630];
  id v7 = a4;
  if ([v6 userInterfaceLayoutDirection] == 1) {
    objc_msgSend(a1, "_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:completion:", v7, a3);
  }
  else {
    objc_msgSend(a1, "_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:completion:", v7, a3);
  }
}

+ (void)_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:(double)a3 completion:(id)a4
{
  id v6 = (void *)*MEMORY[0x1E4F43630];
  id v7 = a4;
  if ([v6 userInterfaceLayoutDirection] == 1) {
    objc_msgSend(a1, "_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:completion:", v7, a3);
  }
  else {
    objc_msgSend(a1, "_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:completion:", v7, a3);
  }
}

+ (void)_appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration:(double)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F43058];
  id v7 = a4;
  id v8 = [v6 _applicationKeyWindow];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  CGFloat MaxX = CGRectGetMaxX(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  CGFloat MidY = CGRectGetMidY(v25);
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  CGFloat MinX = CGRectGetMinX(v26);
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  CGFloat v20 = CGRectGetMidY(v27);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration_completion___block_invoke;
  v23[3] = &__block_descriptor_80_e34_v16__0___RCPEventStreamComposer__8l;
  v23[4] = a1;
  *(CGFloat *)&v23[5] = MaxX;
  *(CGFloat *)&v23[6] = MidY;
  *(CGFloat *)&v23[7] = MinX;
  *(CGFloat *)&v23[8] = v20;
  *(double *)&v23[9] = a3;
  id v21 = [MEMORY[0x1E4F94818] eventStreamWithEventActions:v23];
  id v22 = objc_opt_new();
  [MEMORY[0x1E4F94808] playEventStream:v21 options:v22 completion:v7];
}

uint64_t __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performRightToLeftPanGestureOnScreenWithDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appLibrarySupport_performPanWithComposer:startLocation:endLocation:duration:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (void)_appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration:(double)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F43058];
  id v7 = a4;
  id v8 = [v6 _applicationKeyWindow];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  CGFloat MinX = CGRectGetMinX(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  CGFloat MidY = CGRectGetMidY(v25);
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  CGFloat MaxX = CGRectGetMaxX(v26);
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  CGFloat v20 = CGRectGetMidY(v27);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration_completion___block_invoke;
  v23[3] = &__block_descriptor_80_e34_v16__0___RCPEventStreamComposer__8l;
  v23[4] = a1;
  *(CGFloat *)&v23[5] = MinX;
  *(CGFloat *)&v23[6] = MidY;
  *(CGFloat *)&v23[7] = MaxX;
  *(CGFloat *)&v23[8] = v20;
  *(double *)&v23[9] = a3;
  id v21 = [MEMORY[0x1E4F94818] eventStreamWithEventActions:v23];
  id v22 = objc_opt_new();
  [MEMORY[0x1E4F94808] playEventStream:v21 options:v22 completion:v7];
}

uint64_t __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performLeftToRightPanGestureOnScreenWithDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appLibrarySupport_performPanWithComposer:startLocation:endLocation:duration:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (void)_appLibrarySupport_performPanWithComposer:(id)a3 startLocation:(CGPoint)a4 endLocation:(CGPoint)a5 duration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double v11 = (void *)*MEMORY[0x1E4F43630];
  CGFloat v12 = (void *)MEMORY[0x1E4F42D90];
  id v13 = a3;
  CGFloat v14 = [v12 mainScreen];
  id v21 = [v11 _keyWindowForScreen:v14];

  objc_msgSend(v21, "convertPoint:toView:", 0, v10, v9);
  objc_msgSend(v21, "_convertPointToSceneReferenceSpace:");
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v21, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v21, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v13, "sendFlickWithStartPoint:endPoint:duration:", v16, v18, v19, v20, a6);
}

+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnPage:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v9 = +[SBIconController sharedInstance];
  id v7 = [v9 iconManager];
  id v8 = [v7 rootFolderController];
  objc_msgSend(a1, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", objc_msgSend(v8, "currentPageIndex"), a3, v6);
}

+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnDefaultHomeScreenIconPageWithCompletion:(id)a3
{
  id v4 = a3;
  id v10 = +[SBIconController sharedInstance];
  id v5 = [v10 iconManager];
  id v6 = [v5 rootFolderController];
  uint64_t v7 = [v6 currentPageIndex];
  id v8 = [v10 iconManager];
  id v9 = [v8 rootFolderController];
  objc_msgSend(a1, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", v7, objc_msgSend(v9, "defaultPageIndex"), v4);
}

+ (void)_appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[SBIconController sharedInstance];
  id v6 = [v5 _rootFolderController];
  uint64_t v7 = [v6 currentPageIndex];

  id v8 = [v5 _rootFolderController];
  uint64_t v9 = [v8 lastIconPageIndex];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke;
  v12[3] = &unk_1E6AFF2D8;
  id v13 = v5;
  id v14 = v4;
  id v15 = a1;
  id v10 = v4;
  id v11 = v5;
  objc_msgSend(a1, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", v7, v9, v12);
}

void __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) homeScreenOverlayController];
  int v3 = [v2 isPresented];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_2;
    v16[3] = &__block_descriptor_40_e14_v16__0___v___8l;
    void v16[4] = *(void *)(a1 + 48);
    id v6 = (void *)MEMORY[0x1D948C7A0](v16);
    id from = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_3;
    v9[3] = &unk_1E6B0E508;
    objc_copyWeak(&v13, &from);
    id v10 = *(id *)(a1 + 32);
    char v14 = 0;
    id v11 = *(id *)(a1 + 40);
    id v7 = v6;
    id v12 = v7;
    id v8 = (void *)MEMORY[0x1D948C7A0](v9);
    objc_storeWeak(&from, v8);
    (*((void (**)(id, void *))v7 + 2))(v7, v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
  }
}

void __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = (void *)*MEMORY[0x1E4F43630];
  id v6 = a2;
  uint64_t v4 = [v3 userInterfaceLayoutDirection];
  id v5 = *(void **)(a1 + 32);
  if (v4 == 1) {
    objc_msgSend(v5, "_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v6, 0.25);
  }
  else {
    objc_msgSend(v5, "_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v6, 0.25);
  }
}

void __118__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performPanGesturesOnScreenUntilOnDeweyOverlayWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v2 = [*(id *)(a1 + 32) homeScreenOverlayController];
  int v3 = [v2 isPresented];

  if (*(unsigned __int8 *)(a1 + 64) == v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    }
  }
}

+ (void)_appLibrarySupport__performPanGesturesOnScreenFromPage:(unint64_t)a3 toPage:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t))a5;
  uint64_t v9 = +[SBIconController sharedInstance];
  id v10 = [v9 iconManager];
  id v11 = [v10 rootFolderController];

  id v12 = [v9 homeScreenOverlayController];
  char v13 = [v12 isPresented];

  if ([v11 currentPageIndex] == a4)
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __112__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport__performPanGesturesOnScreenFromPage_toPage_completion___block_invoke;
    v15[3] = &unk_1E6B0E530;
    id v16 = v9;
    unint64_t v19 = a3;
    char v22 = v13;
    id v17 = v11;
    unint64_t v20 = a4;
    double v18 = v8;
    id v21 = a1;
    char v14 = (void *)MEMORY[0x1D948C7A0](v15);
    if (a3 >= a4 || [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      objc_msgSend(a1, "_appLibrarySupport_performPanGestureAwayFromUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v14, 0.25);
    }
    else {
      objc_msgSend(a1, "_appLibrarySupport_performPanGestureTowardsUserInterfaceLayoutDirectionOnScreenWithDuration:completion:", v14, 0.25);
    }
  }
}

uint64_t __112__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport__performPanGesturesOnScreenFromPage_toPage_completion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) iconManager];
  int v3 = [v2 rootFolderController];
  uint64_t v4 = [v3 currentPageIndex];

  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [*(id *)(a1 + 32) homeScreenOverlayController];
  int v7 = [v6 isPresented];
  int v8 = *(unsigned __int8 *)(a1 + 80);

  BOOL v9 = v4 != v5;
  if (v4 == v5 && v8 != v7) {
    BOOL v9 = *(unsigned char *)(a1 + 80) != 0;
  }
  if ([*(id *)(a1 + 40) currentPageIndex] == *(void *)(a1 + 64))
  {
    uint64_t result = *(void *)(a1 + 48);
    if (!result) {
      return result;
    }
    id v12 = *(uint64_t (**)(void))(result + 16);
LABEL_15:
    return v12();
  }
  if (!v9)
  {
    uint64_t result = *(void *)(a1 + 48);
    if (!result) {
      return result;
    }
    id v12 = *(uint64_t (**)(void))(result + 16);
    goto LABEL_15;
  }
  char v13 = *(void **)(a1 + 72);
  return objc_msgSend(v13, "_appLibrarySupport__performPanGesturesOnScreenFromPage:toPage:completion:", v4);
}

+ (void)_appLibrarySupport_performTapAtPoint:(CGPoint)a3 fromView:(id)a4 withCompletion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  int v8 = (void *)*MEMORY[0x1E4F43630];
  BOOL v9 = (void *)MEMORY[0x1E4F42D90];
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 mainScreen];
  char v13 = [v8 _keyWindowForScreen:v12];

  char v14 = [MEMORY[0x1E4F42D90] mainScreen];
  id v15 = [v14 coordinateSpace];
  objc_msgSend(v15, "convertPoint:fromCoordinateSpace:", v11, x, y);
  double v17 = v16;
  double v19 = v18;

  objc_msgSend(v13, "convertPoint:fromView:", 0, v17, v19);
  objc_msgSend(v13, "_convertPointToSceneReferenceSpace:");
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performTapAtPoint_fromView_withCompletion___block_invoke;
  v24[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v24[4] = v20;
  v24[5] = v21;
  char v22 = [MEMORY[0x1E4F94818] eventStreamWithEventActions:v24];
  id v23 = objc_opt_new();
  [MEMORY[0x1E4F94808] playEventStream:v22 options:v23 completion:v10];
}

uint64_t __100__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performTapAtPoint_fromView_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tap:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (void)_appLibrarySupport_performDragFromPoint:(CGPoint)a3 andDragTo:(CGPoint)a4 duration:(double)a5 fromView:(id)a6 withCompletion:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  char v13 = (void *)*MEMORY[0x1E4F43630];
  char v14 = (void *)MEMORY[0x1E4F42D90];
  id v15 = a7;
  id v16 = a6;
  double v17 = [v14 mainScreen];
  double v18 = [v13 _keyWindowForScreen:v17];

  double v19 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v20 = [v19 coordinateSpace];
  objc_msgSend(v20, "convertPoint:fromCoordinateSpace:", v16, v12, v11);
  double v22 = v21;
  double v24 = v23;

  CGRect v25 = [MEMORY[0x1E4F42D90] mainScreen];
  CGRect v26 = [v25 coordinateSpace];
  objc_msgSend(v26, "convertPoint:fromCoordinateSpace:", v16, x, y);
  double v28 = v27;
  double v30 = v29;

  objc_msgSend(v18, "convertPoint:fromView:", 0, v22, v24);
  objc_msgSend(v18, "_convertPointToSceneReferenceSpace:");
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  objc_msgSend(v18, "convertPoint:fromView:", 0, v28, v30);
  objc_msgSend(v18, "_convertPointToSceneReferenceSpace:");
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __122__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performDragFromPoint_andDragTo_duration_fromView_withCompletion___block_invoke;
  v39[3] = &__block_descriptor_72_e34_v16__0___RCPEventStreamComposer__8l;
  v39[4] = v32;
  v39[5] = v34;
  v39[6] = v35;
  v39[7] = v36;
  *(double *)&v39[8] = a5;
  v37 = [MEMORY[0x1E4F94818] eventStreamWithEventActions:v39];
  id v38 = objc_opt_new();
  [MEMORY[0x1E4F94808] playEventStream:v37 options:v38 completion:v15];
}

uint64_t __122__SBPPTOperation_SBAppLibrarySupport___appLibrarySupport_performDragFromPoint_andDragTo_duration_fromView_withCompletion___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

@end