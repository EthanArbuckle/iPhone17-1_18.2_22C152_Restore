@interface PXCloudQuotaOfferProvider
+ (PXCloudQuotaOfferProvider)currentOfferProvider;
- (ICQOffer)dismissibleOffer;
- (ICQOffer)offer;
- (PXCloudQuotaOfferProvider)init;
- (void)_currentOfferChangedNotification:(id)a3;
- (void)_queue_getCurrentOffer;
- (void)_queue_initialSetup;
- (void)_updateCurrentOffer:(id)a3;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)setDismissibleOffer:(id)a3;
- (void)setOffer:(id)a3;
@end

@implementation PXCloudQuotaOfferProvider

+ (PXCloudQuotaOfferProvider)currentOfferProvider
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&currentOfferProvider__lock);
  id WeakRetained = objc_loadWeakRetained(&currentOfferProvider__sharedOfferProvider);
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
    v6 = "%@ Reusing existing offer provider: %p";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    id v4 = objc_alloc_init((Class)a1);
    objc_storeWeak(&currentOfferProvider__sharedOfferProvider, v4);
    v5 = PLUserStatusGetLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v10 = 138412546;
    id v11 = a1;
    __int16 v12 = 2048;
    id v13 = v4;
    v6 = "%@ Creating new offer provider: %p";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1A9AE7000, v7, v8, v6, (uint8_t *)&v10, 0x16u);
LABEL_7:

  os_unfair_lock_unlock((os_unfair_lock_t)&currentOfferProvider__lock);
  return (PXCloudQuotaOfferProvider *)v4;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (PXCloudQuotaOfferProvider)init
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
  v8.super_class = (Class)PXCloudQuotaOfferProvider;
  v5 = [(PXCloudQuotaOfferProvider *)&v8 init];
  if (v5)
  {
    objc_initWeak((id *)buf, v5);
    objc_copyWeak(&v7, (id *)buf);
    px_dispatch_on_main_queue_when_idle_after_delay();
  }
  return 0;
}

- (ICQOffer)dismissibleOffer
{
  return self->_dismissibleOffer;
}

void __33__PXCloudQuotaOfferProvider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_initialSetup");
}

- (void)_queue_initialSetup
{
  if (_queue_initialSetup_predicate != -1) {
    dispatch_once(&_queue_initialSetup_predicate, &__block_literal_global_88679);
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = getICQCurrentOfferChangedNotification();
  [v3 addObserver:self selector:sel__currentOfferChangedNotification_ name:v4 object:0];

  [(PXCloudQuotaOfferProvider *)self _queue_getCurrentOffer];
}

void __33__PXCloudQuotaOfferProvider_init__block_invoke(uint64_t a1)
{
  v2 = PXCloudQuotaOfferSerialQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXCloudQuotaOfferProvider_init__block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

id __48__PXCloudQuotaOfferProvider__queue_initialSetup__block_invoke()
{
  getICQBannerViewClass();
  getICQOfferManagerClass();
  getICQCurrentOfferChangedNotification();
  return v0;
}

void __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCurrentOffer:*(void *)(a1 + 32)];
}

- (void)_updateCurrentOffer:(id)a3
{
  id v4 = a3;
  id ICQBannerViewClass = getICQBannerViewClass();
  if ([ICQBannerViewClass shouldShowForOffer:v4]) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  if ([ICQBannerViewClass shouldShowForDismissibleOffer:v4]) {
    objc_super v8 = v4;
  }
  else {
    objc_super v8 = 0;
  }
  id v9 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__PXCloudQuotaOfferProvider__updateCurrentOffer___block_invoke;
  v12[3] = &unk_1E5DB84A8;
  id v13 = v7;
  id v14 = v9;
  id v10 = v9;
  id v11 = v7;
  [(PXCloudQuotaOfferProvider *)self performChanges:v12];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCloudQuotaOfferProvider;
  [(PXCloudQuotaOfferProvider *)&v3 performChanges:a3];
}

void __49__PXCloudQuotaOfferProvider__updateCurrentOffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setOffer:v3];
  [v4 setDismissibleOffer:*(void *)(a1 + 40)];
}

- (void)setOffer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = (ICQOffer *)a3;
  p_offer = &self->_offer;
  offer = self->_offer;
  if (offer != v5)
  {
    BOOL v8 = offer != 0;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    PXCloudQuotaSendAnalyticsForOfferChange(v5 != 0, v8, v10);

    objc_storeStrong((id *)&self->_offer, a3);
    id v11 = *p_offer;
    __int16 v12 = PLUserStatusGetLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        id v14 = objc_opt_class();
        v15 = *p_offer;
        id v16 = v14;
        v17 = PXCloudQuotaOfferDebugDescription(v15);
        int v19 = 138543874;
        id v20 = v14;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did set offer:%{public}@", (uint8_t *)&v19, 0x20u);
      }
    }
    else if (v13)
    {
      int v19 = 138543618;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2048;
      v22 = self;
      id v18 = v20;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did clear offer", (uint8_t *)&v19, 0x16u);
    }
    [(PXCloudQuotaOfferProvider *)self signalChange:1];
  }
}

- (void)setDismissibleOffer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (ICQOffer *)a3;
  if (self->_dismissibleOffer != v5)
  {
    objc_storeStrong((id *)&self->_dismissibleOffer, a3);
    dismissibleOffer = self->_dismissibleOffer;
    id v7 = PLUserStatusGetLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (dismissibleOffer)
    {
      if (v8)
      {
        id v9 = objc_opt_class();
        offer = self->_offer;
        id v11 = v9;
        __int16 v12 = PXCloudQuotaOfferDebugDescription(offer);
        int v14 = 138543874;
        id v15 = v9;
        __int16 v16 = 2048;
        v17 = self;
        __int16 v18 = 2114;
        int v19 = v12;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did set dismissible offer:%{public}@", (uint8_t *)&v14, 0x20u);
      }
    }
    else if (v8)
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2048;
      v17 = self;
      id v13 = v15;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did clear dismissible offer", (uint8_t *)&v14, 0x16u);
    }
    [(PXCloudQuotaOfferProvider *)self signalChange:2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissibleOffer, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)_currentOfferChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLUserStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    id v13 = self;
    id v6 = v11;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Current offer did change notification", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v7 = PXCloudQuotaOfferSerialQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXCloudQuotaOfferProvider__currentOfferChangedNotification___block_invoke;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __62__PXCloudQuotaOfferProvider__currentOfferChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_getCurrentOffer");
}

- (void)_queue_getCurrentOffer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2048;
    id v11 = self;
    id v4 = v9;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Will get current cloud offer", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v5 = [getICQOfferManagerClass() sharedOfferManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke;
  v6[3] = &unk_1E5DB84D0;
  v6[4] = self;
  objc_copyWeak(&v7, (id *)buf);
  [v5 getOfferWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLUserStatusGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v5;
    BOOL v8 = PXCloudQuotaOfferDebugDescription(v3);
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    __int16 v18 = v8;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did get current cloud offer:%{public}@", buf, 0x20u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke_34;
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
  v5.super_class = (Class)PXCloudQuotaOfferProvider;
  [(PXCloudQuotaOfferProvider *)&v5 dealloc];
}

@end