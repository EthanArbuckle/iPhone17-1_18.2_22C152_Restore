@interface DeepFusionPreEspressoStage
- (DFSynthLongHighlightParameters)_createHighlightParameters:(SEL)a3 highlightTuning:(const DeepFusionFrameMeta *)a4 totalGain:(id)a5;
- (DeepFusionPreEspressoStage)initWithContext:(id)a3 networkVersion:(int)a4;
- (DeepFusionRawNoiseModelParameters)_createRawNoiseModelParameters:(SEL)a3;
- (int)estimateNoiseRefNoise:(DeepFusionPreEspressoStage *)self synthLongNoise:(SEL)a2 synthRefNoisePretuning:(id)a3 synthLongNoisePretuning:(id)a4 synthRefLuma:(id)a5 synthRefChroma:(id)a6 synthLongLuma:(id)a7 synthLongChroma:(id)a8 lscGains:(id)a9 slFusionMap:(id)a10 longFusionMap:(id)a11 outRefNoisePyramid:(id)a12 outSLNoisePyramid:(id)a13 noiseEstimationParams:(id)a14 offset:(id)a15 tileDimension:(NoiseEstimationParameters *)a16;
- (int)filterChroma:(id)a3 outChroma:(id)a4 alpha:(float)a5;
- (int)setEstimateNoiseParams:(NoiseEstimationParameters *)a3 fullDimension:(const IntermediateEncodingParameters *)a4 intermediateEncodingParams:;
- (int)yuvCopyAndBias:(id)a3 chromaInput:(id)a4 lumaOutput:(id)a5 chromaOutput:(id)a6;
- (int)yuvPlanarRGBToRGBA:(id)a3 outRGBA:(id)a4;
- (void)computeGlobalNoiseFactor:(id)a3 totalGain:(float)a4 synthRefFactor:(float *)a5 synthLongFactor:(float *)a6;
- (void)getLumaMaskTuning:(const NoiseEstimationParameters *)a3 outTuning:(LumaMaskTuningParam *)a4;
- (void)getNoiseTuningParams:(const NoiseEstimationParameters *)a3 fullDimension:(NoiseTuningParams *)a4 outTuning:;
@end

@implementation DeepFusionPreEspressoStage

- (DeepFusionPreEspressoStage)initWithContext:(id)a3 networkVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DeepFusionPreEspressoStage;
  v8 = [(DeepFusionPreEspressoStage *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_networkVersion = v4;
    objc_storeStrong((id *)&v8->_metalContext, a3);
    v10 = [DeepFusionPreEspressoKernels alloc];
    uint64_t v12 = objc_msgSend_initWithMetal_networkVersion_(v10, v11, (uint64_t)v7, v4);
    kernels = v9->_kernels;
    v9->_kernels = (DeepFusionPreEspressoKernels *)v12;

    v17 = objc_msgSend_device(v7, v14, v15, v16);
    uint64_t v19 = objc_msgSend_newBufferWithLength_options_(v17, v18, 224, 0);
    noiseParamBuffer = v9->_noiseParamBuffer;
    v9->_noiseParamBuffer = (MTLBuffer *)v19;
  }
  return v9;
}

- (DFSynthLongHighlightParameters)_createHighlightParameters:(SEL)a3 highlightTuning:(const DeepFusionFrameMeta *)a4 totalGain:(id)a5
{
  float v7 = sqrtf(a6 / a4->syntheticLongExposure.analog_gain);
  LODWORD(v6) = *((_DWORD *)a5 + 2);
  DWORD1(v6) = *((_DWORD *)a5 + 4);
  *(float32x2_t *)&long long v6 = vmul_n_f32(*(float32x2_t *)&v6, v7);
  *((float *)&v6 + 2) = v7 * *((float *)a5 + 3);
  *(void *)&retstr[1].var3 = 0;
  *(void *)&retstr[2].var0 = 0;
  float v8 = *((float *)a5 + 5);
  *(_OWORD *)&retstr->var0 = v6;
  float v9 = *((float *)a5 + 6);
  float v10 = *((float *)a5 + 7);
  retstr->var4 = v8;
  retstr[1].var0 = v9;
  float v11 = *((float *)a5 + 8);
  retstr[1].var1 = v10;
  retstr[1].var2 = v11;
  retstr[1].var3 = *((float *)a5 + 9);
  return self;
}

