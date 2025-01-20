@interface ColorConvertStageShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3;
@end

@implementation ColorConvertStageShared

- (id)getShaders:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v7 = [[ColorConvertStageShaders alloc] initWithMetal:v4];
    if (v7)
    {
      objc_storeStrong((id *)p_shaders, v7);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v7;
}

+ (id)sharedInstance
{
  return +[ColorConvertStageShared getSharedInstanceOrRelease:0];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_5;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    if (getSharedInstanceOrRelease__singleton_5) {
      goto LABEL_6;
    }
    v6 = objc_alloc_init(ColorConvertStageShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_5;
  }
  getSharedInstanceOrRelease__singleton_5 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)getSharedInstanceOrRelease__singleton_5;
  objc_sync_exit(v4);

  return v7;
}

+ (void)releaseSharedInstance
{
  id v2 = +[ColorConvertStageShared getSharedInstanceOrRelease:1];
}

- (void).cxx_destruct
{
}

@end