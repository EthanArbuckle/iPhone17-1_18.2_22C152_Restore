@interface GreenGhostCommon
- (GreenGhostCommon)initWithMetalContext:(id)a3;
- (SidecarWriter)sidecarWriter;
- (id)functionNameForProgram:(int)a3;
- (int)blobDetection:(id)a3 output:(id)a4 params:(BlobTuning)a5;
- (int)boxFilter:(id)a3 withRadius:(unsigned int)a4 output:(id)a5;
- (int)brightnessDetectionInput:(id)a3 output:(id)a4 params:(BrightnessTuning)a5 processingROIInfo:(ProcessingROIInfo *)a6;
- (int)combineBrightnessMask:(id)a3 blobMask:(id)a4 greenMask:(id)a5 output:(id)a6;
- (int)compileDilateVerticalShaders;
- (int)compileShaders;
- (int)detectionWithLuma:(id)a3 croppedLuma:(id)a4 chroma:(id)a5 outputMask:(id)a6 params:(DetectionTuning *)a7 processingROIInfo:(ProcessingROIInfo *)a8;
- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5;
- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 withThreshold:(id)a5 subtractTexture:(id)a6 output:(id)a7;
- (int)downscaleInput:(id)a3 output:(id)a4;
- (int)erodeTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5;
- (int)extractFaceBodyBoundariesFromFaceLandMarks:(GreenGhostCommon *)self ev0FrameMetadata:(SEL)a2 imgSize:(id)a3 faceBoundaryPaddingRatio:(const frameMetadata *)a4 bodyBoundaryPaddingRatio:(CGSize)a5 output:(FaceBodyBoundaries *)a6;
- (int)greenDetectionLuma:(id)a3 chroma:(id)a4 output:(id)a5 params:(GreenTuning)a6 processingROIInfo:(ProcessingROIInfo *)a7;
- (void)setSidecarWriter:(id)a3;
@end

@implementation GreenGhostCommon

- (void)setSidecarWriter:(id)a3
{
}

- (id)functionNameForProgram:(int)a3
{
  if (a3 < 0xD) {
    return (id)*((void *)&off_2655C3440 + a3);
  }
  FigDebugAssert3();
  return 0;
}

