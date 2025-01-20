@interface PRXCardContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldLayoutViewControllerBeforeCalculatingSize:(id)a3;
- (CGSize)_maximumCardSizeForContainerSize:(CGSize)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (PRXCardContainerViewController)init;
- (PRXCardContainerViewController)initWithCoder:(id)a3;
- (PRXCardContainerViewController)initWithConfiguration:(id)a3;
- (PRXFlowConfiguration)configuration;
- (PRXFlowDelegate)flowDelegate;
- (PRXPullDismissalInteractionDriver)pullDismissalInteractionDriver;
- (UINavigationController)mainNavigationController;
- (UIViewController)contentViewController;
- (id)didShowViewController;
- (id)initAsSingleCardWithContentViewController:(id)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4 configuration:(id)a5;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int64_t)_cardStyleForContentContainer:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_commonInit;
- (void)_updateCardSizeClassForContainerSize:(CGSize)a3;
- (void)_updateContainerPreferredContentSize;
- (void)_updatePreferredContentSizeForViewController:(id)a3 containerSize:(CGSize)a4;
- (void)backgroundTapped:(id)a3;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDidShowViewController:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PRXCardContainerViewController

- (id)initAsSingleCardWithContentViewController:(id)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4 configuration:(id)a5
{
  CGFloat trailing = a4.trailing;
  CGFloat bottom = a4.bottom;
  CGFloat leading = a4.leading;
  CGFloat top = a4.top;
  id v12 = a3;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PRXCardContainerViewController;
  v14 = [(PRXCardContainerViewController *)&v17 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a5);
    objc_storeStrong((id *)&v15->_contentViewController, a3);
    v15->_containerLayoutMargins.CGFloat top = top;
    v15->_containerLayoutMargins.CGFloat leading = leading;
    v15->_containerLayoutMargins.CGFloat bottom = bottom;
    v15->_containerLayoutMargins.CGFloat trailing = trailing;
    v15->_legacyCard = 1;
    [(PRXCardContainerViewController *)v15 _commonInit];
  }

  return v15;
}

- (PRXCardContainerViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRXCardContainerViewController;
  v6 = [(PRXCardContainerViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_alloc_init(PRXNavigationController);
    mainNavigationController = v7->_mainNavigationController;
    v7->_mainNavigationController = &v8->super;

    [(UINavigationController *)v7->_mainNavigationController setDelegate:v7];
    [(UINavigationController *)v7->_mainNavigationController setNavigationBarHidden:1];
    objc_storeStrong((id *)&v7->_contentViewController, v7->_mainNavigationController);
    v7->_containerLayoutMargins.CGFloat top = PRXCardContainerDefaultLayoutMargins();
    v7->_containerLayoutMargins.CGFloat leading = v10;
    v7->_containerLayoutMargins.CGFloat bottom = v11;
    v7->_containerLayoutMargins.CGFloat trailing = v12;
    v7->_legacyCard = 0;
    [(PRXCardContainerViewController *)v7 _commonInit];
  }

  return v7;
}

- (PRXCardContainerViewController)init
{
  v3 = +[PRXFlowConfiguration defaultConfiguration];
  v4 = [(PRXCardContainerViewController *)self initWithConfiguration:v3];

  return v4;
}

- (PRXCardContainerViewController)initWithCoder:(id)a3
{
  v4 = +[PRXFlowConfiguration defaultConfiguration];
  id v5 = [(PRXCardContainerViewController *)self initWithConfiguration:v4];

  return v5;
}

- (void)_commonInit
{
  [(PRXCardContainerViewController *)self setModalPresentationStyle:4];
  v3 = [[PRXTransitioningController alloc] initWithPullDismissalProvider:self];
  transitionController = self->_transitionController;
  self->_transitionController = v3;

  [(PRXCardContainerViewController *)self setTransitioningDelegate:self->_transitionController];
  id v5 = [(PRXCardContainerViewController *)self configuration];
  char v6 = [v5 supportsDarkMode];

  if ((v6 & 1) == 0) {
    [(PRXCardContainerViewController *)self setOverrideUserInterfaceStyle:1];
  }
  v7 = [(PRXCardContainerViewController *)self configuration];
  uint64_t v8 = [v7 overrideInterfaceStyle];

  if (v8)
  {
    id v9 = [(PRXCardContainerViewController *)self configuration];
    -[PRXCardContainerViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v9 overrideInterfaceStyle]);
  }
}

