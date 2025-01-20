@interface PRIncomingCallFontsProvider
+ ($721907E0E1CDE8B6CD3FA271A8B25860)_sampleFallbackForFont:(id)a3;
+ ($721907E0E1CDE8B6CD3FA271A8B25860)_sampleStringForFont:(id)a3;
+ ($721907E0E1CDE8B6CD3FA271A8B25860)sampleStringForFont:(id)a3 displayingText:(id)a4;
+ (BOOL)_canTextBePartiallyRenderedForFont:(id)a3 text:(id)a4;
+ (BOOL)_canTextBePartiallyRenderedForFontRef:(__CTFont *)a3 text:(id)a4;
+ (BOOL)_canTextBePartiallyRenderedForFontWithName:(id)a3 text:(id)a4;
+ (BOOL)_canTextBePartiallyRenderedForTimeFontIdentifier:(id)a3 text:(id)a4;
+ (UIFont)defaultNameFont;
+ (UIFont)defaultStatusFont;
+ (double)_deviceBasedFontSizeForSize:(double)a3;
+ (double)_idealEmphasizedFontSizeForForVerticalName:(id)a3 layout:(unint64_t)a4;
+ (double)defaultEmphasizedNameFontSize;
+ (double)defaultSecondaryNameFontSize;
+ (double)defaultStatusFontSize;
+ (double)glyphBoundsForText:(id)a3 usingFont:(id)a4;
+ (double)idealEmphasizedFontSizeForHorizontalName:(id)a3 nonEmphasizedText:(id)a4 nonEmphasizedFont:(id)a5 emphasizedNameIsTopName:(BOOL)a6;
+ (double)idealEmphasizedFontSizeForName:(id)a3 status:(id)a4 usingLayout:(unint64_t)a5;
+ (double)idealEmphasizedFontSizeForName:(id)a3 usingLayout:(unint64_t)a4;
+ (id)_cjkFontSizeMap;
+ (id)_fallbackFontsForFont:(id)a3 displayingText:(id)a4;
+ (id)_preferredLanguageForFont:(__CTFont *)a3;
+ (id)_renderCompatibleIdentifiersForTimeFontIdentifiers:(id)a3 text:(id)a4;
+ (id)timeFontIdentifiersForText:(id)a3 availableFonts:(id)a4;
@end

@implementation PRIncomingCallFontsProvider

+ (UIFont)defaultNameFont
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_defaultTimeFontForRole:", @"PRPosterRoleIncomingCall");
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  v5 = v4;

  return (UIFont *)v5;
}

+ (UIFont)defaultStatusFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  [a1 defaultStatusFontSize];
  return (UIFont *)objc_msgSend(v2, "monospacedDigitSystemFontOfSize:weight:");
}

+ (double)defaultEmphasizedNameFontSize
{
  [a1 _deviceBasedFontSizeForSize:76.0];
  return result;
}

+ (double)defaultStatusFontSize
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  [v3 pointSize];
  double v5 = v4;
  [a1 defaultSecondaryNameFontSize];
  double v7 = fmin(v5, v6);

  return v7;
}

+ (double)defaultSecondaryNameFontSize
{
  [a1 _deviceBasedFontSizeForSize:48.0];
  return result;
}

+ (double)_deviceBasedFontSizeForSize:(double)a3
{
  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  if (CGRectGetWidth(v6) <= 375.0) {
    a3 = a3 * 0.9;
  }

  return a3;
}

+ (id)_cjkFontSizeMap
{
  if (_cjkFontSizeMap_once != -1) {
    dispatch_once(&_cjkFontSizeMap_once, &__block_literal_global_17);
  }
  v2 = (void *)_cjkFontSizeMap_cjkFontSizeMap;
  return v2;
}

void __46__PRIncomingCallFontsProvider__cjkFontSizeMap__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1ED9EEC80;
  v6[0] = &unk_1ED9EEC98;
  v6[1] = &unk_1ED9EECB0;
  v7[0] = &unk_1ED9EF140;
  v7[1] = &unk_1ED9EF150;
  v6[2] = &unk_1ED9EECC8;
  v6[3] = &unk_1ED9EECE0;
  v7[2] = &unk_1ED9EF160;
  v7[3] = &unk_1ED9EF170;
  v6[4] = &unk_1ED9EECF8;
  v6[5] = &unk_1ED9EED10;
  v7[4] = &unk_1ED9EF170;
  v7[5] = &unk_1ED9EF170;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];
  v8[1] = &unk_1ED9EED28;
  v9[0] = v0;
  v4[0] = &unk_1ED9EEC98;
  v4[1] = &unk_1ED9EECB0;
  v5[0] = &unk_1ED9EF140;
  v5[1] = &unk_1ED9EF150;
  v4[2] = &unk_1ED9EECC8;
  v4[3] = &unk_1ED9EECE0;
  v5[2] = &unk_1ED9EF160;
  v5[3] = &unk_1ED9EF170;
  v4[4] = &unk_1ED9EECF8;
  v4[5] = &unk_1ED9EED10;
  v5[4] = &unk_1ED9EF180;
  v5[5] = &unk_1ED9EF190;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  v9[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v3 = (void *)_cjkFontSizeMap_cjkFontSizeMap;
  _cjkFontSizeMap_cjkFontSizeMap = v2;
}

