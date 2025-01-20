@interface __RCKeyPathObservance
- (NSArray)keyPaths;
- (NSObject)object;
- (id)observer;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remove;
- (void)setKeyPaths:(id)a3;
- (void)setObject:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation __RCKeyPathObservance

- (void)setObserver:(id)a3
{
}

- (void)setObject:(id)a3
{
}

- (void)setKeyPaths:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &__keyPathObserverContext) {
    (*((void (**)(void))self->_observer + 2))();
  }
}

- (void)remove
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  if (WeakRetained)
  {
    keyPaths = self->_keyPaths;
    if (keyPaths)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v5 = keyPaths;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, *(void *)(*((void *)&v12 + 1) + 8 * v9++), &__keyPathObserverContext, (void)v12);
          }
          while (v7 != v9);
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      v10 = self->_keyPaths;
      self->_keyPaths = 0;

      id observer = self->_observer;
      self->_id observer = 0;
    }
  }
}

- (void)dealloc
{
  [(__RCKeyPathObservance *)self remove];
  v3.receiver = self;
  v3.super_class = (Class)__RCKeyPathObservance;
  [(__RCKeyPathObservance *)&v3 dealloc];
}

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  return WeakRetained;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (id)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);

  objc_destroyWeak((id *)&self->_object);
}

@end