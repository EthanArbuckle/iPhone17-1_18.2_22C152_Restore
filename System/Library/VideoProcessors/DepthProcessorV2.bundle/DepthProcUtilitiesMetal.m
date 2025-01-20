@interface DepthProcUtilitiesMetal
- (DepthProcUtilitiesMetal)initWithMetalContext:(id)a3;
- (id)prepareForFbs:(id)a3 toF32:(id)a4 confidenceInF16:(id)a5 confidenceOutF32:(id)a6;
- (int)allocateResources;
- (int)buildFindMask:(id)a3 value:(float)a4 outputBuffer:(id)a5;
- (int)disparityDataOverrideOnGpu:(id)a3 To:(id)a4;
- (int)makeForegroundMask:(id)a3 personSegmentationMap:(id)a4 validForegroundMask:(id)a5 minSegmentationThreshold:(float)a6;
- (int)postErosion:(id)a3 outputConfidence:(id)a4 outputDisparity:(id)a5;
- (int)postFbs:(id)a3 toF16:(id)a4 prepareBuffer:(id)a5;
- (int)preprocessData:(float)a3 inputDisparity:(id)a4 outputDisparity:(id)a5 outputConfidence:(id)a6;
- (int)setFarWithDistance:(id)a3 inputDistanceTransformMap:(id)a4 inputDisparity:(id)a5 inoutConfidenceMap:(id)a6 outputDistanceTransformDisparity:(id)a7;
- (void)dealloc;
- (void)releaseResources;
@end

@implementation DepthProcUtilitiesMetal

- (DepthProcUtilitiesMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    v57 = 0;
    goto LABEL_14;
  }
  v59.receiver = self;
  v59.super_class = (Class)DepthProcUtilitiesMetal;
  v6 = [(DepthProcUtilitiesMetal *)&v59 init];
  self = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v7, @"kernelPreprocessData", 0, v8, v9);
    v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelPreprocessData = self->_kernelPreprocessData;
    self->_kernelPreprocessData = v10;

    if (!self->_kernelPreprocessData) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v12, @"kernelPostErosion", 0, v13, v14);
    v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelPostErosion = self->_kernelPostErosion;
    self->_kernelPostErosion = v15;

    if (!self->_kernelPostErosion) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v17, @"kernelGetFarDistanceMin", 0, v18, v19);
    v20 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelGetFarDistanceMin = self->_kernelGetFarDistanceMin;
    self->_kernelGetFarDistanceMin = v20;

    if (!self->_kernelGetFarDistanceMin) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v22, @"kernelSetFarDistance", 0, v23, v24);
    v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelSetFarDistance = self->_kernelSetFarDistance;
    self->_kernelSetFarDistance = v25;

    if (!self->_kernelSetFarDistance) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v27, @"kernelPostFbs", 0, v28, v29);
    v30 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelPostFbs = self->_kernelPostFbs;
    self->_kernelPostFbs = v30;

    if (!self->_kernelPostFbs) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v32, @"_kernelPrepareFbsPart1", 0, v33, v34);
    v35 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelPrepareFbsPart1 = self->_kernelPrepareFbsPart1;
    self->_kernelPrepareFbsPart1 = v35;

    if (!self->_kernelPrepareFbsPart1) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v37, @"kernelPrepareFbsPart2", 0, v38, v39);
    v40 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelPrepareFbsPart2 = self->_kernelPrepareFbsPart2;
    self->_kernelPrepareFbsPart2 = v40;

    if (!self->_kernelPrepareFbsPart2) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v42, @"kernelDisparityDataOverride", 0, v43, v44);
    v45 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelDisparityDataOverride = self->_kernelDisparityDataOverride;
    self->_kernelDisparityDataOverride = v45;

    if (!self->_kernelDisparityDataOverride) {
      goto LABEL_16;
    }
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v47, @"kernelmakeForegroundMask", 0, v48, v49);
    v50 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    kernelmakeForegroundMask = self->_kernelmakeForegroundMask;
    self->_kernelmakeForegroundMask = v50;

    if (!self->_kernelmakeForegroundMask
      || (objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v52, @"kernelBuildFindMask", 0, v53, v54), v55 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), kernelBuildFindMask = self->_kernelBuildFindMask, self->_kernelBuildFindMask = v55, kernelBuildFindMask, !self->_kernelBuildFindMask))
    {
LABEL_16:
      fig_log_get_emitter();
      goto LABEL_17;
    }
  }
  self = self;
  v57 = self;
