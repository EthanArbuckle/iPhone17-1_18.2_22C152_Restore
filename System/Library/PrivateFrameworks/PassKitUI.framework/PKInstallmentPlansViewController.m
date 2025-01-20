@interface PKInstallmentPlansViewController
- (PKInstallmentPlansViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 physicalCards:(id)a5 accountService:(id)a6 transactionSourceCollection:(id)a7 familyCollection:(id)a8 dataProvider:(id)a9;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (id)_imageWithURL:(id)a3 installmentPlan:(id)a4;
- (id)_indexPathForInstallmentPlan:(id)a3;
- (id)_installmentPlanForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureCell:(id)a3 forInstallmentPlan:(id)a4;
- (void)_handleAccountUpdatedNotification:(id)a3;
- (void)_updateInstallmentPlans;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKInstallmentPlansViewController

- (PKInstallmentPlansViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 physicalCards:(id)a5 accountService:(id)a6 transactionSourceCollection:(id)a7 familyCollection:(id)a8 dataProvider:(id)a9
{
  id v16 = a3;
  id v35 = a4;
  id v36 = a5;
  id v17 = a6;
  id v18 = a7;
  id v34 = a8;
  id v33 = a9;
  v37.receiver = self;
  v37.super_class = (Class)PKInstallmentPlansViewController;
  v19 = -[PKInstallmentPlansViewController initWithStyle:](&v37, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_account, a3);
    objc_storeStrong((id *)&v20->_accountUserCollection, a4);
    uint64_t v21 = [v36 copy];
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v21;

    objc_storeStrong((id *)&v20->_accountService, a6);
    objc_storeStrong((id *)&v20->_transactionSourceCollection, a7);
    objc_storeStrong((id *)&v20->_familyCollection, a8);
    objc_storeStrong((id *)&v20->_dataProvider, a9);
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    installmentPlanToDeviceName = v20->_installmentPlanToDeviceName;
    v20->_installmentPlanToDeviceName = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    installmentPlanImages = v20->_installmentPlanImages;
    v20->_installmentPlanImages = v25;

    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    installmentDateFormatter = v20->_installmentDateFormatter;
    v20->_installmentDateFormatter = v27;

    [(NSDateFormatter *)v20->_installmentDateFormatter setDateStyle:3];
    [(NSDateFormatter *)v20->_installmentDateFormatter setTimeStyle:0];
    [(PKInstallmentPlansViewController *)v20 _updateInstallmentPlans];
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v20 selector:sel__handleAccountUpdatedNotification_ name:*MEMORY[0x1E4F85BF8] object:v17];

    v30 = [(PKInstallmentPlansViewController *)v20 navigationItem];
    v31 = PKLocalizedBeekmanString(&cfstr_Installments_0.isa);
    [v30 setTitle:v31];

    objc_msgSend(v30, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v30, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v20;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKInstallmentPlansViewController;
  [(PKInstallmentPlansViewController *)&v4 viewDidLoad];
  v3 = [(PKInstallmentPlansViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"InstallmentPlanCellReuseIdentifier"];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85618]];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKInstallmentPlansViewController;
  [(PKInstallmentPlansViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKInstallmentPlansViewController *)self tableView];
  objc_super v4 = [(PKInstallmentPlansViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(PKInstallmentPlansViewController *)self tableView:v6 viewForHeaderInSection:a4];
  if (!a4)
  {
    v8 = (void *)MEMORY[0x1E4F851B8];
    v9 = @"INSTALLMENTS_ACTIVE_HEADER";
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v8 = (void *)MEMORY[0x1E4F853B0];
    v9 = @"INSTALLMENTS_COMPLETED_HEADER";
LABEL_5:
    v10 = PKLocalizedBeekmanString(&v9->isa);
    [v7 setAccessibilityIdentifier:*v8];
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  if ([(PKInstallmentPlansViewController *)self tableView:v6 numberOfRowsInSection:a4] <= 0)v11 = 0; {
  else
  }
    v11 = v10;
  id v12 = v11;

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      int64_t v8 = 0;
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___PKInstallmentPlansViewController__completedInstallmentPlans;
  }
  else
  {
    v7 = &OBJC_IVAR___PKInstallmentPlansViewController__activeInstallmentPlans;
  }
  int64_t v8 = [*(id *)((char *)&self->super.super.super.super.isa + *v7) count];
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"InstallmentPlanCellReuseIdentifier" forIndexPath:v6];
  int64_t v8 = [(PKInstallmentPlansViewController *)self _installmentPlanForIndexPath:v6];
  [(PKInstallmentPlansViewController *)self _configureCell:v7 forInstallmentPlan:v8];
  uint64_t v9 = [v6 section];

  if (v9)
  {
    if (v9 != 1) {
      goto LABEL_6;
    }
    v10 = (void **)MEMORY[0x1E4F853B0];
  }
  else
  {
    v10 = (void **)MEMORY[0x1E4F851B8];
  }
  PKAccessibilityIDCellSet(v7, *v10);
LABEL_6:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(PKInstallmentPlansViewController *)self _installmentPlanForIndexPath:v6];
  if (v7)
  {
    int64_t v8 = [[PKTransactionHistoryViewController alloc] initWithInstallmentPlan:v7 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards];
    uint64_t v9 = [(PKInstallmentPlansViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKInstallmentPlansViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  int64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __59__PKInstallmentPlansViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1104), obj);
    if ([*(id *)(a1 + 40) isViewLoaded])
    {
      v2 = [*(id *)(a1 + 40) tableView];
      [v2 reloadData];
    }
  }
}

