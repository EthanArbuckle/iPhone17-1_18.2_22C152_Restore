@interface PXGadgetUIViewController
+ (Class)gadgetSpecClass;
- (BOOL)_isUsingDeprecatedViewLoadingForGadget:(id)a3;
- (BOOL)allowsBarManagement;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4;
- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (BOOL)isBatchUpdating;
- (BOOL)isContentVisible;
- (BOOL)isCurrentlyVisible;
- (BOOL)isDFITogglingSidebar;
- (BOOL)isGadgetAnimating;
- (BOOL)isInteractionPreviewCancelled;
- (BOOL)isLoadingGadgets;
- (BOOL)isRootGadgetViewController;
- (BOOL)isRotatingVerticalLayout;
- (BOOL)isScrolling;
- (BOOL)isTogglingSidebarNoRotating;
- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3;
- (BOOL)shouldPreventPlaceholder;
- (CGRect)visibleBounds;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSMutableSet)cellsWantingVisibleRectUpdates;
- (NSMutableSet)seenGadgetIdentifiers;
- (NSTimer)gadgetSeenTimer;
- (OS_os_log)gadgetViewControllerLog;
- (PXGadget)interactionPreviewGadget;
- (PXGadget)selectedGadget;
- (PXGadgetCollectionViewLayout)layout;
- (PXGadgetDataSource)dataSource;
- (PXGadgetDataSourceManager)dataSourceManager;
- (PXGadgetDelegate)nextGadgetResponder;
- (PXGadgetSpecManager)specManager;
- (PXGadgetUIViewController)initWithLayout:(id)a3 dataSourceManager:(id)a4;
- (PXGadgetUpdateFlags)updateFlags;
- (PXUpdater)updater;
- (UIColor)backgroundColor;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)insetsForSectionHeaders;
- (UIView)interactionPreviewView;
- (id)_gadgetAtIndexPath:(id)a3;
- (id)_gadgetForCollectionViewCell:(id)a3;
- (id)_indexPathForGadget:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)debugURLsForDiagnostics;
- (id)gadgetAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)presentationEnvironmentForGadget:(id)a3;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (int64_t)_scrollAxis;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)scrollAnimationIdentifier;
- (unint64_t)numberOfInitialGadgetsToLoad;
- (void)_addContextMenuInteraction;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_clearTimerToHandleGadgetsSeen;
- (void)_dataSourceManagerDidChange;
- (void)_gadgetSpecDidChange;
- (void)_handleGadgetsSeen;
- (void)_initializeDataSource;
- (void)_initializeHelpers;
- (void)_notifyGadgetsThatGadgetControllerHasAppeared;
- (void)_notifyGadgetsThatGadgetControllerHasDisappeared;
- (void)_notifyGadgetsThatGadgetWasDismissed;
- (void)_notifyPresentedGadgetsOfVisibilityChange;
- (void)_removeContextMenuInteraction;
- (void)_scrollViewDidEndScrolling;
- (void)_setGadget:(id)a3 forCollectionViewCell:(id)a4;
- (void)_setTimerToHandleGadgetsSeen;
- (void)_updateGadgetVisibleRects;
- (void)_updateVisibleRectForGadget:(id)a3 inCell:(id)a4 collectionView:(id)a5;
- (void)_updaterNeedsUpdate;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)gadget:(id)a3 animateChanges:(id)a4;
- (void)gadget:(id)a3 didChange:(unint64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadContent;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBatchUpdating:(BOOL)a3;
- (void)setCellsWantingVisibleRectUpdates:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setCurrentlyVisible:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setGadgetAnimating:(BOOL)a3;
- (void)setGadgetSeenTimer:(id)a3;
- (void)setInteractionPreviewGadget:(id)a3;
- (void)setInteractionPreviewView:(id)a3;
- (void)setIsDFITogglingSidebar:(BOOL)a3;
- (void)setIsInteractionPreviewCancelled:(BOOL)a3;
- (void)setIsRotatingVerticalLayout:(BOOL)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setLoadingGadgets:(BOOL)a3;
- (void)setNumberOfInitialGadgetsToLoad:(unint64_t)a3;
- (void)setSeenGadgetIdentifiers:(id)a3;
- (void)setSelectedGadget:(id)a3;
- (void)setSpecManager:(id)a3;
- (void)setUpdateFlags:(PXGadgetUpdateFlags)a3;
- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4;
- (void)splitViewController:(id)a3 willChangeSidebarVisibility:(BOOL)a4;
- (void)updateIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PXGadgetUIViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellsWantingVisibleRectUpdates, 0);
  objc_storeStrong((id *)&self->_seenGadgetIdentifiers, 0);
  objc_storeStrong((id *)&self->_gadgetSeenTimer, 0);
  objc_storeStrong((id *)&self->_selectedGadget, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_interactionPreviewView, 0);
  objc_storeStrong((id *)&self->_interactionPreviewGadget, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_cellsToGadgets, 0);
  objc_storeStrong((id *)&self->_registeredCellReuseIdentifiers, 0);
}

- (BOOL)allowsBarManagement
{
  return self->_allowsBarManagement;
}

- (BOOL)shouldPreventPlaceholder
{
  return self->_shouldPreventPlaceholder;
}

- (void)setIsRotatingVerticalLayout:(BOOL)a3
{
  self->_isRotatingVerticalLayout = a3;
}

- (BOOL)isRotatingVerticalLayout
{
  return self->_isRotatingVerticalLayout;
}

- (void)setIsDFITogglingSidebar:(BOOL)a3
{
  self->_isDFITogglingSidebar = a3;
}

- (BOOL)isDFITogglingSidebar
{
  return self->_isDFITogglingSidebar;
}

- (void)setCellsWantingVisibleRectUpdates:(id)a3
{
}

- (NSMutableSet)cellsWantingVisibleRectUpdates
{
  return self->_cellsWantingVisibleRectUpdates;
}

- (BOOL)isContentVisible
{
  return self->_isContentVisible;
}

- (void)setSeenGadgetIdentifiers:(id)a3
{
}

- (NSMutableSet)seenGadgetIdentifiers
{
  return self->_seenGadgetIdentifiers;
}

- (void)setGadgetSeenTimer:(id)a3
{
}

- (NSTimer)gadgetSeenTimer
{
  return self->_gadgetSeenTimer;
}

- (void)setUpdateFlags:(PXGadgetUpdateFlags)a3
{
  self->_updateFlags = a3;
}

- (PXGadgetUpdateFlags)updateFlags
{
  return self->_updateFlags;
}

- (void)setSelectedGadget:(id)a3
{
}

- (PXGadget)selectedGadget
{
  return self->_selectedGadget;
}

- (void)setSpecManager:(id)a3
{
}

- (PXGadgetSpecManager)specManager
{
  return self->_specManager;
}

- (void)setBatchUpdating:(BOOL)a3
{
  self->_batchUpdating = a3;
}

- (BOOL)isBatchUpdating
{
  return self->_batchUpdating;
}

- (void)setGadgetAnimating:(BOOL)a3
{
  self->_gadgetAnimating = a3;
}

