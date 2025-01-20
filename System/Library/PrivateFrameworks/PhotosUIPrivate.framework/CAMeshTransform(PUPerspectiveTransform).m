@interface CAMeshTransform(PUPerspectiveTransform)
+ (id)pu_meshTransformApplyingNormalizedPerspectiveTransform:()PUPerspectiveTransform;
@end

@implementation CAMeshTransform(PUPerspectiveTransform)

+ (id)pu_meshTransformApplyingNormalizedPerspectiveTransform:()PUPerspectiveTransform
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F39C30]);
  float32x4_t v15 = vmulq_f32(a1, (float32x4_t)0);
  int32x4_t v4 = (int32x4_t)vaddq_f32(a3, vmlaq_f32(v15, (float32x4_t)0, a2));
  long long v19 = 0uLL;
  float64x2_t v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v4.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2)));
  uint64_t v21 = 0;
  [v3 addVertex:&v19];
  int32x4_t v5 = (int32x4_t)vaddq_f32(a3, vaddq_f32(a2, v15));
  long long v19 = xmmword_1AEFF7B90;
  float64x2_t v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v5.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v5, 2)));
  uint64_t v21 = 0;
  [v3 addVertex:&v19];
  int32x4_t v6 = (int32x4_t)vaddq_f32(a3, vaddq_f32(a2, a1));
  __asm { FMOV            V1.2D, #1.0 }
  long long v19 = _Q1;
  float64x2_t v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2)));
  uint64_t v21 = 0;
  [v3 addVertex:&v19];
  int32x4_t v12 = (int32x4_t)vaddq_f32(a3, vmlaq_f32(a1, (float32x4_t)0, a2));
  long long v19 = xmmword_1AEFF7D50;
  float64x2_t v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v12.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2)));
  uint64_t v21 = 0;
  [v3 addVertex:&v19];
  long long v19 = xmmword_1AEFF7D60;
  float64x2_t v20 = 0uLL;
  [v3 addFace:&v19];
  [v3 setSubdivisionSteps:0];
  [v3 setDepthNormalization:*MEMORY[0x1E4F39ED0]];
  v13 = (void *)[v3 copy];

  return v13;
}

@end