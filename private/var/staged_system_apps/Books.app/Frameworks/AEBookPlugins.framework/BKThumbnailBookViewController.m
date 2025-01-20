@interface BKThumbnailBookViewController
+ (BOOL)verticalScrollFeatureEnabled;
- (BCNavigationBar)topToolbar;
- (BKInfoHUD)pageNumberHUD;
- (BKLocation)initialJumpLocation;
- (BKPreferredLayoutCache)preferredLayoutCache;
- (BKThumbnailBookViewConfiguration)configuration;
- (BKThumbnailBookViewController)initWithBook:(id)a3 storeID:(id)a4;
- (BKThumbnailScrubber)verticalScrubber;
- (BOOL)_isUsingContent:(id)a3;
- (BOOL)_shouldNavBarShowTitle;
- (BOOL)_shouldShowAudioToolbarButton;
- (BOOL)assetEditingEnabled;
- (BOOL)canOrdinalOnlyLocationsBeVisible;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowBookmarks;
- (BOOL)canShowControlsDuringOpenClose;
- (BOOL)canShowTableOfContents;
- (BOOL)canShowThumbnails;
- (BOOL)catalystToolbarActive;
- (BOOL)directoryTOCIsVisible;
- (BOOL)hasHighlightedText;
- (BOOL)hasSpreadPages;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isInterfaceRTL;
- (BOOL)isLocationOnCurrentPage:(id)a3;
- (BOOL)isScrolledContinuousFixedLayout;
- (BOOL)onlySupportsScrollingLayout;
- (BOOL)shouldDisplayBookmarksButton;
- (BOOL)shouldDisplayBuyButton;
- (BOOL)shouldDisplayContentsButton;
- (BOOL)shouldDisplayHighlightsButton;
- (BOOL)shouldDisplayPageThumbnailsButton;
- (BOOL)shouldDisplaySearchControls;
- (BOOL)shouldDisplayTitleWhenActive;
- (BOOL)shouldDisplayTitleWhenInactive;
- (BOOL)shouldShowBookmarkControl;
- (BOOL)shouldShowBrightnessControl;
- (BOOL)shouldShowHUDs;
- (BOOL)shouldShowTOCControl;
- (BOOL)shouldShowUndoControls;
- (BOOL)supportsBrightness;
- (BOOL)supportsDocumentEditing;
- (BOOL)supportsDocumentEditingUndo;
- (BOOL)supportsDocumentEditingUndoAll;
- (BOOL)supportsScrollLayout;
- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)wantsBottomToolbar;
- (CGRect)_containerBoundsForGeometry;
- (NSArray)configurations;
- (NSDictionary)directoryTypeToSegmentIndex;
- (NSDictionary)segmentIndexToDirectoryType;
- (NSLayoutConstraint)pageNumberHUDHeightConstraint;
- (NSLayoutConstraint)pageNumberHUDTopConstraint;
- (NSLayoutConstraint)pageNumberHUDWidthConstraint;
- (NSLayoutConstraint)topBarTopConstraint;
- (NSString)tipContextName;
- (UIEdgeInsets)edgeInsetsForContentViewController:(id)a3;
- (UIView)backgroundView;
- (_NSRange)currentPages;
- (double)_contentAspectRatio;
- (double)_infoHUDHeight;
- (double)defaultPageNumberHUDWidthConstraintConstant;
- (id)_audioBarButtonItem;
- (id)_bk_backgroundColor;
- (id)_bookmarkBarButtonItem;
- (id)_bookmarkButton;
- (id)_bookmarkDirectory;
- (id)_brightnessBarButtonItem;
- (id)_buyBarButtonItem;
- (id)_directoryController;
- (id)_directoryForType:(unint64_t)a3;
- (id)_directorySwitchBarButtonItem;
- (id)_editToolboxBarButtonItem;
- (id)_fontBarButtonItem;
- (id)_libraryBarButtonItem;
- (id)_pageDirectory;
- (id)_pdfBookmarkDirectory;
- (id)_pdfOutlineDirectory;
- (id)_pdfPageDirectory;
- (id)_resumeBarButtonItem;
- (id)_searchBarButtonItem;
- (id)_tocBarButtonItem;
- (id)_tocDirectory;
- (id)analyticsReadingSettingsData;
- (id)appearanceMenuItems;
- (id)bookContentView;
- (id)bookContentViewControllerView;
- (id)bookToolbarCurrentPageString;
- (id)bookToolbarTitle;
- (id)bookmarkToolTip;
- (id)buttonTitleColor;
- (id)contentViewControllerForPageNumber:(int64_t)a3;
- (id)currentPageLocation;
- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4;
- (id)directoryTOCViewControllerView;
- (id)documentForDirectory;
- (id)editRedoBarButtonItem;
- (id)editUndoBarButtonItem;
- (id)existingContentViewControllerForPageNumber:(int64_t)a3;
- (id)fontButton;
- (id)imageCache;
- (id)newGlassButton;
- (id)scrubber;
- (id)scrubberBarButtonItem;
- (id)searchButtonItem;
- (id)snapshotView:(id)a3;
- (id)thumbnailDirectory:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6;
- (id)thumbnailScrubber:(id)a3 pageTitleForPageNumber:(int64_t)a4;
- (id)thumbnailScrubber:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6;
- (id)tocToolTip;
- (id)transitionContentBackgroundColor;
- (id)transitionContentView;
- (id)visibleContentViewController;
- (int64_t)bookToolbarMode;
- (int64_t)bookToolbarTransparency;
- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4;
- (int64_t)positionForBar:(id)a3;
- (int64_t)segmentIndexForDirectoryType:(unint64_t)a3;
- (unint64_t)defaultDirectoryType;
- (unint64_t)directoryType;
- (unint64_t)directoryTypeForBookmarks;
- (unint64_t)directoryTypeForPageThumbnails;
- (unint64_t)directoryTypeForSegmentIndex:(int64_t)a3;
- (unint64_t)directoryTypeForTOC;
- (unint64_t)scrollLayoutForBook:(id)a3;
- (unint64_t)validLayoutForBook:(id)a3 desiredLayout:(unint64_t)a4;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_update;
- (void)_updateBuyButton;
- (void)_updateDirectorySwitch;
- (void)_updateLibraryBarButtonItem;
- (void)_updatePageNumberHUDVisible:(BOOL)a3;
- (void)_updateToolbarPositionAndBackgroundExtension;
- (void)_zoomInAnimationDidStop:(id)a3;
- (void)_zoomOutAnimationDidStop:(id)a3;
- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4;
- (void)assetViewControllerDidEndLiveResize;
- (void)assetViewControllerDidEnterFullScreen;
- (void)assetViewControllerDidExitFullScreen;
- (void)assetViewControllerDidFinishUpdateForLiveResize;
- (void)assetViewControllerUpdateToolbars;
- (void)assetViewControllerWillBeginLiveResize;
- (void)bookContentViewImage:(id)a3;
- (void)books_decreaseZoom:(id)a3;
- (void)books_disableContinuousScroll:(id)a3;
- (void)books_enableContinuousScroll:(id)a3;
- (void)books_increaseZoom:(id)a3;
- (void)books_resetZoom:(id)a3;
- (void)books_showBookmarks:(id)a3;
- (void)books_showTableOfContents:(id)a3;
- (void)books_showThumbnails:(id)a3;
- (void)books_skipBackward:(id)a3;
- (void)books_stopPlaying:(id)a3;
- (void)books_toggleContinuousScroll:(id)a3;
- (void)books_togglePlaying:(id)a3;
- (void)buildHoverControlRegionWithBuilder:(id)a3;
- (void)close:(BOOL)a3;
- (void)contentSizeCategoryDidChange;
- (void)contentViewReady:(id)a3;
- (void)dealloc;
- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)directoryContent:(id)a3 didSelectLocation:(id)a4;
- (void)directorySwitchPressed:(id)a3;
- (void)donePressedFromToolbar:(id)a3;
- (void)handleEditRedo:(id)a3;
- (void)handleEditUndo:(id)a3;
- (void)handleEditUndoAll:(id)a3;
- (void)highlightSearchResult:(id)a3;
- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)makeContentVisible;
- (void)makeTOCVisible;
- (void)pageCountDidUpdate;
- (void)pageNavigationDidChangeLocation:(id)a3;
- (void)pageNavigationDidRemoveContentForPageNumber:(int64_t)a3;
- (void)pageNavigationDidRemoveContentViewController:(id)a3;
- (void)pageNavigationToggleControls:(id)a3;
- (void)releaseViews;
- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4 pageNumber:(int64_t)a5;
- (void)resume:(id)a3;
- (void)scrubValueChanged:(id)a3;
- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDirectoryType:(unint64_t)a3;
- (void)setInitialJumpLocation:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setPageNumberHUDHeightConstraint:(id)a3;
- (void)setPageNumberHUDTopConstraint:(id)a3;
- (void)setPageNumberHudTextLabelForValidatedPageNumber:(int64_t)a3 visiblePageCount:(unint64_t)a4 validatedPageCount:(unint64_t)a5;
- (void)setPreferredLayoutCache:(id)a3;
- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5;
- (void)setTopBarTopConstraint:(id)a3;
- (void)setTopToolBarVisible:(BOOL)a3;
- (void)setVerticalScrubber:(id)a3;
- (void)showAudioControlsFromToolbar:(id)a3;
- (void)showBookmarksFromToolbar:(id)a3;
- (void)showFontPicker:(id)a3;
- (void)showLibrary:(id)a3;
- (void)showOverlayViewController:(id)a3 fromView:(id)a4 popoverOnPhone:(BOOL)a5 passthroughViews:(id)a6;
- (void)showTOC:(id)a3;
- (void)showTOCFromToolbar:(id)a3;
- (void)showThumbnailTOCFromToolbar:(id)a3;
- (void)storeChangedNotification:(id)a3;
- (void)thumbnailDirectory:(id)a3 cancelPreviousRenderRequestsWithContext:(id)a4;
- (void)thumbnailScrubber:(id)a3 cancelPreviousRenderRequestsWithContext:(id)a4;
- (void)tocViewController:(id)a3 didSelectChapter:(id)a4;
- (void)toggleControls:(id)a3;
- (void)toggleEditAssetMode:(id)a3;
- (void)toolbarDidBecomeActive:(id)a3;
- (void)toolbarDidBecomeInactive:(id)a3;
- (void)turnToFirstPage:(BOOL)a3 animated:(BOOL)a4;
- (void)turnToInitialPage:(BOOL)a3 animated:(BOOL)a4;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)updateBookmarkButton:(BOOL)a3;
- (void)updateBottomToolbar:(BOOL)a3;
- (void)updateHUDVisibilityAnimated:(BOOL)a3;
- (void)updateScrubber:(_NSRange)a3;
- (void)updateTopToolbar:(BOOL)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKThumbnailBookViewController

