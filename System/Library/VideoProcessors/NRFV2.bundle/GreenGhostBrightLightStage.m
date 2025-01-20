@interface GreenGhostBrightLightStage
+ (int)prewarmShaders:(id)a3;
- (GreenGhostBrightLightStage)initWithMetalContext:(id)a3;
- (SidecarWriter)sidecarWriter;
- (float)computeMaxMaskSizeWithWidth:(unint64_t)a3 height:(unint64_t)a4 params:(BrightLightRepairTuning *)a5;
- (id)functionNameForProgram:(int)a3;
- (int)GhostMitigationWithPyr:(id)a3 outputImage:(id)a4 tuning:(id)a5 faceLandMarks:(id)a6 ev0FrameMetadata:(const frameMetadata *)a7 roi:(id)a8 gainMap:;
- (int)applyRepairWithLuma:(id)a3 chroma:(id)a4 lumaBase:(id)a5 chromaBase:(id)a6 mask:(id)a7 output:(id)a8 params:(BrightLightRepairTuning *)a9 gainMap:(id)a10;
- (int)compileShaders;
- (int)computeRepairValuesWithLuma:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 params:(BrightLightRepairTuning *)a7;
- (int)cropLuma:(id)a3 chroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6;
- (int)detectionWithLuma:(id)a3 chroma:(id)a4 outputMask:(id)a5 outputMaskBinary:(id)a6 params:(BrightLightDetectionTuning *)a7;
- (int)processRepairValues;
- (int)refineMask:(id)a3 outputMask:(id)a4 outputMaskBinary:(id)a5 params:(BrightLightRefinementTuning)a6;
- (int)repairPyr:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 output:(id)a7 params:(BrightLightRepairTuning *)a8 gainMap:(id)a9;
- (int)scaleROI:(GreenGhostBrightLightStage *)self fullResolutionSize:(SEL)a2 downScaledSize:;
- (int)unCropMaskCropped1:(id)a3 maskCropped2:(id)a4 maskOutput1:(id)a5 maskOutput2:(id)a6;
- (void)dealloc;
- (void)setSidecarWriter:(id)a3;
@end

@implementation GreenGhostBrightLightStage

- (id)functionNameForProgram:(int)a3
{
  if (a3 < 6) {
    return *(&off_2655C3898 + a3);
  }
  FigDebugAssert3();
  return 0;
}

