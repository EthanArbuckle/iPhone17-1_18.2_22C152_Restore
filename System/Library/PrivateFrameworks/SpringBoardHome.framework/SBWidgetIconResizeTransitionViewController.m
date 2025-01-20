@interface SBWidgetIconResizeTransitionViewController
- (BOOL)crossfades;
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (NSDictionary)viewControllers;
- (NSString)description;
- (NSString)endingGridSizeClass;
- (NSString)startingGridSizeClass;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconGridSizeClassSet)allowedGridSizeClasses;
- (SBHIconGridSizeClassSet)effectiveAllowedGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBHWidgetIconResizeViewHelper)viewHelper;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListLayout)listLayout;
- (SBLeafIcon)leafIcon;
- (SBWidgetIconResizeTransitionViewController)initWithLeafIcon:(id)a3 allowedGridSizeClasses:(id)a4 gridSizeClassDomain:(id)a5 viewHelper:(id)a6 options:(unint64_t)a7;
- (SBWidgetIconResizeTransitionViewControllerDelegate)delegate;
- (UIView)endingBlurView;
- (UIView)startingBlurView;
- (UIViewController)endingViewController;
- (UIViewController)startingViewController;
- (double)continuousCornerRadius;
- (double)endingCornerRadius;
- (double)startingCornerRadius;
- (double)transitionProgress;
- (id)blurViewWithInputRadius:(double)a3;
- (id)effectiveGridSizeClassDomain;
- (id)replacementIconDataSourceForIconDataSource:(id)a3 gridSizeClass:(id)a4;
- (id)replacementIconForIcon:(id)a3 gridSizeClass:(id)a4;
- (id)succinctDescription;
- (id)viewControllerForGridSizeClass:(id)a3;
- (unint64_t)options;
- (void)appendDescriptionToStream:(id)a3;
- (void)gatherViewControllers;
- (void)invalidate;
- (void)loadView;
- (void)setCrossfades:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEndingBlurView:(id)a3;
- (void)setEndingCornerRadius:(double)a3;
- (void)setEndingGridSizeClass:(id)a3;
- (void)setEndingGridSizeClass:(id)a3 animated:(BOOL)a4;
- (void)setEndingViewController:(id)a3;
- (void)setEndingViewController:(id)a3 animated:(BOOL)a4;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setStartingBlurView:(id)a3;
- (void)setStartingCornerRadius:(double)a3;
- (void)setStartingGridSizeClass:(id)a3;
- (void)setStartingViewController:(id)a3;
- (void)setTransitionProgress:(double)a3;
- (void)setViewControllers:(id)a3;
- (void)swapViewControllers;
- (void)updateCornerRadius;
- (void)updateTransitionProgress;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBWidgetIconResizeTransitionViewController

