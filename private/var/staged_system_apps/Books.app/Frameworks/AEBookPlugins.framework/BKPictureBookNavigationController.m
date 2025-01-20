@interface BKPictureBookNavigationController
- (BKPageCurlManager)pageCurlManager;
- (BKPageSlide)pageSlideAnimation;
- (BKPictureBookNavigationController)init;
- (BOOL)_allowZoom;
- (BOOL)_contentController:(id)a3 hasMediaElementAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)_hasMediaElementAtTouch:(id)a3;
- (BOOL)_isFreeScale;
- (BOOL)bkLongPressGestureCanTransitionToRecognizedState:(id)a3;
- (BOOL)canZoomMore;
- (BOOL)currentlyZoomed;
- (BOOL)drawsSpine;
- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasMediaElementAtPoint:(CGPoint)a3 inView:(id)a4;
- (BOOL)hasTurnedToInitialPage;
- (BOOL)inSinglePageMode;
- (BOOL)isContentRenderComplete;
- (BOOL)isManualCurlInProgress;
- (BOOL)isMediaPlayerGestureRecognizer:(id)a3;
- (BOOL)isZoomedBeyondPage;
- (BOOL)isZoomedCloseToSpread;
- (BOOL)isZoomedToRightPage;
- (BOOL)isZoomedToSinglePage;
- (BOOL)isZoomedToSpread;
- (BOOL)scaleIsAdjusted;
- (BOOL)shouldZoomToSinglePage;
- (BOOL)singlePageAspectFits;
- (BOOL)supportsSinglePageMode;
- (BOOL)usePageCurlAnimation;
- (CGRect)_backPageCurlFrame;
- (CGRect)_containerBoundsForGeometry;
- (CGRect)_resetCurlContainerFrame;
- (CGRect)_resetSinglePageCurlContainerFrame;
- (CGSize)contentSize;
- (IMPerformSelectorProxy)performSelectorProxy;
- (UIView)lastCurlUnderPageView;
- (UIView)singlePageCurlContainer;
- (_NSRange)visiblePages;
- (double)desiredScale;
- (double)effectiveZoomScale;
- (double)pageAnimationDurationFor:(id)a3;
- (double)pageCurlManager:(id)a3 durationForCurl:(id)a4;
- (double)singlePagePadding;
- (double)singlePageZoomScale;
- (id)_createZoomingScrollView;
- (id)_singlePageVisibleContentViewControllerForPageOffset:(int64_t)a3;
- (id)contentView;
- (id)curlContainer;
- (id)thumbnailBookViewConfiguration;
- (id)viewControllers;
- (id)viewForLiveResize;
- (id)viewForPageNumber:(int64_t)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (int)lastCompletedTransition;
- (int)openToSpread;
- (int)tapActionForLocation:(CGPoint)a3 view:(id)a4 ignoreOppositePage:(BOOL)a5;
- (unint64_t)_pageOffsetAfter:(int64_t)a3 whenCurlingForward:(BOOL)a4;
- (void)_adjustToNewSize:(CGSize)a3 withOptionalTransitionCoordinator:(id)a4;
- (void)_applyAdditionalScale:(id)a3;
- (void)_autoCurlToSinglePageOffset:(int64_t)a3 forwardCurl:(BOOL)a4;
- (void)_autoCurlToSpreadPageOffset:(int64_t)a3 forwardCurl:(BOOL)a4;
- (void)_autoSlideToSpreadPageOffset:(int64_t)a3 forwardCurl:(BOOL)a4;
- (void)_contentIsReadyOrFailed:(id)a3;
- (void)_curlPageForReadAloud:(id)a3;
- (void)_displayPagesForOffset:(int64_t)a3;
- (void)_generateLeftPageImageAtPageOffset:(int64_t)a3 completion:(id)a4;
- (void)_generateRightPageImageAtPageOffset:(int64_t)a3 completion:(id)a4;
- (void)_insertDestinationSnapshotImageUnderCurrentPageCurl:(int64_t)a3;
- (void)_killSpreadManualCurl;
- (void)_manualCurlToSinglePage:(CGPoint)a3;
- (void)_resetCurlContainer;
- (void)_resetSinglePageCurlContainer;
- (void)_resetSinglePageCurlContainer:(id)a3;
- (void)_restoreViewHierarchyWithArray:(id)a3;
- (void)_setupView;
- (void)_timeOutWaitingForPaint;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateBookScale;
- (void)_updateSelectionHighlights;
- (void)addPendingContent:(id)a3;
- (void)adjustToNewSize:(CGSize)a3;
- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5;
- (void)contentViewImage:(BOOL)a3 completion:(id)a4;
- (void)curlPageForReadAloud:(BOOL)a3;
- (void)dealloc;
- (void)enterSinglePageMode;
- (void)exitSinglePageMode;
- (void)handleDoubleTap:(id)a3;
- (void)handlePageChangeTap:(id)a3;
- (void)handleSinglePageManualCurlGesture:(id)a3;
- (void)handleSpreadManualCurlGesture:(id)a3;
- (void)leftSwipe:(id)a3;
- (void)manualCurlGesture:(id)a3;
- (void)pageAnimation:(id)a3 didFinish:(BOOL)a4;
- (void)pageAnimationWillBegin:(id)a3;
- (void)pageCurlManager:(id)a3 didCancelCurl:(id)a4;
- (void)pageCurlManager:(id)a3 didFinishCurl:(id)a4 transitionCompleted:(BOOL)a5;
- (void)pageCurlManager:(id)a3 willBeginCurl:(id)a4;
- (void)releaseViews;
- (void)removePendingContent:(id)a3;
- (void)rightSwipe:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setContentSize:(CGSize)a3;
- (void)setDesiredScale:(double)a3;
- (void)setDrawsSpine:(BOOL)a3;
- (void)setHasTurnedToInitialPage:(BOOL)a3;
- (void)setLastCompletedTransition:(int)a3;
- (void)setLastCurlUnderPageView:(id)a3;
- (void)setOpenToSpread:(int)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setPageSlideAnimation:(id)a3;
- (void)setScaleIsAdjusted:(BOOL)a3;
- (void)setSelectionHighlightsVisible:(BOOL)a3;
- (void)setUsePageCurlAnimation:(BOOL)a3;
- (void)slide:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5;
- (void)toggleControls:(id)a3;
- (void)transitionDidFinish:(BOOL)a3;
- (void)turnToNextPage;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)turnToPreviousPage;
- (void)updateUpsellZoomScale;
- (void)updateVisibleContentViewControllerForOffset:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zoom:(BOOL)a3 animated:(BOOL)a4;
- (void)zoomToPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)zoomToPoint:(CGPoint)a3 scale:(double)a4 animated:(BOOL)a5;
- (void)zoomToSpread:(BOOL)a3;
@end

@implementation BKPictureBookNavigationController

- (BKPictureBookNavigationController)init
{
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookNavigationController;
  v2 = [(BKPageNavigationViewController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_contentSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
    *(void *)&v2->_canFitToWidth = 0x7FFFFFFFFFFFFFFFLL;
    v4 = +[NSUserDefaults standardUserDefaults];
    HIBYTE(v3->_lastCompletedTransition) = [v4 BOOLForKey:@"BKUseLegacyCurlAnimation"];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"onAppWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v6 = +[UITraitCollection bc_allAPITraits];
    id v7 = [(BKPictureBookNavigationController *)v3 registerForTraitChanges:v6 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)dealloc
{
  [(BKPictureBookNavigationController *)self releaseViews];
  [(BKPageSlide *)self->_pageSlideAnimation teardown];
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookNavigationController;
  [(BKViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BKContentReadyNotification object:self->_rightContentViewController];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:BKContentFAILNotification object:self->_rightContentViewController];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:BKContentReadyNotification object:self->_pendingLoads];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:BKContentFAILNotification object:self->_pendingLoads];

  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer removeTarget:0 action:0];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer removeTarget:0 action:0];
  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer removeTarget:0 action:0];
  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer setDelegate:0];
  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer removeTarget:0 action:0];
  [(UISwipeGestureRecognizer *)self->_rightSwipeGestureRecognizer setDelegate:0];
  [(UISwipeGestureRecognizer *)self->_rightSwipeGestureRecognizer removeTarget:0 action:0];
  [(BKLongPressGestureRecognizer *)self->_manualCurlGestureRecognizer setDelegate:0];
  [(BKLongPressGestureRecognizer *)self->_manualCurlGestureRecognizer removeTarget:0 action:0];
  [(UIPanGestureRecognizer *)self->_panManualCurlGestureRecognizer setDelegate:0];
  [(UIPanGestureRecognizer *)self->_panManualCurlGestureRecognizer removeTarget:0 action:0];
  [(BKPictureBookScrollView *)self->_scrollView setDelegate:0];
  [(BKPictureBookCurlState *)self->_curlState setDelegate:0];
  v8.receiver = self;
  v8.super_class = (Class)BKPictureBookNavigationController;
  [(BKViewController *)&v8 releaseViews];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)BKPictureBookNavigationController;
  [(BKPictureBookNavigationController *)&v24 viewDidLoad];
  objc_super v3 = [(BKPictureBookNavigationController *)self view];
  [v3 setOpaque:0];
  v4 = [(BKPictureBookNavigationController *)self _createZoomingScrollView];
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  [v3 bounds];
  IMActionSafeRectForRect();
  -[BKPictureBookScrollView setFrame:](self->_scrollView, "setFrame:");
  [v3 addSubview:self->_scrollView];
  v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleDoubleTap:"];
  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  self->_doubleTapGestureRecognizer = v6;

  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelegate:self];
  [v3 addGestureRecognizer:self->_doubleTapGestureRecognizer];
  objc_super v8 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handlePageChangeTap:"];
  pageChangeTapRecognizer = self->_pageChangeTapRecognizer;
  self->_pageChangeTapRecognizer = v8;

  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_pageChangeTapRecognizer requireGestureRecognizerToFail:self->_doubleTapGestureRecognizer];
  [v3 addGestureRecognizer:self->_pageChangeTapRecognizer];
  v10 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"toggleControls:"];
  controlsTapRecognizer = self->_controlsTapRecognizer;
  self->_controlsTapRecognizer = v10;

  [(UITapGestureRecognizer *)self->_controlsTapRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer requireGestureRecognizerToFail:self->_pageChangeTapRecognizer];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer requireGestureRecognizerToFail:self->_doubleTapGestureRecognizer];
  [v3 addGestureRecognizer:self->_controlsTapRecognizer];
  v12 = [[BKLongPressGestureRecognizer alloc] initWithTarget:self action:"manualCurlGesture:"];
  manualCurlGestureRecognizer = self->_manualCurlGestureRecognizer;
  self->_manualCurlGestureRecognizer = v12;

  [(BKLongPressGestureRecognizer *)self->_manualCurlGestureRecognizer setDelegate:self];
  [(BKLongPressGestureRecognizer *)self->_manualCurlGestureRecognizer setMinimumPressDuration:0.0500000007];
  [(BKLongPressGestureRecognizer *)self->_manualCurlGestureRecognizer setCancelsTouchesInView:1];
  [(BKLongPressGestureRecognizer *)self->_manualCurlGestureRecognizer requireGestureRecognizerToFail:self->_pageChangeTapRecognizer];
  [v3 addGestureRecognizer:self->_manualCurlGestureRecognizer];
  v14 = (UISwipeGestureRecognizer *)[objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"leftSwipe:"];
  leftSwipeGestureRecognizer = self->_leftSwipeGestureRecognizer;
  self->_leftSwipeGestureRecognizer = v14;

  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer setDelegate:self];
  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer setDirection:2];
  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer setCancelsTouchesInView:1];
  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer requireGestureRecognizerToFail:self->_manualCurlGestureRecognizer];
  [(UISwipeGestureRecognizer *)self->_leftSwipeGestureRecognizer requireGestureRecognizerToFail:self->_panManualCurlGestureRecognizer];
  [v3 addGestureRecognizer:self->_leftSwipeGestureRecognizer];
  v16 = (UISwipeGestureRecognizer *)[objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"rightSwipe:"];
  rightSwipeGestureRecognizer = self->_rightSwipeGestureRecognizer;
  self->_rightSwipeGestureRecognizer = v16;

  [(UISwipeGestureRecognizer *)self->_rightSwipeGestureRecognizer setDelegate:self];
  [(UISwipeGestureRecognizer *)self->_rightSwipeGestureRecognizer setDirection:1];
  [(UISwipeGestureRecognizer *)self->_rightSwipeGestureRecognizer requireGestureRecognizerToFail:self->_manualCurlGestureRecognizer];
  [(UISwipeGestureRecognizer *)self->_rightSwipeGestureRecognizer requireGestureRecognizerToFail:self->_panManualCurlGestureRecognizer];
  [v3 addGestureRecognizer:self->_rightSwipeGestureRecognizer];
  v18 = objc_alloc_init(BKPictureBookView);
  bookView = self->_bookView;
  self->_bookView = v18;

  [(BKPictureBookNavigationController *)self contentSize];
  -[BKPictureBookView setContentSize:](self->_bookView, "setContentSize:");
  [(BKPictureBookView *)self->_bookView setDrawsShadow:1];
  [(BKPictureBookView *)self->_bookView setDrawsSpine:[(BKPictureBookNavigationController *)self drawsSpine]];
  [(BKPictureBookView *)self->_bookView sizeToFit];
  id v20 = [(BKPictureBookNavigationController *)self curlContainer];
  id v21 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
  [(BKPictureBookScrollView *)self->_scrollView addSubview:self->_bookView];
  if (!self->_needsTurnToPageNumber)
  {
    id v22 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
    needsTurnToPageNumber = (void *)self->_needsTurnToPageNumber;
    self->_needsTurnToPageNumber = (unint64_t)v22;
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookNavigationController;
  [(BKPictureBookNavigationController *)&v4 viewIsAppearing:a3];
  [(BKPictureBookNavigationController *)self _setupView];
}

