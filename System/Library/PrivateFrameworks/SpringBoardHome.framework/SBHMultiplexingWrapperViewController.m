@interface SBHMultiplexingWrapperViewController
- (APUIAppPredictionViewController)appPredictionViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)canAlignWithGrid;
- (BOOL)forcesEdgeAntialiasing;
- (BOOL)isEditing;
- (BOOL)isGridAligned;
- (BOOL)isOverlapping;
- (BOOL)isShowingContextMenu;
- (BOOL)isUserInteractionEnabled;
- (BOOL)showsSquareCorners;
- (BOOL)wantsCaptureOnlyBackgroundView;
- (BOOL)wantsEditingDisplayStyle;
- (CGRect)visibleBounds;
- (NSArray)applicationShortcutItems;
- (NSString)location;
- (SBHMultiplexingWrapperViewController)initWithIcon:(id)a3 location:(id)a4 multiplexingViewController:(id)a5 appPredictionViewController:(id)a6 canAlignWithGrid:(BOOL)a7;
- (SBHMultiplexingWrapperViewController)initWithIcon:(id)a3 location:(id)a4 multiplexingViewController:(id)a5 component:(unint64_t)a6;
- (SBHMultiplexingWrapperViewControllerDelegate)delegate;
- (SBIcon)icon;
- (SBIconApproximateLayoutPosition)approximateLayoutPosition;
- (SBIconImageInfo)iconImageInfo;
- (SBLeafIconDataSource)visiblyActiveDataSource;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIViewController)multiplexingViewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)continuousCornerRadius;
- (id)_widgetContextMenuController;
- (id)backgroundViewConfigurator;
- (id)backgroundViewProvider;
- (unint64_t)backgroundAnimationCount;
- (unint64_t)component;
- (unint64_t)expectedAppPredictionViewControllerMode;
- (unint64_t)imageViewAlignment;
- (unint64_t)pauseReasons;
- (void)_configureBackgroundViewIfNecessary;
- (void)_setBackgroundViewWeighting:(double)a3;
- (void)_updateBackgroundViewWeighting;
- (void)_updateEdgeAntialiasing;
- (void)_updateMultiplexingViewControllerModeAnimated:(BOOL)a3;
- (void)_updateWidgetViewHitTesting;
- (void)addCustomImageViewControllerObserver:(id)a3;
- (void)didSelectApplicationShortcutItem:(id)a3;
- (void)loadView;
- (void)multiplexingViewControllerDidActivate:(id)a3;
- (void)removeCustomImageViewControllerObserver:(id)a3;
- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3;
- (void)setBackgroundAnimationCount:(unint64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewConfigurator:(id)a3;
- (void)setBackgroundViewProvider:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setForcesEdgeAntialiasing:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setImageViewAlignment:(unint64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOverlapping:(BOOL)a3;
- (void)setPauseReasons:(unint64_t)a3;
- (void)setShowingContextMenu:(BOOL)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setWantsEditingDisplayStyle:(BOOL)a3;
- (void)setWantsEditingDisplayStyle:(BOOL)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willShowContextMenuAtLocation:(CGPoint)a3;
@end

@implementation SBHMultiplexingWrapperViewController

- (SBHMultiplexingWrapperViewController)initWithIcon:(id)a3 location:(id)a4 multiplexingViewController:(id)a5 appPredictionViewController:(id)a6 canAlignWithGrid:(BOOL)a7
{
  id v12 = a6;
  v13 = [(SBHMultiplexingWrapperViewController *)self initWithIcon:a3 location:a4 multiplexingViewController:a5 component:0];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_appPredictionViewController, v12);
    v14->_canAlignWithGrid = a7;
    uint64_t v15 = [(SBHMultiplexingWrapperViewController *)v14 expectedAppPredictionViewControllerMode];
    if (v15 != [v12 mode]) {
      [v12 setMode:v15];
    }
  }

  return v14;
}