- (DeepFusionRawNoiseModelParameters)_createRawNoiseModelParameters:(SEL)a3
{
  *(float *)&long long v5 = a4->red_combo_gain;
  float blue_combo_gain = a4->blue_combo_gain;
  if (a4->hr_enabled) {
    v6.i32[0] = LODWORD(a4->hr_gain_down_ratio);
  }
  else {
    v6.i32[0] = 1.0;
  }
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr[1].var2 = 0u;
  __asm { FMOV            V4.2S, #1.0 }
  _D4.i32[0] = v5;
  *(float32x2_t *)&long long v5 = vdiv_f32(_D4, (float32x2_t)vdup_lane_s32(v6, 0));
  *((float *)&v5 + 2) = blue_combo_gain / *(float *)v6.i32;
  *(_OWORD *)&retstr->var0 = v5;
  *(float *)&retstr->var4 = a4->analog_gain;
  result = (DeepFusionRawNoiseModelParameters *)objc_msgSend_calculateReadNoise_(DeepFusionCommon, a3, (uint64_t)a4, v4);
  retstr->var5 = v17;
  *(void *)&retstr[1].var0 = *(void *)&a4->conversion_gain;
  LOBYTE(retstr[1].var2) = self->_networkVersion == 1;
  retstr[1].var3 = a4->lsModulationWeight;
  return result;
}

- (void)computeGlobalNoiseFactor:(id)a3 totalGain:(float)a4 synthRefFactor:(float *)a5 synthLongFactor:(float *)a6
{
  uint64_t v9 = *(void *)(*((void *)a3 + 5) + 8);
  float v10 = a3;
  *a5 = sub_262FCDA18(v9, a4);
  uint64_t v11 = v10[6];

  *a6 = sub_262FCDA18(*(void *)(v11 + 8), a4);
}

- (void)getLumaMaskTuning:(const NoiseEstimationParameters *)a3 outTuning:(LumaMaskTuningParam *)a4
{
  float v6 = sub_262FCDA18(*((void *)a3->var4 + 4), a3->var1);
  if (v6 == 0.0) {
    float v7 = 1.0;
  }
  else {
    float v7 = 1.0 / v6;
  }
  a4->var0 = v7;
  a4->var1 = sub_262FCDA18(*(void *)(*((void *)a3->var4 + 5) + 16), a3->var1);
  a4->var2 = sub_262FCDA18(*(void *)(*((void *)a3->var4 + 6) + 16), a3->var1);
}

- (void)getNoiseTuningParams:(const NoiseEstimationParameters *)a3 fullDimension:(NoiseTuningParams *)a4 outTuning:
{
  float v6 = (float32x2_t *)v4;
  unsigned int v7 = a4;
  *(float *)&double v5 = a3->var1;
  objc_msgSend_computeGlobalNoiseFactor_totalGain_synthRefFactor_synthLongFactor_(self, a2, (uint64_t)a3->var4, v4, v4 + 4, v5);
  float v10 = sub_262FCDA18(*((void *)a3->var4 + 1), a3->var1);
  float var2 = a3->var2;
  v12.i32[0] = (unsigned __int16)v7;
  v6[1].f32[0] = v10;
  v6[1].f32[1] = var2;
  v12.i32[1] = vshr_n_u32((uint32x2_t)vdup_n_s32(v7), 0x10uLL).i32[1];
  __asm { FMOV            V1.2S, #1.0 }
  v6[2] = vdiv_f32(_D1, vcvt_f32_s32(v12));

  MEMORY[0x270F9A6D0](self, sel_getLumaMaskTuning_outTuning_, a3, &v6[3]);
}

- (int)setEstimateNoiseParams:(NoiseEstimationParameters *)a3 fullDimension:(const IntermediateEncodingParameters *)a4 intermediateEncodingParams:
{
  double v5 = v4;
  uint64_t v9 = objc_msgSend_contents(self->_noiseParamBuffer, a2, (uint64_t)a3, (uint64_t)a4);
  *(float *)uint64_t v9 = a3->var0;
  *(float *)(v9 + 4) = a3->var6;
  objc_msgSend__createRawNoiseModelParameters_(self, v10, (uint64_t)&a3->var3->syntheticLongExposure, v11);
  *(_OWORD *)(v9 + 16) = v18;
  *(_OWORD *)(v9 + 32) = v19;
  *(_OWORD *)(v9 + 48) = v20;
  objc_msgSend__createRawNoiseModelParameters_(self, v12, (uint64_t)&a3->var3->longExposure, v13);
  *(_OWORD *)(v9 + 64) = v18;
  *(_OWORD *)(v9 + 80) = v19;
  HIDWORD(v14) = DWORD1(v20);
  *(_OWORD *)(v9 + 96) = v20;
  *(NoiseDivisorQuantizationBoundaries *)(v9 + 112) = a3->var7;
  *(float *)&double v14 = a3->var1;
  objc_msgSend__createHighlightParameters_highlightTuning_totalGain_(self, v15, (uint64_t)a3->var3, (uint64_t)a3->var5, v14);
  *(_OWORD *)(v9 + 128) = v18;
  *(_OWORD *)(v9 + 144) = v19;
  *(_OWORD *)(v9 + 160) = v20;
  *(void *)(v9 + 8) = *v5;
  objc_msgSend_getNoiseTuningParams_fullDimension_outTuning_(self, v16, (uint64_t)a3, (uint64_t)a4, v9 + 176);
  return 0;
}

- (int)estimateNoiseRefNoise:(DeepFusionPreEspressoStage *)self synthLongNoise:(SEL)a2 synthRefNoisePretuning:(id)a3 synthLongNoisePretuning:(id)a4 synthRefLuma:(id)a5 synthRefChroma:(id)a6 synthLongLuma:(id)a7 synthLongChroma:(id)a8 lscGains:(id)a9 slFusionMap:(id)a10 longFusionMap:(id)a11 outRefNoisePyramid:(id)a12 outSLNoisePyramid:(id)a13 noiseEstimationParams:(id)a14 offset:(id)a15 tileDimension:(NoiseEstimationParameters *)a16
{
  id v71 = a3;
  id v70 = a4;
  id v76 = a5;
  id v22 = a6;
  id v79 = a7;
  id v78 = a8;
  id v23 = a9;
  id v77 = a10;
  id v24 = a11;
  id v75 = a12;
  id v74 = a13;
  id v73 = a14;
  id v72 = a15;
  v83[0] = v84;
  v28 = objc_msgSend_commandQueue(self->_metalContext, v25, v26, v27);
  v32 = objc_msgSend_commandBuffer(v28, v29, v30, v31);

  objc_msgSend_setLabel_(v32, v33, @"applyAllTuningToNoise", v34);
  v38 = objc_msgSend_computeCommandEncoder(v32, v35, v36, v37);
  v41 = v38;
  if (v38)
  {
    objc_msgSend_setLabel_(v38, v39, @"_kernels->_estimateAndTuneNoise[noiseEstimationParams->preEspressoMetaData->combo == L_EV0x3]", v40);
    objc_msgSend_setComputePipelineState_(v41, v42, (uint64_t)self->_kernels->_estimateAndTuneNoise[a16->var3->combo == 0], v43);
    objc_msgSend_setTexture_atIndex_(v41, v44, (uint64_t)v76, 0);
    objc_msgSend_setTexture_atIndex_(v41, v45, (uint64_t)v22, 1);
    objc_msgSend_setTexture_atIndex_(v41, v46, (uint64_t)v71, 2);
    objc_msgSend_setTexture_atIndex_(v41, v47, (uint64_t)v70, 3);
    objc_msgSend_setTexture_atIndex_(v41, v48, (uint64_t)v24, 4);
    objc_msgSend_setTexture_atIndex_(v41, v49, (uint64_t)v79, 5);
    objc_msgSend_setTexture_atIndex_(v41, v50, (uint64_t)v78, 6);
    objc_msgSend_setTexture_atIndex_(v41, v51, (uint64_t)v23, 7);
    objc_msgSend_setTexture_atIndex_(v41, v52, (uint64_t)v77, 8);
    objc_msgSend_setTexture_atIndex_(v41, v53, (uint64_t)v75, 9);
    objc_msgSend_setTexture_atIndex_(v41, v54, (uint64_t)v74, 10);
    objc_msgSend_setTexture_atIndex_(v41, v55, (uint64_t)v73, 11);
    objc_msgSend_setTexture_atIndex_(v41, v56, (uint64_t)v72, 12);
    objc_msgSend_setBuffer_offset_atIndex_(v41, v57, (uint64_t)self->_noiseParamBuffer, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v41, v58, (uint64_t)v83, 4, 1);
    v82[0] = (unsigned __int16)v85;
    v82[1] = HIWORD(v85);
    v82[2] = 1;
    long long v80 = xmmword_263117D20;
    uint64_t v81 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v41, v59, (uint64_t)v82, (uint64_t)&v80);
    objc_msgSend_endEncoding(v41, v60, v61, v62);
    objc_msgSend_commit(v32, v63, v64, v65);
    int v66 = 0;
    v67 = v71;
    v68 = v70;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v66 = FigSignalErrorAt();
    v68 = v70;
    v67 = v71;
  }

  return v66;
}

- (int)yuvCopyAndBias:(id)a3 chromaInput:(id)a4 lumaOutput:(id)a5 chromaOutput:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  float v17 = v13;
  if (!v10) {
    goto LABEL_13;
  }
  if (!v11) {
    goto LABEL_13;
  }
  if (!v12) {
    goto LABEL_13;
  }
  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v18 = objc_msgSend_width(v10, v14, v15, v16);
  if (v18 != objc_msgSend_width(v12, v19, v20, v21)) {
    goto LABEL_13;
  }
  uint64_t v25 = objc_msgSend_height(v10, v22, v23, v24);
  if (v25 != objc_msgSend_height(v12, v26, v27, v28)) {
    goto LABEL_13;
  }
  uint64_t v32 = objc_msgSend_width(v11, v29, v30, v31);
  if (v32 == objc_msgSend_width(v17, v33, v34, v35)
    && (uint64_t v39 = objc_msgSend_height(v11, v36, v37, v38), v39 == objc_msgSend_height(v17, v40, v41, v42))
    && (objc_msgSend_commandQueue(self->_metalContext, v43, v44, v45),
        v46 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v46, v47, v48, v49),
        v50 = objc_claimAutoreleasedReturnValue(),
        v46,
        v50))
  {
    v54 = objc_msgSend_computeCommandEncoder(v50, v51, v52, v53);
    if (v54)
    {
      v57 = v54;
      objc_msgSend_setComputePipelineState_(v54, v55, (uint64_t)self->_kernels->_yuvCopyAndBias, v56);
      objc_msgSend_setTexture_atIndex_(v57, v58, (uint64_t)v10, 0);
      objc_msgSend_setTexture_atIndex_(v57, v59, (uint64_t)v11, 1);
      objc_msgSend_setTexture_atIndex_(v57, v60, (uint64_t)v12, 2);
      objc_msgSend_setTexture_atIndex_(v57, v61, (uint64_t)v17, 3);
      v79[0] = objc_msgSend_width(v10, v62, v63, v64);
      v79[1] = objc_msgSend_height(v10, v65, v66, v67);
      v79[2] = 1;
      long long v77 = xmmword_263117D20;
      uint64_t v78 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v57, v68, (uint64_t)v79, (uint64_t)&v77);
      objc_msgSend_endEncoding(v57, v69, v70, v71);
      objc_msgSend_commit(v50, v72, v73, v74);

      int v75 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v75 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v75 = FigSignalErrorAt();
  }

  return v75;
}

