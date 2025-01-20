@interface SBOverridableUserInterfaceStyleProvider
- (SBOverridableUserInterfaceStyleProvider)init;
- (int64_t)currentStyle;
- (void)_notifyObserversCurrentStyleChangedWithCompletion:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setOverrideStyle:(int64_t)a3 completion:(id)a4;
- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6;
@end

@implementation SBOverridableUserInterfaceStyleProvider

- (SBOverridableUserInterfaceStyleProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBOverridableUserInterfaceStyleProvider;
  v2 = [(SBOverridableUserInterfaceStyleProvider *)&v8 init];
  if (v2)
  {
    v3 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E4F28D30]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = objc_alloc_init(SBDefaultUserInterfaceStyleProvider);
    defaultUserInterfaceStyleProvider = v2->_defaultUserInterfaceStyleProvider;
    v2->_defaultUserInterfaceStyleProvider = v5;

    [(SBDefaultUserInterfaceStyleProvider *)v2->_defaultUserInterfaceStyleProvider addObserver:v2];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (int64_t)currentStyle
{
  if (self->_overrideStyle) {
    return self->_overrideStyle;
  }
  else {
    return [(SBDefaultUserInterfaceStyleProvider *)self->_defaultUserInterfaceStyleProvider currentStyle];
  }
}

- (void)setOverrideStyle:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  if (self->_overrideStyle == a3)
  {
    if (!v6) {
      goto LABEL_10;
    }
    objc_super v8 = v6;
    v6[2](v6);
  }
  else
  {
    objc_super v8 = v6;
    int64_t v7 = [(SBOverridableUserInterfaceStyleProvider *)self currentStyle];
    self->_overrideStyle = a3;
    if (v7 == [(SBOverridableUserInterfaceStyleProvider *)self currentStyle])
    {
      v6 = v8;
      if (!v8) {
        goto LABEL_10;
      }
      v8[2](v8);
    }
    else
    {
      [(SBOverridableUserInterfaceStyleProvider *)self _notifyObserversCurrentStyleChangedWithCompletion:v8];
    }
  }
  v6 = v8;
LABEL_10:
}

- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6
{
  if (!self->_overrideStyle) {
    -[SBOverridableUserInterfaceStyleProvider _notifyObserversCurrentStyleChangedWithCompletion:](self, "_notifyObserversCurrentStyleChangedWithCompletion:", a6, a4, a5);
  }
}

- (void)_notifyObserversCurrentStyleChangedWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int64_t v4 = [(SBOverridableUserInterfaceStyleProvider *)self currentStyle];
  v5 = dispatch_group_create();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        dispatch_group_enter(v5);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke;
        v16[3] = &unk_1E6AF4AC0;
        v17 = v5;
        [v10 userInterfaceStyleProvider:self didUpdateStyle:v4 preferredAnimationSettings:0 completion:v16];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke_2;
  block[3] = &unk_1E6AF5300;
  id v15 = v12;
  id v11 = v12;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUserInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end