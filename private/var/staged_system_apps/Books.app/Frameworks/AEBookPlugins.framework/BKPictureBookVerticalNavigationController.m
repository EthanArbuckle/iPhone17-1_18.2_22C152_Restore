@interface BKPictureBookVerticalNavigationController
- (AEBookInfo)book;
- (BKPictureBookNavigationDelegate)delegate;
- (BOOL)_allowZoom;
- (BOOL)_bookRenditionFlowIsScrolledContinuous;
- (BOOL)_isRTL;
- (BOOL)_pageViewShouldHaveRoundedCorners;
- (BOOL)allowDoubleTapToZoom;
- (BOOL)animating;
- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPastEndOfBook:(CGPoint)a3;
- (BOOL)isZoomedOut;
- (BOOL)preferredPageNumberHUDVisibility;
- (BOOL)shouldDisplaySpread;
- (CGPoint)contentOffsetToScrollToForPageNumber:(int64_t)a3;
- (CGPoint)originForPageNumber:(int64_t)a3;
- (CGPoint)originForPageNumber:(int64_t)a3 pagesContainerSize:(CGSize)a4 isSpread:(BOOL)a5;
- (CGRect)frameForPageNumber:(int64_t)a3;
- (CGSize)_lastScrollViewSizeLayoutWasGeneratedFor;
- (CGSize)pageSize;
- (NSArray)_positionForPages;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)doubleTapGesture;
- (UIView)pagesContainerView;
- (_NSRange)visiblePages;
- (double)_spaceBetweenPages;
- (double)rawPageNumberForOffset:(CGPoint)a3 pageFraction:(double)a4;
- (id)_setupPageNumber:(int64_t)a3;
- (id)contentView;
- (id)pageViews;
- (id)snapshotCurrentPageInContext;
- (id)viewForPageNumber:(int64_t)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)currentPageNumber;
- (int64_t)pageNumberAtContentOffset:(CGPoint)a3;
- (int64_t)pageNumberBeforeTransition;
- (void)_applyAdditionalScale:(id)a3;
- (void)_displayPagesForOffset:(int64_t)a3;
- (void)_generateLeftPageImageAtPageOffset:(int64_t)a3 completion:(id)a4;
- (void)_generateRightPageImageAtPageOffset:(int64_t)a3 completion:(id)a4;
- (void)_setPageOffsetUncheckedImmediate:(int64_t)a3;
- (void)_setupGestures;
- (void)_setupScrollView;
- (void)_setupScrollView:(BOOL)a3;
- (void)_teardownPageNumber:(int64_t)a3;
- (void)_updatePages;
- (void)adjustToNewSize:(CGSize)a3;
- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5;
- (void)contentViewImage:(BOOL)a3 completion:(id)a4;
- (void)doubleTapGestureHandler:(id)a3;
- (void)generatePositionForAllPages:(id)a3;
- (void)resetZoomScale;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowDoubleTapToZoom:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setBook:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapGesture:(id)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageNumberBeforeTransition:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3 completion:(id)a4;
- (void)setPageSize:(CGSize)a3;
- (void)setPagesContainerView:(id)a3;
- (void)setPreferredPageNumberHUDVisibility:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setZoomScale:(double)a3;
- (void)set_lastScrollViewSizeLayoutWasGeneratedFor:(CGSize)a3;
- (void)set_positionForPages:(id)a3;
- (void)tapGestureHandler:(id)a3;
- (void)turnToNextPage;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)turnToPreviousPage;
- (void)updateContentInsets;
- (void)updateLocationIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKPictureBookVerticalNavigationController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookVerticalNavigationController;
  [(BKPictureBookVerticalNavigationController *)&v4 viewDidLoad];
  [(BKPictureBookVerticalNavigationController *)self setPageNumberBeforeTransition:0x7FFFFFFFFFFFFFFFLL];
  [(BKPictureBookVerticalNavigationController *)self _setupScrollView];
  [(BKPictureBookVerticalNavigationController *)self _setupGestures];
  if ([(BKPageNavigationViewController *)self pageOffset] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKPictureBookVerticalNavigationController *)self _displayPagesForOffset:[(BKPageNavigationViewController *)self pageOffset]];
    v3 = [(BKPictureBookVerticalNavigationController *)self delegate];
    [v3 pageNavigationDidChangeLocation:self];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKPictureBookVerticalNavigationController;
  [(BKPictureBookVerticalNavigationController *)&v11 viewIsAppearing:a3];
  objc_super v4 = [(BKPictureBookVerticalNavigationController *)self delegate];
  v5 = [v4 transitionLocationForNavigationController];

  v6 = [(BKPictureBookVerticalNavigationController *)self currentPageNumber];
  objc_opt_class();
  BUDynamicCast();
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = _AECaptureLocationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "#PictureBookVerticalNVC viewWillAppear using location:%@", buf, 0xCu);
    }

    id v9 = [v7 ordinal];
    v6 = (char *)[v7 pageOffset] + (void)v9 + 1;
  }
  v10 = _AECaptureLocationLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "#PictureBookVerticalNVC viewWillAppear transitioning to page number: %lu", buf, 0xCu);
  }

  [(BKPictureBookVerticalNavigationController *)self setPageNumberBeforeTransition:v6];
  [(BKPictureBookVerticalNavigationController *)self _setupScrollView];
  [(BKPictureBookVerticalNavigationController *)self _displayPagesForOffset:(char *)[(BKPictureBookVerticalNavigationController *)self pageNumberBeforeTransition]- 1];
  [(BKPictureBookVerticalNavigationController *)self setPageNumberBeforeTransition:0x7FFFFFFFFFFFFFFFLL];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookVerticalNavigationController;
  [(BKPictureBookVerticalNavigationController *)&v4 viewDidAppear:a3];
  [(BKPictureBookVerticalNavigationController *)self updateContentInsets];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [(BKPictureBookVerticalNavigationController *)self delegate];
  unsigned int v9 = [v8 inLiveResize];

  if (v9) {
    [(BKPictureBookVerticalNavigationController *)self setPageNumberBeforeTransition:[(BKPictureBookVerticalNavigationController *)self currentPageNumber]];
  }
  if ([(BKPictureBookVerticalNavigationController *)self isVisible])
  {
    v10 = [(BKPictureBookVerticalNavigationController *)self delegate];
    unsigned __int8 v11 = [v10 inLiveResize];

    if ((v11 & 1) == 0)
    {
      [(BKPictureBookVerticalNavigationController *)self setAnimating:1];
      [(BKPictureBookVerticalNavigationController *)self setPageNumberBeforeTransition:[(BKPictureBookVerticalNavigationController *)self currentPageNumber]];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v12 = [(BKPictureBookVerticalNavigationController *)self pageViews];
      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v18 = [v17 pageNumber];
            if (v18 == (id)[(BKPictureBookVerticalNavigationController *)self pageNumberBeforeTransition])
            {
              v19 = [v17 pageScrollerPageView];
              [v19 setScrollState:3];
            }
            else
            {
              [v17 setAlpha:0.0];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }

      v21[4] = self;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FA274;
      v22[3] = &unk_1DAA18;
      v22[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FA2C0;
      v21[3] = &unk_1DAA18;
      [v7 animateAlongsideTransition:v22 completion:v21];
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPictureBookVerticalNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookVerticalNavigationController;
  [(BKPictureBookVerticalNavigationController *)&v3 viewSafeAreaInsetsDidChange];
  [(BKPictureBookVerticalNavigationController *)self updateContentInsets];
}

- (id)pageViews
{
  v2 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
  objc_super v3 = [v2 subviews];
  objc_super v4 = +[NSPredicate predicateWithBlock:&stru_1DDD50];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (void)updateContentInsets
{
  objc_super v3 = [(BKPictureBookVerticalNavigationController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  v6 = [(BKPictureBookVerticalNavigationController *)self view];
  [v6 safeAreaInsets];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v5, 0.0);

  [(UIScrollView *)self->_scrollView contentOffset];
  double v8 = v7;
  [(UIScrollView *)self->_scrollView contentInset];
  if (v8 < v9)
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    double v11 = v10;
    [(UIScrollView *)self->_scrollView contentInset];
    scrollView = self->_scrollView;
    -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", v11, -v12);
  }
}

- (void)_setupGestures
{
  objc_super v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"doubleTapGestureHandler:"];
  doubleTapGesture = self->_doubleTapGesture;
  self->_doubleTapGesture = v3;

  [(UITapGestureRecognizer *)self->_doubleTapGesture setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)self->_doubleTapGesture setDelegate:self];
  double v5 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  v6 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];
  [v5 addGestureRecognizer:v6];

  id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapGestureHandler:"];
  if (self->_doubleTapGesture) {
    [v8 requireGestureRecognizerToFail:];
  }
  double v7 = [(BKPictureBookVerticalNavigationController *)self view];
  [v7 addGestureRecognizer:v8];
}

