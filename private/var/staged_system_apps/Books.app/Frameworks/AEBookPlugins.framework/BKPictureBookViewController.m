@interface BKPictureBookViewController
+ (void)initialize;
- (BKImageResizerHelper)imageResizer;
- (BKPictureBookViewController)initWithBook:(id)a3 storeID:(id)a4;
- (BOOL)_bookRenditionFlowIsScrolled;
- (BOOL)_bookRenditionFlowIsScrolledContinuous;
- (BOOL)_isFocusedOnSecondPageOfSpread;
- (BOOL)_isManualCurlInProgress;
- (BOOL)_thumbnailShouldTrackWithScrubber;
- (BOOL)animateLiveResizeTransitions;
- (BOOL)aspectFitDuringLiveResize;
- (BOOL)blurSnapshotDuringLiveResize;
- (BOOL)canOrdinalOnlyLocationsBeVisible;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)hasContinuousScrollingBehavior;
- (BOOL)hidesPageControlsOnOpen;
- (BOOL)isSharingSupported;
- (BOOL)isSpread;
- (BOOL)isVerticalScrubberVisible;
- (BOOL)pageNavigationController:(id)a3 shouldDelayChangeToPageOffset:(int64_t)a4 completion:(id)a5;
- (BOOL)pageNavigationIsVertical;
- (BOOL)savedLocationIsEndOfBook;
- (BOOL)shouldSavePageControlVisibility;
- (BOOL)shouldShowBookmarkControl;
- (BOOL)shouldShowHUDs;
- (BOOL)shouldShowNextPagePageButtonsHint;
- (BOOL)shouldShowTOCControl;
- (BOOL)showSpreads;
- (BOOL)snapshotDuringLiveResize;
- (BOOL)supportsSpreadForVerticalLayout;
- (BOOL)wantsBottomToolbar;
- (CGRect)desiredBoundsForNavigationController;
- (CGRect)scrubberContainerViewFrame;
- (CGSize)idealCacheSize;
- (CGSize)thumbnailingContentSizeForPageNumber:(int64_t)a3;
- (UIScreenEdgePanGestureRecognizer)edgePanGestureRecognizer;
- (UIView)backgroundImageView;
- (UIView)currentReadingPositionView;
- (UIView)scrubberContainerView;
- (UIViewPropertyAnimator)verticalScrubberAnimator;
- (WKWebView)snapshotWebView;
- (_NSRange)currentPages;
- (double)_contentAspectRatio;
- (double)hidesPageControlsOnOpenDelay;
- (id)_bk_backgroundColor;
- (id)_bookmarkDirectory;
- (id)_pageDirectory;
- (id)_prepareSmilMapOn:(_NSRange)a3;
- (id)_stylesheetSetForSnapshot:(id)a3;
- (id)_thumbnailBookViewConfiguration;
- (id)assetViewControllerViewForLiveResizeSnapshot;
- (id)contentSubType;
- (id)contentViewControllerForLocation:(id)a3;
- (id)currentScrubber;
- (id)currentSoundtrack;
- (id)lastLayoutUsedKey;
- (id)pageLocationForPageNumber:(int64_t)a3;
- (id)pageNavigationViewController;
- (id)pageTitleForPageNumber:(int64_t)a3;
- (id)pictureBookRenderingCache;
- (id)pictureBookRenderingCacheIfLoaded;
- (id)resizeImage:(id)a3 toSize:(CGSize)a4 callback:(id)a5;
- (id)scrubber;
- (id)scrubberCallout;
- (id)thumbnailScrubber:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6;
- (id)thumbnailingGenerateImageForPageNumber:(int64_t)a3 callbackBlock:(id)a4;
- (id)upsellContentViewController;
- (id)verticalScrubber;
- (id)webViewForSnapshotting:(id)a3 size:(CGSize)a4;
- (int64_t)calculatePageCountExcludingUpsell;
- (int64_t)readerType;
- (unint64_t)_itemIndexForCurrentPage;
- (unint64_t)defaultLayoutToUse;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelCachingAndCleanupSnapshotWebViews;
- (void)_cleanDocumentElementForMediaOverlay:(id)a3;
- (void)_cleanupSnapshotWebViews;
- (void)_focusOnPage:(int64_t)a3;
- (void)_installClickHandlers:(id)a3;
- (void)_markupDocumentElementForMediaOverlay:(id)a3;
- (void)_nextPageHint:(BOOL)a3;
- (void)_performScrollTest:(id)a3 completionHandler:(id)a4;
- (void)_prewarmThumbnailsForVerticalScrubber;
- (void)_removeClickHandlers:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateHUDVisibility;
- (void)_updateWebProcessPluginObject:(id)a3 withParameter:(id)a4;
- (void)animateVerticalScrubberIn:(double)a3 animated:(BOOL)a4;
- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4;
- (void)assetViewControllerDidEndLiveResize;
- (void)assetViewControllerWillEnterForeground;
- (void)bkaxToggleControls:(id)a3;
- (void)books_pageBackward:(id)a3;
- (void)books_pageForward:(id)a3;
- (void)books_pageLeft:(id)a3;
- (void)books_pageRight:(id)a3;
- (void)contentView:(id)a3 unhandledClickAtPoint:(CGPoint)a4;
- (void)contentViewController:(id)a3 navigatePageDirection:(id)a4;
- (void)contentViewReady:(id)a3;
- (void)dealloc;
- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)displayVerticalScrubberBackground;
- (void)edgePanGestureHandler:(id)a3;
- (void)finishedSnapshottingForCache:(id)a3;
- (void)generateRenderingPiggyBackForAllPages;
- (void)generateSnapshotsForCurrentPages;
- (void)hideVerticalScrubber;
- (void)hideVerticalScrubberAndResetZoomScale:(BOOL)a3;
- (void)infoHUDTapped:(id)a3;
- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)layoutScrubberCallout:(id)a3;
- (void)loadView;
- (void)pageNavigationDidChangeLocation:(id)a3;
- (void)pageNavigationSnapshotForPageNumber:(int64_t)a3 completion:(id)a4;
- (void)pageNavigationSnapshotForPageNumber:(int64_t)a3 size:(CGSize)a4 isRight:(BOOL)a5 zoomScale:(double)a6 applyMaskAndGutter:(BOOL)a7 completion:(id)a8;
- (void)pictureBookVerticalNavigationInteractionDidStart:(int64_t)a3;
- (void)pictureBookVerticalNavigationpreferredPageNumberHUDVisibilityChanged:(BOOL)a3;
- (void)prepareForScrubberAnimation;
- (void)presentAppearanceViewControllerFromItem:(id)a3;
- (void)recordedTurnToNextChapter;
- (void)recordedTurnToPreviousChapter;
- (void)restoreSavedLocation;
- (void)scrubberTouch:(id)a3 forEvent:(id)a4;
- (void)setBackgroundImageView:(id)a3;
- (void)setBook:(id)a3;
- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setCurrentReadingPositionView:(id)a3;
- (void)setEdgePanGestureRecognizer:(id)a3;
- (void)setImageResizer:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setLocation:(id)a3;
- (void)setPageCountIncludingUpsell:(int64_t)a3;
- (void)setScrubberContainerView:(id)a3;
- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5;
- (void)setShouldShowNextPagePageButtonsHint:(BOOL)a3;
- (void)setSnapshotWebView:(id)a3;
- (void)setSwipeToShowScrubberEnable:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setVerticalScrubberAnimator:(id)a3;
- (void)setupBackgroundImageViewWithImage:(id)a3;
- (void)setupVerticalScrubber;
- (void)showScrim:(BOOL)a3;
- (void)showVerticalScrubber;
- (void)thumbnailingGenerateImageForPageNumber:(int64_t)a3 size:(CGSize)a4 callbackBlock:(id)a5;
- (void)touchBarScrollerDidEnd:(double)a3 completion:(id)a4;
- (void)touchBarScrollerDidScroll:(double)a3;
- (void)touchBarScrollerDidStart:(double)a3;
- (void)transitionDidFinish:(BOOL)a3;
- (void)turnToNextChapter;
- (void)turnToPreviousChapter;
- (void)updateCurrentReadingPositionViewIfNeeded;
- (void)updatePageNumberHUD;
- (void)updateScrubberUsingTouchbar:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKPictureBookViewController

+ (void)initialize
{
  v2 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v4 = @"BKReadingScrolledContinuous";
  v5 = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [v2 registerDefaults:v3];
}

- (BKPictureBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookViewController;
  CFStringRef v4 = [(BKThumbnailBookViewController *)&v14 initWithBook:a3 storeID:a4];
  if (v4)
  {
    v5 = +[IMTheme themeWithIdentifier:kIMThemeIdentifierDynamicTheme];
    [(BKPictureBookViewController *)v4 setTheme:v5];

    v6 = (NSNumber *)[objc_alloc((Class)NSNumber) initWithInt:0];
    thumbnailContext = v4->_thumbnailContext;
    v4->_thumbnailContext = v6;

    v8 = (UIScreenEdgePanGestureRecognizer *)[objc_alloc((Class)UIScreenEdgePanGestureRecognizer) initWithTarget:v4 action:"edgePanGestureHandler:"];
    edgePanGestureRecognizer = v4->_edgePanGestureRecognizer;
    v4->_edgePanGestureRecognizer = v8;

    [(UIScreenEdgePanGestureRecognizer *)v4->_edgePanGestureRecognizer setEdges:8];
    [(UIScreenEdgePanGestureRecognizer *)v4->_edgePanGestureRecognizer setCancelsTouchesInView:1];
    [(UIScreenEdgePanGestureRecognizer *)v4->_edgePanGestureRecognizer setDelegate:v4];
    if ([(BKPictureBookViewController *)v4 isViewLoaded])
    {
      v10 = [(BKPictureBookViewController *)v4 view];
      [v10 addGestureRecognizer:v4->_edgePanGestureRecognizer];

      [(BKPictureBookViewController *)v4 setSwipeToShowScrubberEnable:1];
    }
    v11 = +[UITraitCollection bc_allAPITraits];
    id v12 = [(BKPictureBookViewController *)v4 registerForTraitChanges:v11 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)dealloc
{
  [(UIScreenEdgePanGestureRecognizer *)self->_edgePanGestureRecognizer setDelegate:0];
  [(UIScreenEdgePanGestureRecognizer *)self->_edgePanGestureRecognizer removeTarget:0 action:0];
  [(BKPictureBookViewController *)self _cleanupSnapshotWebViews];
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v3 dealloc];
}

- (void)_cleanupSnapshotWebViews
{
  p_snapshotWebView = &self->_snapshotWebView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotWebView);
  [WeakRetained removeFromSuperview];

  objc_storeWeak((id *)p_snapshotWebView, 0);
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  [(BKPictureBookViewController *)&v5 loadView];
  if (self->_edgePanGestureRecognizer)
  {
    if ([(BKThumbnailBookViewController *)self isInterfaceRTL]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 8;
    }
    [(UIScreenEdgePanGestureRecognizer *)self->_edgePanGestureRecognizer setEdges:v3];
    CFStringRef v4 = [(BKPictureBookViewController *)self view];
    [v4 addGestureRecognizer:self->_edgePanGestureRecognizer];

    [(BKPictureBookViewController *)self setSwipeToShowScrubberEnable:1];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPhone()
    && [(BKPictureBookViewController *)self hasContinuousScrollingBehavior])
  {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  return [(BKBookViewController *)&v4 supportedInterfaceOrientations];
}

- (void)setSwipeToShowScrubberEnable:(BOOL)a3
{
}

- (UIView)scrubberContainerView
{
  scrubberContainerView = self->_scrubberContainerView;
  if (!scrubberContainerView)
  {
    id v4 = objc_alloc((Class)UIView);
    [(BKPictureBookViewController *)self scrubberContainerViewFrame];
    objc_super v5 = (UIView *)[v4 initWithFrame:];
    v6 = self->_scrubberContainerView;
    self->_scrubberContainerView = v5;

    [(UIView *)self->_scrubberContainerView setAutoresizingMask:0];
    scrubberContainerView = self->_scrubberContainerView;
  }

  return scrubberContainerView;
}

- (UIView)currentReadingPositionView
{
  currentReadingPositionView = self->_currentReadingPositionView;
  if (!currentReadingPositionView)
  {
    id v4 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 5.0, 5.0];
    objc_super v5 = self->_currentReadingPositionView;
    self->_currentReadingPositionView = v4;

    [(UIView *)self->_currentReadingPositionView bounds];
    CGFloat v6 = CGRectGetWidth(v15) * 0.5;
    v7 = [(UIView *)self->_currentReadingPositionView layer];
    [v7 setCornerRadius:v6];

    [(UIView *)self->_currentReadingPositionView setAutoresizingMask:0];
    v8 = +[UIColor bc_booksWhite];
    [(UIView *)self->_currentReadingPositionView setBackgroundColor:v8];

    id v9 = +[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.18];
    id v10 = [v9 CGColor];
    v11 = [(UIView *)self->_currentReadingPositionView layer];
    [v11 setShadowColor:v10];

    id v12 = [(UIView *)self->_currentReadingPositionView layer];
    [v12 setShadowRadius:4.0];

    [(UIView *)self->_currentReadingPositionView setUserInteractionEnabled:0];
    [(UIView *)self->_currentReadingPositionView setTranslatesAutoresizingMaskIntoConstraints:0];
    currentReadingPositionView = self->_currentReadingPositionView;
  }

  return currentReadingPositionView;
}

