@interface DeepFusionLaplacianPyramid
- (DeepFusionLaplacianPyramid)initWithMetalContext:(id)a3;
- (int)_performLaplacianPyramid:(id)a3 inputTextures:(id)a4 destinationTextures:(id)a5 upsamplingFilter:(int)a6;
- (int)_validateInputs:(id)a3 gaussianPyramid:(id)a4;
- (int)computeUsing:(id)a3 gaussianPyramid:(id)a4 upsamplingFilter:(int)a5;
- (int)upsampleUsing:(id)a3 inputTex:(id)a4 outputTexUpsampled:(id)a5 upsamplingFilter:(int)a6;
@end

@implementation DeepFusionLaplacianPyramid

- (DeepFusionLaplacianPyramid)initWithMetalContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DeepFusionLaplacianPyramid;
  return [(DeepFusionPyramidBaseClass *)&v4 initWithMetalContext:a3];
}

- (int)upsampleUsing:(id)a3 inputTex:(id)a4 outputTexUpsampled:(id)a5 upsamplingFilter:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  id v119 = 0;
  if (a6 == 1)
  {
    uint64_t v16 = objc_msgSend_width(v11, v12, v13, v14);
    if (objc_msgSend_width(v15, v17, v18, v19) != 2 * v16
      || (uint64_t v23 = objc_msgSend_height(v11, v20, v21, v22), objc_msgSend_height(v15, v24, v25, v26) != 2 * v23)
      || (objc_msgSend_allocator(self->super._metal, v27, v28, v29),
          v30 = objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend_newTextureDescriptor(v30, v31, v32, v33),
          v30,
          !v34))
    {
      FigDebugAssert3();
      int v111 = FigSignalErrorAt();
      goto LABEL_8;
    }
    uint64_t v38 = objc_msgSend_pixelFormat(v11, v35, v36, v37);
    v42 = objc_msgSend_desc(v34, v39, v40, v41);
    objc_msgSend_setPixelFormat_(v42, v43, v38, v44);

    uint64_t v48 = objc_msgSend_width(v15, v45, v46, v47);
    v52 = objc_msgSend_desc(v34, v49, v50, v51);
    objc_msgSend_setWidth_(v52, v53, v48, v54);

    uint64_t v58 = objc_msgSend_height(v11, v55, v56, v57);
    v62 = objc_msgSend_desc(v34, v59, v60, v61);
    objc_msgSend_setHeight_(v62, v63, v58, v64);

    v68 = objc_msgSend_desc(v34, v65, v66, v67);
    objc_msgSend_setUsage_(v68, v69, 3, v70);

    objc_msgSend_setLabel_(v34, v71, 0, v72);
    v76 = objc_msgSend_allocator(self->super._metal, v73, v74, v75);
    v79 = objc_msgSend_newTextureWithDescriptor_(v76, v77, (uint64_t)v34, v78);
    id v119 = v79;

    v83 = objc_msgSend_computeCommandEncoder(v10, v80, v81, v82);
    if (!v83)
    {
      FigDebugAssert3();
      int v111 = FigSignalErrorAt();

      goto LABEL_8;
    }
    v85 = v83;
    objc_msgSend_setImageblockWidth_height_(v83, v84, 32, 32);
    objc_msgSend_setComputePipelineState_(v85, v86, (uint64_t)self->super._shaders->_krnLaplacianGaussianH, v87);
    objc_msgSend_setTexture_atIndex_(v85, v88, (uint64_t)v11, 0);
    objc_msgSend_setTexture_atIndex_(v85, v89, (uint64_t)v79, 1);
    v118[0] = objc_msgSend_width(v11, v90, v91, v92);
    v118[1] = objc_msgSend_height(v11, v93, v94, v95);
    v118[2] = 1;
    long long v116 = xmmword_263117D00;
    uint64_t v117 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v85, v96, (uint64_t)v118, (uint64_t)&v116);
    objc_msgSend_setComputePipelineState_(v85, v97, (uint64_t)self->super._shaders->_krnLaplacianGaussianV, v98);
    objc_msgSend_setTexture_atIndex_(v85, v99, (uint64_t)v79, 0);
    objc_msgSend_setTexture_atIndex_(v85, v100, (uint64_t)v15, 1);
    v115[0] = objc_msgSend_width(v15, v101, v102, v103);
    v115[1] = objc_msgSend_height(v11, v104, v105, v106);
    v115[2] = 1;
    long long v113 = xmmword_263118240;
    uint64_t v114 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v85, v107, (uint64_t)v115, (uint64_t)&v113);
    objc_msgSend_endEncoding(v85, v108, v109, v110);
    FigMetalDecRef();
  }
  else
  {
    FigDebugAssert3();
  }
  int v111 = 0;
