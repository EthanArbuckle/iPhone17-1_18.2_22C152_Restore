@interface GreenGhostLowLightStage
+ (int)prewarmShaders:(id)a3;
- (GreenGhostLowLightStage)initWithMetalContext:(id)a3;
- (SidecarWriter)sidecarWriter;
- (id)functionNameForProgram:(int)a3;
- (int)allocateFusionWeightTexturesWithWidth:(unint64_t)a3 height:(unint64_t)a4;
- (int)applyInpaintWithDownscaledLuma:(id)a3 propagatedLuma:(id)a4 downscaledChroma:(id)a5 propagatedChroma:(id)a6 propagatedGradient:(id)a7 maskPreInpainting:(id)a8 outputLuma:(id)a9 outputChroma:(id)a10 params:(LowLightInpaintTuning *)a11;
- (int)canMitigationProceedWithMaxMaskAverage:(float)a3;
- (int)compileShaders;
- (int)detectionWithRefPyramid:(id)a3 otherPyramid:(id)a4 refDetection:(BOOL)a5 refProperties:(frameProperties_t *)a6 otherProperties:(frameProperties_t *)a7 maskMBBinary:(id)a8 params:(LowLightTuning *)a9;
- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(frameProperties_t *)a5 otherProperties:(frameProperties_t *)a6 currentFusionWeights:(id)a7 relativeBrightness:(float)a8;
- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(frameProperties_t *)a5 otherProperties:(frameProperties_t *)a6 maskMBBinary:(id)a7 params:(LowLightFusionTuning *)a8;
- (int)guidedFilter:(id)a3 withGuideLuma:(id)a4 guideChroma:(id)a5 params:(LowLightRefinementTuning *)a6 output:(id)a7;
- (int)inpaintLuma:(id)a3 andChroma:(id)a4 tuningParams:(id)a5;
- (int)mitigationWithRefPyramid:(id)a3 otherPyramid:(id)a4 isRefProcessing:(BOOL)a5 refProperties:(frameProperties_t *)a6 otherProperties:(frameProperties_t *)a7 greenGhostBuffers:(id)a8 tuningParams:(id)a9;
- (int)mixFusedTexturesWithRefLuma:(id)a3 refChroma:(id)a4 refProperties:(frameProperties_t *)a5 tuningParams:(id)a6;
- (int)prepareInpaintingWithLuma:(id)a3 andChroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6 outputGradient:(id)a7 params:(LowLightInpaintTuning *)a8;
- (int)propagateLuma:(id)a3 chroma:(id)a4 gradient:(id)a5 outputLuma:(id)a6 outputChroma:(id)a7 outputGradient:(id)a8 params:(LowLightInpaintTuning *)a9;
- (int)refineDetectionWithGuideLuma:(id)a3 guideChroma:(id)a4 params:(LowLightRefinementTuning *)a5 output:(id)a6;
- (int)singleBracketDetectionWithLuma:(id)a3 chroma:(id)a4 params:(DetectionTuning *)a5;
- (int)updateFusionWeights:(id)a3;
- (int)updateMaskAndComputeGradientForLuma:(id)a3 output:(id)a4 params:(LowLightInpaintTuning *)a5;
- (uint64_t)computeFusionWeightsRefLuma:(__n128)a3 refChroma:(__n128)a4 otherLuma:(__n128)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 innerMask:(void *)a8 relativeBrightness:(void *)a9 homography:(void *)a10 output:(void *)a11 params:(void *)a12;
- (uint64_t)computeTemporalVariationsRefImg:(uint64_t)a3 OtherImg:(void *)a4 refProperties:(void *)a5 otherProperties:(uint64_t)a6 params:(_OWORD *)a7;
- (uint64_t)prepareFusionRefLuma:(double)a3 refChroma:(double)a4 otherLuma:(double)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 relativeBrightness:(void *)a8 homography:(void *)a9 output:(void *)a10 params:(void *)a11;
- (void)dealloc;
- (void)releaseTextures;
- (void)reset;
- (void)scaleFaceBodyBoundariesWithSizeRatio:(float)a3;
- (void)setSidecarWriter:(id)a3;
@end

@implementation GreenGhostLowLightStage

