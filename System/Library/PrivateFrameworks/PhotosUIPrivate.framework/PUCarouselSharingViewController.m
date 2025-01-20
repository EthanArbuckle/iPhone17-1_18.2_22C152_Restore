@interface PUCarouselSharingViewController
- (BOOL)_isAnyAssetSelected;
- (BOOL)_isLoopingPlaybackAllowed;
- (BOOL)_isViewInSyncWithModel;
- (BOOL)_shouldShowAsset:(id)a3;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isItemAtIndexPathSelected:(id)a3;
- (BOOL)isReadyForInteraction;
- (BOOL)ppt_scrollToAssetAtRelativeIndex:(int64_t)a3 completion:(id)a4;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)sendAsAssetBundles;
- (BOOL)sendAsUnmodifiedOriginals;
- (CGRect)_collectionViewContentFrame;
- (CGRect)_frameAtIndexPath:(id)a3 inView:(id)a4;
- (CGRect)_previousPreheatRect;
- (CGRect)frameForBadgeOfKind:(id)a3 forItemFrame:(CGRect)a4 atIndexPath:(id)a5;
- (CGRect)oneUpAssetTransitionAssetFinalFrame:(id)a3;
- (CGSize)_sizeForItemAtIndexPath:(id)a3;
- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForBadgeViewOfKind:(id)a5 forItemAtIndexPath:(id)a6;
- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSIndexPath)_lastKnownReferenceIndexPath;
- (NSMutableArray)_livePhotoViewLoaderBlocks;
- (NSMutableArray)_photoViewLoaderBlocks;
- (NSMutableSet)_preheatedAssets;
- (NSMutableSet)analyticsEventsSent;
- (NSString)localizedSelectionTitle;
- (OS_os_log)sharingLog;
- (PHAsset)_lastKnownReferenceAsset;
- (PHAsset)currentAsset;
- (PHCachingImageManager)cachingImageManager;
- (PHFetchResult)assetCollectionsFetchResult;
- (PHFetchResult)photoCollectionsFetchResult;
- (PUAssetTransitionInfo)assetTransitionInfo;
- (PUAssetTransitionInfo)leadingAssetTransitionInfo;
- (PUAssetTransitionInfo)trailingAssetTransitionInfo;
- (PUCarouselSharingViewController)initWithPhotoCollectionsFetchResult:(id)a3 assetsFetchResultsByAssetCollection:(id)a4 selection:(id)a5;
- (PUCarouselSharingViewControllerDelegate)delegate;
- (PUPhotoSelectionManager)photoSelectionManager;
- (PUPhotosSharingCollectionViewLayout)mainCollectionViewLayout;
- (PUPhotosSharingTransitionContext)photosSharingTransitionContext;
- (PUPhotosSharingViewControllerSpec)spec;
- (PXAssetBadgeManager)_badgeManager;
- (PXPhotosDataSource)photosDataSource;
- (UICollectionView)mainCollectionView;
- (UICollectionViewLayout)_transitionLayout;
- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4;
- (double)layout:(id)a3 collectionView:(id)a4 bottomBadgeInsetforItemAtIndexPath:(id)a5;
- (id)_activityAssetItemForAsset:(id)a3 createIfNecessary:(BOOL)a4;
- (id)_assetAtIndexPath:(id)a3;
- (id)_badgeTransitionInfosForCell:(id)a3;
- (id)_firstSelectedIndexPath;
- (id)_indexPathInCollectionView:(id)a3 closestToContentOffsetX:(double)a4;
- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4;
- (id)_indexPathOfAsset:(id)a3 sectionHint:(int64_t)a4;
- (id)_indexPathOfCenterVisibleItemInCollectionView:(id)a3;
- (id)_optionViewAtIndexPath:(id)a3 forCollectionView:(id)a4;
- (id)_photoCollectionAtIndex:(int64_t)a3;
- (id)_pptOnDidEndScrollingBlock;
- (id)_selectionViewAtIndexPath:(id)a3 forCollectionView:(id)a4;
- (id)_updatedActivityAssetItemsForAssets:(id)a3;
- (id)_validIndexPathFromIndexPath:(id)a3;
- (id)adjacentVisibleAssetsTransitionInfos;
- (id)assetsInAssetCollection:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)currentActivityAssetItems;
- (id)currentIndexPath;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)referenceAssetTransitionInfo;
- (int64_t)_numberOfItemsInSection:(int64_t)a3;
- (int64_t)_numberOfSections;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)_indexForPhotoCollection:(id)a3;
- (void)_addActivityAssetItem:(id)a3;
- (void)_arrowKey:(id)a3;
- (void)_getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4;
- (void)_getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4;
- (void)_handleAnimatedImageResult:(id)a3 forCell:(id)a4 asset:(id)a5 tag:(int64_t)a6;
- (void)_handleLivePhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5;
- (void)_handleLoopingVideoRequestResult:(id)a3 forCell:(id)a4 asset:(id)a5 tag:(int64_t)a6;
- (void)_handlePhotoViewLoaderBlocks;
- (void)_handleSchedulingLivePhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5;
- (void)_handleSchedulingStillPhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5;
- (void)_handleSelectionOption:(id)a3;
- (void)_handleStillImageRequestResult:(id)a3 info:(id)a4 forCell:(id)a5 indexPath:(id)a6;
- (void)_handleStillPhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5;
- (void)_handleTapAtIndexPath:(id)a3;
- (void)_handleTapInMainCollectionView:(id)a3;
- (void)_pageToIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_playLivePhotoHintIfNeededAtIndexPath:(id)a3;
- (void)_playVitalityHintAfterViewDidAppear;
- (void)_pptSetOnDidEndScrollingBlock:(id)a3;
- (void)_processCollectionListChangeNotifications:(id)a3 singleCollectionNotifications:(id)a4 needsReloadData:(BOOL)a5;
- (void)_removeActivityAssetItem:(id)a3;
- (void)_replaceActivityAssetItem:(id)a3 withAssetItem:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_resetPreheating;
- (void)_setLastKnownReferenceAsset:(id)a3;
- (void)_setLastKnownReferenceAsset:(id)a3 indexPath:(id)a4;
- (void)_setLastKnownReferenceIndexPath:(id)a3;
- (void)_setLoopingPlaybackAllowed:(BOOL)a3;
- (void)_setMainCollectionView:(id)a3;
- (void)_setMainCollectionViewLayout:(id)a3;
- (void)_setPreheatedAssets:(id)a3;
- (void)_setPreviousPreheatRect:(CGRect)a3;
- (void)_setSelected:(BOOL)a3 atIndexPath:(id)a4 animated:(BOOL)a5;
- (void)_setTransitionLayout:(id)a3;
- (void)_setViewInSyncWithModel:(BOOL)a3;
- (void)_updateAdditionalContentForAsset:(id)a3 cell:(id)a4;
- (void)_updateAdditionalContentForVisibleCells;
- (void)_updateAssetTransitionInfo:(id)a3;
- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)_updateCellAtIndexPath:(id)a3 withTransitionInfo:(id)a4;
- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3;
- (void)_updateLastKnownReferenceIndexPath;
- (void)_updateMainViewAnimated:(BOOL)a3;
- (void)_updateOptionView:(id)a3 atIndexPath:(id)a4;
- (void)_updatePhotoForAsset:(id)a3 cell:(id)a4 atIndexPath:(id)a5;
- (void)_updatePreheatedAssets;
- (void)_updateVisibleCellBadges;
- (void)_updateVisibleCells;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)dealloc;
- (void)deselectItemAtIndexPath:(id)a3;
- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)photoViewContentHelper:(id)a3 livePhotoWillBeginPlaybackWithStyle:(int64_t)a4;
- (void)ppt_faultInScollViewContentSize;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectItemAtIndexPath:(id)a3;
- (void)setAnalyticsEventsSent:(id)a3;
- (void)setAssetTransitionInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideCellForCurrentReferenceAsset:(BOOL)a3;
- (void)setLeadingAssetTransitionInfo:(id)a3;
- (void)setOneUpPhotosSharingTransitionContext:(id)a3;
- (void)setOneUpPhotosSharingTransitionInfo:(id)a3;
- (void)setPhotoSelectionManager:(id)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setPhotosSharingTransitionContext:(id)a3;
- (void)setPhotosSharingTransitionLayout:(id)a3 animated:(BOOL)a4;
- (void)setReadyForInteraction:(BOOL)a3;
- (void)setSendAsAssetBundles:(BOOL)a3;
- (void)setSendAsUnmodifiedOriginals:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setTrailingAssetTransitionInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUCarouselSharingViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventsSent, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->__livePhotoViewLoaderBlocks, 0);
  objc_storeStrong((id *)&self->__photoViewLoaderBlocks, 0);
  objc_storeStrong(&self->__pptOnDidEndScrollingBlock, 0);
  objc_storeStrong((id *)&self->__badgeManager, 0);
  objc_storeStrong((id *)&self->__lastKnownReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->__lastKnownReferenceAsset, 0);
  objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_assetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_photosSharingTransitionContext, 0);
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_storeStrong((id *)&self->__preheatedAssets, 0);
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_mainCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_mainCollectionView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_photoCollectionsFetchResult, 0);
  objc_storeStrong((id *)&self->_inFlightReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indexPathsByOptionView, 0);
  objc_storeStrong((id *)&self->_assetItemsByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_resultsForAssetCollection, 0);
  objc_storeStrong((id *)&self->_speedometer, 0);
}

- (void)setAnalyticsEventsSent:(id)a3
{
}

- (void)setPhotosDataSource:(id)a3
{
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (NSMutableArray)_livePhotoViewLoaderBlocks
{
  return self->__livePhotoViewLoaderBlocks;
}

- (NSMutableArray)_photoViewLoaderBlocks
{
  return self->__photoViewLoaderBlocks;
}

- (void)_pptSetOnDidEndScrollingBlock:(id)a3
{
}

- (id)_pptOnDidEndScrollingBlock
{
  return self->__pptOnDidEndScrollingBlock;
}

- (PXAssetBadgeManager)_badgeManager
{
  return self->__badgeManager;
}

- (BOOL)_isLoopingPlaybackAllowed
{
  return self->__loopingPlaybackAllowed;
}

- (NSIndexPath)_lastKnownReferenceIndexPath
{
  return self->__lastKnownReferenceIndexPath;
}

- (void)_setLastKnownReferenceAsset:(id)a3
{
}

- (PHAsset)_lastKnownReferenceAsset
{
  return self->__lastKnownReferenceAsset;
}

- (PUAssetTransitionInfo)trailingAssetTransitionInfo
{
  return self->_trailingAssetTransitionInfo;
}

- (PUAssetTransitionInfo)leadingAssetTransitionInfo
{
  return self->_leadingAssetTransitionInfo;
}

- (void)setAssetTransitionInfo:(id)a3
{
}

- (PUAssetTransitionInfo)assetTransitionInfo
{
  return self->_assetTransitionInfo;
}

- (PUPhotosSharingTransitionContext)photosSharingTransitionContext
{
  return self->_photosSharingTransitionContext;
}

- (void)_setTransitionLayout:(id)a3
{
}

- (UICollectionViewLayout)_transitionLayout
{
  return self->__transitionLayout;
}

- (void)_setPreheatedAssets:(id)a3
{
}

- (NSMutableSet)_preheatedAssets
{
  return self->__preheatedAssets;
}

- (void)_setPreviousPreheatRect:(CGRect)a3
{
  self->__previousPreheatRect = a3;
}

- (CGRect)_previousPreheatRect
{
  double x = self->__previousPreheatRect.origin.x;
  double y = self->__previousPreheatRect.origin.y;
  double width = self->__previousPreheatRect.size.width;
  double height = self->__previousPreheatRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (void)_setViewInSyncWithModel:(BOOL)a3
{
  self->__viewInSyncWithModel = a3;
}

- (BOOL)_isViewInSyncWithModel
{
  return self->__viewInSyncWithModel;
}

- (void)_setMainCollectionViewLayout:(id)a3
{
}

- (PUPhotosSharingCollectionViewLayout)mainCollectionViewLayout
{
  return self->_mainCollectionViewLayout;
}

- (void)_setMainCollectionView:(id)a3
{
}

- (UICollectionView)mainCollectionView
{
  return self->_mainCollectionView;
}

- (void)setSpec:(id)a3
{
}

- (PUPhotosSharingViewControllerSpec)spec
{
  return self->_spec;
}

- (void)setSendAsUnmodifiedOriginals:(BOOL)a3
{
  self->_sendAsUnmodifiedOriginals = a3;
}

- (BOOL)sendAsUnmodifiedOriginals
{
  return self->_sendAsUnmodifiedOriginals;
}

- (BOOL)sendAsAssetBundles
{
  return self->_sendAsAssetBundles;
}

- (BOOL)isReadyForInteraction
{
  return self->_readyForInteraction;
}

- (void)setDelegate:(id)a3
{
}

- (PUCarouselSharingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCarouselSharingViewControllerDelegate *)WeakRetained;
}

- (void)setPhotoSelectionManager:(id)a3
{
}

- (PUPhotoSelectionManager)photoSelectionManager
{
  return self->_photoSelectionManager;
}

- (PHFetchResult)photoCollectionsFetchResult
{
  return self->_photoCollectionsFetchResult;
}

- (OS_os_log)sharingLog
{
  if (sharingLog_onceToken != -1) {
    dispatch_once(&sharingLog_onceToken, &__block_literal_global_71835);
  }
  v2 = (void *)sharingLog_sharingLog;
  return (OS_os_log *)v2;
}

void __45__PUCarouselSharingViewController_sharingLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "PUPhotosSharingViewController");
  v1 = (void *)sharingLog_sharingLog;
  sharingLog_sharingLog = (uint64_t)v0;
}

