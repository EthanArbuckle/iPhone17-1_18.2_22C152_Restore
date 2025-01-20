@interface PXPhotosContentController
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)canPlay:(id)a3;
- (BOOL)canSelectObjectAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4;
- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3;
- (BOOL)isDisplayAssetEligibleForPlaybackWithSettlingEffect:(id)a3;
- (BOOL)isScrolledAtOrAboveDetent:(id)a3;
- (BOOL)needsCountsInitially;
- (BOOL)needsFooterStatusController;
- (BOOL)shouldEnablePlaybackDuringAnimatedScroll;
- (BOOL)shouldEnablePlaybackFor:(id)a3;
- (CGPoint)pointForPointReference:(id)a3 inCoordinateSpace:(id)a4;
- (CGRect)_targetVisibleRectForScrollingScrollViewController:(id)a3 toDetent:(id)a4;
- (CGRect)frameFor:(id)a3 outMinPlayableSize:(CGSize *)a4;
- (CGRect)visibleRectFor:(id)a3;
- (NSString)debugDescription;
- (NSUndoManager)undoManager;
- (PXAssetReference)assetReferenceForCurrentScrollPosition;
- (PXAssetsDataSourceCountsController)countsController;
- (PXExtendedTraitCollection)traitCollection;
- (PXGAXResponder)axNextResponder;
- (PXGLayout)rootLayout;
- (PXGView)gridView;
- (PXMediaProvider)mediaProvider;
- (PXPhotosBannerProvider)customBannerProvider;
- (PXPhotosBarsController)barsController;
- (PXPhotosContentController)init;
- (PXPhotosContentController)initWithConfiguration:(id)a3 traitCollection:(id)a4;
- (PXPhotosContentControllerDelegate)delegate;
- (PXPhotosContentInlinePlaybackController)inlinePlaybackController;
- (PXPhotosCustomSectionBodyLayoutProvider)customSectionBodyLayoutProvider;
- (PXPhotosGlobalHeaderLayoutProvider)customGlobalHeaderLayoutProvider;
- (PXPhotosGridFooterPresentation)footerPresentation;
- (PXPhotosGridFooterStatusController)footerStatusController;
- (PXPhotosLayout)layout;
- (PXPhotosOverlayController)overlayController;
- (PXPhotosSectionHeaderLayoutProvider)customSectionHeaderLayoutProvider;
- (PXPhotosViewEventTracker)eventTracker;
- (PXPhotosViewInteraction)interaction;
- (PXPhotosViewModel)viewModel;
- (PXPhotosViewOptionsModel)viewOptionsModel;
- (PXSimpleIndexPath)_indexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5;
- (PXSimpleIndexPath)_selectableIndexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5;
- (PXSimpleIndexPath)selectableIndexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4;
- (PXSimpleIndexPath)selectionManager:(SEL)a3 indexPathClosestToIndexPath:(id)a4 inDirection:(PXSimpleIndexPath *)a5;
- (PXUpdater)updater;
- (UIEdgeInsets)maskPaddingForFooterPresentation:(id)a3;
- (UIEdgeInsets)safeAreaInsetsFor:(id)a3;
- (UIView)headerView;
- (double)collapsibleFooterHeight;
- (double)scrollDistanceAboveDetent:(id)a3;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)dataSourceManagerPauseToken;
- (id)dominantAssetReferenceForPhotosOverlayController:(id)a3;
- (id)indexPathsForItemsInRect:(CGRect)a3 coordinateSpace:(id)a4;
- (id)indexPathsFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5;
- (id)photosLayout:(id)a3 animationForProposedAnimation:(id)a4;
- (id)placementInContext:(id)a3 forItemReference:(id)a4;
- (id)pointReferenceAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)presentingViewControllerForFooterStatusController:(id)a3;
- (id)presentingViewControllerForPhotosInteraction:(id)a3;
- (id)regionOfInterestForAssetReference:(id)a3;
- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4;
- (id)sectionHeaderLayout:(id)a3 viewForSpriteReference:(id)a4;
- (id)selectionManager:(id)a3 indexPathsBetweenIndexPath:(PXSimpleIndexPath *)a4 andIndexPath:(PXSimpleIndexPath *)a5 inDirection:(unint64_t)a6;
- (id)visibleAssetsIterator;
- (int64_t)customSectionBodyStyle;
- (int64_t)customSectionHeaderStyle;
- (int64_t)numberOfItemsToPlayInline;
- (int64_t)selectionBasisForSelectionManager:(id)a3;
- (unint64_t)filterSortedRecordsStrategy;
- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3;
- (void)_handleCurrentLensChangedFromOverlayController:(id)a3;
- (void)_invalidateFullscreenOverlayControllers;
- (void)_invalidateHasScrollableContent;
- (void)_invalidateViewOptionsModel;
- (void)_setNeedsUpdate;
- (void)_updateBarsController;
- (void)_updateFullscreenOverlayControllers;
- (void)_updateHasScrollableContent;
- (void)_updateIsInCompactMode;
- (void)_updateSectionHeaderAndBodyProvider;
- (void)_updateViewOptionsModel;
- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4;
- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4;
- (void)appIntentsEnumeratePersons:(id)a3 completionHandler:(id)a4;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)contentViewDidAppear:(BOOL)a3;
- (void)contentViewDidDisappear:(BOOL)a3;
- (void)contentViewDidScrollToInitialPosition;
- (void)contentViewWillAppear:(BOOL)a3;
- (void)dismissPresentedViewControllerForFooterPresentation:(id)a3;
- (void)enumerateAssetHitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4 usingBlock:(id)a5;
- (void)enumerateAssetHitTestResultsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)extendSelectionInDirection:(unint64_t)a3;
- (void)footerPresentation:(id)a3 presentViewController:(id)a4;
- (void)moveSelectionInDirection:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosOverlayController:(id)a3 didChangeCurrentLens:(id)a4;
- (void)photosOverlayController:(id)a3 didNavigateToAssetReference:(id)a4;
- (void)resumeDataSourceChangesIfNeeded;
- (void)scrollToDetent:(id)a3 animated:(BOOL)a4;
- (void)scrollToEdge:(unsigned int)a3 completionHandler:(id)a4;
- (void)scrollToInitialPositionAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)scrollToNeighboringSectionInDirection:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollToRevealAsset:(id)a3 completionHandler:(id)a4;
- (void)scrollToRevealAssetReference:(id)a3 completionHandler:(id)a4;
- (void)scrollToRevealAssetReference:(id)a3 padding:(UIEdgeInsets)a4 completionHandler:(id)a5;
- (void)scrollToRevealAssetReference:(id)a3 scrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 completionHandler:(id)a6;
- (void)scrollViewControllerContentBoundsDidChange:(id)a3;
- (void)setAxNextResponder:(id)a3;
- (void)setDataSourceManagerPauseToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeaderView:(id)a3 animated:(BOOL)a4;
- (void)setNumberOfItemsToPlayInline:(int64_t)a3;
- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setShouldEnablePlaybackDuringAnimatedScroll:(BOOL)a3;
- (void)stopForceIncludingAllAssetsInDataSource;
- (void)suspendDataSourceChangesWithTimeout:(double)a3 identifier:(id)a4;
- (void)swift_contentViewDidAppear:(BOOL)a3;
- (void)swift_contentViewDidDisappear:(BOOL)a3;
- (void)swift_contentViewDidScrollToInitialPosition;
- (void)swift_contentViewWillAppear:(BOOL)a3;
- (void)swift_init;
- (void)updateIfNeeded;
@end

@implementation PXPhotosContentController

- (void)swift_init
{
  v2 = self;
  sub_1A9D865AC();
}

- (void)swift_contentViewWillAppear:(BOOL)a3
{
}

- (void)swift_contentViewDidAppear:(BOOL)a3
{
}

- (void)swift_contentViewDidDisappear:(BOOL)a3
{
}

- (void)swift_contentViewDidScrollToInitialPosition
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_customBannerProvider, 0);
  objc_storeStrong((id *)&self->_customGlobalHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_customSectionHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_customSectionBodyLayoutProvider, 0);
  objc_storeStrong((id *)&self->_rootLayout, 0);
  objc_storeStrong(&self->_dataSourceManagerPauseToken, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_destroyWeak((id *)&self->_axNextResponder);
  objc_storeStrong((id *)&self->_footerPresentation, 0);
  objc_storeStrong((id *)&self->_footerStatusController, 0);
}

- (BOOL)shouldEnablePlaybackDuringAnimatedScroll
{
  return self->_shouldEnablePlaybackDuringAnimatedScroll;
}

- (PXPhotosContentInlinePlaybackController)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (PXPhotosBarsController)barsController
{
  return self->_barsController;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (PXPhotosBannerProvider)customBannerProvider
{
  return self->_customBannerProvider;
}

- (int64_t)customSectionBodyStyle
{
  return self->_customSectionBodyStyle;
}

- (int64_t)customSectionHeaderStyle
{
  return self->_customSectionHeaderStyle;
}

- (PXPhotosGlobalHeaderLayoutProvider)customGlobalHeaderLayoutProvider
{
  return self->_customGlobalHeaderLayoutProvider;
}

- (PXPhotosSectionHeaderLayoutProvider)customSectionHeaderLayoutProvider
{
  return self->_customSectionHeaderLayoutProvider;
}

- (PXPhotosCustomSectionBodyLayoutProvider)customSectionBodyLayoutProvider
{
  return self->_customSectionBodyLayoutProvider;
}

- (BOOL)needsFooterStatusController
{
  return self->_needsFooterStatusController;
}

- (BOOL)needsCountsInitially
{
  return self->_needsCountsInitially;
}

- (PXGLayout)rootLayout
{
  return self->_rootLayout;
}

- (void)setDataSourceManagerPauseToken:(id)a3
{
}

- (id)dataSourceManagerPauseToken
{
  return self->_dataSourceManagerPauseToken;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (PXPhotosContentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosContentControllerDelegate *)WeakRetained;
}

- (PXPhotosViewInteraction)interaction
{
  return self->_interaction;
}

- (PXAssetsDataSourceCountsController)countsController
{
  return self->_countsController;
}

- (PXPhotosLayout)layout
{
  return self->_layout;
}

- (PXPhotosViewEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (void)setAxNextResponder:(id)a3
{
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (void)appIntentsEnumeratePersons:(id)a3 completionHandler:(id)a4
{
  v14 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!v14)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1481, @"Invalid parameter not satisfying: %@", @"personHandler" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1482, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_3:
  v8 = [(PXPhotosContentController *)self viewModel];
  v9 = [v8 currentDataSource];
  v10 = [v9 container];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = v10;

    if (v11) {
      v14[2](v14, v11, 1);
    }
  }
  else
  {

    id v11 = 0;
  }
  v7[2](v7);
}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1439, @"Invalid parameter not satisfying: %@", @"assetHandler" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1440, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v9 = [(PXPhotosContentController *)self viewModel];
  v10 = [v9 selectionSnapshot];

  id v11 = [(PXPhotosContentController *)self visibleAssetsIterator];
  if (v11)
  {
    v12 = _AppIntentsQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke;
    block[3] = &unk_1E5DB73A8;
    id v17 = v10;
    id v18 = v11;
    id v19 = v7;
    v20 = v8;
    dispatch_async(v12, block);
  }
  else
  {
    v13 = PLAppIntentsGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "No assets iterator for <%{public}@: %p>", buf, 0x16u);
    }

    v8[2](v8);
  }
}

