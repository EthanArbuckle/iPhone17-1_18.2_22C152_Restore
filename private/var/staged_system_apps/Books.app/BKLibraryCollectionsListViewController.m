@interface BKLibraryCollectionsListViewController
+ (id)deleteActionHandler;
+ (id)hideActionHandler;
- (BCManagedObjectIDMonitor)prefixCollectionsMonitor;
- (BKCollection)selectedCollection;
- (BKCollection)textEntryCollection;
- (BKLibraryBookshelfMetrics)bookshelfMetrics;
- (BKLibraryCollectionsListCell)textEntryCell;
- (BKLibraryCollectionsListMetrics)metrics;
- (BKLibraryCollectionsListViewController)init;
- (BKLibraryCollectionsListViewController)initWithSelectedBookIDs:(id)a3 knownAssetTypes:(id)a4 knownStoreAssetIDs:(id)a5 containsSeriesContainer:(BOOL)a6 showDivider:(BOOL)a7;
- (BKLibraryCollectionsListViewDelegate)delegate;
- (BKLibraryManagedObjectContext)managedObjectContext;
- (BOOL)_indexPathIsNewCollection:(id)a3;
- (BOOL)_indexPathIsPrefix:(id)a3;
- (BOOL)_indexPathIsUser:(id)a3;
- (BOOL)_isAddCollectionIndexPath:(id)a3;
- (BOOL)_viewFrameIncludesStatusBar;
- (BOOL)accessibilityPerformEscape;
- (BOOL)bkaxDidPerformEscape:(id)a3;
- (BOOL)bkaxIsButton:(id)a3;
- (BOOL)bkaxIsCustomCollectionCell:(id)a3;
- (BOOL)bkaxIsLastCollection:(id)a3;
- (BOOL)changeIsUserDriven;
- (BOOL)containsSeriesContainer;
- (BOOL)endEditingMeansTableReload;
- (BOOL)endTextEditingMeansEndEditMode;
- (BOOL)includeHiddenInPrefixCollections;
- (BOOL)isAddingToCollection;
- (BOOL)isSelectionEnabledForCollection:(id)a3;
- (BOOL)isTextEditing;
- (BOOL)showDivider;
- (BOOL)suppressEditControlsForNewCollection;
- (BOOL)supressLargeTitle;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)tableView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)wantsAddCollectionRow;
- (BUCoalescingCallBlock)coalescedTableViewReloadData;
- (CGRect)keyboardFrame;
- (NSArray)assetIDs;
- (NSArray)knownAssetTypes;
- (NSArray)prefixCollections;
- (NSFetchedResultsController)fetchedResultsController;
- (NSHashTable)knownStoreAssetIDs;
- (NSIndexPath)postKeyboardIndexPath;
- (NSIndexPath)textEntryIndexPath;
- (NSMutableArray)userCollections;
- (NSMutableDictionary)collectionAssetCounts;
- (NSMutableDictionary)iconCache;
- (UIBarButtonItem)navBarEditButtonItem;
- (UITableView)tableView;
- (UIView)headerSeparatorView;
- (UIView)prefixFooterView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_addCollectionIndexPath;
- (id)_collectionForIndexPath:(id)a3;
- (id)_iconColorForIndexPath:(id)a3 metrics:(id)a4;
- (id)_iconForIndexPath:(id)a3 metrics:(id)a4 pointSize:(double)a5;
- (id)_iconNameForCollectionID:(id)a3 metrics:(id)a4;
- (id)_indexPathForCollection:(id)a3;
- (id)_indexPathForCollectionID:(id)a3;
- (id)defaultCollectionName;
- (id)deleteSwipeAction:(id)a3;
- (id)hideSwipeAction:(id)a3;
- (id)p_currentPopoverPresentationController;
- (id)p_firstVisibleCollection;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_collectionIndexForIndexPath:(id)a3;
- (unint64_t)_numberOfNewCollectionButtonRows;
- (unint64_t)_numberOfPrefixRows;
- (unint64_t)_numberOfUserRows;
- (unint64_t)_rowForUserCollectionIndex:(unint64_t)a3;
- (unint64_t)p_assetCountForCollection:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addSelectedToIndexPath:(id)a3;
- (void)_addStoreItems:(id)a3 toCollection:(id)a4;
- (void)_analyticsSubmitBrowseCollectionScreenViewEventWithTracker:(id)a3;
- (void)_beginEditingUserCollectionAtIndexPath:(id)a3;
- (void)_concludeDeleteAtIndexPath:(id)a3;
- (void)_concludeHide:(BOOL)a3 atIndexPath:(id)a4;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4;
- (void)_setSelectionState:(BOOL)a3 cell:(id)a4 atIndexPath:(id)a5;
- (void)_updateBarButtonsAnimated:(BOOL)a3;
- (void)_updateInsets;
- (void)_updateMetricsIfNeeded;
- (void)addCollection:(id)a3;
- (void)animateEndTextEditCollections;
- (void)bkaxPerformHide:(id)a3;
- (void)bkaxPerformRename:(id)a3;
- (void)bkaxPerformShow:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)endTextEditAnimationComplete;
- (void)endTextEditing;
- (void)invalidatePrefixCollections;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)managedObjectContextDidSave:(id)a3;
- (void)p_updatePopoverFromMetricsIfNeeded:(id)a3;
- (void)p_updateTableViewFromMetrics:(id)a3;
- (void)releaseAllRecomputableMemory;
- (void)releaseViews;
- (void)resetNavigationBarButtons;
- (void)scrollToIndexPath:(id)a3;
- (void)scrollToIndexPath:(id)a3 animated:(BOOL)a4;
- (void)setAssetIDs:(id)a3;
- (void)setChangeIsUserDriven:(BOOL)a3;
- (void)setCoalescedTableViewReloadData:(id)a3;
- (void)setCollectionAssetCounts:(id)a3;
- (void)setContainsSeriesContainer:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4 reuseAddCollectionRow:(BOOL)a5 completion:(id)a6;
- (void)setEndEditingMeansTableReload:(BOOL)a3;
- (void)setEndTextEditingMeansEndEditMode:(BOOL)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setHeaderSeparatorView:(id)a3;
- (void)setIconCache:(id)a3;
- (void)setIncludeHiddenInPrefixCollections:(BOOL)a3;
- (void)setIsAddingToCollection:(BOOL)a3;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setKnownAssetTypes:(id)a3;
- (void)setKnownStoreAssetIDs:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNavBarEditButtonItem:(id)a3;
- (void)setPostKeyboardIndexPath:(id)a3;
- (void)setPrefixCollections:(id)a3;
- (void)setPrefixCollectionsMonitor:(id)a3;
- (void)setPrefixFooterView:(id)a3;
- (void)setSelectedCollection:(id)a3;
- (void)setShowDivider:(BOOL)a3;
- (void)setSuppressEditControlsForNewCollection:(BOOL)a3;
- (void)setSupressLargeTitle:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setTextEntryCell:(id)a3;
- (void)setTextEntryCollection:(id)a3;
- (void)setTextEntryIndexPath:(id)a3;
- (void)setUserCollections:(id)a3;
- (void)setWantsAddCollectionRow:(BOOL)a3;
- (void)setWantsAddCollectionRow:(BOOL)a3 indexPath:(id)a4 animated:(BOOL)a5;
- (void)startEditButtonPressed:(id)a3;
- (void)stopEditButtonPressed:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)tableView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)tableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)tableView:(id)a3 dropSessionDidExit:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidEndEditing:(id)a3;
- (void)toggleEditButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKLibraryCollectionsListViewController

- (BKLibraryCollectionsListViewController)initWithSelectedBookIDs:(id)a3 knownAssetTypes:(id)a4 knownStoreAssetIDs:(id)a5 containsSeriesContainer:(BOOL)a6 showDivider:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v38.receiver = self;
  v38.super_class = (Class)BKLibraryCollectionsListViewController;
  v15 = [(BKLibraryCollectionsListViewController *)&v38 init];
  if (v15)
  {
    v16 = [[BKLibraryBookshelfMetrics alloc] initWithObserver:v15];
    bookshelfMetrics = v15->_bookshelfMetrics;
    v15->_bookshelfMetrics = v16;

    v18 = (NSArray *)[v12 copy];
    assetIDs = v15->_assetIDs;
    v15->_assetIDs = v18;

    v20 = (NSArray *)[v13 copy];
    knownAssetTypes = v15->_knownAssetTypes;
    v15->_knownAssetTypes = v20;

    objc_storeStrong((id *)&v15->_knownStoreAssetIDs, a5);
    v15->_containsSeriesContainer = a6;
    v15->_showDivider = a7;
    if ([v12 count])
    {
      v15->_isAddingToCollection = 1;
    }
    else if (!v15->_isAddingToCollection)
    {
      v22 = +[NSBundle mainBundle];
      v23 = v22;
      CFStringRef v24 = @"Collections";
      goto LABEL_6;
    }
    v22 = +[NSBundle mainBundle];
    v23 = v22;
    CFStringRef v24 = @"Add to Collection";
LABEL_6:
    v25 = [v22 localizedStringForKey:v24 value:&stru_100A70340 table:0];
    [(BKLibraryCollectionsListViewController *)v15 setTitle:v25];

    objc_initWeak(&location, v15);
    id v26 = objc_alloc((Class)BUCoalescingCallBlock);
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_1001A7384;
    v35 = &unk_100A451B8;
    objc_copyWeak(&v36, &location);
    v27 = (BUCoalescingCallBlock *)[v26 initWithNotifyBlock:&v32 blockDescription:@"BKLibraryCollectionsListViewController"];
    coalescedTableViewReloadData = v15->_coalescedTableViewReloadData;
    v15->_coalescedTableViewReloadData = v27;

    -[BUCoalescingCallBlock setCoalescingDelay:](v15->_coalescedTableViewReloadData, "setCoalescingDelay:", 1.0, v32, v33, v34, v35);
    v29 = +[UITraitCollection bc_allAPITraits];
    id v30 = [(BKLibraryCollectionsListViewController *)v15 registerForTraitChanges:v29 withAction:"_traitCollectionDidChange:previousTraitCollection:"];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (BKLibraryCollectionsListViewController)init
{
  return [(BKLibraryCollectionsListViewController *)self initWithSelectedBookIDs:0 knownAssetTypes:0 knownStoreAssetIDs:0 containsSeriesContainer:0 showDivider:0];
}

- (void)releaseViews
{
  [(NSFetchedResultsController *)self->_fetchedResultsController setDelegate:0];
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  tableView = self->_tableView;
  self->_tableView = 0;

  prefixFooterView = self->_prefixFooterView;
  self->_prefixFooterView = 0;

  navBarEditButtonItem = self->_navBarEditButtonItem;
  self->_navBarEditButtonItem = 0;

  v7 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
  [v7 removeTextEntryField];

  [(BKLibraryCollectionsListViewController *)self setTextEntryCell:0];
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v8 releaseViews];
}

- (void)dealloc
{
  [(BKLibraryCollectionsListViewController *)self releaseViews];
  [(BKLibraryCollectionsListViewController *)self releaseAllRecomputableMemory];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v3 dealloc];
}

- (id)defaultCollectionName
{
  return 0;
}

- (void)_updateMetricsIfNeeded
{
  id v17 = [(BKLibraryCollectionsListViewController *)self viewIfLoaded];
  objc_super v3 = [(BKLibraryCollectionsListViewController *)self traitCollection];
  v4 = [v17 window];
  if (v17 && v3 && v4)
  {
    id v5 = objc_alloc((Class)TUIEnvironment);
    [v17 bounds];
    double v7 = v6;
    double v9 = v8;
    [v4 bounds];
    id v10 = [v5 initWithTraitCollection:v3 viewController:self viewSize:v7 windowSize:v9];
    v11 = [(BKLibraryCollectionsListViewController *)self bookshelfMetrics];
    unsigned int v12 = [v11 updateIfNeededWithEnvironment:v10 bookshelfLayoutMode:0 editMode:0 isPopover:[self _isInPopoverPresentation]];

    if (v12)
    {
      [v17 setNeedsLayout];
      id v13 = [(BKLibraryCollectionsListViewController *)self bookshelfMetrics];
      id v14 = [v13 computedMetrics];
      v15 = +[BKLibraryCollectionsListMetrics sectionName];
      v16 = [v14 objectForKeyedSubscript:v15];
      [(BKLibraryCollectionsListViewController *)self setMetrics:v16];
    }
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v10 viewDidLoad];
  objc_super v3 = [(BKLibraryCollectionsListViewController *)self metrics];
  self->_wantsAddCollectionRow = 1;
  v4 = [(BKLibraryCollectionsListViewController *)self view];
  [v4 setAutoresizingMask:0];

  id v5 = [(BKLibraryCollectionsListViewController *)self view];
  double v6 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v6 setSpringLoaded:1];
  double v7 = [(BKLibraryCollectionsListViewController *)self navigationController];
  double v8 = [v7 view];
  [v8 setAccessibilityIgnoresInvertColors:1];

  [(BKLibraryCollectionsListViewController *)self p_updatePopoverFromMetricsIfNeeded:v3];
  [(BKLibraryCollectionsListViewController *)self p_updateTableViewFromMetrics:v3];
  [v5 addSubview:v6];
  if ([(BKLibraryCollectionsListViewController *)self isAddingToCollection]
    || [(BKLibraryCollectionsListViewController *)self supressLargeTitle])
  {
    double v9 = [(BKLibraryCollectionsListViewController *)self navigationItem];
    [v9 setLargeTitleDisplayMode:2];
  }
  [(BKLibraryCollectionsListViewController *)self resetNavigationBarButtons];
}

