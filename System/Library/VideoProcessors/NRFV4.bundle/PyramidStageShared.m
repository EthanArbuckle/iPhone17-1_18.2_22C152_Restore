@interface PyramidStageShared
+ (BOOL)isRec709DownsampleSupported;
+ (id)compileShader:(id)a3 kernelType:(int)a4;
+ (id)compileShader:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5;
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getPipeline:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5;
- (id)getRec709DownsamplePipelineState:(id)a3 kernelType:(int)a4;
@end

@implementation PyramidStageShared

+ (id)compileShader:(id)a3 kernelType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 >= 0xC)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
  }
  else
  {
    v7 = [v5 computePipelineStateFor:off_2655C7C30[a4] constants:0];
  }

  return v7;
}

+ (id)compileShader:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5
{
  id v7 = a3;
  BOOL v13 = a4;
  BOOL v12 = a5;
  v8 = objc_opt_new();
  v9 = v8;
  if (v8)
  {
    [v8 setConstantValue:&v13 type:53 atIndex:2];
    [v9 setConstantValue:&v12 type:53 atIndex:1];
    v10 = [v7 computePipelineStateFor:@"pyramid_downsample" constants:v9];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isRec709DownsampleSupported
{
  v2 = [MEMORY[0x263F2EE30] metalDevice];
  char v3 = [v2 supportsFamily:1004];

  return v3;
}

- (id)getPipeline:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (char *)self + 16 * v6 + 8 * v5;
  v11 = (void *)*((void *)v9 + 1);
  v10 = (id *)(v9 + 8);
  id v12 = v11;
  if (!v12)
  {
    id v12 = +[PyramidStageShared compileShader:v8 lumaWrite:v6 chromaWrite:v5];
    if (v12)
    {
      objc_storeStrong(v10, v12);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v12;
}

- (id)getRec709DownsamplePipelineState:(id)a3 kernelType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 >= 0xC)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }
  else
  {
    id v7 = &self->super.isa + v4;
    Class v9 = v7[5];
    id v8 = (id *)(v7 + 5);
    v10 = v9;
    if (!v10)
    {
      v10 = +[PyramidStageShared compileShader:v6 kernelType:v4];
      if (v10)
      {
        objc_storeStrong(v8, v10);
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
  }

  return v10;
}

+ (id)sharedInstance
{
  return +[PyramidStageShared getSharedInstanceOrRelease:0];
}

+ (void)releaseSharedInstance
{
  id v2 = +[PyramidStageShared getSharedInstanceOrRelease:1];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  uint64_t v4 = objc_opt_class();
  objc_sync_enter(v4);
  BOOL v5 = (void *)getSharedInstanceOrRelease__singleton_3;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    if (getSharedInstanceOrRelease__singleton_3) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(PyramidStageShared);
    BOOL v5 = (void *)getSharedInstanceOrRelease__singleton_3;
  }
  getSharedInstanceOrRelease__singleton_3 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)getSharedInstanceOrRelease__singleton_3;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
  for (uint64_t i = 128; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end