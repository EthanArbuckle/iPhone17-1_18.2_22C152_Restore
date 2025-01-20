@interface PTFilterEMA_LKT
- (PTFilterEMA_LKT)initWithMetalContext:(id)a3;
- (PTFilterEMA_LKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9;
- (int)emaFilter:(id)a3 inDisplacement:(id)a4 inTexPrev:(id)a5 inTex:(id)a6 outTex:(id)a7 frameIndex:(int)a8 scale:(float)a9;
- (int)emaFilterDisparityNormal:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 inNormalPrev:(id)a8 inNormal:(id)a9 outNormal:(id)a10 frameIndex:(int)a11;
- (int)gaussEMAFilter:(id)a3 inDisplacement:(id)a4 inTexPrev:(id)a5 inTex:(id)a6 outTex:(id)a7 frameIndex:(int)a8;
- (int)gaussEMAFilterNormal:(id)a3 inDisplacement:(id)a4 inNormalPrev:(id)a5 inNormal:(id)a6 outNormal:(id)a7 frameIndex:(int)a8;
- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8;
- (void)reset;
@end

@implementation PTFilterEMA_LKT

- (PTFilterEMA_LKT)initWithMetalContext:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)PTFilterEMA_LKT;
  v6 = [(PTFilterEMA_LKT *)&v69 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    uint64_t v67 = 0x408000003F800000;
    uint64_t v68 = 0x3F8000003E6B851FLL;
    HIDWORD(v66) = 1069547520;
    float v8 = 0.0;
    uint64_t v9 = -1;
    v10 = v70;
    do
    {
      uint64_t v11 = 0;
      int v12 = -1;
      do
      {
        float v13 = pow(2.71828183, (float)((float)((float)((float)v12 * (float)v12) + (float)((float)(int)v9 * (float)(int)v9)) * -0.5))* 0.159154943;
        float v8 = v8 + v13;
        *(float *)&v10[v11] = v13;
        v11 += 3;
        ++v12;
      }
      while (v11 != 9);
      ++v9;
      ++v10;
    }
    while (v9 != 2);
    for (uint64_t i = 0; i != 9; ++i)
      *(float *)&v70[i] = *(float *)&v70[i] / v8;
    _S0 = v70[0];
    _S1 = v70[1];
    __asm { FCVT            H0, S0 }
    HIWORD(v65) = _S0;
    __asm { FCVT            H0, S1 }
    LOWORD(v66) = _S0;
    _S0 = v70[2];
    _S1 = v70[3];
    __asm { FCVT            H0, S0 }
    WORD1(v66) = _S0;
    __asm { FCVT            H0, S1 }
    LOWORD(v65) = _S0;
    _S0 = v70[4];
    _S1 = v70[5];
    __asm { FCVT            H0, S0 }
    WORD1(v65) = _S0;
    __asm { FCVT            H0, S1 }
    WORD2(v65) = _S0;
    v25 = objc_opt_new();
    objc_msgSend(v25, "setConstantValue:type:withName:", &v68, 4, @"kIIRUpdateCoefficients", v65, v66, v67);
    [v25 setConstantValue:&v67 type:4 withName:@"kMotionThresholdMinMax"];
    uint64_t v26 = [v5 computePipelineStateFor:@"temporalFilterEMA_LKT" withConstants:v25];
    temporalFilterEMA_LKT = v7->_temporalFilterEMA_LKT;
    v7->_temporalFilterEMA_LKT = (MTLComputePipelineState *)v26;

    if (v7->_temporalFilterEMA_LKT)
    {
      uint64_t v28 = [v5 computePipelineStateFor:@"temporalFilterEMA_LKTDisparityNormal" withConstants:v25];
      temporalFilterEMA_LKTDisparityNormal = v7->_temporalFilterEMA_LKTDisparityNormal;
      v7->_temporalFilterEMA_LKTDisparityNormal = (MTLComputePipelineState *)v28;

      if (v7->_temporalFilterEMA_LKTDisparityNormal)
      {
        [v25 setConstantValue:(char *)&v66 + 4 type:3 withName:@"kGaussianWidth"];
        [v25 setConstantValue:(char *)&v65 + 6 type:18 withName:@"kWeights2DRow0"];
        [v25 setConstantValue:&v65 type:18 withName:@"kWeights2DRow1"];
        uint64_t v30 = [v5 computePipelineStateFor:@"temporalFilterGaussEMA_LKTNormal" withConstants:v25];
        temporalFilterGaussEMA_LKTNormal = v7->_temporalFilterGaussEMA_LKTNormal;
        v7->_temporalFilterGaussEMA_LKTNormal = (MTLComputePipelineState *)v30;

        if (v7->_temporalFilterGaussEMA_LKTNormal)
        {
          uint64_t v32 = [v5 computePipelineStateFor:@"temporalFilterGaussEMA_LKT" withConstants:v25];
          temporalFilterGaussEMA_LKT = v7->_temporalFilterGaussEMA_LKT;
          v7->_temporalFilterGaussEMA_LKT = (MTLComputePipelineState *)v32;

          if (v7->_temporalFilterGaussEMA_LKT)
          {
            v34 = v7;
LABEL_23:

            goto LABEL_24;
          }
          v35 = _PTLogSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[PTFilterEMA_LKT initWithMetalContext:].cold.4(v35, v57, v58, v59, v60, v61, v62, v63);
          }
        }
        else
        {
          v35 = _PTLogSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[PTFilterEMA_LKT initWithMetalContext:](v35, v50, v51, v52, v53, v54, v55, v56);
          }
        }
      }
      else
      {
        v35 = _PTLogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[PTFilterEMA_LKT initWithMetalContext:](v35, v43, v44, v45, v46, v47, v48, v49);
        }
      }
    }
    else
    {
      v35 = _PTLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[PTFilterEMA_LKT initWithMetalContext:](v35, v36, v37, v38, v39, v40, v41, v42);
      }
    }

    v34 = 0;
    goto LABEL_23;
  }
  v34 = 0;
