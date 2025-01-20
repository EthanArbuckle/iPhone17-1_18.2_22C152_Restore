@interface LearnedNRMetalStage
+ (int)prewarmShadersWithCommandQueue:(id)a3;
+ (void)initialize;
- (LearnedNRMetalStage)initWithCommandQueue:(id)a3 cameraInfo:(id)a4 tuningParameters:(id)a5 isQuadra:(BOOL)a6;
- (int)_compileShaders;
- (int)clearBuffer:(__CVBuffer *)a3;
- (int)createRawTile:(__CVBuffer *)a3 fromInputRaw:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:;
- (int)createRawTile:(__CVBuffer *)a3 fromInputYuv:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:;
- (int)deviceGeneration;
- (int)updateParametersFromMetadata:(id)a3 lscSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origRawInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:;
- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origYuvInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:;
- (void)_bindYuvBuffer:(__CVBuffer *)a3 toLumaTexture:(id *)a4 chromaTexture:(id *)a5 withUsage:(unint64_t)a6;
- (void)setDeviceGeneration:(int)a3;
@end

@implementation LearnedNRMetalStage

+ (void)initialize
{
}

+ (int)prewarmShadersWithCommandQueue:(id)a3
{
  id v3 = a3;
  v4 = [LearnedNRMetalStage alloc];
  isQuadra = objc_msgSend_initWithCommandQueue_cameraInfo_tuningParameters_isQuadra_(v4, v5, (uint64_t)v3, 0, 0, 0);

  if (isQuadra) {
    int v7 = 0;
  }
  else {
    int v7 = -12786;
  }

  return v7;
}

- (LearnedNRMetalStage)initWithCommandQueue:(id)a3 cameraInfo:(id)a4 tuningParameters:(id)a5 isQuadra:(BOOL)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v54.receiver = self;
  v54.super_class = (Class)LearnedNRMetalStage;
  id v12 = [(LearnedNRMetalStage *)&v54 init];
  if (v12)
  {
    v13 = (void *)MEMORY[0x263F086E0];
    uint64_t v14 = objc_opt_class();
    v17 = objc_msgSend_bundleForClass_(v13, v15, v14, v16);
    id v18 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v18, v19, (uint64_t)v17, (uint64_t)v9);
    v21 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = inited;

    if (!*((void *)v12 + 1) || objc_msgSend__compileShaders(v12, v22, v23, v24))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v45 = 0;
      goto LABEL_15;
    }
    v47 = v17;
    id v48 = v9;
    uint64_t v49 = (uint64_t)v10;
    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v26 = v11;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v50, (uint64_t)v55, 16);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          v33 = objc_alloc_init(LearnedNRTuningParams);
          v36 = objc_msgSend_objectForKeyedSubscript_(v26, v34, v32, v35);
          objc_msgSend_readPlist_(v33, v37, (uint64_t)v36, v38);

          objc_msgSend_setObject_forKeyedSubscript_(v25, v39, (uint64_t)v33, v32);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v40, (uint64_t)&v50, (uint64_t)v55, 16);
      }
      while (v29);
    }

    objc_storeStrong((id *)v12 + 44, v25);
    id v10 = (id)v49;
    if (v49)
    {
      v41 = [LSCGainsPlist alloc];
      uint64_t v43 = objc_msgSend_initWithDictionary_metal_(v41, v42, v49, *((void *)v12 + 1));
      v44 = (void *)*((void *)v12 + 6);
      *((void *)v12 + 6) = v43;

      if (!*((void *)v12 + 6))
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        v45 = 0;
        id v9 = v48;
        goto LABEL_15;
      }
    }

    id v9 = v48;
  }
  v45 = (LearnedNRMetalStage *)v12;
LABEL_15:

  return v45;
}

