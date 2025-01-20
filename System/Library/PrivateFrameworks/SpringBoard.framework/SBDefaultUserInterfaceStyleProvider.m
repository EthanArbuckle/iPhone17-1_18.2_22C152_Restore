@interface SBDefaultUserInterfaceStyleProvider
- (SBDefaultUserInterfaceStyleProvider)init;
- (int64_t)currentStyle;
- (void)_notifyObserversCurrentStyleChanged;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SBDefaultUserInterfaceStyleProvider

- (int64_t)currentStyle
{
  v2 = [MEMORY[0x1E4F42FE0] sharedInstance];
  int64_t v3 = [v2 currentStyle];

  return v3;
}

- (SBDefaultUserInterfaceStyleProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBDefaultUserInterfaceStyleProvider;
  v2 = [(SBDefaultUserInterfaceStyleProvider *)&v9 init];
  if (v2)
  {
    int64_t v3 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E4F28D30]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F43ED0];
    v7 = [MEMORY[0x1E4F42FE0] sharedInstance];
    [v5 addObserver:v2 selector:sel__notifyObserversCurrentStyleChanged name:v6 object:v7];
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

- (void)_notifyObserversCurrentStyleChanged
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(SBDefaultUserInterfaceStyleProvider *)self currentStyle];
  v4 = [MEMORY[0x1E4FA79A8] animationSettingsForTransitionToStyle:v3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) userInterfaceStyleProvider:self didUpdateStyle:v3 preferredAnimationSettings:v4 completion:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end