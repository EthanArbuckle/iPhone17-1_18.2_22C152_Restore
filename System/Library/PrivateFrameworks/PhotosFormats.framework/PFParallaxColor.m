@interface PFParallaxColor
+ (BOOL)supportsSecureCoding;
+ (PFParallaxColor)blackColor;
+ (PFParallaxColor)colorWithCGColor:(CGColor *)a3;
+ (PFParallaxColor)colorWithRGBValues:(id)a3 error:(id *)a4;
+ (PFParallaxColor)colorWithTone:(double)a3 hue:(double)a4;
+ (PFParallaxColor)coolColor;
+ (PFParallaxColor)warmColor;
+ (PFParallaxColor)whiteColor;
- (BOOL)isCool;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParallaxColor:(id)a3;
- (BOOL)isWarm;
- (CGColor)CGColor;
- (CGPoint)pt;
- (NSArray)RGBValues;
- (PFParallaxColor)complementaryColor;
- (PFParallaxColor)init;
- (PFParallaxColor)initWithCoder:(id)a3;
- (PFParallaxColor)initWithHue:(double)a3 tone:(double)a4;
- (PFParallaxColor)initWithLuma:(double)a3 hue:(double)a4 chroma:(double)a5;
- (PFParallaxColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5;
- (double)blue;
- (double)chroma;
- (double)deltaE94DistanceToColor:(id)a3;
- (double)distanceToColor:(id)a3;
- (double)green;
- (double)hue;
- (double)luma;
- (double)luminance;
- (double)red;
- (double)tone;
- (id)debugQuickLookObject;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFParallaxColor

- (PFParallaxColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"rgbValues"];

  v6 = [v5 objectAtIndexedSubscript:0];
  [v6 doubleValue];
  double v8 = v7;
  v9 = [v5 objectAtIndexedSubscript:1];
  [v9 doubleValue];
  double v11 = v10;
  v12 = [v5 objectAtIndexedSubscript:2];
  [v12 doubleValue];
  v14 = [(PFParallaxColor *)self initWithRed:v8 green:v11 blue:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PFParallaxColor *)self RGBValues];
  [v4 encodeObject:v5 forKey:@"rgbValues"];
}

- (id)debugQuickLookObject
{
  v2 = objc_msgSend(MEMORY[0x1E4F1E008], "colorWithCGColor:", -[PFParallaxColor CGColor](self, "CGColor"));
  v3 = [v2 debugQuickLookObject];

  return v3;
}

- (CGColor)CGColor
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cgColor)
  {
    v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
    uint64_t v4 = *(void *)&v2->_srgb[16];
    long long v6 = *(_OWORD *)v2->_srgb;
    uint64_t v7 = v4;
    uint64_t v8 = 0x3FF0000000000000;
    v2->_cgColor = CGColorCreate(v3, (const CGFloat *)&v6);
    CGColorSpaceRelease(v3);
  }
  objc_sync_exit(v2);

  return v2->_cgColor;
}

- (PFParallaxColor)complementaryColor
{
  [(PFParallaxColor *)self red];
  double v4 = 1.0 - v3;
  [(PFParallaxColor *)self green];
  double v6 = 1.0 - v5;
  [(PFParallaxColor *)self blue];
  uint64_t v8 = [[PFParallaxColor alloc] initWithRed:v4 green:v6 blue:1.0 - v7];

  return v8;
}

- (NSArray)RGBValues
{
  v8[3] = *MEMORY[0x1E4F143B8];
  double v3 = [NSNumber numberWithDouble:*(double *)self->_srgb];
  double v4 = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)&self->_srgb[8], v3);
  v8[1] = v4;
  double v5 = [NSNumber numberWithDouble:*(double *)&self->_srgb[16]];
  v8[2] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

