@interface SBSwitcherDemoFilteringController
- (NSArray)hiddenApplicationBundleIDs;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setHiddenApplicationBundleIDs:(id)a3;
@end

@implementation SBSwitcherDemoFilteringController

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)setHiddenApplicationBundleIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  hiddenApplicationBundleIDs = self->_hiddenApplicationBundleIDs;
  if (hiddenApplicationBundleIDs != v4 && ([(NSArray *)hiddenApplicationBundleIDs isEqual:v4] & 1) == 0)
  {
    v6 = (NSArray *)[(NSArray *)v4 copy];
    v7 = self->_hiddenApplicationBundleIDs;
    self->_hiddenApplicationBundleIDs = v6;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs:self];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (NSArray)hiddenApplicationBundleIDs
{
  return self->_hiddenApplicationBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end