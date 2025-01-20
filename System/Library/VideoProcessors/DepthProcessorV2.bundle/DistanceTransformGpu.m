@interface DistanceTransformGpu
- (DistanceTransformGpu)init;
- (DistanceTransformGpu)initWithParameters:(id *)a3 metalContext:(id)a4;
- (int)allocateResources;
- (int)computeDistanceWithBuffer:(__CVBuffer *)a3 distance:(__CVBuffer *)a4 waitForScheduled:(BOOL)a5;
- (int)computeDistanceWithTexture:(id)a3 distance:(id)a4 waitForScheduled:(BOOL)a5;
- (int)createDTKernels;
- (void)dealloc;
- (void)releaseResources;
@end

@implementation DistanceTransformGpu

- (DistanceTransformGpu)init
{
  v13.receiver = self;
  v13.super_class = (Class)DistanceTransformGpu;
  v2 = [(DistanceTransformGpu *)&v13 init];
  if (v2)
  {
    v3 = (FigMetalContext *)objc_alloc_init(MEMORY[0x263F2EE30]);
    metalCtx = v2->_metalCtx;
    v2->_metalCtx = v3;

    if (objc_msgSend_createDTKernels(v2, v5, v6, v7, v8, v9)) {
      v10 = 0;
    }
    else {
      v10 = v2;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (DistanceTransformGpu)initWithParameters:(id *)a3 metalContext:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DistanceTransformGpu;
  uint64_t v8 = [(DistanceTransformGpu *)&v18 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalCtx, a4);
    v9->_width = a3->var0;
    v9->_height = a3->var1;
    if (objc_msgSend_createDTKernels(v9, v10, v11, v12, v13, v14)) {
      v15 = 0;
    }
    else {
      v15 = v9;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

- (int)allocateResources
{
  if (self->_metalCtx)
  {
    v3 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 55, self->_width, self->_height, 0);
    objc_msgSend_setUsage_(v3, v4, 3, v5, v6, v7);
    uint64_t v13 = objc_msgSend_device(self->_metalCtx, v8, v9, v10, v11, v12);
    objc_super v18 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v13, v14, (uint64_t)v3, v15, v16, v17);
    tempTexture = self->_tempTexture;
    self->_tempTexture = v18;

    if (!self->_tempTexture) {
      goto LABEL_9;
    }
    v25 = objc_msgSend_device(self->_metalCtx, v20, v21, v22, v23, v24);
    v30 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v25, v26, (uint64_t)v3, v27, v28, v29);
    maskTexture = self->_maskTexture;
    self->_maskTexture = v30;

    if (!self->_maskTexture) {
      goto LABEL_9;
    }
    v37 = objc_msgSend_device(self->_metalCtx, v32, v33, v34, v35, v36);
    v41 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v37, v38, 616642, 0, v39, v40);
    v42 = self->_dtScratchBuffers[0];
    self->_dtScratchBuffers[0] = v41;

    if (!self->_dtScratchBuffers[0]) {
      goto LABEL_9;
    }
    v48 = objc_msgSend_device(self->_metalCtx, v43, v44, v45, v46, v47);
    v52 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v48, v49, 614400, 0, v50, v51);
    v53 = self->_dtScratchBuffers[1];
    self->_dtScratchBuffers[1] = v52;

    if (self->_dtScratchBuffers[1])
    {
      int v54 = 0;
    }
    else
    {
LABEL_9:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v54 = FigSignalErrorAt();
      if (v54) {
        objc_msgSend_releaseResources(self, v56, v57, v58, v59, v60, 0);
      }
    }
  }
  else
  {
    int v54 = FigSignalErrorAt();
    v3 = 0;
  }

  return v54;
}

- (void)releaseResources
{
  tempTexture = self->_tempTexture;
  self->_tempTexture = 0;

  self->_width = 0;
  self->_height = 0;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)DistanceTransformGpu;
  [(DistanceTransformGpu *)&v7 dealloc];
}

