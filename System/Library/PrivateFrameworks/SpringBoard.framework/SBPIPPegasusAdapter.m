@interface SBPIPPegasusAdapter
+ (BOOL)_isAutoPictureInPictureSupported;
+ (BOOL)isSupported;
- (BOOL)_layoutStateContainsSceneForSourceSceneSessionIdentifier:(id)a3 bundleIdentifier:(id)a4 windowScene:(id)a5;
- (BOOL)_presentableIsDodgeableAndStatusBarSuppressing:(id)a3;
- (BOOL)isPresentingPictureInPictureForPIPController:(id)a3 applicationBundleIdentifier:(id)a4;
- (BOOL)isStartingStoppingOrCancellingPictureInPictureForPIPController:(id)a3;
- (BOOL)isStoppingOrCancellingPictureForPIPController:(id)a3 applicationWithBundleIdentifier:(id)a4 scenePersistenceIdentifier:(id)a5;
- (BOOL)pictureInPictureController:(id)a3 shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:(id)a4;
- (BOOL)pictureInPictureController:(id)a3 shouldDenyNewConnection:(id)a4;
- (BOOL)pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:(id)a3;
- (BOOL)pipController:(id)a3 willBeginPIPInterruptionForAssertion:(id)a4;
- (BOOL)preventStashAssertionsForPIPController:(id)a3;
- (BOOL)shouldStartPictureInPictureForPIPController:(id)a3 applicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5;
- (SBPIPPegasusAdapter)init;
- (id)pipController:(id)a3 morphAnimatorDataSourceForMorphAnimatorController:(id)a4;
- (int64_t)_reasonForAssertion:(id)a3;
- (int64_t)contentTypeForPIPController:(id)a3;
- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3;
- (void)_activateSceneWithPersistenceIdentifier:(id)a3 pictureInPictureViewController:(id)a4 completion:(id)a5;
- (void)_actuallyUpdateBannerInsetsForExpanseBanner:(id)a3 isSizeChanging:(BOOL)a4 isFullScreen:(BOOL)a5;
- (void)_bannerPresentableWillAnimateTransition:(id)a3 isPresentation:(BOOL)a4 isDismissal:(BOOL)a5 isFullScreen:(BOOL)a6 withTransitionCoordinator:(id)a7;
- (void)_enumerateContainerViewControllersForApplication:(id)a3 scenePersistenceIdentifier:(id)a4 usingBlock:(id)a5;
- (void)_postEnsuredInSwitcher_pictureInPictureController:(id)a3 didRequestStopForPictureInPictureViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6;
- (void)_updateAppStatusBarSettingsAssertion;
- (void)_updateBannerInsetsForExpanseBanner:(id)a3 isSizeChanging:(BOOL)a4 isFullScreen:(BOOL)a5;
- (void)_updateHasIdleTimerBehaviors;
- (void)_updateHideFromClonedDisplaysAssertion;
- (void)bannerManager:(id)a3 containerWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)bannerManager:(id)a3 presentable:(id)a4 willTransitionToSize:(CGSize)a5 withTransitionCoordinator:(id)a6;
- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)containerViewControllerStartReducingResourcesUsage:(id)a3;
- (void)containerViewControllerStopReducingResourcesUsage:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pictureInPictureController:(id)a3 didCreatePictureInPictureViewController:(id)a4;
- (void)pictureInPictureController:(id)a3 didHidePictureInPictureViewController:(id)a4;
- (void)pictureInPictureController:(id)a3 didRequestStopForPictureInPictureViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6;
- (void)pictureInPictureController:(id)a3 requestActivationOfSceneWithPersistenceIdentier:(id)a4 pictureInPictureViewController:(id)a5 completion:(id)a6;
- (void)pictureInPictureController:(id)a3 willDestroyPictureInPictureViewController:(id)a4;
- (void)pictureInPictureController:(id)a3 willHidePictureInPictureViewController:(id)a4;
- (void)pipController:(id)a3 didCancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5;
- (void)pipController:(id)a3 didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)pipController:(id)a3 willEndPIPInterruptionForAssertion:(id)a4;
- (void)pipController:(id)a3 willRestorePictureInPictureForTestForApplicationWithBundleIdentifier:(id)a4;
- (void)pipController:(id)a3 willStartPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a4;
- (void)setPIPController:(id)a3;
@end

@implementation SBPIPPegasusAdapter

- (BOOL)isStartingStoppingOrCancellingPictureInPictureForPIPController:(id)a3
{
  return [(PGPictureInPictureController *)self->_pegasusController isStartingStoppingOrCancellingPictureInPicture];
}

+ (BOOL)_isAutoPictureInPictureSupported
{
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 pipDefaults];
  char v5 = [v4 allowAutoPIP];

  return [a1 isSupported] & v5;
}

+ (BOOL)isSupported
{
  if (isSupported_onceToken != -1) {
    dispatch_once(&isSupported_onceToken, &__block_literal_global_107);
  }
  return isSupported_isPictureInPictureSupported;
}

- (BOOL)shouldStartPictureInPictureForPIPController:(id)a3 applicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5
{
  id v7 = a5;
  if ([(id)objc_opt_class() _isAutoPictureInPictureSupported])
  {
    pegasusController = self->_pegasusController;
    v9 = SBPIPApplicationForProcessIdentifier(pegasusController, a4);
    char v10 = [(PGPictureInPictureController *)pegasusController shouldStartPictureInPictureForApplicationEnteringBackground:v9 sceneSessionPersistentIdentifier:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)pipController:(id)a3 willBeginPIPInterruptionForAssertion:(id)a4
{
  pegasusController = self->_pegasusController;
  id v6 = a4;
  int64_t v7 = [(SBPIPPegasusAdapter *)self _reasonForAssertion:v6];
  v8 = [v6 cameraSensorAttributionBundleIdentifier];

  LOBYTE(v7) = [(PGPictureInPictureController *)pegasusController pictureInPictureInterruptionBeganWithReason:v7 attribution:v8];
  return v7;
}

- (int64_t)_reasonForAssertion:(id)a3
{
  uint64_t v3 = [a3 behaviorOverrideReason];
  if (v3 == 1) {
    return 2;
  }
  else {
    return v3 == 2;
  }
}

uint64_t __34__SBPIPPegasusAdapter_isSupported__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F88568] isPictureInPictureSupported];
  isSupported_isPictureInPictureSupported = result;
  return result;
}

