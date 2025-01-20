@interface REDonatedActionFilteredCache
- (REDonatedActionFilteredCache)init;
- (REDonatedActionFilteredCacheDelegate)delegate;
- (id)_keyForAction:(id)a3;
- (unint64_t)_queue_performedCountForDonation:(id)a3;
- (unint64_t)_queue_performedTodayCountForBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4;
- (void)_queue_incrementPerformedCountForDonation:(id)a3;
- (void)_queue_removeAllData;
- (void)_queue_removeDonation:(id)a3;
- (void)_queue_removeDonationsForBundleIdentifier:(id)a3;
- (void)_queue_storeDonation:(id)a3;
- (void)_refreshAllDonations:(id)a3;
- (void)dealloc;
- (void)donationActionStoreReceivedDonation:(id)a3 isNewDonation:(BOOL)a4;
- (void)donationActionStoreRemoveAllDonations;
- (void)donationActionStoreRemovedDonation:(id)a3;
- (void)donationActionStoreRemovedDonationsFor:(id)a3;
- (void)fetchAllUniqueActions:(id)a3 completion:(id)a4;
- (void)fetchCountForAction:(id)a3 usingBlock:(id)a4;
- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchFirstPerformedActionDate:(id)a3;
- (void)fetchPerformedCountForAction:(id)a3 usingBlock:(id)a4;
- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation REDonatedActionFilteredCache

- (REDonatedActionFilteredCache)init
{
  v18.receiver = self;
  v18.super_class = (Class)REDonatedActionFilteredCache;
  v2 = [(REDonatedActionFilteredCache *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    actions = v2->_actions;
    v2->_actions = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    countsByActionType = v2->_countsByActionType;
    v2->_countsByActionType = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    countPerformedTodayByActionType = v2->_countPerformedTodayByActionType;
    v2->_countPerformedTodayByActionType = (NSMapTable *)v7;

    v9 = +[RESingleton sharedInstance];
    uint64_t v10 = [v9 callbackQueue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    v12 = +[RESingleton sharedInstance];
    [v12 addObserver:v2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)REDonatedActionFilteredCacheReset, @"com.apple.relevanceengine.resetpredictedactions", 0, CFNotificationSuspensionBehaviorCoalesce);
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v2 selector:sel__refreshAllDonations_ name:@"REShowRecentDeveloperDonationsChangedNotification" object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    v16 = RESignificantTimeChangeNotification();
    [v15 addObserver:v2 selector:sel__refreshAllDonations_ name:v16 object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[RESingleton sharedInstance];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.relevanceengine.resetpredictedactions", 0);
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"REShowRecentDeveloperDonationsChangedNotification" object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = RESignificantTimeChangeNotification();
  [v6 removeObserver:self name:v7 object:0];

  v8.receiver = self;
  v8.super_class = (Class)REDonatedActionFilteredCache;
  [(REDonatedActionFilteredCache *)&v8 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (void)fetchAllUniqueActions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__REDonatedActionFilteredCache_fetchAllUniqueActions_completion___block_invoke;
    block[3] = &unk_2644BE298;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v7);
  }
}

uint64_t __65__REDonatedActionFilteredCache_fetchAllUniqueActions_completion___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1[4] + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v6), (void)v11);
        uint64_t v8 = a1[5];
        v9 = [v7 action];
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchCountForAction:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__REDonatedActionFilteredCache_fetchCountForAction_usingBlock___block_invoke;
    block[3] = &unk_2644BC570;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __63__REDonatedActionFilteredCache_fetchCountForAction_usingBlock___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _keyForAction:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v5];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [v2 uuids];
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [v4 count]);
}

- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[RESingleton sharedInstance];
  [v7 fetchDonationWithIdentifier:v6 completion:v5];
}

- (void)fetchPerformedCountForAction:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__REDonatedActionFilteredCache_fetchPerformedCountForAction_usingBlock___block_invoke;
    block[3] = &unk_2644BDA00;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

uint64_t __72__REDonatedActionFilteredCache_fetchPerformedCountForAction_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_performedCountForDonation:", *(void *)(a1 + 40));
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __113__REDonatedActionFilteredCache_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke;
    v12[3] = &unk_2644BFF38;
    id v14 = v9;
    v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    dispatch_async(queue, v12);
  }
}

uint64_t __113__REDonatedActionFilteredCache_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_performedTodayCountForBundleIdentifer:actionIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)fetchFirstPerformedActionDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__REDonatedActionFilteredCache_fetchFirstPerformedActionDate___block_invoke;
    v7[3] = &unk_2644BCCD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __62__REDonatedActionFilteredCache_fetchFirstPerformedActionDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 40));
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__REDonatedActionFilteredCache_reset__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__REDonatedActionFilteredCache_reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllData");
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 donatedActionFilteredCacheDonationRemoved];
}

