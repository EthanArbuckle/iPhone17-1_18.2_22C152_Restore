@interface DupDownscaleHalfConvert
- (DupDownscaleHalfConvert)initWithMetalContext:(id)a3;
- (int)AllocateResources;
- (int)DownscaleAndCrop:(float)a3 outY:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5;
- (int)DownscaleConvertAndCenterCrop:(__CVBuffer *)a3 outCroppedLuma:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5;
- (int)GenerateImageY:(id)a3 inYuv420:(id)a4 waitForCompletion:(BOOL)a5;
- (int)GenerateImageYUVA:(__CVBuffer *)a3 outY:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5 waitForCompletion:(BOOL)a6;
- (int)GenerateImageYUVA:(__CVBuffer *)a3 outYuvaWidth:(unsigned int)a4 outYuvaHeight:(unsigned int)a5 outY:(__CVBuffer *)a6 inYuv420:(__CVBuffer *)a7 gainToApplyToOutputs:(float)a8 waitForCompletion:(BOOL)a9;
- (int)ReleaseResources;
- (void)dealloc;
@end

@implementation DupDownscaleHalfConvert

- (DupDownscaleHalfConvert)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DupDownscaleHalfConvert;
  v6 = [(DupDownscaleHalfConvert *)&v42 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  v6->_ResourcesAvailable = 0;
  objc_storeStrong((id *)&v6->_MetalContext, a3);
  v7->_ContextAvailable = 1;
  uint64_t v14 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v8, @"kernelDownscalerConverterYUVA", 0, v9, v10, v11, v12, v13);
  KernelYUVA = v7->_KernelYUVA;
  v7->_KernelYUVA = (MTLComputePipelineState *)v14;

  if (!v7->_KernelYUVA) {
    goto LABEL_8;
  }
  uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v16, @"kernelDownscalerConverterY", 0, v17, v18, v19, v20, v21);
  KernelY = v7->_KernelY;
  v7->_KernelY = (MTLComputePipelineState *)v22;

  if (!v7->_KernelY) {
    goto LABEL_8;
  }
  uint64_t v30 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v24, @"kernelDownscaleConvertAndCenterCrop", 0, v25, v26, v27, v28, v29);
  KernelDownscaleConvertAndCenterCrop = v7->_KernelDownscaleConvertAndCenterCrop;
  v7->_KernelDownscaleConvertAndCenterCrop = (MTLComputePipelineState *)v30;

  if (!v7->_KernelDownscaleConvertAndCenterCrop) {
    goto LABEL_8;
  }
  uint64_t v38 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v32, @"kernelDownscaleAndCrop", 0, v33, v34, v35, v36, v37);
  KernelDownscaleAndCrop = v7->_KernelDownscaleAndCrop;
  v7->_KernelDownscaleAndCrop = (MTLComputePipelineState *)v38;

  if (v7->_KernelDownscaleAndCrop)
  {
LABEL_6:
    v40 = v7;
  }
  else
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v40 = 0;
  }

  return v40;
}

- (int)AllocateResources
{
  if (!self->_ContextAvailable) {
    return -12786;
  }
  int result = 0;
  self->_ResourcesAvailable = 1;
  return result;
}

- (int)ReleaseResources
{
  self->_ResourcesAvailable = 0;
  return 0;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_MetalContext, a2, v2, v3, v4, v5, v6, v7, v8);
  objc_msgSend_ReleaseResources(self, v10, v11, v12, v13, v14, v15, v16, v17);
  v18.receiver = self;
  v18.super_class = (Class)DupDownscaleHalfConvert;
  [(DupDownscaleHalfConvert *)&v18 dealloc];
}

- (int)GenerateImageYUVA:(__CVBuffer *)a3 outY:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5 waitForCompletion:(BOOL)a6
{
  return MEMORY[0x270F9A6D0](self, sel_GenerateImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion_, a3, 0, 0, a4, a5, a6, 1.0);
}