void __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fetchSelectedObjects];
  v3 = (void *)[v2 mutableCopy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5DB73D0;
  id v10 = v3;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5DB7380;
  id v8 = *(id *)(a1 + 48);
  [v6 enumerateObjectsUsingBlock:v7];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v5;

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
      if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(a1 + 32) removeObjectAtIndex:v4];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

void __73__PXPhotosContentController_appIntentsEnumerateAssets_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v4;

    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1395, @"Invalid parameter not satisfying: %@", @"assetCollectionHandler" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1396, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v9 = [(PXPhotosContentController *)self viewModel];
  [v9 selectionSnapshot];
  objc_claimAutoreleasedReturnValue();

  id v10 = [(PXPhotosContentController *)self layout];
  [v10 visibleRect];
  [v10 safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

void __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fetchSelectedObjects];
  id v3 = (void *)[v2 mutableCopy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5DB7358;
  id v10 = v3;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5DB7380;
  id v8 = *(id *)(a1 + 48);
  [v6 enumerateObjectsUsingBlock:v7];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v5;

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
      if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(a1 + 32) removeObjectAtIndex:v4];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

void __83__PXPhotosContentController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v4;

    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

- (id)visibleAssetsIterator
{
  v2 = [(PXPhotosContentController *)self layout];
  [v2 visibleRect];
  [v2 safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

- (id)dominantAssetReferenceForPhotosOverlayController:(id)a3
{
  id v5 = a3;
  id v6 = [(PXPhotosContentController *)self layout];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__66889;
  uint64_t v22 = __Block_byref_object_dispose__66890;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PXPhotosContentController_dominantAssetReferenceForPhotosOverlayController___block_invoke;
  v15[3] = &unk_1E5DBBE68;
  id v17 = &v18;
  id v7 = v6;
  id v16 = v7;
  [v7 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v15];
  id v8 = (id)v19[5];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1365, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference", v12, v14 object file lineNumber description];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXPhotosContentController.m", 1365, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference", v12 object file lineNumber description];
  }

LABEL_3:
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __78__PXPhotosContentController_dominantAssetReferenceForPhotosOverlayController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)photosOverlayController:(id)a3 didNavigateToAssetReference:(id)a4
{
}

void __81__PXPhotosContentController_photosOverlayController_didNavigateToAssetReference___block_invoke(uint64_t a1, unsigned int a2)
{
}

- (void)photosOverlayController:(id)a3 didChangeCurrentLens:(id)a4
{
}

- (void)_handleCurrentLensChangedFromOverlayController:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosContentController *)self viewOptionsModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PXPhotosContentController__handleCurrentLensChangedFromOverlayController___block_invoke;
  v8[3] = &unk_1E5DB5410;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 performChanges:v8];
}

void __76__PXPhotosContentController__handleCurrentLensChangedFromOverlayController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = a2;
    [v6 setSelectedLensControlItem:v2];
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v6 = [v3 lensControlItems];
    id v5 = [v6 lastObject];
    [v4 setSelectedLensControlItem:v5];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext_66907 == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_11;
    }
    id v14 = v9;
    [(PXPhotosContentController *)self _updateIsInCompactMode];
    goto LABEL_10;
  }
  if ((void *)PXPhotosViewModelObservationContext == a5)
  {
    if ((a4 & 0x100000000000) == 0) {
      goto LABEL_11;
    }
    id v14 = v9;
    [(PXPhotosContentController *)self _updateSectionHeaderAndBodyProvider];
    goto LABEL_10;
  }
  if ((void *)PXPhotosViewOptionsModelObservationContext != a5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosContentController.m" lineNumber:1328 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 4) != 0)
  {
    id v14 = v9;
    id v10 = [(PXPhotosContentController *)self viewOptionsModel];
    id v11 = [v10 selectedLensControlItem];
    v12 = [(PXPhotosContentController *)self overlayController];
    [v12 setCurrentLens:v11];

LABEL_10:
    id v9 = v14;
  }
LABEL_11:
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  [(PXPhotosContentController *)self _invalidateHasScrollableContent];
  id v4 = [(PXPhotosContentController *)self inlinePlaybackController];
  [v4 visibleRectDidChange];
}

- (UIEdgeInsets)maskPaddingForFooterPresentation:(id)a3
{
  id v4 = [(PXPhotosContentController *)self delegate];
  [v4 maskPaddingForContentController:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)dismissPresentedViewControllerForFooterPresentation:(id)a3
{
  id v4 = [(PXPhotosContentController *)self delegate];
  [v4 dismissPresentedViewControllerForContentController:self];
}

- (void)footerPresentation:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosContentController *)self delegate];
  [v6 photosContentController:self presentViewController:v5];
}

- (id)presentingViewControllerForFooterStatusController:(id)a3
{
  id v4 = [(PXPhotosContentController *)self delegate];
  id v5 = [v4 presentingViewControllerForContentController:self];

  return v5;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = [(PXPhotosContentController *)self axNextResponder];
  LOBYTE(a4) = [v10 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return a4;
}

- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3
{
  uint64_t v25 = 0;
  id v4 = a3;
  PXGAXGetFocusFromAndToInfosForUserInfo(v4, &v25, 0);
  long long v23 = 0u;
  long long v24 = 0u;
  PXGAXGetToSimpleIndexPathForUserInfo(v4, (uint64_t)&v23);

  id v5 = [(PXPhotosContentController *)self viewModel];
  id v6 = v5;
  uint64_t v7 = v23;
  if ((void)v23 != *(void *)off_1E5DAAED8)
  {
    id v8 = [v5 currentDataSource];
    uint64_t v9 = [v8 identifier];

    if (v9 != v7)
    {
      double v10 = [v6 dataSourceManager];
      double v11 = [v10 changeHistory];
      double v12 = [v6 currentDataSource];
      double v13 = objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v7, objc_msgSend(v12, "identifier"));

      long long v21 = v23;
      long long v22 = v24;
      [off_1E5DA8488 indexPathAfterApplyingChanges:v13 toIndexPath:&v21 hasIncrementalChanges:0 objectChanged:0];
    }
  }
  double v14 = [v6 selectionSnapshot];
  double v15 = [v14 selectedIndexPaths];
  long long v21 = v23;
  long long v22 = v24;
  char v16 = [v15 containsIndexPath:&v21];

  if ((v16 & 1) == 0)
  {
    id v17 = [v6 selectionManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__PXPhotosContentController__handleChangeToModifySelectionWithUserInfo___block_invoke;
    v18[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v19 = v23;
    long long v20 = v24;
    [v17 performChanges:v18];
  }
}

uint64_t __72__PXPhotosContentController__handleChangeToModifySelectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if ((a4 & 2) != 0)
  {
    uint64_t v15 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v15);
    if (v15) {
      [(PXPhotosContentController *)self _handleChangeToModifySelectionWithUserInfo:v10];
    }
  }
  if ((a4 & 4) != 0)
  {
    id v14 = 0;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v14);
    id v11 = v14;
    double v12 = v11;
    if (v11 && [v11 axContentKind] == 6) {
      [(PXPhotosContentController *)self _handleChangeToModifySelectionWithUserInfo:v10];
    }
  }
  double v13 = [(PXPhotosContentController *)self axNextResponder];
  [v13 axGroup:v8 didChange:a4 userInfo:v10];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v3 = [(PXPhotosContentController *)self gridView];
  id v4 = [v3 scrollViewController];
  id v5 = [v4 scrollView];

  return v5;
}

- (unint64_t)filterSortedRecordsStrategy
{
  id v3 = [(PXPhotosContentController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(PXPhotosContentController *)self delegate];
  unint64_t v6 = [v5 photosContentControllerFilterSortedRecordsStrategy:self];

  return v6;
}

- (BOOL)isDisplayAssetEligibleForPlaybackWithSettlingEffect:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosContentController *)self delegate];
  LOBYTE(self) = [v5 photosContentController:self isDisplayAssetEligibleForPlaybackWithSettlingEffect:v4];

  return (char)self;
}

- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosContentController *)self delegate];
  LOBYTE(self) = [v5 photosContentController:self isDisplayAssetEligibleForAutoPlayback:v4];

  return (char)self;
}

