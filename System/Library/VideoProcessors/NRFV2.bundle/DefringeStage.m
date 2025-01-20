@interface DefringeStage
+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4;
- (DefringeStage)initWithMetalContext:(id)a3;
- (id)_functionNameForProgram:(int)a3;
- (int)_compileShaders;
- (int)defringePyramid:(id)a3 outputPyramid:(id)a4 chromaScratch:(id)a5 tuningParameters:(id)a6;
- (void)_collapseFilteredChroma:(id)a3 usingInputDown:(id)a4 inputUp:(id)a5 into:(id)a6;
- (void)_copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)_defringeLuma:(id)a3 chroma:(id)a4 into:(id)a5;
@end

@implementation DefringeStage

+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"DefaultSensorIDs", v8);
  v10 = v9;
  if (v9)
  {
    v75 = v9;
    v76 = v5;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v11 = v9;
    uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v81, (uint64_t)v85, 16);
    if (v79)
    {
      id v77 = v11;
      uint64_t v78 = *(void *)v82;
      while (2)
      {
        for (uint64_t i = 0; i != v79; ++i)
        {
          if (*(void *)v82 != v78) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          v17 = objc_msgSend_objectForKeyedSubscript_(v11, v13, v16, v14);
          v20 = objc_msgSend_objectForKeyedSubscript_(v6, v18, v16, v19);
          v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)v17, v22);
          v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"ChromaticDefringing", v25);

          if (v26)
          {
            v29 = objc_msgSend_objectForKeyedSubscript_(v6, v27, v16, v28);
            v32 = objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v17, v31);
            v35 = objc_msgSend_objectForKeyedSubscript_(v32, v33, @"ChromaticDefringing", v34);
            objc_msgSend_objectForKeyedSubscript_(v35, v36, @"Still", v37);
            v80 = v26;
            v39 = id v38 = v6;
            v42 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"CorrectionEnabled", v41);
            int v46 = objc_msgSend_BOOLValue(v42, v43, v44, v45);

            id v11 = v77;
            id v6 = v38;
            v26 = v80;

            if (v46)
            {
              v48 = [DefringeStage alloc];
              id v5 = v76;
              v52 = objc_msgSend_initWithMetalContext_(v48, v49, (uint64_t)v76, v50);
              if (v52)
              {
                v53 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v51, 65, 4, 4, 0);
                objc_msgSend_setUsage_(v53, v54, 3, v55);
                v59 = objc_msgSend_device(v76, v56, v57, v58);
                v62 = objc_msgSend_newTextureWithDescriptor_(v59, v60, (uint64_t)v53, v61);

                v66 = objc_msgSend_device(v76, v63, v64, v65);
                v69 = objc_msgSend_newTextureWithDescriptor_(v66, v67, (uint64_t)v53, v68);

                objc_msgSend__copyFromTexture_toTexture_(v52, v70, (uint64_t)v62, (uint64_t)v69);
                objc_msgSend_commit(v76, v71, v72, v73);

                id v11 = v77;
                int v47 = 0;
              }
              else
              {
                int v47 = -12786;
              }

              goto LABEL_16;
            }
          }
        }
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v81, (uint64_t)v85, 16);
        if (v79) {
          continue;
        }
        break;
      }
    }

    int v47 = 0;
    id v5 = v76;
LABEL_16:
    v10 = v75;
  }
  else
  {
    FigDebugAssert3();
    int v47 = FigSignalErrorAt();
  }

  return v47;
}

- (id)_functionNameForProgram:(int)a3
{
  if (!a3) {
    return @"defringe_still";
  }
  if (a3 == 1) {
    return @"collapse_cbcr";
  }
  FigDebugAssert3();
  return 0;
}

