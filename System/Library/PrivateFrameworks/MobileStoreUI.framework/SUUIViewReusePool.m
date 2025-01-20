@interface SUUIViewReusePool
- (Class)viewClassWithReuseIdentifier:(id)a3;
- (SUUIViewReusePool)initWithParentView:(id)a3;
- (id)dequeueReusableViewWithReuseIdentifier:(id)a3;
- (void)hideUnusedViews;
- (void)recycleReusableViews:(id)a3;
- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4;
@end

@implementation SUUIViewReusePool

- (SUUIViewReusePool)initWithParentView:(id)a3
{
  objc_initWeak(&location, a3);
  v9.receiver = self;
  v9.super_class = (Class)SUUIViewReusePool;
  v4 = [(SUUIViewReusePool *)&v9 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_parentView, v5);

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    viewPool = v4->_viewPool;
    v4->_viewPool = v6;
  }
  objc_destroyWeak(&location);
  return v4;
}

- (id)dequeueReusableViewWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  viewPool = self->_viewPool;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SUUIViewReusePool_dequeueReusableViewWithReuseIdentifier___block_invoke;
  v12[3] = &unk_265406A30;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [(NSMutableArray *)viewPool indexOfObjectPassingTest:v12];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(SUUIViewReusePool *)self viewClassWithReuseIdentifier:v6];
    if (v8)
    {
      id v9 = objc_alloc_init(v8);
      objc_setAssociatedObject(v9, "com.apple.iTunesStoreUI.viewReuse.ID", v6, (void *)1);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = v7;
    id v9 = [(NSMutableArray *)self->_viewPool objectAtIndexedSubscript:v7];
    [v9 setHidden:0];
    [(NSMutableArray *)self->_viewPool removeObjectAtIndex:v10];
  }

  return v9;
}

uint64_t __60__SUUIViewReusePool_dequeueReusableViewWithReuseIdentifier___block_invoke(uint64_t a1, id object)
{
  v3 = objc_getAssociatedObject(object, "com.apple.iTunesStoreUI.viewReuse.ID");
  if (v3) {
    uint64_t v4 = [*(id *)(a1 + 32) isEqualToString:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)hideUnusedViews
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_viewPool;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setHidden:", 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)recycleReusableViews:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    long long v8 = (_OWORD *)MEMORY[0x263F000D0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_getAssociatedObject(v10, "com.apple.iTunesStoreUI.viewReuse.ID");

        if (v11)
        {
          [(NSMutableArray *)self->_viewPool insertObject:v10 atIndex:0];
          [v10 setCharge:0.0];
          long long v12 = v8[1];
          v13[0] = *v8;
          v13[1] = v12;
          v13[2] = v8[2];
          [v10 setTransform:v13];
        }
        else
        {
          [v10 removeFromSuperview];
        }
        if ([v10 conformsToProtocol:&unk_2705FBA30]) {
          [v10 viewWasRecycled];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4
{
  id v6 = a4;
  reuseClasses = self->_reuseClasses;
  id v10 = v6;
  if (!reuseClasses)
  {
    long long v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    long long v9 = self->_reuseClasses;
    self->_reuseClasses = v8;

    id v6 = v10;
    reuseClasses = self->_reuseClasses;
  }
  [(NSMutableDictionary *)reuseClasses setObject:a3 forKeyedSubscript:v6];
}

- (Class)viewClassWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  if (_SUUIViewReusePoolGetCommonReuseClasses_onceToken != -1) {
    dispatch_once(&_SUUIViewReusePoolGetCommonReuseClasses_onceToken, &__block_literal_global_40);
  }
  uint64_t v5 = (void *)[(id)_SUUIViewReusePoolGetCommonReuseClasses_commonReuseClasses objectForKeyedSubscript:v4];
  if (!v5) {
    uint64_t v5 = (void *)[(NSMutableDictionary *)self->_reuseClasses objectForKeyedSubscript:v4];
  }
  id v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewPool, 0);
  objc_storeStrong((id *)&self->_reuseClasses, 0);

  objc_destroyWeak((id *)&self->_parentView);
}

@end