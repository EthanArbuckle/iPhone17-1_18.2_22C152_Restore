@interface PSUIPerAppUsageListController
- (BOOL)delayedReloadInProgress;
- (BOOL)specifiersContainsSpinner;
- (PSSimStatusCache)simStatusCache;
- (PSUICellularPlanManagerCache)cellularPlanManagerCache;
- (PSUICellularUsageSchedulingGroup)schedulingGroup;
- (PSUIPerAppUsageListController)init;
- (PSUIPerAppUsageListController)initWithReloadDelay:(double)a3 schedulingGroup:(id)a4 simStatusCache:(id)a5 cellularPlanManagerCache:(id)a6;
- (double)reloadDelay;
- (id)activeDataPlanLabel;
- (id)appUsageGroupTitle;
- (id)getLogger;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)commonInit;
- (void)dealloc;
- (void)reloadAfterDelayIfNeeded;
- (void)setCellularPlanManagerCache:(id)a3;
- (void)setDelayedReloadInProgress:(BOOL)a3;
- (void)setReloadDelay:(double)a3;
- (void)setSchedulingGroup:(id)a3;
- (void)setSimStatusCache:(id)a3;
- (void)wirelessDataUsageCacheRefreshed;
- (void)wirelessDataUsageChangedNotification;
@end

@implementation PSUIPerAppUsageListController

- (PSUIPerAppUsageListController)init
{
  v13.receiver = self;
  v13.super_class = (Class)PSUIPerAppUsageListController;
  v2 = [(PSUIPerAppUsageListController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_reloadDelay = 2.5;
    uint64_t v4 = [MEMORY[0x263F67EF0] sharedInstance];
    simStatusCache = v3->_simStatusCache;
    v3->_simStatusCache = (PSSimStatusCache *)v4;

    uint64_t v6 = +[PSUICellularPlanManagerCache sharedInstance];
    cellularPlanManagerCache = v3->_cellularPlanManagerCache;
    v3->_cellularPlanManagerCache = (PSUICellularPlanManagerCache *)v6;

    v8 = [PSUICellularUsageSchedulingGroup alloc];
    v9 = [(PSUIPerAppUsageListController *)v3 appUsageGroupTitle];
    uint64_t v10 = [(PSUICellularUsageSchedulingGroup *)v8 initWithListController:v3 groupSpecifierTitle:v9];
    schedulingGroup = v3->_schedulingGroup;
    v3->_schedulingGroup = (PSUICellularUsageSchedulingGroup *)v10;

    [(PSUIPerAppUsageListController *)v3 commonInit];
  }
  return v3;
}

- (PSUIPerAppUsageListController)initWithReloadDelay:(double)a3 schedulingGroup:(id)a4 simStatusCache:(id)a5 cellularPlanManagerCache:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PSUIPerAppUsageListController;
  v14 = [(PSUIPerAppUsageListController *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_reloadDelay = a3;
    objc_storeStrong((id *)&v14->_simStatusCache, a5);
    objc_storeStrong((id *)&v15->_cellularPlanManagerCache, a6);
    objc_storeStrong((id *)&v15->_schedulingGroup, a4);
    schedulingGroup = v15->_schedulingGroup;
    v17 = [(PSUIPerAppUsageListController *)v15 appUsageGroupTitle];
    [(PSUICellularUsageSchedulingGroup *)schedulingGroup setGroupSpecifierTitle:v17];

    [(PSUIPerAppUsageListController *)v15 commonInit];
  }

  return v15;
}

- (void)commonInit
{
  self->_delayedReloadInProgress = 0;
  v3 = [(PSUIPerAppUsageListController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Init, asking to calculate usage.", v8, 2u);
  }

  [(PSUICellularUsageSchedulingGroup *)self->_schedulingGroup calculateUsageWithForcedRefresh:0];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"APP_USAGE_LIST_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  [(PSUIPerAppUsageListController *)self setTitle:v5];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_wirelessDataUsageChangedNotification name:*MEMORY[0x263F67F20] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_wirelessDataUsageCacheRefreshed name:*MEMORY[0x263F67F18] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUIPerAppUsageListController;
  [(PSUIPerAppUsageListController *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = [(PSUICellularUsageSchedulingGroup *)self->_schedulingGroup specifiers];
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v3;
  uint64_t v6 = v3;

  [(PSUIPerAppUsageListController *)self reloadAfterDelayIfNeeded];
  id v7 = *(id *)((char *)&self->super.super.super.super.super.isa + v4);

  return v7;
}

- (void)reloadAfterDelayIfNeeded
{
  if ([(PSUIPerAppUsageListController *)self specifiersContainsSpinner]
    && !self->_delayedReloadInProgress)
  {
    v3 = [(PSUIPerAppUsageListController *)self getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "A spinner cell is showing, and no reload is in progress, attempt to reload in a few seconds.", buf, 2u);
    }

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    self->_delayedReloadInProgress = 1;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_reloadDelay * 1000000000.0));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__PSUIPerAppUsageListController_reloadAfterDelayIfNeeded__block_invoke;
    v5[3] = &unk_2645E0E68;
    objc_copyWeak(&v6, (id *)buf);
    v5[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __57__PSUIPerAppUsageListController_reloadAfterDelayIfNeeded__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_time_t v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1384) = 0;
    if ([*(id *)(a1 + 32) specifiersContainsSpinner])
    {
      id v5 = objc_loadWeakRetained(v2);
      id v6 = [v5 getLogger];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to calculate usage and reload as spinner cell is still showing.", v7, 2u);
      }

      [v4[175] calculateUsageWithForcedRefresh:1];
      [v4 reloadSpecifiers];
    }
  }
}