- (double)deltaE94DistanceToColor:(id)a3
{
  id v4 = a3;
  [(PFParallaxColor *)self luma];
  float64_t v30 = v5;
  [(PFParallaxColor *)self pt];
  long long v28 = v6;
  [(PFParallaxColor *)self pt];
  v7.f64[1] = *((float64_t *)&v28 + 1);
  v8.f64[0] = v30;
  *(void *)&v8.f64[1] = v28;
  v9.f64[0] = 255.0;
  v7.f64[0] = -128.0;
  float64x2_t v27 = v9;
  float64x2_t v29 = v7;
  float64x2_t v31 = vmlaq_f64(v7, v9, v10);
  float64x2_t v26 = vmlaq_f64((float64x2_t)xmmword_1A42D3540, (float64x2_t)xmmword_1A42D3530, v8);
  [v4 luma];
  float64_t v25 = v11;
  [v4 pt];
  float64_t v24 = v12;
  [v4 pt];
  float64x2_t v23 = v13;

  v14.f64[0] = v25;
  v14.f64[1] = v24;
  float64x2_t v15 = vmlaq_f64((float64x2_t)xmmword_1A42D3540, (float64x2_t)xmmword_1A42D3530, v14);
  float v16 = v26.f64[0] - v15.f64[0];
  float64x2_t v17 = v15;
  *(float *)v14.f64 = COERCE_DOUBLE(*(void *)&vsubq_f64(v26, v15).f64[1]);
  float64x2_t v18 = vmlaq_f64(v29, v27, v23);
  *(float *)v15.f64 = v31.f64[0] - v18.f64[0];
  float v19 = sqrt(vaddq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)vmulq_f64(v26, v26), 1), vmulq_f64(v31, v31)).f64[0]);
  float v20 = sqrt(vaddq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)vmulq_f64(v17, v17), 1), vmulq_f64(v18, v18)).f64[0]);
  *(float *)v18.f64 = v19 - v20;
  *(float *)v14.f64 = fmax((float)((float)((float)(*(float *)v15.f64 * *(float *)v15.f64)+ (float)(*(float *)v14.f64 * *(float *)v14.f64))- (float)(*(float *)v18.f64 * *(float *)v18.f64)), 0.0);
  v15.f64[0] = sqrtf(v19 * v20);
  float v21 = v15.f64[0] * 0.045 + 1.0;
  *(float *)v15.f64 = v15.f64[0] * 0.015 + 1.0;
  return sqrtf((float)(*(float *)v14.f64 / (float)(*(float *)v15.f64 * *(float *)v15.f64))+ (float)((float)((float)(*(float *)v18.f64 / v21) * (float)(*(float *)v18.f64 / v21)) + (float)(v16 * v16)));
}

- (double)distanceToColor:(id)a3
{
  id v4 = a3;
  [(PFParallaxColor *)self hue];
  double v6 = v5 + 0.0;
  [v4 hue];
  double v8 = vabdd_f64(v6, v7);
  [(PFParallaxColor *)self hue];
  double v10 = v9 + 360.0;
  [v4 hue];
  double v12 = vabdd_f64(v10, v11);
  [(PFParallaxColor *)self hue];
  double v14 = v13 + -360.0;
  [v4 hue];
  double v16 = v15;

  double result = vabdd_f64(v14, v16);
  if (v12 < result) {
    double result = v12;
  }
  if (v8 < result) {
    return v8;
  }
  return result;
}

- (BOOL)isEqualToParallaxColor:(id)a3
{
  float64x2_t v3 = *((float64x2_t *)a3 + 2);
  float64x2_t v4 = vabdq_f64(*(float64x2_t *)&self->_srgb[16], v3);
  v3.f64[0] = 0.0001;
  int64x2_t v5 = vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F1A36E2EB1C432DuLL), vabdq_f64(*(float64x2_t *)self->_srgb, *((float64x2_t *)a3 + 1)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v5, 1), vandq_s8((int8x16_t)vcgtq_f64(v3, v4), (int8x16_t)v5)).u64[0] >> 63;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PFParallaxColor *)self isEqualToParallaxColor:v4];

  return v5;
}

- (id)description
{
  float64x2_t v3 = NSString;
  [(PFParallaxColor *)self red];
  uint64_t v5 = v4;
  [(PFParallaxColor *)self green];
  uint64_t v7 = v6;
  [(PFParallaxColor *)self blue];
  uint64_t v9 = v8;
  [(PFParallaxColor *)self luminance];
  uint64_t v11 = v10;
  [(PFParallaxColor *)self luma];
  uint64_t v13 = v12;
  [(PFParallaxColor *)self hue];
  uint64_t v15 = v14;
  [(PFParallaxColor *)self chroma];
  uint64_t v17 = v16;
  [(PFParallaxColor *)self tone];
  return (id)[v3 stringWithFormat:@"(R:%.3f G:%.3f B:%.3f L: %.3f, l:%.3f, h:%.3f c:%.3f t:%.3f)", v5, v7, v9, v11, v13, v15, v17, v18];
}

