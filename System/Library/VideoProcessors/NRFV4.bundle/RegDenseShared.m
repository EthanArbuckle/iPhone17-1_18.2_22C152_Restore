@interface RegDenseShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3;
@end

@implementation RegDenseShared

- (id)getShaders:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v7 = [[RegDenseShaders alloc] initWithMetal:v4];
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
  return +[RegDenseShared getSharedInstanceOrRelease:0];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_4;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    if (getSharedInstanceOrRelease__singleton_4) {
      goto LABEL_6;
    }
    v6 = objc_alloc_init(RegDenseShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_4;
  }
  getSharedInstanceOrRelease__singleton_4 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)getSharedInstanceOrRelease__singleton_4;
  objc_sync_exit(v4);

  return v7;
}

+ (void)releaseSharedInstance
{
  id v2 = +[RegDenseShared getSharedInstanceOrRelease:1];
}

- (void).cxx_destruct
{
}

@end