- (void)viewWillAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v21 viewWillAppear:a3];
  v4 = [(BKLibraryCollectionsListViewController *)self ba_analyticsTracker];

  if (!v4)
  {
    if ([(BKLibraryCollectionsListViewController *)self isAddingToCollection]) {
      CFStringRef v5 = @"AddToCollection";
    }
    else {
      CFStringRef v5 = @"CollectionList";
    }
    id v6 = [(BKLibraryCollectionsListViewController *)self ba_setupNewAnalyticsTrackerWithName:v5];
  }
  double v7 = [(BKLibraryCollectionsListViewController *)self navigationController];
  double v8 = [v7 navigationBar];
  double v9 = [v8 standardAppearance];
  id v10 = [v9 copy];

  [v10 configureWithOpaqueBackground];
  v11 = +[UIColor clearColor];
  [v10 setShadowColor:v11];

  unsigned int v12 = [(BKLibraryCollectionsListViewController *)self navigationController];
  id v13 = [v12 navigationBar];
  [v13 setScrollEdgeAppearance:v10];

  id v14 = +[NSDate date];
  analyticsAppearDate = self->_analyticsAppearDate;
  self->_analyticsAppearDate = v14;

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
  [v16 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
  [v16 addObserver:self selector:"keyboardDidHide:" name:UIKeyboardDidHideNotification object:0];
  [v16 addObserver:self selector:"managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];
  id v17 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v17 reloadData];

  v18 = [(BKLibraryCollectionsListViewController *)self selectedCollection];

  if (v18)
  {
    v19 = [(BKLibraryCollectionsListViewController *)self selectedCollection];
    v20 = [(BKLibraryCollectionsListViewController *)self _indexPathForCollection:v19];

    if (v20) {
      [(BKLibraryCollectionsListViewController *)self scrollToIndexPath:v20 animated:0];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v6 viewDidAppear:a3];
  v4 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v4 flashScrollIndicators];

  dispatch_time_t v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_100A49CE8);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v8 viewWillDisappear:a3];
  v4 = [(BKLibraryCollectionsListViewController *)self navigationController];
  dispatch_time_t v5 = [v4 navigationBar];
  [v5 setScrollEdgeAppearance:0];

  objc_super v6 = [(BKLibraryCollectionsListViewController *)self ba_effectiveAnalyticsTracker];
  [(BKLibraryCollectionsListViewController *)self _analyticsSubmitBrowseCollectionScreenViewEventWithTracker:v6];
  double v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:UIKeyboardWillShowNotification object:0];
  [v7 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  [v7 removeObserver:self name:UIKeyboardDidHideNotification object:0];
  [v7 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKLibraryCollectionsListViewController *)self setEditing:0 animated:0];
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v5 viewDidDisappear:v3];
  [(BKLibraryCollectionsListViewController *)self setCollectionAssetCounts:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(BKLibraryCollectionsListViewController *)self _updateMetricsIfNeeded];
}

- (id)p_firstVisibleCollection
{
  BOOL v3 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
  if ([v3 count])
  {
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    objc_super v5 = [(BKLibraryCollectionsListViewController *)self userCollections];
    if ([v5 count])
    {
      v4 = [v5 objectAtIndexedSubscript:0];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4 reuseAddCollectionRow:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v64.receiver = self;
  v64.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v64 setEditing:v8 animated:v7];
  v11 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v11 setEditing:v8 animated:v7];
  BOOL v12 = !v8 || v6;
  [(BKLibraryCollectionsListViewController *)self _updateBarButtonsAnimated:v7];
  if (v8 || !self->_endEditingMeansTableReload)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1001A84F0;
    v59[3] = &unk_100A44E60;
    BOOL v61 = v8;
    id v20 = v11;
    id v60 = v20;
    objc_super v21 = objc_retainBlock(v59);
    if (v7) {
      +[UIView animateWithDuration:v21 animations:0.3];
    }
    else {
      +[UIView performWithoutAnimation:v21];
    }
    v43 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
    v37 = v20;
    if (v12)
    {
      v22 = 0;
    }
    else
    {
      v22 = [(BKLibraryCollectionsListViewController *)self _addCollectionIndexPath];
    }
    [(BKLibraryCollectionsListViewController *)self setIncludeHiddenInPrefixCollections:v8];
    v42 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
    objc_super v38 = v11;
    v40 = v21;
    if (v12)
    {
      uint64_t v23 = [(BKLibraryCollectionsListViewController *)self _addCollectionIndexPath];

      v41 = (void *)v23;
    }
    else
    {
      v41 = v22;
    }
    id v24 = [objc_alloc((Class)NSSet) initWithArray:v43];
    id v25 = [objc_alloc((Class)NSSet) initWithArray:v42];
    id v26 = objc_alloc_init((Class)NSMutableArray);
    id v27 = objc_alloc_init((Class)NSMutableArray);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1001A861C;
    v56[3] = &unk_100A49D38;
    id v39 = v25;
    id v57 = v39;
    id v28 = v26;
    id v58 = v28;
    [v43 enumerateObjectsUsingBlock:v56];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1001A86A8;
    v53[3] = &unk_100A49D38;
    id v29 = v24;
    id v54 = v29;
    id v30 = v27;
    id v55 = v30;
    [v42 enumerateObjectsUsingBlock:v53];
    if (self->_wantsAddCollectionRow != v12)
    {
      if (v12)
      {
        if (([v30 containsObject:v41] & 1) == 0)
        {
          [v30 addObject:v41];
          v31 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v41 row] - 1, objc_msgSend(v41, "section"));
          dispatch_time_t when = dispatch_time(0, 500000000);
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_1001A8734;
          v51[3] = &unk_100A43DD8;
          v51[4] = self;
          id v52 = v31;
          id v32 = v31;
          dispatch_after(when, (dispatch_queue_t)&_dispatch_main_q, v51);
        }
      }
      else if (([v28 containsObject:v41] & 1) == 0)
      {
        [v28 addObject:v41];
      }
      self->_wantsAddCollectionRow = v12;
    }
    id v17 = &v60;
    if (objc_msgSend(v28, "count", when) || objc_msgSend(v30, "count"))
    {
      if (v7) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = 5;
      }
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1001A87AC;
      v46[3] = &unk_100A47F70;
      id v47 = v28;
      id v48 = v37;
      uint64_t v50 = v33;
      id v49 = v30;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1001A8814;
      v44[3] = &unk_100A44638;
      id v45 = v10;
      [v48 performBatchUpdates:v46 completion:v44];

      v34 = v47;
    }
    else
    {
      id v35 = objc_retainBlock(v10);
      v34 = v35;
      if (v35) {
        (*((void (**)(id))v35 + 2))(v35);
      }
    }
    v11 = v38;

    v19 = v40;
  }
  else
  {
    self->_endEditingMeansTableReload = 0;
    id v13 = [(BKLibraryCollectionsListViewController *)self selectedCollection];
    id v14 = [v13 deletedFlag];
    unsigned int v15 = [v14 BOOLValue];

    if (v15)
    {
      v16 = [(BKLibraryCollectionsListViewController *)self p_firstVisibleCollection];
      [(BKLibraryCollectionsListViewController *)self setSelectedCollection:v16];
    }
    self->_wantsAddCollectionRow = v12;
    [(BKLibraryCollectionsListViewController *)self setIncludeHiddenInPrefixCollections:0];
    [(BKLibraryCollectionsListViewController *)self setUserCollections:0];
    [(BKLibraryCollectionsListViewController *)self setCollectionAssetCounts:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A84E8;
    block[3] = &unk_100A43D60;
    id v17 = &v63;
    id v63 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v18 = objc_retainBlock(v10);
    v19 = v18;
    if (v18) {
      (*((void (**)(id))v18 + 2))(v18);
    }
  }
}

- (void)toggleEditButtonPressed:(id)a3
{
  id v7 = a3;
  v4 = [(BKLibraryCollectionsListViewController *)self tableView];
  if ([v4 hasActiveDrag])
  {
  }
  else
  {
    objc_super v5 = [(BKLibraryCollectionsListViewController *)self tableView];
    unsigned __int8 v6 = [v5 hasActiveDrop];

    if ((v6 & 1) == 0)
    {
      if ([(BKLibraryCollectionsListViewController *)self isEditing]) {
        [(BKLibraryCollectionsListViewController *)self stopEditButtonPressed:v7];
      }
      else {
        [(BKLibraryCollectionsListViewController *)self startEditButtonPressed:v7];
      }
    }
  }
}

- (void)startEditButtonPressed:(id)a3
{
}

- (void)stopEditButtonPressed:(id)a3
{
  if ([(BKLibraryCollectionsListViewController *)self isTextEditing])
  {
    v4 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
    objc_super v5 = [v4 textEntryField];
    unsigned int v6 = [v5 isFirstResponder];

    if (v6)
    {
      self->_endTextEditingMeansEndEditMode = 1;
      [(BKLibraryCollectionsListViewController *)self endTextEditing];
    }
  }
  else
  {
    [(BKLibraryCollectionsListViewController *)self setEditing:0 animated:1];
  }
}

- (void)addCollection:(id)a3
{
  [(BKLibraryCollectionsListViewController *)self tableView];
  unsigned int v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  BOOL v8 = sub_1001A8AD0;
  double v9 = &unk_100A43DD8;
  id v10 = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v11;
  objc_super v5 = objc_retainBlock(&v6);
  if ([(BKLibraryCollectionsListViewController *)self isEditing])
  {
    ((void (*)(void ***))v5[2])(v5);
  }
  else
  {
    self->_suppressEditControlsForNewCollection = 1;
    [(BKLibraryCollectionsListViewController *)self setEditing:1 animated:0 reuseAddCollectionRow:1 completion:v5];
  }
}

- (void)endTextEditing
{
  BOOL v3 = [(BKLibraryCollectionsListViewController *)self textEntryIndexPath];
  [(BKLibraryCollectionsListViewController *)self setPostKeyboardIndexPath:v3];

  id v5 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
  id v4 = [v5 textEntryField];
  [v4 resignFirstResponder];
}

- (void)setWantsAddCollectionRow:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKLibraryCollectionsListViewController *)self _addCollectionIndexPath];
  [(BKLibraryCollectionsListViewController *)self setWantsAddCollectionRow:v3 indexPath:v5 animated:0];
}

- (void)setWantsAddCollectionRow:(BOOL)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (self->_wantsAddCollectionRow != v6)
  {
    self->_wantsAddCollectionRow = v6;
    [(BKLibraryCollectionsListViewController *)self tableView];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A8DC4;
    v10[3] = &unk_100A49D60;
    BOOL v13 = v6;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v8;
    BOOL v14 = a5;
    id v9 = v11;
    [v9 performBatchUpdates:v10 completion:0];
  }
}

- (UIBarButtonItem)navBarEditButtonItem
{
  navBarEditButtonItem = self->_navBarEditButtonItem;
  if (!navBarEditButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:0 style:0 target:self action:"toggleEditButtonPressed:"];
    id v5 = self->_navBarEditButtonItem;
    self->_navBarEditButtonItem = v4;

    navBarEditButtonItem = self->_navBarEditButtonItem;
  }

  return navBarEditButtonItem;
}

