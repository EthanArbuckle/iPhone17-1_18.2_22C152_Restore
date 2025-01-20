@interface PXCuratedLibraryViewProvider
- (BOOL)attemptSetInSelectMode:(BOOL)a3;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)canSelectObjectAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4;
- (BOOL)ensureSelectMode;
- (BOOL)zoomablePhotosInteractionShouldBegin:(id)a3;
- (CGPoint)pointForPointReference:(id)a3 inCoordinateSpace:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (PXAssetReference)preferredAnchorAssetReference;
- (PXAssetsDataSourceCountsController)itemCountsController;
- (PXCuratedLibraryAssetsDataSourceManager)assetsDataSourceManager;
- (PXCuratedLibraryEventTracker)eventTracker;
- (PXCuratedLibraryFooterController)footerController;
- (PXCuratedLibraryLayout)layout;
- (PXCuratedLibraryVideoPlaybackController)videoPlaybackController;
- (PXCuratedLibraryViewModel)viewModel;
- (PXCuratedLibraryViewProvider)init;
- (PXCuratedLibraryViewProvider)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4;
- (PXCuratedLibraryViewProvider)initWithPhotoLibrary:(id)a3 extendedTraitCollection:(id)a4;
- (PXCuratedLibraryViewProvider)initWithPhotoLibrary:(id)a3 extendedTraitCollection:(id)a4 initialZoomLevel:(int64_t)a5;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXGAXResponder)axNextResponder;
- (PXGView)gridView;
- (PXLibraryFilterState)libraryFilterState;
- (PXSectionedObjectReference)preferredObjectReferenceToScrollToWhenRestoringState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXSimpleIndexPath)_indexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5;
- (PXSimpleIndexPath)selectableIndexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5;
- (PXSimpleIndexPath)selectionManager:(SEL)a3 indexPathClosestToIndexPath:(id)a4 inDirection:(PXSimpleIndexPath *)a5;
- (PXUIMediaProvider)mediaProvider;
- (PXZoomablePhotosInteraction)zoomablePhotosInteraction;
- (UIEdgeInsets)anchorPaddingForCurrentZoomLevel;
- (id)_itemsGeometryForDataSource:(id)a3;
- (id)additionalRectDiagnosticsProvidersForView:(id)a3;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)discoverabilityTitleForActionType:(id)a3;
- (id)hitTestResultControlsForCurrentZoomLevel;
- (id)indexPathsForItemsInRect:(CGRect)a3 coordinateSpace:(id)a4;
- (id)indexPathsFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5;
- (id)pointReferenceAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)selectionContainerWithUndoManager:(id)a3;
- (id)selectionManager:(id)a3 indexPathsBetweenIndexPath:(PXSimpleIndexPath *)a4 andIndexPath:(PXSimpleIndexPath *)a5 inDirection:(unint64_t)a6;
- (id)titleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)zoomablePhotosInteraction:(id)a3 assetReferenceAtLocation:(CGPoint)a4;
- (int64_t)_layoutVariantToUse:(BOOL)a3 viewMode:(int64_t)a4;
- (int64_t)selectionBasisForSelectionManager:(id)a3;
- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3;
- (void)_logLibraryCountsIfNecessary;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)extendSelectionInDirection:(unint64_t)a3;
- (void)moveSelectionInDirection:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performActionWithType:(id)a3;
- (void)prepareForNavigationToObjectReference:(id)a3;
- (void)scrollLibraryViewToAssetReference:(id)a3 scrollPosition:(unint64_t)a4 completionHandler:(id)a5;
- (void)scrollLibraryViewToObjectReference:(id)a3 scrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 completionHandler:(id)a6;
- (void)setAxNextResponder:(id)a3;
- (void)toggleSelectMode;
- (void)zoomInAllPhotos;
- (void)zoomOutAllPhotos;
- (void)zoomablePhotosInteractionWillBegin:(id)a3;
@end

@implementation PXCuratedLibraryViewProvider

- (void)_logLibraryCountsIfNecessary
{
  v3 = [(PXCuratedLibraryViewProvider *)self itemCountsController];
  v4 = v3;
  if (v3) {
    [v3 counts];
  }

  v5 = [(PXCuratedLibraryViewProvider *)self eventTracker];
  [v5 logLibraryItemsCount:0];
}

- (PXAssetsDataSourceCountsController)itemCountsController
{
  return self->_itemCountsController;
}