- (void)photoViewContentHelper:(id)a3 livePhotoWillBeginPlaybackWithStyle:(int64_t)a4
{
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  v6 = [(PUCarouselSharingViewController *)self view];
  [v6 layoutIfNeeded];

  v7 = [(PUCarouselSharingViewController *)self mainCollectionView];
  v8 = [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:v7];
  v9 = [v7 cellForItemAtIndexPath:v8];
  v10 = [v9 photoView];
  v11 = [v10 contentHelper];
  v12 = [v11 photoImage];

  v13 = [(PUCarouselSharingViewController *)self view];
  [(PUCarouselSharingViewController *)self _frameAtIndexPath:v8 inView:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v15, v17, v19, v21);
  [v22 setImage:v12];
  [v22 setClipsToBounds:1];
  [v22 setContentMode:2];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __95__PUCarouselSharingViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke;
  v29[3] = &unk_1E5F2D358;
  id v23 = v12;
  id v30 = v23;
  v31 = self;
  id v24 = v8;
  id v32 = v24;
  v25 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v29];
  v26 = [(PUCarouselSharingViewController *)self view];
  v27 = +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:0 fromView:v26 snapshotView:v22 transitionInfo:v25];

  v28 = [v27 oneUpTransitionContextWithContextShouldHideBackground:1];

  if (v5) {
    v5[2](v5, v28);
  }
}

void __95__PUCarouselSharingViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImage:v3];
  id v5 = [*(id *)(a1 + 40) _assetAtIndexPath:*(void *)(a1 + 48)];
  [v4 setAsset:v5];
}

- (id)_badgeTransitionInfosForCell:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v42 = [v4 array];
  v6 = [(PUCarouselSharingViewController *)self mainCollectionView];
  v41 = v5;
  v7 = [v6 indexPathForCell:v5];
  v8 = [(PUCarouselSharingViewController *)self spec];
  [v8 selectionBadgeOffset];
  double v10 = v9;
  double v12 = v11;

  v13 = [v6 collectionViewLayout];
  double v14 = [v13 layoutAttributesForSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" atIndexPath:v7];

  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v43 = v14;
  [v14 frame];
  double v19 = -[PUPhotosSharingOptionView initWithFrame:]([PUPhotosSharingOptionView alloc], "initWithFrame:", v15, v16, v17, v18);
  [(PUCarouselSharingViewController *)self _updateOptionView:v19 atIndexPath:v7];
  [(PUPhotosSharingOptionView *)v19 layoutSubviews];
  double v20 = objc_alloc_init(PUBadgeTransitionInfo);
  [(PUBadgeTransitionInfo *)v20 setSnapshotView:v19];
  double v21 = [(PUCarouselSharingViewController *)self spec];
  -[PUBadgeTransitionInfo setBadgesCorner:](v20, "setBadgesCorner:", [v21 optionBadgeCorner]);

  -[PUBadgeTransitionInfo setBadgesOffset:](v20, "setBadgesOffset:", v10, v12);
  [v14 frame];
  objc_msgSend(v5, "convertRect:fromView:", v6);
  -[PUBadgeTransitionInfo setFrame:](v20, "setFrame:");
  [v42 addObject:v20];
  v22 = [v6 collectionViewLayout];
  id v23 = [v22 layoutAttributesForSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" atIndexPath:v7];

  [v23 frame];
  v26 = -[PUPhotosSharingSelectionView initWithFrame:]([PUPhotosSharingSelectionView alloc], "initWithFrame:", v15, v16, v24, v25);
  v27 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v7 section]);
  v28 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v29 = objc_msgSend(v28, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v7, "item"), v27);

  [(PUPhotosSharingSelectionView *)v26 setSelected:v29];
  id v30 = objc_alloc_init(PUBadgeTransitionInfo);
  [(PUBadgeTransitionInfo *)v30 setSnapshotView:v26];
  v31 = [(PUCarouselSharingViewController *)self spec];
  -[PUBadgeTransitionInfo setBadgesCorner:](v30, "setBadgesCorner:", [v31 selectionBadgeCorner]);

  -[PUBadgeTransitionInfo setBadgesOffset:](v30, "setBadgesOffset:", v10, v12);
  [v23 frame];
  objc_msgSend(v41, "convertRect:fromView:", v6);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  -[PUBadgeTransitionInfo setFrame:](v30, "setFrame:", v33, v35, v37, v39);
  [v42 addObject:v30];

  return v42;
}

- (id)adjacentVisibleAssetsTransitionInfos
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUCarouselSharingViewController *)self view];
  [v3 layoutIfNeeded];

  double v36 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v5 = [v4 visibleCells];
  [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:v4];
  double v33 = v35 = v4;
  double v38 = objc_msgSend(v4, "cellForItemAtIndexPath:");
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v50 != v37) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (v7 != v38)
        {
          v8 = [*(id *)(*((void *)&v49 + 1) + 8 * i) photoView];
          double v9 = [v8 contentHelper];
          double v10 = [v9 photoImage];
          double v11 = v10;
          if (v10)
          {
            id v12 = v10;
          }
          else
          {
            id v12 = [v9 placeHolderImage];
          }
          v13 = v12;

          double v14 = [v35 indexPathForCell:v7];
          double v15 = [(PUCarouselSharingViewController *)self view];
          [(PUCarouselSharingViewController *)self _frameAtIndexPath:v14 inView:v15];
          uint64_t v17 = v16;
          uint64_t v19 = v18;
          uint64_t v21 = v20;
          uint64_t v23 = v22;

          double v24 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v14];
          double v25 = [(PUCarouselSharingViewController *)self _badgeTransitionInfosForCell:v7];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __71__PUCarouselSharingViewController_adjacentVisibleAssetsTransitionInfos__block_invoke;
          v40[3] = &unk_1E5F2AFA0;
          uint64_t v45 = v17;
          uint64_t v46 = v19;
          uint64_t v47 = v21;
          uint64_t v48 = v23;
          id v41 = v13;
          id v42 = v8;
          id v43 = v25;
          id v44 = v24;
          id v26 = v24;
          id v27 = v25;
          id v28 = v8;
          id v29 = v13;
          id v30 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v40];
          [v36 addObject:v30];
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v39);
  }

  v31 = (void *)[v36 copy];
  return v31;
}

void __71__PUCarouselSharingViewController_adjacentVisibleAssetsTransitionInfos__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 setImage:v3];
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  id v4 = [*(id *)(a1 + 40) contentHelper];
  [v4 cornerRadius];
  objc_msgSend(v6, "setCornerRadius:");

  [v6 setBadgeTransitionInfos:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) contentHelper];
  [v6 setContentHelper:v5];

  [v6 setAsset:*(void *)(a1 + 56)];
}

- (id)referenceAssetTransitionInfo
{
  uint64_t v3 = [(PUCarouselSharingViewController *)self view];
  [v3 layoutIfNeeded];

  id v4 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v5 = [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:v4];
  id v6 = [v4 cellForItemAtIndexPath:v5];
  v7 = [v6 photoView];
  v8 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v5];
  double v9 = [v7 contentHelper];
  double v10 = [v9 photoImage];

  double v11 = [(PUCarouselSharingViewController *)self view];
  [(PUCarouselSharingViewController *)self _frameAtIndexPath:v5 inView:v11];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  uint64_t v20 = [(PUCarouselSharingViewController *)self _badgeTransitionInfosForCell:v6];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__PUCarouselSharingViewController_referenceAssetTransitionInfo__block_invoke;
  v27[3] = &unk_1E5F2AFA0;
  uint64_t v32 = v13;
  uint64_t v33 = v15;
  uint64_t v34 = v17;
  uint64_t v35 = v19;
  id v28 = v10;
  id v29 = v7;
  id v30 = v20;
  id v31 = v8;
  id v21 = v8;
  id v22 = v20;
  id v23 = v7;
  id v24 = v10;
  double v25 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v27];

  return v25;
}

void __63__PUCarouselSharingViewController_referenceAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 setImage:v3];
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  id v4 = [*(id *)(a1 + 40) contentHelper];
  [v4 cornerRadius];
  objc_msgSend(v6, "setCornerRadius:");

  [v6 setBadgeTransitionInfos:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) contentHelper];
  [v6 setContentHelper:v5];

  [v6 setAsset:*(void *)(a1 + 56)];
}

- (CGRect)oneUpAssetTransitionAssetFinalFrame:(id)a3
{
  id v4 = [(PUCarouselSharingViewController *)self view];
  [v4 layoutIfNeeded];

  id v5 = [(PUCarouselSharingViewController *)self currentIndexPath];
  id v6 = [(PUCarouselSharingViewController *)self view];
  [(PUCarouselSharingViewController *)self _frameAtIndexPath:v5 inView:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_frameAtIndexPath:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PUCarouselSharingViewController *)self mainCollectionViewLayout];
  double v9 = [v8 layoutAttributesForItemAtIndexPath:v7];

  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(PUCarouselSharingViewController *)self mainCollectionView];
  objc_msgSend(v6, "convertRect:fromView:", v18, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5
{
  if (!self->_inFlightRotation)
  {
    id v7 = [(PUCarouselSharingViewController *)self cachingImageManager];
    [v7 setAllowsCachingHighQualityImages:a4 < 1];
  }
  -[PUCarouselSharingViewController _setLoopingPlaybackAllowed:](self, "_setLoopingPlaybackAllowed:", a4 < 3, a4, a5);
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  id v5 = [(PUCarouselSharingViewController *)self presentedViewController];
  if (!v5) {
    a3 = 1;
  }

  if (!a3) {
    NSLog(&cfstr_DismissCancell.isa, self);
  }
  return a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(PUCarouselSharingViewController *)self mainCollectionView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(PUCarouselSharingViewController *)self mainCollectionView];
  double v12 = -[PUCarouselSharingViewController _indexPathInCollectionView:closestToPoint:](self, "_indexPathInCollectionView:closestToPoint:", v11, v8, v10);

  double v13 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v12 section]);
  double v14 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v13];
  double v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v12, "item"));
  if ([v15 canPlayPhotoIris])
  {
    double v16 = [(PUCarouselSharingViewController *)self mainCollectionView];
    double v17 = [v16 _visibleSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" atIndexPath:v12];
  }
  else
  {
    double v17 = 0;
  }
  char v18 = objc_msgSend(v17, "pointInside:withEvent:", 0, v8, v10) ^ 1;

  return v18;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  double v7 = (UITapGestureRecognizer *)a3;
  double v8 = [(PUCarouselSharingViewController *)self mainCollectionView];
  tapGestureRecognizer = self->_tapGestureRecognizer;

  if (tapGestureRecognizer == v7)
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

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = [(PUCarouselSharingViewController *)self _pptOnDidEndScrollingBlock];
  if (v4)
  {
    [(PUCarouselSharingViewController *)self _pptSetOnDidEndScrollingBlock:0];
    v4[2]();
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [v8 contentOffset];
  double v10 = v9;
  double v11 = a5->x;
  double y = a5->y;
  [v8 bounds];
  double width = v50.size.width;
  double height = v50.size.height;
  v50.origin.double x = v11;
  v50.origin.double y = y;
  double MidX = CGRectGetMidX(v50);
  double v16 = [(PUCarouselSharingViewController *)self mainCollectionViewLayout];
  double v17 = objc_msgSend(v16, "layoutAttributesForItemsInRect:", v11, y, width, height);

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
  double v20 = v18;
  if (!v19) {
    goto LABEL_23;
  }
  uint64_t v21 = v19;
  id v41 = a5;
  uint64_t v22 = *(void *)v43;
  double v23 = 1.79769313e308;
  double v24 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v43 != v22) {
        objc_enumerationMutation(v18);
      }
      double v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      double v27 = objc_msgSend(v26, "indexPath", v41);
      double v28 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v27];
      if ([(PUCarouselSharingViewController *)self _shouldShowAsset:v28])
      {
        [(PUCarouselSharingViewController *)self _horizontalOffsetInCollectionView:v8 forCenteringOnItemAtIndexPath:v27];
        double v30 = v29;
        BOOL v31 = v29 > v10 && x > 0.0;
        BOOL v32 = v29 < v10 && x < 0.0;
        if (x == 0.0 || v31 || v32)
        {
          [v26 center];
          double v34 = vabdd_f64(v33, MidX);
          if (v34 < v23)
          {
            double v23 = v34;
            double v24 = v30;
          }
        }
      }
    }
    uint64_t v21 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
  }
  while (v21);

  if (v24 != 1.79769313e308)
  {
    v41->double x = v24;
    v41->double y = 0.0;
    uint64_t v35 = [(PUCarouselSharingViewController *)self analyticsEventsSent];
    char v36 = [v35 containsObject:@"com.apple.photos.CPAnalytics.shareSheetCarouselScrolled"];

    if ((v36 & 1) == 0)
    {
      uint64_t v37 = (void *)MEMORY[0x1E4F56658];
      uint64_t v46 = *MEMORY[0x1E4F56560];
      double v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      uint64_t v47 = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      [v37 sendEvent:@"com.apple.photos.CPAnalytics.shareSheetCarouselScrolled" withPayload:v40];

      double v20 = [(PUCarouselSharingViewController *)self analyticsEventsSent];
      [v20 addObject:@"com.apple.photos.CPAnalytics.shareSheetCarouselScrolled"];
LABEL_23:
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  [(PUScrollViewSpeedometer *)self->_speedometer scrollViewDidScroll:a3];
  [(PUCarouselSharingViewController *)self _updatePreheatedAssets];
  id v4 = [(PUCarouselSharingViewController *)self photosSharingTransitionContext];

  if (!v4)
  {
    id v5 = [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:self->_mainCollectionView];
    [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:0 indexPath:v5];
  }
}

- (double)layout:(id)a3 collectionView:(id)a4 bottomBadgeInsetforItemAtIndexPath:(id)a5
{
  id v5 = -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", a5, a4);
  if ([v5 playbackStyle] == 4
    || (double v6 = 0.0, [v5 playbackStyle] == 5)
    && ([MEMORY[0x1E4F8FFF0] sharedInstance],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 showLoopBadges],
        v7,
        v8))
  {
    double v6 = 24.0;
  }

  return v6;
}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForBadgeViewOfKind:(id)a5 forItemAtIndexPath:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  if ([v8 isEqualToString:@"PUPhotosSharingSelectionBadgeKind"])
  {
    double v10 = [(PUCarouselSharingViewController *)self spec];
    [v10 selectionBadgeSize];
    double v12 = v11;
    double v14 = v13;
LABEL_7:

    goto LABEL_8;
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([v8 isEqualToString:@"PUPhotosSharingOptionBadgeKind"])
  {
    double v10 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v9];
    double v15 = +[PURootSettings sharedInstance];
    int v16 = [v15 irisUIEnabled];

    if (v16 && [v10 canPlayPhotoIris])
    {
      double v17 = [(PUCarouselSharingViewController *)self spec];
      [v17 optionBadgeSize];
      double v12 = v18;
      double v14 = v19;
    }
    goto LABEL_7;
  }
