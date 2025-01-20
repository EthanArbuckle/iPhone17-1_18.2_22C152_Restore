@interface SBFLockScreenDateViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_supportsCoaching;
- (BOOL)isAlternateDateEnabled;
- (BOOL)isSubtitleHidden;
- (BOOL)restrictsVibrancy;
- (BOOL)screenOff;
- (BOOL)shouldApplyVibrancyToComplications;
- (NSString)description;
- (SBFDateProviding)dateProvider;
- (SBFLockScreenDateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)complicationContainerViewController;
- (UIViewController)inlineComplicationViewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)backgroundAlpha;
- (id)_timelinesForDateInterval:(id)a3;
- (id)dateViewIfExists;
- (id)transientSubtitleText;
- (void)_addObservers;
- (void)_handleTimeZoneChange;
- (void)_startUpdateTimer;
- (void)_stopUpdateTimer;
- (void)_updateAlternateCalendar;
- (void)_updateFormat;
- (void)_updateFormatIfEnabled;
- (void)_updateLegibilityStrength;
- (void)_updateState;
- (void)_updateView;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setAlternateDateEnabled:(BOOL)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setComplicationContainerViewController:(id)a3;
- (void)setCustomSubtitle:(id)a3;
- (void)setCustomSubtitle:(id)a3 withTimeout:(double)a4;
- (void)setCustomSubtitleView:(id)a3;
- (void)setDateProvider:(id)a3;
- (void)setDateTimeAlignment:(int64_t)a3;
- (void)setDimmingViewAlpha:(double)a3;
- (void)setInlineComplicationViewController:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setRestrictsVibrancy:(BOOL)a3;
- (void)setScreenOff:(BOOL)a3;
- (void)setShouldApplyVibrancyToComplications:(BOOL)a3;
- (void)setSubtitleHidden:(BOOL)a3;
- (void)setTimeAlpha:(double)a3 subtitleAlpha:(double)a4;
- (void)setTimerWithText:(id)a3;
- (void)setView:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateTimeNow;
- (void)updateTimerWithText:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SBFLockScreenDateViewController

void __52__SBFLockScreenDateViewController__startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateView];
}

- (void)_updateView
{
  if (self->_disablesUpdates)
  {
    [(SBFLockScreenDateViewController *)self _stopUpdateTimer];
  }
  else
  {
    v3 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
    v4 = [(SBFDateProviding *)self->_dateProvider date];
    [v3 setDate:v4];

    [(SBFLockScreenDateViewController *)self _startUpdateTimer];
  }
}

