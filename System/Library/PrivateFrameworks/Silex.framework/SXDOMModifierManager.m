@interface SXDOMModifierManager
- (NSCache)cache;
- (NSMutableArray)modifiers;
- (SXDOMCacheKeyFactory)cacheKeyFactory;
- (SXDOMFactory)DOMFactory;
- (SXDOMModificationContextFactory)contextFactory;
- (SXDOMModifierManager)initWithDOMFactory:(id)a3 contextFactory:(id)a4 cacheKeyFactory:(id)a5;
- (void)addModifier:(id)a3;
- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5;
@end

@implementation SXDOMModifierManager

- (SXDOMModifierManager)initWithDOMFactory:(id)a3 contextFactory:(id)a4 cacheKeyFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SXDOMModifierManager;
  v12 = [(SXDOMModifierManager *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_DOMFactory, a3);
    objc_storeStrong((id *)&v13->_contextFactory, a4);
    objc_storeStrong((id *)&v13->_cacheKeyFactory, a5);
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    modifiers = v13->_modifiers;
    v13->_modifiers = (NSMutableArray *)v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v13->_cache;
    v13->_cache = v16;
  }
  return v13;
}

- (void)addModifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXDOMModifierManager *)self modifiers];
    [v5 addObject:v4];
  }
}

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (![v7 type])
  {
    id v9 = [(SXDOMModifierManager *)self cacheKeyFactory];
    id v10 = [v7 options];
    id v11 = [v9 createCacheKeyForLayoutOptions:v10];

    v12 = [(SXDOMModifierManager *)self cache];
    id v13 = [v12 objectForKey:v11];

    uint64_t v14 = (void *)SXLayoutLog;
    BOOL v15 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (!v15)
      {
LABEL_20:
        [v8 setDOM:v13];

        goto LABEL_21;
      }
      v16 = v14;
      v17 = [v7 identifier];
      v18 = [(SXDOMModifierManager *)self cache];
      *(_DWORD *)buf = 138543618;
      v39 = v17;
      __int16 v40 = 2048;
      v41 = v18;
      _os_log_impl(&dword_222AC5000, v16, OS_LOG_TYPE_DEFAULT, "Using cached DOM for layout, task-identifier=%{public}@, cache=%p", buf, 0x16u);
    }
    else
    {
      if (v15)
      {
        objc_super v19 = v14;
        v20 = [v7 identifier];
        *(_DWORD *)buf = 138543362;
        v39 = v20;
        _os_log_impl(&dword_222AC5000, v19, OS_LOG_TYPE_DEFAULT, "Creating new DOM for layout, task-identifier=%{public}@", buf, 0xCu);
      }
      v21 = [(SXDOMModifierManager *)self DOMFactory];
      v22 = [v21 createDOM];
      v16 = [v22 mutableCopy];

      v23 = [(SXDOMModifierManager *)self contextFactory];
      v24 = [v7 options];
      v17 = [v23 createModificationContextWithLayoutOptions:v24];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v25 = [(SXDOMModifierManager *)self modifiers];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v35;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v35 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v34 + 1) + 8 * v29++) modifyDOM:v16 context:v17];
          }
          while (v27 != v29);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v27);
      }

      id v13 = [v16 copy];
      if (!v13) {
        goto LABEL_19;
      }
      v30 = (void *)SXLayoutLog;
      if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = [v7 identifier];
        v33 = [(SXDOMModifierManager *)self cache];
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        __int16 v40 = 2048;
        v41 = v33;
        _os_log_impl(&dword_222AC5000, v31, OS_LOG_TYPE_DEFAULT, "Caching DOM for layout, task-identifier=%{public}@, cache=%p", buf, 0x16u);
      }
      v18 = [(SXDOMModifierManager *)self cache];
      [v18 setObject:v13 forKey:v11];
    }

LABEL_19:
    goto LABEL_20;
  }
LABEL_21:
}

- (SXDOMFactory)DOMFactory
{
  return self->_DOMFactory;
}

- (SXDOMModificationContextFactory)contextFactory
{
  return self->_contextFactory;
}

- (SXDOMCacheKeyFactory)cacheKeyFactory
{
  return self->_cacheKeyFactory;
}

- (NSMutableArray)modifiers
{
  return self->_modifiers;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_cacheKeyFactory, 0);
  objc_storeStrong((id *)&self->_contextFactory, 0);
  objc_storeStrong((id *)&self->_DOMFactory, 0);
}

@end