- (int)compileShaders
{
  metal = self->_metal;
  v5 = objc_msgSend_functionNameForProgram_(self, a2, 0, v2);
  objc_msgSend_computePipelineStateFor_constants_(metal, v6, (uint64_t)v5, 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v8 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v7;

  if (self->_pipelineStates[0])
  {
    v11 = self->_metal;
    v12 = objc_msgSend_functionNameForProgram_(self, v9, 1, v10);
    objc_msgSend_computePipelineStateFor_constants_(v11, v13, (uint64_t)v12, 0);
    v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v15 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v14;

    if (self->_pipelineStates[1])
    {
      v18 = self->_metal;
      v19 = objc_msgSend_functionNameForProgram_(self, v16, 2, v17);
      objc_msgSend_computePipelineStateFor_constants_(v18, v20, (uint64_t)v19, 0);
      v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v22 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v21;

      if (self->_pipelineStates[2])
      {
        v25 = self->_metal;
        v26 = objc_msgSend_functionNameForProgram_(self, v23, 3, v24);
        objc_msgSend_computePipelineStateFor_constants_(v25, v27, (uint64_t)v26, 0);
        v28 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        v29 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v28;

        if (self->_pipelineStates[3])
        {
          v32 = self->_metal;
          v33 = objc_msgSend_functionNameForProgram_(self, v30, 4, v31);
          objc_msgSend_computePipelineStateFor_constants_(v32, v34, (uint64_t)v33, 0);
          v35 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          v36 = self->_pipelineStates[4];
          self->_pipelineStates[4] = v35;

          if (self->_pipelineStates[4])
          {
            v39 = self->_metal;
            v40 = objc_msgSend_functionNameForProgram_(self, v37, 5, v38);
            objc_msgSend_computePipelineStateFor_constants_(v39, v41, (uint64_t)v40, 0);
            v42 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
            v43 = self->_pipelineStates[5];
            self->_pipelineStates[5] = v42;

            if (self->_pipelineStates[5]) {
              return 0;
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (GreenGhostBrightLightStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)GreenGhostBrightLightStage;
  v6 = [(GreenGhostBrightLightStage *)&v41 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v7->_detectionLvl = 2;
  if (objc_msgSend_compileShaders(v7, v8, v9, v10))
  {
    FigDebugAssert3();
    v37 = 0;
    goto LABEL_9;
  }
  v14 = objc_msgSend_device(v7->_metal, v11, v12, v13);
  uint64_t v16 = objc_msgSend_newBufferWithLength_options_(v14, v15, 20, 0);
  sumLumaChromaMask = v7->_sumLumaChromaMask;
  v7->_sumLumaChromaMask = (MTLBuffer *)v16;

  if (!v7->_sumLumaChromaMask) {
    goto LABEL_12;
  }
  v21 = objc_msgSend_device(v7->_metal, v18, v19, v20);
  uint64_t v23 = objc_msgSend_newBufferWithLength_options_(v21, v22, 64, 0);
  patchDistances = v7->_patchDistances;
  v7->_patchDistances = (MTLBuffer *)v23;

  if (!v7->_patchDistances) {
    goto LABEL_12;
  }
  v28 = objc_msgSend_device(v7->_metal, v25, v26, v27);
  uint64_t v30 = objc_msgSend_newBufferWithLength_options_(v28, v29, 32, 0);
  repairValues = v7->_repairValues;
  v7->_repairValues = (MTLBuffer *)v30;

  if (v7->_repairValues)
  {
    *(_OWORD *)&v7->_processingROIInfo.var0 = xmmword_263118000;
    *(_DWORD *)&v7->_anon_1d4[12] = 1065353216;
    v32 = [GreenGhostCommon alloc];
    uint64_t v35 = objc_msgSend_initWithMetalContext_(v32, v33, (uint64_t)v5, v34);
    greenGhostCommon = v7->_greenGhostCommon;
    v7->_greenGhostCommon = (GreenGhostCommon *)v35;

    if (v7->_greenGhostCommon) {
      v7->_syncComputeMaskSize = 0;
    }
    else {
      FigDebugAssert3();
    }
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
    v37 = 0;
    if (v40) {
      goto LABEL_9;
    }
  }
  v37 = v7;
LABEL_9:
  uint64_t v38 = v37;

  return v38;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [GreenGhostBrightLightStage alloc];
  v7 = objc_msgSend_initWithMetalContext_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (void)dealloc
{
  sumLumaChromaMask = self->_sumLumaChromaMask;
  self->_sumLumaChromaMask = 0;

  patchDistances = self->_patchDistances;
  self->_patchDistances = 0;

  repairValues = self->_repairValues;
  self->_repairValues = 0;

  v6.receiver = self;
  v6.super_class = (Class)GreenGhostBrightLightStage;
  [(GreenGhostBrightLightStage *)&v6 dealloc];
}

- (int)scaleROI:(GreenGhostBrightLightStage *)self fullResolutionSize:(SEL)a2 downScaledSize:
{
  float32x2_t v5 = vdiv_f32(vcvt_f32_u32((uint32x2_t)v4), vcvt_f32_u32(v3));
  float32x2_t v6 = vmul_f32(v5, vcvt_f32_u32(*(uint32x2_t *)v2.i8));
  int32x2_t v7 = (int32x2_t)vcvt_u32_f32(vmul_f32(v5, vcvt_f32_u32((uint32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL))));
  int32x2_t v8 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v7, (int8x8_t)0x100000001), v7);
  float32x2_t v9 = vcvt_f32_u32(vmax_u32((uint32x2_t)vzip1_s32(v4, v8), (uint32x2_t)vzip2_s32(v4, v8)));
  *(uint32x2_t *)&long long v10 = vcvt_u32_f32(v6);
  *((int32x2_t *)&v10 + 1) = v8;
  *(_OWORD *)&self->_processingROIInfo.var0 = v10;
  *(_DWORD *)&self->_anon_1d4[12] = vdiv_f32(v9, (float32x2_t)vdup_lane_s32((int32x2_t)v9, 1)).u32[0];
  return 0;
}

- (int)cropLuma:(id)a3 chroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v59 = *(void *)&self->_processingROIInfo.var0;
  uint64_t v17 = objc_msgSend_commandQueue(self->_metal, v14, v15, v16);
  v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

  if (v21
    && (objc_msgSend_computeCommandEncoder(v21, v22, v23, v24),
        (v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = v25;
    objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_pipelineStates[0], v27);
    objc_msgSend_setTexture_atIndex_(v28, v29, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v28, v30, (uint64_t)v11, 1);
    objc_msgSend_setTexture_atIndex_(v28, v31, (uint64_t)v12, 2);
    objc_msgSend_setTexture_atIndex_(v28, v32, (uint64_t)v13, 3);
    objc_msgSend_setBytes_length_atIndex_(v28, v33, (uint64_t)&v59, 8, 0);
    unint64_t v37 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[0], v34, v35, v36);
    unint64_t v41 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[0], v38, v39, v40) / v37;
    v58[0] = objc_msgSend_width(v12, v42, v43, v44);
    v58[1] = objc_msgSend_height(v12, v45, v46, v47);
    v58[2] = 1;
    v57[0] = v37;
    v57[1] = v41;
    v57[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v28, v48, (uint64_t)v58, (uint64_t)v57);
    objc_msgSend_endEncoding(v28, v49, v50, v51);
    objc_msgSend_commit(v21, v52, v53, v54);

    int v55 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
  }

  return v55;
}

- (int)unCropMaskCropped1:(id)a3 maskCropped2:(id)a4 maskOutput1:(id)a5 maskOutput2:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v65 = *(_OWORD *)&self->_processingROIInfo.var0;
  if ((objc_msgSend_width(v12, v14, v15, v16) & 1) != 0
    || (objc_msgSend_height(v12, v17, v18, v19) & 1) != 0
    || (objc_msgSend_commandQueue(self->_metal, v20, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v23, v24, v25, v26),
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v27))
  {
    FigDebugAssert3();
    int v61 = FigSignalErrorAt();
  }
  else
  {
    uint64_t v31 = objc_msgSend_computeCommandEncoder(v27, v28, v29, v30);
    if (v31)
    {
      uint64_t v34 = v31;
      objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)self->_pipelineStates[1], v33);
      objc_msgSend_setTexture_atIndex_(v34, v35, (uint64_t)v10, 0);
      objc_msgSend_setTexture_atIndex_(v34, v36, (uint64_t)v11, 1);
      objc_msgSend_setTexture_atIndex_(v34, v37, (uint64_t)v12, 2);
      objc_msgSend_setTexture_atIndex_(v34, v38, (uint64_t)v13, 3);
      objc_msgSend_setBytes_length_atIndex_(v34, v39, (uint64_t)&v65, 16, 0);
      unint64_t v43 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[1], v40, v41, v42);
      unint64_t v47 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[1], v44, v45, v46) / v43;
      v64[0] = (unint64_t)objc_msgSend_width(v12, v48, v49, v50) >> 1;
      v64[1] = (unint64_t)objc_msgSend_height(v12, v51, v52, v53) >> 1;
      v64[2] = 1;
      v63[0] = v43;
      v63[1] = v47;
      v63[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v34, v54, (uint64_t)v64, (uint64_t)v63);
      objc_msgSend_endEncoding(v34, v55, v56, v57);
      objc_msgSend_commit(v27, v58, v59, v60);

      int v61 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v61 = FigSignalErrorAt();
    }
  }

  return v61;
}