- (BOOL)isSelectionEnabledForCollection:(id)a3
{
  id v4 = a3;
  if (!v4 || ![(BKLibraryCollectionsListViewController *)self isAddingToCollection])
  {
    unsigned __int8 v7 = 1;
    goto LABEL_9;
  }
  id v5 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
  if (![v5 containsObject:v4])
  {

    goto LABEL_8;
  }
  unsigned __int8 v6 = [(BKLibraryCollectionsListViewController *)self containsSeriesContainer];

  if ((v6 & 1) == 0)
  {
LABEL_8:
    unsigned __int8 v7 = [v4 allowsManualAddition];
    goto LABEL_9;
  }
  unsigned __int8 v7 = 0;
LABEL_9:

  return v7;
}

- (NSArray)prefixCollections
{
  if (!self->_prefixCollectionsMonitor)
  {
    id v3 = objc_alloc((Class)BCManagedObjectIDMonitor);
    id v4 = +[BKLibraryManager defaultManager];
    id v5 = [v4 persistentStoreCoordinator];
    unsigned __int8 v6 = +[BKCollection predicateForAllDefaultCollections];
    CFStringRef v22 = @"hidden";
    unsigned __int8 v7 = +[NSArray arrayWithObjects:&v22 count:1];
    id v8 = +[NSSet setWithArray:v7];
    id v9 = (BCManagedObjectIDMonitor *)[v3 initWithContext:0 coordinator:v5 entityName:@"BKCollection" predicate:v6 mapProperty:@"collectionID" propertiesOfInterest:v8 observer:self];
    prefixCollectionsMonitor = self->_prefixCollectionsMonitor;
    self->_prefixCollectionsMonitor = v9;
  }
  prefixCollections = self->_prefixCollections;
  if (!prefixCollections)
  {
    id v12 = +[BKLibraryManager defaultManager];
    BOOL v13 = [v12 collectionProvider];
    BOOL v14 = [v13 selectableDefaultCollections];

    if ([(BKLibraryCollectionsListViewController *)self includeHiddenInPrefixCollections])
    {
      unsigned int v15 = v14;
      v16 = self->_prefixCollections;
      self->_prefixCollections = v15;
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001A9208;
      v20[3] = &unk_100A49D88;
      id v21 = objc_alloc_init((Class)NSMutableArray);
      v16 = (NSArray *)v21;
      [v14 enumerateObjectsUsingBlock:v20];
      id v17 = (NSArray *)[(NSArray *)v16 copy];
      id v18 = self->_prefixCollections;
      self->_prefixCollections = v17;
    }
    prefixCollections = self->_prefixCollections;
  }

  return prefixCollections;
}

- (void)setIncludeHiddenInPrefixCollections:(BOOL)a3
{
  if (self->_includeHiddenInPrefixCollections != a3)
  {
    self->_includeHiddenInPrefixCollections = a3;
    [(BKLibraryCollectionsListViewController *)self invalidatePrefixCollections];
  }
}

- (void)invalidatePrefixCollections
{
  prefixCollections = self->_prefixCollections;
  self->_prefixCollections = 0;
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  [a4 updatedObjects:a3];
  id v6 = [v5 copy];

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A9394;
  block[3] = &unk_100A47A50;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  id v6 = BUDynamicCast();

  if (v6)
  {
    id v7 = [v6 persistentStoreCoordinator];
    id v8 = +[BKLibraryManager defaultManager];
    id v9 = [v8 persistentStoreCoordinator];
    unsigned int v10 = [v7 hasStoreInCommonWith:v9];

    if (v10)
    {
      id v11 = [v4 userInfo];
      id v12 = [v11 objectForKey:NSInsertedObjectsKey];
      BOOL v13 = [v11 objectForKey:NSUpdatedObjectsKey];
      BOOL v14 = [v11 objectForKey:NSDeletedObjectsKey];
      if ([v12 count] || objc_msgSend(v13, "count") || objc_msgSend(v14, "count"))
      {
        +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1001A9C24;
        v25[3] = &unk_100A49DD8;
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = objc_alloc_init((Class)NSMutableSet);
        id v27 = v15;
        id v20 = v26;
        v16 = v13;
        id v17 = v14;
        id v18 = objc_retainBlock(v25);
        ((void (*)(void *, void *))v18[2])(v18, v12);
        ((void (*)(void *, void *))v18[2])(v18, v16);
        ((void (*)(void *, void *))v18[2])(v18, v17);
        objc_initWeak(&location, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001A9D8C;
        block[3] = &unk_100A43F90;
        id v22 = v15;
        id v19 = v15;
        objc_copyWeak(&v23, &location);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v23);

        objc_destroyWeak(&location);
        BOOL v14 = v17;
        BOOL v13 = v16;
      }
    }
  }
}

- (NSMutableArray)userCollections
{
  if (!self->_userCollections)
  {
    if (!self->_fetchedResultsController)
    {
      id v3 = +[BKLibraryManager defaultManager];
      id v4 = [v3 uiChildContext];
      id v5 = objc_alloc_init((Class)NSFetchRequest);
      id v6 = +[NSEntityDescription entityForName:@"BKCollection" inManagedObjectContext:v4];
      [v5 setEntity:v6];

      id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:1];
      id v20 = v7;
      id v8 = +[NSArray arrayWithObjects:&v20 count:1];
      [v5 setSortDescriptors:v8];

      id v9 = +[BKCollection predicateForNonDeletedUserCollections];
      [v5 setPredicate:v9];

      unsigned int v10 = (NSFetchedResultsController *)[objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v5 managedObjectContext:v4 sectionNameKeyPath:0 cacheName:0];
      fetchedResultsController = self->_fetchedResultsController;
      self->_fetchedResultsController = v10;

      [(NSFetchedResultsController *)self->_fetchedResultsController setDelegate:self];
    }
    id v12 = [(BKLibraryCollectionsListViewController *)self fetchedResultsController];
    unsigned int v13 = [v12 performFetch:0];

    if (v13)
    {
      BOOL v14 = [(BKLibraryCollectionsListViewController *)self fetchedResultsController];
      id v15 = [v14 fetchedObjects];
      v16 = +[NSMutableArray arrayWithArray:v15];
      userCollections = self->_userCollections;
      self->_userCollections = v16;
    }
  }
  id v18 = self->_userCollections;

  return v18;
}

- (void)_updateInsets
{
  double v3 = 0.0;
  if (([(BKLibraryCollectionsListViewController *)self _isInPopoverPresentation] & 1) == 0)
  {
    [(BKLibraryCollectionsListViewController *)self keyboardFrame];
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    CGFloat height = v24.size.height;
    if (!CGRectIsEmpty(v24))
    {
      id v8 = [(BKLibraryCollectionsListViewController *)self view];
      id v9 = [v8 safeAreaLayoutGuide];
      [v9 layoutFrame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat r2a = v16;

      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      v28.origin.CGFloat x = v11;
      v28.origin.CGFloat y = v13;
      v28.size.CGFloat width = v15;
      v28.size.CGFloat height = r2a;
      CGRect v26 = CGRectIntersection(v25, v28);
      CGFloat v17 = v26.origin.x;
      CGFloat v18 = v26.origin.y;
      CGFloat v19 = v26.size.width;
      CGFloat v20 = v26.size.height;
      if (!CGRectIsNull(v26))
      {
        v27.origin.CGFloat x = v17;
        v27.origin.CGFloat y = v18;
        v27.size.CGFloat width = v19;
        v27.size.CGFloat height = v20;
        double v3 = CGRectGetHeight(v27);
      }
    }
  }
  r2 = [(BKLibraryCollectionsListViewController *)self tableView];
  [r2 setContentInset:0.0, 0.0, v3, 0.0];
  [r2 setScrollIndicatorInsets:0.0, 0.0, v3, 0.0];
}

- (void)viewDidLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v27 viewDidLayoutSubviews];
  double v3 = [(BKLibraryCollectionsListViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v12 setFrame:v5, v7, v9, v11];

  [(BKLibraryCollectionsListViewController *)self _updateInsets];
  CGFloat v13 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v13 bounds];
  double Width = CGRectGetWidth(v28);

  LODWORD(v12) = [(BKLibraryCollectionsListViewController *)self _isInPopoverPresentation];
  CGFloat v15 = [(BKLibraryCollectionsListViewController *)self headerSeparatorView];
  double v16 = v15;
  if (v12)
  {

    if (!v16) {
      return;
    }
    [(BKLibraryCollectionsListViewController *)self setHeaderSeparatorView:0];
    id v17 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v17 setTableHeaderView:0];
  }
  else
  {

    if (v16)
    {
      id v17 = [(BKLibraryCollectionsListViewController *)self headerSeparatorView];
      [v17 bounds];
      double Height = CGRectGetHeight(v29);
      CGFloat v19 = [(BKLibraryCollectionsListViewController *)self headerSeparatorView];
      [v19 setFrame:CGRectMake(0.0, 0.0, Width, Height)];
    }
    else
    {
      CGFloat v20 = +[UIScreen mainScreen];
      [v20 scale];
      double v22 = 1.0 / v21;

      id v17 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, Width, v22];
      id v23 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, Width, v22];
      CGRect v24 = [(BKLibraryCollectionsListViewController *)self tableView];
      CGRect v25 = [v24 separatorColor];
      [v23 setBackgroundColor:v25];

      [v17 addSubview:v23];
      CGRect v26 = [(BKLibraryCollectionsListViewController *)self tableView];
      [v26 setTableHeaderView:v17];

      [(BKLibraryCollectionsListViewController *)self setHeaderSeparatorView:v23];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryCollectionsListViewController;
  id v7 = a4;
  -[BKLibraryCollectionsListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(BKLibraryCollectionsListViewController *)self selectedCollection];
  double v9 = [(BKLibraryCollectionsListViewController *)self _indexPathForCollection:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001AA5EC;
  v11[3] = &unk_100A44308;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  [v7 animateAlongsideTransition:v11 completion:0];
}

- (void)resetNavigationBarButtons
{
}

- (void)_updateBarButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(BKLibraryCollectionsListViewController *)self isEditing];
  double v6 = +[NSBundle mainBundle];
  id v7 = v6;
  if (v5) {
    CFStringRef v8 = @"Done";
  }
  else {
    CFStringRef v8 = @"Edit";
  }
  double v9 = [v6 localizedStringForKey:v8 value:&stru_100A70340 table:0];

  if (![(BKLibraryCollectionsListViewController *)self isAddingToCollection])
  {
    id v10 = [(BKLibraryCollectionsListViewController *)self navBarEditButtonItem];
    if (v5) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = [(BKLibraryCollectionsListViewController *)self navigationItem];
    objc_super v13 = [v12 rightBarButtonItems];
    unsigned int v14 = [v13 containsObject:v10];

    if (v14)
    {
      if ((id)v11 != [v10 style]
        || ([v10 title],
            CGFloat v15 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v16 = [v9 isEqualToString:v15],
            v15,
            (v16 & 1) == 0))
      {
        if (v3)
        {
          id v17 = [(BKLibraryCollectionsListViewController *)self navigationController];
          CGFloat v18 = [v17 navigationBar];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1001AA878;
          v19[3] = &unk_100A45688;
          id v20 = v10;
          id v21 = v9;
          uint64_t v22 = v11;
          +[UIView transitionWithView:v18 duration:5242880 options:v19 animations:0 completion:0.3];
        }
        else
        {
          [v10 setTitle:v9];
          [v10 setStyle:v11];
        }
      }
    }
    else
    {
      [v10 setTitle:v9];
      [v10 setStyle:v11];
      [v12 setRightBarButtonItem:v10 animated:v3];
    }
  }
}

