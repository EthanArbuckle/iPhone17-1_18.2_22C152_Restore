@interface NUPageViewController
- (BOOL)_assistiveTechnologyIsRunning;
- (BOOL)_shouldIgnoreDidScrollWithScrollView:(id)a3;
- (BOOL)canSwitchToNextViewController;
- (BOOL)canSwitchToPreviousViewController;
- (BOOL)cancelScrollViewDidScroll;
- (BOOL)isTransitioning;
- (BOOL)pagingEnabled;
- (BOOL)scrollViewStartedScrolling;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGPoint)centerForIndex:(unint64_t)a3;
- (CGSize)pageSize;
- (CGSize)transitioningSize;
- (NSMutableArray)replayViewTransitions;
- (NUPageViewController)initWithCoder:(id)a3;
- (NUPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NUPageViewControllerDataSource)dataSource;
- (NUPageViewControllerDelegate)delegate;
- (NUPageViewControllerScrollView)scrollView;
- (OS_dispatch_group)idleDispatchGroup;
- (UIViewController)appearingViewController;
- (UIViewController)disappearingViewController;
- (UIViewController)managedForViewController;
- (UIViewController)nextViewController;
- (UIViewController)originalVisibleViewController;
- (UIViewController)possibleNextViewController;
- (UIViewController)previousViewController;
- (UIViewController)visibleViewController;
- (void)_keyboardSwitchGoingRight:(BOOL)a3;
- (void)addViewController:(id)a3 fromScroll:(BOOL)a4;
- (void)callLastViewAppearanceMethods;
- (void)commonInit;
- (void)handleScrollEnd;
- (void)handleScrollStart;
- (void)keyboardOrActionSwitchToNextViewController;
- (void)keyboardOrActionSwitchToPreviousViewController;
- (void)managePreviousAndNextViewController;
- (void)performWhenIdle:(id)a3;
- (void)reindexViewControllers;
- (void)removeViewController:(id)a3;
- (void)repositionPages;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAppearingViewController:(id)a3;
- (void)setCancelScrollViewDidScroll:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisappearingViewController:(id)a3;
- (void)setManagedForViewController:(id)a3;
- (void)setNextViewController:(id)a3;
- (void)setOriginalVisibleViewController:(id)a3;
- (void)setPagingEnabled:(BOOL)a3;
- (void)setPossibleNextViewController:(id)a3;
- (void)setPreviousViewController:(id)a3;
- (void)setReplayViewTransitions:(id)a3;
- (void)setVisibleViewController:(id)a3;
- (void)switchToNextViewController;
- (void)switchToPreviousViewController;
- (void)transitionToSize:(CGSize)a3;
- (void)updateContentOffset;
- (void)updateContentSize;
- (void)updatePositionForViewController:(id)a3;
- (void)updateScrollView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NUPageViewController

- (NUPageViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUPageViewController;
  v3 = [(NUPageViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NUPageViewController *)v3 commonInit];
  }
  return v4;
}