- (void)loadView
{
  v3 = [PRXCardContainerView alloc];
  uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
  [(id)v4 bounds];
  id v5 = -[PRXCardContainerView initWithFrame:containerLayoutMargins:](v3, "initWithFrame:containerLayoutMargins:");
  container = self->_container;
  self->_container = v5;

  [(PRXCardContainerView *)self->_container setAutoresizingMask:18];
  [(PRXCardContainerView *)self->_container setDelegate:self];
  v7 = [(PRXCardContainerViewController *)self configuration];
  LOBYTE(v4) = [v7 supportsDarkMode];

  if ((v4 & 1) == 0) {
    [(PRXCardContainerView *)self->_container setAccessibilityIgnoresInvertColors:1];
  }
  uint64_t v8 = self->_container;
  [(PRXCardContainerViewController *)self setView:v8];
}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 1);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PRXCardContainerViewController;
  [(PRXCardContainerViewController *)&v11 viewDidLoad];
  [(PRXCardContainerViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
  v3 = [PRXPullDismissalInteractionDriver alloc];
  uint64_t v4 = [(PRXCardContainerView *)self->_container pullDismissalScrollView];
  id v5 = [(PRXPullDismissalInteractionDriver *)v3 initWithPresentedViewController:self scrollView:v4];
  pullDismissalInteractionDriver = self->_pullDismissalInteractionDriver;
  self->_pullDismissalInteractionDriver = v5;

  [(PRXCardContainerViewController *)self addChildViewController:self->_contentViewController];
  v7 = [(UIViewController *)self->_contentViewController view];
  uint64_t v8 = [(PRXCardContainerView *)self->_container contentContainerView];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");
  [v8 addSubview:v7];
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
  [(PRXCardContainerView *)self->_container bounds];
  -[PRXCardContainerViewController _updateCardSizeClassForContainerSize:](self, "_updateCardSizeClassForContainerSize:", v9, v10);
}

- (void)viewDidLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PRXCardContainerViewController;
  [(PRXCardContainerViewController *)&v26 viewDidLayoutSubviews];
  if (self->_legacyCard)
  {
    v3 = [(UIViewController *)self->_contentViewController view];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;

    contentViewController = self->_contentViewController;
    double v9 = [(PRXCardContainerViewController *)self view];
    [v9 bounds];
    -[PRXCardContainerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", contentViewController, v10, v11);
    double v13 = v12;
    double v15 = v14;

    v16 = [(UIViewController *)self->_contentViewController view];
    objc_msgSend(v16, "setFrame:", v5, v7, v13, v15);
  }
  else
  {
    v16 = [(PRXCardContainerView *)self->_container contentContainerView];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [(UIViewController *)self->_contentViewController view];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UINavigationController *)self->_mainNavigationController topViewController];
  contentViewController = v5;
  if (!v5) {
    contentViewController = self->_contentViewController;
  }
  [(PRXCardContainerView *)self->_container bounds];
  -[PRXCardContainerViewController _updatePreferredContentSizeForViewController:containerSize:](self, "_updatePreferredContentSizeForViewController:containerSize:", contentViewController, v7, v8);

  double v9 = [(UIViewController *)self->_contentViewController view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  double v14 = self->_contentViewController;
  double v15 = [(PRXCardContainerViewController *)self view];
  [v15 bounds];
  -[PRXCardContainerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v14, v16, v17);
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = [(UIViewController *)self->_contentViewController view];
  objc_msgSend((id)v22, "setFrame:", v11, v13, v19, v21);

  [(PRXCardContainerViewController *)self _updateContainerPreferredContentSize];
  v26.receiver = self;
  v26.super_class = (Class)PRXCardContainerViewController;
  [(PRXCardContainerViewController *)&v26 viewWillAppear:v3];
  p_flowDelegate = &self->_flowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_flowDelegate);
  LOBYTE(v22) = objc_opt_respondsToSelector();

  if (v22)
  {
    id v25 = objc_loadWeakRetained((id *)p_flowDelegate);
    [v25 proxCardFlowWillPresent];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRXCardContainerViewController;
  [(PRXCardContainerViewController *)&v8 viewDidDisappear:a3];
  p_flowDelegate = &self->_flowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_flowDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_flowDelegate);
    [v7 proxCardFlowDidDismiss];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[PRXCardContainerViewController _updateCardSizeClassForContainerSize:](self, "_updateCardSizeClassForContainerSize:", width, height);
  objc_super v8 = [(UINavigationController *)self->_mainNavigationController topViewController];
  contentViewController = v8;
  if (!v8) {
    contentViewController = self->_contentViewController;
  }
  -[PRXCardContainerViewController _updatePreferredContentSizeForViewController:containerSize:](self, "_updatePreferredContentSizeForViewController:containerSize:", contentViewController, width, height);

  [(PRXCardContainerViewController *)self _updateContainerPreferredContentSize];
  v10.receiver = self;
  v10.super_class = (Class)PRXCardContainerViewController;
  -[PRXCardContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  -[PRXCardContainerViewController _maximumCardSizeForContainerSize:](self, "_maximumCardSizeForContainerSize:", a3, a4.width, a4.height);
  double v6 = v5;
  double v8 = v7;
  [(PRXCardContainerView *)self->_container preferredContentSize];
  if (v6 < v9) {
    double v9 = v6;
  }
  if (v8 < v10) {
    double v10 = v8;
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)_maximumCardSizeForContainerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_containerLayoutMargins = &self->_containerLayoutMargins;
  double bottom = self->_containerLayoutMargins.bottom;
  double trailing = self->_containerLayoutMargins.trailing;
  double leading = self->_containerLayoutMargins.leading;
  BOOL v9 = PRXIsPad();
  if (height <= width || v9) {
    p_CGFloat top = &p_containerLayoutMargins->top;
  }
  else {
    p_CGFloat top = (double *)&PRXCardContainerTopLayoutMarginPortraitPhone;
  }
  double v12 = width - (leading + trailing);
  double v13 = height - bottom - *p_top;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PRXCardContainerViewController;
  double v4 = (UIViewController *)a3;
  [(PRXCardContainerViewController *)&v6 preferredContentSizeDidChangeForChildContentContainer:v4];
  contentViewController = self->_contentViewController;

  if (contentViewController == v4) {
    [(PRXCardContainerViewController *)self _updateContainerPreferredContentSize];
  }
}

- (int64_t)_cardStyleForContentContainer:(id)a3
{
  double v4 = (UINavigationController *)a3;
  double v5 = v4;
  mainNavigationController = self->_mainNavigationController;
  double v7 = v4;
  if (mainNavigationController == v4)
  {
    double v7 = [(UINavigationController *)v4 topViewController];
  }
  if (objc_opt_respondsToSelector()) {
    int64_t v8 = [v7 cardStyle];
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)_updateCardSizeClassForContainerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v18[2] = *MEMORY[0x263EF8340];
  objc_super v6 = objc_msgSend(MEMORY[0x263F1CB00], "prx_traitCollectionWithCardSizeClass:", PRXCardPreferredSizeClassForContainerBounds(0.0, 0.0, a3.width, a3.height));
  double v7 = [(PRXCardContainerViewController *)self configuration];
  int64_t v8 = [v7 customBackgroundColor];

  if (v8)
  {
    BOOL v9 = (void *)MEMORY[0x263F1CB00];
    double v10 = [(PRXCardContainerViewController *)self configuration];
    double v11 = [v10 customBackgroundColor];
    double v12 = objc_msgSend(v9, "prx_traitCollectionWithCustomBackgroundColor:", v11);

    double v13 = (void *)MEMORY[0x263F1CB00];
    v18[0] = v6;
    v18[1] = v12;
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    id v15 = [v13 traitCollectionWithTraitsFromCollections:v14];
  }
  else
  {
    id v15 = v6;
  }
  [(PRXCardContainerViewController *)self setOverrideTraitCollection:v15 forChildViewController:self->_contentViewController];
  BOOL v16 = !PRXIsPad();
  BOOL v17 = height > width && v16;
  [(PRXCardContainerView *)self->_container setUsePortraitTopInset:v17];
}

- (void)_updatePreferredContentSizeForViewController:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(PRXCardContainerViewController *)self _cardStyleForContentContainer:v11];
    int64_t v8 = [(UIViewController *)self->_contentViewController traitCollection];
    double v9 = PRXCardPreferredSize(v7, objc_msgSend(v8, "prx_cardSizeClass"));

    -[PRXCardContainerViewController _maximumCardSizeForContainerSize:](self, "_maximumCardSizeForContainerSize:", width, height);
    if (v9 < v10) {
      double v10 = v9;
    }
    [v11 updatePreferredContentSizeForCardWidth:v10];
  }
}