+ (double)idealEmphasizedFontSizeForName:(id)a3 usingLayout:(unint64_t)a4
{
  id v6 = a3;
  if (objc_msgSend(v6, "pr_isSuitableForVerticalLayout")) {
    [a1 _idealEmphasizedFontSizeForForVerticalName:v6 layout:a4];
  }
  else {
    [a1 defaultEmphasizedNameFontSize];
  }
  double v8 = v7;

  return v8;
}

+ (double)idealEmphasizedFontSizeForName:(id)a3 status:(id)a4 usingLayout:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!objc_msgSend(v8, "pr_isSuitableForVerticalLayout"))
    {
      v12 = [a1 defaultStatusFont];
      [a1 defaultStatusFontSize];
      v13 = objc_msgSend(v12, "fontWithSize:");

      [a1 idealEmphasizedFontSizeForHorizontalName:v8 nonEmphasizedText:v9 nonEmphasizedFont:v13 emphasizedNameIsTopName:0];
      double v11 = v14;

      goto LABEL_7;
    }
    [a1 _idealEmphasizedFontSizeForForVerticalName:v8 layout:a5];
  }
  else
  {
    [a1 idealEmphasizedFontSizeForName:v8 usingLayout:a5];
  }
  double v11 = v10;
LABEL_7:

  return v11;
}

+ (double)idealEmphasizedFontSizeForHorizontalName:(id)a3 nonEmphasizedText:(id)a4 nonEmphasizedFont:(id)a5 emphasizedNameIsTopName:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6) {
    v13 = v10;
  }
  else {
    v13 = v11;
  }
  if (v6) {
    double v14 = v11;
  }
  else {
    double v14 = v10;
  }
  id v15 = v13;
  id v16 = v14;
  [a1 glyphBoundsForText:v11 usingFont:v12];
  double v18 = v17;
  +[PRIncomingCallMetricsProvider maximumHorizontalTextBounds];
  double Height = CGRectGetHeight(v32);
  [a1 defaultEmphasizedNameFontSize];
  double v21 = v20;
  if (Height < 2147483650.0)
  {
    do
    {
      [a1 defaultSecondaryNameFontSize];
      if (v21 < v22) {
        break;
      }
      double v21 = v21 + -1.0;
      v23 = [a1 defaultNameFont];
      id v24 = [v23 fontWithSize:v21];

      [a1 glyphBoundsForText:v10 usingFont:v24];
      double v26 = v25;
      id v27 = v6 ? v24 : v12;
      id v28 = v6 ? v12 : v24;
      +[PRIncomingCallTextViewConfigurationMetrics idealSpaceBetweenTopText:v15 topFont:v27 bottomText:v16 bottomFont:v28];
      double v30 = v18 + v26 + v29;
    }
    while (v30 > Height);
  }

  return v21;
}

+ (double)_idealEmphasizedFontSizeForForVerticalName:(id)a3 layout:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [a1 _cjkFontSizeMap];
  id v8 = [NSNumber numberWithUnsignedInteger:a4];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9
    && ([v9 allKeys],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    id v12 = [v9 allKeys];
    v13 = [v12 valueForKeyPath:@"@max.unsignedIntegerValue"];
    unint64_t v14 = [v13 unsignedIntegerValue];

    unint64_t v15 = [v6 length];
    if (v15 >= v14) {
      unint64_t v16 = v14;
    }
    else {
      unint64_t v16 = v15;
    }
    double v17 = [NSNumber numberWithUnsignedInteger:v16];
    double v18 = [v9 objectForKeyedSubscript:v17];

    if (v18)
    {
      [v18 floatValue];
      [a1 _deviceBasedFontSizeForSize:v19];
    }
    else
    {
      [a1 defaultEmphasizedNameFontSize];
    }
    double v22 = v20;
  }
  else
  {
    [a1 defaultEmphasizedNameFontSize];
    double v22 = v21;
  }

  return v22;
}