- (int)_compileShaders
{
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, a2, @"lumaChromaFullToRawTile", 0);
  id v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  lumaChromaFullToRawTilePipelineState = self->_lumaChromaFullToRawTilePipelineState;
  self->_lumaChromaFullToRawTilePipelineState = v3;

  if (self->_lumaChromaFullToRawTilePipelineState)
  {
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v5, @"rgbTileToLumaTileAndChromaFull", 0);
    v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    rgbTileToLumaTileAndChromaFullPipelineState = self->_rgbTileToLumaTileAndChromaFullPipelineState;
    self->_rgbTileToLumaTileAndChromaFullPipelineState = v6;

    if (self->_rgbTileToLumaTileAndChromaFullPipelineState)
    {
      objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v8, @"lumaAddbackAndWriteToFull", 0);
      id v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      lumaAddbackAndWriteToFullPipelineState = self->_lumaAddbackAndWriteToFullPipelineState;
      self->_lumaAddbackAndWriteToFullPipelineState = v9;

      if (self->_lumaAddbackAndWriteToFullPipelineState)
      {
        objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v11, @"learnedNRClearTexture", 0);
        id v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        clearTexturePipelineState = self->_clearTexturePipelineState;
        self->_clearTexturePipelineState = v12;

        if (self->_clearTexturePipelineState) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  v6 = objc_msgSend_commandQueue(self->_metalContext, a2, (uint64_t)a3, v3);
  id v10 = objc_msgSend_commandBuffer(v6, v7, v8, v9);

  uint64_t v14 = objc_msgSend_computeCommandEncoder(v10, v11, v12, v13);
  id v67 = 0;
  id v68 = 0;
  objc_msgSend__bindYuvBuffer_toLumaTexture_chromaTexture_withUsage_(self, v15, (uint64_t)a3, (uint64_t)&v68, &v67, 22);
  id v16 = v68;
  id v17 = v67;
  v20 = v17;
  if (v16 && v17)
  {
    objc_msgSend_setComputePipelineState_(v14, v18, (uint64_t)self->_clearTexturePipelineState, v19);
    objc_msgSend_setTexture_atIndex_(v14, v21, (uint64_t)v16, 0);
    unint64_t v25 = objc_msgSend_threadExecutionWidth(self->_clearTexturePipelineState, v22, v23, v24);
    unint64_t v29 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_clearTexturePipelineState, v26, v27, v28) / v25;
    v66[0] = objc_msgSend_width(v16, v30, v31, v32);
    v66[1] = objc_msgSend_height(v16, v33, v34, v35);
    v66[2] = 1;
    v65[0] = v25;
    v65[1] = v29;
    v65[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v14, v36, (uint64_t)v66, (uint64_t)v65);
    objc_msgSend_setComputePipelineState_(v14, v37, (uint64_t)self->_clearTexturePipelineState, v38);
    objc_msgSend_setTexture_atIndex_(v14, v39, (uint64_t)v20, 0);
    unint64_t v43 = objc_msgSend_threadExecutionWidth(self->_clearTexturePipelineState, v40, v41, v42);
    unint64_t v47 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_clearTexturePipelineState, v44, v45, v46) / v43;
    v64[0] = objc_msgSend_width(v20, v48, v49, v50);
    v64[1] = objc_msgSend_height(v20, v51, v52, v53);
    v64[2] = 1;
    v63[0] = v43;
    v63[1] = v47;
    v63[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v14, v54, (uint64_t)v64, (uint64_t)v63);
    objc_msgSend_endEncoding(v14, v55, v56, v57);
    objc_msgSend_commit(v10, v58, v59, v60);
    int v61 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v61 = FigSignalErrorAt();
  }

  return v61;
}

