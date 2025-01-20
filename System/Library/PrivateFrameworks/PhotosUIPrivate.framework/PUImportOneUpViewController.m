@interface PUImportOneUpViewController
- (BOOL)allowsSelection;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasPerformedNavigationToStartingAsset;
- (BOOL)isAnimatingTransition;
- (BOOL)isCommitingPreview;
- (BOOL)loadLargeThumbnailsInCustomOrder;
- (BOOL)performingDataSourceChange;
- (BOOL)pu_wantsNavigationBarVisible;
- (BOOL)pu_wantsTabBarVisible;
- (BOOL)pu_wantsToolbarVisible;
- (BOOL)reviewScrubber:(id)a3 shouldProvideFeedbackForCellAtIndexPath:(id)a4;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)updatingContentOffsetFromScrubbing;
- (CGRect)imageRectFromPhotoView:(id)a3;
- (CGRect)layout:(id)a3 collectionView:(id)a4 selectionBadgeFrameForItemFrame:(CGRect)a5 atIndexPath:(id)a6;
- (CGRect)selectionBadgeFrameForItemFrame:(CGRect)a3 atIndexPath:(id)a4;
- (CGRect)targetFrameForTransitionItem:(id)a3;
- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeForItemAtIndexPath:(id)a3;
- (NSIndexPath)inFlightReferenceIndexPath;
- (NSMutableArray)itemsNeedingRelayout;
- (NSMutableSet)itemsWithInvalidImageSizes;
- (NSMutableSet)thumbnailLoadableItemWhitelist;
- (PFCoalescer)relayoutCoalescer;
- (PLDateRangeFormatter)dayFormatter;
- (PLDateRangeFormatter)timeFormatter;
- (PLRoundProgressView)roundProgressView;
- (PUImportActionCoordinator)actionCoordinator;
- (PUImportChangeDetailsCollectionViewHelper)changeDetailsHelper;
- (PUImportOneUpViewController)initWithImportController:(id)a3 mediaProvider:(id)a4 startingAssetReference:(id)a5 presentationFilter:(unint64_t)a6;
- (PUImportOneUpViewControllerSpecManager)specManager;
- (PUReviewScrubber)reviewScrubber;
- (PUSelectableAssetCollectionViewLayout)collectionViewLayout;
- (PXAssetReference)startingAssetReference;
- (PXImportAssetsDataSource)importDataSource;
- (PXImportAssetsDataSource)pendingDataSource;
- (PXImportAssetsDataSourceManager)importDataSourceManager;
- (PXImportController)importController;
- (PXMediaProvider)mediaProvider;
- (PXNavigationTitleView)navigationTitleView;
- (UIBarButtonItem)bottomSpacerBarButtonItem;
- (UIBarButtonItem)cancelBarButtonItem;
- (UIBarButtonItem)deleteBarButtonItem;
- (UIBarButtonItem)importBarButtonItem;
- (UIBarButtonItem)progressButtonItem;
- (UIBarButtonItem)stopImportBarButtonItem;
- (UICollectionView)collectionView;
- (UICollectionViewLayout)transitionLayout;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4;
- (double)absoluteProgressFromCurrentContentOffset;
- (id)_currentAsset;
- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5;
- (id)assetAtIndexPath:(id)a3;
- (id)badgeViewAtIndexPath:(id)a3 forCollectionView:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)importAssetAtIndexPath:(id)a3;
- (id)importDestinationForActionCoordinator:(id)a3;
- (id)indexPathOfCenterVisibleItemInCollectionView:(id)a3;
- (id)nextIndexPath:(id)a3;
- (id)previousIndexPath:(id)a3;
- (id)transitionItemsForContext:(id)a3;
- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)importOneUpCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5;
- (int64_t)importOneUpScrubberCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5;
- (int64_t)nextSectionWithItems:(int64_t)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)previousSectionWithItems:(int64_t)a3;
- (unint64_t)numberOfSectionsInReviewScrubber:(id)a3;
- (unint64_t)presentationFilter;
- (unint64_t)reviewScrubber:(id)a3 numberOfItemsInSection:(unint64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)reviewScrubberImageFormat;
- (void)_cancelAlerts;
- (void)_cancelOneUpView;
- (void)_deleteAction:(id)a3;
- (void)_dismissReviewControllerWithAsset:(id)a3;
- (void)_handleTapAtIndexPath:(id)a3;
- (void)_handleTapInMainCollectionView:(id)a3;
- (void)_importControllerDidEndAction;
- (void)_importControllerWillBeginAction;
- (void)_reallyToggleCurrentPickStatusAtIndexPath:(id)a3;
- (void)_stopImportAction:(id)a3;
- (void)_toggleCurrentPickStatusAtIndexPath:(id)a3;
- (void)_updateBarItemsAnimated:(BOOL)a3;
- (void)_updateReviewScrubberFromContentOffset;
- (void)actionCoordinatorDidBeginDelete:(id)a3;
- (void)actionCoordinatorDidBeginImport:(id)a3;
- (void)beginCenterPrioritizedThumbnailLoading;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)deleteItems:(id)a3;
- (void)didTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5;
- (void)getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4;
- (void)getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4;
- (void)handleNewDataSource:(id)a3;
- (void)importControllerProgressDidChange:(id)a3;
- (void)importOneUpCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4;
- (void)importOneUpCell:(id)a3 requestedBadgeUpdateForImportItem:(id)a4;
- (void)importOneUpScrubberCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4;
- (void)invalidateLayoutIfNeededForImportItem:(id)a3;
- (void)loadCenterPrioritizedVisibleThumbnails;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)pageToIndexPath:(id)a3 animated:(BOOL)a4;
- (void)pageToItemOrNearestIndexPath:(id)a3 animated:(BOOL)a4;
- (void)prepareTransitionItemViewForDestination:(id)a3;
- (void)relayoutCollectionView;
- (void)reviewScrubber:(id)a3 willDisplayCell:(id)a4 atIndexPath:(id)a5;
- (void)reviewScrubberDidScrub:(id)a3;
- (void)reviewScrubberDidSelectItemAtIndexPath:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActionCoordinator:(id)a3;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setAnimatingTransition:(BOOL)a3;
- (void)setChangeDetailsHelper:(id)a3;
- (void)setHasPerformedNavigationToStartingAsset:(BOOL)a3;
- (void)setImportController:(id)a3;
- (void)setImportDataSource:(id)a3;
- (void)setImportDataSourceManager:(id)a3;
- (void)setIsCommitingPreview:(BOOL)a3;
- (void)setItemsNeedingRelayout:(id)a3;
- (void)setItemsWithInvalidImageSizes:(id)a3;
- (void)setLoadLargeThumbnailsInCustomOrder:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPendingDataSource:(id)a3;
- (void)setPerformingDataSourceChange:(BOOL)a3;
- (void)setPresentationFilter:(unint64_t)a3;
- (void)setRelayoutCoalescer:(id)a3;
- (void)setRoundProgressView:(id)a3;
- (void)setSpecManager:(id)a3;
- (void)setThumbnailLoadableItemWhitelist:(id)a3;
- (void)setTransitionLayout:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)updateCollectionViewLayoutInsets;
- (void)updateMainViewAnimated:(BOOL)a3;
- (void)updateNavigationItemTitle;
- (void)updateToolbarItems;
- (void)updateVisibleCellBadgesAndSelectability;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUImportOneUpViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_storeStrong((id *)&self->_itemsNeedingRelayout, 0);
  objc_storeStrong((id *)&self->_relayoutCoalescer, 0);
  objc_storeStrong((id *)&self->_itemsWithInvalidImageSizes, 0);
  objc_storeStrong((id *)&self->_thumbnailLoadableItemWhitelist, 0);
  objc_storeStrong((id *)&self->_inFlightReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);
  objc_storeStrong((id *)&self->_navigationTitleView, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_bottomSpacerBarButtonItem, 0);
  objc_storeStrong((id *)&self->_roundProgressView, 0);
  objc_storeStrong((id *)&self->_progressButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_stopImportBarButtonItem, 0);
  objc_storeStrong((id *)&self->_importBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_changeDetailsHelper, 0);
  objc_storeStrong((id *)&self->_pendingDataSource, 0);
  objc_storeStrong((id *)&self->_importDataSource, 0);
  objc_storeStrong((id *)&self->_importDataSourceManager, 0);
  objc_storeStrong((id *)&self->_importController, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_startingAssetReference, 0);
  objc_storeStrong((id *)&self->_reviewScrubber, 0);
}

- (void)setAnimatingTransition:(BOOL)a3
{
  self->_animatingTransition = a3;
}

- (BOOL)isAnimatingTransition
{
  return self->_animatingTransition;
}

- (void)setTransitionLayout:(id)a3
{
}

