@interface SBHWidgetContainerViewController
+ (id)buildGradientBackgroundViewWithFrame:(CGRect)a3 continuousCornerRadius:(double)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)containsInteractiveControls;
- (BOOL)isBlockedForScreenTimeExpiration;
- (BOOL)isContentReady;
- (BOOL)isPaused;
- (BOOL)isWidgetControllerActive;
- (BOOL)requiresClippingToBounds;
- (BOOL)showsSnapshotWhenDeactivated;
- (BOOL)wantsSystemMaterialBackground;
- (BOOL)wantsTintedAppearanceBackground;
- (NSString)applicationName;
- (NSString)description;
- (NSString)gridSizeClass;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration;
- (SBHWidgetContainerViewController)initWithWidgetViewController:(id)a3 widgetDataSource:(id)a4 gridSizeClass:(id)a5 iconImageInfo:(SBIconImageInfo *)a6 applicationName:(id)a7;
- (SBHWidgetContainerViewControllerDelegate)delegate;
- (SBHWidgetStyleManager)widgetStyleManager;
- (SBIconApproximateLayoutPosition)approximateLayoutPosition;
- (SBIconImageInfo)iconImageInfo;
- (SBLeafIconDataSource)widgetDataSource;
- (UIView)deactivationSnapshotView;
- (UIViewController)widgetViewController;
- (id)_chsWidget;
- (id)_multiplexedViewController;
- (id)_widgetExtensionBundleIdentifier;
- (id)_widgetHostViewController;
- (id)buildSnapshotResizeCoordinatorForSnapshotSize:(CGSize)a3 expectNewViewController:(BOOL)a4;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)effectiveIconImageAppearance;
- (id)effectiveIconImageStyleConfiguration;
- (id)snapshotView;
- (id)widgetContextMenuController;
- (unint64_t)presentationMode;
- (unint64_t)userVisibilityStatus;
- (void)_addDeactivationSnapshotViewIfNecessary;
- (void)_clearDeactivationSnapshotView;
- (void)_monitorForWidgetReadiness;
- (void)_setOriginalSize:(CGSize)a3;
- (void)_updateWidgetVisibility;
- (void)addObserver:(id)a3;
- (void)enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)loadView;
- (void)multiplexingViewControllerDidActivate:(id)a3;
- (void)multiplexingViewControllerWillDeactivate:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAllowsEdgeAntialiasing:(BOOL)a3;
- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3;
- (void)setBlockedForScreenTimeExpiration:(BOOL)a3;
- (void)setContentReady:(BOOL)a3;
- (void)setDeactivationSnapshotView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideIconImageStyleConfiguration:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRequiresClippingToBounds:(BOOL)a3;
- (void)setShowsSnapshotWhenDeactivated:(BOOL)a3;
- (void)setUserVisibilityStatus:(unint64_t)a3;
- (void)setWidgetControllerActive:(BOOL)a3;
- (void)setWidgetStyleManager:(id)a3;
- (void)updateStyleConfiguration;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)widgetStyleManager:(id)a3 needsToAddBackgroundView:(id)a4;
- (void)widgetStyleManager:(id)a3 needsToAddFilter:(id)a4;
- (void)widgetStyleManager:(id)a3 needsToRemoveBackgroundView:(id)a4;
- (void)widgetStyleManager:(id)a3 needsToRemoveFilter:(id)a4;
- (void)widgetStyleManagerDidUpdateConfiguration:(id)a3;
@end

@implementation SBHWidgetContainerViewController

