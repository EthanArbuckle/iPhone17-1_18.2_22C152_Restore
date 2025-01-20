@interface OutliersRemovalStage
+ (int)prewarmShaders:(id)a3;
- (OutliersRemovalStage)initWithMetalContext:(id)a3;
- (int)runWithInput:(id)a3 output:(id)a4 gamma:(float)a5;
@end

@implementation OutliersRemovalStage

- (OutliersRemovalStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)OutliersRemovalStage;
  v6 = [(OutliersRemovalStage *)&v18 init];
  v7 = (uint64_t *)v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  if (!v7[1]) {
    goto LABEL_5;
  }
  v11 = objc_msgSend_sharedInstance(OutliersRemovalShared, v8, v9, v10);
  uint64_t v14 = objc_msgSend_getShaders_(v11, v12, v7[1], v13);
  v15 = (void *)v7[2];
  v7[2] = v14;

  if (!v7[2])
  {
LABEL_5:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  v16 = v7;
LABEL_7:

  return v16;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [OutliersRemovalShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (int)runWithInput:(id)a3 output:(id)a4 gamma:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  float v47 = a5;
  uint64_t v13 = objc_msgSend_commandQueue(self->_metal, v10, v11, v12);
  v17 = objc_msgSend_commandBuffer(v13, v14, v15, v16);

  if (v17
    && (objc_msgSend_computeCommandEncoder(v17, v18, v19, v20),
        (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v24 = v21;
    objc_msgSend_setComputePipelineState_(v21, v22, (uint64_t)self->_shaders->_outiersRemovalFilter, v23);
    objc_msgSend_setTexture_atIndex_(v24, v25, (uint64_t)v8, 0);
    objc_msgSend_setTexture_atIndex_(v24, v26, (uint64_t)v9, 1);
    objc_msgSend_setBytes_length_atIndex_(v24, v27, (uint64_t)&v47, 4, 0);
    objc_msgSend_setImageblockWidth_height_(v24, v28, 32, 32);
    v46[0] = (unint64_t)objc_msgSend_width(v9, v29, v30, v31) >> 1;
    v46[1] = (unint64_t)objc_msgSend_height(v9, v32, v33, v34) >> 1;
    v46[2] = 1;
    int64x2_t v44 = vdupq_n_s64(0x10uLL);
    uint64_t v45 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v24, v35, (uint64_t)v46, (uint64_t)&v44);
    objc_msgSend_endEncoding(v24, v36, v37, v38);
    objc_msgSend_commit(v17, v39, v40, v41);

    int v42 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
  }

  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end