- (CGRect)scrubberContainerViewFrame
{
  uint64_t v3 = [(BKPictureBookViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  unsigned __int8 v6 = [(BKThumbnailBookViewController *)self isInterfaceRTL];
  v7 = [(BKPictureBookViewController *)self view];
  v8 = v7;
  if (v6)
  {
    [v7 safeAreaInsets];
    double v10 = v9 + 8.0;
  }
  else
  {
    [v7 frame];
    double Width = CGRectGetWidth(v21);
    id v12 = [(BKPictureBookViewController *)self view];
    [v12 safeAreaInsets];
    double v10 = Width - v13 + -40.0 + -8.0;
  }
  double v14 = v5 + 8.0;
  CGRect v15 = [(BKPictureBookViewController *)self view];
  [v15 frame];
  CGFloat v16 = CGRectGetHeight(v22) + v14 * -2.0;

  double v17 = 40.0;
  double v18 = v10;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v17;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setupVerticalScrubber
{
  uint64_t v3 = [(BKPictureBookViewController *)self scrubberContainerView];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v68[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v68[1] = v4;
  v68[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v3 setTransform:v68];

  double v5 = [(BKPictureBookViewController *)self scrubberContainerView];
  unsigned __int8 v6 = [v5 superview];

  if (!v6)
  {
    v7 = [(BKPictureBookViewController *)self view];
    v8 = [(BKPictureBookViewController *)self scrubberContainerView];
    [v7 addSubview:v8];

    double v9 = [(BKPictureBookViewController *)self verticalScrubber];
    [v5 addSubview:v9];

    [(BKPictureBookViewController *)self scrubberContainerViewFrame];
    [v5 setFrame:];
    [v5 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [(BKPictureBookViewController *)self verticalScrubber];
    [v18 setFrame:v11, v13, v15, v17];

    double v19 = [(BKPictureBookViewController *)self currentReadingPositionView];
    [v19 frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    double v25 = v24;
    double v27 = v26;

    LODWORD(v8) = [(BKThumbnailBookViewController *)self isInterfaceRTL];
    v28 = [(BKPictureBookViewController *)self verticalScrubber];
    [v28 frame];
    if (v8)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v29);
      v69.origin.x = v21;
      v69.origin.y = v23;
      v69.size.width = v25;
      v69.size.height = v27;
      double v34 = 8.0 - CGRectGetWidth(v69);
      double v35 = 0.5;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v29);
      v70.origin.x = v21;
      v70.origin.y = v23;
      v70.size.width = v25;
      v70.size.height = v27;
      double MaxX = MinX - CGRectGetWidth(v70);
      v71.origin.x = v21;
      v71.origin.y = v23;
      v71.size.width = v25;
      v71.size.height = v27;
      double v34 = 8.0 - CGRectGetWidth(v71);
      double v35 = -0.5;
    }
    double v37 = MaxX + v34 * v35;

    v38 = [(BKPictureBookViewController *)self currentReadingPositionView];
    [v38 setFrame:v37, 0.0, v25, v27];

    v39 = [(BKPictureBookViewController *)self currentReadingPositionView];
    [v5 addSubview:v39];
  }
  [(BKPictureBookViewController *)self scrubberContainerViewFrame];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  [v5 frame];
  v73.origin.x = v48;
  v73.origin.y = v49;
  v73.size.width = v50;
  v73.size.height = v51;
  v72.origin.x = v41;
  v72.origin.y = v43;
  v72.size.width = v45;
  v72.size.height = v47;
  if (!CGRectEqualToRect(v72, v73))
  {
    [v5 setFrame:v41, v43, v45, v47];
    [v5 bounds];
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    v60 = [(BKPictureBookViewController *)self verticalScrubber];
    [v60 setFrame:v53, v55, v57, v59];
  }
  v61 = [(BKPictureBookViewController *)self verticalScrubber];
  v62 = [v61 layer];
  [v62 removeAllAnimations];

  int64_t v63 = [(BKBookViewController *)self pageCountExcludingUpsell];
  v64 = [(BKPictureBookViewController *)self verticalScrubber];
  [v64 setPageCount:v63];

  int64_t v65 = [(BKBookViewController *)self currentPageNumber];
  v66 = [(BKPictureBookViewController *)self verticalScrubber];
  [v66 setPageNumber:v65];

  v67 = [(BKPictureBookViewController *)self verticalScrubber];
  [v67 setProgress:1.0];
}

- (BOOL)isVerticalScrubberVisible
{
  if (!self->super._verticalScrubber) {
    return 0;
  }
  uint64_t v3 = [(UIView *)self->_scrubberContainerView superview];
  if (v3)
  {
    [(UIView *)self->_scrubberContainerView alpha];
    BOOL v5 = v4 != 0.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)hideVerticalScrubber
{
  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible])
  {
    [(BKPictureBookViewController *)self hideVerticalScrubberAndResetZoomScale:1];
  }
}

- (void)showVerticalScrubber
{
  if (![(BKPictureBookViewController *)self isVerticalScrubberVisible])
  {
    [(BKPictureBookViewController *)self prepareForScrubberAnimation];
    [(BKPictureBookViewController *)self animateVerticalScrubberIn:1 animated:1.1];
  }
}

- (void)hideVerticalScrubberAndResetZoomScale:(BOOL)a3
{
  objc_opt_class();
  BOOL v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
  unsigned __int8 v6 = BUDynamicCast();

  if (v6)
  {
    v7 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
    v8 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    [v8 layoutIfNeeded];

    [(BKThumbnailBookViewController *)self defaultPageNumberHUDWidthConstraintConstant];
    double v10 = v9;
    double v11 = [(BKThumbnailBookViewController *)self pageNumberHUDWidthConstraint];
    [v11 setConstant:v10];

    double v12 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    [v12 forceReflowText];

    double v13 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    [v13 setNeedsLayout];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_111A0;
    v22[3] = &unk_1DAC90;
    BOOL v25 = a3;
    id v14 = v6;
    id v23 = v14;
    double v24 = self;
    [v7 addAnimations:v22];
    objc_initWeak(&location, self);
    double v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    double v17 = sub_11308;
    double v18 = &unk_1DACB8;
    objc_copyWeak(&v20, &location);
    id v19 = v14;
    [v7 addCompletion:&v15];
    [v7 startAnimation:v15, v16, v17, v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)prepareForScrubberAnimation
{
  objc_opt_class();
  uint64_t v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  double v4 = BUDynamicCast();

  if (v4)
  {
    [(BKBookViewController *)self setControlsVisible:0];
    BOOL v5 = [(BKPictureBookViewController *)self pictureBookRenderingCacheIfLoaded];
    [v5 suspend];

    [(BKPictureBookViewController *)self setupVerticalScrubber];
    id v6 = [v4 shouldDisplaySpread];
    v7 = [(BKPictureBookViewController *)self verticalScrubber];
    [v7 setShowSpreads:v6];

    CGAffineTransformMakeScale(&v15, 0.0, 0.0);
    v8 = [(BKPictureBookViewController *)self scrubberContainerView];
    CGAffineTransform v14 = v15;
    [v8 setTransform:&v14];

    double v9 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v13[1] = v10;
    v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v9 setTransform:v13];

    double v11 = [(BKPictureBookViewController *)self scrubberContainerView];
    [v11 setAlpha:1.0];

    if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()) {
      [(BKPictureBookViewController *)self displayVerticalScrubberBackground];
    }
    [(BKPictureBookViewController *)self updateCurrentReadingPositionViewIfNeeded];
    [(UIView *)self->_currentReadingPositionView setAlpha:0.0];
    [v4 setAllowDoubleTapToZoom:0];
    [(BKBookViewController *)self pageViewControllersDidChange];
    double v12 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    [v12 layoutIfNeeded];
  }
}

- (void)edgePanGestureHandler:(id)a3
{
  id v14 = a3;
  if ([v14 state] == (char *)&dword_0 + 1)
  {
    [(BKPictureBookViewController *)self prepareForScrubberAnimation];
  }
  else if ([v14 state] == (char *)&dword_0 + 2 || objc_msgSend(v14, "state") == (char *)&dword_0 + 3)
  {
    objc_opt_class();
    double v4 = [(BKPictureBookViewController *)self pageNavigationViewController];
    BOOL v5 = BUDynamicCast();

    if (v5)
    {
      id v6 = [(BKPictureBookViewController *)self view];
      [v14 locationInView:v6];
      double v8 = v7;

      if (![(BKThumbnailBookViewController *)self isInterfaceRTL])
      {
        double v9 = [(BKPictureBookViewController *)self view];
        [v9 bounds];
        double v8 = CGRectGetWidth(v16) - v8;
      }
      if (v8 / 112.0 + -0.2 >= 0.0) {
        double v10 = v8 / 112.0 + -0.2;
      }
      else {
        double v10 = 0.0;
      }
      BOOL v11 = [v14 state] == (char *)&dword_0 + 3;
      BOOL v12 = v10 < 1.0;
      double v13 = 1.1;
      if (!v11 || !v12) {
        double v13 = v10;
      }
      [(BKPictureBookViewController *)self animateVerticalScrubberIn:v11 & v12 animated:v13];
    }
  }
}

- (void)displayVerticalScrubberBackground
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_11914;
  CGAffineTransform v15 = sub_11924;
  objc_opt_class();
  uint64_t v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  BUDynamicCast();
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v12[5])
  {
    objc_initWeak(&location, self);
    double v4 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
    BOOL v5 = (char *)[(id)v12[5] pageOffset];
    id v6 = [(BKBookViewController *)self book];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1192C;
    v8[3] = &unk_1DACE0;
    objc_copyWeak(&v9, &location);
    v8[4] = &v11;
    id v7 = [v4 generateMasterImageForPageNumber:v5 + 1 asset:v6 priority:0 callbackBlock:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v11, 8);
}

- (void)setupBackgroundImageViewWithImage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIView);
  id v6 = [(BKPictureBookViewController *)self view];
  [v6 bounds];
  id v7 = [v5 initWithFrame:];
  [(BKPictureBookViewController *)self setBackgroundImageView:v7];

  id v8 = objc_alloc((Class)UIImageView);
  id v9 = [(BKPictureBookViewController *)self backgroundImageView];
  [v9 bounds];
  id v10 = [v8 initWithFrame:];

  [v10 setImage:v4];
  CGAffineTransformMakeScale(&v29, 2.0, 2.0);
  CGAffineTransform v28 = v29;
  [v10 setTransform:&v28];
  uint64_t v11 = +[UIBlurEffect _effectWithBlurRadius:40.0 scale:1.3];
  id v12 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v11];
  uint64_t v13 = [(BKPictureBookViewController *)self backgroundImageView];
  [v13 bounds];
  [v12 setFrame:];

  id v14 = objc_alloc((Class)UIView);
  CGAffineTransform v15 = [(BKPictureBookViewController *)self backgroundImageView];
  [v15 bounds];
  id v16 = [v14 initWithFrame:];

  double v17 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
  [v16 setBackgroundColor:v17];

  double v18 = +[CAFilter filterWithType:kCAFilterPlusD];
  id v19 = [v16 layer];
  [v19 setCompositingFilter:v18];

  id v20 = objc_alloc((Class)UIView);
  CGFloat v21 = [(BKPictureBookViewController *)self backgroundImageView];
  [v21 bounds];
  id v22 = [v20 initWithFrame:];

  id v23 = +[UIColor colorWithDynamicProvider:&stru_1DAD20];
  [v22 setBackgroundColor:v23];

  double v24 = [(BKPictureBookViewController *)self backgroundImageView];
  [v24 addSubview:v10];

  BOOL v25 = [(BKPictureBookViewController *)self backgroundImageView];
  [v25 addSubview:v12];

  double v26 = [(BKPictureBookViewController *)self backgroundImageView];
  [v26 addSubview:v16];

  double v27 = [(BKPictureBookViewController *)self backgroundImageView];
  [v27 addSubview:v22];
}

