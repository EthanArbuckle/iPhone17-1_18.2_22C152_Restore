@interface CRLiOSInsertPageViewController
- (BOOL)crl_isInDarkMode;
- (BOOL)p_didExplicitlyCancelSearch;
- (BOOL)p_isInViewHierarchy;
- (BOOL)p_isShowingSearchBar;
- (BOOL)p_shouldIgnoreCancelBecauseOfWriting;
- (BOOL)p_shouldScrollToBottomOfPage;
- (BOOL)p_shouldUpdatePageSelectionOnNextLayoutSubviews;
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)supportsSearch;
- (CGSize)contentSize;
- (CRLiOSInsertPageViewController)initWithCoder:(id)a3;
- (CRLiOSInsertPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CRLiOSInsertPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (CRLiOSInsertPageViewControllerDataSource)insertPageViewControllerDataSource;
- (CRLiOSInsertPageViewControllerDelegate)insertPageViewControllerDelegate;
- (CRLiOSInsertPageViewControllerNavigationDataSource)insertPageViewControllerNavigationDataSource;
- (CRLiOSInsertPageViewControllerTitlesPageControl)p_titlesPageControl;
- (CRLiOSMultipaneSegmentedControl)p_subpageNavigator;
- (NSArray)viewControllers;
- (NSLayoutConstraint)p_bottomLayoutConstraintAboveKeyboard;
- (NSLayoutConstraint)p_dotsPageControlHeightConstraint;
- (NSString)selectedPageNumberAutosaveName;
- (NSString)selectedSubpageAutosaveName;
- (UIButton)p_searchButton;
- (UIPageControl)p_dotsPageControl;
- (UIPageViewController)p_pageViewController;
- (UIScrollView)p_titlesPageControlScrollView;
- (UISearchBar)p_searchBar;
- (UIView)p_bottomFadeBar;
- (UIView)p_searchButtonSpacerView;
- (UIView)p_searchOverlayView;
- (UIView)p_titlesPageControlBottomBorder;
- (UIViewController)p_searchViewController;
- (double)p_dotsPageControlHeight;
- (id)p_selectedViewController;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)p_searchBarStyleInDarkUI:(BOOL)a3;
- (unint64_t)p_currentPageNumber;
- (unint64_t)p_pageControlType;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)p_addKeyboardObservation;
- (void)p_beginSearchingAnimated:(BOOL)a3;
- (void)p_clearSearching;
- (void)p_dotPageControlValueChanged;
- (void)p_endSearching;
- (void)p_keyboardWillHide:(id)a3;
- (void)p_keyboardWillShow:(id)a3;
- (void)p_moveOverlayView:(id)a3 toSelectedViewControllerView:(id)a4;
- (void)p_recursivelySetExclusiveTouchOnView:(id)a3;
- (void)p_removeKeyboardObservation;
- (void)p_restoreViewState;
- (void)p_searchButtonTapped:(id)a3;
- (void)p_selectPageAtIndex:(unint64_t)a3;
- (void)p_selectPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollToBottom:(BOOL)a5;
- (void)p_setSearchBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)p_setSearchOverlayViewHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)p_setSearchOverlayViewHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)p_setViewControllers:(id)a3 shouldUpdatePageViewController:(BOOL)a4 animated:(BOOL)a5;
- (void)p_setupConstraintsWithTopLevelView:(id)a3 searchBar:(id)a4 navigatorStackView:(id)a5 pageViewControllerView:(id)a6 dotsPageControlWrapper:(id)a7;
- (void)p_setupViews;
- (void)p_subpageNavigatorDidChangeSelectedSegment:(id)a3;
- (void)p_titlesPageControlValueChanged:(id)a3;
- (void)p_updateBottomConstraintsIfNeeded;
- (void)p_updatePageSelectionForViewAppearance;
- (void)p_updateTitlesPageControlAndBottomViewColorsInDarkUI:(BOOL)a3;
- (void)p_updateUIForChangeToPageNumber:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)resignFirstResponderIfNeeded;
- (void)scribbleInteractionDidFinishWriting:(id)a3;
- (void)scribbleInteractionWillBeginWriting:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)selectPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollToBottom:(BOOL)a5;
- (void)setInsertPageViewControllerDataSource:(id)a3;
- (void)setInsertPageViewControllerDelegate:(id)a3;
- (void)setInsertPageViewControllerNavigationDataSource:(id)a3;
- (void)setP_bottomFadeBar:(id)a3;
- (void)setP_bottomLayoutConstraintAboveKeyboard:(id)a3;
- (void)setP_currentPageNumber:(unint64_t)a3;
- (void)setP_didExplicitlyCancelSearch:(BOOL)a3;
- (void)setP_dotsPageControl:(id)a3;
- (void)setP_dotsPageControlHeightConstraint:(id)a3;
- (void)setP_isInViewHierarchy:(BOOL)a3;
- (void)setP_isShowingSearchBar:(BOOL)a3;
- (void)setP_pageViewController:(id)a3;
- (void)setP_searchBar:(id)a3;
- (void)setP_searchButton:(id)a3;
- (void)setP_searchButtonSpacerView:(id)a3;
- (void)setP_searchOverlayView:(id)a3;
- (void)setP_searchViewController:(id)a3;
- (void)setP_shouldIgnoreCancelBecauseOfWriting:(BOOL)a3;
- (void)setP_shouldScrollToBottomOfPage:(BOOL)a3;
- (void)setP_shouldUpdatePageSelectionOnNextLayoutSubviews:(BOOL)a3;
- (void)setP_subpageNavigator:(id)a3;
- (void)setP_titlesPageControl:(id)a3;
- (void)setP_titlesPageControlBottomBorder:(id)a3;
- (void)setP_titlesPageControlScrollView:(id)a3;
- (void)setSelectedPageNumberAutosaveName:(id)a3;
- (void)setSelectedSubpageAutosaveName:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)updateBottomViewVisibilityIfNeeded;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation CRLiOSInsertPageViewController

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  if (self->_shouldIgnoreCancelBecauseOfWriting)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9848);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107DF5C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9868);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewController scribbleInteractionWillBeginWriting:]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:391 isFatal:0 description:"bad state on _shouldIgnoreCancelBecauseOfWriting"];
  }
  self->_shouldIgnoreCancelBecauseOfWriting = 1;
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  if (!self->_shouldIgnoreCancelBecauseOfWriting)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9888);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107DFF0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D98A8);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewController scribbleInteractionDidFinishWriting:]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:397 isFatal:0 description:"bad state on _shouldIgnoreCancelBecauseOfWriting"];
  }
  self->_shouldIgnoreCancelBecauseOfWriting = 0;
}

