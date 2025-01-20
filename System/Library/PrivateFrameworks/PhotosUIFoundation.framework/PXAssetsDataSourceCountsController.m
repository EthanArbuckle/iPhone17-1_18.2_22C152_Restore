@interface PXAssetsDataSourceCountsController
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)counts;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)guestCounts;
- (BOOL)hasUsableCounts;
- (BOOL)isPreparingAssetTypeCounts;
- (BOOL)waitingToPrepare;
- (PXAssetsDataSourceCountsController)init;
- (PXAssetsDataSourceCountsController)initWithAssetsDataSourceManager:(id)a3;
- (PXAssetsDataSourceManager)assetsDataSourceManager;
- (void)_dataSourceManagerDidChange;
- (void)_handlePreparationCompletion;
- (void)_prepareCounts;
- (void)_prepareDataSource:(id)a3;
- (void)_updateCounts;
- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareCountsIfNeeded;
- (void)setCounts:(id *)a3;
- (void)setGuestCounts:(id *)a3;
- (void)setHasUsableCounts:(BOOL)a3;
- (void)setIsPreparingAssetTypeCounts:(BOOL)a3;
- (void)setWaitingToPrepare:(BOOL)a3;
@end

@implementation PXAssetsDataSourceCountsController

- (void)_prepareCounts
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PXAssetsDataSourceCountsController *)self isPreparingAssetTypeCounts];
  BOOL v4 = [(PXAssetsDataSourceCountsController *)self hasUsableCounts];
  BOOL v5 = v4;
  if (v3 || v4)
  {
    v6 = PFAssetsDataSourceCountsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = objc_opt_class();
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 1024;
      int v32 = v3;
      __int16 v33 = 1024;
      BOOL v34 = v5;
      _os_log_impl(&dword_259CDA000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Skipping Prepare (preparing:%d || usable:%d)", buf, 0x22u);
    }
  }
  else
  {
    v6 = [(PXAssetsDataSourceCountsController *)self assetsDataSourceManager];
    v7 = [v6 dataSource];
    int v8 = [v6 isBackgroundFetching];
    int v9 = [v7 areAllSectionsConsideredAccurate];
    v10 = PFAssetsDataSourceCountsGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v8 & 1) != 0 || !v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138544130;
        uint64_t v28 = objc_opt_class();
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 1024;
        int v32 = v8;
        __int16 v33 = 1024;
        BOOL v34 = v9;
        _os_log_impl(&dword_259CDA000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Skipping Prepare (fetching:%d || !accurate:%d)", buf, 0x22u);
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = objc_opt_class();
        __int16 v29 = 2048;
        v30 = self;
        _os_log_impl(&dword_259CDA000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ⎡ Will Prepare Asset Type Counts", buf, 0x16u);
      }

      [(PXAssetsDataSourceCountsController *)self setIsPreparingAssetTypeCounts:1];
      v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v12 = [v7 numberOfSections];
      if (v12 >= 1)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        do
        {
          v25[0] = objc_msgSend(v7, "identifier", *(_OWORD *)&v21);
          v25[1] = v14;
          int64x2_t v26 = v21;
          v15 = [v7 assetsInSectionIndexPath:v25];
          if (v15) {
            [v10 addObject:v15];
          }

          ++v14;
        }
        while (v13 != v14);
      }
      objc_initWeak((id *)buf, self);
      prepareCountsQueue = self->_prepareCountsQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__PXAssetsDataSourceCountsController__prepareCounts__block_invoke;
      block[3] = &unk_26545ADA0;
      objc_copyWeak(&v24, (id *)buf);
      id v23 = v7;
      dispatch_async(prepareCountsQueue, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }

    BOOL v17 = [(PXAssetsDataSourceCountsController *)self isPreparingAssetTypeCounts];
    BOOL v18 = [(PXAssetsDataSourceCountsController *)self hasUsableCounts];
    v19 = PFAssetsDataSourceCountsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)buf = 138544386;
      uint64_t v28 = v20;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 1024;
      int v32 = v17 || v18;
      __int16 v33 = 1024;
      BOOL v34 = v17;
      __int16 v35 = 1024;
      BOOL v36 = v18;
      _os_log_impl(&dword_259CDA000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Is Prepared:%d (preparing:%d || usable:%d)", buf, 0x28u);
    }

    [(PXAssetsDataSourceCountsController *)self setWaitingToPrepare:!v17 && !v18];
  }
}

- (BOOL)isPreparingAssetTypeCounts
{
  return self->_isPreparingAssetTypeCounts;
}