LABEL_14:

  return v57;
}

- (int)allocateResources
{
  uint64_t v7 = 4 * objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelGetFarDistanceMin, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_device(self->_metalContext, v8, v9, v10, v11, v12);
  v17 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v13, v14, v7, 0, v15, v16);
  setFarDistFurthestDisparityArray = self->_setFarDistFurthestDisparityArray;
  self->_setFarDistFurthestDisparityArray = v17;

  if (!self->_setFarDistFurthestDisparityArray)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  return 0;
}

- (void)releaseResources
{
  self->_setFarDistFurthestDisparityArray = 0;
  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)DepthProcUtilitiesMetal;
  [(DepthProcUtilitiesMetal *)&v7 dealloc];
}

- (int)preprocessData:(float)a3 inputDisparity:(id)a4 outputDisparity:(id)a5 outputConfidence:(id)a6
{
  float v147 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v17 = v11;
  if (v9
    && v10
    && v11
    && (unint64_t v18 = objc_msgSend_width(v9, v12, v13, v14, v15, v16),
        unint64_t v24 = objc_msgSend_height(v9, v19, v20, v21, v22, v23),
        objc_msgSend_pixelFormat(v9, v25, v26, v27, v28, v29) == 25)
    && objc_msgSend_pixelFormat(v10, v30, v31, v32, v33, v34) == 25
    && objc_msgSend_width(v10, v35, v36, v37, v38, v39) == v18
    && objc_msgSend_height(v10, v40, v41, v42, v43, v44) == v24
    && objc_msgSend_pixelFormat(v17, v45, v46, v47, v48, v49) == 25
    && objc_msgSend_width(v17, v50, v51, v52, v53, v54) == v18
    && objc_msgSend_height(v17, v55, v56, v57, v58, v59) == v24
    && (objc_msgSend_commandQueue(self->_metalContext, v60, v61, v62, v63, v64),
        v65 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v65, v66, v67, v68, v69, v70),
        v71 = objc_claimAutoreleasedReturnValue(),
        v65,
        v71))
  {
    v77 = objc_msgSend_computeCommandEncoder(v71, v72, v73, v74, v75, v76);
    if (v77)
    {
      v82 = v77;
      objc_msgSend_setComputePipelineState_(v77, v78, (uint64_t)self->_kernelPreprocessData, v79, v80, v81);
      objc_msgSend_setTexture_atIndex_(v82, v83, (uint64_t)v9, 0, v84, v85);
      objc_msgSend_setTexture_atIndex_(v82, v86, (uint64_t)v10, 1, v87, v88);
      objc_msgSend_setTexture_atIndex_(v82, v89, (uint64_t)v17, 2, v90, v91);
      objc_msgSend_setBytes_length_atIndex_(v82, v92, (uint64_t)&v147, 4, 0, v93);
      unint64_t v99 = objc_msgSend_threadExecutionWidth(self->_kernelPreprocessData, v94, v95, v96, v97, v98);
      unint64_t v105 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelPreprocessData, v100, v101, v102, v103, v104);
      v146[0] = v18 >> 1;
      v146[1] = v24 >> 1;
      v146[2] = 1;
      v145[0] = v99;
      v145[1] = v105 / v99;
      v145[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v82, v106, (uint64_t)v146, (uint64_t)v145, v107, v108);
      objc_msgSend_endEncoding(v82, v109, v110, v111, v112, v113);
      if (*MEMORY[0x263F00E10])
      {
        v119 = objc_msgSend_commandQueue(v71, v114, v115, v116, v117, v118);
        v125 = objc_msgSend_commandBuffer(v119, v120, v121, v122, v123, v124);

        objc_msgSend_setLabel_(v125, v126, @"KTRACE_MTLCMDBUF", v127, v128, v129);
        objc_msgSend_addCompletedHandler_(v125, v130, (uint64_t)&unk_270E22340, v131, v132, v133);
        objc_msgSend_commit(v125, v134, v135, v136, v137, v138);
        objc_msgSend_addCompletedHandler_(v71, v139, (uint64_t)&unk_270E22360, v140, v141, v142);
      }
      objc_msgSend_commit(v71, v114, v115, v116, v117, v118);

      int v143 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v143 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v143 = FigSignalErrorAt();
  }

  return v143;
}

