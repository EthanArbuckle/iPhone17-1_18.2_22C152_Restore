@interface AdaptiveClamping
- (AdaptiveClamping)initWithMetalContext:(id)a3;
- (int)_initShaders;
- (int)clampFromPixelBuffer:(__CVBuffer *)a3 Mask:(__CVBuffer *)a4 MaxDisparity:(float)a5 Percentiles:(id)a6 CommandBuffer:;
@end

@implementation AdaptiveClamping

- (AdaptiveClamping)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AdaptiveClamping;
  v6 = [(AdaptiveClamping *)&v38 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  p_metalContext = (void **)&v6->_metalContext;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if (!v7->_metalContext)
  {
    v17 = (void *)MEMORY[0x263F086E0];
    uint64_t v18 = objc_opt_class();
    v26 = objc_msgSend_bundleForClass_(v17, v19, v18, v20, v21, v22, v23, v24, v25);
    if (!v26
      || (id v27 = objc_alloc(MEMORY[0x263F2EE30]),
          uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v27, v28, (uint64_t)v26, 0, v29, v30, v31, v32, v33), v35 = *p_metalContext, *p_metalContext = (void *)inited, v35, !*p_metalContext))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_11;
    }
  }
  if (objc_msgSend__initShaders(v7, v9, v10, v11, v12, v13, v14, v15, v16))
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_11:
    v36 = 0;
    goto LABEL_8;
  }
  v36 = v7;
LABEL_8:

  return v36;
}

