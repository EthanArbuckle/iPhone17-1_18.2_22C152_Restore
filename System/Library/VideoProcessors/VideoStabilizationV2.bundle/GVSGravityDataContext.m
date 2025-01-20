@interface GVSGravityDataContext
- (BOOL)extractGravityData;
- (GVSGravityDataContext)init;
- (float)gravityFilterTimescale;
- (int)computeGravity:(id *)a3 forTimestamp:(double)a4;
- (int)pushSample:(id *)a3 withPose:(id *)a4 atTime:(double)a5;
- (void)reset;
- (void)setExtractGravityData:(BOOL)a3;
- (void)setGravityFilterTimescale:(float)a3;
@end

@implementation GVSGravityDataContext

- (GVSGravityDataContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)GVSGravityDataContext;
  v2 = [(GVSGravityDataContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GVSGravityDataContext *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_latestTimestamp = 0.0;
  *(_OWORD *)self->_referencePoseGravityEstimate = 0u;
  self->_fusedRingIndex = 0;
}

- (int)pushSample:(id *)a3 withPose:(id *)a4 atTime:(double)a5
{
  double latestTimestamp = self->_latestTimestamp;
  if (latestTimestamp >= a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    float var1 = a4->var1;
    float var2 = a4->var2;
    float var3 = a4->var3;
    float var0 = a4->var0;
    v10.i64[0] = __PAIR64__(LODWORD(var2), LODWORD(var1));
    v10.i64[1] = __PAIR64__(LODWORD(var0), LODWORD(var3));
    float32x4_t v11 = vmulq_f32(v10, (float32x4_t)xmmword_47270);
    int32x4_t v12 = (int32x4_t)vnegq_f32(v11);
    int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v11, vtrn1q_s32((int32x4_t)v11, v12));
    float32x4_t v14 = vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)v12, 8uLL), a3->var1);
    float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v11);
    v15.i32[0] = v12.i32[1];
    v15.i32[3] = v12.i32[2];
    float32x4_t v16 = vmlaq_n_f32(vmlaq_n_f32(v14, (float32x4_t)vextq_s8(v13, v13, 8uLL), a3->var0), v15, a3->var2);
    int32x4_t v17 = (int32x4_t)vnegq_f32(v16);
    int8x16_t v18 = (int8x16_t)vtrn2q_s32((int32x4_t)v16, vtrn1q_s32((int32x4_t)v16, v17));
    float32x4_t v19 = vmlaq_n_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v16, (int8x16_t)v17, 8uLL), var2), (float32x4_t)vextq_s8(v18, v18, 8uLL), var1);
    float32x4_t v20 = (float32x4_t)vrev64q_s32((int32x4_t)v16);
    v20.i32[0] = v17.i32[1];
    v20.i32[3] = v17.i32[2];
    float v21 = a5 - latestTimestamp;
    float v22 = self->_gravityFilterTimescale / (float)(self->_gravityFilterTimescale + v21);
    float32x4_t v23 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)self->_referencePoseGravityEstimate, v22), vaddq_f32(vmlaq_n_f32(vmulq_n_f32(v16, var0), v20, var3), v19), 1.0 - v22);
    float32x4_t v24 = vmulq_f32(v23, v23);
    float v25 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0];
    if (v25 > 0.0)
    {
      uint64_t v26 = LODWORD(v25);
      float32x2_t v27 = vrsqrte_f32((float32x2_t)LODWORD(v25));
      float32x2_t v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26, vmul_f32(v27, v27)));
      float32x4_t v23 = vmulq_n_f32(v23, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26, vmul_f32(v28, v28))).f32[0]);
    }
    *(float32x4_t *)self->_referencePoseGravityEstimate = v23;
    uint64_t fusedRingIndex = self->_fusedRingIndex;
    self->_fusedRingTime[fusedRingIndex] = a5;
    *(_OWORD *)&self->_fusedRingGravity[16 * fusedRingIndex] = *(_OWORD *)self->_referencePoseGravityEstimate;
    self->_double latestTimestamp = a5;
    self->_uint64_t fusedRingIndex = (self->_fusedRingIndex + 1);
    return 0;
  }
}

- (int)computeGravity:(id *)a3 forTimestamp:(double)a4
{
  if (a3)
  {
    uint64_t v4 = 0;
    fusedRingTime = self->_fusedRingTime;
    LODWORD(v6) = -1;
    float v7 = 1.0;
    do
    {
      float v8 = fusedRingTime[v4] - a4;
      float v9 = fabsf(v8);
      if (v7 <= v9) {
        uint64_t v6 = v6;
      }
      else {
        uint64_t v6 = v4;
      }
      if (v7 > v9) {
        float v7 = v9;
      }
      ++v4;
    }
    while (v4 != 256);
    if ((v6 & 0x80000000) != 0)
    {
      v17.i64[0] = 0;
      v17.i32[2] = 0;
    }
    else
    {
      double v10 = fusedRingTime[v6];
      if (v10 >= a4) {
        uint64_t v11 = (v6 - 1);
      }
      else {
        uint64_t v11 = v6;
      }
      if (v10 >= a4) {
        uint64_t v12 = v6;
      }
      else {
        uint64_t v12 = (v6 + 1);
      }
      double v13 = fusedRingTime[v12];
      if (v13 >= a4
        && ((double v14 = fusedRingTime[v11], vabdd_f64(v13, a4) <= 0.0179999992) ? (v15 = v14 <= a4) : (v15 = 0),
            v15 && vabdd_f64(v14, a4) <= 0.0179999992))
      {
        if (vabdd_f64(v13, v14) > 0.000001)
        {
          float v19 = (a4 - v14) / (v13 - v14);
          float32x4_t v17 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)&self->_fusedRingGravity[16 * v12], v19), *(float32x4_t *)&self->_fusedRingGravity[16 * v11], 1.0 - v19);
          float32x4_t v20 = vmulq_f32(v17, v17);
          float v21 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0];
          if (v21 > 0.0)
          {
            uint64_t v22 = LODWORD(v21);
            float32x2_t v23 = vrsqrte_f32((float32x2_t)LODWORD(v21));
            float32x2_t v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22, vmul_f32(v23, v23)));
            float32x4_t v17 = vmulq_n_f32(v17, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22, vmul_f32(v24, v24))).f32[0]);
          }
          goto LABEL_26;
        }
        float32x4_t v16 = (float32x4_t *)((char *)self + 16 * v11);
      }
      else
      {
        float32x4_t v16 = (float32x4_t *)((char *)self + 16 * v6);
      }
      float32x4_t v17 = v16[129];
    }
LABEL_26:
    *(void *)&a3->float var0 = v17.i64[0];
    LODWORD(a3->var2) = v17.i32[2];
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (BOOL)extractGravityData
{
  return self->_extractGravityData;
}

- (void)setExtractGravityData:(BOOL)a3
{
  self->_extractGravityData = a3;
}

- (float)gravityFilterTimescale
{
  return self->_gravityFilterTimescale;
}

- (void)setGravityFilterTimescale:(float)a3
{
  self->_gravityFilterTimescale = a3;
}

@end