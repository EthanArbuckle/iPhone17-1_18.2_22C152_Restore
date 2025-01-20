@interface PXCloudQuotaPremiumOfferController
- (BOOL)tileView:(id)a3 performAction:(int64_t)a4 parameters:(id)a5;
- (PXCloudQuotaPremiumOfferController)init;
- (id)presentingViewControllerForTileView:(id)a3;
- (void)_updateInformationView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXCloudQuotaPremiumOfferController

- (PXCloudQuotaPremiumOfferController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXCloudQuotaPremiumOfferController;
  v2 = [(PXCloudQuotaController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PXCloudQuotaPremiumOfferProvider currentPremiumOfferProvider];
    premiumOfferProvider = v2->_premiumOfferProvider;
    v2->_premiumOfferProvider = (PXCloudQuotaPremiumOfferProvider *)v3;

    [(PXCloudQuotaPremiumOfferProvider *)v2->_premiumOfferProvider registerChangeObserver:v2 context:PXCloudQuotaOfferProviderObservationContext_42935];
    [(PXCloudQuotaPremiumOfferController *)v2 _updateInformationView];
  }
  return v2;
}

- (void)_updateInformationView
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXCloudQuotaPremiumOfferProvider *)self->_premiumOfferProvider premiumOffer];
  if (v3)
  {
    v4 = PLUserStatusGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_opt_class();
      id v6 = v5;
      v7 = PXCloudQuotaOfferDebugDescription(v3);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v18 = v7;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Create view for premium offer:%{public}@", buf, 0x20u);
    }
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v8 = (void *)getICQTileViewClass_softClass;
    uint64_t v16 = getICQTileViewClass_softClass;
    if (!getICQTileViewClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getICQTileViewClass_block_invoke;
      v18 = &unk_1E5DD2B08;
      v19 = &v13;
      __getICQTileViewClass_block_invoke((uint64_t)buf);
      v8 = (void *)v14[3];
    }
    v9 = v8;
    _Block_object_dispose(&v13, 8);
    id v10 = [v9 alloc];
    v11 = objc_msgSend(v10, "initWithPremiumOffer:", v3, v13);
    [v11 setDelegate:self];
    v12 = [[PXCloudQuotaTileView alloc] initWithTileView:v11];
  }
  else
  {
    v12 = 0;
  }
  [(PXCloudQuotaController *)self setInformationView:v12];
}

- (void).cxx_destruct
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXCloudQuotaOfferProviderObservationContext_42935 == a5) {
    [(PXCloudQuotaPremiumOfferController *)self _updateInformationView];
  }
}

- (BOOL)tileView:(id)a3 performAction:(int64_t)a4 parameters:(id)a5
{
  return 0;
}

- (id)presentingViewControllerForTileView:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLUserStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 offer];
    v7 = PXCloudQuotaOfferDebugDescription(v6);
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller for premium offer:%{public}@", (uint8_t *)&v10, 0xCu);
  }
  v8 = [(PXCloudQuotaController *)self presentingViewControllerForInformationView];

  return v8;
}

@end