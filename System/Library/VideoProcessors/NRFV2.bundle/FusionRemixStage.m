@interface FusionRemixStage
+ (BOOL)isSupported;
+ (id)getFragmentShader:(id)a3 bandIndex:(int)a4 isLuma:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10;
+ (int)prewarmShaders:(id)a3;
- (SidecarWriter)sidecarWriter;
- (id)initBandFusion:(id)a3 nrfConfig:(id)a4 isPrewarm:(BOOL)a5;
- (int)allocateFusionBuffersIfNeeded:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (int)computeFusionParams:(id)a3 properties:(const frameProperties_t *)a4 config:(const FusionConfiguration *)a5 fusionMode:(int)a6 staticScene:(BOOL)a7 isLowLight:(BOOL)a8;
- (int)computeGrayGhostCount:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 atBand:(int)a7 nrfPlist:(id)a8 size:(int *)a9;
- (int)correctGTC:(id)a3;
- (int)detectFlicker:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 height:(int *)a7;
- (int)prepareForFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 properties:(const frameProperties_t *)a6 nrfPlist:(id)a7 staticScene:(BOOL)a8 isLowLight:(BOOL)a9;
- (int)runFusionForBandIndex:(int)a3 config:(const FusionConfiguration *)a4 oldFusedUpTex:(id)a5 oldFusedTex:(id)a6 fusedUpTex:(id)a7 fusedTex:(id)a8 accWeightTex:(id)a9 bandFusionParams:(const FusionRemixStageUniformsIBP *)a10 fragmentBufferIndex:(int)a11 processLuma:(BOOL)a12 processTopBand:(BOOL)a13 computeSpecialMap:(int)a14 inputs:(id)a15 simMapTex:(id)a16 confidence:(id)a17 noiseMap:(id)a18 batchN:(int)a19 isFirstBatch:(BOOL)a20 isLastBatch:(BOOL)a21 usePatchBasedFusion:(BOOL)a22 minVarWeightSum:(float)a23 outputChromaBias:(float)a24 ggMaxFusionWeights:(id)a25;
- (int)runImageFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 accWeightPyramid:(id)a6 buffers:(id)a7 properties:(const frameProperties_t *)a8 nrfPlist:(id)a9 confidence:(id)a10 batchN:(int)a11 isLastBatch:(BOOL)a12 isLowLight:(BOOL)a13 usePatchBasedFusion:(BOOL)a14 outputChromaBias:(float)a15;
- (int)runStationaryFusionWithParams:(const FusionRemixStageUniformsIBP *)a3 inputs:(id)a4 fusedLumaTex:(id)a5 fusedChromaTex:(id)a6 noiseMapLumaTex:(id)a7 noiseMapChromaTex:(id)a8 accWeightLumaTex:(id)a9 accWeightChromaTex:(id)a10 inferenceLumaTex:(id)a11 inferenceChromaTex:(id)a12 batchN:(int)a13;
- (int)selectNRFFusionReferenceFrame:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 nrfPlist:(id)a7 outputFusionMode:(int *)a8 staticScene:(BOOL *)a9 motionDetection:(id)a10 grayGhostDetection:(id)a11;
- (void)setSidecarWriter:(id)a3;
@end

@implementation FusionRemixStage

+ (BOOL)isSupported
{
  v4 = objc_msgSend_metalDevice(MEMORY[0x263F2EE30], a2, v2, v3);
  char v7 = objc_msgSend_supportsFamily_(v4, v5, 1003, v6);

  return v7;
}