- (void)setAxNextResponder:(id)a3
{
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (PXCuratedLibraryFooterController)footerController
{
  return self->_footerController;
}

- (PXCuratedLibraryVideoPlaybackController)videoPlaybackController
{
  return self->_videoPlaybackController;
}

- (id)additionalRectDiagnosticsProvidersForView:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PXCuratedLibrarySettings sharedInstance];
  if ([v4 enablePlaybackDiagnostics])
  {
    v7[0] = self->_videoPlaybackController;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (PXCuratedLibraryEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXCuratedLibraryViewModelObservationContext == a5) {
    goto LABEL_12;
  }
  if ((void *)CountsControllerObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
    id v17 = v9;
    [(PXCuratedLibraryViewProvider *)self _logLibraryCountsIfNecessary];
    goto LABEL_11;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_26955 == a5)
  {
    if ((v6 & 3) == 0) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ((void *)PXLibraryFilterStateObservationContext_26956 != a5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryViewProvider.m" lineNumber:849 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
LABEL_10:
    id v17 = v9;
    v10 = [(PXCuratedLibraryViewProvider *)self sharedLibraryStatusProvider];
    uint64_t v11 = [v10 hasSharedLibraryOrPreview];
    v12 = [(PXCuratedLibraryViewProvider *)self libraryFilterState];
    int64_t v13 = -[PXCuratedLibraryViewProvider _layoutVariantToUse:viewMode:](self, "_layoutVariantToUse:viewMode:", v11, [v12 viewMode]);
    v14 = [(PXCuratedLibraryViewProvider *)self viewModel];
    v15 = [v14 specManager];
    [v15 setVariant:v13];

LABEL_11:
    id v9 = v17;
  }
LABEL_12:
}

uint64_t __78__PXCuratedLibraryViewProvider_initWithConfiguration_extendedTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addView:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (PXCuratedLibraryViewProvider)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)PXCuratedLibraryViewProvider;
  v8 = [(PXCuratedLibraryViewProvider *)&v55 init];
  if (v8)
  {
    id v9 = [v6 photoLibrary];
    objc_storeStrong((id *)&v8->_photoLibrary, v9);
    objc_storeStrong((id *)&v8->_extendedTraitCollection, a4);
    uint64_t v10 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v9];
    mediaProvider = v8->_mediaProvider;
    v8->_mediaProvider = (PXUIMediaProvider *)v10;

    v12 = [[PXCuratedLibraryLayoutSpecManager alloc] initWithExtendedTraitCollection:v8->_extendedTraitCollection options:0 variant:0];
    int64_t v13 = [(PXUIMediaProvider *)v8->_mediaProvider availableThumbnailSizes];
    [(PXCuratedLibraryLayoutSpecManager *)v12 setAvailableThumbnailSizes:v13];

    v14 = -[PXCuratedLibraryStyleGuide initWithExtendedTraitCollection:secondaryToolbarStyle:]([PXCuratedLibraryStyleGuide alloc], "initWithExtendedTraitCollection:secondaryToolbarStyle:", v8->_extendedTraitCollection, [v6 secondaryToolbarStyle]);
    uint64_t v15 = [v6 initialZoomLevel];
    if (!v15)
    {
      v16 = +[PXUserDefaults standardUserDefaults];
      id v17 = [v16 curatedLibraryZoomLevel];

      if (!v17 || (uint64_t v15 = [v17 integerValue], (unint64_t)(v15 - 5) <= 0xFFFFFFFFFFFFFFFBLL))
      {
        v18 = +[PXCuratedLibrarySettings sharedInstance];
        uint64_t v15 = [v18 initialZoomLevel];
      }
      if (v15 == 3)
      {
        if ([v6 enableDays]) {
          uint64_t v15 = 3;
        }
        else {
          uint64_t v15 = 4;
        }
      }
    }
    v19 = +[PXCuratedLibraryAssetsDataSourceManagerConfiguration configurationWithPhotoLibrary:enableDays:](PXCuratedLibraryAssetsDataSourceManagerConfiguration, "configurationWithPhotoLibrary:enableDays:", v9, [v6 enableDays]);
    v20 = [[PXCuratedLibraryViewModel alloc] initWithConfiguration:v6 assetsDataSourceManagerConfiguration:v19 zoomLevel:v15 mediaProvider:v8->_mediaProvider specManager:v12 styleGuide:v14];
    viewModel = v8->_viewModel;
    v8->_viewModel = v20;

    v22 = [[PXCuratedLibraryLayout alloc] initWithViewModel:v8->_viewModel];
    layout = v8->_layout;
    v8->_layout = v22;

    uint64_t v24 = [(PXCuratedLibraryViewModel *)v8->_viewModel assetsDataSourceManager];
    assetsDataSourceManager = v8->_assetsDataSourceManager;
    v8->_assetsDataSourceManager = (PXCuratedLibraryAssetsDataSourceManager *)v24;

    uint64_t v26 = [(PXCuratedLibraryViewModel *)v8->_viewModel videoPlaybackController];
    videoPlaybackController = v8->_videoPlaybackController;
    v8->_videoPlaybackController = (PXCuratedLibraryVideoPlaybackController *)v26;

    [(PXCuratedLibraryVideoPlaybackController *)v8->_videoPlaybackController setCuratedLibraryLayout:v8->_layout];
    v28 = objc_alloc_init(PXGView);
    gridView = v8->_gridView;
    v8->_gridView = v28;

    [(PXGView *)v8->_gridView setRootLayout:v8->_layout];
    [(PXGView *)v8->_gridView setDiagnosticsSource:v8];
    [(PXGView *)v8->_gridView setAxNextResponder:v8];
    [(PXGView *)v8->_gridView registerAllTextureProvidersWithMediaProvider:v8->_mediaProvider namedImagesBundle:0];
    v30 = v8->_viewModel;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __78__PXCuratedLibraryViewProvider_initWithConfiguration_extendedTraitCollection___block_invoke;
    v53[3] = &unk_1E5DCF3F0;
    v31 = v8;
    v54 = v31;
    [(PXCuratedLibraryViewModel *)v30 performChanges:v53];
    id v32 = objc_alloc((Class)off_1E5DA5640);
    v33 = [(PXCuratedLibraryAssetsDataSourceManager *)v8->_assetsDataSourceManager dataSourceManagerForZoomLevel:4];
    uint64_t v34 = [v32 initWithAssetsDataSourceManager:v33];
    itemCountsController = v31->_itemCountsController;
    v31->_itemCountsController = (PXAssetsDataSourceCountsController *)v34;

    [(PXAssetsDataSourceCountsController *)v31->_itemCountsController registerChangeObserver:v31 context:CountsControllerObservationContext];
    if ([v6 enableFooter])
    {
      v36 = [[PXCuratedLibraryFooterController alloc] initWithGridView:v8->_gridView layout:v8->_layout viewModel:v8->_viewModel itemsCountsController:v31->_itemCountsController];
      footerController = v31->_footerController;
      v31->_footerController = v36;
    }
    uint64_t v38 = PXCuratedLibraryEventTrackerCreate(v8->_viewModel, v8->_layout);
    eventTracker = v31->_eventTracker;
    v31->_eventTracker = (PXCuratedLibraryEventTracker *)v38;

    v40 = v31->_eventTracker;
    v41 = [(PXCuratedLibraryViewModel *)v8->_viewModel analysisStatus];
    [v41 setEventTracker:v40];

    v42 = [PXZoomablePhotosInteraction alloc];
    v43 = [(PXCuratedLibraryViewModel *)v8->_viewModel zoomablePhotosViewModel];
    uint64_t v44 = [(PXZoomablePhotosInteraction *)v42 initWithZoomablePhotosViewModel:v43];
    zoomablePhotosInteraction = v31->_zoomablePhotosInteraction;
    v31->_zoomablePhotosInteraction = (PXZoomablePhotosInteraction *)v44;

    [(PXZoomablePhotosInteraction *)v31->_zoomablePhotosInteraction setView:v8->_gridView];
    [(PXZoomablePhotosInteraction *)v31->_zoomablePhotosInteraction setDelegate:v31];
    [(PXCuratedLibraryViewModel *)v8->_viewModel registerChangeObserver:v31 context:PXCuratedLibraryViewModelObservationContext];
    v46 = [(PXCuratedLibraryViewProvider *)v31 viewModel];
    uint64_t v47 = [v46 sharedLibraryStatusProvider];
    sharedLibraryStatusProvider = v31->_sharedLibraryStatusProvider;
    v31->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v47;

    [(PXSharedLibraryStatusProvider *)v31->_sharedLibraryStatusProvider registerChangeObserver:v31 context:PXSharedLibraryStatusProviderObservationContext_26955];
    v49 = [(PXCuratedLibraryViewProvider *)v31 viewModel];
    uint64_t v50 = [v49 libraryFilterState];
    libraryFilterState = v31->_libraryFilterState;
    v31->_libraryFilterState = (PXLibraryFilterState *)v50;

    [(PXLibraryFilterState *)v31->_libraryFilterState registerChangeObserver:v31 context:PXLibraryFilterStateObservationContext_26956];
    [(PXCuratedLibraryLayoutSpecManager *)v12 setVariant:[(PXCuratedLibraryViewProvider *)v31 _layoutVariantToUse:[(PXSharedLibraryStatusProvider *)v31->_sharedLibraryStatusProvider hasSharedLibraryOrPreview] viewMode:[(PXLibraryFilterState *)v31->_libraryFilterState viewMode]]];
    [(PXCuratedLibraryViewProvider *)v31 _logLibraryCountsIfNecessary];
  }
  return v8;
}

