@interface ANEDepthScalingProcessor
- (ANEDepthScalingProcessor)initWithMetalContext:(id)a3;
- (int)_compileShaders;
- (int)scaleFromDepth:(id)a3 toDisparity:(id)a4;
@end

@implementation ANEDepthScalingProcessor

- (ANEDepthScalingProcessor)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

LABEL_7:
    v7 = 0;
    goto LABEL_4;
  }
  v14.receiver = self;
  v14.super_class = (Class)ANEDepthScalingProcessor;
  v6 = [(ANEDepthScalingProcessor *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    if (objc_msgSend__compileShaders(v7, v8, v9, v10, v11, v12))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      FigSignalErrorAt();
      goto LABEL_7;
    }
  }
LABEL_4:

  return v7;
}

- (int)_compileShaders
{
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, a2, @"scaleDepth", 0, v2, v3);
  id v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  aneScalerComputePipelinesState = self->_aneScalerComputePipelinesState;
  self->_aneScalerComputePipelinesState = v5;

  if (self->_aneScalerComputePipelinesState) {
    return 0;
  }
  else {
    return -12786;
  }
}

- (int)scaleFromDepth:(id)a3 toDisparity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13 = self->_aneScalerComputePipelinesState;
  if (v6 && v7)
  {
    objc_super v14 = objc_msgSend_commandBuffer(self->_mtlContext, v8, v9, v10, v11, v12);
    v20 = v14;
    if (v14
      && (objc_msgSend_computeCommandEncoder(v14, v15, v16, v17, v18, v19),
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v26 = v21;
      objc_msgSend_setComputePipelineState_(v21, v22, (uint64_t)v13, v23, v24, v25);
      objc_msgSend_setTexture_atIndex_(v26, v27, (uint64_t)v6, 0, v28, v29);
      objc_msgSend_setTexture_atIndex_(v26, v30, (uint64_t)v7, 1, v31, v32);
      unint64_t v38 = objc_msgSend_threadExecutionWidth(v13, v33, v34, v35, v36, v37);
      unint64_t v44 = objc_msgSend_maxTotalThreadsPerThreadgroup(v13, v39, v40, v41, v42, v43) / v38;
      v71[0] = objc_msgSend_width(v7, v45, v46, v47, v48, v49);
      v71[1] = objc_msgSend_height(v7, v50, v51, v52, v53, v54);
      v71[2] = 1;
      v70[0] = v38;
      v70[1] = v44;
      v70[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v55, (uint64_t)v71, (uint64_t)v70, v56, v57);
      objc_msgSend_endEncoding(v26, v58, v59, v60, v61, v62);
      objc_msgSend_commit(self->_mtlContext, v63, v64, v65, v66, v67);

      int v68 = 0;
    }
    else
    {
      int v68 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v68 = FigSignalErrorAt();
    v20 = 0;
  }

  return v68;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlContext, 0);

  objc_storeStrong((id *)&self->_aneScalerComputePipelinesState, 0);
}

@end