- (int)computeDistanceWithTexture:(id)a3 distance:(id)a4 waitForScheduled:(BOOL)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = v9;
  if (!self->_metalCtx
    || !v8
    || !v9
    || objc_msgSend_pixelFormat(v8, v10, v11, v12, v13, v14) != 25
    || objc_msgSend_pixelFormat(v15, v16, v17, v18, v19, v20) != 25)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    uint64_t v45 = 0;
    v32 = 0;
    goto LABEL_14;
  }
  v26 = objc_msgSend_commandQueue(self->_metalCtx, v21, v22, v23, v24, v25);
  v32 = objc_msgSend_commandBuffer(v26, v27, v28, v29, v30, v31);

  if (!v32)
  {
    fig_log_get_emitter();
LABEL_19:
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    uint64_t v45 = 0;
    goto LABEL_14;
  }
  unint64_t width = self->_width;
  unint64_t height = self->_height;
  uint64_t v40 = objc_msgSend_computeCommandEncoder(v32, v33, v34, v35, v36, v37);
  uint64_t v45 = v40;
  if (!v40)
  {
    fig_log_get_emitter();
LABEL_21:
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    goto LABEL_14;
  }
  objc_msgSend_setComputePipelineState_(v40, v41, (uint64_t)self->_dtInitKernel, v42, v43, v44);
  objc_msgSend_setTexture_atIndex_(v45, v46, (uint64_t)v8, 0, v47, v48);
  objc_msgSend_setTexture_atIndex_(v45, v49, (uint64_t)self->_maskTexture, 1, v50, v51);
  unint64_t v153 = (width + 31) >> 5;
  v154.i64[0] = (height + 31) >> 5;
  v154.i64[1] = 1;
  *(int64x2_t *)v152 = vdupq_n_s64(0x10uLL);
  *(void *)&v152[16] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v45, v52, (uint64_t)&v153, (uint64_t)v152, v53, v54);
  objc_msgSend_endEncoding(v45, v55, v56, v57, v58, v59);
  unint64_t v60 = self->_width;
  v66 = objc_msgSend_computeCommandEncoder(v32, v61, v62, v63, v64, v65);

  if (!v66)
  {
    fig_log_get_emitter();
    goto LABEL_19;
  }
  objc_msgSend_setComputePipelineState_(v66, v67, (uint64_t)self->_dtVerticalKernel, v68, v69, v70);
  objc_msgSend_setTexture_atIndex_(v66, v71, (uint64_t)self->_maskTexture, 0, v72, v73);
  objc_msgSend_setTexture_atIndex_(v66, v74, (uint64_t)self->_tempTexture, 1, v75, v76);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v77, (uint64_t)self->_dtScratchBuffers[0], 0, 0, v78);
  objc_msgSend_setBuffer_offset_atIndex_(v66, v79, (uint64_t)self->_dtScratchBuffers[1], 0, 1, v80);
  unint64_t v153 = (v60 + 31) >> 5;
  int64x2_t v154 = vdupq_n_s64(1uLL);
  *(void *)v152 = 32;
  *(_OWORD *)&v152[8] = xmmword_262EB98E8;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v66, v81, (uint64_t)&v153, (uint64_t)v152, v82, v83);
  objc_msgSend_endEncoding(v66, v84, v85, v86, v87, v88);
  unint64_t v89 = self->_height;
  uint64_t v45 = objc_msgSend_computeCommandEncoder(v32, v90, v91, v92, v93, v94);

  if (!v45)
  {
    fig_log_get_emitter();
    goto LABEL_21;
  }
  objc_msgSend_setComputePipelineState_(v45, v95, (uint64_t)self->_dtHorizontalKernel, v96, v97, v98);
  objc_msgSend_setTexture_atIndex_(v45, v99, (uint64_t)self->_tempTexture, 0, v100, v101);
  objc_msgSend_setTexture_atIndex_(v45, v102, (uint64_t)v15, 1, v103, v104);
  objc_msgSend_setBuffer_offset_atIndex_(v45, v105, (uint64_t)self->_dtScratchBuffers[0], 0, 0, v106);
  objc_msgSend_setBuffer_offset_atIndex_(v45, v107, (uint64_t)self->_dtScratchBuffers[1], 0, 1, v108);
  unint64_t v153 = 1;
  v154.i64[0] = (v89 + 31) >> 5;
  v154.i64[1] = 1;
  *(_OWORD *)v152 = xmmword_262EB98D0;
  *(void *)&v152[16] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v45, v109, (uint64_t)&v153, (uint64_t)v152, v110, v111);
  objc_msgSend_endEncoding(v45, v112, v113, v114, v115, v116);
  if (*MEMORY[0x263F00E10])
  {
    v122 = objc_msgSend_commandQueue(v32, v117, v118, v119, v120, v121);
    v128 = objc_msgSend_commandBuffer(v122, v123, v124, v125, v126, v127);

    objc_msgSend_setLabel_(v128, v129, @"KTRACE_MTLCMDBUF", v130, v131, v132);
    objc_msgSend_addCompletedHandler_(v128, v133, (uint64_t)&unk_270E222C0, v134, v135, v136);
    objc_msgSend_commit(v128, v137, v138, v139, v140, v141);
    objc_msgSend_addCompletedHandler_(v32, v142, (uint64_t)&unk_270E222E0, v143, v144, v145);
  }
  objc_msgSend_commit(v32, v117, v118, v119, v120, v121);
  if (v5)
  {
    objc_msgSend_waitUntilScheduled(v32, v146, v147, v148, v149, v150);
    int v5 = 0;
  }
