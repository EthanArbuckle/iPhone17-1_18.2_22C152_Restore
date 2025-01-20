@interface KTKVSSoftStore
+ (id)sharedStore;
- (BOOL)storeReady;
- (KTKVSProtocol)store;
- (KTKVSSoftStore)initWithStore:(id)a3;
- (NSString)accountMetricID;
- (id)objectForKey:(id)a3;
- (os_unfair_lock_s)lock;
- (void)forceSync:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation KTKVSSoftStore

- (KTKVSSoftStore)initWithStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTKVSSoftStore;
  v6 = [(KTKVSSoftStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(KTKVSSoftStore *)v6 setLock:0];
    objc_storeStrong((id *)&v7->_internalStore, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)sharedStore
{
  if (qword_10032F0D8 != -1) {
    dispatch_once(&qword_10032F0D8, &stru_1002C6570);
  }
  v2 = (void *)qword_10032F0D0;

  return v2;
}

- (KTKVSProtocol)store
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  internalStore = self->_internalStore;
  p_internalStore = &self->_internalStore;
  v6 = internalStore;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    v6 = +[KTKVSStore strictStore];
    if (v6)
    {
      os_unfair_lock_lock(p_lock);
      objc_storeStrong((id *)p_internalStore, v6);
      os_unfair_lock_unlock(p_lock);
    }
  }

  return v6;
}

- (void)setStore:(id)a3
{
  v4 = (KTKVSProtocol *)a3;
  os_unfair_lock_lock(&self->_lock);
  internalStore = self->_internalStore;
  self->_internalStore = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)accountMetricID
{
  v2 = [(KTKVSSoftStore *)self store];
  v3 = [v2 accountMetricID];

  return (NSString *)v3;
}

- (void)forceSync:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = [(KTKVSSoftStore *)self store];
  v6 = v5;
  if (v5)
  {
    [v5 forceSync:v4];
  }
  else
  {
    if (qword_10032F0B0 != -1) {
      dispatch_once(&qword_10032F0B0, &stru_1002C6590);
    }
    v7 = qword_10032F0B8;
    if (os_log_type_enabled((os_log_t)qword_10032F0B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "ForceSyncKVS because it happened before first unlock", v9, 2u);
    }
    v8 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-328 description:@"no KVS store yet"];
    v4[2](v4, v8);
  }
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(KTKVSSoftStore *)self store];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(KTKVSSoftStore *)self store];
  [v5 removeObjectForKey:v4];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KTKVSSoftStore *)self store];
  [v8 setObject:v7 forKey:v6];
}

- (BOOL)storeReady
{
  v2 = [(KTKVSSoftStore *)self store];
  unsigned __int8 v3 = [v2 storeReady];

  return v3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end