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
    v8 = [GuidedFilterShaders alloc];
    v7 = (GuidedFilterShaders *)objc_msgSend_initWithMetalContext_(v8, v9, (uint64_t)v4, v10);
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
  return (id)objc_msgSend_getSharedInstanceOrRelease_(GuidedFilterShared, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(GuidedFilterShared, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)qword_26B429720;
  if (v3)
  {
    qword_26B429720 = 0;

    v5 = (void *)qword_26B429720;
LABEL_5:
    id v8 = v5;
    goto LABEL_6;
  }
  if (qword_26B429720) {
    goto LABEL_5;
  }
  v6 = objc_alloc_init(GuidedFilterShared);
  v7 = (void *)qword_26B429720;
  qword_26B429720 = (uint64_t)v6;

  v5 = (void *)qword_26B429720;
  if (qword_26B429720) {
    goto LABEL_5;
  }
  FigDebugAssert3();
  id v8 = 0;
LABEL_6:
  objc_sync_exit(v4);

  return v8;
}

- (void).cxx_destruct
{
}

@end