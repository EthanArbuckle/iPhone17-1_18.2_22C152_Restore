@interface PyramidStage_NRF
+ (int)prewarmShaders:(id)a3;
- (BOOL)useM2M;
- (PyramidStage_NRF)initWithOptions:(id)a3 context:(id)a4;
- (int)runGPUWithFilters:(PyramidFilterParams *)a3 doShift:(BOOL)a4;
- (int)runM2MWithFilters:(PyramidFilterParams *)a3;
- (int)runWithFilters:(PyramidFilterParams *)a3;
- (int)setResourcesWithPyramid:(id)a3;
- (void)setColorSpace:(int)a3 withParams:(const ColorSpaceConversionParameters *)a4;
@end

@implementation PyramidStage_NRF

- (PyramidStage_NRF)initWithOptions:(id)a3 context:(id)a4
{
  id v6 = a4;
  v7 = loadDefaultsWritesWithPrefix();
  v91.receiver = self;
  v91.super_class = (Class)PyramidStage_NRF;
  v10 = [(PyramidStage_NRF *)&v91 init];
  if (!v10) {
    goto LABEL_28;
  }
  v11 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"PyrGen.UseHW", v9);
  int isEqual = objc_msgSend_isEqual_(v11, v12, (uint64_t)&unk_270E50610, v13);

  if (isEqual)
  {
    char v17 = 0;
    v10->_conf.use_m2m = 0;
  }
  else
  {
    v18 = objc_msgSend_objectForKeyedSubscript_(v7, v15, @"PyrGen.UseHW", v16);
    v10->_conf.use_m2m = objc_msgSend_intValue(v18, v19, v20, v21) == 1;

    char v17 = 1;
  }
  v10->_forceHW = v17;
  v24 = objc_msgSend_objectForKeyedSubscript_(v7, v15, @"PyrGen.DoSync", v16);
  if (v24)
  {
    v25 = objc_msgSend_objectForKeyedSubscript_(v7, v22, @"PyrGen.DoSync", v23);
    v10->_conf.do_sync_at_end = objc_msgSend_BOOLValue(v25, v26, v27, v28);
  }
  else
  {
    v10->_conf.do_sync_at_end = 1;
  }

  v33 = objc_msgSend_objectForKeyedSubscript_(v7, v29, @"PyrGen.CompensateGpuShift", v30);
  if (v33)
  {
    v34 = objc_msgSend_objectForKeyedSubscript_(v7, v31, @"PyrGen.CompensateGpuShift", v32);
    v10->_conf.compensate_gpu_shift = objc_msgSend_BOOLValue(v34, v35, v36, v37);
  }
  else
  {
    v10->_conf.compensate_gpu_shift = 0;
  }

  v42 = objc_msgSend_objectForKeyedSubscript_(v7, v38, @"PyrGen.SupportFP16", v39);
  if (v42)
  {
    v43 = objc_msgSend_objectForKeyedSubscript_(v7, v40, @"PyrGen.SupportFP16", v41);
    v10->_conf.supportFP16 = objc_msgSend_BOOLValue(v43, v44, v45, v46);
  }
  else
  {
    v10->_conf.supportFP16 = 1;
  }

  objc_storeStrong((id *)&v10->_metal, a4);
  v47 = (FigM2MController *)objc_alloc_init(MEMORY[0x263F2EE08]);
  m2mController = v10->_m2mController;
  v10->_m2mController = v47;

  if (v10->_m2mController)
  {
    objc_msgSend_prewarmShaders_(PyramidStage_NRF, v49, (uint64_t)v10->_metal, v50);
    uint64_t v51 = 0;
    *(_OWORD *)&v10[1]._uniforms_Y[5] = xmmword_263017830;
    *(_OWORD *)&v10[1]._uniforms_Y[7] = xmmword_263017840;
    v10[1]._uniforms_Y[9] = (MTLBuffer *)0x3F80000000000000;
    v92[0] = xmmword_263017850;
    v92[1] = xmmword_263017860;
    v92[2] = xmmword_263017870;
    simd_float4 v93 = 0u;
    simd_float4 v94 = 0u;
    simd_float4 v95 = 0u;
    v10->_band0ColorSpace = 0;
    do
    {
      *(float32x4_t *)((char *)&v93 + v51 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263017880, COERCE_FLOAT(v92[v51])), (float32x4_t)xmmword_263017890, *(float32x2_t *)&v92[v51], 1), (float32x4_t)xmmword_2630178A0, (float32x4_t)v92[v51], 2);
      ++v51;
    }
    while (v51 != 3);
    v96.columns[0] = v93;
    v96.columns[1] = v94;
    v96.columns[2] = v95;
    *(simd_float4 *)&v10->_colorSpaceConversionParameters.outputToLinearYCbCr = v93;
    *(simd_float4 *)&v10[1]._conf.use_m2m = v96.columns[1];
    *(simd_float4 *)&v10[1]._m2mController = v96.columns[2];
    v96.columns[3] = (simd_float4)xmmword_2630178B0;
    simd_float4x4 v97 = __invert_f4(v96);
    *(simd_float4 *)&v10->_colorSpaceConversionParameters.transferFunctionFwd.linearScale = v97.columns[0];
    *(simd_float4 *)&v10->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower = v97.columns[1];
    *(simd_float4 *)&v10->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias = v97.columns[2];
    *(float *)&v10[1]._uniforms_Y[10] = 1.0 / *((float *)&v10[1]._uniforms_Y[10] + 1);
    uint64_t v52 = MEMORY[0x263EF89A0];
    v97.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A0] + 16);
    *(_OWORD *)&v10[1]._uniformsHeap = *MEMORY[0x263EF89A0];
    *(simd_float4 *)&v10[1]._uniforms_Y[1] = v97.columns[1];
    *(_OWORD *)&v10[1]._uniforms_Y[3] = *(_OWORD *)(v52 + 32);
    HIDWORD(v10[1]._uniforms_Y[10]) = 1065353216;
    LODWORD(v10[1]._uniforms_Y[11]) = 65793;
    v53 = objc_opt_new();
    v56 = v53;
    if (v53)
    {
      objc_msgSend_setStorageMode_(v53, v54, 0, v55);
      objc_msgSend_setHazardTrackingMode_(v56, v57, 2, v58);
      objc_msgSend_setSize_(v56, v59, 655360, v60);
      v64 = objc_msgSend_device(v10->_metal, v61, v62, v63);
      uint64_t v67 = objc_msgSend_newHeapWithDescriptor_(v64, v65, (uint64_t)v56, v66);
      uniformsHeap = v10->_uniformsHeap;
      v10->_uniformsHeap = (MTLHeap *)v67;

      if (v10->_uniformsHeap)
      {
        uint64_t v72 = 0;
        while (1)
        {
          v73 = v10->_uniformsHeap;
          uint64_t v74 = objc_msgSend_resourceOptions(v73, v69, v70, v71);
          uint64_t v76 = objc_msgSend_newBufferWithLength_options_(v73, v75, 16, v74);
          v77 = (char *)v10 + v72 * 8;
          v78 = v10->_uniforms_Y[v72];
          v10->_uniforms_Y[v72] = (MTLBuffer *)v76;

          if (!v10->_uniforms_Y[v72]) {
            break;
          }
          v82 = v10->_uniformsHeap;
          uint64_t v83 = objc_msgSend_resourceOptions(v82, v79, v80, v81);
          uint64_t v85 = objc_msgSend_newBufferWithLength_options_(v82, v84, 16, v83);
          v86 = (void *)*((void *)v77 + 26);
          *((void *)v77 + 26) = v85;

          if (!*((void *)v77 + 26)) {
            break;
          }
          if (++v72 == 20)
          {
            int v87 = 0;
            goto LABEL_24;
          }
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
LABEL_24:

    if (v87) {
      goto LABEL_25;
    }
LABEL_28:
    v88 = v10;
    goto LABEL_29;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  if (!FigSignalErrorAt()) {
    goto LABEL_28;
  }
LABEL_25:
  v88 = 0;
LABEL_29:
  v89 = v88;

  return v89;
}

+ (int)prewarmShaders:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  id v6 = 0;
  char v7 = 1;
LABEL_2:
  char v8 = 0;
  char v9 = v7;
  char v10 = 1;
  while (1)
  {
    v11 = v6;
    char v12 = v10;
    id v6 = objc_msgSend_compileShader_lumaWrite_chromaWrite_(PyramidStageShared_NRF, v3, (uint64_t)v4, v5 & 1, v8 & 1);

    if (!v6) {
      break;
    }
    char v10 = 0;
    char v8 = 1;
    if ((v12 & 1) == 0)
    {
      char v7 = 0;
      char v5 = 1;
      if (v9) {
        goto LABEL_2;
      }
      if (!objc_msgSend_isRec709DownsampleSupported(PyramidStageShared_NRF, v3, v13, v14))
      {
        char v17 = v6;
        goto LABEL_13;
      }
      uint64_t v16 = 0;
      while (1)
      {
        char v17 = objc_msgSend_compileShader_kernelType_(PyramidStageShared_NRF, v15, (uint64_t)v4, v16);

        if (!v17) {
          goto LABEL_12;
        }
        uint64_t v16 = (v16 + 1);
        id v6 = v17;
        if (v16 == 12) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  fig_log_get_emitter();
  FigDebugAssert3();
  FigSignalErrorAt();
  char v17 = 0;
LABEL_13:

  return 0;
}

- (int)setResourcesWithPyramid:(id)a3
{
  char v5 = (char *)a3;
  p_pyr = &self->_pyr;
  objc_storeStrong((id *)&self->_pyr, a3);
  pyr = self->_pyr;
  int levels = pyr->levels;
  if (levels >= 20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }
  else if (self->_forceHW)
  {
    int v9 = 0;
  }
  else
  {
    if (levels < 1)
    {
      BOOL v12 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      v11 = v5 + 664;
      BOOL v12 = 1;
      do
      {
        if (v12
          && !v11[v10]
          && (uint64_t v13 = *(__CVBuffer **)&v11[8 * v10 - 648]) != 0
          && (OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v13), pyr = *p_pyr, PixelFormatType == 875704422)
          && (char WidthOfPlane = CVPixelBufferGetWidthOfPlane(pyr->pixelBuffer[v10], 0),
              pyr = *p_pyr,
              (WidthOfPlane & 1) == 0))
        {
          BOOL v12 = (CVPixelBufferGetHeightOfPlane(pyr->pixelBuffer[v10], 0) & 1) == 0;
          pyr = *p_pyr;
        }
        else
        {
          BOOL v12 = 0;
        }
        ++v10;
      }
      while (v10 < pyr->levels);
    }
    int v9 = 0;
    self->_conf.use_m2m = v12;
  }

  return v9;
}

- (BOOL)useM2M
{
  return self->_conf.use_m2m;
}

- (int)runM2MWithFilters:(PyramidFilterParams *)a3
{
  uint64_t v4 = 0;
  p_chroma_param = &a3->chroma_param;
  do
  {
    pyr = self->_pyr;
    if (v4 >= pyr->levels - 1) {
      return 0;
    }
    char v7 = &pyr->super.isa + v4;
    if (!v7[2]) {
      break;
    }
    char v8 = v7[3];
    if (!v8 || CVPixelBufferGetPixelFormatType(v8) != 875704422) {
      break;
    }
    int v12 = *((_DWORD *)p_chroma_param - 2);
    uint64_t v13 = v12 == 2 ? 2 : v12 == 1;
    *(float *)&double v10 = *(p_chroma_param - 1);
    *(float *)&double v11 = *p_chroma_param;
    if (objc_msgSend_setCustomFilter_alignment_src_dst_luma_param_chroma_param_(self->_m2mController, v9, v13, self->_conf.compensate_gpu_shift, self->_pyr->pixelBuffer[v4], self->_pyr->pixelBuffer[v4 + 1], v10, v11))break; {
    v15 = self->_pyr;
    }
    BOOL v16 = v4 == v15->levels - 2 && (unint64_t)self->_conf.do_sync_at_end;
    int v17 = objc_msgSend_downsample_dst_sync_m2m_(self->_m2mController, v14, (uint64_t)v15->pixelBuffer[v4], (uint64_t)v15->pixelBuffer[v4 + 1], v16);
    p_chroma_param += 3;
    ++v4;
  }
  while (!v17);
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)runGPUWithFilters:(PyramidFilterParams *)a3 doShift:(BOOL)a4
{
  char v5 = self;
  pyr = self->_pyr;
  if (pyr->levels >= 2)
  {
    uint64_t v7 = 0;
    int32x2_t v8 = 0;
    if (a4) {
      *(float *)v8.i32 = 1.0;
    }
    int32x2_t v9 = vdup_lane_s32(v8, 0);
    p_float chroma_param = &a3->chroma_param;
    while (*((_DWORD *)p_chroma_param - 2) == 1)
    {
      double v11 = (id *)(&v5->super.isa + v7);
      id v12 = v11[6];
      uint64_t v16 = objc_msgSend_contents(v12, v13, v14, v15);
      *(_DWORD *)uint64_t v16 = (int)*(p_chroma_param - 1);
      *(int32x2_t *)(v16 + 8) = v9;
      id v17 = v11[26];
      uint64_t v21 = objc_msgSend_contents(v17, v18, v19, v20);
      *(_DWORD *)uint64_t v21 = (int)*p_chroma_param;
      *(int32x2_t *)(v21 + 8) = v9;
      ++v7;
      pyr = v5->_pyr;
      p_chroma_param += 3;
      if (v7 >= pyr->levels - 1) {
        goto LABEL_7;
      }
    }
LABEL_75:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
LABEL_7:
  uint64_t v22 = objc_msgSend_pixelFormat(pyr->textureY[0], a2, (uint64_t)a3, a4);
  uint64_t v26 = v22;
  BOOL v27 = v22 == 576 || v22 == 588;
  int band0ColorSpace = v5->_band0ColorSpace;
  BOOL v29 = v27 || band0ColorSpace == 2;
  uint64_t v30 = v29;
  v224 = v5;
  uint64_t v225 = v30;
  if (v29)
  {
    v31 = objc_msgSend_commandQueue(v5->_metal, v23, v24, v25);
    v35 = objc_msgSend_commandBuffer(v31, v32, v33, v34);

    if (!v35) {
      goto LABEL_75;
    }
    uint64_t v36 = v5->_pyr;
    if (BYTE3(v5[1]._uniforms_Y[11]) && (textureYCbCrBand0 = v36->textureYCbCrBand0) != 0)
    {
      v222 = textureYCbCrBand0;
      v38 = 0;
      int v220 = 2;
      int v39 = 8;
    }
    else
    {
      v222 = v36->textureY[0];
      v38 = v5->_pyr->textureUV[0];
      int v220 = -1;
      int v39 = 5;
    }
    uint64_t v41 = v38;
    v42 = v5->_pyr->textureY[1];
    v43 = v5->_pyr->textureUV[1];
    float luma_param = a3->luma_param;
    float chroma_param = a3->chroma_param;
    uint64_t v52 = objc_msgSend_computeCommandEncoder(v35, v46, v47, v48);
    if (v52)
    {
      int v218 = band0ColorSpace;
      unsigned int v53 = luma_param;
      long long v54 = *(_OWORD *)&v5[1]._uniforms_Y[7];
      long long v55 = *(_OWORD *)&v5[1]._uniforms_Y[9];
      long long v56 = *(_OWORD *)&v5[1]._uniforms_Y[3];
      long long v242 = *(_OWORD *)&v5[1]._uniforms_Y[5];
      long long v243 = v54;
      long long v57 = *(_OWORD *)&v5[1]._uniforms_Y[11];
      long long v244 = v55;
      long long v245 = v57;
      long long v58 = *(_OWORD *)&v5[1]._uniformsHeap;
      long long v59 = *(_OWORD *)&v5[1]._uniforms_Y[1];
      long long v60 = *(_OWORD *)&v5[1]._conf.use_m2m;
      long long v238 = *(_OWORD *)&v5[1]._m2mController;
      long long v239 = v58;
      long long v240 = v59;
      long long v241 = v56;
      long long v61 = *(_OWORD *)&v5->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias;
      long long v62 = *(_OWORD *)&v5->_colorSpaceConversionParameters.outputToLinearYCbCr;
      long long v63 = *(_OWORD *)&v5->_colorSpaceConversionParameters.transferFunctionFwd.linearScale;
      long long v234 = *(_OWORD *)&v5->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower;
      long long v235 = v61;
      if (chroma_param == 5) {
        int v64 = 2;
      }
      else {
        int v64 = 1;
      }
      if (chroma_param == 7) {
        int v65 = 3;
      }
      else {
        int v65 = v64;
      }
      int v212 = v65;
      if (v53 == 5) {
        int v66 = 2;
      }
      else {
        int v66 = 1;
      }
      uint64_t v67 = v43;
      v207 = v35;
      if (v53 == 7) {
        int v68 = 3;
      }
      else {
        int v68 = v66;
      }
      unsigned int v209 = v39 + v65;
      uint64_t v246 = 0;
      uint64_t v247 = 0;
      long long v236 = v62;
      long long v237 = v60;
      long long v233 = v63;
      LOBYTE(v246) = v5->_conf.compensate_gpu_shift;
      uint64_t v69 = objc_msgSend_sharedInstance(PyramidStageShared_NRF, v49, v50, v51);
      uint64_t v71 = objc_msgSend_getRec709DownsamplePipelineState_kernelType_((void *)v69, v70, (uint64_t)v5->_metal, (v220 + v68));

      objc_msgSend_setTexture_atIndex_(v52, v72, (uint64_t)v222, 0);
      objc_msgSend_setTexture_atIndex_(v52, v73, (uint64_t)v41, 1);
      objc_msgSend_setTexture_atIndex_(v52, v74, (uint64_t)v42, 2);
      objc_msgSend_setBytes_length_atIndex_(v52, v75, (uint64_t)&v233, 224, 0);
      v210 = (void *)v71;
      objc_msgSend_setComputePipelineState_(v52, v76, v71, v77);
      objc_msgSend_setImageblockWidth_height_(v52, v78, 32, 32);
      LODWORD(v69) = v68 + (v68 & 1);
      unsigned int v79 = 16 - v69;
      LODWORD(v69) = v69 ^ 0xF;
      uint64_t v83 = (v69 + objc_msgSend_width(v42, v80, v81, v82)) / v79;
      v215 = v42;
      uint64_t v87 = (v69 + objc_msgSend_height(v42, v84, v85, v86)) / v79;
      v35 = v207;
      v232[0] = v83;
      v232[1] = v87;
      v232[2] = 1;
      int64x2_t v205 = vdupq_n_s64(0x10uLL);
      int64x2_t v230 = v205;
      uint64_t v231 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v52, v88, (uint64_t)v232, (uint64_t)&v230);
      v92 = objc_msgSend_sharedInstance(PyramidStageShared_NRF, v89, v90, v91);
      simd_float4 v94 = objc_msgSend_getRec709DownsamplePipelineState_kernelType_(v92, v93, (uint64_t)v5->_metal, v209);

      objc_msgSend_setTexture_atIndex_(v52, v95, (uint64_t)v222, 0);
      objc_msgSend_setTexture_atIndex_(v52, v96, (uint64_t)v41, 1);
      objc_msgSend_setTexture_atIndex_(v52, v97, (uint64_t)v43, 2);
      objc_msgSend_setBytes_length_atIndex_(v52, v98, (uint64_t)&v233, 224, 0);
      objc_msgSend_setComputePipelineState_(v52, v99, (uint64_t)v94, v100);
      objc_msgSend_setImageblockWidth_height_(v52, v101, 32, 32);
      unsigned int v102 = 16 - v212;
      LODWORD(v92) = v212 ^ 0xF;
      uint64_t v106 = ((v212 ^ 0xF) + objc_msgSend_width(v67, v103, v104, v105)) / (16 - v212);
      v213 = v67;
      v229[0] = v106;
      v229[1] = (v92 + objc_msgSend_height(v67, v107, v108, v109)) / v102;
      v229[2] = 1;
      int64x2_t v227 = v205;
      uint64_t v228 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v52, v110, (uint64_t)v229, (uint64_t)&v227);
      objc_msgSend_endEncoding(v52, v111, v112, v113);
      if (*MEMORY[0x263F00E10])
      {
        v117 = objc_msgSend_commandQueue(v207, v114, v115, v116);
        v121 = objc_msgSend_commandBuffer(v117, v118, v119, v120);

        objc_msgSend_setLabel_(v121, v122, @"KTRACE_MTLCMDBUF", v123);
        objc_msgSend_addCompletedHandler_(v121, v124, (uint64_t)&unk_270E34028, v125);
        objc_msgSend_commit(v121, v126, v127, v128);
        objc_msgSend_addCompletedHandler_(v207, v129, (uint64_t)&unk_270E34048, v130);
      }
      objc_msgSend_commit(v207, v114, v115, v116);

      int v40 = 0;
      char v5 = v224;
      int band0ColorSpace = v218;
      v42 = v215;
      v43 = v213;
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v203 = v206;
      int v201 = 0;
      FigDebugAssert3();
      int v40 = FigSignalErrorAt();
    }

    if (!v52) {
      return v40;
    }
  }
  else
  {
    int v40 = 0;
  }
  v131 = objc_msgSend_commandQueue(v5->_metal, v23, v24, v25, v201, v203);
  uint64_t v135 = objc_msgSend_commandBuffer(v131, v132, v133, v134);

  v223 = (void *)v135;
  if (!v135)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v208 = FigSignalErrorAt();
    goto LABEL_73;
  }
  int v208 = v40;
  uint64_t v139 = 0;
  LODWORD(v140) = v26 == 588;
  if (v140 <= (v26 == 576)) {
    LODWORD(v140) = v26 == 576;
  }
  if (v140 <= (band0ColorSpace == 2)) {
    uint64_t v140 = band0ColorSpace == 2;
  }
  else {
    uint64_t v140 = v140;
  }
  uint64_t v219 = v140;
  uint64_t v221 = v225 - 1;
  uint64_t v214 = (uint64_t)&v5->_uniforms_Y[v225 + 19];
  uint64_t v216 = 8 * (v225 - 1);
  uint64_t v217 = 8 * v140;
  uint64_t v211 = (uint64_t)&v5->_uniforms_Y[(unint64_t)v217 / 8];
  while (1)
  {
    uint64_t v141 = v221 + v139;
    v142 = v5->_pyr;
    uint64_t v143 = v142->levels - 1;
    if (v221 + v139 >= v143) {
      break;
    }
    uint64_t v144 = v219 + v139;
    if (v219 + v139 >= v143) {
      v145 = 0;
    }
    else {
      v145 = *(MTLTexture **)((char *)&v142->textureY[v139 + 1] + v217);
    }
    id v146 = v145;
    if (v141 < v225) {
      v147 = 0;
    }
    else {
      v147 = *(MTLTexture **)((char *)&v5->_pyr->textureUV[v139 + 1] + v216);
    }
    id v148 = v147;
    v152 = objc_msgSend_sharedInstance(PyramidStageShared_NRF, v149, v150, v151);
    v154 = objc_msgSend_getPipeline_lumaWrite_chromaWrite_(v152, v153, (uint64_t)v5->_metal, v144 < v143, v141 >= v225);

    if (v144 >= v143)
    {
      unint64_t v158 = (unint64_t)(objc_msgSend_width(v148, v155, v156, v157) + 1) >> 1;
      uint64_t v162 = objc_msgSend_height(v148, v166, v167, v168, v202, v204);
    }
    else
    {
      unint64_t v158 = objc_msgSend_width(v146, v155, v156, v157);
      uint64_t v162 = objc_msgSend_height(v146, v159, v160, v161, v202, v204);
    }
    uint64_t v169 = v162;
    v170 = objc_msgSend_computeCommandEncoder(v223, v163, v164, v165);
    v173 = v170;
    if (!v170)
    {
LABEL_69:
      fig_log_get_emitter();
      uint64_t v204 = v206;
      LODWORD(v202) = 0;
      FigDebugAssert3();
      int v208 = FigSignalErrorAt();
      char v180 = 0;
      goto LABEL_67;
    }
    objc_msgSend_setComputePipelineState_(v170, v171, (uint64_t)v154, v172);
    objc_msgSend_setImageblockWidth_height_(v173, v174, 32, 32);
    if (v144 < v143)
    {
      uint64_t v176 = *(uint64_t *)((char *)&v224->_pyr->textureY[v139] + v217);
      if (!v176) {
        goto LABEL_69;
      }
      objc_msgSend_setTexture_atIndex_(v173, v175, v176, 0);
      if (!v146) {
        goto LABEL_69;
      }
      objc_msgSend_setTexture_atIndex_(v173, v177, (uint64_t)v146, 2);
    }
    if (v141 >= v225)
    {
      v178 = v224->_pyr;
      if (!*(MTLTexture **)((char *)&v178->textureUV[v139 + 1] + v216)) {
        goto LABEL_69;
      }
      objc_msgSend_setTexture_atIndex_(v173, v175, (uint64_t)v178->textureUV[v141], 1);
      if (!v148) {
        goto LABEL_69;
      }
      objc_msgSend_setTexture_atIndex_(v173, v179, (uint64_t)v148, 3);
    }
    objc_msgSend_setBuffer_offset_atIndex_(v173, v175, *(void *)(v211 + 8 * v139), 0, 0);
    char v180 = 1;
    objc_msgSend_setBuffer_offset_atIndex_(v173, v181, *(void *)(v214 + 8 * v139), 0, 1);
    v226[0] = v158;
    v226[1] = v169;
    v226[2] = 1;
    long long v233 = xmmword_263117D00;
    *(void *)&long long v234 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v173, v182, (uint64_t)v226, (uint64_t)&v233);
    objc_msgSend_endEncoding(v173, v183, v184, v185);
LABEL_67:

    ++v139;
    char v5 = v224;
    if ((v180 & 1) == 0) {
      goto LABEL_73;
    }
  }
  if (*MEMORY[0x263F00E10])
  {
    v186 = objc_msgSend_commandQueue(v223, v136, v137, v138);
    v190 = objc_msgSend_commandBuffer(v186, v187, v188, v189);

    objc_msgSend_setLabel_(v190, v191, @"KTRACE_MTLCMDBUF", v192);
    objc_msgSend_addCompletedHandler_(v190, v193, (uint64_t)&unk_270E34068, v194);
    objc_msgSend_commit(v190, v195, v196, v197);
    objc_msgSend_addCompletedHandler_(v223, v198, (uint64_t)&unk_270E34088, v199);
  }
  objc_msgSend_commit(v223, v136, v137, v138, v202, v204);
LABEL_73:

  return v208;
}

