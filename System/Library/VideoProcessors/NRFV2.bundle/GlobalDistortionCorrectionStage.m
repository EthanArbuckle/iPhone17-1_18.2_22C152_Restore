@interface GlobalDistortionCorrectionStage
+ (int)prewarmShaders:(id)a3;
- (GlobalDistortionCorrectionStage)initWithMetalContext:(id)a3;
- (int)_copyTexture:(id)a3 outTex:(id)a4;
- (int)applyInplace:(__CVBuffer *)a3 gdcParams:(const GlobalDistortionCorrectionParameters *)a4 cscParams:(const ColorSpaceConversionParameters *)a5;
@end

@implementation GlobalDistortionCorrectionStage

- (GlobalDistortionCorrectionStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GlobalDistortionCorrectionStage;
  v6 = [(GlobalDistortionCorrectionStage *)&v19 init];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(GlobalDistortionCorrectionShared, v8, v9, v10);
    uint64_t v14 = objc_msgSend_getShaders_(v11, v12, v7[1], v13);
    v15 = (void *)v7[2];
    v7[2] = v14;

    v16 = v7;
    if (!v7[2])
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v16 = 0;
      }
      else {
        v16 = v7;
      }
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [GlobalDistortionCorrectionShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (int)applyInplace:(__CVBuffer *)a3 gdcParams:(const GlobalDistortionCorrectionParameters *)a4 cscParams:(const ColorSpaceConversionParameters *)a5
{
  uint64_t v6 = a3;
  id v262 = 0;
  id v263 = 0;
  if (!a3)
  {
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    int v8 = 0;
    v109 = 0;
    v244 = 0;
LABEL_35:
    uint64_t v16 = 0;
    goto LABEL_28;
  }
  if (!a4)
  {
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    int v8 = 0;
LABEL_34:
    v109 = 0;
    v244 = 0;
    uint64_t v6 = 0;
    goto LABEL_35;
  }
  int v8 = (ColorSpaceConversionParameters *)a5;
  if (!a5)
  {
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    goto LABEL_34;
  }
  int nonLinearPower_high = HIBYTE(a5[3].transferFunctionInv.nonLinearPower);
  v11 = [LumaChromaImage alloc];
  uint64_t v16 = objc_msgSend_initWithContext_pixelBuffer_lumaAlignmentFactor_chromaAlignmentFactor_(v11, v12, (uint64_t)self->_metal, (uint64_t)v6, 1, 1);
  v17 = *(void **)(v16 + 16);
  if (!v17 || !*(void *)(v16 + 24)) {
    goto LABEL_44;
  }
  if (nonLinearPower_high)
  {
    int v18 = objc_msgSend_bindYCbCrTexture_alignmentFactor_((void *)v16, v13, (uint64_t)self->_metal, 1);
    if (v18)
    {
      int v237 = v18;
      FigDebugAssert3();
LABEL_45:
      int v8 = 0;
      v109 = 0;
      v244 = 0;
      goto LABEL_46;
    }
    if (!*(void *)(v16 + 32))
    {
LABEL_44:
      FigDebugAssert3();
      int v237 = FigSignalErrorAt();
      goto LABEL_45;
    }
    v17 = *(void **)(v16 + 16);
  }
  unint64_t v19 = objc_msgSend_width(v17, v13, v14, v15);
  uint64_t v23 = objc_msgSend_height(*(void **)(v16 + 16), v20, v21, v22);
  v27 = objc_msgSend_allocator(self->_metal, v24, v25, v26);
  v31 = objc_msgSend_newTextureDescriptor(v27, v28, v29, v30);

  if (!v31) {
    goto LABEL_44;
  }
  v35 = objc_msgSend_desc(v31, v32, v33, v34);
  objc_msgSend_setWidth_(v35, v36, v19, v37);

  v41 = objc_msgSend_desc(v31, v38, v39, v40);
  objc_msgSend_setHeight_(v41, v42, v23, v43);

  v47 = objc_msgSend_desc(v31, v44, v45, v46);
  objc_msgSend_setUsage_(v47, v48, 3, v49);

  v53 = objc_msgSend_desc(v31, v50, v51, v52);
  objc_msgSend_setPixelFormat_(v53, v54, 25, v55);

  objc_msgSend_setLabel_(v31, v56, 0, v57);
  v61 = objc_msgSend_allocator(self->_metal, v58, v59, v60);
  unint64_t v65 = v23;
  v66 = objc_msgSend_newTextureDescriptor(v61, v62, v63, v64);

  v244 = v31;
  if (!v66)
  {
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    int v8 = 0;
    v109 = 0;
LABEL_46:
    uint64_t v6 = 0;
    goto LABEL_28;
  }
  uint64_t v248 = v19;
  v70 = objc_msgSend_desc(v66, v67, v68, v69);
  unint64_t v243 = v19 >> 1;
  objc_msgSend_setWidth_(v70, v71, v19 >> 1, v72);

  uint64_t v245 = v65;
  uint64_t v73 = v65 >> 1;
  v77 = objc_msgSend_desc(v66, v74, v75, v76);
  objc_msgSend_setHeight_(v77, v78, v73, v79);

  v83 = objc_msgSend_desc(v66, v80, v81, v82);
  objc_msgSend_setUsage_(v83, v84, 3, v85);

  v89 = objc_msgSend_desc(v66, v86, v87, v88);
  objc_msgSend_setPixelFormat_(v89, v90, 65, v91);

  objc_msgSend_setLabel_(v66, v92, 0, v93);
  v97 = objc_msgSend_commandQueue(self->_metal, v94, v95, v96);
  objc_msgSend_commandBuffer(v97, v98, v99, v100);
  v101 = (ColorSpaceConversionParameters *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (__CVBuffer *)v66;
  if (!v101)
  {
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    int v8 = 0;
    v109 = 0;
    goto LABEL_28;
  }
  uint64_t v105 = v73;
  v247 = v101;
  v109 = objc_msgSend_computeCommandEncoder(v101, v102, v103, v104);
  if (!v109)
  {
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    int v8 = v101;
    goto LABEL_28;
  }
  long long v110 = *(_OWORD *)&v8[3].transferFunctionFwd.linearThreshold;
  long long v111 = *(_OWORD *)&v8[3].transferFunctionInv.linearScale;
  long long v112 = *(_OWORD *)&v8[2].transferFunctionInv.linearThreshold;
  v261[9] = *(_OWORD *)&v8[2].finalScaleFwd;
  v261[10] = v110;
  long long v113 = *(_OWORD *)&v8[3].transferFunctionInv.nonLinearPower;
  v261[11] = v111;
  v261[12] = v113;
  long long v114 = *(_OWORD *)&v8[1].finalScale;
  long long v115 = *(_OWORD *)&v8[2].transferFunctionFwd.nonLinearScale;
  long long v116 = *(_OWORD *)&v8[1].transferFunctionFwd.nonLinearBias;
  v261[5] = *(_OWORD *)&v8[1].transferFunctionInv.nonLinearScale;
  v261[6] = v114;
  v261[7] = v115;
  v261[8] = v112;
  long long v117 = *(_OWORD *)&v8->transferFunctionInv.nonLinearBias;
  long long v118 = *(_OWORD *)&v8->outputToLinearYCbCr;
  long long v119 = *(_OWORD *)&v8->transferFunctionFwd.linearScale;
  v261[1] = *(_OWORD *)&v8->transferFunctionFwd.nonLinearPower;
  v261[2] = v117;
  v261[3] = v118;
  v261[4] = v116;
  long long v120 = *(_OWORD *)&a4->var2[2];
  v260[0] = *(_OWORD *)&a4->var0;
  v260[1] = v120;
  v260[2] = *(_OWORD *)&a4->var2[6];
  v261[0] = v119;
  uint64_t v246 = (uint64_t)v6;
  if (nonLinearPower_high)
  {
    v121 = objc_msgSend_allocator(self->_metal, v106, v107, v108);
    v124 = objc_msgSend_newTextureWithDescriptor_(v121, v122, (uint64_t)v6, v123);
    id v262 = v124;

    if (!v124)
    {
      FigDebugAssert3();
      int v237 = FigSignalErrorAt();
      uint64_t v6 = (__CVBuffer *)v246;
      int v8 = v101;
      goto LABEL_28;
    }
    v128 = objc_msgSend_allocator(self->_metal, v125, v126, v127);
    v131 = objc_msgSend_newTextureWithDescriptor_(v128, v129, (uint64_t)v31, v130);
    id v263 = v131;

    int v8 = v101;
    if (!v131)
    {
      FigDebugAssert3();
      int v237 = FigSignalErrorAt();
      goto LABEL_30;
    }
    objc_msgSend_setTexture_atIndex_(v109, v132, *(void *)(v16 + 32), 0);
    objc_msgSend_setTexture_atIndex_(v109, v133, (uint64_t)v131, 1);
    objc_msgSend_setTexture_atIndex_(v109, v134, (uint64_t)v124, 2);
    objc_msgSend_setBytes_length_atIndex_(v109, v135, (uint64_t)v260, 256, 0);
    objc_msgSend_setComputePipelineState_(v109, v136, (uint64_t)self->_shaders->_kernelGlobalDistortionCorrectionHWCSC, v137);
    v259[0] = v248;
    v259[1] = v245;
    v259[2] = 1;
    int64x2_t v257 = vdupq_n_s64(0x20uLL);
    uint64_t v258 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v109, v138, (uint64_t)v259, (uint64_t)&v257);
    objc_msgSend_endEncoding(v109, v139, v140, v141);
    objc_msgSend_commit(v101, v142, v143, v144);
    uint64_t v146 = v16;
    goto LABEL_25;
  }
  id v255 = 0;
  id v256 = 0;
  v147 = objc_msgSend_allocator(self->_metal, v106, v107, v108);
  v151 = objc_msgSend_newTextureDescriptor(v147, v148, v149, v150);

  uint64_t v242 = v16;
  if (v151)
  {
    v155 = objc_msgSend_desc(v151, v152, v153, v154);
    objc_msgSend_setWidth_(v155, v156, v248, v157);

    v161 = objc_msgSend_desc(v151, v158, v159, v160);
    objc_msgSend_setHeight_(v161, v162, v245, v163);

    v167 = objc_msgSend_desc(v151, v164, v165, v166);
    objc_msgSend_setUsage_(v167, v168, 3, v169);

    v173 = objc_msgSend_allocator(self->_metal, v170, v171, v172);
    v131 = objc_msgSend_newTextureWithDescriptor_(v173, v174, (uint64_t)v31, v175);
    id v263 = v131;

    if (v131)
    {
      v179 = objc_msgSend_allocator(self->_metal, v176, v177, v178);
      v182 = objc_msgSend_newTextureWithDescriptor_(v179, v180, v246, v181);
      id v262 = v182;

      if (v182)
      {
        v186 = objc_msgSend_desc(v151, v183, v184, v185);
        objc_msgSend_setPixelFormat_(v186, v187, 25, v188);

        objc_msgSend_setLabel_(v151, v189, 0, v190);
        v194 = objc_msgSend_allocator(self->_metal, v191, v192, v193);
        v197 = objc_msgSend_newTextureWithDescriptor_(v194, v195, (uint64_t)v151, v196);
        id v256 = v197;

        if (v197)
        {
          v201 = objc_msgSend_desc(v151, v198, v199, v200);
          objc_msgSend_setPixelFormat_(v201, v202, 65, v203);

          objc_msgSend_setLabel_(v151, v204, 0, v205);
          v209 = objc_msgSend_allocator(self->_metal, v206, v207, v208);
          v212 = objc_msgSend_newTextureWithDescriptor_(v209, v210, (uint64_t)v151, v211);
          id v255 = v212;

          if (v212)
          {
            objc_msgSend_setTexture_atIndex_(v109, v213, *(void *)(v16 + 16), 0);
            uint64_t v214 = *(void *)(v16 + 24);
            int v215 = 1;
            objc_msgSend_setTexture_atIndex_(v109, v216, v214, 1);
            objc_msgSend_setTexture_atIndex_(v109, v217, (uint64_t)v197, 2);
            objc_msgSend_setTexture_atIndex_(v109, v218, (uint64_t)v212, 3);
            objc_msgSend_setBytes_length_atIndex_(v109, v219, (uint64_t)v261, 208, 0);
            objc_msgSend_setComputePipelineState_(v109, v220, (uint64_t)self->_shaders->_kernelGlobalDistortionCorrectionSWCSCtoLinearRGB, v221);
            v254[0] = v243;
            v254[1] = v105;
            v254[2] = 1;
            int64x2_t v252 = vdupq_n_s64(8uLL);
            uint64_t v253 = 1;
            objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v109, v222, (uint64_t)v254, (uint64_t)&v252);
            objc_msgSend_setTexture_atIndex_(v109, v223, (uint64_t)v197, 0);
            objc_msgSend_setTexture_atIndex_(v109, v224, (uint64_t)v212, 1);
            objc_msgSend_setTexture_atIndex_(v109, v225, (uint64_t)v131, 2);
            objc_msgSend_setTexture_atIndex_(v109, v226, (uint64_t)v182, 3);
            objc_msgSend_setBytes_length_atIndex_(v109, v227, (uint64_t)v260, 256, 0);
            objc_msgSend_setComputePipelineState_(v109, v228, (uint64_t)self->_shaders->_kernelGlobalDistortionCorrectionLinearRGB, v229);
            v251[0] = v248;
            v251[1] = v245;
            v251[2] = 1;
            int64x2_t v249 = vdupq_n_s64(0x10uLL);
            uint64_t v250 = 1;
            objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v109, v230, (uint64_t)v251, (uint64_t)&v249);
            objc_msgSend_endEncoding(v109, v231, v232, v233);
            objc_msgSend_commit(v247, v234, v235, v236);
            FigMetalDecRef();
            FigMetalDecRef();

            int v237 = 0;
            goto LABEL_24;
          }
          uint64_t v241 = v5;
          int v240 = 0;
        }
        else
        {
          uint64_t v241 = v5;
          int v240 = 0;
        }
      }
      else
      {
        uint64_t v241 = v5;
        int v240 = 0;
      }
    }
    else
    {
      uint64_t v241 = v5;
      int v240 = 0;
    }
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
  }
  else
  {
    uint64_t v241 = v5;
    int v240 = 0;
    FigDebugAssert3();
    int v237 = FigSignalErrorAt();
    v131 = 0;
  }
  int v215 = 0;