- (BKThumbnailBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewController;
  v4 = [(BKBookViewController *)&v8 initWithBook:a3 storeID:a4];
  if (v4)
  {
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKThumbnailBookViewController *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)releaseViews
{
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  topToolbar = self->_topToolbar;
  self->_topToolbar = 0;

  pageNumberHUDHeightConstraint = self->_pageNumberHUDHeightConstraint;
  self->_pageNumberHUDHeightConstraint = 0;

  pageNumberHUDTopConstraint = self->_pageNumberHUDTopConstraint;
  self->_pageNumberHUDTopConstraint = 0;

  pageNumberHUD = self->_pageNumberHUD;
  self->_pageNumberHUD = 0;

  libraryBarButtonItem = self->_libraryBarButtonItem;
  self->_libraryBarButtonItem = 0;

  resumeBarButtonItem = self->_resumeBarButtonItem;
  self->_resumeBarButtonItem = 0;

  searchBarButtonItem = self->_searchBarButtonItem;
  self->_searchBarButtonItem = 0;

  tocBarButtonItem = self->_tocBarButtonItem;
  self->_tocBarButtonItem = 0;

  brightnessBarButtonItem = self->_brightnessBarButtonItem;
  self->_brightnessBarButtonItem = 0;

  editToolboxBarButtonItem = self->_editToolboxBarButtonItem;
  self->_editToolboxBarButtonItem = 0;

  editUndoBarButtonItem = self->_editUndoBarButtonItem;
  self->_editUndoBarButtonItem = 0;

  editRedoBarButtonItem = self->_editRedoBarButtonItem;
  self->_editRedoBarButtonItem = 0;

  audioBarButtonItem = self->_audioBarButtonItem;
  self->_audioBarButtonItem = 0;

  [(UISegmentedControl *)self->_directorySwitch removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  directorySwitch = self->_directorySwitch;
  self->_directorySwitch = 0;

  directorySwitchBarButtonItem = self->_directorySwitchBarButtonItem;
  self->_directorySwitchBarButtonItem = 0;

  bookmarkButton = self->_bookmarkButton;
  self->_bookmarkButton = 0;

  bookmarkBarButtonItem = self->_bookmarkBarButtonItem;
  self->_bookmarkBarButtonItem = 0;

  [(BKThumbnailScrubber *)self->_scrubber setDelegate:0];
  [(BKThumbnailScrubber *)self->_scrubber removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  scrubber = self->_scrubber;
  self->_scrubber = 0;

  [(BKThumbnailScrubber *)self->_verticalScrubber setDelegate:0];
  [(BKThumbnailScrubber *)self->_verticalScrubber removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  verticalScrubber = self->_verticalScrubber;
  self->_verticalScrubber = 0;

  v23.receiver = self;
  v23.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v23 releaseViews];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(BKThumbnailBookViewController *)self releaseViews];
  [(BKDirectoryContent *)self->_pageDirectory setDirectoryDelegate:0];
  [(BKTOCViewController *)self->_tocDirectory setDirectoryDelegate:0];
  [(BKDirectoryContent *)self->_bookmarkDirectory setDirectoryDelegate:0];
  [(BKDirectoryContent *)self->_pdfPageDirectory setDirectoryDelegate:0];
  [(BKTOCViewController *)self->_pdfOutlineDirectory setDirectoryDelegate:0];
  [(BKDirectoryContent *)self->_pdfBookmarkDirectory setDirectoryDelegate:0];
  [(IMThumbnailRenderingCache *)self->_imageCache cancelRenderingCacheOperationsForTarget:self];
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v76.receiver = self;
  v76.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v76 viewDidLoad];
  v3 = [(BKThumbnailBookViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [objc_alloc((Class)UIView) initWithFrame:v5, v7, v9, v11];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  [(UIView *)self->_backgroundView setAutoresizingMask:18];
  [(UIView *)self->_backgroundView setOpaque:1];
  v14 = [(BKThumbnailBookViewController *)self view];
  [v14 insertSubview:self->_backgroundView atIndex:0];

  id v15 = objc_alloc((Class)BCNavigationBar);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v19 = [v15 initWithFrame:CGRectZero.origin.x, y, width, height];
  topToolbar = self->_topToolbar;
  self->_topToolbar = v19;

  [(BCNavigationBar *)self->_topToolbar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BCNavigationBar *)self->_topToolbar setAlpha:0.0];
  [(BCNavigationBar *)self->_topToolbar setDelegate:self];
  v21 = self->_topToolbar;
  v22 = [(BKThumbnailBookViewController *)self theme];
  objc_super v23 = [v22 headerTextColor];
  v24 = +[NSDictionary dictionaryWithObject:v23 forKey:NSForegroundColorAttributeName];
  [(BCNavigationBar *)v21 setTitleTextAttributes:v24];

  v25 = [(BKThumbnailBookViewController *)self theme];
  [v25 stylizeBCNavigationBarTranslucent:self->_topToolbar];

  v26 = [(BKThumbnailBookViewController *)self view];
  [v26 addSubview:self->_topToolbar];

  v74 = [(BCNavigationBar *)self->_topToolbar leadingAnchor];
  v75 = [(BKThumbnailBookViewController *)self view];
  v73 = [v75 leadingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v79[0] = v72;
  v27 = [(BCNavigationBar *)self->_topToolbar trailingAnchor];
  v28 = [(BKThumbnailBookViewController *)self view];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v79[1] = v30;
  v31 = [(BCNavigationBar *)self->_topToolbar topAnchor];
  v32 = [(BKThumbnailBookViewController *)self view];
  v33 = [v32 topAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  topBarTopConstraint = self->_topBarTopConstraint;
  self->_topBarTopConstraint = v34;

  v79[2] = v34;
  v36 = +[NSArray arrayWithObjects:v79 count:3];
  +[NSLayoutConstraint activateConstraints:v36];

  if ([(BKThumbnailBookViewController *)self wantsBottomToolbar])
  {
    v37 = [(BKThumbnailBookViewController *)self scrubberBarButtonItem];
    v78 = v37;
    v38 = +[NSArray arrayWithObjects:&v78 count:1];
    [(BKThumbnailBookViewController *)self setToolbarItems:v38];
  }
  [(BKBookViewController *)self setSection:0];
  [(BKThumbnailBookViewController *)self updateTopToolbar:0];
  v39 = -[BKInfoHUD initWithFrame:]([BKInfoHUD alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  pageNumberHUD = self->_pageNumberHUD;
  self->_pageNumberHUD = v39;

  [(BKInfoHUD *)self->_pageNumberHUD setUsesMonospacedDigitFont:1];
  [(BKInfoHUD *)self->_pageNumberHUD setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BKInfoHUD *)self->_pageNumberHUD setAlpha:0.0];
  [(BKInfoHUD *)self->_pageNumberHUD setUserInteractionEnabled:0];
  v41 = [(BKThumbnailBookViewController *)self view];
  [v41 addSubview:self->_pageNumberHUD];

  v42 = [(BKInfoHUD *)self->_pageNumberHUD trailingAnchor];
  v43 = [(BKThumbnailBookViewController *)self view];
  v44 = [v43 safeAreaLayoutGuide];
  v45 = [v44 trailingAnchor];
  v46 = [v42 constraintEqualToAnchor:v45 constant:-16.0];

  LODWORD(v47) = 1148846080;
  [v46 setPriority:v47];
  v48 = [(BCNavigationBar *)self->_topToolbar bottomAnchor];
  v49 = [(BKInfoHUD *)self->_pageNumberHUD topAnchor];
  v50 = [v49 constraintEqualToAnchor:v48 constant:16.0];
  [(BKThumbnailBookViewController *)self setPageNumberHUDTopConstraint:v50];

  v51 = [(BKInfoHUD *)self->_pageNumberHUD heightAnchor];
  [(BKThumbnailBookViewController *)self _infoHUDHeight];
  v52 = [v51 constraintGreaterThanOrEqualToConstant:];
  [(BKThumbnailBookViewController *)self setPageNumberHUDHeightConstraint:v52];

  v53 = [(BKInfoHUD *)self->_pageNumberHUD widthAnchor];
  v54 = [(BKInfoHUD *)self->_pageNumberHUD superview];
  v55 = [v54 widthAnchor];
  [(BKThumbnailBookViewController *)self defaultPageNumberHUDWidthConstraintConstant];
  [v53 constraintLessThanOrEqualToAnchor:v55];
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  pageNumberHUDWidthConstraint = self->_pageNumberHUDWidthConstraint;
  self->_pageNumberHUDWidthConstraint = v56;

  v58 = [(BKThumbnailBookViewController *)self pageNumberHUDTopConstraint];
  v77[0] = v58;
  v59 = [(BKThumbnailBookViewController *)self pageNumberHUDHeightConstraint];
  v60 = self->_pageNumberHUDWidthConstraint;
  v77[1] = v59;
  v77[2] = v60;
  v77[3] = v46;
  v61 = +[NSArray arrayWithObjects:v77 count:4];
  +[NSLayoutConstraint activateConstraints:v61];

  v62 = [(BKBookViewController *)self location];
  [(BKThumbnailBookViewController *)self setInitialJumpLocation:v62];

  v63 = [(BKBookViewController *)self pageNavigationViewController];
  v64 = [v63 view];

  [v64 setFrame:v5, v7, v9, v11];
  v65 = [(BKThumbnailBookViewController *)self view];
  [v65 insertSubview:v64 aboveSubview:self->_backgroundView];

  [(BKBookViewController *)self createPaginationControllerIfNeeded:1];
  v66 = [(BKThumbnailBookViewController *)self pageNumberHUD];
  [v66 setAccessibilityContainerType:4];

  v67 = [(BKThumbnailBookViewController *)self topToolbar];
  [v67 _accessibilitySetSortPriority:5000];

  v68 = [(BKThumbnailBookViewController *)self pageNumberHUD];
  [v68 _accessibilitySetSortPriority:4000];

  v69 = [(BKThumbnailBookViewController *)self verticalScrubber];
  [v69 _accessibilitySetSortPriority:3000];

  v70 = [(BKThumbnailBookViewController *)self scrubber];
  [v70 _accessibilitySetSortPriority:2000];

  v71 = [(BKThumbnailBookViewController *)self _bk_backgroundColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v71];
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController viewIsAppearing:](&v24, "viewIsAppearing:");
  id v5 = [(BKThumbnailBookViewController *)self currentPages];
  -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v5, v6);
  [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:v3];
  double v7 = [(BKThumbnailBookViewController *)self presentedViewController];

  if (!v7)
  {
    [(BKBookViewController *)self setControlsVisible:[(BKThumbnailBookViewController *)self canShowControlsDuringOpenClose]];
    [(BKThumbnailBookViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
  double v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

  double v9 = [(BKBookViewController *)self pageNavigationViewController];
  double v10 = [v9 viewControllers];

  if (![v10 count])
  {
    double v11 = [(BKThumbnailBookViewController *)self visibleContentViewController];

    if (v11)
    {
      v12 = [(BKThumbnailBookViewController *)self visibleContentViewController];
      v26 = v12;
      uint64_t v13 = +[NSArray arrayWithObjects:&v26 count:1];

      double v10 = (void *)v13;
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v19, "isContentLoaded", (void)v20)) {
          [(BKThumbnailBookViewController *)self contentViewReady:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v16);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    [(BKThumbnailBookViewController *)self _updateLibraryBarButtonItem];
    [(BKThumbnailBookViewController *)self _updateToolbarPositionAndBackgroundExtension];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v6 viewWillDisappear:a3];
  [(IMThumbnailRenderingCache *)self->_imageCache cancelRenderingCacheOperationsForTarget:self];
  double v4 = [(BKThumbnailBookViewController *)self currentLocation];
  [(BKBookViewController *)self setLocation:v4];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(BKBookViewController *)self assetViewControllerDelegate];
  unsigned __int8 v9 = [v8 inLiveResize];

  if ((v9 & 1) == 0)
  {
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_103254;
    v11[3] = &unk_1DAA18;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1032C0;
    v10[3] = &unk_1DAA18;
    [v7 animateAlongsideTransition:v11 completion:v10];
  }
}

- (void)contentSizeCategoryDidChange
{
  [(BKThumbnailBookViewController *)self _infoHUDHeight];
  double v4 = v3;
  id v5 = [(BKThumbnailBookViewController *)self pageNumberHUDHeightConstraint];
  [v5 setConstant:v4];

  pageNumberHUD = self->_pageNumberHUD;

  [(BKInfoHUD *)pageNumberHUD updateLabelFont];
}

- (NSDictionary)segmentIndexToDirectoryType
{
  v14[0] = &off_1E93F8;
  double v3 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails]];
  v15[0] = v3;
  v14[1] = &off_1E9410;
  double v4 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForTOC]];
  v15[1] = v4;
  v14[2] = &off_1E9428;
  id v5 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForBookmarks]];
  v15[2] = v5;
  objc_super v6 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v7 = [(BKBookViewController *)self book];
  LODWORD(v4) = [v7 suppressTOC];

  if (v4)
  {
    v12[0] = &off_1E93F8;
    double v8 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails]];
    v12[1] = &off_1E9410;
    v13[0] = v8;
    unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForBookmarks]];
    v13[1] = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

    objc_super v6 = (void *)v10;
  }

  return (NSDictionary *)v6;
}

- (NSDictionary)directoryTypeToSegmentIndex
{
  double v3 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails]];
  v8[0] = v3;
  v9[0] = &off_1E93F8;
  double v4 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForTOC]];
  v8[1] = v4;
  v9[1] = &off_1E9410;
  id v5 = +[NSNumber numberWithUnsignedInteger:[(BKThumbnailBookViewController *)self directoryTypeForBookmarks]];
  v8[2] = v5;
  v9[2] = &off_1E9428;
  objc_super v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (int64_t)segmentIndexForDirectoryType:(unint64_t)a3
{
  double v4 = [(BKThumbnailBookViewController *)self directoryTypeToSegmentIndex];
  id v5 = [v4 allKeys];
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7)
  {
    double v8 = +[NSNumber numberWithUnsignedInteger:a3];
    unsigned __int8 v9 = [v4 objectForKeyedSubscript:v8];
    id v10 = [v9 integerValue];
  }
  else
  {
    id v10 = 0;
  }

  return (int64_t)v10;
}

- (unint64_t)directoryTypeForSegmentIndex:(int64_t)a3
{
  double v4 = [(BKThumbnailBookViewController *)self segmentIndexToDirectoryType];
  id v5 = [v4 allKeys];
  objc_super v6 = +[NSNumber numberWithInteger:a3];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7)
  {
    double v8 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v9 = [v4 objectForKeyedSubscript:v8];
    id v10 = [v9 unsignedIntegerValue];
  }
  else
  {
    id v10 = 0;
  }

  return (unint64_t)v10;
}

- (void)close:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v5 close:a3];
  double v4 = [(BKBookViewController *)self actionController];
  [v4 cancelActions];
}

- (void)assetViewControllerUpdateToolbars
{
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v3 assetViewControllerUpdateToolbars];
  [(BKThumbnailBookViewController *)self updateTopToolbar:0];
}

- (void)assetViewControllerWillBeginLiveResize
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v5 assetViewControllerWillBeginLiveResize];
  objc_super v3 = [(BKThumbnailBookViewController *)self imageCache];
  [v3 cancelRenderingCacheOperationsForTarget:self];

  double v4 = [(BKThumbnailBookViewController *)self imageCache];
  [v4 suspend];
}

- (void)assetViewControllerDidEndLiveResize
{
  v2.receiver = self;
  v2.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v2 assetViewControllerDidEndLiveResize];
}

- (void)assetViewControllerDidFinishUpdateForLiveResize
{
  id v2 = [(BKThumbnailBookViewController *)self imageCache];
  [v2 resume];
}

- (void)assetViewControllerDidExitFullScreen
{
  id v2 = [(BKThumbnailBookViewController *)self imageCache];
  [v2 resume];
}

- (void)assetViewControllerDidEnterFullScreen
{
  id v2 = [(BKThumbnailBookViewController *)self imageCache];
  [v2 resume];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  objc_super v5 = [(BKThumbnailBookViewController *)self themePage];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v6 = [(BKThumbnailBookViewController *)self directoryController];
  unsigned int v7 = [v6 childViewControllers];
  double v8 = [v7 arrayByAddingObject:self];

  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) setTheme:v5];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [(BKThumbnailBookViewController *)self configuration];
  [v13 invalidate];

  [(BKThumbnailBookViewController *)self _update];
  [v5 stylizeBCNavigationBarTranslucent:self->_topToolbar];
  id v14 = [(BKThumbnailBookViewController *)self initialJumpLocation];

  if (v14)
  {
    id v15 = [(BKThumbnailBookViewController *)self initialJumpLocation];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_103C14;
    v16[3] = &unk_1DAB88;
    v16[4] = self;
    [(BKThumbnailBookViewController *)self jumpToLocation:v15 animated:0 completion:v16];
  }
}

- (void)viewWillLayoutSubviews
{
  id v2 = [(BKThumbnailBookViewController *)self configuration];
  [v2 invalidate];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewController;
  [(BKThumbnailBookViewController *)&v3 viewDidLayoutSubviews];
  [(BKBookViewController *)self rebuildHoverRegions];
}

- (BKThumbnailBookViewConfiguration)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    double v4 = [[BKThumbnailBookViewConfiguration alloc] initWithContext:self];
    objc_super v5 = self->_configuration;
    self->_configuration = v4;

    configuration = self->_configuration;
  }

  return configuration;
}

- (BKPreferredLayoutCache)preferredLayoutCache
{
  preferredLayoutCache = self->_preferredLayoutCache;
  if (!preferredLayoutCache)
  {
    double v4 = objc_alloc_init(BKPreferredLayoutCache);
    objc_super v5 = self->_preferredLayoutCache;
    self->_preferredLayoutCache = v4;

    preferredLayoutCache = self->_preferredLayoutCache;
  }

  return preferredLayoutCache;
}

- (NSArray)configurations
{
  id v2 = [(BKThumbnailBookViewController *)self configuration];
  objc_super v5 = v2;
  objc_super v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (void)setLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v4 setLayout:a3];
  [(BKBookViewController *)self updateToolbarController];
}

- (unint64_t)scrollLayoutForBook:(id)a3
{
  return 2;
}

- (BOOL)hasHighlightedText
{
  objc_super v3 = (char *)[(BKThumbnailBookViewController *)self currentPages];
  if (v3 >= &v3[v4])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_super v5 = v3;
    uint64_t v6 = v4;
    int v7 = 0;
    do
    {
      double v8 = [(BKThumbnailBookViewController *)self contentViewControllerForPageNumber:v5];
      v7 |= [v8 hasHighlightedText];

      ++v5;
      --v6;
    }
    while (v6);
  }
  return v7 & 1;
}

- (void)highlightSearchResult:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v11 highlightSearchResult:v4];
  if (v4)
  {
    objc_super v5 = (char *)[(BKThumbnailBookViewController *)self currentPages];
    if (v5 < &v5[v6])
    {
      int v7 = v5;
      uint64_t v8 = v6;
      do
      {
        id v9 = [(BKThumbnailBookViewController *)self contentViewControllerForPageNumber:v7];
        id v10 = [v4 location];
        [v9 highlightSearchLocation:v10];

        ++v7;
        --v8;
      }
      while (v8);
    }
  }
}

- (id)currentPageLocation
{
  objc_super v3 = (char *)[(BKPageNavigationViewController *)self->super._pageNavigationViewController pageOffset] + 1;

  return [(BKBookViewController *)self pageLocationForPageNumber:v3];
}

- (BOOL)canOrdinalOnlyLocationsBeVisible
{
  return 0;
}

- (BOOL)canShowControlsDuringOpenClose
{
  if ([(BKBookViewController *)self controlsVisible] || UIAccessibilityIsVoiceOverRunning()) {
    return 1;
  }

  return UIAccessibilityIsSwitchControlRunning();
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  id v4 = a3;
  if (v4
    && (![v4 isMemberOfClass:objc_opt_class()]
     || [(BKThumbnailBookViewController *)self canOrdinalOnlyLocationsBeVisible])
    && ([(BKBookViewController *)self paginationController],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = objc_msgSend(v5, "pageNumberForDocumentOrdinal:", objc_msgSend(v4, "ordinal")),
        v5,
        v6 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = [(BKThumbnailBookViewController *)self currentPages];
    BOOL v7 = v6 >= v8 && v6 - v8 < v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 location];
  BOOL v6 = [(BKThumbnailBookViewController *)self isLocationOnCurrentPage:v5];

  BOOL v7 = _AEAnnotationLocationLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v8 = @"Visible";
    }
    else {
      CFStringRef v8 = @"Not Visible";
    }
    unint64_t v9 = [v4 annotationUuid];
    int v11 = 138412546;
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "isAnnotationVisible: Annotation is %@ for: %@", (uint8_t *)&v11, 0x16u);
  }
  return v6;
}

- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(BKBookViewController *)self pageNavigationViewController];
  -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", (char *)[v7 pageOffset] + a3 + 1, v4);

  return 1;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[BKPageNavigationViewController turnToPageNumber:animated:](self->super._pageNavigationViewController, "turnToPageNumber:animated:");
  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v7 turnToPageNumber:a3 animated:v4];
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v8 = a5;
  unint64_t v9 = [(BKBookViewController *)self paginationController];

  if (v9)
  {
    [(BKBookViewController *)self clearSelection];
    id v10 = [(BKBookViewController *)self paginationController];
    id v11 = [v10 pageNumberForLocation:v15];

    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (uint64_t)v11;
    }
    [(BKThumbnailBookViewController *)self turnToPageNumber:v12 animated:v6];
  }
  id v13 = objc_retainBlock(v8);
  id v14 = v13;
  if (v13) {
    (*((void (**)(id))v13 + 2))(v13);
  }
}