- (BOOL)canPlay:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosContentController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(PXPhotosContentController *)self delegate];
    char v8 = [v7 photosContentController:self canPlayAssetInline:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CGRect)frameFor:(id)a3 outMinPlayableSize:(CGSize *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v10 = a3;
  id v11 = [(PXPhotosContentController *)self layout];
  uint64_t v12 = [v11 spriteIndexForSpriteReference:v10];

  if (v12 != -1)
  {
    int v30 = *(_DWORD *)off_1E5DAAF60;
    long long v13 = *((_OWORD *)off_1E5DAAF70 + 1);
    v29[0] = *(_OWORD *)off_1E5DAAF70;
    v29[1] = v13;
    long long v14 = *((_OWORD *)off_1E5DAAF90 + 7);
    v31[6] = *((_OWORD *)off_1E5DAAF90 + 6);
    v31[7] = v14;
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 9);
    v31[8] = *((_OWORD *)off_1E5DAAF90 + 8);
    v31[9] = v15;
    long long v16 = *((_OWORD *)off_1E5DAAF90 + 3);
    v31[2] = *((_OWORD *)off_1E5DAAF90 + 2);
    v31[3] = v16;
    long long v17 = *((_OWORD *)off_1E5DAAF90 + 5);
    v31[4] = *((_OWORD *)off_1E5DAAF90 + 4);
    v31[5] = v17;
    long long v18 = *((_OWORD *)off_1E5DAAF90 + 1);
    v31[0] = *(_OWORD *)off_1E5DAAF90;
    v31[1] = v18;
    long long v19 = *(_OWORD *)off_1E5DAAF88;
    long long v20 = *((_OWORD *)off_1E5DAAF88 + 1);
    uint64_t v28 = *((void *)off_1E5DAAF88 + 4);
    v27[0] = v19;
    v27[1] = v20;
    [v11 copyLayoutForSpritesInRange:v12 | 0x100000000 entities:&v30 geometries:v29 styles:v31 infos:v27];
    [v11 minPlayableSizeForSpriteAtIndex:v12];
    a4->width = v21;
    a4->height = v22;
    PXRectWithCenterAndSize();
  }

  double v23 = v6;
  double v24 = v7;
  double v25 = v8;
  double v26 = v9;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsFor:(id)a3
{
  id v3 = [(PXPhotosContentController *)self layout];
  [v3 safeAreaInsets];
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

- (CGRect)visibleRectFor:(id)a3
{
  id v3 = [(PXPhotosContentController *)self layout];
  [v3 visibleRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)shouldEnablePlaybackFor:(id)a3
{
  double v4 = [(PXPhotosContentController *)self gridView];
  double v5 = [v4 scrollingSpeedometer];
  BOOL v6 = [v5 regime] < 2
    || [(PXPhotosContentController *)self shouldEnablePlaybackDuringAnimatedScroll];

  return v6;
}

- (PXSimpleIndexPath)selectionManager:(SEL)a3 indexPathClosestToIndexPath:(id)a4 inDirection:(PXSimpleIndexPath *)a5
{
  double v10 = [(PXPhotosContentController *)self viewModel];
  double v11 = [v10 currentDataSource];
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  long long v12 = *(_OWORD *)&a5->item;
  v14[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v14[1] = v12;
  [(PXPhotosContentController *)self _selectableIndexPathClosestToIndexPath:v14 fromDataSource:v11 inDirection:a6];

  return result;
}

- (id)selectionManager:(id)a3 indexPathsBetweenIndexPath:(PXSimpleIndexPath *)a4 andIndexPath:(PXSimpleIndexPath *)a5 inDirection:(unint64_t)a6
{
  double v10 = [(PXPhotosContentController *)self viewModel];
  double v11 = [v10 currentDataSource];
  if (a6 == 2)
  {
    a6 = 5;
    goto LABEL_7;
  }
  if (a6 == 1)
  {
    a6 = 6;
LABEL_7:
    int64x2_t v20 = *(int64x2_t *)&a4->dataSourceIdentifier;
    int64x2_t v21 = *(int64x2_t *)&a4->item;
    id v15 = objc_alloc_init((Class)off_1E5DA7430);
    int64x2_t v17 = v20;
    int64x2_t v16 = v21;
    id v14 = v15;
    uint64_t v18 = *(void *)off_1E5DAAED8;
    do
    {
      int64x2_t v23 = v17;
      int64x2_t v24 = v16;
      -[PXPhotosContentController _selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "_selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v23, v11, a6, v20.i64[0]);
      int64x2_t v20 = v25;
      int64x2_t v22 = v26;
      [v14 addIndexPath:&v25];
      int64x2_t v17 = v20;
      int64x2_t v16 = v22;
    }
    while ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v20, *(int64x2_t *)&a5->dataSourceIdentifier), (int32x4_t)vceqq_s64(v22, *(int64x2_t *)&a5->item))), 0xFuLL))) & 1) == 0&& v20.i64[0] != v18);
    goto LABEL_10;
  }
  if (a6) {
    goto LABEL_7;
  }
  int64x2_t v12 = *(int64x2_t *)&a4->item;
  int64x2_t v25 = *(int64x2_t *)&a4->dataSourceIdentifier;
  int64x2_t v26 = v12;
  int64x2_t v13 = *(int64x2_t *)&a5->item;
  int64x2_t v23 = *(int64x2_t *)&a5->dataSourceIdentifier;
  int64x2_t v24 = v13;
  id v14 = [(PXPhotosContentController *)self indexPathsFromIndexPath:&v25 toIndexPath:&v23 inDataSource:v11];
LABEL_10:

  return v14;
}

- (int64_t)selectionBasisForSelectionManager:(id)a3
{
  return 0;
}

- (id)sectionHeaderLayout:(id)a3 viewForSpriteReference:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(PXPhotosContentController *)self interaction];
  double v7 = [v6 view];
  double v8 = [v7 viewForSpriteReference:v5];

  return v8;
}

- (id)presentingViewControllerForPhotosInteraction:(id)a3
{
  double v4 = [(PXPhotosContentController *)self delegate];
  id v5 = [v4 presentingViewControllerForContentController:self];

  return v5;
}

- (id)photosLayout:(id)a3 animationForProposedAnimation:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(PXPhotosContentController *)self viewModel];
  double v7 = [(PXPhotosContentController *)self delegate];
  double v8 = [v7 presentingViewControllerForContentController:self];

  double v9 = v5;
  if (v8)
  {
    double v9 = v5;
    if ([v6 viewDelegateRespondsTo:8])
    {
      double v10 = [v6 viewDelegate];
      double v9 = [v10 photosViewController:v8 animationForProposedAnimation:v5];
    }
  }

  return v9;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosContentController *)self layout];
  [v8 setPlacementOverride:v7 forItemReference:v6];
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosContentController *)self layout];
  double v9 = [v8 placementInContext:v7 forItemReference:v6];

  return v9;
}

- (void)_updateSectionHeaderAndBodyProvider
{
  double v4 = [(PXPhotosContentController *)self viewModel];
  int64_t v5 = [(PXPhotosContentController *)self customSectionHeaderStyle];
  unint64_t v6 = [(PXPhotosContentController *)self customSectionBodyStyle];
  if ([v4 allowsLensControl])
  {
    id v7 = [v4 currentLens];
    unint64_t v6 = [v7 defaultSectionBodyStyle];
  }
  id v8 = [(PXPhotosContentController *)self delegate];
  double v9 = [v8 presentingViewControllerForContentController:self];

  double v10 = [(PXPhotosContentController *)self layout];
  double v11 = [(PXPhotosContentController *)self customSectionHeaderLayoutProvider];
  int64x2_t v12 = [(PXPhotosContentController *)self customBannerProvider];
  id v13 = v4;
  id v14 = v11;
  id v15 = self;
  id v16 = v12;
  id v17 = v9;
  switch(v5)
  {
    case 1:
      uint64_t v18 = PXAlbumSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 2:
      uint64_t v18 = PXImportSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 3:
      uint64_t v18 = PXContentSyndicationSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 4:
      uint64_t v18 = PXDuplicatesSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 5:
      uint64_t v18 = PXSharingSuggestionSectionHeaderLayoutProvider;
      goto LABEL_13;
    case 6:
      long long v19 = [[PXAlbumSectionHeaderLayoutProvider alloc] initWithViewModel:v13 viewProvider:v15];
      [(PXAlbumSectionHeaderLayoutProvider *)v19 setEditorialStyle:1];
      break;
    case 7:
      int64x2_t v20 = [[PXPhotosKeyAssetSectionHeaderLayoutProvider alloc] initWithViewModel:v13 viewProvider:v15 bannerProvider:v16];
      goto LABEL_14;
    case 8:
      long long v19 = [[PXAlbumSectionHeaderLayoutProvider alloc] initWithViewModel:v13 viewProvider:v15];
      [(PXAlbumSectionHeaderLayoutProvider *)v19 setAllowsFloatingBackground:0];
      break;
    case 9:
      uint64_t v18 = PXPhotosSearchSectionHeaderLayoutProvider;
LABEL_13:
      int64x2_t v20 = (PXPhotosKeyAssetSectionHeaderLayoutProvider *)[[v18 alloc] initWithViewModel:v13 viewProvider:v15];
LABEL_14:
      long long v19 = (PXAlbumSectionHeaderLayoutProvider *)v20;
      break;
    case 10:
      long long v19 = (PXAlbumSectionHeaderLayoutProvider *)v14;
      if (v19) {
        break;
      }
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = objc_msgSend(NSString, "stringWithUTF8String:", "id<PXPhotosSectionHeaderLayoutProvider> _PXCreateSectionHeaderLayoutProvider(PXPhotosViewSectionHeaderStyle, PXPhotosViewModel *__strong, __strong id<PXPhotosSectionHeaderLayoutProvider>, __strong id<PXPhotosSectionHeaderLayoutViewProvider>, __strong id<PXPhotosBannerProvider>, PXViewController *__strong)");
      [v49 handleFailureInFunction:v41 file:@"PXPhotosContentController.m" lineNumber:108 description:@"Custom section header layout provider is missing"];

LABEL_46:
      long long v19 = 0;
      break;
    default:
      goto LABEL_46;
  }

  [v10 setSectionHeaderProvider:v19];
  int64x2_t v21 = [(PXPhotosContentController *)v15 customSectionBodyLayoutProvider];
  int64x2_t v22 = [(PXPhotosContentController *)v15 traitCollection];
  id v23 = v13;
  id v24 = v21;
  id v25 = v22;
  id v26 = v17;
  switch(v6)
  {
    case 1uLL:
      v27 = PXZoomablePhotosBodyLayoutProvider;
      goto LABEL_18;
    case 2uLL:
      v27 = PXPhotosGridMessagesBodyLayoutProvider;
LABEL_18:
      uint64_t v28 = (PXPhotosMapBodyLayoutProvider *)[[v27 alloc] initWithViewModel:v23];
      goto LABEL_25;
    case 3uLL:
      v29 = [[PXEditorialBodyLayoutProvider alloc] initWithViewModel:v23];
      id v30 = v29;
      if (v5 == 7) {
        [(PXEditorialBodyLayoutProvider *)v29 setAvoidsFullWidthHeroes:1];
      }
      if ([v23 gridStyle] == 4 || objc_msgSend(v23, "gridStyle") == 5) {
        [v30 setAvoidsFullWidthHeroes:1];
      }
      goto LABEL_29;
    case 4uLL:
      uint64_t v28 = [[PXPhotosMapBodyLayoutProvider alloc] initWithViewModel:v23 traitCollection:v25 presentingViewController:v26];
LABEL_25:
      id v30 = v28;
      goto LABEL_29;
    case 5uLL:
      [v24 setViewModel:v23];
      id v30 = v24;
      if (v30) {
        goto LABEL_29;
      }
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v32 = objc_msgSend(NSString, "stringWithUTF8String:", "id<PXPhotosSectionBodyLayoutProvider> _PXCreateSectionBodyLayoutProvider(PXPhotosViewSectionBodyStyle, PXPhotosViewSectionHeaderStyle, PXPhotosViewModel *__strong, __strong id<PXPhotosCustomSectionBodyLayoutProvider>, PXExtendedTraitCollection *__strong, PXViewController *__strong)");
      [v31 handleFailureInFunction:v32 file:@"PXPhotosContentController.m" lineNumber:143 description:@"Custom section body layout provider is missing"];

LABEL_28:
      id v30 = 0;
LABEL_29:

      [v10 setSectionBodyProvider:v30];
      v33 = [(PXPhotosContentController *)v15 customGlobalHeaderLayoutProvider];
      [v10 setGlobalHeaderProvider:v33];

      if (v6 == 1)
      {
        v34 = [v10 sectionBodyProvider];
        if (v34)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_32:
            v35 = [v34 createInteraction];

            [(PXPhotosViewInteraction *)v15->_interaction setZoomablePhotosInteraction:v35];
LABEL_36:
            char v36 = 1;
            goto LABEL_37;
          }
          v42 = [MEMORY[0x1E4F28B00] currentHandler];
          v45 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v45);
          v46 = objc_msgSend(v34, "px_descriptionForAssertionMessage");
          [v42 handleFailureInMethod:a2, v15, @"PXPhotosContentController.m", 1023, @"%@ should be an instance inheriting from %@, but it is %@", @"layout.sectionBodyProvider", v44, v46 object file lineNumber description];
        }
        else
        {
          v42 = [MEMORY[0x1E4F28B00] currentHandler];
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          [v42 handleFailureInMethod:a2, v15, @"PXPhotosContentController.m", 1023, @"%@ should be an instance inheriting from %@, but it is nil", @"layout.sectionBodyProvider", v44 object file lineNumber description];
        }

        goto LABEL_32;
      }
      [(PXPhotosViewInteraction *)v15->_interaction setZoomablePhotosInteraction:0];
      if (v6 > 5) {
        goto LABEL_50;
      }
      if (((1 << v6) & 0x2D) != 0)
      {
        v35 = 0;
        goto LABEL_36;
      }
      if (v6 != 4)
      {
LABEL_50:
        v47 = [MEMORY[0x1E4F28B00] currentHandler];
        v48 = [NSString stringWithUTF8String:"BOOL _PXAllowSelectModeToggleForBodyStyle(PXPhotosViewSectionBodyStyle)"];
        [v47 handleFailureInFunction:v48 file:@"PXPhotosContentController.m" lineNumber:170 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      v35 = 0;
      char v36 = 0;
LABEL_37:
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __64__PXPhotosContentController__updateSectionHeaderAndBodyProvider__block_invoke;
      v50[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
      char v51 = v36;
      [v23 performChanges:v50];
      v37 = [(PXPhotosContentController *)v15 gridView];
      v38 = [v37 scrollViewController];

      v39 = [v38 scrollView];
      if (v39)
      {
        uint64_t v40 = 1;
        if (v6 == 4)
        {
          [v38 scrollToEdge:1 animated:0];
          uint64_t v40 = 0;
        }
        [v39 setScrollEnabled:v40];
      }

      return;
    default:
      goto LABEL_28;
  }
}

uint64_t __64__PXPhotosContentController__updateSectionHeaderAndBodyProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnterSelectModeAllowed:*(unsigned __int8 *)(a1 + 32) forReason:@"PhotosBodyStyleShouldPreventSelection"];
}