LABEL_8:

  double v20 = v12;
  double v21 = v14;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  -[PUCarouselSharingViewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", a5, a4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v8 = a4;
  if ([a5 isEqualToString:@"PUPhotosSharingOptionBadgeKind"]) {
    [(NSMapTable *)self->_indexPathsByOptionView removeObjectForKey:v8];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v13 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v7 = v13;
  if (isKindOfClass)
  {
    id v8 = v13;
    uint64_t v9 = [v8 currentImageRequestID];
    if (v9)
    {
      double v10 = [(PUCarouselSharingViewController *)self cachingImageManager];
      [v10 cancelImageRequest:v9];

      [v8 setCurrentImageRequestID:0];
    }
    double v11 = [v8 photoView];
    double v12 = [v11 contentHelper];

    [v12 setLivePhoto:0];
    [v12 setLoopingVideoAsset:0];
    [v12 setAnimatedImage:0];
    [v12 setLoopingPlaybackAllowed:0];

    double v7 = v13;
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 isEqualToString:@"PUPhotosSharingSelectionBadgeKind"])
  {
    uint64_t v12 = [(PUCarouselSharingViewController *)self _selectionViewAtIndexPath:v11 forCollectionView:v9];
  }
  else
  {
    if (![v10 isEqualToString:@"PUPhotosSharingOptionBadgeKind"])
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PUCarouselSharingViewController.m" lineNumber:1740 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v12 = [(PUCarouselSharingViewController *)self _optionViewAtIndexPath:v11 forCollectionView:v9];
  }
  id v13 = (void *)v12;

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"PUPhotosSharingCellIdentifier" forIndexPath:v6];
  [(PUCarouselSharingViewController *)self _updateCell:v7 forItemAtIndexPath:v6];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PUCarouselSharingViewController *)self _numberOfItemsInSection:a4];
}

- (void)setHideCellForCurrentReferenceAsset:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(PUCarouselSharingViewController *)self mainCollectionView];
  double v5 = [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:v9];
  id v6 = [v9 cellForItemAtIndexPath:v5];
  double v7 = [v9 _visibleSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" atIndexPath:v5];
  id v8 = [v9 _visibleSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" atIndexPath:v5];
  [v6 setHidden:v3];
  [v7 setHidden:v3];
  [v8 setHidden:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v9 = [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:v8];

  inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
  self->_inFlightReferenceIndexPath = v9;
  id v11 = v9;

  self->_inFlightRotation = 1;
  v13[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E5F2B9D0;
  v14[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v13[3] = &unk_1E5F2B9D0;
  [v7 animateAlongsideTransition:v14 completion:v13];
  v12.receiver = self;
  v12.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void *__86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v3 = [v2 isSuspended];

  [*(id *)(a1 + 32) _updateMainViewAnimated:0];
  CGSize result = *(void **)(a1 + 32);
  if (result[127])
  {
    double v5 = [result mainCollectionView];
    [v5 layoutIfNeeded];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = v6[127];
    return (void *)[v6 _pageToIndexPath:v7 animated:v3 ^ 1u];
  }
  return result;
}

uint64_t __86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetPreheating];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 1016);
  *(void *)(v2 + 1016) = 0;

  uint64_t result = [*(id *)(a1 + 32) _updateLastKnownReferenceIndexPath];
  *(unsigned char *)(*(void *)(a1 + 32) + 1025) = 0;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v7 viewDidLayoutSubviews];
  int v3 = [(PUCarouselSharingViewController *)self photosSharingTransitionContext];
  id v4 = v3;
  if (self->_shouldScrollToSelection)
  {
    double v5 = [v3 keyAssetIndexPath];
    if (v5
      || ([(PUCarouselSharingViewController *)self _firstSelectedIndexPath],
          (double v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(PUCarouselSharingViewController *)self _pageToIndexPath:v5 animated:0];
    }
    self->_shouldScrollToSelection = 0;
  }
  if (!self->_inFlightRotation)
  {
    inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
    self->_inFlightReferenceIndexPath = 0;
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v5 viewWillLayoutSubviews];
  if (!self->_inFlightRotation && !self->_inFlightReferenceIndexPath)
  {
    int v3 = [(PUCarouselSharingViewController *)self currentIndexPath];
    inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
    self->_inFlightReferenceIndexPath = v3;
  }
  [(PUCarouselSharingViewController *)self _updateMainViewAnimated:0];
}

- (void)viewDidLoad
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v19 viewDidLoad];
  [(PUCarouselSharingViewController *)self _updateMainViewAnimated:0];
  [(PUCarouselSharingViewController *)self _setViewInSyncWithModel:0];
  int v3 = [(PUCarouselSharingViewController *)self _lastKnownReferenceAsset];
  if (v3) {
    goto LABEL_2;
  }
  id v4 = [(PUCarouselSharingViewController *)self _lastKnownReferenceIndexPath];

  if (!v4)
  {
    int v3 = [(PUCarouselSharingViewController *)self _firstSelectedIndexPath];
    [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:0 indexPath:v3];
LABEL_2:
  }
  objc_super v5 = [(PUCarouselSharingViewController *)self view];
  id v6 = +[PUInterfaceManager currentTheme];
  objc_super v7 = [v6 photoCollectionViewBackgroundColor];
  [v5 setBackgroundColor:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = *MEMORY[0x1E4FB2B90];
  v20[0] = *MEMORY[0x1E4FB2B78];
  v20[1] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*(void *)(*((void *)&v15 + 1) + 8 * i) modifierFlags:0 action:sel__arrowKey_];
        [v14 setWantsPriorityOverSystemBehavior:1];
        [(PUCarouselSharingViewController *)self addKeyCommand:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)_firstSelectedIndexPath
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__71877;
  uint64_t v12 = __Block_byref_object_dispose__71878;
  id v13 = 0;
  int v3 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  photoCollectionsFetchResult = self->_photoCollectionsFetchResult;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PUCarouselSharingViewController__firstSelectedIndexPath__block_invoke;
  v7[3] = &unk_1E5F2AF78;
  v7[4] = &v8;
  [v3 enumerateSelectedAssetsWithAssetCollectionOrdering:photoCollectionsFetchResult block:v7];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __58__PUCarouselSharingViewController__firstSelectedIndexPath__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:");
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *a5 = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(PUCarouselSharingViewController *)self presentedViewController];

  if (!v4) {
    self->_shouldPlayVitalityHintAfterViewDidAppear = 0;
  }
  [(PUCarouselSharingViewController *)self _setLoopingPlaybackAllowed:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v4 viewDidAppear:a3];
  [(PUCarouselSharingViewController *)self _handlePhotoViewLoaderBlocks];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v4 viewWillAppear:a3];
  [(PUCarouselSharingViewController *)self _updateMainViewAnimated:0];
  if (![(PUCarouselSharingViewController *)self _isViewInSyncWithModel]) {
    [(PUCarouselSharingViewController *)self _updateInterfaceForModelReloadAnimated:0];
  }
  [(PUCarouselSharingViewController *)self _setLoopingPlaybackAllowed:1];
}

- (void)setSendAsAssetBundles:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_sendAsAssetBundles != a3)
  {
    self->_sendAsAssetBundles = a3;
    if (a3)
    {
      objc_super v4 = [(PUCarouselSharingViewController *)self photoSelectionManager];
      objc_super v5 = [v4 orderedSelectedAssets];

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", *(void *)(*((void *)&v13 + 1) + 8 * i), 0, (void)v13);
            uint64_t v12 = (void *)[v11 copy];
            [v12 setExcludeLiveness:0];
            [v12 setExcludeLocation:0];
            [v12 setExcludeCaption:0];
            [v12 setExcludeAccessibilityDescription:0];
            [(PUCarouselSharingViewController *)self _replaceActivityAssetItem:v11 withAssetItem:v12 notifyDelegate:0];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
    [(PUCarouselSharingViewController *)self _updateVisibleCellBadges];
  }
}

- (void)setReadyForInteraction:(BOOL)a3
{
  if (self->_readyForInteraction != a3)
  {
    self->_readyForInteraction = a3;
    [(PUCarouselSharingViewController *)self _handlePhotoViewLoaderBlocks];
  }
}

- (void)_setLoopingPlaybackAllowed:(BOOL)a3
{
  if (self->__loopingPlaybackAllowed != a3)
  {
    self->__loopingPlaybackAllowed = a3;
    [(PUCarouselSharingViewController *)self _updateAdditionalContentForVisibleCells];
  }
}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  if (![(PUCarouselSharingViewController *)self isViewLoaded]) {
    return;
  }
  objc_super v4 = [(PUCarouselSharingViewController *)self spec];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  [(PUCarouselSharingViewController *)self _getMainCollectionViewFrame:&v27 collectionViewLayoutInsets:&v29];
  objc_super v5 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v6 = [(PUCarouselSharingViewController *)self mainCollectionViewLayout];
  [v4 interItemSpacingForWidth:*(double *)&v28];
  if (v6)
  {
    if (v5) {
      goto LABEL_4;
    }
  }
  else
  {
    double v16 = v7;
    id v6 = objc_alloc_init(PUPhotosSharingCollectionViewLayout);
    -[PUPhotosSharingCollectionViewLayout setSharingBadgesCorner:](v6, "setSharingBadgesCorner:", [v4 selectionBadgeCorner]);
    [v4 selectionBadgeOffset];
    -[PUPhotosSharingCollectionViewLayout setSharingBadgesOffset:](v6, "setSharingBadgesOffset:");
    [(PUPhotosSharingCollectionViewLayout *)v6 _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
    [(PUHorizontalTiledCollectionViewLayout *)v6 setDelegate:self];
    [(PUCarouselSharingViewController *)self _setMainCollectionViewLayout:v6];
    [(PUHorizontalTiledCollectionViewLayout *)v6 setInteritemSpacing:v16];
    if (v5) {
      goto LABEL_4;
    }
  }
  id v17 = objc_alloc(MEMORY[0x1E4FB1568]);
  objc_super v5 = objc_msgSend(v17, "initWithFrame:collectionViewLayout:", v6, v27, v28);
  [v5 setAutoresizingMask:18];
  [(PUCarouselSharingViewController *)self _setMainCollectionView:v5];
  uint64_t v18 = [(PUCarouselSharingViewController *)self view];
  [v18 addSubview:v5];

  [v5 setAlwaysBounceVertical:0];
  [v5 setAlwaysBounceHorizontal:1];
  [v5 setPagingEnabled:0];
  [v5 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [v5 setDataSource:self];
  [v5 setDelegate:self];
  [v5 setShowsHorizontalScrollIndicator:0];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotosSharingCellIdentifier"];
  [v5 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" withReuseIdentifier:@"PUPhotosSharingBadgeIdentifier"];
  [v5 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" withReuseIdentifier:@"PUPhotosSharingOptionIdentifier"];
  [v5 setContentInsetAdjustmentBehavior:2];
  objc_super v19 = +[PUInterfaceManager currentTheme];
  double v20 = [v19 photoCollectionViewBackgroundColor];

  [v5 setBackgroundColor:v20];
  double v21 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapInMainCollectionView_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v21;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [v5 addGestureRecognizer:self->_tapGestureRecognizer];
  double v23 = objc_alloc_init(PUScrollViewSpeedometer);
  speedometer = self->_speedometer;
  self->_speedometer = v23;

  [(PUScrollViewSpeedometer *)self->_speedometer setMediumLowerThreshold:100.0];
  [(PUScrollViewSpeedometer *)self->_speedometer setMediumUpperThreshold:500.0];
  [(PUScrollViewSpeedometer *)self->_speedometer setFastLowerThreshold:500.0];
  [(PUScrollViewSpeedometer *)self->_speedometer setFastUpperThreshold:1000.0];
  [(PUScrollViewSpeedometer *)self->_speedometer setDelegate:self];

LABEL_4:
  objc_msgSend(v5, "setFrame:", v27, v28);
  id v25 = 0;
  id v26 = 0;
  [(PUCarouselSharingViewController *)self _getFirstValidIndexPath:&v26 lastValidIndexPath:&v25];
  id v8 = v26;
  id v9 = v25;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    [(PUCarouselSharingViewController *)self _sizeForItemAtIndexPath:v8];
    double v12 = v11;
    [(PUCarouselSharingViewController *)self _sizeForItemAtIndexPath:v10];
    double v13 = *((double *)&v29 + 1) + round((*(double *)&v28 - v12) * 0.5);
    double v15 = *((double *)&v30 + 1) + round((*(double *)&v28 - v14) * 0.5);
    *((double *)&v29 + 1) = v13;
    *((double *)&v30 + 1) = v15;
  }
  else
  {
    double v13 = *((double *)&v29 + 1);
    double v15 = *((double *)&v30 + 1);
  }
  -[PUHorizontalTiledCollectionViewLayout setItemsContentInset:](v6, "setItemsContentInset:", *(double *)&v29, v13, *(double *)&v30, v15);
}

- (void)_processCollectionListChangeNotifications:(id)a3 singleCollectionNotifications:(id)a4 needsReloadData:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a4;
  if (![a3 count] && !objc_msgSend(v18, "count")) {
    goto LABEL_19;
  }
  id v8 = [(PUCarouselSharingViewController *)self _lastKnownReferenceAsset];
  id v9 = [(PUCarouselSharingViewController *)self _lastKnownReferenceIndexPath];
  uint64_t v10 = v9;
  if (!v8)
  {
    double v12 = 0;
    goto LABEL_9;
  }
  if (v9) {
    uint64_t v11 = [v9 section];
  }
  else {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v12 = [(PUCarouselSharingViewController *)self _indexPathOfAsset:v8 sectionHint:v11];
  if (!v12)
  {
LABEL_9:
    if (v10)
    {
      double v12 = [(PUCarouselSharingViewController *)self _validIndexPathFromIndexPath:v10];
    }
  }
  [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:0 indexPath:v12];
  if (self->_inFlightReferenceIndexPath)
  {
    -[PUCarouselSharingViewController _validIndexPathFromIndexPath:](self, "_validIndexPathFromIndexPath:");
    double v13 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
    self->_inFlightReferenceIndexPath = v13;
  }
  if (v5)
  {
    if ([(PUCarouselSharingViewController *)self isViewLoaded]
      && ([(PUCarouselSharingViewController *)self view],
          double v15 = objc_claimAutoreleasedReturnValue(),
          [v15 window],
          double v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      id v17 = [(PUCarouselSharingViewController *)self mainCollectionView];
      [v17 reloadData];

      [(PUCarouselSharingViewController *)self _setViewInSyncWithModel:1];
      [(PUCarouselSharingViewController *)self _updatePreheatedAssets];
    }
    else
    {
      [(PUCarouselSharingViewController *)self _setViewInSyncWithModel:0];
    }
  }

LABEL_19:
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(PUCarouselSharingViewController *)self photoCollectionsFetchResult];
  double v7 = [v4 changeDetailsForFetchResult:v6];

  if (v7)
  {
    if (([v7 hasMoves] & 1) == 0 && objc_msgSend(v7, "hasIncrementalChanges"))
    {
      id v8 = [v7 insertedIndexes];
      if ([v8 count])
      {
      }
      else
      {
        id v9 = [v7 removedIndexes];
        BOOL v10 = [v9 count] == 0;

        if (v10)
        {
LABEL_8:
          [v5 addObject:v7];
          uint64_t v11 = [v7 fetchResultAfterChanges];
          photoCollectionsFetchResult = self->_photoCollectionsFetchResult;
          self->_photoCollectionsFetchResult = v11;

          goto LABEL_9;
        }
      }
    }
    *((unsigned char *)v37 + 24) = 1;
    goto LABEL_8;
  }
LABEL_9:
  double v13 = [MEMORY[0x1E4F1CA60] dictionary];
  resultsForAssetCollection = self->_resultsForAssetCollection;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke;
  v32[3] = &unk_1E5F2AF28;
  id v15 = v4;
  id v33 = v15;
  uint64_t v35 = &v36;
  id v16 = v13;
  id v34 = v16;
  [(NSMutableDictionary *)resultsForAssetCollection enumerateKeysAndObjectsUsingBlock:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = self->__preheatedAssets;
  uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v17);
        }
        double v21 = [v15 changeDetailsForObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        if ([v21 assetContentChanged])
        {
          *((unsigned char *)v37 + 24) = 1;

          goto LABEL_19;
        }
      }
      uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke_2;
  v27[3] = &unk_1E5F2AF50;
  void v27[4] = self;
  [v16 enumerateKeysAndObjectsUsingBlock:v27];
  if ([v5 count] || objc_msgSend(v16, "count"))
  {
    uint64_t v22 = [(PUCarouselSharingViewController *)self photoSelectionManager];
    [v22 handlePhotoLibraryChange:v15];

    double v23 = [(PUCarouselSharingViewController *)self photoSelectionManager];
    double v24 = [v23 orderedSelectedAssets];

    id v25 = [(PUCarouselSharingViewController *)self _updatedActivityAssetItemsForAssets:v24];
    id v26 = [(PUCarouselSharingViewController *)self delegate];
    [v26 carouselSharingViewController:self setAssetItems:v25];

    [(PUCarouselSharingViewController *)self _processCollectionListChangeNotifications:v5 singleCollectionNotifications:v16 needsReloadData:*((unsigned __int8 *)v37 + 24)];
  }

  _Block_object_dispose(&v36, 8);
}

void __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  BOOL v5 = [*(id *)(a1 + 32) changeDetailsForFetchResult:a3];
  id v6 = v5;
  if (v5)
  {
    if (([v5 hasMoves] & 1) == 0 && objc_msgSend(v6, "hasIncrementalChanges"))
    {
      double v7 = [v6 insertedIndexes];
      if ([v7 count])
      {
      }
      else
      {
        id v8 = [v6 removedIndexes];
        uint64_t v9 = [v8 count];

        if (!v9)
        {
LABEL_8:
          [*(id *)(a1 + 40) setObject:v6 forKey:v10];
          goto LABEL_9;
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_8;
  }
LABEL_9:
}

void __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 984);
  id v5 = a2;
  id v6 = [a3 fetchResultAfterChanges];
  [v4 setObject:v6 forKey:v5];
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  return 0;
}

- (void)ppt_faultInScollViewContentSize
{
  id v5 = 0;
  id v6 = 0;
  [(PUCarouselSharingViewController *)self _getFirstValidIndexPath:&v6 lastValidIndexPath:&v5];
  id v3 = v6;
  id v4 = v5;
  [(PUCarouselSharingViewController *)self _pageToIndexPath:v4 animated:0];
  [(PUCarouselSharingViewController *)self _pageToIndexPath:v3 animated:0];
}

- (BOOL)ppt_scrollToAssetAtRelativeIndex:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  if (a3 != -1 && a3 != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUCarouselSharingViewController.m" lineNumber:1320 description:@"only support single step"];
  }
  uint64_t v9 = [(PUCarouselSharingViewController *)self currentIndexPath];
  id v10 = [(PUCarouselSharingViewController *)self mainCollectionView];
  uint64_t v11 = [v10 next:a3 indexPathFromIndexPath:v9];

  if (v11)
  {
    [(PUCarouselSharingViewController *)self _pptSetOnDidEndScrollingBlock:v7];
    [(PUCarouselSharingViewController *)self _pageToIndexPath:v11 animated:1];
  }

  return v11 != 0;
}