- (CRLiOSInsertPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  id v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSInsertPageViewController;
  v8 = [(CRLiOSInsertPageViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = (UIPageViewController *)[objc_alloc((Class)UIPageViewController) initWithTransitionStyle:1 navigationOrientation:a4 options:v7];
    pageViewController = v8->_pageViewController;
    v8->_pageViewController = v9;
  }
  return v8;
}

- (CRLiOSInsertPageViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSInsertPageViewController;
  v5 = [(CRLiOSInsertPageViewController *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = (UIPageViewController *)[objc_alloc((Class)UIPageViewController) initWithCoder:v4];
    pageViewController = v5->_pageViewController;
    v5->_pageViewController = v6;
  }
  return v5;
}

- (CRLiOSInsertPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSInsertPageViewController;
  v8 = [(CRLiOSInsertPageViewController *)&v12 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    objc_super v9 = (UIPageViewController *)[objc_alloc((Class)UIPageViewController) initWithNibName:v6 bundle:v7];
    pageViewController = v8->_pageViewController;
    v8->_pageViewController = v9;
  }
  return v8;
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:");
  if (!a3) {
    [(CRLiOSInsertPageViewController *)self p_removeKeyboardObservation];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  if (a3) {
    [(CRLiOSInsertPageViewController *)self p_updatePageSelectionForViewAppearance];
  }
}

- (void)p_updatePageSelectionForViewAppearance
{
  if (![(CRLiOSInsertPageViewController *)self p_isShowingSearchBar])
  {
    unint64_t v3 = [(CRLiOSInsertPageViewController *)self p_currentPageNumber];
    BOOL v4 = [(CRLiOSInsertPageViewController *)self p_shouldScrollToBottomOfPage];
    [(CRLiOSInsertPageViewController *)self p_selectPageAtIndex:v3 animated:0 scrollToBottom:v4];
  }
}

- (void)loadView
{
  unint64_t v3 = -[CRLiOSInspectorPaneView initWithFrame:]([CRLiOSInspectorPaneView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CRLiOSInsertPageViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v3 viewDidLoad];
  [(CRLiOSInsertPageViewController *)self p_setupViews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CRLiOSInsertPageViewController *)self p_restoreViewState];
  objc_super v5 = [(CRLiOSInsertPageViewController *)self p_pageViewController];
  id v6 = [(CRLiOSInsertPageViewController *)self viewControllers];
  [v5 setViewControllers:v6 direction:0 animated:0 completion:0];

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v7 viewWillAppear:v3];
  [(CRLiOSInsertPageViewController *)self p_addKeyboardObservation];
  [(CRLiOSInsertPageViewController *)self p_updateBottomConstraintsIfNeeded];
  [(CRLiOSInsertPageViewController *)self p_updateTitlesPageControlAndBottomViewColorsInDarkUI:[(CRLiOSInsertPageViewController *)self crl_isInDarkMode]];
  self->_shouldUpdatePageSelectionOnNextLayoutSubviews = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v5 viewDidAppear:a3];
  [(CRLiOSInsertPageViewController *)self setP_isInViewHierarchy:1];
  [(CRLiOSInsertPageViewController *)self p_updatePageSelectionForViewAppearance];
  BOOL v4 = [(CRLiOSInsertPageViewController *)self p_searchButton];
  CRLAccessibilityPostLayoutChangedNotification(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v5 viewWillDisappear:a3];
  [(CRLiOSInsertPageViewController *)self p_removeKeyboardObservation];
  BOOL v4 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  [v4 insertPageViewControllerWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v4 viewDidDisappear:a3];
  [(CRLiOSInsertPageViewController *)self p_setSearchOverlayViewHidden:1 animated:0];
  [(CRLiOSInsertPageViewController *)self setP_isInViewHierarchy:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSInsertPageViewController;
  id v7 = a4;
  -[CRLiOSInsertPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014CD38;
  v8[3] = &unk_1014D98D0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v6 viewDidLayoutSubviews];
  if (![(CRLiOSInsertPageViewController *)self p_pageControlType])
  {
    BOOL v3 = [(CRLiOSInsertPageViewController *)self view];
    objc_super v4 = [v3 tintColor];
    objc_super v5 = [(CRLiOSInsertPageViewController *)self p_dotsPageControl];
    [v5 setCurrentPageIndicatorTintColor:v4];
  }
  if (self->_shouldUpdatePageSelectionOnNextLayoutSubviews)
  {
    self->_shouldUpdatePageSelectionOnNextLayoutSubviews = 0;
    [(CRLiOSInsertPageViewController *)self p_updatePageSelectionForViewAppearance];
  }
}

- (void)updateViewConstraints
{
  v18.receiver = self;
  v18.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v18 updateViewConstraints];
  if (![(CRLiOSInsertPageViewController *)self p_pageControlType])
  {
    BOOL v3 = [(CRLiOSInsertPageViewController *)self p_bottomFadeBar];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v4 = [v3 superview];

    if (v4) {
      [v3 removeFromSuperview];
    }
    objc_super v5 = [(CRLiOSInsertPageViewController *)self view];
    [v5 addSubview:v3];
    [v5 bringSubviewToFront:v3];
    objc_super v6 = [v3 leadingAnchor];
    id v7 = [v5 leadingAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    objc_super v9 = [v3 trailingAnchor];
    v10 = [v5 trailingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    objc_super v12 = [v3 bottomAnchor];
    v13 = [(CRLiOSInsertPageViewController *)self p_dotsPageControl];
    v14 = [v13 topAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [v3 heightAnchor];
    v17 = [v16 constraintEqualToConstant:6.0];
    [v17 setActive:1];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSInsertPageViewController;
  [(CRLiOSInsertPageViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(CRLiOSInsertPageViewController *)self p_updateBottomConstraintsIfNeeded];
}

- (void)setViewControllers:(id)a3
{
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
}

- (void)p_recursivelySetExclusiveTouchOnView:(id)a3
{
  id v4 = a3;
  [v4 setExclusiveTouch:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v5 = [v4 subviews];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CRLiOSInsertPageViewController *)self p_recursivelySetExclusiveTouchOnView:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)p_setViewControllers:(id)a3 shouldUpdatePageViewController:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(CRLiOSInsertPageViewController *)self p_isInViewHierarchy] && v6)
  {
    if (v5) {
      double v9 = 0.300000012;
    }
    else {
      double v9 = 0.0;
    }
    long long v10 = [(CRLiOSInsertPageViewController *)self p_pageViewController];
    long long v11 = [v10 view];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10014D418;
    v28[3] = &unk_1014CBE78;
    id v29 = v10;
    id v30 = v8;
    id v12 = v10;
    +[UIView transitionWithView:v11 duration:5242880 options:v28 animations:0 completion:v9];
  }
  long long v13 = (NSArray *)[v8 copy];
  viewControllers = self->_viewControllers;
  self->_viewControllers = v13;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = self->_viewControllers;
  id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v24 + 1) + 8 * i) view:v24];
        [(CRLiOSInsertPageViewController *)self p_recursivelySetExclusiveTouchOnView:v20];
      }
      id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v17);
  }

  v21 = [(CRLiOSInsertPageViewController *)self p_searchOverlayView];
  v22 = [(CRLiOSInsertPageViewController *)self p_selectedViewController];
  v23 = [v22 view];
  [(CRLiOSInsertPageViewController *)self p_moveOverlayView:v21 toSelectedViewControllerView:v23];
}

- (CGSize)contentSize
{
  unint64_t v3 = [(CRLiOSInsertPageViewController *)self p_pageControlType];
  id v4 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerNavigationDataSource];
  double Height = 0.0;
  if ([v4 showsSubpageNavigator])
  {
    BOOL v6 = [(CRLiOSInsertPageViewController *)self p_subpageNavigator];
    [v6 bounds];
    double Height = CGRectGetHeight(v29);
  }
  if (v3 == 1) {
    double v7 = 44.0;
  }
  else {
    double v7 = 0.0;
  }

  [(CRLiOSInsertPageViewController *)self p_dotsPageControlHeight];
  double v9 = v8;
  long long v10 = [(CRLiOSInsertPageViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  [(CRLiOSInsertPageViewController *)self preferredContentSize];
  double v16 = fmax(v14, v15) - (v7 + Height + v9);
  id v17 = [(CRLiOSInsertPageViewController *)self view];
  [v17 safeAreaInsets];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v12 - v21 - v25;
  double v27 = v16 - v19 - v23;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (BOOL)supportsSearch
{
  v2 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerNavigationDataSource];
  unsigned __int8 v3 = [v2 supportsSearch];

  return v3;
}

- (void)resignFirstResponderIfNeeded
{
  unsigned __int8 v3 = [(CRLiOSInsertPageViewController *)self p_searchBar];
  unsigned int v4 = [v3 isFirstResponder];

  if (v4)
  {
    id v5 = [(CRLiOSInsertPageViewController *)self p_searchBar];
    [v5 resignFirstResponder];
  }
}

- (void)updateBottomViewVisibilityIfNeeded
{
  unsigned __int8 v3 = [(CRLiOSInsertPageViewController *)self view];
  [v3 layoutIfNeeded];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10014D6A4;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.300000012];
}

