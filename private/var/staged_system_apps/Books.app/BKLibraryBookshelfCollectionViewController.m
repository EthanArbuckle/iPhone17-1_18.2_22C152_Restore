@interface BKLibraryBookshelfCollectionViewController
- (BKCollection)allBooksCollection;
- (BKCollection)collection;
- (BKLibraryBookshelfCollectionViewController)init;
- (BKLibraryBookshelfLayout)layout;
- (BKLibraryBookshelfSelectedActionBarViewController)actionBarViewController;
- (BKLibraryDataSourceAdaptor)dataSourceAdaptor;
- (BOOL)_isErrorFromUserCanceled:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)allowsOpeningBooks;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canSelectItemAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)coverAnimationHostIsFullyVisible:(id)a3;
- (BOOL)coverAnimationHostWantsScrollOnClose;
- (BOOL)coverEffectsNightMode;
- (BOOL)editableCollection;
- (BOOL)hasAnyDeletableBookSelected;
- (BOOL)hasAnySeriesContainerInLibraryAssets:(id)a3;
- (BOOL)hasAnySeriesContainerSelected;
- (BOOL)hasInitializedCollectionBackgroundColor;
- (BOOL)hasSelectedItems;
- (BOOL)isAudiobookAtIndexpath:(id)a3;
- (BOOL)isSeriesCollection;
- (BOOL)isSupplementalContentPDFPicker;
- (BOOL)preserveContentOffsetInNewLayout;
- (BOOL)reorderableCollection;
- (BOOL)shouldAccessibilityFocusCollectionViewUponAppearing;
- (BOOL)shouldAllowCellSelection;
- (BOOL)transitioningToNewLayout;
- (BOOL)ubiquityDeleteWarningShown;
- (BSUINavigationItem)bsuiNavigationItem;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGPoint)previousContentOffset;
- (NSArray)keyCommands;
- (NSArray)preferredFocusEnvironments;
- (NSArray)selectedBooks;
- (NSString)collectionID;
- (UIBarButtonItem)_readingListBackingButton;
- (UIBarButtonItem)navBarEditButtonItem;
- (UIBarButtonItem)navBarSelectAllButtonItem;
- (UIButton)_collectionBackingButton;
- (UICollectionView)collectionView;
- (UICollectionViewDragDelegate)dragDelegate;
- (UICollectionViewDropDelegate)dropDelegate;
- (UIView)wrapperView;
- (UIViewController)presentedReadingListPopover;
- (id)_contentDataForContentID:(id)a3 tracker:(id)a4;
- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForSelectedItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)_libraryAssetWithContentID:(id)a3;
- (id)_supplementalContentCount;
- (id)_transactionForStorePresentingAction;
- (id)addSelectedBooksCompletion;
- (id)bkaxLabel;
- (id)booksAtIndexPaths:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)coverAnimationHostSourceForItem:(id)a3;
- (id)coverEffectRTLOverride;
- (id)indexPathForCell:(id)a3;
- (id)navigationItem;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)_contentTypeForContentID:(id)a3 withLibraryAsset:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)dragAndDropSessionsActive;
- (unint64_t)coverEffectsContent;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addSelectedBooksToReadingList:(id)a3 completion:(id)a4;
- (void)_addToCollectionAttemptForItemsAtIndexPaths:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_bkAccessibilityFocusCollectionView;
- (void)_configureSupplementalContentPDFPicker;
- (void)_didChangePreferredContentSize:(id)a3;
- (void)_dismissIfSupplementContentPDFPicker;
- (void)_dismissOverlayViewController:(id)a3;
- (void)_downloadBook:(id)a3;
- (void)_downloadSample:(id)a3 completion:(id)a4;
- (void)_emitAllInSeriesViewEventIfNeeded;
- (void)_openBook:(id)a3 completion:(id)a4;
- (void)_openStoreSample:(id)a3;
- (void)_playPreview:(id)a3 completion:(id)a4;
- (void)_presentUsingBlock:(id)a3;
- (void)_refreshSeriesContainer:(id)a3;
- (void)_removalAttemptForItemsAtIndexPaths:(id)a3 sourceBarButtonItem:(id)a4;
- (void)_setCollectionViewSelectionFollowsFocus;
- (void)_showBooksInSectionAtIndexPath:(id)a3;
- (void)_showInternetReachabilityErrorAlert:(id)a3;
- (void)_showOverlayViewController:(id)a3;
- (void)_showPopoverViewController:(id)a3 fromItem:(id)a4;
- (void)addDoneButton:(BOOL)a3 forPresentationController:(id)a4;
- (void)addForSelectedItems:(id)a3;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityWillDisappear;
- (void)bc_environmentDidChangeFont;
- (void)bc_tabBarControllerWillSelectViewController:(id)a3;
- (void)bookTapped:(id)a3 completion:(id)a4;
- (void)books_open:(id)a3;
- (void)books_sortByAuthor:(id)a3;
- (void)books_sortByLastOpened:(id)a3;
- (void)books_sortByTitle:(id)a3;
- (void)books_sortManually:(id)a3;
- (void)books_viewAllInSeries:(id)a3;
- (void)books_viewAsGrid:(id)a3;
- (void)books_viewAsList:(id)a3;
- (void)books_viewOnlyPurchased:(id)a3;
- (void)cancelButtonPressed:(id)a3;
- (void)cancelDownloadBook:(id)a3;
- (void)changeSortModeTo:(unint64_t)a3;
- (void)changeViewModeTo:(unint64_t)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureForDragAndDropSession;
- (void)coverAnimationHostScrollToMakeVisible:(id)a3;
- (void)createSeriesViewControllerFromSeriesContainer:(BKLibraryAsset *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 completion:(id)a5;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deleteBooks:(id)a3 sourceBarButtonItem:(id)a4 completion:(id)a5;
- (void)deselectAll;
- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)didBecomeVisibleContentScrollView;
- (void)didUpdateLibraryBookshelfLayout:(id)a3;
- (void)directBuyTapped:(id)a3 buyParameters:(id)a4 completion:(id)a5;
- (void)dismissPDFPicker;
- (void)dismissPDFPicker:(id)a3;
- (void)dismissReadingListPopover;
- (void)doneButtonPressed:(id)a3;
- (void)doneForSelectedItems:(id)a3;
- (void)dragAndDropSessionDidEnd;
- (void)dragAndDropSessionDidStart;
- (void)editButtonPressed:(id)a3;
- (void)explicitContentRestrictedChanged;
- (void)largeTitleVisibilityDidChangeWithIsVisible:(BOOL)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openItemAtIndexPath:(id)a3 completion:(id)a4;
- (void)openSelectedBooks;
- (void)openSeriesContainer:(id)a3;
- (void)preferredContentSizeChanged:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentReadingListsPopoverFromItem:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)reloadData;
- (void)removeForSelectedItems;
- (void)removeForSelectedItems:(id)a3;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)resumeDownloadBook:(id)a3;
- (void)scrollToMakeLibraryAssetIDVisible:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)selectAllButtonPressed:(id)a3;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setActionBarViewController:(id)a3;
- (void)setAddSelectedBooksCompletion:(id)a3;
- (void)setAllBooksCollection:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSourceAdaptor:(id)a3;
- (void)setDragAndDropSessionsActive:(int64_t)a3;
- (void)setDragDelegate:(id)a3;
- (void)setDropDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHasInitializedCollectionBackgroundColor:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setNavBarEditButtonItem:(id)a3;
- (void)setNavBarSelectAllButtonItem:(id)a3;
- (void)setNeedsUpdateViewMode;
- (void)setPresentedReadingListPopover:(id)a3;
- (void)setPreserveContentOffsetInNewLayout:(BOOL)a3;
- (void)setPreviousContentOffset:(CGPoint)a3;
- (void)setShouldAccessibilityFocusCollectionViewUponAppearing:(BOOL)a3;
- (void)setTransitioningToNewLayout:(BOOL)a3;
- (void)setUbiquityDeleteWarningShown:(BOOL)a3;
- (void)setWrapperView:(id)a3;
- (void)set_collectionBackingButton:(id)a3;
- (void)set_readingListBackingButton:(id)a3;
- (void)shareSelectedItemFromBarButtonItem:(id)a3;
- (void)showReadingListsForActionHandler:(id)a3;
- (void)sortModeChanged;
- (void)toggleAccessibilityIfNeeded;
- (void)updateActionBarForSelection;
- (void)updateActionBarFromMetrics;
- (void)updateBarButtonsAnimated:(BOOL)a3;
- (void)updateBarButtonsForTraitChange;
- (void)updateSelectAllBarButton;
- (void)updateTabBarControllerForEditing:(BOOL)a3;
- (void)updateTitleFromMetrics;
- (void)updateViewModeIfNeeded;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewModeChanged;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKLibraryBookshelfCollectionViewController

- (BKLibraryBookshelfCollectionViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  v2 = [(BKLibraryBookshelfCollectionViewController *)&v8 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_didChangePreferredContentSize:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v4 = self;
    v9 = v4;
    v5 = +[NSArray arrayWithObjects:&v9 count:1];
    id v6 = [(BKLibraryBookshelfCollectionViewController *)v2 registerForTraitChanges:v5 withAction:"updateBarButtonsForTraitChange"];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  [(BKCollection *)self->_collection removeObserver:self forKeyPath:@"sortMode" context:off_100B1E538];
  [(BKCollection *)self->_collection removeObserver:self forKeyPath:@"localizedTitle" context:off_100B1E540];
  [(BKLibraryDataSourceAdaptor *)self->_dataSourceAdaptor removeObserver:self forKeyPath:@"currentStoreAccountID" context:off_100B1E548];
  [(BKCollection *)self->_allBooksCollection removeObserver:self forKeyPath:@"viewMode" context:off_100B1E550];
  collection = self->_collection;
  self->_collection = 0;

  dataSourceAdaptor = self->_dataSourceAdaptor;
  self->_dataSourceAdaptor = 0;

  allBooksCollection = self->_allBooksCollection;
  self->_allBooksCollection = 0;

  v7 = +[BURestrictionsProvider sharedInstance];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v8 dealloc];
}

- (id)navigationItem
{
  bsuiNavigationItem = self->_bsuiNavigationItem;
  if (!bsuiNavigationItem)
  {
    id v4 = objc_alloc((Class)BSUINavigationItem);
    v5 = [(BKLibraryBookshelfCollectionViewController *)self title];
    id v6 = (BSUINavigationItem *)[v4 initWithTitle:v5];
    v7 = self->_bsuiNavigationItem;
    self->_bsuiNavigationItem = v6;

    bsuiNavigationItem = self->_bsuiNavigationItem;
  }

  return bsuiNavigationItem;
}

- (void)setCollection:(id)a3
{
  v5 = (BKCollection *)a3;
  p_collection = &self->_collection;
  collection = self->_collection;
  if (collection != v5)
  {
    objc_super v8 = v5;
    [(BKCollection *)collection removeObserver:self forKeyPath:@"sortMode" context:off_100B1E538];
    [(BKCollection *)*p_collection removeObserver:self forKeyPath:@"localizedTitle" context:off_100B1E540];
    objc_storeStrong((id *)&self->_collection, a3);
    [(BKCollection *)*p_collection addObserver:self forKeyPath:@"sortMode" options:0 context:off_100B1E538];
    [(BKCollection *)*p_collection addObserver:self forKeyPath:@"localizedTitle" options:0 context:off_100B1E540];
    v5 = v8;
  }
}