- (SBHWidgetContainerViewController)initWithWidgetViewController:(id)a3 widgetDataSource:(id)a4 gridSizeClass:(id)a5 iconImageInfo:(SBIconImageInfo *)a6 applicationName:(id)a7
{
  double v12 = v10;
  double v13 = v9;
  CGFloat v14 = v8;
  CGFloat v15 = v7;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  v23 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SBHWidgetContainerViewController;
  v24 = [(SBHWidgetContainerViewController *)&v32 initWithNibName:0 bundle:0];
  v25 = v24;
  if (v24)
  {
    v24->_iconImageInfo.size.width = v15;
    v24->_iconImageInfo.size.height = v14;
    v24->_iconImageInfo.scale = v13;
    v24->_iconImageInfo.continuousCornerRadius = v12;
    p_widgetViewController = (id *)&v24->_widgetViewController;
    objc_storeStrong((id *)&v24->_widgetViewController, a3);
    if (objc_msgSend(*p_widgetViewController, "sbh_isMultiplexingViewController")) {
      [*p_widgetViewController addObserver:v25];
    }
    objc_storeStrong((id *)&v25->_widgetDataSource, a4);
    uint64_t v27 = [v22 copy];
    gridSizeClass = v25->_gridSizeClass;
    v25->_gridSizeClass = (NSString *)v27;

    uint64_t v29 = [(SBIconImageInfo *)v23 copy];
    applicationName = v25->_applicationName;
    v25->_applicationName = (NSString *)v29;

    v25->_requiresClippingToBounds = 0;
  }

  return v25;
}

- (void)loadView
{
  v5 = [[SBHWidgetContainerView alloc] initWithGridSizeClass:self->_gridSizeClass applicationName:self->_applicationName];
  [(SBHWidgetContainerViewController *)self setView:v5];
  [(SBHWidgetContainerViewController *)self bs_addChildViewController:self->_widgetViewController withSuperview:v5];
  v3 = [(UIViewController *)self->_widgetViewController view];
  [(SBHWidgetContainerView *)v5 setWidgetView:v3];

  v4 = -[SBHWidgetStyleManager initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:delegate:]([SBHWidgetStyleManager alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:delegate:", self->_widgetViewController, self->_widgetDataSource, self->_gridSizeClass, self, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
  [(SBHWidgetContainerViewController *)self setWidgetStyleManager:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  [(SBHWidgetContainerViewController *)&v6 viewWillAppear:a3];
  v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(SBHWidgetContainerViewController *)self _widgetExtensionBundleIdentifier];
    *(_DWORD *)buf = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewWillAppear", buf, 0xCu);
  }
  [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
  if (![(UIViewController *)self->_widgetViewController sbh_isMultiplexingViewController])
  {
    [(SBHWidgetContainerViewController *)self setWidgetControllerActive:1];
    [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
    [(SBHWidgetContainerViewController *)self _monitorForWidgetReadiness];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  [(SBHWidgetContainerViewController *)&v6 viewDidAppear:a3];
  v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(SBHWidgetContainerViewController *)self _widgetExtensionBundleIdentifier];
    *(_DWORD *)buf = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewDidAppear", buf, 0xCu);
  }
  [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  [(SBHWidgetContainerViewController *)&v6 viewWillDisappear:a3];
  v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(SBHWidgetContainerViewController *)self _widgetExtensionBundleIdentifier];
    *(_DWORD *)buf = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewWillDisappear", buf, 0xCu);
  }
  [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
  if (![(UIViewController *)self->_widgetViewController sbh_isMultiplexingViewController])[(SBHWidgetContainerViewController *)self setWidgetControllerActive:0]; {
}
  }

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  [(SBHWidgetContainerViewController *)&v6 viewDidDisappear:a3];
  v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(SBHWidgetContainerViewController *)self _widgetExtensionBundleIdentifier];
    *(_DWORD *)buf = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewDidDisappear", buf, 0xCu);
  }
  [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
}

- (BOOL)wantsSystemMaterialBackground
{
  v3 = [(SBHWidgetContainerViewController *)self widgetStyleManager];
  if ([v3 needsGradientBackground])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
    char v4 = [v5 usesSystemBackgroundMaterial];
  }
  return v4;
}

