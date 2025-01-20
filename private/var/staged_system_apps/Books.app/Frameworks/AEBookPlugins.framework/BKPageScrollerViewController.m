@interface BKPageScrollerViewController
- (BKImageResizerDelegate)imageResizerDelegate;
- (BKPageScrollerThumbnailingDelegate)thumbnailingDelegate;
- (BKPageScrollerViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isZoomedOut;
- (BOOL)maintainZoomScale;
- (BOOL)resizeViewsWhenZoomed;
- (CGRect)_frameForPageNumber:(unint64_t)a3;
- (_NSRange)visiblePages;
- (double)maxResizeScale;
- (double)maxZoomScale;
- (id)_allPageViews;
- (id)_currentZoomingScrollView;
- (id)_pageViewInZoomingScrollView:(id)a3;
- (id)contentView;
- (id)pagingScrollView:(id)a3 viewAtIndex:(int64_t)a4;
- (id)viewForPageNumber:(int64_t)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)navigationOrientation;
- (void)_updatePageViewScrollStates;
- (void)_updateSurroundingZoomScales;
- (void)_visibleAreaChangedInScrollView:(id)a3;
- (void)adjustToNewSize:(CGSize)a3;
- (void)contentViewImage:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleDoubleTap:(id)a3;
- (void)handlePageChangeTap:(id)a3;
- (void)loadView;
- (void)pagingScrollView:(id)a3 didRemoveView:(id)a4 atIndex:(int64_t)a5;
- (void)pagingScrollView:(id)a3 viewDidAppear:(id)a4 atIndex:(int64_t)a5;
- (void)pagingScrollView:(id)a3 viewDidDisappear:(id)a4 atIndex:(int64_t)a5;
- (void)releaseViews;
- (void)resetZoomScaleForScrollView:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setImageResizerDelegate:(id)a3;
- (void)setMaintainZoomScale:(BOOL)a3;
- (void)setMaxResizeScale:(double)a3;
- (void)setMaxZoomScale:(double)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setResizeViewsWhenZoomed:(BOOL)a3;
- (void)setThumbnailingDelegate:(id)a3;
- (void)toggleControls:(id)a3;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)zoomVisiblePageToFit:(BOOL)a3;
- (void)zoomingScrollView:(id)a3 didSimulateZoomScale:(double)a4 onView:(id)a5;
@end

@implementation BKPageScrollerViewController

- (BKPageScrollerViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  result = [(BKPageNavigationViewController *)self init];
  if (result)
  {
    result->_navigationOrientation = a4;
    result->_maxZoomScale = 32.0;
    result->_maxResizeScale = 1.0;
    result->super._pageOffset = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  [(BKPageScrollerViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKPageScrollerViewController;
  [(BKViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(BKPageScrollerViewController *)self _allPageViews];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) teardown];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(BKPagingScrollView *)self->_pageScroller setDelegate:0];
  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer removeTarget:self action:0];
  [(UITapGestureRecognizer *)self->_doubleTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_doubleTapRecognizer removeTarget:self action:0];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer removeTarget:self action:0];
  v8.receiver = self;
  v8.super_class = (Class)BKPageScrollerViewController;
  [(BKViewController *)&v8 releaseViews];
}

