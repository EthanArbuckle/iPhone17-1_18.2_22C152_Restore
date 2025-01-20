@interface PXMonthCardSectionConfigurator
+ (int64_t)zoomLevel;
- (PXMonthCardSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4;
- (id)createCardSpecWithExtendedTraitCollection:(id)a3;
- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4;
- (void)configureAssetSectionLayout:(id)a3;
@end

@implementation PXMonthCardSectionConfigurator

- (PXMonthCardSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXMonthCardSectionConfigurator;
  v8 = [(PXCuratedLibraryCardSectionConfigurator *)&v22 initWithExtendedTraitCollection:v6 assetsSectionLayoutSpec:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(PXCuratedLibraryCardSectionConfigurator *)v8 cardSpec];
    [v10 padding];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXMonthsAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v6, 0, [v7 variant], v12, v14, v16, v18);
    floatingHeaderSpec = v9->_floatingHeaderSpec;
    v9->_floatingHeaderSpec = v19;
  }
  return v9;
}

- (id)createCardSpecWithExtendedTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = [(PXFeatureSpec *)[PXMonthCardSectionBodyLayoutSpec alloc] initWithExtendedTraitCollection:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  return self->_floatingHeaderSpec;
}

- (void)configureAssetSectionLayout:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXMonthCardSectionConfigurator;
  id v3 = a3;
  [(PXCuratedLibraryCardSectionConfigurator *)&v5 configureAssetSectionLayout:v3];
  v4 = PXLocalizedStringFromTable(@"PXCuratedLibraryMonthsZoomLevelButtonTitle", @"PhotosUICore");
  objc_msgSend(v3, "setAxLocalizedBaseLabel:", v4, v5.receiver, v5.super_class);
}

+ (int64_t)zoomLevel
{
  return 2;
}

@end