- (BOOL)containsInteractiveControls
{
  v2 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  char v3 = [v2 containsInteractiveControls];

  return v3;
}

- (id)snapshotView
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  char v4 = [v3 snapshotView];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [(UIViewController *)self->_widgetViewController view];
    id v6 = [v7 snapshotView];
  }
  double v8 = [(SBHWidgetContainerViewController *)self widgetContainerView];
  uint64_t v9 = [v8 screenTimeLockoutView];

  double v10 = SBLogWidgets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(SBHWidgetContainerViewController *)self _widgetExtensionBundleIdentifier];
    double v12 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
    int v18 = 138543618;
    v19 = v11;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- Snapshot view requested for widget: %{public}@", (uint8_t *)&v18, 0x16u);
  }
  if (v9)
  {
    double v13 = [v9 snapshotView];
    [v6 addSubview:v13];

    CGFloat v14 = SBLogWidgets();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v15 = [(SBHWidgetContainerViewController *)self _widgetExtensionBundleIdentifier];
      v16 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2114;
      id v21 = v16;
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- Snapshot view for screenTimeLockoutView was added to snapshotView's hierarchy: %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }

  return v6;
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  v2 = self->_widgetViewController;
  if ([(UIViewController *)v2 sbh_isMultiplexingViewController])
  {
    uint64_t v3 = [(UIViewController *)v2 multiplexedViewController];

    v2 = (UIViewController *)v3;
  }
  if ([(UIViewController *)v2 sbh_isWidgetHostViewController]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v4 = [(UIViewController *)v2 cancelTouchesForCurrentEventInHostedContent];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)widgetContextMenuController
{
  v2 = self->_widgetViewController;
  if ([(UIViewController *)v2 sbh_isMultiplexingViewController])
  {
    uint64_t v3 = [(UIViewController *)v2 multiplexedViewController];

    v2 = (UIViewController *)v3;
  }
  char v4 = v2;
  if (objc_opt_respondsToSelector()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  [v4 setAnimationsPaused:v3];
}

- (BOOL)isPaused
{
  v2 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  char v3 = [v2 areAnimationsPaused];

  return v3;
}

- (void)setBlockedForScreenTimeExpiration:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(SBHWidgetContainerViewController *)self setPresentationMode:v5];
  id v6 = [(SBHWidgetContainerViewController *)self widgetContainerView];
  [v6 setBlockedForScreenTimeExpiration:v3];
}

- (BOOL)isBlockedForScreenTimeExpiration
{
  v2 = [(SBHWidgetContainerViewController *)self widgetContainerView];
  char v3 = [v2 isBlockedForScreenTimeExpiration];

  return v3;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBHWidgetContainerViewController *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;

  double v8 = [(SBHWidgetContainerViewController *)self view];
  id v9 = [v8 layer];

  [v9 setAllowsEdgeAntialiasing:v3];
  [v9 setRasterizationScale:v7];
}

- (BOOL)allowsEdgeAntialiasing
{
  v2 = [(SBHWidgetContainerViewController *)self view];
  BOOL v3 = [v2 layer];

  LOBYTE(v2) = [v3 allowsEdgeAntialiasing];
  return (char)v2;
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  if (self->_userVisibilityStatus != a3)
  {
    self->_userVisibilityStatus = a3;
    [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (a3 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1D81E7FA0[a3];
  }
  id v4 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  [v4 setPresentationMode:v3];
}

- (unint64_t)presentationMode
{
  v2 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  uint64_t v3 = [v2 presentationMode];

  unint64_t v4 = 1;
  if (v3 != 3) {
    unint64_t v4 = 2;
  }
  if (v3 == 2) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)setRequiresClippingToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHWidgetContainerViewController *)self widgetContainerView];
  [v4 setRequiresClippingToBounds:v3];
}

