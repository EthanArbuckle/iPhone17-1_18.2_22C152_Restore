@interface DenoiseRemixFragmentShader
- (DenoiseRemixFragmentShader)initWithMetal:(id)a3 vertFunc:(id)a4 fragName:(id)a5 pixelFormat:(unint64_t)a6 pixelFormat2:(unint64_t)a7;
@end

@implementation DenoiseRemixFragmentShader

- (DenoiseRemixFragmentShader)initWithMetal:(id)a3 vertFunc:(id)a4 fragName:(id)a5 pixelFormat:(unint64_t)a6 pixelFormat2:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v37.receiver = self;
  v37.super_class = (Class)DenoiseRemixFragmentShader;
  v15 = [(DenoiseRemixFragmentShader *)&v37 init];
  if (!v15)
  {
    FigDebugAssert3();
    v17 = 0;
    v19 = 0;
    id v29 = 0;
    goto LABEL_17;
  }
  v16 = [v12 library];
  v17 = (void *)[v16 newFunctionWithName:v14];

  if (!v17)
  {
    FigDebugAssert3();
    v19 = 0;
LABEL_15:
    id v29 = 0;
    goto LABEL_17;
  }
  id v18 = objc_alloc_init(MEMORY[0x263F129C0]);
  v19 = v18;
  if (!v18)
  {
    FigDebugAssert3();
    goto LABEL_15;
  }
  id v35 = v14;
  id v20 = v13;
  [v18 setVertexFunction:v13];
  [v19 setFragmentFunction:v17];
  v21 = [v12 fullRangeVertexDesc];
  [v19 setVertexDescriptor:v21];

  if (a6)
  {
    v22 = [v19 colorAttachments];
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 setPixelFormat:a6];
  }
  if (a7)
  {
    v24 = [v19 colorAttachments];
    v25 = [v24 objectAtIndexedSubscript:1];
    [v25 setPixelFormat:a7];
  }
  v26 = [v12 pipelineLibrary];
  [v19 setPipelineLibrary:v26];

  v27 = [v12 device];
  id v36 = 0;
  uint64_t v28 = [v27 newRenderPipelineStateWithDescriptor:v19 error:&v36];
  id v29 = v36;
  pipeline = v15->_pipeline;
  v15->_pipeline = (MTLRenderPipelineState *)v28;

  if (!v15->_pipeline)
  {
    FigDebugAssert3();
    id v13 = v20;
    id v14 = v35;
LABEL_17:
    int v34 = FigSignalErrorAt();
    v31 = 0;
    if (v34) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v15->_fragName, a5);
  id v13 = v20;
  id v14 = v35;
LABEL_10:
  v31 = v15;
LABEL_11:
  v32 = v31;

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragName, 0);

  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end