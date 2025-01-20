@interface PSUICellularUsageSchedulingGroup
- (BOOL)refreshInProgress;
- (CTUIListWithHeaderLoadingGroup)loadingGroup;
- (PSListController)hostController;
- (PSUIAppDataUsageSpecifierFactory)appDataUsageSpecifierFactory;
- (PSUICellularUsageSchedulingGroup)initWithListController:(id)a3 groupSpecifierTitle:(id)a4;
- (id)getLogger;
- (id)specifiers;
- (void)calculateUsageWithForcedRefresh:(BOOL)a3;
- (void)didFailToSetPolicyForSpecifier:(id)a3;
- (void)prefetchPoliciesFor:(id)a3;
- (void)selectedBillingPeriodChanged:(unint64_t)a3;
- (void)setAppDataUsageSpecifierFactory:(id)a3;
- (void)setGroupSpecifierTitle:(id)a3;
- (void)setHostController:(id)a3;
- (void)setLoadingGroup:(id)a3;
- (void)setRefreshInProgress:(BOOL)a3;
- (void)sortGroup;
@end

@implementation PSUICellularUsageSchedulingGroup

- (PSUICellularUsageSchedulingGroup)initWithListController:(id)a3 groupSpecifierTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PSUICellularUsageSchedulingGroup;
  v8 = [(PSUICellularUsageSchedulingGroup *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    v10 = [[CTUIListWithHeaderLoadingGroup alloc] initWithHostController:v6];
    loadingGroup = v9->_loadingGroup;
    v9->_loadingGroup = v10;

    v12 = [PSUIAppDataUsageSpecifierFactory alloc];
    v13 = [MEMORY[0x263F67ED0] sharedInstance];
    v14 = [MEMORY[0x263F67EE0] sharedInstance];
    v15 = +[PSUICarrierSpaceManager sharedManager];
    uint64_t v16 = [(PSUIAppDataUsageSpecifierFactory *)v12 initWithGroupSpecifierTitle:v7 managementCache:v13 statisticsCache:v14 carrierSpaceManager:v15 billingCycleDelegate:v9 policySpecifierDelegate:v9];
    appDataUsageSpecifierFactory = v9->_appDataUsageSpecifierFactory;
    v9->_appDataUsageSpecifierFactory = (PSUIAppDataUsageSpecifierFactory *)v16;
  }
  return v9;
}

- (id)specifiers
{
  v2 = [(PSUICellularUsageSchedulingGroup *)self loadingGroup];
  v3 = [v2 specifiers];

  return v3;
}

- (void)prefetchPoliciesFor:(id)a3
{
  v3 = (void *)MEMORY[0x263F67EC0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 fetchUsagePoliciesFor:v4];
}

- (void)didFailToSetPolicyForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICellularUsageSchedulingGroup *)self hostController];
  [v5 reloadSpecifier:v4];
}

