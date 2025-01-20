@interface BKPDFModernBookViewController
+ (int64_t)pageNumberForPageIndex:(unint64_t)a3;
+ (unint64_t)pageIndexForPageNumber:(int64_t)a3;
+ (void)_minScaleFactorForPageBounds:(CGFloat)a3 viewBounds:(CGFloat)a4 safeAreaInsets:(double)a5 pageBreakMargins:(double)a6;
+ (void)setupModernPDF;
- (AEPdfCache)pdfDocumentCache;
- (BCCoverResetting)sharedBookCoverResetter;
- (BKPDFAnnotationCounter)annotationCounter;
- (BKPDFAnnotationCounterResult)annotationCountResults;
- (BKPDFModernBookViewController)initWithBook:(id)a3 storeID:(id)a4;
- (BKPDFModernBookViewController)initWithBook:(id)a3 storeID:(id)a4 pdfDocumentCache:(id)a5;
- (BOOL)_needToSaveChanges;
- (BOOL)assetEditingEnabled;
- (BOOL)assetEditingRequested;
- (BOOL)assetReloading;
- (BOOL)canBeEdited;
- (BOOL)canCopy;
- (BOOL)canDismissControls;
- (BOOL)canGoToNextPage;
- (BOOL)canGoToPreviousPage;
- (BOOL)canNavigateByChapter;
- (BOOL)canShowControlsDuringOpenClose;
- (BOOL)coverNeedsUpdate;
- (BOOL)currentlyAtMinimumScaleFactor;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)ignoreKeyboardInteraction;
- (BOOL)isLocationOnCurrentPage:(id)a3;
- (BOOL)isPageBookmarked;
- (BOOL)isPageProgressionRTL;
- (BOOL)isSaving;
- (BOOL)isScrolling;
- (BOOL)isScrubbing;
- (BOOL)prepareForContentScaling;
- (BOOL)shouldShowBrightnessControl;
- (BOOL)shouldShowHUDs;
- (BOOL)shouldShowUndoControls;
- (BOOL)stateShouldClose;
- (BOOL)supportsDocumentEditing;
- (BOOL)supportsDocumentEditingUndo;
- (BOOL)supportsDocumentEditingUndoAll;
- (BOOL)thumbnailDirectoryWantsPageNumber:(id)a3;
- (BOOL)transitionContentViewIsShowingCover;
- (BOOL)turnPageInDirection:(int64_t)a3;
- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)wantsBottomToolbar;
- (IMPerformSelectorProxy)performSelectorProxy;
- (NSUndoManager)pdfUndoManager;
- (PDFDocument)pdfDocument;
- (PDFView)pdfView;
- (UIEdgeInsets)pdfViewContentInset;
- (UIScrollView)pdfScrollView;
- (UITapGestureRecognizer)controlsTapRecognizer;
- (UIView)akToolbarView;
- (_NSRange)currentPages;
- (double)_contentAspectRatio;
- (double)aspectRatioFromPDF;
- (double)initialZoomFactor;
- (double)minimumScaleWithToolBars;
- (id)PDFViewParentViewController;
- (id)_bookContentViewImageOfPage:(unint64_t)a3;
- (id)_bookContentViewImageOfPage:(unint64_t)a3 boundingSize:(CGSize)a4;
- (id)_currentReadingProgress;
- (id)_editToolboxBarButtonItem;
- (id)_uniqueIDForOutline:(id)a3;
- (id)actionController;
- (id)analyticsContentSettingData;
- (id)appearanceIdentifierForSnapshot;
- (id)asset;
- (id)bookContentView;
- (id)contentViewControllerForLocation:(id)a3;
- (id)contentViewControllerForPageNumber:(int64_t)a3;
- (id)currentPageLocation;
- (id)editRedoBarButtonItem;
- (id)editUndoBarButtonItem;
- (id)existingContentViewControllerForPageNumber:(int64_t)a3;
- (id)imageCache;
- (id)lastLayoutUsedKey;
- (id)menuItems:(id)a3 forPage:(id)a4;
- (id)pageLocationForPageIndex:(unint64_t)a3;
- (id)pageLocationForPageNumber:(int64_t)a3;
- (id)searchViewController;
- (id)searchViewController:(id)a3 chapterNameForSearchResult:(id)a4 pageNumber:(int64_t)a5;
- (id)transitionContentHostingView;
- (id)transitionContentView;
- (id)transitionContentViewImage;
- (id)visiblePageBookmarks;
- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4;
- (int64_t)pageCountIncludingUpsell;
- (int64_t)pageNumberForLocation:(id)a3;
- (int64_t)pageNumberFromRange:(_NSRange)a3;
- (int64_t)readerType;
- (int64_t)searchViewController:(id)a3 pageNumberForDocumentOrdinal:(int64_t)a4;
- (int64_t)targetPageNumber;
- (unint64_t)_pageIndexForOutline:(id)a3;
- (unint64_t)_pageNumberForAnchor:(id)a3;
- (unint64_t)appearanceStyleForSnapshot;
- (unint64_t)currentPageIndex;
- (unint64_t)directoryTypeForBookmarks;
- (unint64_t)directoryTypeForPageThumbnails;
- (unint64_t)directoryTypeForTOC;
- (unint64_t)pageIndexForLocation:(id)a3;
- (unint64_t)upsellOrdinal;
- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4;
- (void)_didScrollPDFViewToPage;
- (void)_enableMarkupMode:(BOOL)a3;
- (void)_evaluateUndoRedoEnabled;
- (void)_jumpToLocationForVerticalScroll:(id)a3 animated:(BOOL)a4;
- (void)_jumpToLocationPaged:(id)a3 animated:(BOOL)a4;
- (void)_scrollToRect:(CGRect)a3 inPageAtIndex:(int64_t)a4;
- (void)_setupGestureRecognizers;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateToolbarVisibilityAnimated:(BOOL)a3;
- (void)_willScrollPDFViewToPageNumber:(int64_t)a3;
- (void)actionControllerWillShow:(id)a3;
- (void)annotationsDidChange:(id)a3;
- (void)beginScroll:(id)a3;
- (void)bookContentViewImage:(id)a3;
- (void)books_pageBackward:(id)a3;
- (void)books_pageForward:(id)a3;
- (void)books_pageLeft:(id)a3;
- (void)books_pageRight:(id)a3;
- (void)buildContextTree:(id)a3;
- (void)clearSelection;
- (void)close:(BOOL)a3;
- (void)contentViewReady;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)disableEditingAndSaveIfNecessary;
- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4;
- (void)endScroll:(id)a3;
- (void)handleContentScaling:(BOOL)a3;
- (void)handleSingleTap:(id)a3;
- (void)highlightSearchResult:(id)a3;
- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)loadAKToolbarView;
- (void)loadView;
- (void)makeContentVisible;
- (void)open:(BOOL)a3;
- (void)openToLocation:(id)a3 animated:(BOOL)a4;
- (void)reloadPDFDocument;
- (void)reloadPDFDocumentCompletion:(id)a3;
- (void)resetPDFDocument;
- (void)saveStateClosing:(BOOL)a3;
- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)scalePDFContent:(double)a3 animated:(BOOL)a4;
- (void)scalePDFContent:(double)a3 locationInView:(CGPoint)a4 animated:(BOOL)a5;
- (void)scrollToPageNumber:(int64_t)a3 animate:(BOOL)a4;
- (void)scrollerViewPageDidChange:(id)a3;
- (void)scrub:(id)a3;
- (void)scrub:(id)a3 isScrubbing:(BOOL)a4;
- (void)scrubValueChanged:(id)a3;
- (void)searchPDFUsingSelection:(id)a3;
- (void)setAkToolbarView:(id)a3;
- (void)setAnnotationCountResults:(id)a3;
- (void)setAnnotationCounter:(id)a3;
- (void)setAspectRatioFromPDF:(double)a3;
- (void)setAssetEditingEnabled:(BOOL)a3;
- (void)setAssetEditingRequested:(BOOL)a3;
- (void)setAssetReloading:(BOOL)a3;
- (void)setControlsTapRecognizer:(id)a3;
- (void)setCoverNeedsUpdate:(BOOL)a3;
- (void)setCurrentlyAtMinimumScaleFactor:(BOOL)a3;
- (void)setDefaultMarkupTool;
- (void)setIgnoreKeyboardInteraction:(BOOL)a3;
- (void)setInitialZoomFactor:(double)a3;
- (void)setIsSaving:(BOOL)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setMinimumScaleWithToolBars:(double)a3;
- (void)setPdfDocument:(id)a3;
- (void)setPdfDocumentCache:(id)a3;
- (void)setPdfUndoManager:(id)a3;
- (void)setPdfView:(id)a3;
- (void)setPerformSelectorProxy:(id)a3;
- (void)setScrollMode:(id)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5;
- (void)setSharedBookCoverResetter:(id)a3;
- (void)setStateShouldClose:(BOOL)a3;
- (void)setTargetPageNumber:(int64_t)a3;
- (void)startCountingAnnotations;
- (void)toggleBookmark:(id)a3;
- (void)toggleEditAssetMode:(id)a3;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)updateBookmarkButton:(BOOL)a3;
- (void)updateBottomToolbar:(BOOL)a3;
- (void)updateContentInsets;
- (void)updateContentScale;
- (void)updateHUDVisibilityAnimated:(BOOL)a3;
- (void)updateLayout;
- (void)updateProgressKitForNewLocation;
- (void)updateScrubber:(_NSRange)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)visiblePageDidChange:(id)a3;
@end

@implementation BKPDFModernBookViewController

+ (void)setupModernPDF
{
}

- (PDFDocument)pdfDocument
{
  pdfDocument = self->_pdfDocument;
  if (!pdfDocument)
  {
    [(BKPDFModernBookViewController *)self reloadPDFDocument];
    pdfDocument = self->_pdfDocument;
  }

  return pdfDocument;
}

- (UIScrollView)pdfScrollView
{
  v2 = [(BKPDFModernBookViewController *)self pdfView];
  v3 = [v2 documentScrollView];

  return (UIScrollView *)v3;
}

- (void)loadAKToolbarView
{
  akToolbarView = self->_akToolbarView;
  if (akToolbarView)
  {
    [(UIView *)akToolbarView removeFromSuperview];
    v4 = self->_akToolbarView;
    self->_akToolbarView = 0;
  }
  v5 = [(BKPDFModernBookViewController *)self pdfView];
  v6 = [v5 akToolbarView];
  v7 = self->_akToolbarView;
  self->_akToolbarView = v6;

  v8 = self->_akToolbarView;
  if (v8)
  {
    [(UIView *)v8 setAlpha:0.0];
    v9 = [(BKPDFModernBookViewController *)self theme];
    v10 = [v9 backgroundColorForTraitEnvironment:self];
    v11 = [(BKPDFModernBookViewController *)self pdfView];
    [v11 setAkToolbarViewTintColor:v10];

    v12 = [(BKPDFModernBookViewController *)self theme];
    v13 = [v12 tintColorForNavbarButtons];
    v14 = [(BKPDFModernBookViewController *)self pdfView];
    [v14 setAkToolbarViewItemTintColor:v13];

    v15 = [(BKPDFModernBookViewController *)self pdfView];
    v16 = [v15 tintColor];
    v17 = [(BKPDFModernBookViewController *)self pdfView];
    [v17 setInteractionTintColor:v16];

    v18 = [(BKPDFModernBookViewController *)self view];
    [v18 addSubview:self->_akToolbarView];

    [(UIView *)self->_akToolbarView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(UIView *)self->_akToolbarView leftAnchor];
    v20 = [(BKPDFModernBookViewController *)self view];
    v21 = [v20 leftAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v23 = [(UIView *)self->_akToolbarView rightAnchor];
    v24 = [(BKPDFModernBookViewController *)self view];
    v25 = [v24 rightAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    id v30 = [(UIView *)self->_akToolbarView bottomAnchor];
    v27 = [(BKPDFModernBookViewController *)self view];
    v28 = [v27 bottomAnchor];
    v29 = [v30 constraintEqualToAnchor:v28];
    [v29 setActive:1];
  }
}

- (void)reloadPDFDocument
{
}

- (void)reloadPDFDocumentCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BKBookViewController *)self book];
  v6 = [v5 url];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_EDB28;
  v13[3] = &unk_1DD4F0;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  v9 = objc_retainBlock(v13);
  v10 = objc_retainBlock(v9);
  if (v10)
  {
    if (+[NSThread isMainThread])
    {
      v10[2](v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EDE74;
      v11[3] = &unk_1DADC0;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
  }
}

- (BKPDFModernBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AEPdfCache sharedInstance];
  v9 = [(BKPDFModernBookViewController *)self initWithBook:v7 storeID:v6 pdfDocumentCache:v8];

  return v9;
}

