@interface WGWidgetGroupViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isEditingIcons;
- (BOOL)isHeaderVisible;
- (BOOL)isWidgetExtensionVisible:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldAnimateFirstTwoViewsAsOne;
- (BOOL)shouldAnimateLastTwoViewsAsOne;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldBlurContent;
- (CGSize)widgetListViewController:(id)a3 sizeForInterfaceOrientation:(int64_t)a4;
- (NSArray)extraViews;
- (NSArray)extraViewsContainers;
- (UIControl)editButton;
- (UIEdgeInsets)contentOccludingInset;
- (UIEdgeInsets)widgetListViewController:(id)a3 contentOccludingInsetsForInterfaceOrientation:(int64_t)a4;
- (UIScrollView)majorScrollView;
- (UIViewController)headerContentViewController;
- (WGWidgetGroupViewController)initWithWidgetDiscoveryController:(id)a3 listSettings:(WGWidgetListSettings)a4;
- (WGWidgetGroupViewControllerDelegate)delegate;
- (WGWidgetListSettings)listSettings;
- (id)_scrollViewForListViewController:(id)a3;
- (int64_t)_activeLayoutMode;
- (int64_t)_layoutModeForSize:(CGSize)a3;
- (unint64_t)location;
- (unint64_t)widgetCount;
- (void)_loadWidgetListViewController;
- (void)editViewDidAppear:(id)a3;
- (void)editViewDidDisappear:(id)a3;
- (void)editViewWillAppear:(id)a3;
- (void)editViewWillDisappear:(id)a3;
- (void)majorListViewControllerDidChangeHeaderVisibility:(id)a3;
- (void)makeVisibleWidgetWithIdentifier:(id)a3 completion:(id)a4;
- (void)presentEditViewWithCompletion:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setContentOccludingInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setHeaderContentViewController:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListSettings:(WGWidgetListSettings)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setShouldBlurContent:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WGWidgetGroupViewController

- (WGWidgetGroupViewController)initWithWidgetDiscoveryController:(id)a3 listSettings:(WGWidgetListSettings)a4
{
  uint64_t v4 = *(void *)&a4.useFavorites;
  unint64_t carouselEdges = a4.carouselEdges;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WGWidgetGroupViewController;
  v9 = [(WGWidgetGroupViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    p_discoveryController = (id *)&v9->_discoveryController;
    objc_storeStrong((id *)&v9->_discoveryController, a3);
    [*p_discoveryController addDiscoveryObserver:v10];
    [*p_discoveryController setDebuggingHandler:v10];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v10 selector:sel_editViewWillAppear_ name:@"WGWidgetListEditViewControllerWillAppear" object:0];
    [v12 addObserver:v10 selector:sel_editViewDidAppear_ name:@"WGWidgetListEditViewControllerDidAppear" object:0];
    [v12 addObserver:v10 selector:sel_editViewWillDisappear_ name:@"WGWidgetListEditViewControllerWillDisappear" object:0];
    [v12 addObserver:v10 selector:sel_editViewDidDisappear_ name:@"WGWidgetListEditViewControllerDidDisappear" object:0];
    v10->_listSettings.unint64_t carouselEdges = carouselEdges;
    *(void *)&v10->_listSettings.useFavorites = v4;
  }
  return v10;
}

- (id)_scrollViewForListViewController:(id)a3
{
  id v4 = a3;
  [(WGWidgetGroupViewController *)self loadViewIfNeeded];
  [v4 loadViewIfNeeded];
  v5 = [v4 widgetListView];

  return v5;
}

- (UIScrollView)majorScrollView
{
  return (UIScrollView *)[(WGWidgetGroupViewController *)self _scrollViewForListViewController:self->_majorColumnListViewController];
}

- (unint64_t)widgetCount
{
  return self->_lastWidgetCount;
}