- (id)dateViewIfExists
{
  if ([(SBFLockScreenDateViewController *)self isViewLoaded])
  {
    v3 = [(SBFLockScreenDateViewController *)self dateView];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_startUpdateTimer
{
  if (!self->_timerToken)
  {
    objc_initWeak(&location, self);
    dateProvider = self->_dateProvider;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__SBFLockScreenDateViewController__startUpdateTimer__block_invoke;
    v6[3] = &unk_1E548E160;
    objc_copyWeak(&v7, &location);
    v4 = [(SBFDateProviding *)dateProvider observeMinuteUpdatesWithHandler:v6];
    id timerToken = self->_timerToken;
    self->_id timerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (SBFLockScreenDateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SBFLockScreenDateViewController;
  v8 = [(SBFLockScreenDateViewController *)&v31 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    [(SBFLockScreenDateViewController *)v8 _addObservers];
    [(SBFLockScreenDateViewController *)v9 setDateProvider:0];
    v10 = objc_alloc_init(SBAlwaysOnDefaults);
    alwaysOnDefaults = v9->_alwaysOnDefaults;
    v9->_alwaysOnDefaults = v10;

    objc_initWeak(&location, v9);
    v12 = v9->_alwaysOnDefaults;
    v13 = [NSString stringWithUTF8String:"useDebugColors"];
    uint64_t v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__SBFLockScreenDateViewController_initWithNibName_bundle___block_invoke;
    v28[3] = &unk_1E548E0C0;
    objc_copyWeak(&v29, &location);
    uint64_t v16 = [(BSAbstractDefaultDomain *)v12 observeDefault:v13 onQueue:v14 withBlock:v28];
    alwaysOnDefaultsObserver = v9->_alwaysOnDefaultsObserver;
    v9->_alwaysOnDefaultsObserver = (BSDefaultObserver *)v16;

    if (_os_feature_enabled_impl())
    {
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v18 = (void *)getCSProminentDisplayViewControllerClass_softClass;
      uint64_t v36 = getCSProminentDisplayViewControllerClass_softClass;
      if (!getCSProminentDisplayViewControllerClass_softClass)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __getCSProminentDisplayViewControllerClass_block_invoke;
        v32[3] = &unk_1E548C938;
        v32[4] = &v33;
        __getCSProminentDisplayViewControllerClass_block_invoke((uint64_t)v32);
        v18 = (void *)v34[3];
      }
      v19 = v18;
      _Block_object_dispose(&v33, 8);
      id v20 = [v19 alloc];
      v21 = [MEMORY[0x1E4F428B8] systemRedColor];
      uint64_t v22 = [v20 initWithElements:-1 date:0 textColor:v21];
      prominentDisplayViewController = v9->_prominentDisplayViewController;
      v9->_prominentDisplayViewController = (CSProminentDisplayViewController *)v22;

      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:v9 selector:sel__updateAlternateCalendar name:*MEMORY[0x1E4F256A8] object:0];

      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 addObserver:v9 selector:sel__updateAlternateCalendar name:*MEMORY[0x1E4F1C370] object:0];

      [(SBFLockScreenDateViewController *)v9 _updateAlternateCalendar];
    }
    v26 = v9;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __58__SBFLockScreenDateViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained viewIfLoaded];
  v2 = [v1 window];
  v3 = [v2 windowScene];
  v4 = [v3 _backlightSceneEnvironment];
  [v4 invalidateAllTimelinesForReason:@"SBFLockScreenDateViewController: Debug Colors Switch Changed"];
}

- (void)dealloc
{
  [(SBFLockScreenDateViewController *)self _stopUpdateTimer];
  [(BSDefaultObserver *)self->_alwaysOnDefaultsObserver invalidate];
  v3 = +[SBFLegibilityDomain rootSettings];
  [v3 removeKeyObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewController;
  [(SBFLockScreenDateViewController *)&v4 dealloc];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_isVisible withName:@"isVisible"];
  id v5 = (id)[v3 appendBool:self->_screenOff withName:@"screenOff"];
  id v6 = (id)[v3 appendBool:!self->_disablesUpdates withName:@"wantsPreciseTime"];
  id v7 = (id)[v3 appendBool:self->_timerToken != 0 withName:@"preciseTimeEnabled"];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (void)setScreenOff:(BOOL)a3
{
  if (self->_screenOff != a3)
  {
    self->_screenOff = a3;
    [(SBFLockScreenDateViewController *)self _updateState];
    if (self->_screenOff)
    {
      prominentDisplayViewController = self->_prominentDisplayViewController;
      [(CSProminentDisplayViewController *)prominentDisplayViewController setTransientSubtitleText:0];
    }
  }
}

- (BOOL)isSubtitleHidden
{
  v2 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  char v3 = [v2 isSubtitleHidden];

  return v3;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFLockScreenDateViewController *)self dateView];
  [v4 setSubtitleHidden:v3];
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = (_UILegibilitySettings *)a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (self->_legibilitySettings != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBFLockScreenDateViewController *)self _updateLegibilityStrength];
    id v7 = [(SBFLockScreenDateViewController *)self dateView];
    [v7 setLegibilitySettings:*p_legibilitySettings];

    id v5 = v8;
  }
}