- (BKPDFModernBookViewController)initWithBook:(id)a3 storeID:(id)a4 pdfDocumentCache:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)BKPDFModernBookViewController;
  v10 = [(BKThumbnailBookViewController *)&v27 initWithBook:v8 storeID:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pdfDocumentCache, a5);
    v12 = [v8 url];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v14 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.iBooks.pdfwrite", v13, v14);
    writeQueue = v11->_writeQueue;
    v11->_writeQueue = (OS_dispatch_queue *)v15;

    v11->_accessLock._os_unfair_lock_opaque = 0;
    id v17 = [(AEPdfCache *)v11->_pdfDocumentCache copyCacheObjectForURL:v12];
    v18 = [v17 document];
    if (v18)
    {
      objc_storeStrong((id *)&v11->_pdfDocument, v18);
      [(BKPDFModernBookViewController *)v11 startCountingAnnotations];
    }
    else
    {
      v19 = (PDFDocument *)[objc_alloc((Class)PDFDocument) initWithURL:v12];
      pdfDocument = v11->_pdfDocument;
      v11->_pdfDocument = v19;

      v21 = BKModernPDFLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1387B0();
      }
    }
    uint64_t v22 = [v17 pdfUndoManager];
    pdfUndoManager = v11->_pdfUndoManager;
    v11->_pdfUndoManager = (NSUndoManager *)v22;

    v11->_targetPageNumber = -1;
    v11->_initialZoomFactor = -1.0;
    [(PDFDocument *)v11->_pdfDocument setPDFAKControllerDelegate:v11];
    v24 = +[UITraitCollection bc_allAPITraits];
    id v25 = [(BKPDFModernBookViewController *)v11 registerForTraitChanges:v24 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v11;
}

- (void)dealloc
{
  pdfDocumentCache = self->_pdfDocumentCache;
  id v4 = [(AEBookInfo *)self->super.super._book url];
  [(AEPdfCache *)pdfDocumentCache removeCacheObjectForURL:v4];

  [(PDFDocument *)self->_pdfDocument setPDFAKControllerDelegate:0];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_controlsTapRecognizer removeTarget:self action:0];
  controlsTapRecognizer = self->_controlsTapRecognizer;
  self->_controlsTapRecognizer = 0;

  [(IMPerformSelectorProxy *)self->_performSelectorProxy teardown];
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  [(PDFView *)self->_pdfView setDocument:0];
  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v7 dealloc];
}

- (id)lastLayoutUsedKey
{
  return @"BKPDFLayout";
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  performSelectorProxy = self->_performSelectorProxy;
  if (!performSelectorProxy)
  {
    id v4 = (IMPerformSelectorProxy *)[objc_alloc((Class)IMPerformSelectorProxy) initWithTarget:self];
    v5 = self->_performSelectorProxy;
    self->_performSelectorProxy = v4;

    performSelectorProxy = self->_performSelectorProxy;
  }

  return performSelectorProxy;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKPDFModernBookViewController *)self _enableMarkupMode:0];
  v5.receiver = self;
  v5.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v5 viewWillDisappear:v3];
  [(BKPDFModernBookViewController *)self clearSelection];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFModernBookViewController;
  id v7 = a4;
  -[BKThumbnailBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_EE3EC;
  v8[3] = &unk_1DDBB0;
  v8[4] = self;
  [v7 animateAlongsideTransition:&stru_1DDB88 completion:v8];
}

- (BOOL)prepareForContentScaling
{
  v2 = self;
  BOOL v3 = [(BKPDFModernBookViewController *)self pdfView];
  [v3 scaleFactor];
  double v5 = v4;
  [(BKPDFModernBookViewController *)v2 initialZoomFactor];
  LOBYTE(v2) = v5 == v6;

  return (char)v2;
}

+ (void)_minScaleFactorForPageBounds:(CGFloat)a3 viewBounds:(CGFloat)a4 safeAreaInsets:(double)a5 pageBreakMargins:(double)a6
{
  CGFloat v27 = a5 + a10 + a14;
  CGFloat v28 = a6 + a9 + a13;
  CGFloat v29 = a7 - (a10 + a12) - (a14 + a16);
  CGFloat v30 = a8 - (a9 + a11) - (a13 + a15);
  v33.origin.x = v27;
  v33.origin.y = v28;
  v33.size.double width = v29;
  v33.size.double height = v30;
  CGRectGetWidth(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.double height = a4;
  CGRectGetWidth(v34);
  v35.origin.x = v27;
  v35.origin.y = v28;
  v35.size.double width = v29;
  v35.size.double height = v30;
  CGRectGetHeight(v35);
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.double height = a4;
  v36.size.double width = a3;
  CGRectGetHeight(v36);
}

- (void)handleContentScaling:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKPDFModernBookViewController *)self pdfView];
  [v5 autoScaleFactor];
  double v7 = v6;

  [(BKPDFModernBookViewController *)self setInitialZoomFactor:v7];
  if (![(BKPDFModernBookViewController *)self isScrolling])
  {
    id v8 = [(BKPDFModernBookViewController *)self pdfView];
    [v8 setMinScaleFactor:v7];

    if (v3)
    {
      objc_super v9 = [(BKPDFModernBookViewController *)self pdfView];
      [v9 scaleFactor];
      double v11 = v10;

      if (v11 != v7)
      {
        id v12 = [(BKPDFModernBookViewController *)self pdfView];
        [v12 setScaleFactor:v7];
      }
    }
  }
}

- (void)updateContentScale
{
  BOOL v3 = [(BKPDFModernBookViewController *)self prepareForContentScaling];

  [(BKPDFModernBookViewController *)self handleContentScaling:v3];
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = [(BKPDFModernBookViewController *)self pdfScrollView];
  unsigned int v4 = [v3 isZooming];

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKPDFModernBookViewController;
    [(BKThumbnailBookViewController *)&v8 viewWillLayoutSubviews];
  }
  else
  {
    [(BKPDFModernBookViewController *)self initialZoomFactor];
    BOOL v6 = v5 < 0.0 && (char *)[(BKBookViewController *)self layout] == (char *)&dword_0 + 2
      || [(BKPDFModernBookViewController *)self prepareForContentScaling];
    v7.receiver = self;
    v7.super_class = (Class)BKPDFModernBookViewController;
    [(BKThumbnailBookViewController *)&v7 viewWillLayoutSubviews];
    [(BKPDFModernBookViewController *)self handleContentScaling:v6];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v3 viewDidLayoutSubviews];
  [(BKPDFModernBookViewController *)self contentViewReady];
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v26 viewDidLoad];
  objc_super v3 = [(BKPDFModernBookViewController *)self pdfView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(BKPDFModernBookViewController *)self pdfView];
    [v5 setShowsScrollIndicators:0];
  }
  BOOL v6 = +[UIColor bc_booksBackground];
  objc_super v7 = [(BKThumbnailBookViewController *)self topToolbar];
  [v7 setBarTintColor:v6];

  NSAttributedStringKey v27 = NSForegroundColorAttributeName;
  objc_super v8 = +[UIColor bc_booksLabelColor];
  CGFloat v28 = v8;
  objc_super v9 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  double v10 = [(BKThumbnailBookViewController *)self topToolbar];
  [v10 setTitleTextAttributes:v9];

  double v11 = +[UIColor bc_booksLabelColor];
  id v12 = [(BKThumbnailBookViewController *)self topToolbar];
  [v12 setTintColor:v11];

  [(BKPDFModernBookViewController *)self updateLayout];
  v13 = +[NSNotificationCenter defaultCenter];
  id v14 = [(BKPDFModernBookViewController *)self pdfView];
  [v13 addObserver:self selector:"visiblePageDidChange:" name:PDFViewPageChangedNotification object:v14];

  dispatch_queue_t v15 = +[NSNotificationCenter defaultCenter];
  v16 = [(BKPDFModernBookViewController *)self pdfView];
  [v15 addObserver:self selector:"scrollerViewPageDidChange:" name:PDFViewVisiblePagesChangedNotification object:v16];

  id v17 = +[NSNotificationCenter defaultCenter];
  uint64_t v18 = PDFViewAnnotationsDidChangeNotification;
  v19 = [(BKPDFModernBookViewController *)self pdfView];
  [v17 addObserver:self selector:"annotationsDidChange:" name:v18 object:v19];

  v20 = +[NSNotificationCenter defaultCenter];
  uint64_t v21 = PDFTextSelectionMenuWillChangeScrollPosition;
  uint64_t v22 = [(BKPDFModernBookViewController *)self pdfView];
  [v20 addObserver:self selector:"beginScroll:" name:v21 object:v22];

  v23 = +[NSNotificationCenter defaultCenter];
  uint64_t v24 = PDFTextSelectionMenuDidChangeScrollPosition;
  id v25 = [(BKPDFModernBookViewController *)self pdfView];
  [v23 addObserver:self selector:"endScroll:" name:v24 object:v25];

  [(BKPDFModernBookViewController *)self setIgnoreKeyboardInteraction:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  [(BKBookViewController *)&v4 viewDidAppear:a3];
  [(BKPDFModernBookViewController *)self updateContentInsets];
}

