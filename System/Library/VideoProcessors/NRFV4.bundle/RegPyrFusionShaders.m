@interface RegPyrFusionShaders
- (RegPyrFusionShaders)initWithMetal:(id)a3;
- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6;
- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6 constantValues:(id)a7;
@end

@implementation RegPyrFusionShaders

- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6 constantValues:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263F129C0]);
  if (v16)
  {
    v17 = [v11 pipelineLibrary];
    [v16 setPipelineLibrary:v17];

    [v16 setVertexFunction:v12];
    id v18 = [v16 vertexFunction];

    if (!v18) {
      goto LABEL_22;
    }
    v19 = [v11 library];
    v20 = v19;
    if (v15)
    {
      id v48 = 0;
      v21 = (void *)[v19 newFunctionWithName:v13 constantValues:v15 error:&v48];
      id v18 = v48;
      [v16 setFragmentFunction:v21];
    }
    else
    {
      v22 = (void *)[v19 newFunctionWithName:v13];
      [v16 setFragmentFunction:v22];

      id v18 = 0;
    }
    v23 = [v16 fragmentFunction];

    if (v23)
    {
      id v41 = v12;
      v42 = v18;
      id v38 = v15;
      id v39 = v14;
      id v40 = v13;
      v24 = v11;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v25 = v14;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        int v28 = 0;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = (int)[*(id *)(*((void *)&v44 + 1) + 8 * i) intValue];
            v32 = [v16 colorAttachments];
            v33 = [v32 objectAtIndexedSubscript:(v28 + i)];
            [v33 setPixelFormat:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
          v28 += i;
        }
        while (v27);
      }

      id v11 = v24;
      v34 = [v24 fullRangeVertexDesc];
      [v16 setVertexDescriptor:v34];

      v35 = [v24 device];
      id v43 = v42;
      v36 = (void *)[v35 newRenderPipelineStateWithDescriptor:v16 error:&v43];
      id v18 = v43;

      if (!v36 || v18)
      {

        v36 = 0;
      }
      id v13 = v40;
      id v12 = v41;
      id v15 = v38;
      id v14 = v39;
    }
    else
    {
LABEL_22:
      FigDebugAssert3();
      FigSignalErrorAt();
      v36 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v36 = 0;
    id v18 = 0;
  }

  return v36;
}