- (void)selectPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollToBottom:(BOOL)a5
{
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  double v7 = [v6 insertPageViewController:self viewControllerBeforeViewController:v5];

  return v7;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  double v7 = [v6 insertPageViewController:self viewControllerAfterViewController:v5];

  return v7;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count] != (id)1)
  {
    unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D98F0);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v15 = v8;
      __int16 v16 = 2082;
      id v17 = "-[CRLiOSInsertPageViewController pageViewController:willTransitionToViewControllers:]";
      __int16 v18 = 2082;
      double v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m";
      __int16 v20 = 1024;
      int v21 = 651;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      double v25 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Incorrectly transitioning to more than one view controller (%@) in %@.", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9910);
    }
    long long v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewController pageViewController:willTransitionToViewControllers:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11, v12, 651, 0, "Incorrectly transitioning to more than one view controller (%@) in %@.", v7, self file lineNumber isFatal description];
  }
  double v13 = [v6 view];
  [(CRLiOSInsertPageViewController *)self p_recursivelySetExclusiveTouchOnView:v13];
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a3;
  double v9 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  long long v10 = [v8 viewControllers];
  double v11 = [v10 firstObject];
  double v12 = (char *)[v9 insertPageViewController:self presentationIndexForViewController:v11];

  [(CRLiOSInsertPageViewController *)self setP_currentPageNumber:v12];
  double v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"AX_INSERT_PANEL_PAGE_SCROLLED" value:@"Page %1$lu of %2$lu" table:0];

  unint64_t v15 = [(CRLiOSInsertPageViewController *)self p_pageControlType];
  if (v15 == 1)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10014DCCC;
    v22[3] = &unk_1014D9938;
    v22[4] = self;
    id v23 = v8;
    __int16 v24 = v12;
    BOOL v25 = v6;
    [(CRLiOSInsertPageViewController *)self p_updateUIForChangeToPageNumber:v12 animated:1 completion:v22];
  }
  else if (!v15)
  {
    __int16 v16 = [(CRLiOSInsertPageViewController *)self p_dotsPageControl];
    [v16 setCurrentPage:v12];

    id v17 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
    [v17 insertPageViewController:self didSelectPageNumber:v12];

    __int16 v18 = [v8 viewControllers];
    [(CRLiOSInsertPageViewController *)self p_setViewControllers:v18 shouldUpdatePageViewController:0 animated:0];

    if (v6)
    {
      UIAccessibilityNotifications v19 = UIAccessibilityPageScrolledNotification;
      __int16 v20 = [(CRLiOSInsertPageViewController *)self p_dotsPageControl];
      int v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12 + 1, [v20 numberOfPages]);
      UIAccessibilityPostNotification(v19, v21);
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if ([(CRLiOSInsertPageViewController *)self p_isShowingSearchBar])
  {
    [v4 bounds];
    [v4 setContentOffset:CGRectGetWidth(v6), 0.0];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6 = a3;
  if ([(CRLiOSInsertPageViewController *)self p_isShowingSearchBar])
  {
    [v6 bounds];
    [v6 setContentOffset:CGRectGetWidth(v8), 0.0];
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4 = [a3 text];
  id v5 = [v4 length];

  if (!v5) {
    [(CRLiOSInsertPageViewController *)self p_setSearchOverlayViewHidden:0 animated:1];
  }
  return 1;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014DFC8;
  v8[3] = &unk_1014CBE78;
  id v9 = v4;
  long long v10 = self;
  id v5 = v8;
  id v6 = v4;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, v5);
  CFRunLoopWakeUp(Main);
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v5 = self;
  id v6 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  LOBYTE(v5) = [v6 insertPageViewControllerShouldChangeSearchText:v5];

  return (char)v5;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLiOSInsertPageViewController *)self p_searchViewController];
  id v7 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  [v7 insertPageViewController:self willSearchWithText:v5 inViewController:v6 searchViewController:v6];

  id v8 = [(CRLiOSInsertPageViewController *)self p_selectedViewController];

  id v9 = [v5 length];
  long long v10 = v6;
  if (v8 == v6)
  {
    if (!v9)
    {
      double v12 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
      long long v10 = [v12 insertPageViewController:self viewControllerForPageAtIndex:-[CRLiOSInsertPageViewController p_currentPageNumber](self, "p_currentPageNumber")];

      if (v10)
      {
        double v14 = v10;
        double v13 = +[NSArray arrayWithObjects:&v14 count:1];
        [(CRLiOSInsertPageViewController *)self setViewControllers:v13 animated:0];
      }
      [(CRLiOSInsertPageViewController *)self p_setSearchOverlayViewHidden:0 animated:1];
    }
  }
  else if (v9)
  {
    long long v10 = v6;
    if (v6)
    {
      [(CRLiOSInsertPageViewController *)self p_setSearchOverlayViewHidden:1 animated:1];
      id v15 = v6;
      double v11 = +[NSArray arrayWithObjects:&v15 count:1];
      [(CRLiOSInsertPageViewController *)self setViewControllers:v11 animated:0];

      long long v10 = v6;
    }
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  if (!self->_shouldIgnoreCancelBecauseOfWriting)
  {
    [(CRLiOSInsertPageViewController *)self setP_didExplicitlyCancelSearch:1];
    [(CRLiOSInsertPageViewController *)self p_endSearching];
    [(CRLiOSInsertPageViewController *)self setP_didExplicitlyCancelSearch:0];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)p_searchButtonTapped:(id)a3
{
}

- (void)p_setSearchOverlayViewHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)p_setSearchOverlayViewHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(CRLiOSInsertPageViewController *)self p_searchOverlayView];
  if (v6)
  {
    long long v10 = v15;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    double v11 = sub_10014E3E4;
  }
  else
  {
    long long v10 = v14;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    double v11 = sub_10014E3F0;
  }
  if (v5) {
    double v12 = 0.150000006;
  }
  else {
    double v12 = 0.0;
  }
  v10[2] = v11;
  v10[3] = &unk_1014CBBB0;
  id v13 = v9;
  v10[4] = v13;
  +[UIView animateWithDuration:v10 animations:v8 completion:v12];
}

- (void)p_setSearchBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if ([(CRLiOSInsertPageViewController *)self supportsSearch])
  {
    [(CRLiOSInsertPageViewController *)self setP_isShowingSearchBar:!v6];
    id v9 = [(CRLiOSInsertPageViewController *)self p_searchBar];
    if (!v6)
    {
      long long v10 = [(CRLiOSInsertPageViewController *)self view];
      [v10 bringSubviewToFront:v9];
    }
    if (v5) {
      double v11 = 0.300000012;
    }
    else {
      double v11 = 0.0;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10014E59C;
    v18[3] = &unk_1014CD3B8;
    v18[4] = self;
    BOOL v19 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10014E664;
    v13[3] = &unk_1014D9960;
    BOOL v17 = v6;
    id v14 = v9;
    id v15 = self;
    id v16 = v8;
    id v12 = v9;
    +[UIView animateWithDuration:v18 animations:v13 completion:v11];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

- (void)p_beginSearchingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  [v5 insertPageViewControllerWillBeginSearch:self];

  [(CRLiOSInsertPageViewController *)self p_setSearchBarHidden:0 animated:v3 completion:0];
  BOOL v6 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  id v7 = [v6 insertPageViewControllerViewControllerForSearch:self];
  [(CRLiOSInsertPageViewController *)self setP_searchViewController:v7];

  id v8 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  [v8 insertPageViewControllerDidBeginSearch:self];
}

- (void)p_endSearching
{
  [(CRLiOSInsertPageViewController *)self p_clearSearching];
  unint64_t v3 = [(CRLiOSInsertPageViewController *)self p_currentPageNumber];

  [(CRLiOSInsertPageViewController *)self p_selectPageAtIndex:v3];
}

- (void)p_clearSearching
{
  BOOL v3 = [(CRLiOSInsertPageViewController *)self p_didExplicitlyCancelSearch];
  id v4 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  [v4 insertPageViewControllerWillEndSearch:self cancelledExplicitly:v3];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014E948;
  v6[3] = &unk_1014D9988;
  v6[4] = self;
  BOOL v7 = v3;
  [(CRLiOSInsertPageViewController *)self p_setSearchOverlayViewHidden:1 animated:1 completion:v6];
  BOOL v5 = [(CRLiOSInsertPageViewController *)self p_searchBar];
  [v5 setText:&stru_101538650];
}

- (void)p_addKeyboardObservation
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"p_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"p_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)p_removeKeyboardObservation
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillHideNotification object:0];
}