- (void)turnToFirstPage:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)turnToInitialPage:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)pageCountDidUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v5 pageCountDidUpdate];
  [(BKPageNavigationViewController *)self->super._pageNavigationViewController setPageCount:[(BKBookViewController *)self pageCountIncludingUpsell]];
  [(BKPageThumbnailDirectory *)self->_pageDirectory setPageCount:[(BKBookViewController *)self pageCountExcludingUpsell]];
  if ([(BKThumbnailBookViewController *)self isViewLoaded])
  {
    id v3 = [(BKThumbnailBookViewController *)self currentPages];
    -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v3, v4);
    [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:0];
    [(BKThumbnailBookViewController *)self updateBookmarkButton:1];
  }
}

- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v9 didChangeLocationClosing:a3 suspending:a4];
  BOOL v6 = [(BKThumbnailBookViewController *)self currentLocation];
  [(BKBookViewController *)self setLocation:v6];

  [(BKThumbnailBookViewController *)self setInitialJumpLocation:0];
  if (!a3)
  {
    id v7 = [(BKThumbnailBookViewController *)self currentPages];
    -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v7, v8);
    [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:0];
    [(BKThumbnailBookViewController *)self updateBookmarkButton:0];
    [(BKThumbnailBookViewController *)self _updateBuyButton];
  }
}

- (unint64_t)validLayoutForBook:(id)a3 desiredLayout:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  unint64_t result = [(BKBookViewController *)&v6 validLayoutForBook:a3 desiredLayout:a4];
  if (result == 2)
  {
    if ([(BKThumbnailBookViewController *)self supportsScrollLayout]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_topToolbar == a3) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)_update
{
  id v3 = [(BKThumbnailBookViewController *)self currentPages];
  -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v3, v4);
  [(BKThumbnailBookViewController *)self updateTopToolbar:0];
  [(BKThumbnailBookViewController *)self updateBottomToolbar:0];
  [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:0];
  [(BKThumbnailBookViewController *)self _updateDirectorySwitch];

  [(BKThumbnailBookViewController *)self _updateBuyButton];
}

- (BOOL)_shouldShowAudioToolbarButton
{
  return ([(BKBookViewController *)self readAloudState] & 0x80000000) == 0
      || [(BKBookViewController *)self trackState] >= 0;
}

- (BOOL)supportsDocumentEditing
{
  return 0;
}

- (BOOL)supportsDocumentEditingUndo
{
  return 0;
}

- (BOOL)supportsDocumentEditingUndoAll
{
  return 0;
}

- (BOOL)shouldShowBookmarkControl
{
  return 1;
}

- (void)updateTopToolbar:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(BKThumbnailBookViewController *)self isViewLoaded]) {
    return;
  }
  [(BKBookViewController *)self updateToolbarController];
  [(BCNavigationBar *)self->_topToolbar invalidateIntrinsicContentSize];
  id v36 = +[NSMutableArray arrayWithCapacity:5];
  objc_super v5 = +[NSMutableArray arrayWithCapacity:7];
  if ([(BKBookViewController *)self section])
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    +[BCNavigationBar titlePadding];
    [v6 setWidth:];
    id v7 = +[UIDevice currentDevice];
    unint64_t v8 = (unint64_t)[v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && ([(BKThumbnailBookViewController *)self im_isCompactWidth] & 1) == 0)
    {
      objc_super v24 = [(BKThumbnailBookViewController *)self _directorySwitchBarButtonItem];
      if (v24) {
        [v36 addObject:v24];
      }

      if (v6) {
        [v36 addObject:v6];
      }
      uint64_t v12 = 0;
    }
    else
    {
      objc_super v9 = [(BKBookViewController *)self actionController];
      id v10 = [v9 barButtonItem];
      if (v10) {
        [v36 addObject:v10];
      }

      id v11 = [(BKThumbnailBookViewController *)self _directorySwitchBarButtonItem];
      uint64_t v12 = self->_directorySwitch;
    }
    id v25 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];

    +[BCNavigationBar titlePadding];
    [v25 setWidth:];
    v26 = [(BKThumbnailBookViewController *)self _resumeBarButtonItem];
    if (v26) {
      [v5 addObject:v26];
    }

    if (v25) {
      [v5 addObject:v25];
    }

    [(BKThumbnailBookViewController *)self _updateToolbarPositionAndBackgroundExtension];
    if (v12)
    {
      [(BCNavigationBar *)self->_topToolbar setLeftItems:v36 rightItems:v5 titleView:v12 animated:0];
      goto LABEL_74;
    }
  }
  else
  {
    if (self->_libraryBarButtonItem)
    {
      id v13 = [(BKThumbnailBookViewController *)self _libraryBarButtonItem];
      if (v13) {
        [v36 addObject:v13];
      }
    }
    if ([(BKThumbnailBookViewController *)self shouldShowTOCControl])
    {
      id v14 = [(BKThumbnailBookViewController *)self _tocBarButtonItem];
      if (v14) {
        [v36 addObject:v14];
      }
    }
    id v15 = [(BKBookViewController *)self assetViewControllerDelegate];
    id v16 = [v15 assetViewControllerMinifiedBarButtonItem:self];
    if (v16) {
      [v36 addObject:v16];
    }

    if (![(BKThumbnailBookViewController *)self shouldShowUndoControls]
      && ([(BKThumbnailBookViewController *)self im_isCompactWidth] & 1) == 0)
    {
      long long v17 = [(BKBookViewController *)self actionController];
      long long v18 = [v17 barButtonItem];
      if (v18) {
        [v36 addObject:v18];
      }
    }
    long long v19 = [(BKThumbnailBookViewController *)self _buyBarButtonItem];
    if (v19)
    {
      long long v20 = +[BUBag defaultBag];
      long long v21 = [v20 storeFront];
      unsigned int v22 = [v21 isLoaded];

      if (v22) {
        [v36 addObject:v19];
      }
      long long v23 = 0;
    }
    else
    {
      [(BKThumbnailBookViewController *)self updateBookmarkButton:v3];
      long long v23 = [(BKThumbnailBookViewController *)self _bookmarkBarButtonItem];
    }
    if ([(BKThumbnailBookViewController *)self shouldShowBookmarkControl] && v23) {
      [v5 addObject:v23];
    }
    if ((!v19 || ([(BKThumbnailBookViewController *)self im_isCompactWidth] & 1) == 0)
      && ![(BKThumbnailBookViewController *)self isScrolledContinuousFixedLayout])
    {
      v27 = [(BKThumbnailBookViewController *)self _searchBarButtonItem];
      if (v27) {
        [v5 addObject:v27];
      }
    }
    if ([(BKThumbnailBookViewController *)self shouldShowBrightnessControl])
    {
      v28 = [(BKThumbnailBookViewController *)self _brightnessBarButtonItem];
      if (v28) {
        [v5 addObject:v28];
      }
    }
    if ([(BKThumbnailBookViewController *)self supportsScrollLayout])
    {
      v29 = [(BKThumbnailBookViewController *)self _fontBarButtonItem];
      if (v29) {
        [v5 addObject:v29];
      }
    }
    if ([(BKThumbnailBookViewController *)self _shouldShowAudioToolbarButton])
    {
      v30 = [(BKThumbnailBookViewController *)self _audioBarButtonItem];
      if (v30) {
        [v5 addObject:v30];
      }
    }
    if ([(BKThumbnailBookViewController *)self supportsDocumentEditing])
    {
      v31 = [(BKThumbnailBookViewController *)self _editToolboxBarButtonItem];
      if (v31) {
        [v5 addObject:v31];
      }
    }
    if ([(BKThumbnailBookViewController *)self shouldShowUndoControls])
    {
      v32 = [(BKThumbnailBookViewController *)self editRedoBarButtonItem];
      if (v32) {
        [v5 addObject:v32];
      }

      v33 = [(BKThumbnailBookViewController *)self editUndoBarButtonItem];
      if (v33) {
        [v5 addObject:v33];
      }

      [(BKThumbnailBookViewController *)self _evaluateUndoRedoEnabled];
    }

    [(BKThumbnailBookViewController *)self _updateToolbarPositionAndBackgroundExtension];
  }
  topToolbar = self->_topToolbar;
  if (![(BKThumbnailBookViewController *)self _shouldNavBarShowTitle])
  {
    [(BCNavigationBar *)topToolbar setLeftItems:v36 rightItems:v5 title:0 animated:0];
    goto LABEL_76;
  }
  uint64_t v12 = [(BKBookViewController *)self book];
  v35 = [(UISegmentedControl *)v12 bookTitle];
  [(BCNavigationBar *)topToolbar setLeftItems:v36 rightItems:v5 title:v35 animated:0];

LABEL_74:
LABEL_76:
  [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:v3];
}

- (BOOL)_shouldNavBarShowTitle
{
  BOOL v3 = [(BKThumbnailBookViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v12);
  double v5 = kIMConfigurationSize_largePhone[1];

  if (Width < v5) {
    return 0;
  }
  if ([(BKBookViewController *)self section] != 1) {
    return 1;
  }
  id v7 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
  unint64_t v8 = [v7 superview];
  if (v8)
  {
    objc_super v9 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
    [v9 alpha];
    BOOL v6 = v10 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)wantsBottomToolbar
{
  return 1;
}

- (void)updateBottomToolbar:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKThumbnailBookViewController *)self wantsBottomToolbar]
    && ![(BKBookViewController *)self section]
    && [(BKBookViewController *)self controlsVisible])
  {
    double v5 = [(BKBookViewController *)self assetViewControllerDelegate];
    unsigned int v6 = [v5 inLiveResize] ^ 1;
  }
  else
  {
    unsigned int v6 = 0;
  }
  id v7 = [(BKThumbnailBookViewController *)self toolbarItems];
  id v8 = [v7 count];

  if (!v8)
  {
    objc_super v9 = [(BKThumbnailBookViewController *)self scrubberBarButtonItem];
    long long v21 = v9;
    double v10 = +[NSArray arrayWithObjects:&v21 count:1];
    [(BKThumbnailBookViewController *)self setToolbarItems:v10];
  }
  if (_os_feature_enabled_impl())
  {
    id v11 = objc_opt_new();
    CGRect v12 = [(BKThumbnailBookViewController *)self navigationController];
    id v13 = [v12 toolbar];
    [v13 setScrollEdgeAppearance:v11];
  }
  if (v3) {
    double v14 = UINavigationControllerHideShowBarDuration;
  }
  else {
    double v14 = 0.0;
  }
  id v15 = [(BKThumbnailBookViewController *)self navigationController];
  [v15 _setToolbarHidden:v6 ^ 1 edge:15 duration:v14];

  id v16 = [(BKThumbnailBookViewController *)self scrubber];
  long long v17 = v16;
  if ((v6 ^ 1))
  {
    [v16 cancelPendingRenderRequests];
  }
  else
  {
    long long v18 = [v16 layer];
    [v18 removeAllAnimations];

    id v19 = [(BKThumbnailBookViewController *)self currentPages];
    -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v19, v20);
  }
}

- (id)newGlassButton
{
  id v2 = -[BKToolbarButton initWithFrame:]([BKToolbarButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BKToolbarButton *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BKToolbarButton *)v2 setMultipleTouchEnabled:0];
  [(BKToolbarButton *)v2 setExclusiveTouch:1];
  return v2;
}

- (void)_updateLibraryBarButtonItem
{
  CFStringRef v3 = [(UIBarButtonItem *)self->_libraryBarButtonItem title];
  if (!v3)
  {
    uint64_t v4 = [(UIBarButtonItem *)self->_libraryBarButtonItem image];

    if (v4) {
      CFStringRef v3 = &stru_1DF0D8;
    }
    else {
      CFStringRef v3 = 0;
    }
  }
  double v10 = (__CFString *)v3;
  double v5 = [(BKBookViewController *)self assetViewControllerDelegate];
  unsigned int v6 = [v5 libraryButtonItemForViewController:self selector:"showLibrary:"];
  libraryBarButtonItem = self->_libraryBarButtonItem;
  self->_libraryBarButtonItem = v6;

  id v8 = [(BKBookViewController *)self assetViewControllerDelegate];
  unsigned int v9 = [v8 canUpdateLibraryBarButtonItem:self->_libraryBarButtonItem withOldString:v10];

  if (v9) {
    [(BKThumbnailBookViewController *)self assetViewControllerUpdateToolbars];
  }
}

- (id)_libraryBarButtonItem
{
  libraryBarButtonItem = self->_libraryBarButtonItem;
  if (!libraryBarButtonItem)
  {
    [(BKThumbnailBookViewController *)self _updateLibraryBarButtonItem];
    libraryBarButtonItem = self->_libraryBarButtonItem;
  }

  return libraryBarButtonItem;
}

- (id)_resumeBarButtonItem
{
  resumeBarButtonItem = self->_resumeBarButtonItem;
  if (!resumeBarButtonItem)
  {
    uint64_t v4 = AEBundle();
    double v5 = [v4 localizedStringForKey:@"Resume" value:&stru_1DF0D8 table:0];

    unsigned int v6 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:v5 style:2 target:self action:"resume:"];
    id v7 = self->_resumeBarButtonItem;
    self->_resumeBarButtonItem = v6;

    resumeBarButtonItem = self->_resumeBarButtonItem;
  }

  return resumeBarButtonItem;
}

- (id)searchButtonItem
{
  return self->_searchBarButtonItem;
}

- (id)fontButton
{
  brightnessBarButtonItem = self->_brightnessBarButtonItem;
  if (!brightnessBarButtonItem) {
    brightnessBarButtonItem = self->_editToolboxBarButtonItem;
  }
  return brightnessBarButtonItem;
}

- (id)_fontBarButtonItem
{
  fontBarButtonItem = self->_fontBarButtonItem;
  if (!fontBarButtonItem)
  {
    uint64_t v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"textformat.size" target:self action:"showFontPicker:"];
    double v5 = self->_fontBarButtonItem;
    self->_fontBarButtonItem = v4;

    [(UIButton *)self->_bookmarkButton frame];
    [(UIBarButtonItem *)self->_fontBarButtonItem setWidth:fmax(CGRectGetWidth(v8), 32.0)];
    fontBarButtonItem = self->_fontBarButtonItem;
  }

  return fontBarButtonItem;
}

- (id)_searchBarButtonItem
{
  searchBarButtonItem = self->_searchBarButtonItem;
  if (!searchBarButtonItem)
  {
    uint64_t v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"magnifyingglass" target:self action:"showSearch:"];
    double v5 = self->_searchBarButtonItem;
    self->_searchBarButtonItem = v4;

    searchBarButtonItem = self->_searchBarButtonItem;
  }

  return searchBarButtonItem;
}

- (id)_tocBarButtonItem
{
  tocBarButtonItem = self->_tocBarButtonItem;
  if (!tocBarButtonItem)
  {
    uint64_t v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"list.bullet" target:self action:"showTOC:"];
    double v5 = self->_tocBarButtonItem;
    self->_tocBarButtonItem = v4;

    tocBarButtonItem = self->_tocBarButtonItem;
  }

  return tocBarButtonItem;
}

- (BOOL)shouldShowBrightnessControl
{
  BOOL v3 = [(BKThumbnailBookViewController *)self supportsBrightness];
  if (v3) {
    LOBYTE(v3) = ![(BKThumbnailBookViewController *)self supportsScrollLayout];
  }
  return v3;
}

- (BOOL)isScrolledContinuousFixedLayout
{
  id v2 = [(BKBookViewController *)self book];
  BOOL v3 = [v2 fixedLayoutFlow];
  unsigned __int8 v4 = [v3 isEqualToString:@"scrolled-continuous"];

  return v4;
}

- (BOOL)supportsScrollLayout
{
  if (+[BKThumbnailBookViewController verticalScrollFeatureEnabled])
  {
    BOOL v3 = [(BKBookViewController *)self book];
    if ([v3 hasMediaOverlayElements])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      double v5 = [(BKBookViewController *)self book];
      unsigned int v4 = [v5 isScrollModeDisabled] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)supportsBrightness
{
  return +[BEAppearanceViewController canChangeBrightness];
}

- (id)_brightnessBarButtonItem
{
  brightnessBarButtonItem = self->_brightnessBarButtonItem;
  if (!brightnessBarButtonItem)
  {
    unsigned int v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"sun.max" target:self action:"showBrightness:"];
    double v5 = self->_brightnessBarButtonItem;
    self->_brightnessBarButtonItem = v4;

    brightnessBarButtonItem = self->_brightnessBarButtonItem;
  }

  return brightnessBarButtonItem;
}