- (RegPyrFusionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)RegPyrFusionShaders;
  v5 = [(RegPyrFusionShaders *)&v39 init];
  if (!v5 || (uint64_t v6 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
LABEL_22:
    v36 = 0;
    goto LABEL_18;
  }
  v7 = (void *)v6;
  v8 = [v4 library];
  v9 = (void *)[v8 newFunctionWithName:@"regpyr_vert"];

  if (!v9)
  {
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_22;
  }
  char v38 = 0;
  [v7 setConstantValue:&v38 type:53 atIndex:0];
  uint64_t v10 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_initial_downscale_frag" outputColorMetalFormat:&unk_270E979D8 constantValues:v7];
  initialDownScalePipelineState = v5->_initialDownScalePipelineState;
  v5->_initialDownScalePipelineState = (MTLRenderPipelineState *)v10;

  if (!v5->_initialDownScalePipelineState) {
    goto LABEL_21;
  }
  char v38 = 1;
  [v7 setConstantValue:&v38 type:53 atIndex:0];
  uint64_t v12 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_initial_downscale_frag" outputColorMetalFormat:&unk_270E979F0 constantValues:v7];
  initialDownScaleRGBPipelineState = v5->_initialDownScaleRGBPipelineState;
  v5->_initialDownScaleRGBPipelineState = (MTLRenderPipelineState *)v12;

  if (!v5->_initialDownScaleRGBPipelineState) {
    goto LABEL_21;
  }
  uint64_t v14 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_bilinear_downscale_frag" outputColorMetalFormat:&unk_270E97A08];
  bilinearScalePipelineState = v5->_bilinearScalePipelineState;
  v5->_bilinearScalePipelineState = (MTLRenderPipelineState *)v14;

  if (!v5->_bilinearScalePipelineState) {
    goto LABEL_21;
  }
  uint64_t v16 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_deriv_sobel_frag" outputColorMetalFormat:&unk_270E97A20];
  derivSobelPipelineState = v5->_derivSobelPipelineState;
  v5->_derivSobelPipelineState = (MTLRenderPipelineState *)v16;

  if (!v5->_derivSobelPipelineState) {
    goto LABEL_21;
  }
  uint64_t v18 = [v4 computePipelineStateFor:@"regpyr_deriv_compute" constants:0];
  derivPipelineState = v5->_derivPipelineState;
  v5->_derivPipelineState = (MTLComputePipelineState *)v18;

  if (!v5->_derivPipelineState) {
    goto LABEL_21;
  }
  uint64_t v20 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_basic_search_luma_frag" outputColorMetalFormat:&unk_270E97A38];
  basicSearchLumaPipelineState = v5->_basicSearchLumaPipelineState;
  v5->_basicSearchLumaPipelineState = (MTLRenderPipelineState *)v20;

  if (!v5->_basicSearchLumaPipelineState) {
    goto LABEL_21;
  }
  uint64_t v22 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_fusion_luma_x_frag" outputColorMetalFormat:&unk_270E97A50];
  fusionXLumaPipelineState = v5->_fusionXLumaPipelineState;
  v5->_fusionXLumaPipelineState = (MTLRenderPipelineState *)v22;

  if (!v5->_fusionXLumaPipelineState) {
    goto LABEL_21;
  }
  uint64_t v24 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_fusion_luma_y_frag" outputColorMetalFormat:&unk_270E97A68];
  fusionYLumaPipelineState = v5->_fusionYLumaPipelineState;
  v5->_fusionYLumaPipelineState = (MTLRenderPipelineState *)v24;

  if (!v5->_fusionYLumaPipelineState) {
    goto LABEL_21;
  }
  uint64_t v26 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_smooth_frag" outputColorMetalFormat:&unk_270E97A80];
  smoothPipelineState = v5->_smoothPipelineState;
  v5->_smoothPipelineState = (MTLRenderPipelineState *)v26;

  if (!v5->_smoothPipelineState) {
    goto LABEL_21;
  }
  uint64_t v28 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_selection_luma_frag" outputColorMetalFormat:&unk_270E97A98];
  selectionLumaPipelineState = v5->_selectionLumaPipelineState;
  v5->_selectionLumaPipelineState = (MTLRenderPipelineState *)v28;

  if (!v5->_selectionLumaPipelineState) {
    goto LABEL_21;
  }
  uint64_t v30 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_confidence_stage_one_frag" outputColorMetalFormat:&unk_270E97AB0];
  confidenceStageOne = v5->_confidenceStageOne;
  v5->_confidenceStageOne = (MTLRenderPipelineState *)v30;

  if (!v5->_confidenceStageOne) {
    goto LABEL_21;
  }
  uint64_t v32 = [(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_confidence_erode_frag" outputColorMetalFormat:&unk_270E97AC8];
  confidenceErode = v5->_confidenceErode;
  v5->_confidenceErode = (MTLRenderPipelineState *)v32;

  if (!v5->_confidenceErode
    || ([(RegPyrFusionShaders *)v5 createPipelineStateWithMetal:v4 vFunction:v9 fShaderName:@"regpyr_confidence_dilate_frag" outputColorMetalFormat:&unk_270E97AE0], uint64_t v34 = objc_claimAutoreleasedReturnValue(), confidenceDilate = v5->_confidenceDilate, v5->_confidenceDilate = (MTLRenderPipelineState *)v34, confidenceDilate, !v5->_confidenceDilate))
  {
LABEL_21:
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_22;
  }
  v36 = v5;

LABEL_18:
  return v36;
}

- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6
{
  return [(RegPyrFusionShaders *)self createPipelineStateWithMetal:a3 vFunction:a4 fShaderName:a5 outputColorMetalFormat:a6 constantValues:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceDilate, 0);
  objc_storeStrong((id *)&self->_confidenceErode, 0);
  objc_storeStrong((id *)&self->_confidenceStageOne, 0);
  objc_storeStrong((id *)&self->_selectionLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_smoothPipelineState, 0);
  objc_storeStrong((id *)&self->_fusionYLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_fusionXLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_basicSearchLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_derivSobelPipelineState, 0);
  objc_storeStrong((id *)&self->_derivPipelineState, 0);
  objc_storeStrong((id *)&self->_bilinearScalePipelineState, 0);
  objc_storeStrong((id *)&self->_initialDownScaleRGBPipelineState, 0);

  objc_storeStrong((id *)&self->_initialDownScalePipelineState, 0);
}

@end