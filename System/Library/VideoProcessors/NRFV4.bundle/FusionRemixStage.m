@interface FusionRemixStage
+ (BOOL)isSupported;
+ (id)getFragmentShader:(id)a3 bandIndex:(int)a4 isLuma:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10;
+ (int)prewarmShaders:(id)a3;
- (SidecarWriter)sidecarWriter;
- (id)initBandFusion:(id)a3 nrfConfig:(id)a4 isPrewarm:(BOOL)a5;
- (int)allocateFusionBuffersIfNeeded:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (int)computeFusionParams:(id)a3 properties:(id *)a4 config:(const FusionConfiguration *)a5 fusionMode:(int)a6 staticScene:(BOOL)a7 isLowLight:(BOOL)a8;
- (int)computeGrayGhostCount:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 atBand:(int)a7 nrfPlist:(id)a8 size:(int *)a9;
- (int)correctGTC:(id)a3;
- (int)detectFlicker:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 height:(int *)a7;
- (int)prepareForFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 properties:(id *)a6 nrfPlist:(id)a7 staticScene:(BOOL)a8 isLowLight:(BOOL)a9;
- (int)runFusionForBandIndex:(int)a3 config:(const FusionConfiguration *)a4 oldFusedUpTex:(id)a5 oldFusedTex:(id)a6 fusedUpTex:(id)a7 fusedTex:(id)a8 accWeightTex:(id)a9 bandFusionParams:(const FusionRemixStageUniformsIBP *)a10 fragmentBufferIndex:(int)a11 processLuma:(BOOL)a12 processTopBand:(BOOL)a13 computeSpecialMap:(int)a14 inputs:(id)a15 simMapTex:(id)a16 confidence:(id)a17 noiseMap:(id)a18 batchN:(int)a19 isFirstBatch:(BOOL)a20 isLastBatch:(BOOL)a21 usePatchBasedFusion:(BOOL)a22 minVarWeightSum:(float)a23 outputChromaBias:(float)a24 ggMaxFusionWeights:(id)a25;
- (int)runImageFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 accWeightPyramid:(id)a6 buffers:(id)a7 nrfPlist:(id)a8 confidence:(id)a9 batchN:(int)a10 isLastBatch:(BOOL)a11 isLowLight:(BOOL)a12 usePatchBasedFusion:(BOOL)a13 outputChromaBias:(float)a14;
- (int)runStationaryFusionWithParams:(const FusionRemixStageUniformsIBP *)a3 inputs:(id)a4 fusedLumaTex:(id)a5 fusedChromaTex:(id)a6 noiseMapLumaTex:(id)a7 noiseMapChromaTex:(id)a8 accWeightLumaTex:(id)a9 accWeightChromaTex:(id)a10 inferenceLumaTex:(id)a11 inferenceChromaTex:(id)a12 batchN:(int)a13;
- (int)selectNRFFusionReferenceFrame:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 nrfPlist:(id)a7 outputFusionMode:(int *)a8 staticScene:(BOOL *)a9 motionDetection:(id)a10 grayGhostDetection:(id)a11;
- (void)setSidecarWriter:(id)a3;
@end

@implementation FusionRemixStage

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x263F2EE30] metalDevice];
  char v3 = [v2 supportsFamily:1003];

  return v3;
}

- (id)initBandFusion:(id)a3 nrfConfig:(id)a4 isPrewarm:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v45.receiver = self;
  v45.super_class = (Class)FusionRemixStage;
  v11 = [(FusionRemixStage *)&v45 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_28;
  }
  objc_storeStrong((id *)&v11->_metal, a3);
  objc_storeStrong((id *)&v12->_nrfConfig, a4);
  v13 = objc_opt_new();
  if (!v13)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_28:
    v42 = 0;
    goto LABEL_29;
  }
  v14 = v13;
  [v13 setStorageMode:0];
  [v14 setHazardTrackingMode:2];
  [v14 setSize:51200];
  v15 = [v9 device];
  uint64_t v16 = [v15 newHeapWithDescriptor:v14];
  uniformsHeap = v12->_uniformsHeap;
  v12->_uniformsHeap = (MTLHeap *)v16;

  if (!v12->_uniformsHeap || (v18 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_27:

    goto LABEL_28;
  }
  v19 = v18;
  objc_msgSend(v18, "setResourceOptions:", -[MTLHeap resourceOptions](v12->_uniformsHeap, "resourceOptions"));
  if (a5)
  {
LABEL_16:
    uint64_t v36 = [v9 computePipelineStateFor:@"computeGrayGhostCount" constants:0];
    computeGrayGhostCount = v12->_computeGrayGhostCount;
    v12->_computeGrayGhostCount = (MTLComputePipelineState *)v36;

    if (v12->_computeGrayGhostCount)
    {
      uint64_t v38 = [v9 computePipelineStateFor:@"detectFlicker" constants:0];
      detectFlicker = v12->_detectFlicker;
      v12->_detectFlicker = (MTLComputePipelineState *)v38;

      if (v12->_detectFlicker)
      {
        uint64_t v40 = [v9 computePipelineStateFor:@"correctGTC" constants:0];
        correctGTC = v12->_correctGTC;
        v12->_correctGTC = (MTLComputePipelineState *)v40;

        if (v12->_correctGTC)
        {
          [(FigMetalContext *)v12->_metal prewarmInternalMetalShadersForFormatsList:&unk_270E97D08];
          v42 = v12;

          goto LABEL_29;
        }
      }
    }
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_27;
  }
  id v44 = v10;
  char v20 = 0;
  char v21 = 1;
  while (1)
  {
    char v22 = v21;
    v23 = +[FusionRemixStageShared sharedInstance];
    v24 = [v23 getShaders:v12->_metal fp16:v20 & 1];

    if (!v24) {
      break;
    }

    char v21 = 0;
    char v20 = 1;
    if ((v22 & 1) == 0)
    {
      uint64_t v25 = 0;
      uniforms = v12->_uniforms;
      while (1)
      {
        v27 = [[FusionRemixUniforms alloc] initWithMetal:v9 heap:v12->_uniformsHeap];
        v28 = uniforms[v25];
        uniforms[v25] = v27;

        if (!uniforms[v25]) {
          goto LABEL_20;
        }
        if (++v25 == 10)
        {
          v29 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:1 height:1 mipmapped:0];

          if (!v29)
          {
            FigDebugAssert3();
            FigSignalErrorAt();
            goto LABEL_21;
          }
          [v29 setUsage:1];
          objc_msgSend(v29, "setResourceOptions:", -[MTLHeap resourceOptions](v12->_uniformsHeap, "resourceOptions"));
          uint64_t v30 = [(MTLHeap *)v12->_uniformsHeap newTextureWithDescriptor:v29];
          placeHolderTex = v12->_placeHolderTex;
          v12->_placeHolderTex = (MTLTexture *)v30;

          uint64_t v32 = [(MTLHeap *)v12->_uniformsHeap newBufferWithLength:4 options:[(MTLHeap *)v12->_uniformsHeap resourceOptions]];
          grayGhostCountBuffer = v12->_grayGhostCountBuffer;
          v12->_grayGhostCountBuffer = (MTLBuffer *)v32;

          id v10 = v44;
          if (v12->_grayGhostCountBuffer)
          {
            uint64_t v34 = [(MTLHeap *)v12->_uniformsHeap newBufferWithLength:4 options:[(MTLHeap *)v12->_uniformsHeap resourceOptions]];
            flickerCountBuffer = v12->_flickerCountBuffer;
            v12->_flickerCountBuffer = (MTLBuffer *)v34;

            if (v12->_flickerCountBuffer)
            {
              v19 = v29;
              goto LABEL_16;
            }
          }
          FigDebugAssert3();
          FigSignalErrorAt();

          goto LABEL_27;
        }
      }
    }
  }
LABEL_20:
  FigDebugAssert3();
  FigSignalErrorAt();

LABEL_21:
  v42 = 0;
  id v10 = v44;
LABEL_29:

  return v42;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[FuseRemixShaders alloc] initWithMetal:v3 pixelFormatLuma:25 pixelFormatChroma:65];
  v5 = [[FuseRemixShaders alloc] initWithMetal:v3 pixelFormatLuma:10 pixelFormatChroma:30];

  id v6 = [[FusionRemixStage alloc] initBandFusion:v3 nrfConfig:0 isPrewarm:1];
  v7 = [v3 device];
  v8 = (void *)[v7 newBufferWithLength:1024 options:0];

  if (v8)
  {
    id v9 = [v3 commandQueue];
    id v10 = [v9 commandBuffer];

    [v10 setLabel:@"Prewarm::fillBuffer"];
    if (v10)
    {
      v11 = [v10 blitCommandEncoder];
      if (v11)
      {
        objc_msgSend(v11, "fillBuffer:range:value:", v8, 0, objc_msgSend(v8, "length"), 0);
        [v11 endEncoding];
        [v10 commit];
      }
    }
  }
  if (v4) {
    BOOL v12 = v5 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || v6 == 0) {
    int v14 = -12786;
  }
  else {
    int v14 = 0;
  }

  return v14;
}

+ (id)getFragmentShader:(id)a3 bandIndex:(int)a4 isLuma:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10
{
  return (id)objc_msgSend(a3, "getFragmentShaderWithIsLuma:isTopBand:isBand0:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:", a5, a4 == 3, a4 == 0, a6, a7, a8);
}