- (void)p_keyboardWillShow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLiOSInsertPageViewController *)self view];
  [v5 layoutIfNeeded];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014EB98;
  v6[3] = &unk_1014CBBB0;
  v6[4] = self;
  +[UIView crl_animateWithKeyboardNotification:v4 animations:v6];
}

- (void)p_keyboardWillHide:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLiOSInsertPageViewController *)self view];
  [v5 layoutIfNeeded];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014ECA0;
  v6[3] = &unk_1014CBBB0;
  v6[4] = self;
  +[UIView crl_animateWithKeyboardNotification:v4 animations:v6];
}

- (void)p_updateBottomConstraintsIfNeeded
{
  [(CRLiOSInsertPageViewController *)self p_dotsPageControlHeight];
  double v4 = v3;
  BOOL v5 = [(CRLiOSInsertPageViewController *)self presentingViewController];
  BOOL v6 = [v5 traitCollection];
  unsigned int v7 = [v6 crl_isCompactWidth];

  if (v7)
  {
    id v8 = +[CRLiOSKeyboardMonitor sharedKeyboardMonitor];
    [v8 onScreenHeight];
    double v10 = -v9;
    double v11 = [(CRLiOSInsertPageViewController *)self p_bottomLayoutConstraintAboveKeyboard];
    [v11 setConstant:v10];
  }
  else
  {
    id v8 = [(CRLiOSInsertPageViewController *)self p_bottomLayoutConstraintAboveKeyboard];
    [v8 setConstant:0.0];
  }

  id v12 = [(CRLiOSInsertPageViewController *)self view];
  [v12 safeAreaInsets];
  double v14 = v4 + v13;

  id v15 = [(CRLiOSInsertPageViewController *)self p_dotsPageControlHeightConstraint];
  [v15 setConstant:v14];
}