- (void)resetPDFDocument
{
  [(PDFView *)self->_pdfView setDocument:0];
  [(UIView *)self->_akToolbarView removeFromSuperview];
  akToolbarView = self->_akToolbarView;
  self->_akToolbarView = 0;

  pdfUndoManager = self->_pdfUndoManager;
  self->_pdfUndoManager = 0;

  [(PDFDocument *)self->_pdfDocument setPDFAKControllerDelegate:0];
  pdfDocument = self->_pdfDocument;
  self->_pdfDocument = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  [(BKBookViewController *)&v7 viewDidDisappear:a3];
  if ([(BKPDFModernBookViewController *)self stateShouldClose])
  {
    objc_super v4 = +[BCProgressKitController sharedController];
    double v5 = [(BKPDFModernBookViewController *)self asset];
    BOOL v6 = [v5 assetID];
    [v4 didCloseBookWithAssetID:v6 completion:0];

    [(BKPDFModernBookViewController *)self resetPDFDocument];
    [(BKPDFModernBookViewController *)self setStateShouldClose:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKPDFModernBookViewController;
  [(BKPDFModernBookViewController *)&v11 viewWillAppear:a3];
  objc_super v4 = [(BKPDFModernBookViewController *)self pdfView];
  double v5 = [v4 currentPage];

  BOOL v6 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v7 = [v6 indexForPage:v5];

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_EEDCC;
  v8[3] = &unk_1DDBD8;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = v7;
  [(BKPDFModernBookViewController *)self reloadPDFDocumentCompletion:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)open:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v5)
  {
    id v6 = [(BKBookViewController *)self assetViewControllerDelegate];
    [v6 assetViewController:self willOpen:v3];
  }
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  id v6 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v6)
  {
    id v7 = [(BKBookViewController *)self assetViewControllerDelegate];
    [v7 assetViewController:self willOpen:v4];

    objc_opt_class();
    objc_super v8 = BUDynamicCast();
    objc_super v9 = [v8 anchor];
    unint64_t v10 = [(BKPDFModernBookViewController *)self _pageNumberForAnchor:v9];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v11 = [(BKPDFModernBookViewController *)self pdfView];

      if (v11)
      {
        [(BKPDFModernBookViewController *)self turnToPageNumber:v10 animated:0];
      }
      else
      {
        id v12 = [[BKPageLocation alloc] initWithOrdinal:0 andOffset:+[BKPDFModernBookViewController pageIndexForPageNumber:v10]];
        [(BKBookViewController *)self setLocation:v12];
      }
    }
  }
}

- (void)close:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v5 assetViewController:self willClose:v3];

  [(BKPDFModernBookViewController *)self setStateShouldClose:1];
}

- (unint64_t)_pageNumberForAnchor:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSCharacterSet whitespaceCharacterSet];
  double v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (objc_msgSend(v5, "hasPrefix:", @"page(")
    && [v5 hasSuffix:@""]))
  {
    id v6 = [v5 substringWithRange:5, [v5 length] - 6];
    unint64_t v7 = (unint64_t)[v6 integerValue];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)contentViewReady
{
  id v3 = [(BKBookViewController *)self contentOpenAnimator];

  if (v3)
  {
    BOOL v4 = [(BKBookViewController *)self contentOpenAnimator];
    [v4 bookContentDidLoad];

    [(BKBookViewController *)self setContentOpenAnimator:0];
    BOOL v5 = [(BKPDFModernBookViewController *)self assetReloading]
      || UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning();
    [(BKBookViewController *)self setControlsVisible:v5 animated:0];
  }
}

- (void)loadView
{
  v31.receiver = self;
  v31.super_class = (Class)BKPDFModernBookViewController;
  [(BKPDFModernBookViewController *)&v31 loadView];
  id v3 = [(BKPDFModernBookViewController *)self pdfDocument];
  [v3 setShowsAnnotations:1];

  BOOL v4 = [(BKPDFModernBookViewController *)self view];
  id v5 = objc_alloc((Class)PDFView);
  [v4 bounds];
  id v6 = [v5 initWithFrame:];
  [(BKPDFModernBookViewController *)self setPdfView:v6];

  unint64_t v7 = [(BKPDFModernBookViewController *)self pdfView];
  [v7 setAutoresizingMask:18];

  objc_super v8 = [(BKPDFModernBookViewController *)self pdfView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:1];

  objc_super v9 = [(BKPDFModernBookViewController *)self pdfView];
  [v9 setDelegate:self];

  unint64_t v10 = [(BKPDFModernBookViewController *)self pdfView];
  [v10 setAutoScales:1];

  objc_super v11 = [(BKPDFModernBookViewController *)self pdfView];
  [v11 setMaxScaleFactor:32.0];

  id v12 = [(BKPDFModernBookViewController *)self pdfView];
  [v12 setDisplaysBookmarksForPages:1];

  id v13 = [(BKPDFModernBookViewController *)self pdfView];
  [v13 setDisplayDirection:1];

  id v14 = [(BKPDFModernBookViewController *)self pdfView];
  UIPageViewControllerOptionsKey v32 = UIPageViewControllerOptionInterPageSpacingKey;
  CGRect v33 = &off_1E9758;
  dispatch_queue_t v15 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v14 usePageViewController:1 withViewOptions:v15];

  v16 = [(BKPDFModernBookViewController *)self pdfView];
  id v17 = [v16 documentViewController];
  [(BKPDFModernBookViewController *)self addChildViewController:v17];

  uint64_t v18 = [(BKPDFModernBookViewController *)self pdfView];
  [v4 addSubview:v18];

  v19 = [(BKPDFModernBookViewController *)self pdfView];
  v20 = [v19 documentViewController];
  [v20 didMoveToParentViewController:self];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  uint64_t v24 = [(BKPDFModernBookViewController *)self pdfView];
  [v24 setPageBreakMargins:UIEdgeInsetsZero.top, left, bottom, right];

  id v25 = [(BKPDFModernBookViewController *)self pdfView];
  objc_super v26 = [(BKPDFModernBookViewController *)self pdfDocument];
  [v25 setDocument:v26];

  [(BKPDFModernBookViewController *)self _setupGestureRecognizers];
  NSAttributedStringKey v27 = [(BKPDFModernBookViewController *)self pdfView];
  CGFloat v28 = [(BKBookViewController *)self book];
  [v27 setDisplaysRTL:[v28 writingDirection] == (char *)&dword_0 + 1];

  CGFloat v29 = +[IMTheme themeWithIdentifier:kIMThemeIdentifierDynamicTheme];
  [(BKBookViewController *)self setTheme:v29];

  CGFloat v30 = [(BKPDFModernBookViewController *)self pdfView];
  [v30 setAkAnnotationEditingEnabled:0];

  [(BKPDFModernBookViewController *)self loadAKToolbarView];
}

- (BOOL)isPageProgressionRTL
{
  v2 = [(BKPDFModernBookViewController *)self pdfView];
  unsigned __int8 v3 = [v2 displaysRTL];

  return v3;
}

- (void)setLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v4 setLayout:a3];
  [(BKPDFModernBookViewController *)self updateLayout];
}

- (void)updateLayout
{
  unsigned __int8 v3 = [(BKPDFModernBookViewController *)self pdfView];
  objc_super v4 = [v3 currentPage];

  unint64_t v5 = [(BKBookViewController *)self layout];
  id v6 = [(BKPDFModernBookViewController *)self pdfView];
  unint64_t v7 = v6;
  if (v5 == 2)
  {
    objc_super v8 = [v6 documentViewController];
    [v8 willMoveToParentViewController:0];

    objc_super v9 = [(BKPDFModernBookViewController *)self pdfView];
    unint64_t v10 = [v9 documentViewController];
    [v10 removeFromParentViewController];

    objc_super v11 = [(BKPDFModernBookViewController *)self pdfView];
    [v11 usePageViewController:0 withViewOptions:0];

    id v12 = [(BKPDFModernBookViewController *)self pdfView];
    [v12 setDisplayDirection:0];

    id v13 = [(BKPDFModernBookViewController *)self pdfView];
    [v13 setDisplayMode:1];

    id v14 = [(BKPDFModernBookViewController *)self pdfScrollView];
    [v14 setContentInsetAdjustmentBehavior:2];

    dispatch_queue_t v15 = [(BKPDFModernBookViewController *)self pdfView];
    [v15 setAutoScales:1];

    v16 = [(BKPDFModernBookViewController *)self pdfView];
    [v16 setPageBreakMargins:4.75, 4.0, 4.75, 4.0];
  }
  else
  {
    UIPageViewControllerOptionsKey v32 = UIPageViewControllerOptionInterPageSpacingKey;
    CGRect v33 = &off_1E9758;
    id v17 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [v7 usePageViewController:1 withViewOptions:v17];

    uint64_t v18 = [(BKPDFModernBookViewController *)self pdfView];
    [v18 setDisplayDirection:1];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    uint64_t v22 = [(BKPDFModernBookViewController *)self pdfView];
    [v22 setPageBreakMargins:UIEdgeInsetsZero.top, left, bottom, right];

    v23 = [(BKPDFModernBookViewController *)self pdfView];
    uint64_t v24 = [v23 documentViewController];
    [(BKPDFModernBookViewController *)self addChildViewController:v24];

    v16 = [(BKPDFModernBookViewController *)self pdfView];
    id v25 = [v16 documentViewController];
    [v25 didMoveToParentViewController:self];
  }
  [(BKPDFModernBookViewController *)self updateContentInsets];
  objc_super v26 = [(BKPDFModernBookViewController *)self pdfView];
  [v26 layoutDocumentView];

  NSAttributedStringKey v27 = [(BKPDFModernBookViewController *)self pdfView];
  CGFloat v28 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v27 removeGestureRecognizer:v28];

  [(BKPDFModernBookViewController *)self _setupGestureRecognizers];
  CGFloat v29 = [(BKPDFModernBookViewController *)self pdfView];
  [v29 goToPage:v4];

  CGFloat v30 = +[UIColor clearColor];
  objc_super v31 = [(BKPDFModernBookViewController *)self pdfView];
  [v31 setBackgroundColor:v30];
}

- (void)setScrollMode:(id)a3
{
  if ((char *)[(BKBookViewController *)self layout] == (char *)&dword_0 + 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }

  [(BKPDFModernBookViewController *)self setLayout:v4];
}

- (void)_setupGestureRecognizers
{
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleSingleTap:"];
  [(BKPDFModernBookViewController *)self setControlsTapRecognizer:v3];

  uint64_t v4 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v4 setNumberOfTapsRequired:1];

  unint64_t v5 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v5 setDelegate:self];

  id v6 = [(BKPDFModernBookViewController *)self pdfView];
  unint64_t v7 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v6 addGestureRecognizer:v7];

  objc_super v8 = [(BKPDFModernBookViewController *)self pdfView];
  id v16 = [v8 longPressGestureRecognizer];

  objc_super v9 = [(BKPDFModernBookViewController *)self pdfView];
  unint64_t v10 = [v9 tapGestureRecognizer];

  objc_super v11 = [(BKPDFModernBookViewController *)self pdfView];
  id v12 = [v11 doubleTapGestureRecognizer];

  id v13 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v13 requireGestureRecognizerToFail:v10];

  id v14 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v14 requireGestureRecognizerToFail:v16];

  dispatch_queue_t v15 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
  [v15 requireGestureRecognizerToFail:v12];
}

- (int64_t)readerType
{
  return 4;
}

- (unint64_t)appearanceStyleForSnapshot
{
  return 0;
}

- (id)appearanceIdentifierForSnapshot
{
  return &stru_1DF0D8;
}

- (id)asset
{
  return self->super.super._book;
}

- (int64_t)pageCountIncludingUpsell
{
  v2 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v3 = [v2 pageCount];

  return (int64_t)v3;
}

- (id)actionController
{
  if (!self->super.super._actionController)
  {
    id v3 = [(BKBookViewController *)self book];
    if ([v3 isManagedBook])
    {
      unsigned __int8 v4 = +[AEAnnotationSerializationManager managedBooksAllowedToSync];

      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    unint64_t v5 = (BKActionController *)objc_opt_new();
    actionController = self->super.super._actionController;
    self->super.super._actionController = v5;
    unint64_t v7 = v5;

    [(BKActionController *)self->super.super._actionController setAncestorViewController:self];
    objc_super v8 = [(BKBookViewController *)self book];
    [(BKActionController *)self->super.super._actionController setBookInfo:v8];

    [(BKActionController *)self->super.super._actionController setDelegate:self];
  }
LABEL_7:
  objc_super v9 = self->super.super._actionController;

  return v9;
}

- (void)disableEditingAndSaveIfNecessary
{
  if ([(BKPDFModernBookViewController *)self assetEditingEnabled])
  {
    [(BKPDFModernBookViewController *)self _enableMarkupMode:0];
  }
  else if ([(BKPDFModernBookViewController *)self _needToSaveChanges])
  {
    [(BKPDFModernBookViewController *)self saveStateClosing:0];
  }
}

- (void)actionControllerWillShow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  [(BKBookViewController *)&v4 actionControllerWillShow:a3];
  [(BKPDFModernBookViewController *)self disableEditingAndSaveIfNecessary];
}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  if (a3 == 1 && [(BKPDFModernBookViewController *)self assetEditingEnabled]) {
    [(BKPDFModernBookViewController *)self _enableMarkupMode:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v9 setSection:v7 animated:v6 adjustScrollToReveal:v5];
}

