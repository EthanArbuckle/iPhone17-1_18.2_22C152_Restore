@interface NSString(NSStringDrawing)
+ (BOOL)usesScreenFonts;
+ (NSStringDrawingTextStorageSettings)setTypesetterBehavior:()NSStringDrawing;
+ (NSStringDrawingTextStorageSettings)setUsesScreenFonts:()NSStringDrawing;
+ (NSStringDrawingTextStorageSettings)showsControlCharacters;
+ (NSStringDrawingTextStorageSettings)showsInvisibleCharacters;
+ (NSStringDrawingTextStorageSettings)usesFontLeading;
+ (float)hyphenationFactor;
+ (int64_t)typesetterBehavior;
+ (uint64_t)defaultBaselineOffsetForFont:()NSStringDrawing;
+ (uint64_t)defaultLineHeightForFont:()NSStringDrawing;
+ (void)setHyphenationFactor:()NSStringDrawing;
+ (void)setShowsControlCharacters:()NSStringDrawing;
+ (void)setShowsInvisibleCharacters:()NSStringDrawing;
+ (void)setUsesFontLeading:()NSStringDrawing;
- (double)sizeWithAttributes:()NSStringDrawing;
- (void)drawAtPoint:()NSStringDrawing withAttributes:;
- (void)drawInRect:()NSStringDrawing withAttributes:;
@end

@implementation NSString(NSStringDrawing)

+ (int64_t)typesetterBehavior
{
  if (+[NSStringDrawingTextStorage _hasCustomSettings])
  {
    v0 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (v0) {
      return *((unsigned __int8 *)&v0->_settings._flags + 1);
    }
  }

  return +[NSTypesetter defaultStringDrawingTypesetterBehavior];
}

- (double)sizeWithAttributes:()NSStringDrawing
{
  double v5 = MEMORY[0x192FAD920](0.15);
  double v6 = MEMORY[0x192FAD930](0.0);
  uint64_t v7 = objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, a3, 0, *MEMORY[0x1E4F28AE0], *(double *)(MEMORY[0x1E4F28AE0] + 8));
  double v9 = v8;
  uint64_t v10 = MEMORY[0x192FAD920](v7, v5);
  MEMORY[0x192FAD930](v10, v6);
  return v9;
}

- (void)drawAtPoint:()NSStringDrawing withAttributes:
{
  double v9 = MEMORY[0x192FAD920](0.15);
  MEMORY[0x192FAD930](0.0);
  if (!a5) {
    a5 = +[NSAttributeDictionary emptyAttributeDictionary];
  }
  _NSStringDrawingCore(a1, a5, 1, 0, a2, a3, 0.0, 0.0, 0.0, v10, 0);
  MEMORY[0x192FAD920](v9);

  JUMPOUT(0x192FAD930);
}

- (void)drawInRect:()NSStringDrawing withAttributes:
{
  if (a4 > 0.0 && a5 > 0.0)
  {
    if (!a7) {
      a7 = +[NSAttributeDictionary emptyAttributeDictionary];
    }
    _NSStringDrawingCore(a1, a7, 1, 0, a2, a3, a4, a5, 0.0, a9, 0);
  }
}

+ (NSStringDrawingTextStorageSettings)usesFontLeading
{
  result = (NSStringDrawingTextStorageSettings *)+[NSStringDrawingTextStorage _hasCustomSettings];
  if (result)
  {
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (result) {
      return (NSStringDrawingTextStorageSettings *)(*(_WORD *)&result->_settings._flags & 1);
    }
  }
  return result;
}

+ (void)setUsesFontLeading:()NSStringDrawing
{
  if (a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:1];
    +[NSStringDrawingTextStorage _hasCustomSettings];
    v3 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *(_WORD *)&v3->_settings._flags |= 1u;
  }
}

+ (BOOL)usesScreenFonts
{
  if (+[NSStringDrawingTextStorage _hasCustomSettings])
  {
    v0 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (v0) {
      return (*(_WORD *)&v0->_settings._flags >> 1) & 1;
    }
  }

  return +[NSLayoutManager _usesScreenFonts];
}

+ (NSStringDrawingTextStorageSettings)setUsesScreenFonts:()NSStringDrawing
{
  result = (NSStringDrawingTextStorageSettings *)+[NSLayoutManager _usesScreenFonts];
  if (result != a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:1];
    +[NSStringDrawingTextStorage _hasCustomSettings];
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    if (a3) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&result->_settings._flags = *(_WORD *)&result->_settings._flags & 0xFFFD | v5;
  }
  return result;
}

+ (void)setShowsInvisibleCharacters:()NSStringDrawing
{
  if (a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:1];
    +[NSStringDrawingTextStorage _hasCustomSettings];
    v3 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *(_WORD *)&v3->_settings._flags |= 4u;
  }
}

+ (NSStringDrawingTextStorageSettings)showsInvisibleCharacters
{
  result = (NSStringDrawingTextStorageSettings *)+[NSStringDrawingTextStorage _hasCustomSettings];
  if (result)
  {
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (result) {
      return (NSStringDrawingTextStorageSettings *)((*(_WORD *)&result->_settings._flags >> 2) & 1);
    }
  }
  return result;
}

+ (void)setShowsControlCharacters:()NSStringDrawing
{
  if (a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:1];
    +[NSStringDrawingTextStorage _hasCustomSettings];
    v3 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *(_WORD *)&v3->_settings._flags |= 8u;
  }
}

+ (NSStringDrawingTextStorageSettings)showsControlCharacters
{
  result = (NSStringDrawingTextStorageSettings *)+[NSStringDrawingTextStorage _hasCustomSettings];
  if (result)
  {
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (result) {
      return (NSStringDrawingTextStorageSettings *)((*(_WORD *)&result->_settings._flags >> 3) & 1);
    }
  }
  return result;
}

+ (void)setHyphenationFactor:()NSStringDrawing
{
  if (a1 != 0.0)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:1];
    +[NSStringDrawingTextStorage _hasCustomSettings];
    +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1)->_settings._hyphenationFactor = a1;
  }
}

+ (float)hyphenationFactor
{
  float v0 = 0.0;
  if (+[NSStringDrawingTextStorage _hasCustomSettings])
  {
    v1 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (v1) {
      return v1->_settings._hyphenationFactor;
    }
  }
  return v0;
}

+ (NSStringDrawingTextStorageSettings)setTypesetterBehavior:()NSStringDrawing
{
  if (a3 >= 6) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = a3;
  }
  if (+[NSStringDrawingTextStorage _hasCustomSettings]
    && +[NSStringDrawingTextStorage _hasCustomSettings]
    && +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0)|| (result = +[NSTypesetter defaultStringDrawingTypesetterBehavior], (NSStringDrawingTextStorageSettings *)v3 != result))
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:1];
    +[NSStringDrawingTextStorage _hasCustomSettings];
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *((unsigned char *)&result->_settings._flags + 1) = v3;
  }
  return result;
}

+ (uint64_t)defaultLineHeightForFont:()NSStringDrawing
{
  v4 = objc_msgSend(+[NSStringDrawingTextStorage stringDrawingTextStorage](NSStringDrawingTextStorage, "stringDrawingTextStorage"), "layoutManager");

  return [v4 defaultLineHeightForFont:a3];
}

+ (uint64_t)defaultBaselineOffsetForFont:()NSStringDrawing
{
  v4 = objc_msgSend(+[NSStringDrawingTextStorage stringDrawingTextStorage](NSStringDrawingTextStorage, "stringDrawingTextStorage"), "layoutManager");

  return [v4 defaultBaselineOffsetForFont:a3];
}

@end