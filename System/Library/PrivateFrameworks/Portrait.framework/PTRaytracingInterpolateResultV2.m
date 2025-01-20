@interface PTRaytracingInterpolateResultV2
+ (PTNoiseValues)calculateVarReadNoise:(id)a3;
- (PTRaytracingInterpolateResultV2)initWithMetalContext:(id)a3 useExportQualityNoise:(BOOL)a4;
- (void)interpolateRGBWeightUsingRGBALinearToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5 inRGBA:(id)a6;
- (void)interpolateRGBWeightUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5;
@end

@implementation PTRaytracingInterpolateResultV2

- (PTRaytracingInterpolateResultV2)initWithMetalContext:(id)a3 useExportQualityNoise:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PTRaytracingInterpolateResultV2;
  v8 = [(PTRaytracingInterpolateResultV2 *)&v71 init];
  v9 = v8;
  if (v8)
  {
    p_metalContext = (id *)&v8->_metalContext;
    objc_storeStrong((id *)&v8->_metalContext, a3);
    if (v4) {
      uint64_t v11 = 512;
    }
    else {
      uint64_t v11 = 256;
    }
    uint64_t v12 = +[PTPrecomputeRandom computeGaussian:sideLength:](PTPrecomputeRandom, "computeGaussian:sideLength:", v9->_metalContext, v11, v7);
    precomputedGaussian = v9->_precomputedGaussian;
    v9->_precomputedGaussian = (MTLTexture *)v12;

    v9->_precomputedGaussianOffsetMaxValue = v11 - 1;
    v14 = objc_opt_new();
    uint64_t v15 = 0;
    interpolateRGBWeightSourceYUVDestRGBA = v9->_interpolateRGBWeightSourceYUVDestRGBA;
    interpolateRGBWeightSourceYUVDestYUV = v9->_interpolateRGBWeightSourceYUVDestYUV;
    interpolateRGBWeightSourceRGBADestRGBA = v9->_interpolateRGBWeightSourceRGBADestRGBA;
    interpolateRGBWeightRGBALinearDestRGBA = v9->_interpolateRGBWeightRGBALinearDestRGBA;
    interpolateRGBWeightRGBALinearDestYUV = v9->_interpolateRGBWeightRGBALinearDestYUV;
    while (1)
    {
      unsigned int v70 = supportedColorTransferFunctions_0[v15];
      [v14 reset];
      [v14 setConstantValue:&v70 type:29 withName:@"kColorTransferFunctionToLinear"];
      uint64_t v21 = [*p_metalContext computePipelineStateFor:@"interpolateRGBWeightSourceYUVDestRGBA_V2" withConstants:v14];
      v22 = interpolateRGBWeightSourceYUVDestRGBA[v70];
      interpolateRGBWeightSourceYUVDestRGBA[v70] = (MTLComputePipelineState *)v21;

      if (!interpolateRGBWeightSourceYUVDestRGBA[v70]) {
        break;
      }
      uint64_t v23 = [*p_metalContext computePipelineStateFor:@"interpolateRGBWeightSourceYUVDestYUV_V2" withConstants:v14];
      v24 = interpolateRGBWeightSourceYUVDestYUV[v70];
      interpolateRGBWeightSourceYUVDestYUV[v70] = (MTLComputePipelineState *)v23;

      if (!interpolateRGBWeightSourceYUVDestYUV[v70])
      {
        v32 = _PTLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:](v32, v40, v41, v42, v43, v44, v45, v46);
        }
        goto LABEL_24;
      }
      uint64_t v25 = [*p_metalContext computePipelineStateFor:@"interpolateRGBWeightSourceRGBADestRGBA_V2" withConstants:v14];
      v26 = interpolateRGBWeightSourceRGBADestRGBA[v70];
      interpolateRGBWeightSourceRGBADestRGBA[v70] = (MTLComputePipelineState *)v25;

      if (!interpolateRGBWeightSourceRGBADestRGBA[v70])
      {
        v32 = _PTLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:](v32, v47, v48, v49, v50, v51, v52, v53);
        }
        goto LABEL_24;
      }
      uint64_t v27 = [*p_metalContext computePipelineStateFor:@"interpolateRGBWeightRGBALinearDestRGBA_V2" withConstants:v14];
      v28 = interpolateRGBWeightRGBALinearDestRGBA[v70];
      interpolateRGBWeightRGBALinearDestRGBA[v70] = (MTLComputePipelineState *)v27;

      if (!interpolateRGBWeightRGBALinearDestRGBA[v70])
      {
        v32 = _PTLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.4(v32, v54, v55, v56, v57, v58, v59, v60);
        }
        goto LABEL_24;
      }
      uint64_t v29 = [*p_metalContext computePipelineStateFor:@"interpolateRGBWeightRGBALinearDestYUV_V2" withConstants:v14];
      v30 = interpolateRGBWeightRGBALinearDestYUV[v70];
      interpolateRGBWeightRGBALinearDestYUV[v70] = (MTLComputePipelineState *)v29;

      if (!interpolateRGBWeightRGBALinearDestYUV[v70])
      {
        v32 = _PTLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:].cold.5(v32, v61, v62, v63, v64, v65, v66, v67);
        }
        goto LABEL_24;
      }
      if (++v15 == 5)
      {
        v31 = v9;
        id v7 = v69;
        goto LABEL_25;
      }
    }
    v32 = _PTLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:](v32, v33, v34, v35, v36, v37, v38, v39);
    }