- (BOOL)wantsBottomToolbar
{
  return ![(BKPDFModernBookViewController *)self assetEditingEnabled];
}

- (void)updateBottomToolbar:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v6 updateBottomToolbar:a3];
  double v4 = 0.0;
  if ([(BKPDFModernBookViewController *)self assetEditingEnabled]) {
    double v4 = (double)[(BKBookViewController *)self controlsVisible];
  }
  BOOL v5 = [(BKPDFModernBookViewController *)self akToolbarView];
  [v5 setAlpha:v4];
}

- (BOOL)canDismissControls
{
  return ![(BKPDFModernBookViewController *)self assetEditingEnabled];
}

- (BOOL)supportsDocumentEditing
{
  id v3 = [(BKPDFModernBookViewController *)self akToolbarView];
  if (v3) {
    BOOL v4 = [(BKPDFModernBookViewController *)self canBeEdited];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)supportsDocumentEditingUndo
{
  return 1;
}

- (BOOL)supportsDocumentEditingUndoAll
{
  return 1;
}

- (BOOL)canBeEdited
{
  v2 = [(BKPDFModernBookViewController *)self pdfDocument];
  unsigned __int8 v3 = [v2 allowsDocumentChanges];

  return v3;
}

- (BOOL)shouldShowUndoControls
{
  unsigned int v3 = [(BKPDFModernBookViewController *)self assetEditingEnabled];
  if (v3)
  {
    if (isPhone())
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(BKPDFModernBookViewController *)self im_isCompactWidth];
    }
  }
  return v3;
}

- (BOOL)shouldShowBrightnessControl
{
  return 0;
}

- (id)_editToolboxBarButtonItem
{
  editToolboxBarButtonItem = self->super._editToolboxBarButtonItem;
  if (!editToolboxBarButtonItem)
  {
    BOOL v4 = objc_alloc_init(AEMarkupBarButtonItem);
    [(AEMarkupBarButtonItem *)v4 setAction:"toggleEditAssetMode:"];
    [(AEMarkupBarButtonItem *)v4 setTarget:self];
    [(AEMarkupBarButtonItem *)v4 setSelected:[(BKPDFModernBookViewController *)self assetEditingEnabled]];
    BOOL v5 = self->super._editToolboxBarButtonItem;
    self->super._editToolboxBarButtonItem = &v4->super;

    editToolboxBarButtonItem = self->super._editToolboxBarButtonItem;
  }

  return editToolboxBarButtonItem;
}

- (id)editUndoBarButtonItem
{
  editUndoBarButtonItem = self->super._editUndoBarButtonItem;
  if (!editUndoBarButtonItem)
  {
    BOOL v4 = [(BKPDFModernBookViewController *)self pdfView];
    BOOL v5 = [v4 akUndoToolbarItem];

    v10.receiver = self;
    v10.super_class = (Class)BKPDFModernBookViewController;
    objc_super v6 = [(BKThumbnailBookViewController *)&v10 editUndoBarButtonItem];
    uint64_t v7 = self->super._editUndoBarButtonItem;
    self->super._editUndoBarButtonItem = v6;

    objc_super v8 = [v5 target];
    [(UIBarButtonItem *)self->super._editUndoBarButtonItem setTarget:v8];

    -[UIBarButtonItem setAction:](self->super._editUndoBarButtonItem, "setAction:", [v5 action]);
    [(UIBarButtonItem *)self->super._editUndoBarButtonItem setWidth:46.0];

    editUndoBarButtonItem = self->super._editUndoBarButtonItem;
  }

  return editUndoBarButtonItem;
}

- (id)editRedoBarButtonItem
{
  editRedoBarButtonItem = self->super._editRedoBarButtonItem;
  if (!editRedoBarButtonItem)
  {
    BOOL v4 = [(BKPDFModernBookViewController *)self pdfView];
    BOOL v5 = [v4 akRedoToolbarItem];

    v10.receiver = self;
    v10.super_class = (Class)BKPDFModernBookViewController;
    objc_super v6 = [(BKThumbnailBookViewController *)&v10 editRedoBarButtonItem];
    uint64_t v7 = self->super._editRedoBarButtonItem;
    self->super._editRedoBarButtonItem = v6;

    objc_super v8 = [v5 target];
    [(UIBarButtonItem *)self->super._editRedoBarButtonItem setTarget:v8];

    -[UIBarButtonItem setAction:](self->super._editRedoBarButtonItem, "setAction:", [v5 action]);
    [(UIBarButtonItem *)self->super._editRedoBarButtonItem setWidth:46.0];

    editRedoBarButtonItem = self->super._editRedoBarButtonItem;
  }

  return editRedoBarButtonItem;
}

- (void)_evaluateUndoRedoEnabled
{
  unsigned int v3 = [(BKPDFModernBookViewController *)self pdfView];
  BOOL v4 = [v3 akUndoToolbarItem];
  id v5 = [v4 isEnabled];
  objc_super v6 = [(BKPDFModernBookViewController *)self editUndoBarButtonItem];
  [v6 setEnabled:v5];

  id v10 = [(BKPDFModernBookViewController *)self pdfView];
  uint64_t v7 = [v10 akRedoToolbarItem];
  id v8 = [v7 isEnabled];
  objc_super v9 = [(BKPDFModernBookViewController *)self editRedoBarButtonItem];
  [v9 setEnabled:v8];
}

- (id)bookContentView
{
  unsigned int v3 = [(BKPDFModernBookViewController *)self pdfView];
  BOOL v4 = [v3 pageViewForPageAtIndex:[self currentPageIndex]];

  return v4;
}

- (id)_bookContentViewImageOfPage:(unint64_t)a3
{
  id v5 = [(BKPDFModernBookViewController *)self view];
  objc_super v6 = [v5 window];
  if (v6)
  {
    uint64_t v7 = [(BKPDFModernBookViewController *)self view];
    id v8 = [v7 window];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    uint64_t v7 = +[UIScreen mainScreen];
    [v7 bounds];
    double v10 = v13;
    double v12 = v14;
  }

  return -[BKPDFModernBookViewController _bookContentViewImageOfPage:boundingSize:](self, "_bookContentViewImageOfPage:boundingSize:", a3, v10, v12);
}

- (id)_bookContentViewImageOfPage:(unint64_t)a3 boundingSize:(CGSize)a4
{
  id v5 = [(BKPDFModernBookViewController *)self pdfDocument];
  objc_super v6 = [v5 pageAtIndex:a3];

  if (v6)
  {
    [v6 boundsForBox:1];
    CGSizeScaledToFitInSize();
    BKImageSizeForScreenSize(v7);
    objc_opt_class();
    CGSizeRound();
    double v9 = v8;
    double v11 = v10;
    v21[0] = PDFPageImageProperty_DrawBookmark;
    v21[1] = PDFPageImageProperty_DrawAnnotations;
    v22[0] = &__kCFBooleanFalse;
    v22[1] = &__kCFBooleanFalse;
    v21[2] = PDFPageImageProperty_WithRotation;
    v22[2] = &__kCFBooleanTrue;
    double v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    double v13 = [v6 imageOfSize:1 forBox:v12 withOptions:v9, v11];
    double v14 = BUDynamicCast();

    id v15 = v14;
    id v16 = [v15 CGImage];
    id v17 = +[UIScreen mainScreen];
    [v17 scale];
    v19 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v16, [v15 imageOrientation], v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)bookContentViewImage:(id)a3
{
  id v5 = a3;
  id v6 = [(BKPDFModernBookViewController *)self _bookContentViewImageOfPage:[(BKPDFModernBookViewController *)self currentPageIndex]];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)makeContentVisible
{
  v3.receiver = self;
  v3.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v3 makeContentVisible];
  [(BKThumbnailBookViewController *)self assetViewControllerUpdateToolbars];
  [(BKBookViewController *)self setControlsVisible:1 animated:1];
}

- (void)_updateToolbarVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIBarButtonItem *)self->super._editToolboxBarButtonItem setSelected:[(BKPDFModernBookViewController *)self assetEditingEnabled]];
  [(BKThumbnailBookViewController *)self updateTopToolbar:v3];

  [(BKPDFModernBookViewController *)self updateBottomToolbar:v3];
}

- (void)updateHUDVisibilityAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v4 updateHUDVisibilityAnimated:a3];
  [(BKPDFModernBookViewController *)self updateContentScale];
}

- (BOOL)shouldShowHUDs
{
  if ([(BKPDFModernBookViewController *)self assetEditingEnabled]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  return [(BKThumbnailBookViewController *)&v4 shouldShowHUDs];
}

- (void)setDefaultMarkupTool
{
  v2 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v4 = [v2 akController];

  BOOL v3 = objc_opt_new();
  [v3 setTag:764017];
  [v4 performActionForSender:v3];
}

- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(BKPDFModernBookViewController *)self assetEditingEnabled]) {
    [(BKPDFModernBookViewController *)self _enableMarkupMode:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)BKPDFModernBookViewController;
  [(BKBookViewController *)&v7 dismissCurrentPopoverWithCompletion:v6 animated:v4];
}

- (void)_enableMarkupMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKPDFModernBookViewController *)self canBeEdited])
  {
    if ([(BKPDFModernBookViewController *)self assetEditingEnabled] != v3)
    {
      BOOL v5 = +[UIView areAnimationsEnabled];
      [(BKPDFModernBookViewController *)self setAssetEditingEnabled:v3];
      if (v3) {
        [(BKPDFModernBookViewController *)self setDefaultMarkupTool];
      }
      [(BKPDFModernBookViewController *)self _updateToolbarVisibilityAnimated:v5];
      [(BKPDFModernBookViewController *)self updateHUDVisibilityAnimated:v5];
      if (![(BKPDFModernBookViewController *)self assetEditingEnabled]
        && [(BKPDFModernBookViewController *)self _needToSaveChanges])
      {
        [(BKPDFModernBookViewController *)self saveStateClosing:0];
      }
      if (v3) {
        [(BKBookViewController *)self setControlsVisible:1 animated:1];
      }
    }
    uint64_t v6 = [(BKPDFModernBookViewController *)self assetEditingEnabled] ^ 1;
    id v7 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
    [v7 setEnabled:v6];
  }
}

- (void)scalePDFContent:(double)a3 animated:(BOOL)a4
{
}

- (void)scalePDFContent:(double)a3 locationInView:(CGPoint)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v10 = [(BKPDFModernBookViewController *)self pdfView];
  [v10 minScaleFactor];
  double v12 = v11;

  if (v12 <= a3) {
    double v12 = a3;
  }
  double v13 = [(BKPDFModernBookViewController *)self pdfView];
  [v13 maxScaleFactor];
  double v15 = v14;

  uint64_t v21 = 3221225472;
  v20 = _NSConcreteStackBlock;
  uint64_t v22 = sub_F0B6C;
  v23 = &unk_1DDC00;
  if (v12 < v15) {
    double v15 = v12;
  }
  CGFloat v25 = x;
  CGFloat v26 = y;
  uint64_t v24 = self;
  double v27 = v15;
  id v16 = objc_retainBlock(&v20);
  id v17 = [(BKPDFModernBookViewController *)self pdfView];
  [v17 scaleFactor];
  double v19 = v18;

  if (v19 != v15)
  {
    if (v5) {
      +[UIView animateWithDuration:v16 animations:0.2];
    }
    else {
      ((void (*)(void ***))v16[2])(v16);
    }
  }
}

