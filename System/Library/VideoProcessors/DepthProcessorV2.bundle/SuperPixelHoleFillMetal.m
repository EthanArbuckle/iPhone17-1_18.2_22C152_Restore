@interface SuperPixelHoleFillMetal
- (SuperPixelHoleFillMetal)initWithMetalContext:(id)a3;
- (int)RunSolver:(float)a3;
- (int)allocateResources:(unsigned int)a3;
- (int)computeStage0:(id *)a3 inImageTexture:(id)a4 inLabelTexture:(id)a5 inPersonMaskTexture:(id)a6 inInstanceSegmentationLayer0Texture:(id)a7 inInstanceSegmentationLayer1Texture:(id)a8 inInstanceSegmentationLayer2Texture:(id)a9 inInstanceSegmentationLayer3Texture:(id)a10;
- (int)computeStage4:(id *)a3 inLabelTexture:(id)a4 inDepthTex:(id)a5 inConfTex:(id)a6 inDistanceTransformMapTex:(id)a7 maxDist:(float)a8 sigma_den:(float)a9;
- (int)computeStageSolver:(id *)a3 inLabelTexture:(id)a4 inConfTex:(id)a5 inImageTex:(id)a6 outDepthTex:(id)a7 outConfTex:(id)a8;
- (int)convertFrom420fPixelBuffer:(id *)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 toSlicRgbaTexture:(id)a6;
- (void)dealloc;
- (void)releaseResources;
@end

@implementation SuperPixelHoleFillMetal

- (SuperPixelHoleFillMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();

    self = 0;
    goto LABEL_12;
  }
  v53.receiver = self;
  v53.super_class = (Class)SuperPixelHoleFillMetal;
  v6 = [(SuperPixelHoleFillMetal *)&v53 init];
  self = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v7, @"kernelConvertToRbga", 0, v8, v9);
    v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelConvertToRbga = self->_kernelConvertToRbga;
    self->_kernelConvertToRbga = v10;

    if (!self->_kernelConvertToRbga) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v12, @"kernelComputeStage0", 0, v13, v14);
    v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelComputeStage0 = self->_kernelComputeStage0;
    self->_kernelComputeStage0 = v15;

    if (!self->_kernelComputeStage0) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v17, @"kernelComputeStage1", 0, v18, v19);
    v20 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelComputeStage1 = self->_kernelComputeStage1;
    self->_kernelComputeStage1 = v20;

    if (!self->_kernelComputeStage1) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v22, @"kernelComputeStage2", 0, v23, v24);
    v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelComputeStage2 = self->_kernelComputeStage2;
    self->_kernelComputeStage2 = v25;

    if (!self->_kernelComputeStage2) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v27, @"kernelComputeStage4", 0, v28, v29);
    v30 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelComputeStage4 = self->_kernelComputeStage4;
    self->_kernelComputeStage4 = v30;

    if (!self->_kernelComputeStage4) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v32, @"kernelComputeStage5", 0, v33, v34);
    v35 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelComputeStage5 = self->_kernelComputeStage5;
    self->_kernelComputeStage5 = v35;

    if (!self->_kernelComputeStage5) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v37, @"kernelFindLabelRoi", 0, v38, v39);
    v40 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelFindLabelRoi = self->_kernelFindLabelRoi;
    self->_kernelFindLabelRoi = v40;

    if (!self->_kernelFindLabelRoi) {
      goto LABEL_14;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v42, @"kernelSuperPixel2Image", 0, v43, v44);
    v45 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelSuperPixel2Image = self->_kernelSuperPixel2Image;
    self->_kernelSuperPixel2Image = v45;

    if (!self->_kernelSuperPixel2Image
      || (objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v47, @"kernelComputeConfidence", 0, v48, v49), v50 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), kernelComputeConfidence = self->_kernelComputeConfidence, self->_kernelComputeConfidence = v50, kernelComputeConfidence, !self->_kernelComputeConfidence))
    {
LABEL_14:
      fig_log_get_emitter();
      goto LABEL_15;
    }
  }
LABEL_12:

  return self;
}

- (int)allocateResources:(unsigned int)a3
{
  if (!self->_metalContext) {
    goto LABEL_10;
  }
  solverMemoryPointer = self->_solverMemoryPointer;
  if (solverMemoryPointer)
  {
    self->_solverMemoryPointer = 0;
    free(solverMemoryPointer);
  }
  if (a3 - 0x4000 <= 0xFFFFC000) {
    goto LABEL_10;
  }
  self->_maxNumSuperPixels = a3;
  uint64_t v9 = objc_msgSend_device(self->_metalContext, a2, *(uint64_t *)&a3, v3, v4, v5);
  uint64_t v13 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v9, v10, 224 * a3 + 240, 0, v11, v12);
  workMem = self->_workMem;
  self->_workMem = v13;

  if (!self->_workMem) {
    goto LABEL_10;
  }
  v20 = objc_msgSend_device(self->_metalContext, v15, v16, v17, v18, v19);
  uint64_t v24 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v20, v21, 16 * a3, 0, v22, v23);
  superPixelsBoundaries = self->_superPixelsBoundaries;
  self->_superPixelsBoundaries = v24;

  if (!self->_superPixelsBoundaries) {
    goto LABEL_10;
  }
  uint64_t v26 = a3 + 1;
  uint64_t v27 = 21 * a3;
  uint64_t v28 = (char *)malloc_type_calloc(1uLL, 8 * (v27 + a3 + v26), 0xEAEE1B43uLL);
  if (v28)
  {
    int v29 = 0;
    *(_WORD *)&self->_matrixAtA.structure.attributes = *(_WORD *)&self->_matrixAtA.structure.attributes & 0xFFF0 | 0xE;
    self->_solverMemoryPointer = v28;
    self->_matrixAtA.structure.rowCount = a3;
    self->_matrixAtA.structure.columnCount = a3;
    v30 = (int *)&v28[8 * v26];
    self->_matrixAtA.structure.columnStarts = (int64_t *)v28;
    self->_matrixAtA.structure.rowIndices = v30;
    v31 = (float *)&v30[v27];
    self->_matrixAtA.structure.blockSize = 1;
    self->_matrixAtA.data = v31;
    v32 = &v31[v27];
    self->_vectorAtB.count = a3;
    self->_vectorAtB.data = v32;
    self->_vectorX.count = a3;
    self->_vectorX.data = &v32[a3];
  }
  else
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
    if (v29) {
      objc_msgSend_releaseResources(self, v34, v35, v36, v37, v38, 0);
    }
  }
  return v29;
}