- (NUPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NUPageViewController;
  v4 = [(NUPageViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(NUPageViewController *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  v3 = objc_alloc_init(NUPageViewControllerScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(NUPageViewControllerScrollView *)self->_scrollView _setContentInsetAdjustmentBehavior:2];
  [(NUPageViewControllerScrollView *)self->_scrollView setAutoresizesSubviews:0];
  [(NUPageViewControllerScrollView *)self->_scrollView setPagingEnabled:1];
  [(NUPageViewControllerScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
  [(NUPageViewControllerScrollView *)self->_scrollView setAlwaysBounceVertical:0];
  [(NUPageViewControllerScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(NUPageViewControllerScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(NUPageViewControllerScrollView *)self->_scrollView setCanCancelContentTouches:1];
  [(NUPageViewControllerScrollView *)self->_scrollView setDelaysContentTouches:0];
  [(NUPageViewControllerScrollView *)self->_scrollView setDelegate:self];
  [(NUPageViewControllerScrollView *)self->_scrollView setAccessibilityDelegate:self];
  [(NUPageViewControllerScrollView *)self->_scrollView setDirectionalLockEnabled:1];
  v5 = (OS_dispatch_group *)dispatch_group_create();
  idleDispatchGroup = self->_idleDispatchGroup;
  self->_idleDispatchGroup = v5;

  self->_replayViewTransitions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);

  MEMORY[0x270F9A758]();
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)NUPageViewController;
  [(NUPageViewController *)&v13 viewDidLoad];
  v3 = [(NUPageViewController *)self view];
  v4 = [MEMORY[0x263F1C550] whiteColor];
  [v3 setBackgroundColor:v4];

  v5 = [(NUPageViewController *)self scrollView];
  objc_super v6 = [(NUPageViewController *)self view];
  [v6 bounds];
  CGRect v15 = CGRectInset(v14, -2.0, 0.0);
  objc_msgSend(v5, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

  objc_super v7 = [(NUPageViewController *)self scrollView];
  [v7 setAutoresizingMask:18];

  v8 = [(NUPageViewController *)self view];
  v9 = [(NUPageViewController *)self scrollView];
  [v8 addSubview:v9];

  v10 = [(NUPageViewController *)self view];
  [v10 bounds];
  -[NUPageViewController transitionToSize:](self, "transitionToSize:", v11, v12);

  [(NUPageViewController *)self updateContentSize];
  [(NUPageViewController *)self updateContentOffset];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)NUPageViewController;
  [(NUPageViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(NUPageViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = [(NUPageViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    CGRect v14 = [(NUPageViewController *)self view];
    [v14 bounds];
    -[NUPageViewController transitionToSize:](self, "transitionToSize:", v15, v16);
  }
  [(NUPageViewController *)self managePreviousAndNextViewController];
  [(NUPageViewController *)self updateContentOffset];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewWillAppear:](&v29, sel_viewWillAppear_);
  double v5 = [(NUPageViewController *)self scrollView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(NUPageViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    double v16 = [(NUPageViewController *)self view];
    [v16 bounds];
    -[NUPageViewController transitionToSize:](self, "transitionToSize:", v17, v18);
  }
  v19 = [(NUPageViewController *)self visibleViewController];

  if (v19)
  {
    v20 = [(NUPageViewController *)self visibleViewController];
    [v20 beginAppearanceTransition:1 animated:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    v21 = [(NUPageViewController *)self replayViewTransitions];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __39__NUPageViewController_viewWillAppear___block_invoke;
    v26 = &unk_2645FED68;
    objc_copyWeak(&v27, &location);
    v22 = (void *)MEMORY[0x223C968A0](&v23);
    objc_msgSend(v21, "addObject:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __39__NUPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 beginAppearanceTransition:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NUPageViewController;
  [(NUPageViewController *)&v14 viewDidAppear:a3];
  double v4 = [(NUPageViewController *)self visibleViewController];

  if (v4)
  {
    double v5 = [(NUPageViewController *)self visibleViewController];
    [v5 endAppearanceTransition];
  }
  else
  {
    objc_initWeak(&location, self);
    double v6 = [(NUPageViewController *)self replayViewTransitions];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    double v10 = __38__NUPageViewController_viewDidAppear___block_invoke;
    double v11 = &unk_2645FED68;
    objc_copyWeak(&v12, &location);
    double v7 = (void *)MEMORY[0x223C968A0](&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __38__NUPageViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  double v5 = [(NUPageViewController *)self visibleViewController];

  if (v5)
  {
    double v6 = [(NUPageViewController *)self visibleViewController];
    [v6 beginAppearanceTransition:0 animated:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    double v7 = [(NUPageViewController *)self replayViewTransitions];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __42__NUPageViewController_viewWillDisappear___block_invoke;
    id v12 = &unk_2645FED68;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = (void *)MEMORY[0x223C968A0](&v9);
    objc_msgSend(v7, "addObject:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __42__NUPageViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 beginAppearanceTransition:0 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NUPageViewController;
  [(NUPageViewController *)&v14 viewDidDisappear:a3];
  double v4 = [(NUPageViewController *)self visibleViewController];

  if (v4)
  {
    double v5 = [(NUPageViewController *)self visibleViewController];
    [v5 endAppearanceTransition];
  }
  else
  {
    objc_initWeak(&location, self);
    double v6 = [(NUPageViewController *)self replayViewTransitions];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __41__NUPageViewController_viewDidDisappear___block_invoke;
    double v11 = &unk_2645FED68;
    objc_copyWeak(&v12, &location);
    double v7 = (void *)MEMORY[0x223C968A0](&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __41__NUPageViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 endAppearanceTransition];
}

- (void)performWhenIdle:(id)a3
{
  id v4 = a3;
  double v5 = [(NUPageViewController *)self idleDispatchGroup];
  dispatch_group_notify(v5, MEMORY[0x263EF83A0], v4);
}

- (void)setVisibleViewController:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(NUPageViewController *)self visibleViewController];

  if (v6 != v5)
  {
    double v7 = [(NUPageViewController *)self visibleViewController];
    uint64_t v8 = [(NUPageViewController *)self visibleViewController];

    if (v8)
    {
      uint64_t v9 = [(NUPageViewController *)self visibleViewController];
      [(NUPageViewController *)self removeViewController:v9];
    }
    [(NUPageViewController *)self addViewController:v5 fromScroll:0];
    objc_storeStrong((id *)&self->_visibleViewController, a3);
    [(NUPageViewController *)self reindexViewControllers];
    uint64_t v10 = [(NUPageViewController *)self replayViewTransitions];

    if (v10)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      double v11 = [(NUPageViewController *)self replayViewTransitions];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v15++) + 16))();
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      [(NUPageViewController *)self setReplayViewTransitions:0];
    }
    [(NUPageViewController *)self updateContentOffset];
    double v16 = [(NUPageViewController *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      double v18 = [(NUPageViewController *)self delegate];
      [v18 pageViewController:self didChangeVisibleViewControllerFromViewController:v7 direction:0];
    }
  }
}

- (CGSize)pageSize
{
  BOOL v3 = [(NUPageViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([(NUPageViewController *)self isTransitioning])
  {
    [(NUPageViewController *)self transitioningSize];
  }
  else
  {
    double v8 = v5;
    double v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPagingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUPageViewController *)self scrollView];
  [v4 setScrollEnabled:v3];
}

- (BOOL)pagingEnabled
{
  v2 = [(NUPageViewController *)self scrollView];
  char v3 = [v2 isScrollEnabled];

  return v3;
}

- (void)updateScrollView
{
  [(NUPageViewController *)self updateContentSize];

  [(NUPageViewController *)self updateContentOffset];
}

- (void)updateContentSize
{
  char v3 = [(NUPageViewController *)self nextViewController];

  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  double v5 = [(NUPageViewController *)self previousViewController];

  if (v5) {
    unint64_t v6 = v4 + 1;
  }
  else {
    unint64_t v6 = v4;
  }
  [(NUPageViewController *)self pageSize];
  double v8 = (double)(4 * v6) + v7 * (double)v6;
  [(NUPageViewController *)self pageSize];
  double v10 = v9;
  [(NUPageViewController *)self setCancelScrollViewDidScroll:1];
  double v11 = [(NUPageViewController *)self scrollView];
  objc_msgSend(v11, "setContentSize:", v8, v10);

  [(NUPageViewController *)self setCancelScrollViewDidScroll:0];
}

- (void)updateContentOffset
{
  char v3 = [(NUPageViewController *)self visibleViewController];
  uint64_t v4 = [v3 view];
  [v4 center];
  double v6 = v5;
  double v7 = [(NUPageViewController *)self visibleViewController];
  double v8 = [v7 view];
  [v8 bounds];
  double v9 = v6 + CGRectGetWidth(v12) * -0.5 + -2.0;

  [(NUPageViewController *)self setCancelScrollViewDidScroll:1];
  double v10 = [(NUPageViewController *)self scrollView];
  objc_msgSend(v10, "setContentOffset:", v9, 0.0);

  [(NUPageViewController *)self setCancelScrollViewDidScroll:0];
}

- (void)setPossibleNextViewController:(id)a3
{
  p_possibleNextViewController = &self->_possibleNextViewController;
  if (self->_possibleNextViewController != a3)
  {
    if ([(UIViewController *)*p_possibleNextViewController isViewLoaded])
    {
      double v5 = [(UIViewController *)*p_possibleNextViewController view];
      [v5 setUserInteractionEnabled:1];
    }
    objc_storeStrong((id *)p_possibleNextViewController, a3);
  }

  MEMORY[0x270F9A758]();
}

- (CGPoint)centerForIndex:(unint64_t)a3
{
  [(NUPageViewController *)self pageSize];
  double v6 = (double)(4 * a3) + v5 * ((double)a3 + 0.5) + 2.0;
  [(NUPageViewController *)self pageSize];
  double v8 = v7 * 0.5;
  double v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)repositionPages
{
  char v3 = [(NUPageViewController *)self nextViewController];
  [(NUPageViewController *)self updatePositionForViewController:v3];

  uint64_t v4 = [(NUPageViewController *)self visibleViewController];
  [(NUPageViewController *)self updatePositionForViewController:v4];

  id v5 = [(NUPageViewController *)self previousViewController];
  [(NUPageViewController *)self updatePositionForViewController:v5];
}

- (void)managePreviousAndNextViewController
{
  char v3 = [(NUPageViewController *)self managedForViewController];
  uint64_t v4 = [(NUPageViewController *)self visibleViewController];

  if (v3 != v4)
  {
    id v5 = [(NUPageViewController *)self previousViewController];

    if (!v5)
    {
      double v6 = [(NUPageViewController *)self dataSource];
      double v7 = [(NUPageViewController *)self visibleViewController];
      double v8 = [v6 pageViewController:self viewControllerBeforeViewController:v7];
      [(NUPageViewController *)self setPreviousViewController:v8];
    }
    double v9 = [(NUPageViewController *)self previousViewController];

    if (v9)
    {
      double v10 = [(NUPageViewController *)self view];
      [v10 bounds];
      double Width = CGRectGetWidth(v32);
      CGRect v12 = [(NUPageViewController *)self view];
      [v12 bounds];
      double Height = CGRectGetHeight(v33);
      uint64_t v14 = [(NUPageViewController *)self previousViewController];
      uint64_t v15 = [v14 view];
      objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

      double v16 = [(NUPageViewController *)self previousViewController];
      [(NUPageViewController *)self updatePositionForViewController:v16];
    }
    char v17 = [(NUPageViewController *)self nextViewController];

    if (!v17)
    {
      double v18 = [(NUPageViewController *)self dataSource];
      long long v19 = [(NUPageViewController *)self visibleViewController];
      long long v20 = [v18 pageViewController:self viewControllerAfterViewController:v19];
      [(NUPageViewController *)self setNextViewController:v20];
    }
    long long v21 = [(NUPageViewController *)self nextViewController];

    if (v21)
    {
      long long v22 = [(NUPageViewController *)self view];
      [v22 bounds];
      double v23 = CGRectGetWidth(v34);
      uint64_t v24 = [(NUPageViewController *)self view];
      [v24 bounds];
      double v25 = CGRectGetHeight(v35);
      v26 = [(NUPageViewController *)self nextViewController];
      id v27 = [v26 view];
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, v23, v25);

      v28 = [(NUPageViewController *)self nextViewController];
      [(NUPageViewController *)self updatePositionForViewController:v28];
    }
    objc_super v29 = [(NUPageViewController *)self visibleViewController];
    [(NUPageViewController *)self updatePositionForViewController:v29];

    [(NUPageViewController *)self updateContentSize];
    id v30 = [(NUPageViewController *)self visibleViewController];
    [(NUPageViewController *)self setManagedForViewController:v30];
  }
}

- (void)updatePositionForViewController:(id)a3
{
  id v13 = a3;
  id v4 = [(NUPageViewController *)self visibleViewController];

  id v5 = [(NUPageViewController *)self previousViewController];
  if (v4 == v13)
  {
    uint64_t v7 = v5 != 0;
  }
  else
  {

    if (v5 == v13
      || ([(NUPageViewController *)self nextViewController],
          id v6 = (id)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 != v13))
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
    id v5 = [(NUPageViewController *)self previousViewController];
    if (v5) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }

LABEL_10:
  [(NUPageViewController *)self centerForIndex:v7];
  double v9 = v8;
  double v11 = v10;
  CGRect v12 = [v13 view];
  objc_msgSend(v12, "setCenter:", v9, v11);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)removeViewController:(id)a3
{
  id v9 = a3;
  id v4 = [(NUPageViewController *)self appearingViewController];

  if (v4 == v9)
  {
    [v9 beginAppearanceTransition:0 animated:0];
    [(NUPageViewController *)self setAppearingViewController:0];
  }
  [v9 endAppearanceTransition];
  [v9 willMoveToParentViewController:0];
  id v5 = [v9 view];
  [v5 removeFromSuperview];

  [v9 removeFromParentViewController];
  id v6 = [(NUPageViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(NUPageViewController *)self delegate];
    [v8 pageViewController:self didHideViewController:v9];
  }
}

- (void)addViewController:(id)a3 fromScroll:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  id v6 = [(NUPageViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(NUPageViewController *)self delegate];
    [v8 pageViewController:self willShowViewController:v18 fromScroll:v4];
  }
  [(NUPageViewController *)self addChildViewController:v18];
  [(NUPageViewController *)self setAppearingViewController:v18];
  id v9 = [(NUPageViewController *)self visibleViewController];
  [v9 beginAppearanceTransition:0 animated:0];

  double v10 = [(NUPageViewController *)self visibleViewController];
  [(NUPageViewController *)self setDisappearingViewController:v10];

  double v11 = [(NUPageViewController *)self view];
  [v11 bounds];
  double Width = CGRectGetWidth(v20);
  id v13 = [(NUPageViewController *)self view];
  [v13 bounds];
  double Height = CGRectGetHeight(v21);
  uint64_t v15 = [v18 view];
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

  double v16 = [(NUPageViewController *)self scrollView];
  char v17 = [v18 view];
  [v16 addSubview:v17];

  [v18 didMoveToParentViewController:self];
}

- (void)reindexViewControllers
{
  [(NUPageViewController *)self setNextViewController:0];
  [(NUPageViewController *)self setPreviousViewController:0];
  [(NUPageViewController *)self setManagedForViewController:0];

  [(NUPageViewController *)self managePreviousAndNextViewController];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  BOOL v4 = [(NUPageViewController *)self visibleViewController];
  [(NUPageViewController *)self setOriginalVisibleViewController:v4];

  id v5 = [(NUPageViewController *)self originalVisibleViewController];
  id v6 = [v5 view];
  [v6 setUserInteractionEnabled:0];

  [(NUPageViewController *)self handleScrollStart];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(NUPageViewController *)self handleScrollEnd];
  }
}

- (void)handleScrollStart
{
  if (![(NUPageViewController *)self scrollViewStartedScrolling])
  {
    char v3 = [(NUPageViewController *)self idleDispatchGroup];
    dispatch_group_enter(v3);

    self->_scrollViewStartedScrolling = 1;
  }
}

- (void)handleScrollEnd
{
  if ([(NUPageViewController *)self scrollViewStartedScrolling])
  {
    char v3 = [(NUPageViewController *)self idleDispatchGroup];
    dispatch_group_leave(v3);

    self->_scrollViewStartedScrolling = 0;
  }

  [(NUPageViewController *)self callLastViewAppearanceMethods];
}

- (void)callLastViewAppearanceMethods
{
  char v3 = [(NUPageViewController *)self originalVisibleViewController];
  BOOL v4 = [v3 view];
  [v4 setUserInteractionEnabled:1];

  if (![(NUPageViewController *)self scrollViewStartedScrolling])
  {
    id v5 = [(NUPageViewController *)self visibleViewController];
    id v6 = [(NUPageViewController *)self disappearingViewController];

    if (v5 == v6)
    {
      char v7 = [(NUPageViewController *)self disappearingViewController];
      [v7 beginAppearanceTransition:1 animated:0];

      double v8 = [(NUPageViewController *)self disappearingViewController];
      [v8 endAppearanceTransition];
    }
    id v9 = [(NUPageViewController *)self visibleViewController];
    double v10 = [(NUPageViewController *)self appearingViewController];

    if (v9 != v10)
    {
      double v11 = [(NUPageViewController *)self appearingViewController];
      [v11 beginAppearanceTransition:0 animated:0];

      CGRect v12 = [(NUPageViewController *)self appearingViewController];
      [v12 endAppearanceTransition];
    }
    id v13 = [(NUPageViewController *)self visibleViewController];
    uint64_t v14 = [(NUPageViewController *)self appearingViewController];

    if (v13 == v14)
    {
      uint64_t v15 = [(NUPageViewController *)self appearingViewController];
      [v15 endAppearanceTransition];
    }
    [(NUPageViewController *)self setAppearingViewController:0];
    [(NUPageViewController *)self setDisappearingViewController:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v83 = a3;
  if (![(NUPageViewController *)self cancelScrollViewDidScroll]
    && ![(NUPageViewController *)self _shouldIgnoreDidScrollWithScrollView:v83])
  {
    [v83 contentOffset];
    double v5 = v4;
    [v83 contentOffset];
    double v7 = v6;
    double v8 = [(NUPageViewController *)self visibleViewController];
    id v9 = [v8 view];
    [v9 center];
    double v11 = v10;
    [v83 bounds];
    double v13 = v7 - (v11 + v12 * -0.5);

    if (v13 >= 0.0)
    {
      if (v13 <= 0.0)
      {
        uint64_t v15 = 0;
        goto LABEL_9;
      }
      uint64_t v14 = [(NUPageViewController *)self nextViewController];
    }
    else
    {
      uint64_t v14 = [(NUPageViewController *)self previousViewController];
    }
    uint64_t v15 = (void *)v14;
LABEL_9:
    double v16 = [(NUPageViewController *)self possibleNextViewController];

    if (!v16 && v15)
    {
      [(NUPageViewController *)self setPossibleNextViewController:v15];
      [(NUPageViewController *)self addViewController:v15 fromScroll:1];
LABEL_15:
      CGRect v20 = [(NUPageViewController *)self possibleNextViewController];
      [v20 beginAppearanceTransition:1 animated:0];

      goto LABEL_16;
    }
    char v17 = [(NUPageViewController *)self possibleNextViewController];

    if (v15)
    {
      if (v17 != v15)
      {
        id v18 = [(NUPageViewController *)self possibleNextViewController];
        [(NUPageViewController *)self removeViewController:v18];

        [(NUPageViewController *)self setPossibleNextViewController:v15];
        long long v19 = [(NUPageViewController *)self possibleNextViewController];
        [(NUPageViewController *)self addViewController:v19 fromScroll:1];

        goto LABEL_15;
      }
    }
    else if (v17)
    {
      v82 = [(NUPageViewController *)self possibleNextViewController];
      [(NUPageViewController *)self removeViewController:v82];

      [(NUPageViewController *)self setPossibleNextViewController:0];
    }
LABEL_16:
    CGRect v21 = [(NUPageViewController *)self possibleNextViewController];
    uint64_t v22 = [v21 view];
    [(id)v22 setUserInteractionEnabled:0];

    double v23 = [(NUPageViewController *)self delegate];
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if (v22)
    {
      uint64_t v24 = [(NUPageViewController *)self visibleViewController];
      double v25 = [v24 view];
      [v25 frame];
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGRect v34 = [(NUPageViewController *)self view];
      [v34 bounds];
      CGFloat v36 = v35;
      v37 = [(NUPageViewController *)self view];
      [v37 bounds];
      v89.size.height = v38;
      v89.origin.y = 0.0;
      v85.origin.x = v27;
      v85.origin.y = v29;
      v85.size.double width = v31;
      v85.size.height = v33;
      v89.origin.x = v5;
      v89.size.double width = v36;
      CGRect v86 = CGRectIntersection(v85, v89);
      double width = v86.size.width;

      v40 = [(NUPageViewController *)self view];
      [v40 bounds];
      double v42 = width / v41;

      v43 = [(NUPageViewController *)self delegate];
      v44 = [(NUPageViewController *)self visibleViewController];
      [v43 pageViewController:self viewController:v44 changedVisibilityFactor:v42];

      v45 = [(NUPageViewController *)self possibleNextViewController];

      if (v45)
      {
        v46 = [(NUPageViewController *)self possibleNextViewController];
        v47 = [v46 view];
        [v47 frame];
        CGFloat v49 = v48;
        CGFloat v51 = v50;
        CGFloat v53 = v52;
        CGFloat v55 = v54;
        v56 = [(NUPageViewController *)self view];
        [v56 bounds];
        CGFloat v58 = v57;
        v59 = [(NUPageViewController *)self view];
        [v59 bounds];
        v90.size.height = v60;
        v90.origin.y = 0.0;
        v87.origin.x = v49;
        v87.origin.y = v51;
        v87.size.double width = v53;
        v87.size.height = v55;
        v90.origin.x = v5;
        v90.size.double width = v58;
        CGRect v88 = CGRectIntersection(v87, v90);
        double v61 = v88.size.width;

        v62 = [(NUPageViewController *)self view];
        [v62 bounds];
        double v64 = v61 / v63;

        v65 = [(NUPageViewController *)self delegate];
        v66 = [(NUPageViewController *)self possibleNextViewController];
        [v65 pageViewController:self viewController:v66 changedVisibilityFactor:v64];
      }
    }
    v67 = [(NUPageViewController *)self visibleViewController];
    v68 = [v67 view];
    [v68 center];
    double v70 = v69;
    v71 = [(NUPageViewController *)self scrollView];
    [v71 bounds];
    double v73 = v70 + v72 * -1.5;

    v74 = [(NUPageViewController *)self visibleViewController];
    v75 = [v74 view];
    [v75 center];
    double v77 = v76;
    v78 = [(NUPageViewController *)self scrollView];
    [v78 bounds];
    double v80 = v79;

    v81 = [(NUPageViewController *)self visibleViewController];
    if (v5 <= v73)
    {
      [(NUPageViewController *)self switchToPreviousViewController];
    }
    else
    {
      if (v5 < v77 + v80 * 0.5)
      {
LABEL_24:

        goto LABEL_25;
      }
      [(NUPageViewController *)self switchToNextViewController];
    }
    [(NUPageViewController *)self removeViewController:v81];
    [(NUPageViewController *)self setPossibleNextViewController:0];
    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)_shouldIgnoreDidScrollWithScrollView:(id)a3
{
  id v4 = a3;
  if ([v4 isDragging])
  {
    [(NUPageViewController *)self _assistiveTechnologyIsRunning];
    LOBYTE(v5) = 0;
  }
  else
  {
    char v6 = [v4 isDecelerating];
    BOOL v7 = [(NUPageViewController *)self _assistiveTechnologyIsRunning];
    LOBYTE(v5) = 0;
    if ((v6 & 1) == 0 && !v7) {
      BOOL v5 = ![(NUPageViewController *)self scrollViewStartedScrolling];
    }
  }

  return v5;
}

- (BOOL)_assistiveTechnologyIsRunning
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 1;
  }

  return UIAccessibilityIsSwitchControlRunning();
}

- (void)switchToNextViewController
{
  char v3 = [(NUPageViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;

  char v6 = [(NUPageViewController *)self nextViewController];

  if (!v6) {
    return;
  }
  BOOL v7 = [(NUPageViewController *)self nextViewController];
  id v37 = [(NUPageViewController *)self visibleViewController];
  [(NUPageViewController *)self setNextViewController:0];
  double v8 = [(NUPageViewController *)self visibleViewController];
  [(NUPageViewController *)self setPreviousViewController:v8];

  visibleViewController = self->_visibleViewController;
  self->_visibleViewController = v7;
  double v10 = v7;

  double v11 = [(NUPageViewController *)self visibleViewController];
  [(NUPageViewController *)self setOriginalVisibleViewController:v11];

  double v12 = [(NUPageViewController *)self originalVisibleViewController];
  uint64_t v13 = [v12 view];
  [(id)v13 setUserInteractionEnabled:0];

  uint64_t v14 = [(NUPageViewController *)self delegate];
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v15 = [(NUPageViewController *)self delegate];
    [v15 pageViewController:self didChangeVisibleViewControllerFromViewController:v37 direction:2];
  }
  [(NUPageViewController *)self managePreviousAndNextViewController];
  double v16 = [(NUPageViewController *)self scrollView];
  [v16 contentOffset];
  double v18 = v17;

  [(NUPageViewController *)self setCancelScrollViewDidScroll:1];
  long long v19 = [(NUPageViewController *)self nextViewController];

  if (!v19)
  {
    double v31 = v5 * 0.5;
    double v32 = v5 * 0.5 + v18;
    CGFloat v33 = [(NUPageViewController *)self previousViewController];

    CGRect v34 = [(NUPageViewController *)self scrollView];
    [v34 contentOffset];
    double v24 = v35;

    if (v33) {
      double v30 = v32 - v31;
    }
    else {
      double v30 = v32 - v5 - v31;
    }
    goto LABEL_11;
  }
  CGRect v20 = [(NUPageViewController *)self scrollView];
  [v20 contentOffset];
  double v22 = v21;
  double v24 = v23;

  double v25 = [(NUPageViewController *)self scrollView];
  [v25 bounds];
  double v27 = v26 + v26;

  if (v22 >= v27)
  {
    double v28 = [(NUPageViewController *)self scrollView];
    [v28 bounds];
    double v30 = v22 - v29;

LABEL_11:
    CGFloat v36 = [(NUPageViewController *)self scrollView];
    objc_msgSend(v36, "setContentOffset:", v30, v24);
  }
  [(NUPageViewController *)self setCancelScrollViewDidScroll:0];
}

- (BOOL)canSwitchToPreviousViewController
{
  v2 = [(NUPageViewController *)self previousViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canSwitchToNextViewController
{
  v2 = [(NUPageViewController *)self nextViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_keyboardSwitchGoingRight:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NUPageViewController *)self scrollViewStartedScrolling])
  {
    BOOL v5 = [(NUPageViewController *)self canSwitchToNextViewController];
    BOOL v6 = [(NUPageViewController *)self canSwitchToPreviousViewController];
    if (v3 ? v5 : v6)
    {
      double v8 = [(NUPageViewController *)self visibleViewController];
      [(NUPageViewController *)self setOriginalVisibleViewController:v8];

      id v19 = [(NUPageViewController *)self scrollView];
      [v19 bounds];
      double Width = CGRectGetWidth(v21);
      if (v3) {
        double v10 = Width;
      }
      else {
        double v10 = -Width;
      }
      [v19 contentOffset];
      double v12 = fmax(v10 + v11, 0.0);
      [v19 contentSize];
      double v14 = v13 - Width;
      if (v12 >= v14) {
        double v15 = v14;
      }
      else {
        double v15 = v12;
      }
      [v19 contentOffset];
      double v17 = v16;
      [(NUPageViewController *)self handleScrollStart];
      double v18 = [(NUPageViewController *)self scrollView];
      objc_msgSend(v18, "setContentOffset:animated:", 1, v15, v17);
    }
  }
}

- (void)keyboardOrActionSwitchToNextViewController
{
}

- (void)keyboardOrActionSwitchToPreviousViewController
{
}

- (void)switchToPreviousViewController
{
  BOOL v3 = [(NUPageViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;

  BOOL v6 = [(NUPageViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7;

  id v9 = [(NUPageViewController *)self previousViewController];

  if (v9)
  {
    double v10 = [(NUPageViewController *)self previousViewController];
    id v29 = [(NUPageViewController *)self visibleViewController];
    [(NUPageViewController *)self setPreviousViewController:0];
    double v11 = [(NUPageViewController *)self visibleViewController];
    [(NUPageViewController *)self setNextViewController:v11];

    visibleViewController = self->_visibleViewController;
    self->_visibleViewController = v10;
    double v13 = v10;

    double v14 = [(NUPageViewController *)self visibleViewController];
    [(NUPageViewController *)self setOriginalVisibleViewController:v14];

    double v15 = [(NUPageViewController *)self originalVisibleViewController];
    uint64_t v16 = [v15 view];
    [(id)v16 setUserInteractionEnabled:0];

    double v17 = [(NUPageViewController *)self delegate];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      double v18 = [(NUPageViewController *)self delegate];
      [v18 pageViewController:self didChangeVisibleViewControllerFromViewController:v29 direction:1];
    }
    [(NUPageViewController *)self managePreviousAndNextViewController];
    [(NUPageViewController *)self setCancelScrollViewDidScroll:1];
    id v19 = [(NUPageViewController *)self previousViewController];

    CGRect v20 = [(NUPageViewController *)self scrollView];
    [v20 contentOffset];
    double v23 = v22;
    if (v19)
    {
      double v24 = v21;

      double v25 = [(NUPageViewController *)self scrollView];
      [v25 bounds];
      double v27 = v24 + v26;
    }
    else
    {

      double v27 = v5 * 0.5 + v8 - v5 * 0.5;
    }
    double v28 = [(NUPageViewController *)self scrollView];
    objc_msgSend(v28, "setContentOffset:", v27, v23);

    [(NUPageViewController *)self setCancelScrollViewDidScroll:0];
  }
}

- (void)transitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v6 = [(NUPageViewController *)self scrollView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(NUPageViewController *)self scrollView];
  objc_msgSend(v11, "setBounds:", v8, v10, width + 4.0, height);

  double v12 = [(NUPageViewController *)self childViewControllers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v14 = [(NUPageViewController *)self childViewControllers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          CGRect v20 = [v19 view];
          [v20 bounds];
          double v22 = v21;
          double v24 = v23;

          double v25 = [v19 view];
          objc_msgSend(v25, "setBounds:", v22, v24, width, height);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    [(NUPageViewController *)self repositionPages];
    [(NUPageViewController *)self updateContentSize];
    [(NUPageViewController *)self updateContentOffset];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v21.receiver = self;
  v21.super_class = (Class)NUPageViewController;
  id v7 = a4;
  -[NUPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(NUPageViewController *)self scrollView];
  if ([v8 isDecelerating])
  {

LABEL_4:
    double v11 = [(NUPageViewController *)self visibleViewController];
    double v12 = [v11 view];
    [v12 center];
    double v14 = v13;
    uint64_t v15 = [(NUPageViewController *)self visibleViewController];
    uint64_t v16 = [v15 view];
    [v16 bounds];
    double v17 = v14 + CGRectGetWidth(v22) * -0.5 + -2.0;

    double v18 = [(NUPageViewController *)self scrollView];
    objc_msgSend(v18, "setContentOffset:animated:", 0, v17, 0.0);

    goto LABEL_5;
  }
  double v9 = [(NUPageViewController *)self scrollView];
  int v10 = [v9 isDragging];

  if (v10) {
    goto LABEL_4;
  }
LABEL_5:
  self->_isTransitioning = 1;
  self->_transitioningSize.double width = width;
  self->_transitioningSize.double height = height;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__NUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v20[3] = &unk_2645FEFF0;
  v20[4] = self;
  *(double *)&v20[5] = width;
  *(double *)&v20[6] = height;
  id v19 = (void *)MEMORY[0x223C968A0](v20);
  [v7 animateAlongsideTransition:v19 completion:0];
}

uint64_t __75__NUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "transitionToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 977) = 0;
  return result;
}

- (NUPageViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (NUPageViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NUPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)visibleViewController
{
  return self->_visibleViewController;
}

- (NUPageViewControllerScrollView)scrollView
{
  return self->_scrollView;
}

- (OS_dispatch_group)idleDispatchGroup
{
  return self->_idleDispatchGroup;
}

- (UIViewController)managedForViewController
{
  return self->_managedForViewController;
}

- (void)setManagedForViewController:(id)a3
{
}

- (UIViewController)previousViewController
{
  return self->_previousViewController;
}

- (void)setPreviousViewController:(id)a3
{
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
}

- (UIViewController)possibleNextViewController
{
  return self->_possibleNextViewController;
}

- (UIViewController)originalVisibleViewController
{
  return self->_originalVisibleViewController;
}

- (void)setOriginalVisibleViewController:(id)a3
{
}

- (UIViewController)appearingViewController
{
  return self->_appearingViewController;
}

- (void)setAppearingViewController:(id)a3
{
}

- (UIViewController)disappearingViewController
{
  return self->_disappearingViewController;
}

- (void)setDisappearingViewController:(id)a3
{
}

- (BOOL)cancelScrollViewDidScroll
{
  return self->_cancelScrollViewDidScroll;
}

- (void)setCancelScrollViewDidScroll:(BOOL)a3
{
  self->_cancelScrollViewDidScroll = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (CGSize)transitioningSize
{
  double width = self->_transitioningSize.width;
  double height = self->_transitioningSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)scrollViewStartedScrolling
{
  return self->_scrollViewStartedScrolling;
}

- (NSMutableArray)replayViewTransitions
{
  return self->_replayViewTransitions;
}

- (void)setReplayViewTransitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayViewTransitions, 0);
  objc_storeStrong((id *)&self->_disappearingViewController, 0);
  objc_storeStrong((id *)&self->_appearingViewController, 0);
  objc_storeStrong((id *)&self->_originalVisibleViewController, 0);
  objc_storeStrong((id *)&self->_possibleNextViewController, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_previousViewController, 0);
  objc_storeStrong((id *)&self->_managedForViewController, 0);
  objc_storeStrong((id *)&self->_idleDispatchGroup, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_visibleViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end