- (int64_t)_layoutVariantToUse:(BOOL)a3 viewMode:(int64_t)a4
{
  if ((unint64_t)a4 < 3 && a3) {
    return a4 + 1;
  }
  else {
    return 0;
  }
}

- (PXCuratedLibraryLayout)layout
{
  return self->_layout;
}

- (PXCuratedLibraryAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomablePhotosInteraction, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_footerController, 0);
  objc_storeStrong((id *)&self->_itemCountsController, 0);
  objc_storeStrong((id *)&self->_videoPlaybackController, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_axNextResponder);
}

- (PXZoomablePhotosInteraction)zoomablePhotosInteraction
{
  return self->_zoomablePhotosInteraction;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (UIEdgeInsets)anchorPaddingForCurrentZoomLevel
{
  v2 = [(PXCuratedLibraryViewProvider *)self viewModel];
  uint64_t v3 = [v2 zoomLevel];

  if ((unint64_t)(v3 - 1) < 2 || v3 == 4) {
    PXEdgeInsetsMake();
  }
  double v4 = *(double *)off_1E5DAAF10;
  double v5 = *((double *)off_1E5DAAF10 + 1);
  double v6 = *((double *)off_1E5DAAF10 + 2);
  double v7 = *((double *)off_1E5DAAF10 + 3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (PXSimpleIndexPath)selectionManager:(SEL)a3 indexPathClosestToIndexPath:(id)a4 inDirection:(PXSimpleIndexPath *)a5
{
  uint64_t v10 = [(PXCuratedLibraryViewProvider *)self viewModel];
  uint64_t v11 = [v10 zoomLevel];
  v12 = [v10 assetsDataSourceManager];
  int64_t v13 = [v12 dataSourceForZoomLevel:v11];

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  long long v14 = *(_OWORD *)&a5->item;
  v16[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v16[1] = v14;
  [(PXCuratedLibraryViewProvider *)self selectableIndexPathClosestToIndexPath:v16 fromDataSource:v13 inDirection:a6];

  return result;
}

- (id)selectionManager:(id)a3 indexPathsBetweenIndexPath:(PXSimpleIndexPath *)a4 andIndexPath:(PXSimpleIndexPath *)a5 inDirection:(unint64_t)a6
{
  uint64_t v10 = [(PXCuratedLibraryViewProvider *)self viewModel];
  uint64_t v11 = [v10 zoomLevel];
  v12 = [v10 assetsDataSourceManager];
  int64_t v13 = [v12 dataSourceForZoomLevel:v11];

  if (a6 == 2)
  {
    a6 = 5;
    goto LABEL_7;
  }
  if (a6 == 1)
  {
    a6 = 6;
LABEL_7:
    int64x2_t v22 = *(int64x2_t *)&a4->dataSourceIdentifier;
    int64x2_t v23 = *(int64x2_t *)&a4->item;
    id v17 = objc_alloc_init((Class)off_1E5DA7430);
    int64x2_t v19 = v22;
    int64x2_t v18 = v23;
    id v16 = v17;
    uint64_t v20 = *(void *)off_1E5DAAED8;
    do
    {
      int64x2_t v25 = v19;
      int64x2_t v26 = v18;
      -[PXCuratedLibraryViewProvider selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:](self, "selectableIndexPathClosestToIndexPath:fromDataSource:inDirection:", &v25, v13, a6, v22.i64[0]);
      int64x2_t v22 = v27;
      int64x2_t v24 = v28;
      [v16 addIndexPath:&v27];
      int64x2_t v19 = v22;
      int64x2_t v18 = v24;
    }
    while ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v22, *(int64x2_t *)&a5->dataSourceIdentifier), (int32x4_t)vceqq_s64(v24, *(int64x2_t *)&a5->item))), 0xFuLL))) & 1) == 0&& v22.i64[0] != v20);
    goto LABEL_10;
  }
  if (a6) {
    goto LABEL_7;
  }
  int64x2_t v14 = *(int64x2_t *)&a4->item;
  int64x2_t v27 = *(int64x2_t *)&a4->dataSourceIdentifier;
  int64x2_t v28 = v14;
  int64x2_t v15 = *(int64x2_t *)&a5->item;
  int64x2_t v25 = *(int64x2_t *)&a5->dataSourceIdentifier;
  int64x2_t v26 = v15;
  id v16 = [(PXCuratedLibraryViewProvider *)self indexPathsFromIndexPath:&v27 toIndexPath:&v25 inDataSource:v13];
LABEL_10:

  return v16;
}

- (int64_t)selectionBasisForSelectionManager:(id)a3
{
  id v5 = a3;
  double v6 = [(PXCuratedLibraryViewProvider *)self viewModel];
  unint64_t v7 = [v6 zoomLevel];

  if (v7 >= 5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryViewProvider.m" lineNumber:769 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t v8 = qword_1AB35A7C0[v7];

  return v8;
}

- (id)zoomablePhotosInteraction:(id)a3 assetReferenceAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = [(PXCuratedLibraryViewProvider *)self gridView];
  unint64_t v7 = objc_msgSend(v6, "firstCuratedLibraryHitTestResultsAtPoint:withControl:", 1, x, y);
  int64_t v8 = [v7 assetReference];

  return v8;
}

- (void)zoomablePhotosInteractionWillBegin:(id)a3
{
  double v4 = [(PXCuratedLibraryViewProvider *)self assetsDataSourceManager];
  [v4 forceAllPhotosAccurateIfNeeded];

  id v5 = [(PXCuratedLibraryViewProvider *)self layout];
  [v5 clearLastVisibleAreaAnchoringInformation];
}

- (BOOL)zoomablePhotosInteractionShouldBegin:(id)a3
{
  uint64_t v3 = [(PXCuratedLibraryViewProvider *)self viewModel];
  double v4 = [v3 allowedActions];
  char v5 = [v4 containsObject:@"PXCuratedLibraryActionAllPhotosInteractiveZoom"];

  return v5;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(PXCuratedLibraryViewProvider *)self axNextResponder];
  LOBYTE(a4) = [v10 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return a4;
}

