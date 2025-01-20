@interface TUPageViewController
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
- (CGRect)calculateScrollViewFrameFromViewBounds:(CGRect)a3;
- (CGSize)pageSize;
- (CGSize)transitioningSize;
- (NSMutableArray)replayViewTransitions;
- (OS_dispatch_group)idleDispatchGroup;
- (TUPageViewController)initWithCoder:(id)a3;
- (TUPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TUPageViewControllerDataSource)dataSource;
- (TUPageViewControllerDelegate)delegate;
- (TUPageViewControllerScrollView)scrollView;
- (UIViewController)appearingViewController;
- (UIViewController)disappearingViewController;
- (UIViewController)managedForViewController;
- (UIViewController)nextViewController;
- (UIViewController)originalVisibleViewController;
- (UIViewController)previousViewController;
- (UIViewController)secondaryVisibleViewController;
- (UIViewController)visibleViewController;
- (double)pageGutter;
- (void)_keyboardSwitchGoingRight:(BOOL)a3;
- (void)accessibilityHandleRequestToGoBackForPageViewControllerScrollView:(id)a3;
- (void)accessibilityHandleRequestToGoForewardForPageViewControllerScrollView:(id)a3;
- (void)addViewController:(id)a3 fromScroll:(BOOL)a4;
- (void)callLastViewAppearanceMethods;
- (void)commonInit;
- (void)didReceiveBlueprintDidBeginItemDraggingEvent;
- (void)didReceiveBlueprintDidEndItemDraggingEvent;
- (void)handleScrollEnd;
- (void)handleScrollStart;
- (void)keyboardOrActionSwitchToNextViewController;
- (void)keyboardOrActionSwitchToPreviousViewController;
- (void)managePreviousAndNextViewController;
- (void)performWhenIdle:(id)a3;
- (void)reindexNextViewControllers;
- (void)reindexPreviousViewControllers;
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
- (void)setPageGutter:(double)a3;
- (void)setPagingEnabled:(BOOL)a3;
- (void)setPreviousViewController:(id)a3;
- (void)setReplayViewTransitions:(id)a3;
- (void)setSecondaryVisibleViewController:(id)a3;
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
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TUPageViewController

- (TUPageViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUPageViewController;
  v3 = [(TUPageViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TUPageViewController *)v3 commonInit];
  }
  return v4;
}

