@interface FxBitmapImage
+ (id)bitmapWithData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7;
+ (id)bitmapWithSize:(CGSize)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5;
- (CGColorSpace)colorSpace;
- (CGContext)cgContext;
- (CGImage)cgImage;
- (CGSize)size;
- (FxBitmapImage)initWithData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7;
- (id)data;
- (int)pixelFormat;
- (unint64_t)bytesPerRow;
- (void)bytes;
- (void)dealloc;
@end

@implementation FxBitmapImage

- (FxBitmapImage)initWithData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  v18.receiver = self;
  v18.super_class = (Class)FxBitmapImage;
  v13 = [(FxBitmapImage *)&v18 init];
  if (v13)
  {
    v14 = (FxBitmapImagePriv *)malloc_type_calloc(1uLL, 0x48uLL, 0x10A0040171D60F0uLL);
    v13->_priv = v14;
    if (v14)
    {
      id v15 = a3;
      priv = v13->_priv;
      priv->var0 = v15;
      priv->var1 = a4;
      priv->var2.CGFloat width = width;
      priv->var2.CGFloat height = height;
      priv->var3 = a6;
      v13->_priv->var4 = CGColorSpaceRetain(a7);
      v13->_priv->var7 = CGDataProviderCreateWithData(v13->_priv->var0, [(FxBitmapImage *)v13 bytes], (unint64_t)(v13->_priv->var2.height * (double)v13->_priv->var1), (CGDataProviderReleaseDataCallback)MyDataProviderReleaser);
      CGDataProviderRetain(v13->_priv->var7);
    }
  }
  return v13;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var4)
    {
      CGColorSpaceRelease(priv->var4);
      priv = self->_priv;
    }
    if (priv->var5)
    {
      CGContextRelease(priv->var5);
      priv = self->_priv;
    }
    if (priv->var6)
    {
      CGImageRelease(priv->var6);
      priv = self->_priv;
    }
    if (priv->var7)
    {
      CGDataProviderRelease(priv->var7);
      priv = self->_priv;
    }
    free(priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxBitmapImage;
  [(FxBitmapImage *)&v10 dealloc];
}

+ (id)bitmapWithData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7
{
  uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:bytesPerRow:size:format:colorSpace:", a3, a4, *(void *)&a6, a7, a5.width, a5.height);

  return v7;
}

+ (id)bitmapWithSize:(CGSize)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5
{
  double width = a3.width;
  double v6 = 16.0;
  if (!a4) {
    double v6 = 4.0;
  }
  uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:bytesPerRow:size:format:colorSpace:", objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", (unint64_t)(a3.height * (double)((unint64_t)(width * v6 + 7.0) & 0xFFFFFFFFFFFFFFF8))), (unint64_t)(width * v6 + 7.0) & 0xFFFFFFFFFFFFFFF8, *(void *)&a4, a5, width, a3.height);

  return v7;
}

- (id)data
{
  return self->_priv->var0;
}

- (void)bytes
{
  return (void *)[self->_priv->var0 mutableBytes];
}

- (unint64_t)bytesPerRow
{
  return self->_priv->var1;
}

- (CGSize)size
{
  priv = self->_priv;
  double width = priv->var2.width;
  double height = priv->var2.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)pixelFormat
{
  return self->_priv->var3;
}

- (CGColorSpace)colorSpace
{
  return self->_priv->var4;
}

- (CGContext)cgContext
{
  priv = self->_priv;
  if (!priv->var5)
  {
    int var3 = priv->var3;
    if (FxDebugAssert(var3 == 0, &cfstr_32BitFloatRgba.isa, v2, v3, v4, v5, v6, v7, v15))
    {
      BOOL v11 = var3 == 0;
      if (var3) {
        size_t v12 = 32;
      }
      else {
        size_t v12 = 8;
      }
      if (v11) {
        uint32_t v13 = 2;
      }
      else {
        uint32_t v13 = 257;
      }
      self->_priv->var5 = CGBitmapContextCreate([(FxBitmapImage *)self bytes], (unint64_t)self->_priv->var2.width, (unint64_t)self->_priv->var2.height, v12, self->_priv->var1, self->_priv->var4, v13);
      CGContextRetain(self->_priv->var5);
    }
  }
  return self->_priv->var5;
}

- (CGImage)cgImage
{
  priv = self->_priv;
  if (!priv->var6)
  {
    int var3 = priv->var3;
    int v11 = FxDebugAssert(var3 == 0, &cfstr_32BitFloatRgba.isa, v2, v3, v4, v5, v6, v7, decode);
    priv = self->_priv;
    if (v11)
    {
      if (var3) {
        size_t v12 = 128;
      }
      else {
        size_t v12 = 32;
      }
      if (var3) {
        size_t v13 = 32;
      }
      else {
        size_t v13 = 8;
      }
      if (var3) {
        CGBitmapInfo v14 = 257;
      }
      else {
        CGBitmapInfo v14 = 2;
      }
      self->_priv->var6 = CGImageCreate((unint64_t)priv->var2.width, (unint64_t)priv->var2.height, v13, v12, priv->var1, priv->var4, v14, priv->var7, 0, 1, kCGRenderingIntentDefault);
      CGImageRetain(self->_priv->var6);
      priv = self->_priv;
    }
  }
  return priv->var6;
}

@end