- (CGRect)frameForBadgeOfKind:(id)a3 forItemFrame:(CGRect)a4 atIndexPath:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  double v13 = -[PUPhotosSharingCollectionViewItemSublayout initWithIndexPath:itemFrame:]([PUPhotosSharingCollectionViewItemSublayout alloc], "initWithIndexPath:itemFrame:", v12, x, y, width, height);
  [(PUCarouselSharingViewController *)self layout:0 collectionView:0 sizeForBadgeViewOfKind:@"PUPhotosSharingSelectionBadgeKind" forItemAtIndexPath:v12];
  -[PUPhotosSharingCollectionViewItemSublayout setSelectionBadgeSize:](v13, "setSelectionBadgeSize:");
  [(PUCarouselSharingViewController *)self layout:0 collectionView:0 sizeForBadgeViewOfKind:@"PUPhotosSharingOptionBadgeKind" forItemAtIndexPath:v12];
  double v15 = v14;
  double v17 = v16;

  -[PUPhotosSharingCollectionViewItemSublayout setOptionBadgeSize:](v13, "setOptionBadgeSize:", v15, v17);
  LOBYTE(v12) = [v11 isEqualToString:@"PUPhotosSharingSelectionBadgeKind"];
  uint64_t v18 = [(PUCarouselSharingViewController *)self spec];
  uint64_t v19 = v18;
  if (v12) {
    uint64_t v20 = [v18 selectionBadgeCorner];
  }
  else {
    uint64_t v20 = [v18 optionBadgeCorner];
  }
  uint64_t v21 = v20;

  [(PUPhotosSharingCollectionViewItemSublayout *)v13 setBadgesCorner:v21];
  uint64_t v22 = [(PUCarouselSharingViewController *)self spec];
  [v22 selectionBadgeOffset];
  -[PUPhotosSharingCollectionViewItemSublayout setBadgesOffset:](v13, "setBadgesOffset:");

  [(PUPhotosSharingCollectionViewItemSublayout *)v13 prepareSublayout];
  if ([v11 isEqualToString:@"PUPhotosSharingSelectionBadgeKind"])
  {
    double v23 = [(PUPhotosSharingCollectionViewItemSublayout *)v13 selectionBadgeLayoutAttributes];
  }
  else
  {
    if (![v11 isEqualToString:@"PUPhotosSharingOptionBadgeKind"])
    {
LABEL_10:
      double v26 = *MEMORY[0x1E4F1DB28];
      double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_11;
    }
    double v23 = [(PUPhotosSharingCollectionViewItemSublayout *)v13 optionBadgeLayoutAttributes];
  }
  double v24 = v23;
  if (!v23) {
    goto LABEL_10;
  }
  [v23 frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

LABEL_11:
  double v33 = v26;
  double v34 = v28;
  double v35 = v30;
  double v36 = v32;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (void)_updatePreheatedAssets
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUCarouselSharingViewController *)self mainCollectionView];
  [v3 bounds];
  CGFloat x = v86.origin.x;
  CGFloat y = v86.origin.y;
  double width = v86.size.width;
  double height = v86.size.height;
  if (!CGRectIsEmpty(v86))
  {
    if ((unint64_t)([(PUCarouselSharingViewController *)self interfaceOrientation] - 1) >= 2) {
      double v8 = height;
    }
    else {
      double v8 = width;
    }
    [(PUCarouselSharingViewController *)self _previousPreheatRect];
    double v10 = v9;
    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = y;
    v87.size.double width = width;
    v87.size.double height = height;
    CGRect v88 = CGRectInset(v87, v8 * -2.0, 0.0);
    double v11 = v88.origin.x;
    double v12 = v88.origin.y;
    double v13 = v88.origin.x - v10;
    if (v13 < 0.0) {
      double v13 = -v13;
    }
    if (v13 > v8 / 3.0)
    {
      double v14 = v88.size.width;
      double v15 = v88.size.height;
      if ([(PUCarouselSharingViewController *)self px_isVisible])
      {
        -[PUCarouselSharingViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", v11, v12, v14, v15);
        photosSharingTransitionContext = self->_photosSharingTransitionContext;
        double v17 = [v3 collectionViewLayout];
        uint64_t v18 = v17;
        if (photosSharingTransitionContext) {
          objc_msgSend(v17, "layoutAttributesForElementsInRect:", v11, v12, v14, v15);
        }
        else {
        uint64_t v19 = objc_msgSend(v17, "layoutAttributesForItemsInRect:", v11, v12, v14, v15);
        }

        uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v19, "count"));
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v22 = v19;
        double v23 = (void *)v20;
        id obj = v22;
        uint64_t v24 = [v22 countByEnumeratingWithState:&v76 objects:v84 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v77 != v26) {
                objc_enumerationMutation(obj);
              }
              double v28 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              if (![v28 representedElementCategory])
              {
                double v29 = [v28 indexPath];
                double v30 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v29];
                [v21 addObject:v30];
                [v23 setObject:v28 forKey:v30];
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
          }
          while (v25);
        }

        double v31 = [(PUCarouselSharingViewController *)self _preheatedAssets];
        [(PUCarouselSharingViewController *)self _setPreheatedAssets:v21];
        double v32 = (void *)[v21 mutableCopy];
        [v32 minusSet:v31];
        v65 = (void *)[v31 mutableCopy];
        [v65 minusSet:v21];
        if ([v32 count] || objc_msgSend(v65, "count"))
        {
          v61 = v31;
          v62 = v21;
          v64 = v3;
          double v33 = objc_opt_new();
          double v34 = [(PUCarouselSharingViewController *)self cachingImageManager];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          v60 = v32;
          id v35 = v32;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v72 objects:v83 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v73;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v73 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = *(void *)(*((void *)&v72 + 1) + 8 * j);
                uint64_t v41 = objc_msgSend(v23, "objectForKeyedSubscript:", v40, v60);
                [v41 frame];
                double v43 = PUPixelSizeFromPointSize(v42);
                double v45 = v44;
                uint64_t v82 = v40;
                uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
                objc_msgSend(v34, "startCachingImagesForAssets:targetSize:contentMode:options:", v46, 0, v33, v43, v45);
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v72 objects:v83 count:16];
            }
            while (v37);
          }
          v63 = v23;

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v66 = v65;
          uint64_t v47 = [v66 countByEnumeratingWithState:&v68 objects:v81 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v69;
            do
            {
              for (uint64_t k = 0; k != v48; ++k)
              {
                if (*(void *)v69 != v49) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v51 = *(void *)(*((void *)&v68 + 1) + 8 * k);
                long long v52 = -[PUCarouselSharingViewController _indexPathOfAsset:sectionHint:](self, "_indexPathOfAsset:sectionHint:", v51, 0x7FFFFFFFFFFFFFFFLL, v60);
                v53 = [(PUCarouselSharingViewController *)self mainCollectionViewLayout];
                uint64_t v54 = [v53 layoutAttributesForItemAtIndexPath:v52];

                [v54 frame];
                double v56 = PUPixelSizeFromPointSize(v55);
                double v58 = v57;
                uint64_t v80 = v51;
                v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
                objc_msgSend(v34, "stopCachingImagesForAssets:targetSize:contentMode:options:", v59, 0, v33, v56, v58);
              }
              uint64_t v48 = [v66 countByEnumeratingWithState:&v68 objects:v81 count:16];
            }
            while (v48);
          }

          double v23 = v63;
          id v3 = v64;
          double v31 = v61;
          uint64_t v21 = v62;
          double v32 = v60;
        }
      }
    }
  }
}

- (void)_resetPreheating
{
  [(PHCachingImageManager *)self->_cachingImageManager stopCachingImagesForAllAssets];
  -[PUCarouselSharingViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUCarouselSharingViewController *)self _setPreheatedAssets:0];
}

- (id)_optionViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    double v8 = [a4 dequeueReusableSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" withReuseIdentifier:@"PUPhotosSharingOptionIdentifier" forIndexPath:v7];
    [(PUPhotosSharingOptionView *)v8 setTarget:self action:sel__handleSelectionOption_];
    [(NSMapTable *)self->_indexPathsByOptionView setObject:v7 forKey:v8];
  }
  else
  {
    id v9 = a3;
    double v8 = objc_alloc_init(PUPhotosSharingOptionView);
  }
  [(PUCarouselSharingViewController *)self _updateOptionView:v8 atIndexPath:a3];

  return v8;
}

- (id)_selectionViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 1201, @"Invalid parameter not satisfying: %@", @"collectionView" object file lineNumber description];
  }
  id v9 = [v8 dequeueReusableSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" withReuseIdentifier:@"PUPhotosSharingBadgeIdentifier" forIndexPath:v7];
  double v10 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v7 section]);
  double v11 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v12 = objc_msgSend(v11, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v7, "item"), v10);

  [v9 setSelected:v12];
  return v9;
}

- (void)setPhotosSharingTransitionLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v7 = [(PUCarouselSharingViewController *)self _transitionLayout];

  id v8 = v12;
  if (v7 != v12)
  {
    objc_storeStrong((id *)&self->__transitionLayout, a3);
    if (v12)
    {
      id v9 = v12;
    }
    else
    {
      id v9 = [(PUCarouselSharingViewController *)self mainCollectionViewLayout];
    }
    double v10 = v9;
    double v11 = [(PUCarouselSharingViewController *)self mainCollectionView];
    [v11 setCollectionViewLayout:v10 animated:v4];

    id v8 = v12;
  }
}

- (void)_updateCellAtIndexPath:(id)a3 withTransitionInfo:(id)a4
{
  id v25 = a4;
  id v7 = a3;
  id v8 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v9 = [v8 cellForItemAtIndexPath:v7];

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      id v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      uint64_t v24 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
      [v21 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 1175, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self.mainCollectionView cellForItemAtIndexPath:indexPath]", v23, v24 object file lineNumber description];
    }
    double v10 = [v25 image];
    double v11 = [v9 photoView];
    id v12 = [v11 contentHelper];
    double v13 = [v12 photoImage];

    [v10 size];
    double v15 = v14;
    [v13 size];
    if (v15 > v16)
    {
      double v17 = [v9 photoView];
      uint64_t v18 = [v17 contentHelper];
      [v18 setPhotoImage:0];

      uint64_t v19 = [v9 photoView];
      uint64_t v20 = [v19 contentHelper];
      [v20 setPlaceHolderImage:v10];
    }
  }
}

- (void)_updateAssetTransitionInfo:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v15 = v5;
    id v6 = [v5 asset];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:

      id v5 = v15;
      goto LABEL_7;
    }
    id v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_5:
        id v8 = [(PUCarouselSharingViewController *)self currentIndexPath];
        id v9 = -[PUCarouselSharingViewController _indexPathOfAsset:sectionHint:](self, "_indexPathOfAsset:sectionHint:", v7, [v8 section]);

        [(PUCarouselSharingViewController *)self _updateCellAtIndexPath:v9 withTransitionInfo:v15];
        goto LABEL_6;
      }
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v13);
      double v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v10 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 1167, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAsset", v12, v14 object file lineNumber description];
    }
    else
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      [v10 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 1167, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAsset", v12 object file lineNumber description];
    }

    goto LABEL_5;
  }
LABEL_7:
}

- (void)setTrailingAssetTransitionInfo:(id)a3
{
  id v5 = (PUAssetTransitionInfo *)a3;
  if (self->_trailingAssetTransitionInfo != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, a3);
    [(PUCarouselSharingViewController *)self _updateAssetTransitionInfo:self->_trailingAssetTransitionInfo];
    id v5 = v6;
  }
}

- (void)setLeadingAssetTransitionInfo:(id)a3
{
  id v5 = (PUAssetTransitionInfo *)a3;
  if (self->_leadingAssetTransitionInfo != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, a3);
    [(PUCarouselSharingViewController *)self _updateAssetTransitionInfo:self->_leadingAssetTransitionInfo];
    id v5 = v6;
  }
}

- (void)setOneUpPhotosSharingTransitionInfo:(id)a3
{
  p_assetTransitionInfo = &self->_assetTransitionInfo;
  id v7 = (PUAssetTransitionInfo *)a3;
  if (*p_assetTransitionInfo != v7)
  {
    objc_storeStrong((id *)&self->_assetTransitionInfo, a3);
    if (*p_assetTransitionInfo)
    {
      id v6 = [(PUCarouselSharingViewController *)self currentIndexPath];
      [(PUCarouselSharingViewController *)self _updateCellAtIndexPath:v6 withTransitionInfo:*p_assetTransitionInfo];
    }
  }
}

- (void)setOneUpPhotosSharingTransitionContext:(id)a3
{
  id v6 = (PUPhotosSharingTransitionContext *)a3;
  if (self->_photosSharingTransitionContext != v6)
  {
    id v15 = v6;
    objc_storeStrong((id *)&self->_photosSharingTransitionContext, a3);
    id v6 = v15;
    if (v15)
    {
      id v7 = [(PUPhotosSharingTransitionContext *)v15 currentAssetReference];
      id v8 = [v7 asset];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        id v6 = v15;
        goto LABEL_8;
      }
      id v9 = v8;
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_6:
          [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:v9 indexPath:0];

          goto LABEL_7;
        }
        double v10 = [MEMORY[0x1E4F28B00] currentHandler];
        double v13 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v13);
        double v14 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
        [v10 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 1128, @"%@ should be an instance inheriting from %@, but it is %@", @"displayAsset", v12, v14 object file lineNumber description];
      }
      else
      {
        double v10 = [MEMORY[0x1E4F28B00] currentHandler];
        double v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        [v10 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 1128, @"%@ should be an instance inheriting from %@, but it is nil", @"displayAsset", v12 object file lineNumber description];
      }

      goto LABEL_6;
    }
  }
LABEL_8:
}

- (void)setPhotosSharingTransitionContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (PUPhotosSharingTransitionContext *)a3;
  p_photosSharingTransitionContext = &self->_photosSharingTransitionContext;
  if (self->_photosSharingTransitionContext != v5)
  {
    objc_storeStrong((id *)&self->_photosSharingTransitionContext, a3);
    if (*p_photosSharingTransitionContext)
    {
      id v7 = [(PUPhotosSharingTransitionContext *)*p_photosSharingTransitionContext keyAssetIndexPath];
      [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:0 indexPath:v7];
    }
    id v8 = [(PUCarouselSharingViewController *)self mainCollectionView];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = objc_msgSend(v8, "visibleCells", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v15 = [v8 indexPathForCell:v14];
          [(PUCarouselSharingViewController *)self _updateCell:v14 forItemAtIndexPath:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (PHAsset)currentAsset
{
  id v3 = [(PUCarouselSharingViewController *)self _lastKnownReferenceAsset];
  if (v3)
  {
    BOOL v4 = [(PUCarouselSharingViewController *)self currentIndexPath];
    if (v4)
    {
      uint64_t v5 = [(PUCarouselSharingViewController *)self _lastKnownReferenceAsset];

      id v3 = (void *)v5;
    }
  }
  return (PHAsset *)v3;
}

- (id)currentIndexPath
{
  id v3 = [(PUCarouselSharingViewController *)self _lastKnownReferenceIndexPath];

  if (!v3
    || ([(PUCarouselSharingViewController *)self _lastKnownReferenceIndexPath],
        (BOOL v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(PUCarouselSharingViewController *)self _updateLastKnownReferenceIndexPath];
    BOOL v4 = [(PUCarouselSharingViewController *)self _lastKnownReferenceIndexPath];
    if (!v4)
    {
      id v6 = [(PUCarouselSharingViewController *)self _lastKnownReferenceAsset];

      if (!v6
        || ([(PUCarouselSharingViewController *)self _lastKnownReferenceAsset],
            id v7 = objc_claimAutoreleasedReturnValue(),
            [(PUCarouselSharingViewController *)self _indexPathOfAsset:v7 sectionHint:0x7FFFFFFFFFFFFFFFLL], BOOL v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(), v7, !v4))
      {
        BOOL v4 = self->_inFlightReferenceIndexPath;
        if (!v4)
        {
          id v8 = 0;
          [(PUCarouselSharingViewController *)self _getFirstValidIndexPath:&v8 lastValidIndexPath:0];
          BOOL v4 = (NSIndexPath *)v8;
        }
      }
    }
  }
  [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:0 indexPath:v4];
  return v4;
}

- (void)_setLastKnownReferenceAsset:(id)a3 indexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((!v7 || v6) && !v7 && v6)
  {
    id v7 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v6];
  }
  [(PUCarouselSharingViewController *)self _setLastKnownReferenceIndexPath:v6];
  [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:v7];
}

- (void)_updateLastKnownReferenceIndexPath
{
  id v5 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v3 = [(PUCarouselSharingViewController *)self mainCollectionViewLayout];
  if (v5 && [v3 hasReferenceIndexPath])
  {
    BOOL v4 = [(PUCarouselSharingViewController *)self _indexPathOfCenterVisibleItemInCollectionView:v5];
    [(PUCarouselSharingViewController *)self _setLastKnownReferenceAsset:0 indexPath:v4];
  }
}

- (id)_validIndexPathFromIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUCarouselSharingViewController.m" lineNumber:1019 description:@"expected index path"];
  }
  int64_t v6 = [(PUCarouselSharingViewController *)self _numberOfSections] - 1;
  uint64_t v7 = [v5 section];
  if (v6 >= v7) {
    int64_t v6 = v7;
  }
  uint64_t v8 = [v5 item];
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = v8;
    int64_t v10 = [(PUCarouselSharingViewController *)self _numberOfItemsInSection:v6];
    if (v10)
    {
LABEL_12:
      if (v10 - 1 >= v9) {
        uint64_t v12 = v9;
      }
      else {
        uint64_t v12 = v10 - 1;
      }
      uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:v6];
      goto LABEL_16;
    }
    while (v6 > 0)
    {
      int64_t v10 = [(PUCarouselSharingViewController *)self _numberOfItemsInSection:--v6];
      if (v10)
      {
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
    }
  }
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

- (void)_getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4
{
  int64_t v6 = [(PUCarouselSharingViewController *)self view];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  if (a3)
  {
    a3->origin.CGFloat x = v8;
    a3->origin.CGFloat y = v10;
    a3->size.double width = v12;
    a3->size.double height = v14;
  }
  if (a4)
  {
    long long v15 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&a4->bottom = v15;
  }
}

- (CGRect)_collectionViewContentFrame
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  [(PUCarouselSharingViewController *)self _getMainCollectionViewFrame:&v8 collectionViewLayoutInsets:&v6];
  double v2 = *(double *)&v8 + *((double *)&v6 + 1);
  double v3 = *((double *)&v8 + 1) + *(double *)&v6;
  double v4 = *(double *)&v9 - (*((double *)&v6 + 1) + *((double *)&v7 + 1));
  double v5 = *((double *)&v9 + 1) - (*(double *)&v6 + *(double *)&v7);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)_handleTapInMainCollectionView:(id)a3
{
  id v4 = a3;
  id v8 = [(PUCarouselSharingViewController *)self mainCollectionView];
  [v4 locationInView:v8];
  double v6 = v5;

  long long v7 = [(PUCarouselSharingViewController *)self _indexPathInCollectionView:v8 closestToContentOffsetX:v6];
  if (v7) {
    [(PUCarouselSharingViewController *)self _handleTapAtIndexPath:v7];
  }
}

- (void)_handleTapAtIndexPath:(id)a3
{
  id v9 = a3;
  id v4 = [(PUCarouselSharingViewController *)self mainCollectionView];
  double v5 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v9];
  if ([v5 canPerformSharingAction])
  {
    double v6 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v9 section]);
    long long v7 = [(PUCarouselSharingViewController *)self photoSelectionManager];
    int v8 = objc_msgSend(v7, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v9, "item"), v6);

    [(PUCarouselSharingViewController *)self _setSelected:v8 ^ 1u atIndexPath:v9 animated:0];
  }
  if (([v4 isDragging] & 1) == 0
    && ([v4 isDecelerating] & 1) == 0
    && [v4 isTracking])
  {
    [(PUCarouselSharingViewController *)self _pageToIndexPath:v9 animated:1];
  }
}

- (void)_playLivePhotoHintIfNeededAtIndexPath:(id)a3
{
  mainCollectionView = self->_mainCollectionView;
  id v5 = a3;
  id v14 = [(UICollectionView *)mainCollectionView cellForItemAtIndexPath:v5];
  double v6 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v5];
  long long v7 = [(PUCarouselSharingViewController *)self _activityAssetItemForAsset:v6 createIfNecessary:0];
  int v8 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v5 section]);
  id v9 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v10 = [v5 item];

  int v11 = [v9 isAssetAtIndexSelected:v10 inAssetCollection:v8];
  if (([v7 excludeLiveness] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v12 = [v14 photoView];
      double v13 = [v12 contentHelper];

      if (v11) {
        [v13 startPlaybackWithStyle:2];
      }
      else {
        [v13 stopPlayback];
      }
    }
  }
}

- (void)_arrowKey:(id)a3
{
  id v16 = a3;
  id v4 = [(PUCarouselSharingViewController *)self viewIfLoaded];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 effectiveUserInterfaceLayoutDirection];
    long long v7 = [v16 input];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4FB2B90]];

    if (v8)
    {
      if (v6 == 1) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v10 = [v16 input];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4FB2B78]];

      if (v6 == 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = -1;
      }
      if (v11) {
        uint64_t v9 = v12;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    double v13 = [(PUCarouselSharingViewController *)self currentIndexPath];
    id v14 = [(PUCarouselSharingViewController *)self mainCollectionView];
    long long v15 = [v14 next:v9 indexPathFromIndexPath:v13];

    if (v15) {
      [(PUCarouselSharingViewController *)self _pageToIndexPath:v15 animated:1];
    }
  }
}

- (void)_handleSelectionOption:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  long long v7 = [(NSMapTable *)self->_indexPathsByOptionView objectForKey:v6];
  int v8 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v7];
  uint64_t v9 = [(PUCarouselSharingViewController *)self _activityAssetItemForAsset:v8 createIfNecessary:0];
  uint64_t v10 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v7 section]);
  int v11 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  char v12 = objc_msgSend(v11, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v7, "item"), v10);

  if (v12)
  {
    double v13 = (void *)[v9 copy];
    uint64_t v14 = [v9 excludeLiveness] ^ 1;
    [v13 setExcludeLiveness:v14];
    double v27 = v13;
    [(PUCarouselSharingViewController *)self _replaceActivityAssetItem:v9 withAssetItem:v13 notifyDelegate:1];
    [(PUCarouselSharingViewController *)self _updateOptionView:v6 atIndexPath:v7];
    int v15 = [v8 canPlayPhotoIris];
    if ((v14 & 1) == 0 && v15) {
      [(PUCarouselSharingViewController *)self _playLivePhotoHintIfNeededAtIndexPath:v7];
    }
    id v16 = [(PUCarouselSharingViewController *)self mainCollectionView];
    long long v17 = [v16 cellForItemAtIndexPath:v7];

    uint64_t v26 = v17;
    uint64_t v18 = [v17 photoView];
    long long v19 = [(id)v18 contentHelper];

    [v19 setLivePhotoHidden:v14];
    uint64_t v20 = [(PUCarouselSharingViewController *)self analyticsEventsSent];
    LOBYTE(v18) = [v20 containsObject:@"com.apple.photos.CPAnalytics.shareSheetCarouselLiveToggled"];

    if ((v18 & 1) == 0)
    {
      id v25 = (void *)MEMORY[0x1E4F56658];
      uint64_t v28 = *MEMORY[0x1E4F56560];
      uint64_t v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      v29[0] = v22;
      double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      [v25 sendEvent:@"com.apple.photos.CPAnalytics.shareSheetCarouselLiveToggled" withPayload:v23];

      uint64_t v24 = [(PUCarouselSharingViewController *)self analyticsEventsSent];
      [v24 addObject:@"com.apple.photos.CPAnalytics.shareSheetCarouselLiveToggled"];
    }
  }
  else
  {
    [(PUCarouselSharingViewController *)self _setSelected:1 atIndexPath:v7 animated:1];
  }
}