- (void)donationActionStoreReceivedDonation:(id)a3 isNewDonation:(BOOL)a4
{
  queue = self->_queue;
  id v6 = a3;
  dispatch_assert_queue_V2(queue);
  [(REDonatedActionFilteredCache *)self _queue_storeDonation:v6];
}

- (void)donationActionStoreRemovedDonation:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(REDonatedActionFilteredCache *)self _queue_removeDonation:v5];
}

- (void)donationActionStoreRemovedDonationsFor:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(REDonatedActionFilteredCache *)self _queue_removeDonationsForBundleIdentifier:v5];
}

- (void)donationActionStoreRemoveAllDonations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(REDonatedActionFilteredCache *)self _queue_removeAllData];
}

- (void)_queue_removeAllData
{
  uint64_t v3 = (void *)MEMORY[0x223C31460](self, a2);
  [(NSMapTable *)self->_actions removeAllObjects];
  [(NSMapTable *)self->_countsByActionType removeAllObjects];
  [(NSMapTable *)self->_countPerformedTodayByActionType removeAllObjects];
  firstDonationDate = self->_firstDonationDate;
  self->_firstDonationDate = 0;
}

- (id)_keyForAction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  if ([v3 type] != 2 && (REShowRecentDeveloperDonations() & 1) == 0)
  {
    uint64_t v5 = [v3 bundleIdentifier];

    id v4 = (void *)v5;
  }
  if ([v3 type] == 1) {
    [v3 simplifiedActionTypeIdentifier];
  }
  else {
  id v6 = [v3 actionTypeIdentifier];
  }
  id v7 = -[_REActionKey initWithIdentifier:actionType:relevanceProvidersHash:]([_REActionKey alloc], "initWithIdentifier:actionType:relevanceProvidersHash:", v4, v6, [v3 relevanceProvidersHash]);

  return v7;
}

- (void)_queue_storeDonation:(id)a3
{
  id v16 = a3;
  if ([v16 type] == 1)
  {
    [(REDonatedActionFilteredCache *)self _queue_incrementPerformedCountForDonation:v16];
    id v4 = +[RESiriActionsDonationsWhitelist sharedInstance];
    uint64_t v5 = [v16 bundleIdentifier];
    id v6 = [v16 intentTypeName];
    char v7 = [v4 intentIsWhitelistedForBundleID:v5 andTypeName:v6];

    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_6:
    id v12 = [(REDonatedActionFilteredCache *)self _keyForAction:v16];
    id v13 = [(NSMapTable *)self->_actions objectForKey:v12];
    if (v13)
    {
      id v14 = v13;
      [(_REActionValue *)v13 addAction:v16];
      unint64_t v15 = [(REDonatedActionFilteredCache *)self delegate];
      [v15 donatedActionFilteredCacheCountDidChange];
    }
    else
    {
      id v14 = [[_REActionValue alloc] initWithAction:v16];
      [(NSMapTable *)self->_actions setObject:v14 forKey:v12];
      unint64_t v15 = [(REDonatedActionFilteredCache *)self delegate];
      [v15 donatedActionFilteredCacheDidAddDonation:v16];
    }

    goto LABEL_10;
  }
  if ([v16 type]) {
    goto LABEL_6;
  }
  [(REDonatedActionFilteredCache *)self _queue_incrementPerformedCountForDonation:v16];
  id v8 = +[RESiriActionsDonationsWhitelist sharedInstance];
  id v9 = [v16 bundleIdentifier];
  id v10 = [v16 activityType];
  int v11 = [v8 userActivityIsWhitelistedForBundleID:v9 andActivityType:v10];

  if (v11) {
    goto LABEL_6;
  }
LABEL_10:
}

- (void)_queue_removeDonation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"uuid"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_actions;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      int v11 = -[NSMapTable objectForKey:](self->_actions, "objectForKey:", v10, (void)v18);
      id v12 = [v11 uuids];
      char v13 = [v12 containsObject:v4];

      if (v13) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (!v11) {
      goto LABEL_13;
    }
    [v11 removeActionWithUUID:v4];
    unint64_t v15 = [v11 uuids];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      v17 = [(REDonatedActionFilteredCache *)self delegate];
      [v17 donatedActionFilteredCacheCountDidChange];
    }
    else
    {
      [(NSMapTable *)self->_actions removeObjectForKey:v14];
      v17 = [(REDonatedActionFilteredCache *)self delegate];
      [v17 donatedActionFilteredCacheDonationRemoved];
    }
  }
  else
  {
LABEL_9:

    id v14 = 0;
LABEL_13:
    int v11 = RELogForDomain(14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[REDonatedActionFilteredCache _queue_removeDonation:]((uint64_t)v4, v11);
    }
  }
}

