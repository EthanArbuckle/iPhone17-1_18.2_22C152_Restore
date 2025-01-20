@interface PCMatrix44Double
+ (BOOL)supportsSecureCoding;
+ (uint64_t)matrixWithSIMDDouble4x4:(_OWORD *)a3;
+ (uint64_t)matrixWithSIMDFloat4x4:(double)a3;
- ($360FFE100060A5171365411B823D6A0E)transformInfo;
- (BOOL)invert;
- (BOOL)invert2D;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPCMatrix44Double:(id)a3;
- (BOOL)isIdentity;
- (CGPoint)transformPoint:(CGPoint)a3;
- (CGRect)transformRect:(CGRect)a3;
- (PCMatrix44Double)init;
- (PCMatrix44Double)initWithArray:(id)a3;
- (PCMatrix44Double)initWithCoder:(id)a3;
- (PCMatrix44Double)initWithDoubles:(double)a3[16];
- (PCMatrix44Double)initWithDoubles:(double)a3[16] external:(BOOL)a4;
- (PCMatrix44Double)initWithPCMatrix:(const void *)a3;
- (__n128)SIMDDouble4x4;
- (double)SIMDFloat4x4;
- (double)doubleValueAtRow:(unsigned int)a3 col:(unsigned int)a4;
- (double)setSIMDDouble4x4:(uint64_t)a3;
- (double)setSIMDFloat4x4:(int8x16_t)a3;
- (id)array;
- (id)compactDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)extendedDescription;
- (id)newPlanarTransformTo:(id)a3;
- (id)newTransformTo:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getDoubles:(double)a3[16];
- (void)initWithSIMDDouble4x4:(_OWORD *)a3;
- (void)initWithSIMDFloat4x4:(double)a3;
- (void)leftFlipAboutY:(double)a3;
- (void)leftMult:(id)a3;
- (void)leftRotate:(double)a3 axis:(int)a4;
- (void)leftScaleX:(double)a3 scaleY:(double)a4 scaleZ:(double)a5;
- (void)leftShearX:(double)a3 shearY:(double)a4;
- (void)leftTranslateX:(double)a3 translateY:(double)a4 translateZ:(double)a5;
- (void)makeIdentity;
- (void)pcMatrix;
- (void)rightMult:(id)a3;
- (void)rightRotate:(double)a3 axis:(int)a4;
- (void)rightScaleX:(double)a3 scaleY:(double)a4 scaleZ:(double)a5;
- (void)rightShearX:(double)a3 shearY:(double)a4;
- (void)rightTranslateX:(double)a3 translateY:(double)a4 translateZ:(double)a5;
- (void)scaleSizeX:(double)a3 sizeY:(double)a4 sizeZ:(double)a5 scaledSizeX:(double *)a6 scaledSizeY:(double *)a7 scaledSizeZ:(double *)a8;
- (void)setDoubleValue:(double)a3 atRow:(unsigned int)a4 col:(unsigned int)a5;
- (void)setDoubles:(double)a3[16];
- (void)transpose;
@end

@implementation PCMatrix44Double

- (PCMatrix44Double)initWithPCMatrix:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PCMatrix44Double;
  result = [(PCMatrix44Double *)&v11 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3;
    long long v6 = *((_OWORD *)a3 + 1);
    long long v7 = *((_OWORD *)a3 + 2);
    *(_OWORD *)&result->_m[1][2] = *((_OWORD *)a3 + 3);
    *(_OWORD *)&result->_m[1][0] = v7;
    *(_OWORD *)&result->_m[0][2] = v6;
    *(_OWORD *)&result->_m[0][0] = v5;
    long long v8 = *((_OWORD *)a3 + 4);
    long long v9 = *((_OWORD *)a3 + 5);
    long long v10 = *((_OWORD *)a3 + 6);
    *(_OWORD *)&result->_m[3][2] = *((_OWORD *)a3 + 7);
    *(_OWORD *)&result->_m[3][0] = v10;
    *(_OWORD *)&result->_m[2][2] = v9;
    *(_OWORD *)&result->_m[2][0] = v8;
    result->_pcMatrix = result->_m;
  }
  return result;
}