- (int)compileDilateVerticalShaders
{
  v4 = objc_opt_new();
  if (v4)
  {
    pipelineStates = self->_pipelineStates;
    int v21 = 0;
    do
    {
      int v6 = 0;
      int v20 = 0;
      do
      {
        if (!v6 || !v21)
        {
          objc_msgSend_setConstantValue_type_atIndex_(v4, v3, (uint64_t)&v20, 53, 1);
          objc_msgSend_setConstantValue_type_atIndex_(v4, v7, (uint64_t)&v21, 53, 2);
          int v8 = v20 + 2 * v21 + 2;
          metal = self->_metal;
          v12 = objc_msgSend_functionNameForProgram_(self, v10, v8, v11);
          uint64_t v14 = objc_msgSend_computePipelineStateFor_constants_(metal, v13, (uint64_t)v12, (uint64_t)v4);
          v15 = pipelineStates[v8];
          pipelineStates[v8] = (MTLComputePipelineState *)v14;

          if (!pipelineStates[v8]) {
            goto LABEL_11;
          }
          int v6 = v20;
        }
        int v20 = v6 + 1;
      }
      while (v6++ < 1);
      int v17 = v21++;
    }
    while (v17 < 1);
    int v18 = 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (int)compileShaders
{
  metal = self->_metal;
  v5 = objc_msgSend_functionNameForProgram_(self, a2, 0, v2);
  objc_msgSend_computePipelineStateFor_constants_(metal, v6, (uint64_t)v5, 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  int v8 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v7;

  if (self->_pipelineStates[0])
  {
    uint64_t v11 = self->_metal;
    v12 = objc_msgSend_functionNameForProgram_(self, v9, 1, v10);
    objc_msgSend_computePipelineStateFor_constants_(v11, v13, (uint64_t)v12, 0);
    uint64_t v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v15 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v14;

    if (self->_pipelineStates[1])
    {
      int v19 = objc_msgSend_compileDilateVerticalShaders(self, v16, v17, v18);
      if (v19)
      {
        int v76 = v19;
        FigDebugAssert3();
        return v76;
      }
      v22 = self->_metal;
      v23 = objc_msgSend_functionNameForProgram_(self, v20, 5, v21);
      objc_msgSend_computePipelineStateFor_constants_(v22, v24, (uint64_t)v23, 0);
      v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v26 = self->_pipelineStates[5];
      self->_pipelineStates[5] = v25;

      if (self->_pipelineStates[5])
      {
        v29 = self->_metal;
        v30 = objc_msgSend_functionNameForProgram_(self, v27, 6, v28);
        objc_msgSend_computePipelineStateFor_constants_(v29, v31, (uint64_t)v30, 0);
        v32 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        v33 = self->_pipelineStates[6];
        self->_pipelineStates[6] = v32;

        if (self->_pipelineStates[6])
        {
          v36 = self->_metal;
          v37 = objc_msgSend_functionNameForProgram_(self, v34, 7, v35);
          objc_msgSend_computePipelineStateFor_constants_(v36, v38, (uint64_t)v37, 0);
          v39 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          v40 = self->_pipelineStates[7];
          self->_pipelineStates[7] = v39;

          if (self->_pipelineStates[7])
          {
            v43 = self->_metal;
            v44 = objc_msgSend_functionNameForProgram_(self, v41, 8, v42);
            objc_msgSend_computePipelineStateFor_constants_(v43, v45, (uint64_t)v44, 0);
            v46 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
            v47 = self->_pipelineStates[8];
            self->_pipelineStates[8] = v46;

            if (self->_pipelineStates[8])
            {
              v50 = self->_metal;
              v51 = objc_msgSend_functionNameForProgram_(self, v48, 9, v49);
              objc_msgSend_computePipelineStateFor_constants_(v50, v52, (uint64_t)v51, 0);
              v53 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
              v54 = self->_pipelineStates[9];
              self->_pipelineStates[9] = v53;

              if (self->_pipelineStates[9])
              {
                v57 = self->_metal;
                v58 = objc_msgSend_functionNameForProgram_(self, v55, 10, v56);
                objc_msgSend_computePipelineStateFor_constants_(v57, v59, (uint64_t)v58, 0);
                v60 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                v61 = self->_pipelineStates[10];
                self->_pipelineStates[10] = v60;

                if (self->_pipelineStates[10])
                {
                  v64 = self->_metal;
                  v65 = objc_msgSend_functionNameForProgram_(self, v62, 11, v63);
                  objc_msgSend_computePipelineStateFor_constants_(v64, v66, (uint64_t)v65, 0);
                  v67 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                  v68 = self->_pipelineStates[11];
                  self->_pipelineStates[11] = v67;

                  if (self->_pipelineStates[11])
                  {
                    v71 = self->_metal;
                    v72 = objc_msgSend_functionNameForProgram_(self, v69, 12, v70);
                    objc_msgSend_computePipelineStateFor_constants_(v71, v73, (uint64_t)v72, 0);
                    v74 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                    v75 = self->_pipelineStates[12];
                    self->_pipelineStates[12] = v74;

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
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (GreenGhostCommon)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GreenGhostCommon;
  int v6 = [(GreenGhostCommon *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    if (objc_msgSend_compileShaders(v7, v8, v9, v10))
    {
      FigDebugAssert3();
      uint64_t v11 = 0;
      goto LABEL_4;
    }
  }
  else
  {
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
    uint64_t v11 = 0;
    if (v14) {
      goto LABEL_4;
    }
  }
  uint64_t v11 = v7;
LABEL_4:
  v12 = v11;

  return v12;
}

- (int)downscaleInput:(id)a3 output:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_commandQueue(self->_metal, v8, v9, v10);
  objc_super v15 = objc_msgSend_commandBuffer(v11, v12, v13, v14);

  if (v15
    && (objc_msgSend_computeCommandEncoder(v15, v16, v17, v18),
        (int v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = v19;
    objc_msgSend_setComputePipelineState_(v19, v20, (uint64_t)self->_pipelineStates[0], v21);
    objc_msgSend_setImageblockWidth_height_(v22, v23, 32, 32);
    objc_msgSend_setTexture_atIndex_(v22, v24, (uint64_t)v6, 0);
    objc_msgSend_setTexture_atIndex_(v22, v25, (uint64_t)v7, 1);
    v43[0] = objc_msgSend_width(v7, v26, v27, v28);
    v43[1] = objc_msgSend_height(v7, v29, v30, v31);
    v43[2] = 1;
    int64x2_t v41 = vdupq_n_s64(0x20uLL);
    uint64_t v42 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v22, v32, (uint64_t)v43, (uint64_t)&v41);
    objc_msgSend_endEncoding(v22, v33, v34, v35);
    objc_msgSend_commit(v15, v36, v37, v38);

    int v39 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
  }

  return v39;
}

- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 withThreshold:(id)a5 subtractTexture:(id)a6 output:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v167 = a7;
  unint64_t v18 = objc_msgSend_width(v12, v15, v16, v17);
  if (v18 <= objc_msgSend_height(v12, v19, v20, v21)) {
    uint64_t v25 = objc_msgSend_height(v12, v22, v23, v24);
  }
  else {
    uint64_t v25 = objc_msgSend_width(v12, v22, v23, v24);
  }
  v174[0] = (float)((float)(unint64_t)v25 * a4);
  id v173 = 0;
  v29 = v167;
  if ((objc_msgSend_width(v167, v26, v27, v28) & 1) != 0
    || (objc_msgSend_height(v167, v30, v31, v32) & 1) != 0
    || v13 && v14)
  {
    FigDebugAssert3();
    int v164 = FigSignalErrorAt();
    id v134 = 0;
    v47 = 0;
    v40 = 0;
    goto LABEL_19;
  }
  v36 = objc_msgSend_commandQueue(self->_metal, v33, v34, v35);
  v40 = objc_msgSend_commandBuffer(v36, v37, v38, v39);

  if (!v40)
  {
    FigDebugAssert3();
    int v164 = FigSignalErrorAt();
    id v134 = 0;
    v47 = 0;
    goto LABEL_19;
  }
  v47 = objc_msgSend_computeCommandEncoder(v40, v41, v42, v43);
  if (!v47)
  {
    FigDebugAssert3();
    int v164 = FigSignalErrorAt();
    id v134 = 0;
    goto LABEL_19;
  }
  v48 = v13;
  uint64_t v49 = objc_msgSend_allocator(self->_metal, v44, v45, v46);
  v53 = objc_msgSend_newTextureDescriptor(v49, v50, v51, v52);

  if (!v53)
  {
    FigDebugAssert3();
    int v164 = FigSignalErrorAt();
LABEL_25:
    id v134 = 0;
    id v13 = v48;
    goto LABEL_19;
  }
  v57 = objc_msgSend_desc(v53, v54, v55, v56);
  objc_msgSend_setCompressionMode_(v57, v58, 2, v59);

  uint64_t v63 = objc_msgSend_desc(v53, v60, v61, v62);
  objc_msgSend_setCompressionFootprint_(v63, v64, 0, v65);

  v69 = objc_msgSend_desc(v53, v66, v67, v68);
  objc_msgSend_setUsage_(v69, v70, 7, v71);

  uint64_t v75 = objc_msgSend_pixelFormat(v12, v72, v73, v74);
  v79 = objc_msgSend_desc(v53, v76, v77, v78);
  objc_msgSend_setPixelFormat_(v79, v80, v75, v81);

  uint64_t v85 = objc_msgSend_width(v12, v82, v83, v84);
  v89 = objc_msgSend_desc(v53, v86, v87, v88);
  objc_msgSend_setWidth_(v89, v90, v85, v91);

  uint64_t v95 = objc_msgSend_height(v12, v92, v93, v94);
  v99 = objc_msgSend_desc(v53, v96, v97, v98);
  objc_msgSend_setHeight_(v99, v100, v95, v101);

  objc_msgSend_setLabel_(v53, v102, 0, v103);
  v107 = objc_msgSend_allocator(self->_metal, v104, v105, v106);
  v110 = objc_msgSend_newTextureWithDescriptor_(v107, v108, (uint64_t)v53, v109);
  id v173 = v110;

  if (!v110)
  {
    FigDebugAssert3();
    int v164 = FigSignalErrorAt();

    goto LABEL_25;
  }
  v166 = v40;
  uint64_t v113 = (uint64_t)v14;
  uint64_t v114 = 2;
  if (v14) {
    uint64_t v114 = 4;
  }
  v115 = (id *)(&self->super.isa + (v114 | (v48 != 0)));
  objc_msgSend_setComputePipelineState_(v47, v111, (uint64_t)self->_pipelineStates[1], v112);
  objc_msgSend_setTexture_atIndex_(v47, v116, (uint64_t)v12, 0);
  objc_msgSend_setTexture_atIndex_(v47, v117, (uint64_t)v110, 1);
  objc_msgSend_setBytes_length_atIndex_(v47, v118, (uint64_t)v174, 4, 0);
  unint64_t v122 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[1], v119, v120, v121);
  unint64_t v126 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[1], v123, v124, v125) / v122;
  v172[0] = (unint64_t)objc_msgSend_width(v167, v127, v128, v129) >> 1;
  v172[1] = (unint64_t)objc_msgSend_height(v167, v130, v131, v132) >> 1;
  v29 = v167;
  v172[2] = 1;
  v171[0] = v122;
  v171[1] = v126;
  v171[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v47, v133, (uint64_t)v172, (uint64_t)v171);
  id v134 = v115[2];
  objc_msgSend_setComputePipelineState_(v47, v135, (uint64_t)v134, v136);
  uint64_t v137 = (uint64_t)v110;
  id v13 = v48;
  objc_msgSend_setTexture_atIndex_(v47, v138, v137, 0);
  objc_msgSend_setTexture_atIndex_(v47, v139, (uint64_t)v167, 2);
  objc_msgSend_setBytes_length_atIndex_(v47, v140, (uint64_t)v174, 4, 0);
  if (v48)
  {
    objc_msgSend_floatValue(v48, v141, v142, v143);
    int v170 = v144;
    objc_msgSend_setBytes_length_atIndex_(v47, v145, (uint64_t)&v170, 4, 1);
  }
  if (v113) {
    objc_msgSend_setTexture_atIndex_(v47, v141, v113, 1);
  }
  unint64_t v146 = objc_msgSend_threadExecutionWidth(v134, v141, v142, v143);
  unint64_t v150 = objc_msgSend_maxTotalThreadsPerThreadgroup(v134, v147, v148, v149) / v146;
  v169[0] = (unint64_t)objc_msgSend_width(v167, v151, v152, v153) >> 1;
  v169[1] = (unint64_t)objc_msgSend_height(v167, v154, v155, v156) >> 1;
  id v14 = (id)v113;
  v169[2] = 1;
  v168[0] = v146;
  v168[1] = v150;
  v168[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v47, v157, (uint64_t)v169, (uint64_t)v168);
  objc_msgSend_endEncoding(v47, v158, v159, v160);
  v40 = v166;
  objc_msgSend_commit(v166, v161, v162, v163);
  FigMetalDecRef();

  int v164 = 0;
LABEL_19:

  return v164;
}

- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5
{
  return objc_msgSend_dilateTexture_withNormalizedRadius_withThreshold_subtractTexture_output_(self, a2, (uint64_t)a3, 0, 0, a5);
}

- (int)erodeTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v13 = objc_msgSend_width(v8, v10, v11, v12);
  if (v13 <= objc_msgSend_height(v8, v14, v15, v16)) {
    uint64_t v20 = objc_msgSend_height(v8, v17, v18, v19);
  }
  else {
    uint64_t v20 = objc_msgSend_width(v8, v17, v18, v19);
  }
  v160[0] = (float)((float)(unint64_t)v20 * a4);
  id v159 = 0;
  if ((objc_msgSend_width(v9, v21, v22, v23) & 1) != 0
    || (objc_msgSend_height(v9, v24, v25, v26) & 1) != 0
    || (objc_msgSend_commandQueue(self->_metal, v27, v28, v29),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v30, v31, v32, v33),
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        v30,
        !v34))
  {
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v38 = objc_msgSend_computeCommandEncoder(v34, v35, v36, v37);
  if (!v38)
  {
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
LABEL_17:

    goto LABEL_11;
  }
  uint64_t v42 = (void *)v38;
  uint64_t v43 = objc_msgSend_allocator(self->_metal, v39, v40, v41);
  v47 = objc_msgSend_newTextureDescriptor(v43, v44, v45, v46);

  if (!v47)
  {
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v51 = objc_msgSend_desc(v47, v48, v49, v50);
  objc_msgSend_setCompressionMode_(v51, v52, 2, v53);

  v57 = objc_msgSend_desc(v47, v54, v55, v56);
  objc_msgSend_setCompressionFootprint_(v57, v58, 0, v59);

  uint64_t v63 = objc_msgSend_desc(v47, v60, v61, v62);
  objc_msgSend_setUsage_(v63, v64, 7, v65);

  uint64_t v69 = objc_msgSend_pixelFormat(v8, v66, v67, v68);
  uint64_t v73 = objc_msgSend_desc(v47, v70, v71, v72);
  objc_msgSend_setPixelFormat_(v73, v74, v69, v75);

  uint64_t v79 = objc_msgSend_width(v8, v76, v77, v78);
  uint64_t v83 = objc_msgSend_desc(v47, v80, v81, v82);
  objc_msgSend_setWidth_(v83, v84, v79, v85);

  uint64_t v89 = objc_msgSend_height(v8, v86, v87, v88);
  uint64_t v93 = objc_msgSend_desc(v47, v90, v91, v92);
  objc_msgSend_setHeight_(v93, v94, v89, v95);

  objc_msgSend_setLabel_(v47, v96, 0, v97);
  uint64_t v101 = objc_msgSend_allocator(self->_metal, v98, v99, v100);
  v104 = objc_msgSend_newTextureWithDescriptor_(v101, v102, (uint64_t)v47, v103);
  id v159 = v104;

  if (!v104)
  {
    FigDebugAssert3();
    int v152 = FigSignalErrorAt();

    goto LABEL_16;
  }
  objc_msgSend_setComputePipelineState_(v42, v105, (uint64_t)self->_pipelineStates[5], v106);
  objc_msgSend_setTexture_atIndex_(v42, v107, (uint64_t)v8, 0);
  objc_msgSend_setTexture_atIndex_(v42, v108, (uint64_t)v104, 1);
  objc_msgSend_setBytes_length_atIndex_(v42, v109, (uint64_t)v160, 4, 0);
  unint64_t v113 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[5], v110, v111, v112);
  unint64_t v117 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[5], v114, v115, v116) / v113;
  id v154 = v8;
  uint64_t v121 = v34;
  v158[0] = (unint64_t)objc_msgSend_width(v9, v118, v119, v120) >> 1;
  v158[1] = (unint64_t)objc_msgSend_height(v9, v122, v123, v124) >> 1;
  v158[2] = 1;
  v157[0] = v113;
  v157[1] = v117;
  v157[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v42, v125, (uint64_t)v158, (uint64_t)v157);
  objc_msgSend_setComputePipelineState_(v42, v126, (uint64_t)self->_pipelineStates[6], v127);
  objc_msgSend_setTexture_atIndex_(v42, v128, (uint64_t)v104, 0);
  objc_msgSend_setTexture_atIndex_(v42, v129, (uint64_t)v9, 1);
  objc_msgSend_setBytes_length_atIndex_(v42, v130, (uint64_t)v160, 4, 0);
  unint64_t v134 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[6], v131, v132, v133);
  unint64_t v138 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[6], v135, v136, v137) / v134;
  v156[0] = (unint64_t)objc_msgSend_width(v9, v139, v140, v141) >> 1;
  v156[1] = (unint64_t)objc_msgSend_height(v9, v142, v143, v144) >> 1;
  v156[2] = 1;
  v155[0] = v134;
  v155[1] = v138;
  v155[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v42, v145, (uint64_t)v156, (uint64_t)v155);
  objc_msgSend_endEncoding(v42, v146, v147, v148);
  objc_msgSend_commit(v121, v149, v150, v151);
  FigMetalDecRef();

  id v8 = v154;
  int v152 = 0;
LABEL_11:

  return v152;
}

- (int)boxFilter:(id)a3 withRadius:(unsigned int)a4 output:(id)a5
{
  id v8 = a3;
  unsigned int v148 = a4;
  id v9 = a5;
  id v147 = 0;
  if ((objc_msgSend_width(v9, v10, v11, v12) & 1) != 0
    || (objc_msgSend_height(v9, v13, v14, v15) & 1) != 0
    || (objc_msgSend_commandQueue(self->_metal, v16, v17, v18),
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v19, v20, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        v19,
        !v23))
  {
    FigDebugAssert3();
    int v141 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v27 = objc_msgSend_computeCommandEncoder(v23, v24, v25, v26);
  if (!v27)
  {
    FigDebugAssert3();
    int v141 = FigSignalErrorAt();
LABEL_14:

    goto LABEL_8;
  }
  uint64_t v31 = (void *)v27;
  uint64_t v32 = objc_msgSend_allocator(self->_metal, v28, v29, v30);
  uint64_t v36 = objc_msgSend_newTextureDescriptor(v32, v33, v34, v35);

  if (!v36)
  {
    FigDebugAssert3();
    int v141 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v40 = objc_msgSend_desc(v36, v37, v38, v39);
  objc_msgSend_setCompressionMode_(v40, v41, 2, v42);

  uint64_t v46 = objc_msgSend_desc(v36, v43, v44, v45);
  objc_msgSend_setCompressionFootprint_(v46, v47, 0, v48);

  uint64_t v52 = objc_msgSend_desc(v36, v49, v50, v51);
  objc_msgSend_setUsage_(v52, v53, 7, v54);

  uint64_t v58 = objc_msgSend_pixelFormat(v8, v55, v56, v57);
  uint64_t v62 = objc_msgSend_desc(v36, v59, v60, v61);
  objc_msgSend_setPixelFormat_(v62, v63, v58, v64);

  uint64_t v68 = objc_msgSend_width(v8, v65, v66, v67);
  uint64_t v72 = objc_msgSend_desc(v36, v69, v70, v71);
  objc_msgSend_setWidth_(v72, v73, v68, v74);

  uint64_t v78 = objc_msgSend_height(v8, v75, v76, v77);
  uint64_t v82 = objc_msgSend_desc(v36, v79, v80, v81);
  objc_msgSend_setHeight_(v82, v83, v78, v84);

  objc_msgSend_setLabel_(v36, v85, 0, v86);
  v90 = objc_msgSend_allocator(self->_metal, v87, v88, v89);
  uint64_t v93 = objc_msgSend_newTextureWithDescriptor_(v90, v91, (uint64_t)v36, v92);
  id v147 = v93;

  if (!v93)
  {
    FigDebugAssert3();
    int v141 = FigSignalErrorAt();

    goto LABEL_13;
  }
  objc_msgSend_setComputePipelineState_(v31, v94, (uint64_t)self->_pipelineStates[7], v95);
  objc_msgSend_setTexture_atIndex_(v31, v96, (uint64_t)v8, 0);
  objc_msgSend_setTexture_atIndex_(v31, v97, (uint64_t)v93, 1);
  objc_msgSend_setBytes_length_atIndex_(v31, v98, (uint64_t)&v148, 4, 0);
  unint64_t v102 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[7], v99, v100, v101);
  unint64_t v106 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[7], v103, v104, v105) / v102;
  id v110 = v8;
  v146[0] = (unint64_t)objc_msgSend_width(v9, v107, v108, v109) >> 1;
  v146[1] = (unint64_t)objc_msgSend_height(v9, v111, v112, v113) >> 1;
  v146[2] = 1;
  v145[0] = v102;
  v145[1] = v106;
  v145[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v31, v114, (uint64_t)v146, (uint64_t)v145);
  objc_msgSend_setComputePipelineState_(v31, v115, (uint64_t)self->_pipelineStates[8], v116);
  objc_msgSend_setTexture_atIndex_(v31, v117, (uint64_t)v93, 0);
  objc_msgSend_setTexture_atIndex_(v31, v118, (uint64_t)v9, 1);
  objc_msgSend_setBytes_length_atIndex_(v31, v119, (uint64_t)&v148, 4, 0);
  unint64_t v123 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[8], v120, v121, v122);
  unint64_t v127 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[8], v124, v125, v126) / v123;
  v144[0] = (unint64_t)objc_msgSend_width(v9, v128, v129, v130) >> 1;
  v144[1] = (unint64_t)objc_msgSend_height(v9, v131, v132, v133) >> 1;
  v144[2] = 1;
  v143[0] = v123;
  v143[1] = v127;
  id v8 = v110;
  v143[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v31, v134, (uint64_t)v144, (uint64_t)v143);
  objc_msgSend_endEncoding(v31, v135, v136, v137);
  objc_msgSend_commit(v23, v138, v139, v140);
  FigMetalDecRef();

  int v141 = 0;
LABEL_8:

  return v141;
}

- (int)extractFaceBodyBoundariesFromFaceLandMarks:(GreenGhostCommon *)self ev0FrameMetadata:(SEL)a2 imgSize:(id)a3 faceBoundaryPaddingRatio:(const frameMetadata *)a4 bodyBoundaryPaddingRatio:(CGSize)a5 output:(FaceBodyBoundaries *)a6
{
  float v9 = v7;
  float v10 = v6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v14 = (_DWORD *)&a4->faces[1].rect.origin.y + 1;
  id v15 = a3;
  memset(&v53, 0, sizeof(v53));
  unsigned int v19 = objc_msgSend_count(v15, v16, v17, v18);
  unsigned int v20 = *v14;
  if (v19) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v20 == 0;
  }
  int v22 = !v21;
  if (!a6)
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
    goto LABEL_29;
  }
  if (!v22) {
    unsigned int v20 = v19;
  }
  if (v20 >= 0xA) {
    uint64_t v23 = 10;
  }
  else {
    uint64_t v23 = v20;
  }
  a6->uint64_t nFaces = v23;
  unsigned int v24 = v14[101];
  a6[44].uint64_t nFaces = v24;
  if (!(v23 | v24))
  {
    FigDebugAssert3();
LABEL_28:
    int v50 = 0;
    goto LABEL_29;
  }
  if (v22)
  {
    if (v23)
    {
      uint64_t v25 = a6 + 4;
      uint64_t v26 = (double *)(v14 + 7);
      do
      {
        *(float32x2_t *)&long long v27 = sub_262FA4178(*(v26 - 3), *(v26 - 2), *(v26 - 1), *v26, width, height, v10);
        *(_OWORD *)&v25->uint64_t nFaces = v27;
        v25 += 4;
        v26 += 5;
        --v23;
      }
      while (v23);
    }
    goto LABEL_25;
  }
  double v30 = sub_262F8A92C(a4->exifOrientation, (uint64_t)&v53);
  if (!a6->nFaces)
  {
LABEL_25:
    uint64_t nFaces = a6[44].nFaces;
    if (nFaces)
    {
      v47 = a6 + 48;
      uint64_t v48 = (double *)(v14 + 109);
      do
      {
        *(float32x2_t *)&long long v49 = sub_262FA4178(*(v48 - 3), *(v48 - 2), *(v48 - 1), *v48, width, height, v9);
        *(_OWORD *)&v47->uint64_t nFaces = v49;
        v47 += 4;
        v48 += 5;
        --nFaces;
      }
      while (nFaces);
    }
    goto LABEL_28;
  }
  uint64_t v31 = 0;
  while (1)
  {
    uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(v15, v28, v31, v29, v30);
    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x2050000000;
    uint64_t v36 = (void *)qword_26A99A528;
    uint64_t v57 = qword_26A99A528;
    if (!qword_26A99A528)
    {
      *(void *)&v52.a = MEMORY[0x263EF8330];
      *(void *)&v52.b = 3221225472;
      *(void *)&v52.c = sub_262FA5CBC;
      *(void *)&v52.d = &unk_2655C3358;
      *(void *)&v52.tx = &v54;
      sub_262FA5CBC((uint64_t)&v52, v32, v33, v34);
      uint64_t v36 = (void *)v55[3];
    }
    id v37 = v36;
    _Block_object_dispose(&v54, 8);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      break;
    }
    uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v15, v39, v31, v40);
    objc_msgSend_boundingBox(v41, v42, v43, v44);
    CGAffineTransform v52 = v53;
    CGRect v59 = CGRectApplyAffineTransform(v58, &v52);
    *(float32x2_t *)&long long v45 = sub_262FA4178(v59.origin.x, v59.origin.y, v59.size.width, v59.size.height, width, height, v10);
    *(_OWORD *)&a6[4 * v31 + 4].uint64_t nFaces = v45;

    if (++v31 >= (unint64_t)a6->nFaces) {
      goto LABEL_25;
    }
  }
  FigDebugAssert3();
  int v50 = -12780;
LABEL_29:

  return v50;
}

