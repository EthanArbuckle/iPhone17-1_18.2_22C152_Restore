@interface NTKDarwinNotificationCenter
+ (id)defaultCenter;
+ (void)postNotification:(id)a3;
- (NSMutableDictionary)observersByNotificationName;
- (NTKDarwinNotificationCenter)init;
- (void)_addObserver:(id)a3;
- (void)_registerForNotificationName:(id)a3;
- (void)_unregisterForNotificationNameIfNeeded:(id)a3;
- (void)addObserver:(id)a3 notificationName:(id)a4 selector:(SEL)a5;
- (void)addObserver:(id)a3 notificationName:(id)a4 usingBlock:(id)a5;
- (void)handleDarwinNotification:(id)a3;
- (void)removeObserver:(id)a3 notificationName:(id)a4;
- (void)setObserversByNotificationName:(id)a3;
@end

@implementation NTKDarwinNotificationCenter

+ (id)defaultCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NTKDarwinNotificationCenter_defaultCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, block);
  }
  v2 = (void *)defaultCenter_instance;
  return v2;
}

void __44__NTKDarwinNotificationCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultCenter_instance;
  defaultCenter_instance = (uint64_t)v1;
}

- (NTKDarwinNotificationCenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDarwinNotificationCenter;
  result = [(NTKDarwinNotificationCenter *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (void)postNotification:(id)a3
{
  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (void)addObserver:(id)a3 notificationName:(id)a4 usingBlock:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  if (v11 && v8)
  {
    [(NTKDarwinNotificationCenter *)self _registerForNotificationName:v8];
    v10 = objc_opt_new();
    [v10 setNotificationName:v8];
    [v10 setObserverObject:v11];
    [v10 setBlock:v9];
    [(NTKDarwinNotificationCenter *)self _addObserver:v10];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addObserver:(id)a3 notificationName:(id)a4 selector:(SEL)a5
{
  id v10 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v10 && v8 && a5)
  {
    [(NTKDarwinNotificationCenter *)self _registerForNotificationName:v8];
    id v9 = objc_opt_new();
    [v9 setNotificationName:v8];
    [v9 setObserverObject:v10];
    [v9 setSelector:a5];
    [(NTKDarwinNotificationCenter *)self _addObserver:v9];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3 notificationName:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    if (v7)
    {
      id v9 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
      id v10 = [v9 objectForKeyedSubscript:v7];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
      obuint64_t j = v11;
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v42;
LABEL_5:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
          id v17 = [v16 observerObject];

          if (v17 == v6) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
            if (v13) {
              goto LABEL_5;
            }
            id v11 = obj;
            goto LABEL_14;
          }
        }
        id v11 = v16;

        if (!v11) {
          goto LABEL_15;
        }
        [obj removeObject:v11];
      }
LABEL_14:

LABEL_15:
      [(NTKDarwinNotificationCenter *)self _unregisterForNotificationNameIfNeeded:v7];
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v18 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
      v19 = [v18 allValues];

      obuint64_t j = v19;
      uint64_t v32 = [v19 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v32)
      {
        uint64_t v31 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            v22 = (void *)[v21 copy];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v34 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                  id v28 = [v27 observerObject];

                  if (v28 == v6)
                  {
                    [v21 removeObject:v27];
                    v29 = [v27 notificationName];
                    [(NTKDarwinNotificationCenter *)self _unregisterForNotificationNameIfNeeded:v29];
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
              }
              while (v24);
            }
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v32);
        p_lock = &self->_lock;
        id v7 = 0;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)handleDarwinNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = (void *)[v6 copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "observerObject", (void)v20);

        if (v14)
        {
          uint64_t v15 = [v13 block];

          if (v15)
          {
            v16 = [v13 block];
            v16[2]();
LABEL_9:

            goto LABEL_11;
          }
          uint64_t v17 = [v13 selector];
          if (v17)
          {
            uint64_t v18 = v17;
            v16 = [v13 observerObject];
            if (objc_opt_respondsToSelector()) {
              ((void (*)(void (**)(void), uint64_t))[v16 methodForSelector:v18])(v16, v18);
            }
            goto LABEL_9;
          }
        }
        else
        {
          os_unfair_lock_lock(&self->_lock);
          [v6 removeObject:v13];
          [(NTKDarwinNotificationCenter *)self _unregisterForNotificationNameIfNeeded:v4];
          os_unfair_lock_unlock(&self->_lock);
        }
LABEL_11:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v10 = v19;
    }
    while (v19);
  }
}

- (void)_addObserver:(id)a3
{
  id v11 = a3;
  id v4 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];

  if (!v4)
  {
    v5 = objc_opt_new();
    [(NTKDarwinNotificationCenter *)self setObserversByNotificationName:v5];
  }
  id v6 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
  id v7 = [v11 notificationName];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = objc_opt_new();
    uint64_t v9 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
    uint64_t v10 = [v11 notificationName];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  [v8 removeObject:v11];
  [v8 addObject:v11];
}

- (void)_registerForNotificationName:(id)a3
{
  name = (__CFString *)a3;
  id v4 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
  v5 = [v4 objectForKeyedSubscript:name];

  if (!v5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, name, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_unregisterForNotificationNameIfNeeded:(id)a3
{
  name = (__CFString *)a3;
  id v4 = [(NTKDarwinNotificationCenter *)self observersByNotificationName];
  v5 = [v4 objectForKeyedSubscript:name];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, name, 0);
  }
}

- (NSMutableDictionary)observersByNotificationName
{
  return self->_observersByNotificationName;
}

- (void)setObserversByNotificationName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end