- (void)setDataSourceAdaptor:(id)a3
{
  v5 = (BKLibraryDataSourceAdaptor *)a3;
  dataSourceAdaptor = self->_dataSourceAdaptor;
  if (dataSourceAdaptor != v5)
  {
    v16 = v5;
    [(BKLibraryDataSourceAdaptor *)dataSourceAdaptor removeObserver:self forKeyPath:@"currentStoreAccountID" context:off_100B1E548];
    [(BKCollection *)self->_allBooksCollection removeObserver:self forKeyPath:@"viewMode" context:off_100B1E550];
    objc_storeStrong((id *)&self->_dataSourceAdaptor, a3);
    v7 = [(BKLibraryDataSourceAdaptor *)v16 supplementaryDataSource];
    unsigned int v8 = [v7 canChangeViewMode];

    allBooksCollection = self->_allBooksCollection;
    if (v8)
    {
      if (allBooksCollection)
      {
LABEL_7:
        [(BKLibraryDataSourceAdaptor *)self->_dataSourceAdaptor addObserver:self forKeyPath:@"currentStoreAccountID" options:0 context:off_100B1E548];
        [(BKCollection *)self->_allBooksCollection addObserver:self forKeyPath:@"viewMode" options:0 context:off_100B1E550];
        v5 = v16;
        goto LABEL_8;
      }
      allBooksCollection = +[BKLibraryManager defaultManager];
      v10 = [allBooksCollection collectionController];
      uint64_t v11 = kBKCollectionDefaultAll;
      v12 = +[BKLibraryManager defaultManager];
      v13 = [v12 uiChildContext];
      v14 = [v10 mutableCollectionWithCollectionID:v11 inManagedObjectContext:v13 error:0];
      v15 = self->_allBooksCollection;
      self->_allBooksCollection = v14;
    }
    else
    {
      self->_allBooksCollection = 0;
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100B1E548 == a6)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000F1D7C;
    v24[3] = &unk_100A43D60;
    v24[4] = self;
    v13 = v24;
LABEL_9:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    goto LABEL_10;
  }
  if (off_100B1E550 == a6)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000F1D84;
    v23[3] = &unk_100A43D60;
    v23[4] = self;
    v13 = v23;
    goto LABEL_9;
  }
  if (off_100B1E538 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F1E00;
    block[3] = &unk_100A43D60;
    block[4] = self;
    v13 = block;
    goto LABEL_9;
  }
  if (off_100B1E540 == a6)
  {
    v14 = [(BKLibraryBookshelfCollectionViewController *)self collection];
    unsigned __int8 v15 = [v14 isDefaultCollection];

    if ((v15 & 1) == 0)
    {
      v16 = [(BKLibraryBookshelfCollectionViewController *)self collection];
      v17 = [v16 localizedTitle];

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000F1ED4;
      v20[3] = &unk_100A43DD8;
      v20[4] = self;
      id v21 = v17;
      id v18 = v17;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)BKLibraryBookshelfCollectionViewController;
    [(BKLibraryBookshelfCollectionViewController *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_10:
}

- (void)_didChangePreferredContentSize:(id)a3
{
  id v4 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  v3 = [v4 collectionViewLayout];
  [v3 invalidateLayout];
}

- (void)changeViewModeTo:(unint64_t)a3
{
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self allBooksCollection];
  if (v11)
  {
    v5 = +[NSNumber numberWithUnsignedInteger:a3];
    unsigned int v6 = [v11 setDifferentNumber:v5 forKey:@"viewMode"];

    if (v6)
    {
      v7 = +[BKLibraryManager defaultManager];
      unsigned int v8 = [v11 managedObjectContext];
      [v7 saveManagedObjectContext:v8];
    }
  }
  else
  {
    v9 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v10 = [v9 supplementaryDataSource];
    [v10 setViewMode:a3];

    [(BKLibraryBookshelfCollectionViewController *)self viewModeChanged];
  }
}

- (void)setNeedsUpdateViewMode
{
  self->_needsUpdateViewMode = 1;
}

- (void)updateViewModeIfNeeded
{
  if (self->_needsUpdateViewMode)
  {
    self->_needsUpdateViewMode = 0;
    v3 = [(BKLibraryBookshelfCollectionViewController *)self allBooksCollection];
    id v4 = [v3 resolvedViewMode];

    v5 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    unsigned int v6 = [v5 supplementaryDataSource];
    id v7 = [v6 viewMode];

    if (v7 != v4)
    {
      unsigned int v8 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
      v9 = [v8 supplementaryDataSource];
      [v9 setViewMode:v4];

      [(BKLibraryBookshelfCollectionViewController *)self viewModeChanged];
    }
  }
}

- (void)changeSortModeTo:(unint64_t)a3
{
  if (a3 - 11 < 0xFFFFFFFFFFFFFFF6) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = a3;
  }
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self collection];
  if (v11)
  {
    v5 = +[NSNumber numberWithUnsignedInteger:v4];
    unsigned int v6 = [v11 setDifferentNumber:v5 forKey:@"sortMode"];

    if (v6)
    {
      id v7 = +[BKLibraryManager defaultManager];
      unsigned int v8 = [v11 managedObjectContext];
      [v7 saveManagedObjectContext:v8];
    }
  }
  else
  {
    v9 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v10 = [v9 supplementaryDataSource];
    [v10 setSortMode:v4];

    if ([(BKLibraryBookshelfCollectionViewController *)self isSeriesCollection])
    {
      +[BKCollection setSortModeForSeriesCollections:v4];
      [(BKLibraryBookshelfCollectionViewController *)self _emitAllInSeriesViewEventIfNeeded];
    }
    [(BKLibraryBookshelfCollectionViewController *)self sortModeChanged];
  }
}

- (void)bc_environmentDidChangeFont
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  v2 = [v3 collectionViewLayout];
  [v2 invalidateLayout];
}

- (BOOL)isSeriesCollection
{
  v2 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v3 = [v2 supplementaryDataSource];
  unsigned __int8 v4 = [v3 collectionIsSeries];

  return v4;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  unsigned __int8 v4 = BKLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resume removing from My Samples as app is now background", v7, 2u);
  }

  v5 = +[BSUIStoreServices sharedInstance];
  unsigned int v6 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
  [v5 resumeRemovingFromMySamplesWithTracker:v6];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pause removing from My Samples as app is now foreground", v5, 2u);
  }

  unsigned __int8 v4 = +[BSUIStoreServices sharedInstance];
  [v4 pauseRemovingFromMySamples];
}

- (id)_supplementalContentCount
{
  id v3 = +[BKLibraryManager defaultManager];
  unsigned __int8 v4 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  v5 = [v4 supplementaryDataSource];
  unsigned int v6 = [v5 supplementalContentStorePlaylistID];
  id v7 = [v3 uiChildContext];
  unsigned int v8 = [v3 libraryMutableAssetWithAssetID:v6 inManagedObjectContext:v7];

  v9 = [v8 supplementalContentAssets];
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);

  return v10;
}

- (void)setDragDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dragDelegate, a3);
  id v5 = a3;
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v6 setDragDelegate:v5];
}

- (void)setDropDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dropDelegate, a3);
  id v5 = a3;
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v6 setDropDelegate:v5];
}

- (void)loadView
{
  id v3 = +[BURestrictionsProvider sharedInstance];
  [v3 addObserver:self];

  id v4 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 500.0, 500.0];
  [(BKLibraryBookshelfCollectionViewController *)self setWrapperView:v4];

  id v5 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
  [v5 setAutoresizingMask:18];

  id v6 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
  [v6 setAutoresizesSubviews:1];

  id v7 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
  [(BKLibraryBookshelfCollectionViewController *)self setView:v7];

  unsigned int v8 = [BKLibraryBookshelfCollectionView alloc];
  v9 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  v55 = -[BKLibraryBookshelfCollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v9, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  [(BKLibraryBookshelfCollectionView *)v55 setBkaxLabelProvider:self];
  [(BKLibraryBookshelfCollectionViewController *)self setCollectionView:v55];
  id v10 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v11 setDataSource:v10];

  id v12 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v12 setDelegate:self];

  v13 = [(BKLibraryBookshelfCollectionViewController *)self dragDelegate];
  v14 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v14 setDragDelegate:v13];

  unsigned __int8 v15 = [(BKLibraryBookshelfCollectionViewController *)self dropDelegate];
  v16 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v16 setDropDelegate:v15];

  v17 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v17 setAllowsSelection:1];

  id v18 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v18 setAllowsMultipleSelection:1];

  objc_super v19 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v19 setAllowsMultipleSelectionDuringEditing:1];

  v20 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v20 setAutoresizingMask:18];

  id v21 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v21 setReorderingCadence:1];

  uint64_t v22 = [(BKLibraryBookshelfCollectionViewController *)self isSupplementalContentPDFPicker] ^ 1;
  v23 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v23 setDragInteractionEnabled:v22];

  v24 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v24 setAlwaysBounceVertical:1];

  [(BKLibraryBookshelfCollectionViewController *)self _setCollectionViewSelectionFollowsFocus];
  v25 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  v26 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v26 setCollectionView:v25];

  v27 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  v28 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  v29 = [v28 booksDataSource];
  [v29 setDelegate:v27];

  v30 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v30 reloadData];

  v31 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
  v32 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v31 addSubview:v32];

  v33 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
  [v33 bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v42 setFrame:v35, v37, v39, v41];

  v43 = objc_alloc_init(BKLibraryBookshelfSelectedActionBarViewController);
  [(BKLibraryBookshelfCollectionViewController *)self setActionBarViewController:v43];

  v44 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  [v44 setDelegate:self];

  v45 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  [(BKLibraryBookshelfCollectionViewController *)self addChildViewController:v45];

  v46 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  [v46 loadViewIfNeeded];

  v47 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
  v48 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  v49 = [v48 view];
  [v47 addSubview:v49];

  v50 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  v51 = [v50 view];
  [v51 setHidden:1];

  v52 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  v53 = [v52 view];
  [v53 setAlpha:0.0];

  v54 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  [v54 didMoveToParentViewController:self];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v7 viewDidLoad];
  [(BKLibraryBookshelfCollectionViewController *)self bc_setNavBarVisible:1];
  [(BKLibraryBookshelfCollectionViewController *)self updateBarButtonsAnimated:0];
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
  [v3 _setSupportsTwoLineLargeTitles:1];

  id v4 = objc_alloc_init(BKLibraryCollectionTitleView);
  [(BKLibraryCollectionTitleView *)v4 setDelegate:self];
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
  [v5 setTitleView:v4];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:0 style:0 target:self action:"selectAllButtonPressed:"];
  [(BKLibraryBookshelfCollectionViewController *)self setNavBarSelectAllButtonItem:v6];
  [(BKLibraryBookshelfCollectionViewController *)self _configureSupplementalContentPDFPicker];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v21 viewIsAppearing:a3];
  if (self->_appearingForFirstTime)
  {
    self->_appearingForFirstTime = 0;
    id v4 = [(BKLibraryBookshelfCollectionViewController *)self navigationController];
    id v5 = [v4 navigationBar];
    id v6 = [v5 _restingHeights];

    objc_super v7 = [(BKLibraryBookshelfCollectionViewController *)self view];
    [v7 safeAreaInsets];
    double v9 = v8;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) doubleValue:v17];
          double v9 = v9 + v15;
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }

    v16 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [v16 _setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:1];
    [v16 setContentOffset:0.0, -(v9 + 1.0)];
    [v16 _setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v22 viewWillAppear:a3];
  id v4 = [(BKLibraryBookshelfCollectionViewController *)self collection];
  id v5 = [v4 collectionID];
  unsigned int v6 = [v5 isEqualToString:kBKCollectionDefaultIDFinished];

  if (v6)
  {
    objc_super v7 = +[BKLibraryManager defaultManager];
    [v7 cleanupDateFinished];
  }
  double v8 = [(BKLibraryBookshelfCollectionViewController *)self ba_analyticsTracker];

  if (!v8) {
    id v9 = [(BKLibraryBookshelfCollectionViewController *)self ba_setupNewAnalyticsTrackerWithName:@"Collection"];
  }
  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(BKLibraryBookshelfCollectionViewController *)self setHasInitializedCollectionBackgroundColor:0];
  [(BKLibraryBookshelfCollectionViewController *)self updateViewModeIfNeeded];
  [(BKLibraryBookshelfCollectionViewController *)self updateSelectAllBarButton];
  [(BKLibraryBookshelfCollectionViewController *)self updateBarButtonsAnimated:0];
  [(BKLibraryBookshelfCollectionViewController *)self configureForDragAndDropSession];
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v12 = [v11 supplementaryDataSource];
  [v12 updateSettingsForMajorVisibilityChange];

  uint64_t v13 = +[BKLibraryManager defaultManager];
  v14 = [v13 priceManager];
  [v14 invalidate:0];

  double v15 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  v16 = [v15 panGestureRecognizer];
  long long v17 = [(BKLibraryBookshelfCollectionViewController *)self navigationController];
  long long v18 = [v17 interactivePopGestureRecognizer];
  [v16 requireGestureRecognizerToFail:v18];

  long long v19 = [(BKLibraryBookshelfCollectionViewController *)self navigationController];
  long long v20 = [v19 navigationBar];
  objc_super v21 = +[UIColor bc_booksKeyColor];
  [v20 setTintColor:v21];

  [(BKLibraryBookshelfCollectionViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  [v5 updateMetricsWithViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v4 viewWillLayoutSubviews];
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  [v3 updateMetricsWithViewController:self];

  [(BKLibraryBookshelfCollectionViewController *)self updateTitleFromMetrics];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v11 viewDidAppear:a3];
  [(BKLibraryBookshelfCollectionViewController *)self bc_analyticsVisibilityUpdateSubtree];
  objc_super v4 = [(BKLibraryBookshelfCollectionViewController *)self collection];
  id v5 = [v4 collectionID];
  unsigned int v6 = [v5 isEqualToString:kBKCollectionDefaultIDSamples];

  if (v6)
  {
    objc_super v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pause removing from My Samples", v10, 2u);
    }

    double v8 = +[BSUIStoreServices sharedInstance];
    [v8 pauseRemovingFromMySamples];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v9 addObserver:self selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  if ([(BKLibraryBookshelfCollectionViewController *)self shouldAccessibilityFocusCollectionViewUponAppearing])
  {
    [(BKLibraryBookshelfCollectionViewController *)self _bkAccessibilityFocusCollectionView];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v4 viewWillDisappear:a3];
  [(BKLibraryBookshelfCollectionViewController *)self dismissReadingListPopover];
  [(BKLibraryBookshelfCollectionViewController *)self bc_analyticsVisibilitySubtreeWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v13 viewDidDisappear:a3];
  objc_super v4 = [(BKLibraryBookshelfCollectionViewController *)self collection];
  id v5 = [v4 collectionID];
  unsigned int v6 = [v5 isEqualToString:kBKCollectionDefaultIDSamples];

  if (v6)
  {
    objc_super v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resume removing from My Samples", v12, 2u);
    }

    double v8 = +[BSUIStoreServices sharedInstance];
    id v9 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
    [v8 resumeRemovingFromMySamplesWithTracker:v9];

    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
    [v10 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  }
  [(BKLibraryBookshelfCollectionViewController *)self bc_analyticsVisibilitySubtreeDidDisappear];
  objc_super v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_emitAllInSeriesViewEventIfNeeded
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isSeriesCollection])
  {
    id v3 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    objc_super v4 = [v3 supplementaryDataSource];
    id v5 = [v4 sortMode];

    if (v5 == (id)10)
    {
      id v13 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
      unsigned int v6 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
      objc_super v7 = [v6 supplementaryDataSource];
      double v8 = [v7 seriesID];

      id v9 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
      id v10 = [v9 booksDataSource];
      id v11 = [v10 totalNumberOfItems];

      id v12 = +[BAEventReporter sharedReporter];
      [v12 emitAllInSeriesViewEventWithTracker:v13 collectionID:v8 collectionItemCount:v11];
    }
  }
}

