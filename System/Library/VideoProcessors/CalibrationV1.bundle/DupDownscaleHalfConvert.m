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
  v30.receiver = self;
  v30.super_class = (Class)DupDownscaleHalfConvert;
  v6 = [(DupDownscaleHalfConvert *)&v30 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  v6->_ResourcesAvailable = 0;
  objc_storeStrong((id *)&v6->_MetalContext, a3);
  v7->_ContextAvailable = 1;
  uint64_t v11 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v8, @"kernelDownscalerConverterYUVA", 0, v9, v10);
  KernelYUVA = v7->_KernelYUVA;
  v7->_KernelYUVA = (MTLComputePipelineState *)v11;

  if (!v7->_KernelYUVA) {
    goto LABEL_8;
  }
  uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v13, @"kernelDownscalerConverterY", 0, v14, v15);
  KernelY = v7->_KernelY;
  v7->_KernelY = (MTLComputePipelineState *)v16;

  if (!v7->_KernelY) {
    goto LABEL_8;
  }
  uint64_t v21 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v18, @"kernelDownscaleConvertAndCenterCrop", 0, v19, v20);
  KernelDownscaleConvertAndCenterCrop = v7->_KernelDownscaleConvertAndCenterCrop;
  v7->_KernelDownscaleConvertAndCenterCrop = (MTLComputePipelineState *)v21;

  if (!v7->_KernelDownscaleConvertAndCenterCrop) {
    goto LABEL_8;
  }
  uint64_t v26 = objc_msgSend_computePipelineStateFor_constants_(v7->_MetalContext, v23, @"kernelDownscaleAndCrop", 0, v24, v25);
  KernelDownscaleAndCrop = v7->_KernelDownscaleAndCrop;
  v7->_KernelDownscaleAndCrop = (MTLComputePipelineState *)v26;

  if (v7->_KernelDownscaleAndCrop)
  {
LABEL_6:
    v28 = v7;
  }
  else
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = 0;
  }

  return v28;
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
  objc_msgSend_waitForIdle(self->_MetalContext, a2, v2, v3, v4, v5);
  objc_msgSend_ReleaseResources(self, v7, v8, v9, v10, v11);
  v12.receiver = self;
  v12.super_class = (Class)DupDownscaleHalfConvert;
  [(DupDownscaleHalfConvert *)&v12 dealloc];
}

- (int)GenerateImageYUVA:(__CVBuffer *)a3 outY:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5 waitForCompletion:(BOOL)a6
{
  LODWORD(v6) = 1.0;
  return objc_msgSend_GenerateImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion_(self, a2, (uint64_t)a3, 0, 0, (uint64_t)a4, a5, a6, v6);
}

- (int)GenerateImageYUVA:(__CVBuffer *)a3 outYuvaWidth:(unsigned int)a4 outYuvaHeight:(unsigned int)a5 outY:(__CVBuffer *)a6 inYuv420:(__CVBuffer *)a7 gainToApplyToOutputs:(float)a8 waitForCompletion:(BOOL)a9
{
  BOOL v9 = a9;
  float v118 = a8;
  if (!a4 || (unsigned int Height = a5, Width = a4, !a5))
  {
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
  }
  unsigned int v116 = 0;
  unsigned int v117 = 0;
  if (!self->_ContextAvailable || !self->_ResourcesAvailable)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    uint64_t v24 = 0;
    v18 = 0;
    v113 = 0;
    v54 = 0;
    v43 = 0;
    int v111 = -12780;
    goto LABEL_18;
  }
  v113 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, a2, (uint64_t)a7, 10, 17, 0);
  if (!v113)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    uint64_t v24 = 0;
    v18 = 0;
    v113 = 0;
LABEL_26:
    v54 = 0;
    v43 = 0;
    goto LABEL_27;
  }
  v18 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v16, (uint64_t)a7, 30, 17, 1);
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    uint64_t v24 = 0;
    goto LABEL_26;
  }
  uint64_t v24 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_MetalContext, v17, (uint64_t)a3, 80, 22, 0, (double)Width, (double)Height);
  if (!v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a6 = 0;
    goto LABEL_26;
  }
  if (a6)
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_MetalContext, v19, (uint64_t)a6, 10, 22, 0, (double)Width, (double)Height);
    a6 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_26;
    }
  }
  uint64_t v25 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelYUVA, v19, v20, v21, v22, v23);
  unsigned int v31 = objc_msgSend_threadExecutionWidth(self->_KernelYUVA, v26, v27, v28, v29, v30);
  sub_262E71D0C(v25, v31, &v117, &v116, Width, Height);
  v37 = objc_msgSend_commandQueue(self->_MetalContext, v32, v33, v34, v35, v36);
  v43 = objc_msgSend_commandBuffer(v37, v38, v39, v40, v41, v42);

  if (!v43)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v54 = 0;
