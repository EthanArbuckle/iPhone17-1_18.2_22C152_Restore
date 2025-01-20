@interface UIFont(IC)
+ (double)ic_fontSizeForHeaderImport;
+ (double)ic_fontSizeForSubheaderImport;
+ (double)ic_pointSizeForBodyTextWithContentSizeCategory:()IC;
+ (double)ic_pointSizeForTextStyle:()IC contentSizeCategory:;
+ (double)ic_preferredFontSizeWithBaseSize:()IC withContentSizeCategory:minSize:maxSize:;
+ (id)ic_attachmentBrowserSeeAllButtonFont;
+ (id)ic_attachmentBrowserTitleFont;
+ (id)ic_fontDescriptorForBodyTextWithContentSizeCategory:()IC useSingleLineA:bold:;
+ (id)ic_gridViewNoteSubtitleFont;
+ (id)ic_gridViewNoteTitleFont;
+ (id)ic_gridViewSectionTitleFont;
+ (id)ic_groupInsetHeaderFont;
+ (id)ic_listViewDetailFont;
+ (id)ic_listViewTitleFont;
+ (id)ic_navBarButtonFontUsingSingleLineA:()IC;
+ (id)ic_preferredFontForBodyTextWithContentSizeCategory:()IC isForPrint:;
+ (id)ic_preferredFontForBodyTextWithContentSizeCategory:()IC useSingleLineA:;
+ (id)ic_preferredFontForBodyTextWithMaximumContentSizeCategory:()IC;
+ (id)ic_preferredFontForCompatibilityBannerText;
+ (id)ic_preferredFontForDateTextWithZoomFactor:()IC;
+ (id)ic_preferredFontForHeadingTextWithContentSizeCategory:()IC isForPrint:;
+ (id)ic_preferredFontForStyle:()IC contentSizeCategory:isForPrint:;
+ (id)ic_preferredFontForStyle:()IC symbolicTraits:;
+ (id)ic_preferredFontForStyle:()IC symbolicTraits:maxContentSizeCategory:;
+ (id)ic_preferredFontForStyle:()IC withFontWeight:maxContentSizeCategory:;
+ (id)ic_preferredFontForSubheadingTextWithContentSizeCategory:()IC isForPrint:;
+ (id)ic_preferredFontForTextStyle:()IC adjustedForDefaultSize:maxSize:;
+ (id)ic_preferredFontForTextStyle:()IC maxContentSizeCategory:;
+ (id)ic_preferredFontForTitleTextWithContentSizeCategory:()IC isForPrint:isReducedSize:;
+ (id)ic_preferredSingleLineAFontForTextStyle:()IC;
+ (id)ic_preferredSystemFontWithBaseSize:()IC withContentSizeCategory:minSize:;
+ (id)ic_recentlyDeletedHeaderFont;
+ (uint64_t)ic_preferredFontForBodyText;
+ (uint64_t)ic_preferredFontForBodyTextWithContentSizeCategory:()IC;
+ (uint64_t)ic_preferredFontForDateText;
+ (uint64_t)ic_preferredFontForFixedWidthText;
+ (uint64_t)ic_preferredFontForFixedWidthTextWithContentSizeCategory:()IC;
+ (uint64_t)ic_preferredFontForHeadingText;
+ (uint64_t)ic_preferredFontForHeadingTextWithContentSizeCategory:()IC;
+ (uint64_t)ic_preferredFontForStyle:()IC withFontWeight:;
+ (uint64_t)ic_preferredFontForSubheadingText;
+ (uint64_t)ic_preferredFontForSubheadingTextWithContentSizeCategory:()IC;
+ (uint64_t)ic_preferredFontForTextStyle:()IC adjustedForDefaultSize:;
+ (uint64_t)ic_preferredFontForTitleText;
+ (uint64_t)ic_preferredFontForTitleTextWithContentSizeCategory:()IC;
+ (uint64_t)ic_preferredFontForTitleTextWithContentSizeCategory:()IC isForPrint:;
- (BOOL)ic_hasSymbolicTrait:()IC;
- (id)ic_fontByAddingSymbolicTraits:()IC;
- (id)ic_fontConvertedToSize:()IC;
- (id)ic_fontWithRoundedDesign;
- (id)ic_fontWithSingleLineA;
- (id)ic_fontWithTabularNumbers;
- (id)ic_fontWithoutSingleLineA;
- (uint64_t)ic_fontHasSingleLineA;
- (uint64_t)ic_fontWithSymbolicBoldTrait;
- (uint64_t)ic_hasSymbolicBoldTrait;
- (uint64_t)ic_hasSymbolicItalicTrait;
@end