- (void)p_setupViews
{
  double v3 = [(CRLiOSInsertPageViewController *)self view];
  double v4 = [(CRLiOSInsertPageViewController *)self p_pageViewController];
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  BOOL v5 = [v4 view];
  BOOL v6 = [v5 subviews];

  id v7 = [v6 countByEnumeratingWithState:&v181 objects:v185 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v182;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v182 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v181 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          [v12 setDelaysContentTouches:0];
          [v12 setDelegate:self];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v181 objects:v185 count:16];
    }
    while (v8);
  }

  [v4 setDataSource:self];
  [v4 setDelegate:self];
  [(CRLiOSInsertPageViewController *)self addChildViewController:v4];
  [v4 didMoveToParentViewController:self];
  double v13 = [v4 view];
  [v3 addSubview:v13];

  unsigned int v14 = [(CRLiOSInsertPageViewController *)self supportsSearch];
  v175 = v4;
  v176 = v3;
  if (v14)
  {
    id v15 = +[NSBundle mainBundle];
    id v16 = [v15 localizedStringForKey:@"Search" value:0 table:0];

    BOOL v17 = [CRLiOSInsertPageViewControllerSearchBar alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    unsigned int v21 = v14;
    __int16 v22 = -[CRLiOSInsertPageViewControllerSearchBar initWithFrame:](v17, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(CRLiOSInsertPageViewControllerSearchBar *)v22 setDelegate:self];
    [(CRLiOSInsertPageViewControllerSearchBar *)v22 setSearchBarStyle:2];
    [(CRLiOSInsertPageViewControllerSearchBar *)v22 setShowsCancelButton:1];
    [(CRLiOSInsertPageViewControllerSearchBar *)v22 setPlaceholder:v16];
    [(CRLiOSInsertPageViewControllerSearchBar *)v22 setAlpha:0.0];
    [v3 addSubview:v22];
    v178 = v22;
    [(CRLiOSInsertPageViewController *)self setP_searchBar:v22];
    id v23 = +[UIImage systemImageNamed:@"magnifyingglass"];
    id v24 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v24 setIsAccessibilityElement:1];
    BOOL v25 = +[NSBundle mainBundle];
    double v26 = [v25 localizedStringForKey:@"AX_INSERT_PANEL_SEARCH_BUTTON" value:@"Search" table:0];
    [v24 setAccessibilityLabel:v26];

    double v4 = v175;
    [v24 setImage:v23 forState:0];
    int v27 = sub_1003E86EC();
    if (v27) {
      double v28 = 0.0;
    }
    else {
      double v28 = 2.0;
    }
    if (v27) {
      double v29 = 2.0;
    }
    else {
      double v29 = 0.0;
    }
    [v24 setImageEdgeInsets:0.0, v28, 0.0, v29];
    [v24 addTarget:self action:"p_searchButtonTapped:" forControlEvents:64];
    id v30 = +[UIColor clearColor];
    [v24 setBackgroundColor:v30];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setShowsLargeContentViewer:1];
    v31 = +[NSBundle mainBundle];
    v32 = [v31 localizedStringForKey:@"Search" value:0 table:0];
    [v24 setLargeContentTitle:v32];

    double v3 = v176;
    unsigned int v14 = v21;
    v33 = +[UIImage systemImageNamed:@"magnifyingglass"];
    [v24 setLargeContentImage:v33];

    id v34 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    [v24 addInteraction:v34];

    [v176 addSubview:v24];
    [(CRLiOSInsertPageViewController *)self setP_searchButton:v24];
  }
  else
  {
    id v24 = 0;
    v178 = 0;
  }
  v35 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerNavigationDataSource];
  unsigned int v36 = [v35 showsSubpageNavigator];

  if (v36)
  {
    v37 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerNavigationDataSource];
    v38 = [v37 subpageNavigatorItems];

    v39 = [[CRLiOSMultipaneSegmentedControl alloc] initWithItems:v38];
    [(CRLiOSMultipaneSegmentedControl *)v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CRLiOSMultipaneSegmentedControl *)v39 setBackdropHidden:1];
    [(CRLiOSMultipaneSegmentedControl *)v39 setSegmentHuggingEnabled:1];
    -[CRLiOSMultipaneSegmentedControl setAllEdgeInsets:](v39, "setAllEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
    v40 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
    -[CRLiOSMultipaneSegmentedControl setSelectedSegmentIndex:](v39, "setSelectedSegmentIndex:", [v40 selectedSubpageIndexForInsertPageViewController:self]);

    [(CRLiOSMultipaneSegmentedControl *)v39 setExclusiveTouch:1];
    [(CRLiOSMultipaneSegmentedControl *)v39 addTarget:self action:"p_subpageNavigatorDidChangeSelectedSegment:" forControlEvents:4096];
    [(CRLiOSInsertPageViewController *)self setP_subpageNavigator:v39];
  }
  else
  {
    v39 = 0;
  }
  v41 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  v42 = [(CRLiOSInsertPageViewController *)self p_selectedViewController];
  id v43 = [v41 insertPageViewController:self presentationIndexForViewController:v42];

  [(CRLiOSInsertPageViewController *)self setP_currentPageNumber:v43];
  unint64_t v44 = [(CRLiOSInsertPageViewController *)self p_pageControlType];
  if (!v44)
  {
    v74 = +[UIColor clearColor];
    id v75 = objc_alloc((Class)UIView);
    double x = CGRectZero.origin.x;
    double v50 = CGRectZero.origin.y;
    double v51 = CGRectZero.size.width;
    double v52 = CGRectZero.size.height;
    id v76 = [v75 initWithFrame:CGRectZero.origin.x, v50, v51, v52];
    [v76 setBackgroundColor:v74];
    [v3 addSubview:v76];
    id v77 = [objc_alloc((Class)UIPageControl) initWithFrame:CGRectZero.origin.x, v50, v51, v52];
    [v76 addSubview:v77];
    [v77 setTranslatesAutoresizingMaskIntoConstraints:0];
    v78 = [v77 topAnchor];
    v79 = [v76 topAnchor];
    v80 = [v78 constraintEqualToAnchor:v79];
    [v80 setActive:1];

    v81 = [v77 leadingAnchor];
    v82 = [v76 leadingAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    [v83 setActive:1];

    v84 = [v77 trailingAnchor];
    v85 = [v76 trailingAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    [v86 setActive:1];

    double v4 = v175;
    v87 = [v77 heightAnchor];
    v88 = [v87 constraintEqualToConstant:44.0];
    [v88 setActive:1];

    double v3 = v176;
    v89 = +[UIColor colorWithWhite:0.5 alpha:1.0];
    [v77 setPageIndicatorTintColor:v89];

    v90 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
    [v77 setNumberOfPages:[v90 presentationCountForInsertPageViewController:self]];

    [v77 setCurrentPage:v43];
    [v77 setBackgroundColor:v74];
    [v77 setAllowsContinuousInteraction:0];
    [v77 addTarget:self action:"p_dotPageControlValueChanged" forControlEvents:4096];
    [(CRLiOSInsertPageViewController *)self setP_dotsPageControl:v77];
    v91 = -[CRLiOSInsertPageViewControllerFadeView initWithStartPoint:endPoint:shouldAddDividerView:]([CRLiOSInsertPageViewControllerFadeView alloc], "initWithStartPoint:endPoint:shouldAddDividerView:", 1, 0.5, 0.0, 0.5, 1.0);
    [(CRLiOSInsertPageViewControllerFadeView *)v91 setBackgroundColor:v74];
    [(CRLiOSInsertPageViewController *)self setP_bottomFadeBar:v91];

    v92 = v76;
    v179 = 0;
    id v177 = 0;
    v172 = 0;
    v53 = 0;
LABEL_29:
    v93 = v178;
    goto LABEL_34;
  }
  if (v44 != 1)
  {
    v179 = 0;
    id v177 = 0;
    v172 = 0;
    v53 = 0;
    v92 = 0;
    double x = CGRectZero.origin.x;
    double v50 = CGRectZero.origin.y;
    double v51 = CGRectZero.size.width;
    double v52 = CGRectZero.size.height;
    goto LABEL_29;
  }
  v45 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerNavigationDataSource];
  v46 = [v45 pageControlTitles];

  v47 = [[CRLiOSInsertPageViewControllerTitlesPageControl alloc] initWithTitles:v46];
  [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 addTarget:self action:"p_titlesPageControlValueChanged:" forControlEvents:4096];
  v48 = [CRLiOSTitlesPageControlScrollView alloc];
  double x = CGRectZero.origin.x;
  double v50 = CGRectZero.origin.y;
  double v51 = CGRectZero.size.width;
  double v52 = CGRectZero.size.height;
  v53 = -[CRLiOSTitlesPageControlScrollView initWithFrame:](v48, "initWithFrame:", CGRectZero.origin.x, v50, v51, v52);
  [(CRLiOSTitlesPageControlScrollView *)v53 setShowsVerticalScrollIndicator:0];
  [(CRLiOSTitlesPageControlScrollView *)v53 setShowsHorizontalScrollIndicator:0];
  [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 frame];
  -[CRLiOSTitlesPageControlScrollView setContentSize:](v53, "setContentSize:", v54, v55);
  [(CRLiOSTitlesPageControlScrollView *)v53 setAccessibilityIdentifier:@"presetScrollView"];
  [(CRLiOSTitlesPageControlScrollView *)v53 addSubview:v47];
  [(CRLiOSTitlesPageControlScrollView *)v53 setTranslatesAutoresizingMaskIntoConstraints:0];
  v56 = [(CRLiOSTitlesPageControlScrollView *)v53 heightAnchor];
  v57 = [v56 constraintEqualToConstant:44.0];
  [v57 setActive:1];

  v58 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 topAnchor];
  v59 = [(CRLiOSTitlesPageControlScrollView *)v53 topAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 leadingAnchor];
  v62 = [(CRLiOSTitlesPageControlScrollView *)v53 leadingAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  v64 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 trailingAnchor];
  v65 = [(CRLiOSTitlesPageControlScrollView *)v53 trailingAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  [v66 setActive:1];

  v172 = v47;
  v67 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v47 heightAnchor];
  v68 = [v67 constraintEqualToConstant:44.0];
  [v68 setActive:1];

  double v3 = v176;
  id v177 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, v50, v51, v52];
  [v176 addSubview:];
  if (v14)
  {
    int v69 = sub_1003E86EC();
    v70 = [CRLiOSInsertPageViewControllerFadeView alloc];
    if (v69)
    {
      double v71 = 0.0;
      double v72 = 0.5;
      double v73 = 1.0;
    }
    else
    {
      double v71 = 1.0;
      double v72 = 0.5;
      double v73 = 0.0;
    }
    double v4 = v175;
    v93 = v178;
    v179 = -[CRLiOSInsertPageViewControllerFadeView initWithStartPoint:endPoint:shouldAddDividerView:](v70, "initWithStartPoint:endPoint:shouldAddDividerView:", 0, v71, v72, v73, 0.5);
    [(CRLiOSInsertPageViewControllerFadeView *)v179 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    v179 = 0;
    double v4 = v175;
    v93 = v178;
  }
  [(CRLiOSInsertPageViewController *)self setP_titlesPageControl:v172];
  [(CRLiOSInsertPageViewController *)self setP_titlesPageControlBottomBorder:v177];
  [(CRLiOSInsertPageViewController *)self setP_titlesPageControlScrollView:v53];

  v92 = 0;
LABEL_34:
  id v94 = [objc_alloc((Class)UIStackView) initWithFrame:x v50 v51 v52];
  [v94 setAxis:1];
  [v3 addSubview:v94];
  v180 = v39;
  v174 = v92;
  if (v53)
  {
    id v95 = [objc_alloc((Class)UIView) initWithFrame:x, v50, v51, v52];
    [v95 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v24)
    {
      [v95 addSubview:v24];
      v96 = [v24 topAnchor];
      v97 = [v95 topAnchor];
      v98 = [v96 constraintEqualToAnchor:v97];
      [v98 setActive:1];

      v99 = [v24 leadingAnchor];
      v100 = [v95 safeAreaLayoutGuide];
      v101 = [v100 leadingAnchor];
      v102 = [v99 constraintEqualToAnchor:v101];
      [v102 setActive:1];

      v103 = [v24 bottomAnchor];
      v104 = [v95 bottomAnchor];
      v105 = [v103 constraintEqualToAnchor:v104];
      [v105 setActive:1];

      v106 = [v24 widthAnchor];
      v107 = [v106 constraintEqualToConstant:40.0];
      [v107 setActive:1];

      [v95 addSubview:v179];
      id v108 = [objc_alloc((Class)UIView) initWithFrame:x, v50, v51, v52];
      [v108 setTranslatesAutoresizingMaskIntoConstraints:0];
      v109 = +[UIColor clearColor];
      [v108 setBackgroundColor:v109];

      [v95 addSubview:v108];
      v110 = [v108 topAnchor];
      v111 = [v95 topAnchor];
      v112 = [v110 constraintEqualToAnchor:v111];
      [v112 setActive:1];

      v113 = [v108 leadingAnchor];
      v114 = [v95 leadingAnchor];
      v115 = [v113 constraintEqualToAnchor:v114];
      [v115 setActive:1];

      v116 = [v108 bottomAnchor];
      v117 = [v95 bottomAnchor];
      v118 = [v116 constraintEqualToAnchor:v117];
      [v118 setActive:1];

      v119 = [v108 trailingAnchor];
      v120 = [(CRLiOSInsertPageViewControllerFadeView *)v179 leadingAnchor];
      v121 = [v119 constraintEqualToAnchor:v120];
      [v121 setActive:1];

      v122 = [(CRLiOSInsertPageViewControllerFadeView *)v179 topAnchor];
      v123 = [v95 topAnchor];
      v124 = [v122 constraintEqualToAnchor:v123];
      [v124 setActive:1];

      v125 = [(CRLiOSInsertPageViewControllerFadeView *)v179 trailingAnchor];
      v126 = [v24 trailingAnchor];
      v127 = [v125 constraintEqualToAnchor:v126];
      [v127 setActive:1];

      v128 = [(CRLiOSInsertPageViewControllerFadeView *)v179 bottomAnchor];
      v129 = [v95 bottomAnchor];
      v130 = [v128 constraintEqualToAnchor:v129];
      [v130 setActive:1];

      v131 = [(CRLiOSInsertPageViewControllerFadeView *)v179 widthAnchor];
      v132 = [v131 constraintEqualToConstant:8.0];
      [v132 setActive:1];

      [(CRLiOSInsertPageViewController *)self setP_searchButtonSpacerView:v108];
    }
    else
    {
      id v108 = 0;
    }
    [v95 addSubview:v53];
    v133 = [(CRLiOSTitlesPageControlScrollView *)v53 topAnchor];
    v134 = [v95 topAnchor];
    v135 = [v133 constraintEqualToAnchor:v134];
    [v135 setActive:1];

    v136 = [(CRLiOSTitlesPageControlScrollView *)v53 bottomAnchor];
    v137 = [v95 bottomAnchor];
    v138 = [v136 constraintEqualToAnchor:v137];
    [v138 setActive:1];

    v139 = [(CRLiOSTitlesPageControlScrollView *)v53 trailingAnchor];
    v140 = [v95 trailingAnchor];
    v141 = [v139 constraintEqualToAnchor:v140];
    [v141 setActive:1];

    v142 = [(CRLiOSTitlesPageControlScrollView *)v53 leadingAnchor];
    if (v24)
    {
      v143 = [v24 trailingAnchor];
      v144 = [v142 constraintEqualToAnchor:v143];
      [v144 setActive:1];

      [v95 bringSubviewToFront:v108];
      [v95 bringSubviewToFront:v179];
      [v95 bringSubviewToFront:v24];
    }
    else
    {
      v145 = [v95 safeAreaLayoutGuide];
      v146 = [v145 leadingAnchor];
      v147 = [v142 constraintEqualToAnchor:v146];
      [v147 setActive:1];

      v39 = v180;
    }
    [v94 addArrangedSubview:v95];
    [v94 addArrangedSubview:v177];

    double v4 = v175;
    double v3 = v176;
    v93 = v178;
    v92 = v174;
  }
  else if (v24)
  {
    [v94 addArrangedSubview:v24];
  }
  if (v39)
  {
    id v148 = [objc_alloc((Class)UIView) initWithFrame:x, v50, v51, v52];
    [v148 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v148 addSubview:v39];
    v149 = [v148 heightAnchor];
    v150 = [v149 constraintEqualToConstant:44.0];
    [v150 setActive:1];

    v151 = [v148 topAnchor];
    v152 = [(CRLiOSMultipaneSegmentedControl *)v180 topAnchor];
    v153 = [v151 constraintEqualToAnchor:v152 constant:-8.0];
    [v153 setActive:1];

    v154 = [v148 bottomAnchor];
    v155 = [(CRLiOSMultipaneSegmentedControl *)v180 bottomAnchor];
    v156 = [v154 constraintEqualToAnchor:v155 constant:8.0];
    [v156 setActive:1];

    v157 = [v148 widthAnchor];
    v158 = [(CRLiOSMultipaneSegmentedControl *)v180 widthAnchor];
    v159 = [v157 constraintLessThanOrEqualToAnchor:v158 constant:64.0];
    [v159 setActive:1];

    v160 = [v148 widthAnchor];
    v161 = [(CRLiOSMultipaneSegmentedControl *)v180 widthAnchor];
    v162 = [v160 constraintGreaterThanOrEqualToAnchor:v161 constant:24.0];
    [v162 setActive:1];

    v163 = [v148 centerXAnchor];
    v164 = [(CRLiOSMultipaneSegmentedControl *)v180 centerXAnchor];
    v165 = [v163 constraintEqualToAnchor:v164];
    [v165 setActive:1];

    v92 = v174;
    v39 = v180;

    v93 = v178;
    [v94 addArrangedSubview:v148];
  }
  if (v179) {
    [v3 bringSubviewToFront:];
  }
  v166 = [v4 view];
  [(CRLiOSInsertPageViewController *)self p_setupConstraintsWithTopLevelView:v3 searchBar:v93 navigatorStackView:v94 pageViewControllerView:v166 dotsPageControlWrapper:v92];

  [(CRLiOSInsertPageViewController *)self p_updateTitlesPageControlAndBottomViewColorsInDarkUI:[(CRLiOSInsertPageViewController *)self crl_isInDarkMode]];
  id v167 = [(CRLiOSInsertPageViewController *)self p_searchOverlayView];
  if (!v167)
  {
    id v167 = [objc_alloc((Class)UIView) initWithFrame:x, v50, v51, v52];
    v168 = +[UIColor colorWithWhite:0.0 alpha:1.0];
    [v167 setBackgroundColor:v168];

    [v167 setAlpha:0.0];
    [v167 setTranslatesAutoresizingMaskIntoConstraints:0];
    v169 = [[CRLiOSInsertPageViewControllerOverlayGestureRecognizer alloc] initWithTarget:self action:"p_searchOverlayTapped:"];
    [v167 addGestureRecognizer:v169];
    [(CRLiOSInsertPageViewController *)self setP_searchOverlayView:v167];
    v170 = [(CRLiOSInsertPageViewController *)self p_selectedViewController];
    v171 = [v170 view];
    [(CRLiOSInsertPageViewController *)self p_moveOverlayView:v167 toSelectedViewControllerView:v171];

    v92 = v174;
    v39 = v180;

    v93 = v178;
  }
}

