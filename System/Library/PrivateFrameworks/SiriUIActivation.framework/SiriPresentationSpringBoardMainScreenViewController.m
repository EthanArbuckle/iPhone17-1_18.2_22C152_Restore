@interface SiriPresentationSpringBoardMainScreenViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shareHomeGesture;
- (BOOL)shouldDismissForSwipesOutsideContent;
- (BOOL)shouldDismissForTapOutsideContent;
- (BOOL)shouldDismissForTapsOutsideContent;
- (BOOL)shouldDismissForTransientOverlayForBundleIdentifier:(id)a3;
- (BOOL)shouldPassTapsThrough;
- (BOOL)shouldPassTouchesThroughToSpringBoard;
- (BOOL)showAppsBehindSiri;
- (BOOL)tapsOutsideContentDismissAssistant;
- (SiriPresentationSpringBoardMainScreenViewController)init;
- (SiriPresentationSpringBoardMainScreenViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4;
- (int64_t)inputType;
- (void)cancelPreheat;
- (void)loadView;
- (void)noteFluidDismissalCompletedWithSuccess:(BOOL)a3;
- (void)preheatWithOptions:(id)a3;
- (void)presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4;
- (void)requestPasscodeUnlockWithCompletion:(id)a3;
- (void)requestStatusBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)resetGestureBehaviors;
- (void)setDockFrame:(CGRect)a3;
- (void)setFluidDismissalState:(id)a3;
- (void)setInputType:(int64_t)a3;
- (void)setShareHomeGesture:(BOOL)a3;
- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3;
- (void)setShouldDismissForTapOutsideContent:(BOOL)a3;
- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3;
- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3;
- (void)setShowsStatusBar:(BOOL)a3;
- (void)setSystemApertureFrames:(id)a3;
- (void)visionIntelligenceDropletLaunchAnimationDidFinish:(BOOL)a3 retargeted:(BOOL)a4;
@end

@implementation SiriPresentationSpringBoardMainScreenViewController

- (SiriPresentationSpringBoardMainScreenViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
  v4 = -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](&v7, sel_initWithIdentifier_hostedPresentationFrame_, a3, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  v5 = v4;
  if (v4)
  {
    [(SiriPresentationSpringBoardMainScreenViewController *)v4 resetGestureBehaviors];
    [(SiriPresentationViewController *)v5 prewarmMetalLayers];
  }
  return v5;
}

- (SiriPresentationSpringBoardMainScreenViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
  v2 = -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](&v7, sel_initWithIdentifier_hostedPresentationFrame_, 1, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  v3 = v2;
  if (v2)
  {
    [(SiriPresentationSpringBoardMainScreenViewController *)v2 resetGestureBehaviors];
    [(SiriPresentationViewController *)v3 prewarmMetalLayers];
    v4 = objc_alloc_init(_TtC16SiriUIActivation37SiriQuickTypeGestureActivationManager);
    quickTypeGestureActivationManager = v3->_quickTypeGestureActivationManager;
    v3->_quickTypeGestureActivationManager = v4;
  }
  return v3;
}

- (void)resetGestureBehaviors
{
  int v3 = [MEMORY[0x263F286B8] isSAEEnabled];
  uint64_t v4 = (SiriUIDeviceIsPad() | v3) ^ 1;
  [(SiriPresentationSpringBoardMainScreenViewController *)self setShouldDismissForTapOutsideContent:v4];
  [(SiriPresentationSpringBoardMainScreenViewController *)self setShouldDismissForTapsOutsideContent:v4];
  [(SiriPresentationSpringBoardMainScreenViewController *)self setShouldDismissForSwipesOutsideContent:v4];
  [(SiriPresentationSpringBoardMainScreenViewController *)self setShouldPassTouchesThroughToSpringBoard:SiriUIDeviceIsPad() | v3];
  uint64_t v5 = SiriUIDeviceIsPad() & (v3 ^ 1);
  [(SiriPresentationSpringBoardMainScreenViewController *)self setShareHomeGesture:v5];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F28840]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setOpaque:0];
  [(SiriPresentationSpringBoardMainScreenViewController *)self setView:v4];
}