@implementation UIFont(IC)

+ (id)ic_preferredFontForBodyTextWithContentSizeCategory:()IC isForPrint:
{
  v5 = objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 0);
  double v6 = 0.0;
  if (a4) {
    double v6 = 12.0;
  }
  v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:v6];

  return v7;
}

+ (id)ic_fontDescriptorForBodyTextWithContentSizeCategory:()IC useSingleLineA:bold:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = CTFontDescriptorCreateWithTextStyle();
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  v9 = (void *)v8;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a4)
  {
    uint64_t v27 = *MEMORY[0x1E4FB0910];
    uint64_t v11 = *MEMORY[0x1E4FB0960];
    v24[0] = *MEMORY[0x1E4FB0968];
    v24[1] = v11;
    v25[0] = &unk_1F09A4268;
    v25[1] = &unk_1F09A4280;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v26 = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v28[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    [v10 addEntriesFromDictionary:v14];
  }
  if (a5)
  {
    uint64_t v22 = *MEMORY[0x1E4FB0950];
    v15 = objc_msgSend(NSNumber, "numberWithDouble:", *MEMORY[0x1E4FB09B8], *MEMORY[0x1E4FB0958], *MEMORY[0x1E4FB09F0], *MEMORY[0x1E4FB0988]);
    v21[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:2];
    v23 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v10 addEntriesFromDictionary:v17];
  }
  if ([v10 count])
  {
    uint64_t v18 = [v9 fontDescriptorByAddingAttributes:v10];

    v9 = (void *)v18;
  }

  return v9;
}

+ (id)ic_preferredFontForTitleTextWithContentSizeCategory:()IC isForPrint:isReducedSize:
{
  id v7 = objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 1);
  [v7 pointSize];
  if ((a4 & 1) == 0)
  {
    if (a5) {
      double v9 = 1.41176471;
    }
    else {
      double v9 = 1.64705882;
    }
    double v8 = round(v8 * v9);
  }
  id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:v8];

  return v10;
}

+ (id)ic_preferredFontForHeadingTextWithContentSizeCategory:()IC isForPrint:
{
  v5 = objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 1);
  [v5 pointSize];
  double v7 = round(v6 * 1.29411765);
  if (a4) {
    double v7 = 14.0;
  }
  double v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:v7];

  return v8;
}

+ (id)ic_preferredFontForTextStyle:()IC adjustedForDefaultSize:maxSize:
{
  id v7 = a5;
  double v8 = (void *)CTFontDescriptorCreateWithTextStyle();
  [v8 pointSize];
  double v10 = a1 - v9;
  uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];

  [v11 pointSize];
  double v13 = v10 + v12;
  if (v13 >= a2) {
    double v13 = a2;
  }
  v14 = [v11 fontWithSize:ceil(v13)];

  return v14;
}

+ (uint64_t)ic_preferredFontForStyle:()IC withFontWeight:
{
  return objc_msgSend(a1, "ic_preferredFontForStyle:withFontWeight:maxContentSizeCategory:", a3, *MEMORY[0x1E4FB2778]);
}