- (void)bc_analyticsVisibilityDidAppear
{
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v14 bc_analyticsVisibilityDidAppear];
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
  objc_super v4 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v5 = [v4 supplementaryDataSource];
  unsigned int v6 = [v5 supplementalContentPDFPicker];

  if (v6)
  {
    objc_super v7 = +[BAEventReporter sharedReporter];
    double v8 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v9 = [v8 supplementaryDataSource];
    id v10 = [v9 supplementalContentStorePlaylistID];
    id v11 = [(BKLibraryBookshelfCollectionViewController *)self _supplementalContentCount];
    [v7 emitPageViewEventForSupplementalContentPDFWithTracker:v3 contentID:v10 supplementalContentCount:v11];
  }
  else
  {
    id v12 = +[NSDate date];
    analyticsStartDate = self->_analyticsStartDate;
    self->_analyticsStartDate = v12;

    [(BKLibraryBookshelfCollectionViewController *)self _emitAllInSeriesViewEventIfNeeded];
  }
}

- (void)bc_analyticsVisibilityWillDisappear
{
  v57.receiver = self;
  v57.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v57 bc_analyticsVisibilityWillDisappear];
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  objc_super v4 = [v3 supplementaryDataSource];
  unsigned __int8 v5 = [v4 supplementalContentPDFPicker];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
    objc_super v7 = [(BKLibraryBookshelfCollectionViewController *)self collection];
    double v8 = [v7 collectionID];
    unsigned __int8 v9 = [v8 isEqualToString:kBKCollectionDefaultAll];

    if (v9)
    {
      v50 = v6;
      id v10 = objc_opt_new();
      v47 = self;
      id v11 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
      id v12 = [v11 booksDataSource];

      v48 = v12;
      if ([v12 numberOfSections])
      {
        uint64_t v13 = 0;
        do
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v49 = v13;
          id obj = [v12 representedObjectsInSection:v13];
          id v14 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v54;
            do
            {
              long long v17 = 0;
              id v51 = v15;
              do
              {
                if (*(void *)v54 != v16) {
                  objc_enumerationMutation(obj);
                }
                long long v18 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v17);
                if ([v18 isLocal])
                {
                  long long v19 = [v18 assetID];
                  long long v20 = [v50 contentPrivateIDForContentID:v19];
                  objc_super v21 = [v50 contentUserIDForContentID:v19];
                  objc_super v22 = v10;
                  id v23 = +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", (int)[v18 contentType]);
                  id v24 = objc_alloc((Class)BALibraryItemTypeData);
                  v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 isSample]);
                  id v26 = v23;
                  id v10 = v22;
                  id v27 = [v24 initWithContentPrivateID:v20 contentUserID:v21 contentType:v26 contentID:v19 isSample:v25];

                  [v22 addObject:v27];
                  id v15 = v51;
                }
                long long v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              id v15 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
            }
            while (v15);
          }

          id v12 = v48;
          uint64_t v13 = v49 + 1;
        }
        while (v49 + 1 < (unint64_t)[v48 numberOfSections]);
      }
      v28 = +[BAEventReporter sharedReporter];
      analyticsStartDate = v47->_analyticsStartDate;
      v30 = [(BKLibraryBookshelfCollectionViewController *)v47 dataSourceAdaptor];
      v31 = [v30 supplementaryDataSource];
      id v32 = [v31 viewMode];
      if (v32 == (id)1) {
        uint64_t v33 = 1;
      }
      else {
        uint64_t v33 = 2 * (v32 == (id)2);
      }
      double v34 = [(BKLibraryBookshelfCollectionViewController *)v47 dataSourceAdaptor];
      double v35 = [v34 supplementaryDataSource];
      unint64_t v36 = (unint64_t)[v35 sortMode] - 1;
      if (v36 > 5) {
        uint64_t v37 = 0;
      }
      else {
        uint64_t v37 = qword_10085C900[v36];
      }
      unsigned int v6 = v50;
      [v28 emitLibraryViewEventWithTracker:v50 startDate:analyticsStartDate librarySummary:v10 displayType:v33 sortType:v37];

      v44 = v48;
    }
    else
    {
      if ([(BKLibraryBookshelfCollectionViewController *)self isSeriesCollection])
      {
        double v38 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
        double v39 = [v38 supplementaryDataSource];
        uint64_t v40 = [v39 seriesID];

        double v41 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
        v42 = [v41 booksDataSource];
        id v43 = [v42 totalNumberOfItems];
      }
      else
      {
        v45 = [(BKLibraryBookshelfCollectionViewController *)self collection];
        uint64_t v40 = [v45 collectionID];

        double v41 = [(BKLibraryBookshelfCollectionViewController *)self collection];
        v42 = [v41 members];
        id v43 = [v42 count];
      }
      id v46 = v43;

      v44 = +[BAEventReporter sharedReporter];
      [v44 emitCollectionScreenViewEventWithTracker:v6 startDate:self->_analyticsStartDate collectionID:v40 collectionItemCount:v46];
      id v10 = (void *)v40;
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

- (void)bc_tabBarControllerWillSelectViewController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKLibraryBookshelfCollectionViewController *)self tabBarController];
  id v12 = [v5 selectedViewController];

  unsigned int v6 = v12;
  if (v12 != v4)
  {
    unsigned int v7 = [v12 im_isAncestorOfChildViewController:self];
    unsigned int v6 = v12;
    if (v7)
    {
      double v8 = [(BKLibraryBookshelfCollectionViewController *)self bc_descendentPresentedViewController];
      [v8 dismissViewControllerAnimated:0 completion:0];

      unsigned __int8 v9 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
      id v10 = [v9 view];
      unsigned __int8 v11 = [v10 isHidden];

      unsigned int v6 = v12;
      if ((v11 & 1) == 0)
      {
        [(BKLibraryBookshelfCollectionViewController *)self setEditing:0 animated:0];
        unsigned int v6 = v12;
      }
    }
  }
}

- (BOOL)editableCollection
{
  v2 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  unsigned __int8 v3 = [v2 editableCollection];

  return v3;
}

- (BOOL)reorderableCollection
{
  v2 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  unsigned __int8 v3 = [v2 reorderableCollection];

  return v3;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v3 reloadData];
}

- (BOOL)isSupplementalContentPDFPicker
{
  v2 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v3 = [v2 supplementaryDataSource];
  unsigned __int8 v4 = [v3 supplementalContentPDFPicker];

  return v4;
}

- (void)reloadData
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v3 reloadData];

  id v4 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v4 reloadData];
}

- (void)explicitContentRestrictedChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3E90;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)scrollToMakeLibraryAssetIDVisible:(id)a3
{
  id v4 = a3;
  id v11 = +[BKLibraryManager defaultManager];
  unsigned __int8 v5 = [v11 uiChildContext];
  unsigned int v6 = [v11 libraryMutableAssetWithAssetID:v4 inManagedObjectContext:v5];

  if (v6)
  {
    unsigned int v7 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    double v8 = [v7 booksDataSource];
    unsigned __int8 v9 = [v8 indexPathForRepresentedObject:v6];

    if (v9)
    {
      id v10 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v10 scrollToItemAtIndexPath:v9 atScrollPosition:2 animated:0];
    }
  }
}

- (void)openSeriesContainer:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F4054;
  v7[3] = &unk_100A46BF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKLibraryBookshelfCollectionViewController *)self createSeriesViewControllerFromSeriesContainer:v6 withParentTracker:v5 completion:v7];
}

- (void)_refreshSeriesContainer:(id)a3
{
  id v3 = a3;
  id v4 = +[BUBag defaultBag];
  unsigned __int8 v5 = [v4 seriesInfoLiveFetchesEnabled];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F449C;
  v7[3] = &unk_100A46C20;
  id v8 = v3;
  id v6 = v3;
  [v5 valueWithCompletion:v7];
}

- (void)_configureSupplementalContentPDFPicker
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isSupplementalContentPDFPicker])
  {
    id v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [(BKLibraryBookshelfCollectionViewController *)self setContentScrollView:v3 forEdge:1];

    id v4 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    unsigned __int8 v5 = [v4 supplementaryDataSource];
    id v6 = [v5 supplementalContentPDFPickerTitle];
    unsigned int v7 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
    [v7 setTitle:v6];

    id v8 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
    [v8 setLargeTitleDisplayMode:2];

    unsigned __int8 v9 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
    [v9 setRightBarButtonItem:0];

    id v11 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"cancelButtonPressed:"];
    id v10 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
    [v10 setRightBarButtonItem:v11 animated:0];
  }
}

- (void)cancelButtonPressed:(id)a3
{
  id v4 = +[BAEventReporter sharedReporter];
  unsigned __int8 v5 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  unsigned int v7 = [v6 supplementaryDataSource];
  id v8 = [v7 supplementalContentStorePlaylistID];
  unsigned __int8 v9 = [(BKLibraryBookshelfCollectionViewController *)self _supplementalContentCount];
  [v4 emitCloseSupplementalContentPDFPickerWithTracker:v5 contentID:v8 supplementalContentCount:v9];

  [(BKLibraryBookshelfCollectionViewController *)self _dismissIfSupplementContentPDFPicker];
}

- (void)selectAllButtonPressed:(id)a3
{
  id v4 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  unsigned __int8 v5 = [v4 indexPathsForSelectedItems];
  id v6 = [v5 count];

  unsigned int v7 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v8 = [v7 booksDataSource];
  id v9 = [v8 totalNumberOfItems];

  if (v6 == v9)
  {
    [(BKLibraryBookshelfCollectionViewController *)self deselectAll];
  }
  else
  {
    [(BKLibraryBookshelfCollectionViewController *)self selectAll];
  }
}

