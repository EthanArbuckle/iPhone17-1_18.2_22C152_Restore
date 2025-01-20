@interface TVRUIHintsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldAllowHintsToPresent;
- (BOOL)_siriHintEnabled;
- (BOOL)_volumeHintEnabled;
- (BOOL)allowSiriHint;
- (BOOL)allowTips;
- (BOOL)allowVolumeHint;
- (BOOL)canPresentTip;
- (BOOL)hasPresentedContent;
- (BOOL)isPresentingTip;
- (BOOL)supportsSiri;
- (BOOL)supportsVolume;
- (CGAffineTransform)_gylphTransformForOrientation:(SEL)a3;
- (CGRect)_frameForUserIntentButtonPresented:(BOOL)a3;
- (CGRect)_frameForVolumeButtonsPresented:(BOOL)a3;
- (CGRect)tipSourceRect;
- (SBSHardwareButtonHintViewContentVisibilityControlling)siriHintVisibilityController;
- (SBSHardwareButtonHintViewContentVisibilityControlling)volumeHintVisibilityController;
- (TVRUIDeviceHardwareInfo)hardwareInfo;
- (TVRUIHintsGlyphView)siriGlyphView;
- (TVRUIHintsGlyphView)volumeGlyphView;
- (TVRUIHintsStyleProvider)styleProvider;
- (TVRUIHintsUserIntentButtonView)userIntentButtonHint;
- (TVRUIHintsViewController)init;
- (TVRUIHintsVolumeButtonsView)volumeButtonsHint;
- (TVRUITipManager)siriTipManager;
- (UIViewPropertyAnimator)dismissalAnimator;
- (UIViewPropertyAnimator)presentationAnimator;
- (double)lastAnimatedTimeInterval;
- (int64_t)currentInterfaceOrientation;
- (unint64_t)_permittedArrowDirectionsForDevice:(id)a3;
- (unint64_t)permittedArrowDirections;
- (void)_applyTransformForOrientation:(int64_t)a3;
- (void)_cleanupHints;
- (void)_dismissHintsWithCompletion:(id)a3;
- (void)_largeTextEnabledStatusChanged:(id)a3;
- (void)_presentVolumeButtonPressWithPresentation:(unint64_t)a3;
- (void)_setupDebugUIIfEnabled;
- (void)_setupTipsControllerIfNeeded;
- (void)_setupUserIntentButtonHintWithPresentation:(unint64_t)a3;
- (void)_setupVolumeButtonsHintWithPresentation:(unint64_t)a3;
- (void)_siriActivated:(id)a3;
- (void)_siriDeactivated:(id)a3;
- (void)_updateUserIntentButtonHintFrameForPresentation:(unint64_t)a3;
- (void)_updateVolumeButtonsHintFrameWithPresentation:(unint64_t)a3;
- (void)_volumeDownButtonPressed:(id)a3;
- (void)_volumeUpButtonPressed:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 supportsSiri:(BOOL)a4 volume:(BOOL)a5;
- (void)device:(id)a3 supportsVolume:(BOOL)a4;
- (void)devicePickerWillExpand;
- (void)dismissHints;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)remoteWillBeDismissed;
- (void)replayHints;
- (void)requestHintsForSiri:(BOOL)a3 volume:(BOOL)a4;
- (void)setAllowSiriHint:(BOOL)a3;
- (void)setAllowTips:(BOOL)a3;
- (void)setAllowVolumeHint:(BOOL)a3;
- (void)setDismissalAnimator:(id)a3;
- (void)setHardwareInfo:(id)a3;
- (void)setLastAnimatedTimeInterval:(double)a3;
- (void)setPresentationAnimator:(id)a3;
- (void)setPresentingTip:(BOOL)a3;
- (void)setSiriGlyphView:(id)a3;
- (void)setSiriHintVisibilityController:(id)a3;
- (void)setSiriTipManager:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setSupportsSiri:(BOOL)a3;
- (void)setSupportsVolume:(BOOL)a3;
- (void)setUserIntentButtonHint:(id)a3;
- (void)setVolumeButtonsHint:(id)a3;
- (void)setVolumeGlyphView:(id)a3;
- (void)setVolumeHintVisibilityController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TVRUIHintsViewController

- (TVRUIHintsViewController)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)TVRUIHintsViewController;
  v2 = [(TVRUIHintsViewController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 1;
    v2->_allowSiriHint = 1;
    v2->_allowVolumeHint = 1;
    v2->_allowTips = 1;
    v5 = +[TVRUIDeviceInfo currentDeviceInfo];
    if ([v5 isPad]) {
      uint64_t v4 = [(TVRUIHintsViewController *)v3 currentInterfaceOrientation];
    }
    uint64_t v6 = +[TVRUIHintsStyle styleProviderForUserInterfaceIdiom:hasHomeButton:](TVRUIHintsStyle, "styleProviderForUserInterfaceIdiom:hasHomeButton:", [v5 isPad], objc_msgSend(v5, "hasHomeButton"));
    styleProvider = v3->_styleProvider;
    v3->_styleProvider = (TVRUIHintsStyleProvider *)v6;

    v8 = _TVRUIHintsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3->_styleProvider;
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Style provider: %@", buf, 0xCu);
    }

    v10 = [v5 hardwareInfoForOrientation:v4];
    [(TVRUIHintsViewController *)v3 setHardwareInfo:v10];

    v11 = _TVRUIHintsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(TVRUIHintsViewController *)v3 hardwareInfo];
      v13 = [v12 description];
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Current hardwareInfo for device: %@", buf, 0xCu);
    }
    [(TVRUIHintsViewController *)v3 setLastAnimatedTimeInterval:0.0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)TVRUIHintsViewController;
  [(TVRUIHintsViewController *)&v9 viewDidLoad];
  v3 = [(TVRUIHintsViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  [(TVRUIHintsViewController *)self setDefinesPresentationContext:1];
  [(TVRUIHintsViewController *)self _applyTransformForOrientation:[(TVRUIHintsViewController *)self currentInterfaceOrientation]];
  [(TVRUIHintsViewController *)self _setupDebugUIIfEnabled];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__largeTextEnabledStatusChanged_ name:*MEMORY[0x263F83428] object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__siriActivated_ name:@"TVRUISiriManagerSiriActivated" object:0];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__siriDeactivated_ name:@"TVRUISiriManagerSiriDeactivated" object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__volumeUpButtonPressed_ name:@"TVRUIVolumeUpEventGenerated" object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__volumeDownButtonPressed_ name:@"TVRUIVolumeDownEventGenerated" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUIHintsViewController;
  [(TVRUIHintsViewController *)&v4 viewWillAppear:a3];
  [(TVRUIHintsViewController *)self _applyTransformForOrientation:[(TVRUIHintsViewController *)self currentInterfaceOrientation]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUIHintsViewController;
  [(TVRUIHintsViewController *)&v4 viewDidAppear:a3];
  if (+[TVRUIFeatures persistHintsUIEnabled]) {
    [(TVRUIHintsViewController *)self requestHintsForSiri:1 volume:1];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIHintsViewController;
  -[TVRUIHintsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(TVRUIHintsViewController *)self dismissHints];
  [(TVRUIHintsViewController *)self dismissPresentedContentAnimated:0 completion:0];
  [(TVRUIHintsViewController *)self _applyTransformForOrientation:[(TVRUIHintsViewController *)self currentInterfaceOrientation]];
}

- (void)dealloc
{
  [(TVRUIHintsViewController *)self dismissPresentedContentAnimated:0 completion:0];
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsViewController;
  [(TVRUIHintsViewController *)&v3 dealloc];
}

- (void)device:(id)a3 supportsSiri:(BOOL)a4 volume:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [(TVRUIHintsViewController *)self setSupportsSiri:v6];
  [(TVRUIHintsViewController *)self setSupportsVolume:v5];
  objc_super v9 = [v8 name];

  v10 = _TVRUIHintsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    v12 = v9;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewControllerDelegate callback deviceName='%@', supportsSiri=%{BOOL}d, supportsVolume=%{BOOL}d", (uint8_t *)&v11, 0x18u);
  }

  [(TVRUIHintsViewController *)self _setupTipsControllerIfNeeded];
  [(TVRUIHintsViewController *)self requestHintsForSiri:v6 volume:v5];
}

