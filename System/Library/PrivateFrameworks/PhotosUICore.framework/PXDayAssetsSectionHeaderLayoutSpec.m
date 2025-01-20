@interface PXDayAssetsSectionHeaderLayoutSpec
- (PXDayAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
@end

@implementation PXDayAssetsSectionHeaderLayoutSpec

- (PXDayAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  v30.receiver = self;
  v30.super_class = (Class)PXDayAssetsSectionHeaderLayoutSpec;
  v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v30, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  if (v6)
  {
    v7 = +[PXCuratedLibrarySettings sharedInstance];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setEllipsisButtonSpecialTreatment:a5 != 0];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v6, "setPadding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
    LODWORD(v8) = *(_DWORD *)off_1E5DAAF50;
    LODWORD(v9) = *((_DWORD *)off_1E5DAAF50 + 1);
    LODWORD(v10) = *((_DWORD *)off_1E5DAAF50 + 2);
    LODWORD(v11) = *((_DWORD *)off_1E5DAAF50 + 3);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v6, "setCornerRadius:", v8, v9, v10, v11);
    v12 = objc_msgSend(off_1E5DA9618, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 3, v6);
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setTitleSubtitleLabelSpec:v12];

    v13 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 titleSubtitleLabelSpec];
    v14 = (void *)[v13 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setDebugInterestingTitleSubtitleLabelSpec:v14];

    v15 = [MEMORY[0x1E4FB1618] greenColor];
    v16 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 debugInterestingTitleSubtitleLabelSpec];
    v17 = [v16 subtitleLabelSpec];
    [v17 setTextColor:v15];

    v18 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 debugInterestingTitleSubtitleLabelSpec];
    v19 = [v18 subtitleLabelSpec];
    [v19 setNumberOfLines:3];

    v20 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 titleSubtitleLabelSpec];
    v21 = (void *)[v20 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setDebugNonInterestingTitleSubtitleLabelSpec:v21];

    v22 = [MEMORY[0x1E4FB1618] redColor];
    v23 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 debugNonInterestingTitleSubtitleLabelSpec];
    v24 = [v23 subtitleLabelSpec];
    [v24 setTextColor:v22];

    v25 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 debugNonInterestingTitleSubtitleLabelSpec];
    v26 = [v25 subtitleLabelSpec];
    [v26 setNumberOfLines:3];

    v27 = v6;
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v27 setWantsTitle:1];
    v28 = v27;

    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setWantsSubtitle:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setShouldAvoidOverlapWithSecondaryToolbar:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 curatedLibraryEdgeToEdgeContentDefaultPadding];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v28, "setContentPadding:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setShouldAccommodateLeadingButtonsLayout:1];
    [v7 daysHeaderGradientAlpha];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v28, "setGradientAlpha:");
    [v7 daysHeaderGradientHeight];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v28, "setGradientHeight:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setGradientRespectsSafeArea:0];
    if ([(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 ellipsisButtonSpecialTreatment])
    {
      [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setShouldButtonsFadeOutWhenReachingTop:1];
      [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setFadeOutDistance:10.0];
      [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setFadeOutDistanceFromSafeAreaTop:10.0];
      [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setButtonsFadeOutMinimumAlpha:0.0];
    }
  }
  return v6;
}

@end