- (void)updateSelectAllBarButton
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isEditing])
  {
    id v3 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v4 = [v3 booksDataSource];
    id v5 = [v4 totalNumberOfItems];

    id v6 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    unsigned int v7 = [v6 indexPathsForSelectedItems];
    id v8 = [v7 count];

    id v9 = +[NSBundle mainBundle];
    id v10 = v9;
    if (v5 && v8 == v5) {
      CFStringRef v11 = @"Deselect All";
    }
    else {
      CFStringRef v11 = @"Select All";
    }
    id v12 = [v9 localizedStringForKey:v11 value:&stru_100A70340 table:0];
    uint64_t v13 = [(BKLibraryBookshelfCollectionViewController *)self navBarSelectAllButtonItem];
    [v13 setTitle:v12];

    id v14 = [(BKLibraryBookshelfCollectionViewController *)self navBarSelectAllButtonItem];
    [v14 setEnabled:v5 != 0];

    id v16 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
    id v15 = [(BKLibraryBookshelfCollectionViewController *)self navBarSelectAllButtonItem];
    [v16 setLeftBarButtonItem:v15 animated:0];
  }
  else
  {
    id v16 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
    [v16 setLeftBarButtonItem:0 animated:0];
  }
}

- (void)doneButtonPressed:(id)a3
{
}

- (void)addDoneButton:(BOOL)a3 forPresentationController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_opt_class();
  unsigned int v7 = [v6 presentedViewController];

  BUDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = v13;
  if (v13)
  {
    id v9 = [v13 topViewController];
    id v10 = [v9 navigationItem];
    CFStringRef v11 = v10;
    if (v4)
    {
      id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
      [v11 setRightBarButtonItem:v12 animated:0];
    }
    else
    {
      [v10 setRightBarButtonItem:0 animated:0];
    }

    id v8 = v13;
  }
}

- (void)prepareForPopoverPresentation:(id)a3
{
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  BOOL v4 = [(BKLibraryBookshelfCollectionViewController *)self addSelectedBooksCompletion];
  if (v4) {
    v4[2](v4, 0);
  }
  [(BKLibraryBookshelfCollectionViewController *)self setAddSelectedBooksCompletion:0];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v4 = a4;
  id v5 = [v4 horizontalSizeClass];
  id v6 = [v4 verticalSizeClass];

  if (v6 == (id)1 || v5 == (id)1) {
    return 0;
  }
  else {
    return 7;
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)_setCollectionViewSelectionFollowsFocus
{
  id v2 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v2 setSelectionFollowsFocus:1];
}

- (void)updateBarButtonsForTraitChange
{
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
}

- (id)coverAnimationHostSourceForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  if (v5)
  {
    id v6 = [BKLibraryBookOpenAnimatingSourceProxy alloc];
    unsigned int v7 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v8 = [(BKLibraryBookOpenAnimatingSourceProxy *)v6 initWithLibraryAsset:v5 coverHost:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)coverAnimationHostScrollToMakeVisible:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v12 libraryAsset];
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  unsigned int v7 = [v6 booksDataSource];
  id v8 = [v7 indexPathForRepresentedObject:v5];

  if (v8)
  {
    id v9 = [(BKLibraryBookshelfCollectionViewController *)self layout];
    [v9 setCoverAnimationRunningHack:1];

    id v10 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [v10 scrollToItemAtIndexPath:v8 atScrollPosition:2 animated:0];

    CFStringRef v11 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [v11 layoutIfNeeded];
  }
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 1;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  id v6 = [v5 libraryAsset];
  unsigned int v7 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v8 = [v7 booksDataSource];
  id v9 = [v8 indexPathForRepresentedObject:v6];

  if (v9
    && ([(BKLibraryBookshelfCollectionViewController *)self collectionView],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 indexPathsForVisibleItems],
        CFStringRef v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 containsObject:v9],
        v11,
        v10,
        v12))
  {
    id v13 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    id v14 = [v13 cellForItemAtIndexPath:v9];

    if (v14)
    {
      [v14 frame];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      id v23 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v23 contentOffset];
      double v25 = v24;
      id v26 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v26 bounds];
      double v28 = v27;
      v29 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v29 verticalScrollIndicatorInsets];
      double v31 = v30;

      v37.origin.x = v16;
      v37.origin.y = v18;
      v37.size.width = v20;
      v37.size.height = v22;
      double MinY = CGRectGetMinY(v37);
      uint64_t v33 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v33 contentOffset];
      if (MinY >= v34)
      {
        v38.origin.x = v16;
        v38.origin.y = v18;
        v38.size.width = v20;
        v38.size.height = v22;
        BOOL v35 = CGRectGetMaxY(v38) <= v25 + v28 - v31;
      }
      else
      {
        BOOL v35 = 0;
      }
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

- (void)_openBook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];
  id v9 = [v6 permanentOrTemporaryAssetID];
  id v10 = BKLibraryLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1007EAD78();
  }

  CFStringRef v11 = objc_opt_new();
  unsigned int v12 = +[BKAppDelegate sceneControllerForViewController:self];
  id v13 = [v12 newShowAssetTransaction];

  if (v13) {
    [v11 setObject:v13 forKeyedSubscript:BCTransactionOptionsTransactionKey];
  }
  id v14 = [v6 assetLogID];
  [v11 setObject:v14 forKeyedSubscript:AEAssetLogID];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F5408;
  v17[3] = &unk_100A46C48;
  double v19 = self;
  id v20 = v7;
  id v18 = v6;
  id v15 = v6;
  id v16 = v7;
  [v8 showAssetWithTransaction:v13 assetID:v9 location:0 options:v11 completion:v17];
}

- (void)_playPreview:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v9 = [v8 booksDataSource];
  id v10 = [v6 storeID];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F55F4;
  v12[3] = &unk_100A46C70;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [v9 resourceForAssetID:v10 type:1 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_downloadSample:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 assetID];
  id v9 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
  id v10 = [(BKLibraryBookshelfCollectionViewController *)self _contentDataForContentID:v8 tracker:v9];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F58A8;
  v19[3] = &unk_100A46CC0;
  id v20 = v10;
  double v21 = self;
  id v22 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = objc_retainBlock(v19);
  id v14 = +[BSUIItemDescriptionCache sharedInstance];
  id v15 = [v7 storeID];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F5A50;
  v17[3] = &unk_100A46CE8;
  id v18 = v13;
  id v16 = v13;
  [v14 sampleDownloadURLForAssetID:v15 completion:v17];
}

- (int64_t)_contentTypeForContentID:(id)a3 withLibraryAsset:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v4 = [a4 contentType];

  return (int64_t)+[BAUtilities contentTypeFromAssetType:v4];
}

- (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryBookshelfCollectionViewController *)self _libraryAssetWithContentID:v6];
  uint64_t v9 = [v7 contentPrivateIDForContentID:v6];
  uint64_t v10 = [v7 contentUserIDForContentID:v6];

  int64_t v26 = [(BKLibraryBookshelfCollectionViewController *)self _contentTypeForContentID:v6 withLibraryAsset:v8];
  double v27 = (void *)v10;
  if ([v8 isOwned])
  {
    id v11 = [v8 storeID];
    id v12 = [v11 length];
    uint64_t v13 = 1;
    if (!v12) {
      uint64_t v13 = 2;
    }
    uint64_t v25 = v13;
  }
  else
  {
    uint64_t v25 = 0;
  }
  double v28 = (void *)v9;
  id v14 = +[BAEventReporter sharedReporter];
  id v15 = [v14 seriesTypeForContentID:v6];

  if ([v8 isAudiobook])
  {
    id v16 = [v8 hasRACSupport];
    if ([v16 BOOLValue]) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = objc_alloc((Class)BAContentData);
  unsigned int v19 = [v8 contentType];
  if (v19 == 3)
  {
    id v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 pageCount]);
  }
  else
  {
    id v20 = 0;
  }
  double v21 = [v8 supplementalContentAssets];
  id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 count]);
  id v23 = [v18 initWithContentID:v6 contentType:v26 contentPrivateID:v28 contentUserID:v27 contentAcquisitionType:v25 contentSubType:0 contentLength:v20 supplementalContentCount:v22 seriesType:v15 productionType:v17 isUnified:0 contentKind:0];

  if (v19 == 3) {

  }
  return v23;
}

- (id)_libraryAssetWithContentID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[BKAppDelegate delegate];
  id v5 = [v4 libraryAssetProvider];

  id v6 = [v5 libraryAssetOnMainQueueWithAssetID:v3];

  return v6;
}

- (void)_openStoreSample:(id)a3
{
  id v4 = a3;
  id v5 = [v4 storeID];
  id v6 = BKLibraryLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007EAED8();
  }

  if ([v5 length])
  {
    [(BKLibraryBookshelfCollectionViewController *)self _downloadSample:v4 completion:0];
    id v7 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];
    if (([v4 isAudiobook] & 1) != 0
      || !+[BKSceneUtilities hasMultiWindowEnabled])
    {
      id v10 = +[BKAppDelegate sceneControllerForViewController:self];
      id v12 = [v10 newShowAssetTransaction];
    }
    else
    {
      id v8 = +[BKAppDelegate sceneManager];
      uint64_t v9 = [v4 assetID];
      id v10 = [v8 newBookSceneControllerProviderWithRequestAssetID:v9];

      id v11 = +[BKAppDelegate currentSceneController];
      id v12 = [v11 newShowAssetTransactionWithTargetSceneDescriptor:v10];
    }
    if (v12)
    {
      uint64_t v20 = BCTransactionOptionsTransactionKey;
      id v21 = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (+[BKSceneUtilities hasMultiWindowEnabled]
      && ([v4 isAudiobook] & 1) == 0)
    {
      [v7 showAssetWithTransaction:v12 storeID:v5 options:v13];
    }
    else
    {
      id v14 = +[BKAppDelegate sceneManager];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000F6014;
      v15[3] = &unk_100A44610;
      id v16 = v7;
      id v17 = v12;
      id v18 = v5;
      id v19 = v13;
      [v14 forceTransaction:v17 ontoPrimarySceneWithContinuation:v15];
    }
  }
}

- (id)_transactionForStorePresentingAction
{
  id v3 = +[BKAppDelegate sceneManager];
  id v4 = [v3 sceneControllerForViewController:self];

  id v5 = [v4 newShowURLTransaction];

  return v5;
}