- (void)animateVerticalScrubberIn:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  id v7 = [(BKPictureBookViewController *)self pageNavigationViewController];
  id v8 = BUDynamicCast();

  if (!v8)
  {
    BCReportAssertionFailureWithMessage();
    goto LABEL_30;
  }
  id v9 = [v8 scrollView];
  [v9 bounds];
  double v11 = v10;
  [v8 pageSize];
  double v13 = v12;
  if ([v8 shouldDisplaySpread]) {
    double v13 = v13 + v13;
  }
  unsigned int v14 = [(BKThumbnailBookViewController *)self isInterfaceRTL];
  double v15 = (v11 - v13) * 0.5;
  id v16 = [(BKPictureBookViewController *)self view];
  [v16 safeAreaInsets];
  double v18 = v17;
  double v20 = v19;

  if (v14) {
    double v21 = v20;
  }
  else {
    double v21 = v18;
  }
  double v22 = v15 - v21;
  if (v22 >= 56.0)
  {
    [v9 zoomScale];
    BOOL v23 = fabs(v24 + -1.0) >= 0.00999999978;
  }
  else
  {
    BOOL v23 = 1;
  }
  if (a3 >= 1.0)
  {
    BOOL v25 = [(BKPictureBookViewController *)self pictureBookRenderingCacheIfLoaded];
    [v25 resume];

    [(BKPictureBookViewController *)self setSwipeToShowScrubberEnable:0];
    a3 = 1.0;
    goto LABEL_14;
  }
  if (a3 <= 1.0)
  {
LABEL_14:
    double v26 = [(BKThumbnailBookViewController *)self topToolbar];
    [v26 alpha];
    if (v27 == 0.0)
    {
      CGAffineTransform v28 = [(BKPictureBookViewController *)self view];
      [v28 safeAreaInsets];
    }
    else
    {
      CGAffineTransform v28 = [(BKThumbnailBookViewController *)self topToolbar];
      [v28 frame];
      double MaxY = CGRectGetMaxY(v88);
    }
    double v30 = MaxY;

    [v9 contentOffset];
    double v32 = v31;
    [v9 bounds];
    double v34 = v32 + v33 * 0.5;
    [v9 contentSize];
    double v36 = v34 / v35;
    [v9 bounds];
    double v38 = v30 * 0.5 + v36 * v37;
    v39 = [(BKPictureBookViewController *)self scrubberContainerView];
    [v39 center];
    double v41 = v40 - v38;

    long long v67 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v68 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v87.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v87.c = v67;
    long long v66 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v87.tx = v66;
    if ([(BKThumbnailBookViewController *)self isInterfaceRTL])
    {
      double v42 = [(BKPictureBookViewController *)self scrubberContainerView];
      [v42 center];
      double v44 = -v43;
    }
    else
    {
      double v42 = [(BKPictureBookViewController *)self view];
      [v42 frame];
      double Width = CGRectGetWidth(v89);
      double v46 = [(BKPictureBookViewController *)self scrubberContainerView];
      [v46 center];
      double v44 = Width - v47;
    }
    *(_OWORD *)&v86.a = v68;
    *(_OWORD *)&v86.c = v67;
    *(_OWORD *)&v86.tx = v66;
    CGAffineTransformTranslate(&v87, &v86, (1.0 - a3) * v44, -((1.0 - a3) * v41));
    CGAffineTransform v85 = v87;
    CGAffineTransformScale(&v86, &v85, a3, a3);
    CGAffineTransform v87 = v86;
    memset(&v86.c, 0, 32);
    if (v14) {
      double v48 = 56.0;
    }
    else {
      double v48 = -56.0;
    }
    *(_OWORD *)&v85.a = v68;
    *(_OWORD *)&v85.c = v67;
    *(_OWORD *)&v85.tx = v66;
    *(_OWORD *)&v86.a = 0uLL;
    CGAffineTransformTranslate(&v86, &v85, v48 * a3, 0.0);
    CGFloat v49 = [(BKPictureBookViewController *)self view];
    [v49 frame];
    double v50 = 56.0 - v22;
    CGFloat v51 = CGRectGetWidth(v90) - (56.0 - v22);

    double v52 = [v8 view];
    [v52 frame];
    CGFloat v53 = v51 / CGRectGetWidth(v91);

    *(_OWORD *)&v84.a = v68;
    *(_OWORD *)&v84.c = v67;
    *(_OWORD *)&v84.tx = v66;
    memset(&v85, 0, sizeof(v85));
    CGAffineTransformTranslate(&v85, &v84, v50 * a3, 0.0);
    [(BKThumbnailBookViewController *)self defaultPageNumberHUDWidthConstraintConstant];
    double v55 = v54 + a3 * -56.0;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_12430;
    v73[3] = &unk_1DAD48;
    BOOL v82 = v23;
    id v56 = v8;
    CGAffineTransform v77 = v85;
    CGAffineTransform v79 = v87;
    CGAffineTransform v81 = v86;
    char v83 = v14;
    id v74 = v56;
    v75 = self;
    double v76 = 1.0 - (1.0 - v53) * a3;
    double v78 = v55;
    double v80 = a3;
    double v57 = objc_retainBlock(v73);
    objc_initWeak((id *)&v84, self);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_12590;
    v71[3] = &unk_1DAD70;
    objc_copyWeak(v72, (id *)&v84);
    v71[4] = self;
    v72[1] = *(id *)&a3;
    v72[2] = *(id *)&v55;
    double v58 = objc_retainBlock(v71);
    if (v4)
    {
      double v59 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
      [v59 addAnimations:v57];

      v60 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
      [v60 addCompletion:v58];

      v61 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_1263C;
      v69[3] = &unk_1DAD98;
      objc_copyWeak(&v70, (id *)&v84);
      [v61 addCompletion:v69];

      v62 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
      [v62 startAnimation];

      objc_destroyWeak(&v70);
    }
    else
    {
      ((void (*)(void *))v57[2])(v57);
      ((void (*)(void *, void))v58[2])(v58, 0);
    }
    int64_t v63 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
    v64 = (char *)[v63 state];

    if (v64 != (unsigned char *)&dword_0 + 1)
    {
      int64_t v65 = [(BKPictureBookViewController *)self verticalScrubberAnimator];
      [v65 startAnimation];
    }
    objc_destroyWeak(v72);
    objc_destroyWeak((id *)&v84);
  }
LABEL_30:
}

- (UIViewPropertyAnimator)verticalScrubberAnimator
{
  verticalScrubberAnimator = self->_verticalScrubberAnimator;
  if (!verticalScrubberAnimator)
  {
    id v4 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:230.0 damping:25.0 initialVelocity:0.0];
    id v5 = objc_alloc((Class)UIViewPropertyAnimator);
    [v4 settlingDuration];
    id v6 = [v5 initWithDuration:v4];
    id v7 = self->_verticalScrubberAnimator;
    self->_verticalScrubberAnimator = v6;

    verticalScrubberAnimator = self->_verticalScrubberAnimator;
  }

  return verticalScrubberAnimator;
}

- (void)updateCurrentReadingPositionViewIfNeeded
{
  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible])
  {
    uint64_t v3 = [(BKPictureBookViewController *)self verticalScrubber];
    [v3 thumbRect];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    double v12 = [(BKPictureBookViewController *)self scrubberContainerView];
    v22.origin.x = v5;
    v22.origin.y = v7;
    v22.size.width = v9;
    v22.size.height = v11;
    double MidX = CGRectGetMidX(v22);
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    double MidY = CGRectGetMidY(v23);
    double v15 = [(BKPictureBookViewController *)self verticalScrubber];
    [v12 convertPoint:v15 fromView:MidX, MidY];
    double v17 = v16;

    [(UIView *)self->_currentReadingPositionView frame];
    -[UIView setFrame:](self->_currentReadingPositionView, "setFrame:", v24.origin.x, v17 - floor(CGRectGetHeight(v24) * 0.5), v24.size.width, v24.size.height);
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    double v18 = floor(CGRectGetMidX(v25));
    v26.origin.x = v5;
    v26.origin.y = v7;
    v26.size.width = v9;
    v26.size.height = v11;
    double v19 = floor(CGRectGetMidY(v26));
    verticalScrubber = self->super._verticalScrubber;
    -[BKThumbnailScrubber setGravitationalPoint:](verticalScrubber, "setGravitationalPoint:", v18, v19);
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v11 viewDidLoad];
  uint64_t v3 = +[UIColor bc_booksBackground];
  double v4 = [(BKThumbnailBookViewController *)self topToolbar];
  [v4 setBarTintColor:v3];

  NSAttributedStringKey v12 = NSForegroundColorAttributeName;
  CGFloat v5 = +[UIColor bc_booksLabelColor];
  double v13 = v5;
  double v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CGFloat v7 = [(BKThumbnailBookViewController *)self topToolbar];
  [v7 setTitleTextAttributes:v6];

  double v8 = +[UIColor bc_booksLabelColor];
  CGFloat v9 = [(BKThumbnailBookViewController *)self topToolbar];
  [v9 setTintColor:v8];

  double v10 = [(BKThumbnailBookViewController *)self pageNumberHUD];
  [v10 setDelegate:self];

  [(BKPictureBookViewController *)self updatePageNumberHUD];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v22 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6 && self->super._imageCache)
  {
    CGFloat v7 = [(BKPictureBookViewController *)self _thumbnailBookViewConfiguration];
    double v8 = [(BKBookViewController *)self book];
    CGFloat v9 = [(BKBookViewController *)self book];
    double v10 = [v9 firstDocument];
    [v10 fixedLayoutSize];
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = [v8 hidesSpine] ^ 1;
    [v6 bounds];
    double v20 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v7, v15, v12, v14, v16, v17, v18, v19);

    double v21 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
    [v21 setLayoutGeometry:v20];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v4 viewDidAppear:a3];
  [(BKPictureBookViewController *)self generateSnapshotsForCurrentPages];
  [(BKPictureBookViewController *)self generateRenderingPiggyBackForAllPages];
  [(BKPictureBookViewController *)self _prewarmThumbnailsForVerticalScrubber];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKPictureBookViewController *)self _cancelCachingAndCleanupSnapshotWebViews];
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v5 viewWillDisappear:v3];
}

- (void)_cancelCachingAndCleanupSnapshotWebViews
{
  objc_opt_class();
  BOOL v3 = BUDynamicCast();
  objc_super v4 = [v3 renderingPiggyBack];
  [v4 invalidate];

  imageCache = self->super._imageCache;
  thumbnailContext = self->_thumbnailContext;

  [(IMThumbnailRenderingCache *)imageCache cancelRenderingCacheOperationsForTarget:0 context:thumbnailContext];
}

- (id)_thumbnailBookViewConfiguration
{
  return [(BKPictureBookViewController *)self im_ancestorConfigurationConformingToProtocol:&OBJC_PROTOCOL___BKThumbnailBookViewConfiguring];
}

- (id)pictureBookRenderingCacheIfLoaded
{
  return self->super._imageCache;
}

- (id)pictureBookRenderingCache
{
  p_imageCache = &self->super._imageCache;
  if (!self->super._imageCache)
  {
    objc_super v4 = [(BKBookViewController *)self book];

    if (v4)
    {
      objc_super v5 = [(BKPictureBookViewController *)self _thumbnailBookViewConfiguration];
      id v6 = [(BKBookViewController *)self book];
      CGFloat v7 = [AEPictureBookRenderingCache alloc];
      double v8 = [v6 databaseKey];
      CGFloat v9 = [(AEPictureBookRenderingCache *)v7 initWithIdentifier:v8 configuration:v5 webViewBuilder:self];

      [(AEPictureBookRenderingCache *)v9 setUpsellPageNumber:[(BKBookViewController *)self upsellPageNumber]];
      objc_storeStrong((id *)p_imageCache, v9);
      double v10 = +[BKPictureBookReadingStatisticsCollector readingStatisticsCollectorWithAssetViewController:self];
      double v11 = [(BKBookViewController *)self book];
      [v10 setupWithBookInfo:v11];

      [(AEPictureBookRenderingCache *)v9 setRenderingPiggyBack:v10];
      double v12 = [(AEPictureBookRenderingCache *)v9 persistentCachePath];
      double v13 = [(BKBookViewController *)self book];
      double v14 = [v13 persistentCachePath];
      unsigned __int8 v15 = [v12 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        double v16 = [(BKBookViewController *)self book];
        [v16 resetPersistentCache];

        double v17 = [(BKBookViewController *)self book];
        double v18 = [(AEPictureBookRenderingCache *)v9 persistentCachePath];
        [v17 setPersistentCachePath:v18];

        [(NSManagedObjectContext *)self->super.super._bookMoc save:0];
      }
    }
  }
  [(BKPictureBookViewController *)self idealCacheSize];
  -[IMThumbnailRenderingCache setPrimaryImageSize:](*p_imageCache, "setPrimaryImageSize:");
  double v19 = *p_imageCache;

  return v19;
}

- (BOOL)_bookRenditionFlowIsScrolled
{
  BOOL v3 = [(BKBookViewController *)self book];
  objc_super v4 = [v3 fixedLayoutFlow];
  if ([v4 isEqualToString:@"scrolled-continuous"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(BKBookViewController *)self book];
    CGFloat v7 = [v6 fixedLayoutFlow];
    unsigned __int8 v5 = [v7 isEqualToString:@"scrolled-doc"];
  }
  return v5;
}

- (BOOL)_bookRenditionFlowIsScrolledContinuous
{
  v2 = [(BKBookViewController *)self book];
  BOOL v3 = [v2 fixedLayoutFlow];
  unsigned __int8 v4 = [v3 isEqualToString:@"scrolled-continuous"];

  return v4;
}

- (unint64_t)defaultLayoutToUse
{
  if ([(BKPictureBookViewController *)self _bookRenditionFlowIsScrolled])
  {
    BOOL v3 = [(BKBookViewController *)self book];
    unint64_t v4 = [(BKThumbnailBookViewController *)self scrollLayoutForBook:v3];

    return v4;
  }
  else
  {
    return [(BKBookViewController *)self lastLayoutUsed];
  }
}

- (id)lastLayoutUsedKey
{
  return @"BKPictureBookLayoutKey";
}

- (BOOL)hidesPageControlsOnOpen
{
  return 1;
}

- (double)hidesPageControlsOnOpenDelay
{
  return 5.0;
}

- (BOOL)shouldSavePageControlVisibility
{
  return 0;
}

- (BOOL)isSharingSupported
{
  return 1;
}

- (BOOL)showSpreads
{
  v2 = [(BKBookViewController *)self book];
  BOOL v3 = [v2 fixedLayoutSpread];
  char v4 = [v3 isEqualToString:@"none"] ^ 1;

  return v4;
}