- (int)computeFusionParams:(id)a3 properties:(id *)a4 config:(const FusionConfiguration *)a5 fusionMode:(int)a6 staticScene:(BOOL)a7 isLowLight:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v94 = a7;
  BOOL v12 = a3;
  v13 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
  uint64_t v14 = [v13 exposureParams];
  BOOL v95 = v8;
  uint64_t v15 = 108;
  if (!v8) {
    uint64_t v15 = 0;
  }
  float v16 = *(float *)(v14 + v15);

  uint64_t v17 = 0;
  uint64_t nonLinearPower_low = SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower);
  arrayOfinputParams = self->_arrayOfinputParams;
  v101 = self->_arrayOfinputParams;
  v102 = v12;
  while (1)
  {
    uint64_t v19 = [*(id *)(v12[4] + 8) objectAtIndexedSubscript:v17];
    char v20 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 3040 * v17);
    uint64_t v99 = v17;
    uint64_t v100 = (2 * v17) | 1;
    char v21 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 1520 * v100);
    float v22 = interpolate_with_gain(*(void **)(v19 + 8), v16);
    v21[336] = v22;
    v20[336] = v22;
    v21[337] = interpolate_with_gain(*(void **)(v19 + 16), v16);
    v20[337] = interpolate_with_gain(*(void **)(v19 + 24), v16);
    v21[338] = *(float *)(v102[4] + 136);
    v21[341] = interpolate_with_gain(*(void **)(v19 + 32), v16);
    v23 = (void *)v102[15];
    if (v23)
    {
      [v23 tuningParams];
      int v24 = v105;
    }
    else
    {
      int v24 = 0;
    }
    uint64_t v25 = v100;
    v26 = &v101->config.preWarpEnabled + 3040 * v99;
    *((_DWORD *)v26 + 378) = v24;
    v27 = &v101->config.preWarpEnabled + 1520 * v100;
    *((_DWORD *)v27 + 378) = v24;
    uint64_t v28 = *(void *)(v19 + 40);
    v29 = (float *)(v27 + 1368);
    uint64_t v30 = (float *)(v26 + 1368);
    if (a6 == 2)
    {
      float v31 = interpolate_with_gain(*(void **)(*(void *)(v28 + 16) + 8), v16);
      float *v29 = v31;
      *uint64_t v30 = v31;
      float v32 = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 40) + 16) + 24), v16);
      v101[2].exposureEffectiveTime[380 * v100 + 2] = v32;
      v33 = (float *)(&v101->config.preWarpEnabled + 3040 * v99);
      v33[343] = v32;
      v33[344] = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 56) + 16) + 8), v16);
      v33[345] = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 56) + 16) + 24), v16);
      float v34 = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 48) + 16) + 8), v16);
      v35 = &OBJC_IVAR___PerReferenceBandata_evm;
      uint64_t v36 = v101;
      goto LABEL_14;
    }
    float v37 = interpolate_with_gain(*(void **)(*(void *)(v28 + 8) + 8), v16);
    float *v29 = v37;
    *uint64_t v30 = v37;
    float v38 = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 40) + 8) + 24), v16);
    v101[2].exposureEffectiveTime[380 * v100 + 2] = v38;
    v39 = (float *)(&v101->config.preWarpEnabled + 3040 * v99);
    v39[343] = v38;
    v39[344] = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 56) + 8) + 8), v16);
    v39[345] = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 56) + 8) + 24), v16);
    uint64_t v40 = *(void *)(*(void *)(v19 + 48) + 8);
    uint64_t v36 = v101;
    if (!v94)
    {
      float v34 = interpolate_with_gain(*(void **)(v40 + 8), v16);
      v35 = &OBJC_IVAR___PerReferenceBandata_ev0;
      goto LABEL_13;
    }
    v41 = *(void **)(v40 + 16);
    if (!v41) {
      break;
    }
    float v34 = interpolate_with_gain(v41, v16);
    v35 = &OBJC_IVAR___PerReferenceBandata_ev0;
LABEL_13:
    uint64_t v25 = v100;
LABEL_14:
    v42 = (float *)(&v36->config.preWarpEnabled + 1520 * v25);
    v42[344] = v34;
    v98 = (void *)v19;
    v42[345] = interpolate_with_gain(*(void **)(*(void *)(*(void *)(v19 + 48) + *v35) + 24), v16);
    v43 = v102;
    uint64_t v44 = v102[4];
    objc_super v45 = *(void **)(v44 + 88);
    if (v45)
    {
      *(float *)(v102[4] + 84) = interpolate_with_gain(v45, v16);
      uint64_t v44 = v102[4];
    }
    int v46 = *(_DWORD *)(v44 + 84);
    *((_DWORD *)&v36[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias + 380 * v100) = v46;
    *((_DWORD *)&v36[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias + 760 * v99) = v46;
    if (*(unsigned char *)(v102[4] + 80))
    {
      v47 = [*a4 meta];
      [v47 sensorCropRatio];
      *((_DWORD *)&v101[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower + 380 * v100) = v48;
      uint64_t v36 = v101;
      *((_DWORD *)&v101[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower + 760 * v99) = v48;
    }
    else
    {
      *((_DWORD *)&v36[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower + 380 * v100) = 1065353216;
      *((_DWORD *)&v36[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower + 760 * v99) = 1065353216;
    }
    v49 = *(int **)(*(void *)(v102[3] + 16) + 32);
    float v50 = 0.0;
    float v51 = 0.0;
    if (v49[2] >= 1) {
      float v51 = interpolate_with_gain(v49, v16);
    }
    v36[2].noiseAdjustment[380 * v100 + 2] = v51;
    v52 = *(int **)(*(void *)(v102[3] + 16) + 40);
    if (v52[2] >= 1) {
      float v50 = interpolate_with_gain(v52, v16);
    }
    v36[2].noiseAdjustment[380 * v100 + 3] = v50;
    if (!v99)
    {
      uint64_t v53 = v102[4];
      if (*(unsigned char *)(v53 + 120))
      {
        v54 = (float *)(&v36->config.preWarpEnabled + 1520 * v100);
        v54[370] = interpolate_with_gain(*(void **)(*(void *)(v53 + 128) + 8), v16);
        v54[371] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 16), v16);
        v54[372] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 24), v16);
        v54[373] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 32), v16);
        v54[374] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 40), v16);
        v54[375] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 48), v16);
        v54[376] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 56), v16);
        v43 = v102;
        v54[377] = interpolate_with_gain(*(void **)(*(void *)(v102[4] + 128) + 64), v16);
      }
    }
    long long v103 = 0uLL;
    uint64_t v104 = 0;
    v55 = (void *)v43[5];
    v56 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
    computeNoiseModel((float32x2_t *)&v103, v55, [v56 exposureParams], v99);

    v57 = [a4[nonLinearPower_low] meta];
    uint64_t v58 = [v57 exposureParams];
    v59 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
    float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v58, [v59 exposureParams], a4[nonLinearPower_low]);

    if (LOBYTE(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower) || !v95)
    {
      uint64_t v64 = v100;
      v63 = v101;
      if (LOBYTE(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower)) {
        goto LABEL_30;
      }
LABEL_29:
      v65 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
      float v66 = *(float *)([v65 exposureParams] + 32);
      v67 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
      float v68 = RelativeBrightnessForProperties * sqrtf(v66 / *(float *)[v67 exposureParams]);

      v69 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
      float RelativeBrightnessForProperties = v68 / sqrtf(*(float *)([v69 exposureParams] + 48));

      goto LABEL_30;
    }
    v61 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
    int v62 = *(unsigned __int8 *)([v61 exposureParams] + 98);

    uint64_t v64 = v100;
    v63 = v101;
    if (v62) {
      goto LABEL_29;
    }
LABEL_30:
    scaleNoiseModel((float32x2_t *)&v103, RelativeBrightnessForProperties);
    v70 = &v63->config.preWarpEnabled + 1520 * v64;
    v71 = &v63->config.preWarpEnabled + 3040 * v99;
    uint64_t v72 = v104;
    *((void *)v71 + 175) = v104;
    long long v73 = v103;
    *(_OWORD *)(v71 + 1384) = v103;
    *((void *)v70 + 175) = v72;
    *(_OWORD *)(v70 + 1384) = v73;
    memcpy(v20, a5, 0x540uLL);
    memmove((char *)arrayOfinputParams + 1520 * v100, a5, 0x540uLL);
    if (SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias) >= 1)
    {
      uint64_t v74 = 0;
      uint64_t v75 = 3000;
      do
      {
        v76 = [a4[nonLinearPower_low] meta];
        uint64_t v77 = [v76 exposureParams];
        v78 = [a4[v74] meta];
        float v79 = getRelativeBrightnessForProperties(v77, [v78 exposureParams], a4[nonLinearPower_low]);
        v80 = (float *)((char *)self + 4 * v74);
        v80[356] = v79;
        *(float *)((char *)self + v75 - 56) = v79;

        v81 = [a4[v74] meta];
        int v82 = *(_DWORD *)([v81 exposureParams] + 52);
        *((_DWORD *)v80 + 364) = v82;
        *(_DWORD *)((char *)self + v75 - 24) = v82;

        v83 = &OBJC_IVAR___DenoiseAndSharpeningTuning_shortFrameDenoiseBoost;
        if (v74 == LODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale)
          || (float v84 = 1.0,
              v83 = &OBJC_IVAR___DenoiseAndSharpeningTuning_ev0FrameDenoiseBoost,
              v74 != LODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale)))
        {
          float v84 = interpolate_with_gain(*(void **)(*(void *)(v102[3] + 16) + *v83), v16);
        }
        v85 = [a4[SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionInv.linearThreshold)] meta];
        float v86 = *(float *)([v85 exposureParams] + 52);
        v87 = [a4[v74] meta];
        float v88 = v84 * powf(v86 / *(float *)([v87 exposureParams] + 52), 0.25);
        *(float *)((char *)self + v75 - 40) = v88;
        v89 = (float *)((char *)self + 4 * v74);
        v89[360] = v88;

        [a4[v74] blurryFrameWeight];
        *(_DWORD *)((char *)&self->super.isa + v75) = v90;
        [a4[v74] blurryFrameWeight];
        *((_DWORD *)v89 + 370) = v91;
        ++v74;
        v75 += 4;
      }
      while (v74 < SLODWORD(a5[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias));
    }

    uint64_t v17 = v99 + 1;
    self = (FusionRemixStage *)((char *)self + 3040);
    arrayOfinputParams = v101;
    BOOL v12 = v102;
    if (v99 == 3)
    {
      int v92 = 0;
      goto LABEL_40;
    }
  }
  FigDebugAssert3();
  int v92 = FigSignalErrorAt();

  BOOL v12 = v102;
