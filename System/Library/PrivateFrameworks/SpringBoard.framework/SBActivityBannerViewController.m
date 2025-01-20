@interface SBActivityBannerViewController
+ (NSString)requesterIdentifier;
- (BOOL)_hasBackgroundTintColor;
- (BOOL)_shouldHaveBackgroundTint;
- (BOOL)_shouldSetDefaultBackground;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSString)materialGroupNameBase;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSTimer)dismissalTimer;
- (PLPlatterView)platterView;
- (SBActivityBannerViewControllerDelegate)bannerDelegate;
- (SBWindowSceneStatusBarSettingsAssertion)appStatusBarSettingsAssertion;
- (UIView)backgroundTintView;
- (id)_activityIdentifier;
- (id)_backgroundTintColorForUserInterfaceStyle:(int64_t)a3;
- (void)_dismiss;
- (void)_extendDismissalTimer;
- (void)_layoutSubviews;
- (void)_updateAppStatusBarSettingsAssertion;
- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setAppStatusBarSettingsAssertion:(id)a3;
- (void)setBannerDelegate:(id)a3;
- (void)setDismissalTimer:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)userInterfaceStyleChangedForEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBActivityBannerViewController

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(SBActivityViewController *)self activityItem];
  v5 = [v4 descriptor];
  v6 = [v5 platterTargetBundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.VoiceMemos"];

  if (v7) {
    [v3 addObject:*MEMORY[0x1E4FA9668]];
  }
  return (NSSet *)v3;
}

+ (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.springboard.activity";
}

- (NSString)requesterIdentifier
{
  v2 = objc_opt_class();
  return (NSString *)[v2 requesterIdentifier];
}

- (NSString)requestIdentifier
{
  v3 = [(SBActivityViewController *)self activityItem];
  v4 = [v3 descriptor];

  id v5 = [NSString alloc];
  v6 = [v4 platterTargetBundleIdentifier];
  int v7 = [(SBActivityBannerViewController *)self _activityIdentifier];
  v8 = (void *)[v5 initWithFormat:@"%@.%@", v6, v7];

  return (NSString *)v8;
}

- (id)_activityIdentifier
{
  v2 = [(SBActivityViewController *)self activityItem];
  v3 = [v2 descriptor];
  v4 = [v3 activityIdentifier];

  return v4;
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat width = a4.width;
  [(SBActivityViewController *)self preferredActivityContentSize];
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)viewDidLoad
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBActivityBannerViewController;
  [(SBActivityViewController *)&v26 viewDidLoad];
  v27[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v4 = (id)[(SBActivityBannerViewController *)self registerForTraitChanges:v3 withAction:sel_userInterfaceStyleChangedForEnvironment_previousTraitCollection_];

  double v5 = [(SBActivityViewController *)self activityHostViewController];
  double v6 = [v5 backgroundTintColor];

  if ([(SBActivityBannerViewController *)self _shouldSetDefaultBackground])
  {
    int v7 = [(SBActivityBannerViewController *)self traitCollection];
    uint64_t v8 = -[SBActivityBannerViewController _backgroundTintColorForUserInterfaceStyle:](self, "_backgroundTintColorForUserInterfaceStyle:", [v7 userInterfaceStyle]);

    double v6 = (void *)v8;
  }
  if (v6) {
    uint64_t v9 = 22;
  }
  else {
    uint64_t v9 = 1;
  }
  v10 = [(SBActivityBannerViewController *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceStyle];

  v12 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:v9];
  platterView = self->_platterView;
  self->_platterView = v12;

  [(PLPlatterView *)self->_platterView setUsesBackgroundView:1];
  [(PLPlatterView *)self->_platterView setOverrideUserInterfaceStyle:v11];
  [(SBActivityBannerViewController *)self setMaterialGroupNameBase:@"Activities"];
  [(PLPlatterView *)self->_platterView setHasShadow:1];
  v14 = [(SBActivityViewController *)self activityHostViewController];
  v15 = [v14 activitySceneDescriptor];

  v16 = [v15 metricsRequest];
  v17 = [v16 lockScreenMetrics];
  [v17 cornerRadius];
  double v19 = v18;

  [(PLPlatterView *)self->_platterView _setContinuousCornerRadius:v19];
  if ([(SBActivityBannerViewController *)self _shouldHaveBackgroundTint])
  {
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    backgroundTintView = self->_backgroundTintView;
    self->_backgroundTintView = v20;

    [(UIView *)self->_backgroundTintView _setContinuousCornerRadius:v19];
    [(UIView *)self->_backgroundTintView setBackgroundColor:v6];
    v22 = [(SBActivityBannerViewController *)self view];
    [v22 addSubview:self->_backgroundTintView];

    v23 = [(SBActivityBannerViewController *)self view];
    [v23 sendSubviewToBack:self->_backgroundTintView];
  }
  v24 = [(SBActivityBannerViewController *)self view];
  [v24 addSubview:self->_platterView];

  v25 = [(SBActivityBannerViewController *)self view];
  [v25 sendSubviewToBack:self->_platterView];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBActivityBannerViewController;
  [(SBActivityViewController *)&v3 viewWillLayoutSubviews];
  [(SBActivityBannerViewController *)self _layoutSubviews];
}