- (id)pageNavigationViewController
{
  pageNavigationViewController = self->super.super._pageNavigationViewController;
  if (!pageNavigationViewController)
  {
    if ((char *)[(BKBookViewController *)self layout] == (char *)&dword_0 + 1
      || !+[BKThumbnailBookViewController verticalScrollFeatureEnabled])
    {
      if ([(BKPictureBookViewController *)self showSpreads])
      {
        double v8 = objc_alloc_init(BKPictureBookNavigationController);
        [(BKPageNavigationViewController *)v8 setDelegate:self];
        [(BKPageNavigationViewController *)v8 setPageCount:[(BKBookViewController *)self pageCountIncludingUpsell]];
        [(BKPictureBookNavigationController *)v8 setDrawsSpine:1];
        CGFloat v9 = [(BKBookViewController *)self book];
        double v10 = [v9 firstDocument];
        [v10 fixedLayoutSize];
        -[BKPictureBookNavigationController setContentSize:](v8, "setContentSize:");

        double v11 = [(BKBookViewController *)self book];
        -[BKPictureBookNavigationController setDrawsSpine:](v8, "setDrawsSpine:", [v11 hidesSpine] ^ 1);

        double v12 = [(BKBookViewController *)self book];
        -[BKPictureBookNavigationController setOpenToSpread:](v8, "setOpenToSpread:", [v12 openToSpread]);

        [(BKViewController *)v8 setLayoutDirection:[(BKViewController *)self layoutDirection]];
      }
      else
      {
        double v8 = objc_alloc_init(BKPageScrollerViewController);
        [(BKPictureBookNavigationController *)v8 setThumbnailingDelegate:self];
        [(BKPictureBookNavigationController *)v8 setMaintainZoomScale:1];
        [(BKPageNavigationViewController *)v8 setDelegate:self];
        [(BKPictureBookNavigationController *)v8 setImageResizerDelegate:self];
        [(BKPageNavigationViewController *)v8 setPageCount:[(BKBookViewController *)self pageCountIncludingUpsell]];
        [(BKViewController *)v8 setLayoutDirection:[(BKViewController *)self layoutDirection]];
        [(BKPictureBookNavigationController *)v8 setMaxZoomScale:8.0];
        [(BKPictureBookNavigationController *)v8 setResizeViewsWhenZoomed:1];
        [(BKPictureBookNavigationController *)v8 setMaxResizeScale:4.0];
      }
      double v13 = self->super.super._pageNavigationViewController;
      self->super.super._pageNavigationViewController = &v8->super;
    }
    else
    {
      char v4 = objc_alloc_init(BKPictureBookVerticalNavigationController);
      [(BKPictureBookVerticalNavigationController *)v4 setDelegate:self];
      [(BKPictureBookVerticalNavigationController *)v4 setPageCount:[(BKBookViewController *)self pageCountIncludingUpsell]];
      unsigned __int8 v5 = [(BKBookViewController *)self book];
      [(BKPictureBookVerticalNavigationController *)v4 setBook:v5];

      [(BKViewController *)v4 setLayoutDirection:[(BKViewController *)self layoutDirection]];
      id v6 = self->super.super._pageNavigationViewController;
      self->super.super._pageNavigationViewController = &v4->super;
      CGFloat v7 = v4;

      [(BKPictureBookVerticalNavigationController *)v7 loadViewIfNeeded];
      [(BKPictureBookViewController *)self _prewarmThumbnailsForVerticalScrubber];
    }
    [(BKPictureBookViewController *)self addChildViewController:self->super.super._pageNavigationViewController];
    double v14 = +[NSNumber numberWithUnsignedInteger:[(BKBookViewController *)self layout]];
    [(BKPictureBookViewController *)self _updateWebProcessPluginObject:v14 withParameter:@"BEWebProcessPluginLayoutModeParameterKey"];

    pageNavigationViewController = self->super.super._pageNavigationViewController;
  }

  return pageNavigationViewController;
}

- (void)setLayout:(unint64_t)a3
{
  v31.receiver = self;
  v31.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v31 setLayout:a3];
  [(BKPictureBookViewController *)self hideVerticalScrubber];
  [(BKThumbnailBookViewController *)self updateBottomToolbar:1];
  [(BKPictureBookViewController *)self updatePageNumberHUD];
  [(BKBookViewController *)self clearSearchResult];
  char v4 = [(BKPageNavigationViewController *)self->super.super._pageNavigationViewController view];
  unsigned __int8 v5 = [v4 superview];

  id v6 = [(BKPageNavigationViewController *)self->super.super._pageNavigationViewController view];
  [v6 removeFromSuperview];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  CGFloat v7 = [(BKPageNavigationViewController *)self->super.super._pageNavigationViewController childViewControllers];
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * (void)v11) removeFromParentViewController];
        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  [(BKPageNavigationViewController *)self->super.super._pageNavigationViewController removeFromParentViewController];
  pageNavigationViewController = self->super.super._pageNavigationViewController;
  self->super.super._pageNavigationViewController = 0;

  double v13 = [(BKPictureBookViewController *)self pageNavigationViewController];
  double v14 = [(BKPictureBookViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  CGRect v23 = [v13 view];
  [v23 setFrame:v16, v18, v20, v22];

  CGRect v24 = [v13 view];
  [v5 insertSubview:v24 aboveSubview:self->super._backgroundView];

  CGRect v25 = +[NSNumber numberWithUnsignedInteger:[(BKBookViewController *)self layout]];
  [(BKPictureBookViewController *)self _updateWebProcessPluginObject:v25 withParameter:@"BEWebProcessPluginLayoutModeParameterKey"];

  CGRect v26 = [(BKThumbnailBookViewController *)self pageNumberHUD];
  [v26 setNeedsUpdateConstraints];
}

- (void)updatePageNumberHUD
{
  unint64_t layout = self->super.super._layout;
  char v4 = [(BKThumbnailBookViewController *)self pageNumberHUD];
  unsigned __int8 v5 = v4;
  if (layout == 2)
  {
    [v4 setIconSymbol:@"sidebar.trailing"];

    id v6 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  else
  {
    [v4 setIconSymbol:0];

    id v6 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  [v6 setUserInteractionEnabled:v7];
}

- (BOOL)savedLocationIsEndOfBook
{
  BOOL v3 = [(BKBookViewController *)self book];
  char v4 = [v3 linearDocuments];

  unsigned __int8 v5 = (char *)[v4 count];
  if ([(BKPictureBookViewController *)self showSpreads])
  {
    if ((uint64_t)v5 < 3)
    {
LABEL_7:
      BOOL v13 = 0;
      goto LABEL_8;
    }
    unint64_t v6 = ~(_BYTE)v5 | 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    unint64_t v6 = -1;
  }
  uint64_t v7 = [v4 objectAtIndex:&v5[v6]];
  if (!v7) {
    goto LABEL_7;
  }
  id v8 = (void *)v7;
  id v9 = [(BKBookViewController *)self book];
  uint64_t v10 = [v9 readingLocation];
  id v11 = [v10 ordinal];
  double v12 = [v8 documentOrdinal];
  BOOL v13 = (uint64_t)v11 >= (int)[v12 intValue];

LABEL_8:
  return v13;
}

- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6 = a3;
  [(BKPictureBookViewController *)self _cancelCachingAndCleanupSnapshotWebViews];
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v7 appearanceViewController:v6 didChangeLayout:a4];
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _AECaptureLocationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BKPictureBookViewController setLocation:]");
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "#PictureBookVC %@: %@", buf, 0x16u);
  }
  v31.receiver = self;
  v31.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v31 setLocation:v4];
  objc_super v7 = [(BKPictureBookViewController *)self viewIfLoaded];
  id v8 = [v7 window];
  id v9 = [v8 windowScene];
  id v10 = [v9 activationState];

  if (v10)
  {
    id v11 = _AEBookPluginsLifeCycleLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(BKBookViewController *)self book];
      BOOL v13 = [v12 assetLogID];
      *(_DWORD *)buf = 138543362;
      id v33 = v13;
      double v14 = "Setting Location when scene state is not foregroundActive. Bailing out. logID:%{public}@";
      double v15 = v11;
      uint32_t v16 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else
  {
    double v17 = [(BKPictureBookViewController *)self viewIfLoaded];

    if (!v17)
    {
      id v11 = _AEBookPluginsLifeCycleLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      double v12 = [(BKBookViewController *)self book];
      BOOL v13 = [v12 assetLogID];
      *(_DWORD *)buf = 138543618;
      id v33 = v4;
      __int16 v34 = 2114;
      id v35 = v13;
      double v14 = "Bailing out on attempt to set location when our view is not loaded. Location:%{public}@ logID:%{public}@ ";
      double v15 = v11;
      uint32_t v16 = 22;
      goto LABEL_6;
    }
    objc_opt_class();
    double v18 = [(BKBookViewController *)self location];
    id v11 = BUDynamicCast();

    double v19 = _AECaptureLocationLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v20)
      {
        double v21 = +[NSNumber numberWithUnsignedInteger:(char *)[v11 ordinal] + (void)[v11 pageOffset]];
        *(_DWORD *)buf = 138412290;
        id v33 = v21;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#PictureBookVC 1 Setting offset: %@", buf, 0xCu);
      }
      double v22 = [(BKPictureBookViewController *)self pageNavigationViewController];
      CGRect v23 = (char *)[v11 ordinal];
      CGRect v24 = &v23[(void)[v11 pageOffset]];
      CGRect v25 = v22;
    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#PictureBookVC 2 Setting Offset 0", buf, 2u);
      }

      CGRect v25 = [(BKPictureBookViewController *)self pageNavigationViewController];
      double v22 = v25;
      CGRect v24 = 0;
    }
    [v25 setPageOffset:v24];

    [(BKPictureBookViewController *)self updateCurrentReadingPositionViewIfNeeded];
    id v26 = [(BKPictureBookViewController *)self currentPages];
    long long v28 = +[NSNumber numberWithUnsignedInteger:v27];
    [(BKPictureBookViewController *)self _updateWebProcessPluginObject:v28 withParameter:@"BEWebProcessPluginCurrentPageLengthParameterKey"];

    long long v29 = +[NSNumber numberWithUnsignedInteger:v26];
    [(BKPictureBookViewController *)self _updateWebProcessPluginObject:v29 withParameter:@"BEWebProcessPluginCurrentPageLocationParameterKey"];

    long long v30 = +[NSNumber numberWithInteger:[(BKBookViewController *)self pageCountIncludingUpsell]];
    [(BKPictureBookViewController *)self _updateWebProcessPluginObject:v30 withParameter:@"BEWebProcessPluginPageCountParameterKey"];
  }
LABEL_18:
}

- (void)restoreSavedLocation
{
  BOOL v3 = _AECaptureLocationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "#PictureBookVC restoreSavedLocation", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v4 restoreSavedLocation];
  if ([(BKPictureBookViewController *)self savedLocationIsEndOfBook]) {
    [(BKPictureBookViewController *)self setLocation:0];
  }
}

- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v5 didChangeLocationClosing:a3 suspending:a4];
  if ([(BKPictureBookViewController *)self isVisible]) {
    [(BKPictureBookViewController *)self generateSnapshotsForCurrentPages];
  }
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKPictureBookViewController;
  uint64_t v4 = -[BKBookViewController pageLocationForPageNumber:](&v11, "pageLocationForPageNumber:");
  objc_super v5 = (BKPageLocation *)v4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !v4)
  {
    id v6 = [BKPageLocation alloc];
    if (a3) {
      int64_t v7 = a3 - 1;
    }
    else {
      int64_t v7 = 0;
    }
    objc_super v5 = [(BKPageLocation *)v6 initWithOrdinal:v7 andOffset:0];
  }
  id v8 = _AECaptureLocationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithInteger:a3];
    *(_DWORD *)buf = 138412546;
    BOOL v13 = v5;
    __int16 v14 = 2112;
    double v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "#PictureBookVC returning pageLocation:%@ for pageNumber:%@", buf, 0x16u);
  }

  return v5;
}

- (void)setPageCountIncludingUpsell:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setPageCountIncludingUpsell:](&v7, "setPageCountIncludingUpsell:");
  objc_super v5 = [(BKPictureBookViewController *)self pictureBookRenderingCacheIfLoaded];
  [v5 setUpsellPageNumber:[self upsellPageNumber]];

  id v6 = +[NSNumber numberWithInteger:a3];
  [(BKPictureBookViewController *)self _updateWebProcessPluginObject:v6 withParameter:@"BEWebProcessPluginPageCountParameterKey"];
}

- (int64_t)calculatePageCountExcludingUpsell
{
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  id v3 = [(BKBookViewController *)&v7 calculatePageCountExcludingUpsell];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(BKBookViewController *)self book];

    if (v4)
    {
      objc_super v5 = [(BKBookViewController *)self book];
      id v3 = [v5 linearDocumentCount];
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return (int64_t)v3;
}

- (void)setBook:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setBook:](&v9, "setBook:");
  if (a3) {
    [(BKBookViewController *)self createPaginationControllerIfNeeded:1];
  }
  if (![(BKPictureBookViewController *)self showSpreads])
  {
    objc_super v5 = [(BKBookViewController *)self paginationController];
    id v6 = [v5 layoutQueue];
    [v6 waitUntilAllOperationsAreFinished];

    objc_super v7 = [(BKBookViewController *)self paginationController];
    id v8 = [v7 resultsQueue];
    [v8 waitUntilAllOperationsAreFinished];
  }
}

- (void)transitionDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController transitionDidFinish:](&v7, "transitionDidFinish:");
  objc_opt_class();
  objc_super v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
  id v6 = BUDynamicCast();

  [v6 transitionDidFinish:v3];
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BKBookViewController *)self paginationController];

  if (v10)
  {
    [(BKBookViewController *)self clearSelection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v8;
      id v12 = [v11 ordinal];
      BOOL v13 = (char *)[v11 pageOffset];

      __int16 v14 = &v13[(void)v12 + 1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v14 = (char *)[v8 ordinal] + 1;
      }
      else
      {
        double v15 = [(BKBookViewController *)self paginationController];
        __int16 v14 = (char *)[v15 pageNumberForLocation:v8];
      }
    }
    if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      __int16 v14 = (unsigned char *)(&dword_0 + 1);
    }
    uint32_t v16 = _AECaptureLocationLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = +[NSNumber numberWithInteger:v14];
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      CGRect v23 = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "#PictureBookVC jumpToLocation:%@ pageNumber:%@", (uint8_t *)&v20, 0x16u);
    }
    [(BKThumbnailBookViewController *)self turnToPageNumber:v14 animated:v6];
  }
  id v18 = objc_retainBlock(v9);
  double v19 = v18;
  if (v18) {
    (*((void (**)(id))v18 + 2))(v18);
  }
}

- (void)contentViewReady:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v3 contentViewReady:a3];
}

- (id)_stylesheetSetForSnapshot:(id)a3
{
  objc_super v3 = +[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:](ContentViewStyleManager, "getPictureBookUserStyleSheetWithLegacyBook:", [a3 shouldDisableOptimizeSpeed] ^ 1);
  id v4 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
  id v8 = v3;
  objc_super v5 = +[NSArray arrayWithObjects:&v8 count:1];
  id v6 = [v4 initWithMainframeOnlyStylesheets:v5];

  return v6;
}

- (void)finishedSnapshottingForCache:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1458C;
  v6[3] = &unk_1DAB88;
  v6[4] = self;
  objc_super v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_14594;
      v4[3] = &unk_1DADC0;
      objc_super v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    }
  }
}

