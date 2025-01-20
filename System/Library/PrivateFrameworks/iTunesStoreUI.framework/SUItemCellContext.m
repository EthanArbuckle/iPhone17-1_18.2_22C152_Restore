@interface SUItemCellContext
- ($91CE74A43BC82DB31014AD40E653447B)stringSizeCacheKeyCallBacks;
- (CGSize)sizeForString:(id)a3 font:(id)a4 constrainedToSize:(CGSize)a5;
- (SUItemCellContext)init;
- (id)ratingImageForRating:(float)a3 style:(int64_t)a4;
- (void)dealloc;
- (void)resetLayoutCaches;
- (void)setStringSizeCacheKeyCallBacks:(id *)a3;
@end

@implementation SUItemCellContext

- (SUItemCellContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemCellContext;
  result = [(SUItemCellContext *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_stringSizeCacheKeyCallBacks.version = 0u;
    *(_OWORD *)&result->_stringSizeCacheKeyCallBacks.release = 0u;
    *(_OWORD *)&result->_stringSizeCacheKeyCallBacks.equal = 0u;
  }
  return result;
}

- (void)dealloc
{
  cachedRatingImages = self->_cachedRatingImages;
  if (cachedRatingImages)
  {
    CFRelease(cachedRatingImages);
    self->_cachedRatingImages = 0;
  }
  stringSizes = self->_stringSizes;
  if (stringSizes)
  {
    CFRelease(stringSizes);
    self->_stringSizes = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUItemCellContext;
  [(SUArtworkCellContext *)&v5 dealloc];
}

- (id)ratingImageForRating:(float)a3 style:(int64_t)a4
{
  cachedRatingImages = self->_cachedRatingImages;
  if (!cachedRatingImages)
  {
    cachedRatingImages = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    self->_cachedRatingImages = cachedRatingImages;
  }
  v8 = (const void *)(uint64_t)rintf(a3 * 10.0);
  id Value = (id)CFDictionaryGetValue(cachedRatingImages, v8);
  if (!Value)
  {
    uint64_t v10 = [MEMORY[0x263F1C550] clearColor];
    *(float *)&double v11 = a3;
    id Value = +[SUUserRatingView copyImageForRating:v10 backgroundColor:a4 style:v11];
    if (Value)
    {
      CFDictionarySetValue(self->_cachedRatingImages, v8, Value);
    }
  }
  return Value;
}

- (CGSize)sizeForString:(id)a3 font:(id)a4 constrainedToSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  stringSizes = self->_stringSizes;
  if (stringSizes)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    double width = *MEMORY[0x263F001B0];
    double height = *(double *)(MEMORY[0x263F001B0] + 8);
    goto LABEL_12;
  }
  stringSizes = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&self->_stringSizeCacheKeyCallBacks, MEMORY[0x263EFFF90]);
  self->_stringSizes = stringSizes;
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  id Value = (void *)CFDictionaryGetValue(stringSizes, a3);
  if (Value)
  {
    [Value CGSizeValue];
    if (v13 < height) {
      double height = v13;
    }
    if (v12 < width) {
      double width = v12;
    }
  }
  else
  {
    objc_msgSend(a3, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", a4, 4, width, height);
    double width = v14;
    double height = v15;
    CFDictionarySetValue(self->_stringSizes, a3, (const void *)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:"));
  }
LABEL_12:
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)resetLayoutCaches
{
  stringSizes = self->_stringSizes;
  if (stringSizes)
  {
    CFRelease(stringSizes);
    self->_stringSizes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUItemCellContext;
  [(SUCellConfigurationContext *)&v4 resetLayoutCaches];
}

- ($91CE74A43BC82DB31014AD40E653447B)stringSizeCacheKeyCallBacks
{
  long long v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var5;
  return self;
}

- (void)setStringSizeCacheKeyCallBacks:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var2;
  long long v3 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_stringSizeCacheKeyCallBacks.version = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_stringSizeCacheKeyCallBacks.release = v4;
  *(_OWORD *)&self->_stringSizeCacheKeyCallBacks.equal = v3;
}

@end