- (void)loadView
{
  id v20 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 320.0, 460.0];
  [v20 setAutoresizingMask:18];
  [v20 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(BKPageScrollerViewController *)self navigationOrientation];
  if (v11) {
    double v6 = v6 + -20.0;
  }
  else {
    double v4 = v4 + -20.0;
  }
  if (v11) {
    double v10 = v10 + 40.0;
  }
  else {
    double v8 = v8 + 40.0;
  }
  long long v12 = -[BKPagingScrollView initWithFrame:]([BKPagingScrollView alloc], "initWithFrame:", v4, v6, v8, v10);
  pageScroller = self->_pageScroller;
  self->_pageScroller = v12;

  [(BKPagingScrollView *)self->_pageScroller setNavigationOrientation:[(BKPageScrollerViewController *)self navigationOrientation]];
  [(BKPagingScrollView *)self->_pageScroller setLayoutDirection:[(BKViewController *)self layoutDirection]];
  [(BKPagingScrollView *)self->_pageScroller setAutoresizingMask:18];
  [(BKPagingScrollView *)self->_pageScroller setDelegate:self];
  [(BKPagingScrollView *)self->_pageScroller setPageCacheDistance:1];
  [(BKPagingScrollView *)self->_pageScroller setPageCount:[(BKPageNavigationViewController *)self pageCount]];
  [(BKPagingScrollView *)self->_pageScroller setPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  [(BKPagingScrollView *)self->_pageScroller setContentInsetAdjustmentBehavior:2];
  [v20 addSubview:self->_pageScroller];
  v14 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleDoubleTap:"];
  doubleTapRecognizer = self->_doubleTapRecognizer;
  self->_doubleTapRecognizer = v14;

  [(UITapGestureRecognizer *)self->_doubleTapRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_doubleTapRecognizer setNumberOfTapsRequired:2];
  [(BKPagingScrollView *)self->_pageScroller addGestureRecognizer:self->_doubleTapRecognizer];
  v16 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handlePageChangeTap:"];
  pageChangeTapRecognizer = self->_pageChangeTapRecognizer;
  self->_pageChangeTapRecognizer = v16;

  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer requireGestureRecognizerToFail:self->_doubleTapRecognizer];
  [(BKPagingScrollView *)self->_pageScroller addGestureRecognizer:self->_pageChangeTapRecognizer];
  v18 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"toggleControls:"];
  controlsTapRecognizer = self->_controlsTapRecognizer;
  self->_controlsTapRecognizer = v18;

  [(UITapGestureRecognizer *)self->_controlsTapRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer requireGestureRecognizerToFail:self->_pageChangeTapRecognizer];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer requireGestureRecognizerToFail:self->_doubleTapRecognizer];
  [(BKPagingScrollView *)self->_pageScroller addGestureRecognizer:self->_controlsTapRecognizer];
  [(BKPageScrollerViewController *)self setView:v20];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPageScrollerViewController;
  [(BKPageScrollerViewController *)&v4 viewWillAppear:a3];
  [(BKPagingScrollView *)self->_pageScroller layoutIfNeeded];
}

- (void)adjustToNewSize:(CGSize)a3
{
}

- (id)contentView
{
  double v3 = [(BKPagingScrollView *)self->_pageScroller currentView];
  objc_super v4 = [(BKPageScrollerViewController *)self _pageViewInZoomingScrollView:v3];

  return v4;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
  id v11 = a4;
  double v6 = [(BKPagingScrollView *)self->_pageScroller currentView];
  double v7 = [(BKPageScrollerViewController *)self _pageViewInZoomingScrollView:v6];
  if (!a3) {
    [(BKPageScrollerViewController *)self resetZoomScaleForScrollView:v6];
  }
  double v8 = [v7 im_snapshotInContext];

  id v9 = objc_retainBlock(v11);
  double v10 = v9;
  if (v9) {
    (*((void (**)(id, void *))v9 + 2))(v9, v8);
  }
}

- (void)setPageOffset:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPageScrollerViewController;
  -[BKPageNavigationViewController setPageOffset:](&v5, "setPageOffset:");
  [(BKPagingScrollView *)self->_pageScroller setPageOffset:a3];
}

- (void)setPageCount:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPageScrollerViewController;
  -[BKPageNavigationViewController setPageCount:](&v5, "setPageCount:");
  [(BKPagingScrollView *)self->_pageScroller setPageCount:a3];
}

