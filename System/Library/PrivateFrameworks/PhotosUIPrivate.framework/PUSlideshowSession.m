@interface PUSlideshowSession
- (BOOL)_disablingIdleTimer;
- (BOOL)didStartOnce;
- (NSUUID)uuid;
- (OKPresentationViewController)presentationViewController;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)fetchResult;
- (PUSlideshowSession)init;
- (PUSlideshowSession)initWithFetchResult:(id)a3 assetCollection:(id)a4;
- (PUSlideshowSession)initWithFetchResult:(id)a3 assetCollection:(id)a4 startIndex:(unint64_t)a5;
- (PUSlideshowSettingsViewModel)settingsViewModel;
- (PUSlideshowViewModel)viewModel;
- (id)_disablingIdleTimerToken;
- (id)_resolutionSizes;
- (int64_t)currentState;
- (void)_addCurrentSettingsToPayload:(id)a3;
- (void)_beginDisablingIdleTimer;
- (void)_configurePresentationViewController:(id)a3;
- (void)_distributeSlideshowDisplayContextWithPresentationController:(id)a3;
- (void)_endDisablingIdleTimerIfNecessary;
- (void)_setDisablingIdleTimer:(BOOL)a3;
- (void)_setDisablingIdleTimerToken:(id)a3;
- (void)_slideshowSettingsViewModel:(id)a3 didChange:(id)a4;
- (void)_slideshowViewModel:(id)a3 didChange:(id)a4;
- (void)_updateCurrentState;
- (void)dealloc;
- (void)registerSlideshowDisplayContext:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setDidStartOnce:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)unregisterSlideshowDisplayContext:(id)a3;
- (void)updatePresentationViewController;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUSlideshowSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->__disablingIdleTimerToken, 0);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_settingsViewModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_contextRegistry, 0);
  objc_storeStrong((id *)&self->_mediaFeeder, 0);
}

- (void)setDidStartOnce:(BOOL)a3
{
  self->_didStartOnce = a3;
}

- (BOOL)didStartOnce
{
  return self->_didStartOnce;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)_setDisablingIdleTimerToken:(id)a3
{
}

- (id)_disablingIdleTimerToken
{
  return self->__disablingIdleTimerToken;
}

- (BOOL)_disablingIdleTimer
{
  return self->__disablingIdleTimer;
}

- (OKPresentationViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (PUSlideshowSettingsViewModel)settingsViewModel
{
  return self->_settingsViewModel;
}

- (PUSlideshowViewModel)viewModel
{
  return self->_viewModel;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void)_endDisablingIdleTimerIfNecessary
{
  id v4 = [(PUSlideshowSession *)self _disablingIdleTimerToken];
  if (v4)
  {
    v3 = [MEMORY[0x1E4F8FFA8] sharedState];
    [v3 endDisablingIdleTimer:v4];

    [(PUSlideshowSession *)self _setDisablingIdleTimerToken:0];
  }
}

- (void)_beginDisablingIdleTimer
{
  v3 = [(PUSlideshowSession *)self _disablingIdleTimerToken];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F8FFA8] sharedState];
    id v5 = [v4 beginDisablingIdleTimerForReason:@"Slideshow (PUSlideshowSession)"];

    [(PUSlideshowSession *)self _setDisablingIdleTimerToken:v5];
  }
}

- (void)_setDisablingIdleTimer:(BOOL)a3
{
  if (self->__disablingIdleTimer != a3)
  {
    self->__disablingIdleTimer = a3;
    if (a3) {
      [(PUSlideshowSession *)self _beginDisablingIdleTimer];
    }
    else {
      [(PUSlideshowSession *)self _endDisablingIdleTimerIfNecessary];
    }
  }
}