+ (double)glyphBoundsForText:(id)a3 usingFont:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v18 = *MEMORY[0x1E4F243F0];
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  CFAttributedStringRef v10 = (const __CFAttributedString *)[v8 initWithString:v7 attributes:v9];
  uint64_t v11 = CTLineCreateWithAttributedString(v10);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v11, 8uLL);
  CGFloat x = BoundsWithOptions.origin.x;
  CGFloat y = BoundsWithOptions.origin.y;
  CGFloat width = BoundsWithOptions.size.width;
  CGFloat height = BoundsWithOptions.size.height;
  CFRelease(v11);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v21);

  return v16;
}

+ (id)timeFontIdentifiersForText:(id)a3 availableFonts:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28B88];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alphanumericCharacterSet];
  CFAttributedStringRef v10 = [v9 invertedSet];
  uint64_t v11 = [v8 componentsSeparatedByCharactersInSet:v10];
  id v12 = [v11 componentsJoinedByString:&stru_1ED9A3120];

  if ([v12 length]) {
    v13 = v12;
  }
  else {
    v13 = v8;
  }
  id v14 = v13;

  unint64_t v15 = [a1 _renderCompatibleIdentifiersForTimeFontIdentifiers:v7 text:v14];

  if ([v15 count])
  {
    double v16 = (void *)[v15 copy];
    goto LABEL_18;
  }
  v28[0] = @"PRTimeFontIdentifierSFArabic";
  v28[1] = @"PRTimeFontIdentifierSFArabicRounded";
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  uint64_t v18 = [a1 _renderCompatibleIdentifiersForTimeFontIdentifiers:v17 text:v14];

  if (![v18 count])
  {
    v27[0] = @"PRTimeFontIdentifierSFHebrew";
    v27[1] = @"PRTimeFontIdentifierSFHebrewRounded";
    float v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    double v20 = [a1 _renderCompatibleIdentifiersForTimeFontIdentifiers:v19 text:v14];

    if ([v20 count])
    {
      uint64_t v21 = [v20 copy];
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        v26[0] = @"PRTimeFontIdentifierNovember";
        v26[1] = @"PRTimeFontIdentifierOctober";
        v26[2] = @"PRTimeFontIdentifierNovemberCondensed";
        double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
        v23 = [a1 _renderCompatibleIdentifiersForTimeFontIdentifiers:v22 text:v14];

        if ([v23 count])
        {
          double v16 = (void *)[v23 copy];

          double v20 = v23;
LABEL_16:

          uint64_t v18 = v20;
          goto LABEL_17;
        }

        double v20 = v23;
      }
      double v25 = @"PRTimeFontIdentifierSFPro";
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    }
    double v16 = (void *)v21;
    goto LABEL_16;
  }
  double v16 = (void *)[v18 copy];
LABEL_17:

  unint64_t v15 = v18;
LABEL_18:

  return v16;
}

+ (id)_renderCompatibleIdentifiersForTimeFontIdentifiers:(id)a3 text:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PRIncomingCallFontsProvider__renderCompatibleIdentifiersForTimeFontIdentifiers_text___block_invoke;
  v10[3] = &unk_1E54DBA20;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "bs_filter:", v10);

  return v8;
}

uint64_t __87__PRIncomingCallFontsProvider__renderCompatibleIdentifiersForTimeFontIdentifiers_text___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _canTextBePartiallyRenderedForTimeFontIdentifier:a2 text:*(void *)(a1 + 32)];
}

+ (BOOL)_canTextBePartiallyRenderedForTimeFontIdentifier:(id)a3 text:(id)a4
{
  id v6 = a4;
  id v7 = PRFontNameForTimeFontIdentifier(a3);
  LOBYTE(a1) = [a1 _canTextBePartiallyRenderedForFontWithName:v7 text:v6];

  return (char)a1;
}

+ (BOOL)_canTextBePartiallyRenderedForFont:(id)a3 text:(id)a4
{
  id v6 = a4;
  id v7 = [a3 fontName];
  LOBYTE(a1) = [a1 _canTextBePartiallyRenderedForFontWithName:v7 text:v6];

  return (char)a1;
}

+ (BOOL)_canTextBePartiallyRenderedForFontWithName:(id)a3 text:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  id v7 = a4;
  LOBYTE(a3) = objc_msgSend(a1, "_canTextBePartiallyRenderedForFontRef:text:", objc_msgSend(v6, "pr_fontWithName:forRole:includingFallbackFonts:", a3, @"PRPosterRoleIncomingCall", 0), v7);

  return (char)a3;
}