- (int)_compileShaders
{
  metalContext = self->_metalContext;
  id v5 = objc_msgSend__functionNameForProgram_(self, a2, 0, v2);
  objc_msgSend_computePipelineStateFor_constants_(metalContext, v6, (uint64_t)v5, 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v7;

  if (self->_pipelineStates[0])
  {
    id v11 = self->_metalContext;
    v12 = objc_msgSend__functionNameForProgram_(self, v9, 1, v10);
    objc_msgSend_computePipelineStateFor_constants_(v11, v13, (uint64_t)v12, 0);
    uint64_t v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v15 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v14;

    if (self->_pipelineStates[1]) {
      return 0;
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (DefringeStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DefringeStage;
  id v6 = [(DefringeStage *)&v12 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_metalContext, a3), objc_msgSend__compileShaders(v7, v8, v9, v10)))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }

  return v7;
}

- (void)_defringeLuma:(id)a3 chroma:(id)a4 into:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_width(v8, v11, v12, v13);
  uint64_t v18 = objc_msgSend_height(v8, v15, v16, v17);
  objc_msgSend_setRadialParamsForWidth_height_(self->_tuningParameters, v19, v14, v18);
  v23 = objc_msgSend_commandBuffer(self->_metalContext, v20, v21, v22);
  v30 = objc_msgSend_computeCommandEncoder(v23, v24, v25, v26);
  uint64_t v70 = 0;
  long long v31 = 0uLL;
  memset(v69, 0, sizeof(v69));
  tuningParameters = self->_tuningParameters;
  if (tuningParameters
    && (objc_msgSend_correctionParams(tuningParameters, v27, v28, v29),
        v33 = self->_tuningParameters,
        long long v31 = 0uLL,
        long long v67 = 0u,
        long long v68 = 0u,
        long long v65 = 0u,
        long long v66 = 0u,
        v33))
  {
    objc_msgSend_radialParams(v33, v27, v28, v29);
    objc_msgSend_desaturationParams(self->_tuningParameters, v34, v35, v36);
  }
  else
  {
    long long v67 = v31;
    long long v68 = v31;
    long long v65 = v31;
    long long v66 = v31;
    objc_msgSend_desaturationParams(0, v27, v28, v29);
  }
  v64[0] = v39;
  v64[1] = v40;
  v64[2] = v41;
  objc_msgSend_setComputePipelineState_(v30, v37, (uint64_t)self->_pipelineStates[0], v38);
  objc_msgSend_setImageblockWidth_height_(v30, v42, 16, 16);
  objc_msgSend_setTexture_atIndex_(v30, v43, (uint64_t)v10, 0);

  objc_msgSend_setTexture_atIndex_(v30, v44, (uint64_t)v8, 1);
  objc_msgSend_setTexture_atIndex_(v30, v45, (uint64_t)v9, 4);
  objc_msgSend_setBytes_length_atIndex_(v30, v46, (uint64_t)v69, 232, 0);
  objc_msgSend_setBytes_length_atIndex_(v30, v47, (uint64_t)v64, 12, 1);
  objc_msgSend_setBytes_length_atIndex_(v30, v48, (uint64_t)&v65, 64, 2);
  uint64_t v52 = objc_msgSend_width(v9, v49, v50, v51);
  uint64_t v56 = objc_msgSend_height(v9, v53, v54, v55);

  v63[0] = v52;
  v63[1] = v56;
  v63[2] = 1;
  int64x2_t v61 = vdupq_n_s64(0x10uLL);
  uint64_t v62 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v57, (uint64_t)v63, (uint64_t)&v61);
  objc_msgSend_endEncoding(v30, v58, v59, v60);
}

- (void)_collapseFilteredChroma:(id)a3 usingInputDown:(id)a4 inputUp:(id)a5 into:(id)a6
{
  metalContext = self->_metalContext;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v18 = objc_msgSend_commandBuffer(metalContext, v15, v16, v17);
  uint64_t v22 = objc_msgSend_computeCommandEncoder(v18, v19, v20, v21);
  objc_msgSend_setComputePipelineState_(v22, v23, (uint64_t)self->_pipelineStates[1], v24);
  objc_msgSend_setTexture_atIndex_(v22, v25, (uint64_t)v12, 1);

  objc_msgSend_setTexture_atIndex_(v22, v26, (uint64_t)v13, 2);
  objc_msgSend_setTexture_atIndex_(v22, v27, (uint64_t)v14, 3);

  objc_msgSend_setTexture_atIndex_(v22, v28, (uint64_t)v11, 4);
  unint64_t v32 = objc_msgSend_threadExecutionWidth(self->_pipelineStates[1], v29, v30, v31);
  unint64_t v36 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_pipelineStates[1], v33, v34, v35) / v32;
  uint64_t v40 = objc_msgSend_width(v11, v37, v38, v39);
  uint64_t v44 = objc_msgSend_height(v11, v41, v42, v43);

  v50[0] = v40;
  v50[1] = v44;
  v50[2] = 1;
  v49[0] = v32;
  v49[1] = v36;
  v49[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v22, v45, (uint64_t)v50, (uint64_t)v49);
  objc_msgSend_endEncoding(v22, v46, v47, v48);
}

- (void)_copyFromTexture:(id)a3 toTexture:(id)a4
{
  metalContext = self->_metalContext;
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_commandBuffer(metalContext, v8, v9, v10);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = objc_msgSend_blitCommandEncoder(v19, v11, v12, v13);
  objc_msgSend_copyFromTexture_toTexture_(v14, v15, (uint64_t)v7, (uint64_t)v6);

  objc_msgSend_endEncoding(v14, v16, v17, v18);
}