- (void)releaseResources
{
  solverMemoryPointer = self->_solverMemoryPointer;
  if (solverMemoryPointer)
  {
    self->_solverMemoryPointer = 0;
    free(solverMemoryPointer);
  }
  workMem = self->_workMem;
  self->_workMem = 0;

  superPixelsBoundaries = self->_superPixelsBoundaries;
  self->_superPixelsBoundaries = 0;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)SuperPixelHoleFillMetal;
  [(SuperPixelHoleFillMetal *)&v7 dealloc];
}

- (int)convertFrom420fPixelBuffer:(id *)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 toSlicRgbaTexture:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v18 = v12;
  if (self->_metalContext
    && v10
    && v11
    && v12
    && (unint64_t v19 = objc_msgSend_width(v10, v13, v14, v15, v16, v17),
        unint64_t v25 = objc_msgSend_height(v10, v20, v21, v22, v23, v24),
        objc_msgSend_pixelFormat(v10, v26, v27, v28, v29, v30) == 10)
    && objc_msgSend_pixelFormat(v11, v31, v32, v33, v34, v35) == 30
    && objc_msgSend_pixelFormat(v18, v36, v37, v38, v39, v40) == 70
    && v19 == objc_msgSend_width(v18, v41, v42, v43, v44, v45)
    && v25 == objc_msgSend_height(v18, v46, v47, v48, v49, v50)
    && (objc_msgSend_commandQueue(self->_metalContext, v51, v52, v53, v54, v55),
        v56 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v56, v57, v58, v59, v60, v61),
        v62 = objc_claimAutoreleasedReturnValue(),
        v56,
        v62))
  {
    float var1 = a3->var0.var0.var1;
    float32x2_t v139 = vdiv_f32(*(float32x2_t *)&a3->var0.var0.var2, (float32x2_t)vdup_n_s32(0x437F0000u));
    unsigned int var0 = a3->var0.var0.var0;
    v68 = objc_msgSend_computeCommandEncoder(v62, v63, v64, v65, v66, v67);
    if (v68)
    {
      v73 = v68;
      objc_msgSend_setComputePipelineState_(v68, v69, (uint64_t)self->_kernelConvertToRbga, v70, v71, v72);
      objc_msgSend_setTexture_atIndex_(v73, v74, (uint64_t)v10, 0, v75, v76);
      objc_msgSend_setTexture_atIndex_(v73, v77, (uint64_t)v11, 1, v78, v79);
      objc_msgSend_setTexture_atIndex_(v73, v80, (uint64_t)v18, 2, v81, v82);
      objc_msgSend_setBytes_length_atIndex_(v73, v83, (uint64_t)&var1, 16, 0, v84);
      unint64_t v90 = objc_msgSend_threadExecutionWidth(self->_kernelConvertToRbga, v85, v86, v87, v88, v89);
      unint64_t v96 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelConvertToRbga, v91, v92, v93, v94, v95);
      v137[0] = v19 >> 1;
      v137[1] = v25 >> 1;
      v137[2] = 1;
      v136[0] = v90;
      v136[1] = v96 / v90;
      v136[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v73, v97, (uint64_t)v137, (uint64_t)v136, v98, v99);
      objc_msgSend_endEncoding(v73, v100, v101, v102, v103, v104);
      if (*MEMORY[0x263F00E10])
      {
        v110 = objc_msgSend_commandQueue(v62, v105, v106, v107, v108, v109);
        v116 = objc_msgSend_commandBuffer(v110, v111, v112, v113, v114, v115);

        objc_msgSend_setLabel_(v116, v117, @"KTRACE_MTLCMDBUF", v118, v119, v120);
        objc_msgSend_addCompletedHandler_(v116, v121, (uint64_t)&unk_270E22190, v122, v123, v124);
        objc_msgSend_commit(v116, v125, v126, v127, v128, v129);
        objc_msgSend_addCompletedHandler_(v62, v130, (uint64_t)&unk_270E221B0, v131, v132, v133);
      }
      objc_msgSend_commit(v62, v105, v106, v107, v108, v109);

      int v134 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v134 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();
  }

  return v134;
}