- (void)_configureCell:(id)a3 forInstallmentPlan:(id)a4
{
  id v20 = a4;
  id v6 = [a3 transactionView];
  id v7 = [v20 product];
  int64_t v8 = [v20 summary];
  installmentPlanToDeviceName = self->_installmentPlanToDeviceName;
  id v10 = [v20 identifier];
  v11 = [(NSMutableDictionary *)installmentPlanToDeviceName objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = v11;
    v13 = [v7 model];
  }
  else
  {
    id v12 = [v7 model];
    v13 = 0;
  }
  v14 = [v8 startDate];
  if (v14)
  {
    installmentDateFormatter = self->_installmentDateFormatter;
    id v16 = [v8 startDate];
    id v17 = [(NSDateFormatter *)installmentDateFormatter stringFromDate:v16];
  }
  else
  {
    id v17 = 0;
  }

  id v18 = [v7 iconURLForScale:0 suffix:PKUIScreenScale()];
  v19 = [(PKInstallmentPlansViewController *)self _imageWithURL:v18 installmentPlan:v20];
  [v6 setPrimaryString:v12];
  [v6 setSecondaryString:v13];
  [v6 setTertiaryString:v17];
  [v6 setPrimaryImage:v19];
  [v6 setShowsDisclosureView:1];
  [v6 setStrokeImage:1];
}

- (id)_imageWithURL:(id)a3 installmentPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v7 identifier];
  uint64_t v9 = [(NSMutableDictionary *)self->_installmentPlanImages objectForKeyedSubscript:v8];
  if (v6)
  {
    id v10 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
    v11 = v10;
    if (!v9)
    {
      uint64_t v12 = [v10 cachedDataForURL:v6];
      if (!v12
        || (v13 = (void *)v12,
            [MEMORY[0x1E4FB1818] imageWithData:v12],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [(NSMutableDictionary *)self->_installmentPlanImages setObject:v9 forKeyedSubscript:v8], v13, !v9))
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke;
        v18[3] = &unk_1E59CFFA8;
        objc_copyWeak(&v21, &location);
        id v19 = v8;
        id v20 = v7;
        [v11 downloadFromUrl:v6 completionHandler:v18];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        uint64_t v9 = 0;
      }
    }
  }
  if (!v9)
  {
    v14 = PKPassKitUIBundle();
    v15 = [v14 URLForResource:@"InstallmentsFallback" withExtension:@"pdf"];

    if (v15)
    {
      double v16 = PKUIScreenScale();
      uint64_t v9 = PKUIImageFromPDF(v15, 100.0, 100.0, v16);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

void __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a2 && !a4)
  {
    int64_t v8 = [MEMORY[0x1E4FB1818] imageWithData:a2];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke_37;
      v12[3] = &unk_1E59CE888;
      objc_copyWeak(&v16, a1 + 6);
      id v13 = a1[4];
      id v14 = v8;
      id v15 = a1[5];
      dispatch_async(MEMORY[0x1E4F14428], v12);

      objc_destroyWeak(&v16);
    }
    else
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v7 URL];
        v11 = [v10 absoluteString];
        *(_DWORD *)buf = 138412290;
        id v18 = v11;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "invalid image for URL: %@", buf, 0xCu);
      }
    }
  }
}