- (void)_updateContainerPreferredContentSize
{
  uint64_t v3 = [(PRXCardContainerViewController *)self _cardStyleForContentContainer:self->_contentViewController];
  double v4 = [(UIViewController *)self->_contentViewController traitCollection];
  double v5 = PRXCardPreferredSize(v3, objc_msgSend(v4, "prx_cardSizeClass"));
  double v7 = v6;

  [(UIViewController *)self->_contentViewController preferredContentSize];
  if (v7 >= v8) {
    double v8 = v7;
  }
  container = self->_container;
  -[PRXCardContainerView setPreferredContentSize:](container, "setPreferredContentSize:", v5, v8);
}

- (BOOL)_shouldLayoutViewControllerBeforeCalculatingSize:(id)a3
{
  id v3 = a3;
  double v4 = [v3 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [v3 view];
    double v7 = [v6 scrollView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = 1;
    }
    else
    {
      double v9 = [v6 scrollView];
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)_canShowWhileLocked
{
  v2 = [(UINavigationController *)self->_mainNavigationController topViewController];
  char v3 = [v2 _canShowWhileLocked];

  return v3;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v7 = a6;
  char v8 = objc_alloc_init(PRXCrossDissolveTransition);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __123__PRXCardContainerViewController_navigationController_animationControllerForOperation_fromViewController_toViewController___block_invoke;
  v14[3] = &unk_264418170;
  v14[4] = self;
  [(PRXCrossDissolveTransition *)v8 setAdditionalAnimations:v14];
  double v9 = [(PRXCardContainerViewController *)self view];
  [v9 bounds];
  -[PRXCardContainerViewController _maximumCardSizeForContainerSize:](self, "_maximumCardSizeForContainerSize:", v10, v11);
  -[PRXCrossDissolveTransition setMaxSize:](v8, "setMaxSize:");

  int64_t v12 = [(PRXCardContainerViewController *)self _cardStyleForContentContainer:v7];
  [(PRXCrossDissolveTransition *)v8 setCardStyle:v12];
  return v8;
}

void __123__PRXCardContainerViewController_navigationController_animationControllerForOperation_fromViewController_toViewController___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setDefersKeyboardUpdates:0];
  v2 = [*(id *)(*(void *)(a1 + 32) + 984) contentContainerView];
  char v3 = [v2 superview];
  [v3 layoutIfNeeded];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v26 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [v8 allowsPullToDismiss];
  }
  else {
    uint64_t v9 = 0;
  }
  double v10 = [(PRXCardContainerView *)self->_container pullDismissalScrollView];
  [v10 setAllowsPullToDismiss:v9];

  if (([(PRXCardContainerViewController *)self isBeingPresented] & 1) == 0)
  {
    [(PRXCardContainerView *)self->_container bounds];
    -[PRXCardContainerViewController _updatePreferredContentSizeForViewController:containerSize:](self, "_updatePreferredContentSizeForViewController:containerSize:", v8, v11, v12);
    [v8 preferredContentSize];
    objc_msgSend(v26, "setPreferredContentSize:");
  }
  if (v5)
  {
    [(PRXCardContainerView *)self->_container setDefersKeyboardUpdates:1];
    double v13 = [(PRXCardContainerViewController *)self view];
    [v13 setNeedsLayout];
  }
  else
  {
    double v14 = [v26 view];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;

    double v19 = [(PRXCardContainerViewController *)self view];
    [v19 bounds];
    -[PRXCardContainerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v26, v20, v21);
    double v23 = v22;
    double v25 = v24;

    double v13 = [v26 view];
    objc_msgSend(v13, "setFrame:", v16, v18, v23, v25);
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  double v6 = [(PRXCardContainerViewController *)self didShowViewController];

  if (v6)
  {
    id v7 = [(PRXCardContainerViewController *)self didShowViewController];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)backgroundTapped:(id)a3
{
  id v3 = [(PRXCardContainerViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (PRXPullDismissalInteractionDriver)pullDismissalInteractionDriver
{
  return self->_pullDismissalInteractionDriver;
}

- (PRXFlowConfiguration)configuration
{
  return self->_configuration;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UINavigationController)mainNavigationController
{
  return self->_mainNavigationController;
}

- (PRXFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  return (PRXFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (id)didShowViewController
{
  return self->_didShowViewController;
}

- (void)setDidShowViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didShowViewController, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pullDismissalInteractionDriver, 0);
  objc_storeStrong((id *)&self->_mainNavigationController, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

@end