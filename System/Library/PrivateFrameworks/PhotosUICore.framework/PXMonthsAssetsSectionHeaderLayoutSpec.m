@interface PXMonthsAssetsSectionHeaderLayoutSpec
- (BOOL)wantsInlineHeader;
- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6;
- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3;
- (unint64_t)inlineHeaderStyle;
@end

@implementation PXMonthsAssetsSectionHeaderLayoutSpec

- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PXMonthsAssetsSectionHeaderLayoutSpec;
  v14 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)&v59 initWithExtendedTraitCollection:v13 options:a4 variant:a6];
  if (v14)
  {
    v15 = +[PXCuratedLibrarySettings sharedInstance];
    uint64_t v16 = [v13 curatedLibraryLayoutStyle];
    BOOL v17 = (a4 & 0x400) == 0;
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setEllipsisButtonSpecialTreatment:a6 != 0];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setCanShowEllipsisButton:v16 != 1];
    -[PXMonthsAssetsSectionHeaderLayoutSpec adjustedContentPadding:](v14, "adjustedContentPadding:", top, left, bottom, right);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v14, "setPadding:");
    LODWORD(v18) = 10.0;
    LODWORD(v19) = 10.0;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v14, "setCornerRadius:", v18, v19, 0.0, 0.0);
    v20 = objc_msgSend(off_1E5DA9618, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 2, v14);
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setTitleSubtitleLabelSpec:v20];

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

    uint64_t v31 = PXCuratedLibraryHeaderWantsTitleForZoomLevel(2uLL, v14);
    uint64_t v32 = PXCuratedLibraryHeaderWantsSubtitleForZoomLevel(2uLL, v14);
    if (v16 == 1)
    {
      BOOL v17 = 0;
      v35 = +[PXLemonadeSettings sharedInstance];
      char v36 = [v35 enableMonthLocationTitles];

      if ((v36 & 1) == 0)
      {
        v38 = [MEMORY[0x1E4F1CA20] currentLocale];
        id v34 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        v39 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"d" options:0 locale:v38];
        [v34 setDateFormat:v39];

        uint64_t v33 = 0;
        uint64_t v37 = 0;
LABEL_9:
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setWantsTitle:v31];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setWantsSubtitle:v32];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setSwapTitleWithSubtitle:v37];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setTitleDateFormatter:v34];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setShouldOmitYear:v33];
        v40 = [[PXCuratedLibraryChapterHeaderLayoutSpec alloc] initWithExtendedTraitCollection:v13 options:a4 | 0x800];
        uint64_t v41 = [(PXCuratedLibraryChapterHeaderLayoutSpec *)v40 shouldFloat];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setShouldTextFadeOutWhenReachingTop:v41];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setShouldButtonsFadeOutWhenReachingTop:v41];
        [(PXCuratedLibraryChapterHeaderLayoutSpec *)v40 titleHeight];
        double v43 = v42;
        [v15 monthsInlineHeadersFadeoutDistance];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setFadeOutDistance:v43 * v44];
        [(PXCuratedLibraryChapterHeaderLayoutSpec *)v40 floatingDistanceFromSafeAreaTop];
        double v46 = v45;
        [(PXCuratedLibraryChapterHeaderLayoutSpec *)v40 titleHeight];
        double v48 = v47;
        [v15 monthsInlineHeadersFadeoutOffset];
        double v50 = v46 + v48 * (v49 + 1.0);
        [(PXCuratedLibraryChapterHeaderLayoutSpec *)v40 spacingBetweenTitleBottomAndNextCardTop];
        double v52 = v51 + v50;
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 fadeOutDistance];
        [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setFadeOutDistanceFromSafeAreaTop:v52 - v53];
        [v15 monthsInlineHeadersFadeoutMinimumAlpha];
        -[PXCuratedLibrarySectionHeaderLayoutSpec setTextFadeOutMinimumAlpha:](v14, "setTextFadeOutMinimumAlpha:");
        if ([(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 ellipsisButtonSpecialTreatment])
        {
          [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setButtonsFadeOutMinimumAlpha:0.0];
        }
        if ([(PXFeatureSpec *)v14 sizeClass] == 1
          && [(PXFeatureSpec *)v14 layoutOrientation] == 2)
        {
          v54 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 titleSubtitleLabelSpec];
          v55 = v54;
          double v56 = 16.5;
          if (v17) {
            double v56 = 21.0;
          }
          [v54 setDistanceBetweenTitleBaselineAndSubtitleBaseline:v56];

          [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 setButtonHeight:20.0];
        }
        else if (v17)
        {
          if ([(PXFeatureSpec *)v14 sizeClass] == 2)
          {
            [(PXFeatureSpec *)v14 userInterfaceIdiom];
          }
          else if ([(PXFeatureSpec *)v14 sizeClass] == 1)
          {
            [(PXFeatureSpec *)v14 sizeSubclass];
          }
        }
        else
        {
          [(PXFeatureSpec *)v14 userInterfaceIdiom];
          v57 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v14 titleSubtitleLabelSpec];
          [v57 setDistanceBetweenTitleBaselineAndSubtitleBaseline:19.0];
        }
        PXEdgeInsetsMake();
      }
      id v34 = 0;
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = [v15 allowsCustomDateTitles];
      id v34 = 0;
    }
    uint64_t v37 = 1;
    goto LABEL_9;
  }

  return 0;
}

- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PXMonthsAssetsSectionHeaderLayoutSpec;
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
      int64_t v13 = [(PXFeatureSpec *)self layoutOrientation];

      if (v13 == 1) {
        double v11 = v11 + -14.0;
      }
    }
    else
    {
    }
  }
  double v14 = v5;
  double v15 = v7;
  double v16 = v9;
  double v17 = v11;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v14;
  return result;
}

- (unint64_t)inlineHeaderStyle
{
  return 0;
}

- (BOOL)wantsInlineHeader
{
  return 0;
}

- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  return -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](self, "initWithExtendedTraitCollection:options:padding:variant:", a3, a4, a5, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](self, "initWithExtendedTraitCollection:options:padding:variant:", a3, a4, 0, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

@end