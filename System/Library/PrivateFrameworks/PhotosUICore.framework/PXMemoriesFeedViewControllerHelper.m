@interface PXMemoriesFeedViewControllerHelper
- (BOOL)_isRequestingNewMemories;
- (BOOL)_needsUpdate;
- (BOOL)canRequestNewMemories;
- (BOOL)canRequestNewMemoriesForReason:(unint64_t)a3;
- (CGPoint)anchorMemoryOrigin;
- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4;
- (CGRect)memoriesFeedTilingLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5;
- (NSDate)_lastUserMemoryGenerationRequestDate;
- (NSString)scrollTargetMemoryUUID;
- (PHPhotoLibrary)photoLibrary;
- (PXExtendedTraitCollection)traitCollection;
- (PXMemoriesFeedDataSourceManager)dataSourceManager;
- (PXMemoriesFeedScrollFilter)_scrollFilter;
- (PXMemoriesFeedTilingLayout)currentLayout;
- (PXMemoriesFeedTilingLayout)targetLayout;
- (PXMemoriesFeedTransitionAnimationCoordinator)_transitionAnimationCoordinator;
- (PXMemoriesFeedViewControllerHelper)initWithPhotoLibrary:(id)a3;
- (PXMemoriesFeedViewControllerHelper)initWithScrollViewController:(id)a3 photoLibrary:(id)a4 traitCollection:(id)a5 memoriesStyle:(unint64_t)a6 tilingControllerConfigurationBlock:(id)a7;
- (PXMemoriesFeedViewControllerHelper)initWithScrollViewController:(id)a3 photoLibrary:(id)a4 traitCollection:(id)a5 tilingControllerConfigurationBlock:(id)a6;
- (PXMemoriesFeedViewControllerHelperDelegate)delegate;
- (PXMemoriesSpec)_spec;
- (PXMemoriesSpecManager)specManager;
- (PXScrollViewController)scrollViewController;
- (PXSectionedLayoutEngine)_layoutEngine;
- (PXSectionedObjectReference)_memoryReferenceToScrollToVisible;
- (PXSectionedObjectReference)activatedMemoryReference;
- (PXSectionedObjectReference)anchorMemoryReference;
- (PXSectionedObjectReference)highlightedMemoryReference;
- (PXSectionedObjectReference)lastActionPresentationMemoryReference;
- (PXSectionedSelectionManager)selectionManager;
- (PXSimpleIndexPath)indexPathForMemoryInScrollViewAtPoint:(SEL)a3;
- (PXSimpleIndexPath)indexPathForMemoryObjectReference:(SEL)a3;
- (PXTilingController)tilingController;
- (PXViewControllerEventTracker)eventTracker;
- (id)_memoryReferenceInsertedOnChangeToDataSource:(id)a3 withChangeDetails:(id)a4;
- (id)_newMemoriesRequestCompletion;
- (id)memoriesFeedTilingLayout:(id)a3 titleFontNameForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (id)memoryInfoAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)memoryInfoForMemoryObjectReference:(id)a3;
- (id)memoryInfoInScrollViewAtPoint:(CGPoint)a3;
- (id)memoryObjectReferenceInScrollViewAtPoint:(CGPoint)a3;
- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (int64_t)_refreshRetryCount;
- (void)_configureLayout:(id)a3;
- (void)_configureMetrics:(id)a3;
- (void)_enumerateInsertedItemsInChangeDetails:(id)a3 withDataSource:(id)a4 usingBlock:(id)a5;
- (void)_handleChangeFromDataSource:(id)a3 toDataSource:(id)a4 withChangeDetails:(id)a5;
- (void)_handleDataSourceChange;
- (void)_handleFinishedRequestingNewMemoriesWithSuccess:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5;
- (void)_handleNewLayoutSnapshot:(id)a3;
- (void)_handleRefreshCompletionWithResultInformation:(id)a3 reason:(unint64_t)a4 error:(id)a5;
- (void)_handleTraitCollectionChange:(unint64_t)a3;
- (void)_invalidateLayoutEngine;
- (void)_scrollToTargetMemoryUUIDWhenReady:(id)a3;
- (void)_setAnchorMemoryOrigin:(CGPoint)a3;
- (void)_setAnchorMemoryReference:(id)a3;
- (void)_setLastUserMemoryGenerationRequestDate:(id)a3;
- (void)_setMemoryReferenceToScrollToVisible:(id)a3;
- (void)_setNewMemoriesRequestCompletion:(id)a3;
- (void)_setRefreshRetryCount:(int64_t)a3;
- (void)_setRequestingNewMemories:(BOOL)a3;
- (void)_setSpec:(id)a3;
- (void)_startRefreshForReason:(unint64_t)a3;
- (void)_updateHighlightedIndexPathInLayout;
- (void)_updateHighlightedIndexPathInLayout:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateLayoutEngineIfNeeded;
- (void)_updateSelectedIndexPathsInLayout;
- (void)_updateSelectedIndexPathsInLayout:(id)a3;
- (void)didChangeTilingControllerLayout;
- (void)feedViewControllerDidAppear:(id)a3 shouldUpdateNotifications:(BOOL)a4;
- (void)feedViewControllerDidDisappear:(id)a3;
- (void)invalidateMetrics;
- (void)layoutEngine:(id)a3 willGenerateLayoutWithGenerator:(id)a4 forSection:(unint64_t)a5;
- (void)layoutEngineDidUpdateLayoutSnapshot:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)requestNewMemoriesForReason:(unint64_t)a3 withCompletion:(id)a4;
- (void)requestNewMemoriesWithCompletion:(id)a3;
- (void)saveAnchorMemory;
- (void)scrollFilterShouldRequestAdditionalContent:(id)a3;
- (void)scrollMemoryReferenceToVisible:(id)a3 animated:(BOOL)a4;
- (void)setActivatedMemoryReference:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightedMemoryReference:(id)a3;
- (void)setLastActionPresentationMemoryReference:(id)a3;
- (void)setScrollTargetMemoryUUID:(id)a3;
@end

@implementation PXMemoriesFeedViewControllerHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->__newMemoriesRequestCompletion, 0);
  objc_storeStrong((id *)&self->__transitionAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__scrollFilter, 0);
  objc_storeStrong((id *)&self->__layoutEngine, 0);
  objc_storeStrong((id *)&self->_anchorMemoryReference, 0);
  objc_storeStrong((id *)&self->__memoryReferenceToScrollToVisible, 0);
  objc_storeStrong((id *)&self->__lastUserMemoryGenerationRequestDate, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_scrollTargetMemoryUUID, 0);
  objc_storeStrong((id *)&self->_lastActionPresentationMemoryReference, 0);
  objc_storeStrong((id *)&self->_activatedMemoryReference, 0);
  objc_storeStrong((id *)&self->_highlightedMemoryReference, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong(&self->_refreshResetNotification, 0);
}

- (void)_setNewMemoriesRequestCompletion:(id)a3
{
}