- (BOOL)assetEditingEnabled
{
  return 0;
}

- (BOOL)shouldShowTOCControl
{
  return ![(BKThumbnailBookViewController *)self shouldShowUndoControls];
}

- (BOOL)shouldShowUndoControls
{
  return 0;
}

- (id)_editToolboxBarButtonItem
{
  editToolboxBarButtonItem = self->_editToolboxBarButtonItem;
  if (!editToolboxBarButtonItem)
  {
    unsigned int v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"pencil.tip.crop.circle" target:self action:"toggleEditAssetMode:"];
    double v5 = self->_editToolboxBarButtonItem;
    self->_editToolboxBarButtonItem = v4;

    [(UIBarButtonItem *)self->_editToolboxBarButtonItem setSelected:[(BKThumbnailBookViewController *)self assetEditingEnabled]];
    editToolboxBarButtonItem = self->_editToolboxBarButtonItem;
  }

  return editToolboxBarButtonItem;
}

- (id)editUndoBarButtonItem
{
  editUndoBarButtonItem = self->_editUndoBarButtonItem;
  if (!editUndoBarButtonItem)
  {
    unsigned int v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"arrow.uturn.backward.circle" target:self action:"handleEditUndo:"];
    double v5 = self->_editUndoBarButtonItem;
    self->_editUndoBarButtonItem = v4;

    editUndoBarButtonItem = self->_editUndoBarButtonItem;
  }

  return editUndoBarButtonItem;
}

- (id)editRedoBarButtonItem
{
  editRedoBarButtonItem = self->_editRedoBarButtonItem;
  if (!editRedoBarButtonItem)
  {
    unsigned int v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"arrow.uturn.forward.circle" target:self action:"handleEditRedo:"];
    double v5 = self->_editRedoBarButtonItem;
    self->_editRedoBarButtonItem = v4;

    editRedoBarButtonItem = self->_editRedoBarButtonItem;
  }

  return editRedoBarButtonItem;
}

- (id)_audioBarButtonItem
{
  audioBarButtonItem = self->_audioBarButtonItem;
  if (!audioBarButtonItem)
  {
    unsigned int v4 = +[UIBarButtonItem bc_readingExperienceBarItem:@"speaker.wave.2" target:self action:"showAudio:"];
    double v5 = self->_audioBarButtonItem;
    self->_audioBarButtonItem = v4;

    audioBarButtonItem = self->_audioBarButtonItem;
  }

  return audioBarButtonItem;
}

- (id)_bookmarkBarButtonItem
{
  bookmarkBarButtonItem = self->_bookmarkBarButtonItem;
  if (!bookmarkBarButtonItem)
  {
    id v4 = objc_alloc((Class)BCUIFullHeightNavWrapper);
    double v5 = [(BKThumbnailBookViewController *)self _bookmarkButton];
    id v6 = [v4 initWithView:v5];

    [v6 setCursorInsets:2.0, -8.0, 2.0, -8.0];
    [(UIButton *)self->_bookmarkButton frame];
    [v6 setSpecifiedWidth:fmax(CGRectGetWidth(v11), 32.0)];
    id v7 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v6];
    CGRect v8 = self->_bookmarkBarButtonItem;
    self->_bookmarkBarButtonItem = v7;

    [v6 specifiedWidth];
    -[UIBarButtonItem setWidth:](self->_bookmarkBarButtonItem, "setWidth:");

    bookmarkBarButtonItem = self->_bookmarkBarButtonItem;
  }

  return bookmarkBarButtonItem;
}

- (id)_bookmarkButton
{
  bookmarkButton = self->_bookmarkButton;
  if (!bookmarkButton)
  {
    id v4 = [(BKThumbnailBookViewController *)self newGlassButton];
    double v5 = self->_bookmarkButton;
    self->_bookmarkButton = v4;

    [(UIButton *)self->_bookmarkButton addTarget:self action:"toggleBookmark:" forControlEvents:64];
    [(BKThumbnailBookViewController *)self updateBookmarkButton:1];
    [(UIButton *)self->_bookmarkButton sizeToFit];
    bookmarkButton = self->_bookmarkButton;
  }

  return bookmarkButton;
}

- (id)_buyBarButtonItem
{
  buyBarButtonItem = self->_buyBarButtonItem;
  if (!buyBarButtonItem)
  {
    id v4 = [(BKBookViewController *)self assetViewControllerDelegate];
    id v15 = [(BKBookViewController *)self book];
    double v5 = [v15 sampleContent];
    id v6 = [v5 BOOLValue];
    id v7 = [(BKBookViewController *)self book];
    CGRect v8 = [v7 isPreorder];
    id v9 = [v8 BOOLValue];
    double v10 = [(BKBookViewController *)self book];
    CGRect v11 = [v10 storeId];
    CGRect v12 = [v4 assetViewControllerBuyButtonItem:self isSample:v6 isPreorder:v9 storeID:v11];
    id v13 = self->_buyBarButtonItem;
    self->_buyBarButtonItem = v12;

    [(BKThumbnailBookViewController *)self _updateBuyButton];
    buyBarButtonItem = self->_buyBarButtonItem;
  }

  return buyBarButtonItem;
}

- (id)_directorySwitchBarButtonItem
{
  if (!self->_directorySwitchBarButtonItem)
  {
    BOOL v3 = +[UIImage systemImageNamed:@"rectangle.grid.3x2"];
    id v4 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:13.0];
    double v5 = [v3 imageWithConfiguration:v4];
    id v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    CGRect v8 = v7;

    id v9 = +[UIImage systemImageNamed:@"list.bullet"];
    double v10 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:13.0];
    CGRect v11 = [v9 imageWithConfiguration:v10];
    CGRect v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = (id)objc_opt_new();
    }
    double v14 = v13;

    id v15 = +[UIImage systemImageNamed:@"bookmark"];
    id v16 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:13.0];
    long long v17 = [v15 imageWithConfiguration:v16];
    long long v18 = v17;
    if (v17) {
      id v19 = v17;
    }
    else {
      id v19 = (id)objc_opt_new();
    }
    uint64_t v20 = v19;

    long long v21 = [(BKBookViewController *)self book];
    unsigned __int8 v22 = [v21 suppressTOC];

    id v23 = objc_alloc((Class)NSArray);
    if (v22) {
      id v24 = [v23 initWithObjects:v8, v20, 0, v37];
    }
    else {
      id v24 = [v23 initWithObjects:v8, v14, v20, 0];
    }
    id v25 = v24;
    v26 = [[BKSegmentedControl alloc] initWithItems:v24];
    directorySwitch = self->_directorySwitch;
    self->_directorySwitch = &v26->super;

    [(UISegmentedControl *)self->_directorySwitch addTarget:self action:"directorySwitchPressed:" forControlEvents:4096];
    [(BKThumbnailBookViewController *)self _updateDirectorySwitch];
    if ([v25 count] == (char *)&dword_0 + 3) {
      double v28 = 132.0;
    }
    else {
      double v28 = 120.0;
    }
    if ([v25 count]) {
      double v29 = v28 / (double)(unint64_t)[v25 count];
    }
    else {
      double v29 = 40.0;
    }
    if ([v25 count])
    {
      unint64_t v30 = 0;
      do
        [(UISegmentedControl *)self->_directorySwitch setWidth:v30++ forSegmentAtIndex:v29];
      while ((unint64_t)[v25 count] > v30);
    }
    v31 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_directorySwitch];
    directorySwitchBarButtonItem = self->_directorySwitchBarButtonItem;
    self->_directorySwitchBarButtonItem = v31;

    [(UIBarButtonItem *)self->_directorySwitchBarButtonItem setStyle:0];
    id v33 = [v25 count];
    double v34 = 0.0;
    if (v33) {
      double v34 = v28;
    }
    [(UIBarButtonItem *)self->_directorySwitchBarButtonItem setWidth:v34];
  }
  [(UISegmentedControl *)self->_directorySwitch sizeToFit];
  v35 = self->_directorySwitchBarButtonItem;

  return v35;
}

- (_NSRange)currentPages
{
  int64_t v3 = [(BKPageNavigationViewController *)self->super._pageNavigationViewController pageOffset];
  unint64_t v4 = [(BKBookViewController *)self pageCountIncludingUpsell];
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

- (id)visibleContentViewController
{
  id v3 = [(BKThumbnailBookViewController *)self currentPages];
  int64_t v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4);

  return [(BKThumbnailBookViewController *)self existingContentViewControllerForPageNumber:v5];
}

- (id)existingContentViewControllerForPageNumber:(int64_t)a3
{
  uint64_t v4 = [(BKBookViewController *)self pageLocationForPageNumber:a3];
  if (v4)
  {
    int64_t v5 = [(BKBookViewController *)self contentViewControllers];
    NSUInteger v6 = [v5 objectForKey:v4];
  }
  else
  {
    NSUInteger v6 = 0;
  }

  return v6;
}

- (id)contentViewControllerForPageNumber:(int64_t)a3
{
  int64_t v5 = -[BKThumbnailBookViewController existingContentViewControllerForPageNumber:](self, "existingContentViewControllerForPageNumber:");
  if (!v5)
  {
    NSUInteger v6 = [(BKBookViewController *)self pageLocationForPageNumber:a3];
    int64_t v5 = [(BKBookViewController *)self contentViewControllerForLocation:v6];
    [v5 setDelegate:self];
    if (v5)
    {
      NSUInteger v7 = [(BKThumbnailBookViewController *)self imageCache];
      [v5 setContentViewImageCache:v7];

      CGRect v8 = [(BKBookViewController *)self contentViewControllers];
      [v8 setObject:v5 forKey:v6];

      [(BKPageNavigationViewController *)self->super._pageNavigationViewController addChildViewController:v5];
    }
  }

  return v5;
}

- (BOOL)_isUsingContent:(id)a3
{
  pageNavigationViewController = self->super._pageNavigationViewController;
  id v4 = a3;
  int64_t v5 = [(BKPageNavigationViewController *)pageNavigationViewController allViewControllers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)pageNavigationDidRemoveContentForPageNumber:(int64_t)a3
{
  id v7 = [(BKBookViewController *)self pageLocationForPageNumber:a3];
  id v4 = [(BKBookViewController *)self contentViewControllers];
  int64_t v5 = [v4 objectForKey:v7];

  if (v5 && ![(BKThumbnailBookViewController *)self _isUsingContent:v5])
  {
    [v5 removeFromParentViewController];
    unsigned __int8 v6 = [(BKBookViewController *)self contentViewControllers];
    [v6 removeObjectForKey:v7];
  }
}

- (void)pageNavigationDidRemoveContentViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v9 = v4;
    id v4 = (id)[(BKThumbnailBookViewController *)self _isUsingContent:v4];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      unsigned __int8 v6 = [(BKBookViewController *)self contentViewControllers];
      id v7 = [v6 allKeysForObject:v9];

      [v9 removeFromParentViewController];
      CGRect v8 = [(BKBookViewController *)self contentViewControllers];
      [v8 removeObjectsForKeys:v7];

      id v5 = v9;
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)pageNavigationDidChangeLocation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v4 pageNavigationDidChangeLocation:a3];
  [(BKThumbnailBookViewController *)self didChangeLocationClosing:0 suspending:0];
}

- (void)pageNavigationToggleControls:(id)a3
{
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  CGRect v8 = (void (**)(void))a5;
  if ([(BKBookViewController *)self section] == 1)
  {
    unsigned int v9 = 1;
  }
  else
  {
    double v10 = [(BKBookViewController *)self searchViewController];
    if ([v10 isVisible]) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [(BKAppearanceViewController *)self->super._appearanceViewController isVisible];
    }
  }
  int v11 = v9 | v6;
  CGRect v12 = [(BKBookViewController *)self assetViewControllerDelegate];
  unsigned int v13 = [v12 inLiveResize];

  uint64_t v14 = v11 & ~v13;
  if (v14 != [(BKBookViewController *)self controlsVisible]
    || [(BKBookViewController *)self bkaxAccessibilityUserIsRequestingControlsVisibilityToggle]|| v14 && (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_106290;
    v17[3] = &unk_1DDF58;
    v17[4] = self;
    char v18 = v11 & ~(_BYTE)v13;
    BOOL v19 = v5;
    id v15 = objc_retainBlock(v17);
    [(BKThumbnailBookViewController *)self updateTopToolbar:v5];
    v16.receiver = self;
    v16.super_class = (Class)BKThumbnailBookViewController;
    [(BKBookViewController *)&v16 setControlsVisible:v14 animated:v5 animations:v15 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)setTopToolBarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(BCNavigationBar *)self->_topToolbar setAlpha:1.0];
    [(BCNavigationBar *)self->_topToolbar setAccessibilityElementsHidden:0];
  }
  else
  {
    [(BKBookViewController *)self dismissCurrentPopoverWithCompletion:0 animated:1];
  }
  [(BCNavigationBar *)self->_topToolbar setAlpha:(double)v3];
  topToolbar = self->_topToolbar;

  [(BCNavigationBar *)topToolbar setAccessibilityElementsHidden:!v3];
}

- (void)toggleControls:(id)a3
{
  unsigned int v4 = [(BKBookViewController *)self controlsVisible];
  if ((v4 & 1) != 0 || ![(BKThumbnailBookViewController *)self hasHighlightedText])
  {
    if ([(BKBookViewController *)self bkaxAccessibilityUserIsRequestingControlsVisibilityToggle]|| !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
    {
      BOOL v5 = +[UIView areAnimationsEnabled];
      [(BKBookViewController *)self setControlsVisible:v4 ^ 1 animated:v5];
    }
  }
  else
  {
    [(BKBookViewController *)self clearSearchResult];
    [(BKBookViewController *)self clearSelection];
  }
}

- (void)showTOC:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKBookViewController *)self actionController];
  [v5 cancelActions];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_106574;
  v7[3] = &unk_1DBF08;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  [(BKThumbnailBookViewController *)self setControlsVisible:1 animated:1 completion:v7];
}

- (void)toggleEditAssetMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKBookViewController *)self actionController];
  [v5 cancelActions];

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v6 toggleEditAssetMode:v4];
}

- (void)handleEditUndo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKBookViewController *)self actionController];
  [v5 cancelActions];

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v6 handleEditUndo:v4];
}

- (void)handleEditRedo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKBookViewController *)self actionController];
  [v5 cancelActions];

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v6 handleEditRedo:v4];
}

- (void)handleEditUndoAll:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKBookViewController *)self actionController];
  [v5 cancelActions];

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v6 handleEditUndoAll:v4];
}

- (void)resume:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKBookViewController *)self actionController];
  [v5 cancelActions];

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v6 resume:v4];
}

- (void)showLibrary:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_106888;
  v4[3] = &unk_1DBF08;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKViewController *)v5 dismissCurrentPopoverWithCompletion:v4];
}

- (void)showOverlayViewController:(id)a3 fromView:(id)a4 popoverOnPhone:(BOOL)a5 passthroughViews:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  unsigned int v13 = [(BKBookViewController *)self actionController];
  [v13 cancelActions];

  v14.receiver = self;
  v14.super_class = (Class)BKThumbnailBookViewController;
  [(BKViewController *)&v14 showOverlayViewController:v12 fromItem:v11 popoverOnPhone:v6 passthroughViews:v10 popoverBackgroundColor:0];
}

- (void)showTOCFromToolbar:(id)a3
{
  id v4 = a3;
  if ([(BKThumbnailBookViewController *)self canShowTableOfContents])
  {
    [(BKThumbnailBookViewController *)self books_showTableOfContents:v4];
  }
  else if ([(BKBookViewController *)self canShowContent])
  {
    [(BKBookViewController *)self books_showContent:v4];
  }
}

- (void)showThumbnailTOCFromToolbar:(id)a3
{
  id v4 = a3;
  if ([(BKThumbnailBookViewController *)self canShowThumbnails])
  {
    [(BKThumbnailBookViewController *)self books_showThumbnails:v4];
  }
  else if ([(BKBookViewController *)self canShowContent])
  {
    [(BKBookViewController *)self books_showContent:v4];
  }
}

- (void)showBookmarksFromToolbar:(id)a3
{
  id v4 = a3;
  if ([(BKThumbnailBookViewController *)self canShowBookmarks])
  {
    [(BKThumbnailBookViewController *)self books_showBookmarks:v4];
  }
  else if ([(BKBookViewController *)self canShowContent])
  {
    [(BKBookViewController *)self books_showContent:v4];
  }
}

