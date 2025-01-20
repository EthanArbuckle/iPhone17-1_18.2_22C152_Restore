@interface TCImportFontCache
+ (CGSize)stringSizeForText:(id)a3 ctFontRef:(__CTFont *)a4;
- (CGSize)stringSizeForSpaceWithFontName:(id)a3 fontSize:(int)a4;
- (CGSize)stringSizeForText:(id)a3 fontName:(id)a4 fontSize:(int)a5;
- (NSMutableDictionary)fontNameCache;
- (TCImportFontCache)init;
- (__CTFont)ctFontRefForKey:(id)a3;
- (__CTFont)fontRefForFontName:(id)a3 size:(int)a4;
- (void)dealloc;
@end

@implementation TCImportFontCache

- (TCImportFontCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)TCImportFontCache;
  v2 = [(TCImportFontCache *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(OITSUNoCopyDictionary);
    mFontCache = v2->mFontCache;
    v2->mFontCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mFontNameCache = v2->mFontNameCache;
    v2->mFontNameCache = v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(OITSUNoCopyDictionary *)self->mFontCache objectEnumerator];
  for (i = 0; ; i = v5)
  {
    v5 = [v3 nextObject];

    if (!v5) {
      break;
    }
    CFRelease((CFTypeRef)[v5 pointerValue]);
  }

  v6.receiver = self;
  v6.super_class = (Class)TCImportFontCache;
  [(TCImportFontCache *)&v6 dealloc];
}

- (__CTFont)ctFontRefForKey:(id)a3
{
  v3 = [(OITSUNoCopyDictionary *)self->mFontCache objectForKey:a3];
  v4 = v3;
  if (v3) {
    v5 = (__CTFont *)[v3 pointerValue];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (__CTFont)fontRefForFontName:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_super v6 = (__CFString *)a3;
  if (v6)
  {
    id v7 = +[TCImportFontCacheKey createFontCacheKeyForName:v6 size:v4];
    if (v7)
    {
      objc_super v8 = [(TCImportFontCache *)self ctFontRefForKey:v7];
      if (!v8)
      {
        objc_super v8 = CTFontCreateWithNameAndOptions(v6, (double)(int)v4, 0, 1uLL);
        if (v8)
        {
          mFontCache = self->mFontCache;
          v10 = [MEMORY[0x263F08D40] valueWithPointer:v8];
          [(OITSUNoCopyDictionary *)mFontCache setObject:v10 forUncopiedKey:v7];
        }
      }
    }
    else
    {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

+ (CGSize)stringSizeForText:(id)a3 ctFontRef:(__CTFont *)a4
{
  id v5 = a3;
  double AdvancesForGlyphs = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v8 = [v5 length];
  if (v5)
  {
    if (a4)
    {
      CFIndex v9 = v8;
      if (v8)
      {
        v10 = (CGGlyph *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
        v11 = (UniChar *)malloc_type_malloc(2 * v9 + 2, 0x1000040BDFB0063uLL);
        objc_msgSend(v5, "getCharacters:range:", v11, 0, v9);
        CTFontGetGlyphsForCharacters(a4, v11, v10, v9);
        CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(a4, kCTFontOrientationDefault, v10, 0, v9);
        CGFloat height = BoundingRectsForGlyphs.size.height;
        double AdvancesForGlyphs = CTFontGetAdvancesForGlyphs(a4, kCTFontOrientationDefault, v10, 0, v9);
        free(v10);
        free(v11);
      }
    }
  }

  double v12 = AdvancesForGlyphs;
  double v13 = height;
  result.CGFloat height = v13;
  result.width = v12;
  return result;
}

- (CGSize)stringSizeForSpaceWithFontName:(id)a3 fontSize:(int)a4
{
  uint64_t v4 = [(TCImportFontCache *)self fontRefForFontName:a3 size:*(void *)&a4];
  CGGlyph glyphs = -1;
  UniChar characters = 32;
  CTFontGetGlyphsForCharacters(v4, &characters, &glyphs, 1);
  CGSize advances = (CGSize)*MEMORY[0x263F001B0];
  CTFontGetAdvancesForGlyphs(v4, kCTFontOrientationDefault, &glyphs, &advances, 1);
  double width = advances.width;
  double height = advances.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)stringSizeForText:(id)a3 fontName:(id)a4 fontSize:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  +[TCImportFontCache stringSizeForText:v8 ctFontRef:[(TCImportFontCache *)self fontRefForFontName:v9 size:v5]];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (NSMutableDictionary)fontNameCache
{
  return self->mFontNameCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontNameCache, 0);
  objc_storeStrong((id *)&self->mFontCache, 0);
}

@end