@interface BilateralGridShaders
- (BilateralGridShaders)initWithMetal:(id)a3 normalizeGridConfidence:(BOOL)a4;
- (id)createBasicComputeShader:(const char *)a3 metal:(id)a4;
@end

@implementation BilateralGridShaders

- (BilateralGridShaders)initWithMetal:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  uint64_t v162 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v159 = a4;
  uint64_t v160 = 0;
  uint64_t v161 = 0;
  v158.receiver = self;
  v158.super_class = (Class)BilateralGridShaders;
  v7 = [(BilateralGridShaders *)&v158 init];
  v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_34;
  }
  int v157 = 0;
  bgSplat = v7->_bgSplat;
  do
  {
    uint64_t v10 = objc_opt_new();
    v11 = (void *)*(&v160 + v157);
    *(&v160 + v157) = v10;

    v13 = (void *)*(&v160 + v157);
    if (!v13) {
      goto LABEL_31;
    }
    objc_msgSend_setConstantValue_type_atIndex_(v13, v12, (uint64_t)&v157, 53, 3);
    uint64_t v15 = objc_msgSend_computePipelineStateFor_constants_(v6, v14, @"bg_splat", *(&v160 + v157));
    v16 = bgSplat[v157];
    bgSplat[v157] = (MTLComputePipelineState *)v15;

    int v17 = v157;
    if (!bgSplat[v157]) {
      goto LABEL_31;
    }
    ++v157;
  }
  while (v17 <= 0);
  int v157 = 0;
  bgBlur = v8->_bgBlur;
  do
  {
    v19 = objc_opt_new();
    v21 = v19;
    if (!v19) {
      goto LABEL_32;
    }
    objc_msgSend_setConstantValue_type_atIndex_(v19, v20, (uint64_t)&v157, 29, 2);
    objc_msgSend_setConstantValue_type_atIndex_(v21, v22, (uint64_t)&v159, 53, 1);
    uint64_t v24 = objc_msgSend_computePipelineStateFor_constants_(v6, v23, @"bg_blur", (uint64_t)v21);
    v25 = bgBlur[v157];
    bgBlur[v157] = (MTLComputePipelineState *)v24;

    if (!bgBlur[v157]) {
      goto LABEL_32;
    }

    int v26 = v157++;
  }
  while (v26 < 2);
  v27 = objc_opt_new();
  v21 = v27;
  if (!v27
    || (objc_msgSend_setConstantValue_type_atIndex_(v27, v28, (uint64_t)&v159, 53, 1),
        objc_msgSend_computePipelineStateFor_constants_(v6, v29, @"bg_norm", (uint64_t)v21),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        bgNormalize = v8->_bgNormalize,
        v8->_bgNormalize = (MTLComputePipelineState *)v30,
        bgNormalize,
        !v8->_bgNormalize))
  {
LABEL_32:
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_33:

    goto LABEL_34;
  }

  v35 = objc_msgSend_library(v6, v32, v33, v34);
  v21 = objc_msgSend_newFunctionWithName_(v35, v36, @"BilateralUpsample_vert", v37);

  if (!v21) {
    sub_26301157C();
  }
  v41 = objc_msgSend_library(v6, v38, v39, v40);
  uint64_t v42 = v160;
  v46 = objc_msgSend_pipelineLibrary(v6, v43, v44, v45);
  id v156 = 0;
  v48 = objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v41, v47, @"BilateralUpsample_frag", v42, v46, &v156);
  id v49 = v156;

  if (!v48) {
    sub_2630115A8();
  }
  v53 = objc_msgSend_library(v6, v50, v51, v52);
  uint64_t v54 = v161;
  v58 = objc_msgSend_pipelineLibrary(v6, v55, v56, v57);
  id v155 = v49;
  v60 = objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v53, v59, @"BilateralUpsample_frag", v54, v58, &v155);
  id v61 = v155;

  if (!v60) {
    sub_2630115D4();
  }
  id v62 = objc_alloc_init(MEMORY[0x263F129C0]);
  v66 = objc_msgSend_pipelineLibrary(v6, v63, v64, v65);
  objc_msgSend_setPipelineLibrary_(v62, v67, (uint64_t)v66, v68);

  objc_msgSend_setVertexFunction_(v62, v69, (uint64_t)v21, v70);
  objc_msgSend_setFragmentFunction_(v62, v71, (uint64_t)v48, v72);
  v76 = objc_msgSend_fullRangeVertexDesc(v6, v73, v74, v75);
  objc_msgSend_setVertexDescriptor_(v62, v77, (uint64_t)v76, v78);

  v82 = objc_msgSend_colorAttachments(v62, v79, v80, v81);
  v85 = objc_msgSend_objectAtIndexedSubscript_(v82, v83, 0, v84);
  objc_msgSend_setPixelFormat_(v85, v86, 10, v87);

  v91 = objc_msgSend_device(v6, v88, v89, v90);
  id v154 = v61;
  uint64_t v93 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v91, v92, (uint64_t)v62, (uint64_t)&v154);
  id v94 = v154;

  bgUpsample8 = v8->_bgUpsample8;
  v8->_bgUpsample8 = (MTLRenderPipelineState *)v93;

  if (!v8->_bgUpsample8) {
    goto LABEL_43;
  }
  v99 = objc_msgSend_colorAttachments(v62, v96, v97, v98);
  v102 = objc_msgSend_objectAtIndexedSubscript_(v99, v100, 0, v101);
  objc_msgSend_setPixelFormat_(v102, v103, 25, v104);

  v108 = objc_msgSend_device(v6, v105, v106, v107);
  id v153 = v94;
  uint64_t v110 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v108, v109, (uint64_t)v62, (uint64_t)&v153);
  id v111 = v153;

  bgUpsample16 = v8->_bgUpsample16;
  v8->_bgUpsample16 = (MTLRenderPipelineState *)v110;

  if (!v8->_bgUpsample16)
  {
    FigDebugAssert3();
    id v94 = v111;
LABEL_44:
    FigSignalErrorAt();

    goto LABEL_33;
  }
  objc_msgSend_setFragmentFunction_(v62, v113, (uint64_t)v60, v114);
  v118 = objc_msgSend_device(v6, v115, v116, v117);
  id v152 = v111;
  uint64_t v120 = objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v118, v119, (uint64_t)v62, (uint64_t)&v152);
  id v94 = v152;

  bgUpsample16ToneMapped = v8->_bgUpsample16ToneMapped;
  v8->_bgUpsample16ToneMapped = (MTLRenderPipelineState *)v120;

  if (!v8->_bgUpsample16ToneMapped)
  {
LABEL_43:
    FigDebugAssert3();
    goto LABEL_44;
  }

  uint64_t v123 = objc_msgSend_createBasicComputeShader_metal_(v8, v122, (uint64_t)"bg_bistochastize_init", (uint64_t)v6);
  bgBistochastizeInit = v8->_bgBistochastizeInit;
  v8->_bgBistochastizeInit = (MTLComputePipelineState *)v123;

  if (v8->_bgBistochastizeInit)
  {
    uint64_t v126 = objc_msgSend_createBasicComputeShader_metal_(v8, v125, (uint64_t)"bg_bistochastize_iter", (uint64_t)v6);
    bgBistochastizeIter = v8->_bgBistochastizeIter;
    v8->_bgBistochastizeIter = (MTLComputePipelineState *)v126;

    if (v8->_bgBistochastizeIter)
    {
      uint64_t v129 = objc_msgSend_createBasicComputeShader_metal_(v8, v128, (uint64_t)"bg_bistochastize_final", (uint64_t)v6);
      bgBistochastizeFinal = v8->_bgBistochastizeFinal;
      v8->_bgBistochastizeFinal = (MTLComputePipelineState *)v129;

      if (v8->_bgBistochastizeFinal)
      {
        uint64_t v132 = objc_msgSend_createBasicComputeShader_metal_(v8, v131, (uint64_t)"bg_solver_init1", (uint64_t)v6);
        bgSolverInit1 = v8->_bgSolverInit1;
        v8->_bgSolverInit1 = (MTLComputePipelineState *)v132;

        if (v8->_bgSolverInit1)
        {
          uint64_t v135 = objc_msgSend_createBasicComputeShader_metal_(v8, v134, (uint64_t)"bg_solver_init2", (uint64_t)v6);
          bgSolverInit2 = v8->_bgSolverInit2;
          v8->_bgSolverInit2 = (MTLComputePipelineState *)v135;

          if (v8->_bgSolverInit2)
          {
            uint64_t v138 = objc_msgSend_createBasicComputeShader_metal_(v8, v137, (uint64_t)"bg_solver_pcg_iter0", (uint64_t)v6);
            bgSolverPcgIter0 = v8->_bgSolverPcgIter0;
            v8->_bgSolverPcgIter0 = (MTLComputePipelineState *)v138;

            if (v8->_bgSolverPcgIter0)
            {
              uint64_t v141 = objc_msgSend_createBasicComputeShader_metal_(v8, v140, (uint64_t)"bg_solver_pcg_iter1", (uint64_t)v6);
              bgSolverPcgIter1 = v8->_bgSolverPcgIter1;
              v8->_bgSolverPcgIter1 = (MTLComputePipelineState *)v141;

              if (v8->_bgSolverPcgIter1)
              {
                uint64_t v144 = objc_msgSend_createBasicComputeShader_metal_(v8, v143, (uint64_t)"bg_solver_pcg_iter2", (uint64_t)v6);
                bgSolverPcgIter2 = v8->_bgSolverPcgIter2;
                v8->_bgSolverPcgIter2 = (MTLComputePipelineState *)v144;

                if (v8->_bgSolverPcgIter2)
                {
                  uint64_t v147 = objc_msgSend_createBasicComputeShader_metal_(v8, v146, (uint64_t)"bg_solver_pcg_iter3", (uint64_t)v6);
                  bgSolverPcgIter3 = v8->_bgSolverPcgIter3;
                  v8->_bgSolverPcgIter3 = (MTLComputePipelineState *)v147;

                  if (v8->_bgSolverPcgIter3)
                  {
                    v149 = v8;
                    goto LABEL_28;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_31:
  FigDebugAssert3();
  FigSignalErrorAt();
LABEL_34:
  v149 = 0;
LABEL_28:
  for (uint64_t i = 8; i != -8; i -= 8)

  return v149;
}

- (id)createBasicComputeShader:(const char *)a3 metal:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  v9 = objc_msgSend_stringWithUTF8String_(v5, v7, (uint64_t)a3, v8);
  v11 = objc_msgSend_computePipelineStateFor_constants_(v6, v10, (uint64_t)v9, 0);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgSolverPcgIter3, 0);
  objc_storeStrong((id *)&self->_bgSolverPcgIter2, 0);
  objc_storeStrong((id *)&self->_bgSolverPcgIter1, 0);
  objc_storeStrong((id *)&self->_bgSolverPcgIter0, 0);
  objc_storeStrong((id *)&self->_bgSolverInit2, 0);
  objc_storeStrong((id *)&self->_bgSolverInit1, 0);
  objc_storeStrong((id *)&self->_bgBistochastizeFinal, 0);
  objc_storeStrong((id *)&self->_bgBistochastizeIter, 0);
  objc_storeStrong((id *)&self->_bgBistochastizeInit, 0);
  objc_storeStrong((id *)&self->_bgUpsample16ToneMapped, 0);
  objc_storeStrong((id *)&self->_bgUpsample16, 0);
  objc_storeStrong((id *)&self->_bgUpsample8, 0);
  objc_storeStrong((id *)&self->_bgNormalize, 0);
  for (uint64_t i = 40; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end