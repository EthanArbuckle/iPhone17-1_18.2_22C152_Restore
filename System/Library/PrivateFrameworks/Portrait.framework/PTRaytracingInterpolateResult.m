@interface PTRaytracingInterpolateResult
+ (PTNoiseValues)calculateVarReadNoise:(id)a3;
- (PTRaytracingInterpolateResult)initWithMetalContext:(id)a3 useExportQualityNoise:(BOOL)a4;
- (void)interpolateRGBWeightUsingRGBALinearToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5 inRGBA:(id)a6;
- (void)interpolateRGBWeightUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5;
@end

@implementation PTRaytracingInterpolateResult

- (PTRaytracingInterpolateResult)initWithMetalContext:(id)a3 useExportQualityNoise:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v97.receiver = self;
  v97.super_class = (Class)PTRaytracingInterpolateResult;
  v8 = [(PTRaytracingInterpolateResult *)&v97 init];
  v9 = v8;
  if (!v8)
  {
    v45 = 0;
    goto LABEL_30;
  }
  p_metalContext = (id *)&v8->_metalContext;
  objc_storeStrong((id *)&v8->_metalContext, a3);
  if (v4) {
    int v11 = 512;
  }
  else {
    int v11 = 256;
  }
  int v96 = v11;
  uint64_t v12 = +[PTPrecomputeRandom computeGaussian:sideLength:](PTPrecomputeRandom, "computeGaussian:sideLength:", v9->_metalContext);
  precomputedGaussian = v9->_precomputedGaussian;
  v9->_precomputedGaussian = (MTLTexture *)v12;

  v9->_precomputedGaussianOffsetMaxValue = 0x7FFF;
  v14 = objc_opt_new();
  [v14 setConstantValue:&v96 type:29 withName:@"kSizePrecomputedGaussian"];
  LODWORD(v15) = 2.0;
  [v14 setConstantFloat:@"kSizeNoiseGrain_float" withName:v15];
  int v16 = [v7 imageblocksSupported];
  v17 = @"NoImageblocks";
  if (v16) {
    v17 = &stru_1F269F3B0;
  }
  v18 = v17;
  uint64_t v19 = 0;
  interpolateRGBWeightSourceYUVDestRGBA = v9->_interpolateRGBWeightSourceYUVDestRGBA;
  interpolateRGBWeightSourceYUVDestYUV = v9->_interpolateRGBWeightSourceYUVDestYUV;
  interpolateRGBWeightRGBALinearDestRGBA = v9->_interpolateRGBWeightRGBALinearDestRGBA;
  interpolateRGBWeightSourceRGBADestRGBA = v9->_interpolateRGBWeightSourceRGBADestRGBA;
  v90 = v9;
  interpolateRGBWeightSourceYUVDestYUVPostProcess = v9->_interpolateRGBWeightSourceYUVDestYUVPostProcess;
  interpolateRGBWeightRGBALinearDestYUV = v9->_interpolateRGBWeightRGBALinearDestYUV;
  while (1)
  {
    v22 = v7;
    unsigned int v95 = supportedColorTransferFunctions_2[v19];
    [v14 setConstantValue:&v95 type:29 withName:@"kColorTransferFunctionToLinear"];
    id v23 = *p_metalContext;
    v24 = [NSString stringWithFormat:@"interpolateRGBWeightSourceYUVDestRGBA%@", v18];
    uint64_t v25 = [v23 computePipelineStateFor:v24 withConstants:v14];
    v26 = interpolateRGBWeightSourceYUVDestRGBA[v95];
    interpolateRGBWeightSourceYUVDestRGBA[v95] = (MTLComputePipelineState *)v25;

    if (!interpolateRGBWeightSourceYUVDestRGBA[v95])
    {
      v46 = _PTLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:](v46, v47, v48, v49, v50, v51, v52, v53);
      }
      goto LABEL_26;
    }
    id v27 = *p_metalContext;
    v28 = [NSString stringWithFormat:@"interpolateRGBWeightSourceYUVDestYUV%@", v18];
    uint64_t v29 = [v27 computePipelineStateFor:v28 withConstants:v14];
    v30 = interpolateRGBWeightSourceYUVDestYUV[v95];
    interpolateRGBWeightSourceYUVDestYUV[v95] = (MTLComputePipelineState *)v29;

    if (!interpolateRGBWeightSourceYUVDestYUV[v95])
    {
      v46 = _PTLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:](v46, v54, v55, v56, v57, v58, v59, v60);
      }
      goto LABEL_26;
    }
    id v31 = *p_metalContext;
    v32 = [NSString stringWithFormat:@"interpolateRGBWeightSourceRGBADestRGBA%@", v18];
    uint64_t v33 = [v31 computePipelineStateFor:v32 withConstants:v14];
    v34 = interpolateRGBWeightSourceRGBADestRGBA[v95];
    interpolateRGBWeightSourceRGBADestRGBA[v95] = (MTLComputePipelineState *)v33;

    if (!interpolateRGBWeightSourceRGBADestRGBA[v95])
    {
      v46 = _PTLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:](v46, v61, v62, v63, v64, v65, v66, v67);
      }
      goto LABEL_26;
    }
    id v35 = *p_metalContext;
    v36 = [NSString stringWithFormat:@"interpolateRGBWeightRGBALinearDestRGBA%@", v18];
    uint64_t v37 = [v35 computePipelineStateFor:v36 withConstants:v14];
    v38 = interpolateRGBWeightRGBALinearDestRGBA[v95];
    interpolateRGBWeightRGBALinearDestRGBA[v95] = (MTLComputePipelineState *)v37;

    if (!interpolateRGBWeightRGBALinearDestRGBA[v95])
    {
      v46 = _PTLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.4(v46, v68, v69, v70, v71, v72, v73, v74);
      }