LABEL_40:

  return v92;
}

- (int)detectFlicker:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 height:(int *)a7
{
  BOOL v12 = a3;
  v13 = (id *)a4;
  id v14 = a5;
  id v15 = a6;
  float v16 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v17 = [v16 commandBuffer];

  if (v17 && ([v17 computeCommandEncoder], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v19 = v18;
    [v18 setComputePipelineState:self->_detectFlicker];
    float v38 = v12;
    char v20 = (void *)v12[45];
    id v37 = v13[45];
    id v21 = v20;
    [v19 setTexture:v21 atIndex:0];
    [v19 setTexture:v37 atIndex:1];
    objc_msgSend(v19, "setBytes:length:atIndex:", objc_msgSend(v14, "regHomography"), 48, 0);
    objc_msgSend(v19, "setBytes:length:atIndex:", objc_msgSend(v15, "regHomography"), 48, 1);
    float v22 = [v14 meta];
    v23 = v17;
    int v24 = v13;
    uint64_t v25 = [v22 exposureParams];
    [v15 meta];
    uint64_t v36 = self;
    v26 = a7;
    uint64_t v28 = v27 = v15;
    uint64_t v29 = [v28 exposureParams];
    uint64_t v30 = v25;
    v13 = v24;
    uint64_t v17 = v23;
    float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v30, v29, v14);

    id v15 = v27;
    float v44 = RelativeBrightnessForProperties;
    [v19 setBytes:&v44 length:4 atIndex:2];
    int *v26 = [v21 height];
    LODWORD(v22) = [v21 width];
    unsigned int v32 = [v21 height];
    *(void *)&long long v33 = 0;
    *((void *)&v33 + 1) = __PAIR64__(v32, v22);
    BOOL v12 = v38;
    long long v43 = v33;
    [v19 setBytes:&v43 length:16 atIndex:3];
    [v19 setBuffer:v36->_flickerCountBuffer offset:0 atIndex:4];
    uint64_t v40 = 1;
    uint64_t v41 = [v21 height];
    int64x2_t v42 = vdupq_n_s64(1uLL);
    long long v39 = xmmword_263480460;
    [v19 dispatchThreadgroups:&v41 threadsPerThreadgroup:&v39];
    [v19 endEncoding];
    [v23 commit];

    int v34 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }

  return v34;
}

- (int)computeGrayGhostCount:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 atBand:(int)a7 nrfPlist:(id)a8 size:(int *)a9
{
  id v15 = a3;
  float v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = a8;
  char v20 = [(FigMetalContext *)self->_metal commandQueue];
  id v21 = [v20 commandBuffer];

  if (v21 && ([v21 computeCommandEncoder], (float v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v23 = v22;
    v54 = self;
    v55 = v21;
    id v24 = v15;
    [v22 setComputePipelineState:self->_computeGrayGhostCount];
    uint64_t v25 = [v17 meta];
    char v26 = [v25 isEVMFrame];

    if ((v26 & 1) == 0
      || ([v18 meta],
          id v27 = objc_claimAutoreleasedReturnValue(),
          int v28 = [v27 isEVMFrame],
          v27,
          v28))
    {
      FigDebugAssert3();
      int v50 = FigSignalErrorAt();

      id v15 = v24;
      id v21 = v55;
    }
    else
    {
      uint64_t v53 = v24;
      uint64_t v29 = (void *)*((void *)v24 + a7 + 42);
      v56 = v16;
      uint64_t v30 = (void *)*((void *)v24 + a7 + 62);
      float v31 = v18;
      unsigned int v32 = (void *)v56[a7 + 42];
      id v33 = (id)v56[a7 + 62];
      id v34 = v32;
      id v52 = v30;
      id v35 = v29;
      [v23 setTexture:v35 atIndex:0];
      [v23 setTexture:v52 atIndex:1];
      [v23 setTexture:v34 atIndex:2];
      [v23 setTexture:v33 atIndex:3];
      objc_msgSend(v23, "setBytes:length:atIndex:", objc_msgSend(v17, "regHomography"), 48, 0);
      objc_msgSend(v23, "setBytes:length:atIndex:", objc_msgSend(v31, "regHomography"), 48, 1);
      uint64_t v36 = [v17 meta];
      uint64_t v37 = [v36 exposureParams];
      [v31 meta];
      v39 = float v38 = v19;
      float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v37, [v39 exposureParams], v17);

      v63[0] = RelativeBrightnessForProperties;
      [v23 setBytes:v63 length:4 atIndex:2];
      uint64_t v41 = (_DWORD *)v38[4];
      LODWORD(v42) = v41[9];
      HIDWORD(v42) = v41[8];
      int v62 = v41[10];
      uint64_t v61 = v42;
      [v23 setBytes:&v61 length:16 atIndex:3];
      uint64_t v43 = [v33 width];
      uint64_t v44 = [v33 width];
      uint64_t v45 = [v33 height];
      uint64_t v46 = [v33 height];
      v47.i64[0] = v45;
      uint64_t v19 = v38;
      v47.i64[1] = v46;
      v48.i64[0] = v43;
      v48.i64[1] = v44;
      id v18 = v31;
      uint32x4_t v60 = vcvtq_u32_f32(vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v48)), vcvtq_f64_u64(v47)), (float32x4_t)xmmword_263480470));
      [v23 setBytes:&v60 length:16 atIndex:4];
      [v23 setBuffer:v54->_grayGhostCountBuffer offset:0 atIndex:5];
      v59[0] = (unint64_t)([v33 width] + 7) >> 3;
      v59[1] = (unint64_t)([v33 height] + 7) >> 3;
      v59[2] = 1;
      int64x2_t v57 = vdupq_n_s64(8uLL);
      uint64_t v58 = 1;
      [v23 dispatchThreadgroups:v59 threadsPerThreadgroup:&v57];
      [v23 endEncoding];
      id v21 = v55;
      [v55 commit];
      LODWORD(v43) = [v34 width];
      int v49 = [v34 height] * v43;
      float v16 = v56;
      *a9 = v49;

      id v15 = v53;
      int v50 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
  }

  return v50;
}

- (int)runFusionForBandIndex:(int)a3 config:(const FusionConfiguration *)a4 oldFusedUpTex:(id)a5 oldFusedTex:(id)a6 fusedUpTex:(id)a7 fusedTex:(id)a8 accWeightTex:(id)a9 bandFusionParams:(const FusionRemixStageUniformsIBP *)a10 fragmentBufferIndex:(int)a11 processLuma:(BOOL)a12 processTopBand:(BOOL)a13 computeSpecialMap:(int)a14 inputs:(id)a15 simMapTex:(id)a16 confidence:(id)a17 noiseMap:(id)a18 batchN:(int)a19 isFirstBatch:(BOOL)a20 isLastBatch:(BOOL)a21 usePatchBasedFusion:(BOOL)a22 minVarWeightSum:(float)a23 outputChromaBias:(float)a24 ggMaxFusionWeights:(id)a25
{
  uint64_t v139 = *(void *)&a3;
  id v128 = a5;
  id v136 = a6;
  id v129 = a7;
  id v138 = a8;
  id v32 = a9;
  v135 = (uint64_t *)a15;
  id v134 = a16;
  v133 = a17;
  id v131 = a18;
  v144[0] = a23;
  id v33 = a25;
  id v143 = 0;
  id v34 = [MEMORY[0x263F129A0] renderPassDescriptor];
  if (!v34)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v93 = 0;
    uint64_t v40 = 0;
    v132 = 0;
    v137 = 0;
    long long v39 = 0;
    v116 = v128;
LABEL_125:
    id v35 = v136;
    goto LABEL_106;
  }
  id v35 = v136;
  if (a11 >= 10 || (int v36 = v139, v139 >= 4))
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v93 = 0;
    uint64_t v40 = 0;
LABEL_113:
    v132 = 0;
    v137 = 0;
    long long v39 = 0;
    goto LABEL_114;
  }
  BOOL v37 = [v138 pixelFormat] == 25 || objc_msgSend(v138, "pixelFormat") == 65;
  float v38 = +[FusionRemixStageShared sharedInstance];
  long long v39 = [v38 getShaders:self->_metal fp16:v37];

  uint64_t v40 = v39;
  if (!v39)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v93 = 0;
    v132 = 0;
    v137 = 0;