- (TUPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TUPageViewController;
  v4 = [(TUPageViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(TUPageViewController *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  v3 = objc_alloc_init(TUPageViewControllerScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(TUPageViewControllerScrollView *)self->_scrollView setAllowsKeyboardScrolling:0];
  [(TUPageViewControllerScrollView *)self->_scrollView _setContentInsetAdjustmentBehavior:2];
  [(TUPageViewControllerScrollView *)self->_scrollView setAutoresizesSubviews:0];
  [(TUPageViewControllerScrollView *)self->_scrollView setPagingEnabled:1];
  [(TUPageViewControllerScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
  [(TUPageViewControllerScrollView *)self->_scrollView setAlwaysBounceVertical:0];
  [(TUPageViewControllerScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(TUPageViewControllerScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(TUPageViewControllerScrollView *)self->_scrollView setCanCancelContentTouches:1];
  [(TUPageViewControllerScrollView *)self->_scrollView setDelaysContentTouches:0];
  [(TUPageViewControllerScrollView *)self->_scrollView setDelegate:self];
  [(TUPageViewControllerScrollView *)self->_scrollView setAccessibilityDelegate:self];
  [(TUPageViewControllerScrollView *)self->_scrollView setDirectionalLockEnabled:1];
  self->_pageGutter = 4.0;
  v5 = (OS_dispatch_group *)dispatch_group_create();
  idleDispatchGroup = self->_idleDispatchGroup;
  self->_idleDispatchGroup = v5;

  objc_super v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  replayViewTransitions = self->_replayViewTransitions;
  self->_replayViewTransitions = v7;

  v9 = self->_scrollView;
  [(TUPageViewControllerScrollView *)v9 setFocusEffect:0];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  [(TUPageViewController *)&v14 viewDidLoad];
  v3 = [(TUPageViewController *)self view];
  [v3 setPreservesSuperviewLayoutMargins:1];

  v4 = [(TUPageViewController *)self scrollView];
  [v4 setPreservesSuperviewLayoutMargins:1];

  v5 = [(TUPageViewController *)self scrollView];
  objc_super v6 = [(TUPageViewController *)self view];
  [v6 bounds];
  -[TUPageViewController calculateScrollViewFrameFromViewBounds:](self, "calculateScrollViewFrameFromViewBounds:");
  objc_msgSend(v5, "setFrame:");

  objc_super v7 = [(TUPageViewController *)self view];
  v8 = [(TUPageViewController *)self scrollView];
  [v7 addSubview:v8];

  v9 = [(TUPageViewController *)self view];
  [v9 bounds];
  -[TUPageViewController transitionToSize:](self, "transitionToSize:", v10, v11);

  [(TUPageViewController *)self updateScrollView];
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel_didReceiveBlueprintDidBeginItemDraggingEvent name:@"TUBlueprintDidBeginItemDraggingNotification" object:0];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel_didReceiveBlueprintDidEndItemDraggingEvent name:@"TUBlueprintDidEndItemDraggingNotification" object:0];
}

- (void)viewWillLayoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)TUPageViewController;
  [(TUPageViewController *)&v25 viewWillLayoutSubviews];
  v3 = [(TUPageViewController *)self scrollView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(TUPageViewController *)self pageGutter];
  CGFloat v13 = v12 * 0.5;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  CGRect v27 = CGRectInset(v26, v13, 0.0);
  double width = v27.size.width;
  double height = v27.size.height;

  v16 = [(TUPageViewController *)self view];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;

  if (width != v18 || height != v20)
  {
    v22 = [(TUPageViewController *)self view];
    [v22 bounds];
    -[TUPageViewController transitionToSize:](self, "transitionToSize:", v23, v24);

    [(TUPageViewController *)self managePreviousAndNextViewController];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewWillAppear:](&v29, sel_viewWillAppear_);
  CGFloat v5 = [(TUPageViewController *)self scrollView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(TUPageViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    v16 = [(TUPageViewController *)self view];
    [v16 bounds];
    -[TUPageViewController transitionToSize:](self, "transitionToSize:", v17, v18);
  }
  double v19 = [(TUPageViewController *)self visibleViewController];

  if (v19)
  {
    double v20 = [(TUPageViewController *)self visibleViewController];
    [v20 beginAppearanceTransition:1 animated:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    v21 = [(TUPageViewController *)self replayViewTransitions];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    objc_super v25 = __39__TUPageViewController_viewWillAppear___block_invoke;
    CGRect v26 = &unk_1E6136778;
    objc_copyWeak(&v27, &location);
    v22 = _Block_copy(&v23);
    objc_msgSend(v21, "addObject:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __39__TUPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 beginAppearanceTransition:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  [(TUPageViewController *)&v14 viewDidAppear:a3];
  double v4 = [(TUPageViewController *)self visibleViewController];

  if (v4)
  {
    CGFloat v5 = [(TUPageViewController *)self visibleViewController];
    [v5 endAppearanceTransition];
  }
  else
  {
    objc_initWeak(&location, self);
    double v6 = [(TUPageViewController *)self replayViewTransitions];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __38__TUPageViewController_viewDidAppear___block_invoke;
    double v11 = &unk_1E6136778;
    objc_copyWeak(&v12, &location);
    double v7 = _Block_copy(&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __38__TUPageViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  CGFloat v5 = [(TUPageViewController *)self visibleViewController];

  if (v5)
  {
    double v6 = [(TUPageViewController *)self visibleViewController];
    [v6 beginAppearanceTransition:0 animated:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    double v7 = [(TUPageViewController *)self replayViewTransitions];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __42__TUPageViewController_viewWillDisappear___block_invoke;
    id v12 = &unk_1E6136778;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = _Block_copy(&v9);
    objc_msgSend(v7, "addObject:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __42__TUPageViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 beginAppearanceTransition:0 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  [(TUPageViewController *)&v14 viewDidDisappear:a3];
  double v4 = [(TUPageViewController *)self visibleViewController];

  if (v4)
  {
    CGFloat v5 = [(TUPageViewController *)self visibleViewController];
    [v5 endAppearanceTransition];
  }
  else
  {
    objc_initWeak(&location, self);
    double v6 = [(TUPageViewController *)self replayViewTransitions];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __41__TUPageViewController_viewDidDisappear___block_invoke;
    double v11 = &unk_1E6136778;
    objc_copyWeak(&v12, &location);
    double v7 = _Block_copy(&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __41__TUPageViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained visibleViewController];
  [v1 endAppearanceTransition];
}

- (void)viewLayoutMarginsDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  [(TUPageViewController *)&v14 viewLayoutMarginsDidChange];
  BOOL v3 = [(TUPageViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(TUPageViewController *)self visibleViewController];
  id v13 = [v12 view];
  objc_msgSend(v13, "setLayoutMargins:", v5, v7, v9, v11);
}

- (void)performWhenIdle:(id)a3
{
  id v4 = a3;
  double v5 = [(TUPageViewController *)self idleDispatchGroup];
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v4);
}

- (void)setVisibleViewController:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(TUPageViewController *)self visibleViewController];

  if (v6 != v5)
  {
    double v7 = [(TUPageViewController *)self visibleViewController];
    double v8 = [(TUPageViewController *)self visibleViewController];

    if (v8)
    {
      double v9 = [(TUPageViewController *)self visibleViewController];
      [(TUPageViewController *)self removeViewController:v9];
    }
    [(TUPageViewController *)self addViewController:v5 fromScroll:0];
    objc_storeStrong((id *)&self->_visibleViewController, a3);
    [(TUPageViewController *)self reindexViewControllers];
    double v10 = [(TUPageViewController *)self replayViewTransitions];

    if (v10)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v11 = [(TUPageViewController *)self replayViewTransitions];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v15++) + 16))();
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      [(TUPageViewController *)self setReplayViewTransitions:0];
    }
    else if ([(TUPageViewController *)self _appearState] == 2 && v7)
    {
      v16 = [(TUPageViewController *)self visibleViewController];
      [v16 beginAppearanceTransition:1 animated:0];

      double v17 = [(TUPageViewController *)self visibleViewController];
      [v17 endAppearanceTransition];
    }
    [(TUPageViewController *)self updateContentOffset];
    double v18 = [(TUPageViewController *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      double v20 = [(TUPageViewController *)self delegate];
      [v20 pageViewController:self didChangeVisibleViewControllerFromViewController:v7 direction:0];
    }
  }
}

- (void)didReceiveBlueprintDidBeginItemDraggingEvent
{
}

- (void)didReceiveBlueprintDidEndItemDraggingEvent
{
}

- (void)setPageGutter:(double)a3
{
  self->_pageGutter = a3;
  id v4 = [(TUPageViewController *)self scrollView];
  id v5 = [(TUPageViewController *)self view];
  [v5 bounds];
  -[TUPageViewController calculateScrollViewFrameFromViewBounds:](self, "calculateScrollViewFrameFromViewBounds:");
  objc_msgSend(v4, "setFrame:");

  [(TUPageViewController *)self updateScrollView];
}

- (CGSize)pageSize
{
  BOOL v3 = [(TUPageViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([(TUPageViewController *)self isTransitioning])
  {
    [(TUPageViewController *)self transitioningSize];
  }
  else
  {
    double v8 = v5;
    double v9 = v7;
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)setPagingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TUPageViewController *)self scrollView];
  [v4 setScrollEnabled:v3];
}

- (BOOL)pagingEnabled
{
  v2 = [(TUPageViewController *)self scrollView];
  char v3 = [v2 isScrollEnabled];

  return v3;
}

- (CGRect)calculateScrollViewFrameFromViewBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TUPageViewController *)self pageGutter];
  double v8 = v7 * -0.5;
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;
  return CGRectInset(*(CGRect *)&v9, v8, 0.0);
}

- (void)updateScrollView
{
  [(TUPageViewController *)self updateContentSize];
  [(TUPageViewController *)self updateContentOffset];
}

- (void)updateContentSize
{
  char v3 = [(TUPageViewController *)self nextViewController];

  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  double v5 = [(TUPageViewController *)self previousViewController];

  if (v5) {
    unint64_t v6 = v4 + 1;
  }
  else {
    unint64_t v6 = v4;
  }
  [(TUPageViewController *)self pageSize];
  double v8 = v7;
  [(TUPageViewController *)self pageGutter];
  double v10 = v9 * (double)v6 + v8 * (double)v6;
  [(TUPageViewController *)self pageSize];
  double v12 = v11;
  [(TUPageViewController *)self setCancelScrollViewDidScroll:1];
  uint64_t v13 = [(TUPageViewController *)self scrollView];
  objc_msgSend(v13, "setContentSize:", v10, v12);

  [(TUPageViewController *)self setCancelScrollViewDidScroll:0];
}

- (void)updateContentOffset
{
  char v3 = [(TUPageViewController *)self visibleViewController];
  uint64_t v4 = [v3 view];
  [v4 center];
  double v6 = v5;
  double v7 = [(TUPageViewController *)self visibleViewController];
  double v8 = [v7 view];
  [v8 bounds];
  double v9 = v6 - CGRectGetWidth(v14) * 0.5;
  [(TUPageViewController *)self pageGutter];
  double v11 = v9 - v10 * 0.5;

  [(TUPageViewController *)self setCancelScrollViewDidScroll:1];
  double v12 = [(TUPageViewController *)self scrollView];
  objc_msgSend(v12, "setContentOffset:", v11, 0.0);

  [(TUPageViewController *)self setCancelScrollViewDidScroll:0];
}

- (void)setSecondaryVisibleViewController:(id)a3
{
  double v5 = (UIViewController *)a3;
  p_secondaryVisibleViewController = &self->_secondaryVisibleViewController;
  if (*p_secondaryVisibleViewController != v5)
  {
    double v8 = v5;
    if ([(UIViewController *)*p_secondaryVisibleViewController isViewLoaded])
    {
      double v7 = [(UIViewController *)*p_secondaryVisibleViewController view];
      [v7 setUserInteractionEnabled:1];
    }
    objc_storeStrong((id *)p_secondaryVisibleViewController, a3);
    double v5 = v8;
  }
}

- (CGPoint)centerForIndex:(unint64_t)a3
{
  [(TUPageViewController *)self pageSize];
  double v6 = v5;
  [(TUPageViewController *)self pageGutter];
  double v8 = v7 * (double)a3 + v6 * ((double)a3 + 0.5);
  [(TUPageViewController *)self pageGutter];
  double v10 = v8 + v9 * 0.5;
  [(TUPageViewController *)self pageSize];
  double v12 = v11 * 0.5;
  double v13 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v13;
  return result;
}

- (void)repositionPages
{
  char v3 = [(TUPageViewController *)self nextViewController];
  [(TUPageViewController *)self updatePositionForViewController:v3];

  uint64_t v4 = [(TUPageViewController *)self visibleViewController];
  [(TUPageViewController *)self updatePositionForViewController:v4];

  id v5 = [(TUPageViewController *)self previousViewController];
  [(TUPageViewController *)self updatePositionForViewController:v5];
}

- (void)managePreviousAndNextViewController
{
  char v3 = [(TUPageViewController *)self managedForViewController];
  uint64_t v4 = [(TUPageViewController *)self visibleViewController];

  if (v3 != v4)
  {
    id v5 = [(TUPageViewController *)self previousViewController];

    if (!v5)
    {
      double v6 = [(TUPageViewController *)self dataSource];
      double v7 = [(TUPageViewController *)self visibleViewController];
      double v8 = [v6 pageViewController:self viewControllerBeforeViewController:v7];
      [(TUPageViewController *)self setPreviousViewController:v8];
    }
    double v9 = [(TUPageViewController *)self previousViewController];

    if (v9)
    {
      double v10 = [(TUPageViewController *)self view];
      [v10 bounds];
      double Width = CGRectGetWidth(v32);
      double v12 = [(TUPageViewController *)self view];
      [v12 bounds];
      double Height = CGRectGetHeight(v33);
      CGRect v14 = [(TUPageViewController *)self previousViewController];
      uint64_t v15 = [v14 view];
      objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

      v16 = [(TUPageViewController *)self previousViewController];
      [(TUPageViewController *)self updatePositionForViewController:v16];
    }
    double v17 = [(TUPageViewController *)self nextViewController];

    if (!v17)
    {
      double v18 = [(TUPageViewController *)self dataSource];
      char v19 = [(TUPageViewController *)self visibleViewController];
      double v20 = [v18 pageViewController:self viewControllerAfterViewController:v19];
      [(TUPageViewController *)self setNextViewController:v20];
    }
    long long v21 = [(TUPageViewController *)self nextViewController];

    if (v21)
    {
      long long v22 = [(TUPageViewController *)self view];
      [v22 bounds];
      double v23 = CGRectGetWidth(v34);
      long long v24 = [(TUPageViewController *)self view];
      [v24 bounds];
      double v25 = CGRectGetHeight(v35);
      uint64_t v26 = [(TUPageViewController *)self nextViewController];
      id v27 = [v26 view];
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, v23, v25);

      v28 = [(TUPageViewController *)self nextViewController];
      [(TUPageViewController *)self updatePositionForViewController:v28];
    }
    objc_super v29 = [(TUPageViewController *)self visibleViewController];
    [(TUPageViewController *)self updatePositionForViewController:v29];

    [(TUPageViewController *)self updateContentSize];
    id v30 = [(TUPageViewController *)self visibleViewController];
    [(TUPageViewController *)self setManagedForViewController:v30];
  }
}

- (void)updatePositionForViewController:(id)a3
{
  id v13 = a3;
  id v4 = [(TUPageViewController *)self visibleViewController];

  id v5 = [(TUPageViewController *)self previousViewController];
  if (v4 == v13)
  {
    uint64_t v7 = v5 != 0;
  }
  else
  {

    if (v5 == v13
      || ([(TUPageViewController *)self nextViewController],
          id v6 = (id)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 != v13))
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
    id v5 = [(TUPageViewController *)self previousViewController];
    if (v5) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }

LABEL_10:
  [(TUPageViewController *)self centerForIndex:v7];
  double v9 = v8;
  double v11 = v10;
  double v12 = [v13 view];
  objc_msgSend(v12, "setCenter:", v9, v11);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)removeViewController:(id)a3
{
  id v9 = a3;
  id v4 = [(TUPageViewController *)self appearingViewController];

  if (v4 == v9)
  {
    [v9 beginAppearanceTransition:0 animated:0];
    [(TUPageViewController *)self setAppearingViewController:0];
  }
  [v9 endAppearanceTransition];
  [v9 willMoveToParentViewController:0];
  id v5 = [v9 view];
  [v5 removeFromSuperview];

  [v9 removeFromParentViewController];
  id v6 = [(TUPageViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(TUPageViewController *)self delegate];
    [v8 pageViewController:self didHideViewController:v9];
  }
}

- (void)addViewController:(id)a3 fromScroll:(BOOL)a4
{
  BOOL v4 = a4;
  id v29 = a3;
  id v6 = [(TUPageViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(TUPageViewController *)self delegate];
    id v9 = [(TUPageViewController *)self visibleViewController];
    [v8 pageViewController:self willShowViewController:v29 previousViewController:v9 fromScroll:v4];
  }
  [(TUPageViewController *)self addChildViewController:v29];
  [(TUPageViewController *)self setAppearingViewController:v29];
  double v10 = [(TUPageViewController *)self visibleViewController];
  [v10 beginAppearanceTransition:0 animated:0];

  double v11 = [(TUPageViewController *)self visibleViewController];
  [(TUPageViewController *)self setDisappearingViewController:v11];

  double v12 = [(TUPageViewController *)self view];
  [v12 bounds];
  double Width = CGRectGetWidth(v31);
  CGRect v14 = [(TUPageViewController *)self view];
  [v14 bounds];
  double Height = CGRectGetHeight(v32);
  v16 = [v29 view];
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, Width, Height);

  double v17 = [(TUPageViewController *)self view];
  [v17 layoutMargins];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  uint64_t v26 = [v29 view];
  objc_msgSend(v26, "setLayoutMargins:", v19, v21, v23, v25);

  id v27 = [(TUPageViewController *)self scrollView];
  v28 = [v29 view];
  [v27 addSubview:v28];

  [v29 didMoveToParentViewController:self];
}

- (void)reindexViewControllers
{
  [(TUPageViewController *)self setNextViewController:0];
  [(TUPageViewController *)self setPreviousViewController:0];
  [(TUPageViewController *)self setManagedForViewController:0];
  [(TUPageViewController *)self managePreviousAndNextViewController];
  [(TUPageViewController *)self updateContentOffset];
}

- (void)reindexPreviousViewControllers
{
  [(TUPageViewController *)self setPreviousViewController:0];
  [(TUPageViewController *)self setManagedForViewController:0];
  [(TUPageViewController *)self managePreviousAndNextViewController];
  [(TUPageViewController *)self updateContentOffset];
}

- (void)reindexNextViewControllers
{
  [(TUPageViewController *)self setNextViewController:0];
  [(TUPageViewController *)self setManagedForViewController:0];
  [(TUPageViewController *)self managePreviousAndNextViewController];
  [(TUPageViewController *)self updateContentOffset];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  BOOL v4 = [(TUPageViewController *)self visibleViewController];
  [(TUPageViewController *)self setOriginalVisibleViewController:v4];

  id v5 = [(TUPageViewController *)self originalVisibleViewController];
  id v6 = [v5 view];
  [v6 setUserInteractionEnabled:0];

  [(TUPageViewController *)self handleScrollStart];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(TUPageViewController *)self handleScrollEnd];
  }
}

