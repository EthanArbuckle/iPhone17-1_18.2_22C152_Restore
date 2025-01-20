@interface PUAvalancheReviewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_completingReviewMode;
- (BOOL)_updatingContentOffsetFromScrubbing;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pu_wantsNavigationBarVisible;
- (BOOL)pu_wantsTabBarVisible;
- (BOOL)pu_wantsToolbarVisible;
- (BOOL)reviewScrubber:(id)a3 shouldProvideFeedbackForCellAtIndexPath:(id)a4;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CGRect)_frameAtIndexPath:(id)a3 inView:(id)a4;
- (CGRect)_previousPreheatRect;
- (CGRect)embeddedActivityViewFrameWhenShowing:(BOOL)a3;
- (CGRect)layout:(id)a3 collectionView:(id)a4 selectionBadgeFrameForItemFrame:(CGRect)a5 atIndexPath:(id)a6;
- (CGRect)oneUpAssetTransitionAssetFinalFrame:(id)a3;
- (CGRect)selectionBadgeFrameForItemFrame:(CGRect)a3 atIndexPath:(id)a4;
- (CGSize)_sizeForItemAtIndexPath:(id)a3;
- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSIndexPath)_inFlightReferenceIndexPath;
- (NSMutableDictionary)_assetsToSizeDictionary;
- (NSMutableSet)_preheatedAssets;
- (NSOrderedSet)_initialFavorites;
- (PHCachingImageManager)_cachingImageManager;
- (PHFetchResult)assetCollectionsFetchResult;
- (PLAssetContainer)_currentAssetContainer;
- (PLAssetContainerList)avalancheContainerList;
- (PLAvalanche)_avalancheBeingReviewed;
- (PLManagedAsset)_initialAsset;
- (PUAssetTransitionInfo)_assetTransitionInfo;
- (PUAvalancheReviewCollectionViewLayout)_collectionViewLayout;
- (PUAvalancheReviewController)init;
- (PUAvalancheReviewController)initWithCoder:(id)a3;
- (PUAvalancheReviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUAvalancheReviewController)initWithSpec:(id)a3 startingAtAsset:(id)a4 inAvalanche:(id)a5 currentAssetContainer:(id)a6 photoLibrary:(id)a7;
- (PUAvalancheReviewControllerDelegate)delegate;
- (PUAvalancheReviewControllerSpec)_spec;
- (PUPhotoPinchGestureRecognizer)_photoZoomPinchGestureRecognizer;
- (PUPhotosSharingTransitionContext)_photosSharingTransitionContext;
- (PUPhotosZoomingSharingGridCell)_photoZoomCell;
- (PUReviewScrubber)_reviewScrubber;
- (PUTransitionViewAnimator)_photoZoomAnimator;
- (UIBarButtonItem)_cancelBarButtonItem;
- (UIBarButtonItem)_doneBarButtonItem;
- (UICollectionView)_collectionView;
- (UICollectionViewLayout)_transitionLayout;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4;
- (id)_assetAtIndexPath:(id)a3;
- (id)_currentAsset;
- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5;
- (id)_indexPathOfCenterVisibleItemInCollectionView:(id)a3;
- (id)_phAssetAtIndexPath:(id)a3;
- (id)_selectionViewAtIndexPath:(id)a3 forCollectionView:(id)a4;
- (id)assetsInAssetCollection:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)embeddedActivityView;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)reviewScrubber:(id)a3 numberOfItemsInSection:(unint64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)reviewScrubberImageFormat;
- (void)_beginZoomingForCellAtIndexPath:(id)a3;
- (void)_cancelReviewMode;
- (void)_dismissReviewControllerWithAsset:(id)a3;
- (void)_endZoomingForCell;
- (void)_finishReviewAndDeleteNonPicks:(BOOL)a3;
- (void)_getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4;
- (void)_getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4;
- (void)_handleDoneButton:(id)a3;
- (void)_handlePhotoPinch:(id)a3;
- (void)_handleTapAtIndexPath:(id)a3;
- (void)_handleTapInMainCollectionView:(id)a3;
- (void)_pageToIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_promoteFavoriteAssetsAndDeleteNonPicks:(BOOL)a3 withReviewCompletionHandler:(id)a4;
- (void)_reallyToggleCurrentPickStatusAtIndexPath:(id)a3;
- (void)_reloadAvalancheDataWithAsset:(id)a3;
- (void)_resetPreheating;
- (void)_setAssetsToSizeDictionary:(id)a3;
- (void)_setPhotoZoomAnimator:(id)a3;
- (void)_setPhotoZoomCell:(id)a3;
- (void)_setPhotoZoomPinchGestureRecognizer:(id)a3;
- (void)_setPreheatedAssets:(id)a3;
- (void)_setPreviousPreheatRect:(CGRect)a3;
- (void)_setTransitionLayout:(id)a3;
- (void)_startPreheatingAllAssets;
- (void)_stopPreheatingAllAssets;
- (void)_toggleCurrentPickStatusAtIndexPath:(id)a3;
- (void)_updateBarItemsAnimated:(BOOL)a3;
- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)_updateCollectionViewLayoutInsets;
- (void)_updateEnabledNavigationBarItems;
- (void)_updateMainViewAnimated:(BOOL)a3;
- (void)_updateNavigationItemTitle;
- (void)_updatePhotoForAsset:(id)a3 cell:(id)a4 atIndexPath:(id)a5;
- (void)_updatePreheatedAssets;
- (void)_updateReviewScrubberFromContentOffset;
- (void)dealloc;
- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4;
- (void)reviewScrubber:(id)a3 willDisplayCell:(id)a4 atIndexPath:(id)a5;
- (void)reviewScrubberDidScrub:(id)a3;
- (void)reviewScrubberDidSelectItemAtIndexPath:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDelegate:(id)a3;
- (void)setOneUpPhotosSharingTransitionInfo:(id)a3;
- (void)setPhotosSharingTransitionContext:(id)a3;
- (void)setPhotosSharingTransitionLayout:(id)a3 animated:(BOOL)a4;
- (void)set_assetTransitionInfo:(id)a3;
- (void)set_completingReviewMode:(BOOL)a3;
- (void)set_photosSharingTransitionContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUAvalancheReviewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avalancheContainerList, 0);
  objc_storeStrong((id *)&self->__assetTransitionInfo, 0);
  objc_storeStrong((id *)&self->__photosSharingTransitionContext, 0);
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_storeStrong((id *)&self->__photoZoomCell, 0);
  objc_storeStrong((id *)&self->__photoZoomAnimator, 0);
  objc_storeStrong((id *)&self->__photoZoomPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__assetsToSizeDictionary, 0);
  objc_storeStrong((id *)&self->__preheatedAssets, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->__currentAssetContainer, 0);
  objc_storeStrong((id *)&self->__initialFavorites, 0);
  objc_storeStrong((id *)&self->__initialAsset, 0);
  objc_storeStrong((id *)&self->__avalancheBeingReviewed, 0);
  objc_storeStrong((id *)&self->__inFlightReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->__doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->__collectionViewLayout, 0);
  objc_storeStrong((id *)&self->__collectionView, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_resultsForAssetCollection, 0);
  objc_storeStrong((id *)&self->_assetCollectionsFetchResult, 0);
}

- (PLAssetContainerList)avalancheContainerList
{
  return self->_avalancheContainerList;
}

- (void)set_assetTransitionInfo:(id)a3
{
}

- (PUAssetTransitionInfo)_assetTransitionInfo
{
  return self->__assetTransitionInfo;
}

- (void)set_photosSharingTransitionContext:(id)a3
{
}

- (PUPhotosSharingTransitionContext)_photosSharingTransitionContext
{
  return self->__photosSharingTransitionContext;
}

- (void)_setTransitionLayout:(id)a3
{
}

- (UICollectionViewLayout)_transitionLayout
{
  return self->__transitionLayout;
}

- (void)_setPhotoZoomCell:(id)a3
{
}

- (PUPhotosZoomingSharingGridCell)_photoZoomCell
{
  return self->__photoZoomCell;
}

- (void)_setPhotoZoomAnimator:(id)a3
{
}

- (PUTransitionViewAnimator)_photoZoomAnimator
{
  return self->__photoZoomAnimator;
}

- (void)_setPhotoZoomPinchGestureRecognizer:(id)a3
{
}

- (PUPhotoPinchGestureRecognizer)_photoZoomPinchGestureRecognizer
{
  return self->__photoZoomPinchGestureRecognizer;
}

- (void)_setAssetsToSizeDictionary:(id)a3
{
}