- (int)brightnessDetectionInput:(id)a3 output:(id)a4 params:(BrightnessTuning)a5 processingROIInfo:(ProcessingROIInfo *)a6
{
  float v7 = v6;
  id v11 = a3;
  id v12 = a4;
  float var0 = a6->var0;
  float32x2_t v13 = vadd_f32(*(float32x2_t *)&a6[2].var0, *(float32x2_t *)&a6[2].var0);
  float v136 = (float)(unint64_t)objc_msgSend_width(v11, v14, v15, v16);
  uint64_t v20 = objc_msgSend_height(v11, v17, v18, v19);
  v21.f32[0] = v136;
  v21.f32[1] = (float)(unint64_t)v20;
  uint64_t v141 = *(void *)v7;
  float32x2_t v142 = vmul_f32(v13, v21);
  float v22 = v7[4];
  id v140 = 0;
  uint64_t v26 = objc_msgSend_commandQueue(self->_metal, v23, v24, v25);
  double v30 = objc_msgSend_commandBuffer(v26, v27, v28, v29);

  if (!v30
    || (objc_msgSend_computeCommandEncoder(v30, v31, v32, v33), (uint64_t v34 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v38 = (void *)v34;
  uint64_t v39 = objc_msgSend_allocator(self->_metal, v35, v36, v37);
  uint64_t v43 = objc_msgSend_newTextureDescriptor(v39, v40, v41, v42);

  if (!v43)
  {
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_9;
  }
  v47 = objc_msgSend_desc(v43, v44, v45, v46);
  objc_msgSend_setCompressionMode_(v47, v48, 2, v49);

  CGAffineTransform v53 = objc_msgSend_desc(v43, v50, v51, v52);
  objc_msgSend_setCompressionFootprint_(v53, v54, 0, v55);

  CGRect v59 = objc_msgSend_desc(v43, v56, v57, v58);
  objc_msgSend_setUsage_(v59, v60, 7, v61);

  uint64_t v65 = objc_msgSend_pixelFormat(v11, v62, v63, v64);
  uint64_t v69 = objc_msgSend_desc(v43, v66, v67, v68);
  objc_msgSend_setPixelFormat_(v69, v70, v65, v71);

  uint64_t v75 = objc_msgSend_width(v12, v72, v73, v74);
  uint64_t v79 = objc_msgSend_desc(v43, v76, v77, v78);
  objc_msgSend_setWidth_(v79, v80, v75, v81);

  uint64_t v85 = objc_msgSend_height(v12, v82, v83, v84);
  uint64_t v89 = objc_msgSend_desc(v43, v86, v87, v88);
  objc_msgSend_setHeight_(v89, v90, v85, v91);

  objc_msgSend_setLabel_(v43, v92, 0, v93);
  uint64_t v97 = objc_msgSend_allocator(self->_metal, v94, v95, v96);
  uint64_t v100 = objc_msgSend_newTextureWithDescriptor_(v97, v98, (uint64_t)v43, v99);
  id v140 = v100;

  if (!v100)
  {
    FigDebugAssert3();
    int v134 = FigSignalErrorAt();

    goto LABEL_13;
  }
  objc_msgSend_setComputePipelineState_(v38, v101, (uint64_t)self->_pipelineStates[10], v102);
  id v137 = v11;
  objc_msgSend_setTexture_atIndex_(v38, v103, (uint64_t)v11, 0);
  objc_msgSend_setTexture_atIndex_(v38, v104, (uint64_t)v12, 1);
  objc_msgSend_setBytes_length_atIndex_(v38, v105, (uint64_t)&var0, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v38, v106, (uint64_t)&v142, 8, 1);
  objc_msgSend_setBytes_length_atIndex_(v38, v107, (uint64_t)&v141, 8, 2);
  unint64_t v111 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[10], v108, v109, v110);
  unint64_t v115 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[10], v112, v113, v114) / v111;
  v139[0] = objc_msgSend_width(v12, v116, v117, v118);
  v139[1] = objc_msgSend_height(v12, v119, v120, v121);
  v139[2] = 1;
  v138[0] = v111;
  v138[1] = v115;
  v138[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v38, v122, (uint64_t)v139, (uint64_t)v138);
  objc_msgSend_endEncoding(v38, v123, v124, v125);
  objc_msgSend_commit(v30, v126, v127, v128);
  *(float *)&double v129 = v22 * a6[5].var0;
  int v131 = objc_msgSend_erodeTexture_withNormalizedRadius_output_(self, v130, (uint64_t)v12, (uint64_t)v100, v129);
  if (v131)
  {
    int v134 = v131;
    goto LABEL_15;
  }
  *(float *)&double v133 = v22 * a6[4].var0;
  int v134 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self, v132, (uint64_t)v100, (uint64_t)v12, v133);
  if (v134)
  {
LABEL_15:
    FigDebugAssert3();
    goto LABEL_8;
  }
  FigMetalDecRef();
LABEL_8:

  id v11 = v137;
LABEL_9:

  return v134;
}