- (void)_layoutSubviews
{
  objc_super v3 = [(SBActivityBannerViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  [(SBActivityViewController *)self preferredActivityContentSize];
  double v8 = v7;
  if (v5 - v6 <= 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = (v5 - v6) * 0.5;
  }
  if (v6 < v5) {
    double v5 = v6;
  }
  [(PLPlatterView *)self->_platterView setFrame:v9];
  if ([(SBActivityBannerViewController *)self _shouldHaveBackgroundTint])
  {
    v10 = [(SBActivityViewController *)self activityHostViewController];
    id v19 = [v10 backgroundTintColor];

    if ([(SBActivityBannerViewController *)self _shouldSetDefaultBackground])
    {
      uint64_t v11 = [(SBActivityBannerViewController *)self traitCollection];
      uint64_t v12 = -[SBActivityBannerViewController _backgroundTintColorForUserInterfaceStyle:](self, "_backgroundTintColorForUserInterfaceStyle:", [v11 userInterfaceStyle]);

      id v13 = (id)v12;
    }
    else
    {
      id v13 = v19;
    }
    backgroundTintView = self->_backgroundTintView;
    id v20 = v13;
    if (!backgroundTintView)
    {
      v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      v16 = self->_backgroundTintView;
      self->_backgroundTintView = v15;

      [(UIView *)self->_backgroundTintView removeFromSuperview];
      v17 = [(SBActivityBannerViewController *)self view];
      [v17 addSubview:self->_backgroundTintView];

      double v18 = [(SBActivityBannerViewController *)self view];
      [v18 sendSubviewToBack:self->_backgroundTintView];

      [(UIView *)self->_backgroundTintView bringSubviewToFront:self->_platterView];
      id v13 = v20;
      backgroundTintView = self->_backgroundTintView;
    }
    [(UIView *)backgroundTintView setBackgroundColor:v13];
    -[UIView setBounds:](self->_backgroundTintView, "setBounds:", v9, 0.0, v5, v8);
    -[UIView setFrame:](self->_backgroundTintView, "setFrame:", v9, 0.0, v5, v8);
  }
}

- (BOOL)_hasBackgroundTintColor
{
  v2 = [(SBActivityViewController *)self activityHostViewController];
  objc_super v3 = [v2 backgroundTintColor];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_shouldSetDefaultBackground
{
  if ([(SBActivityBannerViewController *)self _hasBackgroundTintColor]) {
    return 0;
  }
  BOOL v4 = [(SBActivityViewController *)self activityItem];
  double v5 = [v4 descriptor];
  BOOL v3 = [v5 contentType] == 0;

  return v3;
}

- (BOOL)_shouldHaveBackgroundTint
{
  if ([(SBActivityBannerViewController *)self _hasBackgroundTintColor]) {
    return 1;
  }
  return [(SBActivityBannerViewController *)self _shouldSetDefaultBackground];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = [(SBActivityBannerViewController *)self bannerDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(SBActivityBannerViewController *)self _activityIdentifier];
    [v5 activityBannerDidDisappear:self activityIdentifier:v6];
  }
  double v7 = [(SBActivityViewController *)self activityItem];
  double v8 = [v7 descriptor];
  int v9 = [v8 isMomentary];

  if (v9)
  {
    v10 = [(SBActivityViewController *)self activityItem];
    uint64_t v11 = [v10 identifier];

    uint64_t v12 = SBLogActivity();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] banner dismissed but is momentary so ending activity", (uint8_t *)&v14, 0xCu);
    }

    id v13 = objc_alloc_init(MEMORY[0x1E4F18130]);
    [v13 endActivity:v11];
  }
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivityBannerViewController;
  [(SBActivityViewController *)&v6 activityHostViewControllerBackgroundTintColorDidChange:a3];
  BOOL v4 = [(SBActivityBannerViewController *)self view];
  [v4 setNeedsLayout];

  double v5 = [(SBActivityBannerViewController *)self view];
  [v5 layoutIfNeeded];
}

