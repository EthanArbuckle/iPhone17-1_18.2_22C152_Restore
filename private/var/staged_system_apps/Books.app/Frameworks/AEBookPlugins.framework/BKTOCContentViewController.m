@interface BKTOCContentViewController
- (AEAssetSharingConnectionClient)assetSharingConnectionClient;
- (AEMinimalTemplate)template;
- (BKActivityIndicatorOverlayView)activityIndicatorOverlayView;
- (BKTOCBookmarksDescription)descriptionView;
- (BKTOCContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKTOCImageCache2)imageCache;
- (BKTOCWebViewCellLoadQueue)requestQueue;
- (BOOL)isContentLoadPending;
- (BOOL)isContentLoaded;
- (BOOL)isReusable;
- (BOOL)p_willUseWebViewForCellWithChapter:(id)a3;
- (BOOL)shareItemAtIndexPath:(id)a3;
- (BOOL)showRowForCurrentLocation;
- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (NSIndexPath)recenteredIndexPath;
- (NSMutableDictionary)cachedRowContents;
- (NSMutableDictionary)requestToIndexPath;
- (UIToolbar)editingToolbar;
- (WKWebView)sharedWebView;
- (double)calculateFontSize;
- (double)preferredFontSize;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_bkTableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)_indexPathForRowNearestPageNumber:(int64_t)a3 pageNumberForObjectSelector:(SEL)a4 isExactPageMatch:(BOOL *)a5;
- (id)annotationIndexPathForRowNearestPageNumber:(int64_t)a3 isExactPageMatch:(BOOL *)a4;
- (id)author;
- (id)bookSharingRequestClient:(id)a3 annotationAtIndex:(unint64_t)a4;
- (id)bookSharingRequestClient:(id)a3 selectedAnnotationAtIndex:(unint64_t)a4;
- (id)bookTitle;
- (id)bookmarksFetchedResultsController;
- (id)currentLocation;
- (id)dateFormatter;
- (id)deleteSwipeAction:(id)a3;
- (id)editToolbarFooterTextWithCount:(unint64_t)a3;
- (id)fetchedResultsController;
- (id)fontFamily;
- (id)fontForChapter:(id)a3;
- (id)highlightedTextLabelFont;
- (id)indexPathOfLastRow;
- (id)p_annotationForIndexPath:(id)a3;
- (id)p_annotationsForRowItems:(id)a3;
- (id)p_selectedAnnotations;
- (id)pageNumberStringForAnnotation:(id)a3;
- (id)pageTitleForAnnotation:(id)a3;
- (id)pageTitleForChapter:(id)a3;
- (id)reuseIdentifier;
- (id)reuseIdentifierForCellType:(unint64_t)a3;
- (id)scrollView;
- (id)shareSwipeAction:(id)a3;
- (id)storeURL;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tocIndexPathForRowNearestPageNumber:(int64_t)a3;
- (int)assetSharingConnectionTypeForClient:(id)a3;
- (int64_t)cellLoadingOperationCount;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)ordinal;
- (int64_t)pageNumberForCurrentLocation;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewSeparatorStyle;
- (int64_t)totalPages;
- (unint64_t)bookSharingRequestNumberOfAnnotations:(id)a3;
- (unint64_t)bookSharingRequestNumberOfSelectedAnnotations:(id)a3;
- (void)_configureAnnotationCell:(id)a3 forAnnotation:(id)a4 forRowAtIndexPath:(id)a5;
- (void)_configurePointAnnotationCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)_configureRangeAnnotationCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)_configureTOCCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)_configureWebTOCCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)_dumpCachedWebContentAndReload;
- (void)_hideActivityIndicator;
- (void)_notifyDelegateContentDidChange;
- (void)_showActivityIndicator;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateColors;
- (void)_updateContentInsets;
- (void)assetSharingConnectionClient:(id)a3 performRequest:(int)a4;
- (void)beginAssetSharingConnectionWithClient:(id)a3;
- (void)beginEditingIfNeeded;
- (void)beginEditingMode;
- (void)beginSelectionStartingWithIndexPath:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4;
- (void)contentBeganLoadingForRequest:(id)a3;
- (void)contentFinishedLoadingForRequest:(id)a3 preferredHeight:(double)a4 error:(id)a5;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)deleteAnnotationAtIndexPath:(id)a3;
- (void)deleteFromToolbar;
- (void)deleteSelectedAnnotations;
- (void)endAssetSharingConnectionWithClient:(id)a3;
- (void)endEditingIfNeeded;
- (void)endEditingMode;
- (void)installEditModeToolbar;
- (void)notifyBookSharingClientSelectionChanged;
- (void)releaseViews;
- (void)reload;
- (void)removeEditModeToolbar;
- (void)removeHighlightFromCurrentLocation;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectNone:(id)a3;
- (void)setActivityIndicatorOverlayView:(id)a3;
- (void)setAssetSharingConnectionClient:(id)a3;
- (void)setBook:(id)a3;
- (void)setCachedRowContents:(id)a3;
- (void)setCellLoadingOperationCount:(int64_t)a3;
- (void)setDescriptionView:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setNeedsRestyle;
- (void)setPreferredFontSize:(double)a3;
- (void)setRecenteredIndexPath:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setRequestToIndexPath:(id)a3;
- (void)setSharedWebView:(id)a3;
- (void)setTemplate:(id)a3;
- (void)setTheme:(id)a3;
- (void)shareFromToolbar;
- (void)shareSelectedAnnotationsFromSourceView:(id)a3;
- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performPrimaryActionForRowAtIndexPath:(id)a4;
- (void)updateToolbarContent;
- (void)updateView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKTOCContentViewController

- (BKTOCContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKTOCContentViewController;
  v4 = [(BKTOCViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKTOCContentViewController *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)releaseViews
{
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setDelegate:0];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setDataSource:0];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setDragDelegate:0];
  v3 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(CGFloat *)((char *)&self->super._verticalCenteringInsets.right + 4) = 0.0;

  [(BKTOCContentViewController *)self setRecenteredIndexPath:0];
  v4.receiver = self;
  v4.super_class = (Class)BKTOCContentViewController;
  [(BKTOCViewController *)&v4 releaseViews];
}

- (void)dealloc
{
  [(BKTOCContentViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  [(BKTOCViewController *)&v3 dealloc];
}

- (id)dateFormatter
{
  objc_super v3 = (id *)((char *)&self->_tableView + 4);
  if (!*(UITableView **)((char *)&self->_tableView + 4))
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    id v5 = *v3;
    id *v3 = v4;

    [*v3 setDateStyle:4];
    [*v3 setTimeStyle:0];
    [*v3 setDoesRelativeDateFormatting:1];
  }
  id v6 = (id *)((char *)&self->_dateFormatter + 4);
  if (!*(NSDateFormatter **)((char *)&self->_dateFormatter + 4))
  {
    id v7 = objc_alloc_init((Class)NSDateFormatter);
    id v8 = *v6;
    *id v6 = v7;

    [*v6 setDateStyle:2];
    [*v6 setTimeStyle:0];
    [*v6 setDoesRelativeDateFormatting:1];
  }
  if ([(BKTOCViewController *)self usesPopoverStyle])
  {
    v9 = [(BKTOCContentViewController *)self traitCollection];
    v10 = [v9 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory) {
      objc_super v3 = v6;
    }
  }
  id v12 = *v3;

  return v12;
}

- (id)scrollView
{
  return *(id *)((char *)&self->super._verticalCenteringInsets.right + 4);
}

- (int64_t)tableViewSeparatorStyle
{
  if (![(BKTOCViewController *)self usesPopoverStyle]) {
    return 1;
  }
  int64_t result = [(BKTOCViewController *)self tocContentType];
  if (result) {
    return 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)BKTOCContentViewController;
  [(BKContentViewController *)&v36 viewDidLoad];
  objc_super v3 = [(BKTOCContentViewController *)self view];
  [v3 bounds];
  id v8 = [objc_alloc((Class)UITableView) initWithFrame:0 style:v4, v5, v6, v7];
  v9 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(void *)((char *)&self->super._verticalCenteringInsets.right + 4) = v8;

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setClipsToBounds:0];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setDelegate:self];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setDataSource:self];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setSeparatorStyle:[self tableViewSeparatorStyle]];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setCellLayoutMarginsFollowReadableWidth:0];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setDragDelegate:self];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setAllowsMultipleSelectionDuringEditing:1];
  [(BKTOCViewController *)self centeringInsets];
  double v11 = v10;
  [(BKTOCViewController *)self centeringInsets];
  double v13 = v12;
  v14 = [(BKTOCContentViewController *)self view];
  [v14 safeAreaInsets];
  double v16 = v13 + v15;

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setContentInset:v11, 0.0, v16, 0.0];
  [(BKTOCViewController *)self centeringInsets];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setContentOffset:0.0 -v17];
  [v3 addSubview:*(void *)((char *)&self->super._verticalCenteringInsets.right + 4)];
  v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) safeAreaInsets];
  CGFloat v28 = v22 + v27;
  CGFloat v31 = v24 - (v29 + v30);
  v37.size.height = v26 - (v27 + v32);
  v37.origin.x = v20 + v29;
  v37.origin.y = v28;
  v37.size.width = v31;
  v33 = +[BEWebViewFactory viewConfiguredForWebTOC:](BEWebViewFactory, "viewConfiguredForWebTOC:", 0.0, 0.0, CGRectGetWidth(v37), 52.0);
  [(BKTOCContentViewController *)self setSharedWebView:v33];

  id v34 = objc_alloc_init((Class)NSMutableDictionary);
  [(BKTOCContentViewController *)self setRequestToIndexPath:v34];

  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  [(BKTOCContentViewController *)self setCachedRowContents:v35];

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) registerClass:objc_opt_class() forCellReuseIdentifier:@"tocCell + webView"];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) registerClass:objc_opt_class() forCellReuseIdentifier:@"tocCell"];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) registerClass:objc_opt_class() forCellReuseIdentifier:@"bookmarkCell"];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) registerClass:objc_opt_class() forCellReuseIdentifier:@"noteCell"];
  [(BKTOCContentViewController *)self _updateColors];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  [(BKTOCContentViewController *)self _updateColors];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) reloadData];

  [(BKTOCContentViewController *)self _notifyDelegateContentDidChange];
}

- (void)setSharedWebView:(id)a3
{
  double v4 = (BKTOCWebViewCellLoadQueue *)a3;
  double v5 = *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4);
  if (v5) {
    [v5 removeFromSuperview];
  }
  double v6 = *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4);
  *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4) = v4;
  double v7 = v4;

  id v8 = +[UIColor clearColor];
  [*(id *)((char *)&self->_requestQueue + 4) setBackgroundColor:v8];

  v9 = +[UIColor clearColor];
  double v10 = [*(id *)((char *)&self->_requestQueue + 4) scrollView];
  [v10 setBackgroundColor:v9];

  [*(id *)((char *)&self->_requestQueue + 4) setOpaque:0];
  [*(id *)((char *)&self->_requestQueue + 4) setAutoresizingMask:0];
  [*(id *)((char *)&self->_requestQueue + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)((char *)&self->_requestQueue + 4) setUserInteractionEnabled:0];
  double v11 = [(BKTOCContentViewController *)self view];
  [v11 addSubview:*(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4)];

  double v12 = [(BKTOCContentViewController *)self view];
  [v12 sendSubviewToBack:*(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4)];

  [*(id *)((char *)&self->_requestQueue + 4) frame];
  [*(id *)((char *)&self->_requestQueue + 4) setFrame:-CGRectGetWidth(v16) v16.origin.y v16.size.width v16.size.height];
  uint64_t v13 = *(uint64_t *)((char *)&self->_requestQueue + 4);
  id v14 = [(BKTOCContentViewController *)self requestQueue];
  [v14 setWebView:v13];
}