- (int)postErosion:(id)a3 outputConfidence:(id)a4 outputDisparity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = v10;
  if (v8
    && v9
    && v10
    && (unint64_t v17 = objc_msgSend_width(v8, v11, v12, v13, v14, v15),
        unint64_t v23 = objc_msgSend_height(v8, v18, v19, v20, v21, v22),
        objc_msgSend_pixelFormat(v8, v24, v25, v26, v27, v28) == 25)
    && objc_msgSend_pixelFormat(v9, v29, v30, v31, v32, v33) == 25
    && objc_msgSend_width(v9, v34, v35, v36, v37, v38) == v17
    && objc_msgSend_height(v9, v39, v40, v41, v42, v43) == v23
    && objc_msgSend_pixelFormat(v16, v44, v45, v46, v47, v48) == 25
    && objc_msgSend_width(v16, v49, v50, v51, v52, v53) == v17
    && objc_msgSend_height(v16, v54, v55, v56, v57, v58) == v23
    && (objc_msgSend_commandQueue(self->_metalContext, v59, v60, v61, v62, v63),
        uint64_t v64 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v64, v65, v66, v67, v68, v69),
        uint64_t v70 = objc_claimAutoreleasedReturnValue(),
        v64,
        v70))
  {
    uint64_t v76 = objc_msgSend_computeCommandEncoder(v70, v71, v72, v73, v74, v75);
    if (v76)
    {
      uint64_t v81 = v76;
      objc_msgSend_setComputePipelineState_(v76, v77, (uint64_t)self->_kernelPostErosion, v78, v79, v80);
      objc_msgSend_setTexture_atIndex_(v81, v82, (uint64_t)v8, 0, v83, v84);
      objc_msgSend_setTexture_atIndex_(v81, v85, (uint64_t)v9, 1, v86, v87);
      objc_msgSend_setTexture_atIndex_(v81, v88, (uint64_t)v16, 2, v89, v90);
      unint64_t v96 = objc_msgSend_threadExecutionWidth(self->_kernelPostErosion, v91, v92, v93, v94, v95);
      unint64_t v102 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelPostErosion, v97, v98, v99, v100, v101);
      v143[0] = v17 >> 1;
      v143[1] = v23 >> 1;
      v143[2] = 1;
      v142[0] = v96;
      v142[1] = v102 / v96;
      v142[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v81, v103, (uint64_t)v143, (uint64_t)v142, v104, v105);
      objc_msgSend_endEncoding(v81, v106, v107, v108, v109, v110);
      if (*MEMORY[0x263F00E10])
      {
        uint64_t v116 = objc_msgSend_commandQueue(v70, v111, v112, v113, v114, v115);
        uint64_t v122 = objc_msgSend_commandBuffer(v116, v117, v118, v119, v120, v121);

        objc_msgSend_setLabel_(v122, v123, @"KTRACE_MTLCMDBUF", v124, v125, v126);
        objc_msgSend_addCompletedHandler_(v122, v127, (uint64_t)&unk_270E22380, v128, v129, v130);
        objc_msgSend_commit(v122, v131, v132, v133, v134, v135);
        objc_msgSend_addCompletedHandler_(v70, v136, (uint64_t)&unk_270E223A0, v137, v138, v139);
      }
      objc_msgSend_commit(v70, v111, v112, v113, v114, v115);

      int v140 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v140 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v140 = FigSignalErrorAt();
  }

  return v140;
}

