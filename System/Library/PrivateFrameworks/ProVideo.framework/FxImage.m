@interface FxImage
+ (id)alloc;
+ (void)setColorSpaceVendor:(void *)a3;
- ($FB0B61818339023072F3326201ECEE09)imageInfo;
- (BOOL)_verifyImage;
- (BOOL)containsPointX:(int)a3 Y:(int)a4;
- (BOOL)isPremultiplied;
- (CGColorSpace)colorSpace;
- (CGRect)bounds;
- (FxImage)init;
- (FxImage)initWithInfo:(id *)a3;
- (FxRect)dod;
- (double)pixelAspect;
- (double)scaleX;
- (double)scaleY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inversePixelTransform;
- (id)pixelTransform;
- (int)eyeType;
- (unint64_t)bytes;
- (unint64_t)colorInfo;
- (unint64_t)depth;
- (unint64_t)dynamicRangeType;
- (unint64_t)field;
- (unint64_t)fieldOrder;
- (unint64_t)fxColorPrimaries;
- (unint64_t)height;
- (unint64_t)imageType;
- (unint64_t)nclcValue;
- (unint64_t)numActiveChannels;
- (unint64_t)origin;
- (unint64_t)pixelFormat;
- (unint64_t)size;
- (unint64_t)version;
- (unint64_t)width;
- (void)dealloc;
- (void)fxColorPrimaries;
- (void)setBounds:(CGRect)a3;
- (void)setBytes:(unint64_t)a3;
- (void)setColorInfo:(unint64_t)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setDeallocCallback:(void *)a3 refcon:(void *)a4;
- (void)setDepth:(unint64_t)a3;
- (void)setDod:(FxRect)a3;
- (void)setDynamicRangeType:(unint64_t)a3;
- (void)setEyeType:(int)a3;
- (void)setField:(unint64_t)a3;
- (void)setFieldOrder:(unint64_t)a3;
- (void)setFxColorPrimaries:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setImageType:(unint64_t)a3;
- (void)setIsPremultiplied:(BOOL)a3;
- (void)setNCLCValue:(unint64_t)a3;
- (void)setNumActiveChannels:(unint64_t)a3;
- (void)setOrigin:(unint64_t)a3;
- (void)setPixelAspect:(double)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setPixelTransform:(id)a3;
- (void)setScaleX:(double)a3;
- (void)setScaleY:(double)a3;
- (void)setWidth:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3 andHeight:(unint64_t)a4;
@end

@implementation FxImage

+ (id)alloc
{
  if ((id)objc_opt_class() == a1)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = NSStringFromSelector(a2);
    [v5 raise:v6, @"*** %@ sent to abstract class %@. Use a subclass instead.", v7, objc_opt_class() format];
    return 0;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___FxImage;
    return objc_msgSendSuper2(&v8, sel_alloc);
  }
}

- (FxImage)init
{
  v11.receiver = self;
  v11.super_class = (Class)FxImage;
  result = [(FxImage *)&v11 init];
  if (result)
  {
    v3 = result;
    result = (FxImage *)operator new(0xD0uLL, MEMORY[0x1E4FBA2D0]);
    v4 = result;
    if (result)
    {
      result->super.isa = 0;
      result->_imagePriv = 0;
      result[1] = (FxImage)xmmword_1B8377930;
      result[2].super.isa = 0;
      result[2]._imagePriv = 0;
      result[3].super.isa = (Class)2;
      LOBYTE(result[3]._imagePriv) = 1;
      result[4]._imagePriv = 0;
      result[5].super.isa = 0;
      result[4].super.isa = (Class)0x3FF0000000000000;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&result[5]._imagePriv = _Q0;
      result[7].super.isa = 0;
      result[7]._imagePriv = 0;
      result[6]._imagePriv = (FxImagePriv *)65792;
      FxImage v10 = *(FxImage *)(MEMORY[0x1E4F1DB28] + 16);
      result[8] = *(FxImage *)MEMORY[0x1E4F1DB28];
      result[9] = v10;
      result[10].super.isa = 0;
      result[10]._imagePriv = 0;
      result[11].super.isa = (Class)objc_alloc_init(FxMatrix44);
      v4[11]._imagePriv = 0;
      LODWORD(v4[12].super.isa) = 0;
      result = v3;
      v4[12]._imagePriv = 0;
    }
    v3->_imagePriv = (FxImagePriv *)v4;
  }
  return result;
}

