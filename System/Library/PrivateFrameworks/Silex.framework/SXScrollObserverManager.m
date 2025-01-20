@interface SXScrollObserverManager
- (BOOL)scrolling;
- (NSHashTable)observers;
- (SXScrollObserverManager)init;
- (void)addScrollObserver:(id)a3;
- (void)didScroll;
- (void)didStopScrolling;
- (void)removeScrollObserver:(id)a3;
- (void)setScrolling:(BOOL)a3;
- (void)willStartScrolling;
@end

@implementation SXScrollObserverManager

- (SXScrollObserverManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXScrollObserverManager;
  v2 = [(SXScrollObserverManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)addScrollObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollObserverManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeScrollObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollObserverManager *)self observers];
  [v5 removeObject:v4];
}

- (void)willStartScrolling
{
}

- (void)didScroll
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(SXScrollObserverManager *)self scrolling])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [(SXScrollObserverManager *)self observers];
    id v4 = (void *)[v3 copy];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) didScroll];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)didStopScrolling
{
}

- (void)setScrolling:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_scrolling != a3)
  {
    BOOL v3 = a3;
    self->_scrolling = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(SXScrollObserverManager *)self observers];
    uint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (v3) {
            [v10 scrollingWillStart];
          }
          else {
            [v10 scrollingDidStop];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BOOL)scrolling
{
  return self->_scrolling;
}

- (void).cxx_destruct
{
}

@end