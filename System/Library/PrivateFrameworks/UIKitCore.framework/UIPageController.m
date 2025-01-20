@interface UIPageController
- (BOOL)_allowsAutorotation;
- (BOOL)_doesVisibleViewControllerSupportInterfaceOrientation:(int64_t)a3;
- (BOOL)_hasNextViewController;
- (BOOL)_hasPreviousViewController;
- (BOOL)_hasVisibleViewController;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_isViewControllerBeingUnloaded:(id)a3 atIndex:(int64_t)a4;
- (BOOL)_needToLoadNext;
- (BOOL)_needToLoadPrevious;
- (BOOL)_needToLoadVisible;
- (BOOL)_shouldUseOnePartRotation;
- (BOOL)displaysPageControl;
- (BOOL)wraps;
- (CGRect)_scrollViewFrame;
- (UIPageControllerDelegate)delegate;
- (UIViewController)visibleViewController;
- (double)pageSpacing;
- (id)_loadNextViewController;
- (id)_loadPreviousViewController;
- (id)_loadVisibleViewControllerAndNotify:(BOOL)a3;
- (id)_nextViewController;
- (id)_pageControllerScrollView;
- (id)_previousViewController;
- (id)_scrollView;
- (id)_visibleViewController;
- (id)rotatingFooterView;
- (id)rotatingHeaderView;
- (int)_nextViewControllerNotificationState;
- (int)_previousViewControllerNotificationState;
- (int)_visibleViewControllerNotificationState;
- (int64_t)indexOfViewController:(id)a3;
- (int64_t)pageCount;
- (int64_t)visibleIndex;
- (void)_adjustScrollViewContentInsets;
- (void)_createPageControl;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_notifyNextViewController:(int)a3 animated:(BOOL)a4;
- (void)_notifyPreviousViewController:(int)a3 animated:(BOOL)a4;
- (void)_notifyViewController:(id)a3 ofState:(int)a4 previousState:(int)a5 animated:(BOOL)a6;
- (void)_notifyVisibleViewController:(int)a3 animated:(BOOL)a4;
- (void)_pageChanged:(id)a3;
- (void)_replaceViewControllerAtIndex:(int64_t)a3 withViewController:(id)a4;
- (void)_scrollView:(id)a3 boundsDidChangeToSize:(CGSize)a4;
- (void)_scrollViewDidEndPaging;
- (void)_scrollViewDidScroll:(id)a3 forceUpdate:(BOOL)a4;
- (void)_scrollViewWillBeginPaging;
- (void)_setNextViewController:(id)a3;
- (void)_setNextViewControllerNotificationState:(int)a3;
- (void)_setPreviousViewController:(id)a3;
- (void)_setPreviousViewControllerNotificationState:(int)a3;
- (void)_setVisibleViewController:(id)a3;
- (void)_setVisibleViewControllerNotificationState:(int)a3;
- (void)dealloc;
- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)loadView;
- (void)reloadViewControllerAtIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaysPageControl:(BOOL)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageSpacing:(double)a3;
- (void)setVisibleIndex:(int64_t)a3;
- (void)setVisibleIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setVisibleIndex:(int64_t)a3 preservingLoadedViewControllers:(BOOL)a4 animated:(BOOL)a5;
- (void)setWraps:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation UIPageController

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];

  self->_viewControllers = 0;
  uint64_t v3 = 0;
  self->_scrollView = 0;
  wrapperViews = self->_wrapperViews;
  do
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(UIView *)wrapperViews[v3] subviews];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    wrapperViews[v3++] = 0;
  }
  while (v3 != 3);
  v10.receiver = self;
  v10.super_class = (Class)UIPageController;
  [(UIViewController *)&v10 dealloc];
}

- (void)loadView
{
  v17.receiver = self;
  v17.super_class = (Class)UIPageController;
  [(UIViewController *)&v17 loadView];
  *(void *)&self->super._viewControllerFlags &= ~0x100000uLL;
  if (!self->_viewControllers)
  {
    uint64_t v3 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    self->_viewControllers = v3;
    [(NSMutableArray *)v3 addObject:@"UnloadedViewController"];
    [(NSMutableArray *)self->_viewControllers addObject:@"UnloadedViewController"];
    [(NSMutableArray *)self->_viewControllers addObject:@"UnloadedViewController"];
  }
  v4 = (objc_class *)objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    v4 = (objc_class *)[(UIPageControllerDelegate *)self->_delegate _pageControllerScrollViewClass];
  }
  id v5 = [v4 alloc];
  [(UIPageController *)self _scrollViewFrame];
  uint64_t v6 = (UIScrollView *)objc_msgSend(v5, "initWithFrame:");
  [(UIView *)v6 setAutoresizingMask:18];
  [(UIScrollView *)v6 setPagingEnabled:1];
  [(UIScrollView *)v6 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v6 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v6 setPageController:self];
  [(UIScrollView *)v6 setAlwaysBounceHorizontal:1];
  uint64_t v7 = 0;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  do
  {
    long long v12 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v9, v10, v11);
    self->_wrapperViews[v7] = v12;
    [(UIView *)v6 addSubview:v12];
    ++v7;
  }
  while (v7 != 3);
  [[(UIViewController *)self view] addSubview:v6];
  [(UIView *)v6 bounds];
  -[UIPageController _scrollView:boundsDidChangeToSize:](self, "_scrollView:boundsDidChangeToSize:", v6, v13, v14);
  self->_scrollView = v6;
  [(UIPageController *)self _createPageControl];
  [(UIView *)v6 bounds];
  -[UIPageController _scrollView:boundsDidChangeToSize:](self, "_scrollView:boundsDidChangeToSize:", v6, v15, v16);
}

