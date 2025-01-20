@interface PXMonthCardSectionBodyLayoutSpec
- (PXMonthCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (double)_cardHeightWithExtendedTraitCollection:(id)a3;
- (double)interitemSpacing;
- (void)_configureDynamicAspectRatioWithExtendedTraitCollection:(id)a3;
@end

@implementation PXMonthCardSectionBodyLayoutSpec

- (PXMonthCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXMonthCardSectionBodyLayoutSpec;
  v7 = [(PXCuratedLibraryCardSectionBodyLayoutSpec *)&v22 initWithExtendedTraitCollection:v6 options:a4];
  if (v7)
  {
    v8 = +[PXCuratedLibrarySettings sharedInstance];
    if ([(PXFeatureSpec *)v7 userInterfaceIdiom] == 4)
    {
      [(PXFeatureSpec *)v7 contentGuideInsetsForScrollAxis:1];
      double v10 = v9;
LABEL_18:
      [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v7 setHorizontalMargin:v10];
      [(PXMonthCardSectionBodyLayoutSpec *)v7 _configureDynamicAspectRatioWithExtendedTraitCollection:v6];
LABEL_21:
      [v8 cornerRadiusForMonths];
      *(float *)&double v17 = v17;
      LODWORD(v18) = LODWORD(v17);
      LODWORD(v19) = LODWORD(v17);
      LODWORD(v20) = LODWORD(v17);
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setCornerRadius:](v7, "setCornerRadius:", v17, v18, v19, v20);
      v7->_layoutStyle = [v6 curatedLibraryLayoutStyle];
      [(PXFeatureSpec *)v7 spacingBetweenMonthCards];
      [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v7 setDistanceToNextLayout:"setDistanceToNextLayout:"];

      goto LABEL_22;
    }
    if ([(PXFeatureSpec *)v7 userInterfaceIdiom] == 5)
    {
      [v8 lateralMarginMonths];
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setHorizontalMargin:](v7, "setHorizontalMargin:");
      double v11 = 1.5;
    }
    else
    {
      if ([(PXFeatureSpec *)v7 sizeClass] == 2)
      {
        [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v7 horizontalMargin];
        double v13 = v12;
        if ([v6 windowOrientation] == 1) {
          double v13 = v13 + v13;
        }
        [(PXFeatureSpec *)v7 layoutReferenceSize];
        if (v13 > 104.0 || v14 < 1112.0) {
          double v10 = v13;
        }
        else {
          double v10 = 104.0;
        }
        goto LABEL_18;
      }
      if ([v6 layoutOrientation] == 2)
      {
        [v6 layoutReferenceSize];
        double v10 = (v16 + -560.0) * 0.5;
        if (v10 < 104.0) {
          double v10 = 104.0;
        }
        goto LABEL_18;
      }
      [v8 aspectRatioForCompactPortraitMonths];
    }
    [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v7 setAspectRatio:v11];
    goto LABEL_21;
  }
LABEL_22:

  return v7;
}

- (double)interitemSpacing
{
  if (self->_layoutStyle == 1 && [(PXFeatureSpec *)self sizeClass] != 2) {
    return 6.0;
  }
  [(PXFeatureSpec *)self spacingBetweenMonthCards];
  return result;
}

- (double)_cardHeightWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  [(PXFeatureSpec *)self layoutReferenceSize];
  double v6 = v5;
  double v8 = v7;
  [(PXFeatureSpec *)self safeAreaInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [[PXExploreLayoutMetrics alloc] initWithSpec:self];
  -[PXLayoutMetrics setReferenceSize:](v17, "setReferenceSize:", v6, v8);
  -[PXExploreLayoutMetrics setSafeAreaInsets:](v17, "setSafeAreaInsets:", v10, v12, v14, v16);
  double v18 = [[PXExploreLayoutGenerator alloc] initWithMetrics:v17];
  [(PXExploreLayoutGenerator *)v18 setItemCount:1];
  [(PXExploreLayoutGenerator *)v18 setItemLayoutInfoBlock:&__block_literal_global_120139];
  [(PXExploreLayoutGenerator *)v18 size];
  double v20 = v19;
  if ([v4 layoutSizeClass] == 2)
  {
    v21 = [[PXCuratedLibraryStyleGuide alloc] initWithExtendedTraitCollection:v4];
    [(PXCuratedLibraryStyleGuide *)v21 secondaryToolbarContentInsets];
    if (v22 >= v10) {
      double v10 = v22;
    }
  }
  v23 = [(PXFeatureSpec *)[PXCuratedLibraryChapterHeaderLayoutSpec alloc] initWithExtendedTraitCollection:v4];
  [(PXCuratedLibraryChapterHeaderLayoutSpec *)v23 titleHeight];
  double v25 = v10 + 11.0 + v24;
  [(PXCuratedLibraryChapterHeaderLayoutSpec *)v23 spacingBetweenTitleBottomAndNextCardTop];
  double v27 = v8 - v14 + (v25 + v26) * -2.0;
  if (v20 >= v27) {
    double v28 = v27;
  }
  else {
    double v28 = v20;
  }

  return v28;
}

id __75__PXMonthCardSectionBodyLayoutSpec__cardHeightWithExtendedTraitCollection___block_invoke()
{
  v0 = objc_msgSend(objc_alloc((Class)off_1E5DA6FF0), "initWithSize:weight:", 1.0, 1.0, 1.0);
  return v0;
}

- (void)_configureDynamicAspectRatioWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  [(PXFeatureSpec *)self layoutReferenceSize];
  double v6 = v5;
  [(PXCuratedLibraryCardSectionBodyLayoutSpec *)self horizontalMargin];
  double v8 = v6 + v7 * -2.0;
  [(PXMonthCardSectionBodyLayoutSpec *)self _cardHeightWithExtendedTraitCollection:v4];
  double v10 = v9;

  [(PXCuratedLibraryCardSectionBodyLayoutSpec *)self setAspectRatio:v8 / v10];
}

@end