- (int)blobDetection:(id)a3 output:(id)a4 params:(BlobTuning)a5
{
  unint64_t v7 = v5;
  unint64_t v142 = v5;
  uint64_t v143 = v6;
  id v10 = a3;
  id v11 = a4;
  id v140 = 0;
  id v141 = 0;
  if ((objc_msgSend_width(v11, v12, v13, v14) & 1) != 0
    || (objc_msgSend_height(v11, v15, v16, v17) & 1) != 0
    || (objc_msgSend_allocator(self->_metal, v18, v19, v20),
        float32x2_t v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = objc_msgSend_newTextureDescriptor(v21, v22, v23, v24),
        v21,
        !v25))
  {
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v29 = objc_msgSend_desc(v25, v26, v27, v28);
  objc_msgSend_setCompressionMode_(v29, v30, 2, v31);

  uint64_t v35 = objc_msgSend_desc(v25, v32, v33, v34);
  objc_msgSend_setCompressionFootprint_(v35, v36, 0, v37);

  uint64_t v41 = objc_msgSend_pixelFormat(v10, v38, v39, v40);
  uint64_t v45 = objc_msgSend_desc(v25, v42, v43, v44);
  objc_msgSend_setPixelFormat_(v45, v46, v41, v47);

  uint64_t v51 = objc_msgSend_desc(v25, v48, v49, v50);
  objc_msgSend_setUsage_(v51, v52, 7, v53);

  uint64_t v57 = objc_msgSend_width(v10, v54, v55, v56);
  uint64_t v61 = objc_msgSend_desc(v25, v58, v59, v60);
  objc_msgSend_setWidth_(v61, v62, v57, v63);

  uint64_t v67 = objc_msgSend_height(v10, v64, v65, v66);
  uint64_t v71 = objc_msgSend_desc(v25, v68, v69, v70);
  objc_msgSend_setHeight_(v71, v72, v67, v73);

  objc_msgSend_setLabel_(v25, v74, 0, v75);
  uint64_t v79 = objc_msgSend_allocator(self->_metal, v76, v77, v78);
  uint64_t v82 = objc_msgSend_newTextureWithDescriptor_(v79, v80, (uint64_t)v25, v81);
  id v141 = v82;

  if (!v82) {
    goto LABEL_18;
  }
  int v84 = objc_msgSend_boxFilter_withRadius_output_(self, v83, (uint64_t)v10, v7, v82);
  if (v84)
  {
    int v136 = v84;
LABEL_17:
    FigDebugAssert3();
LABEL_19:

    goto LABEL_11;
  }
  objc_msgSend_setLabel_(v25, v85, 0, v86);
  v90 = objc_msgSend_allocator(self->_metal, v87, v88, v89);
  uint64_t v93 = objc_msgSend_newTextureWithDescriptor_(v90, v91, (uint64_t)v25, v92);
  id v140 = v93;

  if (!v93) {
    goto LABEL_18;
  }
  int v95 = objc_msgSend_boxFilter_withRadius_output_(self, v94, (uint64_t)v10, HIDWORD(v7), v93);
  if (v95)
  {
    int v136 = v95;
    goto LABEL_17;
  }
  uint64_t v99 = objc_msgSend_commandQueue(self->_metal, v96, v97, v98);
  uint64_t v103 = objc_msgSend_commandBuffer(v99, v100, v101, v102);

  if (!v103)
  {
LABEL_18:
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
    goto LABEL_19;
  }
  v107 = objc_msgSend_computeCommandEncoder(v103, v104, v105, v106);
  if (v107)
  {
    uint64_t v110 = v107;
    objc_msgSend_setComputePipelineState_(v107, v108, (uint64_t)self->_pipelineStates[9], v109);
    objc_msgSend_setTexture_atIndex_(v110, v111, (uint64_t)v82, 0);
    objc_msgSend_setTexture_atIndex_(v110, v112, (uint64_t)v93, 1);
    objc_msgSend_setTexture_atIndex_(v110, v113, (uint64_t)v11, 2);
    objc_msgSend_setBytes_length_atIndex_(v110, v114, (uint64_t)&v143, 4, 0);
    unint64_t v118 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[9], v115, v116, v117);
    unint64_t v122 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[9], v119, v120, v121) / v118;
    v139[0] = (unint64_t)objc_msgSend_width(v11, v123, v124, v125) >> 1;
    v139[1] = (unint64_t)objc_msgSend_height(v11, v126, v127, v128) >> 1;
    v139[2] = 1;
    v138[0] = v118;
    v138[1] = v122;
    v138[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v110, v129, (uint64_t)v139, (uint64_t)v138);
    objc_msgSend_endEncoding(v110, v130, v131, v132);
    objc_msgSend_commit(v103, v133, v134, v135);
    FigMetalDecRef();
    FigMetalDecRef();

    int v136 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v136 = FigSignalErrorAt();
  }