- (SBHMultiplexingWrapperViewController)initWithIcon:(id)a3 location:(id)a4 multiplexingViewController:(id)a5 component:(unint64_t)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBHMultiplexingWrapperViewController;
  v14 = [(SBHMultiplexingWrapperViewController *)&v22 initWithNibName:0 bundle:0];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_icon, a3);
    uint64_t v16 = [v12 copy];
    location = v15->_location;
    v15->_location = (NSString *)v16;

    objc_storeStrong((id *)&v15->_multiplexingViewController, a5);
    v15->_component = a6;
    [v13 addObserver:v15];
    v15->_imageViewAlignment = 0;
    v18 = self;
    v23[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v20 = (id)[(SBHMultiplexingWrapperViewController *)v15 registerForTraitChanges:v19 withAction:sel__updateEdgeAntialiasing];
  }
  return v15;
}

- (BOOL)isGridAligned
{
  if (self->_component) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  BOOL v2 = [WeakRetained mode] == 0;

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SBHMultiplexingWrapperViewController;
  [(SBHMultiplexingWrapperViewController *)&v7 loadView];
  v3 = [(SBHMultiplexingWrapperViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v3 bounds];
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v5;

  [(UIView *)self->_containerView setClipsToBounds:1];
  [v3 addSubview:self->_containerView];
  [(SBHMultiplexingWrapperViewController *)self _updateMultiplexingViewControllerModeAnimated:0];
  [(SBHMultiplexingWrapperViewController *)self bs_addChildViewController:self->_multiplexingViewController withSuperview:self->_containerView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHMultiplexingWrapperViewController;
  [(SBHMultiplexingWrapperViewController *)&v4 viewWillAppear:a3];
  [(SBHMultiplexingWrapperViewController *)self _updateMultiplexingViewControllerModeAnimated:0];
}

- (void)viewWillLayoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SBHMultiplexingWrapperViewController;
  [(SBHMultiplexingWrapperViewController *)&v36 viewWillLayoutSubviews];
  v3 = [(SBHMultiplexingWrapperViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  uint64_t v13 = [WeakRetained mode];
  uint64_t v14 = v13;
  double v15 = 0.0;
  if (self->_component) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v13 == 1;
  }
  if (!v16)
  {
    objc_msgSend(WeakRetained, "parentLayoutInsets", 0.0);
    double v15 = v17 * 0.5;
  }
  CGFloat v18 = -v15;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  CGRect v38 = CGRectInset(v37, v18, v18);
  -[UIView setFrame:](self->_containerView, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  BSRectWithSize();
  double v20 = v19;
  double v22 = v21;
  double v35 = v23;
  double v25 = v24;
  UIRectGetCenter();
  double v28 = v27;
  double v29 = -((v11 - v25) * 0.5);
  if (self->_imageViewAlignment) {
    double v29 = (v11 - v25) * 0.5;
  }
  double v30 = v26 + v29;
  v31 = [(UIViewController *)self->_multiplexingViewController view];
  objc_msgSend(v31, "setBounds:", v20, v22, v35, v25);

  v32 = [(UIViewController *)self->_multiplexingViewController view];
  objc_msgSend(v32, "setCenter:", v28, v30);

  double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  [(UIView *)self->_containerView _setContinuousCornerRadius:continuousCornerRadius];
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:continuousCornerRadius];
  [(UIView *)self->_containerView setClipsToBounds:BSFloatEqualToFloat() ^ 1];
  if (!self->_component)
  {
    double v34 = 0.0;
    if (v14 == 1) {
      double v34 = 1.0;
    }
    [(SBHMultiplexingWrapperViewController *)self _setBackgroundViewWeighting:v34];
  }
}

- (void)multiplexingViewControllerDidActivate:(id)a3
{
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->double continuousCornerRadius = v7;
    uint64_t v13 = [(SBHMultiplexingWrapperViewController *)self view];
    id v15 = [v13 layer];

    [v15 setCornerRadius:v7];
    [v15 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    uint64_t v14 = [(SBHMultiplexingWrapperViewController *)self view];
    [v14 setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    self->_editing = a3;
    [(SBHMultiplexingWrapperViewController *)self _updateWidgetViewHitTesting];
    [(SBHMultiplexingWrapperViewController *)self _updateMultiplexingViewControllerModeAnimated:v4];
  }
}

- (void)setWantsEditingDisplayStyle:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsEditingDisplayStyle != a3)
  {
    self->_wantsEditingDisplayStyle = a3;
    [(SBHMultiplexingWrapperViewController *)self _updateMultiplexingViewControllerModeAnimated:a4];
  }
}

- (void)setShowingContextMenu:(BOOL)a3
{
  if (self->_showingContextMenu != a3)
  {
    BOOL v3 = a3;
    self->_showingContextMenu = a3;
    [(SBHMultiplexingWrapperViewController *)self _updateMultiplexingViewControllerModeAnimated:1];
    id v5 = [(SBHMultiplexingWrapperViewController *)self _widgetContextMenuController];
    [v5 setShowingContextMenu:v3];
  }
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(SBHMultiplexingWrapperViewController *)self _widgetContextMenuController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SBHMultiplexingWrapperViewController *)self _widgetContextMenuController];
    objc_msgSend(v8, "willShowContextMenuAtLocation:", x, y);
  }
}