- (void)_showBooksInSectionAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1007EAF40();
  }

  id v6 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v7 = [v6 booksDataSource];
  id v8 = [v7 representedObjectsInSection:[v4 section]];

  BOOL v35 = v4;
  unint64_t v36 = [v8 objectAtIndexedSubscript:[v4 item]];
  uint64_t v9 = [v36 storeID];

  if (!v9)
  {
    uint64_t v13 = 0;
    id v19 = &__NSArray0__struct;
    id v20 = &__NSArray0__struct;
    goto LABEL_25;
  }
  id v10 = +[NSMutableArray array];
  id v11 = +[NSMutableArray array];
  if ([v8 count])
  {
    unint64_t v12 = 0;
    uint64_t v13 = -1;
    do
    {
      id v14 = [v8 objectAtIndexedSubscript:v12];
      id v15 = [v14 storeID];
      if ([v14 isAudiobook]) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = 3;
      }
      if (v15)
      {
        if (v14 == v36) {
          uint64_t v13 = (uint64_t)[v10 count];
        }
        [v10 addObject:v15];
        id v17 = +[NSNumber numberWithInteger:v16];
        [v11 addObject:v17];
      }
      ++v12;
    }
    while (v12 < (unint64_t)[v8 count]);
    if ((unint64_t)[v10 count] > 0x64)
    {
      uint64_t v18 = v13 - 49;
      if (v13 >= 49)
      {
        if (v13 + 51 > (unint64_t)[v10 count]) {
          uint64_t v18 = (uint64_t)[v10 count] - 100;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v13 = -1;
    if ((unint64_t)[v10 count] > 0x64)
    {
      uint64_t v18 = 0;
LABEL_23:
      [v10 subarrayWithRange:v18, 100];
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      [v11 subarrayWithRange:v18, 100];
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v13 -= v18;
      goto LABEL_24;
    }
  }
  id v20 = v10;
  id v19 = v11;
LABEL_24:

LABEL_25:
  id v21 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
  double v34 = v20;
  uint64_t v33 = v19;
  if ([(BKLibraryBookshelfCollectionViewController *)self isSeriesCollection])
  {
    id v22 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v23 = [v22 supplementaryDataSource];
    double v24 = [v23 seriesID];
  }
  else
  {
    id v22 = [(BKLibraryBookshelfCollectionViewController *)self collection];
    double v24 = [v22 collectionID];
  }

  id v25 = objc_alloc((Class)BALinkData);
  int64_t v26 = [(BKLibraryBookshelfCollectionViewController *)self navigationItem];
  double v27 = [v26 title];
  [v36 storeID];
  v29 = double v28 = self;
  id v30 = [v25 initWithPreviousSectionID:v24 previousSectionName:v27 previousContentID:v29 linkActionType:2 previousSeriesID:0 previousGenreID:0 previousCollectionID:0 previousAuthorID:0 previousFlowcaseID:0 previousBrickID:0];

  [v21 pushLinkData:v30 file:@"/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfCollectionViewController.m" line:1299];
  double v31 = [(BKLibraryBookshelfCollectionViewController *)v28 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKStorePresenting];
  id v32 = [(BKLibraryBookshelfCollectionViewController *)v28 _transactionForStorePresentingAction];
  [v31 storeShowBooksWithStoreIDs:v34 resourceTypes:v33 focusedIndex:v13 transaction:v32 needsAnalyticsLinkData:0];
}

- (BOOL)_isErrorFromUserCanceled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = AKAppleIDAuthenticationErrorDomain;
    uint64_t v6 = AMSErrorDomain;
    uint64_t v7 = AMSErrorUserInfoKeyStatusCode;
    id v8 = v3;
    while (1)
    {
      uint64_t v9 = [v8 domain];
      if ([v9 isEqualToString:v5])
      {
        id v10 = [v8 code];

        if (v10 == (id)-7003) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v11 = [v8 domain];
      unsigned int v12 = [v11 isEqualToString:v6];

      uint64_t v13 = [v8 userInfo];
      id v14 = [v13 objectForKeyedSubscript:v7];

      id v15 = [v8 userInfo];
      uint64_t v16 = v15;
      if (v12)
      {
        if (v14) {
          break;
        }
      }
      uint64_t v17 = [v15 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v8 = (void *)v17;
      if (!v17) {
        goto LABEL_18;
      }
    }
    uint64_t v18 = [v15 objectForKeyedSubscript:v7];
    int v19 = [v18 intValue];

    id v20 = BKLibraryLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1007EAFA8(v19, v19 < 500, v20);
    }

    if (v19 < 500)
    {
LABEL_15:
      id v21 = BKLibraryLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v4 domain];
        int v25 = 138543874;
        int64_t v26 = v22;
        __int16 v27 = 2048;
        id v28 = [v4 code];
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Treating error as being caused by user cancel: Error Domain=%{public}@ Code=%ld (%@)", (uint8_t *)&v25, 0x20u);
      }
      BOOL v23 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_18:
  id v21 = BKLibraryLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    int64_t v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NOT treating error as being caused by user cancel: %@", (uint8_t *)&v25, 0xCu);
  }
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)openItemAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AETestDriver shared];
  [v8 postEvent:kBETestDriverOpenAnimationStart sender:self];

  uint64_t v9 = +[AETestDriver shared];
  [v9 postEvent:kBETestDriverOpenAnimationSetupStart sender:self];

  kdebug_trace();
  id v10 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v11 = [v10 booksDataSource];
  unsigned int v12 = [v11 representedObjectForIndexPath:v6];

  uint64_t v13 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  LODWORD(v44) = [v13 isItemPlayingAtIndexPath:v6];

  id v14 = +[BURestrictionsProvider sharedInstance];
  unsigned int v15 = [v14 isBookStoreAllowed];

  unsigned int v47 = +[BKReachability isOffline];
  uint64_t v16 = [(BKLibraryBookshelfCollectionViewController *)self collectionID];
  unsigned int v17 = [v16 isEqualToString:kBKCollectionDefaultIDWantToRead];

  HIDWORD(v44) = [v12 isInSamples];
  unsigned int v18 = [v12 isContainer];
  unsigned int v19 = [(BKLibraryBookshelfCollectionViewController *)self isEditing];
  id v20 = BKLibraryLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    [v12 assetID];
    v22 = id v21 = v6;
    *(_DWORD *)buf = 138414082;
    v50 = v22;
    __int16 v51 = 1024;
    int v52 = v44;
    __int16 v53 = 1024;
    unsigned int v54 = v15;
    __int16 v55 = 1024;
    unsigned int v56 = v47;
    __int16 v57 = 1024;
    unsigned int v58 = v17;
    __int16 v59 = 1024;
    int v60 = HIDWORD(v44);
    __int16 v61 = 1024;
    unsigned int v62 = v18;
    __int16 v63 = 1024;
    unsigned int v64 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Open] Attempting to open book %@: bookIsPlaying: %{BOOL}d, isStoreAllowed: %{BOOL}d, isOffline: %{BOOL}d, inWantToReadCollection: %{BOOL}d, isInSamples: %{BOOL}d, isContainer: %{BOOL}d, isEditing: %{BOOL}d", buf, 0x36u);

    id v6 = v21;
  }

  if (!v18)
  {
    if ((v15 & 1) == 0 && [v12 isStoreOrSeriesItem])
    {
      BOOL v23 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKStorePresenting];
      int v25 = [(BKLibraryBookshelfCollectionViewController *)self _transactionForStorePresentingAction];
      int64_t v26 = BKLibraryLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_1007EB204();
      }

      [v23 displayBookUnavailableInStorefrontErrorWithTransaction:v25];
      goto LABEL_46;
    }
    if (((objc_msgSend(v12, "isSeriesItem", v44) & 1) != 0
       || ([v12 isPreorderBook] & 1) != 0
       || [v12 isStoreItem])
      && ([v12 isSample] & 1) == 0
      && ([v12 isAudiobookPreview] & 1) == 0)
    {
      unint64_t v36 = BKLibraryLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        sub_1007EB1D0();
      }

      if (v19)
      {
        BOOL v23 = BKLibraryLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_1007EB108();
        }
        goto LABEL_46;
      }
      if (((v47 | v46 ^ 1 | v17) & 1) == 0)
      {
        [(BKLibraryBookshelfCollectionViewController *)self _openStoreSample:v12];
        goto LABEL_47;
      }
      if (([(BKLibraryBookshelfCollectionViewController *)self isSeriesCollection] | v17) != 1)
      {
        double v39 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKStorePresenting];
        uint64_t v40 = [(BKLibraryBookshelfCollectionViewController *)self _transactionForStorePresentingAction];
        if ([v12 isAudiobook]) {
          uint64_t v41 = 0;
        }
        else {
          uint64_t v41 = 3;
        }
        v42 = BKLibraryLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          sub_1007EB13C(v12, v42);
        }

        id v43 = [v12 storeID];
        [v39 storeShowBookWithStoreID:v43 resourceType:v41 transaction:v40];

        goto LABEL_47;
      }
    }
    else
    {
      if ([v12 isDownloading] && (objc_msgSend(v12, "streamable") & 1) == 0)
      {
        CGRect v37 = BKLibraryLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_1007EB0D4();
        }

        BOOL v23 = +[BKLibraryManager defaultManager];
        [v23 toggleDownloadPausedForAsset:v12];
        goto LABEL_46;
      }
      if (v19)
      {
        BOOL v23 = BKLibraryLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_1007EB0A0();
        }
        goto LABEL_46;
      }
      if (((v47 | v46 ^ 1) & 1) != 0
        || ((v17 ^ 1) & 1) != 0
        || ([v12 isStoreOrSeriesItem] & 1) == 0
        && ![v12 isSample])
      {
        if (([v12 isLocal] & 1) != 0
          || ([v12 isSupplementalContent] ^ 1 | v47) != 1
          || ([v12 isSample] & 1) != 0
          || ([v12 isAudiobookPreview] & 1) != 0
          || ([v12 streamable] & (v47 ^ 1) | v45) == 1)
        {
          if ([v12 isSupplementalContent])
          {
            __int16 v27 = [v12 supplementalContentParent];
            id v28 = [v27 storeID];

            __int16 v29 = +[BAEventReporter sharedReporter];
            [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
            id v30 = v48 = v7;
            [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
            id v32 = v31 = v6;
            uint64_t v33 = [v32 supplementaryDataSource];
            id v34 = [v33 fromActionMenu];
            BOOL v35 = [(BKLibraryBookshelfCollectionViewController *)self _supplementalContentCount];
            [v29 emitViewSupplementalContentWithTracker:v30 contentID:v28 sourceIsAction:v34 supplementalContentCount:v35];

            id v6 = v31;
            id v7 = v48;
          }
          if ([v12 isAudiobookPreview]) {
            [(BKLibraryBookshelfCollectionViewController *)self _playPreview:v12 completion:0];
          }
          else {
            [(BKLibraryBookshelfCollectionViewController *)self _openBook:v12 completion:0];
          }
        }
        else if (v47)
        {
          [(BKLibraryBookshelfCollectionViewController *)self _showInternetReachabilityErrorAlert:v12];
        }
        else
        {
          [(BKLibraryBookshelfCollectionViewController *)self _downloadBook:v12];
        }
        goto LABEL_47;
      }
    }
    [(BKLibraryBookshelfCollectionViewController *)self _showBooksInSectionAtIndexPath:v6];
    goto LABEL_47;
  }
  BOOL v23 = BKLibraryLog();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v24) {
      sub_1007EB038();
    }
LABEL_46:

    goto LABEL_47;
  }
  if (v24) {
    sub_1007EB06C();
  }

  [(BKLibraryBookshelfCollectionViewController *)self openSeriesContainer:v12];
LABEL_47:
  CGRect v38 = (void (**)(void))objc_retainBlock(v7);

  if (v38) {
    v38[2](v38);
  }
}

- (void)_downloadBook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1007EB238(v4, v5);
  }

  if ([v4 isCloud])
  {
    objc_opt_class();
    id v6 = +[UIApplication sharedApplication];
    id v7 = [v6 delegate];
    id v8 = BUDynamicCast();

    if ([v8 isConnectedToInternet])
    {
      uint64_t v9 = +[BKLibraryManager defaultManager];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000F6FF8;
      v10[3] = &unk_100A46D10;
      v10[4] = self;
      id v11 = v4;
      [v9 resolveLibraryAsset:v11 completion:v10];
    }
    else
    {
      [(BKLibraryBookshelfCollectionViewController *)self _showInternetReachabilityErrorAlert:v4];
    }
  }
}

- (void)_showInternetReachabilityErrorAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKStorePresenting];
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self _transactionForStorePresentingAction];
  id v7 = BKLibraryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1007EB2F0(v4, v7);
  }

  [v5 displayOffineCannotDownloadErrorForContentType:[v4 contentType] transaction:v6];
}

- (void)cancelDownloadBook:(id)a3
{
  id v7 = a3;
  id v3 = +[BKLibraryAssetStatusController sharedController];
  if ([v7 isValid] && objc_msgSend(v7, "state") == 2)
  {
    id v4 = [v7 assetID];
    uint64_t v5 = [v3 statusForAssetID:v4];

    if ([v5 canPause])
    {
      id v6 = [v7 assetID];
      [v3 cancelDownloadOfAsset:v6];
    }
  }
}

- (void)resumeDownloadBook:(id)a3
{
  id v7 = a3;
  id v3 = +[BKLibraryAssetStatusController sharedController];
  if ([v7 isValid] && objc_msgSend(v7, "state") == 2)
  {
    id v4 = [v7 assetID];
    uint64_t v5 = [v3 statusForAssetID:v4];

    if ([v5 canResume])
    {
      id v6 = [v7 assetID];
      [v3 resumeDownloadOfAsset:v6];
    }
  }
}

- (NSArray)selectedBooks
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  uint64_t v5 = [(BKLibraryBookshelfCollectionViewController *)self booksAtIndexPaths:v4];

  return (NSArray *)v5;
}