- (int)computeStage0:(id *)a3 inImageTexture:(id)a4 inLabelTexture:(id)a5 inPersonMaskTexture:(id)a6 inInstanceSegmentationLayer0Texture:(id)a7 inInstanceSegmentationLayer1Texture:(id)a8 inInstanceSegmentationLayer2Texture:(id)a9 inInstanceSegmentationLayer3Texture:(id)a10
{
  id v374 = a4;
  id v16 = a5;
  id v17 = a6;
  id v373 = a7;
  id v18 = a8;
  id v19 = a9;
  id v376 = a10;
  if (!self->_metalContext)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    unint64_t v25 = v373;
    uint64_t v26 = v374;
    goto LABEL_47;
  }
  unint64_t v25 = v373;
  if (!self->_solverMemoryPointer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    uint64_t v26 = v374;
    goto LABEL_47;
  }
  uint64_t v26 = v374;
  if (!v374
    || !v16
    || !v17
    || !v373
    || !v18
    || !v19
    || !v376
    || objc_msgSend_pixelFormat(v16, v20, v21, v22, v23, v24) != 23)
  {
    goto LABEL_53;
  }
  v375 = v18;
  int v32 = objc_msgSend_width(v16, v27, v28, v29, v30, v31);
  int v38 = objc_msgSend_height(v16, v33, v34, v35, v36, v37);
  if (objc_msgSend_pixelFormat(v374, v39, v40, v41, v42, v43) != 70)
  {
LABEL_54:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
LABEL_62:
    id v18 = v375;
    goto LABEL_47;
  }
  uint64_t v49 = v19;
  int v50 = objc_msgSend_width(v374, v44, v45, v46, v47, v48);
  int v56 = objc_msgSend_height(v374, v51, v52, v53, v54, v55);
  if (v32 != v50 || v38 != v56)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    goto LABEL_46;
  }
  id v18 = v375;
  id v19 = v49;
  if (objc_msgSend_pixelFormat(v17, v57, v58, v59, v60, v61) != 25
    || !objc_msgSend_width(v17, v62, v63, v64, v65, v66)
    || !objc_msgSend_height(v17, v67, v68, v69, v70, v71)
    || !objc_msgSend_width(v373, v72, v73, v74, v75, v76)
    || !objc_msgSend_width(v375, v77, v78, v79, v80, v81)
    || !objc_msgSend_width(v49, v82, v83, v84, v85, v86)
    || !objc_msgSend_width(v376, v87, v88, v89, v90, v91)
    || !objc_msgSend_height(v373, v92, v93, v94, v95, v96)
    || !objc_msgSend_height(v375, v97, v98, v99, v100, v101)
    || !objc_msgSend_height(v49, v102, v103, v104, v105, v106)
    || !objc_msgSend_height(v376, v107, v108, v109, v110, v111))
  {
LABEL_53:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();
    goto LABEL_47;
  }
  int v117 = objc_msgSend_width(v373, v112, v113, v114, v115, v116);
  int v123 = objc_msgSend_height(v373, v118, v119, v120, v121, v122);
  uint64_t v129 = objc_msgSend_width(v375, v124, v125, v126, v127, v128);
  BOOL v135 = v129 == v117;
  id v19 = v49;
  if (!v135) {
    goto LABEL_54;
  }
  uint64_t v136 = v129;
  if (objc_msgSend_width(v49, v130, v131, v132, v133, v134) != v129) {
    goto LABEL_54;
  }
  if (objc_msgSend_width(v376, v137, v138, v139, v140, v141) != v136) {
    goto LABEL_54;
  }
  uint64_t v147 = objc_msgSend_height(v375, v142, v143, v144, v145, v146);
  if (v147 != v123) {
    goto LABEL_54;
  }
  uint64_t v153 = v147;
  if (objc_msgSend_height(v49, v148, v149, v150, v151, v152) != v147) {
    goto LABEL_54;
  }
  if (objc_msgSend_height(v376, v154, v155, v156, v157, v158) != v153) {
    goto LABEL_54;
  }
  v164 = objc_msgSend_commandQueue(self->_metalContext, v159, v160, v161, v162, v163);
  v170 = objc_msgSend_commandBuffer(v164, v165, v166, v167, v168, v169);

  if (!v170) {
    goto LABEL_54;
  }
  uint64_t v176 = objc_msgSend_computeCommandEncoder(v170, v171, v172, v173, v174, v175);
  if (!v176)
  {
    fig_log_get_emitter();
LABEL_61:
    FigDebugAssert3();
    int v371 = FigSignalErrorAt();

    goto LABEL_62;
  }
  v182 = (void *)v176;
  id v183 = v17;
  uint64_t v184 = objc_msgSend_contents(self->_superPixelsBoundaries, v177, v178, v179, v180, v181);
  if (self->_maxNumSuperPixels)
  {
    uint64_t v189 = 0;
    do
      *(_OWORD *)(v184 + 16 * v189++) = xmmword_262EB9890;
    while (v189 < self->_maxNumSuperPixels);
  }
  objc_msgSend_setComputePipelineState_(v182, v185, (uint64_t)self->_kernelFindLabelRoi, v186, v187, v188);
  objc_msgSend_setTexture_atIndex_(v182, v190, (uint64_t)v16, 0, v191, v192);
  objc_msgSend_setBuffer_offset_atIndex_(v182, v193, (uint64_t)self->_superPixelsBoundaries, 0, 0, v194);
  unint64_t v200 = objc_msgSend_threadExecutionWidth(self->_kernelFindLabelRoi, v195, v196, v197, v198, v199);
  unint64_t v206 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelFindLabelRoi, v201, v202, v203, v204, v205) / v200;
  v396[0] = (unint64_t)objc_msgSend_width(v16, v207, v208, v209, v210, v211) >> 1;
  v396[1] = (unint64_t)objc_msgSend_height(v16, v212, v213, v214, v215, v216) >> 1;
  v396[2] = 1;
  v395[0] = v200;
  v395[1] = v206;
  v395[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v182, v217, (uint64_t)v396, (uint64_t)v395, v218, v219);
  objc_msgSend_endEncoding(v182, v220, v221, v222, v223, v224);
  unsigned int maxNumSuperPixels = self->_maxNumSuperPixels;
  if (!HIWORD(maxNumSuperPixels))
  {
    unsigned int v394 = 0;
    v390[0] = maxNumSuperPixels;
    *(float *)&v390[1] = a3->var0.var1.var0 * a3->var0.var1.var0;
    uint64_t v391 = *(void *)&a3->var0.var1.var1;
    float var6 = a3->var0.var1.var6;
    long long v392 = *(_OWORD *)a3->var0.var1.var5;
    v231 = objc_msgSend_computeCommandEncoder(v170, v225, v226, v227, v228, v229);

    id v17 = v183;
    unint64_t v25 = v373;
    if (v231)
    {
      objc_msgSend_setComputePipelineState_(v231, v232, (uint64_t)self->_kernelComputeStage0, v233, v234, v235);
      objc_msgSend_setTexture_atIndex_(v231, v236, (uint64_t)v16, 0, v237, v238);
      uint64_t v26 = v374;
      objc_msgSend_setTexture_atIndex_(v231, v239, (uint64_t)v374, 1, v240, v241);
      objc_msgSend_setBytes_length_atIndex_(v231, v242, (uint64_t)v390, 40, 0, v243);
      objc_msgSend_setBuffer_offset_atIndex_(v231, v244, (uint64_t)self->_workMem, 0, 1, v245);
      objc_msgSend_setBuffer_offset_atIndex_(v231, v246, (uint64_t)self->_superPixelsBoundaries, 0, 2, v247);
      int64x2_t v388 = vdupq_n_s64(1uLL);
      uint64_t v389 = 1;
      int64x2_t v386 = v388;
      uint64_t v387 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v231, v248, (uint64_t)&v388, (uint64_t)&v386, v249, v250);
      objc_msgSend_endEncoding(v231, v251, v252, v253, v254, v255);
      v261 = objc_msgSend_computeCommandEncoder(v170, v256, v257, v258, v259, v260);

      if (v261)
      {
        objc_msgSend_setComputePipelineState_(v261, v262, (uint64_t)self->_kernelComputeStage1, v263, v264, v265);
        objc_msgSend_setTexture_atIndex_(v261, v266, (uint64_t)v16, 0, v267, v268);
        objc_msgSend_setTexture_atIndex_(v261, v269, (uint64_t)v374, 1, v270, v271);
        objc_msgSend_setTexture_atIndex_(v261, v272, (uint64_t)v17, 2, v273, v274);
        objc_msgSend_setTexture_atIndex_(v261, v275, (uint64_t)v373, 3, v276, v277);
        objc_msgSend_setTexture_atIndex_(v261, v278, (uint64_t)v375, 4, v279, v280);
        objc_msgSend_setTexture_atIndex_(v261, v281, (uint64_t)v49, 5, v282, v283);
        objc_msgSend_setTexture_atIndex_(v261, v284, (uint64_t)v376, 6, v285, v286);
        objc_msgSend_setBytes_length_atIndex_(v261, v287, (uint64_t)v390, 40, 0, v288);
        objc_msgSend_setBuffer_offset_atIndex_(v261, v289, (uint64_t)self->_workMem, 0, 1, v290);
        objc_msgSend_setBuffer_offset_atIndex_(v261, v291, (uint64_t)self->_superPixelsBoundaries, 0, 2, v292);
        unsigned int v295 = -8;
        do
        {
          v295 += 8;
          unsigned int v394 = v295;
          objc_msgSend_setBytes_length_atIndex_(v261, v293, (uint64_t)v390, 40, 0, v294);
          uint64_t v384 = self->_maxNumSuperPixels;
          int64x2_t v377 = vdupq_n_s64(1uLL);
          int64x2_t v385 = v377;
          unint64_t v382 = (unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelComputeStage1, v296, v297, v298, v299, v300) >> 2;
          int64x2_t v383 = v377;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v261, v301, (uint64_t)&v384, (uint64_t)&v382, v302, v303);
        }
        while (v295 < 0x38);
        objc_msgSend_endEncoding(v261, v293, v304, v305, v306, v294);
        v312 = objc_msgSend_computeCommandEncoder(v170, v307, v308, v309, v310, v311);

        if (v312)
        {
          objc_msgSend_setComputePipelineState_(v312, v313, (uint64_t)self->_kernelComputeStage2, v314, v315, v316);
          objc_msgSend_setTexture_atIndex_(v312, v317, (uint64_t)v16, 0, v318, v319);
          objc_msgSend_setTexture_atIndex_(v312, v320, (uint64_t)v374, 1, v321, v322);
          objc_msgSend_setBytes_length_atIndex_(v312, v323, (uint64_t)v390, 40, 0, v324);
          objc_msgSend_setBuffer_offset_atIndex_(v312, v325, (uint64_t)self->_workMem, 0, 1, v326);
          objc_msgSend_setBuffer_offset_atIndex_(v312, v327, (uint64_t)self->_superPixelsBoundaries, 0, 2, v328);
          uint64_t v380 = self->_maxNumSuperPixels;
          int64x2_t v381 = vdupq_n_s64(1uLL);
          uint64_t v378 = objc_msgSend_threadExecutionWidth(self->_kernelComputeStage2, v329, v330, v331, v332, v333);
          int64x2_t v379 = v381;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v312, v334, (uint64_t)&v380, (uint64_t)&v378, v335, v336);
          objc_msgSend_endEncoding(v312, v337, v338, v339, v340, v341);
          if (*MEMORY[0x263F00E10])
          {
            v347 = objc_msgSend_commandQueue(v170, v342, v343, v344, v345, v346);
            v353 = objc_msgSend_commandBuffer(v347, v348, v349, v350, v351, v352);

            objc_msgSend_setLabel_(v353, v354, @"KTRACE_MTLCMDBUF", v355, v356, v357);
            objc_msgSend_addCompletedHandler_(v353, v358, (uint64_t)&unk_270E221D0, v359, v360, v361);
            objc_msgSend_commit(v353, v362, v363, v364, v365, v366);
            objc_msgSend_addCompletedHandler_(v170, v367, (uint64_t)&unk_270E221F0, v368, v369, v370);
          }
          objc_msgSend_commit(v170, v342, v343, v344, v345, v346);

          int v371 = 0;
          goto LABEL_46;
        }
      }
    }
    else
    {
      uint64_t v26 = v374;
    }
    id v19 = v49;
    fig_log_get_emitter();
    goto LABEL_61;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  int v371 = FigSignalErrorAt();

  id v17 = v183;
  unint64_t v25 = v373;
  uint64_t v26 = v374;
