@interface ToneMappingShaders
- (ToneMappingShaders)initWithMetal:(id)a3;
@end

@implementation ToneMappingShaders

- (ToneMappingShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ToneMappingShaders;
  v5 = [(ToneMappingShaders *)&v44 init];
  if (v5)
  {
    v6 = objc_opt_new();
    if (!v6) {
      goto LABEL_23;
    }
    uint64_t v7 = [v4 computePipelineStateFor:@"blackSubtractAndAddingContrast" constants:0];
    blackSubtractAndAddingContrast = v5->_blackSubtractAndAddingContrast;
    v5->_blackSubtractAndAddingContrast = (MTLComputePipelineState *)v7;

    if (!v5->_blackSubtractAndAddingContrast) {
      goto LABEL_23;
    }
    uint64_t v9 = [v4 computePipelineStateFor:@"calculateBlackWhiteStrengthCenter" constants:0];
    calculateBlackWhiteStrengthCenter = v5->_calculateBlackWhiteStrengthCenter;
    v5->_calculateBlackWhiteStrengthCenter = (MTLComputePipelineState *)v9;

    if (!v5->_calculateBlackWhiteStrengthCenter) {
      goto LABEL_23;
    }
    char v43 = 0;
    [v6 setConstantValue:&v43 type:53 atIndex:1];
    uint64_t v11 = [v4 computePipelineStateFor:@"LTM" constants:v6];
    ltmApply = v5->_ltmApply;
    v5->_ltmApply = (MTLComputePipelineState *)v11;

    if (!v5->_ltmApply) {
      goto LABEL_23;
    }
    char v43 = 1;
    [v6 setConstantValue:&v43 type:53 atIndex:1];
    uint64_t v13 = [v4 computePipelineStateFor:@"LTM" constants:v6];
    ltmApplyBG = v5->_ltmApplyBG;
    v5->_ltmApplyBG = (MTLComputePipelineState *)v13;

    if (!v5->_ltmApplyBG) {
      goto LABEL_23;
    }
    uint64_t v15 = [v4 computePipelineStateFor:@"sffTestFace" constants:0];
    sffTestFace = v5->_sffTestFace;
    v5->_sffTestFace = (MTLComputePipelineState *)v15;

    if (!v5->_sffTestFace) {
      goto LABEL_23;
    }
    uint64_t v17 = [v4 computePipelineStateFor:@"sffFillFace" constants:0];
    sffFillFace = v5->_sffFillFace;
    v5->_sffFillFace = (MTLComputePipelineState *)v17;

    if (!v5->_sffFillFace) {
      goto LABEL_23;
    }
    uint64_t v19 = [v4 computePipelineStateFor:@"mstmCombineAndDownsampleMask" constants:0];
    mstmCombineAndDownsampleMask = v5->_mstmCombineAndDownsampleMask;
    v5->_mstmCombineAndDownsampleMask = (MTLComputePipelineState *)v19;

    if (!v5->_mstmCombineAndDownsampleMask) {
      goto LABEL_23;
    }
    uint64_t v21 = [v4 computePipelineStateFor:@"mstmDownsampleMask" constants:0];
    mstmDownsampleMask = v5->_mstmDownsampleMask;
    v5->_mstmDownsampleMask = (MTLComputePipelineState *)v21;

    if (!v5->_mstmDownsampleMask) {
      goto LABEL_23;
    }
    uint64_t v23 = [v4 computePipelineStateFor:@"mstmsDownsampleInitial" constants:0];
    mstmDownsampleInitial = v5->_mstmDownsampleInitial;
    v5->_mstmDownsampleInitial = (MTLComputePipelineState *)v23;

    if (!v5->_mstmDownsampleInitial) {
      goto LABEL_23;
    }
    uint64_t v25 = [v4 computePipelineStateFor:@"mstmsDownsampleSubsequent" constants:0];
    mstmDownsampleSubsequent = v5->_mstmDownsampleSubsequent;
    v5->_mstmDownsampleSubsequent = (MTLComputePipelineState *)v25;

    if (!v5->_mstmDownsampleSubsequent) {
      goto LABEL_23;
    }
    uint64_t v27 = [v4 computePipelineStateFor:@"mstmsRemixIntermediate" constants:0];
    mstmPyramidRemixIntermediate = v5->_mstmPyramidRemixIntermediate;
    v5->_mstmPyramidRemixIntermediate = (MTLComputePipelineState *)v27;

    if (!v5->_mstmPyramidRemixIntermediate) {
      goto LABEL_23;
    }
    uint64_t v29 = [v4 computePipelineStateFor:@"mstmsRemixFinal" constants:0];
    mstmPyramidRemixFinal = v5->_mstmPyramidRemixFinal;
    v5->_mstmPyramidRemixFinal = (MTLComputePipelineState *)v29;

    if (!v5->_mstmPyramidRemixFinal) {
      goto LABEL_23;
    }
    uint64_t v31 = [v4 computePipelineStateFor:@"mstmsDiffusionOdd" constants:0];
    mstmDiffusionOdd = v5->_mstmDiffusionOdd;
    v5->_mstmDiffusionOdd = (MTLComputePipelineState *)v31;

    if (!v5->_mstmDiffusionOdd) {
      goto LABEL_23;
    }
    uint64_t v33 = [v4 computePipelineStateFor:@"mstmsDiffusionEven" constants:0];
    mstmDiffusionEven = v5->_mstmDiffusionEven;
    v5->_mstmDiffusionEven = (MTLComputePipelineState *)v33;

    if (!v5->_mstmDiffusionEven) {
      goto LABEL_23;
    }
    uint64_t v35 = [v4 computePipelineStateFor:@"mstmsApply" constants:0];
    mstmsApply = v5->_mstmsApply;
    v5->_mstmsApply = (MTLComputePipelineState *)v35;

    if (!v5->_mstmsApply) {
      goto LABEL_23;
    }
    uint64_t v37 = [v4 computePipelineStateFor:@"mstmV2First" constants:0];
    mstmV2First = v5->_mstmV2First;
    v5->_mstmV2First = (MTLComputePipelineState *)v37;

    if (!v5->_mstmV2First
      || ([v4 computePipelineStateFor:@"mstmV2Second" constants:0],
          uint64_t v39 = objc_claimAutoreleasedReturnValue(),
          mstmV2Second = v5->_mstmV2Second,
          v5->_mstmV2Second = (MTLComputePipelineState *)v39,
          mstmV2Second,
          !v5->_mstmV2Second))
    {
LABEL_23:
      FigDebugAssert3();
      FigSignalErrorAt();

      v41 = 0;
      goto LABEL_22;
    }
  }
  v41 = v5;
LABEL_22:

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstmV2Second, 0);
  objc_storeStrong((id *)&self->_mstmV2First, 0);
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
  objc_storeStrong((id *)&self->_ltmApplyBG, 0);
  objc_storeStrong((id *)&self->_ltmApply, 0);
  objc_storeStrong((id *)&self->_calculateBlackWhiteStrengthCenter, 0);

  objc_storeStrong((id *)&self->_blackSubtractAndAddingContrast, 0);
}

@end