- (NSMutableDictionary)_assetsToSizeDictionary
{
  return self->__assetsToSizeDictionary;
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

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (PLAssetContainer)_currentAssetContainer
{
  return self->__currentAssetContainer;
}

- (NSOrderedSet)_initialFavorites
{
  return self->__initialFavorites;
}

- (PLManagedAsset)_initialAsset
{
  return self->__initialAsset;
}

- (PLAvalanche)_avalancheBeingReviewed
{
  return self->__avalancheBeingReviewed;
}

- (void)set_completingReviewMode:(BOOL)a3
{
  self->__completingReviewMode = a3;
}

- (BOOL)_completingReviewMode
{
  return self->__completingReviewMode;
}

- (BOOL)_updatingContentOffsetFromScrubbing
{
  return self->__updatingContentOffsetFromScrubbing;
}

- (NSIndexPath)_inFlightReferenceIndexPath
{
  return self->__inFlightReferenceIndexPath;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (UIBarButtonItem)_cancelBarButtonItem
{
  return self->__cancelBarButtonItem;
}

- (UIBarButtonItem)_doneBarButtonItem
{
  return self->__doneBarButtonItem;
}

- (PUAvalancheReviewCollectionViewLayout)_collectionViewLayout
{
  return self->__collectionViewLayout;
}

- (UICollectionView)_collectionView
{
  return self->__collectionView;
}

- (PUAvalancheReviewControllerSpec)_spec
{
  return self->__spec;
}

- (void)setDelegate:(id)a3
{
}

- (PUAvalancheReviewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAvalancheReviewControllerDelegate *)WeakRetained;
}

- (void)_updatePreheatedAssets
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v3 = [(PUAvalancheReviewController *)self _collectionView];
  uint64_t v4 = [v3 collectionViewLayout];
  v5 = (void *)v4;
  if (self->__transitionLayout) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    [v3 bounds];
    CGFloat x = v92.origin.x;
    CGFloat y = v92.origin.y;
    double width = v92.size.width;
    double height = v92.size.height;
    if (!CGRectIsEmpty(v92))
    {
      if ((unint64_t)([(PUAvalancheReviewController *)self interfaceOrientation] - 1) >= 2) {
        double v11 = height;
      }
      else {
        double v11 = width;
      }
      [(PUAvalancheReviewController *)self _previousPreheatRect];
      double v13 = v12;
      v93.origin.CGFloat x = x;
      v93.origin.CGFloat y = y;
      v93.size.double width = width;
      v93.size.double height = height;
      CGRect v94 = CGRectInset(v93, v11 * -2.0, 0.0);
      double v14 = v94.origin.x;
      double v15 = v94.origin.y;
      double v16 = v94.origin.x - v13;
      if (v16 < 0.0) {
        double v16 = -v16;
      }
      if (v16 > v11 / 3.0)
      {
        double v17 = v94.size.width;
        double v18 = v94.size.height;
        if ([(PUAvalancheReviewController *)self px_isVisible])
        {
          -[PUAvalancheReviewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", v14, v15, v17, v18);
          v19 = [v3 collectionViewLayout];
          v20 = objc_msgSend(v19, "layoutAttributesForElementsInRect:", v14, v15, v17, v18);

          uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v20, "count"));
          v71 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v22 = v20;
          v23 = (void *)v21;
          obuint64_t j = v22;
          uint64_t v24 = [v22 countByEnumeratingWithState:&v81 objects:v90 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v82;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v82 != v26) {
                  objc_enumerationMutation(obj);
                }
                v28 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                if (![v28 representedElementCategory])
                {
                  v29 = [v28 indexPath];
                  v30 = [(PUAvalancheReviewController *)self _phAssetAtIndexPath:v29];
                  [v23 addObject:v30];
                  [v71 setObject:v29 forKey:v30];
                }
              }
              uint64_t v25 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
            }
            while (v25);
          }

          v31 = [(PUAvalancheReviewController *)self _preheatedAssets];
          [(PUAvalancheReviewController *)self _setPreheatedAssets:v23];
          v32 = (void *)[v23 mutableCopy];
          [v32 minusSet:v31];
          v67 = (void *)[v31 mutableCopy];
          [v67 minusSet:v23];
          if ([v32 count] || objc_msgSend(v67, "count"))
          {
            v63 = v31;
            v65 = v5;
            v66 = v3;
            if (!self->__assetsToSizeDictionary)
            {
              v33 = [MEMORY[0x1E4F1CA60] dictionary];
              [(PUAvalancheReviewController *)self _setAssetsToSizeDictionary:v33];
            }
            v64 = v23;
            v34 = objc_opt_new();
            [v34 setNetworkAccessAllowed:1];
            v72 = v34;
            [v34 setLoadingMode:0x40000];
            v35 = [(PUAvalancheReviewController *)self _cachingImageManager];
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            v62 = v32;
            id v68 = v32;
            uint64_t v36 = [v68 countByEnumeratingWithState:&v77 objects:v89 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v78;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v78 != v38) {
                    objc_enumerationMutation(v68);
                  }
                  uint64_t v40 = *(void *)(*((void *)&v77 + 1) + 8 * j);
                  v41 = objc_msgSend(v71, "objectForKeyedSubscript:", v40, v62);
                  [(PUAvalancheReviewController *)self _sizeForItemAtIndexPath:v41];
                  double v43 = PUPixelSizeFromPointSize(v42);
                  double v45 = v44;
                  uint64_t v88 = v40;
                  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
                  objc_msgSend(v35, "startCachingImagesForAssets:targetSize:contentMode:options:", v46, 0, v72, v43, v45);

                  assetsToSizeDictionarCGFloat y = self->__assetsToSizeDictionary;
                  v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v43, v45);
                  [(NSMutableDictionary *)assetsToSizeDictionary setObject:v48 forKey:v40];
                }
                uint64_t v37 = [v68 countByEnumeratingWithState:&v77 objects:v89 count:16];
              }
              while (v37);
            }

            v49 = objc_opt_new();
            [v49 setNetworkAccessAllowed:1];
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v69 = v67;
            uint64_t v50 = [v69 countByEnumeratingWithState:&v73 objects:v87 count:16];
            if (v50)
            {
              uint64_t v51 = v50;
              uint64_t v52 = *(void *)v74;
              do
              {
                for (uint64_t k = 0; k != v51; ++k)
                {
                  if (*(void *)v74 != v52) {
                    objc_enumerationMutation(v69);
                  }
                  uint64_t v54 = *(void *)(*((void *)&v73 + 1) + 8 * k);
                  v55 = -[NSMutableDictionary objectForKeyedSubscript:](self->__assetsToSizeDictionary, "objectForKeyedSubscript:", v54, v62);
                  [v55 CGSizeValue];
                  double v57 = v56;
                  double v59 = v58;

                  uint64_t v86 = v54;
                  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
                  objc_msgSend(v35, "stopCachingImagesForAssets:targetSize:contentMode:options:", v60, 0, v72, v57, v59);

                  [(NSMutableDictionary *)self->__assetsToSizeDictionary removeObjectForKey:v54];
                  uint64_t v85 = v54;
                  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
                  objc_msgSend(v35, "startCachingImagesForAssets:targetSize:contentMode:options:", v61, 0, v49, v57, v59);
                }
                uint64_t v51 = [v69 countByEnumeratingWithState:&v73 objects:v87 count:16];
              }
              while (v51);
            }

            v5 = v65;
            v3 = v66;
            v31 = v63;
            v23 = v64;
            v32 = v62;
          }
        }
      }
    }
  }
}

- (void)_resetPreheating
{
  [(PUAvalancheReviewController *)self _stopPreheatingAllAssets];
  [(PUAvalancheReviewController *)self _startPreheatingAllAssets];
  -[PUAvalancheReviewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUAvalancheReviewController *)self _setPreheatedAssets:0];
  [(PUAvalancheReviewController *)self _setAssetsToSizeDictionary:0];
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  BOOL v6 = [(PUAvalancheReviewController *)self view];
  [v6 layoutIfNeeded];

  v7 = [(PUAvalancheReviewController *)self _indexPathOfCenterVisibleItemInCollectionView:self->__collectionView];
  v8 = [(UICollectionView *)self->__collectionView cellForItemAtIndexPath:v7];
  v9 = [v8 photoView];
  v10 = [v9 contentHelper];
  double v11 = [v10 photoImage];

  double v12 = [(PUAvalancheReviewController *)self view];
  [(PUAvalancheReviewController *)self _frameAtIndexPath:v7 inView:v12];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v14, v16, v18, v20);
  [v21 setImage:v11];
  id v22 = [MEMORY[0x1E4F90300] sharedInstance];
  [v22 insetContentCornerRadius];
  double v24 = v23;
  uint64_t v25 = [v21 layer];
  [v25 setCornerRadius:v24];

  uint64_t v26 = *MEMORY[0x1E4F39EA8];
  v27 = [v21 layer];
  [v27 setCornerCurve:v26];

  [v21 setClipsToBounds:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __91__PUAvalancheReviewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke;
  v34[3] = &unk_1E5F2D358;
  id v28 = v11;
  id v35 = v28;
  uint64_t v36 = self;
  id v29 = v7;
  id v37 = v29;
  v30 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v34];
  v31 = [(PUAvalancheReviewController *)self view];
  v32 = +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:0 fromView:v31 snapshotView:v21 transitionInfo:v30];

  v33 = [v32 oneUpTransitionContextWithContextShouldHideBackground:1];

  if (v5) {
    v5[2](v5, v33);
  }
}

void __91__PUAvalancheReviewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImage:v3];
  id v5 = [*(id *)(a1 + 40) _phAssetAtIndexPath:*(void *)(a1 + 48)];
  [v4 setAsset:v5];
}