LABEL_46:
  id v18 = v375;
  id v19 = v49;
LABEL_47:

  return v371;
}

- (int)computeStage4:(id *)a3 inLabelTexture:(id)a4 inDepthTex:(id)a5 inConfTex:(id)a6 inDistanceTransformMapTex:(id)a7 maxDist:(float)a8 sigma_den:(float)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v24 = a7;
  if (!self->_metalContext) {
    goto LABEL_26;
  }
  if (!self->_solverMemoryPointer) {
    goto LABEL_26;
  }
  if (!v16) {
    goto LABEL_26;
  }
  if (objc_msgSend_pixelFormat(v16, v19, v20, v21, v22, v23) != 23) {
    goto LABEL_26;
  }
  int v30 = objc_msgSend_width(v16, v25, v26, v27, v28, v29);
  int v36 = objc_msgSend_height(v16, v31, v32, v33, v34, v35);
  if (!v17) {
    goto LABEL_26;
  }
  int v42 = v36;
  if (objc_msgSend_pixelFormat(v17, v37, v38, v39, v40, v41) != 25) {
    goto LABEL_26;
  }
  int v48 = objc_msgSend_width(v17, v43, v44, v45, v46, v47);
  int v54 = objc_msgSend_height(v17, v49, v50, v51, v52, v53);
  if (v30 != v48) {
    goto LABEL_26;
  }
  if (v42 != v54) {
    goto LABEL_26;
  }
  if (!v18) {
    goto LABEL_26;
  }
  if (objc_msgSend_pixelFormat(v18, v55, v56, v57, v58, v59) != 25) {
    goto LABEL_26;
  }
  int v65 = objc_msgSend_width(v18, v60, v61, v62, v63, v64);
  int v71 = objc_msgSend_height(v18, v66, v67, v68, v69, v70);
  if (v30 != v65) {
    goto LABEL_26;
  }
  if (v42 == v71
    && v24
    && objc_msgSend_pixelFormat(v24, v72, v73, v74, v75, v76) == 25
    && (int v82 = objc_msgSend_width(v24, v77, v78, v79, v80, v81),
        int v88 = objc_msgSend_height(v24, v83, v84, v85, v86, v87),
        v30 == v82)
    && v42 == v88
    && (objc_msgSend_commandQueue(self->_metalContext, v89, v90, v91, v92, v93),
        uint64_t v94 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v94, v95, v96, v97, v98, v99),
        uint64_t v100 = objc_claimAutoreleasedReturnValue(),
        v94,
        v100))
  {
    unsigned int v202 = 0;
    float var6 = a3->var0.var6;
    v197[0] = LODWORD(a3->var0.var4);
    *(float *)&v197[1] = var6;
    *(float *)&v197[2] = a3->var0.var1.var0 * a3->var0.var1.var0;
    uint64_t v198 = *(void *)&a3->var0.var2;
    float v199 = a8;
    float v200 = a9;
    float var2 = a3->var0.var1.var2;
    uint64_t v107 = objc_msgSend_computeCommandEncoder(v100, v101, v102, v103, v104, v105);
    if (v107)
    {
      uint64_t v112 = v107;
      objc_msgSend_setComputePipelineState_(v107, v108, (uint64_t)self->_kernelComputeStage4, v109, v110, v111);
      objc_msgSend_setTexture_atIndex_(v112, v113, (uint64_t)v16, 0, v114, v115);
      objc_msgSend_setTexture_atIndex_(v112, v116, (uint64_t)v17, 1, v117, v118);
      objc_msgSend_setTexture_atIndex_(v112, v119, (uint64_t)v18, 2, v120, v121);
      objc_msgSend_setTexture_atIndex_(v112, v122, (uint64_t)v24, 3, v123, v124);
      objc_msgSend_setBytes_length_atIndex_(v112, v125, (uint64_t)v197, 36, 0, v126);
      objc_msgSend_setBuffer_offset_atIndex_(v112, v127, (uint64_t)self->_workMem, 0, 1, v128);
      objc_msgSend_setBuffer_offset_atIndex_(v112, v129, (uint64_t)self->_superPixelsBoundaries, 0, 2, v130);
      uint64_t maxNumSuperPixels = self->_maxNumSuperPixels;
      int64x2_t v196 = vdupq_n_s64(1uLL);
      uint64_t v193 = objc_msgSend_threadExecutionWidth(self->_kernelComputeStage4, v131, v132, v133, v134, v135);
      int64x2_t v194 = v196;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v112, v136, (uint64_t)&maxNumSuperPixels, (uint64_t)&v193, v137, v138);
      objc_msgSend_setComputePipelineState_(v112, v139, (uint64_t)self->_kernelComputeStage5, v140, v141, v142);
      if (self->_maxNumSuperPixels)
      {
        unsigned int v148 = 0;
        int64x2_t v188 = vdupq_n_s64(1uLL);
        do
        {
          unsigned int v202 = v148;
          objc_msgSend_setBytes_length_atIndex_(v112, v143, (uint64_t)v197, 36, 0, v147);
          uint64_t v191 = self->_maxNumSuperPixels;
          int64x2_t v192 = v188;
          uint64_t v189 = objc_msgSend_threadExecutionWidth(self->_kernelComputeStage5, v149, v150, v151, v152, v153);
          int64x2_t v190 = v188;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v112, v154, (uint64_t)&v191, (uint64_t)&v189, v155, v156);
          v148 += 512;
        }
        while (v148 < self->_maxNumSuperPixels);
      }
      objc_msgSend_endEncoding(v112, v143, v144, v145, v146, v147);
      if (*MEMORY[0x263F00E10])
      {
        uint64_t v162 = objc_msgSend_commandQueue(v100, v157, v158, v159, v160, v161);
        uint64_t v168 = objc_msgSend_commandBuffer(v162, v163, v164, v165, v166, v167);

        objc_msgSend_setLabel_(v168, v169, @"KTRACE_MTLCMDBUF", v170, v171, v172);
        objc_msgSend_addCompletedHandler_(v168, v173, (uint64_t)&unk_270E22210, v174, v175, v176);
        objc_msgSend_commit(v168, v177, v178, v179, v180, v181);
        objc_msgSend_addCompletedHandler_(v100, v182, (uint64_t)&unk_270E22230, v183, v184, v185);
      }
      objc_msgSend_commit(v100, v157, v158, v159, v160, v161);

      int v186 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v186 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_26:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v186 = FigSignalErrorAt();
  }

  return v186;
}

