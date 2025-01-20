@interface PXAssetsSectionGridConfigurator
- (BOOL)_layoutHasIndividualItems:(id)a3 forSpec:(id)a4;
- (BOOL)_layoutIsAspectFit:(id)a3 forSpec:(id)a4;
- (BOOL)aspectFitContent;
- (BOOL)supportsAspectRatioToggle;
- (CGSize)_interItemSpacingForLayout:(id)a3 forSpec:(id)a4;
- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6;
- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4;
- (int64_t)numberOfZoomStepsWithDataSource:(id)a3;
- (int64_t)zoomStep;
- (void)_configureGridLayout:(id)a3 inSectionLayout:(id)a4;
- (void)configureAssetSectionLayout:(id)a3;
- (void)setAspectFitContent:(BOOL)a3;
- (void)setZoomStep:(int64_t)a3;
@end

@implementation PXAssetsSectionGridConfigurator

- (void)setAspectFitContent:(BOOL)a3
{
  self->_aspectFitContent = a3;
}

- (BOOL)aspectFitContent
{
  return self->_aspectFitContent;
}

- (void)setZoomStep:(int64_t)a3
{
  self->_zoomStep = a3;
}

- (int64_t)zoomStep
{
  return self->_zoomStep;
}

- (BOOL)supportsAspectRatioToggle
{
  return 1;
}

- (int64_t)numberOfZoomStepsWithDataSource:(id)a3
{
  v3 = [(PXAssetsSectionConfigurator *)self assetsSectionLayoutSpec];
  v4 = [v3 zoomableSpec];
  v5 = [v4 legacyMacSupportedColumns];
  int64_t v6 = [v5 count];

  return v6;
}