- (void)_updateColors
{
  id v13 = [(BKTOCContentViewController *)self themePage];
  objc_super v3 = +[UIColor clearColor];
  double v4 = [(BKTOCContentViewController *)self viewIfLoaded];
  [v4 setBackgroundColor:v3];

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setBackgroundColor:v3];
  double v5 = [v13 tableViewSeparatorColor];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setSeparatorColor:v5];

  double v6 = [v13 primaryTextColor];
  double v7 = [*(id *)((char *)&self->_sharedWebView + 4) titleLabel];
  [v7 setTextColor:v6];

  id v8 = [v13 secondaryTextColor];
  v9 = [*(id *)((char *)&self->_sharedWebView + 4) descriptionLabel];
  [v9 setTextColor:v8];

  double v10 = [v13 primaryTextColor];
  double v11 = [(BKTOCContentViewController *)self view];
  [v11 setTintColor:v10];

  double v12 = [v13 secondaryTextColor];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setTintColor:v12];
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKTOCContentViewController;
  [(BKTOCViewController *)&v4 setTheme:a3];
  [(BKTOCContentViewController *)self _updateColors];
  [(BKTOCContentViewController *)self _dumpCachedWebContentAndReload];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) reloadData];
  [(BKTOCContentViewController *)self _notifyDelegateContentDidChange];
}

- (BKTOCWebViewCellLoadQueue)requestQueue
{
  objc_super v3 = *(AEMinimalTemplate **)((char *)&self->_template + 4);
  if (!v3)
  {
    objc_super v4 = (AEMinimalTemplate *)objc_opt_new();
    double v5 = *(AEMinimalTemplate **)((char *)&self->_template + 4);
    *(AEMinimalTemplate **)((char *)&self->_template + 4) = v4;

    double v6 = [(BKTOCContentViewController *)self imageCache];
    [*(id *)((char *)&self->_template + 4) setImageCache:v6];

    objc_super v3 = *(AEMinimalTemplate **)((char *)&self->_template + 4);
  }

  return (BKTOCWebViewCellLoadQueue *)v3;
}

- (AEMinimalTemplate)template
{
  objc_super v3 = *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4);
  if (!v3)
  {
    objc_super v4 = AEBundle();
    double v5 = [v4 URLForResource:@"toc_web_cell.html" withExtension:@"tmpl"];

    id v10 = 0;
    double v6 = [[AEMinimalTemplate alloc] initWithURL:v5 error:&v10];
    id v7 = v10;
    id v8 = *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4);
    *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4) = (BKTOCImageCache2 *)v6;

    objc_super v3 = *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4);
  }

  return (AEMinimalTemplate *)v3;
}

- (BKTOCImageCache2)imageCache
{
  objc_super v3 = *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4);
  if (!v3)
  {
    objc_super v4 = (NSMutableDictionary *)objc_opt_new();
    double v5 = *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4);
    *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4) = v4;

    objc_super v3 = *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4);
  }

  return (BKTOCImageCache2 *)v3;
}

- (id)_bkTableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(BKContentViewController *)self book];
  id v8 = [v7 sampleContent];
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9) {
    goto LABEL_6;
  }
  id v10 = [(BKTOCContentViewController *)self fetchedResultsController];
  double v11 = [v10 objectAtIndexPath:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v12 = v11;
  if ([v12 annotationIsBookmark])
  {

LABEL_5:
LABEL_6:
    id v13 = &__NSArray0__struct;
    goto LABEL_7;
  }
  double v15 = +[AEAnnotationDragItemProvider itemProviderWithAnnotation:v12 propertyProvider:self];
  id v16 = [objc_alloc((Class)NSItemProvider) initWithObject:v15];
  id v17 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v16];

  if (!v17) {
    goto LABEL_6;
  }
  id v18 = v17;
  id v13 = +[NSArray arrayWithObjects:&v18 count:1];

LABEL_7:

  return v13;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return [(BKTOCContentViewController *)self _bkTableView:a3 itemsForBeginningDragSession:a4 atIndexPath:a5];
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[BKTOCContentViewController _bkTableView:itemsForBeginningDragSession:atIndexPath:](self, "_bkTableView:itemsForBeginningDragSession:atIndexPath:", a3, a4, a5, a6.x, a6.y);
}

- (void)_updateContentInsets
{
  objc_super v3 = [(BKContentViewController *)self layoutDelegate];

  if (v3)
  {
    objc_super v4 = [(BKContentViewController *)self layoutDelegate];
    [v4 edgeInsetsForContentViewController:self];
    -[BKContentViewController setContentInsets:](self, "setContentInsets:");

    id v5 = [(BKContentViewController *)self layoutDelegate];
    [v5 separatorInsetsForContentViewController:self];
    -[BKContentViewController setSeparatorInsets:](self, "setSeparatorInsets:");
  }
}

- (void)updateView
{
  if (![(BKTOCContentViewController *)self isViewLoaded]
    || ![(BKTOCContentViewController *)self isVisible])
  {
    return;
  }
  [(BKTOCContentViewController *)self _updateContentInsets];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) contentInset];
  [(BKContentViewController *)self contentInsets];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setContentInset:];
  objc_super v3 = [(BKTOCContentViewController *)self view];
  [v3 bounds];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setFrame:];

  [(BKContentViewController *)self separatorInsets];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setSeparatorInset:];
  objc_super v4 = [(BKTOCContentViewController *)self view];
  id v47 = [v4 viewWithTag:9999];

  [v47 removeFromSuperview];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setAlpha:1.0];
  if ([(BKTOCViewController *)self tocContentType])
  {
    id v5 = [(BKTOCContentViewController *)self fetchedResultsController];
    id v6 = [v5 fetchedObjects];
    id v7 = [v6 count];

    if (!v7)
    {
      [*(id *)((char *)&self->_sharedWebView + 4) removeFromSuperview];
      id v8 = objc_alloc_init(BKTOCBookmarksDescription);
      unsigned __int8 v9 = +[UIColor clearColor];
      [(BKTOCBookmarksDescription *)v8 setBackgroundColor:v9];

      id v10 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
      uint64_t v11 = [v10 fontDescriptorWithDesign:UIFontDescriptorSystemDesignSerif];
      id v12 = +[UIFont fontWithDescriptor:v11 size:0.0];
      id v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
      id v14 = [(BKTOCBookmarksDescription *)v8 titleLabel];
      [v14 setFont:v12];

      double v15 = [(BKTOCBookmarksDescription *)v8 descriptionLabel];
      [v15 setFont:v13];

      v45 = (void *)v11;
      v46 = v10;
      if ((char *)[(BKTOCViewController *)self tocContentType] == (char *)&dword_0 + 1)
      {
        id v16 = AEBundle();
        id v17 = [v16 localizedStringForKey:@"No Bookmarks" value:&stru_1DF0D8 table:0];

        id v18 = AEBundle();
        double v19 = v18;
        CFStringRef v20 = @"Tap a page you want to bookmark, tap the menu icon, then tap the bookmark button.";
      }
      else
      {
        if ((char *)[(BKTOCViewController *)self tocContentType] != (char *)&dword_0 + 2)
        {
          double v22 = 0;
          id v17 = 0;
          goto LABEL_12;
        }
        double v21 = AEBundle();
        id v17 = [v21 localizedStringForKey:@"No Highlights or Notes" value:&stru_1DF0D8 table:0];

        id v18 = AEBundle();
        double v19 = v18;
        CFStringRef v20 = @"Tap and hold on a word. You can extend the selection to include an entire passage. Then tap “Highlight” or “Note”. You can add notes to highlighted passages later by tapping the highlight and then “Note”.";
      }
      double v22 = [v18 localizedStringForKey:v20 value:&stru_1DF0D8 table:0];

LABEL_12:
      double v23 = [(BKTOCBookmarksDescription *)v8 titleLabel];
      [v23 setText:v17];

      double v24 = [(BKTOCBookmarksDescription *)v8 descriptionLabel];
      [v24 setText:v22];

      double v25 = [(BKTOCContentViewController *)self themePage];
      double v26 = [v25 secondaryTextColor];

      double v27 = [(BKTOCBookmarksDescription *)v8 titleLabel];
      [v27 setTextColor:v26];

      CGFloat v28 = [(BKTOCBookmarksDescription *)v8 descriptionLabel];
      [v28 setTextColor:v26];

      double v29 = [(BKTOCContentViewController *)self view];
      [v29 bounds];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      [(BKContentViewController *)self contentInsets];
      -[BKTOCBookmarksDescription setFrame:](v8, "setFrame:", v31 + v41, v33 + v38, v35 - (v41 + v39), v37 - (v38 + v40));

      [(BKTOCBookmarksDescription *)v8 setTag:9999];
      v42 = *(WKWebView **)((char *)&self->_sharedWebView + 4);
      *(WKWebView **)((char *)&self->_sharedWebView + 4) = (WKWebView *)v8;
      v43 = v8;

      v44 = [(BKTOCContentViewController *)self view];
      [v44 addSubview:v43];

      [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setAlpha:0.0];
    }
  }
  [(BKTOCContentViewController *)self showRowForCurrentLocation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKTOCContentViewController;
  [(BKTOCViewController *)&v5 viewWillAppear:a3];
  [(BKTOCContentViewController *)self updateView];
  [(BKTOCContentViewController *)self reload];
  if (([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing] & 1) == 0)
  {
    objc_super v4 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathForSelectedRow];
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) deselectRowAtIndexPath:v4 animated:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKTOCContentViewController;
  [(BKTOCViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
  objc_super v5 = *(void **)(&self->_isProgrammaticScrolling + 4);
  *(void *)(&self->_isProgrammaticScrolling + 4) = v4;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!BYTE4(self->_recenteredIndexPath))
  {
    id v4 = *(id *)(&self->_isProgrammaticScrolling + 4);
    if (v4)
    {
      id v7 = v5;
      id v4 = [v4 timeIntervalSinceNow];
      id v5 = v7;
      if (v6 <= 0.0) {
        BYTE4(self->_readyForUserScrollDate) = 1;
      }
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BKTOCContentViewController;
  id v7 = a4;
  -[BKTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  [(BKTOCContentViewController *)self _dumpCachedWebContentAndReload];
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7CB08;
  v9[3] = &unk_1DAA18;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7CBD4;
  v8[3] = &unk_1DAA18;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)_dumpCachedWebContentAndReload
{
  objc_super v3 = [(BKTOCContentViewController *)self requestToIndexPath];
  [v3 removeAllObjects];

  id v4 = [(BKTOCContentViewController *)self cachedRowContents];
  [v4 removeAllObjects];

  id v5 = [(BKTOCContentViewController *)self imageCache];
  [v5 removeAllObjects];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKTOCContentViewController;
  [(BKTOCContentViewController *)&v7 viewIsAppearing:a3];
  id v4 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  if (v4)
  {
    [v4 contentInset];
    double v6 = v5;
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) contentInset];
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setScrollIndicatorInsets:v6, 0.0];
    id v4 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  }
  [v4 flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  [(BKTOCContentViewController *)self updateView];
  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  [(BKTOCContentViewController *)&v3 viewDidLayoutSubviews];
}

- (int64_t)pageNumberForCurrentLocation
{
  objc_super v3 = [(BKDirectoryContent *)self directoryDelegate];
  id v4 = [v3 tocViewControllerCurrentLocation:self];

  if (v4)
  {
    double v5 = [(BKDirectoryContent *)self directoryDelegate];
    int64_t v6 = (int64_t)[v5 directoryContent:self pageNumberForLocation:v4];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)indexPathOfLastRow
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v3 = [*(id *)((char *)&self->super._paginationController + 4) sections];
  id v4 = [v3 reverseObjectEnumerator];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    objc_super v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 objects];
        id v12 = (char *)[v11 count];

        if (v12)
        {
          id v13 = [*(id *)((char *)&self->super._paginationController + 4) sections];
          uint64_t v14 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v12 - 1, [v13 indexOfObject:v10]);

          objc_super v7 = (void *)v14;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)tocIndexPathForRowNearestPageNumber:(int64_t)a3
{
  char v5 = 0;
  objc_super v3 = [(BKTOCContentViewController *)self _indexPathForRowNearestPageNumber:a3 pageNumberForObjectSelector:"tocViewController:pageNumberForChapter:" isExactPageMatch:&v5];

  return v3;
}