- (void)device:(id)a3 supportsVolume:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(TVRUIHintsViewController *)self setSupportsVolume:v4];
  double v7 = CACurrentMediaTime();
  [(TVRUIHintsViewController *)self lastAnimatedTimeInterval];
  double v8 = 0.0;
  if (v9 > 0.0)
  {
    [(TVRUIHintsViewController *)self lastAnimatedTimeInterval];
    double v8 = v7 - v10;
  }
  int v11 = _TVRUIHintsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    double v15 = v8;
    _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Elapsed time: %f", (uint8_t *)&v14, 0xCu);
  }

  if (v4 && v8 > 1.0)
  {
    v12 = _TVRUIHintsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [v6 name];
      int v14 = 138412546;
      double v15 = *(double *)&v13;
      __int16 v16 = 1024;
      int v17 = 1;
      _os_log_impl(&dword_227326000, v12, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewControllerDelegate callback deviceName='%@', supportsVolume=%{BOOL}d", (uint8_t *)&v14, 0x12u);
    }
    [(TVRUIHintsViewController *)self requestHintsForSiri:0 volume:1];
  }
}

- (void)devicePickerWillExpand
{
}

- (void)requestHintsForSiri:(BOOL)a3 volume:(BOOL)a4
{
  double v7 = [(TVRUIHintsViewController *)self styleProvider];
  [v7 animationPresentationDelay];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke;
  v10[3] = &unk_264800BD8;
  v10[4] = self;
  BOOL v11 = a3;
  BOOL v12 = a4;
  dispatch_after(v9, MEMORY[0x263EF83A0], v10);
}

void __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) _shouldAllowHintsToPresent]) {
    return;
  }
  if (*(unsigned char *)(a1 + 40)) {
    int v2 = [*(id *)(a1 + 32) _siriHintEnabled];
  }
  else {
    int v2 = 0;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    int v3 = [*(id *)(a1 + 32) _volumeHintEnabled];
    if (v2) {
      goto LABEL_12;
    }
LABEL_9:
    BOOL v4 = _TVRUIHintsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) allowSiriHint];
      double v7 = [*(id *)(a1 + 32) styleProvider];
      LODWORD(buf) = 67109632;
      HIDWORD(buf) = v5;
      __int16 v48 = 1024;
      int v49 = v6;
      __int16 v50 = 1024;
      int v51 = [v7 shouldShowSiriHint];
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Siri button hint not enabled, showSiri=%{BOOL}d, allowSiriHint=%{BOOL}d, shouldShowSiriHint=%{BOOL}d", (uint8_t *)&buf, 0x14u);
    }
    goto LABEL_12;
  }
  int v3 = 0;
  if ((v2 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_12:
  if (v3) {
    goto LABEL_16;
  }
  double v8 = _TVRUIHintsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(unsigned __int8 *)(a1 + 41);
    int v10 = [*(id *)(a1 + 32) allowVolumeHint];
    BOOL v11 = [*(id *)(a1 + 32) styleProvider];
    int v12 = [v11 shouldShowVolumeHint];
    LODWORD(buf) = 67109632;
    HIDWORD(buf) = v9;
    __int16 v48 = 1024;
    int v49 = v10;
    __int16 v50 = 1024;
    int v51 = v12;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Volume button hint not enabled, showVolumeHint=%{BOOL}d, allowVolumeHint=%{BOOL}d, shouldShowVolumeHint=%{BOOL}d", (uint8_t *)&buf, 0x14u);
  }
  if (v2)
  {
LABEL_16:
    [*(id *)(a1 + 32) _updateUserIntentButtonHintFrameForPresentation:0];
    [*(id *)(a1 + 32) _updateVolumeButtonsHintFrameWithPresentation:0];
    __int16 v13 = _TVRUIHintsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v2;
      __int16 v48 = 1024;
      int v49 = v3;
      _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Animating hints siri=%{BOOL}d, volume=%{BOOL}d", (uint8_t *)&buf, 0xEu);
    }

    int v14 = +[TVRUICubicSpringAnimator standardSpringAnimator];
    [*(id *)(a1 + 32) setPresentationAnimator:v14];

    double v15 = [*(id *)(a1 + 32) userIntentButtonHint];
    [v15 setHidden:0];

    __int16 v16 = [*(id *)(a1 + 32) userIntentButtonHint];
    [v16 setAlpha:0.0];

    [*(id *)(a1 + 32) _frameForUserIntentButtonPresented:0];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [*(id *)(a1 + 32) userIntentButtonHint];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    v26 = [*(id *)(a1 + 32) volumeButtonsHint];
    [v26 setHidden:0];

    v27 = [*(id *)(a1 + 32) volumeButtonsHint];
    [v27 setAlpha:0.0];

    [*(id *)(a1 + 32) _frameForVolumeButtonsPresented:0];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v36 = [*(id *)(a1 + 32) volumeButtonsHint];
    objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

    objc_initWeak(&buf, *(id *)(a1 + 32));
    v37 = [*(id *)(a1 + 32) presentationAnimator];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_25;
    v43[3] = &unk_264800B88;
    objc_copyWeak(&v44, &buf);
    char v45 = v3;
    char v46 = v2;
    [v37 addAnimations:v43];

    v38 = [*(id *)(a1 + 32) presentationAnimator];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_2;
    v41[3] = &unk_264800BB0;
    objc_copyWeak(&v42, &buf);
    [v38 addCompletion:v41];

    v39 = [*(id *)(a1 + 32) presentationAnimator];
    [v39 startAnimation];

    [*(id *)(a1 + 32) setLastAnimatedTimeInterval:CACurrentMediaTime()];
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&buf);
  }
  else
  {
    v40 = _TVRUIHintsLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_227326000, v40, OS_LOG_TYPE_DEFAULT, "Siri and Volume are not supported so don't show the hints", (uint8_t *)&buf, 2u);
    }
  }
}