- (int)createRawTile:(__CVBuffer *)a3 fromInputYuv:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:
{
  v6 = v5;
  int v59 = (int)a5;
  id v10 = objc_msgSend_commandQueue(self->_metalContext, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v14 = objc_msgSend_commandBuffer(v10, v11, v12, v13);

  objc_msgSend_setLabel_(v14, v15, @"createRawTile", v16);
  v20 = objc_msgSend_computeCommandEncoder(v14, v17, v18, v19);
  id v57 = 0;
  id v58 = 0;
  objc_msgSend__bindYuvBuffer_toLumaTexture_chromaTexture_withUsage_(self, v21, (uint64_t)a4, (uint64_t)&v58, &v57, 17);
  id v22 = v58;
  id v23 = v57;
  unint64_t v25 = v23;
  if (!v22 || !v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
    uint64_t v28 = 0;
    goto LABEL_7;
  }
  uint64_t v28 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v24, (uint64_t)a3, 25, 23, 0);
  if (!v28)
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
    goto LABEL_7;
  }
  objc_msgSend_setComputePipelineState_(v20, v26, (uint64_t)self->_lumaChromaFullToRawTilePipelineState, v27);
  objc_msgSend_setTexture_atIndex_(v20, v29, (uint64_t)v22, 0);
  objc_msgSend_setTexture_atIndex_(v20, v30, (uint64_t)v25, 1);
  objc_msgSend_setTexture_atIndex_(v20, v31, (uint64_t)v28, 2);
  objc_msgSend_setTexture_atIndex_(v20, v32, (uint64_t)self->_lscGainsTex, 3);
  objc_msgSend_setBytes_length_atIndex_(v20, v33, (uint64_t)&v59, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v34, (uint64_t)self->_anon_40, 288, 1);
  unint64_t v38 = objc_msgSend_threadExecutionWidth(self->_lumaChromaFullToRawTilePipelineState, v35, v36, v37);
  unint64_t v42 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_lumaChromaFullToRawTilePipelineState, v39, v40, v41) / v38;
  v56[0] = objc_msgSend_width(v28, v43, v44, v45);
  v56[1] = objc_msgSend_height(v28, v46, v47, v48) / 5uLL;
  v56[2] = 1;
  v55[0] = v38;
  v55[1] = v42;
  v55[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v20, v49, (uint64_t)v56, (uint64_t)v55);
  objc_msgSend_endEncoding(v20, v50, v51, v52);
  if (!v14)
  {
    fig_log_get_emitter();
    goto LABEL_11;
  }
  int v53 = 0;
  if (v6) {
    void *v6 = v14;
  }
LABEL_7:

  return v53;
}

- (int)createRawTile:(__CVBuffer *)a3 fromInputRaw:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF488], @"Not supported", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origYuvInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:
{
  __int32 v9 = (int)a8;
  v110[0] = (int)a8;
  v8.i16[0] = v111;
  v8.i16[2] = v112;
  int32x2_t v94 = v8;
  uint64_t v16 = objc_msgSend_commandQueue(self->_metalContext, a2, (uint64_t)a3, (uint64_t)a4);
  v20 = objc_msgSend_commandBuffer(v16, v17, v18, v19);

  uint64_t v24 = objc_msgSend_computeCommandEncoder(v20, v21, v22, v23);
  id v108 = 0;
  id v109 = 0;
  objc_msgSend__bindYuvBuffer_toLumaTexture_chromaTexture_withUsage_(self, v25, (uint64_t)a4, (uint64_t)&v109, &v108, 22);
  id v26 = v109;
  id v27 = v108;
  unint64_t v29 = v27;
  v95 = v26;
  if (!v26 || !v27)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    v33 = 0;
LABEL_16:
    v96 = 0;
LABEL_18:
    uint64_t v35 = 0;
LABEL_23:
    v90 = v20;
    goto LABEL_13;
  }
  id v106 = 0;
  id v107 = 0;
  objc_msgSend__bindYuvBuffer_toLumaTexture_chromaTexture_withUsage_(self, v28, (uint64_t)a7, (uint64_t)&v107, &v106, 17);
  id v30 = v107;
  id v31 = v106;
  v33 = v31;
  v96 = v30;
  if (!v30)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    goto LABEL_16;
  }
  if (!v31)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    goto LABEL_18;
  }
  uint64_t v35 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v32, (uint64_t)a3, 25, 17, 0);
  if (!v35)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    a5 = 0;