- (void)setOverlapping:(BOOL)a3
{
  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    id v3 = [(SBHMultiplexingWrapperViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    [(SBHMultiplexingWrapperViewController *)self _updateWidgetViewHitTesting];
  }
}

- (SBLeafIconDataSource)visiblyActiveDataSource
{
  icon = self->_icon;
  uint64_t v3 = objc_opt_class();
  BOOL v4 = icon;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  double v6 = v5;

  char v7 = [(SBIcon *)v6 activeDataSource];

  return (SBLeafIconDataSource *)v7;
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    [(SBHMultiplexingWrapperViewController *)self _updateEdgeAntialiasing];
  }
}

- (void)setBackgroundViewProvider:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backgroundViewProvider != v4)
  {
    id v15 = v4;
    double v6 = (void *)[v4 copy];
    id backgroundViewProvider = self->_backgroundViewProvider;
    self->_id backgroundViewProvider = v6;

    backgroundView = self->_backgroundView;
    if (backgroundView)
    {
      [(UIView *)backgroundView removeFromSuperview];
      double v9 = self->_backgroundView;
      self->_backgroundView = 0;
    }
    double v10 = (void (**)(id, void))self->_backgroundViewProvider;
    id v5 = v15;
    if (v10)
    {
      ((void (**)(id, id))v10)[2](v10, v15);
      double v11 = (UIView *)objc_claimAutoreleasedReturnValue();
      id v12 = self->_backgroundView;
      self->_backgroundView = v11;

      [(UIView *)self->_backgroundView setClipsToBounds:!self->_showsSquareCorners];
      [(UIView *)self->_containerView insertSubview:self->_backgroundView atIndex:0];
      uint64_t v13 = [(SBHMultiplexingWrapperViewController *)self view];
      [v13 setNeedsLayout];

      uint64_t v14 = [(SBHMultiplexingWrapperViewController *)self view];
      [v14 layoutIfNeeded];

      [(SBHMultiplexingWrapperViewController *)self _configureBackgroundViewIfNecessary];
      id v5 = v15;
    }
  }
}

- (void)setBackgroundViewConfigurator:(id)a3
{
  if (self->_backgroundViewConfigurator != a3)
  {
    id v4 = (void *)[a3 copy];
    id backgroundViewConfigurator = self->_backgroundViewConfigurator;
    self->_id backgroundViewConfigurator = v4;

    if (!self->_backgroundViewConfigurator)
    {
      double v6 = _Block_copy(self->_backgroundViewProvider);
      [(SBHMultiplexingWrapperViewController *)self setBackgroundViewProvider:0];
      [(SBHMultiplexingWrapperViewController *)self setBackgroundViewProvider:v6];
    }
    [(SBHMultiplexingWrapperViewController *)self _configureBackgroundViewIfNecessary];
  }
}

- (BOOL)wantsCaptureOnlyBackgroundView
{
  if (self->_backgroundViewProvider && !self->_backgroundAnimationCount) {
    return ![(SBHMultiplexingWrapperViewController *)self isGridAligned];
  }
  else {
    return 0;
  }
}