LABEL_11:

  return v136;
}

- (int)greenDetectionLuma:(id)a3 chroma:(id)a4 output:(id)a5 params:(GreenTuning)a6 processingROIInfo:(ProcessingROIInfo *)a7
{
  uint64_t v8 = v7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v137 = 0;
  float v16 = *(float *)(v8 + 16);
  uint64_t v20 = objc_msgSend_commandQueue(self->_metal, v17, v18, v19);
  uint64_t v24 = objc_msgSend_commandBuffer(v20, v21, v22, v23);

  if (!v24)
  {
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
    uint64_t v32 = v15;
    goto LABEL_12;
  }
  uint64_t v28 = objc_msgSend_computeCommandEncoder(v24, v25, v26, v27);
  uint64_t v32 = v15;
  if (!v28)
  {
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
    goto LABEL_12;
  }
  uint64_t v33 = (void *)v28;
  uint64_t v134 = v24;
  uint64_t v34 = objc_msgSend_allocator(self->_metal, v29, v30, v31);
  uint64_t v38 = objc_msgSend_newTextureDescriptor(v34, v35, v36, v37);

  if (!v38)
  {
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
    goto LABEL_10;
  }
  uint64_t v42 = objc_msgSend_desc(v38, v39, v40, v41);
  objc_msgSend_setCompressionMode_(v42, v43, 2, v44);

  uint64_t v48 = objc_msgSend_desc(v38, v45, v46, v47);
  objc_msgSend_setCompressionFootprint_(v48, v49, 0, v50);

  uint64_t v54 = objc_msgSend_desc(v38, v51, v52, v53);
  objc_msgSend_setUsage_(v54, v55, 7, v56);

  uint64_t v60 = objc_msgSend_pixelFormat(v13, v57, v58, v59);
  uint64_t v64 = objc_msgSend_desc(v38, v61, v62, v63);
  objc_msgSend_setPixelFormat_(v64, v65, v60, v66);

  uint64_t v70 = objc_msgSend_width(v13, v67, v68, v69);
  uint64_t v74 = objc_msgSend_desc(v38, v71, v72, v73);
  objc_msgSend_setWidth_(v74, v75, v70, v76);

  uint64_t v80 = objc_msgSend_height(v13, v77, v78, v79);
  int v84 = objc_msgSend_desc(v38, v81, v82, v83);
  objc_msgSend_setHeight_(v84, v85, v80, v86);

  objc_msgSend_setLabel_(v38, v87, 0, v88);
  uint64_t v92 = objc_msgSend_allocator(self->_metal, v89, v90, v91);
  int v95 = objc_msgSend_newTextureWithDescriptor_(v92, v93, (uint64_t)v38, v94);
  id v137 = v95;

  if (!v95)
  {
    FigDebugAssert3();
    int v131 = FigSignalErrorAt();
    goto LABEL_9;
  }
  objc_msgSend_setComputePipelineState_(v33, v96, (uint64_t)self->_pipelineStates[11], v97);
  id v133 = v13;
  objc_msgSend_setTexture_atIndex_(v33, v98, (uint64_t)v13, 0);
  objc_msgSend_setTexture_atIndex_(v33, v99, (uint64_t)v14, 1);
  objc_msgSend_setTexture_atIndex_(v33, v100, (uint64_t)v95, 2);
  objc_msgSend_setBytes_length_atIndex_(v33, v101, (uint64_t)a7, 40, 0);
  unint64_t v105 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[11], v102, v103, v104);
  unint64_t v109 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[11], v106, v107, v108) / v105;
  v136[0] = objc_msgSend_width(v15, v110, v111, v112);
  v136[1] = objc_msgSend_height(v15, v113, v114, v115);
  v136[2] = 1;
  v135[0] = v105;
  v135[1] = v109;
  v135[2] = 1;
  uint64_t v32 = v15;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v33, v116, (uint64_t)v136, (uint64_t)v135);
  objc_msgSend_endEncoding(v33, v117, v118, v119);
  objc_msgSend_commit(v134, v120, v121, v122);
  *(float *)&double v123 = v16 * a7[8].var0;
  int v125 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self, v124, (uint64_t)v95, (uint64_t)v15, v123);
  if (v125)
  {
    int v131 = v125;
    FigDebugAssert3();

    id v13 = v133;
    goto LABEL_11;
  }
  *(float *)&double v127 = v16 * a7[8].var0;
  int v128 = objc_msgSend_erodeTexture_withNormalizedRadius_output_(self, v126, (uint64_t)v15, (uint64_t)v95, v127);
  id v13 = v133;
  if (v128)
  {
    int v131 = v128;
    goto LABEL_19;
  }
  *(float *)&double v130 = v16 * a7[9].var0;
  int v131 = objc_msgSend_dilateTexture_withNormalizedRadius_output_(self, v129, (uint64_t)v95, (uint64_t)v15, v130);
  if (v131)
  {
LABEL_19:
    FigDebugAssert3();
    goto LABEL_9;
  }
  FigMetalDecRef();