- (void)_updateIsInCompactMode
{
  id v3 = [(PXPhotosContentController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _OWORD v4[2] = __51__PXPhotosContentController__updateIsInCompactMode__block_invoke;
  v4[3] = &unk_1E5DCF6C0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __51__PXPhotosContentController__updateIsInCompactMode__block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 traitCollection];
  objc_msgSend(v3, "setIsInCompactMode:", objc_msgSend(v4, "layoutSizeClass") == 1);
}

- (void)_updateViewOptionsModel
{
  id v3 = [(PXPhotosContentController *)self viewOptionsModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _OWORD v4[2] = __52__PXPhotosContentController__updateViewOptionsModel__block_invoke;
  v4[3] = &unk_1E5DCFF98;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __52__PXPhotosContentController__updateViewOptionsModel__block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 overlayController];
  id v4 = [v5 availableLenses];
  [v3 setAdditionalLensControlItems:v4];
}

- (void)_invalidateViewOptionsModel
{
  id v2 = [(PXPhotosContentController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewOptionsModel];
}

- (void)_updateHasScrollableContent
{
  id v3 = [(PXPhotosContentController *)self interaction];
  id v4 = [v3 scrollViewController];

  [v4 constrainedVisibleRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 contentBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  int64x2_t v21 = [(PXPhotosContentController *)self layout];
  int64x2_t v22 = [v21 footerView];
  [v22 frame];
  CGFloat v24 = v20 - v23;

  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = v18;
  v29.size.height = v24;
  LOBYTE(v21) = !CGRectContainsRect(v28, v29);
  id v25 = [(PXPhotosContentController *)self viewModel];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__PXPhotosContentController__updateHasScrollableContent__block_invoke;
  v26[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
  char v27 = (char)v21;
  [v25 performChanges:v26];
}

uint64_t __56__PXPhotosContentController__updateHasScrollableContent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHasScrollableContent:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateHasScrollableContent
{
  id v2 = [(PXPhotosContentController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHasScrollableContent];
}

- (void)_updateFullscreenOverlayControllers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPhotosContentController *)self delegate];
  id v4 = [v3 presentingViewControllerForContentController:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = [(PXPhotosContentController *)self viewModel];
  CGFloat v6 = [v5 fullscreenOverlayControllers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setContainerViewController:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_invalidateFullscreenOverlayControllers
{
  id v2 = [(PXPhotosContentController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFullscreenOverlayControllers];
}

- (void)updateIfNeeded
{
  id v2 = [(PXPhotosContentController *)self updater];
  [v2 updateIfNeeded];
}

- (void)_setNeedsUpdate
{
  id v3 = [(PXPhotosContentController *)self updater];

  if (v3)
  {
    id v4 = [(PXPhotosContentController *)self delegate];
    [v4 needsUpdateForContentController:self];
  }
}

- (void)setShouldEnablePlaybackDuringAnimatedScroll:(BOOL)a3
{
  if (self->_shouldEnablePlaybackDuringAnimatedScroll != a3)
  {
    self->_shouldEnablePlaybackDuringAnimatedScroll = a3;
    id v3 = [(PXPhotosContentController *)self inlinePlaybackController];
    [v3 invalidatePlaybackEnabled];
  }
}

- (int64_t)numberOfItemsToPlayInline
{
  id v2 = [(PXPhotosContentController *)self inlinePlaybackController];
  int64_t v3 = [v2 numberOfItemsToPlay];

  return v3;
}

- (void)setNumberOfItemsToPlayInline:(int64_t)a3
{
  id v4 = [(PXPhotosContentController *)self inlinePlaybackController];
  [v4 setNumberOfItemsToPlay:a3];
}

- (void)_updateBarsController
{
  id v7 = [(PXPhotosContentController *)self viewModel];
  int64_t v3 = [(PXPhotosContentController *)self delegate];
  id v4 = [v3 presentingViewControllerForContentController:self];

  if ([v7 isEmbedded]
    && [v7 allowsChromeManagementBehavior]
    && v4)
  {
    double v5 = [[PXPhotosBarsController alloc] initWithPhotosContentController:self];
    barsController = self->_barsController;
    self->_barsController = v5;

    [(PXBarsController *)self->_barsController setViewController:v4];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PXPhotosContentController *)self _updateInteractionWorkspaceController];
    [(PXPhotosContentController *)self _updateIsInCompactMode];
    [(PXPhotosContentController *)self _updateBarsController];
    [(PXPhotosContentController *)self _updateSectionHeaderAndBodyProvider];
    double v5 = obj;
  }
}

- (NSUndoManager)undoManager
{
  int64_t v3 = [(PXPhotosContentController *)self delegate];
  id v4 = [v3 undoManagerForContentController:self];

  return (NSUndoManager *)v4;
}

- (UIView)headerView
{
  id v2 = [(PXPhotosContentController *)self layout];
  int64_t v3 = [v2 headerView];

  return (UIView *)v3;
}

- (void)setHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosContentController *)self layout];
  [v5 setHeaderView:v4 animated:0];
}

- (void)setHeaderView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXPhotosContentController *)self layout];
  [v7 setHeaderView:v6 animated:v4];
}

- (PXAssetReference)assetReferenceForCurrentScrollPosition
{
  uint64_t v20 = 0;
  int64x2_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy__66889;
  CGFloat v24 = __Block_byref_object_dispose__66890;
  id v25 = 0;
  int64_t v3 = [(PXPhotosContentController *)self layout];
  BOOL v4 = [(PXPhotosContentController *)self viewModel];
  int v5 = [v4 isScrolledToTop];

  if (v5)
  {
    id v6 = [(PXPhotosContentController *)self viewModel];
    id v7 = [v6 currentDataSource];

    long long v18 = 0u;
    long long v19 = 0u;
    if (v7)
    {
      [v7 firstItemIndexPath];
      uint64_t v8 = v18;
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (v8 != *(void *)off_1E5DAAED8)
    {
      v17[0] = v18;
      v17[1] = v19;
      uint64_t v9 = [v7 assetReferenceAtItemIndexPath:v17];
      uint64_t v10 = (void *)v21[5];
      v21[5] = v9;
    }
  }
  long long v11 = (void *)v21[5];
  if (!v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    _OWORD v14[2] = __67__PXPhotosContentController_assetReferenceForCurrentScrollPosition__block_invoke;
    v14[3] = &unk_1E5DBBE68;
    id v15 = v3;
    uint64_t v16 = &v20;
    [v15 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v14];

    long long v11 = (void *)v21[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v20, 8);
  return (PXAssetReference *)v12;
}

void __67__PXPhotosContentController_assetReferenceForCurrentScrollPosition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id obj = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }
}

- (void)stopForceIncludingAllAssetsInDataSource
{
  id v3 = [(PXPhotosContentController *)self viewModel];
  id v2 = [v3 dataSourceManager];
  [v2 performChanges:&__block_literal_global_271_66936];
}