LABEL_27:
    int v111 = -12786;
    goto LABEL_18;
  }
  v49 = objc_msgSend_computeCommandEncoder(v43, v44, v45, v46, v47, v48);
  v54 = v49;
  if (!v49)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_27;
  }
  objc_msgSend_setComputePipelineState_(v49, v50, (uint64_t)self->_KernelYUVA, v51, v52, v53);
  objc_msgSend_setTexture_atIndex_(v54, v55, (uint64_t)v113, 0, v56, v57);
  objc_msgSend_setTexture_atIndex_(v54, v58, (uint64_t)v18, 1, v59, v60);
  objc_msgSend_setTexture_atIndex_(v54, v61, (uint64_t)v24, 2, v62, v63);
  objc_msgSend_setTexture_atIndex_(v54, v64, (uint64_t)a6, 3, v65, v66);
  objc_msgSend_setBytes_length_atIndex_(v54, v67, (uint64_t)&v118, 4, 0, v68);
  v115[0] = Width / v117;
  v115[1] = Height / v116;
  v115[2] = 1;
  v114[0] = v117;
  v114[1] = v116;
  v114[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v54, v69, (uint64_t)v115, (uint64_t)v114, v70, v71);
  objc_msgSend_endEncoding(v54, v72, v73, v74, v75, v76);
  if (*MEMORY[0x263F00E10])
  {
    v82 = objc_msgSend_commandQueue(v43, v77, v78, v79, v80, v81);
    v88 = objc_msgSend_commandBuffer(v82, v83, v84, v85, v86, v87);

    objc_msgSend_setLabel_(v88, v89, @"KTRACE_MTLCMDBUF", v90, v91, v92);
    objc_msgSend_addCompletedHandler_(v88, v93, (uint64_t)&unk_270E1F3F8, v94, v95, v96);
    objc_msgSend_commit(v88, v97, v98, v99, v100, v101);
    objc_msgSend_addCompletedHandler_(v43, v102, (uint64_t)&unk_270E1F418, v103, v104, v105);
  }
  objc_msgSend_commit(v43, v77, v78, v79, v80, v81);
  if (v9) {
    objc_msgSend_waitUntilCompleted(v43, v106, v107, v108, v109, v110);
  }
  int v111 = 0;
LABEL_18:

  return v111;
}

- (int)GenerateImageY:(id)a3 inYuv420:(id)a4 waitForCompletion:(BOOL)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v15 = objc_msgSend_width(v9, v10, v11, v12, v13, v14);
  int v21 = objc_msgSend_height(v9, v16, v17, v18, v19, v20);
  unsigned int v27 = objc_msgSend_width(v8, v22, v23, v24, v25, v26);
  unsigned int v33 = objc_msgSend_height(v8, v28, v29, v30, v31, v32);
  uint64_t v131 = 0;
  if (!self->_ContextAvailable
    || !self->_ResourcesAvailable
    || !v9
    || (unsigned int v39 = v33, objc_msgSend_pixelFormat(v9, v34, v35, v36, v37, v38) != 10)
    || !v8
    || objc_msgSend_pixelFormat(v8, v40, v41, v42, v43, v44) != 10
    || v15 != 2 * v27
    || 2 * v39 != v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v79 = 0;
    uint64_t v68 = 0;
    int v5 = -12780;
    goto LABEL_15;
  }
  uint64_t v50 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelY, v45, v46, v47, v48, v49);
  unsigned int v56 = objc_msgSend_threadExecutionWidth(self->_KernelY, v51, v52, v53, v54, v55);
  sub_262E71D0C(v50, v56, (_DWORD *)&v131 + 1, &v131, v27, v39);
  uint64_t v62 = objc_msgSend_commandQueue(self->_MetalContext, v57, v58, v59, v60, v61);
  uint64_t v68 = objc_msgSend_commandBuffer(v62, v63, v64, v65, v66, v67);

  if (!v68)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v79 = 0;
