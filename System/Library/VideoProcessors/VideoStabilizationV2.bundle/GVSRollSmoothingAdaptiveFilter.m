@interface GVSRollSmoothingAdaptiveFilter
- (BOOL)shouldRampUp;
- (GVSRollSmoothingAdaptiveFilter)initWithMaxTimescale:(float)a3 minTimescale:(float)a4 transitionTime:(float)a5 analyzer:(id)a6 rampingSettings:(GVSRollSmoothingAdaptiveFilterRampingSettings *)a7;
- (float)filteredRoll;
- (void)reset;
- (void)updateRoll:(float)prevRoll pitch:(float)a4 atTime:(double)a5;
@end

@implementation GVSRollSmoothingAdaptiveFilter

- (GVSRollSmoothingAdaptiveFilter)initWithMaxTimescale:(float)a3 minTimescale:(float)a4 transitionTime:(float)a5 analyzer:(id)a6 rampingSettings:(GVSRollSmoothingAdaptiveFilterRampingSettings *)a7
{
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GVSRollSmoothingAdaptiveFilter;
  v14 = [(GVSRollSmoothingAdaptiveFilter *)&v19 init];
  if (!v14)
  {
LABEL_8:
    v17 = v14;
    goto LABEL_10;
  }
  v15 = objc_alloc_init(GVSIIR2FilterFloat);
  filter = v14->_filter;
  v14->_filter = v15;

  objc_storeStrong((id *)&v14->_analyzer, a6);
  if (!v14->_filter)
  {
    v17 = 0;
    goto LABEL_10;
  }
  v17 = 0;
  if (a4 > 0.0 && v14->_analyzer)
  {
    v14->_maxTimescale = a3;
    v14->_minTimescale = a4;
    if (a3 < a4)
    {
      v14->_maxTimescale = a4;
      a3 = a4;
    }
    v14->_rampFactorPerSecond = powf(a3 / a4, 1.0 / a5);
    v14->_diffSqThreshHigh = a7->var0 * a7->var0;
    v14->_diffSqThreshLow = a7->var1 * a7->var1;
    v14->_slopeSqThreshHigh = a7->var2 * a7->var2;
    v14->_slopeSqThreshLow = a7->var3 * a7->var3;
    v14->_baselineVariance = a7->var4 * a7->var4;
    [(GVSRollSmoothingAdaptiveFilter *)v14 reset];
    goto LABEL_8;
  }
LABEL_10:

  return v17;
}

- (void)reset
{
  self->_filteredRoll = 0.0;
  self->_prevRoll = 0.0;
  self->_currentTimescale = self->_maxTimescale;
  self->_prevTime = 0.0;
  self->_forcedRampDownTime = 0.0;
  self->_isRampingUp = 1;
}

- (void)updateRoll:(float)prevRoll pitch:(float)a4 atTime:(double)a5
{
  float v6 = prevRoll;
  if (a4 < 1.0472 && (double prevTime = self->_prevTime, prevTime <= a5))
  {
    prevRoll = self->_prevRoll;
    if (vabds_f32(v6, prevRoll) > 3.14159265)
    {
      float v10 = v6 + 3.14159265;
      float v11 = self->_prevRoll;
      if (prevRoll > v10)
      {
        float v11 = self->_prevRoll;
        do
          float v11 = v11 + -6.2832;
        while (v11 > v10);
      }
      for (i = v6 + -3.14159265; v11 < i; float v11 = v11 + 6.2832)
        ;
      *(float *)&double v13 = v11 - prevRoll;
      [(GVSIIR2FilterFloat *)self->_filter applyOffset:v13];
      [(GVSIIR2FilterFloat *)self->_filter filteredValue];
      self->_filteredRoll = v14;
      double prevTime = self->_prevTime;
    }
    float v15 = a5 - prevTime;
    float v16 = -v15;
    if (self->_isRampingUp) {
      float v16 = v15;
    }
    float v17 = fminf(fmaxf(self->_currentTimescale * powf(self->_rampFactorPerSecond, v16), self->_minTimescale), self->_maxTimescale);
    self->_currentTimescale = v17;
    *(float *)&double v18 = (float)(v17 * 0.5) / (float)((float)(v17 * 0.5) + v15);
    *(float *)&double v19 = v6;
    [(GVSIIR2FilterFloat *)self->_filter updateValue:v19 withPole:v18];
    self->_filteredRoll = v20;
    *(float *)&double v21 = v6;
    [(GVSRollAnalyzer *)self->_analyzer updateWithRoll:v21 atTime:a5];
    if (self->_forcedRampDownTime >= a5) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = [(GVSRollSmoothingAdaptiveFilter *)self shouldRampUp];
    }
    self->_isRampingUp = v22;
  }
  else
  {
    [(GVSIIR2FilterFloat *)self->_filter reset];
    [(GVSRollAnalyzer *)self->_analyzer reset];
    [(GVSRollAnalyzer *)self->_analyzer timeConstant];
    self->_forcedRampDownTime = v9 + a5;
    self->_isRampingUp = 0;
    self->_currentTimescale = self->_minTimescale;
  }
  self->_prevRoll = v6;
  self->_double prevTime = a5;
}

- (BOOL)shouldRampUp
{
  float filteredRoll = self->_filteredRoll;
  [(GVSRollAnalyzer *)self->_analyzer rollEstimate];
  float v5 = (float)(filteredRoll - v4) * (float)(filteredRoll - v4);
  [(GVSRollAnalyzer *)self->_analyzer rollRate];
  float v7 = v6;
  [(GVSRollAnalyzer *)self->_analyzer rollRate];
  float v9 = v8;
  [(GVSRollAnalyzer *)self->_analyzer timeVariance];
  float v11 = v10;
  [(GVSRollAnalyzer *)self->_analyzer rollVariance];
  float v13 = v12 + self->_baselineVariance;
  if (self->_isRampingUp)
  {
    if (v5 < (float)(v13 * self->_diffSqThreshHigh))
    {
      uint64_t v14 = 28;
      return (float)((float)(v7 * v9) * v11) < (float)(v13 * *(float *)((char *)&self->super.isa + v14));
    }
  }
  else if (v5 < (float)(v13 * self->_diffSqThreshLow))
  {
    uint64_t v14 = 32;
    return (float)((float)(v7 * v9) * v11) < (float)(v13 * *(float *)((char *)&self->super.isa + v14));
  }
  return 0;
}

- (float)filteredRoll
{
  return self->_filteredRoll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);

  objc_storeStrong((id *)&self->_filter, 0);
}

@end