- (BOOL)isGadgetAnimating
{
  return self->_gadgetAnimating;
}

- (void)setLoadingGadgets:(BOOL)a3
{
  self->_loadingGadgets = a3;
}

- (BOOL)isLoadingGadgets
{
  return self->_loadingGadgets;
}

- (void)setCurrentlyVisible:(BOOL)a3
{
  self->_currentlyVisible = a3;
}

- (BOOL)isCurrentlyVisible
{
  return self->_currentlyVisible;
}

- (PXGadgetDataSource)dataSource
{
  return self->_dataSource;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setIsInteractionPreviewCancelled:(BOOL)a3
{
  self->_isInteractionPreviewCancelled = a3;
}

- (BOOL)isInteractionPreviewCancelled
{
  return self->_isInteractionPreviewCancelled;
}

- (void)setInteractionPreviewView:(id)a3
{
}

- (UIView)interactionPreviewView
{
  return self->_interactionPreviewView;
}

- (void)setInteractionPreviewGadget:(id)a3
{
}

- (PXGadget)interactionPreviewGadget
{
  return self->_interactionPreviewGadget;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (PXGadgetCollectionViewLayout)layout
{
  return self->_layout;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setNumberOfInitialGadgetsToLoad:(unint64_t)a3
{
  self->_numberOfInitialGadgetsToLoad = a3;
}

- (unint64_t)numberOfInitialGadgetsToLoad
{
  return self->_numberOfInitialGadgetsToLoad;
}

- (PXGadgetDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (int64_t)scrollAnimationIdentifier
{
  return 0;
}

- (OS_os_log)gadgetViewControllerLog
{
  if (gadgetViewControllerLog_onceToken != -1) {
    dispatch_once(&gadgetViewControllerLog_onceToken, &__block_literal_global_337_149419);
  }
  v2 = (void *)gadgetViewControllerLog_sectionedDataSourceLog;
  return (OS_os_log *)v2;
}

void __51__PXGadgetUIViewController_gadgetViewControllerLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "GadgetViewController");
  v1 = (void *)gadgetViewControllerLog_sectionedDataSourceLog;
  gadgetViewControllerLog_sectionedDataSourceLog = (uint64_t)v0;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXGadgetUIViewController;
  v8 = -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v13, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  v9 = (void *)[v8 mutableCopy];

  v10 = -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  if (objc_opt_respondsToSelector())
  {
    v11 = objc_msgSend(v10, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v7, x, y);
    [v9 addObjectsFromArray:v11];
  }
  return v9;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PXGadgetUIViewController *)self collectionView];
  objc_msgSend(v4, "px_scrollToEdge:animated:", 1, v3);

  return 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXDataSourceManagerObservationContext_149425 == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    id v9 = v8;
    [(PXGadgetUIViewController *)self _dataSourceManagerDidChange];
    goto LABEL_7;
  }
  if ((v6 & 1) != 0 && (void *)PXGadgetSpecManagerObservationContext == a5)
  {
    id v9 = v8;
    [(PXGadgetUIViewController *)self _gadgetSpecDidChange];
LABEL_7:
    id v8 = v9;
  }
LABEL_8:
}

