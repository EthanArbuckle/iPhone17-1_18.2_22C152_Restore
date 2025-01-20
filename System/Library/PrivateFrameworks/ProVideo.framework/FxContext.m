@interface FxContext
+ (id)contextForCGImageWithOptions:(id)a3;
+ (id)contextForCIImageWithOptions:(id)a3;
+ (id)contextForGLTextureWithOptions:(id)a3;
+ (id)contextWithCGContext:(CGContext *)a3 options:(id)a4;
+ (id)contextWithFxBitmapImage:(id)a3 options:(id)a4;
- (BOOL)glTextureIsFlipped;
- (CGColorSpace)glTextureColorSpace;
- (CGContext)cgContext;
- (CGImage)cgImage;
- (CGSize)glTextureSize;
- (FxContext)initWithCGContext:(CGContext *)a3 options:(id)a4;
- (FxContext)initWithFxBitmapImage:(id)a3 options:(id)a4;
- (id)bitmap;
- (id)ciImage;
- (id)derivedCIContext;
- (id)initForCGImageWithOptions:(id)a3;
- (id)initForCIImageWithOptions:(id)a3;
- (id)initForGLTextureWithOptions:(id)a3;
- (id)options;
- (int)contextType;
- (unint64_t)glTexture;
- (void)dealloc;
- (void)drawFxSample:(id)a3 withRegionOfInterest:(id)a4;
- (void)setCGImage:(CGImage *)a3;
- (void)setCIImage:(id)a3;
- (void)setGLTexture:(unint64_t)a3 size:(CGSize)a4 flipped:(BOOL)a5 colorSpace:(CGColorSpace *)a6;
- (void)setOptions:(id)a3;
@end

@implementation FxContext

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v20.receiver);
  priv = self->_priv;
  if (priv)
  {
    switch(priv->var0)
    {
      case 0:
        FxDebugAssert(0, &cfstr_InvalidContext.isa, v9, v10, v11, v12, v13, v14, (char)v20.receiver);
        break;
      case 1:
        var0 = priv->var2.var0.var0;
        if (var0) {
          CGImageRelease(var0);
        }
        break;
      case 2:
        v18 = priv->var2.var0.var0;
        if (v18) {
          CGContextRelease(v18);
        }
        break;
      case 3:
        var3 = priv->var2.var2.var3;
        if (var3) {
          CGColorSpaceRelease(var3);
        }
        break;
      case 4:
      case 5:
      case 6:
        v16 = priv->var2.var0.var0;
        if (v16) {

        }
        break;
      default:
        break;
    }
    free(self->_priv);
  }
  v20.receiver = self;
  v20.super_class = (Class)FxContext;
  [(FxContext *)&v20 dealloc];
}

- (id)initForCGImageWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FxContext;
  uint64_t v4 = [(FxContext *)&v7 init];
  if (v4)
  {
    uint64_t v5 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5->var0 = 1;
      v5->var2.var2.var0 = 0;
      v4->_priv->var1 = a3;
    }
  }
  return v4;
}

- (FxContext)initWithCGContext:(CGContext *)a3 options:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FxContext;
  uint64_t v6 = [(FxContext *)&v9 init];
  if (v6)
  {
    objc_super v7 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v6->_priv = v7;
    if (v7)
    {
      v7->var0 = 2;
      v6->_priv->var2.var2.var0 = (unint64_t)CGContextRetain(a3);
      v6->_priv->var1 = a4;
    }
  }
  return v6;
}

- (id)initForGLTextureWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FxContext;
  uint64_t v4 = [(FxContext *)&v7 init];
  if (v4)
  {
    uint64_t v5 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5->var0 = 3;
      v5->var2.var2.var0 = 0;
      *(_OWORD *)(&v4->_priv->var2.var5 + 1) = *MEMORY[0x1E4F1DB30];
      v4->_priv->var2.var2.var2 = 0;
      v4->_priv->var2.var2.var3 = 0;
      v4->_priv->var1 = a3;
    }
  }
  return v4;
}

- (FxContext)initWithFxBitmapImage:(id)a3 options:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FxContext;
  uint64_t v6 = [(FxContext *)&v9 init];
  if (v6)
  {
    objc_super v7 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v6->_priv = v7;
    if (v7)
    {
      v7->var0 = 5;
      v6->_priv->var2.var2.var0 = (unint64_t)a3;
      v6->_priv->var1 = a4;
    }
  }
  return v6;
}

- (id)initForCIImageWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FxContext;
  uint64_t v4 = [(FxContext *)&v7 init];
  if (v4)
  {
    uint64_t v5 = (FxContextPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A204022D66DCFuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5->var0 = 6;
      v5->var2.var2.var0 = 0;
      v4->_priv->var1 = a3;
    }
  }
  return v4;
}

+ (id)contextForCGImageWithOptions:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initForCGImageWithOptions:a3];

  return v3;
}