- (void)showAudioControlsFromToolbar:(id)a3
{
}

- (void)donePressedFromToolbar:(id)a3
{
}

- (int64_t)bookToolbarTransparency
{
  return 1;
}

- (BOOL)shouldDisplayTitleWhenActive
{
  return 1;
}

- (BOOL)shouldDisplayTitleWhenInactive
{
  return 0;
}

- (BOOL)shouldDisplaySearchControls
{
  return ![(BKThumbnailBookViewController *)self isScrolledContinuousFixedLayout];
}

- (BOOL)shouldDisplayBuyButton
{
  id v2 = [(BKBookViewController *)self book];
  id v3 = [v2 sampleContent];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldDisplayContentsButton
{
  id v2 = [(BKBookViewController *)self book];
  char v3 = [v2 suppressTOC] ^ 1;

  return v3;
}

- (BOOL)shouldDisplayPageThumbnailsButton
{
  return 1;
}

- (BOOL)shouldDisplayBookmarksButton
{
  return 1;
}

- (BOOL)shouldDisplayHighlightsButton
{
  return 0;
}

- (int64_t)bookToolbarMode
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  int64_t result = [(BKBookViewController *)&v5 bookToolbarMode];
  if (!result)
  {
    unint64_t v4 = [(BKThumbnailBookViewController *)self directoryType];
    if (v4 - 1 > 5) {
      return 0;
    }
    else {
      return qword_18F0D8[v4 - 1];
    }
  }
  return result;
}

- (id)bookToolbarTitle
{
  id v2 = [(BKBookViewController *)self asset];
  char v3 = [v2 displayTitle];

  return v3;
}

- (id)bookToolbarCurrentPageString
{
  return 0;
}

- (id)buttonTitleColor
{
  char v3 = +[UIColor bc_booksWhite];
  objc_opt_class();
  unint64_t v4 = [(BKThumbnailBookViewController *)self theme];
  objc_super v5 = BUDynamicCast();

  if (v5)
  {
    BOOL v6 = [v5 buttonColor];
    uint64_t v7 = [v6 bc_invertedDynamicColor];

    char v3 = (void *)v7;
  }

  return v3;
}

- (id)bookmarkToolTip
{
  id v2 = AEBundle();
  char v3 = [v2 localizedStringForKey:@"Show bookmarked pages" value:&stru_1DF0D8 table:0];

  return v3;
}

- (id)tocToolTip
{
  id v2 = AEBundle();
  char v3 = [v2 localizedStringForKey:@"Show contents in list view" value:&stru_1DF0D8 table:0];

  return v3;
}

- (BOOL)catalystToolbarActive
{
  return 0;
}

- (void)toolbarDidBecomeActive:(id)a3
{
}

- (void)toolbarDidBecomeInactive:(id)a3
{
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v15 validateCommand:v4];
  objc_super v5 = (const char *)[v4 action];
  if (!sel_isEqual(v5, "books_toggleContinuousScroll:"))
  {
    if (sel_isEqual(v5, "books_disableContinuousScroll:"))
    {
      BOOL v6 = self->super._layout == 1;
      goto LABEL_5;
    }
    if (sel_isEqual(v5, "books_enableContinuousScroll:"))
    {
      [v4 setState:self->super._layout == 2];
      id v8 = AEBundle();
      unsigned int v9 = v8;
      CFStringRef v10 = @"Vertical Scrolling";
LABEL_18:
      unsigned int v13 = [v8 localizedStringForKey:v10 value:&stru_1DF0D8 table:0];
      [v4 setTitle:v13];

      goto LABEL_19;
    }
    if (sel_isEqual(v5, "books_chapterRight:"))
    {
      int64_t v11 = [(BKViewController *)self layoutDirection];
      unsigned int v9 = AEBundle();
      if (v11 == 1)
      {
LABEL_13:
        CFStringRef v10 = @"Previous Chapter";
LABEL_17:
        id v8 = v9;
        goto LABEL_18;
      }
    }
    else
    {
      if (!sel_isEqual(v5, "books_chapterLeft:"))
      {
        if (!sel_isEqual(v5, "books_togglePlaying:")) {
          goto LABEL_19;
        }
        unsigned int v14 = [(BKBookViewController *)self isReading];
        unsigned int v9 = AEBundle();
        if (v14) {
          CFStringRef v10 = @"Pause";
        }
        else {
          CFStringRef v10 = @"Play";
        }
        goto LABEL_17;
      }
      int64_t v12 = [(BKViewController *)self layoutDirection];
      unsigned int v9 = AEBundle();
      if (v12 != 1) {
        goto LABEL_13;
      }
    }
    CFStringRef v10 = @"Next Chapter";
    goto LABEL_17;
  }
  BOOL v6 = self->super._layout == 2;
LABEL_5:
  uint64_t v7 = v6;
  [v4 setState:v7];
LABEL_19:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)BKThumbnailBookViewController;
  unsigned int v6 = [(BKBookViewController *)&v14 canPerformAction:a3 withSender:a4];
  objc_opt_class();
  uint64_t v7 = [(BKBookViewController *)self pageNavigationViewController];
  id v8 = BUDynamicCast();

  if (!sel_isEqual(a3, "books_showTableOfContents:"))
  {
    if (sel_isEqual(a3, "books_showThumbnails:"))
    {
      if (v6)
      {
        unsigned __int8 v9 = [(BKThumbnailBookViewController *)self canShowThumbnails];
        goto LABEL_10;
      }
      goto LABEL_28;
    }
    if (sel_isEqual(a3, "books_showBookmarks:"))
    {
      if (v6)
      {
        unsigned __int8 v9 = [(BKThumbnailBookViewController *)self canShowBookmarks];
        goto LABEL_10;
      }
      goto LABEL_28;
    }
    if (sel_isEqual(a3, "books_toggleContinuousScroll:")
      || sel_isEqual(a3, "books_disableContinuousScroll:")
      || sel_isEqual(a3, "books_enableContinuousScroll:"))
    {
      unsigned __int8 v11 = [(BKThumbnailBookViewController *)self shouldDisplayReadaloudControls];
    }
    else
    {
      if (sel_isEqual(a3, "books_increaseZoom:"))
      {
        if (v6)
        {
          unsigned __int8 v9 = [v8 canZoomMore];
          goto LABEL_10;
        }
        goto LABEL_28;
      }
      if (!sel_isEqual(a3, "books_resetZoom:") && !sel_isEqual(a3, "books_decreaseZoom:"))
      {
        if (!sel_isEqual(a3, "books_togglePlaying:"))
        {
          if (sel_isEqual(a3, "books_stopPlaying:"))
          {
            if (!v6) {
              goto LABEL_28;
            }
          }
          else
          {
            BOOL isEqual = sel_isEqual(a3, "books_skipBackward:");
            if ((isEqual & v6 & 1) == 0)
            {
              char v10 = v6 & ~isEqual;
              goto LABEL_29;
            }
          }
          unsigned __int8 v9 = [(BKBookViewController *)self isReading];
          goto LABEL_10;
        }
        if (v6)
        {
          char v10 = [(BKBookViewController *)self readAloudState] != -1;
          goto LABEL_29;
        }
LABEL_28:
        char v10 = 0;
        goto LABEL_29;
      }
      if (!v6) {
        goto LABEL_28;
      }
      unsigned __int8 v11 = [v8 isZoomedToSpread];
    }
    char v10 = v11 ^ 1;
    goto LABEL_29;
  }
  if (!v6) {
    goto LABEL_28;
  }
  unsigned __int8 v9 = [(BKThumbnailBookViewController *)self canShowTableOfContents];
LABEL_10:
  char v10 = v9;
LABEL_29:

  return v10;
}

- (BOOL)canShowTableOfContents
{
  char v3 = [(BKBookViewController *)self book];
  unsigned __int8 v4 = [v3 suppressTOC];

  if (v4) {
    return 0;
  }
  if ([(BKBookViewController *)self section] != 1) {
    return 1;
  }
  unint64_t v6 = [(BKThumbnailBookViewController *)self directoryType];
  return v6 != [(BKThumbnailBookViewController *)self directoryTypeForTOC];
}

- (BOOL)canShowThumbnails
{
  if ([(BKBookViewController *)self section] != 1) {
    return 1;
  }
  unint64_t v3 = [(BKThumbnailBookViewController *)self directoryType];
  return v3 != [(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails];
}

- (BOOL)canShowBookmarks
{
  if ([(BKBookViewController *)self section] != 1) {
    return 1;
  }
  unint64_t v3 = [(BKThumbnailBookViewController *)self directoryType];
  return v3 != [(BKThumbnailBookViewController *)self directoryTypeForBookmarks];
}

- (void)books_showTableOfContents:(id)a3
{
  id v4 = a3;
  [(BKThumbnailBookViewController *)self setDirectoryType:[(BKThumbnailBookViewController *)self directoryTypeForTOC]];
  [(BKThumbnailBookViewController *)self showTOC:v4];
}

- (void)books_showBookmarks:(id)a3
{
  id v4 = a3;
  [(BKThumbnailBookViewController *)self setDirectoryType:[(BKThumbnailBookViewController *)self directoryTypeForBookmarks]];
  [(BKThumbnailBookViewController *)self showTOC:v4];
}

- (void)books_showThumbnails:(id)a3
{
  id v4 = a3;
  [(BKThumbnailBookViewController *)self setDirectoryType:[(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails]];
  [(BKThumbnailBookViewController *)self showTOC:v4];
}

- (void)books_toggleContinuousScroll:(id)a3
{
  id v4 = a3;
  if ((char *)[(BKBookViewController *)self layout] == (char *)&dword_0 + 1) {
    [(BKThumbnailBookViewController *)self books_enableContinuousScroll:v4];
  }
  else {
    [(BKThumbnailBookViewController *)self books_disableContinuousScroll:v4];
  }
}

- (void)books_disableContinuousScroll:(id)a3
{
  id v4 = [(BKBookViewController *)self location];
  [(BKThumbnailBookViewController *)self setLayout:1];
  [(BKBookViewController *)self setLocation:v4];
}

- (void)books_enableContinuousScroll:(id)a3
{
  id v4 = [(BKBookViewController *)self location];
  [(BKThumbnailBookViewController *)self setLayout:2];
  [(BKBookViewController *)self setLocation:v4];
}

- (void)books_togglePlaying:(id)a3
{
  if ([(BKBookViewController *)self isReadAloudPaused])
  {
    [(BKBookViewController *)self resumeReadAloud];
  }
  else if (self->super._isReading)
  {
    [(BKBookViewController *)self pauseReadAloud];
  }
  else
  {
    [(BKBookViewController *)self setReadAloudState:1];
  }
}

- (void)books_stopPlaying:(id)a3
{
}

- (void)books_skipBackward:(id)a3
{
}

- (void)books_resetZoom:(id)a3
{
  objc_opt_class();
  id v4 = [(BKBookViewController *)self pageNavigationViewController];
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v5 = v6;
  if (v6)
  {
    [v6 zoomToSpread:1];
    objc_super v5 = v6;
  }
}

- (void)books_increaseZoom:(id)a3
{
  objc_opt_class();
  id v4 = [(BKBookViewController *)self pageNavigationViewController];
  uint64_t v7 = BUDynamicCast();

  id v6 = v7;
  if (v7)
  {
    id v5 = [v7 supportsSinglePageMode];
    id v6 = v7;
    if (v5)
    {
      id v5 = [v7 zoomToLeadingPageAnimated:1];
      id v6 = v7;
    }
  }

  _objc_release_x1(v5, v6);
}

- (void)books_decreaseZoom:(id)a3
{
  objc_opt_class();
  id v4 = [(BKBookViewController *)self pageNavigationViewController];
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v6;
  if (v6)
  {
    [v6 zoomToSpread:1];
    id v5 = v6;
  }
}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  if (self->super._section != a3)
  {
    BOOL v5 = a4;
    v9.receiver = self;
    v9.super_class = (Class)BKThumbnailBookViewController;
    -[BKBookViewController setSection:animated:adjustScrollToReveal:](&v9, "setSection:animated:adjustScrollToReveal:");
    [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:v5];
    if (a3)
    {
      if (a3 == 1) {
        [(BKThumbnailBookViewController *)self makeTOCVisible];
      }
    }
    else
    {
      [(BKThumbnailBookViewController *)self makeContentVisible];
    }
    [(BKThumbnailBookViewController *)self updateTopToolbar:v5];
    [(BKThumbnailBookViewController *)self updateBottomToolbar:v5];
    id v8 = [(BKThumbnailBookViewController *)self scrubber];
    [v8 loadAnyMissingThumbnails];
  }
}

- (id)snapshotView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  if (v4 <= 0.0 || (double v6 = v5, v5 <= 0.0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_138C80((uint64_t)v3);
    }
    char v10 = 0;
  }
  else
  {
    double v7 = v4;
    id v8 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v9 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v8 format:v7];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_107A68;
    v12[3] = &unk_1DDDA0;
    id v13 = v3;
    char v10 = [v9 imageWithActions:v12];
  }

  return v10;
}

- (id)bookContentViewControllerView
{
  id v2 = [(BKBookViewController *)self pageNavigationViewController];
  id v3 = [v2 view];

  return v3;
}

- (id)directoryTOCViewControllerView
{
  id v2 = [(BKThumbnailBookViewController *)self directoryController];
  id v3 = [v2 view];

  return v3;
}

- (BOOL)directoryTOCIsVisible
{
  id v2 = [(IMSegmentedViewController *)self->_directoryController viewIfLoaded];
  id v3 = [v2 superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)bookContentView
{
  id v2 = [(BKBookViewController *)self pageNavigationViewController];
  id v3 = [v2 contentView];

  return v3;
}

- (void)bookContentViewImage:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookViewController *)self pageNavigationViewController];
  [v5 contentViewImage:1 afterScreenUpdates:0 completion:v4];
}

