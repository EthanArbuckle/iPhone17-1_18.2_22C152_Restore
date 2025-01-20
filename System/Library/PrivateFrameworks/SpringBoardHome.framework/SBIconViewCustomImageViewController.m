@interface SBIconViewCustomImageViewController
- (BOOL)_needsBackgroundView;
- (BOOL)forcesEdgeAntialiasing;
- (BOOL)sbh_isCustomIconImageViewController;
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (SBIcon)icon;
- (SBIconImageInfo)iconImageInfo;
- (SBIconViewCustomImageViewController)initWithContentViewController:(id)a3;
- (UIView)backgroundView;
- (UIView)snapshotView;
- (UIViewController)contentViewController;
- (double)continuousCornerRadius;
- (double)snapshotViewScaleFactor;
- (id)_createBackgroundView;
- (id)backgroundViewConfigurator;
- (id)backgroundViewProvider;
- (id)contentView;
- (id)sbh_underlyingAvocadoHostViewControllers;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureBackgroundViewIfNecessary:(id)a3;
- (void)_createBackgroundViewIfNecessary:(BOOL)a3;
- (void)_setupStateCapture;
- (void)_teardownBackgroundView;
- (void)_teardownBackgroundView:(id)a3;
- (void)_teardownStateCapture;
- (void)_updateEdgeAntialiasing;
- (void)dealloc;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewConfigurator:(id)a3;
- (void)setBackgroundViewProvider:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setForcesEdgeAntialiasing:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBIconViewCustomImageViewController

- (BOOL)sbh_isCustomIconImageViewController
{
  return 1;
}

- (id)sbh_underlyingAvocadoHostViewControllers
{
  v3 = [(SBIconViewCustomImageViewController *)self contentViewController];
  char v4 = objc_msgSend(v3, "sbh_isWidgetHostViewController");
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  if (v4)
  {
    v6 = [(SBIconViewCustomImageViewController *)self contentViewController];
    v7 = [v5 setWithObject:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

- (SBIconViewCustomImageViewController)initWithContentViewController:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconViewCustomImageViewController;
  v6 = [(SBIconViewCustomImageViewController *)&v12 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    [(SBIconViewCustomImageViewController *)v7 _setupStateCapture];
    v8 = self;
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = (id)[(SBIconViewCustomImageViewController *)v7 registerForTraitChanges:v9 withAction:sel__updateEdgeAntialiasing];
  }
  return v7;
}

- (id)contentView
{
  v2 = [(SBIconViewCustomImageViewController *)self contentViewController];
  v3 = [v2 view];

  return v3;
}

- (void)dealloc
{
  [(SBIconViewCustomImageViewController *)self _teardownStateCapture];
  v3.receiver = self;
  v3.super_class = (Class)SBIconViewCustomImageViewController;
  [(SBIconViewCustomImageViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBIconViewCustomImageViewController;
  [(SBIconViewCustomImageViewController *)&v8 viewDidLoad];
  objc_super v3 = [(SBIconViewCustomImageViewController *)self view];
  char v4 = [(SBIconViewCustomImageViewController *)self contentViewController];
  id v5 = [v4 view];
  [(SBIconViewCustomImageViewController *)self addChildViewController:v4];
  [v3 addSubview:v5];
  [v4 didMoveToParentViewController:self];
  [(SBIconViewCustomImageViewController *)self iconImageInfo];
  double v7 = v6;
  [v3 _setContinuousCornerRadius:v6];
  [v5 _setContinuousCornerRadius:v7];
  [(SBIconViewCustomImageViewController *)self _createBackgroundViewIfNecessary:1];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SBIconViewCustomImageViewController;
  [(SBIconViewCustomImageViewController *)&v10 viewDidLayoutSubviews];
  objc_super v3 = [(SBIconViewCustomImageViewController *)self view];
  [v3 bounds];
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = [(SBIconViewCustomImageViewController *)self contentView];
  objc_msgSend(v8, "setCenter:", v5, v7);
  v9 = [(SBIconViewCustomImageViewController *)self backgroundView];
  [v8 bounds];
  objc_msgSend(v9, "setBounds:");
  objc_msgSend(v9, "setCenter:", v5, v7);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewCustomImageViewController;
  [(SBIconViewCustomImageViewController *)&v4 viewWillAppear:a3];
  [(SBIconViewCustomImageViewController *)self _createBackgroundViewIfNecessary:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewCustomImageViewController;
  [(SBIconViewCustomImageViewController *)&v4 viewDidDisappear:a3];
  [(SBIconViewCustomImageViewController *)self _teardownBackgroundView];
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    if ([(SBIconViewCustomImageViewController *)self isViewLoaded])
    {
      v13 = [(SBIconViewCustomImageViewController *)self view];
      [v13 _setContinuousCornerRadius:v7];

      id v14 = [(SBIconViewCustomImageViewController *)self contentView];
      [v14 _setContinuousCornerRadius:v7];
    }
  }
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    [(SBIconViewCustomImageViewController *)self _updateEdgeAntialiasing];
  }
}

- (void)setBackgroundViewProvider:(id)a3
{
  if (self->_backgroundViewProvider != a3)
  {
    double v4 = (void *)[a3 copy];
    id backgroundViewProvider = self->_backgroundViewProvider;
    self->_id backgroundViewProvider = v4;

    [(SBIconViewCustomImageViewController *)self _teardownBackgroundView];
    [(SBIconViewCustomImageViewController *)self _createBackgroundViewIfNecessary:1];
  }
}

- (UIView)snapshotView
{
  double v3 = [(SBIconViewCustomImageViewController *)self contentViewController];
  double v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = v3;
    double v7 = [v6 snapshotView];
    double v8 = [v6 metrics];

    [v8 scaleFactor];
    double v10 = 1.0 / v9;
  }
  else
  {
    double v8 = [(SBIconViewCustomImageViewController *)self view];
    double v7 = [v8 snapshotViewAfterScreenUpdates:0];
    double v10 = 1.0;
  }

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, v10, v10);
  [v7 frame];
  CGAffineTransform v13 = v14;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v13);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  [v11 addSubview:v7];
  [v11 bounds];
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  CGAffineTransform v13 = v14;
  [v7 setTransform:&v13];

  return (UIView *)v11;
}