- (id)functionNameForProgram:(int)a3
{
  if (a3 < 0xD) {
    return (id)*((void *)&off_2655C34D0 + a3);
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

            if (self->_pipelineStates[5])
            {
              v46 = self->_metal;
              v47 = objc_msgSend_functionNameForProgram_(self, v44, 6, v45);
              objc_msgSend_computePipelineStateFor_constants_(v46, v48, (uint64_t)v47, 0);
              v49 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
              v50 = self->_pipelineStates[6];
              self->_pipelineStates[6] = v49;

              if (self->_pipelineStates[6])
              {
                v53 = self->_metal;
                v54 = objc_msgSend_functionNameForProgram_(self, v51, 7, v52);
                objc_msgSend_computePipelineStateFor_constants_(v53, v55, (uint64_t)v54, 0);
                v56 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                v57 = self->_pipelineStates[7];
                self->_pipelineStates[7] = v56;

                if (self->_pipelineStates[7])
                {
                  v60 = self->_metal;
                  v61 = objc_msgSend_functionNameForProgram_(self, v58, 8, v59);
                  objc_msgSend_computePipelineStateFor_constants_(v60, v62, (uint64_t)v61, 0);
                  v63 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                  v64 = self->_pipelineStates[8];
                  self->_pipelineStates[8] = v63;

                  if (self->_pipelineStates[8])
                  {
                    v67 = self->_metal;
                    v68 = objc_msgSend_functionNameForProgram_(self, v65, 9, v66);
                    objc_msgSend_computePipelineStateFor_constants_(v67, v69, (uint64_t)v68, 0);
                    v70 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                    v71 = self->_pipelineStates[9];
                    self->_pipelineStates[9] = v70;

                    if (self->_pipelineStates[9])
                    {
                      v74 = self->_metal;
                      v75 = objc_msgSend_functionNameForProgram_(self, v72, 10, v73);
                      objc_msgSend_computePipelineStateFor_constants_(v74, v76, (uint64_t)v75, 0);
                      v77 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                      v78 = self->_pipelineStates[10];
                      self->_pipelineStates[10] = v77;

                      if (self->_pipelineStates[10])
                      {
                        v81 = self->_metal;
                        v82 = objc_msgSend_functionNameForProgram_(self, v79, 11, v80);
                        objc_msgSend_computePipelineStateFor_constants_(v81, v83, (uint64_t)v82, 0);
                        v84 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                        v85 = self->_pipelineStates[11];
                        self->_pipelineStates[11] = v84;

                        if (self->_pipelineStates[11])
                        {
                          v88 = self->_metal;
                          v89 = objc_msgSend_functionNameForProgram_(self, v86, 12, v87);
                          objc_msgSend_computePipelineStateFor_constants_(v88, v90, (uint64_t)v89, 0);
                          v91 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                          v92 = self->_pipelineStates[12];
                          self->_pipelineStates[12] = v91;

                          if (self->_pipelineStates[12]) {
                            return 0;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (GreenGhostLowLightStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)GreenGhostLowLightStage;
  v6 = [(GreenGhostLowLightStage *)&v32 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  *(void *)&v7->_detectionLvl = 2;
  v7->_nonRefFramesCount = 0;
  v7->_isFirstNonRefFrame = 1;
  v7->_canMitigationProceed = 1;
  v11 = objc_msgSend_device(v7->_metal, v8, v9, v10);
  uint64_t v13 = objc_msgSend_newBufferWithLength_options_(v11, v12, 4, 0);
  sumMaskBuffer = v7->_sumMaskBuffer;
  v7->_sumMaskBuffer = (MTLBuffer *)v13;

  if (v7->_sumMaskBuffer)
  {
    if (objc_msgSend_compileShaders(v7, v15, v16, v17))
    {
      FigDebugAssert3();
      v28 = 0;
      goto LABEL_7;
    }
    v18 = [GreenGhostCommon alloc];
    uint64_t v21 = objc_msgSend_initWithMetalContext_(v18, v19, (uint64_t)v5, v20);
    greenGhostCommon = v7->_greenGhostCommon;
    v7->_greenGhostCommon = (GreenGhostCommon *)v21;

    if (!v7->_greenGhostCommon
      || (v23 = [TextureUtils alloc],
          uint64_t v26 = objc_msgSend_initWithMetalContext_(v23, v24, (uint64_t)v5, v25),
          textureUtils = v7->_textureUtils,
          v7->_textureUtils = (TextureUtils *)v26,
          textureUtils,
          !v7->_textureUtils))
    {
      FigDebugAssert3();
    }
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    v28 = 0;
    if (v31) {
      goto LABEL_7;
    }
  }
  v28 = v7;
LABEL_7:
  v29 = v28;

  return v29;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [GreenGhostLowLightStage alloc];
  v7 = objc_msgSend_initWithMetalContext_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (void)reset
{
  self->_isFirstNonRefFrame = 1;
  self->_nonRefFramesCount = 0;
  self->_canMitigationProceed = 1;
  objc_msgSend_releaseTextures(self, a2, v2, v3);
}

- (void)releaseTextures
{
  fusedLuma = self->_fusedLuma;
  self->_fusedLuma = 0;

  fusedChroma = self->_fusedChroma;
  self->_fusedChroma = 0;

  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  FigMetalDecRef();
}

- (void)dealloc
{
  sumMaskBuffer = self->_sumMaskBuffer;
  self->_sumMaskBuffer = 0;

  v4.receiver = self;
  v4.super_class = (Class)GreenGhostLowLightStage;
  [(GreenGhostLowLightStage *)&v4 dealloc];
}

- (int)singleBracketDetectionWithLuma:(id)a3 chroma:(id)a4 params:(DetectionTuning *)a5
{
  uint64_t v29 = 0;
  id v8 = a4;
  id v9 = a3;
  unsigned int v13 = objc_msgSend_width(v9, v10, v11, v12);
  unsigned int v17 = objc_msgSend_height(v9, v14, v15, v16);
  *(void *)&long long v18 = 0;
  *((void *)&v18 + 1) = __PAIR64__(v17, v13);
  long long v27 = v18;
  uint64_t v28 = 1065353216;
  greenGhostCommon = self->_greenGhostCommon;
  maskSB = self->_maskSB;
  long long v21 = *(_OWORD *)&a5[1].var2.var1;
  v26[2] = *(_OWORD *)&a5[1].var0.var1;
  v26[3] = v21;
  v26[4] = *(_OWORD *)&a5[2].var0.var2;
  long long v22 = *(_OWORD *)&a5->var2.var0;
  v26[0] = *(_OWORD *)&a5->var0.var0;
  v26[1] = v22;
  int v24 = objc_msgSend_detectionWithLuma_croppedLuma_chroma_outputMask_params_processingROIInfo_(greenGhostCommon, v23, (uint64_t)v9, (uint64_t)v9, v8, maskSB, v26, &v27);

  if (v24) {
    FigDebugAssert3();
  }
  return v24;
}

- (uint64_t)computeTemporalVariationsRefImg:(uint64_t)a3 OtherImg:(void *)a4 refProperties:(void *)a5 otherProperties:(uint64_t)a6 params:(_OWORD *)a7
{
  double v129 = a2;
  id v11 = a4;
  id v12 = a5;
  float v128 = sub_262F98A00(a6 + 16, (uint64_t)(a7 + 1), a6);
  long long v16 = a7[13994];
  v127[0] = a7[13993];
  v127[1] = v16;
  v127[2] = a7[13995];
  int v17 = *(unsigned __int8 *)(a1 + 144);
  char v126 = v17 ^ 1;
  if (v17)
  {
    long long v18 = objc_msgSend_allocator(*(void **)(a1 + 8), v13, v14, v15);
    long long v22 = objc_msgSend_newTextureDescriptor(v18, v19, v20, v21);

    if (!v22) {
      goto LABEL_15;
    }
    uint64_t v26 = objc_msgSend_desc(v22, v23, v24, v25);
    objc_msgSend_setUsage_(v26, v27, 7, v28);

    objc_super v32 = objc_msgSend_desc(v22, v29, v30, v31);
    objc_msgSend_setPixelFormat_(v32, v33, 25, v34);

    uint64_t v38 = objc_msgSend_width(v11, v35, v36, v37);
    v42 = objc_msgSend_desc(v22, v39, v40, v41);
    objc_msgSend_setWidth_(v42, v43, v38, v44);

    uint64_t v48 = objc_msgSend_height(v11, v45, v46, v47);
    uint64_t v52 = objc_msgSend_desc(v22, v49, v50, v51);
    objc_msgSend_setHeight_(v52, v53, v48, v54);

    objc_msgSend_setLabel_(v22, v55, 0, v56);
    v60 = objc_msgSend_allocator(*(void **)(a1 + 8), v57, v58, v59);
    uint64_t v63 = objc_msgSend_newTextureWithDescriptor_(v60, v61, (uint64_t)v22, v62);
    v64 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v63;

    if (!*(void *)(a1 + 168)) {
      goto LABEL_15;
    }
    v68 = objc_msgSend_desc(v22, v65, v66, v67);
    objc_msgSend_setCompressionMode_(v68, v69, 2, v70);

    v74 = objc_msgSend_desc(v22, v71, v72, v73);
    objc_msgSend_setCompressionFootprint_(v74, v75, 0, v76);

    objc_msgSend_setLabel_(v22, v77, 0, v78);
    v82 = objc_msgSend_allocator(*(void **)(a1 + 8), v79, v80, v81);
    uint64_t v85 = objc_msgSend_newTextureWithDescriptor_(v82, v83, (uint64_t)v22, v84);
    v86 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v85;

    if (!*(void *)(a1 + 176)) {
      goto LABEL_15;
    }
  }
  else if (!*(void *)(a1 + 176) || !*(void *)(a1 + 168))
  {
    goto LABEL_14;
  }
  uint64_t v87 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v13, v14, v15);
  long long v22 = objc_msgSend_commandBuffer(v87, v88, v89, v90);

  if (!v22)
  {
LABEL_14:
    FigDebugAssert3();
    uint64_t v121 = FigSignalErrorAt();
    goto LABEL_11;
  }
  v94 = objc_msgSend_computeCommandEncoder(v22, v91, v92, v93);
  if (!v94)
  {
LABEL_15:
    FigDebugAssert3();
    uint64_t v121 = FigSignalErrorAt();

    goto LABEL_11;
  }
  v97 = v94;
  objc_msgSend_setComputePipelineState_(v94, v95, *(void *)(a1 + 24), v96);
  objc_msgSend_setImageblockWidth_height_(v97, v98, 16, 16);
  objc_msgSend_setTexture_atIndex_(v97, v99, (uint64_t)v11, 0);
  objc_msgSend_setTexture_atIndex_(v97, v100, (uint64_t)v12, 1);
  objc_msgSend_setTexture_atIndex_(v97, v101, *(void *)(a1 + 160), 2);
  objc_msgSend_setTexture_atIndex_(v97, v102, *(void *)(a1 + 168), 3);
  objc_msgSend_setTexture_atIndex_(v97, v103, *(void *)(a1 + 176), 4);
  objc_msgSend_setBytes_length_atIndex_(v97, v104, (uint64_t)&v128, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v97, v105, (uint64_t)v127, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v97, v106, (uint64_t)&v129, 8, 2);
  objc_msgSend_setBytes_length_atIndex_(v97, v107, (uint64_t)&v126, 1, 3);
  v125[0] = objc_msgSend_width(v11, v108, v109, v110);
  v125[1] = objc_msgSend_height(v11, v111, v112, v113);
  v125[2] = 1;
  int64x2_t v123 = vdupq_n_s64(0x10uLL);
  uint64_t v124 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v97, v114, (uint64_t)v125, (uint64_t)&v123);
  objc_msgSend_endEncoding(v97, v115, v116, v117);
  objc_msgSend_commit(v22, v118, v119, v120);

  uint64_t v121 = 0;
LABEL_11:

  return v121;
}

- (int)guidedFilter:(id)a3 withGuideLuma:(id)a4 guideChroma:(id)a5 params:(LowLightRefinementTuning *)a6 output:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v170 = 0;
  unsigned int var0 = a6->var0;
  float var1 = a6->var1;
  float var2 = a6->var2;
  float v168 = var1;
  if ((objc_msgSend_width(v15, v17, v18, v19) & 1) != 0
    || (objc_msgSend_height(v15, v20, v21, v22) & 1) != 0
    || (objc_msgSend_commandQueue(self->_metal, v23, v24, v25),
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v26, v27, v28, v29),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        v26,
        !v30))
  {
    FigDebugAssert3();
    int v158 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v34 = objc_msgSend_computeCommandEncoder(v30, v31, v32, v33);
  if (!v34)
  {
    FigDebugAssert3();
    int v158 = FigSignalErrorAt();

    goto LABEL_8;
  }
  uint64_t v38 = (void *)v34;
  v162 = v15;
  uint64_t v39 = (uint64_t)v13;
  uint64_t v40 = objc_msgSend_allocator(self->_metal, v35, v36, v37);
  uint64_t v44 = objc_msgSend_newTextureDescriptor(v40, v41, v42, v43);

  if (!v44)
  {
    FigDebugAssert3();
    int v158 = FigSignalErrorAt();
LABEL_13:

    id v13 = (id)v39;
    id v15 = v162;
    goto LABEL_8;
  }
  uint64_t v48 = objc_msgSend_desc(v44, v45, v46, v47);
  objc_msgSend_setCompressionMode_(v48, v49, 2, v50);

  uint64_t v54 = objc_msgSend_desc(v44, v51, v52, v53);
  objc_msgSend_setCompressionFootprint_(v54, v55, 0, v56);

  v60 = objc_msgSend_desc(v44, v57, v58, v59);
  objc_msgSend_setUsage_(v60, v61, 7, v62);

  uint64_t v66 = objc_msgSend_pixelFormat(v12, v63, v64, v65);
  uint64_t v70 = objc_msgSend_desc(v44, v67, v68, v69);
  objc_msgSend_setPixelFormat_(v70, v71, v66, v72);

  uint64_t v76 = objc_msgSend_width(v12, v73, v74, v75);
  uint64_t v80 = objc_msgSend_desc(v44, v77, v78, v79);
  objc_msgSend_setWidth_(v80, v81, v76, v82);

  uint64_t v86 = objc_msgSend_height(v12, v83, v84, v85);
  uint64_t v90 = objc_msgSend_desc(v44, v87, v88, v89);
  objc_msgSend_setHeight_(v90, v91, v86, v92);

  objc_msgSend_setLabel_(v44, v93, 0, v94);
  v98 = objc_msgSend_allocator(self->_metal, v95, v96, v97);
  v101 = objc_msgSend_newTextureWithDescriptor_(v98, v99, (uint64_t)v44, v100);
  id v170 = v101;

  if (!v101)
  {
    FigDebugAssert3();
    int v158 = FigSignalErrorAt();

    goto LABEL_13;
  }
  objc_msgSend_setComputePipelineState_(v38, v102, (uint64_t)self->_pipelineStates[2], v103);
  objc_msgSend_setTexture_atIndex_(v38, v104, (uint64_t)v12, 0);
  uint64_t v105 = v39;
  objc_msgSend_setTexture_atIndex_(v38, v106, v39, 1);
  objc_msgSend_setTexture_atIndex_(v38, v107, (uint64_t)v14, 2);
  objc_msgSend_setTexture_atIndex_(v38, v108, (uint64_t)v101, 3);
  objc_msgSend_setBytes_length_atIndex_(v38, v109, (uint64_t)&var0, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v38, v110, (uint64_t)&v168, 4, 1);
  unint64_t v114 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[2], v111, v112, v113);
  v160 = v30;
  uint64_t v118 = (uint64_t)v14;
  unint64_t v119 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[2], v115, v116, v117) / v114;
  id v15 = v162;
  id v161 = v12;
  v166[0] = (unint64_t)objc_msgSend_width(v162, v120, v121, v122) >> 1;
  v166[1] = (unint64_t)objc_msgSend_height(v162, v123, v124, v125) >> 1;
  v166[2] = 1;
  v165[0] = v114;
  v165[1] = v119;
  v165[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v38, v126, (uint64_t)v166, (uint64_t)v165);
  objc_msgSend_setComputePipelineState_(v38, v127, (uint64_t)self->_pipelineStates[3], v128);
  uint64_t v129 = (uint64_t)v101;
  id v13 = (id)v105;
  objc_msgSend_setTexture_atIndex_(v38, v130, v129, 0);
  objc_msgSend_setTexture_atIndex_(v38, v131, v105, 1);
  objc_msgSend_setTexture_atIndex_(v38, v132, v118, 2);
  objc_msgSend_setTexture_atIndex_(v38, v133, (uint64_t)v162, 3);
  objc_msgSend_setBytes_length_atIndex_(v38, v134, (uint64_t)&var0, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v38, v135, (uint64_t)&v168, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v38, v136, (uint64_t)&var2, 4, 2);
  unint64_t v140 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[3], v137, v138, v139);
  unint64_t v144 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[3], v141, v142, v143) / v140;
  v164[0] = (unint64_t)objc_msgSend_width(v162, v145, v146, v147) >> 1;
  v164[1] = (unint64_t)objc_msgSend_height(v162, v148, v149, v150) >> 1;
  id v14 = (id)v118;
  v164[2] = 1;
  v163[0] = v140;
  v163[1] = v144;
  id v12 = v161;
  v163[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v38, v151, (uint64_t)v164, (uint64_t)v163);
  objc_msgSend_endEncoding(v38, v152, v153, v154);
  objc_msgSend_commit(v160, v155, v156, v157);
  FigMetalDecRef();

  int v158 = 0;
LABEL_8:

  return v158;
}

- (int)refineDetectionWithGuideLuma:(id)a3 guideChroma:(id)a4 params:(LowLightRefinementTuning *)a5 output:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v147 = 0;
  id v148 = 0;
  if ((objc_msgSend_width(self->_maskMB, v13, v14, v15) & 1) != 0
    || (objc_msgSend_height(self->_maskMB, v16, v17, v18) & 1) != 0
    || (objc_msgSend_allocator(self->_metal, v19, v20, v21),
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v26 = objc_msgSend_newTextureDescriptor(v22, v23, v24, v25),
        v22,
        !v26))
  {
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v30 = objc_msgSend_desc(v26, v27, v28, v29);
  objc_msgSend_setCompressionMode_(v30, v31, 2, v32);

  uint64_t v36 = objc_msgSend_desc(v26, v33, v34, v35);
  objc_msgSend_setCompressionFootprint_(v36, v37, 0, v38);

  uint64_t v42 = objc_msgSend_desc(v26, v39, v40, v41);
  objc_msgSend_setUsage_(v42, v43, 7, v44);

  uint64_t v48 = objc_msgSend_pixelFormat(self->_maskMB, v45, v46, v47);
  uint64_t v52 = objc_msgSend_desc(v26, v49, v50, v51);
  objc_msgSend_setPixelFormat_(v52, v53, v48, v54);

  uint64_t v58 = objc_msgSend_width(self->_maskMB, v55, v56, v57);
  uint64_t v62 = objc_msgSend_desc(v26, v59, v60, v61);
  objc_msgSend_setWidth_(v62, v63, v58, v64);

  uint64_t v68 = objc_msgSend_height(self->_maskMB, v65, v66, v67);
  uint64_t v72 = objc_msgSend_desc(v26, v69, v70, v71);
  objc_msgSend_setHeight_(v72, v73, v68, v74);

  objc_msgSend_setLabel_(v26, v75, 0, v76);
  uint64_t v80 = objc_msgSend_allocator(self->_metal, v77, v78, v79);
  v83 = objc_msgSend_newTextureWithDescriptor_(v80, v81, (uint64_t)v26, v82);
  id v148 = v83;

  if (!v83) {
    goto LABEL_17;
  }
  int v85 = objc_msgSend_guidedFilter_withGuideLuma_guideChroma_params_output_(self, v84, (uint64_t)self->_maskMB, (uint64_t)v10, v11, a5, v83);
  if (v85)
  {
    int v97 = v85;
    goto LABEL_16;
  }
  objc_msgSend_setLabel_(v26, v86, 0, v87);
  v91 = objc_msgSend_allocator(self->_metal, v88, v89, v90);
  uint64_t v94 = objc_msgSend_newTextureWithDescriptor_(v91, v92, (uint64_t)v26, v93);
  id v147 = v94;

  if (!v94) {
    goto LABEL_17;
  }
  *(float *)&double v96 = a5->var3;
  int v97 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self->_greenGhostCommon, v95, (uint64_t)v83, (uint64_t)v94, v96);
  FigMetalDecRef();
  if (v97)
  {
LABEL_16:
    FigDebugAssert3();
LABEL_18:

    goto LABEL_11;
  }
  v101 = objc_msgSend_commandQueue(self->_metal, v98, v99, v100);
  uint64_t v105 = objc_msgSend_commandBuffer(v101, v102, v103, v104);

  if (!v105)
  {
LABEL_17:
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
    goto LABEL_18;
  }
  uint64_t v109 = objc_msgSend_computeCommandEncoder(v105, v106, v107, v108);
  if (v109)
  {
    uint64_t v112 = v109;
    objc_msgSend_setComputePipelineState_(v109, v110, (uint64_t)self->_pipelineStates[4], v111);
    objc_msgSend_setTexture_atIndex_(v112, v113, (uint64_t)v94, 0);
    objc_msgSend_setTexture_atIndex_(v112, v114, (uint64_t)v94, 1);
    objc_msgSend_setTexture_atIndex_(v112, v115, (uint64_t)self->_maskMB, 2);
    objc_msgSend_setTexture_atIndex_(v112, v116, (uint64_t)v12, 3);
    objc_msgSend_setBytes_length_atIndex_(v112, v117, (uint64_t)&a5->var4, 4, 0);
    unint64_t v121 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[4], v118, v119, v120);
    unint64_t v125 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[4], v122, v123, v124) / v121;
    id v129 = v12;
    id v130 = v11;
    id v131 = v10;
    unint64_t v132 = (unint64_t)objc_msgSend_width(self->_maskMB, v126, v127, v128) >> 1;
    unint64_t v136 = objc_msgSend_height(self->_maskMB, v133, v134, v135);
    v146[0] = v132;
    v146[1] = v136 >> 1;
    id v10 = v131;
    id v11 = v130;
    id v12 = v129;
    v146[2] = 1;
    v145[0] = v121;
    v145[1] = v125;
    v145[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v112, v137, (uint64_t)v146, (uint64_t)v145);
    objc_msgSend_endEncoding(v112, v138, v139, v140);
    objc_msgSend_commit(v105, v141, v142, v143);
    FigMetalDecRef();

    int v97 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
  }
LABEL_11:

  return v97;
}

- (int)detectionWithRefPyramid:(id)a3 otherPyramid:(id)a4 refDetection:(BOOL)a5 refProperties:(frameProperties_t *)a6 otherProperties:(frameProperties_t *)a7 maskMBBinary:(id)a8 params:(LowLightTuning *)a9
{
  BOOL v12 = a5;
  uint64_t v15 = a3;
  long long v16 = a4;
  id v20 = a8;
  if (!v12)
  {
    int v105 = objc_msgSend_computeTemporalVariationsRefImg_OtherImg_refProperties_otherProperties_params_(self, v17, v15[self->_detectionLvl + 42], v16[self->_detectionLvl + 42], a6, a7, *(double *)&a9[6].maxMaskAverage);
    if (v105)
    {
      int v104 = v105;
    }
    else
    {
      int v104 = objc_msgSend_refineDetectionWithGuideLuma_guideChroma_params_output_(self, v106, v15[self->_detectionLvl + 42], (uint64_t)self->_refChroma, &a9[7], v20);
      if (!v104) {
        goto LABEL_10;
      }
    }
    FigDebugAssert3();
    goto LABEL_10;
  }
  uint64_t v21 = objc_msgSend_allocator(self->_metal, v17, v18, v19);
  uint64_t v25 = objc_msgSend_newTextureDescriptor(v21, v22, v23, v24);

  if (!v25) {
    goto LABEL_14;
  }
  uint64_t v29 = objc_msgSend_desc(v25, v26, v27, v28);
  objc_msgSend_setUsage_(v29, v30, 7, v31);

  uint64_t v35 = objc_msgSend_desc(v25, v32, v33, v34);
  objc_msgSend_setPixelFormat_(v35, v36, 65, v37);

  uint64_t v41 = objc_msgSend_width((void *)v15[self->_detectionLvl + 61], v38, v39, v40);
  uint64_t v45 = objc_msgSend_desc(v25, v42, v43, v44);
  objc_msgSend_setWidth_(v45, v46, v41, v47);

  uint64_t v51 = objc_msgSend_height((void *)v15[self->_detectionLvl + 61], v48, v49, v50);
  v55 = objc_msgSend_desc(v25, v52, v53, v54);
  objc_msgSend_setHeight_(v55, v56, v51, v57);

  objc_msgSend_setLabel_(v25, v58, 0, v59);
  uint64_t v63 = objc_msgSend_allocator(self->_metal, v60, v61, v62);
  uint64_t v66 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v63, v64, (uint64_t)v25, v65);
  refChroma = self->_refChroma;
  self->_refChroma = v66;

  uint64_t v69 = self->_refChroma;
  if (!v69) {
    goto LABEL_14;
  }
  int v70 = objc_msgSend_downscaleInput_output_(self->_greenGhostCommon, v68, v15[self->_detectionLvl + 60], (uint64_t)v69);
  if (v70)
  {
    int v104 = v70;
    goto LABEL_15;
  }
  uint64_t v74 = objc_msgSend_desc(v25, v71, v72, v73);
  objc_msgSend_setCompressionMode_(v74, v75, 2, v76);

  uint64_t v80 = objc_msgSend_desc(v25, v77, v78, v79);
  objc_msgSend_setCompressionFootprint_(v80, v81, 0, v82);

  uint64_t v86 = objc_msgSend_desc(v25, v83, v84, v85);
  objc_msgSend_setPixelFormat_(v86, v87, 25, v88);

  objc_msgSend_setLabel_(v25, v89, 0, v90);
  uint64_t v94 = objc_msgSend_allocator(self->_metal, v91, v92, v93);
  int v97 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v94, v95, (uint64_t)v25, v96);
  maskSB = self->_maskSB;
  self->_maskSB = v97;

  if (!self->_maskSB)
  {
LABEL_14:
    FigDebugAssert3();
    int v104 = FigSignalErrorAt();
    goto LABEL_7;
  }
  uint64_t v100 = v15[self->_detectionLvl + 42];
  v101 = self->_refChroma;
  long long v102 = *(_OWORD *)&a9[2].maxMaskAverage;
  long long v103 = *(_OWORD *)&a9[4].maxMaskAverage;
  v108[2] = *(LowLightTuning *)((char *)a9 + 56);
  v108[3] = v103;
  v108[4] = *(LowLightTuning *)((char *)a9 + 88);
  v108[0] = *(LowLightTuning *)((char *)a9 + 24);
  v108[1] = v102;
  int v104 = objc_msgSend_singleBracketDetectionWithLuma_chroma_params_(self, v99, v100, (uint64_t)v101, v108);
  if (v104) {
LABEL_15:
  }
    FigDebugAssert3();