+ (id)ic_preferredFontForStyle:()IC withFontWeight:maxContentSizeCategory:
{
  double v6 = (void *)MEMORY[0x1E4FB08E8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 preferredFontDescriptorWithTextStyle:v8];
  objc_msgSend(a1, "ic_pointSizeForTextStyle:contentSizeCategory:", v8, v7);
  double v11 = v10;

  double v12 = (void *)MEMORY[0x1E4FB08E0];
  [v9 pointSize];
  double v13 = objc_msgSend(v12, "systemFontOfSize:weight:");
  v14 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:v8];

  v15 = [v14 scaledFontForFont:v13 maximumPointSize:v11];

  return v15;
}

+ (id)ic_preferredFontForTextStyle:()IC maxContentSizeCategory:
{
  double v6 = (void *)MEMORY[0x1E4FB17A8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 defaultMetrics];
  objc_msgSend(a1, "ic_pointSizeForTextStyle:contentSizeCategory:", v8, v7);
  double v11 = v10;

  double v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v8];

  double v13 = [v9 scaledFontForFont:v12 maximumPointSize:v11];

  return v13;
}

+ (double)ic_pointSizeForTextStyle:()IC contentSizeCategory:
{
  if (a3 && a4)
  {
    v4 = (void *)CTFontDescriptorCreateWithTextStyle();
  }
  else
  {
    v4 = [(id)objc_opt_class() preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  v5 = v4;
  [v4 pointSize];
  double v7 = v6;

  return v7;
}

+ (uint64_t)ic_preferredFontForDateText
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForDateTextWithZoomFactor:", 1.0);
}

+ (id)ic_preferredFontForStyle:()IC symbolicTraits:
{
  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
  double v6 = objc_msgSend(v5, "ic_fontByAddingSymbolicTraits:", a4);

  return v6;
}

- (id)ic_fontByAddingSymbolicTraits:()IC
{
  v5 = [a1 fontDescriptor];
  double v6 = [v5 fontDescriptorWithSymbolicTraits:a3];

  double v7 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  id v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

+ (id)ic_preferredFontForDateTextWithZoomFactor:()IC
{
  v2 = [(id)objc_opt_class() preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  v5 = [v3 systemFontOfSize:round(v4 * 0.882352941 * a1)];
  double v6 = objc_msgSend(v5, "ic_fontWithSingleLineA");

  return v6;
}

- (id)ic_fontWithSingleLineA
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (ic_fontWithSingleLineA_onceToken != -1) {
    dispatch_once(&ic_fontWithSingleLineA_onceToken, &__block_literal_global_27);
  }
  v2 = [[ICFontCacheKey alloc] initWithFont:a1];
  if (objc_msgSend(a1, "ic_fontHasSingleLineA"))
  {
    id v3 = a1;
  }
  else
  {
    id v3 = [(id)ic_fontWithSingleLineA_singleLineACache objectForKey:v2];
  }
  id v4 = v3;
  if (!v3)
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v6 = [v5 BOOLForKey:*MEMORY[0x1E4F83830]];

    if (v6)
    {
      id v4 = a1;
      if (v4) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4FB0910];
      uint64_t v7 = *MEMORY[0x1E4FB0960];
      v14[0] = *MEMORY[0x1E4FB0968];
      v14[1] = v7;
      v15[0] = &unk_1F09A4268;
      v15[1] = &unk_1F09A4280;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      v16 = v8;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      v18[0] = v9;
      double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

      double v11 = [a1 fontDescriptor];
      double v12 = [v11 fontDescriptorByAddingAttributes:v10];

      id v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:0.0];
      [(id)ic_fontWithSingleLineA_singleLineACache setObject:v4 forKey:v2];

      if (v4) {
        goto LABEL_12;
      }
    }
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((singleLineAFont) != nil)", "-[UIFont(IC) ic_fontWithSingleLineA]", 1, 0, @"Expected non-nil value for '%s'", "singleLineAFont");
  }
LABEL_12:

  return v4;
}

- (uint64_t)ic_fontHasSingleLineA
{
  return MEMORY[0x1F40DF5E8](a1, 35, 14);
}