- (void)_gadgetSpecDidChange
{
  id v19 = [(PXGadgetUIViewController *)self specManager];
  BOOL v3 = [(PXGadgetUIViewController *)self layout];
  v4 = [v19 currentGadgetSpec];
  [v3 setSpec:v4];

  v5 = [v19 currentGadgetSpec];
  [v5 contentInsets];
  double v7 = v6;
  double v9 = v8;

  v10 = [(PXGadgetUIViewController *)self navigationItem];
  [v10 largeTitleInsets];
  if (v7 == v14 && v11 == 0.0 && v9 == v13)
  {
    double v15 = v12;

    if (v15 == 0.0) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v16 = [(PXGadgetUIViewController *)self navigationItem];
  objc_msgSend(v16, "setLargeTitleInsets:", 0.0, v7, 0.0, v9);

  v17 = [(PXGadgetUIViewController *)self navigationItem];
  v18 = [v17 navigationBar];
  [v18 setNeedsLayout];

LABEL_8:
  if (![(PXGadgetUIViewController *)self isBatchUpdating]) {
    [v3 invalidateLayout];
  }
}

- (void)_dataSourceManagerDidChange
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v4 = [(PXGadgetUIViewController *)self collectionView];
  v5 = [(PXGadgetUIViewController *)self dataSourceManager];
  double v6 = [(PXGadgetUIViewController *)self dataSource];
  double v7 = [v5 dataSource];
  v23 = [(PXGadgetUIViewController *)self specManager];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__149426;
  v49 = __Block_byref_object_dispose__149427;
  _GetChangeDetails(v5, [v6 identifier], objc_msgSend(v7, "identifier"));
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  if ([(PXGadgetUIViewController *)self isCurrentlyVisible])
  {
    double v8 = PLGadgetsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Gadget view controller is visible and evaulating changes.", buf, 2u);
    }

    double v9 = [(id)v46[5] sectionChanges];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    char v44 = [v9 hasIncrementalChanges];
    if (!*((unsigned char *)v42 + 24)) {
      goto LABEL_14;
    }
    v10 = [(id)v46[5] sectionsWithItemChanges];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke;
    v40[3] = &unk_1E5DBF6C8;
    v40[4] = &v45;
    v40[5] = &v41;
    [v10 enumerateIndexesUsingBlock:v40];

    if (*((unsigned char *)v42 + 24))
    {
      double v11 = PLGadgetsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = (void *)v46[5];
        *(_DWORD *)buf = 138412290;
        v52 = v12;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Gadget view controller will perform UICollectionView batch updates with change details: %@", buf, 0xCu);
      }

      [(PXGadgetUIViewController *)self setBatchUpdating:1];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_329;
      v32[3] = &unk_1E5DBF740;
      v32[4] = self;
      id v33 = v7;
      id v34 = v9;
      id v35 = v4;
      SEL v39 = a2;
      id v36 = v6;
      v38 = &v45;
      id v37 = v23;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2_333;
      v24[3] = &unk_1E5DBF768;
      id v25 = v35;
      id v26 = v34;
      id v27 = v33;
      v28 = self;
      id v29 = v5;
      v31 = &v45;
      id v30 = v36;
      [v25 performBatchUpdates:v32 completion:v24];
    }
    else
    {
LABEL_14:
      v16 = PLGadgetsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v7 publiclySafeDescription];
        v18 = [v6 publiclySafeDescription];
        uint64_t v19 = [v4 numberOfSections];
        uint64_t v20 = v46[5];
        *(_DWORD *)buf = 138544130;
        v52 = v17;
        __int16 v53 = 2114;
        v54 = v18;
        __int16 v55 = 2048;
        uint64_t v56 = v19;
        __int16 v57 = 2112;
        uint64_t v58 = v20;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Gadget view controller will not perform UICollectionView batch updates. Setting new data source: %{public}@, Old data source: %{public}@, UICollectionView number of sections: %ld, Change details: %@", buf, 0x2Au);
      }
      [(PXGadgetUIViewController *)self setDataSource:v7];
      if (_HasAnyInsertionsForChangeDetails((void *)v46[5])) {
        [v23 updateGadgetDataSourceToSpecIfNeeded:v7];
      }
      [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetControllerHasAppeared];
      v21 = PLGadgetsGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v7 publiclySafeDescription];
        *(_DWORD *)buf = 138543362;
        v52 = v22;
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEFAULT, "Reloading Gadget view controller's UICollectionView with new data source: %{public}@", buf, 0xCu);
      }
      [v4 reloadData];
      [(PXGadgetUIViewController *)self gadgetControllerFinishedUpdatingDataSourceWithChange:v46[5]];
    }
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    double v13 = PLGadgetsGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [v7 publiclySafeDescription];
      double v15 = [v6 publiclySafeDescription];
      *(_DWORD *)buf = 138543618;
      v52 = v14;
      __int16 v53 = 2114;
      v54 = v15;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Gadget view controller not yet visible. Setting new data source: %{public}@, old data source: %{public}@", buf, 0x16u);
    }
    [(PXGadgetUIViewController *)self setDataSource:v7];
    self->_updateFlags = (PXGadgetUpdateFlags)257;
    if (_HasAnyInsertionsForChangeDetails((void *)v46[5])) {
      [v23 updateGadgetDataSourceToSpecIfNeeded:v7];
    }
    [(PXGadgetUIViewController *)self gadgetControllerFinishedUpdatingDataSourceWithChange:v46[5]];
  }
  _Block_object_dispose(&v45, 8);
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) itemChangesInSection:a2];
  if (([v5 hasIncrementalChanges] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_329(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) removedIndexes];
  BOOL v3 = [*(id *)(a1 + 48) insertedIndexes];
  if ([v2 count])
  {
    if (objc_msgSend(v2, "indexGreaterThanOrEqualToIndex:", objc_msgSend(*(id *)(a1 + 56), "numberOfSections")) != 0x7FFFFFFFFFFFFFFFLL) {
      PXAssertGetLog();
    }
    [*(id *)(a1 + 56) deleteSections:v2];
  }
  if ([v3 count]) {
    [*(id *)(a1 + 56) insertSections:v3];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_330;
  v15[3] = &unk_1E5DBF6F0;
  v4 = *(void **)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  [v4 enumerateMovedIndexesUsingBlock:v15];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) sectionsWithItemChanges];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2;
  v8[3] = &unk_1E5DC86C0;
  uint64_t v13 = *(void *)(a1 + 80);
  id v6 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 40);
  [v5 enumerateIndexesUsingBlock:v8];
  if (_HasAnyInsertionsForChangeDetails(*(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40))) {
    [*(id *)(a1 + 72) updateGadgetDataSourceToSpecIfNeeded:*(void *)(a1 + 40)];
  }
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2_333(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = PLGadgetsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) numberOfSections];
    int v14 = 134217984;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Gadget view controller finished UICollectionView batch updates. Current collection view number of sections: %ld", (uint8_t *)&v14, 0xCu);
  }

  v4 = [*(id *)(a1 + 40) changedIndexes];
  uint64_t v5 = [v4 count];
  id v6 = PLGadgetsGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      double v8 = [*(id *)(a1 + 48) publiclySafeDescription];
      int v14 = 138543618;
      uint64_t v15 = (uint64_t)v8;
      __int16 v16 = 2114;
      uint64_t v17 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Reloading Gadget view controller's UICollectionView after batch updates. New data source: %{public}@, Section being reloaded: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) reloadSections:v4];
  }
  else
  {
    if (v7)
    {
      id v9 = [*(id *)(a1 + 48) publiclySafeDescription];
      int v14 = 138543362;
      uint64_t v15 = (uint64_t)v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Not reloading gadget view controller's UICollectionView after batch updates. No changed indexes for new data source: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  [*(id *)(a1 + 56) _notifyGadgetsThatGadgetControllerHasAppeared];
  [*(id *)(a1 + 64) loadRemainingGadgetsIfNeeded];
  uint64_t v10 = [*(id *)(a1 + 56) dataSource];
  if (v10 != *(void **)(a1 + 48))
  {
    uint64_t v11 = _GetChangeDetails(*(void **)(a1 + 64), [*(id *)(a1 + 72) identifier], objc_msgSend(v10, "identifier"));
    uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  [*(id *)(a1 + 56) gadgetControllerFinishedUpdatingDataSourceWithChange:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  [*(id *)(a1 + 56) setBatchUpdating:0];
}

uint64_t __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) moveSection:a2 toSection:a3];
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) itemChangesInSection:a2];
  uint64_t v5 = [v4 removedIndexes];
  id v6 = [v4 insertedIndexes];
  if ([v5 count])
  {
    if ([*(id *)(a1 + 32) numberOfSections] <= a2) {
      PXAssertGetLog();
    }
    if (objc_msgSend(v5, "indexGreaterThanOrEqualToIndex:", objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2)) != 0x7FFFFFFFFFFFFFFFLL)PXAssertGetLog(); {
    BOOL v7 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v5, a2);
    }
    [*(id *)(a1 + 32) deleteItemsAtIndexPaths:v7];
  }
  if ([v6 count])
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v6, a2);
    [*(id *)(a1 + 32) insertItemsAtIndexPaths:v8];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_332;
  v9[3] = &unk_1E5DBF718;
  unint64_t v11 = a2;
  id v10 = *(id *)(a1 + 32);
  [v4 enumerateMovedIndexesUsingBlock:v9];
}

void __55__PXGadgetUIViewController__dataSourceManagerDidChange__block_invoke_332(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) moveItemAtIndexPath:v6 toIndexPath:v5];
}

- (PXGadgetDelegate)nextGadgetResponder
{
  return 0;
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  if (!a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGadgetUIViewController.m", 1165, @"Invalid parameter not satisfying: %@", @"gadget" object file lineNumber description];
  }
  return +[PXViewControllerPresenter defaultPresenterWithViewController:self];
}

- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v9 = a5;
  if (!v12)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXGadgetUIViewController.m", 1157, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];
  }
  id v10 = [(PXGadgetUIViewController *)self presentedViewController];

  if (v10 == v12) {
    [(PXGadgetUIViewController *)self dismissViewControllerAnimated:v6 completion:v9];
  }
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v9 = a5;
  id v10 = v13;
  id v11 = v9;
  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGadgetUIViewController.m", 1150, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

    id v10 = 0;
  }
  [(PXGadgetUIViewController *)self presentViewController:v10 animated:v6 completion:v11];
}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(PXGadgetUIViewController *)self navigationController];
  if (v13)
  {
    [(PXGadgetUIViewController *)self setSelectedGadget:v10];
    objc_msgSend(v13, "px_pushViewController:animated:completion:", v11, v7, v12);
  }

  return v13 != 0;
}