- (SBPIPPegasusAdapter)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBPIPPegasusAdapter;
  v2 = [(SBPIPPegasusAdapter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (PGPictureInPictureController *)objc_alloc_init(MEMORY[0x1E4F88568]);
    pegasusController = v2->_pegasusController;
    v2->_pegasusController = v3;

    [(PGPictureInPictureController *)v2->_pegasusController setDelegate:v2];
    char v5 = objc_alloc_init(SBPIPAnalytics);
    analyticsHelper = v2->_analyticsHelper;
    v2->_analyticsHelper = v5;

    [(PGPictureInPictureController *)v2->_pegasusController setAnalyticsDelegate:v2->_analyticsHelper];
    int64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__updateHasIdleTimerBehaviors name:*MEMORY[0x1E4F88588] object:0];

    [(PGPictureInPictureController *)v2->_pegasusController addObserver:v2 forKeyPath:@"pictureInPictureActive" options:1 context:0];
    [(PGPictureInPictureController *)v2->_pegasusController activateBackgroundPIPAuthorizationService];
    v8 = [(id)SBApp bannerManager];
    [v8 addTransitionObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_pipDefaultContentSizeResetTimer invalidate];
  uint64_t v3 = [(id)SBApp bannerManager];
  [v3 removeTransitionObserver:self];

  if ([(id)objc_opt_class() isSupported])
  {
    [(PGPictureInPictureController *)self->_pegasusController removeObserver:self forKeyPath:@"pictureInPictureActive"];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBPIPPegasusAdapter;
  [(SBPIPPegasusAdapter *)&v5 dealloc];
}

- (void)setPIPController:(id)a3
{
  id obj = a3;
  p_pipController = &self->_pipController;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipController);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_pipController, obj);
    id v6 = obj;
  }
}

- (int64_t)contentTypeForPIPController:(id)a3
{
  return 0;
}

- (BOOL)isPresentingPictureInPictureForPIPController:(id)a3 applicationBundleIdentifier:(id)a4
{
  pegasusController = self->_pegasusController;
  id v5 = a4;
  id v6 = [(PGPictureInPictureController *)pegasusController activePictureInPictureApplication];
  int64_t v7 = [v6 bundleIdentifier];

  LOBYTE(v6) = [v7 isEqualToString:v5];
  return (char)v6;
}

- (void)pipController:(id)a3 willEndPIPInterruptionForAssertion:(id)a4
{
  pegasusController = self->_pegasusController;
  id v6 = a4;
  int64_t v7 = [(SBPIPPegasusAdapter *)self _reasonForAssertion:v6];
  id v8 = [v6 cameraSensorAttributionBundleIdentifier];

  [(PGPictureInPictureController *)pegasusController pictureInPictureInterruptionEndedWithReason:v7 attribution:v8];
}

- (BOOL)isStoppingOrCancellingPictureForPIPController:(id)a3 applicationWithBundleIdentifier:(id)a4 scenePersistenceIdentifier:(id)a5
{
  pegasusController = self->_pegasusController;
  id v7 = a5;
  id v8 = [(PGPictureInPictureController *)pegasusController existingPictureInPictureApplicationForBundleIdentifier:a4];
  LOBYTE(pegasusController) = [(PGPictureInPictureController *)pegasusController isStoppingOrCancellingPictureInPictureForApplication:v8 sceneSessionPersistentIdentifier:v7];

  return (char)pegasusController;
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3
{
  return [(PGPictureInPictureController *)self->_pegasusController tetheringModeForSceneSessionPersistentIdentifier:a3];
}

- (void)pipController:(id)a3 didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  pegasusController = self->_pegasusController;
  id v11 = a7;
  id v12 = a5;
  SBPIPApplicationForProcessIdentifier(pegasusController, a4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(PGPictureInPictureController *)pegasusController startPictureInPictureForApplicationEnteringBackground:v13 sceneSessionPersistentIdentifier:v12 animated:v7 completionHandler:v11];
}

- (void)pipController:(id)a3 didCancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5
{
  pegasusController = self->_pegasusController;
  id v7 = a5;
  SBPIPApplicationForProcessIdentifier(pegasusController, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PGPictureInPictureController *)pegasusController cancelPictureInPictureForApplication:v8 sceneSessionPersistentIdentifier:v7];
}

- (id)pipController:(id)a3 morphAnimatorDataSourceForMorphAnimatorController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 scenePersistenceIdentifier];
  v9 = SBPIPApplicationForProcessIdentifier(self->_pegasusController, [v6 targetProcessIdentifier]);
  uint64_t v10 = [(PGPictureInPictureController *)self->_pegasusController contentTypePictureInPictureApplication:v9 sceneSessionPersistentIdentifier:v8];
  [(PGPictureInPictureController *)self->_pegasusController preferredContentSizeForInteractivelyEnteringBackgroundForApplication:v9 sceneSessionPersistentIdentifier:v8];
  double v12 = v11;
  double v14 = v13;
  v15 = [SBPIPContentViewLayoutSettings alloc];
  v16 = +[SBPIPContentViewLayoutMetrics pegasusMetricsForContentType:v10];
  v17 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:](v15, "initWithPlatformMetrics:contentSize:", v16, v12, v14);

  v18 = [[SBPIPMorphAnimatorDataSource alloc] initWithMorphAnimatorController:v6 pipController:v7 pegasusController:self->_pegasusController contentViewLayoutSettings:v17];
  return v18;
}

- (void)pipController:(id)a3 willStartPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a4
{
}

- (void)pipController:(id)a3 willRestorePictureInPictureForTestForApplicationWithBundleIdentifier:(id)a4
{
}

- (BOOL)preventStashAssertionsForPIPController:(id)a3
{
  int v5 = [(PGPictureInPictureController *)self->_pegasusController isStartingStoppingOrCancellingPictureInPicture];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    if ([WeakRetained hasCameraInterruptionForBundleIdentifier:@"com.apple.avconferenced"])
    {
      BOOL v6 = 1;
LABEL_5:

      return v6;
    }
  }
  id v7 = [(PGPictureInPictureController *)self->_pegasusController activePictureInPictureApplications];
  BOOL v6 = [v7 count] == 0;

  if (v5) {
    goto LABEL_5;
  }
  return v6;
}

- (void)_bannerPresentableWillAnimateTransition:(id)a3 isPresentation:(BOOL)a4 isDismissal:(BOOL)a5 isFullScreen:(BOOL)a6 withTransitionCoordinator:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  BOOL v14 = [(SBPIPPegasusAdapter *)self _presentableIsDodgeableAndStatusBarSuppressing:v12];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke;
  v35[3] = &unk_1E6AF5290;
  id v15 = v12;
  id v36 = v15;
  v37 = self;
  v16 = (void *)MEMORY[0x1D948C7A0](v35);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_2;
  v32[3] = &unk_1E6AF5290;
  id v17 = v15;
  id v33 = v17;
  v34 = self;
  uint64_t v18 = MEMORY[0x1D948C7A0](v32);
  v19 = (void *)v18;
  if (v14)
  {
    if (v10 || v9)
    {
      if (v10) {
        uint64_t v18 = (uint64_t)v16;
      }
      (*(void (**)(void))(v18 + 16))();
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_3;
    v28[3] = &unk_1E6AFDCF0;
    v28[4] = self;
    id v29 = v17;
    char v30 = v14 & ~(v10 || v9);
    BOOL v31 = a6;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_4;
    v20[3] = &unk_1E6AFDD18;
    BOOL v24 = v10;
    id v22 = v19;
    BOOL v25 = v9;
    id v23 = v16;
    v20[4] = self;
    id v21 = v29;
    char v26 = v30;
    BOOL v27 = a6;
    [v13 animateAlongsideTransition:v28 completion:v20];
  }
}

