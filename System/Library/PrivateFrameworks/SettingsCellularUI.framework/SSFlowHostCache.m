@interface SSFlowHostCache
+ (id)sharedInstance;
- (SSFlowHostCache)init;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SSFlowHostCache

+ (id)sharedInstance
{
  if (qword_26AC32238 != -1) {
    dispatch_once(&qword_26AC32238, &__block_literal_global_4);
  }
  v2 = (void *)_MergedGlobals_57;
  return v2;
}

uint64_t __33__SSFlowHostCache_sharedInstance__block_invoke()
{
  _MergedGlobals_57 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (SSFlowHostCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSFlowHostCache;
  v2 = [(SSFlowHostCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_super v6 = [(NSMutableDictionary *)self->_dict objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_dict removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_dict setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end