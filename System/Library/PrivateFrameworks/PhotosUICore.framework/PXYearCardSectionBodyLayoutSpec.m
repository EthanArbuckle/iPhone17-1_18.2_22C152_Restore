@interface PXYearCardSectionBodyLayoutSpec
- (PXYearCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (double)multiColumnAspectRatio;
- (void)setMultiColumnAspectRatio:(double)a3;
@end

@implementation PXYearCardSectionBodyLayoutSpec

- (PXYearCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXYearCardSectionBodyLayoutSpec;
  v7 = [(PXCuratedLibraryCardSectionBodyLayoutSpec *)&v16 initWithExtendedTraitCollection:v6 options:a4];
  v8 = v7;
  if (v7)
  {
    [(PXYearCardSectionBodyLayoutSpec *)v7 setMultiColumnAspectRatio:1.0];
    v9 = +[PXCuratedLibrarySettings sharedInstance];
    if ([v6 layoutSizeClass] == 2)
    {
      [v9 aspectRatioForRegularYears];
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v8, "setAspectRatio:");
      if ([v6 userInterfaceIdiom] == 4)
      {
        [(PXFeatureSpec *)v8 contentGuideInsetsForScrollAxis:1];
        [(PXCuratedLibraryCardSectionBodyLayoutSpec *)v8 setHorizontalMargin:v10];
      }
    }
    else if ([v6 layoutOrientation] == 2)
    {
      [v9 aspectRatioForCompactLandscapeYears];
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v8, "setAspectRatio:");
      [(PXYearCardSectionBodyLayoutSpec *)v8 setMultiColumnAspectRatio:1.5];
    }
    else
    {
      [v9 aspectRatioForCompactPortraitYears];
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v8, "setAspectRatio:");
    }
    [v9 cornerRadiusForYears];
    *(float *)&double v11 = v11;
    LODWORD(v12) = LODWORD(v11);
    LODWORD(v13) = LODWORD(v11);
    LODWORD(v14) = LODWORD(v11);
    -[PXCuratedLibraryCardSectionBodyLayoutSpec setCornerRadius:](v8, "setCornerRadius:", v11, v12, v13, v14);
  }
  return v8;
}

- (void)setMultiColumnAspectRatio:(double)a3
{
  self->_multiColumnAspectRatio = a3;
}

- (double)multiColumnAspectRatio
{
  return self->_multiColumnAspectRatio;
}

@end