- (int)setFarWithDistance:(id)a3 inputDistanceTransformMap:(id)a4 inputDisparity:(id)a5 inoutConfidenceMap:(id)a6 outputDistanceTransformDisparity:(id)a7
{
  $55A2418A4D34BDC28D9B1AABFB821A41 v211 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v20 = v14;
  if (self->_setFarDistFurthestDisparityArray && v11)
  {
    uint64_t v21 = v12;
    if (v12
      && v13
      && v14
      && (uint64_t v22 = objc_msgSend_width(v11, v15, v16, v17, v18, v19),
          uint64_t v28 = objc_msgSend_height(v11, v23, v24, v25, v26, v27),
          objc_msgSend_pixelFormat(v12, v29, v30, v31, v32, v33) == 25)
      && objc_msgSend_width(v12, v34, v35, v36, v37, v38) == v22
      && objc_msgSend_height(v12, v39, v40, v41, v42, v43) == v28
      && objc_msgSend_pixelFormat(v13, v44, v45, v46, v47, v48) == 25
      && objc_msgSend_width(v13, v49, v50, v51, v52, v53) == v22
      && objc_msgSend_height(v13, v54, v55, v56, v57, v58) == v28
      && objc_msgSend_pixelFormat(v20, v59, v60, v61, v62, v63) == 25
      && objc_msgSend_width(v20, v64, v65, v66, v67, v68) == v22
      && objc_msgSend_height(v20, v69, v70, v71, v72, v73) == v28
      && (objc_msgSend_commandQueue(self->_metalContext, v74, v75, v76, v77, v78),
          uint64_t v79 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_commandBuffer(v79, v80, v81, v82, v83, v84),
          uint64_t v85 = objc_claimAutoreleasedReturnValue(),
          v79,
          v85))
    {
      uint64_t v91 = objc_msgSend_computeCommandEncoder(v85, v86, v87, v88, v89, v90);
      if (v91)
      {
        uint64_t v97 = (void *)v91;
        uint64_t v204 = (uint64_t)v20;
        uint64_t v205 = (uint64_t)v11;
        unint64_t v98 = objc_msgSend_threadExecutionWidth(self->_kernelGetFarDistanceMin, v92, v93, v94, v95, v96);
        unint64_t v104 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelGetFarDistanceMin, v99, v100, v101, v102, v103)
             / v98;
        objc_msgSend_setComputePipelineState_(v97, v105, (uint64_t)self->_kernelGetFarDistanceMin, v106, v107, v108);
        objc_msgSend_setTexture_atIndex_(v97, v109, (uint64_t)v12, 0, v110, v111);
        objc_msgSend_setTexture_atIndex_(v97, v112, (uint64_t)v13, 1, v113, v114);
        objc_msgSend_setBuffer_offset_atIndex_(v97, v115, (uint64_t)self->_setFarDistFurthestDisparityArray, 0, 0, v116);
        objc_msgSend_setBytes_length_atIndex_(v97, v117, (uint64_t)&v211, 16, 1, v118);
        int64x2_t v209 = vdupq_n_s64(1uLL);
        uint64_t v210 = 1;
        v208[0] = v98;
        v208[1] = v104;
        v208[2] = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v97, v119, (uint64_t)&v209, (uint64_t)v208, v120, v121);
        objc_msgSend_endEncoding(v97, v122, v123, v124, v125, v126);
        uint64_t v132 = objc_msgSend_computeCommandEncoder(v85, v127, v128, v129, v130, v131);

        if (v132)
        {
          objc_msgSend_setComputePipelineState_(v132, v133, (uint64_t)self->_kernelSetFarDistance, v134, v135, v136);
          objc_msgSend_setTexture_atIndex_(v132, v137, v205, 0, v138, v139);
          uint64_t v21 = v12;
          objc_msgSend_setTexture_atIndex_(v132, v140, (uint64_t)v12, 1, v141, v142);
          objc_msgSend_setTexture_atIndex_(v132, v143, (uint64_t)v13, 2, v144, v145);
          objc_msgSend_setTexture_atIndex_(v132, v146, v204, 3, v147, v148);
          objc_msgSend_setBuffer_offset_atIndex_(v132, v149, (uint64_t)self->_setFarDistFurthestDisparityArray, 0, 0, v150);
          objc_msgSend_setBytes_length_atIndex_(v132, v151, (uint64_t)&v211, 16, 1, v152);
          unint64_t v158 = objc_msgSend_threadExecutionWidth(self->_kernelSetFarDistance, v153, v154, v155, v156, v157);
          unint64_t v164 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelSetFarDistance, v159, v160, v161, v162, v163);
          v207[0] = v22;
          v207[1] = v28;
          v207[2] = 1;
          v206[0] = v158;
          v206[1] = v164 / v158;
          v206[2] = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v132, v165, (uint64_t)v207, (uint64_t)v206, v166, v167);
          objc_msgSend_endEncoding(v132, v168, v169, v170, v171, v172);
          if (*MEMORY[0x263F00E10])
          {
            v178 = objc_msgSend_commandQueue(v85, v173, v174, v175, v176, v177);
            v184 = objc_msgSend_commandBuffer(v178, v179, v180, v181, v182, v183);

            objc_msgSend_setLabel_(v184, v185, @"KTRACE_MTLCMDBUF", v186, v187, v188);
            objc_msgSend_addCompletedHandler_(v184, v189, (uint64_t)&unk_270E223C0, v190, v191, v192);
            objc_msgSend_commit(v184, v193, v194, v195, v196, v197);
            objc_msgSend_addCompletedHandler_(v85, v198, (uint64_t)&unk_270E223E0, v199, v200, v201);
          }
          objc_msgSend_commit(v85, v173, v174, v175, v176, v177);

          int v202 = 0;
          id v11 = (id)v205;
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v202 = FigSignalErrorAt();

          id v11 = (id)v205;
          uint64_t v21 = v12;
        }
        uint64_t v20 = (void *)v204;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v202 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v202 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v202 = FigSignalErrorAt();
    uint64_t v21 = v12;
  }

  return v202;
}