- (void)tapGestureHandler:(id)a3
{
  double v4 = [(BKPictureBookVerticalNavigationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(BKPictureBookVerticalNavigationController *)self delegate];
    [v6 contentView:unhandledClickAtPoint:0, CGPointZero.x, CGPointZero.y];
  }
}

- (void)setAllowDoubleTapToZoom:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_allowDoubleTapToZoom != a3) {
    self->_allowDoubleTapToZoom = a3;
  }
  id v4 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];
  [v4 setEnabled:v3];
}

- (void)doubleTapGestureHandler:(id)a3
{
  id v18 = a3;
  id v4 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v4 zoomScale];
  double v6 = v5;

  double v7 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  id v8 = v7;
  if (v6 <= 1.0)
  {
    [v18 locationInView:v7];
    double v10 = v9;
    double v12 = v11;

    [(BKPictureBookVerticalNavigationController *)self pageSize];
    double v14 = v13 * 0.5;
    [(BKPictureBookVerticalNavigationController *)self pageSize];
    double v16 = v15 * 0.5;
    double v17 = v10 - v15 * 0.5 * 0.5;
    id v8 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v8 zoomToRect:1, v17, v12 - v14 * 0.5, v16, v14];
  }
  else
  {
    [v7 setZoomScale:1];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];

  return v5 == v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];

  if (v8 == v7)
  {
    char v10 = 1;
  }
  else
  {
    id v9 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];
    char v10 = v9 == v6;
  }
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];

  if (v8 == v7) {
    unsigned __int8 v9 = [v6 bk_isWKSyntheticTapGestureRecognizer];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKPictureBookVerticalNavigationController *)self doubleTapGesture];
  if ((id)v8 == v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      LOBYTE(v10) = 1;
      goto LABEL_5;
    }
    id v9 = v7;
    if ([v9 numberOfTapsRequired] == (char *)&dword_0 + 2)
    {
      unsigned int v10 = [v9 matchesTarget:[UIView be_wkContentViewClass] andAction:_nonBlockingDoubleTapRecognized:];
      goto LABEL_4;
    }
  }
  else
  {
    id v9 = (id)v8;
  }
  LOBYTE(v10) = 1;
LABEL_4:

LABEL_5:
  return v10;
}

- (void)setZoomScale:(double)a3
{
  if (a3 < 1.0)
  {
    id v5 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v5 setMinimumZoomScale:a3];
  }
  if (a3 > 3.0)
  {
    id v6 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v6 setMaximumZoomScale:a3];
  }
  self->_scrollViewIsZooming = 1;
  id v7 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v7 setZoomScale:a3];

  self->_scrollViewIsZooming = 0;
}