- (BOOL)shouldApplyVibrancyToComplications
{
  return [(CSProminentDisplayViewController *)self->_prominentDisplayViewController shouldApplyVibrancyToComplications];
}

- (void)setShouldApplyVibrancyToComplications:(BOOL)a3
{
}

- (void)setRestrictsVibrancy:(BOOL)a3
{
  if (self->_restrictsVibrancy != a3)
  {
    self->_restrictsVibrancy = a3;
    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setEffectType:a3];
  }
}

- (void)setTimeAlpha:(double)a3 subtitleAlpha:(double)a4
{
  id v6 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  [v6 setTimeAlpha:a3 subtitleAlpha:a4];
}

- (void)setBackgroundAlpha:(double)a3
{
  id v4 = [(CSProminentDisplayViewController *)self->_prominentDisplayViewController backgroundView];
  [v4 setAlpha:a3];
}

- (void)setDimmingViewAlpha:(double)a3
{
}

- (double)backgroundAlpha
{
  v2 = [(CSProminentDisplayViewController *)self->_prominentDisplayViewController backgroundView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setCustomSubtitleView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  [v5 setCustomSubtitleView:v4];
}

- (void)setCustomSubtitle:(id)a3
{
  prominentDisplayViewController = self->_prominentDisplayViewController;
  id v6 = a3;
  if ([(SBFLockScreenDateViewController *)self _supportsCoaching]) {
    id v5 = v6;
  }
  else {
    id v5 = 0;
  }
  [(CSProminentDisplayViewController *)prominentDisplayViewController setTransientSubtitleText:v5];
}

- (void)setCustomSubtitle:(id)a3 withTimeout:(double)a4
{
  prominentDisplayViewController = self->_prominentDisplayViewController;
  id v8 = a3;
  if ([(SBFLockScreenDateViewController *)self _supportsCoaching]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  [(CSProminentDisplayViewController *)prominentDisplayViewController setTransientSubtitleText:v7 withTimeout:a4];
}

- (id)transientSubtitleText
{
  return (id)[(CSProminentDisplayViewController *)self->_prominentDisplayViewController transientSubtitleText];
}

- (BOOL)_supportsCoaching
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  [v2 userInterfaceIdiom];

  return _os_feature_enabled_impl();
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  if (self->_alternateDateEnabled != a3)
  {
    self->_alternateDateEnabled = a3;
    [(SBFLockScreenDateViewController *)self _updateAlternateCalendar];
  }
}

- (void)setDateProvider:(id)a3
{
  id v4 = (SBFDefaultDateProvider *)a3;
  if (!v4) {
    id v4 = objc_alloc_init(SBFDefaultDateProvider);
  }
  if ((SBFDefaultDateProvider *)self->_dateProvider != v4)
  {
    obj = v4;
    [(SBFLockScreenDateViewController *)self _stopUpdateTimer];
    objc_storeStrong((id *)&self->_dateProvider, obj);
    if (!self->_disablesUpdates) {
      [(SBFLockScreenDateViewController *)self _startUpdateTimer];
    }
    [(SBFLockScreenDateViewController *)self _updateFormatIfEnabled];
    id v4 = obj;
  }
}

- (void)setInlineComplicationViewController:(id)a3
{
}

- (UIViewController)inlineComplicationViewController
{
  return (UIViewController *)[(CSProminentDisplayViewController *)self->_prominentDisplayViewController subtitleComplicationViewController];
}

- (void)setComplicationContainerViewController:(id)a3
{
}

- (UIViewController)complicationContainerViewController
{
  return (UIViewController *)[(CSProminentDisplayViewController *)self->_prominentDisplayViewController complicationContainerViewController];
}

- (void)updateTimeNow
{
  id v4 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  double v3 = [(SBFDateProviding *)self->_dateProvider date];
  [v4 setDate:v3];
}

- (void)setTimerWithText:(id)a3
{
}

- (void)updateTimerWithText:(id)a3
{
}

- (void)setDateTimeAlignment:(int64_t)a3
{
}

- (void)loadView
{
  double v3 = [SBFLockScreenDateView alloc];
  id v6 = -[SBFLockScreenDateView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBFLockScreenDateView *)v6 setUserInteractionEnabled:0];
  if (_os_feature_enabled_impl())
  {
    [(SBFLockScreenDateViewController *)self addChildViewController:self->_prominentDisplayViewController];
    [(SBFLockScreenDateView *)v6 setProminentDisplayViewController:self->_prominentDisplayViewController];
    id v4 = [(CSProminentDisplayViewController *)self->_prominentDisplayViewController view];
    [(SBFLockScreenDateView *)v6 addSubview:v4];

    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController didMoveToParentViewController:self];
  }
  [(SBFLockScreenDateView *)v6 setLegibilitySettings:self->_legibilitySettings];
  [(SBFLockScreenDateViewController *)self setView:v6];
  [(SBFLockScreenDateViewController *)self _updateLegibilityStrength];
  id v5 = [(SBFDateProviding *)self->_dateProvider date];
  [(SBFLockScreenDateView *)v6 setDate:v5];
}

