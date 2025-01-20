@interface ToneMappingShaders
- (ToneMappingShaders)initWithMetal:(id)a3;
@end

@implementation ToneMappingShaders

- (ToneMappingShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)ToneMappingShaders;
  v5 = [(ToneMappingShaders *)&v69 init];
  if (v5)
  {
    v7 = objc_opt_new();
    if (!v7) {
      goto LABEL_25;
    }
    uint64_t v8 = objc_msgSend_computePipelineStateFor_constants_(v4, v6, @"blackSubtractAndAddingContrast", 0);
    blackSubtractAndAddingContrast = v5->_blackSubtractAndAddingContrast;
    v5->_blackSubtractAndAddingContrast = (MTLComputePipelineState *)v8;

    if (!v5->_blackSubtractAndAddingContrast) {
      goto LABEL_25;
    }
    uint64_t v11 = objc_msgSend_computePipelineStateFor_constants_(v4, v10, @"calculateBlackWhiteStrengthCenter", 0);
    calculateBlackWhiteStrengthCenter = v5->_calculateBlackWhiteStrengthCenter;
    v5->_calculateBlackWhiteStrengthCenter = (MTLComputePipelineState *)v11;

    if (!v5->_calculateBlackWhiteStrengthCenter) {
      goto LABEL_25;
    }
    char v68 = 0;
    objc_msgSend_setConstantValue_type_atIndex_(v7, v13, (uint64_t)&v68, 53, 1);
    uint64_t v15 = objc_msgSend_computePipelineStateFor_constants_(v4, v14, @"LTM", (uint64_t)v7);
    ltmApply = v5->_ltmApply;
    v5->_ltmApply = (MTLComputePipelineState *)v15;

    if (!v5->_ltmApply) {
      goto LABEL_25;
    }
    char v68 = 1;
    objc_msgSend_setConstantValue_type_atIndex_(v7, v17, (uint64_t)&v68, 53, 1);
    uint64_t v19 = objc_msgSend_computePipelineStateFor_constants_(v4, v18, @"LTM", (uint64_t)v7);
    ltmApplyBG = v5->_ltmApplyBG;
    v5->_ltmApplyBG = (MTLComputePipelineState *)v19;

    if (!v5->_ltmApplyBG) {
      goto LABEL_25;
    }
    uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v4, v21, @"srlGlobalSparseHistogram", 0);
    srlGlobalHistogram = v5->_srlGlobalHistogram;
    v5->_srlGlobalHistogram = (MTLComputePipelineState *)v22;

    if (!v5->_srlGlobalHistogram) {
      goto LABEL_25;
    }
    uint64_t v25 = objc_msgSend_computePipelineStateFor_constants_(v4, v24, @"srlFaceSparseHistogram", 0);
    srlFaceHistogram = v5->_srlFaceHistogram;
    v5->_srlFaceHistogram = (MTLComputePipelineState *)v25;

    if (!v5->_srlFaceHistogram) {
      goto LABEL_25;
    }
    uint64_t v28 = objc_msgSend_computePipelineStateFor_constants_(v4, v27, @"srlCalcCoefficients", 0);
    srlCalcCoefficients = v5->_srlCalcCoefficients;
    v5->_srlCalcCoefficients = (MTLComputePipelineState *)v28;

    if (!v5->_srlCalcCoefficients) {
      goto LABEL_25;
    }
    uint64_t v31 = objc_msgSend_computePipelineStateFor_constants_(v4, v30, @"srlApply", 0);
    srlApply = v5->_srlApply;
    v5->_srlApply = (MTLComputePipelineState *)v31;

    if (!v5->_srlApply) {
      goto LABEL_25;
    }
    uint64_t v34 = objc_msgSend_computePipelineStateFor_constants_(v4, v33, @"sffTestFace", 0);
    sffTestFace = v5->_sffTestFace;
    v5->_sffTestFace = (MTLComputePipelineState *)v34;

    if (!v5->_sffTestFace) {
      goto LABEL_25;
    }
    uint64_t v37 = objc_msgSend_computePipelineStateFor_constants_(v4, v36, @"sffFillFace", 0);
    sffFillFace = v5->_sffFillFace;
    v5->_sffFillFace = (MTLComputePipelineState *)v37;

    if (!v5->_sffFillFace) {
      goto LABEL_25;
    }
    uint64_t v40 = objc_msgSend_computePipelineStateFor_constants_(v4, v39, @"mstmCombineAndDownsampleMask", 0);
    mstmCombineAndDownsampleMask = v5->_mstmCombineAndDownsampleMask;
    v5->_mstmCombineAndDownsampleMask = (MTLComputePipelineState *)v40;

    if (!v5->_mstmCombineAndDownsampleMask) {
      goto LABEL_25;
    }
    uint64_t v43 = objc_msgSend_computePipelineStateFor_constants_(v4, v42, @"mstmDownsampleMask", 0);
    mstmDownsampleMask = v5->_mstmDownsampleMask;
    v5->_mstmDownsampleMask = (MTLComputePipelineState *)v43;

    if (!v5->_mstmDownsampleMask) {
      goto LABEL_25;
    }
    uint64_t v46 = objc_msgSend_computePipelineStateFor_constants_(v4, v45, @"mstmsDownsampleInitial", 0);
    mstmDownsampleInitial = v5->_mstmDownsampleInitial;
    v5->_mstmDownsampleInitial = (MTLComputePipelineState *)v46;

    if (!v5->_mstmDownsampleInitial) {
      goto LABEL_25;
    }
    uint64_t v49 = objc_msgSend_computePipelineStateFor_constants_(v4, v48, @"mstmsDownsampleSubsequent", 0);
    mstmDownsampleSubsequent = v5->_mstmDownsampleSubsequent;
    v5->_mstmDownsampleSubsequent = (MTLComputePipelineState *)v49;

    if (!v5->_mstmDownsampleSubsequent) {
      goto LABEL_25;
    }
    uint64_t v52 = objc_msgSend_computePipelineStateFor_constants_(v4, v51, @"mstmsRemixIntermediate", 0);
    mstmPyramidRemixIntermediate = v5->_mstmPyramidRemixIntermediate;
    v5->_mstmPyramidRemixIntermediate = (MTLComputePipelineState *)v52;

    if (!v5->_mstmPyramidRemixIntermediate) {
      goto LABEL_25;
    }
    uint64_t v55 = objc_msgSend_computePipelineStateFor_constants_(v4, v54, @"mstmsRemixFinal", 0);
    mstmPyramidRemixFinal = v5->_mstmPyramidRemixFinal;
    v5->_mstmPyramidRemixFinal = (MTLComputePipelineState *)v55;

    if (!v5->_mstmPyramidRemixFinal) {
      goto LABEL_25;
    }
    uint64_t v58 = objc_msgSend_computePipelineStateFor_constants_(v4, v57, @"mstmsDiffusionOdd", 0);
    mstmDiffusionOdd = v5->_mstmDiffusionOdd;
    v5->_mstmDiffusionOdd = (MTLComputePipelineState *)v58;

    if (!v5->_mstmDiffusionOdd) {
      goto LABEL_25;
    }
    uint64_t v61 = objc_msgSend_computePipelineStateFor_constants_(v4, v60, @"mstmsDiffusionEven", 0);
    mstmDiffusionEven = v5->_mstmDiffusionEven;
    v5->_mstmDiffusionEven = (MTLComputePipelineState *)v61;

    if (!v5->_mstmDiffusionEven
      || (objc_msgSend_computePipelineStateFor_constants_(v4, v63, @"mstmsApply", 0),
          uint64_t v64 = objc_claimAutoreleasedReturnValue(),
          mstmsApply = v5->_mstmsApply,
          v5->_mstmsApply = (MTLComputePipelineState *)v64,
          mstmsApply,
          !v5->_mstmsApply))
    {
LABEL_25:
      FigDebugAssert3();
      FigSignalErrorAt();

      v66 = 0;
      goto LABEL_24;
    }
  }
  v66 = v5;
