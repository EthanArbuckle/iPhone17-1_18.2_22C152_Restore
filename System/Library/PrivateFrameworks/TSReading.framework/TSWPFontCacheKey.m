@interface TSWPFontCacheKey
+ (id)cacheKeyWithFontName:(id)a3 size:(double)a4 weight:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)fontName;
- (TSWPFontCacheKey)initWithFontName:(id)a3 size:(double)a4 weight:(double)a5;
- (double)fontSize;
- (double)fontWeight;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSWPFontCacheKey

+ (id)cacheKeyWithFontName:(id)a3 size:(double)a4 weight:(double)a5
{
  objc_sync_enter(a1);
  v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey;
  if (!+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey
    || ([(id)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey fontSize],
        v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey,
        v10 != a4)
    || ([(id)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey fontWeight],
        v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey,
        v11 != a5)
    || (char v12 = objc_msgSend((id)objc_msgSend((id)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey, "fontName"), "isEqualToString:", a3), v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey, (v12 & 1) == 0))
  {

    v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFontName:a3 size:a4 weight:a5];
    +[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey = (uint64_t)v9;
  }
  id v13 = v9;
  objc_sync_exit(a1);
  return v13;
}

- (TSWPFontCacheKey)initWithFontName:(id)a3 size:(double)a4 weight:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPFontCacheKey;
  v8 = [(TSWPFontCacheKey *)&v10 init];
  if (v8)
  {
    v8->_fontName = (NSString *)[a3 copy];
    v8->_fontSize = a4;
    v8->_fontWeight = a5;
  }
  return v8;
}

- (void)dealloc
{
  self->_fontName = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPFontCacheKey;
  [(TSWPFontCacheKey *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(NSString *)self->_fontName hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v5 = (void *)TSUDynamicCast();
  if (!a3) {
    return 0;
  }
  v6 = v5;
  [v5 fontSize];
  if (v7 != self->_fontSize) {
    return 0;
  }
  [v6 fontWeight];
  if (v8 != self->_fontWeight) {
    return 0;
  }
  v9 = (void *)[v6 fontName];
  fontName = self->_fontName;

  return [v9 isEqualToString:fontName];
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

@end