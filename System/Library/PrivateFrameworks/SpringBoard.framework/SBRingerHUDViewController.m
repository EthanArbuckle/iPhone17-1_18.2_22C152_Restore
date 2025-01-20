@interface SBRingerHUDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isActivatedForPreviewing;
- (BOOL)isPresentableAppearingOrAppeared;
- (BOOL)isRingerSilent;
- (BOOL)lastEventIsAVolumeChange;
- (BOOL)shouldExtendDismissalTimerUponDidAppear;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSTimer)dismissalTimer;
- (SBBannerCustomTransitioningDelegate)customTransitioningDelegate;
- (SBRingerHUDViewController)initWithActivatedForPreviewing:(BOOL)a3;
- (SBRingerHUDViewControllerDelegate)delegate;
- (SBRingerPillView)pillView;
- (double)overshoot;
- (float)volume;
- (id)presentableDescription;
- (int64_t)presentableBehavior;
- (void)_dismiss;
- (void)_extendDismissalTimer;
- (void)_layoutPillView;
- (void)_updateStateAnimated:(BOOL)a3 invert:(BOOL)a4;
- (void)_updateVolumeSliderAnimated:(BOOL)a3;
- (void)buttonReleased;
- (void)nudgeUp:(BOOL)a3;
- (void)presentForMuteChange:(BOOL)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setCustomTransitioningDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalTimer:(id)a3;
- (void)setLastEventIsAVolumeChange:(BOOL)a3;
- (void)setOvershoot:(double)a3;
- (void)setPillView:(id)a3;
- (void)setPresentableAppearingOrAppeared:(BOOL)a3;
- (void)setRingerSilent:(BOOL)a3;
- (void)setShouldExtendDismissalTimerUponDidAppear:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setVolume:(float)a3 animated:(BOOL)a4 forKeyPress:(BOOL)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBRingerHUDViewController

- (SBRingerHUDViewController)initWithActivatedForPreviewing:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRingerHUDViewController;
  v4 = [(SBRingerHUDViewController *)&v12 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_activatedForPreviewing = v3;
    v6 = [(SBRingerHUDViewController *)v4 transitioningDelegate];

    if (!v6 && v3)
    {
      customTransitioningDelegate = v5->_customTransitioningDelegate;
      if (!customTransitioningDelegate)
      {
        v9 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
        v10 = v5->_customTransitioningDelegate;
        v5->_customTransitioningDelegate = v9;

        customTransitioningDelegate = v5->_customTransitioningDelegate;
      }
      [(SBRingerHUDViewController *)v5 setTransitioningDelegate:customTransitioningDelegate];
    }
  }
  return v5;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBRingerHUDViewController;
  [(SBRingerHUDViewController *)&v8 viewDidLoad];
  BOOL v3 = [[SBRingerPillView alloc] initWithActivatedForPreviewing:self->_activatedForPreviewing];
  pillView = self->_pillView;
  self->_pillView = v3;

  -[SBRingerPillView _setTouchInsets:](self->_pillView, "_setTouchInsets:", 0.0, 0.0, -30.0, 0.0);
  [(SBRingerPillView *)self->_pillView sizeToFit];
  v5 = [(SBRingerHUDViewController *)self view];
  [v5 addSubview:self->_pillView];

  [(SBRingerHUDViewController *)self _layoutPillView];
  [(SBRingerPillView *)self->_pillView bounds];
  -[SBRingerHUDViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);
  [(SBRingerHUDViewController *)self _updateVolumeSliderAnimated:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBRingerHUDViewController;
  [(SBRingerHUDViewController *)&v3 viewDidLayoutSubviews];
  [(SBRingerHUDViewController *)self _layoutPillView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBRingerHUDViewController;
  [(SBRingerHUDViewController *)&v4 viewWillAppear:a3];
  [(SBRingerHUDViewController *)self _updateVolumeSliderAnimated:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRingerSilent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5 = SBLogRingerHUD();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController setRingerSilent: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  if (self->_ringerSilent != v3)
  {
    self->_ringerSilent = v3;
    self->_lastEventIsAVolumeChange = 0;
    [(SBRingerHUDViewController *)self _updateStateAnimated:1 invert:0];
  }
}

- (void)nudgeUp:(BOOL)a3
{
  if (a3)
  {
    if ((BSFloatIsOne() & 1) == 0) {
      return;
    }
    double v4 = 0.0625;
  }
  else
  {
    if (!BSFloatLessThanOrEqualToFloat()) {
      return;
    }
    double v4 = -0.0625;
  }
  self->_overshoot = self->_overshoot + v4;
  [(SBRingerHUDViewController *)self _updateVolumeSliderAnimated:1];
}

- (void)buttonReleased
{
  self->_overshoot = 0.0;
  [(SBRingerHUDViewController *)self _updateVolumeSliderAnimated:1];
}

- (void)setVolume:(float)a3
{
}

- (void)setVolume:(float)a3 animated:(BOOL)a4 forKeyPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9 = SBLogRingerHUD();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    double v11 = a3;
    __int16 v12 = 1024;
    BOOL v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController setVolume:%.2f animated:%{BOOL}d forKeyPress:%{BOOL}d", (uint8_t *)&v10, 0x18u);
  }

  [(SBRingerHUDViewController *)self _extendDismissalTimer];
  if (v5) {
    self->_lastEventIsAVolumeChange = 1;
  }
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_volume = a3;
    [(SBRingerHUDViewController *)self _updateVolumeSliderAnimated:v6];
  }
  if (v5) {
    [(SBRingerHUDViewController *)self _updateStateAnimated:1 invert:0];
  }
}