void __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_25(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v23 = WeakRetained;
    if (*(unsigned char *)(a1 + 40))
    {
      int v3 = [WeakRetained volumeButtonsHint];
      [v3 setAlpha:1.0];

      [v23 _frameForVolumeButtonsPresented:1];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      int v12 = [v23 volumeButtonsHint];
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

      id WeakRetained = v23;
    }
    if (*(unsigned char *)(a1 + 41))
    {
      __int16 v13 = [v23 userIntentButtonHint];
      [v13 setAlpha:1.0];

      [v23 _frameForUserIntentButtonPresented:1];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [v23 userIntentButtonHint];
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

      id WeakRetained = v23;
    }
  }
}

void __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (a2)
    {
      [WeakRetained _cleanupHints];
    }
    else
    {
      double v4 = [WeakRetained styleProvider];
      [v4 animationDuration];
      objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel__dismissHintsWithCompletion_, 0);
    }
    id WeakRetained = v5;
  }
}

- (void)dismissHints
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = _TVRUIHintsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[TVRUIHintsViewController dismissHints]";
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(TVRUIHintsViewController *)self _dismissHintsWithCompletion:0];
}

- (void)remoteWillBeDismissed
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_227326000, v0, OS_LOG_TYPE_DEBUG, "Invalidating Siri tip", v1, 2u);
}

- (void)replayHints
{
  BOOL v3 = [(TVRUIHintsViewController *)self supportsSiri];
  BOOL v4 = [(TVRUIHintsViewController *)self supportsVolume];
  [(TVRUIHintsViewController *)self requestHintsForSiri:v3 volume:v4];
}

- (void)_updateUserIntentButtonHintFrameForPresentation:(unint64_t)a3
{
  id v5 = [(TVRUIHintsViewController *)self userIntentButtonHint];

  if (v5)
  {
    id v6 = [(TVRUIHintsViewController *)self userIntentButtonHint];
    [v6 setPresentation:a3];
  }
  else
  {
    [(TVRUIHintsViewController *)self _setupUserIntentButtonHintWithPresentation:a3];
  }
}

- (void)_setupUserIntentButtonHintWithPresentation:(unint64_t)a3
{
  id v5 = [(TVRUIHintsViewController *)self userIntentButtonHint];

  if (!v5)
  {
    id v6 = _TVRUIHintsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Setting up UserIntent button hint", buf, 2u);
    }

    double v7 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v7 userIntentButtonRect];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    if (CGRectEqualToRect(v26, *MEMORY[0x263F001A8]))
    {
      double v16 = _TVRUIHintsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "userIntentButtonRect is CGRectZero", buf, 2u);
      }
    }
    else
    {
      double v17 = [TVRUIHintsUserIntentButtonView alloc];
      double v18 = [(TVRUIHintsViewController *)self styleProvider];
      double v19 = [(TVRUIHintsViewController *)self hardwareInfo];
      double v20 = -[TVRUIHintsUserIntentButtonView initWithPresentation:styleProvider:buttonEdge:](v17, "initWithPresentation:styleProvider:buttonEdge:", a3, v18, [v19 userIntentButtonEdge]);
      [(TVRUIHintsViewController *)self setUserIntentButtonHint:v20];

      [(TVRUIHintsViewController *)self _gylphTransformForOrientation:[(TVRUIHintsViewController *)self currentInterfaceOrientation]];
      double v21 = [(TVRUIHintsViewController *)self userIntentButtonHint];
      double v22 = [v21 glyphView];
      v24[0] = v24[3];
      v24[1] = v24[4];
      v24[2] = v24[5];
      [v22 setTransform:v24];

      double v16 = [(TVRUIHintsViewController *)self view];
      id v23 = [(TVRUIHintsViewController *)self userIntentButtonHint];
      [v16 addSubview:v23];
    }
  }
}

- (void)_updateVolumeButtonsHintFrameWithPresentation:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = [(TVRUIHintsViewController *)self volumeButtonsHint];

  if (v5)
  {
    id v6 = [(TVRUIHintsViewController *)self volumeButtonsHint];
    [v6 setPresentation:a3];
  }
  else
  {
    [(TVRUIHintsViewController *)self _setupVolumeButtonsHintWithPresentation:a3];
  }
  double v7 = [(TVRUIHintsViewController *)self hardwareInfo];
  int v8 = [v7 volumeButtonsEdge];

  if (v8 == 1)
  {
    CGFloat v11 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v11 volumeUpButtonRect];
    double MinY = CGRectGetMinY(v25);
    double v12 = 0.0;
  }
  else if (v8 == 2)
  {
    CGFloat v9 = [(TVRUIHintsViewController *)self view];
    [v9 bounds];
    double MinY = CGRectGetWidth(v23);

    CGFloat v11 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v11 volumeUpButtonRect];
    double v12 = CGRectGetMinY(v24);
  }
  else
  {
    CGFloat v11 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v11 volumeUpButtonRect];
    double v12 = CGRectGetMinY(v26);
    double MinY = 0.0;
  }

  CGFloat v13 = _TVRUIHintsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109120;
    v21[1] = v8;
    _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Volume button hints presenting edge: %u", (uint8_t *)v21, 8u);
  }

  double v14 = [(TVRUIHintsViewController *)self styleProvider];
  [v14 volumeHintContainerWidth];
  double v16 = v15;

  double v17 = [(TVRUIHintsViewController *)self hardwareInfo];
  [v17 totalHeight];
  double v19 = v18;
  double v20 = [(TVRUIHintsViewController *)self volumeButtonsHint];
  objc_msgSend(v20, "setFrame:", MinY, v12, v16, v19);
}

- (void)_setupVolumeButtonsHintWithPresentation:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = _TVRUIHintsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315394;
    double v21 = "-[TVRUIHintsViewController _setupVolumeButtonsHintWithPresentation:]";
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s, presentation=%ld", buf, 0x16u);
  }

  id v6 = [(TVRUIHintsViewController *)self volumeButtonsHint];

  if (!v6)
  {
    double v7 = _TVRUIHintsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Setting up volume buttons hint", buf, 2u);
    }

    int v8 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v8 volumeUpButtonRect];
    double Height = CGRectGetHeight(v25);

    double v10 = [(TVRUIHintsViewController *)self hardwareInfo];
    uint64_t v11 = [v10 volumeButtonsEdge];

    double v12 = [TVRUIHintsVolumeButtonsView alloc];
    CGFloat v13 = [(TVRUIHintsViewController *)self styleProvider];
    double v14 = [(TVRUIHintsVolumeButtonsView *)v12 initWithPresentation:a3 styleProvider:v13 buttonEdge:v11 buttonHeight:Height];
    [(TVRUIHintsViewController *)self setVolumeButtonsHint:v14];

    [(TVRUIHintsViewController *)self _gylphTransformForOrientation:[(TVRUIHintsViewController *)self currentInterfaceOrientation]];
    double v15 = [(TVRUIHintsViewController *)self volumeButtonsHint];
    double v16 = [v15 glyphView];
    v19[0] = v19[3];
    v19[1] = v19[4];
    v19[2] = v19[5];
    [v16 setTransform:v19];

    double v17 = [(TVRUIHintsViewController *)self view];
    double v18 = [(TVRUIHintsViewController *)self volumeButtonsHint];
    [v17 addSubview:v18];
  }
}