- (void)_handleChangeToModifySelectionWithUserInfo:(id)a3
{
  id v4 = a3;
  id v32 = 0;
  id v33 = 0;
  PXGAXGetFocusFromAndToInfosForUserInfo(v4, &v33, &v32);
  id v5 = v33;
  id v6 = v32;
  uint64_t v7 = [v6 axContentKind];
  long long v30 = 0u;
  long long v31 = 0u;
  PXGAXGetToSimpleIndexPathForUserInfo(v4, (uint64_t)&v30);
  id v8 = [(PXCuratedLibraryViewProvider *)self viewModel];
  id v9 = v8;
  if (v7 != 6 && [v8 zoomLevel] == 3)
  {
    uint64_t v10 = PXGAXGetItemGeometryForUserInfo(v4);
    uint64_t v11 = v10;
    if (v10) {
      uint64_t v10 = (void *)[v10 itemClosestToItem:0x7FFFFFFFFFFFFFFFLL inDirection:5];
    }
    *(void *)&long long v31 = v10;
  }
  v12 = [v9 selectionSnapshot];
  int64_t v13 = [v12 dataSource];
  uint64_t v14 = [v13 identifier];

  uint64_t v15 = v30;
  uint64_t v16 = *(void *)off_1E5DAAED8;
  if ((void)v30 != *(void *)off_1E5DAAED8 && v14 != (void)v30)
  {
    int64x2_t v18 = [v9 assetsDataSourceManager];
    int64x2_t v19 = [v18 changeHistory];
    uint64_t v20 = [v19 changeDetailsFromDataSourceIdentifier:v15 toDataSourceIdentifier:v14];

    long long v28 = v30;
    long long v29 = v31;
    [off_1E5DA8488 indexPathAfterApplyingChanges:v20 toIndexPath:&v28 hasIncrementalChanges:0 objectChanged:0];

    uint64_t v15 = v30;
  }
  if (v15 != v16)
  {
    v21 = [v9 selectionSnapshot];
    int64x2_t v22 = [v21 selectedIndexPaths];
    long long v28 = v30;
    long long v29 = v31;
    char v23 = [v22 containsIndexPath:&v28];

    if ((v23 & 1) == 0)
    {
      int64x2_t v24 = [v9 selectionManager];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __75__PXCuratedLibraryViewProvider__handleChangeToModifySelectionWithUserInfo___block_invoke;
      v25[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
      long long v26 = v30;
      long long v27 = v31;
      [v24 performChanges:v25];
    }
  }
}

uint64_t __75__PXCuratedLibraryViewProvider__handleChangeToModifySelectionWithUserInfo___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v10 = v9;
  if ((a4 & 2) != 0)
  {
    uint64_t v13 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v13);
    if (v13) {
      [(PXCuratedLibraryViewProvider *)self _handleChangeToModifySelectionWithUserInfo:v10];
    }
  }
  if ((a4 & 4) != 0)
  {
    uint64_t v12 = 0;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v12);
    if (v12) {
      [(PXCuratedLibraryViewProvider *)self _handleChangeToModifySelectionWithUserInfo:v10];
    }
  }
  uint64_t v11 = [(PXCuratedLibraryViewProvider *)self axNextResponder];
  [v11 axGroup:v8 didChange:a4 userInfo:v10];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  uint64_t v3 = [(PXCuratedLibraryViewProvider *)self gridView];
  id v4 = [v3 scrollViewController];
  id v5 = [v4 scrollView];

  return v5;
}