- (id)_newMemoriesRequestCompletion
{
  return self->__newMemoriesRequestCompletion;
}

- (void)_setRequestingNewMemories:(BOOL)a3
{
  self->__requestingNewMemories = a3;
}

- (BOOL)_isRequestingNewMemories
{
  return self->__requestingNewMemories;
}

- (void)_setRefreshRetryCount:(int64_t)a3
{
  self->__refreshRetryCount = a3;
}

- (int64_t)_refreshRetryCount
{
  return self->__refreshRetryCount;
}

- (PXMemoriesFeedTransitionAnimationCoordinator)_transitionAnimationCoordinator
{
  return self->__transitionAnimationCoordinator;
}

- (PXMemoriesSpec)_spec
{
  return self->__spec;
}

- (PXMemoriesFeedScrollFilter)_scrollFilter
{
  return self->__scrollFilter;
}

- (PXSectionedLayoutEngine)_layoutEngine
{
  return self->__layoutEngine;
}

- (void)_setAnchorMemoryOrigin:(CGPoint)a3
{
  self->_anchorMemoryOrigin = a3;
}

- (CGPoint)anchorMemoryOrigin
{
  double x = self->_anchorMemoryOrigin.x;
  double y = self->_anchorMemoryOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setAnchorMemoryReference:(id)a3
{
}

- (PXSectionedObjectReference)anchorMemoryReference
{
  return self->_anchorMemoryReference;
}

- (void)_setMemoryReferenceToScrollToVisible:(id)a3
{
}

- (PXSectionedObjectReference)_memoryReferenceToScrollToVisible
{
  return self->__memoryReferenceToScrollToVisible;
}

- (void)_setLastUserMemoryGenerationRequestDate:(id)a3
{
}

- (NSDate)_lastUserMemoryGenerationRequestDate
{
  return self->__lastUserMemoryGenerationRequestDate;
}

- (PXViewControllerEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (NSString)scrollTargetMemoryUUID
{
  return self->_scrollTargetMemoryUUID;
}

- (PXSectionedObjectReference)lastActionPresentationMemoryReference
{
  return self->_lastActionPresentationMemoryReference;
}

- (PXSectionedObjectReference)activatedMemoryReference
{
  return self->_activatedMemoryReference;
}

- (PXSectionedObjectReference)highlightedMemoryReference
{
  return self->_highlightedMemoryReference;
}

- (PXMemoriesFeedViewControllerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXMemoriesFeedViewControllerHelperDelegate *)WeakRetained;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXMemoriesSpecManager)specManager
{
  return self->_specManager;
}

- (PXMemoriesFeedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (void)_scrollToTargetMemoryUUIDWhenReady:(id)a3
{
  id v4 = a3;
  v5 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  id v9 = [v5 currentLayout];

  v6 = [v9 dataSource];
  v7 = [v6 sectionedObjectReferenceForMemoryUUID:v4];

  if (v7)
  {
    [(PXMemoriesFeedViewControllerHelper *)self scrollMemoryReferenceToVisible:v7 animated:1];
    scrollTargetMemoryUUID = self->_scrollTargetMemoryUUID;
    self->_scrollTargetMemoryUUID = 0;
  }
}

- (void)setScrollTargetMemoryUUID:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_scrollTargetMemoryUUID, a3);
  v5 = v6;
  if (v6)
  {
    [(PXMemoriesFeedViewControllerHelper *)self _scrollToTargetMemoryUUIDWhenReady:v6];
    v5 = v6;
  }
}

- (id)memoriesFeedTilingLayout:(id)a3 titleFontNameForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  v7 = [v5 objectAtIndexPath:v11];
  v8 = [v7 assetCollection];
  id v9 = [v8 titleFontName];

  return v9;
}

- (CGRect)memoriesFeedTilingLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5
{
  v7 = [a3 dataSource];
  long long v8 = *(_OWORD *)&a4->item;
  v24[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v24[1] = v8;
  id v9 = [v7 objectAtIndexPath:v24];
  v10 = [v9 primaryAsset];
  if (memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__onceToken != -1) {
    dispatch_once(&memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__onceToken, &__block_literal_global_283_129213);
  }
  double v11 = *(double *)off_1E5DAB010;
  double v12 = *((double *)off_1E5DAB010 + 1);
  double v13 = *((double *)off_1E5DAB010 + 2);
  double v14 = *((double *)off_1E5DAB010 + 3);
  if (v10 && memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__PHAssetRespondsToBestCropRect)
  {
    v15 = [v9 assetCollection];
    objc_msgSend(v10, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 1, objc_msgSend(v15, "px_shouldUseFacesRectForSmartCropping"), a5);
    double v11 = v16;
    double v12 = v17;
    double v13 = v18;
    double v14 = v19;
  }
  double v20 = v11;
  double v21 = v12;
  double v22 = v13;
  double v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

uint64_t __109__PXMemoriesFeedViewControllerHelper_memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F38EB8] instancesRespondToSelector:sel_bestCropRectForAspectRatio_verticalContentMode_cropMode_];
  memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__PHAssetRespondsToBestCropRect = result;
  return result;
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v5 = a4;
  [v5 contentBounds];
  [v5 contentInset];
  long long v6 = [(PXMemoriesFeedViewControllerHelper *)self scrollViewController];
  [v6 visibleOrigin];

  PXPointApproximatelyEqualToPoint();
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_delegateRespondsTo.feedIsVisible
    && ([(PXMemoriesFeedViewControllerHelper *)self delegate],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 memoriesFeedViewControllerHelperFeedIsVisible:self],
        v8,
        !v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = [(PXMemoriesFeedViewControllerHelper *)self _transitionAnimationCoordinator];
  }

  return v10;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v5 = a4;
  id v6 = [v5 fromLayout];
  id v7 = [v6 dataSource];

  long long v8 = [v5 toLayout];

  int v9 = [v8 dataSource];

  id v10 = v9;
  if (v7 == v10)
  {

    goto LABEL_6;
  }
  int v11 = [v7 isEqual:v10];

  if (v11)
  {
LABEL_6:
    v15 = objc_alloc_init(PXTileIdentifierIdentityConverter);
    double v14 = 0;
    goto LABEL_7;
  }
  double v12 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
  double v13 = [v12 changeHistory];
  double v14 = objc_msgSend(v13, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v7, "identifier"), objc_msgSend(v10, "identifier"));

  v15 = [(PXSectionedTileIdentifierConverter *)[PXMemoriesFeedTileIdentifierConverter alloc] initWithFromDataSource:v7 toDataSource:v10 changeDetails:v14];
  if (self->_delegateRespondsTo.reloadedTileKindsOnObjectChanged)
  {
    double v16 = [(PXMemoriesFeedViewControllerHelper *)self delegate];
    double v17 = [v16 memoriesFeedViewControllerHelperReloadedTileKindsOnObjectChanged:self];

    [(PXTileIdentifierIdentityConverter *)v15 setReloadedTileKindsOnObjectChanged:v17];
  }