- (PCMatrix44Double)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCMatrix44Double;
  result = [(PCMatrix44Double *)&v3 init];
  if (result)
  {
    result->_m[0][0] = 1.0;
    result->_m[2][2] = 1.0;
    result->_m[1][1] = 1.0;
    *(_OWORD *)&result->_m[0][1] = 0u;
    *(_OWORD *)&result->_m[0][3] = 0u;
    *(_OWORD *)&result->_m[1][2] = 0u;
    *(_OWORD *)&result->_m[2][0] = 0u;
    *(_OWORD *)&result->_m[2][3] = 0u;
    *(_OWORD *)&result->_m[3][1] = 0u;
    result->_m[3][3] = 1.0;
    result->_pcMatrix = result->_m;
  }
  return result;
}

- (PCMatrix44Double)initWithDoubles:(double)a3[16] external:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PCMatrix44Double;
  result = [(PCMatrix44Double *)&v12 init];
  if (result)
  {
    result->_m[0][0] = 1.0;
    result->_m[2][2] = 1.0;
    result->_m[1][1] = 1.0;
    *(_OWORD *)&result->_m[0][1] = 0u;
    *(_OWORD *)&result->_m[0][3] = 0u;
    *(_OWORD *)&result->_m[1][2] = 0u;
    *(_OWORD *)&result->_m[2][0] = 0u;
    *(_OWORD *)&result->_m[2][3] = 0u;
    *(_OWORD *)&result->_m[3][1] = 0u;
    result->_m[3][3] = 1.0;
    result->_pcMatrix = result->_m;
    long long v6 = *(_OWORD *)a3;
    long long v7 = *((_OWORD *)a3 + 1);
    long long v8 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&result->_m[1][0] = *((_OWORD *)a3 + 2);
    *(_OWORD *)&result->_m[1][2] = v8;
    *(_OWORD *)&result->_m[0][0] = v6;
    *(_OWORD *)&result->_m[0][2] = v7;
    long long v9 = *((_OWORD *)a3 + 4);
    long long v10 = *((_OWORD *)a3 + 5);
    long long v11 = *((_OWORD *)a3 + 7);
    *(_OWORD *)&result->_m[3][0] = *((_OWORD *)a3 + 6);
    *(_OWORD *)&result->_m[3][2] = v11;
    *(_OWORD *)&result->_m[2][0] = v9;
    *(_OWORD *)&result->_m[2][2] = v10;
  }
  return result;
}

- (PCMatrix44Double)initWithDoubles:(double)a3[16]
{
  return [(PCMatrix44Double *)self initWithDoubles:a3 external:0];
}

- (PCMatrix44Double)initWithArray:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  do
  {
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v5, v8, v9, v10, v11, v12, v13, v14, v15), "doubleValue");
    *((void *)&v8 + v5++) = v6;
  }
  while (v5 != 16);
  return [(PCMatrix44Double *)self initWithDoubles:&v8];
}

+ (uint64_t)matrixWithSIMDFloat4x4:(double)a3
{
  id v5 = [a1 alloc];

  return objc_msgSend(v5, "initWithSIMDFloat4x4:", a2, a3, a4, a5);
}

+ (uint64_t)matrixWithSIMDDouble4x4:(_OWORD *)a3
{
  id v4 = [a1 alloc];
  long long v5 = a3[5];
  v10[4] = a3[4];
  v10[5] = v5;
  long long v6 = a3[7];
  v10[6] = a3[6];
  v10[7] = v6;
  long long v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  long long v8 = a3[3];
  v10[2] = a3[2];
  v10[3] = v8;
  return [v4 initWithSIMDDouble4x4:v10];
}

- (void)initWithSIMDFloat4x4:(double)a3
{
  long long v5 = (void *)[a1 init];
  long long v6 = v5;
  if (v5) {
    objc_msgSend(v5, "setSIMDFloat4x4:", a2, a3, a4, a5);
  }
  return v6;
}