LABEL_19:
    int v5 = -12786;
    goto LABEL_15;
  }
  uint64_t v74 = objc_msgSend_computeCommandEncoder(v68, v69, v70, v71, v72, v73);
  uint64_t v79 = v74;
  if (!v74)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  objc_msgSend_setComputePipelineState_(v74, v75, (uint64_t)self->_KernelY, v76, v77, v78);
  objc_msgSend_setTexture_atIndex_(v79, v80, (uint64_t)v9, 0, v81, v82);
  objc_msgSend_setTexture_atIndex_(v79, v83, (uint64_t)v8, 1, v84, v85);
  v130[0] = v27 / HIDWORD(v131);
  v130[1] = v39 / v131;
  v130[2] = 1;
  v129[0] = HIDWORD(v131);
  v129[1] = v131;
  v129[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v79, v86, (uint64_t)v130, (uint64_t)v129, v87, v88);
  objc_msgSend_endEncoding(v79, v89, v90, v91, v92, v93);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v99 = objc_msgSend_commandQueue(v68, v94, v95, v96, v97, v98);
    uint64_t v105 = objc_msgSend_commandBuffer(v99, v100, v101, v102, v103, v104);

    objc_msgSend_setLabel_(v105, v106, @"KTRACE_MTLCMDBUF", v107, v108, v109);
    objc_msgSend_addCompletedHandler_(v105, v110, (uint64_t)&unk_270E1F438, v111, v112, v113);
    objc_msgSend_commit(v105, v114, v115, v116, v117, v118);
    objc_msgSend_addCompletedHandler_(v68, v119, (uint64_t)&unk_270E1F458, v120, v121, v122);
  }
  objc_msgSend_commit(v68, v94, v95, v96, v97, v98);
  if (v5)
  {
    objc_msgSend_waitUntilCompleted(v68, v123, v124, v125, v126, v127);
    int v5 = 0;
  }
LABEL_15:

  return v5;
}

- (int)DownscaleConvertAndCenterCrop:(__CVBuffer *)a3 outCroppedLuma:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5
{
  unsigned int Width = CVPixelBufferGetWidth(a3);
  unsigned int Height = CVPixelBufferGetHeight(a3);
  uint64_t v111 = 0;
  if (!self->_ContextAvailable || !self->_ResourcesAvailable)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  unsigned int v12 = Height;
  uint64_t v13 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v11, (uint64_t)a5, 10, 17, 0);
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  int v15 = (void *)v13;
  uint64_t v16 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v14, (uint64_t)a5, 30, 17, 1);
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_20:

    return -12786;
  }
  uint64_t v18 = (void *)v16;
  uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v17, (uint64_t)a3, 80, 22, 0);
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_19:

    goto LABEL_20;
  }
  int v21 = (void *)v19;
  uint64_t v22 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v20, (uint64_t)a4, 10, 22, 0);
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v28 = (void *)v22;
  uint64_t v29 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelDownscaleConvertAndCenterCrop, v23, v24, v25, v26, v27);
  unsigned int v35 = objc_msgSend_threadExecutionWidth(self->_KernelDownscaleConvertAndCenterCrop, v30, v31, v32, v33, v34);
  sub_262E71D0C(v29, v35, (_DWORD *)&v111 + 1, &v111, Width, v12);
  uint64_t v41 = objc_msgSend_commandQueue(self->_MetalContext, v36, v37, v38, v39, v40);
  uint64_t v47 = objc_msgSend_commandBuffer(v41, v42, v43, v44, v45, v46);

  if (!v47)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_18;
  }
  uint64_t v53 = objc_msgSend_computeCommandEncoder(v47, v48, v49, v50, v51, v52);
  if (!v53)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return -12786;
  }
  uint64_t v58 = v53;
  objc_msgSend_setComputePipelineState_(v53, v54, (uint64_t)self->_KernelDownscaleConvertAndCenterCrop, v55, v56, v57);
  objc_msgSend_setTexture_atIndex_(v58, v59, (uint64_t)v15, 0, v60, v61);
  objc_msgSend_setTexture_atIndex_(v58, v62, (uint64_t)v18, 1, v63, v64);
  objc_msgSend_setTexture_atIndex_(v58, v65, (uint64_t)v21, 2, v66, v67);
  objc_msgSend_setTexture_atIndex_(v58, v68, (uint64_t)v28, 3, v69, v70);
  v110[0] = Width / HIDWORD(v111);
  v110[1] = v12 / v111;
  v110[2] = 1;
  v109[0] = HIDWORD(v111);
  v109[1] = v111;
  v109[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v58, v71, (uint64_t)v110, (uint64_t)v109, v72, v73);
  objc_msgSend_endEncoding(v58, v74, v75, v76, v77, v78);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v84 = objc_msgSend_commandQueue(v47, v79, v80, v81, v82, v83);
    uint64_t v90 = objc_msgSend_commandBuffer(v84, v85, v86, v87, v88, v89);

    objc_msgSend_setLabel_(v90, v91, @"KTRACE_MTLCMDBUF", v92, v93, v94);
    objc_msgSend_addCompletedHandler_(v90, v95, (uint64_t)&unk_270E1F478, v96, v97, v98);
    objc_msgSend_commit(v90, v99, v100, v101, v102, v103);
    objc_msgSend_addCompletedHandler_(v47, v104, (uint64_t)&unk_270E1F498, v105, v106, v107);
  }
  objc_msgSend_commit(v47, v79, v80, v81, v82, v83);

  return 0;
}