LABEL_24:

  uint64_t v146 = v242;
  int v8 = v247;
  if (!v215)
  {
    uint64_t v16 = v242;
LABEL_30:
    uint64_t v6 = (__CVBuffer *)v246;
    goto LABEL_28;
  }
LABEL_25:
  int v237 = objc_msgSend__copyTexture_outTex_(self, v145, (uint64_t)v131, *(void *)(v146 + 16), v240, v241);
  FigMetalDecRef();
  uint64_t v16 = v146;
  if (v237)
  {
    FigDebugAssert3();
    goto LABEL_30;
  }
  int v237 = objc_msgSend__copyTexture_outTex_(self, v238, (uint64_t)v262, *(void *)(v146 + 24));
  FigMetalDecRef();
  uint64_t v6 = (__CVBuffer *)v246;
  if (v237) {
    FigDebugAssert3();
  }
LABEL_28:

  return v237;
}

- (int)_copyTexture:(id)a3 outTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = objc_msgSend_commandQueue(self->_metal, v8, v9, v10);
  uint64_t v15 = objc_msgSend_commandBuffer(v11, v12, v13, v14);

  if (!v15
    || (objc_msgSend_computeCommandEncoder(v15, v16, v17, v18), (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
    uint64_t v33 = v7;
    goto LABEL_19;
  }
  uint64_t v23 = (void *)v19;
  int isCompressed = objc_msgSend_isCompressed(v7, v20, v21, v22);
  if (isCompressed) {
    uint64_t v28 = 32;
  }
  else {
    uint64_t v28 = 4;
  }
  if (isCompressed) {
    uint64_t v29 = 32;
  }
  else {
    uint64_t v29 = 64;
  }
  if ((objc_msgSend_isCompressed(v7, v25, v26, v27) & 1) != 0 || objc_msgSend_pixelFormat(v7, v30, v31, v32) != 588)
  {
    if ((objc_msgSend_isCompressed(v7, v30, v31, v32) & 1) != 0 || objc_msgSend_pixelFormat(v7, v34, v37, v35) != 589)
    {
      uint64_t v36 = 16;
      uint64_t v33 = v7;
      goto LABEL_18;
    }
    uint64_t v33 = objc_msgSend_rebindTex_format_usage_plane_xFactor_(self->_metal, v34, (uint64_t)v7, 103, 6, 1, 3);

    if (v33)
    {
      uint64_t v36 = 32;
      goto LABEL_18;
    }
LABEL_21:
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();

    goto LABEL_19;
  }
  uint64_t v33 = objc_msgSend_rebindTex_format_usage_plane_xFactor_(self->_metal, v30, (uint64_t)v7, 53, 6, 0, 3);

  if (!v33) {
    goto LABEL_21;
  }
  uint64_t v36 = 24;
LABEL_18:
  objc_msgSend_setComputePipelineState_(v23, v34, *(uint64_t *)((char *)&self->_shaders->super.isa + v36), v35);
  objc_msgSend_setTexture_atIndex_(v23, v38, (uint64_t)v6, 0);
  objc_msgSend_setTexture_atIndex_(v23, v39, (uint64_t)v33, 1);
  v56[0] = objc_msgSend_width(v33, v40, v41, v42);
  v56[1] = objc_msgSend_height(v33, v43, v44, v45);
  v56[2] = 1;
  v55[0] = v29;
  v55[1] = v28;
  v55[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v23, v46, (uint64_t)v56, (uint64_t)v55);
  objc_msgSend_endEncoding(v23, v47, v48, v49);
  objc_msgSend_commit(v15, v50, v51, v52);

  int v53 = 0;
LABEL_19:

  return v53;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end