- (NSString)localizedSelectionTitle
{
  if ([(PUCarouselSharingViewController *)self _isAnyAssetSelected])
  {
    double v3 = [(PUCarouselSharingViewController *)self photoSelectionManager];
    id v4 = [v3 localizedSelectionString];
  }
  else
  {
    id v4 = PULocalizedString(@"SHARING_HEADER_NO_ITEMS_TITLE");
  }
  return (NSString *)v4;
}

- (void)_updateOptionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PUCarouselSharingViewController *)self sendAsAssetBundles];
  id v15 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v6];
  uint64_t v9 = 1;
  uint64_t v10 = [(PUCarouselSharingViewController *)self _activityAssetItemForAsset:v15 createIfNecessary:1];
  uint64_t v11 = [v15 playbackStyle];
  char v12 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v6 section]);
  double v13 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v14 = [v6 item];

  LODWORD(v6) = [v13 isAssetAtIndexSelected:v14 inAssetCollection:v12];
  if (v6) {
    uint64_t v9 = [v10 excludeLiveness] ^ 1;
  }
  [v7 setInteractive:!v8];
  [v7 setToggled:v9];
  [v7 setHidden:v11 != 3];
}

- (void)deselectItemAtIndexPath:(id)a3
{
}

- (void)selectItemAtIndexPath:(id)a3
{
}

- (BOOL)isItemAtIndexPathSelected:(id)a3
{
  id v4 = a3;
  id v5 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v4 section]);
  id v6 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v7 = [v4 item];

  LOBYTE(v4) = [v6 isAssetAtIndexSelected:v7 inAssetCollection:v5];
  return (char)v4;
}

- (BOOL)_isAnyAssetSelected
{
  double v2 = self;
  double v3 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  LOBYTE(v2) = [v3 isAnyAssetSelectedInAssetCollections:v2->_photoCollectionsFetchResult];

  return (char)v2;
}

- (void)_setSelected:(BOOL)a3 atIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v7 section]);
  id v25 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v8];
  uint64_t v9 = objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v7, "item"));
  uint64_t v10 = [(PUCarouselSharingViewController *)self _activityAssetItemForAsset:v9 createIfNecessary:1];
  uint64_t v11 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v12 = [v7 item];
  if (v5)
  {
    [v11 selectAssetAtIndex:v12 inAssetCollection:v8];

    [(PUCarouselSharingViewController *)self _addActivityAssetItem:v10];
    double v13 = @"com.apple.photos.CPAnalytics.shareSheetCarouselSelected";
  }
  else
  {
    [v11 deselectAssetAtIndex:v12 inAssetCollection:v8];

    [v10 setExcludeLiveness:0];
    [(PUCarouselSharingViewController *)self _removeActivityAssetItem:v10];
    double v13 = @"com.apple.photos.CPAnalytics.shareSheetCarouselDeselected";
  }
  uint64_t v14 = [(PUCarouselSharingViewController *)self analyticsEventsSent];
  char v15 = [v14 containsObject:v13];

  if ((v15 & 1) == 0)
  {
    id v16 = (void *)MEMORY[0x1E4F56658];
    uint64_t v26 = *MEMORY[0x1E4F56560];
    long long v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    v27[0] = v18;
    long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v16 sendEvent:v13 withPayload:v19];

    uint64_t v20 = [(PUCarouselSharingViewController *)self analyticsEventsSent];
    [v20 addObject:v13];
  }
  uint64_t v21 = [(PUCarouselSharingViewController *)self mainCollectionView];
  id v22 = [v21 cellForItemAtIndexPath:v7];
  [v22 setSelected:v5];
  double v23 = [v21 _visibleSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" atIndexPath:v7];
  [v23 setSelected:v5];
  if ([v9 playbackStyle] == 3)
  {
    uint64_t v24 = [v21 _visibleSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" atIndexPath:v7];
    [(PUCarouselSharingViewController *)self _updateOptionView:v24 atIndexPath:v7];
  }
}

- (void)_replaceActivityAssetItem:(id)a3 withAssetItem:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v9 = a4;
  uint64_t v10 = [v15 asset];
  uint64_t v11 = [v9 asset];
  if (([v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 782, @"Invalid parameter not satisfying: %@", @"[previousAsset isEqual:asset]" object file lineNumber description];
  }
  uint64_t v12 = [v10 localIdentifier];
  [(NSMutableDictionary *)self->_assetItemsByAssetIdentifier setObject:v9 forKeyedSubscript:v12];
  if (v5)
  {
    double v13 = [(PUCarouselSharingViewController *)self delegate];
    [v13 carouselSharingViewController:self replaceAssetItem:v15 withAssetItem:v9];
  }
}

- (void)_removeActivityAssetItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 asset];
  id v7 = [v5 localIdentifier];

  [(NSMutableDictionary *)self->_assetItemsByAssetIdentifier setObject:0 forKeyedSubscript:v7];
  id v6 = [(PUCarouselSharingViewController *)self delegate];
  [v6 carouselSharingViewController:self removeAssetItem:v4];
}

- (void)_addActivityAssetItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCarouselSharingViewController *)self delegate];
  [v5 carouselSharingViewController:self addAssetItem:v4];
}

- (id)_updatedActivityAssetItemsForAssets:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [(NSMutableDictionary *)self->_assetItemsByAssetIdentifier allKeys];
  id v7 = (void *)[v6 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v13, 1, (void)v17);
        [v5 addObject:v14];

        id v15 = [v13 localIdentifier];
        [v7 removeObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)self->_assetItemsByAssetIdentifier removeObjectsForKeys:v7];
  return v5;
}

- (id)currentActivityAssetItems
{
  double v3 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  id v4 = [v3 orderedSelectedAssets];

  id v5 = [(PUCarouselSharingViewController *)self _updatedActivityAssetItemsForAssets:v4];

  return v5;
}

- (id)_activityAssetItemForAsset:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 localIdentifier];
  id v8 = [(NSMutableDictionary *)self->_assetItemsByAssetIdentifier objectForKey:v7];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    id v8 = [[PUActivityAssetItem alloc] initWithAsset:v6];
    [(NSMutableDictionary *)self->_assetItemsByAssetIdentifier setObject:v8 forKey:v7];
    if (![(PUCarouselSharingViewController *)self sendAsAssetBundles])
    {
      uint64_t v10 = +[PURootSettings sharedInstance];
      int v11 = [v10 irisUIEnabled];

      [(PUActivityAssetItem *)v8 setExcludeLiveness:v11 ^ 1u];
      [(PUActivityAssetItem *)v8 setExcludeLocation:0];
      [(PUActivityAssetItem *)v8 setExcludeCaption:0];
      [(PUActivityAssetItem *)v8 setExcludeAccessibilityDescription:0];
    }
  }

  return v8;
}

- (void)_handlePhotoViewLoaderBlocks
{
  if ([(PUCarouselSharingViewController *)self isReadyForInteraction]
    && [(PUCarouselSharingViewController *)self _appearState] == 2)
  {
    double v3 = [(PUCarouselSharingViewController *)self _photoViewLoaderBlocks];
    BOOL v4 = (void *)[v3 copy];

    id v5 = [(PUCarouselSharingViewController *)self _photoViewLoaderBlocks];
    [v5 removeAllObjects];

    id v6 = [(PUCarouselSharingViewController *)self _livePhotoViewLoaderBlocks];
    id v7 = (void *)[v6 copy];

    id v8 = [(PUCarouselSharingViewController *)self _livePhotoViewLoaderBlocks];
    [v8 removeAllObjects];

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke;
    aBlock[3] = &unk_1E5F2E530;
    objc_copyWeak(&v16, &location);
    BOOL v9 = _Block_copy(aBlock);
    if ([v4 count] || objc_msgSend(v7, "count"))
    {
      objc_copyWeak(&v14, &location);
      id v11 = v4;
      id v12 = v7;
      id v13 = v9;
      px_dispatch_on_main_queue();

      objc_destroyWeak(&v14);
    }
    else
    {
      id v10 = v9;
      px_dispatch_on_main_queue();
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playVitalityHintAfterViewDidAppear];
}

void __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v3 = [WeakRetained _appearState];

  if (v3 == 2)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v6);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  }
}

uint64_t __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_playVitalityHintAfterViewDidAppear
{
  if (self->_shouldPlayVitalityHintAfterViewDidAppear
    && [(PUCarouselSharingViewController *)self _appearState] == 2)
  {
    self->_shouldPlayVitalityHintAfterViewDidAppear = 0;
    id v3 = [(PUCarouselSharingViewController *)self _lastKnownReferenceIndexPath];
    [(PUCarouselSharingViewController *)self _playLivePhotoHintIfNeededAtIndexPath:v3];
  }
}

- (id)assetsInAssetCollection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v5) {
      goto LABEL_17;
    }
  }
  else
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCarouselSharingViewController.m", 657, @"%s must be called on the main thread", "-[PUCarouselSharingViewController assetsInAssetCollection:]");

    if (!v5) {
      goto LABEL_17;
    }
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_resultsForAssetCollection objectForKey:v5];
  if (v6) {
    goto LABEL_18;
  }
  uint64_t v7 = PLShareSheetGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = [v5 assetCollectionType];
    uint64_t v11 = [v5 assetCollectionSubtype];
    uint64_t v12 = [v5 uuid];
    *(_DWORD *)buf = 138413314;
    id v35 = v8;
    __int16 v36 = 2048;
    uint64_t v37 = self;
    __int16 v38 = 2048;
    uint64_t v39 = v10;
    __int16 v40 = 2048;
    uint64_t v41 = v11;
    __int16 v42 = 2114;
    double v43 = v12;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "<%@:%p>: no cached assets for assetCollection: assetCollectionType=%ld/%ld, uuid=%{public}@", buf, 0x34u);
  }
  uint64_t v13 = [(PUCarouselSharingViewController *)self photosDataSource];
  uint64_t v14 = [v13 sectionForAssetCollection:v5];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v15 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v5];
    uint64_t v6 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v15];
    long long v16 = PLShareSheetGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = objc_opt_class();
      id v18 = v17;
      uint64_t v19 = [v6 count];
      *(_DWORD *)buf = 138412802;
      id v35 = v17;
      __int16 v36 = 2048;
      uint64_t v37 = self;
      __int16 v38 = 2048;
      uint64_t v39 = v19;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "<%@:%p>: will use [PHAsset fetchAssetsInAssetCollection:options] - %lu", buf, 0x20u);
    }
  }
  else
  {
    long long v20 = [(PUCarouselSharingViewController *)self photosDataSource];
    long long v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v14];
    [v20 forceAccurateSectionsIfNeeded:v21];

    uint64_t v22 = [(PUCarouselSharingViewController *)self photosDataSource];
    uint64_t v6 = [v22 assetsInSection:v14];

    long long v15 = PLShareSheetGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = objc_opt_class();
      id v24 = v23;
      uint64_t v25 = [v6 count];
      *(_DWORD *)buf = 138412802;
      id v35 = v23;
      __int16 v36 = 2048;
      uint64_t v37 = self;
      __int16 v38 = 2048;
      uint64_t v39 = v25;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "<%@:%p>: will use [self.photosDataSource assetsInSection:] - %lu", buf, 0x20u);
    }
  }

  if (v6)
  {
    [(NSMutableDictionary *)self->_resultsForAssetCollection setObject:v6 forKey:v5];
    goto LABEL_18;
  }
  uint64_t v26 = PLShareSheetGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    double v27 = objc_opt_class();
    id v28 = v27;
    uint64_t v29 = [v5 assetCollectionType];
    uint64_t v30 = [v5 assetCollectionSubtype];
    double v31 = [v5 uuid];
    *(_DWORD *)buf = 138413314;
    id v35 = v27;
    __int16 v36 = 2048;
    uint64_t v37 = self;
    __int16 v38 = 2048;
    uint64_t v39 = v29;
    __int16 v40 = 2048;
    uint64_t v41 = v30;
    __int16 v42 = 2114;
    double v43 = v31;
    _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_ERROR, "<%@:%p>: fetched assets are nil for assetCollection: assetCollectionType=%ld/%ld, uuid=%{public}@", buf, 0x34u);
  }
LABEL_17:
  uint64_t v6 = 0;
LABEL_18:

  return v6;
}

- (PHFetchResult)assetCollectionsFetchResult
{
  return self->_photoCollectionsFetchResult;
}