- (int)runWithFilters:(PyramidFilterParams *)a3
{
  pyr = self->_pyr;
  if (pyr)
  {
    if (pyr->levels >= 2)
    {
      uint64_t v7 = 0;
      do
      {
        int32x2_t v8 = &pyr->super.isa + v7++;
        CVBufferPropagateAttachments(v8[2], v8[3]);
        pyr = self->_pyr;
      }
      while (v7 < pyr->levels - 1);
    }
    if (self->_conf.use_m2m)
    {
      if (objc_msgSend_runM2MWithFilters_(self, a2, (uint64_t)a3, v3)) {
        goto LABEL_10;
      }
      return 0;
    }
    if (!objc_msgSend_runGPUWithFilters_doShift_(self, a2, (uint64_t)a3, self->_conf.compensate_gpu_shift)) {
      return 0;
    }
  }
LABEL_10:
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)setColorSpace:(int)a3 withParams:(const ColorSpaceConversionParameters *)a4
{
  self->_int band0ColorSpace = a3;
  if (a4)
  {
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.linearScale = *(_OWORD *)&a4->transferFunctionFwd.linearScale;
    long long v4 = *(_OWORD *)&a4->transferFunctionFwd.nonLinearPower;
    long long v5 = *(_OWORD *)&a4->transferFunctionInv.nonLinearBias;
    long long v6 = *(_OWORD *)&a4[1].transferFunctionFwd.nonLinearBias;
    *(_OWORD *)&self->_colorSpaceConversionParameters.outputToLinearYCbCr = *(_OWORD *)&a4->outputToLinearYCbCr;
    *(_OWORD *)&self[1]._conf.use_m2m = v6;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower = v4;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias = v5;
    long long v7 = *(_OWORD *)&a4[1].transferFunctionInv.nonLinearScale;
    long long v8 = *(_OWORD *)&a4[1].finalScale;
    long long v9 = *(_OWORD *)&a4[2].transferFunctionInv.linearThreshold;
    *(_OWORD *)&self[1]._uniforms_Y[1] = *(_OWORD *)&a4[2].transferFunctionFwd.nonLinearScale;
    *(_OWORD *)&self[1]._uniforms_Y[3] = v9;
    *(_OWORD *)&self[1]._m2mController = v7;
    *(_OWORD *)&self[1]._uniformsHeap = v8;
    long long v10 = *(_OWORD *)&a4[2].finalScaleFwd;
    long long v11 = *(_OWORD *)&a4[3].transferFunctionFwd.linearThreshold;
    long long v12 = *(_OWORD *)&a4[3].transferFunctionInv.nonLinearPower;
    *(_OWORD *)&self[1]._uniforms_Y[9] = *(_OWORD *)&a4[3].transferFunctionInv.linearScale;
    *(_OWORD *)&self[1]._uniforms_Y[11] = v12;
    *(_OWORD *)&self[1]._uniforms_Y[5] = v10;
    *(_OWORD *)&self[1]._uniforms_Y[7] = v11;
  }
}

- (void).cxx_destruct
{
  for (uint64_t i = 360; i != 200; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 40);
  objc_storeStrong((id *)&self->_uniformsHeap, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_m2mController, 0);

  objc_storeStrong((id *)&self->_pyr, 0);
}

@end