- (id)initBandFusion:(id)a3 nrfConfig:(id)a4 isPrewarm:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v95.receiver = self;
  v95.super_class = (Class)FusionRemixStage;
  v11 = [(FusionRemixStage *)&v95 init];
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
    v92 = 0;
    goto LABEL_29;
  }
  v16 = v13;
  objc_msgSend_setStorageMode_(v13, v14, 0, v15);
  objc_msgSend_setHazardTrackingMode_(v16, v17, 2, v18);
  objc_msgSend_setSize_(v16, v19, 51200, v20);
  v24 = objc_msgSend_device(v9, v21, v22, v23);
  uint64_t v27 = objc_msgSend_newHeapWithDescriptor_(v24, v25, (uint64_t)v16, v26);
  uniformsHeap = v12->_uniformsHeap;
  v12->_uniformsHeap = (MTLHeap *)v27;

  if (!v12->_uniformsHeap || (uint64_t v29 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_27:

    goto LABEL_28;
  }
  v33 = (void *)v29;
  uint64_t v34 = objc_msgSend_resourceOptions(v12->_uniformsHeap, v30, v31, v32);
  objc_msgSend_setResourceOptions_(v33, v35, v34, v36);
  if (a5)
  {
LABEL_16:
    uint64_t v82 = objc_msgSend_computePipelineStateFor_constants_(v9, v37, @"computeGrayGhostCount", 0);
    computeGrayGhostCount = v12->_computeGrayGhostCount;
    v12->_computeGrayGhostCount = (MTLComputePipelineState *)v82;

    if (v12->_computeGrayGhostCount)
    {
      uint64_t v85 = objc_msgSend_computePipelineStateFor_constants_(v9, v84, @"detectFlicker", 0);
      detectFlicker = v12->_detectFlicker;
      v12->_detectFlicker = (MTLComputePipelineState *)v85;

      if (v12->_detectFlicker)
      {
        uint64_t v88 = objc_msgSend_computePipelineStateFor_constants_(v9, v87, @"correctGTC", 0);
        correctGTC = v12->_correctGTC;
        v12->_correctGTC = (MTLComputePipelineState *)v88;

        if (v12->_correctGTC)
        {
          objc_msgSend_prewarmInternalMetalShadersForFormatsList_(v12->_metal, v90, (uint64_t)&unk_270E50AD8, v91);
          v92 = v12;

          goto LABEL_29;
        }
      }
    }
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_27;
  }
  id v94 = v10;
  char v40 = 0;
  char v41 = 1;
  while (1)
  {
    char v42 = v41;
    v43 = objc_msgSend_sharedInstance(FusionRemixStageShared, v37, v38, v39);
    v45 = objc_msgSend_getShaders_fp16_(v43, v44, (uint64_t)v12->_metal, v40 & 1);

    if (!v45) {
      break;
    }

    char v41 = 0;
    char v40 = 1;
    if ((v42 & 1) == 0)
    {
      uint64_t v46 = 0;
      uniforms = v12->_uniforms;
      while (1)
      {
        v48 = [FusionRemixUniforms alloc];
        uint64_t v50 = objc_msgSend_initWithMetal_heap_(v48, v49, (uint64_t)v9, (uint64_t)v12->_uniformsHeap);
        v51 = uniforms[v46];
        uniforms[v46] = (FusionRemixUniforms *)v50;

        if (!uniforms[v46]) {
          goto LABEL_20;
        }
        if (++v46 == 10)
        {
          v53 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v52, 10, 1, 1, 0);

          if (!v53)
          {
            FigDebugAssert3();
            FigSignalErrorAt();
            goto LABEL_21;
          }
          objc_msgSend_setUsage_(v53, v54, 1, v55);
          uint64_t v59 = objc_msgSend_resourceOptions(v12->_uniformsHeap, v56, v57, v58);
          objc_msgSend_setResourceOptions_(v53, v60, v59, v61);
          uint64_t v64 = objc_msgSend_newTextureWithDescriptor_(v12->_uniformsHeap, v62, (uint64_t)v53, v63);
          placeHolderTex = v12->_placeHolderTex;
          v12->_placeHolderTex = (MTLTexture *)v64;

          v66 = v12->_uniformsHeap;
          uint64_t v70 = objc_msgSend_resourceOptions(v66, v67, v68, v69);
          uint64_t v72 = objc_msgSend_newBufferWithLength_options_(v66, v71, 4, v70);
          grayGhostCountBuffer = v12->_grayGhostCountBuffer;
          v12->_grayGhostCountBuffer = (MTLBuffer *)v72;

          id v10 = v94;
          if (v12->_grayGhostCountBuffer)
          {
            v77 = v12->_uniformsHeap;
            uint64_t v78 = objc_msgSend_resourceOptions(v77, v74, v75, v76);
            uint64_t v80 = objc_msgSend_newBufferWithLength_options_(v77, v79, 4, v78);
            flickerCountBuffer = v12->_flickerCountBuffer;
            v12->_flickerCountBuffer = (MTLBuffer *)v80;

            if (v12->_flickerCountBuffer)
            {
              v33 = v53;
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
  v92 = 0;
  id v10 = v94;
LABEL_29:

  return v92;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [FuseRemixShaders alloc];
  uint64_t v6 = objc_msgSend_initWithMetal_pixelFormatLuma_pixelFormatChroma_(v4, v5, (uint64_t)v3, 25, 65);
  char v7 = [FuseRemixShaders alloc];
  id v9 = objc_msgSend_initWithMetal_pixelFormatLuma_pixelFormatChroma_(v7, v8, (uint64_t)v3, 10, 30);

  id v10 = [FusionRemixStage alloc];
  isPrewarm = objc_msgSend_initBandFusion_nrfConfig_isPrewarm_(v10, v11, (uint64_t)v3, 0, 1);

  v16 = objc_msgSend_device(v3, v13, v14, v15);
  uint64_t v18 = objc_msgSend_newBufferWithLength_options_(v16, v17, 1024, 0);

  if (v18)
  {
    uint64_t v22 = objc_msgSend_commandQueue(v3, v19, v20, v21);
    uint64_t v26 = objc_msgSend_commandBuffer(v22, v23, v24, v25);

    if (v26)
    {
      v33 = objc_msgSend_blitCommandEncoder(v26, v27, v28, v29);
      if (v33)
      {
        uint64_t v34 = objc_msgSend_length(v18, v30, v31, v32);
        objc_msgSend_fillBuffer_range_value_(v33, v35, (uint64_t)v18, 0, v34, 0);
        objc_msgSend_endEncoding(v33, v36, v37, v38);
        objc_msgSend_commit(v26, v39, v40, v41);
      }
    }
  }
  if (v6) {
    BOOL v42 = v9 == 0;
  }
  else {
    BOOL v42 = 1;
  }
  if (v42 || isPrewarm == 0) {
    int v44 = -12786;
  }
  else {
    int v44 = 0;
  }

  return v44;
}

+ (id)getFragmentShader:(id)a3 bandIndex:(int)a4 isLuma:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10
{
  return (id)MEMORY[0x270F9A6D0](a3, sel_getFragmentShaderWithIsLuma_isTopBand_isBand0_isFirstBatch_isLastBatch_usePatchBasedFusion_useGpuCSC_ggmEnabled_, a5, a4 == 3);
}

- (int)computeFusionParams:(id)a3 properties:(const frameProperties_t *)a4 config:(const FusionConfiguration *)a5 fusionMode:(int)a6 staticScene:(BOOL)a7 isLowLight:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v78 = a7;
  v89 = a3;
  uint64_t v14 = 0;
  BOOL v79 = v8;
  uint64_t v15 = 16;
  if (v8) {
    uint64_t v15 = 112;
  }
  float v16 = *(float *)((char *)&a4->meta.sensorID
                 + 224224 * SLODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale)
                 + v15);
  arrayOfinputParams = self->_arrayOfinputParams;
  uint64_t v80 = (char *)a4 + 224224 * SLODWORD(a5[4].colorSpaceConversionParameters[1].finalScale);
  v84 = self->_arrayOfinputParams;
  uint64_t v81 = (uint64_t)(v80 + 16);
  uint64_t v82 = a4;
  do
  {
    objc_msgSend_objectAtIndexedSubscript_(*(void **)(v89[3] + 8), v12, v14, v13);
    uint64_t v18 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v19 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 3040 * v14);
    uint64_t v88 = (2 * v14) | 1;
    uint64_t v20 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 1520 * v88);
    float v21 = sub_262FCDA18(v18[1], v16);
    v20[336] = v21;
    v19[336] = v21;
    v20[337] = sub_262FCDA18(v18[2], v16);
    v19[337] = sub_262FCDA18(v18[3], v16);
    v20[338] = *(float *)(v89[3] + 136);
    v86 = v18;
    v20[341] = sub_262FCDA18(v18[4], v16);
    uint64_t v25 = (void *)v89[15];
    if (v25)
    {
      objc_msgSend_tuningParams(v25, v22, v23, v24);
      int v26 = v92;
    }
    else
    {
      int v26 = 0;
    }
    uint64_t v85 = v14;
    uint64_t v87 = 2 * v14;
    uint64_t v27 = &arrayOfinputParams->config.preWarpEnabled + 3040 * v14;
    *((_DWORD *)v27 + 377) = v26;
    uint64_t v28 = (2 * v14) | 1;
    uint64_t v29 = &arrayOfinputParams->config.preWarpEnabled + 1520 * v88;
    *((_DWORD *)v29 + 377) = v26;
    uint64_t v30 = v18[5];
    uint64_t v31 = (float *)(v29 + 1368);
    uint64_t v32 = (float *)(v27 + 1368);
    if (a6 == 2)
    {
      float v33 = sub_262FCDA18(*(void *)(*(void *)(v30 + 16) + 8), v16);
      *uint64_t v31 = v33;
      *uint64_t v32 = v33;
      float v34 = sub_262FCDA18(*(void *)(*(void *)(v18[5] + 16) + 24), v16);
      *(&arrayOfinputParams[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.linearScale + 380 * v88) = v34;
      v35 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 1520 * v87);
      v35[343] = v34;
      v35[344] = sub_262FCDA18(*(void *)(*(void *)(v18[7] + 16) + 8), v16);
      v35[345] = sub_262FCDA18(*(void *)(*(void *)(v18[7] + 16) + 24), v16);
      float v36 = sub_262FCDA18(*(void *)(*(void *)(v18[6] + 16) + 8), v16);
      uint64_t v37 = &OBJC_IVAR___PerReferenceBandata_evm;
      arrayOfinputParams = v84;
    }
    else
    {
      float v38 = sub_262FCDA18(*(void *)(*(void *)(v30 + 8) + 8), v16);
      *uint64_t v31 = v38;
      *uint64_t v32 = v38;
      float v39 = sub_262FCDA18(*(void *)(*(void *)(v18[5] + 8) + 24), v16);
      *(&arrayOfinputParams[3].config.colorSpaceConversionParameters[0].transferFunctionFwd.linearScale + 380 * v88) = v39;
      uint64_t v40 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 1520 * v87);
      v40[343] = v39;
      v40[344] = sub_262FCDA18(*(void *)(*(void *)(v18[7] + 8) + 8), v16);
      v40[345] = sub_262FCDA18(*(void *)(*(void *)(v18[7] + 8) + 24), v16);
      uint64_t v41 = *(void *)(v18[6] + 8);
      if (v78)
      {
        uint64_t v42 = *(void *)(v41 + 16);
        if (!v42)
        {
          FigDebugAssert3();
          int v77 = FigSignalErrorAt();

          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v42 = *(void *)(v41 + 8);
      }
      float v36 = sub_262FCDA18(v42, v16);
      uint64_t v37 = &OBJC_IVAR___PerReferenceBandata_ev0;
      uint64_t v28 = v88;
    }
    v43 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 1520 * v28);
    v43[344] = v36;
    v43[345] = sub_262FCDA18(*(void *)(*(void *)(v18[6] + *v37) + 24), v16);
    uint64_t v44 = v89[3];
    uint64_t v45 = *(void *)(v44 + 88);
    if (v45)
    {
      *(float *)(v89[3] + 80) = sub_262FCDA18(v45, v16);
      uint64_t v44 = v89[3];
    }
    int v46 = *(_DWORD *)(v44 + 80);
    *((_DWORD *)&arrayOfinputParams[3].config.colorSpaceConversionParameters[1].transferFunctionInv.nonLinearBias
    + 380 * v88) = v46;
    *((_DWORD *)&arrayOfinputParams[3].config.colorSpaceConversionParameters[1].transferFunctionInv.nonLinearBias
    + 380 * v87) = v46;
    uint64_t v47 = *(void *)(*(void *)(v89[2] + 8) + 32);
    float v48 = 0.0;
    float v49 = 0.0;
    if (*(int *)(v47 + 8) >= 1) {
      float v49 = sub_262FCDA18(v47, v16);
    }
    *(&arrayOfinputParams[2].patchBasedFusionParameters.nccHighLimitMatchedTexture + 380 * v88) = v49;
    uint64_t v50 = *(void *)(*(void *)(v89[2] + 8) + 40);
    if (*(int *)(v50 + 8) >= 1) {
      float v48 = sub_262FCDA18(v50, v16);
    }
    *(&arrayOfinputParams[2].patchBasedFusionParameters.fusionBoostMatchedTexture + 380 * v88) = v48;
    v51 = v89;
    int v52 = v85;
    if (!v85)
    {
      uint64_t v53 = v89[3];
      if (*(unsigned char *)(v53 + 120))
      {
        v54 = (float *)(&arrayOfinputParams->config.preWarpEnabled + 1520 * v88);
        v54[369] = sub_262FCDA18(*(void *)(*(void *)(v53 + 128) + 8), v16);
        v54[370] = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 16), v16);
        v54[371] = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 24), v16);
        v54[372] = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 32), v16);
        v54[373] = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 40), v16);
        v54[374] = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 48), v16);
        v54[375] = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 56), v16);
        v51 = v89;
        float v55 = sub_262FCDA18(*(void *)(*(void *)(v89[3] + 128) + 64), v16);
        int v52 = 0;
        v54[376] = v55;
      }
    }
    long long v90 = 0uLL;
    uint64_t v91 = 0;
    sub_262F857EC((float32x2_t *)&v90, (void *)v51[4], (uint64_t)&v82->meta.exposureParams+ 224224 * SLODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale), v52);
    float v56 = sub_262F98A00(v81, (uint64_t)&v82->meta.exposureParams+ 224224 * SLODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale), (uint64_t)v80);
    int v57 = LOBYTE(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias) == 0;
    if (LOBYTE(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias))
    {
      uint64_t v58 = v87;
    }
    else
    {
      uint64_t v58 = v87;
      if (v79) {
        int v57 = *((unsigned __int8 *)&v82->meta.exposureParams.hr_enabled
      }
              + 224224 * SLODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale));
    }
    if (v57)
    {
      uint64_t v59 = (float *)(&v82->meta.sensorID
                    + 56056 * SLODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale));
      float v56 = (float)(v56 * sqrtf(v59[13] / v59[4])) / sqrtf(v59[15]);
    }
    sub_262F85B78((float32x2_t *)&v90, v56);
    v60 = &v84->config.preWarpEnabled + 1520 * v88;
    uint64_t v61 = &v84->config.preWarpEnabled + 1520 * v58;
    uint64_t v62 = v91;
    *((void *)v61 + 175) = v91;
    long long v63 = v90;
    *(_OWORD *)(v61 + 1384) = v90;
    *((void *)v60 + 175) = v62;
    *(_OWORD *)(v60 + 1384) = v63;
    memcpy(v19, a5, 0x540uLL);
    memmove(v20, a5, 0x540uLL);
    if (SLODWORD(a5[4].colorSpaceConversionParameters[1].finalScaleFwd) >= 1)
    {
      uint64_t v64 = 0;
      uint64_t v65 = 2996;
      v66 = v82;
      do
      {
        float v67 = sub_262F98A00(v81, (uint64_t)&v66->meta.exposureParams, (uint64_t)v80);
        uint64_t v68 = (float *)((char *)self + 4 * v64);
        v68[356] = v67;
        uint64_t v69 = (float *)((char *)self + v65);
        *(v69 - 13) = v67;
        float exposure_time = v66->meta.exposureParams.exposure_time;
        v68[364] = exposure_time;
        *(v69 - 5) = exposure_time;
        v71 = &OBJC_IVAR___DenoiseAndSharpeningTuning_shortFrameDenoiseBoost;
        if (v64 == *(_DWORD *)&a5[4].colorSpaceConversionParameters[1].outputToLinearYCbCr
          || (float v72 = 1.0,
              v71 = &OBJC_IVAR___DenoiseAndSharpeningTuning_ev0FrameDenoiseBoost,
              v64 != LODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearThreshold)))
        {
          float v72 = sub_262FCDA18(*(void *)(*(void *)(v89[2] + 8) + *v71), v16);
        }
        float v73 = v72
            * powf(*(&v82->meta.exposureParams.exposure_time+ 56056 * SLODWORD(a5[4].colorSpaceConversionParameters[2].transferFunctionFwd.linearScale))/ v66->meta.exposureParams.exposure_time, 0.25);
        v74 = (float *)((char *)self + v65);
        *(v74 - 9) = v73;
        uint64_t v75 = (float *)((char *)self + 4 * v64);
        v75[360] = v73;
        float *v74 = *(float *)&v66[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].BG.highlights;
        v75[369] = *(float *)&v66[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].BG.highlights;
        ++v64;
        v66 = (const frameProperties_t *)((char *)v66 + 224224);
        v65 += 4;
      }
      while (v64 < SLODWORD(a5[4].colorSpaceConversionParameters[1].finalScaleFwd));
    }

    arrayOfinputParams = v84;
    uint64_t v14 = v85 + 1;
    self = (FusionRemixStage *)((char *)self + 3040);
  }
  while (v85 != 3);
  int v77 = 0;
LABEL_37:

  return v77;
}

- (int)detectFlicker:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 height:(int *)a7
{
  v12 = a3;
  uint64_t v13 = (id *)a4;
  v17 = objc_msgSend_commandQueue(self->_metal, v14, v15, v16);
  float v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

  if (v21
    && (objc_msgSend_computeCommandEncoder(v21, v22, v23, v24),
        (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v28 = v25;
    objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_detectFlicker, v27);
    long long v63 = v12;
    uint64_t v29 = (void *)v12[45];
    id v30 = v13[45];
    id v31 = v29;
    objc_msgSend_setTexture_atIndex_(v28, v32, (uint64_t)v31, 0);
    objc_msgSend_setTexture_atIndex_(v28, v33, (uint64_t)v30, 1);
    objc_msgSend_setBytes_length_atIndex_(v28, v34, (uint64_t)&a5[1].meta.exposureParams.conversion_gain, 48, 0);
    objc_msgSend_setBytes_length_atIndex_(v28, v35, (uint64_t)&a6[1].meta.exposureParams.conversion_gain, 48, 1);
    float v69 = sub_262F98A00((uint64_t)&a5->meta.exposureParams, (uint64_t)&a6->meta.exposureParams, (uint64_t)a5);
    objc_msgSend_setBytes_length_atIndex_(v28, v36, (uint64_t)&v69, 4, 2);
    *a7 = objc_msgSend_height(v31, v37, v38, v39);
    unsigned int v43 = objc_msgSend_width(v31, v40, v41, v42);
    unsigned int v47 = objc_msgSend_height(v31, v44, v45, v46);
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = __PAIR64__(v47, v43);
    long long v68 = v48;
    objc_msgSend_setBytes_length_atIndex_(v28, v49, (uint64_t)&v68, 16, 3);
    objc_msgSend_setBuffer_offset_atIndex_(v28, v50, (uint64_t)self->_flickerCountBuffer, 0, 4);
    uint64_t v65 = 1;
    uint64_t v66 = objc_msgSend_height(v31, v51, v52, v53);
    int64x2_t v67 = vdupq_n_s64(1uLL);
    long long v64 = xmmword_263017A10;
    v12 = v63;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v54, (uint64_t)&v66, (uint64_t)&v64);
    objc_msgSend_endEncoding(v28, v55, v56, v57);
    objc_msgSend_commit(v21, v58, v59, v60);

    int v61 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v61 = FigSignalErrorAt();
  }

  return v61;
}