uint64_t __68__PXPhotosContentController_stopForceIncludingAllAssetsInDataSource__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopForceIncludingAllAssets];
}

- (void)resumeDataSourceChangesIfNeeded
{
  id v3 = [(PXPhotosContentController *)self dataSourceManagerPauseToken];

  if (v3)
  {
    BOOL v4 = [(PXPhotosContentController *)self viewModel];
    int v5 = [v4 dataSourceManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PXPhotosContentController_resumeDataSourceChangesIfNeeded__block_invoke;
    v7[3] = &unk_1E5DD1458;
    void v7[4] = self;
    [v5 performChanges:v7];
  }
  else
  {
    id v6 = PLGridZeroGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "data source changes don't seem to be paused", buf, 2u);
    }
  }
}

uint64_t __60__PXPhotosContentController_resumeDataSourceChangesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 dataSourceManagerPauseToken];
  [v4 resumeChangeDeliveryAndBackgroundLoading:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 setDataSourceManagerPauseToken:0];
}

- (void)suspendDataSourceChangesWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = [(PXPhotosContentController *)self dataSourceManagerPauseToken];

  if (v7)
  {
    uint64_t v8 = PLGridZeroGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "data source changes are already paused", buf, 2u);
    }
  }
  uint64_t v9 = [(PXPhotosContentController *)self viewModel];
  uint64_t v10 = [v9 dataSourceManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PXPhotosContentController_suspendDataSourceChangesWithTimeout_identifier___block_invoke;
  v12[3] = &unk_1E5DB60C0;
  double v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 performChanges:v12];
}

void __76__PXPhotosContentController_suspendDataSourceChangesWithTimeout_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pauseChangeDeliveryWithTimeout:*(void *)(a1 + 40) identifier:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) setDataSourceManagerPauseToken:v3];
}

- (CGRect)_targetVisibleRectForScrollingScrollViewController:(id)a3 toDetent:(id)a4
{
  id v6 = a4;
  [a3 visibleRect];
  objc_msgSend(v6, "offset", v7, v8, v9, v10);

  [(PXPhotosContentController *)self layout];
  [(id)objc_claimAutoreleasedReturnValue() axis];
  PXPointSetValueForAxis();
}

- (void)scrollToDetent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PXPhotosContentController *)self interaction];
  id v16 = [v7 scrollViewController];

  [(PXPhotosContentController *)self _targetVisibleRectForScrollingScrollViewController:v16 toDetent:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v16, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 0, v4, v9, v11, v13, v15);
}

- (BOOL)isScrolledAtOrAboveDetent:(id)a3
{
  [(PXPhotosContentController *)self scrollDistanceAboveDetent:a3];
  return v3 >= 0.0;
}

- (double)scrollDistanceAboveDetent:(id)a3
{
  id v4 = a3;
  int v5 = [(PXPhotosContentController *)self interaction];
  id v6 = [v5 scrollViewController];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXPhotosContentController_scrollDistanceAboveDetent___block_invoke;
  aBlock[3] = &unk_1E5DB53E8;
  aBlock[4] = self;
  uint64_t v7 = (double (**)(void))_Block_copy(aBlock);
  [v6 visibleRect];
  double v8 = v7[2](v7);
  [(PXPhotosContentController *)self _targetVisibleRectForScrollingScrollViewController:v6 toDetent:v4];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = ((double (*)(double (**)(void), double, double, double, double))v7[2])(v7, v10, v12, v14, v16)- v8;
  return v17;
}

void __55__PXPhotosContentController_scrollDistanceAboveDetent___block_invoke(uint64_t a1)
{
}

- (void)scrollToNeighboringSectionInDirection:(unint64_t)a3 animated:(BOOL)a4
{
  id v6 = [(PXPhotosContentController *)self interaction];
  id v13 = [v6 scrollViewController];

  [v13 stopScrollingAndZoomingAnimations];
  uint64_t v7 = [(PXPhotosContentController *)self layout];
  [v7 visibleOriginForScrollingToNeighboringSectionInDirection:a3];
  double v9 = v8;
  double v11 = v10;
  double v12 = [v7 rootLayout];
  objc_msgSend(v12, "convertPoint:fromDescendantLayout:", v7, v9, v11);
  [v12 visibleRect];
  PXRectWithOriginAndSize();
}

- (void)scrollToRevealAssetReference:(id)a3 scrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 completionHandler:(id)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a6;
  id v14 = a3;
  double v15 = [(PXPhotosContentController *)self viewModel];
  double v16 = [v15 currentDataSource];
  double v17 = [v16 assetReferenceForAssetReference:v14];

  if (!v13 || v17)
  {
    long long v18 = [(PXPhotosContentController *)self layout];
    long long v19 = [v18 rootLayout];

    uint64_t v20 = objc_msgSend(v19, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v17, a4, top, left, bottom, right);
    id v21 = (id)[v20 autoInvalidate];

    uint64_t v22 = [(PXPhotosContentController *)self interaction];
    double v23 = [v22 scrollViewController];
    [v23 stopScrollingAndZoomingAnimations];

    [v19 enumerateDescendantsLayoutsUsingBlock:&__block_literal_global_266_66942];
    if (v13)
    {
      CGFloat v24 = [(PXPhotosContentController *)self interaction];
      id v25 = [v24 view];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __99__PXPhotosContentController_scrollToRevealAssetReference_scrollPosition_padding_completionHandler___block_invoke_2;
      v26[3] = &unk_1E5DD3128;
      id v27 = v13;
      [v25 installLayoutCompletionHandler:v26];
    }
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

uint64_t __99__PXPhotosContentController_scrollToRevealAssetReference_scrollPosition_padding_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__PXPhotosContentController_scrollToRevealAssetReference_scrollPosition_padding_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v5;
  }
  else {
    id v2 = 0;
  }

  if ([v2 isLazy])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v4 = v5;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
  }
  [v5 setNeedsUpdate];
  id v4 = v5;
LABEL_9:
}

- (void)scrollToRevealAssetReference:(id)a3 padding:(UIEdgeInsets)a4 completionHandler:(id)a5
{
}

- (void)scrollToRevealAssetReference:(id)a3 completionHandler:(id)a4
{
}

- (void)scrollToRevealAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)off_1E5DA55E0);
  long long v9 = *((_OWORD *)off_1E5DAB028 + 1);
  v11[0] = *(_OWORD *)off_1E5DAB028;
  v11[1] = v9;
  double v10 = (void *)[v8 initWithSectionObject:0 itemObject:v7 subitemObject:0 indexPath:v11];

  [(PXPhotosContentController *)self scrollToRevealAssetReference:v10 completionHandler:v6];
}

- (void)scrollToEdge:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(PXPhotosContentController *)self layout];
  [v7 clearLastVisibleAreaAnchoringInformation];

  id v8 = [(PXPhotosContentController *)self interaction];
  long long v9 = [v8 scrollViewController];

  [v9 stopScrollingAndZoomingAnimations];
  [v9 scrollToEdge:v4 animated:0];
  if (v6)
  {
    double v10 = [(PXPhotosContentController *)self interaction];
    double v11 = [v10 view];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PXPhotosContentController_scrollToEdge_completionHandler___block_invoke;
    v12[3] = &unk_1E5DD3128;
    id v13 = v6;
    [v11 installLayoutCompletionHandler:v12];
  }
}

uint64_t __60__PXPhotosContentController_scrollToEdge_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scrollToInitialPositionAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  if (a4) {
    id v6 = a4;
  }
  else {
    id v6 = &__block_literal_global_261;
  }
  id v7 = _Block_copy(v6);
  id v8 = [(PXPhotosContentController *)self interaction];
  long long v9 = [v8 scrollViewController];
  [v9 stopScrollingAndZoomingAnimations];

  double v10 = [(PXPhotosContentController *)self viewModel];
  double v11 = [v10 dataSourceManager];

  [v11 performChanges:&__block_literal_global_263];
  double v12 = [(PXPhotosContentController *)self layout];
  id v13 = [v12 createAnchorForScrollingToInitialPosition];

  int v19 = 0;
  if (v4)
  {
    [v13 anchoredContentEdges];
    PXEdgesGetCGRectEdge();
  }
  id v14 = (id)[v13 autoInvalidate];
  if (v13)
  {
    double v15 = [(PXPhotosContentController *)self interaction];
    double v16 = [v15 view];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    _OWORD v17[2] = __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_4;
    v17[3] = &unk_1E5DD3128;
    id v18 = v7;
    [v16 installLayoutCompletionHandler:v17];
  }
  else
  {
    (*((void (**)(void *, void))v7 + 2))(v7, 0);
  }
}

uint64_t __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__PXPhotosContentController_scrollToInitialPositionAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 ensureStartingSectionHasContent];
}

- (double)collapsibleFooterHeight
{
  id v2 = [(PXPhotosContentController *)self layout];
  [v2 bottomCollapsibleArea];
  double v4 = ceil(v3);

  return v4;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4
{
  id v6 = a3;
  id v7 = [(PXPhotosContentController *)self interaction];
  id v8 = [v7 view];
  long long v9 = [(PXPhotosContentController *)self layout];
  double v10 = [v9 rootLayout];
  double v11 = PXRegionOfInterestForAssetReference(v8, v10, v6, (uint64_t *)a4, 0);

  return v11;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosContentController *)self interaction];
  id v6 = [v5 view];
  id v7 = [v6 regionOfInterestForObjectReference:v4];

  return v7;
}

