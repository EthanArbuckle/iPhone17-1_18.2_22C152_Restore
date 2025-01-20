@interface ICQAppCloudStorageCache
+ (id)sharedInstance;
- (ICQAppCloudStorageCache)init;
- (id)cloudStorageByApp:(id)a3 forAltDSID:(id)a4;
- (void)setCloudStorage:(id)a3 byApp:(id)a4 forAltDSID:(id)a5;
@end

@implementation ICQAppCloudStorageCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_cache;
  return v2;
}

uint64_t __41__ICQAppCloudStorageCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ICQAppCloudStorageCache);
  uint64_t v1 = sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ICQAppCloudStorageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQAppCloudStorageCache;
  v2 = [(ICQAppCloudStorageCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hashMap = v2->_hashMap;
    v2->_hashMap = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setCloudStorage:(id)a3 byApp:(id)a4 forAltDSID:(id)a5
{
  id v14 = a5;
  p_cacheLock = &self->_cacheLock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  v11 = [(NSMutableDictionary *)self->_hashMap objectForKeyedSubscript:v14];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_hashMap setObject:v12 forKeyedSubscript:v14];
  }
  v13 = [(NSMutableDictionary *)self->_hashMap objectForKeyedSubscript:v14];
  [v13 setObject:v10 forKeyedSubscript:v9];

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)cloudStorageByApp:(id)a3 forAltDSID:(id)a4
{
  p_cacheLock = &self->_cacheLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  id v9 = [(NSMutableDictionary *)self->_hashMap objectForKeyedSubscript:v7];

  id v10 = [v9 objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(p_cacheLock);
  return v10;
}

- (void).cxx_destruct
{
}

@end