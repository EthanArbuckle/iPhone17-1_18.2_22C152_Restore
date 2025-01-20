@interface ICQStoragePlanRecommendationCache
+ (id)sharedInstance;
- (ICQStoragePlanRecommendationCache)init;
- (id)extraQuotaNeeded;
- (void)setExtraQuotaNeeded:(id)a3 expiry:(id)a4;
@end

@implementation ICQStoragePlanRecommendationCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_recommendationCache;
  return v2;
}

uint64_t __51__ICQStoragePlanRecommendationCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ICQStoragePlanRecommendationCache);
  uint64_t v1 = sharedInstance_recommendationCache;
  sharedInstance_recommendationCache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ICQStoragePlanRecommendationCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICQStoragePlanRecommendationCache;
  result = [(ICQStoragePlanRecommendationCache *)&v3 init];
  if (result) {
    result->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setExtraQuotaNeeded:(id)a3 expiry:(id)a4
{
  v6 = (NSNumber *)a3;
  v7 = (NSDate *)a4;
  os_unfair_lock_lock(&self->_cacheLock);
  extraQuotaNeeded = self->_extraQuotaNeeded;
  self->_extraQuotaNeeded = v6;
  v9 = v6;

  expiry = self->_expiry;
  self->_expiry = v7;

  os_unfair_lock_unlock(&self->_cacheLock);
}

- (id)extraQuotaNeeded
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  expiry = self->_expiry;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [(NSDate *)expiry timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= 0.0) {
    v8 = 0;
  }
  else {
    v8 = self->_extraQuotaNeeded;
  }
  os_unfair_lock_unlock(p_cacheLock);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_extraQuotaNeeded, 0);
}

@end