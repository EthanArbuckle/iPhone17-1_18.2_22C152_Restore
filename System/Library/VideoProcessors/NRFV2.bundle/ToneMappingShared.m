@interface ToneMappingShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3;
@end

@implementation ToneMappingShared

- (id)getShaders:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v8 = [ToneMappingShaders alloc];
    v7 = (ToneMappingShaders *)objc_msgSend_initWithMetal_(v8, v9, (uint64_t)v4, v10);
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
  return (id)objc_msgSend_getSharedInstanceOrRelease_(ToneMappingShared, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(ToneMappingShared, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)qword_26B4296F8;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    if (qword_26B4296F8) {
      goto LABEL_6;
    }
    v6 = objc_alloc_init(ToneMappingShared);
    v5 = (void *)qword_26B4296F8;
  }
  qword_26B4296F8 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)qword_26B4296F8;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
}

@end