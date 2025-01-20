@interface FusionRemixStageShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3 fp16:(BOOL)a4;
@end

@implementation FusionRemixStageShared

- (id)getShaders:(id)a3 fp16:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = &self->super.isa + v4;
  Class v9 = v7[1];
  v8 = (id *)(v7 + 1);
  v10 = v9;
  if (!v10)
  {
    v11 = [FuseRemixShaders alloc];
    if (v4) {
      uint64_t v12 = 25;
    }
    else {
      uint64_t v12 = 10;
    }
    if (v4) {
      uint64_t v13 = 65;
    }
    else {
      uint64_t v13 = 30;
    }
    v10 = [(FuseRemixShaders *)v11 initWithMetal:v6 pixelFormatLuma:v12 pixelFormatChroma:v13];
    if (v10)
    {
      objc_storeStrong(v8, v10);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v10;
}

+ (id)sharedInstance
{
  return +[FusionRemixStageShared getSharedInstanceOrRelease:0];
}

+ (void)releaseSharedInstance
{
  id v2 = +[FusionRemixStageShared getSharedInstanceOrRelease:1];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_11;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    if (getSharedInstanceOrRelease__singleton_11) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(FusionRemixStageShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_11;
  }
  getSharedInstanceOrRelease__singleton_11 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)getSharedInstanceOrRelease__singleton_11;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end