- (int)refineMask:(id)a3 outputMask:(id)a4 outputMaskBinary:(id)a5 params:(BrightLightRefinementTuning)a6
{
  float var2 = a6.var2;
  float var1 = a6.var1;
  float var0 = a6.var0;
  BrightLightRefinementTuning v148 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v147 = 0;
  float v15 = *(float *)&self->_anon_1d4[12];
  if ((objc_msgSend_width(v12, v16, v17, v18) & 1) != 0
    || (objc_msgSend_height(v12, v19, v20, v21) & 1) != 0
    || (objc_msgSend_allocator(self->_metal, v22, v23, v24),
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        uint64_t v29 = objc_msgSend_newTextureDescriptor(v25, v26, v27, v28),
        v25,
        !v29))
  {
    FigDebugAssert3();
    int v102 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v33 = objc_msgSend_desc(v29, v30, v31, v32);
  objc_msgSend_setCompressionMode_(v33, v34, 2, v35);

  uint64_t v39 = objc_msgSend_desc(v29, v36, v37, v38);
  objc_msgSend_setCompressionFootprint_(v39, v40, 0, v41);

  uint64_t v45 = objc_msgSend_desc(v29, v42, v43, v44);
  objc_msgSend_setUsage_(v45, v46, 7, v47);

  uint64_t v51 = objc_msgSend_pixelFormat(v12, v48, v49, v50);
  int v55 = objc_msgSend_desc(v29, v52, v53, v54);
  objc_msgSend_setPixelFormat_(v55, v56, v51, v57);

  uint64_t v61 = objc_msgSend_width(v12, v58, v59, v60);
  long long v65 = objc_msgSend_desc(v29, v62, v63, v64);
  objc_msgSend_setWidth_(v65, v66, v61, v67);

  uint64_t v71 = objc_msgSend_height(v12, v68, v69, v70);
  v75 = objc_msgSend_desc(v29, v72, v73, v74);
  objc_msgSend_setHeight_(v75, v76, v71, v77);

  objc_msgSend_setLabel_(v29, v78, 0, v79);
  v83 = objc_msgSend_allocator(self->_metal, v80, v81, v82);
  v86 = objc_msgSend_newTextureWithDescriptor_(v83, v84, (uint64_t)v29, v85);
  id v147 = v86;

  if (!v86) {
    goto LABEL_17;
  }
  float v89 = v15 * var0;
  *(float *)&double v88 = v89;
  int v90 = objc_msgSend_erodeTexture_withNormalizedRadius_output_(self->_greenGhostCommon, v87, (uint64_t)v12, (uint64_t)v86, v88);
  if (v90)
  {
    int v102 = v90;
    goto LABEL_16;
  }
  *(float *)&double v92 = v89;
  int v93 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self->_greenGhostCommon, v91, (uint64_t)v86, (uint64_t)v12, v92);
  if (v93)
  {
    int v102 = v93;
    goto LABEL_16;
  }
  greenGhostCommon = self->_greenGhostCommon;
  *(float *)&double v97 = var2;
  v99 = objc_msgSend_numberWithFloat_(NSNumber, v94, v95, v96, v97);
  *(float *)&double v100 = v15 * var1;
  int v102 = objc_msgSend_dilateTexture_withNormalizedRadius_withThreshold_subtractTexture_output_(greenGhostCommon, v101, (uint64_t)v12, (uint64_t)v99, 0, v86, v100);

  if (v102)
  {
LABEL_16:
    FigDebugAssert3();
LABEL_18:

    goto LABEL_11;
  }
  v106 = objc_msgSend_commandQueue(self->_metal, v103, v104, v105);
  v110 = objc_msgSend_commandBuffer(v106, v107, v108, v109);

  if (!v110)
  {
LABEL_17:
    FigDebugAssert3();
    int v102 = FigSignalErrorAt();
    goto LABEL_18;
  }
  v114 = objc_msgSend_computeCommandEncoder(v110, v111, v112, v113);
  if (v114)
  {
    v117 = v114;
    objc_msgSend_setComputePipelineState_(v114, v115, (uint64_t)self->_pipelineStates[2], v116);
    objc_msgSend_setTexture_atIndex_(v117, v118, (uint64_t)v86, 0);
    objc_msgSend_setTexture_atIndex_(v117, v119, (uint64_t)v12, 1);
    objc_msgSend_setTexture_atIndex_(v117, v120, (uint64_t)v13, 2);
    objc_msgSend_setTexture_atIndex_(v117, v121, (uint64_t)v14, 3);
    objc_msgSend_setBytes_length_atIndex_(v117, v122, (uint64_t)&v148.var3, 4, 0);
    unint64_t v126 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[2], v123, v124, v125);
    unint64_t v130 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[2], v127, v128, v129) / v126;
    v146[0] = (unint64_t)objc_msgSend_width(v12, v131, v132, v133) >> 1;
    v146[1] = (unint64_t)objc_msgSend_height(v12, v134, v135, v136) >> 1;
    v146[2] = 1;
    v145[0] = v126;
    v145[1] = v130;
    v145[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v117, v137, (uint64_t)v146, (uint64_t)v145);
    objc_msgSend_endEncoding(v117, v138, v139, v140);
    objc_msgSend_commit(v110, v141, v142, v143);
    FigMetalDecRef();

    int v102 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v102 = FigSignalErrorAt();
  }
LABEL_11:

  return v102;
}

