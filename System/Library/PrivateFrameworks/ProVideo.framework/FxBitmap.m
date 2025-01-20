@interface FxBitmap
+ (void)setGuaranteeMemoryCallback:(void *)a3;
- (BOOL)_ownsData;
- (BOOL)_verifyImage;
- (FxBitmap)init;
- (FxBitmap)initWithCopy:(id)a3;
- (FxBitmap)initWithCopy:(id)a3 andInfo:(id *)a4;
- (FxBitmap)initWithCopy:(id)a3 andInfo:(id *)a4 andRowBytes:(unint64_t)a5;
- (FxBitmap)initWithInfo:(id *)a3;
- (FxBitmap)initWithInfo:(id *)a3 andData:(void *)a4;
- (FxBitmap)initWithInfo:(id *)a3 rowBytes:(unint64_t)a4 andData:(void *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_packedRowBytes;
- (unint64_t)rowBytes;
- (void)_setOwned:(BOOL)a3;
- (void)_setOwnedDataPtr:(void *)a3;
- (void)dataPtr;
- (void)dataPtrForPositionX:(unint64_t)a3 Y:(unint64_t)a4;
- (void)dealloc;
- (void)setRowBytes:(unint64_t)a3;
@end

@implementation FxBitmap

- (unint64_t)_packedRowBytes
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)FxBitmap;
  [(FxImage *)&v6 imageInfo];
  v5.receiver = self;
  v5.super_class = (Class)FxBitmap;
  unint64_t v3 = [(FxImage *)&v5 depth];
  return 4 * v7 * (v3 >> 3);
}

- (FxBitmap)init
{
  v5.receiver = self;
  v5.super_class = (Class)FxBitmap;
  result = [(FxImage *)&v5 init];
  if (result)
  {
    unint64_t v3 = result;
    v4 = (FxBitmapPriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEB90DD3uLL);
    v3->_bitmapPriv = v4;
    if (v4) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (FxBitmap)initWithInfo:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var6;
  v15[2] = *(_OWORD *)&a3->var4;
  v15[3] = v4;
  double var8 = a3->var8;
  long long v5 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v5;
  v14.receiver = self;
  v14.super_class = (Class)FxBitmap;
  objc_super v6 = [(FxImage *)&v14 initWithInfo:v15];
  long long v7 = v6;
  if (v6)
  {
    bitmapPriv = v6->_bitmapPriv;
    if (bitmapPriv
      || (bitmapPriv = (FxBitmapPriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEB90DD3uLL),
          (v7->_bitmapPriv = bitmapPriv) != 0))
    {
      bitmapPriv->var2 = 1;
      uint64_t v9 = [(FxBitmap *)v7 _packedRowBytes];
      v7->_bitmapPriv->var1 = v9;
      unint64_t v10 = a3->var1 * v9;
      if (v10 <= 0x32000) {
        size_t v11 = a3->var1 * v9;
      }
      else {
        size_t v11 = (v10 + 0xFFFF) & 0xFFFFFFFFFFFF0000;
      }
      v7->_bitmapPriv->var0 = malloc_type_malloc(v11, 0x61D1B2F2uLL);
      if (v7->_bitmapPriv->var0) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = guaranteeMemory == 0;
      }
      if (!v12)
      {
        guaranteeMemory(v11);
        v7->_bitmapPriv->var0 = malloc_type_malloc(v11, 0x89ED93C5uLL);
      }
    }
  }
  return v7;
}

- (FxBitmap)initWithInfo:(id *)a3 andData:(void *)a4
{
  long long v5 = *(_OWORD *)&a3->var6;
  v12[2] = *(_OWORD *)&a3->var4;
  v12[3] = v5;
  double var8 = a3->var8;
  long long v6 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v6;
  v11.receiver = self;
  v11.super_class = (Class)FxBitmap;
  long long v7 = [(FxImage *)&v11 initWithInfo:v12];
  long long v8 = v7;
  if (v7)
  {
    bitmapPriv = v7->_bitmapPriv;
    if (bitmapPriv
      || (bitmapPriv = (FxBitmapPriv *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEB90DD3uLL),
          (v8->_bitmapPriv = bitmapPriv) != 0))
    {
      bitmapPriv->var0 = a4;
      v8->_bitmapPriv->var2 = 0;
      v8->_bitmapPriv->var1 = [(FxBitmap *)v8 _packedRowBytes];
    }
  }
  return v8;
}

- (FxBitmap)initWithInfo:(id *)a3 rowBytes:(unint64_t)a4 andData:(void *)a5
{
  long long v6 = *(_OWORD *)&a3->var6;
  v10[2] = *(_OWORD *)&a3->var4;
  v10[3] = v6;
  double var8 = a3->var8;
  long long v7 = *(_OWORD *)&a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v7;
  result = [(FxBitmap *)self initWithInfo:v10 andData:a5];
  if (result)
  {
    bitmapPriv = result->_bitmapPriv;
    if (bitmapPriv) {
      bitmapPriv->var1 = a4;
    }
  }
  return result;
}

