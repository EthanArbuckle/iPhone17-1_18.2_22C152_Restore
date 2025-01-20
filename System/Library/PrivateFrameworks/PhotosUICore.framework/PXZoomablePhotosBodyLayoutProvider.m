@interface PXZoomablePhotosBodyLayoutProvider
- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4;
- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate;
- (PXPhotosViewModel)viewModel;
- (PXZoomablePhotosBodyLayoutProvider)init;
- (PXZoomablePhotosBodyLayoutProvider)initWithViewModel:(id)a3;
- (PXZoomablePhotosViewModel)zoomablePhotosViewModel;
- (id)createInteraction;
- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7;
- (void)_configureZoomableLayoutDecorations:(id)a3 fromAssetSectionLayout:(id)a4;
- (void)_updatePhotosViewModelWithChanges:(unint64_t)a3;
- (void)_updateZoomableViewModelWithChanges:(unint64_t)a3;
- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setInvalidationDelegate:(id)a3;
@end

@implementation PXZoomablePhotosBodyLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomablePhotosViewModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
  objc_storeStrong((id *)&self->_zoomablePhotosLayout, 0);
}

- (PXZoomablePhotosViewModel)zoomablePhotosViewModel
{
  return self->_zoomablePhotosViewModel;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->invalidationDelegate);
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ViewModelObservationContext_259244 == a5)
  {
    [(PXZoomablePhotosBodyLayoutProvider *)self _updateZoomableViewModelWithChanges:a4];
  }
  else
  {
    if ((void *)operator|| != a5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosBodyLayoutProvider.m" lineNumber:201 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    [(PXZoomablePhotosBodyLayoutProvider *)self _updatePhotosViewModelWithChanges:a4];
  }
}

- (void)_updatePhotosViewModelWithChanges:(unint64_t)a3
{
  v5 = [(PXZoomablePhotosBodyLayoutProvider *)self viewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PXZoomablePhotosBodyLayoutProvider__updatePhotosViewModelWithChanges___block_invoke;
  v6[3] = &unk_1E5DCD388;
  v6[4] = self;
  v6[5] = a3;
  [v5 performChanges:v6];
}

void __72__PXZoomablePhotosBodyLayoutProvider__updatePhotosViewModelWithChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) zoomablePhotosViewModel];
  v5 = [v4 allowedColumns];
  objc_msgSend(v3, "setNumberOfZoomSteps:", objc_msgSend(v5, "count"));

  uint64_t v6 = [v4 denseColumnsIndexRange];
  objc_msgSend(v3, "setYearsMonthsZoomStepRange:", v6, v7);
  objc_msgSend(v3, "setDefaultZoomStep:", objc_msgSend(v4, "defaultColumnIndex"));
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    if (v4) {
      objc_msgSend(v4, "zoomState", (unsigned __int128)0, (unsigned __int128)0);
    }
    uint64_t v9 = objc_msgSend(v4, "isDisplayingIndividualItems", v11, v12);
    [v3 setEnterSelectModeAllowed:v9 forReason:@"DisplayingIndividualItems"];
    [v3 setOneUpPresentationAllowed:v9 forReason:@"DisplayingIndividualItems"];
    [v3 setFloatingTitleOpacity:0.0];
    [v3 setAspectRatioToggleAllowed:v9 != 0 forReason:@"DisplayingIndividualItems"];
    if (([v4 isInteractiveZooming] & 1) == 0)
    {
      id v10 = [v4 anchorAssetReference];
      [v3 setZoomStep:0 isInteractive:0 shouldAnimate:v10 anchorAssetReference:(double)0];
    }
    uint64_t v8 = *(void *)(a1 + 40);
  }
  if ((v8 & 0x4000) != 0) {
    objc_msgSend(v3, "setHideSurroundingContent:forReason:", objc_msgSend(v4, "shouldHideSurroundingContent"), @"ZoomableAnimation");
  }
}