- (int)detectionWithLuma:(id)a3 chroma:(id)a4 outputMask:(id)a5 outputMaskBinary:(id)a6 params:(BrightLightDetectionTuning *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v136 = 0;
  id v137 = 0;
  id v135 = 0;
  uint64_t v19 = objc_msgSend_allocator(self->_metal, v16, v17, v18);
  uint64_t v23 = objc_msgSend_newTextureDescriptor(v19, v20, v21, v22);

  if (!v23)
  {
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
    goto LABEL_9;
  }
  id v133 = v15;
  uint64_t v27 = objc_msgSend_desc(v23, v24, v25, v26);
  objc_msgSend_setCompressionMode_(v27, v28, 2, v29);

  uint64_t v33 = objc_msgSend_desc(v23, v30, v31, v32);
  objc_msgSend_setCompressionFootprint_(v33, v34, 0, v35);

  uint64_t v39 = objc_msgSend_desc(v23, v36, v37, v38);
  objc_msgSend_setUsage_(v39, v40, 7, v41);

  uint64_t v45 = objc_msgSend_width(v14, v42, v43, v44);
  uint64_t v49 = objc_msgSend_desc(v23, v46, v47, v48);
  objc_msgSend_setWidth_(v49, v50, v45, v51);

  uint64_t v55 = objc_msgSend_height(v14, v52, v53, v54);
  uint64_t v59 = objc_msgSend_desc(v23, v56, v57, v58);
  objc_msgSend_setHeight_(v59, v60, v55, v61);

  uint64_t v65 = objc_msgSend_pixelFormat(v12, v62, v63, v64);
  uint64_t v69 = objc_msgSend_desc(v23, v66, v67, v68);
  objc_msgSend_setPixelFormat_(v69, v70, v65, v71);

  objc_msgSend_setLabel_(v23, v72, 0, v73);
  uint64_t v77 = objc_msgSend_allocator(self->_metal, v74, v75, v76);
  v80 = objc_msgSend_newTextureWithDescriptor_(v77, v78, (uint64_t)v23, v79);
  id v136 = v80;

  if (!v80) {
    goto LABEL_14;
  }
  uint64_t v84 = objc_msgSend_pixelFormat(v13, v81, v82, v83);
  double v88 = objc_msgSend_desc(v23, v85, v86, v87);
  objc_msgSend_setPixelFormat_(v88, v89, v84, v90);

  objc_msgSend_setLabel_(v23, v91, 0, v92);
  uint64_t v96 = objc_msgSend_allocator(self->_metal, v93, v94, v95);
  v99 = objc_msgSend_newTextureWithDescriptor_(v96, v97, (uint64_t)v23, v98);
  id v135 = v99;

  if (!v99) {
    goto LABEL_14;
  }
  int v101 = objc_msgSend_cropLuma_chroma_outputLuma_outputChroma_(self, v100, (uint64_t)v12, (uint64_t)v13, v80, v99);
  if (v101)
  {
    int v131 = v101;
LABEL_16:
    FigDebugAssert3();
    goto LABEL_17;
  }
  uint64_t v105 = objc_msgSend_pixelFormat(v14, v102, v103, v104);
  uint64_t v109 = objc_msgSend_desc(v23, v106, v107, v108);
  objc_msgSend_setPixelFormat_(v109, v110, v105, v111);

  objc_msgSend_setLabel_(v23, v112, 0, v113);
  v117 = objc_msgSend_allocator(self->_metal, v114, v115, v116);
  v120 = objc_msgSend_newTextureWithDescriptor_(v117, v118, (uint64_t)v23, v119);
  id v137 = v120;

  if (!v120)
  {
LABEL_14:
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
LABEL_17:
    id v15 = v133;
    goto LABEL_9;
  }
  greenGhostCommon = self->_greenGhostCommon;
  long long v123 = *(_OWORD *)&a7[1].var0.var0.var1;
  v134[2] = *(_OWORD *)&a7->var1.var1;
  v134[3] = v123;
  v134[4] = *(_OWORD *)&a7[1].var0.var2.var1;
  long long v124 = *(_OWORD *)&a7->var0.var2.var0;
  v134[0] = *(_OWORD *)&a7->var0.var0.var0;
  v134[1] = v124;
  int v125 = objc_msgSend_detectionWithLuma_croppedLuma_chroma_outputMask_params_processingROIInfo_(greenGhostCommon, v121, (uint64_t)v12, (uint64_t)v80, v99, v120, v134, &self->_processingROIInfo);
  if (v125)
  {
    int v131 = v125;
    goto LABEL_16;
  }
  *(float *)&double v127 = a7[1].var1.var2;
  *(float *)&double v128 = a7[1].var1.var3;
  *(float *)&double v129 = a7[2].var0.var0.var0;
  *(float *)&double v130 = a7[2].var0.var0.var1;
  id v15 = v133;
  int v131 = objc_msgSend_refineMask_outputMask_outputMaskBinary_params_(self, v126, (uint64_t)v120, (uint64_t)v14, v133, v127, v128, v129, v130);
  if (v131)
  {
    FigDebugAssert3();
  }
  else
  {
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
  }
LABEL_9:

  return v131;
}

- (int)processRepairValues
{
  float32x2_t v5 = objc_msgSend_commandQueue(self->_metal, a2, v2, v3);
  float32x2_t v9 = objc_msgSend_commandBuffer(v5, v6, v7, v8);

  if (v9
    && (objc_msgSend_computeCommandEncoder(v9, v10, v11, v12), (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v16 = v13;
    objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_pipelineStates[4], v15);
    objc_msgSend_setBuffer_offset_atIndex_(v16, v17, (uint64_t)self->_sumLumaChromaMask, 0, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v16, v18, (uint64_t)self->_patchDistances, 0, 1);
    objc_msgSend_setBuffer_offset_atIndex_(v16, v19, (uint64_t)self->_repairValues, 0, 2);
    unint64_t v23 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[4], v20, v21, v22);
    unint64_t v27 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[4], v24, v25, v26);
    int64x2_t v38 = vdupq_n_s64(1uLL);
    uint64_t v39 = 1;
    v37[0] = v23;
    v37[1] = v27 / v23;
    v37[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v16, v28, (uint64_t)&v38, (uint64_t)v37);
    objc_msgSend_endEncoding(v16, v29, v30, v31);
    objc_msgSend_commit(v9, v32, v33, v34);

    int v35 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
  }

  return v35;
}