- (void)setShowsSnapshotWhenDeactivated:(BOOL)a3
{
  if (self->_showsSnapshotWhenDeactivated != a3)
  {
    self->_showsSnapshotWhenDeactivated = a3;
    if (a3) {
      [(SBHWidgetContainerViewController *)self _addDeactivationSnapshotViewIfNecessary];
    }
    else {
      [(SBHWidgetContainerViewController *)self _clearDeactivationSnapshotView];
    }
  }
}

- (id)buildSnapshotResizeCoordinatorForSnapshotSize:(CGSize)a3 expectNewViewController:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v8 = self->_widgetViewController;
  if ([(UIViewController *)v8 sbh_isMultiplexingViewController])
  {
    if (self->_deactivationSnapshotView) {
      BOOL v9 = height == self->_originalSize.height && width == self->_originalSize.width;
    }
    else {
      BOOL v9 = 0;
    }
    self->_allowDeactivationSnapshotViewForActiveWidgetController = 1;
    v11 = v8;
    [(SBHWidgetContainerViewController *)self setShowsSnapshotWhenDeactivated:1];
    [(SBHWidgetContainerViewController *)self _addDeactivationSnapshotViewIfNecessary];
    double v12 = [(SBHWidgetContainerViewController *)self view];
    [v12 bounds];
    -[SBHWidgetContainerViewController _setOriginalSize:](self, "_setOriginalSize:", v13, v14);
    CGFloat v15 = [SBHWidgetContainerViewSnapshotResizeCoordinator alloc];
    v16 = [(SBHWidgetContainerViewController *)self view];
    v17 = [(UIViewController *)v11 view];

    double v10 = -[SBHWidgetContainerViewSnapshotResizeCoordinator initWithResizableView:multiplexingView:newSize:hideMultiplexingViewInitially:showMultiplexingViewWhenFinished:](v15, "initWithResizableView:multiplexingView:newSize:hideMultiplexingViewInitially:showMultiplexingViewWhenFinished:", v16, v17, v4, v9, width, height);
    [(SBHWidgetContainerViewSnapshotResizeCoordinator *)v10 setDelegate:self];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  unint64_t vertical = a3.vertical;
  unint64_t horizontal = a3.horizontal;
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  if (!SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(self->_approximateLayoutPosition.horizontal, self->_approximateLayoutPosition.vertical, a3.horizontal, a3.vertical))
  {
    p_approximateLayoutPosition->unint64_t horizontal = horizontal;
    p_approximateLayoutPosition->unint64_t vertical = vertical;
    double v7 = self->_widgetViewController;
    if (objc_opt_respondsToSelector()) {
      -[UIViewController setApproximateLayoutPosition:](v7, "setApproximateLayoutPosition:", horizontal, vertical);
    }
  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHIconImageAppearance *)[v7 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    double v6 = [(SBHWidgetContainerViewController *)self widgetStyleManager];
    [v6 setOverrideIconImageAppearance:v7];
  }
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHIconImageStyleConfiguration *)[v7 copy];
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    double v6 = [(SBHWidgetContainerViewController *)self widgetStyleManager];
    [v6 setOverrideIconImageStyleConfiguration:v7];
  }
}

- (id)effectiveIconImageAppearance
{
  BOOL v3 = [(SBHWidgetContainerViewController *)self overrideIconImageAppearance];
  BOOL v4 = [(SBHWidgetContainerViewController *)self overrideIconImageStyleConfiguration];
  uint64_t v5 = [(SBHWidgetContainerViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  id v7 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageStyleConfigurationFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v5, v3, v4);
  double v8 = [v7 widgetAppearanceWithUserInterfaceStyle:v6];

  return v8;
}

- (id)effectiveIconImageStyleConfiguration
{
  BOOL v3 = [(SBHWidgetContainerViewController *)self overrideIconImageAppearance];
  BOOL v4 = [(SBHWidgetContainerViewController *)self overrideIconImageStyleConfiguration];
  uint64_t v5 = [(SBHWidgetContainerViewController *)self traitCollection];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageStyleConfigurationFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v5, v3, v4);

  return v6;
}