- (id)webViewForSnapshotting:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  p_snapshotWebView = &self->_snapshotWebView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotWebView);
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    [WeakRetained frame];
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.double width = width;
    v25.size.double height = height;
    if (!CGRectEqualToRect(v24, v25)) {
      [v10 setFrame:CGRectMake(0.0, 0.0, width, height)];
    }
    [v7 fixedLayoutSize];
    +[BEWebViewFactory updateFixedLayoutWebView:fixedLayoutSize:](BEWebViewFactory, "updateFixedLayoutWebView:fixedLayoutSize:", v10);
  }
  else
  {
    id v11 = [v7 bookLanguage];
    id v12 = +[BEContentCleanupJSOptions fixedLayoutOptionsWithLanguage:v11];

    BOOL v13 = +[BECFIUtilitiesJSOptions cfiUtilitiesJSOptionsForBookInfoSnapshot:v7 ordinal:0];
    __int16 v14 = +[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v7, 0, width, height);
    [v7 fixedLayoutSize];
    double v16 = v15;
    double v18 = v17;
    double v19 = [v7 cacheItem];
    int v20 = [(BKPictureBookViewController *)self _stylesheetSetForSnapshot:v7];
    id v10 = +[BEWebViewFactory viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:", v19, v14, v12, v13, v20, 0.0, 0.0, width, height, v16, v18);

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setAutoresizingMask:0];
    id v21 = [(BKPictureBookViewController *)self view];
    [v21 insertSubview:v10 atIndex:0];

    objc_storeWeak((id *)p_snapshotWebView, v10);
  }

  return v10;
}

- (BOOL)wantsBottomToolbar
{
  return (char *)[(BKBookViewController *)self layout] != (char *)&dword_0 + 2;
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3) {
    [(BKPictureBookViewController *)self hideVerticalScrubber];
  }
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v7 setControlsVisible:v5 animated:v4];
}

- (void)bkaxToggleControls:(id)a3
{
  id v4 = a3;
  [(BKBookViewController *)self setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:1];
  [(BKThumbnailBookViewController *)self toggleControls:v4];

  [(BKBookViewController *)self setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:0];
  dispatch_time_t v5 = dispatch_time(0, 500000000);

  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_1DADE0);
}

- (void)presentAppearanceViewControllerFromItem:(id)a3
{
  id v4 = a3;
  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible]) {
    [(BKPictureBookViewController *)self hideVerticalScrubber];
  }
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v5 presentAppearanceViewControllerFromItem:v4];
}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  if (self->super.super._section != a3)
  {
    [(BKPictureBookViewController *)self _cancelCachingAndCleanupSnapshotWebViews];
    if (v7 == 1) {
      [(BKPictureBookViewController *)self hideVerticalScrubber];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v9 setSection:v7 animated:v6 adjustScrollToReveal:v5];
}

- (int64_t)readerType
{
  return 5;
}

- (BOOL)snapshotDuringLiveResize
{
  if (![(BKBookViewController *)self section]) {
    return 1;
  }
  if ([(BKBookViewController *)self section] != 1) {
    return 0;
  }
  objc_super v3 = [(BKThumbnailBookViewController *)self directoryController];
  BOOL v4 = [v3 selectedIndex] != (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)blurSnapshotDuringLiveResize
{
  if ([(BKBookViewController *)self section] != 1) {
    return 0;
  }
  objc_super v3 = [(BKThumbnailBookViewController *)self directoryController];
  BOOL v4 = [v3 selectedIndex] != (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)animateLiveResizeTransitions
{
  if ([(BKBookViewController *)self section] != 1) {
    return 0;
  }
  objc_super v3 = [(BKThumbnailBookViewController *)self directoryController];
  BOOL v4 = [v3 selectedIndex] != (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)aspectFitDuringLiveResize
{
  if (![(BKBookViewController *)self section]) {
    return 1;
  }
  if ([(BKBookViewController *)self section] != 1) {
    return 0;
  }
  objc_super v3 = [(BKThumbnailBookViewController *)self directoryController];
  BOOL v4 = [v3 selectedIndex] == (char *)&dword_0 + 1;

  return v4;
}

- (void)assetViewControllerDidEndLiveResize
{
  v15.receiver = self;
  v15.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v15 assetViewControllerDidEndLiveResize];
  objc_super v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  BOOL v4 = [(BKPictureBookViewController *)self view];
  [v4 bounds];
  [v3 adjustToNewSize:v5, v6];

  if ([(BKBookViewController *)self section] == 1)
  {
    uint64_t v7 = [(BKThumbnailBookViewController *)self directoryController];
    id v8 = [v7 selectedViewController];

    objc_opt_class();
    objc_super v9 = BUDynamicCast();
    id v10 = [(BKPictureBookViewController *)self view];
    [v10 bounds];
    [v9 adjustToNewSize:v11, v12];
  }
  if ([(BKPictureBookViewController *)self pageNavigationIsVertical]) {
    [(BKPictureBookViewController *)self _prewarmThumbnailsForVerticalScrubber];
  }
  dispatch_time_t v13 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14CF4;
  block[3] = &unk_1DAB88;
  block[4] = self;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)assetViewControllerViewForLiveResizeSnapshot
{
  if ([(BKBookViewController *)self section] == 1)
  {
    objc_super v3 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
  }
  else
  {
    BOOL v4 = [(BKPictureBookViewController *)self pageNavigationViewController];
    objc_super v3 = [v4 viewForLiveResize];
  }

  return v3;
}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible]
    || ([v4 velocity], double v6 = v5, objc_msgSend(v4, "velocity"), v6 >= v7))
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    unsigned __int8 v8 = [v4 proposedBeginState];
  }

  return v8;
}

- (void)assetViewControllerWillEnterForeground
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(BKBookViewController *)self contentViewControllers];
  objc_super v3 = [v2 allValues];

  id v4 = (char *)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        unsigned __int8 v8 = BUDynamicCast();
        objc_super v9 = [v8 webView2];
        unsigned int v10 = [v9 be_requiresReload];

        if (v10)
        {
          double v11 = [v8 webView2];
          double v12 = [v11 be_navigationHandler];
          [v12 attemptReload];
        }
        ++v7;
      }
      while (v5 != v7);
      double v5 = (char *)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)updateScrubberUsingTouchbar:(double)a3
{
  int64_t v4 = [(BKBookViewController *)self pageNumberForTouchBarPosition:a3];
  double v5 = [(BKPictureBookViewController *)self currentScrubber];
  [v5 setPageNumber:v4];

  [(BKPictureBookViewController *)self layoutScrubberCallout:0];
}

- (void)touchBarScrollerDidStart:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController touchBarScrollerDidStart:](&v7, "touchBarScrollerDidStart:");
  [(BKBookViewController *)self setControlsVisible:1];
  [(BKPictureBookViewController *)self updateScrubberUsingTouchbar:a3];
  double v5 = [(BKPictureBookViewController *)self currentScrubber];
  uint64_t v6 = [v5 callout];
  [v6 setAlpha:1.0];
}

- (void)touchBarScrollerDidScroll:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController touchBarScrollerDidScroll:](&v5, "touchBarScrollerDidScroll:");
  [(BKPictureBookViewController *)self updateScrubberUsingTouchbar:a3];
}

- (void)touchBarScrollerDidEnd:(double)a3 completion:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v7 touchBarScrollerDidEnd:a4 completion:a3];
  [(BKBookViewController *)self setControlsVisible:0];
  objc_super v5 = [(BKPictureBookViewController *)self currentScrubber];
  uint64_t v6 = [v5 callout];
  [v6 setAlpha:0.0];
}

- (void)infoHUDTapped:(id)a3
{
  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible])
  {
    [(BKPictureBookViewController *)self hideVerticalScrubber];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
    UIAccessibilityNotifications v4 = UIAccessibilityAnnouncementNotification;
    objc_super v5 = AEBundle();
    CFStringRef v6 = @"Dismissed page chooser";
  }
  else
  {
    [(BKPictureBookViewController *)self showVerticalScrubber];
    UIAccessibilityNotifications v7 = UIAccessibilityLayoutChangedNotification;
    unsigned __int8 v8 = [(BKPictureBookViewController *)self verticalScrubber];
    UIAccessibilityPostNotification(v7, v8);

    UIAccessibilityNotifications v4 = UIAccessibilityAnnouncementNotification;
    objc_super v5 = AEBundle();
    CFStringRef v6 = @"Page chooser";
  }
  id v10 = v5;
  objc_super v9 = [v5 localizedStringForKey:v6 value:&stru_1DF0D8 table:0];
  UIAccessibilityPostNotification(v4, v9);
}

- (BOOL)isSpread
{
  objc_super v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    objc_opt_class();
    CFStringRef v6 = [(BKPictureBookViewController *)self pageNavigationViewController];
    UIAccessibilityNotifications v7 = BUDynamicCast();

    unsigned __int8 v8 = [v7 isZoomedToSpread];
  }
  else
  {
    if ((v5 & 1) == 0)
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    objc_super v9 = [(BKPictureBookViewController *)self pageNavigationViewController];
    UIAccessibilityNotifications v7 = BUDynamicCast();

    unsigned __int8 v8 = [v7 shouldDisplaySpread];
  }
  BOOL v10 = v8;

LABEL_7:
  return v10;
}

- (void)books_pageRight:(id)a3
{
  id v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  [v3 turnToNextPage];
}

- (void)books_pageLeft:(id)a3
{
  id v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  [v3 turnToPreviousPage];
}

- (void)books_pageForward:(id)a3
{
  id v4 = a3;
  if ([(BKBookViewController *)self isPageProgressionRTL]) {
    [(BKPictureBookViewController *)self books_pageLeft:v4];
  }
  else {
    [(BKPictureBookViewController *)self books_pageRight:v4];
  }
}

- (void)books_pageBackward:(id)a3
{
  id v4 = a3;
  if ([(BKBookViewController *)self isPageProgressionRTL]) {
    [(BKPictureBookViewController *)self books_pageRight:v4];
  }
  else {
    [(BKPictureBookViewController *)self books_pageLeft:v4];
  }
}

- (void)turnToNextChapter
{
  id v3 = [(BKPictureBookViewController *)self currentPages];
  int64_t v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    UIAccessibilityNotifications v7 = [(BKBookViewController *)self paginationController];
    unsigned __int8 v8 = (char *)[v7 numberOfChapters];

    if (v8)
    {
      if ([(BKPictureBookViewController *)self isSpread])
      {
        objc_super v9 = [(BKBookViewController *)self paginationController];
        id v10 = [v9 pageTotal];

        if (v6 < (unint64_t)v10) {
          ++v6;
        }
      }
      double v11 = [(BKBookViewController *)self paginationController];
      double v12 = (char *)[v11 chapterIndexForPageNumber:v6];

      if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL || v12 >= v8)
      {
        if (v12 != (char *)0x7FFFFFFFFFFFFFFFLL) {
          return;
        }
        long long v15 = [(BKBookViewController *)self paginationController];
        id v14 = [v15 pageRangeForChapterAtIndex:0];

        if (v6 >= (unint64_t)v14) {
          return;
        }
      }
      else
      {
        long long v13 = [(BKBookViewController *)self paginationController];
        id v14 = [v13 pageRangeForChapterAtIndex:v12 + 1];
      }
      [(BKThumbnailBookViewController *)self turnToPageNumber:v14 animated:1];
    }
  }
}

- (void)turnToPreviousChapter
{
  id v3 = [(BKPictureBookViewController *)self currentPages];
  int64_t v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    UIAccessibilityNotifications v7 = [(BKBookViewController *)self paginationController];
    id v8 = [v7 numberOfChapters];

    if (v8)
    {
      objc_super v9 = [(BKBookViewController *)self paginationController];
      id v10 = (char *)[v9 chapterIndexForPageNumber:v6 getFirstChapter:1];

      if (v10)
      {
        if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          double v11 = [(BKBookViewController *)self paginationController];
          id v12 = [v11 pageRangeForChapterAtIndex:0];

          if (v6 >= (unint64_t)v12) {
            return;
          }
          id v13 = &dword_0 + 1;
        }
        else
        {
          long long v16 = [(BKBookViewController *)self paginationController];
          id v13 = [v16 pageRangeForChapterAtIndex:v10 - 1];
        }
      }
      else
      {
        id v14 = [(BKBookViewController *)self paginationController];
        id v15 = [v14 pageRangeForChapterAtIndex:0];

        if (v6 <= (unint64_t)v15) {
          id v13 = &dword_0 + 1;
        }
        else {
          id v13 = v15;
        }
      }
      [(BKThumbnailBookViewController *)self turnToPageNumber:v13 animated:1];
    }
  }
}

- (void)recordedTurnToNextChapter
{
}

- (void)recordedTurnToPreviousChapter
{
}

- (void)contentViewController:(id)a3 navigatePageDirection:(id)a4
{
  id v9 = a4;
  if ([v9 isEqualToString:@"nextChapter"])
  {
    int64_t v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
    unint64_t v6 = (char *)[(BKPictureBookViewController *)self currentPages];
    [(BKPictureBookViewController *)self currentPages];
    id v8 = &v6[v7];
LABEL_5:
    [v5 turnToPageNumber:v8 animated:1];
LABEL_6:

    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"previousChapter"])
  {
    int64_t v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
    id v8 = (char *)[(BKPictureBookViewController *)self currentPages] - 1;
    goto LABEL_5;
  }
  if ([v9 isEqualToString:@"next"])
  {
    int64_t v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
    if ([(BKBookViewController *)self isPageProgressionRTL])
    {
LABEL_12:
      [v5 turnToPreviousPage];
      goto LABEL_6;
    }
LABEL_15:
    [v5 turnToNextPage];
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"previous"])
  {
    int64_t v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
    if (![(BKBookViewController *)self isPageProgressionRTL]) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
LABEL_7:
}

