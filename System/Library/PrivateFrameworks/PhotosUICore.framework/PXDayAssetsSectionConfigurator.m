@interface PXDayAssetsSectionConfigurator
- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6;
- (PXDayAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4;
- (id)_bodySpecForBodyStyle:(int64_t)a3 zoomLevel:(int64_t)a4;
- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4;
- (void)_configureSelectAllButtonOfSectionLayout:(id)a3;
- (void)_getHeaderAndBodyStylesForAssetCollection:(id)a3 isCurated:(BOOL)a4 zoomLevel:(int64_t)a5 headerStyle:(int64_t *)a6 bodyStyle:(int64_t *)a7;
- (void)configureAssetSectionLayout:(id)a3;
@end

@implementation PXDayAssetsSectionConfigurator

- (PXDayAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXDayAssetsSectionConfigurator;
  v8 = [(PXAssetsSectionConfigurator *)&v16 initWithExtendedTraitCollection:v6 assetsSectionLayoutSpec:v7];
  if (v8)
  {
    v9 = -[PXDayAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:]([PXDayAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:variant:", v6, 0, [v7 variant]);
    floatingHeaderSpec = v8->_floatingHeaderSpec;
    v8->_floatingHeaderSpec = v9;

    v11 = [(PXFeatureSpec *)[PXAssetsSectionBodyAllPhotosGridLayoutSpec alloc] initWithExtendedTraitCollection:v6];
    allPhotosGridBodySpec = v8->_allPhotosGridBodySpec;
    v8->_allPhotosGridBodySpec = v11;

    v13 = [(PXFeatureSpec *)[PXDayAssetsSectionBodyLayoutSpec alloc] initWithExtendedTraitCollection:v6];
    daysBodySpec = v8->_daysBodySpec;
    v8->_daysBodySpec = v13;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysBodySpec, 0);
  objc_storeStrong((id *)&self->_allPhotosGridBodySpec, 0);
  objc_storeStrong((id *)&self->_floatingHeaderSpec, 0);
}

- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [(PXDayAssetsSectionConfigurator *)self _getHeaderAndBodyStylesForAssetCollection:a3 isCurated:a4 zoomLevel:3 headerStyle:&v17 bodyStyle:&v16];
  if (v16)
  {
    v10 = [(PXDayAssetsSectionConfigurator *)self _bodySpecForBodyStyle:v16 zoomLevel:3];
    +[PXDayAssetsSectionBodyLayout estimatedSizeWithReferenceSize:spec:style:numberOfAssets:](PXDayAssetsSectionBodyLayout, "estimatedSizeWithReferenceSize:spec:style:numberOfAssets:", v10, v16, a5, width, height);
    double width = v11;
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }
  double v14 = width;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)_configureSelectAllButtonOfSectionLayout:(id)a3
{
  id v3 = a3;
  v4 = [v3 assetCollectionReference];
  if (v4 && [v3 isSelecting])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [v3 dataSource];
    id v6 = v5;
    if (v5)
    {
      [v5 indexPathForAssetCollectionReference:v4];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }

    v8 = [v3 dataSource];
    v14[0] = v15;
    v14[1] = v16;
    v9 = [v8 indexPathSetForItemsInIndexPath:v14];

    v10 = [v3 selectionSnapshot];
    double v11 = [v10 selectedIndexPaths];
    int v12 = [v9 isSubsetOfSet:v11];

    if (v12) {
      double v13 = @"PXCuratedLibraryDeselectAllButtonTitle";
    }
    else {
      double v13 = @"PXCuratedLibrarySelectAllButtonTitle";
    }
    PXLocalizedStringFromTable(v13, @"PhotosUICore");
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = &stru_1F00B0030;
  }
  [v3 setSelectAllButtonTitle:v7];
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v4 = a3;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v5 = [v4 isCurated];
  uint64_t v6 = [v4 zoomLevel];
  id v7 = [v4 assetCollection];
  [(PXDayAssetsSectionConfigurator *)self _getHeaderAndBodyStylesForAssetCollection:v7 isCurated:v5 zoomLevel:v6 headerStyle:&v48 bodyStyle:&v47];

  uint64_t v8 = v48;
  v9 = PXLocalizedStringFromTable(@"PXCuratedLibraryDaysZoomLevelButtonTitle", @"PhotosUICore");
  [v4 setAxLocalizedBaseLabel:v9];

  v10 = [v4 bodyContentLayout];
  if (v47)
  {
    double v11 = v10;
    objc_opt_class();
    int v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v12 = objc_alloc_init(PXDayAssetsSectionBodyLayout);

      [(PXGItemsLayout *)v12 setDelegate:v4];
      [(PXGGeneratedLayout *)v12 setMediaKind:2];
      [(PXGLayout *)v12 setContentSource:v4];
    }
    [(PXDayAssetsSectionBodyLayout *)v12 setStyle:v47];
    uint64_t v13 = [(PXGItemsLayout *)v12 numberOfItems];
    if (v13 != [v4 numberOfAssets]) {
      -[PXGItemsLayout setNumberOfItems:](v12, "setNumberOfItems:", [v4 numberOfAssets]);
    }
    double v14 = [(PXDayAssetsSectionConfigurator *)self _bodySpecForBodyStyle:v47 zoomLevel:v6];
    [(PXDayAssetsSectionBodyLayout *)v12 setSpec:v14];

    -[PXDayAssetsSectionBodyLayout setNumberOfPrecedingAssets:](v12, "setNumberOfPrecedingAssets:", [v4 numberOfPrecedingAssets]);
    if (v48) {
      uint64_t v15 = [v4 keyItemIndex];
    }
    else {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(PXGGeneratedLayout *)v12 setKeyItemIndex:v15];
    if (v4) {
      [v4 sectionIndexPath];
    }
    PXGSectionedSpriteTagMake();
  }

  objc_msgSend(v4, "setPadding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  if (v6 == 3)
  {
    long long v16 = +[PXCuratedLibrarySettings sharedInstance];
    [v16 interitemSpacingForDays];
  }
  else
  {
    long long v16 = +[PXZoomablePhotosSettings sharedInstance];
    [v16 interitemSpacing];
  }
  double v18 = v17;

  v19 = [v4 headerLayout];
  v20 = [(PXAssetsSectionConfigurator *)self updatedHeaderLayout:v19 withHeaderStyle:v48 forAssetSectionLayout:v4];

  id v21 = v20;
  v22 = [v4 actionManager];
  v23 = [v4 assetCollectionReference];
  v24 = [v22 ellipsisButtonActionPerformerWithAssetCollectionReference:v23];
  [v21 setEllipsisButtonActionPerformer:v24];

  if (v21)
  {
    v46 = self;
    unint64_t v25 = 0x1E4F1C000uLL;
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    v27 = &off_1E5DA5000;
    if ([v22 canPerformActionType:@"PXCuratedLibraryActionEnterSelectMode"])
    {
      PXLocalizedStringFromTable(@"PXCuratedLibrarySelectButtonTitle", @"PhotosUICore");
      v29 = uint64_t v28 = v8;
      v30 = [v21 spec];
      v31 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v29 spec:v30];
      [v26 addObject:v31];

      v27 = &off_1E5DA5000;
      uint64_t v8 = v28;
      unint64_t v25 = 0x1E4F1C000;
    }
    if ([v22 canPerformActionType:@"PXCuratedLibraryActionCancelSelectMode"])
    {
      v32 = v27[477];
      PXLocalizedStringFromTable(@"PXCuratedLibraryCancelSelectionButtonTitle", @"PhotosUICore");
      v34 = uint64_t v33 = v8;
      v35 = [v21 spec];
      v36 = [v32 configurationWithTitle:v34 spec:v35];
      [v26 addObject:v36];

      uint64_t v8 = v33;
      unint64_t v25 = 0x1E4F1C000uLL;
    }
    [v21 setExternalLeadingButtonConfigurations:v26];
    v37 = (void *)[objc_alloc(*(Class *)(v25 + 2632)) initWithCapacity:1];
    if ([v22 canPerformActionType:@"PXCuratedLibraryActionShowSidebar"])
    {
      [v21 spec];
      v39 = uint64_t v38 = v8;
      v40 = [v21 configurationForButton:9 spec:v39];

      uint64_t v8 = v38;
      [v37 addObject:v40];
    }
    [v21 setExternalTopButtonConfigurations:v37];

    self = v46;
  }
  uint64_t v41 = 3;
  if (v8 != 1) {
    uint64_t v41 = 4;
  }
  if (v8) {
    uint64_t v42 = v41;
  }
  else {
    uint64_t v42 = 0;
  }
  [v4 setMode:v42];
  [v4 setWantsShadow:0];
  [v4 setHeaderLayout:v21];
  [v4 setBodyContentLayout:0 wantsDecoration:1];
  [v4 setInterlayoutSpacing:v18];
  [v4 setShowAllAffordanceStyle:1];
  v43 = [v22 showAllActionPerformerWithAssetCollectionReference:v23];
  [v4 setShowAllActionPerformer:v43];

  v44 = [v22 actionPerformerForActionType:@"PXCuratedLibraryActionSelectAllToggle" withAssetCollectionReference:v23];
  [v4 setSelectAllActionPerformer:v44];

  [(PXDayAssetsSectionConfigurator *)self _configureSelectAllButtonOfSectionLayout:v4];
  v45 = [0 headerLayoutGuide];
  [v4 setHeaderLayoutGuide:v45];
}