- (id)annotationIndexPathForRowNearestPageNumber:(int64_t)a3 isExactPageMatch:(BOOL *)a4
{
  return [(BKTOCContentViewController *)self _indexPathForRowNearestPageNumber:a3 pageNumberForObjectSelector:"tocViewController:pageNumberForAnnotation:" isExactPageMatch:a4];
}

- (id)_indexPathForRowNearestPageNumber:(int64_t)a3 pageNumberForObjectSelector:(SEL)a4 isExactPageMatch:(BOOL *)a5
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [*(id *)((char *)&self->super._paginationController + 4) sections];
  id v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v7;
        uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        unsigned __int8 v9 = [v8 objects];
        id v10 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v32;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
            double v15 = [(BKDirectoryContent *)self directoryDelegate];
            id v16 = [v15 a4:self v14];

            if ((uint64_t)v16 >= a3)
            {
              long long v17 = [v8 objects];
              long long v18 = (char *)[v17 indexOfObject:v14];

              if (v16 == (id)a3)
              {
                *a5 = 1;
                long long v19 = [*(id *)((char *)&self->super._paginationController + 4) sections];
                id v20 = [v19 indexOfObject:v8];
                double v21 = v18;
                goto LABEL_22;
              }
              if ((uint64_t)v16 > a3) {
                break;
              }
            }
            if (v11 == (id)++v13)
            {
              id v11 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }
          if (v18) {
            double v22 = v18 - 1;
          }
          else {
            double v22 = 0;
          }
          long long v19 = [*(id *)((char *)&self->super._paginationController + 4) sections];
          id v20 = [v19 indexOfObject:v8];
          double v21 = v22;
LABEL_22:
          double v23 = +[NSIndexPath indexPathForRow:v21 inSection:v20];

          if (!v23) {
            goto LABEL_23;
          }

          goto LABEL_27;
        }
LABEL_16:

LABEL_23:
        uint64_t v7 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  double v23 = [(BKTOCContentViewController *)self indexPathOfLastRow];
LABEL_27:

  return v23;
}

- (BOOL)showRowForCurrentLocation
{
  char v11 = 0;
  objc_super v3 = [*(id *)((char *)&self->super._paginationController + 4) fetchedObjects];
  if (![v3 count])
  {

LABEL_8:
    id v7 = 0;
    goto LABEL_9;
  }
  id v4 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfSections];

  if ((uint64_t)v4 < 1) {
    goto LABEL_8;
  }
  int64_t v5 = [(BKTOCContentViewController *)self pageNumberForCurrentLocation];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  int64_t v6 = v5;
  if ([(BKTOCViewController *)self tocContentType])
  {
    id v7 = [(BKTOCContentViewController *)self annotationIndexPathForRowNearestPageNumber:v6 isExactPageMatch:&v11];
    if (!v11)
    {
LABEL_9:
      uint64_t v8 = 0;
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = [(BKTOCContentViewController *)self tocIndexPathForRowNearestPageNumber:v6];
    char v11 = 1;
  }
  id v7 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  if (([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing] & 1) == 0)
  {
    id v10 = BKTOCCVCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Highlighting row at %@", buf, 0xCu);
    }

    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) selectRowAtIndexPath:v7 animated:1 scrollPosition:0];
  }
  uint64_t v8 = v7;
LABEL_10:
  if (!BYTE4(self->_readyForUserScrollDate))
  {
    BYTE4(self->_recenteredIndexPath) = 1;
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) scrollToRowAtIndexPath:v7 atScrollPosition:2 animated:0];
    BYTE4(self->_recenteredIndexPath) = 0;
  }
LABEL_12:

  return v7 != 0;
}

- (void)removeHighlightFromCurrentLocation
{
  objc_super v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 138412290;
    long long v12 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) cellForRowAtIndexPath:v9, v12];
        char v11 = BKTOCCVCLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = v9;
          _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "Removing highlight from cell at:%@", buf, 0xCu);
        }

        [v10 setSelected:0 animated:1];
      }
      id v6 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }
}

- (BKActivityIndicatorOverlayView)activityIndicatorOverlayView
{
  objc_super v3 = *(void **)((char *)&self->_cellLoadingOperationCount + 4);
  if (!v3)
  {
    id v4 = [BKActivityIndicatorOverlayView alloc];
    long long v5 = [(BKTOCContentViewController *)self theme];
    id v6 = [v5 contentTextColor];
    uint64_t v7 = [v6 colorWithAlphaComponent:0.7];
    uint64_t v8 = [(BKTOCContentViewController *)self theme];
    uint64_t v9 = [v8 backgroundColorForTraitEnvironment:self];
    id v10 = [(BKActivityIndicatorOverlayView *)v4 initWithBackgroundColor:v7 foregroundColor:v9];
    char v11 = *(void **)((char *)&self->_cellLoadingOperationCount + 4);
    *(int64_t *)((char *)&self->_cellLoadingOperationCount + 4) = (int64_t)v10;

    objc_super v3 = *(void **)((char *)&self->_cellLoadingOperationCount + 4);
  }

  return (BKActivityIndicatorOverlayView *)v3;
}

- (void)setCellLoadingOperationCount:(int64_t)a3
{
  *(void *)((char *)&self->_preferredFontSize + 4) = a3 & ~(a3 >> 63);
  if (a3 < 1) {
    [(BKTOCContentViewController *)self _hideActivityIndicator];
  }
  else {
    [(BKTOCContentViewController *)self _showActivityIndicator];
  }
}

- (void)_showActivityIndicator
{
  id v4 = [(BKTOCContentViewController *)self activityIndicatorOverlayView];
  objc_super v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) superview];
  [v4 showIndicatorCenteredInView:v3 animated:1 animationDelay:0.0];
}

- (void)_hideActivityIndicator
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 250000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7D850;
  v3[3] = &unk_1DC8D8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)fontFamily
{
  dispatch_time_t v2 = +[UIFont systemFontOfSize:17.0];
  objc_super v3 = [v2 familyName];

  return v3;
}

- (id)pageTitleForChapter:(id)a3
{
  id v4 = a3;
  if (v4 && (BYTE4(self->super._fetchedResultsController) & 2) != 0)
  {
    id v6 = [(BKDirectoryContent *)self directoryDelegate];
    long long v5 = [v6 tocViewController:self pageTitleForChapter:v4];
  }
  else
  {
    long long v5 = 0;
  }

  return v5;
}

- (id)pageTitleForAnnotation:(id)a3
{
  if ((BYTE4(self->super._fetchedResultsController) & 4) != 0)
  {
    id v5 = a3;
    id v6 = [(BKDirectoryContent *)self directoryDelegate];
    objc_super v3 = [v6 tocViewController:self pageTitleForAnnotation:v5];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (double)calculateFontSize
{
  [(BKTOCContentViewController *)self preferredFontSize];
  if (v3 == 0.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKTOCContentViewController;
    [(BKTOCViewController *)&v5 calculateFontSize];
  }
  else
  {
    [(BKTOCContentViewController *)self preferredFontSize];
  }
  return result;
}

- (id)fontForChapter:(id)a3
{
  id v4 = a3;
  [(BKTOCViewController *)self establishChapterFonts];
  objc_super v5 = [v4 indentationLevel];

  id v6 = [v5 integerValue];
  if (v6) {
    [(BKTOCViewController *)self chapterSubLevelFont];
  }
  else {
  uint64_t v7 = [(BKTOCViewController *)self chapterTopLevelFont];
  }

  return v7;
}

- (BOOL)p_willUseWebViewForCellWithChapter:(id)a3
{
  double v3 = [a3 htmlName];
  if ([v3 length])
  {
    id v4 = +[NSRegularExpression regularExpressionWithPattern:@"<[^/s]" options:0 error:0];
    BOOL v5 = [v4 numberOfMatchesInString:v3 options:0 range:[v3 length]];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_configureTOCCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v61 = a3;
  id v6 = a4;
  uint64_t v7 = [(BKTOCContentViewController *)self fetchedResultsController];
  uint64_t v8 = [v7 fetchedObjects];

  if (v8)
  {
    uint64_t v9 = [(BKTOCContentViewController *)self fetchedResultsController];
    id v10 = [v9 objectAtIndexPath:v6];
  }
  else
  {
    id v10 = 0;
  }
  if ([v10 isExcludedFromSample])
  {
    char v11 = 0;
  }
  else
  {
    char v11 = [(BKTOCContentViewController *)self pageTitleForChapter:v10];
  }
  [(BKContentViewController *)self contentInsets];
  double v13 = v12;
  [(BKContentViewController *)self contentInsets];
  [v61 setContentInsets:0.0, v13, 0.0];
  long long v14 = [v10 name];
  id v15 = [v14 length];
  if (v15)
  {
    long long v16 = [v10 name];
  }
  else
  {
    long long v16 = @" ";
  }
  long long v17 = [v61 textLabel];
  [v17 setText:v16];

  if (v15) {
  uint64_t v18 = [(BKTOCContentViewController *)self fontForChapter:v10];
  }
  long long v19 = [v61 textLabel];
  [v19 setFont:v18];

  id v20 = [v61 textLabel];
  [v20 setLineBreakMode:0];

  if ([v10 isExcludedFromSample]) {
    double v21 = 0.5;
  }
  else {
    double v21 = 1.0;
  }
  double v22 = [v61 textLabel];
  [v22 setAlpha:v21];

  [v61 setBkaxIsExcludedFromSample:[v10 isExcludedFromSample]];
  double v23 = [v61 textLabel];
  [v23 setNumberOfLines:0];

  double v24 = [v10 indentationLevel];
  [v61 setIndentationLevel:[v24 integerValue]];

  [v61 setIndentationWidth:16.0];
  double v25 = (char *)[v61 effectiveUserInterfaceLayoutDirection];
  [(BKContentViewController *)self separatorInsets];
  double v27 = v26;
  double v28 = (double)(uint64_t)[v61 indentationLevel];
  [v61 indentationWidth];
  double v30 = v27 + v28 * v29;
  [(BKContentViewController *)self separatorInsets];
  if (v25 == (unsigned char *)&dword_0 + 1) {
    double v32 = v30;
  }
  else {
    double v32 = v31;
  }
  if (v25 == (unsigned char *)&dword_0 + 1) {
    double v33 = v31;
  }
  else {
    double v33 = v30;
  }
  [v61 setSeparatorInset:0.0, v33, 0.0, v32];
  if ([(BKTOCContentViewController *)self p_willUseWebViewForCellWithChapter:v10])
  {
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) bounds];
    double Width = CGRectGetWidth(v63);
    [(BKContentViewController *)self contentInsets];
    double v37 = Width - (v35 + v36);
    long long v38 = [v10 indentationLevel];
    uint64_t v39 = (int)[v38 intValue];
    double v40 = [v61 textLabel];
    [v40 font];
    v60 = v8;
    v42 = id v41 = v6;
    +[BKTOCTableViewCell maxSpanForTextWithIndentation:v39 font:v42 width:v37];

    v43 = [(BKContentViewController *)self book];
    v44 = [v43 tocPageHref];
    v45 = [v43 urlForHref:v44];

    v46 = BEURLHandleriBooksImgUrlFromiBooksURL();

    id v47 = [v10 htmlName];
    v48 = [v61 textLabel];
    v49 = [v48 font];
    v50 = [v49 fontName];
    [(BKTOCContentViewController *)self calculateFontSize];
    [v61 displayHTMLWithContents:v47 fontFamily:v50 fontSize:v46];

    id v6 = v41;
    uint64_t v8 = v60;
  }
  v51 = [v61 pageLabel];
  v52 = v51;
  if (v11)
  {
    [v51 setText:v11];
    v53 = [(BKTOCViewController *)self pageLabelFont];
    [v52 setFont:v53];
  }
  [v52 setHidden:v11 == 0];
  v54 = [(BKTOCContentViewController *)self themePage];
  [v61 configureSelectedBackgroundView];
  v55 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) backgroundColor];
  [v61 setBackgroundColor:v55];

  v56 = [v54 primaryTextColor];
  v57 = [v61 textLabel];
  [v57 setTextColor:v56];

  v58 = [v54 tocPageNumberTextColor];
  v59 = [v61 pageLabel];
  [v59 setTextColor:v58];
}

