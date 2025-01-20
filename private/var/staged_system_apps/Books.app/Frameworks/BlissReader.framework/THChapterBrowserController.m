@interface THChapterBrowserController
- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4;
- (BOOL)animatesPageDuringTransition;
- (BOOL)chapterViewController:(id)a3 followLink:(id)a4;
- (BOOL)closeButtonIsNeeded;
- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4;
- (BOOL)followLink:(id)a3;
- (BOOL)followLink:(id)a3 animated:(BOOL)a4;
- (BOOL)freeTransformController:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)freeTransformControllerShouldFadeShadowOut:(id)a3;
- (BOOL)freeTransformControllerShouldUseEffectsWindow:(id)a3;
- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasIntroPage;
- (BOOL)introMediaControllerIsActive;
- (BOOL)introMediaControllerIsOffscreen;
- (BOOL)isPinchingDownFromCanvas;
- (BOOL)navigationBarIsTranslucent:(id)a3;
- (BOOL)p_hasPageScrubberControl;
- (BOOL)p_isTOCLandscape;
- (BOOL)p_showingIntroMedia;
- (BOOL)p_verticalSpaceLimited;
- (BOOL)paginatedTOCShowsStatusBar;
- (BOOL)passthroughView:(id)a3 shouldAcceptHitAtPoint:(CGPoint)a4 onView:(id)a5 withEvent:(id)a6;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (BOOL)statusBarShouldBeHidden;
- (BOOL)thumbnailWasTapped:(id)a3 atPoint:(CGPoint)a4 forLong:(BOOL)a5;
- (BOOL)transitioningPageToDVC;
- (CGPoint)p_offsetForThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4;
- (CGRect)frameForChapterViewController:(id)a3;
- (CGRect)frameForChapterViewController:(id)a3 withSize:(CGSize)a4;
- (CGRect)frameForPageThumbAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4;
- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3;
- (CGRect)originalCanvasScrollViewFrame;
- (CGRect)p_beginTransitionFromPageThumbnail:(id)a3 transformView:(id)a4 freeTransform:(BOOL)a5 firstThumbNailToTransition:(BOOL)a6;
- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5;
- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 inLayer:(id)a4;
- (CGSize)cachedFrameSize;
- (CGSize)curtainSizeForFreeTransformController:(id)a3;
- (CGSize)firstThumbOverlap;
- (CGSize)firstThumbSize;
- (CGSize)thumbSize;
- (NSArray)thumbnailSubviews;
- (NSMutableArray)thumbnailViewsInTransition;
- (NSMutableSet)contentNodesAskedToLoad;
- (NSMutableSet)thumbnailsHiddenForPinch;
- (THChapterBrowserController)initWithNibName:(id)a3 bundle:(id)a4 bookPropertiesDelegate:(id)a5 delegate:(id)a6;
- (THChapterBrowserScrubbablePageControl)chapterPageControl;
- (THChapterViewController)chapterViewController;
- (THScrollView)backgroundScrollView;
- (THScrollViewWithPassthrough)pagesScrollView;
- (THiOSIntroMediaViewController)introMediaViewController;
- (TSWPassThroughView)bottomWrapperView;
- (UIColor)pageAreaBackgroundColor;
- (UITapGestureRecognizer)showToolbarRecognizer;
- (UIView)backgroundsView;
- (UIView)chapterPageControlWrapper;
- (UIView)originalCanvasScrollViewSuperview;
- (UIView)thumbnailTrackBackgroundView;
- (UIView)wrapperView;
- (_NSRange)p_chapterRelativePageIndexesCurrentlyVisibleInRect:(CGRect)a3 forChapterFrame:(CGRect)a4 chapterPageCount:(unint64_t)a5;
- (double)chapterWidth;
- (double)p_pagesScrollViewNextChapterThreshhold;
- (double)p_updateChapterWidths;
- (double)thumbScale;
- (id).cxx_construct;
- (id)backgroundColorForNavigationBar:(id)a3;
- (id)chapterViewController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)curtainColorForFreeTransformController:(id)a3;
- (id)documentRootForChapterViewController:(id)a3;
- (id)foregroundTintColorForNavigationBar:(id)a3;
- (id)nextChapterViewController;
- (id)p_pageThumbnailViewForModelLink:(id)a3;
- (id)p_pageThumbnailViewForPageIndex:(unint64_t)a3;
- (id)p_thumbShownForChapter:(unint64_t)a3 index:(unint64_t)a4;
- (id)p_tintAndTitleColor;
- (id)presentingViewControllerForChapterViewController:(id)a3;
- (id)previousChapterViewController;
- (id)thumbnailImageForPageAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 tinyThumb:(BOOL)a5;
- (id)titleColorForNavigationBar:(id)a3;
- (id)transitionContentView;
- (id)unmovingParentViewForFreeTransformController:(id)a3;
- (id)viewToShroud;
- (id)visibleThumbnailIndexes;
- (int)p_chapterIndexForCurrentScrollPosition;
- (int64_t)maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag;
- (int64_t)maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag;
- (unint64_t)chapterIndex;
- (unint64_t)p_firstVisibleThumbnailPageIndexInCurrentChapter;
- (unint64_t)previousChapterIndex;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)supportedInterfaceOrientationsForChapterViewController:(id)a3;
- (unint64_t)transitioningThumbnailIndex;
- (void)_configurePagesScrollView;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateContentOffsets;
- (void)chapterViewController:(id)a3 displayPageForModelLink:(id)a4;
- (void)chapterViewControllerWasTapped:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didRotateFromFlowInPortraitLockedBook;
- (void)didTransitionFromCanvas;
- (void)draggingStartedFromPageControl:(id)a3;
- (void)flushThumbnails;
- (void)freeTransformControllerDidBegin:(id)a3;
- (void)freeTransformControllerDidContinue:(id)a3 withScale:(double)a4;
- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4;
- (void)freeTransformControllerWillBeginCompletionAnimation:(id)a3 passedThreshold:(BOOL)a4;
- (void)freeTransformControllerWillEnd:(id)a3 passedThreshold:(BOOL)a4;
- (void)hideBackground;
- (void)hidePageThumbnailAtIndex:(unint64_t)a3;
- (void)hidePageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 scrollIfNecessary:(BOOL)a5;
- (void)introMediaControllerMoviePlayerWillHideControls;
- (void)introMediaControllerMoviePlayerWillShowControls;
- (void)introMediaControllerShouldAdvancePast:(id)a3;
- (void)p_addIntroMediaView;
- (void)p_adjustViewsForSize:(CGSize)a3;
- (void)p_animationDidStopForThumbnailView:(id)a3;
- (void)p_backgroundScrollingDidEnd;
- (void)p_cancelAllContentNodeLoading;
- (void)p_cleanupAfterTransitionFromPageThumbnail:(id)a3;
- (void)p_clearChapterViewAtIndex:(unint64_t)a3;
- (void)p_configureThumbCaps;
- (void)p_configureThumbCapsForSize:(CGSize)a3 updateImmediately:(BOOL)a4;
- (void)p_configureThumbsAndUpdateLayout:(BOOL)a3;
- (void)p_fixupChapterViewFrames;
- (void)p_highlightThumbTargetsIfShouldInThumb:(id)a3 atPoint:(CGPoint)a4 coverFullThumb:(BOOL)a5;
- (void)p_pageThumbScrollingDidEnd;
- (void)p_preloadContentNodesForVisibleThumbnails;
- (void)p_recoverFromFastScrollingDesynchronization;
- (void)p_releaseOutlets;
- (void)p_removeAdjacentChapterViews;
- (void)p_removeIntroMediaView;
- (void)p_resetPagesScrollViewAndCapThumbCount:(BOOL)a3 firstVisibleRelativePage:(unint64_t)a4 resetContentOffset:(BOOL)a5;
- (void)p_scrollPageScrollViewToOffset:(CGPoint)a3;
- (void)p_scrollToThumbnailAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)p_setChapterIndex:(unint64_t)a3 forScrub:(BOOL)a4 stillScrolling:(BOOL)a5;
- (void)p_setupChapterViewControllerAtIndex:(unint64_t)a3 withChapterIndex:(unint64_t)a4 allowThumbnail:(BOOL)a5;
- (void)p_setupNextChapterView;
- (void)p_setupPreviousChapterView;
- (void)p_startIntroMediaIfNecessary;
- (void)p_thumbnailAnimationDidStopWithContext:(id)a3;
- (void)p_transitionFromPageThumbnail:(id)a3 destinationRect:(CGRect)a4 shouldShroud:(BOOL)a5;
- (void)p_transitionThumbnailToDVC:(id)a3;
- (void)p_updateAdjacentChapterViews;
- (void)p_updateBottomWrapperFrame;
- (void)p_updateChapterBackgroundsView;
- (void)p_updatePageAreaBackgroundFrame;
- (void)p_updatePageControl;
- (void)p_updatePageScrubberControlForSizeClassChange;
- (void)p_updatePageScrubberFrame;
- (void)p_updatePageThumbnails:(BOOL)a3;
- (void)p_updatePagesScrollView;
- (void)p_updateThumbLayout;
- (void)prepareToScrollToThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4;
- (void)relinquishIntroMediaViewController;
- (void)scrollToContentOffset:(CGPoint)a3;
- (void)scrollToThumbnailAtIndex:(unint64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setBackgroundScrollView:(id)a3;
- (void)setBackgroundsView:(id)a3;
- (void)setBottomWrapperView:(id)a3;
- (void)setCachedFrameSize:(CGSize)a3;
- (void)setChapterIndex:(unint64_t)a3;
- (void)setChapterPageControl:(id)a3;
- (void)setChapterPageControlWrapper:(id)a3;
- (void)setChapterWidth:(double)a3;
- (void)setContentNodesAskedToLoad:(id)a3;
- (void)setHasIntroPage:(BOOL)a3;
- (void)setIntroMediaViewController:(id)a3;
- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4;
- (void)setIsPinchingDownFromCanvas:(BOOL)a3;
- (void)setMaximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag:(int64_t)a3;
- (void)setMaximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag:(int64_t)a3;
- (void)setOriginalCanvasScrollViewFrame:(CGRect)a3;
- (void)setOriginalCanvasScrollViewSuperview:(id)a3;
- (void)setPageAreaBackgroundColor:(id)a3;
- (void)setPagesScrollView:(id)a3;
- (void)setPreviousChapterIndex:(unint64_t)a3;
- (void)setShowToolbarRecognizer:(id)a3;
- (void)setThumbScale:(double)a3;
- (void)setThumbnailTrackBackgroundView:(id)a3;
- (void)setThumbnailViewsInTransition:(id)a3;
- (void)setThumbnailsHiddenForPinch:(id)a3;
- (void)setTransitioningPageToDVC:(BOOL)a3;
- (void)setTransitioningThumbnailIndex:(unint64_t)a3;
- (void)setWrapperView:(id)a3;
- (void)showBackground;
- (void)showPageThumbnailAtIndex:(unint64_t)a3;
- (void)takeChapterIndexFrom:(id)a3;
- (void)takeDragInsideFromPageControl:(id)a3;
- (void)takeTouchUpFromPageControl:(id)a3;
- (void)tapToShowToolbarGesture:(id)a3;
- (void)thumbnailWasPressed:(id)a3 atPoint:(CGPoint)a4 forLong:(BOOL)a5;
- (void)transitionPageToDVC:(unint64_t)a3 chapterIndex:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionFromChapterIndex:(unint64_t)a3;
@end

@implementation THChapterBrowserController

- (THChapterBrowserController)initWithNibName:(id)a3 bundle:(id)a4 bookPropertiesDelegate:(id)a5 delegate:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = THBundle();
  v19.receiver = self;
  v19.super_class = (Class)THChapterBrowserController;
  v11 = [(THTOCViewController *)&v19 initWithNibName:@"THChapterBrowserController" bundle:v10 bookPropertiesDelegate:v8 delegate:v9];

  if (v11)
  {
    [(THChapterBrowserController *)v11 p_configureThumbsAndUpdateLayout:0];
    [(THChapterBrowserController *)v11 setPreviousChapterIndex:0x7FFFFFFFFFFFFFFFLL];
    v11->mChapterIndex = 0;
    v11->mPreservedThumbnailOffset = CGPointZero;
    v12 = +[NSMutableSet set];
    [(THChapterBrowserController *)v11 setThumbnailsHiddenForPinch:v12];

    v13 = +[NSMutableSet set];
    [(THChapterBrowserController *)v11 setContentNodesAskedToLoad:v13];

    v11->mCBCIsOnscreen = 0;
    v11->mDeferPagesScrollViewScrolls = 0;
    v11->mDeferBackgroundScrollViewScrolls = 0;
    v14 = [(THChapterBrowserController *)v11 bottomWrapperView];
    [v14 setAcceptsHits:0];

    v11->mDidPurgeIntroMediaController = 0;
    v11->mDidAutoHideToolbar = 0;
    v15 = +[NSMutableArray array];
    [(THChapterBrowserController *)v11 setThumbnailViewsInTransition:v15];

    bzero(&v11->_flags, 1uLL);
    v16 = +[UITraitCollection bc_allAPITraits];
    id v17 = [(THChapterBrowserController *)v11 registerForTraitChanges:v16 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v11;
}

- (void)p_releaseOutlets
{
  [(UIView *)self->_thumbnailTrackBackgroundView removeFromSuperview];
  thumbnailTrackBackgroundView = self->_thumbnailTrackBackgroundView;
  self->_thumbnailTrackBackgroundView = 0;

  v4 = [(THChapterBrowserController *)self pagesScrollView];
  [v4 setDelegate:0];

  v5 = [(THChapterBrowserController *)self backgroundScrollView];
  [v5 setDelegate:0];

  mWrapperView = self->mWrapperView;
  self->mWrapperView = 0;

  mBackgroundScrollView = self->mBackgroundScrollView;
  self->mBackgroundScrollView = 0;

  id v8 = [(THChapterBrowserController *)self thumbnailSubviews];
  [v8 makeObjectsPerformSelector:"teardown"];

  id v9 = [(THChapterBrowserController *)self introMediaViewController];
  [v9 setDelegate:0];

  mIntroMediaContainerView = self->mIntroMediaContainerView;
  self->mIntroMediaContainerView = 0;

  uint64_t v11 = 0;
  mChapterViewControllers = self->mChapterViewControllers;
  do
  {
    v13 = mChapterViewControllers[v11];
    if (v13)
    {
      [(THChapterViewController *)v13 teardown];
      v14 = mChapterViewControllers[v11];
      mChapterViewControllers[v11] = 0;
    }
    ++v11;
  }
  while (v11 != 3);
  mIntroMediaViewController = self->mIntroMediaViewController;
  self->mIntroMediaViewController = 0;

  self->mDidPurgeIntroMediaController = 1;
  mBackgroundsView = self->mBackgroundsView;
  self->mBackgroundsView = 0;

  mPagesScrollView = self->mPagesScrollView;
  self->mPagesScrollView = 0;

  mChapterPageControl = self->mChapterPageControl;
  self->mChapterPageControl = 0;

  mChapterPageControlWrapper = self->mChapterPageControlWrapper;
  self->mChapterPageControlWrapper = 0;

  mBottomWrapperView = self->mBottomWrapperView;
  self->mBottomWrapperView = 0;

  mPageAreaBackground = self->mPageAreaBackground;
  self->mPageAreaBackground = 0;

  [(THChapterBrowserController *)self setContentNodesAskedToLoad:0];
  [(THChapterBrowserController *)self setPageAreaBackgroundColor:0];
  [(THChapterBrowserController *)self setThumbnailViewsInTransition:0];
  [(THChapterBrowserController *)self setShowToolbarRecognizer:0];

  [(THChapterBrowserController *)self setThumbnailsHiddenForPinch:0];
}

- (void)dealloc
{
  [(THChapterBrowserController *)self p_releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserController;
  [(THTOCViewController *)&v3 dealloc];
}

- (void)p_updateThumbLayout
{
  unint64_t v3 = [(THChapterBrowserController *)self p_firstVisibleThumbnailPageIndexInCurrentChapter];
  [(THChapterBrowserController *)self flushThumbnails];
  [(THChapterBrowserController *)self p_updateChapterWidths];
  [(THChapterBrowserController *)self p_configureThumbCaps];
  unint64_t mChapterIndex = self->mChapterIndex;
  self->unint64_t mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(THChapterBrowserController *)self setChapterIndex:mChapterIndex];
  [(THChapterBrowserController *)self p_offsetForThumbnailAtIndex:v3 chapterIndex:self->mChapterIndex];

  -[THChapterBrowserController p_scrollPageScrollViewToOffset:](self, "p_scrollPageScrollViewToOffset:");
}

- (void)p_configureThumbsAndUpdateLayout:(BOOL)a3
{
  v5 = [(THTOCViewController *)self delegate];
  if ([v5 isCompactWidthForChapterBrowserController:self])
  {
    double v15 = 0.85;
  }
  else
  {
    v6 = [(THTOCViewController *)self delegate];
    unsigned int v7 = [v6 isCompactHeightForChapterBrowserController:self];
    double v8 = 0.85;
    if (!v7) {
      double v8 = 1.0;
    }
    double v15 = v8;
  }
  [(THChapterBrowserController *)self thumbScale];
  if (vabdd_f64(v9, v15) >= 0.00999999978)
  {
    [(THChapterBrowserController *)self setThumbScale:v15];
    int32x2_t v10 = vdup_n_s32([(THChapterBrowserController *)self p_isTOCLandscape]);
    v11.i64[0] = v10.u32[0];
    v11.i64[1] = v10.u32[1];
    int8x16_t v12 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v11, 0x3FuLL));
    self->_thumbSize = (CGSize)vrndaq_f64(vmulq_n_f64((float64x2_t)vbslq_s8(v12, (int8x16_t)xmmword_3443A0, (int8x16_t)xmmword_344390), v15));
    CGSize v13 = (CGSize)vrndaq_f64(vmulq_n_f64((float64x2_t)vbslq_s8(v12, (int8x16_t)xmmword_3443C0, (int8x16_t)xmmword_3443B0), v15));
    self->_firstThumbSize = v13;
    CGFloat v14 = self->_firstThumbSize.height - self->_thumbSize.height;
    self->_firstThumbOverlap.width = v13.width - self->_thumbSize.width;
    self->_firstThumbOverlap.height = v14;
    if (a3)
    {
      [(THChapterBrowserController *)self p_updateThumbLayout];
    }
  }
}

- (void)p_configureThumbCaps
{
  id v5 = [(THChapterBrowserController *)self view];
  [v5 frame];
  -[THChapterBrowserController p_configureThumbCapsForSize:updateImmediately:](self, "p_configureThumbCapsForSize:updateImmediately:", 0, v3, v4);
}