- (void)viewDidUnload
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];

  uint64_t v3 = 0;
  self->_scrollView = 0;
  wrapperViews = self->_wrapperViews;
  do
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(UIView *)wrapperViews[v3] subviews];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    wrapperViews[v3++] = 0;
  }
  while (v3 != 3);
  v10.receiver = self;
  v10.super_class = (Class)UIPageController;
  [(UIViewController *)&v10 viewDidUnload];
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (UIPageControllerDelegate *)a3;
    *(unsigned char *)&self->_pageControllerFlags = *(unsigned char *)&self->_pageControllerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_pageControllerFlags = *(unsigned char *)&self->_pageControllerFlags & 0xFD | v4;
    if (objc_opt_respondsToSelector()) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_pageControllerFlags = *(unsigned char *)&self->_pageControllerFlags & 0xFB | v5;
  }
}

- (void)setPageSpacing:(double)a3
{
  if ((double)self->_pageSpacing != a3)
  {
    self->_pageSpacing = (int)a3;
    if ([(UIViewController *)self _existingView])
    {
      scrollView = self->_scrollView;
      if (scrollView)
      {
        [(UIPageController *)self _scrollViewFrame];
        -[UIScrollView setFrame:](scrollView, "setFrame:");
      }
    }
  }
}

- (double)pageSpacing
{
  return (double)self->_pageSpacing;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (BOOL)_isViewControllerBeingUnloaded:(id)a3 atIndex:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  id v7 = (id)[MEMORY[0x1E4F1CA98] null];
  BOOL result = 0;
  if (a3 != @"UnloadedViewController" && v7 != a3)
  {
    unint64_t v9 = 0;
    do
    {
      BOOL result = a4 == v9 || [(NSMutableArray *)self->_viewControllers objectAtIndex:v9] != (void)a3;
      if (v9 > 1) {
        break;
      }
      ++v9;
    }
    while (result);
  }
  return result;
}

- (void)_replaceViewControllerAtIndex:(int64_t)a3 withViewController:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = (id)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  viewControllers = self->_viewControllers;
  id v9 = a4;
  if (!a4) {
    id v9 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  [(NSMutableArray *)viewControllers replaceObjectAtIndex:a3 withObject:v9];
  BOOL v10 = [(UIPageController *)self _isViewControllerBeingUnloaded:v7 atIndex:a3];
  if (v10) {
    [v7 willMoveToParentViewController:0];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  wrapperViews = self->_wrapperViews;
  long long v12 = [(UIView *)self->_wrapperViews[a3] subviews];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v16++) removeFromSuperview];
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
  if (v10) {
    [v7 removeFromParentViewController];
  }

  if (a4 != @"UnloadedViewController" && a4)
  {
    objc_super v17 = (void *)[a4 view];
    [(UIView *)wrapperViews[a3] bounds];
    objc_msgSend(v17, "setFrame:");
    [(UIView *)wrapperViews[a3] addSubview:v17];
  }
  [(UIPageController *)self _adjustScrollViewContentInsets];
}

- (void)_setPreviousViewController:(id)a3
{
}

- (void)_setVisibleViewController:(id)a3
{
}

- (void)_setNextViewController:(id)a3
{
}

- (BOOL)_needToLoadPrevious
{
  return [(NSMutableArray *)self->_viewControllers objectAtIndex:0] == (void)@"UnloadedViewController";
}

- (BOOL)_needToLoadVisible
{
  return [(NSMutableArray *)self->_viewControllers objectAtIndex:1] == (void)@"UnloadedViewController";
}

- (BOOL)_needToLoadNext
{
  return [(NSMutableArray *)self->_viewControllers objectAtIndex:2] == (void)@"UnloadedViewController";
}

- (id)_loadPreviousViewController
{
  id v3 = [(UIPageController *)self _visibleViewController];
  if (!v3) {
    goto LABEL_26;
  }
  id v4 = v3;
  int64_t pageCount = self->_pageCount;
  if (!pageCount)
  {
    if (*(unsigned char *)&self->_pageControllerFlags) {
      goto LABEL_26;
    }
LABEL_13:
    uint64_t v11 = [(UIPageControllerDelegate *)self->_delegate pageController:self viewControllerLeftOfController:v3];
    goto LABEL_23;
  }
  int64_t visibleIndex = self->_visibleIndex;
  char pageControllerFlags = (char)self->_pageControllerFlags;
  if (visibleIndex <= 0 && (pageCount < 3 || (pageControllerFlags & 0x10) == 0)) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_pageControllerFlags & 1) == 0) {
    goto LABEL_13;
  }
  id v4 = (id)(pageCount - 1);
  if (pageCount < 1)
  {
LABEL_26:
    -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", 0, v4);
    return 0;
  }
  if (visibleIndex < 1)
  {
    if (visibleIndex) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = (unint64_t)pageCount >= 3;
    }
    if (!v12 || (pageControllerFlags & 0x10) == 0) {
      goto LABEL_26;
    }
    delegate = self->_delegate;
    BOOL v10 = self;
  }
  else
  {
    delegate = self->_delegate;
    BOOL v10 = self;
    id v4 = (id)(visibleIndex - 1);
  }
  uint64_t v11 = [(UIPageControllerDelegate *)delegate pageController:v10 viewControllerAtIndex:v4];