- (double)snapshotViewScaleFactor
{
  return 1.0;
}

- (double)continuousCornerRadius
{
  [(SBIconViewCustomImageViewController *)self iconImageInfo];
  return v2;
}

- (CGRect)visibleBounds
{
  double v2 = [(SBIconViewCustomImageViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_updateEdgeAntialiasing
{
  double v3 = [(SBIconViewCustomImageViewController *)self view];
  id v7 = [v3 layer];

  double v4 = [(SBIconViewCustomImageViewController *)self traitCollection];
  [v4 displayScale];
  double v6 = v5;

  [v7 setAllowsEdgeAntialiasing:self->_forcesEdgeAntialiasing];
  [v7 setShouldRasterize:self->_forcesEdgeAntialiasing];
  [v7 setRasterizationScale:v6];
}

- (BOOL)_needsBackgroundView
{
  return 0;
}

- (void)_createBackgroundViewIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SBIconViewCustomImageViewController *)self bs_isDisappearingOrDisappeared] & 1) == 0
    && !self->_backgroundView
    && (!v3 || [(SBIconViewCustomImageViewController *)self _needsBackgroundView]))
  {
    double v5 = [(SBIconViewCustomImageViewController *)self _createBackgroundView];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    if (self->_backgroundView)
    {
      -[SBIconViewCustomImageViewController _configureBackgroundViewIfNecessary:](self, "_configureBackgroundViewIfNecessary:");
      id v7 = [(SBIconViewCustomImageViewController *)self view];
      [v7 insertSubview:self->_backgroundView atIndex:0];
    }
  }
}

- (id)_createBackgroundView
{
  id backgroundViewProvider = (void (**)(id, SEL))self->_backgroundViewProvider;
  if (backgroundViewProvider) {
    backgroundViewProvider[2](backgroundViewProvider, a2);
  }
  else {
  double v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
  }
  [v4 setClipsToBounds:!self->_showsSquareCorners];
  [(SBIconViewCustomImageViewController *)self iconImageInfo];
  [v4 _setContinuousCornerRadius:v5];
  return v4;
}

- (void)_teardownBackgroundView
{
  if (self->_backgroundView) {
    -[SBIconViewCustomImageViewController _teardownBackgroundView:](self, "_teardownBackgroundView:");
  }
}

- (void)_teardownBackgroundView:(id)a3
{
  double v4 = (UIView *)a3;
  if (v4)
  {
    double v5 = v4;
    [(UIView *)v4 removeFromSuperview];
    double v4 = v5;
    if (self->_backgroundView == v5)
    {
      self->_backgroundView = 0;

      double v4 = v5;
    }
  }
}

- (void)_configureBackgroundViewIfNecessary
{
}

- (void)_configureBackgroundViewIfNecessary:(id)a3
{
  id v8 = a3;
  double v4 = [(SBIconViewCustomImageViewController *)self icon];
  double v5 = [v4 activeDataSource];
  if (v8)
  {
    backgroundViewConfigurator = (void (**)(id, id, void *))self->_backgroundViewConfigurator;
    if (backgroundViewConfigurator && v5 != 0) {
      backgroundViewConfigurator[2](backgroundViewConfigurator, v8, v5);
    }
  }
}

- (void)_setupStateCapture
{
  if (!self->_stateCaptureInvalidatable)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    objc_copyWeak(&v8, &location);
    BSLogAddStateCaptureBlockWithTitle();
    double v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = v6;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

__CFString *__57__SBIconViewCustomImageViewController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = [MEMORY[0x1E4F4F718] builderWithObject:WeakRetained];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __57__SBIconViewCustomImageViewController__setupStateCapture__block_invoke_2;
    double v9 = &unk_1E6AACA90;
    id v10 = v2;
    id v11 = WeakRetained;
    id v3 = v2;
    [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
    objc_msgSend(v3, "build", v6, v7, v8, v9);
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v4 = &stru_1F2FA0300;
  }

  return v4;
}

void __57__SBIconViewCustomImageViewController__setupStateCapture__block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) viewIfLoaded];
  id v4 = (id)[v2 appendObject:v3 withName:@"viewIfLoaded"];

  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) viewIfLoaded];
  uint64_t v7 = [v6 window];
  id v8 = (id)[v5 appendObject:v7 withName:@"windowIfLoaded"];

  id v9 = *(id *)(*(void *)(a1 + 40) + 1016);
  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    v13[0] = *(void *)(*(void *)(a1 + 40) + 1016);
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = (id)objc_msgSend(v10, "sbh_appendDescriptionsForViewControllers:", v11);
  }
}

- (void)_teardownStateCapture
{
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  if (stateCaptureInvalidatable)
  {
    [(BSInvalidatable *)stateCaptureInvalidatable invalidate];
    id v4 = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = 0;
  }
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (id)backgroundViewConfigurator
{
  return self->_backgroundViewConfigurator;
}

- (void)setBackgroundViewConfigurator:(id)a3
{
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong(&self->_backgroundViewConfigurator, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
}

@end