- (void)setView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController setView:](&v5, sel_setView_);
  if (!a3) {
    [(SBFLockScreenDateViewController *)self _stopUpdateTimer];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateViewController;
  -[SBFLockScreenDateViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    [(SBFLockScreenDateViewController *)self setView:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewController;
  [(SBFLockScreenDateViewController *)&v4 viewWillAppear:a3];
  self->_isVisible = 1;
  [(SBFLockScreenDateViewController *)self _updateState];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewController;
  [(SBFLockScreenDateViewController *)&v4 viewDidDisappear:a3];
  self->_isVisible = 0;
  [(SBFLockScreenDateViewController *)self _updateState];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFLockScreenDateViewController;
  [(SBFLockScreenDateViewController *)&v10 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  id v7 = [(CSProminentDisplayViewController *)self->_prominentDisplayViewController backgroundView];
  id v8 = [v7 layer];

  if (v6)
  {
    v9 = +[SBFAnimationUtilities matchMoveAnimationForPinningToView:v6];
    [v8 addAnimation:v9 forKey:@"SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"];
  }
  else
  {
    [v8 removeAnimationForKey:@"SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)SBFLockScreenDateViewController;
  id v7 = a4;
  -[SBFLockScreenDateViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(CSProminentDisplayViewController *)self->_prominentDisplayViewController backgroundView];
  v9 = [v8 layer];

  objc_super v10 = [v9 animationForKey:@"SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"];
  [v9 removeAnimationForKey:@"SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__SBFLockScreenDateViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E548E138;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [v7 animateAlongsideTransition:0 completion:v13];
}

uint64_t __86__SBFLockScreenDateViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAnimation:*(void *)(a1 + 40) forKey:@"SBFLockScreenDateViewControllerProminentBackgroundMatchMoveAnimation"];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a3;
  id v6 = +[SBFLegibilityDomain rootSettings];

  if (v6 == v5)
  {
    [(SBFLockScreenDateViewController *)self _updateLegibilityStrength];
  }
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v15 = a3;
  BOOL v4 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  if (v15)
  {
    id v5 = [v15 presentationInterval];
    id v6 = [v5 startDate];
    [v4 setDate:v6];

    LODWORD(v5) = [(SBAlwaysOnDefaults *)self->_alwaysOnDefaults useDebugColors];
    id v7 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
    id v8 = v7;
    if (v5)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F43228]);
      objc_super v10 = [MEMORY[0x1E4F428B8] systemYellowColor];
      id v11 = [MEMORY[0x1E4F428B8] systemRedColor];
      id v12 = [MEMORY[0x1E4F428B8] systemBlueColor];
      v13 = (void *)[v9 initWithStyle:0 primaryColor:v10 secondaryColor:v11 shadowColor:v12];
      [v8 setLegibilitySettings:v13];
    }
    else
    {
      [v7 setLegibilitySettings:self->_legibilitySettings];
    }
  }
  else
  {
    [v4 setLegibilitySettings:self->_legibilitySettings];

    id v8 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
    id v14 = [(SBFDateProviding *)self->_dateProvider date];
    [v8 setDate:v14];
  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F4F4B0];
  BOOL v4 = [(id)objc_opt_class() description];
  id v5 = [v3 everyMinuteTimelineWithIdentifier:v4 configure:0];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)_updateAlternateCalendar
{
  double v3 = [MEMORY[0x1E4F256B0] sharedPreferences];
  id v6 = [v3 overlayCalendarID];

  if ([v6 length] && self->_alternateDateEnabled)
  {
    prominentDisplayViewController = self->_prominentDisplayViewController;
    id v5 = [MEMORY[0x1E4F70FE8] localeForCalendarID:v6];
    [(CSProminentDisplayViewController *)prominentDisplayViewController setAlternateCalendarIdentifier:v6 locale:v5];
  }
  else
  {
    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setAlternateCalendarIdentifier:0 locale:0];
  }
}