- (void)_updateVisibleCellBadges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(UICollectionView *)self->_mainCollectionView indexPathsForVisibleItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(UICollectionView *)self->_mainCollectionView supplementaryViewForElementKind:@"PUPhotosSharingOptionBadgeKind" atIndexPath:v8];
        if (v9) {
          [(PUCarouselSharingViewController *)self _updateOptionView:v9 atIndexPath:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateAdditionalContentForVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(UICollectionView *)self->_mainCollectionView indexPathsForVisibleItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [(UICollectionView *)self->_mainCollectionView cellForItemAtIndexPath:v8];
        if (v9)
        {
          long long v10 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v8 section]);
          long long v11 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v10];
          long long v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v8, "item"));
          [(PUCarouselSharingViewController *)self _updateAdditionalContentForAsset:v12 cell:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_updateVisibleCells
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(UICollectionView *)self->_mainCollectionView indexPathsForVisibleItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(UICollectionView *)self->_mainCollectionView cellForItemAtIndexPath:v8];
        if (v9) {
          [(PUCarouselSharingViewController *)self _updateCell:v9 forItemAtIndexPath:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_indexPathOfAsset:(id)a3 sectionHint:(int64_t)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy__71877;
  id v24 = __Block_byref_object_dispose__71878;
  id v25 = 0;
  if (v6)
  {
    uint64_t v7 = [(PUCarouselSharingViewController *)self photoCollectionsFetchResult];
    uint64_t v8 = v7;
    if ((a4 & 0x8000000000000000) == 0 && [v7 count] > (unint64_t)a4)
    {
      id v9 = [v8 objectAtIndex:a4];
      long long v10 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v9];

      uint64_t v11 = [v10 indexOfObject:v6];
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:a4];
        long long v13 = (void *)v21[5];
        v21[5] = v12;
      }
    }
    if (!v21[5])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__PUCarouselSharingViewController__indexPathOfAsset_sectionHint___block_invoke;
      v17[3] = &unk_1E5F2AF00;
      v17[4] = self;
      id v18 = v6;
      uint64_t v19 = &v20;
      [v8 enumerateObjectsUsingBlock:v17];
    }
    long long v14 = (void *)v21[5];
  }
  else
  {
    long long v14 = 0;
  }
  id v15 = v14;
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __65__PUCarouselSharingViewController__indexPathOfAsset_sectionHint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) assetsInAssetCollection:a2];
  uint64_t v8 = [v7 indexOfObject:*(void *)(a1 + 40)];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:a3];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (id)_assetAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 section];
  if (v6 >= [(PUCarouselSharingViewController *)self _numberOfSections])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [v5 section];
    int64_t v14 = [(PUCarouselSharingViewController *)self _numberOfSections];
    id v15 = [(PUCarouselSharingViewController *)self photoCollectionsFetchResult];
    [v12 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 580, @"Out-of-bounds section %li/%li - sections: %@ ", v13, v14, v15 object file lineNumber description];
  }
  uint64_t v7 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v5 section]);
  uint64_t v8 = [v5 item];
  if (v8 >= -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", [v5 section]))
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = [v5 item];
    int64_t v17 = -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", [v5 section]);
    uint64_t v18 = [v5 section];
    uint64_t v19 = [v7 assetCollectionType];
    uint64_t v20 = [v7 assetCollectionSubtype];
    long long v21 = [v7 uuid];
    [v16 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 587, @"Out-of-bounds item %li/%li from section %li - assetCollectionType=%ld/%ld, uuid=%@", v22, v17, v18, v19, v20, v21 object file lineNumber description];
  }
  uint64_t v9 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v7];
  uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "item"));

  return v10;
}

- (id)_photoCollectionAtIndex:(int64_t)a3
{
  uint64_t v4 = [(PUCarouselSharingViewController *)self photoCollectionsFetchResult];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (unint64_t)_indexForPhotoCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCarouselSharingViewController *)self photoCollectionsFetchResult];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(PUCarouselSharingViewController *)self _photoCollectionAtIndex:a3];
  id v5 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v4];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)_numberOfSections
{
  double v2 = [(PUCarouselSharingViewController *)self photoCollectionsFetchResult];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)_indexPathInCollectionView:(id)a3 closestToContentOffsetX:(double)a4
{
  id v6 = a3;
  [(PUCarouselSharingViewController *)self _collectionViewContentFrame];
  double width = v32.size.width;
  double MidY = CGRectGetMidY(v32);
  objc_msgSend(v6, "indexPathForItemAtPoint:", a4, MidY);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9) {
    goto LABEL_21;
  }
  uint64_t v10 = [(PUCarouselSharingViewController *)self spec];
  [v10 interItemSpacingForWidth:width];
  double v12 = v11;

  uint64_t v13 = objc_msgSend(v6, "indexPathForItemAtPoint:", a4 - v12, MidY);
  uint64_t v14 = objc_msgSend(v6, "indexPathForItemAtPoint:", v12 + a4, MidY);
  id v15 = (void *)v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    uint64_t v19 = [v6 cellForItemAtIndexPath:v13];
    uint64_t v20 = [v6 cellForItemAtIndexPath:v15];
    [v19 frame];
    double v25 = a4 - CGRectGetMaxX(*(CGRect *)&v21);
    if (v25 >= 0.0) {
      double v26 = v25;
    }
    else {
      double v26 = -v25;
    }
    [v20 frame];
    double v27 = a4 - CGRectGetMinX(v33);
    if (v27 < 0.0) {
      double v27 = -v27;
    }
    if (v26 >= v27) {
      id v28 = v15;
    }
    else {
      id v28 = v13;
    }
    id v9 = v28;

LABEL_21:
    uint64_t v18 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v9];
    if ([(PUCarouselSharingViewController *)self _shouldShowAsset:v18]) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v13) {
    int64_t v17 = v13;
  }
  else {
    int64_t v17 = (void *)v14;
  }
  id v9 = v17;

  if (v9) {
    goto LABEL_21;
  }
  uint64_t v18 = 0;
LABEL_22:
  uint64_t v29 = -[PUCarouselSharingViewController _indexPathInCollectionView:closestToPoint:](self, "_indexPathInCollectionView:closestToPoint:", v6, a4, MidY);

  id v9 = (id)v29;
LABEL_23:

  return v9;
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  if (!v8)
  {
    id v9 = [v7 visibleCells];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v8 = 0;
      uint64_t v12 = *(void *)v24;
      double v13 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          BOOL v16 = [v7 indexPathForCell:v15];
          int64_t v17 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:v16];
          if ([(PUCarouselSharingViewController *)self _shouldShowAsset:v17])
          {
            [v15 center];
            double v20 = (v19 - y) * (v19 - y) + (v18 - x) * (v18 - x);
            if (v20 < v13)
            {
              id v21 = v16;

              double v13 = v20;
              uint64_t v8 = v21;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (id)_indexPathOfCenterVisibleItemInCollectionView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  id v5 = [(PUCarouselSharingViewController *)self _indexPathInCollectionView:v4 closestToContentOffsetX:CGRectGetMidX(v8)];

  return v5;
}

- (void)_pageToIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = [(PUCarouselSharingViewController *)self mainCollectionView];
  [v11 contentOffset];
  double v8 = v7;
  [(PUCarouselSharingViewController *)self _horizontalOffsetInCollectionView:v11 forCenteringOnItemAtIndexPath:v6];
  double v10 = v9;

  objc_msgSend(v11, "setContentOffset:animated:", v4, v10, v8);
}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"PUCarouselSharingViewController.m" lineNumber:459 description:@"expected cell"];
  }
  double v9 = -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", [v8 section]);
  double v10 = [(PUCarouselSharingViewController *)self assetsInAssetCollection:v9];
  id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v8, "item"));
  double v12 = (double)(unint64_t)[v11 pixelWidth];
  double v13 = (double)(unint64_t)[v11 pixelHeight];
  uint64_t v14 = [v7 photoView];
  id v15 = [v14 contentHelper];

  [v15 setPreferredImageDynamicRange:0];
  objc_msgSend(v15, "setPhotoSize:", v12, v13);
  [v15 setFillMode:1];
  [v15 setCornerRadius:8.0];
  BOOL v16 = [(PUCarouselSharingViewController *)self spec];
  [v16 selectionBadgeOffset];
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v15, "setCustomPaddingForBadgeElements:", v18, v20);
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = [(PUCarouselSharingViewController *)self _badgeManager];
  uint64_t v22 = v21;
  if (v21)
  {
    [v21 badgeInfoForAsset:v11 inCollection:v9 options:8];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }

  v29[0] = v30;
  v29[1] = v31;
  [v15 setBadgeInfo:v29];
  long long v23 = [(PUCarouselSharingViewController *)self photoSelectionManager];
  uint64_t v24 = objc_msgSend(v23, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v8, "item"), v9);

  [v7 setSelected:v24];
  [v15 setDelegate:self];
  [(PUCarouselSharingViewController *)self _updatePhotoForAsset:v11 cell:v7 atIndexPath:v8];
  [(PUCarouselSharingViewController *)self _updateAdditionalContentForAsset:v11 cell:v7];
  long long v25 = [(PUCarouselSharingViewController *)self _activityAssetItemForAsset:v11 createIfNecessary:0];
  long long v26 = v25;
  if (v25) {
    uint64_t v27 = [v25 excludeLiveness];
  }
  else {
    uint64_t v27 = 0;
  }
  [v15 setLivePhotoHidden:v27];
}

- (void)_handleAnimatedImageResult:(id)a3 forCell:(id)a4 asset:(id)a5 tag:(int64_t)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 tag] == a6)
  {
    id v11 = [v9 photoView];
    double v12 = [v11 contentHelper];

    [v12 setAnimatedImage:v13];
  }
}

- (void)_handleLoopingVideoRequestResult:(id)a3 forCell:(id)a4 asset:(id)a5 tag:(int64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10
    && [v10 tag] == a6
    && [(PUCarouselSharingViewController *)self _isLoopingPlaybackAllowed])
  {
    double v12 = [v10 photoView];
    id v13 = [v12 contentHelper];

    [v13 setLoopingVideoAsset:v14];
  }
}

- (void)_handleLivePhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9 && [v9 tag] == a5)
  {
    id v11 = [(PUCarouselSharingViewController *)self sharingLog];
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "displayLivePhoto", "", buf, 2u);
    }

    double v12 = [v10 photoView];
    id v13 = [v12 contentHelper];
    [v13 setShowsLivePhoto:1];

    BOOL v14 = [(PUScrollViewSpeedometer *)self->_speedometer regime] != 3;
    id v15 = [v10 photoView];
    BOOL v16 = [v15 contentHelper];

    [v16 setShouldPrepareForPlayback:v14];
    [v16 setLivePhoto:v8];
    double v17 = [(PUCarouselSharingViewController *)self sharingLog];
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)double v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "displayLivePhoto", "", v18, 2u);
    }
  }
}

- (void)_handleSchedulingLivePhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PUCarouselSharingViewController *)self isReadyForInteraction])
  {
    [(PUCarouselSharingViewController *)self _handleLivePhotoRequestResult:v8 forCell:v9 tag:a5];
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PUCarouselSharingViewController__handleSchedulingLivePhotoRequestResult_forCell_tag___block_invoke;
    aBlock[3] = &unk_1E5F2AEB0;
    objc_copyWeak(v16, &location);
    id v14 = v8;
    id v15 = v9;
    v16[1] = (id)a5;
    id v10 = _Block_copy(aBlock);
    id v11 = [(PUCarouselSharingViewController *)self _livePhotoViewLoaderBlocks];
    double v12 = _Block_copy(v10);
    [v11 addObject:v12];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __87__PUCarouselSharingViewController__handleSchedulingLivePhotoRequestResult_forCell_tag___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleLivePhotoRequestResult:*(void *)(a1 + 32) forCell:*(void *)(a1 + 40) tag:*(void *)(a1 + 56)];
}

- (void)_handleStillPhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v15 = a3;
  id v7 = a4;
  if ([v7 tag] == a5)
  {
    id v8 = [v7 photoView];
    id v9 = [v8 contentHelper];

    id v10 = [v9 placeHolderImage];
    int v11 = [v10 isHighDynamicRange];

    if (v11)
    {
      double v12 = +[PUOneUpSettings sharedInstance];
      [v12 hdrShareSheetCrossfadeAnimationDuration];
      double v14 = v13;

      [v9 animateCrossfadeToImage:v15 duration:v14];
    }
    else
    {
      [v9 setPhotoImage:v15];
    }
  }
}

- (void)_handleSchedulingStillPhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PUCarouselSharingViewController *)self isReadyForInteraction])
  {
    [(PUCarouselSharingViewController *)self _handleStillPhotoRequestResult:v8 forCell:v9 tag:a5];
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PUCarouselSharingViewController__handleSchedulingStillPhotoRequestResult_forCell_tag___block_invoke;
    aBlock[3] = &unk_1E5F2AEB0;
    objc_copyWeak(v16, &location);
    id v14 = v8;
    id v15 = v9;
    v16[1] = (id)a5;
    id v10 = _Block_copy(aBlock);
    int v11 = [(PUCarouselSharingViewController *)self _photoViewLoaderBlocks];
    double v12 = _Block_copy(v10);
    [v11 addObject:v12];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __88__PUCarouselSharingViewController__handleSchedulingStillPhotoRequestResult_forCell_tag___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleStillPhotoRequestResult:*(void *)(a1 + 32) forCell:*(void *)(a1 + 40) tag:*(void *)(a1 + 56)];
}

- (void)_updateAdditionalContentForAsset:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v7 tag];
  if ([v6 playbackStyle] != 5)
  {
    BOOL v10 = [v6 playbackStyle] == 2;
LABEL_5:
    if ([v6 playbackStyle] == 3)
    {
      int v11 = [v6 canPlayPhotoIris];
      int v12 = 0;
    }
    else
    {
      int v12 = 0;
      int v11 = 0;
    }
    goto LABEL_8;
  }
  BOOL v9 = [(PUCarouselSharingViewController *)self _isLoopingPlaybackAllowed];
  BOOL v10 = [v6 playbackStyle] == 2;
  if (!v9) {
    goto LABEL_5;
  }
  int v11 = 0;
  int v12 = 1;