- (BOOL)hasUsableCounts
{
  return self->_hasUsableCounts;
}

- (void)setWaitingToPrepare:(BOOL)a3
{
  self->_waitingToPrepare = a3;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void)setIsPreparingAssetTypeCounts:(BOOL)a3
{
  self->_isPreparingAssetTypeCounts = a3;
}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v4 = PFAssetsDataSourceCountsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    int v8 = self;
    _os_log_impl(&dword_259CDA000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Received assetsDataSourceManagerDidFinishBackgroundFetching", (uint8_t *)&v5, 0x16u);
  }

  [(PXAssetsDataSourceCountsController *)self _dataSourceManagerDidChange];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if ((void *)AssetsDataSourceManagerObserverContext != a5)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXAssetsDataSourceCountsController.m" lineNumber:195 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (v6)
  {
    BOOL v11 = PFAssetsDataSourceCountsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_259CDA000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Received PXDataSourceManagerChangedDataSource", (uint8_t *)&v13, 0x16u);
    }

    [(PXAssetsDataSourceCountsController *)self _dataSourceManagerDidChange];
  }
}

- (void)_dataSourceManagerDidChange
{
  if ([(PXAssetsDataSourceCountsController *)self waitingToPrepare])
  {
    [(PXAssetsDataSourceCountsController *)self _prepareCounts];
  }
  else
  {
    [(PXAssetsDataSourceCountsController *)self _updateCounts];
  }
}

- (BOOL)waitingToPrepare
{
  return self->_waitingToPrepare;
}

- (void)prepareCountsIfNeeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = PFAssetsDataSourceCountsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    __int16 v7 = self;
    _os_log_impl(&dword_259CDA000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Prepare Counts If Needed", (uint8_t *)&v4, 0x16u);
  }

  [(PXAssetsDataSourceCountsController *)self _prepareCounts];
}

- (PXAssetsDataSourceCountsController)initWithAssetsDataSourceManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXAssetsDataSourceCountsController.m", 45, @"Invalid parameter not satisfying: %@", @"assetsDataSourceManager" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXAssetsDataSourceCountsController;
  __int16 v7 = [(PXObservable *)&v15 init];
  uint64_t v8 = (PXAssetsDataSourceCountsController *)v7;
  if (v7)
  {
    *((void *)v7 + 17) = 0x7FFFFFFFFFFFFFFFLL;
    *(_OWORD *)(v7 + 120) = PXDisplayAssetDetailedCountsUndefined;
    *((void *)v7 + 20) = 0x7FFFFFFFFFFFFFFFLL;
    *((_OWORD *)v7 + 9) = PXDisplayAssetDetailedCountsUndefined;
    objc_storeStrong((id *)v7 + 14, a3);
    [(PXAssetsDataSourceManager *)v8->_assetsDataSourceManager registerChangeObserver:v8 context:AssetsDataSourceManagerObserverContext];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.datasourcecountscontroller", v10);
    prepareCountsQueue = v8->_prepareCountsQueue;
    v8->_prepareCountsQueue = (OS_dispatch_queue *)v11;
  }
  return v8;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)counts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = ($C8986E5AD9146E03F7E851F39E835596)self[5];
  return self;
}

void __52__PXAssetsDataSourceCountsController__prepareCounts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _prepareDataSource:*(void *)(a1 + 32)];
}

- (void)_prepareDataSource:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  prepareCountsQueue = self->_prepareCountsQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(prepareCountsQueue);
  int v6 = [v5 getAssetCounts:0 guestAssetCounts:0 allowFetch:1];

  __int16 v7 = PFAssetsDataSourceCountsGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = @"NO";
    if (v6) {
      id v9 = @"YES";
    }
    v10 = v9;
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2112;
    BOOL v18 = v10;
    _os_log_impl(&dword_259CDA000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ⎜ Prepare Asset Type Counts success:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PXAssetsDataSourceCountsController__prepareDataSource___block_invoke;
  block[3] = &unk_26545BBD8;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __57__PXAssetsDataSourceCountsController__prepareDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePreparationCompletion];
}

