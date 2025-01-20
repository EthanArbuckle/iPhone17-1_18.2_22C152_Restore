@interface BilateralGridShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3 normalizeGridConfidence:(BOOL)a4;
@end

@implementation BilateralGridShared

- (id)getShaders:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v9 = shaders;
  if (!v9)
  {
    v9 = [[BilateralGridShaders alloc] initWithMetal:v6 normalizeGridConfidence:v4];
    if (v9)
    {
      objc_storeStrong((id *)p_shaders, v9);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v9;
}

+ (id)sharedInstance
{
  return +[BilateralGridShared getSharedInstanceOrRelease:0];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_14;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    if (getSharedInstanceOrRelease__singleton_14) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(BilateralGridShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_14;
  }
  getSharedInstanceOrRelease__singleton_14 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)getSharedInstanceOrRelease__singleton_14;
  objc_sync_exit(v4);

  return v7;
}

+ (void)releaseSharedInstance
{
  id v2 = +[BilateralGridShared getSharedInstanceOrRelease:1];
}

- (void).cxx_destruct
{
}

@end