void __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    goto LABEL_5;
  }
  uint64_t v3 = SBLogCommon();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4) {
    NSLog(&cfstr_TriedToAddOrRe.isa);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
LABEL_5:
    int v5 = *(void **)(*(void *)(a1 + 40) + 16);
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v6;

      uint64_t v2 = *(void *)(a1 + 32);
      int v5 = *(void **)(*(void *)(a1 + 40) + 16);
    }
    [v5 addObject:v2];
  }
}

void __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  uint64_t v2 = SBLogCommon();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3) {
    NSLog(&cfstr_TriedToAddOrRe.isa);
  }
  if (*(void *)(a1 + 32))
  {
LABEL_5:
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "removeObject:");
    if (![*(id *)(*(void *)(a1 + 40) + 16) count])
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = *(void **)(v4 + 16);
      *(void *)(v4 + 16) = 0;
    }
  }
}

uint64_t __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBannerInsetsForExpanseBanner:*(void *)(a1 + 40) isSizeChanging:*(unsigned __int8 *)(a1 + 48) isFullScreen:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateAppStatusBarSettingsAssertion];
}

uint64_t __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (!result) {
    return result;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = a1 + 48;
LABEL_7:
    (*(void (**)(void))(*(void *)v4 + 16))();
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v4 = a1 + 56;
    goto LABEL_7;
  }
LABEL_8:
  [*(id *)(a1 + 32) _updateBannerInsetsForExpanseBanner:*(void *)(a1 + 40) isSizeChanging:*(unsigned __int8 *)(a1 + 66) isFullScreen:*(unsigned __int8 *)(a1 + 67)];
  int v5 = *(void **)(a1 + 32);
  return [v5 _updateAppStatusBarSettingsAssertion];
}

- (void)bannerManager:(id)a3 containerWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
}

- (void)bannerManager:(id)a3 presentable:(id)a4 willTransitionToSize:(CGSize)a5 withTransitionCoordinator:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v18 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v12 windowSceneForPresentable:v18];
  BOOL v14 = [v12 bannerWindowInWindowScene:v13];

  if (v14)
  {
    [v14 frame];
    BOOL v17 = height == v16 && width == v15;
  }
  else
  {
    BOOL v17 = 0;
  }
  [(SBPIPPegasusAdapter *)self _bannerPresentableWillAnimateTransition:v18 isPresentation:0 isDismissal:0 isFullScreen:v17 withTransitionCoordinator:v11];
}

- (void)_updateBannerInsetsForExpanseBanner:(id)a3 isSizeChanging:(BOOL)a4 isFullScreen:(BOOL)a5
{
  id v8 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SBPIPPegasusAdapter__updateBannerInsetsForExpanseBanner_isSizeChanging_isFullScreen___block_invoke;
  block[3] = &unk_1E6AFDD40;
  block[4] = self;
  id v11 = v8;
  BOOL v12 = a4;
  BOOL v13 = a5;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__SBPIPPegasusAdapter__updateBannerInsetsForExpanseBanner_isSizeChanging_isFullScreen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actuallyUpdateBannerInsetsForExpanseBanner:*(void *)(a1 + 40) isSizeChanging:*(unsigned __int8 *)(a1 + 48) isFullScreen:*(unsigned __int8 *)(a1 + 49)];
}

- (void)_actuallyUpdateBannerInsetsForExpanseBanner:(id)a3 isSizeChanging:(BOOL)a4 isFullScreen:(BOOL)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3, a4);
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    uint64_t v9 = [(NSMutableSet *)self->_presentedExpanseBanners count];
    unint64_t v10 = [(NSMutableSet *)self->_presentedExpanseBanners count];
    BOOL v11 = !v9 || a5;
    if (v10 <= 1)
    {
      double v12 = 0.0;
      if (v11) {
        goto LABEL_30;
      }
    }
    double v13 = 0.0;
    if ([(NSMutableSet *)self->_presentedExpanseBanners count]) {
      double v12 = 1.79769313e308;
    }
    else {
      double v12 = 0.0;
    }
    if ([(NSMutableSet *)self->_presentedExpanseBanners count]) {
      double v13 = 2.22507386e-308;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    BOOL v14 = self->_presentedExpanseBanners;
    uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v68;
      double v66 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          double v64 = v13;
          double v65 = v12;
          if (*(void *)v68 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          v20 = [v19 viewController];
          id v21 = [v20 view];

          [v21 bounds];
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          char v30 = [v19 viewController];
          [v30 bannerContentOutsets];
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;
          double v38 = v37;

          double v39 = v23 + v34;
          double v40 = v25 + v32;
          double v41 = v27 - (v34 + v38);
          double v42 = v29 - (v32 + v36);
          v43 = [v21 window];
          [v43 bounds];
          CGFloat v45 = v44;
          CGFloat v47 = v46;
          CGFloat v49 = v48;
          CGFloat v51 = v50;

          v73.origin.CGFloat x = v45;
          v73.origin.CGFloat y = v47;
          v73.size.CGFloat width = v49;
          v73.size.CGFloat height = v51;
          double MidY = CGRectGetMidY(v73);
          double v53 = v66;
          if (MidY >= v66) {
            double v53 = MidY;
          }
          double v66 = v53;
          v54 = [v21 window];
          objc_msgSend(v54, "convertRect:fromView:", v21, v39, v40, v41, v42);
          v77.origin.CGFloat x = v45;
          v77.origin.CGFloat y = v47;
          v77.size.CGFloat width = v49;
          v77.size.CGFloat height = v51;
          CGRect v75 = CGRectIntersection(v74, v77);
          CGFloat x = v75.origin.x;
          CGFloat y = v75.origin.y;
          CGFloat width = v75.size.width;
          CGFloat height = v75.size.height;

          v76.origin.CGFloat x = x;
          v76.origin.CGFloat y = y;
          v76.size.CGFloat width = width;
          v76.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v76);
          double v13 = v64;
          double v12 = v65;
          if (MaxY < v65) {
            double v12 = MaxY;
          }
          if (MaxY >= v64) {
            double v13 = MaxY;
          }
        }
        uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v16);
    }
    else
    {
      double v66 = 0.0;
    }

    if (v13 <= v66) {
      double v12 = v13;
    }
    if (v12 <= v66)
    {
LABEL_30:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
      v61 = [WeakRetained windowSceneManager];
      v62 = [v61 activeDisplayWindowScene];

      v63 = [v62 pictureInPictureManager];
      objc_msgSend(v63, "applyPictureInPictureInsets:forSource:", 6, v12, 0.0, 0.0, 0.0);
    }
  }
}

