@interface UIFont(TipsUIAdditions)
+ (id)TPSFontTallScript;
+ (id)TPSFontTallScriptSpecialCaseLanguageCodeTallScript;
+ (id)tps_preferredFontForTextStyle:()TipsUIAdditions symoblicTraits:weight:size:languageCode:;
+ (uint64_t)tps_fontWithSize:()TipsUIAdditions weight:languageCode:;
+ (uint64_t)tps_preferredFontForTextStyle:()TipsUIAdditions symoblicTraits:languageCode:;
@end

@implementation UIFont(TipsUIAdditions)

+ (id)TPSFontTallScript
{
  if (TPSFontTallScript_predicate[0] != -1) {
    dispatch_once(TPSFontTallScript_predicate, &__block_literal_global_3);
  }
  v0 = (void *)TPSFontTallScript_gTPSFontTallScript;

  return v0;
}

+ (id)TPSFontTallScriptSpecialCaseLanguageCodeTallScript
{
  if (TPSFontTallScriptSpecialCaseLanguageCodeTallScript_predicate != -1) {
    dispatch_once(&TPSFontTallScriptSpecialCaseLanguageCodeTallScript_predicate, &__block_literal_global_51);
  }
  v0 = (void *)TPSFontTallScriptSpecialCaseLanguageCodeTallScript_gTPSFontTallScriptSpecialCaseLanguageCodeTallScript;

  return v0;
}

+ (uint64_t)tps_fontWithSize:()TipsUIAdditions weight:languageCode:
{
  return objc_msgSend(a1, "tps_preferredFontForTextStyle:symoblicTraits:weight:size:languageCode:", *MEMORY[0x263F83570], 0, a3, a5, a4);
}

+ (uint64_t)tps_preferredFontForTextStyle:()TipsUIAdditions symoblicTraits:languageCode:
{
  return objc_msgSend(a1, "tps_preferredFontForTextStyle:symoblicTraits:weight:size:languageCode:", *MEMORY[0x263F81838], 0.0);
}

+ (id)tps_preferredFontForTextStyle:()TipsUIAdditions symoblicTraits:weight:size:languageCode:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a7;
  v13 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a5 addingSymbolicTraits:a6 options:0];
  v14 = [v13 fontAttributes];
  v15 = (void *)[v14 mutableCopy];

  if (v12
    || (objc_msgSend(MEMORY[0x263EFF960], "tps_userPreferredLocalizations"),
        v16 = objc_claimAutoreleasedReturnValue(),
        [v16 firstObject],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v16,
        v12))
  {
    v17 = [a1 TPSFontTallScriptSpecialCaseLanguageCodeTallScript];
    char v18 = [v17 containsObject:v12];

    if (v18)
    {
      float v19 = 0.33;
    }
    else
    {
      id v12 = v12;
      [v12 UTF8String];
      uloc_addLikelySubtags();
      v20 = (void *)MEMORY[0x263EFF960];
      v21 = [NSString stringWithUTF8String:v35];
      v22 = [v20 componentsFromLocaleIdentifier:v21];

      v23 = [a1 TPSFontTallScript];
      v24 = [v22 objectForKeyedSubscript:*MEMORY[0x263EFFCF8]];
      if ([v23 containsObject:v24]) {
        float v19 = 0.33;
      }
      else {
        float v19 = 0.0;
      }
    }
  }
  else
  {
    float v19 = 0.0;
  }
  double v25 = *MEMORY[0x263F81838];
  if (*MEMORY[0x263F81838] != a2)
  {
    uint64_t v33 = *MEMORY[0x263F03C00];
    v26 = [NSNumber numberWithDouble:a2];
    v34 = v26;
    v27 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v15 setObject:v27 forKeyedSubscript:*MEMORY[0x263F03B60]];
  }
  *(float *)&double v25 = v19;
  v28 = [NSNumber numberWithFloat:v25];
  [v15 setObject:v28 forKeyedSubscript:*MEMORY[0x263F03AC8]];

  v29 = (void *)MEMORY[0x263F81708];
  v30 = [MEMORY[0x263F81720] fontDescriptorWithFontAttributes:v15];
  v31 = [v29 fontWithDescriptor:v30 size:a3];

  return v31;
}

@end