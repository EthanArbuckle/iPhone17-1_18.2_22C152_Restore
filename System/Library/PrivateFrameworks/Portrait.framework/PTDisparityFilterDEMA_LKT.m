@interface PTDisparityFilterDEMA_LKT
- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3;
- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9;
- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3 sensorPort:(id)a4;
- (int)copyDisparity:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5;
- (int)exponentialMovingAverageFilter:(id)a3 inDisplacement:(id)a4 inDemaPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outDEMA:(id)a8;
- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8;
- (void)reset;
@end

@implementation PTDisparityFilterDEMA_LKT

- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3 sensorPort:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)PTDisparityFilterDEMA_LKT;
  v9 = [(PTDisparityFilterDEMA_LKT *)&v48 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metalContext, a3);
    v10->_direction = -1.0;
    if (([@"PortTypeFrontInfrared" isEqual:v8] & 1) == 0
      && ([@"PortTypeFront" isEqual:v8] & 1) == 0
      && ([@"PortTypeBackTelephoto" isEqual:v8] & 1) == 0)
    {
      [@"PortTypeBack" isEqual:v8];
    }
    int v47 = 0;
    v10->_motionVisualization = 0;
    v11 = objc_opt_new();
    [v11 setNormalizedCoordinates:1];
    [v11 setMinFilter:1];
    [v11 setMagFilter:1];
    v12 = [v7 device];
    uint64_t v13 = [v12 newSamplerStateWithDescriptor:v11];
    samplerState = v10->_samplerState;
    v10->_samplerState = (MTLSamplerState *)v13;

    v15 = objc_opt_new();
    [v15 setConstantFloat2:@"kIIRUpdateCoefficients_float2" withName:0.00029296876];
    [v15 setConstantFloat2:@"kMotionThresholdMinMax_float2" withName:524288.125];
    *(float *)&double v16 = v10->_direction;
    [v15 setConstantFloat:@"kDirection_float" withName:v16];
    [v15 setConstantValue:&v47 type:29 withName:@"kMotionCorrectionFunction"];
    uint64_t v17 = [v7 computePipelineStateFor:@"temporalFilterDEMA_LKT" withConstants:v15];
    temporalFilterDEMA_LKT = v10->_temporalFilterDEMA_LKT;
    v10->_temporalFilterDEMA_LKT = (MTLComputePipelineState *)v17;

    if (v10->_temporalFilterDEMA_LKT)
    {
      uint64_t v19 = [v7 computePipelineStateFor:@"temporalFilterDEMA_LKT_VisualizeMotion" withConstants:v15];
      temporalFilterDEMA_LKT_VisualizeMotion = v10->_temporalFilterDEMA_LKT_VisualizeMotion;
      v10->_temporalFilterDEMA_LKT_VisualizeMotion = (MTLComputePipelineState *)v19;

      if (v10->_temporalFilterDEMA_LKT_VisualizeMotion)
      {
        uint64_t v21 = [v7 computePipelineStateFor:@"resampleDisparity" withConstants:v15];
        resampleDisparity = v10->_resampleDisparity;
        v10->_resampleDisparity = (MTLComputePipelineState *)v21;

        if (v10->_resampleDisparity)
        {
          v23 = v10;
LABEL_18:

          goto LABEL_19;
        }
        v24 = _PTLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:](v24, v39, v40, v41, v42, v43, v44, v45);
        }
      }
      else
      {
        v24 = _PTLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:](v24, v32, v33, v34, v35, v36, v37, v38);
        }
      }
    }
    else
    {
      v24 = _PTLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:sensorPort:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }

    v23 = 0;
    goto LABEL_18;
  }
  v23 = 0;
LABEL_19:

  return v23;
}

- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v13 = a3;
  v14 = [(PTDisparityFilterDEMA_LKT *)self initWithMetalContext:v13 sensorPort:a9];
  v15 = v14;
  if (v14)
  {
    v14->_frameCount = 0;
    long long v16 = *(_OWORD *)&a4->var0;
    v14->_disparitySize.depth = a4->var2;
    *(_OWORD *)&v14->_disparitySize.width = v16;
    long long v17 = *(_OWORD *)&a5->var0;
    v14->_disparityFilteredSize.depth = a5->var2;
    *(_OWORD *)&v14->_disparityFilteredSize.width = v17;
    v18 = [PTOpticalFlow alloc];
    BOOL v19 = v15->_direction == 1.0;
    long long v57 = *(_OWORD *)&a7->var0;
    unint64_t var2 = a7->var2;
    uint64_t v20 = [(PTOpticalFlow *)v18 initWithMetalContext:v13 colorSize:&v57 lktPreset:1 allocateDisplacementFWD:0 needConversionBGRA2YUVA:0 inverseFlow:v19];
    opticalFlow = v15->_opticalFlow;
    v15->_opticalFlow = (PTOpticalFlow *)v20;

    if (!v15->_opticalFlow)
    {
      uint64_t v27 = _PTLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:](v27, v35, v36, v37, v38, v39, v40, v41);
      }
      goto LABEL_14;
    }
    v22 = -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:pixelFormat:", v13, 65, (double)a4->var0, (double)a4->var1);
    globalReduction = v15->_globalReduction;
    v15->_globalReduction = v22;

    if (!v15->_globalReduction)
    {
      uint64_t v27 = _PTLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v27, v42, v43, v44, v45, v46, v47, v48);
      }
      goto LABEL_14;
    }
    v24 = [v13 device];
    uint64_t v25 = [v24 newBufferWithLength:16 options:0];
    avgDisplacement = v15->_avgDisplacement;
    v15->_avgDisplacement = (MTLBuffer *)v25;

    if (!v15->_avgDisplacement)
    {
      uint64_t v27 = _PTLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:](v27, v49, v50, v51, v52, v53, v54, v55);
      }
      goto LABEL_14;
    }
    if (!v15->_globalReduction)
    {
      uint64_t v27 = _PTLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:].cold.4(v27, v28, v29, v30, v31, v32, v33, v34);
      }
LABEL_14:

      v15 = 0;
    }
  }

  return v15;
}

- (PTDisparityFilterDEMA_LKT)initWithMetalContext:(id)a3
{
  return [(PTDisparityFilterDEMA_LKT *)self initWithMetalContext:a3 sensorPort:@"PortTypeBack"];
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return [(PTOpticalFlow *)self->_opticalFlow estimateDisplacementStream:a3 destRGBA:a4 outDisplacement:a5];
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v16 == v18)
  {
    uint64_t v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      [(PTDisparityFilterDEMA_LKT *)v21 temporalDisparityFilter:v23 inDisplacement:v24 inStatePrev:v25 inDisparity:v26 outDisparity:v27 outState:v28];
    }

    int v20 = -10;
  }
  else
  {
    if (self->_frameCount)
    {
      int v20 = [(PTDisparityFilterDEMA_LKT *)self exponentialMovingAverageFilter:v14 inDisplacement:v15 inDemaPrev:v16 inDisparity:v17 outDisparity:v18 outDEMA:v19];
    }
    else
    {
      [(PTDisparityFilterDEMA_LKT *)self copyDisparity:v14 inDisparity:v17 outDisparity:v18];
      [(PTDisparityFilterDEMA_LKT *)self copyDisparity:v14 inDisparity:v17 outDisparity:v19];
      int v20 = 0;
    }
    ++self->_frameCount;
  }

  return v20;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (a8 == 0.0)
  {
    demaStates = self->_demaStates;
    if (!demaStates)
    {
      uint64_t v43 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v29 = [(PTMetalContext *)self->_metalContext textureUtil];
      uint64_t v30 = [v29 createWithWidth:self->_disparityFilteredSize.width height:self->_disparityFilteredSize.height pixelFormat:65];
      uint64_t v31 = [(PTMetalContext *)self->_metalContext textureUtil];
      uint64_t v32 = [v31 createWithWidth:self->_disparityFilteredSize.width height:self->_disparityFilteredSize.height pixelFormat:65];
      objc_msgSend(v43, "arrayWithObjects:", v30, v32, 0);
      uint64_t v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = self->_demaStates;
      self->_demaStates = v33;

      demaStates = self->_demaStates;
    }
    if (self->_frameCount >= 0) {
      int v35 = self->_frameCount & 1;
    }
    else {
      int v35 = -(self->_frameCount & 1);
    }
    uint64_t v36 = [(NSArray *)demaStates objectAtIndexedSubscript:v35];
    int frameCount = self->_frameCount;
    BOOL v38 = __OFADD__(frameCount++, 1);
    char v39 = (frameCount < 0) ^ v38;
    int v40 = frameCount & 1;
    if (v39) {
      int v40 = -v40;
    }
    uint64_t v41 = [(NSArray *)self->_demaStates objectAtIndexedSubscript:v40];
    int v27 = [(PTDisparityFilterDEMA_LKT *)self temporalDisparityFilter:v14 inDisplacement:v15 inStatePrev:v36 inDisparity:v17 outDisparity:v18 outState:v41];
  }
  else
  {
    id v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(PTDisparityFilterDEMA_LKT *)v19 temporalDisparityFilter:v21 inDisplacement:v22 inDisparityPrev:v23 inDisparity:v24 outDisparity:v25 disparityBias:v26];
    }

    int v27 = -10;
  }

  return v27;
}

