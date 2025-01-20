@interface GainMapStage
+ (int)prewarmShaders:(id)a3;
- (GainMapStage)initWithMetalContext:(id)a3;
- (int)runWithInput:(id)a3 output:(id)a4 minThreshold:(float)a5 maxThreshold:(float)a6 inputIsLinear:(BOOL)a7 inputScaling:(float)a8;
@end

@implementation GainMapStage

- (GainMapStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
    goto LABEL_4;
  }
  v16.receiver = self;
  v16.super_class = (Class)GainMapStage;
  v6 = [(GainMapStage *)&v16 init];
  self = v6;
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v10 = objc_msgSend_sharedInstance(GainMapShared, v7, v8, v9);
  objc_msgSend_getShaders_(v10, v11, (uint64_t)self->_metalContext, v12);
  v13 = (GainMapShaders *)objc_claimAutoreleasedReturnValue();
  shaders = self->_shaders;
  self->_shaders = v13;

  if (!self->_shaders)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return self;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [GainMapShaders alloc];
    v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);
    if (v7)
    {
      int v8 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v7 = 0;
      int v8 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    v7 = 0;
  }

  return v8;
}

- (int)runWithInput:(id)a3 output:(id)a4 minThreshold:(float)a5 maxThreshold:(float)a6 inputIsLinear:(BOOL)a7 inputScaling:(float)a8
{
  id v12 = a3;
  id v16 = a4;
  uint64_t v75 = 0;
  shaders = self->_shaders;
  if (shaders
    && shaders->_gainMapFilter
    && (objc_msgSend_commandQueue(self->_metalContext, v13, v14, v15),
        v18 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v18, v19, v20, v21),
        v22 = objc_claimAutoreleasedReturnValue(),
        v18,
        v22))
  {
    v26 = objc_msgSend_computeCommandEncoder(v22, v23, v24, v25);
    if (v26)
    {
      v29 = v26;
      unint64_t v74 = __PAIR64__(LODWORD(a6), LODWORD(a5));
      LOBYTE(v75) = a7;
      *((float *)&v75 + 1) = a8;
      objc_msgSend_setComputePipelineState_(v26, v27, (uint64_t)self->_shaders->_gainMapFilter, v28);
      objc_msgSend_setTexture_atIndex_(v29, v30, (uint64_t)v12, 0);
      objc_msgSend_setTexture_atIndex_(v29, v31, (uint64_t)v16, 1);
      objc_msgSend_setBytes_length_atIndex_(v29, v32, (uint64_t)&v74, 16, 0);
      unint64_t v36 = objc_msgSend_threadExecutionWidth(self->_shaders->_gainMapFilter, v33, v34, v35);
      unint64_t v40 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_shaders->_gainMapFilter, v37, v38, v39) / v36;
      v73[0] = (unint64_t)objc_msgSend_width(v16, v41, v42, v43) >> 1;
      v73[1] = (unint64_t)objc_msgSend_height(v16, v44, v45, v46) >> 1;
      v73[2] = 1;
      v72[0] = v36;
      v72[1] = v40;
      v72[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v29, v47, (uint64_t)v73, (uint64_t)v72);
      objc_msgSend_endEncoding(v29, v48, v49, v50);
      if (*MEMORY[0x263F00E10])
      {
        v54 = objc_msgSend_commandQueue(v22, v51, v52, v53);
        v58 = objc_msgSend_commandBuffer(v54, v55, v56, v57);

        objc_msgSend_setLabel_(v58, v59, @"KTRACE_MTLCMDBUF", v60);
        objc_msgSend_addCompletedHandler_(v58, v61, (uint64_t)&unk_270E34248, v62);
        objc_msgSend_commit(v58, v63, v64, v65);
        objc_msgSend_addCompletedHandler_(v22, v66, (uint64_t)&unk_270E34268, v67);
      }
      objc_msgSend_commit(v22, v51, v52, v53);

      int v68 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v68 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v68 = FigSignalErrorAt();
  }

  return v68;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end