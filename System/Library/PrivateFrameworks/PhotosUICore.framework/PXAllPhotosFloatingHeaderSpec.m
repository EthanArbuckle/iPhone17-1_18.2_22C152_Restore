@interface PXAllPhotosFloatingHeaderSpec
- (BOOL)showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:(BOOL)a3 selectButtonIsShown:(BOOL)a4;
- (PXAllPhotosFloatingHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
@end

@implementation PXAllPhotosFloatingHeaderSpec

- (PXAllPhotosFloatingHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  id v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PXAllPhotosFloatingHeaderSpec;
  v9 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)&v33 initWithExtendedTraitCollection:v8 options:a4 variant:a5];
  if (v9)
  {
    unint64_t v10 = [v8 contentSizeCategory] - 8;
    uint64_t v11 = [v8 layoutSizeClass];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 setIsFloating:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 setEllipsisButtonSpecialTreatment:a5 != 0];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v9, "setPadding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
    LODWORD(v12) = *(_DWORD *)off_1E5DAAF50;
    LODWORD(v13) = *((_DWORD *)off_1E5DAAF50 + 1);
    LODWORD(v14) = *((_DWORD *)off_1E5DAAF50 + 2);
    LODWORD(v15) = *((_DWORD *)off_1E5DAAF50 + 3);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v9, "setCornerRadius:", v12, v13, v14, v15);
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 setCanShowZoomButtons:1];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowAspectFitButtons:](v9, "setCanShowAspectFitButtons:", [v8 userInterfaceIdiom] != 1);
    v16 = objc_msgSend(off_1E5DA9618, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 4, v9);
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 setTitleSubtitleLabelSpec:v16];

    v17 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 titleSubtitleLabelSpec];
    v18 = (void *)[v17 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 setDebugInterestingTitleSubtitleLabelSpec:v18];

    v19 = [MEMORY[0x1E4FB1618] greenColor];
    v20 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 debugInterestingTitleSubtitleLabelSpec];
    v21 = [v20 subtitleLabelSpec];
    [v21 setTextColor:v19];

    v22 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 titleSubtitleLabelSpec];
    v23 = (void *)[v22 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 setDebugNonInterestingTitleSubtitleLabelSpec:v23];

    v24 = [MEMORY[0x1E4FB1618] redColor];
    v25 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v9 debugNonInterestingTitleSubtitleLabelSpec];
    v26 = [v25 subtitleLabelSpec];
    [v26 setTextColor:v24];

    v27 = v9;
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v27 setWantsTitle:1];
    v28 = v27;

    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setWantsSubtitle:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setShouldAvoidOverlapWithSecondaryToolbar:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 curatedLibraryEdgeToEdgeContentDefaultPadding];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v28, "setContentPadding:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setWantsInlineHeader:0];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setRequiresTitleRenderedAsView:[(PXFeatureSpec *)v28 userInterfaceIdiom] == 4];
    BOOL v30 = v10 < 5 && v11 == 1;
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setInlineHeaderStyle:v30];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setShouldAccommodateLeadingButtonsLayout:1];
    v31 = +[PXPhotosGridSettings sharedInstance];
    [v31 headerGradientAlpha];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v28, "setGradientAlpha:");
    [v31 headerGradientHeight];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v28, "setGradientHeight:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v28 setGradientRespectsSafeArea:0];
  }
  return v9;
}

- (BOOL)showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:(BOOL)a3 selectButtonIsShown:(BOOL)a4
{
  return a4;
}

@end