- (id)ic_fontWithoutSingleLineA
{
  id v1 = a1;
  if (objc_msgSend(v1, "ic_fontHasSingleLineA"))
  {
    v2 = [v1 fontDescriptor];
    id v3 = [v2 fontAttributes];
    id v4 = (void *)[v3 mutableCopy];

    [v4 removeObjectForKey:*MEMORY[0x1E4FB0910]];
    v5 = [MEMORY[0x1E4FB08E8] fontDescriptorWithFontAttributes:v4];
    uint64_t v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];

    id v1 = (id)v6;
  }
  return v1;
}

+ (id)ic_preferredSingleLineAFontForTextStyle:()IC
{
  id v1 = objc_msgSend(a1, "preferredFontForTextStyle:");
  v2 = objc_msgSend(v1, "ic_fontWithSingleLineA");

  return v2;
}

- (id)ic_fontWithTabularNumbers
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v1 = [a1 fontDescriptor];
  uint64_t v12 = *MEMORY[0x1E4FB0910];
  uint64_t v2 = *MEMORY[0x1E4FB0960];
  v9[0] = *MEMORY[0x1E4FB0968];
  v9[1] = v2;
  v10[0] = &unk_1F09A4298;
  v10[1] = &unk_1F09A42B0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  double v11 = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v6 = [v1 fontDescriptorByAddingAttributes:v5];

  uint64_t v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (id)ic_fontConvertedToSize:()IC
{
  int v4 = objc_msgSend(a1, "ic_fontHasSingleLineA");
  v5 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v6 = [a1 fontDescriptor];
  uint64_t v7 = [v5 fontWithDescriptor:v6 size:a2];

  if (v4)
  {
    uint64_t v8 = objc_msgSend(v7, "ic_fontWithSingleLineA");

    uint64_t v7 = (void *)v8;
  }
  return v7;
}

