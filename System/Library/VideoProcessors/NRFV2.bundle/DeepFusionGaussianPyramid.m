@interface DeepFusionGaussianPyramid
- (DeepFusionGaussianPyramid)initWithMetalContext:(id)a3 withFilter:(int)a4;
- (int)_performGaussianPyramid:(id)a3 inputTex:(id)a4 textureArray:(id)a5;
- (int)_validateInputs:(id)a3 inTex:(id)a4;
- (int)computeUsing:(id)a3 inTex:(id)a4;
@end

@implementation DeepFusionGaussianPyramid

- (DeepFusionGaussianPyramid)initWithMetalContext:(id)a3 withFilter:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DeepFusionGaussianPyramid;
  result = [(DeepFusionPyramidBaseClass *)&v6 initWithMetalContext:a3];
  if (result) {
    result->_filter = a4;
  }
  return result;
}

- (int)_performGaussianPyramid:(id)a3 inputTex:(id)a4 textureArray:(id)a5
{
  v188[1] = *(void **)MEMORY[0x263EF8340];
  id v179 = a3;
  id v9 = a4;
  id v10 = a5;
  v14 = objc_msgSend_allocator(self->super._metal, v11, v12, v13);
  v18 = objc_msgSend_newTextureDescriptor(v14, v15, v16, v17);

  if (!v18) {
    goto LABEL_37;
  }
  unint64_t pixelFormat = self->super._pixelFormat;
  v23 = objc_msgSend_desc(v18, v19, v20, v21);
  objc_msgSend_setPixelFormat_(v23, v24, pixelFormat, v25);

  v29 = objc_msgSend_desc(v18, v26, v27, v28);
  objc_msgSend_setUsage_(v29, v30, 7, v31);

  objc_msgSend_objectAtIndexedSubscript_(v10, v32, 0, v33);
  id v34 = (id)objc_claimAutoreleasedReturnValue();

  if (v34 == v9) {
    goto LABEL_5;
  }
  uint64_t v38 = objc_msgSend_blitCommandEncoder(v179, v35, v36, v37);
  if (!v38)
  {
LABEL_37:
    FigDebugAssert3();
    int v177 = FigSignalErrorAt();
    goto LABEL_35;
  }
  v42 = (void *)v38;
  memset(v187, 0, sizeof(v187));
  v186[0] = objc_msgSend_width(v9, v39, v40, v41);
  v186[1] = objc_msgSend_height(v9, v43, v44, v45);
  v186[2] = 1;
  v48 = objc_msgSend_objectAtIndexedSubscript_(v10, v46, 0, v47);
  memset(v185, 0, sizeof(v185));
  objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v42, v49, (uint64_t)v9, 0, 0, v187, v186, v48, 0, 0, v185);

  objc_msgSend_endEncoding(v42, v50, v51, v52);
