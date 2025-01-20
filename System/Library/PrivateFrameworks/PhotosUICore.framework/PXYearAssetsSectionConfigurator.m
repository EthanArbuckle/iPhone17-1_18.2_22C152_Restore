@interface PXYearAssetsSectionConfigurator
- (PXYearAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4;
- (id)createCardSpecWithExtendedTraitCollection:(id)a3;
- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4;
- (void)configureAssetSectionLayout:(id)a3;
@end

@implementation PXYearAssetsSectionConfigurator

- (PXYearAssetsSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PXYearAssetsSectionConfigurator;
  v8 = [(PXCuratedLibraryCardSectionConfigurator *)&v24 initWithExtendedTraitCollection:v6 assetsSectionLayoutSpec:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(PXCuratedLibraryCardSectionConfigurator *)v8 cardSpec];
    [v10 padding];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = -[PXYearAssetsSkimmingSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXYearAssetsSkimmingSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v6, 0, [v7 variant], v12, v14, v16, v18);
    skimmingHeaderSpec = v9->_skimmingHeaderSpec;
    v9->_skimmingHeaderSpec = v19;

    v21 = -[PXYearAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXYearAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v6, 0, [v7 variant], v12, v14, v16, v18);
    normalHeaderSpec = v9->_normalHeaderSpec;
    v9->_normalHeaderSpec = v21;
  }
  return v9;
}

- (id)createCardSpecWithExtendedTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = [(PXFeatureSpec *)[PXYearCardSectionBodyLayoutSpec alloc] initWithExtendedTraitCollection:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalHeaderSpec, 0);
  objc_storeStrong((id *)&self->_skimmingHeaderSpec, 0);
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  id v5 = a4;
  id v6 = &OBJC_IVAR___PXYearAssetsSectionConfigurator__skimmingHeaderSpec;
  if (([v5 showsSkimmingInteraction] & 1) == 0
    && ![v5 showsSkimmingSlideshow])
  {
    id v6 = &OBJC_IVAR___PXYearAssetsSectionConfigurator__normalHeaderSpec;
  }
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXYearAssetsSectionConfigurator;
  [(PXCuratedLibraryCardSectionConfigurator *)&v14 configureAssetSectionLayout:v5];
  id v6 = [v5 headerLayout];
  char v7 = [v6 isFloating];

  if ((v7 & 1) == 0)
  {
    v8 = [v5 headerLayout];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        double v11 = (objc_class *)objc_opt_class();
        double v12 = NSStringFromClass(v11);
        double v13 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
        [v10 handleFailureInMethod:a2, self, @"PXYearAssetsSectionConfigurator.m", 39, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"sectionLayout.headerLayout", v12, v13 object file lineNumber description];
      }
    }
    [v8 setEllipsisButtonActionPerformer:0];
  }
  v9 = PXLocalizedStringFromTable(@"PXCuratedLibraryYearsZoomLevelButtonTitle", @"PhotosUICore");
  [v5 setAxLocalizedBaseLabel:v9];
}

@end