LABEL_7:

  return v15;
}

- (void)scrollFilterShouldRequestAdditionalContent:(id)a3
{
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
  if (objc_opt_respondsToSelector()) {
    [v5 generateAdditionalEntriesIfPossible];
  }
  id v4 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
  [v4 loadMoreContentWithCompletionHandler:0];
}

- (void)layoutEngine:(id)a3 willGenerateLayoutWithGenerator:(id)a4 forSection:(unint64_t)a5
{
  int v9 = (PXSectionedLayoutEngine *)a3;
  id v10 = a4;
  if (self->__layoutEngine != v9)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 837, @"Invalid parameter not satisfying: %@", @"layoutEngine == __layoutEngine" object file lineNumber description];
  }
  id v11 = v10;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    double v18 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v18);
    double v19 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 838, @"%@ should be an instance inheriting from %@, but it is %@", @"generator", v17, v19 object file lineNumber description];
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    double v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 838, @"%@ should be an instance inheriting from %@, but it is nil", @"generator", v17 object file lineNumber description];
  }

LABEL_5:
  if ([(PXMemoriesSpec *)self->__spec feedShouldAllowHeaders])
  {
    double v12 = [(PXLayoutEngine *)v9 dataSourceSnapshot];
    [v12 identifier];
    if (a5)
    {
      if (v12) {
        [v12 indexPathForFirstPastMemorySection];
      }
      BOOL v13 = a5 == 0;
    }
    else
    {
      BOOL v13 = 1;
      [v11 setIsFirstHeader:1];
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  [v11 setIncludeDateHeader:v13];
}

- (void)layoutEngineDidUpdateLayoutSnapshot:(id)a3
{
  id v5 = (PXSectionedLayoutEngine *)a3;
  id v10 = v5;
  if (self->__layoutEngine != v5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 827, @"Invalid parameter not satisfying: %@", @"layoutEngine == __layoutEngine" object file lineNumber description];

    id v5 = v10;
  }
  id v6 = [(PXLayoutEngine *)v5 layoutSnapshot];
  id v7 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  long long v8 = [v7 layoutSnapshot];

  if (v8 != v6) {
    [(PXMemoriesFeedViewControllerHelper *)self _handleNewLayoutSnapshot:v6];
  }
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)PXDataSourceManagerObservationContext_129244 == a5)
  {
    id v11 = v8;
    [(PXMemoriesFeedViewControllerHelper *)self _handleDataSourceChange];
  }
  else if ((void *)PXExtendedTraitCollectionObservationContext_129245 == a5)
  {
    id v11 = v8;
    [(PXMemoriesFeedViewControllerHelper *)self _handleTraitCollectionChange:a4];
  }
  else if ((void *)PXSpecManagerObservationContext_129246 == a5)
  {
    id v11 = v8;
    int v9 = [(PXMemoriesFeedViewControllerHelper *)self specManager];
    id v10 = [v9 spec];

    [(PXMemoriesFeedViewControllerHelper *)self _setSpec:v10];
  }
  else
  {
    if ((void *)PXSelectionManagerObservationContext_129247 != a5) {
      goto LABEL_10;
    }
    id v11 = v8;
    [(PXMemoriesFeedViewControllerHelper *)self _updateSelectedIndexPathsInLayout];
  }
  id v8 = v11;
LABEL_10:
}

- (void)_configureLayout:(id)a3
{
}

- (void)_handleNewLayoutSnapshot:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PXMemoriesFeedViewControllerHelper *)self saveAnchorMemory];
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self _spec];
  id v6 = [[PXMemoriesFeedTilingLayout alloc] initWithSpec:v5 layoutSnapshot:v4];
  [(PXMemoriesFeedViewControllerHelper *)self _configureLayout:v6];
  [(PXMemoriesFeedViewControllerHelper *)self _updateHighlightedIndexPathInLayout:v6];
  id v7 = PLMemoriesGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    double v14 = v6;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@ layout engine did emit new snapshot:\r%@\r\rTransitioning to new layout %@", (uint8_t *)&v9, 0x20u);
  }

  id v8 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  [v8 transitionToLayout:v6];
  [(PXMemoriesFeedViewControllerHelper *)self didChangeTilingControllerLayout];
}

- (void)_handleTraitCollectionChange:(unint64_t)a3
{
  if ((a3 & 0x110) != 0) {
    [(PXMemoriesFeedViewControllerHelper *)self _invalidateLayoutEngine];
  }
}

- (void)_updateHighlightedIndexPathInLayout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v5 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v14 = *(_OWORD *)off_1E5DAB028;
    long long v15 = v5;
    id v6 = [(PXMemoriesFeedViewControllerHelper *)self highlightedMemoryReference];
    id v7 = [(PXMemoriesFeedViewControllerHelper *)self lastActionPresentationMemoryReference];
    if (v7) {
      id v8 = 0;
    }
    else {
      id v8 = v6;
    }
    id v9 = v8;

    if (v9)
    {
      id v10 = [v4 dataSource];
      __int16 v11 = v10;
      if (v10)
      {
        [v10 indexPathForObjectReference:v9];
      }
      else
      {
        long long v12 = 0u;
        long long v13 = 0u;
      }
      long long v14 = v12;
      long long v15 = v13;
    }
    long long v12 = v14;
    long long v13 = v15;
    [v4 setHighlightedMemoryIndexPath:&v12];
  }
}

- (void)_updateHighlightedIndexPathInLayout
{
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  [(PXMemoriesFeedViewControllerHelper *)self _updateHighlightedIndexPathInLayout:v5];
  v3 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  id v4 = [v3 targetLayout];

  if (v4 != v5) {
    [(PXMemoriesFeedViewControllerHelper *)self _updateHighlightedIndexPathInLayout:v4];
  }
}

- (void)_updateSelectedIndexPathsInLayout:(id)a3
{
  id v9 = a3;
  id v4 = [(PXMemoriesFeedViewControllerHelper *)self selectionManager];
  id v5 = [v4 selectionSnapshot];
  id v6 = [v9 dataSource];
  id v7 = [v5 dataSource];

  if (v6 == v7)
  {
    id v8 = [v5 selectedIndexPaths];
    [v9 setSelectedMemoryIndexPaths:v8];
  }
}

- (void)_updateSelectedIndexPathsInLayout
{
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  [(PXMemoriesFeedViewControllerHelper *)self _updateSelectedIndexPathsInLayout:v5];
  v3 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  id v4 = [v3 targetLayout];

  if (v4 != v5) {
    [(PXMemoriesFeedViewControllerHelper *)self _updateSelectedIndexPathsInLayout:v4];
  }
}

