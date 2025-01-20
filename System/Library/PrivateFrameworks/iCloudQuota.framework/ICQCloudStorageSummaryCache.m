@interface ICQCloudStorageSummaryCache
+ (id)sharedInstance;
- (BOOL)hasDisplayedDetailsPage;
- (ICQCloudStorageSummaryCache)init;
- (id)storageSummaryForAltDSID:(id)a3;
- (void)_cleanupCacheForPrimaryAccount;
- (void)_startObservingCloudSubscriptionFeaturesNotifications;
- (void)_startObservingQuotaChangeNotifications;
- (void)_stopObservingCloudSubscriptionFeaturesNotifications;
- (void)_stopObservingQuotaChangeNotifications;
- (void)dealloc;
- (void)setHasDisplayedDetailsPage:(BOOL)a3;
- (void)setStorageSummary:(id)a3 forAltDSID:(id)a4;
@end

@implementation ICQCloudStorageSummaryCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_cache_1;
  return v2;
}

uint64_t __45__ICQCloudStorageSummaryCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ICQCloudStorageSummaryCache);
  uint64_t v1 = sharedInstance_cache_1;
  sharedInstance_cache_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ICQCloudStorageSummaryCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQCloudStorageSummaryCache;
  v2 = [(ICQCloudStorageSummaryCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    summaryCache = v2->_summaryCache;
    v2->_summaryCache = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    [(ICQCloudStorageSummaryCache *)v2 _startObservingQuotaChangeNotifications];
    [(ICQCloudStorageSummaryCache *)v2 _startObservingCloudSubscriptionFeaturesNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(ICQCloudStorageSummaryCache *)self _stopObservingQuotaChangeNotifications];
  [(ICQCloudStorageSummaryCache *)self _stopObservingCloudSubscriptionFeaturesNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICQCloudStorageSummaryCache;
  [(ICQCloudStorageSummaryCache *)&v3 dealloc];
}

- (BOOL)hasDisplayedDetailsPage
{
  v2 = self;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  LOBYTE(v2) = v2->_hasDisplayedDetailsPage;
  os_unfair_lock_unlock(p_cacheLock);
  return (char)v2;
}

- (void)setHasDisplayedDetailsPage:(BOOL)a3
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  self->_hasDisplayedDetailsPage = a3;
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)setStorageSummary:(id)a3 forAltDSID:(id)a4
{
  p_cacheLock = &self->_cacheLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  [(NSMutableDictionary *)self->_summaryCache setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)storageSummaryForAltDSID:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  objc_super v6 = [(NSMutableDictionary *)self->_summaryCache objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_cacheLock);
  return v6;
}

- (void)_startObservingQuotaChangeNotifications
{
  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = [MEMORY[0x1E4F28F08] mainQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke;
    v13[3] = &unk_1E6A536B0;
    objc_copyWeak(&v14, &location);
    id v5 = [v3 addObserverForName:@"QuotaDidChange" object:0 queue:v4 usingBlock:v13];
    id quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_id quotaChangeNotificationObserver = v5;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = [MEMORY[0x1E4F28F08] mainQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke_8;
    v11[3] = &unk_1E6A536B0;
    objc_copyWeak(&v12, &location);
    v9 = [v7 addObserverForName:@"QuotaInformationChanged" object:0 queue:v8 usingBlock:v11];
    id quotaInfoChangeNotificationObserver = self->_quotaInfoChangeNotificationObserver;
    self->_id quotaInfoChangeNotificationObserver = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = @"QuotaDidChange";
    _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupCacheForPrimaryAccount];
}

void __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke_8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = @"QuotaInformationChanged";
    _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupCacheForPrimaryAccount];
}

- (void)_startObservingCloudSubscriptionFeaturesNotifications
{
  if (!self->_cloudSubscriptionFeaturesObserver)
  {
    objc_super v3 = [MEMORY[0x1E4F59BB8] registerForFeatureChangeNotificationsUsingBlock:&__block_literal_global_11_0];
    id cloudSubscriptionFeaturesObserver = self->_cloudSubscriptionFeaturesObserver;
    self->_id cloudSubscriptionFeaturesObserver = v3;
    MEMORY[0x1F41817F8](v3, cloudSubscriptionFeaturesObserver);
  }
}

void __84__ICQCloudStorageSummaryCache__startObservingCloudSubscriptionFeaturesNotifications__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = _ICQGetLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 138412290;
    objc_super v3 = @"QuotaDidChange";
    _os_log_impl(&dword_1D5851000, v0, OS_LOG_TYPE_DEFAULT, "Received CSF notification, posting QuotaDidChange notification named: %@", (uint8_t *)&v2, 0xCu);
  }

  uint64_t v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"QuotaDidChange" object:0];
}

- (void)_stopObservingQuotaChangeNotifications
{
  if (self->_quotaChangeNotificationObserver)
  {
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_quotaChangeNotificationObserver];

    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_quotaInfoChangeNotificationObserver];

    id quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_id quotaChangeNotificationObserver = 0;

    id quotaInfoChangeNotificationObserver = self->_quotaInfoChangeNotificationObserver;
    self->_id quotaInfoChangeNotificationObserver = 0;
  }
}

- (void)_stopObservingCloudSubscriptionFeaturesNotifications
{
  if (self->_cloudSubscriptionFeaturesObserver)
  {
    objc_msgSend(MEMORY[0x1E4F59BB8], "unregisterForFeatureChangeNotificationsUsingObserver:");
    id cloudSubscriptionFeaturesObserver = self->_cloudSubscriptionFeaturesObserver;
    self->_id cloudSubscriptionFeaturesObserver = 0;
  }
}

- (void)_cleanupCacheForPrimaryAccount
{
  objc_super v3 = [MEMORY[0x1E4F179C8] defaultStore];
  objc_msgSend(v3, "aa_primaryAppleAccount");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = objc_msgSend(v5, "aa_altDSID");
  if (v4)
  {
    os_unfair_lock_lock(&self->_cacheLock);
    [(NSMutableDictionary *)self->_summaryCache setObject:0 forKeyedSubscript:v4];
    os_unfair_lock_unlock(&self->_cacheLock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cloudSubscriptionFeaturesObserver, 0);
  objc_storeStrong(&self->_quotaInfoChangeNotificationObserver, 0);
  objc_storeStrong(&self->_quotaChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_summaryCache, 0);
}

@end