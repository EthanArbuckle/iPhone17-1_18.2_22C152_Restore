@interface WGWidgetListItemViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGSize)_pendingSize;
- (CGSize)contentSizeForPreferredContentSize:(CGSize)a3;
- (CGSize)preferredContentSizeForContentOfSize:(CGSize)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSString)description;
- (NSString)widgetIdentifier;
- (WGWidgetHostingViewController)widgetHost;
- (WGWidgetHostingViewControllerDelegate)delegate;
- (WGWidgetListItemViewController)initWithWidgetIdentifier:(id)a3;
- (WGWidgetPlatterView)platterView;
- (id)_platterViewIfLoaded;
- (id)_platterViewLoadingIfNecessary:(BOOL)a3;
- (void)_addWidgetHostIfNecessary;
- (void)_setPendingSize:(CGSize)a3;
- (void)loadView;
- (void)managingContainerDidDisappear:(id)a3;
- (void)managingContainerWillAppear:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)removeChildViewController:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WGWidgetListItemViewController

- (WGWidgetListItemViewController)initWithWidgetIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListItemViewController;
  v5 = [(WGWidgetListItemViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    widgetIdentifier = v5->_widgetIdentifier;
    v5->_widgetIdentifier = (NSString *)v6;
  }
  return v5;
}

- (WGWidgetPlatterView)platterView
{
  return (WGWidgetPlatterView *)[(WGWidgetListItemViewController *)self _platterViewLoadingIfNecessary:1];
}

- (CGSize)preferredContentSizeForContentOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(WGWidgetListItemViewController *)self _platterViewLoadingIfNecessary:1];
  objc_msgSend(v5, "sizeThatFitsContentWithSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)contentSizeForPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(WGWidgetListItemViewController *)self _platterViewLoadingIfNecessary:1];
  objc_msgSend(v5, "contentSizeForSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)loadView
{
  v3 = objc_alloc_init(WGWidgetPlatterView);
  [(WGWidgetPlatterView *)v3 setListItem:self];
  [(WGWidgetPlatterView *)v3 setPreservesSuperviewLayoutMargins:1];
  [(WGWidgetListItemViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListItemViewController;
  [(WGWidgetListItemViewController *)&v4 viewDidLoad];
  v3 = [(WGWidgetListItemViewController *)self view];
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  -[WGWidgetListItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)managingContainerWillAppear:(id)a3
{
  id v4 = a3;
  [(WGWidgetListItemViewController *)self _addWidgetHostIfNecessary];
  [(WGWidgetHostingViewController *)self->_widgetHost managingContainerWillAppear:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(WGWidgetListItemViewController *)self _addWidgetHostIfNecessary];
  [(UIViewController *)self->_widgetHost wg_beginAppearanceTransitionIfNecessary:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  [(WGWidgetListItemViewController *)self _addWidgetHostIfNecessary];
  [(UIViewController *)self->_widgetHost wg_beginAppearanceTransitionIfNecessary:1 animated:v3];
  [(UIViewController *)self->_widgetHost wg_endAppearanceTransitionIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(UIViewController *)self->_widgetHost wg_beginAppearanceTransitionIfNecessary:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListItemViewController;
  [(WGWidgetListItemViewController *)&v4 viewDidDisappear:a3];
  [(UIViewController *)self->_widgetHost wg_endAppearanceTransitionIfNecessary];
}

- (void)managingContainerDidDisappear:(id)a3
{
}

- (void)removeChildViewController:(id)a3
{
  objc_super v4 = (WGWidgetHostingViewController *)a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  [(WGWidgetListItemViewController *)&v5 removeChildViewController:v4];
  if (self->_widgetHost == v4)
  {
    self->_widgetHost = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  objc_super v5 = [(WGWidgetListItemViewController *)self parentViewController];
  double v6 = v5;
  if (v5) {
    objc_msgSend(v5, "sizeForChildContentContainer:withParentContainerSize:", self, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  else {
    [(WGWidgetListItemViewController *)self preferredContentSize];
  }
  -[WGWidgetListItemViewController contentSizeForPreferredContentSize:](self, "contentSizeForPreferredContentSize:");
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListItemViewController;
  id v4 = a3;
  [(WGWidgetListItemViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[WGWidgetListItemViewController preferredContentSizeForContentOfSize:](self, "preferredContentSizeForContentOfSize:", v6, v8);
  -[WGWidgetListItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  self->_pendingSize.double width = width;
  self->_pendingSize.double height = height;
  v12.receiver = self;
  v12.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(WGWidgetListItemViewController *)self view];
  [v8 invalidateIntrinsicContentSize];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__WGWidgetListItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_264677188;
  objc_copyWeak(&v10, &location);
  [v7 animateAlongsideTransition:0 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __85__WGWidgetListItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pendingSize];
  objc_msgSend(WeakRetained, "setPreferredContentSize:");
}

- (BOOL)adjustsFontForContentSizeCategory
{
  v2 = [(WGWidgetListItemViewController *)self platterView];
  char v3 = [v2 adjustsFontForContentSizeCategory];

  return v3;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WGWidgetListItemViewController *)self platterView];
  [v4 setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(WGWidgetListItemViewController *)self platterView];
  int v4 = [v3 adjustForContentSizeCategoryChange];

  if (v4)
  {
    double v5 = [(WGWidgetListItemViewController *)self view];
    [v5 intrinsicContentSize];
    -[WGWidgetListItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
  return v4;
}

- (id)_platterViewLoadingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(WGWidgetListItemViewController *)self isViewLoaded] & 1) != 0 || v3)
  {
    double v5 = [(WGWidgetListItemViewController *)self view];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)_platterViewIfLoaded
{
  return [(WGWidgetListItemViewController *)self _platterViewLoadingIfNecessary:0];
}

- (void)_addWidgetHostIfNecessary
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_222E49000, log, OS_LOG_TYPE_ERROR, "%{public}@: failed to obtain widget host with ID '%{public}@'", (uint8_t *)&v4, 0x16u);
}

- (NSString)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  __int16 v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  uint64_t v7 = [(WGWidgetListItemViewController *)self widgetIdentifier];
  [v6 appendFormat:@" widgetIdentifier:%@;", v7];

  if ([(WGWidgetListItemViewController *)self isViewLoaded])
  {
    uint64_t v8 = [(WGWidgetListItemViewController *)self view];
    objc_super v9 = [(WGWidgetListItemViewController *)self view];
    [v9 frame];
    id v10 = NSStringFromCGRect(v13);
    [v6 appendFormat:@" view:%@; frame:%@;", v8, v10];
  }
  else
  {
    [v6 appendString:@" (view not loaded);"];
  }
  if (self->_widgetHost) {
    [v6 appendFormat:@" _widgetHost:%@>", self->_widgetHost];
  }
  else {
    [v6 appendString:@" (_widgetHost not loaded)>"];
  }
  return (NSString *)v6;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (WGWidgetHostingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetHostingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WGWidgetHostingViewController)widgetHost
{
  return self->_widgetHost;
}

- (CGSize)_pendingSize
{
  double width = self->_pendingSize.width;
  double height = self->_pendingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setPendingSize:(CGSize)a3
{
  self->_pendingSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetHost, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

@end