LABEL_7:

LABEL_10:
  return v104;
}

- (int)canMitigationProceedWithMaxMaskAverage:(float)a3
{
  id v5 = objc_opt_new();
  *(_DWORD *)objc_msgSend_contents(self->_sumMaskBuffer, v6, v7, v8) = 0;
  BOOL v12 = objc_msgSend_commandQueue(self->_metal, v9, v10, v11);
  long long v16 = objc_msgSend_commandBuffer(v12, v13, v14, v15);

  id v20 = objc_msgSend_computeCommandEncoder(v16, v17, v18, v19);
  uint64_t v23 = v20;
  if (v20)
  {
    objc_msgSend_setComputePipelineState_(v20, v21, (uint64_t)self->_pipelineStates[0], v22);
    objc_msgSend_setTexture_atIndex_(v23, v24, (uint64_t)self->_maskSB, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v23, v25, (uint64_t)self->_sumMaskBuffer, 0, 0);
    unint64_t v29 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[0], v26, v27, v28);
    unint64_t v33 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[0], v30, v31, v32) / v29;
    uint64_t v37 = objc_msgSend_width(self->_maskSB, v34, v35, v36);
    uint64_t v41 = objc_msgSend_height(self->_maskSB, v38, v39, v40);
    v74[0] = v37;
    v74[1] = v41;
    v74[2] = 1;
    v73[0] = v29;
    v73[1] = v33;
    v73[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v23, v42, (uint64_t)v74, (uint64_t)v73);
    objc_msgSend_endEncoding(v23, v43, v44, v45);
    objc_msgSend_commit(v16, v46, v47, v48);
    objc_msgSend_waitForIdle(self->_metal, v49, v50, v51);
    double v55 = (float)*(unsigned int *)objc_msgSend_contents(self->_sumMaskBuffer, v52, v53, v54);
    uint64_t v59 = objc_msgSend_width(self->_maskSB, v56, v57, v58);
    double v63 = v55 / ((float)(unint64_t)(objc_msgSend_height(self->_maskSB, v60, v61, v62) * v59) * 255.0);
    *(float *)&double v55 = v63;
    LODWORD(v63) = LODWORD(v55);
    uint64_t v67 = objc_msgSend_numberWithFloat_(NSNumber, v64, v65, v66, v63);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v68, (uint64_t)v67, @"maskAverage");

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    objc_msgSend_addToSidecar_forKey_(WeakRetained, v70, (uint64_t)v5, @"GreenGhostLowLight");

    int v71 = 0;
    self->_canMitigationProceed = *(float *)&v55 < a3;
  }
  else
  {
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();
  }

  return v71;
}

- (void)scaleFaceBodyBoundariesWithSizeRatio:(float)a3
{
  uint64_t nFaces = self->_faceBodyBoundaries.nFaces;
  self->_faceBodyBoundariesDownscaled.uint64_t nFaces = nFaces;
  if (nFaces)
  {
    objc_super v4 = (float32x4_t *)self;
    do
    {
      v4[38] = vmulq_n_f32(v4[16], a3);
      ++v4;
      --nFaces;
    }
    while (nFaces);
  }
  uint64_t v5 = *(unsigned int *)&self->_anon_f4[172];
  *(_DWORD *)&self->_anon_254[172] = v5;
  if (v5)
  {
    uint64_t v6 = (float32x4_t *)&self->_anon_f4[188];
    do
    {
      v6[22] = vmulq_n_f32(*v6, a3);
      ++v6;
      --v5;
    }
    while (v5);
  }
}

- (int)allocateFusionWeightTexturesWithWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_allocator(self->_metal, a2, a3, a4);
  uint64_t v11 = objc_msgSend_newTextureDescriptor(v7, v8, v9, v10);

  if (!v11)
  {
    FigDebugAssert3();
    uint64_t v42 = 0;
LABEL_9:
    int v118 = FigSignalErrorAt();
    goto LABEL_6;
  }
  uint64_t v15 = objc_msgSend_desc(v11, v12, v13, v14);
  objc_msgSend_setUsage_(v15, v16, 7, v17);

  uint64_t v21 = objc_msgSend_desc(v11, v18, v19, v20);
  objc_msgSend_setWidth_(v21, v22, a3, v23);

  uint64_t v27 = objc_msgSend_desc(v11, v24, v25, v26);
  objc_msgSend_setHeight_(v27, v28, a4, v29);

  unint64_t v33 = objc_msgSend_desc(v11, v30, v31, v32);
  objc_msgSend_setPixelFormat_(v33, v34, 25, v35);

  uint64_t v39 = objc_msgSend_allocator(self->_metal, v36, v37, v38);
  uint64_t v42 = objc_msgSend_newTextureDescriptor_(v39, v40, 0, v41);

  if (!v42) {
    goto LABEL_8;
  }
  uint64_t v46 = objc_msgSend_desc(v11, v43, v44, v45);
  uint64_t v50 = objc_msgSend_usage(v46, v47, v48, v49);
  uint64_t v54 = objc_msgSend_desc(v42, v51, v52, v53);
  objc_msgSend_setUsage_(v54, v55, v50, v56);

  uint64_t v60 = objc_msgSend_desc(v11, v57, v58, v59);
  uint64_t v64 = objc_msgSend_width(v60, v61, v62, v63);
  uint64_t v68 = objc_msgSend_desc(v42, v65, v66, v67);
  objc_msgSend_setWidth_(v68, v69, v64, v70);

  uint64_t v74 = objc_msgSend_desc(v11, v71, v72, v73);
  uint64_t v78 = objc_msgSend_height(v74, v75, v76, v77);
  uint64_t v82 = objc_msgSend_desc(v42, v79, v80, v81);
  objc_msgSend_setHeight_(v82, v83, v78, v84);

  uint64_t v88 = objc_msgSend_desc(v11, v85, v86, v87);
  uint64_t v92 = objc_msgSend_pixelFormat(v88, v89, v90, v91);
  uint64_t v96 = objc_msgSend_desc(v42, v93, v94, v95);
  objc_msgSend_setPixelFormat_(v96, v97, v92, v98);

  objc_msgSend_setLabel_(v42, v99, 0, v100);
  int v104 = objc_msgSend_allocator(self->_metal, v101, v102, v103);
  v106 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v104, v105, (uint64_t)v42, 0);
  ggMaxFusionWeights = self->_ggMaxFusionWeights;
  self->_ggMaxFusionWeights = v106;

  if (!self->_ggMaxFusionWeights) {
    goto LABEL_8;
  }
  objc_msgSend_setLabel_(v11, v108, 0, v109);
  uint64_t v113 = objc_msgSend_allocator(self->_metal, v110, v111, v112);
  uint64_t v116 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v113, v114, (uint64_t)v11, v115);
  ggFusionWeightsAcc = self->_ggFusionWeightsAcc;
  self->_ggFusionWeightsAcc = v116;

  if (!self->_ggFusionWeightsAcc)
  {
LABEL_8:
    FigDebugAssert3();
    goto LABEL_9;
  }
  int v118 = 0;
LABEL_6:

  return v118;
}