- (void)setImageViewAlignment:(unint64_t)a3
{
  if (self->_imageViewAlignment != a3)
  {
    self->_imageViewAlignment = a3;
    id v4 = [(SBHMultiplexingWrapperViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(SBHMultiplexingWrapperViewController *)self view];
    [v5 layoutIfNeeded];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    if (!self->_component)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
      [WeakRetained setLegibilitySettings:v7];
    }
  }
  MEMORY[0x1F4181820]();
}

- (NSArray)applicationShortcutItems
{
  BOOL v2 = [(SBHMultiplexingWrapperViewController *)self _widgetContextMenuController];
  uint64_t v3 = [v2 applicationShortcutItems];

  return (NSArray *)v3;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHMultiplexingWrapperViewController *)self _widgetContextMenuController];
  [v5 didSelectApplicationShortcutItem:v4];
}

- (id)_widgetContextMenuController
{
  if (self->_component) {
    id WeakRetained = 0;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  }
  id v3 = WeakRetained;
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setPauseReasons:(unint64_t)a3
{
  if (self->_pauseReasons != a3)
  {
    self->_pauseReasons = a3;
    if (!self->_component)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
      [WeakRetained setOccluded:a3 != 0];
    }
  }
}

- (CGRect)visibleBounds
{
  [(SBHMultiplexingWrapperViewController *)self iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  [(SBHMultiplexingWrapperViewController *)self iconImageInfo];
  return v2;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    [(UIView *)self->_backgroundView setClipsToBounds:!a3];
  }
}

- (void)addCustomImageViewControllerObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeCustomImageViewControllerObserver:(id)a3
{
}

- (void)_setBackgroundViewWeighting:(double)a3
{
  backgroundView = self->_backgroundView;
  uint64_t v6 = objc_opt_class();
  double v7 = backgroundView;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  double v9 = v8;

  if (v9) {
    [(UIView *)v9 setWeighting:a3];
  }
  else {
    [(UIView *)self->_backgroundView setAlpha:a3];
  }
}

- (void)_updateBackgroundViewWeighting
{
  double v3 = 1.0;
  if (!self->_editing && !self->_showingContextMenu)
  {
    BOOL v4 = [(NSString *)self->_location isEqualToString:@"SBIconLocationAddWidgetSheet", 1.0];
    double v3 = 0.0;
    if (v4) {
      double v3 = 1.0;
    }
  }
  [(SBHMultiplexingWrapperViewController *)self _setBackgroundViewWeighting:v3];
}

- (unint64_t)expectedAppPredictionViewControllerMode
{
  BOOL v3 = [(SBHMultiplexingWrapperViewController *)self canAlignWithGrid];
  if (self->_editing) {
    return 1;
  }
  if (self->_wantsEditingDisplayStyle) {
    return 1;
  }
  if (self->_showingContextMenu) {
    return 1;
  }
  BOOL v4 = v3;
  return (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", self->_location) & 1) != 0
      || [(NSString *)self->_location isEqualToString:@"SBIconLocationAddWidgetSheet"]
      || !v4;
}

- (void)_updateMultiplexingViewControllerModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_component)
  {
    double v5 = 0;
    BOOL v6 = 0;
    id v7 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
    unint64_t v9 = [(SBHMultiplexingWrapperViewController *)self expectedAppPredictionViewControllerMode];
    BOOL v6 = v9 != [WeakRetained mode];
    id v10 = WeakRetained;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke;
    aBlock[3] = &unk_1E6AAC838;
    id v24 = v10;
    unint64_t v25 = v9;
    id v7 = v10;
    double v5 = _Block_copy(aBlock);
  }
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  ++self->_backgroundAnimationCount;
  if (v6)
  {
    id v12 = [(SBHMultiplexingWrapperViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v12 multiplexingWrapperViewControllerWillChangeGridAlignment:self];
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4FB1EB0];
  if (v3) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 2;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_2;
  v18[3] = &unk_1E6AAFF00;
  BOOL v22 = v6;
  double v20 = self;
  id v21 = v5;
  id v19 = v7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_3;
  v17[3] = &unk_1E6AAFF28;
  v17[4] = self;
  id v15 = v7;
  id v16 = v5;
  objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v11, v14, v18, v17);
}