- (void)p_moveOverlayView:(id)a3 toSelectedViewControllerView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 removeFromSuperview];
  [v5 addSubview:v6];
  id v7 = [v6 topAnchor];
  id v8 = [v5 topAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  double v10 = [v6 trailingAnchor];
  double v11 = [v5 trailingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  double v13 = [v6 bottomAnchor];
  unsigned int v14 = [v5 bottomAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v18 = [v6 leadingAnchor];

  id v16 = [v5 leadingAnchor];

  BOOL v17 = [v18 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

- (void)p_dotPageControlValueChanged
{
  unint64_t v3 = [(CRLiOSInsertPageViewController *)self p_currentPageNumber];
  double v4 = [(CRLiOSInsertPageViewController *)self p_dotsPageControl];
  id v5 = [v4 currentPage];

  id v6 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  id v7 = [v6 insertPageViewController:self viewControllerForPageAtIndex:v5];

  id v16 = v7;
  id v8 = +[NSArray arrayWithObjects:&v16 count:1];
  uint64_t v9 = [(CRLiOSInsertPageViewController *)self p_pageViewController];
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100150648;
  double v13 = &unk_1014D99B0;
  unsigned int v14 = self;
  id v15 = v5;
  [v9 setViewControllers:v8 direction:(unint64_t)v5 < v3 animated:1 completion:&v10];
  -[CRLiOSInsertPageViewController p_setViewControllers:shouldUpdatePageViewController:animated:](self, "p_setViewControllers:shouldUpdatePageViewController:animated:", v8, 0, 0, v10, v11, v12, v13);
}

- (void)p_setupConstraintsWithTopLevelView:(id)a3 searchBar:(id)a4 navigatorStackView:(id)a5 pageViewControllerView:(id)a6 dotsPageControlWrapper:(id)a7
{
  id v65 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v16 = [v12 leadingAnchor];
    BOOL v17 = [v65 leadingAnchor];
    id v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    BOOL v19 = [v12 trailingAnchor];
    __int16 v20 = [v65 trailingAnchor];
    unsigned int v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    __int16 v22 = [v12 heightAnchor];
    id v23 = [v22 constraintEqualToConstant:44.0];
    [v23 setActive:1];

    id v24 = [v12 topAnchor];
    BOOL v25 = [v65 topAnchor];
    double v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];
  }
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  int v27 = [v14 leadingAnchor];
  double v28 = [v65 leadingAnchor];
  double v29 = [v27 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  id v30 = [v14 trailingAnchor];
  v31 = [v65 trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = [v13 topAnchor];
  id v34 = [v65 topAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  unsigned int v36 = [v13 leadingAnchor];
  v37 = [v65 leadingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [v13 trailingAnchor];
  v40 = [v65 trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [v13 bottomAnchor];
  id v43 = [v14 topAnchor];
  unint64_t v44 = [v42 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [v13 arrangedSubviews];
  id v46 = [v45 count];

  v47 = [v13 heightAnchor];
  v48 = v47;
  double v49 = 44.0;
  if (!v46) {
    double v49 = 0.0;
  }
  double v50 = [v47 constraintEqualToConstant:v49];
  [v50 setActive:1];

  if (v15)
  {
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v51 = [v15 leadingAnchor];
    double v52 = [v65 leadingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    [v53 setActive:1];

    double v54 = [v15 trailingAnchor];
    double v55 = [v65 trailingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    [v56 setActive:1];

    v57 = [v15 heightAnchor];
    [(CRLiOSInsertPageViewController *)self p_dotsPageControlHeight];
    v58 = [v57 constraintEqualToConstant:];

    [v58 setActive:1];
    [(CRLiOSInsertPageViewController *)self setP_dotsPageControlHeightConstraint:v58];
    v59 = [v15 bottomAnchor];
    v60 = [v65 bottomAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];

    v62 = [v14 bottomAnchor];
    v63 = [v15 topAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    [v64 setActive:1];
  }
  else
  {
    v58 = [v14 bottomAnchor];
    v62 = [v65 bottomAnchor];
    v61 = [v58 constraintEqualToAnchor:v62];
  }

  [v61 setActive:1];
  [(CRLiOSInsertPageViewController *)self setP_bottomLayoutConstraintAboveKeyboard:v61];
  if (v15) {
    [(CRLiOSInsertPageViewController *)self p_updateBottomConstraintsIfNeeded];
  }
}

- (void)p_subpageNavigatorDidChangeSelectedSegment:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  id v5 = [v4 selectedSegmentIndex];

  [v6 insertPageViewController:self didSelectSubpageAtIndex:v5];
}

- (unint64_t)p_pageControlType
{
  v2 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerNavigationDataSource];
  id v3 = [v2 pageControlType];

  return (unint64_t)v3;
}

- (double)p_dotsPageControlHeight
{
  unint64_t v2 = [(CRLiOSInsertPageViewController *)self p_pageControlType];
  double result = 0.0;
  if (!v2)
  {
    if (+[UIScreen crl_deviceIsLandscape]
      && +[UIScreen crl_screenClassPhoneUIRegularOrLarge])
    {
      return 39.0;
    }
    else
    {
      return 44.0;
    }
  }
  return result;
}

- (void)p_titlesPageControlValueChanged:(id)a3
{
  id v4 = [a3 selectedTitleIndex];

  [(CRLiOSInsertPageViewController *)self p_selectPageAtIndex:v4];
}

- (void)p_selectPageAtIndex:(unint64_t)a3
{
}

- (void)p_selectPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollToBottom:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  -[CRLiOSInsertPageViewController setP_currentPageNumber:](self, "setP_currentPageNumber:");
  [(CRLiOSInsertPageViewController *)self setP_shouldScrollToBottomOfPage:v5];
  uint64_t v9 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDataSource];
  double v10 = [v9 insertPageViewController:self viewControllerForPageAtIndex:a3];

  if (v10)
  {
    __int16 v20 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v20 count:1];
    [(CRLiOSInsertPageViewController *)self setViewControllers:v11];
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100150F34;
  v16[3] = &unk_1014D9A00;
  v16[4] = self;
  unint64_t v18 = a3;
  BOOL v19 = v6;
  id v12 = v10;
  id v17 = v12;
  id v13 = objc_retainBlock(v16);
  if ([(CRLiOSInsertPageViewController *)self p_isShowingSearchBar])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100151074;
    v14[3] = &unk_1014CE158;
    id v15 = v13;
    [(CRLiOSInsertPageViewController *)self p_setSearchBarHidden:1 animated:v6 completion:v14];
  }
  else
  {
    ((void (*)(void *))v13[2])(v13);
  }
}

- (void)p_updateUIForChangeToPageNumber:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v32 = (void (**)(id, uint64_t))a5;
  id v8 = [(CRLiOSInsertPageViewController *)self view];
  [v8 layoutIfNeeded];

  uint64_t v9 = [(CRLiOSInsertPageViewController *)self p_titlesPageControlScrollView];
  double v10 = [(CRLiOSInsertPageViewController *)self p_titlesPageControl];
  [v10 setSelectedTitleIndex:a3];
  [v9 frame];
  double Width = CGRectGetWidth(v34);
  if (Width != 0.0)
  {
    double v12 = Width;
    id v13 = [v10 selectedButton];
    [v13 frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v35.origin.double x = v15;
    v35.origin.double y = v17;
    v35.size.double width = v19;
    v35.size.double height = v21;
    double v22 = CGRectGetMidX(v35) + v12 * -0.5;
    [v9 contentSize];
    double v24 = v23;
    int v25 = sub_1003E86EC();
    double v26 = v24 - v12;
    double v27 = 0.0;
    double v28 = 14.0;
    if (a3 != 1) {
      double v28 = 0.0;
    }
    double v29 = fmin(fmax(v22, v28), v26);
    double v30 = fmax(v22, 0.0);
    if (a3 == 1) {
      double v27 = -14.0;
    }
    double v31 = fmin(v30, v27 + v26);
    if (!v25) {
      double v31 = v29;
    }
    [v9 setContentOffset:v5 animated:v31];
    if (v32) {
      v32[2](v32, 1);
    }
  }
}

- (id)p_selectedViewController
{
  unint64_t v2 = [(CRLiOSInsertPageViewController *)self viewControllers];
  id v3 = [v2 firstObject];

  return v3;
}

- (void)p_restoreViewState
{
  id v3 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
  unsigned int v4 = [v3 insertPageViewControllerShouldAppearInSearchMode:self];

  if (v4)
  {
    [(CRLiOSInsertPageViewController *)self p_beginSearchingAnimated:0];
    BOOL v5 = [(CRLiOSInsertPageViewController *)self insertPageViewControllerDelegate];
    id v8 = [v5 insertPageViewControllerDefaultSearchTerm:self];

    BOOL v6 = [(CRLiOSInsertPageViewController *)self p_searchBar];
    [v6 setText:v8];

    id v7 = [(CRLiOSInsertPageViewController *)self p_searchBar];
    [(CRLiOSInsertPageViewController *)self searchBar:v7 textDidChange:v8];
  }
}

- (BOOL)crl_isInDarkMode
{
  unint64_t v2 = +[UIScreen mainScreen];
  id v3 = [v2 traitCollection];
  unsigned __int8 v4 = [v3 crl_isUserInterfaceStyleDark];

  return v4;
}

- (void)p_updateTitlesPageControlAndBottomViewColorsInDarkUI:(BOOL)a3
{
  int64_t v4 = [(CRLiOSInsertPageViewController *)self p_searchBarStyleInDarkUI:0];
  BOOL v5 = [(CRLiOSInsertPageViewController *)self p_searchBar];
  [v5 setBarStyle:v4];

  BOOL v6 = +[UIColor clearColor];
  id v7 = [(CRLiOSInsertPageViewController *)self p_searchBar];
  [v7 setBackgroundColor:v6];

  id v8 = +[UIColor clearColor];
  uint64_t v9 = [(CRLiOSInsertPageViewController *)self p_searchButton];
  [v9 setBackgroundColor:v8];

  id v11 = +[UIColor clearColor];
  double v10 = [(CRLiOSInsertPageViewController *)self p_searchButtonSpacerView];
  [v10 setBackgroundColor:v11];
}

- (int64_t)p_searchBarStyleInDarkUI:(BOOL)a3
{
  return a3;
}

- (CRLiOSInsertPageViewControllerDataSource)insertPageViewControllerDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_insertPageViewControllerDataSource);

  return (CRLiOSInsertPageViewControllerDataSource *)WeakRetained;
}

- (void)setInsertPageViewControllerDataSource:(id)a3
{
}

- (CRLiOSInsertPageViewControllerDelegate)insertPageViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_insertPageViewControllerDelegate);

  return (CRLiOSInsertPageViewControllerDelegate *)WeakRetained;
}

- (void)setInsertPageViewControllerDelegate:(id)a3
{
}

- (CRLiOSInsertPageViewControllerNavigationDataSource)insertPageViewControllerNavigationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_insertPageViewControllerNavigationDataSource);

  return (CRLiOSInsertPageViewControllerNavigationDataSource *)WeakRetained;
}