- (UITableView)tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    double v4 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    unsigned int v5 = self->_tableView;
    self->_tableView = v4;

    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDropDelegate:self];
    [(UITableView *)self->_tableView setDragDelegate:self];
    [(UITableView *)self->_tableView setSeparatorStyle:1];
    [(UITableView *)self->_tableView setEstimatedRowHeight:45.0];
    [(UITableView *)self->_tableView setAllowsSelectionDuringEditing:1];
    [(UITableView *)self->_tableView setClipsToBounds:1];
    [(UITableView *)self->_tableView setOpaque:1];
    [(UITableView *)self->_tableView setDragInteractionEnabled:1];
    tableView = self->_tableView;
  }

  return tableView;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  if ([(BKLibraryCollectionsListViewController *)self isTextEditing])
  {
    double v4 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
    unsigned int v5 = [v4 textEntryField];

    if (![(BKLibraryCollectionsListViewController *)self textFieldShouldEndEditing:v5])
    {
LABEL_13:
      [(BKLibraryCollectionsListViewController *)self animateEndTextEditCollections];
      [(BKLibraryCollectionsListViewController *)self setEditing:0 animated:1];

      return;
    }
    double v6 = [v5 text];
    if (![v6 length])
    {
LABEL_12:

      goto LABEL_13;
    }
    id v7 = +[BKLibraryManager defaultManager];
    CFStringRef v8 = [v7 collectionController];
    double v9 = [(BKLibraryCollectionsListViewController *)self textEntryCollection];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 localizedTitle];
      unsigned __int8 v12 = [v11 isEqualToString:v6];

      if (v12)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_super v13 = [v10 collectionID];
      [(BKLibraryCollectionsListViewController *)self setChangeIsUserDriven:1];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1001AACC8;
      v27[3] = &unk_100A46FC0;
      id v28 = v8;
      id v29 = v13;
      id v30 = v6;
      id v14 = v13;
      [v7 performBlockInUIContext:v27];
      CGFloat v15 = [(BKLibraryCollectionsListViewController *)self delegate];
      [v15 collectionListView:self collectionChanged:v10];
    }
    else
    {
      unsigned __int8 v16 = [(BKLibraryCollectionsListViewController *)self textEntryIndexPath];

      if (!v16 || ![v6 length]) {
        goto LABEL_11;
      }
      [(BKLibraryCollectionsListViewController *)self setChangeIsUserDriven:1];
      uint64_t v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      CGRect v24 = sub_1001AAD4C;
      CGRect v25 = &unk_100A49E20;
      id v26 = v6;
      id v17 = [v8 insertNewCollectionSyncOnMainQueueWithCollectionID:0 newCollectionBlock:&v22];
      CGFloat v18 = +[BAEventReporter sharedReporter];
      CGFloat v19 = [(BKLibraryCollectionsListViewController *)self ba_effectiveAnalyticsTracker];
      id v20 = [v17 collectionID];
      [v18 emitCollectionAddEventWithTracker:v19 collectionID:v20 collectionItemCount:0];

      id v21 = [(BKLibraryCollectionsListViewController *)self userCollections];
      [v21 addObject:v17];

      self->_wantsAddCollectionRow = 0;
      id v14 = v26;
    }

    goto LABEL_11;
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = a4;
  unsigned __int8 v9 = [(BKLibraryCollectionsListViewController *)self changeIsUserDriven];
  if (a6 - 5 >= 0xFFFFFFFFFFFFFFFELL && (v9 & 1) == 0)
  {
    objc_opt_class();
    id v10 = BUClassAndProtocolCast();
    if (v10)
    {
      uint64_t v11 = [(BKLibraryCollectionsListViewController *)self delegate];
      [v11 collectionListView:self collectionChanged:v10];
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  if ([(BKLibraryCollectionsListViewController *)self changeIsUserDriven])
  {
    [(BKLibraryCollectionsListViewController *)self setChangeIsUserDriven:0];
  }
  else if ([(BKLibraryCollectionsListViewController *)self isEditing])
  {
    self->_endEditingMeansTableReload = 1;
  }
  else
  {
    double v4 = [(BKLibraryCollectionsListViewController *)self selectedCollection];
    unsigned int v5 = [v4 deletedFlag];
    unsigned int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = [(BKLibraryCollectionsListViewController *)self p_firstVisibleCollection];
      [(BKLibraryCollectionsListViewController *)self setSelectedCollection:v7];
    }
    [(BKLibraryCollectionsListViewController *)self setUserCollections:0];
    id v8 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v8 reloadData];
  }
}

- (unint64_t)p_assetCountForCollection:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 collectionID];
  if (v5)
  {
    id v6 = [(BKLibraryCollectionsListViewController *)self collectionAssetCounts];
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)NSMutableDictionary);
      [(BKLibraryCollectionsListViewController *)self setCollectionAssetCounts:v6];
    }
    id v7 = [v6 objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 unsignedIntegerValue];
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    if ([v5 isEqualToString:kBKCollectionDefaultIDFinished])
    {
      id v10 = +[BKLibraryManager defaultManager];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001AB188;
      v19[3] = &unk_100A49E48;
      void v19[4] = &v20;
      [v10 performBlockInUIContext:v19];
    }
    else
    {
      uint64_t v11 = [v4 members];
      id v12 = [v11 count];

      if (!v12)
      {
LABEL_12:
        id v14 = +[NSNumber numberWithUnsignedInteger:v21[3]];
        [v6 setObject:v14 forKeyedSubscript:v5];

        id v9 = (id)v21[3];
        _Block_object_dispose(&v20, 8);
        goto LABEL_13;
      }
      objc_super v13 = +[BKLibraryManager defaultManager];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1001AB24C;
      v16[3] = &unk_100A46FE8;
      id v17 = v5;
      CGFloat v18 = &v20;
      [v13 performBlockInUIContext:v16];

      id v10 = v17;
    }

    goto LABEL_12;
  }
  id v9 = 0;
LABEL_14:

  return (unint64_t)v9;
}

- (void)_concludeDeleteAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:v4];
  id v6 = [(BKLibraryCollectionsListViewController *)self userCollections];
  id v7 = [v6 objectAtIndex:v5];

  if (v7)
  {
    [(BKLibraryCollectionsListViewController *)self setChangeIsUserDriven:1];
    id v8 = [(BKLibraryCollectionsListViewController *)self delegate];
    unsigned int v9 = [v8 collectionListView:self collectionDeleted:v7];

    if (v9)
    {
      id v10 = [(BKLibraryCollectionsListViewController *)self userCollections];
      [v10 removeObjectAtIndex:v5];

      uint64_t v11 = [(BKLibraryCollectionsListViewController *)self tableView];
      id v13 = v4;
      id v12 = +[NSArray arrayWithObjects:&v13 count:1];
      [v11 deleteRowsAtIndexPaths:v12 withRowAnimation:0];
    }
    else
    {
      [(BKLibraryCollectionsListViewController *)self setChangeIsUserDriven:0];
      uint64_t v11 = [(BKLibraryCollectionsListViewController *)self tableView];
      [v11 reloadData];
    }
  }
}

- (void)_concludeHide:(BOOL)a3 atIndexPath:(id)a4
{
  unint64_t v6 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:a4];
  id v7 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
  id v8 = [v7 objectAtIndex:v6];

  if (v8)
  {
    unsigned int v9 = +[BKLibraryManager defaultManager];
    [v9 collectionController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001AB588;
    v11[3] = &unk_100A49E70;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v8;
    BOOL v14 = a3;
    id v10 = v12;
    [v9 performBlockInUIContext:v11];
  }
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return &__NSArray0__struct;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return &__NSArray0__struct;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v6 setSpringLoaded:0];

  [(UIBarButtonItem *)self->_navBarEditButtonItem setEnabled:0];
  id v7 = [v5 localContext];

  if (v7 != self)
  {
    [(BKLibraryCollectionsListViewController *)self stopEditButtonPressed:self];
  }
}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = [(BKLibraryCollectionsListViewController *)self tableView];
  [v5 setSpringLoaded:1];

  [(UIBarButtonItem *)self->_navBarEditButtonItem setEnabled:1];

  [(BKLibraryCollectionsListViewController *)self resetNavigationBarButtons];
}

- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = [a4 localDragSession];
  unsigned int v9 = [v8 localContext];

  if (v9 == self)
  {
    id v11 = objc_alloc((Class)UITableViewDropProposal);
    uint64_t v12 = 3;
    uint64_t v13 = 1;
  }
  else
  {
    if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v7]
      || [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v7])
    {
      uint64_t v10 = 2;
    }
    else
    {
      BOOL v14 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v7];
      if ([v14 allowsManualAddition]) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
    }
    id v11 = objc_alloc((Class)UITableViewDropProposal);
    uint64_t v12 = v10;
    uint64_t v13 = 2;
  }
  id v15 = [v11 initWithDropOperation:v12 intent:v13];

  return v15;
}

- (void)tableView:(id)a3 dropSessionDidEnter:(id)a4
{
  navBarEditButtonItem = self->_navBarEditButtonItem;
  id v6 = a4;
  [(UIBarButtonItem *)navBarEditButtonItem setEnabled:0];
  id v7 = [v6 localDragSession];

  id v8 = [v7 localContext];

  if (v8 != self)
  {
    [(BKLibraryCollectionsListViewController *)self stopEditButtonPressed:self];
  }
}

- (void)tableView:(id)a3 dropSessionDidExit:(id)a4
{
}

- (void)tableView:(id)a3 dropSessionDidEnd:(id)a4
{
}