- (void)_getHeaderAndBodyStylesForAssetCollection:(id)a3 isCurated:(BOOL)a4 zoomLevel:(int64_t)a5 headerStyle:(int64_t *)a6 bodyStyle:(int64_t *)a7
{
  id v21 = a3;
  v10 = +[PXCuratedLibrarySettings sharedInstance];
  double v11 = 0.0;
  if (([v10 showAllHighlights] & 1) == 0)
  {
    [v10 nonInterestingPromotionScore];
    double v11 = v12;
  }
  [v21 promotionScore];
  if (a5 == 4)
  {
    BOOL v14 = 0;
    BOOL v15 = 1;
    int64_t v16 = 2;
  }
  else
  {
    double v17 = v13;
    char v18 = [v21 isRecent];
    uint64_t v19 = 3;
    if (v17 < v11) {
      uint64_t v19 = 0;
    }
    BOOL v15 = (v18 & 1) != 0 || v17 >= v11;
    if (v18) {
      int64_t v16 = 4;
    }
    else {
      int64_t v16 = v19;
    }
    BOOL v14 = (v18 & 1) != 0 || v17 >= v11;
  }
  int64_t v20 = (v15 & [v10 forceFloatingHeaderVisible]) != 0 || v14;
  *a6 = v20;
  *a7 = v16;
}

- (id)_bodySpecForBodyStyle:(int64_t)a3 zoomLevel:(int64_t)a4
{
  uint64_t v5 = &OBJC_IVAR___PXDayAssetsSectionConfigurator__daysBodySpec;
  if ((unint64_t)(a3 - 3) < 6)
  {
LABEL_5:
    id v6 = *(id *)((char *)&self->super.super.isa + *v5);
    return v6;
  }
  if ((unint64_t)(a3 - 1) <= 1)
  {
    if (a4 == 4) {
      uint64_t v5 = &OBJC_IVAR___PXDayAssetsSectionConfigurator__allPhotosGridBodySpec;
    }
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  if ((unint64_t)(a3 - 1) > 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = self->_floatingHeaderSpec;
  }
  return v5;
}

@end