@interface GuidedFilterShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3;
@end

@implementation GuidedFilterShared

- (id)getShaders:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v7 = [[GuidedFilterShaders alloc] initWithMetalContext:v4];
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
  return +[GuidedFilterShared getSharedInstanceOrRelease:0];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_8;
  if (v3)
  {
    getSharedInstanceOrRelease__singleton_8 = 0;

    v5 = (void *)getSharedInstanceOrRelease__singleton_8;
LABEL_5:
    id v8 = v5;
    goto LABEL_6;
  }
  if (getSharedInstanceOrRelease__singleton_8) {
    goto LABEL_5;
  }
  v6 = objc_alloc_init(GuidedFilterShared);
  v7 = (void *)getSharedInstanceOrRelease__singleton_8;
  getSharedInstanceOrRelease__singleton_8 = (uint64_t)v6;

  v5 = (void *)getSharedInstanceOrRelease__singleton_8;
  if (getSharedInstanceOrRelease__singleton_8) {
    goto LABEL_5;
  }
  FigDebugAssert3();
  id v8 = 0;
LABEL_6:
  objc_sync_exit(v4);

  return v8;
}

+ (void)releaseSharedInstance
{
  id v2 = +[GuidedFilterShared getSharedInstanceOrRelease:1];
}

- (void).cxx_destruct
{
}

@end