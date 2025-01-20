@interface UIColor(PCXColorAdditions)
+ (uint64_t)pcxColorWithCalibratedHue:()PCXColorAdditions saturation:brightness:alpha:;
+ (uint64_t)pcxColorWithCalibratedRed:()PCXColorAdditions green:blue:alpha:;
+ (uint64_t)pcxColorWithCalibratedWhite:()PCXColorAdditions alpha:;
+ (uint64_t)pcxColorWithColorSpace:()PCXColorAdditions components:count:;
+ (uint64_t)pcxColorWithColorSpace:()PCXColorAdditions hue:saturation:brightness:alpha:;
+ (uint64_t)pcxColorWithDeviceCyan:()PCXColorAdditions magenta:yellow:black:alpha:;
+ (uint64_t)pcxColorWithDeviceHue:()PCXColorAdditions saturation:brightness:alpha:;
+ (uint64_t)pcxColorWithDeviceRed:()PCXColorAdditions green:blue:alpha:;
+ (uint64_t)pcxColorWithDeviceWhite:()PCXColorAdditions alpha:;
+ (uint64_t)pcxColorWithGenericGamma22White:()PCXColorAdditions alpha:;
+ (uint64_t)pcxColorWithSRGBRed:()PCXColorAdditions green:blue:alpha:;
- (BOOL)isColorSpaceModelGray;
- (BOOL)isColorSpaceModelRGB;
- (CGColor)pcxColorUsingColorSpace:()PCXColorAdditions;
- (double)pcxAlphaComponent;
- (double)pcxBlueComponent;
- (double)pcxBrightnessComponent;
- (double)pcxGreenComponent;
- (double)pcxHueComponent;
- (double)pcxRedComponent;
- (double)pcxSaturationComponent;
- (uint64_t)pcxGetComponents:()PCXColorAdditions;
@end

@implementation UIColor(PCXColorAdditions)

- (double)pcxHueComponent
{
  double v2 = 0.0;
  [a1 getHue:&v2 saturation:0 brightness:0 alpha:0];
  return v2;
}

- (double)pcxSaturationComponent
{
  double v2 = 0.0;
  [a1 getHue:0 saturation:&v2 brightness:0 alpha:0];
  return v2;
}

- (double)pcxBrightnessComponent
{
  double v2 = 0.0;
  [a1 getHue:0 saturation:0 brightness:&v2 alpha:0];
  return v2;
}

- (double)pcxRedComponent
{
  double v2 = 0.0;
  [a1 getRed:&v2 green:0 blue:0 alpha:0];
  return v2;
}

- (double)pcxGreenComponent
{
  double v2 = 0.0;
  [a1 getRed:0 green:&v2 blue:0 alpha:0];
  return v2;
}

- (double)pcxBlueComponent
{
  double v2 = 0.0;
  [a1 getRed:0 green:0 blue:&v2 alpha:0];
  return v2;
}

- (double)pcxAlphaComponent
{
  double v2 = 0.0;
  [a1 getRed:0 green:0 blue:0 alpha:&v2];
  return v2;
}

- (uint64_t)pcxGetComponents:()PCXColorAdditions
{
  return [a1 getRed:a3 green:a3 + 8 blue:a3 + 16 alpha:a3 + 24];
}

- (CGColor)pcxColorUsingColorSpace:()PCXColorAdditions
{
  result = CGColorCreateCopyByMatchingToColorSpace(a3, kCGRenderingIntentPerceptual, (CGColorRef)[a1 CGColor], 0);
  if (result)
  {
    v5 = result;
    Components = CGColorGetComponents(result);
    uint64_t v7 = [MEMORY[0x1E4F428B8] pcxColorWithColorSpace:a3 components:Components count:CGColorGetNumberOfComponents(v5)];
    CGColorRelease(v5);
    return (CGColor *)v7;
  }
  return result;
}

- (BOOL)isColorSpaceModelRGB
{
  ColorSpace = CGColorGetColorSpace((CGColorRef)[a1 CGColor]);
  return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB;
}

- (BOOL)isColorSpaceModelGray
{
  ColorSpace = CGColorGetColorSpace((CGColorRef)[a1 CGColor]);
  return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelMonochrome;
}

+ (uint64_t)pcxColorWithSRGBRed:()PCXColorAdditions green:blue:alpha:
{
  v7[4] = *MEMORY[0x1E4F143B8];
  *(double *)uint64_t v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  if (sRGBColorSpace_once != -1) {
    dispatch_once(&sRGBColorSpace_once, &__block_literal_global_89_0);
  }
  return [a1 pcxColorWithColorSpace:sRGBColorSpace_result components:v7 count:4];
}

+ (uint64_t)pcxColorWithGenericGamma22White:()PCXColorAdditions alpha:
{
  v5[2] = *MEMORY[0x1E4F143B8];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  if (GenericGrayGamma22ColorSpace_once != -1) {
    dispatch_once(&GenericGrayGamma22ColorSpace_once, &__block_literal_global_91_0);
  }
  return [a1 pcxColorWithColorSpace:GenericGrayGamma22ColorSpace_result components:v5 count:2];
}