- (FxImage)initWithInfo:(id *)a3
{
  result = [(FxImage *)self init];
  if (result)
  {
    imagePriv = result->_imagePriv;
    if (imagePriv)
    {
      *(_OWORD *)&imagePriv->var0.int var0 = *(_OWORD *)&a3->var0;
      long long v6 = *(_OWORD *)&a3->var2;
      long long v7 = *(_OWORD *)&a3->var4;
      long long v8 = *(_OWORD *)&a3->var6;
      imagePriv->var0.var8 = a3->var8;
      *(_OWORD *)&imagePriv->var0.var4 = v7;
      *(_OWORD *)&imagePriv->var0.var6 = v8;
      *(_OWORD *)&imagePriv->var0.var2 = v6;
      int var0 = a3->var0;
      if (SLODWORD(a3->var0) >= 0) {
        int v10 = a3->var0;
      }
      else {
        int v10 = var0 + 1;
      }
      objc_super v11 = result->_imagePriv;
      int var1 = a3->var1;
      if (var1 >= 0) {
        int v13 = a3->var1;
      }
      else {
        int v13 = var1 + 1;
      }
      v11->var9.int var0 = -(v10 >> 1);
      v11->var9.int var1 = -(v13 >> 1);
      v11->var9.var2 = var0 - (v10 >> 1);
      v11->var9.var3 = var1 - (v13 >> 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[FxImage allocWithZone:a3];
  if (self)
  {
    [(FxImage *)self imageInfo];
  }
  else
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  v5 = [(FxImage *)v4 initWithInfo:v12];
  imagePriv = self->_imagePriv;
  long long v7 = v5->_imagePriv;
  *(_OWORD *)&v7->int var1 = *(_OWORD *)&imagePriv->var1;
  *(_OWORD *)&v7->var3 = *(_OWORD *)&imagePriv->var3;
  v7->var5 = imagePriv->var5;
  v7->var11 = imagePriv->var11;
  CGColorSpaceRetain(self->_imagePriv->var11);
  v5->_imagePriv->var6 = self->_imagePriv->var6;
  v5->_imagePriv->var7 = self->_imagePriv->var7;
  long long v8 = self->_imagePriv;
  v9 = v5->_imagePriv;
  CGSize size = v8->var8.size;
  v9->var8.origin = v8->var8.origin;
  v9->var8.CGSize size = size;
  v5->_imagePriv->var9 = self->_imagePriv->var9;
  v5->_imagePriv->var10 = [[FxMatrix44 alloc] initWithFxMatrix:self->_imagePriv->var10];
  return v5;
}

- (void)dealloc
{
  imagePriv = self->_imagePriv;
  if (imagePriv)
  {
    var6 = (void (*)(void *, SEL))imagePriv->var6;
    if (!var6 || (var6(imagePriv->var7, a2), (imagePriv = self->_imagePriv) != 0))
    {

      CGColorSpaceRelease(self->_imagePriv->var11);
      v5 = self->_imagePriv;
      if (v5) {
        MEMORY[0x1BA9BFBA0](v5, 0x10A0C4053556ED8);
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FxImage;
  [(FxImage *)&v6 dealloc];
}

- ($FB0B61818339023072F3326201ECEE09)imageInfo
{
  unint64_t var1 = self->var1;
  long long v4 = *(_OWORD *)(var1 + 48);
  *(_OWORD *)&retstr->var4 = *(_OWORD *)(var1 + 32);
  *(_OWORD *)&retstr->var6 = v4;
  retstr->var8 = *(double *)(var1 + 64);
  long long v5 = *(_OWORD *)(var1 + 16);
  *(_OWORD *)&retstr->int var0 = *(_OWORD *)var1;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (unint64_t)width
{
  return self->_imagePriv->var0.var0;
}

- (unint64_t)height
{
  return self->_imagePriv->var0.var1;
}

- (unint64_t)depth
{
  return self->_imagePriv->var0.var2;
}

- (unint64_t)bytes
{
  return self->_imagePriv->var0.var2 >> 3;
}

- (unint64_t)numActiveChannels
{
  return self->_imagePriv->var0.var3;
}

- (unint64_t)imageType
{
  return self->_imagePriv->var0.var4;
}

- (unint64_t)origin
{
  return self->_imagePriv->var0.var5;
}

- (unint64_t)pixelFormat
{
  return self->_imagePriv->var0.var6;
}

- (BOOL)isPremultiplied
{
  return self->_imagePriv->var0.var7;
}

- (double)pixelAspect
{
  return self->_imagePriv->var0.var8;
}

- (unint64_t)size
{
  return 4 * self->_imagePriv->var0.var0 * self->_imagePriv->var0.var1 * self->_imagePriv->var0.var2;
}

- (unint64_t)fieldOrder
{
  return self->_imagePriv->var2;
}

- (unint64_t)field
{
  return self->_imagePriv->var1;
}

- (BOOL)containsPointX:(int)a3 Y:(int)a4
{
  if (a3 < 0) {
    return 0;
  }
  BOOL result = 0;
  if ((a4 & 0x80000000) == 0)
  {
    imagePriv = self->_imagePriv;
    if (SLODWORD(imagePriv->var0.var0) > a3) {
      return SLODWORD(imagePriv->var0.var1) > a4;
    }
  }
  return result;
}

- (CGRect)bounds
{
  imagePriv = self->_imagePriv;
  double x = imagePriv->var8.origin.x;
  double y = imagePriv->var8.origin.y;
  double width = imagePriv->var8.size.width;
  double height = imagePriv->var8.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (FxRect)dod
{
  imagePriv = self->_imagePriv;
  uint64_t v3 = *(void *)&imagePriv->var9.var0;
  uint64_t v4 = *(void *)&imagePriv->var9.var2;
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.int var0 = v3;
  result.unint64_t var1 = HIDWORD(v3);
  return result;
}

- (id)pixelTransform
{
  return self->_imagePriv->var10;
}

- (id)inversePixelTransform
{
  v2 = [[FxMatrix44 alloc] initWithInverseOfFxMatrix:self->_imagePriv->var10];

  return v2;
}

- (unint64_t)version
{
  return 1;
}

- (void)setWidth:(unint64_t)a3
{
  self->_imagePriv->var0.int var0 = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_imagePriv->var0.unint64_t var1 = a3;
}

- (void)setWidth:(unint64_t)a3 andHeight:(unint64_t)a4
{
  imagePriv = self->_imagePriv;
  imagePriv->var0.int var0 = a3;
  imagePriv->var0.unint64_t var1 = a4;
}

- (void)setDepth:(unint64_t)a3
{
  self->_imagePriv->var0.var2 = a3;
}

- (void)setBytes:(unint64_t)a3
{
  self->_imagePriv->var0.var2 = 8 * a3;
}

- (void)setNumActiveChannels:(unint64_t)a3
{
  self->_imagePriv->var0.var3 = a3;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imagePriv->var0.var4 = a3;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_imagePriv->var0.var5 = a3;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_imagePriv->var0.var6 = a3;
}

- (void)setIsPremultiplied:(BOOL)a3
{
  self->_imagePriv->var0.var7 = a3;
}

- (void)setPixelAspect:(double)a3
{
  self->_imagePriv->var0.var8 = a3;
}

- (void)setFieldOrder:(unint64_t)a3
{
  self->_imagePriv->var2 = a3;
}

- (void)setField:(unint64_t)a3
{
  self->_imagePriv->unint64_t var1 = a3;
}

- (unint64_t)colorInfo
{
  return 2 * ((unint64_t)BYTE1(self->_imagePriv->var5) << 8 != 2048);
}

- (void)setColorInfo:(unint64_t)a3
{
  if (a3 == 2)
  {
    imagePriv = self->_imagePriv;
    uint64_t v4 = BYTE2(imagePriv->var5);
    uint64_t v5 = 256;
    goto LABEL_5;
  }
  if (!a3)
  {
    imagePriv = self->_imagePriv;
    uint64_t v4 = BYTE2(imagePriv->var5);
    uint64_t v5 = 2048;
LABEL_5:
    imagePriv->var5 = v5 | (v4 << 16);
    return;
  }
  NSLog(&cfstr_FximageSetcolo.isa, a2);
}

- (unint64_t)nclcValue
{
  return self->_imagePriv->var5;
}

- (void)setNCLCValue:(unint64_t)a3
{
  self->_imagePriv->var5 = a3;
}

- (CGColorSpace)colorSpace
{
  imagePriv = self->_imagePriv;
  if (sColorSpaceVendor) {
    return (CGColorSpace *)sColorSpaceVendor(imagePriv->var5);
  }
  else {
    return imagePriv->var11;
  }
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->_imagePriv->var11 = a3;
}

- (unint64_t)fxColorPrimaries
{
  int v2 = BYTE2(self->_imagePriv->var5);
  if (v2 == 1) {
    return 0;
  }
  if (v2 != 9) {
    -[FxImage fxColorPrimaries]();
  }
  return 1;
}

- (void)setFxColorPrimaries:(unint64_t)a3
{
  if (a3 == 1)
  {
    imagePriv = self->_imagePriv;
    uint64_t v4 = BYTE1(imagePriv->var5);
    uint64_t v5 = 589824;
    goto LABEL_5;
  }
  if (!a3)
  {
    imagePriv = self->_imagePriv;
    uint64_t v4 = BYTE1(imagePriv->var5);
    uint64_t v5 = 0x10000;
LABEL_5:
    imagePriv->var5 = v5 | (v4 << 8);
    return;
  }
  NSLog(&cfstr_FximageSetfxco.isa, a2);
}

- (void)setDynamicRangeType:(unint64_t)a3
{
  self->_imagePriv->var13 = a3;
}

- (unint64_t)dynamicRangeType
{
  return self->_imagePriv->var13;
}

- (void)setEyeType:(int)a3
{
  self->_imagePriv->var12 = a3;
}

- (int)eyeType
{
  return self->_imagePriv->var12;
}

- (void)setBounds:(CGRect)a3
{
  self->_imagePriv->var8 = a3;
}

- (void)setDod:(FxRect)a3
{
  self->_imagePriv->var9 = a3;
}

- (void)setPixelTransform:(id)a3
{
  id var10 = self->_imagePriv->var10;
  if (var10 != a3)
  {

    self->_imagePriv->id var10 = a3;
    id v5 = a3;
  }
}

- (double)scaleX
{
  return self->_imagePriv->var3;
}

- (double)scaleY
{
  return self->_imagePriv->var4;
}

- (void)setScaleX:(double)a3
{
  self->_imagePriv->var3 = a3;
}

- (void)setScaleY:(double)a3
{
  self->_imagePriv->var4 = a3;
}

- (void)setDeallocCallback:(void *)a3 refcon:(void *)a4
{
  self->_imagePriv->var6 = a3;
  self->_imagePriv->var7 = a4;
}

- (BOOL)_verifyImage
{
  imagePriv = self->_imagePriv;
  if (!imagePriv)
  {
    NSLog(&cfstr_FximageVerifyi.isa);
    return 0;
  }
  if (imagePriv->var0.var0 && imagePriv->var0.var1 && imagePriv->var0.var3 == 4 && imagePriv->var0.var7)
  {
    BOOL v4 = 1;
  }
  else
  {
    NSLog(&cfstr_FximageVerifyi_0.isa, a2);
    BOOL v4 = 0;
  }
  unint64_t var2 = imagePriv->var0.var2;
  BOOL v6 = var2 > 0x20;
  uint64_t v7 = (1 << var2) & 0x100010100;
  if (v6 || v7 == 0)
  {
    NSLog(&cfstr_FximageVerifyi_1.isa, a2);
    BOOL v4 = 0;
  }
  if (imagePriv->var0.var4 - 1 >= 3)
  {
    NSLog(&cfstr_FximageVerifyi_2.isa, a2);
    BOOL v4 = 0;
  }
  if ((imagePriv->var0.var5 | 2) != 2)
  {
    NSLog(&cfstr_FximageVerifyi_3.isa);
    BOOL v4 = 0;
  }
  if ((imagePriv->var0.var6 | 2) != 2)
  {
    NSLog(&cfstr_FximageVerifyi_4.isa);
    BOOL v4 = 0;
  }
  if (imagePriv->var0.var8 <= 0.0)
  {
    NSLog(&cfstr_FximageVerifyi_5.isa);
    BOOL v4 = 0;
  }
  v9 = self->_imagePriv;
  if (v9->var1 >= 3)
  {
    NSLog(&cfstr_FximageVerifyi_6.isa);
    BOOL v4 = 0;
    v9 = self->_imagePriv;
  }
  if (v9->var2 >= 3)
  {
    NSLog(&cfstr_FximageVerifyi_7.isa);
    BOOL v4 = 0;
    v9 = self->_imagePriv;
  }
  double var3 = v9->var3;
  BOOL v6 = var3 <= 0.0;
  double v11 = fabs(var3);
  if (v6 || v11 == INFINITY)
  {
    NSLog(&cfstr_FximageVerifyi_8.isa, v11);
    BOOL v4 = 0;
    v9 = self->_imagePriv;
  }
  double var4 = v9->var4;
  if (var4 <= 0.0 || fabs(var4) == INFINITY)
  {
    NSLog(&cfstr_FximageVerifyi_9.isa);
    BOOL v4 = 0;
    v9 = self->_imagePriv;
  }
  unint64_t var5 = v9->var5;
  if (BYTE2(var5) > 0xCu
    || ((1 << SBYTE2(var5)) & 0x1202) == 0
    || BYTE1(var5) > 0x12u
    || ((1 << SBYTE1(var5)) & 0x52102) == 0
    || v9->var5)
  {
    NSLog(&cfstr_FximageVerifyi_10.isa);
    BOOL v4 = 0;
    v9 = self->_imagePriv;
  }
  if (CGRectIsEmpty(v9->var8))
  {
    NSLog(&cfstr_FximageVerifyi_11.isa);
    BOOL v4 = 0;
  }
  v15 = self->_imagePriv;
  if (!v15->var10)
  {
    NSLog(&cfstr_FximageVerifyi_12.isa);
    BOOL v4 = 0;
    v15 = self->_imagePriv;
  }
  if (!v15->var11)
  {
    NSLog(&cfstr_FximageVerifyi_13.isa);
    return 0;
  }
  return v4;
}

+ (void)setColorSpaceVendor:(void *)a3
{
  sColorSpaceVendor = (uint64_t (*)(void))a3;
}

- (void)fxColorPrimaries
{
}

@end