- (BOOL)wantsTintedAppearanceBackground
{
  v2 = [(SBHWidgetContainerViewController *)self effectiveIconImageAppearance];
  BOOL v3 = [v2 appearanceType] == 2;

  return v3;
}

- (void)updateStyleConfiguration
{
  id v2 = [(SBHWidgetContainerViewController *)self widgetStyleManager];
  [v2 updateConfiguration];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)enumerateObserversUsingBlock:(id)a3
{
}

- (void)enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = [(SBHWidgetContainerViewController *)self delegate];
  if (!a3 || (objc_opt_respondsToSelector() & 1) != 0) {
    v6[2](v6, v7);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (!a3 || (objc_opt_respondsToSelector() & 1) != 0) {
          v6[2](v6, v13);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)multiplexingViewControllerDidActivate:(id)a3
{
  [(SBHWidgetContainerViewController *)self setWidgetControllerActive:1];
  [(SBHWidgetContainerViewController *)self _clearDeactivationSnapshotView];
  [(SBHWidgetContainerViewController *)self _updateWidgetVisibility];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__SBHWidgetContainerViewController_multiplexingViewControllerDidActivate___block_invoke;
  v4[3] = &unk_1E6AB48C8;
  v4[4] = self;
  [(SBHWidgetContainerViewController *)self enumerateObserversRespondingToSelector:sel_widgetContainerViewControllerContentViewControllerDidActivate_ usingBlock:v4];
  [(SBHWidgetContainerViewController *)self _monitorForWidgetReadiness];
}

uint64_t __74__SBHWidgetContainerViewController_multiplexingViewControllerDidActivate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetContainerViewControllerContentViewControllerDidActivate:*(void *)(a1 + 32)];
}

- (void)multiplexingViewControllerWillDeactivate:(id)a3
{
  [(SBHWidgetContainerViewController *)self setWidgetControllerActive:0];
  [(SBHWidgetContainerViewController *)self _addDeactivationSnapshotViewIfNecessary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__SBHWidgetContainerViewController_multiplexingViewControllerWillDeactivate___block_invoke;
  v4[3] = &unk_1E6AB48C8;
  v4[4] = self;
  [(SBHWidgetContainerViewController *)self enumerateObserversRespondingToSelector:sel_widgetContainerViewControllerContentViewControllerWillDeactivate_ usingBlock:v4];
}

uint64_t __77__SBHWidgetContainerViewController_multiplexingViewControllerWillDeactivate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetContainerViewControllerContentViewControllerWillDeactivate:*(void *)(a1 + 32)];
}

- (void)widgetStyleManager:(id)a3 needsToAddBackgroundView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHWidgetContainerViewController *)self view];
  [v6 setBackgroundView:v5];
}

- (void)widgetStyleManager:(id)a3 needsToRemoveBackgroundView:(id)a4
{
  id v4 = [(SBHWidgetContainerViewController *)self view];
  [v4 setBackgroundView:0];
}

- (void)widgetStyleManager:(id)a3 needsToAddFilter:(id)a4
{
  id v5 = a4;
  id v8 = [(SBHWidgetContainerViewController *)self view];
  id v6 = [v8 widgetView];
  id v7 = [v6 layer];

  objc_msgSend(v7, "sbh_addFilter:", v5);
}

- (void)widgetStyleManager:(id)a3 needsToRemoveFilter:(id)a4
{
  id v5 = a4;
  id v9 = [(SBHWidgetContainerViewController *)self view];
  id v6 = [v9 widgetView];
  id v7 = [v6 layer];

  id v8 = [v5 name];

  objc_msgSend(v7, "sbh_removeFilterWithName:", v8);
}

