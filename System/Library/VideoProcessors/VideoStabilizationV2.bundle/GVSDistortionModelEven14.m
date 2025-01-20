@interface GVSDistortionModelEven14
- (BOOL)isValid;
- (GVSDistortionModelEven14)init;
- (double)computeScalingAtPointsQuad:(float32x4_t)a3;
- (double)distortionCenter;
- (float)computeInverseScalingAtPoint:(GVSDistortionModelEven14 *)self;
- (float)computeScalingAtPoint:(GVSDistortionModelEven14 *)self;
- (void)reset;
- (void)setDistortionCenter:(GVSDistortionModelEven14 *)self;
- (void)updateWithCoefficients:(float *)a3 pixelSizeMm:(float)a4 center:;
@end

@implementation GVSDistortionModelEven14

- (GVSDistortionModelEven14)init
{
  v5.receiver = self;
  v5.super_class = (Class)GVSDistortionModelEven14;
  v2 = [(GVSDistortionModelEven14 *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GVSDistortionModelEven14 *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  *(_OWORD *)&self->_coefficients[4] = 0u;
  *(_OWORD *)self->_coefficients = 0u;
  *(void *)self->_distortionCenter = 0;
  self->_pixelSizeMmSq = 0.0;
}

- (BOOL)isValid
{
  return self->_pixelSizeMmSq > 0.0;
}

- (void)updateWithCoefficients:(float *)a3 pixelSizeMm:(float)a4 center:
{
  if (a3)
  {
    coefficients = self->_coefficients;
    for (uint64_t i = 7; i != -1; --i)
      *coefficients++ = a3[i] * 0.01;
    self->_coefficients[7] = self->_coefficients[7] + 1.0;
    self->_pixelSizeMmSq = a4 * a4;
    *(void *)self->_distortionCenter = v4;
  }
  else
  {
    [(GVSDistortionModelEven14 *)self reset];
  }
}

- (float)computeScalingAtPoint:(GVSDistortionModelEven14 *)self
{
  -[GVSDistortionModelEven14 computeInverseScalingAtPoint:](self, "computeInverseScalingAtPoint:");
  return 1.0 / v2;
}

- (float)computeInverseScalingAtPoint:(GVSDistortionModelEven14 *)self
{
  uint64_t v3 = 0;
  float32x2_t v4 = vsub_f32(v2, *(float32x2_t *)self->_distortionCenter);
  float v5 = self->_pixelSizeMmSq * vaddv_f32(vmul_f32(v4, v4));
  float result = self->_coefficients[0];
  do
    float result = self->_coefficients[++v3] + (float)(result * v5);
  while (v3 != 7);
  return result;
}

- (double)computeScalingAtPointsQuad:(float32x4_t)a3
{
  uint64_t v3 = 0;
  int32x2_t v4 = *(int32x2_t *)(a1 + 40);
  float32x4_t v5 = vsubq_f32(a2, (float32x4_t)vdupq_lane_s32(v4, 0));
  v6 = (const float *)(a1 + 8);
  float32x4_t v7 = vld1q_dup_f32(v6);
  float32x4_t v8 = vsubq_f32(a3, (float32x4_t)vdupq_lane_s32(v4, 1));
  float32x4_t v9 = vmulq_n_f32(vmlaq_f32(vmulq_f32(v8, v8), v5, v5), *(float *)(a1 + 48));
  do
  {
    float32x4_t v10 = v7;
    v11 = (const float *)(a1 + 12 + v3);
    float32x4_t v12 = vld1q_dup_f32(v11);
    float32x4_t v7 = vmlaq_f32(v12, v9, v10);
    v3 += 4;
  }
  while (v3 != 28);
  float32x4_t v13 = vrecpeq_f32(v7);
  float32x4_t v14 = vmulq_f32(v13, vrecpsq_f32(v7, v13));
  *(void *)&double result = vmulq_f32(v14, vrecpsq_f32(v7, v14)).u64[0];
  return result;
}

- (double)distortionCenter
{
  return *(double *)(a1 + 40);
}

- (void)setDistortionCenter:(GVSDistortionModelEven14 *)self
{
  *(void *)self->_distortionCenter = v2;
}

@end