- (void)_queue_removeDonationsForBundleIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v17 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_actions;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
      id v10 = [(NSMapTable *)self->_actions objectForKey:v9];
      int v11 = [v10 action];
      id v12 = [v11 bundleIdentifier];
      char v13 = [v17 isEqualToString:v12];

      if (v13) {
        break;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v9;

    if (!v10) {
      goto LABEL_14;
    }
    unint64_t v15 = RELogForDomain(14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(REDonatedActionFilteredCache *)v10 _queue_removeDonationsForBundleIdentifier:v15];
    }

    [(NSMapTable *)self->_actions removeObjectForKey:v14];
    uint64_t v16 = [(REDonatedActionFilteredCache *)self delegate];
    [v16 donatedActionFilteredCacheDonationRemoved];
  }
  else
  {
LABEL_9:

    id v14 = 0;
LABEL_14:
    id v10 = RELogForDomain(14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[REDonatedActionFilteredCache _queue_removeDonationsForBundleIdentifier:]((uint64_t)v17, v10);
    }
  }
}

- (unint64_t)_queue_performedTodayCountForBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = [v6 numberWithUnsignedLongLong:a4];
  uint64_t v9 = +[_REPerformedActionKey keyForBundleIdentifier:v7 identifier:v8];

  id v10 = [(NSMapTable *)self->_countPerformedTodayByActionType objectForKey:v9];
  unint64_t v11 = [v10 unsignedIntegerValue];

  return v11;
}

- (unint64_t)_queue_performedCountForDonation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 simplifiedActionTypeIdentifier];
  if (v5)
  {
    uint64_t v6 = [v4 bundleIdentifier];
    id v7 = +[_REPerformedActionKey keyForBundleIdentifier:v6 identifier:v5];

    uint64_t v8 = [(NSMapTable *)self->_countsByActionType objectForKey:v7];
    unint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)_queue_incrementPerformedCountForDonation:(id)a3
{
  id v23 = a3;
  id v4 = [v23 simplifiedActionTypeIdentifier];
  if (v4)
  {
    uint64_t v5 = [v23 bundleIdentifier];
    uint64_t v6 = +[_REPerformedActionKey keyForBundleIdentifier:v5 identifier:v4];

    id v7 = [v23 creationDate];
    firstDonationDate = self->_firstDonationDate;
    if (firstDonationDate)
    {
      unint64_t v9 = [(NSDate *)firstDonationDate earlierDate:v7];
    }
    else
    {
      unint64_t v9 = v7;
    }
    id v10 = self->_firstDonationDate;
    self->_firstDonationDate = v9;

    unint64_t v11 = [(NSMapTable *)self->_countsByActionType objectForKey:v6];
    uint64_t v12 = [v11 unsignedIntegerValue];

    countsByActionType = self->_countsByActionType;
    id v14 = [NSNumber numberWithUnsignedInteger:v12 + 1];
    [(NSMapTable *)countsByActionType setObject:v14 forKey:v6];

    if (REDateOccursToday(v7))
    {
      unint64_t v15 = [v23 bundleIdentifier];
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "re_actionIdentifierHashValue"));
      id v17 = +[_REPerformedActionKey keyForBundleIdentifier:v15 identifier:v16];

      long long v18 = [(NSMapTable *)self->_countPerformedTodayByActionType objectForKey:v17];
      uint64_t v19 = [v18 unsignedIntegerValue];

      countPerformedTodayByActionType = self->_countPerformedTodayByActionType;
      long long v21 = [NSNumber numberWithUnsignedInteger:v19 + 1];
      [(NSMapTable *)countPerformedTodayByActionType setObject:v21 forKey:v17];
    }
    v22 = [(REDonatedActionFilteredCache *)self delegate];
    [v22 donatedActionFilteredCacheCountDidChange];
  }
}

- (void)_refreshAllDonations:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RELogForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138543362;
    char v13 = v6;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received.", buf, 0xCu);
  }
  id v7 = [v4 name];
  char v8 = [@"REShowRecentDeveloperDonationsChangedNotification" isEqualToString:v7];

  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__REDonatedActionFilteredCache__refreshAllDonations___block_invoke;
  v10[3] = &unk_2644BCFC8;
  v10[4] = self;
  char v11 = v8;
  dispatch_async(queue, v10);
}

void __53__REDonatedActionFilteredCache__refreshAllDonations___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllData");
  id v2 = +[RESingleton sharedInstance];
  [v2 triggerDistributeAllDonatedActions:*(unsigned __int8 *)(a1 + 40)];
}

- (REDonatedActionFilteredCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REDonatedActionFilteredCacheDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_firstDonationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_countPerformedTodayByActionType, 0);
  objc_storeStrong((id *)&self->_countsByActionType, 0);
}

- (void)_queue_removeDonation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "filtered action cache didn't contain action value with uuid: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_removeDonationsForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Attempted to remove %{public}@ actions, but none were found in filtered action cache.", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_removeDonationsForBundleIdentifier:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 uuids];
  int v6 = 134218242;
  uint64_t v7 = [v5 count];
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21E6E6000, a3, OS_LOG_TYPE_ERROR, "Remove %lu actions for %{public}@.", (uint8_t *)&v6, 0x16u);
}

@end