LABEL_114:
    v116 = v128;
    goto LABEL_106;
  }
  if (v139) {
    BOOL v41 = 0;
  }
  else {
    BOOL v41 = a12 && a22;
  }
  if (!a4)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v93 = 0;
    goto LABEL_113;
  }
  v125 = v32;
  if ((v139 == 0) == v41 || !HIBYTE(a4[1].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearPower))
  {
    BOOL v47 = 0;
  }
  else
  {
    uint64_t nonLinearBias_low = LODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
    if ((int)nonLinearBias_low < 1)
    {
      BOOL v47 = 1;
    }
    else
    {
      uint64_t v43 = v135 + 1;
      uint64_t v44 = nonLinearBias_low - 1;
      do
      {
        uint64_t v45 = *v43++;
        uint64_t v46 = *(void *)(v45 + 656);
        BOOL v47 = v46 != 0;
        BOOL v49 = v44-- != 0;
      }
      while (v46 && v49);
    }
  }
  if (v139) {
    BOOL v50 = 1;
  }
  else {
    BOOL v50 = v33 == 0;
  }
  int v51 = !v50;
  int v123 = v51;
  BYTE1(v122) = v51;
  LOBYTE(v122) = v47;
  v132 = +[FusionRemixStage getFragmentShader:bandIndex:isLuma:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:](FusionRemixStage, "getFragmentShader:bandIndex:isLuma:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:", v39, v139, v122);
  v137 = self->_uniforms[a11];
  if (!v138)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v93 = 0;
    long long v39 = 0;
    v116 = v128;
    id v32 = v125;
    goto LABEL_125;
  }
  v124 = v39;
  id v52 = [v34 colorAttachments];
  uint64_t v53 = [v52 objectAtIndexedSubscript:0];
  [v53 setTexture:v138];

  if (v139) {
    BOOL v54 = !a20;
  }
  else {
    BOOL v54 = 1;
  }
  v55 = [v34 colorAttachments];
  v56 = [v55 objectAtIndexedSubscript:0];
  [v56 setLoadAction:v54];

  int64x2_t v57 = [v34 colorAttachments];
  uint64_t v58 = [v57 objectAtIndexedSubscript:0];
  [v58 setStoreAction:1];

  if (!v139)
  {
    if (!v131)
    {
      FigDebugAssert3();
      int v120 = FigSignalErrorAt();
LABEL_124:
      v93 = 0;
      long long v39 = 0;
      v116 = v128;
      uint64_t v40 = v124;
      id v32 = v125;
      goto LABEL_125;
    }
    v59 = [v34 colorAttachments];
    uint32x4_t v60 = [v59 objectAtIndexedSubscript:1];
    [v60 setTexture:v131];

    uint64_t v61 = [v34 colorAttachments];
    int v62 = [v61 objectAtIndexedSubscript:1];
    [v62 setLoadAction:!a20];

    v63 = [v34 colorAttachments];
    uint64_t v64 = [v63 objectAtIndexedSubscript:1];
    [v64 setStoreAction:1];
  }
  id v127 = v33;
  if (!a20 || !a21)
  {
    v65 = [(FigMetalContext *)self->_metal allocator];
    float v66 = (void *)[v65 newTextureDescriptor];

    if (v66)
    {
      uint64_t v67 = [v138 width];
      float v68 = [v66 desc];
      [v68 setWidth:v67];

      uint64_t v69 = [v138 height];
      v70 = [v66 desc];
      [v70 setHeight:v69];

      v71 = [v66 desc];
      [v71 setUsage:7];

      uint64_t v72 = a12 ? 25 : 65;
      long long v73 = [v66 desc];
      [v73 setPixelFormat:v72];

      [v66 setLabel:0];
      uint64_t v74 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v75 = (void *)[v74 newTextureWithDescriptor:v66];
      id v143 = v75;

      if (v75)
      {
        v76 = [v34 colorAttachments];
        uint64_t v77 = [v76 objectAtIndexedSubscript:2];
        v126 = v75;
        [v77 setTexture:v75];

        v78 = [v34 colorAttachments];
        float v79 = [v78 objectAtIndexedSubscript:2];
        [v79 setLoadAction:0];

        v80 = [v34 colorAttachments];
        v81 = [v80 objectAtIndexedSubscript:2];
        [v81 setStoreAction:!a21];

        int v36 = v139;
        goto LABEL_45;
      }
    }
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();

    goto LABEL_124;
  }
  v126 = 0;
LABEL_45:
  id v35 = v136;
  if (v36 && !a20)
  {
    if (!v136)
    {
      FigDebugAssert3();
      int v120 = FigSignalErrorAt();
      v93 = 0;
      long long v39 = 0;
      goto LABEL_120;
    }
    int v82 = [v34 colorAttachments];
    v83 = [v82 objectAtIndexedSubscript:3];
    [v83 setTexture:v136];

    float v84 = [v34 colorAttachments];
    v85 = [v84 objectAtIndexedSubscript:3];
    [v85 setLoadAction:0];

    float v86 = [v34 colorAttachments];
    v87 = [v86 objectAtIndexedSubscript:3];
    [v87 setStoreAction:1];
  }
  memcpy(v137->_ptr2FragBufSBP, a10, 0x5F0uLL);
  *(float *)&self->_anon_314c[1012] = (float)(unint64_t)[v138 width];
  *(float *)&self->_anon_314c[1016] = (float)(unint64_t)[v138 height];
  *(_DWORD *)&self->_anon_314c[1020] = v139;
  memcpy(v137->_ptr2VertBufSBP, &self->_vertexUniforms, 0x550uLL);
  ptr2FragBufInt = v137->_ptr2FragBufInt;
  int v89 = v139;
  ptr2FragBufInt->var0 = v139;
  ptr2FragBufInt->var1 = a14;
  ptr2FragBufInt->var2 = a24;
  float nonLinearBias = 0.5;
  if (BYTE2(a4[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower)) {
    float nonLinearBias = 0.0;
  }
  float v91 = nonLinearBias;
  if (BYTE2(a4[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower) && !v139)
  {
    float nonLinearBias = a4[1].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias;
    float v91 = 0.0;
  }
  ptr2FragBufInt->var3 = nonLinearBias;
  ptr2FragBufInt->var4 = v91;
  ptr2FragBufInt->var5 = BYTE2(a4[4].colorSpaceConversionParameters[0].finalScale);
  int v92 = [(FigMetalContext *)self->_metal commandQueue];
  long long v39 = [v92 commandBuffer];

  if (!v39)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    v93 = 0;
LABEL_120:
    v116 = v128;
    uint64_t v40 = v124;
    id v32 = v125;
    goto LABEL_106;
  }
  v93 = [v39 renderCommandEncoderWithDescriptor:v34];
  if (!v93)
  {
    FigDebugAssert3();
    int v120 = FigSignalErrorAt();
    goto LABEL_120;
  }
  BOOL v94 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
  [v93 setVertexBuffer:v94 offset:0 atIndex:0];

  [v93 setVertexBuffer:v137->_vertexUniBufSBP offset:0 atIndex:1];
  for (uint64_t i = 0; i != 16; ++i)
    [v93 setFragmentTexture:self->_placeHolderTex atIndex:i];
  float v96 = a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias;
  int v97 = 4 - LODWORD(v96);
  v130 = v39;
  *(float *)&uint64_t v98 = v96;
  if (v47)
  {
    unsigned int v99 = 4 - LODWORD(v96);
    if (SLODWORD(v96) < 1) {
      goto LABEL_78;
    }
    uint64_t v100 = 0;
    do
    {
      if (!*(void *)(v135[v100 + 1] + 656))
      {
        FigDebugAssert3();
        int v120 = FigSignalErrorAt();
        v116 = v128;
        id v32 = v125;
        goto LABEL_108;
      }
      uint64_t v101 = v100 + 1;
      objc_msgSend(v93, "setFragmentTexture:atIndex:");
      uint64_t v98 = SLODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
      uint64_t v100 = v101;
    }
    while (v101 < v98);
    unsigned int v99 = v101 + v97;
    if ((int)v98 > 0)
    {
      int v102 = 0;
      do
      {
        uint64_t v103 = v99++;
        [v93 setFragmentTexture:0 atIndex:v103];
        ++v102;
        *(float *)&uint64_t v98 = a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias;
      }
      while (v102 < (int)v98);
    }
  }
  else
  {
    unsigned int v99 = 4 - LODWORD(v96);
    if (SLODWORD(v96) < 1) {
      goto LABEL_78;
    }
    uint64_t v104 = 0;
    int v105 = (char *)(v135 + 1);
    do
    {
      uint64_t v106 = v104;
      uint64_t v107 = *(void *)(*(void *)&v105[8 * v104++] + 336 + 8 * (int)v139);
      [v93 setFragmentTexture:v107 atIndex:v106];
      uint64_t v98 = SLODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
    }
    while (v104 < v98);
    if ((int)v98 <= 0)
    {
      unsigned int v99 = v104 + v97;
      id v35 = v136;
    }
    else
    {
      for (uint64_t j = 0; j < v98; ++j)
      {
        [v93 setFragmentTexture:*(void *)(*(void *)&v105[8 * j] + 496 + 8 * (int)v139) atIndex:(v104 + v97 + j)];
        uint64_t v98 = SLODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
      }
      unsigned int v99 = v97 + v104 + j;
      id v35 = v136;
    }
    int v89 = v139;
  }
  long long v39 = v130;
LABEL_78:
  if (!a13)
  {
    if ((int)v98 >= 1)
    {
      uint64_t v109 = 0;
      unsigned int v110 = v99 + v97;
      v111 = (char *)(v135 + 1);
      uint64_t v112 = (int)v139 + 1;
      do
      {
        [v93 setFragmentTexture:*(void *)(*(void *)&v111[8 * v109] + 336 + 8 * v112) atIndex:v110 + v109];
        ++v109;
        uint64_t v113 = SLODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
      }
      while (v109 < v113);
      if ((int)v113 >= 1)
      {
        uint64_t v114 = 0;
        int v115 = v99 - 2 * LODWORD(v96) + 8 + v109;
        do
        {
          [v93 setFragmentTexture:*(void *)(*(void *)&v111[8 * v114] + 496 + 8 * v112) atIndex:(v115 + v114)];
          ++v114;
        }
        while (v114 < SLODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias));
      }
    }
    if (!v129)
    {
      FigDebugAssert3();
      int v120 = FigSignalErrorAt();
      v116 = v128;
      id v35 = v136;
      id v32 = v125;
      id v33 = v127;
LABEL_108:
      uint64_t v40 = v124;
      long long v39 = v130;
      goto LABEL_106;
    }
    [v93 setFragmentTexture:v129 atIndex:16];
    id v35 = v136;
    id v33 = v127;
    int v89 = v139;
    long long v39 = v130;
  }
  [v93 setFragmentTexture:v134 atIndex:17];
  if (v133) {
    [v93 setFragmentTexture:v133[v89 + 42] atIndex:18];
  }
  v116 = v128;
  id v32 = v125;
  if (a12 && !a13) {
    [v93 setFragmentBytes:v144 length:4 atIndex:2];
  }
  uint64_t v40 = v124;
  if (v128) {
    [v93 setFragmentTexture:v128 atIndex:19];
  }
  BOOL v117 = a20;
  if (!v125) {
    BOOL v117 = 1;
  }
  if (!v117) {
    [v93 setFragmentTexture:v125 atIndex:20];
  }
  if (v123) {
    [v93 setFragmentTexture:v33 atIndex:31];
  }
  [v93 setFragmentBuffer:v137->_fragUniBufSBP offset:0 atIndex:0];
  [v93 setFragmentBuffer:v137->_fragUniBufInt offset:0 atIndex:1];
  [v93 setRenderPipelineState:v132[1]];
  [v93 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v93 endEncoding];
  if (v125 && !a21 && v126)
  {
    v118 = [v39 computeCommandEncoder];
    if (!v118)
    {
      FigDebugAssert3();
      int v120 = FigSignalErrorAt();
      goto LABEL_106;
    }
    v119 = v118;
    [v118 setComputePipelineState:v124[257]];
    [v119 setTexture:v126 atIndex:0];
    [v119 setTexture:v125 atIndex:1];
    v142[0] = [v125 width];
    v142[1] = [v125 height];
    v116 = v128;
    v142[2] = 1;
    int64x2_t v140 = vdupq_n_s64(0x10uLL);
    uint64_t v141 = 1;
    long long v39 = v130;
    [v119 dispatchThreads:v142 threadsPerThreadgroup:&v140];
    [v119 endEncoding];
  }
  FigMetalDecRef();
  [v39 commit];
  int v120 = 0;
