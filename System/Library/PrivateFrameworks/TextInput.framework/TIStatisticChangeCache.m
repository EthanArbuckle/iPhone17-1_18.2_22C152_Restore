@interface TIStatisticChangeCache
+ (id)sharedInstance;
- (TIStatisticChangeCache)init;
- (id)flush;
- (void)addValue:(int)a3 toStatisticWithName:(id)a4 andInputMode:(id)a5;
- (void)addValue:(int)a3 toStatisticWithName:(id)a4 inCache:(id)a5;
@end

@implementation TIStatisticChangeCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheWithInputMode, 0);

  objc_storeStrong((id *)&self->_cacheWithoutInputMode, 0);
}

- (id)flush
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v4 = self->_cacheWithoutInputMode;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_cacheWithoutInputMode objectForKey:v9];
        uint64_t v11 = [v10 intValue];

        v12 = +[TIStatisticChange statisticChangeWithName:v9 andValue:v11 andInputMode:0];
        [v3 addObject:v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v6);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = self->_cacheWithInputMode;
  uint64_t v32 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v39;
    v31 = self;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v13;
        uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
        v15 = [(NSMutableDictionary *)self->_cacheWithInputMode objectForKey:v14];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              v21 = [v15 objectForKey:v20];
              uint64_t v22 = [v21 intValue];

              v23 = +[TIStatisticChange statisticChangeWithName:v20 andValue:v22 andInputMode:v14];
              [v3 addObject:v23];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
          }
          while (v17);
        }

        uint64_t v13 = v33 + 1;
        self = v31;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v32);
  }

  v24 = (NSMutableDictionary *)objc_opt_new();
  cacheWithoutInputMode = self->_cacheWithoutInputMode;
  self->_cacheWithoutInputMode = v24;

  v26 = (NSMutableDictionary *)objc_opt_new();
  cacheWithInputMode = self->_cacheWithInputMode;
  self->_cacheWithInputMode = v26;

  return v3;
}

- (void)addValue:(int)a3 toStatisticWithName:(id)a4 inCache:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v7 objectForKey:v8];
  id v11 = v9;
  if (v9) {
    uint64_t v6 = [v9 intValue] + v6;
  }
  v10 = [NSNumber numberWithInt:v6];
  [v7 setValue:v10 forKey:v8];
}

- (void)addValue:(int)a3 toStatisticWithName:(id)a4 andInputMode:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v12 = a4;
  id v8 = a5;
  if (v8)
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_cacheWithInputMode objectForKey:v8];
    if (!v9)
    {
      v10 = [(NSMutableDictionary *)self->_cacheWithInputMode allKeys];
      uint64_t v11 = [v10 count];

      if (v11) {
        [(NSMutableDictionary *)self->_cacheWithInputMode removeAllObjects];
      }
      uint64_t v9 = objc_opt_new();
      [(NSMutableDictionary *)self->_cacheWithInputMode setObject:v9 forKey:v8];
    }
    [(TIStatisticChangeCache *)self addValue:v6 toStatisticWithName:v12 inCache:v9];
  }
  else
  {
    [(TIStatisticChangeCache *)self addValue:v6 toStatisticWithName:v12 inCache:self->_cacheWithoutInputMode];
  }
}

- (TIStatisticChangeCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIStatisticChangeCache;
  v2 = [(TIStatisticChangeCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cacheWithoutInputMode = v2->_cacheWithoutInputMode;
    v2->_cacheWithoutInputMode = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    cacheWithInputMode = v2->_cacheWithInputMode;
    v2->_cacheWithInputMode = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8291 != -1) {
    dispatch_once(&sharedInstance_onceToken_8291, &__block_literal_global_8292);
  }
  v2 = (void *)sharedInstance_instance_8293;

  return v2;
}

uint64_t __40__TIStatisticChangeCache_sharedInstance__block_invoke()
{
  sharedInstance_instance_8293 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end