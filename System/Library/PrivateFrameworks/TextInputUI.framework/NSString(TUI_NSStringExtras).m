@interface NSString(TUI_NSStringExtras)
+ (id)tui_excessiveLineHeightCharacterSet;
- (double)tui_languageAwareOutsetsForFont:()TUI_NSStringExtras;
- (double)tui_optimizedSizeWithFont:()TUI_NSStringExtras;
- (id)tui_centerTruncatedStringWithAttributes:()TUI_NSStringExtras fittingWidth:;
@end

@implementation NSString(TUI_NSStringExtras)

- (id)tui_centerTruncatedStringWithAttributes:()TUI_NSStringExtras fittingWidth:
{
  id v6 = a4;
  if (a2 >= 0.00000011920929
    && (unint64_t)[a1 length] >= 3
    && ([a1 sizeWithAttributes:v6], v7 >= a2))
  {
    uint64_t v10 = -1;
    uint64_t v11 = 2;
    for (unint64_t i = 2; ; ++i)
    {
      unint64_t v13 = (unint64_t)[a1 length] >> 1;
      v14 = objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v10 + v13, v11, @"…");
      [v14 sizeWithAttributes:v6];
      if (v15 < a2 || i >= v13) {
        break;
      }

      v11 += 2;
      --v10;
    }
    id v8 = v14;
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

- (double)tui_optimizedSizeWithFont:()TUI_NSStringExtras
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![a1 length])
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    goto LABEL_19;
  }
  if (![a1 _isOnlyIdeographs])
  {
LABEL_18:
    objc_msgSend(a1, "_legacy_sizeWithFont:", v4);
    double v7 = v26;
    goto LABEL_19;
  }
  unint64_t v5 = [a1 _graphemeCount];
  if (v5 == 1)
  {
    [v4 pointSize];
    double v7 = ceil(v6 * 1.05);
    goto LABEL_19;
  }
  CFIndex v8 = v5;
  if (v5 > 0x14)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v31 = *MEMORY[0x1E4FB06F8];
    v32[0] = v4;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    CFAttributedStringRef v22 = (const __CFAttributedString *)[v20 initWithString:a1 attributes:v21];

    v23 = CTLineCreateWithAttributedString(v22);
    if (v23)
    {
      v24 = v23;
      CGFloat descent = 0.0;
      CGFloat ascent = 0.0;
      double TypographicBounds = CTLineGetTypographicBounds(v23, &ascent, &descent, 0);
      CFRelease(v24);
      double v7 = ceil(TypographicBounds);

      goto LABEL_19;
    }

    goto LABEL_18;
  }
  uint64_t v9 = MEMORY[0x1F4188790](v5);
  uint64_t v11 = (CGGlyph *)((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  MEMORY[0x1F4188790](v12);
  v14 = (const UniChar *)((char *)&v28 - v13);
  id v15 = a1;
  v16 = (const UniChar *)[v15 _fastCharacterContents];
  if (!v16)
  {
    objc_msgSend(v15, "getCharacters:range:", v14, 0, v8);
    v16 = v14;
  }
  if (tui_optimizedSizeWithFont__onceToken != -1) {
    dispatch_once(&tui_optimizedSizeWithFont__onceToken, &__block_literal_global_2);
  }
  v17 = [(id)tui_optimizedSizeWithFont__cache objectForKey:v4];
  if (!v17)
  {
    v17 = (const __CTFont *)CTFontCreateForCharactersWithLanguage();
    if (v17) {
      [(id)tui_optimizedSizeWithFont__cache setObject:v17 forKey:v4];
    }
  }
  CTFontGetGlyphsForCharacters(v17, v16, v11, v8);
  double AdvancesForGlyphs = CTFontGetAdvancesForGlyphs(v17, kCTFontOrientationHorizontal, v11, (CGSize *)&v28 - v8, v8);
  double v19 = CTFontGetAscent(v17);
  double v7 = ceil(AdvancesForGlyphs);
  ceil(v19 + CTFontGetDescent(v17));

LABEL_19:
  return v7;
}

- (double)tui_languageAwareOutsetsForFont:()TUI_NSStringExtras
{
  id v4 = a3;
  long long v8 = *MEMORY[0x1E4FB2848];
  unint64_t v5 = objc_msgSend((id)objc_opt_class(), "tui_excessiveLineHeightCharacterSet");
  uint64_t v6 = [a1 rangeOfCharacterFromSet:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    CTFontGetLanguageAwareOutsets();
  }

  return *(double *)&v8;
}

+ (id)tui_excessiveLineHeightCharacterSet
{
  if (tui_excessiveLineHeightCharacterSet_onceToken != -1) {
    dispatch_once(&tui_excessiveLineHeightCharacterSet_onceToken, &__block_literal_global_3684);
  }
  v0 = (void *)tui_excessiveLineHeightCharacterSet___tui_excessiveLineCharacterSet;
  return v0;
}

@end