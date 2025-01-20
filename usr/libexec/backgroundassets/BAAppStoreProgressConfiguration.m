@interface BAAppStoreProgressConfiguration
+ (BOOL)supportsSecureCoding;
- (BAAppStoreProgressConfiguration)init;
- (BAAppStoreProgressConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleIdentifiers:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation BAAppStoreProgressConfiguration

- (BAAppStoreProgressConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)BAAppStoreProgressConfiguration;
  v2 = [(BAAppStoreProgressConfiguration *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    appBundleIdentifiers = v3->_appBundleIdentifiers;
    v3->_appBundleIdentifiers = (NSSet *)v4;

    id updateHandler = v3->_updateHandler;
    v3->_id updateHandler = 0;

    qos_class_t v7 = qos_class_self();
    uint64_t v8 = dispatch_get_global_queue(v7, 0);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    duplicateEventCache = v3->_duplicateEventCache;
    v3->_duplicateEventCache = (NSMutableDictionary *)v10;
  }
  return v3;
}

- (BAAppStoreProgressConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BAAppStoreProgressConfiguration;
  v5 = [(BAAppStoreProgressConfiguration *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"BA_AppBundleIdentifiers"];
    appBundleIdentifiers = v6->_appBundleIdentifiers;
    v6->_appBundleIdentifiers = (NSSet *)v9;

    uint64_t v11 = objc_opt_new();
    duplicateEventCache = v6->_duplicateEventCache;
    v6->_duplicateEventCache = (NSMutableDictionary *)v11;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_appBundleIdentifiers forKey:@"BA_AppBundleIdentifiers"];

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAppBundleIdentifiers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (NSSet *)[v4 copy];
  appBundleIdentifiers = self->_appBundleIdentifiers;
  self->_appBundleIdentifiers = v5;

  uint64_t v8 = +[NSMutableArray arrayWithCapacity:[(NSMutableDictionary *)self->_duplicateEventCache count]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)self->_duplicateEventCache allKeys];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (![(NSSet *)self->_appBundleIdentifiers containsObject:v14]) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(NSMutableDictionary *)self->_duplicateEventCache removeObjectsForKeys:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUpdateHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 copy];

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHandlerQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  os_unfair_lock_lock(&self->_lock);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateEventCache, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifiers, 0);
  objc_storeStrong(&self->_updateHandler, 0);

  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end