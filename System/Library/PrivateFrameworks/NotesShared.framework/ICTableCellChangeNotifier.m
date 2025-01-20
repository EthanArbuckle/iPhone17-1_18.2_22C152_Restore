@interface ICTableCellChangeNotifier
- (ICTableCellChangeNotifier)init;
- (NSHashTable)observers;
- (void)addObserver:(id)a3;
- (void)notifyOfChangeAtColumnID:(id)a3 rowID:(id)a4 delta:(int64_t)a5;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation ICTableCellChangeNotifier

- (ICTableCellChangeNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableCellChangeNotifier;
  v2 = [(ICTableCellChangeNotifier *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableCellChangeNotifier *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableCellChangeNotifier *)self observers];
  [v5 removeObject:v4];
}

- (void)notifyOfChangeAtColumnID:(id)a3 rowID:(id)a4 delta:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = [(ICTableCellChangeNotifier *)self observers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) tableValueDidChangeAtColumnID:v8 rowID:v9 delta:a5];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end