LABEL_24:

  return v66;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstmsApply, 0);
  objc_storeStrong((id *)&self->_mstmDiffusionEven, 0);
  objc_storeStrong((id *)&self->_mstmDiffusionOdd, 0);
  objc_storeStrong((id *)&self->_mstmPyramidRemixFinal, 0);
  objc_storeStrong((id *)&self->_mstmPyramidRemixIntermediate, 0);
  objc_storeStrong((id *)&self->_mstmDownsampleSubsequent, 0);
  objc_storeStrong((id *)&self->_mstmDownsampleInitial, 0);
  objc_storeStrong((id *)&self->_mstmDownsampleMask, 0);
  objc_storeStrong((id *)&self->_mstmCombineAndDownsampleMask, 0);
  objc_storeStrong((id *)&self->_sffFillFace, 0);
  objc_storeStrong((id *)&self->_sffTestFace, 0);
  objc_storeStrong((id *)&self->_srlApply, 0);
  objc_storeStrong((id *)&self->_srlCalcCoefficients, 0);
  objc_storeStrong((id *)&self->_srlFaceHistogram, 0);
  objc_storeStrong((id *)&self->_srlGlobalHistogram, 0);
  objc_storeStrong((id *)&self->_ltmApplyBG, 0);
  objc_storeStrong((id *)&self->_ltmApply, 0);
  objc_storeStrong((id *)&self->_calculateBlackWhiteStrengthCenter, 0);

  objc_storeStrong((id *)&self->_blackSubtractAndAddingContrast, 0);
}

@end