@interface GVSRollAnalyzer
- (GVSRollAnalyzer)initWithTimeConstant:(float)a3 initialVariance:(float)a4;
- (float)rollEstimate;
- (float)rollRate;
- (float)rollVariance;
- (float)timeConstant;
- (float)timeVariance;
- (void)reset;
- (void)updateWithRoll:(float)a3 atTime:(double)a4;
@end

@implementation GVSRollAnalyzer

- (GVSRollAnalyzer)initWithTimeConstant:(float)a3 initialVariance:(float)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GVSRollAnalyzer;
  v6 = [(GVSRollAnalyzer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_timeConstant = a3;
    v6->_initVariance = a4;
    [(GVSRollAnalyzer *)v6 reset];
  }
  return v7;
}

- (void)reset
{
  self->_isInitialized = 0;
  self->_prevRoll = 0.0;
  self->_prevTime = 0.0;
  *(void *)&self->_rollRate = 0;
  float v2 = self->_timeConstant * self->_timeConstant;
  self->_timeVariance = self->_initVariance;
  *(&self->_timeVariance + 1) = v2;
}

- (void)updateWithRoll:(float)a3 atTime:(double)a4
{
  double prevTime = self->_prevTime;
  if (prevTime <= a4)
  {
    if (self->_isInitialized)
    {
      float prevRoll = self->_prevRoll;
    }
    else
    {
      self->_averageRoll = a3;
      float timeConstant = self->_timeConstant;
      self->_averageTime = a4 - timeConstant;
      *(float *)&uint64_t v8 = timeConstant * timeConstant;
      HIDWORD(v8) = LODWORD(self->_initVariance);
      *(_DWORD *)&self->_covariance[12] = 0;
      *(void *)&self->_covariance[4] = v8;
      self->_isInitialized = 1;
      double prevTime = a4;
      float prevRoll = a3;
    }
    float v9 = a3 + 3.14159265;
    float v10 = prevRoll;
    if (prevRoll > v9)
    {
      float v10 = prevRoll;
      do
        float v10 = v10 + -6.2832;
      while (v10 > v9);
    }
    for (i = a3 + -3.14159265; v10 < i; float v10 = v10 + 6.2832)
      ;
    float v12 = self->_averageRoll + (float)(v10 - prevRoll);
    double v13 = a4 - prevTime;
    *(float *)&double v13 = v13;
    *(float *)&double v13 = self->_timeConstant / (float)(self->_timeConstant + *(float *)&v13);
    double v14 = a4 + *(float *)&v13 * (self->_averageTime - a4);
    float v15 = a3 + (float)(*(float *)&v13 * (float)(v12 - a3));
    *(double *)v4.i64 = a4 - v14;
    v4.f32[0] = a4 - v14;
    float32x4_t v16 = v4;
    v16.f32[1] = a3 - v15;
    float32x4_t v17 = v16;
    v16.f32[2] = a3 - v15;
    self->_averageRoll = v15;
    v17.i32[2] = v4.i32[0];
    float32x4_t v18 = vmulq_f32(v17, v16);
    float32x4_t v19 = vsubq_f32(*(float32x4_t *)&self->_covariance[4], v18);
    float32x4_t v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0);
    v20.i32[3] = 0;
    v19.i32[3] = 0;
    v18.i32[3] = 0;
    _Q6 = vmlaq_f32(v18, v19, v20);
    *(float32x4_t *)&self->_covariance[4] = _Q6;
    self->_float prevRoll = a3;
    self->_double prevTime = a4;
    self->_averageTime = v14;
    _S0 = _Q6.f32[2] / _Q6.f32[0];
    self->_rollRate = v15 + (float)((float)(_Q6.f32[2] / _Q6.f32[0]) * v4.f32[0]);
    self->_rollVariance = _Q6.f32[2] / _Q6.f32[0];
    __asm { FMLS            S1, S0, V6.S[2] }
    self->_timeVariance = _S1;
    *((_DWORD *)&self->_timeVariance + 1) = _Q6.i32[0];
  }
  else
  {
    [(GVSRollAnalyzer *)self reset];
  }
}

- (float)timeConstant
{
  return self->_timeConstant;
}

- (float)rollEstimate
{
  return self->_rollRate;
}

- (float)rollRate
{
  return self->_rollVariance;
}

- (float)rollVariance
{
  return self->_timeVariance;
}

- (float)timeVariance
{
  return *(&self->_timeVariance + 1);
}

@end