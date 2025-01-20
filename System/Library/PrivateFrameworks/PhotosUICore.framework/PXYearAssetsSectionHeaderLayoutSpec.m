@interface PXYearAssetsSectionHeaderLayoutSpec
- (PXYearAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6;
- (PXYearAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
- (UIEdgeInsets)padding;
- (void)setPadding:(UIEdgeInsets)a3;
@end

@implementation PXYearAssetsSectionHeaderLayoutSpec

- (PXYearAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PXYearAssetsSectionHeaderLayoutSpec;
  v14 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)&v32 initWithExtendedTraitCollection:v13 options:a4 variant:a6];
  if (v14)
  {
    v15 = +[PXCuratedLibrarySettings sharedInstance];
    [v13 curatedLibraryLayoutStyle];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setEllipsisButtonSpecialTreatment:a6 != 0];
    -[PXYearAssetsSectionHeaderLayoutSpec setPadding:](v14, "setPadding:", top, left, bottom, right);
    [v15 cornerRadiusForYears];
    *(float *)&double v16 = v16;
    LODWORD(v17) = LODWORD(v16);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v14, "setCornerRadius:", v16, v17, 0.0, 0.0);
    uint64_t v18 = objc_msgSend(off_1E5DA6FD0, "px_headerTitleLabelSpecForZoomLevel:featureSpec:", 1, v14);
    id v19 = objc_alloc_init((Class)off_1E5DA9618);
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setTitleSubtitleLabelSpec:v19];

    v20 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 titleSubtitleLabelSpec];
    [v20 setTitleLabelSpec:v18];

    v21 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 titleSubtitleLabelSpec];
    v22 = (void *)[v21 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setDebugInterestingTitleSubtitleLabelSpec:v22];

    v23 = [MEMORY[0x1E4FB1618] greenColor];
    v24 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 debugInterestingTitleSubtitleLabelSpec];
    v25 = [v24 subtitleLabelSpec];
    [v25 setTextColor:v23];

    v26 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 titleSubtitleLabelSpec];
    v27 = (void *)[v26 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setDebugNonInterestingTitleSubtitleLabelSpec:v27];

    v28 = [MEMORY[0x1E4FB1618] redColor];
    v29 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 debugNonInterestingTitleSubtitleLabelSpec];
    v30 = [v29 subtitleLabelSpec];
    [v30 setTextColor:v28];

    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setWantsTitle:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setWantsSubtitle:0];
    if ([(PXFeatureSpec *)v14 sizeClass] == 2)
    {
      [(PXFeatureSpec *)v14 userInterfaceIdiom];
    }
    else if ([(PXFeatureSpec *)v14 layoutOrientation] == 2)
    {
      [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setButtonHeight:20.0];
    }
    else
    {
      [(PXFeatureSpec *)v14 sizeSubclass];
    }
    PXEdgeInsetsMake();
  }

  return 0;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->padding.top;
  double left = self->padding.left;
  double bottom = self->padding.bottom;
  double right = self->padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXYearAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  return -[PXYearAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](self, "initWithExtendedTraitCollection:options:padding:variant:", a3, a4, a5, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

@end