- (void)p_configureThumbCapsForSize:(CGSize)a3 updateImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  [(THChapterBrowserController *)self thumbSize];
  *(float *)&double v7 = width / v7;
  uint64_t v8 = (uint64_t)(float)(ceilf(*(float *)&v7) + 3.0);
  [(THChapterBrowserController *)self setMaximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag:v8];
  [(THChapterBrowserController *)self setMaximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag:v8];

  [(THChapterBrowserController *)self p_updatePageThumbnails:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v11 viewWillAppear:a3];
  if ([(THChapterBrowserController *)self isViewLoaded]
    && self->mChapterIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = [(THTOCViewController *)self dataSource];
    id v5 = [v4 toc:self numberOfTilesInDivision:0];

    [(THChapterBrowserController *)self chapterWidth];
    double v7 = v6 * (double)(unint64_t)v5;
    [(THScrollView *)self->mBackgroundScrollView bounds];
    -[THScrollView setContentSize:](self->mBackgroundScrollView, "setContentSize:", v7, v8);
    ++self->mSuspendThumbViewUpdates;
    if (![(THChapterBrowserController *)self introMediaControllerIsActive])
    {
      double mChapterIndex = (double)self->mChapterIndex;
      [(THChapterBrowserController *)self chapterWidth];
      -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v10 * mChapterIndex, 0.0);
    }
    [(THChapterBrowserController *)self p_updatePagesScrollView];
    --self->mSuspendThumbViewUpdates;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v25 viewDidAppear:a3];
  [(THChapterBrowserController *)self p_updatePageScrubberControlForSizeClassChange];
  [(THChapterBrowserController *)self _configurePagesScrollView];
  BOOL v4 = [(THTOCViewController *)self delegate];
  [v4 setupDVCForTOCController:self];

  +[CATransaction begin];
  self->mDeferPagesScrollViewScrolls = 1;
  if ([(THChapterBrowserController *)self isViewLoaded])
  {
    unint64_t mChapterIndex = self->mChapterIndex;
    if (mChapterIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:1 withChapterIndex:mChapterIndex allowThumbnail:self->mIsPinchingDownFromCanvas];
      [(THChapterBrowserController *)self p_fixupChapterViewFrames];
      [(THChapterBrowserController *)self p_updateChapterBackgroundsView];
      [(THChapterBrowserController *)self p_updatePageControl];
      if (self->mDidPurgeIntroMediaController)
      {
        double v6 = [(THChapterBrowserController *)self introMediaViewController];

        if (!v6)
        {
          double v7 = [(THTOCViewController *)self delegate];
          double v8 = [v7 introMediaViewControllerForChapterBrowserController:self];
          [(THChapterBrowserController *)self setIntroMediaViewController:v8 showIt:0];

          self->mDidPurgeIntroMediaController = 0;
        }
      }
    }
  }
  [(THChapterBrowserController *)self p_configureThumbCaps];
  if (!self->mChapterViewControllers[1])
  {
    double v9 = +[TSUAssertionHandler currentHandler];
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController viewDidAppear:]");
    objc_super v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:367 description:@"The current chapter view should not be nil."];
  }
  [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:0 firstVisibleRelativePage:0 resetContentOffset:0];
  if (!self->mChapterViewControllers[1])
  {
    int8x16_t v12 = +[TSUAssertionHandler currentHandler];
    CGSize v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController viewDidAppear:]");
    CGFloat v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v12 handleFailureInFunction:v13, v14, 375, @"The current chapter view is nil, likely caused by memory issues." file lineNumber description];

    [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:1 withChapterIndex:self->mChapterIndex allowThumbnail:self->mIsPinchingDownFromCanvas];
  }
  if (!self->mDeferExtendedLayout) {
    [(THChapterBrowserController *)self p_updateAdjacentChapterViews];
  }
  double v15 = [(THChapterBrowserController *)self thumbnailSubviews];
  [v15 makeObjectsPerformSelector:"updateFreeTransformUnmovingParentView"];

  self->mDeferPagesScrollViewScrolls = 0;
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v17 = v16;
  double v18 = 0.0;
  if (v17 <= 0.0) {
    [(THScrollView *)self->mBackgroundScrollView contentOffset];
  }
  double v19 = -v18;
  [(THChapterBrowserController *)self chapterWidth];
  if (vabdd_f64(v19, v20) >= 0.00999999978) {
    [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setAlpha:1.0];
  }
  if (!self->mIsPinchingDownFromCanvas)
  {
    v21 = [(THTOCViewController *)self delegate];
    [v21 chapterBrowserController:self updateTitleForChapterIndex:self->mChapterIndex];
  }
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
  if (v23 == self->mPreservedThumbnailOffset.x && v22 == self->mPreservedThumbnailOffset.y) {
    [(THChapterBrowserController *)self p_updatePageThumbnails:1];
  }
  else {
    -[THChapterBrowserController p_scrollPageScrollViewToOffset:](self, "p_scrollPageScrollViewToOffset:");
  }
  self->mCBCIsOnscreen = 1;
  self->mIgnoringThumbnailTaps = 0;
  self->mBackgroundSwipeDidInitiateScroll = 0;
  self->mBackgroundSwipeBeginningChapter = 0;
  +[CATransaction commit];
  v24 = [(THTOCViewController *)self delegate];
  [v24 tocIsReadyToPresent:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v5 viewWillDisappear:a3];
  BOOL v4 = [(THChapterBrowserController *)self introMediaViewController];
  [v4 stop];

  self->mDeferPagesScrollViewScrolls = 1;
}

- (void)didReceiveMemoryWarning
{
  v7.receiver = self;
  v7.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v7 didReceiveMemoryWarning];
  if (!self->mCBCIsOnscreen)
  {
    [(THChapterViewController *)self->mChapterViewControllers[1] viewWillDisappear:0];
    double v3 = [(THChapterViewController *)self->mChapterViewControllers[1] view];
    [v3 removeFromSuperview];

    [(THChapterViewController *)self->mChapterViewControllers[1] viewDidDisappear:0];
    [(THChapterViewController *)self->mChapterViewControllers[1] teardown];
    BOOL v4 = self->mChapterViewControllers[1];
    self->mChapterViewControllers[1] = 0;

    objc_super v5 = [(THChapterBrowserController *)self thumbnailSubviews];
    [v5 makeObjectsPerformSelector:"teardown"];
    [v5 makeObjectsPerformSelector:"removeFromSuperview"];
  }
  v6.receiver = self;
  v6.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v6 didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v4 viewDidDisappear:a3];
  self->mCBCIsOnscreen = 0;
  self->mIsPinchingDownFromCanvas = 0;
  [(THChapterBrowserController *)self p_removeAdjacentChapterViews];
}

- (BOOL)p_hasPageScrubberControl
{
  return ![(THChapterBrowserController *)self p_verticalSpaceLimited];
}

- (void)p_updateBottomWrapperFrame
{
  unsigned int v3 = [(THChapterBrowserController *)self p_hasPageScrubberControl];
  [(TSWPassThroughView *)self->mBottomWrapperView frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (v3)
  {
    [(UIView *)self->mChapterPageControlWrapper frame];
    double v10 = CGRectGetMinY(v15) - v9;
  }
  else
  {
    objc_super v11 = [(THChapterBrowserController *)self view];
    [v11 bounds];
    double v10 = v12 - v9;
  }
  mBottomWrapperView = self->mBottomWrapperView;

  -[TSWPassThroughView setFrame:](mBottomWrapperView, "setFrame:", v5, v10, v7, v9);
}

- (void)p_updatePageAreaBackgroundFrame
{
  unsigned int v3 = [(THChapterBrowserController *)self p_hasPageScrubberControl];
  [(UIView *)self->mPageAreaBackground frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (v3)
  {
    [(UIView *)self->mChapterPageControlWrapper frame];
    double MinY = CGRectGetMinY(v15);
  }
  else
  {
    objc_super v11 = [(THChapterBrowserController *)self view];
    [v11 bounds];
    double MinY = v12;
  }
  mPageAreaBackground = self->mPageAreaBackground;

  -[UIView setFrame:](mPageAreaBackground, "setFrame:", v5, v7, v9, MinY);
}

- (void)p_updatePageScrubberFrame
{
  unsigned int v3 = [(THChapterBrowserController *)self im_isCompactWidth];
  double v4 = [(THChapterBrowserController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v7 = [(THChapterBrowserController *)self view];
  [v7 safeAreaInsets];
  double v9 = v8;

  double v10 = [(THChapterBrowserController *)self view];
  [v10 bounds];
  double v12 = v11;

  CGSize v13 = [(THChapterBrowserController *)self view];
  [v13 safeAreaInsets];
  double v14 = v6 + -48.0 - v9;
  double v16 = v15 + 48.0;

  -[UIView setFrame:](self->mChapterPageControlWrapper, "setFrame:", 0.0, v14, v12, v16);
  double v17 = [(THChapterBrowserController *)self view];
  [v17 frame];
  if (v3) {
    double v19 = 32.0;
  }
  else {
    double v19 = 77.0;
  }
  double v20 = v18 + v19 * -2.0;

  mChapterPageControl = self->mChapterPageControl;

  -[THChapterBrowserScrubbablePageControl setFrame:](mChapterPageControl, "setFrame:", v19, 0.0, v20, v16);
}

- (void)p_updatePageScrubberControlForSizeClassChange
{
  if ([(THChapterBrowserController *)self p_hasPageScrubberControl])
  {
    [(THChapterBrowserController *)self p_updatePageScrubberFrame];
    [(THChapterBrowserController *)self p_updatePageControl];
    unsigned int v3 = [(UIView *)self->mChapterPageControlWrapper superview];

    if (!v3) {
      [(UIView *)self->mWrapperView addSubview:self->mChapterPageControlWrapper];
    }
  }
  else
  {
    double v4 = [(UIView *)self->mChapterPageControlWrapper superview];

    if (v4) {
      [(UIView *)self->mChapterPageControlWrapper removeFromSuperview];
    }
  }
  [(THChapterBrowserController *)self p_updateBottomWrapperFrame];

  [(THChapterBrowserController *)self p_updatePageAreaBackgroundFrame];
}

- (void)tapToShowToolbarGesture:(id)a3
{
  if (![(THChapterBrowserController *)self introMediaControllerIsActive])
  {
    [(THChapterBrowserController *)self chapterViewControllerWasTapped:0];
  }
}

- (void)_configurePagesScrollView
{
  if (isPhone())
  {
    if ([(THChapterBrowserController *)self p_verticalSpaceLimited])
    {
      [(TSWPassThroughView *)self->mBottomWrapperView frame];
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      id v38 = [(THChapterBrowserController *)self view];
      [v38 frame];
      double MaxY = CGRectGetMaxY(v46);
      [(TSWPassThroughView *)self->mBottomWrapperView frame];
      double Height = CGRectGetHeight(v47);
      double v11 = [(THChapterBrowserController *)self view];
      [v11 safeAreaInsets];
      double v13 = MaxY - Height + -8.0 - v12;

      -[TSWPassThroughView setFrame:](self->mBottomWrapperView, "setFrame:", v4, v13, v6, v8);
      id v39 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
      [v39 frame];
      double v15 = v14;
      CGFloat v17 = v16;
      double v19 = v18;

      double v20 = self->_firstThumbSize.height;
      id v40 = [(THChapterBrowserController *)self view];
      [v40 safeAreaInsets];
      double v22 = v21;

      id v41 = [(THChapterBrowserController *)self view];
      [v41 bounds];
      double v23 = CGRectGetMaxY(v48);
      CGFloat v24 = v20 + 16.0 + v22;
      v49.origin.x = v15;
      v49.origin.y = v17;
      v49.size.double width = v19;
      v49.size.height = v24;
      double v25 = v23 - CGRectGetHeight(v49);

      id v42 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
      [v42 setFrame:v15, v25, v19, v24];

      id v43 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
      v26 = [v43 layer];
      LODWORD(v27) = 1.0;
      [v26 setOpacity:v27];
    }
    else
    {
      id v44 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
      v28 = [v44 layer];
      [v28 setOpacity:0.0];

      [(TSWPassThroughView *)self->mBottomWrapperView frame];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      [(UIView *)self->mChapterPageControlWrapper frame];
      double MinY = CGRectGetMinY(v50);
      [(TSWPassThroughView *)self->mBottomWrapperView frame];
      double v36 = CGRectGetHeight(v51);
      mBottomWrapperView = self->mBottomWrapperView;
      -[TSWPassThroughView setFrame:](mBottomWrapperView, "setFrame:", v30, MinY - v36, v32, v34);
    }
  }
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)THChapterBrowserController;
  [(THChapterBrowserController *)&v48 viewDidLoad];
  double v5 = [(THChapterBrowserController *)self view];
  [(THChapterBrowserController *)self setShowToolbarRecognizer:0];
  double v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapToShowToolbarGesture:"];
  showToolbarRecognizer = self->_showToolbarRecognizer;
  self->_showToolbarRecognizer = v6;

  [(UITapGestureRecognizer *)self->_showToolbarRecognizer setCancelsTouchesInView:1];
  [(UITapGestureRecognizer *)self->_showToolbarRecognizer setDelegate:self];
  [v5 addGestureRecognizer:self->_showToolbarRecognizer];
  [v5 setAutoresizingMask:18];
  [v5 bounds];
  double x = v49.origin.x;
  double y = v49.origin.y;
  double width = v49.size.width;
  double height = v49.size.height;
  double v12 = CGRectGetHeight(v49);
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  double v13 = CGRectGetWidth(v50);
  -[THChapterBrowserController setChapterWidth:](self, "setChapterWidth:");
  if ([(THChapterBrowserController *)self p_isTOCLandscape]) {
    double v14 = 141.0;
  }
  else {
    double v14 = 189.0;
  }
  -[TSWPassThroughView setFrame:](self->mBottomWrapperView, "setFrame:", 0.0, v12 - v14, v13, v14);
  -[THScrollViewWithPassthrough setFrame:](self->mPagesScrollView, "setFrame:", 0.0, 0.0, v13, v14);
  -[UIView setFrame:](self->mWrapperView, "setFrame:", x, y, width, height);
  -[UIView setFrame:](self->mBackgroundsView, "setFrame:", -v13, 0.0, v13 * 3.0, v12);
  double v15 = +[UIColor clearColor];
  [(THScrollViewWithPassthrough *)self->mPagesScrollView setBackgroundColor:v15];

  double v16 = [(THChapterBrowserController *)self pageAreaBackgroundColor];
  [(UIView *)self->mPageAreaBackground setBackgroundColor:v16];

  [(THScrollViewWithPassthrough *)self->mPagesScrollView setContentInsetAdjustmentBehavior:1];
  [(THScrollView *)self->mBackgroundScrollView setPreventBounceAnimation:1];
  [(THScrollView *)self->mBackgroundScrollView setDelaysContentTouches:0];
  [(THScrollView *)self->mBackgroundScrollView setContentInsetAdjustmentBehavior:2];
  [(THChapterBrowserController *)self showBackground];
  [(THChapterBrowserController *)self setEdgesForExtendedLayout:15];
  [(THChapterBrowserController *)self setExtendedLayoutIncludesOpaqueBars:1];
  self->mDeferExtendedLayout = 0;
  id v17 = objc_alloc((Class)UIView);
  [(THChapterBrowserController *)self chapterWidth];
  double v19 = v18;
  [(THChapterBrowserController *)self chapterWidth];
  double v21 = [v17 initWithFrame:-v19, 0.0, v20, v12];
  mIntroMediaContainerView = self->mIntroMediaContainerView;
  self->mIntroMediaContainerView = v21;

  double v23 = +[UIColor blackColor];
  [(UIView *)self->mIntroMediaContainerView setBackgroundColor:v23];

  [(UIView *)self->mIntroMediaContainerView setClipsToBounds:1];
  CGFloat v24 = -[THChapterBrowserScrubbablePageControl initWithFrame:]([THChapterBrowserScrubbablePageControl alloc], "initWithFrame:", 77.0, 0.0, v13 + -154.0, 48.0);
  mChapterPageControl = self->mChapterPageControl;
  self->mChapterPageControl = v24;

  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setAutoresizingMask:0];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl addTarget:self action:"draggingStartedFromPageControl:" forControlEvents:1];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl addTarget:self action:"takeDragInsideFromPageControl:" forControlEvents:4];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl addTarget:self action:"takeTouchUpFromPageControl:" forControlEvents:64];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl addTarget:self action:"takeTouchUpFromPageControl:" forControlEvents:128];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl addTarget:self action:"takeChapterIndexFrom:" forControlEvents:4096];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setExclusiveTouch:1];
  v26 = [(THTOCViewController *)self delegate];
  double v27 = [v26 introMediaViewControllerForChapterBrowserController:self];
  if (v27)
  {
    v2 = [(THTOCViewController *)self delegate];
    double v3 = [v2 introMediaViewControllerForChapterBrowserController:self];
    id v28 = [v3 isMovie];
  }
  else
  {
    id v28 = 0;
  }
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setFirstDotSpecialRendering:v28];
  if (v27)
  {
  }
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl frame];
  double v30 = v29;
  [v5 safeAreaInsets];
  double v32 = v31;
  [v5 safeAreaInsets];
  double v34 = (UIView *)[objc_alloc((Class)UIView) initWithFrame:0.0, v12 + -48.0 - v32, v13, v30 + v33];
  mChapterPageControlWrapper = self->mChapterPageControlWrapper;
  self->mChapterPageControlWrapper = v34;

  double v36 = +[UIColor blackColor];
  [(UIView *)self->mChapterPageControlWrapper setBackgroundColor:v36];

  [(UIView *)self->mChapterPageControlWrapper addSubview:self->mChapterPageControl];
  if (isPhone())
  {
    v37 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    thumbnailTrackBackgroundView = self->_thumbnailTrackBackgroundView;
    self->_thumbnailTrackBackgroundView = v37;

    id v39 = [(THTOCViewController *)self delegate];
    id v40 = [v39 TOCViewControllerToolbarBackgroundColor:self];
    id v41 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
    [v41 setBackgroundColor:v40];

    id v42 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
    [v42 setAutoresizingMask:10];

    id v43 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
    id v44 = [v43 layer];
    LODWORD(v45) = 1.0;
    [v44 setOpacity:v45];

    mBackgroundScrollView = self->mBackgroundScrollView;
    CGRect v47 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
    [(THScrollView *)mBackgroundScrollView addSubview:v47];
  }
}

- (BOOL)prefersStatusBarHidden
{
  unsigned __int8 v3 = [(THChapterBrowserController *)self introMediaControllerIsActive];
  return ![(THChapterBrowserController *)self paginatedTOCShowsStatusBar] | v3;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  if ([(THChapterBrowserController *)self p_showingIntroMedia])
  {
    unsigned __int8 v3 = [(THChapterBrowserController *)self introMediaViewController];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = [(THTOCViewController *)self delegate];
  unsigned __int8 v3 = [v2 isToolbarHidden];

  return v3;
}

- (void)relinquishIntroMediaViewController
{
  [(THChapterBrowserController *)self setIntroMediaViewController:0];
  self->mDeferBackgroundScrollViewScrolls = 1;
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  -[THScrollView setContentInset:](self->mBackgroundScrollView, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
  -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v4, v6);
  self->mDeferBackgroundScrollViewScrolls = 0;
}

- (void)setIntroMediaViewController:(id)a3
{
  double v5 = (THiOSIntroMediaViewController *)a3;
  p_mIntroMediaViewController = &self->mIntroMediaViewController;
  mIntroMediaViewController = self->mIntroMediaViewController;
  double v9 = v5;
  if (mIntroMediaViewController != v5)
  {
    double v8 = [(THiOSIntroMediaViewController *)mIntroMediaViewController delegate];

    if (v8 == self) {
      [(THiOSIntroMediaViewController *)*p_mIntroMediaViewController setDelegate:0];
    }
    objc_storeStrong((id *)&self->mIntroMediaViewController, a3);
    [(THiOSIntroMediaViewController *)*p_mIntroMediaViewController setDelegate:self];
  }
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  BOOL v4 = a4;
  id v29 = a3;
  if (!v29)
  {
    double v6 = +[TSUAssertionHandler currentHandler];
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController setIntroMediaViewController:showIt:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:719 description:@"use relinquishIntroMediaViewController instead"];
  }
  [(THChapterBrowserController *)self loadViewIfNeeded];
  [(THScrollView *)self->mBackgroundScrollView addSubview:self->mIntroMediaContainerView];
  [(THChapterBrowserController *)self setIntroMediaViewController:v29];
  self->mDeferBackgroundScrollViewScrolls = 1;
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v10 = v9;
  double v12 = v11;
  [(THChapterBrowserController *)self chapterWidth];
  -[THScrollView setContentInset:](self->mBackgroundScrollView, "setContentInset:", 0.0, v13, 0.0, 0.0);
  -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v10, v12);
  self->mDeferBackgroundScrollViewScrolls = 0;
  [(THChapterBrowserController *)self setHasIntroPage:1];
  if (v4 || [(THChapterBrowserController *)self chapterIndex] <= 1)
  {
    [(UIView *)self->mIntroMediaContainerView bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = [(THChapterBrowserController *)self introMediaViewController];
    double v23 = [v22 view];
    [v23 setFrame:v15, v17, v19, v21];

    CGFloat v24 = [(THChapterBrowserController *)self introMediaViewController];
    [(THChapterBrowserController *)self addChildViewController:v24];

    mIntroMediaContainerView = self->mIntroMediaContainerView;
    v26 = [(THChapterBrowserController *)self introMediaViewController];
    double v27 = [v26 view];
    [(UIView *)mIntroMediaContainerView addSubview:v27];

    if (v4)
    {
      [(THChapterBrowserController *)self chapterWidth];
      -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", -v28, 0.0);
      [(UIView *)self->mChapterPageControlWrapper setAlpha:0.0];
    }
  }
}