- (void)_setupView
{
  objc_super v3 = [(BKPictureBookNavigationController *)self view];
  [v3 bounds];
  IMActionSafeRectForRect();
  -[BKPictureBookScrollView setFrame:](self->_scrollView, "setFrame:");

  LOBYTE(self->_lastCompletedTransition) = [(BKPictureBookNavigationController *)self singlePageAspectFits];
  scrollView = self->_scrollView;
  [(BKPictureBookView *)self->_bookView bounds];
  -[BKZoomingScrollView configureForImageSize:](scrollView, "configureForImageSize:", v5, v6);
  [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
  -[BKPictureBookScrollView setZoomScale:](self->_scrollView, "setZoomScale:");
  uint64_t v7 = [(BKPictureBookNavigationController *)self openToSpread];
  if ([(BKPictureBookNavigationController *)self lastCompletedTransition] == 1
    || v7 && (v7 != 0x7FFFFFFFFFFFFFFFLL || !isPortrait()))
  {
    [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
    -[BKPictureBookScrollView setZoomScale:](self->_scrollView, "setZoomScale:");
  }
  else
  {
    [(BKPictureBookNavigationController *)self zoomToPage:(char *)[(BKPageNavigationViewController *)self pageOffset] + 1 animated:0];
  }
  [(BKPictureBookNavigationController *)self _updateBookScale];
  int64_t v8 = [(BKPageNavigationViewController *)self pageOffset];

  [(BKPictureBookNavigationController *)self _displayPagesForOffset:v8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookNavigationController;
  [(BKPictureBookNavigationController *)&v4 viewWillDisappear:a3];
  [(BKPictureBookCurlState *)self->_curlState killAllCurls];
  [(BKPageCurlManager *)self->_pageCurlManager reset];
  [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
}

- (void)adjustToNewSize:(CGSize)a3
{
}

- (id)viewForLiveResize
{
  return self->_bookView;
}

- (void)_adjustToNewSize:(CGSize)a3 withOptionalTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  [(BKPageCurlManager *)self->_pageCurlManager setHidden:1];
  [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
  CGFloat x = self->_manualCurlStartPosition.x;
  if (x != 0.0) {
    [*(id *)&x cancelManualCurl];
  }
  if (self->_leftContentViewController) {
    [(BKPictureBookNavigationController *)self _killSpreadManualCurl];
  }
  else {
    [(BKPageCurlManager *)self->_pageCurlManager reset];
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_8070;
  v16[3] = &unk_1DAAE8;
  v16[4] = self;
  *(CGFloat *)&v16[5] = width;
  *(CGFloat *)&v16[6] = height;
  objc_super v9 = objc_retainBlock(v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_8448;
  v15[3] = &unk_1DAA18;
  v15[4] = self;
  v10 = objc_retainBlock(v15);
  if (v7)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_8450;
    v13[3] = &unk_1DAB10;
    v14 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8460;
    v11[3] = &unk_1DAB10;
    v12 = v10;
    [v7 animateAlongsideTransition:v13 completion:v11];
  }
  else
  {
    ((void (*)(void *, void))v9[2])(v9, 0);
    ((void (*)(void *, void))v10[2])(v10, 0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(BKPictureBookNavigationController *)self isVisible])
  {
    int64_t v8 = [(BKPageNavigationViewController *)self delegate];
    unsigned __int8 v9 = [v8 inLiveResize];

    if ((v9 & 1) == 0) {
      -[BKPictureBookNavigationController _adjustToNewSize:withOptionalTransitionCoordinator:](self, "_adjustToNewSize:withOptionalTransitionCoordinator:", v7, width, height);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BKPictureBookNavigationController;
  -[BKPictureBookNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  LOBYTE(self->_lastCompletedTransition) = [(BKPictureBookNavigationController *)self singlePageAspectFits];
  if (![(BKPictureBookNavigationController *)self supportsSinglePageMode])
  {
    [(BKPictureBookNavigationController *)self exitSinglePageMode];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookNavigationController;
  [(BKPictureBookNavigationController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(BKPictureBookNavigationController *)self _setupView];
  }
}

- (id)viewControllers
{
  rightContentViewController = self->_rightContentViewController;
  pendingLoads = self->_pendingLoads;
  if (rightContentViewController)
  {
    if (pendingLoads)
    {
      objc_super v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", pendingLoads, 0);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (pendingLoads)
  {
    rightContentViewController = self->_pendingLoads;
LABEL_6:
    objc_super v4 = +[NSArray arrayWithObject:rightContentViewController];
    goto LABEL_8;
  }
  objc_super v4 = 0;
LABEL_8:

  return v4;
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  pageSlideAnimation = self->_pageSlideAnimation;
  if (!pageSlideAnimation)
  {
    objc_super v4 = (BKPageSlide *)[objc_alloc((Class)IMPerformSelectorProxy) initWithTarget:self];
    double v5 = self->_pageSlideAnimation;
    self->_pageSlideAnimation = v4;

    pageSlideAnimation = self->_pageSlideAnimation;
  }

  return (IMPerformSelectorProxy *)pageSlideAnimation;
}

- (id)_createZoomingScrollView
{
  objc_super v3 = -[BKZoomingScrollView initWithFrame:]([BKPictureBookScrollView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BKPictureBookScrollView *)v3 setAutoresizingMask:18];
  [(BKPictureBookScrollView *)v3 setShowsHorizontalScrollIndicator:0];
  [(BKPictureBookScrollView *)v3 setShowsVerticalScrollIndicator:0];
  [(BKPictureBookScrollView *)v3 setDelegate:self];
  [(BKPictureBookScrollView *)v3 setMinimumZoomScale:0.5];
  [(BKPictureBookScrollView *)v3 setMaximumZoomScale:2.0];
  [(BKPictureBookScrollView *)v3 setBouncesZoom:1];
  [(BKPictureBookScrollView *)v3 setDecelerationRate:UIScrollViewDecelerationRateFast];
  [(BKPictureBookScrollView *)v3 setBounces:0];
  [(BKPictureBookScrollView *)v3 setAlwaysBounceVertical:0];
  [(BKPictureBookScrollView *)v3 setAlwaysBounceHorizontal:0];
  [(BKPictureBookScrollView *)v3 setDirectionalLockEnabled:0];
  [(BKPictureBookScrollView *)v3 setOpaque:0];
  [(BKPictureBookScrollView *)v3 setContentInsetAdjustmentBehavior:2];
  objc_super v4 = +[UIColor clearColor];
  [(BKPictureBookScrollView *)v3 setBackgroundColor:v4];

  return v3;
}

- (id)viewForPageNumber:(int64_t)a3
{
  objc_super v4 = [(BKPageNavigationViewController *)self delegate];
  double v5 = [v4 contentViewControllerForPageNumber:a3];

  objc_super v6 = [v5 view];

  return v6;
}

- (void)_applyAdditionalScale:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 loader];
    id v7 = [v6 webView];
    [v7 be_scale];
    double v9 = v8;

    if (v9 >= BEWebViewMinimumZoomScale
      || (double v10 = *(double *)self[1].super.super.IMViewController_opaque, v9 >= v10)
      || v10 <= 0.0)
    {
      v13 = [v5 view];
      v14 = v13;
      long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v17 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v18 = v16;
      long long v19 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v15 = (CGAffineTransform *)&v17;
    }
    else
    {
      double v11 = v9 / v10;
      v12 = _AEWKPictureBookLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 134218240;
        *(double *)((char *)&buf.a + 4) = v11;
        WORD2(buf.b) = 2048;
        *(void *)((char *)&buf.b + 6) = [v5 ordinal];
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "{WebViewLifeCycle} applying additional scale:%f for ordinal:%lu", (uint8_t *)&buf, 0x16u);
      }

      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&buf, v11, v11);
      CGAffineTransform v21 = buf;
      v13 = [v5 view];
      v14 = v13;
      CGAffineTransform v20 = v21;
      v15 = &v20;
    }
    [v13 setTransform:v15, v17, v18, v19, *(_OWORD *)&v20.a, *(_OWORD *)&v20.c, *(_OWORD *)&v20.tx];
  }
}

- (void)_displayPagesForOffset:(int64_t)a3
{
  unsigned int v5 = [(BKPictureBookNavigationController *)self isViewLoaded];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    int64_t v6 = [(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:a3];
    id v7 = [(BKPageNavigationViewController *)self delegate];
    obj = [v7 contentViewControllerForPageNumber:v6];

    double v8 = self->_rightContentViewController;
    if (obj != v8)
    {
      [(BKPictureBookNavigationController *)self addPendingContent:obj];
      [(BKPictureBookNavigationController *)self removePendingContent:v8];
      [(BKPictureBookView *)self->_bookView setLeftContentView:0];
      double v9 = [(BKContentViewController *)obj view];
      [(BKPictureBookView *)self->_bookView setLeftContentView:v9];

      objc_storeStrong((id *)&self->_rightContentViewController, obj);
      objc_opt_class();
      double v10 = BUDynamicCast();
      [(BKPictureBookNavigationController *)self _applyAdditionalScale:v10];
      if ([(BKContentViewController *)v8 isViewLoaded])
      {
        double v11 = [(BKPageNavigationViewController *)self delegate];
        [v11 pageNavigationDidRemoveContentViewController:v8];
      }
    }
    int64_t v12 = [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:a3];
    v13 = [(BKPageNavigationViewController *)self delegate];
    v14 = [v13 contentViewControllerForPageNumber:v12];

    v15 = self->_pendingLoads;
    if (v14 != v15)
    {
      [(BKPictureBookNavigationController *)self addPendingContent:v14];
      [(BKPictureBookNavigationController *)self removePendingContent:v15];
      [(BKPictureBookView *)self->_bookView setRightContentView:0];
      long long v16 = [(NSMutableSet *)v14 view];
      [(BKPictureBookView *)self->_bookView setRightContentView:v16];

      objc_storeStrong((id *)&self->_pendingLoads, v14);
      objc_opt_class();
      long long v17 = BUDynamicCast();
      [(BKPictureBookNavigationController *)self _applyAdditionalScale:v17];
      if ([(NSMutableSet *)v15 isViewLoaded])
      {
        long long v18 = [(BKPageNavigationViewController *)self delegate];
        [v18 pageNavigationDidRemoveContentViewController:v15];
      }
    }
    [(BKPictureBookNavigationController *)self updateVisibleContentViewControllerForOffset:a3];
    [(BKPictureBookNavigationController *)self updateUpsellZoomScale];
  }
}

- (id)_singlePageVisibleContentViewControllerForPageOffset:(int64_t)a3
{
  if ([(BKPictureBookNavigationController *)self inSinglePageMode]
    && ((unsigned int v5 = (char *)[(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:a3]- 1, v6 = [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:a3], v5 == (char *)a3)&& (p_rightContentViewController = (id *)&self->_rightContentViewController, [(BKContentViewController *)self->_rightContentViewController isContentLoaded])|| v6 - 1 == a3&& (p_rightContentViewController = (id *)&self->_pendingLoads, [(NSMutableSet *)self->_pendingLoads isContentLoaded])))
  {
    id v8 = *p_rightContentViewController;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)updateVisibleContentViewControllerForOffset:(int64_t)a3
{
  if ([(BKPictureBookNavigationController *)self inSinglePageMode])
  {
    id v6 = [(BKPictureBookNavigationController *)self _singlePageVisibleContentViewControllerForPageOffset:a3];
    if (v6)
    {
      unsigned int v5 = [(BKPageNavigationViewController *)self delegate];
      [v5 pageNavigationContentViewWillAppear:v6];
    }
  }
}

- (id)contentView
{
  return self->_bookView;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
}

- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a3;
  id v7 = (void (**)(id, void *))a5;
  if (v5) {
    BOOL v5 = [(BKPictureBookNavigationController *)self drawsSpine];
  }
  id v8 = [(BKPictureBookView *)self->_bookView window];

  if (v8)
  {
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    double v10 = v9;
    [(BKPictureBookView *)self->_bookView bounds];
    double v12 = v10 / v11;
    [(BKPictureBookView *)self->_bookView bounds];
    double v14 = v12 * v13;
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    if (v14 > v15)
    {
      [(BKPictureBookScrollView *)self->_scrollView bounds];
      double v17 = v16;
      [(BKPictureBookView *)self->_bookView bounds];
      double v12 = v17 / v18;
    }
    [(BKPictureBookScrollView *)self->_scrollView contentSize];
    CGFloat v20 = v12 * v19;
    [(BKPictureBookScrollView *)self->_scrollView contentSize];
    CGFloat v22 = v12 * v21;
    v23 = [(BKPictureBookView *)self->_bookView im_snapshotInContext];
    v38.double width = v20;
    v38.double height = v22;
    UIGraphicsBeginImageContextWithOptions(v38, 0, 0.0);
    [v23 drawInRect:CGRectMake(0.0, 0.0, v20, v22)];
    objc_super v24 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    v7[2](v7, v24);
  }
  else
  {
    [(BKPictureBookNavigationController *)self contentSize];
    +[BKPictureBookView actualSizeForContentSize:drawsSpine:](BKPictureBookView, "actualSizeForContentSize:drawsSpine:", v5);
    double v26 = v25;
    double v28 = v27;
    v29 = objc_alloc_init(BKPictureBookView);
    [(BKPictureBookNavigationController *)self contentSize];
    -[BKPictureBookView setContentSize:](v29, "setContentSize:");
    -[BKPictureBookView setFrame:](v29, "setFrame:", 0.0, 0.0, v26, v28);
    [(BKPictureBookView *)v29 setOpaque:0];
    [(BKPictureBookView *)v29 setScale:1.0];
    [(BKPictureBookView *)v29 setDrawsSpine:v5];
    objc_initWeak(&location, self);
    int64_t v30 = [(BKPageNavigationViewController *)self pageOffset];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_90D8;
    v32[3] = &unk_1DAB60;
    objc_copyWeak(&v36, &location);
    v31 = v29;
    v33 = v31;
    v34 = self;
    v35 = v7;
    [(BKPictureBookNavigationController *)self _generateLeftPageImageAtPageOffset:v30 completion:v32];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

- (void)_generateLeftPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:a3];
  id v8 = [(BKPageNavigationViewController *)self delegate];
  [v8 pageNavigationSnapshotForPageNumber:v7 completion:v6];
}

- (void)_generateRightPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:a3];
  id v8 = [(BKPageNavigationViewController *)self delegate];
  [v8 pageNavigationSnapshotForPageNumber:v7 completion:v6];
}

- (void)setPageOffset:(int64_t)a3
{
  if (self->super._pageOffset != a3
    || ![(BKPictureBookNavigationController *)self hasTurnedToInitialPage])
  {
    v6.receiver = self;
    v6.super_class = (Class)BKPictureBookNavigationController;
    [(BKPageNavigationViewController *)&v6 setPageOffset:a3];
    if ([(BKPictureBookNavigationController *)self isViewLoaded])
    {
      [(BKPictureBookNavigationController *)self _displayPagesForOffset:a3];
      [(BKPictureBookNavigationController *)self setHasTurnedToInitialPage:1];
      BOOL v5 = [(BKPageNavigationViewController *)self delegate];
      [v5 pageNavigationDidChangeLocation:self];
    }
  }
}

- (_NSRange)visiblePages
{
  unsigned int v3 = [(BKPictureBookNavigationController *)self inSinglePageMode];
  int64_t v4 = [(BKPageNavigationViewController *)self pageOffset];
  if (v3)
  {
    NSUInteger v5 = v4 + 1;
    NSUInteger v6 = 1;
  }
  else
  {
    int64_t v7 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:v4];
    int64_t v8 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
    int64_t v9 = [(BKViewController *)self layoutDirection];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v10 = v7;
    }
    else {
      NSUInteger v10 = v8;
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v11 = v8;
    }
    else {
      NSUInteger v11 = v7;
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v6 = 1;
    }
    else {
      NSUInteger v6 = 2;
    }
    if (v9 == 1) {
      NSUInteger v5 = v10;
    }
    else {
      NSUInteger v5 = v11;
    }
  }
  result.length = v6;
  result.id location = v5;
  return result;
}

- (void)slide:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  [(BKPictureBookScrollView *)self->_scrollView contentOffset];
  double v10 = v9;
  scrollView = self->_scrollView;
  if (v7)
  {
    [(BKPictureBookScrollView *)scrollView contentInset];
    double v13 = -v12;
  }
  else
  {
    [(BKPictureBookScrollView *)scrollView contentSize];
    double v15 = v14;
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    double v16 = v15 - CGRectGetWidth(v53);
    [(BKPictureBookScrollView *)self->_scrollView contentInset];
    double v13 = v16 + v17;
  }
  [(BKPictureBookScrollView *)self->_scrollView contentOffset];
  BOOL v20 = v13 == v19 && v10 == v18;
  if (!v20)
  {
    if (v6)
    {
      [(BKPictureBookNavigationController *)self contentSize];
      double v22 = v21;
      double v24 = v23;
      double v25 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
      BOOL v26 = [(BKPictureBookNavigationController *)self drawsSpine];
      BOOL v27 = [(BKPictureBookNavigationController *)self supportsSinglePageMode];
      [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
      v32 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v25, v26, v27, v22, v24, v28, v29, v30, v31);

      [(BKPictureBookScrollView *)self->_scrollView contentSize];
      double v34 = v33;
      [(BKPictureBookScrollView *)self->_scrollView bounds];
      double v35 = vabdd_f64(v34, CGRectGetWidth(v54));
      [v32 sizeForSpread:0 landscape:isPortrait() ^ 1];
      double v37 = v36;
      double v39 = v38;
      [v32 maximumSize];
      double v41 = v40;
      double v43 = v42;
      [(BKPictureBookScrollView *)self->_scrollView bounds];
      BOOL v20 = v37 == v41;
      double v45 = v35 / v44;
      if (v20 && v39 == v43)
      {
        [(BKPictureBookNavigationController *)self pageCurlManager:self->_curlState durationForCurl:0];
        double v45 = v46;
      }
      dispatch_time_t v47 = dispatch_time(0, 200000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_97F4;
      block[3] = &unk_1DAB88;
      block[4] = self;
      dispatch_after(v47, (dispatch_queue_t)&_dispatch_main_q, block);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_9808;
      v50[3] = &unk_1DABB0;
      v50[4] = self;
      *(double *)&v50[5] = v13;
      *(double *)&v50[6] = v10;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_9858;
      v49[3] = &unk_1DABD8;
      v49[4] = self;
      +[UIView animateWithDuration:4 delay:v50 options:v49 animations:v45 completion:a5];
    }
    else
    {
      v48 = self->_scrollView;
      -[BKPictureBookScrollView setContentOffset:](v48, "setContentOffset:", v13, v10);
    }
  }
}

- (void)_insertDestinationSnapshotImageUnderCurrentPageCurl:(int64_t)a3
{
  NSUInteger v5 = [[BKPageBookCurlView alloc] initWithImage:0 borderColor:0 isLeft:0];
  [(BKPageCurl *)self->_manualCurl frame];
  -[BKPageBookCurlView setFrame:](v5, "setFrame:");
  BOOL v6 = [(BKPictureBookNavigationController *)self theme];
  -[BKPageBookCurlView setUseInvertedColors:](v5, "setUseInvertedColors:", [v6 shouldInvertContent]);

  BOOL v7 = [(BKPageCurl *)self->_manualCurl superview];
  [v7 insertSubview:v5 belowSubview:self->_manualCurl];

  int64_t v8 = [(BKPageNavigationViewController *)self delegate];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_9B48;
  v18[3] = &unk_1DAC00;
  double v9 = v5;
  double v19 = v9;
  [v8 pageNavigationSnapshotForPageNumber:a3 + 1 completion:v18];

  if (*(void *)&self->_desiredScale)
  {
    double v10 = _AEWKPictureBookLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "We only track one lastCurlUnderPageView. removing previous", (uint8_t *)&buf, 2u);
    }

    BUAssertionFailed();
    [*(id *)&self->_desiredScale removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_desiredScale, v5);
  [(BKPictureBookNavigationController *)self performSelector:"_timeOutWaitingForPaint" withObject:0 afterDelay:1.0];
  NSUInteger v11 = [(BKPictureBookNavigationController *)self _singlePageVisibleContentViewControllerForPageOffset:a3];
  objc_initWeak(&buf, self);
  objc_opt_class();
  double v12 = BUDynamicCast();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_9B54;
  v14[3] = &unk_1DAC28;
  objc_copyWeak(&v16, &buf);
  double v13 = v9;
  double v15 = v13;
  [v12 afterEnsuringFirstPaintPerform:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = a4;
    if ((char *)[(BKPageNavigationViewController *)self pageOffset] + 1 != (id)a3)
    {
      BOOL v7 = +[AETestDriver shared];
      [v7 postEvent:kBETestDriverPageTurnStart sender:self];

      int64_t v8 = +[AETestDriver shared];
      [v8 postEvent:kBETestDriverPageTurnSetupStart sender:self];

      self->_cancelControlTapForPageTurn = 1;
      self->_cancelPageChangeForPageTurn = 1;
      uint64_t v9 = [(BKPictureBookNavigationController *)self isVisible] & v4;
      if (v9 == 1 && [(BKPictureBookNavigationController *)self _isFreeScale])
      {
        *(void *)&self->_curlPageForReadAloud = a3;
        double v10 = (char *)[(BKPageNavigationViewController *)self pageOffset] + 1;
        [(BKPictureBookNavigationController *)self zoomToPage:v10 animated:1];
      }
      else
      {
        int64_t v11 = [(BKPageNavigationViewController *)self pageCount];
        if (v11 >= a3) {
          int64_t v12 = a3;
        }
        else {
          int64_t v12 = v11;
        }
        if (v12 <= 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v12;
        }
        uint64_t v14 = v13 - 1;
        int64_t v15 = [(BKViewController *)self layoutDirection];
        if (v15 == 1) {
          BOOL v16 = v13;
        }
        else {
          BOOL v16 = (v13 & 1) == 0;
        }
        unsigned int v17 = [(BKPictureBookNavigationController *)self inSinglePageMode];
        int64_t v18 = [(BKPageNavigationViewController *)self pageOffset];
        if (v17)
        {
          if (!LOBYTE(self->_swipeSelector)
            || (CGFloat x = self->_manualCurlStartPosition.x, x == 0.0)
            || v14 > v18 == [*(id *)&x forwardCurl])
          {
            [(BKPictureBookNavigationController *)self slide:v16 animated:0 withDelay:0.0];
            int64_t v25 = [(BKPageNavigationViewController *)self pageOffset];
            char v26 = v9 ^ 1;
            if (v14 == v25) {
              char v26 = 1;
            }
            if ((v26 & 1) == 0) {
              [(BKPictureBookNavigationController *)self _autoCurlToSinglePageOffset:v14 forwardCurl:v14 > v18];
            }
            [(BKPictureBookNavigationController *)self setPageOffset:v14];
            if (HIBYTE(self->_lastCompletedTransition))
            {
              [(BKPictureBookNavigationController *)self _insertDestinationSnapshotImageUnderCurrentPageCurl:v14];
            }
          }
          else
          {
            [*(id *)&self->_manualCurlStartPosition.x cancelManualCurl];
            self->_curlPageForReadAloudSelector = "turnToPreviousPage";
            LOBYTE(self->_swipeSelector) = 0;
          }
        }
        else
        {
          int64_t v20 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:v18];
          int64_t v21 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:v14];
          char v22 = v9 ^ 1;
          double v23 = 0.0;
          if (v20 == v21) {
            char v22 = 1;
          }
          if ((v22 & 1) == 0)
          {
            uint64_t v24 = (v15 == 1) ^ (v14 > [(BKPageNavigationViewController *)self pageOffset]);
            if (HIBYTE(self->_lastCompletedTransition)) {
              [(BKPictureBookNavigationController *)self _autoCurlToSpreadPageOffset:v14 forwardCurl:v24];
            }
            else {
              [(BKPictureBookNavigationController *)self _autoSlideToSpreadPageOffset:v14 forwardCurl:v24];
            }
            double v23 = 0.2;
          }
          [(BKPictureBookNavigationController *)self slide:v16 animated:v9 withDelay:v23];
          [(BKPictureBookNavigationController *)self setPageOffset:v14];
        }
      }
    }
  }
}