- (uint64_t)computeFusionWeightsRefLuma:(__n128)a3 refChroma:(__n128)a4 otherLuma:(__n128)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 innerMask:(void *)a8 relativeBrightness:(void *)a9 homography:(void *)a10 output:(void *)a11 params:(void *)a12
{
  v214[0] = a3;
  v214[1] = a4;
  v214[2] = a5;
  id v202 = a7;
  id v21 = a8;
  id v203 = a9;
  id v22 = a10;
  id v23 = a11;
  id v204 = a12;
  float v213 = a2;
  id v24 = a13;
  id v211 = 0;
  id v212 = 0;
  id v210 = 0;
  if (objc_msgSend_isCompressed(v24, v25, v26, v27)
    || (objc_msgSend_allocator(*(void **)(a1 + 8), v28, v29, v30),
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        uint64_t v35 = objc_msgSend_newTextureDescriptor(v31, v32, v33, v34),
        v31,
        !v35))
  {
    FigDebugAssert3();
    uint64_t v196 = FigSignalErrorAt();
    goto LABEL_12;
  }
  uint64_t v39 = objc_msgSend_desc(v35, v36, v37, v38);
  objc_msgSend_setCompressionMode_(v39, v40, 2, v41);

  uint64_t v45 = objc_msgSend_desc(v35, v42, v43, v44);
  objc_msgSend_setCompressionFootprint_(v45, v46, 0, v47);

  uint64_t v51 = objc_msgSend_desc(v35, v48, v49, v50);
  objc_msgSend_setUsage_(v51, v52, 7, v53);

  uint64_t v57 = objc_msgSend_pixelFormat(v23, v54, v55, v56);
  objc_msgSend_desc(v35, v58, v59, v60);
  uint64_t v61 = v205 = v35;
  objc_msgSend_setPixelFormat_(v61, v62, v57, v63);

  uint64_t v67 = objc_msgSend_width(v23, v64, v65, v66);
  int v71 = objc_msgSend_desc(v205, v68, v69, v70);
  objc_msgSend_setWidth_(v71, v72, v67, v73);

  uint64_t v77 = objc_msgSend_height(v23, v74, v75, v76);
  uint64_t v81 = objc_msgSend_desc(v205, v78, v79, v80);
  objc_msgSend_setHeight_(v81, v82, v77, v83);

  objc_msgSend_setLabel_(v205, v84, 0, v85);
  uint64_t v89 = objc_msgSend_allocator(*(void **)(a1 + 8), v86, v87, v88);
  uint64_t v92 = objc_msgSend_newTextureWithDescriptor_(v89, v90, (uint64_t)v205, v91);
  id v212 = v92;

  if (!v92) {
    goto LABEL_14;
  }
  objc_msgSend_setLabel_(v205, v93, 0, v94);
  uint64_t v98 = objc_msgSend_allocator(*(void **)(a1 + 8), v95, v96, v97);
  v101 = objc_msgSend_newTextureWithDescriptor_(v98, v99, (uint64_t)v205, v100);
  id v211 = v101;

  if (!v101) {
    goto LABEL_14;
  }
  objc_msgSend_setLabel_(v205, v102, 0, v103);
  uint64_t v107 = objc_msgSend_allocator(*(void **)(a1 + 8), v104, v105, v106);
  uint64_t v110 = objc_msgSend_newTextureWithDescriptor_(v107, v108, (uint64_t)v205, v109);
  id v210 = v110;

  if (!v110
    || (uint64_t v200 = (uint64_t)v110,
        objc_msgSend_commandQueue(*(void **)(a1 + 8), v111, v112, v113),
        unint64_t v114 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v114, v115, v116, v117),
        int v118 = objc_claimAutoreleasedReturnValue(),
        v114,
        !v118))
  {
LABEL_14:
    FigDebugAssert3();
    uint64_t v196 = FigSignalErrorAt();
LABEL_16:

    goto LABEL_12;
  }
  uint64_t v122 = objc_msgSend_computeCommandEncoder(v118, v119, v120, v121);
  if (!v122)
  {
    FigDebugAssert3();
    uint64_t v196 = FigSignalErrorAt();

    goto LABEL_16;
  }
  unint64_t v125 = v122;
  objc_msgSend_setComputePipelineState_(v122, v123, *(void *)(a1 + 56), v124);
  objc_msgSend_setTexture_atIndex_(v125, v126, (uint64_t)v202, 0);
  objc_msgSend_setTexture_atIndex_(v125, v127, (uint64_t)v21, 1);
  objc_msgSend_setTexture_atIndex_(v125, v128, (uint64_t)v203, 2);
  objc_msgSend_setTexture_atIndex_(v125, v129, (uint64_t)v22, 3);
  id v199 = v23;
  objc_msgSend_setTexture_atIndex_(v125, v130, (uint64_t)v23, 4);
  uint64_t v201 = (uint64_t)v24;
  objc_msgSend_setTexture_atIndex_(v125, v131, (uint64_t)v204, 5);
  objc_msgSend_setTexture_atIndex_(v125, v132, (uint64_t)v101, 6);
  objc_msgSend_setTexture_atIndex_(v125, v133, (uint64_t)v92, 7);
  objc_msgSend_setBytes_length_atIndex_(v125, v134, (uint64_t)&v213, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v125, v135, (uint64_t)v214, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v125, v136, (uint64_t)a14, 40, 2);
  uint64_t v198 = (uint64_t)v22;
  id v140 = v21;
  unint64_t v141 = objc_msgSend_threadExecutionWidth(*(void **)(a1 + 56), v137, v138, v139);
  unint64_t v145 = objc_msgSend_maxTotalThreadsPerThreadgroup(*(void **)(a1 + 56), v142, v143, v144) / v141;
  v209[0] = objc_msgSend_width(v101, v146, v147, v148);
  v209[1] = objc_msgSend_height(v101, v149, v150, v151);
  v209[2] = 1;
  v208[0] = v141;
  v208[1] = v145;
  v208[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v125, v152, (uint64_t)v209, (uint64_t)v208);
  objc_msgSend_setComputePipelineState_(v125, v153, *(void *)(a1 + 64), v154);
  objc_msgSend_setTexture_atIndex_(v125, v155, (uint64_t)v92, 0);
  objc_msgSend_setTexture_atIndex_(v125, v156, (uint64_t)v204, 1);
  objc_msgSend_setTexture_atIndex_(v125, v157, (uint64_t)v101, 2);
  objc_msgSend_setTexture_atIndex_(v125, v158, (uint64_t)v202, 3);
  v159 = v140;
  uint64_t v160 = (uint64_t)v140;
  id v22 = (id)v198;
  objc_msgSend_setTexture_atIndex_(v125, v161, v160, 4);
  objc_msgSend_setTexture_atIndex_(v125, v162, (uint64_t)v203, 5);
  objc_msgSend_setTexture_atIndex_(v125, v163, v198, 6);
  objc_msgSend_setTexture_atIndex_(v125, v164, *(void *)(a1 + 176), 7);
  objc_msgSend_setTexture_atIndex_(v125, v165, v201, 8);
  objc_msgSend_setBytes_length_atIndex_(v125, v166, a1 + 144, 1, 0);
  objc_msgSend_setBytes_length_atIndex_(v125, v167, (uint64_t)&v213, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v125, v168, (uint64_t)v214, 48, 2);
  objc_msgSend_setBytes_length_atIndex_(v125, v169, (uint64_t)a14, 40, 3);
  objc_msgSend_setBytes_length_atIndex_(v125, v170, a1 + 592, 352, 4);
  unint64_t v174 = objc_msgSend_threadExecutionWidth(*(void **)(a1 + 64), v171, v172, v173);
  unint64_t v178 = objc_msgSend_maxTotalThreadsPerThreadgroup(*(void **)(a1 + 64), v175, v176, v177) / v174;
  v207[0] = objc_msgSend_width(v101, v179, v180, v181);
  v207[1] = objc_msgSend_height(v101, v182, v183, v184);
  id v24 = (id)v201;
  v207[2] = 1;
  v206[0] = v174;
  v206[1] = v178;
  v206[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v125, v185, (uint64_t)v207, (uint64_t)v206);
  objc_msgSend_endEncoding(v125, v186, v187, v188);
  objc_msgSend_commit(v118, v189, v190, v191);
  *(float *)&double v192 = a14[1].var1;
  uint64_t v194 = objc_msgSend_erodeTexture_withNormalizedRadius_output_(*(void **)(a1 + 120), v193, v201, v200, v192);
  if (v194)
  {
    uint64_t v196 = v194;
    goto LABEL_18;
  }
  uint64_t v196 = objc_msgSend_boxFilter_withRadius_output_(*(void **)(a1 + 120), v195, v200, a14[1].var2, v201);
  if (v196)
  {
LABEL_18:
    FigDebugAssert3();
    goto LABEL_11;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_11:

  id v21 = v159;
  id v23 = v199;
LABEL_12:

  return v196;
}

- (uint64_t)prepareFusionRefLuma:(double)a3 refChroma:(double)a4 otherLuma:(double)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 relativeBrightness:(void *)a8 homography:(void *)a9 output:(void *)a10 params:(void *)a11
{
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  uint64_t v112 = 0;
  uint64_t v29 = objc_msgSend_allocator(a1[1], v26, v27, v28);
  uint64_t v33 = objc_msgSend_newTextureDescriptor(v29, v30, v31, v32);

  if (!v33) {
    goto LABEL_10;
  }
  uint64_t v37 = objc_msgSend_desc(v33, v34, v35, v36);
  objc_msgSend_setCompressionMode_(v37, v38, 2, v39);

  uint64_t v43 = objc_msgSend_desc(v33, v40, v41, v42);
  objc_msgSend_setCompressionFootprint_(v43, v44, 0, v45);

  uint64_t v49 = objc_msgSend_desc(v33, v46, v47, v48);
  objc_msgSend_setUsage_(v49, v50, 7, v51);

  uint64_t v55 = objc_msgSend_pixelFormat(v24, v52, v53, v54);
  uint64_t v59 = objc_msgSend_desc(v33, v56, v57, v58);
  objc_msgSend_setPixelFormat_(v59, v60, v55, v61);

  uint64_t v65 = objc_msgSend_width(v24, v62, v63, v64);
  uint64_t v69 = objc_msgSend_desc(v33, v66, v67, v68);
  objc_msgSend_setWidth_(v69, v70, v65, v71);

  uint64_t v75 = objc_msgSend_height(v24, v72, v73, v74);
  uint64_t v79 = objc_msgSend_desc(v33, v76, v77, v78);
  objc_msgSend_setHeight_(v79, v80, v75, v81);

  objc_msgSend_setLabel_(v33, v82, 0, v83);
  uint64_t v87 = objc_msgSend_allocator(a1[1], v84, v85, v86);
  uint64_t v90 = objc_msgSend_newTextureWithDescriptor_(v87, v88, (uint64_t)v33, v89);
  uint64_t v112 = (void *)v90;

  if (!v90)
  {
LABEL_10:
    FigDebugAssert3();
    uint64_t v107 = FigSignalErrorAt();
    goto LABEL_9;
  }
  unint64_t v94 = objc_msgSend_width(v24, v91, v92, v93);
  if (v94 <= objc_msgSend_height(v24, v95, v96, v97)) {
    uint64_t v101 = objc_msgSend_height(v24, v98, v99, v100);
  }
  else {
    uint64_t v101 = objc_msgSend_width(v24, v98, v99, v100);
  }
  *(float *)&double v103 = 1.0 / (float)(unint64_t)v101;
  uint64_t v104 = objc_msgSend_erodeTexture_withNormalizedRadius_output_(a1[15], v102, (uint64_t)v24, v90, v103);
  if (v104)
  {
    uint64_t v107 = v104;
    goto LABEL_12;
  }
  *(float *)&double v106 = a2;
  uint64_t v107 = objc_msgSend_computeFusionWeightsRefLuma_refChroma_otherLuma_otherChroma_maskMBBinary_innerMask_relativeBrightness_homography_output_params_(a1, v105, (uint64_t)v20, (uint64_t)v21, v22, v23, v24, v90, v106, a3, a4, a5, v25, a13);
  if (v107)
  {
LABEL_12:
    FigDebugAssert3();
    goto LABEL_9;
  }
  FigMetalDecRef();
LABEL_9:

  return v107;
}

- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(frameProperties_t *)a5 otherProperties:(frameProperties_t *)a6 currentFusionWeights:(id)a7 relativeBrightness:(float)a8
{
  uint64_t v14 = (void **)a3;
  uint64_t v15 = a4;
  id v76 = a7;
  unint64_t v19 = objc_msgSend_width(v14[self->_repairLvl + 42], v16, v17, v18);
  unint64_t v23 = objc_msgSend_height(v14[self->_repairLvl + 42], v20, v21, v22);
  int y_low = LODWORD(a5[1].meta.ROI.origin.y);
  long long v25 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  v85[10] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  v85[11] = v25;
  v85[12] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  long long v26 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  v85[6] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  v85[7] = v26;
  long long v27 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  v85[8] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  v85[9] = v27;
  long long v28 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  v85[2] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  v85[3] = v28;
  long long v29 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  v85[4] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  v85[5] = v29;
  long long v30 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.version;
  v85[0] = *(_OWORD *)&a5[1].meta.ROI.size.height;
  v85[1] = v30;
  long long v31 = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  v84[10] = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  v84[11] = v31;
  v84[12] = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  long long v32 = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  v84[6] = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  v84[7] = v32;
  long long v33 = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  v84[8] = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  v84[9] = v33;
  long long v34 = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  v84[2] = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  v84[3] = v34;
  long long v35 = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  v84[4] = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  v84[5] = v35;
  long long v36 = *(_OWORD *)&a6[1].meta.ltmCurves.ltmLut.version;
  v84[0] = *(_OWORD *)&a6[1].meta.ROI.size.height;
  v84[1] = v36;
  v80[0] = 0;
  v80[1] = 0;
  LOBYTE(v80[0]) = self->_isFirstNonRefFrame;
  *(_DWORD *)((char *)v80 + 1) = y_low == 1;
  *(_DWORD *)((char *)v80 + 2) = y_low == 2;
  *((float *)v80 + 1) = a8;
  long long v37 = *(_OWORD *)&a6[1].meta.exposureParams.luxLevel;
  long long v81 = *(_OWORD *)&a6[1].meta.exposureParams.conversion_gain;
  long long v82 = v37;
  long long v83 = *(_OWORD *)&a6[1].meta.exposureParams.CCT;
  uint64_t v41 = objc_msgSend_commandQueue(self->_metal, v38, v39, v40);
  uint64_t v45 = objc_msgSend_commandBuffer(v41, v42, v43, v44);

  if (v45
    && (objc_msgSend_computeCommandEncoder(v45, v46, v47, v48),
        (uint64_t v49 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v52 = v49;
    objc_msgSend_setComputePipelineState_(v49, v50, (uint64_t)self->_pipelineStates[7], v51);
    objc_msgSend_setImageblockWidth_height_(v52, v53, 32, 32);
    objc_msgSend_setTexture_atIndex_(v52, v54, (uint64_t)v14[self->_repairLvl + 42], 0);
    objc_msgSend_setTexture_atIndex_(v52, v55, (uint64_t)v14[self->_repairLvl + 62], 1);
    objc_msgSend_setTexture_atIndex_(v52, v56, v15[self->_repairLvl + 42], 2);
    objc_msgSend_setTexture_atIndex_(v52, v57, v15[self->_repairLvl + 62], 3);
    objc_msgSend_setTexture_atIndex_(v52, v58, (uint64_t)self->_maskMB, 4);
    uint64_t v59 = v76;
    objc_msgSend_setTexture_atIndex_(v52, v60, (uint64_t)v76, 5);
    objc_msgSend_setTexture_atIndex_(v52, v61, (uint64_t)self->_ggFusionWeightsAcc, 6);
    objc_msgSend_setTexture_atIndex_(v52, v62, (uint64_t)self->_fusedLuma, 7);
    objc_msgSend_setTexture_atIndex_(v52, v63, (uint64_t)self->_fusedChroma, 8);
    objc_msgSend_setBytes_length_atIndex_(v52, v64, (uint64_t)v80, 64, 0);
    objc_msgSend_setBytes_length_atIndex_(v52, v65, (uint64_t)v85, 208, 1);
    objc_msgSend_setBytes_length_atIndex_(v52, v66, (uint64_t)v84, 208, 2);
    v79[0] = v19 >> 1;
    v79[1] = v23 >> 1;
    v79[2] = 1;
    int64x2_t v77 = vdupq_n_s64(0x10uLL);
    uint64_t v78 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v52, v67, (uint64_t)v79, (uint64_t)&v77);
    objc_msgSend_endEncoding(v52, v68, v69, v70);
    objc_msgSend_commit(v45, v71, v72, v73);

    int v74 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
    uint64_t v59 = v76;
  }

  return v74;
}

- (int)updateFusionWeights:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_commandQueue(self->_metal, v5, v6, v7);
  BOOL v12 = objc_msgSend_commandBuffer(v8, v9, v10, v11);

  if (v12
    && (objc_msgSend_computeCommandEncoder(v12, v13, v14, v15),
        (long long v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v19 = v16;
    objc_msgSend_setComputePipelineState_(v16, v17, (uint64_t)self->_pipelineStates[8], v18);
    objc_msgSend_setImageblockWidth_height_(v19, v20, 16, 16);
    objc_msgSend_setTexture_atIndex_(v19, v21, (uint64_t)v4, 0);
    objc_msgSend_setTexture_atIndex_(v19, v22, (uint64_t)self->_maskMB, 1);
    objc_msgSend_setTexture_atIndex_(v19, v23, (uint64_t)self->_ggFusionWeightsAcc, 2);
    objc_msgSend_setTexture_atIndex_(v19, v24, (uint64_t)self->_ggMaxFusionWeights, 3);
    objc_msgSend_setBytes_length_atIndex_(v19, v25, (uint64_t)&self->_isFirstNonRefFrame, 1, 0);
    v43[0] = objc_msgSend_width(v4, v26, v27, v28);
    v43[1] = objc_msgSend_height(v4, v29, v30, v31);
    v43[2] = 1;
    int64x2_t v41 = vdupq_n_s64(0x10uLL);
    uint64_t v42 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v19, v32, (uint64_t)v43, (uint64_t)&v41);
    objc_msgSend_endEncoding(v19, v33, v34, v35);
    objc_msgSend_commit(v12, v36, v37, v38);

    int v39 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
  }

  return v39;
}

- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(frameProperties_t *)a5 otherProperties:(frameProperties_t *)a6 maskMBBinary:(id)a7 params:(LowLightFusionTuning *)a8
{
  uint64_t v14 = (void **)a3;
  uint64_t v15 = (char *)a4;
  id v16 = a7;
  float v17 = sub_262F98A00((uint64_t)&a5->meta.exposureParams, (uint64_t)&a6->meta.exposureParams, (uint64_t)a5);
  unint64_t v94 = 0;
  uint64_t v21 = objc_msgSend_allocator(self->_metal, v18, v19, v20);
  long long v25 = objc_msgSend_newTextureDescriptor(v21, v22, v23, v24);

  if (!v25) {
    goto LABEL_8;
  }
  long long v29 = objc_msgSend_desc(v25, v26, v27, v28);
  objc_msgSend_setCompressionMode_(v29, v30, 2, v31);

  uint64_t v35 = objc_msgSend_desc(v25, v32, v33, v34);
  objc_msgSend_setCompressionFootprint_(v35, v36, 0, v37);

  int64x2_t v41 = objc_msgSend_desc(v25, v38, v39, v40);
  objc_msgSend_setUsage_(v41, v42, 7, v43);

  uint64_t v47 = objc_msgSend_pixelFormat(v14[self->_detectionLvl + 42], v44, v45, v46);
  uint64_t v51 = objc_msgSend_desc(v25, v48, v49, v50);
  objc_msgSend_setPixelFormat_(v51, v52, v47, v53);

  uint64_t v57 = objc_msgSend_width(v14[self->_detectionLvl + 42], v54, v55, v56);
  uint64_t v61 = objc_msgSend_desc(v25, v58, v59, v60);
  objc_msgSend_setWidth_(v61, v62, v57, v63);

  uint64_t v67 = objc_msgSend_height(v14[self->_detectionLvl + 42], v64, v65, v66);
  uint64_t v71 = objc_msgSend_desc(v25, v68, v69, v70);
  objc_msgSend_setHeight_(v71, v72, v67, v73);

  objc_msgSend_setLabel_(v25, v74, 0, v75);
  uint64_t v79 = objc_msgSend_allocator(self->_metal, v76, v77, v78);
  uint64_t v82 = objc_msgSend_newTextureWithDescriptor_(v79, v80, (uint64_t)v25, v81);
  unint64_t v94 = (void *)v82;

  if (!v82)
  {
LABEL_8:
    FigDebugAssert3();
    int updated = FigSignalErrorAt();
    goto LABEL_7;
  }
  uint64_t v85 = 8 * self->_detectionLvl - 8;
  *(float *)&double v84 = v17;
  int v86 = objc_msgSend_prepareFusionRefLuma_refChroma_otherLuma_otherChroma_maskMBBinary_relativeBrightness_homography_output_params_(self, v83, *(uint64_t *)((char *)v14 + v85 + 336), *(uint64_t *)((char *)v14 + v85 + 496), *(void *)&v15[v85 + 336], *(void *)&v15[v85 + 496], v16, v82, v84, *(double *)&a6[1].meta.exposureParams.conversion_gain, *(double *)&a6[1].meta.exposureParams.luxLevel, *(double *)&a6[1].meta.exposureParams.CCT, a8);
  if (v86)
  {
    int updated = v86;
    goto LABEL_12;
  }
  *(float *)&double v88 = v17;
  int v89 = objc_msgSend_fuseRefPyramid_withOtherPyramid_refProperties_otherProperties_currentFusionWeights_relativeBrightness_(self, v87, (uint64_t)v14, (uint64_t)v15, a5, a6, v82, v88);
  if (v89)
  {
    int updated = v89;
    goto LABEL_12;
  }
  int updated = objc_msgSend_updateFusionWeights_(self, v90, v82, v91);
  if (updated)
  {
LABEL_12:
    FigDebugAssert3();
    goto LABEL_7;
  }
  FigMetalDecRef();
LABEL_7:

  return updated;
}

- (int)mitigationWithRefPyramid:(id)a3 otherPyramid:(id)a4 isRefProcessing:(BOOL)a5 refProperties:(frameProperties_t *)a6 otherProperties:(frameProperties_t *)a7 greenGhostBuffers:(id)a8 tuningParams:(id)a9
{
  BOOL v12 = a5;
  uint64_t v177 = *MEMORY[0x263EF8340];
  uint64_t v15 = (void **)a3;
  id v16 = a4;
  v137 = (id *)a8;
  id v17 = a9;
  uint64_t v21 = objc_opt_new();
  if (v17)
  {
    objc_msgSend_tuningParams(v17, v18, v19, v20);
    long long v172 = *(_OWORD *)((char *)v170 + 8);
    long long v173 = *(_OWORD *)((char *)&v170[1] + 8);
    uint64_t v174 = *((void *)&v170[2] + 1);
    objc_msgSend_tuningParams(v17, v22, v23, v24);
    float v25 = *((float *)&v145 + 1);
  }
  else
  {
    uint64_t v171 = 0;
    memset(v170, 0, sizeof(v170));
    long long v169 = 0u;
    long long v168 = 0u;
    long long v167 = 0u;
    long long v166 = 0u;
    long long v165 = 0u;
    long long v164 = 0u;
    long long v163 = 0u;
    long long v162 = 0u;
    long long v172 = *(_OWORD *)((char *)v170 + 8);
    long long v173 = *(_OWORD *)((char *)&v170[1] + 8);
    uint64_t v174 = 0;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    float v25 = 0.0;
    uint64_t v161 = 0;
  }
  unint64_t v134 = objc_msgSend_width(v15[self->_detectionLvl + 42], v18, v19, v20);
  uint64_t v29 = objc_msgSend_height(v15[self->_detectionLvl + 42], v26, v27, v28);
  unint64_t v135 = objc_msgSend_width(v15[self->_repairLvl + 42], v30, v31, v32);
  uint64_t v36 = objc_msgSend_height(v15[self->_repairLvl + 42], v33, v34, v35);
  id v144 = 0;
  if (!self->_canMitigationProceed) {
    goto LABEL_7;
  }
  if (LOBYTE(a6->meta.faces[1].rect.origin.y))
  {
    self->_canMitigationProceed = 0;
    objc_msgSend_setObject_forKeyedSubscript_(v21, v37, MEMORY[0x263EFFA80], @"isRunning");
    objc_msgSend_setObject_forKeyedSubscript_(v21, v40, MEMORY[0x263EFFA88], @"tripodMode");
LABEL_7:
    int64x2_t v41 = 0;
    int canMitigationProceedWithMaxMaskAverage = 0;
LABEL_8:
    uint64_t v43 = v137;
    goto LABEL_9;
  }
  uint64_t v133 = (uint64_t)v16;
  if (dword_26B429788)
  {
    uint64_t v132 = v36;
    unsigned int v143 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v36 = v132;
  }
  if (v12)
  {
    unint64_t v51 = v36;
    uint64_t v52 = 0;
    int64x2_t v41 = 0;
    goto LABEL_22;
  }
  if (*(float *)&a7[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].BG.highlights < v25
    || !BYTE1(a7[1].meta.exposureParams.normalized_snr))
  {
    if (dword_26B429788)
    {
      unsigned int v143 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v101 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
      uint64_t v43 = v137;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int64x2_t v41 = 0;
      int canMitigationProceedWithMaxMaskAverage = 0;
    }
    else
    {
      int64x2_t v41 = 0;
      int canMitigationProceedWithMaxMaskAverage = 0;
      uint64_t v43 = v137;
    }
    goto LABEL_13;
  }
  unint64_t v51 = v36;
  uint64_t v53 = objc_msgSend_allocator(self->_metal, v37, v38, v39);
  int64x2_t v41 = objc_msgSend_newTextureDescriptor(v53, v54, v55, v56);

  if (!v41)
  {
    uint64_t v131 = v9;
    LODWORD(v130) = 0;
LABEL_61:
    FigDebugAssert3();
    int canMitigationProceedWithMaxMaskAverage = FigSignalErrorAt();
    goto LABEL_62;
  }
  uint64_t v60 = objc_msgSend_desc(v41, v57, v58, v59);
  objc_msgSend_setCompressionMode_(v60, v61, 2, v62);

  uint64_t v66 = objc_msgSend_desc(v41, v63, v64, v65);
  objc_msgSend_setCompressionFootprint_(v66, v67, 0, v68);

  uint64_t v72 = objc_msgSend_desc(v41, v69, v70, v71);
  objc_msgSend_setUsage_(v72, v73, 7, v74);

  uint64_t v78 = objc_msgSend_desc(v41, v75, v76, v77);
  objc_msgSend_setPixelFormat_(v78, v79, 25, v80);

  double v84 = objc_msgSend_desc(v41, v81, v82, v83);
  objc_msgSend_setWidth_(v84, v85, v134, v86);

  uint64_t v90 = objc_msgSend_desc(v41, v87, v88, v89);
  objc_msgSend_setHeight_(v90, v91, v29, v92);

  objc_msgSend_setLabel_(v41, v93, 0, v94);
  uint64_t v98 = objc_msgSend_allocator(self->_metal, v95, v96, v97);
  uint64_t v52 = objc_msgSend_newTextureWithDescriptor_(v98, v99, (uint64_t)v41, v100);
  id v144 = v52;

  if (!v52)
  {
    uint64_t v131 = v9;
    LODWORD(v130) = 0;
    goto LABEL_61;
  }
LABEL_22:
  if (v17)
  {
    objc_msgSend_tuningParams(v17, v37, v38, v39);
  }
  else
  {
    uint64_t v141 = 0;
    memset(v140, 0, sizeof(v140));
  }
  int v102 = objc_msgSend_detectionWithRefPyramid_otherPyramid_refDetection_refProperties_otherProperties_maskMBBinary_params_(self, v37, (uint64_t)v15, v133, v12, a6, a7, v52, v140);
  if (v102)
  {
    int canMitigationProceedWithMaxMaskAverage = v102;
    uint64_t v131 = v9;
    LODWORD(v130) = v102;
    FigDebugAssert3();
LABEL_62:
    id v16 = (id)v133;
    goto LABEL_8;
  }
  if (!v12)
  {
    uint64_t v43 = v137;
    if (self->_isFirstNonRefFrame)
    {
      int FusionWeightTexturesWithWidth_height = objc_msgSend_allocateFusionWeightTexturesWithWidth_height_(self, v103, v135 >> 2, v51 >> 2);
      if (FusionWeightTexturesWithWidth_height)
      {
        int canMitigationProceedWithMaxMaskAverage = FusionWeightTexturesWithWidth_height;
        uint64_t v131 = v9;
        LODWORD(v130) = FusionWeightTexturesWithWidth_height;
        goto LABEL_58;
      }
      objc_storeStrong(v137 + 3, self->_ggMaxFusionWeights);
      objc_storeStrong((id *)&self->_fusedLuma, v137[1]);
      objc_storeStrong((id *)&self->_fusedChroma, v137[2]);
    }
    int v109 = objc_msgSend_fuseRefPyramid_withOtherPyramid_refProperties_otherProperties_maskMBBinary_params_(self, v103, (uint64_t)v15, v133, a6, a7, v52, &v172);
    int canMitigationProceedWithMaxMaskAverage = v109;
    if (!v109)
    {
      self->_isFirstNonRefFrame = 0;
      ++self->_nonRefFramesCount;
      FigMetalDecRef();
LABEL_36:
      id v16 = (id)v133;
      goto LABEL_9;
    }
    uint64_t v131 = v9;
    LODWORD(v130) = v109;
LABEL_58:
    FigDebugAssert3();
    goto LABEL_36;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v21, v103, MEMORY[0x263EFFA88], @"isRunning");
  if (v17)
  {
    objc_msgSend_tuningParams(v17, v104, v105, v106);
    LODWORD(v107) = v139;
  }
  else
  {
    double v107 = 0.0;
  }
  id v16 = (id)v133;
  int canMitigationProceedWithMaxMaskAverage = objc_msgSend_canMitigationProceedWithMaxMaskAverage_(self, v104, v105, v106, v107);
  uint64_t v43 = v137;
  if (self->_canMitigationProceed)
  {
    double v113 = (double)v135;
    double v114 = (double)v51;
    greenGhostCommon = self->_greenGhostCommon;
    if (v17)
    {
      objc_msgSend_tuningParams(v17, v110, v111, v112);
      objc_msgSend_extractFaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output_(greenGhostCommon, v116, 0, (uint64_t)a6, &self->_faceBodyBoundaries, v113, v114, v138, COERCE_DOUBLE(1036831949));
    }
    else
    {
      objc_msgSend_extractFaceBodyBoundariesFromFaceLandMarks_ev0FrameMetadata_imgSize_faceBoundaryPaddingRatio_bodyBoundaryPaddingRatio_output_(greenGhostCommon, v110, 0, (uint64_t)a6, &self->_faceBodyBoundaries, v113, v114, 0.0, COERCE_DOUBLE(1036831949));
    }
    *(float *)&double v120 = (float)v134 / (float)v135;
    objc_msgSend_scaleFaceBodyBoundariesWithSizeRatio_(self, v117, v118, v119, v120);
    if (self->_faceBodyBoundaries.nFaces) {
      objc_msgSend_numberWithInt_(NSNumber, v124, 1, v125);
    }
    else {
    char v126 = objc_msgSend_numberWithInt_(NSNumber, v124, *(_DWORD *)&self->_anon_f4[172] != 0, v125);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v21, v127, (uint64_t)v126, @"foundFacesOrBodies");

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    objc_msgSend_addToSidecar_forKey_(WeakRetained, v129, (uint64_t)v21, @"GreenGhostLowLight");

    goto LABEL_13;
  }
  if (dword_26B429788)
  {
    unsigned int v143 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v121 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v122 = v143;
    if (os_log_type_enabled(v121, type)) {
      unsigned int v123 = v122;
    }
    else {
      unsigned int v123 = v122 & 0xFFFFFFFE;
    }
    if (v123)
    {
      int v175 = 136315138;
      uint64_t v176 = "-[GreenGhostLowLightStage mitigationWithRefPyramid:otherPyramid:isRefProcessing:refProperties:otherProperti"
             "es:greenGhostBuffers:tuningParams:]";
      LODWORD(v131) = 12;
      id v130 = &v175;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v16 = (id)v133;
    uint64_t v43 = v137;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v21, v110, MEMORY[0x263EFFA88], @"exceedsMaxMaskAverage", v130, v131);
LABEL_9:
  if (objc_msgSend_count(v21, v37, v38, v39, v130, v131))
  {
    id v47 = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    objc_msgSend_addToSidecar_forKey_(v47, v48, (uint64_t)v21, @"GreenGhostLowLight");
  }
  if (!self->_canMitigationProceed) {
    objc_msgSend_releaseTextures(self, v44, v45, v46);
  }
LABEL_13:

  return canMitigationProceedWithMaxMaskAverage;
}

- (int)mixFusedTexturesWithRefLuma:(id)a3 refChroma:(id)a4 refProperties:(frameProperties_t *)a5 tuningParams:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v16 = v12;
  id v175 = 0;
  if (v12)
  {
    objc_msgSend_tuningParams(v12, v13, v14, v15);
    int v17 = DWORD2(v168);
    objc_msgSend_tuningParams(v16, v18, v19, v20);
    int v21 = HIDWORD(v150);
  }
  else
  {
    uint64_t v174 = 0;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    int v21 = 0;
    int v17 = 0;
    uint64_t v156 = 0;
  }
  int v157 = v21;
  unint64_t v22 = objc_msgSend_width(self->_fusedLuma, v13, v14, v15);
  uint64_t v26 = objc_msgSend_height(self->_fusedLuma, v23, v24, v25);
  int y_low = LODWORD(a5[1].meta.ROI.origin.y);
  BOOL v139 = y_low == 1;
  BOOL v138 = y_low == 2;
  long long v31 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  v137[10] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  v137[11] = v31;
  v137[12] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  long long v32 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  v137[6] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  v137[7] = v32;
  long long v33 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  v137[8] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  v137[9] = v33;
  long long v34 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  v137[2] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  v137[3] = v34;
  long long v35 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  v137[4] = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  v137[5] = v35;
  long long v36 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.version;
  v137[0] = *(_OWORD *)&a5[1].meta.ROI.size.height;
  v137[1] = v36;
  if (!self->_canMitigationProceed || !self->_maskMB || !self->_ggFusionWeightsAcc) {
    goto LABEL_13;
  }
  unint64_t v37 = v26;
  uint64_t v38 = objc_msgSend_allocator(self->_metal, v27, v28, v29);
  uint64_t v42 = objc_msgSend_newTextureDescriptor(v38, v39, v40, v41);

  if (!v42)
  {
    FigDebugAssert3();
    int v132 = FigSignalErrorAt();
    goto LABEL_14;
  }
  uint64_t v46 = objc_msgSend_desc(v42, v43, v44, v45);
  objc_msgSend_setCompressionMode_(v46, v47, 2, v48);

  uint64_t v52 = objc_msgSend_desc(v42, v49, v50, v51);
  objc_msgSend_setCompressionFootprint_(v52, v53, 0, v54);

  uint64_t v58 = objc_msgSend_desc(v42, v55, v56, v57);
  objc_msgSend_setUsage_(v58, v59, 7, v60);

  uint64_t v64 = objc_msgSend_desc(v42, v61, v62, v63);
  objc_msgSend_setPixelFormat_(v64, v65, 25, v66);

  uint64_t v70 = objc_msgSend_width(self->_maskMB, v67, v68, v69);
  uint64_t v74 = objc_msgSend_desc(v42, v71, v72, v73);
  objc_msgSend_setWidth_(v74, v75, v70, v76);

  uint64_t v80 = objc_msgSend_height(self->_maskMB, v77, v78, v79);
  double v84 = objc_msgSend_desc(v42, v81, v82, v83);
  objc_msgSend_setHeight_(v84, v85, v80, v86);

  objc_msgSend_setLabel_(v42, v87, 0, v88);
  uint64_t v92 = objc_msgSend_allocator(self->_metal, v89, v90, v91);
  uint64_t v95 = objc_msgSend_newTextureWithDescriptor_(v92, v93, (uint64_t)v42, v94);
  id v175 = v95;

  if (!v95) {
    goto LABEL_18;
  }
  LODWORD(v97) = v17;
  int v98 = objc_msgSend_erodeTexture_withNormalizedRadius_output_(self->_greenGhostCommon, v96, (uint64_t)self->_maskMB, (uint64_t)v95, v97);
  if (v98)
  {
    int v132 = v98;
    FigDebugAssert3();
LABEL_20:

    goto LABEL_14;
  }
  int v102 = objc_msgSend_commandQueue(self->_metal, v99, v100, v101);
  uint64_t v106 = objc_msgSend_commandBuffer(v102, v103, v104, v105);

  if (!v106)
  {
LABEL_18:
    FigDebugAssert3();
    int v132 = FigSignalErrorAt();
    goto LABEL_20;
  }
  uint64_t v110 = objc_msgSend_computeCommandEncoder(v106, v107, v108, v109);
  if (!v110)
  {
    FigDebugAssert3();
    int v132 = FigSignalErrorAt();

    goto LABEL_20;
  }
  double v113 = v110;
  objc_msgSend_setComputePipelineState_(v110, v111, (uint64_t)self->_pipelineStates[9], v112);
  objc_msgSend_setImageblockWidth_height_(v113, v114, 32, 32);
  objc_msgSend_setTexture_atIndex_(v113, v115, (uint64_t)v10, 0);
  objc_msgSend_setTexture_atIndex_(v113, v116, (uint64_t)v11, 1);
  objc_msgSend_setTexture_atIndex_(v113, v117, (uint64_t)v95, 2);
  objc_msgSend_setTexture_atIndex_(v113, v118, (uint64_t)self->_ggFusionWeightsAcc, 3);
  objc_msgSend_setTexture_atIndex_(v113, v119, (uint64_t)self->_fusedLuma, 4);
  objc_msgSend_setTexture_atIndex_(v113, v120, (uint64_t)self->_fusedChroma, 5);
  objc_msgSend_setBytes_length_atIndex_(v113, v121, (uint64_t)&v139, 1, 0);
  objc_msgSend_setBytes_length_atIndex_(v113, v122, (uint64_t)&v138, 1, 1);
  objc_msgSend_setBytes_length_atIndex_(v113, v123, (uint64_t)v137, 208, 2);
  objc_msgSend_setBytes_length_atIndex_(v113, v124, (uint64_t)&v157, 4, 3);
  v136[0] = v22 >> 1;
  v136[1] = v37 >> 1;
  v136[2] = 1;
  int64x2_t v134 = vdupq_n_s64(0x10uLL);
  uint64_t v135 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v113, v125, (uint64_t)v136, (uint64_t)&v134);
  objc_msgSend_endEncoding(v113, v126, v127, v128);
  objc_msgSend_commit(v106, v129, v130, v131);
  FigMetalDecRef();

LABEL_13:
  int v132 = 0;
LABEL_14:

  return v132;
}

