@interface MTSingleton
+ (id)sharedInstance;
@end

@implementation MTSingleton

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_19);
  }
  v3 = NSStringFromClass((Class)a1);
  id v4 = (id)_instanceMap;
  objc_sync_enter(v4);
  v5 = [(id)_instanceMap objectForKey:v3];
  if (!v5)
  {
    v5 = objc_alloc_init(MTSingletonHolder);
    v5->_lock._os_unfair_lock_opaque = 0;
    [(id)_instanceMap setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  os_unfair_lock_lock(&v5->_lock);
  v6 = [(MTSingletonHolder *)v5 instance];
  if (!v6)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___MTSingleton;
    v6 = objc_msgSend(objc_msgSendSuper2(&v8, sel_allocWithZone_, 0), "init");
    [(MTSingletonHolder *)v5 setInstance:v6];
  }
  os_unfair_lock_unlock(&v5->_lock);

  return v6;
}

uint64_t __29__MTSingleton_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = _instanceMap;
  _instanceMap = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end