- (void)_configureGridLayout:(id)a3 inSectionLayout:(id)a4
{
  id v67 = a3;
  id v6 = a4;
  v7 = [(PXAssetsSectionConfigurator *)self assetsSectionLayoutSpec];
  v8 = [v7 zoomableSpec];

  BOOL v9 = [(PXAssetsSectionGridConfigurator *)self _layoutHasIndividualItems:v67 forSpec:v8];
  uint64_t v66 = [v8 userInterfaceIdiom];
  uint64_t v10 = [v8 userInterfaceIdiom];
  v11 = [v6 assetCollection];
  uint64_t v12 = objc_msgSend(v11, "px_isPanoramasSmartAlbum");

  uint64_t v13 = [v67 numberOfColumns];
  int v14 = [v6 isFaceModeEnabled];
  BOOL v65 = [(PXAssetsSectionGridConfigurator *)self _layoutIsAspectFit:v67 forSpec:v8];
  if (!v65 || (v12 & 1) != 0)
  {
    BOOL v15 = ((v14 & 1) != 0 || [v8 useSaliency])
       && v13 <= [v8 maxColumnsForSaliency];
    char v27 = v66 != 4 || v9;
    if (v27)
    {
      [v6 safeAreaInsets];
      PXEdgeInsetsForEdges();
    }
    uint64_t v26 = 0;
    double v17 = *(double *)off_1E5DAAF10;
    double v19 = *((double *)off_1E5DAAF10 + 1);
    double v21 = *((double *)off_1E5DAAF10 + 2);
    double v23 = *((double *)off_1E5DAAF10 + 3);
    double v25 = 0.0;
  }
  else
  {
    if (v14) {
      BOOL v15 = v13 <= [v8 maxColumnsForSaliency];
    }
    else {
      BOOL v15 = 0;
    }
    [v8 aspectFitEdgeMargins];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    if ([v6 itemCaptionsVisible])
    {
      [v8 captionSpacing];
      double v25 = v24;
    }
    else
    {
      double v25 = 0.0;
    }
    uint64_t v26 = 1;
  }
  if ([v6 numberOfAssets])
  {
    if (v12) {
      goto LABEL_22;
    }
LABEL_25:
    if (v66 == 4)
    {
      uint64_t v64 = v10;
      uint64_t v31 = (uint64_t)(double)[(PXAssetsSectionGridConfigurator *)self zoomStep];
      v32 = [v8 legacyMacSupportedColumns];
      v33 = [v32 objectAtIndexedSubscript:v31];
      v34 = self;
      uint64_t v35 = v26;
      BOOL v36 = v15;
      uint64_t v37 = [v33 integerValue];

      uint64_t v10 = v64;
      v30 = v67;
      uint64_t v29 = v37;
      BOOL v15 = v36;
      uint64_t v26 = v35;
      self = v34;
    }
    else
    {
      uint64_t v29 = [v8 staticNumberOfColumns];
      v30 = v67;
    }
    [v30 setNumberOfColumns:v29];
    goto LABEL_29;
  }
  double v17 = *(double *)off_1E5DAAF10;
  double v19 = *((double *)off_1E5DAAF10 + 1);
  double v21 = *((double *)off_1E5DAAF10 + 2);
  double v23 = *((double *)off_1E5DAAF10 + 3);
  if (!v12) {
    goto LABEL_25;
  }
LABEL_22:
  [v67 setNumberOfColumns:1];
  double v25 = 0.0;
  if ([v6 itemCaptionsVisible])
  {
    [v8 captionSpacing];
    double v25 = v28;
  }
LABEL_29:
  if (v9)
  {
    [v6 burstStackEffect];
    v39 = uint64_t v38 = v10;
    [v39 setNumberOfItemsStackedBehind:2];

    uint64_t v10 = v38;
  }
  [v67 setContentMode:v26];
  [v67 setHideIncompleteLastRowOrColumn:v9 ^ 1];
  [v67 setEnableEffects:v9];
  [v67 setEnableBestCropRect:v15];
  if (v12)
  {
    [v8 panoramaInteritemSpacing];
    double v41 = v40;
    [v8 panoramaInteritemSpacing];
    double v43 = v42;
  }
  else
  {
    [(PXAssetsSectionGridConfigurator *)self _interItemSpacingForLayout:v67 forSpec:v8];
    double v41 = v44;
  }
  objc_msgSend(v67, "setInterItemSpacing:", v41, v43);
  [v67 setItemCaptionSpacing:v25];
  [v8 itemCornerRadius];
  *(float *)&double v45 = v45;
  LODWORD(v46) = LODWORD(v45);
  LODWORD(v47) = LODWORD(v45);
  LODWORD(v48) = LODWORD(v45);
  objc_msgSend(v67, "setItemCornerRadius:", v45, v46, v47, v48);
  objc_msgSend(v67, "setPadding:", v17, v19, v21, v23);
  [v67 setFillSafeAreaTopInset:0];
  if (v9) {
    uint64_t v49 = 2;
  }
  else {
    uint64_t v49 = 0;
  }
  [v67 setStyle:v49];
  [v67 setItemZPosition:0.0];
  double v50 = 1.0;
  if (v12) {
    objc_msgSend(v8, "panoramaItemAspectRatio", 1.0);
  }
  [v67 setItemAspectRatio:v50];
  if (v66 == 4) {
    uint64_t v51 = 2;
  }
  else {
    uint64_t v51 = 1;
  }
  [v67 setDropTargetStyle:v51];
  [v67 setSupportsAutomaticContentRotation:v12];
  [v6 preferredCornerRadius];
  objc_msgSend(v67, "setEdgeCornerRadius:");
  if (v10 == 3)
  {
    v52 = +[PXFocusSettings sharedInstance];
    uint64_t v53 = [v52 focusAnimationStyle];
    [v52 focusAnimationPadding];
    uint64_t v55 = v54;
    uint64_t v56 = [v52 pressedAnimationStyle];
    [v52 pressedAnimationPadding];
    objc_msgSend(v67, "setAnimationParameters:forStylableType:", v56, v57, 2);
  }
  else
  {
    v58 = +[PXKeyboardSettings sharedInstance];
    v52 = v58;
    if (v65)
    {
      uint64_t v53 = [v58 allPhotosAspectFitFocusAnimationStyle];
      [v52 allPhotosAspectFitFocusPadding];
    }
    else
    {
      uint64_t v53 = [v58 allPhotosAspectFillFocusAnimationStyle];
      [v52 allPhotosAspectFillFocusPadding];
    }
    uint64_t v55 = v59;
  }

  objc_msgSend(v67, "setAnimationParameters:forStylableType:", v53, v55, 1);
  v60 = [v67 axGroup];
  v61 = v60;
  if (v66 == 4) {
    uint64_t v62 = 9;
  }
  else {
    uint64_t v62 = 0;
  }
  objc_msgSend(v60, "setLeafFeatures:", objc_msgSend(v60, "leafFeatures") | v62);

  v63 = [v6 addContentActionHandler];
  [v67 setNumberOfAccessoryItems:v63 != 0];
}