- (id)indexPathsFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5
{
  id v65 = a5;
  uint64_t v60 = [v65 identifier];
  v56 = a3;
  int64_t section = a3->section;
  int64_t v8 = a4->section;
  id v62 = objc_alloc_init((Class)off_1E5DA7430);
  int64_t v9 = v8 - section;
  if (v8 >= section)
  {
    for (uint64_t i = 0; v9 + 1 != i; ++i)
    {
      uint64_t v11 = [v65 numberOfItemsInSection:section + i];
      double v12 = [(PXPhotosContentController *)self layout];
      id v13 = [v12 presentedItemsGeometryForSection:section + i inDataSource:v65];

      if (v13)
      {
        if (i) {
          int64_t item = 0;
        }
        else {
          int64_t item = v56->item;
        }
        if (v9 == i)
        {
          int64_t v16 = a4->item;
        }
        else
        {
          if (v11 <= 1) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = v11;
          }
          int64_t v16 = v17 - 1;
        }
        double v15 = [v13 itemsBetweenItem:item andItem:v16];
        if (!v15) {
          goto LABEL_19;
        }
      }
      else
      {
        if (!i) {
          goto LABEL_19;
        }
        if (v9 == i) {
          goto LABEL_19;
        }
        double v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v11);
        if (!v15) {
          goto LABEL_19;
        }
      }
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke;
      v79[3] = &unk_1E5DBB990;
      id v80 = v15;
      id v18 = v15;
      [v62 modifyItemIndexSetForDataSourceIdentifier:v60 section:section + i usingBlock:v79];

LABEL_19:
    }
  }
  id v19 = v62;
  uint64_t v20 = v19;
  if (!v19)
  {
    id v21 = a4;
    uint64_t dataSourceIdentifier = v56->dataSourceIdentifier;
    int64_t v23 = v56->section;
    uint64_t v24 = v56->item;
    subint64_t item = v56->subitem;
    int64_t v26 = v21->dataSourceIdentifier;
    int64_t v27 = v21->section;
    int64_t v28 = v21->item;
    int64_t v29 = v21->subitem;
    v52 = v21;
    int64_t v75 = v56->dataSourceIdentifier;
    int64_t v76 = v23;
    uint64_t v77 = v24;
    uint64_t v78 = subitem;
    v54 = [v65 objectReferenceAtIndexPath:&v75];
    int64_t v61 = v26;
    int64_t v63 = v27;
    int64_t v75 = v26;
    int64_t v76 = v27;
    int64_t v58 = v29;
    int64_t v59 = v28;
    uint64_t v77 = v28;
    uint64_t v78 = v29;
    uint64_t v30 = [v65 objectReferenceAtIndexPath:&v75];
    v31 = [(PXPhotosContentController *)self interaction];
    uint64_t v32 = [v31 view];
    v53 = (void *)v30;
    LOBYTE(v30) = [v32 isObjectReference:v54 visuallyBeforeObjectReference:v30];

    if (v30)
    {
      v33 = v52;
    }
    else
    {
      v33 = v52;
      uint64_t dataSourceIdentifier = v52->dataSourceIdentifier;
      int64_t v23 = v52->section;
      uint64_t v24 = v52->item;
      subint64_t item = v52->subitem;
      int64_t v61 = v56->dataSourceIdentifier;
      int64_t v63 = v56->section;
      int64_t v58 = v56->subitem;
      int64_t v59 = v56->item;
    }
    uint64_t v20 = [off_1E5DA7430 indexPathSet];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke_2;
    aBlock[3] = &unk_1E5DCB950;
    aBlock[4] = self;
    void aBlock[5] = a2;
    long long v34 = *(_OWORD *)&v56->item;
    long long v71 = *(_OWORD *)&v56->dataSourceIdentifier;
    long long v72 = v34;
    long long v35 = *(_OWORD *)&v33->item;
    long long v73 = *(_OWORD *)&v33->dataSourceIdentifier;
    long long v74 = v35;
    v57 = (void (**)(void))_Block_copy(aBlock);
    while (1)
    {
      uint64_t v36 = subitem;
      uint64_t v37 = v24;
      uint64_t v38 = dataSourceIdentifier;
      int64_t v75 = dataSourceIdentifier;
      int64_t v76 = v23;
      uint64_t v77 = v24;
      uint64_t v78 = subitem;
      [v20 addIndexPath:&v75];
      BOOL v39 = dataSourceIdentifier == v61 && v23 == v63;
      BOOL v40 = v39 && v24 == v59;
      uint64_t v66 = dataSourceIdentifier;
      int64_t v67 = v23;
      BOOL v41 = v40 && subitem == v58;
      char v42 = v41;
      uint64_t v68 = v24;
      uint64_t v69 = subitem;
      [(PXPhotosContentController *)self _selectableIndexPathClosestToIndexPath:&v66 fromDataSource:v65 inDirection:5];
      uint64_t dataSourceIdentifier = v75;
      int64_t v43 = v76;
      uint64_t v24 = v77;
      subint64_t item = v78;
      if ([v20 containsIndexPath:&v75]) {
        break;
      }
      if (v43 == v23) {
        char v44 = v42;
      }
      else {
        char v44 = 1;
      }
      if (v44)
      {
        if (v42) {
          goto LABEL_43;
        }
        goto LABEL_48;
      }
    }
    v57[2]();
    if (v42) {
      goto LABEL_43;
    }
LABEL_48:
    if (v43 < v63)
    {
      int64_t v43 = v63 - 1;
      uint64_t v24 = [v65 numberOfItemsInSection:v63 - 1] - 1;
      uint64_t dataSourceIdentifier = [v65 identifier];
      int64_t v75 = v38;
      int64_t v76 = v23;
      uint64_t v77 = v37;
      uint64_t v78 = v36;
      uint64_t v66 = dataSourceIdentifier;
      int64_t v67 = v63 - 1;
      subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v68 = v24;
      uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
      v46 = [v65 indexPathSetFromIndexPath:&v75 toIndexPath:&v66];
      [v20 unionIndexPathSet:v46];
    }
    char v47 = 0;
    uint64_t v48 = *(void *)off_1E5DAAED8;
    while ((v47 & 1) == 0 && dataSourceIdentifier != v48)
    {
      int64_t v75 = dataSourceIdentifier;
      int64_t v76 = v43;
      uint64_t v77 = v24;
      uint64_t v78 = subitem;
      [v20 addIndexPath:&v75];
      BOOL v50 = dataSourceIdentifier == v61 && v43 == v63 && v24 == v59;
      uint64_t v66 = dataSourceIdentifier;
      int64_t v67 = v43;
      char v47 = v50 && subitem == v58;
      uint64_t v68 = v24;
      uint64_t v69 = subitem;
      [(PXPhotosContentController *)self _selectableIndexPathClosestToIndexPath:&v66 fromDataSource:v65 inDirection:5];
      uint64_t dataSourceIdentifier = v75;
      int64_t v43 = v76;
      uint64_t v24 = v77;
      subint64_t item = v78;
      if ([v20 containsIndexPath:&v75])
      {
        v57[2]();
        int64_t v75 = v61;
        int64_t v76 = v63;
        uint64_t v77 = v59;
        uint64_t v78 = v58;
        [v20 addIndexPath:&v75];
        break;
      }
    }
LABEL_43:

    id v19 = 0;
  }

  return v20;
}

uint64_t __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

void __78__PXPhotosContentController_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke_2()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXAssertGetLog();
}

- (PXSimpleIndexPath)selectableIndexPathClosestToIndexPath:(SEL)a3 inDirection:(PXSimpleIndexPath *)a4
{
  int64_t v8 = [(PXPhotosContentController *)self viewModel];
  int64_t v9 = [v8 currentDataSource];

  long long v10 = *(_OWORD *)&a4->item;
  v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v12[1] = v10;
  [(PXPhotosContentController *)self _selectableIndexPathClosestToIndexPath:v12 fromDataSource:v9 inDirection:a5];

  return result;
}

- (void)extendSelectionInDirection:(unint64_t)a3
{
  id v5 = [(PXPhotosContentController *)self viewModel];
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 selectionManager];
  id v7 = v6;
  if (v6)
  {
    [v6 startingIndexPathForMoveInDirection:a3];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }

  uint64_t v8 = *(void *)off_1E5DAAED8;
  if ((void)v17 == *(void *)off_1E5DAAED8)
  {
    [(PXPhotosContentController *)self moveSelectionInDirection:a3];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    int64_t v9 = [v5 selectionManager];
    long long v10 = v9;
    if (v9)
    {
      long long v13 = v17;
      long long v14 = v18;
      [v9 extendSelectionFromIndexPath:&v13 inDirection:a3 withDelegate:self];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }

    if ((void)v15 != v8)
    {
      uint64_t v11 = [v5 currentDataSource];
      long long v13 = v15;
      long long v14 = v16;
      double v12 = [v11 assetReferenceAtItemIndexPath:&v13];

      if (v12) {
        [(PXPhotosContentController *)self scrollToRevealAssetReference:v12 completionHandler:0];
      }
    }
  }
}

- (void)moveSelectionInDirection:(unint64_t)a3
{
  id v5 = [(PXPhotosContentController *)self viewModel];
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [v5 selectionManager];
  id v7 = v6;
  if (v6)
  {
    [v6 moveSelectionInDirection:a3 withDelegate:self];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  if ((void)v11 != *(void *)off_1E5DAAED8)
  {
    uint64_t v8 = [v5 currentDataSource];
    v10[0] = v11;
    v10[1] = v12;
    int64_t v9 = [v8 assetReferenceAtItemIndexPath:v10];

    if (v9) {
      [(PXPhotosContentController *)self scrollToRevealAssetReference:v9 completionHandler:0];
    }
  }
}

- (BOOL)canSelectObjectAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_2;
  }
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = a3->subitem == 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    BOOL v7 = 0;
  }
  else
  {
    long long v8 = *(_OWORD *)&a3->item;
    v11[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v11[1] = v8;
    int64_t v9 = [v5 assetCollectionAtSectionIndexPath:v11];
    BOOL v7 = v9 != 0;
  }
LABEL_7:

  return v7;
}

- (CGPoint)pointForPointReference:(id)a3 inCoordinateSpace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(PXPhotosContentController *)self layout];
  [v8 pointForPointReference:v7];
  double v10 = v9;
  double v12 = v11;

  long long v13 = [v8 rootLayout];
  objc_msgSend(v13, "convertPoint:fromLayout:", v8, v10, v12);

  long long v14 = [(PXPhotosContentController *)self interaction];
  [v14 view];
  objc_claimAutoreleasedReturnValue();

  [(PXPhotosContentController *)self interaction];
  [(id)objc_claimAutoreleasedReturnValue() scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)pointReferenceAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosContentController *)self interaction];
  [v6 view];
  objc_claimAutoreleasedReturnValue();

  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)indexPathsForItemsInRect:(CGRect)a3 coordinateSpace:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosContentController *)self interaction];
  [v6 view];
  objc_claimAutoreleasedReturnValue();

  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

void __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = objc_msgSend(a2, "itemsInRect:inLayout:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 48) identifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_2;
  v9[3] = &unk_1E5DBB990;
  id v10 = v5;
  id v8 = v5;
  [v6 modifyItemIndexSetForDataSourceIdentifier:v7 section:a3 usingBlock:v9];
}