+ (uint64_t)ic_preferredFontForTitleText
{
  return objc_msgSend(a1, "ic_preferredFontForTitleTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForHeadingText
{
  return objc_msgSend(a1, "ic_preferredFontForHeadingTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForSubheadingText
{
  return objc_msgSend(a1, "ic_preferredFontForSubheadingTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForBodyText
{
  return objc_msgSend(a1, "ic_preferredFontForBodyTextWithContentSizeCategory:", 0);
}

+ (uint64_t)ic_preferredFontForFixedWidthText
{
  return objc_msgSend(a1, "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", 0);
}

+ (id)ic_preferredFontForCompatibilityBannerText
{
  v0 = [(id)objc_opt_class() preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  id v3 = [v1 systemFontOfSize:round(v2 * 0.882352941)];

  return v3;
}

+ (id)ic_preferredFontForStyle:()IC symbolicTraits:maxContentSizeCategory:
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForTextStyle:maxContentSizeCategory:", a3, a5);
  uint64_t v7 = objc_msgSend(v6, "ic_fontByAddingSymbolicTraits:", a4);

  return v7;
}

+ (id)ic_listViewTitleFont
{
  v0 = [(id)objc_opt_class() preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  id v1 = objc_msgSend(v0, "ic_fontWithSingleLineA");

  return v1;
}

+ (id)ic_listViewDetailFont
{
  v0 = [(id)objc_opt_class() preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
  id v1 = objc_msgSend(v0, "ic_fontWithSingleLineA");

  return v1;
}

+ (id)ic_attachmentBrowserTitleFont
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998] addingSymbolicTraits:2 options:0];
  id v1 = [(id)objc_opt_class() fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)ic_attachmentBrowserSeeAllButtonFont
{
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v1 = objc_msgSend(v0, "ic_fontWithSingleLineA");

  return v1;
}

+ (id)ic_gridViewSectionTitleFont
{
  v0 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09E0]];
  id v1 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  double v2 = [v1 scaledFontForFont:v0];

  id v3 = objc_msgSend(v2, "ic_fontWithSingleLineA");

  return v3;
}

+ (id)ic_gridViewNoteTitleFont
{
  v0 = [(id)objc_opt_class() systemFontOfSize:15.0];
  id v1 = objc_msgSend(v0, "ic_fontWithSingleLineA");

  double v2 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  id v3 = [v2 scaledFontForFont:v1];

  return v3;
}

+ (id)ic_gridViewNoteSubtitleFont
{
  v0 = [(id)objc_opt_class() systemFontOfSize:12.0];
  id v1 = objc_msgSend(v0, "ic_fontWithSingleLineA");

  double v2 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  id v3 = [v2 scaledFontForFont:v1];

  return v3;
}

+ (id)ic_groupInsetHeaderFont
{
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  id v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  double v2 = objc_msgSend(v1, "systemFontOfSize:weight:");
  id v3 = objc_msgSend(v2, "ic_fontWithSingleLineA");

  return v3;
}

+ (id)ic_navBarButtonFontUsingSingleLineA:()IC
{
  int v4 = [(id)objc_opt_class() systemFontOfSize:17.0];
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "ic_fontWithSingleLineA");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

+ (id)ic_recentlyDeletedHeaderFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  id v1 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  double v2 = objc_msgSend(v0, "ic_preferredSystemFontWithBaseSize:withContentSizeCategory:minSize:", v1, 13.0, 13.0);

  id v3 = objc_msgSend(v2, "ic_fontWithSingleLineA");

  return v3;
}

+ (double)ic_pointSizeForBodyTextWithContentSizeCategory:()IC
{
  id v3 = objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 0, 0);
  [v3 pointSize];
  double v5 = v4;

  return v5;
}

+ (uint64_t)ic_preferredFontForTitleTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (uint64_t)ic_preferredFontForTitleTextWithContentSizeCategory:()IC isForPrint:
{
  return objc_msgSend(a1, "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:isReducedSize:", a3, a4, 0);
}

+ (uint64_t)ic_preferredFontForHeadingTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForHeadingTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (uint64_t)ic_preferredFontForSubheadingTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForSubheadingTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (id)ic_preferredFontForSubheadingTextWithContentSizeCategory:()IC isForPrint:
{
  double v5 = objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, 1, 1);
  double v6 = 0.0;
  if (a4) {
    double v6 = 12.0;
  }
  uint64_t v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:v6];

  return v7;
}

+ (uint64_t)ic_preferredFontForBodyTextWithContentSizeCategory:()IC
{
  return objc_msgSend(a1, "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", a3, 0);
}

+ (id)ic_preferredFontForBodyTextWithContentSizeCategory:()IC useSingleLineA:
{
  double v4 = objc_msgSend(a1, "ic_fontDescriptorForBodyTextWithContentSizeCategory:useSingleLineA:bold:", a3, a4, 0);
  double v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)ic_preferredFontForBodyTextWithMaximumContentSizeCategory:()IC
{
  double v4 = ICContentSizeCategoryMinSystemPreferenceAnd(a3);
  objc_msgSend(a1, "ic_pointSizeForBodyTextWithContentSizeCategory:", v4);
  double v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");

  return v5;
}

+ (uint64_t)ic_preferredFontForFixedWidthTextWithContentSizeCategory:()IC
{
  objc_msgSend(a1, "ic_pointSizeForBodyTextWithContentSizeCategory:");
  double v2 = v1 * 0.882352941;
  id v3 = (void *)MEMORY[0x1E4FB08E0];
  double v4 = *MEMORY[0x1E4FB09D8];
  return [v3 monospacedSystemFontOfSize:v2 weight:v4];
}

+ (double)ic_fontSizeForHeaderImport
{
  double v1 = objc_msgSend(a1, "ic_preferredFontForSubheadingText");
  [v1 pointSize];
  double v3 = v2;

  return v3;
}

+ (double)ic_fontSizeForSubheaderImport
{
  double v1 = objc_msgSend(a1, "ic_preferredFontForBodyText");
  [v1 pointSize];
  double v3 = v2;

  return v3;
}

