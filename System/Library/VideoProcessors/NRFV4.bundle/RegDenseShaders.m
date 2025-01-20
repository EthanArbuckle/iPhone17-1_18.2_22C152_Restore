@interface RegDenseShaders
- (RegDenseShaders)initWithMetal:(id)a3;
@end

@implementation RegDenseShaders

- (RegDenseShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)RegDenseShaders;
  v5 = [(RegDenseShaders *)&v59 init];
  if (!v5
    || ([v4 library],
        v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (void *)[v6 newFunctionWithName:@"pyramidConfidence"],
        v6,
        !v7))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_29;
  }
  v8 = [v4 library];
  v9 = (void *)[v8 newFunctionWithName:@"regpyr_vert"];

  if (!v9)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_27:

    goto LABEL_29;
  }
  uint64_t v10 = objc_opt_new();
  if (!v10)
  {
    FigDebugAssert3();
LABEL_26:

    goto LABEL_27;
  }
  v11 = (void *)v10;
  id v12 = objc_alloc_init(MEMORY[0x263F129C0]);
  if (!v12)
  {
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_26;
  }
  v13 = v12;
  [v12 setVertexFunction:v9];
  [v13 setFragmentFunction:v7];
  v14 = [v4 fullRangeVertexDesc];
  [v13 setVertexDescriptor:v14];

  v15 = [v13 colorAttachments];
  v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setPixelFormat:25];

  v17 = [v4 pipelineLibrary];
  [v13 setPipelineLibrary:v17];

  v18 = [v4 device];
  id v58 = 0;
  uint64_t v19 = [v18 newRenderPipelineStateWithDescriptor:v13 error:&v58];
  id v20 = v58;
  confPipeline = v5->_confPipeline;
  v5->_confPipeline = (MTLRenderPipelineState *)v19;

  if (!v5->_confPipeline)
  {
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_26;
  }
  v52 = v20;
  v53 = v13;
  v54 = v9;
  v55 = v7;
  uint64_t v22 = 0;
  warpPipeline = v5->_warpPipeline;
  v24 = v5;
  warpWithConfidencePipeline = v5->_warpWithConfidencePipeline;
  warpWithBlendingWeightPipeline = v24->_warpWithBlendingWeightPipeline;
  warpAdditionalFrameWithBlendingWeightPipeline = v24->_warpAdditionalFrameWithBlendingWeightPipeline;
  warpWithBlendingWeightAndConfidencePipeline = v24->_warpWithBlendingWeightAndConfidencePipeline;
  v56 = v24;
  warpRGBAWithBlendingWeightAndConfidencePipeline = v24->_warpRGBAWithBlendingWeightAndConfidencePipeline;
  char v30 = 1;
  do
  {
    char v31 = v30;
    char v57 = v22;
    [v11 setConstantValue:&v57 type:53 atIndex:0];
    uint64_t v32 = [v4 computePipelineStateFor:@"warpFrame" constants:v11];
    v33 = warpPipeline[v22];
    warpPipeline[v22] = (MTLComputePipelineState *)v32;

    if (!warpPipeline[v22]) {
      goto LABEL_20;
    }
    uint64_t v34 = [v4 computePipelineStateFor:@"warpFrameWithConfidence" constants:v11];
    v35 = warpWithConfidencePipeline[v22];
    warpWithConfidencePipeline[v22] = (MTLComputePipelineState *)v34;

    if (!warpWithConfidencePipeline[v22]) {
      goto LABEL_20;
    }
    uint64_t v36 = [v4 computePipelineStateFor:@"warpFrameWithBlendingWeight" constants:v11];
    v37 = warpWithBlendingWeightPipeline[v22];
    warpWithBlendingWeightPipeline[v22] = (MTLComputePipelineState *)v36;

    if (!warpWithBlendingWeightPipeline[v22]) {
      goto LABEL_20;
    }
    uint64_t v38 = [v4 computePipelineStateFor:@"warpAdditionalFrameWithBlendingWeight" constants:v11];
    v39 = warpAdditionalFrameWithBlendingWeightPipeline[v22];
    warpAdditionalFrameWithBlendingWeightPipeline[v22] = (MTLComputePipelineState *)v38;

    if (!warpAdditionalFrameWithBlendingWeightPipeline[v22]) {
      goto LABEL_20;
    }
    uint64_t v40 = [v4 computePipelineStateFor:@"warpFrameWithBlendingWeightAndConfidence" constants:v11];
    v41 = warpWithBlendingWeightAndConfidencePipeline[v22];
    warpWithBlendingWeightAndConfidencePipeline[v22] = (MTLComputePipelineState *)v40;

    if (!warpWithBlendingWeightAndConfidencePipeline[v22]
      || ([v4 computePipelineStateFor:@"warpRGBAFrameWithBlendingWeightAndConfidence" constants:v11], uint64_t v42 = objc_claimAutoreleasedReturnValue(), v43 = warpRGBAWithBlendingWeightAndConfidencePipeline[v22], warpRGBAWithBlendingWeightAndConfidencePipeline[v22] = (MTLComputePipelineState *)v42, v43, !warpRGBAWithBlendingWeightAndConfidencePipeline[v22]))
    {
LABEL_20:
      FigDebugAssert3();
      FigSignalErrorAt();

      v50 = 0;
      v5 = v56;
      goto LABEL_19;
    }
    char v30 = 0;
    uint64_t v22 = 1;
  }
  while ((v31 & 1) != 0);
  uint64_t v44 = [v4 computePipelineStateFor:@"getBlendingWeight" constants:0];
  v5 = v56;
  getBlendingWeightPipeline = v56->_getBlendingWeightPipeline;
  v56->_getBlendingWeightPipeline = (MTLComputePipelineState *)v44;

  if (v56->_getBlendingWeightPipeline)
  {
    uint64_t v46 = [v4 computePipelineStateFor:@"getBlendingWeightLowLight" constants:0];
    getBlendingWeightLowLightPipeline = v56->_getBlendingWeightLowLightPipeline;
    v56->_getBlendingWeightLowLightPipeline = (MTLComputePipelineState *)v46;

    if (v56->_getBlendingWeightLowLightPipeline)
    {
      uint64_t v48 = [v4 computePipelineStateFor:@"generateSparseBlendingMap" constants:0];
      generateSparseBlendingMapPipeline = v56->_generateSparseBlendingMapPipeline;
      v56->_generateSparseBlendingMapPipeline = (MTLComputePipelineState *)v48;

      if (v56->_generateSparseBlendingMapPipeline)
      {
        v50 = v56;

        goto LABEL_19;
      }
    }
  }
  FigDebugAssert3();
  FigSignalErrorAt();

LABEL_29:
  v50 = 0;
LABEL_19:

  return v50;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generateSparseBlendingMapPipeline, 0);
  objc_storeStrong((id *)&self->_getBlendingWeightLowLightPipeline, 0);
  objc_storeStrong((id *)&self->_getBlendingWeightPipeline, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_warpRGBAWithBlendingWeightAndConfidencePipeline[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_warpWithBlendingWeightAndConfidencePipeline[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_warpAdditionalFrameWithBlendingWeightPipeline[k + 1], 0);
  for (uint64_t m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_warpWithBlendingWeightPipeline[m + 1], 0);
  for (uint64_t n = 40; n != 24; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n != 8);

  objc_storeStrong((id *)&self->_confPipeline, 0);
}

@end