- (void)willTransitionFromChapterIndex:(unint64_t)a3
{
  self->mIsPinchingDownFromCanvas = 1;
  self->mDeferExtendedLayout = 1;
  if (self->mChapterIndex != a3)
  {
    [(THChapterBrowserController *)self setChapterIndex:a3];
    [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:1 withChapterIndex:a3 allowThumbnail:1];
    [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:0 firstVisibleRelativePage:0 resetContentOffset:1];
  }
  [(THChapterBrowserController *)self chapterWidth];
  double v6 = v5 * (double)a3;
  mBackgroundScrollView = self->mBackgroundScrollView;

  -[THScrollView setContentOffset:](mBackgroundScrollView, "setContentOffset:", v6, 0.0);
}

- (void)didTransitionFromCanvas
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A56B8;
  block[3] = &unk_458C38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  self->mIsPinchingDownFromCanvas = 0;
  double v3 = [(THTOCViewController *)self delegate];
  [v3 chapterBrowserController:self updateTitleForChapterIndex:self->mChapterIndex];
}

- (id)thumbnailImageForPageAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 tinyThumb:(BOOL)a5
{
  if (a5)
  {
    TSUScreenScale();
    BOOL v9 = v8 <= 1.0;
  }
  else
  {
    BOOL v9 = 0;
  }
  if (self->mChapterIndex != a4)
  {
    double v12 = 0;
    goto LABEL_16;
  }
  double v10 = [(THTOCViewController *)self delegate];
  double v11 = [v10 chapterBrowserController:self tocTileModelAtIndex:a4];

  if (v9) {
    [v11 tinyThumbs];
  }
  else {
  double v13 = [v11 largerThumbs];
  }
  if ((unint64_t)[v13 count] <= a3)
  {
    double v14 = 0;
LABEL_14:
    double v12 = 0;
    goto LABEL_15;
  }
  double v14 = [v13 objectAtIndex:a3];
  if (!v14) {
    goto LABEL_14;
  }
  double v15 = CGImageRetain((CGImageRef)+[TSDBitmapImageProvider CGImageForImageData:v14]);
  if (!v15) {
    goto LABEL_14;
  }
  double v12 = +[UIImage imageWithCGImage:v15];
  CGImageRelease(v15);
LABEL_15:

LABEL_16:

  return v12;
}

- (void)hidePageThumbnailAtIndex:(unint64_t)a3
{
}

- (CGPoint)p_offsetForThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  if (self->mChapterIndex != a4)
  {
    double v7 = +[TSUAssertionHandler currentHandler];
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController p_offsetForThumbnailAtIndex:chapterIndex:]");
    BOOL v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:816 description:@"Current chapter index %lu doesn't match page chapter index:%lu" self->mChapterIndex, a4];
  }
  [(THChapterBrowserController *)self frameForPageThumbAtIndex:a3 chapterIndex:a4];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView bounds];
  v51.origin.double x = v11;
  v51.origin.double y = v13;
  v51.size.double width = v15;
  v51.size.double height = v17;
  BOOL v18 = CGRectContainsRect(v44, v51);
  [(THChapterBrowserController *)self thumbSize];
  double v20 = v19;
  [(THChapterBrowserController *)self firstThumbOverlap];
  double v22 = v21;
  [(THChapterBrowserController *)self firstThumbSize];
  double v24 = v23;
  unint64_t v25 = self->mChapterInfo[1].numberOfPages - 1;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView frame];
  float v27 = v26;
  float v28 = v24 + (double)v25 * v20;
  if (v28 < v27)
  {
LABEL_4:
    [(THChapterBrowserController *)self frameForPageThumbAtIndex:0 chapterIndex:a4];
    double MinX = CGRectGetMinX(v45);
LABEL_16:
    double v33 = 0.0;
    goto LABEL_17;
  }
  float v30 = v15 * (double)(v25 - a3);
  double v31 = v22 + (double)a3 * v15;
  float v32 = v31;
  if (!v18)
  {
    float v42 = v31;
    float v37 = v27 * 0.5 - v15 * 0.5;
    if (v30 > v37)
    {
      v47.origin.double x = v11;
      v47.origin.double y = v13;
      v47.size.double width = v15;
      v47.size.double height = v17;
      double MinX = CGRectGetMinX(v47);
      if (v42 > v37) {
        double MinX = v15 * 0.5 + MinX + (float)(v27 * -0.5);
      }
      goto LABEL_16;
    }
    v48.origin.double x = v11;
    v48.origin.double y = v13;
    v48.size.double width = v15;
    v48.size.double height = v17;
    double v38 = CGRectGetMinX(v48);
    [(THScrollViewWithPassthrough *)self->mPagesScrollView frame];
    double v40 = v39;
    v49.origin.double x = v11;
    v49.origin.double y = v13;
    v49.size.double width = v15;
    v49.size.double height = v17;
    if (CGRectGetMinX(v49) < v42) {
      goto LABEL_4;
    }
    double v36 = v15 + v38 - v40;
LABEL_15:
    float v41 = v36;
    double MinX = v41;
    goto LABEL_16;
  }
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
  if (v30 == 0.0)
  {
    v46.origin.double x = v11;
    v46.origin.double y = v13;
    v46.size.double width = v15;
    v46.size.double height = v17;
    double MaxX = CGRectGetMaxX(v46);
    [(THScrollViewWithPassthrough *)self->mPagesScrollView frame];
    double v36 = MaxX - v35;
    goto LABEL_15;
  }
  if (v32 == 0.0)
  {
    v50.origin.double x = v11;
    v50.origin.double y = v13;
    v50.size.double width = v15;
    v50.size.double height = v17;
    double v36 = CGRectGetMinX(v50);
    goto LABEL_15;
  }
LABEL_17:
  result.double y = v33;
  result.double x = MinX;
  return result;
}

- (void)prepareToScrollToThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  [(THChapterBrowserController *)self p_offsetForThumbnailAtIndex:a3 chapterIndex:a4];
  self->mPreservedThumbnailOffset.double x = v5;
  self->mPreservedThumbnailOffset.double y = v6;
}

- (void)hidePageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 scrollIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->mChapterIndex != a4)
  {
    id v14 = +[TSUAssertionHandler currentHandler];
    BOOL v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController hidePageThumbnailAtIndex:chapterIndex:scrollIfNecessary:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v14 handleFailureInFunction:v9 file:v10 lineNumber:922 description:@"Current chapter index %lu doesn't match page chapter index:%lu" self->mChapterIndex, a4];
  }
  if (v5) {
    [(THChapterBrowserController *)self prepareToScrollToThumbnailAtIndex:a3 chapterIndex:a4];
  }
  id v15 = [(THChapterBrowserController *)self thumbnailsHiddenForPinch];
  CGFloat v11 = +[NSNumber numberWithUnsignedInteger:a3];
  [v15 addObject:v11];

  id v16 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3];
  if (v16) {
    [v16 setHidden:1];
  }
  if (a3 >= 2)
  {
    double v12 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3 - 1];
    [v12 setHasRightBorder:1];
  }
  CGFloat v13 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3 + 1];
  [v13 setHasLeftBorder:1];
}

- (void)showPageThumbnailAtIndex:(unint64_t)a3
{
  BOOL v5 = [(THChapterBrowserController *)self thumbnailsHiddenForPinch];
  [v5 removeAllObjects];

  CGFloat v6 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3];
  [v6 setHidden:0];
  [v6 setBorderVisible:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_A5F54;
  v10[3] = &unk_458C38;
  id v7 = v6;
  id v11 = v7;
  +[UIView animateWithDuration:v10 animations:0.15];
  if (a3 >= 2)
  {
    double v8 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3 - 1];
    [v8 setHasRightBorder:0];
  }
  BOOL v9 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3 + 1];
  [v9 setHasLeftBorder:0];
}

- (void)scrollToThumbnailAtIndex:(unint64_t)a3
{
}

- (void)p_scrollToThumbnailAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(THChapterBrowserController *)self p_offsetForThumbnailAtIndex:a3 chapterIndex:self->mChapterIndex];
  -[THScrollViewWithPassthrough setContentOffset:animated:](self->mPagesScrollView, "setContentOffset:animated:", v4);
  if (!v4)
  {
    [(THChapterBrowserController *)self p_updatePageThumbnails:1];
  }
}

- (void)p_scrollPageScrollViewToOffset:(CGPoint)a3
{
  if (a3.x > 0.0) {
    -[THScrollViewWithPassthrough setContentOffset:animated:](self->mPagesScrollView, "setContentOffset:animated:", 0);
  }
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 inLayer:(id)a4
{
  [(THChapterBrowserController *)self rectForPageThumbnailAtIndex:a3 chapterIndex:self->mChapterIndex inLayer:a4];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5
{
  id v7 = a5;
  [(THChapterBrowserController *)self p_updatePageScrubberControlForSizeClassChange];
  double v8 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3];
  if (v8)
  {
    BOOL v9 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    BOOL v18 = [(THScrollViewWithPassthrough *)self->mPagesScrollView layer];
    [v7 convertRect:v18 fromLayer:v11, v13, v15, v17];
    double v20 = v19;
    CGFloat y = v21;
    CGFloat width = v23;
    CGFloat height = v25;

    [v7 bounds];
    v36.origin.double x = v20;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    if (!CGRectContainsRect(v34, v36))
    {
      [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
      double x = self->mPreservedThumbnailOffset.x;
      if (vabdd_f64(v28, x) > 1.0)
      {
        [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
        double v20 = v20 - (x - v29);
      }
    }
  }
  else
  {
    double v20 = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v30 = v20;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.double x = v30;
  return result;
}

- (unint64_t)p_firstVisibleThumbnailPageIndexInCurrentChapter
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v3 = [(THChapterBrowserController *)self thumbnailSubviews];
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v7 chapterIndex] == self->mChapterIndex)
        {
          [(THScrollViewWithPassthrough *)self->mPagesScrollView bounds];
          CGFloat v9 = v8;
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          [v7 frame];
          v28.origin.double x = v16;
          v28.origin.CGFloat y = v17;
          v28.size.CGFloat width = v18;
          v28.size.CGFloat height = v19;
          v27.origin.double x = v9;
          v27.origin.CGFloat y = v11;
          v27.size.CGFloat width = v13;
          v27.size.CGFloat height = v15;
          if (CGRectIntersectsRect(v27, v28))
          {
            id v20 = [v7 pageIndex];
            goto LABEL_12;
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_12:

  return (unint64_t)v20;
}

- (id)visibleThumbnailIndexes
{
  double v3 = +[NSMutableIndexSet indexSet];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(THChapterBrowserController *)self thumbnailSubviews];
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [(THScrollViewWithPassthrough *)self->mPagesScrollView bounds];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [v8 frame];
        v29.origin.double x = v17;
        v29.origin.CGFloat y = v18;
        v29.size.CGFloat width = v19;
        v29.size.CGFloat height = v20;
        v28.origin.double x = v10;
        v28.origin.CGFloat y = v12;
        v28.size.CGFloat width = v14;
        v28.size.CGFloat height = v16;
        if (CGRectIntersectsRect(v28, v29)) {
          objc_msgSend(v3, "addIndex:", objc_msgSend(v8, "pageIndex"));
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)takeChapterIndexFrom:(id)a3
{
  CGFloat v14 = (THChapterBrowserScrubbablePageControl *)a3;
  if (self->mChapterPageControl == v14)
  {
    id v4 = [(THTOCViewController *)self delegate];
    [v4 cancelPreloadOfContentNodesForChapterBrowserController:self];

    [(THChapterBrowserController *)self p_cancelAllContentNodeLoading];
    [(THChapterBrowserController *)self setPreviousChapterIndex:self->mChapterIndex];
    self->unint64_t mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
    if ([(THChapterBrowserController *)self hasIntroPage])
    {
      if ([(THChapterBrowserScrubbablePageControl *)v14 currentPage]) {
        id v5 = [(THChapterBrowserScrubbablePageControl *)v14 currentPage];
      }
      else {
        id v5 = (unsigned char *)(&dword_0 + 1);
      }
      uint64_t v6 = v5 - 1;
    }
    else
    {
      uint64_t v6 = [(THChapterBrowserScrubbablePageControl *)v14 currentPage];
    }
    +[CATransaction begin];
    [(THChapterBrowserController *)self p_setChapterIndex:v6 forScrub:1 stillScrolling:0];
    unint64_t v7 = [(THChapterBrowserScrubbablePageControl *)v14 currentPage];
    [(THChapterBrowserController *)self chapterWidth];
    double v9 = v8;
    unsigned int v10 = [(THChapterBrowserController *)self hasIntroPage];
    double v11 = 0.0;
    if (v10) {
      [(THChapterBrowserController *)self chapterWidth];
    }
    -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", -(v11 - (double)v7 * v9), 0.0);
    +[CATransaction commit];
    if (self->mDraggingInScrubber)
    {
      [(THScrollView *)self->mBackgroundScrollView contentOffset];
      if (v12 < 0.0)
      {
        double v13 = [(THChapterBrowserController *)self introMediaViewController];
        [v13 ensureReadyToPlay];
      }
    }
    else
    {
      [(THChapterBrowserController *)self p_startIntroMediaIfNecessary];
    }
  }
}

- (void)takeTouchUpFromPageControl:(id)a3
{
  p_mUpdatingScrollView = &self->mUpdatingScrollView;
  objc_storeStrong((id *)&self->mUpdatingScrollView, self->mBackgroundScrollView);
  self->mDraggingInScrubber = 0;
  [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:0 firstVisibleRelativePage:0 resetContentOffset:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_A68A0;
  v13[3] = &unk_458C38;
  v13[4] = self;
  +[UIView animateWithDuration:v13 animations:0.25];
  id v5 = *p_mUpdatingScrollView;
  *p_mUpdatingScrollView = 0;

  [(THChapterBrowserController *)self p_updateAdjacentChapterViews];
  [(THChapterBrowserController *)self p_preloadContentNodesForVisibleThumbnails];
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v7 = v6;
  [(THChapterBrowserController *)self chapterWidth];
  if (v7 == -v8)
  {
    [(THChapterBrowserController *)self p_startIntroMediaIfNecessary];
    double v9 = [(THTOCViewController *)self delegate];
    unsigned int v10 = [v9 introMediaViewControllerForChapterBrowserController:self];
    unsigned int v11 = [v10 isMovie];

    mChapterPageControlWrapper = self->mChapterPageControlWrapper;
    if (v11)
    {
      [(UIView *)mChapterPageControlWrapper setAlpha:0.0];
    }
    else
    {
      [(UIView *)mChapterPageControlWrapper setAlpha:1.0];
      [(THChapterBrowserController *)self refreshStatusBarAppearance];
    }
  }
}

- (void)p_cancelAllContentNodeLoading
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = [(THChapterBrowserController *)self contentNodesAskedToLoad];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) cancelLoading];
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  double v7 = [(THChapterBrowserController *)self contentNodesAskedToLoad];
  [v7 removeAllObjects];
}

- (void)draggingStartedFromPageControl:(id)a3
{
  self->mDraggingInScrubber = 1;
  id v3 = [(THChapterBrowserController *)self introMediaViewController];
  [v3 prepareControlsForTOC];
}

- (void)takeDragInsideFromPageControl:(id)a3
{
  id v4 = [(THTOCViewController *)self delegate];
  [v4 cancelPreloadOfContentNodesForChapterBrowserController:self];

  [(THScrollViewWithPassthrough *)self->mPagesScrollView alpha];
  if (v5 == 1.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_A6B20;
    v6[3] = &unk_458C38;
    v6[4] = self;
    +[UIView animateWithDuration:v6 animations:0.25];
  }
}

- (void)hideBackground
{
  id v4 = +[UIColor clearColor];
  id v3 = [(THChapterBrowserController *)self view];
  [v3 setBackgroundColor:v4];
}

- (void)showBackground
{
  id v4 = +[UIColor blackColor];
  id v3 = [(THChapterBrowserController *)self view];
  [v3 setBackgroundColor:v4];
}

- (void)_updateContentOffsets
{
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v3 = 0.0;
  if (v4 <= 0.0)
  {
    [(THScrollView *)self->mBackgroundScrollView contentOffset];
    double v3 = v5;
  }
  memset(&v13, 0, sizeof(v13));
  mPagesScrollView = self->mPagesScrollView;
  if (mPagesScrollView)
  {
    [(THScrollViewWithPassthrough *)mPagesScrollView transform];
    CGFloat v7 = *((double *)&v12 + 1);
    long long v8 = self->mPagesScrollView;
  }
  else
  {
    long long v8 = 0;
    long long v11 = 0uLL;
    long long v12 = 0uLL;
    CGFloat v7 = 0.0;
    long long v10 = 0uLL;
  }
  CGAffineTransformMakeTranslation(&v13, -v3, v7);
  CGAffineTransform v9 = v13;
  [(THScrollViewWithPassthrough *)v8 setTransform:&v9];
  [(TSWPassThroughView *)self->mBottomWrapperView setUserInteractionEnabled:v3 >= 0.0];
}

- (void)p_addIntroMediaView
{
  double v3 = [(THChapterBrowserController *)self introMediaViewController];

  if (v3)
  {
    [(UIView *)self->mIntroMediaContainerView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v15 = [(THChapterBrowserController *)self introMediaViewController];
    long long v12 = [v15 view];
    [v12 setFrame:v5, v7, v9, v11];

    mIntroMediaContainerView = self->mIntroMediaContainerView;
    id v16 = [(THChapterBrowserController *)self introMediaViewController];
    CGFloat v14 = [v16 view];
    [(UIView *)mIntroMediaContainerView addSubview:v14];
  }
}

- (void)p_removeIntroMediaView
{
  id v5 = [(THChapterBrowserController *)self introMediaViewController];
  unsigned int v3 = [v5 isViewLoaded];

  if (v3)
  {
    id v6 = [(THChapterBrowserController *)self introMediaViewController];
    double v4 = [v6 view];
    [v4 removeFromSuperview];
  }
}

- (void)introMediaControllerMoviePlayerWillShowControls
{
}

- (BOOL)p_showingIntroMedia
{
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v4 = v3;
  double v5 = 0.0;
  if (v4 <= 0.0) {
    [(THScrollView *)self->mBackgroundScrollView contentOffset];
  }
  double v6 = -v5;
  [(THChapterBrowserController *)self chapterWidth];
  return vabdd_f64(v6, v7) < 0.00999999978;
}

- (void)introMediaControllerMoviePlayerWillHideControls
{
  if ([(THChapterBrowserController *)self p_showingIntroMedia])
  {
    mChapterPageControlWrapper = self->mChapterPageControlWrapper;
    [(UIView *)mChapterPageControlWrapper setAlpha:0.0];
  }
}

- (BOOL)closeButtonIsNeeded
{
  return 0;
}

- (BOOL)statusBarShouldBeHidden
{
  return 0;
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  double v4 = [(THChapterBrowserController *)self backgroundScrollView];
  [v4 contentOffset];
  double v6 = v5;

  if (v6 < 0.0)
  {
    double v7 = [(THChapterBrowserController *)self introMediaViewController];
    [v7 pause];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_A70F0;
    v9[3] = &unk_458C38;
    v9[4] = self;
    double v8 = objc_retainBlock(v9);
    ((void (*)(void))v8[2])();
  }
}

- (BOOL)introMediaControllerIsActive
{
  double v3 = [(THChapterBrowserController *)self introMediaViewController];
  if (v3)
  {
    [(THScrollView *)self->mBackgroundScrollView contentOffset];
    double v5 = v4;
    [(THChapterBrowserController *)self chapterWidth];
    BOOL v7 = fabs(v5 + v6) < 0.00999999978;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)introMediaControllerIsOffscreen
{
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  return v2 >= 0.0;
}

- (BOOL)animatesPageDuringTransition
{
  return 1;
}

- (void)p_startIntroMediaIfNecessary
{
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  if (v3 >= 0.0)
  {
    id v13 = [(THTOCViewController *)self delegate];
    [v13 TOCViewControllerDidShowChapter:self];

    id v14 = [(THChapterBrowserController *)self introMediaViewController];
    unsigned int v7 = [v14 isPlaying];

    if (v7)
    {
      id v15 = [(THChapterBrowserController *)self introMediaViewController];
      [v15 pause];
    }
    id v16 = [(THChapterBrowserController *)self introMediaViewController];
    [v16 prepareMovieForTOC];

    id v12 = [(THChapterBrowserController *)self bc_windowForViewController];
    double v8 = [v12 windowScene];
    self->mCurrentSyntheticInterfaceOrientation = (int64_t)[v8 interfaceOrientation];
  }
  else
  {
    [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
    [(THScrollViewWithPassthrough *)self->mPagesScrollView setContentOffset:0.0];
    self->mPageThumbScrollerStartContentOffset = 0.0;
    self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = 0.0;
    double v4 = [(THChapterBrowserController *)self introMediaViewController];

    if (!v4)
    {
      id v9 = +[TSUAssertionHandler currentHandler];
      double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController p_startIntroMediaIfNecessary]");
      double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
      [v9 handleFailureInFunction:v5 file:v6 lineNumber:1265 description:@"invalid nil value for '%s'", "self.introMediaViewController"];
    }
    id v10 = [(THTOCViewController *)self delegate];
    [v10 TOCViewControllerDidShowIntroMedia:self];

    [(THChapterBrowserController *)self p_addIntroMediaView];
    id v11 = [(THChapterBrowserController *)self introMediaViewController];
    [v11 ensureReadyToPlay];

    id v12 = [(THChapterBrowserController *)self introMediaViewController];
    [v12 playForIntroMediaBecomesVisible];
  }
}

- (id)viewToShroud
{
  return self->mBackgroundScrollView;
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  id v17 = a3;
  if (self->mDoingFreeTransform)
  {
    double v4 = +[TSUAssertionHandler currentHandler];
    double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerDidBegin:]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:1296 description:@"Beginning free transform while another one is active"];
  }
  self->mDoingFreeTransform = 1;
  objc_opt_class();
  unsigned int v7 = [v17 targetLayer];
  double v8 = [v7 delegate];
  id v9 = TSUDynamicCast();

  if (!v9)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerDidBegin:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:1300 description:@"invalid nil value for '%s'", "thumbnailView"];
  }
  TSUScreenScale();
  self->mUsingTinyThumb = v13 <= 1.0;
  objc_opt_class();
  id v14 = [v17 freeTransformLayer];
  id v15 = [v14 delegate];
  id v16 = TSUDynamicCast();

  [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v9 transformView:v16 freeTransform:1 firstThumbNailToTransition:1];
  [v9 setShowCanvas:0 animated:0];
}