- (UICollectionViewLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (void)setItemsNeedingRelayout:(id)a3
{
}

- (NSMutableArray)itemsNeedingRelayout
{
  return self->_itemsNeedingRelayout;
}

- (void)setRelayoutCoalescer:(id)a3
{
}

- (PFCoalescer)relayoutCoalescer
{
  return self->_relayoutCoalescer;
}

- (void)setItemsWithInvalidImageSizes:(id)a3
{
}

- (NSMutableSet)itemsWithInvalidImageSizes
{
  return self->_itemsWithInvalidImageSizes;
}

- (void)setThumbnailLoadableItemWhitelist:(id)a3
{
}

- (NSMutableSet)thumbnailLoadableItemWhitelist
{
  return self->_thumbnailLoadableItemWhitelist;
}

- (void)setLoadLargeThumbnailsInCustomOrder:(BOOL)a3
{
  self->_loadLargeThumbnailsInCustomOrder = a3;
}

- (BOOL)loadLargeThumbnailsInCustomOrder
{
  return self->_loadLargeThumbnailsInCustomOrder;
}

- (void)setHasPerformedNavigationToStartingAsset:(BOOL)a3
{
  self->_hasPerformedNavigationToStartingAsset = a3;
}

- (BOOL)hasPerformedNavigationToStartingAsset
{
  return self->_hasPerformedNavigationToStartingAsset;
}

- (BOOL)updatingContentOffsetFromScrubbing
{
  return self->_updatingContentOffsetFromScrubbing;
}

- (NSIndexPath)inFlightReferenceIndexPath
{
  return self->_inFlightReferenceIndexPath;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (PLDateRangeFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (PLDateRangeFormatter)dayFormatter
{
  return self->_dayFormatter;
}

- (PXNavigationTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setActionCoordinator:(id)a3
{
}

- (PUImportActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (UIBarButtonItem)bottomSpacerBarButtonItem
{
  return self->_bottomSpacerBarButtonItem;
}

- (void)setRoundProgressView:(id)a3
{
}

- (PLRoundProgressView)roundProgressView
{
  return self->_roundProgressView;
}

- (UIBarButtonItem)progressButtonItem
{
  return self->_progressButtonItem;
}

- (UIBarButtonItem)deleteBarButtonItem
{
  return self->_deleteBarButtonItem;
}

- (UIBarButtonItem)stopImportBarButtonItem
{
  return self->_stopImportBarButtonItem;
}

- (UIBarButtonItem)importBarButtonItem
{
  return self->_importBarButtonItem;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (PUSelectableAssetCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setChangeDetailsHelper:(id)a3
{
}

- (PUImportChangeDetailsCollectionViewHelper)changeDetailsHelper
{
  return self->_changeDetailsHelper;
}

- (void)setPendingDataSource:(id)a3
{
}

- (PXImportAssetsDataSource)pendingDataSource
{
  return self->_pendingDataSource;
}

- (void)setPerformingDataSourceChange:(BOOL)a3
{
  self->_performingDataSourceChange = a3;
}

- (BOOL)performingDataSourceChange
{
  return self->_performingDataSourceChange;
}

- (void)setImportDataSource:(id)a3
{
}

- (PXImportAssetsDataSource)importDataSource
{
  return self->_importDataSource;
}

- (PXImportAssetsDataSourceManager)importDataSourceManager
{
  return self->_importDataSourceManager;
}

- (void)setPresentationFilter:(unint64_t)a3
{
  self->_presentationFilter = a3;
}

- (unint64_t)presentationFilter
{
  return self->_presentationFilter;
}

- (PXImportController)importController
{
  return self->_importController;
}

- (void)setSpecManager:(id)a3
{
}

- (PUImportOneUpViewControllerSpecManager)specManager
{
  return self->_specManager;
}

- (void)setIsCommitingPreview:(BOOL)a3
{
  self->_isCommitingPreview = a3;
}

- (BOOL)isCommitingPreview
{
  return self->_isCommitingPreview;
}

- (PXAssetReference)startingAssetReference
{
  return self->_startingAssetReference;
}

- (id)nextIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUImportOneUpViewController *)self importDataSource];
  uint64_t v6 = [v4 item];
  if (v6 < objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v4, "section")) - 1)
  {
    v7 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v8 = [v4 item] + 1;
    uint64_t v9 = [v4 section];
    v10 = v7;
    uint64_t v11 = v8;
LABEL_5:
    v13 = [v10 indexPathForItem:v11 inSection:v9];
    goto LABEL_7;
  }
  int64_t v12 = -[PUImportOneUpViewController nextSectionWithItems:](self, "nextSectionWithItems:", [v4 section]);
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = v12;
    v10 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = 0;
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (id)previousIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 item] < 1)
  {
    int64_t v6 = -[PUImportOneUpViewController previousSectionWithItems:](self, "previousSectionWithItems:", [v4 section]);
    if (v6 < 0)
    {
      v5 = 0;
    }
    else
    {
      int64_t v7 = v6;
      uint64_t v8 = [(PUImportOneUpViewController *)self importDataSource];
      v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v8, "numberOfItemsInSection:", v7) - 1, v7);
    }
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v4, "item") - 1, objc_msgSend(v4, "section"));
  }

  return v5;
}

- (int64_t)nextSectionWithItems:(int64_t)a3
{
  id v4 = [(PUImportOneUpViewController *)self importDataSource];
  unint64_t v5 = [v4 numberOfSections];
  while (++a3 < v5)
  {
    if ([v4 numberOfItemsInSection:a3]) {
      goto LABEL_6;
    }
  }
  a3 = -1;
LABEL_6:

  return a3;
}

- (int64_t)previousSectionWithItems:(int64_t)a3
{
  id v4 = [(PUImportOneUpViewController *)self importDataSource];
  while (a3-- >= 1)
  {
    if ([v4 numberOfItemsInSection:a3]) {
      goto LABEL_6;
    }
  }
  a3 = -1;
LABEL_6:

  return a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUImportOneUpViewController *)self collectionView];
  id v9 = [(PUImportOneUpViewController *)self tapGestureRecognizer];

  if (v9 == v7)
  {
    id v11 = [v8 panGestureRecognizer];
    if (v11 == v6) {
      char v10 = [v8 isDecelerating];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (CGRect)imageRectFromPhotoView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contentHelper];
  [v3 bounds];
  objc_msgSend(v4, "imageContentFrameForBounds:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "convertRect:toView:", 0, v6, v8, v10, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)didTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  double v6 = [(PUImportOneUpViewController *)self collectionView];
  double v7 = [v6 panGestureRecognizer];
  [v7 setEnabled:1];

  [(PUImportOneUpViewController *)self setAnimatingTransition:0];
  double v8 = [(PUImportOneUpViewController *)self itemsNeedingRelayout];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    double v10 = [(PUImportOneUpViewController *)self relayoutCoalescer];
    [v10 update];
  }
  id v11 = [(PUImportOneUpViewController *)self collectionViewLayout];
  [v11 setFloatingCellIndexPaths:0];
}

- (void)willTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  double v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
        long long v20 = 0u;
        long long v21 = 0u;
        double v14 = [(PUImportOneUpViewController *)self importDataSource];
        double v15 = [v13 importItem];
        if (v14)
        {
          [v14 itemIndexPathForItem:v15];
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
        }

        double v16 = PXIndexPathFromSimpleIndexPath();
        objc_msgSend(v7, "addObject:", v16, v20, v21);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  double v17 = [(PUImportOneUpViewController *)self collectionViewLayout];
  [v17 setFloatingCellIndexPaths:v7];

  double v18 = [(PUImportOneUpViewController *)self collectionView];
  double v19 = [v18 panGestureRecognizer];
  [v19 setEnabled:0];

  [(PUImportOneUpViewController *)self setAnimatingTransition:1];
}

- (void)prepareTransitionItemViewForDestination:(id)a3
{
  id v4 = a3;
  double v5 = [v4 transitionView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 initialFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v4 targetFrame];
    objc_msgSend(v5, "setInitialFrame:targetFrame:", v7, v9, v11, v13, v14, v15, v16, v17);
    double v18 = [v4 importItem];
    long long v31 = 0u;
    long long v32 = 0u;
    double v19 = [(PUImportOneUpViewController *)self importDataSource];
    long long v20 = v19;
    if (v19)
    {
      [v19 itemIndexPathForItem:v18];
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
    }

    long long v21 = PXIndexPathFromSimpleIndexPath();
    long long v22 = [(PUImportOneUpViewController *)self collectionView];
    long long v23 = [v22 cellForItemAtIndexPath:v21];

    long long v24 = [v23 photoView];
    long long v25 = [v24 contentHelper];
    [v25 contentAlpha];
    double v27 = v26;

    [v4 setTargetContentAlpha:v27];
    [v4 initialContentAlpha];
    double v29 = v28;
    [v4 targetContentAlpha];
    [v5 setPhotoViewInitialAlpha:v29 targetAlpha:v30];
  }
}

- (CGRect)targetFrameForTransitionItem:(id)a3
{
  id v4 = [a3 importItem];
  long long v23 = 0u;
  long long v24 = 0u;
  double v5 = [(PUImportOneUpViewController *)self importDataSource];
  double v6 = v5;
  if (v5)
  {
    [v5 itemIndexPathForItem:v4];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }

  double v7 = PXIndexPathFromSimpleIndexPath();
  double v8 = [(PUImportOneUpViewController *)self collectionView];
  double v9 = [v8 cellForItemAtIndexPath:v7];

  double v10 = [v9 photoView];
  [(PUImportOneUpViewController *)self imageRectFromPhotoView:v10];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)transitionItemsForContext:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PUImportOneUpViewController *)self collectionView];
  double v5 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v4];

  double v6 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:v5];
  long long v32 = 0u;
  long long v33 = 0u;
  double v7 = [(PUImportOneUpViewController *)self importDataSource];
  double v8 = v7;
  if (v7)
  {
    [v7 itemIndexPathForItem:v6];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }

  double v9 = [(PUImportOneUpViewController *)self collectionView];
  double v10 = [v9 cellForItemAtIndexPath:v5];

  double v11 = [v10 photoView];
  [(PUImportOneUpViewController *)self imageRectFromPhotoView:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [v11 contentHelper];
  double v21 = [v20 photoImage];

  double v22 = [PUImportOneUpTransitionItem alloc];
  v31[0] = v32;
  v31[1] = v33;
  long long v23 = -[PUImportOneUpTransitionItem initWithInitialFrame:snapshotImage:importItem:indexPath:](v22, "initWithInitialFrame:snapshotImage:importItem:indexPath:", v21, v6, v31, v13, v15, v17, v19);
  long long v24 = [v11 contentHelper];
  [v24 contentAlpha];
  -[PUImportOneUpTransitionItem setInitialContentAlpha:](v23, "setInitialContentAlpha:");

  long long v25 = [PUImportOneUpTransitionView alloc];
  double v26 = [(PUImportOneUpViewController *)self importController];
  double v27 = [v26 importMediaProvider];
  double v28 = [(PUImportOneUpTransitionView *)v25 initWithImportItem:v6 startingImage:v21 mediaProvider:v27];
  [(PUImportOneUpTransitionItem *)v23 setTransitionView:v28];

  v34[0] = v23;
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];

  return v29;
}

- (BOOL)reviewScrubber:(id)a3 shouldProvideFeedbackForCellAtIndexPath:(id)a4
{
  return 0;
}

- (unint64_t)reviewScrubber:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  double v5 = [(PUImportOneUpViewController *)self importDataSource];
  unint64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (unint64_t)numberOfSectionsInReviewScrubber:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self importDataSource];
  unint64_t v4 = [v3 numberOfSections];

  return v4;
}

- (void)reviewScrubberDidSelectItemAtIndexPath:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(PUImportOneUpViewController *)self collectionView];
  [v4 _stopScrollingAndZoomingAnimations];

  [(PUImportOneUpViewController *)self pageToIndexPath:v5 animated:1];
}

- (void)reviewScrubberDidScrub:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportOneUpViewController *)self collectionView];
  [v5 _stopScrollingAndZoomingAnimations];

  self->_updatingContentOffsetFromScrubbing = 1;
  id v6 = [v4 selectedIndexPath];

  [(PUImportOneUpViewController *)self pageToIndexPath:v6 animated:0];
  self->_updatingContentOffsetFromScrubbing = 0;
}

- (void)reviewScrubber:(id)a3 willDisplayCell:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:a5];
  id v9 = v7;
  [v9 setDisplayDelegate:self];
  [v9 setImportItem:v8];
  [v9 refreshThumbnail];
}

- (void)importOneUpScrubberCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  id v6 = [(PUImportOneUpViewController *)self importController];
  id v5 = [v6 importMediaProvider];
  [v5 cancelImageRequest:a4];
}

- (int64_t)importOneUpScrubberCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5
{
  id v7 = a5;
  double v8 = [a3 importItem];
  id v9 = [(PUImportOneUpViewController *)self importController];
  double v10 = [v9 importMediaProvider];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PUImportOneUpViewController_importOneUpScrubberCell_requestedThumbnailForImportItem_completion___block_invoke;
  v14[3] = &unk_1E5F264D8;
  id v15 = v7;
  id v11 = v7;
  int64_t v12 = [v10 requestImageForImportItem:v8 ofSize:0 completion:v14];

  return v12;
}