- (void)requestPasscodeUnlockWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SiriPresentationViewController *)self siriViewController];
  if (v5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __91__SiriPresentationSpringBoardMainScreenViewController_requestPasscodeUnlockWithCompletion___block_invoke;
    v6[3] = &unk_2645BCE98;
    id v7 = v4;
    [v5 handlePasscodeUnlockWithCompletion:v6];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
  }
}

uint64_t __91__SiriPresentationSpringBoardMainScreenViewController_requestPasscodeUnlockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      unsigned int v3 = 1;
    }
    else {
      unsigned int v3 = 2;
    }
    if (a2) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

- (void)setShowsStatusBar:(BOOL)a3
{
}

- (void)requestStatusBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(SiriPresentationViewController *)self siriViewController];
  [v9 requestStatusBarVisible:v6 animated:v5 completion:v8];
}

- (void)setFluidDismissalState:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  SiriUIInvokeOnMainQueue();
}

void __78__SiriPresentationSpringBoardMainScreenViewController_setFluidDismissalState___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 976) = *(void *)(a1 + 40) != 0;
  id v2 = [*(id *)(a1 + 32) siriViewController];
  [v2 setFluidDismissalState:*(void *)(a1 + 40)];
}

- (void)noteFluidDismissalCompletedWithSuccess:(BOOL)a3
{
}

void __94__SiriPresentationSpringBoardMainScreenViewController_noteFluidDismissalCompletedWithSuccess___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriViewController];
  [v2 noteFluidDismissalCompletedWithSuccess:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)shouldDismissForTapOutsideContent
{
  return self->_shouldDismissForTapOutsideContent;
}

- (BOOL)shouldDismissForTapsOutsideContent
{
  return self->_shouldDismissForTapsOutsideContent;
}

- (BOOL)shouldDismissForTransientOverlayForBundleIdentifier:(id)a3
{
  return 0;
}

- (void)setShouldDismissForTapOutsideContent:(BOOL)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  BOOL v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __92__SiriPresentationSpringBoardMainScreenViewController_setShouldDismissForTapOutsideContent___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1464] = *(unsigned char *)(a1 + 40);
    BOOL v6 = WeakRetained;
    id v3 = [WeakRetained siriPresentationControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if (v4)
    {
      BOOL v5 = [v6 siriPresentationControllerDelegate];
      [v5 siriPresentation:v6 didUpdateShouldDismissForTapOutsideContentTo:v6[1464]];

      WeakRetained = v6;
    }
  }
}

- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  BOOL v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __93__SiriPresentationSpringBoardMainScreenViewController_setShouldDismissForTapsOutsideContent___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1465] = *(unsigned char *)(a1 + 40);
    BOOL v6 = WeakRetained;
    id v3 = [WeakRetained siriPresentationControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if (v4)
    {
      BOOL v5 = [v6 siriPresentationControllerDelegate];
      [v5 siriPresentation:v6 didUpdateShouldDismissForTapsOutsideContent:v6[1465]];

      WeakRetained = v6;
    }
  }
}

- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  BOOL v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __95__SiriPresentationSpringBoardMainScreenViewController_setShouldDismissForSwipesOutsideContent___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1483] = *(unsigned char *)(a1 + 40);
    BOOL v6 = WeakRetained;
    id v3 = [WeakRetained siriPresentationControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if (v4)
    {
      BOOL v5 = [v6 siriPresentationControllerDelegate];
      [v5 siriPresentation:v6 didUpdateShouldDismissForSwipesOutsideContent:v6[1483]];

      WeakRetained = v6;
    }
  }
}

- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  BOOL v5 = a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __96__SiriPresentationSpringBoardMainScreenViewController_setShouldPassTouchesThroughToSpringBoard___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1482] = *(unsigned char *)(a1 + 40);
    BOOL v6 = WeakRetained;
    id v3 = [WeakRetained siriPresentationControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if (v4)
    {
      BOOL v5 = [v6 siriPresentationControllerDelegate];
      [v5 siriPresentation:v6 didUpdateShouldPassTouchesThroughToSpringBoard:v6[1482]];

      WeakRetained = v6;
    }
  }
}

