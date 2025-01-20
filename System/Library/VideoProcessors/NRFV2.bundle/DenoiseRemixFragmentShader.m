@interface DenoiseRemixFragmentShader
- (DenoiseRemixFragmentShader)initWithMetal:(id)a3 vertFunc:(id)a4 fragName:(id)a5 constantValues:(id)a6 pixelFormat:(unint64_t)a7 pixelFormat2:(unint64_t)a8;
@end

@implementation DenoiseRemixFragmentShader

- (DenoiseRemixFragmentShader)initWithMetal:(id)a3 vertFunc:(id)a4 fragName:(id)a5 constantValues:(id)a6 pixelFormat:(unint64_t)a7 pixelFormat2:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id obj = a5;
  id v16 = a5;
  id v17 = a6;
  v75.receiver = self;
  v75.super_class = (Class)DenoiseRemixFragmentShader;
  v21 = [(DenoiseRemixFragmentShader *)&v75 init];
  if (!v21)
  {
    FigDebugAssert3();
    v28 = 0;
    v32 = 0;
    id v66 = 0;
    goto LABEL_17;
  }
  v22 = objc_msgSend_library(v14, v18, v19, v20);
  v26 = objc_msgSend_pipelineLibrary(v14, v23, v24, v25);
  v28 = objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v22, v27, (uint64_t)v16, (uint64_t)v17, v26, 0);

  if (!v28)
  {
    FigDebugAssert3();
    v32 = 0;
LABEL_15:
    id v66 = 0;
    goto LABEL_17;
  }
  id v29 = objc_alloc_init(MEMORY[0x263F129C0]);
  v32 = v29;
  if (!v29)
  {
    FigDebugAssert3();
    goto LABEL_15;
  }
  id v72 = v16;
  id v33 = v15;
  objc_msgSend_setVertexFunction_(v29, v30, (uint64_t)v15, v31);
  objc_msgSend_setFragmentFunction_(v32, v34, (uint64_t)v28, v35);
  v39 = objc_msgSend_fullRangeVertexDesc(v14, v36, v37, v38);
  objc_msgSend_setVertexDescriptor_(v32, v40, (uint64_t)v39, v41);

  if (a7)
  {
    v45 = objc_msgSend_colorAttachments(v32, v42, v43, v44);
    v48 = objc_msgSend_objectAtIndexedSubscript_(v45, v46, 0, v47);
    objc_msgSend_setPixelFormat_(v48, v49, a7, v50);
  }
  if (a8)
  {
    v51 = objc_msgSend_colorAttachments(v32, v42, v43, v44);
    v54 = objc_msgSend_objectAtIndexedSubscript_(v51, v52, 1, v53);
    objc_msgSend_setPixelFormat_(v54, v55, a8, v56);
  }
  v57 = objc_msgSend_pipelineLibrary(v14, v42, v43, v44);
  objc_msgSend_setPipelineLibrary_(v32, v58, (uint64_t)v57, v59);

  v63 = objc_msgSend_device(v14, v60, v61, v62);
  id v74 = 0;
  uint64_t v65 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v63, v64, (uint64_t)v32, (uint64_t)&v74);
  id v66 = v74;
  pipeline = v21->_pipeline;
  v21->_pipeline = (MTLRenderPipelineState *)v65;

  if (!v21->_pipeline)
  {
    FigDebugAssert3();
    id v15 = v33;
    id v16 = v72;
LABEL_17:
    int v71 = FigSignalErrorAt();
    v68 = 0;
    if (v71) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v21->_fragName, obj);
  id v15 = v33;
  id v16 = v72;
LABEL_10:
  v68 = v21;
LABEL_11:
  v69 = v68;

  return v69;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragName, 0);

  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end