LABEL_23:
  uint64_t v14 = (__CFString *)v11;
  if (!v11) {
    goto LABEL_26;
  }
  [(UIViewController *)self addChildViewController:v11];
  [(UIPageController *)self _setPreviousViewController:v14];
  if (v14 == @"UnloadedViewController") {
    return @"UnloadedViewController";
  }
  [(__CFString *)v14 didMoveToParentViewController:self];
  return v14;
}

- (id)_loadVisibleViewControllerAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(unsigned char *)&self->_pageControllerFlags)
  {
    if (self->_pageCount < 1) {
      goto LABEL_10;
    }
    uint64_t v6 = [(UIPageControllerDelegate *)self->_delegate pageController:self viewControllerAtIndex:self->_visibleIndex];
  }
  else
  {
    char v5 = (__CFString *)[(UIPageControllerDelegate *)self->_delegate pageController:self viewControllerLeftOfController:0];
    if (v5) {
      goto LABEL_7;
    }
    uint64_t v6 = [(UIPageControllerDelegate *)self->_delegate pageController:self viewControllerRightOfController:0];
  }
  char v5 = (__CFString *)v6;
  if (!v6)
  {
LABEL_10:
    [(UIPageController *)self _setVisibleViewController:0];
    char v5 = 0;
    if (!v3) {
      return v5;
    }
    goto LABEL_13;
  }
LABEL_7:
  [(UIViewController *)self addChildViewController:v5];
  [(UIPageController *)self _setVisibleViewController:v5];
  if (v5 == @"UnloadedViewController")
  {
    char v5 = @"UnloadedViewController";
    if (!v3) {
      return v5;
    }
  }
  else
  {
    [(__CFString *)v5 didMoveToParentViewController:self];
    if (!v3) {
      return v5;
    }
  }
LABEL_13:
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    [(UIPageController *)self _notifyVisibleViewController:1 animated:0];
    [(UIPageController *)self _notifyVisibleViewController:2 animated:0];
  }
  return v5;
}

- (id)_loadNextViewController
{
  id v3 = [(UIPageController *)self _visibleViewController];
  if (!v3) {
    goto LABEL_26;
  }
  int64_t pageCount = self->_pageCount;
  if (!pageCount)
  {
    if (*(unsigned char *)&self->_pageControllerFlags) {
      goto LABEL_26;
    }
LABEL_13:
    uint64_t v12 = [(UIPageControllerDelegate *)self->_delegate pageController:self viewControllerRightOfController:v3];
    goto LABEL_23;
  }
  int64_t visibleIndex = self->_visibleIndex;
  int64_t v6 = pageCount - 1;
  char pageControllerFlags = (char)self->_pageControllerFlags;
  if (visibleIndex >= pageCount - 1 && (pageCount < 3 || (pageControllerFlags & 0x10) == 0)) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_pageControllerFlags & 1) == 0) {
    goto LABEL_13;
  }
  if (pageCount < 1)
  {
LABEL_26:
    [(UIPageController *)self _setNextViewController:0];
    return 0;
  }
  if (visibleIndex >= v6)
  {
    if (visibleIndex != v6 || (unint64_t)pageCount < 3 || (pageControllerFlags & 0x10) == 0) {
      goto LABEL_26;
    }
    delegate = self->_delegate;
    uint64_t v11 = self;
    int64_t v10 = 0;
  }
  else
  {
    delegate = self->_delegate;
    int64_t v10 = visibleIndex + 1;
    uint64_t v11 = self;
  }
  uint64_t v12 = [(UIPageControllerDelegate *)delegate pageController:v11 viewControllerAtIndex:v10];
LABEL_23:
  uint64_t v15 = (__CFString *)v12;
  if (!v12) {
    goto LABEL_26;
  }
  [(UIViewController *)self addChildViewController:v12];
  [(UIPageController *)self _setNextViewController:v15];
  if (v15 == @"UnloadedViewController") {
    return @"UnloadedViewController";
  }
  [(__CFString *)v15 didMoveToParentViewController:self];
  return v15;
}

- (id)_previousViewController
{
  id v3 = (__CFString *)[(NSMutableArray *)self->_viewControllers objectAtIndex:0];
  if (v3 == @"UnloadedViewController") {
    id v3 = [(UIPageController *)self _loadPreviousViewController];
  }
  if (v3 == (__CFString *)[MEMORY[0x1E4F1CA98] null]) {
    return 0;
  }
  else {
    return v3;
  }
}

- (id)_visibleViewController
{
  id v3 = (__CFString *)[(NSMutableArray *)self->_viewControllers objectAtIndex:1];
  if (v3 == @"UnloadedViewController") {
    id v3 = [(UIPageController *)self _loadVisibleViewControllerAndNotify:0];
  }
  if (v3 == (__CFString *)[MEMORY[0x1E4F1CA98] null]) {
    return 0;
  }
  else {
    return v3;
  }
}

- (id)_nextViewController
{
  id v3 = (__CFString *)[(NSMutableArray *)self->_viewControllers objectAtIndex:2];
  if (v3 == @"UnloadedViewController") {
    id v3 = [(UIPageController *)self _loadNextViewController];
  }
  if (v3 == (__CFString *)[MEMORY[0x1E4F1CA98] null]) {
    return 0;
  }
  else {
    return v3;
  }
}