- (void)_updateAppStatusBarSettingsAssertion
{
  presentedExpanseBanners = self->_presentedExpanseBanners;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__SBPIPPegasusAdapter__updateAppStatusBarSettingsAssertion__block_invoke;
  v19[3] = &unk_1E6AF74E8;
  v19[4] = self;
  uint64_t v4 = [(NSMutableSet *)presentedExpanseBanners bs_firstObjectPassingTest:v19];
  appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
  if (!v4)
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)appStatusBarSettingsAssertion invalidateWithAnimationParameters:v18];

    uint64_t v7 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = 0;
    goto LABEL_5;
  }
  if (!appStatusBarSettingsAssertion)
  {
    uint64_t v6 = [(id)SBApp bannerManager];
    uint64_t v7 = [v6 windowSceneForPresentable:v4];

    uint64_t v8 = [v7 statusBarManager];
    uint64_t v9 = [v8 assertionManager];
    unint64_t v10 = objc_alloc_init(SBMutableStatusBarSettings);
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA9620], *MEMORY[0x1E4FA9628], *MEMORY[0x1E4FA9698], *MEMORY[0x1E4FA96A8], *MEMORY[0x1E4FA9598], *MEMORY[0x1E4FA9618], *MEMORY[0x1E4FA95C8], *MEMORY[0x1E4FA96C0], *MEMORY[0x1E4FA96A0], @"com.apple.systemstatus.background-activity.CallRecording", 0);
    [(SBMutableStatusBarSettings *)v10 setBackgroundActivitiesToSuppress:v11];
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    BOOL v14 = (SBWindowSceneStatusBarSettingsAssertion *)[v9 newSettingsAssertionWithSettings:v10 atLevel:7 reason:v13];
    uint64_t v15 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = v14;

    uint64_t v16 = self->_appStatusBarSettingsAssertion;
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v16 acquireWithAnimationParameters:v17];

LABEL_5:
  }
}

uint64_t __59__SBPIPPegasusAdapter__updateAppStatusBarSettingsAssertion__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentableIsDodgeableAndStatusBarSuppressing:a2];
}

- (BOOL)_presentableIsDodgeableAndStatusBarSuppressing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 requesterIdentifier];
  int v5 = [v3 requestIdentifier];

  if (([v5 hasPrefix:@"com.apple.conversationController.HUD"] & 1) != 0
    || ([v5 hasPrefix:@"com.apple.conversationController.Session"] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v4 isEqualToString:@"com.apple.CopresenceApp.DefaultRequester"];
  }

  return v6;
}

- (void)containerViewControllerStartReducingResourcesUsage:(id)a3
{
  if (!self->_isReducingResourcesUsage)
  {
    self->_isReducingResourcesUsage = 1;
    id v5 = [a3 contentViewController];
    uint64_t v4 = [v5 application];
    [(PGPictureInPictureController *)self->_pegasusController startPictureInPictureResourcesUsageReductionForApplication:v4 requestingViewController:v5];
  }
}

- (void)containerViewControllerStopReducingResourcesUsage:(id)a3
{
  if (self->_isReducingResourcesUsage)
  {
    self->_isReducingResourcesUsage = 0;
    id v5 = [a3 contentViewController];
    uint64_t v4 = [v5 application];
    [(PGPictureInPictureController *)self->_pegasusController stopPictureInPictureResourcesUsageReductionForApplication:v4 requestingViewController:v5];
  }
}

- (void)_updateHideFromClonedDisplaysAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  uint64_t v4 = [WeakRetained containerViewControllersOnWindowScene:0];
  int v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_37_3);

  hideFaceTimePIPFromSharePlayScreenSharingAssertion = self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion;
  if (v5)
  {
    if (hideFaceTimePIPFromSharePlayScreenSharingAssertion) {
      return;
    }
    id v12 = +[SBWorkspace mainWorkspace];
    uint64_t v8 = [v12 inCallPresentationManager];
    uint64_t v9 = [v8 hideSharePlayContentFromSharedScreenController];
    unint64_t v10 = [v9 acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:@"FaceTime PIP"];
    BOOL v11 = self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion;
    self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion = v10;

    uint64_t v7 = (BSInvalidatable *)v12;
  }
  else
  {
    [(BSInvalidatable *)hideFaceTimePIPFromSharePlayScreenSharingAssertion invalidate];
    uint64_t v7 = self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion;
    self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion = 0;
  }
}

uint64_t __61__SBPIPPegasusAdapter__updateHideFromClonedDisplaysAssertion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prefersHiddenFromClonedDisplay];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v46 = a4;
  id v9 = a5;
  CGFloat v45 = v8;
  if ([v8 isEqualToString:@"pictureInPictureActive"])
  {
    id v42 = v9;
    unint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F284C8]];
    int v43 = [v10 BOOLValue];

    BOOL v11 = +[SBApplicationTestingManager sharedInstance];
    double v44 = [v11 currentTestName];

    if (v44
      && (([v44 containsString:@"PIP"] & 1) != 0
       || [v44 containsString:@"PiP"]))
    {
      id v12 = SBApplicationTestingPIPIsActiveNotificationName;
      if (!v43) {
        id v12 = SBApplicationTestingPIPIsNoLongerActiveNotificationName;
      }
      double v13 = (void *)MEMORY[0x1E4F28EB8];
      BOOL v14 = *v12;
      uint64_t v15 = [v13 defaultCenter];
      [v15 postNotificationName:v14 object:0];
    }
    if ((v43 & 1) == 0)
    {
      CGFloat v51 = [(PGPictureInPictureController *)self->_pegasusController activeSceneSessionIdentifiersByApplication];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = [v51 allKeys];
      uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v52)
      {
        uint64_t v50 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v61 != v50) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            id v18 = [v51 objectForKey:v17];
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v64 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v57 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
                  double v24 = objc_msgSend(WeakRetained, "pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:", objc_msgSend(v17, "processIdentifier"), v22);

                  if (v24)
                  {
                    double v25 = [v24 viewMorphAnimator];
                    BOOL v26 = [v25 direction] == 1;

                    if (!v26) {
                      [v24 cancel];
                    }
                  }
                }
                uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v64 count:16];
              }
              while (v19);
            }
          }
          uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v52);
      }
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        char v27 = 1;
      }
      else {
        char v27 = v43;
      }
      if (v27) {
        goto LABEL_32;
      }
    }
    else
    {
      double v31 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v32 = [v31 userInterfaceIdiom] == 1;

      if ((v32 | v43))
      {
LABEL_32:
        pipDefaultContentSizeResetTimer = self->_pipDefaultContentSizeResetTimer;
        vala = &self->_pipDefaultContentSizeResetTimer;
        [(BSAbsoluteMachTimer *)pipDefaultContentSizeResetTimer invalidate];
        double v29 = *vala;
        *vala = 0;

        id v30 = objc_alloc_init(MEMORY[0x1E4FA60C8]);
        [v30 setInitiallyUsesMinimumPreferredContentSize:0];

LABEL_35:
        id v9 = v42;
        goto LABEL_36;
      }
    }
    [(BSAbsoluteMachTimer *)self->_pipDefaultContentSizeResetTimer invalidate];
    double v33 = self->_pipDefaultContentSizeResetTimer;
    self->_pipDefaultContentSizeResetTimer = 0;

    double v34 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBPIPDefaultContentSizeResetTimer"];
    double v35 = self->_pipDefaultContentSizeResetTimer;
    self->_pipDefaultContentSizeResetTimer = v34;

    objc_initWeak(&location, self);
    double v36 = +[SBPIPSettingsDomain rootSettings];
    double v37 = [v36 interactionSettings];
    [v37 defaultContentSizeResetTimeout];
    double v39 = v38;

    double v40 = self->_pipDefaultContentSizeResetTimer;
    id v41 = MEMORY[0x1E4F14428];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __70__SBPIPPegasusAdapter_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v53[3] = &unk_1E6AF5838;
    objc_copyWeak(&v54, &location);
    [(BSAbsoluteMachTimer *)v40 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v53 queue:v39 * 60.0 handler:0.0];

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
    goto LABEL_35;
  }