- (void)_configureWebTOCCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v85 = a3;
  id v6 = a4;
  uint64_t v7 = [(BKTOCContentViewController *)self imageCache];
  [v85 setImageCache:v7];

  uint64_t v8 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) backgroundColor];
  [v85 setBackgroundColor:v8];

  uint64_t v9 = [(BKTOCContentViewController *)self fetchedResultsController];
  uint64_t v10 = [v9 fetchedObjects];

  v82 = (void *)v10;
  if (v10)
  {
    char v11 = [(BKTOCContentViewController *)self fetchedResultsController];
    double v12 = [v11 objectAtIndexPath:v6];
  }
  else
  {
    double v12 = 0;
  }
  if ([v12 isExcludedFromSample])
  {
    double v13 = 0;
  }
  else
  {
    double v13 = [(BKTOCContentViewController *)self pageTitleForChapter:v12];
  }
  v83 = v6;
  [(BKContentViewController *)self separatorInsets];
  double v15 = v14;
  double v16 = (double)(uint64_t)[v85 indentationLevel];
  [v85 indentationWidth];
  double v18 = v15 + v16 * v17;
  [(BKContentViewController *)self separatorInsets];
  double v20 = v19;
  double v21 = (char *)[v85 effectiveUserInterfaceLayoutDirection];
  if (v21 == (unsigned char *)&dword_0 + 1) {
    double v22 = v18;
  }
  else {
    double v22 = v20;
  }
  if (v21 == (unsigned char *)&dword_0 + 1) {
    double v23 = v20;
  }
  else {
    double v23 = v18;
  }
  [v85 setSeparatorInset:0.0, v23, 0.0, v22];
  double v24 = [v85 pageLabel];
  id v25 = [v13 length];
  if (v25)
  {
    [v24 setText:v13];
    double v26 = [(BKTOCViewController *)self pageLabelFont];
    [v24 setFont:v26];
  }
  v80 = v13;
  [v24 setHidden:v25 == 0];
  double v27 = [(BKTOCContentViewController *)self themePage];
  double v28 = [v27 tocPageNumberTextColor];
  v79 = v24;
  [v24 setTextColor:v28];

  v78 = v27;
  v84 = [v27 primaryTextColor];
  double v29 = [(BKTOCContentViewController *)self fontForChapter:v12];
  double v30 = [v85 textLabel];
  [v30 setFont:v29];

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) safeAreaInsets];
  CGFloat v40 = v34 + v39;
  CGFloat v43 = v36 - (v41 + v42);
  v87.size.double height = v38 - (v39 + v44);
  v87.origin.x = v32 + v41;
  v87.origin.y = v40;
  v87.size.double width = v43;
  double Width = CGRectGetWidth(v87);
  [(BKContentViewController *)self contentInsets];
  double v48 = Width - (v46 + v47);
  v49 = [v12 indentationLevel];
  uint64_t v50 = (int)[v49 intValue];
  v51 = [v85 textLabel];
  v52 = [v51 font];
  +[BKTOCTableViewCell maxSpanForTextWithIndentation:v50 font:v52 width:v48];

  v53 = [v85 pageLabel];
  [v53 sizeToFit];

  v54 = [v85 pageLabel];
  [v54 frame];
  CGRectGetWidth(v88);

  v55 = [(BKContentViewController *)self book];
  v56 = [v55 tocPageHref];
  v77 = v55;
  v57 = [v55 urlForHref:v56];

  v58 = BEURLHandleriBooksImgUrlFromiBooksURL();

  v59 = +[UIColor clearColor];
  v60 = [v85 contentView];
  [v60 setBackgroundColor:v59];

  v81 = v12;
  uint64_t v61 = [v12 htmlName];
  v62 = (void *)v61;
  if (v61) {
    CFStringRef v63 = (const __CFString *)v61;
  }
  else {
    CFStringRef v63 = &stru_1DF0D8;
  }
  v64 = [(BKTOCContentViewController *)self template];
  v65 = [v85 textLabel];
  v66 = [v65 font];
  v67 = [v66 fontName];
  [(BKTOCContentViewController *)self calculateFontSize];
  v68 = +[BKTOCWebViewCellLoadRequest loadRequestWithContents:template:fontFamily:fontSize:maxSpan:textColor:selectedColor:backgroundColor:baseURL:forObject:](BKTOCWebViewCellLoadRequest, "loadRequestWithContents:template:fontFamily:fontSize:maxSpan:textColor:selectedColor:backgroundColor:baseURL:forObject:", v63, v64, v67, v84, v84, v59, v58, self);

  v69 = [(BKTOCContentViewController *)self cachedRowContents];
  v70 = [v69 objectForKeyedSubscript:v83];

  if (!v70
    || ([(BKTOCContentViewController *)self imageCache],
        v71 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v72 = [v71 entryForRequest:v68],
        v71,
        (v72 & 1) == 0))
  {
    v73 = [(BKTOCContentViewController *)self requestToIndexPath];
    v74 = [v68 cacheKey];
    [v73 setObject:v83 forKeyedSubscript:v74];

    v75 = [(BKTOCContentViewController *)self requestQueue];
    [v75 enqueueRequest:v68];
  }
  v76 = [v70 cacheKey];
  [v85 setCacheKey:v76];
}

- (id)highlightedTextLabelFont
{
  if ([(BKTOCViewController *)self usesPopoverStyle]) {
    +[BKTOCRangeAnnotationTableCell highlightedTextSizeInPopover];
  }
  else {
    +[BKTOCRangeAnnotationTableCell pageNumberAndHighlightedTextFontSize];
  }
  double v4 = v3;
  BOOL v5 = [(BKTOCContentViewController *)self fontFamily];
  id v6 = +[UIFont fontWithName:v5 size:v4];

  return v6;
}

- (void)_configureRangeAnnotationCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKTOCContentViewController *)self fetchedResultsController];
  uint64_t v9 = [v8 fetchedObjects];
  id v10 = [v9 count];

  if ([v7 row] >= v10)
  {
    double v17 = BKTOCCVCLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_137E84(v7, (uint64_t)v10, v17);
    }
  }
  else
  {
    char v11 = [(BKTOCContentViewController *)self fetchedResultsController];
    double v12 = [v11 objectAtIndexPath:v7];

    [(BKTOCContentViewController *)self _configureAnnotationCell:v6 forAnnotation:v12 forRowAtIndexPath:v7];
    double v13 = [v12 annotationNote];
    double v14 = [v6 noteLabel];
    [v14 setText:v13];

    if ([(BKTOCViewController *)self usesPopoverStyle])
    {
      id v15 = [(id)objc_opt_class() noteFontForPopover];
      double v16 = [v6 noteLabel];
      [v16 setFont:v15];
    }
    else
    {
      id v15 = objc_alloc_init((Class)AEAnnotationTheme);
      double v16 = [v15 noteTextFontInTable];
      double v18 = [v6 noteLabel];
      [v18 setFont:v16];
    }
    double v19 = [v6 noteLabel];
    [v19 setLineBreakMode:4];

    double v20 = [v6 highlightedTextLabel];
    [v20 setAnnotation:v12];
    double v21 = [(BKTOCContentViewController *)self highlightedTextLabelFont];
    [v20 setFont:v21];

    [v20 setNeedsLayout];
    double v22 = [(BKTOCContentViewController *)self themePage];
    double v23 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) backgroundColor];
    [v6 configureSelectedBackgroundView];
    [v6 setBackgroundColor:v23];
    double v24 = [v22 primaryTextColor];
    id v25 = [v6 textLabel];
    [v25 setTextColor:v24];

    double v26 = [v6 noteLabel];
    [v26 setTextColor:v24];

    [v20 setTextColor:v24];
    [v20 setHighlightedTextColor:v24];
    [v20 setBackgroundColor:v23];
    [v20 setShouldInvertContent:[v22 shouldInvertContent]];
    [v20 setAnnotationBlendMode:[v22 annotationBlendMode]];
    [v20 setHighlightedAnnotationBlendMode:[v22 highlightedAnnotationBlendMode]];
    [v20 setPageTheme:[v22 annotationPageTheme]];
    if ([(BKTOCViewController *)self usesPopoverStyle]) {
      [v22 secondaryTextColor];
    }
    else {
    double v27 = [v22 tocPageNumberTextColor];
    }
    double v28 = [v6 pageLabel];
    [v28 setTextColor:v27];

    double v29 = [v6 dateLabel];
    [v29 setTextColor:v27];
  }
}

- (void)_configurePointAnnotationCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  [(BKContentViewController *)self contentInsets];
  double v8 = v7;
  [(BKContentViewController *)self contentInsets];
  [v27 setContentInsets:0.0, v8, 0.0];
  uint64_t v9 = [(BKTOCContentViewController *)self fetchedResultsController];
  id v10 = [v9 objectAtIndexPath:v6];

  [(BKTOCContentViewController *)self _configureAnnotationCell:v27 forAnnotation:v10 forRowAtIndexPath:v6];
  if ((BYTE4(self->super._fetchedResultsController) & 8) != 0)
  {
    double v12 = [(BKDirectoryContent *)self directoryDelegate];
    char v11 = [v12 tocViewController:self chapterTitleForAnnotation:v10];
  }
  else
  {
    char v11 = 0;
  }
  if (![v11 length])
  {
    double v13 = AEBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"No title" value:&stru_1DF0D8 table:0];

    char v11 = (void *)v14;
  }
  if ([(BKTOCViewController *)self usesPopoverStyle])
  {
    id v15 = [(id)objc_opt_class() chapterFontForPopover];
    double v16 = [v27 noteLabel];
    [v16 bkSetText:v11 font:v15 lineBreakMode:0];

    double v17 = [v27 noteLabel];
    [v17 setNumberOfLines:2];
  }
  else
  {
    [(id)objc_opt_class() titleFontSize];
    id v15 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    double v18 = [v27 noteLabel];
    [v18 bkSetText:v11 font:v15 lineBreakMode:5];

    double v19 = [v27 noteLabel];
    [v19 setNumberOfLines:1];

    double v17 = [v27 noteLabel];
    [v17 setLineBreakMode:5];
  }

  double v20 = [(BKTOCContentViewController *)self themePage];
  [v27 configureSelectedBackgroundView];
  double v21 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) backgroundColor];
  [v27 setBackgroundColor:v21];

  double v22 = [v20 primaryTextColor];
  double v23 = [v27 noteLabel];
  [v23 setTextColor:v22];

  double v24 = [v20 secondaryTextColor];
  id v25 = [v27 pageLabel];
  [v25 setTextColor:v24];

  double v26 = [v27 dateLabel];
  [v26 setTextColor:v24];
}