- (void)widgetStyleManagerDidUpdateConfiguration:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__SBHWidgetContainerViewController_widgetStyleManagerDidUpdateConfiguration___block_invoke;
  v3[3] = &unk_1E6AB48C8;
  v3[4] = self;
  [(SBHWidgetContainerViewController *)self enumerateObserversRespondingToSelector:sel_widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration_ usingBlock:v3];
}

uint64_t __77__SBHWidgetContainerViewController_widgetStyleManagerDidUpdateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration:*(void *)(a1 + 32)];
}

- (void)_setOriginalSize:(CGSize)a3
{
  if (self->_originalSize.width == *MEMORY[0x1E4F1DB30]
    && self->_originalSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    self->_originalSize = a3;
  }
}

- (void)_monitorForWidgetReadiness
{
  BOOL v3 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke;
    v4[3] = &unk_1E6AB4918;
    objc_copyWeak(&v5, &location);
    [v3 waitForContentReadyWithTimeout:v4 completion:3.0];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setContentReady:a2];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke_2;
    v5[3] = &unk_1E6AB48F0;
    v5[4] = v4;
    char v6 = a2;
    [v4 enumerateObserversRespondingToSelector:sel_widgetContainerViewControllerInitialWidgetContentReadinessChanged_widgetContentIsReady_ usingBlock:v5];
  }
}

uint64_t __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 widgetContainerViewControllerInitialWidgetContentReadinessChanged:*(void *)(a1 + 32) widgetContentIsReady:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_addDeactivationSnapshotViewIfNecessary
{
  id v10 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  BOOL v3 = [(SBHWidgetContainerViewController *)self showsSnapshotWhenDeactivated];
  if ((![(SBHWidgetContainerViewController *)self isWidgetControllerActive]
     || self->_allowDeactivationSnapshotViewForActiveWidgetController)
    && v3
    && !self->_deactivationSnapshotView
    && v10 != 0)
  {
    id v5 = [(SBHWidgetContainerViewController *)self snapshotView];
    deactivationSnapshotView = self->_deactivationSnapshotView;
    self->_deactivationSnapshotView = v5;

    [(UIView *)self->_deactivationSnapshotView setClipsToBounds:1];
    id v7 = self->_deactivationSnapshotView;
    id v8 = [(SBHWidgetContainerViewController *)self view];
    [v8 bounds];
    -[UIView setFrame:](v7, "setFrame:");

    [(UIView *)self->_deactivationSnapshotView setAutoresizingMask:18];
    id v9 = [(SBHWidgetContainerViewController *)self view];
    [v9 addSubview:self->_deactivationSnapshotView];

    if ([(UIViewController *)self->_widgetViewController sbh_isMultiplexingViewController])
    {
      [(UIViewController *)self->_widgetViewController setMultiplexedViewControllerShowsContentWhileDeactivated:1];
    }
  }
}

- (void)_clearDeactivationSnapshotView
{
  deactivationSnapshotView = self->_deactivationSnapshotView;
  if (deactivationSnapshotView)
  {
    [(UIView *)deactivationSnapshotView removeFromSuperview];
    id v4 = self->_deactivationSnapshotView;
    self->_deactivationSnapshotView = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_widgetHostViewController
{
  BOOL v3 = [(SBHWidgetContainerViewController *)self _multiplexedViewController];
  if (objc_msgSend(v3, "sbh_isWidgetHostViewController")) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  if ([(UIViewController *)self->_widgetViewController sbh_isWidgetHostViewController])
  {
    id v5 = self->_widgetViewController;

    id v4 = v5;
  }

  return v4;
}

- (id)_multiplexedViewController
{
  if ([(UIViewController *)self->_widgetViewController sbh_isMultiplexingViewController])
  {
    BOOL v3 = [(UIViewController *)self->_widgetViewController multiplexedViewController];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)_chsWidget
{
  id v2 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  BOOL v3 = [v2 widget];

  return v3;
}

- (id)_widgetExtensionBundleIdentifier
{
  id v2 = [(SBHWidgetContainerViewController *)self _chsWidget];
  BOOL v3 = [v2 extensionIdentity];

  id v4 = [v3 extensionBundleIdentifier];

  return v4;
}

- (void)_updateWidgetVisibility
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBHWidgetContainerViewController *)self userVisibilityStatus];
  id v4 = "not visible";
  if (v3 == 2)
  {
    id v4 = "visible not settled";
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (v3 == 3) {
    char v6 = "visible settled";
  }
  else {
    char v6 = v4;
  }
  if (v3 == 3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v5;
  }
  id v8 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
  if ([v8 visibility] != v7)
  {
    id v9 = [v8 widget];
    id v10 = [v9 extensionIdentity];
    uint64_t v11 = [v10 extensionBundleIdentifier];
    uint64_t v12 = SBLogWidgets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      long long v14 = v11;
      __int16 v15 = 2082;
      long long v16 = v6;
      _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Setting visibility of widget %{public}@ to %{public}s", (uint8_t *)&v13, 0x16u);
    }

    [v8 setVisibility:v7];
  }
}