LABEL_9:

LABEL_10:
LABEL_11:
  uint64_t v24 = v134;
LABEL_12:

  return v131;
}

- (int)combineBrightnessMask:(id)a3 blobMask:(id)a4 greenMask:(id)a5 output:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((objc_msgSend_width(v13, v14, v15, v16) & 1) != 0
    || (objc_msgSend_height(v13, v17, v18, v19) & 1) != 0
    || (objc_msgSend_commandQueue(self->_metal, v20, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v23, v24, v25, v26),
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v27))
  {
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
  }
  else
  {
    uint64_t v31 = objc_msgSend_computeCommandEncoder(v27, v28, v29, v30);
    if (v31)
    {
      uint64_t v34 = v31;
      objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)self->_pipelineStates[12], v33);
      objc_msgSend_setTexture_atIndex_(v34, v35, (uint64_t)v10, 0);
      objc_msgSend_setTexture_atIndex_(v34, v36, (uint64_t)v11, 1);
      objc_msgSend_setTexture_atIndex_(v34, v37, (uint64_t)v12, 2);
      objc_msgSend_setTexture_atIndex_(v34, v38, (uint64_t)v13, 3);
      unint64_t v42 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[12], v39, v40, v41);
      unint64_t v46 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[12], v43, v44, v45) / v42;
      v63[0] = (unint64_t)objc_msgSend_width(v13, v47, v48, v49) >> 1;
      v63[1] = (unint64_t)objc_msgSend_height(v13, v50, v51, v52) >> 1;
      v63[2] = 1;
      v62[0] = v42;
      v62[1] = v46;
      v62[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v34, v53, (uint64_t)v63, (uint64_t)v62);
      objc_msgSend_endEncoding(v34, v54, v55, v56);
      objc_msgSend_commit(v27, v57, v58, v59);

      int v60 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();
    }
  }

  return v60;
}