LABEL_26:
      id v7 = v22;
LABEL_27:
      v9 = v90;
      goto LABEL_28;
    }
    id v39 = *p_metalContext;
    v40 = [NSString stringWithFormat:@"interpolateRGBWeightRGBALinearDestYUV%@", v18];
    uint64_t v41 = [v39 computePipelineStateFor:v40 withConstants:v14];
    v42 = interpolateRGBWeightRGBALinearDestYUV[v95];
    interpolateRGBWeightRGBALinearDestYUV[v95] = (MTLComputePipelineState *)v41;

    if (!interpolateRGBWeightRGBALinearDestYUV[v95])
    {
      v46 = _PTLogSystem();
      id v7 = v22;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.5(v46, v76, v77, v78, v79, v80, v81, v82);
      }
      goto LABEL_27;
    }
    id v7 = v22;
    if ([v22 imageblocksSupported])
    {
      uint64_t v43 = [*p_metalContext computePipelineStateFor:@"interpolateRGBWeightSourceYUVDestYUVPostModify" withConstants:v14];
      v44 = interpolateRGBWeightSourceYUVDestYUVPostProcess[v95];
      interpolateRGBWeightSourceYUVDestYUVPostProcess[v95] = (MTLComputePipelineState *)v43;

      if (!interpolateRGBWeightSourceYUVDestYUVPostProcess[v95]) {
        break;
      }
    }
    if (++v19 == 5)
    {
      v9 = v90;
      v45 = v90;
      goto LABEL_29;
    }
  }
  v46 = _PTLogSystem();
  v9 = v90;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:].cold.6(v46, v83, v84, v85, v86, v87, v88, v89);
  }
LABEL_28:

  v45 = 0;
LABEL_29:

LABEL_30:
  return v45;
}