- (void)_updateZoomableViewModelWithChanges:(unint64_t)a3
{
  v5 = [(PXZoomablePhotosBodyLayoutProvider *)self zoomablePhotosViewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PXZoomablePhotosBodyLayoutProvider__updateZoomableViewModelWithChanges___block_invoke;
  v6[3] = &unk_1E5DCD360;
  v6[4] = self;
  v6[5] = a3;
  [v5 performChanges:v6];
}

void __74__PXZoomablePhotosBodyLayoutProvider__updateZoomableViewModelWithChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) viewModel];
  objc_msgSend(v3, "setLowMemoryMode:", objc_msgSend(v4, "lowMemoryMode"));
  objc_msgSend(v3, "setIsInSelectMode:", objc_msgSend(v4, "isInSelectMode"));
  objc_msgSend(v3, "setViewBasedDecorationsEnabled:", objc_msgSend(v4, "viewBasedDecorationsEnabled"));
  v5 = [v4 draggedAssetReferences];
  [v3 setDraggedAssetReferences:v5];

  uint64_t v6 = [v4 dropTargetAssetReference];
  [v3 setDropTargetAssetReference:v6];

  objc_msgSend(v3, "setAspectFit:", objc_msgSend(v4, "aspectFitContent"));
  objc_msgSend(v3, "setCaptionsVisible:", objc_msgSend(v4, "captionsVisible"));
  objc_msgSend(v3, "setAllowsCaptionsInSquare:", objc_msgSend(v4, "allowsCaptionsInSquareBehavior"));
  objc_msgSend(v3, "setWantsDimmedSelectionStyle:", objc_msgSend(v4, "wantsDimmedSelectionStyle"));
  objc_msgSend(v3, "setWantsNumberedSelectionStyle:", objc_msgSend(v4, "wantsNumberedSelectionStyle"));
  objc_msgSend(v3, "setWantsFileSizeBadge:", objc_msgSend(v4, "wantsFileSizeBadge"));
  objc_msgSend(v3, "setWantsAssetIndexBadge:", objc_msgSend(v4, "wantsAssetIndexBadge"));
  uint64_t v7 = [v4 effectProvider];
  [v3 setEffectProvider:v7];

  objc_msgSend(v3, "setAlwaysShowTopBadges:", objc_msgSend(v4, "wantsTopBadgesWithViewBasedDecorations"));
  objc_msgSend(v3, "setFaceModeEnabled:", objc_msgSend(v4, "isFaceModeEnabled"));
  [v4 additionalAspectFitEdgeMargins];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v3 specManager];
  objc_msgSend(v16, "setAdditionalAspectFitEdgeMargins:", v9, v11, v13, v15);

  objc_msgSend(v3, "setUseLowMemoryDecode:", objc_msgSend(v4, "useLowMemoryDecode"));
  objc_msgSend(v3, "setContentShiftStrategy:", objc_msgSend(v4, "contentShiftStrategy"));
  [v4 zoomStep];
  double v18 = v17;
  objc_msgSend(v3, "setIsInteractiveZooming:", objc_msgSend(v4, "isInteractiveZooming"));
  if ([v3 isInteractiveZooming])
  {
    [v4 zoomStep];
    double v20 = v19;
    v21 = [v4 zoomAnchorAssetReference];
    [v3 setInteractiveZoomColumnIndex:v21 withAnchorAssetReference:v20];
  }
  else
  {
    unint64_t v22 = llround(v18);
    if (v3)
    {
      [v3 zoomState];
      uint64_t v23 = v25;
    }
    else
    {
      uint64_t v23 = 0;
    }
    if (v23 != v22)
    {
      v24 = [v4 zoomAnchorAssetReference];
      objc_msgSend(v3, "zoomToColumnIndex:withAnchorAssetReference:animated:", v22, v24, objc_msgSend(v4, "shouldAnimateZooming"));
    }
  }
  if ((*(unsigned char *)(a1 + 47) & 4) != 0) {
    [v3 resetToInitialState];
  }
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 1;
}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  [(PXZoomablePhotosBodyLayoutProvider *)self _configureZoomableLayoutDecorations:v11 fromAssetSectionLayout:v9];
  double v12 = [v9 addContentActionHandler];

  if (v12)
  {
    objc_initWeak(&location, v9);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __105__PXZoomablePhotosBodyLayoutProvider_configureSectionBodyLayout_inAssetSectionLayout_forSectionedLayout___block_invoke;
    v13[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v14, &location);
    [v11 setAddContentHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [v11 setAddContentHandler:0];
  }
}

void __105__PXZoomablePhotosBodyLayoutProvider_configureSectionBodyLayout_inAssetSectionLayout_forSectionedLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained addContentActionHandler];

  if (v1)
  {
    v2 = [WeakRetained addContentActionHandler];
    ((void (**)(void, id))v2)[2](v2, WeakRetained);
  }
}

- (void)_configureZoomableLayoutDecorations:(id)a3 fromAssetSectionLayout:(id)a4
{
  id v5 = a4;
  id v8 = [a3 assetDecorationSource];
  uint64_t v6 = [v5 assetDecorationSource];
  uint64_t v7 = [v5 loadingStatusManager];

  [v8 setLoadingStatusManager:v7];
  objc_msgSend(v8, "setHidesInteractiveFavoriteBadges:", objc_msgSend(v6, "hidesInteractiveFavoriteBadges"));
  objc_msgSend(v8, "setDecorationViewClass:", objc_msgSend(v6, "decorationViewClass"));
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  zoomablePhotosLayout = self->_zoomablePhotosLayout;
  if (zoomablePhotosLayout)
  {
    [(PXGLayout *)zoomablePhotosLayout removeFromSuperlayout];
  }
  else
  {
    id v10 = [PXZoomablePhotosLayout alloc];
    id v11 = [(PXZoomablePhotosBodyLayoutProvider *)self zoomablePhotosViewModel];
    double v12 = [(PXZoomablePhotosLayout *)v10 initWithViewModel:v11];
    double v13 = self->_zoomablePhotosLayout;
    self->_zoomablePhotosLayout = v12;

    [(PXZoomablePhotosLayout *)self->_zoomablePhotosLayout setPreventFillingTopAreaInsets:1];
  }
  id result = self->_zoomablePhotosLayout;
  *a7 = 0;
  return result;
}