- (int)GenerateImageYUVA:(__CVBuffer *)a3 outYuvaWidth:(unsigned int)a4 outYuvaHeight:(unsigned int)a5 outY:(__CVBuffer *)a6 inYuv420:(__CVBuffer *)a7 gainToApplyToOutputs:(float)a8 waitForCompletion:(BOOL)a9
{
  BOOL v9 = a9;
  float v183 = a8;
  if (!a4 || (unsigned int Height = a5, Width = a4, !a5))
  {
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
  }
  unsigned int v181 = 0;
  unsigned int v182 = 0;
  if (!self->_ContextAvailable || !self->_ResourcesAvailable)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    v31 = 0;
    v23 = 0;
    v178 = 0;
    v77 = 0;
    v60 = 0;
    int v176 = -12780;
    goto LABEL_18;
  }
  v178 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, a2, (uint64_t)a7, 10, 17, 0, (uint64_t)a7, a9, a8);
  if (!v178)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    v31 = 0;
    v23 = 0;
    v178 = 0;
LABEL_26:
    v77 = 0;
    v60 = 0;
    goto LABEL_27;
  }
  v23 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v16, (uint64_t)a7, 30, 17, 1, v17, v18, v19);
  if (!v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    v31 = 0;
    goto LABEL_26;
  }
  v31 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_MetalContext, v20, (uint64_t)a3, 80, 22, 0, v21, v22, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)Width)), (double)Height);
  if (!v31)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    goto LABEL_26;
  }
  if (a6)
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_MetalContext, v24, (uint64_t)a6, 10, 22, 0, v29, v30, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)Width)), (double)Height);
    a6 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_26;
    }
  }
  uint64_t v33 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelYUVA, v24, v25, v26, v27, v28, v29, v30, v32);
  unsigned int v42 = objc_msgSend_threadExecutionWidth(self->_KernelYUVA, v34, v35, v36, v37, v38, v39, v40, v41);
  sub_262EC1294(v33, v42, &v182, &v181, Width, Height);
  v51 = objc_msgSend_commandQueue(self->_MetalContext, v43, v44, v45, v46, v47, v48, v49, v50);
  v60 = objc_msgSend_commandBuffer(v51, v52, v53, v54, v55, v56, v57, v58, v59);

  if (!v60)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v77 = 0;
LABEL_27:
    int v176 = -12786;
    goto LABEL_18;
  }
  v69 = objc_msgSend_computeCommandEncoder(v60, v61, v62, v63, v64, v65, v66, v67, v68);
  v77 = v69;
  if (!v69)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_27;
  }
  objc_msgSend_setComputePipelineState_(v69, v70, (uint64_t)self->_KernelYUVA, v71, v72, v73, v74, v75, v76);
  objc_msgSend_setTexture_atIndex_(v77, v78, (uint64_t)v178, 0, v79, v80, v81, v82, v83);
  objc_msgSend_setTexture_atIndex_(v77, v84, (uint64_t)v23, 1, v85, v86, v87, v88, v89);
  objc_msgSend_setTexture_atIndex_(v77, v90, (uint64_t)v31, 2, v91, v92, v93, v94, v95);
  objc_msgSend_setTexture_atIndex_(v77, v96, (uint64_t)a6, 3, v97, v98, v99, v100, v101);
  objc_msgSend_setBytes_length_atIndex_(v77, v102, (uint64_t)&v183, 4, 0, v103, v104, v105, v106);
  v180[0] = Width / v182;
  v180[1] = Height / v181;
  v180[2] = 1;
  v179[0] = v182;
  v179[1] = v181;
  v179[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v77, v107, (uint64_t)v180, (uint64_t)v179, v108, v109, v110, v111, v112);
  objc_msgSend_endEncoding(v77, v113, v114, v115, v116, v117, v118, v119, v120);
  if (*MEMORY[0x263F00E10])
  {
    v129 = objc_msgSend_commandQueue(v60, v121, v122, v123, v124, v125, v126, v127, v128);
    v138 = objc_msgSend_commandBuffer(v129, v130, v131, v132, v133, v134, v135, v136, v137);

    objc_msgSend_setLabel_(v138, v139, @"KTRACE_MTLCMDBUF", v140, v141, v142, v143, v144, v145);
    objc_msgSend_addCompletedHandler_(v138, v146, (uint64_t)&unk_270E25520, v147, v148, v149, v150, v151, v152);
    objc_msgSend_commit(v138, v153, v154, v155, v156, v157, v158, v159, v160);
    objc_msgSend_addCompletedHandler_(v60, v161, (uint64_t)&unk_270E25540, v162, v163, v164, v165, v166, v167);
  }
  objc_msgSend_commit(v60, v121, v122, v123, v124, v125, v126, v127, v128);
  if (v9) {
    objc_msgSend_waitUntilCompleted(v60, v168, v169, v170, v171, v172, v173, v174, v175);
  }
  int v176 = 0;