- (CGRect)oneUpAssetTransitionAssetFinalFrame:(id)a3
{
  id v4 = [(PUAvalancheReviewController *)self _collectionView];
  id v5 = [(PUAvalancheReviewController *)self _indexPathOfCenterVisibleItemInCollectionView:v4];

  BOOL v6 = [(PUAvalancheReviewController *)self view];
  [(PUAvalancheReviewController *)self _frameAtIndexPath:v5 inView:v6];
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
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_frameAtIndexPath:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PUAvalancheReviewController *)self _collectionViewLayout];
  double v9 = [v8 layoutAttributesForItemAtIndexPath:v7];

  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(PUAvalancheReviewController *)self _collectionView];
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
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)embeddedActivityViewFrameWhenShowing:(BOOL)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)embeddedActivityView
{
  return 0;
}

- (void)setPhotosSharingTransitionLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v7 = [(PUAvalancheReviewController *)self _transitionLayout];

  double v8 = v12;
  if (v7 != v12)
  {
    objc_storeStrong((id *)&self->__transitionLayout, a3);
    if (v12)
    {
      id v9 = v12;
    }
    else
    {
      id v9 = [(PUAvalancheReviewController *)self _collectionViewLayout];
    }
    double v10 = v9;
    double v11 = [(PUAvalancheReviewController *)self _collectionView];
    [v11 setCollectionViewLayout:v10 animated:v4];

    double v8 = v12;
  }
}

- (void)setOneUpPhotosSharingTransitionInfo:(id)a3
{
  id v12 = (PUAssetTransitionInfo *)a3;
  if (self->__assetTransitionInfo != v12)
  {
    objc_storeStrong((id *)&self->__assetTransitionInfo, a3);
    double v5 = [(PUAvalancheReviewController *)self _collectionView];
    double v6 = [(PUAvalancheReviewController *)self _indexPathOfCenterVisibleItemInCollectionView:v5];

    id v7 = [(PUAvalancheReviewController *)self _collectionView];
    double v8 = [v7 cellForItemAtIndexPath:v6];

    id v9 = [v8 photoView];
    double v10 = [v9 contentHelper];
    double v11 = [(PUAssetTransitionInfo *)v12 image];
    [v10 setPlaceHolderImage:v11];
  }
}

- (void)setPhotosSharingTransitionContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v5 = (PUPhotosSharingTransitionContext *)a3;
  if (self->__photosSharingTransitionContext != v5)
  {
    objc_storeStrong((id *)&self->__photosSharingTransitionContext, a3);
    double v6 = [(PUAvalancheReviewController *)self _collectionView];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(v6, "visibleCells", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          double v13 = [v6 indexPathForCell:v12];
          [(PUAvalancheReviewController *)self _updateCell:v12 forItemAtIndexPath:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = (UITapGestureRecognizer *)a3;
  uint64_t v8 = [(PUAvalancheReviewController *)self _collectionView];
  tapGestureRecognizer = self->__tapGestureRecognizer;

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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAvalancheReviewController *)self _photoZoomPinchGestureRecognizer];

  if (v5 == v4)
  {
    id v7 = [(PUAvalancheReviewController *)self _collectionView];
    if ([v7 isDragging] & 1) != 0 || (objc_msgSend(v7, "isDecelerating"))
    {
      BOOL v6 = 0;
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      [(PUAvalancheReviewController *)self _getMainCollectionViewFrame:&v16 collectionViewLayoutInsets:&v14];
      CGFloat v8 = *(double *)&v16 + *((double *)&v14 + 1);
      CGFloat v9 = *((double *)&v16 + 1) + *(double *)&v14;
      CGFloat v10 = *(double *)&v17 - (*((double *)&v14 + 1) + *((double *)&v15 + 1));
      CGFloat v11 = *((double *)&v17 + 1) - (*(double *)&v14 + *(double *)&v15);
      [v4 locationInView:v7];
      v18.CGFloat y = v12;
      v19.origin.CGFloat x = v8;
      v19.origin.CGFloat y = v9;
      v19.size.double width = v10;
      v19.size.double height = v11;
      v18.CGFloat x = v8;
      BOOL v6 = CGRectContainsPoint(v19, v18);
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)reviewScrubber:(id)a3 shouldProvideFeedbackForCellAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v7 = [v6 assets];
  uint64_t v8 = [v5 item];

  CGFloat v9 = [v7 objectAtIndex:v8];

  LOBYTE(v7) = [v6 isAutoPick:v9];
  return (char)v7;
}

- (unint64_t)reviewScrubber:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  id v4 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  unint64_t v5 = [v4 assetsCount];

  return v5;
}

- (void)reviewScrubberDidSelectItemAtIndexPath:(id)a3
{
  collectionView = self->__collectionView;
  id v5 = a3;
  [(UICollectionView *)collectionView _stopScrollingAndZoomingAnimations];
  [(PUAvalancheReviewController *)self _pageToIndexPath:v5 animated:1];
}

- (void)reviewScrubberDidScrub:(id)a3
{
  collectionView = self->__collectionView;
  id v5 = a3;
  [(UICollectionView *)collectionView _stopScrollingAndZoomingAnimations];
  self->__updatingContentOffsetFromScrubbing = 1;
  id v6 = [v5 selectedIndexPath];

  [(PUAvalancheReviewController *)self _pageToIndexPath:v6 animated:0];
  self->__updatingContentOffsetFromScrubbing = 0;
}

- (void)reviewScrubber:(id)a3 willDisplayCell:(id)a4 atIndexPath:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  CGFloat v11 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  CGFloat v12 = [v11 assets];
  uint64_t v13 = [v9 item];

  long long v14 = [v12 objectAtIndex:v13];

  objc_msgSend(v8, "setSuggested:", objc_msgSend(v11, "isAutoPick:", v14));
  objc_msgSend(v8, "setFavorite:", objc_msgSend(v11, "isUserFavorite:", v14));
  uint64_t v15 = [v10 isMinibar];

  [v8 setWantsSmallSuggestionIndicators:v15];
  uint64_t v16 = [v8 tag] + 1;
  [v8 setTag:v16];
  id v17 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v17 setAllowPlaceholder:1];
  [v17 setDeliveryMode:1];
  [v17 setLoadingMode:0x40000];
  CGPoint v18 = objc_msgSend(MEMORY[0x1E4F8B938], "formatWithID:", -[PUAvalancheReviewController reviewScrubberImageFormat](self, "reviewScrubberImageFormat"));
  uint64_t v31 = [v18 contentMode];
  objc_msgSend(v18, "sizeWithFallBackSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v20 = v19;
  double v22 = v21;
  id v23 = objc_alloc(MEMORY[0x1E4F38F50]);
  double v24 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  double v25 = (void *)[v23 initWithPLManagedObject:v14 photoLibrary:v24];

  uint64_t v26 = *MEMORY[0x1E4F394A8];
  v35[0] = *MEMORY[0x1E4F39448];
  v35[1] = v26;
  double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  double v28 = (void *)[v25 newObjectWithPropertySets:v27];

  [v17 setSynchronous:1];
  double v29 = [(PUAvalancheReviewController *)self _cachingImageManager];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __74__PUAvalancheReviewController_reviewScrubber_willDisplayCell_atIndexPath___block_invoke;
  v32[3] = &unk_1E5F23B90;
  id v33 = v8;
  uint64_t v34 = v16;
  id v30 = v8;
  objc_msgSend(v29, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v28, v31, v17, v32, v20, v22);
}

void __74__PUAvalancheReviewController_reviewScrubber_willDisplayCell_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) setImage:v3];
  }
}

- (CGRect)layout:(id)a3 collectionView:(id)a4 selectionBadgeFrameForItemFrame:(CGRect)a5 atIndexPath:(id)a6
{
  -[PUAvalancheReviewController selectionBadgeFrameForItemFrame:atIndexPath:](self, "selectionBadgeFrameForItemFrame:atIndexPath:", a6, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", a5, a4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v10 isEqualToString:@"PUAvalancheReviewBadgeKind"])
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUAvalancheReviewController.m" lineNumber:1186 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  CGFloat v12 = [(PUAvalancheReviewController *)self _selectionViewAtIndexPath:v11 forCollectionView:v9];

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"PUAvalancheReviewCellIdentifier" forIndexPath:v6];
  [(PUAvalancheReviewController *)self _updateCell:v7 forItemAtIndexPath:v6];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  int64_t v5 = [v4 assetsCount];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
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
  long long v14 = [v8 collectionViewLayout];
  uint64_t v15 = objc_msgSend(v14, "layoutAttributesForElementsInRect:", v11, y, width, height);

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
        id v23 = *(void **)(*((void *)&v30 + 1) + 8 * v22);
        double v24 = objc_msgSend(v23, "indexPath", (void)v30);
        if (![v23 representedElementCategory])
        {
          if (([(PUAvalancheReviewController *)self _horizontalOffsetInCollectionView:v8 forCenteringOnItemAtIndexPath:v24], double v26 = v25, x == 0.0)|| x > 0.0 && v25 > a5->x|| x < 0.0 && v25 < a5->x)
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
  id v3 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v3 finishInteractiveUpdate];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v5 = [(PUAvalancheReviewController *)self _reviewScrubber];
    [v5 finishInteractiveUpdate];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  [(PUAvalancheReviewController *)self _updatePreheatedAssets];
  uint64_t v4 = [(PUAvalancheReviewController *)self _photosSharingTransitionContext];
  if (v4)
  {
  }
  else if (!self->__updatingContentOffsetFromScrubbing)
  {
    [(PUAvalancheReviewController *)self _updateReviewScrubberFromContentOffset];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v3 beginInteractiveUpdate];
}