- (int)updateMaskAndComputeGradientForLuma:(id)a3 output:(id)a4 params:(LowLightInpaintTuning *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v137 = 0;
  uint64_t v136 = *(void *)&a5->var0;
  uint64_t v13 = objc_msgSend_allocator(self->_metal, v10, v11, v12);
  int v17 = objc_msgSend_newTextureDescriptor(v13, v14, v15, v16);

  if (!v17) {
    goto LABEL_12;
  }
  int v21 = objc_msgSend_desc(v17, v18, v19, v20);
  objc_msgSend_setCompressionMode_(v21, v22, 2, v23);

  uint64_t v27 = objc_msgSend_desc(v17, v24, v25, v26);
  objc_msgSend_setCompressionFootprint_(v27, v28, 0, v29);

  long long v33 = objc_msgSend_desc(v17, v30, v31, v32);
  objc_msgSend_setUsage_(v33, v34, 7, v35);

  uint64_t v39 = objc_msgSend_pixelFormat(self->_maskMB, v36, v37, v38);
  uint64_t v43 = objc_msgSend_desc(v17, v40, v41, v42);
  objc_msgSend_setPixelFormat_(v43, v44, v39, v45);

  uint64_t v49 = objc_msgSend_width(self->_maskMB, v46, v47, v48);
  uint64_t v53 = objc_msgSend_desc(v17, v50, v51, v52);
  objc_msgSend_setWidth_(v53, v54, v49, v55);

  uint64_t v59 = objc_msgSend_height(self->_maskMB, v56, v57, v58);
  uint64_t v63 = objc_msgSend_desc(v17, v60, v61, v62);
  objc_msgSend_setHeight_(v63, v64, v59, v65);

  objc_msgSend_setLabel_(v17, v66, 0, v67);
  uint64_t v71 = objc_msgSend_allocator(self->_metal, v68, v69, v70);
  uint64_t v74 = objc_msgSend_newTextureWithDescriptor_(v71, v72, (uint64_t)v17, v73);
  id v137 = v74;

  if (!v74) {
    goto LABEL_12;
  }
  uint64_t v78 = objc_msgSend_commandQueue(self->_metal, v75, v76, v77);
  uint64_t v82 = objc_msgSend_commandBuffer(v78, v79, v80, v81);

  if (v82)
  {
    uint64_t v86 = objc_msgSend_computeCommandEncoder(v82, v83, v84, v85);
    if (v86)
    {
      uint64_t v89 = v86;
      objc_msgSend_setComputePipelineState_(v86, v87, (uint64_t)self->_pipelineStates[10], v88);
      objc_msgSend_setTexture_atIndex_(v89, v90, (uint64_t)v8, 0);
      objc_msgSend_setTexture_atIndex_(v89, v91, (uint64_t)self->_ggMaxFusionWeights, 1);
      objc_msgSend_setTexture_atIndex_(v89, v92, (uint64_t)self->_maskMB, 2);
      id v133 = v9;
      objc_msgSend_setTexture_atIndex_(v89, v93, (uint64_t)v9, 3);
      objc_msgSend_setTexture_atIndex_(v89, v94, (uint64_t)v74, 4);
      objc_msgSend_setBytes_length_atIndex_(v89, v95, (uint64_t)&v136, 8, 0);
      unint64_t v99 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[10], v96, v97, v98);
      unint64_t v103 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[10], v100, v101, v102) / v99;
      v135[0] = objc_msgSend_width(v8, v104, v105, v106);
      v135[1] = objc_msgSend_height(v8, v107, v108, v109);
      v135[2] = 1;
      v134[0] = v99;
      v134[1] = v103;
      v134[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v89, v110, (uint64_t)v135, (uint64_t)v134);
      objc_msgSend_endEncoding(v89, v111, v112, v113);
      objc_msgSend_commit(v82, v114, v115, v116);
      float var2 = (float)a5->var2;
      unint64_t v121 = objc_msgSend_width(v74, v118, v119, v120);
      if (v121 <= objc_msgSend_height(v74, v122, v123, v124)) {
        uint64_t v128 = objc_msgSend_height(v74, v125, v126, v127);
      }
      else {
        uint64_t v128 = objc_msgSend_width(v74, v125, v126, v127);
      }
      *(float *)&double v130 = var2 / (float)(unint64_t)v128;
      int v131 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self->_greenGhostCommon, v129, (uint64_t)v74, (uint64_t)self->_maskMB, v130);
      id v9 = v133;
      if (v131) {
        FigDebugAssert3();
      }
      else {
        FigMetalDecRef();
      }
    }
    else
    {
      FigDebugAssert3();
      int v131 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
  }

  return v131;
}