- (void)gadget:(id)a3 animateChanges:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(void))a4;
  if ([(PXGadgetUIViewController *)self isCurrentlyVisible])
  {
    [(PXGadgetUIViewController *)self setGadgetAnimating:1];
    objc_initWeak(&location, self);
    double v8 = [(PXGadgetUIViewController *)self collectionView];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__PXGadgetUIViewController_gadget_animateChanges___block_invoke;
    v9[3] = &unk_1E5DCE660;
    objc_copyWeak(&v10, &location);
    [v8 performBatchUpdates:v7 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __50__PXGadgetUIViewController_gadget_animateChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setGadgetAnimating:0];
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if ((v4 & 0x40) != 0)
  {
    id v10 = v6;
    BOOL v7 = [(PXGadgetUIViewController *)self isGadgetAnimating];
    id v6 = v10;
    if (!v7)
    {
      BOOL v8 = [(PXGadgetUIViewController *)self isBatchUpdating];
      id v6 = v10;
      if (!v8)
      {
        id v9 = [(PXGadgetUIViewController *)self layout];
        [v9 invalidateLayout];

        id v6 = v10;
      }
    }
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3 = [(PXGadgetUIViewController *)self layout];
  [v3 invalidateLayout];
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXGadgetUIViewController.m", 1095, @"Method %s is a responsibility of subclass %@", "-[PXGadgetUIViewController collectionView:performDropWithCoordinator:]", v11 object file lineNumber description];

  abort();
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10
    && (uint64_t v12 = [v10 section],
        [(PXGadgetUIViewController *)self dataSource],
        id v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 numberOfSections],
        v13,
        v12 < v14))
  {
    uint64_t v15 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:v11];
    char v16 = [v15 gadgetCapabilities];
    id v17 = objc_alloc(MEMORY[0x1E4FB15B8]);
    if (v16)
    {
      uint64_t v18 = 2;
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v18 = 1;
      uint64_t v19 = 0;
    }
    uint64_t v20 = (void *)[v17 initWithDropOperation:v18 intent:v19];
  }
  else
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:1 intent:0];
  }

  return v20;
}

- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[PXImportManager supportedTypeIdentifiers];
  char v6 = [v4 hasItemsConformingToTypeIdentifiers:v5];

  return v6;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v9 = v6;
    id v7 = [(PXGadgetUIViewController *)self collectionView];
    char v8 = [v7 isDecelerating];

    id v6 = v9;
    if ((v8 & 1) == 0)
    {
      [(PXGadgetUIViewController *)self _scrollViewDidEndScrolling];
      id v6 = v9;
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [(PXGadgetUIViewController *)self _clearTimerToHandleGadgetsSeen];
  [(PXGadgetUIViewController *)self setIsScrolling:1];
  char v5 = [v4 isDecelerating];

  if ((v5 & 1) == 0)
  {
    int64_t v6 = [(PXGadgetUIViewController *)self scrollAnimationIdentifier];
    +[PXAnimationTracker scrollAnimationDidBegin:v6];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  [(PXGadgetUIViewController *)self _updateGadgetVisibleRects];
  id v3 = [off_1E5DA8380 sharedScheduler];
  [v3 scrollViewDidScroll];
}

- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4
{
}

- (void)splitViewController:(id)a3 willChangeSidebarVisibility:(BOOL)a4
{
}

- (BOOL)isTogglingSidebarNoRotating
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    BOOL v5 = [(PXGadgetUIViewController *)self isDFITogglingSidebar];
    if (v5) {
      LOBYTE(v5) = ![(PXGadgetUIViewController *)self isRotatingVerticalLayout];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (UIEdgeInsets)insetsForSectionHeaders
{
  v2 = [(PXGadgetUIViewController *)self specManager];
  id v3 = [v2 currentGadgetSpec];
  [v3 contentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = [(PXGadgetUIViewController *)self layout];
  [v10 collectionView:v9 layout:v8 referenceSizeForHeaderInSection:a5];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(PXGadgetUIViewController *)self layout];
  [v11 collectionView:v10 layout:v9 sizeForItemAtIndexPath:v8];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PXGadgetUIViewController *)self layout];
  [v10 collectionView:v9 layout:v8 insetForSectionAtIndex:a5];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  double v4 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:a4];
  unint64_t v5 = ((unint64_t)[v4 gadgetCapabilities] >> 1) & 1;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  double v7 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:v6];
  if (objc_opt_respondsToSelector()) {
    [v7 userDidSelectGadget];
  }
  [v8 deselectItemAtIndexPath:v6 animated:0];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a4;
  id v6 = -[PXGadgetUIViewController _gadgetForCollectionViewCell:](self, "_gadgetForCollectionViewCell:");
  if (v6)
  {
    if ([(PXGadgetUIViewController *)self _isUsingDeprecatedViewLoadingForGadget:v6])
    {
      id v7 = v14;
      id v8 = [v7 contentView];
      id v9 = [v7 gadgetContentView];
      id v10 = [v9 superview];

      if (v8 == v10)
      {
        if ([(PXGadgetUIViewController *)self isContentVisible]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v6 contentViewDidDisappear];
        }
        if (objc_opt_respondsToSelector())
        {
          double v11 = [v6 contentViewController];
          double v12 = v11;
          if (v11)
          {
            [v11 willMoveToParentViewController:0];
            [v12 removeFromParentViewController];
          }
        }
        [v7 setGadgetContentView:0];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v6 removeCollectionViewItem:v14];
    }
  }
  double v13 = [(PXGadgetUIViewController *)self cellsWantingVisibleRectUpdates];
  [v13 removeObject:v14];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:a5];
  if (![(PXGadgetUIViewController *)self _isUsingDeprecatedViewLoadingForGadget:v10])
  {
    [v10 prepareCollectionViewItem:v9];
    goto LABEL_14;
  }
  id v11 = v9;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v12 = 0;
    goto LABEL_7;
  }
  double v12 = [v10 contentViewController];
  double v13 = [v12 view];
  if (!v13)
  {
LABEL_7:
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v10 contentView], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      PXAssertGetLog();
    }
    double v13 = (void *)v14;
  }
  if (v12)
  {
    [(PXGadgetUIViewController *)self addChildViewController:v12];
    [v12 didMoveToParentViewController:self];
  }
  [v11 setGadgetContentView:v13];

LABEL_14:
  if (objc_opt_respondsToSelector())
  {
    double v15 = [(PXGadgetUIViewController *)self cellsWantingVisibleRectUpdates];
    [v15 addObject:v9];

    [(PXGadgetUIViewController *)self _updateVisibleRectForGadget:v10 inCell:v9 collectionView:v8];
  }
  if ([(PXGadgetUIViewController *)self isContentVisible]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v16 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
    if (os_signpost_enabled(v16))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetContentWillAppear", "", (uint8_t *)&v17, 2u);
    }
    [v10 contentViewWillAppear];
    if (os_signpost_enabled(v16))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GadgetContentWillAppear", "", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Gadget_CV_prefetchItems", "", buf, 2u);
  }
  id v9 = [v7 firstObject];

  if (v9)
  {
    id v10 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:v9];
    if ([(PXGadgetUIViewController *)self _isUsingDeprecatedViewLoadingForGadget:v10])
    {
      if (objc_opt_respondsToSelector())
      {
        id v11 = [v10 contentViewController];

        [v11 view];
LABEL_9:

        goto LABEL_10;
      }
      if (objc_opt_respondsToSelector())
      {
        id v11 = [v10 contentView];
        goto LABEL_9;
      }
    }