- (void)resetZoomScale
{
  BOOL v3 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v3 setMinimumZoomScale:1.0];

  if ([(BKPictureBookVerticalNavigationController *)self _allowZoom])
  {
    if ([(BKPictureBookVerticalNavigationController *)self isViewLoaded]
      && ([(BKPictureBookVerticalNavigationController *)self book],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      id v5 = [(BKPictureBookVerticalNavigationController *)self book];
      id v6 = [v5 firstDocument];
      [v6 fixedLayoutSize];
      double v8 = v7;

      [(BKPictureBookVerticalNavigationController *)self pageSize];
      double v10 = fmax(v8 / v9, 1.0) * 1.5;
      double v11 = [(BKPictureBookVerticalNavigationController *)self scrollView];
      double v12 = v11;
      double v13 = v10;
    }
    else
    {
      double v11 = [(BKPictureBookVerticalNavigationController *)self scrollView];
      double v12 = v11;
      double v13 = 3.0;
    }
  }
  else
  {
    double v11 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    double v12 = v11;
    double v13 = 1.0;
  }
  [v11 setMaximumZoomScale:v13];

  self->_scrollViewIsZooming = 1;
  double v14 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  double v15 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v15 minimumZoomScale];
  [v14 setZoomScale:];

  if ((unint64_t)[(BKPictureBookVerticalNavigationController *)self currentPageNumber] <= 1)
  {
    double y = CGPointZero.y;
    double v17 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v17 setContentOffset:CGPointZero.x, y];
  }
  self->_scrollViewIsZooming = 0;
}

- (void)adjustToNewSize:(CGSize)a3
{
  [(BKPictureBookVerticalNavigationController *)self _setupScrollView];
  if ([(BKPictureBookVerticalNavigationController *)self pageNumberBeforeTransition] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKPictureBookVerticalNavigationController *)self _updatePages];
  }
  else
  {
    [(BKPictureBookVerticalNavigationController *)self _displayPagesForOffset:(char *)[(BKPictureBookVerticalNavigationController *)self pageNumberBeforeTransition]- 1];
    [(BKPictureBookVerticalNavigationController *)self setPageNumberBeforeTransition:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)_setupScrollView
{
}

- (void)_setupScrollView:(BOOL)a3
{
  id v5 = [(BKPictureBookVerticalNavigationController *)self view];
  id v6 = [v5 window];

  if (!v6)
  {
    double v7 = [(BKPictureBookVerticalNavigationController *)self delegate];
    [v7 desiredBoundsForNavigationController];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(BKPictureBookVerticalNavigationController *)self view];
    [v16 setFrame:v9, v11, v13, v15];
  }
  double v17 = +[UIColor clearColor];
  id v18 = [(BKPictureBookVerticalNavigationController *)self view];
  [v18 setBackgroundColor:v17];

  if (a3)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_super v20 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    if (v20)
    {
      v21 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
      if (v21)
      {
        v22 = [(BKPictureBookVerticalNavigationController *)self view];
        [v22 bounds];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        v31 = [(BKPictureBookVerticalNavigationController *)self scrollView];
        [v31 frame];
        v69.origin.x = v32;
        v69.origin.double y = v33;
        v69.size.double width = v34;
        v69.size.double height = v35;
        v66.origin.x = v24;
        v66.origin.double y = v26;
        v66.size.double width = v28;
        v66.size.double height = v30;
        BOOL v19 = !CGRectEqualToRect(v66, v69);
      }
      else
      {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  v36 = [(BKPictureBookVerticalNavigationController *)self scrollView];

  if (v36)
  {
    [(BKPictureBookVerticalNavigationController *)self resetZoomScale];
  }
  else
  {
    id v37 = objc_alloc((Class)UIScrollView);
    v38 = [(BKPictureBookVerticalNavigationController *)self view];
    [v38 bounds];
    v39 = [v37 initWithFrame:];
    scrollView = self->_scrollView;
    self->_scrollView = v39;

    [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)self->_scrollView setMinimumZoomScale:1.0];
    unsigned int v41 = [(BKPictureBookVerticalNavigationController *)self _allowZoom];
    double v42 = 3.0;
    if (!v41) {
      double v42 = 1.0;
    }
    [(UIScrollView *)self->_scrollView setMaximumZoomScale:v42];
    v43 = +[UIColor clearColor];
    [(UIScrollView *)self->_scrollView setBackgroundColor:v43];

    [(UIScrollView *)self->_scrollView setDelegate:self];
    v44 = [(BKPictureBookVerticalNavigationController *)self view];
    [v44 addSubview:self->_scrollView];
  }
  [(BKPictureBookVerticalNavigationController *)self updateContentInsets];
  v45 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];

  if (v45)
  {
    if (!v19) {
      return;
    }
  }
  else
  {
    id v46 = objc_alloc((Class)UIView);
    [(UIScrollView *)self->_scrollView bounds];
    v47 = [v46 initWithFrame:];
    pagesContainerView = self->_pagesContainerView;
    self->_pagesContainerView = v47;

    v49 = +[UIColor clearColor];
    [(UIView *)self->_pagesContainerView setBackgroundColor:v49];

    [(UIScrollView *)self->_scrollView addSubview:self->_pagesContainerView];
    if (!v19) {
      return;
    }
  }
  if ([(BKPageNavigationViewController *)self pageCount] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v50 = [(BKPictureBookVerticalNavigationController *)self view];
    [v50 bounds];
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    v59 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v59 setFrame:v52, v54, v56, v58];

    v60 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v60 bounds];
    double Width = CGRectGetWidth(v67);
    v62 = [(BKPictureBookVerticalNavigationController *)self scrollView];
    [v62 bounds];
    double Height = CGRectGetHeight(v68);
    v64 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
    [v64 setFrame:CGRectMake(0.0, 0.0, Width, Height)];

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_FB480;
    v65[3] = &unk_1DC500;
    v65[4] = self;
    v65[5] = [(BKPageNavigationViewController *)self pageCount];
    [(BKPictureBookVerticalNavigationController *)self generatePositionForAllPages:v65];
  }
}