- (int)propagateLuma:(id)a3 chroma:(id)a4 gradient:(id)a5 outputLuma:(id)a6 outputChroma:(id)a7 outputGradient:(id)a8 params:(LowLightInpaintTuning *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  float var0 = 0.0;
  id v158 = 0;
  uint64_t v24 = objc_msgSend_allocator(self->_metal, v21, v22, v23);
  uint64_t v28 = objc_msgSend_newTextureDescriptor(v24, v25, v26, v27);

  if (!v28)
  {
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v32 = objc_msgSend_desc(v28, v29, v30, v31);
  objc_msgSend_setCompressionMode_(v32, v33, 2, v34);

  uint64_t v38 = objc_msgSend_desc(v28, v35, v36, v37);
  objc_msgSend_setCompressionFootprint_(v38, v39, 0, v40);

  uint64_t v44 = objc_msgSend_desc(v28, v41, v42, v43);
  objc_msgSend_setUsage_(v44, v45, 7, v46);

  uint64_t v50 = objc_msgSend_pixelFormat(self->_maskMB, v47, v48, v49);
  uint64_t v54 = objc_msgSend_desc(v28, v51, v52, v53);
  objc_msgSend_setPixelFormat_(v54, v55, v50, v56);

  uint64_t v60 = objc_msgSend_width(self->_maskMB, v57, v58, v59);
  uint64_t v64 = objc_msgSend_desc(v28, v61, v62, v63);
  objc_msgSend_setWidth_(v64, v65, v60, v66);

  uint64_t v70 = objc_msgSend_height(self->_maskMB, v67, v68, v69);
  long long v155 = v28;
  uint64_t v74 = objc_msgSend_desc(v28, v71, v72, v73);
  objc_msgSend_setHeight_(v74, v75, v70, v76);

  unint64_t v80 = objc_msgSend_width(self->_maskMB, v77, v78, v79);
  unint64_t v87 = objc_msgSend_height(self->_maskMB, v81, v82, v83);
  maskMB = self->_maskMB;
  uint64_t v89 = (uint64_t)v16;
  if (v80 <= v87) {
    uint64_t v90 = objc_msgSend_height(maskMB, v84, v85, v86);
  }
  else {
    uint64_t v90 = objc_msgSend_width(maskMB, v84, v85, v86);
  }
  unint64_t v93 = v90;
  objc_msgSend_setLabel_(v155, v91, 0, v92);
  uint64_t v97 = objc_msgSend_allocator(self->_metal, v94, v95, v96);
  uint64_t v100 = objc_msgSend_newTextureWithDescriptor_(v97, v98, (uint64_t)v155, v99);
  id v158 = v100;

  if (!v100) {
    goto LABEL_15;
  }
  *(float *)&double v102 = 1.0 / (float)v93;
  int v103 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self->_greenGhostCommon, v101, (uint64_t)self->_maskMB, (uint64_t)v100, v102);
  if (v103)
  {
    int v152 = v103;
    FigDebugAssert3();
LABEL_17:
    id v16 = (id)v89;
    goto LABEL_10;
  }
  float var0 = a9->var5.var0;
  double v107 = objc_msgSend_commandQueue(self->_metal, v104, v105, v106);
  uint64_t v111 = objc_msgSend_commandBuffer(v107, v108, v109, v110);

  if (!v111)
  {
LABEL_15:
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v115 = objc_msgSend_computeCommandEncoder(v111, v112, v113, v114);
  if (!v115)
  {
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();

    goto LABEL_17;
  }
  uint64_t v118 = v115;
  objc_msgSend_setComputePipelineState_(v115, v116, (uint64_t)self->_pipelineStates[11], v117);
  objc_msgSend_setTexture_atIndex_(v118, v119, (uint64_t)v15, 0);
  long long v154 = (void *)v89;
  objc_msgSend_setTexture_atIndex_(v118, v120, v89, 1);
  objc_msgSend_setTexture_atIndex_(v118, v121, (uint64_t)v17, 2);
  objc_msgSend_setTexture_atIndex_(v118, v122, (uint64_t)self->_maskMB, 3);
  objc_msgSend_setTexture_atIndex_(v118, v123, (uint64_t)v100, 4);
  objc_msgSend_setTexture_atIndex_(v118, v124, (uint64_t)v18, 5);
  objc_msgSend_setTexture_atIndex_(v118, v125, (uint64_t)v19, 6);
  objc_msgSend_setTexture_atIndex_(v118, v126, (uint64_t)v20, 7);
  objc_msgSend_setBytes_length_atIndex_(v118, v127, (uint64_t)&var0, 4, 0);
  unint64_t v131 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[11], v128, v129, v130);
  id v135 = v20;
  id v136 = v19;
  id v137 = v18;
  unint64_t v138 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[11], v132, v133, v134) / v131;
  v157[0] = objc_msgSend_width(v15, v139, v140, v141);
  v157[1] = objc_msgSend_height(v15, v142, v143, v144);
  v157[2] = 1;
  v156[0] = v131;
  v156[1] = v138;
  id v18 = v137;
  id v19 = v136;
  id v20 = v135;
  v156[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v118, v145, (uint64_t)v157, (uint64_t)v156);
  objc_msgSend_endEncoding(v118, v146, v147, v148);
  objc_msgSend_commit(v111, v149, v150, v151);
  FigMetalDecRef();

  id v16 = v154;
  int v152 = 0;
LABEL_10:
  uint64_t v28 = v155;
LABEL_11:

  return v152;
}