- (int)computeStageSolver:(id *)a3 inLabelTexture:(id)a4 inConfTex:(id)a5 inImageTex:(id)a6 outDepthTex:(id)a7 outConfTex:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v254 = v18;
  if (!self->_metalContext) {
    goto LABEL_34;
  }
  if (!self->_solverMemoryPointer) {
    goto LABEL_34;
  }
  if (!v14) {
    goto LABEL_34;
  }
  id v24 = v18;
  if (objc_msgSend_pixelFormat(v14, v19, v20, v21, v22, v23) != 23) {
    goto LABEL_34;
  }
  int v30 = objc_msgSend_width(v14, v25, v26, v27, v28, v29);
  int v36 = objc_msgSend_height(v14, v31, v32, v33, v34, v35);
  if (!v15) {
    goto LABEL_34;
  }
  int v42 = v36;
  if (objc_msgSend_pixelFormat(v15, v37, v38, v39, v40, v41) != 25) {
    goto LABEL_34;
  }
  int v48 = objc_msgSend_width(v15, v43, v44, v45, v46, v47);
  int v54 = objc_msgSend_height(v15, v49, v50, v51, v52, v53);
  if (v30 != v48) {
    goto LABEL_34;
  }
  if (v42 != v54) {
    goto LABEL_34;
  }
  if (!v16) {
    goto LABEL_34;
  }
  if (objc_msgSend_pixelFormat(v16, v55, v56, v57, v58, v59) != 70) {
    goto LABEL_34;
  }
  int v65 = objc_msgSend_width(v16, v60, v61, v62, v63, v64);
  int v71 = objc_msgSend_height(v16, v66, v67, v68, v69, v70);
  if (v30 != v65) {
    goto LABEL_34;
  }
  if (v42 != v71) {
    goto LABEL_34;
  }
  if (!v17) {
    goto LABEL_34;
  }
  if (objc_msgSend_pixelFormat(v17, v72, v73, v74, v75, v76) != 25) {
    goto LABEL_34;
  }
  int v82 = objc_msgSend_width(v17, v77, v78, v79, v80, v81);
  int v88 = objc_msgSend_height(v17, v83, v84, v85, v86, v87);
  if (v30 != v82) {
    goto LABEL_34;
  }
  if (v42 != v88) {
    goto LABEL_34;
  }
  if (!v24) {
    goto LABEL_34;
  }
  if (objc_msgSend_pixelFormat(v24, v89, v90, v91, v92, v93) != 25) {
    goto LABEL_34;
  }
  int v99 = objc_msgSend_width(v24, v94, v95, v96, v97, v98);
  int v105 = objc_msgSend_height(v24, v100, v101, v102, v103, v104);
  if (v30 != v99 || v42 != v105) {
    goto LABEL_34;
  }
  uint64_t v112 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  *(float *)&double v111 = a3->var0.var5;
  if (objc_msgSend_RunSolver_(self, v106, v107, v108, v109, v110, v111)) {
    goto LABEL_34;
  }
  if (*v112 == 1) {
    kdebug_trace();
  }
  uint64_t v118 = objc_msgSend_commandQueue(self->_metalContext, v113, v114, v115, v116, v117);
  uint64_t v124 = objc_msgSend_commandBuffer(v118, v119, v120, v121, v122, v123);

  if (v124)
  {
    uint64_t v130 = objc_msgSend_computeCommandEncoder(v124, v125, v126, v127, v128, v129);
    if (v130)
    {
      uint64_t v135 = v130;
      objc_msgSend_setComputePipelineState_(v130, v131, (uint64_t)self->_kernelSuperPixel2Image, v132, v133, v134);
      objc_msgSend_setTexture_atIndex_(v135, v136, (uint64_t)v14, 0, v137, v138);
      id v253 = v17;
      objc_msgSend_setTexture_atIndex_(v135, v139, (uint64_t)v17, 1, v140, v141);
      objc_msgSend_setBuffer_offset_atIndex_(v135, v142, (uint64_t)self->_workMem, 0, 0, v143);
      unint64_t v149 = objc_msgSend_threadExecutionWidth(self->_kernelSuperPixel2Image, v144, v145, v146, v147, v148);
      unint64_t v155 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelSuperPixel2Image, v150, v151, v152, v153, v154)
           / v149;
      v263[0] = (unint64_t)objc_msgSend_width(v14, v156, v157, v158, v159, v160) >> 1;
      v263[1] = (unint64_t)objc_msgSend_height(v14, v161, v162, v163, v164, v165) >> 1;
      v263[2] = 1;
      v262[0] = v149;
      v262[1] = v155;
      v262[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v135, v166, (uint64_t)v263, (uint64_t)v262, v167, v168);
      objc_msgSend_endEncoding(v135, v169, v170, v171, v172, v173);
      unsigned int maxNumSuperPixels = self->_maxNumSuperPixels;
      float32x2_t v259 = vmul_f32(*(float32x2_t *)&a3->var1.var0, vadd_f32(*(float32x2_t *)&a3->var1.var0, *(float32x2_t *)&a3->var1.var0));
      float v260 = a3->var1.var2 * (float)(a3->var1.var2 + a3->var1.var2);
      int32x2_t v261 = vrev64_s32(*(int32x2_t *)&a3->var1.var3);
      unint64_t v179 = objc_msgSend_threadExecutionWidth(self->_kernelComputeConfidence, v174, v175, v176, v177, v178);
      unint64_t v185 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelComputeConfidence, v180, v181, v182, v183, v184);
      uint64_t v191 = objc_msgSend_computeCommandEncoder(v124, v186, v187, v188, v189, v190);

      if (v191)
      {
        objc_msgSend_setComputePipelineState_(v191, v192, (uint64_t)self->_kernelComputeConfidence, v193, v194, v195);
        objc_msgSend_setTexture_atIndex_(v191, v196, (uint64_t)v14, 0, v197, v198);
        objc_msgSend_setTexture_atIndex_(v191, v199, (uint64_t)v16, 1, v200, v201);
        objc_msgSend_setTexture_atIndex_(v191, v202, (uint64_t)v15, 2, v203, v204);
        objc_msgSend_setTexture_atIndex_(v191, v205, (uint64_t)v254, 3, v206, v207);
        objc_msgSend_setBytes_length_atIndex_(v191, v208, (uint64_t)&maxNumSuperPixels, 24, 0, v209);
        objc_msgSend_setBuffer_offset_atIndex_(v191, v210, (uint64_t)self->_workMem, 0, 1, v211);
        objc_msgSend_setBuffer_offset_atIndex_(v191, v212, (uint64_t)self->_superPixelsBoundaries, 0, 2, v213);
        int64x2_t v256 = vdupq_n_s64(1uLL);
        uint64_t v257 = 1;
        v255[0] = v179;
        v255[1] = v185 / v179;
        v255[2] = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v191, v214, (uint64_t)&v256, (uint64_t)v255, v215, v216);
        objc_msgSend_endEncoding(v191, v217, v218, v219, v220, v221);
        if (*MEMORY[0x263F00E10])
        {
          uint64_t v227 = objc_msgSend_commandQueue(v124, v222, v223, v224, v225, v226);
          uint64_t v233 = objc_msgSend_commandBuffer(v227, v228, v229, v230, v231, v232);

          objc_msgSend_setLabel_(v233, v234, @"KTRACE_MTLCMDBUF", v235, v236, v237);
          objc_msgSend_addCompletedHandler_(v233, v238, (uint64_t)&unk_270E22250, v239, v240, v241);
          objc_msgSend_commit(v233, v242, v243, v244, v245, v246);
          objc_msgSend_addCompletedHandler_(v124, v247, (uint64_t)&unk_270E22270, v248, v249, v250);
        }
        objc_msgSend_commit(v124, v222, v223, v224, v225, v226);

        int v251 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v251 = FigSignalErrorAt();
      }
      id v17 = v253;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v251 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_34:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v251 = FigSignalErrorAt();
  }

  return v251;
}

