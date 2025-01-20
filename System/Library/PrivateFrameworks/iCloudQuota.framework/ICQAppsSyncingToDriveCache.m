@interface ICQAppsSyncingToDriveCache
+ (id)sharedInstance;
- (ICQAppsSyncingToDriveCache)init;
- (id)appsSyncingToDriveforAltDSID:(id)a3;
- (void)setAppsSyncingToDrive:(id)a3 forAltDSID:(id)a4;
@end

@implementation ICQAppsSyncingToDriveCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_cache_0;
  return v2;
}

uint64_t __44__ICQAppsSyncingToDriveCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ICQAppsSyncingToDriveCache);
  uint64_t v1 = sharedInstance_cache_0;
  sharedInstance_cache_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ICQAppsSyncingToDriveCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQAppsSyncingToDriveCache;
  v2 = [(ICQAppsSyncingToDriveCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hashMap = v2->_hashMap;
    v2->_hashMap = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setAppsSyncingToDrive:(id)a3 forAltDSID:(id)a4
{
  p_cacheLock = &self->_cacheLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  [(NSMutableDictionary *)self->_hashMap setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)appsSyncingToDriveforAltDSID:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  objc_super v6 = [(NSMutableDictionary *)self->_hashMap objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_cacheLock);
  return v6;
}

- (void).cxx_destruct
{
}

@end