LABEL_8:
  BOOL v13 = [(PUCarouselSharingViewController *)self _isLoopingPlaybackAllowed];
  id v14 = [v7 photoView];
  id v15 = [v14 contentHelper];
  [v15 setLoopingPlaybackAllowed:v13];

  if (v12)
  {
    BOOL v16 = [(PUCarouselSharingViewController *)self cachingImageManager];
    id v17 = objc_alloc_init(MEMORY[0x1E4F39348]);
    [v17 setNetworkAccessAllowed:1];
    [v17 setVideoComplementAllowed:1];
    objc_initWeak(location, self);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke;
    v40[3] = &unk_1E5F2AE60;
    objc_copyWeak(v43, location);
    id v41 = v7;
    id v42 = v6;
    v43[1] = v8;
    [v16 requestAVAssetForVideo:v42 options:v17 resultHandler:v40];

    objc_destroyWeak(v43);
    objc_destroyWeak(location);
  }
  else
  {
    double v18 = [v7 photoView];
    double v19 = [v18 contentHelper];

    [v19 setLoopingVideoAsset:0];
  }
  double v20 = [v7 photoView];
  id v21 = [v20 contentHelper];

  if (v10)
  {
    if ([(PUCarouselSharingViewController *)self _isLoopingPlaybackAllowed])
    {
      uint64_t v22 = [v21 animatedImage];

      if (!v22)
      {
        long long v23 = [(PUCarouselSharingViewController *)self cachingImageManager];
        id v24 = objc_alloc_init(MEMORY[0x1E4F390D8]);
        [v24 setVersion:2];
        [v24 setNetworkAccessAllowed:0];
        objc_initWeak(location, self);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_3;
        v36[3] = &unk_1E5F2AE88;
        objc_copyWeak(v39, location);
        id v37 = v7;
        id v38 = v6;
        v39[1] = v8;
        [v23 requestAnimatedImageForAsset:v38 options:v24 resultHandler:v36];

        objc_destroyWeak(v39);
        objc_destroyWeak(location);
      }
    }
  }
  else
  {
    [v21 setAnimatedImage:0];
  }

  long long v25 = [v7 photoView];
  long long v26 = [v25 contentHelper];
  id v27 = v26;
  if (!v11)
  {
    [v26 setShowsLivePhoto:0];
    goto LABEL_22;
  }
  uint64_t v28 = [v26 livePhoto];

  if (!v28)
  {
    long long v25 = [(PUCarouselSharingViewController *)self cachingImageManager];
    [v7 frame];
    double v31 = PUPixelSizeFromPointSize(v29);
    double v32 = v30;
    if (v31 == *MEMORY[0x1E4F1DB30] && v30 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      goto LABEL_23;
    }
    id v27 = objc_alloc_init(MEMORY[0x1E4F39148]);
    [v27 setDeliveryMode:1];
    objc_initWeak(location, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_241;
    v33[3] = &unk_1E5F2AED8;
    objc_copyWeak(v35, location);
    id v34 = v7;
    v35[1] = v8;
    objc_msgSend(v25, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v6, 0, v27, v33, v31, v32);

    objc_destroyWeak(v35);
    objc_destroyWeak(location);
LABEL_22:

LABEL_23:
  }
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_copyWeak(v13, a1 + 6);
  id v10 = v7;
  id v11 = a1[4];
  id v12 = a1[5];
  v13[1] = a1[7];
  px_dispatch_on_main_queue();

  objc_destroyWeak(v13);
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_copyWeak(v13, a1 + 6);
    id v10 = v5;
    id v11 = a1[4];
    id v12 = a1[5];
    v13[1] = a1[7];
    px_dispatch_on_main_queue();

    objc_destroyWeak(v13);
  }
  else
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
      id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      *(_DWORD *)buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Did not load animated image for playback in the share sheet. In cloud = %@. Error = %@", buf, 0x16u);
    }
  }
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_241(id *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_copyWeak(v12, a1 + 5);
    id v10 = v5;
    id v11 = a1[4];
    v12[1] = a1[6];
    px_dispatch_on_main_queue();

    objc_destroyWeak(v12);
  }
  else
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
      id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Did not load live photo for playback in the share sheet. In cloud = %@. Error = %@", buf, 0x16u);
    }
  }
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_2_242(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleSchedulingLivePhotoRequestResult:*(void *)(a1 + 32) forCell:*(void *)(a1 + 40) tag:*(void *)(a1 + 56)];
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAnimatedImageResult:*(void *)(a1 + 32) forCell:*(void *)(a1 + 40) asset:*(void *)(a1 + 48) tag:*(void *)(a1 + 64)];
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleLoopingVideoRequestResult:*(void *)(a1 + 32) forCell:*(void *)(a1 + 40) asset:*(void *)(a1 + 48) tag:*(void *)(a1 + 64)];
}

- (void)_handleStillImageRequestResult:(id)a3 info:(id)a4 forCell:(id)a5 indexPath:(id)a6
{
  id v21 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v14 = [v10 photoView];
    __int16 v15 = [v14 contentHelper];

    __int16 v16 = [v15 placeHolderImage];
    if (!v16)
    {
      uint64_t v17 = [(PUCarouselSharingViewController *)self currentIndexPath];
      int v18 = [v17 isEqual:v11];

      if (v18)
      {
        double v19 = [(PUCarouselSharingViewController *)self assetTransitionInfo];
        double v20 = [v19 image];

        if (v20) {
          [v15 setPlaceHolderImage:v20];
        }
        else {
          [v15 setPhotoImage:v21];
        }
      }
      else
      {
        [v15 setPhotoImage:v21];
      }
    }
  }
  else
  {
    -[PUCarouselSharingViewController _handleSchedulingStillPhotoRequestResult:forCell:tag:](self, "_handleSchedulingStillPhotoRequestResult:forCell:tag:", v21, v10, [v10 tag]);
  }
}

- (void)_updatePhotoForAsset:(id)a3 cell:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)([v9 tag] + 1);
  [v9 setTag:v11];
  id v12 = objc_opt_new();
  [v12 setNetworkAccessAllowed:1];
  [v9 frame];
  double v14 = PUPixelSizeFromPointSize(v13);
  double v16 = v15;
  objc_initWeak(&location, self);
  uint64_t v17 = [(PUCarouselSharingViewController *)self cachingImageManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__PUCarouselSharingViewController__updatePhotoForAsset_cell_atIndexPath___block_invoke;
  v21[3] = &unk_1E5F2AE38;
  id v18 = v9;
  id v22 = v18;
  v24[1] = v11;
  objc_copyWeak(v24, &location);
  id v19 = v10;
  id v23 = v19;
  int v20 = objc_msgSend(v17, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v12, v21, v14, v16);

  [v18 setCurrentImageRequestID:v20];
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
}

void __73__PUCarouselSharingViewController__updatePhotoForAsset_cell_atIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && [*(id *)(a1 + 32) tag] == *(void *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleStillImageRequestResult:v7 info:v5 forCell:*(void *)(a1 + 32) indexPath:*(void *)(a1 + 40)];
  }
}

- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = [v5 layoutAttributesForItemAtIndexPath:a4];
  [v6 center];
  double v8 = v7;
  [v5 bounds];
  double v10 = v9;

  return round(v8 + v10 * -0.5);
}

- (CGSize)_sizeForItemAtIndexPath:(id)a3
{
  BOOL v4 = [(PUCarouselSharingViewController *)self _assetAtIndexPath:a3];
  if ([(PUCarouselSharingViewController *)self _shouldShowAsset:v4])
  {
    [(PUCarouselSharingViewController *)self _collectionViewContentFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [v4 pixelWidth];
    unint64_t v14 = [v4 pixelHeight];
    double v15 = [(PUCarouselSharingViewController *)self spec];
    [v15 interItemSpacingForWidth:v10];
    double v17 = v16;

    [(PUCarouselSharingViewController *)self px_safeAreaInsets];
    CGFloat v19 = v8 + v18;
    CGFloat v22 = v10 - (v20 + v21);
    v50.size.double height = v12 - (v18 + v23);
    v50.origin.double x = v6 + v20;
    v50.origin.double y = v19;
    v50.size.double width = v22;
    double v24 = CGRectGetWidth(v50) + v17 * -4.0;
    long long v25 = [(PUCarouselSharingViewController *)self spec];
    [v25 selectionBadgeSize];
    double v27 = v26;
    uint64_t v28 = [(PUCarouselSharingViewController *)self spec];
    [v28 selectionBadgeOffset];
    double v30 = v27 + v29 * 2.0;

    if (v13) {
      BOOL v31 = v14 == 0;
    }
    else {
      BOOL v31 = 1;
    }
    int v32 = v31;
    if (v24 >= v12) {
      double v33 = v12;
    }
    else {
      double v33 = v24;
    }
    if (v32) {
      double v34 = v33;
    }
    else {
      double v34 = (double)v14;
    }
    if (v32) {
      double v35 = v33;
    }
    else {
      double v35 = (double)v13;
    }
    __int16 v36 = [(PUCarouselSharingViewController *)self spec];
    id v37 = [(PUCarouselSharingViewController *)self _existingView];
    [v37 bounds];
    int v38 = objc_msgSend(v36, "maximizeImageHeightForBounds:");

    if (v38)
    {
      double v39 = v12 * v35 / v34;
      if (v39 < v30) {
        double v39 = v30;
      }
      if (v24 < v39) {
        double v39 = v24;
      }
    }
    else
    {
      PURectWithSizeThatFitsInRect(v35, v34, 0.0, 0.0, v24, v12);
      if (v43 < v30 && v34 < v35)
      {
        double v42 = v42 * (v30 / v43);
        double v43 = v30;
      }
      if (v42 < v30 && v35 < v34)
      {
        double v43 = v43 * (v30 / v42);
        double v42 = v30;
      }
      if (v42 >= v30) {
        double v39 = v42;
      }
      else {
        double v39 = v30;
      }
      if (v24 < v39) {
        double v39 = v24;
      }
      if (v43 >= v30) {
        double v46 = v43;
      }
      else {
        double v46 = v30;
      }
      if (v12 >= v46) {
        double v12 = v46;
      }
    }
    double v41 = round(v39);
    double v40 = round(v12);
  }
  else
  {
    double v41 = *MEMORY[0x1E4F1DB30];
    double v40 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v47 = v41;
  double v48 = v40;
  result.double height = v48;
  result.double width = v47;
  return result;
}

- (void)_getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4
{
  uint64_t v7 = [(PUCarouselSharingViewController *)self _numberOfSections];
  uint64_t v8 = v7 - 1;
  if (v7 < 1)
  {
    id v13 = 0;
    double v10 = 0;
    if (a3) {
LABEL_13:
    }
      *a3 = v13;
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = 0;
    id v13 = 0;
    do
    {
      if (v13 && v10) {
        break;
      }
      int64_t v11 = [(PUCarouselSharingViewController *)self _numberOfItemsInSection:v9];
      if (!v13 && v11)
      {
        id v13 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v9];
      }
      int64_t v12 = [(PUCarouselSharingViewController *)self _numberOfItemsInSection:v8];
      if (v12 && !v10)
      {
        double v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 - 1 inSection:v8];
      }
      ++v9;
      --v8;
    }
    while (v8 != -1);
    if (a3) {
      goto LABEL_13;
    }
  }
  if (a4) {
    *a4 = v10;
  }
}

- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  [(PUCarouselSharingViewController *)self _resetPreheating];
  BOOL v4 = [(PUCarouselSharingViewController *)self mainCollectionView];
  [v4 reloadData];

  [(PUCarouselSharingViewController *)self _setViewInSyncWithModel:1];
}

- (BOOL)_shouldShowAsset:(id)a3
{
  return [a3 canPerformSharingAction];
}

- (void)_setLastKnownReferenceIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  p_lastKnownReferenceIndexPath = &self->__lastKnownReferenceIndexPath;
  if (*p_lastKnownReferenceIndexPath != v5)
  {
    uint64_t v8 = v5;
    char v7 = [(NSIndexPath *)*p_lastKnownReferenceIndexPath isEqual:v5];
    double v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)p_lastKnownReferenceIndexPath, a3);
      double v5 = v8;
    }
  }
}

- (NSMutableSet)analyticsEventsSent
{
  analyticsEventsSent = self->_analyticsEventsSent;
  if (!analyticsEventsSent)
  {
    BOOL v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v5 = self->_analyticsEventsSent;
    self->_analyticsEventsSent = v4;

    analyticsEventsSent = self->_analyticsEventsSent;
  }
  return analyticsEventsSent;
}

- (void)dealloc
{
  int64_t v3 = [(PHFetchResult *)self->_photoCollectionsFetchResult photoLibrary];
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)PUCarouselSharingViewController;
  [(PUCarouselSharingViewController *)&v5 dealloc];
}

- (PUCarouselSharingViewController)initWithPhotoCollectionsFetchResult:(id)a3 assetsFetchResultsByAssetCollection:(id)a4 selection:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 123, @"Invalid parameter not satisfying: %@", @"photoCollectionsFetchResult" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  double v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PUCarouselSharingViewController.m", 124, @"Invalid parameter not satisfying: %@", @"selection" object file lineNumber description];

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)PUCarouselSharingViewController;
  unint64_t v14 = [(PUCarouselSharingViewController *)&v35 init];
  if (v14)
  {
    double v15 = objc_alloc_init(PUPhotosSharingViewControllerSpec);
    spec = v14->_spec;
    v14->_spec = v15;

    objc_storeStrong((id *)&v14->_photoCollectionsFetchResult, a3);
    objc_storeStrong((id *)&v14->_photoSelectionManager, a5);
    if (v11)
    {
      double v17 = (void *)[v11 mutableCopy];
    }
    else
    {
      double v17 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    double v18 = v17;
    objc_storeStrong((id *)&v14->_resultsForAssetCollection, v17);

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    assetItemsByAssetIdentifier = v14->_assetItemsByAssetIdentifier;
    v14->_assetItemsByAssetIdentifier = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    indexPathsByOptionView = v14->_indexPathsByOptionView;
    v14->_indexPathsByOptionView = (NSMapTable *)v21;

    v14->_shouldScrollToSelection = 1;
    uint64_t v23 = objc_opt_new();
    cachingImageManager = v14->_cachingImageManager;
    v14->_cachingImageManager = (PHCachingImageManager *)v23;

    v14->_shouldPlayVitalityHintAfterViewDidAppear = 0;
    [(PUCarouselSharingViewController *)v14 setExtendedLayoutIncludesOpaqueBars:1];
    long long v25 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E4F8FFC8]);
    badgeManager = v14->__badgeManager;
    v14->__badgeManager = v25;

    double v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    photoViewLoaderBlocks = v14->__photoViewLoaderBlocks;
    v14->__photoViewLoaderBlocks = v27;

    double v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    livePhotoViewLoaderBlocks = v14->__livePhotoViewLoaderBlocks;
    v14->__livePhotoViewLoaderBlocks = v29;

    v14->_readyForInteraction = 1;
    BOOL v31 = [v10 photoLibrary];
    objc_msgSend(v31, "px_registerChangeObserver:", v14);
  }
  return v14;
}

@end