@interface PLPositionalBGRAImageTable
+ (__CFString)colorSpaceName;
+ (unint64_t)metalPixelFormat;
- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4;
- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6;
@end

@implementation PLPositionalBGRAImageTable

+ (__CFString)colorSpaceName
{
  return (__CFString *)*MEMORY[0x1E4F1DC98];
}

+ (unint64_t)metalPixelFormat
{
  return 43;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  if (self->super.super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  else if (self->super.super._entryCapacity <= a4)
  {
    return 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v20 = 0;
  v6 = (void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
  if (!v6) {
    return 0;
  }
  v7 = v6;
  if (![(PLPositionalImageTable *)self readImageDataAtIndex:a4 intoPoolNode:v6 bytesRead:&v20 imageWidth:(char *)&v24 + 4 imageHeight:&v24 imageDataWidth:(char *)&v23 + 4 imageDataHeight:&v23 startingOffset:&v21 bytesPerRow:&v22 uuidBytes:0])
  {
    PLPositionalTableMemoryPool_Free(v7);
    return 0;
  }
  unint64_t v8 = [(PLPositionalTable *)self entryLength];
  size_t v10 = (int)v24;
  size_t v9 = SHIDWORD(v24);
  size_t v11 = [(PLPositionalImageTable *)self formatMaxBytesPerRow];
  uint64_t v12 = v21;
  v13 = self;
  if (_create5551BGRACGImageFromTableEntryNode_s_onceToken != -1) {
    dispatch_once(&_create5551BGRACGImageFromTableEntryNode_s_onceToken, &__block_literal_global_11431);
  }
  if (*v7)
  {
    v14 = (char *)*v7 + v12;
    size_t v15 = v8 - v12 - 28;
    v16 = (id *)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
    id *v16 = v7;
    objc_storeStrong(v16 + 1, self);
    v17 = CGDataProviderCreateWithData(v16, v14, v15, (CGDataProviderReleaseDataCallback)_freeCGImageDataProviderBuffer);
    v18 = CGImageCreate(v9, v10, 5uLL, 0x10uLL, v11, (CGColorSpaceRef)_create5551BGRACGImageFromTableEntryNode_s_colorSpace, 0x1006u, v17, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6
{
  uint64_t v11 = [(PLPositionalImageTable *)self formatSideLen];
  if ([(PLPositionalImageTable *)self formatIsCropped])
  {
    int64_t v12 = 0;
  }
  else
  {
    unsigned int var1 = a6->var1;
    BOOL v14 = v11 >= var1;
    unsigned int v15 = v11 - var1;
    if (v15 != 0 && v14) {
      int64_t v12 = [(PLPositionalImageTable *)self formatBytesPerPixel] * (v15 >> 1);
    }
    else {
      int64_t v12 = 0;
    }
    if (a6->var2 < v11)
    {
      v16 = [(PLPositionalImageTable *)self format];
      uint64_t v17 = [v16 tableFormatBytesPerRowForWidth:v11];

      v12 += v17 * ((v11 - a6->var2 + 1) >> 1);
    }
  }
  CGFloat v18 = (double)[(PLPositionalImageTable *)self formatSideLen];
  *a3 = v12;
  *a5 = [(PLPositionalImageTable *)self formatMaxBytesPerRow];
  a4->width = v18;
  a4->height = v18;
}

@end