LABEL_21:
    a6 = 0;
    goto LABEL_23;
  }
  if (!a5
    || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v34, (uint64_t)a5, 25, 23, 0), (a5 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    goto LABEL_21;
  }
  if (!a6
    || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v36, (uint64_t)a6, 25, 23, 0), (a6 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    goto LABEL_23;
  }
  v39.i32[0] = v113;
  int32x2_t v41 = (int32x2_t)vmovl_u16(v39).u64[0];
  v40.i32[0] = v9;
  int32x2_t v42 = vdup_n_s32(0xFFFEu);
  int32x2_t v43 = vadd_s32((int32x2_t)*(_OWORD *)&vmovl_u16(v40), v42);
  v105[1] = v43.i16[2];
  v105[0] = v43.i16[0];
  int32x2_t v44 = vadd_s32(v94, v42);
  v104[1] = v44.i16[2];
  v104[0] = v44.i16[0];
  uint32x2_t v45 = (uint32x2_t)vand_s8((int8x8_t)v41, (int8x8_t)0xFFFF0000FFFFLL);
  int32x2_t v46 = vadd_s32(v41, (int32x2_t)0x400000004);
  v41.i32[0] = v113;
  int32x2_t v47 = vadd_s32(v41, (int32x2_t)0x200000002);
  v44.i32[0] = 131074;
  v44.i16[2] = v47.i16[0];
  v44.i16[3] = v47.i16[2];
  int32x2_t v103 = v44;
  objc_msgSend_setComputePipelineState_(v24, v37, (uint64_t)self->_rgbTileToLumaTileAndChromaFullPipelineState, v38);
  objc_msgSend_setTexture_atIndex_(v24, v48, (uint64_t)v35, 0);
  objc_msgSend_setTexture_atIndex_(v24, v49, (uint64_t)v30, 1);
  objc_msgSend_setTexture_atIndex_(v24, v50, (uint64_t)self->_lscGainsTex, 2);
  objc_msgSend_setTexture_atIndex_(v24, v51, (uint64_t)a5, 3);
  objc_msgSend_setTexture_atIndex_(v24, v52, (uint64_t)a6, 4);
  objc_msgSend_setTexture_atIndex_(v24, v53, (uint64_t)v29, 5);
  objc_msgSend_setBytes_length_atIndex_(v24, v54, (uint64_t)v105, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v24, v55, (uint64_t)v104, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v24, v56, (uint64_t)&v103, 8, 2);
  objc_msgSend_setBytes_length_atIndex_(v24, v57, (uint64_t)self->_anon_40, 288, 3);
  unint64_t v61 = objc_msgSend_threadExecutionWidth(self->_rgbTileToLumaTileAndChromaFullPipelineState, v58, v59, v60);
  unint64_t v65 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_rgbTileToLumaTileAndChromaFullPipelineState, v62, v63, v64);
  v66.i64[0] = v46.u32[0];
  v66.i64[1] = v46.u32[1];
  v67.i64[0] = 0xFFFFLL;
  v67.i64[1] = 0xFFFFLL;
  int8x16_t v101 = vandq_s8(v66, v67);
  uint64_t v102 = 1;
  v100[0] = v61;
  v100[1] = v65 / v61;
  v100[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v24, v68, (uint64_t)&v101, (uint64_t)v100);
  uint32x2_t v69 = vshr_n_u32(v45, 1uLL);
  objc_msgSend_setComputePipelineState_(v24, v70, (uint64_t)self->_lumaAddbackAndWriteToFullPipelineState, v71);
  objc_msgSend_setTexture_atIndex_(v24, v72, (uint64_t)a5, 0);
  objc_msgSend_setTexture_atIndex_(v24, v73, (uint64_t)a6, 1);
  objc_msgSend_setTexture_atIndex_(v24, v74, (uint64_t)v95, 2);
  objc_msgSend_setBytes_length_atIndex_(v24, v75, (uint64_t)v110, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v24, v76, (uint64_t)&v111, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v24, v77, (uint64_t)self->_anon_40, 288, 2);
  unint64_t v81 = objc_msgSend_threadExecutionWidth(self->_lumaAddbackAndWriteToFullPipelineState, v78, v79, v80);
  unint64_t v85 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_lumaAddbackAndWriteToFullPipelineState, v82, v83, v84);
  v66.i64[0] = v69.u32[0];
  v66.i64[1] = v69.u32[1];
  int8x16_t v98 = v66;
  uint64_t v99 = 1;
  v97[0] = v81;
  v97[1] = v85 / v81;
  v97[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v24, v86, (uint64_t)&v98, (uint64_t)v97);
  objc_msgSend_endEncoding(v24, v87, v88, v89);
  v90 = v20;
  if (v20)
  {
    v91 = v114;
    int v92 = 0;
    if (v114) {
      void *v91 = v20;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
  }
LABEL_13:

  return v92;
}

- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origRawInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF488], @"Not supported", 0, a6, a7, a8);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (int)updateParametersFromMetadata:(id)a3 lscSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    int v156 = FigSignalErrorAt();
    v110 = 0;
    id v68 = 0;
    v149 = 0;
    goto LABEL_56;
  }
  __int32 v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x263F2F2E0], v7);
  uint64_t v13 = v9;
  if (v9) {
    int v14 = objc_msgSend_shortValue(v9, v10, v11, v12);
  }
  else {
    int v14 = 4096;
  }
  v15 = objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x263F2F2D8], v12);

  if (v15) {
    int v19 = objc_msgSend_shortValue(v15, v16, v17, v18);
  }
  else {
    int v19 = 4096;
  }
  v20 = objc_msgSend_objectForKeyedSubscript_(v8, v16, *MEMORY[0x263F2F2D0], v18);

  if (v20) {
    int v24 = objc_msgSend_shortValue(v20, v21, v22, v23);
  }
  else {
    int v24 = 4096;
  }
  unint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v8, v21, *MEMORY[0x263F2F4F8], v23);

  if (v25) {
    int v29 = objc_msgSend_shortValue(v25, v26, v27, v28);
  }
  else {
    int v29 = 4096;
  }
  id v30 = objc_msgSend_objectForKeyedSubscript_(v8, v26, *MEMORY[0x263F2F388], v28);

  if (v30) {
    unsigned __int16 v158 = objc_msgSend_intValue(v30, v31, v32, v33);
  }
  else {
    unsigned __int16 v158 = 0;
  }
  uint64_t v34 = *MEMORY[0x263F2F2C0];
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v8, v31, *MEMORY[0x263F2F2C0], v33);

  float v39 = 0.0;
  float v40 = 0.0;
  if (v35) {
    float v40 = (float)(int)objc_msgSend_intValue(v35, v36, v37, v38) * 0.0039062;
  }
  int32x2_t v41 = objc_msgSend_objectForKeyedSubscript_(v8, v36, *MEMORY[0x263F2F700], v38);

  if (v41) {
    float v39 = (float)(int)objc_msgSend_intValue(v41, v42, v43, v44) * 0.0039062;
  }
  uint32x2_t v45 = objc_msgSend_objectForKeyedSubscript_(v8, v42, *MEMORY[0x263F2F6E8], v44);

  if (v45) {
    float v49 = (float)(int)objc_msgSend_intValue(v45, v46, v47, v48) * 0.0039062;
  }
  else {
    float v49 = 0.0;
  }
  uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v8, v46, *MEMORY[0x263F2F638], v48);

  if (v50) {
    int v54 = objc_msgSend_BOOLValue(v50, v51, v52, v53);
  }
  else {
    int v54 = 0;
  }
  v55 = objc_msgSend_objectForKeyedSubscript_(v8, v51, *MEMORY[0x263F2F630], v53);

  if (v55
    || (objc_msgSend_objectForKeyedSubscript_(v8, v56, *MEMORY[0x263F2F460], v58),
        (v55 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_floatValue(v55, v56, v57, v58);
    float v61 = v60;
  }
  else
  {
    float v61 = 1.0;
  }
  float v62 = (float)(v40 * v39) * v49;
  if (v54) {
    float v62 = v62 * exp2f(-v61);
  }
  *(float *)v59.i32 = (float)v29 * 0.00024414;
  __asm { FMOV            V3.4S, #1.0 }
  _Q3.f32[0] = (float)v14 / (float)v19;
  _Q3.f32[2] = (float)v24 / (float)v19;
  *(float32x4_t *)self->_anon_40 = vdivq_f32(_Q3, (float32x4_t)vdupq_lane_s32(v59, 0));
  id v68 = objc_msgSend_objectForKeyedSubscript_(v8, v56, *MEMORY[0x263F2F5C8], v58);
  self->_anon_40[272] = objc_msgSend_isEqualToString_(v68, v69, *MEMORY[0x263F2EF18], v70);
  uint64_t v71 = *MEMORY[0x263F2F608];
  id v72 = v8;
  v75 = objc_msgSend_objectForKeyedSubscript_(v72, v73, v71, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  float v80 = v79 * 0.000015259;

  uint64_t v83 = objc_msgSend_objectForKeyedSubscript_(v72, v81, *MEMORY[0x263F2F610], v82);
  objc_msgSend_floatValue(v83, v84, v85, v86);
  float v88 = v87 * 0.000015259;

  v91 = objc_msgSend_objectForKeyedSubscript_(v72, v89, *MEMORY[0x263F2F408], v90);
  objc_msgSend_floatValue(v91, v92, v93, v94);
  float v96 = v95 * 0.000015259;

  uint64_t v99 = objc_msgSend_objectForKeyedSubscript_(v72, v97, v34, v98);

  float v103 = (float)(int)objc_msgSend_intValue(v99, v100, v101, v102) * 0.0039062;
  float v104 = sqrtf((float)((float)(v80 * v80) - (float)(v88 * v88)) / 0.98438);
  float v105 = sqrtf((float)(v80 * v80) - (float)(v104 * v104));
  *(void *)&self->_anon_40[264] = 0x3D80000041800000;
  *(float *)&self->_anon_40[260] = v96 * v103;
  float v106 = sqrtf((float)(v96 * v103)* (float)((float)(v96 * v103)* (float)((float)((float)(v104 / v103) * (float)(v104 / v103)) + (float)(v105 * v105))))/ (float)(v96 * v103);
  uint64_t v109 = objc_msgSend_objectForKeyedSubscript_(self->_tuningParams, v107, (uint64_t)v68, v108);
  v110 = (uint64_t *)v109;
  if (v109)
  {
    *(float *)&self->_anon_40[244] = v106 * sub_262FCDA18(*(void *)(v109 + 8), v62);
    *(float *)&self->_anon_40[260] = sub_262FCDA18(v110[2], v62) * *(float *)&self->_anon_40[260];
    *(float *)&self->_anon_40[248] = sub_262FCDA18(v110[3], v62);
    *(float *)&self->_anon_40[252] = sub_262FCDA18(v110[4], v62);
    float v111 = sub_262FCDA18(v110[5], v62);
  }
  else
  {
    *(float *)&self->_anon_40[244] = v106;
    *(void *)&self->_anon_40[248] = 0;
    float v111 = 100000.0;
  }
  uint64_t v112 = 0;
  *(float *)&self->_anon_40[256] = v111;
  *(_OWORD *)&self->_anon_40[160] = xmmword_263017830;
  *(_OWORD *)&self->_anon_40[176] = xmmword_263017840;
  *(void *)&self->_anon_40[192] = 0x3F80000000000000;
  long long v159 = xmmword_263017850;
  long long v160 = xmmword_263017860;
  simd_float4 v162 = 0u;
  simd_float4 v163 = 0u;
  simd_float4 v164 = 0u;
  long long v161 = xmmword_263017870;
  do
  {
    *(float32x4_t *)((char *)&v162 + v112) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263017880, COERCE_FLOAT(*(long long *)((char *)&v159 + v112))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v159 + v112), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v159 + v112), 2);
    v112 += 16;
  }
  while (v112 != 48);
  v165.columns[0] = v162;
  v165.columns[1] = v163;
  v165.columns[2] = v164;
  *(simd_float4 *)&self->_anon_40[64] = v162;
  *(simd_float4 *)&self->_anon_40[80] = v165.columns[1];
  *(simd_float4 *)&self->_anon_40[96] = v165.columns[2];
  v165.columns[3] = (simd_float4)xmmword_2630178B0;
  simd_float4x4 v166 = __invert_f4(v165);
  *(simd_float4 *)&self->_anon_40[16] = v166.columns[0];
  *(simd_float4 *)&self->_anon_40[32] = v166.columns[1];
  *(simd_float4 *)&self->_anon_40[48] = v166.columns[2];
  *(float *)&self->_anon_40[200] = 1.0 / *(float *)&self->_anon_40[204];
  uint64_t v113 = MEMORY[0x263EF89A0];
  v166.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&self->_anon_40[112] = *MEMORY[0x263EF89A0];
  *(simd_float4 *)&self->_anon_40[128] = v166.columns[1];
  *(_OWORD *)&self->_anon_40[144] = *(_OWORD *)(v113 + 32);
  *(_DWORD *)&self->_anon_40[204] = 1065353216;
  *(_DWORD *)&self->_anon_40[208] = 0x10000;
  v116 = objc_msgSend_objectForKeyedSubscript_(v72, v114, *MEMORY[0x263F2F6D0], v115);
  v120 = v116;
  if (v116)
  {
    int v121 = objc_msgSend_intValue(v116, v117, v118, v119);
    if (v121 == 3)
    {
      *(_OWORD *)&self->_anon_40[160] = xmmword_2630178C0;
      *(_OWORD *)&self->_anon_40[176] = xmmword_2630178D0;
      *(void *)&self->_anon_40[192] = 0x4019999A3D6147AELL;
      *(_OWORD *)&self->_anon_40[64] = xmmword_2630178E0;
      *(_OWORD *)&self->_anon_40[80] = xmmword_2630178F0;
      *(_OWORD *)&self->_anon_40[96] = xmmword_263017900;
      *(_DWORD *)&self->_anon_40[204] = 1065204301;
      simd_float4x4 v167 = __invert_f4(*(simd_float4x4 *)zmmword_263017930);
      *(simd_float4 *)&self->_anon_40[16] = v167.columns[0];
      *(simd_float4 *)&self->_anon_40[32] = v167.columns[1];
      *(simd_float4 *)&self->_anon_40[48] = v167.columns[2];
      self->_anon_40[211] = 1;
    }
    else
    {
      if (v121 == 2)
      {
        uint64_t v125 = 0;
        *(_OWORD *)&self->_anon_40[160] = xmmword_263017910;
        *(_OWORD *)&self->_anon_40[176] = xmmword_263017920;
        *(void *)&self->_anon_40[192] = 0x400E38E43DCAC083;
        float v126 = (float)v158 / 65535.0;
        v127.i32[1] = 0;
        v127.i32[2] = 0;
        v127.f32[0] = 1.0 / (float)(1.0 - v126);
        long long v159 = xmmword_263017850;
        long long v160 = xmmword_263017860;
        long long v161 = xmmword_263017870;
        simd_float4 v162 = 0u;
        simd_float4 v163 = 0u;
        simd_float4 v164 = 0u;
        do
        {
          v127.f32[3] = -(float)(v126 * v127.f32[0]);
          *(float32x4_t *)((char *)&v162 + v125) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v127, COERCE_FLOAT(*(long long *)((char *)&v159 + v125))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v159 + v125), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v159 + v125), 2);
          v125 += 16;
        }
        while (v125 != 48);
      }
      else
      {
        if (v121) {
          goto LABEL_48;
        }
        uint64_t v122 = 0;
        *(_OWORD *)&self->_anon_40[160] = xmmword_263017830;
        *(_OWORD *)&self->_anon_40[176] = xmmword_263017840;
        *(void *)&self->_anon_40[192] = 0x3F80000000000000;
        float v123 = (float)v158 / 65535.0;
        v124.i32[1] = 0;
        v124.i32[2] = 0;
        v124.f32[0] = 1.0 / (float)(1.0 - v123);
        long long v159 = xmmword_263017850;
        long long v160 = xmmword_263017860;
        long long v161 = xmmword_263017870;
        simd_float4 v162 = 0u;
        simd_float4 v163 = 0u;
        simd_float4 v164 = 0u;
        do
        {
          v124.f32[3] = -(float)(v123 * v124.f32[0]);
          *(float32x4_t *)((char *)&v162 + v122) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v124, COERCE_FLOAT(*(long long *)((char *)&v159 + v122))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v159 + v122), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v159 + v122), 2);
          v122 += 16;
        }
        while (v122 != 48);
      }
      v168.columns[0] = v162;
      v168.columns[1] = v163;
      v168.columns[2] = v164;
      *(simd_float4 *)&self->_anon_40[64] = v162;
      *(simd_float4 *)&self->_anon_40[80] = v168.columns[1];
      *(simd_float4 *)&self->_anon_40[96] = v168.columns[2];
      v168.columns[3] = (simd_float4)xmmword_2630178B0;
      simd_float4x4 v169 = __invert_f4(v168);
      *(simd_float4 *)&self->_anon_40[16] = v169.columns[0];
      *(simd_float4 *)&self->_anon_40[32] = v169.columns[1];
      *(simd_float4 *)&self->_anon_40[48] = v169.columns[2];
    }
  }
