@interface BilateralGridShaders
- (BilateralGridShaders)initWithMetal:(id)a3 normalizeGridConfidence:(BOOL)a4;
- (id)createBasicComputeShader:(const char *)a3 metal:(id)a4;
@end

@implementation BilateralGridShaders

- (BilateralGridShaders)initWithMetal:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v82 = a4;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  v81.receiver = self;
  v81.super_class = (Class)BilateralGridShaders;
  v7 = [(BilateralGridShaders *)&v81 init];
  v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_34;
  }
  int v80 = 0;
  bgSplat = v7->_bgSplat;
  do
  {
    uint64_t v10 = objc_opt_new();
    v11 = (void *)*(&v83 + v80);
    *(&v83 + v80) = v10;

    v12 = (void *)*(&v83 + v80);
    if (!v12) {
      goto LABEL_31;
    }
    [v12 setConstantValue:&v80 type:53 atIndex:3];
    uint64_t v13 = [v6 computePipelineStateFor:@"bg_splat" constants:*(&v83 + v80)];
    v14 = bgSplat[v80];
    bgSplat[v80] = (MTLComputePipelineState *)v13;

    int v15 = v80;
    if (!bgSplat[v80]) {
      goto LABEL_31;
    }
    ++v80;
  }
  while (v15 <= 0);
  int v80 = 0;
  bgBlur = v8->_bgBlur;
  do
  {
    v17 = objc_opt_new();
    v18 = v17;
    if (!v17) {
      goto LABEL_32;
    }
    [v17 setConstantValue:&v80 type:29 atIndex:2];
    [v18 setConstantValue:&v82 type:53 atIndex:1];
    uint64_t v19 = [v6 computePipelineStateFor:@"bg_blur" constants:v18];
    v20 = bgBlur[v80];
    bgBlur[v80] = (MTLComputePipelineState *)v19;

    if (!bgBlur[v80]) {
      goto LABEL_32;
    }

    int v21 = v80++;
  }
  while (v21 < 2);
  v22 = objc_opt_new();
  v18 = v22;
  if (!v22
    || ([v22 setConstantValue:&v82 type:53 atIndex:1],
        [v6 computePipelineStateFor:@"bg_norm" constants:v18],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        bgNormalize = v8->_bgNormalize,
        v8->_bgNormalize = (MTLComputePipelineState *)v23,
        bgNormalize,
        !v8->_bgNormalize))
  {
LABEL_32:
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_33:

    goto LABEL_34;
  }

  v25 = [v6 library];
  v18 = (void *)[v25 newFunctionWithName:@"BilateralUpsample_vert"];

  if (!v18) {
    -[BilateralGridShaders initWithMetal:normalizeGridConfidence:]();
  }
  v26 = [v6 library];
  uint64_t v27 = v83;
  v28 = [v6 pipelineLibrary];
  id v79 = 0;
  v29 = (void *)[v26 newFunctionWithName:@"BilateralUpsample_frag" constantValues:v27 pipelineLibrary:v28 error:&v79];
  id v30 = v79;

  if (!v29) {
    -[BilateralGridShaders initWithMetal:normalizeGridConfidence:]();
  }
  v31 = [v6 library];
  uint64_t v32 = v84;
  v33 = [v6 pipelineLibrary];
  id v78 = v30;
  v34 = (void *)[v31 newFunctionWithName:@"BilateralUpsample_frag" constantValues:v32 pipelineLibrary:v33 error:&v78];
  id v35 = v78;

  if (!v34) {
    -[BilateralGridShaders initWithMetal:normalizeGridConfidence:]();
  }
  id v36 = objc_alloc_init(MEMORY[0x263F129C0]);
  v37 = [v6 pipelineLibrary];
  [v36 setPipelineLibrary:v37];

  [v36 setVertexFunction:v18];
  [v36 setFragmentFunction:v29];
  v38 = [v6 fullRangeVertexDesc];
  [v36 setVertexDescriptor:v38];

  v39 = [v36 colorAttachments];
  v40 = [v39 objectAtIndexedSubscript:0];
  [v40 setPixelFormat:10];

  v41 = [v6 device];
  id v77 = v35;
  uint64_t v42 = [v41 newRenderPipelineStateWithDescriptor:v36 error:&v77];
  id v43 = v77;

  bgUpsample8 = v8->_bgUpsample8;
  v8->_bgUpsample8 = (MTLRenderPipelineState *)v42;

  if (!v8->_bgUpsample8) {
    goto LABEL_43;
  }
  v45 = [v36 colorAttachments];
  v46 = [v45 objectAtIndexedSubscript:0];
  [v46 setPixelFormat:25];

  v47 = [v6 device];
  id v76 = v43;
  uint64_t v48 = [v47 newRenderPipelineStateWithDescriptor:v36 error:&v76];
  id v49 = v76;

  bgUpsample16 = v8->_bgUpsample16;
  v8->_bgUpsample16 = (MTLRenderPipelineState *)v48;

  if (!v8->_bgUpsample16)
  {
    FigDebugAssert3();
    id v43 = v49;
LABEL_44:
    FigSignalErrorAt();

    goto LABEL_33;
  }
  [v36 setFragmentFunction:v34];
  v51 = [v6 device];
  id v75 = v49;
  uint64_t v52 = [v51 newRenderPipelineStateWithDescriptor:v36 error:&v75];
  id v43 = v75;

  bgUpsample16ToneMapped = v8->_bgUpsample16ToneMapped;
  v8->_bgUpsample16ToneMapped = (MTLRenderPipelineState *)v52;

  if (!v8->_bgUpsample16ToneMapped)
  {
LABEL_43:
    FigDebugAssert3();
    goto LABEL_44;
  }

  uint64_t v54 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_bistochastize_init" metal:v6];
  bgBistochastizeInit = v8->_bgBistochastizeInit;
  v8->_bgBistochastizeInit = (MTLComputePipelineState *)v54;

  if (v8->_bgBistochastizeInit)
  {
    uint64_t v56 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_bistochastize_iter" metal:v6];
    bgBistochastizeIter = v8->_bgBistochastizeIter;
    v8->_bgBistochastizeIter = (MTLComputePipelineState *)v56;

    if (v8->_bgBistochastizeIter)
    {
      uint64_t v58 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_bistochastize_final" metal:v6];
      bgBistochastizeFinal = v8->_bgBistochastizeFinal;
      v8->_bgBistochastizeFinal = (MTLComputePipelineState *)v58;

      if (v8->_bgBistochastizeFinal)
      {
        uint64_t v60 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_solver_init1" metal:v6];
        bgSolverInit1 = v8->_bgSolverInit1;
        v8->_bgSolverInit1 = (MTLComputePipelineState *)v60;

        if (v8->_bgSolverInit1)
        {
          uint64_t v62 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_solver_init2" metal:v6];
          bgSolverInit2 = v8->_bgSolverInit2;
          v8->_bgSolverInit2 = (MTLComputePipelineState *)v62;

          if (v8->_bgSolverInit2)
          {
            uint64_t v64 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_solver_pcg_iter0" metal:v6];
            bgSolverPcgIter0 = v8->_bgSolverPcgIter0;
            v8->_bgSolverPcgIter0 = (MTLComputePipelineState *)v64;

            if (v8->_bgSolverPcgIter0)
            {
              uint64_t v66 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_solver_pcg_iter1" metal:v6];
              bgSolverPcgIter1 = v8->_bgSolverPcgIter1;
              v8->_bgSolverPcgIter1 = (MTLComputePipelineState *)v66;

              if (v8->_bgSolverPcgIter1)
              {
                uint64_t v68 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_solver_pcg_iter2" metal:v6];
                bgSolverPcgIter2 = v8->_bgSolverPcgIter2;
                v8->_bgSolverPcgIter2 = (MTLComputePipelineState *)v68;

                if (v8->_bgSolverPcgIter2)
                {
                  uint64_t v70 = [(BilateralGridShaders *)v8 createBasicComputeShader:"bg_solver_pcg_iter3" metal:v6];
                  bgSolverPcgIter3 = v8->_bgSolverPcgIter3;
                  v8->_bgSolverPcgIter3 = (MTLComputePipelineState *)v70;

                  if (v8->_bgSolverPcgIter3)
                  {
                    v72 = v8;
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
  v72 = 0;
LABEL_28:
  for (uint64_t i = 8; i != -8; i -= 8)

  return v72;
}

- (id)createBasicComputeShader:(const char *)a3 metal:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  v7 = [v5 stringWithUTF8String:a3];
  v8 = [v6 computePipelineStateFor:v7 constants:0];

  return v8;
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

- (void)initWithMetal:normalizeGridConfidence:.cold.1()
{
}

- (void)initWithMetal:normalizeGridConfidence:.cold.2()
{
}

- (void)initWithMetal:normalizeGridConfidence:.cold.3()
{
}

@end