@interface PXLabelSpec(CuratedLibrary)
+ (id)px_headerSubtitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:;
+ (id)px_headerTitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:;
@end

@implementation PXLabelSpec(CuratedLibrary)

+ (id)px_headerSubtitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init((Class)off_1E5DA6FD0);
  v7 = PXCuratedLibraryHeaderSubtitleFontForZoomLevel(a3, v5);
  [v6 setFont:v7];
  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setTextColor:v8];
  objc_msgSend(v6, "setTextAlignment:", objc_msgSend(v5, "localizedLeadingTextAlignment"));
  [v6 setVerticalAlignment:2];
  [v6 setCapitalization:0];
  [v6 setAdjustsFontSizeToFitWidth:0];
  uint64_t v9 = [v5 userInterfaceIdiom];

  objc_msgSend(v6, "setNumberOfLines:", _PXHeaderSubtitleNumberOfLinesForZoomLevel(a3, v9));
  [v6 setAllowTruncation:1];
  v10 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v11 = (void *)[v10 mutableCopy];

  objc_msgSend(v11, "setAlignment:", objc_msgSend(v6, "textAlignment"));
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  v15[0] = *MEMORY[0x1E4FB06F8];
  v15[1] = v12;
  v16[0] = v7;
  v16[1] = v8;
  v15[2] = *MEMORY[0x1E4FB0738];
  v16[2] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v6 setTextAttributes:v13];

  return v6;
}

+ (id)px_headerTitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init((Class)off_1E5DA6FD0);
  v7 = PXCuratedLibraryHeaderTitleFontForZoomLevel(a3, v5);
  [v6 setFont:v7];
  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setTextColor:v8];
  objc_msgSend(v6, "setTextAlignment:", objc_msgSend(v5, "localizedLeadingTextAlignment"));
  [v6 setVerticalAlignment:2];
  [v6 setCapitalization:0];
  [v6 setFallbackCapitalization:0];
  uint64_t v9 = [v5 userInterfaceIdiom];
  v10 = [v5 extendedTraitCollection];

  objc_msgSend(v6, "setNumberOfLines:", _PXHeaderTitleNumberOfLinesForZoomLevel(a3, v9, v10));
  [v6 setAllowTruncation:1];
  v11 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v12 = (void *)[v11 mutableCopy];

  objc_msgSend(v12, "setAlignment:", objc_msgSend(v6, "textAlignment"));
  uint64_t v13 = *MEMORY[0x1E4FB0700];
  v16[0] = *MEMORY[0x1E4FB06F8];
  v16[1] = v13;
  v17[0] = v7;
  v17[1] = v8;
  v16[2] = *MEMORY[0x1E4FB0738];
  v17[2] = v12;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v6 setTextAttributes:v14];

  return v6;
}

@end