LABEL_24:
    id v7 = v69;

    v31 = 0;
LABEL_25:
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)interpolateRGBWeightUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int32x2_t v11 = 0;
  int64x2_t v62 = 0u;
  unsigned long long v63 = 0u;
  if (v9)
  {
    [v9 scissorRect];
    unsigned long long v13 = v63;
    uint64_t v53 = v13 >> 64;
    uint64_t v12 = v13;
    int32x2_t v11 = vmovn_s64(v62);
  }
  else
  {
    uint64_t v53 = 0;
    uint64_t v12 = 0;
  }
  v61[1] = v11.i16[2];
  v61[0] = v11.i16[0];
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, [v9 frameId]);
  v60[1] = v14;
  v60[0] = v15;
  +[PTRaytracingInterpolateResultV2 calculateVarReadNoise:v9];
  v59[0] = v16;
  v59[1] = v17;
  v18 = [v9 sourceColor];
  v19 = [v18 transferFunction];
  int v20 = +[PTColorConversion getTransferFunction:v19 toLinear:1];

  uint64_t v21 = [v9 sourceColor];
  if ([v21 isRGB])
  {
    v22 = [v9 destinationColor];
    int v23 = [v22 isRGB];

    if (v23)
    {
      [v8 setComputePipelineState:self->_interpolateRGBWeightSourceRGBADestRGBA[v20]];
      v24 = [v9 sourceColor];
      uint64_t v25 = [v24 texRGBA];
      [v8 setTexture:v25 atIndex:0];

      [v8 setTexture:v10 atIndex:1];
      [v8 setTexture:self->_precomputedGaussian atIndex:2];
      v26 = [v9 destinationColor];
      uint64_t v27 = [v26 texRGBA];
      [v8 setTexture:v27 atIndex:3];

      [v8 setBytes:v59 length:8 atIndex:0];
      [v8 setBytes:v60 length:4 atIndex:1];
      [v8 setBytes:v61 length:4 atIndex:2];
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v51 = v12;
  id v52 = v10;
  *(_WORD *)&v56[8] = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  v28 = [v9 sourceColor];
  +[PTColorConversion getColorMatrix:v28 toRGB:1];

  uint64_t v29 = [v9 sourceColor];
  v30 = [v29 texLuma];
  v31 = [v9 sourceColor];
  v32 = [v31 texChroma];
  *(void *)uint64_t v56 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:v30 texChroma:v32];

  uint64_t v33 = [v9 destinationColor];
  LODWORD(v29) = [v33 isRGB];

  if (v29)
  {
    [v8 setComputePipelineState:self->_interpolateRGBWeightSourceYUVDestRGBA[v20]];
    uint64_t v34 = [v9 sourceColor];
    uint64_t v35 = [v34 texLuma];
    [v8 setTexture:v35 atIndex:0];

    uint64_t v36 = [v9 sourceColor];
    uint64_t v37 = [v36 texChroma];
    [v8 setTexture:v37 atIndex:1];

    id v10 = v52;
    [v8 setTexture:v52 atIndex:2];
    [v8 setTexture:self->_precomputedGaussian atIndex:3];
    uint64_t v38 = [v9 destinationColor];
    uint64_t v39 = [v38 texRGBA];
    [v8 setTexture:v39 atIndex:4];

    [v8 setBytes:v59 length:8 atIndex:0];
    [v8 setBytes:v60 length:4 atIndex:1];
    [v8 setBytes:&v56[2] length:24 atIndex:2];
    [v8 setBytes:v56 length:2 atIndex:3];
    uint64_t v40 = v8;
    uint64_t v41 = 4;
  }
  else
  {
    long long v54 = 0uLL;
    uint64_t v55 = 0;
    uint64_t v42 = [v9 destinationColor];
    +[PTColorConversion getColorMatrix:v42 toRGB:0];

    [v8 setComputePipelineState:self->_interpolateRGBWeightSourceYUVDestYUV[v20]];
    uint64_t v43 = [v9 sourceColor];
    uint64_t v44 = [v43 texLuma];
    [v8 setTexture:v44 atIndex:0];

    uint64_t v45 = [v9 sourceColor];
    uint64_t v46 = [v45 texChroma];
    [v8 setTexture:v46 atIndex:1];

    id v10 = v52;
    [v8 setTexture:v52 atIndex:2];
    [v8 setTexture:self->_precomputedGaussian atIndex:3];
    uint64_t v47 = [v9 destinationColor];
    uint64_t v48 = [v47 texLuma];
    [v8 setTexture:v48 atIndex:4];

    uint64_t v49 = [v9 destinationColor];
    uint64_t v50 = [v49 texChroma];
    [v8 setTexture:v50 atIndex:5];

    [v8 setBytes:v59 length:8 atIndex:0];
    [v8 setBytes:v60 length:4 atIndex:1];
    [v8 setBytes:&v56[2] length:24 atIndex:2];
    [v8 setBytes:&v54 length:24 atIndex:3];
    [v8 setBytes:v56 length:2 atIndex:4];
    uint64_t v40 = v8;
    uint64_t v41 = 5;
  }
  [v40 setBytes:v61 length:4 atIndex:v41];
  uint64_t v12 = v51;
LABEL_12:
  *(void *)&v56[2] = v12;
  uint64_t v57 = v53;
  uint64_t v58 = 1;
  long long v54 = xmmword_1D081F8E0;
  uint64_t v55 = 1;
  [v8 dispatchThreads:&v56[2] threadsPerThreadgroup:&v54];
}