- (void)selectedBillingPeriodChanged:(unint64_t)a3
{
  id v4 = [(PSUICellularUsageSchedulingGroup *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Sorting cellular usage group due to billing period selector change", v5, 2u);
  }

  [(PSUICellularUsageSchedulingGroup *)self sortGroup];
}

- (void)calculateUsageWithForcedRefresh:(BOOL)a3
{
  if (a3) {
    goto LABEL_7;
  }
  id v4 = self;
  objc_sync_enter(v4);
  if (![(PSUICellularUsageSchedulingGroup *)v4 refreshInProgress])
  {
    [(PSUICellularUsageSchedulingGroup *)v4 setRefreshInProgress:1];
    objc_sync_exit(v4);

LABEL_7:
    id v6 = [(PSUICellularUsageSchedulingGroup *)self loadingGroup];
    id v7 = [(PSUICellularUsageSchedulingGroup *)self appDataUsageSpecifierFactory];
    v8 = [v7 headerSpecifiers];
    [v6 setHeaderSpecifiers:v8];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v9 = [MEMORY[0x263F67EE0] sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke;
    v10[3] = &unk_2645E0BD8;
    v10[4] = self;
    objc_copyWeak(&v11, (id *)buf);
    [v9 fetchDeviceDataUsageWithCompletion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
    return;
  }
  id v5 = [(PSUICellularUsageSchedulingGroup *)v4 getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Refresh already in progress", buf, 2u);
  }

  objc_sync_exit(v4);
}

void __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "Device data usage fetch complete: %p", buf, 0xCu);
  }

  id v4 = dispatch_get_global_queue(25, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_6;
  v5[3] = &unk_2645E0E68;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
}

void __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_6(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Creating specifiers", buf, 2u);
    }

    *(void *)buf = 0;
    v14 = buf;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    id v18 = 0;
    id v5 = [WeakRetained appDataUsageSpecifierFactory];
    id v18 = [v5 contentSpecifiers];

    [WeakRetained setRefreshInProgress:0];
    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Prefetching policies", v12, 2u);
    }

    id v7 = [WeakRetained appDataUsageSpecifierFactory];
    uint64_t v8 = [v7 bundleIDs];
    [WeakRetained prefetchPoliciesFor:v8];

    uint64_t v9 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Dispatching cellular usage specifiers update to main thread", v12, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_7;
    block[3] = &unk_2645E1638;
    objc_copyWeak(&v11, v2);
    block[4] = *(void *)(a1 + 32);
    block[5] = buf;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v11);
    _Block_object_dispose(buf, 8);
  }
}

void __68__PSUICellularUsageSchedulingGroup_calculateUsageWithForcedRefresh___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Updating cellular usage specifiers on main thread", v6, 2u);
    }

    id v4 = [WeakRetained loadingGroup];
    [v4 setContentSpecifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    id v5 = [WeakRetained hostController];
    [v5 reloadSpecifiers];
  }
}

- (void)setGroupSpecifierTitle:(id)a3
{
}

- (void)sortGroup
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(PSUICellularUsageSchedulingGroup *)v2 refreshInProgress])
  {
    uint64_t v3 = [(PSUICellularUsageSchedulingGroup *)v2 getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Refresh already in progress, just refresh specifiers instead of sorting.", buf, 2u);
    }

    id v4 = [(PSUICellularUsageSchedulingGroup *)v2 hostController];
    [v4 reloadSpecifiers];

    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v2);
    id v5 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke;
    block[3] = &unk_2645E0CD0;
    objc_copyWeak(&v7, (id *)buf);
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained appDataUsageSpecifierFactory];
    [v4 refreshOrderingOfContentSpecifiers];

    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__3;
    v8[4] = __Block_byref_object_dispose__3;
    id v9 = 0;
    id v5 = [v3 appDataUsageSpecifierFactory];
    id v9 = [v5 contentSpecifiers];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke_2;
    v6[3] = &unk_2645E1660;
    objc_copyWeak(&v7, v1);
    v6[4] = v8;
    dispatch_async(MEMORY[0x263EF83A0], v6);
    objc_destroyWeak(&v7);
    _Block_object_dispose(v8, 8);
  }
}

void __45__PSUICellularUsageSchedulingGroup_sortGroup__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained loadingGroup];
    [v3 setContentSpecifiers:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

    id v4 = [v5 hostController];
    [v4 reloadSpecifiers];

    id WeakRetained = v5;
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularUsageGroup"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (CTUIListWithHeaderLoadingGroup)loadingGroup
{
  return self->_loadingGroup;
}

- (void)setLoadingGroup:(id)a3
{
}

- (PSUIAppDataUsageSpecifierFactory)appDataUsageSpecifierFactory
{
  return self->_appDataUsageSpecifierFactory;
}

- (void)setAppDataUsageSpecifierFactory:(id)a3
{
}

- (BOOL)refreshInProgress
{
  return self->_refreshInProgress;
}

- (void)setRefreshInProgress:(BOOL)a3
{
  self->_refreshInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDataUsageSpecifierFactory, 0);
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end