- (BOOL)isCool
{
  [(PFParallaxColor *)self hue];
  if (v3 >= 150.0) {
    return 1;
  }
  [(PFParallaxColor *)self hue];
  return v4 <= -30.0;
}

- (BOOL)isWarm
{
  [(PFParallaxColor *)self hue];
  if (v3 < 0.0) {
    return 0;
  }
  [(PFParallaxColor *)self hue];
  return v5 <= 120.0;
}

- (double)tone
{
  double v2 = *(double *)self->_lhc;
  double v3 = *(double *)&self->_lhc[16] / 0.707106781;
  if (v3 > v2) {
    return (v2 / v3 + 2.0 - sqrt(v2 / v3 * (v2 / v3) + 4.0)) * 0.5;
  }
  double result = 1.0;
  if (v3 > 0.0) {
    return (v3 / v2 * 2.0 + 1.0 - sqrt(v3 / v2 * 4.0 * (v3 / v2) + 1.0)) / (v3 / v2 + v3 / v2);
  }
  return result;
}

- (PFParallaxColor)initWithHue:(double)a3 tone:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PFParallaxColor;
  uint64_t v6 = [(PFParallaxColor *)&v12 init];
  v7.f64[0] = (2.0 - a4) * a4;
  v7.f64[1] = a3 * 3.14159265 / 180.0;
  *(double *)&long long v8 = (1.0 - a4) * 0.707106781;
  *(float64x2_t *)v6->_lhc = v7;
  *(_OWORD *)&v6->_lhc[16] = v8;
  lhc_to_srgb(v11, v7, *(double *)&v8);
  float64x2_t v9 = v11[1];
  *(float64x2_t *)v6->_srgb = v11[0];
  *(float64x2_t *)&v6->_srgb[16] = v9;
  return v6;
}

- (CGPoint)pt
{
  double v2 = *(double *)&self->_lhc[16];
  __double2 v3 = __sincos_stret(*(double *)&self->_lhc[8]);
  double v4 = v2 * v3.__sinval;
  double v5 = v2 * v3.__cosval;
  result.y = v4;
  result.x = v5;
  return result;
}

- (double)chroma
{
  return *(double *)&self->_lhc[16] / 0.707106781;
}

- (double)hue
{
  return *(double *)&self->_lhc[8] * 180.0 / 3.14159265;
}

- (double)luma
{
  return *(double *)self->_lhc;
}

- (PFParallaxColor)initWithLuma:(double)a3 hue:(double)a4 chroma:(double)a5
{
  v17.receiver = self;
  v17.super_class = (Class)PFParallaxColor;
  float64x2_t v7 = [(PFParallaxColor *)&v17 init];
  double v8 = fmod(a4, 360.0);
  double v10 = v8 + -360.0;
  if (v8 <= 180.0) {
    double v10 = v8;
  }
  if (v8 >= -180.0) {
    double v11 = v10;
  }
  else {
    double v11 = v8 + 360.0;
  }
  v12.f64[0] = a3;
  v12.f64[1] = v11 * 3.14159265 / 180.0;
  *(double *)&long long v9 = a5 * 0.707106781;
  *(float64x2_t *)v7->_lhc = v12;
  *(_OWORD *)&v7->_lhc[16] = v9;
  lhc_to_srgb(v16, v12, a5 * 0.707106781);
  float64x2_t v13 = v16[1];
  *(float64x2_t *)v7->_srgb = v16[0];
  *(float64x2_t *)&v7->_srgb[16] = v13;
  return v7;
}

- (double)luminance
{
  v2.f64[0] = 0.114;
  return vmulq_f64(*(float64x2_t *)&self->_srgb[16], v2).f64[0]
       + vaddvq_f64(vmulq_f64(*(float64x2_t *)self->_srgb, (float64x2_t)xmmword_1A42D35D0));
}

- (double)blue
{
  return *(double *)&self->_srgb[16];
}

- (double)green
{
  return *(double *)&self->_srgb[8];
}

- (double)red
{
  return *(double *)self->_srgb;
}