- (id)booksAtIndexPaths:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v12 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
        uint64_t v13 = [v12 booksDataSource];
        id v14 = [v13 representedObjectForIndexPath:v11];

        [v5 addObject:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_addSelectedBooksToReadingList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 count])
  {
    [(BKLibraryBookshelfCollectionViewController *)self setAddSelectedBooksCompletion:v7];
    [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BSUILibraryCollectionUIProvider];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000F7918;
    v30[3] = &unk_100A43D60;
    int v25 = v30[4] = self;
    [v25 setSuccessfulAddFinishedBlock:v30];
    uint64_t v9 = objc_opt_new();
    id v10 = +[NSHashTable hashTableWithOptions:512];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v8;
    uint64_t v12 = (uint64_t)[v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      id v22 = self;
      id v23 = v8;
      id v24 = v7;
      uint64_t v13 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          unsigned int v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v16 = [NSNumber numberWithShort:[v15 contentType:v22, v23, v24]];
          [v9 addObject:v16];

          long long v17 = [v15 storeID];
          id v18 = [v17 length];

          if (v18)
          {
            long long v19 = [v15 assetID];
            [v10 addObject:v19];
          }
          if ([v15 isContainer])
          {
            uint64_t v12 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v12 = (uint64_t)[v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_14:
      id v8 = v23;
      id v7 = v24;
      self = v22;
    }

    id v20 = [v11 valueForKey:@"assetID"];
    id v21 = [v25 libraryCollectionListViewControllerWithAssetIDs:v20 knownAssetTypes:v9 knownStoreAssetIDs:v10 containsSeriesContainer:v12 showDivider:0];

    [(BKLibraryBookshelfCollectionViewController *)self _showOverlayViewController:v21];
  }
}

- (void)_showOverlayViewController:(id)a3
{
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000F7A74;
  id v11 = &unk_100A43DD8;
  id v12 = a3;
  uint64_t v13 = self;
  id v4 = v12;
  uint64_t v5 = objc_retainBlock(&v8);
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self bc_descendentPresentedViewController];

  if (v6)
  {
    id v7 = [(BKLibraryBookshelfCollectionViewController *)self bc_descendentPresentedViewController];
    [v7 dismissViewControllerAnimated:1 completion:v5];
  }
  else
  {
    ((void (*)(void ***))v5[2])(v5);
  }
}

- (void)_dismissOverlayViewController:(id)a3
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)updateActionBarForSelection
{
  [(BKLibraryBookshelfCollectionViewController *)self updateSelectAllBarButton];
  id v7 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self selectedBooks];
  BOOL v4 = [(BKLibraryBookshelfCollectionViewController *)self hasAnyDeletableBookSelected];
  BOOL v5 = [(BKLibraryBookshelfCollectionViewController *)self hasAnySeriesContainerSelected];
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self collection];
  [v7 updateForSelectedItems:v3, v4, v5, [v6 isDefaultCollection] ^ 1];
}

- (void)updateActionBarFromMetrics
{
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  BOOL v4 = [v3 actionBarMetrics];
  [v5 updateActionBarFromMetrics:v4];
}

- (void)updateTitleFromMetrics
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self navigationController];
  BOOL v4 = [v3 topViewController];

  if (v4 == self)
  {
    id v5 = [(BKLibraryBookshelfCollectionViewController *)self navigationController];
    id v11 = [v5 navigationBar];

    id v6 = [(BKLibraryBookshelfCollectionViewController *)self layout];
    id v7 = [v6 columnMetrics];

    [v7 margins];
    double v9 = v8;
    [v7 margins];
    [v11 setDirectionalLayoutMargins:0.0, v9, 0.0, v10];
  }
}

- (void)updateTabBarControllerForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self tabBarController];
  id v6 = v5;
  if (v3) {
    [v5 hideBarWithTransition:6];
  }
  else {
    [v5 showBarWithTransition:6];
  }

  id v7 = [(BKLibraryBookshelfCollectionViewController *)self _collectionBackingButton];
  [v7 setEnabled:!v3];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(BKLibraryBookshelfCollectionViewController *)self isEditing] != a3)
  {
    v71.receiver = self;
    v71.super_class = (Class)BKLibraryBookshelfCollectionViewController;
    [(BKLibraryBookshelfCollectionViewController *)&v71 setEditing:v5 animated:v4];
    id v7 = [(BKLibraryBookshelfCollectionViewController *)self bk_rootBarCoordinator];
    [v7 setIsMiniPlayerHidden:v5];

    if (v5)
    {
      [(BKLibraryBookshelfCollectionViewController *)self updateActionBarFromMetrics];
      if (_os_feature_enabled_impl()) {
        int v8 = 1;
      }
      else {
        int v8 = _os_feature_enabled_impl();
      }
      id v11 = [(BKLibraryBookshelfCollectionViewController *)self viewIfLoaded];
      id v12 = [v11 traitCollection];
      id v13 = [v12 horizontalSizeClass];

      id v14 = [(BKLibraryBookshelfCollectionViewController *)self viewIfLoaded];
      unsigned int v15 = [v14 traitCollection];
      id v16 = [v15 userInterfaceIdiom];

      id v17 = objc_alloc_init((Class)UITabBar);
      [v17 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
      double v19 = v18;

      id v20 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
      [v20 safeAreaInsets];
      double v22 = v21;

      id v23 = [(BKLibraryBookshelfCollectionViewController *)self bk_rootBarCoordinator];
      id v24 = [v23 miniPlayerViewController];
      int v25 = [v24 view];
      [v25 bounds];
      double v27 = v26;

      double v28 = v19 + v27;
      if (!v8 || v13 == (id)1)
      {
        if (v22 >= v28)
        {
          double v22 = v22 - v28;
          int v30 = v27 > 0.0 ? v8 : 0;
          if (v30 == 1)
          {
            double v31 = 15.0;
            if (!v16) {
              double v31 = 25.0;
            }
            double v22 = v22 - v31;
          }
        }
      }
      else
      {
        double v29 = vabdd_f64(v22, v28);
        if (v27 > 0.0) {
          double v22 = v29;
        }
      }
      id v32 = [(BKLibraryBookshelfCollectionViewController *)self wrapperView];
      [v32 bounds];
      double v34 = v33;
      CGFloat v36 = v35;
      double v38 = v37;
      CGFloat v40 = v39;

      v72.origin.x = v34;
      v72.origin.y = v36;
      v72.size.width = v38;
      v72.size.height = v40;
      CGFloat v41 = CGRectGetMaxY(v72) - v19 - v22;
      v42 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
      id v43 = [v42 view];
      [v43 setFrame:v34, v41, v38, v19];

      sub_1000F7E78(self);
      [(BKLibraryBookshelfCollectionViewController *)self updateSelectAllBarButton];
      [(BKLibraryBookshelfCollectionViewController *)self updateBarButtonsAnimated:v4];
      [(BKLibraryBookshelfCollectionViewController *)self updateActionBarForSelection];
    }
    else
    {
      sub_1000F7E78(self);
      [(BKLibraryBookshelfCollectionViewController *)self updateSelectAllBarButton];
      [(BKLibraryBookshelfCollectionViewController *)self updateBarButtonsAnimated:v4];
      double v9 = [(BKLibraryBookshelfCollectionViewController *)self view];
      [v9 endEditing:1];

      double v10 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v10 layoutIfNeeded];

      [(BKLibraryBookshelfCollectionViewController *)self deselectAll];
    }
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000F85F4;
    v69[3] = &unk_100A44E60;
    v69[4] = self;
    BOOL v70 = v5;
    uint64_t v44 = objc_retainBlock(v69);
    int v45 = v44;
    if (v4)
    {
      int v46 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
      unsigned int v47 = [v46 view];
      [v47 setHidden:0];

      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_1000F8674;
      v67[3] = &unk_100A442B8;
      id v68 = v45;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1000F8684;
      v65[3] = &unk_100A46710;
      v65[4] = self;
      BOOL v66 = v5;
      +[UIView animateWithDuration:v67 animations:v65 completion:0.3];
      id v48 = v68;
    }
    else
    {
      ((void (*)(void *))v44[2])(v44);
      id v48 = [(BKLibraryBookshelfCollectionViewController *)self actionBarViewController];
      uint64_t v49 = [v48 view];
      [v49 setHidden:v5 ^ 1];
    }
    [(BKLibraryBookshelfCollectionViewController *)self setTransitioningToNewLayout:1];
    v50 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [v50 contentOffset];
    -[BKLibraryBookshelfCollectionViewController setPreviousContentOffset:](self, "setPreviousContentOffset:");

    __int16 v51 = [(BKLibraryBookshelfCollectionViewController *)self layout];
    int v52 = [v51 cellMetrics];
    if ([v52 cellType] == 3)
    {
      [(BKLibraryBookshelfCollectionViewController *)self setPreserveContentOffsetInNewLayout:0];
    }
    else
    {
      __int16 v53 = [(BKLibraryBookshelfCollectionViewController *)self layout];
      unsigned int v54 = [v53 cellMetrics];
      if ([v54 cellType] == 4)
      {
        [(BKLibraryBookshelfCollectionViewController *)self setPreserveContentOffsetInNewLayout:0];
      }
      else
      {
        __int16 v55 = [(BKLibraryBookshelfCollectionViewController *)self layout];
        unsigned int v56 = [v55 cellMetrics];
        -[BKLibraryBookshelfCollectionViewController setPreserveContentOffsetInNewLayout:](self, "setPreserveContentOffsetInNewLayout:", [v56 cellType] != 0);
      }
    }

    __int16 v57 = [(BKLibraryBookshelfCollectionViewController *)self layout];
    id v58 = [v57 copy];

    [v58 setEditMode:v5];
    [(BKLibraryBookshelfCollectionViewController *)self setLayout:v58];
    __int16 v59 = [(BKLibraryBookshelfCollectionViewController *)self layout];
    [v59 updateMetricsWithViewController:self];

    objc_initWeak(&location, self);
    int v60 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000F86F0;
    v61[3] = &unk_100A46D38;
    objc_copyWeak(&v62, &location);
    BOOL v63 = v5;
    [v60 setCollectionViewLayout:v58 animated:v4 completion:v61];

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  if ([(BKLibraryBookshelfCollectionViewController *)self transitioningToNewLayout])
  {
    if ([(BKLibraryBookshelfCollectionViewController *)self preserveContentOffsetInNewLayout]|| ([(BKLibraryBookshelfCollectionViewController *)self previousContentOffset], v7 < 0.0))
    {
      [(BKLibraryBookshelfCollectionViewController *)self previousContentOffset];
      CGFloat x = v8;
      CGFloat y = v9;
    }
  }
  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)selectAll
{
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  if ((uint64_t)[v6 numberOfSections] >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      if ((uint64_t)[v6 numberOfItemsInSection:v3] >= 1)
      {
        uint64_t v4 = 0;
        do
        {
          BOOL v5 = +[NSIndexPath indexPathForItem:v4 inSection:v3];
          [v6 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];

          ++v4;
        }
        while (v4 < (uint64_t)[v6 numberOfItemsInSection:v3]);
      }
      ++v3;
    }
    while (v3 < (uint64_t)[v6 numberOfSections]);
  }
  [(BKLibraryBookshelfCollectionViewController *)self updateActionBarForSelection];
}

- (void)deselectAll
{
  uint64_t v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v3 selectItemAtIndexPath:0 animated:1 scrollPosition:0];

  [(BKLibraryBookshelfCollectionViewController *)self updateActionBarForSelection];
}

- (void)dismissPDFPicker
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isSupplementalContentPDFPicker])
  {
    [(BKLibraryBookshelfCollectionViewController *)self cancelButtonPressed:0];
  }
}

- (void)openSelectedBooks
{
  uint64_t v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  uint64_t v4 = [v3 indexPathsForSelectedItems];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000F8AE8;
    v5[3] = &unk_100A46D60;
    v5[4] = self;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)toggleAccessibilityIfNeeded
{
  if (UIAccessibilityIsVoiceOverRunning()
    && [(BKLibraryBookshelfCollectionViewController *)self isEditing])
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    BOOL v5 = [v4 indexPathsForSelectedItems];
    id v6 = [v5 count];

    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"%lu selected books" value:&stru_100A70340 table:0];

    double v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);
    [v3 addObject:v9];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F8CD0;
    block[3] = &unk_100A43D60;
    id v14 = v3;
    uint64_t v10 = qword_100B4A338;
    id v11 = v3;
    if (v10 != -1) {
      dispatch_once(&qword_100B4A338, block);
    }
    id v12 = [v11 componentsJoinedByString:@", "];
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)bookTapped:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(BKLibraryBookshelfCollectionViewController *)self isEditing];
  double v9 = BKLibraryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Open] Processing book tapped at index: %@,  isEditing: %{BOOL}d", (uint8_t *)&v10, 0x12u);
  }

  if ((v8 & 1) == 0)
  {
    [(BKLibraryBookshelfCollectionViewController *)self _dismissIfSupplementContentPDFPicker];
    [(BKLibraryBookshelfCollectionViewController *)self openItemAtIndexPath:v6 completion:v7];
  }
}