- (int)computeGrayGhostCount:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 atBand:(int)a7 nrfPlist:(id)a8 size:(int *)a9
{
  uint64_t v15 = a3;
  uint64_t v16 = (id *)a4;
  v17 = a8;
  float v21 = objc_msgSend_commandQueue(self->_metal, v18, v19, v20);
  uint64_t v25 = objc_msgSend_commandBuffer(v21, v22, v23, v24);

  if (v25
    && (objc_msgSend_computeCommandEncoder(v25, v26, v27, v28),
        (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v32 = v29;
    objc_msgSend_setComputePipelineState_(v29, v30, (uint64_t)self->_computeGrayGhostCount, v31);
    if (!a5->meta.isEVMFrame || a6->meta.isEVMFrame)
    {
      FigDebugAssert3();
      int v90 = FigSignalErrorAt();
    }
    else
    {
      int v92 = v25;
      float v33 = v17;
      float v34 = (void *)v15[a7 + 42];
      v93 = v15;
      id v94 = v16;
      v35 = (void *)v15[a7 + 62];
      id v36 = v16[a7 + 42];
      id v37 = v94[a7 + 62];
      id v38 = v36;
      id v39 = v35;
      id v40 = v34;
      objc_msgSend_setTexture_atIndex_(v32, v41, (uint64_t)v40, 0);
      objc_msgSend_setTexture_atIndex_(v32, v42, (uint64_t)v39, 1);
      objc_msgSend_setTexture_atIndex_(v32, v43, (uint64_t)v38, 2);
      objc_msgSend_setTexture_atIndex_(v32, v44, (uint64_t)v37, 3);
      objc_msgSend_setBytes_length_atIndex_(v32, v45, (uint64_t)&a5[1].meta.exposureParams.conversion_gain, 48, 0);
      objc_msgSend_setBytes_length_atIndex_(v32, v46, (uint64_t)&a6[1].meta.exposureParams.conversion_gain, 48, 1);
      float v101 = sub_262F98A00((uint64_t)&a5->meta.exposureParams, (uint64_t)&a6->meta.exposureParams, (uint64_t)a5);
      objc_msgSend_setBytes_length_atIndex_(v32, v47, (uint64_t)&v101, 4, 2);
      long long v48 = (_DWORD *)v33[3];
      LODWORD(v49) = v48[9];
      HIDWORD(v49) = v48[8];
      int v100 = v48[10];
      uint64_t v99 = v49;
      objc_msgSend_setBytes_length_atIndex_(v32, v50, (uint64_t)&v99, 16, 3);
      uint64_t v54 = objc_msgSend_width(v37, v51, v52, v53);
      uint64_t v58 = objc_msgSend_width(v37, v55, v56, v57);
      uint64_t v62 = objc_msgSend_height(v37, v59, v60, v61);
      uint64_t v66 = objc_msgSend_height(v37, v63, v64, v65);
      v67.i64[0] = v62;
      v17 = v33;
      uint64_t v25 = v92;
      v67.i64[1] = v66;
      v68.i64[0] = v54;
      v68.i64[1] = v58;
      uint32x4_t v98 = vcvtq_u32_f32(vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v68)), vcvtq_f64_u64(v67)), (float32x4_t)xmmword_263117D60));
      objc_msgSend_setBytes_length_atIndex_(v32, v69, (uint64_t)&v98, 16, 4);
      objc_msgSend_setBuffer_offset_atIndex_(v32, v70, (uint64_t)self->_grayGhostCountBuffer, 0, 5);
      v97[0] = (unint64_t)(objc_msgSend_width(v37, v71, v72, v73) + 7) >> 3;
      v97[1] = (unint64_t)(objc_msgSend_height(v37, v74, v75, v76) + 7) >> 3;
      v97[2] = 1;
      int64x2_t v95 = vdupq_n_s64(8uLL);
      uint64_t v96 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v32, v77, (uint64_t)v97, (uint64_t)&v95);
      objc_msgSend_endEncoding(v32, v78, v79, v80);
      objc_msgSend_commit(v92, v81, v82, v83);
      LODWORD(v54) = objc_msgSend_width(v38, v84, v85, v86);
      *a9 = objc_msgSend_height(v38, v87, v88, v89) * v54;

      uint64_t v15 = v93;
      uint64_t v16 = v94;

      int v90 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v90 = FigSignalErrorAt();
  }

  return v90;
}

- (int)runFusionForBandIndex:(int)a3 config:(const FusionConfiguration *)a4 oldFusedUpTex:(id)a5 oldFusedTex:(id)a6 fusedUpTex:(id)a7 fusedTex:(id)a8 accWeightTex:(id)a9 bandFusionParams:(const FusionRemixStageUniformsIBP *)a10 fragmentBufferIndex:(int)a11 processLuma:(BOOL)a12 processTopBand:(BOOL)a13 computeSpecialMap:(int)a14 inputs:(id)a15 simMapTex:(id)a16 confidence:(id)a17 noiseMap:(id)a18 batchN:(int)a19 isFirstBatch:(BOOL)a20 isLastBatch:(BOOL)a21 usePatchBasedFusion:(BOOL)a22 minVarWeightSum:(float)a23 outputChromaBias:(float)a24 ggMaxFusionWeights:(id)a25
{
  uint64_t v319 = *(void *)&a3;
  id v311 = a5;
  id v320 = a6;
  id v312 = a7;
  id v321 = a8;
  id v32 = a9;
  float v33 = (char *)a15;
  id v315 = a16;
  v314 = a17;
  id v34 = a18;
  v327[0] = a23;
  id v35 = a25;
  id v326 = 0;
  v322 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v36, v37, v38);
  if (!v322)
  {
    FigDebugAssert3();
    int v301 = FigSignalErrorAt();
    v241 = 0;
    uint64_t v53 = 0;
    v313 = 0;
    v318 = 0;
    a4 = 0;
    v270 = v311;
    goto LABEL_129;
  }
  uint64_t v42 = v320;
  if (a11 >= 10)
  {
    FigDebugAssert3();
    int v301 = FigSignalErrorAt();
    v241 = 0;
    uint64_t v53 = 0;
    v313 = 0;
    v318 = 0;
    a4 = 0;
    v270 = v311;
    goto LABEL_111;
  }
  uint64_t v316 = (uint64_t)v34;
  unsigned int v43 = v33;
  id v44 = v35;
  if (v319 >= 4)
  {
    FigDebugAssert3();
    int v303 = FigSignalErrorAt();
    v241 = 0;
    uint64_t v53 = 0;
LABEL_119:
    v313 = 0;
    v318 = 0;
    a4 = 0;
LABEL_121:
    v270 = v311;
    id v35 = v44;
    float v33 = (char *)v43;
    id v34 = (id)v316;
LABEL_123:
    uint64_t v42 = v320;
    int v301 = v303;
    goto LABEL_111;
  }
  uint64_t v48 = objc_msgSend_pixelFormat(v321, v39, v40, v41) == 25 || objc_msgSend_pixelFormat(v321, v45, v46, v47) == 65;
  uint64_t v49 = objc_msgSend_sharedInstance(FusionRemixStageShared, v45, v46, v47);
  uint64_t v51 = objc_msgSend_getShaders_fp16_(v49, v50, (uint64_t)self->_metal, v48);

  uint64_t v53 = (void *)v51;
  if (!v51)
  {
    FigDebugAssert3();
    int v303 = FigSignalErrorAt();
    v241 = 0;
    goto LABEL_119;
  }
  if (v319) {
    BOOL v54 = 0;
  }
  else {
    BOOL v54 = a12 && a22;
  }
  if (!a4)
  {
    FigDebugAssert3();
    int v303 = FigSignalErrorAt();
    v241 = 0;
    v313 = 0;
    v318 = 0;
    goto LABEL_121;
  }
  v307 = v32;
  v317 = v44;
  if ((v319 == 0) == v54 || !HIBYTE(a4[1].colorSpaceConversionParameters[2].finalScaleFwd))
  {
    BOOL v60 = 0;
LABEL_23:
    float v33 = (char *)v43;
    goto LABEL_24;
  }
  uint64_t finalScaleFwd_low = LODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd);
  if ((int)finalScaleFwd_low < 1)
  {
    BOOL v60 = 1;
    goto LABEL_23;
  }
  float v33 = (char *)v43;
  uint64_t v56 = v43 + 1;
  uint64_t v57 = finalScaleFwd_low - 1;
  do
  {
    uint64_t v58 = *v56++;
    uint64_t v59 = *(void *)(v58 + 656);
    BOOL v60 = v59 != 0;
    BOOL v62 = v57-- != 0;
  }
  while (v59 && v62);
