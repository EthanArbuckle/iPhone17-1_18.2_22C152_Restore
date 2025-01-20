@interface BlinkDetectionStage
+ (int)prewarmShaders:(id)a3;
- (id)init:(id)a3;
- (int)runOnLumaBand1:(id)a3 lumaBand2:(id)a4 lumaBand3:(id)a5 withFaces:(id)a6 facesCount:(int)a7 plist:(id)a8 resultScore:(float *)a9 frameIdx:(int)a10;
@end

@implementation BlinkDetectionStage

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = +[BlinkDetectionStageShared sharedInstance];
  v5 = [v4 getShaders:v3];

  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = -12786;
  }

  return v6;
}

- (id)init:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BlinkDetectionStage;
  int v6 = [(BlinkDetectionStage *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[BlinkDetectionStageShared sharedInstance];
    v9 = [v8 getShaders:v7->_metal];

    if (v9)
    {
      v10 = [(FigMetalContext *)v7->_metal device];
      uint64_t v11 = [v10 newBufferWithLength:4 options:0];
      blinkDetectionResultBuffer = v7->_blinkDetectionResultBuffer;
      v7->_blinkDetectionResultBuffer = (MTLBuffer *)v11;

      if (v7->_blinkDetectionResultBuffer)
      {
        v13 = v7;
      }
      else
      {
        FigDebugAssert3();
        if (FigSignalErrorAt()) {
          v13 = 0;
        }
        else {
          v13 = v7;
        }
      }
    }
    else
    {
      FigDebugAssert3();
      v13 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v13 = 0;
    v9 = 0;
  }
  v14 = v13;

  return v14;
}

- (int)runOnLumaBand1:(id)a3 lumaBand2:(id)a4 lumaBand3:(id)a5 withFaces:(id)a6 facesCount:(int)a7 plist:(id)a8 resultScore:(float *)a9 frameIdx:(int)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v20 = (unsigned __int16 *)a8;
  if (!a9 || !v16 || !v17 || !v18) {
    goto LABEL_27;
  }
  *a9 = 0.0;
  if (a7 < 1)
  {
    int v35 = 0;
LABEL_24:
    v33 = 0;
    v34 = 0;
    v32 = 0;
    goto LABEL_26;
  }
  +[BlinkDetectionStageShared sharedInstance];
  v22 = v21 = self;
  uint64_t v23 = [v22 getShaders:v21->_metal];

  v40 = (void *)v23;
  if (!v23)
  {
LABEL_27:
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    goto LABEL_24;
  }
  v24 = [(FigMetalContext *)v21->_metal commandQueue];
  uint64_t v25 = [v24 commandBuffer];

  v39 = (void *)v25;
  if (!v25)
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    v33 = 0;
    v34 = 0;
    v32 = v40;
    goto LABEL_26;
  }
  v37 = v21;
  id v38 = v18;
  uint64_t v26 = 0;
  v47[0] = 0;
  memset(v46, 0, sizeof(v46));
  int v45 = 0;
  uint64_t v27 = a7;
  do
  {
    v28 = [v19 objectAtIndexedSubscript:v26];
    if ([v28 confidence] <= v20[5])
    {

      goto LABEL_16;
    }
    v29 = [v19 objectAtIndexedSubscript:v26];
    int v30 = [v29 yaw];

    if (v30) {
      goto LABEL_16;
    }
    char v31 = *((unsigned char *)v20 + 8);
    if (v31)
    {
      transformAndAddPortion(v19, v26, &v45, (uint64_t)v46, [v16 height], v47, *((float *)v20 + 7), *((float *)v20 + 8), *((float *)v20 + 9), *((float *)v20 + 10), *((float *)v20 + 16));
      char v31 = *((unsigned char *)v20 + 8);
      if ((v31 & 2) != 0)
      {
LABEL_19:
        transformAndAddPortion(v19, v26, &v45, (uint64_t)v46, [v16 height], v47, *((float *)v20 + 3), *((float *)v20 + 4), *((float *)v20 + 5), *((float *)v20 + 6), *((float *)v20 + 15));
        if ((v20[4] & 4) == 0) {
          goto LABEL_16;
        }
        goto LABEL_20;
      }
    }
    else if ((v20[4] & 2) != 0)
    {
      goto LABEL_19;
    }
    if ((v31 & 4) == 0) {
      goto LABEL_16;
    }
LABEL_20:
    transformAndAddPortion(v19, v26, &v45, (uint64_t)v46, [v16 height], v47, *((float *)v20 + 11), *((float *)v20 + 12), *((float *)v20 + 13), *((float *)v20 + 14), *((float *)v20 + 17));
LABEL_16:
    ++v26;
  }
  while (v27 != v26);
  v33 = (void *)v25;
  v32 = v40;
  if (v45 < 1)
  {
    int v35 = 0;
    v34 = 0;
    id v18 = v38;
  }
  else
  {
    LOWORD(v46[0]) = v45;
    v34 = [v39 computeCommandEncoder];
    [v34 setComputePipelineState:v40[1]];
    [v34 setTexture:v16 atIndex:0];
    [v34 setTexture:v17 atIndex:1];
    id v18 = v38;
    [v34 setTexture:v38 atIndex:2];
    [v34 setBytes:v46 length:416 atIndex:0];
    [v34 setBuffer:v37->_blinkDetectionResultBuffer offset:0 atIndex:1];
    unint64_t v43 = v47[0];
    int64x2_t v44 = vdupq_n_s64(1uLL);
    unint64_t v41 = v47[0];
    int64x2_t v42 = v44;
    [v34 dispatchThreads:&v43 threadsPerThreadgroup:&v41];
    [v34 endEncoding];
    [v39 commit];
    [v39 waitUntilCompleted];
    int v35 = 0;
    *a9 = *(float *)[(MTLBuffer *)v37->_blinkDetectionResultBuffer contents];
  }
LABEL_26:

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_blinkDetectionResultBuffer, 0);
}

@end