- (_NSRange)visiblePages
{
  int64_t v3 = [(BKPageNavigationViewController *)self pageOffset];
  unint64_t v4 = [(BKPageNavigationViewController *)self pageCount];
  if (v3 + 1 < v4) {
    unint64_t v5 = v3 + 1;
  }
  else {
    unint64_t v5 = v4;
  }
  if (v5 <= 1) {
    NSUInteger v6 = 1;
  }
  else {
    NSUInteger v6 = v5;
  }
  NSUInteger v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v4 = a3 - 1;
  if (a3 >= 1)
  {
    BOOL v5 = a4;
    if ([(BKPageNavigationViewController *)self pageCount] >= a3)
    {
      if ([(BKPageScrollerViewController *)self isVisible] && v5)
      {
        self->_animatingPageOffset = 1;
        double v8 = +[AETestDriver shared];
        [v8 postEvent:kBETestDriverPageTurnStart sender:self];
        [v8 postEvent:kBETestDriverPageTurnSetupStart sender:self];
        [v8 postEvent:kBETestDriverPageTurnSetupEnd sender:self];
        [v8 postEvent:kBETestDriverPageTurnAnimationStart sender:self];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_6A260;
        v12[3] = &unk_1DC500;
        v12[4] = self;
        v12[5] = a3;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_6A26C;
        v10[3] = &unk_1DBEE0;
        v10[4] = self;
        id v11 = v8;
        id v9 = v8;
        +[UIView animateWithDuration:v12 animations:v10 completion:0.2];
      }
      else
      {
        [(BKPageScrollerViewController *)self setPageOffset:v4];
      }
    }
  }
}

- (BOOL)isZoomedOut
{
  v2 = [(BKPageScrollerViewController *)self _currentZoomingScrollView];
  [v2 zoomScale];
  double v4 = v3;
  [v2 minimumZoomScale];
  BOOL v6 = vabdd_f64(v4, v5) < 0.00999999978;

  return v6;
}