LABEL_10:
    if (objc_opt_respondsToSelector())
    {
      [v6 bounds];
      [v10 prefetchDuringScrollingForWidth:v12];
    }
  }
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)double v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Gadget_CV_prefetchItems", "", v13, 2u);
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:v7];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "setVisibleContentRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  if ([(PXGadgetUIViewController *)self _isUsingDeprecatedViewLoadingForGadget:v8])
  {
    id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"PXGadgetControllerCellReuseIdentifier" forIndexPath:v7];
    [v9 setClipsToBounds:0];
  }
  else
  {
    id v10 = (objc_class *)[v8 collectionViewItemClass];
    id v11 = NSStringFromClass(v10);
    double v12 = [v11 stringByAppendingString:@"ReuseIdentifier"];

    if (([(NSMutableSet *)self->_registeredCellReuseIdentifiers containsObject:v12] & 1) == 0)
    {
      [(NSMutableSet *)self->_registeredCellReuseIdentifiers addObject:v12];
      [v6 registerClass:v10 forCellWithReuseIdentifier:v12];
    }
    id v9 = [v6 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];
  }
  [(PXGadgetUIViewController *)self _setGadget:v8 forCollectionViewCell:v9];

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v5 = [(PXGadgetUIViewController *)self dataSource];
  int64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(PXGadgetUIViewController *)self dataSource];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (void)_setGadget:(id)a3 forCollectionViewCell:(id)a4
{
}

- (id)_gadgetForCollectionViewCell:(id)a3
{
  return [(NSMapTable *)self->_cellsToGadgets objectForKey:a3];
}

- (BOOL)_isUsingDeprecatedViewLoadingForGadget:(id)a3
{
  return (objc_opt_respondsToSelector() & 1) == 0;
}

- (CGRect)visibleBounds
{
  v2 = [(PXGadgetUIViewController *)self collectionView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)_updateVisibleRectForGadget:(id)a3 inCell:(id)a4 collectionView:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    [(PXGadgetUIViewController *)self visibleBounds];
    objc_msgSend(v8, "convertRect:fromView:", v9);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v8 bounds];
    v39.origin.double x = v18;
    v39.origin.double y = v19;
    v39.size.double width = v20;
    v39.size.double height = v21;
    v37.origin.double x = v11;
    v37.origin.double y = v13;
    v37.size.double width = v15;
    v37.size.double height = v17;
    CGRect v38 = CGRectIntersection(v37, v39);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    if (CGRectIsNull(v38))
    {
      double x = *MEMORY[0x1E4F1DB28];
      double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    id v26 = [v8 contentView];
    objc_msgSend(v26, "convertRect:fromView:", v8, x, y, width, height);
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    objc_msgSend(v35, "setVisibleContentRect:", v28, v30, v32, v34);
  }
}

- (void)_updateGadgetVisibleRects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_updateFlags.collectionNeedsUpdate
    && ![(PXGadgetUIViewController *)self isBatchUpdating])
  {
    double v3 = [(PXGadgetUIViewController *)self cellsWantingVisibleRectUpdates];
    if ([v3 count])
    {
      double v4 = [(PXGadgetUIViewController *)self collectionView];
      double v5 = [v4 indexPathsForVisibleItems];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            CGFloat v11 = [v4 cellForItemAtIndexPath:v10];
            if ([v3 containsObject:v11])
            {
              double v12 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:v10];
              [(PXGadgetUIViewController *)self _updateVisibleRectForGadget:v12 inCell:v11 collectionView:v4];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)_scrollViewDidEndScrolling
{
  +[PXAnimationTracker scrollAnimationDidEnd:[(PXGadgetUIViewController *)self scrollAnimationIdentifier]];
  [(PXGadgetUIViewController *)self _setTimerToHandleGadgetsSeen];
  [(PXGadgetUIViewController *)self setIsScrolling:0];
}

- (void)_notifyPresentedGadgetsOfVisibilityChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_updateFlags.collectionNeedsUpdate)
  {
    BOOL v3 = [(PXGadgetUIViewController *)self isContentVisible];
    long long v13 = [(PXGadgetUIViewController *)self collectionView];
    double v4 = [v13 indexPathsForVisibleItems];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v5) {
      goto LABEL_22;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v3)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_20;
          }
          uint64_t v10 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetContentWillAppear", "", buf, 2u);
          }
          [v9 contentViewWillAppear];
          if (!os_signpost_enabled(v10)) {
            goto LABEL_19;
          }
          *(_WORD *)buf = 0;
          CGFloat v11 = v10;
          double v12 = "GadgetContentWillAppear";
          goto LABEL_18;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_20;
        }
        uint64_t v10 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetContentDidDisappear", "", buf, 2u);
        }
        [v9 contentViewDidDisappear];
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          CGFloat v11 = v10;
          double v12 = "GadgetContentDidDisappear";
LABEL_18:
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v12, "", buf, 2u);
        }
LABEL_19:

LABEL_20:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v6)
      {
LABEL_22:

        return;
      }
    }
  }
}

- (void)_notifyGadgetsThatGadgetWasDismissed
{
  id v2 = [(PXGadgetUIViewController *)self dataSource];
  [v2 enumerateGadgetsUsingBlock:&__block_literal_global_283_149508];
}

void __64__PXGadgetUIViewController__notifyGadgetsThatGadgetWasDismissed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 gadgetWasDismissed];
  }
}

- (void)_notifyGadgetsThatGadgetControllerHasDisappeared
{
  id v2 = [(PXGadgetUIViewController *)self dataSource];
  [v2 enumerateGadgetsUsingBlock:&__block_literal_global_279_149513];
}

void __76__PXGadgetUIViewController__notifyGadgetsThatGadgetControllerHasDisappeared__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 gadgetControllerHasDisappeared];
  }
}

- (void)_notifyGadgetsThatGadgetControllerHasAppeared
{
  id v2 = [(PXGadgetUIViewController *)self dataSource];
  [v2 enumerateGadgetsUsingBlock:&__block_literal_global_149517];
}

void __73__PXGadgetUIViewController__notifyGadgetsThatGadgetControllerHasAppeared__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 gadgetControllerHasAppeared];
  }
}

- (void)_setTimerToHandleGadgetsSeen
{
  [(PXGadgetUIViewController *)self _clearTimerToHandleGadgetsSeen];
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __56__PXGadgetUIViewController__setTimerToHandleGadgetsSeen__block_invoke;
  uint64_t v8 = &unk_1E5DCD920;
  objc_copyWeak(&v9, &location);
  double v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v5 block:2.0];
  -[PXGadgetUIViewController setGadgetSeenTimer:](self, "setGadgetSeenTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__PXGadgetUIViewController__setTimerToHandleGadgetsSeen__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleGadgetsSeen];
}