void __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke_37(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained[136] setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
    v3 = [v7 _indexPathForInstallmentPlan:*(void *)(a1 + 48)];
    if (v3)
    {
      id v4 = [v7 tableView];
      id v5 = [v4 cellForRowAtIndexPath:v3];

      id v6 = [v5 transactionView];
      [v6 setPrimaryImage:*(void *)(a1 + 40) animated:1];
    }
    WeakRetained = v7;
  }
}

- (id)_installmentPlanForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (!v5)
  {
    id v6 = &OBJC_IVAR___PKInstallmentPlansViewController__activeInstallmentPlans;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    id v6 = &OBJC_IVAR___PKInstallmentPlansViewController__completedInstallmentPlans;
LABEL_5:
    id v7 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:
  unint64_t v8 = [v4 row];

  if (v8 >= [v7 count])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v7 objectAtIndex:v8];
  }

  return v9;
}

- (id)_indexPathForInstallmentPlan:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    unsigned int v6 = [v5 isComplete];
    uint64_t v7 = 10;
    if (v6) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKInstallmentPlansViewController__account[v7]) indexOfObject:v5];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:v6];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)_updateInstallmentPlans
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKAccount *)self->_account creditDetails];
  id v4 = [v3 installmentPlans];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __59__PKInstallmentPlansViewController__updateInstallmentPlans__block_invoke;
  v39[3] = &unk_1E59CFFD0;
  id v7 = v6;
  id v40 = v7;
  id v8 = v5;
  id v41 = v8;
  [v4 enumerateObjectsUsingBlock:v39];
  uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"summary.startDate" ascending:0];
  v44[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v11 = [v8 sortedArrayUsingDescriptors:v10];
  activeInstallmentPlans = self->_activeInstallmentPlans;
  self->_activeInstallmentPlans = v11;

  v32 = (void *)v9;
  uint64_t v43 = v9;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  id v33 = v7;
  id v14 = [v7 sortedArrayUsingDescriptors:v13];
  completedInstallmentPlans = self->_completedInstallmentPlans;
  self->_completedInstallmentPlans = v14;

  id v34 = self;
  [(NSMutableDictionary *)self->_installmentPlanToDeviceName removeAllObjects];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v22 = [v21 identifier];
        v23 = [v21 product];
        id v24 = [v23 serialNumber];

        if (v24)
        {
          v25 = PKSerialNumber();
          v26 = v25;
          if (v25)
          {
            id v27 = v25;
            if (v24 == v27)
            {

              goto LABEL_12;
            }
            v28 = v27;
            uint64_t v29 = [v24 caseInsensitiveCompare:v27];

            if (!v29)
            {
LABEL_12:
              v30 = PKDeviceName();
              [(NSMutableDictionary *)v34->_installmentPlanToDeviceName setObject:v30 forKeyedSubscript:v22];
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v18);
  }

  if ([(PKInstallmentPlansViewController *)v34 isViewLoaded])
  {
    v31 = [(PKInstallmentPlansViewController *)v34 tableView];
    [v31 reloadData];
  }
}

void __59__PKInstallmentPlansViewController__updateInstallmentPlans__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = [v5 isComplete];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

- (void)_handleAccountUpdatedNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  id v6 = [(PKAccount *)self->_account accountIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke;
  v7[3] = &unk_1E59CFFF8;
  objc_copyWeak(&v8, &location);
  [(PKAccountService *)accountService accountWithIdentifier:v6 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke_2;
    v4[3] = &unk_1E59CB010;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v6);
  }
}

void __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 128, *(id *)(a1 + 32));
    [v3 _updateInstallmentPlans];
    WeakRetained = v3;
  }
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_installmentDateFormatter, 0);
  objc_storeStrong((id *)&self->_installmentPlanImages, 0);
  objc_storeStrong((id *)&self->_installmentPlanToDeviceName, 0);
  objc_storeStrong((id *)&self->_completedInstallmentPlans, 0);
  objc_storeStrong((id *)&self->_activeInstallmentPlans, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end