- (void)_configureAnnotationCell:(id)a3 forAnnotation:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v14 = [(BKTOCContentViewController *)self pageTitleForAnnotation:v7];
  uint64_t v9 = [(BKTOCContentViewController *)self dateFormatter];
  id v10 = [v7 annotationCreationDate];

  char v11 = [v9 stringFromDate:v10];

  [(BKContentViewController *)self contentInsets];
  double v13 = v12;
  [(BKContentViewController *)self contentInsets];
  [v8 configureWithPageString:v14 dateString:v11 insets:0.0 v13:0.0];
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    [v7 setVertical:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BKTOCContentViewController *)self _configurePointAnnotationCell:v7 forRowAtIndexPath:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(BKTOCContentViewController *)self _configureRangeAnnotationCell:v7 forRowAtIndexPath:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(BKTOCContentViewController *)self _configureWebTOCCell:v7 forRowAtIndexPath:v6];
        }
        else {
          [(BKTOCContentViewController *)self _configureTOCCell:v7 forRowAtIndexPath:v6];
        }
      }
    }
    [v7 setNeedsLayout];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ((char *)[(BKTOCViewController *)self tocContentType] == (char *)&dword_0 + 2)
  {
    id v6 = [(BKTOCContentViewController *)self deleteSwipeAction:v5];
    v13[0] = v6;
    id v7 = [(BKTOCContentViewController *)self shareSwipeAction:v5];
    v13[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v13 count:2];
  }
  else
  {
    if ((char *)[(BKTOCViewController *)self tocContentType] != (char *)&dword_0 + 1)
    {
      id v10 = BKTOCCVCLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_137F1C(v10);
      }

      id v8 = 0;
      goto LABEL_10;
    }
    id v6 = [(BKTOCContentViewController *)self deleteSwipeAction:v5];
    double v12 = v6;
    id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  }

  if (v8)
  {
    uint64_t v9 = +[UISwipeActionsConfiguration configurationWithActions:v8];
    [v9 setPerformsFirstActionWithFullSwipe:0];
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)shareSwipeAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7F2A4;
  v10[3] = &unk_1DC900;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v11 = v5;
  id v6 = +[UIContextualAction contextualActionWithStyle:0 title:0 handler:v10];
  id v7 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  [v6 setImage:v7];

  id v8 = +[UIColor systemBlueColor];
  [v6 setBackgroundColor:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

- (id)deleteSwipeAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7F460;
  v9[3] = &unk_1DC900;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  id v6 = +[UIContextualAction contextualActionWithStyle:1 title:0 handler:v9];
  id v7 = +[UIImage systemImageNamed:@"trash.fill"];
  [v6 setImage:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3 = [(BKTOCContentViewController *)self fetchedResultsController];
  id v4 = [v3 sections];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(BKTOCContentViewController *)self fetchedResultsController];
  id v6 = [v5 sections];
  id v7 = [v6 objectAtIndex:a4];

  id v8 = [v7 numberOfObjects];
  return (int64_t)v8;
}

- (id)reuseIdentifier
{
  int64_t v3 = [(BKTOCViewController *)self tocContentType];

  return [(BKTOCContentViewController *)self reuseIdentifierForCellType:v3];
}