- (CGPoint)pointForPointReference:(id)a3 inCoordinateSpace:(id)a4
{
  id v5 = a3;
  id v6 = [(PXCuratedLibraryViewProvider *)self gridView];
  [v6 rootLayout];
  [(id)objc_claimAutoreleasedReturnValue() pointForPointReference:v5];

  [v6 scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)pointReferenceAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  id v5 = a4;
  [(PXCuratedLibraryViewProvider *)self gridView];
  objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)indexPathsForItemsInRect:(CGRect)a3 coordinateSpace:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(PXCuratedLibraryViewProvider *)self gridView];
  objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)indexPathsFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5
{
  id v9 = a5;
  uint64_t v10 = [(PXCuratedLibraryViewProvider *)self _itemsGeometryForDataSource:v9];
  if (v10)
  {
    uint64_t v11 = [v9 identifier];
    if (a3->dataSourceIdentifier != v11)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2, self, @"PXCuratedLibraryViewProvider.m", 552, @"Invalid parameter not satisfying: %@", @"originalFromIndexPath.dataSourceIdentifier == dataSourceIdentifier" object file lineNumber description];
    }
    if (a3->section)
    {
      uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:a2, self, @"PXCuratedLibraryViewProvider.m", 553, @"Invalid parameter not satisfying: %@", @"originalFromIndexPath.section == section" object file lineNumber description];
    }
    if (a4->dataSourceIdentifier != v11)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2, self, @"PXCuratedLibraryViewProvider.m", 554, @"Invalid parameter not satisfying: %@", @"originalToIndexPath.dataSourceIdentifier == dataSourceIdentifier" object file lineNumber description];
    }
    if (a4->section)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2, self, @"PXCuratedLibraryViewProvider.m", 555, @"Invalid parameter not satisfying: %@", @"originalToIndexPath.section == section" object file lineNumber description];
    }
    uint64_t v12 = [v10 itemsBetweenItem:a3->item andItem:a4->item];
    uint64_t v13 = [off_1E5DA6F50 indexPathSetWithItemIndexes:v12 dataSourceIdentifier:v11 section:0];
  }
  else
  {
    SEL v51 = a2;
    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
    int64_t section = a3->section;
    int64_t item = a3->item;
    subint64_t item = a3->subitem;
    uint64_t v47 = a4;
    v48 = a3;
    int64_t v18 = a4->dataSourceIdentifier;
    int64_t v19 = a4->section;
    v56 = self;
    int64_t v21 = a4->item;
    int64_t v20 = a4->subitem;
    int64_t v68 = dataSourceIdentifier;
    int64_t v69 = section;
    int64_t v70 = item;
    int64_t v71 = subitem;
    uint64_t v22 = [v9 objectReferenceAtIndexPath:&v68];
    int64_t v54 = v21;
    int64_t v55 = v18;
    int64_t v68 = v18;
    int64_t v69 = v19;
    v57 = v9;
    int64_t v58 = v19;
    int64_t v70 = v21;
    int64_t v71 = v20;
    int64_t v53 = v20;
    uint64_t v23 = [v9 objectReferenceAtIndexPath:&v68];
    int64x2_t v24 = [(PXCuratedLibraryViewProvider *)v56 gridView];
    v49 = (void *)v23;
    uint64_t v50 = (void *)v22;
    LOBYTE(v19) = [v24 isObjectReference:v22 visuallyBeforeObjectReference:v23];

    if ((v19 & 1) == 0)
    {
      int64_t dataSourceIdentifier = v47->dataSourceIdentifier;
      int64_t section = v47->section;
      int64_t item = v47->item;
      subint64_t item = v47->subitem;
      int64_t v58 = v48->section;
      int64_t v54 = v48->item;
      int64_t v55 = v48->dataSourceIdentifier;
      int64_t v53 = v48->subitem;
    }
    uint64_t v13 = [off_1E5DA7430 indexPathSet];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PXCuratedLibraryViewProvider_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke;
    aBlock[3] = &unk_1E5DCB950;
    aBlock[4] = v56;
    aBlock[5] = v51;
    long long v25 = *(_OWORD *)&v48->item;
    long long v64 = *(_OWORD *)&v48->dataSourceIdentifier;
    long long v65 = v25;
    long long v26 = *(_OWORD *)&v47->item;
    long long v66 = *(_OWORD *)&v47->dataSourceIdentifier;
    long long v67 = v26;
    v52 = (void (**)(void))_Block_copy(aBlock);
    while (1)
    {
      int64_t v27 = subitem;
      int64_t v28 = item;
      int64_t v29 = dataSourceIdentifier;
      int64_t v68 = dataSourceIdentifier;
      int64_t v69 = section;
      int64_t v70 = item;
      int64_t v71 = subitem;
      [v13 addIndexPath:&v68];
      BOOL v30 = dataSourceIdentifier == v55 && section == v58;
      BOOL v31 = v30 && item == v54;
      int64_t v59 = dataSourceIdentifier;
      int64_t v60 = section;
      BOOL v32 = v31 && subitem == v53;
      char v33 = v32;
      int64_t v61 = item;
      uint64_t v62 = subitem;
      [(PXCuratedLibraryViewProvider *)v56 selectableIndexPathClosestToIndexPath:&v59 fromDataSource:v57 inDirection:5];
      int64_t dataSourceIdentifier = v68;
      int64_t v34 = v69;
      int64_t item = v70;
      subint64_t item = v71;
      if ([v13 containsIndexPath:&v68]) {
        break;
      }
      if (v34 == section) {
        char v35 = v33;
      }
      else {
        char v35 = 1;
      }
      if (v35)
      {
        if (v33) {
          goto LABEL_32;
        }
        goto LABEL_37;
      }
    }
    v52[2]();
    if (v33) {
      goto LABEL_32;
    }
LABEL_37:
    if (v34 < v58)
    {
      int64_t v34 = v58 - 1;
      int64_t item = [v57 numberOfItemsInSection:v58 - 1] - 1;
      int64_t dataSourceIdentifier = [v57 identifier];
      int64_t v68 = v29;
      int64_t v69 = section;
      int64_t v70 = v28;
      int64_t v71 = v27;
      int64_t v59 = dataSourceIdentifier;
      int64_t v60 = v58 - 1;
      subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v61 = item;
      uint64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
      v37 = [v57 indexPathSetFromIndexPath:&v68 toIndexPath:&v59];
      [v13 unionIndexPathSet:v37];
    }
    char v38 = 0;
    uint64_t v39 = *(void *)off_1E5DAAED8;
    while ((v38 & 1) == 0 && dataSourceIdentifier != v39)
    {
      int64_t v68 = dataSourceIdentifier;
      int64_t v69 = v34;
      int64_t v70 = item;
      int64_t v71 = subitem;
      [v13 addIndexPath:&v68];
      BOOL v41 = dataSourceIdentifier == v55 && v34 == v58 && item == v54;
      int64_t v59 = dataSourceIdentifier;
      int64_t v60 = v34;
      char v38 = v41 && subitem == v53;
      int64_t v61 = item;
      uint64_t v62 = subitem;
      [(PXCuratedLibraryViewProvider *)v56 selectableIndexPathClosestToIndexPath:&v59 fromDataSource:v57 inDirection:5];
      int64_t dataSourceIdentifier = v68;
      int64_t v34 = v69;
      int64_t item = v70;
      subint64_t item = v71;
      if ([v13 containsIndexPath:&v68])
      {
        v52[2]();
        int64_t v68 = v55;
        int64_t v69 = v58;
        int64_t v70 = v54;
        int64_t v71 = v53;
        [v13 addIndexPath:&v68];
        break;
      }
    }
LABEL_32:

    id v9 = v57;
    uint64_t v10 = 0;
  }

  return v13;
}

void __81__PXCuratedLibraryViewProvider_indexPathsFromIndexPath_toIndexPath_inDataSource___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXAssertGetLog();
}

- (PXSimpleIndexPath)selectableIndexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
{
  id v10 = a5;
  long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->int64_t item = v11;
  uint64_t v12 = *(void *)off_1E5DAAED8;
  do
  {
    long long v13 = *(_OWORD *)&a4->item;
    v18[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v18[1] = v13;
    [(PXCuratedLibraryViewProvider *)self _indexPathClosestToIndexPath:v18 fromDataSource:v10 inDirection:a6];
    long long v14 = v20;
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v19;
    *(_OWORD *)&retstr->int64_t item = v14;
    long long v15 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&a4->int64_t dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&a4->int64_t item = v15;
    if (retstr->dataSourceIdentifier == v12) {
      break;
    }
    long long v16 = *(_OWORD *)&retstr->item;
    long long v19 = *(_OWORD *)&retstr->dataSourceIdentifier;
    long long v20 = v16;
  }
  while (![(PXCuratedLibraryViewProvider *)self canSelectObjectAtIndexPath:&v19 inDataSource:v10]);

  return result;
}

- (void)extendSelectionInDirection:(unint64_t)a3
{
  id v5 = [(PXCuratedLibraryViewProvider *)self viewModel];
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 selectionManager];
  uint64_t v7 = v6;
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
    [(PXCuratedLibraryViewProvider *)self moveSelectionInDirection:a3];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [v5 selectionManager];
    id v10 = v9;
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
      long long v11 = [v5 currentDataSource];
      long long v13 = v15;
      long long v14 = v16;
      uint64_t v12 = [v11 objectReferenceAtIndexPath:&v13];

      if (v12)
      {
        [(PXCuratedLibraryViewProvider *)self anchorPaddingForCurrentZoomLevel];
        -[PXCuratedLibraryViewProvider scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:](self, "scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:", v12, 0, 0);
      }
    }
  }
}

