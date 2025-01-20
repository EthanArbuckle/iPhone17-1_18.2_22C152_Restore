@interface AEBookRenderingCallbackTargetProxy
- (AEBookRenderingCallbackTargetProxy)initWithTarget:(id)a3;
- (IMRenderingCacheCallback)target;
- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4;
- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4 pageNumber:(int64_t)a5;
- (void)setTarget:(id)a3;
@end

@implementation AEBookRenderingCallbackTargetProxy

- (AEBookRenderingCallbackTargetProxy)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AEBookRenderingCallbackTargetProxy;
  v5 = [(AEBookRenderingCallbackTargetProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_target, v4);
  }

  return v6;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4
{
  p_target = &self->_target;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_target);
  [WeakRetained renderingCacheCallbackImage:v7 context:v6];
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4 pageNumber:(int64_t)a5
{
  p_target = &self->_target;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_target);
  [WeakRetained renderingCacheCallbackImage:v9 context:v8 pageNumber:a5];
}

- (IMRenderingCacheCallback)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (IMRenderingCacheCallback *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end