- (BOOL)shouldDisplaySpread
{
  if (![(BKPictureBookVerticalNavigationController *)self isViewLoaded]) {
    return 0;
  }
  BOOL v3 = [(BKPictureBookVerticalNavigationController *)self book];
  id v4 = [v3 firstDocument];
  [v4 fixedLayoutSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(BKPictureBookVerticalNavigationController *)self view];
  [v9 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v22.origin.x = v11;
  v22.origin.double y = v13;
  v22.size.double width = v15;
  v22.size.double height = v17;
  double Width = CGRectGetWidth(v22);
  v23.origin.x = v11;
  v23.origin.double y = v13;
  v23.size.double width = v15;
  v23.size.double height = v17;
  if (Width <= CGRectGetHeight(v23) || v6 > v8) {
    return 0;
  }
  BOOL v19 = [(BKPictureBookVerticalNavigationController *)self delegate];
  unsigned __int8 v20 = [v19 supportsSpreadForVerticalLayout];

  return v20;
}

- (int64_t)currentPageNumber
{
  if (!self->_scrollView) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v3 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v3 contentOffset];
  int64_t v4 = -[BKPictureBookVerticalNavigationController pageNumberAtContentOffset:](self, "pageNumberAtContentOffset:");

  return v4;
}

- (int64_t)pageNumberAtContentOffset:(CGPoint)a3
{
  -[BKPictureBookVerticalNavigationController rawPageNumberForOffset:pageFraction:](self, "rawPageNumberForOffset:pageFraction:", a3.x, a3.y, 2.0);
  uint64_t v5 = (uint64_t)v4;
  unsigned int v6 = [(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread];
  uint64_t v7 = 2 * v5;
  if (!v6) {
    uint64_t v7 = v5 + 1;
  }
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  int64_t result = [(BKPageNavigationViewController *)self pageCount];
  if (v8 < result) {
    return v8;
  }
  return result;
}

- (double)rawPageNumberForOffset:(CGPoint)a3 pageFraction:(double)a4
{
  double y = a3.y;
  uint64_t v7 = [(BKPictureBookVerticalNavigationController *)self book];
  double v8 = 1.0;
  if (v7)
  {
    double v9 = (void *)v7;
    double v10 = [(BKPictureBookVerticalNavigationController *)self scrollView];

    if (v10)
    {
      [(BKPictureBookVerticalNavigationController *)self pageSize];
      double v12 = v11;
      CGFloat v13 = [(BKPictureBookVerticalNavigationController *)self scrollView];
      [v13 zoomScale];
      if (v14 == 0.0)
      {
        double v17 = 1.0;
      }
      else
      {
        CGFloat v15 = [(BKPictureBookVerticalNavigationController *)self scrollView];
        [v15 zoomScale];
        double v17 = v16;
      }
      [(BKPictureBookVerticalNavigationController *)self _spaceBetweenPages];
      double v19 = v12 + v18;
      unsigned __int8 v20 = [(BKPictureBookVerticalNavigationController *)self scrollView];
      [v20 bounds];
      double v8 = (y / v17 + CGRectGetHeight(v22) / a4) / v19;
    }
  }
  return v8;
}

- (BOOL)isPastEndOfBook:(CGPoint)a3
{
  -[BKPictureBookVerticalNavigationController rawPageNumberForOffset:pageFraction:](self, "rawPageNumberForOffset:pageFraction:", a3.x, a3.y, 1.0);
  double v5 = v4;
  unsigned int v6 = [(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread];
  uint64_t v7 = [(BKPageNavigationViewController *)self pageCount];
  if (v6) {
    double v8 = round((double)(v7 + 1) * 0.5);
  }
  else {
    double v8 = (double)v7;
  }
  return v5 - v8 > 0.1;
}

- (_NSRange)visiblePages
{
  if (self->_scrollView)
  {
    int64_t v3 = [(BKPictureBookVerticalNavigationController *)self currentPageNumber];
    if ([(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread] && v3 > 1) {
      NSUInteger v4 = 2;
    }
    else {
      NSUInteger v4 = 1;
    }
  }
  else
  {
    NSUInteger v4 = 0;
    int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (id)contentView
{
  int64_t v3 = [(BKPictureBookVerticalNavigationController *)self currentPageNumber];

  return [(BKPictureBookVerticalNavigationController *)self viewForPageNumber:v3];
}

- (CGSize)pageSize
{
  int64_t v3 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  p_pageSize = &self->_pageSize;
  BOOL v9 = self->_pageSize.width == CGSizeZero.width && self->_pageSize.height == CGSizeZero.height;
  if (!v9
    && (([(BKPictureBookVerticalNavigationController *)self _lastScrollViewSizeLayoutWasGeneratedFor], v5 == v11)? (BOOL v12 = v7 == v10): (BOOL v12 = 0), v12))
  {
    double width = p_pageSize->width;
    double height = self->_pageSize.height;
  }
  else
  {
    -[BKPictureBookVerticalNavigationController set_lastScrollViewSizeLayoutWasGeneratedFor:](self, "set_lastScrollViewSizeLayoutWasGeneratedFor:", v5, v7);
    CGFloat v13 = [(BKPictureBookVerticalNavigationController *)self book];
    double v14 = [v13 firstDocument];
    [v14 fixedLayoutSize];

    [(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread];
    CGSizeScaledToFitInSize();
    double v17 = v15 / v16;
    double width = ceil(v15);
    double height = floor(width / v17);
    p_pageSize->double width = width;
    self->_pageSize.double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)viewForPageNumber:(int64_t)a3
{
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
  {
    int64_t v3 = 0;
    goto LABEL_11;
  }
  int64_t v6 = a3 + 5000;
  [(BKPictureBookVerticalNavigationController *)self pageSize];
  double v8 = v7;
  double v10 = v9;
  [(BKPictureBookVerticalNavigationController *)self originForPageNumber:a3];
  double v12 = v11;
  double v14 = v13;
  int64_t v3 = [(UIView *)self->_pagesContainerView viewWithTag:v6];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_FBD38;
  v22[3] = &unk_1DDD78;
  v22[4] = self;
  void v22[5] = a3;
  double v15 = objc_retainBlock(v22);
  if (!v3)
  {
    unsigned __int8 v20 = _AEWKPictureBookLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v24 = a3;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Creating View for page %lu", buf, 0xCu);
    }

    int64_t v3 = -[BKPictureBookPageContainerView initWithFrame:]([BKPictureBookPageContainerView alloc], "initWithFrame:", v12, v14, v8, v10);
    [(BKPictureBookPageContainerView *)v3 setPageNumber:a3];
    [(BKPictureBookPageContainerView *)v3 setUseRoundedCornerRadius:[(BKPictureBookVerticalNavigationController *)self _pageViewShouldHaveRoundedCorners]];
    [(BKPictureBookPageContainerView *)v3 setAutoresizingMask:0];
    [(BKPictureBookPageContainerView *)v3 setTag:v6];
    goto LABEL_9;
  }
  [(BKPictureBookPageContainerView *)v3 frame];
  v27.origin.x = v16;
  v27.origin.double y = v17;
  v27.size.double width = v18;
  v27.size.double height = v19;
  v26.origin.x = v12;
  v26.origin.double y = v14;
  v26.size.double width = v8;
  v26.size.double height = v10;
  if (!CGRectEqualToRect(v26, v27))
  {
    -[BKPictureBookPageContainerView setFrame:](v3, "setFrame:", v12, v14, v8, v10);
LABEL_9:
    ((void (*)(void *, BKPictureBookPageContainerView *))v15[2])(v15, v3);
  }

LABEL_11:

  return v3;
}

- (CGRect)frameForPageNumber:(int64_t)a3
{
  [(BKPictureBookVerticalNavigationController *)self pageSize];
  double v6 = v5;
  double v8 = v7;
  [(BKPictureBookVerticalNavigationController *)self originForPageNumber:a3];
  double v11 = v6;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.x = v9;
  return result;
}

- (void)generatePositionForAllPages:(id)a3
{
  id v27 = a3;
  double v4 = [(BKPictureBookVerticalNavigationController *)self _positionForPages];
  if (![v4 count])
  {
    int64_t v14 = [(BKPageNavigationViewController *)self pageCount];

    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  double v5 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  [(BKPictureBookVerticalNavigationController *)self _lastScrollViewSizeLayoutWasGeneratedFor];
  if (v7 == v11 && v9 == v10)
  {

LABEL_14:
    goto LABEL_15;
  }
  int64_t v13 = [(BKPageNavigationViewController *)self pageCount];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    double v15 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    BOOL v20 = [(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread];
    double v4 = +[NSMutableArray arrayWithCapacity:[(BKPageNavigationViewController *)self pageCount]];
    int64_t v21 = [(BKPageNavigationViewController *)self pageCount];
    if (v21 != -1)
    {
      uint64_t v22 = 0;
      int64_t v23 = v21 + 1;
      do
      {
        -[BKPictureBookVerticalNavigationController originForPageNumber:pagesContainerSize:isSpread:](self, "originForPageNumber:pagesContainerSize:isSpread:", v22, v20, v17, v19);
        int64_t v24 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:");
        [v4 addObject:v24];

        ++v22;
      }
      while (v23 != v22);
    }
    [(BKPictureBookVerticalNavigationController *)self set_positionForPages:v4];
    goto LABEL_14;
  }
LABEL_15:
  id v25 = objc_retainBlock(v27);
  CGRect v26 = v25;
  if (v25) {
    (*((void (**)(id))v25 + 2))(v25);
  }
}

- (CGPoint)originForPageNumber:(int64_t)a3 pagesContainerSize:(CGSize)a4 isSpread:(BOOL)a5
{
  BOOL v5 = a5;
  double width = a4.width;
  double v9 = [(BKPictureBookVerticalNavigationController *)self book];
  unsigned int v10 = [v9 bkPageProgressionDirection];

  [(BKPictureBookVerticalNavigationController *)self pageSize];
  double v13 = v12;
  if (v5)
  {
    if (((a3 ^ (v10 != 1)) & 1) == 0) {
      double v11 = 0.0;
    }
    double v14 = width * 0.5 - v11;
    [(BKPictureBookVerticalNavigationController *)self _spaceBetweenPages];
    if (a3 >= 0) {
      int64_t v16 = a3;
    }
    else {
      int64_t v16 = a3 + 1;
    }
    uint64_t v17 = v16 >> 1;
  }
  else
  {
    if (a3 <= 1) {
      int64_t v18 = 1;
    }
    else {
      int64_t v18 = a3;
    }
    uint64_t v17 = v18 - 1;
    double v14 = (width - v11) * 0.5;
    [(BKPictureBookVerticalNavigationController *)self _spaceBetweenPages];
  }
  double v19 = (v13 + v15) * (double)v17;
  double v20 = v14;
  result.double y = v19;
  result.x = v20;
  return result;
}

- (CGPoint)originForPageNumber:(int64_t)a3
{
  BOOL v5 = [(BKPictureBookVerticalNavigationController *)self _positionForPages];
  id v6 = [v5 count];

  double v7 = [(BKPictureBookVerticalNavigationController *)self _positionForPages];

  if (v7 && (uint64_t)v6 > a3)
  {
    unint64_t v8 = a3 & ~(a3 >> 63);
    double v9 = [(BKPictureBookVerticalNavigationController *)self _positionForPages];
    unsigned int v10 = (char *)[v9 count] - 1;

    if (v8 >= (unint64_t)v10) {
      double v11 = v10;
    }
    else {
      double v11 = (char *)v8;
    }
    double v12 = [(BKPictureBookVerticalNavigationController *)self _positionForPages];
    double v13 = [v12 objectAtIndexedSubscript:v11];
  }
  else
  {
    double v14 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    -[BKPictureBookVerticalNavigationController originForPageNumber:pagesContainerSize:isSpread:](self, "originForPageNumber:pagesContainerSize:isSpread:", a3, [(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread], v16, v18);
    v27[0] = v19;
    v27[1] = v20;
    double v13 = +[NSValue valueWithBytes:v27 objCType:"{CGPoint=dd}"];
  }
  [v13 CGPointValue];
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double y = v26;
  result.x = v25;
  return result;
}

- (id)snapshotCurrentPageInContext
{
  v2 = [(BKPictureBookVerticalNavigationController *)self viewForPageNumber:[(BKPictureBookVerticalNavigationController *)self currentPageNumber]];
  [v2 bounds];
  if (v3 <= 0.0 || (double v5 = v4, v4 <= 0.0))
  {
    double v7 = _AEWKPictureBookLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Snapshotting a CGSizeZero view", v11, 2u);
    }
    double v9 = 0;
  }
  else
  {
    double v6 = v3;
    double v7 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v8 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v7 format:v6];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_FC3B8;
    v12[3] = &unk_1DDDA0;
    id v13 = v2;
    double v9 = [v8 imageWithActions:v12];
  }

  return v9;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
}

- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5
{
  double v6 = (BKPictureBookView *)a5;
  if ([(BKPictureBookVerticalNavigationController *)self shouldDisplaySpread])
  {
    double v7 = objc_alloc_init(BKPictureBookView);
    [(BKPictureBookVerticalNavigationController *)self pageSize];
    -[BKPictureBookView setContentSize:](v7, "setContentSize:");
    [(BKPictureBookView *)v7 setDrawsSpine:1];
    [(BKPictureBookVerticalNavigationController *)self pageSize];
    +[BKPictureBookView actualSizeForContentSize:drawsSpine:](BKPictureBookView, "actualSizeForContentSize:drawsSpine:", 1);
    CGRectMakeWithSize();
    -[BKPictureBookView setFrame:](v7, "setFrame:");
    id v8 = (char *)[(BKPictureBookVerticalNavigationController *)self currentPageNumber] - 1;
    double v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    void v27[2] = sub_FC6F0;
    v27[3] = &unk_1DDDC8;
    unsigned int v10 = v7;
    CGFloat v28 = v10;
    double v29 = self;
    double v11 = v9;
    CGFloat v30 = v11;
    [(BKPictureBookVerticalNavigationController *)self _generateLeftPageImageAtPageOffset:v8 completion:v27];
    dispatch_group_enter(v11);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_FC748;
    v23[3] = &unk_1DDDC8;
    double v12 = v10;
    double v24 = v12;
    double v25 = self;
    double v26 = v11;
    id v13 = v11;
    [(BKPictureBookVerticalNavigationController *)self _generateRightPageImageAtPageOffset:v8 completion:v23];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_FC7A0;
    block[3] = &unk_1DB3F0;
    double v21 = v12;
    double v22 = v6;
    double v14 = v6;
    double v15 = v12;
    dispatch_group_notify(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    double v16 = [(BKPictureBookVerticalNavigationController *)self delegate];
    int64_t v17 = [(BKPictureBookVerticalNavigationController *)self currentPageNumber];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_FC91C;
    v18[3] = &unk_1DAE08;
    uint64_t v19 = v6;
    id v13 = v6;
    [v16 pageNavigationSnapshotForPageNumber:v17 completion:v18];

    double v15 = v19;
  }
}

- (void)_generateLeftPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:a3];
  id v8 = [(BKPictureBookVerticalNavigationController *)self delegate];
  [v8 pageNavigationSnapshotForPageNumber:v7 completion:v6];
}

- (void)_generateRightPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:a3];
  id v8 = [(BKPictureBookVerticalNavigationController *)self delegate];
  [v8 pageNavigationSnapshotForPageNumber:v7 completion:v6];
}

- (void)setPageCount:(int64_t)a3
{
  int64_t v5 = [(BKPageNavigationViewController *)self pageCount];
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookVerticalNavigationController;
  [(BKPageNavigationViewController *)&v6 setPageCount:a3];
  if (v5 != a3)
  {
    if ([(BKPictureBookVerticalNavigationController *)self isViewLoaded])
    {
      [(BKPictureBookVerticalNavigationController *)self _setupScrollView:1];
      [(BKPictureBookVerticalNavigationController *)self _updatePages];
    }
  }
}

- (void)setPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = a3 & ~(a3 >> 63);
  int64_t v8 = [(BKPageNavigationViewController *)self pageCount];
  if (v7 >= v8 - 1) {
    int64_t v7 = v8 - 1;
  }
  if (v7 == self->super._pageOffset)
  {
    id v9 = objc_retainBlock(v6);
    unsigned int v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_FCC54;
    v14[3] = &unk_1DDDF0;
    v14[4] = self;
    int64_t v16 = v7;
    id v15 = v6;
    double v11 = objc_retainBlock(v14);
    double v12 = [(BKPictureBookVerticalNavigationController *)self delegate];
    unsigned __int8 v13 = [v12 pageNavigationController:self shouldDelayChangeToPageOffset:v7 completion:v11];

    if ((v13 & 1) == 0) {
      ((void (*)(void *))v11[2])(v11);
    }
  }
}

- (void)setPageOffset:(int64_t)a3
{
}

- (void)_setPageOffsetUncheckedImmediate:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPageNavigationViewController setPageOffset:](&v6, "setPageOffset:");
  if ([(BKPictureBookVerticalNavigationController *)self isViewLoaded])
  {
    [(BKPictureBookVerticalNavigationController *)self _displayPagesForOffset:a3];
    int64_t v5 = [(BKPictureBookVerticalNavigationController *)self delegate];
    [v5 pageNavigationDidChangeLocation:self];
  }
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v10 = a5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL
    || (int64_t v7 = [(BKPageNavigationViewController *)self pageOffset], a3 < 1)
    || v7 + 1 == a3
    || [(BKPageNavigationViewController *)self pageCount] < a3)
  {
    id v8 = objc_retainBlock(v10);
    id v9 = v8;
    if (v8) {
      (*((void (**)(id))v8 + 2))(v8);
    }
  }
  else
  {
    [(BKPictureBookVerticalNavigationController *)self isVisible];
    [(BKPictureBookVerticalNavigationController *)self setPageOffset:a3 - 1 completion:v10];
  }
}