- (BOOL)freeTransformControllerShouldUseEffectsWindow:(id)a3
{
  return 0;
}

- (void)freeTransformControllerDidContinue:(id)a3 withScale:(double)a4
{
  id v16 = a3;
  objc_opt_class();
  double v6 = [v16 targetLayer];
  unsigned int v7 = [v6 delegate];
  double v8 = TSUDynamicCast();

  [v8 setShowCanvas:a4 >= 3.0 animated:1];
  if (a4 < 3.0)
  {
    if (a4 >= 1.20000005)
    {
      BOOL v10 = 0;
    }
    else
    {
      TSUScreenScale();
      BOOL v10 = v9 <= 1.0;
    }
    if (self->mUsingTinyThumb != v10)
    {
      id v11 = [(THTOCViewController *)self dataSource];
      id v12 = objc_msgSend(v11, "toc:tileModelForChapterIndex:", self, objc_msgSend(v8, "chapterIndex"));

      if (v10) {
        [v12 tinyThumbs];
      }
      else {
      double v13 = [v12 largerThumbs];
      }
      id v14 = [v8 pageIndex];
      if (v14 >= [v13 count])
      {
        id v15 = 0;
      }
      else
      {
        id v15 = [v13 objectAtIndex:[v8 pageIndex]];
        if (v15) {
          [v8 setImage:[TSDBitmapImageProvider CGImageForImageData:v15]];
        }
      }
      self->mUsingTinyThumb = v10;
    }
  }
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  double v4 = [a3 freeTransformLayer];
  double v5 = [v4 superlayer];
  [(THChapterBrowserController *)self originalCanvasScrollViewFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(THChapterBrowserController *)self originalCanvasScrollViewSuperview];
  id v15 = [v14 layer];
  [v5 convertRect:v15 fromLayer:v7];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)freeTransformControllerWillBeginCompletionAnimation:(id)a3 passedThreshold:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  double v7 = [v6 targetLayer];
  double v8 = [v7 delegate];
  double v9 = TSUDynamicCast();

  if (!v9)
  {
    double v10 = +[TSUAssertionHandler currentHandler];
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerWillBeginCompletionAnimation:passedThreshold:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:1355 description:@"invalid nil value for '%s'", "thumbnailView"];
  }
  [v9 setShowCanvas:v4 animated:1];
  if (v4)
  {
    [(THTOCViewController *)self setShrouded:1 animated:1 duration:0.25];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_A7D0C;
    v13[3] = &unk_458C38;
    id v14 = v9;
    +[UIView animateWithDuration:v13 animations:0.15];
  }
}

- (void)freeTransformControllerWillEnd:(id)a3 passedThreshold:(BOOL)a4
{
  id v13 = a3;
  objc_opt_class();
  id v6 = [v13 targetLayer];
  double v7 = [v6 delegate];
  double v8 = TSUDynamicCast();

  if (!v8)
  {
    double v9 = +[TSUAssertionHandler currentHandler];
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerWillEnd:passedThreshold:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:1374 description:@"invalid nil value for '%s'", "thumbnailView"];

    if (a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (!a4)
  {
LABEL_5:
    double v12 = [(THTOCViewController *)self delegate];
    [v12 chapterBrowserController:self cancelledTransitionToPageIndex:[v8 pageIndex] chapterIndex:[v8 chapterIndex]];
  }
LABEL_6:
}

- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  objc_opt_class();
  id v6 = [v12 targetLayer];
  double v7 = [v6 delegate];
  double v8 = TSUDynamicCast();

  if (!v8)
  {
    double v9 = +[TSUAssertionHandler currentHandler];
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController freeTransformControllerDidEnd:passedThreshold:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:1386 description:@"invalid nil value for '%s'", "thumbnailView"];
  }
  +[CATransaction begin];
  if (v4) {
    [(THChapterBrowserController *)self p_animationDidStopForThumbnailView:v8];
  }
  [(THChapterBrowserController *)self p_cleanupAfterTransitionFromPageThumbnail:v8];
  +[CATransaction commit];
  self->mDoingFreeTransform = 0;
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  double v3 = [(THChapterBrowserController *)self view];
  BOOL v4 = [v3 superview];

  return v4;
}

- (id)curtainColorForFreeTransformController:(id)a3
{
  return 0;
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  return 0;
}

- (BOOL)freeTransformController:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)freeTransformControllerShouldFadeShadowOut:(id)a3
{
  return 1;
}

- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [v5 targetLayer];
  double v7 = [v6 delegate];
  double v8 = TSUDynamicCast();

  if (!v8)
  {
    double v9 = +[TSUAssertionHandler currentHandler];
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController shadowPropertiesForFreeTransformController:defaults:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:1437 description:@"invalid nil value for '%s'", "thumbnailView"];
  }
  if (![v8 pageIndex])
  {
    id v12 = +[TSUAssertionHandler currentHandler];
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController shadowPropertiesForFreeTransformController:defaults:]");
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:1438 description:@"Free transform controller should automatically use the shadow on the large thumbnail"];
  }
  return result;
}

- (id)documentRootForChapterViewController:(id)a3
{
  BOOL v4 = [(THTOCViewController *)self delegate];
  id v5 = [v4 documentRootForChapterBrowserController:self];

  return v5;
}

- (void)chapterViewController:(id)a3 displayPageForModelLink:(id)a4
{
  uint64_t v5 = [(THChapterBrowserController *)self p_pageThumbnailViewForModelLink:a4];
  id v9 = (id)v5;
  if (v5)
  {
    [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v5 transformView:v5 freeTransform:0 firstThumbNailToTransition:1];
    -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v9, 1);
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController chapterViewController:displayPageForModelLink:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:1460 description:@"invalid nil value for '%s'", "thumb"];
  }
}

- (unint64_t)supportedInterfaceOrientationsForChapterViewController:(id)a3
{
  return 30;
}

- (CGRect)frameForChapterViewController:(id)a3 withSize:(CGSize)a4
{
  for (unint64_t i = 0; i != 3; ++i)
  {
    if (self->mChapterViewControllers[i] == a3) {
      break;
    }
  }
  [(THChapterBrowserController *)self p_hasPageScrubberControl];
  [(THChapterBrowserController *)self chapterWidth];
  double v7 = v6;
  TSDRectWithOriginAndSize();
  double v11 = v7 * (double)i;
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.CGFloat y = v8;
  result.origin.double x = v11;
  return result;
}

- (CGRect)frameForChapterViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(THChapterBrowserController *)self view];
  [v5 bounds];
  -[THChapterBrowserController frameForChapterViewController:withSize:](self, "frameForChapterViewController:withSize:", v4, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)chapterViewControllerWasTapped:(id)a3
{
  id v4 = [(THTOCViewController *)self delegate];
  unsigned int v5 = [v4 isToolbarHidden];

  double v6 = [(THTOCViewController *)self delegate];
  double v7 = v6;
  if (v5) {
    [v6 TOCShowToolbarAnimated:1];
  }
  else {
    [v6 TOCHideToolbarAnimated:1];
  }

  [(THChapterBrowserController *)self refreshStatusBarAppearance];
}

- (id)chapterViewController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [THModelLink alloc];
  double v13 = [v9 url];
  double v14 = [v13 absoluteString];
  double v15 = [(THModelLink *)v12 initWithTarget:v14 context:0];

  uint64_t v16 = [v11 gestureKind];
  double v17 = (void *)v16;
  double v18 = (void *)TSWPLongPress;
  if (v16 == TSWPImmediateSingleTap || v16 == TSWPLongPress)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_A8A00;
    v32[3] = &unk_458C60;
    id v33 = v10;
    id v34 = v9;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_A8A0C;
    v30[3] = &unk_458C38;
    id v31 = v33;
    double v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    double v25 = sub_A8A18;
    double v26 = &unk_458C88;
    id v27 = v31;
    CGRect v28 = self;
    CGRect v29 = v15;
    double v21 = +[TSWPTwoPartAction actionWithStartAction:v32 cancelAction:v30 finishAction:&v23];
    if (v17 == v18) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = TSUSupportsTextInteraction();
    }
    [v21 setPerformImmediately:v20, v23, v24, v25, v26];
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

- (BOOL)chapterViewController:(id)a3 followLink:(id)a4
{
  id v5 = a4;
  double v6 = [(THTOCViewController *)self delegate];
  id v7 = [v6 chapterBrowserController:self relativePageIndexForLink:v5];

  double v8 = [(THTOCViewController *)self delegate];
  [v8 chapterBrowserController:self willTransitionToPageIndex:v7 chapterIndex:self->mChapterIndex freeTransform:0];

  id v9 = [(THTOCViewController *)self delegate];
  [v9 chapterBrowserController:self didTransitionToPageIndex:v7 chapterIndex:self->mChapterIndex relativeTargetRect:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  [(THTOCViewController *)self setShrouded:1 animated:0 duration:0.0];
  return 1;
}

- (id)presentingViewControllerForChapterViewController:(id)a3
{
  id v4 = [(THTOCViewController *)self delegate];
  id v5 = [v4 presentingViewControllerForChapterBrowserController:self];

  return v5;
}

- (void)p_highlightThumbTargetsIfShouldInThumb:(id)a3 atPoint:(CGPoint)a4 coverFullThumb:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  id v22 = a3;
  if ([(THChapterBrowserController *)self p_shouldHighlightThumbTargets])
  {
    if (a5)
    {
      double v9 = 1.0;
      double v10 = 0.0;
      double v11 = 0.0;
      double v12 = 1.0;
    }
    else
    {
      [v22 frame];
      double v14 = v13;
      [v22 frame];
      double v16 = v15;
      double v17 = [(THTOCViewController *)self delegate];
      [v17 chapterBrowserController:self targetRelativeRectForRelativePoint:[v22 pageIndex] atPageIndex:[v22 chapterIndex] x:x / v14 y:y / v16];
      double v10 = v18;
      double v11 = v19;
      double v9 = v20;
      double v12 = v21;
    }
    [v22 setHighlightRelativeRect:v10, v11, v9, v12];
  }
}

- (void)thumbnailWasPressed:(id)a3 atPoint:(CGPoint)a4 forLong:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if (!self->mIgnoringThumbnailTaps && !self->mDoingFreeTransform) {
    -[THChapterBrowserController p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:](self, "p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:", v9, !v5, x, y);
  }
}

- (void)p_transitionThumbnailToDVC:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v30 = v4;
    BOOL v5 = [(THTOCViewController *)self delegate];
    unsigned int v6 = [v5 isTwoUpForChapterBrowserController:self];

    if (!v6) {
      goto LABEL_4;
    }
    id v7 = [(THTOCViewController *)self delegate];
    unsigned int v8 = [v7 isLastPageInChapterForChapterBrowserController:self pageIndex:[v30 pageIndex] chapterIndex:[v30 chapterIndex]];

    id v9 = [(THTOCViewController *)self delegate];
    unsigned int v10 = [v9 isSinglePageInChapterForChapterBrowserController:self chapterIndex:[v30 chapterIndex]];

    if (!v10)
    {
      if (v8)
      {
        -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v30 pageIndex] - 1);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v11 transformView:v11 freeTransform:0 firstThumbNailToTransition:1];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v11, 1);
        [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v30 transformView:v30 freeTransform:0 firstThumbNailToTransition:0];
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v30, 0, v13 + v17, v15, v17, v19);
      }
      else
      {
        if ([v30 pageIndex])
        {
          uint64_t v21 = -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v30 pageIndex] - 1);
          id v20 = v30;
          id v11 = (id)v21;
        }
        else
        {
          id v11 = v30;
          -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v11 pageIndex] + 1);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v11 transformView:v11 freeTransform:0 firstThumbNailToTransition:1];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v11, 1);
        [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v20 transformView:v20 freeTransform:0 firstThumbNailToTransition:0];
        -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v20, 0, v23 + v27, v25, v27, v29);
      }
      id v4 = v30;
    }
    else
    {
LABEL_4:
      [(THChapterBrowserController *)self p_beginTransitionFromPageThumbnail:v30 transformView:v30 freeTransform:0 firstThumbNailToTransition:1];
      -[THChapterBrowserController p_transitionFromPageThumbnail:destinationRect:shouldShroud:](self, "p_transitionFromPageThumbnail:destinationRect:shouldShroud:", v30, 1);
      id v4 = v30;
    }
  }
}

- (BOOL)thumbnailWasTapped:(id)a3 atPoint:(CGPoint)a4 forLong:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if (self->mIgnoringThumbnailTaps || self->mDoingFreeTransform)
  {
    BOOL v10 = 0;
  }
  else
  {
    self->mIgnoringThumbnailTaps = 1;
    -[THChapterBrowserController p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:](self, "p_highlightThumbTargetsIfShouldInThumb:atPoint:coverFullThumb:", v9, !v5, x, y);
    [(THChapterBrowserController *)self p_transitionThumbnailToDVC:v9];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)transitionPageToDVC:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  self->mIgnoringThumbnailTaps = 1;
  id v9 = [(THChapterBrowserController *)self visibleThumbnailIndexes];
  if ([v9 containsIndex:a3])
  {
    id v7 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:a3];
    [(THChapterBrowserController *)self p_transitionThumbnailToDVC:v7];
  }
  else
  {
    unsigned int v8 = +[UIApplication sharedApplication];
    [v8 beginIgnoringInteractionEvents];

    [(THChapterBrowserController *)self setTransitioningPageToDVC:1];
    [(THChapterBrowserController *)self setTransitioningThumbnailIndex:a3];
    [(THChapterBrowserController *)self prepareToScrollToThumbnailAtIndex:a3 chapterIndex:a4];
    [(THChapterBrowserController *)self p_scrollToThumbnailAtIndex:a3 animated:1];
  }
}

- (void)p_updateChapterBackgroundsView
{
  [(THChapterBrowserController *)self chapterWidth];
  double v4 = v3 * (double)self->mChapterIndex;
  [(UIView *)self->mBackgroundsView frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(THChapterBrowserController *)self chapterWidth];
  mBackgroundsView = self->mBackgroundsView;
  double v13 = v4 - v12;

  -[UIView setFrame:](mBackgroundsView, "setFrame:", v13, v6, v8, v10);
}

- (void)p_setupChapterViewControllerAtIndex:(unint64_t)a3 withChapterIndex:(unint64_t)a4 allowThumbnail:(BOOL)a5
{
  BOOL v5 = a5;
  mChapterViewControllers = self->mChapterViewControllers;
  double v10 = self->mChapterViewControllers[a3];
  if (!v10)
  {
    id v11 = [THChapterViewController alloc];
    id v22 = [(THTOCViewController *)self delegate];
    double v12 = [v22 presentationTypeForChapterBrowserController:self];
    double v13 = [(THChapterViewController *)v11 initWithDelegate:self pageControlHeight:v12 presentationType:48.0];
    double v14 = mChapterViewControllers[a3];
    mChapterViewControllers[a3] = v13;

    mBackgroundsView = self->mBackgroundsView;
    id v23 = [(THChapterViewController *)mChapterViewControllers[a3] view];
    -[UIView addSubview:](mBackgroundsView, "addSubview:");

    [(THChapterBrowserController *)self addChildViewController:mChapterViewControllers[a3]];
    id v24 = [(THChapterViewController *)mChapterViewControllers[a3] interactiveCanvasController];
    double v16 = [v24 gestureRecognizerWithKind:TSWPImmediatePress];
    double v17 = [v24 gestureDispatcher];
    double v18 = [(THScrollView *)self->mBackgroundScrollView panGestureRecognizer];
    [v17 allowSimultaneousRecognitionByRecognizers:v16, v18];

    double v10 = mChapterViewControllers[a3];
  }
  if ([(THChapterViewController *)v10 chapterIndex] != a4)
  {
    double v19 = [(THTOCViewController *)self delegate];
    id v25 = [v19 chapterBrowserController:self tocTileModelAtIndex:a4];

    [(THChapterViewController *)mChapterViewControllers[a3] setTileModel:v25];
    [(THChapterViewController *)mChapterViewControllers[a3] setChapterIndex:a4];
    id v20 = [(THChapterViewController *)mChapterViewControllers[a3] reloadViewsAndShowThumbnail:v5];
    if (v20)
    {
      uint64_t v21 = [(THChapterBrowserController *)self contentNodesAskedToLoad];
      [v21 addObject:v20];
    }
  }
}

- (void)p_fixupChapterViewFrames
{
  uint64_t v3 = 0;
  mChapterViewControllers = self->mChapterViewControllers;
  do
  {
    BOOL v5 = mChapterViewControllers[v3];
    if (v5)
    {
      [(THChapterBrowserController *)self frameForChapterViewController:v5];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v14 = [(THChapterViewController *)v5 view];
      [v14 frame];
      v22.origin.double x = v15;
      v22.origin.double y = v16;
      v22.size.double width = v17;
      v22.size.double height = v18;
      v21.origin.double x = v7;
      v21.origin.double y = v9;
      v21.size.double width = v11;
      v21.size.double height = v13;
      BOOL v19 = CGRectEqualToRect(v21, v22);

      if (!v19)
      {
        id v20 = [(THChapterViewController *)v5 view];
        [v20 setFrame:v7, v9, v11, v13];
      }
    }

    ++v3;
  }
  while (v3 != 3);
}

- (void)p_setupPreviousChapterView
{
  unint64_t mChapterIndex = self->mChapterIndex;
  if (mChapterIndex)
  {
    [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:0 withChapterIndex:mChapterIndex - 1 allowThumbnail:1];
    [(THChapterBrowserController *)self p_removeIntroMediaView];
  }
  else
  {
    [(THChapterBrowserController *)self p_clearChapterViewAtIndex:0];
    [(THChapterBrowserController *)self p_addIntroMediaView];
  }
}

- (void)p_setupNextChapterView
{
  unint64_t mChapterIndex = self->mChapterIndex;
  double v4 = [(THTOCViewController *)self dataSource];
  id v5 = [v4 toc:self numberOfTilesInDivision:0];

  if (mChapterIndex + 1 >= (unint64_t)v5) {
    [(THChapterBrowserController *)self p_clearChapterViewAtIndex:2];
  }
  else {
    [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:2 withChapterIndex:self->mChapterIndex + 1 allowThumbnail:1];
  }
  if (self->mChapterIndex)
  {
    [(THChapterBrowserController *)self p_removeIntroMediaView];
  }
}

- (void)p_updateAdjacentChapterViews
{
  [(THChapterBrowserController *)self p_setupPreviousChapterView];
  [(THChapterBrowserController *)self p_setupNextChapterView];

  [(THChapterBrowserController *)self p_fixupChapterViewFrames];
}