LABEL_18:

  return v176;
}

- (int)GenerateImageY:(id)a3 inYuv420:(id)a4 waitForCompletion:(BOOL)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v18 = objc_msgSend_width(v9, v10, v11, v12, v13, v14, v15, v16, v17);
  int v27 = objc_msgSend_height(v9, v19, v20, v21, v22, v23, v24, v25, v26);
  unsigned int v36 = objc_msgSend_width(v8, v28, v29, v30, v31, v32, v33, v34, v35);
  unsigned int v45 = objc_msgSend_height(v8, v37, v38, v39, v40, v41, v42, v43, v44);
  uint64_t v200 = 0;
  if (!self->_ContextAvailable
    || !self->_ResourcesAvailable
    || !v9
    || (unsigned int v54 = v45, objc_msgSend_pixelFormat(v9, v46, v47, v48, v49, v50, v51, v52, v53) != 10)
    || !v8
    || objc_msgSend_pixelFormat(v8, v55, v56, v57, v58, v59, v60, v61, v62) != 10
    || v18 != 2 * v36
    || 2 * v54 != v27)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v115 = 0;
    uint64_t v98 = 0;
    int v5 = -12780;
    goto LABEL_15;
  }
  uint64_t v71 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelY, v63, v64, v65, v66, v67, v68, v69, v70);
  unsigned int v80 = objc_msgSend_threadExecutionWidth(self->_KernelY, v72, v73, v74, v75, v76, v77, v78, v79);
  sub_262EC1294(v71, v80, (_DWORD *)&v200 + 1, &v200, v36, v54);
  float v89 = objc_msgSend_commandQueue(self->_MetalContext, v81, v82, v83, v84, v85, v86, v87, v88);
  uint64_t v98 = objc_msgSend_commandBuffer(v89, v90, v91, v92, v93, v94, v95, v96, v97);

  if (!v98)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v115 = 0;
LABEL_19:
    int v5 = -12786;
    goto LABEL_15;
  }
  v107 = objc_msgSend_computeCommandEncoder(v98, v99, v100, v101, v102, v103, v104, v105, v106);
  uint64_t v115 = v107;
  if (!v107)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  objc_msgSend_setComputePipelineState_(v107, v108, (uint64_t)self->_KernelY, v109, v110, v111, v112, v113, v114);
  objc_msgSend_setTexture_atIndex_(v115, v116, (uint64_t)v9, 0, v117, v118, v119, v120, v121);
  objc_msgSend_setTexture_atIndex_(v115, v122, (uint64_t)v8, 1, v123, v124, v125, v126, v127);
  v199[0] = v36 / HIDWORD(v200);
  v199[1] = v54 / v200;
  v199[2] = 1;
  v198[0] = HIDWORD(v200);
  v198[1] = v200;
  v198[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v115, v128, (uint64_t)v199, (uint64_t)v198, v129, v130, v131, v132, v133);
  objc_msgSend_endEncoding(v115, v134, v135, v136, v137, v138, v139, v140, v141);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v150 = objc_msgSend_commandQueue(v98, v142, v143, v144, v145, v146, v147, v148, v149);
    uint64_t v159 = objc_msgSend_commandBuffer(v150, v151, v152, v153, v154, v155, v156, v157, v158);

    objc_msgSend_setLabel_(v159, v160, @"KTRACE_MTLCMDBUF", v161, v162, v163, v164, v165, v166);
    objc_msgSend_addCompletedHandler_(v159, v167, (uint64_t)&unk_270E25560, v168, v169, v170, v171, v172, v173);
    objc_msgSend_commit(v159, v174, v175, v176, v177, v178, v179, v180, v181);
    objc_msgSend_addCompletedHandler_(v98, v182, (uint64_t)&unk_270E25580, v183, v184, v185, v186, v187, v188);
  }
  objc_msgSend_commit(v98, v142, v143, v144, v145, v146, v147, v148, v149);
  if (v5)
  {
    objc_msgSend_waitUntilCompleted(v98, v189, v190, v191, v192, v193, v194, v195, v196);
    int v5 = 0;
  }
LABEL_15:

  return v5;
}