- (void)_slideshowSettingsViewModel:(id)a3 didChange:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v6 = (PUSlideshowSettingsViewModel *)a3;
  id v7 = a4;
  if (self->_settingsViewModel == v6)
  {
    +[PUSlideshowSettingsPersistency saveSlideshowSettingsViewModel:v6];
    if ([v7 presetDidChange])
    {
      viewModel = self->_viewModel;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__PUSlideshowSession__slideshowSettingsViewModel_didChange___block_invoke;
      v14[3] = &unk_1E5F2ED10;
      v14[4] = self;
      [(PUViewModel *)viewModel performChanges:v14];
    }
    if ([v7 mediaItemDidChange])
    {
      v9 = [(PUSlideshowSettingsViewModel *)v6 mediaItem];
      v10 = [v9 audioURL];

      presentationViewController = self->_presentationViewController;
      if (v10)
      {
        v15[0] = v10;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        [(OKPresentationViewController *)presentationViewController setAudioURLs:v12];
      }
      else
      {
        [(OKPresentationViewController *)self->_presentationViewController setAudioURLs:0];
      }
    }
    if ([v7 stepDurationDidChange])
    {
      v13 = self->_presentationViewController;
      [(PUSlideshowSettingsViewModel *)v6 stepDuration];
      -[OKPresentationViewController setCouchModeDefaultStepDuration:](v13, "setCouchModeDefaultStepDuration:");
    }
    if ([v7 shouldRepeatDidChange]) {
      [(OKPresentationViewController *)self->_presentationViewController setCouchModeLoops:[(PUSlideshowSettingsViewModel *)v6 shouldRepeat]];
    }
  }
}

uint64_t __60__PUSlideshowSession__slideshowSettingsViewModel_didChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setCurrentState:1];
}

- (void)_slideshowViewModel:(id)a3 didChange:(id)a4
{
  v9 = (PUSlideshowViewModel *)a3;
  id v7 = a4;
  if (self->_viewModel != v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUSlideshowSession.m" lineNumber:322 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ([v7 currentStateDidChange]) {
    [(PUSlideshowSession *)self _invalidateCurrentState];
  }
}

- (void)_updateCurrentState
{
  id v3 = [(PUSlideshowSession *)self viewModel];
  -[PUSlideshowSession setCurrentState:](self, "setCurrentState:", [v3 currentState]);
}

- (void)_addCurrentSettingsToPayload:(id)a3
{
  id v4 = a3;
  id v16 = [(PUSlideshowSession *)self settingsViewModel];
  id v5 = [v16 preset];
  v6 = [v5 audioURLs];
  if ([v6 count] == 1)
  {
    id v7 = [v6 firstObject];
    v8 = [v7 scheme];
    int v9 = [v8 isEqualToString:@"opus-producer"];

    if (v9)
    {
      v10 = [v7 absoluteString];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = [v5 uniqueIdentifier];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F90BF8]];

  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F90BD0]];
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F90BE0]];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "shouldRepeat"));
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F90BE8]];

  v14 = NSNumber;
  [v16 stepDuration];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F90BD8]];
}

- (void)setCurrentState:(int64_t)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  int64_t currentState = self->_currentState;
  if (currentState == a3) {
    return;
  }
  self->_int64_t currentState = a3;
  [(PUSlideshowSession *)self _setDisablingIdleTimer:(unint64_t)(a3 - 1) < 2];
  int64_t v5 = self->_currentState;
  if ((unint64_t)(v5 - 5) < 2)
  {
    [(PUSlideshowSession *)self setDidStartOnce:0];
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:7];
    v12 = [(PUSlideshowSession *)self uuid];
    [v23 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F90BF0]];

    if (self->_currentState == 5) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    v14 = [NSNumber numberWithInteger:v13];
    [v23 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F90C00]];

    [(PUSlideshowSession *)self _addCurrentSettingsToPayload:v23];
    v15 = (void *)MEMORY[0x1E4F56658];
    id v16 = (void *)MEMORY[0x1E4F90BA8];
    goto LABEL_11;
  }
  if (v5 == 3)
  {
    v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v7 = *MEMORY[0x1E4F90BB0];
    uint64_t v24 = *MEMORY[0x1E4F90BF0];
    v8 = [(PUSlideshowSession *)self uuid];
    v25 = v8;
    int v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = &v25;
    v11 = &v24;
    goto LABEL_15;
  }
  if (v5 != 2) {
    return;
  }
  if (currentState == 3)
  {
    v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v7 = *MEMORY[0x1E4F90BB8];
    uint64_t v26 = *MEMORY[0x1E4F90BF0];
    v8 = [(PUSlideshowSession *)self uuid];
    v27[0] = v8;
    int v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = (void **)v27;
    v11 = &v26;
LABEL_15:
    v17 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
    [v6 sendEvent:v7 withPayload:v17];

    return;
  }
  if (![(PUSlideshowSession *)self didStartOnce])
  {
    [(PUSlideshowSession *)self setDidStartOnce:1];
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
    v18 = [(PUSlideshowSession *)self uuid];
    [v23 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F90BF0]];

    id v19 = objc_alloc(MEMORY[0x1E4F91230]);
    v20 = [(PUSlideshowSession *)self fetchResult];
    v21 = (void *)[v19 initWithAssetFetchResult:v20];
    [v23 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F90BC8]];

    v22 = [(PUSlideshowSession *)self assetCollection];
    [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F56548]];

    [(PUSlideshowSession *)self _addCurrentSettingsToPayload:v23];
    v15 = (void *)MEMORY[0x1E4F56658];
    id v16 = (void *)MEMORY[0x1E4F90BC0];