- (int)DownscaleAndCrop:(float)a3 outY:(__CVBuffer *)a4 inYuv420:(__CVBuffer *)a5
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  if (!self->_ContextAvailable
    || !self->_ResourcesAvailable
    || !a5
    || !a4
    || CVPixelBufferGetPixelFormatType(a5) != 875704422
    || ((float Width = (float)CVPixelBufferGetWidth(a5),
         float Height = (float)CVPixelBufferGetHeight(a5),
         unsigned int v11 = CVPixelBufferGetWidth(a4),
         unsigned int v13 = CVPixelBufferGetHeight(a4),
         float v14 = (float)v13,
         Width > (float)v11)
      ? (BOOL v15 = Height <= v14)
      : (BOOL v15 = 1),
        v15))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  uint64_t v16 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v12, (uint64_t)a5, 10, 17, 0);
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  uint64_t v18 = (void *)v16;
  uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_MetalContext, v17, (uint64_t)a4, 10, 22, 0);
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_21:

    return -12786;
  }
  uint64_t v25 = (void *)v19;
  uint64_t v105 = 0;
  uint64_t v26 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_KernelDownscaleAndCrop, v20, v21, v22, v23, v24);
  unsigned int v32 = objc_msgSend_threadExecutionWidth(self->_KernelDownscaleAndCrop, v27, v28, v29, v30, v31);
  sub_262E71D0C(v26, v32, (_DWORD *)&v105 + 1, &v105, v11, v13);
  float v33 = (float)(1.0 - (float)(1.0 / a3)) * 0.5;
  v106[0] = Width / (float)((float)v11 * a3);
  v106[1] = v33 * Width;
  v106[2] = Height / (float)(v14 * a3);
  v106[3] = v33 * Height;
  uint64_t v39 = objc_msgSend_commandQueue(self->_MetalContext, v34, v35, v36, v37, v38);
  uint64_t v45 = objc_msgSend_commandBuffer(v39, v40, v41, v42, v43, v44);

  if (!v45)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_21;
  }
  uint64_t v51 = objc_msgSend_computeCommandEncoder(v45, v46, v47, v48, v49, v50);
  if (!v51)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return -12786;
  }
  uint64_t v56 = v51;
  objc_msgSend_setComputePipelineState_(v51, v52, (uint64_t)self->_KernelDownscaleAndCrop, v53, v54, v55);
  objc_msgSend_setTexture_atIndex_(v56, v57, (uint64_t)v18, 0, v58, v59);
  objc_msgSend_setTexture_atIndex_(v56, v60, (uint64_t)v25, 1, v61, v62);
  objc_msgSend_setBytes_length_atIndex_(v56, v63, (uint64_t)v106, 16, 0, v64);
  v104[0] = v11 / HIDWORD(v105);
  v104[1] = v13 / v105;
  v104[2] = 1;
  v103[0] = HIDWORD(v105);
  v103[1] = v105;
  v103[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v56, v65, (uint64_t)v104, (uint64_t)v103, v66, v67);
  objc_msgSend_endEncoding(v56, v68, v69, v70, v71, v72);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v78 = objc_msgSend_commandQueue(v45, v73, v74, v75, v76, v77);
    uint64_t v84 = objc_msgSend_commandBuffer(v78, v79, v80, v81, v82, v83);

    objc_msgSend_setLabel_(v84, v85, @"KTRACE_MTLCMDBUF", v86, v87, v88);
    objc_msgSend_addCompletedHandler_(v84, v89, (uint64_t)&unk_270E1F4B8, v90, v91, v92);
    objc_msgSend_commit(v84, v93, v94, v95, v96, v97);
    objc_msgSend_addCompletedHandler_(v45, v98, (uint64_t)&unk_270E1F4D8, v99, v100, v101);
  }
  objc_msgSend_commit(v45, v73, v74, v75, v76, v77);

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