- (void)_dismissIfSupplementContentPDFPicker
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isSupplementalContentPDFPicker])
  {
    [(BKLibraryBookshelfCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)directBuyTapped:(id)a3 buyParameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  __int16 v12 = [v11 booksDataSource];
  unsigned int v13 = [v12 representedObjectForIndexPath:v10];

  id v14 = [v13 isAudiobook];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000F8FD0;
  v16[3] = &unk_100A46D88;
  id v17 = v8;
  id v15 = v8;
  +[BKBookPurchaseAction tryToPurchaseBook:v13 libraryAssetProvider:0 buyParameters:v9 allowPurchaseFromNonSampleBuyButton:1 suppressNetworkEvaluatorDialogs:v14 analyticsInfo:0 completion:v16];
}

- (void)showReadingListsForActionHandler:(id)a3
{
  id v7 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BSUILibraryCollectionUIProvider];
  objc_opt_class();
  uint64_t v4 = [v7 libraryCollectionListViewControllerWithAssetIDs:0 knownAssetTypes:0 knownStoreAssetIDs:0 containsSeriesContainer:0 showDivider:0];
  BOOL v5 = BUDynamicCast();

  [v5 bsui_setPrefersExtraCompactNavBarMargin:1];
  id v6 = [(BKLibraryBookshelfCollectionViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)presentReadingListsPopoverFromItem:(id)a3
{
  id v4 = a3;
  id v8 = [(BKLibraryBookshelfCollectionViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BSUILibraryCollectionUIProvider];
  if (_os_feature_enabled_impl()) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = _os_feature_enabled_impl();
  }
  objc_opt_class();
  id v6 = [v8 libraryCollectionListViewControllerWithAssetIDs:0 knownAssetTypes:0 knownStoreAssetIDs:0 containsSeriesContainer:0 showDivider:v5];
  id v7 = BUDynamicCast();

  [v7 setSupressLargeTitle:1];
  [(BKLibraryBookshelfCollectionViewController *)self _showPopoverViewController:v7 fromItem:v4];
}

- (void)dismissReadingListPopover
{
  id v2 = [(BKLibraryBookshelfCollectionViewController *)self presentedReadingListPopover];
  [v2 im_dismissAnimated:0];
}

- (void)_showPopoverViewController:(id)a3 fromItem:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F936C;
  v11[3] = &unk_100A443C8;
  id v12 = a3;
  unsigned int v13 = self;
  id v14 = a4;
  id v6 = v14;
  id v7 = v12;
  id v8 = objc_retainBlock(v11);
  id v9 = [(BKLibraryBookshelfCollectionViewController *)self bc_descendentPresentedViewController];

  if (v9)
  {
    id v10 = [(BKLibraryBookshelfCollectionViewController *)self bc_descendentPresentedViewController];
    [v10 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return [(BKLibraryBookshelfCollectionViewController *)self isEditing] ^ 1;
}

- (BOOL)canSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v6 = [v5 booksDataSource];
  id v7 = [v6 representedObjectForIndexPath:v4];

  objc_opt_class();
  id v8 = BUDynamicCast();
  unsigned int v9 = [v8 state];
  if ([(BKLibraryBookshelfCollectionViewController *)self isEditing])
  {
    unsigned __int8 v10 = [(BKLibraryBookshelfCollectionViewController *)self isEditing];
    if (v9 == 2) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v10;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)shouldAllowCellSelection
{
  int v2 = _AXSFullKeyboardAccessEnabled();
  if (v2) {
    LOBYTE(v2) = GSEventIsHardwareKeyboardAttached() != 0;
  }
  return v2;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return [(BKLibraryBookshelfCollectionViewController *)self canSelectItemAtIndexPath:a4];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isEditing])
  {
    [(BKLibraryBookshelfCollectionViewController *)self toggleAccessibilityIfNeeded];
    [(BKLibraryBookshelfCollectionViewController *)self updateActionBarForSelection];
  }
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  return [(BKLibraryBookshelfCollectionViewController *)self isEditing] ^ 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = [v6 cellForItemAtIndexPath:v5];
  BUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 handleTapIfPossible];
  [v6 deselectItemAtIndexPath:v5 animated:1];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  if ([(BKLibraryBookshelfCollectionViewController *)self isEditing])
  {
    [(BKLibraryBookshelfCollectionViewController *)self toggleAccessibilityIfNeeded];
    [(BKLibraryBookshelfCollectionViewController *)self updateActionBarForSelection];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v11 collectionView:v10 willDisplayCell:v9 forItemAtIndexPath:v8];
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v14 collectionView:v13 willDisplaySupplementaryView:v12 forElementKind:v11 atIndexPath:v10];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v11 collectionView:v10 didEndDisplayingCell:v9 forItemAtIndexPath:v8];
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  [v14 collectionView:v13 didEndDisplayingSupplementaryView:v12 forElementOfKind:v11 atIndexPath:v10];
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = +[NSDate date];
  contextMenuAppearDate = self->_contextMenuAppearDate;
  self->_contextMenuAppearDate = v6;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [a4 identifier:a3];
  objc_opt_class();
  uint64_t v7 = BUDynamicCast();
  id v8 = (void *)v7;
  if (v7)
  {
    uint64_t v21 = v7;
    id v9 = +[NSArray arrayWithObjects:&v21 count:1];
    id v10 = [(BKLibraryBookshelfCollectionViewController *)self booksAtIndexPaths:v9];
    id v11 = [(BKLibraryBookshelfCollectionViewController *)self collection];
    id v12 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    id v13 = [v12 cellForItemAtIndexPath:v8];
    id v14 = sub_1000F9B38(self, v10, v11, v13, 0, 0);

    id v15 = +[BAEventReporter sharedReporter];
    id v16 = [(BKLibraryBookshelfCollectionViewController *)self ba_effectiveAnalyticsTracker];
    contextMenuAppearDate = self->_contextMenuAppearDate;
    double v18 = +[BKContextMenuProvider sharedProvider];
    double v19 = [v18 analyticsAssetPropertyProviderForDataModel:v14];
    [v15 emitContextualActionSheetExposureEventWithTracker:v16 startDate:contextMenuAppearDate propertyProvider:v19];
  }
  id v20 = self->_contextMenuAppearDate;
  self->_contextMenuAppearDate = 0;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 contextMenuInteraction];
  id v12 = [v11 menuAppearance];

  if (v12 == (id)2)
  {
    objc_initWeak(&location, self);
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1000FA028;
    double v18 = &unk_100A46DB0;
    objc_copyWeak(v21, &location);
    id v19 = v9;
    id v20 = v10;
    v21[1] = *(id *)&x;
    v21[2] = *(id *)&y;
    id v13 = +[UIContextMenuConfiguration configurationWithIdentifier:v20 previewProvider:0 actionProvider:&v15];
    [v13 setPreferredMenuElementOrder:2 v15, v16, v17, v18];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForSelectedItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 contextMenuInteraction];
  id v10 = [v9 menuAppearance];

  if (v10 == (id)2)
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FA514;
    v13[3] = &unk_100A46DD8;
    objc_copyWeak(&v15, &location);
    id v14 = v8;
    id v11 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];
    [v11 setPreferredMenuElementOrder:2];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)coverEffectsNightMode
{
  objc_opt_class();
  uint64_t v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v4 = BUDynamicCast();

  LOBYTE(v3) = [v4 currentUserInterfaceStyle] == (id)2;
  return (char)v3;
}

- (unint64_t)coverEffectsContent
{
  return 1;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (BOOL)hasAnySeriesContainerSelected
{
  int v2 = self;
  uint64_t v3 = [(BKLibraryBookshelfCollectionViewController *)self selectedBooks];
  LOBYTE(v2) = [(BKLibraryBookshelfCollectionViewController *)v2 hasAnySeriesContainerInLibraryAssets:v3];

  return (char)v2;
}

- (BOOL)hasAnySeriesContainerInLibraryAssets:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isValid", (void)v9)
          && ([v7 isContainer] & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (BOOL)hasAnyDeletableBookSelected
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self selectedBooks];
  if (v3)
  {
    id v4 = +[NSSet setWithArray:v3];
  }
  else
  {
    id v4 = 0;
  }
  if ([v4 count])
  {
    uint64_t v5 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v6 = [v5 supplementaryDataSource];
    id v7 = [v6 collection];

    id v8 = objc_alloc((Class)BKDeleteActionItemsProvider);
    long long v9 = [v7 collectionID];
    id v10 = [v8 initWithBooks:v4 currentCollectionId:v9];

    long long v11 = [v10 actionItems];
  }
  else
  {
    long long v11 = 0;
  }
  BOOL v12 = [v11 count] != 0;

  return v12;
}

- (void)removeForSelectedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v7 = [v5 indexPathsForSelectedItems];

  id v6 = [v4 trashButton];

  [(BKLibraryBookshelfCollectionViewController *)self _removalAttemptForItemsAtIndexPaths:v7 sourceBarButtonItem:v6];
}

- (void)removeForSelectedItems
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  [(BKLibraryBookshelfCollectionViewController *)self _removalAttemptForItemsAtIndexPaths:v4 sourceBarButtonItem:0];
}

- (void)_removalAttemptForItemsAtIndexPaths:(id)a3 sourceBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryBookshelfCollectionViewController *)self booksAtIndexPaths:v6];
  if ([v8 count])
  {
    long long v9 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
    id v10 = [v9 booksDataSource];
    id v11 = [v10 totalNumberOfItems];
    LOBYTE(v11) = v11 == [v8 count];

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000FAC4C;
    v12[3] = &unk_100A46E28;
    void v12[4] = self;
    id v13 = v8;
    objc_copyWeak(&v14, &location);
    char v15 = (char)v11;
    [(BKLibraryBookshelfCollectionViewController *)self deleteBooks:v13 sourceBarButtonItem:v7 completion:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

- (void)shareSelectedItemFromBarButtonItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLibraryBookshelfCollectionViewController *)self selectedBooks];
  if ([v5 count] == (id)1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000FAE8C;
    v6[3] = &unk_100A443C8;
    v6[4] = self;
    id v7 = v5;
    id v8 = v4;
    [(BKLibraryBookshelfCollectionViewController *)self _presentUsingBlock:v6];
  }
}

- (void)addForSelectedItems:(id)a3
{
  id v4 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v5 = [v4 indexPathsForSelectedItems];

  [(BKLibraryBookshelfCollectionViewController *)self _addToCollectionAttemptForItemsAtIndexPaths:v5];
}

- (void)_addToCollectionAttemptForItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self booksAtIndexPaths:v4];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FB0A4;
  v7[3] = &unk_100A46398;
  objc_copyWeak(&v9, &location);
  id v6 = v5;
  id v8 = v6;
  [(BKLibraryBookshelfCollectionViewController *)self _addSelectedBooksToReadingList:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)doneForSelectedItems:(id)a3
{
}

- (void)_presentUsingBlock:(id)a3
{
  id v8 = (void (**)(void))a3;
  id v4 = [(BKLibraryBookshelfCollectionViewController *)self presentedViewController];
  id v5 = [v4 presentingViewController];

  if (v5)
  {
    id v6 = [(BKLibraryBookshelfCollectionViewController *)self presentedViewController];
    id v7 = [v6 presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    v8[2]();
  }
}

- (void)deleteBooks:(id)a3 sourceBarButtonItem:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FB3A8;
  v10[3] = &unk_100A45980;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(BKLibraryBookshelfCollectionViewController *)v11 _presentUsingBlock:v10];
}

- (void)didUpdateLibraryBookshelfLayout:(id)a3
{
  id v4 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  if ([v4 isDragging])
  {
  }
  else
  {
    id v5 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    unsigned __int8 v6 = [v5 isDecelerating];

    if ((v6 & 1) == 0)
    {
      [(BKLibraryBookshelfCollectionViewController *)self updateActionBarFromMetrics];
      [(BKLibraryBookshelfCollectionViewController *)self updateTitleFromMetrics];
    }
  }
  id v7 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v8 = [v7 backgroundColor];
  id v9 = [(BKLibraryBookshelfCollectionViewController *)self layout];
  id v10 = [v9 mainHeaderMetrics];
  id v11 = [v10 headerBackgroundColor];
  unsigned __int8 v12 = [v8 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    if ([(BKLibraryBookshelfCollectionViewController *)self hasInitializedCollectionBackgroundColor])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000FB644;
      v17[3] = &unk_100A43D60;
      void v17[4] = self;
      +[UIView animateWithDuration:v17 animations:0.3];
    }
    else
    {
      [(BKLibraryBookshelfCollectionViewController *)self setHasInitializedCollectionBackgroundColor:1];
      id v16 = [(BKLibraryBookshelfCollectionViewController *)self layout];
      id v13 = [v16 mainHeaderMetrics];
      id v14 = [v13 headerBackgroundColor];
      char v15 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
      [v15 setBackgroundColor:v14];
    }
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  id v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  [(BKLibraryBookshelfCollectionViewController *)&v11 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FB7D0;
  v10[3] = &unk_100A44DA8;
  void v10[4] = self;
  [v6 animateAlongsideTransition:v10 completion:&stru_100A46E68];
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  if ([(BKLibraryBookshelfCollectionViewController *)self shouldAllowCellSelection])
  {
    id v8 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [v8 selectItemAtIndexPath:v9 animated:v6 scrollPosition:a5];
  }
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(BKLibraryBookshelfCollectionViewController *)self shouldAllowCellSelection])
  {
    BOOL v6 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
    [v6 deselectItemAtIndexPath:v7 animated:v4];
  }
}