- (BOOL)_hasPreviousViewController
{
  int64_t pageCount = self->_pageCount;
  if (!pageCount) {
    return [(UIPageController *)self _previousViewController] != 0;
  }
  if (self->_visibleIndex > 0) {
    return 1;
  }
  if (pageCount > 2) {
    return (*(unsigned char *)&self->_pageControllerFlags & 0x10) != 0;
  }
  return 0;
}

- (BOOL)_hasVisibleViewController
{
  return [(UIPageController *)self _visibleViewController] != 0;
}

- (BOOL)_hasNextViewController
{
  int64_t pageCount = self->_pageCount;
  if (!pageCount) {
    return [(UIPageController *)self _nextViewController] != 0;
  }
  if (self->_visibleIndex < pageCount - 1) {
    return 1;
  }
  if (pageCount > 2) {
    return (*(unsigned char *)&self->_pageControllerFlags & 0x10) != 0;
  }
  return 0;
}

- (UIViewController)visibleViewController
{
  id v2 = [(UIPageController *)self _visibleViewController];
  return (UIViewController *)v2;
}

- (void)_notifyViewController:(id)a3 ofState:(int)a4 previousState:(int)a5 animated:(BOOL)a6
{
  if (a4 != a5)
  {
    BOOL v6 = a6;
    switch(a4)
    {
      case 1:
        if (a5 == 3) {
          [(UIPageController *)self _notifyViewController:a3 ofState:4 previousState:*(void *)&a5 animated:a6];
        }
        objc_msgSend(a3, "__viewWillAppear:", v6);
        break;
      case 2:
        if (a5 != 1) {
          [(UIPageController *)self _notifyViewController:a3 ofState:1 previousState:*(void *)&a5 animated:a6];
        }
        objc_msgSend(a3, "__viewDidAppear:", v6);
        break;
      case 3:
        if (a5 == 1) {
          [(UIPageController *)self _notifyViewController:a3 ofState:2 previousState:*(void *)&a5 animated:a6];
        }
        -[UIViewController __viewWillDisappear:]((uint64_t)a3, v6);
        break;
      case 4:
        if (a5 != 3) {
          [(UIPageController *)self _notifyViewController:a3 ofState:3 previousState:*(void *)&a5 animated:a6];
        }
        -[UIViewController __viewDidDisappear:]((uint64_t)a3, v6);
        break;
      default:
        return;
    }
  }
}

- (void)_setPreviousViewControllerNotificationState:(int)a3
{
  self->_notificationState[0] = a3;
}

- (void)_setVisibleViewControllerNotificationState:(int)a3
{
  self->_notificationState[1] = a3;
}

- (void)_setNextViewControllerNotificationState:(int)a3
{
  self->_notificationState[2] = a3;
}

- (int)_previousViewControllerNotificationState
{
  return self->_notificationState[0];
}

- (int)_visibleViewControllerNotificationState
{
  return self->_notificationState[1];
}

- (int)_nextViewControllerNotificationState
{
  return self->_notificationState[2];
}

- (void)_notifyPreviousViewController:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(UIPageController *)self _previousViewController])
  {
    [(UIPageController *)self _notifyViewController:[(UIPageController *)self _previousViewController] ofState:v5 previousState:[(UIPageController *)self _previousViewControllerNotificationState] animated:v4];
    self->_notificationState[0] = v5;
  }
}

- (void)_notifyVisibleViewController:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(UIPageController *)self _visibleViewController])
  {
    [(UIPageController *)self _notifyViewController:[(UIPageController *)self _visibleViewController] ofState:v5 previousState:[(UIPageController *)self _visibleViewControllerNotificationState] animated:v4];
    self->_notificationState[1] = v5;
  }
}

- (void)_notifyNextViewController:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(UIPageController *)self _nextViewController])
  {
    [(UIPageController *)self _notifyViewController:[(UIPageController *)self _nextViewController] ofState:v5 previousState:[(UIPageController *)self _nextViewControllerNotificationState] animated:v4];
    self->_notificationState[2] = v5;
  }
}

- (void)_scrollViewWillBeginPaging
{
  if ((*(unsigned char *)&self->_pageControllerFlags & 6) != 0)
  {
    if ((*(unsigned char *)&self->_pageControllerFlags & 2) != 0)
    {
      delegate = self->_delegate;
      [(UIPageControllerDelegate *)delegate pageControllerWillBeginPaging:self];
    }
  }
  else
  {
    wrapperViews = self->_wrapperViews;
    [(UIView *)self->_wrapperViews[0] setUserInteractionEnabled:0];
    [(UIView *)wrapperViews[1] setUserInteractionEnabled:0];
    BOOL v4 = wrapperViews[2];
    [(UIView *)v4 setUserInteractionEnabled:0];
  }
}