- (void)_clearTimerToHandleGadgetsSeen
{
  id v2 = [(PXGadgetUIViewController *)self gadgetSeenTimer];
  [v2 invalidate];
}

- (void)_handleGadgetsSeen
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_updateFlags.collectionNeedsUpdate
    && ![(PXGadgetUIViewController *)self isBatchUpdating]
    && [(PXGadgetUIViewController *)self isContentVisible])
  {
    BOOL v3 = [(PXGadgetUIViewController *)self collectionView];
    [(PXGadgetUIViewController *)self visibleBounds];
    r2[0] = v4;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v11 = [v3 window];
    CGFloat v21 = v11;
    if (v11)
    {
      double v12 = v11;
      [v11 bounds];
      objc_msgSend(v3, "convertRect:fromCoordinateSpace:", v12);
    }
    long long v13 = [v3 indexPathsForVisibleItems];
    long long v14 = [(PXGadgetUIViewController *)self seenGadgetIdentifiers];
    memset(&r2[1], 0, 32);
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&r2[1] objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)r2[3];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)r2[3] != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [v3 layoutAttributesForItemAtIndexPath:*(void *)(r2[2] + 8 * i)];
          [v20 frame];
          *(void *)&v29.origin.double x = r2[0];
          v29.origin.double y = v6;
          v29.size.double width = v8;
          v29.size.double height = v10;
          CGRect v28 = CGRectIntersection(v27, v29);
          if (!CGRectIsNull(v28)) {
            PXSizeIsNull();
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&r2[1] objects:v25 count:16];
      }
      while (v17);
    }
  }
}

- (id)_indexPathForGadget:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  double v5 = [(PXGadgetUIViewController *)self dataSource];
  CGFloat v6 = v5;
  if (v5) {
    [v5 indexPathForGadget:v4];
  }
  else {
    long long v11 = 0u;
  }

  if (*(void *)off_1E5DAAED8) {
    BOOL v7 = (void)v11 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && *((void *)&v11 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:");
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_gadgetAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(PXGadgetUIViewController *)self dataSource];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v4 section];
  uint64_t v8 = [v4 item];

  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = 0x7FFFFFFFFFFFFFFFLL;
  double v9 = [v5 gadgetAtIndexPath:v11];

  return v9;
}

- (void)updateIfNeeded
{
  if (self->_updateFlags.collectionNeedsUpdate)
  {
    self->_updateFlags.collectionNeedsUpdate = 0;
    id v2 = [(PXGadgetUIViewController *)self collectionView];
    [v2 reloadData];
  }
}

- (void)_updaterNeedsUpdate
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__PXGadgetUIViewController__updaterNeedsUpdate__block_invoke;
  v2[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __47__PXGadgetUIViewController__updaterNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained updater];
  [v1 updateIfNeeded];
}

- (void)_removeContextMenuInteraction
{
  id v3 = [(PXGadgetUIViewController *)self contextMenuInteraction];
  if (v3)
  {
    id v5 = v3;
    id v4 = [v3 view];
    [v4 removeInteraction:v5];

    [(PXGadgetUIViewController *)self setContextMenuInteraction:0];
    id v3 = v5;
  }
}

- (void)_addContextMenuInteraction
{
  if ([(PXGadgetUIViewController *)self isRootGadgetViewController])
  {
    id v3 = [(PXGadgetUIViewController *)self contextMenuInteraction];

    if (!v3)
    {
      id v5 = (id)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
      [(PXGadgetUIViewController *)self setContextMenuInteraction:v5];
      id v4 = [(PXGadgetUIViewController *)self view];
      [v4 addInteraction:v5];
    }
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v10 = [(PXGadgetUIViewController *)self interactionPreviewGadget];
  uint64_t v7 = [(PXGadgetUIViewController *)self isInteractionPreviewCancelled] ^ 1;
  uint64_t v8 = [(PXGadgetUIViewController *)self interactionPreviewView];
  double v9 = [v6 previewViewController];

  if (v9)
  {
    if (objc_opt_respondsToSelector()) {
      [v10 didDismissPreviewViewController:v9 committing:v7];
    }
  }
  else if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v10 didDismissPreviewWithPreviewView:v8 committing:v7];
  }
  [(PXGadgetUIViewController *)self setInteractionPreviewGadget:0];
  [(PXGadgetUIViewController *)self setInteractionPreviewView:0];
  [(PXGadgetUIViewController *)self setIsInteractionPreviewCancelled:0];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(PXGadgetUIViewController *)self interactionPreviewGadget];
  uint64_t v8 = [(PXGadgetUIViewController *)self interactionPreviewView];
  double v9 = [v6 previewViewController];
  [v6 setPreferredCommitStyle:v9 != 0];
  if (v9)
  {
    if (objc_opt_respondsToSelector())
    {
      id v10 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      long long v11 = __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      double v12 = v9;
LABEL_7:
      v10[2] = (uint64_t)v11;
      v10[3] = (uint64_t)&unk_1E5DD32A8;
      v10[4] = (uint64_t)v7;
      v10[5] = (uint64_t)v12;
      [v6 addCompletion:v10];
    }
  }
  else if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = &v13;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v11 = __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2;
    double v12 = v8;
    goto LABEL_7;
  }
  -[PXGadgetUIViewController setIsInteractionPreviewCancelled:](self, "setIsInteractionPreviewCancelled:", 0, v13, v14);
}

uint64_t __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitPreviewViewController:*(void *)(a1 + 40)];
}

uint64_t __109__PXGadgetUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitPreviewView:*(void *)(a1 + 40)];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = [(PXGadgetUIViewController *)self interactionPreviewView];
  id v6 = [(PXGadgetUIViewController *)self interactionPreviewGadget];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v5) {
      goto LABEL_6;
    }
LABEL_7:
    PXAssertGetLog();
  }
  uint64_t v7 = [v6 previewParametersForTargetPreviewView:v5];
  uint64_t v8 = (void *)v7;
  if (!v5) {
    goto LABEL_7;
  }
  if (v7)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5 parameters:v7];

    goto LABEL_8;
  }
LABEL_6:
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5];
LABEL_8:

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(PXGadgetUIViewController *)self view];
  uint64_t v8 = -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  if (!v8
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "targetPreviewViewForLocation:inCoordinateSpace:", v7, x, y),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v12 = 0;
    goto LABEL_9;
  }
  id v10 = (void *)v9;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v8, "previewViewControllerAtLocation:fromSourceView:", v7, x, y);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v14 = [v8 contextMenuWithSuggestedActions:MEMORY[0x1E4F1CBF0]];
    id v15 = [v14 children];
    double v12 = (void *)[v15 count];

    if (v12 || !v11)
    {
      if (!v12) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_15:
    uint64_t v16 = objc_msgSend(v11, "px_previewActionMenus");
    uint64_t v17 = [v16 count];

    if (!v17)
    {
LABEL_16:
      double v12 = 0;
      goto LABEL_19;
    }
LABEL_18:
    [(PXGadgetUIViewController *)self setInteractionPreviewGadget:v8];
    [(PXGadgetUIViewController *)self setInteractionPreviewView:v10];
    [(PXGadgetUIViewController *)self setIsInteractionPreviewCancelled:1];
    uint64_t v18 = (void *)MEMORY[0x1E4FB1678];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v22[3] = &unk_1E5DC4F48;
    id v23 = v11;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v19[3] = &unk_1E5DBF6A0;
    id v20 = v8;
    id v11 = v23;
    id v21 = v11;
    double v12 = [v18 configurationWithIdentifier:0 previewProvider:v22 actionProvider:v19];

    goto LABEL_19;
  }
  id v11 = 0;
  double v12 = 0;
  if (objc_opt_respondsToSelector()) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_9:
  return v12;
}