- (void)_addStoreItems:(id)a3 toCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[BKLibraryManager defaultManager];
  id v8 = [v7 collectionController];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v12) storeID];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1001ABB1C;
        v17[3] = &unk_100A43E90;
        id v18 = v13;
        id v14 = v6;
        id v19 = v14;
        id v15 = v13;
        [v8 addStoreID:v15 toCollectionID:v14 forceToTop:1 completion:v17];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v70 = +[NSMutableArray array];
  v68 = +[NSMutableArray array];
  uint64_t v8 = [v7 destinationIndexPath];
  objc_opt_class();
  v65 = self;
  id v9 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v8];
  id v63 = BUDynamicCast();

  v67 = v6;
  objc_super v64 = (void *)v8;
  id v10 = [v6 cellForRowAtIndexPath:v8];
  uint64_t v11 = [v10 imageView];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  long long v20 = [v10 imageView];
  v66 = v10;
  [v10 convertRect:v20 fromView:v13, v15, v17, v19];
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = [v7 items];
  id v29 = [obj countByEnumeratingWithState:&v84 objects:v88 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v85;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v85 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        objc_opt_class();
        v34 = [v33 dragItem];
        id v35 = [v34 localObject];
        id v36 = BUDynamicCast();

        objc_opt_class();
        v37 = [v33 dragItem];
        objc_super v38 = [v37 localObject];
        id v39 = BUDynamicCast();

        objc_opt_class();
        v40 = [v33 dragItem];
        v41 = [v40 localObject];
        v42 = BUDynamicCast();

        v43 = [v42 assetID];
        id v44 = [v43 length];

        if (v44)
        {
          id v45 = +[BKLibraryManager defaultManager];
          v46 = [v42 assetID];
          uint64_t v47 = [v45 libraryAssetOnMainQueueWithAssetID:v46];

          id v36 = (void *)v47;
        }
        if (v36)
        {
          id v48 = v70;
          id v49 = v36;
        }
        else
        {
          if (!v39) {
            goto LABEL_13;
          }
          id v48 = v68;
          id v49 = v39;
        }
        [v48 addObject:v49];
LABEL_13:
      }
      id v30 = [obj countByEnumeratingWithState:&v84 objects:v88 count:16];
    }
    while (v30);
  }

  unsigned int v50 = [(BKLibraryCollectionsListViewController *)v65 _isAddCollectionIndexPath:v64];
  char v51 = v50;
  if (v50)
  {
    id v52 = +[BKLibraryManager defaultManager];
    v53 = [v52 uiChildContext];
    id v54 = +[BKCollection insertNewCollectionWithCollectionID:0 inManagedObjectContext:v53];

    id v55 = +[NSBundle mainBundle];
    v56 = [v55 localizedStringForKey:@"Untitled Collection" value:&stru_100A70340 table:0];
    [v54 setTitle:v56];

    [v54 addLibraryAssets:v70];
    id v57 = [v54 collectionID];
    [(BKLibraryCollectionsListViewController *)v65 _addStoreItems:v68 toCollection:v57];
  }
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1001AC10C;
  v77[3] = &unk_100A48E98;
  id v78 = v7;
  id v79 = v64;
  uint64_t v80 = v22;
  uint64_t v81 = v24;
  uint64_t v82 = v26;
  uint64_t v83 = v28;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1001AC3A4;
  v71[3] = &unk_100A49E98;
  char v76 = v51;
  id v72 = v63;
  id v73 = v70;
  v74 = v65;
  id v75 = v68;
  id v58 = v68;
  id v59 = v70;
  id v60 = v63;
  id v61 = v64;
  id v62 = v7;
  [v67 performBatchUpdates:v77 completion:v71];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = 0.0;
  if (!a4)
  {
    unsigned int v7 = [(BKLibraryCollectionsListViewController *)self showDivider];
    double result = 0.0;
    if (v7) {
      return 6.0;
    }
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v8 = [(BKLibraryCollectionsListViewController *)self prefixFooterView];

    if (!v8)
    {
      id v9 = objc_alloc_init((Class)UIView);
      [(BKLibraryCollectionsListViewController *)self setPrefixFooterView:v9];

      id v10 = [(BKLibraryCollectionsListViewController *)self metrics];
      uint64_t v11 = [v10 tableSeparatorColor];
      double v12 = [(BKLibraryCollectionsListViewController *)self prefixFooterView];
      [v12 setBackgroundColor:v11];
    }
    uint64_t v5 = [(BKLibraryCollectionsListViewController *)self prefixFooterView];
  }
  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    unint64_t v8 = [(BKLibraryCollectionsListViewController *)self _numberOfUserRows];
    unsigned int v7 = (char *)[(BKLibraryCollectionsListViewController *)self _numberOfNewCollectionButtonRows]+ v8;
  }
  else if (a4)
  {
    unsigned int v7 = 0;
  }
  else
  {
    unsigned int v7 = [(BKLibraryCollectionsListViewController *)self _numberOfPrefixRows];
  }

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v7]) {
    CFStringRef v9 = @"NewCollectionCell";
  }
  else {
    CFStringRef v9 = @"Cell";
  }
  id v10 = [v6 dequeueReusableCellWithIdentifier:v9];
  if (!v10) {
    id v10 = [[BKLibraryCollectionsListCell alloc] initWithStyle:0 reuseIdentifier:v9];
  }
  [(BKLibraryCollectionsListViewController *)self _configureCell:v10 atIndexPath:v7];

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v22 = (BKLibraryCollectionsListCell *)a4;
  id v7 = a5;
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v7]
    || [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v7])
  {
    unint64_t v8 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:v7];
    CFStringRef v9 = [(BKLibraryCollectionsListViewController *)self userCollections];
    id v10 = [v9 count];

    if ((unint64_t)v10 <= v8)
    {
      if (![(BKLibraryCollectionsListViewController *)self isTextEditing]
        || ![(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v7])
      {
LABEL_11:
        double v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
      double v14 = [(BKLibraryCollectionsListViewController *)self defaultCollectionName];
    }
    else
    {
      uint64_t v11 = [(BKLibraryCollectionsListViewController *)self userCollections];
      textEntryCell = [v11 objectAtIndex:v8];

      double v13 = [(BKLibraryCollectionsListViewController *)self textEntryCollection];

      if (v13 != textEntryCell)
      {
        double v14 = [(BKLibraryCollectionsListViewController *)self textEntryIndexPath];
        if (v14)
        {
          double v15 = [(BKLibraryCollectionsListViewController *)self textEntryIndexPath];
          id v16 = [v15 row];
          id v17 = [v7 row];

          if (v16 == v17) {
            goto LABEL_17;
          }
          goto LABEL_11;
        }
LABEL_18:

        goto LABEL_19;
      }
      if (![(BKLibraryCollectionsListViewController *)self isTextEditing])
      {

LABEL_17:
        [(BKLibraryCollectionsListCell *)self->_textEntryCell removeTextEntryField];
        double v14 = 0;
        textEntryCell = self->_textEntryCell;
        self->_textEntryCell = 0;
        goto LABEL_18;
      }
      double v18 = [(BKLibraryCollectionsListViewController *)self textEntryCollection];
      double v14 = [v18 localizedTitle];
    }
    [(BKLibraryCollectionsListViewController *)self setTextEntryIndexPath:v7];
    double v19 = self->_textEntryCell;
    if (v19 == v22) {
      goto LABEL_19;
    }
    [(BKLibraryCollectionsListCell *)v19 removeTextEntryField];
    objc_opt_class();
    BUDynamicCast();
    long long v20 = (BKLibraryCollectionsListCell *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = self->_textEntryCell;
    self->_textEntryCell = v20;

    [(BKLibraryCollectionsListCell *)self->_textEntryCell setupTextEntryField:self];
    textEntryCell = [(BKLibraryCollectionsListCell *)self->_textEntryCell textEntryField];
    [textEntryCell setText:v14];
    goto LABEL_18;
  }
LABEL_20:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(BKLibraryCollectionsListViewController *)self isTextEditing]
    || self->_endTextEditingMeansEndEditMode
    || self->_suppressEditControlsForNewCollection)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    unsigned int v6 = ![(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v5];
  }

  return v6;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(BKLibraryCollectionsListViewController *)self navBarEditButtonItem];
  [v8 setEnabled:0];

  id v10 = [v7 cellForRowAtIndexPath:v6];

  CFStringRef v9 = [v10 chevron];
  [v9 setHidden:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(BKLibraryCollectionsListViewController *)self navBarEditButtonItem];
  [v8 setEnabled:1];

  id v10 = [v7 cellForRowAtIndexPath:v6];

  CFStringRef v9 = [v10 chevron];
  [v9 setHidden:0];
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a5;
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsPrefix:v6])
  {
    id v7 = 0;
LABEL_8:
    unint64_t v8 = +[NSIndexPath indexPathForRow:v7 inSection:1];

    goto LABEL_9;
  }
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v6]
    || (unint64_t v8 = v6,
        [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v6]))
  {
    id v9 = [v6 row];
    unint64_t v10 = [(BKLibraryCollectionsListViewController *)self _numberOfUserRows];
    if ((unint64_t)v9 >= v10
                               - [(BKLibraryCollectionsListViewController *)self _numberOfNewCollectionButtonRows])
    {
      unint64_t v11 = [(BKLibraryCollectionsListViewController *)self _numberOfUserRows];
      id v7 = (id)(v11
              - [(BKLibraryCollectionsListViewController *)self _numberOfNewCollectionButtonRows]);
    }
    else
    {
      id v7 = [v6 row];
    }
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v15]
    && [(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v7])
  {
    [(BKLibraryCollectionsListViewController *)self setChangeIsUserDriven:1];
    unint64_t v8 = [(BKLibraryCollectionsListViewController *)self userCollections];
    id v9 = [v8 mutableCopy];

    unint64_t v10 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:v15];
    unint64_t v11 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:v7];
    double v12 = [v9 objectAtIndex:v10];
    [v9 removeObjectAtIndex:v10];
    [v9 insertObject:v12 atIndex:v11];
    [(BKLibraryCollectionsListViewController *)self setUserCollections:v9];
    double v13 = [(BKLibraryCollectionsListViewController *)self userCollections];
    double v14 = +[BKLibraryManager defaultManager];
    +[BKUserSortOrderManager saveSortedCollectionsArray:v13 inLibraryManager:v14];
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  BOOL v5 = [(BKLibraryCollectionsListViewController *)self _indexPathIsUser:a4];
  if (v5)
  {
    if ([(BKLibraryCollectionsListViewController *)self isTextEditing]) {
      LOBYTE(v5) = 0;
    }
    else {
      LOBYTE(v5) = ![(BKLibraryCollectionsListViewController *)self isAddingToCollection];
    }
  }
  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(BKLibraryCollectionsListViewController *)self isAddingToCollection])
  {
    int64_t v6 = 0;
  }
  else if ([(BKLibraryCollectionsListViewController *)self _indexPathIsPrefix:v5])
  {
    id v7 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v5];
    unint64_t v8 = [v7 hidden];
    unsigned int v9 = [v8 BOOLValue];

    if (v9) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
  }
  else
  {
    int64_t v6 = [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v5] ^ 1;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 2) {
    [(BKLibraryCollectionsListViewController *)self _concludeHide:0 atIndexPath:a5];
  }
}

+ (id)deleteActionHandler
{
  return &stru_100A49ED8;
}

+ (id)hideActionHandler
{
  return &stru_100A49F20;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(BKLibraryCollectionsListViewController *)self isTextEditing]
    || [(BKLibraryCollectionsListViewController *)self isAddingToCollection])
  {
    goto LABEL_7;
  }
  if (![(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v5])
  {
    if (![(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v5])
    {
      unsigned int v9 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v5];
      unint64_t v10 = [v9 hidden];
      unsigned __int8 v11 = [v10 BOOLValue];

      if (v11)
      {
        int64_t v6 = 0;
      }
      else
      {
        int64_t v6 = [(BKLibraryCollectionsListViewController *)self hideSwipeAction:v5];
      }

      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
LABEL_7:
    int64_t v6 = 0;
LABEL_8:
    id v7 = 0;
    goto LABEL_9;
  }
  int64_t v6 = [(BKLibraryCollectionsListViewController *)self deleteSwipeAction:v5];
  if (!v6) {
    goto LABEL_8;
  }
LABEL_16:
  double v13 = v6;
  double v12 = +[NSArray arrayWithObjects:&v13 count:1];
  id v7 = +[UISwipeActionsConfiguration configurationWithActions:v12];

  [v7 setPerformsFirstActionWithFullSwipe:0];
LABEL_9:

  return v7;
}

- (id)deleteSwipeAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NSBundle mainBundle];
  int64_t v6 = [v5 localizedStringForKey:@"Delete" value:&stru_100A70340 table:0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001AD8D4;
  v12[3] = &unk_100A49F48;
  objc_copyWeak(&v14, &location);
  id v7 = v4;
  id v13 = v7;
  unint64_t v8 = +[UIContextualAction contextualActionWithStyle:1 title:v6 handler:v12];
  unsigned int v9 = [(BKLibraryCollectionsListViewController *)self metrics];
  unint64_t v10 = [v9 deleteActionColor];
  [v8 setBackgroundColor:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (id)hideSwipeAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NSBundle mainBundle];
  int64_t v6 = [v5 localizedStringForKey:@"Hide" value:&stru_100A70340 table:0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001ADAFC;
  v12[3] = &unk_100A49F48;
  objc_copyWeak(&v14, &location);
  id v7 = v4;
  id v13 = v7;
  unint64_t v8 = +[UIContextualAction contextualActionWithStyle:0 title:v6 handler:v12];
  unsigned int v9 = [(BKLibraryCollectionsListViewController *)self metrics];
  unint64_t v10 = [v9 hideActionColor];
  [v8 setBackgroundColor:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (void)endTextEditAnimationComplete
{
  BOOL v3 = [(BKLibraryCollectionsListViewController *)self view];
  [v3 setUserInteractionEnabled:1];

  [(BKLibraryCollectionsListViewController *)self setTextEntryIndexPath:0];
  [(BKLibraryCollectionsListViewController *)self setTextEntryCollection:0];
  if (self->_endTextEditingMeansEndEditMode)
  {
    self->_endTextEditingMeansEndEditMode = 0;
    [(BKLibraryCollectionsListViewController *)self setEditing:0 animated:1];
  }
}

- (void)animateEndTextEditCollections
{
  if ([(BKLibraryCollectionsListViewController *)self isEditing]
    && [(BKLibraryCollectionsListViewController *)self isTextEditing])
  {
    self->_textEditing = 0;
    BOOL v3 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
    id v4 = [v3 textEntryField];
    id v5 = [v4 text];
    id v6 = [v5 length];

    id v7 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
    [v7 removeTextEntryField];

    [(BKLibraryCollectionsListViewController *)self setTextEntryCell:0];
    unint64_t v8 = [(BKLibraryCollectionsListViewController *)self textEntryCollection];

    if (v8 || v6)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      unsigned int v9 = [(BKLibraryCollectionsListViewController *)self tableView];
      unint64_t v10 = [(BKLibraryCollectionsListViewController *)self textEntryIndexPath];
      double v12 = v10;
      unsigned __int8 v11 = +[NSArray arrayWithObjects:&v12 count:1];
      [v9 reloadRowsAtIndexPaths:v11 withRowAnimation:5];

      +[CATransaction commit];
    }
    else
    {
      self->_endEditingMeansTableReload = 1;
    }
    [(BKLibraryCollectionsListViewController *)self endTextEditAnimationComplete];
  }
}

- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v6])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unint64_t v8 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v6];
    unsigned __int8 v7 = [v8 allowsManualAddition];
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v6 section] == (id)1 || !objc_msgSend(v6, "section"))
  {
    unsigned __int8 v7 = [(BKLibraryCollectionsListViewController *)self delegate];

    if (v7)
    {
      unint64_t v8 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v6];
      if (v8)
      {
        if ([(BKLibraryCollectionsListViewController *)self isAddingToCollection])
        {
          [(BKLibraryCollectionsListViewController *)self _addSelectedToIndexPath:v6];
        }
        else
        {
          unsigned int v9 = [(BKLibraryCollectionsListViewController *)self delegate];
          [v9 collectionListView:self collectionSelected:v8];

          [v10 deselectRowAtIndexPath:v6 animated:0];
        }
      }
    }
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (([v6 hasActiveDrag] & 1) == 0)
  {
    unint64_t v8 = v7;
    if (([v6 hasActiveDrop] & 1) == 0)
    {
      if ([(BKLibraryCollectionsListViewController *)self isEditing])
      {
        unsigned int v9 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
        id v10 = [v9 textEntryField];
        unsigned int v11 = [v10 isFirstResponder];

        if (v11)
        {
          [(BKLibraryCollectionsListViewController *)self stopEditButtonPressed:self];
        }
        else if ([(BKLibraryCollectionsListViewController *)self isTextEditing])
        {
          [(BKLibraryCollectionsListViewController *)self endTextEditing];
        }
        else if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v7] {
               || [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v7])
        }
        {
          [(BKLibraryCollectionsListViewController *)self _beginEditingUserCollectionAtIndexPath:v7];
        }
        goto LABEL_17;
      }
      if ([(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v7])
      {
        [(BKLibraryCollectionsListViewController *)self addCollection:self];
LABEL_17:
        unint64_t v8 = 0;
        id v14 = v7;
LABEL_18:

        goto LABEL_19;
      }
      unint64_t v8 = v7;
      if ([(BKLibraryCollectionsListViewController *)self _indexPathIsPrefix:v7])
      {
        id v12 = [v7 row];
        unint64_t v8 = v7;
        if ((id)[(BKLibraryCollectionsListViewController *)self _numberOfPrefixRows] > v12)
        {
          id v13 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
          id v14 = [v13 objectAtIndex:v12];

          if ([(BKLibraryCollectionsListViewController *)self isSelectionEnabledForCollection:v14])
          {
            unint64_t v8 = v7;
          }
          else
          {

            unint64_t v8 = 0;
          }
          goto LABEL_18;
        }
      }
    }
  }