- (void)_autoSlideToSpreadPageOffset:(int64_t)a3 forwardCurl:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v35 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  int64_t v34 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  int64_t v7 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:a3];
  int64_t v8 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:a3];
  id v36 = (id)objc_opt_new();
  BOOL v9 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
  [(BKPictureBookNavigationController *)self contentSize];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
  BOOL v15 = [(BKPictureBookNavigationController *)self drawsSpine];
  BOOL v16 = [(BKPictureBookNavigationController *)self supportsSinglePageMode];
  [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
  int64_t v21 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v14, v15, v16, v11, v13, v17, v18, v19, v20);

  [v21 scaleForSpread:v9 landscape:isPortrait() ^ 1];
  if (v22 >= BEWebViewMinimumZoomScale) {
    double v23 = v22;
  }
  else {
    double v23 = BEWebViewMinimumZoomScale;
  }
  p_pageCurlManager = &self->_pageCurlManager;
  [(BKPageCurlManager *)self->_pageCurlManager setScale:v23];
  if (BYTE2(self->_lastCompletedTransition)) {
    [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
  }
  else {
    [(BKPictureBookNavigationController *)self _resetCurlContainerFrame];
  }
  [v36 setScale:v23];
  [v36 setCurlContainer:*p_pageCurlManager];
  int64_t v25 = [(BKPageNavigationViewController *)self delegate];
  [v36 setNavDelegate:v25];

  [v36 setForwardCurl:v4];
  [v36 setAutoCurl:1];
  [v36 setApplyMaskAndGutter:[self drawsSpine]];
  char v26 = [(BKPictureBookNavigationController *)self pageCurlManager];
  id v27 = [v26 numberOfQueuedCurls];

  if (!v27)
  {
    if ([(BKContentViewController *)self->_rightContentViewController isContentLoaded])
    {
      double v28 = [(BKContentViewController *)self->_rightContentViewController view];
      [v36 setLeftSourceView:v28];
    }
    if ([(NSMutableSet *)self->_pendingLoads isContentLoaded])
    {
      double v29 = [(NSMutableSet *)self->_pendingLoads view];
      [v36 setRightSourceView:v29];
    }
    [(BKPictureBookView *)self->_bookView setLeftContentView:0];
    [(BKPictureBookView *)self->_bookView setRightContentView:0];
  }
  int64_t v30 = [(BKViewController *)self layoutDirection];
  [v36 generateWithOldLeftPageNumber:v35 oldRightPageNumber:v34 newLeftPageNumber:v7 newRightPageNumber:v8 useMirrorForBackImage:0];
  double v31 = objc_alloc_init(BKPageSlide);
  [(BKPageAnimation *)v31 setPageAnimationDelegate:self];
  v32 = [v36 pageArray];
  double v33 = [v36 backPageArray];
  if (BYTE2(self->_lastCompletedTransition)) {
    p_pageCurlManager = &self->_manualCurl;
  }
  [(BKPageSlide *)v31 autoSlideFromPages:v32 toPages:v33 inContainer:*p_pageCurlManager isForwardAnimation:v4 isRTL:v30 == 1 isZoomedToSpread:v9 completion:0];
}

- (void)turnToNextPage
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSpread]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  [(BKPageNavigationViewController *)self turnToNextPageWithDelta:v3];
}

- (void)turnToPreviousPage
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSpread]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  [(BKPageNavigationViewController *)self turnToPreviousPageWithDelta:v3];
}

- (void)transitionDidFinish:(BOOL)a3
{
  if (a3) {
    [(BKPictureBookNavigationController *)self setLastCompletedTransition:1];
  }
  else {
    [(BKPictureBookNavigationController *)self setLastCompletedTransition:2];
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize.double width = fmax(a3.width, 100.0);
    self->_contentSize.double height = fmax(a3.height, 100.0);
    -[BKPictureBookView setContentSize:](self->_bookView, "setContentSize:");
  }
}

- (BOOL)isContentRenderComplete
{
  return [self->_needsTurnToPageNumber count] == 0;
}

- (void)addPendingContent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v7 = v4;
    if ([v4 isLoading])
    {
      NSUInteger v5 = +[NSNotificationCenter defaultCenter];
      [v5 addObserver:self selector:"_contentIsReadyOrFailed:" name:BKContentReadyNotification object:v7];
      [v5 addObserver:self selector:"_contentIsReadyOrFailed:" name:BKContentFAILNotification object:v7];
      [(BKPictureBookNavigationController *)self willChangeValueForKey:@"isContentRenderComplete"];
      [self->_needsTurnToPageNumber addObject:v7];
      [(BKPictureBookNavigationController *)self didChangeValueForKey:@"isContentRenderComplete"];
      BOOL v6 = [v7 view];
      [v6 setHidden:1];
    }
  }

  _objc_release_x1();
}

- (void)removePendingContent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v7 = v4;
    if ([self->_needsTurnToPageNumber containsObject:v4])
    {
      NSUInteger v5 = +[NSNotificationCenter defaultCenter];
      [v5 removeObserver:self name:BKContentReadyNotification object:v7];
      [v5 removeObserver:self name:BKContentFAILNotification object:v7];
      [(BKPictureBookNavigationController *)self willChangeValueForKey:@"isContentRenderComplete"];
      [self->_needsTurnToPageNumber removeObject:v7];
      [(BKPictureBookNavigationController *)self didChangeValueForKey:@"isContentRenderComplete"];
      if (![self->_needsTurnToPageNumber count])
      {
        [(BKPictureBookNavigationController *)self _resetCurlContainer];
        [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
      }
      BOOL v6 = [v7 view];
      [v6 setHidden:0];
    }
  }

  _objc_release_x1();
}

- (void)_contentIsReadyOrFailed:(id)a3
{
  id v4 = [a3 object];
  [(BKPictureBookNavigationController *)self removePendingContent:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 performSelector:"playFirstVisibleAutoplayMediaObject" withObject:0 afterDelay:0.25];
  }
}

- (BKPageCurlManager)pageCurlManager
{
  curlState = self->_curlState;
  if (!curlState)
  {
    id v4 = [[BKPageCurlManager alloc] initWithContext:self];
    NSUInteger v5 = self->_curlState;
    self->_curlState = (BKPictureBookCurlState *)v4;

    [(BKPictureBookCurlState *)self->_curlState setDelegate:self];
    curlState = self->_curlState;
  }

  return (BKPageCurlManager *)curlState;
}

- (id)thumbnailBookViewConfiguration
{
  return [(BKPictureBookNavigationController *)self im_ancestorConfigurationConformingToProtocol:&OBJC_PROTOCOL___BKThumbnailBookViewConfiguring];
}

- (int)tapActionForLocation:(CGPoint)a3 view:(id)a4 ignoreOppositePage:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  double v10 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
  [v10 tapToTurnWidth];
  double v12 = v11;

  double v13 = +[NSUserDefaults standardUserDefaults];
  unsigned int v14 = [v13 BOOLForKey:BKLeftTapTurnToNextDefault[0]];

  int64_t v15 = [(BKViewController *)self layoutDirection];
  [v9 bounds];
  if (x > CGRectGetMaxX(v29) - v12) {
    goto LABEL_2;
  }
  [v9 bounds];
  if (x < v12 + CGRectGetMinX(v30)) {
    goto LABEL_4;
  }
  [v9 convertPoint:x toView:y];
  double v21 = v20;
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  double v23 = v22;
  [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
  if (v23 > v24 && !a5 && ![(BKPictureBookNavigationController *)self inSinglePageMode])
  {
    uint64_t v25 = [(BKPageNavigationViewController *)self pageOffset];
    uint64_t v26 = v25 & 1;
    if (v25 < 0) {
      uint64_t v26 = -v26;
    }
    if (v26 == (v15 != 1))
    {
      [(BKPictureBookView *)self->_bookView bounds];
      if (v21 > CGRectGetMidX(v31)) {
        goto LABEL_2;
      }
    }
    uint64_t v27 = [(BKPageNavigationViewController *)self pageOffset];
    uint64_t v28 = v27 & 1;
    if (v27 < 0) {
      uint64_t v28 = -v28;
    }
    if (v28 == (v15 == 1))
    {
      [(BKPictureBookView *)self->_bookView bounds];
      if (v21 < CGRectGetMidX(v32))
      {
LABEL_4:
        int v16 = 1;
        goto LABEL_5;
      }
    }
  }
  [(BKPictureBookView *)self->_bookView bounds];
  if (v21 <= CGRectGetMidX(v33)
    || ([(BKPictureBookView *)self->_bookView bounds], v21 <= CGRectGetMaxX(v34) - v12))
  {
    [(BKPictureBookView *)self->_bookView bounds];
    if (v21 >= CGRectGetMidX(v35)
      || ([(BKPictureBookView *)self->_bookView bounds], v21 >= v12 + CGRectGetMinX(v36)))
    {
      int v18 = 0;
      goto LABEL_11;
    }
    goto LABEL_4;
  }
LABEL_2:
  int v16 = 2;
LABEL_5:
  if (v15 == 1) {
    int v17 = 1;
  }
  else {
    int v17 = 2;
  }
  if (v14) {
    int v18 = v17;
  }
  else {
    int v18 = v16;
  }
LABEL_11:

  return v18;
}

- (void)handlePageChangeTap:(id)a3
{
  if (!self->_cancelPageChangeForPageTurn)
  {
    id v4 = a3;
    id v12 = [v4 view];
    [v4 locationInView:v12];
    double v6 = v5;
    double v8 = v7;

    unsigned int v9 = -[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v12, 0, v6, v8);
    if ([(BKPictureBookNavigationController *)self isZoomedBeyondPage] && v9)
    {
      [(BKPictureBookView *)self->_bookView frame];
      double MidX = CGRectGetMidX(v14);
      [(BKPictureBookScrollView *)self->_scrollView bounds];
      [(BKPictureBookNavigationController *)self zoom:MidX > CGRectGetMidX(v15) animated:1];
    }
    else if (v9 == 1)
    {
      [(BKPictureBookNavigationController *)self turnToPreviousPage];
    }
    else if (v9 == 2)
    {
      [(BKPictureBookNavigationController *)self turnToNextPage];
    }
    double v11 = [(BKPageNavigationViewController *)self delegate];
    [v11 pageNavigationDidBeginInteracting:self];
  }
}

- (void)handleDoubleTap:(id)a3
{
  id v15 = a3;
  id v4 = [v15 view];
  [v15 locationInView:v4];
  [v4 convertPoint:self->_bookView toView:];
  double v6 = v5;
  [(BKPictureBookView *)self->_bookView bounds];
  double MidX = CGRectGetMidX(v17);
  if ([(BKPictureBookNavigationController *)self isZoomedBeyondPage]
    || [(BKPictureBookNavigationController *)self _isFreeScale])
  {
    if (![(BKPictureBookNavigationController *)self supportsSinglePageMode])
    {
      [(BKPictureBookScrollView *)self->_scrollView bounds];
      double v9 = v8;
      [(BKPictureBookScrollView *)self->_scrollView bounds];
      if (v9 >= v10)
      {
        [(BKPictureBookNavigationController *)self zoomToSpread:1];
        goto LABEL_10;
      }
    }
    goto LABEL_8;
  }
  if (![(BKPictureBookNavigationController *)self isZoomedToSinglePage])
  {
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    double v12 = v11;
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    if (v12 < v13)
    {
LABEL_8:
      [(BKPictureBookNavigationController *)self zoom:v6 <= MidX animated:1];
      goto LABEL_10;
    }
  }
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  [(BKPictureBookScrollView *)self->_scrollView maximumZoomScale];
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  [v15 locationInView:v4];
  [v4 convertPoint:self->_bookView toView:];
  -[BKPictureBookNavigationController zoomToPoint:scale:animated:](self, "zoomToPoint:scale:animated:", 1);
LABEL_10:
  CGRect v14 = [(BKPageNavigationViewController *)self delegate];
  [v14 pageNavigationDidBeginInteracting:self];
}

