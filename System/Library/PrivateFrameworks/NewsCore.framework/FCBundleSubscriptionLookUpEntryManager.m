@interface FCBundleSubscriptionLookUpEntryManager
- (FCBundleSubscriptionLookUpEntry)_bundleSubscriptionLookUpEntry;
- (FCBundleSubscriptionLookUpEntry)bundleSubscriptionLookUpEntry;
- (FCBundleSubscriptionLookUpEntryManager)initWithLocalStore:(id)a3;
- (FCKeyValueStore)localStore;
- (NFUnfairLock)lock;
- (id)_bundleSubscriptionLookupEntryForPurchaseID:(id)a3;
- (void)addBundleChannelIDs:(id)a3 bundleChannelIDsVersion:(id)a4 purchaseID:(id)a5 inTrialPeriod:(BOOL)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11;
- (void)cleanupStaleExpiredEntry;
- (void)loadLocalCachesFromStore;
- (void)setBundleSubscriptionLookUpEntry:(id)a3;
- (void)setLocalStore:(id)a3;
- (void)set_bundleSubscriptionLookUpEntry:(id)a3;
- (void)updateEntry:(id)a3;
@end

@implementation FCBundleSubscriptionLookUpEntryManager

- (FCBundleSubscriptionLookUpEntryManager)initWithLocalStore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCBundleSubscriptionLookUpEntryManager;
  v5 = [(FCBundleSubscriptionLookUpEntryManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v5->_lock;
    v5->_lock = (NFUnfairLock *)v6;

    [(FCBundleSubscriptionLookUpEntryManager *)v5 setLocalStore:v4];
    [(FCBundleSubscriptionLookUpEntryManager *)v5 loadLocalCachesFromStore];
  }

  return v5;
}

- (void)setLocalStore:(id)a3
{
}

- (void)loadLocalCachesFromStore
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(FCBundleSubscriptionLookUpEntryManager *)self localStore];
  id v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        v10 = [(FCBundleSubscriptionLookUpEntryManager *)self localStore];
        v11 = [v10 objectForKey:v9];
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
        }
        id v13 = v12;

        v14 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v21 = v13;
          _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_INFO, "Bundle subscription lookup entries loaded from cache, entries=%{public}@", buf, 0xCu);
        }
        if (v13 && [v9 hasPrefix:@"bd-"])
        {
          v15 = [[FCBundleSubscriptionLookUpEntry alloc] initWithEntryID:v9 dictionaryRepresentation:v13];
          if (v15) {
            [(FCBundleSubscriptionLookUpEntryManager *)self setBundleSubscriptionLookUpEntry:v15];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }
}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (FCBundleSubscriptionLookUpEntry)bundleSubscriptionLookUpEntry
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  id v12 = 0;
  v3 = [(FCBundleSubscriptionLookUpEntryManager *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__FCBundleSubscriptionLookUpEntryManager_bundleSubscriptionLookUpEntry__block_invoke;
  v6[3] = &unk_1E5B4C258;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithLockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (FCBundleSubscriptionLookUpEntry *)v4;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

uint64_t __71__FCBundleSubscriptionLookUpEntryManager_bundleSubscriptionLookUpEntry__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _bundleSubscriptionLookUpEntry];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (FCBundleSubscriptionLookUpEntry)_bundleSubscriptionLookUpEntry
{
  return self->__bundleSubscriptionLookUpEntry;
}

- (id)_bundleSubscriptionLookupEntryForPurchaseID:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"bd-", a3];
}

- (void)addBundleChannelIDs:(id)a3 bundleChannelIDsVersion:(id)a4 purchaseID:(id)a5 inTrialPeriod:(BOOL)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a10;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "purchaseID");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCBundleSubscriptionLookUpEntryManager addBundleChannelIDs:bundleChannelIDsVersion:purchaseID:inTrialPeriod:"
          "isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:]";
    __int16 v33 = 2080;
    v34 = "FCBundleSubscriptionLookUpEntryManager.m";
    __int16 v35 = 1024;
    int v36 = 77;
    __int16 v37 = 2114;
    v38 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelIDs");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCBundleSubscriptionLookUpEntryManager addBundleChannelIDs:bundleChannelIDsVersion:purchaseID:inTrialPeriod:"
          "isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:]";
    __int16 v33 = 2080;
    v34 = "FCBundleSubscriptionLookUpEntryManager.m";
    __int16 v35 = 1024;
    int v36 = 78;
    __int16 v37 = 2114;
    v38 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v21 = [(FCBundleSubscriptionLookUpEntryManager *)self _bundleSubscriptionLookupEntryForPurchaseID:v18];
  BYTE1(v29) = a11;
  LOBYTE(v29) = a9;
  BYTE2(v28) = a7;
  BYTE1(v28) = a6;
  LOBYTE(v28) = 0;
  v22 = -[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:]([FCBundleSubscriptionLookUpEntry alloc], "initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:", v21, v16, v17, v18, 0, 0, v28, v19, v29, v20);
  [(FCBundleSubscriptionLookUpEntryManager *)self setBundleSubscriptionLookUpEntry:v22];
  uint64_t v23 = [(FCBundleSubscriptionLookUpEntryManager *)self localStore];
  v24 = [(FCBundleSubscriptionLookUpEntry *)v22 dictionaryRepresentation];
  v25 = [(FCBundleSubscriptionLookUpEntry *)v22 identifier];
  [v23 setObject:v24 forKey:v25];
}

- (void)updateEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  [(FCBundleSubscriptionLookUpEntryManager *)self setBundleSubscriptionLookUpEntry:v5];

  id v8 = [(FCBundleSubscriptionLookUpEntryManager *)self localStore];
  uint64_t v6 = [v4 dictionaryRepresentation];
  uint64_t v7 = [v4 identifier];

  [v8 setObject:v6 forKey:v7];
}

- (void)cleanupStaleExpiredEntry
{
  id v10 = [(FCBundleSubscriptionLookUpEntryManager *)self bundleSubscriptionLookUpEntry];
  if ([v10 purchaseValidationState] == 1)
  {
    uint64_t v3 = [(FCBundleSubscriptionLookUpEntryManager *)self bundleSubscriptionLookUpEntry];
    id v4 = [v3 dateOfExpiration];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    char v6 = objc_msgSend(v4, "fc_isWithinTimeInterval:ofDate:", v5, 864000.0);

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(FCBundleSubscriptionLookUpEntryManager *)self localStore];
      id v8 = [(FCBundleSubscriptionLookUpEntryManager *)self bundleSubscriptionLookUpEntry];
      uint64_t v9 = [v8 identifier];
      [v7 removeObjectForKey:v9];

      [(FCBundleSubscriptionLookUpEntryManager *)self setBundleSubscriptionLookUpEntry:0];
    }
  }
  else
  {
  }
}

- (void)setBundleSubscriptionLookUpEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCBundleSubscriptionLookUpEntryManager *)self lock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__FCBundleSubscriptionLookUpEntryManager_setBundleSubscriptionLookUpEntry___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v7];
}

uint64_t __75__FCBundleSubscriptionLookUpEntryManager_setBundleSubscriptionLookUpEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_bundleSubscriptionLookUpEntry:", *(void *)(a1 + 40));
}

- (void)set_bundleSubscriptionLookUpEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->__bundleSubscriptionLookUpEntry, 0);
}

@end