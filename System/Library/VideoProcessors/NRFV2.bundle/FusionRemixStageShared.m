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
      uint64_t v13 = 25;
    }
    else {
      uint64_t v13 = 10;
    }
    if (v4) {
      v14 = (objc_class *)objc_msgSend_initWithMetal_pixelFormatLuma_pixelFormatChroma_(v11, v12, (uint64_t)v6, v13, 65);
    }
    else {
      v14 = (objc_class *)objc_msgSend_initWithMetal_pixelFormatLuma_pixelFormatChroma_(v11, v12, (uint64_t)v6, v13, 30);
    }
    v10 = v14;
    if (v14)
    {
      objc_storeStrong(v8, v14);
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
  return (id)objc_msgSend_getSharedInstanceOrRelease_(FusionRemixStageShared, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(FusionRemixStageShared, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)qword_26B429710;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    if (qword_26B429710) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(FusionRemixStageShared);
    v5 = (void *)qword_26B429710;
  }
  qword_26B429710 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)qword_26B429710;
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