- (void)toggleControls:(id)a3
{
  id v8 = a3;
  leftContentViewController = self->_leftContentViewController;
  if (leftContentViewController
    && ([(BKContentViewController *)leftContentViewController isAutoCurl] & 1) == 0)
  {
    [(BKContentViewController *)self->_leftContentViewController cancelManualCurl];
  }
  CGFloat x = self->_manualCurlStartPosition.x;
  if (x != 0.0) {
    [*(id *)&x cancelManualCurl];
  }
  if (!self->_cancelControlTapForPageTurn)
  {
    double v6 = [(BKPictureBookNavigationController *)self presentedViewController];

    if (!v6)
    {
      double v7 = [(BKPageNavigationViewController *)self delegate];
      [v7 pageNavigationToggleControls:self];
    }
  }
}

- (void)leftSwipe:(id)a3
{
  int64_t v4 = [(BKViewController *)self layoutDirection];
  int64_t v5 = [(BKPageNavigationViewController *)self pageOffset];
  int64_t v6 = [(BKPageNavigationViewController *)self pageCount];
  [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:0];
  [(BKPictureBookNavigationController *)self turnToNextPage];
  [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:[(BKPictureBookNavigationController *)self inSinglePageMode] ^ 1];
  double v7 = [(BKPageNavigationViewController *)self delegate];
  [v7 pageNavigationDidBeginInteracting:self];

  if (v4 != 1)
  {
    id v8 = [(BKPageNavigationViewController *)self delegate];
    id v9 = v8;
    if (v5 == v6 - 1) {
      [v8 pageNavigationDidTryToSwipePastEndOfBook:self];
    }
    else {
      [v8 pageNavigationDidSwipeToNextPage:self];
    }
  }
}

- (void)rightSwipe:(id)a3
{
  int64_t v4 = [(BKViewController *)self layoutDirection];
  int64_t v5 = [(BKPageNavigationViewController *)self pageOffset];
  int64_t v6 = [(BKPageNavigationViewController *)self pageCount];
  [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:0];
  [(BKPictureBookNavigationController *)self turnToPreviousPage];
  [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:[(BKPictureBookNavigationController *)self inSinglePageMode] ^ 1];
  double v7 = [(BKPageNavigationViewController *)self delegate];
  [v7 pageNavigationDidBeginInteracting:self];

  if (v4 == 1)
  {
    id v8 = [(BKPageNavigationViewController *)self delegate];
    id v9 = v8;
    if (v5 == v6 - 1) {
      [v8 pageNavigationDidTryToSwipePastEndOfBook:self];
    }
    else {
      [v8 pageNavigationDidSwipeToNextPage:self];
    }
  }
}

- (BOOL)_hasMediaElementAtTouch:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BKPictureBookNavigationController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  LOBYTE(self) = -[BKPictureBookNavigationController hasMediaElementAtPoint:inView:](self, "hasMediaElementAtPoint:inView:", v5, v7, v9);
  return (char)self;
}

- (BOOL)hasMediaElementAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = [(BKPictureBookNavigationController *)self viewControllers];
  double v9 = (char *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    double v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        double v13 = BUDynamicCast();
        if (v13
          && -[BKPictureBookNavigationController _contentController:hasMediaElementAtPoint:inView:](self, "_contentController:hasMediaElementAtPoint:inView:", v13, v7, x, y))
        {

          BOOL v14 = 1;
          goto LABEL_12;
        }
      }
      double v10 = (char *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_contentController:(id)a3 hasMediaElementAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 webView2];
  uint64_t v11 = [v10 be_contentView];
  [v11 convertPoint:v9 fromView:x, y];
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = [v8 loader];
  long long v17 = [v16 mediaFrames];
  long long v18 = [v17 allValues];

  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) CGRectValue];
        v28.double x = v13;
        v28.double y = v15;
        if (CGRectContainsPoint(v29, v28))
        {
          LOBYTE(v19) = 1;
          goto LABEL_11;
        }
      }
      id v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v19;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if ((self->_pageChangeTapRecognizer == v6 || self->_controlsTapRecognizer == v6)
    && [(BKPictureBookNavigationController *)self _hasMediaElementAtTouch:v7])
  {
    goto LABEL_6;
  }
  if (self->_doubleTapGestureRecognizer != v6) {
    goto LABEL_7;
  }
  id v8 = [(UITapGestureRecognizer *)v6 view];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  CGFloat v13 = [(UITapGestureRecognizer *)v6 view];
  unsigned int v14 = -[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v13, 1, v10, v12);

  if (v14) {
LABEL_6:
  }
    BOOL v15 = 0;
  else {
LABEL_7:
  }
    BOOL v15 = 1;

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  int64_t v5 = v4;
  if (self->_pageChangeTapRecognizer == v4)
  {
    self->_cancelPageChangeForPageTurn = 0;
    id v7 = [(UITapGestureRecognizer *)v4 view];
    [(UITapGestureRecognizer *)v5 locationInView:v7];
    LOBYTE(v6) = -[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v7, [(BKPictureBookNavigationController *)self isZoomedBeyondPage], v8, v9) != 0;
LABEL_15:

    goto LABEL_16;
  }
  if (self->_doubleTapGestureRecognizer == v4)
  {
    id v7 = [(UITapGestureRecognizer *)v4 view];
    [(UITapGestureRecognizer *)v5 locationInView:v7];
    LOBYTE(v6) = !-[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v7, 1)&& [(BKPageCurlManager *)self->_pageCurlManager isHidden]&& ([(BKPageCurl *)self->_manualCurl isHidden] & 1) != 0;
    goto LABEL_15;
  }
  if ((UITapGestureRecognizer *)self->_leftSwipeGestureRecognizer == v4)
  {
    [(BKPictureBookScrollView *)self->_scrollView contentOffset];
    double v12 = v11;
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    double v13 = v12 + CGRectGetWidth(v22);
    [(BKPictureBookScrollView *)self->_scrollView contentSize];
    double v15 = v14 + -5.0;
    LOBYTE(v6) = v13 >= v14 + -5.0;
    leftContentViewController = self->_leftContentViewController;
    if (!leftContentViewController
      || [(BKContentViewController *)leftContentViewController isAutoCurl])
    {
      unsigned __int8 v17 = [(BKPictureBookNavigationController *)self inSinglePageMode];
      if (v13 >= v15) {
        LOBYTE(v6) = 1;
      }
      else {
        LOBYTE(v6) = v17;
      }
    }
  }
  else
  {
    if ((UITapGestureRecognizer *)self->_rightSwipeGestureRecognizer != v4)
    {
      if (self->_controlsTapRecognizer == v4)
      {
        self->_cancelControlTapForPageTurn = 0;
      }
      else if ((UITapGestureRecognizer *)self->_manualCurlGestureRecognizer == v4 {
             || (UITapGestureRecognizer *)self->_panManualCurlGestureRecognizer == v4)
      }
      {
        unsigned int v6 = ![(BKPictureBookNavigationController *)self isZoomedBeyondPage];
        goto LABEL_16;
      }
      LOBYTE(v6) = 1;
      goto LABEL_16;
    }
    long long v18 = self->_leftContentViewController;
    if (v18 && ([(BKContentViewController *)v18 isAutoCurl] & 1) == 0)
    {
      [(BKContentViewController *)self->_leftContentViewController cancelManualCurl];
      int v19 = 0;
      self->_curlPageForReadAloudSelector = "turnToPreviousPage";
    }
    else
    {
      int v19 = 1;
    }
    [(BKPictureBookScrollView *)self->_scrollView contentOffset];
    CGFloat x = self->_manualCurlStartPosition.x;
    if (x == 0.0)
    {
      if (v20 > 5.0) {
        int v19 = 0;
      }
      unsigned int v6 = [(BKPictureBookNavigationController *)self inSinglePageMode] | v19;
    }
    else
    {
      [*(id *)&x cancelManualCurl];
      LOBYTE(v6) = 0;
      self->_curlPageForReadAloudSelector = "turnToPreviousPage";
    }
  }
LABEL_16:

  return v6;
}

- (BOOL)isMediaPlayerGestureRecognizer:(id)a3
{
  id v3 = a3;
  NSClassFromString(@"MPTapGestureRecognizer");
  BOOL v4 = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(@"MPSwipeGestureRecognizer");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(@"MPActivityGestureRecognizer");
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          BOOL v4 = 0;
        }
      }
    }
  }

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_doubleTapGestureRecognizer == a3 || self->_pageChangeTapRecognizer == a3) {
    unsigned __int8 v8 = [v6 bk_isWKSyntheticTapGestureRecognizer];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6 = (UISwipeGestureRecognizer *)a3;
  id v7 = a4;
  NSClassFromString(@"UIWebTouchEventsGestureRecognizer");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(@"WKTouchEventsGestureRecognizer"), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_9:
    char isKindOfClass = 1;
    goto LABEL_10;
  }
  if ((UISwipeGestureRecognizer *)self->_doubleTapGestureRecognizer != v6
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (self->_leftSwipeGestureRecognizer == v6 || self->_rightSwipeGestureRecognizer == v6)
    {
      NSClassFromString(@"UITextRangeAdjustmentGestureRecognizer");
      char isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v8 = v7;
  if ([v8 numberOfTapsRequired] == (char *)&dword_0 + 2) {
    char isKindOfClass = [v8 matchesTarget:+[UIView be_wkContentViewClass](UIView, "be_wkContentViewClass") andAction:_nonBlockingDoubleTapRecognized:];
  }
  else {
    char isKindOfClass = 1;
  }

LABEL_10:
  return isKindOfClass & 1;
}

- (void)pageAnimationWillBegin:(id)a3
{
  if ([(BKPictureBookNavigationController *)self inSinglePageMode])
  {
    BOOL v4 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
    [v4 setHidden:0];
  }
  else
  {
    [(BKPageCurlManager *)self->_pageCurlManager setHidden:0];
  }
  scrollView = self->_scrollView;

  [(BKPictureBookScrollView *)scrollView setScrollEnabled:0];
}

- (void)pageAnimation:(id)a3 didFinish:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if ([v12 state] != (char *)&dword_0 + 2)
  {
    if ([(BKPictureBookNavigationController *)self inSinglePageMode])
    {
      [(BKPictureBookNavigationController *)self slide:[(BKPictureBookNavigationController *)self isZoomedToRightPage] animated:0 withDelay:0.0];
      [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
    }
    else
    {
      id v6 = [v12 existingPages];
      [(BKPictureBookNavigationController *)self _restoreViewHierarchyWithArray:v6];
    }
  }
  [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:[(BKPictureBookNavigationController *)self inSinglePageMode] ^ 1];
  CGFloat x = self->_manualCurlStartPosition.x;
  self->_manualCurlStartPosition.CGFloat x = 0.0;

  leftContentViewController = self->_leftContentViewController;
  self->_leftContentViewController = 0;

  if (v4)
  {
    if ([v12 finished]) {
      [(BKPictureBookNavigationController *)self _resetCurlContainer];
    }
    if ([(BKPictureBookNavigationController *)self inSinglePageMode]
      && [v12 state] == &dword_4)
    {
      [(BKPictureBookNavigationController *)self slide:[(BKPictureBookNavigationController *)self isZoomedToRightPage] animated:0 withDelay:0.0];
    }
    [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
    p_singlePageCurlContainer = (uint64_t *)&self->_singlePageCurlContainer;
    if (self->_singlePageCurlContainer
      && ![(BKPictureBookCurlState *)self->_curlState numberOfQueuedCurls])
    {
      if (*p_singlePageCurlContainer) {
        uint64_t v10 = *p_singlePageCurlContainer;
      }
      else {
        uint64_t v10 = 0;
      }
      [(BKPictureBookNavigationController *)self performSelector:v10 withObject:&__kCFBooleanTrue];
LABEL_23:
      uint64_t *p_singlePageCurlContainer = 0;
    }
  }
  else
  {
    p_singlePageCurlContainer = (uint64_t *)&self->_curlPageForReadAloudSelector;
    if (self->_curlPageForReadAloudSelector
      && ![(BKPictureBookScrollView *)self->_scrollView touchInProgress])
    {
      if (*p_singlePageCurlContainer) {
        uint64_t v11 = *p_singlePageCurlContainer;
      }
      else {
        uint64_t v11 = 0;
      }
      [(BKPictureBookNavigationController *)self performSelector:v11];
      goto LABEL_23;
    }
  }
}

- (double)pageAnimationDurationFor:(id)a3
{
  return 0.400000006;
}

- (void)pageCurlManager:(id)a3 willBeginCurl:(id)a4
{
  if ([(BKPictureBookNavigationController *)self inSinglePageMode])
  {
    int64_t v5 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
    [v5 setHidden:0];
  }
  else
  {
    [(BKPageCurlManager *)self->_pageCurlManager setHidden:0];
  }
  scrollView = self->_scrollView;

  [(BKPictureBookScrollView *)scrollView setScrollEnabled:0];
}

- (void)pageCurlManager:(id)a3 didFinishCurl:(id)a4 transitionCompleted:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  if (!v5)
  {
    if ([(BKPictureBookNavigationController *)self inSinglePageMode])
    {
      [(BKPictureBookNavigationController *)self slide:[(BKPictureBookNavigationController *)self isZoomedToRightPage] animated:0 withDelay:0.0];
      [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
    }
    else
    {
      double v9 = [v8 existingPages];
      [(BKPictureBookNavigationController *)self _restoreViewHierarchyWithArray:v9];
    }
  }
  [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:[(BKPictureBookNavigationController *)self inSinglePageMode] ^ 1];
  CGFloat x = self->_manualCurlStartPosition.x;
  self->_manualCurlStartPosition.CGFloat x = 0.0;

  leftContentViewController = self->_leftContentViewController;
  self->_leftContentViewController = 0;

  if (v5)
  {
    if ([v8 finished]) {
      [(BKPictureBookNavigationController *)self _resetCurlContainer];
    }
    if ([(BKPictureBookNavigationController *)self inSinglePageMode]
      && [v8 state] == &dword_4)
    {
      [(BKPictureBookNavigationController *)self slide:[(BKPictureBookNavigationController *)self isZoomedToRightPage] animated:0 withDelay:0.0];
    }
    [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer:v8];
    p_singlePageCurlContainer = (uint64_t *)&self->_singlePageCurlContainer;
    if (self->_singlePageCurlContainer && ![v15 numberOfQueuedCurls])
    {
      if (*p_singlePageCurlContainer) {
        uint64_t v13 = *p_singlePageCurlContainer;
      }
      else {
        uint64_t v13 = 0;
      }
      [(BKPictureBookNavigationController *)self performSelector:v13 withObject:&__kCFBooleanTrue];
LABEL_23:
      uint64_t *p_singlePageCurlContainer = 0;
    }
  }
  else
  {
    p_singlePageCurlContainer = (uint64_t *)&self->_curlPageForReadAloudSelector;
    if (self->_curlPageForReadAloudSelector
      && ![(BKPictureBookScrollView *)self->_scrollView touchInProgress])
    {
      if (*p_singlePageCurlContainer) {
        uint64_t v14 = *p_singlePageCurlContainer;
      }
      else {
        uint64_t v14 = 0;
      }
      [(BKPictureBookNavigationController *)self performSelector:v14];
      goto LABEL_23;
    }
  }
}

- (void)pageCurlManager:(id)a3 didCancelCurl:(id)a4
{
  uint64_t v5 = [(BKPictureBookNavigationController *)self inSinglePageMode] ^ 1;
  scrollView = self->_scrollView;

  [(BKPictureBookScrollView *)scrollView setScrollEnabled:v5];
}

- (double)pageCurlManager:(id)a3 durationForCurl:(id)a4
{
  return 0.400000006;
}

- (void)setSelectionHighlightsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  -[BKContentViewController setSelectionHighlightsVisible:](self->_rightContentViewController, "setSelectionHighlightsVisible:");
  pendingLoads = self->_pendingLoads;

  [(NSMutableSet *)pendingLoads setSelectionHighlightsVisible:v3];
}

- (void)_updateSelectionHighlights
{
  [(BKContentViewController *)self->_rightContentViewController updateSelectionHighlights];
  pendingLoads = self->_pendingLoads;

  [(NSMutableSet *)pendingLoads updateSelectionHighlights];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v14 = a3;
  [v14 contentOffset];
  double v4 = v3;
  double v6 = v5;
  [v14 contentSize];
  double v8 = v7;
  [v14 bounds];
  if (v8 > CGRectGetWidth(v16))
  {
    double v9 = 0.0;
    if (v4 >= 0.0)
    {
      [v14 contentSize];
      double v11 = v10;
      [v14 bounds];
      if (v4 <= ceil(v11 - CGRectGetWidth(v17))) {
        goto LABEL_6;
      }
      [v14 contentSize];
      double v13 = v12;
      [v14 bounds];
      double v9 = round(v13 - CGRectGetWidth(v18));
    }
    [v14 setContentOffset:v9, v6];
  }
LABEL_6:
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_bookView;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(BKPageNavigationViewController *)self delegate];
  [v4 pageNavigationDidBeginInteracting:self];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  [(BKZoomingScrollView *)self->_scrollView pointToCenterAfterRotation];
  double v7 = v6;
  if (![(BKPictureBookNavigationController *)self isZoomedToSpread])
  {
    [(BKPictureBookView *)self->_bookView bounds];
    double MidX = CGRectGetMidX(v12);
    int64_t v9 = [(BKPageNavigationViewController *)self pageOffset];
    int64_t v10 = v7 <= MidX
        ? [(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:v9]: [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:v9];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(BKPictureBookNavigationController *)self setPageOffset:v10 - 1];
    }
  }
  if (!a4)
  {
    [(BKPictureBookNavigationController *)self _updateSelectionHighlights];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidZoom:(id)a3
{
  if (!+[BKBookViewController useEnhancedEditMenu]) {
    +[UIView performWithoutAnimation:&stru_1DAC48];
  }
  scrollView = self->_scrollView;

  [(BKZoomingScrollView *)scrollView centerContent];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5 = a3;
  double v6 = [(BKPageNavigationViewController *)self delegate];
  [v6 pageNavigationDidBeginInteracting:self];

  [v5 setBounces:1];
  [v5 setAlwaysBounceVertical:1];
  [v5 setAlwaysBounceHorizontal:0];

  double v7 = [(BKContentViewController *)self->_leftContentViewController pageCurl];
  double v8 = [v7 existingPages];
  [(BKPictureBookNavigationController *)self _restoreViewHierarchyWithArray:v8];

  if (!+[BKBookViewController useEnhancedEditMenu]) {
    +[UIView performWithoutAnimation:&stru_1DAC68];
  }

  [(BKPictureBookNavigationController *)self exitSinglePageMode];
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7 = a3;
  if ([(BKPictureBookNavigationController *)self isZoomedToSpread])
  {
    double v8 = +[AETestDriver shared];
    [v8 postEvent:kBETestDriverFXLZoomToSpreadEnd sender:self];
  }
  if (*(void *)&self->_curlPageForReadAloud)
  {
    dispatch_time_t v9 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_C518;
    block[3] = &unk_1DAB88;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
    [(BKPictureBookNavigationController *)self _updateBookScale];
  }
  else
  {
    if ([(BKPictureBookNavigationController *)self isZoomedToSinglePage])
    {
      [(BKZoomingScrollView *)self->_scrollView pointToCenterAfterRotation];
      double v11 = v10;
      [(BKPictureBookView *)self->_bookView bounds];
      [(BKPictureBookNavigationController *)self zoom:v11 <= CGRectGetMidX(v15) animated:1];
    }
    else if ([(BKPictureBookNavigationController *)self isZoomedCloseToSpread])
    {
      [(BKPictureBookNavigationController *)self zoomToSpread:1];
    }
    [(BKPictureBookScrollView *)self->_scrollView zoomScale];
    if (v12 == a5)
    {
      [(BKPictureBookNavigationController *)self _updateBookScale];
      if ([(BKPictureBookNavigationController *)self isZoomedToSinglePage]) {
        [(BKPictureBookNavigationController *)self enterSinglePageMode];
      }
    }
    BOOL v13 = [(BKPictureBookNavigationController *)self _isFreeScale];
    [v7 setBounces:v13];
    [v7 setAlwaysBounceVertical:v13];
    [v7 setAlwaysBounceHorizontal:0];
  }
}

- (double)singlePagePadding
{
  if ([(BKPictureBookNavigationController *)self supportsSinglePageMode]) {
    return 0.0;
  }
  id v4 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
  [v4 singlePagePadding];
  double v6 = v5;

  return v6;
}

- (double)effectiveZoomScale
{
  [(BKPictureBookView *)self->_bookView scale];
  double v4 = v3;
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  return v4 * v5;
}

- (BOOL)isZoomedToSinglePage
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSpread]) {
    return 0;
  }
  [(BKPictureBookNavigationController *)self effectiveZoomScale];
  double v5 = v4;
  [(BKPictureBookNavigationController *)self singlePageZoomScale];
  return vabdd_f64(v5, v6) < 0.07;
}