LABEL_36:
}

void __70__SBPIPPegasusAdapter_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained[5] invalidate];
    id v2 = v4[5];
    v4[5] = 0;

    id v3 = objc_alloc_init(MEMORY[0x1E4FA60C8]);
    [v3 setInitiallyUsesMinimumPreferredContentSize:1];

    id WeakRetained = v4;
  }
}

- (void)pictureInPictureController:(id)a3 didCreatePictureInPictureViewController:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  int v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    uint64_t v7 = SBLogCommon();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      id v9 = _SBFLoggingMethodProem();
      NSLog(&cfstr_NeedsToBeInvok.isa, v9);
    }
  }
  if (([(id)objc_opt_class() isSupported] & 1) == 0)
  {
    unint64_t v10 = SBLogCommon();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      id v12 = _SBFLoggingMethodProem();
      NSLog(&cfstr_InvokedOnADevi.isa, v12);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  uint64_t v14 = [v6 contentType];
  if (v14 == 4) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2 * (v14 == 6);
  }
  uint64_t v25 = *MEMORY[0x1E4FA75F0];
  v26[0] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  uint64_t v17 = (void *)MEMORY[0x1E4FA5E78];
  id v18 = v16;
  uint64_t v19 = [v17 sharedInstance];
  [v19 emitEvent:24 withPayload:v18];

  uint64_t v20 = [[SBPIPPegasusContainerAdapter alloc] initWithPictureInPictureViewController:v6];
  id v21 = [SBPIPContainerViewController alloc];
  uint64_t v22 = +[SBPIPSettingsDomain rootSettings];
  double v23 = [v22 interactionSettings];
  double v24 = [(SBPIPContainerViewController *)v21 initWithPIPController:WeakRetained interactionSettings:v23 adapter:v20];

  [(SBPIPContainerViewController *)v24 setContentZOrderPriority:v15];
  [(SBPIPContainerViewController *)v24 addObserver:self];
  [WeakRetained addContainerViewController:v24 dataSource:v20];
  [(SBPIPPegasusAdapter *)self _updateHideFromClonedDisplaysAssertion];
}

- (void)pictureInPictureController:(id)a3 didRequestStopForPictureInPictureViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  uint64_t v14 = [v13 application];
  uint64_t v15 = [v14 bundleIdentifier];
  if ([v15 isEqualToString:@"com.apple.InCallService"])
  {
    uint64_t v16 = +[SBWorkspace mainWorkspace];
    uint64_t v17 = [v16 inCallPresentationManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke;
    v18[3] = &unk_1E6AFDD88;
    v18[4] = self;
    id v19 = v10;
    id v20 = v13;
    id v21 = v12;
    BOOL v23 = v6;
    id v22 = v14;
    [v17 ensureSwitcherInclusionForRestoringFromPIPForSceneWithPersistenceIdentifier:v21 completion:v18];
  }
  else
  {
    [(SBPIPPegasusAdapter *)self _postEnsuredInSwitcher_pictureInPictureController:v10 didRequestStopForPictureInPictureViewController:v13 sourceSceneSessionIdentifier:v12 animated:v6];
  }
}

uint64_t __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    return objc_msgSend(v3, "_postEnsuredInSwitcher_pictureInPictureController:didRequestStopForPictureInPictureViewController:sourceSceneSessionIdentifier:animated:", v4, v5, v6, v7);
  }
  else
  {
    id v9 = SBLogPIP();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_cold_1(a1, v9);
    }

    return [*(id *)(*(void *)(a1 + 32) + 24) cancelPictureInPictureForApplication:*(void *)(a1 + 64) sceneSessionPersistentIdentifier:*(void *)(a1 + 56)];
  }
}

- (void)_postEnsuredInSwitcher_pictureInPictureController:(id)a3 didRequestStopForPictureInPictureViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  id v12 = v9;
  CGRect v75 = [v12 application];
  uint64_t v13 = [v75 bundleIdentifier];
  v83 = v12;
  uint64_t v14 = [v12 _sbWindowScene];
  CGRect v73 = self;
  BOOL v74 = [(SBPIPPegasusAdapter *)self _layoutStateContainsSceneForSourceSceneSessionIdentifier:v10 bundleIdentifier:v13 windowScene:v14];
  uint64_t v15 = [v14 switcherController];
  int v71 = [v15 isAnySwitcherVisible];
  int v70 = [v15 isInAnyPeekState];
  CGRect v77 = v15;
  uint64_t v72 = [v15 unlockedEnvironmentMode];
  v78 = v14;
  uint64_t v16 = [v14 switcherController];
  int v87 = [v16 isChamoisWindowingUIEnabled];

  uint64_t v17 = +[SBSceneManagerCoordinator sharedInstance];
  id v18 = [v17 sceneManagerForPersistenceIdentifier:v10];

  v91 = [v18 existingSceneHandleForPersistenceIdentifier:v10];
  int v19 = 0;
  BOOL v20 = 1;
  v81 = v10;
  v82 = WeakRetained;
  v79 = (void *)v13;
  v80 = v18;
  if (v10 && v13)
  {
    id v21 = +[SBMainSwitcherControllerCoordinator sharedInstanceIfExists];
    id v22 = [v21 _recentAppLayoutsController];
    BOOL v23 = [v22 recentsForBundleIdentifier:v79 includingHiddenAppLayouts:0];

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obj = v23;
    uint64_t v89 = [obj countByEnumeratingWithState:&v132 objects:v137 count:16];
    if (v89)
    {
      BOOL v85 = 0;
      BOOL v86 = 0;
      uint64_t v88 = *(void *)v133;
      do
      {
        for (uint64_t i = 0; i != v89; ++i)
        {
          if (*(void *)v133 != v88) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v132 + 1) + 8 * i);
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          BOOL v26 = [v25 allItems];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v128 objects:v136 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v129;
            while (2)
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v129 != v29) {
                  objc_enumerationMutation(v26);
                }
                double v31 = *(void **)(*((void *)&v128 + 1) + 8 * j);
                BOOL v32 = [v31 uniqueIdentifier];
                double v33 = [v91 sceneIdentifier];
                int v34 = [v32 isEqualToString:v33];

                if (v34)
                {
                  BOOL v86 = [v25 environment] == 2;
                  if (v87)
                  {
                    double v35 = [v25 layoutAttributesForItem:v31];
                    BOOL v85 = [v35 occlusionState] != 1;
                  }
                  else
                  {
                    BOOL v85 = 0;
                  }
                  goto LABEL_20;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v128 objects:v136 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }
LABEL_20:
        }
        uint64_t v89 = [obj countByEnumeratingWithState:&v132 objects:v137 count:16];
      }
      while (v89);
    }
    else
    {
      BOOL v85 = 0;
      BOOL v86 = 0;
    }

    int v19 = v85;
    BOOL v20 = !v86;
    id v18 = v80;
  }
  double v36 = +[SBMainWorkspace sharedInstance];
  double v37 = [v36 currentTransaction];

  double v38 = +[SBLockScreenManager sharedInstanceIfExists];
  int v39 = [v38 isUILocked];

  BOOL v40 = 1;
  [v82 hideContainersExcludingContainerForContentViewControllerAndTetheredOnes:v83 animated:1];
  id v41 = [v91 application];
  id v42 = [v91 displayIdentity];
  int v43 = +[SBDeviceApplicationSceneEntity entityWithApplication:v41 scenePersistenceIdentifier:v81 sceneHandleProvider:v18 displayIdentity:v42];

  double v44 = [v91 sceneIfExists];
  CGFloat v45 = [v44 settings];
  LODWORD(v41) = [v45 isForeground];

  v90 = v44;
  if (!v41)
  {
    CGFloat v49 = 0;
    goto LABEL_30;
  }
  id v46 = [(id)SBApp windowSceneManager];
  CGFloat v47 = [v44 settings];
  double v48 = [v47 displayIdentity];
  CGFloat v49 = [v46 windowSceneForDisplayIdentity:v48];

  BOOL v40 = v49 == 0;
  if (!v49)
  {
LABEL_30:
    uint64_t v50 = v78;
    goto LABEL_31;
  }
  uint64_t v50 = v78;
  if (v49 != v78)
  {
    CGFloat v51 = v81;
    uint64_t v52 = v79;
    uint64_t v53 = [(SBPIPPegasusAdapter *)v73 _layoutStateContainsSceneForSourceSceneSessionIdentifier:v81 bundleIdentifier:v79 windowScene:v49] ^ 1;
    pegasusController = v73->_pegasusController;
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke;
    v125[3] = &unk_1E6AFDDB0;
    v55 = v82;
    id v126 = v82;
    id v127 = v78;
    long long v56 = pegasusController;
    long long v57 = v75;
    [(PGPictureInPictureController *)v56 stopPictureInPictureForApplication:v75 sceneSessionPersistentIdentifier:v81 animated:v53 completionHandler:v125];

    id v58 = v126;
    long long v59 = v76;
    goto LABEL_45;
  }
  if (!v20 && !v74) {
    goto LABEL_40;
  }