+ (id)contextWithCGContext:(CGContext *)a3 options:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCGContext:a3 options:a4];

  return v4;
}

+ (id)contextForGLTextureWithOptions:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initForGLTextureWithOptions:a3];

  return v3;
}

+ (id)contextWithFxBitmapImage:(id)a3 options:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFxBitmapImage:a3 options:a4];

  return v4;
}

+ (id)contextForCIImageWithOptions:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initForCIImageWithOptions:a3];

  return v3;
}

- (void)setCGImage:(CGImage *)a3
{
  if (FxDebugAssert(self->_priv->var0 == 1, &cfstr_NonCgimageFxco.isa, (uint64_t)a3, v3, v4, v5, v6, v7, v11))
  {
    var0 = self->_priv->var2.var0.var0;
    if (var0) {
      CGImageRelease(var0);
    }
    self->_priv->var2.var2.var0 = (unint64_t)CGImageRetain(a3);
  }
}

- (CGImage)cgImage
{
  if (FxDebugAssert(self->_priv->var0 == 1, &cfstr_NonCgimageFxco_0.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var0.var0;
  }
  else {
    return 0;
  }
}

- (CGContext)cgContext
{
  if (FxDebugAssert(self->_priv->var0 == 2, &cfstr_NonCgcontextFx.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var0.var0;
  }
  else {
    return 0;
  }
}

- (void)setGLTexture:(unint64_t)a3 size:(CGSize)a4 flipped:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  if (FxDebugAssert(self->_priv->var0 == 3, &cfstr_NonGltextureFx.isa, a3, a5, (uint64_t)a6, v6, v7, v8, v19))
  {
    priv = self->_priv;
    var3 = priv->var2.var2.var3;
    if (var3)
    {
      CGColorSpaceRelease(var3);
      priv = self->_priv;
    }
    priv->var2.var2.var0 = a3;
    v17 = self->_priv;
    v17->var2.var2.var1.CGFloat width = width;
    v17->var2.var2.var1.CGFloat height = height;
    v17->var2.var2.var2 = a5;
    if (a6) {
      v18 = CGColorSpaceRetain(a6);
    }
    else {
      v18 = 0;
    }
    self->_priv->var2.var2.var3 = v18;
  }
}

- (unint64_t)glTexture
{
  if (FxDebugAssert(self->_priv->var0 == 3, &cfstr_NonGltextureFx_0.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var2.var0;
  }
  else {
    return 0;
  }
}

- (CGSize)glTextureSize
{
  int v9 = FxDebugAssert(self->_priv->var0 == 3, &cfstr_NonGltextureFx_1.isa, v2, v3, v4, v5, v6, v7, v13);
  double width = 0.0;
  double height = 0.0;
  if (v9)
  {
    priv = self->_priv;
    double width = priv->var2.var2.var1.width;
    double height = priv->var2.var2.var1.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)glTextureIsFlipped
{
  int v9 = FxDebugAssert(self->_priv->var0 == 3, &cfstr_NonGltextureFx_2.isa, v2, v3, v4, v5, v6, v7, v11);
  if (v9) {
    LOBYTE(v9) = self->_priv->var2.var2.var2;
  }
  return v9;
}

- (CGColorSpace)glTextureColorSpace
{
  if (FxDebugAssert(self->_priv->var0 == 3, &cfstr_NonGltextureFx_3.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var2.var3;
  }
  else {
    return 0;
  }
}

- (id)derivedCIContext
{
  if (FxDebugAssert(self->_priv->var0 == 4, &cfstr_NonGlcontextFx.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var0.var0;
  }
  else {
    return 0;
  }
}

- (void)setCIImage:(id)a3
{
  if (FxDebugAssert(self->_priv->var0 == 6, &cfstr_NonCiimageFxco.isa, (uint64_t)a3, v3, v4, v5, v6, v7, v11))
  {
    var0 = self->_priv->var2.var0.var0;
    if (var0) {

    }
    self->_priv->var2.var2.var0 = (unint64_t)a3;
  }
}

- (id)ciImage
{
  if (FxDebugAssert(self->_priv->var0 == 6, &cfstr_NonCiimageFxco_0.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var0.var0;
  }
  else {
    return 0;
  }
}

- (id)bitmap
{
  if (FxDebugAssert(self->_priv->var0 == 5, &cfstr_NonBitmapFxcon.isa, v2, v3, v4, v5, v6, v7, v10)) {
    return self->_priv->var2.var0.var0;
  }
  else {
    return 0;
  }
}

- (void)drawFxSample:(id)a3 withRegionOfInterest:(id)a4
{
  [a3 setRegionOfInterest:a4];
  [a3 setContext:self];

  [a3 evaluateWithOptions:0];
}

- (int)contextType
{
  return self->_priv->var0;
}

- (id)options
{
  return self->_priv->var1;
}

- (void)setOptions:(id)a3
{
  id var1 = self->_priv->var1;
  if (var1) {

  }
  self->_priv->id var1 = a3;
}

@end