- (BOOL)isZoomedToRightPage
{
  BOOL v3 = [(BKPictureBookNavigationController *)self isZoomedToSinglePage];
  if (v3)
  {
    [(BKPictureBookScrollView *)self->_scrollView contentOffset];
    double v5 = v4;
    [(BKPictureBookScrollView *)self->_scrollView frame];
    double v7 = v5 + v6;
    [(BKPictureBookScrollView *)self->_scrollView contentSize];
    LOBYTE(v3) = vabdd_f64(v7, v8) <= 10.0;
  }
  return v3;
}

- (BOOL)shouldZoomToSinglePage
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSpread]) {
    return 0;
  }
  [(BKPictureBookNavigationController *)self effectiveZoomScale];
  double v5 = v4;
  [(BKPictureBookNavigationController *)self singlePageZoomScale];
  return vabdd_f64(v5, v6) < 0.07;
}

- (BOOL)isZoomedBeyondPage
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSinglePage]) {
    return 0;
  }
  [(BKPictureBookNavigationController *)self effectiveZoomScale];
  double v5 = v4;
  [(BKPictureBookNavigationController *)self singlePageZoomScale];
  return v5 > v6;
}

- (BOOL)isZoomedCloseToSpread
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSpread]) {
    return 0;
  }
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  double v5 = v4;
  [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
  return vabdd_f64(v5, v6) < 0.23;
}

- (BOOL)isZoomedToSpread
{
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  double v4 = v3;
  [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
  return vabdd_f64(v4, v5) < 0.01;
}

- (BOOL)_isFreeScale
{
  if ([(BKPictureBookNavigationController *)self isZoomedToSinglePage]) {
    return 0;
  }
  else {
    return ![(BKPictureBookNavigationController *)self isZoomedToSpread];
  }
}

- (BOOL)currentlyZoomed
{
  if ([(BKPictureBookNavigationController *)self _isFreeScale]) {
    return 1;
  }

  return [(BKPictureBookNavigationController *)self isZoomedToSinglePage];
}

- (BOOL)canZoomMore
{
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  return v2 < 2.0;
}

- (BOOL)singlePageAspectFits
{
  [(BKPictureBookScrollView *)self->_scrollView bounds];
  double v4 = v3;
  double v6 = v5;
  [(BKPictureBookView *)self->_bookView actualSize];
  return v7 * 0.5 / v8 > v4 / v6;
}

- (BOOL)supportsSinglePageMode
{
  if (![(BKPictureBookNavigationController *)self isViewLoaded]) {
    return 0;
  }
  double v3 = [(BKPictureBookNavigationController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(BKPictureBookNavigationController *)self view];
  [v6 bounds];
  BOOL v8 = v5 < v7 && LOBYTE(self->_lastCompletedTransition) != 0;

  return v8;
}

- (UIView)singlePageCurlContainer
{
  manualCurl = self->_manualCurl;
  if (!manualCurl)
  {
    double v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_manualCurl;
    self->_manualCurl = v4;

    [(BKPageCurl *)self->_manualCurl setAutoresizingMask:0];
    [(BKPageCurl *)self->_manualCurl setUserInteractionEnabled:0];
    [(BKPageCurl *)self->_manualCurl setHidden:1];
    [(BKPageCurl *)self->_manualCurl setOpaque:1];
    [(BKPageCurl *)self->_manualCurl setClipsToBounds:0];
    [(BKPictureBookNavigationController *)self contentSize];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
    [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
    CGRect v15 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v10, 0, 1, v7, v9, v11, v12, v13, v14);

    [v15 sizeForSpread:0 landscape:0];
    -[BKPageCurl setFrame:](self->_manualCurl, "setFrame:", 0.0, 0.0, v16, v17);
    [(BKPictureBookView *)self->_bookView addSubview:self->_manualCurl];

    manualCurl = self->_manualCurl;
  }

  return (UIView *)manualCurl;
}

- (void)enterSinglePageMode
{
  if (![(BKPictureBookNavigationController *)self inSinglePageMode]
    && [(BKPictureBookNavigationController *)self supportsSinglePageMode]
    && [(BKPictureBookNavigationController *)self isZoomedToSinglePage])
  {
    BYTE2(self->_lastCompletedTransition) = 1;
    unsigned int v3 = [(BKPictureBookNavigationController *)self isZoomedToRightPage];
    int64_t v4 = [(BKPageNavigationViewController *)self pageOffset];
    if (v3) {
      int64_t v5 = [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:v4];
    }
    else {
      int64_t v5 = [(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:v4];
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      [(BKPictureBookNavigationController *)self setPageOffset:v5 - 1];
    }
    [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:0];
    if ((char *)[(BKViewController *)self layoutDirection] == (char *)&dword_0 + 1) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
    id v7 = [(BKPictureBookNavigationController *)self pageCurlManager];
    [v7 setSpineLocation:v6];
  }
}

- (void)exitSinglePageMode
{
  if ([(BKPictureBookNavigationController *)self inSinglePageMode])
  {
    CGFloat x = self->_manualCurlStartPosition.x;
    if (x != 0.0)
    {
      [*(id *)&x killCurl];
      CGFloat v4 = self->_manualCurlStartPosition.x;
      self->_manualCurlStartPosition.CGFloat x = 0.0;
    }
    BYTE2(self->_lastCompletedTransition) = 0;
    *(void *)&self->_canFitToWidth = [(BKPageNavigationViewController *)self pageOffset];
    int64_t v5 = _AECaptureLocationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = +[NSNumber numberWithInteger:*(void *)&self->_canFitToWidth];
      int v10 = 138412290;
      double v11 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "#PictureBook 5 capture offset : %@", (uint8_t *)&v10, 0xCu);
    }
    int64_t v7 = [(BKViewController *)self layoutDirection];
    int64_t v8 = [(BKPageNavigationViewController *)self pageOffset];
    if (v7 == 1) {
      [(BKPageNavigationViewController *)self rightPageNumberForSinglePageOffset:v8];
    }
    else {
      [(BKPageNavigationViewController *)self leftPageNumberForSinglePageOffset:v8];
    }
    [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainer];
    [(BKPictureBookScrollView *)self->_scrollView setScrollEnabled:1];
    double v9 = [(BKPictureBookNavigationController *)self pageCurlManager];
    [v9 setSpineLocation:2];
  }
}

- (double)singlePageZoomScale
{
  [(BKPictureBookScrollView *)self->_scrollView bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(BKPictureBookView *)self->_bookView actualSize];
  double v12 = v11;
  double v14 = v13 * 0.5;
  [(BKPictureBookNavigationController *)self singlePagePadding];
  double v16 = v15;
  v19.origin.CGFloat x = v4;
  v19.origin.double y = v6;
  v19.size.double width = v8;
  v19.size.double height = v10;
  CGFloat v17 = CGRectGetWidth(v19) - v16;
  v20.origin.CGFloat x = v4;
  v20.origin.double y = v6;
  v20.size.double width = v8;
  v20.size.double height = v10;
  if (v14 / v12 <= v17 / CGRectGetHeight(v20))
  {
    v22.origin.CGFloat x = v4;
    v22.origin.double y = v6;
    v22.size.double width = v8;
    v22.size.double height = v10;
    return CGRectGetHeight(v22) / v12;
  }
  else
  {
    v21.origin.CGFloat x = v4;
    v21.origin.double y = v6;
    v21.size.double width = v8;
    v21.size.double height = v10;
    return (CGRectGetWidth(v21) - v16) / v14;
  }
}

- (void)zoomToSpread:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(BKPictureBookNavigationController *)self isZoomedToSpread])
  {
    double v5 = +[AETestDriver shared];
    [v5 postEvent:kBETestDriverFXLZoomToSpreadStart sender:self];

    [(BKPictureBookView *)self->_bookView bounds];
    -[BKPictureBookScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", v3);
    if (!v3)
    {
      [(BKPictureBookNavigationController *)self exitSinglePageMode];
    }
  }
}

- (void)zoom:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(BKPictureBookView *)self->_bookView bounds];
  uint64_t v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(BKPictureBookNavigationController *)self singlePagePadding];
  double v16 = v15;
  [(BKPictureBookView *)self->_bookView scale];
  double v18 = v16 * v17;
  [(BKPictureBookNavigationController *)self singlePageZoomScale];
  double v20 = v18 / v19;
  uint64_t v21 = v8;
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  if (v5) {
    double MinX = CGRectGetMinX(*(CGRect *)&v21);
  }
  else {
    double MinX = CGRectGetMidX(*(CGRect *)&v21) - v20;
  }
  scrollView = self->_scrollView;

  -[BKPictureBookScrollView zoomToRect:animated:](scrollView, "zoomToRect:animated:", v4, MinX, v10, v12 * 0.5 + v20, v14);
}

- (void)zoomToPoint:(CGPoint)a3 scale:(double)a4 animated:(BOOL)a5
{
  if (a4 != 0.0)
  {
    BOOL v6 = a5;
    double y = a3.y;
    double x = a3.x;
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    double v12 = v11 / a4;
    [(BKPictureBookScrollView *)self->_scrollView bounds];
    double v14 = v13 / a4;
    double v15 = y - v14 * 0.5;
    if (x - v12 * 0.5 >= 0.0) {
      double v16 = x - v12 * 0.5;
    }
    else {
      double v16 = 0.0;
    }
    if (v15 >= 0.0) {
      double v17 = v15;
    }
    else {
      double v17 = 0.0;
    }
    [(BKPictureBookView *)self->_bookView bounds];
    double v19 = v16 - fmax(v12 + v16 - v18, 0.0);
    [(BKPictureBookView *)self->_bookView bounds];
    double v21 = v17 - fmax(v14 + v17 - v20, 0.0);
    scrollView = self->_scrollView;
    -[BKPictureBookScrollView zoomToRect:animated:](scrollView, "zoomToRect:animated:", v6, v19, v21, v12, v14);
  }
}

- (void)zoomToPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  int64_t v8 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  if (v7 == a3 || v8 == a3)
  {
    [(BKPictureBookNavigationController *)self zoom:v7 == a3 animated:v4];
    [(BKPictureBookNavigationController *)self setPageOffset:a3 - 1];
    if (v4) {
      return;
    }
  }
  else if (v4)
  {
    return;
  }

  [(BKPictureBookNavigationController *)self enterSinglePageMode];
}

- (CGRect)_containerBoundsForGeometry
{
  double v2 = [(BKPictureBookNavigationController *)self viewIfLoaded];
  BOOL v3 = [v2 window];
  BOOL v4 = v3;
  if (!v3)
  {
    if (!v2)
    {
      CGFloat x = CGRectZero.origin.x;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      goto LABEL_5;
    }
    BOOL v3 = v2;
  }
  [v3 bounds];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
LABEL_5:

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)updateUpsellZoomScale
{
  if (([(BKContentViewController *)self->_rightContentViewController conformsToProtocol:&OBJC_PROTOCOL___BKUpsell] & 1) != 0|| [(NSMutableSet *)self->_pendingLoads conformsToProtocol:&OBJC_PROTOCOL___BKUpsell])
  {
    uint64_t v3 = BUProtocolCast();
    if (v3)
    {
      id v19 = (id)v3;
      [(BKPictureBookNavigationController *)self contentSize];
      double v5 = v4;
      double v7 = v6;
      int64_t v8 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
      BOOL v9 = [(BKPictureBookNavigationController *)self drawsSpine];
      [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
      double v14 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v8, v9, v5, v7, v10, v11, v12, v13);
      [v14 maximumSize];
      [v19 setContentSize:];

      [(BKPictureBookView *)self->_bookView layoutIfNeeded];
      double v15 = [(BKPictureBookView *)self->_bookView leftContentView];
      [v15 frame];
      double v17 = v16;
      [v19 contentSize];
      [v19 setZoomScale:v17 / v18];

      [(BKPictureBookView *)self->_bookView scale];
      [v19 setContentScale:];
      [v19 setFixedLayout:1];
    }
  }
}

- (BOOL)_allowZoom
{
  return 1;
}