uint64_t __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMode:*(void *)(a1 + 40)];
}

void __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    double v2 = [*(id *)(a1 + 32) view];
    [v2 setNeedsLayout];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 976);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "customImageViewControllerWantsLabelHiddenDidChange:", *(void *)(a1 + 40), (void)v14);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
  }
  unint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "parentViewController", (void)v14);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v9) {
    BOOL v11 = v9 == *(void **)(v10 + 1048);
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 && *(void *)(v10 + 1096))
  {
    [*(id *)(v10 + 1088) setHidden:0];
    uint64_t v10 = *(void *)(a1 + 40);
  }
  id v12 = [(id)v10 view];
  [v12 setNeedsLayout];

  uint64_t v13 = [*(id *)(a1 + 40) view];
  [v13 layoutIfNeeded];
}

void __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_3(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1096);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 1096))
  {
    id v3 = *(void **)(v1 + 1088);
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v8 = v6;

    if (v8) {
      [v8 weighting];
    }
    else {
      [*(id *)(*(void *)(a1 + 32) + 1088) alpha];
    }
    if (BSFloatIsZero()) {
      [*(id *)(*(void *)(a1 + 32) + 1088) setHidden:1];
    }
    id v7 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 multiplexingWrapperViewControllerDidChangeGridAlignment:*(void *)(a1 + 32)];
    }
  }
}

- (void)_updateWidgetViewHitTesting
{
  BOOL v2 = self->_editing || !self->_userInteractionEnabled;
  id v3 = [(UIViewController *)self->_multiplexingViewController view];
  objc_msgSend(v3, "bs_setHitTestingDisabled:", v2);
}

- (void)_updateEdgeAntialiasing
{
  id v3 = [(SBHMultiplexingWrapperViewController *)self view];
  id v7 = [v3 layer];

  uint64_t v4 = [(SBHMultiplexingWrapperViewController *)self traitCollection];
  [v4 displayScale];
  double v6 = v5;

  [v7 setAllowsEdgeAntialiasing:self->_forcesEdgeAntialiasing];
  [v7 setShouldRasterize:self->_forcesEdgeAntialiasing];
  [v7 setRasterizationScale:v6];
}

- (void)_configureBackgroundViewIfNecessary
{
  uint64_t v3 = [(SBHMultiplexingWrapperViewController *)self visiblyActiveDataSource];
  id backgroundViewConfigurator = (void (**)(void))self->_backgroundViewConfigurator;
  if (backgroundViewConfigurator)
  {
    if (self->_backgroundView && v3 != 0) {
      backgroundViewConfigurator[2]();
    }
  }
  MEMORY[0x1F4181820]();
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)wantsEditingDisplayStyle
{
  return self->_wantsEditingDisplayStyle;
}

- (void)setWantsEditingDisplayStyle:(BOOL)a3
{
  self->_wantsEditingDisplayStyle = a3;
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPosition
{
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  unint64_t horizontal = self->_approximateLayoutPosition.horizontal;
  unint64_t vertical = p_approximateLayoutPosition->vertical;
  result.unint64_t vertical = vertical;
  result.unint64_t horizontal = horizontal;
  return result;
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  self->_approximateLayoutPosition = a3;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (id)backgroundViewConfigurator
{
  return self->_backgroundViewConfigurator;
}

- (unint64_t)imageViewAlignment
{
  return self->_imageViewAlignment;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)pauseReasons
{
  return self->_pauseReasons;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBHMultiplexingWrapperViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHMultiplexingWrapperViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)multiplexingViewController
{
  return self->_multiplexingViewController;
}

- (APUIAppPredictionViewController)appPredictionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  return (APUIAppPredictionViewController *)WeakRetained;
}

- (unint64_t)component
{
  return self->_component;
}

- (BOOL)canAlignWithGrid
{
  return self->_canAlignWithGrid;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (unint64_t)backgroundAnimationCount
{
  return self->_backgroundAnimationCount;
}

- (void)setBackgroundAnimationCount:(unint64_t)a3
{
  self->_backgroundAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_appPredictionViewController);
  objc_storeStrong((id *)&self->_multiplexingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong(&self->_backgroundViewConfigurator, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end