- (CGRect)_frameForPageNumber:(unint64_t)a3
{
  if (self->_pageScroller)
  {
    if ([(BKPageScrollerViewController *)self navigationOrientation])
    {
      [(BKPagingScrollView *)self->_pageScroller frame];
      double y = v5 * (double)(a3 - 1) + 20.0;
      [(BKPagingScrollView *)self->_pageScroller frame];
      double width = v7;
      [(BKPagingScrollView *)self->_pageScroller frame];
      double height = v9 + -40.0;
      double x = 0.0;
    }
    else
    {
      int64_t v12 = [(BKViewController *)self layoutDirection];
      [(BKPagingScrollView *)self->_pageScroller frame];
      double v14 = v13;
      if (v12 == 1) {
        v15 = (char *)[(BKPageNavigationViewController *)self pageCount] - a3;
      }
      else {
        v15 = (char *)(a3 - 1);
      }
      double x = v14 * (double)(unint64_t)v15 + 20.0;
      [(BKPagingScrollView *)self->_pageScroller frame];
      double width = v16 + -40.0;
      [(BKPagingScrollView *)self->_pageScroller frame];
      double y = 0.0;
    }
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  result.size.double height = height;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)viewForPageNumber:(int64_t)a3
{
  -[BKPageScrollerViewController _frameForPageNumber:](self, "_frameForPageNumber:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = -[BKZoomingScrollView initWithFrame:]([BKZoomingScrollView alloc], "initWithFrame:", v5, v7, v9, v11);
  double v14 = [BKPageScrollerPageView alloc];
  v15 = [(BKPageNavigationViewController *)self delegate];
  double v16 = [(BKPageScrollerViewController *)self thumbnailingDelegate];
  double v17 = [(BKPageScrollerViewController *)self imageResizerDelegate];
  double v18 = -[BKPageScrollerPageView initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:](v14, "initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:", a3, v15, v16, v17, v6, v8, v10, v12);

  -[BKPageScrollerPageView sizeThatFits:](v18, "sizeThatFits:", v10, v12);
  -[BKPageScrollerPageView setFrame:](v18, "setFrame:", 0.0, 0.0, v19, v20);
  [(BKPageScrollerPageView *)v18 setTag:128];
  v21 = [(BKPageScrollerPageView *)v18 layer];
  [v21 setShadowOffset:0.0, 1.0];

  v22 = [(BKPageScrollerPageView *)v18 layer];
  LODWORD(v23) = 1051931443;
  [v22 setShadowOpacity:v23];

  v24 = [(BKPageScrollerPageView *)v18 layer];
  [v24 setShadowRadius:3.0];

  [(BKPageScrollerPageView *)v18 bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v25 = objc_claimAutoreleasedReturnValue();
  id v26 = [v25 CGPath];
  v27 = [(BKPageScrollerPageView *)v18 layer];
  [v27 setShadowPath:v26];

  [(BKZoomingScrollView *)v13 setAutoresizingMask:18];
  [(BKZoomingScrollView *)v13 setShowsHorizontalScrollIndicator:0];
  [(BKZoomingScrollView *)v13 setShowsVerticalScrollIndicator:0];
  [(BKZoomingScrollView *)v13 addSubview:v18];
  [(BKZoomingScrollView *)v13 setDelegate:self];
  [(BKZoomingScrollView *)v13 setMinimumZoomScale:1.0];
  [(BKZoomingScrollView *)v13 setMaximumZoomScale:self->_maxZoomScale];
  [(BKZoomingScrollView *)v13 setMaxSimulatedZoomScale:self->_maxResizeScale];
  [(BKZoomingScrollView *)v13 setBouncesZoom:1];
  [(BKZoomingScrollView *)v13 setDecelerationRate:UIScrollViewDecelerationRateFast];
  [(BKZoomingScrollView *)v13 setDirectionalLockEnabled:1];
  [(BKZoomingScrollView *)v13 setContentInsetAdjustmentBehavior:2];
  [(BKZoomingScrollView *)v13 setClipsToBounds:1];
  [(BKPageScrollerPageView *)v18 bounds];
  -[BKZoomingScrollView configureForImageSize:](v13, "configureForImageSize:", v28, v29);
  v30 = [(BKPageScrollerViewController *)self _currentZoomingScrollView];
  v31 = v30;
  if (self->_maintainZoomScale && v30)
  {
    [v30 totalZoomScale];
    -[BKZoomingScrollView setTotalZoomScale:](v13, "setTotalZoomScale:");
  }
  else
  {
    [(BKZoomingScrollView *)v13 minimumZoomScale];
    -[BKZoomingScrollView setZoomScale:](v13, "setZoomScale:");
  }

  return v13;
}

- (void)zoomVisiblePageToFit:(BOOL)a3
{
  double v4 = [(BKPagingScrollView *)self->_pageScroller viewAtIndex:[(BKPageNavigationViewController *)self pageOffset]];
  self->_animatingZoomScale = 1;
  objc_initWeak(&location, v4);
  [v4 minimumZoomScale];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6A870;
  v7[3] = &unk_1DAA80;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v4 setZoomScale:1 animated:v7 completionBlock:v6];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  if (self->_pageScroller == a3)
  {
    double v3 = 0;
  }
  else
  {
    double v3 = -[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:");
  }

  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(BKPageNavigationViewController *)self delegate];
  [v4 pageNavigationDidBeginInteracting:self];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5 = [(BKPageNavigationViewController *)self delegate];
  [v5 pageNavigationDidBeginInteracting:self];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(BKPageScrollerViewController *)self _visibleAreaChangedInScrollView:a3];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(BKPageScrollerViewController *)self _visibleAreaChangedInScrollView:a3];
  pageScroller = self->_pageScroller;

  [(BKPagingScrollView *)pageScroller updateCachedPages];
}

- (void)zoomingScrollView:(id)a3 didSimulateZoomScale:(double)a4 onView:(id)a5
{
  id v6 = a5;
  [v6 bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v7 = objc_claimAutoreleasedReturnValue();
  id v8 = [v7 CGPath];
  double v9 = [v6 layer];
  [v9 setShadowPath:v8];

  double v10 = [v6 layer];
  [v10 setShadowOffset:a4 * 0.0, a4];

  id v11 = [v6 layer];

  [v11 setShadowRadius:a4 * 3.0];
}

- (id)pagingScrollView:(id)a3 viewAtIndex:(int64_t)a4
{
  return [(BKPageScrollerViewController *)self viewForPageNumber:a4 + 1];
}

- (void)pagingScrollView:(id)a3 didRemoveView:(id)a4 atIndex:(int64_t)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setDelegate:0];
  }
}

- (void)pagingScrollView:(id)a3 viewDidAppear:(id)a4 atIndex:(int64_t)a5
{
  self->super._pageOffset = [(BKPagingScrollView *)self->_pageScroller pageOffset];
  id v7 = [(BKPageNavigationViewController *)self delegate];
  [v7 pageNavigationDidChangeLocation:self];

  id v8 = [(BKPageNavigationViewController *)self delegate];
  id v9 = [v8 existingContentViewControllerForPageNumber:a5 + 1];

  [v9 beginAppearanceTransition:1 animated:0];
  [v9 endAppearanceTransition];
}