- (void)makeTOCVisible
{
  int64_t v3 = [(BKThumbnailBookViewController *)self segmentIndexForDirectoryType:[(BKThumbnailBookViewController *)self directoryType]];
  id v4 = [(BKThumbnailBookViewController *)self directoryController];
  id v5 = [v4 selectedIndex];

  if (v5 != (id)v3)
  {
    double v6 = [(BKThumbnailBookViewController *)self directoryController];
    [v6 setSelectedIndex:v3];
  }
  double v7 = [(BKThumbnailBookViewController *)self bookContentViewController];
  id v8 = [(BKThumbnailBookViewController *)self directoryTOCViewController];
  id v9 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
  if ([(BKThumbnailBookViewController *)v7 isViewLoaded])
  {
    uint64_t v10 = [(BKThumbnailBookViewController *)self bookContentViewControllerView];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v7 == self)
  {
    BOOL v12 = 0;
  }
  else
  {
    unsigned __int8 v11 = [(BKThumbnailBookViewController *)self view];
    BOOL v12 = v10 != (void)v11;
  }
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAlpha:1.0];
  BOOL v103 = v12;
  if (v12) {
    [(BKThumbnailBookViewController *)v7 beginAppearanceTransition:0 animated:+[UIView areAnimationsEnabled]];
  }
  [v8 beginAppearanceTransition:1 animated:[UIView areAnimationsEnabled]];
  id v13 = [(BKThumbnailBookViewController *)self view];
  objc_super v14 = [(BKThumbnailBookViewController *)self backgroundView];
  [v13 insertSubview:v9 aboveSubview:v14];

  objc_super v15 = [v9 leftAnchor];
  objc_super v16 = [(BKThumbnailBookViewController *)self view];
  long long v17 = [v16 leftAnchor];
  char v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  BOOL v19 = [v9 rightAnchor];
  uint64_t v20 = [(BKThumbnailBookViewController *)self view];
  long long v21 = [v20 rightAnchor];
  unsigned __int8 v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  id v23 = [v9 bottomAnchor];
  id v24 = [(BKThumbnailBookViewController *)self view];
  id v25 = [v24 bottomAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  topToolbar = self->_topToolbar;
  double v28 = [v9 topAnchor];
  if (topToolbar)
  {
    double v29 = [(BCNavigationBar *)self->_topToolbar bottomAnchor];
    unint64_t v30 = [v28 constraintEqualToAnchor:v29];
    [v30 setActive:1];
  }
  else
  {
    double v29 = [(BKThumbnailBookViewController *)self view];
    unint64_t v30 = [v29 topAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v31 setActive:1];
  }
  v32 = [(BKThumbnailBookViewController *)self view];
  [v32 layoutIfNeeded];

  id v33 = [(BKThumbnailBookViewController *)self directoryController];
  double v34 = [v33 selectedViewController];

  objc_opt_class();
  v35 = BUDynamicCast();
  objc_opt_class();
  id v36 = [(BKBookViewController *)self pageNavigationViewController];
  v106 = BUDynamicCast();

  v105 = v7;
  if (([(BKBookViewController *)self currentPageNumber] & 1) == 0
    && [(BKBookViewController *)self isPageProgressionRTL])
  {
    uint64_t v37 = (void *)v10;
    unsigned int v38 = 1;
    if (!v35) {
      goto LABEL_31;
    }
LABEL_20:
    unsigned int v101 = v38;
    v39 = v9;
    v40 = v35;
    v41 = v34;
    v42 = v8;
    v43 = [(BKThumbnailBookViewController *)self currentLocation];
    [v40 scrollToLocation:v43];
    [v40 frameForThumbnailAtLocation:v43];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v52 = [(BKThumbnailBookViewController *)self view];
    v53 = v40;
    v54 = [v40 view];
    [v52 convertRect:v54 fromView:v45];
    double MidX = v55;
    double y = v57;
    double v60 = v59;
    double height = v61;

    if (v106)
    {
      if (([v106 shouldDisplaySpread] & 1) != 0
        || [(BKThumbnailBookViewController *)self hasSpreadPages])
      {
        unsigned __int8 v63 = [v40 showSpreads];
        id v8 = v42;
        double v34 = v41;
        id v9 = v39;
        if ((v63 & 1) == 0)
        {
          v116.origin.x = MidX;
          v116.origin.double y = y;
          v116.size.double width = v60;
          v116.size.double height = height;
          double Width = CGRectGetWidth(v116);
          double v65 = MidX - Width;
          BOOL v66 = MidX - Width >= 0.0;
          if (v101) {
            double Width = -0.0;
          }
          double v67 = MidX + Width;
          if ((v101 & v66) != 0) {
            double MidX = v65;
          }
          else {
            double MidX = v67;
          }
          v117.origin.x = MidX;
          v117.origin.double y = y;
          v117.size.double width = v60;
          v117.size.double height = height;
          double y = y + CGRectGetHeight(v117) * -0.5;
          double height = height + height;
          double v60 = v60 + v60;
        }
      }
      else
      {
        unsigned int v70 = [v40 showSpreads];
        id v8 = v42;
        double v34 = v41;
        id v9 = v39;
        if (v70)
        {
          v68 = v37;
          if (v101)
          {
            v118.origin.x = MidX;
            v118.origin.double y = y;
            v118.size.double width = v60;
            v118.size.double height = height;
            double MidX = CGRectGetMidX(v118);
          }
          double v7 = v105;
          v69 = PDFView_ptr;
          v35 = v53;
          v119.origin.x = MidX;
          v119.origin.double y = y;
          v119.size.double width = v60;
          v119.size.double height = height;
          double v60 = CGRectGetWidth(v119) * 0.5;
          goto LABEL_38;
        }
      }
      v68 = v37;
      double v7 = v105;
      v69 = PDFView_ptr;
      v35 = v53;
    }
    else
    {
      id v8 = v42;
      v68 = v37;
      v69 = PDFView_ptr;
      double v34 = v41;
      v35 = v40;
      id v9 = v39;
      double v7 = v105;
    }
LABEL_38:

    goto LABEL_39;
  }
  uint64_t v37 = (void *)v10;
  if (([(BKBookViewController *)self currentPageNumber] & 0x8000000000000001) == 1)
  {
    unsigned int v38 = ![(BKBookViewController *)self isPageProgressionRTL];
    if (v35) {
      goto LABEL_20;
    }
  }
  else
  {
    unsigned int v38 = 0;
    if (v35) {
      goto LABEL_20;
    }
  }
LABEL_31:
  double MidX = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double v60 = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  v68 = v37;
  v69 = PDFView_ptr;
LABEL_39:
  v120.origin.x = MidX;
  v120.origin.double y = y;
  v120.size.double width = v60;
  v120.size.double height = height;
  if (!CGRectIsNull(v120) && v68 && [v69[68] areAnimationsEnabled])
  {
    v100 = v34;
    v71 = v8;
    v72 = [(BKThumbnailBookViewController *)self bookContentView];
    v73 = [v72 snapshotViewAfterScreenUpdates:0];
    [v72 bounds];
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    double v81 = v80;
    v82 = [(BKThumbnailBookViewController *)self view];
    [v72 convertRect:v82 toView:v75];
    CGFloat v84 = v83;
    CGFloat v86 = v85;
    CGFloat v88 = v87;
    CGFloat v90 = v89;

    double v102 = v86;
    double v104 = v84;
    if (!v106)
    {
LABEL_57:
      double v92 = v88;
      double v94 = v90;
      goto LABEL_58;
    }
    v121.origin.x = v84;
    v121.origin.double y = v86;
    v121.size.double width = v88;
    v121.size.double height = v90;
    double v99 = CGRectGetWidth(v121);
    [v73 frame];
    double v92 = v91;
    double v94 = v93;
    if ([(BKThumbnailBookViewController *)self hasSpreadPages]
      && ([v35 showSpreads] & 1) == 0)
    {
      if (v92 > v99) {
        goto LABEL_58;
      }
    }
    else
    {
      if (![(BKThumbnailBookViewController *)self hasSpreadPages]
        || ![v35 showSpreads])
      {
        goto LABEL_57;
      }
      if (v99 + v99 == v92 && v104 - v99 >= 0.0) {
        double v104 = v104 - v99;
      }
      if (v92 > v99) {
        goto LABEL_58;
      }
    }
    v122.origin.double y = v102;
    v122.origin.x = v104;
    v122.size.double width = v88;
    v122.size.double height = v90;
    if (v94 <= CGRectGetHeight(v122)) {
      goto LABEL_57;
    }
LABEL_58:
    [v73 setFrame:v104, v102, v92, v94];
    v95 = [(BKThumbnailBookViewController *)self view];
    [v95 insertSubview:v73 aboveSubview:v68];

    [v68 removeFromSuperview];
    [v9 setAlpha:0.0];
    v96 = v69[68];
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_1085C8;
    v109[3] = &unk_1DDF80;
    id v110 = v9;
    id v111 = v73;
    double v112 = MidX;
    double v113 = y;
    double v114 = v60;
    double v115 = height;
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_108610;
    v107[3] = &unk_1DBEE0;
    v107[4] = self;
    id v108 = v111;
    id v97 = v111;
    [v96 animateWithDuration:v109 animations:v107 completion:0.2];
    v98 = [(BKThumbnailBookViewController *)self view];
    [v98 setUserInteractionEnabled:0];

    id v8 = v71;
    double v34 = v100;
    goto LABEL_59;
  }
  [v68 removeFromSuperview];
  if (v103) {
    [(BKThumbnailBookViewController *)v7 endAppearanceTransition];
  }
  [v8 endAppearanceTransition];
LABEL_59:
}

- (void)_zoomOutAnimationDidStop:(id)a3
{
  id v4 = a3;
  id v9 = [(BKThumbnailBookViewController *)self bookContentViewController];
  id v5 = [(BKThumbnailBookViewController *)self directoryTOCViewController];
  double v6 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
  [v6 setAlpha:1.0];

  [v4 removeFromSuperview];
  if ([(BKThumbnailBookViewController *)v9 isViewLoaded])
  {
    double v7 = [(BKThumbnailBookViewController *)self bookContentViewControllerView];
    [v7 removeFromSuperview];
  }
  if (v9 != self) {
    [(BKThumbnailBookViewController *)v9 endAppearanceTransition];
  }
  [v5 endAppearanceTransition];
  id v8 = [(BKThumbnailBookViewController *)self view];
  [v8 setUserInteractionEnabled:1];
}

- (BOOL)hasSpreadPages
{
  [(BKThumbnailBookViewController *)self currentPages];
  return v2 > 1;
}

- (void)makeContentVisible
{
  int64_t v3 = [(BKThumbnailBookViewController *)self bookContentViewController];
  id v4 = [(BKThumbnailBookViewController *)self directoryTOCViewController];
  id v5 = [(BKThumbnailBookViewController *)self bookContentViewControllerView];
  double v6 = [(BKThumbnailBookViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v5 setFrame:v8, v10, v12, v14];
  [v4 beginAppearanceTransition:0 animated:[UIView areAnimationsEnabled]];
  [v3 beginAppearanceTransition:1 animated:[UIView areAnimationsEnabled]];
  objc_super v15 = [(BKThumbnailBookViewController *)self directoryController];
  objc_super v16 = [v15 selectedViewController];

  objc_opt_class();
  long long v17 = BUDynamicCast();
  if (v17)
  {
    char v18 = [(BKBookViewController *)self location];
    BOOL v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [(BKThumbnailBookViewController *)self currentLocation];
    }
    id v25 = v20;

    [v17 frameForThumbnailAtLocation:v25];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v34 = [(BKThumbnailBookViewController *)self view];
    v35 = [v17 view];
    [v34 convertRect:v35 fromView:v27 toView:v29];
    CGFloat x = v36;
    CGFloat y = v37;
    CGFloat width = v38;
    CGFloat height = v39;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  if ([v4 isViewLoaded])
  {
    v40 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
  }
  else
  {
    v40 = 0;
  }
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  if (CGRectIsNull(v55) || !v40)
  {
    double v44 = [(BKThumbnailBookViewController *)self view];
    if (!v40)
    {
      double v45 = [(BKThumbnailBookViewController *)self backgroundView];
      [v44 insertSubview:v5 aboveSubview:v45];

LABEL_18:
      [(BKThumbnailBookViewController *)self updateBookContentConstraints];
      [(BKThumbnailBookViewController *)self updateContentScale];
      [(BKThumbnailBookViewController *)self updateHUDVisibilityAnimated:0];
      [v40 removeFromSuperview];
      [v4 endAppearanceTransition];
      [v3 endAppearanceTransition];
      goto LABEL_19;
    }
LABEL_17:
    [v44 insertSubview:v5 aboveSubview:v40];
    goto LABEL_18;
  }
  if (!+[UIView areAnimationsEnabled])
  {
    double v44 = [(BKThumbnailBookViewController *)self view];
    goto LABEL_17;
  }
  objc_opt_class();
  v41 = [(BKBookViewController *)self pageNavigationViewController];
  v42 = BUDynamicCast();

  objc_initWeak(location, self);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_108B48;
  v46[3] = &unk_1DDFD0;
  objc_copyWeak(v52, location);
  v52[1] = *(id *)&x;
  v52[2] = *(id *)&y;
  v52[3] = *(id *)&width;
  v52[4] = *(id *)&height;
  id v47 = v40;
  id v48 = v5;
  BOOL v53 = v42 != 0;
  id v43 = v42;
  id v49 = v43;
  double v50 = self;
  id v51 = v17;
  [(BKThumbnailBookViewController *)self bookContentViewImage:v46];

  objc_destroyWeak(v52);
  objc_destroyWeak(location);

LABEL_19:
}

- (void)_zoomInAnimationDidStop:(id)a3
{
  id v4 = a3;
  id v9 = [(BKThumbnailBookViewController *)self directoryTOCViewController];
  id v5 = [(BKThumbnailBookViewController *)self bookContentViewController];
  double v6 = [(BKThumbnailBookViewController *)self bookContentViewControllerView];
  [v6 setAlpha:1.0];

  [v4 removeFromSuperview];
  if ([v9 isViewLoaded])
  {
    double v7 = [(BKThumbnailBookViewController *)self directoryTOCViewControllerView];
    [v7 removeFromSuperview];
  }
  [v9 endAppearanceTransition];
  [v5 endAppearanceTransition];
  double v8 = [(BKThumbnailBookViewController *)self view];
  [v8 setUserInteractionEnabled:1];
}

- (void)updateBookmarkButton:(BOOL)a3
{
  unsigned int v4 = [(BKBookViewController *)self isPageBookmarked];
  if (self->super._pageBookmarksFRC)
  {
    id v5 = @"bookmark.fill";
    if (!v4) {
      id v5 = @"bookmark";
    }
    objc_super v16 = v5;
    double v6 = [(BKBookViewController *)self location];
    id v7 = [v6 ordinal];
    BOOL v8 = v7 != (id)[(BKBookViewController *)self upsellOrdinal];
  }
  else
  {
    BOOL v8 = 0;
    objc_super v16 = @"bookmark";
  }
  if ([(BKThumbnailBookViewController *)self im_isCompactHeight]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  [(UIButton *)self->_bookmarkButton setEnabled:v8];
  bookmarkButton = self->_bookmarkButton;
  double v11 = +[UIImage systemImageNamed:v16];
  double v12 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v9 scale:17.0];
  double v13 = [v11 imageWithConfiguration:v12];
  double v14 = [v13 imageWithRenderingMode:0];
  [(UIButton *)bookmarkButton setImage:v14 forState:0];

  if (v4)
  {
    objc_super v15 = +[UIColor systemRedColor];
    [(UIButton *)self->_bookmarkButton setTintColor:v15];
  }
  else
  {
    [(UIButton *)self->_bookmarkButton setTintColor:0];
  }
}

- (void)_updateBuyButton
{
  id v6 = [(BKBookViewController *)self location];
  id v3 = [v6 ordinal];
  BOOL v4 = v3 == (id)[(BKBookViewController *)self upsellOrdinal];
  id v5 = [(UIBarButtonItem *)self->_buyBarButtonItem customView];
  [v5 setHidden:v4];
}

- (void)storeChangedNotification:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v4 storeChangedNotification:a3];
  [(BKThumbnailBookViewController *)self updateTopToolbar:0];
  [(BKThumbnailBookViewController *)self _updateBuyButton];
}

- (id)scrubber
{
  scrubber = self->_scrubber;
  if (!scrubber)
  {
    objc_super v4 = -[BKThumbnailScrubber initWithFrame:]([BKThumbnailScrubber alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(BKThumbnailScrubber *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKThumbnailScrubber *)v4 setDelegate:self];
    id v5 = [(BKBookViewController *)self book];
    -[BKThumbnailScrubber setHidesSpine:](v4, "setHidesSpine:", [v5 hidesSpine]);

    id v6 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    [(BKThumbnailScrubber *)v4 setStrokeColor:v6];

    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrub:" forControlEvents:64];
    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrub:" forControlEvents:128];
    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrubberTouchDown:" forControlEvents:1];
    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrubValueChanged:" forControlEvents:4096];
    [(BKThumbnailScrubber *)v4 setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKThumbnailScrubber *)v4 setBkAccessibilityDelegate:self];
    id v7 = self->_scrubber;
    self->_scrubber = v4;

    scrubber = self->_scrubber;
  }

  return scrubber;
}