- (int)RunSolver:(float)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  columnStarts = self->_matrixAtA.structure.columnStarts;
  rowIndices = self->_matrixAtA.structure.rowIndices;
  data = self->_matrixAtA.data;
  id v12 = self->_vectorAtB.data;
  uint64_t v13 = (unsigned int *)objc_msgSend_contents(self->_workMem, a2, v3, v4, v5, v6);
  id v14 = v13;
  id v15 = v13 + 4;
  uint64_t v16 = *v13;
  self->_matrixAtA.structure.rowCount = v16;
  self->_matrixAtA.structure.columnCount = v16;
  self->_vectorAtB.SparseControl_t count = v16;
  self->_vectorX.SparseControl_t count = v16;
  if (v16)
  {
    unint64_t v17 = 0;
    int64_t v18 = 0;
    id v19 = v13;
    do
    {
      float v20 = *((float *)v15 + 11);
      float v21 = (float)(*((float *)v15 + 9) * *((float *)v15 + 9)) / (float)((float)(v20 * 7.0) + 1.0);
      uint64_t v22 = *((unsigned __int16 *)v15 + 67);
      v12[v17] = *((float *)v15 + 10) * v21;
      columnStarts[v17] = v18;
      if (v22)
      {
        uint64_t v23 = 0;
        float v24 = v20 * 0.01;
        uint64_t v25 = 1;
        do
        {
          unint64_t v26 = *((unsigned __int16 *)v19 + v23 + 76);
          float v27 = (float)(*(float *)&v19[v23 + 17] * a3) * (float)(*(float *)&v19[v23 + 17] * a3);
          float v28 = fmaxf(v24, v27 + v27);
          if (v17 < v26)
          {
            data[v25 + v18] = -v28;
            rowIndices[v25 + v18] = v26;
            ++v25;
          }
          float v21 = v21 + v28;
          ++v23;
        }
        while (v22 != v23);
      }
      else
      {
        uint64_t v25 = 1;
      }
      data[v18] = v21;
      rowIndices[v18] = v17;
      v18 += v25;
      ++v17;
      v15 += 56;
      v19 += 56;
    }
    while (v17 != v16);
    uint64_t v29 = v16;
  }
  else
  {
    uint64_t v29 = 0;
    int64_t v18 = 0;
  }
  columnStarts[v29] = v18;
  uint64_t v61 = 0;
  memset(&v60, 0, sizeof(v60));
  long long v30 = *(_OWORD *)&self->_matrixAtA.structure.rowIndices;
  *(_OWORD *)&Matrix.status = *(_OWORD *)&self->_matrixAtA.structure.rowCount;
  *(_OWORD *)&Matrix.symbolicFactorization.columnCount = v30;
  Matrix.symbolicFactorization.workspaceSize_Float = (size_t)self->_matrixAtA.data;
  *(_OWORD *)&sfoptions.status = xmmword_270E22290;
  *(_OWORD *)&sfoptions.symbolicFactorization.columnCount = unk_270E222A0;
  *(_OWORD *)&sfoptions.symbolicFactorization.workspaceSize_Float = xmmword_270E222B0;
  SparseNumericFactorOptions nfoptions = *(SparseNumericFactorOptions *)ymmword_262EB98A8;
  if (Matrix.status <= SparseStatusOK)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_262EB4B50();
    }
    goto LABEL_40;
  }
  if (*(int *)&Matrix.attributes <= 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_262EB4AD4();
    }
    goto LABEL_40;
  }
  if (!BYTE4(Matrix.symbolicFactorization.factorization))
  {
    BOOL v32 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v32) {
      sub_262EB46DC(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_40;
  }
  int v31 = (uint64_t)Matrix.symbolicFactorization.factorization & 0xC;
  if (Matrix.status != *(_DWORD *)&Matrix.attributes && v31 == 12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_262EB4A24(Matrix.status, *(int *)&Matrix.attributes);
    }
LABEL_40:
    _SparseTrap();
    uint64_t v61 = 0;
    memset(&v60, 0, sizeof(v60));
    v60.status = SparseParameterError;
    v60.symbolicFactorization.status = SparseParameterError;
    goto LABEL_41;
  }
  if (v31 != 12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_262EB49DC();
    }
    goto LABEL_40;
  }
  _SparseFactorSymmetric_Float(&v60, SparseFactorizationCholesky, (const SparseMatrix_Float *)&Matrix, (const SparseSymbolicFactorOptions *)&sfoptions, &nfoptions);
  if (v60.status)
  {
LABEL_41:
    int v43 = -12782;
    goto LABEL_42;
  }
  SparseOpaqueFactorization_Float Matrix = v60;
  uint64_t v58 = v61;
  if (v60.symbolicFactorization.status || !Matrix.symbolicFactorization.workspaceSize_Float)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_262EB4764();
    }
    goto LABEL_31;
  }
  SparseControl_t count = self->_vectorAtB.count;
  uint64_t v46 = self->_vectorAtB.data;
  int v47 = self->_vectorX.count;
  int v48 = self->_vectorX.data;
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)&sfoptions, &Matrix.symbolicFactorization);
  workspaceSize_Double = (void (*)(SparseOpaqueFactorization_Float *))sfoptions.symbolicFactorization.workspaceSize_Double;
  if (Matrix.symbolicFactorization.status
    || !Matrix.symbolicFactorization.workspaceSize_Float
    || Matrix.status
    || !Matrix.solveWorkspaceRequiredStatic)
  {
    if (!sfoptions.symbolicFactorization.workspaceSize_Double)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_262EB47AC();
      }
      goto LABEL_31;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    memset(&sfoptions, 0, sizeof(sfoptions));
    snprintf((char *)&sfoptions, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
  }
  else
  {
    if ((*(unsigned char *)&Matrix.attributes ^ *(unsigned char *)&Matrix.symbolicFactorization.attributes)) {
      int v50 = Matrix.symbolicFactorization.columnCount * LOBYTE(Matrix.symbolicFactorization.factorization);
    }
    else {
      int v50 = Matrix.symbolicFactorization.rowCount * LOBYTE(Matrix.symbolicFactorization.factorization);
    }
    if ((*(unsigned char *)&Matrix.attributes ^ *(unsigned char *)&Matrix.symbolicFactorization.attributes)) {
      int v51 = Matrix.symbolicFactorization.rowCount * LOBYTE(Matrix.symbolicFactorization.factorization);
    }
    else {
      int v51 = Matrix.symbolicFactorization.columnCount * LOBYTE(Matrix.symbolicFactorization.factorization);
    }
    if (BYTE1(Matrix.symbolicFactorization.factorization) == 40) {
      int v52 = v50;
    }
    else {
      int v52 = v51;
    }
    if (v51 == v47)
    {
      if (v52 == count)
      {
        workspaceSize_Float = (void (*)(void *))sfoptions.symbolicFactorization.workspaceSize_Float;
        nfoptions.control = count;
        *(_DWORD *)&nfoptions.scalingMethod = 1;
        nfoptions.scaling = (void *)count;
        *(void *)&nfoptions.pivotTolerance = v46;
        Soln.rowCount = v47;
        Soln.columnCount = 1;
        Soln.columnStride = v47;
        *(_DWORD *)&Soln.attributes = 0;
        uint64_t v54 = v58 + Matrix.solveWorkspaceRequiredPerRHS;
        Soln.data = v48;
        uint64_t v55 = (void *)((uint64_t (*)(size_t))sfoptions.symbolicFactorization.factorization)(v58 + Matrix.solveWorkspaceRequiredPerRHS);
        if (v55)
        {
          uint64_t v56 = v55;
          _SparseSolveOpaque_Float(&Matrix, (const DenseMatrix_Float *)&nfoptions, &Soln, v55);
          workspaceSize_Float(v56);
          goto LABEL_32;
        }
        if (workspaceSize_Double)
        {
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          memset(&sfoptions, 0, sizeof(sfoptions));
          snprintf((char *)&sfoptions, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
          goto LABEL_70;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_262EB4834(v54);
        }
LABEL_31:
        _SparseTrap();
        goto LABEL_32;
      }
      if (!sfoptions.symbolicFactorization.workspaceSize_Double)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_262EB48B4();
        }
        goto LABEL_31;
      }
    }
    else if (!sfoptions.symbolicFactorization.workspaceSize_Double)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_262EB4948();
      }
      goto LABEL_31;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    memset(&sfoptions, 0, sizeof(sfoptions));
    snprintf((char *)&sfoptions, 0x100uLL, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n");
  }