LABEL_11:
    [v15 sendEvent:*v16 withPayload:v23];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PUSlideshowSession *)self _slideshowViewModel:v7 didChange:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PUSlideshowSession *)self _slideshowSettingsViewModel:v7 didChange:v6];
    }
  }
}

- (void)_configurePresentationViewController:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setCouchInitialDelay:0.0];
  [(PUSlideshowSettingsViewModel *)self->_settingsViewModel stepDuration];
  objc_msgSend(v4, "setCouchModeDefaultStepDuration:");
  objc_msgSend(v4, "setCouchModeLoops:", -[PUSlideshowSettingsViewModel shouldRepeat](self->_settingsViewModel, "shouldRepeat"));
  int64_t v5 = [(PUSlideshowSettingsViewModel *)self->_settingsViewModel mediaItem];
  id v6 = [v5 audioURL];

  if (v6)
  {
    v20[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v4 setAudioURLs:v7];
  }
  else
  {
    [v4 setAudioURLs:0];
  }
  v8 = +[PUSlideshowSettings sharedInstance];
  objc_msgSend(v4, "setInteractivityEnabled:", objc_msgSend(v8, "allowUserInteractivity"));

  int v9 = +[PUSlideshowSettings sharedInstance];
  char v10 = [v9 transitionSettingsAreDefaults];

  if ((v10 & 1) == 0)
  {
    v11 = +[PUSlideshowSettings sharedInstance];
    [v11 interactiveTransitionFingerTrackingBoxRadiusDefaultValue];
    double v13 = v12;

    [(OKPresentationViewController *)self->_presentationViewController setInteractiveTransitionTrackingBoxRadius:v13];
    v14 = +[PUSlideshowSettings sharedInstance];
    [v14 interactiveTransitionProgressThresholdDefaultValue];
    double v16 = v15;

    [(OKPresentationViewController *)self->_presentationViewController setInteractiveTransitionProgressThreshold:v16];
    v17 = +[PUSlideshowSettings sharedInstance];
    [v17 interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue];
    double v19 = v18;

    [(OKPresentationViewController *)self->_presentationViewController setInteractiveTransitionVelocityThreshold:v19];
  }
}

- (id)_resolutionSizes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 320.0, 568.0);
  id v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 568.0, 320.0);
  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 768.0, 1024.0);
  int64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 1024.0, 768.0);
  id v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 1920.0, 1080.0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (void)unregisterSlideshowDisplayContext:(id)a3
{
  id v4 = a3;
  if (-[PUSlideshowContextRegistry removeDisplayContext:](self->_contextRegistry, "removeDisplayContext:"))
  {
    [v4 slideshowSession:self stopDisplayingPresentationViewController:self->_presentationViewController];
    [(PUSlideshowSession *)self _distributeSlideshowDisplayContextWithPresentationController:self->_presentationViewController];
  }
}

- (void)registerSlideshowDisplayContext:(id)a3
{
  if ([(PUSlideshowContextRegistry *)self->_contextRegistry addDisplayContext:a3])
  {
    presentationViewController = self->_presentationViewController;
    [(PUSlideshowSession *)self _distributeSlideshowDisplayContextWithPresentationController:presentationViewController];
  }
}

- (void)_distributeSlideshowDisplayContextWithPresentationController:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v5 = (OKPresentationViewController *)a3;
  id v6 = self->_presentationViewController;
  if (self->_presentationViewController != v5) {
    objc_storeStrong((id *)&self->_presentationViewController, a3);
  }
  if (([(OKPresentationViewController *)v6 isPaused] & 1) == 0) {
    [(OKPresentationViewController *)v6 instantPause];
  }
  id v7 = [(PUSlideshowContextRegistry *)self->_contextRegistry displayContexts];
  v8 = [(PUSlideshowContextRegistry *)self->_contextRegistry currentDisplayContext];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v13++) slideshowSession:self stopDisplayingPresentationViewController:v6];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __83__PUSlideshowSession__distributeSlideshowDisplayContextWithPresentationController___block_invoke;
  v15[3] = &unk_1E5F2ECC8;
  id v16 = v8;
  v17 = self;
  id v14 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