- (void)initWithSIMDDouble4x4:(_OWORD *)a3
{
  id v4 = (void *)[a1 init];
  long long v5 = v4;
  if (v4)
  {
    long long v6 = a3[5];
    v11[4] = a3[4];
    v11[5] = v6;
    long long v7 = a3[7];
    v11[6] = a3[6];
    v11[7] = v7;
    long long v8 = a3[1];
    v11[0] = *a3;
    v11[1] = v8;
    long long v9 = a3[3];
    v11[2] = a3[2];
    v11[3] = v9;
    [v4 setSIMDDouble4x4:v11];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMatrix44Double)initWithCoder:(id)a3
{
  uint64_t v5 = 0;
  result = (PCMatrix44Double *)[a3 decodeBytesForKey:@"bytes" returnedLength:&v5];
  if (result) {
    return [(PCMatrix44Double *)self initWithDoubles:result external:1];
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  [(PCMatrix44Double *)self getDoubles:v4];
  [a3 encodeBytes:v4 length:128 forKey:@"bytes"];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PCMatrix44Double;
  [(PCMatrix44Double *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  pcMatrix = self->_pcMatrix;

  return (id)[v4 initWithPCMatrix:pcMatrix];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = 0;
  BOOL v6 = 0;
  pcMatrix = (char *)self->_pcMatrix;
  uint64_t v8 = *((void *)a3 + 17);
  while (2)
  {
    for (uint64_t i = 0; i != 32; i += 8)
    {
      if (vabdd_f64(*(double *)&pcMatrix[i], *(double *)(v8 + i)) >= 0.0000001) {
        return v6;
      }
    }
    BOOL v6 = v5 > 2;
    v8 += 32;
    pcMatrix += 32;
    BOOL v10 = 1;
    if (++v5 != 4) {
      continue;
    }
    break;
  }
  return v10;
}

- (BOOL)isEqualToPCMatrix44Double:(id)a3
{
  if (a3)
  {
    unint64_t v3 = 0;
    BOOL v4 = 0;
    pcMatrix = (char *)self->_pcMatrix;
    uint64_t v6 = *((void *)a3 + 17);
LABEL_3:
    uint64_t v7 = 0;
    while (vabdd_f64(*(double *)&pcMatrix[v7], *(double *)(v6 + v7)) < 0.0000001)
    {
      v7 += 8;
      if (v7 == 32)
      {
        BOOL v4 = v3 > 2;
        v6 += 32;
        pcMatrix += 32;
        if (++v3 != 4) {
          goto LABEL_3;
        }
        return 1;
      }
    }
  }
  else
  {
    return 0;
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  [(PCMatrix44Double *)self getDoubles:v3];
  CC_MD5(v3, 0x80u, md);
  return *(void *)md;
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  [(PCMatrix44Double *)self getDoubles:v6];
  objc_super v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(\n");
  for (uint64_t i = 0; i != 15; ++i)
  {
    if ((~(_BYTE)i & 3) != 0) {
      BOOL v4 = "";
    }
    else {
      BOOL v4 = "\n";
    }
    objc_msgSend(v2, "appendFormat:", @"%f,%s", *((void *)v6 + i), v4);
  }
  [v2 appendFormat:@"%f\n"], *((void *)&v7 + 1));
  return v2;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>%@", NSStringFromClass(v4), self, -[PCMatrix44Double description](self, "description")];
}

- (id)compactDescription
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  [(PCMatrix44Double *)self getDoubles:&v4];
  id v2 = objc_alloc(MEMORY[0x1E4F28E78]);
  return (id)objc_msgSend(v2, "initWithFormat:", @"( %f,%f,%f,%f,,%f,%f,%f,%f,,%f,%f,%f,%f,,%f,%f,%f,%f)", v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)extendedDescription
{
  if (self) {
    [(PCMatrix44Double *)self transformInfo];
  }
  long long v14 = NSString;
  uint64_t v13 = [NSNumber numberWithDouble:0.0];
  uint64_t v12 = [NSNumber numberWithDouble:0.0];
  uint64_t v3 = [NSNumber numberWithDouble:0.0];
  uint64_t v4 = [NSNumber numberWithDouble:0.0];
  uint64_t v5 = [NSNumber numberWithDouble:0.0];
  uint64_t v6 = [NSNumber numberWithDouble:0.0];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v10 = [NSNumber numberWithDouble:0.0];
  return (id)objc_msgSend(v14, "stringWithFormat:", @"translation:\n\tx: %@\n\ty: %@\n\tz: %@\nscale:\n\tx: %@\n\ty: %@\n\tz: %@\nrotation:\n\tx: %.2f° (%@)\n\ty: %.2f° (%@)\n\tz: %.2f° (%@)\nshear:\n\tx: %@\n\ty: %@\nmatrix:\n\t%@", v13, v12, v3, v4, v5, v6, 0.0 * 180.0 / 3.14159265, v7, 0.0 * 180.0 / 3.14159265, v8, 0.0 * 180.0 / 3.14159265, v9, v10, objc_msgSend(NSNumber, "numberWithDouble:", 0.0), objc_msgSend(-[PCMatrix44Double description](self, "description"),
                 "stringByReplacingOccurrencesOfString:withString:",
                 @"\n",
                 @"\n\t"));
}

- (void)pcMatrix
{
  return self->_pcMatrix;
}

- (double)doubleValueAtRow:(unsigned int)a3 col:(unsigned int)a4
{
  return *((double *)self->_pcMatrix + 4 * (int)a3 + (int)a4);
}

- (void)setDoubleValue:(double)a3 atRow:(unsigned int)a4 col:(unsigned int)a5
{
  *((double *)self->_pcMatrix + 4 * (int)a4 + (int)a5) = a3;
}

- (void)getDoubles:(double)a3[16]
{
  pcMatrix = (long long *)self->_pcMatrix;
  long long v4 = *pcMatrix;
  long long v5 = pcMatrix[1];
  long long v6 = pcMatrix[3];
  *((_OWORD *)a3 + 2) = pcMatrix[2];
  *((_OWORD *)a3 + 3) = v6;
  *(_OWORD *)a3 = v4;
  *((_OWORD *)a3 + 1) = v5;
  long long v7 = pcMatrix[4];
  long long v8 = pcMatrix[5];
  long long v9 = pcMatrix[7];
  *((_OWORD *)a3 + 6) = pcMatrix[6];
  *((_OWORD *)a3 + 7) = v9;
  *((_OWORD *)a3 + 4) = v7;
  *((_OWORD *)a3 + 5) = v8;
}

- (void)setDoubles:(double)a3[16]
{
  pcMatrix = self->_pcMatrix;
  long long v4 = *(_OWORD *)a3;
  long long v5 = *((_OWORD *)a3 + 1);
  long long v6 = *((_OWORD *)a3 + 3);
  pcMatrix[2] = *((_OWORD *)a3 + 2);
  pcMatrix[3] = v6;
  _OWORD *pcMatrix = v4;
  pcMatrix[1] = v5;
  long long v7 = *((_OWORD *)a3 + 4);
  long long v8 = *((_OWORD *)a3 + 5);
  long long v9 = *((_OWORD *)a3 + 7);
  pcMatrix[6] = *((_OWORD *)a3 + 6);
  pcMatrix[7] = v9;
  pcMatrix[4] = v7;
  pcMatrix[5] = v8;
}

- (id)array
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (-[PCMatrix44Double array]::onceToken != -1) {
    dispatch_once(&-[PCMatrix44Double array]::onceToken, &__block_literal_global_55);
  }
  pcMatrix = (double *)self->_pcMatrix;
  if (PCMatrix44Tmpl<double>::isIdentity(pcMatrix) && pcMatrix[15] == 1.0) {
    return (id)-[PCMatrix44Double array]::sIdentityArray;
  }
  for (uint64_t i = 0; i != 16; ++i)
  {
    double v6 = pcMatrix[i];
    if (v6 == 0.0)
    {
      long long v7 = (void *)-[PCMatrix44Double array]::sNSNumberZero;
LABEL_13:
      id v8 = v7;
      goto LABEL_14;
    }
    if (v6 == 1.0)
    {
      long long v7 = (void *)-[PCMatrix44Double array]::sNSNumberOne;
      goto LABEL_13;
    }
    if (v6 == -1.0)
    {
      long long v7 = (void *)-[PCMatrix44Double array]::sNSNumberNeg1;
      goto LABEL_13;
    }
    id v8 = (id)[objc_alloc(NSNumber) initWithDouble:pcMatrix[i]];
LABEL_14:
    *(void *)&v11[i * 8] = v8;
  }
  long long v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:16];
  for (uint64_t j = 0; j != 128; j += 8)

  return v4;
}

uint64_t __25__PCMatrix44Double_array__block_invoke()
{
  -[PCMatrix44Double array]::sNSNumberOne = [objc_alloc(NSNumber) initWithDouble:1.0];
  -[PCMatrix44Double array]::sNSNumberZero = [objc_alloc(NSNumber) initWithDouble:0.0];
  -[PCMatrix44Double array]::sNSNumberNeg1 = [objc_alloc(NSNumber) initWithDouble:-1.0];
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberOne, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberOne, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberOne, 0);
  -[PCMatrix44Double array]::sIdentityArray = result;
  return result;
}

- (double)SIMDFloat4x4
{
  uint64_t v1 = *(void *)(a1 + 136);
  int32x4_t v2 = *(int32x4_t *)v1;
  *(float32x2_t *)v2.i8 = vcvt_f32_f64(*(float64x2_t *)v1);
  float64x2_t v3 = *(float64x2_t *)(v1 + 32);
  *(float32x2_t *)&v3.f64[0] = vcvt_f32_f64(v3);
  float64x2_t v4 = *(float64x2_t *)(v1 + 64);
  *(float32x2_t *)&v4.f64[0] = vcvt_f32_f64(v4);
  float64x2_t v5 = *(float64x2_t *)(v1 + 96);
  *(float32x2_t *)&v5.f64[0] = vcvt_f32_f64(v5);
  *(void *)&double result = vzip1q_s32(vzip1q_s32(v2, (int32x4_t)v4), vzip1q_s32((int32x4_t)v3, (int32x4_t)v5)).u64[0];
  return result;
}

- (double)setSIMDFloat4x4:(int8x16_t)a3
{
  uint64_t v5 = *(void *)(a1 + 136);
  *(double *)uint64_t v5 = *(float *)a2.i32;
  *(double *)(v5 + 8) = *(float *)a3.i32;
  *(double *)(v5 + 16) = *(float *)a4.i32;
  int8x8_t v6 = (int8x8_t)vextq_s8(a2, a2, 8uLL).u64[0];
  float32x2_t v7 = (float32x2_t)vext_s8(*(int8x8_t *)a5.i8, v6, 4uLL);
  v8.i32[0] = vextq_s8(a5, a5, 8uLL).u32[0];
  a5.i32[1] = a2.i32[1];
  *(float64x2_t *)(v5 + 24) = vcvtq_f64_f32(*(float32x2_t *)a5.i8);
  *(float64x2_t *)(v5 + 40) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a3.i8, *(int32x2_t *)a4.i8));
  *(float64x2_t *)(v5 + 56) = vcvtq_f64_f32(v7);
  int32x2_t v9 = (int32x2_t)vextq_s8(a4, a4, 8uLL).u64[0];
  int32x2_t v10 = (int32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  *(float64x2_t *)(v5 + 72) = vcvtq_f64_f32((float32x2_t)vzip1_s32(v10, v9));
  v8.i32[1] = v6.i32[1];
  *(float64x2_t *)(v5 + 88) = vcvtq_f64_f32(v8);
  *(float64x2_t *)(v5 + 104) = vcvtq_f64_f32((float32x2_t)vzip2_s32(v10, v9));
  double result = *(float *)&a5.i32[3];
  *(double *)(v5 + 120) = *(float *)&a5.i32[3];
  return result;
}

- (__n128)SIMDDouble4x4
{
  int32x4_t v2 = *(unint64_t **)(a1 + 136);
  result.n128_u64[0] = *v2;
  *(void *)&long long v3 = v2[1];
  *(void *)&long long v4 = v2[2];
  *(void *)&long long v5 = v2[3];
  *(void *)&long long v6 = v2[8];
  *(void *)&long long v7 = v2[9];
  *(void *)&long long v8 = v2[10];
  *(void *)&long long v9 = v2[11];
  result.n128_u64[1] = v2[4];
  *((void *)&v6 + 1) = v2[12];
  *((void *)&v3 + 1) = v2[5];
  *((void *)&v7 + 1) = v2[13];
  *((void *)&v4 + 1) = v2[6];
  *((void *)&v8 + 1) = v2[14];
  *((void *)&v5 + 1) = v2[7];
  *((void *)&v9 + 1) = v2[15];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v7;
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 80) = v8;
  *(_OWORD *)(a2 + 96) = v5;
  *(_OWORD *)(a2 + 112) = v9;
  return result;
}