- (id)reuseIdentifierForCellType:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1DC9C0[a3];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(BKTOCViewController *)self tocContentType];
  uint64_t v9 = v8 == 2;
  if (!v8)
  {
    id v10 = [(BKTOCContentViewController *)self fetchedResultsController];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 fetchedObjects];

      if (v12)
      {
        objc_opt_class();
        double v13 = [(BKTOCContentViewController *)self fetchedResultsController];
        id v14 = [v13 objectAtIndexPath:v6];
        id v12 = BUDynamicCast();
      }
    }
    else
    {
      id v12 = 0;
    }
    if ([(BKTOCContentViewController *)self p_willUseWebViewForCellWithChapter:v12])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 2;
    }
  }
  id v15 = [(BKTOCContentViewController *)self reuseIdentifierForCellType:v9];
  double v16 = [v7 dequeueReusableCellWithIdentifier:v15];

  [v16 setUsesPopoverStyle:[self usesPopoverStyle]];
  [(BKTOCContentViewController *)self configureCell:v16 atIndexPath:v6];

  return v16;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  int64_t v4 = [(BKTOCViewController *)self tocContentType];
  double result = 67.0;
  if (!v4) {
    return 52.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BKTOCViewController *)self usesPopoverStyle]) {
    double v8 = 0.0;
  }
  else {
    double v8 = 52.0;
  }
  double height = CGSizeZero.height;
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(BKContentViewController *)self contentInsets];
  CGFloat v19 = v13 + v18;
  CGFloat v22 = v15 - (v20 + v21);
  v128.size.double height = v17 - (v18 + v23);
  v128.origin.x = v11 + v20;
  v128.origin.double y = v19;
  v128.size.double width = v22;
  double Width = CGRectGetWidth(v128);
  id v25 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) readableContentGuide];
  [v25 layoutFrame];
  double v26 = CGRectGetWidth(v129);

  if (Width >= v26) {
    double Width = v26;
  }
  int64_t v27 = [(BKTOCViewController *)self tocContentType];
  if (v27 == 1)
  {
    double v8 = 73.0;
    if (![(BKTOCViewController *)self usesPopoverStyle]) {
      goto LABEL_37;
    }
    if (Width <= 0.0) {
      goto LABEL_37;
    }
    id v34 = [v7 row];
    double v35 = [(BKTOCContentViewController *)self fetchedResultsController];
    double v36 = [v35 fetchedObjects];
    id v37 = [v36 count];

    if (v34 >= v37) {
      goto LABEL_37;
    }
    double v38 = [(BKTOCContentViewController *)self fetchedResultsController];
    double v33 = [v38 objectAtIndexPath:v7];

    double v39 = [(BKDirectoryContent *)self directoryDelegate];
    CGFloat v40 = [v39 tocViewController:self chapterTitleForAnnotation:v33];

    double v41 = [(BKTOCContentViewController *)self dateFormatter];
    double v42 = [v33 annotationCreationDate];
    CGFloat v43 = [v41 stringFromDate:v42];

    double v44 = [(BKTOCContentViewController *)self pageTitleForAnnotation:v33];
    +[BKTOCPointAnnotationTableCell cellHeightForCellWidth:v40 chapterString:v43 dateString:v44 pageString:[(BKViewController *)self layoutDirection] layoutDirection:Width];
    double v8 = v45;
  }
  else if (v27)
  {
    if ([v6 isEditing]) {
      double v46 = 38.0;
    }
    else {
      double v46 = 0.0;
    }
    id v47 = [v7 row];
    double v48 = [(BKTOCContentViewController *)self fetchedResultsController];
    v49 = [v48 fetchedObjects];
    id v50 = [v49 count];

    if (v47 >= v50)
    {
      double v8 = 67.0;
      goto LABEL_37;
    }
    double v125 = Width - v46;
    double y = CGRectZero.origin.y;
    v51 = [(BKTOCContentViewController *)self fetchedResultsController];
    double v33 = [v51 objectAtIndexPath:v7];

    id v52 = objc_alloc_init((Class)AEAnnotationTheme);
    v53 = [(BKTOCContentViewController *)self pageTitleForAnnotation:v33];
    v54 = [(BKTOCContentViewController *)self dateFormatter];
    v55 = [v33 annotationCreationDate];
    v56 = [v54 stringFromDate:v55];

    if ([(BKTOCViewController *)self usesPopoverStyle])
    {
      id v57 = [(BKTOCContentViewController *)self highlightedTextLabelFont];
      +[BKTOCRangeAnnotationTableCell cellHeightInPopoverForBounds:highlightFont:annotation:dateString:pageString:layoutDirection:](BKTOCRangeAnnotationTableCell, "cellHeightInPopoverForBounds:highlightFont:annotation:dateString:pageString:layoutDirection:", v57, v33, v56, v53, [(BKViewController *)self layoutDirection], CGRectZero.origin.x, y, v125, 67.0);
      double height = v58;
    }
    else
    {
      +[BKTOCRangeAnnotationTableCell pageNumberAndHighlightedTextFontSize];
      double v63 = v62;
      v64 = [(BKTOCContentViewController *)self fontFamily];
      v65 = +[UIFont fontWithName:v64 size:v63];

      if (!v65)
      {
        v65 = +[UIFont systemFontOfSize:v63];
      }
      id v57 = v65;
      +[BKTOCTableViewCell pageLabelFrameForString:font:bounds:layoutDirection:](BKTOCRangeAnnotationTableCell, "pageLabelFrameForString:font:bounds:layoutDirection:", v53, v57, [(BKViewController *)self layoutDirection], CGRectZero.origin.x, y, v125, 67.0);
      CGFloat v114 = v66;
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      CGFloat v72 = v71;
      +[BKTOCRangeAnnotationTableCell highlightedTextFrameForAnnotation:font:bounds:pageLabelFrame:layoutDirection:](BKTOCRangeAnnotationTableCell, "highlightedTextFrameForAnnotation:font:bounds:pageLabelFrame:layoutDirection:", v33, v57, [(BKViewController *)self layoutDirection], CGRectZero.origin.x, y, v125, 67.0, v66, v67, v69, v71);
      double v74 = v73;
      double v76 = v75;
      double v78 = v77;
      double v80 = v79;
      id v124 = v52;
      uint64_t v81 = [v52 noteTextFontInTable];
      v82 = [v33 annotationNote];
      CGFloat v121 = v76;
      CGFloat v122 = v74;
      CGFloat r2 = v80;
      CGFloat v120 = v78;
      v123 = (void *)v81;
      +[BKTOCRangeAnnotationTableCell noteTextFrameForString:font:bounds:highlightedTextFrame:pageLabelFrame:](BKTOCRangeAnnotationTableCell, "noteTextFrameForString:font:bounds:highlightedTextFrame:pageLabelFrame:", v82, v81, CGRectZero.origin.x, y, v125, 67.0, v74, v76, v78, v80, *(void *)&v114, *(void *)&v68, *(void *)&v70, *(void *)&v72);
      CGFloat v84 = v83;
      CGFloat v86 = v85;
      CGFloat v88 = v87;
      CGFloat v90 = v89;

      +[BKTOCAnnotationTableCell dateFontSize];
      double v92 = v91;
      v93 = [(BKTOCContentViewController *)self fontFamily];
      v94 = +[UIFont fontWithName:v93 size:v92];

      if (!v94)
      {
        v94 = +[UIFont systemFontOfSize:v92];
      }
      v130.origin.x = v84;
      v130.origin.double y = v86;
      v130.size.double width = v88;
      v130.size.double height = v90;
      double MaxY = CGRectGetMaxY(v130);
      v131.origin.x = v114;
      v131.origin.double y = v68;
      v131.size.double width = v70;
      v131.size.double height = v72;
      double v96 = CGRectGetMaxY(v131);
      if (MaxY >= v96) {
        double v96 = MaxY;
      }
      CGFloat v116 = v86;
      CGFloat v115 = v88;
      +[BKTOCRangeAnnotationTableCell dateLabelFrameForString:font:bounds:minY:layoutDirection:](BKTOCRangeAnnotationTableCell, "dateLabelFrameForString:font:bounds:minY:layoutDirection:", v56, v94, [(BKViewController *)self layoutDirection], CGRectZero.origin.x, y, v125, 67.0, v96);
      CGFloat v117 = v98;
      CGFloat v118 = v97;
      CGFloat v100 = v99;
      v132.origin.double y = y;
      CGFloat v102 = v101;
      v132.origin.x = CGRectZero.origin.x;
      v132.size.double width = v125;
      v132.size.double height = 67.0;
      v138.origin.x = v114;
      v138.origin.double y = v68;
      v138.size.double width = v70;
      v138.size.double height = v72;
      CGRect v133 = CGRectUnion(v132, v138);
      v139.origin.x = v122;
      v139.size.double width = v120;
      v139.origin.double y = v121;
      v139.size.double height = r2;
      CGRect v134 = CGRectUnion(v133, v139);
      v140.origin.x = v84;
      v140.size.double height = v90;
      v140.size.double width = v115;
      v140.origin.double y = v116;
      CGRect v135 = CGRectUnion(v134, v140);
      v141.size.double height = v117;
      v141.origin.x = v118;
      v141.origin.double y = v100;
      v141.size.double width = v102;
      CGRect v136 = CGRectUnion(v135, v141);
      double v103 = v136.size.height;
      +[BKTOCRangeAnnotationTableCell bottomPadding];
      double height = v103 + v104;

      id v52 = v124;
    }

    double v8 = 67.0;
  }
  else
  {
    if (Width <= 0.0) {
      goto LABEL_37;
    }
    id v28 = [v7 row];
    double v29 = [(BKTOCContentViewController *)self fetchedResultsController];
    double v30 = [v29 fetchedObjects];
    id v31 = [v30 count];

    if (v28 >= v31)
    {
      double v33 = 0;
    }
    else
    {
      double v32 = [(BKTOCContentViewController *)self fetchedResultsController];
      double v33 = [v32 objectAtIndexPath:v7];
    }
    if ([(BKTOCContentViewController *)self p_willUseWebViewForCellWithChapter:v33])
    {
      v59 = [(BKTOCContentViewController *)self cachedRowContents];
      v60 = [v59 objectForKeyedSubscript:v7];
      [v60 height];
      double v8 = v61;

      if (v8 < 52.0) {
        double v8 = 52.0;
      }
    }
    else
    {
      v127 = [(BKTOCContentViewController *)self fontForChapter:v33];
      v105 = [(BKTOCViewController *)self pageLabelFont];
      v106 = [(BKTOCContentViewController *)self pageTitleForChapter:v33];
      +[BKTOCTableViewCell pageLabelFrameForString:font:bounds:layoutDirection:](BKTOCRangeAnnotationTableCell, "pageLabelFrameForString:font:bounds:layoutDirection:", v106, v105, [(BKViewController *)self layoutDirection], CGRectZero.origin.x, CGRectZero.origin.y, Width, v8);
      double v107 = CGRectGetWidth(v137);
      v108 = [v33 name];
      v109 = [v33 indentationLevel];
      +[BKTOCTableViewCell cellHeightForCellWidth:pageLabelWidth:text:indentationLevel:indentationWidth:font:usesPopoverStyle:](BKTOCTableViewCell, "cellHeightForCellWidth:pageLabelWidth:text:indentationLevel:indentationWidth:font:usesPopoverStyle:", v108, [v109 integerValue], v127, -[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"), Width, v107, 16.0);
      double height = v110;
    }
  }

LABEL_37:
  double v111 = ceil(height);
  if (v8 >= v111) {
    double v112 = v8;
  }
  else {
    double v112 = v111;
  }

  return v112;
}

- (void)tableView:(id)a3 performPrimaryActionForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = BKTOCCVCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v18 = 134217984;
    id v19 = [v5 row];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Performing primary action for row %ld", (uint8_t *)&v18, 0xCu);
  }

  id v7 = [(BKTOCContentViewController *)self fetchedResultsController];
  double v8 = [v7 objectAtIndexPath:v5];

  int64_t v9 = [(BKTOCViewController *)self tocContentType];
  if (v9 == 2)
  {
    id v16 = v8;
    id v10 = [v16 location];
    double v15 = [v16 annotationUuid];

    [(BKDirectoryContent *)self didSelectHighlightForLocation:v10 annotationUUID:v15];
    goto LABEL_11;
  }
  if (v9 == 1)
  {
    id v17 = v8;
    id v10 = [v17 location];
    double v15 = [v17 annotationUuid];

    [(BKDirectoryContent *)self didSelectBookmarkForLocation:v10 annotationUUID:v15];
    goto LABEL_11;
  }
  if (!v9 && (BYTE4(self->super._fetchedResultsController) & 1) != 0)
  {
    id v10 = v8;
    double v11 = [v10 href];
    double v12 = [(BKContentViewController *)self book];
    double v13 = [v12 tocPageHref];

    if (v11 == v13)
    {
LABEL_12:

      goto LABEL_13;
    }
    double v14 = [(BKTOCViewController *)self eventEngagement];
    [v14 sendReaderEventNewSectionViaToC];

    double v15 = [(BKDirectoryContent *)self directoryDelegate];
    [v15 tocViewController:self didSelectChapter:v10];
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [(BKTOCContentViewController *)self notifyBookSharingClientSelectionChanged];
  if ([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing])
  {
    [(BKTOCContentViewController *)self updateToolbarContent];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  [(BKTOCContentViewController *)self notifyBookSharingClientSelectionChanged];
  if ([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing])
  {
    [(BKTOCContentViewController *)self updateToolbarContent];
  }
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return [(BKTOCViewController *)self tocContentType] != 0;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = BKTOCCVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_137F60();
  }

  unsigned __int8 v9 = [v7 isEditing];
  if ((v9 & 1) == 0)
  {
    [(BKTOCContentViewController *)self removeHighlightFromCurrentLocation];
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setEditing:1 animated:1];
  }
  id v10 = [(BKDirectoryContent *)self directoryDelegate];
  [v10 tocViewControllerDidChangeEditing:1];

  [(BKTOCContentViewController *)self installEditModeToolbar];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEditing])
  {
    unsigned __int8 v9 = 0;
  }
  else
  {
    id v10 = [v7 cellForRowAtIndexPath:v8];
    if (v10)
    {
      id v28 = v10;
      double v11 = AEBundle();
      double v12 = [v11 localizedStringForKey:@"Select" value:&stru_1DF0D8 table:0];
      double v13 = +[UIImage systemImageNamed:@"checkmark.circle"];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_80890;
      v40[3] = &unk_1DC928;
      v40[4] = self;
      id v14 = v8;
      id v41 = v14;
      double v26 = +[UIAction actionWithTitle:v12 image:v13 identifier:@"context.menu.select" handler:v40];

      double v15 = AEBundle();
      id v16 = [v15 localizedStringForKey:@"Share" value:&stru_1DF0D8 table:0];
      id v17 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_8089C;
      v38[3] = &unk_1DC928;
      v38[4] = self;
      id v18 = v14;
      id v39 = v18;
      int64_t v27 = +[UIAction actionWithTitle:v16 image:v17 identifier:@"context.menu.share" handler:v38];

      id v19 = AEBundle();
      double v20 = [v19 localizedStringForKey:@"Delete" value:&stru_1DF0D8 table:0];
      double v21 = +[UIImage systemImageNamed:@"trash"];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_808A8;
      v36[3] = &unk_1DC928;
      v36[4] = self;
      id v37 = v18;
      CGFloat v22 = +[UIAction actionWithTitle:v20 image:v21 identifier:@"context.menu.delete" handler:v36];

      [v22 setAttributes:[v22 attributes] | 2];
      unsigned __int8 v9 = 0;
      if ((char *)[(BKTOCViewController *)self tocContentType] == (char *)&dword_0 + 1)
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_808B4;
        v33[3] = &unk_1DC950;
        id v34 = v22;
        id v35 = v26;
        unsigned __int8 v9 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v33];
      }
      if ((char *)[(BKTOCViewController *)self tocContentType] == (char *)&dword_0 + 2)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_809C4;
        v29[3] = &unk_1DC978;
        double v23 = v27;
        id v30 = v27;
        id v31 = v22;
        id v32 = v26;
        uint64_t v24 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v29];

        unsigned __int8 v9 = (void *)v24;
      }
      else
      {
        double v23 = v27;
      }

      id v10 = v28;
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (void)beginSelectionStartingWithIndexPath:(id)a3
{
  id v4 = a3;
  [(BKTOCContentViewController *)self removeHighlightFromCurrentLocation];
  [(BKTOCContentViewController *)self beginEditingMode];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) selectRowAtIndexPath:v4 animated:1 scrollPosition:0];

  [(BKTOCContentViewController *)self updateToolbarContent];
}

- (id)bookmarksFetchedResultsController
{
  int64_t v3 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
  if (!v3)
  {
    id v4 = [(BKContentViewController *)self book];
    id v5 = [v4 annotationProvider];
    id v6 = [v5 uiManagedObjectContext];

    if (!v6)
    {
LABEL_13:

      int64_t v3 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
      goto LABEL_14;
    }
    id v7 = objc_alloc_init((Class)NSFetchRequest);
    if ((char *)[(BKTOCViewController *)self tocContentType] == (char *)&dword_0 + 1)
    {
      id v8 = [v4 assetID];
      uint64_t v9 = +[AEAnnotation pageBookmarksPredicate:v8];
    }
    else
    {
      if ((char *)[(BKTOCViewController *)self tocContentType] != (char *)&dword_0 + 2)
      {
LABEL_8:
        double v11 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v6];
        [v7 setEntity:v11];

        id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"annotationLocation" ascending:1 selector:"localizedStandardCompare:"];
        id v13 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"annotationCreationDate" ascending:1];
        id v14 = [objc_alloc((Class)NSArray) initWithObjects:v12, v13, 0];
        [v7 setSortDescriptors:v14];
        double v15 = (BKPaginationController *)[objc_alloc((Class)IMUbiquitousFetchedResultsController) initWithFetchRequest:v7 managedObjectContext:v6 sectionNameKeyPath:0 cacheName:0];
        id v16 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
        *(BKPaginationController **)((char *)&self->super._paginationController + 4) = v15;

        [*(id *)((char *)&self->super._paginationController + 4) setDelegate:self];
        id v17 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
        id v22 = 0;
        unsigned __int8 v18 = [v17 performFetch:&v22];
        id v19 = v22;
        if ((v18 & 1) == 0)
        {
          double v20 = BKTOCCVCLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            sub_1377EC(self, v19, v20);
          }
        }
        goto LABEL_13;
      }
      id v8 = [v4 assetID];
      uint64_t v9 = +[AEAnnotation highlightsPredicate:v8];
    }
    id v10 = (void *)v9;
    [v7 setPredicate:v9];

    goto LABEL_8;
  }
LABEL_14:

  return v3;
}

- (id)fetchedResultsController
{
  int64_t v3 = [(BKTOCViewController *)self tocContentType];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
    {
      id v4 = 0;
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)BKTOCContentViewController;
      id v4 = [(BKTOCViewController *)&v6 fetchedResultsController];
    }
  }
  else
  {
    id v4 = [(BKTOCContentViewController *)self bookmarksFetchedResultsController];
  }

  return v4;
}