- (int)clampFromPixelBuffer:(__CVBuffer *)a3 Mask:(__CVBuffer *)a4 MaxDisparity:(float)a5 Percentiles:(id)a6 CommandBuffer:
{
  uint64_t v272 = v6;
  *(float *)v279 = a5;
  id v11 = a6;
  if (!a3) {
    goto LABEL_44;
  }
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    id v67 = 0;
LABEL_45:
    v36 = 0;
    v58 = 0;
    id v20 = 0;
    int v269 = -12780;
    goto LABEL_26;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226536 && CVPixelBufferGetPixelFormatType(a3) != 1751411059
    || CVPixelBufferGetPixelFormatType(a4) != 1380411457
    || a5 <= 0.0
    || *(float *)&v272 < 0.0
    || *(float *)&v272 > 1.0
    || *((float *)&v272 + 1) < 0.0
    || *((float *)&v272 + 1) > 1.0
    || (CVPixelBufferGetWidth(a3) & 3) != 0)
  {
LABEL_44:
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    id v67 = 0;
    a4 = 0;
    goto LABEL_45;
  }
  if (v11)
  {
    id v20 = v11;
  }
  else
  {
    uint64_t v21 = objc_msgSend_commandQueue(self->_metalContext, v12, v13, v14, v15, v16, v17, v18, v19);
    objc_msgSend_commandBuffer(v21, v22, v23, v24, v25, v26, v27, v28, v29);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      id v153 = 0;
      id v67 = 0;
      a4 = 0;
      v36 = 0;
LABEL_36:
      v58 = 0;
LABEL_39:
      int v269 = -12786;
      goto LABEL_26;
    }
  }
  metalContext = self->_metalContext;
  double Width = (float)CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  v36 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(metalContext, v33, (uint64_t)a3, 25, 1, 0, v34, v35, *(float *)&Width, (float)Height);
  if (!v36)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    id v67 = 0;
    a4 = 0;
    goto LABEL_36;
  }
  v37 = self->_metalContext;
  double v38 = (float)CVPixelBufferGetWidth(a4);
  size_t v39 = CVPixelBufferGetHeight(a4);
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(v37, v40, (uint64_t)a4, 115, 1, 0, v41, v42, *(float *)&v38, (float)v39);
  a4 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    id v67 = 0;
    goto LABEL_36;
  }
  v58 = objc_msgSend_computeCommandEncoder(v20, v43, v44, v45, v46, v47, v48, v49, v50);
  if (!v58)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    id v67 = 0;
    goto LABEL_39;
  }
  v60 = objc_msgSend_device(self->_metalContext, v51, v52, v53, v54, v55, v56, v57, v59);
  id v67 = (id)objc_msgSend_newBufferWithLength_options_(v60, v61, 4100, 0, v62, v63, v64, v65, v66);

  if (!v67)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    goto LABEL_39;
  }
  id v67 = v67;
  v76 = objc_msgSend_contents(v67, v68, v69, v70, v71, v72, v73, v74, v75);
  bzero(v76, 0x1004uLL);
  if ((unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[0], v77, v78, v79, v80, v81, v82, v83, v84) <= 0x3FF)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v153 = 0;
    int v269 = -12782;
    goto LABEL_26;
  }
  v271 = v20;
  id v93 = v11;
  unint64_t v94 = (((unint64_t)objc_msgSend_width(v36, v85, v86, v87, v88, v89, v90, v91, v92) >> 1) + 31) >> 5;
  unint64_t v103 = (((unint64_t)objc_msgSend_height(v36, v95, v96, v97, v98, v99, v100, v101, v102) >> 1) + 31) >> 5;
  objc_msgSend_setComputePipelineState_(v58, v104, (uint64_t)self->_pipelineStates[0], v105, v106, v107, v108, v109, v110);
  objc_msgSend_setTexture_atIndex_(v58, v111, (uint64_t)v36, 0, v112, v113, v114, v115, v116);
  objc_msgSend_setTexture_atIndex_(v58, v117, (uint64_t)a4, 1, v118, v119, v120, v121, v122);
  objc_msgSend_setBuffer_offset_atIndex_(v58, v123, (uint64_t)v67, 0, 0, v124, v125, v126, v127);
  objc_msgSend_setBytes_length_atIndex_(v58, v128, (uint64_t)v279, 4, 1, v129, v130, v131, v132);
  v277.i64[0] = v94;
  v277.i64[1] = v103;
  uint64_t v278 = 1;
  int64x2_t v275 = vdupq_n_s64(0x20uLL);
  uint64_t v276 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v58, v133, (uint64_t)&v277, (uint64_t)&v275, v134, v135, v136, v137, *(float *)v275.i32);
  v146 = objc_msgSend_device(self->_metalContext, v138, v139, v140, v141, v142, v143, v144, v145);
  id v153 = (id)objc_msgSend_newBufferWithLength_options_(v146, v147, 8, 0, v148, v149, v150, v151, v152);

  if (!v153)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_43:
    int v269 = -12786;
    goto LABEL_24;
  }
  id v153 = v153;
  *objc_msgSend_contents(v153, v154, v155, v156, v157, v158, v159, v160, v161) = v272;
  objc_msgSend_setComputePipelineState_(v58, v162, (uint64_t)self->_pipelineStates[1], v163, v164, v165, v166, v167, *(float *)&v272);
  objc_msgSend_setBuffer_offset_atIndex_(v58, v168, (uint64_t)v67, 0, 0, v169, v170, v171, v172);
  objc_msgSend_setBuffer_offset_atIndex_(v58, v173, (uint64_t)v153, 0, 1, v174, v175, v176, v177);
  objc_msgSend_setBytes_length_atIndex_(v58, v178, (uint64_t)v279, 4, 2, v179, v180, v181, v182);
  int64x2_t v277 = vdupq_n_s64(1uLL);
  uint64_t v278 = 1;
  int64x2_t v275 = v277;
  uint64_t v276 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v58, v183, (uint64_t)&v277, (uint64_t)&v275, v184, v185, v186, v187, *(float *)v277.i32);
  v188 = self->_metalContext;
  double v189 = (float)((float)CVPixelBufferGetWidth(a3) * 0.25);
  size_t v190 = CVPixelBufferGetHeight(a3);
  v194 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(v188, v191, (uint64_t)a3, 115, 3, 0, v192, v193, *(float *)&v189, (float)v190);

  if (!v194)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v36 = 0;
    goto LABEL_43;
  }
  objc_msgSend_setComputePipelineState_(v58, v195, (uint64_t)self->_pipelineStates[2], v196, v197, v198, v199, v200, v201);
  objc_msgSend_setTexture_atIndex_(v58, v202, (uint64_t)v194, 0, v203, v204, v205, v206, v207);
  objc_msgSend_setBuffer_offset_atIndex_(v58, v208, (uint64_t)v153, 0, 0, v209, v210, v211, v212);
  unint64_t v221 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[2], v213, v214, v215, v216, v217, v218, v219, v220);
  unint64_t v230 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[2], v222, v223, v224, v225, v226, v227, v228, v229)/ v221;
  v274[0] = objc_msgSend_width(v194, v231, v232, v233, v234, v235, v236, v237, v238);
  v274[1] = objc_msgSend_height(v194, v239, v240, v241, v242, v243, v244, v245, v246);
  v274[2] = 1;
  v273[0] = v221;
  v273[1] = v230;
  v273[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v58, v247, (uint64_t)v274, (uint64_t)v273, v248, v249, v250, v251, v252);
  objc_msgSend_endEncoding(v58, v253, v254, v255, v256, v257, v258, v259, v260);
  id v11 = v93;
  if (!v93)
  {
    id v20 = v271;
    objc_msgSend_commit(v271, v261, v262, v263, v264, v265, v266, v267, v268);
    int v269 = 0;
    v36 = v194;
    goto LABEL_26;
  }
  int v269 = 0;
  v36 = v194;
LABEL_24:
  id v20 = v271;
LABEL_26:

  return v269;
}

- (int)_initShaders
{
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, a2, @"DisparityHistogramKernel", 0, v2, v3, v4, v5, v6);
  v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v9 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v8;

  if (self->_pipelineStates[0])
  {
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v10, @"DisparityComputeClampingValues", 0, v11, v12, v13, v14, v15);
    uint64_t v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v16;

    if (self->_pipelineStates[1])
    {
      objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v18, @"DisparityClampingKernel", 0, v19, v20, v21, v22, v23);
      uint64_t v24 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v24;

      if (self->_pipelineStates[2]) {
        return 0;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void).cxx_destruct
{
  for (uint64_t i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end