- (void)_updateBookScale
{
  [(BKPictureBookNavigationController *)self contentSize];
  double v4 = v3;
  double v6 = v5;
  [(BKPictureBookScrollView *)self->_scrollView zoomScale];
  double v8 = v7;
  [(BKPictureBookView *)self->_bookView scale];
  double v10 = v9;
  [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
  double v12 = v11;
  unsigned int v13 = [(BKPictureBookNavigationController *)self _isFreeScale];
  [(BKPictureBookView *)self->_bookView frame];
  CGRect v51 = CGRectIntegral(v50);
  double x = v51.origin.x;
  double y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  BOOL v17 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
  double v18 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
  BOOL v19 = [(BKPictureBookNavigationController *)self drawsSpine];
  BOOL v20 = [(BKPictureBookNavigationController *)self supportsSinglePageMode];
  [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
  long long v25 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v18, v19, v20, v4, v6, v21, v22, v23, v24);

  [v25 scaleForSpread:v17 landscape:isPortrait() ^ 1];
  if (v13) {
    double v27 = v8 * v10;
  }
  else {
    double v27 = v26;
  }
  long long v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v49.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v49.c = v28;
  *(_OWORD *)&v49.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGSize size = CGRectZero.size;
  v48.origin = CGRectZero.origin;
  v48.CGSize size = size;
  v47[0] = v48.origin;
  v47[1] = size;
  v46[0] = v48.origin;
  v46[1] = size;
  [(BKPictureBookView *)self->_bookView calculateFramesAtScale:&v48 contentFrame:v47 leftContentFrame:v46 rightContentFrame:v27];
  double v30 = CGRectGetWidth(v48);
  uint64_t v31 = (uint64_t)(v30 * CGRectGetHeight(v48));
  *(double *)self[1].super.super.IMViewController_opaque = v27;
  double v32 = BEWebViewMinimumZoomScale;
  if (v27 >= BEWebViewMinimumZoomScale)
  {
    char v33 = 0;
    double v34 = v10 * v12;
    double v32 = v27;
  }
  else
  {
    CGAffineTransformMakeScale(&v49, v27 / BEWebViewMinimumZoomScale, v27 / BEWebViewMinimumZoomScale);
    char v33 = 1;
    double v34 = v32;
  }
  *((unsigned char *)&self->_lastCompletedTransition + 4) = v33;
  if (v31 <= 50000000)
  {
    [v25 sizeForSpread:v17 landscape:isPortrait() ^ 1];
    if (v13)
    {
      double v35 = CGSizeZero.width;
      double v36 = CGSizeZero.height;
    }
    -[BKPictureBookView setIdealSinglePageSize:](self->_bookView, "setIdealSinglePageSize:", v35, v36, CGSizeZero.width, CGSizeZero.height);
    bookView = self->_bookView;
    CGAffineTransform v45 = v49;
    [(BKPictureBookView *)bookView setTransform:&v45];
    [v25 maximumSize];
    double v39 = v38;
    [(BKPictureBookView *)self->_bookView setScale:v32];
    -[BKPictureBookView setFrame:](self->_bookView, "setFrame:", x, y, width, height);
    [(BKPictureBookView *)self->_bookView setNeedsLayout];
    [(BKPageCurlManager *)self->_pageCurlManager setScale:v32];
    -[BKPictureBookScrollView setContentSize:](self->_scrollView, "setContentSize:", width, height + -2.0);
    if (*((unsigned char *)&self->_lastCompletedTransition + 4))
    {
      [(BKPictureBookScrollView *)self->_scrollView zoomScale];
    }
    else
    {
      double v40 = v34 / v32;
      if (v17) {
        double v40 = 1.0;
      }
    }
    [(BKPictureBookScrollView *)self->_scrollView setMinimumZoomScale:v40];
    if ([(BKPictureBookNavigationController *)self _allowZoom]) {
      double v41 = fmax(v39 / v4 + v39 / v4, 2.0) / v32;
    }
    else {
      [(BKPictureBookScrollView *)self->_scrollView minimumZoomScale];
    }
    [(BKPictureBookScrollView *)self->_scrollView setMaximumZoomScale:v41];
    [(BKPictureBookNavigationController *)self updateUpsellZoomScale];
    objc_opt_class();
    double v42 = BUDynamicCast();
    [(BKPictureBookNavigationController *)self _applyAdditionalScale:v42];
    objc_opt_class();
    double v43 = BUDynamicCast();

    [(BKPictureBookNavigationController *)self _applyAdditionalScale:v43];
  }
}

- (void)_resetCurlContainer
{
  if ([(BKPictureBookNavigationController *)self isContentRenderComplete])
  {
    id v9 = [(BKPictureBookNavigationController *)self pageCurlManager];
    if ([v9 numberOfQueuedCurls])
    {
    }
    else
    {
      uint64_t v3 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
      if (v3)
      {
        double v4 = (void *)v3;
        double v5 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
        unsigned int v6 = [v5 finished];

        if (!v6) {
          return;
        }
      }
      else
      {
      }
      lastCurlUnderPageView = self->_lastCurlUnderPageView;
      self->_lastCurlUnderPageView = 0;

      [(BKPageCurlManager *)self->_pageCurlManager reset];
      pageCurlManager = self->_pageCurlManager;
      [(BKPageCurlManager *)pageCurlManager setHidden:1];
    }
  }
}

- (CGRect)_resetCurlContainerFrame
{
  id v3 = [(BKPictureBookNavigationController *)self curlContainer];
  double v4 = [(BKPictureBookView *)self->_bookView contentView];
  scrollView = self->_scrollView;
  [v4 bounds];
  -[BKPictureBookScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v4);
  double v7 = v6;
  double v9 = v8;
  double v10 = [v4 superview];
  [v4 bounds];
  [v10 convertRect:v4 fromView:];
  double v12 = v11;
  double v14 = v13;

  -[BKPageCurlManager setFrame:](self->_pageCurlManager, "setFrame:", v7, v9, v12, v14);
  double v15 = v7;
  double v16 = v9;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)curlContainer
{
  pageCurlManager = self->_pageCurlManager;
  if (!pageCurlManager)
  {
    double v4 = -[BKPictureBookCurlContainerView initWithFrame:]([BKPictureBookCurlContainerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    double v5 = self->_pageCurlManager;
    self->_pageCurlManager = (BKPageCurlManager *)v4;

    [(BKPageCurlManager *)self->_pageCurlManager setAutoresizingMask:18];
    [(BKPageCurlManager *)self->_pageCurlManager setUserInteractionEnabled:0];
    [(BKPageCurlManager *)self->_pageCurlManager setHidden:1];
    [(BKPageCurlManager *)self->_pageCurlManager setOpaque:1];
    [(BKPageCurlManager *)self->_pageCurlManager setClipsToBounds:0];
    [(BKPageCurlManager *)self->_pageCurlManager setDrawsSpine:[(BKPictureBookNavigationController *)self drawsSpine]];
    [(BKPictureBookNavigationController *)self contentSize];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
    BOOL v11 = [(BKPictureBookNavigationController *)self drawsSpine];
    BOOL v12 = [(BKPictureBookNavigationController *)self supportsSinglePageMode];
    [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
    double v17 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v10, v11, v12, v7, v9, v13, v14, v15, v16);

    [v17 scaleForSpread:[self isZoomedToSpread] landscape:isPortrait() ^ 1];
    if (v18 < BEWebViewMinimumZoomScale) {
      double v18 = BEWebViewMinimumZoomScale;
    }
    [(BKPageCurlManager *)self->_pageCurlManager setScale:v18];
    [(BKPictureBookView *)self->_bookView addSubview:self->_pageCurlManager];

    pageCurlManager = self->_pageCurlManager;
  }

  return pageCurlManager;
}

- (void)_resetSinglePageCurlContainer
{
}

- (void)_resetSinglePageCurlContainer:(id)a3
{
  double v4 = [(BKPictureBookNavigationController *)self pageCurlManager];
  id v5 = [v4 numberOfQueuedCurls];

  if (!v5)
  {
    id v6 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
    [v6 setHidden:1];
  }
}

- (CGRect)_resetSinglePageCurlContainerFrame
{
  id v3 = [(BKPictureBookView *)self->_bookView contentView];
  scrollView = self->_scrollView;
  [v3 bounds];
  -[BKPictureBookScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v3);
  double v6 = v5;
  [(BKPictureBookScrollView *)self->_scrollView contentOffset];
  if (v7 <= 0.0)
  {
    [(BKPictureBookScrollView *)self->_scrollView contentOffset];
    double v10 = v11;
  }
  else
  {
    [v3 frame];
    double v9 = v8;
    [v3 frame];
    double v10 = v9 + CGRectGetMidX(v21);
  }
  [(BKPictureBookView *)self->_bookView idealSinglePageSize];
  double v13 = v12;
  double v15 = v14;
  double v16 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
  [v16 setFrame:v10, v6, v13, v15];

  double v17 = v10;
  double v18 = v6;
  double v19 = v13;
  double v20 = v15;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_backPageCurlFrame
{
  id v3 = [(BKPictureBookView *)self->_bookView contentView];
  [v3 frame];
  double v5 = v4;

  double v6 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
  [v6 origin];
  double v8 = v7;

  if (v8 > 0.0) {
    double v5 = -v5;
  }
  double v9 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
  [v9 bounds];
  CGRect v19 = CGRectOffset(v18, v5, 0.0);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_autoCurlToSpreadPageOffset:(int64_t)a3 forwardCurl:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v39 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  int64_t v7 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
  int64_t v8 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:a3];
  int64_t v9 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:a3];
  id v40 = (id)objc_opt_new();
  BOOL v10 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
  [(BKPictureBookNavigationController *)self contentSize];
  double v12 = v11;
  double v14 = v13;
  double v15 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
  BOOL v16 = [(BKPictureBookNavigationController *)self drawsSpine];
  BOOL v17 = [(BKPictureBookNavigationController *)self supportsSinglePageMode];
  [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
  BOOL v18 = v16;
  BOOL v19 = v4;
  double v24 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v15, v18, v17, v12, v14, v20, v21, v22, v23);

  [v24 scaleForSpread:v10 landscape:isPortrait() ^ 1];
  if (v25 >= BEWebViewMinimumZoomScale) {
    double v26 = v25;
  }
  else {
    double v26 = BEWebViewMinimumZoomScale;
  }
  [(BKPageCurlManager *)self->_pageCurlManager setScale:v26];
  [(BKPictureBookNavigationController *)self _resetCurlContainerFrame];
  [v40 setScale:v26];
  [v40 setCurlContainer:self->_pageCurlManager];
  double v27 = [(BKPageNavigationViewController *)self delegate];
  [v40 setNavDelegate:v27];

  [v40 setForwardCurl:v4];
  [v40 setAutoCurl:1];
  [v40 setApplyMaskAndGutter:[self drawsSpine]];
  long long v28 = [(BKPictureBookNavigationController *)self pageCurlManager];
  id v29 = [v28 numberOfQueuedCurls];

  int64_t v31 = v39;
  double v30 = v40;
  if (!v29)
  {
    if ([(BKContentViewController *)self->_rightContentViewController isContentLoaded])
    {
      double v32 = [(BKContentViewController *)self->_rightContentViewController view];
      [v40 setLeftSourceView:v32];
    }
    if ([(NSMutableSet *)self->_pendingLoads isContentLoaded])
    {
      char v33 = [(NSMutableSet *)self->_pendingLoads view];
      [v40 setRightSourceView:v33];
    }
    [(BKPictureBookView *)self->_bookView setLeftContentView:0];
    [(BKPictureBookView *)self->_bookView setRightContentView:0];
    double v30 = v40;
    int64_t v31 = v39;
  }
  [v30 generateWithOldLeftPageNumber:v31 oldRightPageNumber:v7 newLeftPageNumber:v8 newRightPageNumber:v9];
  if (LOBYTE(self->_swipeSelector)
    && (double v34 = self->_leftContentViewController) != 0
    && [(BKContentViewController *)v34 isForwardCurl] == v4)
  {
    -[BKContentViewController finishManualCurlAtPostion:](self->_leftContentViewController, "finishManualCurlAtPostion:", 0.0, 0.0);
    leftContentViewController = self->_leftContentViewController;
    self->_leftContentViewController = 0;

    LOBYTE(self->_swipeSelector) = 0;
  }
  else
  {
    [(BKPictureBookNavigationController *)self curlPageForReadAloud:0];
    *(void *)&self->_canFitToWidth = 0x7FFFFFFFFFFFFFFFLL;
    double v35 = [(BKPictureBookNavigationController *)self pageCurlManager];
    double v36 = [v40 pageArray];
    double v37 = [v40 backPage];
    [v35 curlPages:v36 backPage:v37 inContainer:self->_pageCurlManager curlPage:v19];
  }
}

- (void)_autoCurlToSinglePageOffset:(int64_t)a3 forwardCurl:(BOOL)a4
{
  BOOL v4 = a4;
  if (LOBYTE(self->_swipeSelector)
    && (CGFloat x = self->_manualCurlStartPosition.x, x != 0.0)
    && [*(id *)&x forwardCurl] == a4)
  {
    [*(id *)&self->_manualCurlStartPosition.x finishManualCurl];
    LOBYTE(self->_swipeSelector) = 0;
  }
  else
  {
    [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
    int64_t v8 = [[BKPageBookCurlView alloc] initWithImage:0 borderColor:0 isLeft:0];
    int64_t v9 = [(BKPictureBookNavigationController *)self theme];
    -[BKPageBookCurlView setUseInvertedColors:](v8, "setUseInvertedColors:", [v9 shouldInvertContent]);

    [(BKPageCurl *)self->_manualCurl bounds];
    -[BKPageBookCurlView setFrame:](v8, "setFrame:");
    [(BKPageBookCurlView *)v8 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    unsigned int v14 = [(BKPictureBookNavigationController *)self isZoomedToRightPage];
    bookView = self->_bookView;
    if (v14) {
      [(BKPictureBookView *)bookView leftContentView];
    }
    else {
    BOOL v16 = [(BKPictureBookView *)bookView rightContentView];
    }
    if (v16)
    {
      [(BKPageBookCurlView *)v8 takeSnapshotOfView:v16];
    }
    else
    {
      v34.CGFloat width = v11;
      v34.CGFloat height = v13;
      UIGraphicsBeginImageContextWithOptions(v34, 1, 0.0);
      BOOL v17 = +[UIColor whiteColor];
      [v17 setFill];

      v35.origin.CGFloat x = 0.0;
      v35.origin.CGFloat y = 0.0;
      v35.size.CGFloat width = v11;
      v35.size.CGFloat height = v13;
      UIRectFill(v35);
      BOOL v18 = UIGraphicsGetImageFromCurrentImageContext();
      [(BKPageBookCurlView *)v8 setImage:v18];

      UIGraphicsEndImageContext();
    }
    BOOL v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, 0);
    int64_t v20 = [(BKViewController *)self layoutDirection];
    int64_t v21 = v20;
    if (HIBYTE(self->_lastCompletedTransition)) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = v20 == 1;
    }
    int v23 = v22;
    unsigned int v31 = v23 ^ v4;
    if (HIBYTE(self->_lastCompletedTransition))
    {
      double v24 = 0;
      if (v4) {
        goto LABEL_19;
      }
    }
    double v25 = [[BKPageBookCurlView alloc] initWithImage:0 borderColor:0 isLeft:0];
    [(BKPictureBookNavigationController *)self _backPageCurlFrame];
    -[BKPageBookCurlView setFrame:](v25, "setFrame:");
    double v26 = [(BKPictureBookNavigationController *)self theme];
    -[BKPageBookCurlView setUseInvertedColors:](v25, "setUseInvertedColors:", [v26 shouldInvertContent]);

    double v27 = [(BKPageNavigationViewController *)self delegate];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_E568;
    v32[3] = &unk_1DAC00;
    double v24 = v25;
    char v33 = v24;
    [v27 pageNavigationSnapshotForPageNumber:a3 + 1 completion:v32];

    if (HIBYTE(self->_lastCompletedTransition))
    {
LABEL_19:
      long long v28 = [(BKPictureBookNavigationController *)self pageCurlManager];
      [(BKPageSlide *)v28 curlPages:v19 backPage:v24 inContainer:self->_manualCurl curlPage:v31];
    }
    else
    {
      BOOL v29 = v21 == 1;
      long long v28 = objc_alloc_init(BKPageSlide);
      [(BKPageAnimation *)v28 setPageAnimationDelegate:self];
      double v30 = +[NSArray arrayWithObject:v24];
      [(BKPageSlide *)v28 autoSlideFromPages:v19 toPages:v30 inContainer:self->_manualCurl isForwardAnimation:v31 isRTL:v29 isZoomedToSpread:0 completion:0];
    }
  }
}

- (void)_timeOutWaitingForPaint
{
  id v3 = _AEWKPictureBookLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Timed out on painting content for curl. showing destination now", v6, 2u);
  }

  double desiredScale = self->_desiredScale;
  if (desiredScale != 0.0)
  {
    [*(id *)&desiredScale removeFromSuperview];
    double v5 = self->_desiredScale;
    self->_double desiredScale = 0.0;
  }
}

- (void)_manualCurlToSinglePage:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = self->_manualCurlStartPosition.x;
  if (v6 != 0.0)
  {
    [*(id *)&v6 killCurl];
    CGFloat v7 = self->_manualCurlStartPosition.x;
    self->_manualCurlStartPosition.double x = 0.0;
  }
  lastCurlUnderPageView = self->_lastCurlUnderPageView;
  self->_lastCurlUnderPageView = 0;

  [(BKPageCurl *)self->_manualCurl bounds];
  double v9 = v47.origin.x;
  double v10 = v47.origin.y;
  double width = v47.size.width;
  double height = v47.size.height;
  double MidX = CGRectGetMidX(v47);
  int v14 = x > MidX;
  int64_t v15 = [(BKViewController *)self layoutDirection];
  unsigned int v16 = v15 == 1;
  BOOL v17 = [(BKPictureBookNavigationController *)self isZoomedToRightPage];
  uint64_t v18 = [(BKPageNavigationViewController *)self pageOffset];
  uint64_t v19 = v18;
  if (v14 == v16)
  {
    if (v18 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v18;
    }
  }
  else
  {
    uint64_t v20 = v18 + 1;
    int64_t v21 = (char *)[(BKPageNavigationViewController *)self pageCount] - 1;
    if (v20 < (uint64_t)v21) {
      int64_t v21 = (char *)(v19 + 1);
    }
    uint64_t v22 = (uint64_t)(v21 + 1);
  }
  [(BKPictureBookNavigationController *)self slide:v17 animated:0 withDelay:0.0];
  [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
  int v23 = [[BKPageBookCurlView alloc] initWithImage:0 borderColor:0 isLeft:0];
  -[BKPageBookCurlView setFrame:](v23, "setFrame:", v9, v10, width, height);
  double v24 = [(BKPictureBookNavigationController *)self theme];
  -[BKPageBookCurlView setUseInvertedColors:](v23, "setUseInvertedColors:", [v24 shouldInvertContent]);

  bookView = self->_bookView;
  if (v17) {
    [(BKPictureBookView *)bookView rightContentView];
  }
  else {
  double v26 = [(BKPictureBookView *)bookView leftContentView];
  }
  uint64_t v27 = v14 ^ v16;
  if (v26)
  {
    [(BKPageBookCurlView *)v23 takeSnapshotOfView:v26];
  }
  else
  {
    v46.double width = width;
    v46.double height = height;
    UIGraphicsBeginImageContextWithOptions(v46, 1, 0.0);
    long long v28 = +[UIColor whiteColor];
    [v28 setFill];

    v48.origin.double x = 0.0;
    v48.origin.double y = 0.0;
    v48.size.double width = width;
    v48.size.double height = height;
    UIRectFill(v48);
    BOOL v29 = UIGraphicsGetImageFromCurrentImageContext();
    [(BKPageBookCurlView *)v23 setImage:v29];

    UIGraphicsEndImageContext();
  }
  double v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, 0);
  unsigned int v31 = [[BKPageBookCurlView alloc] initWithImage:0 borderColor:0 isLeft:0];
  -[BKPageBookCurlView setFrame:](v31, "setFrame:", v9, v10, width, height);
  double v32 = [(BKPictureBookNavigationController *)self theme];
  -[BKPageBookCurlView setUseInvertedColors:](v31, "setUseInvertedColors:", [v32 shouldInvertContent]);

  char v33 = [(BKPageNavigationViewController *)self delegate];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_EAA8;
  v44[3] = &unk_1DAC00;
  CGSize v34 = v31;
  CGAffineTransform v45 = v34;
  [v33 pageNavigationSnapshotForPageNumber:v22 completion:v44];

  if (v27) {
    CGRect v35 = v23;
  }
  else {
    CGRect v35 = v34;
  }
  double v36 = v35;
  [(BKPageCurl *)self->_manualCurl bounds];
  -[BKPageBookCurlView setFrame:](v23, "setFrame:");
  [(BKPictureBookNavigationController *)self _backPageCurlFrame];
  -[BKPageBookCurlView setFrame:](v34, "setFrame:");
  if (HIBYTE(self->_lastCompletedTransition))
  {
    double v37 = [(BKPictureBookNavigationController *)self pageCurlManager];
    uint64_t v38 = [v37 beginManualCurl:v27 atLocation:v36 inPage:v30 fromPages:v34 backPage:self->_manualCurl inContainer:x, y];
    CGFloat v39 = self->_manualCurlStartPosition.x;
    *(void *)&self->_manualCurlStartPosition.double x = v38;
  }
  else
  {
    id v40 = objc_alloc_init(BKPageSlide);
    [(BKPictureBookNavigationController *)self setPageSlideAnimation:v40];

    double v41 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
    [v41 setPageAnimationDelegate:self];

    double v42 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
    double v43 = +[NSArray arrayWithObject:v34];
    [v42 initiateManualAnimationFromPages:v30 toPages:v43 inContainer:self->_manualCurl isForwardAnimation:x > MidX isRTL:v15 == 1 isZoomedToSpread:0];

    double v37 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
    [v37 beginManualAnimationAtLocation:x, y];
  }

  self->_manualCurlStartPosition.double y = x;
  *(double *)&self->_pageOffsetToRestore = y;
}

