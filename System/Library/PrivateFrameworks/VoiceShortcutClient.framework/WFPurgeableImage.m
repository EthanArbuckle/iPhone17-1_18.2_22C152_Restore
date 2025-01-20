@interface WFPurgeableImage
- (CGImage)copyImage;
- (WFPurgeableImage)initWithCGImage:(CGImage *)a3;
- (id)description;
- (void)accessImageContext:(id)a3;
- (void)dealloc;
@end

@implementation WFPurgeableImage

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    CGFloat width = self->_size.width;
    CGFloat height = self->_size.height;
    bytes = self->_bytes;
  }
  else
  {
    bytes = 0;
    CGFloat height = 0.0;
    CGFloat width = 0.0;
  }
  v9 = bytes;
  uint64_t v10 = [(NSPurgeableData *)v9 length];
  if (self) {
    v11 = self->_bytes;
  }
  else {
    v11 = 0;
  }
  v12 = [v3 stringWithFormat:@"<%@ %p, size: %f x %f, bytes: %lu, discarded: %d>", v5, self, *(void *)&width, *(void *)&height, v10, -[NSPurgeableData isContentDiscarded](v11, "isContentDiscarded")];

  return v12;
}

- (void)accessImageContext:(id)a3
{
  v11 = (void (**)(id, CGContext *))a3;
  if (self)
  {
    bytes = self->_bytes;
    if (bytes) {
      goto LABEL_5;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F28FB8]);
    unint64_t v6 = (unint64_t)(self->_size.height * (double)self->_bytesPerRow);
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28FB8]);
    unint64_t v6 = 0;
  }
  v7 = (NSPurgeableData *)[v5 initWithLength:v6];
  v8 = self->_bytes;
  self->_bytes = v7;

  bytes = self->_bytes;
LABEL_5:
  if ([(NSPurgeableData *)bytes beginContentAccess])
  {
    v9 = self->_bytes;
    uint64_t v10 = CGBitmapContextCreate((void *)[(NSPurgeableData *)v9 mutableBytes], (unint64_t)self->_size.width, (unint64_t)self->_size.height, self->_bitsPerComponent, self->_bytesPerRow, self->_colorSpace, self->_bitmapInfo);

    CGContextTranslateCTM(v10, 0.0, -self->_size.height);
    v11[2](v11, v10);
    CGContextRelease(v10);
    [(NSPurgeableData *)self->_bytes endContentAccess];
  }
  else
  {
    v11[2](v11, 0);
  }
}

- (CGImage)copyImage
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__WFPurgeableImage_copyImage__block_invoke;
  v5[3] = &unk_1E60792C8;
  v5[4] = &v6;
  [(WFPurgeableImage *)self accessImageContext:v5];
  v2 = (const void *)v7[3];
  if (v2) {
    v3 = (CGImage *)CFAutorelease(v2);
  }
  else {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

CGImageRef __29__WFPurgeableImage_copyImage__block_invoke(CGImageRef result, CGContextRef context)
{
  if (context)
  {
    uint64_t v2 = (uint64_t)result;
    result = CGBitmapContextCreateImage(context);
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)WFPurgeableImage;
  [(WFPurgeableImage *)&v3 dealloc];
}

- (WFPurgeableImage)initWithCGImage:(CGImage *)a3
{
  if (!a3)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFImageCache.m", 41, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFPurgeableImage;
  id v5 = [(WFPurgeableImage *)&v20 init];
  if (!v5
    || ((double Width = (double)CGImageGetWidth(a3),
         double Height = (double)CGImageGetHeight(a3),
         ColorSpace = CGImageGetColorSpace(a3),
         CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(a3),
         size_t BytesPerRow = CGImageGetBytesPerRow(a3),
         size_t BitsPerComponent = CGImageGetBitsPerComponent(a3),
         *MEMORY[0x1E4F1DB30] == Width)
      ? (BOOL v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == Height)
      : (BOOL v12 = 0),
        v12))
  {
    v14 = 0;
  }
  else
  {
    size_t v13 = BitsPerComponent;
    v14 = 0;
    if ((ColorSpace || (BitmapInfo & 0x1F) == 7) && BitsPerComponent && BytesPerRow)
    {
      v5->_size.CGFloat width = Width;
      v5->_size.CGFloat height = Height;
      CGColorSpaceRef v15 = CGColorSpaceRetain(ColorSpace);
      v5->_bitmapInfo = BitmapInfo;
      v5->_colorSpace = v15;
      v5->_bitsPerComponent = v13;
      v5->_bytesPerRow = BytesPerRow;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __36__WFPurgeableImage_initWithCGImage___block_invoke;
      v19[3] = &__block_descriptor_56_e20_v16__0__CGContext__8l;
      *(double *)&v19[4] = Width;
      *(double *)&v19[5] = Height;
      v19[6] = a3;
      [(WFPurgeableImage *)v5 accessImageContext:v19];
      v14 = v5;
    }
  }

  return v14;
}

void __36__WFPurgeableImage_initWithCGImage___block_invoke(uint64_t a1, CGContextRef c)
{
  v2.size.CGFloat width = *(CGFloat *)(a1 + 32);
  v2.size.CGFloat height = *(CGFloat *)(a1 + 40);
  v2.origin.x = 0.0;
  v2.origin.y = 0.0;
  CGContextDrawImage(c, v2, *(CGImageRef *)(a1 + 48));
}

@end