LABEL_24:

  return v34;
}

- (PTFilterEMA_LKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v13 = a3;
  v14 = [(PTFilterEMA_LKT *)self initWithMetalContext:v13];
  v15 = v14;
  if (v14)
  {
    v14->_frameIndex = 0;
    long long v16 = *(_OWORD *)&a4->var0;
    v14->_disparitySize.depth = a4->var2;
    *(_OWORD *)&v14->_disparitySize.width = v16;
    long long v17 = *(_OWORD *)&a5->var0;
    v14->_disparityFilteredSize.depth = a5->var2;
    *(_OWORD *)&v14->_disparityFilteredSize.width = v17;
    v18 = PTDefaultsGetDictionary();
    v19 = [v18 objectForKeyedSubscript:@"PortraitDump"];
    if (v19)
    {
      uint64_t v20 = +[PTUtil temporaryDirectory:v19];
      dumpInputOutputFolder = v15->_dumpInputOutputFolder;
      v15->_dumpInputOutputFolder = (NSString *)v20;
    }
    v22 = [v18 objectForKeyedSubscript:@"PTDisparityFilterLKTQuality"];

    if (v22) {
      uint64_t v23 = (int)[v22 intValue];
    }
    else {
      uint64_t v23 = 1;
    }
    v24 = [PTOpticalFlow alloc];
    long long v29 = *(_OWORD *)&a7->var0;
    unint64_t var2 = a7->var2;
    uint64_t v25 = [(PTOpticalFlow *)v24 initWithMetalContext:v13 colorSize:&v29 lktPreset:v23 allocateDisplacementFWD:0 needConversionBGRA2YUVA:0 inverseFlow:1];
    opticalFlow = v15->_opticalFlow;
    v15->_opticalFlow = (PTOpticalFlow *)v25;

    v27 = v15;
  }

  return v15;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return [(PTOpticalFlow *)self->_opticalFlow estimateDisplacementStream:a3 destRGBA:a4 outDisplacement:a5];
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  float v8 = _PTLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[PTFilterEMA_LKT temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:](v8);
  }

  return -1;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  if (a5 == a7)
  {
    uint64_t v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTFilterEMA_LKT temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:](v11);
    }

    return -1;
  }
  else
  {
    LODWORD(v9) = 1.0;
    int result = -[PTFilterEMA_LKT emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:](self, "emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:", a3, a4, a5, a6, v9);
    ++self->_frameIndex;
  }
  return result;
}

- (int)emaFilter:(id)a3 inDisplacement:(id)a4 inTexPrev:(id)a5 inTex:(id)a6 outTex:(id)a7 frameIndex:(int)a8 scale:(float)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  float v36 = a9;
  if (a8)
  {
    v21 = [v16 computeCommandEncoder];
    if (!v21)
    {
      v22 = _PTLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    [v21 setComputePipelineState:self->_temporalFilterEMA_LKT];
    [v21 setTexture:v17 atIndex:0];
    [v21 setTexture:v18 atIndex:1];
    [v21 setTexture:v19 atIndex:2];
    [v21 setTexture:v20 atIndex:3];
    [v21 setBytes:&v36 length:4 atIndex:0];
    v35[0] = [v20 width];
    v35[1] = [v20 height];
    v35[2] = 1;
    long long v33 = xmmword_1D081F8F0;
    uint64_t v34 = 1;
    [v21 dispatchThreads:v35 threadsPerThreadgroup:&v33];
    [v21 endEncoding];
  }
  else
  {
    uint64_t v30 = [(PTMetalContext *)self->_metalContext textureUtil];
    v21 = v30;
    if (a9 == 1.0)
    {
      [v30 copy:v16 inTex:v19 outTex:v20];
    }
    else
    {
      *(float *)&double v31 = a9;
      [v30 multiply:v16 inTex:v19 outTex:v20 multiplier:v31];
    }
  }

  return 0;
}