LABEL_48:
  __asm { FMOV            V8.2S, #1.0 }
  *(float32x2_t *)&self->_anon_40[200] = _D8;
  self->_anon_40[210] = 0;
  int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  v132 = objc_msgSend_objectForKeyedSubscript_(v72, v130, *MEMORY[0x263F2F600], v131);
  int v136 = objc_msgSend_intValue(v132, v133, v134, v135);

  v139 = objc_msgSend_objectForKeyedSubscript_(v72, v137, *MEMORY[0x263F2F5F8], v138);
  int v143 = objc_msgSend_intValue(v139, v140, v141, v142);

  float32x2_t v146 = 0;
  if (CGRectIfPresent && v136 && v143)
  {
    v147.i64[0] = v136;
    v147.i64[1] = v143;
    __asm { FMOV            V1.2S, #1.0 }
    _D8 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_u64(v147)));
    float32x2_t v146 = vcvt_f32_f64(vmulq_f64((float64x2_t)0, vcvtq_f64_f32(_D8)));
  }
  *(float32x2_t *)&self->_anon_40[224] = _D8;
  *(float32x2_t *)&self->_anon_40[232] = v146;
  *(_DWORD *)&self->_anon_40[240] = 1065353216;
  v149 = objc_msgSend_objectForKeyedSubscript_(v72, v144, *MEMORY[0x263F2F538], v145, 0x3F8000003F800000, 0x3F80000000000000, 1065353216, 1065353216);

  if (v149)
  {
    objc_msgSend_floatValue(v149, v150, v151, v152);
    *(_DWORD *)&self->_anon_40[240] = v153;
  }
  objc_msgSend_getTextureForPortType_(self->_lscGainsPlist, v150, (uint64_t)v68, v152);
  v154 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  lscGainsTex = self->_lscGainsTex;
  self->_lscGainsTex = v154;

  if (self->_lscGainsTex) {
    int v156 = 0;
  }
  else {
    int v156 = FigSignalErrorAt();
  }
