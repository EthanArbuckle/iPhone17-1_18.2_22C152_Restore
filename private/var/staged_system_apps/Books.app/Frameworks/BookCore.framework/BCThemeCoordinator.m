@interface BCThemeCoordinator
+ (BCThemeCoordinator)shared;
- (BCThemeCoordinator)init;
- (NSArray)observers;
- (NSHashTable)observersHash;
- (void)addObserver:(id)a3;
- (void)observer:(id)a3 didChangeFont:(id)a4;
- (void)observer:(id)a3 didChangeLayout:(unint64_t)a4;
- (void)observer:(id)a3 didChangeStyle:(unint64_t)a4;
- (void)observerDidDecreaseFontSize:(id)a3;
- (void)observerDidIncreaseFontSize:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObserversHash:(id)a3;
@end

@implementation BCThemeCoordinator

+ (BCThemeCoordinator)shared
{
  if (qword_345640 != -1) {
    dispatch_once(&qword_345640, &stru_2C5988);
  }
  v2 = (void *)qword_345638;

  return (BCThemeCoordinator *)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BCThemeCoordinator *)self observersHash];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BCThemeCoordinator *)self observersHash];
  [v5 removeObject:v4];
}

- (NSArray)observers
{
  v2 = [(BCThemeCoordinator *)self observersHash];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)observer:(id)a3 didChangeFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(BCThemeCoordinator *)self observers];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v12);
        if ((objc_opt_respondsToSelector() & 1) != 0 && v13 != v6) {
          [v13 coordinator:self observer:v6 didChangeFont:v7];
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)observerDidIncreaseFontSize:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BCThemeCoordinator *)self observers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * (void)v9);
        if ((objc_opt_respondsToSelector() & 1) != 0 && v10 != v4) {
          [v10 coordinator:self observerDidIncreaseFontSize:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)observerDidDecreaseFontSize:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BCThemeCoordinator *)self observers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * (void)v9);
        if ((objc_opt_respondsToSelector() & 1) != 0 && v10 != v4) {
          [v10 coordinator:self observerDidDecreaseFontSize:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)observer:(id)a3 didChangeStyle:(unint64_t)a4
{
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(BCThemeCoordinator *)self observers];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v11);
        if ((objc_opt_respondsToSelector() & 1) != 0 && v12 != v6) {
          [v12 coordinator:self observer:v6 didChangeStyle:a4];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)observer:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(BCThemeCoordinator *)self observers];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v11);
        if ((objc_opt_respondsToSelector() & 1) != 0 && v12 != v6) {
          [v12 coordinator:self observer:v6 didChangeLayout:a4];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BCThemeCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCThemeCoordinator;
  v2 = [(BCThemeCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observersHash = v2->_observersHash;
    v2->_observersHash = (NSHashTable *)v3;
  }
  return v2;
}

- (NSHashTable)observersHash
{
  return self->_observersHash;
}

- (void)setObserversHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end