- (void)resetZoomScaleForScrollView:(id)a3
{
  id v3 = a3;
  [v3 minimumZoomScale];
  [v3 setZoomScale:];
}

- (void)pagingScrollView:(id)a3 viewDidDisappear:(id)a4 atIndex:(int64_t)a5
{
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_maintainZoomScale) {
    [(BKPageScrollerViewController *)self performSelector:"resetZoomScaleForScrollView:" withObject:v9 afterDelay:0.0];
  }
  id v7 = [(BKPageNavigationViewController *)self delegate];
  id v8 = [v7 existingContentViewControllerForPageNumber:a5 + 1];

  [v8 beginAppearanceTransition:0 animated:0];
  [v8 endAppearanceTransition];
}

- (void)handleDoubleTap:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPageNavigationViewController *)self delegate];
  id v6 = [v5 existingContentViewControllerForPageNumber:[self pageOffset] + 1];

  id v7 = [(BKPagingScrollView *)self->_pageScroller viewAtIndex:[(BKPageNavigationViewController *)self pageOffset]];
  id v8 = [v6 view];
  [v4 locationInView:v8];
  double v10 = v9;

  [v7 zoomScale];
  double v12 = v11;
  [v7 minimumZoomScale];
  if (v12 <= v13)
  {
    double v14 = [v6 view];
    [v14 bounds];
    CGFloat v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    v27.origin.double x = v16;
    v27.origin.double y = v18;
    v27.size.double width = v20;
    v27.size.double height = v22;
    if (v10 >= CGRectGetMidX(v27))
    {
      v29.origin.double x = v16;
      v29.origin.double y = v18;
      v29.size.double width = v20;
      v29.size.double height = v22;
      double MidX = CGRectGetMidX(v29);
    }
    else
    {
      v28.origin.double x = v16;
      v28.origin.double y = v18;
      v28.size.double width = v20;
      v28.size.double height = v22;
      double MidX = CGRectGetMinX(v28);
    }
    double v24 = MidX;
    self->_animatingZoomScale = 1;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_6AF48;
    v25[3] = &unk_1DBF08;
    v25[4] = self;
    id v26 = v7;
    [v26 zoomToRect:1, v25, v24, v18, v20 * 0.5, v22];
  }
  else
  {
    [(BKPageScrollerViewController *)self zoomVisiblePageToFit:1];
  }
}