- (void)_startPreheatingAllAssets
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  uint64_t v4 = [v3 assetsCount];

  id v5 = objc_opt_new();
  [v5 setNetworkAccessAllowed:1];
  id v6 = [(PUAvalancheReviewController *)self _cachingImageManager];
  double v7 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v8 = [v7 assets];
  id v9 = [(PUAvalancheReviewController *)self _initialAsset];
  uint64_t v10 = [v8 indexOfObject:v9];

  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      if ((uint64_t)(i + v10) >= v4)
      {
        uint64_t v17 = 0;
        CGFloat v12 = 0;
      }
      else
      {
        CGFloat v12 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
        [(PUAvalancheReviewController *)self _sizeForItemAtIndexPath:v12];
        double v14 = PUPixelSizeFromPointSize(v13);
        double v16 = v15;
        uint64_t v17 = [(PUAvalancheReviewController *)self _phAssetAtIndexPath:v12];
        v27[0] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
        objc_msgSend(v6, "startCachingImagesForAssets:targetSize:contentMode:options:", v18, 0, v5, v14, v16);
      }
      if (((v10 - i) & 0x8000000000000000) != 0)
      {

        if ((uint64_t)(i + v10) >= v4) {
          break;
        }
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];

        [(PUAvalancheReviewController *)self _sizeForItemAtIndexPath:v19];
        double v21 = PUPixelSizeFromPointSize(v20);
        double v23 = v22;
        double v24 = [(PUAvalancheReviewController *)self _phAssetAtIndexPath:v19];

        double v26 = v24;
        double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
        objc_msgSend(v6, "startCachingImagesForAssets:targetSize:contentMode:options:", v25, 0, v5, v21, v23);
      }
    }
  }
}

- (void)_stopPreheatingAllAssets
{
}

- (void)_cancelReviewMode
{
  [(PUAvalancheReviewController *)self _updateBarItemsAnimated:1];
  id v5 = [(PUAvalancheReviewController *)self _initialAsset];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v4 = objc_msgSend(v5, "pl_PHAssetFromPhotoLibrary:", v3);
  [(PUAvalancheReviewController *)self _dismissReviewControllerWithAsset:v4];
}

- (void)_handleDoneButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAvalancheReviewController *)self _initialFavorites];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  id v8 = v7;

  id v9 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  uint64_t v10 = [v9 userFavorites];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  double v13 = v12;

  if ([v8 count]) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = [v13 count] != 0;
  }
  double v15 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  uint64_t v16 = [v15 assetsCount];

  uint64_t v17 = [v13 count];
  if (v14 && (uint64_t v18 = v17, v17 >= 1) && (v19 = v16 - v17, v19 >= 1))
  {
    id v33 = v4;
    if (v19 == 1)
    {
      uint64_t v21 = PULocalizedString(@"AVALANCHE_KEEP_OTHER_PHOTO_TITLE");
    }
    else
    {
      double v20 = PULocalizedString(@"AVALANCHE_KEEP_OTHER_COUNT_PHOTOS_TITLE");
      uint64_t v21 = PULocalizedStringWithValidatedFormat(v20, @"%lu");
    }
    long long v32 = (void *)v21;
    double v22 = PULocalizedString(@"AVALANCHE_KEEP_ONLY_COUNT_FAVORITES");
    uint64_t v31 = v18;
    double v23 = PULocalizedStringWithValidatedFormat(v22, @"%lu");

    double v24 = PULocalizedString(@"AVALANCHE_KEEP_EVERYTHING");
    double v25 = PULocalizedString(@"CANCEL");
    double v26 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v21, 0, 0, v31);
    double v27 = [MEMORY[0x1E4FB1410] actionWithTitle:v25 style:1 handler:0];
    [v26 addAction:v27];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __49__PUAvalancheReviewController__handleDoneButton___block_invoke;
    void v35[3] = &unk_1E5F2BF98;
    v35[4] = self;
    double v28 = [MEMORY[0x1E4FB1410] actionWithTitle:v24 style:0 handler:v35];
    [v26 addAction:v28];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __49__PUAvalancheReviewController__handleDoneButton___block_invoke_2;
    v34[3] = &unk_1E5F2BF98;
    void v34[4] = self;
    uint64_t v29 = [MEMORY[0x1E4FB1410] actionWithTitle:v23 style:0 handler:v34];
    [v26 addAction:v29];

    [(PUAvalancheReviewController *)self presentViewController:v26 animated:1 completion:0];
    long long v30 = [v26 popoverPresentationController];
    [v30 setPermittedArrowDirections:15];
    id v4 = v33;
    [v30 setBarButtonItem:v33];
  }
  else
  {
    [(PUAvalancheReviewController *)self _finishReviewAndDeleteNonPicks:0];
  }
}

uint64_t __49__PUAvalancheReviewController__handleDoneButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishReviewAndDeleteNonPicks:0];
}

uint64_t __49__PUAvalancheReviewController__handleDoneButton___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishReviewAndDeleteNonPicks:1];
}

- (void)_finishReviewAndDeleteNonPicks:(BOOL)a3
{
  BOOL v3 = a3;
  self->__completingReviewMode = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PUAvalancheReviewController__finishReviewAndDeleteNonPicks___block_invoke;
  aBlock[3] = &unk_1E5F23B68;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  [(PUAvalancheReviewController *)self _promoteFavoriteAssetsAndDeleteNonPicks:v3 withReviewCompletionHandler:v5];
}

void __62__PUAvalancheReviewController__finishReviewAndDeleteNonPicks___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _updateBarItemsAnimated:1];
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  objc_msgSend(v4, "pl_PHAssetFromPhotoLibrary:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _dismissReviewControllerWithAsset:v6];
}

- (void)_dismissReviewControllerWithAsset:(id)a3
{
  id v6 = a3;
  avalancheBeingReviewed = self->__avalancheBeingReviewed;
  id v5 = [(PUAvalancheReviewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 avalancheReviewControllerDidComplete:self withAsset:v6 animated:avalancheBeingReviewed != 0];
  }
}

- (void)_reallyToggleCurrentPickStatusAtIndexPath:(id)a3
{
  id v13 = a3;
  id v4 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v5 = [v4 assets];
  id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v13, "item"));

  int v7 = [v4 isUserFavorite:v6];
  id v8 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v8 toggleIndexPath:v13 animated:0];
  if (v7) {
    [v4 removeUserFavorite:v6];
  }
  else {
    [v4 addUserFavorite:v6];
  }
  uint64_t v9 = v7 ^ 1u;
  uint64_t v10 = [(PUAvalancheReviewController *)self _collectionView];
  double v11 = [v10 cellForItemAtIndexPath:v13];
  [v11 setSelected:v9];
  id v12 = [v10 _visibleSupplementaryViewOfKind:@"PUAvalancheReviewBadgeKind" atIndexPath:v13];
  [v12 setSelected:v9];
  [v8 reloadIndexPath:v13 animated:0];
  [(PUAvalancheReviewController *)self _updateNavigationItemTitle];
  [(PUAvalancheReviewController *)self _updateEnabledNavigationBarItems];
}

- (void)_toggleCurrentPickStatusAtIndexPath:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v6 = [v5 assets];
  int v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "item"));

  if (![v5 isUserFavorite:v7]) {
    goto LABEL_8;
  }
  uint64_t v8 = [v5 proposedStackAssetAfterRemovingFavorite:v7];
  if (v7 == (void *)v8)
  {

    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v7 albums];
  unint64_t v11 = [v10 count];

  if (v11 < 2)
  {
LABEL_8:
    [(PUAvalancheReviewController *)self _reallyToggleCurrentPickStatusAtIndexPath:v4];
    goto LABEL_9;
  }
  id v12 = [v7 albums];
  [v12 count];

  v48[0] = v7;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  BOOL v14 = PLLocalizedHidePhotosEverywhereWarning();

  double v15 = PLLocalizedFrameworkString();
  uint64_t v16 = PLLocalizedFrameworkString();
  uint64_t v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:0 preferredStyle:0];
  double v45 = (void *)v16;
  uint64_t v18 = [MEMORY[0x1E4FB1410] actionWithTitle:v16 style:1 handler:0];
  [v17 addAction:v18];

  uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __67__PUAvalancheReviewController__toggleCurrentPickStatusAtIndexPath___block_invoke;
  v46[3] = &unk_1E5F2BF70;
  v46[4] = self;
  id v20 = v4;
  id v47 = v20;
  uint64_t v21 = [v19 actionWithTitle:v15 style:2 handler:v46];
  [v17 addAction:v21];

  double v22 = [v17 popoverPresentationController];
  if (v22)
  {
    double v23 = [(PUAvalancheReviewController *)self _collectionView];
    double v24 = [v23 cellForItemAtIndexPath:v20];

    [v24 bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    id v33 = [(PUAvalancheReviewController *)self navigationController];
    [v33 view];
    double v44 = v15;
    uint64_t v35 = v34 = v14;
    objc_msgSend(v24, "convertRect:toView:", v35, v26, v28, v30, v32);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    BOOL v14 = v34;
    double v15 = v44;

    [v22 setSourceView:v24];
    objc_msgSend(v22, "setSourceRect:", v37, v39, v41, v43);
  }
  [(PUAvalancheReviewController *)self presentViewController:v17 animated:1 completion:0];

LABEL_9:
}