LABEL_8:

  return v111;
}

- (int)_performLaplacianPyramid:(id)a3 inputTextures:(id)a4 destinationTextures:(id)a5 upsamplingFilter:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v162 = a5;
  shaders = self->super._shaders;
  if (a6 == 1)
  {
    v160 = v10;
    v161 = shaders->_krnLaplacianGaussianH;
    v159 = self->super._shaders->_krnLaplacianGaussianVLap;
    unint64_t v15 = 0;
    int v158 = 0;
    do
    {
      if (v15 >= self->super._numLevels) {
        break;
      }
      uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v11, v13, v15, v14);
      uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v11, v17, v15 + 1, v18);
      uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v162, v20, v15, v21);
      *(void *)&long long v163 = 0;
      uint64_t v26 = objc_msgSend_allocator(self->super._metal, v23, v24, v25);
      v30 = objc_msgSend_newTextureDescriptor(v26, v27, v28, v29);

      if (!v30) {
        goto LABEL_10;
      }
      uint64_t v34 = objc_msgSend_pixelFormat(v19, v31, v32, v33);
      uint64_t v38 = objc_msgSend_desc(v30, v35, v36, v37);
      objc_msgSend_setPixelFormat_(v38, v39, v34, v40);

      uint64_t v44 = objc_msgSend_width(v22, v41, v42, v43);
      uint64_t v48 = objc_msgSend_desc(v30, v45, v46, v47);
      objc_msgSend_setWidth_(v48, v49, v44, v50);

      uint64_t v54 = objc_msgSend_height(v19, v51, v52, v53);
      uint64_t v58 = objc_msgSend_desc(v30, v55, v56, v57);
      objc_msgSend_setHeight_(v58, v59, v54, v60);

      uint64_t v64 = objc_msgSend_desc(v30, v61, v62, v63);
      objc_msgSend_setUsage_(v64, v65, 3, v66);

      objc_msgSend_setLabel_(v30, v67, 0, v68);
      uint64_t v72 = objc_msgSend_allocator(self->super._metal, v69, v70, v71);
      uint64_t v75 = objc_msgSend_newTextureWithDescriptor_(v72, v73, (uint64_t)v30, v74);
      v76 = (void *)v163;
      *(void *)&long long v163 = v75;

      v80 = objc_msgSend_computeCommandEncoder(v160, v77, v78, v79);
      if (!v80) {
        goto LABEL_10;
      }
      uint64_t v82 = v80;
      objc_msgSend_setImageblockWidth_height_(v80, v81, 32, 32);
      objc_msgSend_setComputePipelineState_(v82, v83, (uint64_t)v161, v84);
      objc_msgSend_setTexture_atIndex_(v82, v85, (uint64_t)v19, 0);
      objc_msgSend_setTexture_atIndex_(v82, v86, v163, 1);
      uint64_t v90 = objc_msgSend_width(v19, v87, v88, v89);
      uint64_t v94 = objc_msgSend_height(v19, v91, v92, v93);
      v171[0] = v90;
      v171[1] = v94;
      v171[2] = 1;
      long long v169 = xmmword_263117D00;
      uint64_t v170 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v82, v95, (uint64_t)v171, (uint64_t)&v169);
      objc_msgSend_endEncoding(v82, v96, v97, v98);
      uint64_t v102 = objc_msgSend_computeCommandEncoder(v160, v99, v100, v101);

      if (v102)
      {
        objc_msgSend_setImageblockWidth_height_(v102, v103, 32, 32);
        objc_msgSend_setComputePipelineState_(v102, v104, (uint64_t)v159, v105);
        objc_msgSend_setTexture_atIndex_(v102, v106, (uint64_t)v16, 0);
        char v107 = 1;
        objc_msgSend_setTexture_atIndex_(v102, v108, v163, 1);
        objc_msgSend_setTexture_atIndex_(v102, v109, (uint64_t)v22, 2);
        uint64_t v113 = objc_msgSend_width(v22, v110, v111, v112);
        uint64_t v117 = objc_msgSend_height((void *)v163, v114, v115, v116);
        v168[0] = v113;
        v168[1] = v117;
        v168[2] = 1;
        long long v166 = xmmword_263118240;
        uint64_t v167 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v102, v118, (uint64_t)v168, (uint64_t)&v166);
        objc_msgSend_endEncoding(v102, v119, v120, v121);
        FigMetalDecRef();
      }
      else
      {
LABEL_10:
        FigDebugAssert3();
        int v158 = FigSignalErrorAt();
        char v107 = 0;
      }

      ++v15;
    }
    while ((v107 & 1) != 0);

    id v10 = v160;
  }
  else
  {
    v161 = shaders->_krnLaplacianPyramidSubtractionPass;
    unint64_t v124 = 0;
    int v158 = 0;
    do
    {
      if (v124 >= self->super._numLevels) {
        break;
      }
      v125 = objc_msgSend_objectAtIndexedSubscript_(v11, v122, v124, v123);
      v128 = objc_msgSend_objectAtIndexedSubscript_(v11, v126, v124 + 1, v127);
      v131 = objc_msgSend_objectAtIndexedSubscript_(v162, v129, v124, v130);
      v135 = objc_msgSend_computeCommandEncoder(v10, v132, v133, v134);
      v139 = v135;
      if (v135)
      {
        objc_msgSend_insertCompressedTextureReinterpretationFlush(v135, v136, v137, v138);
        objc_msgSend_setComputePipelineState_(v139, v140, (uint64_t)v161, v141);
        objc_msgSend_setTexture_atIndex_(v139, v142, (uint64_t)v125, 0);
        objc_msgSend_setTexture_atIndex_(v139, v143, (uint64_t)v128, 1);
        objc_msgSend_setTexture_atIndex_(v139, v144, (uint64_t)v131, 2);
        uint64_t v148 = objc_msgSend_width(v125, v145, v146, v147);
        uint64_t v152 = objc_msgSend_height(v125, v149, v150, v151);
        v165[0] = v148;
        v165[1] = v152;
        v165[2] = 1;
        long long v163 = xmmword_263117D20;
        uint64_t v164 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v139, v153, (uint64_t)v165, (uint64_t)&v163);
        objc_msgSend_endEncoding(v139, v154, v155, v156);
      }
      else
      {
        FigDebugAssert3();
        int v158 = FigSignalErrorAt();
      }

      ++v124;
    }
    while (v139);
  }

  return v158;
}