void __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = [a2 userData];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v3 indexPath];
    }
    else {
      memset(v5, 0, sizeof(v5));
    }
    [v4 addIndexPath:v5];
  }
}

uint64_t __70__PXPhotosContentController_indexPathsForItemsInRect_coordinateSpace___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

- (void)enumerateAssetHitTestResultsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = [(PXPhotosContentController *)self interaction];
  double v11 = [v10 view];
  double v12 = objc_msgSend(v11, "hitTestResultsInRect:passingTest:", 0, x, y, width, height);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __75__PXPhotosContentController_enumerateAssetHitTestResultsInRect_usingBlock___block_invoke;
  v14[3] = &unk_1E5DB5328;
  id v15 = v9;
  id v13 = v9;
  [v12 enumerateObjectsUsingBlock:v14];
}

void __75__PXPhotosContentController_enumerateAssetHitTestResultsInRect_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = [v7 identifier];
  id v4 = @"PXPhotosLayoutHitTestIdentifierAsset";
  if (v3 == @"PXPhotosLayoutHitTestIdentifierAsset")
  {

    goto LABEL_5;
  }
  int v5 = [(__CFString *)v3 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];

  id v6 = v7;
  if (v5)
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = v7;
  }
}

- (PXSimpleIndexPath)_selectableIndexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
{
  id v10 = a5;
  long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->uint64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->int64_t item = v11;
  uint64_t v12 = *(void *)off_1E5DAAED8;
  do
  {
    long long v13 = *(_OWORD *)&a4->item;
    v18[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v18[1] = v13;
    [(PXPhotosContentController *)self _indexPathClosestToIndexPath:v18 fromDataSource:v10 inDirection:a6];
    long long v14 = v20;
    *(_OWORD *)&retstr->uint64_t dataSourceIdentifier = v19;
    *(_OWORD *)&retstr->int64_t item = v14;
    long long v15 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&a4->uint64_t dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&a4->int64_t item = v15;
    if (retstr->dataSourceIdentifier == v12) {
      break;
    }
    long long v16 = *(_OWORD *)&retstr->item;
    long long v19 = *(_OWORD *)&retstr->dataSourceIdentifier;
    long long v20 = v16;
  }
  while (![(PXPhotosContentController *)self canSelectObjectAtIndexPath:&v19 inDataSource:v10]);

  return result;
}

- (PXSimpleIndexPath)_indexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
{
  id v10 = a5;
  uint64_t v42 = 0;
  int64_t v43 = &v42;
  uint64_t v44 = 0x4010000000;
  v45 = &unk_1AB5D584F;
  long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v46 = *(_OWORD *)off_1E5DAB028;
  long long v47 = v11;
  if ([v10 numberOfSections] != 1
    || ([(PXPhotosContentController *)self layout],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v12 presentedItemsGeometryForSection:0 inDataSource:v10],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    if (!a6 || a4->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
      goto LABEL_13;
    }
    if (a4->item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v17 = *(_OWORD *)&a4->item;
        long long v40 = *(_OWORD *)&a4->dataSourceIdentifier;
        long long v41 = v17;
        long long v18 = [v10 assetCollectionReferenceAtSectionIndexPath:&v40];
        long long v19 = [(PXPhotosContentController *)self layout];
        long long v20 = [v19 spriteReferenceForObjectReference:v18];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2;
        v30[3] = &unk_1E5DB5350;
        id v21 = v10;
        long long v22 = *(_OWORD *)&a4->item;
        long long v33 = *(_OWORD *)&a4->dataSourceIdentifier;
        long long v34 = v22;
        id v31 = v21;
        uint64_t v32 = &v42;
        [(PXPhotosContentController *)self enumerateAssetHitTestResultsInDirection:a6 fromSpriteReference:v20 usingBlock:v30];
        int64_t v23 = v31;
LABEL_12:
      }
    }
    else if (a4->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v24 = *(_OWORD *)&a4->item;
      long long v40 = *(_OWORD *)&a4->dataSourceIdentifier;
      long long v41 = v24;
      long long v18 = [v10 assetReferenceAtItemIndexPath:&v40];
      id v25 = [(PXPhotosContentController *)self layout];
      long long v20 = [v25 spriteReferenceForObjectReference:v18];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke;
      v35[3] = &unk_1E5DB5350;
      id v26 = v10;
      long long v27 = *(_OWORD *)&a4->item;
      long long v38 = *(_OWORD *)&a4->dataSourceIdentifier;
      long long v39 = v27;
      id v36 = v26;
      uint64_t v37 = &v42;
      [(PXPhotosContentController *)self enumerateAssetHitTestResultsInDirection:a6 fromSpriteReference:v20 usingBlock:v35];
      int64_t v23 = v36;
      goto LABEL_12;
    }
LABEL_13:
    long long v13 = 0;
    goto LABEL_14;
  }
  uint64_t v14 = [v13 itemClosestToItem:a4->item inDirection:a6];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v15 = v43;
    long long v16 = *(_OWORD *)&a4->item;
    *((_OWORD *)v43 + 2) = *(_OWORD *)&a4->dataSourceIdentifier;
    *((_OWORD *)v15 + 3) = v16;
    v15[6] = v14;
  }
LABEL_14:
  long long v28 = *((_OWORD *)v43 + 3);
  *(_OWORD *)&retstr->uint64_t dataSourceIdentifier = *((_OWORD *)v43 + 2);
  *(_OWORD *)&retstr->int64_t item = v28;

  _Block_object_dispose(&v42, 8);
  return result;
}

void __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke(int64x2_t *a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 userData];
  if (v5)
  {
    int64x2_t v6 = 0uLL;
    id v7 = (void *)a1[2].i64[0];
    if (v7)
    {
      [v7 indexPathForAssetReference:v5];
      int64x2_t v6 = 0u;
      int64x2_t v8 = 0u;
    }
    else
    {
      int64x2_t v8 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(a1[3], v6), (int32x4_t)vceqq_s64(a1[4], v8))), 0xFuLL))) & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1[2].i64[1] + 8);
      *(_OWORD *)(v9 + 32) = 0u;
      *(_OWORD *)(v9 + 48) = 0u;
      *a3 = 1;
    }
  }
}

void __85__PXPhotosContentController__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2(int64x2_t *a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 userData];
  if (v5)
  {
    int64x2_t v6 = 0uLL;
    id v7 = (void *)a1[2].i64[0];
    if (v7)
    {
      [v7 indexPathForAssetCollectionReference:v5];
      int64x2_t v6 = 0u;
      int64x2_t v8 = 0u;
    }
    else
    {
      int64x2_t v8 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(a1[3], v6), (int32x4_t)vceqq_s64(a1[4], v8))), 0xFuLL))) & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1[2].i64[1] + 8);
      *(_OWORD *)(v9 + 32) = 0u;
      *(_OWORD *)(v9 + 48) = 0u;
      *a3 = 1;
    }
  }
}

- (void)enumerateAssetHitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = a4;
    id v10 = [(PXPhotosContentController *)self interaction];
    long long v11 = [v10 view];
    uint64_t v12 = [v11 hitTestResultsInDirection:a3 fromSpriteReference:v9];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__PXPhotosContentController_enumerateAssetHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke;
    v13[3] = &unk_1E5DB5328;
    id v14 = v8;
    [v12 enumerateObjectsUsingBlock:v13];
  }
}

void __100__PXPhotosContentController_enumerateAssetHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = [v7 identifier];
  id v4 = @"PXPhotosLayoutHitTestIdentifierAsset";
  if (v3 == @"PXPhotosLayoutHitTestIdentifierAsset")
  {

    goto LABEL_5;
  }
  int v5 = [(__CFString *)v3 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];

  int64x2_t v6 = v7;
  if (v5)
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    int64x2_t v6 = v7;
  }
}

- (void)contentViewDidScrollToInitialPosition
{
  double v3 = [(PXPhotosContentController *)self footerPresentation];
  [v3 viewDidScrollToInitialPosition];

  [(PXPhotosContentController *)self swift_contentViewDidScrollToInitialPosition];
}

- (void)contentViewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PXPhotosContentController *)self inlinePlaybackController];
  [v5 setIsContentViewVisible:0];

  [(PXPhotosContentController *)self swift_contentViewDidDisappear:v3];
  PXUnregisterAppIntentsViewAnnotationDelegate(self);
}

- (void)contentViewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PXPhotosContentController *)self inlinePlaybackController];
  [v5 setIsContentViewVisible:1];

  int64x2_t v6 = [(PXPhotosContentController *)self footerStatusController];
  [v6 viewDidAppear];

  id v7 = [(PXPhotosContentController *)self footerPresentation];
  [v7 viewDidAppear];

  [(PXPhotosContentController *)self swift_contentViewDidAppear:v3];
  id v10 = [(PXPhotosContentController *)self gridView];
  if (v10)
  {
    id v8 = v10;
    +[PXRepresentedEntityProviderRegistration registerViewAnnotationView:v8];
  }
  PXRegisterAppIntentsViewAnnotationDelegate(self);
  id v9 = [(PXPhotosContentController *)self viewModel];
  [v9 performChanges:&__block_literal_global_251_66951];
}

uint64_t __50__PXPhotosContentController_contentViewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 markContentAsViewed];
}

- (PXPhotosGridFooterPresentation)footerPresentation
{
  BOOL v3 = [(PXPhotosContentController *)self gridView];
  footerPresentation = self->_footerPresentation;
  if (footerPresentation) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    int64x2_t v6 = [(PXPhotosContentController *)self layout];
    id v7 = [PXPhotosGridFooterPresentation alloc];
    id v8 = [(PXPhotosContentController *)self viewModel];
    id v9 = [(PXPhotosGridFooterPresentation *)v7 initWithViewModel:v8 gridView:v3 layout:v6];
    id v10 = self->_footerPresentation;
    self->_footerPresentation = v9;

    [(PXPhotosGridFooterPresentation *)self->_footerPresentation setDelegate:self];
    footerPresentation = self->_footerPresentation;
  }
  long long v11 = footerPresentation;

  return v11;
}

- (PXPhotosGridFooterStatusController)footerStatusController
{
  if (!self->_footerStatusController
    && [(PXPhotosContentController *)self needsFooterStatusController])
  {
    BOOL v3 = [(PXPhotosContentController *)self countsController];
    id v4 = [PXPhotosGridFooterStatusController alloc];
    BOOL v5 = [(PXPhotosContentController *)self viewModel];
    int64x2_t v6 = [(PXPhotosGridFooterStatusController *)v4 initWithViewModel:v5 itemsCountsController:v3];
    footerStatusController = self->_footerStatusController;
    self->_footerStatusController = v6;

    [(PXPhotosGridFooterStatusController *)self->_footerStatusController setDelegate:self];
  }
  id v8 = self->_footerStatusController;
  return v8;
}