- (int)yuvPlanarRGBToRGBA:(id)a3 outRGBA:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = v7;
  if (v6
    && v7
    && (uint64_t v12 = objc_msgSend_width(v7, v8, v9, v10), v12 == objc_msgSend_width(v6, v13, v14, v15))
    && (uint64_t v19 = objc_msgSend_height(v11, v16, v17, v18), v19 == objc_msgSend_height(v6, v20, v21, v22) / 3uLL)
    && (objc_msgSend_commandQueue(self->_metalContext, v23, v24, v25),
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v26, v27, v28, v29),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        v26,
        v30))
  {
    uint64_t v34 = objc_msgSend_computeCommandEncoder(v30, v31, v32, v33);
    if (v34)
    {
      uint64_t v37 = v34;
      objc_msgSend_setComputePipelineState_(v34, v35, (uint64_t)self->_kernels->_yuvPlanarRGBToRGBA, v36);
      objc_msgSend_setTexture_atIndex_(v37, v38, (uint64_t)v6, 0);
      objc_msgSend_setTexture_atIndex_(v37, v39, (uint64_t)v11, 1);
      v57[0] = objc_msgSend_width(v11, v40, v41, v42);
      v57[1] = objc_msgSend_height(v11, v43, v44, v45);
      v57[2] = 1;
      long long v55 = xmmword_263117D20;
      uint64_t v56 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v37, v46, (uint64_t)v57, (uint64_t)&v55);
      objc_msgSend_endEncoding(v37, v47, v48, v49);
      objc_msgSend_commit(v30, v50, v51, v52);

      int v53 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v53 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
  }

  return v53;
}