- (SBWidgetIconResizeTransitionViewController)initWithLeafIcon:(id)a3 allowedGridSizeClasses:(id)a4 gridSizeClassDomain:(id)a5 viewHelper:(id)a6 options:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SBWidgetIconResizeTransitionViewController;
  v17 = [(SBWidgetIconResizeTransitionViewController *)&v38 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_leafIcon, a3);
    uint64_t v19 = [v14 copy];
    allowedGridSizeClasses = v18->_allowedGridSizeClasses;
    v18->_allowedGridSizeClasses = (SBHIconGridSizeClassSet *)v19;

    objc_storeStrong((id *)&v18->_gridSizeClassDomain, a5);
    objc_storeStrong((id *)&v18->_viewHelper, a6);
    v18->_options = a7;
    if (a7)
    {
      uint64_t v24 = [v14 copy];
      effectiveAllowedGridSizeClasses = v18->_effectiveAllowedGridSizeClasses;
      v18->_effectiveAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v24;
    }
    else
    {
      effectiveAllowedGridSizeClasses = [v13 supportedGridSizeClasses];
      uint64_t v22 = [effectiveAllowedGridSizeClasses gridSizeClassSetByIntersectingWithGridSizeClassSet:v14];
      v23 = v18->_effectiveAllowedGridSizeClasses;
      v18->_effectiveAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v22;
    }
    uint64_t v25 = [v16 listLayout];
    listLayout = v18->_listLayout;
    v18->_listLayout = (SBIconListLayout *)v25;

    uint64_t v27 = [v16 orientation];
    v28 = SBHIconListLayoutIconGridSizeClassSizes(v18->_listLayout, v27);
    uint64_t v29 = [v28 copy];
    iconGridSizeClassSizes = v18->_iconGridSizeClassSizes;
    v18->_iconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v29;

    v31 = [v13 gridSizeClass];
    uint64_t v32 = [v31 copy];
    startingGridSizeClass = v18->_startingGridSizeClass;
    v18->_startingGridSizeClass = (NSString *)v32;

    uint64_t v34 = [(NSDictionary *)v18->_viewControllers objectForKey:v18->_startingGridSizeClass];
    startingViewController = v18->_startingViewController;
    v18->_startingViewController = (UIViewController *)v34;

    SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v18->_listLayout, v27, v18->_startingGridSizeClass);
    v18->_startingCornerRadius = v36;
  }

  return v18;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setClipsToBounds:1];
  [(SBWidgetIconResizeTransitionViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SBWidgetIconResizeTransitionViewController;
  [(SBWidgetIconResizeTransitionViewController *)&v6 viewDidLoad];
  [(SBWidgetIconResizeTransitionViewController *)self gatherViewControllers];
  id v3 = [(SBWidgetIconResizeTransitionViewController *)self startingViewController];
  v4 = [(SBWidgetIconResizeTransitionViewController *)self endingViewController];
  if (v4) {
    [(SBWidgetIconResizeTransitionViewController *)self bs_addChildViewController:v4];
  }
  if (v3)
  {
    [(SBWidgetIconResizeTransitionViewController *)self bs_addChildViewController:v3];
  }
  else
  {
    v5 = [(SBWidgetIconResizeTransitionViewController *)self startingGridSizeClass];
    id v3 = [(SBWidgetIconResizeTransitionViewController *)self viewControllerForGridSizeClass:v5];
    [(SBWidgetIconResizeTransitionViewController *)self setStartingViewController:v3];
  }
  [(SBWidgetIconResizeTransitionViewController *)self updateCornerRadius];
}

- (void)setStartingGridSizeClass:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_startingGridSizeClass != v4 && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    objc_super v6 = SBLogWidgetResizing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "setting resize starting grid size class to %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v7 = (NSString *)[(NSString *)v5 copy];
    startingGridSizeClass = self->_startingGridSizeClass;
    self->_startingGridSizeClass = v7;

    v9 = [(SBWidgetIconResizeTransitionViewController *)self viewControllerForGridSizeClass:v5];
    [(SBWidgetIconResizeTransitionViewController *)self setStartingViewController:v9];
    v10 = [(SBWidgetIconResizeTransitionViewController *)self listLayout];
    v11 = [(SBWidgetIconResizeTransitionViewController *)self viewHelper];
    SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v10, [v11 orientation], v5);
    [(SBWidgetIconResizeTransitionViewController *)self setStartingCornerRadius:v12];
  }
}

- (void)setStartingViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  startingViewController = self->_startingViewController;
  if (startingViewController != v5)
  {
    double v12 = v5;
    [(UIViewController *)startingViewController removeFromParentViewController];
    v7 = [(UIViewController *)self->_startingViewController viewIfLoaded];
    [v7 removeFromSuperview];

    v8 = [(SBWidgetIconResizeTransitionViewController *)self startingBlurView];
    [v8 removeFromSuperview];

    [(SBWidgetIconResizeTransitionViewController *)self setStartingBlurView:0];
    objc_storeStrong((id *)&self->_startingViewController, a3);
    v5 = v12;
    if (v12)
    {
      v9 = [(UIViewController *)v12 view];
      if ([(SBWidgetIconResizeTransitionViewController *)self isViewLoaded])
      {
        [(SBWidgetIconResizeTransitionViewController *)self bs_addChildViewController:v12];
        v10 = [(SBWidgetIconResizeTransitionViewController *)self view];
        [v10 bringSubviewToFront:v9];
      }
      v11 = [(SBWidgetIconResizeTransitionViewController *)self blurViewWithInputRadius:0.0];
      [v9 addSubview:v11];
      [(SBWidgetIconResizeTransitionViewController *)self setStartingBlurView:v11];
      [(SBWidgetIconResizeTransitionViewController *)self updateTransitionProgress];

      v5 = v12;
    }
  }
}