- (void)handleSingleTap:(id)a3
{
  id v20 = a3;
  if (![(BKPDFModernBookViewController *)self assetEditingRequested])
  {
    if ([(BKPDFModernBookViewController *)self assetEditingEnabled]
      || (char *)[(BKBookViewController *)self layout] != (char *)&dword_0 + 1)
    {
      goto LABEL_10;
    }
    BOOL v4 = [(BKPDFModernBookViewController *)self view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;

    double v13 = [(BKPDFModernBookViewController *)self controlsTapRecognizer];
    double v14 = [(BKPDFModernBookViewController *)self pdfView];
    [v13 locationInView:v14];
    double v16 = v15;

    v22.origin.CGFloat x = v6;
    v22.origin.CGFloat y = v8;
    v22.size.double width = v10;
    v22.size.double height = v12;
    double v17 = CGRectGetWidth(v22) * 0.2;
    unsigned int v18 = [(BKPDFModernBookViewController *)self isPageProgressionRTL];
    if (v16 <= v17) {
      uint64_t v19 = v18 ^ 1;
    }
    else {
      uint64_t v19 = v16 >= v10 - v17 ? v18 : -1;
    }
    if (![(BKPDFModernBookViewController *)self turnPageInDirection:v19]) {
LABEL_10:
    }
      [(BKThumbnailBookViewController *)self toggleControls:v20];
  }
}

- (void)toggleEditAssetMode:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v5 toggleEditAssetMode:a3];
  BOOL v4 = BKModernPDFLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1387E4();
  }

  [(BKPDFModernBookViewController *)self _enableMarkupMode:[(BKPDFModernBookViewController *)self assetEditingRequested] ^ 1];
}

- (void)setAssetEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = BKModernPDFLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_138824(v3, v5);
  }

  CGFloat v6 = [(BKPDFModernBookViewController *)self pdfView];
  [v6 setAkAnnotationEditingEnabled:v3];

  [(BKPDFModernBookViewController *)self setAssetEditingRequested:v3];
  if (!v3) {
    [(BKPDFModernBookViewController *)self becomeFirstResponder];
  }
}

- (BOOL)assetEditingEnabled
{
  v2 = [(BKPDFModernBookViewController *)self pdfView];
  unsigned __int8 v3 = [v2 akAnnotationEditingEnabled];

  return v3;
}

- (BOOL)_needToSaveChanges
{
  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x2020000000;
  char v21 = 0;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  p_accessLock = &self->_accessLock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  double v11 = sub_F1058;
  CGFloat v12 = &unk_1DDC28;
  double v13 = self;
  double v14 = &v15;
  BOOL v4 = v10;
  os_unfair_lock_lock(p_accessLock);
  v11((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  if (!*((unsigned char *)v16 + 24))
  {
    writeQueue = self->_writeQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    id v9[2] = sub_F108C;
    v9[3] = &unk_1DDC28;
    v9[4] = self;
    v9[5] = &v19;
    dispatch_sync(writeQueue, v9);
  }
  CGFloat v6 = BKModernPDFLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1388B4((uint64_t)v20, v6);
  }

  char v7 = *(unsigned char *)(v20[0] + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

- (void)saveStateClosing:(BOOL)a3
{
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_F1284;
  v15[3] = &unk_1DAB88;
  v15[4] = self;
  os_unfair_lock_lock(&self->_accessLock);
  sub_F1284((uint64_t)v15);
  os_unfair_lock_unlock(p_accessLock);
  [(BKThumbnailBookViewController *)self didChangeLocationClosing:v5 suspending:v4];
  v14.receiver = self;
  v14.super_class = (Class)BKPDFModernBookViewController;
  [(BKBookViewController *)&v14 saveStateClosing:v5 suspending:v4];
  CGFloat v8 = [(BKPDFModernBookViewController *)self pdfDocument];
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F1290;
  block[3] = &unk_1DBF08;
  id v12 = v8;
  double v13 = self;
  id v10 = v8;
  dispatch_async(writeQueue, block);
}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(BKPDFModernBookViewController *)self assetEditingEnabled]
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

- (double)_contentAspectRatio
{
  [(BKPDFModernBookViewController *)self aspectRatioFromPDF];
  if (v3 != 0.0) {
    return v3;
  }
  v12.receiver = self;
  v12.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v12 _contentAspectRatio];
  double v5 = v4;
  double v6 = [(BKPDFModernBookViewController *)self pdfDocument];
  double v7 = [v6 pageAtIndex: -[BKPDFModernBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell") > 1];
  unsigned __int8 v8 = v7;
  if (v7)
  {
    PDFPageGetBoxRectWithRotation(v7, 1);
    if (v10 > 0.0) {
      double v5 = v9 / v10;
    }
  }
  [(BKPDFModernBookViewController *)self setAspectRatioFromPDF:v5];

  return v5;
}

- (BOOL)canShowControlsDuringOpenClose
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  if ([(BKThumbnailBookViewController *)&v4 canShowControlsDuringOpenClose]) {
    return 1;
  }
  else {
    return [(BKPDFModernBookViewController *)self assetReloading];
  }
}

- (id)existingContentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (id)contentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (id)contentViewControllerForLocation:(id)a3
{
  return 0;
}

- (void)clearSelection
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewController;
  [(BKBookViewController *)&v4 clearSelection];
  double v3 = [(BKPDFModernBookViewController *)self pdfView];
  [v3 clearSelection];
}

- (id)transitionContentView
{
  if ([(BKThumbnailBookViewController *)self directoryTOCIsVisible]) {
    [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
  }
  else {
  double v3 = [(BKPDFModernBookViewController *)self bookContentView];
  }
  if (!v3)
  {
    [(BKPDFModernBookViewController *)self reloadPDFDocument];
    objc_super v4 = [(BKPDFModernBookViewController *)self pdfView];
    double v3 = [v4 pageViewForPageAtIndex:[self currentPageIndex]];

    if (!v3)
    {
      double v3 = [(BKPDFModernBookViewController *)self view];
    }
  }

  return v3;
}

- (id)transitionContentHostingView
{
  if ([(BKThumbnailBookViewController *)self directoryTOCIsVisible])
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(BKPDFModernBookViewController *)self pdfView];
  }

  return v3;
}

- (BOOL)transitionContentViewIsShowingCover
{
  return [(BKPDFModernBookViewController *)self currentPageIndex] == 0;
}

- (id)transitionContentViewImage
{
  if ([(BKThumbnailBookViewController *)self directoryTOCIsVisible])
  {
    double v3 = 0;
  }
  else
  {
    objc_super v4 = [(BKPDFModernBookViewController *)self transitionContentView];
    [v4 bounds];
    [v4 convertRect:0 toView:];
    double v5 = [(BKPDFModernBookViewController *)self view];
    double v6 = [v5 window];
    if (v6)
    {
      double v7 = [(BKPDFModernBookViewController *)self view];
      unsigned __int8 v8 = [v7 window];
      [v8 bounds];
    }
    else
    {
      double v7 = +[UIScreen mainScreen];
      [v7 bounds];
    }

    CGSizeScaledToFitInSize();
    double v3 = -[BKPDFModernBookViewController _bookContentViewImageOfPage:boundingSize:](self, "_bookContentViewImageOfPage:boundingSize:", [(BKPDFModernBookViewController *)self currentPageIndex], v9, v10);
  }

  return v3;
}

- (unint64_t)upsellOrdinal
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = [(BKPDFModernBookViewController *)self theme];
  double v5 = [(BKBookViewController *)self searchViewControllerIfLoaded];
  [v5 setTheme:v6];
}

- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = +[AETestDriver shared];
  [v7 postEvent:kBETestDriverPageTurnStart sender:self];

  unsigned __int8 v8 = +[AETestDriver shared];
  [v8 postEvent:kBETestDriverPageTurnSetupStart sender:self];

  [(BKPDFModernBookViewController *)self turnToPageNumber:(char *)+[BKPDFModernBookViewController pageNumberForPageIndex:[(BKPDFModernBookViewController *)self currentPageIndex]]+ a3 animated:v4];
  return 1;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 1
    || (int64_t v6 = a3, [(BKPDFModernBookViewController *)self pageCountIncludingUpsell] < a3))
  {
    int64_t v6 = 1;
  }
  uint64_t v7 = [(BKPDFModernBookViewController *)self isVisible] & v4;

  [(BKPDFModernBookViewController *)self scrollToPageNumber:v6 animate:v7];
}

- (id)searchViewController
{
  searchViewController = self->super.super._searchViewController;
  if (!searchViewController)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKPDFModernBookViewController;
    id v4 = [(BKBookViewController *)&v7 searchViewController];
    double v5 = [(BKSearchViewController *)self->super.super._searchViewController searchController];
    [v5 setPageCount:[self pageCountIncludingUpsell]];

    searchViewController = self->super.super._searchViewController;
  }

  return searchViewController;
}

- (void)highlightSearchResult:(id)a3
{
  id v4 = a3;
  [(BKPDFModernBookViewController *)self initialZoomFactor];
  -[BKPDFModernBookViewController scalePDFContent:locationInView:animated:](self, "scalePDFContent:locationInView:animated:", 1);
  objc_opt_class();
  BUDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  double v5 = v9;
  if (v9)
  {
    int64_t v6 = [v9 selection];
    if (v6)
    {
      objc_super v7 = +[UIColor yellowColor];
      [v6 setColor:v7];

      unsigned __int8 v8 = [(BKPDFModernBookViewController *)self pdfView];
      [v8 setCurrentSelection:v6 animate:1];
    }
    double v5 = v9;
  }
}

- (id)searchViewController:(id)a3 chapterNameForSearchResult:(id)a4 pageNumber:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v9 = BUDynamicCast();
  double v10 = [v9 selection];
  if (v10)
  {
    double v11 = [(BKPDFModernBookViewController *)self pdfDocument];
    objc_super v12 = [v11 outlineItemForSelection:v10];

    uint64_t v13 = -3;
    do
    {
      objc_super v14 = [v12 parent];

      if (!v14) {
        break;
      }
      if (!v13)
      {
        objc_super v14 = 0;
        break;
      }
      uint64_t v15 = [v12 label];
      id v16 = [v15 length];

      if (v16)
      {
        objc_super v14 = [v12 label];
      }
      else
      {
        uint64_t v17 = [v12 parent];

        objc_super v14 = 0;
        objc_super v12 = (void *)v17;
      }
      ++v13;
    }
    while (!v14);
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (int64_t)searchViewController:(id)a3 pageNumberForDocumentOrdinal:(int64_t)a4
{
  return 1;
}

- (id)pageLocationForPageIndex:(unint64_t)a3
{
  if (a3 == -1) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a3;
  }
  id v4 = [[BKPageLocation alloc] initWithOrdinal:0 andOffset:v3];

  return v4;
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  unint64_t v4 = +[BKPDFModernBookViewController pageIndexForPageNumber:a3];

  return [(BKPDFModernBookViewController *)self pageLocationForPageIndex:v4];
}