- (void)interpolateRGBWeightUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, [v8 frameId]);
  v74[1] = v11;
  v74[0] = v12;
  +[PTRaytracingInterpolateResult calculateVarReadNoise:v8];
  v73[0] = v13;
  v73[1] = v14;
  double v15 = [v8 sourceColor];
  int v16 = [v15 transferFunction];
  int v17 = +[PTColorConversion getTransferFunction:v16 toLinear:1];

  v18 = [PTImageblockConfig alloc];
  uint64_t v19 = [v8 destinationColor];
  if (v8) {
    [v8 scissorRect];
  }
  else {
    memset(v72, 0, sizeof(v72));
  }
  v20 = [(PTImageblockConfig *)v18 initWithPTTexture:v19 scissorRect:v72];

  [(PTImageblockConfig *)v20 scissorRectOffset];
  v71[1] = v21;
  v71[0] = v22;
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    objc_msgSend(v10, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v20, "imageblockSize"), -[PTImageblockConfig imageblockSize](v20, "imageblockSize"));
  }
  id v23 = [v8 sourceColor];
  if ([v23 isRGB])
  {
    v24 = [v8 destinationColor];
    int v25 = [v24 isRGB];

    if (v25)
    {
      [v10 setComputePipelineState:self->_interpolateRGBWeightSourceRGBADestRGBA[v17]];
      v26 = [v8 sourceColor];
      id v27 = [v26 texRGBA];
      [v10 setTexture:v27 atIndex:0];

      [v10 setTexture:v9 atIndex:1];
      [v10 setTexture:self->_precomputedGaussian atIndex:2];
      v28 = [v8 destinationColor];
      uint64_t v29 = [v28 texRGBA];
      [v10 setTexture:v29 atIndex:3];

      [v10 setBytes:v73 length:8 atIndex:0];
      [v10 setBytes:v74 length:4 atIndex:1];
      v30 = v10;
      uint64_t v31 = 2;
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v63 = v9;
  __int16 v68 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  v32 = [v8 sourceColor];
  +[PTColorConversion getColorMatrix:v32 toRGB:1];

  uint64_t v33 = [v8 sourceColor];
  v34 = [v33 texLuma];
  id v35 = [v8 sourceColor];
  v36 = [v35 texChroma];
  uint64_t v67 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:v34 texChroma:v36];

  uint64_t v37 = [v8 destinationColor];
  int v38 = [v37 isRGB];

  if (!v38)
  {
    memset(v66, 0, sizeof(v66));
    uint64_t v50 = [v8 sourceColor];
    +[PTColorConversion getColorMatrix:v50 toRGB:0];

    uint64_t v51 = [v8 integratedStyleCoefficientsTextureArray];
    if (v51)
    {
    }
    else
    {
      uint64_t v52 = [v8 colorCube];

      if (!v52)
      {
        [v10 setComputePipelineState:self->_interpolateRGBWeightSourceYUVDestYUV[v17]];
        goto LABEL_16;
      }
    }
    [v10 setComputePipelineState:self->_interpolateRGBWeightSourceYUVDestYUVPostProcess[v17]];
    uint64_t v53 = [v8 integratedStyleCoefficientsTextureArray];
    [v10 setTexture:v53 atIndex:6];

    uint64_t v54 = [v8 colorCube];
    [v10 setTexture:v54 atIndex:7];

LABEL_16:
    id v9 = v63;
    uint64_t v55 = [v8 sourceColor];
    uint64_t v56 = [v55 texLuma];
    [v10 setTexture:v56 atIndex:0];

    uint64_t v57 = [v8 sourceColor];
    uint64_t v58 = [v57 texChroma];
    [v10 setTexture:v58 atIndex:1];

    [v10 setTexture:v63 atIndex:2];
    [v10 setTexture:self->_precomputedGaussian atIndex:3];
    uint64_t v59 = [v8 destinationColor];
    uint64_t v60 = [v59 texLuma];
    [v10 setTexture:v60 atIndex:4];

    uint64_t v61 = [v8 destinationColor];
    uint64_t v62 = [v61 texChroma];
    [v10 setTexture:v62 atIndex:5];

    [v10 setBytes:v73 length:8 atIndex:0];
    [v10 setBytes:v74 length:4 atIndex:1];
    [v10 setBytes:(char *)&v67 + 2 length:24 atIndex:2];
    [v10 setBytes:v66 length:24 atIndex:3];
    uint64_t v47 = &v67;
    uint64_t v48 = v10;
    uint64_t v49 = 2;
    goto LABEL_17;
  }
  [v10 setComputePipelineState:self->_interpolateRGBWeightSourceYUVDestRGBA[v17]];
  id v39 = [v8 sourceColor];
  v40 = [v39 texLuma];
  [v10 setTexture:v40 atIndex:0];

  uint64_t v41 = [v8 sourceColor];
  v42 = [v41 texChroma];
  [v10 setTexture:v42 atIndex:1];

  id v9 = v63;
  [v10 setTexture:v63 atIndex:2];
  [v10 setTexture:self->_precomputedGaussian atIndex:3];
  uint64_t v43 = [v8 destinationColor];
  v44 = [v43 texRGBA];
  [v10 setTexture:v44 atIndex:4];

  [v10 setBytes:v73 length:8 atIndex:0];
  [v10 setBytes:v74 length:4 atIndex:1];
  [v10 setBytes:(char *)&v67 + 2 length:24 atIndex:2];
  [v10 setBytes:&v67 length:2 atIndex:3];
  v45 = [v8 destinationColor];
  v46 = [v45 transferFunction];
  LODWORD(v43) = +[PTColorConversion getTransferFunction:v46 toLinear:1];

  LODWORD(v66[0]) = v43;
  uint64_t v47 = v66;
  uint64_t v48 = v10;
  uint64_t v49 = 4;
LABEL_17:
  [v48 setBytes:v47 length:v49 atIndex:4];
  v30 = v10;
  uint64_t v31 = 5;
LABEL_18:
  [v30 setBytes:v71 length:4 atIndex:v31];
  if (v20)
  {
    [(PTImageblockConfig *)v20 threads];
    [(PTImageblockConfig *)v20 threadsPerGroup];
  }
  else
  {
    memset(v65, 0, sizeof(v65));
    memset(v64, 0, sizeof(v64));
  }
  [v10 dispatchThreads:v65 threadsPerThreadgroup:v64];
  [v10 endEncoding];
}