+ (uint64_t)pcxColorWithCalibratedWhite:()PCXColorAdditions alpha:
{
  v5[2] = *MEMORY[0x1E4F143B8];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  if (CalibratedGray_once != -1) {
    dispatch_once(&CalibratedGray_once, &__block_literal_global_93);
  }
  return [a1 pcxColorWithColorSpace:CalibratedGray_result components:v5 count:2];
}

+ (uint64_t)pcxColorWithDeviceWhite:()PCXColorAdditions alpha:
{
  v5[2] = *MEMORY[0x1E4F143B8];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  if (DeviceRGB_once != -1) {
    dispatch_once(&DeviceRGB_once, &__block_literal_global_95);
  }
  return [a1 pcxColorWithColorSpace:DeviceRGB_result components:v5 count:2];
}

+ (uint64_t)pcxColorWithDeviceRed:()PCXColorAdditions green:blue:alpha:
{
  v7[4] = *MEMORY[0x1E4F143B8];
  *(double *)uint64_t v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  if (DeviceRGB_once != -1) {
    dispatch_once(&DeviceRGB_once, &__block_literal_global_95);
  }
  return [a1 pcxColorWithColorSpace:DeviceRGB_result components:v7 count:4];
}

+ (uint64_t)pcxColorWithDeviceHue:()PCXColorAdditions saturation:brightness:alpha:
{
  if (DeviceRGB_once != -1) {
    dispatch_once(&DeviceRGB_once, &__block_literal_global_95);
  }
  uint64_t v10 = DeviceRGB_result;

  return [a1 pcxColorWithColorSpace:v10 hue:a2 saturation:a3 brightness:a4 alpha:a5];
}

+ (uint64_t)pcxColorWithDeviceCyan:()PCXColorAdditions magenta:yellow:black:alpha:
{
  return 0;
}

+ (uint64_t)pcxColorWithCalibratedRed:()PCXColorAdditions green:blue:alpha:
{
  v7[4] = *MEMORY[0x1E4F143B8];
  *(double *)uint64_t v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  if (CalibratedRGB_once != -1) {
    dispatch_once(&CalibratedRGB_once, &__block_literal_global_97);
  }
  return [a1 pcxColorWithColorSpace:CalibratedRGB_result components:v7 count:4];
}

+ (uint64_t)pcxColorWithCalibratedHue:()PCXColorAdditions saturation:brightness:alpha:
{
  if (CalibratedRGB_once != -1) {
    dispatch_once(&CalibratedRGB_once, &__block_literal_global_97);
  }
  uint64_t v10 = CalibratedRGB_result;

  return [a1 pcxColorWithColorSpace:v10 hue:a2 saturation:a3 brightness:a4 alpha:a5];
}

+ (uint64_t)pcxColorWithColorSpace:()PCXColorAdditions components:count:
{
  if (CGColorSpaceGetNumberOfComponents(space) + 1 != a5) {
    return 0;
  }
  CGColorRef v7 = CGColorCreate(space, a4);
  uint64_t v8 = [MEMORY[0x1E4F428B8] colorWithCGColor:v7];
  CFRelease(v7);
  return v8;
}

+ (uint64_t)pcxColorWithColorSpace:()PCXColorAdditions hue:saturation:brightness:alpha:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  *(float *)&a2 = a2;
  float v7 = a3;
  float v8 = a4;
  float32x4_t v9 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0), (float32x4_t)xmmword_1B7E7E0B0);
  float32x4_t v10 = v9;
  v10.i32[3] = 0;
  float32x4_t v11 = vsubq_f32(v9, vrndmq_f32(v10));
  v11.i32[3] = 0;
  __asm { FMOV            V4.4S, #6.0 }
  float32x4_t v17 = vmulq_f32(vminnmq_f32(v11, (float32x4_t)xmmword_1B7E7E0C0), _Q4);
  __asm { FMOV            V4.4S, #-3.0 }
  float32x4_t v19 = vabsq_f32(vaddq_f32(v17, _Q4));
  __asm { FMOV            V4.4S, #-1.0 }
  float32x4_t v21 = vaddq_f32(v19, _Q4);
  v21.i32[3] = 0;
  float32x4_t v22 = vmaxnmq_f32(v21, (float32x4_t)0);
  v22.i32[3] = 0;
  float32x4_t v23 = vmulq_n_f32(vaddq_f32(vminnmq_f32(v22, (float32x4_t)xmmword_1B7E75890), _Q4), v7);
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v25 = vmulq_n_f32(vaddq_f32(v23, _Q1), v8);
  float64x2_t v27 = vcvtq_f64_f32(*(float32x2_t *)v25.f32);
  double v28 = v25.f32[2];
  double v29 = a5;
  return [a1 pcxColorWithColorSpace:a7 components:&v27 count:4];
}

@end