- (void)_volumeUpButtonPressed:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v4 = _TVRUIHintsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVRUIHintsViewController _volumeUpButtonPressed:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(TVRUIHintsViewController *)self _cleanupHints];
  [(TVRUIHintsViewController *)self _presentVolumeButtonPressWithPresentation:1];
}

- (void)_volumeDownButtonPressed:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v4 = _TVRUIHintsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVRUIHintsViewController _volumeDownButtonPressed:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(TVRUIHintsViewController *)self _cleanupHints];
  [(TVRUIHintsViewController *)self _presentVolumeButtonPressWithPresentation:2];
}

- (void)_presentVolumeButtonPressWithPresentation:(unint64_t)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  int v5 = _TVRUIHintsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315394;
    v65 = "-[TVRUIHintsViewController _presentVolumeButtonPressWithPresentation:]";
    __int16 v66 = 2048;
    unint64_t v67 = a3;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s, presentation=%ld", buf, 0x16u);
  }

  [(TVRUIHintsViewController *)self _cleanupHints];
  if ([(TVRUIHintsViewController *)self _shouldAllowHintsToPresent])
  {
    [(TVRUIHintsViewController *)self _updateVolumeButtonsHintFrameWithPresentation:a3];
    id v6 = [(TVRUIHintsViewController *)self styleProvider];
    [v6 activationAnimationDismissalDelay];
    int v8 = v7;

    CGFloat v9 = [(TVRUIHintsViewController *)self styleProvider];
    int v10 = [v9 supportsSBHints];

    if (!v10)
    {
      double v16 = [(TVRUIHintsViewController *)self styleProvider];
      [v16 activationAnimationDuration];
      double v18 = v17;

      double v19 = [(TVRUIHintsViewController *)self volumeButtonsHint];
      [v19 setHidden:0];

      double v20 = [(TVRUIHintsViewController *)self volumeButtonsHint];
      [v20 setAlpha:1.0];

      [(TVRUIHintsViewController *)self _frameForVolumeButtonsPresented:0];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v29 = [(TVRUIHintsViewController *)self volumeButtonsHint];
      objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

      objc_initWeak((id *)buf, self);
      id v30 = objc_alloc(MEMORY[0x263F82E30]);
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_2;
      v60[3] = &unk_264800468;
      objc_copyWeak(&v61, (id *)buf);
      double v31 = (void *)[v30 initWithDuration:2 curve:v60 animations:v18];
      [(TVRUIHintsViewController *)self setPresentationAnimator:v31];

      id v32 = objc_alloc(MEMORY[0x263F82E30]);
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_3;
      v58[3] = &unk_264800468;
      objc_copyWeak(&v59, (id *)buf);
      double v33 = (void *)[v32 initWithDuration:2 curve:v58 animations:v18];
      [(TVRUIHintsViewController *)self setDismissalAnimator:v33];

      double v34 = [(TVRUIHintsViewController *)self dismissalAnimator];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_4;
      v56[3] = &unk_264800BB0;
      objc_copyWeak(&v57, (id *)buf);
      [v34 addCompletion:v56];

      double v35 = [(TVRUIHintsViewController *)self presentationAnimator];
      uint64_t v51 = MEMORY[0x263EF8330];
      uint64_t v52 = 3221225472;
      v53 = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_5;
      v54 = &unk_264800C00;
      objc_copyWeak(v55, (id *)buf);
      v55[1] = v8;
      [v35 addCompletion:&v51];

      v36 = [(TVRUIHintsViewController *)self presentationAnimator];
      [v36 startAnimation];

      objc_destroyWeak(v55);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v61);
      objc_destroyWeak((id *)buf);
      return;
    }
    if (a3)
    {
      if (a3 == 2)
      {
        uint64_t v11 = [(TVRUIHintsViewController *)self volumeButtonsHint];
        double v12 = [v11 volumeDownButtonView];
        SBSUIRegisterHardwareButtonHintView();
        v38 = (SBSHardwareButtonHintViewContentVisibilityControlling *)objc_claimAutoreleasedReturnValue();
        volumeHintVisibilityController = self->_volumeHintVisibilityController;
        self->_volumeHintVisibilityController = v38;
      }
      else
      {
        if (a3 != 1)
        {
LABEL_16:
          [(TVRUIHintsViewController *)self _frameForVolumeButtonsPresented:1];
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;
          __int16 v48 = [(TVRUIHintsViewController *)self volumeButtonsHint];
          objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

          int v49 = [(TVRUIHintsViewController *)self volumeButtonsHint];
          [v49 setHidden:0];

          [(SBSHardwareButtonHintViewContentVisibilityControlling *)self->_volumeHintVisibilityController setContentVisibility:1 animationSettings:0];
          objc_initWeak((id *)buf, self);
          dispatch_time_t v50 = dispatch_time(0, (uint64_t)(*(double *)&v8 * 1000000000.0));
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke;
          block[3] = &unk_264800468;
          objc_copyWeak(&v63, (id *)buf);
          dispatch_after(v50, MEMORY[0x263EF83A0], block);
          objc_destroyWeak(&v63);
          objc_destroyWeak((id *)buf);
          return;
        }
        uint64_t v11 = [(TVRUIHintsViewController *)self volumeButtonsHint];
        double v12 = [v11 volumeUpButtonView];
        SBSUIRegisterHardwareButtonHintView();
        CGFloat v13 = (SBSHardwareButtonHintViewContentVisibilityControlling *)objc_claimAutoreleasedReturnValue();
        double v14 = self->_volumeHintVisibilityController;
        self->_volumeHintVisibilityController = v13;
      }
    }
    else
    {
      uint64_t v11 = [(TVRUIHintsViewController *)self volumeButtonsHint];
      SBSUIRegisterHardwareButtonHintView();
      v37 = (SBSHardwareButtonHintViewContentVisibilityControlling *)objc_claimAutoreleasedReturnValue();
      double v12 = self->_volumeHintVisibilityController;
      self->_volumeHintVisibilityController = v37;
    }

    goto LABEL_16;
  }
  double v15 = _TVRUIHintsLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_227326000, v15, OS_LOG_TYPE_DEFAULT, "Not showing volume button activated hint because _shouldAllowHintsToPresent returned NO", buf, 2u);
  }
}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanupHints];
    id WeakRetained = v2;
  }
}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    [WeakRetained _frameForVolumeButtonsPresented:1];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    int v10 = [v11 volumeButtonsHint];
    objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

    id WeakRetained = v11;
  }
}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    double v2 = [WeakRetained volumeButtonsHint];
    [v2 setAlpha:0.0];

    id WeakRetained = v3;
  }
}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanupHints];
    id WeakRetained = v2;
  }
}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained dismissalAnimator];
    [v3 startAnimationAfterDelay:*(double *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)_siriActivated:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = _TVRUIHintsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    double v17 = "-[TVRUIHintsViewController _siriActivated:]";
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (![(TVRUIHintsViewController *)self _shouldAllowHintsToPresent])
  {
    CGFloat v13 = _TVRUIHintsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Not showing user intent activated hint because _shouldAllowHintsToPresent returned NO", buf, 2u);
    }
    goto LABEL_9;
  }
  if (![(TVRUIHintsViewController *)self _siriHintEnabled])
  {
    CGFloat v13 = _TVRUIHintsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Not showing user intent activated hint because _siriHintEnabled returned NO", buf, 2u);
    }
