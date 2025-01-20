@interface _UISceneHostingActivationHandle
- (BOOL)isActive;
- (BOOL)isHandleValid;
- (id)initWithActivationTarget:(id *)a1;
- (void)activate:(id)a3;
- (void)deactivate:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _UISceneHostingActivationHandle

- (id)initWithActivationTarget:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UISceneHostingActivationHandle;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (void)dealloc
{
  if ([(_UISceneHostingActivationHandle *)self isHandleValid])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UISceneHostingActivationHandle.m" lineNumber:25 description:@"Scene activation handle deallocated before being invalidated"];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UISceneHostingActivationHandle;
  [(_UISceneHostingActivationHandle *)&v5 dealloc];
}

- (BOOL)isHandleValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)isActive
{
  if (![(_UISceneHostingActivationHandle *)self isHandleValid])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISceneHostingActivationHandle.m" lineNumber:35 description:@"This activation handle has invalidated!"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  char v5 = [WeakRetained isActive];

  return v5;
}

- (void)activate:(id)a3
{
  id v5 = a3;
  if (![(_UISceneHostingActivationHandle *)self isHandleValid])
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UISceneHostingActivationHandle.m" lineNumber:40 description:@"This activation handle has invalidated!"];
  }
  if ([(_UISceneHostingActivationHandle *)self isActive])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISceneHostingActivationHandle.m" lineNumber:41 description:@"The scene is already active"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  [WeakRetained activate:v5];
}

- (void)deactivate:(id)a3
{
  id v5 = a3;
  if (![(_UISceneHostingActivationHandle *)self isHandleValid])
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UISceneHostingActivationHandle.m" lineNumber:46 description:@"This activation handle has invalidated!"];
  }
  if (![(_UISceneHostingActivationHandle *)self isActive])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISceneHostingActivationHandle.m" lineNumber:47 description:@"The scene is already inactive"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  [WeakRetained deactivate:v5];
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

@end