LABEL_19:

  return v8;
}

- (void)releaseAllRecomputableMemory
{
  [(BKLibraryCollectionsListViewController *)self setPrefixCollections:0];
  [(BKLibraryCollectionsListViewController *)self setCollectionAssetCounts:0];

  [(BKLibraryCollectionsListViewController *)self setIconCache:0];
}

- (void)didReceiveMemoryWarning
{
  [(BKLibraryCollectionsListViewController *)self releaseAllRecomputableMemory];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryCollectionsListViewController;
  [(BKLibraryCollectionsListViewController *)&v3 didReceiveMemoryWarning];
}

- (void)scrollToIndexPath:(id)a3
{
}

- (void)scrollToIndexPath:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001AE244;
  v8[3] = &unk_100A47A00;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  BOOL v11 = a4;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:UIKeyboardFrameEndUserInfoKey];
  id v6 = v5;
  if (v5)
  {
    [v5 CGRectValue];
    double x = v7;
    double y = v9;
    double width = v11;
    double height = v13;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  id v15 = [(BKLibraryCollectionsListViewController *)self view];
  [v15 convertRect:0 fromView:x y:y width:width height:height];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = [v4 valueForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v25 = [v24 integerValue];

  uint64_t v26 = [v4 valueForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v26 doubleValue];
  double v28 = v27;

  -[BKLibraryCollectionsListViewController setKeyboardFrame:](self, "setKeyboardFrame:", v17, v19, v21, v23);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001AE510;
  v30[3] = &unk_100A43D60;
  v30[4] = self;
  +[UIView animateWithDuration:(void)v25 << 16 delay:v30 options:0 animations:v28 completion:0.0];
  id v29 = [(BKLibraryCollectionsListViewController *)self textEntryIndexPath];
  [(BKLibraryCollectionsListViewController *)self scrollToIndexPath:v29];
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 valueForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v6 = [v5 integerValue];

  double v7 = [v4 valueForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v7 doubleValue];
  double v9 = v8;

  -[BKLibraryCollectionsListViewController setKeyboardFrame:](self, "setKeyboardFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001AE630;
  v10[3] = &unk_100A43D60;
  void v10[4] = self;
  +[UIView animateWithDuration:(void)v6 << 16 delay:v10 options:0 animations:v9 completion:0.0];
}

- (void)keyboardDidHide:(id)a3
{
  id v4 = [(BKLibraryCollectionsListViewController *)self postKeyboardIndexPath];

  if (v4)
  {
    id v5 = [(BKLibraryCollectionsListViewController *)self postKeyboardIndexPath];
    [(BKLibraryCollectionsListViewController *)self scrollToIndexPath:v5];

    [(BKLibraryCollectionsListViewController *)self setPostKeyboardIndexPath:0];
  }
}

- (id)_iconForIndexPath:(id)a3 metrics:(id)a4 pointSize:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v8]
    && ![(BKLibraryCollectionsListViewController *)self isTextEditing])
  {
    id v12 = [v9 collectionIconName_Add];
  }
  else
  {
    id v10 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v8];
    double v11 = [v10 collectionID];
    id v12 = [(BKLibraryCollectionsListViewController *)self _iconNameForCollectionID:v11 metrics:v9];
  }
  id v13 = v12;
  if (v13)
  {
    id v14 = [(BKLibraryCollectionsListViewController *)self iconCache];
    uint64_t v15 = [v14 objectForKey:v13];
    if (v15)
    {
      double v16 = (void *)v15;
    }
    else
    {
      uint64_t v33 = +[BSUITemplate manager];
      double v17 = [v33 imageResourceCache];
      double v18 = [(BKLibraryCollectionsListViewController *)self view];
      double v19 = [v18 _screen];
      [v19 scale];
      LOBYTE(v32) = 1;
      double v21 = [v17 symbolImageWithName:v13 compatibleWithFontSize:4 weight:3 scale:0 renderingMode:0 colors:a5 style:v20 contentsScale:v32 layoutDirection:UIEdgeInsetsZero.top layoutDirection:UIEdgeInsetsZero.left layoutDirection:UIEdgeInsetsZero.bottom layoutDirection:UIEdgeInsetsZero.right baseline:0];
      id v22 = [v21 newImageWithoutContentInsets];

      if (!v22)
      {
        double v23 = BSUIBundle();
        uint64_t v24 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:a5];
        id v22 = +[UIImage imageNamed:v13 inBundle:v23 withConfiguration:v24];
      }
      [v9 collectionGlyphPointSize];
      [v9 collectionIconSize];
      CGSizeScale();
      double v26 = v25;
      double v28 = v27;
      id v29 = +[UIColor systemBlackColor];
      id v30 = +[UIImage im_imageWithCenteredIconImage:iconColor:size:](UIImage, "im_imageWithCenteredIconImage:iconColor:size:", v22, v29, v26, v28);

      double v16 = [v30 imageWithRenderingMode:2];

      if (v16)
      {
        if (!v14)
        {
          id v14 = objc_alloc_init((Class)NSMutableDictionary);
          [(BKLibraryCollectionsListViewController *)self setIconCache:v14];
        }
        [v14 setObject:v16 forKey:v13];
      }
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (id)_iconColorForIndexPath:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v6]
    && ![(BKLibraryCollectionsListViewController *)self isTextEditing])
  {
    double v11 = [v7 collectionIconColor_Add];
  }
  else
  {
    id v8 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v6];
    id v9 = [v8 collectionID];
    if ([v9 isEqualToString:kBKCollectionDefaultIDBooks])
    {
      uint64_t v10 = [v7 collectionIconColor_Books];
    }
    else if ([v9 isEqualToString:kBKCollectionDefaultIDAudiobooks])
    {
      uint64_t v10 = [v7 collectionIconColor_Audiobooks];
    }
    else if ([v9 isEqualToString:kBKCollectionDefaultIDPDFs])
    {
      uint64_t v10 = [v7 collectionIconColor_PDFs];
    }
    else if ([v9 isEqualToString:kBKCollectionDefaultIDDownloaded])
    {
      uint64_t v10 = [v7 collectionIconColor_Downloaded];
    }
    else if ([v9 isEqualToString:kBKCollectionDefaultIDWantToRead] {
           || [v9 isEqualToString:kBKCollectionDefaultIDSamples])
    }
    {
      uint64_t v10 = [v7 collectionIconColor_WantToRead];
    }
    else
    {
      if ([v9 isEqualToString:kBKCollectionDefaultIDFinished]) {
        [v7 collectionIconColor_Finished];
      }
      else {
      uint64_t v10 = [v7 collectionIconColor_User];
      }
    }
    double v11 = (void *)v10;
  }

  return v11;
}

- (id)_iconNameForCollectionID:(id)a3 metrics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:kBKCollectionDefaultIDBooks])
  {
    uint64_t v7 = [v6 collectionIconName_Books];
  }
  else if ([v5 isEqualToString:kBKCollectionDefaultIDWantToRead])
  {
    uint64_t v7 = [v6 collectionIconName_WantToRead];
  }
  else if ([v5 isEqualToString:kBKCollectionDefaultIDSamples])
  {
    uint64_t v7 = [v6 collectionIconName_Samples];
  }
  else if ([v5 isEqualToString:kBKCollectionDefaultIDAudiobooks])
  {
    uint64_t v7 = [v6 collectionIconName_Audiobooks];
  }
  else if ([v5 isEqualToString:kBKCollectionDefaultIDPDFs])
  {
    uint64_t v7 = [v6 collectionIconName_PDFs];
  }
  else if ([v5 isEqualToString:kBKCollectionDefaultIDDownloaded])
  {
    uint64_t v7 = [v6 collectionIconName_Downloaded];
  }
  else
  {
    if ([v5 isEqualToString:kBKCollectionDefaultIDFinished]) {
      [v6 collectionIconName_Finished];
    }
    else {
    uint64_t v7 = [v6 collectionIconName_User];
    }
  }
  id v8 = (void *)v7;

  return v8;
}

- (unint64_t)_numberOfPrefixRows
{
  v2 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)_numberOfUserRows
{
  v2 = [(BKLibraryCollectionsListViewController *)self userCollections];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)_indexPathForCollectionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BKLibraryCollectionsListViewController *)self userCollections];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001AEF14;
    v17[3] = &unk_100A49F70;
    id v6 = v4;
    id v18 = v6;
    id v7 = [v5 indexOfObjectPassingTest:v17];

    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      id v14 = sub_1001AEF58;
      uint64_t v15 = &unk_100A49F70;
      id v16 = v6;
      id v9 = [v8 indexOfObjectPassingTest:&v12];

      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0, v12, v13, v14, v15);
      }
    }
    else
    {
      uint64_t v10 = +[NSIndexPath indexPathForRow:[(BKLibraryCollectionsListViewController *)self _rowForUserCollectionIndex:v7] inSection:1];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_indexPathForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryCollectionsListViewController *)self userCollections];
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
    id v8 = [v7 indexOfObject:v4];

    unint64_t v9 = (unint64_t)v8;
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v9 = [(BKLibraryCollectionsListViewController *)self _rowForUserCollectionIndex:v6];
    uint64_t v10 = 1;
  }
  double v11 = +[NSIndexPath indexPathForRow:v9 inSection:v10];

  return v11;
}

- (unint64_t)_collectionIndexForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsPrefix:v4]
    || [(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v4])
  {
    unint64_t v5 = (unint64_t)[v4 row];
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)_collectionForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    if ([(BKLibraryCollectionsListViewController *)self _indexPathIsPrefix:v4])
    {
      id v7 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
      id v8 = [v7 count];

      if (v6 < (unint64_t)v8)
      {
        unint64_t v9 = [(BKLibraryCollectionsListViewController *)self prefixCollections];
LABEL_7:
        uint64_t v10 = v9;
        double v11 = [v9 objectAtIndex:v6];

        goto LABEL_9;
      }
    }
    if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v4])
    {
      unint64_t v9 = [(BKLibraryCollectionsListViewController *)self userCollections];
      goto LABEL_7;
    }
  }
  double v11 = 0;
LABEL_9:

  return v11;
}

- (unint64_t)_rowForUserCollectionIndex:(unint64_t)a3
{
  return a3;
}

- (BOOL)_indexPathIsPrefix:(id)a3
{
  return [a3 section] == 0;
}