- (void)moveSelectionInDirection:(unint64_t)a3
{
  id v5 = [(PXCuratedLibraryViewProvider *)self viewModel];
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v5 selectionManager];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 moveSelectionInDirection:a3 withDelegate:self];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }

  if ((void)v19 != *(void *)off_1E5DAAED8)
  {
    [(PXCuratedLibraryViewProvider *)self anchorPaddingForCurrentZoomLevel];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    long long v16 = [v5 currentDataSource];
    v18[0] = v19;
    v18[1] = v20;
    long long v17 = [v16 objectReferenceAtIndexPath:v18];

    if (v17) {
      -[PXCuratedLibraryViewProvider scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:](self, "scrollLibraryViewToObjectReference:scrollPosition:padding:completionHandler:", v17, 0, 0, v9, v11, v13, v15);
    }
  }
}

- (BOOL)canSelectObjectAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_2;
  }
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v8) = a3->subitem == 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    LOBYTE(v8) = 0;
  }
  else
  {
    long long v9 = *(_OWORD *)&a3->item;
    v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v13[1] = v9;
    double v10 = [v6 assetCollectionAtSectionIndexPath:v13];
    double v11 = [(PXCuratedLibraryViewProvider *)self viewModel];
    BOOL v8 = !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v10, [v11 zoomLevel]);
  }
LABEL_7:

  return v8;
}

- (PXSimpleIndexPath)_indexPathClosestToIndexPath:(SEL)a3 fromDataSource:(PXSimpleIndexPath *)a4 inDirection:(id)a5
{
  id v10 = a5;
  uint64_t v40 = 0;
  BOOL v41 = &v40;
  uint64_t v42 = 0x4010000000;
  v43 = &unk_1AB5D584F;
  long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v44 = *(_OWORD *)off_1E5DAB028;
  long long v45 = v11;
  double v12 = [(PXCuratedLibraryViewProvider *)self _itemsGeometryForDataSource:v10];
  double v13 = v12;
  if (!v12)
  {
    if (!a6) {
      goto LABEL_13;
    }
    long long v17 = [(PXCuratedLibraryViewProvider *)self hitTestResultControlsForCurrentZoomLevel];
    if (a4->dataSourceIdentifier != *(void *)off_1E5DAAED8)
    {
      if (a4->item == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v18 = *(_OWORD *)&a4->item;
          long long v38 = *(_OWORD *)&a4->dataSourceIdentifier;
          long long v39 = v18;
          long long v19 = [v10 assetCollectionReferenceAtSectionIndexPath:&v38];
          long long v20 = [(PXCuratedLibraryViewProvider *)self layout];
          int64_t v21 = [v20 spriteReferenceForObjectReference:v19];

          uint64_t v22 = [(PXCuratedLibraryViewProvider *)self gridView];
          uint64_t v23 = v32;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2;
          v32[3] = &unk_1E5DB1B08;
          v32[4] = v17;
          id v24 = v10;
          long long v25 = *(_OWORD *)&a4->item;
          long long v33 = *(_OWORD *)&a4->dataSourceIdentifier;
          long long v34 = v25;
          v32[5] = v24;
          v32[6] = &v40;
          [v22 enumerateCuratedLibraryHitTestResultsInDirection:a6 fromSpriteReference:v21 usingBlock:v32];
LABEL_11:
        }
      }
      else if (a4->subitem == 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v26 = *(_OWORD *)&a4->item;
        long long v38 = *(_OWORD *)&a4->dataSourceIdentifier;
        long long v39 = v26;
        long long v19 = [v10 assetReferenceAtItemIndexPath:&v38];
        int64_t v27 = [(PXCuratedLibraryViewProvider *)self layout];
        int64_t v21 = [v27 spriteReferenceForObjectReference:v19];

        uint64_t v22 = [(PXCuratedLibraryViewProvider *)self gridView];
        uint64_t v23 = v35;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke;
        v35[3] = &unk_1E5DB1B08;
        v35[4] = v17;
        id v28 = v10;
        long long v29 = *(_OWORD *)&a4->item;
        long long v36 = *(_OWORD *)&a4->dataSourceIdentifier;
        long long v37 = v29;
        v35[5] = v28;
        v35[6] = &v40;
        [v22 enumerateCuratedLibraryHitTestResultsInDirection:a6 fromSpriteReference:v21 usingBlock:v35];
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  uint64_t v14 = [v12 itemClosestToItem:a4->item inDirection:a6];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v15 = v41;
    long long v16 = *(_OWORD *)&a4->item;
    *((_OWORD *)v41 + 2) = *(_OWORD *)&a4->dataSourceIdentifier;
    *((_OWORD *)v15 + 3) = v16;
    v15[6] = v14;
  }
LABEL_13:
  long long v30 = *((_OWORD *)v41 + 3);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *((_OWORD *)v41 + 2);
  *(_OWORD *)&retstr->int64_t item = v30;

  _Block_object_dispose(&v40, 8);
  return result;
}

void __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 assetReference];
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v5, "control")))
  {
    int64x2_t v7 = 0uLL;
    BOOL v8 = *(void **)(a1 + 40);
    if (v8)
    {
      [v8 indexPathForAssetReference:v6];
      int64x2_t v7 = 0u;
      int64x2_t v9 = 0u;
    }
    else
    {
      int64x2_t v9 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), v7), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 72), v9))), 0xFuLL))) & 1) == 0)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      *(_OWORD *)(v10 + 32) = 0u;
      *(_OWORD *)(v10 + 48) = 0u;
      *a3 = 1;
    }
  }
}

void __88__PXCuratedLibraryViewProvider__indexPathClosestToIndexPath_fromDataSource_inDirection___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 assetCollectionReference];
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v5, "control")))
  {
    int64x2_t v7 = 0uLL;
    BOOL v8 = *(void **)(a1 + 40);
    if (v8)
    {
      [v8 indexPathForAssetCollectionReference:v6];
      int64x2_t v7 = 0u;
      int64x2_t v9 = 0u;
    }
    else
    {
      int64x2_t v9 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), v7), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 72), v9))), 0xFuLL))) & 1) == 0)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      *(_OWORD *)(v10 + 32) = 0u;
      *(_OWORD *)(v10 + 48) = 0u;
      *a3 = 1;
    }
  }
}

- (id)_itemsGeometryForDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryViewProvider *)self layout];
  id v6 = [v5 presentedItemsGeometryForDataSource:v4];

  return v6;
}