- (id)prepareForFbs:(id)a3 toF32:(id)a4 confidenceInF16:(id)a5 confidenceOutF32:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v19 = objc_msgSend_width(v10, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_height(v10, v20, v21, v22, v23, v24);
  uint64_t v210 = v11;
  if (!v10) {
    goto LABEL_29;
  }
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v208 = FigSignalErrorAt();
LABEL_30:
    uint64_t v109 = 0;
    goto LABEL_31;
  }
  if (!v12
    || !v13
    || (uint64_t v31 = v25, objc_msgSend_pixelFormat(v10, v26, v27, v28, v29, v30) != 25)
    || objc_msgSend_pixelFormat(v11, v32, v33, v34, v35, v36) != 55
    || objc_msgSend_width(v11, v37, v38, v39, v40, v41) != v19
    || objc_msgSend_height(v11, v42, v43, v44, v45, v46) != v31
    || objc_msgSend_pixelFormat(v12, v47, v48, v49, v50, v51) != 25
    || objc_msgSend_width(v12, v52, v53, v54, v55, v56) != v19
    || objc_msgSend_height(v12, v57, v58, v59, v60, v61) != v31
    || objc_msgSend_pixelFormat(v13, v62, v63, v64, v65, v66) != 55
    || objc_msgSend_width(v13, v67, v68, v69, v70, v71) != v19
    || objc_msgSend_height(v13, v72, v73, v74, v75, v76) != v31)
  {
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v208 = FigSignalErrorAt();
    id v11 = 0;
    goto LABEL_30;
  }
  uint64_t v209 = (uint64_t)v12;
  unint64_t v82 = objc_msgSend_threadExecutionWidth(self->_kernelPrepareFbsPart1, v77, v78, v79, v80, v81);
  unint64_t v88 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelPrepareFbsPart1, v83, v84, v85, v86, v87) / v82;
  uint64_t v94 = objc_msgSend_device(self->_metalContext, v89, v90, v91, v92, v93);
  id v11 = (id)objc_msgSend_newBufferWithLength_options_(v94, v95, 4 * v82 * v88, 0, v96, v97);

  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v208 = FigSignalErrorAt();
    uint64_t v109 = 0;
    id v12 = (id)v209;
    goto LABEL_31;
  }
  uint64_t v103 = objc_msgSend_commandQueue(self->_metalContext, v98, v99, v100, v101, v102);
  uint64_t v109 = objc_msgSend_commandBuffer(v103, v104, v105, v106, v107, v108);

  if (!v109
    || (objc_msgSend_computeCommandEncoder(v109, v110, v111, v112, v113, v114),
        (uint64_t v115 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
LABEL_38:
    FigDebugAssert3();
    int v208 = FigSignalErrorAt();
    id v12 = (id)v209;
LABEL_31:
    if (v208)
    {

      uint64_t v139 = 0;
      id v11 = 0;
    }
    else
    {
      uint64_t v139 = 0;
    }
    goto LABEL_22;
  }
  uint64_t v120 = v115;
  objc_msgSend_setComputePipelineState_(v115, v116, (uint64_t)self->_kernelPrepareFbsPart1, v117, v118, v119);
  objc_msgSend_setTexture_atIndex_(v120, v121, (uint64_t)v10, 0, v122, v123);
  objc_msgSend_setBuffer_offset_atIndex_(v120, v124, (uint64_t)v11, 0, 0, v125);
  int64x2_t v214 = vdupq_n_s64(1uLL);
  uint64_t v215 = 1;
  v213[0] = v82;
  v213[1] = v88;
  v213[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v120, v126, (uint64_t)&v214, (uint64_t)v213, v127, v128);
  objc_msgSend_endEncoding(v120, v129, v130, v131, v132, v133);
  uint64_t v139 = objc_msgSend_computeCommandEncoder(v109, v134, v135, v136, v137, v138);

  if (!v139)
  {
    fig_log_get_emitter();
    goto LABEL_38;
  }
  objc_msgSend_setComputePipelineState_(v139, v140, (uint64_t)self->_kernelPrepareFbsPart2, v141, v142, v143);
  objc_msgSend_setTexture_atIndex_(v139, v144, (uint64_t)v10, 0, v145, v146);
  objc_msgSend_setTexture_atIndex_(v139, v147, (uint64_t)v210, 1, v148, v149);
  objc_msgSend_setTexture_atIndex_(v139, v150, v209, 2, v151, v152);
  objc_msgSend_setTexture_atIndex_(v139, v153, (uint64_t)v13, 3, v154, v155);
  objc_msgSend_setBuffer_offset_atIndex_(v139, v156, (uint64_t)v11, 0, 0, v157);
  unint64_t v163 = objc_msgSend_threadExecutionWidth(self->_kernelPrepareFbsPart2, v158, v159, v160, v161, v162);
  unint64_t v169 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelPrepareFbsPart2, v164, v165, v166, v167, v168);
  v212[0] = v19;
  v212[1] = v31;
  v212[2] = 1;
  v211[0] = v163;
  v211[1] = v169 / v163;
  v211[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v139, v170, (uint64_t)v212, (uint64_t)v211, v171, v172);
  objc_msgSend_endEncoding(v139, v173, v174, v175, v176, v177);
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v183 = objc_msgSend_commandQueue(v109, v178, v179, v180, v181, v182);
    v189 = objc_msgSend_commandBuffer(v183, v184, v185, v186, v187, v188);

    objc_msgSend_setLabel_(v189, v190, @"KTRACE_MTLCMDBUF", v191, v192, v193);
    objc_msgSend_addCompletedHandler_(v189, v194, (uint64_t)&unk_270E22400, v195, v196, v197);
    objc_msgSend_commit(v189, v198, v199, v200, v201, v202);
    objc_msgSend_addCompletedHandler_(v109, v203, (uint64_t)&unk_270E22420, v204, v205, v206);
  }
  objc_msgSend_commit(v109, v178, v179, v180, v181, v182);
  id v12 = (id)v209;