- (int)DownscaleConvertAndCenterCrop:(__CVBuffer *)a3 outCroppedLuma:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5
{
  unsigned int Width = CVPixelBufferGetWidth(a3);
  unsigned int Height = CVPixelBufferGetHeight(a3);
  uint64_t v177 = 0;
  if (!self->_ContextAvailable || !self->_ResourcesAvailable)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  unsigned int v15 = Height;
  uint64_t v16 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v11, (uint64_t)a5, 10, 17, 0, v12, v13, v14);
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  uint64_t v21 = (void *)v16;
  uint64_t v22 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v17, (uint64_t)a5, 30, 17, 1, v18, v19, v20);
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_20:

    return -12786;
  }
  int v27 = (void *)v22;
  uint64_t v28 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v23, (uint64_t)a3, 80, 22, 0, v24, v25, v26);
  if (!v28)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v33 = (void *)v28;
  uint64_t v34 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v29, (uint64_t)a4, 10, 22, 0, v30, v31, v32);
  if (!v34)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v43 = (void *)v34;
  uint64_t v44 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelDownscaleConvertAndCenterCrop, v35, v36, v37, v38, v39, v40, v41, v42);
  unsigned int v53 = objc_msgSend_threadExecutionWidth(self->_KernelDownscaleConvertAndCenterCrop, v45, v46, v47, v48, v49, v50, v51, v52);
  sub_262EC1294(v44, v53, (_DWORD *)&v177 + 1, &v177, Width, v15);
  float v62 = objc_msgSend_commandQueue(self->_MetalContext, v54, v55, v56, v57, v58, v59, v60, v61);
  uint64_t v71 = objc_msgSend_commandBuffer(v62, v63, v64, v65, v66, v67, v68, v69, v70);

  if (!v71)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_18;
  }
  unsigned int v80 = objc_msgSend_computeCommandEncoder(v71, v72, v73, v74, v75, v76, v77, v78, v79);
  if (!v80)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return -12786;
  }
  float v88 = v80;
  objc_msgSend_setComputePipelineState_(v80, v81, (uint64_t)self->_KernelDownscaleConvertAndCenterCrop, v82, v83, v84, v85, v86, v87);
  objc_msgSend_setTexture_atIndex_(v88, v89, (uint64_t)v21, 0, v90, v91, v92, v93, v94);
  objc_msgSend_setTexture_atIndex_(v88, v95, (uint64_t)v27, 1, v96, v97, v98, v99, v100);
  objc_msgSend_setTexture_atIndex_(v88, v101, (uint64_t)v33, 2, v102, v103, v104, v105, v106);
  objc_msgSend_setTexture_atIndex_(v88, v107, (uint64_t)v43, 3, v108, v109, v110, v111, v112);
  v176[0] = Width / HIDWORD(v177);
  v176[1] = v15 / v177;
  v176[2] = 1;
  v175[0] = HIDWORD(v177);
  v175[1] = v177;
  v175[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v88, v113, (uint64_t)v176, (uint64_t)v175, v114, v115, v116, v117, v118);
  objc_msgSend_endEncoding(v88, v119, v120, v121, v122, v123, v124, v125, v126);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v135 = objc_msgSend_commandQueue(v71, v127, v128, v129, v130, v131, v132, v133, v134);
    uint64_t v144 = objc_msgSend_commandBuffer(v135, v136, v137, v138, v139, v140, v141, v142, v143);

    objc_msgSend_setLabel_(v144, v145, @"KTRACE_MTLCMDBUF", v146, v147, v148, v149, v150, v151);
    objc_msgSend_addCompletedHandler_(v144, v152, (uint64_t)&unk_270E255A0, v153, v154, v155, v156, v157, v158);
    objc_msgSend_commit(v144, v159, v160, v161, v162, v163, v164, v165, v166);
    objc_msgSend_addCompletedHandler_(v71, v167, (uint64_t)&unk_270E255C0, v168, v169, v170, v171, v172, v173);
  }
  objc_msgSend_commit(v71, v127, v128, v129, v130, v131, v132, v133, v134);

  return 0;
}