- (void)setInsertPageViewControllerNavigationDataSource:(id)a3
{
}

- (NSString)selectedPageNumberAutosaveName
{
  return self->_selectedPageNumberAutosaveName;
}

- (void)setSelectedPageNumberAutosaveName:(id)a3
{
}

- (NSString)selectedSubpageAutosaveName
{
  return self->_selectedSubpageAutosaveName;
}

- (void)setSelectedSubpageAutosaveName:(id)a3
{
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (unint64_t)p_currentPageNumber
{
  return self->_currentPageNumber;
}

- (void)setP_currentPageNumber:(unint64_t)a3
{
  self->_currentPageNumber = a3;
}

- (UIPageControl)p_dotsPageControl
{
  return self->_dotsPageControl;
}

- (void)setP_dotsPageControl:(id)a3
{
}

- (UIView)p_bottomFadeBar
{
  return self->_bottomFadeBar;
}

- (void)setP_bottomFadeBar:(id)a3
{
}

- (BOOL)p_isInViewHierarchy
{
  return self->_isInViewHierarchy;
}

- (void)setP_isInViewHierarchy:(BOOL)a3
{
  self->_isInViewHierarchdouble y = a3;
}

- (BOOL)p_isShowingSearchBar
{
  return self->_isShowingSearchBar;
}

- (void)setP_isShowingSearchBar:(BOOL)a3
{
  self->_isShowingSearchBar = a3;
}

- (NSLayoutConstraint)p_bottomLayoutConstraintAboveKeyboard
{
  return self->_bottomLayoutConstraintAboveKeyboard;
}

- (void)setP_bottomLayoutConstraintAboveKeyboard:(id)a3
{
}

- (UIPageViewController)p_pageViewController
{
  return self->_pageViewController;
}

- (void)setP_pageViewController:(id)a3
{
}

- (UISearchBar)p_searchBar
{
  return self->_searchBar;
}

- (void)setP_searchBar:(id)a3
{
}

- (UIButton)p_searchButton
{
  return self->_searchButton;
}

- (void)setP_searchButton:(id)a3
{
}

- (UIView)p_searchButtonSpacerView
{
  return self->_searchButtonSpacerView;
}

- (void)setP_searchButtonSpacerView:(id)a3
{
}

- (UIView)p_searchOverlayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchOverlayView);

  return (UIView *)WeakRetained;
}