- (void)_handleDataSourceChange
{
  v3 = [(PXMemoriesFeedViewControllerHelper *)self _layoutEngine];
  id v4 = [v3 dataSourceSnapshot];
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
  id v6 = [v5 dataSource];

  id v7 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
  id v8 = [v7 changeHistory];
  id v9 = objc_msgSend(v8, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v4, "identifier"), objc_msgSend(v6, "identifier"));

  if ([v9 count] == 1)
  {
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }
  [(PXMemoriesFeedViewControllerHelper *)self _handleChangeFromDataSource:v4 toDataSource:v6 withChangeDetails:v10];
  if ([v6 numberOfSections] < 1)
  {
    __int16 v11 = 0;
  }
  else
  {
    __int16 v11 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  }
  [(PXMemoriesFeedViewControllerHelper *)self saveAnchorMemory];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__PXMemoriesFeedViewControllerHelper__handleDataSourceChange__block_invoke;
  v16[3] = &unk_1E5DBD300;
  id v17 = v11;
  id v18 = v6;
  id v19 = v10;
  id v12 = v10;
  id v13 = v6;
  id v14 = v11;
  [v3 performChanges:v16];
  if (self->_hasAppeared)
  {
    long long v15 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
    [v15 updateCurrentMemoriesNonPendingAndNotificationStatus];
  }
}

void __61__PXMemoriesFeedViewControllerHelper__handleDataSourceChange__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setSeedItem:v3];
  [v4 setDataSourceSnapshot:a1[5] withChangeDetails:a1[6]];
}

- (void)saveAnchorMemory
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  [v2 visibleRect];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x7810000000;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v23[3] = &unk_1AB5D584F;
  uint64_t v29 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0xE010000000;
  v10[3] = &unk_1AB5D584F;
  long long v3 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v19 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v20 = v3;
  long long v4 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v21 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v22 = v4;
  long long v5 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v15 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v16 = v5;
  long long v6 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v17 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v18 = v6;
  long long v7 = *((_OWORD *)off_1E5DAB048 + 1);
  long long v11 = *(_OWORD *)off_1E5DAB048;
  long long v12 = v7;
  long long v8 = *((_OWORD *)off_1E5DAB048 + 3);
  long long v13 = *((_OWORD *)off_1E5DAB048 + 2);
  long long v14 = v8;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0x7FEFFFFFFFFFFFFFLL;
  [v2 contentInset];
  [v2 visibleRect];
  PXEdgeInsetsInsetRect();
}

void __54__PXMemoriesFeedViewControllerHelper_saveAnchorMemory__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ((*(void *)(a2 + 8) | 2) == 3) {
    PXDistanceBetweenPoints();
  }
}

- (void)scrollMemoryReferenceToVisible:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  long long v8 = [v7 scrollController];
  [v8 updateIfNeeded];

  id v9 = [v7 currentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 dataSource];
    long long v11 = v10;
    int64x2_t v12 = 0uLL;
    int64x2_t v43 = 0u;
    int64x2_t v44 = 0u;
    if (v10)
    {
      [v10 indexPathForObjectReference:v6];
      if (v43.i64[0] != *(void *)off_1E5DAAED8)
      {
        double v13 = *MEMORY[0x1E4F1DB20];
        double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        [v11 firstItemIndexPath];
        int64x2_t v18 = v41;
        int64x2_t v17 = v42;
        int64x2_t v12 = v43;
        int64x2_t v19 = v44;
LABEL_7:
        if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v12, v18), (int32x4_t)vceqq_s64(v19, v17))), 0xFuLL))))
        {
          [v9 contentBounds];
          double v13 = v20;
          double v14 = v21;
          double v15 = v22;
          double v16 = 1.0;
        }
        else
        {
          memset(v40, 0, sizeof(v40));
          long long v33 = xmmword_1AB359CF0;
          uint64_t v34 = [v11 identifier];
          uint64_t v35 = v43.i64[1];
          int64x2_t v36 = v44;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v39 = 0;
          if ([v9 getGeometry:v40 group:0 userData:0 forTileWithIdentifier:&v33]) {
            sub_1AB23B20C();
          }
        }
        v45.origin.double x = v13;
        v45.origin.double y = v14;
        v45.size.width = v15;
        v45.size.height = v16;
        if (!CGRectIsNull(v45))
        {
          double v23 = +[PXTilingCoordinateSpaceConverter defaultConverter];
          objc_msgSend(v23, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "coordinateSpaceIdentifier"), objc_msgSend(v7, "contentCoordinateSpaceIdentifier"), v13, v14, v15, v16);
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          v32 = [(PXMemoriesFeedViewControllerHelper *)self scrollViewController];
          objc_msgSend(v32, "scrollRectToVisible:animated:", v4, v25, v27, v29, v31);
        }
      }
    }
    else if (*(void *)off_1E5DAAED8)
    {
      double v13 = *MEMORY[0x1E4F1DB20];
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      int64x2_t v41 = 0uLL;
      int64x2_t v42 = 0uLL;
      int64x2_t v19 = 0uLL;
      int64x2_t v18 = 0uLL;
      int64x2_t v17 = 0uLL;
      goto LABEL_7;
    }
  }
}

- (void)_configureMetrics:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(PXMemoriesFeedViewControllerHelper *)self _spec];
  [v11 setSpec:v4];
  long long v5 = [(PXMemoriesFeedViewControllerHelper *)self traitCollection];
  [v5 layoutReferenceSize];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v11, "setReferenceSize:", v7, v9);
  [v4 layoutInsets];
  objc_msgSend(v11, "setContentInsets:");
  if (self->_delegateRespondsTo.configureMetrics)
  {
    id v10 = [(PXMemoriesFeedViewControllerHelper *)self delegate];
    [v10 memoriesFeedViewControllerHelper:self configureMetrics:v11];
  }
}

- (void)_updateLayoutEngineIfNeeded
{
  if (self->_needsToUpdate.layoutEngine)
  {
    self->_needsToUpdate.layoutEngine = 0;
    BOOL v4 = PLMemoriesGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Updating memories feed layout", buf, 2u);
    }

    long long v5 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
    double v6 = [v5 dataSource];
    double v7 = [(PXMemoriesFeedViewControllerHelper *)self _spec];
    id v8 = objc_alloc_init((Class)[v7 feedLayoutMetricsClass]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64x2_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 592, @"Invalid parameter not satisfying: %@", @"[metrics isKindOfClass:[PXMemoriesFeedLayoutMetrics class]]" object file lineNumber description];
    }
    [(PXMemoriesFeedViewControllerHelper *)self _configureMetrics:v8];
    double v9 = (void *)[v7 newLayoutGeneratorWithMetrics:v8];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64x2_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 596, @"Invalid parameter not satisfying: %@", @"[layoutGenerator isKindOfClass:[PXMemoriesFeedLayoutGenerator class]]" object file lineNumber description];
    }
    uint64_t v10 = [v7 feedAxis];
    [(PXSectionedLayoutEngine *)self->__layoutEngine setDelegate:0];
    id v11 = [PXSectionedLayoutEngine alloc];
    [v7 layoutInsets];
    int64x2_t v12 = -[PXSectionedLayoutEngine initWithAxis:layoutGenerator:dataSourceSnapshot:insets:](v11, "initWithAxis:layoutGenerator:dataSourceSnapshot:insets:", v10, v9, v6);
    layoutEngine = self->__layoutEngine;
    self->__layoutEngine = v12;

    [(PXSectionedLayoutEngine *)self->__layoutEngine setDelegate:self];
    double v14 = [(PXSectionedLayoutEngine *)self->__layoutEngine performChangesAndWait:&__block_literal_global_129262];
    if (!self->_delegateRespondsTo.feedIsVisible
      || ([(PXMemoriesFeedViewControllerHelper *)self delegate],
          double v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 memoriesFeedViewControllerHelperFeedIsVisible:self],
          v15,
          (v16 & 1) == 0))
    {
      [(PXMemoriesFeedViewControllerHelper *)self _handleNewLayoutSnapshot:v14];
    }
  }
}