- (void)handlePageChangeTap:(id)a3
{
  pageScroller = self->_pageScroller;
  id v5 = a3;
  id v34 = [(BKPagingScrollView *)pageScroller viewAtIndex:[(BKPageNavigationViewController *)self pageOffset]];
  id v6 = [v5 view];
  [v5 locationInView:v6];
  double v8 = v7;

  if (isPad())
  {
    if (isPortrait()) {
      double v9 = 110.0;
    }
    else {
      double v9 = 82.0;
    }
  }
  else
  {
    double v9 = 80.0;
  }
  if (self->_maintainZoomScale)
  {
    [v34 bounds];
    CGFloat v11 = v10;
    double v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    [v6 bounds];
    if (v8 <= CGRectGetMaxX(v36) - v9)
    {
      [v6 bounds];
      if (v8 < v9 + CGRectGetMinX(v38))
      {
        v39.origin.double x = v11;
        v39.origin.double y = v13;
        v39.size.double width = v15;
        v39.size.double height = v17;
        CGFloat v26 = CGRectGetMinX(v39) + -1.0;
        [v34 contentInset];
        if (v26 > v27)
        {
          [v34 contentInset];
          double v25 = v28;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v37.origin.double x = v11;
      v37.origin.double y = v13;
      v37.size.double width = v15;
      v37.size.double height = v17;
      CGFloat v18 = CGRectGetMaxX(v37) + 1.0;
      [v34 contentSize];
      double v20 = v19;
      [v34 contentInset];
      if (v18 < v20 - v21)
      {
        [v34 contentSize];
        double v23 = v22;
        [v34 contentInset];
        double v25 = v23 - v24 - v15;
LABEL_13:
        [v34 setContentOffset:1, v25, v13];
        goto LABEL_26;
      }
    }
  }
  [v6 bounds];
  if (v8 <= CGRectGetMaxX(v40) - v9)
  {
    [v6 bounds];
    if (v8 >= v9 + CGRectGetMinX(v41))
    {
      uint64_t v29 = 0;
      goto LABEL_21;
    }
    uint64_t v29 = -1;
  }
  else
  {
    uint64_t v29 = 1;
  }
  v30 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v31 = [v30 BOOLForKey:BKLeftTapTurnToNextDefault[0]];

  if ((v31 & 1) == 0)
  {
LABEL_21:
    if ((char *)[(BKViewController *)self layoutDirection] == (char *)&dword_0 + 1) {
      uint64_t v33 = -v29;
    }
    else {
      uint64_t v33 = v29;
    }
    uint64_t v32 = v33 + 1;
    goto LABEL_25;
  }
  uint64_t v32 = 2;
LABEL_25:
  [(BKPageScrollerViewController *)self turnToPageNumber:(char *)[(BKPageNavigationViewController *)self pageOffset] + v32 animated:1];
LABEL_26:
}

- (void)toggleControls:(id)a3
{
  id v4 = [(BKPageNavigationViewController *)self delegate];
  [v4 pageNavigationToggleControls:self];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_pageChangeTapRecognizer != a3) {
    return 1;
  }
  id v4 = a3;
  id v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;

  if (isPad())
  {
    if (isPortrait()) {
      double v8 = 110.0;
    }
    else {
      double v8 = 82.0;
    }
  }
  else
  {
    double v8 = 80.0;
  }
  [v5 bounds];
  BOOL v3 = 1;
  if (v7 < CGRectGetMaxX(v10) - v8)
  {
    [v5 bounds];
    if (v7 > v8 + CGRectGetMinX(v11)) {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  if (self->_pageChangeTapRecognizer == a3) {
    return [a4 bk_isWKSyntheticTapGestureRecognizer];
  }
  else {
    return 0;
  }
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_doubleTapRecognizer == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = v6;
    if ([v7 numberOfTapsRequired] == (char *)&dword_0 + 2) {
      unsigned int v8 = [v7 matchesTarget:[UIView be_wkContentViewClass] andAction:_nonBlockingDoubleTapRecognized:];
    }
    else {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (void)_visibleAreaChangedInScrollView:(id)a3
{
  uint64_t isKindOfClass = (uint64_t)a3;
  id v5 = (BKPagingScrollView *)isKindOfClass;
  if (!self->_animatingZoomScale)
  {
    id v7 = (BKPagingScrollView *)isKindOfClass;
    uint64_t isKindOfClass = (uint64_t)[(id)isKindOfClass isDragging];
    id v5 = v7;
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t isKindOfClass = (uint64_t)[(BKPagingScrollView *)v7 isDecelerating];
      id v5 = v7;
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t isKindOfClass = (uint64_t)[(BKPagingScrollView *)v7 isZooming];
        id v5 = v7;
        if ((isKindOfClass & 1) == 0)
        {
          uint64_t isKindOfClass = (uint64_t)[(BKPagingScrollView *)v7 isZoomBouncing];
          id v5 = v7;
          if ((isKindOfClass & 1) == 0)
          {
            if (self->_resizeViewsWhenZoomed)
            {
              objc_opt_class();
              uint64_t isKindOfClass = objc_opt_isKindOfClass();
              id v5 = v7;
              if (isKindOfClass)
              {
                uint64_t isKindOfClass = (uint64_t)[(BKPagingScrollView *)v7 simulateZoomScaleByResizingView];
                id v5 = v7;
              }
            }
            if (self->_maintainZoomScale)
            {
              id v6 = [(BKPageScrollerViewController *)self _currentZoomingScrollView];

              id v5 = v7;
              if (v6 == v7)
              {
                uint64_t isKindOfClass = (uint64_t)[(BKPageScrollerViewController *)self _updateSurroundingZoomScales];
                id v5 = v7;
              }
            }
          }
        }
      }
    }
  }
  if (self->_pageScroller == v5)
  {
    unsigned int v8 = v5;
    uint64_t isKindOfClass = (uint64_t)[(BKPageScrollerViewController *)self _updatePageViewScrollStates];
    id v5 = v8;
  }

  _objc_release_x1(isKindOfClass, v5);
}

- (void)_updatePageViewScrollStates
{
  BOOL animatingPageOffset = 1;
  if (([(BKPagingScrollView *)self->_pageScroller isDragging] & 1) == 0
    && ([(BKPagingScrollView *)self->_pageScroller isDecelerating] & 1) == 0)
  {
    BOOL animatingPageOffset = self->_animatingPageOffset;
  }
  id v4 = [(BKPagingScrollView *)self->_pageScroller currentView];
  id v5 = [(BKPageScrollerViewController *)self _pageViewInZoomingScrollView:v4];

  if (animatingPageOffset) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setScrollState:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(BKPagingScrollView *)self->_pageScroller surroundingViews];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    if (animatingPageOffset) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 3;
    }
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        double v13 = [(BKPageScrollerViewController *)self _pageViewInZoomingScrollView:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v13 setScrollState:v11];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)_allPageViews
{
  BOOL v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BKPagingScrollView *)self->_pageScroller allViews];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(BKPageScrollerViewController *)self _pageViewInZoomingScrollView:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_pageViewInZoomingScrollView:(id)a3
{
  return [a3 viewWithTag:128];
}

