@interface PTDisparityFilterColorSimilarity
- (PTDisparityFilterColorSimilarity)initWithMetalContext:(id)a3;
- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8;
- (void)reset;
@end

@implementation PTDisparityFilterColorSimilarity

- (PTDisparityFilterColorSimilarity)initWithMetalContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PTDisparityFilterColorSimilarity;
  v5 = [(PTDisparityFilterColorSimilarity *)&v31 init];
  if (v5)
  {
    float v6 = 0.0;
    uint64_t v7 = -1;
    v8 = v32;
    do
    {
      uint64_t v9 = 0;
      int v10 = -1;
      do
      {
        float v11 = pow(2.71828183, (float)((float)((float)((float)v10 * (float)v10) + (float)((float)(int)v7 * (float)(int)v7)) * -0.5))* 0.159154943;
        float v6 = v6 + v11;
        *(float *)&v8[v9] = v11;
        v9 += 3;
        ++v10;
      }
      while (v9 != 9);
      ++v7;
      ++v8;
    }
    while (v7 != 2);
    for (uint64_t i = 0; i != 9; ++i)
      *(float *)&v32[i] = *(float *)&v32[i] / v6;
    _S0 = v32[0];
    _S1 = v32[1];
    __asm { FCVT            H0, S0 }
    v30[0] = _S0;
    __asm { FCVT            H0, S1 }
    v30[1] = _S0;
    _S0 = v32[2];
    _S1 = v32[3];
    __asm { FCVT            H0, S0 }
    v30[2] = _S0;
    __asm { FCVT            H0, S1 }
    v29[0] = _S0;
    _S0 = v32[4];
    _S1 = v32[5];
    __asm { FCVT            H0, S0 }
    v29[1] = _S0;
    __asm { FCVT            H0, S1 }
    v29[2] = _S0;
    v23 = objc_opt_new();
    [v23 setConstantHalf3:v30 withName:@"kWeights2DRow0_half3"];
    [v23 setConstantHalf3:v29 withName:@"kWeights2DRow1_half3"];
    uint64_t v24 = [v4 computePipelineStateFor:@"temporalFilterExponentialMovingAverageColorSimilarities" withConstants:v23];
    temporalFilterExponentialMovingAverageColorSimilarities = v5->_temporalFilterExponentialMovingAverageColorSimilarities;
    v5->_temporalFilterExponentialMovingAverageColorSimilarities = (MTLComputePipelineState *)v24;

    if (v5->_temporalFilterExponentialMovingAverageColorSimilarities)
    {
      v5->_frameIndex = 0;
      v26 = v5;
    }
    else
    {
      v27 = _PTLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PTDisparityFilterColorSimilarity initWithMetalContext:](v27);
      }

      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return 0;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  v17 = [a3 computeCommandEncoder];
  [v17 setComputePipelineState:self->_temporalFilterExponentialMovingAverageColorSimilarities];
  [v17 setTexture:self->_inputRGB atIndex:0];
  if (self->_frameIndex) {
    id v18 = v16;
  }
  else {
    id v18 = 0;
  }
  [v17 setTexture:v18 atIndex:1];

  [v17 setTexture:v15 atIndex:2];
  [v17 setTexture:v14 atIndex:3];
  [v17 setTexture:v13 atIndex:4];

  __int16 v26 = 12902;
  __int16 v25 = COERCE_UNSIGNED_INT(20.0);
  [v17 setBytes:&v26 length:2 atIndex:0];
  [v17 setBytes:&v25 length:2 atIndex:1];
  uint64_t v19 = [v14 width];
  uint64_t v20 = [v14 height];

  v24[0] = v19;
  v24[1] = v20;
  v24[2] = 1;
  long long v22 = xmmword_1D081F8F0;
  uint64_t v23 = 1;
  [v17 dispatchThreads:v24 threadsPerThreadgroup:&v22];
  [v17 endEncoding];
  ++self->_frameIndex;

  return 0;
}

- (void)reset
{
  self->_frameIndex = 0;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  v8 = _PTLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[PTDisparityFilterColorSimilarity temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:](v8);
  }

  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputRGB, 0);

  objc_storeStrong((id *)&self->_temporalFilterExponentialMovingAverageColorSimilarities, 0);
}

- (void)initWithMetalContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_temporalFilterExponentialMovingAverageColorSimilarities";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)temporalDisparityFilter:(os_log_t)log inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Not supported", v1, 2u);
}

@end