- (void)p_clearChapterViewAtIndex:(unint64_t)a3
{
  mChapterViewControllers = self->mChapterViewControllers;
  double v4 = self->mChapterViewControllers[a3];
  if (v4)
  {
    [(THChapterViewController *)v4 setTileModel:0];
    [(THChapterViewController *)mChapterViewControllers[a3] setChapterIndex:0x7FFFFFFFFFFFFFFFLL];
    id v6 = [(THChapterViewController *)mChapterViewControllers[a3] reloadViewsAndShowThumbnail:1];
  }
}

- (void)p_setChapterIndex:(unint64_t)a3 forScrub:(BOOL)a4 stillScrolling:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  +[CATransaction begin];
  unint64_t mChapterIndex = self->mChapterIndex;
  if (mChapterIndex != a3)
  {
    if (mChapterIndex != 0x7FFFFFFFFFFFFFFFLL) {
      [(THChapterBrowserController *)self setPreviousChapterIndex:self->mChapterIndex];
    }
    self->unint64_t mChapterIndex = a3;
    if (v6)
    {
      [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:1 withChapterIndex:a3 allowThumbnail:1];
      [(THChapterBrowserController *)self p_updateChapterBackgroundsView];
      goto LABEL_15;
    }
    [(THChapterBrowserController *)self p_updatePageControl];
    if (mChapterIndex - 1 == a3)
    {
      double v10 = self->mChapterViewControllers[2];
      double v11 = v10;
      objc_storeStrong((id *)&self->mChapterViewControllers[2], self->mChapterViewControllers[1]);
      objc_storeStrong((id *)&self->mChapterViewControllers[1], self->mChapterViewControllers[0]);
      objc_storeStrong((id *)self->mChapterViewControllers, v10);
      [(THChapterBrowserController *)self p_setupPreviousChapterView];
      [(THChapterBrowserController *)self p_fixupChapterViewFrames];
    }
    else
    {
      if (mChapterIndex + 1 != a3)
      {
        [(THChapterBrowserController *)self p_setupChapterViewControllerAtIndex:1 withChapterIndex:self->mChapterIndex allowThumbnail:1];
        if (v5) {
          [(THChapterBrowserController *)self p_updateAdjacentChapterViews];
        }
        goto LABEL_11;
      }
      double v12 = self->mChapterViewControllers[0];
      double v11 = v12;
      objc_storeStrong((id *)self->mChapterViewControllers, self->mChapterViewControllers[1]);
      objc_storeStrong((id *)&self->mChapterViewControllers[1], self->mChapterViewControllers[2]);
      objc_storeStrong((id *)&self->mChapterViewControllers[2], v12);
      [(THChapterBrowserController *)self p_setupNextChapterView];
      [(THChapterBrowserController *)self p_fixupChapterViewFrames];
    }

LABEL_11:
    [(THChapterBrowserController *)self p_updateChapterBackgroundsView];
  }
  if (!v6 && !v5) {
    [(THChapterBrowserController *)self p_preloadContentNodesForVisibleThumbnails];
  }
LABEL_15:

  +[CATransaction commit];
}

- (void)p_removeAdjacentChapterViews
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (i != 1)
    {
      [(THChapterViewController *)self->mChapterViewControllers[i] removeFromParentViewController];
      double v4 = [(THChapterViewController *)self->mChapterViewControllers[i] view];
      [v4 removeFromSuperview];

      [(THChapterViewController *)self->mChapterViewControllers[i] teardown];
      BOOL v5 = self->mChapterViewControllers[i];
      self->mChapterViewControllers[i] = 0;
    }
  }
}

- (void)setChapterIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && self->mChapterIndex != a3)
  {
    BOOL v5 = [(THChapterBrowserController *)self view];

    if (v5)
    {
      [(THChapterBrowserController *)self p_setChapterIndex:a3 forScrub:0 stillScrolling:0];
      self->mPreservedThumbnailOffset.double x = 0.0;
      [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:0 firstVisibleRelativePage:0 resetContentOffset:1];
      [(THScrollView *)self->mBackgroundScrollView contentOffset];
      if (v6 >= 0.0)
      {
        [(THChapterBrowserController *)self chapterWidth];
        double v8 = v7 * (double)a3;
        mBackgroundScrollView = self->mBackgroundScrollView;
        -[THScrollView setContentOffset:](mBackgroundScrollView, "setContentOffset:", v8, 0.0);
      }
    }
  }
}

- (id)previousChapterViewController
{
  return self->mChapterViewControllers[0];
}

- (THChapterViewController)chapterViewController
{
  return self->mChapterViewControllers[1];
}

- (id)nextChapterViewController
{
  return self->mChapterViewControllers[2];
}

- (void)p_resetPagesScrollViewAndCapThumbCount:(BOOL)a3 firstVisibleRelativePage:(unint64_t)a4 resetContentOffset:(BOOL)a5
{
  BOOL v56 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  double v8 = 0.0;
  double v9 = &selRef_setBackgroundScrollView_;
  do
  {
    unint64_t mChapterIndex = self->mChapterIndex;
    if (!(v6 | mChapterIndex))
    {
      int v11 = *((_DWORD *)v9 + 1020);
LABEL_5:
      double v14 = &self->super.IMViewController_opaque[v6 + v11];
      *(void *)double v14 = 0x7FFFFFFFFFFFFFFFLL;
      CGFloat v15 = &self->super.IMViewController_opaque[v11 + v6];
      CGFloat v16 = (void *)*((void *)v15 + 6);
      *((void *)v15 + 6) = 0;

      *((void *)v15 + 1) = 0;
      CGSize size = CGRectZero.size;
      *((_OWORD *)v15 + 1) = CGRectZero.origin;
      *((CGSize *)v15 + 2) = size;
      *((void *)v14 + 7) = 0;
      goto LABEL_19;
    }
    double v12 = [(THTOCViewController *)self dataSource];
    id v13 = [v12 toc:self numberOfTilesInDivision:0];

    int v11 = *((_DWORD *)v9 + 1020);
    if (v7 + mChapterIndex > (unint64_t)v13) {
      goto LABEL_5;
    }
    CGFloat v18 = v9;
    unint64_t v19 = v7 + self->mChapterIndex - 1;
    uint64_t v20 = v6 + v11;
    *(void *)&self->super.IMViewController_opaque[v20] = v19;
    CGRect v21 = [(THTOCViewController *)self dataSource];
    CGRect v22 = [v21 toc:self tileModelForChapterIndex:v19];

    objc_storeStrong((id *)((char *)&self->super.mBookPropertiesDelegate + v20), v22);
    id v23 = [v22 tinyThumbs];
    id v24 = (char *)[v23 count];

    if (v56)
    {
      if (v6 == 64)
      {
        unint64_t v25 = a4;
        if ([(THChapterBrowserController *)self maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag] <= a4)unint64_t v25 = [(THChapterBrowserController *)self maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag]; {
        *(TSWPassThroughView **)((char *)&self->mBottomWrapperView + v11) = (TSWPassThroughView *)(a4 - v25);
        }
        unint64_t v26 = [(THChapterBrowserController *)self maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag];
        int64_t v27 = (int64_t)&v24[-a4];
        if (v26 < (unint64_t)&v24[-a4]) {
          int64_t v27 = [(THChapterBrowserController *)self maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag];
        }
      }
      else
      {
        int64_t v27 = [(THChapterBrowserController *)self maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag];
        unint64_t v25 = 0;
      }
      if (v25 + v27 < (unint64_t)v24) {
        id v24 = (char *)(v25 + v27);
      }
    }
    else
    {
      *(THUIState **)((char *)&self->super.mUIState + v6 + v11) = 0;
    }
    double v9 = v18;
    [(THChapterBrowserController *)self thumbSize];
    double v29 = v28;
    [(THChapterBrowserController *)self firstThumbOverlap];
    double v31 = v30;
    [(THChapterBrowserController *)self thumbSize];
    uint64_t v33 = v32;
    [(THChapterBrowserController *)self chapterWidth];
    double v35 = v34;
    double v36 = v31 + (double)(unint64_t)v24 * v29;
    if (v35 > v36) {
      [(THChapterBrowserController *)self chapterWidth];
    }
    float v37 = &self->super.IMViewController_opaque[v11 + v6];
    *((void *)v37 + 1) = v24;
    *((double *)v37 + 2) = v8;
    *((void *)v37 + 3) = 0;
    *((double *)v37 + 4) = v36;
    *((void *)v37 + 5) = v33;
    double v8 = v8 + v36;

LABEL_19:
    ++v7;
    v6 += 64;
  }
  while (v6 != 192);
  ++self->mSuspendThumbViewUpdates;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView bounds];
  -[THScrollViewWithPassthrough setContentSize:](self->mPagesScrollView, "setContentSize:", v8 + 1.0, CGRectGetHeight(v59));
  double v38 = &self->super.IMViewController_opaque[v11];
  CGFloat v39 = -CGRectGetMinX(*(CGRect *)(v38 + 80));
  -[THScrollViewWithPassthrough setContentInset:](self->mPagesScrollView, "setContentInset:", 0.0, v39, 0.0, -CGRectGetWidth(*(CGRect *)(v38 + 144)));
  [(THScrollViewWithPassthrough *)self->mPagesScrollView bounds];
  if (a5) {
    goto LABEL_23;
  }
  CGFloat v44 = *((double *)v38 + 12);
  CGFloat v45 = *((double *)v38 + 10);
  CGFloat v46 = *((double *)v38 + 11);
  CGFloat v47 = v40;
  CGFloat v48 = v41;
  CGFloat v49 = v42;
  CGFloat v50 = v43;
  CGFloat v55 = *((double *)v38 + 13);
  double MinX = CGRectGetMinX(*(CGRect *)&v40);
  v60.origin.double x = v45;
  v60.origin.double y = v46;
  v60.size.double width = v44;
  v60.size.double height = v55;
  if (MinX < CGRectGetMinX(v60)) {
    goto LABEL_23;
  }
  v61.origin.double x = v47;
  v61.origin.double y = v48;
  v61.size.double width = v49;
  v61.size.double height = v50;
  double MaxX = CGRectGetMaxX(v61);
  v62.origin.double x = v45;
  v62.origin.double y = v46;
  v62.size.double width = v44;
  v62.size.double height = v55;
  if (MaxX > CGRectGetMaxX(v62)) {
LABEL_23:
  }
    -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", CGRectGetWidth(*(CGRect *)(v38 + 16)), 0.0);
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
  self->mPageThumbScrollerStartContentOffset = v52;
  --self->mSuspendThumbViewUpdates;
  if (!self->mDeferPagesScrollViewScrolls)
  {
    [(THChapterBrowserController *)self p_updatePageThumbnails:1];
  }
}

- (double)p_updateChapterWidths
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  double v5 = 0.0;
  do
  {
    unint64_t mChapterIndex = self->mChapterIndex;
    if ((v3 * 64) | mChapterIndex
      && ([(THTOCViewController *)self dataSource],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 toc:self numberOfTilesInDivision:0],
          v7,
          v4 + mChapterIndex <= (unint64_t)v8))
    {
      unint64_t v13 = v4 + self->mChapterIndex - 1;
      self->mChapterInfo[v3].chapterNumber = v13;
      double v14 = [(THTOCViewController *)self dataSource];
      CGFloat v15 = [v14 toc:self tileModelForChapterIndex:v13];

      objc_storeStrong((id *)&self->mChapterInfo[v3].tileModel, v15);
      CGFloat v16 = [v15 tinyThumbs];
      id v17 = [v16 count];

      if (self->mBackgroundSwipeDidInitiateScroll
        && v17 >= (id)[(THChapterBrowserController *)self maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag])
      {
        id v17 = [(THChapterBrowserController *)self maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag];
      }
      [(THChapterBrowserController *)self thumbSize];
      double v19 = v18;
      [(THChapterBrowserController *)self firstThumbOverlap];
      double v21 = v20;
      [(THChapterBrowserController *)self thumbSize];
      CGFloat v23 = v22;
      self->mChapterInfo[v3].numberOfPages = (unint64_t)v17;
      [(THChapterBrowserController *)self chapterWidth];
      double v25 = v24;
      double v26 = v21 + (double)(unint64_t)v17 * v19;
      if (v25 > v26) {
        [(THChapterBrowserController *)self chapterWidth];
      }
      int64_t v27 = &self->mChapterInfo[v3];
      v27->frame.origin.double x = v5;
      v27->frame.origin.double y = 0.0;
      v27->frame.size.double width = v26;
      v27->frame.size.double height = v23;
      self->mChapterInfo[v3].firstRelativePageToShowDuringBackgroundScroll = 0;
      double v5 = v5 + v26;
    }
    else
    {
      double v9 = &self->mChapterInfo[v3];
      v9->chapterNumber = 0x7FFFFFFFFFFFFFFFLL;
      double v10 = &self->mChapterInfo[v3];
      tileModel = v10->tileModel;
      v10->tileModel = 0;

      v10->numberOfPages = 0;
      CGSize size = CGRectZero.size;
      v10->frame.origin = CGRectZero.origin;
      v10->frame.CGSize size = size;
      v9->firstRelativePageToShowDuringBackgroundScroll = 0;
    }
    ++v4;
    ++v3;
  }
  while (v3 != 3);
  return v5;
}

- (void)p_updatePagesScrollView
{
  mChapterInfo = self->mChapterInfo;
  unint64_t mChapterIndex = self->mChapterIndex;
  if (self->mChapterInfo[1].chapterNumber != mChapterIndex || !self->mChapterInfo[1].tileModel)
  {
    if (mChapterIndex == self->mChapterInfo[2].chapterNumber)
    {
      double MinX = -CGRectGetMinX(self->mChapterInfo[1].frame);
      unint64_t mChapterIndex = self->mChapterIndex;
    }
    else
    {
      double MinX = 0.0;
    }
    unint64_t chapterNumber = mChapterInfo->chapterNumber;
    [(THChapterBrowserController *)self p_updateChapterWidths];
    double v8 = v7;
    if (mChapterIndex == chapterNumber) {
      double MinX = CGRectGetMinX(mChapterInfo[1].frame);
    }
    [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
    double v10 = v9;
    double v12 = v11;
    ++self->mSuspendThumbViewUpdates;
    [(THScrollViewWithPassthrough *)self->mPagesScrollView bounds];
    -[THScrollViewWithPassthrough setContentSize:](self->mPagesScrollView, "setContentSize:", v8 + 1.0, CGRectGetHeight(v27));
    CGFloat v13 = -CGRectGetMinX(mChapterInfo[1].frame);
    -[THScrollViewWithPassthrough setContentInset:](self->mPagesScrollView, "setContentInset:", 0.0, v13, 0.0, -CGRectGetWidth(mChapterInfo[2].frame));
    CGFloat v14 = MinX + v10;
    -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", v14, v12);
    self->mPreservedThumbnailOffset.double x = v14;
    self->mPreservedThumbnailOffset.double y = v12;
    if (MinX != 0.0)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      CGFloat v15 = [(THChapterBrowserController *)self thumbnailSubviews];
      id v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v15);
            }
            double v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            [v19 frame];
            [v19 setFrame:MinX + v20];
          }
          id v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }
    }
    [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
    self->mPageThumbScrollerStartContentOffset = v21;
    --self->mSuspendThumbViewUpdates;
  }
}