LABEL_56:

  return v156;
}

- (void)_bindYuvBuffer:(__CVBuffer *)a3 toLumaTexture:(id *)a4 chromaTexture:(id *)a5 withUsage:(unint64_t)a6
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v13 = 0;
  if (PixelFormatType <= 792229423)
  {
    if (PixelFormatType <= 758670895)
    {
      if (PixelFormatType != 641230384 && PixelFormatType != 641234480)
      {
        if (PixelFormatType == 645424688) {
          uint64_t v13 = 588;
        }
        else {
          uint64_t v13 = 0;
        }
        if (PixelFormatType == 645424688) {
          uint64_t v16 = 589;
        }
        else {
          uint64_t v16 = 0;
        }
        goto LABEL_32;
      }
      goto LABEL_26;
    }
    if (PixelFormatType > 762865199)
    {
      if (PixelFormatType == 762865200)
      {
LABEL_30:
        uint64_t v16 = 589;
        objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)a3, 588, a6, 0);
        goto LABEL_33;
      }
      int v15 = 792225328;
    }
    else
    {
      if (PixelFormatType == 758670896) {
        goto LABEL_26;
      }
      int v15 = 758674992;
    }
    goto LABEL_25;
  }
  if (PixelFormatType <= 2019963439)
  {
    if (PixelFormatType <= 875704421)
    {
      if (PixelFormatType != 792229424)
      {
        int v14 = 796419632;
        goto LABEL_29;
      }
      goto LABEL_26;
    }
    if (PixelFormatType == 875704422) {
      goto LABEL_26;
    }
    int v15 = 875704438;
LABEL_25:
    uint64_t v16 = 0;
    if (PixelFormatType != v15) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
  if (PixelFormatType <= 2084075055)
  {
    if (PixelFormatType == 2019963440)
    {
      uint64_t v16 = 578;
      uint64_t v13 = 576;
      goto LABEL_32;
    }
    int v15 = 2084070960;
    goto LABEL_25;
  }
  if (PixelFormatType != 2084075056)
  {
    int v14 = 2088265264;
LABEL_29:
    uint64_t v16 = 0;
    if (PixelFormatType == v14) {
      goto LABEL_30;
    }
LABEL_32:
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)a3, v13, a6, 0);
    goto LABEL_33;
  }
LABEL_26:
  uint64_t v16 = 30;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)a3, 10, a6, 0);
LABEL_33:
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v17, (uint64_t)a3, v16, a6, 1);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
}

- (int)deviceGeneration
{
  return self->_deviceGeneration;
}

- (void)setDeviceGeneration:(int)a3
{
  self->_deviceGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_clearTexturePipelineState, 0);
  objc_storeStrong((id *)&self->_lumaAddbackAndWriteToFullPipelineState, 0);
  objc_storeStrong((id *)&self->_rgbTileToLumaTileAndChromaFullPipelineState, 0);
  objc_storeStrong((id *)&self->_lumaChromaFullToRawTilePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end