void __65__PXMemoriesFeedViewControllerHelper__updateLayoutEngineIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28D58];
  id v4 = a2;
  long long v3 = [v2 indexPathForItem:0 inSection:0];
  [v4 setSeedItem:v3];

  objc_msgSend(v4, "setSeedSize:", 1000000.0, 1000000.0);
}

- (BOOL)_needsUpdate
{
  return self->_needsToUpdate.layoutEngine;
}

- (void)_updateIfNeeded
{
  if ([(PXMemoriesFeedViewControllerHelper *)self _needsUpdate])
  {
    [(PXMemoriesFeedViewControllerHelper *)self _updateLayoutEngineIfNeeded];
  }
}

- (void)_setSpec:(id)a3
{
  long long v5 = (PXMemoriesSpec *)a3;
  if (self->__spec != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->__spec, a3);
    [(PXMemoriesFeedViewControllerHelper *)self _invalidateLayoutEngine];
    long long v5 = v6;
  }
}

- (void)_invalidateLayoutEngine
{
  self->_needsToUpdate.layoutEngine = 1;
}

- (void)_enumerateInsertedItemsInChangeDetails:(id)a3 withDataSource:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v10 = [v7 toDataSourceIdentifier];
  id v11 = [v7 sectionChanges];
  if ([v11 hasIncrementalChanges])
  {
    int64x2_t v12 = [v11 insertedIndexes];
  }
  else
  {
    int64x2_t v12 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke;
  v21[3] = &unk_1E5DBD268;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  double v24 = &v26;
  uint64_t v25 = v10;
  [v12 enumerateIndexesUsingBlock:v21];
  if (!*((unsigned char *)v27 + 24))
  {
    double v15 = [v7 sectionsWithItemChanges];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_2;
    v16[3] = &unk_1E5DBD268;
    id v17 = v7;
    id v18 = v14;
    int64x2_t v19 = &v26;
    uint64_t v20 = v10;
    [v15 enumerateIndexesUsingBlock:v16];
  }
  _Block_object_dispose(&v26, 8);
}

uint64_t __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfItemsInSection:a2];
  if (result >= 1)
  {
    uint64_t v8 = result;
    for (uint64_t i = 0; i != v8; ++i)
    {
      v10[0] = *(void *)(a1 + 56);
      v10[1] = a2;
      v10[2] = i;
      v10[3] = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t result = (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, *(void *)(*(void *)(a1 + 48) + 8) + 24, v7);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
  return result;
}

void __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  double v6 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  if ([v6 hasIncrementalChanges])
  {
    uint64_t v7 = [v6 insertedIndexes];
  }
  else
  {
    uint64_t v7 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_3;
  v10[3] = &unk_1E5DBD290;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = a2;
  id v11 = v8;
  uint64_t v12 = v9;
  [v7 enumerateIndexesUsingBlock:v10];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

uint64_t __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t result = (*(uint64_t (**)(void, long long *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &v7, *(void *)(*(void *)(a1 + 40) + 8) + 24, a4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (id)_memoryReferenceInsertedOnChangeToDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 toDataSourceIdentifier];
    if (v10 != [v7 identifier])
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PXMemoriesFeedViewControllerHelper.m" lineNumber:503 description:@"data source identifier mismatch"];
    }
    uint64_t v18 = 0;
    int64x2_t v19 = &v18;
    uint64_t v20 = 0x4010000000;
    double v21 = &unk_1AB5D584F;
    long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v22 = *(_OWORD *)off_1E5DAB028;
    long long v23 = v11;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__PXMemoriesFeedViewControllerHelper__memoryReferenceInsertedOnChangeToDataSource_withChangeDetails___block_invoke;
    v17[3] = &unk_1E5DBD240;
    v17[4] = &v18;
    [(PXMemoriesFeedViewControllerHelper *)self _enumerateInsertedItemsInChangeDetails:v9 withDataSource:v7 usingBlock:v17];
    if (v19[4] == *(void *)off_1E5DAAED8)
    {
      uint64_t v12 = 0;
    }
    else
    {
      long long v13 = *((_OWORD *)v19 + 3);
      v16[0] = *((_OWORD *)v19 + 2);
      v16[1] = v13;
      uint64_t v12 = [v7 objectReferenceAtIndexPath:v16];
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __101__PXMemoriesFeedViewControllerHelper__memoryReferenceInsertedOnChangeToDataSource_withChangeDetails___block_invoke(uint64_t result, _OWORD *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v5 = *(void *)(v3 + 32);
  id v4 = (_OWORD *)(v3 + 32);
  if (v5 == *(void *)off_1E5DAAED8)
  {
    long long v6 = a2[1];
    *id v4 = *a2;
    v4[1] = v6;
  }
  else
  {
    *a3 = 1;
  }
  return result;
}

- (void)_handleFinishedRequestingNewMemoriesWithSuccess:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v13 = a5;
  if ((a4 | 2) == 2)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXMemoriesFeedViewControllerHelper.m" lineNumber:489 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PXMemoriesFeedViewControllerHelper *)self _setRequestingNewMemories:0];
  uint64_t v9 = [(PXMemoriesFeedViewControllerHelper *)self _newMemoriesRequestCompletion];

  uint64_t v10 = v13;
  if (v9)
  {
    long long v11 = [(PXMemoriesFeedViewControllerHelper *)self _newMemoriesRequestCompletion];
    ((void (**)(void, BOOL, id))v11)[2](v11, v6, v13);

    [(PXMemoriesFeedViewControllerHelper *)self _setNewMemoriesRequestCompletion:0];
    uint64_t v10 = v13;
  }
}

- (void)_handleRefreshCompletionWithResultInformation:(id)a3 reason:(unint64_t)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PLMemoriesGetLog();
  long long v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Memories refresh result: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Memories refresh error: %@", buf, 0xCu);
  }

  uint64_t v12 = +[PXMemoriesFeedSettings sharedInstance];
  uint64_t v13 = [v12 dataSourceType];

  uint64_t v14 = [v9 domain];
  long long v11 = v14;
  if (v13 == 3)
  {
    if ([v14 isEqualToString:@"com.apple.photoanalysis"])
    {
      uint64_t v15 = [v9 code];

      if (v15 == 6)
      {
        uint64_t v16 = 30;
        goto LABEL_13;
      }
LABEL_16:
      [(PXMemoriesFeedViewControllerHelper *)self _handleFinishedRequestingNewMemoriesWithSuccess:v8 != 0 reason:a4 error:0];
      goto LABEL_17;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (![v14 isEqualToString:@"com.apple.photos.test"]) {
    goto LABEL_15;
  }
  uint64_t v17 = [v9 code];

  if (v17 != 42) {
    goto LABEL_16;
  }
  uint64_t v16 = 3;
LABEL_13:
  int64_t v18 = [(PXMemoriesFeedViewControllerHelper *)self _refreshRetryCount];
  [(PXMemoriesFeedViewControllerHelper *)self _setRefreshRetryCount:v18 + 1];
  if (v18 >= v16) {
    goto LABEL_16;
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v19 = dispatch_time(0, 5000000000);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__PXMemoriesFeedViewControllerHelper__handleRefreshCompletionWithResultInformation_reason_error___block_invoke;
  v20[3] = &unk_1E5DD0260;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = (id)a4;
  dispatch_after(v19, MEMORY[0x1E4F14428], v20);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
LABEL_17:
}

void __97__PXMemoriesFeedViewControllerHelper__handleRefreshCompletionWithResultInformation_reason_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startRefreshForReason:*(void *)(a1 + 40)];
}

- (void)_startRefreshForReason:(unint64_t)a3
{
  uint64_t v5 = +[PXMemoriesFeedSettings sharedInstance];
  uint64_t v6 = [v5 dataSourceType];

  if (v6 != 3)
  {
    BOOL v7 = [(PXMemoriesFeedViewControllerHelper *)self _refreshRetryCount] < 2;
    objc_initWeak(&location, self);
    BOOL v9 = v7;
    objc_copyWeak(v8, &location);
    v8[1] = (id)a3;
    px_dispatch_on_main_queue();
  }
}

void __61__PXMemoriesFeedViewControllerHelper__startRefreshForReason___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    v2 = 0;
  }
  else {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = v2;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.test" code:42 userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRefreshCompletionWithResultInformation:v5 reason:*(void *)(a1 + 40) error:v3];
}

- (void)invalidateMetrics
{
  [(PXMemoriesFeedViewControllerHelper *)self _invalidateLayoutEngine];
  [(PXMemoriesFeedViewControllerHelper *)self _updateIfNeeded];
}

- (void)feedViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  [(PXMemoriesFeedViewControllerHelper *)self saveAnchorMemory];
  self->_hasAppeared = 0;
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self eventTracker];
  [v5 logViewControllerDidDisappear:v4];
}

