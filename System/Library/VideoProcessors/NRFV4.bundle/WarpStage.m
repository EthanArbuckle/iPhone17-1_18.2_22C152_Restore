@interface WarpStage
+ (int)prewarmShaders:(id)a3;
- (id)initWarpStage:(id)a3;
- (uint64_t)runWarpUsingTransform:(__n128)a3 inputLumaTex:(__n128)a4 inputChromaTex:(uint64_t)a5 outputLumaTex:(void *)a6 outputChromaTex:(void *)a7;
- (uint64_t)runWarpUsingTransform:(__n128)a3 inputYCbCrTex:(__n128)a4 inputCscParams:(uint64_t)a5 outputLinearLumaTex:(void *)a6 outputLinearChromaTex:(uint64_t)a7;
@end

@implementation WarpStage

- (id)initWarpStage:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WarpStage;
  v6 = [(WarpStage *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[WarpStageShared sharedInstance];
    v9 = [v8 getShaders:v7->_metal];

    v10 = v7;
    if (!v9)
    {
      FigDebugAssert3();
      v10 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v10 = 0;
    v9 = 0;
  }
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[WarpShaders alloc] initWithMetal:v3];

  if (v4)
  {
    int v5 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v5 = -12786;
  }

  return v5;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputLumaTex:(__n128)a4 inputChromaTex:(uint64_t)a5 outputLumaTex:(void *)a6 outputChromaTex:(void *)a7
{
  v29[0] = a2;
  v29[1] = a3;
  v29[2] = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  v17 = +[WarpStageShared sharedInstance];
  v18 = [v17 getShaders:*(void *)(a1 + 8)];

  if (v18
    && ([*(id *)(a1 + 8) commandQueue],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v19 commandBuffer],
        v20 = objc_claimAutoreleasedReturnValue(),
        v19,
        v20))
  {
    v21 = [v20 computeCommandEncoder];
    [v21 setImageblockWidth:32 height:32];
    [v21 setComputePipelineState:v18[1]];
    [v21 setBytes:v29 length:48 atIndex:0];
    [v21 setTexture:v13 atIndex:0];
    [v21 setTexture:v15 atIndex:1];
    v28[0] = [v15 width];
    v28[1] = [v15 height];
    v28[2] = 1;
    int64x2_t v24 = vdupq_n_s64(0x20uLL);
    int64x2_t v26 = v24;
    uint64_t v27 = 1;
    [v21 dispatchThreads:v28 threadsPerThreadgroup:&v26];
    [v21 setTexture:v14 atIndex:0];
    [v21 setTexture:v16 atIndex:1];
    v25[0] = [v14 width];
    v25[1] = [v14 height];
    v25[2] = 1;
    int64x2_t v26 = v24;
    uint64_t v27 = 1;
    [v21 dispatchThreads:v25 threadsPerThreadgroup:&v26];
    [v21 endEncoding];
    [v20 commit];

    uint64_t v22 = 0;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v22 = FigSignalErrorAt();
  }

  return v22;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputYCbCrTex:(__n128)a4 inputCscParams:(uint64_t)a5 outputLinearLumaTex:(void *)a6 outputLinearChromaTex:(uint64_t)a7
{
  v26[0] = a2;
  v26[1] = a3;
  v26[2] = a4;
  id v13 = a6;
  id v14 = a8;
  id v15 = a9;
  if ([v14 pixelFormat] == 25 && objc_msgSend(v15, "pixelFormat") == 65)
  {
    id v16 = +[WarpStageShared sharedInstance];
    v17 = [v16 getShaders:*(void *)(a1 + 8)];

    if (v17)
    {
      if (a7
        && ([*(id *)(a1 + 8) commandQueue],
            v18 = objc_claimAutoreleasedReturnValue(),
            [v18 commandBuffer],
            v19 = objc_claimAutoreleasedReturnValue(),
            v18,
            v19))
      {
        v20 = [v19 computeCommandEncoder];
        [v20 setComputePipelineState:v17[2]];
        [v20 setImageblockWidth:32 height:32];
        [v20 setBytes:v26 length:48 atIndex:0];
        [v20 setBytes:a7 length:208 atIndex:1];
        [v20 setTexture:v13 atIndex:0];
        [v20 setTexture:v14 atIndex:1];
        [v20 setTexture:v15 atIndex:2];
        v25[0] = [v15 width];
        v25[1] = [v15 height];
        v25[2] = 1;
        int64x2_t v23 = vdupq_n_s64(0x10uLL);
        uint64_t v24 = 1;
        [v20 dispatchThreads:v25 threadsPerThreadgroup:&v23];
        [v20 endEncoding];
        [v19 commit];

        uint64_t v21 = 0;
      }
      else
      {
        FigDebugAssert3();
        uint64_t v21 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t v21 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v21 = 4294954516;
  }

  return v21;
}

- (void).cxx_destruct
{
}

@end