- (int)assetSharingConnectionTypeForClient:(id)a3
{
  unint64_t v4 = [(BKTOCViewController *)self tocContentType];
  if (v4 < 2) {
    return 1;
  }
  if (v4 != 2) {
    return 0;
  }
  objc_super v6 = [(BKTOCContentViewController *)self fetchedResultsController];
  id v7 = [v6 fetchedObjects];
  id v8 = [v7 count];

  if (v8) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)beginAssetSharingConnectionWithClient:(id)a3
{
  unint64_t v4 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  id v5 = a3;
  [v4 setEditing:0 animated:0];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setAllowsMultipleSelectionDuringEditing:1];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setEditing:1 animated:1];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) beginUpdates];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) endUpdates];
  [(BKTOCContentViewController *)self setAssetSharingConnectionClient:v5];
}

- (void)endAssetSharingConnectionWithClient:(id)a3
{
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setEditing:0 animated:1];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setAllowsMultipleSelectionDuringEditing:0];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) beginUpdates];
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) endUpdates];

  [(BKTOCContentViewController *)self setAssetSharingConnectionClient:0];
}

- (void)assetSharingConnectionClient:(id)a3 performRequest:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 3:
      id v8 = v6;
      id v6 = [(BKTOCContentViewController *)self deleteSelected:v6];
      break;
    case 2:
      id v8 = v6;
      id v6 = [(BKTOCContentViewController *)self selectNone:v6];
      break;
    case 1:
      id v8 = v6;
      id v6 = [(BKTOCContentViewController *)self selectAll:v6];
      break;
    default:
      goto LABEL_8;
  }
  id v7 = v8;
LABEL_8:

  _objc_release_x1(v6, v7);
}

- (unint64_t)bookSharingRequestNumberOfSelectedAnnotations:(id)a3
{
  int64_t v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)bookSharingRequestClient:(id)a3 selectedAnnotationAtIndex:(unint64_t)a4
{
  id v6 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows:a3];
  id v7 = [v6 objectAtIndex:a4];
  id v8 = [*(id *)((char *)&self->super._paginationController + 4) objectAtIndexPath:v7];

  return v8;
}

- (unint64_t)bookSharingRequestNumberOfAnnotations:(id)a3
{
  int64_t v3 = [*(id *)((char *)&self->super._paginationController + 4) fetchedObjects:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)bookSharingRequestClient:(id)a3 annotationAtIndex:(unint64_t)a4
{
  id v5 = [*(id *)((char *)&self->super._paginationController + 4) fetchedObjects:a3];
  id v6 = [v5 objectAtIndex:a4];

  return v6;
}

- (void)selectAll:(id)a3
{
  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections", a3))
  {
    unint64_t v4 = 0;
    do
    {
      if ([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfRowsInSection:v4])
      {
        unint64_t v5 = 0;
        do
        {
          id v6 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
          id v7 = +[NSIndexPath indexPathForRow:v5 inSection:v4];
          [v6 selectRowAtIndexPath:v7 animated:1 scrollPosition:0];

          ++v5;
        }
        while (v5 < (unint64_t)[*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfRowsInSection:v4]);
      }
      ++v4;
    }
    while (v4 < (unint64_t)[*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfSections]);
  }

  [(BKTOCContentViewController *)self notifyBookSharingClientSelectionChanged];
}

- (void)selectNone:(id)a3
{
  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections", a3))
  {
    unint64_t v4 = 0;
    do
    {
      if ([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfRowsInSection:v4])
      {
        unint64_t v5 = 0;
        do
        {
          id v6 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
          id v7 = +[NSIndexPath indexPathForRow:v5 inSection:v4];
          [v6 deselectRowAtIndexPath:v7 animated:1];

          ++v5;
        }
        while (v5 < (unint64_t)[*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfRowsInSection:v4]);
      }
      ++v4;
    }
    while (v4 < (unint64_t)[*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) numberOfSections]);
  }

  [(BKTOCContentViewController *)self notifyBookSharingClientSelectionChanged];
}

- (void)notifyBookSharingClientSelectionChanged
{
  int64_t v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows];
  id v4 = [v3 count];

  id v5 = [(BKTOCContentViewController *)self assetSharingConnectionClient];
  [v5 assetSharingConnectionServer:self didChangeSelectedAnnotationsCount:v4];
}

- (void)controllerWillChangeContent:(id)a3
{
  if (!BYTE4(self->_macLargeTextDateFormatter)) {
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) beginUpdates:a3];
  }
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  if (a6 == 2)
  {
    id v13 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
    id v12 = +[NSIndexSet indexSetWithIndex:a5];
    [v13 deleteSections:v12 withRowAnimation:0];
  }
  else
  {
    if (a6 != 1) {
      goto LABEL_6;
    }
    double v11 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
    id v12 = +[NSIndexSet indexSetWithIndex:a5];
    [v11 insertSections:v12 withRowAnimation:0];
  }

  [(BKTOCContentViewController *)self _notifyDelegateContentDidChange];
LABEL_6:
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!BYTE4(self->_macLargeTextDateFormatter))
  {
    switch(a6)
    {
      case 1uLL:
        double v15 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        goto LABEL_6;
      case 2uLL:
        id v16 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        id v17 = +[NSArray arrayWithObject:v13];
        [v16 deleteRowsAtIndexPaths:v17 withRowAnimation:0];
        goto LABEL_7;
      case 3uLL:
        unsigned __int8 v18 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        id v19 = +[NSArray arrayWithObject:v13];
        [v18 deleteRowsAtIndexPaths:v19 withRowAnimation:0];

        double v15 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
LABEL_6:
        id v17 = +[NSArray arrayWithObject:v14];
        [v15 insertRowsAtIndexPaths:v17 withRowAnimation:0];
LABEL_7:

        [(BKTOCContentViewController *)self _notifyDelegateContentDidChange];
        break;
      case 4uLL:
        double v20 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) cellForRowAtIndexPath:v13];
        [(BKTOCContentViewController *)self configureCell:v20 atIndexPath:v13];

        break;
      default:
        break;
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  if (!BYTE4(self->_macLargeTextDateFormatter)) {
    [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) endUpdates:a3];
  }

  [(BKTOCContentViewController *)self updateView];
}

- (BOOL)isReusable
{
  return 0;
}

- (BOOL)isContentLoaded
{
  return 1;
}

- (BOOL)isContentLoadPending
{
  return 0;
}

- (void)setNeedsRestyle
{
  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  [(BKContentViewController *)&v3 setNeedsRestyle];
  [(BKTOCContentViewController *)self reload];
}

- (int64_t)ordinal
{
  return -101;
}

- (int64_t)totalPages
{
  return 1;
}

- (id)currentLocation
{
  dispatch_time_t v2 = [[BKLocation alloc] initWithOrdinal:[(BKTOCContentViewController *)self ordinal]];

  return v2;
}

- (void)_notifyDelegateContentDidChange
{
  if ((BYTE4(self->super._fetchedResultsController) & 0x10) != 0)
  {
    id v3 = [(BKDirectoryContent *)self directoryDelegate];
    [v3 tocViewControllerContentDidChange:self];
  }
}

- (void)reload
{
  v13.receiver = self;
  v13.super_class = (Class)BKTOCContentViewController;
  [(BKTOCViewController *)&v13 reload];
  if ([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing])
  {
    id v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows];
  }
  else
  {
    id v3 = 0;
  }
  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) reloadData];
  [(BKTOCContentViewController *)self _notifyDelegateContentDidChange];
  if (v3 && [v3 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) selectRowAtIndexPath:*v9 animated:0 scrollPosition:0];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setBook:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  [(BKContentViewController *)&v3 setBook:a3];
}

- (id)bookTitle
{
  dispatch_time_t v2 = [(BKContentViewController *)self book];
  objc_super v3 = [v2 bookTitle];

  return v3;
}

- (id)author
{
  dispatch_time_t v2 = [(BKContentViewController *)self book];
  objc_super v3 = [v2 bookAuthor];

  return v3;
}

- (id)storeURL
{
  dispatch_time_t v2 = [(BKContentViewController *)self book];
  objc_super v3 = [v2 storeId];

  if ([v3 length])
  {
    id v4 = +[AEUserPublishing sharedInstance];
    id v5 = [v4 storeShortURLForStoreId:v3 dataSource:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  return [a3 physicalPageNumber];
}

- (void)contentBeganLoadingForRequest:(id)a3
{
  id v4 = (char *)[(BKTOCContentViewController *)self cellLoadingOperationCount] + 1;

  [(BKTOCContentViewController *)self setCellLoadingOperationCount:v4];
}

- (void)contentFinishedLoadingForRequest:(id)a3 preferredHeight:(double)a4 error:(id)a5
{
  id v8 = a3;
  [(BKTOCContentViewController *)self setCellLoadingOperationCount:(char *)[(BKTOCContentViewController *)self cellLoadingOperationCount] - 1];
  long long v9 = [(BKTOCContentViewController *)self requestToIndexPath];
  long long v10 = [v8 cacheKey];
  long long v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    long long v12 = [(BKTOCContentViewController *)self cachedRowContents];
    objc_super v13 = [v12 objectForKeyedSubscript:v11];

    if (!v13)
    {
      if (a5)
      {
        id v14 = [(BKTOCContentViewController *)self cachedRowContents];
        [v14 removeObjectForKey:v11];
      }
      else
      {
        double v15 = [v8 cacheKey];
        id v16 = +[BKTOCWebViewCellContent cellContentWithHeight:v15 cacheKey:a4];

        id v17 = [(BKTOCContentViewController *)self cachedRowContents];
        [v17 setObject:v16 forKeyedSubscript:v11];

        unsigned __int8 v18 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        double v20 = v11;
        id v19 = +[NSArray arrayWithObjects:&v20 count:1];
        [v18 reloadRowsAtIndexPaths:v19 withRowAnimation:100];
      }
    }
  }
}

- (id)p_selectedAnnotations
{
  objc_super v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows];
  id v4 = [(BKTOCContentViewController *)self p_annotationsForRowItems:v3];

  return v4;
}

- (id)p_annotationForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(BKTOCContentViewController *)self fetchedResultsController];
  id v6 = [v5 objectAtIndexPath:v4];

  objc_opt_class();
  uint64_t v7 = BUDynamicCast();

  return v7;
}

- (id)p_annotationsForRowItems:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[BKTOCContentViewController p_annotationForIndexPath:](self, "p_annotationForIndexPath:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)deleteAnnotationAtIndexPath:(id)a3
{
  id v5 = [(BKTOCContentViewController *)self p_annotationForIndexPath:a3];
  if (v5)
  {
    id v4 = [(BKContentViewController *)self book];
    [v4 deleteAnnotation:v5];
  }
}

- (void)deleteSelectedAnnotations
{
  objc_super v3 = [(BKTOCContentViewController *)self p_selectedAnnotations];
  id v4 = [(BKContentViewController *)self book];
  id v5 = [v4 annotationProvider];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 deleteAnnotation:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10) v12];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  long long v11 = [*(id *)((char *)&self->super._paginationController + 4) managedObjectContext];
  [v5 saveManagedObjectContext:v11];
}

- (void)shareSelectedAnnotationsFromSourceView:(id)a3
{
  id v6 = a3;
  id v4 = [(BKTOCContentViewController *)self p_selectedAnnotations];
  if ([v4 count])
  {
    id v5 = [(BKDirectoryContent *)self directoryDelegate];
    [v5 tocViewController:self shareAnnotations:v4 sourceView:v6];
  }
}

- (BOOL)shareItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(BKTOCContentViewController *)self p_annotationForIndexPath:v4];
  if (v5)
  {
    id v6 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) cellForRowAtIndexPath:v4];
    id v7 = [(BKDirectoryContent *)self directoryDelegate];
    long long v10 = v5;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v7 tocViewController:self shareAnnotations:v8 sourceView:v6];
  }
  return v5 != 0;
}