- (int)filterChroma:(id)a3 outChroma:(id)a4 alpha:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = v9;
  if (v8
    && v9
    && a5 > 0.0
    && a5 <= 1.0
    && (objc_msgSend_commandQueue(self->_metalContext, v10, v11, v12),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v14, v15, v16, v17),
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v14,
        v18))
  {
    uint64_t v22 = objc_msgSend_computeCommandEncoder(v18, v19, v20, v21);
    if (v22)
    {
      uint64_t v25 = v22;
      objc_msgSend_setComputePipelineState_(v22, v23, (uint64_t)self->_kernels->_filterChroma, v24);
      objc_msgSend_setTexture_atIndex_(v25, v26, (uint64_t)v8, 0);
      objc_msgSend_setTexture_atIndex_(v25, v27, (uint64_t)v13, 1);
      *(float *)&uint64_t v28 = (float)(a5 * -0.88889) + 1.0;
      *((float *)&v28 + 1) = (float)(1.0 - *(float *)&v28) * 0.125;
      uint64_t v48 = v28;
      objc_msgSend_setBytes_length_atIndex_(v25, v29, (uint64_t)&v48, 8, 0);
      v47[0] = objc_msgSend_width(v8, v30, v31, v32);
      v47[1] = objc_msgSend_height(v8, v33, v34, v35);
      v47[2] = 1;
      long long v45 = xmmword_263117D20;
      uint64_t v46 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v25, v36, (uint64_t)v47, (uint64_t)&v45);
      objc_msgSend_endEncoding(v25, v37, v38, v39);
      objc_msgSend_commit(v18, v40, v41, v42);

      int v43 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v43 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
  }

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_kernels, 0);

  objc_storeStrong((id *)&self->_noiseParamBuffer, 0);
}

@end