- (int)_validateInputs:(id)a3 gaussianPyramid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = v7;
  if (!v6) {
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_12;
  }
  outputTextures = self->super._outputTextures;
  if (!outputTextures) {
    goto LABEL_12;
  }
  if (objc_msgSend_count(outputTextures, v8, v9, v10) != self->super._numLevels) {
    goto LABEL_12;
  }
  uint64_t v16 = objc_msgSend_outputTextureArray(v11, v13, v14, v15);

  if (!v16) {
    goto LABEL_12;
  }
  uint64_t v20 = objc_msgSend_count(self->super._outputTextures, v17, v18, v19) + 1;
  uint64_t v24 = objc_msgSend_outputTextureArray(v11, v21, v22, v23);
  uint64_t v28 = objc_msgSend_count(v24, v25, v26, v27);

  if (v20 != v28) {
    goto LABEL_12;
  }
  v31 = objc_msgSend_objectAtIndexedSubscript_(self->super._outputTextures, v29, 0, v30);
  uint64_t v35 = objc_msgSend_width(v31, v32, v33, v34);
  v39 = objc_msgSend_outputTextureArray(v11, v36, v37, v38);
  uint64_t v42 = objc_msgSend_objectAtIndexedSubscript_(v39, v40, 0, v41);
  uint64_t v46 = objc_msgSend_width(v42, v43, v44, v45);

  if (v35 != v46) {
    goto LABEL_12;
  }
  v49 = objc_msgSend_objectAtIndexedSubscript_(self->super._outputTextures, v47, 0, v48);
  uint64_t v53 = objc_msgSend_height(v49, v50, v51, v52);
  uint64_t v57 = objc_msgSend_outputTextureArray(v11, v54, v55, v56);
  uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(v57, v58, 0, v59);
  uint64_t v64 = objc_msgSend_height(v60, v61, v62, v63);

  if (v53 != v64) {
    goto LABEL_12;
  }
  if (self->super._shaders)
  {
    int v65 = 0;
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    int v65 = FigSignalErrorAt();
  }

  return v65;
}

- (int)computeUsing:(id)a3 gaussianPyramid:(id)a4 upsamplingFilter:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend__validateInputs_gaussianPyramid_(self, v10, (uint64_t)v8, (uint64_t)v9)
    || (objc_msgSend_outputTextureArray(v9, v11, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend__performLaplacianPyramid_inputTextures_destinationTextures_upsamplingFilter_(self, v15, (uint64_t)v8, (uint64_t)v14, self->super._outputTextures, v5), v14, v16))
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

@end