- (int64_t)pageNumberFromRange:(_NSRange)a3
{
  int64_t v4 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", a3.location, a3.length);
  int64_t result = [(BKPDFModernBookViewController *)self pageCountIncludingUpsell];
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (void)_willScrollPDFViewToPageNumber:(int64_t)a3
{
  [(BKPDFModernBookViewController *)self setTargetPageNumber:a3];
  int64_t v4 = +[AETestDriver shared];
  [v4 postEvent:kBETestDriverPageTurnSetupEnd sender:self];

  id v5 = +[AETestDriver shared];
  [v5 postEvent:kBETestDriverPageTurnAnimationStart sender:self];
}

- (void)_didScrollPDFViewToPage
{
  [(BKBookViewController *)self setLocation:0];

  [(BKBookViewController *)self setResumeLocation:0];
}

- (void)scrollToPageNumber:(int64_t)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = +[BKPDFModernBookViewController pageIndexForPageNumber:](BKPDFModernBookViewController, "pageIndexForPageNumber:");
  id v8 = [(BKPDFModernBookViewController *)self pdfView];
  id v9 = [v8 currentPage];

  if (v9)
  {
    double v10 = [(BKPDFModernBookViewController *)self pdfDocument];
    uint64_t v11 = (uint64_t)[v10 indexForPage:v9];
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_super v12 = _AEBookPluginsLifeCycleLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = +[NSNumber numberWithInteger:a3];
    +[NSNumber numberWithUnsignedInteger:v11];
    objc_super v14 = v24 = v11;
    uint64_t v15 = +[NSNumber numberWithUnsignedInteger:v7];
    id v16 = [(BKBookViewController *)self book];
    [v16 assetLogID];
    CGFloat v25 = v9;
    unint64_t v17 = v7;
    int64_t v18 = a3;
    v20 = BOOL v19 = v4;
    *(_DWORD *)buf = 138544130;
    double v27 = v13;
    __int16 v28 = 2114;
    CGFloat v29 = v14;
    __int16 v30 = 2114;
    objc_super v31 = v15;
    __int16 v32 = 2114;
    CGRect v33 = v20;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Scroll to page number:%{public}@, currentIndex:%{public}@, targetIndex:%{public}@, culogID:%{public}@", buf, 0x2Au);

    BOOL v4 = v19;
    a3 = v18;
    unint64_t v7 = v17;
    id v9 = v25;

    uint64_t v11 = v24;
  }

  if (v7 != v11)
  {
    [(BKPDFModernBookViewController *)self _willScrollPDFViewToPageNumber:a3];
    char v21 = [(BKPDFModernBookViewController *)self pdfDocument];
    CGRect v22 = [v21 pageAtIndex:v7];

    v23 = [(BKPDFModernBookViewController *)self pdfView];
    [v23 goToPage:v22 animated:v4];

    [(BKPDFModernBookViewController *)self _didScrollPDFViewToPage];
  }
}

- (id)currentPageLocation
{
  int64_t v3 = +[BKPDFModernBookViewController pageNumberForPageIndex:[(BKPDFModernBookViewController *)self currentPageIndex]];

  return [(BKPDFModernBookViewController *)self pageLocationForPageNumber:v3];
}

- (unint64_t)currentPageIndex
{
  int64_t v3 = [(BKPDFModernBookViewController *)self pdfView];
  BOOL v4 = [v3 currentPage];

  if (v4)
  {
    id v5 = [(BKPDFModernBookViewController *)self pdfDocument];
    id v6 = [v5 indexForPage:v4];
  }
  else
  {
    objc_opt_class();
    unint64_t v7 = [(BKBookViewController *)self location];
    id v5 = BUDynamicCast();

    id v6 = [v5 pageOffset];
  }
  unint64_t v8 = (unint64_t)v6;

  return v8;
}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  return [(BKPDFModernBookViewController *)self pageNumberForLocation:a4];
}

- (void)_scrollToRect:(CGRect)a3 inPageAtIndex:(int64_t)a4
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = BKModernPDFLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_13894C();
    }
LABEL_10:

    return;
  }
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v10 = [v9 pageCount];

  if ((unint64_t)v10 <= a4)
  {
    BOOL v4 = BKModernPDFLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_138980();
    }
    goto LABEL_10;
  }
  [(BKPDFModernBookViewController *)self _willScrollPDFViewToPageNumber:+[BKPDFModernBookViewController pageNumberForPageIndex:a4]];
  uint64_t v11 = [(BKPDFModernBookViewController *)self pdfView];
  [v11 constrainedScrollToPoint:x, y];

  [(BKPDFModernBookViewController *)self _didScrollPDFViewToPage];
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(BKPDFModernBookViewController *)self clearSelection];
  if ((char *)[(BKBookViewController *)self layout] == (char *)&dword_0 + 2) {
    [(BKPDFModernBookViewController *)self _jumpToLocationForVerticalScroll:v9 animated:v5];
  }
  else {
    [(BKPDFModernBookViewController *)self _jumpToLocationPaged:v9 animated:v5];
  }

  id v11 = objc_retainBlock(v8);
  id v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    id v10 = v11;
  }
}

- (void)_jumpToLocationPaged:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = -[BKPDFModernBookViewController pageNumberForLocation:](self, "pageNumberForLocation:");
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    unint64_t v7 = BUDynamicCast();
    id v8 = [v7 ordinal];
    id v6 = (char *)[v7 pageOffset] + (void)v8 + 1;
  }
  [(BKPDFModernBookViewController *)self scrollToPageNumber:v6 animate:v4];
}

- (void)_jumpToLocationForVerticalScroll:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v41 = a3;
  id v6 = -[BKPDFModernBookViewController pageIndexForLocation:](self, "pageIndexForLocation:");
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    unint64_t v7 = BUDynamicCast();
    id v8 = (char *)[v7 ordinal];
    id v6 = &v8[(void)[v7 pageOffset]];
  }
  objc_opt_class();
  id v9 = BUDynamicCast();
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 selection];
    objc_super v12 = [v11 pages];
    uint64_t v13 = [v12 firstObject];

    objc_super v14 = [(BKPDFModernBookViewController *)self view];
    [v14 frame];
    double v16 = v15;

    unint64_t v17 = [(BKPDFModernBookViewController *)self pdfView];
    [v11 boundsForPage:v13];
    [v17 convertRect:v13 fromPage:];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    CGFloat v26 = [(BKPDFModernBookViewController *)self pdfView];
    double v27 = [v26 documentView];
    __int16 v28 = [(BKPDFModernBookViewController *)self pdfView];
    [v27 convertRect:v28 fromView:v19, v21 + (v16 - v25) * -0.5, v23, v16];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    v37 = [(BKPDFModernBookViewController *)self pdfView];
    v38 = [v37 documentView];
    [v38 bounds];
    double v40 = v39 - v32;

    -[BKPDFModernBookViewController _scrollToRect:inPageAtIndex:](self, "_scrollToRect:inPageAtIndex:", v6, v30, v40, v34, v36);
  }
  else
  {
    [(BKPDFModernBookViewController *)self scrollToPageNumber:+[BKPDFModernBookViewController pageNumberForPageIndex:v6] animate:v4];
  }
}

- (int64_t)pageNumberForLocation:(id)a3
{
  unint64_t v3 = [(BKPDFModernBookViewController *)self pageIndexForLocation:a3];

  return +[BKPDFModernBookViewController pageNumberForPageIndex:v3];
}

- (unint64_t)pageIndexForLocation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = BUDynamicCast();

  id v5 = [v4 pageOffset];
  return (unint64_t)v5;
}

- (_NSRange)currentPages
{
  unint64_t v3 = [(BKPDFModernBookViewController *)self currentPageIndex];
  int64_t v4 = [(BKPDFModernBookViewController *)self pageCountIncludingUpsell];
  if (v3 >= v4 - 1) {
    NSUInteger v5 = v4 - 1;
  }
  else {
    NSUInteger v5 = v3;
  }
  NSUInteger v6 = 1;
  result.length = v6;
  result.id location = v5;
  return result;
}

- (id)_currentReadingProgress
{
  uint64_t v3 = [(BKPDFModernBookViewController *)self pageCountIncludingUpsell];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = v3;
    if (v3 < 1)
    {
      int64_t v4 = &off_1E9768;
    }
    else
    {
      id v7 = [(BKPDFModernBookViewController *)self currentPages];
      int64_t v4 = 0;
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v6)
      {
        *(float *)&double v8 = (float)((uint64_t)v7 + v6) / (float)v5;
        int64_t v4 = +[NSNumber numberWithFloat:v8];
      }
    }
  }

  return v4;
}

- (unint64_t)directoryTypeForPageThumbnails
{
  return 4;
}

- (unint64_t)directoryTypeForTOC
{
  return 5;
}