- (void)turnToNextPage
{
  if ((char *)[(BKPageNavigationViewController *)self pageOffset] == (char *)&dword_0 + 1)
  {
    uint64_t v3 = 1;
  }
  else
  {
    [(BKPictureBookVerticalNavigationController *)self visiblePages];
    if (v4 <= 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = v4;
    }
  }

  [(BKPageNavigationViewController *)self turnToNextPageWithDelta:v3];
}

- (void)turnToPreviousPage
{
  [(BKPictureBookVerticalNavigationController *)self visiblePages];
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }

  [(BKPageNavigationViewController *)self turnToPreviousPageWithDelta:v4];
}

- (BOOL)isZoomedOut
{
  return 0;
}

- (CGPoint)contentOffsetToScrollToForPageNumber:(int64_t)a3
{
  [(BKPictureBookVerticalNavigationController *)self originForPageNumber:a3];
  double v5 = v4;
  [(BKPictureBookVerticalNavigationController *)self pageSize];
  double v7 = v6;
  id v8 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v8 bounds];
  double Height = CGRectGetHeight(v23);

  id v10 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v10 zoomScale];
  double v12 = v5 * v11;

  double v13 = v12 + (Height - v7) * -0.5;
  double v14 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v14 contentInset];
  double v16 = -v15;

  if (v13 >= v16) {
    double v16 = v13;
  }
  int64_t v17 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v17 contentSize];
  double v19 = v18;

  if (v16 >= v19) {
    double v20 = v19;
  }
  else {
    double v20 = v16;
  }
  double v21 = 0.0;
  result.double y = v20;
  result.x = v21;
  return result;
}