- (id)upsellContentViewController
{
  v22.receiver = self;
  v22.super_class = (Class)BKPictureBookViewController;
  id v3 = [(BKBookViewController *)&v22 upsellContentViewController];
  if (v3)
  {
    uint64_t v4 = [(BKPictureBookViewController *)self viewIfLoaded];

    if (v4)
    {
      int64_t v5 = [(BKBookViewController *)self book];
      unint64_t v6 = [v5 firstDocument];
      [v6 fixedLayoutSize];
      double v8 = v7;
      double v10 = v9;
      double v11 = [(BKPictureBookViewController *)self _thumbnailBookViewConfiguration];
      id v12 = [(BKBookViewController *)self book];
      uint64_t v13 = [v12 hidesSpine] ^ 1;
      id v14 = [(BKPictureBookViewController *)self viewIfLoaded];
      [v14 bounds];
      double v19 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v11, v13, v8, v10, v15, v16, v17, v18);
      [v19 maximumSize];
      [v3 setContentSize:];

      int v20 = +[IMThemePage themeWithIdentifier:kIMThemeIdentifierWhitePageTheme];
      [v3 setTheme:v20];
    }
  }

  return v3;
}

- (void)setTheme:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  [(BKBookViewController *)&v7 setTheme:a3];
  uint64_t v4 = [(BKBookViewController *)self book];

  if (v4)
  {
    int64_t v5 = +[IMTheme themeWithIdentifier:kIMThemeIdentifierWhitePageTheme];
    unint64_t v6 = [(BKPictureBookViewController *)self upsellContentViewController];
    [v6 setTheme:v5];
  }
}

- (id)_bk_backgroundColor
{
  id v3 = +[NSLocale currentLocale];
  uint64_t v4 = [v3 objectForKey:NSLocaleCountryCode];

  int64_t v5 = [v4 lowercaseString];
  unsigned int v6 = [v5 isEqualToString:@"jp"];

  if (v6)
  {
    uint64_t v7 = +[UIColor bc_booksBackground];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BKPictureBookViewController;
    uint64_t v7 = [(BKThumbnailBookViewController *)&v10 _bk_backgroundColor];
  }
  double v8 = (void *)v7;

  return v8;
}

- (BOOL)shouldShowHUDs
{
  v15.receiver = self;
  v15.super_class = (Class)BKPictureBookViewController;
  BOOL v3 = [(BKThumbnailBookViewController *)&v15 shouldShowHUDs];
  uint64_t v4 = [(BKPictureBookViewController *)self viewIfLoaded];
  int64_t v5 = [v4 window];

  if (v5)
  {
    objc_opt_class();
    unsigned int v6 = [(BKPictureBookViewController *)self pageNavigationViewController];
    uint64_t v7 = BUDynamicCast();

    if (v7 && ![(BKBookViewController *)self section])
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v9 = v8 - self->_preferredPageNumberHUDVisibilityChangedTime;
      unsigned __int8 v10 = [v7 preferredPageNumberHUDVisibility];
      if (v9 <= 2.0) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = v10;
      }
      if ([(BKThumbnailBookViewController *)self catalystToolbarActive]
        || [(BKBookViewController *)self controlsVisible])
      {
        BOOL v3 = 1;
      }
      else if ([(BKPictureBookViewController *)self isVerticalScrubberVisible])
      {
        id v12 = [(BKPictureBookViewController *)self verticalScrubber];
        uint64_t v13 = [v12 callout];
        [v13 alpha];
        if (v14 == 0.0) {
          BOOL v3 = 1;
        }
      }
    }
  }
  return v3;
}

