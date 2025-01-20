@interface PXAssetsSectionLayoutSpec
- (BOOL)allowsBlur;
- (BOOL)allowsPositionDependentHeaderContentOpacityInZoomLevel:(int64_t)a3;
- (BOOL)canShowSelectAllButton;
- (BOOL)disableConfigurators;
- (BOOL)supportsGridAspectRatioToggle;
- (BOOL)userInterfaceStyleAllowsShadow;
- (NSShadow)shadow;
- (PXAssetsSectionLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXAssetsSectionLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5 allowsBlur:(BOOL)a6 itemCornerRadius:(double)a7 zoomableSpec:(id)a8;
- (PXZoomablePhotosLayoutSpec)zoomableSpec;
- (UIEdgeInsets)padding;
- (double)itemCornerRadius;
- (double)shadowCornerRadius;
- (double)showAllButtonHeight;
- (id)_configuratorForZoomLevel:(int64_t)a3;
- (id)gridConfigurator;
- (id)sectionConfiguratorForAssetCollection:(id)a3 inZoomLevel:(int64_t)a4;
- (int64_t)numberOfGridZoomStepsWithDataSource:(id)a3;
- (int64_t)numberOfLinesForShowAllButton;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)variant;
@end

@implementation PXAssetsSectionLayoutSpec

- (PXAssetsSectionLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5 allowsBlur:(BOOL)a6 itemCornerRadius:(double)a7 zoomableSpec:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v37.receiver = self;
  v37.super_class = (Class)PXAssetsSectionLayoutSpec;
  v16 = [(PXFeatureSpec *)&v37 initWithExtendedTraitCollection:v14 options:a4];
  v17 = v16;
  if (v16)
  {
    v16->_variant = a5;
    v16->_allowsBlur = a6;
    char v18 = [(PXFeatureSpec *)v16 options];
    v17->_disableConfigurators = (v18 & 2) != 0;
    if ((v18 & 2) == 0)
    {
      objc_storeStrong((id *)&v17->_zoomableSpec, a8);
      v17->_userInterfaceStyleAllowsShadow = [v14 userInterfaceStyle] != 2;
      v19 = [[PXYearAssetsSectionConfigurator alloc] initWithExtendedTraitCollection:v14 assetsSectionLayoutSpec:v17];
      yearSectionConfigurator = v17->_yearSectionConfigurator;
      v17->_yearSectionConfigurator = v19;

      v21 = [[PXMonthCardSectionConfigurator alloc] initWithExtendedTraitCollection:v14 assetsSectionLayoutSpec:v17];
      monthSectionConfigurator = v17->_monthSectionConfigurator;
      v17->_monthSectionConfigurator = v21;

      v23 = [[PXMonthChapterSectionConfigurator alloc] initWithExtendedTraitCollection:v14 assetsSectionLayoutSpec:v17];
      monthsChapterConfigurator = v17->_monthsChapterConfigurator;
      v17->_monthsChapterConfigurator = v23;

      v25 = [[PXDayAssetsSectionConfigurator alloc] initWithExtendedTraitCollection:v14 assetsSectionLayoutSpec:v17];
      daySectionConfigurator = v17->_daySectionConfigurator;
      v17->_daySectionConfigurator = v25;

      v27 = [(PXAssetsSectionConfigurator *)[PXAssetsSectionGridConfigurator alloc] initWithExtendedTraitCollection:v14 assetsSectionLayoutSpec:v17];
      gridConfigurator = v17->_gridConfigurator;
      v17->_gridConfigurator = v27;
    }
    [(PXFeatureSpec *)v17 curatedLibraryEdgeToEdgeContentDefaultPadding];
    v17->_padding.top = v29;
    v17->_padding.left = v30;
    v17->_padding.bottom = v31;
    v17->_padding.right = v32;
    v17->_canShowSelectAllButton = 1;
    v17->_itemCornerRadius = a7;
    v17->_preferredUserInterfaceStyle = (a4 >> 2) & 2;
    unint64_t v33 = [v14 contentSizeCategory] - 8;
    if (v33 >= 5) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = 2;
    }
    v17->_numberOfLinesForShowAllButton = v34;
    if (v33 > 4) {
      uint64_t v35 = 0x4042000000000000;
    }
    else {
      +[PXAssetsSectionButton preferredHeightWithExtendedTraitCollection:v14 numberOfLines:2];
    }
    *(void *)&v17->_showAllButtonHeight = v35;
  }

  return v17;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomableSpec, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_gridConfigurator, 0);
  objc_storeStrong((id *)&self->_daySectionConfigurator, 0);
  objc_storeStrong((id *)&self->_monthsChapterConfigurator, 0);
  objc_storeStrong((id *)&self->_monthSectionConfigurator, 0);
  objc_storeStrong((id *)&self->_yearSectionConfigurator, 0);
}

