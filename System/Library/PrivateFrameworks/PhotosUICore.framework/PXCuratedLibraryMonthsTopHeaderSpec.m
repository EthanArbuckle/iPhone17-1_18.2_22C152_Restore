@interface PXCuratedLibraryMonthsTopHeaderSpec
- (PXCuratedLibraryMonthsTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3;
@end

@implementation PXCuratedLibraryMonthsTopHeaderSpec

- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PXCuratedLibraryMonthsTopHeaderSpec;
  -[PXCuratedLibrarySectionHeaderLayoutSpec adjustedContentPadding:](&v18, sel_adjustedContentPadding_, a3.top, a3.left, a3.bottom, a3.right);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(PXCuratedLibrarySectionHeaderLayoutSpec *)self ellipsisButtonSpecialTreatment])
  {
    v12 = +[PXCuratedLibrarySettings sharedInstance];
    if ([v12 alignActionButtonsTrailingEdges])
    {
    }
    else
    {
      int64_t v13 = [(PXFeatureSpec *)self layoutOrientation];

      if (v13 == 1) {
        double v11 = v11 + 14.0;
      }
    }
  }
  double v14 = v5;
  double v15 = v7;
  double v16 = v9;
  double v17 = v11;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (PXCuratedLibraryMonthsTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryMonthsTopHeaderSpec;
  double v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v9, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  double v7 = v6;
  if (v6)
  {
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setIsFloating:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v7 setEllipsisButtonSpecialTreatment:a5 != 0];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v7 curatedLibraryEdgeToEdgeContentDefaultPadding];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v7, "setPadding:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v7 padding];
    PXEdgeInsetsForEdges();
  }
  return 0;
}

@end