- (int)prepareInpaintingWithLuma:(id)a3 andChroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6 outputGradient:(id)a7 params:(LowLightInpaintTuning *)a8
{
  id v14 = a3;
  id v113 = a4;
  id v111 = a5;
  id v112 = a6;
  id v15 = a7;
  uint64_t v115 = 0;
  uint64_t v116 = 0;
  uint64_t v114 = 0;
  id v19 = objc_msgSend_allocator(self->_metal, v16, v17, v18);
  uint64_t v23 = objc_msgSend_newTextureDescriptor(v19, v20, v21, v22);

  if (!v23) {
    goto LABEL_12;
  }
  uint64_t v27 = objc_msgSend_desc(v23, v24, v25, v26);
  objc_msgSend_setCompressionMode_(v27, v28, 2, v29);

  long long v33 = objc_msgSend_desc(v23, v30, v31, v32);
  objc_msgSend_setCompressionFootprint_(v33, v34, 0, v35);

  uint64_t v39 = objc_msgSend_desc(v23, v36, v37, v38);
  objc_msgSend_setUsage_(v39, v40, 7, v41);

  uint64_t v45 = objc_msgSend_pixelFormat(v15, v42, v43, v44);
  uint64_t v49 = objc_msgSend_desc(v23, v46, v47, v48);
  objc_msgSend_setPixelFormat_(v49, v50, v45, v51);

  uint64_t v55 = objc_msgSend_width(v15, v52, v53, v54);
  uint64_t v59 = objc_msgSend_desc(v23, v56, v57, v58);
  objc_msgSend_setWidth_(v59, v60, v55, v61);

  uint64_t v65 = objc_msgSend_height(v15, v62, v63, v64);
  uint64_t v69 = objc_msgSend_desc(v23, v66, v67, v68);
  objc_msgSend_setHeight_(v69, v70, v65, v71);

  objc_msgSend_setLabel_(v23, v72, 0, v73);
  uint64_t v77 = objc_msgSend_allocator(self->_metal, v74, v75, v76);
  uint64_t v80 = objc_msgSend_newTextureWithDescriptor_(v77, v78, (uint64_t)v23, v79);
  uint64_t v116 = (void *)v80;

  if (!v80) {
    goto LABEL_12;
  }
  objc_msgSend_setLabel_(v23, v81, 0, v82);
  uint64_t v86 = objc_msgSend_allocator(self->_metal, v83, v84, v85);
  uint64_t v89 = objc_msgSend_newTextureWithDescriptor_(v86, v87, (uint64_t)v23, v88);
  uint64_t v115 = (void *)v89;

  if (!v89
    || (objc_msgSend_setLabel_(v23, v90, 0, v91),
        objc_msgSend_allocator(self->_metal, v92, v93, v94),
        uint64_t v95 = objc_claimAutoreleasedReturnValue(),
        uint64_t v98 = objc_msgSend_newTextureWithDescriptor_(v95, v96, (uint64_t)v23, v97),
        uint64_t v114 = (void *)v98,
        v95,
        !v98))
  {
LABEL_12:
    FigDebugAssert3();
    int v109 = FigSignalErrorAt();
LABEL_16:
    uint64_t v104 = v111;
    goto LABEL_11;
  }
  int updated = objc_msgSend_updateMaskAndComputeGradientForLuma_output_params_(self, v99, (uint64_t)v14, v80, a8);
  if (updated)
  {
    int v109 = updated;
LABEL_15:
    FigDebugAssert3();
    goto LABEL_16;
  }
  int v102 = objc_msgSend_propagateLuma_chroma_gradient_outputLuma_outputChroma_outputGradient_params_(self, v101, (uint64_t)v14, (uint64_t)v113, v80, v98, v112, v15, a8);
  if (v102)
  {
    int v109 = v102;
    goto LABEL_15;
  }
  uint64_t v104 = v111;
  int v105 = objc_msgSend_boxFilter_withRadius_output_(self->_greenGhostCommon, v103, v98, LODWORD(a8->var3), v111);
  if (v105)
  {
    int v109 = v105;
    goto LABEL_19;
  }
  int v107 = objc_msgSend_boxFilter_withRadius_output_(self->_greenGhostCommon, v106, (uint64_t)self->_maskMB, LODWORD(a8->var4), v89);
  if (v107)
  {
    int v109 = v107;
    goto LABEL_19;
  }
  int v109 = objc_msgSend_boxFilter_withRadius_output_(self->_greenGhostCommon, v108, v89, LODWORD(a8->var4), self->_maskMB);
  if (v109)
  {
LABEL_19:
    FigDebugAssert3();
    goto LABEL_11;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_11:

  return v109;
}

- (int)applyInpaintWithDownscaledLuma:(id)a3 propagatedLuma:(id)a4 downscaledChroma:(id)a5 propagatedChroma:(id)a6 propagatedGradient:(id)a7 maskPreInpainting:(id)a8 outputLuma:(id)a9 outputChroma:(id)a10 params:(LowLightInpaintTuning *)a11
{
  id v84 = a3;
  id v17 = a4;
  id v18 = a5;
  id v83 = a6;
  id v19 = a7;
  id v82 = a8;
  id v20 = a9;
  id v81 = a10;
  uint64_t v24 = objc_msgSend_width(v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_height(v20, v25, v26, v27);
  uint64_t v32 = objc_msgSend_commandQueue(self->_metal, v29, v30, v31);
  uint64_t v36 = objc_msgSend_commandBuffer(v32, v33, v34, v35);

  if (v36)
  {
    unint64_t v77 = v28;
    unint64_t v78 = v24;
    uint64_t v80 = (uint64_t)v20;
    uint64_t v40 = v19;
    uint64_t v41 = (uint64_t)v17;
    uint64_t v42 = objc_msgSend_computeCommandEncoder(v36, v37, v38, v39);
    uint64_t v79 = v36;
    if (v42)
    {
      uint64_t v45 = v42;
      objc_msgSend_setComputePipelineState_(v42, v43, (uint64_t)self->_pipelineStates[12], v44);
      objc_msgSend_setImageblockWidth_height_(v45, v46, 32, 32);
      uint64_t v47 = v84;
      objc_msgSend_setTexture_atIndex_(v45, v48, (uint64_t)v84, 0);
      uint64_t v49 = (void *)v41;
      objc_msgSend_setTexture_atIndex_(v45, v50, v41, 1);
      objc_msgSend_setTexture_atIndex_(v45, v51, (uint64_t)v18, 2);
      uint64_t v52 = v83;
      objc_msgSend_setTexture_atIndex_(v45, v53, (uint64_t)v83, 3);
      objc_msgSend_setTexture_atIndex_(v45, v54, (uint64_t)self->_maskMB, 4);
      objc_msgSend_setTexture_atIndex_(v45, v55, (uint64_t)v40, 5);
      uint64_t v56 = (void *)v80;
      objc_msgSend_setTexture_atIndex_(v45, v57, v80, 6);
      uint64_t v58 = v81;
      objc_msgSend_setTexture_atIndex_(v45, v59, (uint64_t)v81, 7);
      uint64_t v60 = v82;
      objc_msgSend_setTexture_atIndex_(v45, v61, (uint64_t)v82, 8);
      objc_msgSend_setTexture_atIndex_(v45, v62, (uint64_t)self->_ggFusionWeightsAcc, 9);
      objc_msgSend_setBytes_length_atIndex_(v45, v63, (uint64_t)a11, 88, 0);
      objc_msgSend_setBytes_length_atIndex_(v45, v64, (uint64_t)&self->_faceBodyBoundaries, 352, 1);
      objc_msgSend_setBytes_length_atIndex_(v45, v65, (uint64_t)&self->_nonRefFramesCount, 4, 2);
      v87[0] = v78 >> 1;
      v87[1] = v77 >> 1;
      v87[2] = 1;
      int64x2_t v85 = vdupq_n_s64(0x10uLL);
      uint64_t v86 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v45, v66, (uint64_t)v87, (uint64_t)&v85);
      objc_msgSend_endEncoding(v45, v67, v68, v69);
      uint64_t v70 = v79;
      objc_msgSend_commit(v79, v71, v72, v73);

      uint64_t v74 = v49;
      int v75 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v75 = FigSignalErrorAt();
      uint64_t v52 = v83;
      uint64_t v47 = v84;
      uint64_t v74 = (void *)v41;
      uint64_t v58 = v81;
      uint64_t v60 = v82;
      uint64_t v70 = v79;
      uint64_t v56 = (void *)v80;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v56 = v20;
    int v75 = FigSignalErrorAt();
    uint64_t v74 = v17;
    uint64_t v40 = v19;
    uint64_t v52 = v83;
    uint64_t v47 = v84;
    uint64_t v70 = 0;
    uint64_t v58 = v81;
    uint64_t v60 = v82;
  }

  return v75;
}

- (int)inpaintLuma:(id)a3 andChroma:(id)a4 tuningParams:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if (v11)
  {
    objc_msgSend_tuningParams(v11, v12, v13, v14);
  }
  else
  {
    uint64_t v156 = 0;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v151 = 0u;
  }
  v157[2] = v153;
  void v157[3] = v154;
  v157[4] = v155;
  uint64_t v158 = v156;
  v157[0] = v151;
  v157[1] = v152;
  long long v149 = 0;
  uint64_t v150 = 0;
  uint64_t v147 = 0;
  uint64_t v148 = 0;
  long long v145 = 0;
  long long v146 = 0;
  unint64_t v15 = objc_msgSend_width(v9, v12, v13, v14);
  uint64_t v19 = objc_msgSend_height(v9, v16, v17, v18);
  if (!self->_canMitigationProceed) {
    goto LABEL_21;
  }
  if (!self->_maskMB)
  {
    id v137 = objc_opt_new();
    objc_msgSend_setObject_forKeyedSubscript_(v137, v138, MEMORY[0x263EFFA88], @"skipRepair");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    objc_msgSend_addToSidecar_forKey_(WeakRetained, v140, (uint64_t)v137, @"GreenGhostLowLight");

LABEL_21:
    int v136 = 0;
    goto LABEL_22;
  }
  unint64_t v23 = v19;
  uint64_t v24 = objc_msgSend_allocator(self->_metal, v20, v21, v22);
  uint64_t v28 = objc_msgSend_newTextureDescriptor(v24, v25, v26, v27);

  if (!v28)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    goto LABEL_22;
  }
  uint64_t v32 = v15 >> 2;
  uint64_t v33 = v23 >> 2;
  uint64_t v34 = objc_msgSend_desc(v28, v29, v30, v31);
  objc_msgSend_setCompressionMode_(v34, v35, 2, v36);

  uint64_t v40 = objc_msgSend_desc(v28, v37, v38, v39);
  objc_msgSend_setCompressionFootprint_(v40, v41, 0, v42);

  uint64_t v46 = objc_msgSend_desc(v28, v43, v44, v45);
  objc_msgSend_setUsage_(v46, v47, 7, v48);

  uint64_t v52 = objc_msgSend_desc(v28, v49, v50, v51);
  objc_msgSend_setWidth_(v52, v53, v32, v54);

  uint64_t v58 = objc_msgSend_desc(v28, v55, v56, v57);
  objc_msgSend_setHeight_(v58, v59, v33, v60);

  uint64_t v64 = objc_msgSend_desc(v28, v61, v62, v63);
  objc_msgSend_setPixelFormat_(v64, v65, 25, v66);

  objc_msgSend_setLabel_(v28, v67, 0, v68);
  uint64_t v72 = objc_msgSend_allocator(self->_metal, v69, v70, v71);
  uint64_t v150 = objc_msgSend_newTextureWithDescriptor_(v72, v73, (uint64_t)v28, v74);

  if (!v150)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
LABEL_26:
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();

    goto LABEL_22;
  }
  objc_msgSend_setLabel_(v28, v75, 0, v76);
  uint64_t v80 = objc_msgSend_allocator(self->_metal, v77, v78, v79);
  uint64_t v83 = objc_msgSend_newTextureWithDescriptor_(v80, v81, (uint64_t)v28, v82);
  long long v149 = (void *)v83;

  if (!v83)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
    goto LABEL_26;
  }
  id v144 = v11;
  objc_msgSend_setLabel_(v28, v84, 0, v85);
  uint64_t v89 = objc_msgSend_allocator(self->_metal, v86, v87, v88);
  uint64_t v92 = objc_msgSend_newTextureWithDescriptor_(v89, v90, (uint64_t)v28, v91);
  long long v146 = (void *)v92;

  if (!v92)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
LABEL_31:
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    goto LABEL_19;
  }
  objc_msgSend_setLabel_(v28, v93, 0, v94);
  uint64_t v98 = objc_msgSend_allocator(self->_metal, v95, v96, v97);
  uint64_t v101 = objc_msgSend_newTextureWithDescriptor_(v98, v99, (uint64_t)v28, v100);
  uint64_t v147 = (void *)v101;

  if (!v101)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
    goto LABEL_31;
  }
  int v105 = objc_msgSend_desc(v28, v102, v103, v104);
  objc_msgSend_setPixelFormat_(v105, v106, 65, v107);

  objc_msgSend_setLabel_(v28, v108, 0, v109);
  id v113 = objc_msgSend_allocator(self->_metal, v110, v111, v112);
  uint64_t v116 = objc_msgSend_newTextureWithDescriptor_(v113, v114, (uint64_t)v28, v115);
  uint64_t v148 = (void *)v116;

  if (!v116)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
    goto LABEL_31;
  }
  objc_msgSend_setLabel_(v28, v117, 0, v118);
  unsigned int v122 = objc_msgSend_allocator(self->_metal, v119, v120, v121);
  uint64_t v125 = objc_msgSend_newTextureWithDescriptor_(v122, v123, (uint64_t)v28, v124);
  long long v145 = (void *)v125;

  if (!v125)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = 0;
    goto LABEL_31;
  }
  int v127 = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v126, (uint64_t)self->_maskMB, (uint64_t)v150);
  if (v127)
  {
    int v136 = v127;
    uint64_t v143 = v5;
    LODWORD(v142) = v127;
LABEL_37:
    FigDebugAssert3();
    goto LABEL_19;
  }
  int v129 = objc_msgSend_downscaleInput_output_(self->_greenGhostCommon, v128, (uint64_t)v9, v83);
  if (v129)
  {
    int v136 = v129;
    uint64_t v143 = v5;
    LODWORD(v142) = v129;
    goto LABEL_37;
  }
  int v131 = objc_msgSend_downscaleInput_output_(self->_greenGhostCommon, v130, (uint64_t)v10, v116);
  if (v131)
  {
    int v136 = v131;
    uint64_t v143 = v5;
    LODWORD(v142) = v131;
    goto LABEL_37;
  }
  int v133 = objc_msgSend_prepareInpaintingWithLuma_andChroma_outputLuma_outputChroma_outputGradient_params_(self, v132, v83, v116, v92, v125, v101, v157);
  if (v133)
  {
    int v136 = v133;
    uint64_t v143 = v5;
    LODWORD(v142) = v133;
    goto LABEL_37;
  }
  int v135 = objc_msgSend_applyInpaintWithDownscaledLuma_propagatedLuma_downscaledChroma_propagatedChroma_propagatedGradient_maskPreInpainting_outputLuma_outputChroma_params_(self, v134, v83, v92, v116, v125, v101, v150, v9, v10, v157);
  int v136 = v135;
  if (v135)
  {
    uint64_t v143 = v5;
    LODWORD(v142) = v135;
    goto LABEL_37;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_19:

  id v11 = v144;
LABEL_22:
  objc_msgSend_releaseTextures(self, v20, v21, v22, v142, v143);

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
  objc_storeStrong((id *)&self->_sumMaskBuffer, 0);
  objc_storeStrong((id *)&self->_ggFusionWeightsAcc, 0);
  objc_storeStrong((id *)&self->_ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->_fusedChroma, 0);
  objc_storeStrong((id *)&self->_fusedLuma, 0);
  objc_storeStrong((id *)&self->_maskMB, 0);
  objc_storeStrong((id *)&self->_maxVariationTex, 0);
  objc_storeStrong((id *)&self->_maskSB, 0);
  objc_storeStrong((id *)&self->_refChroma, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_greenGhostCommon, 0);
  for (uint64_t i = 112; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end