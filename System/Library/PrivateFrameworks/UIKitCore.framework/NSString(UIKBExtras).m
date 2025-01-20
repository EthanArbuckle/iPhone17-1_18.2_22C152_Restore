@interface NSString(UIKBExtras)
- (double)_optimizedSizeWithFont:()UIKBExtras;
@end

@implementation NSString(UIKBExtras)

- (double)_optimizedSizeWithFont:()UIKBExtras
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![a1 length])
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    goto LABEL_15;
  }
  if (![a1 _isOnlyIdeographs])
  {
LABEL_14:
    objc_msgSend(a1, "_legacy_sizeWithFont:", v4);
    double v7 = v22;
    goto LABEL_15;
  }
  unint64_t v5 = [a1 _graphemeCount];
  if (v5 == 1)
  {
    [v4 pointSize];
    double v7 = ceil(v6 * 1.05);
    goto LABEL_15;
  }
  CFIndex v8 = v5;
  if (v5 > 0x14)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v27 = *(void *)off_1E52D2040;
    v28[0] = v4;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    CFAttributedStringRef v16 = (const __CFAttributedString *)[v14 initWithString:a1 attributes:v15];

    v17 = CTLineCreateWithAttributedString(v16);
    if (v17)
    {
      v18 = v17;
      CGFloat descent = 0.0;
      CGFloat ascent = 0.0;
      double TypographicBounds = CTLineGetTypographicBounds(v17, &ascent, &descent, 0);
      CFRelease(v18);
      double v7 = ceil(TypographicBounds);

      goto LABEL_15;
    }

    goto LABEL_14;
  }
  uint64_t v9 = 2 * v5;
  MEMORY[0x1F4188790](v5);
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v11);
  id v12 = a1;
  v13 = (const UniChar *)[v12 _fastCharacterContents];
  if (v13)
  {
    CTFontGetGlyphsForCharacters((CTFontRef)v4, v13, (CGGlyph *)((char *)&v24 - v10), v8);
  }
  else
  {
    objc_msgSend(v12, "getCharacters:range:", (char *)&v24 - v10, 0, v8, MEMORY[0x1F4188790](0));
    CTFontGetGlyphsForCharacters((CTFontRef)v4, (const UniChar *)((char *)&v24 - v10), (CGGlyph *)((char *)&v24 - v10), v8);
  }
  double AdvancesForGlyphs = CTFontGetAdvancesForGlyphs((CTFontRef)v4, kCTFontOrientationHorizontal, (const CGGlyph *)((char *)&v24 - v10), (CGSize *)&v24 - v8, v8);
  double v21 = CTFontGetAscent((CTFontRef)v4);
  double v7 = ceil(AdvancesForGlyphs);
  ceil(v21 + CTFontGetDescent((CTFontRef)v4));
LABEL_15:

  return v7;
}

@end