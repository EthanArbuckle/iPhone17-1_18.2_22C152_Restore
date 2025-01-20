@interface FuseRemixFragmentShader
- (FuseRemixFragmentShader)initWithMetal:(id)a3 fragName:(id)a4 pixelFormat:(unint64_t)a5 noisePixelFormat:(unint64_t)a6 isFirstBatch:(BOOL)a7 isLastBatch:(BOOL)a8 usePatchBasedFusion:(BOOL)a9 useGpuCSC:(BOOL)a10 ggmEnabled:(BOOL)a11;
@end

@implementation FuseRemixFragmentShader

- (FuseRemixFragmentShader)initWithMetal:(id)a3 fragName:(id)a4 pixelFormat:(unint64_t)a5 noisePixelFormat:(unint64_t)a6 isFirstBatch:(BOOL)a7 isLastBatch:(BOOL)a8 usePatchBasedFusion:(BOOL)a9 useGpuCSC:(BOOL)a10 ggmEnabled:(BOOL)a11
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  BOOL v58 = a7;
  BOOL v57 = a8;
  BOOL v56 = a9;
  BOOL v55 = a10;
  BOOL v54 = a11;
  v53.receiver = self;
  v53.super_class = (Class)FuseRemixFragmentShader;
  v18 = [(FuseRemixFragmentShader *)&v53 init];
  v48 = v17;
  if (!v18)
  {
    FigDebugAssert3();
    v22 = 0;
    v25 = 0;
    v28 = 0;
    v20 = 0;
    id v26 = 0;
    goto LABEL_23;
  }
  BOOL v52 = a6 != 0;
  v19 = objc_opt_new();
  v20 = v19;
  if (!v19)
  {
    FigDebugAssert3();
    v22 = 0;
LABEL_19:
    v25 = 0;
    v28 = 0;
    id v26 = 0;
    goto LABEL_23;
  }
  [v19 setConstantValue:&v52 type:53 atIndex:1];
  [v20 setConstantValue:&v58 type:53 atIndex:2];
  [v20 setConstantValue:&v57 type:53 atIndex:3];
  [v20 setConstantValue:&v56 type:53 atIndex:4];
  [v20 setConstantValue:&v55 type:53 atIndex:5];
  [v20 setConstantValue:&v54 type:53 atIndex:6];
  v21 = [v16 library];
  v22 = (void *)[v21 newFunctionWithName:@"FusionVert"];

  if (!v22)
  {
    FigDebugAssert3();
    goto LABEL_19;
  }
  v23 = [v16 library];
  v24 = [v16 pipelineLibrary];
  id v51 = 0;
  v25 = (void *)[v23 newFunctionWithName:v17 constantValues:v20 pipelineLibrary:v24 error:&v51];
  id v26 = v51;

  if (!v25)
  {
    FigDebugAssert3();
    v28 = 0;
    goto LABEL_23;
  }
  id v27 = objc_alloc_init(MEMORY[0x263F129C0]);
  v28 = v27;
  if (!v27)
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  [v27 setVertexFunction:v22];
  [v28 setFragmentFunction:v25];
  v29 = [v16 fullRangeVertexDesc];
  [v28 setVertexDescriptor:v29];

  v30 = [v28 colorAttachments];
  v31 = [v30 objectAtIndexedSubscript:0];
  [v31 setPixelFormat:a5];

  if (v52)
  {
    v32 = [v28 colorAttachments];
    v33 = [v32 objectAtIndexedSubscript:1];
    [v33 setPixelFormat:a6];
  }
  if (!v58 || !v57)
  {
    v34 = [v28 colorAttachments];
    v35 = [v34 objectAtIndexedSubscript:2];
    [v35 setPixelFormat:a5];

    if (!v58 && !v52)
    {
      v36 = [v28 colorAttachments];
      v37 = [v36 objectAtIndexedSubscript:3];
      [v37 setPixelFormat:a5];
    }
  }
  v38 = [v16 pipelineLibrary];
  [v28 setPipelineLibrary:v38];

  v39 = [v16 device];
  id v50 = v26;
  uint64_t v40 = [v39 newRenderPipelineStateWithDescriptor:v28 error:&v50];
  id v41 = v50;

  pipeline = v18->_pipeline;
  v18->_pipeline = (MTLRenderPipelineState *)v40;

  if (!v18->_pipeline)
  {
    FigDebugAssert3();
    id v26 = v41;
LABEL_23:
    int v46 = FigSignalErrorAt();
    v43 = 0;
    if (v46) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v18->_fragName, obj);
  id v26 = v41;
LABEL_14:
  v43 = v18;
LABEL_15:
  v44 = v43;

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragName, 0);

  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end