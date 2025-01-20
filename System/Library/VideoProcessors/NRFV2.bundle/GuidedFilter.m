@interface GuidedFilter
+ (int)prewarmShaders:(id)a3;
- (GuidedFilter)initWithMetalContext:(id)a3;
- (id)createIntermediateTextureWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7;
- (int)encodeToCommandBuffer:(id)a3 inputTexture:(id)a4 guideTexture:(id)a5 outputTexture:(id)a6 kernelRadius:(unint64_t)a7 epsilon:(float)a8;
@end

@implementation GuidedFilter

- (GuidedFilter)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)GuidedFilter;
  v6 = [(GuidedFilter *)&v16 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v10 = objc_msgSend_sharedInstance(GuidedFilterShared, v7, v8, v9);
  objc_msgSend_getShaders_(v10, v11, (uint64_t)self->_metalContext, v12);
  v13 = (GuidedFilterShaders *)objc_claimAutoreleasedReturnValue();
  shaders = self->_shaders;
  self->_shaders = v13;

  if (!self->_shaders)
  {
LABEL_7:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_4:

  return self;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [GuidedFilterShaders alloc];
    v7 = objc_msgSend_initWithMetalContext_(v4, v5, (uint64_t)v3, v6);
    if (v7)
    {
      int v8 = 0;
    }
    else
    {
      FigDebugAssert3();
      v7 = 0;
      int v8 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    v7 = 0;
  }

  return v8;
}

- (id)createIntermediateTextureWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7
{
  uint64_t v12 = objc_msgSend_allocator(self->_metalContext, a2, a3, a4, a5, a6, a7);
  objc_super v16 = objc_msgSend_newTextureDescriptor(v12, v13, v14, v15);

  if (!v16) {
    goto LABEL_6;
  }
  objc_msgSend_setLabel_(v16, v17, 0, v18);
  v22 = objc_msgSend_desc(v16, v19, v20, v21);
  objc_msgSend_setTextureType_(v22, v23, 2, v24);

  v28 = objc_msgSend_desc(v16, v25, v26, v27);
  objc_msgSend_setPixelFormat_(v28, v29, a3, v30);

  v34 = objc_msgSend_desc(v16, v31, v32, v33);
  objc_msgSend_setWidth_(v34, v35, a4, v36);

  v40 = objc_msgSend_desc(v16, v37, v38, v39);
  objc_msgSend_setHeight_(v40, v41, a5, v42);

  v46 = objc_msgSend_desc(v16, v43, v44, v45);
  objc_msgSend_setDepth_(v46, v47, 1, v48);

  v52 = objc_msgSend_desc(v16, v49, v50, v51);
  objc_msgSend_setUsage_(v52, v53, a6, v54);

  v58 = objc_msgSend_allocator(self->_metalContext, v55, v56, v57);
  v61 = objc_msgSend_newTextureWithDescriptor_(v58, v59, (uint64_t)v16, v60);

  if (!v61)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v61 = 0;
  }

  return v61;
}