+ (uint64_t)ic_preferredFontForTextStyle:()IC adjustedForDefaultSize:
{
  return objc_msgSend(a1, "ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", a3, 1.79769313e308);
}

+ (id)ic_preferredSystemFontWithBaseSize:()IC withContentSizeCategory:minSize:
{
  objc_msgSend(a1, "ic_preferredFontSizeWithBaseSize:withContentSizeCategory:minSize:maxSize:", a2, a3, a2 * 1.8);
  double v5 = v4;
  double v6 = [(id)objc_opt_class() systemFontOfSize:a2];
  uint64_t v7 = [v6 fontWithSize:v5];

  return v7;
}

+ (double)ic_preferredFontSizeWithBaseSize:()IC withContentSizeCategory:minSize:maxSize:
{
  id v9 = a6;
  double v10 = (void *)*MEMORY[0x1E4FB27D0];
  if (([v9 isEqualToString:*MEMORY[0x1E4FB27D0]] & 1) == 0)
  {
    double v11 = ICContentSizeCategories();
    unint64_t v12 = [v11 indexOfObject:v9];
    unint64_t v13 = [v11 indexOfObject:v10];
    BOOL v14 = v12 >= v13;
    if (v12 >= v13) {
      double v15 = a3 - a1;
    }
    else {
      double v15 = a1 - a2;
    }
    v16 = (void **)MEMORY[0x1E4FB27C8];
    if (v12 >= v13) {
      v16 = (void **)MEMORY[0x1E4FB27C0];
    }
    uint64_t v17 = *v16;
    uint64_t v18 = (void **)MEMORY[0x1E4FB27D8];
    if (v14) {
      uint64_t v18 = (void **)MEMORY[0x1E4FB2778];
    }
    double v19 = v15 / (double)ICContentSizeCategoryStepsBetweenCategories(v17, *v18);
    float v20 = a1 + v19 * (double)ICContentSizeCategoryStepsBetweenCategories(v10, v9);
    a1 = roundf(v20);
  }
  return a1;
}

- (uint64_t)ic_hasSymbolicBoldTrait
{
  return objc_msgSend(a1, "ic_hasSymbolicTrait:", 2);
}

- (uint64_t)ic_hasSymbolicItalicTrait
{
  return objc_msgSend(a1, "ic_hasSymbolicTrait:", 1);
}

- (BOOL)ic_hasSymbolicTrait:()IC
{
  double v4 = [a1 fontDescriptor];
  int v5 = [v4 symbolicTraits];

  return (v5 & a3) != 0;
}

- (uint64_t)ic_fontWithSymbolicBoldTrait
{
  return objc_msgSend(a1, "ic_fontByAddingSymbolicTraits:", 2);
}

- (id)ic_fontWithRoundedDesign
{
  double v1 = [a1 fontDescriptor];
  double v2 = [v1 fontDescriptorWithDesign:*MEMORY[0x1E4FB0938]];

  double v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)ic_preferredFontForStyle:()IC contentSizeCategory:isForPrint:
{
  id v7 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:", v7, a5);
      goto LABEL_5;
    case 1:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForHeadingTextWithContentSizeCategory:isForPrint:", v7, a5);
      goto LABEL_5;
    case 2:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForSubheadingTextWithContentSizeCategory:isForPrint:", v7, a5);
      goto LABEL_5;
    case 3:
    case 5:
      goto LABEL_4;
    case 4:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", v7);
      goto LABEL_5;
    default:
      if ((a3 - 100) >= 4) {
        goto LABEL_6;
      }
LABEL_4:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v7, a5);
LABEL_5:
      id v9 = (void *)v8;
      if (!v8)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((result) != nil)", "+[UIFont(IC) ic_preferredFontForStyle:contentSizeCategory:isForPrint:]", 1, 0, @"Expected non-nil value for '%s'", "result");
        id v9 = 0;
      }

      return v9;
  }
}

@end