+ (id)buildGradientBackgroundViewWithFrame:(CGRect)a3 continuousCornerRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.133333333 alpha:1.0];
  id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0784313725 alpha:1.0];
  uint64_t v11 = objc_msgSend(objc_alloc((Class)getPUIGradientViewClass()), "initWithFrame:", x, y, width, height);
  [v11 setAutoresizingMask:18];
  [v11 _setContinuousCornerRadius:a4];
  id v12 = v9;
  v16[0] = [v12 CGColor];
  id v13 = v10;
  v16[1] = [v13 CGColor];
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v11 setColors:v14 locations:0 type:*MEMORY[0x1E4F3A390]];

  return v11;
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_widgetViewController withName:@"widgetViewController"];
  id v5 = (id)[v3 appendUnsignedInteger:self->_userVisibilityStatus withName:@"userVisibilityStatus"];
  char v6 = [(SBHWidgetContainerViewController *)self _chsWidget];

  if (v6)
  {
    uint64_t v7 = [(SBHWidgetContainerViewController *)self _chsWidget];
    id v8 = [v7 intentReference];
    id v9 = [v8 intent];
    id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v9, "_indexingHash"), @"intentIdentifier");

    uint64_t v11 = [(SBHWidgetContainerViewController *)self _widgetHostViewController];
    id v12 = (id)[v3 appendPointer:v11 withName:@"widgetHostViewController"];
  }
  id v13 = [v3 build];

  return (NSString *)v13;
}

- (UIViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (SBLeafIconDataSource)widgetDataSource
{
  return self->_widgetDataSource;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (SBHWidgetContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHWidgetContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)userVisibilityStatus
{
  return self->_userVisibilityStatus;
}

- (BOOL)requiresClippingToBounds
{
  return self->_requiresClippingToBounds;
}

- (BOOL)showsSnapshotWhenDeactivated
{
  return self->_showsSnapshotWhenDeactivated;
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

- (BOOL)isContentReady
{
  return self->_contentReady;
}

- (void)setContentReady:(BOOL)a3
{
  self->_contentReaddouble y = a3;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (UIView)deactivationSnapshotView
{
  return self->_deactivationSnapshotView;
}

- (void)setDeactivationSnapshotView:(id)a3
{
}

- (BOOL)isWidgetControllerActive
{
  return self->_widgetControllerActive;
}

- (void)setWidgetControllerActive:(BOOL)a3
{
  self->_widgetControllerActive = a3;
}

- (SBHWidgetStyleManager)widgetStyleManager
{
  return self->_widgetStyleManager;
}

- (void)setWidgetStyleManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetStyleManager, 0);
  objc_storeStrong((id *)&self->_deactivationSnapshotView, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appliedColorFilter, 0);
  objc_storeStrong((id *)&self->_accentedBackgroundView, 0);
}

@end