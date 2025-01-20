@interface UIFont(VideosUI)
+ (char)uifontWeightFromFontWeight:()VideosUI;
+ (id)_fontFromTextStyle:()VideosUI maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:fontFeature:;
+ (id)_uiFontAttributesForFeature:()VideosUI;
+ (id)uiFontTextStyleFromTextStyle:()VideosUI;
+ (id)vui_fontFromTextLayout:()VideosUI;
+ (uint64_t)vui_fontFromTextStyle:()VideosUI fontWeight:fontSize:symbolicTraits:;
- (uint64_t)baselineHeight;
- (uint64_t)bottomMarginWithBaselineMargin:()VideosUI traitCollection:;
- (uint64_t)topMarginToFont:()VideosUI withBaselineMargin:traitCollection:;
- (uint64_t)topMarginWithBaselineMargin:()VideosUI traitCollection:;
@end

@implementation UIFont(VideosUI)

+ (id)vui_fontFromTextLayout:()VideosUI
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 textStyle];
  uint64_t v5 = [v3 maximumContentSizeCategory];
  v6 = [MEMORY[0x1E4FB3C70] uiContentSizeCategoryFor:v5];
  uint64_t v7 = [v3 fontWeight];
  [v3 fontSize];
  double v9 = v8;
  uint64_t v10 = [v3 fontTraits];
  v11 = objc_msgSend((id)objc_opt_class(), "_fontFromTextStyle:maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:fontFeature:", v4, v6, v7, v10, objc_msgSend(v3, "fontFeature"), v9);
  if (v11) {
    goto LABEL_24;
  }
  v12 = [v3 fontFamily];
  v13 = [(id)objc_opt_class() uifontWeightFromFontWeight:v7];
  [v13 floatValue];
  float v15 = v14;
  if (v9 <= 0.0)
  {
    [MEMORY[0x1E4FB08E0] systemFontSize];
    double v9 = v16;
  }
  double v17 = v15;
  if ([v12 length] && objc_msgSend(v12, "isEqualToString:", @"SFRounded"))
  {
    v18 = (void *)MEMORY[0x1E4FB08E0];
    v19 = @"NSCTFontUIFontDesignRounded";
LABEL_14:
    v21 = [v18 systemFontOfSize:v19 weight:v9 design:v17];
    v22 = [v21 fontDescriptor];
    goto LABEL_15;
  }
  if ([v12 length] && objc_msgSend(v12, "isEqualToString:", @"SFCompactRounded"))
  {
    v18 = (void *)MEMORY[0x1E4FB08E0];
    v20 = (__CFString **)MEMORY[0x1E4F24630];
LABEL_13:
    v19 = *v20;
    goto LABEL_14;
  }
  if ([v12 length] && objc_msgSend(v12, "isEqualToString:", @"SFPro"))
  {
    v18 = (void *)MEMORY[0x1E4FB08E0];
    v20 = (__CFString **)MEMORY[0x1E4F24640];
    goto LABEL_13;
  }
  if (![v12 length]) {
    goto LABEL_32;
  }
  if (v13 && *MEMORY[0x1E4FB09D8] != v17)
  {
    id v27 = objc_alloc(MEMORY[0x1E4FB08E8]);
    uint64_t v28 = *MEMORY[0x1E4FB0950];
    v32 = v13;
    v33[0] = v28;
    uint64_t v31 = *MEMORY[0x1E4FB09F0];
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v33[1] = *MEMORY[0x1E4FB0908];
    v34[0] = v21;
    v34[1] = v12;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    v22 = (void *)[v27 initWithFontAttributes:v29];

LABEL_15:
    if (v22) {
      goto LABEL_16;
    }
LABEL_32:
    v30 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v9 weight:v17];
    v22 = [v30 fontDescriptor];

    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v22 = [MEMORY[0x1E4FB08E8] fontDescriptorWithName:v12 size:v9];
  if (!v22) {
    goto LABEL_32;
  }
LABEL_16:
  if (v10)
  {
LABEL_17:
    uint64_t v23 = objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v22, "symbolicTraits") | v10);

    v22 = (void *)v23;
  }
LABEL_18:
  v24 = objc_msgSend((id)objc_opt_class(), "_uiFontAttributesForFeature:", objc_msgSend(v3, "fontFeature"));
  if (v24)
  {
    uint64_t v25 = [v22 fontDescriptorByAddingAttributes:v24];

    v22 = (void *)v25;
  }
  if (v22)
  {
    v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v22 size:v9];
  }
  else
  {
    v11 = 0;
  }

LABEL_24:
  return v11;
}

+ (id)_fontFromTextStyle:()VideosUI maximumContentSizeCategory:fontWeight:fontSize:symbolicTraits:fontFeature:
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  float v15 = [a1 uiFontTextStyleFromTextStyle:a4];
  double v16 = v15;
  if (a4 == 24 || a4 == 18)
  {
    if ([v15 length])
    {
      double v17 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v16 variant:256 maximumContentSizeCategory:v14];
      goto LABEL_7;
    }
