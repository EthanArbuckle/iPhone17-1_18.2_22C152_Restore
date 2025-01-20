@interface RegDenseShaders
- (RegDenseShaders)initWithMetal:(id)a3;
@end

@implementation RegDenseShaders

- (RegDenseShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)RegDenseShaders;
  v8 = [(RegDenseShaders *)&v82 init];
  if (!v8
    || (objc_msgSend_library(v4, v5, v6, v7),
        v9 = objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend_newFunctionWithName_(v9, v10, @"pyramidConfidence", v11),
        v9,
        !v12))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_22:
    v79 = 0;
    goto LABEL_15;
  }
  v16 = objc_msgSend_library(v4, v13, v14, v15);
  v19 = objc_msgSend_newFunctionWithName_(v16, v17, @"regpyr_vert", v18);

  if (!v19)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_21:

    goto LABEL_22;
  }
  id v20 = objc_alloc_init(MEMORY[0x263F129C0]);
  if (!v20)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_20:

    goto LABEL_21;
  }
  v23 = v20;
  objc_msgSend_setVertexFunction_(v20, v21, (uint64_t)v19, v22);
  objc_msgSend_setFragmentFunction_(v23, v24, (uint64_t)v12, v25);
  v29 = objc_msgSend_fullRangeVertexDesc(v4, v26, v27, v28);
  objc_msgSend_setVertexDescriptor_(v23, v30, (uint64_t)v29, v31);

  v35 = objc_msgSend_colorAttachments(v23, v32, v33, v34);
  v38 = objc_msgSend_objectAtIndexedSubscript_(v35, v36, 0, v37);
  objc_msgSend_setPixelFormat_(v38, v39, 25, v40);

  v44 = objc_msgSend_pipelineLibrary(v4, v41, v42, v43);
  objc_msgSend_setPipelineLibrary_(v23, v45, (uint64_t)v44, v46);

  v50 = objc_msgSend_device(v4, v47, v48, v49);
  id v81 = 0;
  uint64_t v52 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v50, v51, (uint64_t)v23, (uint64_t)&v81);
  id v53 = v81;
  confPipeline = v8->_confPipeline;
  v8->_confPipeline = (MTLRenderPipelineState *)v52;

  if (!v8->_confPipeline) {
    goto LABEL_19;
  }
  uint64_t v56 = objc_msgSend_computePipelineStateFor_constants_(v4, v55, @"warpFrame", 0);
  warpPipeline = v8->_warpPipeline;
  v8->_warpPipeline = (MTLComputePipelineState *)v56;

  if (!v8->_warpPipeline) {
    goto LABEL_19;
  }
  uint64_t v59 = objc_msgSend_computePipelineStateFor_constants_(v4, v58, @"warpFrameWithConfidence", 0);
  warpWithConfidencePipeline = v8->_warpWithConfidencePipeline;
  v8->_warpWithConfidencePipeline = (MTLComputePipelineState *)v59;

  if (!v8->_warpWithConfidencePipeline) {
    goto LABEL_19;
  }
  uint64_t v62 = objc_msgSend_computePipelineStateFor_constants_(v4, v61, @"warpFrameWithBlendingWeight", 0);
  warpWithBlendingWeightPipeline = v8->_warpWithBlendingWeightPipeline;
  v8->_warpWithBlendingWeightPipeline = (MTLComputePipelineState *)v62;

  if (!v8->_warpWithBlendingWeightPipeline) {
    goto LABEL_19;
  }
  uint64_t v65 = objc_msgSend_computePipelineStateFor_constants_(v4, v64, @"warpAdditionalFrameWithBlendingWeight", 0);
  warpAdditionalFrameWithBlendingWeightPipeline = v8->_warpAdditionalFrameWithBlendingWeightPipeline;
  v8->_warpAdditionalFrameWithBlendingWeightPipeline = (MTLComputePipelineState *)v65;

  if (!v8->_warpAdditionalFrameWithBlendingWeightPipeline) {
    goto LABEL_19;
  }
  uint64_t v68 = objc_msgSend_computePipelineStateFor_constants_(v4, v67, @"warpFrameWithBlendingWeightAndConfidence", 0);
  warpWithBlendingWeightAndConfidencePipeline = v8->_warpWithBlendingWeightAndConfidencePipeline;
  v8->_warpWithBlendingWeightAndConfidencePipeline = (MTLComputePipelineState *)v68;

  if (!v8->_warpWithBlendingWeightAndConfidencePipeline) {
    goto LABEL_19;
  }
  uint64_t v71 = objc_msgSend_computePipelineStateFor_constants_(v4, v70, @"getBlendingWeight", 0);
  getBlendingWeightPipeline = v8->_getBlendingWeightPipeline;
  v8->_getBlendingWeightPipeline = (MTLComputePipelineState *)v71;

  if (!v8->_getBlendingWeightPipeline) {
    goto LABEL_19;
  }
  uint64_t v74 = objc_msgSend_computePipelineStateFor_constants_(v4, v73, @"getBlendingWeightLowLight", 0);
  getBlendingWeightLowLightPipeline = v8->_getBlendingWeightLowLightPipeline;
  v8->_getBlendingWeightLowLightPipeline = (MTLComputePipelineState *)v74;

  if (!v8->_getBlendingWeightLowLightPipeline
    || (objc_msgSend_computePipelineStateFor_constants_(v4, v76, @"generateSparseBlendingMap", 0),
        uint64_t v77 = objc_claimAutoreleasedReturnValue(),
        generateSparseBlendingMapPipeline = v8->_generateSparseBlendingMapPipeline,
        v8->_generateSparseBlendingMapPipeline = (MTLComputePipelineState *)v77,
        generateSparseBlendingMapPipeline,
        !v8->_generateSparseBlendingMapPipeline))
  {
LABEL_19:
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_20;
  }
  v79 = v8;

LABEL_15:
  return v79;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generateSparseBlendingMapPipeline, 0);
  objc_storeStrong((id *)&self->_getBlendingWeightLowLightPipeline, 0);
  objc_storeStrong((id *)&self->_getBlendingWeightPipeline, 0);
  objc_storeStrong((id *)&self->_warpWithBlendingWeightAndConfidencePipeline, 0);
  objc_storeStrong((id *)&self->_warpAdditionalFrameWithBlendingWeightPipeline, 0);
  objc_storeStrong((id *)&self->_warpWithBlendingWeightPipeline, 0);
  objc_storeStrong((id *)&self->_warpWithConfidencePipeline, 0);
  objc_storeStrong((id *)&self->_warpPipeline, 0);

  objc_storeStrong((id *)&self->_confPipeline, 0);
}

@end