- (void)_scrollViewDidEndPaging
{
  if ((*(unsigned char *)&self->_pageControllerFlags & 6) != 0)
  {
    if ((*(unsigned char *)&self->_pageControllerFlags & 4) != 0) {
      [(UIPageControllerDelegate *)self->_delegate pageControllerDidEndPaging:self];
    }
  }
  else
  {
    [(UIView *)self->_wrapperViews[0] setUserInteractionEnabled:1];
    [(UIView *)self->_wrapperViews[1] setUserInteractionEnabled:1];
    [(UIView *)self->_wrapperViews[2] setUserInteractionEnabled:1];
  }
  if ([(UIPageController *)self _previousViewControllerNotificationState])
  {
    [(UIPageController *)self _notifyPreviousViewController:4 animated:1];
  }
  else if ([(UIPageController *)self _nextViewControllerNotificationState])
  {
    [(UIPageController *)self _notifyNextViewController:4 animated:1];
  }
  [(UIPageController *)self _notifyVisibleViewController:2 animated:1];
}

- (void)_adjustScrollViewContentInsets
{
  id v3 = [(UIPageController *)self _scrollView];
  [v3 bounds];
  double v5 = v4;
  BOOL v6 = [(UIPageController *)self _hasPreviousViewController];
  BOOL v7 = [(UIPageController *)self _hasNextViewController];
  int64_t pageCount = self->_pageCount;
  if (pageCount)
  {
    int64_t visibleIndex = self->_visibleIndex;
    double v10 = fmax(v5 * (double)visibleIndex, 0.0);
    double v11 = fmax(v5 * (double)(pageCount + ~visibleIndex), 0.0);
  }
  else
  {
    double v10 = v5 * 100.0;
    double v11 = v5 * 100.0;
  }
  double v12 = -v5;
  if (v6) {
    double v13 = v10;
  }
  else {
    double v13 = -v5;
  }
  if (v7) {
    double v12 = v11;
  }
  objc_msgSend(v3, "setContentInset:", 0.0, v13, 0.0, v12);
}

- (void)_scrollView:(id)a3 boundsDidChangeToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [a3 setContentSize:a4.width * 3.0];
  objc_msgSend(a3, "setContentOffset:", width, 0.0);
  -[UIView setFrame:](self->_wrapperViews[0], "setFrame:", (double)self->_pageSpacing, 0.0, width - (double)(2 * self->_pageSpacing), height);
  -[UIView setFrame:](self->_wrapperViews[1], "setFrame:", width + (double)self->_pageSpacing, 0.0, width - (double)(2 * self->_pageSpacing), height);
  -[UIView setFrame:](self->_wrapperViews[2], "setFrame:", width + width + (double)self->_pageSpacing, 0.0, width - (double)(2 * self->_pageSpacing), height);
  [(UIPageController *)self _adjustScrollViewContentInsets];
}

- (void)_scrollViewDidScroll:(id)a3 forceUpdate:(BOOL)a4
{
  if (!a4
    && (([a3 isTracking] & 1) == 0
     && ([a3 isDecelerating] & 1) == 0
     && ![a3 isScrollAnimating]
     || ([a3 _isHorizontalBouncing] & 1) != 0))
  {
    return;
  }
  [a3 bounds];
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = [(UIPageController *)self _hasPreviousViewController];
  BOOL v11 = [(UIPageController *)self _hasNextViewController];
  BOOL v12 = v7 > v9 && v11;
  if (v10
    && v7 < v9
    && [(UIPageController *)self _previousViewControllerNotificationState] != 1)
  {
    if ([(UIPageController *)self _nextViewControllerNotificationState]) {
      [(UIPageController *)self _notifyNextViewController:4 animated:1];
    }
    [(UIPageController *)self _notifyPreviousViewController:1 animated:1];
  }
  else
  {
    if (!v12
      || [(UIPageController *)self _nextViewControllerNotificationState] == 1)
    {
      goto LABEL_21;
    }
    if ([(UIPageController *)self _previousViewControllerNotificationState]) {
      [(UIPageController *)self _notifyPreviousViewController:4 animated:1];
    }
    [(UIPageController *)self _notifyNextViewController:1 animated:1];
  }
  [(UIPageController *)self _notifyVisibleViewController:3 animated:1];
LABEL_21:
  id v13 = [(UIPageController *)self _previousViewController];
  id v14 = [(UIPageController *)self _nextViewController];
  if (v13 && v7 <= 0.0)
  {
    [(UIPageController *)self _setNextViewController:[(UIPageController *)self _visibleViewController]];
    [(UIPageController *)self _setNextViewControllerNotificationState:[(UIPageController *)self _visibleViewControllerNotificationState]];
    [(UIPageController *)self _setVisibleViewController:[(UIPageController *)self _previousViewController]];
    [(UIPageController *)self _setVisibleViewControllerNotificationState:[(UIPageController *)self _previousViewControllerNotificationState]];
    [(UIPageController *)self _setPreviousViewController:@"UnloadedViewController"];
    [(UIPageController *)self _setPreviousViewControllerNotificationState:0];
    objc_msgSend(a3, "setContentOffset:", v7 + v9, 0.0);
    int64_t visibleIndex = self->_visibleIndex;
    if ((*(unsigned char *)&self->_pageControllerFlags & 0x10) != 0)
    {
      if (visibleIndex <= 0) {
        int64_t visibleIndex = self->_pageCount;
      }
    }
    else if (visibleIndex <= 1)
    {
      int64_t visibleIndex = 1;
    }
    self->_int64_t visibleIndex = visibleIndex - 1;
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
    [(UIPageController *)self _loadPreviousViewController];
  }
  else
  {
    if (!v14 || v7 < v9 + v9) {
      return;
    }
    [(UIPageController *)self _setPreviousViewController:[(UIPageController *)self _visibleViewController]];
    [(UIPageController *)self _setPreviousViewControllerNotificationState:[(UIPageController *)self _visibleViewControllerNotificationState]];
    [(UIPageController *)self _setVisibleViewController:[(UIPageController *)self _nextViewController]];
    [(UIPageController *)self _setVisibleViewControllerNotificationState:[(UIPageController *)self _nextViewControllerNotificationState]];
    [(UIPageController *)self _setNextViewController:@"UnloadedViewController"];
    [(UIPageController *)self _setNextViewControllerNotificationState:0];
    objc_msgSend(a3, "setContentOffset:", v7 - v9, 0.0);
    if ((*(unsigned char *)&self->_pageControllerFlags & 0x10) != 0)
    {
      int64_t v18 = self->_visibleIndex;
      if (v18 < self->_pageCount - 1) {
        int64_t v19 = v18 + 1;
      }
      else {
        int64_t v19 = 0;
      }
      self->_int64_t visibleIndex = v19;
    }
    else
    {
      int64_t v16 = self->_visibleIndex;
      if (self->_pageCount - 1 >= v16 + 1) {
        int64_t v17 = v16 + 1;
      }
      else {
        int64_t v17 = self->_pageCount - 1;
      }
      self->_int64_t visibleIndex = v17;
    }
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
    [(UIPageController *)self _loadNextViewController];
  }
  [(UIPageController *)self _adjustScrollViewContentInsets];
}