LABEL_5:
  v178 = v18;
  int filter = self->_filter;
  if (filter)
  {
    if (filter == 1)
    {
      if (self->super._numLevels >= 2)
      {
        int v177 = 0;
        unint64_t v54 = 1;
        while (1)
        {
          v55 = objc_msgSend_objectAtIndexedSubscript_(v10, v35, v54 - 1, v37, v175, v176);
          v58 = objc_msgSend_objectAtIndexedSubscript_(v10, v56, v54, v57);
          uint64_t v62 = objc_msgSend_width(v58, v59, v60, v61);
          v66 = objc_msgSend_desc(v18, v63, v64, v65);
          objc_msgSend_setWidth_(v66, v67, v62, v68);

          uint64_t v72 = objc_msgSend_height(v55, v69, v70, v71);
          v76 = objc_msgSend_desc(v18, v73, v74, v75);
          objc_msgSend_setHeight_(v76, v77, v72, v78);

          objc_msgSend_setLabel_(v18, v79, 0, v80);
          v84 = objc_msgSend_allocator(self->super._metal, v81, v82, v83);
          v188[0] = objc_msgSend_newTextureWithDescriptor_(v84, v85, (uint64_t)v18, v86);

          v90 = objc_msgSend_desc(v18, v87, v88, v89);
          uint64_t v94 = objc_msgSend_compressionFootprint(v90, v91, v92, v93);

          if (!v94) {
            goto LABEL_12;
          }
          v98 = objc_msgSend_blitCommandEncoder(v179, v95, v96, v97);
          if (v98) {
            break;
          }
          uint64_t v176 = v5;
          LODWORD(v175) = 0;
          FigDebugAssert3();
          int v177 = FigSignalErrorAt();
          int v139 = 4;
LABEL_15:

          if (v139) {
            goto LABEL_34;
          }
          ++v54;
          v18 = v178;
          if (v54 >= self->super._numLevels) {
            goto LABEL_35;
          }
        }
        v101 = v98;
        objc_msgSend_invalidateCompressedTexture_(v98, v99, (uint64_t)v188[0], v100);
        objc_msgSend_endEncoding(v101, v102, v103, v104);

LABEL_12:
        v105 = objc_msgSend_computeCommandEncoder(v179, v95, v96, v97);
        v109 = v105;
        if (v105)
        {
          objc_msgSend_insertCompressedTextureReinterpretationFlush(v105, v106, v107, v108);
          objc_msgSend_setComputePipelineState_(v109, v110, (uint64_t)self->super._shaders->_krnGaussianPyramid5SeparableH, v111);
          objc_msgSend_setTexture_atIndex_(v109, v112, (uint64_t)v55, 0);
          objc_msgSend_setTexture_atIndex_(v109, v113, (uint64_t)v188[0], 1);
          uint64_t v117 = objc_msgSend_width(v188[0], v114, v115, v116);
          uint64_t v121 = objc_msgSend_height(v188[0], v118, v119, v120);
          v184[0] = v117;
          v184[1] = v121;
          v184[2] = 1;
          long long v182 = xmmword_263117D20;
          uint64_t v183 = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v109, v122, (uint64_t)v184, (uint64_t)&v182);
          objc_msgSend_setComputePipelineState_(v109, v123, (uint64_t)self->super._shaders->_krnGaussianPyramid5SeparableV, v124);
          objc_msgSend_setTexture_atIndex_(v109, v125, (uint64_t)v188[0], 0);
          objc_msgSend_setTexture_atIndex_(v109, v126, (uint64_t)v58, 1);
          uint64_t v130 = objc_msgSend_width(v55, v127, v128, v129);
          uint64_t v134 = objc_msgSend_height(v55, v131, v132, v133);
          v181[0] = v130;
          v181[1] = v134;
          v181[2] = 1;
          long long v182 = xmmword_263117D20;
          uint64_t v183 = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v109, v135, (uint64_t)v181, (uint64_t)&v182);
          objc_msgSend_endEncoding(v109, v136, v137, v138);
          FigMetalDecRef();
          int v139 = 0;
        }
        else
        {
          uint64_t v176 = v5;
          LODWORD(v175) = 0;
          FigDebugAssert3();
          int v177 = FigSignalErrorAt();
          int v139 = 4;
        }

        goto LABEL_15;
      }
      int v177 = 0;
      goto LABEL_34;
    }
    uint64_t v140 = 16;
  }
  else
  {
    uint64_t v140 = 8;
  }
  id v143 = *(id *)((char *)&self->super._shaders->super.isa + v140);
  float v144 = 0.5;
  if (!self->_filter) {
    float v144 = 1.0;
  }
  *(float *)v188 = v144;
  *((float *)v188 + 1) = v144;
  if (self->super._numLevels < 2)
  {
    int v177 = 0;
  }
  else
  {
    uint64_t v145 = 1;
    while (1)
    {
      v146 = objc_msgSend_objectAtIndexedSubscript_(v10, v141, v145 - 1, v142);
      v149 = objc_msgSend_objectAtIndexedSubscript_(v10, v147, v145, v148);
      v153 = objc_msgSend_computeCommandEncoder(v179, v150, v151, v152);
      if (!v153) {
        break;
      }
      v157 = v153;
      objc_msgSend_insertCompressedTextureReinterpretationFlush(v153, v154, v155, v156);
      objc_msgSend_setComputePipelineState_(v157, v158, (uint64_t)v143, v159);
      objc_msgSend_setTexture_atIndex_(v157, v160, (uint64_t)v146, 0);
      objc_msgSend_setTexture_atIndex_(v157, v161, (uint64_t)v149, 1);
      if (!self->_filter) {
        objc_msgSend_setBytes_length_atIndex_(v157, v162, (uint64_t)v188, 8, 0);
      }
      uint64_t v165 = objc_msgSend_width(v149, v162, v163, v164);
      uint64_t v169 = objc_msgSend_height(v149, v166, v167, v168);
      v180[0] = v165;
      v180[1] = v169;
      v180[2] = 1;
      long long v182 = xmmword_263117D20;
      uint64_t v183 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v157, v170, (uint64_t)v180, (uint64_t)&v182);
      objc_msgSend_endEncoding(v157, v171, v172, v173);

      if (++v145 >= self->super._numLevels)
      {
        int v177 = 0;
        goto LABEL_32;
      }
    }
    FigDebugAssert3();
    int v177 = FigSignalErrorAt();
  }
LABEL_32:

LABEL_34:
  v18 = v178;
LABEL_35:

  return v177;
}

- (int)_validateInputs:(id)a3 inTex:(id)a4
{
  id v6 = a3;
  id v9 = a4;
  if (!v9) {
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_10;
  }
  outputTextures = self->super._outputTextures;
  if (!outputTextures) {
    goto LABEL_10;
  }
  v11 = objc_msgSend_objectAtIndexedSubscript_(outputTextures, v7, 0, v8);
  uint64_t v15 = objc_msgSend_width(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_width(v9, v16, v17, v18);

  if (v15 != v19) {
    goto LABEL_10;
  }
  v22 = objc_msgSend_objectAtIndexedSubscript_(self->super._outputTextures, v20, 0, v21);
  uint64_t v26 = objc_msgSend_height(v22, v23, v24, v25);
  uint64_t v30 = objc_msgSend_height(v9, v27, v28, v29);

  if (v26 == v30
    && objc_msgSend_count(self->super._outputTextures, v31, v32, v33) == self->super._numLevels
    && self->super._shaders)
  {
    int v34 = 0;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }

  return v34;
}

- (int)computeUsing:(id)a3 inTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend__validateInputs_inTex_(self, v8, (uint64_t)v6, (uint64_t)v7)
    || objc_msgSend__performGaussianPyramid_inputTex_textureArray_(self, v9, (uint64_t)v6, (uint64_t)v7, self->super._outputTextures))
  {
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

@end