LABEL_22:

  return v11;
}

- (int)postFbs:(id)a3 toF16:(id)a4 prepareBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = objc_msgSend_width(v8, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_height(v8, v17, v18, v19, v20, v21);
  if (v8
    && v9
    && (uint64_t v28 = v22, objc_msgSend_pixelFormat(v8, v23, v24, v25, v26, v27) == 55)
    && objc_msgSend_pixelFormat(v9, v29, v30, v31, v32, v33) == 25
    && objc_msgSend_width(v9, v34, v35, v36, v37, v38) == v16
    && objc_msgSend_height(v9, v39, v40, v41, v42, v43) == v28
    && (objc_msgSend_commandQueue(self->_metalContext, v44, v45, v46, v47, v48),
        uint64_t v49 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v49, v50, v51, v52, v53, v54),
        uint64_t v55 = objc_claimAutoreleasedReturnValue(),
        v49,
        v55))
  {
    uint64_t v61 = objc_msgSend_computeCommandEncoder(v55, v56, v57, v58, v59, v60);
    if (v61)
    {
      uint64_t v66 = v61;
      objc_msgSend_setComputePipelineState_(v61, v62, (uint64_t)self->_kernelPostFbs, v63, v64, v65);
      objc_msgSend_setTexture_atIndex_(v66, v67, (uint64_t)v8, 0, v68, v69);
      objc_msgSend_setTexture_atIndex_(v66, v70, (uint64_t)v9, 1, v71, v72);
      objc_msgSend_setBuffer_offset_atIndex_(v66, v73, (uint64_t)v10, 0, 0, v74);
      unint64_t v80 = objc_msgSend_threadExecutionWidth(self->_kernelPostFbs, v75, v76, v77, v78, v79);
      unint64_t v86 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelPostFbs, v81, v82, v83, v84, v85);
      v127[0] = v16;
      v127[1] = v28;
      v127[2] = 1;
      v126[0] = v80;
      v126[1] = v86 / v80;
      v126[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v66, v87, (uint64_t)v127, (uint64_t)v126, v88, v89);
      objc_msgSend_endEncoding(v66, v90, v91, v92, v93, v94);
      if (*MEMORY[0x263F00E10])
      {
        uint64_t v100 = objc_msgSend_commandQueue(v55, v95, v96, v97, v98, v99);
        uint64_t v106 = objc_msgSend_commandBuffer(v100, v101, v102, v103, v104, v105);

        objc_msgSend_setLabel_(v106, v107, @"KTRACE_MTLCMDBUF", v108, v109, v110);
        objc_msgSend_addCompletedHandler_(v106, v111, (uint64_t)&unk_270E22440, v112, v113, v114);
        objc_msgSend_commit(v106, v115, v116, v117, v118, v119);
        objc_msgSend_addCompletedHandler_(v55, v120, (uint64_t)&unk_270E22460, v121, v122, v123);
      }
      objc_msgSend_commit(v55, v95, v96, v97, v98, v99);

      int v124 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v124 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v124 = FigSignalErrorAt();
  }

  return v124;
}