LABEL_31:
  int v60 = v87 ^ 1;
  if (v72 != 3) {
    int v60 = 1;
  }
  if ((v60 | v74))
  {
    int v61 = v71 | v70 | v74;
    if (v37) {
      int v61 = 1;
    }
    CGFloat v51 = v81;
    if ((v61 | v39) != 1)
    {
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_8;
      v101[3] = &unk_1E6AFDEA0;
      long long v59 = v76;
      id v102 = v76;
      id v103 = v75;
      id v104 = v81;
      id v105 = v82;
      id v106 = v50;
      v107 = v73;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_81;
      v92[3] = &unk_1E6AFDF10;
      long long v57 = v75;
      id v93 = v103;
      id v94 = v104;
      v95 = v73;
      uint64_t v52 = v79;
      id v96 = v79;
      id v97 = v106;
      char v100 = v87;
      id v98 = v102;
      v55 = v82;
      id v99 = v105;
      [v99 restoreContentViewController:v83 appSceneEntity:v43 morphAnimatorConfigurationBlock:v101 completion:v92];

      id v58 = v102;
      goto LABEL_45;
    }
    v55 = v82;
    long long v57 = v75;
    if (v19)
    {
      v111[0] = MEMORY[0x1E4F143A8];
      v111[1] = 3221225472;
      v111[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_5;
      v111[3] = &unk_1E6AFDDD8;
      long long v59 = v76;
      id v112 = v76;
      id v113 = v75;
      id v114 = v81;
      id v115 = v82;
      id v116 = v50;
      [(SBPIPPegasusAdapter *)v73 _activateSceneWithPersistenceIdentifier:v114 pictureInPictureViewController:v83 completion:v111];

      id v58 = v112;
    }
    else
    {
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_7;
      v108[3] = &unk_1E6AFDDB0;
      id v109 = v82;
      id v110 = v50;
      long long v59 = v76;
      [v76 stopPictureInPictureForApplication:v75 sceneSessionPersistentIdentifier:v81 animated:1 completionHandler:v108];

      id v58 = v109;
    }
  }
  else
  {
LABEL_40:
    [v43 setFlag:1 forActivationSetting:57];
    v55 = v82;
    long long v62 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v82, "contentType"));
    [v43 setObject:v62 forActivationSetting:58];

    if (v40) {
      long long v63 = v50;
    }
    else {
      long long v63 = v49;
    }
    id v64 = v63;
    double v65 = +[SBMainWorkspace sharedInstance];
    uint64_t v66 = [v64 _sbDisplayConfiguration];
    id v58 = [v65 createRequestWithOptions:0 displayConfiguration:v66];

    long long v67 = [MEMORY[0x1E4F4F7F8] processHandle];
    [v58 setOriginatingProcess:v67];

    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_2;
    v123[3] = &unk_1E6AF57C0;
    id v124 = v43;
    [v58 modifyApplicationContext:v123];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_3;
    v117[3] = &unk_1E6AFDDD8;
    long long v59 = v76;
    id v118 = v76;
    id v119 = v75;
    id v120 = v81;
    id v121 = v82;
    id v122 = v50;
    id v68 = (id)[v58 addCompletionHandler:v117];
    CGFloat v51 = v81;
    long long v69 = +[SBMainWorkspace sharedInstance];
    [v69 executeTransitionRequest:v58];

    long long v57 = v75;
  }
  uint64_t v52 = v79;