LABEL_24:
  if (v319) {
    BOOL v63 = 1;
  }
  else {
    BOOL v63 = v317 == 0;
  }
  int v64 = !v63;
  int v305 = v64;
  HIBYTE(v304) = v64;
  LOBYTE(v304) = v60;
  objc_msgSend_getFragmentShader_bandIndex_isLuma_isFirstBatch_isLastBatch_usePatchBasedFusion_useGpuCSC_ggmEnabled_(FusionRemixStage, v52, v51, v319, v304);
  v313 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v318 = self->_uniforms[a11];
  if (!v321)
  {
    FigDebugAssert3();
    int v303 = FigSignalErrorAt();
    v241 = 0;
    a4 = 0;
    v270 = v311;
    id v32 = v307;
    id v34 = (id)v316;
    id v35 = v317;
    goto LABEL_123;
  }
  v306 = (uint64_t *)v51;
  v308 = v33;
  uint64x2_t v68 = objc_msgSend_colorAttachments(v322, v65, v66, v67);
  v71 = objc_msgSend_objectAtIndexedSubscript_(v68, v69, 0, v70);
  objc_msgSend_setTexture_(v71, v72, (uint64_t)v321, v73);

  if (v319) {
    BOOL v77 = !a20;
  }
  else {
    BOOL v77 = 1;
  }
  BOOL v78 = objc_msgSend_colorAttachments(v322, v74, v75, v76);
  uint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v78, v79, 0, v80);
  objc_msgSend_setLoadAction_(v81, v82, v77, v83);

  uint64_t v87 = objc_msgSend_colorAttachments(v322, v84, v85, v86);
  int v90 = objc_msgSend_objectAtIndexedSubscript_(v87, v88, 0, v89);
  objc_msgSend_setStoreAction_(v90, v91, 1, v92);

  id v34 = (id)v316;
  if (v319)
  {
    if (!a20) {
      goto LABEL_41;
    }
  }
  else
  {
    if (!v316)
    {
      FigDebugAssert3();
      int v301 = FigSignalErrorAt();
      v241 = 0;
      a4 = 0;
      v270 = v311;
      id v32 = v307;
      float v33 = v308;
      uint64_t v53 = (void *)v51;
      goto LABEL_134;
    }
    uint64_t v96 = objc_msgSend_colorAttachments(v322, v93, v94, v95);
    uint64_t v99 = objc_msgSend_objectAtIndexedSubscript_(v96, v97, 1, v98);
    objc_msgSend_setTexture_(v99, v100, v316, v101);

    v105 = objc_msgSend_colorAttachments(v322, v102, v103, v104);
    v108 = objc_msgSend_objectAtIndexedSubscript_(v105, v106, 1, v107);
    objc_msgSend_setLoadAction_(v108, v109, !a20, v110);

    v114 = objc_msgSend_colorAttachments(v322, v111, v112, v113);
    v117 = objc_msgSend_objectAtIndexedSubscript_(v114, v115, 1, v116);
    objc_msgSend_setStoreAction_(v117, v118, 1, v119);

    if (!a20) {
      goto LABEL_41;
    }
  }
  if (!a21)
  {
LABEL_41:
    v120 = objc_msgSend_allocator(self->_metal, v93, v94, v95);
    v124 = objc_msgSend_newTextureDescriptor(v120, v121, v122, v123);

    if (v124)
    {
      uint64_t v128 = objc_msgSend_width(v321, v125, v126, v127);
      v132 = objc_msgSend_desc(v124, v129, v130, v131);
      objc_msgSend_setWidth_(v132, v133, v128, v134);

      uint64_t v138 = objc_msgSend_height(v321, v135, v136, v137);
      v142 = objc_msgSend_desc(v124, v139, v140, v141);
      objc_msgSend_setHeight_(v142, v143, v138, v144);

      v148 = objc_msgSend_desc(v124, v145, v146, v147);
      objc_msgSend_setUsage_(v148, v149, 7, v150);

      if (a12) {
        uint64_t v154 = 25;
      }
      else {
        uint64_t v154 = 65;
      }
      v155 = objc_msgSend_desc(v124, v151, v152, v153);
      objc_msgSend_setPixelFormat_(v155, v156, v154, v157);

      objc_msgSend_setLabel_(v124, v158, 0, v159);
      v163 = objc_msgSend_allocator(self->_metal, v160, v161, v162);
      v166 = objc_msgSend_newTextureWithDescriptor_(v163, v164, (uint64_t)v124, v165);
      id v326 = v166;

      if (v166)
      {
        v170 = objc_msgSend_colorAttachments(v322, v167, v168, v169);
        v173 = objc_msgSend_objectAtIndexedSubscript_(v170, v171, 2, v172);
        uint64_t v309 = (uint64_t)v166;
        objc_msgSend_setTexture_(v173, v174, (uint64_t)v166, v175);

        v179 = objc_msgSend_colorAttachments(v322, v176, v177, v178);
        v182 = objc_msgSend_objectAtIndexedSubscript_(v179, v180, 2, v181);
        objc_msgSend_setLoadAction_(v182, v183, 0, v184);

        v188 = objc_msgSend_colorAttachments(v322, v185, v186, v187);
        v191 = objc_msgSend_objectAtIndexedSubscript_(v188, v189, 2, v190);
        objc_msgSend_setStoreAction_(v191, v192, !a21, v193);

        id v34 = (id)v316;
        goto LABEL_47;
      }
      FigDebugAssert3();
      id v34 = (id)v316;
    }
    else
    {
      FigDebugAssert3();
    }
    id v35 = v317;
    int v301 = FigSignalErrorAt();

    v241 = 0;
    a4 = 0;
    v270 = v311;
    id v32 = v307;
    float v33 = v308;
    uint64_t v53 = v306;
LABEL_129:
    uint64_t v42 = v320;
    goto LABEL_111;
  }
  uint64_t v309 = 0;
LABEL_47:
  float v33 = v308;
  uint64_t v42 = v320;
  if (v319 && !a20)
  {
    if (!v320)
    {
      FigDebugAssert3();
      int v301 = FigSignalErrorAt();
      v241 = 0;
      a4 = 0;
      v270 = v311;
      uint64_t v53 = (void *)v51;
      id v32 = v307;
      goto LABEL_135;
    }
    v194 = objc_msgSend_colorAttachments(v322, v93, v94, v95);
    v197 = objc_msgSend_objectAtIndexedSubscript_(v194, v195, 3, v196);
    objc_msgSend_setTexture_(v197, v198, (uint64_t)v320, v199);

    v203 = objc_msgSend_colorAttachments(v322, v200, v201, v202);
    v206 = objc_msgSend_objectAtIndexedSubscript_(v203, v204, 3, v205);
    objc_msgSend_setLoadAction_(v206, v207, 0, v208);

    v212 = objc_msgSend_colorAttachments(v322, v209, v210, v211);
    v215 = objc_msgSend_objectAtIndexedSubscript_(v212, v213, 3, v214);
    objc_msgSend_setStoreAction_(v215, v216, 1, v217);
  }
  memcpy(v318->_ptr2FragBufSBP, a10, 0x5F0uLL);
  *(float *)&self->_anon_3138[1032] = (float)(unint64_t)objc_msgSend_width(v321, v218, v219, v220);
  *(float *)&self->_anon_3138[1036] = (float)(unint64_t)objc_msgSend_height(v321, v221, v222, v223);
  *(_DWORD *)&self->_anon_3138[1040] = v319;
  memcpy(v318->_ptr2VertBufSBP, &self->_vertexUniforms, 0x550uLL);
  ptr2FragBufInt = v318->_ptr2FragBufInt;
  ptr2FragBufInt->var0 = v319;
  ptr2FragBufInt->var1 = a14;
  ptr2FragBufInt->var2 = a24;
  if (v319) {
    BOOL v228 = BYTE2(a4[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias) == 0;
  }
  else {
    BOOL v228 = 1;
  }
  float v229 = 0.0;
  if (v228) {
    float v230 = 0.5;
  }
  else {
    float v230 = 0.0;
  }
  if (!BYTE2(a4[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias)) {
    float v229 = 0.5;
  }
  ptr2FragBufInt->var3 = v230;
  ptr2FragBufInt->var4 = v229;
  ptr2FragBufInt->var5 = BYTE2(a4[4].colorSpaceConversionParameters[2].transferFunctionInv.linearScale);
  v231 = objc_msgSend_commandQueue(self->_metal, v224, v225, v226);
  objc_msgSend_commandBuffer(v231, v232, v233, v234);
  v235 = (FusionConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v235)
  {
    FigDebugAssert3();
    v241 = 0;
    a4 = 0;
    v270 = v311;
    uint64_t v53 = v306;
    id v32 = v307;
    int v301 = FigSignalErrorAt();
LABEL_134:
    uint64_t v42 = v320;
    goto LABEL_135;
  }
  v310 = v235;
  v241 = objc_msgSend_renderCommandEncoderWithDescriptor_(v235, v236, (uint64_t)v322, v237);
  id v35 = v317;
  if (!v241)
  {
    FigDebugAssert3();
    v270 = v311;
    uint64_t v53 = v306;
    id v32 = v307;
    int v301 = FigSignalErrorAt();
LABEL_113:
    uint64_t v42 = v320;
    goto LABEL_114;
  }
  v242 = objc_msgSend_fullRangeVertexBuf(self->_metal, v238, v239, v240);
  objc_msgSend_setVertexBuffer_offset_atIndex_(v241, v243, (uint64_t)v242, 0, 0);

  objc_msgSend_setVertexBuffer_offset_atIndex_(v241, v244, (uint64_t)v318->_vertexUniBufSBP, 0, 1);
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend_setFragmentTexture_atIndex_(v241, v245, (uint64_t)self->_placeHolderTex, i);
  float finalScaleFwd = a4[4].colorSpaceConversionParameters[1].finalScaleFwd;
  int v248 = 4 - LODWORD(finalScaleFwd);
  *(float *)&uint64_t v249 = finalScaleFwd;
  if (v60)
  {
    unsigned int v250 = 4 - LODWORD(finalScaleFwd);
    int v251 = v319;
    uint64_t v42 = v320;
    if (SLODWORD(finalScaleFwd) >= 1)
    {
      uint64_t v252 = 0;
      do
      {
        uint64_t v253 = *(void *)(*(void *)&v308[8 * v252 + 8] + 656);
        if (!v253)
        {
          FigDebugAssert3();
          int v301 = FigSignalErrorAt();
          v270 = v311;
          uint64_t v53 = v306;
          id v32 = v307;
          id v35 = v317;
          goto LABEL_113;
        }
        uint64_t v254 = v252 + 1;
        objc_msgSend_setFragmentTexture_atIndex_(v241, v245, v253, v252);
        uint64_t v249 = SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd);
        uint64_t v252 = v254;
      }
      while (v254 < v249);
      unsigned int v250 = v254 + v248;
      if ((int)v249 <= 0)
      {
        id v35 = v317;
        uint64_t v42 = v320;
      }
      else
      {
        int v255 = 0;
        uint64_t v42 = v320;
        do
        {
          uint64_t v256 = v250++;
          objc_msgSend_setFragmentTexture_atIndex_(v241, v245, 0, v256);
          ++v255;
          *(float *)&uint64_t v249 = a4[4].colorSpaceConversionParameters[1].finalScaleFwd;
        }
        while (v255 < (int)v249);
        id v35 = v317;
      }
    }
  }
  else
  {
    unsigned int v250 = 4 - LODWORD(finalScaleFwd);
    int v251 = v319;
    uint64_t v42 = v320;
    if (SLODWORD(finalScaleFwd) >= 1)
    {
      uint64_t v257 = 0;
      v258 = v308 + 8;
      do
      {
        uint64_t v259 = v257;
        uint64_t v260 = *(void *)(*(void *)&v258[8 * v257++] + 336 + 8 * (int)v319);
        objc_msgSend_setFragmentTexture_atIndex_(v241, v245, v260, v259);
        uint64_t v249 = SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd);
      }
      while (v257 < v249);
      if ((int)v249 <= 0)
      {
        unsigned int v250 = v257 + v248;
        uint64_t v42 = v320;
      }
      else
      {
        for (uint64_t j = 0; j < v249; ++j)
        {
          objc_msgSend_setFragmentTexture_atIndex_(v241, v245, *(void *)(*(void *)&v258[8 * j] + 496 + 8 * (int)v319), (v257 + v248 + j));
          uint64_t v249 = SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd);
        }
        unsigned int v250 = v248 + v257 + j;
        uint64_t v42 = v320;
        float v33 = v308;
      }
      id v34 = (id)v316;
      id v35 = v317;
      int v251 = v319;
    }
  }
  if (!a13)
  {
    if ((int)v249 >= 1)
    {
      uint64_t v262 = 0;
      unsigned int v263 = v250 + v248;
      v264 = v33 + 8;
      uint64_t v265 = (int)v319 + 1;
      do
      {
        objc_msgSend_setFragmentTexture_atIndex_(v241, v245, *(void *)(*(void *)&v264[8 * v262] + 336 + 8 * v265), v263 + v262);
        ++v262;
        uint64_t v266 = SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd);
      }
      while (v262 < v266);
      if ((int)v266 >= 1)
      {
        uint64_t v267 = 0;
        int v268 = v250 - 2 * LODWORD(finalScaleFwd) + 8 + v262;
        do
        {
          objc_msgSend_setFragmentTexture_atIndex_(v241, v245, *(void *)(*(void *)&v264[8 * v267] + 496 + 8 * v265), (v268 + v267));
          ++v267;
        }
        while (v267 < SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd));
      }
    }
    if (v312)
    {
      objc_msgSend_setFragmentTexture_atIndex_(v241, v245, (uint64_t)v312, 16);
      int v251 = v319;
      uint64_t v42 = v320;
      id v34 = (id)v316;
      id v35 = v317;
      goto LABEL_92;
    }
    FigDebugAssert3();
    int v301 = FigSignalErrorAt();
    a4 = v310;
    v270 = v311;
    uint64_t v42 = v320;
    uint64_t v53 = v306;
    id v32 = v307;
    id v34 = (id)v316;