uint64_t __98__PUImportOneUpViewController_importOneUpScrubberCell_requestedThumbnailForImportItem_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)relayoutCollectionView
{
  id v3 = [(PUImportOneUpViewController *)self collectionView];
  if ([v3 isDecelerating])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(PUImportOneUpViewController *)self collectionView];
    char v6 = [v5 isDragging];

    if (v6)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    id v3 = [(PUImportOneUpViewController *)self collectionView];
    id v4 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v3];
  }

LABEL_7:
  id v7 = [(PUImportOneUpViewController *)self importDataSource];
  double v8 = [(PUImportOneUpViewController *)self importDataSource];
  if (v7)
  {
    [v7 firstItemIndexPath];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  id v9 = [v8 assetAtItemIndexPath:&v26];

  double v10 = [(PUImportOneUpViewController *)self importDataSource];
  if (v7)
  {
    [v7 lastItemIndexPath];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  id v11 = [v10 assetAtItemIndexPath:&v24];

  int64_t v12 = [(PUImportOneUpViewController *)self itemsNeedingRelayout];
  if ([v12 containsObject:v9])
  {
  }
  else
  {
    double v13 = [(PUImportOneUpViewController *)self itemsNeedingRelayout];
    int v14 = [v13 containsObject:v11];

    if (!v14) {
      goto LABEL_17;
    }
  }
  [(PUImportOneUpViewController *)self updateCollectionViewLayoutInsets];
LABEL_17:
  id v15 = [(PUImportOneUpViewController *)self collectionView];
  [v15 reloadData];

  [(PUImportOneUpViewController *)self updateCollectionViewLayoutInsets];
  if (v4)
  {
    double v16 = [(PUImportOneUpViewController *)self collectionView];
    [v16 contentOffset];
    double v18 = v17;

    double v19 = [(PUImportOneUpViewController *)self collectionView];
    [(PUImportOneUpViewController *)self _horizontalOffsetInCollectionView:v19 forCenteringOnItemAtIndexPath:v4];
    double v21 = v20;

    double v22 = [(PUImportOneUpViewController *)self collectionView];
    objc_msgSend(v22, "setContentOffset:", v21, v18);
  }
  long long v23 = [(PUImportOneUpViewController *)self itemsNeedingRelayout];
  [v23 removeAllObjects];
}

- (void)invalidateLayoutIfNeededForImportItem:(id)a3
{
  id v31 = a3;
  id v4 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v5 = [v4 useThumbnailSizesAsImageSizeHints];

  char v6 = [(PUImportOneUpViewController *)self itemsWithInvalidImageSizes];
  id v7 = [v6 member:v31];

  double v8 = v31;
  if (v7 && v5)
  {
    id v9 = [v31 importAsset];
    [v9 orientedPixelSize];
    double v11 = v10;
    double v13 = v12;

    [v31 thumbnailSize];
    double v15 = v14;
    double v17 = v16;
    [v31 largeThumbnailSize];
    double v19 = *MEMORY[0x1E4F1DB30];
    double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v21 != *MEMORY[0x1E4F1DB30] || v18 != v20)
    {
      [v31 largeThumbnailSize];
      double v15 = v23;
      double v17 = v24;
    }
    BOOL v25 = v11 == v19 && v13 == v20;
    double v8 = v31;
    if (v25 && (v15 != v19 || v17 != v20))
    {
      long long v27 = [(PUImportOneUpViewController *)self itemsNeedingRelayout];
      [v27 addObject:v31];

      double v28 = [(PUImportOneUpViewController *)self collectionViewLayout];
      [v28 invalidateLayout];

      BOOL v29 = [(PUImportOneUpViewController *)self isAnimatingTransition];
      double v8 = v31;
      if (!v29)
      {
        double v30 = [(PUImportOneUpViewController *)self relayoutCoalescer];
        [v30 update];

        double v8 = v31;
      }
    }
  }
}

- (void)importOneUpCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  id v6 = [(PUImportOneUpViewController *)self importController];
  int v5 = [v6 importMediaProvider];
  [v5 cancelImageRequest:a4];
}

- (int64_t)importOneUpCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PUImportOneUpViewController *)self loadLargeThumbnailsInCustomOrder]
    && ([(PUImportOneUpViewController *)self thumbnailLoadableItemWhitelist],
        double v11 = objc_claimAutoreleasedReturnValue(),
        [v11 member:v9],
        double v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    double v13 = [(PUImportOneUpViewController *)self importController];
    double v14 = [v13 importMediaProvider];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__PUImportOneUpViewController_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke;
    v16[3] = &unk_1E5F25DF0;
    id v18 = v10;
    objc_copyWeak(&v19, &location);
    id v17 = v9;
    double v12 = (void *)[v14 requestImageForImportItem:v17 ofSize:3 priority:1 completion:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (int64_t)v12;
}

void __90__PUImportOneUpViewController_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  if (v7)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v6, a4);
    id v6 = v9;
  }
  if (v6 && (a4 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidateLayoutIfNeededForImportItem:*(void *)(a1 + 32)];

    id v6 = v9;
  }
}

- (void)importOneUpCell:(id)a3 requestedBadgeUpdateForImportItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isDeleted] & 1) == 0)
  {
    id v8 = [(PUImportOneUpViewController *)self collectionView];
    id v9 = [v8 indexPathForCell:v6];

    if (v9)
    {
      id v10 = [(PUImportOneUpViewController *)self collectionView];
      double v11 = [v10 supplementaryViewForElementKind:@"PUSelectableAssetBadgeKind" atIndexPath:v9];

      if (v11)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __81__PUImportOneUpViewController_importOneUpCell_requestedBadgeUpdateForImportItem___block_invoke;
        v12[3] = &unk_1E5F2ECC8;
        id v13 = v11;
        id v14 = v7;
        [v13 performBadgeUpdates:v12];
      }
    }
  }
}

uint64_t __81__PUImportOneUpViewController_importOneUpCell_requestedBadgeUpdateForImportItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", objc_msgSend(*(id *)(a1 + 40), "badgeType"));
  uint64_t v2 = [*(id *)(a1 + 40) isSelectable];
  id v3 = *(void **)(a1 + 32);
  return [v3 setSelectable:v2];
}

- (CGRect)layout:(id)a3 collectionView:(id)a4 selectionBadgeFrameForItemFrame:(CGRect)a5 atIndexPath:(id)a6
{
  -[PUImportOneUpViewController selectionBadgeFrameForItemFrame:atIndexPath:](self, "selectionBadgeFrameForItemFrame:atIndexPath:", a6, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  -[PUImportOneUpViewController sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", a5, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [MEMORY[0x1E4F902D0] sharedInstance];
    int v11 = [v10 showImportItemFilenames];

    if (v11)
    {
      double v12 = [(PUImportOneUpViewController *)self importDataSource];
      [v12 identifier];
      PXSimpleIndexPathFromIndexPath();

      id v13 = [(PUImportOneUpViewController *)self importDataSource];
      memset(v18, 0, sizeof(v18));
      id v14 = [v13 assetAtItemIndexPath:v18];

      double v15 = NSString;
      double v16 = [v14 debugDisplayName];
      id v17 = [v15 stringWithFormat:@"%@ [%lu]", v16, objc_msgSend(v8, "item")];
      [v9 updateDebugLabel:v17];
    }
    else
    {
      [v9 updateDebugLabel:0];
    }
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v10 isEqualToString:@"PUSelectableAssetBadgeKind"])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUImportOneUpViewController.m" lineNumber:1536 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v12 = [(PUImportOneUpViewController *)self badgeViewAtIndexPath:v11 forCollectionView:v9];

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"PUImportOneUpCellIdentifier" forIndexPath:v6];
  [v7 setDisplayDelegate:self];
  id v8 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:v6];

  [v7 setImportItem:v8];
  objc_msgSend(v7, "setSelected:", objc_msgSend(v8, "isSelected"));
  [v7 refreshThumbnail];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v5 = [(PUImportOneUpViewController *)self importDataSource];
  int64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self importDataSource];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [v8 bounds];
  double width = v36.size.width;
  double height = v36.size.height;
  double v11 = a5->x;
  double y = a5->y;
  v36.origin.double x = a5->x;
  v36.origin.double y = y;
  double MidX = CGRectGetMidX(v36);
  id v14 = [v8 collectionViewLayout];
  double v15 = objc_msgSend(v14, "layoutAttributesForElementsInRect:", v11, y, width, height);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    double v20 = 1.79769313e308;
    double v21 = 1.79769313e308;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        double v23 = *(void **)(*((void *)&v30 + 1) + 8 * v22);
        double v24 = objc_msgSend(v23, "indexPath", (void)v30);
        if (![v23 representedElementCategory])
        {
          if (([(PUImportOneUpViewController *)self _horizontalOffsetInCollectionView:v8 forCenteringOnItemAtIndexPath:v24], double v26 = v25, x == 0.0)|| x > 0.0 && v25 > a5->x|| x < 0.0 && v25 < a5->x)
          {
            [v23 center];
            double v28 = vabdd_f64(v27, MidX);
            if (v28 < v20)
            {
              double v20 = v28;
              double v21 = v26;
            }
          }
        }

        ++v22;
      }
      while (v18 != v22);
      uint64_t v29 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v18 = v29;
    }
    while (v29);

    if (v21 != 1.79769313e308)
    {
      a5->double x = v21;
      a5->double y = 0.0;
    }
  }
  else
  {
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self reviewScrubber];
  [v3 finishInteractiveUpdate];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v5 = [(PUImportOneUpViewController *)self reviewScrubber];
    [v5 finishInteractiveUpdate];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  [(PUImportOneUpViewController *)self updateNavigationItemTitle];
  if (![(PUImportOneUpViewController *)self updatingContentOffsetFromScrubbing])
  {
    [(PUImportOneUpViewController *)self _updateReviewScrubberFromContentOffset];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self reviewScrubber];
  [v3 beginInteractiveUpdate];
}

- (void)_importControllerWillBeginAction
{
}

- (void)_importControllerDidEndAction
{
  [(PUImportOneUpViewController *)self setAllowsSelection:1];
  [(PUImportOneUpViewController *)self updateToolbarItems];
  id v3 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v4 = [v3 showProgressTitles];

  if (v4)
  {
    [(PUImportOneUpViewController *)self updateNavigationItemTitle];
  }
}

- (id)importDestinationForActionCoordinator:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self importController];
  int v4 = [v3 importDestinationAlbum];

  return v4;
}

- (void)actionCoordinatorDidBeginDelete:(id)a3
{
  [(PUImportOneUpViewController *)self updateToolbarItems];
  int v4 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v5 = [v4 showProgressTitles];

  if (v5)
  {
    [(PUImportOneUpViewController *)self updateNavigationItemTitle];
  }
}

- (void)actionCoordinatorDidBeginImport:(id)a3
{
  [(PUImportOneUpViewController *)self updateToolbarItems];
  int v4 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v5 = [v4 showProgressTitles];

  if (v5)
  {
    [(PUImportOneUpViewController *)self updateNavigationItemTitle];
  }
}

- (void)deleteItems:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportOneUpViewController *)self actionCoordinator];
  [v5 deleteItemsWithoutConfirmation:v4];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 0;
}