- (void)_layoutPillView
{
  id v4 = [(SBRingerHUDViewController *)self view];
  [v4 bounds];
  pillView = self->_pillView;
  UIRectGetCenter();
  -[SBRingerPillView setCenter:](pillView, "setCenter:");
}

- (void)_updateVolumeSliderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v5 = SBLogRingerHUD();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController _updateVolumeSliderAnimated:%{BOOL}d", (uint8_t *)v7, 8u);
  }

  float v6 = self->_overshoot + self->_volume;
  [(SBRingerPillView *)self->_pillView setSliderValue:v3 animated:v6];
}

- (void)_updateStateAnimated:(BOOL)a3 invert:(BOOL)a4
{
  BOOL v5 = a3;
  if ([(SBRingerHUDViewController *)self isViewLoaded])
  {
    uint64_t v7 = +[SBDefaults externalDefaults];
    uint64_t v8 = [v7 soundDefaults];

    char v9 = [v8 buttonsCanChangeRingerVolume];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke;
    v20[3] = &unk_1E6AF7EB8;
    char v21 = v9;
    v20[4] = self;
    BOOL v22 = a4;
    int v10 = (void (**)(void))MEMORY[0x1D948C7A0](v20);
    double v11 = v10;
    if (v5)
    {
      if (self->_activatedForPreviewing)
      {
        if (self->_ringerSilent) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
        BOOL v13 = [(SBRingerHUDViewController *)self view];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_3;
        v16[3] = &unk_1E6AF5300;
        id v17 = v11;
        objc_msgSend(v13, "sb_animateStateChangeWithBlock:style:", v16, v12);

        __int16 v14 = v17;
      }
      else
      {
        BOOL v15 = (void *)MEMORY[0x1E4F42FF0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_2;
        v18[3] = &unk_1E6AF5300;
        v19 = v10;
        [v15 animateWithDuration:4 delay:v18 options:0 animations:0.3 completion:0.0];
        __int16 v14 = v19;
      }
    }
    else
    {
      v10[2](v10);
    }
  }
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = 4;
    if (!*(unsigned char *)(v2 + 978)) {
      uint64_t v3 = 1;
    }
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v3 = 1;
    uint64_t v4 = 2;
  }
  if (*(unsigned char *)(v2 + 976)) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  if (*(unsigned char *)(v2 + 976)) {
    uint64_t v3 = v4;
  }
  if (*(unsigned char *)(a1 + 41)) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  [*(id *)(v2 + 1000) setState:v6];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1000);
  return [v7 layoutIfNeeded];
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__SBRingerHUDViewController__updateStateAnimated_invert___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentForMuteChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogRingerHUD();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController presentForMuteChange: %{BOOL}d", buf, 8u);
  }

  BOOL v6 = [(SBRingerHUDViewController *)self isPresentableAppearingOrAppeared];
  [(SBRingerHUDViewController *)self _extendDismissalTimer];
  if (!v6)
  {
    uint64_t v7 = [(SBRingerHUDViewController *)self delegate];
    [v7 ringerHUDViewControllerWantsToBePresented:self];

    [(SBRingerHUDViewController *)self setShouldExtendDismissalTimerUponDidAppear:1];
    if (v3)
    {
      [(SBRingerHUDViewController *)self _updateStateAnimated:0 invert:1];
      uint64_t v8 = [(SBRingerHUDViewController *)self view];
      char v9 = [v8 window];
      [v9 safeAreaInsets];
      double v11 = v10;

      if (v11 != 0.0)
      {
        dispatch_time_t v12 = dispatch_time(0, 200000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__SBRingerHUDViewController_presentForMuteChange___block_invoke;
        block[3] = &unk_1E6AF4AC0;
        block[4] = self;
        dispatch_after(v12, MEMORY[0x1E4F14428], block);
        return;
      }
      BOOL v13 = self;
      uint64_t v14 = 1;
    }
    else
    {
      BOOL v13 = self;
      uint64_t v14 = 0;
    }
    [(SBRingerHUDViewController *)v13 _updateStateAnimated:v14 invert:0];
  }
}