LABEL_135:
    id v35 = v317;
    goto LABEL_111;
  }
LABEL_92:
  objc_msgSend_setFragmentTexture_atIndex_(v241, v245, (uint64_t)v315, 17);
  if (v314) {
    objc_msgSend_setFragmentTexture_atIndex_(v241, v269, v314[v251 + 42], 18);
  }
  v270 = v311;
  id v32 = v307;
  if (a12 && !a13) {
    objc_msgSend_setFragmentBytes_length_atIndex_(v241, v269, (uint64_t)v327, 4, 2);
  }
  uint64_t v53 = v306;
  if (v311) {
    objc_msgSend_setFragmentTexture_atIndex_(v241, v269, (uint64_t)v311, 19);
  }
  BOOL v271 = a20;
  if (!v307) {
    BOOL v271 = 1;
  }
  if (!v271) {
    objc_msgSend_setFragmentTexture_atIndex_(v241, v269, (uint64_t)v307, 20);
  }
  if (v305) {
    objc_msgSend_setFragmentTexture_atIndex_(v241, v269, (uint64_t)v35, 31);
  }
  objc_msgSend_setFragmentBuffer_offset_atIndex_(v241, v269, (uint64_t)v318->_fragUniBufSBP, 0, 0);
  objc_msgSend_setFragmentBuffer_offset_atIndex_(v241, v272, (uint64_t)v318->_fragUniBufInt, 0, 1);
  objc_msgSend_setRenderPipelineState_(v241, v273, v313[1], v274);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v241, v275, 4, 0, 4);
  objc_msgSend_endEncoding(v241, v276, v277, v278);
  if (!v307 || a21 || !v309) {
    goto LABEL_110;
  }
  v282 = objc_msgSend_computeCommandEncoder(v310, v279, v280, v281);
  if (!v282)
  {
    FigDebugAssert3();
    int v301 = FigSignalErrorAt();
LABEL_114:
    a4 = v310;
    goto LABEL_111;
  }
  v285 = v282;
  objc_msgSend_setComputePipelineState_(v282, v283, v306[257], v284);
  objc_msgSend_setTexture_atIndex_(v285, v286, v309, 0);
  objc_msgSend_setTexture_atIndex_(v285, v287, (uint64_t)v307, 1);
  v325[0] = objc_msgSend_width(v307, v288, v289, v290);
  v325[1] = objc_msgSend_height(v307, v291, v292, v293);
  v270 = v311;
  v325[2] = 1;
  int64x2_t v323 = vdupq_n_s64(0x10uLL);
  uint64_t v324 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v285, v294, (uint64_t)v325, (uint64_t)&v323);
  objc_msgSend_endEncoding(v285, v295, v296, v297);

LABEL_110:
  FigMetalDecRef();
  a4 = v310;
  objc_msgSend_commit(v310, v298, v299, v300);
  int v301 = 0;
LABEL_111:

  return v301;
}

- (int)runStationaryFusionWithParams:(const FusionRemixStageUniformsIBP *)a3 inputs:(id)a4 fusedLumaTex:(id)a5 fusedChromaTex:(id)a6 noiseMapLumaTex:(id)a7 noiseMapChromaTex:(id)a8 accWeightLumaTex:(id)a9 accWeightChromaTex:(id)a10 inferenceLumaTex:(id)a11 inferenceChromaTex:(id)a12 batchN:(int)a13
{
  v241 = (char *)a4;
  id v19 = a5;
  id v20 = a6;
  id v235 = a7;
  id v234 = a8;
  id v21 = a9;
  id v22 = a10;
  id v233 = a11;
  id v242 = a12;
  id v252 = 0;
  id v253 = 0;
  int v26 = objc_msgSend_allocator(self->_metal, v23, v24, v25);
  id v30 = objc_msgSend_newTextureDescriptor(v26, v27, v28, v29);

  if (!v30) {
    goto LABEL_28;
  }
  id v34 = objc_msgSend_desc(v30, v31, v32, v33);
  objc_msgSend_setUsage_(v34, v35, 7, v36);

  uint64_t v40 = objc_msgSend_width(v19, v37, v38, v39);
  id v44 = objc_msgSend_desc(v30, v41, v42, v43);
  objc_msgSend_setWidth_(v44, v45, v40, v46);

  uint64_t v50 = objc_msgSend_height(v19, v47, v48, v49);
  BOOL v54 = objc_msgSend_desc(v30, v51, v52, v53);
  objc_msgSend_setHeight_(v54, v55, v50, v56);

  BOOL v60 = objc_msgSend_desc(v30, v57, v58, v59);
  objc_msgSend_setPixelFormat_(v60, v61, 25, v62);

  objc_msgSend_setLabel_(v30, v63, 0, v64);
  uint64x2_t v68 = objc_msgSend_allocator(self->_metal, v65, v66, v67);
  v71 = objc_msgSend_newTextureWithDescriptor_(v68, v69, (uint64_t)v30, v70);
  id v253 = v71;

  if (!v71)
  {
LABEL_28:
    FigDebugAssert3();
    int v229 = FigSignalErrorAt();
    goto LABEL_27;
  }
  uint64_t v75 = objc_msgSend_allocator(self->_metal, v72, v73, v74);
  BOOL v78 = objc_msgSend_newTextureDescriptor_(v75, v76, 0, v77);

  if (!v78)
  {
    FigDebugAssert3();
LABEL_31:
    uint64_t v152 = v234;
    uint64_t v150 = v235;
    v216 = v233;
    int v229 = FigSignalErrorAt();

    goto LABEL_25;
  }
  uint64_t v240 = (uint64_t)v19;
  uint64_t v82 = objc_msgSend_desc(v78, v79, v80, v81);
  objc_msgSend_setUsage_(v82, v83, 7, v84);

  uint64_t v88 = objc_msgSend_width(v20, v85, v86, v87);
  uint64_t v92 = objc_msgSend_desc(v78, v89, v90, v91);
  objc_msgSend_setWidth_(v92, v93, v88, v94);

  uint64_t v98 = objc_msgSend_height(v20, v95, v96, v97);
  v102 = objc_msgSend_desc(v78, v99, v100, v101);
  objc_msgSend_setHeight_(v102, v103, v98, v104);

  v108 = objc_msgSend_desc(v78, v105, v106, v107);
  objc_msgSend_setPixelFormat_(v108, v109, 65, v110);

  objc_msgSend_setLabel_(v78, v111, 0, v112);
  uint64_t v116 = objc_msgSend_allocator(self->_metal, v113, v114, v115);
  v118 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v116, v117, (uint64_t)v78, 0);
  id v252 = v118;

  if (!v118)
  {
    FigDebugAssert3();
    id v19 = (id)v240;
    goto LABEL_31;
  }

  id v19 = (id)v240;
  if (!BYTE2(a3[2].blurryFrameWeight[1]))
  {
LABEL_26:
    FigDebugAssert3();
    int v229 = -12782;
LABEL_27:
    uint64_t v152 = v234;
    uint64_t v150 = v235;
    v216 = v233;
    goto LABEL_25;
  }
  uint64_t v122 = LODWORD(a3[2].exposureEffectiveTime[0]);
  if ((int)v122 >= 1)
  {
    p_fusionBoostMatchedTexture = &a3->patchBasedFusionParameters.fusionBoostMatchedTexture;
    p_nonLinearPower = &a3[3].config.colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower;
    do
    {
      int v126 = *(unsigned __int8 *)p_fusionBoostMatchedTexture;
      p_fusionBoostMatchedTexture += 52;
      if (!v126) {
        goto LABEL_26;
      }
      float v123 = *(&a3[3].config.colorSpaceConversionParameters[0].transferFunctionInv.nonLinearPower
             + SLODWORD(a3[2].blurryFrameWeight[0]));
      if ((float)(vabds_f32(*p_nonLinearPower, v123) / v123) >= 0.05) {
        goto LABEL_26;
      }
      ++p_nonLinearPower;
    }
    while (--v122);
  }
  uint64_t v127 = objc_msgSend_sharedInstance(FusionRemixStageShared, v119, v120, v121);
  v129 = objc_msgSend_getShaders_fp16_(v127, v128, (uint64_t)self->_metal, 1);

  if (!v129)
  {
    FigDebugAssert3();
    int v229 = FigSignalErrorAt();
LABEL_35:
    id v19 = (id)v240;
    goto LABEL_27;
  }
  uint64_t v236 = (uint64_t)v71;
  v133 = objc_msgSend_commandQueue(self->_metal, v130, v131, v132);
  uint64_t v137 = objc_msgSend_commandBuffer(v133, v134, v135, v136);

  if (!v137)
  {
    FigDebugAssert3();
    int v229 = FigSignalErrorAt();

    goto LABEL_35;
  }
  uint64_t v239 = (uint64_t *)v129;
  v232 = v30;
  uint64_t v141 = (uint64_t)v21;
  v231 = v137;
  v143 = objc_msgSend_computeCommandEncoder(v137, v138, v139, v140);
  unint64_t v144 = 0;
  p_placeHolderTex = (uint64_t *)&self->_placeHolderTex;
  uint64_t v146 = v241 + 8;
  do
  {
    if (v144 >= SLODWORD(a3[2].exposureEffectiveTime[0]))
    {
      objc_msgSend_setTexture_atIndex_(v143, v142, *p_placeHolderTex, v144);
      v148 = p_placeHolderTex;
    }
    else
    {
      objc_msgSend_setTexture_atIndex_(v143, v142, *(void *)(*(void *)&v146[8 * v144] + 336), v144);
      v148 = (uint64_t *)(*(void *)&v146[8 * v144] + 496);
    }
    objc_msgSend_setTexture_atIndex_(v143, v147, *v148, v144 + 4);
    ++v144;
  }
  while (v144 != 4);
  id v19 = (id)v240;
  objc_msgSend_setTexture_atIndex_(v143, v142, v240, 21);
  objc_msgSend_setTexture_atIndex_(v143, v149, (uint64_t)v20, 22);
  uint64_t v150 = v235;
  objc_msgSend_setTexture_atIndex_(v143, v151, (uint64_t)v235, 23);
  uint64_t v152 = v234;
  objc_msgSend_setTexture_atIndex_(v143, v153, (uint64_t)v234, 24);
  objc_msgSend_setTexture_atIndex_(v143, v154, v236, 25);
  id v21 = (id)v141;
  objc_msgSend_setTexture_atIndex_(v143, v155, v141, 26);
  objc_msgSend_setTexture_atIndex_(v143, v156, (uint64_t)v118, 27);
  objc_msgSend_setTexture_atIndex_(v143, v157, (uint64_t)v22, 28);
  objc_msgSend_setBytes_length_atIndex_(v143, v158, (uint64_t)a3, 1520, 0);
  objc_msgSend_setImageblockWidth_height_(v143, v159, 32, 32);
  uint64_t v162 = v239;
  if (a13)
  {
    objc_msgSend_setComputePipelineState_(v143, v160, v239[262], v161);
    v247[0] = objc_msgSend_width(v118, v163, v164, v165);
    v247[1] = objc_msgSend_height(v118, v166, v167, v168);
    v247[2] = 1;
    int64x2_t v237 = vdupq_n_s64(0x10uLL);
    int64x2_t v249 = v237;
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v169, (uint64_t)v247, (uint64_t)&v249);
    objc_msgSend_setComputePipelineState_(v143, v170, v239[263], v171);
    v246[0] = objc_msgSend_width(v22, v172, v173, v174);
    v246[1] = objc_msgSend_height(v22, v175, v176, v177);
    v246[2] = 1;
    int64x2_t v249 = v237;
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v178, (uint64_t)v246, (uint64_t)&v249);
    objc_msgSend_setComputePipelineState_(v143, v179, v239[259], v180);
    v245[0] = objc_msgSend_width(v20, v181, v182, v183);
    v245[1] = objc_msgSend_height(v20, v184, v185, v186);
    v245[2] = 1;
    int64x2_t v249 = v237;
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v187, (uint64_t)v245, (uint64_t)&v249);
    objc_msgSend_setComputePipelineState_(v143, v188, v239[261], v189);
    v244[0] = objc_msgSend_width(v21, v190, v191, v192);
    v244[1] = objc_msgSend_height(v21, v193, v194, v195);
    v244[2] = 1;
    int64x2_t v249 = v237;
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v196, (uint64_t)v244, (uint64_t)&v249);
  }
  else
  {
    objc_msgSend_setComputePipelineState_(v143, v160, v239[258], v161);
    v251[0] = objc_msgSend_width(v20, v200, v201, v202);
    v251[1] = objc_msgSend_height(v20, v203, v204, v205);
    v251[2] = 1;
    int64x2_t v238 = vdupq_n_s64(0x10uLL);
    int64x2_t v249 = v238;
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v206, (uint64_t)v251, (uint64_t)&v249);
    objc_msgSend_setComputePipelineState_(v143, v207, v239[260], v208);
    v248[0] = objc_msgSend_width(v21, v209, v210, v211);
    v248[1] = objc_msgSend_height(v21, v212, v213, v214);
    v248[2] = 1;
    int64x2_t v249 = v238;
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v215, (uint64_t)v248, (uint64_t)&v249);
  }
  v216 = v233;
  if (v233 && v242)
  {
    objc_msgSend_setComputePipelineState_(v143, v197, v239[264], v199);
    objc_msgSend_setTexture_atIndex_(v143, v217, (uint64_t)v233, 29);
    objc_msgSend_setTexture_atIndex_(v143, v218, (uint64_t)v242, 30);
    uint64_t v162 = v239;
    v243[0] = objc_msgSend_width(v242, v219, v220, v221);
    v243[1] = objc_msgSend_height(v242, v222, v223, v224);
    v243[2] = 1;
    int64x2_t v249 = vdupq_n_s64(0x10uLL);
    uint64_t v250 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v143, v225, (uint64_t)v243, (uint64_t)&v249);
  }
  objc_msgSend_endEncoding(v143, v197, v198, v199);
  objc_msgSend_commit(v231, v226, v227, v228);
  FigMetalDecRef();
  FigMetalDecRef();

  int v229 = 0;
  id v30 = v232;