- (void)_updateState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = MEMORY[0x18C131F20](*a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_18B52E000, a2, OS_LOG_TYPE_DEBUG, "Date view controller disabled updates: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_updateLegibilityStrength
{
  id v6 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  double v3 = [(SBFLockScreenDateViewController *)self legibilitySettings];
  uint64_t v4 = [v3 style];

  id v5 = +[SBFLegibilityDomain rootSettings];
  [v5 timeStrengthForStyle:v4];
  objc_msgSend(v6, "setTimeLegibilityStrength:");
  [v5 dateStrengthForStyle:v4];
  objc_msgSend(v6, "setSubtitleLegibilityStrength:");
}

- (void)_addObservers
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__updateFormat name:*MEMORY[0x1E4F4F608] object:0];
  [v4 addObserver:self selector:sel__updateView name:*MEMORY[0x1E4F43788] object:0];
  [v4 addObserver:self selector:sel__updateView name:*MEMORY[0x1E4F43448] object:0];
  [v4 addObserver:self selector:sel__handleTimeZoneChange name:*MEMORY[0x1E4F1C4F8] object:0];
  double v3 = +[SBFLegibilityDomain rootSettings];
  [v3 addKeyObserver:self];
}

- (void)_updateFormatIfEnabled
{
  if (!self->_disablesUpdates) {
    [(SBFLockScreenDateViewController *)self _updateFormat];
  }
}

- (void)_updateFormat
{
  double v3 = [(SBFLockScreenDateViewController *)self dateViewIfExists];
  [v3 updateFormat];

  [(SBFLockScreenDateViewController *)self _updateView];
}

- (void)_handleTimeZoneChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke(uint64_t a1)
{
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke_cold_1(v2);
  }

  return [*(id *)(a1 + 32) updateTimeNow];
}

- (void)_stopUpdateTimer
{
  if (self->_timerToken)
  {
    -[SBFDateProviding removeMinuteUpdateHandler:](self->_dateProvider, "removeMinuteUpdateHandler:");
    id timerToken = self->_timerToken;
    self->_id timerToken = 0;
  }
}

- (BOOL)screenOff
{
  return self->_screenOff;
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (BOOL)restrictsVibrancy
{
  return self->_restrictsVibrancy;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBFDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_prominentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong(&self->_minuteHandlerToken, 0);
  objc_storeStrong(&self->_timerToken, 0);
}

void __56__SBFLockScreenDateViewController__handleTimeZoneChange__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18B52E000, log, OS_LOG_TYPE_DEBUG, "DashBoard handling time zone change.", v1, 2u);
}

@end