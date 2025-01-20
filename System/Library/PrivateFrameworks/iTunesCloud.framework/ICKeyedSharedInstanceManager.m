@interface ICKeyedSharedInstanceManager
- (ICKeyedSharedInstanceManager)initWithInstantiationHandler:(id)a3;
- (id)sharedInstanceForKey:(id)a3;
- (void)decrementUsageCountForKey:(id)a3;
- (void)incrementUsageCountForKey:(id)a3;
@end

@implementation ICKeyedSharedInstanceManager

- (id)sharedInstanceForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x1A6240990]();
  v6 = [(NSMutableDictionary *)self->_stronglyHeldSharedInstances objectForKey:v4];
  if (!v6)
  {
    v6 = [(NSMapTable *)self->_weaklyHeldSharedInstances objectForKey:v4];
    if (!v6)
    {
      v6 = (*((void (**)(void))self->_instantiationHandler + 2))();
      [(NSMapTable *)self->_weaklyHeldSharedInstances setObject:v6 forKey:v4];
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void)decrementUsageCountForKey:(id)a3
{
  id v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x1A6240990]();
  v6 = [(NSMutableDictionary *)self->_usageCounts objectForKey:v10];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 1)
  {
    v9 = [(NSMutableDictionary *)self->_stronglyHeldSharedInstances objectForKey:v10];
    [(NSMutableDictionary *)self->_stronglyHeldSharedInstances removeObjectForKey:v10];
    [(NSMapTable *)self->_weaklyHeldSharedInstances setObject:v9 forKey:v10];
    [(NSMutableDictionary *)self->_usageCounts removeObjectForKey:v10];
  }
  else
  {
    usageCounts = self->_usageCounts;
    v9 = [NSNumber numberWithUnsignedInteger:v7 - 1];
    [(NSMutableDictionary *)usageCounts setObject:v9 forKey:v10];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementUsageCountForKey:(id)a3
{
  id v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x1A6240990]();
  v6 = [(NSMutableDictionary *)self->_usageCounts objectForKey:v11];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7)
  {
    v8 = [(NSMapTable *)self->_weaklyHeldSharedInstances objectForKey:v11];
    [(NSMapTable *)self->_weaklyHeldSharedInstances removeObjectForKey:v11];
    [(NSMutableDictionary *)self->_stronglyHeldSharedInstances setObject:v8 forKey:v11];
  }
  usageCounts = self->_usageCounts;
  id v10 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [(NSMutableDictionary *)usageCounts setObject:v10 forKey:v11];

  os_unfair_lock_unlock(p_lock);
}

- (ICKeyedSharedInstanceManager)initWithInstantiationHandler:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICKeyedSharedInstanceManager;
  v5 = [(ICKeyedSharedInstanceManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    id instantiationHandler = v6->_instantiationHandler;
    v6->_id instantiationHandler = (id)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stronglyHeldSharedInstances = v6->_stronglyHeldSharedInstances;
    v6->_stronglyHeldSharedInstances = v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    weaklyHeldSharedInstances = v6->_weaklyHeldSharedInstances;
    v6->_weaklyHeldSharedInstances = (NSMapTable *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    usageCounts = v6->_usageCounts;
    v6->_usageCounts = v13;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageCounts, 0);
  objc_storeStrong((id *)&self->_weaklyHeldSharedInstances, 0);
  objc_storeStrong((id *)&self->_stronglyHeldSharedInstances, 0);

  objc_storeStrong(&self->_instantiationHandler, 0);
}

@end