- (void)feedViewControllerDidAppear:(id)a3 shouldUpdateNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
  if (!self->_hasKickedOffBatchGeneration)
  {
    self->_hasKickedOffBatchGeneration = 1;
    [v8 generateAdditionalEntriesIfPossible];
  }
  self->_hasAppeared = 1;
  BOOL v7 = [(PXMemoriesFeedViewControllerHelper *)self eventTracker];
  [v7 logViewControllerDidAppear:v6];

  if (v4) {
    [v8 updateCurrentMemoriesNonPendingAndNotificationStatus];
  }
}

- (void)setHighlightedMemoryReference:(id)a3
{
  id v5 = (PXSectionedObjectReference *)a3;
  if (self->_highlightedMemoryReference != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_highlightedMemoryReference, a3);
    [(PXMemoriesFeedViewControllerHelper *)self _updateHighlightedIndexPathInLayout];
    id v5 = v6;
  }
}

- (void)setLastActionPresentationMemoryReference:(id)a3
{
  id v5 = (PXSectionedObjectReference *)a3;
  if (self->_lastActionPresentationMemoryReference != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_lastActionPresentationMemoryReference, a3);
    [(PXMemoriesFeedViewControllerHelper *)self _updateHighlightedIndexPathInLayout];
    id v5 = v6;
  }
}

- (void)setActivatedMemoryReference:(id)a3
{
  id v5 = (PXSectionedObjectReference *)a3;
  if (self->_activatedMemoryReference != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_activatedMemoryReference, a3);
    [(PXMemoriesFeedViewControllerHelper *)self _updateHighlightedIndexPathInLayout];
    id v5 = v6;
  }
}

- (PXMemoriesFeedTilingLayout)targetLayout
{
  v2 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  uint64_t v3 = [v2 targetLayout];

  return (PXMemoriesFeedTilingLayout *)v3;
}

- (PXMemoriesFeedTilingLayout)currentLayout
{
  v2 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  uint64_t v3 = [v2 currentLayout];

  return (PXMemoriesFeedTilingLayout *)v3;
}

- (PXSimpleIndexPath)indexPathForMemoryObjectReference:(SEL)a3
{
  id v6 = a4;
  long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v7;
  if (v6)
  {
    id v8 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
    BOOL v9 = [v8 dataSource];
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 indexPathForObjectReference:v6];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v12;
    *(_OWORD *)&retstr->item = v13;
  }
  return result;
}

- (id)memoryInfoAtIndexPath:(PXSimpleIndexPath *)a3
{
  BOOL v4 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  id v5 = [v4 dataSource];
  long long v6 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v6;
  long long v7 = [v5 objectAtIndexPath:v9];

  return v7;
}

- (PXSimpleIndexPath)indexPathForMemoryInScrollViewAtPoint:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v8;
  BOOL v9 = [(PXMemoriesFeedViewControllerHelper *)self tilingController];
  uint64_t v10 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  if (v10)
  {
    long long v11 = +[PXTilingCoordinateSpaceConverter defaultConverter];
    objc_msgSend(v11, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "contentCoordinateSpaceIdentifier"), objc_msgSend(v10, "coordinateSpaceIdentifier"), x, y);
    double v13 = v12;
    double v15 = v14;

    objc_msgSend(v10, "indexPathForMemoryAtPoint:", v13, v15);
    *(_OWORD *)&retstr->dataSourceIdentifier = v17;
    *(_OWORD *)&retstr->item = v18;
  }

  return result;
}

- (id)memoryInfoForMemoryObjectReference:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
    long long v6 = [v5 dataSource];
    long long v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v10 = [(PXMemoriesFeedViewControllerHelper *)self dataSourceManager];
      id v8 = [v10 dataSource];
    }
    BOOL v9 = [v8 objectReferenceForObjectReference:v4];

    if (v9)
    {
      [v9 indexPath];
      id v4 = [v8 objectAtIndexPath:&v12];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v4;
}