LABEL_45:
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAllContentOnWindowScene:*(void *)(a1 + 40) animated:1];
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setActivatingEntity:*(void *)(a1 + 32)];
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_4;
  v5[3] = &unk_1E6AFDDB0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 stopPictureInPictureForApplication:v3 sceneSessionPersistentIdentifier:v4 animated:1 completionHandler:v5];
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAllContentOnWindowScene:*(void *)(a1 + 40) animated:1];
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_6;
  v5[3] = &unk_1E6AFDDB0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 stopPictureInPictureForApplication:v3 sceneSessionPersistentIdentifier:v4 animated:1 completionHandler:v5];
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAllContentOnWindowScene:*(void *)(a1 + 40) animated:1];
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAllContentOnWindowScene:*(void *)(a1 + 40) animated:1];
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_9;
  v6[3] = &unk_1E6AFDE78;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  objc_copyWeak(&v13, &location);
  id v10 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  id v11 = v4;
  uint64_t v12 = v5;
  [v3 setSetupCompletionBlock:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_9(uint64_t a1)
{
  id v2 = SBLogPIP();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] First stage begins", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_77;
  v8[3] = &unk_1E6AFDE50;
  objc_copyWeak(&v15, (id *)(a1 + 80));
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  id v13 = v6;
  uint64_t v14 = v7;
  [v3 beginTwoStageStopPictureInPictureForApplication:v4 withSceneSessionPersistentIdentifier:v5 animated:1 byRestoringUserInterfaceWithCompletionHandler:v8];

  objc_destroyWeak(&v15);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_77(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SBLogPIP();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 localizedDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] First stage ends with error: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_78;
    v9[3] = &unk_1E6AFDE28;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    objc_copyWeak(&v15, (id *)(a1 + 80));
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    [WeakRetained setAnimatorWaitingForExternalAnimationActionBlock:v9];

    objc_destroyWeak(&v15);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 72) + 24) cancelPictureInPictureForApplication:*(void *)(a1 + 40) sceneSessionPersistentIdentifier:*(void *)(a1 + 48)];
    [WeakRetained cancel];
  }
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_78(uint64_t a1)
{
  id v2 = SBLogPIP();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Second stage begins", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_79;
  v6[3] = &unk_1E6AFDE00;
  objc_copyWeak(&v9, (id *)(a1 + 72));
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v3 endTwoStageStopPictureInPictureForApplication:v4 withSceneSessionPersistentIdentifier:v5 animated:1 completionHandler:v6];

  objc_destroyWeak(&v9);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localizedDescription];
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Second stage ends with error: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [WeakRetained viewMorphAnimator];
  [v8 setTargetView:0];

  id v9 = [WeakRetained viewMorphAnimator];
  [v9 setTargetContentView:0];

  [*(id *)(a1 + 32) showAllContentOnWindowScene:*(void *)(a1 + 40) animated:1];
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_81(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogPIP();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v6;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Restored %{public}@ scene %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_81_cold_1(a1, v5);
    }

    int v8 = [*(id *)(a1 + 48) _layoutStateContainsSceneForSourceSceneSessionIdentifier:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 56) windowScene:*(void *)(a1 + 64)];
    id v9 = SBLogPIP();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ is in layout state so stopping pip", buf, 0xCu);
      }

      if (*(unsigned char *)(a1 + 88))
      {
        [*(id *)(a1 + 72) cancelPictureInPictureForApplication:*(void *)(a1 + 32) sceneSessionPersistentIdentifier:*(void *)(a1 + 40)];
        [*(id *)(a1 + 80) showAllContentOnWindowScene:*(void *)(a1 + 64) animated:1];
      }
      else
      {
        id v13 = *(void **)(*(void *)(a1 + 48) + 24);
        uint64_t v15 = *(void *)(a1 + 32);
        id v14 = *(void **)(a1 + 40);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_82;
        v18[3] = &unk_1E6AFDEE8;
        id v16 = v14;
        uint64_t v17 = *(void *)(a1 + 48);
        id v19 = v16;
        uint64_t v20 = v17;
        id v21 = *(id *)(a1 + 32);
        [v13 stopPictureInPictureForApplication:v15 sceneSessionPersistentIdentifier:v16 animated:1 completionHandler:v18];
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v12;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ is NOT in layout state so canceling pip", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 48) + 24) cancelPictureInPictureForApplication:*(void *)(a1 + 32) sceneSessionPersistentIdentifier:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) _enumerateContainerViewControllersForApplication:*(void *)(a1 + 32) scenePersistenceIdentifier:*(void *)(a1 + 40) usingBlock:&__block_literal_global_89];
    }
  }
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_82(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    id v3 = SBLogPIP();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_82_cold_1(v2, v3);
    }

    [*(id *)(*(void *)(v2 + 40) + 24) cancelPictureInPictureForApplication:*(void *)(v2 + 48) sceneSessionPersistentIdentifier:*(void *)(v2 + 32)];
    return [*(id *)(v2 + 40) _enumerateContainerViewControllersForApplication:*(void *)(v2 + 48) scenePersistenceIdentifier:*(void *)(v2 + 32) usingBlock:&__block_literal_global_86];
  }
  return result;
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = [a2 contentViewController];
  uint64_t v2 = [v3 viewIfLoaded];
  [v2 setHidden:1];
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = [a2 contentViewController];
  uint64_t v2 = [v3 viewIfLoaded];
  [v2 setHidden:1];
}

- (void)_enumerateContainerViewControllersForApplication:(id)a3 scenePersistenceIdentifier:(id)a4 usingBlock:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v24 = (void (**)(id, void *))a5;
  BOOL v10 = [(id)SBApp windowSceneManager];
  uint64_t v25 = v9;
  uint64_t v11 = [v10 windowSceneForPersistentIdentifier:v9];

  if (v11)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    uint64_t v23 = v11;
    id v13 = [WeakRetained containerViewControllersOnWindowScene:v11];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [v18 bundleIdentifier];
          uint64_t v20 = [v8 bundleIdentifier];
          if ([v19 isEqualToString:v20])
          {
            id v21 = [v18 scenePersistenceIdentifier];
            int v22 = [v21 isEqualToString:v25];

            if (v22) {
              v24[2](v24, v18);
            }
          }
          else
          {
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    uint64_t v11 = v23;
  }
}

- (BOOL)_layoutStateContainsSceneForSourceSceneSessionIdentifier:(id)a3 bundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (v7)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    uint64_t v11 = [v9 switcherController];
    if (([v11 isAnySwitcherVisible] & 1) == 0)
    {
      uint64_t v12 = [v11 layoutState];
      id v13 = [v12 elements];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __109__SBPIPPegasusAdapter__layoutStateContainsSceneForSourceSceneSessionIdentifier_bundleIdentifier_windowScene___block_invoke;
      v16[3] = &unk_1E6AFDF38;
      id v17 = v7;
      id v19 = &v20;
      id v18 = v8;
      [v13 enumerateObjectsUsingBlock:v16];
    }
    BOOL v14 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __109__SBPIPPegasusAdapter__layoutStateContainsSceneForSourceSceneSessionIdentifier_bundleIdentifier_windowScene___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 workspaceEntity];
  id v10 = [v5 deviceApplicationSceneEntity];

  if (a1[4])
  {
    uint64_t v6 = [v10 sceneHandle];
    id v7 = [v6 persistenceIdentifier];

    if (v7) {
      char v8 = [v7 isEqualToString:a1[4]];
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8;
  }
  else
  {
    id v7 = [v10 application];
    id v9 = [v7 bundleIdentifier];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v9 isEqualToString:a1[5]];
  }
  *a3 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

- (void)pictureInPictureController:(id)a3 willDestroyPictureInPictureViewController:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    id v7 = SBLogCommon();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      id v9 = _SBFLoggingMethodProem();
      NSLog(&cfstr_NeedsToBeInvok.isa, v9);
    }
  }
  uint64_t v16 = *MEMORY[0x1E4FA75F0];
  v17[0] = MEMORY[0x1E4F1CC28];
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v11 = (void *)MEMORY[0x1E4FA5E78];
  id v12 = v10;
  id v13 = [v11 sharedInstance];
  [v13 emitEvent:24 withPayload:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  uint64_t v15 = [WeakRetained containerViewControllerForContentViewController:v6];

  [WeakRetained removeContainerViewController:v15];
  [(SBPIPPegasusAdapter *)self _updateHideFromClonedDisplaysAssertion];
}