- (double)setSIMDDouble4x4:(uint64_t)a3
{
  uint64_t v3 = *(void *)(a1 + 136);
  *(void *)uint64_t v3 = *(void *)a3;
  *(void *)(v3 + 8) = *(void *)(a3 + 32);
  *(void *)(v3 + 16) = *(void *)(a3 + 64);
  *(void *)(v3 + 24) = *(void *)(a3 + 96);
  *(void *)(v3 + 32) = *(void *)(a3 + 8);
  *(void *)(v3 + 40) = *(void *)(a3 + 40);
  *(void *)(v3 + 48) = *(void *)(a3 + 72);
  *(void *)(v3 + 56) = *(void *)(a3 + 104);
  *(void *)(v3 + 64) = *(void *)(a3 + 16);
  *(void *)(v3 + 72) = *(void *)(a3 + 48);
  *(void *)(v3 + 80) = *(void *)(a3 + 80);
  *(void *)(v3 + 88) = *(void *)(a3 + 112);
  *(void *)(v3 + 96) = *(void *)(a3 + 24);
  *(void *)(v3 + 104) = *(void *)(a3 + 56);
  *(void *)(v3 + 112) = *(void *)(a3 + 88);
  double result = *(double *)(a3 + 120);
  *(double *)(v3 + 120) = result;
  return result;
}