- (CGRect)_scrollViewFrame
{
  [[(UIViewController *)self view] bounds];
  int pageSpacing = self->_pageSpacing;
  double v7 = v6 - (double)pageSpacing;
  double v9 = v8 + (double)(2 * pageSpacing);
  result.size.double height = v4;
  result.size.double width = v9;
  result.origin.y = v3;
  result.origin.x = v7;
  return result;
}

- (int64_t)visibleIndex
{
  return self->_visibleIndex;
}

- (void)setVisibleIndex:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setVisibleIndex:(int64_t)a3
{
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  int64_t pageCount = self->_pageCount;
  self->_int64_t pageCount = a3;
  if (a3 && pageCount)
  {
    p_int64_t visibleIndex = &self->_visibleIndex;
    int64_t visibleIndex = self->_visibleIndex;
    if (pageCount < a3 && visibleIndex == pageCount - 1) {
      goto LABEL_12;
    }
    if (visibleIndex < a3 - 1) {
      return;
    }
    -[UIPageController setVisibleIndex:](self, "setVisibleIndex:");
  }
  else
  {
    [(UIPageController *)self setVisibleIndex:0];
    p_int64_t visibleIndex = &self->_visibleIndex;
    [(UIPageController *)self reloadViewControllerAtIndex:self->_visibleIndex - 1];
    [(UIPageController *)self reloadViewControllerAtIndex:self->_visibleIndex];
  }
  int64_t visibleIndex = *p_visibleIndex;
LABEL_12:
  [(UIPageController *)self reloadViewControllerAtIndex:visibleIndex + 1];
}

- (BOOL)wraps
{
  return (*(unsigned char *)&self->_pageControllerFlags >> 4) & 1;
}