- (void)setStartingCornerRadius:(double)a3
{
  if (self->_startingCornerRadius != a3)
  {
    self->_startingCornerRadius = a3;
    [(SBWidgetIconResizeTransitionViewController *)self updateCornerRadius];
  }
}

- (void)setEndingGridSizeClass:(id)a3
{
}

- (void)setEndingGridSizeClass:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (NSString *)a3;
  v7 = v6;
  if (self->_endingGridSizeClass != v6 && !-[NSString isEqualToString:](v6, "isEqualToString:"))
  {
    v8 = SBLogWidgetResizing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "setting resize ending grid size class to %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v9 = (NSString *)[(NSString *)v7 copy];
    endingGridSizeClass = self->_endingGridSizeClass;
    self->_endingGridSizeClass = v9;

    if (v7)
    {
      v11 = [(SBWidgetIconResizeTransitionViewController *)self viewControllerForGridSizeClass:v7];
      double v12 = [(SBWidgetIconResizeTransitionViewController *)self listLayout];
      int v13 = [(SBWidgetIconResizeTransitionViewController *)self viewHelper];
      SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v12, [v13 orientation], v7);
      double v15 = v14;
    }
    else
    {
      v11 = 0;
      double v15 = 0.0;
    }
    [(SBWidgetIconResizeTransitionViewController *)self setEndingViewController:v11 animated:v4];
    [(SBWidgetIconResizeTransitionViewController *)self setEndingCornerRadius:v15];
  }
}

- (void)setEndingViewController:(id)a3
{
}

- (void)setEndingViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIViewController *)a3;
  endingViewController = self->_endingViewController;
  if (endingViewController != v7)
  {
    v9 = [(UIViewController *)endingViewController viewIfLoaded];
    [(UIViewController *)self->_endingViewController removeFromParentViewController];
    v10 = [(SBWidgetIconResizeTransitionViewController *)self endingBlurView];
    [v10 removeFromSuperview];

    [(SBWidgetIconResizeTransitionViewController *)self setEndingBlurView:0];
    objc_storeStrong((id *)&self->_endingViewController, a3);
    if (v7)
    {
      v11 = [(UIViewController *)v7 view];
      if ([(SBWidgetIconResizeTransitionViewController *)self isViewLoaded])
      {
        [(SBWidgetIconResizeTransitionViewController *)self bs_addChildViewController:v7];
        double v12 = [(SBWidgetIconResizeTransitionViewController *)self view];
        [v12 sendSubviewToBack:v11];
      }
      if (v4)
      {
        int v13 = (void *)MEMORY[0x1E4FB1EB0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke;
        v20[3] = &unk_1E6AAC810;
        id v21 = v9;
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        v17 = __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke_2;
        uint64_t v18 = &unk_1E6AACAB8;
        id v19 = v21;
        [v13 animateWithDuration:v20 animations:&v15 completion:0.2];
      }
      else
      {
        [v9 removeFromSuperview];
      }
      double v14 = -[SBWidgetIconResizeTransitionViewController blurViewWithInputRadius:](self, "blurViewWithInputRadius:", 15.0, v15, v16, v17, v18);
      [v11 addSubview:v14];
      [(SBWidgetIconResizeTransitionViewController *)self setEndingBlurView:v14];
      [(SBWidgetIconResizeTransitionViewController *)self updateTransitionProgress];
    }
    else
    {
      [v9 removeFromSuperview];
    }
  }
}

uint64_t __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __79__SBWidgetIconResizeTransitionViewController_setEndingViewController_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setEndingCornerRadius:(double)a3
{
  if (self->_endingCornerRadius != a3)
  {
    self->_endingCornerRadius = a3;
    [(SBWidgetIconResizeTransitionViewController *)self updateCornerRadius];
  }
}

- (void)setTransitionProgress:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_transitionProgress != a3)
  {
    v5 = SBLogWidgetResizing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      double v7 = a3;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "setting resize transition progress to %f", (uint8_t *)&v6, 0xCu);
    }

    self->_transitionProgress = a3;
    [(SBWidgetIconResizeTransitionViewController *)self updateCornerRadius];
    [(SBWidgetIconResizeTransitionViewController *)self updateTransitionProgress];
  }
}