- (int)computeRepairValuesWithLuma:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 params:(BrightLightRepairTuning *)a7
{
  id v12 = a3;
  id v186 = a4;
  id v187 = a5;
  id v13 = a6;
  float var2 = a7->var2;
  unint64_t v18 = objc_msgSend_width(v12, v15, v16, v17);
  if (v18 <= objc_msgSend_height(v12, v19, v20, v21)) {
    uint64_t v25 = objc_msgSend_height(v12, v22, v23, v24);
  }
  else {
    uint64_t v25 = objc_msgSend_width(v12, v22, v23, v24);
  }
  float v192 = var2 * (float)(unint64_t)v25;
  id v190 = 0;
  id v191 = 0;
  uint64_t v29 = objc_msgSend_allocator(self->_metal, v26, v27, v28);
  uint64_t v33 = objc_msgSend_newTextureDescriptor(v29, v30, v31, v32);

  if (!v33) {
    goto LABEL_24;
  }
  uint64_t v37 = objc_msgSend_desc(v33, v34, v35, v36);
  objc_msgSend_setCompressionMode_(v37, v38, 2, v39);

  uint64_t v43 = objc_msgSend_desc(v33, v40, v41, v42);
  objc_msgSend_setCompressionFootprint_(v43, v44, 0, v45);

  uint64_t v49 = objc_msgSend_desc(v33, v46, v47, v48);
  objc_msgSend_setUsage_(v49, v50, 7, v51);

  uint64_t v55 = objc_msgSend_pixelFormat(v187, v52, v53, v54);
  uint64_t v59 = objc_msgSend_desc(v33, v56, v57, v58);
  objc_msgSend_setPixelFormat_(v59, v60, v55, v61);

  uint64_t v65 = objc_msgSend_width(v187, v62, v63, v64);
  uint64_t v69 = objc_msgSend_desc(v33, v66, v67, v68);
  objc_msgSend_setWidth_(v69, v70, v65, v71);

  uint64_t v75 = objc_msgSend_height(v187, v72, v73, v74);
  uint64_t v79 = objc_msgSend_desc(v33, v76, v77, v78);
  objc_msgSend_setHeight_(v79, v80, v75, v81);

  objc_msgSend_setLabel_(v33, v82, 0, v83);
  uint64_t v87 = objc_msgSend_allocator(self->_metal, v84, v85, v86);
  uint64_t v90 = objc_msgSend_newTextureWithDescriptor_(v87, v88, (uint64_t)v33, v89);
  id v191 = v90;

  if (!v90) {
    goto LABEL_24;
  }
  *(float *)&double v92 = a7->var0;
  int v93 = objc_msgSend_dilateTexture_withNormalizedRadius_withThreshold_subtractTexture_output_(self->_greenGhostCommon, v91, (uint64_t)v13, 0, v13, v90, v92);
  if (v93)
  {
    int v183 = v93;
LABEL_23:
    FigDebugAssert3();
    goto LABEL_17;
  }
  objc_msgSend_setLabel_(v33, v94, 0, v95);
  v99 = objc_msgSend_allocator(self->_metal, v96, v97, v98);
  int v102 = objc_msgSend_newTextureWithDescriptor_(v99, v100, (uint64_t)v33, v101);
  id v190 = v102;

  if (!v102) {
    goto LABEL_24;
  }
  *(float *)&double v104 = a7->var1;
  int v105 = objc_msgSend_dilateTexture_withNormalizedRadius_withThreshold_subtractTexture_output_(self->_greenGhostCommon, v103, (uint64_t)v187, 0, v187, v102, v104);
  if (v105)
  {
    int v183 = v105;
    goto LABEL_23;
  }
  uint64_t v109 = objc_msgSend_commandQueue(self->_metal, v106, v107, v108);
  uint64_t v113 = objc_msgSend_commandBuffer(v109, v110, v111, v112);

  if (!v113)
  {
LABEL_24:
    FigDebugAssert3();
    int v183 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v117 = objc_msgSend_blitCommandEncoder(v113, v114, v115, v116);
  if (v117)
  {
    v121 = (void *)v117;
    id v185 = v13;
    sumLumaChromaMask = self->_sumLumaChromaMask;
    uint64_t v123 = objc_msgSend_length(sumLumaChromaMask, v118, v119, v120);
    objc_msgSend_fillBuffer_range_value_(v121, v124, (uint64_t)sumLumaChromaMask, 0, v123, 0);
    patchDistances = self->_patchDistances;
    uint64_t v129 = objc_msgSend_length(patchDistances, v126, v127, v128);
    objc_msgSend_fillBuffer_range_value_(v121, v130, (uint64_t)patchDistances, 0, v129, 0);
    objc_msgSend_endEncoding(v121, v131, v132, v133);
    objc_msgSend_commit(v113, v134, v135, v136);
    uint64_t v140 = objc_msgSend_commandQueue(self->_metal, v137, v138, v139);
    v144 = objc_msgSend_commandBuffer(v140, v141, v142, v143);

    if (v144)
    {
      BrightLightRefinementTuning v148 = objc_msgSend_computeCommandEncoder(v144, v145, v146, v147);
      if (v148)
      {
        v151 = v148;
        objc_msgSend_setComputePipelineState_(v148, v149, (uint64_t)self->_pipelineStates[3], v150);
        objc_msgSend_setTexture_atIndex_(v151, v152, (uint64_t)v12, 0);
        objc_msgSend_setTexture_atIndex_(v151, v153, (uint64_t)v186, 1);
        objc_msgSend_setTexture_atIndex_(v151, v154, (uint64_t)v90, 2);
        objc_msgSend_setTexture_atIndex_(v151, v155, (uint64_t)v102, 3);
        objc_msgSend_setBuffer_offset_atIndex_(v151, v156, (uint64_t)self->_sumLumaChromaMask, 0, 0);
        objc_msgSend_setBuffer_offset_atIndex_(v151, v157, (uint64_t)self->_patchDistances, 0, 1);
        objc_msgSend_setBytes_length_atIndex_(v151, v158, (uint64_t)&v192, 4, 2);
        unint64_t v162 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[3], v159, v160, v161);
        unint64_t v166 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[3], v163, v164, v165) / v162;
        v189[0] = objc_msgSend_width(v12, v167, v168, v169);
        v189[1] = objc_msgSend_height(v12, v170, v171, v172);
        v189[2] = 1;
        v188[0] = v162;
        v188[1] = v166;
        v188[2] = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v151, v173, (uint64_t)v189, (uint64_t)v188);
        objc_msgSend_endEncoding(v151, v174, v175, v176);
        objc_msgSend_commit(v144, v177, v178, v179);
        int v183 = objc_msgSend_processRepairValues(self, v180, v181, v182);
        if (v183)
        {
          FigDebugAssert3();
        }
        else
        {
          FigMetalDecRef();
          FigMetalDecRef();
        }
      }
      else
      {
        FigDebugAssert3();
        int v183 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v183 = FigSignalErrorAt();
    }
    id v13 = v185;
  }
  else
  {
    FigDebugAssert3();
    int v183 = FigSignalErrorAt();
  }
LABEL_17:

  return v183;
}