- (void)_displayPagesForOffset:(int64_t)a3
{
  [(BKPictureBookVerticalNavigationController *)self contentOffsetToScrollToForPageNumber:a3 + 1];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(BKPictureBookVerticalNavigationController *)self scrollView];
  [v8 setContentOffset:0 animated:v5, v7];

  self->_lastScrollSpeed = 0.0;

  [(BKPictureBookVerticalNavigationController *)self _updatePages];
}

- (id)_setupPageNumber:(int64_t)a3
{
  double v5 = -[BKPictureBookVerticalNavigationController viewForPageNumber:](self, "viewForPageNumber:");
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 superview];

    if (!v7)
    {
      id v8 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
      [v8 addSubview:v6];
    }
    if (self->_lastScrollSpeed >= 0.5) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = ![(BKPictureBookVerticalNavigationController *)self animating];
    }
    id v10 = [v6 viewWithTag:1306];
    if (v10)
    {
      objc_opt_class();
      BUDynamicCast();
      double v11 = (BKPageScrollerPageView *)objc_claimAutoreleasedReturnValue();
      if (!v11) {
        goto LABEL_13;
      }
    }
    else
    {
      double v12 = [BKPageScrollerPageView alloc];
      [v6 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v21 = [(BKPictureBookVerticalNavigationController *)self delegate];
      double v22 = [(BKPictureBookVerticalNavigationController *)self delegate];
      CGRect v23 = [(BKPictureBookVerticalNavigationController *)self delegate];
      double v11 = -[BKPageScrollerPageView initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:](v12, "initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:", a3, v21, v22, v23, v14, v16, v18, v20);

      [v6 bounds];
      -[BKPageScrollerPageView setFrame:](v11, "setFrame:");
      [(BKPageScrollerPageView *)v11 setAutoresizingMask:18];
      [(BKPageScrollerPageView *)v11 setTag:1306];
      [v6 addSubview:v11];
      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    [v6 setPageScrollerPageView:v11];
    if (v9)
    {
      [(BKPageScrollerPageView *)v11 setScrollState:2];
      objc_opt_class();
      double v24 = [(BKPictureBookVerticalNavigationController *)self delegate];
      double v25 = [v24 contentViewControllerForPageNumber:a3];
      double v26 = BUDynamicCast();

      [(BKPictureBookVerticalNavigationController *)self _applyAdditionalScale:v26];
    }
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (void)_applyAdditionalScale:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 loader];
    double v6 = [v5 webView];
    [v6 be_scale];
    double v8 = v7;

    if (v8 < BEWebViewMinimumZoomScale)
    {
      double v9 = v8 / BEWebViewMinimumZoomScale;
      id v10 = _AEWKPictureBookLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 134218240;
        *(double *)((char *)&buf.a + 4) = v9;
        WORD2(buf.b) = 2048;
        *(void *)((char *)&buf.b + 6) = [v4 ordinal];
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "{WebViewLifeCycle} Applying additional scale:%f for ordinal:%lu", (uint8_t *)&buf, 0x16u);
      }

      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&buf, v9, v9);
      CGAffineTransform v13 = buf;
      double v11 = [v4 view];
      CGAffineTransform v12 = v13;
      [v11 setTransform:&v12];
    }
  }
}