- (void)importControllerProgressDidChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  int64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F90EF0]];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F90EE8]];

  id v9 = [v4 userInfo];

  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F90F00]];

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _PFAssertContinueHandler();
  }
  [v6 doubleValue];
  double v12 = v11;
  id v13 = _importOneUpLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v25 = "-[PUImportOneUpViewController importControllerProgressDidChange:]";
    __int16 v26 = 2048;
    double v27 = v12;
    _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_INFO, "%s: setting progress to %f ", buf, 0x16u);
  }

  if (v12 == 0.0)
  {
    id v14 = [(PUImportOneUpViewController *)self roundProgressView];
    [v14 resetProgress];
  }
  double v15 = [(PUImportOneUpViewController *)self importController];
  [v15 isDeletingAssets];

  id v16 = PLLocalizedFrameworkString();
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  double v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
  uint64_t v18 = PUStringWithValidatedFormat();

  uint64_t v19 = [(PUImportOneUpViewController *)self roundProgressView];
  [v19 setProgress:v12];

  [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityLabel:v18];
  if (v12 >= 1.0)
  {
    double v20 = PLLocalizedFrameworkString();
    [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityLabel:v20];
  }
  double v21 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v22 = [v21 showProgressTitles];

  if (v22) {
    [(PUImportOneUpViewController *)self updateNavigationItemTitle];
  }
}

- (void)_stopImportAction:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self actionCoordinator];
  [v3 stopImport];
}

- (void)_deleteAction:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUImportOneUpViewController *)self importController];
  int64_t v6 = [v5 selectedItems];

  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v8 = [(PUImportOneUpViewController *)self collectionView];
    id v9 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v8];

    uint64_t v10 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:v9];
    double v11 = (void *)v10;
    if (v10)
    {
      v13[0] = v10;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  double v12 = [(PUImportOneUpViewController *)self actionCoordinator];
  [v12 deleteItemsFromBarButtonItem:v4 withOneUpHintItems:v7];
}

- (void)_cancelOneUpView
{
  [(PUImportOneUpViewController *)self _updateBarItemsAnimated:1];
  id v3 = [(PUImportOneUpViewController *)self _currentAsset];
  [(PUImportOneUpViewController *)self _dismissReviewControllerWithAsset:v3];
}

- (void)_dismissReviewControllerWithAsset:(id)a3
{
}

- (void)_reallyToggleCurrentPickStatusAtIndexPath:(id)a3
{
  id v7 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:a3];
  if ([v7 isSelectable])
  {
    char v4 = [v7 isSelected];
    id v5 = [(PUImportOneUpViewController *)self importController];
    int64_t v6 = v5;
    if (v4) {
      [v5 deselectItem:v7];
    }
    else {
      [v5 selectItem:v7];
    }

    [(PUImportOneUpViewController *)self updateNavigationItemTitle];
    [(PUImportOneUpViewController *)self updateToolbarItems];
  }
}

- (void)_toggleCurrentPickStatusAtIndexPath:(id)a3
{
  if (self->_allowsSelection) {
    [(PUImportOneUpViewController *)self _reallyToggleCurrentPickStatusAtIndexPath:a3];
  }
}

- (void)_updateReviewScrubberFromContentOffset
{
  id v6 = [(PUImportOneUpViewController *)self importDataSource];
  if ([v6 containsAnyItems])
  {
    [(PUImportOneUpViewController *)self absoluteProgressFromCurrentContentOffset];
    double v4 = v3;
    id v5 = [(PUImportOneUpViewController *)self reviewScrubber];
    [v5 updateWithAbsoluteProgress:v4];
  }
}

- (double)absoluteProgressFromCurrentContentOffset
{
  double v3 = [(PUImportOneUpViewController *)self importDataSource];
  double v4 = 0.0;
  if ([v3 containsAnyItems])
  {
    id v5 = [(PUImportOneUpViewController *)self collectionView];
    id v6 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v5];

    id v7 = [(PUImportOneUpViewController *)self assetAtIndexPath:v6];
    id v8 = [(PUImportOneUpViewController *)self importDataSource];
    id v9 = [v8 allItems];

    uint64_t v10 = [v9 indexOfObject:v7];
    [(PUImportOneUpViewController *)self sizeForItemAtIndexPath:v6];
    double v12 = v11;
    id v13 = [(PUImportOneUpViewController *)self collectionView];
    [v13 contentOffset];
    double v15 = v14;

    id v16 = [(PUImportOneUpViewController *)self collectionView];
    [(PUImportOneUpViewController *)self _horizontalOffsetInCollectionView:v16 forCenteringOnItemAtIndexPath:v6];
    double v18 = v17;

    if (v15 >= v18)
    {
      uint64_t v19 = [(PUImportOneUpViewController *)self nextIndexPath:v6];
      double v28 = v12;
      if (v19)
      {
        [(PUImportOneUpViewController *)self sizeForItemAtIndexPath:v19];
        double v28 = v29;
      }
      long long v30 = [(PUImportOneUpViewController *)self specManager];
      long long v31 = [v30 spec];
      [v31 interItemSpacing];
      double v33 = round(v28 * 0.5 + v12 * 0.5 + v18 + v32);

      double v27 = (v15 - v18) / (v33 - v18);
      double v26 = (double)v10;
    }
    else
    {
      uint64_t v19 = [(PUImportOneUpViewController *)self previousIndexPath:v6];
      double v20 = v12;
      if (v19)
      {
        [(PUImportOneUpViewController *)self sizeForItemAtIndexPath:v19];
        double v20 = v21;
      }
      int v22 = [(PUImportOneUpViewController *)self specManager];
      double v23 = [v22 spec];
      [v23 interItemSpacing];
      double v25 = round(v18 - v12 * 0.5 - v24 - v20 * 0.5);

      double v26 = (double)v10;
      double v27 = (v15 - v25) / (v18 - v25) + -1.0;
    }
    double v4 = v27 + v26;
  }
  return v4;
}

- (unsigned)reviewScrubberImageFormat
{
  uint64_t v2 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  double v3 = [v2 largestUncroppedNonJPEGThumbnailFormat];
  unsigned __int16 v4 = [v3 formatID];

  return v4;
}

- (PUReviewScrubber)reviewScrubber
{
  reviewScrubber = self->_reviewScrubber;
  if (!reviewScrubber)
  {
    unsigned __int16 v4 = objc_alloc_init(PUReviewScrubber);
    id v5 = self->_reviewScrubber;
    self->_reviewScrubber = v4;

    reviewScrubber = self->_reviewScrubber;
  }
  return reviewScrubber;
}

- (void)updateCollectionViewLayoutInsets
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  [(PUImportOneUpViewController *)self getMainCollectionViewFrame:&v19 collectionViewLayoutInsets:&v17];
  id v15 = 0;
  id v16 = 0;
  [(PUImportOneUpViewController *)self getFirstValidIndexPath:&v16 lastValidIndexPath:&v15];
  id v3 = v16;
  id v4 = v15;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    double v9 = *((double *)&v17 + 1);
    double v11 = *((double *)&v18 + 1);
  }
  else
  {
    [(PUImportOneUpViewController *)self sizeForItemAtIndexPath:v3];
    double v8 = v7;
    [(PUImportOneUpViewController *)self sizeForItemAtIndexPath:v5];
    double v9 = *((double *)&v17 + 1) + round((*(double *)&v20 - v8) * 0.5);
    double v11 = *((double *)&v18 + 1) + round((*(double *)&v20 - v10) * 0.5);
    *((double *)&v17 + 1) = v9;
    *((double *)&v18 + 1) = v11;
  }
  double v12 = *(double *)&v17;
  double v13 = *(double *)&v18;
  double v14 = [(PUImportOneUpViewController *)self collectionViewLayout];
  objc_msgSend(v14, "setItemsContentInset:", v12, v9, v13, v11);
}

- (id)badgeViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  if (a4)
  {
    uint64_t v6 = [a4 dequeueReusableSupplementaryViewOfKind:@"PUSelectableAssetBadgeKind" withReuseIdentifier:@"PUImportOneUpBadgeIdentifier" forIndexPath:a3];
  }
  else
  {
    id v7 = a3;
    double v8 = [PUImportOneUpCellBadgeView alloc];
    uint64_t v6 = -[PUImportOneUpCellBadgeView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  double v9 = (void *)v6;
  double v10 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:a3];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PUImportOneUpViewController_badgeViewAtIndexPath_forCollectionView___block_invoke;
  v16[3] = &unk_1E5F2ECC8;
  id v11 = v9;
  id v17 = v11;
  long long v18 = v10;
  id v12 = v10;
  [v11 performBadgeUpdates:v16];
  double v13 = v18;
  id v14 = v11;

  return v14;
}

uint64_t __70__PUImportOneUpViewController_badgeViewAtIndexPath_forCollectionView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", objc_msgSend(*(id *)(a1 + 40), "badgeType"));
  uint64_t v2 = [*(id *)(a1 + 40) isSelectable];
  id v3 = *(void **)(a1 + 32);
  return [v3 setSelectable:v2];
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  if (!v10)
  {
    id v11 = [v8 visibleCells];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v10 = 0;
      uint64_t v14 = *(void *)v25;
      double v15 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v18 = [v8 indexPathForCell:v17];
          if (([v9 isEqual:v18] & 1) == 0)
          {
            [v17 center];
            double v21 = (v20 - y) * (v20 - y) + (v19 - x) * (v19 - x);
            if (v21 < v15)
            {
              id v22 = v18;

              double v15 = v21;
              double v10 = v22;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
    else
    {
      double v10 = 0;
    }
  }
  return v10;
}

- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 layoutAttributesForItemAtIndexPath:a4];
  [v6 center];
  double v8 = v7;
  [v5 bounds];
  double v10 = v9;

  return round(v8 + v10 * -0.5);
}

- (id)indexPathOfCenterVisibleItemInCollectionView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v10 = -[PUImportOneUpViewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v4, 0, MidX, CGRectGetMidY(v14));

  return v10;
}

- (void)pageToIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = [(PUImportOneUpViewController *)self collectionView];
  [v11 contentOffset];
  double v8 = v7;
  [(PUImportOneUpViewController *)self _horizontalOffsetInCollectionView:v11 forCenteringOnItemAtIndexPath:v6];
  double v10 = v9;

  objc_msgSend(v11, "setContentOffset:animated:", v4, v10, v8);
  [(PUImportOneUpViewController *)self updateNavigationItemTitle];
}

- (void)pageToItemOrNearestIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = [(PUImportOneUpViewController *)self importDataSource];
  double v8 = v7;
  if (v7)
  {
    [v7 itemIndexPathForItem:v6];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }

  if ((void)v14 == *MEMORY[0x1E4F91310])
  {
    double v9 = [(PUImportOneUpViewController *)self collectionView];
    double v10 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v9];

    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  long long v12 = v14;
  long long v13 = v15;
  double v10 = PXIndexPathFromSimpleIndexPath();
  if (v10)
  {
LABEL_8:
    id v11 = [(PUImportOneUpViewController *)self reviewScrubber];
    [v11 setSelectedIndexPath:v10];

    [(PUImportOneUpViewController *)self pageToIndexPath:v10 animated:v4];
  }