LABEL_23:
    v18 = 0;
    goto LABEL_24;
  }
  if (![v15 length]) {
    goto LABEL_23;
  }
  double v17 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v16 maximumContentSizeCategory:v14];
LABEL_7:
  v18 = v17;
  if (!v17)
  {
LABEL_24:
    v32 = 0;
    goto LABEL_27;
  }
  v19 = [v17 fontDescriptor];
  uint64_t v20 = [(id)objc_opt_class() uifontWeightFromFontWeight:a6];
  v21 = (void *)v20;
  if (v20 && v19)
  {
    v35 = (void *)v20;
    uint64_t v22 = *MEMORY[0x1E4FB0950];
    [v19 objectForKey:*MEMORY[0x1E4FB0950]];
    uint64_t v23 = v34 = a8;
    v24 = (void *)[v23 mutableCopy];

    [v24 setObject:v35 forKey:*MEMORY[0x1E4FB09F0]];
    uint64_t v36 = v22;
    v37[0] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v26 = [v19 fontDescriptorByAddingAttributes:v25];

    a8 = v34;
    v19 = (void *)v26;
    v21 = v35;
  }
  int v27 = a7 | 2;
  if (a6 != 10) {
    int v27 = a7;
  }
  if (a8 == 3) {
    int v28 = v27 | 0x8000;
  }
  else {
    int v28 = v27;
  }
  if (v28 && v19)
  {
    uint64_t v29 = objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v19, "symbolicTraits") | v28);

    v19 = (void *)v29;
  }
  v30 = [(id)objc_opt_class() _uiFontAttributesForFeature:a8];
  if (v30)
  {
    uint64_t v31 = [v19 fontDescriptorByAddingAttributes:v30];

    v19 = (void *)v31;
  }
  if (v19)
  {
    v32 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v19 size:a2];
  }
  else
  {
    v32 = 0;
  }

LABEL_27:
  return v32;
}

+ (char)uifontWeightFromFontWeight:()VideosUI
{
  if (uifontWeightFromFontWeight__onceToken != -1) {
    dispatch_once(&uifontWeightFromFontWeight__onceToken, &__block_literal_global_13);
  }
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  if ((unint64_t)(a3 - 10) <= 0xFFFFFFFFFFFFFFFDLL && IsBoldTextEnabled)
  {
    a3 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09B8]];
  }
  else if (a3)
  {
    uint64_t v5 = (void *)uifontWeightFromFontWeight__sFontWeightMap;
    v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    a3 = [v5 objectForKeyedSubscript:v6];
  }
  return a3;
}

+ (id)uiFontTextStyleFromTextStyle:()VideosUI
{
  if (uiFontTextStyleFromTextStyle__onceToken != -1) {
    dispatch_once(&uiFontTextStyleFromTextStyle__onceToken, &__block_literal_global_30);
  }
  if (a3 == -1)
  {
    v6 = 0;
  }
  else
  {
    uint64_t v4 = (void *)uiFontTextStyleFromTextStyle__sTextStyleMap;
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    v6 = [v4 objectForKeyedSubscript:v5];
  }
  return v6;
}

+ (id)_uiFontAttributesForFeature:()VideosUI
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    uint64_t v18 = *MEMORY[0x1E4FB0910];
    uint64_t v5 = *MEMORY[0x1E4FB0960];
    v15[0] = *MEMORY[0x1E4FB0968];
    uint64_t v4 = v15[0];
    v15[1] = v5;
    v16[0] = &unk_1F3F3C4B8;
    v6 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
    v16[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v17[0] = v7;
    v13[1] = v5;
    v14[0] = &unk_1F3F3C4D0;
    v13[0] = v4;
    double v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
    v14[1] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v19[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (uint64_t)vui_fontFromTextStyle:()VideosUI fontWeight:fontSize:symbolicTraits:
{
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = *MEMORY[0x1E4FB27F0];
  return [v10 _fontFromTextStyle:a4 maximumContentSizeCategory:v11 fontWeight:a5 fontSize:a6 symbolicTraits:0 fontFeature:a1];
}

- (uint64_t)baselineHeight
{
  [a1 ascender];
  return VUIRoundValue();
}

- (uint64_t)topMarginWithBaselineMargin:()VideosUI traitCollection:
{
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:");
  [a1 ascender];
  return VUIRoundValue();
}

- (uint64_t)bottomMarginWithBaselineMargin:()VideosUI traitCollection:
{
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:");
  [a1 descender];
  return VUIRoundValue();
}

- (uint64_t)topMarginToFont:()VideosUI withBaselineMargin:traitCollection:
{
  id v8 = a4;
  +[VUIUtilities scaleContentSizeValue:a5 forTraitCollection:a2];
  [a1 ascender];
  [v8 descender];

  return VUIRoundValue();
}

@end