LABEL_9:

    goto LABEL_14;
  }
  double v6 = [(TVRUIHintsViewController *)self styleProvider];
  int v7 = [v6 supportsSBHints];

  if (v7)
  {
    [(TVRUIHintsViewController *)self _updateUserIntentButtonHintFrameForPresentation:1];
    double v8 = [(TVRUIHintsViewController *)self userIntentButtonHint];
    [v8 setHidden:0];

    double v9 = [(TVRUIHintsViewController *)self userIntentButtonHint];
    uint64_t v10 = SBSUIRegisterHardwareButtonHintView();
    p_siriHintVisibilityController = (id *)&self->_siriHintVisibilityController;
    id v12 = *p_siriHintVisibilityController;
    id *p_siriHintVisibilityController = (id)v10;

    [*p_siriHintVisibilityController setContentVisibility:1 animationSettings:0];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __43__TVRUIHintsViewController__siriActivated___block_invoke;
    v14[3] = &unk_264800468;
    objc_copyWeak(&v15, (id *)buf);
    [(TVRUIHintsViewController *)self _dismissHintsWithCompletion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
LABEL_14:
}

void __43__TVRUIHintsViewController__siriActivated___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateUserIntentButtonHintFrameForPresentation:1];
    id v4 = [v3 styleProvider];
    [v4 activationAnimationDuration];
    double v6 = v5;

    int v7 = [v3 userIntentButtonHint];
    [v7 setHidden:0];

    double v8 = [v3 userIntentButtonHint];
    [v8 setAlpha:1.0];

    [v3 _frameForUserIntentButtonPresented:0];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [v3 userIntentButtonHint];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    id v18 = objc_alloc(MEMORY[0x263F82E30]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    _DWORD v21[2] = __43__TVRUIHintsViewController__siriActivated___block_invoke_2;
    v21[3] = &unk_264800468;
    objc_copyWeak(&v22, v1);
    double v19 = (void *)[v18 initWithDuration:2 curve:v21 animations:v6];
    [v3 setPresentationAnimator:v19];

    double v20 = [v3 presentationAnimator];
    [v20 startAnimation];

    objc_destroyWeak(&v22);
  }
}

void __43__TVRUIHintsViewController__siriActivated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _frameForUserIntentButtonPresented:1];
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = [WeakRetained userIntentButtonHint];
  objc_msgSend(v9, "setFrame:", v2, v4, v6, v8);
}

- (void)_siriDeactivated:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = _TVRUIHintsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    double v23 = "-[TVRUIHintsViewController _siriDeactivated:]";
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  double v6 = [(TVRUIHintsViewController *)self styleProvider];
  int v7 = [v6 supportsSBHints];

  if (v7)
  {
    [(TVRUIHintsViewController *)self _cleanupHints];
  }
  else
  {
    double v8 = [(TVRUIHintsViewController *)self styleProvider];
    [v8 activationAnimationDuration];
    double v10 = v9;

    objc_initWeak((id *)buf, self);
    id v11 = objc_alloc(MEMORY[0x263F82E30]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __45__TVRUIHintsViewController__siriDeactivated___block_invoke;
    v20[3] = &unk_264800468;
    objc_copyWeak(&v21, (id *)buf);
    double v12 = (void *)[v11 initWithDuration:2 curve:v20 animations:v10];
    [(TVRUIHintsViewController *)self setDismissalAnimator:v12];

    double v13 = [(TVRUIHintsViewController *)self dismissalAnimator];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    double v17 = __45__TVRUIHintsViewController__siriDeactivated___block_invoke_2;
    id v18 = &unk_264800BB0;
    objc_copyWeak(&v19, (id *)buf);
    [v13 addCompletion:&v15];

    double v14 = [(TVRUIHintsViewController *)self dismissalAnimator];
    [v14 startAnimation];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

void __45__TVRUIHintsViewController__siriDeactivated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    double v2 = [WeakRetained userIntentButtonHint];
    [v2 setAlpha:0.0];

    id WeakRetained = v3;
  }
}

void __45__TVRUIHintsViewController__siriDeactivated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanupHints];
    id WeakRetained = v2;
  }
}

- (void)_largeTextEnabledStatusChanged:(id)a3
{
  id v4 = [(TVRUIHintsViewController *)self styleProvider];
  double v5 = [v4 siriImage];
  double v6 = [(TVRUIHintsViewController *)self siriGlyphView];
  int v7 = [v6 imageView];
  [v7 setImage:v5];

  id v11 = [(TVRUIHintsViewController *)self styleProvider];
  double v8 = [v11 volumeImage];
  double v9 = [(TVRUIHintsViewController *)self volumeGlyphView];
  double v10 = [v9 imageView];
  [v10 setImage:v8];
}

- (void)_applyTransformForOrientation:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = +[TVRUIDeviceInfo currentDeviceInfo];
  int v6 = [v5 isPad];

  if (!v6) {
    return;
  }
  int v7 = [(TVRUIHintsViewController *)self view];
  [v7 bounds];
  double Width = CGRectGetWidth(v23);
  double v9 = [(TVRUIHintsViewController *)self view];
  [v9 bounds];
  CGFloat Height = CGRectGetHeight(v24);

  if (a3 == 2)
  {
    CGFloat v11 = 3.14159265;
LABEL_10:
    double v12 = Height;
    goto LABEL_11;
  }
  if (a3 == 3)
  {
    CGFloat v11 = -1.57079633;
    goto LABEL_8;
  }
  if (a3 != 4)
  {
    CGFloat v11 = 0.0;
    goto LABEL_10;
  }
  CGFloat v11 = 1.57079633;
LABEL_8:
  double v12 = Width;
  double Width = Height;