- (id)p_thumbShownForChapter:(unint64_t)a3 index:(unint64_t)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(THChapterBrowserController *)self thumbnailSubviews];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 chapterIndex] == (id)a3 && objc_msgSend(v10, "pageIndex") == (id)a4)
        {
          id v11 = v10;
          goto LABEL_12;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (CGRect)frameForPageThumbAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  if (self->mChapterIndex != a4)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController frameForPageThumbAtIndex:chapterIndex:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:2130 description:
    [NSString stringWithFormat:@"chapter %lu index should match the current mChapterIndex: %lu.", a4, self->mChapterIndex]];
  }
  double x = self->mChapterInfo[1].frame.origin.x;
  CGFloat y = self->mChapterInfo[1].frame.origin.y;
  CGFloat width = self->mChapterInfo[1].frame.size.width;
  CGFloat height = self->mChapterInfo[1].frame.size.height;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(THChapterBrowserController *)self thumbSize];
    double v15 = v14;
    [(THChapterBrowserController *)self firstThumbOverlap];
    double v17 = v16;
    [(THChapterBrowserController *)self thumbSize];
    double v19 = v18;
    v26.origin.double x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double v20 = CGRectGetMinX(v26) + (double)a3 * v15;
    double v21 = -0.0;
    if (a3) {
      double v21 = v17;
    }
    double x = v21 + v20;
    CGFloat y = 0.0;
    CGFloat width = v15;
    CGFloat height = v19;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)p_updatePageThumbnails:(BOOL)a3
{
  BOOL v107 = a3;
  if (self->mSuspendThumbViewUpdates || self->mDraggingInScrubber) {
    return;
  }
  [(THChapterBrowserController *)self thumbSize];
  double v5 = v4;
  [(THChapterBrowserController *)self thumbSize];
  CGFloat r1 = v6;
  [(THChapterBrowserController *)self firstThumbSize];
  double v108 = v7;
  [(THChapterBrowserController *)self firstThumbSize];
  double v105 = v8;
  [(THChapterBrowserController *)self firstThumbOverlap];
  double v114 = v9;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView frame];
  double Width = CGRectGetWidth(v142);
  [(THScrollViewWithPassthrough *)self->mPagesScrollView frame];
  double v11 = CGRectGetWidth(v143);
  rect1_24 = self;
  double v12 = [(THChapterBrowserController *)self view];
  [v12 safeAreaInsets];
  double v14 = v13;
  double v15 = [(THChapterBrowserController *)rect1_24 view];
  [v15 safeAreaInsets];
  double v17 = v14 - (v11 - v5 * (double)(unint64_t)ceil((Width + 2.0) / v5)) + v16;

  [(THScrollViewWithPassthrough *)rect1_24->mPagesScrollView contentOffset];
  CGFloat v19 = v18 + v17 * -0.5;
  [(THScrollViewWithPassthrough *)rect1_24->mPagesScrollView frame];
  CGFloat v20 = v17 + CGRectGetWidth(v144);
  [(THScrollViewWithPassthrough *)rect1_24->mPagesScrollView contentSize];
  v159.size.CGFloat width = v21;
  v145.origin.CGFloat y = 0.0;
  v159.origin.double x = 0.0;
  v159.origin.CGFloat y = 0.0;
  v145.origin.double x = v19;
  v145.size.CGFloat width = v20;
  v145.size.CGFloat height = r1;
  v159.size.CGFloat height = r1;
  CGRect v146 = CGRectIntersection(v145, v159);
  CGFloat rect1 = v146.origin.x;
  CGFloat y = v146.origin.y;
  CGFloat v23 = v146.size.width;
  CGFloat height = v146.size.height;
  id v119 = [objc_alloc((Class)NSMutableArray) initWithCapacity:8];
  id v120 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  double v25 = [(THChapterBrowserController *)rect1_24 thumbnailSubviews];
  id v26 = [v25 countByEnumeratingWithState:&v134 objects:v141 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v135 != v27) {
          objc_enumerationMutation(v25);
        }
        double v29 = *(void **)(*((void *)&v134 + 1) + 8 * i);
        if ([v29 pageIndex]) {
          double v30 = v119;
        }
        else {
          double v30 = v120;
        }
        [v30 addObject:v29];
      }
      id v26 = [v25 countByEnumeratingWithState:&v134 objects:v141 count:16];
    }
    while (v26);
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  double v31 = [(THScrollViewWithPassthrough *)rect1_24->mPagesScrollView subviews];
  id v32 = [v31 countByEnumeratingWithState:&v130 objects:v140 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v131;
    while (2)
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v131 != v33) {
          objc_enumerationMutation(v31);
        }
        double v35 = *(void **)(*((void *)&v130 + 1) + 8 * (void)j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v104 = v35;
          goto LABEL_23;
        }
      }
      id v32 = [v31 countByEnumeratingWithState:&v130 objects:v140 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
  id v104 = 0;
LABEL_23:

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  uint64_t v36 = 0;
  mChapterInfo = rect1_24->mChapterInfo;
  do
  {
    float v37 = &mChapterInfo[v36];
    if (v37->tileModel)
    {
      p_double x = &v37->frame.origin.x;
      v147.origin.double x = rect1;
      v147.origin.CGFloat y = y;
      v147.size.CGFloat width = v23;
      v147.size.CGFloat height = height;
      if (CGRectIntersectsRect(v147, v37->frame))
      {
        v148.origin.double x = rect1;
        v148.origin.CGFloat y = y;
        v148.size.CGFloat width = v23;
        v148.size.CGFloat height = height;
        double MinX = CGRectGetMinX(v148);
        v149.origin.double x = *p_x;
        v149.origin.CGFloat y = v37->frame.origin.y;
        v149.size.CGFloat width = v37->frame.size.width;
        v149.size.CGFloat height = v37->frame.size.height;
        double v40 = MinX - CGRectGetMinX(v149);
        double v41 = &mChapterInfo[v36];
        p_unint64_t firstRelativePageToShowDuringBackgroundScroll = &v41->firstRelativePageToShowDuringBackgroundScroll;
        unint64_t firstRelativePageToShowDuringBackgroundScroll = v41->firstRelativePageToShowDuringBackgroundScroll;
        if (v40 >= v108)
        {
          float v45 = (v40 - v114) / v5;
          float v46 = floorf(v45);
          if (v46 < 0.0) {
            float v46 = 0.0;
          }
          unint64_t v44 = (uint64_t)(float)(v46 + (float)firstRelativePageToShowDuringBackgroundScroll);
        }
        else
        {
          unint64_t v44 = 0;
        }
        unint64_t numberOfPages = v41->numberOfPages;
        p_unint64_t numberOfPages = &v41->numberOfPages;
        unint64_t v47 = numberOfPages;
        while (v44 < firstRelativePageToShowDuringBackgroundScroll + v47)
        {
          v150.origin.double x = *p_x;
          v150.origin.CGFloat y = v37->frame.origin.y;
          v150.size.CGFloat width = v37->frame.size.width;
          v150.size.CGFloat height = v37->frame.size.height;
          double v50 = CGRectGetMinX(v150);
          v151.origin.double x = rect1;
          v151.origin.CGFloat y = y;
          v151.size.CGFloat width = v23;
          v151.size.CGFloat height = height;
          if (v114 + v50 + (double)(v44 - firstRelativePageToShowDuringBackgroundScroll) * v5 >= CGRectGetMaxX(v151)) {
            break;
          }
          if (v44 == *p_firstRelativePageToShowDuringBackgroundScroll) {
            unint64_t v51 = 0;
          }
          else {
            unint64_t v51 = v44;
          }
          double v52 = [(THChapterBrowserController *)rect1_24 p_thumbShownForChapter:v37->chapterNumber index:v51];
          if (v52)
          {
            [v120 removeObjectIdenticalTo:v52];
            [v119 removeObjectIdenticalTo:v52];
          }

          unint64_t v44 = v51 + 1;
          unint64_t v47 = *p_numberOfPages;
          unint64_t firstRelativePageToShowDuringBackgroundScroll = *p_firstRelativePageToShowDuringBackgroundScroll;
        }
      }
    }
    ++v36;
  }
  while (v36 != 3);
  uint64_t v53 = 0;
  do
  {
    uint64_t v110 = v53;
    rect1_8 = &mChapterInfo[v53];
    p_tileModel = (id *)&rect1_8->tileModel;
    if (rect1_8->tileModel)
    {
      v54 = &rect1_8->frame.origin.x;
      v152.origin.double x = rect1;
      v152.origin.CGFloat y = y;
      v152.size.CGFloat width = v23;
      v152.size.CGFloat height = height;
      if (CGRectIntersectsRect(v152, rect1_8->frame))
      {
        v153.origin.double x = rect1;
        v153.origin.CGFloat y = y;
        v153.size.CGFloat width = v23;
        v153.size.CGFloat height = height;
        double v55 = CGRectGetMinX(v153);
        v154.origin.double x = *v54;
        v154.origin.CGFloat y = rect1_8->frame.origin.y;
        v154.size.CGFloat width = rect1_8->frame.size.width;
        v154.size.CGFloat height = rect1_8->frame.size.height;
        double v56 = v55 - CGRectGetMinX(v154);
        v112 = &mChapterInfo[v110];
        unint64_t v57 = v112->firstRelativePageToShowDuringBackgroundScroll;
        rect1_16 = &v112->firstRelativePageToShowDuringBackgroundScroll;
        if (v56 >= v108)
        {
          float v59 = (v56 - v114) / v5;
          float v60 = floorf(v59);
          if (v60 < 0.0) {
            float v60 = 0.0;
          }
          unint64_t v58 = (uint64_t)(float)(v60 + (float)v57);
        }
        else
        {
          unint64_t v58 = 0;
        }
        unint64_t v61 = v112->numberOfPages;
        v113 = &v112->numberOfPages;
        while (1)
        {
          if (v58 >= v57 + v61) {
            goto LABEL_92;
          }
          v155.origin.double x = *v54;
          v155.origin.CGFloat y = rect1_8->frame.origin.y;
          v155.size.CGFloat width = rect1_8->frame.size.width;
          v155.size.CGFloat height = rect1_8->frame.size.height;
          double v62 = CGRectGetMinX(v155);
          v156.origin.double x = rect1;
          v156.origin.CGFloat y = y;
          v156.size.CGFloat width = v23;
          v156.size.CGFloat height = height;
          if (v114 + v62 + (double)(v58 - v57) * v5 >= CGRectGetMaxX(v156)) {
            goto LABEL_92;
          }
          unint64_t v63 = *rect1_16;
          uint64_t v64 = v58 == *rect1_16 ? 0 : v58;
          v157.origin.double x = *v54;
          v157.origin.CGFloat y = rect1_8->frame.origin.y;
          v157.size.CGFloat width = rect1_8->frame.size.width;
          v157.size.CGFloat height = rect1_8->frame.size.height;
          double v65 = CGRectGetMinX(v157);
          v66 = [(THChapterBrowserController *)rect1_24 view];
          [v66 safeAreaInsets];
          double v68 = v67;
          if (v58 == v63)
          {
            unint64_t v69 = 0;
            double v70 = -0.0;
          }
          else
          {
            unint64_t v69 = v58 - *rect1_16;
            double v70 = v114;
          }

          v71 = [(THChapterBrowserController *)rect1_24 p_thumbShownForChapter:rect1_8->chapterNumber index:v64];
          double v72 = v70 + v65 + v68 + (double)v69 * v5;
          if (!v71) {
            break;
          }
LABEL_87:
          v93 = [(THTOCViewController *)rect1_24 delegate];
          -[THPageThumbnailView setIsCurrentPage:](v71, "setIsCurrentPage:", [v93 chapterBrowserController:rect1_24 isCurrentlyDisplayedPageForRelativePageIndex:v64 andChapterIndex:rect1_8->chapterNumber]);

          [(THPageThumbnailView *)v71 frame];
          if (v94 != v72) {
            [(THPageThumbnailView *)v71 setFrame:v72];
          }
          if (!v64) {
            unint64_t v58 = *rect1_16;
          }

          ++v58;
          unint64_t v61 = *v113;
          unint64_t v57 = *rect1_16;
        }
        if (v58 == v63)
        {
          uint64_t v73 = [v120 lastObject];
          double v74 = v108;
          double v75 = v105;
          if (v73)
          {
            v71 = (THPageThumbnailView *)v73;
            [v120 removeLastObject];
            goto LABEL_69;
          }
        }
        else
        {
          v71 = [v119 lastObject];
          double v74 = v5;
          double v75 = r1;
          if (v71)
          {
            [v119 removeLastObject];
            goto LABEL_69;
          }
        }
        [(THScrollViewWithPassthrough *)rect1_24->mPagesScrollView bounds];
        v71 = -[THPageThumbnailView initWithFrame:isFirstThumbnail:delegate:]([THPageThumbnailView alloc], "initWithFrame:isFirstThumbnail:delegate:", v58 == v63, rect1_24, v72, CGRectGetHeight(v158) - v75, v74, v75);
        mPagesScrollView = rect1_24->mPagesScrollView;
        if (v104) {
          -[THScrollViewWithPassthrough insertSubview:belowSubview:](mPagesScrollView, "insertSubview:belowSubview:", v71);
        }
        else {
          [(THScrollViewWithPassthrough *)mPagesScrollView addSubview:v71];
        }
        v77 = [(THTOCViewController *)rect1_24 delegate];
        unsigned __int8 v78 = [v77 isTwoUpForChapterBrowserController:rect1_24];

        if ((v78 & 1) == 0) {
          [(THPageThumbnailView *)v71 setupFreeTransformWithDelegate:rect1_24];
        }
LABEL_69:
        [(THPageThumbnailView *)v71 setPageIndex:v64];
        v79 = [(THChapterBrowserController *)rect1_24 thumbnailsHiddenForPinch];
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_AB73C;
        v129[3] = &unk_458CA8;
        v129[4] = v64;
        v80 = [v79 objectsPassingTest:v129];
        BOOL v81 = [v80 count] != 0;

        [(THPageThumbnailView *)v71 setHidden:(v110 == 1) & v81];
        [(THPageThumbnailView *)v71 setChapterIndex:rect1_8->chapterNumber];
        id v82 = *p_tileModel;
        v83 = [v82 displayPageNumberForPageIndex:((char *)[v82 pageIndex]) + v64];
        if (!v83)
        {
          v84 = [(THTOCViewController *)rect1_24 delegate];
          v83 = [v84 chapterBrowserController:rect1_24 pageNumberStringForRelativePageIndex:v64 andChapterIndex:rect1_8->chapterNumber];
        }
        [(THPageThumbnailView *)v71 setPageNumberText:v83];
        TSUScreenScale();
        id v85 = *p_tileModel;
        if (v86 <= 1.0)
        {
          v87 = [v85 tinyThumbs];
          if (v64 < (unint64_t)[v87 count])
          {
            v88 = [*p_tileModel tinyThumbs];
            uint64_t v89 = [v88 objectAtIndex:v64];
            goto LABEL_76;
          }
        }
        else
        {
          v87 = [v85 largerThumbs];
          if (v64 < (unint64_t)[v87 count])
          {
            v88 = [*p_tileModel largerThumbs];
            uint64_t v89 = [v88 objectAtIndex:v64];
LABEL_76:
            v90 = (void *)v89;

LABEL_78:
            if (v90)
            {
              uint64_t v91 = v58 == v63 || v107;
              [(THPageThumbnailView *)v71 setImageData:v90 immediate:v91];
            }
            BOOL v92 = v64 >= 1 && v64 == *v113 + *rect1_16 - 1;
            [(THPageThumbnailView *)v71 setHasRightBorder:v92];

            goto LABEL_87;
          }
        }
        v90 = 0;
        goto LABEL_78;
      }
    }
LABEL_92:
    uint64_t v53 = v110 + 1;
  }
  while (v110 != 2);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v95 = v120;
  id v96 = [v95 countByEnumeratingWithState:&v125 objects:v139 count:16];
  if (v96)
  {
    uint64_t v97 = *(void *)v126;
    do
    {
      for (k = 0; k != v96; k = (char *)k + 1)
      {
        if (*(void *)v126 != v97) {
          objc_enumerationMutation(v95);
        }
        [*(id *)(*((void *)&v125 + 1) + 8 * (void)k) removeFromSuperview];
      }
      id v96 = [v95 countByEnumeratingWithState:&v125 objects:v139 count:16];
    }
    while (v96);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v99 = v119;
  id v100 = [v99 countByEnumeratingWithState:&v121 objects:v138 count:16];
  if (v100)
  {
    uint64_t v101 = *(void *)v122;
    do
    {
      for (m = 0; m != v100; m = (char *)m + 1)
      {
        if (*(void *)v122 != v101) {
          objc_enumerationMutation(v99);
        }
        [*(id *)(*((void *)&v121 + 1) + 8 * (void)m) removeFromSuperview];
      }
      id v100 = [v99 countByEnumeratingWithState:&v121 objects:v138 count:16];
    }
    while (v100);
  }

  +[CATransaction commit];
  if (v104)
  {
    [(THScrollViewWithPassthrough *)rect1_24->mPagesScrollView bringSubviewToFront:v104];
    v103 = [v104 layer];
    [v103 setZPosition:2.0];
  }
  [v99 makeObjectsPerformSelector:"teardown"];
  [v95 makeObjectsPerformSelector:"teardown"];
}

- (BOOL)p_isTOCLandscape
{
  double v2 = [(THTOCViewController *)self bookPropertiesDelegate];
  unsigned __int8 v3 = [v2 bookIsPaginatedForLandscape];

  return v3;
}

- (int)p_chapterIndexForCurrentScrollPosition
{
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v4 = v3;
  [(THChapterBrowserController *)self chapterWidth];
  return (int)(v4 / v5 + 0.5);
}

- (void)p_recoverFromFastScrollingDesynchronization
{
  if ([(THChapterViewController *)self->mChapterViewControllers[1] chapterIndex] != self->mChapterIndex)
  {
    -[THChapterBrowserController p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:](self, "p_setupChapterViewControllerAtIndex:withChapterIndex:allowThumbnail:", 1);
  }
}

- (void)p_backgroundScrollingDidEnd
{
  self->mBackgroundSwipeDidInitiateScroll = 0;
  uint64_t v3 = [(THChapterBrowserController *)self p_chapterIndexForCurrentScrollPosition];
  unint64_t mBackgroundSwipeBeginningChapter = self->mBackgroundSwipeBeginningChapter;
  [(THChapterBrowserController *)self p_setChapterIndex:v3 forScrub:0 stillScrolling:0];
  [(THChapterBrowserController *)self p_recoverFromFastScrollingDesynchronization];
  p_mUpdatingScrollView = &self->mUpdatingScrollView;
  objc_storeStrong((id *)&self->mUpdatingScrollView, self->mBackgroundScrollView);
  if (self->mPullThroughInProgress)
  {
    [(THChapterBrowserController *)self p_updatePagesScrollView];
  }
  else
  {
    [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:0 firstVisibleRelativePage:0 resetContentOffset:1];
    if (mBackgroundSwipeBeginningChapter == v3
      && (double mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag,
          mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag > 0.0))
    {
      [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
      [(THScrollViewWithPassthrough *)self->mPagesScrollView setContentOffset:mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag];
      self->mPageThumbScrollerStartContentOffset = self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag;
      self->mPreservedThumbnailOffset.double x = self->mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag;
    }
    else
    {
      self->mPreservedThumbnailOffset.double x = 0.0;
      self->mPageThumbScrollerStartContentOffset = 0.0;
      self->double mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = 0.0;
    }
  }
  double v7 = *p_mUpdatingScrollView;
  *p_mUpdatingScrollView = 0;

  if (!self->mDraggingInScrubber)
  {
    [(THChapterBrowserController *)self p_startIntroMediaIfNecessary];
    if (!v3) {
      [(THChapterBrowserController *)self p_updatePageControl];
    }
  }
  [(THScrollViewWithPassthrough *)self->mPagesScrollView setUserInteractionEnabled:1];
  mChapterPageControl = self->mChapterPageControl;

  [(THChapterBrowserScrubbablePageControl *)mChapterPageControl setUserInteractionEnabled:1];
}

- (double)p_pagesScrollViewNextChapterThreshhold
{
  [(THChapterBrowserController *)self thumbSize];
  double v4 = v3;
  unsigned int v5 = [(THChapterBrowserController *)self im_isCompactWidth];
  double result = v4 * 0.5;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)p_pageThumbScrollingDidEnd
{
  unint64_t mChapterIndex = self->mChapterIndex;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
  double v5 = v4;
  CGFloat MinX = CGRectGetMinX(self->mChapterInfo[1].frame);
  double MaxX = CGRectGetMaxX(self->mChapterInfo[1].frame);
  [(THChapterBrowserController *)self p_pagesScrollViewNextChapterThreshhold];
  double v9 = v8;
  if (v5 < MinX)
  {
    double v10 = MinX - v8;
    if (self->mChapterIndex && v5 < v10)
    {
      --mChapterIndex;
      self->mPageThumbScrollerStartContentOffset = MinX;
    }
  }
  [(THChapterBrowserController *)self chapterWidth];
  if (v5 + v12 >= MaxX)
  {
    [(THChapterBrowserController *)self chapterWidth];
    if (v5 + v13 >= MaxX + v9)
    {
      double v14 = [(THTOCViewController *)self dataSource];
      double v15 = (char *)[v14 toc:self numberOfTilesInDivision:0];

      if (mChapterIndex < (unint64_t)(v15 - 1))
      {
        ++mChapterIndex;
        [(THChapterBrowserController *)self chapterWidth];
        self->mPageThumbScrollerStartContentOffset = MaxX - v16;
      }
    }
  }
  if (mChapterIndex != self->mChapterIndex)
  {
    self->mPullThroughInProgress = 1;
    [(THScrollView *)self->mBackgroundScrollView setScrollEnabled:0];
    mBackgroundScrollView = self->mBackgroundScrollView;
    [(THChapterBrowserController *)self chapterWidth];
    -[THScrollView setContentOffset:animated:](mBackgroundScrollView, "setContentOffset:animated:", 1, v18 * (double)mChapterIndex, 0.0);
    CGFloat v19 = self->mBackgroundScrollView;
    [(THScrollView *)v19 setScrollEnabled:1];
  }
}

- (void)p_updatePageControl
{
  double v3 = [(THTOCViewController *)self dataSource];
  double v4 = (char *)[v3 toc:self numberOfTilesInDivision:0];
  double v5 = &v4[[(THChapterBrowserController *)self hasIntroPage]];

  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setNumberOfPages:v5];
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setCurrentPage:(char *)[(THChapterBrowserController *)self chapterIndex]+ [(THChapterBrowserController *)self hasIntroPage]- (v6 < 0.0)];
  mChapterPageControl = self->mChapterPageControl;

  [(THChapterBrowserScrubbablePageControl *)mChapterPageControl centerHorizontallyInSuperview];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGFloat v19 = (THScrollView *)a3;
  if (self->mBackgroundScrollView == v19)
  {
    double v4 = [(THTOCViewController *)self delegate];
    [v4 cancelPreloadOfContentNodesForChapterBrowserController:self];

    self->mBackgroundSwipeDidInitiateScroll = 1;
    mPagesScrollView = self->mPagesScrollView;
    [(THScrollViewWithPassthrough *)mPagesScrollView contentOffset];
    -[THScrollViewWithPassthrough setContentOffset:animated:](mPagesScrollView, "setContentOffset:animated:", 0);
    if (([(THScrollView *)v19 isDecelerating] & 1) == 0)
    {
      self->unint64_t mBackgroundSwipeBeginningChapter = self->mChapterIndex;
      [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
      double v7 = v6;
      double MinX = CGRectGetMinX(self->mChapterInfo[1].frame);
      [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
      self->mPageThumbScrollerStartContentOffset = v9;
      self->double mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag = v9;
      [(THChapterBrowserController *)self thumbSize];
      double v11 = v10;
      [(THChapterBrowserController *)self firstThumbOverlap];
      double v12 = v7 - MinX;
      *(float *)&double v13 = (v12 - v13) / v11;
      float v14 = floorf(*(float *)&v13);
      if (v14 > 0.0) {
        float v15 = v14;
      }
      else {
        float v15 = 0.0;
      }
      double v16 = 0.0;
      if ([(THChapterBrowserController *)self maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag] <= (uint64_t)v15)double v16 = (double)((uint64_t)v15- [(THChapterBrowserController *)self maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag]); {
      ++self->mSuspendThumbViewUpdates;
      }
      [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:1 firstVisibleRelativePage:(uint64_t)v15 resetContentOffset:1];
      --self->mSuspendThumbViewUpdates;
      double v17 = CGRectGetMinX(self->mChapterInfo[1].frame);
      [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
      [(THScrollViewWithPassthrough *)self->mPagesScrollView setContentOffset:v12 + v17 - v11 * v16];
      [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
      self->mPageThumbScrollerStartContentOffset = v18;
      [(THChapterBrowserController *)self p_updatePageThumbnails:1];
    }
    [(THScrollViewWithPassthrough *)self->mPagesScrollView setUserInteractionEnabled:0];
  }
  [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setUserInteractionEnabled:0];
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4 = (THScrollViewWithPassthrough *)a3;
  double v65 = v4;
  if ((THScrollViewWithPassthrough *)self->mBackgroundScrollView != v4 || self->mDeferBackgroundScrollViewScrolls)
  {
    if (self->mPagesScrollView == v4 && !self->mDeferPagesScrollViewScrolls)
    {
      [(THChapterBrowserController *)self p_updatePageThumbnails:1];
      if (self->mPullThroughInProgress)
      {
        p_mUpdatingScrollView = &self->mUpdatingScrollView;
        if (self->mUpdatingScrollView != (UIScrollView *)self->mBackgroundScrollView)
        {
          objc_storeStrong((id *)&self->mUpdatingScrollView, self->mPagesScrollView);
          unint64_t mChapterIndex = self->mChapterIndex;
          [(THChapterBrowserController *)self chapterWidth];
          -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v7 * (double)mChapterIndex, 0.0);
          double v8 = *p_mUpdatingScrollView;
          *p_mUpdatingScrollView = 0;
LABEL_75:

          goto LABEL_76;
        }
      }
    }
    goto LABEL_76;
  }
  [(THScrollViewWithPassthrough *)v4 contentOffset];
  double v10 = v9;
  unint64_t v11 = self->mChapterIndex;
  if (v11)
  {
    [(THChapterBrowserController *)self chapterWidth];
    if (v10 < v12 * (double)(v11 - 1))
    {
LABEL_14:
      [(THChapterBrowserController *)self p_setChapterIndex:[(THChapterBrowserController *)self p_chapterIndexForCurrentScrollPosition] forScrub:0 stillScrolling:1];
      goto LABEL_16;
    }
    unint64_t v13 = self->mChapterIndex;
  }
  else
  {
    unint64_t v13 = 0;
  }
  float v14 = [(THTOCViewController *)self dataSource];
  if (v13 + 1 >= (unint64_t)[v14 toc:self numberOfTilesInDivision:0])
  {

    goto LABEL_16;
  }
  unint64_t v15 = self->mChapterIndex;
  [(THChapterBrowserController *)self chapterWidth];
  double v17 = v16 * (double)(v15 + 1);

  if (v10 > v17) {
    goto LABEL_14;
  }
LABEL_16:
  double v18 = &self->mUpdatingScrollView;
  if (self->mUpdatingScrollView == &self->mPagesScrollView->super
    || self->mSuspendThumbViewUpdates
    || self->mDraggingInScrubber)
  {
    goto LABEL_60;
  }
  objc_storeStrong((id *)&self->mUpdatingScrollView, self->mBackgroundScrollView);
  uint64_t v19 = 0;
  unint64_t v20 = 0;
  mChapterInfo = self->mChapterInfo;
  unint64_t v22 = 0xFFFFFFFFLL;
  do
  {
    unint64_t chapterNumber = mChapterInfo[v19].chapterNumber;
    if (v22 >= chapterNumber) {
      unint64_t v24 = mChapterInfo[v19].chapterNumber;
    }
    else {
      unint64_t v24 = v22;
    }
    if (v20 <= chapterNumber) {
      unint64_t v25 = mChapterInfo[v19].chapterNumber;
    }
    else {
      unint64_t v25 = v20;
    }
    if (chapterNumber != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v20 = v25;
      unint64_t v22 = v24;
    }
    ++v19;
  }
  while (v19 != 3);
  unint64_t v26 = self->mChapterIndex;
  if (v26 <= v20 && v26 >= v22)
  {
    if (mChapterInfo->chapterNumber != 0x7FFFFFFFFFFFFFFFLL
      || self->mPullThroughInProgress
      || (BOOL mBackgroundSwipeDidInitiateScroll = self->mBackgroundSwipeDidInitiateScroll))
    {
      [(THChapterBrowserController *)self p_updatePagesScrollView];
      goto LABEL_39;
    }
  }
  else
  {
    BOOL mBackgroundSwipeDidInitiateScroll = self->mBackgroundSwipeDidInitiateScroll;
  }
  [(THChapterBrowserController *)self p_resetPagesScrollViewAndCapThumbCount:mBackgroundSwipeDidInitiateScroll firstVisibleRelativePage:0 resetContentOffset:1];
LABEL_39:
  double v29 = [(THTOCViewController *)self dataSource];
  id v30 = [v29 toc:self numberOfTilesInDivision:0];

  unint64_t v31 = self->mChapterInfo[1].chapterNumber;
  unint64_t v64 = (unint64_t)v30;
  if (v31)
  {
    BOOL v32 = 1;
  }
  else
  {
    uint64_t v33 = [(THChapterBrowserController *)self introMediaViewController];
    BOOL v32 = v33 != 0;
  }
  double v34 = self->mChapterViewControllers[1];
  if (v34)
  {
    mBackgroundsView = self->mBackgroundsView;
    uint64_t v36 = [(THChapterViewController *)v34 view];
    [v36 frame];
    double v38 = v37;
    double v40 = v39;
    double v41 = [(THChapterBrowserController *)self view];
    -[UIView convertPoint:toView:](mBackgroundsView, "convertPoint:toView:", v41, v38, v40);
    double v43 = v42;

    [(THChapterBrowserController *)self chapterWidth];
    double v45 = v43 / v44;
    if (self->mPullThroughInProgress) {
      double v46 = self->mPageThumbScrollerStartContentOffset - v43;
    }
    else {
      double v46 = v45 >= 0.0
    }
          ? (1.0 - v45) * self->mPageThumbScrollerStartContentOffset
          : self->mPageThumbScrollerStartContentOffset
          - v45 * (CGRectGetMaxX(self->mChapterInfo[1].frame) - self->mPageThumbScrollerStartContentOffset);
    BOOL v47 = v45 >= 0.0 && v32;
    BOOL v48 = v45 > 0.0 || v31 + 1 >= v64;
    if (!v48 || v47) {
      -[THScrollViewWithPassthrough setContentOffset:](self->mPagesScrollView, "setContentOffset:", v46, 0.0);
    }
  }
  double v50 = *v18;
  *double v18 = 0;

LABEL_60:
  [(THChapterBrowserController *)self _updateContentOffsets];
  [(THScrollView *)self->mBackgroundScrollView contentOffset];
  double v51 = 0.0;
  if (v52 <= 0.0)
  {
    [(THScrollView *)self->mBackgroundScrollView contentOffset];
    double v51 = v53;
  }
  [(THChapterBrowserController *)self chapterWidth];
  if (vabdd_f64(-v51, v54) >= 0.00999999978)
  {
    float v59 = [(THChapterBrowserController *)self introMediaViewController];
    [v59 prepareControlsForTOC];

    [(UIView *)self->mChapterPageControlWrapper setAlpha:1.0];
    [(THChapterBrowserController *)self chapterWidth];
    if (v51 >= v60 * -0.5)
    {
      self->mDidAutoHideToolbar = 0;
    }
    else if (!self->mDidAutoHideToolbar && !self->_flags.transitioning)
    {
      unint64_t v61 = [(THTOCViewController *)self delegate];
      [v61 TOCHideToolbarAnimated:1];

      self->mDidAutoHideToolbar = 1;
    }
  }
  else
  {
    double v55 = [(THTOCViewController *)self delegate];
    double v56 = [v55 introMediaViewControllerForChapterBrowserController:self];
    unsigned int v57 = [v56 isMovie];

    if (v57 && !self->mDraggingInScrubber) {
      [(UIView *)self->mChapterPageControlWrapper setAlpha:0.0];
    }
    if (!self->mDidAutoHideToolbar)
    {
      unint64_t v58 = [(THTOCViewController *)self delegate];
      [v58 TOCHideToolbarAnimated:0];

      self->mDidAutoHideToolbar = 1;
    }
  }
  if ([(THChapterBrowserController *)self hasIntroPage])
  {
    [(THScrollView *)self->mBackgroundScrollView contentOffset];
    double v63 = v62;
    double v8 = [(THChapterBrowserController *)self backgroundScrollView];
    [v8 setBounces:v63 >= 0.0];
    goto LABEL_75;
  }
LABEL_76:
}

- (_NSRange)p_chapterRelativePageIndexesCurrentlyVisibleInRect:(CGRect)a3 forChapterFrame:(CGRect)a4 chapterPageCount:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (!CGRectIntersectsRect(a3, a4)) {
    goto LABEL_7;
  }
  v29.origin.CGFloat x = v13;
  v29.origin.CGFloat y = v12;
  v29.size.CGFloat width = v11;
  v29.size.CGFloat height = v10;
  CGFloat rect = height;
  double MinX = CGRectGetMinX(v29);
  v30.origin.CGFloat x = v13;
  v30.origin.CGFloat y = v12;
  v30.size.CGFloat width = v11;
  v30.size.CGFloat height = v10;
  double MaxX = CGRectGetMaxX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = rect;
  double v17 = CGRectGetMinX(v31);
  [(THChapterBrowserController *)self thumbSize];
  double v19 = v18;
  [(THChapterBrowserController *)self firstThumbOverlap];
  double v21 = v17 + v20;
  if (v21 >= MaxX || a5 == 0)
  {
LABEL_7:
    NSUInteger v23 = 0;
    NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v23 = 0;
    unint64_t v24 = 1;
    NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v21 >= MinX) {
        ++v23;
      }
      if (v21 >= MinX && v25 == 0x7FFFFFFFFFFFFFFFLL) {
        NSUInteger v25 = v24 - 1;
      }
      double v21 = v19 + v21;
    }
    while (v21 < MaxX && v24++ < a5);
  }
  result.length = v23;
  result.location = v25;
  return result;
}

