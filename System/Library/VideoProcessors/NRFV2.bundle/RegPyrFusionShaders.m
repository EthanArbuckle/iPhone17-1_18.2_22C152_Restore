@interface RegPyrFusionShaders
- (RegPyrFusionShaders)initWithMetal:(id)a3;
- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6;
@end

@implementation RegPyrFusionShaders

- (RegPyrFusionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)RegPyrFusionShaders;
  v8 = [(RegPyrFusionShaders *)&v51 init];
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_20:
    v49 = 0;
    goto LABEL_16;
  }
  v9 = objc_msgSend_library(v4, v5, v6, v7);
  v12 = objc_msgSend_newFunctionWithName_(v9, v10, @"regpyr_vert", v11);

  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_20;
  }
  uint64_t v14 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v13, (uint64_t)v4, (uint64_t)v12, @"regpyr_initial_downscale_frag", &unk_270E50820);
  initialDownScalePipelineState = v8->_initialDownScalePipelineState;
  v8->_initialDownScalePipelineState = (MTLRenderPipelineState *)v14;

  if (!v8->_initialDownScalePipelineState) {
    goto LABEL_19;
  }
  uint64_t v17 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v16, (uint64_t)v4, (uint64_t)v12, @"regpyr_bilinear_downscale_frag", &unk_270E50838);
  bilinearScalePipelineState = v8->_bilinearScalePipelineState;
  v8->_bilinearScalePipelineState = (MTLRenderPipelineState *)v17;

  if (!v8->_bilinearScalePipelineState) {
    goto LABEL_19;
  }
  uint64_t v20 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v19, (uint64_t)v4, (uint64_t)v12, @"regpyr_deriv_sobel_frag", &unk_270E50850);
  derivSobelPipelineState = v8->_derivSobelPipelineState;
  v8->_derivSobelPipelineState = (MTLRenderPipelineState *)v20;

  if (!v8->_derivSobelPipelineState) {
    goto LABEL_19;
  }
  uint64_t v23 = objc_msgSend_computePipelineStateFor_constants_(v4, v22, @"regpyr_deriv_compute", 0);
  derivPipelineState = v8->_derivPipelineState;
  v8->_derivPipelineState = (MTLComputePipelineState *)v23;

  if (!v8->_derivPipelineState) {
    goto LABEL_19;
  }
  uint64_t v26 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v25, (uint64_t)v4, (uint64_t)v12, @"regpyr_basic_search_luma_frag", &unk_270E50868);
  basicSearchLumaPipelineState = v8->_basicSearchLumaPipelineState;
  v8->_basicSearchLumaPipelineState = (MTLRenderPipelineState *)v26;

  if (!v8->_basicSearchLumaPipelineState) {
    goto LABEL_19;
  }
  uint64_t v29 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v28, (uint64_t)v4, (uint64_t)v12, @"regpyr_fusion_luma_x_frag", &unk_270E50880);
  fusionXLumaPipelineState = v8->_fusionXLumaPipelineState;
  v8->_fusionXLumaPipelineState = (MTLRenderPipelineState *)v29;

  if (!v8->_fusionXLumaPipelineState) {
    goto LABEL_19;
  }
  uint64_t v32 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v31, (uint64_t)v4, (uint64_t)v12, @"regpyr_fusion_luma_y_frag", &unk_270E50898);
  fusionYLumaPipelineState = v8->_fusionYLumaPipelineState;
  v8->_fusionYLumaPipelineState = (MTLRenderPipelineState *)v32;

  if (!v8->_fusionYLumaPipelineState) {
    goto LABEL_19;
  }
  uint64_t v35 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v34, (uint64_t)v4, (uint64_t)v12, @"regpyr_smooth_frag", &unk_270E508B0);
  smoothPipelineState = v8->_smoothPipelineState;
  v8->_smoothPipelineState = (MTLRenderPipelineState *)v35;

  if (!v8->_smoothPipelineState) {
    goto LABEL_19;
  }
  uint64_t v38 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v37, (uint64_t)v4, (uint64_t)v12, @"regpyr_selection_luma_frag", &unk_270E508C8);
  selectionLumaPipelineState = v8->_selectionLumaPipelineState;
  v8->_selectionLumaPipelineState = (MTLRenderPipelineState *)v38;

  if (!v8->_selectionLumaPipelineState) {
    goto LABEL_19;
  }
  uint64_t v41 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v40, (uint64_t)v4, (uint64_t)v12, @"regpyr_confidence_stage_one_frag", &unk_270E508E0);
  confidenceStageOne = v8->_confidenceStageOne;
  v8->_confidenceStageOne = (MTLRenderPipelineState *)v41;

  if (!v8->_confidenceStageOne) {
    goto LABEL_19;
  }
  uint64_t v44 = objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v43, (uint64_t)v4, (uint64_t)v12, @"regpyr_confidence_erode_frag", &unk_270E508F8);
  confidenceErode = v8->_confidenceErode;
  v8->_confidenceErode = (MTLRenderPipelineState *)v44;

  if (!v8->_confidenceErode
    || (objc_msgSend_createPipelineStateWithMetal_vFunction_fShaderName_outputColorMetalFormat_(v8, v46, (uint64_t)v4, (uint64_t)v12, @"regpyr_confidence_dilate_frag", &unk_270E50910), uint64_t v47 = objc_claimAutoreleasedReturnValue(), confidenceDilate = v8->_confidenceDilate, v8->_confidenceDilate = (MTLRenderPipelineState *)v47, confidenceDilate, !v8->_confidenceDilate))
  {
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_20;
  }
  v49 = v8;