LABEL_11:
  double v13 = _TVRUIHintsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134218240;
    int64_t v19 = a3;
    __int16 v20 = 2048;
    CGFloat v21 = v11;
    _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Applying transform if needed for orientation=%ld, angle=%0.2frad", buf, 0x16u);
  }

  CGAffineTransformMakeRotation(&v17, v11);
  double v14 = [(TVRUIHintsViewController *)self view];
  CGAffineTransform v16 = v17;
  [v14 setTransform:&v16];

  uint64_t v15 = [(TVRUIHintsViewController *)self view];
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, v12);
}

- (CGAffineTransform)_gylphTransformForOrientation:(SEL)a3
{
  CGFloat v4 = 0.0;
  if ((unint64_t)(a4 - 2) <= 2) {
    CGFloat v4 = dbl_2273F4300[a4 - 2];
  }
  return CGAffineTransformMakeRotation(retstr, v4);
}

- (void)_dismissHintsWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CGFloat v4 = (void (**)(void))a3;
  BOOL v5 = +[TVRUIFeatures persistHintsUIEnabled];
  int v6 = _TVRUIHintsLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)id buf = 136315138;
      CGFloat v21 = "-[TVRUIHintsViewController _dismissHintsWithCompletion:]";
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "%s, persistHintsUIEnabled is on so hints will not be dismissed", buf, 0xCu);
    }

    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)id buf = 136315138;
      CGFloat v21 = "-[TVRUIHintsViewController _dismissHintsWithCompletion:]";
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__dismissHintsWithCompletion_ object:0];
    double v8 = [(TVRUIHintsViewController *)self styleProvider];
    [v8 activationAnimationDuration];
    double v10 = v9;

    objc_initWeak((id *)buf, self);
    id v11 = objc_alloc(MEMORY[0x263F82E30]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke;
    v18[3] = &unk_264800468;
    objc_copyWeak(&v19, (id *)buf);
    double v12 = (void *)[v11 initWithDuration:2 curve:v18 animations:v10];
    [(TVRUIHintsViewController *)self setDismissalAnimator:v12];

    double v13 = [(TVRUIHintsViewController *)self dismissalAnimator];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke_2;
    v15[3] = &unk_264800C28;
    objc_copyWeak(&v17, (id *)buf);
    CGAffineTransform v16 = v4;
    [v13 addCompletion:v15];

    double v14 = [(TVRUIHintsViewController *)self dismissalAnimator];
    [v14 startAnimation];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v22 = WeakRetained;
    id v2 = [WeakRetained volumeButtonsHint];
    [v2 setAlpha:0.0];

    [v22 _frameForVolumeButtonsPresented:0];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = [v22 volumeButtonsHint];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    double v12 = [v22 userIntentButtonHint];
    [v12 setAlpha:0.0];

    [v22 _frameForUserIntentButtonPresented:0];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    CGFloat v21 = [v22 userIntentButtonHint];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    id WeakRetained = v22;
  }
}

uint64_t __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    [WeakRetained _cleanupHints];
    double v4 = [v9 volumeButtonsHint];
    [v4 setHidden:1];

    double v5 = [v9 userIntentButtonHint];
    [v5 setHidden:1];

    double v6 = [v9 volumeButtonsHint];
    [v6 setAlpha:1.0];

    double v7 = [v9 userIntentButtonHint];
    [v7 setAlpha:1.0];

    id v3 = v9;
    id WeakRetained = *(id *)(a1 + 32);
    if (WeakRetained)
    {
      id WeakRetained = (id)(*((uint64_t (**)(id, void *))WeakRetained + 2))(WeakRetained, v9);
      id v3 = v9;
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)_cleanupHints
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__dismissHintsWithCompletion_ object:0];
  id v3 = [(TVRUIHintsViewController *)self presentationAnimator];
  [v3 stopAnimation:1];

  double v4 = [(TVRUIHintsViewController *)self dismissalAnimator];
  [v4 stopAnimation:1];

  double v5 = [(TVRUIHintsViewController *)self siriHintVisibilityController];
  [v5 invalidate];

  [(TVRUIHintsViewController *)self setSiriHintVisibilityController:0];
  double v6 = [(TVRUIHintsViewController *)self volumeHintVisibilityController];
  [v6 invalidate];

  [(TVRUIHintsViewController *)self setVolumeHintVisibilityController:0];
  double v7 = [(TVRUIHintsViewController *)self volumeButtonsHint];
  [v7 setHidden:1];

  id v8 = [(TVRUIHintsViewController *)self userIntentButtonHint];
  [v8 setHidden:1];
}

- (int64_t)currentInterfaceOrientation
{
  id v2 = [(TVRUIHintsViewController *)self view];
  id v3 = [v2 window];
  int64_t v4 = [v3 _windowInterfaceOrientation];

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)_frameForUserIntentButtonPresented:(BOOL)a3
{
  double v5 = [(TVRUIHintsViewController *)self hardwareInfo];
  [v5 userIntentButtonRect];
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  double x = *MEMORY[0x263F001A8];
  double y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  v38.origin.double x = v7;
  v38.origin.double y = v9;
  v38.size.CGFloat width = v11;
  v38.size.CGFloat height = v13;
  v42.origin.double x = *(CGFloat *)MEMORY[0x263F001A8];
  v42.origin.double y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  if (!CGRectEqualToRect(v38, v42))
  {
    double v36 = x;
    double v18 = [(TVRUIHintsViewController *)self styleProvider];
    [v18 siriHintContainerWidth];
    double v20 = v19;

    double v34 = *MEMORY[0x263F001B0];
    double v35 = *(double *)(MEMORY[0x263F001B0] + 8);
    CGFloat v21 = [(TVRUIHintsViewController *)self hardwareInfo];
    int v22 = [v21 userIntentButtonEdge];

    switch(v22)
    {
      case 0:
        CGRect v23 = _TVRUIHintsLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[TVRUIHintsViewController _frameForUserIntentButtonPresented:]();
        }
        goto LABEL_7;
      case 1:
        double v24 = -v20;
        CGFloat v25 = 0.0;
        CGFloat height = v20;
        CGFloat width = v11;
        double y = -v20;
        double x = v7;
        goto LABEL_17;
      case 2:
        double v24 = 0.0;
        CGFloat v25 = v20;
        CGFloat height = v13;
        CGFloat width = v20;
        double x = v7 - v20;
        double y = v9;
        goto LABEL_17;
      case 3:
        double v26 = +[TVRUIDeviceInfo currentDeviceInfo];
        int v27 = [v26 hasHomeButton];

        double v28 = _TVRUIHintsLog();
        double v29 = v28;
        if (v27)
        {
          double x = v36;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_227326000, v29, OS_LOG_TYPE_DEFAULT, "Device has a home button. Skip showing the Siri hint", buf, 2u);
          }
        }
        else
        {
          double x = v36;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            -[TVRUIHintsViewController _frameForUserIntentButtonPresented:]();
          }
        }

        goto LABEL_16;
      default:
        CGRect v23 = _TVRUIHintsLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[TVRUIHintsViewController _frameForUserIntentButtonPresented:]();
        }