LABEL_70:
  workspaceSize_Double(&sfoptions);
LABEL_32:
  if (v16)
  {
    uint64_t v40 = self->_vectorX.data;
    uint64_t v41 = (float *)(v14 + 16);
    do
    {
      float v42 = *v40;
      int v43 = -12782;
      if (*v40 < 0.0) {
        break;
      }
      if (v42 > 100000000.0) {
        break;
      }
      int v43 = 0;
      float *v41 = v42;
      v41 += 56;
      ++v40;
      --v29;
    }
    while (v29);
  }
  else
  {
    int v43 = 0;
  }
LABEL_42:
  SparseOpaqueFactorization_Float sfoptions = v60;
  *(void *)&long long v64 = v61;
  _SparseDestroyOpaqueNumeric_Float(&sfoptions);
  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superPixelsBoundaries, 0);
  objc_storeStrong((id *)&self->_workMem, 0);
  objc_storeStrong((id *)&self->_kernelComputeConfidence, 0);
  objc_storeStrong((id *)&self->_kernelSuperPixel2Image, 0);
  objc_storeStrong((id *)&self->_kernelFindLabelRoi, 0);
  objc_storeStrong((id *)&self->_kernelComputeStage5, 0);
  objc_storeStrong((id *)&self->_kernelComputeStage4, 0);
  objc_storeStrong((id *)&self->_kernelComputeStage2, 0);
  objc_storeStrong((id *)&self->_kernelComputeStage1, 0);
  objc_storeStrong((id *)&self->_kernelComputeStage0, 0);
  objc_storeStrong((id *)&self->_kernelConvertToRbga, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end