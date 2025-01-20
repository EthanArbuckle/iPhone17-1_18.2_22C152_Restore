@interface PXAssetsSectionConfigurator
- (BOOL)supportsAspectRatioToggle;
- (CGRect)containerFrameForAssetSectionLayout:(id)a3;
- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6;
- (PXAssetsSectionConfigurator)init;
- (PXAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4;
- (PXAssetsSectionLayoutSpec)assetsSectionLayoutSpec;
- (UIEdgeInsets)containerInsets;
- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4;
- (id)updatedHeaderLayout:(id)a3 withHeaderStyle:(int64_t)a4 forAssetSectionLayout:(id)a5;
- (int64_t)initialZoomStep;
- (int64_t)numberOfZoomStepsWithDataSource:(id)a3;
- (int64_t)variant;
- (void)configureAssetSectionLayout:(id)a3;
@end

@implementation PXAssetsSectionConfigurator

- (void).cxx_destruct
{
}

- (PXAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v5 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PXAssetsSectionConfigurator;
  v6 = [(PXAssetsSectionConfigurator *)&v8 init];
  if (v6)
  {
    v6->_variant = [v5 variant];
    objc_storeWeak((id *)&v6->_assetsSectionLayoutSpec, v5);
  }

  return v6;
}

- (UIEdgeInsets)containerInsets
{
  double top = self->_containerInsets.top;
  double left = self->_containerInsets.left;
  double bottom = self->_containerInsets.bottom;
  double right = self->_containerInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)variant
{
  return self->_variant;
}

- (BOOL)supportsAspectRatioToggle
{
  return 0;
}

- (int64_t)initialZoomStep
{
  return 0;
}

- (int64_t)numberOfZoomStepsWithDataSource:(id)a3
{
  return 0;
}

- (CGSize)estimatedSizeOfSectionForAssetCollection:(id)a3 isCurated:(BOOL)a4 numberOfAssets:(int64_t)a5 referenceSize:(CGSize)a6
{
  id v8 = a3;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXAssetsSectionConfigurator.m", 101, @"Method %s is a responsibility of subclass %@", "-[PXAssetsSectionConfigurator estimatedSizeOfSectionForAssetCollection:isCurated:numberOfAssets:referenceSize:]", v11 object file lineNumber description];

  abort();
}

- (CGRect)containerFrameForAssetSectionLayout:(id)a3
{
  id v4 = a3;
  [v4 contentSize];
  if (v6 != *MEMORY[0x1E4F1DB30] || v5 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(PXAssetsSectionConfigurator *)self containerInsets];
    [v4 padding];
    PXEdgeInsetsInsetRect();
  }
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAssetsSectionConfigurator.m", 80, @"Method %s is a responsibility of subclass %@", "-[PXAssetsSectionConfigurator configureAssetSectionLayout:]", v8 object file lineNumber description];

  abort();
}

- (id)updatedHeaderLayout:(id)a3 withHeaderStyle:(int64_t)a4 forAssetSectionLayout:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  double v11 = (PXCuratedLibrarySectionHeaderLayout *)v9;
  double v12 = v11;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    double v15 = v11;
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    SEL v27 = a2;
    double v13 = +[PXCuratedLibrarySettings sharedInstance];
    double v14 = v12;
    objc_opt_class();
    double v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v15 = objc_alloc_init(PXCuratedLibrarySectionHeaderLayout);
    }
    v16 = [(PXAssetsSectionConfigurator *)self headerSpecForHeaderStyle:a4 assetSectionLayout:v10];
    [(PXCuratedLibrarySectionHeaderLayout *)v15 setSpec:v16];

    v17 = [v10 assetCollectionReference];
    [(PXCuratedLibrarySectionHeaderLayout *)v15 setAssetCollectionReference:v17];
    -[PXCuratedLibrarySectionHeaderLayout setShowsDebugDescription:](v15, "setShowsDebugDescription:", [v13 showDebugInformationInFloatingHeader]);
    v18 = [v10 actionManager];
    v19 = [v18 ellipsisButtonActionPerformerWithAssetCollectionReference:v17];
    [(PXCuratedLibrarySectionHeaderLayout *)v15 setEllipsisButtonActionPerformer:v19];

    v20 = [v10 actionManager];
    v21 = [v20 actionPerformerForActionType:@"PXCuratedLibraryActionShowFilters"];

    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v23);
        v24 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
        [v26 handleFailureInMethod:v27, self, @"PXAssetsSectionConfigurator.m", 65, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[sectionLayout.actionManager actionPerformerForActionType:PXCuratedLibraryActionShowFilters]", v25, v24 object file lineNumber description];
      }
    }
    [(PXCuratedLibrarySectionHeaderLayout *)v15 setShowFiltersActionPerformer:v21];

    [(PXCuratedLibrarySectionHeaderLayout *)v15 setSafeAreaBehavior:a4 == 1];
    [(PXCuratedLibrarySectionHeaderLayout *)v15 setExternalLeadingButtonConfigurations:0];
  }
  double v11 = v15;
  a4 = (int64_t)v11;
LABEL_10:

  return (id)a4;
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  double v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXAssetsSectionConfigurator.m", 42, @"Method %s is a responsibility of subclass %@", "-[PXAssetsSectionConfigurator headerSpecForHeaderStyle:assetSectionLayout:]", v9 object file lineNumber description];

  abort();
}

- (PXAssetsSectionLayoutSpec)assetsSectionLayoutSpec
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetsSectionLayoutSpec);
  if (!WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXAssetsSectionConfigurator.m", 37, @"Invalid parameter not satisfying: %@", @"assetsSectionLayoutSpec != nil" object file lineNumber description];
  }
  return (PXAssetsSectionLayoutSpec *)WeakRetained;
}

- (PXAssetsSectionConfigurator)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsSectionConfigurator.m", 23, @"%s is not available as initializer", "-[PXAssetsSectionConfigurator init]");

  abort();
}

@end