- (void)setP_searchOverlayView:(id)a3
{
}

- (UIViewController)p_searchViewController
{
  return self->_searchViewController;
}

- (void)setP_searchViewController:(id)a3
{
}

- (CRLiOSMultipaneSegmentedControl)p_subpageNavigator
{
  return self->_subpageNavigator;
}

- (void)setP_subpageNavigator:(id)a3
{
}

- (CRLiOSInsertPageViewControllerTitlesPageControl)p_titlesPageControl
{
  return self->_titlesPageControl;
}

- (void)setP_titlesPageControl:(id)a3
{
}

- (UIView)p_titlesPageControlBottomBorder
{
  return self->_titlesPageControlBottomBorder;
}

- (void)setP_titlesPageControlBottomBorder:(id)a3
{
}

- (NSLayoutConstraint)p_dotsPageControlHeightConstraint
{
  return self->_dotsPageControlHeightConstraint;
}

- (void)setP_dotsPageControlHeightConstraint:(id)a3
{
}

- (UIScrollView)p_titlesPageControlScrollView
{
  return self->_titlesPageControlScrollView;
}

- (void)setP_titlesPageControlScrollView:(id)a3
{
}

- (BOOL)p_shouldUpdatePageSelectionOnNextLayoutSubviews
{
  return self->_shouldUpdatePageSelectionOnNextLayoutSubviews;
}

- (void)setP_shouldUpdatePageSelectionOnNextLayoutSubviews:(BOOL)a3
{
  self->_shouldUpdatePageSelectionOnNextLayoutSubviews = a3;
}

- (BOOL)p_didExplicitlyCancelSearch
{
  return self->_didExplicitlyCancelSearch;
}

- (void)setP_didExplicitlyCancelSearch:(BOOL)a3
{
  self->_didExplicitlyCancelSearch = a3;
}

- (BOOL)p_shouldIgnoreCancelBecauseOfWriting
{
  return self->_shouldIgnoreCancelBecauseOfWriting;
}

- (void)setP_shouldIgnoreCancelBecauseOfWriting:(BOOL)a3
{
  self->_shouldIgnoreCancelBecauseOfWriting = a3;
}

- (BOOL)p_shouldScrollToBottomOfPage
{
  return self->_p_shouldScrollToBottomOfPage;
}

- (void)setP_shouldScrollToBottomOfPage:(BOOL)a3
{
  self->_p_shouldScrollToBottomOfPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesPageControlScrollView, 0);
  objc_storeStrong((id *)&self->_dotsPageControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titlesPageControlBottomBorder, 0);
  objc_storeStrong((id *)&self->_titlesPageControl, 0);
  objc_storeStrong((id *)&self->_subpageNavigator, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_destroyWeak((id *)&self->_searchOverlayView);
  objc_storeStrong((id *)&self->_searchButtonSpacerView, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_bottomLayoutConstraintAboveKeyboard, 0);
  objc_storeStrong((id *)&self->_bottomFadeBar, 0);
  objc_storeStrong((id *)&self->_dotsPageControl, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_selectedSubpageAutosaveName, 0);
  objc_storeStrong((id *)&self->_selectedPageNumberAutosaveName, 0);
  objc_destroyWeak((id *)&self->_insertPageViewControllerNavigationDataSource);
  objc_destroyWeak((id *)&self->_insertPageViewControllerDelegate);

  objc_destroyWeak((id *)&self->_insertPageViewControllerDataSource);
}

@end