LABEL_9:
}

- (CGSize)sizeForItemAtIndexPath:(id)a3
{
  BOOL v4 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:a3];
  id v5 = [v4 importAsset];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  [(PUImportOneUpViewController *)self getMainCollectionViewFrame:&v52 collectionViewLayoutInsets:&v50];
  double v6 = *(double *)&v53 - (*((double *)&v50 + 1) + *((double *)&v51 + 1));
  double v7 = *((double *)&v53 + 1) - (*(double *)&v50 + *(double *)&v51);
  [v5 orientedPixelSize];
  double v9 = v8;
  double v11 = v10;
  long long v12 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v13 = [v12 useThumbnailSizesAsImageSizeHints];

  double v14 = *MEMORY[0x1E4F1DB30];
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v9 != *MEMORY[0x1E4F1DB30] || v11 != v15 || v13 == 0) {
    goto LABEL_27;
  }
  [v4 largeThumbnailSize];
  if (v19 == v14 && v18 == v15)
  {
    [v4 thumbnailSize];
    if (v24 == v14 && v23 == v15)
    {
      long long v26 = [(PUImportOneUpViewController *)self itemsWithInvalidImageSizes];

      if (!v26)
      {
        long long v27 = [MEMORY[0x1E4F1CA80] set];
        [(PUImportOneUpViewController *)self setItemsWithInvalidImageSizes:v27];
      }
      double v28 = [(PUImportOneUpViewController *)self itemsWithInvalidImageSizes];
      [v28 addObject:v4];

      goto LABEL_22;
    }
    [v4 thumbnailSize];
  }
  else
  {
    [v4 largeThumbnailSize];
  }
  double v9 = v21;
  double v11 = v22;
LABEL_22:
  if (v9 != v14 || v11 != v15)
  {
    long long v30 = [(PUImportOneUpViewController *)self itemsWithInvalidImageSizes];
    [v30 removeObject:v4];
  }
LABEL_27:
  long long v31 = [(PUImportOneUpViewController *)self specManager];
  double v32 = [v31 spec];

  [v32 interItemSpacing];
  double v34 = v6 + v33 * -4.0;
  double v35 = v7 + v33 * -2.0;
  [v32 selectionBadgeSize];
  double v37 = v36;
  [v32 selectionBadgeOffset];
  double v39 = v37 + v38 * 2.0;
  PURectWithSizeThatFitsInRect(v9, v11, 0.0, 0.0, v34, v35);
  if (v41 < v39 && v11 < v9)
  {
    double v40 = v40 * (v39 / v41);
    double v41 = v39;
  }
  if (v40 < v39 && v9 < v11)
  {
    double v41 = v41 * (v39 / v40);
    double v40 = v39;
  }
  if (v40 >= v39) {
    double v44 = v40;
  }
  else {
    double v44 = v39;
  }
  if (v34 < v44) {
    double v44 = v34;
  }
  if (v41 >= v39) {
    double v45 = v41;
  }
  else {
    double v45 = v39;
  }
  if (v35 < v45) {
    double v45 = v35;
  }
  double v46 = round(v44);
  double v47 = round(v45);

  double v48 = v46;
  double v49 = v47;
  result.CGFloat height = v49;
  result.CGFloat width = v48;
  return result;
}

- (id)importAssetAtIndexPath:(id)a3
{
  id v3 = [(PUImportOneUpViewController *)self assetAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportOneUpViewController *)self importDataSource];
  [v5 identifier];
  PXSimpleIndexPathFromIndexPath();

  double v6 = [(PUImportOneUpViewController *)self importDataSource];
  memset(v9, 0, sizeof(v9));
  double v7 = [v6 assetAtItemIndexPath:v9];

  return v7;
}

- (id)_currentAsset
{
  id v3 = [(PUImportOneUpViewController *)self collectionView];
  id v4 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v3];

  id v5 = [(PUImportOneUpViewController *)self assetAtIndexPath:v4];

  return v5;
}

- (void)_handleTapInMainCollectionView:(id)a3
{
  id v4 = a3;
  id v17 = [(PUImportOneUpViewController *)self collectionView];
  [v4 locationInView:v17];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(PUImportOneUpViewController *)self collectionViewLayout];
  [v17 contentSize];
  double v11 = v10;
  [v9 itemsContentInset];
  double v14 = v11 - fabs(v13);
  if (v6 > fabs(v12) && v6 < v14)
  {
    id v16 = -[PUImportOneUpViewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v17, 0, v6, v8);
    if (v16) {
      [(PUImportOneUpViewController *)self _handleTapAtIndexPath:v16];
    }
  }
}

- (void)_handleTapAtIndexPath:(id)a3
{
  id v6 = a3;
  id v4 = [(PUImportOneUpViewController *)self collectionView];
  [(PUImportOneUpViewController *)self _toggleCurrentPickStatusAtIndexPath:v6];
  if (([v4 isDragging] & 1) == 0
    && ([v4 isDecelerating] & 1) == 0
    && [v4 isTracking])
  {
    double v5 = [(PUImportOneUpViewController *)self reviewScrubber];
    [v5 beginInteractiveUpdate];
    [(PUImportOneUpViewController *)self pageToIndexPath:v6 animated:1];
  }
}

- (void)loadCenterPrioritizedVisibleThumbnails
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(PUImportOneUpViewController *)self loadLargeThumbnailsInCustomOrder])
  {
    id v3 = [(PUImportOneUpViewController *)self collectionView];
    id v4 = [v3 indexPathsForVisibleItems];

    if ([v4 count])
    {
      double v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_310];

      id v6 = [(PUImportOneUpViewController *)self collectionView];
      double v7 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v6];

      if (v7)
      {
        double v8 = [(PUImportOneUpViewController *)self collectionView];
        double v9 = [v8 cellForItemAtIndexPath:v7];

        if (v9)
        {
          double v10 = [v9 importItem];
          double v11 = [(PUImportOneUpViewController *)self thumbnailLoadableItemWhitelist];
          [v11 addObject:v10];

          [v9 refreshThumbnail];
        }
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v4 = v5;
      uint64_t v12 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v4);
            }
            id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isEqual:", v7, (void)v21) & 1) == 0)
            {
              id v17 = [(PUImportOneUpViewController *)self collectionView];
              double v18 = [v17 cellForItemAtIndexPath:v16];

              if (v18)
              {
                double v19 = [v18 importItem];
                double v20 = [(PUImportOneUpViewController *)self thumbnailLoadableItemWhitelist];
                [v20 addObject:v19];

                [v18 refreshThumbnail];
              }
            }
          }
          uint64_t v13 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      [(PUImportOneUpViewController *)self setLoadLargeThumbnailsInCustomOrder:0];
      [(PUImportOneUpViewController *)self setThumbnailLoadableItemWhitelist:0];
    }
  }
}

uint64_t __69__PUImportOneUpViewController_loadCenterPrioritizedVisibleThumbnails__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)beginCenterPrioritizedThumbnailLoading
{
  [(PUImportOneUpViewController *)self setLoadLargeThumbnailsInCustomOrder:[(PUImportOneUpViewController *)self isCommitingPreview] ^ 1];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  [(PUImportOneUpViewController *)self setThumbnailLoadableItemWhitelist:v3];
}

- (CGRect)selectionBadgeFrameForItemFrame:(CGRect)a3 atIndexPath:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(PUImportOneUpViewController *)self specManager];
  double v9 = [v8 spec];

  [v9 selectionBadgeSize];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v9 selectionBadgeOffset];
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [v9 selectionBadgeCorner];
  if (v18 != 1)
  {
    CGFloat v19 = width;
    CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    if (v18 == 4)
    {
      CGFloat v26 = x;
      CGFloat v27 = y;
      CGFloat v28 = height;
    }
    else
    {
      CGFloat v21 = height;
      CGFloat v22 = *MEMORY[0x1E4F1DB28];
      if (v18 == 2)
      {
        CGFloat v23 = x;
        CGFloat v24 = y;
        double v25 = CGRectGetWidth(*(CGRect *)(&v19 - 2));
        v40.origin.CGFloat x = v22;
        v40.origin.CGFloat y = v20;
        v40.size.CGFloat width = v11;
        v40.size.CGFloat height = v13;
        double v15 = v25 - CGRectGetWidth(v40) - v15;
        goto LABEL_8;
      }
      CGFloat v29 = x;
      CGFloat v30 = y;
      double v38 = v21;
      double rect = v19;
      double v37 = CGRectGetWidth(*(CGRect *)(&v19 - 2));
      v41.origin.CGFloat x = v22;
      v41.origin.CGFloat y = v20;
      v41.size.CGFloat width = v11;
      v41.size.CGFloat height = v13;
      CGFloat v31 = CGRectGetWidth(v41);
      CGFloat v28 = v38;
      double v15 = v37 - v31 - v15;
      CGFloat v26 = x;
      CGFloat v27 = y;
      CGFloat v19 = rect;
    }
    double v32 = CGRectGetHeight(*(CGRect *)(&v19 - 2));
    v42.origin.CGFloat x = v15;
    v42.origin.CGFloat y = v20;
    v42.size.CGFloat width = v11;
    v42.size.CGFloat height = v13;
    double v17 = v32 - CGRectGetHeight(v42) - v17;
  }
LABEL_8:

  double v33 = v15;
  double v34 = v17;
  double v35 = v11;
  double v36 = v13;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (void)getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4
{
  id v6 = [(PUImportOneUpViewController *)self importDataSource];
  double v7 = v6;
  if (v6)
  {
    [v6 firstItemIndexPath];
    [v7 lastItemIndexPath];
    double v8 = PXIndexPathFromSimpleIndexPath();
    double v9 = PXIndexPathFromSimpleIndexPath();
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v9 = 0;
  double v8 = 0;
  if (a3) {
LABEL_3:
  }
    *a3 = v8;
LABEL_4:
  if (a4) {
    *a4 = v9;
  }
}

- (void)getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4
{
  double v7 = [(PUImportOneUpViewController *)self view];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  double v16 = [(PUImportOneUpViewController *)self collectionViewLayout];
  [v16 layoutReferenceSize];
  double v18 = v17;
  double v20 = v19;
  double v21 = *MEMORY[0x1E4F1DB30];
  double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v18 != v21 || v20 != v22)
  {
    CGFloat v24 = [(PUImportOneUpViewController *)self collectionViewLayout];
    [v24 layoutReferenceSize];
    CGFloat v13 = v25;
    CGFloat v15 = v26;
  }
  if (a3)
  {
    a3->origin.CGFloat x = v9;
    a3->origin.CGFloat y = v11;
    a3->size.CGFloat width = v13;
    a3->size.CGFloat height = v15;
  }
  if (a4)
  {
    [(PUImportOneUpViewController *)self px_safeAreaInsets];
    UIEdgeInsetsMax();
    a4->top = v27;
    a4->left = v28;
    a4->bottom = v29;
    a4->right = v30;
  }
}