uint64_t __83__PUSlideshowSession__distributeSlideshowDisplayContextWithPresentationController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) slideshowSession:*(void *)(a1 + 40) startDisplayingPresentationViewController:*(void *)(*(void *)(a1 + 40) + 72)];
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 56) currentState];
  if (result == 2)
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 72);
    return [v3 instantPlay];
  }
  return result;
}

- (void)updatePresentationViewController
{
  currentPreset = self->_currentPreset;
  id v4 = [(PUSlideshowSettingsViewModel *)self->_settingsViewModel preset];
  LOBYTE(currentPreset) = [(OKProducerPreset *)currentPreset isEqual:v4];

  if ((currentPreset & 1) == 0)
  {
    int64_t v5 = [(PUSlideshowSettingsViewModel *)self->_settingsViewModel preset];
    id v6 = self->_currentPreset;
    self->_currentPreset = v5;

    id v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = [getOKPresentationGuidelineClass() guidelineLiveAuthoringEnabled:1];
    [v7 addObject:v8];
    id OKPresentationGuidelineClass = getOKPresentationGuidelineClass();
    uint64_t v10 = [(PUSlideshowSession *)self _resolutionSizes];
    uint64_t v11 = [OKPresentationGuidelineClass guidelineAuthoringRecommendedResolutionSizes:v10];

    [v7 addObject:v11];
    if ([MEMORY[0x1E4F90448] shouldDisplayTitleOfAssetCollection:self->_assetCollection])
    {
      uint64_t v12 = [(PHAssetCollection *)self->_assetCollection localizedTitle];
      uint64_t v13 = [getOKPresentationGuidelineClass() guidelineAuthoringTitle:v12];

      if (v13) {
        [v7 addObject:v13];
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x2050000000;
    id v14 = (void *)getOKPresentationViewControllerClass_softClass;
    uint64_t v22 = getOKPresentationViewControllerClass_softClass;
    if (!getOKPresentationViewControllerClass_softClass)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __getOKPresentationViewControllerClass_block_invoke;
      v18[3] = &unk_1E5F2E228;
      v18[4] = &v19;
      __getOKPresentationViewControllerClass_block_invoke((uint64_t)v18);
      id v14 = (void *)v20[3];
    }
    double v15 = v14;
    _Block_object_dispose(&v19, 8);
    id v16 = (void *)[[v15 alloc] initWithPreset:self->_currentPreset guidelines:v7 mediaFeeder:self->_mediaFeeder];
    v17 = +[PUSlideshowSettings sharedInstance];
    [v17 setCurrentPreset:self->_currentPreset];

    [(PUSlideshowSession *)self _configurePresentationViewController:v16];
    [(PUSlideshowSession *)self _distributeSlideshowDisplayContextWithPresentationController:v16];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v24 = a4;
  int64_t v5 = NSStringFromSelector(sel_allowUserInteractivity);
  int v6 = [v24 isEqual:v5];

  if (v6)
  {
    presentationViewController = self->_presentationViewController;
    v8 = +[PUSlideshowSettings sharedInstance];
    -[OKPresentationViewController setInteractivityEnabled:](presentationViewController, "setInteractivityEnabled:", [v8 allowUserInteractivity]);
  }
  else
  {
    id v9 = NSStringFromSelector(sel_interactiveTransitionFingerTrackingBoxRadiusDefaultValue);
    int v10 = [v24 isEqual:v9];

    if (v10)
    {
      uint64_t v11 = +[PUSlideshowSettings sharedInstance];
      [v11 interactiveTransitionFingerTrackingBoxRadiusDefaultValue];
      double v13 = v12;

      [(OKPresentationViewController *)self->_presentationViewController setInteractiveTransitionTrackingBoxRadius:v13];
    }
    else
    {
      id v14 = NSStringFromSelector(sel_interactiveTransitionProgressThresholdDefaultValue);
      int v15 = [v24 isEqual:v14];

      if (v15)
      {
        id v16 = +[PUSlideshowSettings sharedInstance];
        [v16 interactiveTransitionProgressThresholdDefaultValue];
        double v18 = v17;

        [(OKPresentationViewController *)self->_presentationViewController setInteractiveTransitionProgressThreshold:v18];
      }
      else
      {
        uint64_t v19 = NSStringFromSelector(sel_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue);
        int v20 = [v24 isEqual:v19];

        if (v20)
        {
          uint64_t v21 = +[PUSlideshowSettings sharedInstance];
          [v21 interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue];
          double v23 = v22;

          [(OKPresentationViewController *)self->_presentationViewController setInteractiveTransitionVelocityThreshold:v23];
        }
      }
    }
  }
}

- (void)dealloc
{
  [(PUSlideshowViewModel *)self->_viewModel unregisterChangeObserver:self];
  [(PUSlideshowSettingsViewModel *)self->_settingsViewModel unregisterChangeObserver:self];
  [(PUSlideshowSession *)self _endDisablingIdleTimerIfNecessary];
  [(OKPresentationViewController *)self->_presentationViewController forceCleanup];
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSession;
  [(PUSlideshowSession *)&v3 dealloc];
}

- (PUSlideshowSession)initWithFetchResult:(id)a3 assetCollection:(id)a4
{
  return [(PUSlideshowSession *)self initWithFetchResult:a3 assetCollection:a4 startIndex:0];
}

- (PUSlideshowSession)initWithFetchResult:(id)a3 assetCollection:(id)a4 startIndex:(unint64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PUSlideshowSession.m", 62, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
  }
  if ([v10 count] <= a5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PUSlideshowSession.m", 63, @"Invalid parameter not satisfying: %@", @"startIndex < [fetchResult count]" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)PUSlideshowSession;
  double v12 = [(PUSlideshowSession *)&v31 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_fetchResult, a3);
    objc_storeStrong((id *)&v12->_assetCollection, a4);
    int v15 = [[PUSlideshowViewModel alloc] initWithAssetCollection:v12->_assetCollection];
    viewModel = v12->_viewModel;
    v12->_viewModel = v15;

    [(PUSlideshowViewModel *)v12->_viewModel registerChangeObserver:v12];
    uint64_t v17 = +[PUSlideshowSettingsPersistency createSlideshowSettingsViewModel];
    settingsViewModel = v12->_settingsViewModel;
    v12->_settingsViewModel = (PUSlideshowSettingsViewModel *)v17;

    [(PUSlideshowSettingsViewModel *)v12->_settingsViewModel registerChangeObserver:v12];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    uint64_t v19 = (void *)getOKMediaFeederPhotoKitClass_softClass;
    uint64_t v36 = getOKMediaFeederPhotoKitClass_softClass;
    if (!getOKMediaFeederPhotoKitClass_softClass)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __getOKMediaFeederPhotoKitClass_block_invoke;
      v32[3] = &unk_1E5F2E228;
      v32[4] = &v33;
      __getOKMediaFeederPhotoKitClass_block_invoke((uint64_t)v32);
      uint64_t v19 = (void *)v34[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v33, 8);
    uint64_t v21 = [v20 mediaFeederWithFetchResult:v10];
    mediaFeeder = v12->_mediaFeeder;
    v12->_mediaFeeder = (OKMediaFeederPhotoKit *)v21;

    [(OKMediaFeederPhotoKit *)v12->_mediaFeeder setStartIndex:a5];
    [(OKMediaFeederPhotoKit *)v12->_mediaFeeder setRotationEnabled:0];
    double v23 = objc_alloc_init(PUSlideshowContextRegistry);
    contextRegistry = v12->_contextRegistry;
    v12->_contextRegistry = v23;

    [(PUSlideshowSession *)v12 _updateCurrentState];
    v25 = [MEMORY[0x1E4F905E0] sharedScheduler];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __69__PUSlideshowSession_initWithFetchResult_assetCollection_startIndex___block_invoke;
    v29[3] = &unk_1E5F2ED10;
    v30 = v12;
    [v25 scheduleMainQueueTask:v29];
  }
  return v12;
}

void __69__PUSlideshowSession_initWithFetchResult_assetCollection_startIndex___block_invoke(uint64_t a1)
{
  id v2 = +[PUSlideshowSettings sharedInstance];
  [v2 addKeyObserver:*(void *)(a1 + 32)];
}

- (PUSlideshowSession)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PUSlideshowSession.m", 57, @"%@ must be created with the designated initilizer", objc_opt_class() object file lineNumber description];

  return [(PUSlideshowSession *)self initWithFetchResult:0 assetCollection:0 startIndex:0];
}

@end