- (id)blurViewWithInputRadius:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v5 = (void *)[v4 initWithType:*MEMORY[0x1E4F3A0D0]];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  [v5 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1A0]];
  [v5 setValue:v6 forKey:*MEMORY[0x1E4F3A1B8]];
  double v7 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v7 forKey:*MEMORY[0x1E4F3A1D8]];

  [v5 setValue:@"medium" forKey:*MEMORY[0x1E4F3A1D0]];
  uint64_t v8 = objc_alloc_init(SBWidgetIconResizeBackdropView);
  v9 = [(SBWidgetIconResizeBackdropView *)v8 layer];
  v13[0] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v9 setFilters:v10];

  id v11 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  [v9 setScale:100.0];
  [v9 setAllowsGroupOpacity:1];
  [v9 setAllowsEdgeAntialiasing:1];

  return v8;
}

- (void)updateTransitionProgress
{
  [(SBWidgetIconResizeTransitionViewController *)self transitionProgress];
  double v4 = v3;
  id v18 = [(SBWidgetIconResizeTransitionViewController *)self startingViewController];
  v5 = [v18 view];
  [v5 setAlpha:1.0 - v4];
  uint64_t v6 = [(SBWidgetIconResizeTransitionViewController *)self endingViewController];
  double v7 = [v6 view];
  [v7 setAlpha:1.0];
  uint64_t v8 = [(SBWidgetIconResizeTransitionViewController *)self startingBlurView];
  v9 = [v8 layer];

  int v10 = [v18 isContentReady];
  double v11 = v4 * 15.0 + (1.0 - v4) * 0.0;
  if (!v10) {
    double v11 = 15.0;
  }
  double v12 = [NSNumber numberWithDouble:v11];
  [v9 setValue:v12 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  int v13 = [(SBWidgetIconResizeTransitionViewController *)self endingBlurView];
  double v14 = [v13 layer];

  int v15 = [v6 isContentReady];
  double v16 = (1.0 - v4) * 15.0 + (1.0 - (1.0 - v4)) * 0.0;
  if (!v15) {
    double v16 = 15.0;
  }
  v17 = [NSNumber numberWithDouble:v16];
  [v14 setValue:v17 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)updateCornerRadius
{
  id v8 = [(SBWidgetIconResizeTransitionViewController *)self viewIfLoaded];
  [(SBWidgetIconResizeTransitionViewController *)self startingCornerRadius];
  double v4 = v3;
  [(SBWidgetIconResizeTransitionViewController *)self endingCornerRadius];
  double v6 = v5;
  [(SBWidgetIconResizeTransitionViewController *)self transitionProgress];
  [v8 _setContinuousCornerRadius:v6 * v7 + (1.0 - v7) * v4];
}

- (void)swapViewControllers
{
  double v3 = [(SBWidgetIconResizeTransitionViewController *)self startingViewController];
  double v4 = [(SBWidgetIconResizeTransitionViewController *)self endingViewController];
  startingViewController = self->_startingViewController;
  self->_startingViewController = v4;
  double v6 = v4;

  endingViewController = self->_endingViewController;
  self->_endingViewController = v3;
  id v8 = v3;

  v9 = [(SBWidgetIconResizeTransitionViewController *)self startingBlurView];
  int v10 = [(SBWidgetIconResizeTransitionViewController *)self endingBlurView];
  startingBlurView = self->_startingBlurView;
  self->_startingBlurView = v10;
  double v12 = v10;

  endingBlurView = self->_endingBlurView;
  self->_endingBlurView = v9;

  id v17 = [(SBWidgetIconResizeTransitionViewController *)self view];
  double v14 = [(UIViewController *)v8 view];

  [v17 bringSubviewToFront:v14];
  int v15 = [(SBWidgetIconResizeTransitionViewController *)self startingGridSizeClass];
  double v16 = [(SBWidgetIconResizeTransitionViewController *)self endingGridSizeClass];
  [(SBWidgetIconResizeTransitionViewController *)self setStartingGridSizeClass:v16];
  [(SBWidgetIconResizeTransitionViewController *)self setEndingGridSizeClass:v15];
}

- (void)viewDidLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)SBWidgetIconResizeTransitionViewController;
  [(SBWidgetIconResizeTransitionViewController *)&v46 viewDidLayoutSubviews];
  double v3 = [(SBWidgetIconResizeTransitionViewController *)self view];
  [v3 bounds];
  CGFloat x = v47.origin.x;
  CGFloat y = v47.origin.y;
  CGFloat width = v47.size.width;
  CGFloat height = v47.size.height;
  double v8 = CGRectGetWidth(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v48);
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  double v14 = [(SBWidgetIconResizeTransitionViewController *)self startingViewController];
  int v15 = [v14 view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(v15, "setCenter:", v11, v13);
  CGAffineTransformMakeScale(&v45, v8 / v17, v9 / v19);
  [v15 setTransform:&v45];
  v20 = [(SBWidgetIconResizeTransitionViewController *)self endingViewController];
  id v21 = [v20 view];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  objc_msgSend(v21, "setCenter:", v11, v13);
  CGAffineTransformMakeScale(&v44, v8 / v23, v9 / v25);
  [v21 setTransform:&v44];
  v26 = [(SBWidgetIconResizeTransitionViewController *)self startingBlurView];
  [v15 bounds];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  UIRectGetCenter();
  objc_msgSend(v26, "setCenter:");
  objc_msgSend(v26, "setBounds:", v28, v30, v32, v34);
  v35 = [(SBWidgetIconResizeTransitionViewController *)self endingBlurView];
  [v21 bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  UIRectGetCenter();
  objc_msgSend(v35, "setCenter:");
  objc_msgSend(v35, "setBounds:", v37, v39, v41, v43);
}

- (id)effectiveGridSizeClassDomain
{
  v2 = [(SBWidgetIconResizeTransitionViewController *)self gridSizeClassDomain];
  double v3 = +[SBHIconGridSizeClassDomain effectiveGridSizeClassDomainForDomain:v2];

  return v3;
}

- (id)viewControllerForGridSizeClass:(id)a3
{
  id v4 = a3;
  double v5 = [(SBWidgetIconResizeTransitionViewController *)self viewControllers];
  if (![v5 count])
  {
    [(SBWidgetIconResizeTransitionViewController *)self gatherViewControllers];
    uint64_t v6 = [(SBWidgetIconResizeTransitionViewController *)self viewControllers];

    double v5 = (void *)v6;
  }
  double v7 = [v5 objectForKey:v4];

  return v7;
}

- (void)gatherViewControllers
{
  double v3 = [(SBWidgetIconResizeTransitionViewController *)self leafIcon];
  id v4 = [v3 activeDataSource];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(SBWidgetIconResizeTransitionViewController *)self effectiveGridSizeClassDomain];
  double v7 = [(SBWidgetIconResizeTransitionViewController *)self viewHelper];
  double v8 = [(SBWidgetIconResizeTransitionViewController *)self effectiveAllowedGridSizeClasses];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __67__SBWidgetIconResizeTransitionViewController_gatherViewControllers__block_invoke;
  v13[3] = &unk_1E6AB52C0;
  v13[4] = self;
  id v14 = v3;
  id v15 = v4;
  id v16 = v7;
  id v17 = v5;
  id v9 = v5;
  id v10 = v7;
  id v11 = v4;
  id v12 = v3;
  [v8 enumerateGridSizeClassesInDomain:v6 usingBlock:v13];
  [(SBWidgetIconResizeTransitionViewController *)self setViewControllers:v9];
}

void __67__SBWidgetIconResizeTransitionViewController_gatherViewControllers__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v8 = [v3 replacementIconForIcon:v4 gridSizeClass:v5];
  uint64_t v6 = [*(id *)(a1 + 32) replacementIconDataSourceForIconDataSource:*(void *)(a1 + 48) gridSizeClass:v5];
  double v7 = [*(id *)(a1 + 56) viewControllerForIconDataSource:v6 icon:v8 gridSizeClass:v5];
  [v7 addObserver:*(void *)(a1 + 32)];
  [*(id *)(a1 + 64) setObject:v7 forKey:v5];
}