- (void)p_preloadContentNodesForVisibleThumbnails
{
  [(THChapterBrowserController *)self thumbSize];
  double v4 = v3;
  [(THChapterBrowserController *)self thumbSize];
  CGFloat v6 = v5;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
  CGFloat v8 = v7 + v4 * -0.5;
  [(THScrollViewWithPassthrough *)self->mPagesScrollView frame];
  CGFloat v9 = v4 + CGRectGetWidth(v25);
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentSize];
  v28.size.double width = v10;
  v26.origin.double y = 0.0;
  v28.origin.double x = 0.0;
  v28.origin.double y = 0.0;
  v26.origin.double x = v8;
  v26.size.double width = v9;
  v26.size.double height = v6;
  v28.size.double height = v6;
  CGRect v27 = CGRectIntersection(v26, v28);
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  uint64_t v15 = 0;
  mChapterInfo = self->mChapterInfo;
  do
  {
    unint64_t chapterNumber = mChapterInfo[v15].chapterNumber;
    if (chapterNumber != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v18 = -[THChapterBrowserController p_chapterRelativePageIndexesCurrentlyVisibleInRect:forChapterFrame:chapterPageCount:](self, "p_chapterRelativePageIndexesCurrentlyVisibleInRect:forChapterFrame:chapterPageCount:", mChapterInfo[v15].numberOfPages, x, y, width, height, mChapterInfo[v15].frame.origin.x, mChapterInfo[v15].frame.origin.y, mChapterInfo[v15].frame.size.width, mChapterInfo[v15].frame.size.height);
      if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v20 = v18;
        uint64_t v21 = v19;
        unint64_t v22 = [(THTOCViewController *)self delegate];
        [v22 chapterBrowserController:self preloadContentNodesForPageRange:v20 chapterIndex:v21];
      }
    }
    ++v15;
  }
  while (v15 != 3);
  [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
  self->mPreservedThumbnailOffset.double x = v23;
  self->mPreservedThumbnailOffset.double y = v24;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat v6 = (THScrollViewWithPassthrough *)a3;
  double v16 = v6;
  if ((THScrollViewWithPassthrough *)self->mBackgroundScrollView == v6)
  {
    if (!v4) {
      [(THChapterBrowserController *)self p_backgroundScrollingDidEnd];
    }
  }
  else if (self->mPagesScrollView == v6)
  {
    if (v4)
    {
      [(THScrollViewWithPassthrough *)v6 contentOffset];
      double v8 = v7;
      double MinX = CGRectGetMinX(self->mChapterInfo[1].frame);
      double MaxX = CGRectGetMaxX(self->mChapterInfo[1].frame);
      [(THChapterBrowserController *)self p_pagesScrollViewNextChapterThreshhold];
      double v12 = v11;
      double v13 = MinX - v11;
      if (self->mChapterIndex) {
        BOOL v14 = v8 < v13;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14
        || self->mChapterInfo[2].chapterNumber != 0x7FFFFFFFFFFFFFFFLL
        && ([(THChapterBrowserController *)self chapterWidth], v8 + v15 >= MaxX + v12))
      {
        self->mPullThroughInProgress = 1;
      }
    }
    else
    {
      [(THChapterBrowserController *)self p_preloadContentNodesForVisibleThumbnails];
      [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setUserInteractionEnabled:1];
    }
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  double v5 = (THScrollViewWithPassthrough *)a3;
  if (self->mPullThroughInProgress && self->mPagesScrollView == v5)
  {
    [(THScrollViewWithPassthrough *)v5 contentOffset];
    -[THScrollViewWithPassthrough setContentOffset:animated:](v5, "setContentOffset:animated:", 0);
    [(THScrollViewWithPassthrough *)self->mPagesScrollView contentOffset];
    self->mPageThumbScrollerStartContentOffset = v4;
    [(THChapterBrowserController *)self p_pageThumbScrollingDidEnd];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4 = (THScrollViewWithPassthrough *)a3;
  double v5 = v4;
  if ((THScrollViewWithPassthrough *)self->mBackgroundScrollView == v4)
  {
    [(THChapterBrowserController *)self p_backgroundScrollingDidEnd];
  }
  else if (self->mPagesScrollView == v4)
  {
    if (!self->mBackgroundSwipeDidInitiateScroll) {
      [(THChapterBrowserController *)self p_preloadContentNodesForVisibleThumbnails];
    }
    [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl setUserInteractionEnabled:1];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_ACC60;
  v5[3] = &unk_458C60;
  id v6 = a3;
  double v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)p_pageThumbnailViewForPageIndex:(unint64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(THChapterBrowserController *)self thumbnailSubviews];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v5);
      }
      objc_opt_class();
      CGFloat v9 = TSUDynamicCast();
      CGFloat v10 = v9;
      if (v9)
      {
        if ([v9 chapterIndex] == self->mChapterIndex && objc_msgSend(v10, "pageIndex") == (id)a3) {
          break;
        }
      }

      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    CGFloat v10 = 0;
  }

  return v10;
}

- (id)p_pageThumbnailViewForModelLink:(id)a3
{
  id v4 = a3;
  double v5 = [(THTOCViewController *)self delegate];
  id v6 = [v5 chapterBrowserController:self relativePageIndexForLink:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(THChapterBrowserController *)self p_pageThumbnailViewForPageIndex:v6];
  }

  return v7;
}

- (CGRect)p_beginTransitionFromPageThumbnail:(id)a3 transformView:(id)a4 freeTransform:(BOOL)a5 firstThumbNailToTransition:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v6)
  {
    [(NSMutableArray *)self->_thumbnailViewsInTransition removeAllObjects];
    long long v12 = +[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher];
    [v12 suspend];

    long long v13 = [(THChapterBrowserController *)self introMediaViewController];
    [v13 stop];

    long long v14 = [(THTOCViewController *)self delegate];
    [v14 chapterBrowserController:self willTransitionToPageIndex:[v10 pageIndex] chapterIndex:[v10 chapterIndex] freeTransform:v7];
  }
  long long v15 = [(THTOCViewController *)self delegate];
  [v15 chapterBrowserController:self rectForRelativePageIndex:[v10 pageIndex] chapterIndex:[v10 chapterIndex]];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  CGFloat v24 = [(THTOCViewController *)self dataSource];
  BOOL v60 = v7;
  CGRect v25 = [v24 toc:self tileModelForChapterIndex:[v10 chapterIndex]];

  CGRect v26 = [(THTOCViewController *)self delegate];
  CGRect v27 = [v26 canvasScrollViewForChapterBrowserController:self];

  if (v6)
  {
    CGRect v28 = [v27 superview];
    [(THChapterBrowserController *)self setOriginalCanvasScrollViewSuperview:v28];

    [v27 frame];
    -[THChapterBrowserController setOriginalCanvasScrollViewFrame:](self, "setOriginalCanvasScrollViewFrame:");
  }
  CGRect v29 = objc_alloc_init(THPageThumbnailViewInTransition);
  [(THPageThumbnailViewInTransition *)v29 setThumbnailView:v10];
  [v10 frame];
  -[THPageThumbnailViewInTransition setOriginalThumbnailFrame:](v29, "setOriginalThumbnailFrame:");
  [(NSMutableArray *)self->_thumbnailViewsInTransition addObject:v29];
  CGRect v30 = [(THChapterBrowserController *)self view];
  CGRect v31 = [v30 superview];
  [v11 center];
  double v33 = v32;
  double v35 = v34;
  uint64_t v36 = [v11 superview];
  [v31 convertPoint:v36 fromView:v33];
  [v11 setCenter:];

  double v37 = [(THChapterBrowserController *)self view];
  double v38 = [v37 superview];
  [v38 addSubview:v11];

  id v39 = [v10 pageIndex];
  double v40 = [v25 largerThumbs];
  if (v39 >= [v40 count])
  {

    double v42 = 0;
  }
  else
  {
    double v41 = [v25 largerThumbs];
    double v42 = [v41 objectAtIndex:[v10 pageIndex]];

    if (v42) {
      [v10 setImage:[TSDBitmapImageProvider CGImageForImageData:v42]];
    }
  }
  [v10 bounds];
  TSDCenterOfRect();
  [v27 setCenter:];
  double v43 = [(THTOCViewController *)self delegate];
  if ([v43 isTwoUpForChapterBrowserController:self])
  {
    double v44 = [(THTOCViewController *)self delegate];
    unsigned int v45 = [v44 isSinglePageInChapterForChapterBrowserController:self chapterIndex:[v10 chapterIndex]];

    if (v45) {
      double v46 = 2.0;
    }
    else {
      double v46 = 1.0;
    }
  }
  else
  {

    double v46 = 1.0;
  }
  [v10 bounds];
  double v48 = v47;
  [v27 bounds];
  double v50 = v49;
  [v10 bounds];
  double v52 = v51;
  [v27 bounds];
  CGAffineTransformMakeScale(&v62, v46 * v52 / v53, v48 / v50);
  CGAffineTransform v61 = v62;
  [v27 setTransform:&v61];
  [v10 setBorderVisible:0];
  [v10 setCanvasScrollView:v27 rasterize:v60];
  if ((unint64_t)[v10 pageIndex] >= 2)
  {
    double v54 = -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v10 pageIndex] - 1);
    [v54 setHasRightBorder:1];
  }
  double v55 = -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v10 pageIndex] + 1);
  [v55 setHasLeftBorder:1];

  double v56 = v17;
  double v57 = v19;
  double v58 = v21;
  double v59 = v23;
  result.size.double height = v59;
  result.size.double width = v58;
  result.origin.double y = v57;
  result.origin.double x = v56;
  return result;
}

- (void)p_cleanupAfterTransitionFromPageThumbnail:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[(NSMutableArray *)self->_thumbnailViewsInTransition count];
  BOOL v6 = [(THTOCViewController *)self delegate];
  double v35 = [v6 canvasScrollViewForChapterBrowserController:self];

  [v4 clearHighlightRect];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v7 = self->_thumbnailViewsInTransition;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v38;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
      id v12 = [v11 thumbnailView];
      BOOL v13 = v12 == v4;

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    long long v15 = v14;
    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  double v16 = +[TSUAssertionHandler currentHandler];
  double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserController p_cleanupAfterTransitionFromPageThumbnail:]");
  double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserController.mm"];
  [v16 handleFailureInFunction:v17 file:v18 lineNumber:2996 description:@"invalid nil value for '%s'", "thumbnailInTransition"];

  long long v15 = 0;