- (BOOL)shouldShowBookmarkControl
{
  if ([(BKPictureBookViewController *)self hasContinuousScrollingBehavior]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  return [(BKThumbnailBookViewController *)&v4 shouldShowBookmarkControl];
}

- (BOOL)shouldShowTOCControl
{
  if ([(BKPictureBookViewController *)self hasContinuousScrollingBehavior]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  return [(BKThumbnailBookViewController *)&v4 shouldShowTOCControl];
}

- (BOOL)canOrdinalOnlyLocationsBeVisible
{
  return 1;
}

- (double)_contentAspectRatio
{
  v2 = [(BKBookViewController *)self book];
  BOOL v3 = [v2 firstDocument];
  [v3 fixedLayoutSize];
  double v5 = v4;
  double v7 = v6;

  BOOL v8 = v7 == 0.0 || v5 == 0.0;
  double result = v5 / v7;
  if (v8) {
    return 1.0;
  }
  return result;
}

- (id)_pageDirectory
{
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookViewController;
  BOOL v3 = [(BKThumbnailBookViewController *)&v6 _pageDirectory];
  [v3 setShowSpreads:[self showSpreads]];
  double v4 = [(BKBookViewController *)self book];
  [v3 setHidesSpine:[v4 hidesSpine]];

  return v3;
}

- (id)_bookmarkDirectory
{
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookViewController;
  BOOL v3 = [(BKThumbnailBookViewController *)&v6 _bookmarkDirectory];
  double v4 = [(BKBookViewController *)self book];
  objc_msgSend(v3, "setHidesSpine:", objc_msgSend(v4, "hidesSpine"));

  [v3 setShowSpreads:[self showSpreads]];

  return v3;
}

- (_NSRange)currentPages
{
  v2 = [(BKPictureBookViewController *)self pageNavigationViewController];
  id v3 = [v2 visiblePages];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.id location = v6;
  return result;
}

- (BOOL)pageNavigationIsVertical
{
  objc_opt_class();
  id v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  NSUInteger v4 = BUDynamicCast();

  return v4 != 0;
}

- (id)scrubber
{
  scrubber = self->super._scrubber;
  if (!scrubber)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKPictureBookViewController;
    NSUInteger v4 = [(BKThumbnailBookViewController *)&v8 scrubber];
    [v4 setShowSpreads:[self showSpreads]];
    [(BKPictureBookViewController *)self _contentAspectRatio];
    [v4 setCellAspectRatio:];
    [v4 addTarget:self action:"scrubberTouch:forEvent:" forControlEvents:4095];
    id v5 = [objc_alloc((Class)BKScrubberCalloutView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v5 setShouldDisplayPageInfo:1];
    [v4 setCallout:v5];
    NSUInteger v6 = [(BKPictureBookViewController *)self view];
    [v6 addSubview:v5];

    scrubber = self->super._scrubber;
  }

  return scrubber;
}

- (id)verticalScrubber
{
  verticalScrubber = self->super._verticalScrubber;
  if (!verticalScrubber)
  {
    v14.receiver = self;
    v14.super_class = (Class)BKPictureBookViewController;
    NSUInteger v4 = [(BKThumbnailBookViewController *)&v14 verticalScrubber];
    [v4 setPageCount:[self pageCountExcludingUpsell]];
    id v5 = [v4 layer];
    [v5 setCornerRadius:6.0];

    NSUInteger v6 = [v4 layer];
    [v6 setMasksToBounds:1];

    id v7 = +[UIColor bc_booksTertiaryLabelColor];
    id v8 = [v7 CGColor];
    double v9 = [v4 layer];
    [v9 setShadowColor:v8];

    unsigned __int8 v10 = [v4 layer];
    [v10 setShadowRadius:10.0];

    [v4 addTarget:self action:"scrubberTouch:forEvent:" forControlEvents:4095];
    id v11 = [objc_alloc((Class)BKScrubberCalloutView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v11 setShouldDisplayPageInfo:1];
    [v4 setCallout:v11];
    id v12 = [(BKPictureBookViewController *)self view];
    [v12 addSubview:v11];

    verticalScrubber = self->super._verticalScrubber;
  }

  return verticalScrubber;
}

- (void)_prewarmThumbnailsForVerticalScrubber
{
  if ([(BKPictureBookViewController *)self isViewLoaded]
    && (char *)[(BKBookViewController *)self layout] == (char *)&dword_0 + 2)
  {
    id v4 = [(BKPictureBookViewController *)self verticalScrubber];
    id v3 = [(BKPictureBookViewController *)self view];
    [v3 frame];
    [v4 prewarmThumbnailsForScrubberSize:40.0, CGRectGetHeight(v6)];
  }
}

- (BOOL)_thumbnailShouldTrackWithScrubber
{
  return 1;
}

- (id)currentScrubber
{
  if ([(BKPictureBookViewController *)self shouldUseVerticalScrubber]) {
    [(BKPictureBookViewController *)self verticalScrubber];
  }
  else {
  id v3 = [(BKPictureBookViewController *)self scrubber];
  }

  return v3;
}

- (id)scrubberCallout
{
  v2 = [(BKPictureBookViewController *)self currentScrubber];
  id v3 = [v2 callout];

  return v3;
}

- (void)layoutScrubberCallout:(id)a3
{
  id v103 = a3;
  id v4 = [(BKPictureBookViewController *)self scrubberCallout];
  id v5 = [(BKPictureBookViewController *)self view];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [v4 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
  double v15 = v14;
  double v17 = v16;
  v105.origin.CGFloat x = v7;
  v105.origin.CGFloat y = v9;
  v105.size.double width = v11;
  v105.size.double height = v13;
  double v18 = CGRectGetWidth(v105) + -10.0;
  if (v15 >= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v15;
  }
  if ([(BKPictureBookViewController *)self shouldUseVerticalScrubber])
  {
    int v20 = [(BKPictureBookViewController *)self verticalScrubber];
    id v21 = [v20 superview];
    [v21 bounds];
    CGFloat v22 = CGRectGetWidth(v106) + 16.0;
    CGRect v23 = [(BKPictureBookViewController *)self view];
    [v23 safeAreaInsets];
    double v25 = v22 + v24;

    if (![(BKThumbnailBookViewController *)self isInterfaceRTL])
    {
      v107.origin.CGFloat x = v7;
      v107.origin.CGFloat y = v9;
      v107.size.double width = v11;
      v107.size.double height = v13;
      double MinX = CGRectGetMinX(v107);
      v108.origin.CGFloat x = v7;
      v108.origin.CGFloat y = v9;
      v108.size.double width = v11;
      v108.size.double height = v13;
      double v25 = MinX + round(CGRectGetWidth(v108) - v19 - v25);
    }
    uint64_t v27 = [(BKPictureBookViewController *)self verticalScrubber];
    [v27 frame];
    double MinY = CGRectGetMinY(v109);
  }
  else
  {
    long long v29 = [(BKPictureBookViewController *)self navigationController];
    uint64_t v27 = [v29 toolbar];

    v110.origin.CGFloat x = v7;
    v110.origin.CGFloat y = v9;
    v110.size.double width = v11;
    v110.size.double height = v13;
    double v30 = CGRectGetMinX(v110);
    v111.origin.CGFloat x = v7;
    v111.origin.CGFloat y = v9;
    v111.size.double width = v11;
    v111.size.double height = v13;
    double v25 = v30 + round((CGRectGetWidth(v111) - v19) * 0.5);
    [v27 frame];
    double MinY = CGRectGetMinY(v112) - v17 + -10.0;
  }
  double v31 = v25;
  double v32 = v19;
  double v33 = v17;
  CGRect v113 = CGRectIntegral(*(CGRect *)(&MinY - 1));
  CGFloat y = v113.origin.y;
  CGFloat x = v113.origin.x;
  double width = v113.size.width;
  double height = v113.size.height;

  if (![(BKPictureBookViewController *)self _thumbnailShouldTrackWithScrubber])
  {
    double v70 = y;
    double v71 = x;
    goto LABEL_25;
  }
  double v99 = height;
  double v95 = width;
  double v91 = v19;
  double v92 = v17;
  double v36 = [(BKPictureBookViewController *)self currentScrubber];
  double v37 = [(BKPictureBookViewController *)self view];
  double v38 = [v36 track];
  [v38 bounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v47 = [v36 track];
  [v37 convertRect:v47 fromView:v40];
  CGFloat v97 = v49;
  CGFloat v98 = v48;
  double v51 = v50;
  double v53 = v52;

  if (v103)
  {
    CGFloat v96 = v53;
    CGFloat v94 = v51;
    double v54 = [v103 allTouches];
    double v55 = [v54 anyObject];

    id v56 = [(BKPictureBookViewController *)self view];
    [v55 locationInView:v56];
    double v90 = v57;
    double v59 = v58;

    double height = v99;
    goto LABEL_12;
  }
  double v76 = [(BKBookViewController *)self touchBarController];

  if (v76)
  {
    CGAffineTransform v77 = [(BKPictureBookViewController *)self view];
    [v77 bounds];
    CGFloat v97 = v79;
    CGFloat v98 = v78;
    CGFloat v81 = v80;
    CGFloat v96 = v82;

    char v83 = [(BKBookViewController *)self touchBarController];
    [v83 scrollPosition];
    double v85 = v84;

    if ([(BKPictureBookViewController *)self shouldUseVerticalScrubber])
    {
      [(BKBookViewController *)self pagePositionForTouchBarPosition:v85];
      double v93 = v86;
      double height = v99;
    }
    else
    {
      double height = v99;
      double v93 = v85;
    }
    v120.origin.CGFloat x = v98;
    v120.origin.CGFloat y = v81;
    v120.size.double width = v96;
    v120.size.double height = v97;
    double v90 = v93 * CGRectGetWidth(v120);
    v121.origin.CGFloat x = v98;
    CGFloat v94 = v81;
    v121.origin.CGFloat y = v81;
    v121.size.double width = v96;
    v121.size.double height = v97;
    double v59 = v93 * CGRectGetHeight(v121);
  }
  else
  {
    CGFloat v96 = v53;
    CGFloat v94 = v51;
    double v59 = CGPointZero.y;
    double v90 = CGPointZero.x;
    double height = v99;
  }
  uint64_t v87 = [(BKBookViewController *)self touchBarController];
  if (!v87
    || (CGRect v88 = (void *)v87,
        unsigned int v89 = [(BKPictureBookViewController *)self shouldUseVerticalScrubber],
        v88,
        !v89))
  {
LABEL_12:
    if ([(BKPictureBookViewController *)self shouldUseVerticalScrubber])
    {
      v60 = [(BKPictureBookViewController *)self view];
      [v60 safeAreaInsets];
      double v101 = v61;
      double v63 = v62;

      v114.origin.CGFloat x = v98;
      v114.origin.CGFloat y = v94;
      v114.size.double width = v96;
      v114.size.double height = v97;
      double v64 = CGRectGetMinY(v114);
      v115.origin.CGFloat x = v98;
      v115.origin.CGFloat y = v94;
      v115.size.double width = v96;
      v115.size.double height = v97;
      double v65 = fmax(v64, fmin(CGRectGetMaxY(v115), v59));
      v116.origin.CGFloat x = v7;
      v116.origin.CGFloat y = v9;
      v116.size.double width = v11;
      v116.size.double height = v13;
      CGFloat v66 = CGRectGetMaxY(v116) - v63;
      double height = v99;
      double v67 = v66 + -5.0 - v92;
      double v68 = v101 + 5.0;
      double v69 = v65 - round(v92 * 0.5);
      if (v101 + 5.0 < v69) {
        double v68 = v69;
      }
      if (v67 >= v68) {
        double v70 = v68;
      }
      else {
        double v70 = v67;
      }
      double width = v95;
      double v71 = x;
    }
    else
    {
      v117.origin.CGFloat x = v98;
      v117.origin.CGFloat y = v94;
      v117.size.double width = v96;
      v117.size.double height = v97;
      double v72 = CGRectGetMinX(v117);
      v118.origin.CGFloat x = v98;
      v118.origin.CGFloat y = v94;
      v118.size.double width = v96;
      v118.size.double height = v97;
      double v73 = fmax(v72, fmin(CGRectGetMaxX(v118), v90));
      v119.origin.CGFloat x = v7;
      v119.origin.CGFloat y = v9;
      v119.size.double width = v11;
      v119.size.double height = v13;
      double v74 = CGRectGetMaxX(v119) + -5.0 - v91;
      double v75 = fmax(v73 - round(v91 * 0.5), 5.0);
      if (v74 >= v75) {
        double v71 = v75;
      }
      else {
        double v71 = v74;
      }
      double width = v95;
      double v70 = y;
    }
    goto LABEL_24;
  }
  v122.origin.CGFloat x = v7;
  v122.origin.CGFloat y = v9;
  v122.size.double width = v11;
  v122.size.double height = v13;
  double v70 = CGRectGetMaxY(v122) - v92 + -16.0;
  v123.origin.CGFloat x = v7;
  v123.origin.CGFloat y = v9;
  v123.size.double width = v11;
  v123.size.double height = v13;
  double v71 = CGRectGetMaxX(v123) * 0.5 - v91 * 0.5;
  double width = v95;
LABEL_24:

LABEL_25:
  [v4 setFrame:v71, v70, width, height];
  [v4 setNeedsLayout];
}

- (void)scrubberTouch:(id)a3 forEvent:(id)a4
{
  id v5 = a4;
  if ([(BKPictureBookViewController *)self shouldUseVerticalScrubber])
  {
    double v6 = [v5 allTouches];
    CGFloat v7 = [v6 anyObject];

    double v8 = 0.0;
    if ([v7 phase] != (char *)&dword_0 + 3)
    {
      if ([v7 phase] == &dword_4) {
        double v8 = 0.0;
      }
      else {
        double v8 = 1.0;
      }
    }
  }
  else
  {
    CGFloat v7 = [(BKPictureBookViewController *)self scrubber];
    double v8 = (double)[v7 isTracking];
  }

  CGFloat v9 = [(BKPictureBookViewController *)self scrubberCallout];
  [v9 alpha];
  if (v8 != v10)
  {
    if (v8 == 1.0)
    {
      [v9 setAlpha:1.0];
      [(BKPictureBookViewController *)self showScrim:!UIAccessibilityIsVoiceOverRunning()];
    }
    else
    {
      [v9 alpha];
      if (v11 == 1.0)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_16C44;
        v12[3] = &unk_1DAB88;
        id v13 = v9;
        +[UIView animateWithDuration:4 delay:v12 options:0 animations:0.2 completion:0.3];
        [(BKPictureBookViewController *)self showScrim:0];
      }
    }
  }
  [(BKPictureBookViewController *)self layoutScrubberCallout:v5];
}

- (void)showScrim:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_scrimView)
  {
    if (!a3) {
      goto LABEL_6;
    }
  }
  else
  {
    id v5 = objc_alloc((Class)UIView);
    double v6 = [(BKPictureBookViewController *)self view];
    [v6 bounds];
    CGFloat v7 = [v5 initWithFrame:];
    scrimView = self->_scrimView;
    self->_scrimView = v7;

    CGFloat v9 = +[UIColor colorWithWhite:0.0 alpha:0.15];
    [(UIView *)self->_scrimView setBackgroundColor:v9];

    if (!v3)
    {
LABEL_6:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_16E58;
      v14[3] = &unk_1DAB88;
      v14[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_16EAC;
      _OWORD v13[3] = &unk_1DABD8;
      v13[4] = self;
      +[UIView animateWithDuration:4 delay:v14 options:v13 animations:0.2 completion:0.3];
      return;
    }
  }
  double v10 = [(UIView *)self->_scrimView superview];

  if (v10) {
    goto LABEL_6;
  }
  [(UIView *)self->_scrimView setAlpha:1.0];
  double v11 = [(BKPictureBookViewController *)self view];
  [v11 bounds];
  -[UIView setFrame:](self->_scrimView, "setFrame:");

  id v12 = [(BKPictureBookViewController *)self view];
  [v12 insertSubview:self->_scrimView below:self->super._topToolbar];
}

- (id)thumbnailScrubber:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v21.receiver = self;
  v21.super_class = (Class)BKPictureBookViewController;
  double v10 = -[BKThumbnailBookViewController thumbnailScrubber:thumbnailForPage:size:context:](&v21, "thumbnailScrubber:thumbnailForPage:size:context:", a3, a4, a6);
  if (!v10)
  {
    int64_t v12 = [(BKBookViewController *)self upsellPageNumber];
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v12 == a4)
    {
      if (width == CGSizeZero.width && height == CGSizeZero.height)
      {
        double v10 = 0;
      }
      else
      {
        double v14 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
        double v15 = [(BKBookViewController *)self book];
        thumbnailContext = self->_thumbnailContext;
        [(BKThumbnailBookViewController *)self _containerBoundsForGeometry];
        double v10 = [v14 thumbnailForPage:a4 asset:v15 size:0 renderingCacheCallbackTarget:thumbnailContext renderingCacheCallbackContext:0 priority:width height:height containerBounds:v17 v18 v19 v20];
      }
    }
  }

  return v10;
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  id v5 = [(BKBookViewController *)self book];
  unsigned int v6 = [v5 hasPhysicalPages];

  if (!v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)BKPictureBookViewController;
    int64_t v12 = [(BKBookViewController *)&v14 pageTitleForPageNumber:a3];
    goto LABEL_10;
  }
  CGFloat v7 = [(BKBookViewController *)self book];
  double v8 = [v7 documentWithOrdinal:a3 - 1];

  if (!v8) {
    goto LABEL_8;
  }
  CGFloat v9 = [(BKBookViewController *)self book];
  double v10 = [v9 physicalPageMapForDocument:v8];

  if (![v10 count])
  {

LABEL_8:
    int64_t v12 = &stru_1DF0D8;
    goto LABEL_9;
  }
  double v11 = [v10 lastObject];
  int64_t v12 = [v11 valueForKey:@"name"];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_9:

LABEL_10:

  return v12;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  objc_opt_class();
  id v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
  BUDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  unsigned int v6 = [v11 pageCurlManager];
  CGFloat v7 = [v6 pageCurlConfiguration];
  [v7 invalidate];

  objc_opt_class();
  double v8 = [(BKPictureBookViewController *)self theme];
  CGFloat v9 = BUDynamicCast();
  double v10 = [(BKBookViewController *)self searchViewControllerIfLoaded];
  [v10 setTheme:v9];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  scrubberContainerView = self->_scrubberContainerView;
  if (scrubberContainerView)
  {
    CGFloat v9 = [(UIView *)scrubberContainerView superview];

    if (v9) {
      [(BKPictureBookViewController *)self hideVerticalScrubber];
    }
  }
  double v10 = [(BKPictureBookViewController *)self verticalScrubber];

  if (v10)
  {
    id v11 = [(BKPictureBookViewController *)self verticalScrubber];
    int64_t v12 = [v11 callout];
    [v12 removeFromSuperview];

    [(BKThumbnailBookViewController *)self setVerticalScrubber:0];
  }
  if (![(BKBookViewController *)self inLiveResize]) {
    [(BKPictureBookViewController *)self _prewarmThumbnailsForVerticalScrubber];
  }
  v13.receiver = self;
  v13.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (CGSize)idealCacheSize
{
  BOOL v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 || (v5)
  {
    [(BKThumbnailBookViewController *)self _containerBoundsForGeometry];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v42.origin.CGFloat x = CGRectZero.origin.x;
    v42.origin.CGFloat y = CGRectZero.origin.y;
    v42.size.double width = CGRectZero.size.width;
    v42.size.double height = CGRectZero.size.height;
    v43.origin.CGFloat x = v11;
    v43.origin.CGFloat y = v13;
    v43.size.double width = v15;
    v43.size.double height = v17;
    if (CGRectEqualToRect(v42, v43))
    {
      double v18 = [(BKPictureBookViewController *)self pageNavigationViewController];
      double v19 = [v18 viewIfLoaded];
      [v19 bounds];
      double v11 = v20;
      double v13 = v21;
      double v15 = v22;
      double v17 = v23;
    }
    double v24 = [(BKBookViewController *)self book];
    double v25 = [v24 firstDocument];
    [v25 fixedLayoutSize];
    double v27 = v26;
    double v29 = v28;
    double v30 = [(BKPictureBookViewController *)self _thumbnailBookViewConfiguration];
    double v31 = [(BKBookViewController *)self book];
    unsigned int v6 = +[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v30, [v31 hidesSpine] ^ 1, 1, v27, v29, v11, v13, v15, v17);

    objc_opt_class();
    double v32 = [(BKPictureBookViewController *)self pageNavigationViewController];
    id v7 = BUDynamicCast();

    if (isKindOfClass)
    {
      id v33 = [v7 isZoomedToSpread];
      id v34 = (id)(isPortrait() ^ 1);
      id v35 = v6;
      id v36 = v33;
    }
    else
    {
      id v34 = [v7 shouldDisplaySpread];
      id v35 = v6;
      id v36 = 0;
    }
    [v35 sizeForSpread:v36 landscape:v34];
  }
  else
  {
    unsigned int v6 = [(BKBookViewController *)self book];
    id v7 = [v6 firstDocument];
    [v7 fixedLayoutSize];
  }
  double v37 = v8;
  double v38 = v9;

  double v39 = v37;
  double v40 = v38;
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (void)pageNavigationSnapshotForPageNumber:(int64_t)a3 size:(CGSize)a4 isRight:(BOOL)a5 zoomScale:(double)a6 applyMaskAndGutter:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v14 = a8;
  double v15 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
  [v15 primaryImageSize];
  double v18 = v16;
  double v19 = v17;
  if (height > v17 || width > v16)
  {
    double width = v16;
    double height = v17;
  }
  double v21 = [(BKBookViewController *)self book];
  [(BKThumbnailBookViewController *)self _containerBoundsForGeometry];
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_17748;
  v32[3] = &unk_1DAE08;
  id v33 = v14;
  id v30 = v14;
  [v15 snapshotForBookInfo:v21 pageNumber:a3 size:v9 maxSize:v8 isRight:v32 zoomScale:width height:v18 applyMaskAndGutter:v19 containerBounds:v23 completion:v25];
}

- (void)pageNavigationSnapshotForPageNumber:(int64_t)a3 completion:(id)a4
{
  BOOL v9 = (void (**)(id, void *))a4;
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    BOOL v8 = 0;
  }
  else
  {
    unsigned int v6 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
    id v7 = [(BKBookViewController *)self book];
    [(BKThumbnailBookViewController *)self _containerBoundsForGeometry];
    BOOL v8 = [v6 anySnapshotForBookInfo:v7 pageNumber:a3];
  }
  v9[2](v9, v8);
}

- (void)generateSnapshotsForCurrentPages
{
  id v3 = [(BKPictureBookViewController *)self currentPages];
  uint64_t v5 = v4;
  unsigned int v6 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
  [v6 resetPrioritiesForPageNumber:[self pageNumberFromRange:v3, v5]];

  [(BKPictureBookViewController *)self idealCacheSize];
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = (unint64_t)v3 + v5;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v12 = v11 + 2;
    do
    {
      if ((uint64_t)v11 > [(BKBookViewController *)self pageCountIncludingUpsell]) {
        break;
      }
      double v13 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
      id v14 = [(BKBookViewController *)self book];
      [v13 generateSnapshotWithAsset:v14 size:v11 pageNumber:v8 v10];

      ++v11;
    }
    while (v11 < v12);
  }
  unint64_t v15 = (unint64_t)v3 - 3;
  uint64_t v16 = (uint64_t)v3 - 1;
  if (v16 > v15 && v16 >= 1)
  {
    do
    {
      double v17 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
      double v18 = [(BKBookViewController *)self book];
      [v17 generateSnapshotWithAsset:v18 size:v16 pageNumber:v8];

      if (v16 - 1 <= v15) {
        break;
      }
    }
    while ((unint64_t)v16-- > 1);
  }
}

- (void)generateRenderingPiggyBackForAllPages
{
  unint64_t v3 = [(BKBookViewController *)self pageCountIncludingUpsell];
  if (v3 >= 2)
  {
    unint64_t v4 = v3;
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = 1; i != v4; ++i)
      {
        unsigned int v6 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
        double v7 = [(BKBookViewController *)self book];
        [v6 renderingPiggyBackForPageNumber:i asset:v7 priority:0];
      }
    }
  }
}

