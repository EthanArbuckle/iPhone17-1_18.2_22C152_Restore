@interface PostEspressoShaders
- (PostEspressoShaders)initWithMetal:(id)a3 networkVersion:(int)a4;
@end

@implementation PostEspressoShaders

- (PostEspressoShaders)initWithMetal:(id)a3 networkVersion:(int)a4
{
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PostEspressoShaders;
  v7 = [(PostEspressoShaders *)&v46 init];
  if (v7)
  {
    v11 = objc_opt_new();
    if (v11)
    {
      uint64_t v12 = 0;
      while (1)
      {
        objc_msgSend_reset(v11, v8, v9, v10);
        BOOL v45 = v12 & 1;
        objc_msgSend_setConstantValue_type_atIndex_(v11, v13, (uint64_t)&v45, 53, 0);
        BOOL v45 = (v12 & 2) != 0;
        objc_msgSend_setConstantValue_type_atIndex_(v11, v14, (uint64_t)&v45, 53, 1);
        uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v6, v15, @"applyEspressoOutput", (uint64_t)v11);
        v17 = &v7->super.isa + v12;
        Class v18 = v17[2];
        v17[2] = (Class)v16;

        if (!v17[2]) {
          break;
        }
        uint64_t v20 = objc_msgSend_computePipelineStateFor_constants_(v6, v19, @"deghostAndDenoise", (uint64_t)v11);
        Class v21 = v17[8];
        v17[8] = (Class)v20;

        if (!v17[8]) {
          break;
        }
        if (++v12 == 4)
        {
          uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v6, v8, @"applyEspressoOutputLumaOnly", 0);
          kernelApplyEspressoOutputLumaOnly = v7->_kernelApplyEspressoOutputLumaOnly;
          v7->_kernelApplyEspressoOutputLumaOnly = (MTLComputePipelineState *)v22;

          if (v7->_kernelApplyEspressoOutputLumaOnly)
          {
            uint64_t v25 = objc_msgSend_computePipelineStateFor_constants_(v6, v24, @"convert444To420", 0);
            kernelConvert444to420 = v7->_kernelConvert444to420;
            v7->_kernelConvert444to420 = (MTLComputePipelineState *)v25;

            if (v7->_kernelConvert444to420)
            {
              uint64_t v28 = objc_msgSend_computePipelineStateFor_constants_(v6, v27, @"computeTextureness", 0);
              kernelComputeTextureness = v7->_kernelComputeTextureness;
              v7->_kernelComputeTextureness = (MTLComputePipelineState *)v28;

              if (v7->_kernelComputeTextureness)
              {
                uint64_t v31 = objc_msgSend_computePipelineStateFor_constants_(v6, v30, @"computeAMBNRDenoiseBoostMap", 0);
                kernelComputeDenoiseBoostMap = v7->_kernelComputeDenoiseBoostMap;
                v7->_kernelComputeDenoiseBoostMap = (MTLComputePipelineState *)v31;

                if (v7->_kernelComputeDenoiseBoostMap)
                {
                  objc_msgSend_reset(v11, v33, v34, v35);
                  BOOL v45 = a4 == 2;
                  objc_msgSend_setConstantValue_type_atIndex_(v11, v36, (uint64_t)&v45, 53, 1);
                  uint64_t v38 = objc_msgSend_computePipelineStateFor_constants_(v6, v37, @"addPreviousLevel", (uint64_t)v11);
                  kernelAddPreviousLevel = v7->_kernelAddPreviousLevel;
                  v7->_kernelAddPreviousLevel = (MTLComputePipelineState *)v38;

                  if (v7->_kernelAddPreviousLevel)
                  {
                    uint64_t v41 = objc_msgSend_computePipelineStateFor_constants_(v6, v40, @"collapseWeightsOnTileStage1", (uint64_t)v11);
                    kernelCollapseWeightsOnTileStage1 = v7->_kernelCollapseWeightsOnTileStage1;
                    v7->_kernelCollapseWeightsOnTileStage1 = (MTLComputePipelineState *)v41;

                    if (v7->_kernelCollapseWeightsOnTileStage1)
                    {

                      goto LABEL_14;
                    }
                  }
                }
              }
            }
          }
          break;
        }
      }
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
    }

    v43 = 0;
  }
  else
  {
LABEL_14:
    v43 = v7;
  }

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelComputeDenoiseBoostMap, 0);
  objc_storeStrong((id *)&self->_kernelComputeTextureness, 0);
  objc_storeStrong((id *)&self->_kernelApplyDesaturationToChroma, 0);
  objc_storeStrong((id *)&self->_kernelConvert444to420, 0);
  for (uint64_t i = 88; i != 56; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_kernelAddPreviousLevel, 0);
  objc_storeStrong((id *)&self->_kernelApplyEspressoOutputLumaOnly, 0);
  for (uint64_t j = 40; j != 8; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);

  objc_storeStrong((id *)&self->_kernelCollapseWeightsOnTileStage1, 0);
}

@end