- (unint64_t)directoryTypeForBookmarks
{
  return 6;
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  id v4 = a3;
  if (v4
    && (![v4 isMemberOfClass:objc_opt_class()]
     || [(BKThumbnailBookViewController *)self canOrdinalOnlyLocationsBeVisible])
    && (unint64_t v5 = [(BKPDFModernBookViewController *)self pageIndexForLocation:v4],
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v7 = v5;
    id v8 = [(BKPDFModernBookViewController *)self currentPages];
    BOOL v6 = v7 >= (unint64_t)v8 && v7 - (unint64_t)v8 < v9;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)turnPageInDirection:(int64_t)a3
{
  unint64_t v5 = [(BKPDFModernBookViewController *)self currentPageIndex];
  int64_t v6 = +[BKPDFModernBookViewController pageNumberForPageIndex:v5];
  if (a3 == 1)
  {
    uint64_t v7 = -1;
  }
  else
  {
    if (a3) {
      return 0;
    }
    uint64_t v7 = 1;
  }
  int64_t v8 = +[BKPDFModernBookViewController pageNumberForPageIndex:v5 + v7];
  if (v8 != v6)
  {
    uint64_t v9 = v8;
    int64_t v10 = [(BKPDFModernBookViewController *)self pageCountIncludingUpsell];
    if (v9 >= 1 && v9 <= v10)
    {
      BOOL v12 = 1;
      [(BKPDFModernBookViewController *)self setIgnoreKeyboardInteraction:1];
      [(BKPDFModernBookViewController *)self scrollToPageNumber:v9 animate:+[UIView areAnimationsEnabled]];
      return v12;
    }
  }
  return 0;
}

- (BOOL)canGoToNextPage
{
  return ![(BKPDFModernBookViewController *)self assetEditingEnabled];
}

- (BOOL)canGoToPreviousPage
{
  return ![(BKPDFModernBookViewController *)self assetEditingEnabled];
}

- (BOOL)canNavigateByChapter
{
  return 0;
}

- (void)books_pageRight:(id)a3
{
  id v4 = a3;
  if ([(BKPDFModernBookViewController *)self isPageProgressionRTL]) {
    [(BKPDFModernBookViewController *)self books_pageBackward:v4];
  }
  else {
    [(BKPDFModernBookViewController *)self books_pageForward:v4];
  }
}

- (void)books_pageLeft:(id)a3
{
  id v4 = a3;
  if ([(BKPDFModernBookViewController *)self isPageProgressionRTL]) {
    [(BKPDFModernBookViewController *)self books_pageForward:v4];
  }
  else {
    [(BKPDFModernBookViewController *)self books_pageBackward:v4];
  }
}

- (void)books_pageForward:(id)a3
{
  if (![(BKPDFModernBookViewController *)self assetEditingEnabled]
    && ![(BKPDFModernBookViewController *)self ignoreKeyboardInteraction])
  {
    [(BKPDFModernBookViewController *)self turnPageInDirection:0];
  }
}

- (void)books_pageBackward:(id)a3
{
  if (![(BKPDFModernBookViewController *)self assetEditingEnabled]
    && ![(BKPDFModernBookViewController *)self ignoreKeyboardInteraction])
  {
    [(BKPDFModernBookViewController *)self turnPageInDirection:1];
  }
}

- (void)startCountingAnnotations
{
  if ([(BKBookViewController *)self _inAnalyticsReadSession])
  {
    id v3 = [(PDFDocument *)self->_pdfDocument copy];
    objc_initWeak(&location, self);
    id v4 = -[BKPDFAnnotationCounter initWithDocument:]([BKPDFAnnotationCounter alloc], "initWithDocument:", [v3 documentRef]);
    annotationCounter = self->_annotationCounter;
    self->_annotationCounter = v4;

    int64_t v6 = self->_annotationCounter;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_F3024;
    v7[3] = &unk_1DDC78;
    objc_copyWeak(&v8, &location);
    [(BKPDFAnnotationCounter *)v6 countMarkupAnnotationsWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)analyticsContentSettingData
{
  if ([(BKBookViewController *)self _inAnalyticsReadSession] && self->_annotationCountResults)
  {
    id v3 = objc_alloc((Class)BAContentSettingsData);
    id v4 = [(PDFDocument *)self->_pdfDocument bookmarkedPages];
    unint64_t v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    int64_t v6 = +[NSNumber numberWithUnsignedInteger:[(BKPDFAnnotationCounterResult *)self->_annotationCountResults numberOfMarkupAnnotationsWithPopups]];
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:[(BKPDFAnnotationCounterResult *)self->_annotationCountResults numberOfMarkupAnnotations]];
    id v8 = [v3 initWithBookmarkCount:v5 noteCount:v6 highlightCount:v7];
  }
  else
  {
    id v8 = [objc_alloc((Class)BAContentSettingsData) initWithBookmarkCount:&off_1E93E0 noteCount:&off_1E93E0 highlightCount:&off_1E93E0];
  }

  return v8;
}

- (BOOL)isPageBookmarked
{
  v2 = [(BKPDFModernBookViewController *)self pdfView];
  id v3 = [v2 currentPage];

  if (v3) {
    unsigned __int8 v4 = [v3 isBookmarked];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)visiblePageBookmarks
{
  v2 = BKModernPDFLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1389B4();
  }

  return 0;
}

- (void)updateBookmarkButton:(BOOL)a3
{
  unsigned __int8 v4 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v5 = [v4 allowsDocumentAssembly];

  unsigned int v6 = [(BKPDFModernBookViewController *)self isPageBookmarked];
  uint64_t v7 = @"bookmark";
  if (v6) {
    uint64_t v7 = @"bookmark.fill";
  }
  id v8 = v7;
  if ([(BKPDFModernBookViewController *)self im_isCompactHeight]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  [(UIButton *)self->super._bookmarkButton setEnabled:v5];
  bookmarkButton = self->super._bookmarkButton;
  id v11 = +[UIImage systemImageNamed:v8];

  BOOL v12 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v9 scale:17.0];
  uint64_t v13 = [v11 imageWithConfiguration:v12];
  [(UIButton *)bookmarkButton setImage:v13 forState:0];

  if ([(BKPDFModernBookViewController *)self isPageBookmarked])
  {
    id v15 = +[UIColor systemRedColor];
    [(UIButton *)self->super._bookmarkButton setTintColor:v15];
  }
  else
  {
    objc_super v14 = self->super._bookmarkButton;
    [(UIButton *)v14 setTintColor:0];
  }
}

- (void)toggleBookmark:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_F3470;
  v4[3] = &unk_1DAB88;
  v4[4] = self;
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v4];
  [(BKPDFModernBookViewController *)self updateBookmarkButton:1];
}

- (BOOL)canCopy
{
  v2 = [(BKPDFModernBookViewController *)self pdfView];
  id v3 = [v2 currentSelection];
  unsigned __int8 v4 = [v3 string];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (void)copy:(id)a3
{
  id v3 = [(BKPDFModernBookViewController *)self pdfView];
  unsigned __int8 v4 = [v3 currentSelection];

  BOOL v5 = [v4 string];
  if ([v5 length])
  {
    unsigned int v6 = [UTTypeUTF8PlainText identifier];
    double v24 = v6;
    double v25 = v5;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    id v8 = [v4 attributedString];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 length];
      NSAttributedStringDocumentAttributeKey v22 = NSDocumentTypeDocumentAttribute;
      NSAttributedStringDocumentType v23 = NSRTFTextDocumentType;
      id v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      BOOL v12 = [v9 dataFromRange:0 documentAttributes:v10 error:v11];

      uint64_t v13 = [UTTypeRTF identifier];
      double v19 = v13;
      id v14 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
      id v20 = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v21[0] = v15;
      v21[1] = v7;
      double v16 = +[NSArray arrayWithObjects:v21 count:2];
      unint64_t v17 = +[UIPasteboard generalPasteboard];
      [v17 setItems:v16];
    }
    else
    {
      double v18 = v7;
      BOOL v12 = +[NSArray arrayWithObjects:&v18 count:1];
      uint64_t v13 = +[UIPasteboard generalPasteboard];
      [v13 setItems:v12];
    }
  }
}

- (void)scrub:(id)a3
{
}

- (void)scrubValueChanged:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKPDFModernBookViewController;
  [(BKThumbnailBookViewController *)&v11 scrubValueChanged:v4];
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F3938;
  block[3] = &unk_1DB6B0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)scrub:(id)a3 isScrubbing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = v9;
  if (v9)
  {
    id v8 = [v9 pageNumber];
    [(BKPDFModernBookViewController *)self setScrubbing:v4];
    [(BKPDFModernBookViewController *)self turnToPageNumber:v8 animated:0];
    [(BKPDFModernBookViewController *)self setScrubbing:0];
    uint64_t v7 = v9;
    if (!v4)
    {
      [(BKBookViewController *)self emitScrubEventStartPosition:[(BKBookViewController *)self pageNumberBeforeScrubbing] endPosition:v8 totalLength:[(BKPDFModernBookViewController *)self pageCountIncludingUpsell]];
      uint64_t v7 = v9;
    }
  }
}

- (void)updateScrubber:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int64_t v6 = [(BKPDFModernBookViewController *)self pageCountIncludingUpsell];
  if (v6)
  {
    unint64_t v7 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(BKBookViewController *)self controlsVisible])
      {
        id v8 = [(BKThumbnailBookViewController *)self scrubber];
        [v8 setPageCount:v7];

        unint64_t v9 = -[BKPDFModernBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", location, length);
        if (v9 >= v7) {
          unint64_t v10 = v7;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10 <= 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = v10;
        }
        BOOL v12 = [(BKThumbnailBookViewController *)self scrubber];
        [v12 setPageNumber:v11];

        id v13 = [(BKThumbnailBookViewController *)self scrubber];
        [v13 setProgress:1.0];
      }
    }
  }
}

- (BOOL)thumbnailDirectoryWantsPageNumber:(id)a3
{
  return 1;
}

- (id)imageCache
{
  p_imageCache = &self->super._imageCache;
  if (!self->super._imageCache)
  {
    BOOL v4 = [(BKBookViewController *)self book];

    if (v4)
    {
      dispatch_time_t v5 = [(BKPDFModernBookViewController *)self pdfDocument];
      unsigned int v6 = [v5 isLocked];

      if (v6) {
        uint64_t v7 = 7340032;
      }
      else {
        uint64_t v7 = 0x100000;
      }
      id v8 = [AEPdfRenderingCache alloc];
      unint64_t v9 = [(BKBookViewController *)self book];
      unint64_t v10 = [v9 databaseKey];
      uint64_t v11 = [(AEPdfRenderingCache *)v8 initWithIdentifier:v10 memorySize:v7];

      objc_storeStrong((id *)p_imageCache, v11);
      +[BKThumbnailDirectory defaultCellSize];
      -[IMThumbnailRenderingCache setPrimaryImageSize:](*p_imageCache, "setPrimaryImageSize:");
      BOOL v12 = [(AEPdfRenderingCache *)v11 persistentCachePath];
      id v13 = [(BKBookViewController *)self book];
      id v14 = [v13 persistentCachePath];
      unsigned __int8 v15 = [v12 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        double v16 = [(BKBookViewController *)self book];
        [v16 resetPersistentCache];

        unint64_t v17 = [(BKBookViewController *)self book];
        double v18 = [(AEPdfRenderingCache *)v11 persistentCachePath];
        [v17 setPersistentCachePath:v18];

        [(NSManagedObjectContext *)self->super.super._bookMoc save:0];
      }
    }
  }
  double v19 = *p_imageCache;

  return v19;
}

+ (int64_t)pageNumberForPageIndex:(unint64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return a3 + 1;
  }
}

+ (unint64_t)pageIndexForPageNumber:(int64_t)a3
{
  if (a3 <= 0) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

- (void)beginScroll:(id)a3
{
}

- (void)endScroll:(id)a3
{
  [(BKPDFModernBookViewController *)self setScrolling:0];

  [(BKPDFModernBookViewController *)self updateContentScale];
}

- (void)visiblePageDidChange:(id)a3
{
  BOOL v4 = [(BKPDFModernBookViewController *)self pdfView];
  dispatch_time_t v5 = [v4 currentPage];

  unsigned int v6 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v7 = [v6 indexForPage:v5];

  id v8 = BKModernPDFLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_138A8C((uint64_t)v7, v5);
  }

  int64_t v9 = +[BKPDFModernBookViewController pageNumberForPageIndex:v7];
  unint64_t v10 = [(BKThumbnailBookViewController *)self scrubber];
  [v10 setPageNumber:v9];

  int64_t v11 = [(BKPDFModernBookViewController *)self pageCountIncludingUpsell];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = v11;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(BKPDFModernBookViewController *)self currentPages];
      [(BKThumbnailBookViewController *)self setPageNumberHudTextLabelForValidatedPageNumber:v9 visiblePageCount:v13 validatedPageCount:v12];
      [(BKBookViewController *)self setUserNavigated:1];
    }
  }
  [(BKPDFModernBookViewController *)self updateBookmarkButton:1];
  [(BKPDFModernBookViewController *)self updateProgressKitForNewLocation];
}

- (void)scrollerViewPageDidChange:(id)a3
{
  BOOL v4 = [(BKPDFModernBookViewController *)self pdfView];
  id v10 = [v4 currentPage];

  dispatch_time_t v5 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v6 = [v5 indexForPage:v10];

  id v7 = +[BKPDFModernBookViewController pageNumberForPageIndex:v6];
  if (v7 == (void *)[(BKPDFModernBookViewController *)self targetPageNumber])
  {
    id v8 = +[AETestDriver shared];
    [v8 postEvent:kBETestDriverPageTurnAnimationEnd sender:self];

    int64_t v9 = +[AETestDriver shared];
    [v9 postEvent:kBETestDriverPageTurnEnd sender:self];
  }
  [(BKPDFModernBookViewController *)self setIgnoreKeyboardInteraction:0];
}

- (void)annotationsDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  dispatch_time_t v5 = [v4 userInfo];

  id v6 = BUDynamicCast();

  objc_opt_class();
  id v7 = [v6 objectForKeyedSubscript:@"page"];
  id v8 = BUDynamicCast();

  if (v8)
  {
    int64_t v9 = [(BKPDFModernBookViewController *)self pdfDocument];
    id v10 = [v9 indexForPage:v8];

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v10) {
        [(BKPDFModernBookViewController *)self setCoverNeedsUpdate:1];
      }
      int64_t v11 = BKModernPDFLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_138B5C((uint64_t)v10, v11);
      }
    }
  }
  [(BKPDFModernBookViewController *)self _evaluateUndoRedoEnabled];
}

