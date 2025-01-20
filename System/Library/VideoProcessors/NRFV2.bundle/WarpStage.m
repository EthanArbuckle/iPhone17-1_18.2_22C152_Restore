@interface WarpStage
+ (int)prewarmShaders:(id)a3;
- (id)initWarpStage:(id)a3;
- (uint64_t)runWarpUsingTransform:(__n128)a3 inputLumaTex:(__n128)a4 inputChromaTex:(uint64_t)a5 outputLumaTex:(void *)a6 outputChromaTex:(void *)a7;
- (uint64_t)runWarpUsingTransform:(__n128)a3 inputYCbCrTex:(__n128)a4 inputCscParams:(uint64_t)a5 outputLinearLumaTex:(void *)a6 outputLinearChromaTex:(uint64_t)a7;
@end

@implementation WarpStage

- (id)initWarpStage:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WarpStage;
  v6 = [(WarpStage *)&v18 init];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(WarpStageShared, v8, v9, v10);
    v14 = objc_msgSend_getShaders_(v11, v12, v7[1], v13);

    v15 = v7;
    if (!v14)
    {
      FigDebugAssert3();
      v15 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v15 = 0;
    v14 = 0;
  }
  v16 = v15;

  return v16;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [WarpShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7)
  {
    int v8 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v8 = -12786;
  }

  return v8;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputLumaTex:(__n128)a4 inputChromaTex:(uint64_t)a5 outputLumaTex:(void *)a6 outputChromaTex:(void *)a7
{
  v71[0] = a2;
  v71[1] = a3;
  v71[2] = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  v20 = objc_msgSend_sharedInstance(WarpStageShared, v17, v18, v19);
  objc_msgSend_getShaders_(v20, v21, *(void *)(a1 + 8), v22);
  v23 = (uint64_t *)objc_claimAutoreleasedReturnValue();

  if (v23
    && (objc_msgSend_commandQueue(*(void **)(a1 + 8), v24, v25, v26),
        v27 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v27, v28, v29, v30),
        v31 = objc_claimAutoreleasedReturnValue(),
        v27,
        v31))
  {
    v35 = objc_msgSend_computeCommandEncoder(v31, v32, v33, v34);
    objc_msgSend_setImageblockWidth_height_(v35, v36, 32, 32);
    objc_msgSend_setComputePipelineState_(v35, v37, v23[1], v38);
    objc_msgSend_setBytes_length_atIndex_(v35, v39, (uint64_t)v71, 48, 0);
    objc_msgSend_setTexture_atIndex_(v35, v40, (uint64_t)v13, 0);
    objc_msgSend_setTexture_atIndex_(v35, v41, (uint64_t)v15, 1);
    v70[0] = objc_msgSend_width(v15, v42, v43, v44);
    v70[1] = objc_msgSend_height(v15, v45, v46, v47);
    v70[2] = 1;
    int64x2_t v66 = vdupq_n_s64(0x20uLL);
    int64x2_t v68 = v66;
    uint64_t v69 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v35, v48, (uint64_t)v70, (uint64_t)&v68);
    objc_msgSend_setTexture_atIndex_(v35, v49, (uint64_t)v14, 0);
    objc_msgSend_setTexture_atIndex_(v35, v50, (uint64_t)v16, 1);
    v67[0] = objc_msgSend_width(v14, v51, v52, v53);
    v67[1] = objc_msgSend_height(v14, v54, v55, v56);
    v67[2] = 1;
    int64x2_t v68 = v66;
    uint64_t v69 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v35, v57, (uint64_t)v67, (uint64_t)&v68);
    objc_msgSend_endEncoding(v35, v58, v59, v60);
    objc_msgSend_commit(v31, v61, v62, v63);

    uint64_t v64 = 0;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v64 = FigSignalErrorAt();
  }

  return v64;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputYCbCrTex:(__n128)a4 inputCscParams:(uint64_t)a5 outputLinearLumaTex:(void *)a6 outputLinearChromaTex:(uint64_t)a7
{
  v67[0] = a2;
  v67[1] = a3;
  v67[2] = a4;
  id v13 = a6;
  id v14 = a8;
  id v15 = a9;
  if (objc_msgSend_pixelFormat(v14, v16, v17, v18) == 25 && objc_msgSend_pixelFormat(v15, v19, v20, v21) == 65)
  {
    uint64_t v25 = objc_msgSend_sharedInstance(WarpStageShared, v22, v23, v24);
    objc_msgSend_getShaders_(v25, v26, *(void *)(a1 + 8), v27);
    v28 = (uint64_t *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      if (a7
        && (objc_msgSend_commandQueue(*(void **)(a1 + 8), v29, v30, v31),
            v32 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_commandBuffer(v32, v33, v34, v35),
            v36 = objc_claimAutoreleasedReturnValue(),
            v32,
            v36))
      {
        v40 = objc_msgSend_computeCommandEncoder(v36, v37, v38, v39);
        objc_msgSend_setComputePipelineState_(v40, v41, v28[2], v42);
        objc_msgSend_setImageblockWidth_height_(v40, v43, 32, 32);
        objc_msgSend_setBytes_length_atIndex_(v40, v44, (uint64_t)v67, 48, 0);
        objc_msgSend_setBytes_length_atIndex_(v40, v45, a7, 208, 1);
        objc_msgSend_setTexture_atIndex_(v40, v46, (uint64_t)v13, 0);
        objc_msgSend_setTexture_atIndex_(v40, v47, (uint64_t)v14, 1);
        objc_msgSend_setTexture_atIndex_(v40, v48, (uint64_t)v15, 2);
        v66[0] = objc_msgSend_width(v15, v49, v50, v51);
        v66[1] = objc_msgSend_height(v15, v52, v53, v54);
        v66[2] = 1;
        int64x2_t v64 = vdupq_n_s64(0x10uLL);
        uint64_t v65 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v40, v55, (uint64_t)v66, (uint64_t)&v64);
        objc_msgSend_endEncoding(v40, v56, v57, v58);
        objc_msgSend_commit(v36, v59, v60, v61);

        uint64_t v62 = 0;
      }
      else
      {
        FigDebugAssert3();
        uint64_t v62 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t v62 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v62 = 4294954516;
  }

  return v62;
}

- (void).cxx_destruct
{
}

@end