uint64_t __67__PUAvalancheReviewController__toggleCurrentPickStatusAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyToggleCurrentPickStatusAtIndexPath:*(void *)(a1 + 40)];
}

- (void)_promoteFavoriteAssetsAndDeleteNonPicks:(BOOL)a3 withReviewCompletionHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__13255;
  v15[4] = __Block_byref_object_dispose__13256;
  id v16 = [(PUAvalancheReviewController *)self _currentAsset];
  if ([v7 canPerformEditOperation:1])
  {
    uint64_t v8 = [v7 photoLibrary];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke;
    v9[3] = &unk_1E5F23B40;
    BOOL v14 = a3;
    id v10 = v7;
    unint64_t v11 = self;
    id v13 = v15;
    id v12 = v6;
    [v8 performTransaction:v9];
  }
  _Block_object_dispose(v15, 8);
}

void __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _currentAssetContainer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5F23B18;
  id v8 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  [v3 applyChangesAndDeleteNonPicks:v2 currentContainer:v4 completionHandler:v7];
}

uint64_t __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isUserFavorite:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) stackAsset];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_reloadAvalancheDataWithAsset:(id)a3
{
  id v4 = a3;
  id v14 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v5 = [v14 assets];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = [v14 userFavorites];
    id v8 = [v7 firstObject];

    long long v9 = [v14 assets];
    uint64_t v6 = [v9 indexOfObject:v8];
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v6;
  }
  unint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:0];
  id v12 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v12 setSelectedIndexPath:v11];

  [(PUAvalancheReviewController *)self _pageToIndexPath:v11 animated:0];
  id v13 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v13 reloadData];
}

- (void)_updateReviewScrubberFromContentOffset
{
  id v12 = [(PUAvalancheReviewController *)self _indexPathOfCenterVisibleItemInCollectionView:self->__collectionView];
  [(PUAvalancheReviewController *)self _sizeForItemAtIndexPath:v12];
  double v4 = v3;
  [(UICollectionView *)self->__collectionView contentOffset];
  double v6 = v5;
  [(UICollectionView *)self->__collectionView contentInset];
  double v8 = v6 - v7;
  [(PUAvalancheReviewControllerSpec *)self->__spec interItemSpacing];
  double v10 = v8 / (v4 + v9);
  unint64_t v11 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v11 updateWithAbsoluteProgress:v10];
}

- (unsigned)reviewScrubberImageFormat
{
  uint64_t v2 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  double v3 = [v2 largestUncroppedNonJPEGThumbnailFormat];
  unsigned __int16 v4 = [v3 formatID];

  return v4;
}

- (PUReviewScrubber)_reviewScrubber
{
  uint64_t v2 = [(PUAvalancheReviewController *)self navigationController];
  double v3 = [v2 toolbar];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (PUReviewScrubber *)v4;
}

- (void)_endZoomingForCell
{
  double v3 = [(PUAvalancheReviewController *)self _photoZoomCell];
  [v3 removeFromSuperview];

  [(PUAvalancheReviewController *)self _setPhotoZoomCell:0];
  id v4 = [(PUAvalancheReviewController *)self _collectionViewLayout];
  [v4 setZoomingCellIndexPath:0];

  double v5 = [(PUAvalancheReviewController *)self view];
  [v5 setUserInteractionEnabled:1];

  double v6 = [(PUAvalancheReviewController *)self navigationController];
  double v7 = [v6 navigationBar];
  [v7 setUserInteractionEnabled:1];

  double v8 = [(PUAvalancheReviewController *)self _photoZoomAnimator];
  [v8 setDelegate:0];

  [(PUAvalancheReviewController *)self _setPhotoZoomAnimator:0];
}

- (void)_beginZoomingForCellAtIndexPath:(id)a3
{
  id v31 = a3;
  if (!v31)
  {
    double v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PUAvalancheReviewController.m" lineNumber:795 description:@"expected index path"];
  }
  double v5 = [(PUAvalancheReviewController *)self navigationController];
  double v6 = [v5 view];

  double v7 = [(PUAvalancheReviewController *)self _photoZoomPinchGestureRecognizer];
  double v8 = [(PUAvalancheReviewController *)self _collectionView];
  double v9 = [v8 cellForItemAtIndexPath:v31];
  [v9 bounds];
  objc_msgSend(v9, "convertRect:toView:", v6);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(v7, "setInitialPinchRect:");
  uint64_t v18 = [(PUAvalancheReviewController *)self _spec];
  uint64_t v19 = [v18 selectionBadgeCorner];

  id v20 = [(PUAvalancheReviewController *)self _selectionViewAtIndexPath:v31 forCollectionView:0];
  -[PUAvalancheReviewController selectionBadgeFrameForItemFrame:atIndexPath:](self, "selectionBadgeFrameForItemFrame:atIndexPath:", v31, v11, v13, v15, v17);
  objc_msgSend(v20, "setFrame:");
  uint64_t v21 = -[PUPhotosZoomingSharingGridCell initWithFrame:selectionView:optionView:layoutAnchor:]([PUPhotosZoomingSharingGridCell alloc], "initWithFrame:selectionView:optionView:layoutAnchor:", v20, 0, v19, v11, v13, v15, v17);
  [(PUAvalancheReviewController *)self _setPhotoZoomCell:v21];
  [(PUAvalancheReviewController *)self _updateCell:v21 forItemAtIndexPath:v31];
  [v6 addSubview:v21];
  double v22 = [(PUAvalancheReviewController *)self _collectionViewLayout];
  [v22 setZoomingCellIndexPath:v31];

  double v23 = [(PUAvalancheReviewController *)self view];
  [v23 setUserInteractionEnabled:0];

  double v24 = [(PUAvalancheReviewController *)self navigationController];
  double v25 = [v24 navigationBar];
  [v25 setUserInteractionEnabled:0];

  double v26 = [PUTransitionViewAnimator alloc];
  UIRectGetCenter();
  double v29 = -[PUTransitionViewAnimator initWithView:sourceFrame:targetFrame:anchorPoint:shouldUseTargetAspectRatio:rampUpDuration:direction:](v26, "initWithView:sourceFrame:targetFrame:anchorPoint:shouldUseTargetAspectRatio:rampUpDuration:direction:", v21, 1, 0, v11, v13, v15, v17, v11, v13, v15, v17, v27, v28, 0x3FB999999999999ALL);
  [(PUTransitionViewAnimator *)v29 setAppliesScaleViaTransform:0];
  [(PUTransitionViewAnimator *)v29 setDelegate:self];
  [(PUAvalancheReviewController *)self _setPhotoZoomAnimator:v29];
}

- (void)_updateCollectionViewLayoutInsets
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  [(PUAvalancheReviewController *)self _getMainCollectionViewFrame:&v16 collectionViewLayoutInsets:&v14];
  id v12 = 0;
  id v13 = 0;
  [(PUAvalancheReviewController *)self _getFirstValidIndexPath:&v13 lastValidIndexPath:&v12];
  id v3 = v13;
  id v4 = v12;
  double v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    double v9 = *((double *)&v14 + 1);
    double v11 = *((double *)&v15 + 1);
  }
  else
  {
    [(PUAvalancheReviewController *)self _sizeForItemAtIndexPath:v3];
    double v8 = v7;
    [(PUAvalancheReviewController *)self _sizeForItemAtIndexPath:v5];
    double v9 = *((double *)&v14 + 1) + round((*(double *)&v17 - v8) * 0.5);
    double v11 = *((double *)&v15 + 1) + round((*(double *)&v17 - v10) * 0.5);
    *((double *)&v14 + 1) = v9;
    *((double *)&v15 + 1) = v11;
  }
  -[PUHorizontalCollectionViewLayout setItemsContentInset:](self->__collectionViewLayout, "setItemsContentInset:", *(double *)&v14, v9, *(double *)&v15, v11);
}

- (id)_selectionViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  if (a4)
  {
    BOOL v6 = [a4 dequeueReusableSupplementaryViewOfKind:@"PUAvalancheReviewBadgeKind" withReuseIdentifier:@"PUAvalancheReviewBadgeIdentifier" forIndexPath:a3];
  }
  else
  {
    id v7 = a3;
    BOOL v6 = objc_alloc_init(PUPhotosSharingSelectionView);
  }
  double v8 = v6;
  double v9 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  double v10 = [v9 assets];
  uint64_t v11 = [a3 item];

  id v12 = [v10 objectAtIndex:v11];

  -[PUPhotosSharingSelectionView setSelected:](v8, "setSelected:", [v9 isUserFavorite:v12]);
  return v8;
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
    uint64_t v11 = [v8 visibleCells];
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
          long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v18 = [v8 indexPathForCell:v17];
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
  BOOL v6 = [v5 layoutAttributesForItemAtIndexPath:a4];
  [v6 center];
  double v8 = v7;
  [v5 bounds];
  double v10 = v9;

  return round(v8 + v10 * -0.5);
}

- (id)_indexPathOfCenterVisibleItemInCollectionView:(id)a3
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
  double v10 = -[PUAvalancheReviewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v4, 0, MidX, CGRectGetMidY(v14));

  return v10;
}

