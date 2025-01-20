@interface GVSMotionBlurFilter
+ (GVSMotionBlurFilterSettings)defaultSettings;
- (GVSMotionBlurFilter)initWithSettings:(GVSMotionBlurFilterSettings *)a3;
- (float)accumulationFilterPole;
- (float)prevSamplingRate;
- (float32x2_t)filteredBlurVector;
- (float32x2_t)highPassFilter:(float)a3 deltaTime:;
- (float32x2_t)lowPassFilter:(float)a3 deltaTime:;
- (id)updateBlurVector:(double)a3 atTime:;
- (void)reset;
- (void)resume;
- (void)suspend;
@end

@implementation GVSMotionBlurFilter

+ (GVSMotionBlurFilterSettings)defaultSettings
{
  *(_DWORD *)&retstr->var0 = 0;
  *(_OWORD *)&retstr->var1 = xmmword_470F0;
  retstr->var5 = 0.65;
  return result;
}

- (GVSMotionBlurFilter)initWithSettings:(GVSMotionBlurFilterSettings *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GVSMotionBlurFilter;
  v4 = [(GVSMotionBlurFilter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_scale = a3->var4;
    v4->_threshold = a3->var3;
    v4->_accumulationGroupDelay = a3->var5;
    v4->_highPassPole = a3->var2 * 6.2832;
    v4->_lowPassPole = a3->var1 * 6.2832;
    v4->_isSuspended = 0;
    [(GVSMotionBlurFilter *)v4 reset];
  }
  return v5;
}

- (void)reset
{
  self->_isFilterInitialized = 0;
  *(void *)self->_filteredBlurVector = 0;
  self->_prevSamplingRate = 29.997;
}

- (void)suspend
{
  self->_isSuspended = 1;
}

- (void)resume
{
  self->_isSuspended = 0;
}

- (float32x2_t)filteredBlurVector
{
  return vmul_n_f32(a1[1], a1[3].f32[1]);
}

- (float)accumulationFilterPole
{
  float v2 = self->_accumulationGroupDelay * self->_prevSamplingRate;
  return v2 / (float)(v2 + 1.0);
}

- (id)updateBlurVector:(double)a3 atTime:
{
  if (!*(unsigned char *)(a1 + 40))
  {
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(double *)(a1 + 48) = a3 + -1.0 / *(float *)(a1 + 16);
    *(unsigned char *)(a1 + 40) = 1;
  }
  float32x2_t v5 = vmul_f32(a2, a2);
  v5.f32[0] = vaddv_f32(v5);
  float v6 = *(float *)(a1 + 32);
  double v7 = 0.0;
  float32x2_t v8 = 0;
  if (v5.f32[0] > (float)(v6 * v6))
  {
    float v9 = sqrtf(v5.f32[0]);
    float32x2_t v8 = vmul_n_f32(a2, fmaxf(v9 - v6, 0.0) / v9);
  }
  float v10 = a3 - *(double *)(a1 + 48);
  v5.f32[0] = v10;
  [(id)a1 highPassFilter:*(double *)&v8 deltaTime:*(double *)&v5];
  if (!*(unsigned char *)(a1 + 56))
  {
    _D1 = vmul_f32(v8, v8);
    if (vaddv_f32(_D1) > 0.0000001)
    {
      float32x2_t v13 = vmul_f32(v8, v11);
      if (vaddv_f32(v13) > 0.0000001)
      {
        float32x2_t v14 = vmaxnm_f32((float32x2_t)vdup_lane_s32((int32x2_t)vdiv_f32(vadd_f32(v13, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 1)), vadd_f32(_D1, (float32x2_t)vdup_lane_s32((int32x2_t)_D1, 1))), 0), 0);
        __asm { FMOV            V1.2S, #1.0 }
        double v7 = COERCE_DOUBLE(vmul_f32(v8, vminnm_f32(v14, _D1)));
      }
    }
  }
  _D1.f32[0] = v10;
  [(id)a1 lowPassFilter:v7 deltaTime:*(double *)&_D1];
  *(void *)(a1 + 8) = v19;
  *(double *)(a1 + 48) = a3;
  *(float *)(a1 + 16) = 1.0 / v10;

  return [(id)a1 filteredBlurVector];
}

- (float32x2_t)lowPassFilter:(float)a3 deltaTime:
{
  float v5 = expf(-(float)(a1[3].f32[0] * a3));
  float v6 = (float)((float)(v5 / (float)(1.0 - v5)) * 0.5) / (float)((float)((float)(v5 / (float)(1.0 - v5)) * 0.5) + 1.0);
  float32x2_t v7 = vmla_n_f32(vmul_n_f32(a2, 1.0 - v6), a1[8], v6);
  float32x2_t result = vmla_n_f32(vmul_n_f32(v7, 1.0 - v6), a1[9], v6);
  a1[8] = v7;
  a1[9] = result;
  return result;
}

- (float32x2_t)highPassFilter:(float)a3 deltaTime:
{
  float v5 = expf(-(float)(a1[2].f32[1] * a3));
  float v6 = (float)(v5 / (float)(1.0 - v5)) + (float)(v5 / (float)(1.0 - v5));
  float v7 = v6 / (float)(v6 + 1.0);
  float v8 = (float)(v7 + 1.0) / (float)(v7 + v7);
  float32x2_t v9 = vmla_n_f32(vmul_n_f32(a2, 1.0 - v7), a1[10], v7);
  float32x2_t v10 = vmul_n_f32(vsub_f32(a2, v9), v8);
  float32x2_t v11 = vmla_n_f32(vmul_n_f32(v10, 1.0 - v7), a1[11], v7);
  a1[10] = v9;
  a1[11] = v11;
  return vmul_n_f32(vsub_f32(v10, v11), v8);
}

- (float)prevSamplingRate
{
  return self->_prevSamplingRate;
}

@end