- (id)PDFViewParentViewController
{
  v2 = self;

  return v2;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
}

- (id)menuItems:(id)a3 forPage:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_F422C;
  v10[3] = &unk_1DDCA0;
  id v4 = (id)objc_opt_new();
  id v11 = v4;
  dispatch_time_t v5 = objc_retainBlock(v10);
  id v6 = AEBundle();
  id v7 = [v6 localizedStringForKey:@"Search" value:&stru_1DF0D8 table:0];
  ((void (*)(void *, void *, const char *))v5[2])(v5, v7, "searchPDFUsingSelection:");

  id v8 = v4;
  return v8;
}

- (UIEdgeInsets)pdfViewContentInset
{
  id v3 = [(BKPDFModernBookViewController *)self pdfView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int64_t v12 = [(BKThumbnailBookViewController *)self topToolbar];
  [v12 alpha];
  if (v13 > 0.0)
  {
    [v12 frame];
    double v5 = v5 + CGRectGetHeight(v18);
  }

  double v14 = v5;
  double v15 = v7;
  double v16 = v9;
  double v17 = v11;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.top = v14;
  return result;
}

- (void)searchPDFUsingSelection:(id)a3
{
  id v4 = a3;
  double v5 = [(BKPDFModernBookViewController *)self pdfView];
  id v8 = [v5 currentSelection];

  double v6 = [v8 string];
  double v7 = [(BKPDFModernBookViewController *)self pdfView];
  [v7 clearSelection];

  [(BKBookViewController *)self showSearchWithString:v6 sender:v4];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)BKPDFModernBookViewController;
  [(BKPDFModernBookViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(BKPDFModernBookViewController *)self updateContentInsets];
}

- (void)updateContentInsets
{
  id v7 = [(BKPDFModernBookViewController *)self pdfScrollView];
  objc_super v3 = [(BKPDFModernBookViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v6 = [(BKPDFModernBookViewController *)self view];
  [v6 safeAreaInsets];
  [v7 setContentInset:v5, 0.0];
}

- (id)_uniqueIDForOutline:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    double v4 = v3;
    double v5 = &stru_1DF0D8;
    do
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld/%@", [v4 index], v5);
      double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      uint64_t v7 = [v4 parent];

      double v5 = v6;
      double v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    double v6 = &stru_1DF0D8;
  }

  return v6;
}

- (void)buildContextTree:(id)a3
{
  double v4 = objc_opt_new();
  double v5 = [(BKPDFModernBookViewController *)self pdfDocument];
  double v6 = [v5 outlineRoot];

  if ([v6 numberOfChildren])
  {
    unint64_t v7 = 0;
    uint64_t v24 = BCProgressContextTreeKey_uniqueID;
    uint64_t v23 = BCProgressContextTreeKey_title;
    uint64_t v22 = BCProgressContextTreeKey_displayOrder;
    uint64_t v21 = BCProgressContextTreeKey_cfi;
    do
    {
      id v8 = [v6 childAtIndex:v7];
      uint64_t v9 = [v8 label];
      double v10 = (void *)v9;
      double v11 = &stru_1DF0D8;
      if (v9) {
        double v11 = (__CFString *)v9;
      }
      int64_t v12 = v11;

      double v13 = [(BKPDFModernBookViewController *)self _uniqueIDForOutline:v8];
      int64_t v14 = +[BKPDFModernBookViewController pageNumberForPageIndex:[(BKPDFModernBookViewController *)self _pageIndexForOutline:v8]];
      v25[0] = v24;
      v25[1] = v23;
      v26[0] = v13;
      v26[1] = v12;
      v25[2] = v22;
      double v15 = +[NSNumber numberWithInteger:v7];
      v26[2] = v15;
      v25[3] = v21;
      double v16 = +[NSString stringWithFormat:@"page(%lu)", v14];
      v26[3] = v16;
      double v17 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

      [v4 addObject:v17];
      ++v7;
    }
    while (v7 < (unint64_t)[v6 numberOfChildren]);
  }
  if ([v4 count])
  {
    CGRect v18 = +[BCProgressKitController sharedController];
    double v19 = [(BKBookViewController *)self book];
    id v20 = [v19 assetID];
    [v18 buildContextTree:v4 forBook:v20 completion:0];
  }
}

- (void)updateProgressKitForNewLocation
{
  unint64_t v3 = [(BKPDFModernBookViewController *)self currentPageIndex];
  double v4 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v26 = [v4 outlineRoot];

  double v5 = (char *)[v26 numberOfChildren];
  double v6 = v5 - 1;
  if ((uint64_t)v5 >= 1)
  {
    unint64_t v7 = v5;
    uint64_t v8 = 0;
    uint64_t v9 = -1;
    do
    {
      double v10 = [v26 childAtIndex:v8];
      unint64_t v11 = [(BKPDFModernBookViewController *)self _pageIndexForOutline:v10];

      if (v11 > v3)
      {
        if (v8 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v8;
        }
        uint64_t v9 = v12 - 1;
        goto LABEL_13;
      }
      if (v6 == (char *)v8) {
        uint64_t v9 = v8;
      }
      ++v8;
    }
    while (v7 != (char *)v8);
    if (v9 < 0) {
      goto LABEL_20;
    }
LABEL_13:
    double v13 = [v26 childAtIndex:v9];
    if (v9 >= (uint64_t)v6)
    {
      int64_t v14 = 0;
    }
    else
    {
      int64_t v14 = [v26 childAtIndex:v9 + 1];
    }
    double v25 = [(BKPDFModernBookViewController *)self _uniqueIDForOutline:v13];
    unint64_t v15 = [(BKPDFModernBookViewController *)self _pageIndexForOutline:v13];
    if (v14)
    {
      double v16 = [(BKPDFModernBookViewController *)self _pageIndexForOutline:v14];
    }
    else
    {
      double v17 = [(BKPDFModernBookViewController *)self pdfDocument];
      double v16 = (char *)[v17 pageCount];
    }
    CGRect v18 = +[BCProgressKitController sharedController];
    double v19 = [(BKBookViewController *)self book];
    id v20 = [v19 assetID];
    uint64_t v21 = [v13 label];
    [v18 activateChapterForBook:v20 chapterID:v25 title:v21 currentPage:v3 chapterRange:v15 completion:&v16[-v15]];
  }
LABEL_20:
  uint64_t v22 = +[BCProgressKitController sharedController];
  uint64_t v23 = [(BKBookViewController *)self book];
  uint64_t v24 = [v23 assetID];
  [v22 updateBookProgress:v24 currentPage:[self currentPageIndex] completion:0];
}

- (unint64_t)_pageIndexForOutline:(id)a3
{
  double v4 = [a3 destination];
  double v5 = [v4 page];
  double v6 = [(BKPDFModernBookViewController *)self pdfDocument];
  id v7 = [v6 indexForPage:v5];

  return (unint64_t)v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_controlsTapRecognizer != a3) {
    return 0;
  }
  double v4 = [(BKPDFModernBookViewController *)self pdfView];
  double v5 = [v4 currentSelection];
  BOOL v3 = v5 == 0;

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_controlsTapRecognizer == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 name];
    unsigned __int8 v8 = [v7 isEqualToString:@"UITextInteractionNameSingleTap"];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)assetReloading
{
  return self->assetReloading;
}

- (void)setAssetReloading:(BOOL)a3
{
  self->assetReloading = a3;
}

- (BCCoverResetting)sharedBookCoverResetter
{
  return self->_sharedBookCoverResetter;
}

- (void)setSharedBookCoverResetter:(id)a3
{
}

- (PDFView)pdfView
{
  return self->_pdfView;
}

- (void)setPdfView:(id)a3
{
}

- (AEPdfCache)pdfDocumentCache
{
  return self->_pdfDocumentCache;
}

- (void)setPdfDocumentCache:(id)a3
{
}

- (void)setPdfDocument:(id)a3
{
}

- (UIView)akToolbarView
{
  return self->_akToolbarView;
}

- (void)setAkToolbarView:(id)a3
{
}

- (UITapGestureRecognizer)controlsTapRecognizer
{
  return self->_controlsTapRecognizer;
}

- (void)setControlsTapRecognizer:(id)a3
{
}

- (NSUndoManager)pdfUndoManager
{
  return self->_pdfUndoManager;
}

- (void)setPdfUndoManager:(id)a3
{
}

- (double)initialZoomFactor
{
  return self->_initialZoomFactor;
}

- (void)setInitialZoomFactor:(double)a3
{
  self->_initialZoomFactor = a3;
}

- (double)aspectRatioFromPDF
{
  return self->_aspectRatioFromPDF;
}

- (void)setAspectRatioFromPDF:(double)a3
{
  self->_aspectRatioFromPDF = a3;
}

- (void)setPerformSelectorProxy:(id)a3
{
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (BOOL)coverNeedsUpdate
{
  return self->_coverNeedsUpdate;
}

- (void)setCoverNeedsUpdate:(BOOL)a3
{
  self->_coverNeedsUpdate = a3;
}

- (BOOL)assetEditingRequested
{
  return self->_assetEditingRequested;
}

- (void)setAssetEditingRequested:(BOOL)a3
{
  self->_assetEditingRequested = a3;
}

- (BOOL)stateShouldClose
{
  return self->_stateShouldClose;
}

- (void)setStateShouldClose:(BOOL)a3
{
  self->_stateShouldClose = a3;
}

- (BOOL)ignoreKeyboardInteraction
{
  return self->_ignoreKeyboardInteraction;
}

- (void)setIgnoreKeyboardInteraction:(BOOL)a3
{
  self->_ignoreKeyboardInteraction = a3;
}

- (BOOL)isSaving
{
  return self->_isSaving;
}

- (void)setIsSaving:(BOOL)a3
{
  self->_isSaving = a3;
}

- (BOOL)currentlyAtMinimumScaleFactor
{
  return self->_currentlyAtMinimumScaleFactor;
}

- (void)setCurrentlyAtMinimumScaleFactor:(BOOL)a3
{
  self->_currentlyAtMinimumScaleFactor = a3;
}

- (double)minimumScaleWithToolBars
{
  return self->_minimumScaleWithToolBars;
}

- (void)setMinimumScaleWithToolBars:(double)a3
{
  self->_minimumScaleWithToolBars = a3;
}

- (int64_t)targetPageNumber
{
  return self->_targetPageNumber;
}

- (void)setTargetPageNumber:(int64_t)a3
{
  self->_targetPageNumber = a3;
}

- (BKPDFAnnotationCounter)annotationCounter
{
  return self->_annotationCounter;
}

- (void)setAnnotationCounter:(id)a3
{
}

- (BKPDFAnnotationCounterResult)annotationCountResults
{
  return self->_annotationCountResults;
}

- (void)setAnnotationCountResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationCountResults, 0);
  objc_storeStrong((id *)&self->_annotationCounter, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_pdfUndoManager, 0);
  objc_storeStrong((id *)&self->_controlsTapRecognizer, 0);
  objc_storeStrong((id *)&self->_akToolbarView, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_pdfDocumentCache, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
  objc_storeStrong((id *)&self->_sharedBookCoverResetter, 0);

  objc_storeStrong((id *)&self->_writeQueue, 0);
}

@end