- (BKThumbnailScrubber)verticalScrubber
{
  verticalScrubber = self->_verticalScrubber;
  if (!verticalScrubber)
  {
    objc_super v4 = -[BKThumbnailScrubber initWithFrame:]([BKThumbnailScrubber alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(BKThumbnailScrubber *)v4 setAutoresizingMask:0];
    [(BKThumbnailBookViewController *)self _contentAspectRatio];
    -[BKThumbnailScrubber setCellAspectRatio:](v4, "setCellAspectRatio:");
    [(BKThumbnailScrubber *)v4 setShowSpreads:0];
    [(BKThumbnailScrubber *)v4 setDelegate:self];
    [(BKThumbnailScrubber *)v4 setHideThumbView:1];
    [(BKThumbnailScrubber *)v4 setLayoutDirection:[(BKViewController *)self layoutDirection]];
    id v5 = [(BKBookViewController *)self book];
    -[BKThumbnailScrubber setHidesSpine:](v4, "setHidesSpine:", [v5 hidesSpine]);

    id v6 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    [(BKThumbnailScrubber *)v4 setStrokeColor:v6];

    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrub:" forControlEvents:64];
    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrub:" forControlEvents:128];
    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrubberTouchDown:" forControlEvents:1];
    [(BKThumbnailScrubber *)v4 addTarget:self action:"scrubValueChanged:" forControlEvents:4096];
    [(BKThumbnailScrubber *)v4 setBkAccessibilityDelegate:self];
    [(BKThumbnailScrubber *)v4 setOrientation:1];
    id v7 = self->_verticalScrubber;
    self->_verticalScrubber = v4;

    verticalScrubber = self->_verticalScrubber;
  }

  return verticalScrubber;
}

- (id)scrubberBarButtonItem
{
  id v3 = objc_alloc((Class)UIBarButtonItem);
  objc_super v4 = [(BKThumbnailBookViewController *)self scrubber];
  id v5 = [v3 initWithCustomView:v4];

  return v5;
}

- (void)updateScrubber:(_NSRange)a3
{
  int64_t v4 = [(BKBookViewController *)self pageCountExcludingUpsell];
  if (v4)
  {
    unint64_t v5 = v4;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL
      && [(BKBookViewController *)self controlsVisible]
      && [(BKThumbnailBookViewController *)self wantsBottomToolbar])
    {
      id v6 = [(BKThumbnailBookViewController *)self scrubber];
      [v6 setPageCount:v5];

      int64_t v7 = [(BKPageNavigationViewController *)self->super._pageNavigationViewController pageOffset];
      if (v7 + 1 < v5) {
        unint64_t v8 = v7 + 1;
      }
      else {
        unint64_t v8 = v5;
      }
      if (v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      double v10 = [(BKThumbnailBookViewController *)self scrubber];
      [v10 setPageNumber:v9];

      id v11 = [(BKThumbnailBookViewController *)self scrubber];
      [v11 setProgress:1.0];
    }
  }
}

- (id)imageCache
{
  return self->_imageCache;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4 pageNumber:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setThumbnail:v10 forPage:a5];
  }
  else
  {
    [(BKThumbnailScrubber *)self->_verticalScrubber setThumbnail:v10 forPage:a5 context:v8];
    uint64_t v9 = [(BKThumbnailBookViewController *)self scrubber];
    [v9 setThumbnail:v10 forPage:a5 context:v8];
  }
}

- (id)thumbnailScrubber:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = (BKThumbnailScrubber *)a3;
  id v12 = a6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || [(BKBookViewController *)self upsellPageNumber] == a4)
  {
    double v13 = 0;
  }
  else
  {
    id v14 = [(BKThumbnailScrubber *)v11 track];

    uint64_t v15 = -4;
    if (v14 != v12) {
      uint64_t v15 = 0;
    }
    if (self->_verticalScrubber == v11) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = v15;
    }
    long long v17 = [(BKThumbnailBookViewController *)self imageCache];
    char v18 = [(BKBookViewController *)self book];
    [(BKThumbnailBookViewController *)self _containerBoundsForGeometry];
    double v13 = [v17 thumbnailForPage:a4 asset:v18 size:self renderingCacheCallbackTarget:v12 renderingCacheCallbackContext:v16 priority:width height:v19 containerBounds:v20];
  }

  return v13;
}

- (id)thumbnailScrubber:(id)a3 pageTitleForPageNumber:(int64_t)a4
{
  return [(BKBookViewController *)self pageTitleForPageNumber:a4];
}

- (void)thumbnailScrubber:(id)a3 cancelPreviousRenderRequestsWithContext:(id)a4
{
  imageCache = self->_imageCache;
  if (imageCache) {
    [(IMThumbnailRenderingCache *)imageCache cancelRenderingCacheOperationsForTarget:self context:a4];
  }
}

- (void)setPageNumberHudTextLabelForValidatedPageNumber:(int64_t)a3 visiblePageCount:(unint64_t)a4 validatedPageCount:(unint64_t)a5
{
  uint64_t v9 = -[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:");
  id v22 = v9;
  if (v9)
  {
    if (a4 == 2)
    {
      long long v17 = [(BKBookViewController *)self pageTitleForPageNumber:a3 + 1];
      uint64_t v9 = v22;
    }
    else
    {
      long long v17 = 0;
    }
    if ([v9 length] && objc_msgSend(v17, "length"))
    {
      pageNumberHUD = self->_pageNumberHUD;
      double v19 = AEBundle();
      double v20 = [v19 localizedStringForKey:@"%@-%@" value:&stru_1DF0D8 table:0];
      double v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v22, v17);
      [(BKInfoHUD *)pageNumberHUD setInfoText:v21];

      goto LABEL_17;
    }
    if ([v22 length] || !objc_msgSend(v17, "length"))
    {
      uint64_t v15 = self->_pageNumberHUD;
      id v16 = v22;
      goto LABEL_16;
    }
  }
  else
  {
    if (a4 == 2) {
      int64_t v10 = a3 + 1;
    }
    else {
      int64_t v10 = a3;
    }
    id v11 = AEBundle();
    id v12 = [v11 localizedStringForKey:@"%@ of %@" value:&stru_1DF0D8 table:0];
    double v13 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v10 usesGroupingSeparator:0];
    id v14 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:a5 usesGroupingSeparator:0];
    long long v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13, v14);
  }
  uint64_t v15 = self->_pageNumberHUD;
  id v16 = v17;
LABEL_16:
  [(BKInfoHUD *)v15 setInfoText:v16];
LABEL_17:
}

- (void)scrubValueChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (self->_pageNumberHUD)
  {
    id v6 = [v4 pageNumber];
    int64_t v7 = [(BKBookViewController *)self pageCountIncludingUpsell];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v8 = v7;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(BKThumbnailBookViewController *)self currentPages];
        [(BKThumbnailBookViewController *)self setPageNumberHudTextLabelForValidatedPageNumber:v6 visiblePageCount:v9 validatedPageCount:v8];
      }
    }
    int64_t v10 = [(BKThumbnailBookViewController *)self scrubber];
    id v11 = [v10 callout];

    if (v11)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_109C84;
      v12[3] = &unk_1DAB88;
      void v12[4] = self;
      +[UIView animateWithDuration:v12 animations:0.2];
    }
  }
}

- (double)_infoHUDHeight
{
  unsigned int v2 = +[UIFont bc_accessibilityFontSizesEnabled];
  double result = 30.0;
  if (v2)
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge, 30.0))
    {
      return 57.0;
    }
    else
    {
      unsigned int v4 = +[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge];
      double result = 40.0;
      if (v4) {
        return 50.0;
      }
    }
  }
  return result;
}

- (void)_updatePageNumberHUDVisible:(BOOL)a3
{
  pageNumberHUD = self->_pageNumberHUD;
  if (!pageNumberHUD) {
    return;
  }
  [(BKInfoHUD *)pageNumberHUD setAlpha:(double)a3];
  id v5 = [(BKThumbnailBookViewController *)self currentPages];
  uint64_t v7 = v6;
  int64_t v8 = [(BKBookViewController *)self pageCountIncludingUpsell];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v8;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v5, v7);
      id v14 = [(BKBookViewController *)self pageTitleForPageNumber:v10];
      if (v14)
      {
        id v11 = [(BKBookViewController *)self book];
        if ([v11 hasPhysicalPages])
        {
          id v12 = [v14 length];

          if (v12) {
            goto LABEL_7;
          }
        }
        else
        {
        }
        [(BKInfoHUD *)self->_pageNumberHUD setAlpha:0.0];
        goto LABEL_14;
      }
LABEL_7:
      [(BKThumbnailBookViewController *)self setPageNumberHudTextLabelForValidatedPageNumber:v10 visiblePageCount:v7 validatedPageCount:v9];
LABEL_14:

      return;
    }
  }
  double v13 = self->_pageNumberHUD;

  [(BKInfoHUD *)v13 setAlpha:0.0];
}

- (BOOL)shouldShowHUDs
{
  if ([(BKBookViewController *)self section]) {
    return 0;
  }
  if ([(BKBookViewController *)self controlsVisible]) {
    return 1;
  }

  return [(BKThumbnailBookViewController *)self catalystToolbarActive];
}

- (void)updateHUDVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKThumbnailBookViewController *)self isViewLoaded])
  {
    unsigned __int8 v5 = [(BKThumbnailBookViewController *)self shouldShowHUDs];
    [(BCNavigationBar *)self->_topToolbar alpha];
    double v6 = 16.0;
    if (v7 <= 0.0)
    {
      [(BCNavigationBar *)self->_topToolbar bounds];
      double v6 = 8.0 - CGRectGetHeight(v17);
    }
    int64_t v8 = [(BKThumbnailBookViewController *)self pageNumberHUDTopConstraint];
    [v8 setConstant:v6];

    int64_t v9 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    [v9 setNeedsUpdateConstraints];

    [(BCNavigationBar *)self->_topToolbar alpha];
    BOOL v11 = v10 > 0.0;
    id v12 = [(BKThumbnailBookViewController *)self pageNumberHUD];
    [v12 setIsAccessibilityElement:v11];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10A05C;
    void v15[3] = &unk_1DBE90;
    v15[4] = self;
    unsigned __int8 v16 = v5;
    double v13 = objc_retainBlock(v15);
    id v14 = v13;
    if (v3) {
      +[UIView animateWithDuration:v13 animations:0.2];
    }
    else {
      ((void (*)(void *))v13[2])(v13);
    }
  }
}

- (id)_bk_backgroundColor
{
  [(BCNavigationBar *)self->_topToolbar alpha];
  if (v3 > 0.0)
  {
    unsigned int v4 = [(BKThumbnailBookViewController *)self themePage];
    [v4 backgroundColorForTraitEnvironment:self];
  }
  else
  {
    unsigned int v4 = [(BKThumbnailBookViewController *)self traitCollection];
    +[UIColor bc_darkSystemBackgroundForTraitCollection:v4];
  unsigned __int8 v5 = };

  return v5;
}

- (void)showFontPicker:(id)a3
{
  id v4 = a3;
  if ([(UIBarButtonItem *)self->_fontBarButtonItem isEnabled]) {
    [(BKBookViewController *)self presentAppearanceViewControllerFromItem:v4];
  }
}

- (BOOL)onlySupportsScrollingLayout
{
  return 0;
}

- (id)appearanceMenuItems
{
  double v3 = +[NSMutableArray array];
  if ([(BKThumbnailBookViewController *)self supportsBrightness]) {
    [v3 addObject:@"BKAppearanceMenuItemBrightness"];
  }
  if ([(BKThumbnailBookViewController *)self supportsScrollLayout]
    && ![(BKThumbnailBookViewController *)self isScrolledContinuousFixedLayout])
  {
    [v3 addObject:@"BKAppearanceMenuItemVerticalScrollingView"];
  }

  return v3;
}

- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(BKBookViewController *)self location];
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v8 appearanceViewController:v6 didChangeLayout:a4];

  [(BKBookViewController *)self setLocation:v7];
}

- (unint64_t)directoryTypeForPageThumbnails
{
  return 1;
}

- (unint64_t)directoryTypeForTOC
{
  return 2;
}

- (unint64_t)directoryTypeForBookmarks
{
  return 3;
}

- (id)documentForDirectory
{
  return 0;
}

- (id)_directoryController
{
  directoryController = self->_directoryController;
  if (!directoryController)
  {
    id v4 = (IMSegmentedViewController *)objc_alloc_init((Class)IMSegmentedViewController);
    unsigned __int8 v5 = self->_directoryController;
    self->_directoryController = v4;

    [(BKThumbnailBookViewController *)self addChildViewController:self->_directoryController];
    id v6 = [(BKThumbnailBookViewController *)self _directoryForType:[(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails]];
    double v7 = [(BKThumbnailBookViewController *)self _directoryForType:[(BKThumbnailBookViewController *)self directoryTypeForTOC]];
    objc_super v8 = [(BKThumbnailBookViewController *)self _directoryForType:[(BKThumbnailBookViewController *)self directoryTypeForBookmarks]];
    id v9 = [objc_alloc((Class)NSArray) initWithObjects:v6, v7, v8, 0];
    [(IMSegmentedViewController *)self->_directoryController setViewControllers:v9];

    directoryController = self->_directoryController;
  }

  return directoryController;
}

- (unint64_t)directoryType
{
  double v3 = [(BKThumbnailBookViewController *)self preferredLayoutCache];
  id v4 = [(BKBookViewController *)self book];
  self->_directoryType = (unint64_t)[v3 preferredDirectoryTypeForBook:v4];

  unint64_t result = self->_directoryType;
  if (!result)
  {
    unint64_t result = [(BKThumbnailBookViewController *)self defaultDirectoryType];
    self->_directoryType = result;
  }
  return result;
}

- (unint64_t)defaultDirectoryType
{
  double v3 = [(BKBookViewController *)self book];
  if ([v3 suppressTOC]) {
    unint64_t v4 = [(BKThumbnailBookViewController *)self directoryTypeForPageThumbnails];
  }
  else {
    unint64_t v4 = [(BKThumbnailBookViewController *)self directoryTypeForTOC];
  }
  unint64_t v5 = v4;

  return v5;
}

- (void)setDirectoryType:(unint64_t)a3
{
  if (self->_directoryType != a3)
  {
    self->_unint64_t directoryType = a3;
    unint64_t v4 = [(BKThumbnailBookViewController *)self preferredLayoutCache];
    unint64_t directoryType = self->_directoryType;
    id v6 = [(BKBookViewController *)self book];
    [v4 setPreferredDirectoryType:directoryType forBook:v6];

    int64_t v7 = [(BKThumbnailBookViewController *)self segmentIndexForDirectoryType:self->_directoryType];
    objc_super v8 = [(BKThumbnailBookViewController *)self _directoryController];
    [v8 setSelectedIndex:v7];

    [(BKThumbnailBookViewController *)self _updateDirectorySwitch];
    [(BKBookViewController *)self updateToolbarController];
    [(BKBookViewController *)self notifyAppIntentsInfoChanged];
  }
}

- (double)_contentAspectRatio
{
  return 0.75;
}

- (id)_pageDirectory
{
  pageDirectorCGFloat y = self->_pageDirectory;
  if (!pageDirectory)
  {
    unint64_t v4 = objc_alloc_init(BKPageThumbnailDirectory);
    unint64_t v5 = self->_pageDirectory;
    self->_pageDirectorCGFloat y = v4;

    [(BKPageThumbnailDirectory *)self->_pageDirectory setPageCount:[(BKBookViewController *)self pageCountExcludingUpsell]];
    [(BKThumbnailDirectory *)self->_pageDirectory setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKThumbnailBookViewController *)self _contentAspectRatio];
    -[BKThumbnailDirectory setCellAspectRatio:](self->_pageDirectory, "setCellAspectRatio:");
    [(BKThumbnailBookViewController *)self addChildViewController:self->_pageDirectory];
    pageDirectorCGFloat y = self->_pageDirectory;
  }

  return pageDirectory;
}

- (id)_tocDirectory
{
  tocDirectorCGFloat y = self->_tocDirectory;
  if (!tocDirectory)
  {
    unint64_t v4 = objc_alloc_init(BKTOCContentViewController);
    [(BKTOCContentViewController *)v4 setPreferredFontSize:19.0];
    unint64_t v5 = self->_tocDirectory;
    self->_tocDirectorCGFloat y = &v4->super;
    id v6 = v4;

    [(BKTOCViewController *)self->_tocDirectory setTocContentType:0];
    [(BCNavigationBar *)self->_topToolbar frame];
    -[BKTOCViewController setCenteringInsets:](self->_tocDirectory, "setCenteringInsets:", CGRectGetMaxY(v10), 0.0, 0.0, 0.0);
    int64_t v7 = [(BKBookViewController *)self paginationController];
    [(BKTOCViewController *)self->_tocDirectory setPaginationController:v7];

    [(BKViewController *)self->_tocDirectory setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKContentViewController *)self->_tocDirectory setLayoutDelegate:self];

    tocDirectorCGFloat y = self->_tocDirectory;
  }

  return tocDirectory;
}

- (id)_bookmarkDirectory
{
  bookmarkDirectorCGFloat y = self->_bookmarkDirectory;
  if (!bookmarkDirectory)
  {
    unint64_t v4 = objc_alloc_init(BKBookmarkThumbnailDirectory);
    unint64_t v5 = self->_bookmarkDirectory;
    self->_bookmarkDirectorCGFloat y = v4;

    [(BKThumbnailDirectory *)self->_bookmarkDirectory setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKThumbnailBookViewController *)self _contentAspectRatio];
    -[BKThumbnailDirectory setCellAspectRatio:](self->_bookmarkDirectory, "setCellAspectRatio:");
    [(BKThumbnailBookViewController *)self addChildViewController:self->_bookmarkDirectory];
    bookmarkDirectorCGFloat y = self->_bookmarkDirectory;
  }

  return bookmarkDirectory;
}