LABEL_106:

  return v120;
}

- (int)runStationaryFusionWithParams:(const FusionRemixStageUniformsIBP *)a3 inputs:(id)a4 fusedLumaTex:(id)a5 fusedChromaTex:(id)a6 noiseMapLumaTex:(id)a7 noiseMapChromaTex:(id)a8 accWeightLumaTex:(id)a9 accWeightChromaTex:(id)a10 inferenceLumaTex:(id)a11 inferenceChromaTex:(id)a12 batchN:(int)a13
{
  uint64_t v75 = (char *)a4;
  id v19 = a5;
  id v20 = a6;
  id v69 = a7;
  id v68 = a8;
  id v21 = a9;
  id v22 = a10;
  id v67 = a11;
  id v76 = a12;
  id v86 = 0;
  id v87 = 0;
  v23 = [(FigMetalContext *)self->_metal allocator];
  id v24 = (void *)[v23 newTextureDescriptor];

  if (!v24) {
    goto LABEL_28;
  }
  uint64_t v25 = [v24 desc];
  [v25 setUsage:7];

  uint64_t v26 = [v19 width];
  id v27 = [v24 desc];
  [v27 setWidth:v26];

  uint64_t v28 = [v19 height];
  uint64_t v29 = [v24 desc];
  [v29 setHeight:v28];

  uint64_t v30 = [v24 desc];
  [v30 setPixelFormat:25];

  [v24 setLabel:0];
  float v31 = [(FigMetalContext *)self->_metal allocator];
  id v32 = (void *)[v31 newTextureWithDescriptor:v24];
  id v87 = v32;

  if (!v32)
  {
LABEL_28:
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();
    goto LABEL_27;
  }
  id v33 = [(FigMetalContext *)self->_metal allocator];
  id v34 = (void *)[v33 newTextureDescriptor:0];

  if (!v34)
  {
    FigDebugAssert3();
LABEL_31:
    v59 = v68;
    uint64_t v58 = v69;
    int v62 = v67;
    int v63 = FigSignalErrorAt();

    goto LABEL_25;
  }
  id v74 = v19;
  id v35 = [v34 desc];
  [v35 setUsage:7];

  uint64_t v36 = [v20 width];
  BOOL v37 = [v34 desc];
  [v37 setWidth:v36];

  uint64_t v38 = [v20 height];
  long long v39 = [v34 desc];
  [v39 setHeight:v38];

  uint64_t v40 = [v34 desc];
  [v40 setPixelFormat:65];

  [v34 setLabel:0];
  BOOL v41 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v42 = (void *)[v41 newTextureWithDescriptor:v34 subAllocatorID:0];
  id v86 = v42;

  if (!v42)
  {
    FigDebugAssert3();
    id v19 = v74;
    goto LABEL_31;
  }

  id v19 = v74;
  if (!BYTE2(a3[2].nm.lumaSigmaIntercept))
  {
LABEL_26:
    FigDebugAssert3();
    int v63 = -12782;
LABEL_27:
    v59 = v68;
    uint64_t v58 = v69;
    int v62 = v67;
    goto LABEL_25;
  }
  uint64_t lowFusionNoiseBoostPerFrame_low = LODWORD(a3[2].lowFusionNoiseBoostPerFrame);
  if ((int)lowFusionNoiseBoostPerFrame_low >= 1)
  {
    p_lowResMotionThreshold = &a3->patchBasedFusionParameters.lowResMotionThreshold;
    p_shadowLimit = &a3[2].patchBasedFusionParameters.shadowLimit;
    do
    {
      int v47 = *(unsigned __int8 *)p_lowResMotionThreshold;
      p_lowResMotionThreshold += 52;
      if (!v47) {
        goto LABEL_26;
      }
      float v44 = *(&a3[2].patchBasedFusionParameters.shadowLimit + SLODWORD(a3[2].fusionStrength.dense));
      if ((float)(vabds_f32(*p_shadowLimit, v44) / v44) >= 0.05) {
        goto LABEL_26;
      }
      ++p_shadowLimit;
    }
    while (--lowFusionNoiseBoostPerFrame_low);
  }
  uint64x2_t v48 = +[FusionRemixStageShared sharedInstance];
  BOOL v49 = [v48 getShaders:self->_metal fp16:1];

  if (!v49)
  {
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();
LABEL_35:
    id v19 = v74;
    goto LABEL_27;
  }
  v70 = v32;
  BOOL v50 = [(FigMetalContext *)self->_metal commandQueue];
  int v51 = [v50 commandBuffer];

  if (!v51)
  {
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();

    goto LABEL_35;
  }
  long long v73 = v49;
  float v66 = v24;
  id v52 = v21;
  v65 = v51;
  uint64_t v53 = [v51 computeCommandEncoder];
  unint64_t v54 = 0;
  p_placeHolderTex = &self->_placeHolderTex;
  v56 = v75 + 8;
  do
  {
    if (v54 >= SLODWORD(a3[2].lowFusionNoiseBoostPerFrame))
    {
      [v53 setTexture:*p_placeHolderTex atIndex:v54];
      int64x2_t v57 = p_placeHolderTex;
    }
    else
    {
      [v53 setTexture:*(void *)(*(void *)&v56[8 * v54] + 336) atIndex:v54];
      int64x2_t v57 = (MTLTexture **)(*(void *)&v56[8 * v54] + 496);
    }
    [v53 setTexture:*v57 atIndex:v54 + 4];
    ++v54;
  }
  while (v54 != 4);
  id v19 = v74;
  [v53 setTexture:v74 atIndex:21];
  [v53 setTexture:v20 atIndex:22];
  uint64_t v58 = v69;
  [v53 setTexture:v69 atIndex:23];
  v59 = v68;
  [v53 setTexture:v68 atIndex:24];
  [v53 setTexture:v70 atIndex:25];
  id v21 = v52;
  [v53 setTexture:v52 atIndex:26];
  [v53 setTexture:v42 atIndex:27];
  [v53 setTexture:v22 atIndex:28];
  [v53 setBytes:a3 length:1520 atIndex:0];
  [v53 setImageblockWidth:32 height:32];
  uint32x4_t v60 = v73;
  if (a13)
  {
    [v53 setComputePipelineState:v73[262]];
    v81[0] = [v42 width];
    v81[1] = [v42 height];
    v81[2] = 1;
    int64x2_t v71 = vdupq_n_s64(0x10uLL);
    int64x2_t v83 = v71;
    uint64_t v84 = 1;
    [v53 dispatchThreads:v81 threadsPerThreadgroup:&v83];
    [v53 setComputePipelineState:v73[263]];
    v80[0] = [v22 width];
    v80[1] = [v22 height];
    v80[2] = 1;
    int64x2_t v83 = v71;
    uint64_t v84 = 1;
    [v53 dispatchThreads:v80 threadsPerThreadgroup:&v83];
    [v53 setComputePipelineState:v73[259]];
    v79[0] = [v20 width];
    v79[1] = [v20 height];
    v79[2] = 1;
    int64x2_t v83 = v71;
    uint64_t v84 = 1;
    [v53 dispatchThreads:v79 threadsPerThreadgroup:&v83];
    [v53 setComputePipelineState:v73[261]];
    v78[0] = [v21 width];
    v78[1] = [v21 height];
    v78[2] = 1;
    int64x2_t v83 = v71;
    uint64_t v84 = 1;
    uint64_t v61 = v78;
  }
  else
  {
    [v53 setComputePipelineState:v73[258]];
    v85[0] = [v20 width];
    v85[1] = [v20 height];
    v85[2] = 1;
    int64x2_t v72 = vdupq_n_s64(0x10uLL);
    int64x2_t v83 = v72;
    uint64_t v84 = 1;
    [v53 dispatchThreads:v85 threadsPerThreadgroup:&v83];
    [v53 setComputePipelineState:v73[260]];
    v82[0] = [v21 width];
    v82[1] = [v21 height];
    v82[2] = 1;
    int64x2_t v83 = v72;
    uint64_t v84 = 1;
    uint64_t v61 = v82;
  }
  [v53 dispatchThreads:v61 threadsPerThreadgroup:&v83];
  int v62 = v67;
  if (v67 && v76)
  {
    [v53 setComputePipelineState:v73[264]];
    [v53 setTexture:v67 atIndex:29];
    [v53 setTexture:v76 atIndex:30];
    uint32x4_t v60 = v73;
    v77[0] = [v76 width];
    v77[1] = [v76 height];
    v77[2] = 1;
    int64x2_t v83 = vdupq_n_s64(0x10uLL);
    uint64_t v84 = 1;
    [v53 dispatchThreads:v77 threadsPerThreadgroup:&v83];
  }
  [v53 endEncoding];
  [v65 commit];
  FigMetalDecRef();
  FigMetalDecRef();

  int v63 = 0;
  id v24 = v66;
LABEL_25:

  return v63;
}