- (void)_teardownPageNumber:(int64_t)a3
{
  double v4 = [(BKPictureBookVerticalNavigationController *)self viewForPageNumber:a3];
  if (v4)
  {
    id v8 = v4;
    id v5 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];

    double v4 = v8;
    if (v8 != v5)
    {
      double v6 = [v8 pageScrollerPageView];
      double v7 = v6;
      if (v6) {
        [v6 setScrollState:3];
      }
      [v7 teardown];
      [v7 removeFromSuperview];
      [v8 removeFromSuperview];

      double v4 = v8;
    }
  }
}

- (void)_updatePages
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_FD530;
  v3[3] = &unk_1DB6B0;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(BKPictureBookVerticalNavigationController *)self generatePositionForAllPages:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setPreferredPageNumberHUDVisibility:(BOOL)a3
{
  if (self->_preferredPageNumberHUDVisibility != a3)
  {
    self->_preferredPageNumberHUDVisibilitdouble y = a3;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 pictureBookVerticalNavigationpreferredPageNumberHUDVisibilityChanged:self->_preferredPageNumberHUDVisibility];
    }
  }
}

- (double)_spaceBetweenPages
{
  unsigned int v2 = [(BKPictureBookVerticalNavigationController *)self _bookRenditionFlowIsScrolledContinuous];
  double result = 4.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (BOOL)_pageViewShouldHaveRoundedCorners
{
  return ![(BKPictureBookVerticalNavigationController *)self _bookRenditionFlowIsScrolledContinuous];
}

- (BOOL)_bookRenditionFlowIsScrolledContinuous
{
  unsigned int v2 = [(BKPictureBookVerticalNavigationController *)self book];
  id v3 = [v2 fixedLayoutFlow];
  unsigned __int8 v4 = [v3 isEqualToString:@"scrolled-continuous"];

  return v4;
}

- (BOOL)_isRTL
{
  unsigned int v2 = [(BKPictureBookVerticalNavigationController *)self book];
  BOOL v3 = [v2 bkPageProgressionDirection] == 1;

  return v3;
}

- (BOOL)_allowZoom
{
  return 1;
}

- (void)updateLocationIfNeeded
{
  BOOL v3 = (char *)[(BKPictureBookVerticalNavigationController *)self currentPageNumber] - 1;
  if (v3 != (char *)[(BKPageNavigationViewController *)self pageOffset])
  {
    self->super._pageOffset = [(BKPictureBookVerticalNavigationController *)self currentPageNumber]
                            - 1;
    id v4 = [(BKPictureBookVerticalNavigationController *)self delegate];
    [v4 pageNavigationDidChangeLocation:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v12 = a3;
  [v12 contentOffset];
  double v5 = v4;
  double v7 = v6;
  if (!self->_scrollViewIsZooming
    && ![(BKPictureBookVerticalNavigationController *)self animating]
    && -[BKPictureBookVerticalNavigationController isPastEndOfBook:](self, "isPastEndOfBook:", v5, v7))
  {
    id v8 = [(BKPictureBookVerticalNavigationController *)self delegate];
    [v8 pageNavigationDidTryToSwipePastEndOfBook:self];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v10 = v9;
  if (v9 - self->_lastOffsetCapture > 0.1)
  {
    double v11 = fabs((v7 - self->_lastOffset.y) / 100.0);
    [(BKPictureBookVerticalNavigationController *)self setPreferredPageNumberHUDVisibility:v11 > 1.0];
    self->_lastScrollSpeed = v11;
    self->_lastOffset.x = v5;
    self->_lastOffset.double y = v7;
    self->_lastOffsetCapture = v10;
  }
  if (([v12 isZooming] & 1) == 0
    && !self->_scrollViewIsZooming
    && ![(BKPictureBookVerticalNavigationController *)self animating]
    && vabdd_f64(self->_lastOffsetUsedForPageRefresh.y, v7) > 100.0)
  {
    [(BKPictureBookVerticalNavigationController *)self _updatePages];
    [(BKPictureBookVerticalNavigationController *)self updateLocationIfNeeded];
    self->_lastPageRefreshTime = v10;
    self->_lastOffsetUsedForPageRefresh.x = v5;
    self->_lastOffsetUsedForPageRefresh.double y = v7;
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPictureBookVerticalNavigationController *)self scrollView];

  if (v5 == v4)
  {
    double v6 = [(BKPictureBookVerticalNavigationController *)self pagesContainerView];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(BKPictureBookVerticalNavigationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 pictureBookVerticalNavigationInteractionDidStart:0];
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  self->_scrollViewIsZooming = 1;
  uint64_t v5 = [(BKPictureBookVerticalNavigationController *)self delegate];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(BKPictureBookVerticalNavigationController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(BKPictureBookVerticalNavigationController *)self delegate];
      [v9 pictureBookVerticalNavigationInteractionDidStart:1];
    }
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  self->_scrollViewIsZooming = 0;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(BKPictureBookVerticalNavigationController *)self setPreferredPageNumberHUDVisibility:0];

  [(BKPictureBookVerticalNavigationController *)self _updatePages];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(BKPictureBookVerticalNavigationController *)self setPreferredPageNumberHUDVisibility:0];
    self->_lastScrollSpeed = 0.0;
    [(BKPictureBookVerticalNavigationController *)self _updatePages];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  if (fabs(a4.y) > 1.0)
  {
    id v8 = a3;
    [v8 zoomScale];
    double v10 = v9;
    [v8 minimumZoomScale];
    double v12 = v11;

    if (v10 == v12)
    {
      if ((-[BKPictureBookVerticalNavigationController contentOffsetToScrollToForPageNumber:](self, "contentOffsetToScrollToForPageNumber:", -[BKPictureBookVerticalNavigationController pageNumberAtContentOffset:](self, "pageNumberAtContentOffset:", a5->x, a5->y)), double v15 = v14 - a5->y, y > 0.0)&& v15 > 0.0|| y < 0.0 && v15 < 0.0)
      {
        a5->x = v13;
        a5->double y = v14;
      }
    }
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)pagesContainerView
{
  return self->_pagesContainerView;
}

- (void)setPagesContainerView:(id)a3
{
}

- (BKPictureBookNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKPictureBookNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGesture
{
  return self->_doubleTapGesture;
}

- (void)setDoubleTapGesture:(id)a3
{
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
}

- (BOOL)preferredPageNumberHUDVisibility
{
  return self->_preferredPageNumberHUDVisibility;
}

- (BOOL)allowDoubleTapToZoom
{
  return self->_allowDoubleTapToZoom;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (int64_t)pageNumberBeforeTransition
{
  return self->_pageNumberBeforeTransition;
}

- (void)setPageNumberBeforeTransition:(int64_t)a3
{
  self->_pageNumberBeforeTransition = a3;
}

- (CGSize)_lastScrollViewSizeLayoutWasGeneratedFor
{
  double width = self->__lastScrollViewSizeLayoutWasGeneratedFor.width;
  double height = self->__lastScrollViewSizeLayoutWasGeneratedFor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_lastScrollViewSizeLayoutWasGeneratedFor:(CGSize)a3
{
  self->__lastScrollViewSizeLayoutWasGeneratedFor = a3;
}

- (NSArray)_positionForPages
{
  return self->__positionForPages;
}

- (void)set_positionForPages:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__positionForPages, 0);
  objc_storeStrong((id *)&self->_book, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pagesContainerView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end