- (id)_backgroundTintColorForUserInterfaceStyle:(int64_t)a3
{
  BOOL v4 = self;
  if ([(SBActivityBannerViewController *)self _hasBackgroundTintColor])
  {
    double v5 = [v4 activityHostViewController];
    BOOL v4 = [v5 backgroundTintColor];

    goto LABEL_9;
  }
  if (!a3 || a3 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_9;
    }
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  BOOL v4 = (void *)v6;
LABEL_9:
  return v4;
}

- (void)userInterfaceStyleChangedForEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBActivityBannerViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  uint64_t v8 = [v5 userInterfaceStyle];
  if (v8 != v7)
  {
    id v9 = [(SBActivityBannerViewController *)self view];
    [v9 setNeedsLayout];
  }
}

- (NSString)materialGroupNameBase
{
  return [(PLPlatterView *)self->_platterView materialGroupNameBase];
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (void)_updateAppStatusBarSettingsAssertion
{
  id v15 = [(SBActivityBannerViewController *)self preferredBackgroundActivitiesToSuppress];
  if ([v15 count]
    && [(SBActivityBannerViewController *)self bs_isAppearingOrAppeared])
  {
    BOOL v3 = [(UIViewController *)self _sbWindowScene];
    BOOL v4 = [v3 statusBarManager];
    id v5 = [v4 assertionManager];

    uint64_t v6 = objc_alloc_init(SBMutableStatusBarSettings);
    [(SBMutableStatusBarSettings *)v6 setBackgroundActivitiesToSuppress:v15];
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = (SBWindowSceneStatusBarSettingsAssertion *)[v5 newSettingsAssertionWithSettings:v6 atLevel:7 reason:v8];
    appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = v9;

    uint64_t v11 = self->_appStatusBarSettingsAssertion;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v11 acquireWithAnimationParameters:v12];
  }
  else
  {
    id v13 = self->_appStatusBarSettingsAssertion;
    if (!v13) {
      goto LABEL_7;
    }
    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v13 invalidateWithAnimationParameters:v14];

    id v5 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = 0;
  }

LABEL_7:
}

- (void)_dismiss
{
  id v4 = [(SBActivityBannerViewController *)self bannerDelegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(SBActivityBannerViewController *)self _activityIdentifier];
    [v4 activityBannerWantsToBeDismissed:self activityIdentifier:v3];
  }
}

- (void)_extendDismissalTimer
{
  [(NSTimer *)self->_dismissalTimer invalidate];
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = 0;

  if (!self->_dismissalTimer)
  {
    objc_initWeak(&location, self);
    id v4 = (void *)MEMORY[0x1E4F1CB00];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SBActivityBannerViewController__extendDismissalTimer__block_invoke;
    v7[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v8, &location);
    id v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:8.0];
    uint64_t v6 = self->_dismissalTimer;
    self->_dismissalTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__SBActivityBannerViewController__extendDismissalTimer__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dismiss];
  [v3 invalidate];

  [WeakRetained setDismissalTimer:0];
}

- (SBActivityBannerViewControllerDelegate)bannerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bannerDelegate);
  return (SBActivityBannerViewControllerDelegate *)WeakRetained;
}

- (void)setBannerDelegate:(id)a3
{
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (UIView)backgroundTintView
{
  return self->_backgroundTintView;
}

- (SBWindowSceneStatusBarSettingsAssertion)appStatusBarSettingsAssertion
{
  return self->_appStatusBarSettingsAssertion;
}

- (void)setAppStatusBarSettingsAssertion:(id)a3
{
}

- (NSTimer)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_bannerDelegate);
}

@end