- (PFParallaxColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  float64x2_t v45 = *(float64x2_t *)&a5;
  v60.receiver = self;
  v60.super_class = (Class)PFParallaxColor;
  double v5 = [(PFParallaxColor *)&v60 init];
  v6.f64[0] = a3;
  v6.f64[1] = a4;
  *(float64x2_t *)v5->_srgb = v6;
  *(float64x2_t *)&v5->_srgb[16] = v45;
  int8x16_t v58 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
  v7.i64[0] = 0x8000000000000000;
  int8x16_t v54 = v7;
  __asm { FMOV            V2.2D, #1.0 }
  int8x16_t v49 = _Q2;
  float64x2_t v47 = (float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f64(v45), (int8x16_t)vcgtzq_f64(v45)), vorrq_s8(vandq_s8((int8x16_t)v45, v7), _Q2), (int8x16_t)0);
  float64x2_t v48 = (float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v6, v58), _Q2), vorrq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vcgtzq_f64(v6)));
  float64x2_t v13 = (float64x2_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  int8x16_t v51 = (int8x16_t)v13;
  float64x2_t v42 = vabsq_f64(v6);
  float64x2_t v43 = vabsq_f64(v45);
  v13.f64[0] = 12.92;
  float64x2_t v14 = vdivq_f64(v43, v13);
  float64x2_t v15 = vdivq_f64(v42, (float64x2_t)vdupq_n_s64(0x4029D70A3D70A3D7uLL));
  int8x16_t v44 = (int8x16_t)v15;
  int8x16_t v46 = (int8x16_t)v14;
  v15.f64[0] = 0.055;
  float64x2_t v16 = vaddq_f64(v43, v15);
  float64x2_t v17 = (float64x2_t)vdupq_n_s64(0x3FF0E147AE147AE1uLL);
  simd_double2 v18 = (simd_double2)vdivq_f64(vaddq_f64(v42, (float64x2_t)vdupq_n_s64(0x3FAC28F5C28F5C29uLL)), v17);
  v17.f64[0] = 1.055;
  simd_double2 x = (simd_double2)(unint64_t)*(_OWORD *)&vdivq_f64(v16, v17);
  simd_double2 v41 = _simd_pow_d2(v18, (simd_double2)vdupq_n_s64(0x4003333333333333uLL));
  int8x16_t v19 = (int8x16_t)_simd_pow_d2(x, (simd_double2)xmmword_1A42D35E0);
  v20.f64[0] = 0.04045;
  float64x2_t v21 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vcgtq_f64(v42, (float64x2_t)vdupq_n_s64(0x3FA4B5DCC63F1412uLL))), (int8x16_t)v41, v44);
  float64x2_t v22 = vmulq_f64(v47, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64((int64x2_t)vcgtq_f64(v43, v20).u64[0]), v19, v46));
  float64x2_t v23 = vmulq_f64(v48, v21);
  v21.f64[0] = 0.017752387;
  v24.f64[1] = 0.757894462;
  float64x2_t v25 = vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A42D3570, v23.f64[0]), (float64x2_t)xmmword_1A42D3580, v23, 1);
  v24.f64[0] = 0.109442094;
  float64x2_t v26 = vmlaq_laneq_f64(vmulq_f64(v23, v21), v24, v23, 1);
  v23.f64[0] = 0.872569225;
  float64x2_t v27 = vmlaq_f64(v26, v23, v22);
  float64x2_t v28 = vmlaq_n_f64(v25, (float64x2_t)xmmword_1A42D3590, v22.f64[0]);
  float64x2_t v55 = (float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f64(v27), (int8x16_t)vcgtzq_f64(v27)), vorrq_s8(vandq_s8((int8x16_t)v27, v54), v49), (int8x16_t)0);
  float64x2_t v59 = (float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v28, v58), v49), vorrq_s8((int8x16_t)vcltzq_f64(v28), (int8x16_t)vcgtzq_f64(v28)));
  simd_double2 v29 = (simd_double2)vandq_s8((int8x16_t)v28, v51);
  simd_double2 v52 = (simd_double2)(unint64_t)*(_OWORD *)&vabsq_f64(v27);
  simd_double2 v50 = _simd_pow_d2(v29, (simd_double2)vdupq_n_s64(0x3FDB851EB851EB85uLL));
  float64x2_t v30 = vmulq_f64((float64x2_t)_simd_pow_d2(v52, (simd_double2)xmmword_1A42D35F0), v55);
  float64x2_t v31 = vmulq_f64((float64x2_t)v50, v59);
  v32.f64[1] = 4.455;
  v32.f64[0] = 0.8056;
  float64x2_t v33 = vmulq_f64(v31, v32);
  v32.f64[0] = 0.3572;
  float64x2_t v34 = vmlaq_laneq_f64(v33, v32, v31, 1);
  float64x2_t v35 = vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1A42D35A0, v31.f64[0]), (float64x2_t)xmmword_1A42D35B0, v31, 1);
  v31.f64[1] = 0.396;
  float64x2_t v56 = vmlaq_n_f64(v35, (float64x2_t)xmmword_1A42D35C0, v30.f64[0]);
  v31.f64[0] = -1.1628;
  *(void *)&v59.f64[0] = *(_OWORD *)&vmlaq_f64(v34, v31, v30);
  long double v36 = atan2(v59.f64[0], v56.f64[1]);
  *(float64_t *)&long long v37 = v56.f64[0];
  *((long double *)&v37 + 1) = v36;
  *(double *)&long long v38 = sqrt(vmlad_n_f64(vmuld_lane_f64(v56.f64[1], v56, 1), v59.f64[0], v59.f64[0]));
  *(_OWORD *)v5->_lhc = v37;
  *(_OWORD *)&v5->_lhc[16] = v38;
  return v5;
}