- (int)gaussEMAFilter:(id)a3 inDisplacement:(id)a4 inTexPrev:(id)a5 inTex:(id)a6 outTex:(id)a7 frameIndex:(int)a8
{
  id v14 = a4;
  id v15 = a5;
  if (a8)
  {
    id v16 = a7;
    id v17 = a6;
    id v18 = a3;
    id v19 = [v18 computeCommandEncoder];

    if (!v19)
    {
      id v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    [v19 setComputePipelineState:self->_temporalFilterGaussEMA_LKT];
    [v19 setTexture:v14 atIndex:0];
    [v19 setTexture:v15 atIndex:1];
    [v19 setTexture:v17 atIndex:2];

    [v19 setTexture:v16 atIndex:3];
    uint64_t v28 = [v16 width];
    uint64_t v29 = [v16 height];

    v38[0] = v28;
    v38[1] = v29;
    v38[2] = 1;
    long long v36 = xmmword_1D081F8F0;
    uint64_t v37 = 1;
    [v19 dispatchThreads:v38 threadsPerThreadgroup:&v36];
    [v19 endEncoding];
  }
  else
  {
    metalContext = self->_metalContext;
    id v31 = a7;
    id v32 = a6;
    id v33 = a3;
    uint64_t v34 = [(PTMetalContext *)metalContext textureUtil];
    [v34 copy:v33 inTex:v32 outTex:v31];
  }
  return 0;
}

- (int)gaussEMAFilterNormal:(id)a3 inDisplacement:(id)a4 inNormalPrev:(id)a5 inNormal:(id)a6 outNormal:(id)a7 frameIndex:(int)a8
{
  id v14 = a4;
  id v15 = a5;
  if (a8)
  {
    id v16 = a7;
    id v17 = a6;
    id v18 = a3;
    id v19 = [v18 computeCommandEncoder];

    if (!v19)
    {
      id v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    [v19 setComputePipelineState:self->_temporalFilterGaussEMA_LKTNormal];
    [v19 setTexture:v14 atIndex:0];
    [v19 setTexture:v15 atIndex:1];
    [v19 setTexture:v17 atIndex:2];

    [v19 setTexture:v16 atIndex:3];
    uint64_t v28 = [v16 width];
    uint64_t v29 = [v16 height];

    v38[0] = v28;
    v38[1] = v29;
    v38[2] = 1;
    long long v36 = xmmword_1D081F8F0;
    uint64_t v37 = 1;
    [v19 dispatchThreads:v38 threadsPerThreadgroup:&v36];
    [v19 endEncoding];
  }
  else
  {
    metalContext = self->_metalContext;
    id v31 = a7;
    id v32 = a6;
    id v33 = a3;
    uint64_t v34 = [(PTMetalContext *)metalContext textureUtil];
    [v34 copy:v33 inTex:v32 outTex:v31];
  }
  return 0;
}

- (int)emaFilterDisparityNormal:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 inNormalPrev:(id)a8 inNormal:(id)a9 outNormal:(id)a10 frameIndex:(int)a11
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  if (a11)
  {
    id v20 = a10;
    id v21 = a9;
    id v22 = a7;
    id v23 = a6;
    id v24 = a3;
    uint64_t v25 = [v24 computeCommandEncoder];

    if (!v25)
    {
      uint64_t v26 = _PTLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v26, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    [v25 setComputePipelineState:self->_temporalFilterEMA_LKTDisparityNormal];
    [v25 setTexture:v17 atIndex:0];
    [v25 setTexture:v18 atIndex:1];
    [v25 setTexture:v23 atIndex:2];

    [v25 setTexture:v19 atIndex:3];
    [v25 setTexture:v21 atIndex:4];

    [v25 setTexture:v22 atIndex:5];
    [v25 setTexture:v20 atIndex:6];

    uint64_t v34 = [v22 width];
    uint64_t v35 = [v22 height];

    v47[0] = v34;
    v47[1] = v35;
    v47[2] = 1;
    long long v45 = xmmword_1D081F8F0;
    uint64_t v46 = 1;
    [v25 dispatchThreads:v47 threadsPerThreadgroup:&v45];
    [v25 endEncoding];
  }
  else
  {
    metalContext = self->_metalContext;
    id v37 = a10;
    id v38 = a9;
    id v39 = a7;
    id v40 = a6;
    id v41 = a3;
    uint64_t v42 = [(PTMetalContext *)metalContext textureUtil];
    [v42 copy:v41 inTex:v40 outTex:v39];

    uint64_t v43 = [(PTMetalContext *)self->_metalContext textureUtil];
    [v43 copy:v41 inTex:v38 outTex:v37];
  }
  return 0;
}

- (void)reset
{
  self->_frameIndex = 0;
  [(PTOpticalFlow *)self->_opticalFlow reset];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumpInputOutputFolder, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_temporalFilterEMA_LKTDisparityNormal, 0);
  objc_storeStrong((id *)&self->_temporalFilterGaussEMA_LKTNormal, 0);
  objc_storeStrong((id *)&self->_temporalFilterGaussEMA_LKT, 0);
  objc_storeStrong((id *)&self->_temporalFilterEMA_LKT, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)temporalDisparityFilter:(os_log_t)log inDisplacement:inStatePrev:inDisparity:outDisparity:outState:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Unsupported", v1, 2u);
}

- (void)temporalDisparityFilter:(os_log_t)log inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Invalid filtered prev size", v1, 2u);
}

@end