LABEL_7:

        double x = v36;
LABEL_16:
        CGFloat v25 = v34;
        double v24 = v35;
LABEL_17:
        if (!a3)
        {
          v39.origin.double x = x;
          v39.origin.double y = y;
          v39.size.CGFloat width = width;
          v39.size.CGFloat height = height;
          CGRect v40 = CGRectOffset(v39, v25, v24);
          double x = v40.origin.x;
          double y = v40.origin.y;
          CGFloat width = v40.size.width;
          CGFloat height = v40.size.height;
        }
        break;
    }
  }
  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGRect)_frameForVolumeButtonsPresented:(BOOL)a3
{
  double v5 = [(TVRUIHintsViewController *)self styleProvider];
  [v5 volumeHintContainerWidth];
  double width = v6;

  double v8 = [(TVRUIHintsViewController *)self hardwareInfo];
  [v8 volumeUpButtonRect];
  CGFloat MinY = CGRectGetMinY(v27);

  double v10 = [(TVRUIHintsViewController *)self hardwareInfo];
  [v10 totalHeight];
  CGFloat height = v11;

  CGFloat v13 = [(TVRUIHintsViewController *)self hardwareInfo];
  int v14 = [v13 volumeButtonsEdge];

  if (v14 == 1)
  {
    double v19 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v19 volumeUpButtonRect];
    CGFloat MinX = CGRectGetMinX(v29);

    double v20 = [(TVRUIHintsViewController *)self hardwareInfo];
    [v20 totalHeight];
    double v22 = v21;

    double v17 = -width;
    double v18 = 0.0;
    CGFloat height = 0.0;
    double width = v22;
    CGFloat MinY = 0.0;
    if (a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v14 == 2)
  {
    double v15 = [(TVRUIHintsViewController *)self view];
    [v15 bounds];
    CGFloat MinX = CGRectGetWidth(v28);

    double v17 = 0.0;
    double v18 = width;
    if (a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v18 = -width;
  double v17 = 0.0;
  CGFloat MinX = 0.0;
  if (!a3)
  {
LABEL_8:
    v30.origin.double x = MinX;
    v30.origin.double y = MinY;
    v30.size.double width = width;
    v30.size.CGFloat height = height;
    CGRect v31 = CGRectOffset(v30, v18, v17);
    CGFloat MinX = v31.origin.x;
    CGFloat MinY = v31.origin.y;
    double width = v31.size.width;
    CGFloat height = v31.size.height;
  }
LABEL_9:
  double v23 = MinX;
  double v24 = MinY;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (void)_setupDebugUIIfEnabled
{
  v31[2] = *MEMORY[0x263EF8340];
  if (+[TVRUIFeatures isHintsDebugUIEnabled])
  {
    id v3 = _TVRUIHintsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Hints Debug UI is enabled", buf, 2u);
    }

    int64_t v4 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.5 blue:0.0 alpha:0.25];
    v31[0] = v4;
    double v5 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:0.0 alpha:0.25];
    v31[1] = v5;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];

    double v7 = [(TVRUIHintsViewController *)self view];
    [v7 bounds];
    uint64_t v8 = (uint64_t)(CGRectGetHeight(v32) / 10.0);

    uint64_t v9 = [v6 count];
    if (v8 >= 1)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      CGRect v28 = self;
      uint64_t v29 = v9;
      do
      {
        double v12 = [(TVRUIHintsViewController *)self view];
        [v12 bounds];
        double Width = CGRectGetWidth(v33);

        int v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, (double)(int)v11 * 10.0, Width, 10.0);
        double v15 = [v6 objectAtIndexedSubscript:v11 % v10];
        [v14 setBackgroundColor:v15];

        double v16 = [(TVRUIHintsViewController *)self view];
        [v16 addSubview:v14];

        if ((v11 & 1) == 0)
        {
          [v14 bounds];
          CGFloat v17 = CGRectGetWidth(v34) + -20.0;
          [v14 bounds];
          double Height = CGRectGetHeight(v35);
          double v19 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 10.0, 0.0, v17, Height);
          [v19 setAutoresizingMask:18];
          objc_msgSend(NSString, "stringWithFormat:", @"%0.f", (double)(int)v11 * 10.0);
          v21 = uint64_t v20 = v8;
          [v19 setText:v21];

          double v22 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
          [v19 setFont:v22];

          double v23 = [MEMORY[0x263F825C8] whiteColor];
          [v19 setTextColor:v23];

          [v14 addSubview:v19];
          double v24 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 10.0, 0.0, v17, Height);
          [v24 setAutoresizingMask:18];
          [v24 setTextAlignment:2];
          double v25 = objc_msgSend(NSString, "stringWithFormat:", @"%0.f", (double)(int)v11 * 10.0);
          [v24 setText:v25];

          double v26 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
          [v24 setFont:v26];

          CGRect v27 = [MEMORY[0x263F825C8] whiteColor];
          [v24 setTextColor:v27];

          [v14 addSubview:v24];
          uint64_t v8 = v20;
          self = v28;
          uint64_t v10 = v29;
        }
        ++v11;
      }
      while (v8 != v11);
    }
  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v5 = (void (**)(void))a4;
  double v6 = _TVRUITipsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    double v12 = "-[TVRUIHintsViewController dismissPresentedContentAnimated:completion:]";
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  double v7 = [(TVRUIHintsViewController *)self siriTipManager];

  uint64_t v8 = _TVRUITipsLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating Siri tip", (uint8_t *)&v11, 2u);
    }

    uint64_t v10 = [(TVRUIHintsViewController *)self siriTipManager];
    [v10 invalidate:1 completion:v5];
  }
  else
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "No siri tip manager, calling completion block", (uint8_t *)&v11, 2u);
    }

    if (v5) {
      v5[2](v5);
    }
  }
}

- (BOOL)hasPresentedContent
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = _TVRUITipsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(TVRUIHintsViewController *)self siriTipManager];
    int v8 = 136315394;
    BOOL v9 = "-[TVRUIHintsViewController hasPresentedContent]";
    __int16 v10 = 1024;
    int v11 = [v4 isPresentingTip];
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v8, 0x12u);
  }
  double v5 = [(TVRUIHintsViewController *)self siriTipManager];
  char v6 = [v5 isPresentingTip];

  return v6;
}

- (BOOL)_shouldAllowHintsToPresent
{
  if ([(TVRUIHintsViewController *)self _volumeHintEnabled])
  {
    id v3 = [(TVRUIHintsViewController *)self presentationAnimator];
    int v4 = [v3 isRunning];

    if (v4)
    {
      double v5 = _TVRUIHintsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        char v6 = "Animation is already running, will not show hints";
        double v7 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else
    {
      if (![(TVRUIHintsViewController *)self isPresentingTip]) {
        return 1;
      }
      double v5 = _TVRUIHintsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        char v6 = "Tip is currently being presented, will not show hints";
        double v7 = (uint8_t *)&v9;
        goto LABEL_10;
      }
    }
  }
  else
  {
    double v5 = _TVRUIHintsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      char v6 = "Volume hints are disabled, will not show hints";
      double v7 = (uint8_t *)&v11;
      goto LABEL_10;
    }
  }

  return 0;
}