- (BOOL)specifiersContainsSpinner
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "cellType", (void)v7) == 15)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)appUsageGroupTitle
{
  uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4) {
    long long v7 = @"APP_WIRELESS_DATA_USAGE";
  }
  else {
    long long v7 = @"APP_DATA_USAGE";
  }
  long long v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];

  long long v9 = [(PSUIPerAppUsageListController *)self activeDataPlanLabel];
  if ([v9 length])
  {
    if ([(PSSimStatusCache *)self->_simStatusCache isDualSimCapable])
    {
      long long v10 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache planItems];
      unint64_t v11 = [v10 count];

      if (v11 >= 2)
      {
        uint64_t v12 = NSString;
        id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v13 localizedStringForKey:@"APP_DATA_USAGE_FOR_%@" value:&stru_26D410CA0 table:@"Cellular"];
        uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v14, v9);

        long long v8 = (void *)v15;
      }
    }
  }

  return v8;
}

- (id)activeDataPlanLabel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache planItems];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v6 isActiveDataPlan])
        {
          long long v7 = [v6 userLabel];
          uint64_t v3 = [v7 label];

          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)wirelessDataUsageChangedNotification
{
  uint64_t v3 = [(PSUIPerAppUsageListController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Received data usage changed notification", v6, 2u);
  }

  schedulingGroup = self->_schedulingGroup;
  id v5 = [(PSUIPerAppUsageListController *)self appUsageGroupTitle];
  [(PSUICellularUsageSchedulingGroup *)schedulingGroup setGroupSpecifierTitle:v5];

  [(PSUICellularUsageSchedulingGroup *)self->_schedulingGroup calculateUsageWithForcedRefresh:0];
  [(PSUIPerAppUsageListController *)self reloadSpecifiers];
}

- (void)wirelessDataUsageCacheRefreshed
{
  uint64_t v3 = [(PSUIPerAppUsageListController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Received data usage cache refreshed notification", v4, 2u);
  }

  [(PSUICellularUsageSchedulingGroup *)self->_schedulingGroup sortGroup];
  [(PSUIPerAppUsageListController *)self reloadSpecifiers];
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PSUIPerAppUsageListController;
  id v5 = [(PSUIPerAppUsageListController *)&v7 selectSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setParentSpecifier:v4];
  }

  return v5;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PSUIPerAppUsageListController"];
}

- (BOOL)delayedReloadInProgress
{
  return self->_delayedReloadInProgress;
}

- (void)setDelayedReloadInProgress:(BOOL)a3
{
  self->_delayedReloadInProgress = a3;
}

- (double)reloadDelay
{
  return self->_reloadDelay;
}

- (void)setReloadDelay:(double)a3
{
  self->_reloadDelay = a3;
}

- (PSUICellularUsageSchedulingGroup)schedulingGroup
{
  return self->_schedulingGroup;
}

- (void)setSchedulingGroup:(id)a3
{
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
}

- (PSUICellularPlanManagerCache)cellularPlanManagerCache
{
  return self->_cellularPlanManagerCache;
}

- (void)setCellularPlanManagerCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlanManagerCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_schedulingGroup, 0);
}

@end