LABEL_25:

  return v229;
}

- (int)prepareForFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 properties:(const frameProperties_t *)a6 nrfPlist:(id)a7 staticScene:(BOOL)a8 isLowLight:(BOOL)a9
{
  uint64_t v14 = a3;
  uint64_t v15 = (int *)a5;
  id v17 = a7;
  if (!LODWORD(a4[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearPower)
    || SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd) >= 5)
  {
LABEL_14:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
    goto LABEL_10;
  }
  uint64_t v18 = v15[2];
  int isLowLight = objc_msgSend_computeFusionParams_properties_config_fusionMode_staticScene_isLowLight_(self, v16, (uint64_t)v17, (uint64_t)a6, a4);
  if (isLowLight)
  {
    int v37 = isLowLight;
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
    memcpy(&self->_vertexUniforms, a4, 0x540uLL);
    int v23 = objc_msgSend_width(*(void **)(v14[1] + 336 + 8 * (v18 - 1)), v20, v21, v22);
    int v27 = objc_msgSend_height(*(void **)(v14[1] + 336 + 8 * (v18 - 1)), v24, v25, v26);
    int v31 = objc_msgSend_width(*(void **)&v15[2 * v18 + 82], v28, v29, v30);
    int v35 = objc_msgSend_height(*(void **)&v15[2 * v18 + 82], v32, v33, v34);
    if (v23 != v31 || v27 != v35) {
      goto LABEL_14;
    }
    int v37 = 0;
  }
LABEL_10:

  return v37;
}

- (int)selectNRFFusionReferenceFrame:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 nrfPlist:(id)a7 outputFusionMode:(int *)a8 staticScene:(BOOL *)a9 motionDetection:(id)a10 grayGhostDetection:(id)a11
{
  id v17 = (uint64_t *)a3;
  uint64_t v18 = a4;
  id v19 = a7;
  id v49 = a10;
  id v20 = a11;
  int v52 = 0;
  *(_DWORD *)objc_msgSend_contents(self->_flickerCountBuffer, v21, v22, v23) = 0;
  nrfConfig = self->_nrfConfig;
  if (nrfConfig->_enableFlickerDetection)
  {
    if (objc_msgSend_detectFlicker_ev0Bands_evmProperties_ev0Properties_height_(self, v24, (uint64_t)v17, (uint64_t)v18, a5, a6, &v52))
    {
LABEL_35:
      FigDebugAssert3();
LABEL_36:
      int v47 = FigSignalErrorAt();
      uint64_t v45 = v49;
      goto LABEL_37;
    }
    uint64_t v28 = a8;
    nrfConfig = self->_nrfConfig;
  }
  else
  {
    uint64_t v28 = a8;
  }
  if (nrfConfig->_enableGrayGhostDetection)
  {
    uint64_t v29 = (_DWORD *)v19[3];
    v51[0] = v29[9];
    v51[1] = v29[8];
    v51[2] = v29[10];
    if (objc_msgSend_runGrayGhostDetection_ev0Bands_evmProperties_ev0Properties_hasChromaBias_atBand_params_(v20, v24, (uint64_t)v17, (uint64_t)v18, a5, a6, LODWORD(a6[1].meta.ROI.origin.y) != 2, 2, v51))goto LABEL_35; {
  }
    }
  objc_msgSend_waitForIdle(self->_metal, v24, v25, v26);
  if (self->_nrfConfig->_enableGrayGhostDetection)
  {
    objc_msgSend_getGrayGhostResultSync(v20, v30, v31, v32);
    float v34 = v33;
  }
  else
  {
    float v34 = 0.0;
  }
  int v35 = (unsigned int *)objc_msgSend_contents(self->_flickerCountBuffer, v30, v31, v32);
  uint64_t v37 = v19[3];
  float v38 = *(float *)(v37 + 28);
  if (v34 < v38) {
    int v39 = 1;
  }
  else {
    int v39 = 2;
  }
  if ((float)((float)*v35 / (float)v52) > 0.08 && v34 >= v38) {
    goto LABEL_36;
  }
  int v41 = *(unsigned __int8 *)(v37 + 44);
  float v50 = 0.0;
  if (v41) {
    BOOL v42 = v34 < v38;
  }
  else {
    BOOL v42 = 0;
  }
  if (v42 || self->_nrfConfig->_forceEnableMotionDetection)
  {
    float v43 = a5->meta.exposureParams.exposure_time * a5->meta.exposureParams.gain;
    if (v43 <= (float)(*(float *)(v37 + 56) / 0.98) && v43 >= (float)(*(float *)(v37 + 60) * 0.98)
      || (BOOL forceEnableMotionDetection = self->_nrfConfig->_forceEnableMotionDetection))
    {
      uint64_t v45 = v49;
      if (objc_msgSend_runMotionDetection_evm_ev0_evmProperties_ev0Properties_nrfPlist_(v49, v36, (uint64_t)&v50, v17[43], v18[43], a5, a6, v19))
      {
        FigDebugAssert3();
        int v47 = FigSignalErrorAt();
        goto LABEL_37;
      }
      uint64_t v46 = v19[3];
      if (v50 >= *(float *)(v46 + 76))
      {
        BOOL forceEnableMotionDetection = 0;
        if (v50 > *(float *)(v46 + 72)) {
          int v39 = 2;
        }
      }
      else
      {
        BOOL forceEnableMotionDetection = 1;
      }
      goto LABEL_34;
    }
  }
  else
  {
    BOOL forceEnableMotionDetection = 0;
  }
  uint64_t v45 = v49;
LABEL_34:
  int v47 = 0;
  *uint64_t v28 = v39;
  *a9 = forceEnableMotionDetection;
LABEL_37:

  return v47;
}

- (int)correctGTC:(id)a3
{
  v4 = (int *)a3;
  BOOL v8 = objc_msgSend_commandQueue(self->_metal, v5, v6, v7);
  v12 = objc_msgSend_commandBuffer(v8, v9, v10, v11);

  if (v12)
  {
    if (v4[2] < 2)
    {
LABEL_6:
      if (*MEMORY[0x263F00E10])
      {
        uint64_t v40 = objc_msgSend_commandQueue(v12, v13, v14, v15);
        id v44 = objc_msgSend_commandBuffer(v40, v41, v42, v43);

        objc_msgSend_setLabel_(v44, v45, @"KTRACE_MTLCMDBUF", v46);
        objc_msgSend_addCompletedHandler_(v44, v47, (uint64_t)&unk_270E34468, v48);
        objc_msgSend_commit(v44, v49, v50, v51);
        objc_msgSend_addCompletedHandler_(v12, v52, (uint64_t)&unk_270E34488, v53);
      }
      objc_msgSend_commit(v12, v13, v14, v15);
      int v54 = 0;
    }
    else
    {
      uint64_t v16 = 1;
      while (1)
      {
        id v17 = *(id *)&v4[2 * v16 + 84];
        id v18 = *(id *)&v4[2 * v16 + 124];
        uint64_t v22 = objc_msgSend_computeCommandEncoder(v12, v19, v20, v21);
        if (!v22) {
          break;
        }
        uint64_t v25 = v22;
        objc_msgSend_setComputePipelineState_(v22, v23, (uint64_t)self->_correctGTC, v24);
        objc_msgSend_setTexture_atIndex_(v25, v26, (uint64_t)v17, 0);
        objc_msgSend_setTexture_atIndex_(v25, v27, (uint64_t)v18, 1);
        unint64_t v31 = (unint64_t)(objc_msgSend_width(v18, v28, v29, v30) + 7) >> 3;
        uint64_t v35 = objc_msgSend_height(v18, v32, v33, v34);
        v58[0] = v31;
        v58[1] = (unint64_t)(v35 + 3) >> 2;
        v58[2] = 1;
        long long v56 = xmmword_263117D20;
        uint64_t v57 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v36, (uint64_t)v58, (uint64_t)&v56);
        objc_msgSend_endEncoding(v25, v37, v38, v39);

        if (++v16 >= v4[2]) {
          goto LABEL_6;
        }
      }
      FigDebugAssert3();
      int v54 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
  }

  return v54;
}

- (int)allocateFusionBuffersIfNeeded:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return sub_263002EF4(a3, a4, a5, self->_metal, 1, 1);
}

