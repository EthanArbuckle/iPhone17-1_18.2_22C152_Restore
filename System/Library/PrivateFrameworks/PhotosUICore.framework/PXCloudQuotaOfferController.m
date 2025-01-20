@interface PXCloudQuotaOfferController
- (BOOL)dismissibleOffers;
- (PXCloudQuotaOfferController)init;
- (id)initForDismissibleOffers:(BOOL)a3;
- (id)presentingViewControllerForBannerView:(id)a3;
- (int64_t)_mockOfferLevel;
- (void)_updateInformationView;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXCloudQuotaOfferController

- (id)initForDismissibleOffers:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXCloudQuotaOfferController;
  v4 = [(PXCloudQuotaController *)&v11 init];
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
  {
    v4->_dismissibleOffers = a3;
    uint64_t v6 = +[PXCloudQuotaOfferProvider currentOfferProvider];
    id v7 = p_isa[3];
    p_isa[3] = (id)v6;

    [p_isa[3] registerChangeObserver:p_isa context:PXCloudQuotaOfferProviderObservationContext_111675];
    [p_isa _updateInformationView];
    v8 = +[PXCPLStatusSettings sharedInstance];
    [v8 addDeferredKeyObserver:p_isa];

    v9 = _SharedDefaults();
    [v9 addObserver:p_isa forKeyPath:@"PXCloudQuotaControllerOfferLevelMock" options:0 context:&PXCloudQuotaOfferControllerUserDefaultsContext];
  }
  return p_isa;
}

- (void)_updateInformationView
{
  v32[3] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXCloudQuotaOfferController *)self _mockOfferLevel];
  if (v3)
  {
    int64_t v4 = v3;
    if (v3 == 1)
    {
      v5 = PLUserStatusGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        id v6 = *(id *)&buf[4];
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Mock showing no information banner!", buf, 0x16u);
      }
      id v7 = 0;
    }
    else
    {
      v12 = PLUserStatusGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        id v13 = *(id *)&buf[4];
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Create mock information banner!", buf, 0x16u);
      }
      id v7 = [[PXCloudQuotaMockView alloc] initWithCloudQuotaFull:v4 == 3];
    }
  }
  else
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v8 = (void *)getICQBannerViewClass_softClass_111679;
    uint64_t v29 = getICQBannerViewClass_softClass_111679;
    if (!getICQBannerViewClass_softClass_111679)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getICQBannerViewClass_block_invoke_111680;
      v31 = (__CFString *)&unk_1E5DD2B08;
      v32[0] = &v26;
      __getICQBannerViewClass_block_invoke_111680((uint64_t)buf);
      v8 = (void *)v27[3];
    }
    v9 = v8;
    _Block_object_dispose(&v26, 8);
    BOOL v10 = [(PXCloudQuotaOfferController *)self dismissibleOffers];
    offerProvider = self->_offerProvider;
    if (v10) {
      [(PXCloudQuotaOfferProvider *)offerProvider dismissibleOffer];
    }
    else {
    v14 = [(PXCloudQuotaOfferProvider *)offerProvider offer];
    }
    if (v14)
    {
      v15 = PLUserStatusGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_opt_class();
        id v17 = v16;
        if ([(PXCloudQuotaOfferController *)self dismissibleOffers]) {
          v18 = @"dismissible";
        }
        else {
          v18 = @"non-dismissible";
        }
        v19 = PXCloudQuotaOfferDebugDescription(v14);
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        v31 = v18;
        LOWORD(v32[0]) = 2114;
        *(void *)((char *)v32 + 2) = v19;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Create information banner for %@ offer:%{public}@", buf, 0x2Au);
      }
      BOOL v20 = [(PXCloudQuotaOfferController *)self dismissibleOffers];
      id v21 = [v9 alloc];
      if (v20) {
        v22 = (void *)[v21 initWithDismissibleOffer:v14];
      }
      else {
        v22 = (void *)[v21 initWithOffer:v14];
      }
      v23 = v22;
      [v22 setDelegate:self];
      id v7 = [[PXCloudQuotaBannerView alloc] initWithBannerView:v23];
      unint64_t v24 = [v14 level] - 1;
      if (v24 > 2) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = qword_1AB35A430[v24];
      }
      [(PXCloudQuotaView *)v7 setOfferLevel:v25];
    }
    else
    {
      id v7 = 0;
    }
  }
  [(PXCloudQuotaController *)self setInformationView:v7];
}

- (BOOL)dismissibleOffers
{
  return self->_dismissibleOffers;
}

- (int64_t)_mockOfferLevel
{
  v2 = +[PXCPLStatusSettings sharedInstance];
  int64_t v3 = [v2 cloudQuotaOfferLevel];
  if (!v3)
  {
    int64_t v4 = _SharedDefaults();
    v5 = [v4 stringForKey:@"PXCloudQuotaControllerOfferLevelMock"];

    if ([v5 isEqualToString:@"no-offer"])
    {
      int64_t v3 = 1;
    }
    else if ([v5 isEqualToString:@"almost-full"])
    {
      int64_t v3 = 2;
    }
    else if ([v5 isEqualToString:@"full"])
    {
      int64_t v3 = 3;
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  id v6 = NSStringFromSelector(sel_cloudQuotaOfferLevel);
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(PXCloudQuotaOfferController *)self _updateInformationView];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PXCloudQuotaOfferControllerUserDefaultsContext)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PXCloudQuotaOfferController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCloudQuotaOfferController;
    -[PXCloudQuotaOfferController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __78__PXCloudQuotaOfferController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInformationView];
}

- (id)presentingViewControllerForBannerView:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 offer];
    int v7 = PXCloudQuotaOfferDebugDescription(v6);
    int v10 = 138543362;
    objc_super v11 = v7;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller for offer:%{public}@", (uint8_t *)&v10, 0xCu);
  }
  v8 = [(PXCloudQuotaController *)self presentingViewControllerForInformationView];

  return v8;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXCloudQuotaOfferProviderObservationContext_111675 == a5) {
    [(PXCloudQuotaOfferController *)self _updateInformationView];
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2048;
    int v10 = self;
    id v4 = v8;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> dealloc", buf, 0x16u);
  }
  id v5 = _SharedDefaults();
  [v5 removeObserver:self forKeyPath:@"PXCloudQuotaControllerOfferLevelMock" context:&PXCloudQuotaOfferControllerUserDefaultsContext];

  v6.receiver = self;
  v6.super_class = (Class)PXCloudQuotaOfferController;
  [(PXCloudQuotaOfferController *)&v6 dealloc];
}

- (PXCloudQuotaOfferController)init
{
  return (PXCloudQuotaOfferController *)[(PXCloudQuotaOfferController *)self initForDismissibleOffers:0];
}

@end