- (void)interpolateRGBWeightUsingRGBALinearToDest:(id)a3 renderRequest:(id)a4 inRGBWeight:(id)a5 inRGBA:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [a3 computeCommandEncoder];
  +[PTRandom nextUshort2:seed:](PTRandom, "nextUshort2:seed:", self->_precomputedGaussianOffsetMaxValue, [v10 frameId]);
  v53[1] = v14;
  v53[0] = v15;
  +[PTRaytracingInterpolateResult calculateVarReadNoise:v10];
  v52[0] = v16;
  v52[1] = v17;
  v18 = [v10 sourceColor];
  uint64_t v19 = [v18 transferFunction];
  int v20 = +[PTColorConversion getTransferFunction:v19 toLinear:1];

  __int16 v21 = [PTImageblockConfig alloc];
  __int16 v22 = [v10 destinationColor];
  if (v10) {
    [v10 scissorRect];
  }
  else {
    memset(v51, 0, sizeof(v51));
  }
  id v23 = [(PTImageblockConfig *)v21 initWithPTTexture:v22 scissorRect:v51];

  [(PTImageblockConfig *)v23 scissorRectOffset];
  v50[1] = v24;
  v50[0] = v25;
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    objc_msgSend(v13, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v23, "imageblockSize"), -[PTImageblockConfig imageblockSize](v23, "imageblockSize"));
  }
  v26 = [v10 destinationColor];
  int v27 = [v26 isRGB];

  if (v27)
  {
    [v13 setComputePipelineState:self->_interpolateRGBWeightRGBALinearDestRGBA[v20]];
    [v13 setTexture:v12 atIndex:0];
    [v13 setTexture:v11 atIndex:1];
    [v13 setTexture:self->_precomputedGaussian atIndex:2];
    v28 = [v10 destinationColor];
    uint64_t v29 = [v28 texRGBA];
    [v13 setTexture:v29 atIndex:3];

    [v13 setBytes:v52 length:8 atIndex:0];
    [v13 setBytes:v53 length:4 atIndex:1];
    v30 = v13;
    uint64_t v31 = 2;
  }
  else
  {
    memset(v49, 0, sizeof(v49));
    v32 = [v10 sourceColor];
    +[PTColorConversion getColorMatrix:v32 toRGB:0];

    uint64_t v33 = [v10 sourceColor];
    [v33 texLuma];
    v44 = v23;
    unsigned int v34 = v20;
    v36 = id v35 = v11;
    uint64_t v37 = [v10 sourceColor];
    [v37 texChroma];
    int v38 = v45 = v12;
    BOOL2 v48 = (BOOL2)+[PTColorConversion getChromaSubsampledFromLuma:v36 texChroma:v38];

    id v11 = v35;
    id v39 = &self->super.isa + v34;
    id v23 = v44;
    [v13 setComputePipelineState:v39[37]];
    [v13 setTexture:v45 atIndex:0];
    [v13 setTexture:v35 atIndex:1];
    [v13 setTexture:self->_precomputedGaussian atIndex:2];
    v40 = [v10 destinationColor];
    uint64_t v41 = [v40 texLuma];
    [v13 setTexture:v41 atIndex:3];

    v42 = [v10 destinationColor];
    uint64_t v43 = [v42 texChroma];
    [v13 setTexture:v43 atIndex:4];

    id v12 = v45;
    [v13 setBytes:v52 length:8 atIndex:0];
    [v13 setBytes:v53 length:4 atIndex:1];
    [v13 setBytes:v49 length:24 atIndex:2];
    [v13 setBytes:&v48 length:2 atIndex:3];
    v30 = v13;
    uint64_t v31 = 4;
  }
  [v30 setBytes:v50 length:4 atIndex:v31];
  if (v23)
  {
    [(PTImageblockConfig *)v23 threads];
    [(PTImageblockConfig *)v23 threadsPerGroup];
  }
  else
  {
    memset(v47, 0, sizeof(v47));
    memset(v46, 0, sizeof(v46));
  }
  [v13 dispatchThreads:v47 threadsPerThreadgroup:v46];
  [v13 endEncoding];
}