- (void)interpolateRGBWeightUsingRGBALinearToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5 inRGBA:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int32x2_t v14 = 0;
  int64x2_t v50 = 0u;
  long long v51 = 0u;
  if (v11)
  {
    [v11 scissorRect];
    uint64_t v15 = *((void *)&v51 + 1);
    uint64_t v41 = v51;
    int32x2_t v14 = vmovn_s64(v50);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v41 = 0;
  }
  v49[1] = v14.i16[2];
  v49[0] = v14.i16[0];
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, [v11 frameId]);
  v48[1] = v16;
  v48[0] = v17;
  +[PTRaytracingInterpolateResultV2 calculateVarReadNoise:v11];
  v47[0] = v18;
  v47[1] = v19;
  int v20 = [v11 sourceColor];
  uint64_t v21 = [v20 transferFunction];
  int v22 = +[PTColorConversion getTransferFunction:v21 toLinear:1];

  int v23 = [v11 destinationColor];
  LODWORD(v21) = [v23 isRGB];

  if (v21)
  {
    [v10 setComputePipelineState:self->_interpolateRGBWeightRGBALinearDestRGBA[v22]];
    [v10 setTexture:v13 atIndex:0];
    [v10 setTexture:v12 atIndex:1];
    [v10 setTexture:self->_precomputedGaussian atIndex:2];
    v24 = [v11 destinationColor];
    uint64_t v25 = [v24 texRGBA];
    [v10 setTexture:v25 atIndex:3];

    [v10 setBytes:v47 length:8 atIndex:0];
    [v10 setBytes:v48 length:4 atIndex:1];
    v26 = v10;
    uint64_t v27 = 2;
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    v28 = [v11 sourceColor];
    +[PTColorConversion getColorMatrix:v28 toRGB:0];

    uint64_t v29 = [v11 sourceColor];
    [v29 texLuma];
    uint64_t v40 = v15;
    int v39 = v22;
    id v30 = v13;
    v32 = id v31 = v12;
    uint64_t v33 = [v11 sourceColor];
    uint64_t v34 = [v33 texChroma];
    LOWORD(v42) = +[PTColorConversion getChromaSubsampledFromLuma:v32 texChroma:v34];

    id v12 = v31;
    id v13 = v30;

    [v10 setComputePipelineState:self->_interpolateRGBWeightRGBALinearDestYUV[v39]];
    [v10 setTexture:v30 atIndex:0];
    [v10 setTexture:v12 atIndex:1];
    [v10 setTexture:self->_precomputedGaussian atIndex:2];
    uint64_t v35 = [v11 destinationColor];
    uint64_t v36 = [v35 texLuma];
    [v10 setTexture:v36 atIndex:3];

    uint64_t v37 = [v11 destinationColor];
    uint64_t v38 = [v37 texChroma];
    [v10 setTexture:v38 atIndex:4];

    uint64_t v15 = v40;
    [v10 setBytes:v47 length:8 atIndex:0];
    [v10 setBytes:v48 length:4 atIndex:1];
    [v10 setBytes:&v44 length:24 atIndex:2];
    [v10 setBytes:&v42 length:2 atIndex:3];
    v26 = v10;
    uint64_t v27 = 4;
  }
  [v26 setBytes:v49 length:4 atIndex:v27];
  uint64_t v44 = v41;
  uint64_t v45 = v15;
  uint64_t v46 = 1;
  long long v42 = xmmword_1D081F8E0;
  uint64_t v43 = 1;
  [v10 dispatchThreads:&v44 threadsPerThreadgroup:&v42];
}