LABEL_16:
  return v49;
}

- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v16 = objc_alloc_init(MEMORY[0x263F129C0]);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_pipelineLibrary(v9, v13, v14, v15);
    objc_msgSend_setPipelineLibrary_(v16, v18, (uint64_t)v17, v19);

    objc_msgSend_setVertexFunction_(v16, v20, (uint64_t)v10, v21);
    objc_msgSend_vertexFunction(v16, v22, v23, v24);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    if (!v25) {
      goto LABEL_19;
    }
    uint64_t v29 = objc_msgSend_library(v9, v26, v27, v28);
    uint64_t v32 = objc_msgSend_newFunctionWithName_(v29, v30, (uint64_t)v11, v31);
    objc_msgSend_setFragmentFunction_(v16, v33, (uint64_t)v32, v34);

    objc_msgSend_fragmentFunction(v16, v35, v36, v37);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      id v72 = v11;
      id v73 = v10;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v71 = v12;
      id v38 = v12;
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v75, (uint64_t)v79, 16);
      if (v40)
      {
        uint64_t v44 = v40;
        int v45 = 0;
        uint64_t v46 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v76 != v46) {
              objc_enumerationMutation(v38);
            }
            uint64_t v48 = (int)objc_msgSend_intValue(*(void **)(*((void *)&v75 + 1) + 8 * i), v41, v42, v43);
            v52 = objc_msgSend_colorAttachments(v16, v49, v50, v51);
            v55 = objc_msgSend_objectAtIndexedSubscript_(v52, v53, (v45 + i), v54);
            objc_msgSend_setPixelFormat_(v55, v56, v48, v57);
          }
          uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v75, (uint64_t)v79, 16);
          v45 += i;
        }
        while (v44);
      }

      v61 = objc_msgSend_fullRangeVertexDesc(v9, v58, v59, v60);
      objc_msgSend_setVertexDescriptor_(v16, v62, (uint64_t)v61, v63);

      v67 = objc_msgSend_device(v9, v64, v65, v66);
      id v74 = 0;
      v69 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v67, v68, (uint64_t)v16, (uint64_t)&v74);
      id v25 = v74;

      if (!v69 || v25)
      {

        v69 = 0;
      }
      id v11 = v72;
      id v10 = v73;
      id v12 = v71;
    }
    else
    {
LABEL_19:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v69 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v69 = 0;
    id v25 = 0;
  }

  return v69;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceDilate, 0);
  objc_storeStrong((id *)&self->_confidenceErode, 0);
  objc_storeStrong((id *)&self->_confidenceStageOne, 0);
  objc_storeStrong((id *)&self->_selectionLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_smoothPipelineState, 0);
  objc_storeStrong((id *)&self->_fusionYLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_fusionXLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_basicSearchLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_derivSobelPipelineState, 0);
  objc_storeStrong((id *)&self->_derivPipelineState, 0);
  objc_storeStrong((id *)&self->_bilinearScalePipelineState, 0);

  objc_storeStrong((id *)&self->_initialDownScalePipelineState, 0);
}

@end