- (id)replacementIconForIcon:(id)a3 gridSizeClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWidgetIconResizeTransitionViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 iconResizeTransitionViewController:self willUseIcon:v6 forViewControllerForGridSizeClass:v7];

    id v6 = (id)v9;
  }

  return v6;
}

- (id)replacementIconDataSourceForIconDataSource:(id)a3 gridSizeClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBWidgetIconResizeTransitionViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 iconResizeTransitionViewController:self willUseIconDataSource:v6 forViewControllerForGridSizeClass:v7];

    id v6 = (id)v9;
  }

  return v6;
}

- (double)continuousCornerRadius
{
  [(SBWidgetIconResizeTransitionViewController *)self iconImageInfo];
  return v2;
}

- (CGRect)visibleBounds
{
  double v2 = [(SBWidgetIconResizeTransitionViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)invalidate
{
  id v2 = [(SBWidgetIconResizeTransitionViewController *)self viewControllers];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_74];
}

uint64_t __56__SBWidgetIconResizeTransitionViewController_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  double v3 = (void *)MEMORY[0x1E4F4F720];
  double v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  double v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  double v5 = [(SBWidgetIconResizeTransitionViewController *)self effectiveGridSizeClassDomain];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SBWidgetIconResizeTransitionViewController_appendDescriptionToStream___block_invoke;
  v8[3] = &unk_1E6AACDE0;
  id v9 = v4;
  id v10 = v5;
  double v11 = self;
  id v6 = v5;
  id v7 = v4;
  [v7 appendProem:self block:v8];
}

