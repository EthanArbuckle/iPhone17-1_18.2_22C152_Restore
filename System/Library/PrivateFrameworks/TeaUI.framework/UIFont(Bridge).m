@interface UIFont(Bridge)
+ (id)ts_preferredFontForTextStyle:()Bridge;
- (double)ts_boundingBoxForString:()Bridge;
- (uint64_t)ts_tightenedLineSpacingForString:()Bridge;
- (uint64_t)ts_tightenedLineSpacingForString:()Bridge minimumLineSpacingMultiple:;
@end

@implementation UIFont(Bridge)

- (uint64_t)ts_tightenedLineSpacingForString:()Bridge minimumLineSpacingMultiple:
{
  return [a1 lineHeight];
}

- (double)ts_boundingBoxForString:()Bridge
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFIndex v5 = [v4 length];
  MEMORY[0x1F4188790](v5);
  unint64_t v6 = (2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  objc_msgSend(v4, "getCharacters:range:", (char *)v9 - v6, 0, v5);

  MEMORY[0x1F4188790](v7);
  if (!CTFontGetGlyphsForCharacters(a1, (const UniChar *)((char *)v9 - v6), (CGGlyph *)((char *)v9 - v6), v5)) {
    return *MEMORY[0x1E4F1DB28];
  }
  *(void *)&double result = (unint64_t)CTFontGetBoundingRectsForGlyphs(a1, kCTFontOrientationDefault, (const CGGlyph *)((char *)v9 - v6), 0, v5);
  return result;
}

+ (id)ts_preferredFontForTextStyle:()Bridge
{
  switch(a3)
  {
    case 0:
      id v4 = (void *)MEMORY[0x1E4FB2930];
      goto LABEL_5;
    case 1:
      id v4 = (void *)MEMORY[0x1E4FB2938];
      goto LABEL_5;
    case 2:
      id v4 = (void *)MEMORY[0x1E4FB2940];
LABEL_5:
      v3 = [a1 preferredFontForTextStyle:*v4];
      break;
    case 3:
      CFIndex v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998] addingSymbolicTraits:64 options:0];
      v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];

      break;
    default:
      break;
  }
  return v3;
}

- (uint64_t)ts_tightenedLineSpacingForString:()Bridge
{
  return objc_msgSend(a1, "ts_tightenedLineSpacingForString:minimumLineSpacingMultiple:", 0.7);
}

@end