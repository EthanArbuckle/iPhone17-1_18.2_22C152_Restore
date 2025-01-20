@interface PTDisparityFilterExponentialMovingAverageLKT
- (PTDisparityFilterExponentialMovingAverageLKT)initWithMetalContext:(id)a3;
- (PTDisparityFilterExponentialMovingAverageLKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9;
- (int)copyDisparityWithBias:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 disparityBias:(float)a6;
- (int)exponentialMovingAverageFilter:(PTDisparityFilterExponentialMovingAverageLKT *)self inDisplacement:(SEL)a2 inDisparityPrev:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 updateCoefficient:(id)a6 disparityBias:(id)a7;
- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8;
- (void)reset;
@end

@implementation PTDisparityFilterExponentialMovingAverageLKT

- (PTDisparityFilterExponentialMovingAverageLKT)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PTDisparityFilterExponentialMovingAverageLKT;
  v6 = [(PTDisparityFilterExponentialMovingAverageLKT *)&v29 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  *(_WORD *)v7->_iirUpdateCoefficient = COERCE_UNSIGNED_INT(0.25);
  uint64_t v8 = [v5 computePipelineStateFor:@"temporalFilterExponentialMovingAverageLKT" withConstants:0];
  temporalFilterExponentialMovingAverageLKT = v7->_temporalFilterExponentialMovingAverageLKT;
  v7->_temporalFilterExponentialMovingAverageLKT = (MTLComputePipelineState *)v8;

  if (!v7->_temporalFilterExponentialMovingAverageLKT)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityFilterExponentialMovingAverageLKT initWithMetalContext:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_9;
  }
  uint64_t v10 = [v5 computePipelineStateFor:@"copyDisparityWithBias" withConstants:0];
  copyDisparityWithBias = v7->_copyDisparityWithBias;
  v7->_copyDisparityWithBias = (MTLComputePipelineState *)v10;

  if (!v7->_copyDisparityWithBias)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityFilterExponentialMovingAverageLKT initWithMetalContext:](v13, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_9:

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v12 = v7;
LABEL_11:

  return v12;
}

- (PTDisparityFilterExponentialMovingAverageLKT)initWithMetalContext:(id)a3 disparitySize:(id *)a4 disparityFilteredSize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v13 = a3;
  uint64_t v14 = [(PTDisparityFilterExponentialMovingAverageLKT *)self initWithMetalContext:v13];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_frameCount = 0;
    long long v16 = *(_OWORD *)&a4->var0;
    v14->_disparitySize.depth = a4->var2;
    *(_OWORD *)&v14->_disparitySize.width = v16;
    long long v17 = *(_OWORD *)&a5->var0;
    v14->_disparityFilteredSize.depth = a5->var2;
    *(_OWORD *)&v14->_disparityFilteredSize.width = v17;
    uint64_t v18 = PTDefaultsGetDictionary();
    uint64_t v19 = [v18 objectForKeyedSubscript:@"PortraitDump"];
    if (v19)
    {
      uint64_t v20 = +[PTUtil temporaryDirectory:v19];
      dumpInputOutputFolder = v15->_dumpInputOutputFolder;
      v15->_dumpInputOutputFolder = (NSString *)v20;
    }
    uint64_t v22 = [v18 objectForKeyedSubscript:@"PTDisparityFilterLKTQuality"];

    if (v22) {
      uint64_t v23 = (int)[v22 intValue];
    }
    else {
      uint64_t v23 = 1;
    }
    uint64_t v24 = [PTOpticalFlow alloc];
    long long v29 = *(_OWORD *)&a7->var0;
    unint64_t var2 = a7->var2;
    uint64_t v25 = [(PTOpticalFlow *)v24 initWithMetalContext:v13 colorSize:&v29 lktPreset:v23];
    opticalFlow = v15->_opticalFlow;
    v15->_opticalFlow = (PTOpticalFlow *)v25;

    uint64_t v27 = v15;
  }

  return v15;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return [(PTOpticalFlow *)self->_opticalFlow estimateDisplacementStream:a3 destRGBA:a4 outDisplacement:a5];
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  LODWORD(a6) = [(PTDisparityFilterExponentialMovingAverageLKT *)self temporalDisparityFilter:v16 inDisplacement:a4 inDisparityPrev:a5 inDisparity:a6 outDisparity:v15 disparityBias:0.0];
  long long v17 = [(PTMetalContext *)self->_metalContext textureUtil];
  LODWORD(a4) = [v17 copy:v16 inTex:v15 outTex:v14];

  return a4 | a6;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v16 == v18)
  {
    uint64_t v22 = _PTLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PTFilterEMA_LKT temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:](v22);
    }

    int v21 = -1;
  }
  else
  {
    if (self->_frameCount)
    {
      LOWORD(v19) = *(_WORD *)self->_iirUpdateCoefficient;
      *(float *)&double v20 = a8;
      int v21 = [(PTDisparityFilterExponentialMovingAverageLKT *)self exponentialMovingAverageFilter:v14 inDisplacement:v15 inDisparityPrev:v16 inDisparity:v17 outDisparity:v18 updateCoefficient:v19 disparityBias:v20];
    }
    else
    {
      *(float *)&double v19 = a8;
      [(PTDisparityFilterExponentialMovingAverageLKT *)self copyDisparityWithBias:v14 inDisparity:v17 outDisparity:v18 disparityBias:v19];
      int v21 = 0;
    }
    ++self->_frameCount;
  }

  return v21;
}

- (int)exponentialMovingAverageFilter:(PTDisparityFilterExponentialMovingAverageLKT *)self inDisplacement:(SEL)a2 inDisparityPrev:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 updateCoefficient:(id)a6 disparityBias:(id)a7
{
  __int16 v34 = v7;
  int v33 = v8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a3 computeCommandEncoder];
  if (!v18)
  {
    double v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  [v18 setComputePipelineState:self->_temporalFilterExponentialMovingAverageLKT];
  [v18 setTexture:v17 atIndex:0];

  [v18 setTexture:v16 atIndex:1];
  [v18 setTexture:v15 atIndex:2];

  [v18 setTexture:v14 atIndex:3];
  [v18 setBytes:&v34 length:2 atIndex:0];
  [v18 setBytes:&v33 length:4 atIndex:1];
  uint64_t v27 = [v14 width];
  uint64_t v28 = [v14 height];

  v32[0] = v27;
  v32[1] = v28;
  v32[2] = 1;
  long long v30 = xmmword_1D081F8F0;
  uint64_t v31 = 1;
  [v18 dispatchThreads:v32 threadsPerThreadgroup:&v30];
  [v18 endEncoding];

  return 0;
}

- (int)copyDisparityWithBias:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 disparityBias:(float)a6
{
  float v26 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setComputePipelineState:self->_copyDisparityWithBias];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v26 length:4 atIndex:0];
  uint64_t v20 = [v9 width];
  uint64_t v21 = [v9 height];

  v25[0] = v20;
  v25[1] = v21;
  v25[2] = 1;
  long long v23 = xmmword_1D081F8F0;
  uint64_t v24 = 1;
  [v11 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v11 endEncoding];

  return 0;
}

- (void)reset
{
  self->_frameCount = 0;
  [(PTOpticalFlow *)self->_opticalFlow reset];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumpInputOutputFolder, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_copyDisparityWithBias, 0);
  objc_storeStrong((id *)&self->_temporalFilterExponentialMovingAverageLKT, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end