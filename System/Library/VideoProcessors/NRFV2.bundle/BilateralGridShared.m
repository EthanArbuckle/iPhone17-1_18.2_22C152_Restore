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
    v10 = [BilateralGridShaders alloc];
    v9 = (BilateralGridShaders *)objc_msgSend_initWithMetal_normalizeGridConfidence_(v10, v11, (uint64_t)v6, v4);
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
  return (id)objc_msgSend_getSharedInstanceOrRelease_(BilateralGridShared, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(BilateralGridShared, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)qword_26B429670;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    if (qword_26B429670) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(BilateralGridShared);
    v5 = (void *)qword_26B429670;
  }
  qword_26B429670 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)qword_26B429670;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
}

@end