- (BOOL)isIdentity
{
  return PCMatrix44Tmpl<double>::isIdentity((double *)self->_pcMatrix);
}

- (void)makeIdentity
{
  pcMatrix = (char *)self->_pcMatrix;
  *((void *)pcMatrix + 15) = 0x3FF0000000000000;
  *((void *)pcMatrix + 10) = 0x3FF0000000000000;
  *((void *)pcMatrix + 5) = 0x3FF0000000000000;
  *(void *)pcMatrix = 0x3FF0000000000000;
  *(_OWORD *)(pcMatrix + 8) = 0u;
  *(_OWORD *)(pcMatrix + 24) = 0u;
  *((_OWORD *)pcMatrix + 3) = 0u;
  *((_OWORD *)pcMatrix + 4) = 0u;
  *(_OWORD *)(pcMatrix + 88) = 0u;
  *(_OWORD *)(pcMatrix + 104) = 0u;
}

- (void)leftTranslateX:(double)a3 translateY:(double)a4 translateZ:(double)a5
{
}

- (void)rightTranslateX:(double)a3 translateY:(double)a4 translateZ:(double)a5
{
}

- (void)leftScaleX:(double)a3 scaleY:(double)a4 scaleZ:(double)a5
{
}

- (void)rightScaleX:(double)a3 scaleY:(double)a4 scaleZ:(double)a5
{
}

