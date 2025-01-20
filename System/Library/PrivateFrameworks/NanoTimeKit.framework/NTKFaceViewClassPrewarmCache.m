@interface NTKFaceViewClassPrewarmCache
+ (id)sharedInstance;
- (NTKFaceViewClassPrewarmCache)init;
- (id)prewarmDataForClass:(Class)a3;
- (void)prewarmClasses:(id)a3;
@end

@implementation NTKFaceViewClassPrewarmCache

- (NTKFaceViewClassPrewarmCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKFaceViewClassPrewarmCache;
  v2 = [(NTKFaceViewClassPrewarmCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    prewarmCache = v2->_prewarmCache;
    v2->_prewarmCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_singleton;
  return v2;
}

void __46__NTKFaceViewClassPrewarmCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKFaceViewClassPrewarmCache);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;
}

- (id)prewarmDataForClass:(Class)a3
{
  v5 = NSStringFromClass(a3);
  objc_super v6 = [(NSMutableDictionary *)self->_prewarmCache objectForKeyedSubscript:v5];
  if (!v6)
  {
    objc_super v6 = [(objc_class *)a3 _prewarmSharedData];
    if (v6) {
      [(NSMutableDictionary *)self->_prewarmCache setObject:v6 forKey:v5];
    }
  }

  return v6;
}

- (void)prewarmClasses:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA80];
  objc_super v6 = [(NSMutableDictionary *)self->_prewarmCache allKeys];
  v7 = [v5 setWithArray:v6];

  v8 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = NSStringFromClass(*(Class *)(*((void *)&v38 + 1) + 8 * i));
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v7 mutableCopy];
  [v15 minusSet:v8];
  v16 = (void *)[v8 mutableCopy];
  v29 = v7;
  [v16 minusSet:v7];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NSMutableDictionary *)self->_prewarmCache removeObjectForKey:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v19);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v22 = v16;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(NSString **)(*((void *)&v30 + 1) + 8 * k);
        v28 = [NSClassFromString(v27) _prewarmSharedData];
        if (v28) {
          [(NSMutableDictionary *)self->_prewarmCache setObject:v28 forKey:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v24);
  }
}

- (void).cxx_destruct
{
}

@end