- (BOOL)disableConfigurators
{
  return self->_disableConfigurators;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (double)showAllButtonHeight
{
  return self->_showAllButtonHeight;
}

- (int64_t)numberOfLinesForShowAllButton
{
  return self->_numberOfLinesForShowAllButton;
}

- (BOOL)canShowSelectAllButton
{
  return self->_canShowSelectAllButton;
}

- (BOOL)allowsBlur
{
  return self->_allowsBlur;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)userInterfaceStyleAllowsShadow
{
  return self->_userInterfaceStyleAllowsShadow;
}

- (double)shadowCornerRadius
{
  return self->_shadowCornerRadius;
}

- (PXZoomablePhotosLayoutSpec)zoomableSpec
{
  return self->_zoomableSpec;
}

- (id)_configuratorForZoomLevel:(int64_t)a3
{
  if ([(PXAssetsSectionLayoutSpec *)self disableConfigurators] || (unint64_t)(a3 - 1) > 3) {
    id v5 = 0;
  }
  else {
    id v5 = *(id *)((char *)&self->super.super.isa + *off_1E5DC1E30[a3 - 1]);
  }
  return v5;
}

- (BOOL)allowsPositionDependentHeaderContentOpacityInZoomLevel:(int64_t)a3
{
  if (([(PXFeatureSpec *)self options] & 4) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    if ((unint64_t)a3 >= 5)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayoutSpec.m" lineNumber:127 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    return (0x18u >> a3) & 1;
  }
  return v6;
}

- (id)sectionConfiguratorForAssetCollection:(id)a3 inZoomLevel:(int64_t)a4
{
  id v7 = a3;
  if (![(PXAssetsSectionLayoutSpec *)self disableConfigurators])
  {
    v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__yearSectionConfigurator;
    switch(a4)
    {
      case 0:
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayoutSpec.m" lineNumber:91 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1:
        goto LABEL_9;
      case 2:
        BOOL v10 = PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v7, 2);
        v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__monthSectionConfigurator;
        if (v10) {
          v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__monthsChapterConfigurator;
        }
        goto LABEL_9;
      case 3:
        v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__daySectionConfigurator;
        goto LABEL_9;
      case 4:
        v9 = &OBJC_IVAR___PXAssetsSectionLayoutSpec__gridConfigurator;
LABEL_9:
        id v8 = *(id *)((char *)&self->super.super.isa + *v9);
        goto LABEL_10;
      default:
        break;
    }
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

- (NSShadow)shadow
{
  shadow = self->_shadow;
  if (!shadow)
  {
    v4 = +[PXCuratedLibrarySettings sharedInstance];
    id v5 = (NSShadow *)objc_alloc_init(MEMORY[0x1E4FB0858]);
    BOOL v6 = self->_shadow;
    self->_shadow = v5;

    id v7 = (void *)MEMORY[0x1E4FB1618];
    [v4 sectionShadowOpacity];
    v9 = [v7 colorWithWhite:0.0 alpha:v8];
    [(NSShadow *)self->_shadow setShadowColor:v9];

    [(NSShadow *)self->_shadow setShadowBlurRadius:30.0];
    -[NSShadow setShadowOffset:](self->_shadow, "setShadowOffset:", 0.0, 10.0);
    self->_shadowCornerRadius = 10.0;
    if ([v4 exaggerateContrast])
    {
      BOOL v10 = [MEMORY[0x1E4FB1618] blackColor];
      [(NSShadow *)self->_shadow setShadowColor:v10];
    }
    shadow = self->_shadow;
  }
  return shadow;
}

- (PXAssetsSectionLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXAssetsSectionLayoutSpec *)self initWithExtendedTraitCollection:a3 options:a4 variant:0 allowsBlur:0 itemCornerRadius:0 zoomableSpec:0.0];
}

- (int64_t)numberOfGridZoomStepsWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsSectionLayoutSpec *)self gridConfigurator];
  int64_t v6 = [v5 numberOfZoomStepsWithDataSource:v4];

  return v6;
}

- (BOOL)supportsGridAspectRatioToggle
{
  v2 = [(PXAssetsSectionLayoutSpec *)self gridConfigurator];
  char v3 = [v2 supportsAspectRatioToggle];

  return v3;
}

- (id)gridConfigurator
{
  return [(PXAssetsSectionLayoutSpec *)self _configuratorForZoomLevel:4];
}

@end