@interface TPSKVOManager
- (TPSKVOManager)initWithObserver:(id)a3;
- (__CFDictionary)KVODictionary;
- (id)observer;
- (void)addKVOObject:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllKVOObjects;
- (void)removeKVOForObject:(id)a3;
- (void)removeKVOObject:(id)a3 forKeyPath:(id)a4;
- (void)setKVODictionary:(__CFDictionary *)a3;
- (void)setObserver:(id)a3;
@end

@implementation TPSKVOManager

- (TPSKVOManager)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSKVOManager;
  v5 = [(TPSKVOManager *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TPSKVOManager *)v5 setObserver:v4];
  }

  return v6;
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(TPSKVOManager *)self removeAllKVOObjects];
  KVODictionary = self->_KVODictionary;
  if (KVODictionary) {
    CFRelease(KVODictionary);
  }
  [(TPSKVOManager *)self setObserver:0];
  v4.receiver = self;
  v4.super_class = (Class)TPSKVOManager;
  [(TPSKVOManager *)&v4 dealloc];
}

- (__CFDictionary)KVODictionary
{
  result = self->_KVODictionary;
  if (!result)
  {
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    self->_KVODictionary = result;
  }
  return result;
}

- (void)addKVOObject:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id key = a3;
  id v10 = a4;
  if (key && v10)
  {
    if ([(TPSKVOManager *)self KVODictionary]
      && (CFDictionaryGetValue([(TPSKVOManager *)self KVODictionary], key),
          (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = v11;
      if ([v11 indexOfObject:v10] == 0x7FFFFFFFFFFFFFFFLL)
      {
        [key addObserver:self forKeyPath:v10 options:a5 context:a6];
        [v12 addObject:v10];
      }
    }
    else
    {
      [key addObserver:self forKeyPath:v10 options:a5 context:a6];
      v12 = [MEMORY[0x1E4F1CA48] array];
      [v12 addObject:v10];
      CFDictionarySetValue([(TPSKVOManager *)self KVODictionary], key, v12);
    }
  }
}

- (void)removeKVOObject:(id)a3 forKeyPath:(id)a4
{
  id key = a3;
  id v6 = a4;
  if (v6 && key && self->_KVODictionary)
  {
    v7 = CFDictionaryGetValue([(TPSKVOManager *)self KVODictionary], key);
    objc_super v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 indexOfObject:v6];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = v9;
        [key removeObserver:self forKeyPath:v6];
        [v8 removeObjectAtIndex:v10];
      }
    }
  }
}

- (void)removeKVOForObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && self->_KVODictionary)
  {
    v5 = CFDictionaryGetValue([(TPSKVOManager *)self KVODictionary], v4);
    id v6 = v5;
    if (v5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
      CFDictionaryRemoveValue(self->_KVODictionary, v4);
    }
  }
}

- (void)removeAllKVOObjects
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  KVODictionary = self->_KVODictionary;
  if (KVODictionary)
  {
    CFIndex Count = CFDictionaryGetCount(KVODictionary);
    if (Count)
    {
      uint64_t v5 = Count;
      memset(v49, 0, 512);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      *(_OWORD *)values = 0u;
      long long v18 = 0u;
      CFDictionaryGetKeysAndValues(self->_KVODictionary, (const void **)v49, (const void **)values);
      if (v5 >= 1)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t v7 = values[i];
          long long v12 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v13;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v13 != v10) {
                  objc_enumerationMutation(v7);
                }
                [*((id *)v49 + i) removeObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
              }
              while (v9 != v11);
              uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
            }
            while (v9);
          }
        }
      }
      CFDictionaryRemoveAllValues(self->_KVODictionary);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [(TPSKVOManager *)self observer];
  char v13 = objc_opt_respondsToSelector();

  long long v14 = [(TPSKVOManager *)self observer];
  long long v15 = v14;
  if (v13)
  {
    [v14 performSelector:a6 withObject:v10 withObject:v11];
  }
  else
  {
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_6;
    }
    long long v15 = [(TPSKVOManager *)self observer];
    [v15 observeValueForKeyPath:v17 ofObject:v10 change:v11 context:a6];
  }

LABEL_6:
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);
  return WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void)setKVODictionary:(__CFDictionary *)a3
{
  self->_KVODictionary = a3;
}

- (void).cxx_destruct
{
}

@end