- (float)computeMaxMaskSizeWithWidth:(unint64_t)a3 height:(unint64_t)a4 params:(BrightLightRepairTuning *)a5
{
  float var8 = a5->var8;
  float v6 = sqrtf(var8);
  return (float)((float)((float)((float)(v6 + (float)(a5->var0 * 2.0)) * (float)(v6 + (float)(a5->var0 * 2.0))) - var8)
               * (float)a3)
       * (float)a4;
}

- (int)applyRepairWithLuma:(id)a3 chroma:(id)a4 lumaBase:(id)a5 chromaBase:(id)a6 mask:(id)a7 output:(id)a8 params:(BrightLightRepairTuning *)a9 gainMap:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  uint64_t v21 = (uint64_t *)a8;
  id v22 = a10;
  unint64_t v26 = objc_msgSend_width(v16, v23, v24, v25);
  if (v26 <= objc_msgSend_height(v16, v27, v28, v29)) {
    uint64_t v33 = objc_msgSend_height(v16, v30, v31, v32);
  }
  else {
    uint64_t v33 = objc_msgSend_width(v16, v30, v31, v32);
  }
  a9->float var2 = a9->var2 * (float)(unint64_t)v33;
  uint64_t v37 = objc_msgSend_width(v20, v34, v35, v36);
  uint64_t v41 = objc_msgSend_height(v20, v38, v39, v40);
  objc_msgSend_computeMaxMaskSizeWithWidth_height_params_(self, v42, v37, v41, a9);
  int v94 = v46;
  if (v22 && objc_msgSend_isCompressed(v22, v43, v44, v45))
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v89 = v21;
  uint64_t v47 = (uint64_t)v17;
  uint64_t v48 = objc_msgSend_commandQueue(self->_metal, v43, v44, v45);
  uint64_t v52 = objc_msgSend_commandBuffer(v48, v49, v50, v51);

  if (!v52)
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
LABEL_12:
    id v17 = (id)v47;
    uint64_t v21 = v89;
    goto LABEL_9;
  }
  uint64_t v56 = objc_msgSend_computeCommandEncoder(v52, v53, v54, v55);
  if (!v56)
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();

    goto LABEL_12;
  }
  uint64_t v59 = v56;
  objc_msgSend_setComputePipelineState_(v56, v57, (uint64_t)self->_pipelineStates[5], v58);
  objc_msgSend_setTexture_atIndex_(v59, v60, (uint64_t)v16, 0);
  uint64_t v90 = (uint64_t)v20;
  uint64_t v61 = (uint64_t)v22;
  v62 = (void *)v47;
  objc_msgSend_setTexture_atIndex_(v59, v63, v47, 1);
  objc_msgSend_setTexture_atIndex_(v59, v64, (uint64_t)v18, 2);
  objc_msgSend_setTexture_atIndex_(v59, v65, (uint64_t)v19, 3);
  objc_msgSend_setTexture_atIndex_(v59, v66, v90, 4);
  uint64_t v21 = v89;
  objc_msgSend_setTexture_atIndex_(v59, v67, v89[2], 5);
  objc_msgSend_setTexture_atIndex_(v59, v68, v89[3], 6);
  objc_msgSend_setTexture_atIndex_(v59, v69, v61, 7);
  objc_msgSend_setBuffer_offset_atIndex_(v59, v70, (uint64_t)self->_repairValues, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v59, v71, (uint64_t)a9, 36, 1);
  objc_msgSend_setBytes_length_atIndex_(v59, v72, (uint64_t)&self->_faceBodyBoundaries, 352, 2);
  objc_msgSend_setBytes_length_atIndex_(v59, v73, (uint64_t)&v94, 4, 3);
  v93[0] = objc_msgSend_width(v16, v74, v75, v76);
  v93[1] = objc_msgSend_height(v16, v77, v78, v79);
  v93[2] = 1;
  long long v91 = xmmword_263117D20;
  uint64_t v92 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v59, v80, (uint64_t)v93, (uint64_t)&v91);
  objc_msgSend_endEncoding(v59, v81, v82, v83);
  objc_msgSend_commit(v52, v84, v85, v86);

  id v17 = v62;
  id v22 = (id)v61;
  id v20 = (id)v90;
  int v87 = 0;
LABEL_9:

  return v87;
}

- (int)repairPyr:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 output:(id)a7 params:(BrightLightRepairTuning *)a8 gainMap:(id)a9
{
  uint64_t v15 = a3;
  id v99 = a4;
  id v16 = a5;
  id v100 = a6;
  id v17 = a7;
  id v101 = a9;
  id v106 = 0;
  uint64_t v21 = objc_msgSend_allocator(self->_metal, v18, v19, v20);
  uint64_t v25 = objc_msgSend_newTextureDescriptor(v21, v22, v23, v24);

  int v102 = v15;
  if (!v25) {
    goto LABEL_8;
  }
  uint64_t v29 = objc_msgSend_desc(v25, v26, v27, v28);
  objc_msgSend_setCompressionMode_(v29, v30, 2, v31);

  uint64_t v35 = objc_msgSend_desc(v25, v32, v33, v34);
  objc_msgSend_setCompressionFootprint_(v35, v36, 0, v37);

  uint64_t v41 = objc_msgSend_desc(v25, v38, v39, v40);
  objc_msgSend_setUsage_(v41, v42, 7, v43);

  uint64_t v47 = objc_msgSend_pixelFormat(v16, v44, v45, v46);
  uint64_t v51 = objc_msgSend_desc(v25, v48, v49, v50);
  objc_msgSend_setPixelFormat_(v51, v52, v47, v53);

  uint64_t v57 = objc_msgSend_width(v16, v54, v55, v56);
  uint64_t v61 = objc_msgSend_desc(v25, v58, v59, v60);
  objc_msgSend_setWidth_(v61, v62, v57, v63);

  uint64_t v67 = objc_msgSend_height(v16, v64, v65, v66);
  uint64_t v71 = objc_msgSend_desc(v25, v68, v69, v70);
  objc_msgSend_setHeight_(v71, v72, v67, v73);

  objc_msgSend_setLabel_(v25, v74, 0, v75);
  uint64_t v79 = objc_msgSend_allocator(self->_metal, v76, v77, v78);
  uint64_t v82 = objc_msgSend_newTextureWithDescriptor_(v79, v80, (uint64_t)v25, v81);
  id v106 = v82;

  if (!v82)
  {
LABEL_8:
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
LABEL_10:
    double v88 = v99;
    uint64_t v89 = v100;
LABEL_12:
    uint64_t v95 = v101;
    goto LABEL_7;
  }
  int v84 = objc_msgSend_downscaleInput_output_(self->_greenGhostCommon, v83, v15[42], (uint64_t)v82);
  if (v84)
  {
    int v97 = v84;
    FigDebugAssert3();
    goto LABEL_10;
  }
  long long v86 = *(_OWORD *)&a8->var4;
  long long v103 = *(_OWORD *)&a8->var0;
  long long v104 = v86;
  float var8 = a8->var8;
  uint64_t v87 = (uint64_t)v82;
  double v88 = v99;
  uint64_t v89 = v100;
  int v90 = objc_msgSend_computeRepairValuesWithLuma_chroma_mask_maskBinary_params_(self, v85, v87, (uint64_t)v99, v16, v100, &v103);
  if (v90)
  {
    int v97 = v90;
    FigDebugAssert3();
    goto LABEL_12;
  }
  FigMetalDecRef();
  uint64_t v91 = v102[42];
  uint64_t v92 = v102[62];
  uint64_t v93 = v102[self->_detectionLvl + 42];
  long long v94 = *(_OWORD *)&a8->var4;
  long long v103 = *(_OWORD *)&a8->var0;
  long long v104 = v94;
  float var8 = a8->var8;
  uint64_t v95 = v101;
  int v97 = objc_msgSend_applyRepairWithLuma_chroma_lumaBase_chromaBase_mask_output_params_gainMap_(self, v96, v91, v92, v93, v99, v16, v17, &v103, v101);
  if (v97) {
    FigDebugAssert3();
  }
LABEL_7:

  return v97;
}