void __51__PXAssetsDataSourceCountsController__updateCounts__block_invoke(uint64_t a1, void *a2)
{
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v3 = a2;
  [v3 setCounts:&v6];
  long long v4 = *(_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  [v3 setGuestCounts:&v4];
}

- (void)setHasUsableCounts:(BOOL)a3
{
  self->_hasUsableCounts = a3;
}

- (void)setGuestCounts:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_guestCounts = &self->_guestCounts;
  if (a3->var0 != self->_guestCounts.photosCount
    || a3->var1 != self->_guestCounts.videosCount
    || a3->var2 != self->_guestCounts.othersCount)
  {
    uint64_t v8 = PFAssetsDataSourceCountsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      unint64_t var0 = a3->var0;
      unint64_t var1 = a3->var1;
      unint64_t var2 = a3->var2;
      int v14 = 138544386;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = var0;
      __int16 v20 = 2048;
      unint64_t v21 = var1;
      __int16 v22 = 2048;
      unint64_t v23 = var2;
      _os_log_impl(&dword_259CDA000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> >>> Guest Counts (photos:%lu, videos:%lu, others:%lu)", (uint8_t *)&v14, 0x34u);
    }

    long long v13 = *(_OWORD *)&a3->var0;
    p_guestCounts->othersCount = a3->var2;
    *(_OWORD *)&p_guestCounts->photosCount = v13;
    [(PXObservable *)self signalChange:1];
  }
}

- (void)setCounts:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_counts = &self->_counts;
  if (a3->var0 != self->_counts.photosCount
    || a3->var1 != self->_counts.videosCount
    || a3->var2 != self->_counts.othersCount)
  {
    uint64_t v8 = PFAssetsDataSourceCountsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      unint64_t var0 = a3->var0;
      unint64_t var1 = a3->var1;
      unint64_t var2 = a3->var2;
      int v14 = 138544386;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = var0;
      __int16 v20 = 2048;
      unint64_t v21 = var1;
      __int16 v22 = 2048;
      unint64_t v23 = var2;
      _os_log_impl(&dword_259CDA000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> >>> Counts (photos:%lu, videos:%lu, others:%lu)", (uint8_t *)&v14, 0x34u);
    }

    long long v13 = *(_OWORD *)&a3->var0;
    p_counts->othersCount = a3->var2;
    *(_OWORD *)&p_counts->photosCount = v13;
    [(PXObservable *)self signalChange:1];
  }
}

- (void)_updateCounts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(PXAssetsDataSourceCountsController *)self hasUsableCounts])
  {
    id v3 = [(PXAssetsDataSourceCountsController *)self assetsDataSourceManager];
    long long v4 = [v3 dataSource];
    *(_OWORD *)buf = PXDisplayAssetDetailedCountsUndefined;
    *(void *)&buf[16] = 0x7FFFFFFFFFFFFFFFLL;
    long long v12 = PXDisplayAssetDetailedCountsUndefined;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if ([v4 getAssetCounts:buf guestAssetCounts:&v12 allowFetch:0])
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __51__PXAssetsDataSourceCountsController__updateCounts__block_invoke;
      v7[3] = &__block_descriptor_80_e53_v16__0___PXMutableAssetsDataSourceCountsController__8l;
      long long v8 = *(_OWORD *)buf;
      uint64_t v9 = *(void *)&buf[16];
      long long v10 = v12;
      uint64_t v11 = v13;
      [(PXObservable *)self performChanges:v7];
    }
    else
    {
      uint64_t v5 = PFAssetsDataSourceCountsGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = objc_opt_class();
        *(_DWORD *)int v14 = 138543618;
        uint64_t v15 = v6;
        __int16 v16 = 2048;
        __int16 v17 = self;
        _os_log_impl(&dword_259CDA000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Re-Prepare Counts", v14, 0x16u);
      }

      [(PXAssetsDataSourceCountsController *)self setHasUsableCounts:0];
      [(PXAssetsDataSourceCountsController *)self _prepareCounts];
    }
  }
  else
  {
    id v3 = PFAssetsDataSourceCountsGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_259CDA000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Skipping Update", buf, 0x16u);
    }
  }
}

- (void)_handlePreparationCompletion
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = PFAssetsDataSourceCountsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    uint64_t v7 = self;
    _os_log_impl(&dword_259CDA000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ⎣ Did Prepare Asset Type Counts", (uint8_t *)&v4, 0x16u);
  }

  [(PXAssetsDataSourceCountsController *)self setIsPreparingAssetTypeCounts:0];
  [(PXAssetsDataSourceCountsController *)self setHasUsableCounts:1];
  [(PXAssetsDataSourceCountsController *)self _updateCounts];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);

  objc_storeStrong((id *)&self->_prepareCountsQueue, 0);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)guestCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = ($C8986E5AD9146E03F7E851F39E835596)self[6];
  return self;
}

- (PXAssetsDataSourceCountsController)init
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsDataSourceCountsController.m", 41, @"%s is not available as initializer", "-[PXAssetsDataSourceCountsController init]");

  abort();
}

@end