- (id)memoryInfoInScrollViewAtPoint:(CGPoint)a3
{
  id v4 = -[PXMemoriesFeedViewControllerHelper memoryObjectReferenceInScrollViewAtPoint:](self, "memoryObjectReferenceInScrollViewAtPoint:", a3.x, a3.y);
  id v5 = [(PXMemoriesFeedViewControllerHelper *)self memoryInfoForMemoryObjectReference:v4];

  return v5;
}

- (id)memoryObjectReferenceInScrollViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v6 = [(PXMemoriesFeedViewControllerHelper *)self currentLayout];
  long long v7 = [v6 dataSource];
  long long v11 = 0u;
  long long v12 = 0u;
  -[PXMemoriesFeedViewControllerHelper indexPathForMemoryInScrollViewAtPoint:](self, "indexPathForMemoryInScrollViewAtPoint:", x, y);
  if (v7 && (void)v11 != *(void *)off_1E5DAAED8)
  {
    v10[0] = v11;
    v10[1] = v12;
    id v8 = [v7 objectReferenceAtIndexPath:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)didChangeTilingControllerLayout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXMemoriesFeedViewControllerHelper *)self _memoryReferenceToScrollToVisible];
  if (v3)
  {
    [(PXMemoriesFeedViewControllerHelper *)self _setMemoryReferenceToScrollToVisible:0];
    id v4 = PLMemoriesGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412546;
      long long v6 = self;
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ scrolling memory reference %@", (uint8_t *)&v5, 0x16u);
    }

    [(PXMemoriesFeedViewControllerHelper *)self scrollMemoryReferenceToVisible:v3 animated:self->_hasAppeared];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->feedIsVisible = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->reloadedTileKindsOnObjectChanged = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->configureMetrics = objc_opt_respondsToSelector() & 1;
  }
}

- (void)requestNewMemoriesWithCompletion:(id)a3
{
}

- (void)requestNewMemoriesForReason:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ((a3 | 2) != 3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 239, @"Invalid parameter not satisfying: %@", @"(PHMemoryCreationReasonUserRequest == reason) || (PHMemoryCreationReasonTodayWidgetRequest == reason)" object file lineNumber description];
  }
  BOOL v9 = [(PXMemoriesFeedViewControllerHelper *)self _isRequestingNewMemories];
  BOOL v10 = [(PXMemoriesFeedViewControllerHelper *)self canRequestNewMemoriesForReason:a3];
  if (!v9 && v10)
  {
    [(PXMemoriesFeedViewControllerHelper *)self _setNewMemoriesRequestCompletion:v7];
    [(PXMemoriesFeedViewControllerHelper *)self _setRequestingNewMemories:1];
    [(PXMemoriesFeedViewControllerHelper *)self _setRefreshRetryCount:0];
    long long v11 = [MEMORY[0x1E4F1C9C8] date];
    [(PXMemoriesFeedViewControllerHelper *)self _setLastUserMemoryGenerationRequestDate:v11];

    [(PXMemoriesFeedViewControllerHelper *)self _startRefreshForReason:a3];
    goto LABEL_18;
  }
  long long v12 = PLMemoriesGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13) {
      goto LABEL_16;
    }
    double v14 = "Widget";
    if (a3 == 1) {
      double v14 = "User";
    }
    *(_DWORD *)buf = 136315138;
    long long v18 = v14;
    double v15 = "%s request to generate memories ignored: request already in progress";
  }
  else
  {
    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v16 = "Widget";
    if (a3 == 1) {
      uint64_t v16 = "User";
    }
    *(_DWORD *)buf = 136315138;
    long long v18 = v16;
    double v15 = "%s request to generate memories ignored: reached request limit";
  }
  _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
LABEL_16:

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
LABEL_18:
}

- (BOOL)canRequestNewMemories
{
  return [(PXMemoriesFeedViewControllerHelper *)self canRequestNewMemoriesForReason:1];
}

- (BOOL)canRequestNewMemoriesForReason:(unint64_t)a3
{
  long long v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v6 BOOLForKey:@"PXIgnoreRefreshLimit"] & 1) != 0 || a3 == 1)
  {
    BOOL v7 = 1;
  }
  else
  {
    if (!a3 || a3 == 2)
    {
      BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXMemoriesFeedViewControllerHelper.m" lineNumber:224 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_handleChangeFromDataSource:(id)a3 toDataSource:(id)a4 withChangeDetails:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a4;
  BOOL v9 = (NSString *)a5;
  BOOL v10 = PLMemoriesGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    double v30 = v8;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "%@ data source changed to %@ with details %@", buf, 0x20u);
  }

  long long v11 = [(PXMemoriesFeedViewControllerHelper *)self _lastUserMemoryGenerationRequestDate];
  long long v12 = v11;
  if (v11)
  {
    [v11 timeIntervalSinceNow];
    double v14 = v13;
    [(PXMemoriesFeedViewControllerHelper *)self _setLastUserMemoryGenerationRequestDate:v12];
    if (v14 <= 0.0 && v14 > -36000.0)
    {
      double v15 = [(PXMemoriesFeedViewControllerHelper *)self _memoryReferenceInsertedOnChangeToDataSource:v8 withChangeDetails:v9];
      uint64_t v16 = PLMemoriesGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
  if (!a3
    && [(NSString *)v8 numberOfSections] >= 1
    && [(NSString *)v8 numberOfItemsInSection:0] >= 1)
  {
    v26[0] = [(NSString *)v8 identifier];
    v26[1] = 0;
    v26[2] = 0;
    v26[3] = 0x7FFFFFFFFFFFFFFFLL;
    double v15 = [(NSString *)v8 objectReferenceAtIndexPath:v26];
    uint64_t v16 = PLMemoriesGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_16:
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      double v30 = v15;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "%@ memory to scroll to visible %@", buf, 0x16u);
    }
LABEL_17:

    [(PXMemoriesFeedViewControllerHelper *)self _setMemoryReferenceToScrollToVisible:v15];
LABEL_26:

    goto LABEL_27;
  }
  if (self->_scrollTargetMemoryUUID)
  {
    -[NSString sectionedObjectReferenceForMemoryUUID:](v8, "sectionedObjectReferenceForMemoryUUID:");
    double v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      [(PXMemoriesFeedViewControllerHelper *)self _setMemoryReferenceToScrollToVisible:v15];
      [(PXMemoriesFeedViewControllerHelper *)self setScrollTargetMemoryUUID:0];
      long long v17 = PLMemoriesGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        scrollTargetMemoryUUID = self->_scrollTargetMemoryUUID;
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = self;
        __int16 v29 = 2112;
        double v30 = v15;
        __int16 v31 = 2112;
        v32 = scrollTargetMemoryUUID;
        uint64_t v19 = "%@ memory to scroll to a memory target %@ (uuid - %@)";
        uint64_t v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
        uint32_t v22 = 32;
LABEL_24:
        _os_log_impl(&dword_1A9AE7000, v20, v21, v19, buf, v22);
      }
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v23 = _handleChangeFromDataSource_toDataSource_withChangeDetails__numberOfRetry++;
    if (v23 < 2)
    {
      long long v17 = PLMemoriesGetLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      uint64_t v25 = self->_scrollTargetMemoryUUID;
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      double v30 = v25;
      uint64_t v19 = "%@ attempted to scroll to a memory with uuid %@ but couldn't find sectioned object reference for it. Try aga"
            "in at the next iteration of datasource change.";
      uint64_t v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      [(PXMemoriesFeedViewControllerHelper *)self setScrollTargetMemoryUUID:0];
      _handleChangeFromDataSource_toDataSource_withChangeDetails__numberOfRetrdouble y = 0;
      long long v17 = PLMemoriesGetLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      uint64_t v24 = self->_scrollTargetMemoryUUID;
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      double v30 = v24;
      uint64_t v19 = "%@ Failed to scroll to a memory with uuid %@";
      uint64_t v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    }
    uint32_t v22 = 22;
    goto LABEL_24;
  }