- (int)DownscaleAndCrop:(float)a3 outY:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  if (!self->_ContextAvailable
    || !self->_ResourcesAvailable
    || !a5
    || !a4
    || CVPixelBufferGetPixelFormatType(a5) != 875704422
    || ((float Width = (float)CVPixelBufferGetWidth(a5),
         float Height = (float)CVPixelBufferGetHeight(a5),
         unsigned int v11 = CVPixelBufferGetWidth(a4),
         unsigned int v15 = CVPixelBufferGetHeight(a4),
         float v17 = (float)v15,
         Width > (float)v11)
      ? (BOOL v18 = Height <= v17)
      : (BOOL v18 = 1),
        v18))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v12, (uint64_t)a5, 10, 17, 0, v13, v14, v16);
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  uint64_t v24 = (void *)v19;
  uint64_t v25 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v20, (uint64_t)a4, 10, 22, 0, v21, v22, v23);
  if (!v25)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_21:

    return -12786;
  }
  uint64_t v34 = (void *)v25;
  uint64_t v161 = 0;
  uint64_t v35 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelDownscaleAndCrop, v26, v27, v28, v29, v30, v31, v32, v33);
  unsigned int v44 = objc_msgSend_threadExecutionWidth(self->_KernelDownscaleAndCrop, v36, v37, v38, v39, v40, v41, v42, v43);
  sub_262EC1294(v35, v44, (_DWORD *)&v161 + 1, &v161, v11, v15);
  float v45 = (float)(1.0 - (float)(1.0 / a3)) * 0.5;
  v162[0] = Width / (float)((float)v11 * a3);
  v162[1] = v45 * Width;
  v162[2] = Height / (float)(v17 * a3);
  v162[3] = v45 * Height;
  unsigned int v53 = objc_msgSend_commandQueue(self->_MetalContext, v46, v47, v48, v49, v50, v51, v52, v45 * Height);
  float v62 = objc_msgSend_commandBuffer(v53, v54, v55, v56, v57, v58, v59, v60, v61);

  if (!v62)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_21;
  }
  uint64_t v71 = objc_msgSend_computeCommandEncoder(v62, v63, v64, v65, v66, v67, v68, v69, v70);
  if (!v71)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return -12786;
  }
  float v79 = v71;
  objc_msgSend_setComputePipelineState_(v71, v72, (uint64_t)self->_KernelDownscaleAndCrop, v73, v74, v75, v76, v77, v78);
  objc_msgSend_setTexture_atIndex_(v79, v80, (uint64_t)v24, 0, v81, v82, v83, v84, v85);
  objc_msgSend_setTexture_atIndex_(v79, v86, (uint64_t)v34, 1, v87, v88, v89, v90, v91);
  objc_msgSend_setBytes_length_atIndex_(v79, v92, (uint64_t)v162, 16, 0, v93, v94, v95, v96);
  v160[0] = v11 / HIDWORD(v161);
  v160[1] = v15 / v161;
  v160[2] = 1;
  v159[0] = HIDWORD(v161);
  v159[1] = v161;
  v159[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v79, v97, (uint64_t)v160, (uint64_t)v159, v98, v99, v100, v101, v102);
  objc_msgSend_endEncoding(v79, v103, v104, v105, v106, v107, v108, v109, v110);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v119 = objc_msgSend_commandQueue(v62, v111, v112, v113, v114, v115, v116, v117, v118);
    uint64_t v128 = objc_msgSend_commandBuffer(v119, v120, v121, v122, v123, v124, v125, v126, v127);

    objc_msgSend_setLabel_(v128, v129, @"KTRACE_MTLCMDBUF", v130, v131, v132, v133, v134, v135);
    objc_msgSend_addCompletedHandler_(v128, v136, (uint64_t)&unk_270E255E0, v137, v138, v139, v140, v141, v142);
    objc_msgSend_commit(v128, v143, v144, v145, v146, v147, v148, v149, v150);
    objc_msgSend_addCompletedHandler_(v62, v151, (uint64_t)&unk_270E25600, v152, v153, v154, v155, v156, v157);
  }
  objc_msgSend_commit(v62, v111, v112, v113, v114, v115, v116, v117, v118);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KernelDownscaleAndCrop, 0);
  objc_storeStrong((id *)&self->_KernelDownscaleConvertAndCenterCrop, 0);
  objc_storeStrong((id *)&self->_KernelY, 0);
  objc_storeStrong((id *)&self->_KernelYUVA, 0);

  objc_storeStrong((id *)&self->_MetalContext, 0);
}

@end