id __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __82__PXGadgetUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([*(id *)(a1 + 32) contextMenuWithSuggestedActions:v3],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = objc_msgSend(v5, "px_previewActionMenus");
      id v4 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 children:v6];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)setLayout:(id)a3
{
  id v5 = (PXGadgetCollectionViewLayout *)a3;
  p_layout = &self->_layout;
  layout = self->_layout;
  if (layout != v5)
  {
    id v10 = v5;
    [(PXGadgetCollectionViewLayout *)layout setDelegate:0];
    objc_storeStrong((id *)&self->_layout, a3);
    [(PXGadgetCollectionViewLayout *)*p_layout setDelegate:self];
    uint64_t v8 = *p_layout;
    uint64_t v9 = [(PXGadgetUIViewController *)self collectionView];
    [v9 setCollectionViewLayout:v8];

    id v5 = v10;
  }
}

- (void)setContentVisible:(BOOL)a3
{
  if (self->_isContentVisible != a3)
  {
    self->_isContentVisible = a3;
    if ([(PXGadgetUIViewController *)self isViewLoaded])
    {
      [(PXGadgetUIViewController *)self _notifyPresentedGadgetsOfVisibilityChange];
      if (self->_isContentVisible)
      {
        [(PXGadgetUIViewController *)self _setTimerToHandleGadgetsSeen];
      }
      else
      {
        [(PXGadgetUIViewController *)self _clearTimerToHandleGadgetsSeen];
      }
    }
  }
}

- (void)setDataSource:(id)a3
{
  id v10 = (PXGadgetDataSource *)a3;
  id v5 = self->_dataSource;
  id v6 = v10;
  if (v5 == v10) {
    goto LABEL_5;
  }
  uint64_t v7 = v5;
  char v8 = -[PXGadgetDataSource isEqual:](v5, "isEqual:");

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    if ([(PXGadgetUIViewController *)self isRootGadgetViewController])
    {
      uint64_t v9 = [(PXGadgetDataSource *)v10 hasNoContentGadget] ^ 1;
      id v6 = [(PXGadgetUIViewController *)self collectionView];
      [v6 setAlwaysBounceVertical:v9];
LABEL_5:
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v10 = (UIColor *)a3;
  id v4 = self->_backgroundColor;
  id v5 = v10;
  if (v4 == v10) {
    goto LABEL_5;
  }
  char v6 = [(UIColor *)v10 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (UIColor *)[(UIColor *)v10 copy];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v7;

    if ([(PXGadgetUIViewController *)self isViewLoaded])
    {
      uint64_t v9 = self->_backgroundColor;
      id v5 = [(PXGadgetUIViewController *)self collectionView];
      [v5 setBackgroundColor:v9];
LABEL_5:
    }
  }
}

- (id)debugURLsForDiagnostics
{
  id v3 = objc_opt_new();
  id v4 = [(PXGadgetUIViewController *)self dataSource];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PXGadgetUIViewController_debugURLsForDiagnostics__block_invoke;
  v7[3] = &unk_1E5DBF678;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateGadgetsUsingBlock:v7];

  return v5;
}

void __51__PXGadgetUIViewController_debugURLsForDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v4 debugURLsForDiagnostics];
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
}

- (id)gadgetAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(PXGadgetUIViewController *)self collectionView];
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = objc_msgSend(v8, "indexPathForItemAtPoint:", v10, v12);
  if (v13)
  {
    uint64_t v14 = [(PXGadgetUIViewController *)self _gadgetAtIndexPath:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)reloadContent
{
  id v3 = [(PXGadgetUIViewController *)self dataSourceManager];
  [v3 removeCachedProviders];
  objc_msgSend(v3, "beginLoadingInitialGadgets:", -[PXGadgetUIViewController numberOfInitialGadgetsToLoad](self, "numberOfInitialGadgetsToLoad"));
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if ([(PXGadgetUIViewController *)self isRootGadgetViewController])
  {
    [(PXGadgetUIViewController *)self rootGadgetControllerDidDisappear];
    [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetControllerHasDisappeared];
    [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetWasDismissed];
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if ([(UIViewController *)self px_isVisible]
    && [(PXGadgetUIViewController *)self isRootGadgetViewController])
  {
    [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetControllerHasAppeared];
    [(PXGadgetUIViewController *)self rootGadgetControllerWillAppear];
  }
}

- (BOOL)isRootGadgetViewController
{
  return 1;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v4 dealloc];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXGadgetUIViewController;
  -[PXGadgetUIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ([(PXGadgetUIViewController *)self isCurrentlyVisible])
  {
    [(PXGadgetUIViewController *)self setIsRotatingVerticalLayout:0];
    if ([(PXGadgetUIViewController *)self _scrollAxis] == 1)
    {
      id v8 = [(PXGadgetUIViewController *)self collectionView];
      [v8 bounds];
      BOOL v10 = height != v9;

      [(PXGadgetUIViewController *)self setIsRotatingVerticalLayout:v10];
    }
    void v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v12[3] = &unk_1E5DD2A68;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v11[3] = &unk_1E5DD2A68;
    [v7 animateAlongsideTransition:v12 completion:v11];
  }
}

void __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layout];
  [v2 invalidateLayout];

  id v3 = [*(id *)(a1 + 32) collectionView];
  [v3 layoutIfNeeded];
}

uint64_t __79__PXGadgetUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsRotatingVerticalLayout:0];
}