LABEL_12:
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    double v19 = [(THChapterBrowserController *)self originalCanvasScrollViewSuperview];
    [v19 addSubview:v35];

    long long v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v36[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v36[1] = v20;
    v36[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v35 setTransform:v36];
    [(THChapterBrowserController *)self originalCanvasScrollViewFrame];
    [v35 setFrame:];
    -[THChapterBrowserController setOriginalCanvasScrollViewFrame:](self, "setOriginalCanvasScrollViewFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    [(THChapterBrowserController *)self setOriginalCanvasScrollViewSuperview:0];
  }
  -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", [v4 pageIndex]);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  double v22 = v21;
  if (v21 && v21 != v4)
  {
    [v21 teardown];
    [v22 removeFromSuperview];
  }
  [(THScrollViewWithPassthrough *)self->mPagesScrollView addSubview:v4];
  [v15 originalThumbnailFrame];
  if (!CGRectIsNull(v42))
  {
    [v15 originalThumbnailFrame];
    [v4 setFrame:];
  }
  double v23 = [(THTOCViewController *)self dataSource];
  CGFloat v24 = [v23 toc:self tileModelForChapterIndex:[v4 chapterIndex]];

  TSUScreenScale();
  if (v25 <= 1.0)
  {
    id v30 = [v4 pageIndex];
    CGRect v27 = [v24 tinyThumbs];
    if (v30 < [v27 count])
    {
      CGRect v28 = [v24 tinyThumbs];
      uint64_t v29 = [v28 objectAtIndex:[v4 pageIndex]];
      goto LABEL_24;
    }
  }
  else
  {
    id v26 = [v4 pageIndex];
    CGRect v27 = [v24 largerThumbs];
    if (v26 < [v27 count])
    {
      CGRect v28 = [v24 largerThumbs];
      uint64_t v29 = [v28 objectAtIndex:[v4 pageIndex]];
LABEL_24:
      CGRect v31 = (void *)v29;

      goto LABEL_26;
    }
  }
  CGRect v31 = 0;
LABEL_26:

  if (v31) {
    [v4 setImage:[TSDBitmapImageProvider CGImageForImageData:v31]];
  }
  [v4 setBorderVisible:1];
  if ((unint64_t)[v4 pageIndex] >= 2)
  {
    double v32 = -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v4 pageIndex] - 1);
    [v32 setHasRightBorder:0];
  }
  double v33 = -[THChapterBrowserController p_pageThumbnailViewForPageIndex:](self, "p_pageThumbnailViewForPageIndex:", (char *)[v4 pageIndex] + 1);
  [v33 setHasLeftBorder:0];
  [(NSMutableArray *)self->_thumbnailViewsInTransition removeObject:v15];
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    self->mIgnoringThumbnailTaps = 0;
    [(THChapterBrowserController *)self refreshStatusBarAppearance];
    double v34 = +[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher];
    [v34 resume];
  }
}

- (void)p_animationDidStopForThumbnailView:(id)a3
{
  id v4 = a3;
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  if ([(THChapterBrowserController *)self p_shouldHighlightThumbTargets])
  {
    [v4 highlightedRelativeRect];
    double x = v9;
    double y = v10;
    double width = v11;
    double height = v12;
  }
  if ([(NSMutableArray *)self->_thumbnailViewsInTransition count] == (char *)&dword_0 + 1)
  {
    BOOL v13 = [(THTOCViewController *)self delegate];
    [v13 chapterBrowserController:self didTransitionToPageIndex:[v4 pageIndex] chapterIndex:[v4 chapterIndex] relativeTargetRect:x, y, width, height];
  }
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v4 setTransform:v15];
}

- (void)p_thumbnailAnimationDidStopWithContext:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  id v4 = TSUDynamicCast();
  [(THChapterBrowserController *)self p_animationDidStopForThumbnailView:v4];
  [(THChapterBrowserController *)self p_cleanupAfterTransitionFromPageThumbnail:v4];
  double v5 = +[UIApplication sharedApplication];
  [v5 endIgnoringInteractionEvents];
}

- (void)p_transitionFromPageThumbnail:(id)a3 destinationRect:(CGRect)a4 shouldShroud:(BOOL)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  double v12 = +[UIApplication sharedApplication];
  [v12 beginIgnoringInteractionEvents];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_ADEFC;
  v16[3] = &unk_458CD0;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v24 = a5;
  id v17 = v11;
  double v18 = self;
  uint64_t v23 = 0x3FD3333333333333;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_ADF8C;
  v14[3] = &unk_458CF8;
  v14[4] = self;
  id v13 = v17;
  id v15 = v13;
  +[UIView animateWithDuration:v16 animations:v14 completion:0.3];
}

- (void)scrollToContentOffset:(CGPoint)a3
{
  -[THScrollViewWithPassthrough setContentOffset:animated:](self->mPagesScrollView, "setContentOffset:animated:", 0, a3.x, a3.y);
  id v17 = self->mChapterInfo[1].tileModel;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(THChapterBrowserController *)self thumbnailSubviews];
  double v5 = (char *)[v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        id v8 = TSUDynamicCast();
        double v9 = v8;
        if (v8 && [v8 chapterIndex] == self->mChapterIndex)
        {
          TSUScreenScale();
          if (v10 <= 1.0)
          {
            id v15 = [v9 pageIndex];
            double v12 = [(THTOCTileModel *)v17 tinyThumbs];
            if (v15 >= [v12 count]) {
              goto LABEL_14;
            }
            id v13 = [(THTOCTileModel *)v17 tinyThumbs];
            uint64_t v14 = [v13 objectAtIndex:[v9 pageIndex]];
LABEL_13:
            double v16 = (void *)v14;
          }
          else
          {
            id v11 = [v9 pageIndex];
            double v12 = [(THTOCTileModel *)v17 largerThumbs];
            if (v11 < [v12 count])
            {
              id v13 = [(THTOCTileModel *)v17 largerThumbs];
              uint64_t v14 = [v13 objectAtIndex:[v9 pageIndex]];
              goto LABEL_13;
            }
LABEL_14:
            double v16 = 0;
          }

          if (v16) {
            [v9 setImageData:v16 immediate:1];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      double v5 = (char *)[v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)flushThumbnails
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = [(THChapterBrowserController *)self thumbnailSubviews];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        [v6 teardown];
        [v6 removeFromSuperview];
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  long long v7 = [(THTOCViewController *)self delegate];
  LOBYTE(v4) = [v7 followAnchor:v6 pulse:v4];

  return v4;
}

- (BOOL)followLink:(id)a3
{
  return [(THChapterBrowserController *)self followLink:a3 animated:1];
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(THTOCViewController *)self delegate];
  LOBYTE(self) = [v6 chapterBrowserController:self navigateToLinkInDVC:v5];

  return (char)self;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (NSArray)thumbnailSubviews
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(THScrollViewWithPassthrough *)self->mPagesScrollView subviews];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v8];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(THChapterBrowserController *)self view];
  [v3 bounds];
  -[THChapterBrowserController p_adjustViewsForSize:](self, "p_adjustViewsForSize:", v4, v5);

  [(THChapterBrowserController *)self p_updateChapterWidths];
  [(THChapterBrowserController *)self p_configureThumbCaps];

  [(THChapterBrowserController *)self refreshStatusBarAppearance];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  self->_flags.transitioning = 1;
  self->mDeferBackgroundScrollViewScrolls = 1;
  v10.receiver = self;
  v10.super_class = (Class)THChapterBrowserController;
  -[THChapterBrowserController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_AE7BC;
  v9[3] = &unk_458D20;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_AE84C;
  v8[3] = &unk_458D20;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)p_adjustViewsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(THChapterBrowserController *)self cachedFrameSize];
  if (v7 != width || v6 != height)
  {
    -[THChapterBrowserController setCachedFrameSize:](self, "setCachedFrameSize:", width, height);
    [(THChapterBrowserController *)self setChapterIndex:self->mChapterIndex];
    unsigned int v9 = [(THChapterBrowserController *)self introMediaControllerIsActive];
    objc_super v10 = [(THTOCViewController *)self dataSource];
    id v11 = [v10 toc:self numberOfTilesInDivision:0];

    [(THChapterBrowserController *)self setChapterWidth:width];
    self->mDeferBackgroundScrollViewScrolls = 1;
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v45[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v45[1] = v12;
    v45[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(THScrollView *)self->mBackgroundScrollView setTransform:v45];
    long long v13 = [(THChapterBrowserController *)self view];
    [v13 bounds];
    -[THScrollView setFrame:](self->mBackgroundScrollView, "setFrame:");

    uint64_t v14 = [(THChapterBrowserController *)self introMediaViewController];

    if (v14)
    {
      [(THChapterBrowserController *)self chapterWidth];
      -[THScrollView setContentInset:](self->mBackgroundScrollView, "setContentInset:", 0.0, v15, 0.0, 0.0);
    }
    [(THChapterBrowserController *)self chapterWidth];
    -[THScrollView setContentSize:](self->mBackgroundScrollView, "setContentSize:", v16 * (double)(unint64_t)v11, height);
    if (v9)
    {
      [(THChapterBrowserController *)self chapterWidth];
      double v18 = -v17;
    }
    else
    {
      double mChapterIndex = (double)self->mChapterIndex;
      [(THChapterBrowserController *)self chapterWidth];
      double v18 = v20 * mChapterIndex;
    }
    -[THScrollView setContentOffset:](self->mBackgroundScrollView, "setContentOffset:", v18, 0.0);
    long long v21 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];

    if (v21)
    {
      CGFloat v22 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
      [v22 frame];
      double v24 = v23;
      double v26 = v25;

      [(THScrollView *)self->mBackgroundScrollView contentSize];
      double v28 = v27;
      uint64_t v29 = [(THChapterBrowserController *)self thumbnailTrackBackgroundView];
      [v29 setFrame:0.0, v24, v28, v26];
    }
    self->mDeferBackgroundScrollViewScrolls = 0;
    [(THChapterBrowserController *)self chapterWidth];
    -[UIView setFrame:](self->mBackgroundsView, "setFrame:", 0.0, 0.0, v30 * 3.0, height);
    [(THChapterBrowserController *)self p_updateChapterBackgroundsView];
    for (uint64_t i = 0; i != 3; ++i)
    {
      double v32 = self->mChapterViewControllers[i];
      if (v32)
      {
        [(THChapterBrowserController *)self frameForChapterViewController:v32];
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        double v41 = [(THChapterViewController *)v32 view];
        [v41 setFrame:v34, v36, v38, v40];
      }
    }
    [(THChapterBrowserController *)self chapterWidth];
    double v43 = -v42;
    [(THChapterBrowserController *)self chapterWidth];
    -[UIView setFrame:](self->mIntroMediaContainerView, "setFrame:", v43, 0.0, v44, height);
    [(THChapterBrowserController *)self _updateContentOffsets];
    [(THChapterBrowserController *)self p_updatePageScrubberFrame];
    [(THChapterBrowserController *)self p_updatePageControl];
    [(THChapterBrowserController *)self p_updateThumbLayout];
  }
}

- (BOOL)p_verticalSpaceLimited
{
  double v2 = self;
  id v3 = [(THTOCViewController *)self delegate];
  LOBYTE(v2) = [v3 isCompactHeightForChapterBrowserController:v2];

  return (char)v2;
}

- (BOOL)paginatedTOCShowsStatusBar
{
  return ![(THChapterBrowserController *)self p_verticalSpaceLimited];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(THChapterBrowserController *)self showToolbarRecognizer];
  if (v5 == v4)
  {
    double v7 = [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl superview];

    if (v7)
    {
      [v4 locationInView:self->mChapterPageControl];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      [(THChapterBrowserScrubbablePageControl *)self->mChapterPageControl bounds];
      v13.CGFloat x = v9;
      v13.CGFloat y = v11;
      BOOL v6 = !CGRectContainsPoint(v14, v13);
      goto LABEL_6;
    }
  }
  else
  {
  }
  LOBYTE(v6) = 1;
LABEL_6:

  return v6;
}

- (BOOL)passthroughView:(id)a3 shouldAcceptHitAtPoint:(CGPoint)a4 onView:(id)a5 withEvent:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  CGFloat v11 = (TSWPassThroughView *)a3;
  long long v12 = (THScrollViewWithPassthrough *)a5;
  id v13 = a6;
  if (self->mBottomWrapperView == v11)
  {
    -[THScrollViewWithPassthrough convertPoint:fromView:](self->mPagesScrollView, "convertPoint:fromView:", v11, x, y);
    -[THScrollViewWithPassthrough hitTest:withEvent:](self->mPagesScrollView, "hitTest:withEvent:", v13);
    double v15 = (THScrollViewWithPassthrough *)objc_claimAutoreleasedReturnValue();
    -[THScrollView convertPoint:fromView:](self->mBackgroundScrollView, "convertPoint:fromView:", self->mBottomWrapperView, x, y);
    double v16 = -[THScrollView hitTest:withEvent:](self->mBackgroundScrollView, "hitTest:withEvent:", v13);
    if (v16 && (v15 != v12 || self->mPagesScrollView == v12))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 1;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)didRotateFromFlowInPortraitLockedBook
{
  [(THChapterBrowserController *)self p_updateChapterBackgroundsView];

  [(THChapterBrowserController *)self p_updatePageControl];
}

- (id)p_tintAndTitleColor
{
  return +[UIColor whiteColor];
}

- (id)foregroundTintColorForNavigationBar:(id)a3
{
  id v3 = [(THChapterBrowserController *)self p_tintAndTitleColor];

  return v3;
}

- (id)backgroundColorForNavigationBar:(id)a3
{
  id v3 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, 0.121568627, 0.125490196, 0.129411765, 1.0);

  return v3;
}

- (id)titleColorForNavigationBar:(id)a3
{
  id v3 = [(THChapterBrowserController *)self p_tintAndTitleColor];

  return v3;
}

- (BOOL)navigationBarIsTranslucent:(id)a3
{
  return 0;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THChapterBrowserController p_configureThumbsAndUpdateLayout:](self, "p_configureThumbsAndUpdateLayout:", 1, a4);
  [(THChapterBrowserController *)self p_updatePageScrubberControlForSizeClassChange];
  [(THChapterBrowserController *)self _configurePagesScrollView];
  [(THChapterBrowserController *)self setNeedsStatusBarAppearanceUpdate];

  [(THChapterBrowserController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
}

- (id)transitionContentView
{
  if ([(THChapterBrowserController *)self introMediaControllerIsActive])
  {
    id v3 = [(THChapterBrowserController *)self introMediaViewController];
    [v3 view];
  }
  else
  {
    id v3 = [(THChapterBrowserController *)self chapterViewController];
    [v3 transitionContentView];
  id v4 = };

  return v4;
}

- (THiOSIntroMediaViewController)introMediaViewController
{
  return self->mIntroMediaViewController;
}

- (UIView)wrapperView
{
  return self->mWrapperView;
}

- (void)setWrapperView:(id)a3
{
}

- (THScrollView)backgroundScrollView
{
  return self->mBackgroundScrollView;
}

- (void)setBackgroundScrollView:(id)a3
{
}

- (UIView)backgroundsView
{
  return self->mBackgroundsView;
}

- (void)setBackgroundsView:(id)a3
{
}

- (TSWPassThroughView)bottomWrapperView
{
  return self->mBottomWrapperView;
}

- (void)setBottomWrapperView:(id)a3
{
}

- (THScrollViewWithPassthrough)pagesScrollView
{
  return self->mPagesScrollView;
}

- (void)setPagesScrollView:(id)a3
{
}

- (THChapterBrowserScrubbablePageControl)chapterPageControl
{
  return self->mChapterPageControl;
}

- (void)setChapterPageControl:(id)a3
{
}

- (UIView)chapterPageControlWrapper
{
  return self->mChapterPageControlWrapper;
}

- (void)setChapterPageControlWrapper:(id)a3
{
}

- (BOOL)hasIntroPage
{
  return self->hasIntroPage;
}

- (void)setHasIntroPage:(BOOL)a3
{
  self->hasIntroPage = a3;
}

- (NSMutableSet)contentNodesAskedToLoad
{
  return self->contentNodesAskedToLoad;
}

- (void)setContentNodesAskedToLoad:(id)a3
{
}

- (BOOL)isPinchingDownFromCanvas
{
  return self->mIsPinchingDownFromCanvas;
}

- (void)setIsPinchingDownFromCanvas:(BOOL)a3
{
  self->mIsPinchingDownFromCanvas = a3;
}

- (double)chapterWidth
{
  return self->mChapterWidth;
}

- (void)setChapterWidth:(double)a3
{
  self->mChapterdouble Width = a3;
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (UIColor)pageAreaBackgroundColor
{
  return self->_pageAreaBackgroundColor;
}

- (void)setPageAreaBackgroundColor:(id)a3
{
}

- (UITapGestureRecognizer)showToolbarRecognizer
{
  return self->_showToolbarRecognizer;
}

- (void)setShowToolbarRecognizer:(id)a3
{
}

- (int64_t)maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag
{
  return self->_maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag;
}

- (void)setMaximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag:(int64_t)a3
{
  self->_maximumNumberOfThumbsToRightOfLeftmostDuringBackgroundDrag = a3;
}

- (int64_t)maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag
{
  return self->_maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag;
}

- (void)setMaximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag:(int64_t)a3
{
  self->_maximumNumberOfThumbsToLeftOfLeftmostDuringBackgroundDrag = a3;
}

- (unint64_t)previousChapterIndex
{
  return self->_previousChapterIndex;
}

- (void)setPreviousChapterIndex:(unint64_t)a3
{
  self->_previousChapterIndedouble x = a3;
}

- (CGSize)cachedFrameSize
{
  double width = self->_cachedFrameSize.width;
  double height = self->_cachedFrameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedFrameSize:(CGSize)a3
{
  self->_cachedFrameSize = a3;
}

- (CGSize)thumbSize
{
  double width = self->_thumbSize.width;
  double height = self->_thumbSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)firstThumbSize
{
  double width = self->_firstThumbSize.width;
  double height = self->_firstThumbSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)firstThumbOverlap
{
  double width = self->_firstThumbOverlap.width;
  double height = self->_firstThumbOverlap.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)thumbScale
{
  return self->_thumbScale;
}

- (void)setThumbScale:(double)a3
{
  self->_thumbScale = a3;
}

- (UIView)originalCanvasScrollViewSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalCanvasScrollViewSuperview);

  return (UIView *)WeakRetained;
}

- (void)setOriginalCanvasScrollViewSuperview:(id)a3
{
}

- (CGRect)originalCanvasScrollViewFrame
{
  double x = self->_originalCanvasScrollViewFrame.origin.x;
  double y = self->_originalCanvasScrollViewFrame.origin.y;
  double width = self->_originalCanvasScrollViewFrame.size.width;
  double height = self->_originalCanvasScrollViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalCanvasScrollViewFrame:(CGRect)a3
{
  self->_originalCanvasScrollViewFrame = a3;
}

- (NSMutableArray)thumbnailViewsInTransition
{
  return self->_thumbnailViewsInTransition;
}

- (void)setThumbnailViewsInTransition:(id)a3
{
}

- (BOOL)transitioningPageToDVC
{
  return self->_transitioningPageToDVC;
}

- (void)setTransitioningPageToDVC:(BOOL)a3
{
  self->_transitioningPageToDVC = a3;
}

- (unint64_t)transitioningThumbnailIndex
{
  return self->_transitioningThumbnailIndex;
}

- (void)setTransitioningThumbnailIndex:(unint64_t)a3
{
  self->_transitioningThumbnailIndedouble x = a3;
}

- (NSMutableSet)thumbnailsHiddenForPinch
{
  return self->_thumbnailsHiddenForPinch;
}

- (void)setThumbnailsHiddenForPinch:(id)a3
{
}

- (UIView)thumbnailTrackBackgroundView
{
  return self->_thumbnailTrackBackgroundView;
}

- (void)setThumbnailTrackBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailTrackBackgroundView, 0);
  objc_storeStrong((id *)&self->_thumbnailsHiddenForPinch, 0);
  objc_storeStrong((id *)&self->_thumbnailViewsInTransition, 0);
  objc_destroyWeak((id *)&self->_originalCanvasScrollViewSuperview);
  objc_storeStrong((id *)&self->_showToolbarRecognizer, 0);
  objc_storeStrong((id *)&self->_pageAreaBackgroundColor, 0);
  objc_storeStrong((id *)&self->contentNodesAskedToLoad, 0);
  objc_storeStrong((id *)&self->mChapterPageControlWrapper, 0);
  objc_storeStrong((id *)&self->mIntroMediaContainerView, 0);
  objc_storeStrong((id *)&self->mIntroMediaViewController, 0);
  for (uint64_t i = 176; i != -16; i -= 64)

  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->mChapterViewControllers[j], 0);
  objc_storeStrong((id *)&self->mUpdatingScrollView, 0);
  objc_storeStrong((id *)&self->mFreeTransformController, 0);
  objc_storeStrong((id *)&self->mChapterPageControl, 0);
  objc_storeStrong((id *)&self->mPageAreaBackground, 0);
  objc_storeStrong((id *)&self->mPagesScrollView, 0);
  objc_storeStrong((id *)&self->mBottomWrapperView, 0);
  objc_storeStrong((id *)&self->mBackgroundsView, 0);
  objc_storeStrong((id *)&self->mBackgroundScrollView, 0);

  objc_storeStrong((id *)&self->mWrapperView, 0);
}

- (id).cxx_construct
{
  for (uint64_t i = 48; i != 240; i += 64)
    *(void *)((char *)self + i + 224) = 0;
  return self;
}

@end