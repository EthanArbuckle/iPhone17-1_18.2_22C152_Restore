@interface NIRecentlyObservedObjectsCache
- (NIRecentlyObservedObjectsCache)init;
- (id)getMostRecentObjectsWithMaxAge:(double)a3;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didUpdateNearbyObjects:(id)a3;
@end

@implementation NIRecentlyObservedObjectsCache

- (NIRecentlyObservedObjectsCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)NIRecentlyObservedObjectsCache;
  v2 = [(NIRecentlyObservedObjectsCache *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    recentDevices = v3->_recentDevices;
    v3->_recentDevices = v4;

    v6 = v3;
  }

  return v3;
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        recentDevices = self->_recentDevices;
        v11 = [v9 discoveryToken:v12];
        [(NSMutableDictionary *)recentDevices setObject:v9 forKeyedSubscript:v11];
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v3 = a3;
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#recent-obj-cache,Discovered device: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)getMostRecentObjectsWithMaxAge:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_opt_new();
  double v7 = sub_100006C38();
  recentDevices = self->_recentDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003019B0;
  v13[3] = &unk_100859428;
  double v15 = v7;
  double v16 = a3;
  id v9 = v6;
  id v14 = v9;
  [(NSMutableDictionary *)recentDevices enumerateKeysAndObjectsUsingBlock:v13];
  v10 = [v9 sortedArrayUsingComparator:&stru_100860AC8];
  v11 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v18 = a3;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#recent-obj-cache,Most recent objects under age %0.2f seconds: %@", buf, 0x16u);
  }

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void).cxx_destruct
{
}

@end