- (void)updateMainViewAnimated:(BOOL)a3
{
  if ([(PUImportOneUpViewController *)self isViewLoaded])
  {
    id v4 = [(PUImportOneUpViewController *)self specManager];
    double v5 = [v4 spec];

    long long v22 = 0u;
    long long v23 = 0u;
    memset(v21, 0, sizeof(v21));
    [(PUImportOneUpViewController *)self getMainCollectionViewFrame:&v22 collectionViewLayoutInsets:v21];
    id v6 = +[PUInterfaceManager currentTheme];
    double v7 = [v6 photoCollectionViewBackgroundColor];

    double v8 = [(PUImportOneUpViewController *)self collectionView];
    CGFloat v9 = [(PUImportOneUpViewController *)self collectionViewLayout];
    [v5 interItemSpacing];
    if (v9)
    {
      if (v8)
      {
LABEL_4:
        objc_msgSend(v8, "setFrame:", v22, v23);
        [(PUImportOneUpViewController *)self updateCollectionViewLayoutInsets];

        return;
      }
    }
    else
    {
      double v11 = v10;
      CGFloat v9 = objc_alloc_init(PUSelectableAssetCollectionViewLayout);
      [(PUHorizontalCollectionViewLayout *)v9 setInteritemSpacing:v11];
      [v5 selectionBadgeOffset];
      -[PUSelectableAssetCollectionViewLayout setSharingBadgeOffset:](v9, "setSharingBadgeOffset:");
      [(PUHorizontalCollectionViewLayout *)v9 setDelegate:self];
      objc_storeStrong((id *)&self->_collectionViewLayout, v9);
      if (v8) {
        goto LABEL_4;
      }
    }
    id v12 = objc_alloc(MEMORY[0x1E4FB1568]);
    double v8 = objc_msgSend(v12, "initWithFrame:collectionViewLayout:", v9, v22, v23);
    [v8 setAutoresizingMask:18];
    [v8 setAlwaysBounceVertical:0];
    [v8 setAlwaysBounceHorizontal:1];
    [v8 setPagingEnabled:0];
    [v8 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [v8 setDataSource:self];
    [v8 setDelegate:self];
    [v8 setShowsHorizontalScrollIndicator:0];
    [v8 setBackgroundColor:v7];
    [v8 setDelaysContentTouches:0];
    [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUImportOneUpCellIdentifier"];
    [v8 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUSelectableAssetBadgeKind" withReuseIdentifier:@"PUImportOneUpBadgeIdentifier"];
    [v8 setContentInsetAdjustmentBehavior:2];
    CGFloat v13 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapInMainCollectionView_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v13;

    CGFloat v15 = [(PUImportOneUpViewController *)self tapGestureRecognizer];
    [v15 setNumberOfTapsRequired:1];

    double v16 = [(PUImportOneUpViewController *)self tapGestureRecognizer];
    [v16 setNumberOfTouchesRequired:1];

    double v17 = [(PUImportOneUpViewController *)self tapGestureRecognizer];
    [v17 setDelegate:self];

    double v18 = [(PUImportOneUpViewController *)self tapGestureRecognizer];
    [v8 addGestureRecognizer:v18];

    objc_storeStrong((id *)&self->_collectionView, v8);
    double v19 = [(PUImportOneUpViewController *)self view];
    double v20 = [(PUImportOneUpViewController *)self collectionView];
    [v19 addSubview:v20];

    goto LABEL_4;
  }
}

- (void)_updateBarItemsAnimated:(BOOL)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PUImportOneUpViewController *)self navigationTitleView];

  if (!v4)
  {
    double v5 = (PXNavigationTitleView *)objc_alloc_init(MEMORY[0x1E4F903B8]);
    navigationTitleView = self->_navigationTitleView;
    self->_navigationTitleView = v5;
  }
  double v7 = [(PUImportOneUpViewController *)self cancelBarButtonItem];

  if (!v7)
  {
    double v8 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@" " style:0 target:self action:sel__cancelAction_];
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v8;

    double v10 = [(PUImportOneUpViewController *)self cancelBarButtonItem];
    [v10 _setShowsBackButtonIndicator:1];
  }
  double v11 = [(PUImportOneUpViewController *)self importBarButtonItem];

  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
    CGFloat v13 = PLLocalizedFrameworkString();
    double v14 = (UIBarButtonItem *)[v12 initWithTitle:v13 style:2 target:0 action:0];
    importBarButtonItem = self->_importBarButtonItem;
    self->_importBarButtonItem = v14;
  }
  double v16 = [(PUImportOneUpViewController *)self stopImportBarButtonItem];

  if (!v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
    double v18 = PLLocalizedFrameworkString();
    double v19 = (UIBarButtonItem *)[v17 initWithTitle:v18 style:0 target:self action:sel__stopImportAction_];
    stopImportBarButtonItem = self->_stopImportBarButtonItem;
    self->_stopImportBarButtonItem = v19;
  }
  double v21 = [(PUImportOneUpViewController *)self deleteBarButtonItem];

  if (!v21)
  {
    long long v22 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:16 target:self action:sel__deleteAction_];
    deleteBarButtonItem = self->_deleteBarButtonItem;
    self->_deleteBarButtonItem = v22;
  }
  CGFloat v24 = [(PUImportOneUpViewController *)self progressButtonItem];

  if (!v24)
  {
    double v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E8]), "initWithFrame:style:", 3, 0.0, 0.0, 28.0, 28.0);
    [(PUImportOneUpViewController *)self setRoundProgressView:v25];

    double v26 = [(PUImportOneUpViewController *)self roundProgressView];
    [v26 setUserInteractionEnabled:0];

    CGFloat v27 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    CGFloat v28 = [(PUImportOneUpViewController *)self roundProgressView];
    [v27 addSubview:v28];

    objc_msgSend(v27, "setFrame:", 0.0, 0.0, 28.0, 28.0);
    CGFloat v29 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v27];
    progressButtonItem = self->_progressButtonItem;
    self->_progressButtonItem = v29;

    [(UIBarButtonItem *)self->_progressButtonItem setIsAccessibilityElement:1];
    [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityTraits:*MEMORY[0x1E4FB25A0] | *MEMORY[0x1E4FB25C0]];
    CGFloat v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:self selector:sel_importControllerProgressDidChange_ name:*MEMORY[0x1E4F90EF8] object:0];
  }
  double v32 = [(PUImportOneUpViewController *)self cancelBarButtonItem];
  v36[0] = v32;
  double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];

  double v34 = [(PUImportOneUpViewController *)self navigationItem];
  [v34 setLeftBarButtonItems:v33];
  double v35 = [(PUImportOneUpViewController *)self navigationTitleView];
  [v34 setTitleView:v35];

  [(PUImportOneUpViewController *)self updateToolbarItems];
  [(PUImportOneUpViewController *)self updateNavigationItemTitle];
}

- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 layoutSizeClass] == 1 && objc_msgSend(v3, "layoutOrientation") == 2;

  return v4;
}

- (void)updateNavigationItemTitle
{
  id v3 = [(PUImportOneUpViewController *)self collectionView];
  int64_t v4 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v3];

  double v5 = [(PUImportOneUpViewController *)self importController];
  id v6 = [v5 selectedItems];

  double v7 = [(PUImportOneUpViewController *)self importController];
  int v8 = [v7 isImportingAssets];

  CGFloat v9 = [(PUImportOneUpViewController *)self importController];
  int v10 = [v9 isDeletingAssets];

  double v11 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v12 = [v11 showProgressTitles];

  if (![v6 count] || ((v8 | v10) & v12 & 1) != 0)
  {
    uint64_t v13 = PLLocalizedFrameworkString();
  }
  else
  {
    uint64_t v13 = PXLocalizedSelectionMessageForAssets();
  }
  double v14 = (void *)v13;
  if (v4)
  {
    CGFloat v15 = [(PUImportOneUpViewController *)self assetAtIndexPath:v4];
    double v16 = [v15 creationDate];
    if (v16)
    {
      id v17 = [(PUImportOneUpViewController *)self dayFormatter];
      double v18 = [v17 stringFromDate:v16];

      double v19 = [(PUImportOneUpViewController *)self timeFormatter];
      double v20 = [v19 stringFromDate:v16];
    }
    else
    {
      double v20 = &stru_1F06BE7B8;
      double v18 = &stru_1F06BE7B8;
    }
    if ([(__CFString *)v18 length])
    {
      if ([(__CFString *)v20 length])
      {
        long long v22 = PULocalizedString(@"PUPHOTOBROWSER_TITLE_LONG_DATE_FORMAT");
        double v34 = v18;
        double v35 = v20;
        double v21 = PUStringWithValidatedFormat();

LABEL_16:
        goto LABEL_17;
      }
      long long v23 = v18;
    }
    else
    {
      long long v23 = v20;
    }
    double v21 = v23;
    goto LABEL_16;
  }
  double v21 = 0;
LABEL_17:
  CGFloat v24 = [(PUImportOneUpViewController *)self navigationTitleView];
  double v25 = [(PUImportOneUpViewController *)self px_extendedTraitCollection];
  int64_t v26 = [(PUImportOneUpViewController *)self _titleViewVerticalSizeClassForExtendedTraitCollection:v25];
  CGFloat v27 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  CGFloat v28 = (void *)MEMORY[0x1E4FB08E0];
  [v27 pointSize];
  CGFloat v29 = objc_msgSend(v28, "monospacedDigitSystemFontOfSize:weight:");
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  void v36[2] = __56__PUImportOneUpViewController_updateNavigationItemTitle__block_invoke;
  v36[3] = &unk_1E5F26410;
  id v37 = v24;
  id v38 = v14;
  id v40 = v29;
  int64_t v41 = v26;
  id v39 = v21;
  id v30 = v29;
  id v31 = v21;
  id v32 = v14;
  id v33 = v24;
  [v33 performChanges:v36];
}

uint64_t __56__PUImportOneUpViewController_updateNavigationItemTitle__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSubtitle:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setVerticalSizeClass:*(void *)(a1 + 64)];
  uint64_t v2 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [*(id *)(a1 + 32) setTitleFont:v2];

  uint64_t v3 = *(void *)(a1 + 56);
  int64_t v4 = *(void **)(a1 + 32);
  return [v4 setSubtitleFont:v3];
}

- (void)updateToolbarItems
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  int64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  double v5 = [(PUImportOneUpViewController *)self importController];
  id v6 = [v5 selectedItems];

  double v7 = [(PUImportOneUpViewController *)self importController];
  int v8 = [v7 isImportingAssets];

  if (v8)
  {
    CGFloat v9 = [(PUImportOneUpViewController *)self stopImportBarButtonItem];
    [v3 addObject:v9];
  }
  else
  {
    int v10 = [(PUImportOneUpViewController *)self importDataSource];
    uint64_t v11 = [v10 numberOfSelectableItems];

    if (!v11) {
      goto LABEL_10;
    }
    [v6 count];
    int v12 = [(PUImportOneUpViewController *)self importBarButtonItem];
    [v3 addObject:v12];

    uint64_t v13 = [(PUImportOneUpViewController *)self actionCoordinator];
    double v14 = [(PUImportOneUpViewController *)self importBarButtonItem];
    [v13 configureImportActionsForBarButtonItem:v14];

    CGFloat v9 = PLLocalizedFrameworkString();
    CGFloat v15 = [(PUImportOneUpViewController *)self deleteBarButtonItem];
    [v15 setAccessibilityLabel:v9];

    double v16 = [(PUImportOneUpViewController *)self importController];
    id v17 = [v16 importSource];
    int v18 = [v17 canDeleteContent];

    if (v18)
    {
      double v19 = [(PUImportOneUpViewController *)self traitCollection];
      uint64_t v20 = [v19 horizontalSizeClass];

      double v21 = [(PUImportOneUpViewController *)self deleteBarButtonItem];
      if (v20 == 1) {
        long long v22 = v4;
      }
      else {
        long long v22 = v3;
      }
      [v22 addObject:v21];
    }
  }