- (int)encodeToCommandBuffer:(id)a3 inputTexture:(id)a4 guideTexture:(id)a5 outputTexture:(id)a6 kernelRadius:(unint64_t)a7 epsilon:(float)a8
{
  unsigned __int16 v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v22 = v18;
  v145 = 0;
  v146 = 0;
  id v144 = 0;
  if (!v15)
  {
    uint64_t v129 = v8;
LABEL_16:
    FigDebugAssert3();
    int v122 = FigSignalErrorAt();
    uint64_t v26 = 0;
    objc_msgSend_endEncoding(0, v124, v125, v126, 0, v129);
    goto LABEL_11;
  }
  if (!v16)
  {
    uint64_t v129 = v8;
    goto LABEL_16;
  }
  if (!v17)
  {
    uint64_t v129 = v8;
    goto LABEL_16;
  }
  if (!v18)
  {
    uint64_t v129 = v8;
    goto LABEL_16;
  }
  v143[0] = v10;
  *(float *)&v143[1] = a8;
  uint64_t v26 = objc_msgSend_computeCommandEncoder(v15, v19, v20, v21);
  if (!v26)
  {
    uint64_t v128 = v8;
    int v127 = 0;
LABEL_19:
    FigDebugAssert3();
    int v122 = FigSignalErrorAt();
    goto LABEL_10;
  }
  uint64_t v27 = objc_msgSend_width(v16, v23, v24, v25);
  uint64_t v31 = objc_msgSend_height(v16, v28, v29, v30);
  uint64_t v33 = objc_msgSend_createIntermediateTextureWithFormat_width_height_usage_label_(self, v32, 65, v27, v31, 3, @"gf_small_tex");
  v146 = v33;
  if (!v33)
  {
    uint64_t v128 = v8;
    int v127 = 0;
    goto LABEL_19;
  }
  v34 = v33;
  v35 = self->_shaders->_gfDownsampleGuide;
  objc_msgSend_setComputePipelineState_(v26, v36, (uint64_t)v35, v37);
  objc_msgSend_setTexture_atIndex_(v26, v38, (uint64_t)v16, 0);
  objc_msgSend_setTexture_atIndex_(v26, v39, (uint64_t)v17, 1);
  objc_msgSend_setTexture_atIndex_(v26, v40, (uint64_t)v34, 2);
  objc_msgSend_setImageblockWidth_height_(v26, v41, 32, 32);
  uint64_t v45 = objc_msgSend_width(v34, v42, v43, v44);
  uint64_t v49 = objc_msgSend_height(v34, v46, v47, v48);

  v142[0] = v45;
  v142[1] = v49;
  v142[2] = 1;
  int64x2_t v140 = vdupq_n_s64(0x20uLL);
  uint64_t v141 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v50, (uint64_t)v142, (uint64_t)&v140);
  uint64_t v54 = objc_msgSend_width(v146, v51, v52, v53);
  uint64_t v58 = objc_msgSend_height(v146, v55, v56, v57);
  uint64_t v60 = objc_msgSend_createIntermediateTextureWithFormat_width_height_usage_label_(self, v59, 65, v54, v58, 3, @"gf_coeff_tex");
  v61 = v145;
  v145 = v60;

  if (!v145)
  {
    uint64_t v128 = v8;
    int v127 = 0;
LABEL_22:
    FigDebugAssert3();
    int v122 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v62 = self->_shaders->_gfCalculateCoefficients;
  objc_msgSend_setComputePipelineState_(v26, v63, (uint64_t)v62, v64);
  objc_msgSend_setTexture_atIndex_(v26, v65, (uint64_t)v146, 2);
  objc_msgSend_setTexture_atIndex_(v26, v66, (uint64_t)v145, 3);
  objc_msgSend_setBytes_length_atIndex_(v26, v67, (uint64_t)v143, 8, 0);
  objc_msgSend_setImageblockWidth_height_(v26, v68, 32, 32);
  uint64_t v72 = objc_msgSend_width(v145, v69, v70, v71);
  uint64_t v76 = objc_msgSend_height(v145, v73, v74, v75);

  v139[0] = v72;
  v139[1] = v76;
  v139[2] = 1;
  int64x2_t v137 = vdupq_n_s64(0x20uLL);
  uint64_t v138 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v77, (uint64_t)v139, (uint64_t)&v137);
  FigMetalDecRef();
  uint64_t v81 = objc_msgSend_width(v145, v78, v79, v80);
  uint64_t v85 = objc_msgSend_height(v145, v82, v83, v84);
  v87 = objc_msgSend_createIntermediateTextureWithFormat_width_height_usage_label_(self, v86, 65, v81, v85, 3, @"gf_cmean_tex");
  id v88 = v144;
  id v144 = v87;

  if (!v144)
  {
    uint64_t v128 = v8;
    int v127 = 0;
    goto LABEL_22;
  }
  v89 = self->_shaders->_gfFilterCoefficients;
  objc_msgSend_setComputePipelineState_(v26, v90, (uint64_t)v89, v91);
  objc_msgSend_setTexture_atIndex_(v26, v92, (uint64_t)v145, 3);
  objc_msgSend_setTexture_atIndex_(v26, v93, (uint64_t)v144, 4);
  objc_msgSend_setBytes_length_atIndex_(v26, v94, (uint64_t)v143, 8, 0);
  objc_msgSend_setImageblockWidth_height_(v26, v95, 32, 32);
  uint64_t v99 = objc_msgSend_width(v145, v96, v97, v98);
  uint64_t v103 = objc_msgSend_height(v145, v100, v101, v102);

  v136[0] = v99;
  v136[1] = v103;
  v136[2] = 1;
  int64x2_t v130 = vdupq_n_s64(0x20uLL);
  int64x2_t v134 = v130;
  uint64_t v135 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v104, (uint64_t)v136, (uint64_t)&v134);
  FigMetalDecRef();
  v105 = self->_shaders->_gfApplyCoefficients;
  objc_msgSend_setComputePipelineState_(v26, v106, (uint64_t)v105, v107);
  objc_msgSend_setTexture_atIndex_(v26, v108, (uint64_t)v17, 1);
  objc_msgSend_setTexture_atIndex_(v26, v109, (uint64_t)v144, 4);

  objc_msgSend_setTexture_atIndex_(v26, v110, (uint64_t)v22, 5);
  objc_msgSend_setImageblockWidth_height_(v26, v111, 32, 32);
  v133[0] = objc_msgSend_width(v22, v112, v113, v114);
  v133[1] = objc_msgSend_height(v22, v115, v116, v117);
  v133[2] = 1;
  int64x2_t v131 = v130;
  uint64_t v132 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v118, (uint64_t)v133, (uint64_t)&v131);
  FigMetalDecRef();
  int v122 = 0;
LABEL_10:
  objc_msgSend_endEncoding(v26, v119, v120, v121, v127, v128);
LABEL_11:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v122;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end