- (id)_currentZoomingScrollView
{
  return [(BKPagingScrollView *)self->_pageScroller currentView];
}

- (void)_updateSurroundingZoomScales
{
  BOOL v3 = [(BKPageScrollerViewController *)self _currentZoomingScrollView];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(BKPagingScrollView *)self->_pageScroller subviews];
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v9 != v3)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            id v11 = [v3 tag];
            LODWORD(v11) = (uint64_t)v11 > (uint64_t)[v10 tag];
            if (v11 == ((char *)[(BKViewController *)self layoutDirection] == (char *)&dword_0 + 1))
            {
              [v10 contentInset];
              double v16 = -v17;
            }
            else
            {
              [v10 contentSize];
              double v13 = v12;
              [v10 bounds];
              double v14 = v13 - CGRectGetWidth(v25);
              [v10 contentInset];
              double v16 = v14 + v15;
            }
            [v3 contentOffset];
            double v19 = v18;
            [v3 totalZoomScale];
            [v10 setTotalZoomScale:];
            [v10 setContentOffset:v16, v19];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

- (int64_t)navigationOrientation
{
  return self->_navigationOrientation;
}

- (BKPageScrollerThumbnailingDelegate)thumbnailingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);

  return (BKPageScrollerThumbnailingDelegate *)WeakRetained;
}

- (void)setThumbnailingDelegate:(id)a3
{
}

- (BOOL)maintainZoomScale
{
  return self->_maintainZoomScale;
}

- (void)setMaintainZoomScale:(BOOL)a3
{
  self->_maintainZoomScale = a3;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (void)setMaxZoomScale:(double)a3
{
  self->_maxZoomScale = a3;
}

- (BOOL)resizeViewsWhenZoomed
{
  return self->_resizeViewsWhenZoomed;
}

- (void)setResizeViewsWhenZoomed:(BOOL)a3
{
  self->_resizeViewsWhenZoomed = a3;
}

- (double)maxResizeScale
{
  return self->_maxResizeScale;
}

- (void)setMaxResizeScale:(double)a3
{
  self->_maxResizeScale = a3;
}

- (BKImageResizerDelegate)imageResizerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageResizerDelegate);

  return (BKImageResizerDelegate *)WeakRetained;
}

- (void)setImageResizerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageResizerDelegate);
  objc_destroyWeak((id *)&self->_thumbnailingDelegate);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_pageChangeTapRecognizer, 0);
  objc_storeStrong((id *)&self->_controlsTapRecognizer, 0);

  objc_storeStrong((id *)&self->_pageScroller, 0);
}

@end