LABEL_10:
  long long v23 = [(PUImportOneUpViewController *)self importController];
  if ([v23 isImportingAssets])
  {
  }
  else
  {
    CGFloat v24 = [(PUImportOneUpViewController *)self importController];
    int v25 = [v24 isDeletingAssets];

    if (!v25) {
      goto LABEL_14;
    }
  }
  int64_t v26 = [(PUImportOneUpViewController *)self progressButtonItem];
  [v3 addObject:v26];

LABEL_14:
  CGFloat v27 = [(PUImportOneUpViewController *)self importController];
  if ([v27 hasLoadedInitialBatchOfAssets])
  {
    CGFloat v28 = [(PUImportOneUpViewController *)self importController];
    if ([v28 isLoadingInitialBatchOfAssets])
    {
      uint64_t v29 = 0;
    }
    else
    {
      id v30 = [(PUImportOneUpViewController *)self importController];
      if ([v30 isImportingAssets])
      {
        uint64_t v29 = 0;
      }
      else
      {
        id v31 = [(PUImportOneUpViewController *)self importController];
        uint64_t v29 = [v31 isDeletingAssets] ^ 1;
      }
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  id v32 = [(PUImportOneUpViewController *)self importBarButtonItem];
  [v32 setEnabled:v29];

  id v33 = [(PUImportOneUpViewController *)self deleteBarButtonItem];
  [v33 setEnabled:v29];

  double v34 = [(PUImportOneUpViewController *)self navigationItem];
  [v34 setRightBarButtonItems:v3];

  double v35 = [(UIViewController *)self pu_toolbarViewModel];
  double v36 = [v35 toolbarItems];
  if ([v4 count])
  {
    id v37 = [(PUImportOneUpViewController *)self bottomSpacerBarButtonItem];

    if (!v37)
    {
      id v38 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      bottomSpacerBarButtonItem = self->_bottomSpacerBarButtonItem;
      self->_bottomSpacerBarButtonItem = v38;
    }
    id v40 = [(PUImportOneUpViewController *)self bottomSpacerBarButtonItem];
    [v4 insertObject:v40 atIndex:0];
  }
  if (([v36 isEqualToArray:v4] & 1) == 0)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __49__PUImportOneUpViewController_updateToolbarItems__block_invoke;
    v41[3] = &unk_1E5F2ECC8;
    id v42 = v35;
    id v43 = v4;
    [v42 performChanges:v41];
  }
}

uint64_t __49__PUImportOneUpViewController_updateToolbarItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToolbarItems:*(void *)(a1 + 40)];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v29.receiver = self;
  v29.super_class = (Class)PUImportOneUpViewController;
  id v7 = a4;
  -[PUImportOneUpViewController viewWillTransitionToSize:withTransitionCoordinator:](&v29, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  int v8 = [(PUImportOneUpViewController *)self collectionView];
  CGFloat v9 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v8];

  inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
  self->_inFlightReferenceIndexPath = v9;
  uint64_t v11 = v9;

  int v12 = [(PUImportOneUpViewController *)self collectionViewLayout];
  objc_msgSend(v12, "setLayoutReferenceSize:", width, height);

  [(PUImportOneUpViewController *)self updateCollectionViewLayoutInsets];
  uint64_t v13 = [(PUImportOneUpViewController *)self collectionView];
  [v13 _contentScrollInset];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  long long v22 = [(PUImportOneUpViewController *)self collectionView];
  [v22 contentSize];
  double v24 = v21 + v23;

  int v25 = [(PUImportOneUpViewController *)self collectionView];
  objc_msgSend(v25, "_setContentScrollInset:", v15, v17, v19, v24);

  int64_t v26 = [(PUImportOneUpViewController *)self inFlightReferenceIndexPath];
  [(PUImportOneUpViewController *)self pageToIndexPath:v26 animated:0];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v28[3] = &unk_1E5F2B9D0;
  v28[4] = self;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v27[3] = &unk_1E5F25DA8;
  v27[4] = self;
  *(double *)&v27[5] = v15;
  *(double *)&v27[6] = v17;
  *(double *)&v27[7] = v19;
  *(double *)&v27[8] = v21;
  [v7 animateAlongsideTransition:v28 completion:v27];
}

void __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) inFlightReferenceIndexPath];

  if (v3)
  {
    int64_t v4 = *(void **)(a1 + 32);
    double v5 = [v4 inFlightReferenceIndexPath];
    objc_msgSend(v4, "pageToIndexPath:animated:", v5, objc_msgSend(v8, "isAnimated"));

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 1176);
    *(void *)(v6 + 1176) = 0;
  }
}

void __82__PUImportOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  uint64_t v6 = [*(id *)(a1 + 32) collectionView];
  objc_msgSend(v6, "_setContentScrollInset:", v2, v3, v4, v5);

  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v9 = [*(id *)(a1 + 32) collectionViewLayout];
  objc_msgSend(v9, "setLayoutReferenceSize:", v7, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v4 traitCollectionDidChange:a3];
  [(PUImportOneUpViewController *)self updateToolbarItems];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v4 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (BOOL)pu_wantsToolbarVisible
{
  double v3 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v4 = [v3 hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem];

  return !v4 || [(PUImportOneUpViewController *)self presentationFilter] != 3;
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v11 viewWillLayoutSubviews];
  [(PUImportOneUpViewController *)self updateCollectionViewLayoutInsets];
  if (![(PUImportOneUpViewController *)self hasPerformedNavigationToStartingAsset])
  {
    [(PUImportOneUpViewController *)self setHasPerformedNavigationToStartingAsset:1];
    long long v9 = 0u;
    long long v10 = 0u;
    double v3 = [(PUImportOneUpViewController *)self importDataSource];
    int v4 = [(PUImportOneUpViewController *)self startingAssetReference];
    double v5 = [v4 asset];
    if (v3)
    {
      [v3 itemIndexPathForItem:v5];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }

    if ((void)v9 != *MEMORY[0x1E4F91310])
    {
      uint64_t v6 = PXIndexPathFromSimpleIndexPath();
      double v7 = [(PUImportOneUpViewController *)self reviewScrubber];
      [v7 setSelectedIndexPath:v6];

      [(PUImportOneUpViewController *)self pageToIndexPath:v6 animated:0];
      double v8 = [(PUImportOneUpViewController *)self reviewScrubber];
      [v8 reloadData];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v4 viewWillDisappear:a3];
  [(PUImportOneUpViewController *)self _cancelAlerts];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUImportOneUpViewController;
  -[PUImportOneUpViewController viewWillAppear:](&v11, sel_viewWillAppear_);
  double v5 = [(PUImportOneUpViewController *)self navigationController];
  uint64_t v6 = objc_msgSend(v5, "pu_modalTransition");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v6 hasInstalledDismissGestureRecognizers] & 1) == 0)
  {
    double v7 = [(PUImportOneUpViewController *)self transitionCoordinator];
    double v8 = [v7 containerView];

    if (!v8)
    {
      long long v9 = [(PUImportOneUpViewController *)self navigationController];
      double v8 = [v9 view];
    }
    [v6 installDismissGestureRecognizersOnView:v8];
  }
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
  [(PUImportOneUpViewController *)self beginCenterPrioritizedThumbnailLoading];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PUImportOneUpViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__PUImportOneUpViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadCenterPrioritizedVisibleThumbnails];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v13 viewDidLoad];
  [(PUImportOneUpViewController *)self updateMainViewAnimated:0];
  BOOL v3 = [(PUImportOneUpViewController *)self reviewScrubber];
  [v3 setScrubberCellClass:objc_opt_class()];
  [v3 setDataSource:self];
  [v3 setScrubberDelegate:self];
  objc_super v4 = [(UIViewController *)self pu_toolbarViewModel];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  long long v9 = __42__PUImportOneUpViewController_viewDidLoad__block_invoke;
  long long v10 = &unk_1E5F2ECC8;
  id v11 = v4;
  id v12 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 performChanges:&v7];
  -[PUImportOneUpViewController _updateBarItemsAnimated:](self, "_updateBarItemsAnimated:", 0, v7, v8, v9, v10);
}

uint64_t __42__PUImportOneUpViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessoryView:*(void *)(a1 + 40)];
}

- (void)updateVisibleCellBadgesAndSelectability
{
  BOOL v3 = [(PUImportOneUpViewController *)self collectionView];
  objc_super v4 = [v3 indexPathsForVisibleSupplementaryElementsOfKind:@"PUSelectableAssetBadgeKind"];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke;
  v5[3] = &unk_1E5F25D80;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 importDataSource];
  [v5 identifier];
  PXSimpleIndexPathFromIndexPath();

  id v6 = [*(id *)(a1 + 32) importDataSource];
  memset(v13, 0, sizeof(v13));
  uint64_t v7 = [v6 assetAtItemIndexPath:v13];

  uint64_t v8 = [*(id *)(a1 + 32) collectionView];
  long long v9 = [v8 supplementaryViewForElementKind:@"PUSelectableAssetBadgeKind" atIndexPath:v4];

  if (v7 && v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke_2;
    v10[3] = &unk_1E5F2ECC8;
    id v11 = v9;
    id v12 = v7;
    [v11 performBadgeUpdates:v10];
  }
}

uint64_t __70__PUImportOneUpViewController_updateVisibleCellBadgesAndSelectability__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", objc_msgSend(*(id *)(a1 + 40), "badgeType"));
  uint64_t v2 = [*(id *)(a1 + 40) isSelectable];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setSelectable:v2];
}

- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  objc_super v13 = [(PUImportOneUpViewController *)self collectionView];
  double v14 = [(PUImportOneUpViewController *)self indexPathOfCenterVisibleItemInCollectionView:v13];

  if (v14)
  {
    double v15 = [(PUImportOneUpViewController *)self importAssetAtIndexPath:v14];
  }
  else
  {
    double v15 = 0;
  }
  if ([(PUImportOneUpViewController *)self isViewLoaded])
  {
    double v16 = [(PUImportOneUpViewController *)self importDataSourceManager];
    double v17 = [v16 changeHistory];

    double v18 = [(PUImportOneUpViewController *)self changeDetailsHelper];

    if (!v18)
    {
      unsigned int v23 = v7;
      objc_initWeak(&location, self);
      double v19 = [PUImportChangeDetailsCollectionViewHelper alloc];
      double v20 = [(PUImportOneUpViewController *)self collectionView];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke;
      v27[3] = &unk_1E5F26488;
      objc_copyWeak(&v28, &location);
      double v21 = [(PUImportChangeDetailsCollectionViewHelper *)v19 initWithCollectionView:v20 dataSourceSettingHandler:v27];
      [(PUImportOneUpViewController *)self setChangeDetailsHelper:v21];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      uint64_t v7 = v23;
    }
    long long v22 = [(PUImportOneUpViewController *)self changeDetailsHelper];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2;
    v24[3] = &unk_1E5F25D58;
    v24[4] = self;
    id v25 = v15;
    int64_t v26 = v12;
    [v22 transitionFromDataSource:v10 toDataSource:v11 changeHistory:v17 animated:v7 completionHandler:v24];
  }
  else
  {
    [(PUImportOneUpViewController *)self setImportDataSource:v11];
    if (v12) {
      v12[2](v12);
    }
  }
}

void __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setImportDataSource:v3];
}

uint64_t __96__PUImportOneUpViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) reviewScrubber];
  [v4 reloadData];

  [*(id *)(a1 + 32) updateVisibleCellBadgesAndSelectability];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [*(id *)(a1 + 32) pageToItemOrNearestIndexPath:v5 animated:a2];
  }
  [*(id *)(a1 + 32) _updateBarItemsAnimated:1];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)handleNewDataSource:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PUImportOneUpViewController *)self importDataSource];
  uint64_t v6 = [v5 identifier];
  if (v6 != [v4 identifier])
  {
    if ([(PUImportOneUpViewController *)self performingDataSourceChange])
    {
      uint64_t v7 = _importOneUpLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = [v4 identifier];
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Collection view is performing changes, making pending data source: %ti", buf, 0xCu);
      }

      [(PUImportOneUpViewController *)self setPendingDataSource:v4];
    }
    else
    {
      if ([(PUImportOneUpViewController *)self px_isVisible])
      {
        uint64_t v8 = [(PUImportOneUpViewController *)self importController];
        char v9 = [v8 isLoadingInitialBatchOfAssets];
        if (v4) {
          BOOL v10 = v5 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        unsigned int v11 = !v10;
        if (v9) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = v11;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      [(PUImportOneUpViewController *)self setPerformingDataSourceChange:1];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __51__PUImportOneUpViewController_handleNewDataSource___block_invoke;
      v13[3] = &unk_1E5F2ED10;
      _OWORD v13[4] = self;
      [(PUImportOneUpViewController *)self transitionFromDataSource:v5 toDataSource:v4 animated:v12 completionHandler:v13];
    }
  }
}

void __51__PUImportOneUpViewController_handleNewDataSource___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PUImportOneUpViewController_handleNewDataSource___block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__PUImportOneUpViewController_handleNewDataSource___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _importOneUpLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) importDataSource];
    int v8 = 134217984;
    uint64_t v9 = [v3 identifier];
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Finished transitioning to: %lu", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setPerformingDataSourceChange:0];
  id v4 = [*(id *)(a1 + 32) pendingDataSource];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) pendingDataSource];
    [*(id *)(a1 + 32) setPendingDataSource:0];
    uint64_t v6 = _importOneUpLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 identifier];
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Applying pending data source: %lu", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) handleNewDataSource:v5];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXImportControllerObserverContext == a5)
  {
    if ((v6 & 2) != 0 || (v6 & 4) != 0 || (v6 & 0x10) != 0) {
      [(PUImportOneUpViewController *)self updateToolbarItems];
    }
  }
  else if ((void *)PXImportAssetsDataSourceManagerObserverContext == a5)
  {
    if (v6)
    {
      uint64_t v9 = [(PUImportOneUpViewController *)self importDataSourceManager];
      uint64_t v10 = [v9 dataSource];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __60__PUImportOneUpViewController_observable_didChange_context___block_invoke;
      v13[3] = &unk_1E5F2ECC8;
      id v14 = v10;
      uint64_t v15 = self;
      id v11 = v10;
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }
  }
  else if ((v6 & 1) != 0 && (void *)PUImportSelectionManagerObserverContext == a5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PUImportOneUpViewController_observable_didChange_context___block_invoke_2;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__PUImportOneUpViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) numberOfItems];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 handleNewDataSource:v4];
  }
  else
  {
    return [v3 _dismissReviewControllerWithAsset:0];
  }
}

uint64_t __60__PUImportOneUpViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBarItemsAnimated:0];
}

- (void)setImportDataSourceManager:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (PXImportAssetsDataSourceManager *)a3;
  p_importDataSourceManager = &self->_importDataSourceManager;
  importDataSourceManager = self->_importDataSourceManager;
  if (importDataSourceManager != v5)
  {
    [(PXImportAssetsDataSourceManager *)importDataSourceManager unregisterChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext];
    objc_storeStrong((id *)&self->_importDataSourceManager, a3);
    [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager registerChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext];
    if ([(PUImportOneUpViewController *)self presentationFilter] == 1)
    {
      [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager setShowAlreadyImportedItems:1];
      id v8 = *p_importDataSourceManager;
      uint64_t v9 = 0;
    }
    else
    {
      if ([(PUImportOneUpViewController *)self presentationFilter] != 2)
      {
        if ([(PUImportOneUpViewController *)self presentationFilter] == 3)
        {
          [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager setShowAlreadyImportedItems:1];
          [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager setShowNotYetImportedItems:1];
          objc_super v13 = [(PUImportOneUpViewController *)self startingAssetReference];
          id v14 = [v13 asset];

          uint64_t v15 = [v14 uuid];
          uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
          v19[0] = v15;
          double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
          double v18 = [v16 setWithArray:v17];
          [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager setVisibleImportAssetIdentifiers:v18];
        }
        goto LABEL_7;
      }
      [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager setShowAlreadyImportedItems:0];
      id v8 = *p_importDataSourceManager;
      uint64_t v9 = 1;
    }
    [(PXImportAssetsDataSourceManager *)v8 setShowNotYetImportedItems:v9];
    [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager setVisibleImportAssetIdentifiers:0];
LABEL_7:
    uint64_t v10 = [(PUImportOneUpViewController *)self importDataSourceManager];
    [v10 updateFilteredAssetsIfNeeded];

    id v11 = [(PUImportOneUpViewController *)self importDataSourceManager];
    uint64_t v12 = [v11 dataSource];

    [(PUImportOneUpViewController *)self handleNewDataSource:v12];
  }
}

- (void)setImportController:(id)a3
{
  uint64_t v5 = (PXImportController *)a3;
  p_importController = &self->_importController;
  importController = self->_importController;
  if (importController != v5)
  {
    uint64_t v10 = v5;
    id v8 = [(PXImportController *)importController selectionManager];
    [v8 unregisterChangeObserver:self context:PUImportSelectionManagerObserverContext];

    [(PXImportController *)*p_importController unregisterChangeObserver:self context:PXImportControllerObserverContext];
    objc_storeStrong((id *)&self->_importController, a3);
    [(PXImportController *)*p_importController registerChangeObserver:self context:PXImportControllerObserverContext];
    uint64_t v9 = [(PXImportController *)*p_importController selectionManager];
    [v9 registerChangeObserver:self context:PUImportSelectionManagerObserverContext];

    uint64_t v5 = v10;
  }
}

- (void)_cancelAlerts
{
  id v3 = [(PUImportOneUpViewController *)self presentedViewController];

  if (v3)
  {
    uint64_t v4 = [(PUImportOneUpViewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    [(PUImportOneUpViewController *)self dismissViewControllerAnimated:isKindOfClass & 1 completion:0];
  }
}

- (void)dealloc
{
  id v3 = [(PUImportOneUpViewController *)self relayoutCoalescer];
  [v3 reset];

  [(PUImportOneUpViewController *)self setRelayoutCoalescer:0];
  [(PUImportOneUpViewController *)self _cancelAlerts];
  uint64_t v4 = [(PUImportOneUpViewController *)self importController];
  uint64_t v5 = [(PUImportOneUpViewController *)self importDataSourceManager];
  [v4 removeDataSourceManager:v5];

  char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  uint64_t v7 = [(PUImportOneUpViewController *)self tapGestureRecognizer];
  [v7 setDelegate:0];

  v8.receiver = self;
  v8.super_class = (Class)PUImportOneUpViewController;
  [(PUImportOneUpViewController *)&v8 dealloc];
}

- (PUImportOneUpViewController)initWithImportController:(id)a3 mediaProvider:(id)a4 startingAssetReference:(id)a5 presentationFilter:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PUImportOneUpViewController;
  objc_super v13 = [(PUImportOneUpViewController *)&v33 initWithNibName:0 bundle:0];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F902D0] sharedInstance];
    unsigned int v15 = [v14 hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem];

    if (a6 == 3) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    double v17 = [[PUImportOneUpViewControllerSpecManager alloc] initWithExtendedTraitCollection:0 options:0 style:v16];
    specManager = v13->_specManager;
    v13->_specManager = v17;

    objc_storeStrong((id *)&v13->_mediaProvider, a4);
    objc_storeStrong((id *)&v13->_startingAssetReference, a5);
    v13->_presentationFilter = a6;
    uint64_t v19 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:2];
    dayFormatter = v13->_dayFormatter;
    v13->_dayFormatter = (PLDateRangeFormatter *)v19;

    uint64_t v21 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:7];
    timeFormatter = v13->_timeFormatter;
    v13->_timeFormatter = (PLDateRangeFormatter *)v21;

    v13->_allowsSelection = 1;
    [(PUImportOneUpViewController *)v13 setImportController:v10];
    unsigned int v23 = [v10 createDataSourceManagerWithLogIdentifier:@"1up"];
    [(PUImportOneUpViewController *)v13 setImportDataSourceManager:v23];

    double v24 = [[PUImportActionCoordinator alloc] initWithViewController:v13 importController:v13->_importController loggingSource:1];
    actionCoordinator = v13->_actionCoordinator;
    v13->_actionCoordinator = v24;

    int64_t v26 = [(PUImportOneUpViewController *)v13 actionCoordinator];
    [v26 setDelegate:v13];

    CGFloat v27 = [(PUImportOneUpViewController *)v13 actionCoordinator];
    [v27 setPresentsAdditionalDeleteAllConfirmation:1];

    uint64_t v28 = [MEMORY[0x1E4F8A220] coalescerWithLabel:@"Import 1-up re-layout coalescer" target:v13 queue:MEMORY[0x1E4F14428] action:&__block_literal_global_33815];
    relayoutCoalescer = v13->_relayoutCoalescer;
    v13->_relayoutCoalescer = (PFCoalescer *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    itemsNeedingRelayout = v13->_itemsNeedingRelayout;
    v13->_itemsNeedingRelayout = (NSMutableArray *)v30;
  }
  return v13;
}

void __112__PUImportOneUpViewController_initWithImportController_mediaProvider_startingAssetReference_presentationFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 delayNextInvocationByTimeInterval:0.5];
  [v4 relayoutCollectionView];
}

@end