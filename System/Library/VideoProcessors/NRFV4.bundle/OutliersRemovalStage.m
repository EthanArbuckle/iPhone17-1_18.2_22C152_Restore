@interface OutliersRemovalStage
+ (int)prewarmShaders:(id)a3;
- (OutliersRemovalStage)initWithMetalContext:(id)a3;
- (int)runWithInput:(id)a3 output:(id)a4 gamma:(float)a5;
@end

@implementation OutliersRemovalStage

- (OutliersRemovalStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OutliersRemovalStage;
  v6 = [(OutliersRemovalStage *)&v13 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  if (!v7->_metal) {
    goto LABEL_5;
  }
  v8 = +[OutliersRemovalShared sharedInstance];
  uint64_t v9 = [v8 getShaders:v7->_metal];
  shaders = v7->_shaders;
  v7->_shaders = (OutliersRemovalShaders *)v9;

  if (!v7->_shaders)
  {
LABEL_5:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v11 = v7;
LABEL_7:

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[OutliersRemovalShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)runWithInput:(id)a3 output:(id)a4 gamma:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  float v19 = a5;
  v10 = [(FigMetalContext *)self->_metal commandQueue];
  v11 = [v10 commandBuffer];

  if (v11 && ([v11 computeCommandEncoder], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v13 = v12;
    [v12 setComputePipelineState:self->_shaders->_outiersRemovalFilter];
    [v13 setTexture:v8 atIndex:0];
    [v13 setTexture:v9 atIndex:1];
    [v13 setBytes:&v19 length:4 atIndex:0];
    [v13 setImageblockWidth:32 height:32];
    v18[0] = (unint64_t)[v9 width] >> 1;
    v18[1] = (unint64_t)[v9 height] >> 1;
    v18[2] = 1;
    int64x2_t v16 = vdupq_n_s64(0x10uLL);
    uint64_t v17 = 1;
    [v13 dispatchThreads:v18 threadsPerThreadgroup:&v16];
    [v13 endEncoding];
    [v11 commit];

    int v14 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end