- (void)_curlPageForReadAloud:(id)a3
{
  id v4 = [a3 BOOLValue];

  [(BKPictureBookNavigationController *)self curlPageForReadAloud:v4];
}

- (void)curlPageForReadAloud:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(BKPictureBookNavigationController *)self pageCurlManager];
    id v5 = [v4 numberOfQueuedCurls];

    if (v5)
    {
      self->_singlePageCurlContainer = (UIView *)"_curlPageForReadAloud:";
    }
    else
    {
      if (![(BKPictureBookNavigationController *)self isZoomedToSinglePage]) {
        [(BKPictureBookNavigationController *)self zoomToSpread:1];
      }
      int64_t v7 = [(BKViewController *)self layoutDirection];
      if ([(BKPictureBookNavigationController *)self inSinglePageMode])
      {
        if (v7 == 1)
        {
          double Width = 0.0;
          *(double *)&unint64_t v9 = 50.0;
        }
        else
        {
          [(BKPageCurl *)self->_manualCurl bounds];
          double Width = CGRectGetWidth(v57);
          *(double *)&unint64_t v9 = -50.0;
        }
        double v37 = *(double *)&v9;
        [(BKPageCurl *)self->_manualCurl bounds];
        double Height = CGRectGetHeight(v58);
        -[BKPictureBookNavigationController _manualCurlToSinglePage:](self, "_manualCurlToSinglePage:", Width, Height);
        CGFloat v39 = [(BKPictureBookNavigationController *)self pageCurlManager];
        [v39 updateManualCurl:*&self->_manualCurlStartPosition.x toLocation:v37 + Width, Height + -50.0];

        LOBYTE(self->_swipeSelector) = 1;
      }
      else if (!self->_leftContentViewController)
      {
        id v55 = [(BKPictureBookNavigationController *)self curlContainer];
        [(BKPictureBookNavigationController *)self _resetCurlContainerFrame];
        [(BKContentViewController *)self->_leftContentViewController cancelManualCurl];
        double v10 = [(BKPictureBookNavigationController *)self pageCurlManager];
        [v10 killAllCurls];

        CGFloat v11 = (char *)[(BKPageNavigationViewController *)self pageOffset] + 2;
        int64_t v12 = [(BKPageNavigationViewController *)self pageCount];
        if ((uint64_t)v11 >= v12 - 1) {
          CGFloat v11 = (char *)(v12 - 1);
        }
        int64_t v54 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
        int64_t v13 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
        int64_t v14 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:v11];
        int64_t v15 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:v11];
        unsigned int v16 = (BKContentViewController *)objc_opt_new();
        leftContentViewController = self->_leftContentViewController;
        self->_leftContentViewController = v16;

        [(BKContentViewController *)self->_leftContentViewController setCurlContainer:v55];
        uint64_t v18 = [(BKPageNavigationViewController *)self delegate];
        [(BKContentViewController *)self->_leftContentViewController setNavDelegate:v18];

        [(BKContentViewController *)self->_leftContentViewController setForwardCurl:[(BKViewController *)self layoutDirection] == 0];
        unsigned int v19 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
        double v20 = 0.25;
        if (v19) {
          double v20 = 0.5;
        }
        [(BKContentViewController *)self->_leftContentViewController setCurlThreshold:v20];
        [(BKContentViewController *)self->_leftContentViewController setApplyMaskAndGutter:[(BKPictureBookNavigationController *)self drawsSpine]];
        BOOL v21 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
        [(BKPictureBookNavigationController *)self contentSize];
        double v23 = v22;
        double v25 = v24;
        double v26 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
        BOOL v27 = [(BKPictureBookNavigationController *)self drawsSpine];
        [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
        double v32 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v26, v27, v23, v25, v28, v29, v30, v31);

        [v32 scaleForSpread:v21 landscape:isPortrait() ^ 1];
        if (v33 >= BEWebViewMinimumZoomScale) {
          double v34 = v33;
        }
        else {
          double v34 = BEWebViewMinimumZoomScale;
        }
        [v55 setScale:v34];
        [(BKContentViewController *)self->_leftContentViewController setScale:v34];
        [(BKContentViewController *)self->_leftContentViewController generateWithOldLeftPageNumber:v54 oldRightPageNumber:v13 newLeftPageNumber:v14 newRightPageNumber:v15];
        if (v7 == 1)
        {
          double v35 = 0.0;
          *(double *)&unint64_t v36 = 50.0;
        }
        else
        {
          [v55 bounds];
          double v35 = CGRectGetWidth(v59);
          *(double *)&unint64_t v36 = -50.0;
        }
        double v40 = *(double *)&v36;
        [v55 bounds];
        double v41 = CGRectGetHeight(v60);
        -[BKContentViewController startManualCurlAtPostion:](self->_leftContentViewController, "startManualCurlAtPostion:", v35, v41);
        double v42 = [(BKContentViewController *)self->_rightContentViewController view];
        [(BKContentViewController *)self->_leftContentViewController setLeftSourceView:v42];

        double v43 = [(NSMutableSet *)self->_pendingLoads view];
        [(BKContentViewController *)self->_leftContentViewController setRightSourceView:v43];

        [(BKPictureBookView *)self->_bookView setLeftContentView:0];
        [(BKPictureBookView *)self->_bookView setRightContentView:0];
        double v44 = [(BKPictureBookNavigationController *)self pageCurlManager];
        id v45 = [(BKContentViewController *)self->_leftContentViewController isForwardCurl];
        [(BKContentViewController *)self->_leftContentViewController manualCurlStartPosition];
        double v47 = v46;
        double v49 = v48;
        CGRect v50 = [(BKContentViewController *)self->_leftContentViewController curlPage];
        CGRect v51 = [(BKContentViewController *)self->_leftContentViewController pageArray];
        v52 = [(BKContentViewController *)self->_leftContentViewController backPage];
        CGRect v53 = [v44 beginManualCurl:v45 atLocation:v50 inPage:v51 fromPages:v52 backPage:self->_pageCurlManager inContainer:v49];
        [(BKContentViewController *)self->_leftContentViewController setPageCurl:v53];

        -[BKContentViewController updateManualCurlToPosition:](self->_leftContentViewController, "updateManualCurlToPosition:", v40 + v35, v41 + -50.0);
        LOBYTE(self->_swipeSelector) = 1;
      }
    }
  }
  else
  {
    [*(id *)&self->_manualCurlStartPosition.x cancelManualCurl];
    [(BKContentViewController *)self->_leftContentViewController cancelManualCurl];
    CGFloat v6 = self->_leftContentViewController;
    self->_leftContentViewController = 0;

    LOBYTE(self->_swipeSelector) = 0;
  }
}

- (BOOL)isManualCurlInProgress
{
  return self->_leftContentViewController || *(void *)&self->_manualCurlStartPosition.x != 0;
}

- (void)manualCurlGesture:(id)a3
{
  id v4 = a3;
  if ([(BKPictureBookNavigationController *)self inSinglePageMode]) {
    [(BKPictureBookNavigationController *)self handleSinglePageManualCurlGesture:v4];
  }
  else {
    [(BKPictureBookNavigationController *)self handleSpreadManualCurlGesture:v4];
  }
}

- (void)handleSinglePageManualCurlGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPictureBookNavigationController *)self singlePageCurlContainer];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [v4 state];
  switch((unint64_t)v10)
  {
    case 1uLL:
      -[BKPictureBookNavigationController _manualCurlToSinglePage:](self, "_manualCurlToSinglePage:", v7, v9);
      break;
    case 2uLL:
      if (*(void *)&self->_manualCurlStartPosition.x)
      {
        int64_t v12 = [(BKPictureBookNavigationController *)self pageCurlManager];
        [v12 updateManualCurl:*&self->_manualCurlStartPosition.x toLocation:v7, v9];
      }
      int64_t v13 = [(BKPictureBookNavigationController *)self pageSlideAnimation];

      if (v13)
      {
        id v25 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
        [v25 updateManualAnimationToLocation:v7, v9];
        goto LABEL_12;
      }
      break;
    case 3uLL:
      CGFloat x = self->_manualCurlStartPosition.x;
      if (x != 0.0)
      {
        unsigned int v15 = [*(id *)&x type];
        CGFloat v16 = vabdd_f64(v7, self->_manualCurlStartPosition.y);
        [(BKPageCurl *)self->_manualCurl frame];
        if (v16 <= CGRectGetWidth(v27) * 0.25)
        {
          [*(id *)&self->_manualCurlStartPosition.x cancelManualCurl];
        }
        else
        {
          [*(id *)&self->_manualCurlStartPosition.x finishManualCurl];
          int64_t v17 = [(BKPageNavigationViewController *)self pageOffset];
          if (v15 == 2) {
            int64_t v18 = v17 + 1;
          }
          else {
            int64_t v18 = v17 - 1;
          }
          [(BKPictureBookNavigationController *)self setPageOffset:v18];
          [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
        }
      }
      if (self->_lastCurlUnderPageView)
      {
        CGFloat v19 = vabdd_f64(v7, self->_manualCurlStartPosition.y);
        [(BKPageCurl *)self->_manualCurl frame];
        CGFloat Width = CGRectGetWidth(v28);
        lastCurlUnderPageView = self->_lastCurlUnderPageView;
        if (v19 <= Width * 0.25)
        {
          [(UIView *)lastCurlUnderPageView cancelManualAnimation];
        }
        else
        {
          [(UIView *)lastCurlUnderPageView finishManualAnimation];
          unsigned int v22 = [(UIView *)self->_lastCurlUnderPageView isGoingToNextPage];
          int64_t v23 = [(BKPageNavigationViewController *)self pageOffset];
          if (v22) {
            int64_t v24 = v23 + 1;
          }
          else {
            int64_t v24 = v23 - 1;
          }
          [(BKPictureBookNavigationController *)self setPageOffset:v24];
          [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
        }
      }
      break;
    case 4uLL:
    case 5uLL:
      CGFloat v11 = self->_manualCurlStartPosition.x;
      if (v11 != 0.0) {
        [*(id *)&v11 cancelManualCurl];
      }
      id v25 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
      [v25 cancelManualAnimation];
LABEL_12:

      break;
    default:
      return;
  }
}

- (unint64_t)_pageOffsetAfter:(int64_t)a3 whenCurlingForward:(BOOL)a4
{
  int v6 = ((char *)[(BKViewController *)self layoutDirection] == (char *)&dword_0 + 1) ^ a4;
  unsigned int v7 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
  uint64_t v8 = 1;
  if (v7) {
    uint64_t v8 = 2;
  }
  uint64_t v9 = -2;
  if (!v7) {
    uint64_t v9 = -1;
  }
  if (!v6) {
    uint64_t v8 = v9;
  }
  int64_t v10 = v8 + a3;
  if (v6 == 1)
  {
    int64_t v11 = [(BKPageNavigationViewController *)self pageCount];
    if (v10 >= v11 - 1) {
      int64_t v10 = v11 - 1;
    }
  }
  else
  {
    v10 &= ~(v10 >> 63);
  }
  int64_t v12 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:v10];
  if (v12 == (void *)[(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:a3])return a3; {
  else
  }
    return v10;
}

- (void)handleSpreadManualCurlGesture:(id)a3
{
  id v76 = a3;
  BOOL v4 = [(BKPictureBookNavigationController *)self isZoomedToSpread];
  id v5 = [(BKPictureBookNavigationController *)self curlContainer];
  [v76 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  switch((unint64_t)[v76 state])
  {
    case 1uLL:
      int64_t v12 = &OBJC_IVAR___BKPictureBookNavigationController__singlePageCurlContainer;
      if (v4) {
        int64_t v12 = &OBJC_IVAR___BKPictureBookNavigationController__curlContainer;
      }
      [*(id *)&self->super.super.IMViewController_opaque[*v12] bounds];
      BOOL v13 = v7 > CGRectGetMidX(v78);
      objc_opt_class();
      int64_t v14 = BUDynamicCast();
      if (v14)
      {
        unsigned int v15 = [(BKPictureBookNavigationController *)self curlContainer];
        [v14 velocityInView:v15];
        double v17 = v16;

        BOOL v13 = v17 < 0.0;
      }
      int64_t v18 = [(BKViewController *)self layoutDirection];
      CGFloat v19 = [(BKPictureBookNavigationController *)self _pageOffsetAfter:[(BKPageNavigationViewController *)self pageOffset] whenCurlingForward:v13];
      if (v19 == (void *)[(BKPageNavigationViewController *)self pageOffset]) {
        goto LABEL_41;
      }
      if (!v4) {
        [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
      }
      [(BKPictureBookNavigationController *)self _resetCurlContainerFrame];
      int64_t v20 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
      int64_t v21 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:[(BKPageNavigationViewController *)self pageOffset]];
      int64_t v22 = [(BKPageNavigationViewController *)self leftPageNumberForSpreadPageOffset:v19];
      int64_t v23 = [(BKPageNavigationViewController *)self rightPageNumberForSpreadPageOffset:v19];
      leftContentViewController = self->_leftContentViewController;
      if (leftContentViewController)
      {
        if (v13 != [(BKContentViewController *)leftContentViewController isForwardCurl])
        {
          id v25 = [(BKContentViewController *)self->_leftContentViewController pageCurl];
          [v25 cancelManualCurl];
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
      }
      else
      {
        double v46 = (BKContentViewController *)objc_opt_new();
        double v47 = self->_leftContentViewController;
        self->_leftContentViewController = v46;
      }
      int64_t v72 = v18;
      int64_t v75 = v22;
      p_pageCurlManager = (id *)&self->_pageCurlManager;
      [(BKContentViewController *)self->_leftContentViewController setCurlContainer:self->_pageCurlManager];
      [(BKPageNavigationViewController *)self delegate];
      double v49 = v74 = v23;
      [(BKContentViewController *)self->_leftContentViewController setNavDelegate:v49];

      [(BKContentViewController *)self->_leftContentViewController setForwardCurl:v13];
      [(BKContentViewController *)self->_leftContentViewController setApplyMaskAndGutter:[(BKPictureBookNavigationController *)self drawsSpine]];
      double v50 = 0.25;
      if (v4) {
        double v50 = 0.5;
      }
      [(BKContentViewController *)self->_leftContentViewController setCurlThreshold:v50];
      [(BKPictureBookNavigationController *)self contentSize];
      double v52 = v51;
      double v54 = v53;
      id v55 = [(BKPictureBookNavigationController *)self thumbnailBookViewConfiguration];
      int64_t v73 = v21;
      int64_t v56 = v20;
      BOOL v57 = [(BKPictureBookNavigationController *)self drawsSpine];
      [(BKPictureBookNavigationController *)self _containerBoundsForGeometry];
      id v25 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v55, v57, v52, v54, v58, v59, v60, v61);

      [v25 scaleForSpread:v4 landscape:isPortrait() ^ 1];
      if (v62 >= BEWebViewMinimumZoomScale) {
        double v63 = v62;
      }
      else {
        double v63 = BEWebViewMinimumZoomScale;
      }
      [*p_pageCurlManager setScale:v63];
      [(BKContentViewController *)self->_leftContentViewController setScale:v63];
      v64 = [(BKContentViewController *)self->_rightContentViewController view];
      [(BKContentViewController *)self->_leftContentViewController setLeftSourceView:v64];

      v65 = [(NSMutableSet *)self->_pendingLoads view];
      [(BKContentViewController *)self->_leftContentViewController setRightSourceView:v65];

      [(BKContentViewController *)self->_leftContentViewController generateWithOldLeftPageNumber:v56 oldRightPageNumber:v73 newLeftPageNumber:v75 newRightPageNumber:v74];
      if (HIBYTE(self->_lastCompletedTransition))
      {
        -[BKContentViewController startManualCurlAtPostion:](self->_leftContentViewController, "startManualCurlAtPostion:", v7, v9);
      }
      else
      {
        v66 = objc_alloc_init(BKPageSlide);
        [(BKPictureBookNavigationController *)self setPageSlideAnimation:v66];

        v67 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
        [v67 setPageAnimationDelegate:self];

        v68 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
        v69 = [(BKContentViewController *)self->_leftContentViewController pageArray];
        v70 = [(BKContentViewController *)self->_leftContentViewController backPageArray];
        if (BYTE2(self->_lastCompletedTransition)) {
          p_pageCurlManager = (id *)&self->_manualCurl;
        }
        [v68 initiateManualAnimationFromPages:v69 toPages:v70 inContainer:*p_pageCurlManager isForwardAnimation:v13 isRTL:v72 == 1 isZoomedToSpread:v4];

        v71 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
        [v71 beginManualAnimationAtLocation:v7, v9];
      }
      goto LABEL_40;
    case 2uLL:
      double v26 = [(BKContentViewController *)self->_rightContentViewController view];
      [(BKContentViewController *)self->_leftContentViewController setLeftSourceView:v26];

      CGRect v27 = [(NSMutableSet *)self->_pendingLoads view];
      [(BKContentViewController *)self->_leftContentViewController setRightSourceView:v27];

      if (self->_leftContentViewController && !self->_lastCurlUnderPageView)
      {
        [(BKPictureBookView *)self->_bookView setLeftContentView:0];
        [(BKPictureBookView *)self->_bookView setRightContentView:0];
        CGRect v28 = [(BKContentViewController *)self->_leftContentViewController pageCurl];

        if (!v28)
        {
          double v29 = [(BKPictureBookNavigationController *)self pageCurlManager];
          id v30 = [(BKContentViewController *)self->_leftContentViewController isForwardCurl];
          [(BKContentViewController *)self->_leftContentViewController manualCurlStartPosition];
          double v32 = v31;
          double v34 = v33;
          double v35 = [(BKContentViewController *)self->_leftContentViewController curlPage];
          unint64_t v36 = [(BKContentViewController *)self->_leftContentViewController pageArray];
          double v37 = [(BKContentViewController *)self->_leftContentViewController backPage];
          uint64_t v38 = [v29 beginManualCurl:v30 atLocation:v35 inPage:v36 fromPages:v37 inContainer:self->_pageCurlManager backPage:v32 inPage:v34];
          [(BKContentViewController *)self->_leftContentViewController setPageCurl:v38];

          CGFloat v39 = [(BKContentViewController *)self->_rightContentViewController view];
          [(BKContentViewController *)self->_leftContentViewController setLeftSourceView:v39];

          double v40 = [(NSMutableSet *)self->_pendingLoads view];
          [(BKContentViewController *)self->_leftContentViewController setRightSourceView:v40];
        }
        -[BKContentViewController updateManualCurlToPosition:](self->_leftContentViewController, "updateManualCurlToPosition:", v7, v9);
        double v41 = [(BKPageNavigationViewController *)self delegate];
        [v41 pageNavigationDidBeginInteracting:self];
      }
      double v42 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
      [v42 updateManualAnimationToLocation:v7, v9];

      goto LABEL_42;
    case 3uLL:
      double v43 = self->_leftContentViewController;
      if (v43 && !self->_lastCurlUnderPageView)
      {
        -[BKContentViewController updateManualCurlToPosition:](v43, "updateManualCurlToPosition:", v7, v9);
        if (-[BKContentViewController finishManualCurlAtPostion:](self->_leftContentViewController, "finishManualCurlAtPostion:", v7, v9))
        {
          [(BKPictureBookNavigationController *)self setPageOffset:[(BKPictureBookNavigationController *)self _pageOffsetAfter:[(BKPageNavigationViewController *)self pageOffset] whenCurlingForward:[(BKContentViewController *)self->_leftContentViewController isForwardCurl]]];
          if (!v4) {
            [(BKPictureBookNavigationController *)self slide:[(BKContentViewController *)self->_leftContentViewController isForwardCurl] animated:1 withDelay:0.0];
          }
        }
        double v44 = [(BKContentViewController *)self->_leftContentViewController pageCurl];

        if (!v44)
        {
          id v45 = self->_leftContentViewController;
          self->_leftContentViewController = 0;
        }
      }
      if (self->_lastCurlUnderPageView)
      {
        [(BKPictureBookNavigationController *)self setPageOffset:[(BKPictureBookNavigationController *)self _pageOffsetAfter:[(BKPageNavigationViewController *)self pageOffset] whenCurlingForward:[(BKContentViewController *)self->_leftContentViewController isForwardCurl]]];
        int64_t v11 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
        [v11 finishManualAnimation];
        goto LABEL_28;
      }
      goto LABEL_42;
    case 4uLL:
    case 5uLL:
      [(BKContentViewController *)self->_leftContentViewController cancelManualCurl];
      int64_t v10 = self->_leftContentViewController;
      self->_leftContentViewController = 0;

      int64_t v11 = [(BKPictureBookNavigationController *)self pageSlideAnimation];
      [v11 cancelManualAnimation];
LABEL_28:

      [(BKPictureBookNavigationController *)self setPageSlideAnimation:0];
      goto LABEL_42;
    default:
LABEL_42:

      return;
  }
}

- (void)_restoreViewHierarchyWithArray:(id)a3
{
  if (a3)
  {
    BOOL v4 = [(NSMutableSet *)self->_pendingLoads view];
    [(BKPictureBookView *)self->_bookView setRightContentView:v4];

    id v5 = [(BKContentViewController *)self->_rightContentViewController view];
    [(BKPictureBookView *)self->_bookView setLeftContentView:v5];

    leftContentViewController = self->_leftContentViewController;
    if (leftContentViewController)
    {
      unsigned __int8 v7 = [(BKContentViewController *)leftContentViewController isAutoCurl];
      leftContentViewController = self->_leftContentViewController;
      if ((v7 & 1) == 0)
      {
        [(BKContentViewController *)leftContentViewController cancelManualCurl];
        leftContentViewController = self->_leftContentViewController;
      }
    }
    self->_leftContentViewController = 0;
  }

  [(BKPictureBookNavigationController *)self _resetCurlContainer];
}

- (void)_killSpreadManualCurl
{
  leftContentViewController = self->_leftContentViewController;
  if (leftContentViewController)
  {
    if (([(BKContentViewController *)leftContentViewController isAutoCurl] & 1) == 0)
    {
      BOOL v4 = [(BKContentViewController *)self->_leftContentViewController pageCurl];
      id v5 = [v4 existingPages];

      if (v5)
      {
        double v6 = [(NSMutableSet *)self->_pendingLoads view];
        [(BKPictureBookView *)self->_bookView setRightContentView:v6];

        unsigned __int8 v7 = [(BKContentViewController *)self->_rightContentViewController view];
        [(BKPictureBookView *)self->_bookView setLeftContentView:v7];

        [(BKPictureBookView *)self->_bookView layoutIfNeeded];
        double v8 = [(BKPictureBookNavigationController *)self pageCurlManager];
        [v8 killAllCurls];

        double v9 = self->_leftContentViewController;
        self->_leftContentViewController = 0;

        [(BKPictureBookNavigationController *)self _resetCurlContainer];
      }
    }
  }
}

- (BOOL)bkLongPressGestureCanTransitionToRecognizedState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BKViewController *)self layoutDirection];
  if ([(BKPictureBookNavigationController *)self inSinglePageMode])
  {
    [(BKPictureBookNavigationController *)self _resetSinglePageCurlContainerFrame];
    double v6 = [(BKPictureBookNavigationController *)self view];
    [v4 locationInView:v6];
    double v8 = v7;

    double v9 = [(BKPictureBookNavigationController *)self view];
    [v9 frame];
    double v10 = CGRectGetWidth(v21) + -22.0;

    double v11 = 22.0;
  }
  else
  {
    int64_t v12 = [(BKPictureBookNavigationController *)self curlContainer];
    [v4 locationInView:v12];
    double v8 = v13;

    [(BKPictureBookNavigationController *)self _resetCurlContainerFrame];
    double v10 = CGRectGetWidth(v22) + -88.0;
    double v11 = 88.0;
  }
  if ([(BKPictureBookNavigationController *)self _isFreeScale] || v8 > v11 && v8 <= v10) {
    goto LABEL_7;
  }
  int64_t v15 = [(BKPageNavigationViewController *)self pageOffset];
  int64_t v16 = v15;
  if (v5 == 1)
  {
    if (v8 > v10 && !v15) {
      goto LABEL_7;
    }
    int64_t v17 = [(BKPageNavigationViewController *)self pageOffset];
    BOOL v18 = v17 >= [(BKPageNavigationViewController *)self pageCount] - 1;
  }
  else
  {
    int64_t v19 = [(BKPageNavigationViewController *)self pageCount];
    if (v8 > v10 && v16 >= v19 - 1) {
      goto LABEL_7;
    }
    BOOL v18 = [(BKPageNavigationViewController *)self pageOffset] == 0;
  }
  if (v8 < v11 && v18)
  {
LABEL_7:
    LOBYTE(v14) = 0;
    return v14;
  }
  BOOL v14 = [(BKPictureBookNavigationController *)self isContentRenderComplete];
  if (v14)
  {
    [(BKPictureBookScrollView *)self->_scrollView setBounces:0];
    [(BKPictureBookScrollView *)self->_scrollView setAlwaysBounceVertical:0];
    [(BKPictureBookScrollView *)self->_scrollView setAlwaysBounceHorizontal:0];
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (BOOL)drawsSpine
{
  return (BOOL)self->_curlContainer;
}

- (void)setDrawsSpine:(BOOL)a3
{
  LOBYTE(self->_curlContainer) = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)openToSpread
{
  return *(void *)&self->_openToSpread;
}

- (void)setOpenToSpread:(int)a3
{
  *(void *)&self->_openToSpread = *(void *)&a3;
}

- (int)lastCompletedTransition
{
  return (int)self->_performSelectorProxy;
}

- (void)setLastCompletedTransition:(int)a3
{
  LODWORD(self->_performSelectorProxy) = a3;
}

- (BOOL)hasTurnedToInitialPage
{
  return BYTE1(self->_lastCompletedTransition);
}

- (void)setHasTurnedToInitialPage:(BOOL)a3
{
  BYTE1(self->_lastCompletedTransition) = a3;
}

- (BOOL)inSinglePageMode
{
  return BYTE2(self->_lastCompletedTransition);
}

- (BKPageSlide)pageSlideAnimation
{
  return (BKPageSlide *)self->_lastCurlUnderPageView;
}

- (void)setPageSlideAnimation:(id)a3
{
}

- (BOOL)usePageCurlAnimation
{
  return HIBYTE(self->_lastCompletedTransition);
}

- (void)setUsePageCurlAnimation:(BOOL)a3
{
  HIBYTE(self->_lastCompletedTransition) = a3;
}

- (UIView)lastCurlUnderPageView
{
  return *(UIView **)&self->_desiredScale;
}

- (void)setLastCurlUnderPageView:(id)a3
{
}

- (BOOL)scaleIsAdjusted
{
  return *((unsigned char *)&self->_lastCompletedTransition + 4);
}

- (void)setScaleIsAdjusted:(BOOL)a3
{
  *((unsigned char *)&self->_lastCompletedTransition + 4) = a3;
}

- (double)desiredScale
{
  return *(double *)self[1].super.super.IMViewController_opaque;
}

- (void)setDesiredScale:(double)a3
{
  *(double *)self[1].super.super.IMViewController_opaque = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredScale, 0);
  objc_storeStrong((id *)&self->_lastCurlUnderPageView, 0);
  objc_storeStrong((id *)&self->_pageSlideAnimation, 0);
  objc_storeStrong((id *)&self->_manualCurlStartPosition, 0);
  objc_storeStrong((id *)&self->_manualCurl, 0);
  objc_storeStrong((id *)&self->_needsTurnToPageNumber, 0);
  objc_storeStrong((id *)&self->_pendingLoads, 0);
  objc_storeStrong((id *)&self->_rightContentViewController, 0);
  objc_storeStrong((id *)&self->_leftContentViewController, 0);
  objc_storeStrong((id *)&self->_curlState, 0);
  objc_storeStrong((id *)&self->_pageCurlManager, 0);
  objc_storeStrong((id *)&self->_bookView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_panManualCurlGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_manualCurlGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightSwipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftSwipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageChangeTapRecognizer, 0);

  objc_storeStrong((id *)&self->_controlsTapRecognizer, 0);
}

@end