- (id)_pdfPageDirectory
{
  pdfPageDirectorCGFloat y = self->_pdfPageDirectory;
  if (!pdfPageDirectory)
  {
    unint64_t v4 = objc_alloc_init(BKPDFPageThumbnailDirectory);
    [(BKThumbnailDirectory *)v4 setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKThumbnailBookViewController *)self _contentAspectRatio];
    -[BKThumbnailDirectory setCellAspectRatio:](v4, "setCellAspectRatio:");
    [(BKPDFPageThumbnailDirectory *)v4 setShowBookmarksOnly:0];
    [(BKPDFPageThumbnailDirectory *)v4 setShowBookmarks:1];
    objc_opt_class();
    unint64_t v5 = [(BKThumbnailBookViewController *)self documentForDirectory];
    id v6 = BUDynamicCast();
    [(BKPDFPageThumbnailDirectory *)v4 setPdfDocument:v6];

    int64_t v7 = self->_pdfPageDirectory;
    self->_pdfPageDirectorCGFloat y = v4;

    pdfPageDirectorCGFloat y = self->_pdfPageDirectory;
  }

  return pdfPageDirectory;
}

- (id)_pdfOutlineDirectory
{
  pdfOutlineDirectorCGFloat y = self->_pdfOutlineDirectory;
  if (!pdfOutlineDirectory)
  {
    unint64_t v4 = objc_alloc_init(BKPDFTOCViewController);
    [(BKPDFTOCViewController *)v4 setPreferredFontSize:19.0];
    [(BKTOCViewController *)v4 setTocContentType:0];
    [(BCNavigationBar *)self->_topToolbar frame];
    -[BKTOCViewController setCenteringInsets:](v4, "setCenteringInsets:", CGRectGetMaxY(v11), 0.0, 0.0, 0.0);
    unint64_t v5 = [(BKBookViewController *)self paginationController];
    [(BKTOCViewController *)v4 setPaginationController:v5];

    [(BKViewController *)v4 setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKContentViewController *)v4 setLayoutDelegate:self];
    objc_opt_class();
    id v6 = [(BKThumbnailBookViewController *)self documentForDirectory];
    int64_t v7 = BUDynamicCast();
    [(BKPDFTOCViewController *)v4 setPdfDocument:v7];

    objc_super v8 = self->_pdfOutlineDirectory;
    self->_pdfOutlineDirectorCGFloat y = v4;

    pdfOutlineDirectorCGFloat y = self->_pdfOutlineDirectory;
  }

  return pdfOutlineDirectory;
}

- (id)_pdfBookmarkDirectory
{
  pdfBookmarkDirectorCGFloat y = self->_pdfBookmarkDirectory;
  if (!pdfBookmarkDirectory)
  {
    unint64_t v4 = objc_alloc_init(BKPDFPageThumbnailDirectory);
    [(BKThumbnailDirectory *)v4 setLayoutDirection:[(BKViewController *)self layoutDirection]];
    [(BKThumbnailBookViewController *)self _contentAspectRatio];
    -[BKThumbnailDirectory setCellAspectRatio:](v4, "setCellAspectRatio:");
    [(BKPDFPageThumbnailDirectory *)v4 setShowBookmarksOnly:1];
    [(BKPDFPageThumbnailDirectory *)v4 setShowBookmarks:1];
    objc_opt_class();
    unint64_t v5 = [(BKThumbnailBookViewController *)self documentForDirectory];
    id v6 = BUDynamicCast();
    [(BKPDFPageThumbnailDirectory *)v4 setPdfDocument:v6];

    int64_t v7 = self->_pdfBookmarkDirectory;
    self->_pdfBookmarkDirectorCGFloat y = v4;

    pdfBookmarkDirectorCGFloat y = self->_pdfBookmarkDirectory;
  }

  return pdfBookmarkDirectory;
}

- (id)_directoryForType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v4 = [(BKThumbnailBookViewController *)self _pageDirectory];
      goto LABEL_9;
    case 2uLL:
      uint64_t v4 = [(BKThumbnailBookViewController *)self _tocDirectory];
      goto LABEL_9;
    case 3uLL:
      uint64_t v4 = [(BKThumbnailBookViewController *)self _bookmarkDirectory];
      goto LABEL_9;
    case 4uLL:
      uint64_t v4 = [(BKThumbnailBookViewController *)self _pdfPageDirectory];
      goto LABEL_9;
    case 5uLL:
      uint64_t v4 = [(BKThumbnailBookViewController *)self _pdfOutlineDirectory];
      goto LABEL_9;
    case 6uLL:
      uint64_t v4 = [(BKThumbnailBookViewController *)self _pdfBookmarkDirectory];
LABEL_9:
      unint64_t v5 = (void *)v4;
      break;
    default:
      unint64_t v5 = 0;
      break;
  }
  id v6 = [(BKBookViewController *)self book];
  [v5 setBook:v6];

  objc_opt_class();
  int64_t v7 = [(BKThumbnailBookViewController *)self theme];
  objc_super v8 = BUDynamicCast();
  [v5 setTheme:v8];

  [v5 setDirectoryDelegate:self];

  return v5;
}

- (void)directorySwitchPressed:(id)a3
{
  unint64_t v4 = -[BKThumbnailBookViewController directoryTypeForSegmentIndex:](self, "directoryTypeForSegmentIndex:", [a3 selectedSegmentIndex]);

  [(BKThumbnailBookViewController *)self setDirectoryType:v4];
}

- (void)_updateDirectorySwitch
{
  double v3 = [(BKThumbnailBookViewController *)self segmentIndexForDirectoryType:[(BKThumbnailBookViewController *)self directoryType]];
  directorySwitch = self->_directorySwitch;
  if (directorySwitch)
  {
    unint64_t v5 = [(UISegmentedControl *)directorySwitch numberOfSegments];
    directorySwitch = self->_directorySwitch;
    if (v3 >= v5)
    {
      double v3 = (char *)[(UISegmentedControl *)directorySwitch numberOfSegments] - 1;
      directorySwitch = self->_directorySwitch;
    }
  }

  [(UISegmentedControl *)directorySwitch setSelectedSegmentIndex:v3];
}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10ADE4;
  v6[3] = &unk_1DAB88;
  v6[4] = self;
  id v5 = a4;
  [(BKBookViewController *)self recordedJumpToLocation:v5 animated:0 completion:v6];
  [(BKBookViewController *)self setLocation:v5];
}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self paginationController];
  id v7 = [v6 pageNumberForLocation:v5];

  return (int64_t)v7;
}

- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4
{
  return [(BKBookViewController *)self pageLocationForPageNumber:a4];
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [(BKBookViewController *)self pageNavigationViewController];
  id v7 = BUDynamicCast();

  objc_super v8 = [(BKBookViewController *)self paginationController];
  id v9 = [v8 pageRangeForChapter:v5];
  uint64_t v11 = v10;

  int64_t v12 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v9, v11);
  int64_t v13 = v12;
  if ((unint64_t)(v12 - 1) >= 0x7FFFFFFFFFFFFFFELL)
  {
    id v14 = _AEBookPluginsPageTurnLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v17 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Received invalid page number %ld", buf, 0xCu);
    }

    [(BKThumbnailBookViewController *)self setSection:0 animated:+[UIView areAnimationsEnabled] adjustScrollToReveal:0];
  }
  else if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10B090;
    void v15[3] = &unk_1DC500;
    v15[4] = self;
    void v15[5] = v12;
    [v7 turnToPageNumber:v12 animated:0 completion:v15];
  }
  else
  {
    [(BKThumbnailBookViewController *)self setSection:0 animated:+[UIView areAnimationsEnabled] adjustScrollToReveal:0];
    [(BKThumbnailBookViewController *)self turnToPageNumber:v13 animated:0];
  }
}

- (id)thumbnailDirectory:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    double height = a5.height;
    double width = a5.width;
    id v11 = a6;
    int64_t v12 = [(BKThumbnailBookViewController *)self imageCache];
    int64_t v13 = [(BKBookViewController *)self book];
    [(BKThumbnailBookViewController *)self _containerBoundsForGeometry];
    id v6 = [v12 thumbnailForPage:a4 asset:v13 size:self priority:0 containerBounds:width, height, v14, v15, v16, v17];
  }

  return v6;
}

- (void)thumbnailDirectory:(id)a3 cancelPreviousRenderRequestsWithContext:(id)a4
{
  id v5 = a4;
  id v6 = [(BKThumbnailBookViewController *)self imageCache];
  [v6 cancelRenderingCacheOperationsForTarget:self context:v5];
}

- (void)contentViewReady:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  [(BKBookViewController *)&v4 contentViewReady:a3];
  [(BKThumbnailBookViewController *)self updateTopToolbar:0];
  [(BKBookViewController *)self readingLocationChanged];
}

- (UIEdgeInsets)edgeInsetsForContentViewController:(id)a3
{
  objc_super v4 = [(BKThumbnailBookViewController *)self configuration];
  [v4 sideContentInset];
  double v6 = v5;
  id v7 = [(BKThumbnailBookViewController *)self configuration];
  [v7 sideContentInset];
  double v9 = v8;

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v6;
  double v13 = v9;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (id)transitionContentView
{
  if ([(BKThumbnailBookViewController *)self directoryTOCIsVisible])
  {
    double v3 = [(BKThumbnailBookViewController *)self view];
  }
  else
  {
    objc_super v4 = [(BKBookViewController *)self pageNavigationViewController];
    double v3 = [v4 contentView];
  }

  return v3;
}

- (id)transitionContentBackgroundColor
{
  unsigned int v2 = [(BKThumbnailBookViewController *)self backgroundView];
  double v3 = [v2 backgroundColor];

  return v3;
}

- (id)analyticsReadingSettingsData
{
  double v3 = +[UIScreen mainScreen];
  [v3 brightness];
  double v5 = v4;

  unint64_t v6 = [(BKBookViewController *)self layout];
  if (v6 - 1 > 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_18F108[v6 - 1];
  }
  id v8 = objc_alloc((Class)BAReadingSettingsData);
  double v9 = +[NSNumber numberWithDouble:v5];
  id v10 = [v8 initWithScrollViewStatus:v7 autoNightThemeStatus:0 backgroundColor:4 font:&stru_1DF0D8 fontSize:&off_1E93F8 brightnessLevel:v9];

  return v10;
}

+ (BOOL)verticalScrollFeatureEnabled
{
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"BKMangaVerticalScrollModeDisabled-v2"] ^ 1;

  return v3;
}

- (BOOL)isInterfaceRTL
{
  if (![(BKThumbnailBookViewController *)self isViewLoaded]) {
    return 0;
  }
  char v3 = [(BKThumbnailBookViewController *)self view];
  BOOL v4 = (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v3 semanticContentAttribute]) == (char *)&dword_0 + 1;

  return v4;
}

- (double)defaultPageNumberHUDWidthConstraintConstant
{
  return -32.0;
}

- (CGRect)_containerBoundsForGeometry
{
  unsigned int v2 = [(BKThumbnailBookViewController *)self viewIfLoaded];
  char v3 = [v2 window];
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
    char v3 = v2;
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

- (void)_updateToolbarPositionAndBackgroundExtension
{
  char v3 = [(BCNavigationBar *)self->_topToolbar window];
  id v7 = [v3 windowScene];

  BOOL v4 = [v7 statusBarManager];
  [v4 defaultStatusBarHeightInOrientation:[v7 interfaceOrientation]];
  double v6 = v5;

  if ([(BKThumbnailBookViewController *)self im_isCompactHeight]) {
    double v6 = 0.0;
  }
  [(BCNavigationBar *)self->_topToolbar _setOverrideBackgroundExtension:v6];
  [(NSLayoutConstraint *)self->_topBarTopConstraint setConstant:v6];
}

- (void)buildHoverControlRegionWithBuilder:(id)a3
{
  id v43 = a3;
  BOOL v4 = [(BKThumbnailBookViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(BKThumbnailBookViewController *)self view];
  [(BCNavigationBar *)self->_topToolbar bounds];
  [v9 convertRect:self->_topToolbar fromView:];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v45.origin.CGFloat x = v11;
  v45.origin.CGFloat y = v13;
  v45.size.CGFloat width = v15;
  v45.size.CGFloat height = v17;
  double MaxY = CGRectGetMaxY(v45);
  double v19 = 0.5;
  if ([(BKBookViewController *)self controlsVisible]) {
    double v20 = 1.0;
  }
  else {
    double v20 = 0.5;
  }
  [v43 addRegionWithRect:v6, 0.0, v8, MaxY * v20];
  double v21 = [(BKThumbnailBookViewController *)self view];
  [v21 bounds];
  double v23 = v22;
  CGFloat v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v46.origin.CGFloat x = v23;
  v46.origin.CGFloat y = v25;
  v46.size.CGFloat width = v27;
  v46.size.CGFloat height = v29;
  double v30 = CGRectGetMaxY(v46);
  double v31 = [(BKThumbnailScrubber *)self->_scrubber superview];

  if (v31)
  {
    double v32 = [(BKThumbnailBookViewController *)self view];
    [(BKThumbnailScrubber *)self->_scrubber bounds];
    [v32 convertRect:self->_scrubber fromView:];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;

    v47.origin.CGFloat x = v34;
    v47.origin.CGFloat y = v36;
    v47.size.CGFloat width = v38;
    double v19 = 0.5;
    v47.size.CGFloat height = v40;
    double MinY = CGRectGetMinY(v47);
  }
  else
  {
    double MinY = fmax(v30 + -40.0, 0.0);
  }
  if ([(BKBookViewController *)self controlsVisible]) {
    double v42 = 1.0;
  }
  else {
    double v42 = v19;
  }
  [v43 addRegionWithRect:v23, v29 - (v29 - MinY) * v42, v27];
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setPreferredLayoutCache:(id)a3
{
}

- (BCNavigationBar)topToolbar
{
  return self->_topToolbar;
}

- (BKInfoHUD)pageNumberHUD
{
  return self->_pageNumberHUD;
}

- (BKLocation)initialJumpLocation
{
  return self->_initialJumpLocation;
}

- (void)setInitialJumpLocation:(id)a3
{
}

- (void)setVerticalScrubber:(id)a3
{
}

- (NSLayoutConstraint)pageNumberHUDWidthConstraint
{
  return self->_pageNumberHUDWidthConstraint;
}

- (NSString)tipContextName
{
  return self->_tipContextName;
}

- (NSLayoutConstraint)pageNumberHUDHeightConstraint
{
  return self->_pageNumberHUDHeightConstraint;
}

- (void)setPageNumberHUDHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageNumberHUDTopConstraint
{
  return self->_pageNumberHUDTopConstraint;
}

- (void)setPageNumberHUDTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topBarTopConstraint
{
  return self->_topBarTopConstraint;
}

- (void)setTopBarTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageNumberHUDTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageNumberHUDHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tipContextName, 0);
  objc_storeStrong((id *)&self->_pageNumberHUDWidthConstraint, 0);
  objc_storeStrong((id *)&self->_initialJumpLocation, 0);
  objc_storeStrong((id *)&self->_pageNumberHUD, 0);
  objc_storeStrong((id *)&self->_preferredLayoutCache, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_verticalScrubber, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_directorySwitchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_directorySwitch, 0);
  objc_storeStrong((id *)&self->_bookmarkBarButtonItem, 0);
  objc_storeStrong((id *)&self->_bookmarkButton, 0);
  objc_storeStrong((id *)&self->_buyBarButtonItem, 0);
  objc_storeStrong((id *)&self->_titleBarButtonItem, 0);
  objc_storeStrong((id *)&self->_audioBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editRedoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editUndoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editToolboxBarButtonItem, 0);
  objc_storeStrong((id *)&self->_brightnessBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tocBarButtonItem, 0);
  objc_storeStrong((id *)&self->_fontBarButtonItem, 0);
  objc_storeStrong((id *)&self->_searchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_resumeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_libraryBarButtonItem, 0);
  objc_storeStrong((id *)&self->_pdfBookmarkDirectory, 0);
  objc_storeStrong((id *)&self->_pdfOutlineDirectory, 0);
  objc_storeStrong((id *)&self->_pdfPageDirectory, 0);
  objc_storeStrong((id *)&self->_bookmarkDirectory, 0);
  objc_storeStrong((id *)&self->_tocDirectory, 0);
  objc_storeStrong((id *)&self->_pageDirectory, 0);
  objc_storeStrong((id *)&self->_directoryController, 0);
  objc_storeStrong((id *)&self->_topToolbar, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end