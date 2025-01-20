@interface REMChangedKeysObserver
- (NSArray)keysToObserve;
- (NSMutableSet)mutableChangedKeys;
- (NSObject)target;
- (REMChangedKeysObserver)initWithTarget:(id)a3 keysToObserve:(id)a4 includeInitial:(BOOL)a5;
- (void)dealloc;
- (void)keyDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setKeysToObserve:(id)a3;
- (void)setMutableChangedKeys:(id)a3;
@end

@implementation REMChangedKeysObserver

- (REMChangedKeysObserver)initWithTarget:(id)a3 keysToObserve:(id)a4 includeInitial:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)REMChangedKeysObserver;
  v11 = [(REMChangedKeysObserver *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_target, a3);
    objc_storeStrong((id *)&v12->_keysToObserve, a4);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableChangedKeys = v12->_mutableChangedKeys;
    v12->_mutableChangedKeys = v13;

    long long v24 = 0u;
    long long v25 = 0u;
    if (v5) {
      uint64_t v15 = 7;
    }
    else {
      uint64_t v15 = 3;
    }
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v12, *(void *)(*((void *)&v22 + 1) + 8 * i), v15, 0, (void)v22);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_keysToObserve;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [self->_target removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)REMChangedKeysObserver;
  [(REMChangedKeysObserver *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F284E0];
  id v10 = a5;
  long long v11 = [v10 objectForKeyedSubscript:v9];
  long long v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

  v13 = v11;
  if (v11 != v12)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {

      long long v12 = 0;
    }
    v13 = v11;
    if (v11 != v12)
    {
      if (([v11 isEqual:v12] & 1) == 0)
      {
        id v16 = +[REMLog utility];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 138412802;
          id v19 = v8;
          __int16 v20 = 2112;
          v21 = v11;
          __int16 v22 = 2112;
          long long v23 = v12;
          _os_log_debug_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_DEBUG, "REMChangedKeysObserver detected a change {keyPath: %@, old: %@, new: %@}", (uint8_t *)&v18, 0x20u);
        }

        uint64_t v17 = [(REMChangedKeysObserver *)self mutableChangedKeys];
        [v17 addObject:v8];
      }
      v13 = v12;
    }
  }
}

- (void)keyDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(REMChangedKeysObserver *)self mutableChangedKeys];
  [v5 addObject:v4];
}

- (NSObject)target
{
  return self->_target;
}

- (NSArray)keysToObserve
{
  return self->_keysToObserve;
}

- (void)setKeysToObserve:(id)a3
{
}

- (NSMutableSet)mutableChangedKeys
{
  return self->_mutableChangedKeys;
}

- (void)setMutableChangedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChangedKeys, 0);
  objc_storeStrong((id *)&self->_keysToObserve, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end