- (id)hitTestResultControlsForCurrentZoomLevel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v4 = [(PXCuratedLibraryViewProvider *)self viewModel];
  uint64_t v5 = [v4 zoomLevel];

  switch(v5)
  {
    case 0:
      goto LABEL_5;
    case 1:
      uint64_t v5 = 2;
      goto LABEL_5;
    case 2:
      [v3 addIndex:3];
      uint64_t v5 = 4;
      goto LABEL_5;
    case 3:
    case 4:
      uint64_t v5 = 1;
LABEL_5:
      [v3 addIndex:v5];
      break;
    default:
      break;
  }
  return v3;
}

- (void)scrollLibraryViewToObjectReference:(id)a3 scrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 completionHandler:(id)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  id v14 = a6;
  double v15 = (void (**)(void, void, void))v14;
  if (v13)
  {
    long long v16 = [(PXCuratedLibraryViewProvider *)self layout];
    long long v17 = [(PXCuratedLibraryViewProvider *)self gridView];
    long long v18 = [(PXCuratedLibraryViewProvider *)self viewModel];
    long long v19 = [v18 assetsDataSourceManager];
    long long v20 = [v19 dataSource];
    int64_t v21 = [v20 objectReferenceNearestToObjectReference:v13];
    if (v20)
    {
      [v20 indexPathForObjectReference:v21];
      uint64_t v22 = *((void *)&v32 + 1);
      if (*((void *)&v32 + 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_9:
        uint64_t v23 = [v17 scrollViewController];
        [v23 stopScrollingAndZoomingAnimations];

        if (a4 != 2)
        {
          [v16 estimatedHeaderHeight];
          if (top < v24) {
            double top = v24;
          }
        }
        long long v25 = objc_msgSend(v16, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v21, a4, top, left, bottom, right);
        id v26 = (id)[v25 autoInvalidate];

        if ([v18 zoomLevel] == 4)
        {
          int64_t v27 = [v16 allPhotosLayout];
          [v27 invalidateItemsLayout];
        }
        if (v15)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke_2;
          v28[3] = &unk_1E5DD3280;
          long long v30 = v15;
          id v29 = v21;
          [v17 installLayoutCompletionHandler:v28];
        }
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v22 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke;
    v31[3] = &__block_descriptor_40_e58_v16__0___PXCuratedLibraryMutableAssetsDataSourceManager__8l;
    v31[4] = v22;
    [v19 performChanges:v31];
    goto LABEL_9;
  }
  if (v14)
  {
    long long v16 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"can't scroll library view to objectReference %@", 0);
    ((void (**)(void, void, void *))v15)[2](v15, 0, v16);
LABEL_17:
  }
}

uint64_t __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 forceAccurateSection:*(void *)(a1 + 32) andSectionsBeforeAndAfter:0];
}

uint64_t __108__PXCuratedLibraryViewProvider_scrollLibraryViewToObjectReference_scrollPosition_padding_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) != 0, 0);
}

- (void)scrollLibraryViewToAssetReference:(id)a3 scrollPosition:(unint64_t)a4 completionHandler:(id)a5
{
}

- (id)selectionContainerWithUndoManager:(id)a3
{
  id v5 = a3;
  id v6 = [(PXCuratedLibraryViewProvider *)self viewModel];
  int64x2_t v7 = [v6 selectionSnapshot];
  switch([v6 zoomLevel])
  {
    case 0:
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryViewProvider.m" lineNumber:350 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      uint64_t v8 = 9;
      break;
    case 2:
      uint64_t v8 = 8;
      break;
    case 3:
      goto LABEL_6;
    case 4:
      int64x2_t v9 = [v6 zoomablePhotosViewModel];
      char v10 = [v9 isDisplayingIndividualItems];

      if (v10)
      {
LABEL_6:
        uint64_t v8 = 7;
      }
      else
      {
        id v11 = objc_alloc((Class)off_1E5DA84E8);
        double v12 = [v6 currentDataSource];
        id v13 = [off_1E5DA6F50 indexPathSet];
        long long v14 = *((_OWORD *)off_1E5DAB028 + 1);
        v25[0] = *(_OWORD *)off_1E5DAB028;
        v25[1] = v14;
        uint64_t v15 = [v11 initWithDataSource:v12 selectedIndexPaths:v13 cursorIndexPath:v25];

        uint64_t v8 = 7;
        int64x2_t v7 = (void *)v15;
      }
      break;
    default:
      uint64_t v8 = 0;
      break;
  }
  long long v16 = [PXSelectionContainer alloc];
  long long v17 = [(PXCuratedLibraryViewProvider *)self photoLibrary];
  long long v18 = objc_msgSend(v17, "px_virtualCollections");
  long long v19 = [v18 photosCollection];
  long long v20 = [v6 assetsDataSourceManager];
  int64_t v21 = [v20 changeHistory];
  uint64_t v22 = [(PXSelectionContainer *)v16 initWithSelectionSnapshot:v7 collection:v19 undoManager:v5 context:v8 privacyController:0 changeHistory:v21];

  return v22;
}

- (id)discoverabilityTitleForActionType:(id)a3
{
  return [(PXCuratedLibraryViewProvider *)self titleForActionType:a3 useCase:1];
}

- (id)titleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6 = a3;
  int64x2_t v7 = [(PXCuratedLibraryViewProvider *)self viewModel];
  uint64_t v8 = [v7 actionManager];

  int64x2_t v9 = [v8 actionPerformerForActionType:v6];
  char v10 = v9;
  if (v9) {
    [v9 localizedTitleForUseCase:a4];
  }
  else {
  id v11 = [v8 localizedTitleForActionType:v6 useCase:a4];
  }

  return v11;
}

- (void)performActionWithType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryViewProvider *)self viewModel];
  id v6 = [v5 actionManager];
  id v7 = [v6 actionPerformerForActionType:v4];

  [v7 performActionWithCompletionHandler:0];
}

- (BOOL)ensureSelectMode
{
  [(PXCuratedLibraryViewProvider *)self attemptSetInSelectMode:1];
  id v3 = [(PXCuratedLibraryViewProvider *)self viewModel];
  char v4 = [v3 isSelecting];

  return v4;
}

- (void)toggleSelectMode
{
  id v3 = [(PXCuratedLibraryViewProvider *)self viewModel];
  -[PXCuratedLibraryViewProvider attemptSetInSelectMode:](self, "attemptSetInSelectMode:", [v3 isSelecting] ^ 1);
}