- (int)runImageFusion:(id)a3 config:(const FusionConfiguration *)a4 fusedPyramid:(id)a5 accWeightPyramid:(id)a6 buffers:(id)a7 properties:(const frameProperties_t *)a8 nrfPlist:(id)a9 confidence:(id)a10 batchN:(int)a11 isLastBatch:(BOOL)a12 isLowLight:(BOOL)a13 usePatchBasedFusion:(BOOL)a14 outputChromaBias:(float)a15
{
  v398 = a3;
  uint64_t v21 = (int *)a5;
  v387 = a6;
  v388 = a7;
  id v25 = a10;
  if (a11) {
    BOOL v26 = 0;
  }
  else {
    BOOL v26 = a12;
  }
  BOOL v395 = v26;
  v399 = a4;
  int v27 = BYTE1(a4[4].colorSpaceConversionParameters[2].transferFunctionInv.linearScale);
  uint64_t v28 = v21[2];
  uint64_t v29 = objc_msgSend_allocator(self->_metal, v22, v23, v24);
  uint64_t v33 = objc_msgSend_newTextureDescriptor(v29, v30, v31, v32);

  if (!v33) {
    goto LABEL_145;
  }
  uint64_t v37 = objc_msgSend_desc(v33, v34, v35, v36);
  objc_msgSend_setUsage_(v37, v38, 7, v39);

  if (!a11 && a13)
  {
    unint64_t v43 = objc_msgSend_width(*(void **)(v398[1] + 336), v40, v41, v42);
    unint64_t v47 = objc_msgSend_height(*(void **)(v398[1] + 336), v44, v45, v46);
    sub_263002EF4(v388, v43, v47, self->_metal, 1, 1);
  }
  if (v27)
  {
    uint64_t v48 = (id *)v388;
    id v49 = (void *)v388[1];
    v388[1] = 0;

    if (!a12)
    {
LABEL_114:
      if (a12)
      {
        uint64_t v368 = *((void *)v21 + 43);
        uint64_t v369 = *((void *)v21 + 63);
      }
      else
      {
        uint64_t v368 = 0;
        uint64_t v369 = 0;
      }
      int v371 = objc_msgSend_runStationaryFusionWithParams_inputs_fusedLumaTex_fusedChromaTex_noiseMapLumaTex_noiseMapChromaTex_accWeightLumaTex_accWeightChromaTex_inferenceLumaTex_inferenceChromaTex_batchN_(self, v50, (uint64_t)&self->_arrayOfinputParams[3].config.colorSpaceConversionParameters[2].finalScale, (uint64_t)v398, v48[4], v48[5], v48[2], v48[3], v387[42], v387[62], v368, v369, a11);
      for (uint64_t i = 0; i != 4; ++i)
        objc_msgSend_makePyramidAliasable_metal_releaseBand0_(PyramidStorage_NRF, v370, v398[i + 1], (uint64_t)self->_metal, 1);
      uint64_t v48 = (id *)v388;
LABEL_132:
      FigMetalDecRef();
      goto LABEL_133;
    }
    if (*((void *)v21 + 43))
    {
      FigDebugAssert3();
      int v371 = 0;
      goto LABEL_133;
    }
    uint64_t v53 = objc_msgSend_width(*(void **)(v398[1] + 344), v50, v51, v52);
    uint64_t v57 = objc_msgSend_desc(v33, v54, v55, v56);
    objc_msgSend_setWidth_(v57, v58, v53, v59);

    uint64_t v63 = objc_msgSend_height(*(void **)(v398[1] + 344), v60, v61, v62);
    uint64_t v67 = objc_msgSend_desc(v33, v64, v65, v66);
    objc_msgSend_setHeight_(v67, v68, v63, v69);

    uint64_t v73 = objc_msgSend_desc(v33, v70, v71, v72);
    objc_msgSend_setPixelFormat_(v73, v74, 25, v75);

    objc_msgSend_setLabel_(v33, v76, 0, v77);
    uint64_t v81 = objc_msgSend_allocator(self->_metal, v78, v79, v80);
    uint64_t v84 = objc_msgSend_newTextureWithDescriptor_(v81, v82, (uint64_t)v33, v83);
    uint64_t v85 = (void *)*((void *)v21 + 43);
    *((void *)v21 + 43) = v84;

    if (*((void *)v21 + 43))
    {
      if (!*((void *)v21 + 63))
      {
        uint64_t v89 = objc_msgSend_width(*(void **)(v398[1] + 504), v86, v87, v88);
        v93 = objc_msgSend_desc(v33, v90, v91, v92);
        objc_msgSend_setWidth_(v93, v94, v89, v95);

        uint64_t v99 = objc_msgSend_height(*(void **)(v398[1] + 504), v96, v97, v98);
        uint64_t v103 = objc_msgSend_desc(v33, v100, v101, v102);
        objc_msgSend_setHeight_(v103, v104, v99, v105);

        v109 = objc_msgSend_desc(v33, v106, v107, v108);
        objc_msgSend_setPixelFormat_(v109, v110, 65, v111);

        objc_msgSend_setLabel_(v33, v112, 0, v113);
        v117 = objc_msgSend_allocator(self->_metal, v114, v115, v116);
        uint64_t v120 = objc_msgSend_newTextureWithDescriptor_(v117, v118, (uint64_t)v33, v119);
        uint64_t v121 = (void *)*((void *)v21 + 63);
        *((void *)v21 + 63) = v120;

        uint64_t v48 = (id *)v388;
        if (!*((void *)v21 + 63)) {
          goto LABEL_149;
        }
        goto LABEL_114;
      }
      FigDebugAssert3();
      int v371 = 0;
LABEL_146:
      uint64_t v48 = (id *)v388;
      goto LABEL_133;
    }
LABEL_145:
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    goto LABEL_146;
  }
  uint64_t v402 = (v28 - 1);
  id v397 = v25;
  if (SLODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd) <= 1)
  {
    uint64_t v48 = (id *)v388;
    v373 = (void *)v388[1];
    v388[1] = 0;

    if (a11) {
      goto LABEL_19;
    }
    goto LABEL_121;
  }
  unint64_t v122 = (unint64_t)objc_msgSend_width(*(void **)(v398[1] + 336), v40, v41, v42) >> 3;
  int v126 = objc_msgSend_desc(v33, v123, v124, v125);
  objc_msgSend_setWidth_(v126, v127, v122, v128);

  unint64_t v132 = (unint64_t)objc_msgSend_height(*(void **)(v398[1] + 336), v129, v130, v131) >> 3;
  uint64_t v136 = objc_msgSend_desc(v33, v133, v134, v135);
  objc_msgSend_setHeight_(v136, v137, v132, v138);

  v142 = objc_msgSend_desc(v33, v139, v140, v141);
  objc_msgSend_setPixelFormat_(v142, v143, 10, v144);

  objc_msgSend_setLabel_(v33, v145, 0, v146);
  uint64_t v150 = objc_msgSend_allocator(self->_metal, v147, v148, v149);
  uint64_t v153 = objc_msgSend_newTextureWithDescriptor_(v150, v151, (uint64_t)v33, v152);
  uint64_t v48 = (id *)v388;
  uint64_t v154 = (void *)v388[1];
  v388[1] = v153;

  if (!v388[1])
  {
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    id v25 = v397;
    goto LABEL_133;
  }
  BYTE6(v382) = 0;
  WORD2(v382) = 257;
  LODWORD(v382) = a11;
  WORD2(v378) = 257;
  LODWORD(v378) = 0;
  *(float *)&double v156 = a15;
  id v25 = v397;
  if (objc_msgSend_runFusionForBandIndex_config_oldFusedUpTex_oldFusedTex_fusedUpTex_fusedTex_accWeightTex_bandFusionParams_fragmentBufferIndex_processLuma_processTopBand_computeSpecialMap_inputs_simMapTex_confidence_noiseMap_batchN_isFirstBatch_isLastBatch_usePatchBasedFusion_minVarWeightSum_outputChromaBias_ggMaxFusionWeights_(self, v155, v402, (uint64_t)a4, 0, 0, 0, 0.0, v156, 0, &self->_anon_e50[6992], v378, 1, v398, self->_placeHolderTex, 0, 0, v382, 0))
  {
LABEL_149:
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    goto LABEL_133;
  }
  if (!a11) {
LABEL_121:
  }
    self->_float exposureEffectiveTimeSumSoFar = 0.0;