- (id)contentViewControllerForLocation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  unint64_t v5 = (unint64_t)[v4 ordinal];
  if (v5 == [(BKBookViewController *)self upsellOrdinal])
  {
    unsigned int v6 = [(BKPictureBookViewController *)self upsellContentViewController];
    goto LABEL_9;
  }
  double v7 = [(BKBookViewController *)self book];
  id v8 = [v7 readingDocumentCount];

  if (v5 < (unint64_t)v8)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      double v9 = [(BKBookViewController *)self book];
      double v10 = [v9 firstDocumentLocation];
      unint64_t v5 = (unint64_t)[v10 ordinal];
    }
    unsigned int v6 = objc_alloc_init(BKPictureBookContentViewController);
    [(BKHTMLContentViewController *)v6 setOrdinal:v5];
    unint64_t v11 = [(BKBookViewController *)self book];
    unint64_t v12 = [v11 documentWithOrdinal:v5];
    [(BKContentViewController *)v6 setDocument:v12];

    double v13 = [(BKBookViewController *)self book];
    [(BKContentViewController *)v6 setBook:v13];

    [(BKContentViewController *)v6 setPageOffset:0];
    [(BKContentViewController *)v6 setSelectionHighlightType:0];
  }
  else
  {
LABEL_8:
    unsigned int v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)contentSubType
{
  return +[BAContentSubType fixedLayout];
}

- (CGSize)thumbnailingContentSizeForPageNumber:(int64_t)a3
{
  id v4 = [(BKBookViewController *)self book];
  [v4 fixedLayoutSizeForDocumentWithOrdinal:a3 - 1];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)thumbnailingGenerateImageForPageNumber:(int64_t)a3 callbackBlock:(id)a4
{
  id v6 = a4;
  double v7 = [(BKPictureBookViewController *)self pictureBookRenderingCache];
  double v8 = [(BKBookViewController *)self book];
  double v9 = [v7 generateMasterImageForPageNumber:a3 asset:v8 priority:8 callbackBlock:v6];

  return v9;
}

- (void)thumbnailingGenerateImageForPageNumber:(int64_t)a3 size:(CGSize)a4 callbackBlock:(id)a5
{
}

- (BKImageResizerHelper)imageResizer
{
  imageResizer = self->_imageResizer;
  if (!imageResizer)
  {
    id v4 = objc_alloc_init(BKImageResizerHelper);
    double v5 = self->_imageResizer;
    self->_imageResizer = v4;

    imageResizer = self->_imageResizer;
  }

  return imageResizer;
}

- (id)resizeImage:(id)a3 toSize:(CGSize)a4 callback:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  unint64_t v11 = [(BKPictureBookViewController *)self imageResizer];
  unint64_t v12 = [v11 resizeImage:v10 toSize:v9 callback:width, height];

  return v12;
}

- (void)contentView:(id)a3 unhandledClickAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  double v7 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([(BKPictureBookViewController *)self isVerticalScrubberVisible]) {
      goto LABEL_6;
    }
LABEL_8:
    [(BKThumbnailBookViewController *)self toggleControls:self];
    goto LABEL_9;
  }
  double v8 = [(BKPictureBookViewController *)self pageNavigationViewController];
  id v9 = [v11 view];
  unsigned int v10 = [v8 hasMediaElementAtPoint:v9 inView:x, y];

  if (!v10)
  {
    [v8 curlPageForReadAloud:0];

    if ([(BKPictureBookViewController *)self isVerticalScrubberVisible]) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }

  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible]) {
LABEL_6:
  }
    [(BKPictureBookViewController *)self hideVerticalScrubber];
LABEL_9:
}

- (id)_prepareSmilMapOn:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = +[NSMutableArray arrayWithCapacity:1];
  uint64_t v23 = self;
  int64_t v7 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", location, length);
  if (length)
  {
    uint64_t v8 = 0;
    int64_t v22 = v7 - 1;
    do
    {
      id v9 = [(BKBookViewController *)v23 book];
      uint64_t v25 = v8;
      uint64_t v10 = v22 + v8;
      id v11 = [v9 documentWithOrdinal:v22 + v8];

      uint64_t v24 = v11;
      unint64_t v12 = [v11 mediaOverlayElements];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            id v18 = objc_alloc((Class)NSDictionary);
            double v19 = +[NSNumber numberWithInteger:v10];
            id v20 = [v18 initWithObjectsAndKeys:v17, @"smil", v19, @"ordinal", 0];

            [v6 addObject:v20];
          }
          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v14);
      }

      uint64_t v8 = v25 + 1;
    }
    while (v25 + 1 != length);
  }

  return v6;
}

- (void)_installClickHandlers:(id)a3
{
  if (self->super.super._isReading)
  {
    id v3 = a3;
    objc_opt_class();
    BUDynamicCast();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      id v4 = [v6 document];
      double v5 = [v4 mediaOverlayElements];

      [v6 installReadAloudClickHandlersOnMediaOverlayElements:v5];
    }
  }
}

- (void)_removeClickHandlers:(id)a3
{
  if (!self->super.super._isReading)
  {
    id v3 = a3;
    objc_opt_class();
    BUDynamicCast();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      id v4 = [v6 document];
      double v5 = [v4 mediaOverlayElements];

      [v6 removeReadAloudClickHandlersOnMediaOverlayElements:v5];
    }
  }
}

- (void)_markupDocumentElementForMediaOverlay:(id)a3
{
  if (self->super.super._isReading)
  {
    id v3 = a3;
    objc_opt_class();
    BUDynamicCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v5;
    if (v5)
    {
      [v5 markupDocumentForMediaOverlay];
      id v4 = v5;
    }
  }
}

- (void)_cleanDocumentElementForMediaOverlay:(id)a3
{
  if (!self->super.super._isReading)
  {
    id v3 = a3;
    objc_opt_class();
    BUDynamicCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v5;
    if (v5)
    {
      [v5 cleanDocumentForMediaOverlay];
      id v4 = v5;
    }
  }
}

- (BOOL)shouldShowNextPagePageButtonsHint
{
  return self->_shouldShowNextPagePageButtonsHint;
}

- (BOOL)pageNavigationController:(id)a3 shouldDelayChangeToPageOffset:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    uint64_t v8 = [(BKPictureBookViewController *)self pageNavigationViewController];
    id v9 = BUDynamicCast();

    [v9 pageSize];
    double v11 = v10;
    double v13 = v12;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_184AC;
    v15[3] = &unk_1DAE08;
    id v16 = v7;
    -[BKPictureBookViewController thumbnailingGenerateImageForPageNumber:size:callbackBlock:](self, "thumbnailingGenerateImageForPageNumber:size:callbackBlock:", a4 + 1, v15, v11, v13);
  }
  return a4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)pageNavigationDidChangeLocation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookViewController;
  [(BKThumbnailBookViewController *)&v3 pageNavigationDidChangeLocation:a3];
}

- (void)_nextPageHint:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v9;
    id v6 = [(BKPictureBookViewController *)self currentPages];
    [(BKPictureBookViewController *)self currentPages];
    uint64_t v8 = (uint64_t)v6 + v7;
    if (v8 <= [(BKBookViewController *)self pageCountIncludingUpsell])
    {
      if (v3 && [v5 isZoomedToSinglePage]) {
        [v5 turnToPageNumber:v8 - 1 animated:1];
      }
      [v5 curlPageForReadAloud:v3];
    }
  }

  _objc_release_x1();
}

- (BOOL)_isManualCurlInProgress
{
  v2 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = [v2 isManualCurlInProgress];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)_focusOnPage:(int64_t)a3
{
  id v5 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    if ([v4 isZoomedToSinglePage]
      && ([v4 isManualCurlInProgress] & 1) == 0)
    {
      [v4 turnToPageNumber:a3 animated:1];
    }
  }
  else
  {
    [v5 turnToPageNumber:a3 animated:1];
  }
}

- (BOOL)_isFocusedOnSecondPageOfSpread
{
  unsigned __int8 v3 = [(BKPictureBookViewController *)self pageNavigationViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 isZoomedToSinglePage])
  {
    unsigned __int8 v4 = [v3 isZoomedToRightPage];
    if ([(BKViewController *)self layoutDirection] || (v4 & 1) == 0)
    {
      char v7 = v4 ^ 1;
      if ((char *)[(BKViewController *)self layoutDirection] == (char *)&dword_0 + 1) {
        BOOL v5 = v7;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)_itemIndexForCurrentPage
{
  id v3 = [(BKPictureBookViewController *)self currentPages];
  id v5 = v4;
  if (v4)
  {
    id v6 = v3;
    if (v4 == (unsigned char *)&dword_0 + 1
      || [(BKPictureBookViewController *)self _isFocusedOnSecondPageOfSpread])
    {
      smilMap = self->super.super._smilMap;
      self->super.super._smilMap = 0;

      -[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", v6, v5);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v14 = [v13 objectForKey:@"ordinal" v16];
            if (v6 == (id)(int)[v14 intValue])
            {
              id v5 = [v8 indexOfObject:v13];

              goto LABEL_14;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      id v5 = 0;
LABEL_14:
    }
    else
    {
      return 0;
    }
  }
  return (unint64_t)v5;
}

- (id)currentSoundtrack
{
  if (self->super.super._pageNavigationViewController
    && (id v3 = [(BKPictureBookViewController *)self currentPages],
        int64_t v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4),
        v5 != 0x7FFFFFFFFFFFFFFFLL)
    && (int64_t v6 = v5, [(BKPictureBookViewController *)self currentPages], v7))
  {
    unint64_t v8 = 0;
    while (1)
    {
      id v9 = [(BKThumbnailBookViewController *)self existingContentViewControllerForPageNumber:v6 + v8];
      id v10 = [v9 pathForSoundtrack];

      if (v10) {
        break;
      }
      ++v8;
      [(BKPictureBookViewController *)self currentPages];
      if (v8 >= v11) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    id v10 = 0;
  }

  return v10;
}

- (void)pictureBookVerticalNavigationInteractionDidStart:(int64_t)a3
{
  if ([(BKPictureBookViewController *)self isVerticalScrubberVisible])
  {
    if (a3 == 1)
    {
      [(BKPictureBookViewController *)self hideVerticalScrubberAndResetZoomScale:0];
    }
    else
    {
      [(BKPictureBookViewController *)self hideVerticalScrubber];
    }
  }
}

- (void)pictureBookVerticalNavigationpreferredPageNumberHUDVisibilityChanged:(BOOL)a3
{
  if (!a3)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_preferredPageNumberHUDVisibilityChangedTime = v4;
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_updateHUDVisibility" object:0];
  if (![(BKBookViewController *)self controlsVisible])
  {
    if (![(BKPictureBookViewController *)self isVerticalScrubberVisible]) {
      goto LABEL_7;
    }
    int64_t v5 = [(BKPictureBookViewController *)self verticalScrubber];
    int64_t v6 = [v5 callout];
    [v6 alpha];
    double v8 = v7;

    if (v8 != 0.0)
    {
LABEL_7:
      [(BKPictureBookViewController *)self performSelector:"_updateHUDVisibility" withObject:0 afterDelay:2.0];
    }
  }
}

- (CGRect)desiredBoundsForNavigationController
{
  v2 = [(BKPictureBookViewController *)self viewIfLoaded];
  id v3 = v2;
  if (v2)
  {
    [v2 bounds];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)supportsSpreadForVerticalLayout
{
  return ![(BKPictureBookViewController *)self hasContinuousScrollingBehavior];
}

- (BOOL)hasContinuousScrollingBehavior
{
  BOOL v2 = [(BKPictureBookViewController *)self _bookRenditionFlowIsScrolledContinuous];
  if (v2)
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"BKReadingScrolledContinuous"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_updateHUDVisibility
{
}

- (void)_updateWebProcessPluginObject:(id)a3 withParameter:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = [(BKBookViewController *)self contentViewControllers];
  double v8 = [v7 allValues];

  id v9 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    double v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        double v13 = BUDynamicCast();
        double v14 = v13;
        if (v13)
        {
          double v15 = [v13 webView2];
          long long v16 = [v14 webView2];
          long long v17 = [v16 be_updateAXValueForMessage:v18];
          [v15 be_updateAXCurrentReadingStateWithMessage:v6 forValue:v17];
        }
        ++v12;
      }
      while (v10 != v12);
      double v10 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

- (UIScreenEdgePanGestureRecognizer)edgePanGestureRecognizer
{
  return self->_edgePanGestureRecognizer;
}

- (void)setEdgePanGestureRecognizer:(id)a3
{
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (void)setScrubberContainerView:(id)a3
{
}

- (void)setCurrentReadingPositionView:(id)a3
{
}

- (void)setVerticalScrubberAnimator:(id)a3
{
}

- (void)setShouldShowNextPagePageButtonsHint:(BOOL)a3
{
  self->_shouldShowNextPagePageButtonsHint = a3;
}

- (void)setImageResizer:(id)a3
{
}

- (WKWebView)snapshotWebView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotWebView);

  return (WKWebView *)WeakRetained;
}

- (void)setSnapshotWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotWebView);
  objc_storeStrong((id *)&self->_imageResizer, 0);
  objc_storeStrong((id *)&self->_verticalScrubberAnimator, 0);
  objc_storeStrong((id *)&self->_currentReadingPositionView, 0);
  objc_storeStrong((id *)&self->_scrubberContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);

  objc_storeStrong((id *)&self->_thumbnailContext, 0);
}

- (void)_performScrollTest:(id)a3 completionHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  objc_opt_class();
  double v7 = [(BKPictureBookViewController *)self pageNavigationViewController];
  double v8 = BUDynamicCast();

  id v9 = [v8 scrollView];
  if (v9)
  {
    id v10 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v12 scrollView:v9 completionHandler:v6];
    +[RPTTestRunner runTestWithParameters:v10];
  }
  else
  {
    id v11 = objc_retainBlock(v6);
    id v10 = v11;
    if (v11) {
      (*((void (**)(id))v11 + 2))(v11);
    }
  }
}

@end