+ (BOOL)_canTextBePartiallyRenderedForFontRef:(__CTFont *)a3 text:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 length];
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v7 = (2 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = objc_msgSend(v5, "getCharacters:range:", (char *)v14 - v7, 0, v6);
  MEMORY[0x1F4188790](v8);
  id v9 = (unsigned __int16 *)((char *)v14 - v7);
  if (CTFontGetGlyphsForCharacters(a3, (const UniChar *)((char *)v14 - v7), (CGGlyph *)((char *)v14 - v7), v6))
  {
    LOBYTE(v6) = 1;
  }
  else if (v6)
  {
    uint64_t v10 = v6 - 1;
    do
    {
      int v11 = *v9++;
      LOBYTE(v6) = v11 != 0;
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v10 == 0;
      }
      --v10;
    }
    while (!v12);
  }

  return v6;
}

+ ($721907E0E1CDE8B6CD3FA271A8B25860)_sampleFallbackForFont:(id)a3
{
  id v3 = a3;
  double v4 = @"Aa";
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

+ ($721907E0E1CDE8B6CD3FA271A8B25860)sampleStringForFont:(id)a3 displayingText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _canTextBePartiallyRenderedForFont:v6 text:v7])
  {
    uint64_t v8 = [a1 _sampleStringForFont:v6];
    uint64_t v10 = v9;
  }
  else
  {
    int v11 = [a1 _fallbackFontsForFont:v6 displayingText:v7];
    BOOL v12 = [v11 firstObject];

    if (v12) {
      uint64_t v13 = [a1 _sampleStringForFont:v12];
    }
    else {
      uint64_t v13 = [a1 _sampleFallbackForFont:v6];
    }
    uint64_t v8 = v13;
    uint64_t v10 = v14;
  }
  unint64_t v15 = (void *)v8;
  double v16 = v10;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

+ ($721907E0E1CDE8B6CD3FA271A8B25860)_sampleStringForFont:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = [v4 fontName];
  uint64_t v7 = objc_msgSend(v5, "pr_fontWithName:forRole:includingFallbackFonts:", v6, @"PRPosterRoleIncomingCall", 0);

  uint64_t v8 = [a1 _preferredLanguageForFont:v7];
  id v9 = (void *)CTCopySampleStringForLanguage();
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
    id v12 = v4;
  }
  else
  {
    id v11 = (id)[a1 _sampleFallbackForFont:v4];
    id v12 = v13;
  }

  id v14 = v11;
  unint64_t v15 = v12;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

+ (id)_preferredLanguageForFont:(__CTFont *)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_48);

  CFTypeRef v6 = CTFontCopyAttribute(a3, (CFStringRef)*MEMORY[0x1E4F24500]);
  uint64_t v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  if (![v9 count])
  {
    uint64_t v10 = [v5 firstObject];
    v39[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];

    id v9 = (id)v11;
  }
  if ([v9 count] == 1)
  {
    id v12 = [v9 firstObject];
  }
  else
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__0;
    v37 = __Block_byref_object_dispose__0;
    id v38 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_49;
    v30[3] = &unk_1E54DBA68;
    id v13 = v9;
    id v31 = v13;
    CGRect v32 = &v33;
    [v5 enumerateObjectsUsingBlock:v30];
    id v14 = (void *)v34[5];
    if (v14)
    {
      id v12 = v14;
    }
    else
    {
      CFArrayRef v15 = CTFontCopySupportedLanguages(a3);
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      double v26 = __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_2;
      id v27 = &unk_1E54DBA68;
      CFArrayRef v16 = v15;
      CFArrayRef v28 = v16;
      double v29 = &v33;
      [v5 enumerateObjectsUsingBlock:&v24];
      double v17 = (void *)v34[5];
      if (v17)
      {
        id v12 = v17;
      }
      else
      {
        uint64_t v18 = objc_msgSend(v13, "firstObject", v24, v25, v26, v27);
        float v19 = v18;
        if (v18)
        {
          id v12 = v18;
        }
        else
        {
          double v20 = [(__CFArray *)v16 firstObject];
          uint64_t v21 = v20;
          if (v20)
          {
            id v22 = v20;
          }
          else
          {
            id v22 = [v5 firstObject];
          }
          id v12 = v22;
        }
      }
    }
    _Block_object_dispose(&v33, 8);
  }
  return v12;
}

id __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a2];
  id v3 = [v2 languageCode];

  return v3;
}

void __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_49(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __57__PRIncomingCallFontsProvider__preferredLanguageForFont___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)_fallbackFontsForFont:(id)a3 displayingText:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F243F0];
  v23[0] = v5;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v7 = (const __CTLine *)CTLineCreateWithString();
  uint64_t v8 = CTLineGetGlyphRuns(v7);
  id v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        CFArrayRef v15 = CTRunGetFont();
        objc_msgSend(v9, "addObject:", v15, v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  CFRelease(v7);
  return v9;
}

@end