- (void)pictureInPictureController:(id)a3 willHidePictureInPictureViewController:(id)a4
{
  p_pipController = &self->_pipController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipController);
  [WeakRetained prepareContainerViewControllerForHidingContentViewController:v5];
}

- (void)pictureInPictureController:(id)a3 didHidePictureInPictureViewController:(id)a4
{
  p_pipController = &self->_pipController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipController);
  id v6 = [v5 _sbWindowScene];

  [WeakRetained updatePictureInPictureWindowLevelForWindowScene:v6];
}

- (BOOL)pictureInPictureController:(id)a3 shouldDenyNewConnection:(id)a4
{
  return [(id)objc_opt_class() isSupported] ^ 1;
}

- (BOOL)pictureInPictureController:(id)a3 shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:(id)a4
{
  id v4 = a4;
  int v5 = [(id)objc_opt_class() isSupported];
  id v6 = +[SBDefaults localDefaults];
  id v7 = [v6 pipDefaults];
  int v8 = [v7 allowAutoPIP];

  id v9 = +[SBLockScreenManager sharedInstance];
  char v10 = [v9 isUILocked];

  char v11 = 0;
  if (v5 && v8 && (v10 & 1) == 0)
  {
    if ([v4 isEqualToString:@"com.apple.InCallService"])
    {
      char v11 = 1;
    }
    else
    {
      id v12 = +[SBApplicationController sharedInstanceIfExists];
      id v13 = [v12 applicationWithBundleIdentifier:v4];
      BOOL v14 = [v13 info];
      if ([v14 supportsBackgroundMode:*MEMORY[0x1E4F43720]]
        && ([v14 isBlockedForScreenTimeExpiration] & 1) == 0)
      {
        uint64_t v15 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
        uint64_t v16 = [v15 externalForegroundApplicationSceneHandles];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __105__SBPIPPegasusAdapter_pictureInPictureController_shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier___block_invoke;
        v19[3] = &unk_1E6AF5D80;
        id v20 = v13;
        char v17 = objc_msgSend(v16, "bs_containsObjectPassingTest:", v19);

        char v11 = v17 ^ 1;
      }
      else
      {
        char v11 = 0;
      }
    }
  }

  return v11;
}

uint64_t __105__SBPIPPegasusAdapter_pictureInPictureController_shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 application];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:(id)a3
{
  char v3 = [(id)objc_opt_class() isSupported];
  uint64_t v4 = +[SBWorkspace mainWorkspace];
  int v5 = [v4 inCallPresentationManager];
  char v6 = [v5 hasFullscreenActiveCallInSwitcher];

  id v7 = +[SBDefaults localDefaults];
  uint64_t v8 = [v7 pipDefaults];
  char v9 = [(id)v8 allowAutoPIP];

  char v10 = +[SBLockScreenManager sharedInstance];
  LOBYTE(v8) = [v10 isUILocked];

  return v3 & v9 & ((v8 | v6) ^ 1);
}

- (void)pictureInPictureController:(id)a3 requestActivationOfSceneWithPersistenceIdentier:(id)a4 pictureInPictureViewController:(id)a5 completion:(id)a6
{
}

- (void)_activateSceneWithPersistenceIdentifier:(id)a3 pictureInPictureViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v42 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  char v11 = +[SBSceneManagerCoordinator sharedInstance];
  id v12 = [v11 sceneManagerForPersistenceIdentifier:v8];

  id v13 = [v12 existingSceneHandleForPersistenceIdentifier:v8];
  BOOL v14 = [v9 _sbWindowScene];

  double v44 = [v14 _sbDisplayConfiguration];

  uint64_t v15 = [v13 sceneIfExists];
  uint64_t v16 = [v15 settings];
  char v17 = [v16 displayIdentity];

  if (v17)
  {
    id v18 = [(id)SBApp windowSceneManager];
    uint64_t v19 = [v18 windowSceneForDisplayIdentity:v17];
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = [v13 scene];
  id v21 = [v20 settings];
  int v43 = (void *)v19;
  if ([v21 isForeground] && v19)
  {
    [v13 application];
    uint64_t v22 = v12;
    v24 = id v23 = WeakRetained;
    uint64_t v25 = [v24 bundleIdentifier];
    uint64_t v26 = v19;
    long long v27 = (void *)v25;
    BOOL v28 = [(SBPIPPegasusAdapter *)self _layoutStateContainsSceneForSourceSceneSessionIdentifier:v8 bundleIdentifier:v25 windowScene:v26];

    id WeakRetained = v23;
    id v12 = v22;

    if (v28)
    {
      long long v29 = v42;
      (*((void (**)(id, uint64_t))v42 + 2))(v42, 1);
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v30 = v44;
  if (!v8 || !v44)
  {
    long long v29 = v42;
    (*((void (**)(id, void))v42 + 2))(v42, 0);
    goto LABEL_14;
  }
  id v41 = WeakRetained;
  uint64_t v31 = [v13 application];
  BOOL v32 = [v44 identity];
  double v33 = +[SBDeviceApplicationSceneEntity entityWithApplication:v31 scenePersistenceIdentifier:v8 sceneHandleProvider:v12 displayIdentity:v32];

  [v33 setFlag:1 forActivationSetting:57];
  int v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "contentType"));
  [v33 setObject:v34 forActivationSetting:58];

  double v35 = +[SBMainWorkspace sharedInstance];
  double v36 = [v35 createRequestWithOptions:0 displayConfiguration:v44];

  double v37 = [MEMORY[0x1E4F4F7F8] processHandle];
  [v36 setOriginatingProcess:v37];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __105__SBPIPPegasusAdapter__activateSceneWithPersistenceIdentifier_pictureInPictureViewController_completion___block_invoke;
  v45[3] = &unk_1E6AF57C0;
  id v46 = v33;
  id v38 = v33;
  [v36 modifyApplicationContext:v45];
  long long v29 = v42;
  id v39 = (id)[v36 addCompletionHandler:v42];
  BOOL v40 = +[SBMainWorkspace sharedInstance];
  [v40 executeTransitionRequest:v36];

  id WeakRetained = v41;
LABEL_12:
  id v30 = v44;
LABEL_14:
}

uint64_t __105__SBPIPPegasusAdapter__activateSceneWithPersistenceIdentifier_pictureInPictureViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActivatingEntity:*(void *)(a1 + 32)];
}

- (void)_updateHasIdleTimerBehaviors
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  [WeakRetained invalidateIdleTimerBehaviors];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_pipDefaultContentSizeResetTimer, 0);
  objc_storeStrong((id *)&self->_analyticsHelper, 0);
  objc_storeStrong((id *)&self->_pegasusController, 0);
  objc_storeStrong((id *)&self->_presentedExpanseBanners, 0);
  objc_destroyWeak((id *)&self->_pipController);
}

void __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to ensure switcher inclusion for scene %{public}@", (uint8_t *)&v3, 0xCu);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_81_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to restore pip for application %{public}@ scene %{public}@.", (uint8_t *)&v4, 0x16u);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_82_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to stop PIP for %{public}@ cancelling.", (uint8_t *)&v3, 0xCu);
}

@end