+ (PTNoiseValues)calculateVarReadNoise:(id)a3
{
  id v3 = a3;
  int v4 = [v3 AGC];
  int v5 = [v3 conversionGain];
  int v6 = objc_msgSend(v3, "readNoise_1x");
  int v7 = objc_msgSend(v3, "readNoise_8x");
  id v8 = [v3 renderState];
  [v8 noiseScaleFactor];
  float v10 = v9;

  id v11 = [v3 renderState];
  int v12 = [v11 sourceColorBitDepth];

  [v3 totalSensorCropRectSize];
  double v14 = v13;
  uint64_t v15 = [v3 sourceColor];
  double v16 = v14 / (double)(unint64_t)[v15 width];
  [v3 totalSensorCropRectSize];
  double v18 = v16 * v17;
  int v19 = [v3 sourceColor];
  float v20 = v10 / (v18 / (double)(unint64_t)[v19 height]);

  float v21 = v20 / 1023.0;
  if (v12 == 10) {
    float v21 = (float)(v20 / 1023.0) * 12.0;
  }
  float v22 = (float)v4 / 255.0;
  float v23 = (float)((float)v5 / 65535.0) * v21;
  float v24 = (float)((float)v6 / 65535.0) * (float)((float)v6 / 65535.0);
  float v25 = (float)(v24 - (float)((float)((float)v7 / 65535.0) * (float)((float)v7 / 65535.0))) / 0.98438;
  float v26 = v23 * (float)((float)(v25 + (float)((float)(v22 * (float)(v24 - v25)) * v22)) * v23);
  float v27 = v22 * v23;

  float v28 = v26;
  float v29 = v27;
  result.var1 = v29;
  result.var0 = v28;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputedGaussian, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestYUV[i + 8], 0);
  for (uint64_t j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestRGBA[j + 8], 0);
  for (uint64_t k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_interpolateRGBWeightSourceRGBADestRGBA[k + 8], 0);
  for (uint64_t m = 144; m != 72; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
    m -= 8;
  }
  while (m);
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end