- (BOOL)_siriHintEnabled
{
  if ([(TVRUIHintsViewController *)self allowSiriHint])
  {
    id v3 = [(TVRUIHintsViewController *)self styleProvider];
    char v4 = [v3 shouldShowSiriHint];
  }
  else
  {
    char v4 = 0;
  }
  if (+[TVRUIFeatures persistHintsUIEnabled])
  {
    double v5 = _TVRUIHintsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "persistHintsUIEnabled is enabled so hints will always show", v7, 2u);
    }

    return 1;
  }
  return v4;
}

- (BOOL)_volumeHintEnabled
{
  if (+[TVRUIFeatures persistHintsUIEnabled])
  {
    id v3 = _TVRUIHintsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "persistHintsUIEnabled is enabled so hints will always show", v8, 2u);
    }

    LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v4 = [(TVRUIHintsViewController *)self allowVolumeHint];
    if (v4)
    {
      double v5 = [(TVRUIHintsViewController *)self styleProvider];
      char v6 = [v5 shouldShowVolumeHint];

      LOBYTE(v4) = v6;
    }
  }
  return v4;
}

- (void)_setupTipsControllerIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(TVRUIHintsViewController *)self allowTips])
  {
    if ([(TVRUIHintsViewController *)self allowSiriHint])
    {
      id v3 = [(TVRUIHintsViewController *)self siriTipManager];

      if (!v3)
      {
        BOOL v4 = _TVRUITipsLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          double v5 = [MEMORY[0x263F086E0] mainBundle];
          char v6 = [v5 bundleIdentifier];
          int v9 = 138412290;
          __int16 v10 = v6;
          _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Creating Siri Tip Manager for: %@", (uint8_t *)&v9, 0xCu);
        }
        double v7 = [[TVRUITipManager alloc] initWithTipSourceViewProvider:self tipType:1];
        [(TVRUIHintsViewController *)self setSiriTipManager:v7];

        int v8 = [(TVRUIHintsViewController *)self siriTipManager];
        [v8 activate];
      }
    }
  }
}

- (CGRect)tipSourceRect
{
  id v2 = [(TVRUIHintsViewController *)self hardwareInfo];
  [v2 userIntentButtonRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)canPresentTip
{
  return 1;
}

- (unint64_t)_permittedArrowDirectionsForDevice:(id)a3
{
  if ([a3 isPad]) {
    return 15;
  }
  else {
    return 10;
  }
}

- (unint64_t)permittedArrowDirections
{
  double v3 = +[TVRUIDeviceInfo currentDeviceInfo];
  unint64_t v4 = [(TVRUIHintsViewController *)self _permittedArrowDirectionsForDevice:v3];

  return v4;
}

- (BOOL)allowSiriHint
{
  return self->_allowSiriHint;
}

- (void)setAllowSiriHint:(BOOL)a3
{
  self->_allowSiriHint = a3;
}

- (BOOL)allowVolumeHint
{
  return self->_allowVolumeHint;
}

- (void)setAllowVolumeHint:(BOOL)a3
{
  self->_allowVolumeHint = a3;
}

- (BOOL)allowTips
{
  return self->_allowTips;
}

- (void)setAllowTips:(BOOL)a3
{
  self->_allowTips = a3;
}

- (TVRUIHintsUserIntentButtonView)userIntentButtonHint
{
  return self->_userIntentButtonHint;
}

- (void)setUserIntentButtonHint:(id)a3
{
}

- (TVRUIHintsVolumeButtonsView)volumeButtonsHint
{
  return self->_volumeButtonsHint;
}

- (void)setVolumeButtonsHint:(id)a3
{
}

- (TVRUIHintsGlyphView)siriGlyphView
{
  return self->_siriGlyphView;
}

- (void)setSiriGlyphView:(id)a3
{
}

- (TVRUIHintsGlyphView)volumeGlyphView
{
  return self->_volumeGlyphView;
}

- (void)setVolumeGlyphView:(id)a3
{
}

- (TVRUIDeviceHardwareInfo)hardwareInfo
{
  return self->_hardwareInfo;
}

- (void)setHardwareInfo:(id)a3
{
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (void)setSupportsSiri:(BOOL)a3
{
  self->_supportsSiri = a3;
}

- (BOOL)supportsVolume
{
  return self->_supportsVolume;
}

- (void)setSupportsVolume:(BOOL)a3
{
  self->_supportsVolume = a3;
}

- (double)lastAnimatedTimeInterval
{
  return self->_lastAnimatedTimeInterval;
}

- (void)setLastAnimatedTimeInterval:(double)a3
{
  self->_lastAnimatedTimeInterval = a3;
}

- (BOOL)isPresentingTip
{
  return self->_presentingTip;
}

- (void)setPresentingTip:(BOOL)a3
{
  self->_presentingTip = a3;
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (UIViewPropertyAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (void)setPresentationAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)dismissalAnimator
{
  return self->_dismissalAnimator;
}

- (void)setDismissalAnimator:(id)a3
{
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)siriHintVisibilityController
{
  return self->_siriHintVisibilityController;
}

- (void)setSiriHintVisibilityController:(id)a3
{
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)volumeHintVisibilityController
{
  return self->_volumeHintVisibilityController;
}

- (void)setVolumeHintVisibilityController:(id)a3
{
}

- (TVRUITipManager)siriTipManager
{
  return self->_siriTipManager;
}

- (void)setSiriTipManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriTipManager, 0);
  objc_storeStrong((id *)&self->_volumeHintVisibilityController, 0);
  objc_storeStrong((id *)&self->_siriHintVisibilityController, 0);
  objc_storeStrong((id *)&self->_dismissalAnimator, 0);
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_hardwareInfo, 0);
  objc_storeStrong((id *)&self->_volumeGlyphView, 0);
  objc_storeStrong((id *)&self->_siriGlyphView, 0);
  objc_storeStrong((id *)&self->_volumeButtonsHint, 0);
  objc_storeStrong((id *)&self->_userIntentButtonHint, 0);
}

- (void)_frameForUserIntentButtonPresented:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_227326000, v0, v1, "Unsupported CGRectEdge", v2, v3, v4, v5, v6);
}

- (void)_frameForUserIntentButtonPresented:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_227326000, v0, v1, "User intent buttons edge is being reported to be at bottom of the device", v2, v3, v4, v5, v6);
}

- (void)_frameForUserIntentButtonPresented:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_227326000, v0, v1, "User intent buttons edge is being reported to the left of the device", v2, v3, v4, v5, v6);
}

@end