@interface NSObject
- (void)addObserver:(id)a3 forKeyPaths:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)removeObserver:(id)a3 forKeyPaths:(id)a4 context:(void *)a5;
@end

@implementation NSObject

- (void)addObserver:(id)a3 forKeyPaths:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [self addObserver:v10 forKeyPath:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) options:a5 context:a6];
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)removeObserver:(id)a3 forKeyPaths:(id)a4 context:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [self removeObserver:v8 forKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) context:a5];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

@end