- (void)setShouldBlurContent:(BOOL)a3
{
  if (self->_shouldBlurContent != a3)
  {
    self->_shouldBlurContent = a3;
    -[WGMajorListViewController setShouldBlurContent:](self->_majorColumnListViewController, "setShouldBlurContent:");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  majorColumnListViewController = self->_majorColumnListViewController;
  id v5 = a3;
  v6 = [(WGMajorListViewController *)majorColumnListViewController footerView];
  [v6 setLegibilitySettings:v5];

  debugLabel = self->_debugLabel;
  id v8 = [v5 primaryColor];

  [(UILabel *)debugLabel setTextColor:v8];
}

- (void)setHeaderContentViewController:(id)a3
{
}

- (UIViewController)headerContentViewController
{
  return [(WGMajorListViewController *)self->_majorColumnListViewController headerContentViewController];
}

- (BOOL)isHeaderVisible
{
  return [(WGMajorListViewController *)self->_majorColumnListViewController isHeaderVisible];
}

- (UIControl)editButton
{
  return [(WGWidgetListViewController *)self->_majorColumnListViewController editButton];
}

- (BOOL)isEditingIcons
{
  return [(WGWidgetListViewController *)self->_majorColumnListViewController isEditingIcons];
}

- (void)setEditingIcons:(BOOL)a3
{
}

- (void)setListSettings:(WGWidgetListSettings)a3
{
  self->_listSettings = a3;
  -[WGCarouselListViewController setListSettings:](self->_majorColumnListViewController, "setListSettings:");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetGroupViewController;
  [(WGWidgetGroupViewController *)&v5 viewDidLoad];
  v3 = [(WGWidgetGroupViewController *)self view];
  [(WGWidgetGroupViewController *)self _loadWidgetListViewController];
  id v4 = [(WGCarouselListViewController *)self->_majorColumnListViewController view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [v3 addSubview:v4];
  [(WGCarouselListViewController *)self->_majorColumnListViewController setContainerView:v3];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  objc_super v5 = [(WGCarouselListViewController *)self->_majorColumnListViewController view];
  v6 = [v5 superview];

  if (!v6)
  {
    v7 = [(WGWidgetGroupViewController *)self view];
    [v7 addSubview:v5];

    majorColumnListViewController = self->_majorColumnListViewController;
    v9 = [(WGWidgetGroupViewController *)self view];
    [(WGCarouselListViewController *)majorColumnListViewController setContainerView:v9];
  }
  [(UIViewController *)self->_majorColumnListViewController wg_beginAppearanceTransitionIfNecessary:1 animated:v3];
  [(UILabel *)self->_debugLabel setText:@"Appearing"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetGroupViewController;
  [(WGWidgetGroupViewController *)&v8 viewDidAppear:a3];
  id v4 = +[WGWidgetEventTracker sharedInstance];
  unint64_t v5 = [(WGWidgetGroupViewController *)self location];
  v6 = [(WGWidgetDiscoveryController *)self->_discoveryController enabledWidgetIdentifiersForAllGroups];
  v7 = [(WGWidgetDiscoveryController *)self->_discoveryController disabledWidgetIdentifiers];
  [v4 widgetListDidAppearAtLocation:v5 withEnabledWidgets:v6 disabledWidgets:v7];

  [(UIViewController *)self->_majorColumnListViewController wg_endAppearanceTransitionIfNecessary];
  [(UILabel *)self->_debugLabel setText:@"Appeared"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(UIViewController *)self->_majorColumnListViewController wg_beginAppearanceTransitionIfNecessary:0 animated:v3];
  [(UILabel *)self->_debugLabel setText:@"Disappearing"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WGWidgetGroupViewController;
  [(WGWidgetGroupViewController *)&v7 viewDidDisappear:a3];
  [(UIViewController *)self->_majorColumnListViewController wg_endAppearanceTransitionIfNecessary];
  id v4 = [(WGCarouselListViewController *)self->_majorColumnListViewController presentedViewController];
  objc_super v5 = [(WGWidgetDiscoveryController *)self->_discoveryController presentedEditViewController];

  if (v4 == v5) {
    [(WGWidgetDiscoveryController *)self->_discoveryController dismissWidgetListEditViewControllerAnimated:0 completion:0];
  }
  v6 = +[WGWidgetEventTracker sharedInstance];
  objc_msgSend(v6, "widgetListDidDisappearAtLocation:", -[WGWidgetGroupViewController location](self, "location"));

  [(UILabel *)self->_debugLabel setText:@"Disappeared"];
}

- (NSArray)extraViewsContainers
{
  return [(WGMajorListViewController *)self->_majorColumnListViewController extraViewsContainers];
}

- (NSArray)extraViews
{
  return (NSArray *)[(WGCarouselListViewController *)self->_majorColumnListViewController extraViews];
}

- (BOOL)shouldAnimateLastTwoViewsAsOne
{
  return [(WGMajorListViewController *)self->_majorColumnListViewController shouldAnimateLastTwoViewsAsOne];
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  return [(WGCarouselListViewController *)self->_majorColumnListViewController shouldAnimateFirstTwoViewsAsOne];
}

- (int64_t)_layoutModeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = objc_opt_class();
  return objc_msgSend(v5, "layoutModeForSize:", width, height);
}

- (int64_t)_activeLayoutMode
{
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (![(WGWidgetGroupViewController *)self isViewLoaded]) {
    return 2 * ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  }
  objc_super v5 = [(WGWidgetGroupViewController *)self view];
  [v5 bounds];
  int64_t v8 = -[WGWidgetGroupViewController _layoutModeForSize:](self, "_layoutModeForSize:", v6, v7);

  return v8;
}

- (void)_loadWidgetListViewController
{
  BOOL v3 = -[WGCarouselListViewController initWithWidgetDiscoveryController:listSettings:]([WGCarouselListViewController alloc], "initWithWidgetDiscoveryController:listSettings:", self->_discoveryController, self->_listSettings.carouselEdges, *(void *)&self->_listSettings.useFavorites);
  majorColumnListViewController = self->_majorColumnListViewController;
  self->_majorColumnListViewController = v3;

  [(WGWidgetListViewController *)self->_majorColumnListViewController setDelegate:self];
  [(WGMajorListViewController *)self->_majorColumnListViewController setShouldBlurContent:[(WGWidgetGroupViewController *)self shouldBlurContent]];
  [(WGWidgetListViewController *)self->_majorColumnListViewController setShouldIncludeScrollView:1];
  [(WGWidgetGroupViewController *)self addChildViewController:self->_majorColumnListViewController];
  objc_super v5 = self->_majorColumnListViewController;
  [(WGCarouselListViewController *)v5 didMoveToParentViewController:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)editViewWillAppear:(id)a3
{
}

- (void)editViewDidAppear:(id)a3
{
}

- (void)editViewWillDisappear:(id)a3
{
  if ([(UIViewController *)self wg_isAppearingOrAppeared])
  {
    majorColumnListViewController = self->_majorColumnListViewController;
    [(WGCarouselListViewController *)majorColumnListViewController beginAppearanceTransition:1 animated:1];
  }
}

- (void)editViewDidDisappear:(id)a3
{
  if ([(WGWidgetGroupViewController *)self _appearState] == 2)
  {
    majorColumnListViewController = self->_majorColumnListViewController;
    [(WGCarouselListViewController *)majorColumnListViewController endAppearanceTransition];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidScroll_ withObject:v5];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewWillBeginDragging_ withObject:v5];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewDidEndDragging:v7 willDecelerate:v4];
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewWillBeginDecelerating_ withObject:v5];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidEndDecelerating_ withObject:v5];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidEndScrollingAnimation_ withObject:v5];
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = [WeakRetained scrollViewShouldScrollToTop:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidScrollToTop_ withObject:v5];
  }
}