- (int)exponentialMovingAverageFilter:(id)a3 inDisplacement:(id)a4 inDemaPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outDEMA:(id)a8
{
  globalReduction = self->_globalReduction;
  avgDisplacement = self->_avgDisplacement;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  [(PTGlobalReduction *)globalReduction parallelReductionAverage:v21 inTexture:v20 outGlobalAverage:avgDisplacement];
  uint64_t v22 = [v21 computeCommandEncoder];

  if (!v22)
  {
    uint64_t v23 = _PTLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  uint64_t v31 = 24;
  if (!self->_motionVisualization) {
    uint64_t v31 = 16;
  }
  [v22 setComputePipelineState:*(Class *)((char *)&self->super.isa + v31)];
  [v22 setTexture:v20 atIndex:0];

  [v22 setTexture:v19 atIndex:1];
  [v22 setTexture:v18 atIndex:2];

  [v22 setTexture:v17 atIndex:3];
  [v22 setTexture:v16 atIndex:4];

  [v22 setBuffer:self->_avgDisplacement offset:0 atIndex:0];
  [v22 setSamplerState:self->_samplerState atIndex:0];
  uint64_t v32 = [v17 width];
  uint64_t v33 = [v17 height];

  v37[0] = v32;
  v37[1] = v33;
  v37[2] = 1;
  long long v35 = xmmword_1D081F8F0;
  uint64_t v36 = 1;
  [v22 dispatchThreads:v37 threadsPerThreadgroup:&v35];
  [v22 endEncoding];

  return 0;
}

- (int)copyDisparity:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 computeCommandEncoder];
  if (!v10)
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  [v10 setComputePipelineState:self->_resampleDisparity];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  [v10 setSamplerState:self->_samplerState atIndex:0];
  uint64_t v19 = [v8 width];
  uint64_t v20 = [v8 height];

  v24[0] = v19;
  v24[1] = v20;
  v24[2] = 1;
  long long v22 = xmmword_1D081F8F0;
  uint64_t v23 = 1;
  [v10 dispatchThreads:v24 threadsPerThreadgroup:&v22];
  [v10 endEncoding];

  return 0;
}

- (void)reset
{
  self->_int frameCount = 0;
  [(PTOpticalFlow *)self->_opticalFlow reset];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplerState, 0);
  objc_storeStrong((id *)&self->_demaStates, 0);
  objc_storeStrong((id *)&self->_dumpInputOutputFolder, 0);
  objc_storeStrong((id *)&self->_avgDisplacement, 0);
  objc_storeStrong((id *)&self->_globalReduction, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_resampleDisparity, 0);
  objc_storeStrong((id *)&self->_temporalFilterDEMA_LKT_VisualizeMotion, 0);
  objc_storeStrong((id *)&self->_temporalFilterDEMA_LKT, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 sensorPort:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 sensorPort:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 sensorPort:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 disparityFilteredSize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 disparityFilteredSize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 disparityFilteredSize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)temporalDisparityFilter:(uint64_t)a3 inDisplacement:(uint64_t)a4 inStatePrev:(uint64_t)a5 inDisparity:(uint64_t)a6 outDisparity:(uint64_t)a7 outState:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)temporalDisparityFilter:(uint64_t)a3 inDisplacement:(uint64_t)a4 inDisparityPrev:(uint64_t)a5 inDisparity:(uint64_t)a6 outDisparity:(uint64_t)a7 disparityBias:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end