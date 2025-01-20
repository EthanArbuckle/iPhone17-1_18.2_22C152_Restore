@interface _PXPhotosDetailsPurger
+ (id)sharedPurger;
- (_PXPhotosDetailsPurger)init;
- (void)_purgeAllViewControllers;
- (void)detailsViewControllerDidAppear:(id)a3;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)purgeOldViewControllers;
@end

@implementation _PXPhotosDetailsPurger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedViewControllers, 0);
  objc_storeStrong((id *)&self->_allViewControllers, 0);
}

- (void)_purgeAllViewControllers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(NSHashTable *)self->_allViewControllers allObjects];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) purgeIfPossible];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)purgeOldViewControllers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [(NSPointerArray *)self->_lastUsedViewControllers allObjects];
  uint64_t v5 = [v3 setWithArray:v4];

  uint64_t v6 = [(NSHashTable *)self->_allViewControllers allObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v5 containsObject:v11] & 1) == 0)
        {
          uint64_t v12 = [v11 navigationController];
          if (!v12) {
            goto LABEL_9;
          }
          v13 = (void *)v12;
          v14 = [v11 navigationController];
          v15 = [v14 topViewController];

          if (v15 != v11) {
LABEL_9:
          }
            [v11 purgeIfPossible];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)detailsViewControllerDidAppear:(id)a3
{
  id v11 = a3;
  -[NSHashTable addObject:](self->_allViewControllers, "addObject:");
  uint64_t v4 = [(NSPointerArray *)self->_lastUsedViewControllers count];
  if (v4 >= 1)
  {
    unint64_t v5 = v4 + 1;
    do
    {
      if (![(NSPointerArray *)self->_lastUsedViewControllers pointerAtIndex:v5 - 2]) {
        [(NSPointerArray *)self->_lastUsedViewControllers removePointerAtIndex:v5 - 2];
      }
      --v5;
    }
    while (v5 > 1);
  }
  if ([(NSPointerArray *)self->_lastUsedViewControllers count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSPointerArray *)self->_lastUsedViewControllers pointerAtIndex:v6];
      if (v7 == v11) {
        break;
      }

      if (++v6 >= [(NSPointerArray *)self->_lastUsedViewControllers count]) {
        goto LABEL_12;
      }
    }
    [(NSPointerArray *)self->_lastUsedViewControllers removePointerAtIndex:v6];
  }
LABEL_12:
  [(NSPointerArray *)self->_lastUsedViewControllers addPointer:v11];
  uint64_t v8 = +[PXPhotosDetailsSettings sharedInstance];
  unint64_t v9 = [v8 detailViewsToKeepLoaded];

  if ([(NSPointerArray *)self->_lastUsedViewControllers count] > v9)
  {
    uint64_t v10 = [(NSPointerArray *)self->_lastUsedViewControllers count] - v9;
    if (v10 >= 1)
    {
      do
      {
        [(NSPointerArray *)self->_lastUsedViewControllers removePointerAtIndex:0];
        --v10;
      }
      while (v10);
    }
  }
}

- (void)didReceiveMemoryWarning:(id)a3
{
  uint64_t v4 = +[PXPhotosDetailsSettings sharedInstance];
  int v5 = [v4 purgeOnMemoryWarning];

  if (v5)
  {
    [(_PXPhotosDetailsPurger *)self _purgeAllViewControllers];
  }
}

- (_PXPhotosDetailsPurger)init
{
  v9.receiver = self;
  v9.super_class = (Class)_PXPhotosDetailsPurger;
  v2 = [(_PXPhotosDetailsPurger *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    allViewControllers = v2->_allViewControllers;
    v2->_allViewControllers = (NSHashTable *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    lastUsedViewControllers = v2->_lastUsedViewControllers;
    v2->_lastUsedViewControllers = (NSPointerArray *)v5;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_didReceiveMemoryWarning_ name:*MEMORY[0x1E4FB2650] object:0];
  }
  return v2;
}

+ (id)sharedPurger
{
  if (sharedPurger_onceToken != -1) {
    dispatch_once(&sharedPurger_onceToken, &__block_literal_global_91544);
  }
  v2 = (void *)sharedPurger_sharedPurger;
  return v2;
}

@end