@interface PXCuratedLibraryLayoutSpec
- (BOOL)allowsPaginatedScrollingInYearsAndMonths;
- (BOOL)allowsSlideshowInYears;
- (BOOL)isTopSafeAreaFullyCovered;
- (BOOL)shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:(int64_t)a3;
- (BOOL)wantsBlurredBackground;
- (BOOL)wantsBlurredSecondaryToolbarTransition;
- (BOOL)wantsStatusBarGradient;
- (NSNumber)inlineHeaderOverlayTopInsetOverride;
- (PXAssetsSectionLayoutSpec)sectionLayoutSpec;
- (PXCuratedLibraryLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXCuratedLibraryLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
- (PXCuratedLibrarySectionHeaderLayoutSpec)allPhotosFloatingHeaderSpec;
- (PXCuratedLibrarySectionHeaderLayoutSpec)daysTopHeaderSpec;
- (PXCuratedLibrarySectionHeaderLayoutSpec)monthsTopHeaderSpec;
- (PXCuratedLibrarySectionHeaderLayoutSpec)yearsTopHeaderSpec;
- (PXExtendedImageConfiguration)statusBarGradientImageConfiguration;
- (PXMonthsLayoutMetrics)monthsLayoutMetrics;
- (PXYearsLayoutMetrics)yearsLayoutMetrics;
- (UIColor)backgroundColor;
- (UIColor)contentBackgroundColor;
- (UIColor)contentUnavailableBackgroundColor;
- (UIEdgeInsets)blurredBackgroundEdgeInsets;
- (double)blurredBackgroundInitialOpacityForZoomLevel:(int64_t)a3;
- (double)blurredBackgroundOpacityForZoomLevel:(int64_t)a3;
- (double)defaultInterlayoutSpacingForZoomLevel:(int64_t)a3;
- (double)interbuttonSpacing;
- (double)spacingBetweenHeaderLastBaselineAndAllPhotosTop;
- (double)spacingBetweenSafeAreaTopAndFirstMonthTitle;
- (double)spacingBetweenSafeAreaTopAndFirstYearCard;
- (int64_t)axis;
- (int64_t)variant;
- (unint64_t)layoutStyle;
@end

@implementation PXCuratedLibraryLayoutSpec

- (PXExtendedImageConfiguration)statusBarGradientImageConfiguration
{
  return self->_statusBarGradientImageConfiguration;
}

- (BOOL)wantsBlurredSecondaryToolbarTransition
{
  return self->_wantsBlurredSecondaryToolbarTransition;
}

- (double)spacingBetweenHeaderLastBaselineAndAllPhotosTop
{
  return self->_spacingBetweenHeaderLastBaselineAndAllPhotosTop;
}

- (NSNumber)inlineHeaderOverlayTopInsetOverride
{
  return self->_inlineHeaderOverlayTopInsetOverride;
}

- (PXCuratedLibraryLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  id v8 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PXCuratedLibraryLayoutSpec;
  v9 = [(PXFeatureSpec *)&v49 initWithExtendedTraitCollection:v8 options:a4];
  v10 = v9;
  if (v9)
  {
    v9->_variant = a5;
    v9->_axis = 1;
    uint64_t v11 = [(PXFeatureSpec *)v9 sizeClass];
    double v12 = 36.0;
    if (v11 != 2) {
      double v12 = 8.0;
    }
    double v13 = 34.0;
    if (v11 != 2) {
      double v13 = 20.0;
    }
    v10->_spacingBetweenSafeAreaTopAndFirstYearCard = v12;
    v10->_spacingBetweenSafeAreaTopAndFirstMonthTitle = v13;
    v10->_spacingBetweenHeaderLastBaselineAndAllPhotosTop = v13;
    uint64_t v14 = [v8 layoutSizeClass];
    double v15 = 12.0;
    if (v14 == 1) {
      double v15 = 8.0;
    }
    v10->_interbuttonSpacing = v15;
    [(PXFeatureSpec *)v10 spacingBetweenYearCards];
    v10->_spacingBetweenYears = v16;
    v10->_isTopSafeAreaFullyCovered = [(PXFeatureSpec *)v10 userInterfaceIdiom] == 4;
    [(PXFeatureSpec *)v10 spacingBetweenMonthCards];
    v10->_estimatedSpacingBetweenMonths = v17;
    v10->_spacingBetweenMonths = -1.0;
    v18 = +[PXCuratedLibrarySettings sharedInstance];
    [v18 spacingBetweenDays];
    v10->_spacingBetweenDays = v19;

    uint64_t v20 = [v8 curatedLibraryLayoutStyle];
    v10->_layoutStyle = v20;
    uint64_t v21 = [v8 curatedLibraryLayoutStyle];
    BOOL v22 = v21 == 1;
    if ([(PXFeatureSpec *)v10 userInterfaceIdiom] == 5)
    {
      uint64_t v23 = [MEMORY[0x1E4FB1618] clearColor];
      backgroundColor = v10->_backgroundColor;
      v10->_backgroundColor = (UIColor *)v23;

      contentBackgroundColor = v10->_contentBackgroundColor;
      v10->_contentBackgroundColor = 0;
    }
    else if ([(PXFeatureSpec *)v10 userInterfaceIdiom] != 4)
    {
      if (v21 == 1) {
        [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
      }
      else {
      v26 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      }
      objc_storeStrong((id *)&v10->_backgroundColor, v26);

      if (v21 == 1)
      {
        v27 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      }
      else
      {
        v27 = 0;
      }
      objc_storeStrong((id *)&v10->_contentBackgroundColor, v27);
      if (v21 != 1) {
        goto LABEL_22;
      }

      goto LABEL_21;
    }
    if (v21 != 1)
    {
LABEL_22:
      v28 = v10->_backgroundColor;
LABEL_23:
      objc_storeStrong((id *)&v10->_contentUnavailableBackgroundColor, v28);
      if (v21 == 1) {

      }
      v10->_wantsBlurredBackground = v22;
      v10->_wantsBlurredSecondaryToolbarTransition = v22;
      BOOL v29 = [v8 userInterfaceIdiom] != 4 && objc_msgSend(v8, "userInterfaceIdiom") != 5;
      v10->_wantsStatusBarGradient = v29;
      long long v30 = *((_OWORD *)off_1E5DAAF10 + 1);
      *(_OWORD *)&v10->_blurredBackgroundEdgeInsets.top = *(_OWORD *)off_1E5DAAF10;
      *(_OWORD *)&v10->_blurredBackgroundEdgeInsets.bottom = v30;
      v31 = [[PXCuratedLibraryYearsTopHeaderSpec alloc] initWithExtendedTraitCollection:v8 options:a4 variant:a5];
      yearsTopHeaderSpec = v10->_yearsTopHeaderSpec;
      v10->_yearsTopHeaderSpec = &v31->super;

      v33 = [[PXCuratedLibraryMonthsTopHeaderSpec alloc] initWithExtendedTraitCollection:v8 options:a4 variant:a5];
      monthsTopHeaderSpec = v10->_monthsTopHeaderSpec;
      v10->_monthsTopHeaderSpec = &v33->super;

      v35 = [[PXCuratedLibraryDaysTopHeaderSpec alloc] initWithExtendedTraitCollection:v8 options:a4 variant:a5];
      daysTopHeaderSpec = v10->_daysTopHeaderSpec;
      v10->_daysTopHeaderSpec = &v35->super;

      v37 = [[PXAllPhotosFloatingHeaderSpec alloc] initWithExtendedTraitCollection:v8 options:a4 variant:a5];
      allPhotosFloatingHeaderSpec = v10->_allPhotosFloatingHeaderSpec;
      v10->_allPhotosFloatingHeaderSpec = &v37->super;

      v39 = [[PXAssetsSectionLayoutSpec alloc] initWithExtendedTraitCollection:v8 options:a4 variant:a5 allowsBlur:0 itemCornerRadius:0 zoomableSpec:0.0];
      sectionLayoutSpec = v10->_sectionLayoutSpec;
      v10->_sectionLayoutSpec = v39;

      if ([(PXFeatureSpec *)v10 sizeClass] != 2 && [(PXFeatureSpec *)v10 sizeSubclass] == 1) {
        [(PXFeatureSpec *)v10 layoutOrientation];
      }
      if ([(PXFeatureSpec *)v10 userInterfaceIdiom] == 5)
      {
        inlineHeaderOverlayTopInsetOverride = v10->_inlineHeaderOverlayTopInsetOverride;
        v10->_inlineHeaderOverlayTopInsetOverride = (NSNumber *)&unk_1F02D8428;
      }
      v42 = [[PXYearCardSectionBodyLayoutSpec alloc] initWithExtendedTraitCollection:v8 options:a4];
      v43 = [[PXMonthCardSectionBodyLayoutSpec alloc] initWithExtendedTraitCollection:v8 options:a4];
      if ([(PXFeatureSpec *)v10 userInterfaceIdiom] == 2) {
        uint64_t v44 = [v8 windowOrientation];
      }
      else {
        uint64_t v44 = [(PXFeatureSpec *)v10 layoutOrientation];
      }
      uint64_t v45 = v44;
      v46 = objc_alloc_init(PXYearsLayoutMetrics);
      yearsLayoutMetrics = v10->_yearsLayoutMetrics;
      v10->_yearsLayoutMetrics = v46;

      [(PXYearsLayoutMetrics *)v10->_yearsLayoutMetrics setSizeClass:[(PXFeatureSpec *)v10 sizeClass]];
      [(PXYearsLayoutMetrics *)v10->_yearsLayoutMetrics setOrientation:v45];
      [(PXFeatureSpec *)v42 spacingBetweenYearCards];
      -[PXYearsLayoutMetrics setInteritemSpacing:](v10->_yearsLayoutMetrics, "setInteritemSpacing:");
      [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v42 aspectRatio];
      -[PXYearsLayoutMetrics setDefaultItemAspectRatio:](v10->_yearsLayoutMetrics, "setDefaultItemAspectRatio:");
      [(PXYearsLayoutMetrics *)v10->_yearsLayoutMetrics setLayoutStyle:v20];
      [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v42 horizontalMargin];
      if ([(PXFeatureSpec *)v10 userInterfaceIdiom] == 2) {
        [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v43 horizontalMargin];
      }
      PXEdgeInsetsMake();
    }
LABEL_21:
    v28 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    goto LABEL_23;
  }

  return 0;
}

- (int64_t)variant
{
  return self->_variant;
}

- (double)blurredBackgroundOpacityForZoomLevel:(int64_t)a3
{
  BOOL v6 = [(PXCuratedLibraryLayoutSpec *)self wantsBlurredBackground];
  double result = 0.0;
  if (v6)
  {
    if ((unint64_t)(a3 - 1) < 2)
    {
      double v13 = +[PXCuratedLibrarySettings sharedInstance];
      [v13 blurredBackgroundFinalOpacity];
      double v15 = v14;

      double result = 0.000001;
      if (v15 >= 0.000001) {
        return v15;
      }
    }
    else if ((unint64_t)(a3 - 3) >= 2)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0.0);
      if (a3)
      {
        v9 = v8;
        SEL v10 = a2;
        uint64_t v11 = self;
        uint64_t v12 = 232;
      }
      else
      {
        v9 = v8;
        SEL v10 = a2;
        uint64_t v11 = self;
        uint64_t v12 = 223;
      }
      [v8 handleFailureInMethod:v10 object:v11 file:@"PXCuratedLibraryLayoutSpec.m" lineNumber:v12 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return result;
}

- (BOOL)wantsBlurredBackground
{
  return self->_wantsBlurredBackground;
}

- (UIEdgeInsets)blurredBackgroundEdgeInsets
{
  double top = self->_blurredBackgroundEdgeInsets.top;
  double left = self->_blurredBackgroundEdgeInsets.left;
  double bottom = self->_blurredBackgroundEdgeInsets.bottom;
  double right = self->_blurredBackgroundEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)allPhotosFloatingHeaderSpec
{
  return self->_allPhotosFloatingHeaderSpec;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)interbuttonSpacing
{
  return self->_interbuttonSpacing;
}

- (BOOL)allowsSlideshowInYears
{
  return self->_allowsSlideshowInYears;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentUnavailableBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_statusBarGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_inlineHeaderOverlayTopInsetOverride, 0);
  objc_storeStrong((id *)&self->_monthsLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_yearsLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_sectionLayoutSpec, 0);
  objc_storeStrong((id *)&self->_allPhotosFloatingHeaderSpec, 0);
  objc_storeStrong((id *)&self->_daysTopHeaderSpec, 0);
  objc_storeStrong((id *)&self->_monthsTopHeaderSpec, 0);
  objc_storeStrong((id *)&self->_yearsTopHeaderSpec, 0);
}

- (BOOL)wantsStatusBarGradient
{
  return self->_wantsStatusBarGradient;
}

- (UIColor)contentUnavailableBackgroundColor
{
  return self->_contentUnavailableBackgroundColor;
}

- (BOOL)allowsPaginatedScrollingInYearsAndMonths
{
  return self->_allowsPaginatedScrollingInYearsAndMonths;
}

- (BOOL)isTopSafeAreaFullyCovered
{
  return self->_isTopSafeAreaFullyCovered;
}

- (double)spacingBetweenSafeAreaTopAndFirstMonthTitle
{
  return self->_spacingBetweenSafeAreaTopAndFirstMonthTitle;
}

- (double)spacingBetweenSafeAreaTopAndFirstYearCard
{
  return self->_spacingBetweenSafeAreaTopAndFirstYearCard;
}

- (PXMonthsLayoutMetrics)monthsLayoutMetrics
{
  return self->_monthsLayoutMetrics;
}

- (PXYearsLayoutMetrics)yearsLayoutMetrics
{
  return self->_yearsLayoutMetrics;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (PXAssetsSectionLayoutSpec)sectionLayoutSpec
{
  return self->_sectionLayoutSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)daysTopHeaderSpec
{
  return self->_daysTopHeaderSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)monthsTopHeaderSpec
{
  return self->_monthsTopHeaderSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)yearsTopHeaderSpec
{
  return self->_yearsTopHeaderSpec;
}

- (int64_t)axis
{
  return self->_axis;
}

- (BOOL)shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 != 2) {
    return 0;
  }
  if ([(PXFeatureSpec *)self sizeClass] == 1) {
    return [(PXFeatureSpec *)self layoutOrientation] == 2;
  }
  return 0;
}

- (double)blurredBackgroundInitialOpacityForZoomLevel:(int64_t)a3
{
  double v6 = 0.0;
  if ([(PXCuratedLibraryLayoutSpec *)self wantsBlurredBackground])
  {
    if ((unint64_t)(a3 - 1) < 2)
    {
      uint64_t v12 = +[PXCuratedLibrarySettings sharedInstance];
      if ([(PXFeatureSpec *)self userInterfaceIdiom] == 4) {
        [v12 blurredBackgroundInitialOpacityMac];
      }
      else {
        [v12 blurredBackgroundInitialOpacity];
      }
      double v6 = v13;
    }
    else if ((unint64_t)(a3 - 3) >= 2)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      if (a3)
      {
        id v8 = v7;
        SEL v9 = a2;
        SEL v10 = self;
        uint64_t v11 = 213;
      }
      else
      {
        id v8 = v7;
        SEL v9 = a2;
        SEL v10 = self;
        uint64_t v11 = 201;
      }
      [v7 handleFailureInMethod:v9 object:v10 file:@"PXCuratedLibraryLayoutSpec.m" lineNumber:v11 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return v6;
}

- (double)defaultInterlayoutSpacingForZoomLevel:(int64_t)a3
{
  v3 = &OBJC_IVAR___PXCuratedLibraryLayoutSpec__spacingBetweenYears;
  switch(a3)
  {
    case 0:
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryLayoutSpec.m" lineNumber:176 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      goto LABEL_5;
    case 2:
      v3 = &OBJC_IVAR___PXCuratedLibraryLayoutSpec__spacingBetweenMonths;
      goto LABEL_5;
    case 3:
      v3 = &OBJC_IVAR___PXCuratedLibraryLayoutSpec__spacingBetweenDays;
LABEL_5:
      double result = *(double *)((char *)&self->super.super.isa + *v3);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (PXCuratedLibraryLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXCuratedLibraryLayoutSpec *)self initWithExtendedTraitCollection:a3 options:a4 variant:0];
}

@end