- (FxBitmap)initWithCopy:(id)a3
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  if (a3) {
    [a3 imageInfo];
  }
  v5[2] = v9;
  v5[3] = v10;
  uint64_t v6 = v11;
  v5[0] = v7;
  v5[1] = v8;
  return [(FxBitmap *)self initWithInfo:v5];
}

- (FxBitmap)initWithCopy:(id)a3 andInfo:(id *)a4 andRowBytes:(unint64_t)a5
{
}

- (FxBitmap)initWithCopy:(id)a3 andInfo:(id *)a4
{
  unint64_t v7 = [(FxBitmap *)self _packedRowBytes];
  long long v8 = *(_OWORD *)&a4->var6;
  v11[2] = *(_OWORD *)&a4->var4;
  v11[3] = v8;
  double var8 = a4->var8;
  long long v9 = *(_OWORD *)&a4->var2;
  v11[0] = *(_OWORD *)&a4->var0;
  v11[1] = v9;
  return [(FxBitmap *)self initWithCopy:a3 andInfo:v11 andRowBytes:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = [+[FxBitmap allocWithZone:a3] initWithCopy:self];
  long long v5 = v4;
  if (v4)
  {
    if (!v4->_bitmapPriv) {
      goto LABEL_10;
    }
    unint64_t v6 = [(FxBitmap *)self rowBytes];
    bitmapPriv = v5->_bitmapPriv;
    bitmapPriv->var1 = v6;
    bitmapPriv->var2 = 1;
    unint64_t v8 = [(FxImage *)self height];
    size_t v9 = [(FxBitmap *)self rowBytes] * v8;
    v5->_bitmapPriv->var0 = malloc_type_malloc(v9, 0x3D0F1567uLL);
    var0 = v5->_bitmapPriv->var0;
    if (!var0 && guaranteeMemory != 0)
    {
      guaranteeMemory(v9);
      v5->_bitmapPriv->var0 = malloc_type_malloc(v9, 0x13709DBFuLL);
      var0 = v5->_bitmapPriv->var0;
    }
    if (var0)
    {
      memcpy([(FxBitmap *)v5 dataPtr], [(FxBitmap *)self dataPtr], v9);
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  bitmapPriv = self->_bitmapPriv;
  if (bitmapPriv)
  {
    if (bitmapPriv->var2 && bitmapPriv->var0)
    {
      free(bitmapPriv->var0);
      bitmapPriv = self->_bitmapPriv;
    }
    free(bitmapPriv);
  }
  v4.receiver = self;
  v4.super_class = (Class)FxBitmap;
  [(FxImage *)&v4 dealloc];
}

- (void)dataPtr
{
  return self->_bitmapPriv->var0;
}

- (void)dataPtrForPositionX:(unint64_t)a3 Y:(unint64_t)a4
{
  if (!self->_bitmapPriv->var0) {
    return 0;
  }
  uint64_t v7 = [(FxImage *)self depth];
  var0 = (char *)self->_bitmapPriv->var0;
  return &var0[((int)(v7 >> 1) & 0xFFFFFFFFFFFFFFFCLL) * a3 + [(FxBitmap *)self rowBytes] * a4];
}

- (void)setRowBytes:(unint64_t)a3
{
  self->_bitmapPriv->var1 = a3;
}

- (unint64_t)rowBytes
{
  return self->_bitmapPriv->var1;
}

+ (void)setGuaranteeMemoryCallback:(void *)a3
{
  guaranteeMemory = a3;
}

- (BOOL)_verifyImage
{
  v6.receiver = self;
  v6.super_class = (Class)FxBitmap;
  BOOL v3 = [(FxImage *)&v6 _verifyImage];
  if (v3)
  {
    bitmapPriv = self->_bitmapPriv;
    if (bitmapPriv)
    {
      if (bitmapPriv->var0 && bitmapPriv->var1)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      NSLog(&cfstr_FxbitmapVerify_0.isa);
    }
    else
    {
      NSLog(&cfstr_FxbitmapVerify.isa);
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_ownsData
{
  return self->_bitmapPriv->var2;
}

- (void)_setOwnedDataPtr:(void *)a3
{
  bitmapPriv = self->_bitmapPriv;
  if (bitmapPriv->var2 && bitmapPriv->var0)
  {
    free(bitmapPriv->var0);
    bitmapPriv = self->_bitmapPriv;
  }
  bitmapPriv->var0 = a3;
  self->_bitmapPriv->var2 = 1;
}

- (void)_setOwned:(BOOL)a3
{
  self->_bitmapPriv->var2 = a3;
}

@end