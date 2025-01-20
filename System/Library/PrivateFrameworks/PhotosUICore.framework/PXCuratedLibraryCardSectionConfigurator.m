@interface PXCuratedLibraryCardSectionConfigurator
- (PXCuratedLibraryCardSectionBodyLayoutSpec)cardSpec;
- (PXCuratedLibraryCardSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4;
- (UIEdgeInsets)containerInsets;
- (id)createCardSpecWithExtendedTraitCollection:(id)a3;
- (void)configureAssetSectionLayout:(id)a3;
@end

@implementation PXCuratedLibraryCardSectionConfigurator

- (void).cxx_destruct
{
}

- (PXCuratedLibraryCardSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryCardSectionConfigurator;
  v7 = [(PXAssetsSectionConfigurator *)&v12 initWithExtendedTraitCollection:v6 assetsSectionLayoutSpec:a4];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(PXCuratedLibraryCardSectionConfigurator *)v7 createCardSpecWithExtendedTraitCollection:v6];
    cardSpec = v8->_cardSpec;
    v8->_cardSpec = (PXCuratedLibraryCardSectionBodyLayoutSpec *)v9;
  }
  return v8;
}

- (PXCuratedLibraryCardSectionBodyLayoutSpec)cardSpec
{
  return self->_cardSpec;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v4 = a3;
  v5 = +[PXCuratedLibrarySettings sharedInstance];
  id v6 = [v4 headerLayout];
  v7 = [(PXAssetsSectionConfigurator *)self updatedHeaderLayout:v6 withHeaderStyle:2 forAssetSectionLayout:v4];

  v8 = [v4 bodyContentLayout];
  objc_opt_class();
  uint64_t v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = objc_alloc_init(PXCuratedLibraryCardSectionBodyLayout);

    [(PXGLayout *)v9 setContentSource:v9];
  }
  uint64_t v31 = [v4 section];
  v10 = [v4 selectionSnapshot];
  v11 = [v10 selectedIndexPaths];
  objc_super v12 = [v10 dataSource];
  v36[0] = [v12 identifier];
  v36[1] = [v4 section];
  int64x2_t v37 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  -[PXCuratedLibraryCardSectionBodyLayout setIsSelected:](v9, "setIsSelected:", [v11 containsIndexPath:v36]);

  v13 = [(PXCuratedLibraryCardSectionConfigurator *)self cardSpec];
  [(PXCuratedLibraryCardSectionBodyLayout *)v9 setSpec:v13];

  -[PXCuratedLibraryCardSectionBodyLayout setIsSkimming:](v9, "setIsSkimming:", [v4 isSkimming]);
  v14 = [v4 skimmingIndexPaths];
  [(PXCuratedLibraryCardSectionBodyLayout *)v9 setSkimmingIndexPaths:v14];

  -[PXCuratedLibraryCardSectionBodyLayout setMaxSkimmingIndex:](v9, "setMaxSkimmingIndex:", [v4 maxSkimmingIndex]);
  -[PXCuratedLibraryCardSectionBodyLayout setCurrentSkimmingIndex:](v9, "setCurrentSkimmingIndex:", [v4 currentSkimmingIndex]);
  if ([v4 showsSkimmingInteraction])
  {
    [(PXCuratedLibraryCardSectionBodyLayout *)v9 assetFrame];
    double v16 = v15;
    double v18 = v17;
    [v5 skimmingScale];
    double v20 = (1.0 - v19) * 0.5;
    double v21 = v16 * v20;
    double v22 = v18 * v20;
  }
  else
  {
    double v22 = *(double *)off_1E5DAAF10;
    double v21 = *((double *)off_1E5DAAF10 + 1);
  }
  objc_msgSend(v4, "setPadding:", v22, v21);
  if ([v4 showsSkimmingSlideshow]
    && ([v4 showsSkimmingInteraction] & 1) == 0)
  {
    v30 = [(PXCuratedLibraryCardSectionBodyLayout *)v9 dataSource];
    v34[0] = [v30 identifier];
    v34[1] = [(PXCuratedLibraryCardSectionBodyLayout *)v9 section];
    int64x2_t v35 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v23 = [v4 dataSource];
    v32[0] = [v23 identifier];
    v32[1] = [v4 section];
    int64x2_t v33 = v35;
    id v24 = (id)[v4 createCuratedLibraryLayoutSkimmingSlideshowAnimationFromSectionIndexPath:v34 toSectionIndexPath:v32];
  }
  v25 = [v4 dataSource];
  [(PXCuratedLibraryCardSectionBodyLayout *)v9 setDataSource:v25 section:v31];

  -[PXCuratedLibraryCardSectionBodyLayout setZoomLevel:](v9, "setZoomLevel:", [v4 zoomLevel]);
  v26 = [v4 inlinePlaybackController];
  [(PXCuratedLibraryCardSectionBodyLayout *)v9 setInlinePlaybackController:v26];

  v27 = v9;
  [v4 setMode:4];
  [v4 setWantsShadow:1];
  [v4 setShowAllActionPerformer:0];
  v28 = [(PXCuratedLibraryCardSectionBodyLayout *)v27 assetLayoutGuide];
  [v4 setHeaderLayoutGuide:v28];

  v29 = [(PXAssetsSectionConfigurator *)self assetsSectionLayoutSpec];
  [v4 setSpec:v29];

  [v4 setHeaderLayout:v7];
  [v4 setBodyContentLayout:v27 wantsDecoration:1];
}

- (UIEdgeInsets)containerInsets
{
  v2 = [(PXCuratedLibraryCardSectionConfigurator *)self cardSpec];
  [v2 padding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)createCardSpecWithExtendedTraitCollection:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryCardSectionConfigurator.m", 32, @"Method %s is a responsibility of subclass %@", "-[PXCuratedLibraryCardSectionConfigurator createCardSpecWithExtendedTraitCollection:]", v8 object file lineNumber description];

  abort();
}

@end