- (void)contentViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXPhotosContentController *)self needsCountsInitially])
  {
    BOOL v5 = [(PXPhotosContentController *)self countsController];
    [v5 prepareCountsIfNeeded];
  }
  int64x2_t v6 = [(PXPhotosContentController *)self viewModel];
  id v7 = [v6 dataSourceManager];

  id v8 = +[PXPreloadScheduler sharedScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PXPhotosContentController_contentViewWillAppear___block_invoke;
  v13[3] = &unk_1E5DD36F8;
  id v14 = v7;
  id v9 = v7;
  [v8 scheduleTaskAfterCATransactionCommits:v13];

  id v10 = [(PXPhotosContentController *)self viewModel];
  LODWORD(v8) = [v10 wantsFooterVisibleImmediately];

  if (v8)
  {
    long long v11 = [(PXPhotosContentController *)self footerStatusController];
    [v11 viewWillAppear];

    uint64_t v12 = [(PXPhotosContentController *)self footerPresentation];
    [v12 viewWillAppear];
  }
  [(PXPhotosContentController *)self swift_contentViewWillAppear:v3];
}

uint64_t __51__PXPhotosContentController_contentViewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_66956];
}

uint64_t __51__PXPhotosContentController_contentViewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 startBackgroundFetchIfNeeded];
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PXPhotosContentController *)self viewModel];
  int64x2_t v6 = [v5 debugDescription];
  id v7 = [v3 stringWithFormat:@"<%@:%p viewModel:%@>", v4, self, v6];

  return (NSString *)v7;
}

- (PXPhotosContentController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosContentController.m", 349, @"%s is not available as initializer", "-[PXPhotosContentController init]");

  abort();
}

- (PXPhotosContentController)initWithConfiguration:(id)a3 traitCollection:(id)a4
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)PXPhotosContentController;
  id v8 = [(PXPhotosContentController *)&v58 init];
  if (v8)
  {
    uint64_t v9 = [v6 mediaProvider];
    mediaProvider = v8->_mediaProvider;
    v8->_mediaProvider = (PXMediaProvider *)v9;

    uint64_t v11 = [v6 adjustedExtendedTraitCollection:v7];
    traitCollection = v8->_traitCollection;
    v8->_traitCollection = (PXExtendedTraitCollection *)v11;

    [v7 registerChangeObserver:v8 context:PXExtendedTraitCollectionObservationContext_66907];
    [(PXPhotosContentController *)v8 _updateIsInCompactMode];
    long long v13 = [v6 footerViewModel];
    v8->_BOOL needsFooterStatusController = v13 == 0;

    BOOL needsFooterStatusController = v8->_needsFooterStatusController;
    if (needsFooterStatusController) {
      BOOL needsFooterStatusController = [v6 footerVisibilityStyle] != 0;
    }
    v8->_needsCountsInitialldouble y = needsFooterStatusController;
    id v15 = objc_alloc((Class)off_1E5DA5640);
    long long v16 = [v6 dataSourceManager];
    uint64_t v17 = [v15 initWithAssetsDataSourceManager:v16];
    countsController = v8->_countsController;
    v8->_countsController = (PXAssetsDataSourceCountsController *)v17;

    if ([v6 sectionBodyStyle]) {
      uint64_t v19 = ~([v6 allowedBehaviors] >> 13) & 2;
    }
    else {
      uint64_t v19 = 0;
    }
    long long v20 = objc_alloc_init(PXPhotosContentInlinePlaybackController);
    inlinePlaybackController = v8->_inlinePlaybackController;
    v8->_inlinePlaybackController = v20;

    [(PXPhotosContentInlinePlaybackController *)v8->_inlinePlaybackController setDelegate:v8];
    if ([v6 sectionHeaderStyle] || (objc_msgSend(v6, "allowedBehaviors") & 0x4000) != 0)
    {
      if ([v6 sectionHeaderStyle] == 9) {
        v19 |= 4uLL;
      }
      uint64_t v22 = 1;
    }
    else
    {
      uint64_t v22 = 0;
    }
    int64_t v23 = [[PXPhotosLayoutSpecManager alloc] initWithExtendedTraitCollection:v7 options:v19 enableSectionHeaders:v22];
    long long v24 = [(PXMediaProvider *)v8->_mediaProvider availableThumbnailSizes];
    [(PXPhotosLayoutSpecManager *)v23 setAvailableThumbnailSizes:v24];

    -[PXPhotosLayoutSpecManager setGridStyle:](v23, "setGridStyle:", [v6 gridStyle]);
    id v25 = [[PXPhotosViewModel alloc] initWithConfiguration:v6 specManager:v23 inlinePlaybackController:v8->_inlinePlaybackController];
    viewModel = v8->_viewModel;
    v8->_viewModel = v25;

    [(PXPhotosViewModel *)v8->_viewModel registerChangeObserver:v8 context:PXPhotosViewModelObservationContext];
    uint64_t v27 = [(PXPhotosViewModel *)v8->_viewModel viewOptionsModel];
    viewOptionsModel = v8->_viewOptionsModel;
    v8->_viewOptionsModel = (PXPhotosViewOptionsModel *)v27;

    [(PXPhotosViewOptionsModel *)v8->_viewOptionsModel registerChangeObserver:v8 context:PXPhotosViewOptionsModelObservationContext];
    uint64_t v29 = [v6 overlayController];
    overlayController = v8->_overlayController;
    v8->_overlayController = (PXPhotosOverlayController *)v29;

    [(PXPhotosOverlayController *)v8->_overlayController setDelegate:v8];
    [(PXPhotosOverlayController *)v8->_overlayController setPhotosViewModel:v8->_viewModel];
    uint64_t v31 = +[PXPhotosViewInteraction interactionWithViewModel:v8->_viewModel];
    interaction = v8->_interaction;
    v8->_interaction = (PXPhotosViewInteraction *)v31;

    [(PXPhotosViewInteraction *)v8->_interaction setDelegate:v8];
    [(PXPhotosViewInteraction *)v8->_interaction setContentController:v8];
    long long v33 = [[PXPhotosLayout alloc] initWithViewModel:v8->_viewModel specManager:v23 overlayController:v8->_overlayController];
    [(PXPhotosLayout *)v33 setDelegate:v8];
    [(PXGLayout *)v33 addInteraction:v8->_interaction];
    objc_storeStrong((id *)&v8->_layout, v33);
    uint64_t v34 = [v6 sectionBodyLayoutProvider];
    customSectionBodyLayoutProvider = v8->_customSectionBodyLayoutProvider;
    v8->_customSectionBodyLayoutProvider = (PXPhotosCustomSectionBodyLayoutProvider *)v34;

    v8->_customSectionBodyStyle = [v6 sectionBodyStyle];
    uint64_t v36 = [v6 sectionHeaderLayoutProvider];
    customSectionHeaderLayoutProvider = v8->_customSectionHeaderLayoutProvider;
    v8->_customSectionHeaderLayoutProvider = (PXPhotosSectionHeaderLayoutProvider *)v36;

    uint64_t v38 = [v6 globalHeaderLayoutProvider];
    customGlobalHeaderLayoutProvider = v8->_customGlobalHeaderLayoutProvider;
    v8->_customGlobalHeaderLayoutProvider = (PXPhotosGlobalHeaderLayoutProvider *)v38;

    v8->_customSectionHeaderStyle = [v6 sectionHeaderStyle];
    uint64_t v40 = [v6 bannerProvider];
    customBannerProvider = v8->_customBannerProvider;
    v8->_customBannerProvider = (PXPhotosBannerProvider *)v40;

    [(PXPhotosContentController *)v8 _updateSectionHeaderAndBodyProvider];
    uint64_t v42 = PXPhotosViewEventTrackerCreate(v8);
    eventTracker = v8->_eventTracker;
    v8->_eventTracker = (PXPhotosViewEventTracker *)v42;

    if (([v6 isEmbedded] & 1) == 0)
    {
      uint64_t v44 = [PXGView alloc];
      v59[0] = &unk_1F02D6D48;
      v45 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "gridPresentationType"));
      v59[1] = v45;
      long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
      uint64_t v47 = -[PXGView initWithFrame:allowedPresentationTypes:](v44, "initWithFrame:allowedPresentationTypes:", v46, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      gridView = v8->_gridView;
      v8->_gridView = (PXGView *)v47;

      -[PXGView setLowMemoryModeEnabled:](v8->_gridView, "setLowMemoryModeEnabled:", [v6 lowMemoryMode]);
      [v6 itemAspectRatio];
      [(PXGView *)v8->_gridView setAllowLargerImagesDuringScrollingInLowMemoryMode:v49 != 1.0];
      BOOL v50 = [(PXGView *)v8->_gridView scrollingSpeedometer];
      [(PXPhotosContentInlinePlaybackController *)v8->_inlinePlaybackController setScrollViewSpeedometer:v50];

      char v51 = [(PXPhotosOverlayController *)v8->_overlayController overlayLayoutProvider];

      if (v51) {
        v52 = [[PXPhotosRootLayout alloc] initWithPhotosLayout:v33 overlayController:v8->_overlayController];
      }
      else {
        v52 = v33;
      }
      rootLayout = v8->_rootLayout;
      v8->_rootLayout = &v52->super.super;

      [(PXGView *)v8->_gridView setRootLayout:v8->_rootLayout];
      [(PXGView *)v8->_gridView setAxNextResponder:v8];
      [(PXGView *)v8->_gridView registerAllTextureProvidersWithMediaProvider:v8->_mediaProvider];
      v54 = [(PXGView *)v8->_gridView scrollViewController];
      [v54 registerObserver:v8];
      objc_msgSend(v54, "setIndicatorStyle:", objc_msgSend(v6, "scrollIndicatorStyle"));
      uint64_t v55 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v8 needsUpdateSelector:sel__setNeedsUpdate];
      updater = v8->_updater;
      v8->_updater = (PXUpdater *)v55;

      [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateFullscreenOverlayControllers needsUpdate:1];
      [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateHasScrollableContent];
      [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateViewOptionsModel needsUpdate:1];
    }
    [(PXPhotosContentController *)v8 swift_init];
  }
  return v8;
}

@end