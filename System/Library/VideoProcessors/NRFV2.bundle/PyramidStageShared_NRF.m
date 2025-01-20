@interface PyramidStageShared_NRF
+ (BOOL)isRec709DownsampleSupported;
+ (id)compileShader:(id)a3 kernelType:(int)a4;
+ (id)compileShader:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5;
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getPipeline:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5;
- (id)getRec709DownsamplePipelineState:(id)a3 kernelType:(int)a4;
@end

@implementation PyramidStageShared_NRF

- (id)getPipeline:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (char *)self + 16 * v6 + 8 * v5;
  v11 = (void *)*((void *)v9 + 1);
  v10 = (id *)(v9 + 8);
  id v13 = v11;
  if (!v13)
  {
    objc_msgSend_compileShader_lumaWrite_chromaWrite_(PyramidStageShared_NRF, v12, (uint64_t)v8, v6, v5);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_storeStrong(v10, v13);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v13;
}

- (id)getRec709DownsamplePipelineState:(id)a3 kernelType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 >= 0xC)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = 0;
  }
  else
  {
    v7 = &self->super.isa + v4;
    Class v9 = v7[5];
    id v8 = (id *)(v7 + 5);
    v11 = v9;
    if (!v11)
    {
      objc_msgSend_compileShader_kernelType_(PyramidStageShared_NRF, v10, (uint64_t)v6, v4);
      v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_storeStrong(v8, v11);
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
  }

  return v11;
}

+ (BOOL)isRec709DownsampleSupported
{
  uint64_t v4 = objc_msgSend_metalDevice(MEMORY[0x263F2EE30], a2, v2, v3);
  char v7 = objc_msgSend_supportsFamily_(v4, v5, 1004, v6);

  return v7;
}

+ (id)compileShader:(id)a3 lumaWrite:(BOOL)a4 chromaWrite:(BOOL)a5
{
  id v7 = a3;
  BOOL v16 = a4;
  BOOL v15 = a5;
  id v8 = objc_opt_new();
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setConstantValue_type_atIndex_(v8, v9, (uint64_t)&v16, 53, 2);
    objc_msgSend_setConstantValue_type_atIndex_(v10, v11, (uint64_t)&v15, 53, 1);
    id v13 = objc_msgSend_computePipelineStateFor_constants_(v7, v12, @"pyramid_downsample", (uint64_t)v10);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v13 = 0;
  }

  return v13;
}

+ (id)compileShader:(id)a3 kernelType:(int)a4
{
  id v5 = a3;
  id v7 = v5;
  if (a4 >= 0xC)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v8 = 0;
  }
  else
  {
    id v8 = objc_msgSend_computePipelineStateFor_constants_(v5, v6, (uint64_t)*(&off_2655C33C8 + a4), 0);
  }

  return v8;
}

+ (id)sharedInstance
{
  return (id)objc_msgSend_getSharedInstanceOrRelease_(PyramidStageShared_NRF, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(PyramidStageShared_NRF, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  uint64_t v4 = objc_opt_class();
  objc_sync_enter(v4);
  id v5 = (void *)qword_26B4296C0;
  if (a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (qword_26B4296C0) {
      goto LABEL_6;
    }
    uint64_t v6 = objc_alloc_init(PyramidStageShared_NRF);
    id v5 = (void *)qword_26B4296C0;
  }
  qword_26B4296C0 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)qword_26B4296C0;
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