- (void)leftShearX:(double)a3 shearY:(double)a4
{
}

- (void)rightShearX:(double)a3 shearY:(double)a4
{
}

- (void)leftRotate:(double)a3 axis:(int)a4
{
}

- (void)rightRotate:(double)a3 axis:(int)a4
{
}

- (BOOL)invert
{
  return PCMatrix44Tmpl<double>::invert((double *)self->_pcMatrix, (double *)self->_pcMatrix, 0.0);
}

- (void)transpose
{
}

- (BOOL)invert2D
{
  return PCMatrix44Tmpl<double>::planarInverseZ((uint64_t)self->_pcMatrix, (double *)self->_pcMatrix, 0.0);
}

- (CGRect)transformRect:(CGRect)a3
{
  CGRect v7 = a3;
  PCMatrix44Tmpl<double>::transformRect<double>((double *)self->_pcMatrix, &v7.origin.x, (uint64_t)&v7);
  double y = v7.origin.y;
  double x = v7.origin.x;
  double height = v7.size.height;
  double width = v7.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  pcMatridouble x = (double *)self->_pcMatrix;
  double v4 = pcMatrix[15] + a3.x * pcMatrix[12] + a3.y * pcMatrix[13];
  double v5 = (pcMatrix[3] + a3.x * *pcMatrix + a3.y * pcMatrix[1]) / v4;
  double v6 = (pcMatrix[7] + a3.x * pcMatrix[4] + a3.y * pcMatrix[5]) / v4;
  double v7 = v5;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- ($360FFE100060A5171365411B823D6A0E)transformInfo
{
  memset(v10, 0, sizeof(v10));
  int v11 = 4;
  long long v12 = 0u;
  memset(v13, 0, sizeof(v13));
  CGPoint result = ($360FFE100060A5171365411B823D6A0E *)PCMatrix44Tmpl<double>::getTransformation((long long *)self->_pcMatrix, (uint64_t)v10);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var6 = _Q0;
  retstr->var8 = 1.0;
  if (result)
  {
    *(_OWORD *)&retstr->var0 = v10[0];
    retstr->var2 = *(double *)&v10[1];
    *(_OWORD *)&retstr->var3 = v12;
    retstr->var5 = *(double *)v13;
    *(_OWORD *)&retstr->var6 = *(_OWORD *)((char *)&v10[1] + 8);
    retstr->var8 = *((double *)&v10[2] + 1);
    *(_OWORD *)&retstr->var9 = *(_OWORD *)&v13[8];
  }
  return result;
}

- (void)scaleSizeX:(double)a3 sizeY:(double)a4 sizeZ:(double)a5 scaledSizeX:(double *)a6 scaledSizeY:(double *)a7 scaledSizeZ:(double *)a8
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  int v17 = 4;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v20 = 0;
  PCMatrix44Tmpl<double>::getTransformation((long long *)self->_pcMatrix, (uint64_t)&v14);
  if (a6) {
    *a6 = *((double *)&v15 + 1) * a3;
  }
  if (a7) {
    *a7 = *(double *)&v16 * a4;
  }
  if (a8) {
    *a8 = *((double *)&v16 + 1) * a5;
  }
}