- (id)createInteraction
{
  id v3 = [PXZoomablePhotosInteraction alloc];
  v4 = [(PXZoomablePhotosBodyLayoutProvider *)self zoomablePhotosViewModel];
  id v5 = [(PXZoomablePhotosInteraction *)v3 initWithZoomablePhotosViewModel:v4];

  return v5;
}

- (PXZoomablePhotosBodyLayoutProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXZoomablePhotosBodyLayoutProvider.m", 62, @"%s is not available as initializer", "-[PXZoomablePhotosBodyLayoutProvider init]");

  abort();
}

- (PXZoomablePhotosBodyLayoutProvider)initWithViewModel:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PXZoomablePhotosBodyLayoutProvider;
  uint64_t v6 = [(PXZoomablePhotosBodyLayoutProvider *)&v36 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v35 = v7;
    [v5 registerChangeObserver:v7 context:ViewModelObservationContext_259244];
    id v8 = [PXZoomablePhotosLayoutSpecManager alloc];
    id v9 = [v5 specManager];
    id v10 = [v9 extendedTraitCollection];
    id v11 = [(PXFeatureSpecManager *)v8 initWithExtendedTraitCollection:v10];

    if ([v5 allowsUserDefaults])
    {
      double v12 = [v5 customUserDefaults];
      if (v12)
      {
        [(PXZoomablePhotosLayoutSpecManager *)v11 setUserDefaults:v12];
      }
      else
      {
        double v13 = +[PXUserDefaults standardUserDefaults];
        id v14 = [v13 photosGridsUserDefaults];
        [(PXZoomablePhotosLayoutSpecManager *)v11 setUserDefaults:v14];
      }
    }
    else
    {
      [(PXZoomablePhotosLayoutSpecManager *)v11 setUserDefaults:0];
    }
    double v15 = [v5 specManager];
    v16 = [v15 availableThumbnailSizes];
    [(PXZoomablePhotosLayoutSpecManager *)v11 setAvailableThumbnailSizes:v16];

    -[PXZoomablePhotosLayoutSpecManager setGridStyle:](v11, "setGridStyle:", [v5 gridStyle]);
    -[PXZoomablePhotosLayoutSpecManager setPreferredUserInterfaceStyle:](v11, "setPreferredUserInterfaceStyle:", [v5 preferredUserInterfaceStyle]);
    [v5 itemAspectRatio];
    -[PXZoomablePhotosLayoutSpecManager setItemAspectRatio:](v11, "setItemAspectRatio:");
    double v17 = [v5 preferredAssetCropDelegate];
    [(PXZoomablePhotosLayoutSpecManager *)v11 setForceSaliency:v17 != 0];

    -[PXZoomablePhotosLayoutSpecManager setOverrideDefaultNumberOfColumns:](v11, "setOverrideDefaultNumberOfColumns:", [v5 overrideDefaultNumberOfColumns]);
    double v18 = [v5 specManager];
    double v19 = [v18 spec];
    -[PXZoomablePhotosLayoutSpecManager setPreferredUserInterfaceStyle:](v11, "setPreferredUserInterfaceStyle:", [v19 preferredUserInterfaceStyle]);

    v33 = [PXZoomablePhotosViewModel alloc];
    double v20 = [v5 dataSourceManager];
    v21 = [v5 selectionManager];
    [v5 mediaProvider];
    unint64_t v22 = v34 = v11;
    uint64_t v23 = [v5 loadingStatusManager];
    v24 = [v5 badgesModifier];
    uint64_t v25 = [v5 preferredAssetCropDelegate];
    v26 = [v5 preferredColumnCountsDelegate];
    v27 = [v5 inlinePlaybackController];
    v28 = v11;
    v29 = (void *)v23;
    uint64_t v30 = [(PXZoomablePhotosViewModel *)v33 initWithDataSourceManager:v20 selectionManager:v21 mediaProvider:v22 specManager:v28 loadingStatusManager:v23 badgesModifier:v24 preferredAssetCropDelegate:v25 preferredColumnCountsDelegate:v26 inlinePlaybackController:v27];
    uint64_t v7 = v35;
    zoomablePhotosViewModel = v35->_zoomablePhotosViewModel;
    v35->_zoomablePhotosViewModel = (PXZoomablePhotosViewModel *)v30;

    [(PXZoomablePhotosViewModel *)v7->_zoomablePhotosViewModel registerChangeObserver:v7 context:operator||];
    [(PXZoomablePhotosBodyLayoutProvider *)v35 _updateZoomableViewModelWithChanges:-1];
    [(PXZoomablePhotosBodyLayoutProvider *)v35 _updatePhotosViewModelWithChanges:-1];
  }
  return v7;
}

@end