- (void)beginEditingIfNeeded
{
  if (([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing] & 1) == 0)
  {
    [(BKTOCContentViewController *)self beginEditingMode];
  }
}

- (void)endEditingIfNeeded
{
  if ([*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) isEditing])
  {
    [(BKTOCContentViewController *)self endEditingMode];
  }
}

- (void)beginEditingMode
{
  objc_super v3 = [(BKDirectoryContent *)self directoryDelegate];
  [v3 tocViewControllerDidChangeEditing:1];

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setEditing:1 animated:1];

  [(BKTOCContentViewController *)self installEditModeToolbar];
}

- (void)endEditingMode
{
  objc_super v3 = [(BKDirectoryContent *)self directoryDelegate];
  [v3 tocViewControllerDidChangeEditing:0];

  [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) setEditing:0 animated:1];
  [(BKTOCContentViewController *)self removeEditModeToolbar];

  [(BKTOCContentViewController *)self showRowForCurrentLocation];
}

- (void)installEditModeToolbar
{
  objc_super v3 = [(BKTOCContentViewController *)self editingToolbar];
  id v4 = [v3 superview];

  if (v4)
  {
    id v5 = BKTOCCVCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_137FD4(self, v5);
    }
  }
  else
  {
    id v6 = [(BKTOCContentViewController *)self view];
    id v7 = [(BKTOCContentViewController *)self editingToolbar];
    [v6 addSubview:v7];

    id v8 = [(BKTOCContentViewController *)self editingToolbar];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v29 = [(BKTOCContentViewController *)self editingToolbar];
    int64_t v27 = [v29 leadingAnchor];
    id v28 = [(BKTOCContentViewController *)self view];
    double v26 = [v28 leadingAnchor];
    id v25 = [v27 constraintEqualToAnchor:v26];
    v32[0] = v25;
    uint64_t v24 = [(BKTOCContentViewController *)self editingToolbar];
    double v23 = [v24 trailingAnchor];
    uint64_t v9 = [(BKTOCContentViewController *)self view];
    long long v10 = [v9 trailingAnchor];
    long long v11 = [v23 constraintEqualToAnchor:v10];
    v32[1] = v11;
    long long v12 = [(BKTOCContentViewController *)self editingToolbar];
    long long v13 = [v12 bottomAnchor];
    long long v14 = [(BKTOCContentViewController *)self view];
    long long v15 = [v14 bottomAnchor];
    long long v16 = [v13 constraintEqualToAnchor:v15];
    v32[2] = v16;
    id v17 = +[NSArray arrayWithObjects:v32 count:3];
    +[NSLayoutConstraint activateConstraints:v17];

    unsigned __int8 v18 = [(BKTOCContentViewController *)self view];
    [v18 setNeedsLayout];

    id v19 = [(BKTOCContentViewController *)self view];
    [v19 layoutIfNeeded];

    double v20 = BKTOCCVCLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      [(BKTOCContentViewController *)self additionalSafeAreaInsets];
      id v21 = NSStringFromUIEdgeInsets(v33);
      *(_DWORD *)buf = 138412290;
      id v31 = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Adjusting additionalSafeAreaInsets to account for _editingToolbar, before adjustments:%@", buf, 0xCu);
    }
    [*(id *)(&self->_userDidScroll + 4) frame];
    -[BKTOCContentViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v22, 0.0);
  }
}

- (void)removeEditModeToolbar
{
  objc_super v3 = BKTOCCVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_138080(v3);
  }

  id v4 = [(BKTOCContentViewController *)self editingToolbar];
  [v4 removeFromSuperview];

  -[BKTOCContentViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, 0.0, 0.0);
  id v5 = *(void **)(&self->_userDidScroll + 4);
  *(void *)(&self->_userDidScroll + 4) = 0;

  objc_storeWeak((id *)((char *)&self->_editingToolbar + 4), 0);
}

- (UIToolbar)editingToolbar
{
  objc_super v3 = *(void **)(&self->_userDidScroll + 4);
  if (!v3)
  {
    id v4 = objc_alloc((Class)UIToolbar);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v35 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    id v8 = AEBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"Share" value:&stru_1DF0D8 table:0];
    long long v10 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_82CB0;
    v37[3] = &unk_1DC9A0;
    v37[4] = self;
    uint64_t v11 = +[UIAction actionWithTitle:v9 image:v10 identifier:@"toolbar.share" handler:v37];

    id v34 = (void *)v11;
    id v12 = [objc_alloc((Class)UIBarButtonItem) initWithPrimaryAction:v11];
    long long v13 = AEBundle();
    long long v14 = [v13 localizedStringForKey:@"Delete" value:&stru_1DF0D8 table:0];
    long long v15 = +[UIImage systemImageNamed:@"trash"];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_82CB8;
    v36[3] = &unk_1DC9A0;
    v36[4] = self;
    long long v16 = +[UIAction actionWithTitle:v14 image:v15 identifier:@"toolbar.delete" handler:v36];

    [v16 setAttributes:[v16 attributes] | 2];
    id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 primaryAction:v16];
    unsigned __int8 v18 = +[UIBarButtonItem flexibleSpaceItem];
    id v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v19 setTextAlignment:1];
    double v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v19 setFont:v20];

    id v21 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows];
    double v22 = -[BKTOCContentViewController editToolbarFooterTextWithCount:](self, "editToolbarFooterTextWithCount:", [v21 count]);
    [v19 setText:v22];

    id v23 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v19];
    objc_storeWeak((id *)((char *)&self->_editingToolbar + 4), v23);
    uint64_t v24 = *(void *)((char *)&self->super._centeringInsets.right + 4);
    id v32 = v12;
    if (v24 == 2)
    {
      v38[0] = v12;
      v38[1] = v18;
      v38[2] = v23;
      v38[3] = v18;
      v38[4] = v17;
      double v26 = v38;
      uint64_t v27 = 5;
    }
    else
    {
      id v25 = 0;
      if (v24 != 1)
      {
LABEL_7:
        id v28 = v17;
        [v35 setItems:v25 animated:1 v32];
        double v29 = *(void **)(&self->_userDidScroll + 4);
        *(void *)(&self->_userDidScroll + 4) = v35;
        id v30 = v35;

        objc_super v3 = *(void **)(&self->_userDidScroll + 4);
        goto LABEL_8;
      }
      v39[0] = v18;
      v39[1] = v23;
      v39[2] = v18;
      v39[3] = v17;
      double v26 = v39;
      uint64_t v27 = 4;
    }
    id v25 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, v27, v12);
    goto LABEL_7;
  }
LABEL_8:

  return (UIToolbar *)v3;
}

- (void)updateToolbarContent
{
  [(BKTOCContentViewController *)self installEditModeToolbar];
  objc_super v3 = [*(id *)((char *)&self->super._verticalCenteringInsets.right + 4) indexPathsForSelectedRows];
  id v4 = [v3 count];

  id v5 = BKTOCCVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1380C4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_editingToolbar + 4));
  id v7 = [WeakRetained customView];

  id v8 = [(BKTOCContentViewController *)self editToolbarFooterTextWithCount:v4];
  [v7 setText:v8];

  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v7];
  id v10 = objc_alloc((Class)NSMutableArray);
  uint64_t v11 = [*(id *)(&self->_userDidScroll + 4) items];
  id v12 = [v10 initWithArray:v11];

  id v13 = objc_loadWeakRetained((id *)((char *)&self->_editingToolbar + 4));
  id v14 = [v12 indexOfObject:v13];

  [v12 replaceObjectAtIndex:v14 withObject:v9];
  objc_storeWeak((id *)((char *)&self->_editingToolbar + 4), v9);
  [*(id *)(&self->_userDidScroll + 4) setItems:v12];
}

- (id)editToolbarFooterTextWithCount:(unint64_t)a3
{
  uint64_t v4 = *(void *)((char *)&self->super._centeringInsets.right + 4);
  if (v4 == 2)
  {
    id v5 = AEBundle();
    id v6 = v5;
    CFStringRef v7 = @"%lu Highlight(s) Selected";
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    id v5 = AEBundle();
    id v6 = v5;
    CFStringRef v7 = @"%lu Bookmark(s) Selected";
LABEL_5:
    id v8 = [v5 localizedStringForKey:v7 value:&stru_1DF0D8 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, a3);
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  id v9 = @"Select";
LABEL_7:

  return v9;
}

- (void)deleteFromToolbar
{
  [(BKTOCContentViewController *)self deleteSelectedAnnotations];

  [(BKTOCContentViewController *)self endEditingMode];
}

- (void)shareFromToolbar
{
  [(BKTOCContentViewController *)self shareSelectedAnnotationsFromSourceView:*(void *)(&self->_userDidScroll + 4)];

  [(BKTOCContentViewController *)self endEditingMode];
}

- (NSIndexPath)recenteredIndexPath
{
  return *(NSIndexPath **)(&self->_changeIsUserDriven + 4);
}

- (void)setRecenteredIndexPath:(id)a3
{
}

- (AEAssetSharingConnectionClient)assetSharingConnectionClient
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->toolbarLabelItem + 4));

  return (AEAssetSharingConnectionClient *)WeakRetained;
}

- (void)setAssetSharingConnectionClient:(id)a3
{
}

- (double)preferredFontSize
{
  return *(double *)((char *)&self->_assetSharingConnectionClient + 4);
}

- (void)setPreferredFontSize:(double)a3
{
  *(double *)((char *)&self->_assetSharingConnectionClient + 4) = a3;
}

- (int64_t)cellLoadingOperationCount
{
  return *(void *)((char *)&self->_preferredFontSize + 4);
}

- (void)setActivityIndicatorOverlayView:(id)a3
{
}

- (NSMutableDictionary)cachedRowContents
{
  return *(NSMutableDictionary **)((char *)&self->_activityIndicatorOverlayView + 4);
}

- (void)setCachedRowContents:(id)a3
{
}

- (NSMutableDictionary)requestToIndexPath
{
  return *(NSMutableDictionary **)((char *)&self->_cachedRowContents + 4);
}

- (void)setRequestToIndexPath:(id)a3
{
}

- (void)setImageCache:(id)a3
{
}

- (void)setTemplate:(id)a3
{
}

- (void)setRequestQueue:(id)a3
{
}

- (WKWebView)sharedWebView
{
  return *(WKWebView **)((char *)&self->_requestQueue + 4);
}

- (BKTOCBookmarksDescription)descriptionView
{
  return *(BKTOCBookmarksDescription **)((char *)&self->_sharedWebView + 4);
}

- (void)setDescriptionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_sharedWebView + 4), 0);
  objc_storeStrong((id *)((char *)&self->_requestQueue + 4), 0);
  objc_storeStrong((id *)((char *)&self->_template + 4), 0);
  objc_storeStrong((id *)((char *)&self->_imageCache + 4), 0);
  objc_storeStrong((id *)((char *)&self->_requestToIndexPath + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cachedRowContents + 4), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorOverlayView + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cellLoadingOperationCount + 4), 0);
  objc_destroyWeak((id *)((char *)&self->toolbarLabelItem + 4));
  objc_destroyWeak((id *)((char *)&self->_editingToolbar + 4));
  objc_storeStrong((id *)(&self->_userDidScroll + 4), 0);
  objc_storeStrong((id *)(&self->_isProgrammaticScrolling + 4), 0);
  objc_storeStrong((id *)(&self->_changeIsUserDriven + 4), 0);
  objc_storeStrong((id *)((char *)&self->_dateFormatter + 4), 0);
  objc_storeStrong((id *)((char *)&self->_tableView + 4), 0);

  objc_storeStrong((id *)((char *)&self->super._verticalCenteringInsets.right + 4), 0);
}

@end