- (int)prepareForFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 properties:(id *)a6 nrfPlist:(id)a7 staticScene:(BOOL)a8 isLowLight:(BOOL)a9
{
  id v14 = a3;
  id v15 = (int *)a5;
  id v16 = a7;
  if (!LODWORD(a4[4].colorSpaceConversionParameters[0].finalScaleFwd)
    || SLODWORD(a4[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias) >= 5)
  {
LABEL_14:
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_10;
  }
  uint64_t v17 = v15[2];
  int v18 = -[FusionRemixStage computeFusionParams:properties:config:fusionMode:staticScene:isLowLight:](self, "computeFusionParams:properties:config:fusionMode:staticScene:isLowLight:", v16, a6, a4);
  if (v18)
  {
    int v24 = v18;
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
    memcpy(&self->_vertexUniforms, a4, 0x540uLL);
    int v19 = [*(id *)(v14[1] + 336 + 8 * (v17 - 1)) width];
    int v20 = [*(id *)(v14[1] + 336 + 8 * (v17 - 1)) height];
    int v21 = [*(id *)&v15[2 * v17 + 82] width];
    int v22 = [*(id *)&v15[2 * v17 + 82] height];
    if (v19 != v21 || v20 != v22) {
      goto LABEL_14;
    }
    int v24 = 0;
  }
LABEL_10:

  return v24;
}

- (int)selectNRFFusionReferenceFrame:(id)a3 ev0Bands:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6 nrfPlist:(id)a7 outputFusionMode:(int *)a8 staticScene:(BOOL *)a9 motionDetection:(id)a10 grayGhostDetection:(id)a11
{
  id v16 = a3;
  uint64_t v17 = a4;
  id v18 = a5;
  id v19 = a6;
  int v20 = a7;
  id v21 = a10;
  id v22 = a11;
  int v48 = 0;
  *(_DWORD *)[(MTLBuffer *)self->_flickerCountBuffer contents] = 0;
  nrfConfig = self->_nrfConfig;
  uint64_t v45 = v16;
  if (nrfConfig->_enableFlickerDetection)
  {
    if ([(FusionRemixStage *)self detectFlicker:v16 ev0Bands:v17 evmProperties:v18 ev0Properties:v19 height:&v48])
    {
      FigDebugAssert3();
LABEL_28:
      int v42 = FigSignalErrorAt();
      goto LABEL_34;
    }
    nrfConfig = self->_nrfConfig;
  }
  if (nrfConfig->_enableGrayGhostDetection)
  {
    int v24 = (_DWORD *)v20[4];
    v47[0] = v24[9];
    v47[1] = v24[8];
    v47[2] = v24[10];
    if (objc_msgSend(v22, "runGrayGhostDetection:ev0Bands:evmProperties:ev0Properties:hasChromaBias:atBand:params:", v16, v17, v18, v19, objc_msgSend(v19, "inputColorSpace") != 2, 2, v47))
    {
      FigDebugAssert3();
      int v42 = FigSignalErrorAt();
      goto LABEL_34;
    }
  }
  [(FigMetalContext *)self->_metal waitForIdle];
  if (self->_nrfConfig->_enableGrayGhostDetection)
  {
    [v22 getGrayGhostResultSync];
    float v26 = v25;
  }
  else
  {
    float v26 = 0.0;
  }
  id v27 = (unsigned int *)[(MTLBuffer *)self->_flickerCountBuffer contents];
  uint64_t v28 = v20[4];
  float v29 = *(float *)(v28 + 28);
  if (v26 < v29) {
    int v30 = 1;
  }
  else {
    int v30 = 2;
  }
  if ((float)((float)*v27 / (float)v48) > 0.08 && v26 >= v29) {
    goto LABEL_28;
  }
  int v32 = *(unsigned __int8 *)(v28 + 44);
  float v46 = 0.0;
  if (v32) {
    BOOL v33 = v26 < v29;
  }
  else {
    BOOL v33 = 0;
  }
  if (v33 || (BOOL forceEnableMotionDetection = self->_nrfConfig->_forceEnableMotionDetection))
  {
    id v35 = [v18 meta];
    float v36 = *(float *)([v35 exposureParams] + 52);
    id v37 = v18;
    uint64_t v38 = [v18 meta];
    float v39 = v36 * *(float *)[v38 exposureParams];

    uint64_t v40 = v20[4];
    if (v39 <= (float)(*(float *)(v40 + 56) / 0.98) && v39 >= (float)(*(float *)(v40 + 60) * 0.98)
      || (BOOL forceEnableMotionDetection = self->_nrfConfig->_forceEnableMotionDetection))
    {
      id v18 = v37;
      if ([v21 runMotionDetection:&v46 evm:v45[43] ev0:v17[43] evmProperties:v37 ev0Properties:v19 nrfPlist:v20])
      {
        FigDebugAssert3();
        int v42 = FigSignalErrorAt();
        goto LABEL_34;
      }
      uint64_t v41 = v20[4];
      if (v46 >= *(float *)(v41 + 76))
      {
        BOOL forceEnableMotionDetection = 0;
        if (v46 > *(float *)(v41 + 72)) {
          int v30 = 2;
        }
      }
      else
      {
        BOOL forceEnableMotionDetection = 1;
      }
    }
    else
    {
      id v18 = v37;
    }
  }
  int v42 = 0;
  *a8 = v30;
  *a9 = forceEnableMotionDetection;
LABEL_34:

  return v42;
}

- (int)correctGTC:(id)a3
{
  v4 = (int *)a3;
  v5 = [(FigMetalContext *)self->_metal commandQueue];
  id v6 = [v5 commandBuffer];

  if (v6)
  {
    if (v4[2] < 2)
    {
LABEL_6:
      if (*MEMORY[0x263F00E10])
      {
        id v14 = [v6 commandQueue];
        id v15 = [v14 commandBuffer];

        [v15 setLabel:@"KTRACE_MTLCMDBUF"];
        [v15 addCompletedHandler:&__block_literal_global_10];
        [v15 commit];
        [v6 addCompletedHandler:&__block_literal_global_241];
      }
      [v6 commit];
      int v16 = 0;
    }
    else
    {
      uint64_t v7 = 1;
      while (1)
      {
        id v8 = *(id *)&v4[2 * v7 + 84];
        id v9 = *(id *)&v4[2 * v7 + 124];
        id v10 = [v6 computeCommandEncoder];
        if (!v10) {
          break;
        }
        v11 = v10;
        [v10 setComputePipelineState:self->_correctGTC];
        [v11 setTexture:v8 atIndex:0];
        [v11 setTexture:v9 atIndex:1];
        unint64_t v12 = (unint64_t)([v9 width] + 7) >> 3;
        uint64_t v13 = [v9 height];
        v20[0] = v12;
        v20[1] = (unint64_t)(v13 + 3) >> 2;
        v20[2] = 1;
        long long v18 = xmmword_263380150;
        uint64_t v19 = 1;
        [v11 dispatchThreadgroups:v20 threadsPerThreadgroup:&v18];
        [v11 endEncoding];

        if (++v7 >= v4[2]) {
          goto LABEL_6;
        }
      }
      FigDebugAssert3();
      int v16 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }

  return v16;
}

uint64_t __31__FusionRemixStage_correctGTC___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __31__FusionRemixStage_correctGTC___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)allocateFusionBuffersIfNeeded:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return allocateBufsIfNeeded(a3, a4, a5, self->_metal, 1, 1);
}

