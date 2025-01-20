@interface PXCloudQuotaPremiumOfferProvider
+ (PXCloudQuotaPremiumOfferProvider)currentPremiumOfferProvider;
- (ICQPremiumOffer)premiumOffer;
- (PXCloudQuotaPremiumOfferProvider)init;
- (void)_currentPremiumOfferChangedNotification:(id)a3;
- (void)_queue_getCurrentPremiumOffer;
- (void)_queue_initialSetup;
- (void)_updateCurrentPremiumOffer:(id)a3;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)setPremiumOffer:(id)a3;
@end

@implementation PXCloudQuotaPremiumOfferProvider

uint64_t __63__PXCloudQuotaPremiumOfferProvider__updateCurrentPremiumOffer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPremiumOffer:*(void *)(a1 + 32)];
}

- (ICQPremiumOffer)premiumOffer
{
  return self->_premiumOffer;
}

+ (PXCloudQuotaPremiumOfferProvider)currentPremiumOfferProvider
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&currentPremiumOfferProvider__lock);
  id WeakRetained = objc_loadWeakRetained(&currentPremiumOfferProvider__sharedPremiumOfferProvider);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v5 = PLUserStatusGetLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v10 = 138412546;
    id v11 = a1;
    __int16 v12 = 2048;
    id v13 = v4;
    v6 = "%@ Reusing existing premium offer provider: %p";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    id v4 = objc_alloc_init((Class)a1);
    objc_storeWeak(&currentPremiumOfferProvider__sharedPremiumOfferProvider, v4);
    v5 = PLUserStatusGetLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v10 = 138412546;
    id v11 = a1;
    __int16 v12 = 2048;
    id v13 = v4;
    v6 = "%@ Creating new premium offer provider: %p";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1A9AE7000, v7, v8, v6, (uint8_t *)&v10, 0x16u);
LABEL_7:

  os_unfair_lock_unlock((os_unfair_lock_t)&currentPremiumOfferProvider__lock);
  return (PXCloudQuotaPremiumOfferProvider *)v4;
}

- (PXCloudQuotaPremiumOfferProvider)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2048;
    __int16 v12 = self;
    id v4 = v10;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> init", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)PXCloudQuotaPremiumOfferProvider;
  v5 = [(PXCloudQuotaPremiumOfferProvider *)&v8 init];
  if (v5)
  {
    objc_initWeak((id *)buf, v5);
    objc_copyWeak(&v7, (id *)buf);
    px_dispatch_on_main_queue_when_idle_after_delay();
  }
  return 0;
}

void __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCurrentPremiumOffer:*(void *)(a1 + 32)];
}

- (void)_updateCurrentPremiumOffer:(id)a3
{
  id v5 = a3;
  if ([getICQTileViewClass() shouldShowForPremiumOffer:v5]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PXCloudQuotaPremiumOfferProvider__updateCurrentPremiumOffer___block_invoke;
  v9[3] = &unk_1E5DC8D40;
  __int16 v11 = self;
  SEL v12 = a2;
  id v10 = v7;
  id v8 = v7;
  [(PXCloudQuotaPremiumOfferProvider *)self performChanges:v9];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCloudQuotaPremiumOfferProvider;
  [(PXCloudQuotaPremiumOfferProvider *)&v3 performChanges:a3];
}

void __40__PXCloudQuotaPremiumOfferProvider_init__block_invoke(uint64_t a1)
{
  v2 = PXCloudQuotaOfferSerialQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXCloudQuotaPremiumOfferProvider_init__block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

- (void)setPremiumOffer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (ICQPremiumOffer *)a3;
  p_premiumOffer = &self->_premiumOffer;
  premiumOffer = self->_premiumOffer;
  if (premiumOffer != v5)
  {
    BOOL v8 = premiumOffer != 0;
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    PXCloudQuotaSendAnalyticsForOfferChange(v5 != 0, v8, v10);

    objc_storeStrong((id *)&self->_premiumOffer, a3);
    __int16 v11 = *p_premiumOffer;
    SEL v12 = PLUserStatusGetLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        v15 = *p_premiumOffer;
        id v16 = v14;
        v17 = PXCloudQuotaOfferDebugDescription(v15);
        int v19 = 138543874;
        id v20 = v14;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did set premium offer:%{public}@", (uint8_t *)&v19, 0x20u);
      }
    }
    else if (v13)
    {
      int v19 = 138543618;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2048;
      v22 = self;
      id v18 = v20;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did clear premium offer", (uint8_t *)&v19, 0x16u);
    }
    [(PXCloudQuotaPremiumOfferProvider *)self signalChange:1];
  }
}

- (void).cxx_destruct
{
}

- (void)_currentPremiumOfferChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    BOOL v13 = self;
    id v6 = v11;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Current premium offer did change notification", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v7 = PXCloudQuotaOfferSerialQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXCloudQuotaPremiumOfferProvider__currentPremiumOfferChangedNotification___block_invoke;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __76__PXCloudQuotaPremiumOfferProvider__currentPremiumOfferChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_getCurrentPremiumOffer");
}

- (void)_queue_initialSetup
{
  if (_queue_initialSetup_predicate_236237 != -1) {
    dispatch_once(&_queue_initialSetup_predicate_236237, &__block_literal_global_236238);
  }
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = getICQCurrentPremiumOfferChangedNotification();
  [v3 addObserver:self selector:sel__currentPremiumOfferChangedNotification_ name:v4 object:0];

  [(PXCloudQuotaPremiumOfferProvider *)self _queue_getCurrentPremiumOffer];
}

id __55__PXCloudQuotaPremiumOfferProvider__queue_initialSetup__block_invoke()
{
  getICQTileViewClass();
  getICQOfferManagerClass_236256();
  getICQCurrentPremiumOfferChangedNotification();
  return v0;
}

- (void)_queue_getCurrentPremiumOffer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2048;
    id v11 = self;
    id v4 = v9;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Will get current cloud premium offer", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v5 = [getICQOfferManagerClass_236256() sharedOfferManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke;
  v6[3] = &unk_1E5DC8D68;
  v6[4] = self;
  objc_copyWeak(&v7, (id *)buf);
  [v5 getPremiumOfferWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLUserStatusGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v5;
    BOOL v8 = PXCloudQuotaOfferDebugDescription(v3);
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did get current cloud premium offer:%{public}@", buf, 0x20u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke_34;
  v10[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v11 = v3;
  id v9 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v12);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    id v9 = self;
    id v4 = v7;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> dealloc", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXCloudQuotaPremiumOfferProvider;
  [(PXCloudQuotaPremiumOfferProvider *)&v5 dealloc];
}

void __40__PXCloudQuotaPremiumOfferProvider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_initialSetup");
}

@end