- (void)leftMult:(id)a3
{
  pcMatridouble x = self->_pcMatrix;
  double v4 = (double *)[a3 pcMatrix];

  PCMatrix44Tmpl<double>::leftMult((uint64_t)pcMatrix, v4);
}

- (void)rightMult:(id)a3
{
  pcMatridouble x = self->_pcMatrix;
  double v4 = (double *)[a3 pcMatrix];

  PCMatrix44Tmpl<double>::rightMult((uint64_t)pcMatrix, v4);
}

- (void)leftFlipAboutY:(double)a3
{
  [(PCMatrix44Double *)self leftTranslateX:0.0 translateY:-a3 translateZ:0.0];
  [(PCMatrix44Double *)self leftScaleX:1.0 scaleY:-1.0 scaleZ:1.0];

  [(PCMatrix44Double *)self leftTranslateX:0.0 translateY:a3 translateZ:0.0];
}

- (id)newTransformTo:(id)a3
{
  if (a3 && !-[PCMatrix44Double isEqual:](self, "isEqual:"))
  {
    double v6 = (void *)[(PCMatrix44Double *)self copy];
    [v6 invert];
    [v6 leftMult:a3];
    return v6;
  }
  else
  {
    return (id)objc_opt_new();
  }
}

- (id)newPlanarTransformTo:(id)a3
{
  if (a3 && !-[PCMatrix44Double isEqual:](self, "isEqual:"))
  {
    double v6 = (void *)[(PCMatrix44Double *)self copy];
    [v6 invert2D];
    [v6 leftMult:a3];
    return v6;
  }
  else
  {
    return (id)objc_opt_new();
  }
}

@end