- (BOOL)attemptSetInSelectMode:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(PXCuratedLibraryViewProvider *)self viewModel];
  id v5 = [v4 allowedActions];
  id v6 = v5;
  if (!v3)
  {
    int v9 = [v5 containsObject:@"PXCuratedLibraryActionCancelSelectMode"];

    if (v9)
    {
      uint64_t v8 = &__block_literal_global_216_26997;
      goto LABEL_6;
    }
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  char v7 = [v5 containsObject:@"PXCuratedLibraryActionEnterSelectMode"];

  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v8 = &__block_literal_global_26996;
LABEL_6:
  [v4 performChanges:v8];
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

uint64_t __55__PXCuratedLibraryViewProvider_attemptSetInSelectMode___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:0];
}

uint64_t __55__PXCuratedLibraryViewProvider_attemptSetInSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:1];
}

- (void)zoomOutAllPhotos
{
  BOOL v3 = [(PXCuratedLibraryViewProvider *)self viewModel];
  char v4 = [v3 assetsDataSourceManager];
  [v4 forceAllPhotosAccurateIfNeeded];

  id v5 = [v3 zoomablePhotosViewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PXCuratedLibraryViewProvider_zoomOutAllPhotos__block_invoke;
  v6[3] = &unk_1E5DBDFA0;
  v6[4] = self;
  [v5 performChanges:v6];
}

void __48__PXCuratedLibraryViewProvider_zoomOutAllPhotos__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (v3)
  {
    [v3 zoomState];
    uint64_t v5 = *((void *)&v9 + 1) + 1;
  }
  else
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = 1;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  id v6 = objc_msgSend(*(id *)(a1 + 32), "preferredAnchorAssetReference", v7, v8, v9, v10, v11, v12, v13);
  [v4 zoomToColumnIndex:v5 withAnchorAssetReference:v6 animated:1];
}

- (void)zoomInAllPhotos
{
  id v3 = [(PXCuratedLibraryViewProvider *)self viewModel];
  char v4 = [v3 zoomablePhotosViewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PXCuratedLibraryViewProvider_zoomInAllPhotos__block_invoke;
  v5[3] = &unk_1E5DBDFA0;
  v5[4] = self;
  [v4 performChanges:v5];
}

void __47__PXCuratedLibraryViewProvider_zoomInAllPhotos__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (v3)
  {
    [v3 zoomState];
    uint64_t v5 = *((void *)&v9 + 1) - 1;
  }
  else
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = -1;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  id v6 = objc_msgSend(*(id *)(a1 + 32), "preferredAnchorAssetReference", v7, v8, v9, v10, v11, v12, v13);
  [v4 zoomToColumnIndex:v5 withAnchorAssetReference:v6 animated:1];
}

- (void)prepareForNavigationToObjectReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXCuratedLibraryViewProvider *)self viewModel];
  if ([v5 zoomLevel] == 4)
  {
    id v6 = [v5 zoomablePhotosViewModel];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __70__PXCuratedLibraryViewProvider_prepareForNavigationToObjectReference___block_invoke;
    v7[3] = &unk_1E5DBDFA0;
    id v8 = v4;
    [v6 performChanges:v7];
  }
}

void __70__PXCuratedLibraryViewProvider_prepareForNavigationToObjectReference___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 zoomInToIndividualItemsWithAnchorAssetReference:v3 animated:0];
}

- (PXSectionedObjectReference)preferredObjectReferenceToScrollToWhenRestoringState
{
  long long v2 = [(PXCuratedLibraryViewProvider *)self gridView];
  uint64_t v3 = [v2 scrollViewController];
  char v4 = [v3 isScrolledAtEdge:3 tolerance:100.0];

  if ((v4 & 1) == 0)
  {
    [v2 bounds];
    PXRectGetCenter();
  }

  return (PXSectionedObjectReference *)0;
}

- (PXAssetReference)preferredAnchorAssetReference
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__27004;
  uint64_t v15 = __Block_byref_object_dispose__27005;
  id v16 = 0;
  uint64_t v3 = [(PXCuratedLibraryViewProvider *)self viewModel];
  char v4 = [v3 selectionSnapshot];

  if ([v4 isAnyItemSelected])
  {
    [v4 dataSource];
    objc_claimAutoreleasedReturnValue();
    long long v9 = 0u;
    long long v10 = 0u;
    if (v4) {
      [v4 cursorIndexPath];
    }
    [(PXCuratedLibraryViewProvider *)self layout];
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = 0x7FEFFFFFFFFFFFFFLL;
    [(id)objc_claimAutoreleasedReturnValue() visibleRect];
    PXRectGetCenter();
  }
  uint64_t v5 = (void *)v12[5];
  if (!v5)
  {
    [(PXCuratedLibraryViewProvider *)self gridView];
    [(id)objc_claimAutoreleasedReturnValue() bounds];
    PXRectGetCenter();
  }
  id v6 = v5;

  _Block_object_dispose(&v11, 8);
  return (PXAssetReference *)v6;
}

void __61__PXCuratedLibraryViewProvider_preferredAnchorAssetReference__block_invoke(int64x2_t *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  int64x2_t v10 = 0u;
  int64x2_t v11 = 0u;
  long long v7 = (void *)a1[2].i64[0];
  if (v7) {
    [v7 indexPathForObjectReference:v6];
  }
  id v8 = (void *)a1[2].i64[1];
  v9[0] = v10;
  v9[1] = v11;
  if ([v8 isIndexPathSelected:v9])
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v10, a1[4]), (int32x4_t)vceqq_s64(v11, a1[5]))), 0xFuLL))) & 1) == 0)PXRectShortestDistanceToPoint(); {
    objc_storeStrong((id *)(*(void *)(a1[3].i64[0] + 8) + 40), a2);
    }
    *a3 = 1;
  }
}

- (PXCuratedLibraryViewProvider)initWithPhotoLibrary:(id)a3 extendedTraitCollection:(id)a4 initialZoomLevel:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  int64x2_t v10 = [[PXCuratedLibraryViewConfiguration alloc] initWithPhotoLibrary:v9];

  [(PXCuratedLibraryViewConfiguration *)v10 setInitialZoomLevel:a5];
  int64x2_t v11 = [(PXCuratedLibraryViewProvider *)self initWithConfiguration:v10 extendedTraitCollection:v8];

  return v11;
}

- (PXCuratedLibraryViewProvider)initWithPhotoLibrary:(id)a3 extendedTraitCollection:(id)a4
{
  return [(PXCuratedLibraryViewProvider *)self initWithPhotoLibrary:a3 extendedTraitCollection:a4 initialZoomLevel:0];
}

- (PXCuratedLibraryViewProvider)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryViewProvider.m", 73, @"%s is not available as initializer", "-[PXCuratedLibraryViewProvider init]");

  abort();
}

@end