- (BOOL)_indexPathIsUser:(id)a3
{
  id v4 = a3;
  if ([v4 section] == (id)1)
  {
    id v5 = [v4 row];
    BOOL v6 = v5 < (id)[(BKLibraryCollectionsListViewController *)self _numberOfUserRows];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_indexPathIsNewCollection:(id)a3
{
  id v4 = a3;
  if ([v4 section] == (id)1)
  {
    id v5 = (char *)[v4 row];
    BOOL v6 = v5 == (char *)[(BKLibraryCollectionsListViewController *)self _numberOfUserRows] + 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfNewCollectionButtonRows
{
  return [(BKLibraryCollectionsListViewController *)self wantsAddCollectionRow];
}

- (BOOL)_viewFrameIncludesStatusBar
{
  return isPad() ^ 1;
}

- (void)_setSelectionState:(BOOL)a3 cell:(id)a4 atIndexPath:(id)a5
{
  if (a3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [a4 setAccessoryType:v5];
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v52 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = BUDynamicCast();
  id v8 = [(BKLibraryCollectionsListViewController *)self metrics];
  [v7 setMetrics:v8];
  unint64_t v9 = [v52 textLabel];
  uint64_t v10 = [v52 detailTextLabel];
  [(BKLibraryCollectionsListViewController *)self _setSelectionState:0 cell:v52 atIndexPath:v6];
  [v52 setSelected:0];
  if ([v6 section] != (id)1 && objc_msgSend(v6, "section"))
  {
    BOOL v11 = 0;
    goto LABEL_32;
  }
  unsigned int v48 = [(BKLibraryCollectionsListViewController *)self isEditing];
  id v12 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v6];
  unsigned int v50 = v10;
  if (v12)
  {
    uint64_t v13 = [(BKLibraryCollectionsListViewController *)self textEntryCollection];
    if (v13 == v12)
    {
      unsigned __int8 v15 = [(BKLibraryCollectionsListViewController *)self isTextEditing];

      if (v15)
      {
        id v14 = 0;
LABEL_11:
        [v52 setUserInteractionEnabled:[self isSelectionEnabledForCollection:v12]];
        if ([(BKLibraryCollectionsListViewController *)self _indexPathIsPrefix:v6])
        {
          id v16 = [v12 hidden];
          if ([v16 BOOLValue]) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = [v52 isUserInteractionEnabled] ^ 1;
          }
          unsigned int v47 = v17;
        }
        else
        {
          unsigned int v47 = 0;
        }
        unint64_t v18 = [(BKLibraryCollectionsListViewController *)self p_assetCountForCollection:v12];
        if (v18)
        {
          unint64_t v19 = v18;
          double v20 = +[NSBundle mainBundle];
          [v20 localizedStringForKey:@"%lu" value:&stru_100A70340 table:0];
          double v21 = v8;
          double v23 = v22 = v14;

          id v49 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v19);

          id v14 = v22;
          id v8 = v21;
          uint64_t v10 = v50;
        }
        else
        {
          id v49 = 0;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
    id v14 = [v12 localizedTitle];
    goto LABEL_11;
  }
  id v49 = 0;
  id v14 = 0;
  unsigned int v47 = 0;
LABEL_20:
  char v51 = v12;
  if ([(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v6]
    && ![(BKLibraryCollectionsListViewController *)self isTextEditing])
  {
    uint64_t v24 = +[NSBundle mainBundle];
    uint64_t v25 = [v24 localizedStringForKey:@"New Collection…" value:&stru_100A70340 table:0];

    [v52 setUserInteractionEnabled:v48 ^ 1];
    unsigned int v47 = [v52 isUserInteractionEnabled] ^ 1;
    id v14 = (void *)v25;
  }
  id v44 = v14;
  [v9 setText:v14];
  double v26 = [v52 imageView];
  id v45 = v9;
  double v27 = [v9 font];
  [v27 pointSize];
  double v28 = -[BKLibraryCollectionsListViewController _iconForIndexPath:metrics:pointSize:](self, "_iconForIndexPath:metrics:pointSize:", v6, v8);
  [v26 setImage:v28];

  id v29 = [(BKLibraryCollectionsListViewController *)self _iconColorForIndexPath:v6 metrics:v8];
  [v26 setTintColor:v29];

  [v10 setText:v49];
  v46 = v7;
  id v30 = [v7 chevron];
  uint64_t v31 = [v8 chevronFontAttributes];
  uint64_t v32 = [v31 font];
  BOOL v33 = 1;
  v34 = +[UIImageSymbolConfiguration configurationWithFont:v32 scale:1];

  id v35 = [v8 chevronName];
  id v36 = +[UIImage systemImageNamed:v35];
  v37 = [v36 imageWithConfiguration:v34];

  [v30 setImage:v37];
  objc_super v38 = [v8 chevronFontAttributes];
  id v39 = [v38 foregroundColor];
  [v30 setTintColor:v39];

  if (![(BKLibraryCollectionsListViewController *)self isAddingToCollection]) {
    BOOL v33 = [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v6];
  }
  [v30 setHidden:v33];
  double v40 = 1.0;
  if (v48) {
    double v40 = 0.0;
  }
  [v50 setAlpha:v40];
  v41 = [(BKLibraryCollectionsListViewController *)self selectedCollection];

  if (v51)
  {
    if (v41)
    {
      v42 = [(BKLibraryCollectionsListViewController *)self selectedCollection];
      unsigned int v43 = [v42 isEqualToCollection:v51];

      if (v43) {
        [(BKLibraryCollectionsListViewController *)self _setSelectionState:1 cell:v52 atIndexPath:v6];
      }
    }
  }

  BOOL v11 = v47 != 0;
  unint64_t v9 = v45;
  id v7 = v46;
  uint64_t v10 = v50;
LABEL_32:
  [v7 setDimmed:v11];
  [v7 setAccessibilityDelegate:self];
}

- (id)_addCollectionIndexPath
{
  unint64_t v2 = [(BKLibraryCollectionsListViewController *)self _numberOfUserRows];

  return +[NSIndexPath indexPathForRow:v2 inSection:1];
}

- (BOOL)_isAddCollectionIndexPath:(id)a3
{
  id v4 = a3;
  if ([(BKLibraryCollectionsListViewController *)self wantsAddCollectionRow])
  {
    uint64_t v5 = [(BKLibraryCollectionsListViewController *)self _addCollectionIndexPath];
    unsigned __int8 v6 = [v4 isEqual:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_addSelectedToIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v60 = v4;
    uint64_t v5 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v5 rectForRowAtIndexPath:v60];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    id v14 = [(BKLibraryCollectionsListViewController *)self tableView];
    unsigned __int8 v15 = [(BKLibraryCollectionsListViewController *)self view];
    [v14 convertRect:v15 toView:v7];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    uint64_t v24 = [(BKLibraryCollectionsListViewController *)self _collectionForIndexPath:v60];
    uint64_t v25 = [(BKLibraryCollectionsListViewController *)self assetIDs];
    if ([v25 count])
    {
      unint64_t v26 = 0;
      uint64_t v64 = kBKCollectionDefaultIDWantToRead;
      uint64_t v61 = kBKCollectionDefaultIDFinished;
      v65 = v24;
      v66 = self;
      id v63 = v25;
      while (1)
      {
        uint64_t v27 = [(BKLibraryCollectionsListViewController *)self ba_effectiveAnalyticsTracker];
        double v28 = [v25 objectAtIndexedSubscript:v26];
        id v29 = [(BKLibraryCollectionsListViewController *)self knownAssetTypes];
        v70 = (void *)v27;
        unint64_t v67 = v26;
        if ((unint64_t)[v29 count] <= v26)
        {
          uint64_t v31 = 0;
        }
        else
        {
          id v30 = [(BKLibraryCollectionsListViewController *)self knownAssetTypes];
          uint64_t v31 = [v30 objectAtIndexedSubscript:v26];
        }
        uint64_t v32 = [(BKLibraryCollectionsListViewController *)self knownStoreAssetIDs];
        unsigned int v33 = [v32 containsObject:v28];

        uint64_t v34 = 1;
        if (!v33) {
          uint64_t v34 = 2;
        }
        uint64_t v71 = v34;
        v69 = v31;
        id v35 = v31
            ? +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", [v31 integerValue]): 0;
        id v36 = +[BKAppDelegate delegate];
        v37 = [v36 libraryAssetProvider];

        objc_super v38 = [v37 libraryAssetOnMainQueueWithAssetID:v28];
        id v39 = [v38 supplementalContentAssets];
        id v72 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v39 count]);

        double v40 = +[BAEventReporter sharedReporter];
        id v41 = [v40 seriesTypeForContentID:v28];

        v68 = v37;
        if ([v38 isAudiobook])
        {
          v42 = [v38 hasRACSupport];
          uint64_t v43 = [v42 BOOLValue] ? 1 : 2;
        }
        else
        {
          uint64_t v43 = 0;
        }
        id v44 = +[BAEventReporter sharedReporter];
        [v24 collectionID];
        v46 = id v45 = v24;
        id v47 = v41;
        [v44 emitAddToCollectionEventWithTracker:v70 collectionID:v46 contentID:v28 contentAcquisitionType:v71 contentType:v35 supplementalContentCount:v72 seriesType:v41 productionType:v43];

        unsigned int v48 = [v45 collectionID];
        LODWORD(v46) = [v48 isEqualToString:v64];

        if (v46) {
          break;
        }
        uint64_t v62 = v43;
        v56 = [v45 collectionID];
        unsigned int v57 = [v56 isEqualToString:v61];

        uint64_t v25 = v63;
        v53 = v38;
        id v54 = v68;
        unint64_t v55 = v67;
        if (v57)
        {
          char v51 = +[BAEventReporter sharedReporter];
          [v51 emitMarkAsFinishedEventWithTracker:v70 contentID:v28 contentAcquisitionType:v71 contentType:v35 supplementalContentCount:v72 seriesType:v47 productionType:v62];
          goto LABEL_22;
        }
LABEL_23:

        unint64_t v26 = v55 + 1;
        uint64_t v24 = v65;
        self = v66;
        if (v26 >= (unint64_t)[v25 count]) {
          goto LABEL_24;
        }
      }
      id v49 = +[BAEventReporter sharedReporter];
      [v49 emitWantListAddEventWithTracker:v70 contentID:v28 contentAcquisitionType:v71 contentType:v35 supplementalContentCount:v72 seriesType:v41 productionType:v43];

      unsigned int v50 = +[BKAppDelegate delegate];
      char v51 = [v50 engagementManager];

      id v52 = [v51 sessionDonor];
      [v52 reportAddToWTRButtonUsed];

      uint64_t v25 = v63;
      v53 = v38;
      id v54 = v68;
      unint64_t v55 = v67;
LABEL_22:

      goto LABEL_23;
    }
LABEL_24:
    id v58 = [(BKLibraryCollectionsListViewController *)self delegate];
    id v59 = [(BKLibraryCollectionsListViewController *)self knownAssetTypes];
    [v58 collectionListView:self addSelectedAssetIDs:v25 toCollection:v24 knownAssetTypes:v59 animationDestination:v17 v19 v21 v23];

    id v4 = v60;
  }
}

- (void)_beginEditingUserCollectionAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKLibraryCollectionsListViewController *)self _collectionIndexForIndexPath:v4];
  if ([(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v4])
  {
    double v6 = [(BKLibraryCollectionsListViewController *)self userCollections];
    id v7 = [v6 count];

    if ((unint64_t)v7 > v5)
    {
      double v8 = [(BKLibraryCollectionsListViewController *)self userCollections];
      double v9 = [v8 objectAtIndex:v5];

      [(BKLibraryCollectionsListViewController *)self setTextEntryCollection:v9];
      [(BKLibraryCollectionsListViewController *)self setTextEntryIndexPath:v4];
      self->_textEditing = 1;
      [(BKLibraryCollectionsListViewController *)self tableView];
      double v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unsigned __int8 v15 = sub_1001AFFB4;
      double v16 = &unk_100A43DD8;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = v4;
      id v10 = v17;
      [v10 performBatchUpdates:&v13 completion:0];
      double v11 = [(BKLibraryCollectionsListViewController *)self textEntryCell];
      double v12 = [v11 textEntryField];
      [v12 becomeFirstResponder];
    }
  }
}

- (id)p_currentPopoverPresentationController
{
  if ([(BKLibraryCollectionsListViewController *)self _isInPopoverPresentation]&& (id v3 = self) != 0)
  {
    id v4 = v3;
    while (1)
    {
      unint64_t v5 = [(BKLibraryCollectionsListViewController *)v4 popoverPresentationController];

      if (v5) {
        break;
      }
      double v6 = [(BKLibraryCollectionsListViewController *)v4 parentViewController];

      id v4 = v6;
      if (!v6) {
        goto LABEL_9;
      }
    }
    double v6 = [(BKLibraryCollectionsListViewController *)v4 popoverPresentationController];
  }
  else
  {
    double v6 = 0;
  }
LABEL_9:

  return v6;
}

- (void)p_updatePopoverFromMetricsIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    unint64_t v5 = [(BKLibraryCollectionsListViewController *)self p_currentPopoverPresentationController];
    if (v5)
    {
      double v6 = [v7 popoverBackgroundColor];
      [v5 setBackgroundColor:v6];
    }
    id v4 = v7;
  }
}