- (void)setShareHomeGesture:(BOOL)a3
{
  if ((SiriUIDeviceIsPad() & 1) != 0 || [MEMORY[0x263F286B8] isSAEEnabled])
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v5, &location);
    BOOL v6 = a3;
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __75__SiriPresentationSpringBoardMainScreenViewController_setShareHomeGesture___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1484] = *(unsigned char *)(a1 + 40);
    char v4 = [WeakRetained siriPresentationControllerDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v6 = [v3 siriPresentationControllerDelegate];
      [v6 siriPresentation:v3 didUpdateHomeGestureSharing:v3[1484]];

      id v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        id v8 = @"shared";
        if (!*(unsigned char *)(a1 + 40)) {
          id v8 = @"not shared";
        }
        int v9 = 136315394;
        v10 = "-[SiriPresentationSpringBoardMainScreenViewController setShareHomeGesture:]_block_invoke";
        __int16 v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_221664000, v7, OS_LOG_TYPE_DEFAULT, "%s #compact: Telling SpringBoard that the Home Gesture is %@ with Siri", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (void)setInputType:(int64_t)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(v4, &location);
  v4[1] = (id)a3;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __68__SiriPresentationSpringBoardMainScreenViewController_setInputType___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[186] = *(void *)(a1 + 40);
    BOOL v6 = WeakRetained;
    id v3 = [WeakRetained siriPresentationControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    WeakRetained = v6;
    if (v4)
    {
      char v5 = [v6 siriPresentationControllerDelegate];
      [v5 siriPresentation:v6 didUpdateInputType:v6[186]];

      WeakRetained = v6;
    }
  }
}

- (void)setDockFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = [(SiriPresentationViewController *)self siriViewController];
  if ([(SiriPresentationSpringBoardMainScreenViewController *)self showAppsBehindSiri])
  {
    id v8 = [(SiriPresentationSpringBoardMainScreenViewController *)self view];
    int v9 = [v18 view];
    objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  objc_msgSend(v18, "setDockFrame:", v11, v13, v15, v17);
}

- (void)setSystemApertureFrames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriPresentationViewController *)self presentationState] == 2
    || [(SiriPresentationViewController *)self presentationState] == 1
    || [(SiriPresentationViewController *)self presentationState] == 4)
  {
    char v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      double v17 = "-[SiriPresentationSpringBoardMainScreenViewController setSystemApertureFrames:]";
      _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: received system aperture frames", (uint8_t *)&v16, 0xCu);
    }
    if ([v4 count])
    {
      BOOL v6 = [v4 firstObject];
      [v6 CGRectValue];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      double v15 = [(SiriPresentationViewController *)self siriViewController];
      objc_msgSend(v15, "setSystemApertureFrame:", v8, v10, v12, v14);
    }
  }
}

- (BOOL)showAppsBehindSiri
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 alwaysObscureBackgroundContentWhenActive] ^ 1;

  return v3;
}