- (int)GhostMitigationWithPyr:(id)a3 outputImage:(id)a4 tuning:(id)a5 faceLandMarks:(id)a6 ev0FrameMetadata:(const frameMetadata *)a7 roi:(id)a8 gainMap:
{
  double v198 = v9;
  uint64_t v15 = (void **)a3;
  v199 = (void **)a4;
  id v202 = a5;
  id v201 = a6;
  id v200 = a8;
  id v234 = 0;
  id v235 = 0;
  id v232 = 0;
  id v233 = 0;
  id v231 = 0;
  uint64_t v19 = objc_msgSend_width(v15[self->_detectionLvl + 61], v16, v17, v18);
  uint64_t v23 = objc_msgSend_height(v15[self->_detectionLvl + 61], v20, v21, v22);
  unsigned int v27 = objc_msgSend_width(v15[42], v24, v25, v26);
  unsigned int v31 = objc_msgSend_height(v15[42], v28, v29, v30);
  uint64_t v35 = objc_msgSend_allocator(self->_metal, v32, v33, v34);
  uint64_t v39 = objc_msgSend_newTextureDescriptor(v35, v36, v37, v38);

  if (!v39)
  {
    uint64_t v196 = v8;
    LODWORD(v195) = 0;
LABEL_29:
    FigDebugAssert3();
    int v186 = FigSignalErrorAt();
LABEL_31:
    long long v94 = v199;
LABEL_41:
    uint64_t v179 = v202;
    goto LABEL_23;
  }
  uint64_t v43 = objc_msgSend_desc(v39, v40, v41, v42);
  objc_msgSend_setCompressionMode_(v43, v44, 2, v45);

  uint64_t v49 = objc_msgSend_desc(v39, v46, v47, v48);
  objc_msgSend_setCompressionFootprint_(v49, v50, 0, v51);

  uint64_t v55 = objc_msgSend_desc(v39, v52, v53, v54);
  objc_msgSend_setUsage_(v55, v56, 7, v57);

  uint64_t v61 = objc_msgSend_desc(v39, v58, v59, v60);
  objc_msgSend_setPixelFormat_(v61, v62, 65, v63);

  uint64_t v67 = objc_msgSend_desc(v39, v64, v65, v66);
  objc_msgSend_setWidth_(v67, v68, v19, v69);

  uint64_t v73 = objc_msgSend_desc(v39, v70, v71, v72);
  objc_msgSend_setHeight_(v73, v74, v23, v75);

  objc_msgSend_setLabel_(v39, v76, 0, v77);
  uint64_t v81 = objc_msgSend_allocator(self->_metal, v78, v79, v80);
  int v84 = objc_msgSend_newTextureWithDescriptor_(v81, v82, (uint64_t)v39, v83);
  id v235 = v84;

  if (!v84)
  {
    uint64_t v196 = v8;
    LODWORD(v195) = 0;
    goto LABEL_29;
  }
  int v86 = objc_msgSend_downscaleInput_output_(self->_greenGhostCommon, v85, (uint64_t)v15[self->_detectionLvl + 60], (uint64_t)v84);
  if (v86)
  {
    int v186 = v86;
    uint64_t v196 = v8;
    LODWORD(v195) = v86;
    FigDebugAssert3();
    goto LABEL_31;
  }
  int v90 = objc_msgSend_scaleROI_fullResolutionSize_downScaledSize_(self, v87, v88, v89, v198, COERCE_DOUBLE(__PAIR64__(v31, v27)), COERCE_DOUBLE(__PAIR64__(v23, v19)));
  long long v94 = v199;
  if (v90)
  {
    int v186 = v90;
    uint64_t v196 = v8;
    LODWORD(v195) = v90;
LABEL_40:
    FigDebugAssert3();
    goto LABEL_41;
  }
  uint64_t v95 = *(unsigned int *)&self->_anon_1d4[4];
  uint64_t v96 = objc_msgSend_desc(v39, v91, v92, v93);
  objc_msgSend_setWidth_(v96, v97, v95, v98);

  uint64_t v99 = *(unsigned int *)&self->_anon_1d4[8];
  long long v103 = objc_msgSend_desc(v39, v100, v101, v102);
  objc_msgSend_setHeight_(v103, v104, v99, v105);

  uint64_t v109 = objc_msgSend_desc(v39, v106, v107, v108);
  objc_msgSend_setPixelFormat_(v109, v110, 25, v111);

  objc_msgSend_setLabel_(v39, v112, 0, v113);
  uint64_t v117 = objc_msgSend_allocator(self->_metal, v114, v115, v116);
  uint64_t v120 = objc_msgSend_newTextureWithDescriptor_(v117, v118, (uint64_t)v39, v119);
  id v232 = v120;

  if (!v120)
  {
    uint64_t v196 = v8;
    LODWORD(v195) = 0;
LABEL_38:
    FigDebugAssert3();
    int v186 = FigSignalErrorAt();
    goto LABEL_41;
  }
  objc_msgSend_setLabel_(v39, v121, 0, v122);
  unint64_t v126 = objc_msgSend_allocator(self->_metal, v123, v124, v125);
  uint64_t v129 = objc_msgSend_newTextureWithDescriptor_(v126, v127, (uint64_t)v39, v128);
  id v231 = v129;

  if (!v129)
  {
    uint64_t v196 = v8;
    LODWORD(v195) = 0;
    goto LABEL_38;
  }
  uint64_t v133 = (uint64_t)v15[self->_detectionLvl + 42];
  if (v202)
  {
    objc_msgSend_tuningParams(v202, v130, v131, v132);
  }
  else
  {
    uint64_t v229 = 0;
    long long v227 = 0u;
    long long v228 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
  }
  v230[2] = v223;
  v230[3] = v224;
  v230[4] = v225;
  v230[5] = v226;
  v230[0] = v221;
  v230[1] = v222;
  int v134 = objc_msgSend_detectionWithLuma_chroma_outputMask_outputMaskBinary_params_(self, v130, v133, (uint64_t)v84, v120, v129, v230);
  if (v134)
  {
    int v186 = v134;
    uint64_t v196 = v8;
    LODWORD(v195) = v134;
    goto LABEL_40;
  }
  uint64_t v138 = objc_msgSend_desc(v39, v135, v136, v137);
  objc_msgSend_setWidth_(v138, v139, v19, v140);

  v144 = objc_msgSend_desc(v39, v141, v142, v143);
  objc_msgSend_setHeight_(v144, v145, v23, v146);

  objc_msgSend_setLabel_(v39, v147, 0, v148);
  v152 = objc_msgSend_allocator(self->_metal, v149, v150, v151);
  v155 = objc_msgSend_newTextureWithDescriptor_(v152, v153, (uint64_t)v39, v154);
  id v234 = v155;

  if (!v155)
  {
    uint64_t v196 = v8;
    LODWORD(v195) = 0;
    goto LABEL_38;
  }
  objc_msgSend_setLabel_(v39, v156, 0, v157);
  uint64_t v161 = objc_msgSend_allocator(self->_metal, v158, v159, v160);
  uint64_t v164 = objc_msgSend_newTextureWithDescriptor_(v161, v162, (uint64_t)v39, v163);
  id v233 = v164;

  if (!v164)
  {
    uint64_t v196 = v8;
    LODWORD(v195) = 0;
    goto LABEL_38;
  }
  int v166 = objc_msgSend_unCropMaskCropped1_maskCropped2_maskOutput1_maskOutput2_(self, v165, (uint64_t)v120, (uint64_t)v129, v155, v164);
  if (v166)
  {
    int v186 = v166;
    uint64_t v196 = v8;
    LODWORD(v195) = v166;
    goto LABEL_40;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  double v170 = (double)(unint64_t)objc_msgSend_width(v199[2], v167, v168, v169);
  double v177 = (double)(unint64_t)objc_msgSend_height(v199[2], v171, v172, v173);
  greenGhostCommon = self->_greenGhostCommon;
  uint64_t v179 = v202;
  if (v202)
  {
    objc_msgSend_tuningParams(v202, v174, v175, v176);
    int FaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output = objc_msgSend_extractFaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output_(greenGhostCommon, v180, (uint64_t)v201, (uint64_t)a7, &self->_faceBodyBoundaries, v170, v177, *((double *)&v208 + 1), COERCE_DOUBLE(1036831949));
  }
  else
  {
    uint64_t v218 = 0;
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    int FaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output = objc_msgSend_extractFaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output_(greenGhostCommon, v174, (uint64_t)v201, (uint64_t)a7, &self->_faceBodyBoundaries, v170, v177, 0.0, COERCE_DOUBLE(1036831949));
  }
  if (FaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output)
  {
    int v186 = FaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output;
    uint64_t v196 = v8;
    LODWORD(v195) = FaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output;
  }
  else
  {
    if (v202)
    {
      objc_msgSend_tuningParams(v202, v182, v183, v184);
    }
    else
    {
      int v205 = 0;
      long long v203 = 0u;
      long long v204 = 0u;
    }
    v206[0] = v203;
    v206[1] = v204;
    int v207 = v205;
    int v185 = objc_msgSend_repairPyr_chroma_mask_maskBinary_output_params_gainMap_(self, v182, (uint64_t)v15, (uint64_t)v84, v155, v164, v199, v206, v200);
    int v186 = v185;
    if (!v185)
    {
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
      goto LABEL_23;
    }
    uint64_t v196 = v8;
    LODWORD(v195) = v185;
  }
  FigDebugAssert3();
LABEL_23:
  v189 = objc_opt_new();
  if (self->_faceBodyBoundaries.nFaces) {
    objc_msgSend_numberWithInt_(NSNumber, v187, 1, v188, v195, v196);
  }
  else {
  id v190 = objc_msgSend_numberWithInt_(NSNumber, v187, *(_DWORD *)&self->_anon_74[172] != 0, v188, v195, v196);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v189, v191, (uint64_t)v190, @"foundFacesOrBodies");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  objc_msgSend_addToSidecar_forKey_(WeakRetained, v193, (uint64_t)v189, @"GreenGhostBrightLight");

  return v186;
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
  objc_storeStrong((id *)&self->_repairValues, 0);
  objc_storeStrong((id *)&self->_patchDistances, 0);
  objc_storeStrong((id *)&self->_sumLumaChromaMask, 0);
  objc_storeStrong((id *)&self->_greenGhostCommon, 0);
  for (uint64_t i = 56; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end