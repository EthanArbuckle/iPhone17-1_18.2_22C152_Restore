@interface FuseRemixFragmentShader
- (FuseRemixFragmentShader)initWithMetal:(id)a3 fragName:(id)a4 pixelFormat:(unint64_t)a5 noisePixelFormat:(unint64_t)a6 isFirstBatch:(BOOL)a7 isLastBatch:(BOOL)a8 usePatchBasedFusion:(BOOL)a9 useGpuCSC:(BOOL)a10 ggmEnabled:(BOOL)a11;
@end

@implementation FuseRemixFragmentShader

- (FuseRemixFragmentShader)initWithMetal:(id)a3 fragName:(id)a4 pixelFormat:(unint64_t)a5 noisePixelFormat:(unint64_t)a6 isFirstBatch:(BOOL)a7 isLastBatch:(BOOL)a8 usePatchBasedFusion:(BOOL)a9 useGpuCSC:(BOOL)a10 ggmEnabled:(BOOL)a11
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  BOOL v113 = a7;
  BOOL v112 = a8;
  BOOL v111 = a9;
  BOOL v110 = a10;
  BOOL v109 = a11;
  v108.receiver = self;
  v108.super_class = (Class)FuseRemixFragmentShader;
  v18 = [(FuseRemixFragmentShader *)&v108 init];
  v103 = v17;
  if (!v18)
  {
    FigDebugAssert3();
    v33 = 0;
    v43 = 0;
    v48 = 0;
    v21 = 0;
    id v44 = 0;
    goto LABEL_23;
  }
  BOOL v107 = a6 != 0;
  v19 = objc_opt_new();
  v21 = v19;
  if (!v19)
  {
    FigDebugAssert3();
    v33 = 0;
LABEL_19:
    v43 = 0;
    v48 = 0;
    id v44 = 0;
    goto LABEL_23;
  }
  objc_msgSend_setConstantValue_type_atIndex_(v19, v20, (uint64_t)&v107, 53, 1);
  objc_msgSend_setConstantValue_type_atIndex_(v21, v22, (uint64_t)&v113, 53, 2);
  objc_msgSend_setConstantValue_type_atIndex_(v21, v23, (uint64_t)&v112, 53, 3);
  objc_msgSend_setConstantValue_type_atIndex_(v21, v24, (uint64_t)&v111, 53, 4);
  objc_msgSend_setConstantValue_type_atIndex_(v21, v25, (uint64_t)&v110, 53, 5);
  objc_msgSend_setConstantValue_type_atIndex_(v21, v26, (uint64_t)&v109, 53, 6);
  v30 = objc_msgSend_library(v16, v27, v28, v29);
  v33 = objc_msgSend_newFunctionWithName_(v30, v31, @"FusionVert", v32);

  if (!v33)
  {
    FigDebugAssert3();
    goto LABEL_19;
  }
  v37 = objc_msgSend_library(v16, v34, v35, v36);
  v41 = objc_msgSend_pipelineLibrary(v16, v38, v39, v40);
  id v106 = 0;
  v43 = objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v37, v42, (uint64_t)v17, (uint64_t)v21, v41, &v106);
  id v44 = v106;

  if (!v43)
  {
    FigDebugAssert3();
    v48 = 0;
    goto LABEL_23;
  }
  id v45 = objc_alloc_init(MEMORY[0x263F129C0]);
  v48 = v45;
  if (!v45)
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  objc_msgSend_setVertexFunction_(v45, v46, (uint64_t)v33, v47);
  objc_msgSend_setFragmentFunction_(v48, v49, (uint64_t)v43, v50);
  v54 = objc_msgSend_fullRangeVertexDesc(v16, v51, v52, v53);
  objc_msgSend_setVertexDescriptor_(v48, v55, (uint64_t)v54, v56);

  v60 = objc_msgSend_colorAttachments(v48, v57, v58, v59);
  v63 = objc_msgSend_objectAtIndexedSubscript_(v60, v61, 0, v62);
  objc_msgSend_setPixelFormat_(v63, v64, a5, v65);

  if (v107)
  {
    v69 = objc_msgSend_colorAttachments(v48, v66, v67, v68);
    v72 = objc_msgSend_objectAtIndexedSubscript_(v69, v70, 1, v71);
    objc_msgSend_setPixelFormat_(v72, v73, a6, v74);
  }
  if (!v113 || !v112)
  {
    v75 = objc_msgSend_colorAttachments(v48, v66, v67, v68);
    v78 = objc_msgSend_objectAtIndexedSubscript_(v75, v76, 2, v77);
    objc_msgSend_setPixelFormat_(v78, v79, a5, v80);

    if (!v113 && !v107)
    {
      v81 = objc_msgSend_colorAttachments(v48, v66, v67, v68);
      v84 = objc_msgSend_objectAtIndexedSubscript_(v81, v82, 3, v83);
      objc_msgSend_setPixelFormat_(v84, v85, a5, v86);
    }
  }
  v87 = objc_msgSend_pipelineLibrary(v16, v66, v67, v68);
  objc_msgSend_setPipelineLibrary_(v48, v88, (uint64_t)v87, v89);

  v93 = objc_msgSend_device(v16, v90, v91, v92);
  id v105 = v44;
  uint64_t v95 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v93, v94, (uint64_t)v48, (uint64_t)&v105);
  id v96 = v105;

  pipeline = v18->_pipeline;
  v18->_pipeline = (MTLRenderPipelineState *)v95;

  if (!v18->_pipeline)
  {
    FigDebugAssert3();
    id v44 = v96;
LABEL_23:
    int v101 = FigSignalErrorAt();
    v98 = 0;
    if (v101) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v18->_fragName, obj);
  id v44 = v96;
LABEL_14:
  v98 = v18;
LABEL_15:
  v99 = v98;

  return v99;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragName, 0);

  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end