- (void)setWraps:(BOOL)a3
{
  char pageControllerFlags = (char)self->_pageControllerFlags;
  if (((((pageControllerFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    char v5 = a3 ? 16 : 0;
    *(unsigned char *)&self->_char pageControllerFlags = pageControllerFlags & 0xEF | v5;
    if (a3)
    {
      if (![(UIPageController *)self _needToLoadPrevious])
      {
        id v6 = [(UIPageController *)self _previousViewController];
        if (v6 == (id)[MEMORY[0x1E4F1CA98] null]) {
          [(UIPageController *)self _setPreviousViewController:@"UnloadedViewController"];
        }
      }
      if (![(UIPageController *)self _needToLoadNext])
      {
        id v7 = [(UIPageController *)self _nextViewController];
        if (v7 == (id)[MEMORY[0x1E4F1CA98] null])
        {
          [(UIPageController *)self _setNextViewController:@"UnloadedViewController"];
        }
      }
    }
  }
}

- (BOOL)displaysPageControl
{
  return (*(unsigned char *)&self->_pageControllerFlags >> 3) & 1;
}

- (void)_pageChanged:(id)a3
{
  uint64_t v4 = [a3 currentPage];
  [(UIPageController *)self setVisibleIndex:v4 animated:1];
}

- (void)_createPageControl
{
  if ((*(unsigned char *)&self->_pageControllerFlags & 8) != 0)
  {
    [(UIView *)self->_scrollView frame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    self->_pageControl = objc_alloc_init(UIPageControl);
    [[(UIViewController *)self view] addSubview:self->_pageControl];
    [(UIControl *)self->_pageControl addTarget:self action:sel__pageChanged_ forControlEvents:4096];
    [(UIPageControl *)self->_pageControl setNumberOfPages:self->_pageCount];
    [(UIPageControl *)self->_pageControl setCurrentPage:self->_visibleIndex];
    [(UIView *)self->_pageControl sizeToFit];
    [(UIView *)self->_pageControl frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    pageControl = self->_pageControl;
    [[(UIViewController *)self view] bounds];
    -[UIView setFrame:](pageControl, "setFrame:", v12, CGRectGetMaxY(v22) - v16, v14, v16);
    [(UIView *)self->_pageControl setAutoresizingMask:10];
    [(UIView *)self->_pageControl frame];
    scrollView = self->_scrollView;
    double v20 = v10 - v19;
    -[UIScrollView setFrame:](scrollView, "setFrame:", v4, v6, v8, v20);
  }
}

- (void)setDisplaysPageControl:(BOOL)a3
{
  char pageControllerFlags = (char)self->_pageControllerFlags;
  if (((((pageControllerFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_char pageControllerFlags = pageControllerFlags & 0xF7 | v5;
    if (a3 && [(UIViewController *)self _existingView])
    {
      [(UIPageController *)self _createPageControl];
    }
    else
    {
      [(UIView *)self->_pageControl removeFromSuperview];

      self->_pageControl = 0;
    }
  }
}

- (int64_t)indexOfViewController:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_viewControllers indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  int64_t pageCount = self->_pageCount;
  int64_t result = v4 + self->_visibleIndex - 1;
  if (result < 0)
  {
    result += pageCount;
  }
  else if (result >= pageCount)
  {
    result %= pageCount;
  }
  return result;
}

- (BOOL)_allowsAutorotation
{
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  unsigned int v3 = [(UIViewController *)&v5 _allowsAutorotation];
  if ([(UIPageController *)self _visibleViewController]) {
    v3 &= objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "_allowsAutorotation");
  }
  return v3;
}

- (BOOL)_doesVisibleViewControllerSupportInterfaceOrientation:(int64_t)a3
{
  if (![(UIPageController *)self _visibleViewController]) {
    return 1;
  }
  id v5 = [(UIPageController *)self _visibleViewController];
  return [v5 _isSupportedInterfaceOrientation:a3];
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if ([(id)objc_opt_class() _doesOverrideLegacyShouldAutorotateMethod])
  {
    return [(UIPageController *)self shouldAutorotateToInterfaceOrientation:a3];
  }
  else
  {
    return [(UIPageController *)self _doesVisibleViewControllerSupportInterfaceOrientation:a3];
  }
}

- (id)rotatingHeaderView
{
  id v2 = [(UIPageController *)self _visibleViewController];
  return (id)[v2 rotatingHeaderView];
}

- (id)rotatingFooterView
{
  id v2 = [(UIPageController *)self _visibleViewController];
  return (id)[v2 rotatingFooterView];
}

- (BOOL)_shouldUseOnePartRotation
{
  id v2 = [(UIPageController *)self _visibleViewController];
  return [v2 _shouldUseOnePartRotation];
}

- (void)_getRotationContentSettings:(id *)a3
{
  id v4 = [(UIPageController *)self _visibleViewController];
  [v4 _getRotationContentSettings:a3];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UIPageController *)self _visibleViewController];
  [v6 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UIPageController *)self _visibleViewController];
  [v6 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UIPageController *)self _visibleViewController];
  [v6 willAnimateFirstHalfOfRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3
{
  id v4 = [(UIPageController *)self _visibleViewController];
  [v4 didAnimateFirstHalfOfRotationToInterfaceOrientation:a3];
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UIPageController *)self _visibleViewController];
  [v6 willAnimateSecondHalfOfRotationFromInterfaceOrientation:a3 duration:a4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4 = [(UIPageController *)self _visibleViewController];
  [v4 didRotateFromInterfaceOrientation:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(UIPageController *)self _notifyVisibleViewController:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  [(UIPageController *)self _notifyVisibleViewController:2 animated:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(UIPageController *)self _notifyVisibleViewController:3 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  [(UIPageController *)self _notifyVisibleViewController:4 animated:v3];
}

- (UIPageControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setVisibleIndex:(int64_t)a3 preservingLoadedViewControllers:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a4;
  int64_t pageCount = self->_pageCount;
  if (pageCount <= 1) {
    int64_t pageCount = 1;
  }
  int64_t v8 = pageCount - 1;
  if (v8 >= (a3 & ~(a3 >> 63))) {
    int64_t v9 = a3 & ~(a3 >> 63);
  }
  else {
    int64_t v9 = v8;
  }
  uint64_t v10 = v9 - self->_visibleIndex;
  if (v10 || !a4)
  {
    if (a5)
    {
      double v11 = (double)v10;
      [(UIView *)self->_scrollView bounds];
      double v13 = v12 * v11;
      scrollView = self->_scrollView;
      [(UIScrollView *)scrollView contentOffset];
      double v16 = v15 + v13;
      [(UIScrollView *)self->_scrollView contentOffset];
      [(UIScrollView *)scrollView setContentOffset:1 animated:v16];
      return;
    }
    unsigned int v17 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3) - 1;
    if (v17 <= 1
      && ![(UIPageController *)self _needToLoadVisible]
      && [(UIPageController *)self _hasVisibleViewController])
    {
      [(UIPageController *)self _notifyVisibleViewController:3 animated:0];
    }
    if (!v5) {
      goto LABEL_78;
    }
    int64_t visibleIndex = self->_visibleIndex;
    if (v9 == visibleIndex + 1)
    {
      if (v17 <= 1
        && ![(UIPageController *)self _needToLoadNext]
        && [(UIPageController *)self _hasNextViewController])
      {
        [(UIPageController *)self _notifyNextViewController:1 animated:0];
      }
      if ([(UIPageController *)self _needToLoadVisible]) {
        double v19 = @"UnloadedViewController";
      }
      else {
        double v19 = [(UIPageController *)self _visibleViewController];
      }
      [(UIPageController *)self _setPreviousViewController:v19];
      if ([(UIPageController *)self _needToLoadVisible]) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = [(UIPageController *)self _visibleViewControllerNotificationState];
      }
      [(UIPageController *)self _setPreviousViewControllerNotificationState:v22];
      if ([(UIPageController *)self _needToLoadNext]) {
        uint64_t v23 = @"UnloadedViewController";
      }
      else {
        uint64_t v23 = [(UIPageController *)self _nextViewController];
      }
      [(UIPageController *)self _setVisibleViewController:v23];
      if ([(UIPageController *)self _needToLoadNext]) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = [(UIPageController *)self _nextViewControllerNotificationState];
      }
      [(UIPageController *)self _setVisibleViewControllerNotificationState:v24];
      [(UIPageController *)self _setNextViewController:@"UnloadedViewController"];
      [(UIPageController *)self _setNextViewControllerNotificationState:0];
      goto LABEL_49;
    }
    if (v9 == visibleIndex - 1)
    {
      if (v17 <= 1
        && ![(UIPageController *)self _needToLoadPrevious]
        && [(UIPageController *)self _hasPreviousViewController])
      {
        [(UIPageController *)self _notifyPreviousViewController:1 animated:0];
      }
      if ([(UIPageController *)self _needToLoadVisible]) {
        double v20 = @"UnloadedViewController";
      }
      else {
        double v20 = [(UIPageController *)self _visibleViewController];
      }
      [(UIPageController *)self _setNextViewController:v20];
      if ([(UIPageController *)self _needToLoadVisible]) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = [(UIPageController *)self _visibleViewControllerNotificationState];
      }
      [(UIPageController *)self _setNextViewControllerNotificationState:v25];
      if ([(UIPageController *)self _needToLoadPrevious]) {
        v26 = @"UnloadedViewController";
      }
      else {
        v26 = [(UIPageController *)self _previousViewController];
      }
      [(UIPageController *)self _setVisibleViewController:v26];
      if ([(UIPageController *)self _needToLoadPrevious]) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = [(UIPageController *)self _previousViewControllerNotificationState];
      }
      [(UIPageController *)self _setVisibleViewControllerNotificationState:v27];
      long long v21 = self;
    }
    else
    {
LABEL_78:
      if (v17 <= 1
        && ![(UIPageController *)self _needToLoadVisible]
        && [(UIPageController *)self _hasVisibleViewController])
      {
        [(UIPageController *)self _notifyVisibleViewController:4 animated:0];
      }
      [(UIPageController *)self _setNextViewController:@"UnloadedViewController"];
      [(UIPageController *)self _setNextViewControllerNotificationState:0];
      [(UIPageController *)self _setVisibleViewController:@"UnloadedViewController"];
      [(UIPageController *)self _setVisibleViewControllerNotificationState:0];
      long long v21 = self;
    }
    [(UIPageController *)v21 _setPreviousViewController:@"UnloadedViewController"];
    [(UIPageController *)self _setPreviousViewControllerNotificationState:0];
LABEL_49:
    self->_int64_t visibleIndex = v9;
    if (v17 <= 1)
    {
      if (![(UIPageController *)self _needToLoadNext]
        && [(UIPageController *)self _hasNextViewController]
        && [(UIPageController *)self _nextViewControllerNotificationState] == 3)
      {
        [(UIPageController *)self _notifyNextViewController:4 animated:0];
      }
      else if (![(UIPageController *)self _needToLoadPrevious] {
             && [(UIPageController *)self _hasPreviousViewController]
      }
             && [(UIPageController *)self _previousViewControllerNotificationState] == 3)
      {
        [(UIPageController *)self _notifyPreviousViewController:4 animated:0];
      }
      if (![(UIPageController *)self _needToLoadVisible]
        && [(UIPageController *)self _hasVisibleViewController])
      {
        [(UIPageController *)self _notifyVisibleViewController:2 animated:0];
      }
    }
    if ([(UIPageController *)self _needToLoadVisible])
    {
      [(UIPageController *)self _loadVisibleViewControllerAndNotify:v17 < 2];
    }
  }
}

- (void)reloadViewControllerAtIndex:(int64_t)a3
{
  int64_t visibleIndex = self->_visibleIndex;
  if (visibleIndex - 1 <= a3 && visibleIndex + 1 >= a3)
  {
    int64_t v6 = a3 - visibleIndex + 1;
    switch(v6)
    {
      case 2:
        [(UIPageController *)self _setNextViewController:@"UnloadedViewController"];
        [(UIPageController *)self _setNextViewControllerNotificationState:0];
        break;
      case 1:
        [(UIPageController *)self _setVisibleViewController:@"UnloadedViewController"];
        [(UIPageController *)self _setVisibleViewControllerNotificationState:0];
        [(UIPageController *)self _loadVisibleViewControllerAndNotify:1];
        break;
      case 0:
        [(UIPageController *)self _setPreviousViewController:@"UnloadedViewController"];
        [(UIPageController *)self _setPreviousViewControllerNotificationState:0];
        break;
    }
  }
}

- (id)_pageControllerScrollView
{
  if (![(UIPageController *)self _scrollView]) {
    [(UIViewController *)self view];
  }
  id v3 = [(UIPageController *)self _scrollView];
  return v3;
}

@end