+ (PTNoiseValues)calculateVarReadNoise:(id)a3
{
  id v3 = a3;
  int v4 = [v3 AGC];
  int v5 = [v3 conversionGain];
  int v6 = objc_msgSend(v3, "readNoise_1x");
  int v7 = objc_msgSend(v3, "readNoise_8x");
  id v8 = [v3 renderState];
  +[PTTuningParameters noiseScaleFactorForHwModelID:sensorID:](PTTuningParameters, "noiseScaleFactorForHwModelID:sensorID:", [v8 hwModelID], objc_msgSend(v3, "sensorID"));
  float v10 = v9;

  id v11 = [v3 renderState];
  int v12 = [v11 sourceColorBitDepth];

  int v13 = [v3 renderState];
  *(float *)&double v14 = v10;
  [v13 setNoiseScaleFactor:v14];

  [v3 totalSensorCropRectSize];
  double v16 = v15;
  int v17 = [v3 sourceColor];
  float v18 = (float)(unint64_t)[v17 width];
  [v3 visCropFactor];
  double v20 = v16 / (float)(v18 * v19);
  [v3 totalSensorCropRectSize];
  double v22 = v21 * v20;
  id v23 = [v3 sourceColor];
  float v24 = (float)(unint64_t)[v23 height];
  [v3 visCropFactor];
  float32x2_t v34 = v25;

  float v26 = v10 / (v22 / vmuls_lane_f32(v24, v34, 1));
  float v27 = v26 / 1023.0;
  if (v12 == 10) {
    float v27 = (float)(v26 / 1023.0) * 12.0;
  }
  float v28 = (float)v4 / 255.0;
  float v29 = (float)((float)v5 / 65535.0) * v27;
  float v30 = (float)((float)v6 / 65535.0) * (float)((float)v6 / 65535.0);
  float v31 = (float)(v30 - (float)((float)((float)v7 / 65535.0) * (float)((float)v7 / 65535.0))) / 0.98438;
  float v32 = v29 * (float)((float)(v31 + (float)((float)(v28 * (float)(v30 - v31)) * v28)) * v29);
  float v33 = v28 * v29;
  result.var1 = v33;
  result.var0 = v32;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputedGaussian, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_interpolateRGBWeightSourceYUVDestYUVPostProcess[i + 8], 0);
  for (uint64_t j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestYUV[j + 8], 0);
  for (uint64_t k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_interpolateRGBWeightRGBALinearDestRGBA[k + 8], 0);
  for (uint64_t m = 0; m != -9; --m)
    objc_storeStrong((id *)&self->_interpolateRGBWeightSourceRGBADestRGBA[m + 8], 0);
  for (uint64_t n = 144; n != 72; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n);
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

- (void)initWithMetalContext:(uint64_t)a3 useExportQualityNoise:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end