LABEL_27:
}

- (PXMemoriesFeedViewControllerHelper)initWithScrollViewController:(id)a3 photoLibrary:(id)a4 traitCollection:(id)a5 memoriesStyle:(unint64_t)a6 tilingControllerConfigurationBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, PXTilingController *, PXMemoriesSpec *))a7;
  v45.receiver = self;
  v45.super_class = (Class)PXMemoriesFeedViewControllerHelper;
  long long v17 = [(PXMemoriesFeedViewControllerHelper *)&v45 init];
  long long v18 = v17;
  if (v17)
  {
    v17->_needsToUpdate.layoutEngine = 1;
    uint64_t v19 = PXMemoriesViewControllerEventTrackerCreate(v15);
    eventTracker = v18->_eventTracker;
    v18->_eventTracker = (PXViewControllerEventTracker *)v19;

    objc_storeStrong((id *)&v18->_scrollViewController, a3);
    objc_storeStrong((id *)&v18->_photoLibrary, a4);
    objc_storeStrong((id *)&v18->_traitCollection, a5);
    os_log_type_t v21 = [[PXMemoriesSpecManager alloc] initWithExtendedTraitCollection:v15 options:0 style:a6];
    specManager = v18->_specManager;
    v18->_specManager = v21;

    uint64_t v23 = [(PXFeatureSpecManager *)v18->_specManager spec];
    spec = v18->__spec;
    v18->__spec = (PXMemoriesSpec *)v23;

    uint64_t v25 = objc_msgSend(objc_alloc(-[PXMemoriesSpec feedDataSourceManagerClass](v18->__spec, "feedDataSourceManagerClass")), "initWithPhotoLibrary:", v14);
    dataSourceManager = v18->_dataSourceManager;
    v18->_dataSourceManager = (PXMemoriesFeedDataSourceManager *)v25;

    [(PXMemoriesFeedDataSourceManagerBase *)v18->_dataSourceManager startObservingChanges];
    uint64_t v27 = [objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v18->_dataSourceManager];
    selectionManager = v18->_selectionManager;
    v18->_selectionManager = (PXSectionedSelectionManager *)v27;

    [(PXSectionedDataSourceManager *)v18->_dataSourceManager registerChangeObserver:v18 context:PXDataSourceManagerObservationContext_129244];
    [(PXSectionedSelectionManager *)v18->_selectionManager registerChangeObserver:v18 context:PXSelectionManagerObservationContext_129247];
    [(PXExtendedTraitCollection *)v18->_traitCollection registerChangeObserver:v18 context:PXExtendedTraitCollectionObservationContext_129245];
    [(PXMemoriesSpecManager *)v18->_specManager registerChangeObserver:v18 context:PXSpecManagerObservationContext_129246];
    [(PXMemoriesFeedDataSourceManager *)v18->_dataSourceManager startGeneratingMemories];
    __int16 v29 = [[PXMemoriesFeedScrollFilter alloc] initWithScrollViewController:v18->_scrollViewController];
    scrollFilter = v18->__scrollFilter;
    v18->__scrollFilter = v29;

    [(PXMemoriesFeedScrollFilter *)v18->__scrollFilter setDelegate:v18];
    [(PXMemoriesFeedScrollFilter *)v18->__scrollFilter setSpec:v18->__spec];
    id v31 = objc_alloc_init([(PXMemoriesSpec *)v18->__spec feedTransitionAnimationCoordinatorClass]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64x2_t v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, v18, @"PXMemoriesFeedViewControllerHelper.m", 141, @"Invalid parameter not satisfying: %@", @"[transitionAnimationCoordinator isKindOfClass:[PXMemoriesFeedTransitionAnimationCoordinator class]]" object file lineNumber description];
    }
    objc_storeStrong((id *)&v18->__transitionAnimationCoordinator, v31);
    v32 = [PXMemoriesFeedTilingLayout alloc];
    uint64_t v33 = v18->__spec;
    uint64_t v34 = [(PXLayoutEngine *)v18->__layoutEngine layoutSnapshot];
    uint64_t v35 = [(PXMemoriesFeedTilingLayout *)v32 initWithSpec:v33 layoutSnapshot:v34];

    [(PXMemoriesFeedViewControllerHelper *)v18 _configureLayout:v35];
    int64x2_t v36 = [[PXTilingController alloc] initWithLayout:v35];
    tilingController = v18->_tilingController;
    v18->_tilingController = v36;

    [(PXTilingController *)v18->_tilingController setScrollController:v18->_scrollViewController];
    [(PXTilingController *)v18->_tilingController setScrollDelegate:v18];
    [(PXTilingController *)v18->_tilingController setTransitionDelegate:v18];
    v16[2](v16, v18->_tilingController, v18->__spec);
    long long v38 = [(PXTilingController *)v18->_tilingController tileSource];

    if (!v38)
    {
      int64x2_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:a2 object:v18 file:@"PXMemoriesFeedViewControllerHelper.m" lineNumber:153 description:@"The configured tiling controller must have a tile source."];
    }
    uint64_t v39 = [(PXTilingController *)v18->_tilingController tileAnimator];

    if (!v39)
    {
      int64x2_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2 object:v18 file:@"PXMemoriesFeedViewControllerHelper.m" lineNumber:154 description:@"The configured tiling controller must have a tile animator."];
    }
  }

  return v18;
}

- (PXMemoriesFeedViewControllerHelper)initWithScrollViewController:(id)a3 photoLibrary:(id)a4 traitCollection:(id)a5 tilingControllerConfigurationBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXMemoriesFeedViewControllerHelper.m", 108, @"Invalid parameter not satisfying: %@", @"traitCollection" object file lineNumber description];
  }
  id v15 = [(PXMemoriesFeedViewControllerHelper *)self initWithScrollViewController:v11 photoLibrary:v12 traitCollection:v13 memoriesStyle:0 tilingControllerConfigurationBlock:v14];

  return v15;
}

- (PXMemoriesFeedViewControllerHelper)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesFeedViewControllerHelper;
  long long v6 = [(PXMemoriesFeedViewControllerHelper *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

@end