- (int)defringePyramid:(id)a3 outputPyramid:(id)a4 chromaScratch:(id)a5 tuningParameters:(id)a6
{
  uint64_t v10 = (char *)a3;
  id v11 = (char *)a4;
  id v12 = a5;
  id v16 = a6;
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v17 = objc_msgSend_commandQueue(self->_metalContext, v13, v14, v15);
    uint64_t v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

    objc_msgSend_setLabel_(v21, v22, @"KTRACE_START_MTL", v23);
    objc_msgSend_addCompletedHandler_(v21, v24, (uint64_t)&unk_270E34008, v25);
    objc_msgSend_commit(v21, v26, v27, v28);
  }
  int v29 = *((_DWORD *)v10 + 2);
  int v30 = *((_DWORD *)v11 + 2);
  if (v29 >= v30) {
    uint64_t v31 = v30;
  }
  else {
    uint64_t v31 = v29;
  }
  if (v29 <= 1) {
    goto LABEL_31;
  }
  if (v30 <= 1) {
    goto LABEL_31;
  }
  uint64_t v32 = objc_msgSend_pixelFormat(v12, v13, v14, v15);
  if (v32 != objc_msgSend_pixelFormat(*((void **)v11 + 62), v33, v34, v35) || !v16) {
    goto LABEL_31;
  }
  uint64_t v36 = (uint64_t)v12;
  id v73 = v16;
  if ((int)v31 < 1)
  {
LABEL_15:
    id v12 = (id)v36;
    if ((FigMetalIsValid() & 1) == 0)
    {
      FigDebugAssert3();
      int v71 = FigSignalErrorAt();
      id v16 = v73;
      goto LABEL_24;
    }
    id v16 = v73;
    if (FigMetalIsValid() & 1) != 0 && (FigMetalIsValid())
    {
      objc_storeStrong((id *)&self->_tuningParameters, a6);
      objc_msgSend_commit(self->_metalContext, v40, v41, v42);
      int v46 = objc_msgSend_commandBuffer(self->_metalContext, v43, v44, v45);
      objc_msgSend_setLabel_(v46, v47, @"defringe", v48);

      if ((int)v31 >= 3)
      {
        unint64_t v50 = v31 + 1;
        do
        {
          objc_msgSend__copyFromTexture_toTexture_(self, v49, *(void *)&v10[8 * (v50 - 2) + 496], *(void *)&v11[8 * (v50 - 2) + 496]);
          --v50;
        }
        while (v50 > 3);
      }
      objc_msgSend__defringeLuma_chroma_into_(self, v49, *((void *)v10 + 44), *((void *)v10 + 63), *((void *)v11 + 63));
      id v12 = (id)v36;
      objc_msgSend__collapseFilteredChroma_usingInputDown_inputUp_into_(self, v51, *((void *)v11 + 63), *((void *)v10 + 63), *((void *)v10 + 62), v36);
      objc_msgSend__defringeLuma_chroma_into_(self, v52, *((void *)v10 + 43), v36, *((void *)v11 + 62));
      objc_msgSend_commit(self->_metalContext, v53, v54, v55);
      if (*MEMORY[0x263F00E10])
      {
        uint64_t v59 = objc_msgSend_commandQueue(self->_metalContext, v56, v57, v58);
        v63 = objc_msgSend_commandBuffer(v59, v60, v61, v62);

        objc_msgSend_setLabel_(v63, v64, @"KTRACE_END_MTL", v65);
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = sub_262F95EE0;
        v74[3] = &unk_2655C32E8;
        memset(&v74[4], 0, 24);
        objc_msgSend_addCompletedHandler_(v63, v66, (uint64_t)v74, v67);
        objc_msgSend_commit(v63, v68, v69, v70);
      }
      int v71 = 0;
      goto LABEL_24;
    }
LABEL_31:
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();
    goto LABEL_24;
  }
  uint64_t v37 = v31;
  uint64_t v38 = v10;
  uint64_t v39 = v11;
  while ((FigMetalIsValid() & 1) != 0 && (FigMetalIsValid() & 1) != 0)
  {
    v39 += 8;
    v38 += 8;
    if (!--v37) {
      goto LABEL_15;
    }
  }
  FigDebugAssert3();
  int v71 = FigSignalErrorAt();
  id v16 = v73;
  id v12 = (id)v36;
LABEL_24:

  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  for (uint64_t i = 24; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end