- (void)visionIntelligenceDropletLaunchAnimationDidFinish:(BOOL)a3 retargeted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(SiriPresentationViewController *)self siriViewController];
  [v6 visionIntelligenceDropletLaunchAnimationDidFinish:v5 retargeted:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preheatWithOptions:(id)a3
{
  id v4 = a3;
  if ([v4 requestSource] == 47)
  {
    if (SiriUIDeviceIsPad() & 1) == 0 && ([v4 lockState])
    {
      double v13 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
        -[SiriPresentationSpringBoardMainScreenViewController preheatWithOptions:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
      [(SiriQuickTypeGestureActivationManager *)self->_quickTypeGestureActivationManager prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:&__block_literal_global_1];
    }
    else
    {
      BOOL v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
        -[SiriPresentationSpringBoardMainScreenViewController preheatWithOptions:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
    [(SiriPresentationViewController *)&v21 preheatWithOptions:v4];
  }
}

void __74__SiriPresentationSpringBoardMainScreenViewController_preheatWithOptions___block_invoke()
{
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    __74__SiriPresentationSpringBoardMainScreenViewController_preheatWithOptions___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)cancelPreheat
{
}

void __68__SiriPresentationSpringBoardMainScreenViewController_cancelPreheat__block_invoke()
{
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    __68__SiriPresentationSpringBoardMainScreenViewController_cancelPreheat__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ((SiriUIDeviceIsPad() & 1) != 0 || [v7 requestSource] != 47)
  {
LABEL_6:
    v20.receiver = self;
    v20.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
    [(SiriPresentationViewController *)&v20 presentationRequestedWithPresentationOptions:v6 requestOptions:v7];
    goto LABEL_7;
  }
  char v8 = [v7 currentLockState];
  uint64_t v9 = *MEMORY[0x263F28348];
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      -[SiriPresentationSpringBoardMainScreenViewController presentationRequestedWithPresentationOptions:requestOptions:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SiriPresentationSpringBoardMainScreenViewController presentationRequestedWithPresentationOptions:requestOptions:]";
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #quickTypeGate presentation requested for quick type gesture while on lock screen -> gating on presence of face", buf, 0xCu);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  started = (void *)SRUIFInstrumentQuickTypeFaceDetectionGateStartSignpost();
  objc_initWeak((id *)buf, self);
  quickTypeGestureActivationManager = self->_quickTypeGestureActivationManager;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __115__SiriPresentationSpringBoardMainScreenViewController_presentationRequestedWithPresentationOptions_requestOptions___block_invoke;
  v21[3] = &unk_2645BCF80;
  v25[1] = started;
  v25[2] = *(id *)&Current;
  objc_copyWeak(v25, (id *)buf);
  id v22 = v6;
  id v23 = v7;
  v24 = self;
  [(SiriQuickTypeGestureActivationManager *)quickTypeGestureActivationManager canActivateWithCompletionHandler:v21];

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);
LABEL_7:
}

void __115__SiriPresentationSpringBoardMainScreenViewController_presentationRequestedWithPresentationOptions_requestOptions___block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  SRUIFInstrumentQuickTypeFaceDetectionGateEndSignpost();
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    double v11 = (Current - *(double *)(a1 + 72)) * 1000.0;
    uint64_t v12 = @"NO";
    uint64_t v15 = "-[SiriPresentationSpringBoardMainScreenViewController presentationRequestedWithPresentationOptions:requestOpti"
          "ons:]_block_invoke";
    *(_DWORD *)buf = 136315650;
    if (a2) {
      uint64_t v12 = @"YES";
    }
    __int16 v16 = 2048;
    double v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_debug_impl(&dword_221664000, v6, OS_LOG_TYPE_DEBUG, "%s #activation #quickTypeGate canActivate (face detection) completed in %.2fms with result %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 32);
      v13.receiver = *(id *)(a1 + 48);
      v13.super_class = (Class)SiriPresentationSpringBoardMainScreenViewController;
      objc_msgSendSuper2(&v13, sel_presentationRequestedWithPresentationOptions_requestOptions_, v9, v8);
    }
    else
    {
      uint64_t v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = "-[SiriPresentationSpringBoardMainScreenViewController presentationRequestedWithPresentationOptions:request"
              "Options:]_block_invoke";
        _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #quickTypeGate SiriQuickTypeGestureActivationManager determined Siri should not activate -> rejecting presentation", buf, 0xCu);
      }
      [WeakRetained _failedToPresentSiriWithError:0];
    }
  }
}

- (BOOL)tapsOutsideContentDismissAssistant
{
  return self->_tapsOutsideContentDismissAssistant;
}

- (BOOL)shouldPassTapsThrough
{
  return self->_shouldPassTapsThrough;
}

- (BOOL)shouldPassTouchesThroughToSpringBoard
{
  return self->_shouldPassTouchesThroughToSpringBoard;
}

- (BOOL)shouldDismissForSwipesOutsideContent
{
  return self->_shouldDismissForSwipesOutsideContent;
}

- (BOOL)shareHomeGesture
{
  return self->_shareHomeGesture;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void).cxx_destruct
{
}

- (void)preheatWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)preheatWithOptions:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__SiriPresentationSpringBoardMainScreenViewController_preheatWithOptions___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__SiriPresentationSpringBoardMainScreenViewController_cancelPreheat__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)presentationRequestedWithPresentationOptions:(uint64_t)a3 requestOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end