- (void)_pageToIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = [(PUAvalancheReviewController *)self _collectionView];
  [v11 contentOffset];
  double v8 = v7;
  [(PUAvalancheReviewController *)self _horizontalOffsetInCollectionView:v11 forCenteringOnItemAtIndexPath:v6];
  double v10 = v9;

  objc_msgSend(v11, "setContentOffset:animated:", v4, v10, v8);
}

- (CGSize)_sizeForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v6 = [v5 assets];
  uint64_t v7 = [v4 item];

  double v8 = [v6 objectAtIndex:v7];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  [(PUAvalancheReviewController *)self _getMainCollectionViewFrame:&v38 collectionViewLayoutInsets:&v36];
  double v9 = *(double *)&v39 - (*((double *)&v36 + 1) + *((double *)&v37 + 1));
  double v10 = *((double *)&v39 + 1) - (*(double *)&v36 + *(double *)&v37);
  [v8 imageSize];
  double v12 = v11;
  double v14 = v13;
  double v15 = [(PUAvalancheReviewController *)self _spec];
  [v15 interItemSpacing];
  double v17 = v16;

  double v18 = v9 + v17 * -4.0;
  double v19 = v10 + v17 * -2.0;
  double v20 = [(PUAvalancheReviewController *)self _spec];
  [v20 selectionBadgeSize];
  double v22 = v21;
  double v23 = [(PUAvalancheReviewController *)self _spec];
  [v23 selectionBadgeOffset];
  double v25 = v22 + v24 * 2.0;

  PURectWithSizeThatFitsInRect(v12, v14, 0.0, 0.0, v18, v19);
  if (v27 < v25 && v14 < v12)
  {
    double v26 = v26 * (v25 / v27);
    double v27 = v25;
  }
  if (v26 < v25 && v12 < v14)
  {
    double v27 = v27 * (v25 / v26);
    double v26 = v25;
  }
  if (v26 >= v25) {
    double v30 = v26;
  }
  else {
    double v30 = v25;
  }
  if (v18 < v30) {
    double v30 = v18;
  }
  if (v27 >= v25) {
    double v31 = v27;
  }
  else {
    double v31 = v25;
  }
  if (v19 < v31) {
    double v31 = v19;
  }
  double v32 = round(v30);
  double v33 = round(v31);

  double v34 = v32;
  double v35 = v33;
  result.CGFloat height = v35;
  result.CGFloat width = v34;
  return result;
}

- (id)_phAssetAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAvalancheReviewController *)self assetCollectionsFetchResult];
  id v6 = [v5 lastObject];

  uint64_t v7 = [(PUAvalancheReviewController *)self assetsInAssetCollection:v6];
  uint64_t v8 = [v4 item];

  double v9 = [v7 objectAtIndex:v8];

  return v9;
}

- (id)_assetAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v6 = [v5 assets];
  uint64_t v7 = [v4 item];

  uint64_t v8 = [v6 objectAtIndex:v7];

  return v8;
}

- (id)_currentAsset
{
  id v3 = [(PUAvalancheReviewController *)self _indexPathOfCenterVisibleItemInCollectionView:self->__collectionView];
  id v4 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  uint64_t v5 = [v4 assetsCount];
  if ([v3 item] >= v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [v4 assets];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v3, "item"));
  }
  return v7;
}

- (void)_handlePhotoPinch:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [v19 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    uint64_t v5 = [(PUAvalancheReviewController *)self _photoZoomAnimator];
    if (v5)
    {
      id v6 = [(PUAvalancheReviewController *)self _photoZoomCell];
      uint64_t v7 = [v6 superview];

      [v19 adjustedTranslationVelocityInView:v7];
      double v9 = v8;
      double v11 = v10;
      [v19 adjustedScaleVelocityInView:v7];
      objc_msgSend(v5, "finishWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:", 0, v9, v11, 0.0, v12);
      goto LABEL_14;
    }
    [(PUAvalancheReviewController *)self _endZoomingForCell];
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  if (v4 == 2)
  {
    uint64_t v5 = [(PUAvalancheReviewController *)self _photoZoomAnimator];
    if (v5)
    {
      double v13 = [(PUAvalancheReviewController *)self _photoZoomCell];
      uint64_t v7 = [v13 superview];

      [v19 adjustedTranslationInView:v7];
      double v15 = v14;
      double v17 = v16;
      [v19 adjustedScaleInView:v7];
      objc_msgSend(v5, "updateWithTranslation:rotation:scale:", v15, v17, 0.0, v18);
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (v4 == 1)
  {
    uint64_t v7 = [(PUAvalancheReviewController *)self _collectionView];
    [v19 locationInView:v7];
    uint64_t v5 = -[PUAvalancheReviewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v7, 0);
    if (!v5) {
      goto LABEL_14;
    }
    [(PUAvalancheReviewController *)self _beginZoomingForCellAtIndexPath:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v5 = 0;
LABEL_14:
}

- (void)_handleTapInMainCollectionView:(id)a3
{
  id v4 = a3;
  id v17 = [(PUAvalancheReviewController *)self _collectionView];
  [v4 locationInView:v17];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(PUAvalancheReviewController *)self _collectionViewLayout];
  [v17 contentSize];
  double v11 = v10;
  [v9 itemsContentInset];
  double v14 = v11 - fabs(v13);
  if (v6 > fabs(v12) && v6 < v14)
  {
    double v16 = -[PUAvalancheReviewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v17, 0, v6, v8);
    if (v16) {
      [(PUAvalancheReviewController *)self _handleTapAtIndexPath:v16];
    }
  }
}

- (void)_handleTapAtIndexPath:(id)a3
{
  id v6 = a3;
  id v4 = [(PUAvalancheReviewController *)self _collectionView];
  [(PUAvalancheReviewController *)self _toggleCurrentPickStatusAtIndexPath:v6];
  if (([v4 isDragging] & 1) == 0
    && ([v4 isDecelerating] & 1) == 0
    && [v4 isTracking])
  {
    double v5 = [(PUAvalancheReviewController *)self _reviewScrubber];
    [v5 beginInteractiveUpdate];
    [(PUAvalancheReviewController *)self _pageToIndexPath:v6 animated:1];
  }
}

- (CGRect)selectionBadgeFrameForItemFrame:(CGRect)a3 atIndexPath:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [(PUAvalancheReviewController *)self _spec];
  [v9 selectionBadgeSize];
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  double v14 = [(PUAvalancheReviewController *)self _spec];
  [v14 selectionBadgeOffset];
  double v16 = v15;
  double v18 = v17;

  id v19 = [(PUAvalancheReviewController *)self _spec];
  uint64_t v20 = [v19 selectionBadgeCorner];

  if (v20 != 1)
  {
    CGFloat v21 = y;
    CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    if (v20 == 4)
    {
      CGFloat v28 = x;
      CGFloat v29 = width;
      CGFloat v30 = height;
    }
    else
    {
      CGFloat v23 = height;
      CGFloat v24 = *MEMORY[0x1E4F1DB28];
      if (v20 == 2)
      {
        CGFloat v25 = x;
        CGFloat v26 = width;
        double v27 = CGRectGetWidth(*(CGRect *)(&v21 - 1));
        v43.origin.CGFloat x = v24;
        v43.origin.CGFloat y = v22;
        v43.size.CGFloat width = v11;
        v43.size.CGFloat height = v13;
        double v16 = v27 - CGRectGetWidth(v43) - v16;
        goto LABEL_8;
      }
      CGFloat v31 = x;
      CGFloat v41 = x;
      CGFloat v42 = width;
      double v32 = v21;
      CGFloat v33 = width;
      double v34 = v23;
      double v40 = CGRectGetWidth(*(CGRect *)(&v21 - 1));
      v44.origin.CGFloat x = v24;
      v44.origin.CGFloat y = v22;
      v44.size.CGFloat width = v11;
      v44.size.CGFloat height = v13;
      double v16 = v40 - CGRectGetWidth(v44) - v16;
      CGFloat v28 = v41;
      CGFloat v29 = v42;
      CGFloat v21 = v32;
      CGFloat v30 = v34;
    }
    double v35 = CGRectGetHeight(*(CGRect *)(&v21 - 1));
    v45.origin.CGFloat x = v16;
    v45.origin.CGFloat y = v22;
    v45.size.CGFloat width = v11;
    v45.size.CGFloat height = v13;
    double v18 = v35 - CGRectGetHeight(v45) - v18;
  }
LABEL_8:
  double v36 = v16;
  double v37 = v18;
  double v38 = v11;
  double v39 = v13;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.CGFloat x = v36;
  return result;
}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v17 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  double v8 = [v17 assets];
  double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "item"));

  [v9 imageSize];
  double v11 = v10;
  double v13 = v12;
  double v14 = [v7 photoView];
  double v15 = [v14 contentHelper];

  objc_msgSend(v15, "setPhotoSize:", v11, v13);
  [v15 setFillMode:1];
  double v16 = [MEMORY[0x1E4F90300] sharedInstance];
  [v16 insetContentCornerRadius];
  objc_msgSend(v15, "setCornerRadius:");

  [v15 setContinuousCorners:1];
  objc_msgSend(v7, "setSelected:", objc_msgSend(v17, "isUserFavorite:", v9));
  [(PUAvalancheReviewController *)self _updatePhotoForAsset:v9 cell:v7 atIndexPath:v6];
}