- (int)detectionWithLuma:(id)a3 croppedLuma:(id)a4 chroma:(id)a5 outputMask:(id)a6 params:(DetectionTuning *)a7 processingROIInfo:(ProcessingROIInfo *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v112 = a5;
  id v16 = a6;
  id v118 = 0;
  id v116 = 0;
  id v117 = 0;
  uint64_t v20 = objc_msgSend_allocator(self->_metal, v17, v18, v19);
  uint64_t v24 = objc_msgSend_newTextureDescriptor(v20, v21, v22, v23);

  uint64_t v111 = v14;
  if (!v24) {
    goto LABEL_17;
  }
  uint64_t v28 = objc_msgSend_desc(v24, v25, v26, v27);
  objc_msgSend_setCompressionMode_(v28, v29, 2, v30);

  uint64_t v34 = objc_msgSend_desc(v24, v31, v32, v33);
  objc_msgSend_setCompressionFootprint_(v34, v35, 0, v36);

  uint64_t v40 = objc_msgSend_desc(v24, v37, v38, v39);
  objc_msgSend_setUsage_(v40, v41, 7, v42);

  uint64_t v46 = objc_msgSend_pixelFormat(v16, v43, v44, v45);
  uint64_t v50 = objc_msgSend_desc(v24, v47, v48, v49);
  objc_msgSend_setPixelFormat_(v50, v51, v46, v52);

  uint64_t v56 = objc_msgSend_width(v16, v53, v54, v55);
  int v60 = objc_msgSend_desc(v24, v57, v58, v59);
  objc_msgSend_setWidth_(v60, v61, v56, v62);

  uint64_t v66 = objc_msgSend_height(v16, v63, v64, v65);
  uint64_t v70 = objc_msgSend_desc(v24, v67, v68, v69);
  objc_msgSend_setHeight_(v70, v71, v66, v72);

  objc_msgSend_setLabel_(v24, v73, 0, v74);
  uint64_t v78 = objc_msgSend_allocator(self->_metal, v75, v76, v77);
  uint64_t v81 = objc_msgSend_newTextureWithDescriptor_(v78, v79, (uint64_t)v24, v80);
  id v118 = v81;

  if (!v81) {
    goto LABEL_17;
  }
  long long v113 = *(_OWORD *)&a7->var0.var0;
  *(void *)&long long v114 = *(void *)&a7->var2.var0;
  int v83 = objc_msgSend_brightnessDetectionInput_output_params_processingROIInfo_(self, v82, (uint64_t)v14, (uint64_t)v81, &v113, a8);
  if (v83)
  {
    int v109 = v83;
LABEL_16:
    FigDebugAssert3();
LABEL_18:
    uint64_t v106 = v112;
    goto LABEL_10;
  }
  objc_msgSend_setLabel_(v24, v84, 0, v85);
  uint64_t v89 = objc_msgSend_allocator(self->_metal, v86, v87, v88);
  uint64_t v92 = objc_msgSend_newTextureWithDescriptor_(v89, v90, (uint64_t)v24, v91);
  id v117 = v92;

  if (!v92) {
    goto LABEL_17;
  }
  int v94 = objc_msgSend_blobDetection_output_params_(self, v93, (uint64_t)v15, (uint64_t)v92, *(void *)&a7->var2.var2, *(void *)&a7[1].var0.var1);
  if (v94)
  {
    int v109 = v94;
    goto LABEL_16;
  }
  objc_msgSend_setLabel_(v24, v95, 0, v96);
  uint64_t v100 = objc_msgSend_allocator(self->_metal, v97, v98, v99);
  uint64_t v103 = objc_msgSend_newTextureWithDescriptor_(v100, v101, (uint64_t)v24, v102);
  id v116 = v103;

  if (!v103)
  {
LABEL_17:
    FigDebugAssert3();
    int v109 = FigSignalErrorAt();
    goto LABEL_18;
  }
  long long v105 = *(_OWORD *)&a7[2].var0.var0;
  long long v113 = *(_OWORD *)&a7[1].var1.var0;
  long long v114 = v105;
  uint64_t v115 = *(void *)&a7[2].var2.var0;
  uint64_t v106 = v112;
  int v107 = objc_msgSend_greenDetectionLuma_chroma_output_params_processingROIInfo_(self, v104, (uint64_t)v15, (uint64_t)v112, v103, &v113, a8);
  if (v107)
  {
    int v109 = v107;
    goto LABEL_20;
  }
  int v109 = objc_msgSend_combineBrightnessMask_blobMask_greenMask_output_(self, v108, (uint64_t)v81, (uint64_t)v92, v103, v16);
  if (v109)
  {
LABEL_20:
    FigDebugAssert3();
    goto LABEL_10;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_10:

  return v109;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  for (uint64_t i = 112; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end