- (int)disparityDataOverrideOnGpu:(id)a3 To:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = objc_msgSend_width(v6, v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_height(v6, v14, v15, v16, v17, v18);
  if (v6
    && v7
    && (uint64_t v25 = v19, objc_msgSend_pixelFormat(v6, v20, v21, v22, v23, v24) == 25)
    && objc_msgSend_pixelFormat(v7, v26, v27, v28, v29, v30) == 25
    && objc_msgSend_width(v7, v31, v32, v33, v34, v35) == v13
    && objc_msgSend_height(v7, v36, v37, v38, v39, v40) == v25
    && (objc_msgSend_commandQueue(self->_metalContext, v41, v42, v43, v44, v45),
        uint64_t v46 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v46, v47, v48, v49, v50, v51),
        uint64_t v52 = objc_claimAutoreleasedReturnValue(),
        v46,
        v52))
  {
    uint64_t v58 = objc_msgSend_computeCommandEncoder(v52, v53, v54, v55, v56, v57);
    if (v58)
    {
      uint64_t v63 = v58;
      objc_msgSend_setComputePipelineState_(v58, v59, (uint64_t)self->_kernelDisparityDataOverride, v60, v61, v62);
      objc_msgSend_setTexture_atIndex_(v63, v64, (uint64_t)v6, 0, v65, v66);
      objc_msgSend_setTexture_atIndex_(v63, v67, (uint64_t)v7, 1, v68, v69);
      unint64_t v75 = objc_msgSend_threadExecutionWidth(self->_kernelDisparityDataOverride, v70, v71, v72, v73, v74);
      unint64_t v81 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelDisparityDataOverride, v76, v77, v78, v79, v80);
      v98[0] = v13;
      v98[1] = v25;
      v98[2] = 1;
      v97[0] = v75;
      v97[1] = v81 / v75;
      v97[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v63, v82, (uint64_t)v98, (uint64_t)v97, v83, v84);
      objc_msgSend_endEncoding(v63, v85, v86, v87, v88, v89);
      objc_msgSend_commit(v52, v90, v91, v92, v93, v94);

      int v95 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v95 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v95 = FigSignalErrorAt();
  }

  return v95;
}

