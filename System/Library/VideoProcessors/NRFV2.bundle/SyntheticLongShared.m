@interface SyntheticLongShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3;
@end

@implementation SyntheticLongShared

- (id)getShaders:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v8 = [SyntheticLongShaders alloc];
    v7 = (SyntheticLongShaders *)objc_msgSend_initWithMetal_(v8, v9, (uint64_t)v4, v10);
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
  return (id)objc_msgSend_getSharedInstanceOrRelease_(SyntheticLongShared, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(SyntheticLongShared, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_26B429660 != -1) {
    dispatch_once(&qword_26B429660, &unk_270E34148);
  }
  if (v3)
  {
    id v4 = (void *)qword_26B4296E0;
    qword_26B4296E0 = 0;

    qword_26B429660 = 0;
  }
  v5 = (void *)qword_26B4296E0;

  return v5;
}

- (void).cxx_destruct
{
}

@end