- (void)handleScrollStart
{
  if (![(TUPageViewController *)self scrollViewStartedScrolling])
  {
    char v3 = [(TUPageViewController *)self idleDispatchGroup];
    dispatch_group_enter(v3);

    self->_scrollViewStartedScrolling = 1;
  }
}

- (void)handleScrollEnd
{
  if ([(TUPageViewController *)self scrollViewStartedScrolling])
  {
    char v3 = [(TUPageViewController *)self idleDispatchGroup];
    dispatch_group_leave(v3);

    self->_scrollViewStartedScrolling = 0;
  }
  [(TUPageViewController *)self callLastViewAppearanceMethods];
}

- (void)callLastViewAppearanceMethods
{
  char v3 = [(TUPageViewController *)self originalVisibleViewController];
  BOOL v4 = [v3 view];
  [v4 setUserInteractionEnabled:1];

  if (![(TUPageViewController *)self scrollViewStartedScrolling])
  {
    id v5 = [(TUPageViewController *)self visibleViewController];
    id v6 = [(TUPageViewController *)self disappearingViewController];

    if (v5 == v6)
    {
      char v7 = [(TUPageViewController *)self disappearingViewController];
      [v7 beginAppearanceTransition:1 animated:0];

      double v8 = [(TUPageViewController *)self disappearingViewController];
      [v8 endAppearanceTransition];
    }
    id v9 = [(TUPageViewController *)self visibleViewController];
    double v10 = [(TUPageViewController *)self appearingViewController];

    if (v9 != v10)
    {
      double v11 = [(TUPageViewController *)self appearingViewController];
      [v11 beginAppearanceTransition:0 animated:0];

      double v12 = [(TUPageViewController *)self appearingViewController];
      [v12 endAppearanceTransition];
    }
    id v13 = [(TUPageViewController *)self visibleViewController];
    CGRect v14 = [(TUPageViewController *)self appearingViewController];

    if (v13 == v14)
    {
      uint64_t v15 = [(TUPageViewController *)self appearingViewController];
      [v15 endAppearanceTransition];
    }
    [(TUPageViewController *)self setAppearingViewController:0];
    [(TUPageViewController *)self setDisappearingViewController:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v95 = a3;
  if (![(TUPageViewController *)self cancelScrollViewDidScroll]
    && ![(TUPageViewController *)self _shouldIgnoreDidScrollWithScrollView:v95])
  {
    [v95 contentOffset];
    double v5 = v4;
    [v95 contentOffset];
    double v7 = v6;
    double v8 = [(TUPageViewController *)self visibleViewController];
    id v9 = [v8 view];
    [v9 center];
    double v11 = v10;
    [v95 bounds];
    double v13 = v7 - (v11 + v12 * -0.5);

    if (v13 >= 0.0)
    {
      if (v13 <= 0.0)
      {
        uint64_t v15 = 0;
        goto LABEL_9;
      }
      uint64_t v14 = [(TUPageViewController *)self nextViewController];
    }
    else
    {
      uint64_t v14 = [(TUPageViewController *)self previousViewController];
    }
    uint64_t v15 = (void *)v14;
LABEL_9:
    v16 = [(TUPageViewController *)self secondaryVisibleViewController];

    if (!v16 && v15)
    {
      [(TUPageViewController *)self setSecondaryVisibleViewController:v15];
      [(TUPageViewController *)self addViewController:v15 fromScroll:1];
LABEL_15:
      double v20 = [(TUPageViewController *)self secondaryVisibleViewController];
      [v20 beginAppearanceTransition:1 animated:0];

      goto LABEL_16;
    }
    double v17 = [(TUPageViewController *)self secondaryVisibleViewController];

    if (v15)
    {
      if (v17 != v15)
      {
        double v18 = [(TUPageViewController *)self secondaryVisibleViewController];
        [(TUPageViewController *)self removeViewController:v18];

        [(TUPageViewController *)self setSecondaryVisibleViewController:v15];
        double v19 = [(TUPageViewController *)self secondaryVisibleViewController];
        [(TUPageViewController *)self addViewController:v19 fromScroll:1];

        goto LABEL_15;
      }
    }
    else if (v17)
    {
      v94 = [(TUPageViewController *)self secondaryVisibleViewController];
      [(TUPageViewController *)self removeViewController:v94];

      [(TUPageViewController *)self setSecondaryVisibleViewController:0];
    }
LABEL_16:
    double v21 = [(TUPageViewController *)self secondaryVisibleViewController];
    uint64_t v22 = [v21 view];
    [(id)v22 setUserInteractionEnabled:0];

    double v23 = [(TUPageViewController *)self delegate];
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if (v22)
    {
      double v24 = [(TUPageViewController *)self view];
      double v25 = [(TUPageViewController *)self visibleViewController];
      uint64_t v26 = [v25 view];
      [v26 bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      CGRect v35 = [(TUPageViewController *)self visibleViewController];
      v36 = [v35 view];
      objc_msgSend(v24, "convertRect:fromView:", v36, v28, v30, v32, v34);
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;

      v45 = [(TUPageViewController *)self view];
      [v45 bounds];
      CGFloat v47 = v46;
      v48 = [(TUPageViewController *)self view];
      [v48 bounds];
      v101.size.CGFloat height = v49;
      v101.origin.CGFloat x = 0.0;
      v101.origin.CGFloat y = 0.0;
      v97.origin.CGFloat x = v38;
      v97.origin.CGFloat y = v40;
      v97.size.double width = v42;
      v97.size.CGFloat height = v44;
      v101.size.double width = v47;
      CGRect v98 = CGRectIntersection(v97, v101);
      double width = v98.size.width;

      v51 = [(TUPageViewController *)self view];
      [v51 bounds];
      double v53 = width / v52;

      v54 = [(TUPageViewController *)self delegate];
      v55 = [(TUPageViewController *)self visibleViewController];
      uint64_t v56 = v13 <= 0.0 ? 1 : 2;
      [v54 pageViewController:self viewController:v55 changedVisibilityFactor:v56 scrollDirection:v53];

      v57 = [(TUPageViewController *)self secondaryVisibleViewController];

      if (v57)
      {
        v58 = [(TUPageViewController *)self secondaryVisibleViewController];
        v59 = [v58 view];
        [v59 frame];
        CGFloat v61 = v60;
        CGFloat v63 = v62;
        CGFloat v65 = v64;
        CGFloat v67 = v66;
        v68 = [(TUPageViewController *)self view];
        [v68 bounds];
        CGFloat v70 = v69;
        v71 = [(TUPageViewController *)self view];
        [v71 bounds];
        v102.size.CGFloat height = v72;
        v102.origin.CGFloat y = 0.0;
        v99.origin.CGFloat x = v61;
        v99.origin.CGFloat y = v63;
        v99.size.double width = v65;
        v99.size.CGFloat height = v67;
        v102.origin.CGFloat x = v5;
        v102.size.double width = v70;
        CGRect v100 = CGRectIntersection(v99, v102);
        double v73 = v100.size.width;

        v74 = [(TUPageViewController *)self view];
        [v74 bounds];
        double v76 = v73 / v75;

        v77 = [(TUPageViewController *)self delegate];
        v78 = [(TUPageViewController *)self secondaryVisibleViewController];
        [v77 pageViewController:self viewController:v78 changedVisibilityFactor:v56 scrollDirection:v76];
      }
    }
    v79 = [(TUPageViewController *)self visibleViewController];
    v80 = [v79 view];
    [v80 center];
    double v82 = v81;
    v83 = [(TUPageViewController *)self scrollView];
    [v83 bounds];
    double v85 = v82 + v84 * -1.5;

    v86 = [(TUPageViewController *)self visibleViewController];
    v87 = [v86 view];
    [v87 center];
    double v89 = v88;
    v90 = [(TUPageViewController *)self scrollView];
    [v90 bounds];
    double v92 = v91;

    v93 = [(TUPageViewController *)self visibleViewController];
    if (v5 <= v85)
    {
      [(TUPageViewController *)self switchToPreviousViewController];
    }
    else
    {
      if (v5 < v89 + v92 * 0.5)
      {
LABEL_27:

        goto LABEL_28;
      }
      [(TUPageViewController *)self switchToNextViewController];
    }
    [(TUPageViewController *)self removeViewController:v93];
    [(TUPageViewController *)self setSecondaryVisibleViewController:0];
    goto LABEL_27;
  }
LABEL_28:
}

- (BOOL)_shouldIgnoreDidScrollWithScrollView:(id)a3
{
  id v4 = a3;
  if ([v4 isDragging]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isDecelerating];
  }
  BOOL v6 = [(TUPageViewController *)self _assistiveTechnologyIsRunning];
  double v7 = [(TUPageViewController *)self visibleViewController];
  BOOL v8 = v7 == 0;

  if ((v5 & 1) == 0 && !v6 && ![(TUPageViewController *)self scrollViewStartedScrolling]) {
    BOOL v8 = 1;
  }

  return v8;
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
  char v3 = [(TUPageViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;

  BOOL v6 = [(TUPageViewController *)self nextViewController];

  if (!v6) {
    return;
  }
  double v7 = [(TUPageViewController *)self nextViewController];
  id v37 = [(TUPageViewController *)self visibleViewController];
  [(TUPageViewController *)self setNextViewController:0];
  BOOL v8 = [(TUPageViewController *)self visibleViewController];
  [(TUPageViewController *)self setPreviousViewController:v8];

  visibleViewController = self->_visibleViewController;
  self->_visibleViewController = v7;
  double v10 = v7;

  double v11 = [(TUPageViewController *)self visibleViewController];
  [(TUPageViewController *)self setOriginalVisibleViewController:v11];

  double v12 = [(TUPageViewController *)self originalVisibleViewController];
  uint64_t v13 = [v12 view];
  [(id)v13 setUserInteractionEnabled:0];

  uint64_t v14 = [(TUPageViewController *)self delegate];
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v15 = [(TUPageViewController *)self delegate];
    [v15 pageViewController:self didChangeVisibleViewControllerFromViewController:v37 direction:2];
  }
  [(TUPageViewController *)self managePreviousAndNextViewController];
  v16 = [(TUPageViewController *)self scrollView];
  [v16 contentOffset];
  double v18 = v17;

  [(TUPageViewController *)self setCancelScrollViewDidScroll:1];
  double v19 = [(TUPageViewController *)self nextViewController];

  if (!v19)
  {
    double v31 = v5 * 0.5;
    double v32 = v5 * 0.5 + v18;
    double v33 = [(TUPageViewController *)self previousViewController];

    double v34 = [(TUPageViewController *)self scrollView];
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
  double v20 = [(TUPageViewController *)self scrollView];
  [v20 contentOffset];
  double v22 = v21;
  double v24 = v23;

  double v25 = [(TUPageViewController *)self scrollView];
  [v25 bounds];
  double v27 = v26 + v26;

  if (v22 >= v27)
  {
    double v28 = [(TUPageViewController *)self scrollView];
    [v28 bounds];
    double v30 = v22 - v29;

LABEL_11:
    v36 = [(TUPageViewController *)self scrollView];
    objc_msgSend(v36, "setContentOffset:", v30, v24);
  }
  [(TUPageViewController *)self setCancelScrollViewDidScroll:0];
}

- (BOOL)canSwitchToPreviousViewController
{
  v2 = [(TUPageViewController *)self previousViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canSwitchToNextViewController
{
  v2 = [(TUPageViewController *)self nextViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_keyboardSwitchGoingRight:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(TUPageViewController *)self scrollViewStartedScrolling]
    && [(TUPageViewController *)self pagingEnabled])
  {
    BOOL v5 = [(TUPageViewController *)self canSwitchToNextViewController];
    BOOL v6 = [(TUPageViewController *)self canSwitchToPreviousViewController];
    if (v3 ? v5 : v6)
    {
      BOOL v8 = [(TUPageViewController *)self visibleViewController];
      [(TUPageViewController *)self setOriginalVisibleViewController:v8];

      id v19 = [(TUPageViewController *)self scrollView];
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
      [(TUPageViewController *)self handleScrollStart];
      double v18 = [(TUPageViewController *)self scrollView];
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
  BOOL v3 = [(TUPageViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;

  BOOL v6 = [(TUPageViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7;

  id v9 = [(TUPageViewController *)self previousViewController];

  if (v9)
  {
    double v10 = [(TUPageViewController *)self previousViewController];
    id v29 = [(TUPageViewController *)self visibleViewController];
    [(TUPageViewController *)self setPreviousViewController:0];
    double v11 = [(TUPageViewController *)self visibleViewController];
    [(TUPageViewController *)self setNextViewController:v11];

    visibleViewController = self->_visibleViewController;
    self->_visibleViewController = v10;
    double v13 = v10;

    double v14 = [(TUPageViewController *)self visibleViewController];
    [(TUPageViewController *)self setOriginalVisibleViewController:v14];

    double v15 = [(TUPageViewController *)self originalVisibleViewController];
    uint64_t v16 = [v15 view];
    [(id)v16 setUserInteractionEnabled:0];

    double v17 = [(TUPageViewController *)self delegate];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      double v18 = [(TUPageViewController *)self delegate];
      [v18 pageViewController:self didChangeVisibleViewControllerFromViewController:v29 direction:1];
    }
    [(TUPageViewController *)self managePreviousAndNextViewController];
    [(TUPageViewController *)self setCancelScrollViewDidScroll:1];
    id v19 = [(TUPageViewController *)self previousViewController];

    double v20 = [(TUPageViewController *)self scrollView];
    [v20 contentOffset];
    double v23 = v22;
    if (v19)
    {
      double v24 = v21;

      double v25 = [(TUPageViewController *)self scrollView];
      [v25 bounds];
      double v27 = v24 + v26;
    }
    else
    {

      double v27 = v5 * 0.5 + v8 - v5 * 0.5;
    }
    double v28 = [(TUPageViewController *)self scrollView];
    objc_msgSend(v28, "setContentOffset:", v27, v23);

    [(TUPageViewController *)self setCancelScrollViewDidScroll:0];
  }
}

- (void)accessibilityHandleRequestToGoBackForPageViewControllerScrollView:(id)a3
{
  [(TUPageViewController *)self keyboardOrActionSwitchToPreviousViewController];
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__TUPageViewController_accessibilityHandleRequestToGoBackForPageViewControllerScrollView___block_invoke;
  block[3] = &unk_1E61367A0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __90__TUPageViewController_accessibilityHandleRequestToGoBackForPageViewControllerScrollView___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x1E4FB2470];
  id v3 = [*(id *)(a1 + 32) visibleViewController];
  v2 = [v3 view];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)accessibilityHandleRequestToGoForewardForPageViewControllerScrollView:(id)a3
{
  [(TUPageViewController *)self keyboardOrActionSwitchToNextViewController];
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TUPageViewController_accessibilityHandleRequestToGoForewardForPageViewControllerScrollView___block_invoke;
  block[3] = &unk_1E61367A0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __94__TUPageViewController_accessibilityHandleRequestToGoForewardForPageViewControllerScrollView___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x1E4FB2470];
  id v3 = [*(id *)(a1 + 32) visibleViewController];
  v2 = [v3 view];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)transitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(TUPageViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(TUPageViewController *)self scrollView];
  -[TUPageViewController calculateScrollViewFrameFromViewBounds:](self, "calculateScrollViewFrameFromViewBounds:", v8, v10, width, height);
  objc_msgSend(v11, "setFrame:");

  double v12 = [(TUPageViewController *)self childViewControllers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v14 = [(TUPageViewController *)self childViewControllers];
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
          double v20 = [v19 view];
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

    [(TUPageViewController *)self repositionPages];
  }
  [(TUPageViewController *)self updateScrollView];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)TUPageViewController;
  id v7 = a4;
  -[TUPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v23, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(TUPageViewController *)self scrollView];
  if ([v8 isDecelerating])
  {

LABEL_4:
    double v11 = [(TUPageViewController *)self visibleViewController];
    double v12 = [v11 view];
    [v12 center];
    double v14 = v13;
    uint64_t v15 = [(TUPageViewController *)self visibleViewController];
    uint64_t v16 = [v15 view];
    [v16 bounds];
    double v17 = v14 - CGRectGetWidth(v24) * 0.5;
    [(TUPageViewController *)self pageGutter];
    double v19 = v17 - v18 * 0.5;

    double v20 = [(TUPageViewController *)self scrollView];
    objc_msgSend(v20, "setContentOffset:animated:", 0, v19, 0.0);

    goto LABEL_5;
  }
  double v9 = [(TUPageViewController *)self scrollView];
  int v10 = [v9 isDragging];

  if (v10) {
    goto LABEL_4;
  }
LABEL_5:
  self->_isTransitioning = 1;
  self->_transitioningSize.double width = width;
  self->_transitioningSize.double height = height;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__TUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E61367C8;
  aBlock[4] = self;
  *(double *)&aBlock[5] = width;
  *(double *)&aBlock[6] = height;
  double v21 = _Block_copy(aBlock);
  [v7 animateAlongsideTransition:v21 completion:0];
}

uint64_t __75__TUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "transitionToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 977) = 0;
  return result;
}

- (TUPageViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (TUPageViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (TUPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)visibleViewController
{
  return self->_visibleViewController;
}

- (UIViewController)secondaryVisibleViewController
{
  return self->_secondaryVisibleViewController;
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

- (double)pageGutter
{
  return self->_pageGutter;
}

- (TUPageViewControllerScrollView)scrollView
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
  objc_storeStrong((id *)&self->_managedForViewController, 0);
  objc_storeStrong((id *)&self->_idleDispatchGroup, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_previousViewController, 0);
  objc_storeStrong((id *)&self->_secondaryVisibleViewController, 0);
  objc_storeStrong((id *)&self->_visibleViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end