- (id)indexPathForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  BOOL v6 = [v5 indexPathForCell:v4];

  return v6;
}

- (BOOL)isAudiobookAtIndexpath:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  BOOL v6 = [v5 booksDataSource];
  id v7 = [v6 representedObjectForIndexPath:v4];

  LOBYTE(v5) = [v7 isAudiobook];
  return (char)v5;
}

- (BOOL)allowsOpeningBooks
{
  return [(BKLibraryBookshelfCollectionViewController *)self isEditing] ^ 1;
}

- (id)bkaxLabel
{
  int v2 = [(BKLibraryBookshelfCollectionViewController *)self collection];
  id v3 = [v2 localizedTitle];

  return v3;
}

- (void)didBecomeVisibleContentScrollView
{
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self tabBarController];
  [v3 bc_setPreferredTabBarScrollEdgeAppearance:0];

  id v6 = [(BKLibraryBookshelfCollectionViewController *)self tabBarController];
  id v4 = [v6 selectedViewController];
  id v5 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  [v4 setContentScrollView:v5 forEdge:4];
}

- (void)_bkAccessibilityFocusCollectionView
{
  UIAccessibilityNotifications v2 = UIAccessibilityLayoutChangedNotification;
  id v3 = [(BKLibraryBookshelfCollectionViewController *)self collectionView];
  UIAccessibilityPostNotification(v2, v3);
}

- (BOOL)accessibilityPerformEscape
{
  unsigned int v3 = [(BKLibraryBookshelfCollectionViewController *)self isEditing];
  if (v3) {
    [(BKLibraryBookshelfCollectionViewController *)self doneForSelectedItems:0];
  }
  return v3;
}

- (BKCollection)collection
{
  return self->_collection;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BKLibraryBookshelfLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (BSUINavigationItem)bsuiNavigationItem
{
  return self->_bsuiNavigationItem;
}

- (UICollectionViewDragDelegate)dragDelegate
{
  return self->_dragDelegate;
}

- (UICollectionViewDropDelegate)dropDelegate
{
  return self->_dropDelegate;
}

- (BKLibraryDataSourceAdaptor)dataSourceAdaptor
{
  return self->_dataSourceAdaptor;
}

- (int64_t)dragAndDropSessionsActive
{
  return self->_dragAndDropSessionsActive;
}

- (void)setDragAndDropSessionsActive:(int64_t)a3
{
  self->_dragAndDropSessionsActive = a3;
}

- (UIButton)_collectionBackingButton
{
  return self->__collectionBackingButton;
}

- (void)set_collectionBackingButton:(id)a3
{
}

- (UIBarButtonItem)_readingListBackingButton
{
  return self->__readingListBackingButton;
}

- (void)set_readingListBackingButton:(id)a3
{
}

- (BKCollection)allBooksCollection
{
  return self->_allBooksCollection;
}

- (void)setAllBooksCollection:(id)a3
{
}

- (BKLibraryBookshelfSelectedActionBarViewController)actionBarViewController
{
  return self->_actionBarViewController;
}

- (void)setActionBarViewController:(id)a3
{
}

- (UIBarButtonItem)navBarEditButtonItem
{
  return self->_navBarEditButtonItem;
}

- (void)setNavBarEditButtonItem:(id)a3
{
}

- (UIBarButtonItem)navBarSelectAllButtonItem
{
  return self->_navBarSelectAllButtonItem;
}

- (void)setNavBarSelectAllButtonItem:(id)a3
{
}

- (UIView)wrapperView
{
  return self->_wrapperView;
}

- (void)setWrapperView:(id)a3
{
}

- (BOOL)ubiquityDeleteWarningShown
{
  return self->_ubiquityDeleteWarningShown;
}

- (void)setUbiquityDeleteWarningShown:(BOOL)a3
{
  self->_ubiquityDeleteWarningShown = a3;
}

- (BOOL)hasInitializedCollectionBackgroundColor
{
  return self->_hasInitializedCollectionBackgroundColor;
}

- (void)setHasInitializedCollectionBackgroundColor:(BOOL)a3
{
  self->_hasInitializedCollectionBackgroundColor = a3;
}

- (BOOL)transitioningToNewLayout
{
  return self->_transitioningToNewLayout;
}

- (void)setTransitioningToNewLayout:(BOOL)a3
{
  self->_transitioningToNewLayout = a3;
}

- (BOOL)preserveContentOffsetInNewLayout
{
  return self->_preserveContentOffsetInNewLayout;
}

- (void)setPreserveContentOffsetInNewLayout:(BOOL)a3
{
  self->_preserveContentOffsetInNewLayout = a3;
}

- (CGPoint)previousContentOffset
{
  double x = self->_previousContentOffset.x;
  double y = self->_previousContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousContentOffset:(CGPoint)a3
{
  self->_previousContentOffset = a3;
}

- (id)addSelectedBooksCompletion
{
  return self->_addSelectedBooksCompletion;
}

- (void)setAddSelectedBooksCompletion:(id)a3
{
}

- (BOOL)shouldAccessibilityFocusCollectionViewUponAppearing
{
  return self->_shouldAccessibilityFocusCollectionViewUponAppearing;
}

- (void)setShouldAccessibilityFocusCollectionViewUponAppearing:(BOOL)a3
{
  self->_shouldAccessibilityFocusCollectionViewUponAppearing = a3;
}

- (UIViewController)presentedReadingListPopover
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedReadingListPopover);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentedReadingListPopover:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedReadingListPopover);
  objc_storeStrong(&self->_addSelectedBooksCompletion, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_navBarSelectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_navBarEditButtonItem, 0);
  objc_storeStrong((id *)&self->_actionBarViewController, 0);
  objc_storeStrong((id *)&self->_allBooksCollection, 0);
  objc_storeStrong((id *)&self->__readingListBackingButton, 0);
  objc_storeStrong((id *)&self->__collectionBackingButton, 0);
  objc_storeStrong((id *)&self->_dataSourceAdaptor, 0);
  objc_storeStrong((id *)&self->_dropDelegate, 0);
  objc_storeStrong((id *)&self->_dragDelegate, 0);
  objc_storeStrong((id *)&self->_bsuiNavigationItem, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_analyticsStartDate, 0);

  objc_storeStrong((id *)&self->_contextMenuAppearDate, 0);
}

- (BOOL)hasSelectedItems
{
  UIAccessibilityNotifications v2 = self;
  unsigned int v3 = [(BKLibraryBookshelfCollectionViewController *)v2 collectionView];
  if (v3)
  {
    id v4 = v3;
    id v5 = [(UICollectionView *)v3 indexPathsForSelectedItems];

    if (v5)
    {
      sub_1007F2E40();
      sub_1007FDFF0();

      sub_100058D18(&qword_100B2C098);
      sub_10030684C((unint64_t *)&unk_100B2C0A0, &qword_100B2C098);
      LOBYTE(v5) = sub_1007FE2B0();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  else
  {

    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  UIAccessibilityNotifications v2 = self;
  unsigned int v3 = [(BKLibraryBookshelfCollectionViewController *)v2 collectionView];
  if (v3)
  {
    id v4 = v3;
    sub_100058D18((uint64_t *)&unk_100B28F90);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100861BE0;
    *(void *)(v5 + 32) = v4;
    sub_1007FE010();
  }

  sub_100058D18((uint64_t *)&unk_100B2C160);
  v6.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (NSArray)keyCommands
{
  UIAccessibilityNotifications v2 = self;
  unint64_t v3 = BKLibraryBookshelfCollectionViewController.keyCommands.getter();

  if (v3)
  {
    sub_10004A860(0, &qword_100B2C0B0);
    v4.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    NSArray v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = self;
  }
  char v8 = BKLibraryBookshelfCollectionViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_10005AFE8((uint64_t)v10, (uint64_t *)&unk_100B269C0);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  BKLibraryBookshelfCollectionViewController.validate(_:)((UICommand)v4);
}

- (void)selectAll:(id)a3
{
}

- (void)dismissPDFPicker:(id)a3
{
}

- (void)delete:(id)a3
{
}

- (void)updateBarButtonsAnimated:(BOOL)a3
{
  id v4 = self;
  if ([(BKLibraryBookshelfCollectionViewController *)v4 isEditing]) {
    sub_1003169D8(a3);
  }
  else {
    sub_100316C50(a3);
  }
  sub_100317D24();
}

- (void)viewModeChanged
{
  UIAccessibilityNotifications v2 = self;
  BKLibraryBookshelfCollectionViewController.viewModeChanged()();
}

- (void)sortModeChanged
{
  UIAccessibilityNotifications v2 = self;
  BKLibraryBookshelfCollectionViewController.sortModeChanged()();
}

- (void)editButtonPressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v5 = self;
  }
  NSArray v6 = [(BKLibraryBookshelfCollectionViewController *)self dataSourceAdaptor];
  id v7 = [(BKLibraryDataSourceAdaptor *)v6 actionHandler];

  [(BKLibraryActionHandler *)v7 toggleEditMode];
  sub_10005AFE8((uint64_t)&v8, (uint64_t *)&unk_100B269C0);
}

- (void)largeTitleVisibilityDidChangeWithIsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = self;
  id v4 = (BKLibraryBookshelfCollectionViewController *)sub_10031A67C();
  if (v4)
  {
    uint64_t v5 = v4;
    if ([(BKLibraryBookshelfCollectionViewController *)v4 isHidden] != v3) {
      [(BKLibraryBookshelfCollectionViewController *)v5 setHidden:v3];
    }

    NSArray v6 = v5;
  }
  else
  {
    NSArray v6 = v7;
  }
}

- (void)dragAndDropSessionDidStart
{
  BOOL v3 = self;
  UIAccessibilityNotifications v2 = [(BKLibraryBookshelfCollectionViewController *)v3 dragAndDropSessionsActive];
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    [(BKLibraryBookshelfCollectionViewController *)v3 setDragAndDropSessionsActive:v2 + 1];
    [(BKLibraryBookshelfCollectionViewController *)v3 configureForDragAndDropSession];
  }
}

- (void)dragAndDropSessionDidEnd
{
  BOOL v3 = self;
  UIAccessibilityNotifications v2 = [(BKLibraryBookshelfCollectionViewController *)v3 dragAndDropSessionsActive];
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    [(BKLibraryBookshelfCollectionViewController *)v3 setDragAndDropSessionsActive:v2 - 1];
    [(BKLibraryBookshelfCollectionViewController *)v3 configureForDragAndDropSession];
  }
}

- (void)configureForDragAndDropSession
{
  sub_10004A860(0, (unint64_t *)&qword_100B235A0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  BOOL v3 = self;
  swift_retain();
  sub_1007FE6C0();

  swift_release_n();
}

- (void)books_open:(id)a3
{
}

- (void)books_viewAsGrid:(id)a3
{
}

- (void)books_viewAsList:(id)a3
{
}

- (void)books_viewAllInSeries:(id)a3
{
}

- (void)books_viewOnlyPurchased:(id)a3
{
}

- (void)books_sortByLastOpened:(id)a3
{
}

- (void)books_sortByTitle:(id)a3
{
}

- (void)books_sortByAuthor:(id)a3
{
}

- (void)books_sortManually:(id)a3
{
}

- (void)createSeriesViewControllerFromSeriesContainer:(BKLibraryAsset *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v9 - 8);
  objc_super v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  void v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  char v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  void v15[4] = &unk_100B2C0E8;
  v15[5] = v13;
  id v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  void v16[4] = &unk_100B2C0F0;
  v16[5] = v15;
  id v17 = a3;
  double v18 = a4;
  id v19 = self;
  sub_1006EB59C((uint64_t)v11, (uint64_t)&unk_100B33060, (uint64_t)v16);
  swift_release();
}

@end