LABEL_19:
  uint64_t finalScaleFwd_low = LODWORD(a4[4].colorSpaceConversionParameters[1].finalScaleFwd);
  uint64_t nonLinearScale_low = LODWORD(a4[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearScale);
  uint64_t v162 = (v28 - 1);
  if ((int)finalScaleFwd_low >= 1)
  {
    for (uint64_t j = 0; j != finalScaleFwd_low; ++j)
    {
      if ((!a11 || nonLinearScale_low != j)
        && (a11
         || j != *(_DWORD *)&a4[4].colorSpaceConversionParameters[1].outputToLinearYCbCr
         || !HIBYTE(a4[4].colorSpaceConversionParameters[2].transferFunctionFwd.nonLinearBias)))
      {
        self->_float exposureEffectiveTimeSumSoFar = *(&self->_arrayOfinputParams[6].config.colorSpaceConversionParameters[4].transferFunctionFwd.nonLinearBias
                                               + j)
                                             + self->_exposureEffectiveTimeSumSoFar;
      }
    }
  }
  v386 = v33;
  float exposureEffectiveTimeSumSoFar = self->_exposureEffectiveTimeSumSoFar;
  float v165 = *(&self->_arrayOfinputParams[6].config.colorSpaceConversionParameters[4].transferFunctionFwd.nonLinearBias
         + (int)nonLinearScale_low);
  id v404 = 0;
  locatiouint64_t n = 0;
  if ((int)v28 >= 1)
  {
    v403 = 0;
    v166 = 0;
    arrayOfinputParams = self->_arrayOfinputParams;
    uint64_t v167 = v398 + 1;
    v384 = v48 + 4;
    v385 = v48 + 5;
    float v168 = exposureEffectiveTimeSumSoFar / v165;
    uint64_t v169 = v21;
    v401 = v21;
    v396 = self;
    while (1)
    {
      uint64_t v170 = v28 - 1;
      BOOL v171 = v28 == 1 || v170 == v162;
      BOOL v172 = a11 != 0;
      if (v171) {
        BOOL v172 = 1;
      }
      if (v172)
      {
        uint64_t v21 = v169;
        if (v28 == 1)
        {

          int v176 = a11;
          if (a11)
          {
            int v400 = 0;
            v166 = 0;
            char v389 = 1;
          }
          else
          {
            unint64_t v363 = objc_msgSend_width(*(void **)(*v167 + 336), v173, v174, v175);
            unint64_t v367 = objc_msgSend_height(*(void **)(*v167 + 336), v364, v365, v366);
            sub_263002EF4(v48, v363, v367, self->_metal, 1, 0);
            int v400 = 0;
            v166 = 0;
            char v389 = 0;
          }
          uint64_t v257 = v384;
          goto LABEL_48;
        }
      }
      else
      {
        uint64_t v21 = v169;
        if (*(void *)&v169[2 * v170 + 84])
        {
          FigDebugAssert3();
          int v376 = 0;
          int v371 = 0;
          goto LABEL_130;
        }
        uint64_t v177 = objc_msgSend_width(*(void **)(*v167 + 336 + 8 * v170), v157, v158, v159);
        uint64_t v181 = objc_msgSend_desc(v386, v178, v179, v180);
        objc_msgSend_setWidth_(v181, v182, v177, v183);

        uint64_t v187 = objc_msgSend_height(*(void **)(*v167 + 336 + 8 * v170), v184, v185, v186);
        uint64_t v191 = objc_msgSend_desc(v386, v188, v189, v190);
        objc_msgSend_setHeight_(v191, v192, v187, v193);

        v197 = objc_msgSend_desc(v386, v194, v195, v196);
        objc_msgSend_setPixelFormat_(v197, v198, 25, v199);

        objc_msgSend_setLabel_(v386, v200, 0, v201);
        uint64_t v205 = objc_msgSend_allocator(v396->_metal, v202, v203, v204);
        self = v396;
        uint64_t v208 = objc_msgSend_newTextureWithDescriptor_(v205, v206, (uint64_t)v386, v207);
        v209 = *(void **)&v21[2 * v170 + 84];
        *(void *)&v21[2 * v170 + 84] = v208;

        if (!*(void *)&v21[2 * v170 + 84])
        {
          FigDebugAssert3();
          int v371 = FigSignalErrorAt();
          goto LABEL_142;
        }
      }
      v394 = v166;
      if (v28 == 2) {
        uint64_t v210 = 0;
      }
      else {
        uint64_t v210 = 255;
      }
      objc_msgSend_allocator(self->_metal, v157, v158, v159);
      v212 = uint64_t v211 = self;
      v215 = objc_msgSend_newTextureDescriptor_(v212, v213, v210, v214);

      if (!v215)
      {
        FigDebugAssert3();
        v166 = v394;
LABEL_138:
        int v371 = FigSignalErrorAt();

        goto LABEL_142;
      }
      uint64_t v219 = objc_msgSend_desc(v215, v216, v217, v218);
      objc_msgSend_setUsage_(v219, v220, 7, v221);

      uint64_t v225 = objc_msgSend_width(*(void **)&v21[2 * v170 + 84], v222, v223, v224);
      objc_msgSend_desc(v215, v226, v227, v228);
      v230 = int v229 = (void **)v21;
      objc_msgSend_setWidth_(v230, v231, v225, v232);

      uint64_t v236 = objc_msgSend_height(v229[v170 + 42], v233, v234, v235);
      uint64_t v240 = objc_msgSend_desc(v215, v237, v238, v239);
      objc_msgSend_setHeight_(v240, v241, v236, v242);

      v246 = objc_msgSend_desc(v215, v243, v244, v245);
      objc_msgSend_setPixelFormat_(v246, v247, 25, v248);

      objc_msgSend_setLabel_(v215, v249, 0, v250);
      uint64_t v254 = objc_msgSend_allocator(v211->_metal, v251, v252, v253);
      uint64_t v256 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v254, v255, (uint64_t)v215, v210);

      if (!v256)
      {
        FigDebugAssert3();
        v166 = 0;
        uint64_t v21 = (int *)v229;
        uint64_t v48 = (id *)v388;
        goto LABEL_138;
      }
      self = v211;

      uint64_t v257 = &v229[v170 + 42];
      int v400 = 1;
      v166 = (void *)v256;
      char v389 = 1;
      uint64_t v21 = (int *)v229;
      uint64_t v48 = (id *)v388;
      int v176 = a11;
LABEL_48:
      v258 = (const char *)*v257;
      uint64_t v261 = 0;
      BOOL v262 = v170 == v402 || v176 == 0;
      if (v262) {
        id v263 = 0;
      }
      else {
        id v263 = location;
      }
      BOOL v264 = v28 == 1 || v176 == 0;
      BOOL v390 = v264;
      if (v264) {
        uint64_t v265 = 0;
      }
      else {
        uint64_t v265 = v166;
      }
      if (v170 != v402) {
        uint64_t v261 = *(void *)&v21[2 * v28 + 84];
      }
      BOOL v391 = v262;
      if (v395) {
        uint64_t v266 = 0;
      }
      else {
        uint64_t v266 = v387[v170 + 42];
      }
      placeHolderTex = (MTLTexture *)v48[1];
      if (!placeHolderTex) {
        placeHolderTex = self->_placeHolderTex;
      }
      unsigned int v268 = 2 * v170;
      BOOL v269 = a14;
      if (v28 != 1) {
        BOOL v269 = 0;
      }
      BYTE6(v382) = v269;
      BYTE5(v382) = a12;
      BYTE4(v382) = v176 == 0;
      LODWORD(v382) = v176;
      LODWORD(v380) = 0;
      BYTE5(v378) = v170 == v402;
      BYTE4(v378) = 1;
      LODWORD(v378) = 2 * v170 + 3;
      *(float *)&double v259 = v168;
      *(float *)&double v260 = a15;
      v392 = (char *)v258;
      if (objc_msgSend_runFusionForBandIndex_config_oldFusedUpTex_oldFusedTex_fusedUpTex_fusedTex_accWeightTex_bandFusionParams_fragmentBufferIndex_processLuma_processTopBand_computeSpecialMap_inputs_simMapTex_confidence_noiseMap_batchN_isFirstBatch_isLastBatch_usePatchBasedFusion_minVarWeightSum_outputChromaBias_ggMaxFusionWeights_(self, v258, v28 - 1, (uint64_t)v399, v263, v265, v261, v258, v259, v260, v266, (char *)arrayOfinputParams + 1520 * ((2 * v170) | 1u), v378, v380, v398, placeHolderTex, v397, v48[2], v382,
                           v48[6]))
        goto LABEL_141;
      FigMetalDecRef();
      objc_storeStrong(&location, v166);
      if (v28 <= v402)
      {
        for (uint64_t k = 0; k != 32; k += 8)
          FigMetalDecRef();
        uint64_t v21 = v401;
        if (v400 & a12) {
          FigMetalDecRef();
        }
      }
      BOOL v274 = a11 != 0;
      if (v28 == 1) {
        BOOL v274 = 1;
      }
      if (!v274 && v170 != v402 && (FigMetalIsValid() & 1) == 0)
      {
        uint64_t v275 = objc_msgSend_width(*(void **)(*v167 + 496 + 8 * v170), v270, v271, v272);
        v279 = objc_msgSend_desc(v386, v276, v277, v278);
        objc_msgSend_setWidth_(v279, v280, v275, v281);

        uint64_t v285 = objc_msgSend_height(*(void **)(*v167 + 496 + 8 * v170), v282, v283, v284);
        uint64_t v289 = objc_msgSend_desc(v386, v286, v287, v288);
        objc_msgSend_setHeight_(v289, v290, v285, v291);

        self = v396;
        v295 = objc_msgSend_desc(v386, v292, v293, v294);
        objc_msgSend_setPixelFormat_(v295, v296, 65, v297);

        objc_msgSend_setLabel_(v386, v298, 0, v299);
        int v303 = objc_msgSend_allocator(v396->_metal, v300, v301, v302);
        uint64_t v306 = objc_msgSend_newTextureWithDescriptor_(v303, v304, (uint64_t)v386, v305);
        v307 = *(void **)&v401[2 * v170 + 124];
        *(void *)&v401[2 * v170 + 124] = v306;

        uint64_t v21 = v401;
        if (!*(void *)&v401[2 * v170 + 124])
        {
LABEL_141:
          FigDebugAssert3();
          int v371 = FigSignalErrorAt();

LABEL_142:
          int v376 = 0;
          id v25 = v397;
LABEL_130:
          uint64_t v33 = v386;
          goto LABEL_131;
        }
      }
      if (v400)
      {
        v308 = v21;
        uint64_t v309 = objc_msgSend_width(*(void **)&v21[2 * v170 + 124], v270, v271, v272);
        v313 = objc_msgSend_desc(v386, v310, v311, v312);
        objc_msgSend_setWidth_(v313, v314, v309, v315);

        uint64_t v316 = v308 + 124;
        uint64_t v48 = (id *)v388;
        uint64_t v320 = objc_msgSend_height((void *)v316[v170], v317, v318, v319);
        uint64_t v324 = objc_msgSend_desc(v386, v321, v322, v323);
        objc_msgSend_setHeight_(v324, v325, v320, v326);

        v330 = objc_msgSend_desc(v386, v327, v328, v329);
        objc_msgSend_setPixelFormat_(v330, v331, 65, v332);

        objc_msgSend_setLabel_(v386, v333, 0, v334);
        v338 = objc_msgSend_allocator(v396->_metal, v335, v336, v337);
        self = v396;
        uint64_t v341 = objc_msgSend_newTextureWithDescriptor_(v338, v339, (uint64_t)v386, v340);

        v403 = (void *)v341;
      }
      else
      {
        v338 = v403;
        v403 = 0;
      }

      if ((v389 & 1) == 0)
      {
        unint64_t v345 = objc_msgSend_width(*(void **)(*v167 + 336), v342, v343, v344);
        unint64_t v349 = objc_msgSend_height(*(void **)(*v167 + 336), v346, v347, v348);
        sub_263002EF4(v48, v345, v349, self->_metal, 0, 1);
      }
      v350 = v385;
      if (v28 != 1) {
        v350 = (id *)&v401[2 * v170 + 124];
      }
      id v352 = *v350;
      uint64_t v354 = 0;
      if (v391) {
        id v355 = 0;
      }
      else {
        id v355 = v404;
      }
      if (v390) {
        v356 = 0;
      }
      else {
        v356 = v403;
      }
      if (v170 != v402) {
        uint64_t v354 = *(void *)&v401[2 * v28 + 124];
      }
      if (v395) {
        uint64_t v357 = 0;
      }
      else {
        uint64_t v357 = v387[v170 + 62];
      }
      v358 = (MTLTexture *)v48[1];
      if (!v358) {
        v358 = self->_placeHolderTex;
      }
      v359 = &arrayOfinputParams->config.preWarpEnabled + 1520 * v268;
      unsigned int v360 = v268 + 2;
      *(_WORD *)((char *)&v383 + 5) = a12;
      BYTE4(v383) = a11 == 0;
      LODWORD(v383) = a11;
      id v25 = v397;
      LODWORD(v381) = 0;
      BYTE5(v379) = v170 == v402;
      BYTE4(v379) = 0;
      LODWORD(v379) = v360;
      *(float *)&double v353 = a15;
      if (objc_msgSend_runFusionForBandIndex_config_oldFusedUpTex_oldFusedTex_fusedUpTex_fusedTex_accWeightTex_bandFusionParams_fragmentBufferIndex_processLuma_processTopBand_computeSpecialMap_inputs_simMapTex_confidence_noiseMap_batchN_isFirstBatch_isLastBatch_usePatchBasedFusion_minVarWeightSum_outputChromaBias_ggMaxFusionWeights_(self, v351, v28 - 1, (uint64_t)v399, v355, v356, v354, v352, 0.0, v353, v357, v359, v379, v381, v398, v358, v397, v48[3], v383,
                           v48[6]))
      {
        FigDebugAssert3();
        int v371 = FigSignalErrorAt();

        int v376 = 0;
        uint64_t v33 = v386;
        uint64_t v21 = v401;
        goto LABEL_131;
      }
      FigMetalDecRef();
      objc_storeStrong(&v404, v403);
      if (v28 <= v402)
      {
        for (uint64_t m = 0; m != 32; m += 8)
          FigMetalDecRef();
        id v25 = v397;
        if (v400 & a12) {
          FigMetalDecRef();
        }
      }
      if (v25) {
        FigMetalDecRef();
      }

      BOOL v362 = v28-- < 2;
      uint64_t v162 = v402;
      uint64_t v169 = v401;
      if (v362) {
        goto LABEL_123;
      }
    }
  }
  uint64_t v169 = v21;
  v166 = 0;
  v403 = 0;
LABEL_123:
  uint64_t v21 = v169;
  if (v169[2] < 1)
  {
    int v371 = 0;
    int v376 = 1;
    goto LABEL_130;
  }
  uint64_t v374 = 0;
  uint64_t v33 = v386;
  do
  {
    for (uint64_t n = 0; n != 32; n += 8)
    {
      FigMetalDecRef();
      FigMetalDecRef();
    }
    ++v374;
  }
  while (v374 < v21[2]);
  int v371 = 0;
  int v376 = 1;
  uint64_t v48 = (id *)v388;
  id v25 = v397;
LABEL_131:

  if (v376) {
    goto LABEL_132;
  }
LABEL_133:

  return v371;
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