- (int64_t)_scrollAxis
{
  id v2 = [(PXGadgetUIViewController *)self layout];
  [v2 scrollDirection];

  PXAxisFromUICollectionViewScrollDirection();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v3 viewDidLayoutSubviews];
  [(PXGadgetUIViewController *)self _updateGadgetVisibleRects];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v6 viewWillLayoutSubviews];
  objc_super v3 = [(PXGadgetUIViewController *)self specManager];
  objc_super v4 = [(PXGadgetUIViewController *)self dataSource];
  [v3 updateGadgetDataSourceToSpecIfNeeded:v4];

  id v5 = [off_1E5DA8380 sharedScheduler];
  [v5 scrollViewWillLayoutSubviews];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v13 viewDidDisappear:a3];
  [(PXGadgetUIViewController *)self setCurrentlyVisible:0];
  [(PXGadgetUIViewController *)self _removeContextMenuInteraction];
  if ([(PXGadgetUIViewController *)self isRootGadgetViewController])
  {
    [(PXGadgetUIViewController *)self rootGadgetControllerDidDisappear];
    [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetControllerHasDisappeared];
    objc_super v4 = [(PXGadgetUIViewController *)self navigationController];
    id v5 = [v4 topViewController];
    if (v5 != self)
    {
      objc_super v6 = v5;
      if ([(PXGadgetUIViewController *)self isBeingDismissed])
      {
        int v7 = [(PXGadgetUIViewController *)self isViewLoaded];

        if (!v7) {
          goto LABEL_15;
        }
        goto LABEL_12;
      }

LABEL_14:
      goto LABEL_15;
    }
    uint64_t v8 = [(PXGadgetUIViewController *)self presentedViewController];
    if (v8)
    {
      double v9 = (void *)v8;
      if (([(PXGadgetUIViewController *)self isBeingDismissed] & 1) == 0)
      {

        goto LABEL_14;
      }
      char v10 = [(PXGadgetUIViewController *)self isViewLoaded];

      if ((v10 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      char v11 = [(PXGadgetUIViewController *)self isViewLoaded];

      if ((v11 & 1) == 0)
      {
LABEL_15:
        double v12 = [(PXGadgetUIViewController *)self dataSourceManager];
        [v12 setCanLoadRemainingDataForProviders:0];

        return;
      }
    }
LABEL_12:
    [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetWasDismissed];
    goto LABEL_15;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(PXGadgetUIViewController *)self collectionView];
  if (([v4 isDragging] & 1) != 0 || objc_msgSend(v4, "isDecelerating")) {
    [(PXGadgetUIViewController *)self _scrollViewDidEndScrolling];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v6 viewDidAppear:a3];
  [(PXGadgetUIViewController *)self setSelectedGadget:0];
  objc_super v4 = [(PXGadgetUIViewController *)self dataSourceManager];
  if ([(PXGadgetUIViewController *)self isRootGadgetViewController])
  {
    [v4 setCanLoadRemainingDataForProviders:1];
    [(PXGadgetUIViewController *)self _notifyGadgetsThatGadgetControllerHasAppeared];
  }
  p_updateFlags = &self->_updateFlags;
  if (p_updateFlags->loadRemaingGadgetsAfterViewAppeared)
  {
    [v4 loadRemainingGadgetsIfNeeded];
    p_updateFlags->loadRemaingGadgetsAfterViewAppeared = 0;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v4 viewWillAppear:a3];
  if ([(PXGadgetUIViewController *)self isRootGadgetViewController]) {
    [(PXGadgetUIViewController *)self rootGadgetControllerWillAppear];
  }
  [(PXGadgetUIViewController *)self updateIfNeeded];
  [(PXGadgetUIViewController *)self _addContextMenuInteraction];
  [(PXGadgetUIViewController *)self setCurrentlyVisible:1];
  [(PXGadgetUIViewController *)self _setTimerToHandleGadgetsSeen];
}

- (void)_initializeHelpers
{
  id v2 = [(PXGadgetUIViewController *)self layout];
  [v2 scrollDirection];

  PXAxisFromUICollectionViewScrollDirection();
}

- (void)_initializeDataSource
{
  id v5 = [(PXGadgetUIViewController *)self dataSourceManager];
  objc_super v3 = [v5 dataSource];
  [(PXGadgetUIViewController *)self setDataSource:v3];

  objc_super v4 = [(PXGadgetUIViewController *)self dataSourceManager];
  [v4 registerChangeObserver:self context:PXDataSourceManagerObservationContext_149425];

  self->_updateFlags.collectionNeedsUpdate = 1;
  objc_msgSend(v5, "beginLoadingInitialGadgets:", -[PXGadgetUIViewController numberOfInitialGadgetsToLoad](self, "numberOfInitialGadgetsToLoad"));
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PXGadgetUIViewController;
  [(PXGadgetUIViewController *)&v9 viewDidLoad];
  objc_super v3 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GadgetVCViewDidLoad", "", v8, 2u);
  }

  objc_super v4 = [(PXGadgetUIViewController *)self collectionView];
  [v4 setClipsToBounds:0];
  id v5 = [(PXGadgetUIViewController *)self backgroundColor];
  [v4 setBackgroundColor:v5];

  [v4 setDropDelegate:self];
  [v4 setAlwaysBounceVertical:1];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PXGadgetControllerCellReuseIdentifier"];
  [v4 _setAutomaticContentOffsetAdjustmentEnabled:0];
  [v4 setPrefetchDataSource:self];
  [(PXGadgetUIViewController *)self _initializeHelpers];
  [(PXGadgetUIViewController *)self _initializeDataSource];
  if ([(PXGadgetUIViewController *)self isRootGadgetViewController]
    && [(PXGadgetUIViewController *)self allowsBarManagement])
  {
    [(UIViewController *)self px_enableBarAppearance];
    objc_msgSend(v4, "setContentInset:", 0.0, 0.0, 16.0, 0.0);
  }
  objc_super v6 = [(UIViewController *)self px_splitViewController];
  [v6 registerChangeObserver:self];
  int v7 = [(PXGadgetUIViewController *)self gadgetViewControllerLog];
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GadgetVCViewDidLoad", "", v8, 2u);
  }
}

- (PXGadgetUIViewController)initWithLayout:(id)a3 dataSourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PXGadgetUIViewController;
  objc_super v9 = [(PXGadgetUIViewController *)&v27 initWithCollectionViewLayout:v7];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layout, a3);
    [(PXGadgetCollectionViewLayout *)v10->_layout setDelegate:v10];
    char v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredCellReuseIdentifiers = v10->_registeredCellReuseIdentifiers;
    v10->_registeredCellReuseIdentifiers = v11;

    uint64_t v13 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v10 needsUpdateSelector:sel__updaterNeedsUpdate];
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v13;

    objc_storeStrong((id *)&v10->_dataSourceManager, a4);
    [(PXGadgetDataSourceManager *)v10->_dataSourceManager setNextGadgetResponder:v10];
    id v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v15 userInterfaceIdiom] == 6) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    uint64_t v16 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    objc_storeStrong((id *)&v10->_backgroundColor, v16);

    v10->_numberOfInitialGadgetsToLoad = 3;
    uint64_t v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    seenGadgetIdentifiers = v10->_seenGadgetIdentifiers;
    v10->_seenGadgetIdentifiers = v17;

    v10->_isContentVisible = 1;
    CGFloat v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cellsWantingVisibleRectUpdates = v10->_cellsWantingVisibleRectUpdates;
    v10->_cellsWantingVisibleRectUpdates = v19;

    uint64_t v21 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    cellsToGadgets = v10->_cellsToGadgets;
    v10->_cellsToGadgets = (NSMapTable *)v21;

    v10->_allowsBarManagement = 1;
    [(UIViewController *)v10 px_enableExtendedTraitCollection];
    id v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v10 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    long long v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v10 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v10 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
  }
  return v10;
}

+ (Class)gadgetSpecClass
{
  return (Class)objc_opt_class();
}

@end