id __72__SBWidgetIconResizeTransitionViewController_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) startingGridSizeClass];
  double v5 = [v3 descriptionForGridSizeClass:v4];
  [v2 appendString:v5 withName:@"startingGridSizeClass"];

  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  double v8 = [*(id *)(a1 + 48) endingGridSizeClass];
  id v9 = [v7 descriptionForGridSizeClass:v8];
  [v6 appendString:v9 withName:@"endingGridSizeClass"];

  id v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) transitionProgress];
  return (id)objc_msgSend(v10, "appendFloat:withName:", @"transitionProgress");
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  self->_iconImageInfo.size.CGFloat width = v3;
  self->_iconImageInfo.size.CGFloat height = v4;
  self->_iconImageInfo.scale = v5;
  self->_iconImageInfo.continuousCornerRadius = v6;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (SBLeafIcon)leafIcon
{
  return self->_leafIcon;
}

- (SBHIconGridSizeClassSet)allowedGridSizeClasses
{
  return self->_allowedGridSizeClasses;
}

- (SBHWidgetIconResizeViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (UIViewController)startingViewController
{
  return self->_startingViewController;
}

- (double)startingCornerRadius
{
  return self->_startingCornerRadius;
}

- (NSString)startingGridSizeClass
{
  return self->_startingGridSizeClass;
}

- (UIViewController)endingViewController
{
  return self->_endingViewController;
}

- (double)endingCornerRadius
{
  return self->_endingCornerRadius;
}

- (NSString)endingGridSizeClass
{
  return self->_endingGridSizeClass;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (SBWidgetIconResizeTransitionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBWidgetIconResizeTransitionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)crossfades
{
  return self->_crossfades;
}

- (void)setCrossfades:(BOOL)a3
{
  self->_crossfades = a3;
}

- (SBHIconGridSizeClassSet)effectiveAllowedGridSizeClasses
{
  return self->_effectiveAllowedGridSizeClasses;
}

- (UIView)startingBlurView
{
  return self->_startingBlurView;
}

- (void)setStartingBlurView:(id)a3
{
}

- (UIView)endingBlurView
{
  return self->_endingBlurView;
}

- (void)setEndingBlurView:(id)a3
{
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (NSDictionary)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_endingBlurView, 0);
  objc_storeStrong((id *)&self->_startingBlurView, 0);
  objc_storeStrong((id *)&self->_effectiveAllowedGridSizeClasses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_endingGridSizeClass, 0);
  objc_storeStrong((id *)&self->_endingViewController, 0);
  objc_storeStrong((id *)&self->_startingGridSizeClass, 0);
  objc_storeStrong((id *)&self->_startingViewController, 0);
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_leafIcon, 0);
}

@end