uint64_t __50__SBRingerHUDViewController_presentForMuteChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStateAnimated:1 invert:0];
}

- (void)_dismiss
{
  BOOL v3 = SBLogRingerHUD();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController dismiss", v5, 2u);
  }

  uint64_t v4 = [(SBRingerHUDViewController *)self delegate];
  [v4 ringerHUDViewControllerWantsToBeDismissed:self];
}

- (void)_extendDismissalTimer
{
  BOOL v3 = SBLogRingerHUD();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SBRingerHUDViewController _extendDismissalTimer", (uint8_t *)buf, 2u);
  }

  [(NSTimer *)self->_dismissalTimer invalidate];
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = 0;

  if (!self->_dismissalTimer)
  {
    objc_initWeak(buf, self);
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__SBRingerHUDViewController__extendDismissalTimer__block_invoke;
    v8[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v9, buf);
    BOOL v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:1.5];
    uint64_t v7 = self->_dismissalTimer;
    self->_dismissalTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __50__SBRingerHUDViewController__extendDismissalTimer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dismiss];
  [v3 invalidate];

  [WeakRetained setDismissalTimer:0];
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.SpringBoard.RingerHUD";
}

- (NSString)requestIdentifier
{
  return (NSString *)@"RingerHUD";
}

- (void)presentableWillAppearAsBanner:(id)a3
{
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  [(SBRingerHUDViewController *)self setPresentableAppearingOrAppeared:1];
  if ([(SBRingerHUDViewController *)self shouldExtendDismissalTimerUponDidAppear])
  {
    [(SBRingerHUDViewController *)self setShouldExtendDismissalTimerUponDidAppear:0];
    [(SBRingerHUDViewController *)self _extendDismissalTimer];
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  return @"Ringer HUD";
}

- (BOOL)isRingerSilent
{
  return self->_ringerSilent;
}

- (BOOL)isActivatedForPreviewing
{
  return self->_activatedForPreviewing;
}

- (float)volume
{
  return self->_volume;
}

- (SBRingerHUDViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRingerHUDViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBRingerPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (BOOL)lastEventIsAVolumeChange
{
  return self->_lastEventIsAVolumeChange;
}

- (void)setLastEventIsAVolumeChange:(BOOL)a3
{
  self->_lastEventIsAVolumeChange = a3;
}

- (double)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(double)a3
{
  self->_overshoot = a3;
}

- (BOOL)isPresentableAppearingOrAppeared
{
  return self->_presentableAppearingOrAppeared;
}

- (void)setPresentableAppearingOrAppeared:(BOOL)a3
{
  self->_presentableAppearingOrAppeared = a3;
}

- (BOOL)shouldExtendDismissalTimerUponDidAppear
{
  return self->_shouldExtendDismissalTimerUponDidAppear;
}

- (void)setShouldExtendDismissalTimerUponDidAppear:(BOOL)a3
{
  self->_shouldExtendDismissalTimerUponDidAppear = a3;
}

- (NSTimer)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
}

- (SBBannerCustomTransitioningDelegate)customTransitioningDelegate
{
  return self->_customTransitioningDelegate;
}

- (void)setCustomTransitioningDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end