- (void)_updatePhotoForAsset:(id)a3 cell:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 tag] + 1;
  [v7 setTag:v9];
  id v10 = [(PUAvalancheReviewController *)self _photoZoomCell];

  double v11 = [(PUAvalancheReviewController *)self _photosSharingTransitionContext];
  double v12 = [v11 keyAssetIndexPath];
  char v13 = [v12 isEqual:v8];

  double v14 = [(PUAvalancheReviewController *)self _existingView];
  [v14 bounds];
  double v16 = v15;

  id v17 = [(PUAvalancheReviewController *)self _phAssetAtIndexPath:v8];

  double v18 = objc_opt_new();
  id v19 = v18;
  if (v10 == v7) {
    char v20 = 1;
  }
  else {
    char v20 = v13;
  }
  if (v10 == v7) {
    [v18 setDeliveryMode:1];
  }
  BOOL v21 = v10 == v7;
  BOOL v22 = v10 != v7;
  uint64_t v23 = v21;
  [v19 setSynchronous:v23];
  [v19 setNetworkAccessAllowed:v22];
  [v19 setLoadingMode:0x40000];
  if ((v20 & 1) == 0)
  {
    [v7 frame];
    double v16 = v24;
  }
  double v25 = PUPixelSizeFromPointSize(v16);
  double v27 = v26;
  CGFloat v28 = [v7 photoView];
  CGFloat v29 = [v28 contentHelper];

  CGFloat v30 = [(PUAvalancheReviewController *)self _cachingImageManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__PUAvalancheReviewController__updatePhotoForAsset_cell_atIndexPath___block_invoke;
  v33[3] = &unk_1E5F23AF0;
  id v35 = v29;
  uint64_t v36 = v9;
  id v34 = v7;
  id v31 = v29;
  id v32 = v7;
  objc_msgSend(v30, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, 0, v19, v33, v25, v27);
}

void __69__PUAvalancheReviewController__updatePhotoForAsset_cell_atIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if (v20 && [*(id *)(a1 + 32) tag] == *(void *)(a1 + 48))
  {
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    char v7 = [v6 BOOLValue];

    [v20 size];
    double v9 = v8;
    id v10 = [*(id *)(a1 + 40) photoImage];
    [v10 size];
    if (v9 >= v11)
    {
    }
    else
    {
      [v20 size];
      double v13 = v12;
      double v14 = [*(id *)(a1 + 40) photoImage];
      [v14 size];
      double v16 = v15;

      if (v13 < v16) {
        goto LABEL_12;
      }
    }
    uint64_t v17 = [*(id *)(a1 + 40) placeHolderImage];
    if (!v17) {
      goto LABEL_11;
    }
    double v18 = (void *)v17;
    id v19 = [*(id *)(a1 + 40) placeHolderImage];
    if (!v19) {
      char v7 = 1;
    }

    if ((v7 & 1) == 0) {
LABEL_11:
    }
      [*(id *)(a1 + 40) setPhotoImage:v20];
  }
LABEL_12:
}

- (void)_getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4
{
  id v6 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  char v7 = (char *)[v6 assetsCount];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    char v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 - 1 inSection:0];
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v8 = 0;
  if (a3) {
LABEL_3:
  }
    *a3 = v8;
LABEL_4:
  if (a4) {
    *a4 = v7;
  }
}

- (void)_getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4
{
  char v7 = [(PUAvalancheReviewController *)self view];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  if (a3)
  {
    a3->origin.CGFloat x = v9;
    a3->origin.CGFloat y = v11;
    a3->size.CGFloat width = v13;
    a3->size.CGFloat height = v15;
  }
  if (a4)
  {
    [(PUAvalancheReviewController *)self px_safeAreaInsets];
    UIEdgeInsetsMax();
    a4->top = v16;
    a4->left = v17;
    a4->bottom = v18;
    a4->right = v19;
  }
}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  if ([(PUAvalancheReviewController *)self isViewLoaded])
  {
    id v4 = [(PUAvalancheReviewController *)self _spec];
    long long v16 = 0u;
    long long v17 = 0u;
    memset(v15, 0, sizeof(v15));
    [(PUAvalancheReviewController *)self _getMainCollectionViewFrame:&v16 collectionViewLayoutInsets:v15];
    id v5 = +[PUInterfaceManager currentTheme];
    id v6 = [v5 photoCollectionViewBackgroundColor];

    char v7 = [(PUAvalancheReviewController *)self _collectionView];
    double v8 = [(PUAvalancheReviewController *)self _collectionViewLayout];
    [v4 interItemSpacing];
    if (v8)
    {
      if (v7)
      {
LABEL_4:
        objc_msgSend(v7, "setFrame:", v16, v17);
        [(PUAvalancheReviewController *)self _updateCollectionViewLayoutInsets];

        return;
      }
    }
    else
    {
      double v10 = v9;
      double v8 = objc_alloc_init(PUAvalancheReviewCollectionViewLayout);
      [(PUHorizontalCollectionViewLayout *)v8 setInteritemSpacing:v10];
      [(PUHorizontalCollectionViewLayout *)v8 setDelegate:self];
      objc_storeStrong((id *)&self->__collectionViewLayout, v8);
      if (v7) {
        goto LABEL_4;
      }
    }
    id v11 = objc_alloc(MEMORY[0x1E4FB1568]);
    char v7 = objc_msgSend(v11, "initWithFrame:collectionViewLayout:", v8, v16, v17);
    [v7 setAutoresizingMask:18];
    [v7 setAlwaysBounceVertical:0];
    [v7 setAlwaysBounceHorizontal:1];
    [v7 setPagingEnabled:0];
    [v7 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [v7 setDataSource:self];
    [v7 setDelegate:self];
    [v7 setShowsHorizontalScrollIndicator:0];
    [v7 setBackgroundColor:v6];
    [v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUAvalancheReviewCellIdentifier"];
    [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUAvalancheReviewBadgeKind" withReuseIdentifier:@"PUAvalancheReviewBadgeIdentifier"];
    [v7 setContentInsetAdjustmentBehavior:2];
    double v12 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapInMainCollectionView_];
    tapGestureRecognizer = self->__tapGestureRecognizer;
    self->__tapGestureRecognizer = v12;

    [(UITapGestureRecognizer *)self->__tapGestureRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->__tapGestureRecognizer setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)self->__tapGestureRecognizer setDelegate:self];
    [v7 addGestureRecognizer:self->__tapGestureRecognizer];
    objc_storeStrong((id *)&self->__collectionView, v7);
    double v14 = [(PUAvalancheReviewController *)self view];
    [v14 addSubview:self->__collectionView];

    goto LABEL_4;
  }
}

- (void)_updateBarItemsAnimated:(BOOL)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!self->__doneBarButtonItem)
  {
    id v4 = [_BarButton alloc];
    id v5 = PULocalizedString(@"AVALANCHE_DONE");
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
    char v7 = [MEMORY[0x1E4FB1618] systemBlueColor];
    double v8 = [(_BarButton *)v4 initWithTitle:v5 titleColor:v6 backgroundColor:v7 target:self action:sel__handleDoneButton_];

    double v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v8];
    doneBarButtonItem = self->__doneBarButtonItem;
    self->__doneBarButtonItem = v9;
  }
  cancelBarButtonItem = self->__cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    double v12 = [_BarButton alloc];
    CGFloat v13 = PULocalizedString(@"AVALANCHE_CANCEL");
    double v14 = [MEMORY[0x1E4FB1618] systemBlueColor];
    CGFloat v15 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    long long v16 = [(_BarButton *)v12 initWithTitle:v13 titleColor:v14 backgroundColor:v15 target:self action:sel__cancelReviewModeAction_];

    long long v17 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];
    CGFloat v18 = self->__cancelBarButtonItem;
    self->__cancelBarButtonItem = v17;

    cancelBarButtonItem = self->__cancelBarButtonItem;
  }
  v23[0] = cancelBarButtonItem;
  CGFloat v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  BOOL v22 = self->__doneBarButtonItem;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  BOOL v21 = [(PUAvalancheReviewController *)self navigationItem];
  [v21 setLeftBarButtonItems:v19];
  [v21 setRightBarButtonItems:v20];
  [(PUAvalancheReviewController *)self _updateNavigationItemTitle];
}

- (void)_updateNavigationItemTitle
{
  id v3 = [(PUAvalancheReviewController *)self _avalancheBeingReviewed];
  id v4 = [v3 userFavorites];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = PULocalizedString(@"REVIEW_COUNT_PHOTOS_SELECTED_TITLE_TEXT");
    uint64_t v8 = v5;
    PULocalizedStringWithValidatedFormat(v6, @"%lu");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PULocalizedString(@"EMPTY_REVIEW_TITLE_TEXT");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v7 = [(PUAvalancheReviewController *)self navigationItem];
  [v7 setTitle:v9];
  [v7 setPrompt:0];
}