- (void)dealloc
{
  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxColor;
  [(PFParallaxColor *)&v3 dealloc];
}

- (PFParallaxColor)init
{
  return [(PFParallaxColor *)self initWithRed:0.0 green:0.0 blue:0.0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PFParallaxColor)coolColor
{
  return (PFParallaxColor *)[a1 colorWithTone:0.5 hue:-120.0];
}

+ (PFParallaxColor)warmColor
{
  return (PFParallaxColor *)[a1 colorWithTone:0.5 hue:60.0];
}

+ (PFParallaxColor)colorWithRGBValues:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] != 3)
  {
    if (!a4) {
      goto LABEL_11;
    }
    simd_double2 v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    int8x16_t v19 = [NSString stringWithFormat:@"RGB array is invalid: %@", v5];
    v29[0] = v19;
    float64x2_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a4 = [v18 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v20];

    goto LABEL_10;
  }
  uint64_t v6 = 0;
  while (1)
  {
    int8x16_t v7 = [v5 objectAtIndexedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      break;
    }
    if (++v6 == 3)
    {
      long long v9 = [v5 objectAtIndexedSubscript:0];
      [v9 doubleValue];
      double v11 = v10;

      float64x2_t v12 = [v5 objectAtIndexedSubscript:1];
      [v12 doubleValue];
      double v14 = v13;

      float64x2_t v15 = [v5 objectAtIndexedSubscript:2];
      [v15 doubleValue];
      double v17 = v16;

      a4 = [[PFParallaxColor alloc] initWithRed:v11 green:v14 blue:v17];
      goto LABEL_11;
    }
  }
  if (a4)
  {
    float64x2_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    float64x2_t v22 = NSString;
    int8x16_t v19 = [v5 objectAtIndexedSubscript:v6];
    float64x2_t v23 = [v22 stringWithFormat:@"Color value at index %d is not a number: %@", v6, v19];
    float64x2_t v27 = v23;
    float64x2_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a4 = [v21 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v24];

LABEL_10:
    a4 = 0;
  }
LABEL_11:

  return (PFParallaxColor *)a4;
}

+ (PFParallaxColor)colorWithTone:(double)a3 hue:(double)a4
{
  double v4 = (void *)[objc_alloc((Class)a1) initWithHue:a4 tone:a3];

  return (PFParallaxColor *)v4;
}

+ (PFParallaxColor)blackColor
{
  float64x2_t v2 = [[PFParallaxColor alloc] initWithRed:0.0 green:0.0 blue:0.0];

  return v2;
}

+ (PFParallaxColor)whiteColor
{
  float64x2_t v2 = [[PFParallaxColor alloc] initWithRed:1.0 green:1.0 blue:1.0];

  return v2;
}

+ (PFParallaxColor)colorWithCGColor:(CGColor *)a3
{
  id v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v5, kCGRenderingIntentDefault, a3, 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  double v8 = (void *)[objc_alloc((Class)a1) initWithRed:*Components green:Components[1] blue:Components[2]];
  v8[10] = CopyByMatchingToColorSpace;
  CGColorSpaceRelease(v5);

  return (PFParallaxColor *)v8;
}

@end