- (void)majorListViewControllerDidChangeHeaderVisibility:(id)a3
{
  id v4 = [(WGWidgetGroupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 widgetGroupViewControllerDidChangeHeaderVisibility:self];
  }
}

- (CGSize)widgetListViewController:(id)a3 sizeForInterfaceOrientation:(int64_t)a4
{
  char v6 = [a3 viewIfLoaded];
  id v7 = [v6 window];
  if (v7)
  {
    [v6 bounds];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained widgetGroupViewController:self sizeForInterfaceOrientation:a4];
    double v9 = v13;
    double v11 = v14;
  }

  double v15 = v9;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (UIEdgeInsets)widgetListViewController:(id)a3 contentOccludingInsetsForInterfaceOrientation:(int64_t)a4
{
  [(WGWidgetGroupViewController *)self contentOccludingInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained widgetGroupViewController:self contentOccludingInsetsForInterfaceOrientation:a4];
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
  }

  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (BOOL)isWidgetExtensionVisible:(id)a3
{
  id v4 = a3;
  if ([(WGWidgetGroupViewController *)self _appearState]) {
    BOOL v5 = [(WGWidgetListViewController *)self->_majorColumnListViewController isWidgetExtensionVisible:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (WGWidgetGroupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetGroupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (BOOL)shouldBlurContent
{
  return self->_shouldBlurContent;
}

- (UIEdgeInsets)contentOccludingInset
{
  double top = self->_contentOccludingInset.top;
  double left = self->_contentOccludingInset.left;
  double bottom = self->_contentOccludingInset.bottom;
  double right = self->_contentOccludingInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentOccludingInset:(UIEdgeInsets)a3
{
  self->_contentOccludingInset = a3;
}

- (WGWidgetListSettings)listSettings
{
  p_listSettings = &self->_listSettings;
  unint64_t carouselEdges = self->_listSettings.carouselEdges;
  uint64_t v4 = *(void *)&p_listSettings->useFavorites;
  result.useFavorites = v4;
  result.carouselIgnoresHeader = BYTE1(v4);
  result.pinned = BYTE2(v4);
  result.unint64_t carouselEdges = carouselEdges;
  return result;
}

- (void)setEditButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_majorColumnListViewController, 0);
  objc_storeStrong((id *)&self->_discoveryController, 0);
}

- (void)makeVisibleWidgetWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  double v6 = (void (**)(id, void))a4;
  if ([v9 length])
  {
    double v7 = self->_majorColumnListViewController;
    double v8 = v7;
    if (v7)
    {
      [(WGWidgetListViewController *)v7 makeVisibleWidgetWithIdentifier:v9 completion:v6];
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)presentEditViewWithCompletion:(id)a3
{
  id v4 = a3;
  discoveryController = self->_discoveryController;
  majorColumnListViewController = self->_majorColumnListViewController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__WGWidgetGroupViewController_PPTTest__presentEditViewWithCompletion___block_invoke;
  v8[3] = &unk_264676E30;
  id v9 = v4;
  id v7 = v4;
  [(WGWidgetDiscoveryController *)discoveryController presentWidgetListEditViewControllerFromViewController:majorColumnListViewController animated:1 completion:v8];
}

uint64_t __70__WGWidgetGroupViewController_PPTTest__presentEditViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end