- (void)_updateEnabledNavigationBarItems
{
  id v2 = [(PUAvalancheReviewController *)self _doneBarButtonItem];
  [v2 setEnabled:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
  v14.receiver = self;
  v14.super_class = (Class)PUAvalancheReviewController;
  id v7 = a4;
  -[PUAvalancheReviewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [(PUAvalancheReviewController *)self _collectionView];
  id v9 = [(PUAvalancheReviewController *)self _indexPathOfCenterVisibleItemInCollectionView:v8];

  inFlightReferenceIndexPath = self->__inFlightReferenceIndexPath;
  self->__inFlightReferenceIndexPath = v9;
  id v11 = v9;

  v12[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E5F2B9D0;
  v13[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E5F2B9D0;
  [v7 animateAlongsideTransition:v13 completion:v12];
}

void __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMainViewAnimated:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[133];
  if (v3)
  {
    [v2 _pageToIndexPath:v3 animated:0];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 1064);
    *(void *)(v4 + 1064) = 0;
  }
}

uint64_t __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetPreheating];
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
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUAvalancheReviewController;
  [(PUAvalancheReviewController *)&v3 viewWillLayoutSubviews];
  [(PUAvalancheReviewController *)self _updateCollectionViewLayoutInsets];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUAvalancheReviewController;
  -[PUAvalancheReviewController viewWillAppear:](&v6, sel_viewWillAppear_);
  uint64_t v5 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v5 setDataSource:self];
  [v5 setScrubberDelegate:self];
  [(PUAvalancheReviewController *)self _updateMainViewAnimated:0];
  [(PUAvalancheReviewController *)self _reloadAvalancheDataWithAsset:self->__initialAsset];
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
}

- (void)dealloc
{
  [(PUAvalancheReviewController *)self _stopPreheatingAllAssets];
  [(UITapGestureRecognizer *)self->__tapGestureRecognizer setDelegate:0];
  [(PUPhotoPinchGestureRecognizer *)self->__photoZoomPinchGestureRecognizer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PUAvalancheReviewController;
  [(PUAvalancheReviewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUAvalancheReviewController;
  [(PUAvalancheReviewController *)&v4 viewDidAppear:a3];
  [(PUAvalancheReviewController *)self _startPreheatingAllAssets];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUAvalancheReviewController;
  [(PUAvalancheReviewController *)&v9 viewDidLoad];
  [(PUAvalancheReviewController *)self _updateMainViewAnimated:0];
  [(PUAvalancheReviewController *)self _updateBarItemsAnimated:0];
  objc_super v3 = [[PUPhotoPinchGestureRecognizer alloc] initWithTarget:self action:sel__handlePhotoPinch_];
  [(PUPhotoPinchGestureRecognizer *)v3 setDelegate:self];
  [(PUAvalancheReviewController *)self _setPhotoZoomPinchGestureRecognizer:v3];
  objc_super v4 = [(PUAvalancheReviewController *)self view];
  [v4 addGestureRecognizer:v3];

  uint64_t v5 = NSNumber;
  objc_super v6 = [(PUAvalancheReviewController *)self _initialAsset];
  [v6 imageSize];
  PXSizeGetAspectRatio();
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v8 = [(PUAvalancheReviewController *)self _reviewScrubber];
  [v8 setCellAspectRatio:v7];
}

- (id)assetsInAssetCollection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_assetCollectionsFetchResult) {
      id v5 = [(PUAvalancheReviewController *)self assetCollectionsFetchResult];
    }
    objc_super v6 = [(NSMutableDictionary *)self->_resultsForAssetCollection objectForKey:v4];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (PHFetchResult)assetCollectionsFetchResult
{
  id v2 = self;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  if (!assetCollectionsFetchResult)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = 984;
    resultsForAssetCollection = v2->_resultsForAssetCollection;
    v2->_resultsForAssetCollection = (NSMutableDictionary *)v4;

    id v7 = [(PHPhotoLibrary *)v2->_photoLibrary px_standardLibrarySpecificFetchOptions];
    [v7 setWantsIncrementalChangeDetails:0];
    uint64_t v8 = [(PUAvalancheReviewController *)v2 avalancheContainerList];
    objc_super v9 = [v8 containers];

    double v10 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v11 = [v9 count];
    double v12 = v10;
    CGFloat v13 = v7;
    uint64_t v14 = [v12 arrayWithCapacity:v11];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v9;
    long long v16 = (void *)v14;
    obuint64_t j = v15;
    uint64_t v38 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v38)
    {
      uint64_t v17 = *(void *)v40;
      unint64_t v18 = 0x1E4F38000uLL;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          BOOL v21 = *(void **)(v18 + 3816);
          BOOL v22 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
          uint64_t v23 = objc_msgSend(v21, "pl_PHAssetCollectionForAssetContainer:photoLibrary:includeTrash:", v20, v22, 1);

          if (v23)
          {
            [v16 addObject:v23];
            double v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v23 options:v13];
            [*(id *)((char *)&v2->super.super.super.isa + v5) setObject:v24 forKey:v23];
            double v25 = PLOneUpGetLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              [v23 uuid];
              uint64_t v26 = v17;
              double v27 = v16;
              uint64_t v28 = v5;
              CGFloat v29 = v13;
              v31 = CGFloat v30 = v2;
              uint64_t v32 = [v24 count];
              *(_DWORD *)buf = 138543618;
              CGRect v44 = v31;
              __int16 v45 = 2048;
              uint64_t v46 = v32;
              _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEFAULT, "PUAvalanceReviewController: Fetched assets for collection: %{public}@ with count: %lu", buf, 0x16u);

              id v2 = v30;
              CGFloat v13 = v29;
              uint64_t v5 = v28;
              long long v16 = v27;
              uint64_t v17 = v26;
              unint64_t v18 = 0x1E4F38000;
            }
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v38);
    }

    CGFloat v33 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v16 title:&stru_1F06BE7B8];
    uint64_t v34 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v33 options:v13];
    id v35 = v2->_assetCollectionsFetchResult;
    v2->_assetCollectionsFetchResult = (PHFetchResult *)v34;

    assetCollectionsFetchResult = v2->_assetCollectionsFetchResult;
  }
  return assetCollectionsFetchResult;
}

- (PUAvalancheReviewController)initWithSpec:(id)a3 startingAtAsset:(id)a4 inAvalanche:(id)a5 currentAssetContainer:(id)a6 photoLibrary:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v37 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PUAvalancheReviewController.m", 167, @"Invalid parameter not satisfying: %@", @"asset", v37, v38 object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"PUAvalancheReviewController.m", 168, @"Invalid parameter not satisfying: %@", @"avalanche" object file lineNumber description];

LABEL_3:
  id v39 = v16;
  if (!v16)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PUAvalancheReviewController.m", 169, @"Invalid parameter not satisfying: %@", @"currentAssetContainer" object file lineNumber description];
  }
  uint64_t v17 = [v15 assets];
  uint64_t v18 = [v17 indexOfObject:v14];

  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat v19 = 0;
    uint64_t v20 = v39;
  }
  else
  {
    v42.receiver = self;
    v42.super_class = (Class)PUAvalancheReviewController;
    BOOL v21 = [(PUAvalancheReviewController *)&v42 initWithNibName:0 bundle:0];
    self = v21;
    uint64_t v20 = v39;
    if (v21)
    {
      objc_storeStrong((id *)&v21->__spec, a3);
      p_avalancheBeingReviewed = &self->__avalancheBeingReviewed;
      objc_storeStrong((id *)&self->__avalancheBeingReviewed, a5);
      objc_storeStrong((id *)&self->__initialAsset, a4);
      uint64_t v23 = [v15 userFavorites];
      initialFavorites = self->__initialFavorites;
      self->__initialFavorites = v23;

      objc_storeStrong((id *)&self->__currentAssetContainer, a6);
      objc_storeStrong((id *)&self->_photoLibrary, a7);
      double v25 = (PHCachingImageManager *)objc_opt_new();
      cachingImageManager = self->__cachingImageManager;
      self->__cachingImageManager = v25;

      double v27 = (PLAssetContainerList *)[objc_alloc(MEMORY[0x1E4F8ABE8]) initWithAssetContainer:self->__avalancheBeingReviewed];
      avalancheContainerList = self->_avalancheContainerList;
      self->_avalancheContainerList = v27;

      CGFloat v29 = PLOneUpGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v30 = [(PLAvalanche *)*p_avalancheBeingReviewed uuid];
        id v31 = [(PLAvalanche *)*p_avalancheBeingReviewed assets];
        uint64_t v32 = [v31 count];
        CGFloat v33 = [(PLAssetContainerList *)self->_avalancheContainerList containers];
        uint64_t v34 = [v33 count];
        *(_DWORD *)buf = 138543874;
        CGRect v44 = v30;
        __int16 v45 = 2048;
        uint64_t v46 = v32;
        uint64_t v20 = v39;
        __int16 v47 = 2048;
        uint64_t v48 = v34;
        _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_DEFAULT, "PUAvalanceReviewController: Init with item avalanche %{public}@, count: %lu, container count: %lu", buf, 0x20u);
      }
      self = self;
      CGFloat v19 = self;
    }
    else
    {
      CGFloat v19 = 0;
    }
  }

  return v19;
}

- (PUAvalancheReviewController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAvalancheReviewController.m", 163, @"%s is not available as initializer", "-[PUAvalancheReviewController init]");

  abort();
}

- (PUAvalancheReviewController)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAvalancheReviewController.m", 159, @"%s is not available as initializer", "-[PUAvalancheReviewController initWithCoder:]");

  abort();
}

- (PUAvalancheReviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAvalancheReviewController.m", 155, @"%s is not available as initializer", "-[PUAvalancheReviewController initWithNibName:bundle:]");

  abort();
}

@end