- (int)runImageFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 accWeightPyramid:(id)a6 buffers:(id)a7 nrfPlist:(id)a8 confidence:(id)a9 batchN:(int)a10 isLastBatch:(BOOL)a11 isLowLight:(BOOL)a12 usePatchBasedFusion:(BOOL)a13 outputChromaBias:(float)a14
{
  v163 = (char *)a3;
  int v20 = (int *)a5;
  v154 = a6;
  v161 = (id *)a7;
  id v21 = a9;
  if (a10) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = a11;
  }
  BOOL v162 = v22;
  v165 = a4;
  int v23 = BYTE1(a4[4].colorSpaceConversionParameters[0].finalScale);
  uint64_t v24 = v20[2];
  float v25 = [(FigMetalContext *)self->_metal allocator];
  float v26 = (void *)[v25 newTextureDescriptor];

  if (!v26)
  {
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    float v29 = v161;
    uint64_t v28 = v163;
    goto LABEL_135;
  }
  id v27 = [v26 desc];
  [v27 setUsage:7];

  uint64_t v28 = v163;
  if (!a10 && a12) {
    allocateBufsIfNeeded(v161, [*(id *)(*((void *)v163 + 1) + 336) width], objc_msgSend(*(id *)(*((void *)v163 + 1) + 336), "height"), self->_metal, 1, 1);
  }
  if (v23)
  {
    float v29 = v161;
    id v30 = v161[1];
    v161[1] = 0;

    if (!a11) {
      goto LABEL_114;
    }
    if (*((void *)v20 + 43))
    {
      FigDebugAssert3();
      int v136 = 0;
      goto LABEL_135;
    }
    uint64_t v31 = [*(id *)(*((void *)v163 + 1) + 344) width];
    int v32 = [v26 desc];
    [v32 setWidth:v31];

    uint64_t v33 = [*(id *)(*((void *)v163 + 1) + 344) height];
    id v34 = [v26 desc];
    [v34 setHeight:v33];

    id v35 = [v26 desc];
    [v35 setPixelFormat:25];

    [v26 setLabel:0];
    float v36 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v37 = [v36 newTextureWithDescriptor:v26];
    uint64_t v38 = (void *)*((void *)v20 + 43);
    *((void *)v20 + 43) = v37;

    if (*((void *)v20 + 43))
    {
      if (!*((void *)v20 + 63))
      {
        uint64_t v39 = [*(id *)(*((void *)v163 + 1) + 504) width];
        uint64_t v40 = [v26 desc];
        [v40 setWidth:v39];

        uint64_t v41 = [*(id *)(*((void *)v163 + 1) + 504) height];
        int v42 = [v26 desc];
        [v42 setHeight:v41];

        uint64_t v43 = [v26 desc];
        [v43 setPixelFormat:65];

        [v26 setLabel:0];
        float v44 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v45 = [v44 newTextureWithDescriptor:v26];
        float v46 = (void *)*((void *)v20 + 63);
        *((void *)v20 + 63) = v45;

        float v29 = v161;
        if (!*((void *)v20 + 63)) {
          goto LABEL_151;
        }
LABEL_114:
        if (a11)
        {
          uint64_t v134 = *((void *)v20 + 43);
          uint64_t v135 = *((void *)v20 + 63);
        }
        else
        {
          uint64_t v134 = 0;
          uint64_t v135 = 0;
        }
        LODWORD(v148) = a10;
        int v136 = [(FusionRemixStage *)self runStationaryFusionWithParams:&self->_arrayOfinputParams[3].config.colorSpaceConversionParameters[1].transferFunctionInv inputs:v163 fusedLumaTex:v29[4] fusedChromaTex:v29[5] noiseMapLumaTex:v29[2] noiseMapChromaTex:v29[3] accWeightLumaTex:v154[42] accWeightChromaTex:v154[62] inferenceLumaTex:v134 inferenceChromaTex:v135 batchN:v148];
        for (uint64_t i = 0; i != 32; i += 8)
          +[PyramidStorage makePyramidAliasable:*(void *)&v163[i + 8] metal:self->_metal releaseBand0:1];
        float v29 = v161;
        goto LABEL_134;
      }
      FigDebugAssert3();
      int v136 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v136 = FigSignalErrorAt();
    }
    float v29 = v161;
    goto LABEL_135;
  }
  uint64_t v168 = (v24 - 1);
  id v164 = v21;
  if (SLODWORD(v165[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias) <= 1)
  {
    float v29 = v161;
    id v138 = v161[1];
    v161[1] = 0;

    if (a10) {
      goto LABEL_19;
    }
    goto LABEL_121;
  }
  unint64_t v47 = (unint64_t)[*(id *)(*((void *)v163 + 1) + 336) width] >> 3;
  int v48 = [v26 desc];
  [v48 setWidth:v47];

  unint64_t v49 = (unint64_t)[*(id *)(*((void *)v163 + 1) + 336) height] >> 3;
  BOOL v50 = [v26 desc];
  [v50 setHeight:v49];

  int v51 = [v26 desc];
  [v51 setPixelFormat:10];

  [v26 setLabel:0];
  id v52 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v53 = [v52 newTextureWithDescriptor:v26];
  float v29 = v161;
  id v54 = v161[1];
  v161[1] = (id)v53;

  if (!v161[1])
  {
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    id v21 = v164;
    goto LABEL_135;
  }
  BYTE6(v149) = 0;
  WORD2(v149) = 257;
  LODWORD(v149) = a10;
  LODWORD(v146) = 1;
  WORD2(v144) = 257;
  LODWORD(v144) = 0;
  *(float *)&double v55 = a14;
  id v21 = v164;
  if (-[FusionRemixStage runFusionForBandIndex:config:oldFusedUpTex:oldFusedTex:fusedUpTex:fusedTex:accWeightTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:inputs:simMapTex:confidence:noiseMap:batchN:isFirstBatch:isLastBatch:usePatchBasedFusion:minVarWeightSum:outputChromaBias:ggMaxFusionWeights:](self, "runFusionForBandIndex:config:oldFusedUpTex:oldFusedTex:fusedUpTex:fusedTex:accWeightTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:inputs:simMapTex:confidence:noiseMap:batchN:isFirstBatch:isLastBatch:usePatchBasedFusion:minVarWeightSum:outputChromaBias:ggMaxFusionWeights:", v168, v165, 0, 0, 0, 0.0, v55, 0, &self->_anon_f10[6800], v144, v146, v163, self->_placeHolderTex, 0, 0,
         v149,
         0))
  {
LABEL_151:
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    goto LABEL_135;
  }
  if (!a10) {
LABEL_121:
  }
    self->_float exposureEffectiveTimeSumSoFar = 0.0;
LABEL_19:
  uint64_t nonLinearBias_low = LODWORD(v165[4].colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias);
  uint64_t v57 = LODWORD(v165[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearBias);
  uint64_t v58 = (v24 - 1);
  if ((int)nonLinearBias_low >= 1)
  {
    for (uint64_t j = 0; j != nonLinearBias_low; ++j)
    {
      if ((!a10 || v57 != j)
        && (a10
         || j != LODWORD(v165[4].colorSpaceConversionParameters[0].transferFunctionInv.linearScale)
         || !HIBYTE(v165[4].colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower)))
      {
        self->_float exposureEffectiveTimeSumSoFar = *(&self->_arrayOfinputParams[6].config.colorSpaceConversionParameters[1].transferFunctionInv.linearScale
                                               + j)
                                             + self->_exposureEffectiveTimeSumSoFar;
      }
    }
  }
  v153 = v26;
  float exposureEffectiveTimeSumSoFar = self->_exposureEffectiveTimeSumSoFar;
  float v61 = *(&self->_arrayOfinputParams[6].config.colorSpaceConversionParameters[1].transferFunctionInv.linearScale
        + (int)v57);
  id v171 = 0;
  locatiouint64_t n = 0;
  if ((int)v24 < 1)
  {
    v167 = 0;
    v170 = 0;
LABEL_123:
    if (v20[2] >= 1)
    {
      uint64_t v139 = 0;
      uint64_t v28 = v163;
      float v26 = v153;
      do
      {
        for (uint64_t k = 0; k != 32; k += 8)
        {
          FigMetalDecRef();
          FigMetalDecRef();
        }
        ++v139;
      }
      while (v139 < v20[2]);
      int v136 = 0;
      int v141 = 1;
      float v29 = v161;
      id v21 = v164;
      goto LABEL_132;
    }
    int v136 = 0;
    int v141 = 1;
    goto LABEL_130;
  }
  v170 = 0;
  v167 = 0;
  arrayOfinputParams = self->_arrayOfinputParams;
  int v62 = v163 + 8;
  v151 = v29 + 4;
  v152 = v29 + 5;
  float v63 = exposureEffectiveTimeSumSoFar / v61;
  v159 = v20;
  v169 = self;
  while (1)
  {
    uint64_t v64 = v24 - 1;
    BOOL v65 = v24 == 1 || v64 == v58;
    BOOL v66 = a10 != 0;
    if (v65) {
      BOOL v66 = 1;
    }
    if (!v66)
    {
      if (!*(void *)&v20[2 * v64 + 84])
      {
        uint64_t v69 = [*(id *)(*(void *)v62 + 336 + 8 * v64) width];
        v70 = [v153 desc];
        [v70 setWidth:v69];

        uint64_t v71 = [*(id *)(*(void *)v62 + 336 + 8 * v64) height];
        int64x2_t v72 = [v153 desc];
        [v72 setHeight:v71];

        self = v169;
        long long v73 = [v153 desc];
        [v73 setPixelFormat:25];

        [v153 setLabel:0];
        id v74 = [(FigMetalContext *)v169->_metal allocator];
        uint64_t v75 = [v74 newTextureWithDescriptor:v153];
        id v76 = *(void **)&v20[2 * v64 + 84];
        *(void *)&v20[2 * v64 + 84] = v75;

        if (!*(void *)&v20[2 * v64 + 84])
        {
          FigDebugAssert3();
          int v136 = FigSignalErrorAt();
          goto LABEL_144;
        }
LABEL_42:
        if (v24 == 2) {
          uint64_t v77 = 0;
        }
        else {
          uint64_t v77 = 255;
        }
        [(FigMetalContext *)self->_metal allocator];
        float v79 = v78 = self;
        v80 = (void *)[v79 newTextureDescriptor:v77];

        if (v80)
        {
          v81 = [v80 desc];
          [v81 setUsage:7];

          uint64_t v82 = [*(id *)&v20[2 * v64 + 84] width];
          [v80 desc];
          uint64_t v84 = v83 = (id *)v20;
          [v84 setWidth:v82];

          uint64_t v85 = [v83[v64 + 42] height];
          id v86 = [v80 desc];
          [v86 setHeight:v85];

          id v87 = [v80 desc];
          [v87 setPixelFormat:25];

          [v80 setLabel:0];
          float v88 = [(FigMetalContext *)v78->_metal allocator];
          uint64_t v89 = [v88 newTextureWithDescriptor:v80 subAllocatorID:v77];

          if (v89)
          {

            int v90 = &v83[v64 + 42];
            int v166 = 1;
            id v68 = (void *)v89;
            char v155 = 1;
            int v20 = (int *)v83;
            float v29 = v161;
            self = v169;
            int v67 = a10;
            goto LABEL_48;
          }
          FigDebugAssert3();
          v142 = 0;
          int v20 = (int *)v83;
          float v29 = v161;
        }
        else
        {
          FigDebugAssert3();
          v142 = v167;
        }
        int v136 = FigSignalErrorAt();

        int v141 = 0;
        uint64_t v28 = v163;
        id v21 = v164;
        float v26 = v153;
        goto LABEL_133;
      }
      FigDebugAssert3();
      int v141 = 0;
      int v136 = 0;
LABEL_130:
      uint64_t v28 = v163;
      goto LABEL_131;
    }
    if (v24 != 1) {
      goto LABEL_42;
    }

    int v67 = a10;
    if (a10)
    {
      int v166 = 0;
      id v68 = 0;
      char v155 = 1;
    }
    else
    {
      allocateBufsIfNeeded(v29, [*(id *)(*(void *)v62 + 336) width], objc_msgSend(*(id *)(*(void *)v62 + 336), "height"), self->_metal, 1, 0);
      int v166 = 0;
      id v68 = 0;
      char v155 = 0;
    }
    int v90 = v151;
LABEL_48:
    id v91 = *v90;
    uint64_t v94 = 0;
    BOOL v95 = v64 == v168 || v67 == 0;
    if (v95) {
      id v96 = 0;
    }
    else {
      id v96 = location;
    }
    BOOL v97 = v24 == 1 || v67 == 0;
    BOOL v156 = v97;
    v167 = v68;
    if (v97) {
      uint64_t v98 = 0;
    }
    else {
      uint64_t v98 = v68;
    }
    if (v64 != v168) {
      uint64_t v94 = *(void *)&v20[2 * v24 + 84];
    }
    BOOL v157 = v95;
    if (v162) {
      uint64_t v99 = 0;
    }
    else {
      uint64_t v99 = v154[v64 + 42];
    }
    placeHolderTex = (MTLTexture *)v29[1];
    if (!placeHolderTex) {
      placeHolderTex = self->_placeHolderTex;
    }
    unsigned int v101 = 2 * v64;
    BOOL v102 = a13;
    if (v24 != 1) {
      BOOL v102 = 0;
    }
    BYTE6(v149) = v102;
    BYTE5(v149) = a11;
    BYTE4(v149) = v67 == 0;
    LODWORD(v149) = v67;
    LODWORD(v146) = 0;
    BYTE5(v144) = v64 == v168;
    BYTE4(v144) = 1;
    LODWORD(v144) = 2 * v64 + 3;
    *(float *)&double v92 = v63;
    *(float *)&double v93 = a14;
    v158 = v91;
    if (-[FusionRemixStage runFusionForBandIndex:config:oldFusedUpTex:oldFusedTex:fusedUpTex:fusedTex:accWeightTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:inputs:simMapTex:confidence:noiseMap:batchN:isFirstBatch:isLastBatch:usePatchBasedFusion:minVarWeightSum:outputChromaBias:ggMaxFusionWeights:](self, "runFusionForBandIndex:config:oldFusedUpTex:oldFusedTex:fusedUpTex:fusedTex:accWeightTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:inputs:simMapTex:confidence:noiseMap:batchN:isFirstBatch:isLastBatch:usePatchBasedFusion:minVarWeightSum:outputChromaBias:ggMaxFusionWeights:", v24 - 1, v165, v96, v98, v94, v91, v92, v93, v99, (char *)arrayOfinputParams + 1520 * ((2 * v64) | 1u), v144, v146, v163, placeHolderTex, v164,
           v29[2],
           v149,
           v29[6]))
    {
      break;
    }
    FigMetalDecRef();
    objc_storeStrong(&location, v68);
    if (v24 <= v168)
    {
      for (uint64_t m = 0; m != 32; m += 8)
        FigMetalDecRef();
      int v20 = v159;
      if (v166 & a11) {
        FigMetalDecRef();
      }
    }
    BOOL v104 = a10 != 0;
    if (v24 == 1) {
      BOOL v104 = 1;
    }
    if (!v104 && v64 != v168 && (FigMetalIsValid() & 1) == 0)
    {
      uint64_t v105 = [*(id *)(*(void *)v62 + 496 + 8 * v64) width];
      uint64_t v106 = [v153 desc];
      [v106 setWidth:v105];

      uint64_t v107 = [*(id *)(*(void *)v62 + 496 + 8 * v64) height];
      v108 = [v153 desc];
      [v108 setHeight:v107];

      uint64_t v109 = [v153 desc];
      [v109 setPixelFormat:65];

      [v153 setLabel:0];
      unsigned int v110 = [(FigMetalContext *)v169->_metal allocator];
      uint64_t v111 = [v110 newTextureWithDescriptor:v153];
      float v29 = v161;
      uint64_t v112 = *(void **)&v159[2 * v64 + 124];
      *(void *)&v159[2 * v64 + 124] = v111;

      int v20 = v159;
      if (!*(void *)&v159[2 * v64 + 124]) {
        break;
      }
    }
    if (v166)
    {
      uint64_t v113 = v20;
      uint64_t v114 = [*(id *)&v20[2 * v64 + 124] width];
      int v115 = [v153 desc];
      [v115 setWidth:v114];

      v116 = v113 + 124;
      float v29 = v161;
      uint64_t v117 = [(id)v116[v64] height];
      v118 = [v153 desc];
      [v118 setHeight:v117];

      v119 = [v153 desc];
      [v119 setPixelFormat:65];

      [v153 setLabel:0];
      int v120 = [(FigMetalContext *)v169->_metal allocator];
      uint64_t v121 = [v120 newTextureWithDescriptor:v153];

      v170 = (void *)v121;
    }
    else
    {
      int v120 = v170;
      v170 = 0;
    }

    if ((v155 & 1) == 0) {
      allocateBufsIfNeeded(v29, [*(id *)(*(void *)v62 + 336) width], objc_msgSend(*(id *)(*(void *)v62 + 336), "height"), v169->_metal, 0, 1);
    }
    uint64_t v122 = v152;
    if (v24 != 1) {
      uint64_t v122 = (id *)&v159[2 * v64 + 124];
    }
    id v123 = *v122;
    uint64_t v125 = 0;
    if (v157) {
      id v126 = 0;
    }
    else {
      id v126 = v171;
    }
    if (v156) {
      id v127 = 0;
    }
    else {
      id v127 = v170;
    }
    if (v64 != v168) {
      uint64_t v125 = *(void *)&v159[2 * v24 + 124];
    }
    if (v162) {
      uint64_t v128 = 0;
    }
    else {
      uint64_t v128 = v154[v64 + 62];
    }
    id v129 = (MTLTexture *)v29[1];
    if (!v129) {
      id v129 = v169->_placeHolderTex;
    }
    v130 = &arrayOfinputParams->config.preWarpEnabled + 1520 * v101;
    unsigned int v131 = v101 + 2;
    *(_WORD *)((char *)&v150 + 5) = a11;
    BYTE4(v150) = a10 == 0;
    LODWORD(v150) = a10;
    id v21 = v164;
    LODWORD(v147) = 0;
    BYTE5(v145) = v64 == v168;
    BYTE4(v145) = 0;
    LODWORD(v145) = v131;
    *(float *)&double v124 = a14;
    if (-[FusionRemixStage runFusionForBandIndex:config:oldFusedUpTex:oldFusedTex:fusedUpTex:fusedTex:accWeightTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:inputs:simMapTex:confidence:noiseMap:batchN:isFirstBatch:isLastBatch:usePatchBasedFusion:minVarWeightSum:outputChromaBias:ggMaxFusionWeights:](v169, "runFusionForBandIndex:config:oldFusedUpTex:oldFusedTex:fusedUpTex:fusedTex:accWeightTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:inputs:simMapTex:confidence:noiseMap:batchN:isFirstBatch:isLastBatch:usePatchBasedFusion:minVarWeightSum:outputChromaBias:ggMaxFusionWeights:", v24 - 1, v165, v126, v127, v125, v123, 0.0, v124, v128, v130, v145, v147, v163, v129, v164,
           v29[3],
           v150,
           v29[6]))
    {
      FigDebugAssert3();
      int v136 = FigSignalErrorAt();

      int v141 = 0;
      float v26 = v153;
      v142 = v167;
      int v20 = v159;
      uint64_t v28 = v163;
      goto LABEL_133;
    }
    FigMetalDecRef();
    objc_storeStrong(&v171, v170);
    self = v169;
    int v20 = v159;
    if (v24 <= v168)
    {
      for (uint64_t n = 0; n != 32; n += 8)
        FigMetalDecRef();
      id v21 = v164;
      if (v166 & a11) {
        FigMetalDecRef();
      }
    }
    if (v21) {
      FigMetalDecRef();
    }

    BOOL v133 = v24-- < 2;
    uint64_t v58 = v168;
    if (v133) {
      goto LABEL_123;
    }
  }
  FigDebugAssert3();
  int v136 = FigSignalErrorAt();

LABEL_144:
  int v141 = 0;
  uint64_t v28 = v163;
  id v21 = v164;
LABEL_131:
  float v26 = v153;
LABEL_132:
  v142 = v167;
LABEL_133:

  if (v141) {
LABEL_134:
  }
    FigMetalDecRef();
LABEL_135:

  return v136;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void)setSidecarWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_placeHolderTex, 0);
  objc_storeStrong((id *)&self->_correctGTC, 0);
  objc_storeStrong((id *)&self->_flickerCountBuffer, 0);
  objc_storeStrong((id *)&self->_detectFlicker, 0);
  objc_storeStrong((id *)&self->_grayGhostCountBuffer, 0);
  objc_storeStrong((id *)&self->_computeGrayGhostCount, 0);
  for (uint64_t i = 0; i != -10; --i)
    objc_storeStrong((id *)&self->_uniforms[i + 9], 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_uniformsHeap, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end