- (void)p_updateTableViewFromMetrics:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [v4 tableBackgroundColor];
    double v6 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v6 setBackgroundColor:v5];

    id v7 = [v4 tableSeparatorColor];
    double v8 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v8 setSeparatorColor:v7];

    double v9 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v9 separatorInset];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    [v4 collectionIconSize];
    double v17 = v16 + 16.0 + 8.0;
    id v18 = [(BKLibraryCollectionsListViewController *)self tableView];
    [v18 setSeparatorInset:v11, v17, v13, v15];

    id v20 = [v4 tableSeparatorColor];

    double v19 = [(BKLibraryCollectionsListViewController *)self headerSeparatorView];
    [v19 setBackgroundColor:v20];
  }
}

- (void)setMetrics:(id)a3
{
  unint64_t v5 = (BKLibraryCollectionsListMetrics *)a3;
  if (self->_metrics != v5)
  {
    objc_storeStrong((id *)&self->_metrics, a3);
    [(BKLibraryCollectionsListViewController *)self setIconCache:0];
    [(BKLibraryCollectionsListViewController *)self p_updatePopoverFromMetricsIfNeeded:v5];
    [(BKLibraryCollectionsListViewController *)self p_updateTableViewFromMetrics:v5];
    [(BKLibraryCollectionsListViewController *)self _updateBarButtonsAnimated:0];
    double v6 = [(BKLibraryCollectionsListViewController *)self tableView];
    id v7 = [v6 indexPathsForVisibleRows];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B03D0;
    v9[3] = &unk_100A49F98;
    id v10 = v6;
    double v11 = self;
    double v12 = v5;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:v9];
  }
}

- (void)_analyticsSubmitBrowseCollectionScreenViewEventWithTracker:(id)a3
{
  id v40 = a3;
  id v3 = objc_opt_new();
  id v41 = +[BKLibraryManager defaultManager];
  id v4 = [v41 collectionProvider];
  unint64_t v5 = [v4 selectableDefaultCollections];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v12 = objc_alloc((Class)BACollectionIDData);
        double v13 = [v11 collectionID];
        double v14 = [v11 members];
        id v15 = [v12 initWithCollectionID:v13 collectionMemberCount:[v14 count]];

        [v3 addObject:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v8);
  }

  double v16 = [v41 uiChildContext];
  id v17 = objc_alloc_init((Class)NSFetchRequest);
  id v18 = +[NSEntityDescription entityForName:@"BKCollection" inManagedObjectContext:v16];
  [v17 setEntity:v18];

  id v19 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:1];
  id v51 = v19;
  id v20 = +[NSArray arrayWithObjects:&v51 count:1];
  [v17 setSortDescriptors:v20];

  double v21 = +[BKCollection predicateForNonDeletedUserCollections];
  [v17 setPredicate:v21];

  id v22 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v17 managedObjectContext:v16 sectionNameKeyPath:0 cacheName:0];
  if ([v22 performFetch:0])
  {
    id v37 = v17;
    objc_super v38 = v16;
    double v23 = [v22 fetchedObjects];
    uint64_t v24 = +[NSMutableArray arrayWithArray:v23];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v25 = v24;
    id v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          id v31 = objc_alloc((Class)BACollectionIDData);
          uint64_t v32 = [v30 collectionID];
          unsigned int v33 = [v30 members];
          id v34 = [v31 initWithCollectionID:v32 collectionMemberCount:[v33 count]];

          [v3 addObject:v34];
        }
        id v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v27);
    }

    id v17 = v37;
    double v16 = v38;
  }
  id v35 = [objc_alloc((Class)BACollectionSummaryData) initWithCollectionSummary:v3];
  id v36 = +[BAEventReporter sharedReporter];
  [v36 emitBrowseCollectionScreenViewEventWithTracker:v40 startDate:self->_analyticsAppearDate summaryData:v35];
}

- (BOOL)bkaxIsCustomCollectionCell:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  LOBYTE(self) = [(BKLibraryCollectionsListViewController *)self _indexPathIsUser:v6];
  return (char)self;
}

- (BOOL)bkaxIsButton:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  LOBYTE(self) = [(BKLibraryCollectionsListViewController *)self _isAddCollectionIndexPath:v6];
  return (char)self;
}

- (BOOL)bkaxIsLastCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v6 = (char *)[v5 numberOfSections] - 1;

  id v7 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v8 = (char *)[v7 numberOfRowsInSection:v6] - 1;

  uint64_t v9 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v10 = [v9 indexPathForCell:v4];

  BOOL v11 = [v10 row] == v8 && [v10 section] == v6;
  return v11;
}

- (void)bkaxPerformHide:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  id v6 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v7 = [v6 indexPathForCell:v4];

  id v8 = objc_loadWeakRetained(&location);
  [v8 _concludeHide:1 atIndexPath:v7];

  objc_destroyWeak(&location);
}

- (void)bkaxPerformShow:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  id v6 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v7 = [v6 indexPathForCell:v4];

  id v8 = objc_loadWeakRetained(&location);
  [v8 _concludeHide:0 atIndexPath:v7];

  objc_destroyWeak(&location);
}

- (void)bkaxPerformRename:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  id v6 = [(BKLibraryCollectionsListViewController *)self tableView];
  id v7 = [v6 indexPathForCell:v4];

  id v8 = objc_loadWeakRetained(&location);
  [v8 _beginEditingUserCollectionAtIndexPath:v7];

  objc_destroyWeak(&location);
}

- (BOOL)bkaxDidPerformEscape:(id)a3
{
  return [(BKLibraryCollectionsListViewController *)self accessibilityPerformEscape];
}

- (BOOL)accessibilityPerformEscape
{
  if ([(BKLibraryCollectionsListViewController *)self isEditing])
  {
    [(BKLibraryCollectionsListViewController *)self stopEditButtonPressed:0];
    id v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Ended editing" value:&stru_100A70340 table:0];

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v4);
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKLibraryCollectionsListViewController;
    return [(BKLibraryCollectionsListViewController *)&v6 accessibilityPerformEscape];
  }
}

- (BKLibraryManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (BKLibraryCollectionsListViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryCollectionsListViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKCollection)selectedCollection
{
  return self->_selectedCollection;
}

- (void)setSelectedCollection:(id)a3
{
}

- (BKLibraryCollectionsListMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)supressLargeTitle
{
  return self->_supressLargeTitle;
}

- (void)setSupressLargeTitle:(BOOL)a3
{
  self->_supressLargeTitle = a3;
}

- (BKLibraryBookshelfMetrics)bookshelfMetrics
{
  return self->_bookshelfMetrics;
}

- (BOOL)isTextEditing
{
  return self->_textEditing;
}

- (BOOL)wantsAddCollectionRow
{
  return self->_wantsAddCollectionRow;
}

- (void)setUserCollections:(id)a3
{
}

- (NSMutableDictionary)collectionAssetCounts
{
  return self->_collectionAssetCounts;
}

- (void)setCollectionAssetCounts:(id)a3
{
}

- (void)setPrefixCollections:(id)a3
{
}

- (BOOL)includeHiddenInPrefixCollections
{
  return self->_includeHiddenInPrefixCollections;
}

- (void)setTableView:(id)a3
{
}

- (UIView)prefixFooterView
{
  return self->_prefixFooterView;
}

- (void)setPrefixFooterView:(id)a3
{
}

- (BOOL)containsSeriesContainer
{
  return self->_containsSeriesContainer;
}

- (void)setContainsSeriesContainer:(BOOL)a3
{
  self->_containsSeriesContainer = a3;
}

- (BOOL)showDivider
{
  return self->_showDivider;
}

- (void)setShowDivider:(BOOL)a3
{
  self->_showDivider = a3;
}

- (void)setNavBarEditButtonItem:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedTableViewReloadData
{
  return self->_coalescedTableViewReloadData;
}

- (void)setCoalescedTableViewReloadData:(id)a3
{
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (BCManagedObjectIDMonitor)prefixCollectionsMonitor
{
  return self->_prefixCollectionsMonitor;
}

- (void)setPrefixCollectionsMonitor:(id)a3
{
}

- (NSMutableDictionary)iconCache
{
  return self->_iconCache;
}

- (void)setIconCache:(id)a3
{
}

- (BOOL)changeIsUserDriven
{
  return self->_changeIsUserDriven;
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  self->_changeIsUserDriven = a3;
}

- (BOOL)isAddingToCollection
{
  return self->_isAddingToCollection;
}

- (void)setIsAddingToCollection:(BOOL)a3
{
  self->_isAddingToCollection = a3;
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (UIView)headerSeparatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerSeparatorView);

  return (UIView *)WeakRetained;
}

- (void)setHeaderSeparatorView:(id)a3
{
}

- (BKLibraryCollectionsListCell)textEntryCell
{
  return self->_textEntryCell;
}

- (void)setTextEntryCell:(id)a3
{
}

- (BKCollection)textEntryCollection
{
  return self->_textEntryCollection;
}

- (void)setTextEntryCollection:(id)a3
{
}

- (NSIndexPath)textEntryIndexPath
{
  return self->_textEntryIndexPath;
}

- (void)setTextEntryIndexPath:(id)a3
{
}

- (NSIndexPath)postKeyboardIndexPath
{
  return self->_postKeyboardIndexPath;
}

- (void)setPostKeyboardIndexPath:(id)a3
{
}

- (BOOL)endTextEditingMeansEndEditMode
{
  return self->_endTextEditingMeansEndEditMode;
}

- (void)setEndTextEditingMeansEndEditMode:(BOOL)a3
{
  self->_endTextEditingMeansEndEditMode = a3;
}

- (BOOL)suppressEditControlsForNewCollection
{
  return self->_suppressEditControlsForNewCollection;
}

- (void)setSuppressEditControlsForNewCollection:(BOOL)a3
{
  self->_suppressEditControlsForNewCollection = a3;
}

- (BOOL)endEditingMeansTableReload
{
  return self->_endEditingMeansTableReload;
}

- (void)setEndEditingMeansTableReload:(BOOL)a3
{
  self->_endEditingMeansTableReload = a3;
}

- (NSArray)assetIDs
{
  return self->_assetIDs;
}

- (void)setAssetIDs:(id)a3
{
}

- (NSArray)knownAssetTypes
{
  return self->_knownAssetTypes;
}

- (void)setKnownAssetTypes:(id)a3
{
}

- (NSHashTable)knownStoreAssetIDs
{
  return self->_knownStoreAssetIDs;
}

- (void)setKnownStoreAssetIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownStoreAssetIDs, 0);
  objc_storeStrong((id *)&self->_knownAssetTypes, 0);
  objc_storeStrong((id *)&self->_assetIDs, 0);
  objc_storeStrong((id *)&self->_postKeyboardIndexPath, 0);
  objc_storeStrong((id *)&self->_textEntryIndexPath, 0);
  objc_storeStrong((id *)&self->_textEntryCollection, 0);
  objc_storeStrong((id *)&self->_textEntryCell, 0);
  objc_destroyWeak((id *)&self->_headerSeparatorView);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_prefixCollectionsMonitor, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_coalescedTableViewReloadData, 0);
  objc_storeStrong((id *)&self->_navBarEditButtonItem, 0);
  objc_storeStrong((id *)&self->_prefixFooterView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_prefixCollections, 0);
  objc_storeStrong((id *)&self->_collectionAssetCounts, 0);
  objc_storeStrong((id *)&self->_userCollections, 0);
  objc_storeStrong((id *)&self->_bookshelfMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_selectedCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);

  objc_storeStrong((id *)&self->_analyticsAppearDate, 0);
}

@end