- (int)makeForegroundMask:(id)a3 personSegmentationMap:(id)a4 validForegroundMask:(id)a5 minSegmentationThreshold:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  float v112 = a6;
  uint64_t v18 = objc_msgSend_width(v10, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_height(v10, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_commandQueue(self->_metalContext, v25, v26, v27, v28, v29);
  uint64_t v36 = objc_msgSend_commandBuffer(v30, v31, v32, v33, v34, v35);

  if (v36
    && (objc_msgSend_computeCommandEncoder(v36, v37, v38, v39, v40, v41),
        (uint64_t v42 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v47 = v42;
    objc_msgSend_setComputePipelineState_(v42, v43, (uint64_t)self->_kernelmakeForegroundMask, v44, v45, v46);
    objc_msgSend_setTexture_atIndex_(v47, v48, (uint64_t)v10, 0, v49, v50);
    objc_msgSend_setTexture_atIndex_(v47, v51, (uint64_t)v11, 1, v52, v53);
    objc_msgSend_setTexture_atIndex_(v47, v54, (uint64_t)v12, 2, v55, v56);
    objc_msgSend_setBytes_length_atIndex_(v47, v57, (uint64_t)&v112, 4, 0, v58);
    unint64_t v64 = objc_msgSend_threadExecutionWidth(self->_kernelmakeForegroundMask, v59, v60, v61, v62, v63);
    unint64_t v70 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelmakeForegroundMask, v65, v66, v67, v68, v69);
    v111[0] = v18;
    v111[1] = v24;
    v111[2] = 1;
    v110[0] = v64;
    v110[1] = v70 / v64;
    v110[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v47, v71, (uint64_t)v111, (uint64_t)v110, v72, v73);
    objc_msgSend_endEncoding(v47, v74, v75, v76, v77, v78);
    if (*MEMORY[0x263F00E10])
    {
      uint64_t v84 = objc_msgSend_commandQueue(v36, v79, v80, v81, v82, v83);
      uint64_t v90 = objc_msgSend_commandBuffer(v84, v85, v86, v87, v88, v89);

      objc_msgSend_setLabel_(v90, v91, @"KTRACE_MTLCMDBUF", v92, v93, v94);
      objc_msgSend_addCompletedHandler_(v90, v95, (uint64_t)&unk_270E22480, v96, v97, v98);
      objc_msgSend_commit(v90, v99, v100, v101, v102, v103);
      objc_msgSend_addCompletedHandler_(v36, v104, (uint64_t)&unk_270E224A0, v105, v106, v107);
    }
    objc_msgSend_commit(v36, v79, v80, v81, v82, v83);

    int v108 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v108 = FigSignalErrorAt();
  }

  return v108;
}

- (int)buildFindMask:(id)a3 value:(float)a4 outputBuffer:(id)a5
{
  id v8 = a3;
  float v93 = a4;
  id v9 = a5;
  uint64_t v15 = objc_msgSend_width(v9, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_height(v9, v16, v17, v18, v19, v20);
  if (v8
    && v9
    && (uint64_t v27 = v21, objc_msgSend_pixelFormat(v8, v22, v23, v24, v25, v26) == 25)
    && objc_msgSend_pixelFormat(v9, v28, v29, v30, v31, v32) == 25
    && (objc_msgSend_commandQueue(self->_metalContext, v33, v34, v35, v36, v37),
        uint64_t v38 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v38, v39, v40, v41, v42, v43),
        uint64_t v44 = objc_claimAutoreleasedReturnValue(),
        v38,
        v44))
  {
    uint64_t v50 = objc_msgSend_computeCommandEncoder(v44, v45, v46, v47, v48, v49);
    if (v50)
    {
      uint64_t v55 = v50;
      objc_msgSend_setComputePipelineState_(v50, v51, (uint64_t)self->_kernelBuildFindMask, v52, v53, v54);
      objc_msgSend_setTexture_atIndex_(v55, v56, (uint64_t)v8, 0, v57, v58);
      objc_msgSend_setTexture_atIndex_(v55, v59, (uint64_t)v9, 1, v60, v61);
      objc_msgSend_setBytes_length_atIndex_(v55, v62, (uint64_t)&v93, 4, 0, v63);
      unint64_t v69 = objc_msgSend_threadExecutionWidth(self->_kernelBuildFindMask, v64, v65, v66, v67, v68);
      unint64_t v75 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_kernelBuildFindMask, v70, v71, v72, v73, v74);
      v92[0] = v15;
      v92[1] = v27;
      v92[2] = 1;
      v91[0] = v69;
      v91[1] = v75 / v69;
      v91[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v55, v76, (uint64_t)v92, (uint64_t)v91, v77, v78);
      objc_msgSend_endEncoding(v55, v79, v80, v81, v82, v83);
      objc_msgSend_commit(v44, v84, v85, v86, v87, v88);

      int v89 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v89 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();
  }

  return v89;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setFarDistFurthestDisparityArray, 0);
  objc_storeStrong((id *)&self->_kernelBuildFindMask, 0);
  objc_storeStrong((id *)&self->_kernelmakeForegroundMask, 0);
  objc_storeStrong((id *)&self->_kernelDisparityDataOverride, 0);
  objc_storeStrong((id *)&self->_kernelPrepareFbsPart2, 0);
  objc_storeStrong((id *)&self->_kernelPrepareFbsPart1, 0);
  objc_storeStrong((id *)&self->_kernelPostFbs, 0);
  objc_storeStrong((id *)&self->_kernelSetFarDistance, 0);
  objc_storeStrong((id *)&self->_kernelGetFarDistanceMin, 0);
  objc_storeStrong((id *)&self->_kernelPostErosion, 0);
  objc_storeStrong((id *)&self->_kernelPreprocessData, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end