LABEL_14:

  return v5;
}

- (int)computeDistanceWithBuffer:(__CVBuffer *)a3 distance:(__CVBuffer *)a4 waitForScheduled:(BOOL)a5
{
  if (a4
    && a3
    && self->_metalCtx
    && ((BOOL v7 = a5, CVPixelBufferGetPixelFormatType(a3) == 1751411059)
     || CVPixelBufferGetPixelFormatType(a3) == 1751410032
     || CVPixelBufferGetPixelFormatType(a3) == 1278226536)
    && (CVPixelBufferGetPixelFormatType(a4) == 1751411059
     || CVPixelBufferGetPixelFormatType(a4) == 1751410032
     || CVPixelBufferGetPixelFormatType(a4) == 1278226536))
  {
    uint64_t v10 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v9, 25, self->_width, self->_height, 0);
    objc_msgSend_setUsage_(v10, v11, 3, v12, v13, v14);
    uint64_t v20 = objc_msgSend_device(self->_metalCtx, v15, v16, v17, v18, v19);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
    uint64_t v24 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v20, v22, (uint64_t)v10, (uint64_t)IOSurface, 0, v23);

    if (v24
      && (objc_msgSend_device(self->_metalCtx, v25, v26, v27, v28, v29),
          uint64_t v30 = objc_claimAutoreleasedReturnValue(),
          IOSurfaceRef v31 = CVPixelBufferGetIOSurface(a4),
          uint64_t v34 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v30, v32, (uint64_t)v10, (uint64_t)v31, 0, v33), v30, v34))
    {
      int v37 = objc_msgSend_computeDistanceWithTexture_distance_waitForScheduled_(self, v35, (uint64_t)v24, (uint64_t)v34, v7, v36);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v37 = FigSignalErrorAt();
    }

    return v37;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)createDTKernels
{
  objc_msgSend_computePipelineStateFor_constants_(self->_metalCtx, a2, @"distanceInitialization", 0, v2, v3);
  int v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  dtInitKernel = self->_dtInitKernel;
  self->_dtInitKernel = v5;

  if (self->_dtInitKernel)
  {
    objc_msgSend_computePipelineStateFor_constants_(self->_metalCtx, v7, @"distanceTransformVertical", 0, v8, v9);
    uint64_t v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    dtVerticalKernel = self->_dtVerticalKernel;
    self->_dtVerticalKernel = v10;

    if (self->_dtVerticalKernel)
    {
      objc_msgSend_computePipelineStateFor_constants_(self->_metalCtx, v12, @"distanceTransformHorizontal", 0, v13, v14);
      uint64_t v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      dtHorizontalKernel = self->_dtHorizontalKernel;
      self->_dtHorizontalKernel = v15;

      if (self->_dtHorizontalKernel) {
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
  uint64_t v3 = 0;
  uint64_t v4 = &self->_dtScratchBuffers[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  objc_storeStrong((id *)&self->_maskTexture, 0);
  objc_storeStrong((id *)&self->_tempTexture, 0);
  objc_storeStrong((id *)&self->_dtHorizontalKernel, 0);
  objc_storeStrong((id *)&self->_dtVerticalKernel, 0);
  objc_storeStrong((id *)&self->_dtInitKernel, 0);

  objc_storeStrong((id *)&self->_metalCtx, 0);
}

@end