- (CGSize)_interItemSpacingForLayout:(id)a3 forSpec:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PXAssetsSectionGridConfigurator *)self _layoutIsAspectFit:v7 forSpec:v6];
  BOOL v9 = [(PXAssetsSectionGridConfigurator *)self _layoutHasIndividualItems:v7 forSpec:v6];

  double v10 = 0.0;
  if (v8)
  {
    if (v9)
    {
      [v6 aspectFitInteritemSpacing];
LABEL_6:
      double v10 = v11;
    }
  }
  else if (v9)
  {
    [v6 interitemSpacing];
    goto LABEL_6;
  }

  double v12 = v10;
  double v13 = v10;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)_layoutIsAspectFit:(id)a3 forSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXAssetsSectionGridConfigurator *)self aspectFitContent]) {
    BOOL v8 = [(PXAssetsSectionGridConfigurator *)self _layoutHasIndividualItems:v6 forSpec:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_layoutHasIndividualItems:(id)a3 forSpec:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 numberOfColumns];
  uint64_t v7 = [v5 maxColumnsForIndividualItems];

  return v6 <= v7;
}

- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6
{
  double width = a6.width;
  double v7 = a6.width;
  if (a5)
  {
    BOOL v9 = [(PXAssetsSectionConfigurator *)self assetsSectionLayoutSpec];
    double v10 = [v9 zoomableSpec];

    unint64_t v11 = [v10 staticNumberOfColumns];
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    int64_t v13 = a5 / v12;
    if ((unint64_t)(a5 / v12) <= 1) {
      int64_t v13 = 1;
    }
    double v7 = width / (double)v12 * (double)v13;
  }
  double v14 = width;
  double v15 = v7;
  result.height = v15;
  result.double width = v14;
  return result;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v9 = a3;
  v4 = [v9 bodyContentLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v9 bodyContentLayout];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(PXGGridLayout);
    [(PXGGridLayout *)v6 setMediaKind:2];
    [(PXGGridLayout *)v6 setPresentationType:0];
    [(PXGLayout *)v6 setContentSource:v9];
    [(PXGItemsLayout *)v6 setLazy:1];
    [(PXGItemsLayout *)v6 setDelegate:v9];
    -[PXGItemsLayout setNumberOfItems:](v6, "setNumberOfItems:", [v9 numberOfAssets]);
    if ([v9 preferredInitialContentLayoutAxis]) {
      -[PXGGridLayout setAxis:](v6, "setAxis:", [v9 preferredInitialContentLayoutAxis]);
    }
    double v7 = [v9 preferredInitialContentLayoutNumberOfRows];

    if (v7)
    {
      BOOL v8 = [v9 preferredInitialContentLayoutNumberOfRows];
      -[PXGGridLayout setNumberOfRows:](v6, "setNumberOfRows:", [v8 integerValue]);
    }
    [(PXGGridLayout *)v6 setAccessoryMediaKind:10];
    [(PXGGridLayout *)v6 setAccessoryPresentationType:1];
    [(PXGItemsLayout *)v6 setAccessoryItemContentSource:v9];
  }
  [(PXAssetsSectionGridConfigurator *)self _configureGridLayout:v6 inSectionLayout:v9];
  [v9 setBodyContentLayout:v6 wantsDecoration:1];
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  return 0;
}

@end