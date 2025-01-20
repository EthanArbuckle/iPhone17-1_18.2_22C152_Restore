@interface PXYearAssetsSkimmingSectionHeaderLayoutSpec
- (PXYearAssetsSkimmingSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6;
@end

@implementation PXYearAssetsSkimmingSectionHeaderLayoutSpec

- (PXYearAssetsSkimmingSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6
{
  v37[3] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PXYearAssetsSkimmingSectionHeaderLayoutSpec;
  v6 = -[PXYearAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](&v32, sel_initWithExtendedTraitCollection_options_padding_variant_, a3, a4, 0, a5.top, a5.left, a5.bottom, a5.right);
  if (v6)
  {
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    id v8 = objc_alloc_init((Class)off_1E5DA6FD0);
    v31 = PXCuratedLibraryHeaderTitleFontForZoomLevel(1, v6);
    objc_msgSend(v8, "setFont:");
    [v8 setTextColor:v7];
    objc_msgSend(v8, "setTextAlignment:", -[PXFeatureSpec localizedLeadingTextAlignment](v6, "localizedLeadingTextAlignment"));
    [v8 setVerticalAlignment:2];
    [v8 setCapitalization:0];
    [v8 setFallbackCapitalization:0];
    [v8 setNumberOfLines:1];
    v9 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v10 = (void *)[v9 mutableCopy];

    objc_msgSend(v10, "setAlignment:", objc_msgSend(v8, "textAlignment"));
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v35[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v11 = v35[0];
    v35[1] = v12;
    v37[0] = v31;
    v37[1] = v7;
    uint64_t v36 = *MEMORY[0x1E4FB0738];
    uint64_t v13 = v36;
    v37[2] = v10;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v35 count:3];
    [v8 setTextAttributes:v30];
    id v14 = objc_alloc_init((Class)off_1E5DA6FD0);
    v15 = PXCuratedLibraryHeaderSubtitleFontForZoomLevel(1, v6);
    [v14 setFont:v15];
    v16 = [v7 colorWithAlphaComponent:0.800000012];
    [v14 setTextColor:v16];

    objc_msgSend(v14, "setTextAlignment:", -[PXFeatureSpec localizedLeadingTextAlignment](v6, "localizedLeadingTextAlignment"));
    [v14 setVerticalAlignment:2];
    [v14 setCapitalization:2];
    [v14 setNumberOfLines:2];
    v33[0] = v11;
    v33[1] = v12;
    v34[0] = v15;
    v34[1] = v7;
    v33[2] = v13;
    v34[2] = v10;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    [v14 setTextAttributes:v17];
    id v18 = objc_alloc_init((Class)off_1E5DA9618);
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setTitleSubtitleLabelSpec:v18];

    v19 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 titleSubtitleLabelSpec];
    [v19 setTitleLabelSpec:v8];

    v20 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 titleSubtitleLabelSpec];
    [v20 setSubtitleLabelSpec:v14];

    if ([(PXFeatureSpec *)v6 sizeClass] == 1) {
      double v21 = 23.0;
    }
    else {
      double v21 = 26.0;
    }
    v22 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 titleSubtitleLabelSpec];
    [v22 setDistanceBetweenTitleBaselineAndSubtitleBaseline:v21];

    id v23 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v24 = [MEMORY[0x1E4F1CA20] currentLocale];
    v25 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"yyyy" options:0 locale:v24];
    [v23 setDateFormat:v25];

    v26 = (void *)[v23 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setTitleDateFormatter:v26];

    v27 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"MMMM" options:0 locale:v24];
    [v23 setDateFormat:v27];

    v28 = (void *)[v23 copy];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setSubtitleDateFormatter:v28];
  }
  return v6;
}

@end