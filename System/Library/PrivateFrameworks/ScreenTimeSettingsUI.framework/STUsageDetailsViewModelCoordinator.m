@interface STUsageDetailsViewModelCoordinator
+ (NSNumber)defaultUsageReportTypeForLocalUser;
+ (NSString)defaultDeviceIdentifierForLocalUser;
+ (id)defaultDeviceIdentifierForChild:(id)a3;
+ (id)defaultUsageReportTypeForChild:(id)a3;
+ (void)setDefaultDeviceIdentifier:(id)a3 childDSID:(id)a4;
+ (void)setDefaultDeviceIdentifierForLocalUser:(id)a3;
+ (void)setDefaultUsageReportType:(id)a3 childDSID:(id)a4;
+ (void)setDefaultUsageReportTypeForLocalUser:(id)a3;
- (BOOL)isRefreshing;
- (NSArray)devices;
- (NSDate)initialUsageFetchDate;
- (NSDate)lastUsageDataRefreshTime;
- (NSFetchedResultsController)usageFetchedResultsController;
- (NSManagedObjectContext)moc;
- (NSManagedObjectID)currentUsageRequestObjectID;
- (NSNumber)userDSID;
- (NSString)organizationIdentifier;
- (NSString)selectedDeviceIdentifier;
- (NSTimer)usageDataRefreshTimer;
- (STDebouncer)usageChangeDebouncer;
- (STPersistenceControllerProtocol)persistenceController;
- (STUsageDetailsViewModel)viewModel;
- (STUsageDetailsViewModelCoordinator)initWithPersistenceController:(id)a3 organizationIdentifier:(id)a4 userDSID:(id)a5 devices:(id)a6 selectedDeviceIdentifier:(id)a7 selectedUsageReportType:(id)a8 usageContext:(int64_t)a9;
- (STUsageDetailsViewModelCoordinator)initWithPersistenceController:(id)a3 organizationIdentifier:(id)a4 userDSID:(id)a5 devices:(id)a6 selectedDeviceIdentifier:(id)a7 selectedUsageReportType:(id)a8 usageContext:(int64_t)a9 managedObjectContext:(id)a10;
- (id)_usageBlocksWithUser:(id)a3 device:(id)a4 error:(id *)a5;
- (id)_usageItemsWithUsageBlocks:(id)a3 lastUpdatedDate:(id *)a4 firstPickupByWeekdayByWeek:(id)a5 referenceDate:(id)a6 usageContext:(int64_t)a7;
- (id)initForLocalDeviceWithPersistenceController:(id)a3 selectedUsageReportType:(id)a4 usageContext:(int64_t)a5;
- (id)initForLocalDeviceWithPersistenceController:(id)a3 selectedUsageReportType:(id)a4 usageContext:(int64_t)a5 managedObjectContext:(id)a6;
- (int64_t)usageContext;
- (void)_didFinishRefreshingWithError:(id)a3 completionHandler:(id)a4;
- (void)_downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:(id)a3;
- (void)_loadAllHistoricalDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 selectedDay:(unint64_t)a6 selectedWeek:(unint64_t)a7 hadUsageData:(BOOL)a8 referenceDate:(id)a9 completionHandler:(id)a10;
- (void)_loadAllHistoricalUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 selectedDay:(unint64_t)a5 selectedWeek:(unint64_t)a6 hadUsageData:(BOOL)a7 referenceDate:(id)a8 completionHandler:(id)a9;
- (void)_loadLastWeekDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7;
- (void)_loadLastWeekUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6;
- (void)_loadTodayDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7;
- (void)_loadTodayUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6;
- (void)_refreshLegacyUsageDataWithCompletionHandler:(id)a3;
- (void)_refreshUsageDataAndReschedule;
- (void)_refreshUsageDataWithCompletion:(id)a3;
- (void)_updateUsageFetchedResultsController;
- (void)_updateWeekAndDayReportsWithUsageItems:(id)a3 weekStartDate:(id)a4 lastUpdatedDate:(id)a5 referenceDate:(id)a6 selectedItemDisplayName:(id)a7 isSelectedWeek:(BOOL)a8 selectedDay:(unint64_t)a9 weekUsageReports:(id)a10 dayUsageReports:(id)a11 dayUsageReportByWeekdays:(id)a12 firstPickupByWeekdayByWeek:(id)a13;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)loadViewModelWithCompletionHandler:(id)a3;
- (void)refreshUsageData;
- (void)scheduleRefreshUsageData;
- (void)setCurrentUsageRequestObjectID:(id)a3;
- (void)setDevices:(id)a3;
- (void)setInitialUsageFetchDate:(id)a3;
- (void)setLastUsageDataRefreshTime:(id)a3;
- (void)setMoc:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setPersistenceController:(id)a3;
- (void)setRefreshing:(BOOL)a3;
- (void)setSelectedDeviceIdentifier:(id)a3;
- (void)setUsageDataRefreshTimer:(id)a3;
- (void)setUsageFetchedResultsController:(id)a3;
- (void)setUserDSID:(id)a3;
- (void)stopRefreshingUsageData;
@end

@implementation STUsageDetailsViewModelCoordinator

- (STUsageDetailsViewModelCoordinator)initWithPersistenceController:(id)a3 organizationIdentifier:(id)a4 userDSID:(id)a5 devices:(id)a6 selectedDeviceIdentifier:(id)a7 selectedUsageReportType:(id)a8 usageContext:(int64_t)a9
{
  v54[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v53.receiver = self;
  v53.super_class = (Class)STUsageDetailsViewModelCoordinator;
  v22 = [(STUsageDetailsViewModelCoordinator *)&v53 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_persistenceController, a3);
    uint64_t v24 = [v17 copy];
    organizationIdentifier = v23->_organizationIdentifier;
    v23->_organizationIdentifier = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    userDSID = v23->_userDSID;
    v23->_userDSID = (NSNumber *)v26;

    uint64_t v28 = [v19 copy];
    devices = v23->_devices;
    v23->_devices = (NSArray *)v28;

    uint64_t v30 = objc_opt_new();
    viewModel = v23->_viewModel;
    v23->_viewModel = (STUsageDetailsViewModel *)v30;

    uint64_t v32 = [v20 copy];
    selectedDeviceIdentifier = v23->_selectedDeviceIdentifier;
    v23->_selectedDeviceIdentifier = (NSString *)v32;

    v23->_usageContext = a9;
    if (a9 == 2)
    {
      [(STUsageDetailsViewModel *)v23->_viewModel setSelectedWeek:1];
    }
    else if (a9 == 1 || !a9 && [v21 integerValue] == 1)
    {
      [(STUsageDetailsViewModel *)v23->_viewModel selectToday];
    }
    v34 = &off_264766000;
    if (_os_feature_enabled_impl())
    {
      uint64_t v35 = [objc_alloc(MEMORY[0x263F67170]) initWithMinCoalescenceInterval:2.0 maxCoalescenceInterval:10.0];
      usageChangeDebouncer = v23->_usageChangeDebouncer;
      v23->_usageChangeDebouncer = (STDebouncer *)v35;

      [(STDebouncer *)v23->_usageChangeDebouncer setDelegate:v23];
      [(STUsageDetailsViewModelCoordinator *)v23 _updateUsageFetchedResultsController];
    }
    else
    {
      v37 = [MEMORY[0x263F67270] fetchRequest];
      v38 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"requestedDate" ascending:1];
      v54[0] = v38;
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
      [v37 setSortDescriptors:v39];

      id v40 = objc_alloc(MEMORY[0x263EFF270]);
      uint64_t v41 = [(STPersistenceControllerProtocol *)v23->_persistenceController viewContext];
      uint64_t v42 = [v40 initWithFetchRequest:v37 managedObjectContext:v41 sectionNameKeyPath:0 cacheName:0];
      usageFetchedResultsController = v23->_usageFetchedResultsController;
      v23->_usageFetchedResultsController = (NSFetchedResultsController *)v42;

      [(NSFetchedResultsController *)v23->_usageFetchedResultsController setDelegate:v23];
      v44 = v23->_usageFetchedResultsController;
      id v52 = 0;
      LOBYTE(v41) = [(NSFetchedResultsController *)v44 performFetch:&v52];
      id v45 = v52;
      if ((v41 & 1) == 0)
      {
        v46 = +[STUILog usage];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[STUsageDetailsViewModelCoordinator initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:]();
        }
      }
      v34 = &off_264766000;
    }
    v47 = [v34[280] usage];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225B06000, v47, OS_LOG_TYPE_DEFAULT, "Initial Usage Fetch Started", buf, 2u);
    }

    [(STUsageDetailsViewModelCoordinator *)v23 setRefreshing:1];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __170__STUsageDetailsViewModelCoordinator_initWithPersistenceController_organizationIdentifier_userDSID_devices_selectedDeviceIdentifier_selectedUsageReportType_usageContext___block_invoke;
    v49[3] = &unk_2647671B0;
    v50 = v23;
    [(STUsageDetailsViewModelCoordinator *)v50 loadViewModelWithCompletionHandler:v49];
  }
  return v23;
}

uint64_t __170__STUsageDetailsViewModelCoordinator_initWithPersistenceController_organizationIdentifier_userDSID_devices_selectedDeviceIdentifier_selectedUsageReportType_usageContext___block_invoke(uint64_t a1)
{
  v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Initial Usage Fetch Completed", v5, 2u);
  }

  v3 = objc_opt_new();
  [*(id *)(a1 + 32) setInitialUsageFetchDate:v3];

  return [*(id *)(a1 + 32) setRefreshing:0];
}

- (STUsageDetailsViewModelCoordinator)initWithPersistenceController:(id)a3 organizationIdentifier:(id)a4 userDSID:(id)a5 devices:(id)a6 selectedDeviceIdentifier:(id)a7 selectedUsageReportType:(id)a8 usageContext:(int64_t)a9 managedObjectContext:(id)a10
{
  objc_storeStrong((id *)&self->_moc, a10);
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(STUsageDetailsViewModelCoordinator *)self initWithPersistenceController:v22 organizationIdentifier:v21 userDSID:v20 devices:v19 selectedDeviceIdentifier:v18 selectedUsageReportType:v17 usageContext:a9];

  return v23;
}

- (id)initForLocalDeviceWithPersistenceController:(id)a3 selectedUsageReportType:(id)a4 usageContext:(int64_t)a5
{
  return [(STUsageDetailsViewModelCoordinator *)self initForLocalDeviceWithPersistenceController:a3 selectedUsageReportType:a4 usageContext:a5 managedObjectContext:0];
}

- (id)initForLocalDeviceWithPersistenceController:(id)a3 selectedUsageReportType:(id)a4 usageContext:(int64_t)a5 managedObjectContext:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v35 = 0;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = +[DeviceDetails detailsForUserWithAltDSID:0 error:&v35];
  id v14 = v35;
  if (!v13)
  {
    id v16 = +[STUILog usage];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailsViewModelCoordinator initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:]();
    }
    goto LABEL_7;
  }
  uint64_t v15 = [v13 indexOfObjectPassingTest:&__block_literal_global_24];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [MEMORY[0x263F671D8] userNotifications];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailsViewModelCoordinator initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:]();
    }
LABEL_7:
    id v17 = 0;
    id v18 = 0;
    goto LABEL_11;
  }
  id v30 = v11;
  id v31 = v14;
  uint64_t v32 = self;
  id v33 = v10;
  int64_t v34 = a5;
  id v16 = [v13 objectAtIndexedSubscript:v15];
  id v17 = [v16 identifier];
  id v19 = [v16 coreDuetIdentifier];
  id v20 = +[STUILog usage];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v16 name];
    *(_DWORD *)buf = 138543874;
    v37 = v19;
    __int16 v38 = 2114;
    v39 = v17;
    __int16 v40 = 2114;
    uint64_t v41 = v21;
    _os_log_impl(&dword_225B06000, v20, OS_LOG_TYPE_DEFAULT, "initForLocalDeviceWithPersistenceController Local Device Found:  %{public}@ %{public}@ %{public}@", buf, 0x20u);
  }
  id v22 = [STUIDevice alloc];
  v23 = [v16 name];
  uint64_t v24 = [v16 platform];
  uint64_t v25 = [v16 isLocalDevice];
  uint64_t v26 = [v16 lastUpdatedDate];
  v27 = [(STUIDevice *)v22 initWithName:v23 identifier:v17 coreDuetIdentifier:v19 platform:v24 hasDeviceActivity:1 isLocalDevice:v25 lastFamilyCheckinDate:v26];

  id v18 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  [v18 addObject:v27];

  id v10 = v33;
  a5 = v34;
  id v14 = v31;
  self = v32;
  id v11 = v30;
LABEL_11:

  uint64_t v28 = [(STUsageDetailsViewModelCoordinator *)self initWithPersistenceController:v12 organizationIdentifier:*MEMORY[0x263F67370] userDSID:&unk_26D967450 devices:v18 selectedDeviceIdentifier:v17 selectedUsageReportType:v11 usageContext:a5 managedObjectContext:v10];
  return v28;
}

uint64_t __140__STUsageDetailsViewModelCoordinator_initForLocalDeviceWithPersistenceController_selectedUsageReportType_usageContext_managedObjectContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  return [a2 isLocalDevice];
}

- (void)dealloc
{
  v3 = [(STUsageDetailsViewModelCoordinator *)self usageDataRefreshTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)STUsageDetailsViewModelCoordinator;
  [(STUsageDetailsViewModelCoordinator *)&v4 dealloc];
}

- (void)setSelectedDeviceIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t selectedDeviceIdentifier = (uint64_t)self->_selectedDeviceIdentifier;
  if ((id)selectedDeviceIdentifier != v5)
  {
    id v7 = v5;
    if (!v5
      || (uint64_t selectedDeviceIdentifier = [(id)selectedDeviceIdentifier isEqualToString:v5],
          id v5 = v7,
          (selectedDeviceIdentifier & 1) == 0))
    {
      objc_storeStrong((id *)&self->_selectedDeviceIdentifier, a3);
      [(STUsageDetailsViewModelCoordinator *)self _updateUsageFetchedResultsController];
      uint64_t selectedDeviceIdentifier = [(STUsageDetailsViewModelCoordinator *)self loadViewModelWithCompletionHandler:0];
      id v5 = v7;
    }
  }

  MEMORY[0x270F9A758](selectedDeviceIdentifier, v5);
}

- (void)stopRefreshingUsageData
{
  v3 = [(STUsageDetailsViewModelCoordinator *)self usageDataRefreshTimer];
  [v3 invalidate];

  [(STUsageDetailsViewModelCoordinator *)self setUsageDataRefreshTimer:0];
}

- (void)scheduleRefreshUsageData
{
  v3 = [(STUsageDetailsViewModelCoordinator *)self lastUsageDataRefreshTime];
  id v8 = [v3 dateByAddingTimeInterval:60.0];

  [v8 timeIntervalSinceNow];
  if (v4 <= 0.0)
  {
    [(STUsageDetailsViewModelCoordinator *)self _refreshUsageDataAndReschedule];
  }
  else
  {
    double v5 = v4;
    v6 = [(STUsageDetailsViewModelCoordinator *)self usageDataRefreshTimer];
    [v6 invalidate];

    [(STUsageDetailsViewModelCoordinator *)self setUsageDataRefreshTimer:0];
    id v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__refreshUsageDataAndReschedule selector:0 userInfo:0 repeats:v5];
    [(STUsageDetailsViewModelCoordinator *)self setUsageDataRefreshTimer:v7];
  }
}

- (void)_refreshUsageDataAndReschedule
{
  v3 = [(STUsageDetailsViewModelCoordinator *)self usageDataRefreshTimer];
  [v3 invalidate];

  [(STUsageDetailsViewModelCoordinator *)self setUsageDataRefreshTimer:0];
  double v4 = +[STUILog usage];
  double v5 = (char *)os_signpost_id_generate(v4);

  v6 = +[STUILog usage];
  id v7 = v6;
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_225B06000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "Usage refresh", "", (uint8_t *)&buf, 2u);
  }

  id v8 = [MEMORY[0x263F08A48] mainQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke;
  v13[3] = &unk_264766F30;
  v13[4] = self;
  [v8 addOperationWithBlock:v13];

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"WillRefreshUsageNotification" object:0];

  objc_initWeak(&buf, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke_2;
  v10[3] = &unk_264768910;
  objc_copyWeak(v11, &buf);
  v11[1] = v5;
  [(STUsageDetailsViewModelCoordinator *)self _refreshUsageDataWithCompletion:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(&buf);
}

uint64_t __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRefreshing:1];
}

void __68__STUsageDetailsViewModelCoordinator__refreshUsageDataAndReschedule__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = +[STUILog usage];
    double v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 40);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)id v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_225B06000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Usage refresh", "", v7, 2u);
    }

    v6 = [MEMORY[0x263EFF910] date];
    [WeakRetained setLastUsageDataRefreshTime:v6];

    [WeakRetained scheduleRefreshUsageData];
  }
}

- (void)refreshUsageData
{
}

- (void)_refreshUsageDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    os_signpost_id_t v5 = [(STUsageDetailsViewModelCoordinator *)self organizationIdentifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F67370]];

    if (v6)
    {
      id v7 = +[STUILog usage];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing local device activity data.", buf, 2u);
      }

      id v8 = (void *)MEMORY[0x263F67178];
      v9 = [(STUsageDetailsViewModelCoordinator *)self lastUsageDataRefreshTime];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke;
      v10[3] = &unk_264767B10;
      void v10[4] = self;
      id v11 = v4;
      [v8 refreshAndUploadLocalDataSinceDate:v9 completionHandler:v10];
    }
    else
    {
      [(STUsageDetailsViewModelCoordinator *)self _downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:v4];
    }
  }
  else
  {
    [(STUsageDetailsViewModelCoordinator *)self _refreshLegacyUsageDataWithCompletionHandler:v4];
  }
}

void __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog usage];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) _downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_downloadRemoteDeviceActivityDataAndRefreshLegacyUsageDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = +[STUILog usage];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Downloading remote device activity data.", v6, 2u);
  }

  [MEMORY[0x263F67178] downloadRemoteData];
  [(STUsageDetailsViewModelCoordinator *)self _refreshLegacyUsageDataWithCompletionHandler:v4];
}

- (void)_refreshLegacyUsageDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    os_signpost_id_t v5 = [(STUsageDetailsViewModelCoordinator *)self userDSID];
    int v6 = +[STUILog usage];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225B06000, v6, OS_LOG_TYPE_DEFAULT, "Calling simplified_agent tp update legacy usage", buf, 2u);
    }

    id v7 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke;
    block[3] = &unk_264768378;
    id v18 = v5;
    id v19 = self;
    id v20 = v4;
    id v8 = v5;
    dispatch_async(v7, block);

    v9 = v18;
    goto LABEL_9;
  }
  id v10 = [(STUsageDetailsViewModelCoordinator *)self currentUsageRequestObjectID];

  if (!v10)
  {
    id v11 = [(STUsageDetailsViewModelCoordinator *)self userDSID];
    id v12 = [(STUsageDetailsViewModelCoordinator *)self persistenceController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166;
    v13[3] = &unk_2647679A8;
    id v14 = v11;
    uint64_t v15 = self;
    id v16 = v4;
    id v8 = v11;
    [v12 performBackgroundTask:v13];

    v9 = v14;
LABEL_9:

    goto LABEL_10;
  }
  id v8 = +[STUILog usage];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_225B06000, v8, OS_LOG_TYPE_DEFAULT, "Skipping legacy usage data refresh because a refresh is already in-progress.", buf, 2u);
  }
LABEL_10:
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  [v2 requestLegacyUsageForUser:v3 withError:&v8];
  id v4 = v8;
  os_signpost_id_t v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_264767B10;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 48);
  [v5 loadViewModelWithCompletionHandler:v6];
}

uint64_t __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didFinishRefreshingWithError:a2 completionHandler:*(void *)(a1 + 40)];
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v26 = 0;
    os_signpost_id_t v5 = [MEMORY[0x263F67168] fetchUserWithDSID:v4 inContext:v3 error:&v26];
    id v6 = v26;
    if (!v5)
    {
      id v7 = +[STUILog usage];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166_cold_1();
      }
      goto LABEL_9;
    }
    if ([v5 allDevicesAreNewUsage])
    {
      id v7 = +[STUILog usage];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v5 appleID];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Not refreshing legacy usage data because all of %{public}@'s devices are new_usage.", (uint8_t *)&buf, 0xCu);
      }
LABEL_9:

      v9 = (void (**)(id, id))*(id *)(a1 + 48);
      id v10 = v6;
      if (v9)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v9[2](v9, v10);
        }
        else
        {
          *(void *)&long long buf = MEMORY[0x263EF8330];
          *((void *)&buf + 1) = 3221225472;
          uint64_t v28 = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
          v29 = &unk_264767628;
          id v31 = v9;
          id v30 = v10;
          dispatch_async(MEMORY[0x263EF83A0], &buf);
        }
      }

      goto LABEL_32;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v11 = +[STUILog usage];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_225B06000, v11, OS_LOG_TYPE_DEFAULT, "Refreshing legacy usage data.", (uint8_t *)&buf, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  id v25 = v6;
  os_signpost_id_t v5 = [MEMORY[0x263F67270] fetchOrCreateUsageRequestForUserWithDSID:v12 inContext:v3 error:&v25];
  id v13 = v25;

  if (v5)
  {
    id v14 = [v5 objectID];
    [*(id *)(a1 + 40) setCurrentUsageRequestObjectID:v14];

    [v5 setAcknowledgedDate:0];
    uint64_t v15 = objc_opt_new();
    [v5 setRequestedDate:v15];

    [v5 setIsBackgroundTask:0];
    id v16 = [*(id *)(a1 + 40) persistenceController];
    id v24 = v13;
    int v17 = [v16 saveContext:v3 error:&v24];
    id v18 = v24;

    id v19 = +[STUILog usage];
    id v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_225B06000, v20, OS_LOG_TYPE_DEFAULT, "Successfully saved legacy usage request.", (uint8_t *)&buf, 2u);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166_cold_3();
    }

    id v22 = (void (**)(id, id))*(id *)(a1 + 48);
    id v23 = v18;
  }
  else
  {
    id v21 = +[STUILog usage];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166_cold_2();
    }

    id v22 = (void (**)(id, id))*(id *)(a1 + 48);
    id v23 = v13;
  }
  id v10 = v23;
  if (v22)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v22[2](v22, v10);
    }
    else
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v28 = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
      v29 = &unk_264767628;
      id v31 = v22;
      id v30 = v10;
      dispatch_async(MEMORY[0x263EF83A0], &buf);
    }
  }

LABEL_32:
}

- (void)_didFinishRefreshingWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08A48] mainQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __86__STUsageDetailsViewModelCoordinator__didFinishRefreshingWithError_completionHandler___block_invoke;
  v11[3] = &unk_264768938;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 addOperationWithBlock:v11];
}

uint64_t __86__STUsageDetailsViewModelCoordinator__didFinishRefreshingWithError_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRefreshing:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (NSString)defaultDeviceIdentifierForLocalUser
{
  v2 = +[STUsageDetailsSelection shared];
  id v3 = [v2 deviceIdentifierForLocalUser];

  return (NSString *)v3;
}

+ (void)setDefaultDeviceIdentifierForLocalUser:(id)a3
{
  id v3 = a3;
  id v4 = +[STUsageDetailsSelection shared];
  [v4 setDeviceIdentifierForLocalUser:v3];
}

+ (NSNumber)defaultUsageReportTypeForLocalUser
{
  v2 = +[STUsageDetailsSelection shared];
  id v3 = [v2 usageReportTypeForLocalUser];

  return (NSNumber *)v3;
}

+ (void)setDefaultUsageReportTypeForLocalUser:(id)a3
{
  id v3 = a3;
  id v4 = +[STUsageDetailsSelection shared];
  [v4 setUsageReportTypeForLocalUser:v3];
}

+ (id)defaultDeviceIdentifierForChild:(id)a3
{
  id v3 = a3;
  id v4 = +[STUsageDetailsSelection shared];
  os_signpost_id_t v5 = [v4 deviceIdentifierForChildUserDSID:v3];

  return v5;
}

+ (void)setDefaultDeviceIdentifier:(id)a3 childDSID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[STUsageDetailsSelection shared];
  [v7 setDeviceIdentifierTo:v6 forChildUserDSID:v5];
}

+ (id)defaultUsageReportTypeForChild:(id)a3
{
  id v3 = a3;
  id v4 = +[STUsageDetailsSelection shared];
  id v5 = [v4 usageReportTypeForChildUserDSID:v3];

  return v5;
}

+ (void)setDefaultUsageReportType:(id)a3 childDSID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[STUsageDetailsSelection shared];
  [v7 setUsageReportTypeTo:v6 forChildUserDSID:v5];
}

- (void)_updateUsageFetchedResultsController
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to set up fetched results controller for usage blocks: %{public}@", v2, v3, v4, v5, v6);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v9 = v8;
    id v10 = [(STUsageDetailsViewModelCoordinator *)self currentUsageRequestObjectID];
    id v11 = [v9 objectID];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      id v13 = [v9 acknowledgedDate];

      if (v13)
      {
        id v14 = +[STUILog usage];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_225B06000, v14, OS_LOG_TYPE_DEFAULT, "Usage Request Complete", buf, 2u);
        }

        [(STUsageDetailsViewModelCoordinator *)self setRefreshing:1];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __104__STUsageDetailsViewModelCoordinator_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke;
        v15[3] = &unk_2647671B0;
        v15[4] = self;
        [(STUsageDetailsViewModelCoordinator *)self loadViewModelWithCompletionHandler:v15];
      }
    }
  }
}

uint64_t __104__STUsageDetailsViewModelCoordinator_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Finished refreshing legacy usage data", v4, 2u);
  }

  [*(id *)(a1 + 32) setRefreshing:0];
  return [*(id *)(a1 + 32) setCurrentUsageRequestObjectID:0];
}

- (void)controllerDidChangeContent:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [(STUsageDetailsViewModelCoordinator *)self usageChangeDebouncer];
    [v4 bounce:0];
  }
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = +[STUILog usage];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Usage Model: simplified_agent usage controller content change debounced. Reloading view model.", buf, 2u);
    }

    [(STUsageDetailsViewModelCoordinator *)self setRefreshing:1];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke;
    v6[3] = &unk_2647671B0;
    v6[4] = self;
    [(STUsageDetailsViewModelCoordinator *)self loadViewModelWithCompletionHandler:v6];
  }
}

void __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setRefreshing:0];
  id v4 = +[STUILog usage];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully loaded usage view model after usage blocks changed", v6, 2u);
  }
}

- (id)_usageBlocksWithUser:(id)a3 device:(id)a4 error:(id *)a5
{
  v23[3] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = a4;
  id v9 = [v7 predicateWithFormat:@"%K == %@", @"usage.user", a3];
  id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"usage.device", v8];

  id v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %lld", @"durationInMinutes", 60);
  int v12 = [MEMORY[0x263F67268] fetchRequest];
  id v13 = (void *)MEMORY[0x263F08730];
  v23[0] = v9;
  v23[1] = v10;
  v23[2] = v11;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];
  [v12 setPredicate:v15];

  v22[0] = @"countedItems";
  v22[1] = @"categories";
  v22[2] = @"categories.timedItems";
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  [v12 setRelationshipKeyPathsForPrefetching:v16];

  int v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
  id v21 = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  [v12 setSortDescriptors:v18];

  [v12 setReturnsObjectsAsFaults:0];
  id v19 = [v12 execute:a5];

  return v19;
}

- (id)_usageItemsWithUsageBlocks:(id)a3 lastUpdatedDate:(id *)a4 firstPickupByWeekdayByWeek:(id)a5 referenceDate:(id)a6 usageContext:(int64_t)a7
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v88 = a5;
  id v10 = a6;
  id v11 = objc_opt_new();
  v90 = +[UsageDetails screenTimeUsageItemIdentifier];
  v116 = +[UsageDetails appUsageItemIdentifier];
  v114 = +[UsageDetails webUsageItemIdentifier];
  v99 = +[UsageDetails categoryUsageItemIdentifier];
  v101 = +[UsageDetails notificationUsageItemIdentifier];
  v102 = +[UsageDetails pickupUsageItemIdentifier];
  int v12 = [MEMORY[0x263F318B0] systemHiddenBundleIdentifiersForDeviceFamily:102];
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  v120 = v14;

  v87 = [MEMORY[0x263EFF8F0] currentCalendar];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v15 = v9;
  uint64_t v91 = [v15 countByEnumeratingWithState:&v133 objects:v142 count:16];
  if (v91)
  {
    uint64_t v89 = *(void *)v134;
    uint64_t v100 = *MEMORY[0x263F67348];
    uint64_t v97 = *MEMORY[0x263F67340];
    uint64_t v98 = *MEMORY[0x263F67358];
    uint64_t v96 = *MEMORY[0x263F67350];
    v94 = (void *)*MEMORY[0x263F67378];
    v95 = (void *)*MEMORY[0x263F673B0];
    uint64_t v107 = *MEMORY[0x263F31870];
    unint64_t v16 = 0x263F08000uLL;
    uint64_t v103 = *MEMORY[0x263F31860];
    uint64_t v113 = *MEMORY[0x263F31868];
    v115 = v11;
    id v105 = v15;
    id v106 = v10;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v134 != v89)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(v15);
          uint64_t v17 = v18;
        }
        uint64_t v92 = v17;
        id v19 = *(void **)(*((void *)&v133 + 1) + 8 * v17);
        v117 = [v19 startDate];
        if (a7 != 1)
        {
          id v20 = [v19 firstPickupDate];
          if (v20)
          {
            v110 = v19;
            id v21 = [v87 components:8704 fromDate:v20];
            id v22 = objc_msgSend(*(id *)(v16 + 2584), "numberWithInteger:", objc_msgSend(v21, "weekOfYear"));
            id v23 = [v88 objectForKeyedSubscript:v22];
            if (!v23)
            {
              id v23 = objc_opt_new();
              [v88 setObject:v23 forKeyedSubscript:v22];
            }
            id v24 = objc_msgSend(*(id *)(v16 + 2584), "numberWithInteger:", objc_msgSend(v21, "weekday"));
            id v25 = [v23 objectForKeyedSubscript:v24];

            if (!v25) {
              [v23 setObject:v20 forKeyedSubscript:v24];
            }

            id v19 = v110;
          }
        }
        id v26 = objc_opt_new();
        [v26 setItemType:1];
        [v26 setIdentifier:v90];
        [v26 setTimePeriod:0];
        [v26 setStartDate:v117];
        v27 = objc_msgSend(*(id *)(v16 + 2584), "numberWithLongLong:", objc_msgSend(v19, "screenTimeInSeconds"));
        [v26 setTotalUsage:v27];

        [v11 addObject:v26];
        if (a7 != 1)
        {
          uint64_t v28 = objc_opt_new();
          [v28 setItemType:6];
          [v28 setIdentifier:v102];
          [v28 setTimePeriod:0];
          [v28 setStartDate:v117];
          v29 = objc_msgSend(*(id *)(v16 + 2584), "numberWithLongLong:", objc_msgSend(v19, "numberOfPickupsWithoutApplicationUsage"));
          [v28 setTotalUsage:v29];

          [v11 addObject:v28];
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          v111 = v19;
          id v30 = [v19 countedItems];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v129 objects:v141 count:16];
          if (!v31) {
            goto LABEL_46;
          }
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v130;
          while (1)
          {
            uint64_t v34 = 0;
            uint64_t v118 = v32;
            do
            {
              if (*(void *)v130 != v33) {
                objc_enumerationMutation(v30);
              }
              id v35 = *(void **)(*((void *)&v129 + 1) + 8 * v34);
              v36 = [v35 bundleIdentifier];
              if (v36)
              {
                if (([v120 containsObject:v36] & 1) != 0
                  || ([v36 hasPrefix:v100] & 1) != 0)
                {
                  int v37 = 0;
                }
                else
                {
                  int v37 = [v36 hasPrefix:v97] ^ 1;
                }
                if ([v35 numberOfNotifications] < 1)
                {
                  if ([v35 numberOfPickups] <= 0) {
                    goto LABEL_44;
                  }
                  if (v37) {
                    goto LABEL_42;
                  }
                }
                else
                {
                  __int16 v38 = objc_opt_new();
                  [v38 setItemType:5];
                  if (v37)
                  {
                    if ([v36 hasPrefix:v98])
                    {
                      v39 = v95;
                      goto LABEL_39;
                    }
                    if ([v36 hasPrefix:v96])
                    {
                      v39 = v94;
LABEL_39:
                      v43 = [v101 stringByAppendingFormat:@"-%@", v39];
                      [v38 setIdentifier:v43];

                      id v44 = objc_alloc(MEMORY[0x263F67278]);
                      uint64_t v45 = [v35 usageTrusted];
                      v46 = v44;
                      v47 = v39;
                      uint64_t v32 = v118;
                    }
                    else
                    {
                      v48 = [v101 stringByAppendingFormat:@"-%@", v36];
                      [v38 setIdentifier:v48];

                      id v49 = objc_alloc(MEMORY[0x263F67278]);
                      uint64_t v45 = [v35 usageTrusted];
                      v46 = v49;
                      v47 = v36;
                    }
                    v50 = (void *)[v46 initWithIdentifier:v47 usageTrusted:v45];
                    [v38 setTrustIdentifier:v50];

                    [v38 setTimePeriod:0];
                    [v38 setStartDate:v117];
                    v51 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "numberOfNotifications"));
                    [v38 setTotalUsage:v51];

                    [v115 addObject:v38];
                    if ([v35 numberOfPickups] <= 0) {
                      goto LABEL_44;
                    }
LABEL_42:
                    uint64_t v41 = [v102 stringByAppendingFormat:@"-%@", v36];
                    id v52 = objc_opt_new();
                    [v52 setItemType:6];
                    [v52 setIdentifier:v41];
                    objc_super v53 = objc_msgSend(objc_alloc(MEMORY[0x263F67278]), "initWithIdentifier:usageTrusted:", v36, objc_msgSend(v35, "usageTrusted"));
                    [v52 setTrustIdentifier:v53];

                    [v52 setTimePeriod:0];
                    [v52 setStartDate:v117];
                    v54 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "numberOfPickups"));
                    [v52 setTotalUsage:v54];

                    uint64_t v32 = v118;
                    [v115 addObject:v52];

LABEL_43:
                    goto LABEL_44;
                  }
                  [v38 setIdentifier:v101];
                  [v38 setTimePeriod:0];
                  [v38 setStartDate:v117];
                  __int16 v40 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "numberOfNotifications"));
                  [v38 setTotalUsage:v40];

                  [v115 addObject:v38];
                  if ([v35 numberOfPickups] <= 0) {
                    goto LABEL_44;
                  }
                }
                uint64_t v41 = objc_opt_new();
                [v41 setItemType:6];
                [v41 setIdentifier:v102];
                [v41 setTimePeriod:0];
                [v41 setStartDate:v117];
                uint64_t v42 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "numberOfPickups"));
                [v41 setTotalUsage:v42];

                [v115 addObject:v41];
                goto LABEL_43;
              }
LABEL_44:

              ++v34;
            }
            while (v32 != v34);
            uint64_t v32 = [v30 countByEnumeratingWithState:&v129 objects:v141 count:16];
            if (!v32)
            {
LABEL_46:

              id v11 = v115;
              unint64_t v16 = 0x263F08000uLL;
              id v19 = v111;
              break;
            }
          }
        }
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        obuint64_t j = [v19 categories];
        uint64_t v109 = [obj countByEnumeratingWithState:&v125 objects:v140 count:16];
        if (!v109) {
          goto LABEL_77;
        }
        uint64_t v108 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v109; ++i)
          {
            if (*(void *)v126 != v108) {
              objc_enumerationMutation(obj);
            }
            v56 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            id v57 = [v56 identifier];
            if (([v57 isEqualToString:v107] & 1) != 0
              || [v57 isEqualToString:v103])
            {

LABEL_55:
              if ([v57 isEqualToString:v113]) {
                goto LABEL_75;
              }
              uint64_t v112 = i;
              v119 = 0;
              goto LABEL_59;
            }
            char v58 = [v57 isEqualToString:v113];

            if (v58) {
              goto LABEL_55;
            }
            uint64_t v112 = i;
            [v99 stringByAppendingFormat:@"-%@", v57];
            id v59 = v57;
            id v57 = (id)objc_claimAutoreleasedReturnValue();
            v60 = objc_opt_new();
            [v60 setItemType:3];
            [v60 setIdentifier:v57];
            v61 = (void *)[objc_alloc(MEMORY[0x263F67278]) initWithIdentifier:v59 usageTrusted:1];
            [v60 setTrustIdentifier:v61];

            v119 = v59;
            [v60 setCategoryIdentifier:v59];
            [v60 setTimePeriod:0];
            [v60 setStartDate:v117];
            v62 = objc_msgSend(*(id *)(v16 + 2584), "numberWithLongLong:", objc_msgSend(v56, "totalTimeInSeconds"));
            [v60 setTotalUsage:v62];

            [v11 addObject:v60];
LABEL_59:

            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            v63 = [v56 timedItems];
            uint64_t v64 = [v63 countByEnumeratingWithState:&v121 objects:v139 count:16];
            if (!v64) {
              goto LABEL_74;
            }
            uint64_t v65 = v64;
            uint64_t v66 = *(void *)v122;
            do
            {
              for (uint64_t j = 0; j != v65; ++j)
              {
                if (*(void *)v122 != v66) {
                  objc_enumerationMutation(v63);
                }
                v68 = *(void **)(*((void *)&v121 + 1) + 8 * j);
                v69 = [v68 bundleIdentifier];
                if (!v69)
                {
                  uint64_t v71 = [v68 domain];
                  v70 = v71;
                  if (!v71) {
                    goto LABEL_72;
                  }
                  v72 = [v114 stringByAppendingFormat:@"-%@", v71];
                  v73 = objc_opt_new();
                  [v73 setItemType:4];
                  [v73 setIdentifier:v72];
                  v74 = objc_msgSend(objc_alloc(MEMORY[0x263F67278]), "initWithIdentifier:usageTrusted:", v70, objc_msgSend(v68, "usageTrusted"));
                  [v73 setTrustIdentifier:v74];

                  [v73 setCategoryIdentifier:v119];
                  [v73 setTimePeriod:0];
                  [v73 setStartDate:v117];
                  v75 = NSNumber;
                  uint64_t v76 = [v68 totalTimeInSeconds];
                  v77 = v75;
                  id v11 = v115;
                  v78 = [v77 numberWithLongLong:v76];
                  [v73 setTotalUsage:v78];

                  [v115 addObject:v73];
                  goto LABEL_71;
                }
                if (![v120 containsObject:v69])
                {
                  v70 = [v116 stringByAppendingFormat:@"-%@", v69];
                  v72 = objc_opt_new();
                  [v72 setItemType:2];
                  [v72 setIdentifier:v70];
                  v79 = objc_msgSend(objc_alloc(MEMORY[0x263F67278]), "initWithIdentifier:usageTrusted:", v69, objc_msgSend(v68, "usageTrusted"));
                  [v72 setTrustIdentifier:v79];

                  [v72 setCategoryIdentifier:v119];
                  [v72 setTimePeriod:0];
                  [v72 setStartDate:v117];
                  v80 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v68, "totalTimeInSeconds"));
                  [v72 setTotalUsage:v80];

                  [v11 addObject:v72];
LABEL_71:

                  goto LABEL_72;
                }
                v70 = +[STUILog usage];
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  v138 = v69;
                  _os_log_debug_impl(&dword_225B06000, v70, OS_LOG_TYPE_DEBUG, "Skipping timed item for system app %@", buf, 0xCu);
                }
LABEL_72:
              }
              uint64_t v65 = [v63 countByEnumeratingWithState:&v121 objects:v139 count:16];
            }
            while (v65);
LABEL_74:

            id v15 = v105;
            id v10 = v106;
            unint64_t v16 = 0x263F08000;
            uint64_t i = v112;
            id v57 = v119;
LABEL_75:
          }
          uint64_t v109 = [obj countByEnumeratingWithState:&v125 objects:v140 count:16];
        }
        while (v109);
LABEL_77:

        uint64_t v17 = v92 + 1;
      }
      while (v92 + 1 != v91);
      uint64_t v91 = [v15 countByEnumeratingWithState:&v133 objects:v142 count:16];
    }
    while (v91);
  }

  if (a4)
  {
    v81 = [v15 firstObject];
    v82 = [v81 usage];
    v83 = [v82 lastUpdatedDate];
    v84 = v83;
    if (!v83) {
      v83 = v10;
    }
    *a4 = v83;
  }

  return v11;
}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STUsageDetailsViewModelCoordinator *)self userDSID];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__7;
  v28[4] = __Block_byref_object_dispose__7;
  id v29 = [(STUsageDetailsViewModelCoordinator *)self selectedDeviceIdentifier];
  uint8_t v6 = [(STUsageDetailsViewModelCoordinator *)self viewModel];
  char v7 = [v6 hasUsageData];
  uint64_t v8 = [v6 selectedWeek];
  id v9 = v4;
  uint64_t v10 = [v6 selectedDay];
  if (_os_feature_enabled_impl())
  {
    id v11 = [(STUsageDetailsViewModelCoordinator *)self moc];
    int v12 = v11;
    if (!v11)
    {
      id v19 = [MEMORY[0x263F67088] sharedController];
      uint64_t v18 = [v19 persistentContainer];
      id v14 = (void *)[v18 newBackgroundContext];

      goto LABEL_6;
    }
    id v13 = v11;
    int v12 = v13;
  }
  else
  {
    int v12 = [(STUsageDetailsViewModelCoordinator *)self persistenceController];
    id v13 = (id)[v12 newBackgroundContext];
  }
  id v14 = v13;
LABEL_6:

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v20[3] = &unk_2647689D0;
  v20[4] = self;
  id v15 = v5;
  id v21 = v15;
  id v16 = v9;
  id v23 = v16;
  id v24 = v28;
  id v17 = v14;
  id v22 = v17;
  uint64_t v25 = v10;
  uint64_t v26 = v8;
  char v27 = v7;
  [v17 performBlock:v20];

  _Block_object_dispose(v28, 8);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"HideNewUsageUI"];

  id v4 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v5 = [v4 localizedStringForKey:@"AllDevicesTitle" value:&stru_26D9391A8 table:0];

  uint8_t v6 = [*(id *)(a1 + 32) userDSID];
  uint64_t v7 = [v6 integerValue];

  if (v7) {
    [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"dsid", *(void *)(a1 + 40)];
  }
  else {
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != NULL", @"localUserDeviceState", v112);
  }
  id v9 = [MEMORY[0x263F67168] fetchRequest];
  [v9 setPredicate:v8];
  uint64_t v10 = [*(id *)(a1 + 32) organizationIdentifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F67370]];

  if ((v11 & 1) == 0)
  {
    v150[0] = @"usages";
    v150[1] = @"usages.device";
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:2];
    [v9 setRelationshipKeyPathsForPrefetching:v12];
  }
  id v146 = 0;
  id v13 = [v9 execute:&v146];
  id v14 = v146;
  if (v13)
  {
    if ((unint64_t)[v13 count] >= 2)
    {
      id v15 = +[STUILog usage];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5();
      }
    }
    int v116 = v3;
    id v16 = [v13 firstObject];
    id v17 = v16;
    long long v122 = v16;
    v119 = v8;
    v115 = v13;
    if (v11)
    {
      int v121 = [v16 syncingEnabled];
    }
    else
    {
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      id v21 = [v16 usages];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v142 objects:v149 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        id v113 = v14;
        id v24 = v5;
        uint64_t v25 = *(void *)v143;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v143 != v25) {
              objc_enumerationMutation(v21);
            }
            char v27 = [*(id *)(*((void *)&v142 + 1) + 8 * i) device];

            if (!v27)
            {
              int v121 = 1;
              goto LABEL_28;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v142 objects:v149 count:16];
          if (v23) {
            continue;
          }
          break;
        }
        int v121 = 0;
LABEL_28:
        uint64_t v5 = v24;
        id v14 = v113;
        id v17 = v122;
      }
      else
      {
        int v121 = 0;
      }
    }
    uint64_t v28 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"NOT (%K == %hd OR %K == %hd)", @"device.platform", 4, @"device.platform", 5);
    id v29 = [v17 userDeviceStates];
    v117 = (void *)v28;
    id v30 = [v29 filteredSetUsingPredicate:v28];

    uint64_t v31 = [v17 altDSID];
    LODWORD(v28) = _os_feature_enabled_impl();
    uint64_t v32 = +[STUILog usage];
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    long long v123 = (void *)v31;
    uint64_t v118 = v9;
    v120 = v30;
    if (v28)
    {
      if (v33)
      {
        *(_WORD *)block = 0;
        _os_log_impl(&dword_225B06000, v32, OS_LOG_TYPE_DEFAULT, "New usage feature flag is on.", block, 2u);
      }

      if (!v31 || v11 && ([v17 syncingEnabled] & 1) == 0)
      {
        uint64_t v34 = [v17 localUserDeviceState];
        id v35 = [v34 device];
        uint64_t v36 = [v35 identifier];
        uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
        __int16 v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v36;
      }
      long long v124 = v5;
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        v39 = [*(id *)(a1 + 32) devices];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v138 objects:v148 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = 0;
          uint64_t v43 = *(void *)v139;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v139 != v43) {
                objc_enumerationMutation(v39);
              }
              uint64_t v45 = *(void **)(*((void *)&v138 + 1) + 8 * j);
              v46 = [v45 identifier];
              int v47 = [v46 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

              if (v47)
              {
                id v48 = v45;

                uint64_t v42 = v48;
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v138 objects:v148 count:16];
          }
          while (v41);

          if (v42)
          {
            uint64_t v49 = [v42 name];

            char v114 = [v42 isLocalDevice];
            v50 = 0;
            long long v124 = v49;
LABEL_67:
            v61 = &off_264766000;
            goto LABEL_82;
          }
        }
        else
        {
        }
        v67 = [*(id *)(a1 + 32) devices];
        uint64_t v68 = [v67 indexOfObjectPassingTest:&__block_literal_global_251];

        v69 = [*(id *)(a1 + 32) devices];
        v70 = v69;
        v61 = &off_264766000;
        if (v68 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v42 = [v69 firstObject];

          v70 = +[STUILog usage];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4(v42, v70);
          }
        }
        else
        {
          uint64_t v42 = [v69 objectAtIndexedSubscript:v68];
        }

        uint64_t v77 = [v42 identifier];
        uint64_t v78 = *(void *)(*(void *)(a1 + 64) + 8);
        v79 = *(void **)(v78 + 40);
        *(void *)(v78 + 40) = v77;

        [*(id *)(a1 + 32) setSelectedDeviceIdentifier:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        uint64_t v63 = [v42 name];

        char v114 = [v42 isLocalDevice];
      }
      else
      {
        id v59 = [*(id *)(a1 + 32) devices];
        uint64_t v60 = [v59 count];

        v61 = &off_264766000;
        if (v60 != 1)
        {
          uint64_t v42 = 0;
          v50 = 0;
          char v114 = 0;
LABEL_82:
          v80 = [MEMORY[0x263F08A48] mainQueue];
          if ((_os_feature_enabled_impl() ^ 1 | v116)) {
            goto LABEL_97;
          }
          if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {
            int v81 = [v42 hasDeviceActivity];
            v82 = [v42 coreDuetIdentifier];
            if (v81)
            {
              v83 = [v42 identifier];
LABEL_90:
              int v81 = 1;
              goto LABEL_91;
            }
          }
          else
          {
            if (!v123)
            {
              v84 = [v122 localUserDeviceState];
              v85 = [v84 device];
              uint64_t v86 = [v85 identifier];
              uint64_t v87 = *(void *)(*(void *)(a1 + 64) + 8);
              id v88 = *(void **)(v87 + 40);
              *(void *)(v87 + 40) = v86;

              v82 = [v84 coreDuetIdentifier];

              v83 = 0;
              goto LABEL_90;
            }
            int v81 = [MEMORY[0x263F67178] hasDataForUserWithAltDSID:v123 userDeviceStates:v120];
            v82 = 0;
          }
          v83 = 0;
LABEL_91:
          v131[0] = MEMORY[0x263EF8330];
          v131[1] = 3221225472;
          v131[2] = __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_256;
          v131[3] = &unk_264768980;
          v131[4] = *(void *)(a1 + 32);
          id v89 = v82;
          id v132 = v89;
          char v134 = v81;
          char v135 = v114;
          v90 = v124;
          long long v133 = v90;
          char v136 = v121;
          [v80 addOperationWithBlock:v131];
          if (v81)
          {
            uint64_t v91 = objc_opt_new();
            uint64_t v92 = [*(id *)(a1 + 32) usageContext];
            switch(v92)
            {
              case 2:
                [*(id *)(a1 + 32) _loadLastWeekDeviceActivityForUserWithAltDSID:v123 deviceActivityIdentifier:v83 selectedItemDisplayName:v90 referenceDate:v91 completionHandler:*(void *)(a1 + 56)];
                break;
              case 1:
                [*(id *)(a1 + 32) _loadTodayDeviceActivityForUserWithAltDSID:v123 deviceActivityIdentifier:v83 selectedItemDisplayName:v90 referenceDate:v91 completionHandler:*(void *)(a1 + 56)];
                break;
              case 0:
                [*(id *)(a1 + 32) _loadAllHistoricalDeviceActivityForUserWithAltDSID:v123 deviceActivityIdentifier:v83 selectedItemDisplayName:v90 selectedDay:*(void *)(a1 + 72) selectedWeek:*(void *)(a1 + 80) hadUsageData:*(unsigned __int8 *)(a1 + 88) referenceDate:v91 completionHandler:*(void *)(a1 + 56)];
                break;
            }
            v110 = +[STUILog usage];
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v111 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              *(_DWORD *)block = 138543618;
              *(void *)&void block[4] = v123;
              *(_WORD *)&block[12] = 2114;
              *(void *)&block[14] = v111;
              _os_log_impl(&dword_225B06000, v110, OS_LOG_TYPE_DEFAULT, "Rendering usage with Device Activity Data for user: %{public}@ device: %{public}@", block, 0x16u);
            }

            uint64_t v8 = v119;
            id v20 = v14;
LABEL_130:

            id v9 = v118;
            uint64_t v5 = v124;
            id v13 = v115;
            goto LABEL_131;
          }

          v61 = &off_264766000;
LABEL_97:
          v93 = [v61[280] usage];
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v94 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            *(_DWORD *)block = 138543618;
            *(void *)&void block[4] = v123;
            *(_WORD *)&block[12] = 2114;
            *(void *)&block[14] = v94;
            _os_log_impl(&dword_225B06000, v93, OS_LOG_TYPE_DEFAULT, "Rendering usage with Legacy Screen Time Data for user: %{public}@ device: %{public}@", block, 0x16u);
          }

          if (_os_feature_enabled_impl() && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {
            v95 = (void *)MEMORY[0x263F67158];
            uint64_t v96 = [v42 coreDuetIdentifier];
            uint64_t v97 = *(void *)(a1 + 48);
            id v130 = v14;
            uint64_t v98 = [v95 fetchDeviceWithCoreDuetIdentifier:v96 inContext:v97 error:&v130];
            id v99 = v130;

            if (v98)
            {
              v50 = (void *)v98;
            }
            else
            {
              uint64_t v109 = [MEMORY[0x263F671D8] usage];
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
                __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3();
              }

              v50 = 0;
            }
          }
          else
          {
            id v99 = v14;
          }
          uint64_t v100 = objc_opt_new();
          id v89 = (id)v100;
          if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) || v50)
          {
            v104 = *(void **)(a1 + 32);
            id v129 = v99;
            id v105 = [v104 _usageBlocksWithUser:v122 device:v50 error:&v129];
            id v20 = v129;

            uint64_t v106 = [v105 mutableCopy];
            id v89 = (id)v106;
            if (v106) {
              goto LABEL_107;
            }
          }
          else
          {
            id v20 = v99;
            if (v100)
            {
LABEL_107:
              v125[0] = MEMORY[0x263EF8330];
              v125[1] = 3221225472;
              v125[2] = __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_257;
              v125[3] = &unk_2647689A8;
              v125[4] = *(void *)(a1 + 32);
              char v127 = v114;
              v101 = v124;
              long long v126 = v101;
              char v128 = v121;
              [v80 addOperationWithBlock:v125];
              v102 = objc_opt_new();
              uint64_t v103 = [*(id *)(a1 + 32) usageContext];
              switch(v103)
              {
                case 2:
                  [*(id *)(a1 + 32) _loadLastWeekUsageWithUsageBlocks:v89 selectedItemDisplayName:v101 referenceDate:v102 completionHandler:*(void *)(a1 + 56)];
                  break;
                case 1:
                  [*(id *)(a1 + 32) _loadTodayUsageWithUsageBlocks:v89 selectedItemDisplayName:v101 referenceDate:v102 completionHandler:*(void *)(a1 + 56)];
                  break;
                case 0:
                  [*(id *)(a1 + 32) _loadAllHistoricalUsageWithUsageBlocks:v89 selectedItemDisplayName:v101 selectedDay:*(void *)(a1 + 72) selectedWeek:*(void *)(a1 + 80) hadUsageData:*(unsigned __int8 *)(a1 + 88) referenceDate:v102 completionHandler:*(void *)(a1 + 56)];
                  break;
              }

              uint64_t v8 = v119;
              goto LABEL_130;
            }
          }
          uint64_t v107 = +[STUILog usage];
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
            __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2(v107);
          }

          uint64_t v108 = (void (**)(id, id))*(id *)(a1 + 56);
          id v20 = v20;
          uint64_t v8 = v119;
          if (v108)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v108[2](v108, v20);
            }
            else
            {
              *(void *)block = MEMORY[0x263EF8330];
              *(void *)&block[8] = 3221225472;
              *(void *)&block[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
              v152 = &unk_264767628;
              v154 = v108;
              id v153 = v20;
              dispatch_async(MEMORY[0x263EF83A0], block);
            }
          }

          goto LABEL_130;
        }
        v62 = [*(id *)(a1 + 32) devices];
        uint64_t v42 = [v62 firstObject];

        uint64_t v63 = [v42 name];

        char v114 = [v42 isLocalDevice];
        uint64_t v64 = [v42 identifier];
        uint64_t v65 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v66 = *(void **)(v65 + 40);
        *(void *)(v65 + 40) = v64;

        [*(id *)(a1 + 32) setSelectedDeviceIdentifier:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      }
      v50 = 0;
      long long v124 = v63;
      goto LABEL_82;
    }
    if (v33)
    {
      *(_WORD *)block = 0;
      _os_log_impl(&dword_225B06000, v32, OS_LOG_TYPE_DEFAULT, "New usage feature flag is off.", block, 2u);
    }

    uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v51)
    {
      uint64_t v52 = *(void *)(a1 + 48);
      id v137 = v14;
      v50 = [MEMORY[0x263F67158] fetchDeviceWithIdentifier:v51 inContext:v52 error:&v137];
      id v53 = v137;

      if (v50)
      {
        v54 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v55 = [v17 localUserDeviceState];
        v56 = [v55 device];
        id v57 = [v56 identifier];
        LOBYTE(v54) = [v54 isEqualToString:v57];

        char v114 = v11 & v54;
        uint64_t v58 = [v50 name];

        uint64_t v42 = 0;
        long long v124 = v58;
        id v14 = v53;
        goto LABEL_67;
      }
      id v14 = v53;
    }
    if (v121 && (unint64_t)[v30 count] > 1)
    {
      long long v124 = v5;
      uint64_t v42 = 0;
      v50 = 0;
      char v114 = 1;
      goto LABEL_67;
    }
    char v114 = v11;
    if (v11)
    {
      uint64_t v71 = [v17 localUserDeviceState];
      v50 = [v71 device];
    }
    else
    {
      v61 = &off_264766000;
      if (![v30 count]) {
        goto LABEL_74;
      }
      uint64_t v71 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"device.name" ascending:1];
      v147 = v71;
      v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v147 count:1];
      v73 = [v30 sortedArrayUsingDescriptors:v72];

      v74 = [v73 objectAtIndexedSubscript:0];
      v50 = [v74 device];
    }
    v61 = &off_264766000;
    if (v50)
    {
      [v50 name];
      long long v124 = v75 = v5;
LABEL_77:

      uint64_t v76 = [v50 identifier];
      [*(id *)(a1 + 32) setSelectedDeviceIdentifier:v76];

      uint64_t v42 = 0;
      goto LABEL_82;
    }
LABEL_74:
    v75 = [v61[280] usage];
    long long v124 = v5;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)block = 0;
      _os_log_impl(&dword_225B06000, v75, OS_LOG_TYPE_DEFAULT, "No device found for remote user", block, 2u);
    }
    v50 = 0;
    goto LABEL_77;
  }
  uint64_t v18 = +[STUILog usage];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(v18);
  }

  id v19 = (void (**)(id, id))*(id *)(a1 + 56);
  id v20 = v14;
  if (v19)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v19[2](v19, v20);
    }
    else
    {
      *(void *)block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
      v152 = &unk_264767628;
      v154 = v19;
      id v153 = v20;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }

LABEL_131:
}

uint64_t __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_248(uint64_t a1, void *a2)
{
  return [a2 isLocalDevice];
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_256(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewModel];
  [v2 setSelectedCoreDuetIdentifier:*(void *)(a1 + 40)];
  [v2 setHasDeviceActivityData:*(unsigned __int8 *)(a1 + 56)];
  [v2 setLocalDevice:*(unsigned __int8 *)(a1 + 57)];
  [v2 setSelectedItemDisplayName:*(void *)(a1 + 48)];
  [v2 setHasAggregateUsageData:*(unsigned __int8 *)(a1 + 58)];
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_257(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewModel];
  [v2 setLocalDevice:*(unsigned __int8 *)(a1 + 48)];
  [v2 setSelectedItemDisplayName:*(void *)(a1 + 40)];
  [v2 setHasAggregateUsageData:*(unsigned __int8 *)(a1 + 49)];
}

- (void)_loadTodayUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v30 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v36 = 0;
  id v29 = objc_opt_new();
  id v13 = [(STUsageDetailsViewModelCoordinator *)self _usageItemsWithUsageBlocks:v12 lastUpdatedDate:&v36 firstPickupByWeekdayByWeek:v29 referenceDate:v10 usageContext:1];

  id v14 = v36;
  id v15 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v16 = [v15 startOfDayForDate:v10];

  uint64_t v17 = [v15 component:512 fromDate:v16];
  uint64_t v18 = [STUsageReport alloc];
  id v19 = [v29 objectForKeyedSubscript:&unk_26D967468];
  id v20 = [NSNumber numberWithInteger:v17];
  id v21 = [v19 objectForKeyedSubscript:v20];
  uint64_t v22 = [(STUsageReport *)v18 initWithReportType:1 startDate:v16 lastUpdatedDate:v14 firstPickup:v21 usageItems:v13];

  [(STUsageReport *)v22 setDisplayName:v11];
  uint64_t v23 = [MEMORY[0x263F08A48] mainQueue];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __125__STUsageDetailsViewModelCoordinator__loadTodayUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v31[3] = &unk_2647689F8;
  v31[4] = self;
  id v32 = v14;
  id v33 = v13;
  uint64_t v34 = v22;
  id v35 = v30;
  id v24 = v30;
  uint64_t v25 = v22;
  id v26 = v13;
  id v27 = v14;
  [v23 addOperationWithBlock:v31];
}

void __125__STUsageDetailsViewModelCoordinator__loadTodayUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with today's usage", v5, 2u);
  }

  int v3 = [*(id *)(a1 + 32) viewModel];
  [v3 setLastUpdatedDate:*(void *)(a1 + 40)];
  [v3 setRawUsageItems:*(void *)(a1 + 48)];
  [v3 setSelectedDayUsageReport:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)_loadTodayDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = (void *)MEMORY[0x263EFF8F0];
  id v14 = a6;
  id v44 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [v13 currentCalendar];
  uint64_t v18 = [v17 startOfDayForDate:v14];
  uint64_t v19 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v18 endDate:v14];
  id v49 = 0;
  id v20 = +[UsageDetails detailsForUserWithAltDSID:v16 deviceActivityIdentifier:v15 dateInterval:v19 referenceDate:v14 usageContext:1 error:&v49];

  id v21 = v49;
  if (!v20)
  {
    uint64_t v22 = +[STUILog usage];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailsViewModelCoordinator _loadTodayDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:]();
    }
  }
  uint64_t v42 = (void *)v19;
  uint64_t v23 = objc_msgSend(v17, "component:fromDate:", 512, v18, self);
  id v24 = [STUsageReport alloc];
  [v20 lastUpdatedDate];
  uint64_t v25 = v43 = v21;
  id v26 = [v20 firstPickupByWeekdayByWeek];
  id v27 = [v26 objectForKeyedSubscript:&unk_26D967468];
  [NSNumber numberWithInteger:v23];
  uint64_t v28 = (void *)v18;
  id v30 = v29 = v12;
  uint64_t v31 = [v27 objectForKeyedSubscript:v30];
  [v20 usageItems];
  id v32 = v41 = v17;
  id v33 = v24;
  uint64_t v34 = v28;
  id v35 = [(STUsageReport *)v33 initWithReportType:1 startDate:v28 lastUpdatedDate:v25 firstPickup:v31 usageItems:v32];

  [(STUsageReport *)v35 setDisplayName:v44];
  id v36 = [MEMORY[0x263F08A48] mainQueue];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __162__STUsageDetailsViewModelCoordinator__loadTodayDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v45[3] = &unk_264767600;
  v45[4] = v40;
  id v46 = v20;
  int v47 = v35;
  id v48 = v29;
  id v37 = v29;
  __int16 v38 = v35;
  id v39 = v20;
  [v36 addOperationWithBlock:v45];
}

void __162__STUsageDetailsViewModelCoordinator__loadTodayDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with today's device activity", v7, 2u);
  }

  int v3 = [*(id *)(a1 + 32) viewModel];
  uint64_t v4 = [*(id *)(a1 + 40) lastUpdatedDate];
  [v3 setLastUpdatedDate:v4];

  uint64_t v5 = [*(id *)(a1 + 40) usageItems];
  [v3 setRawUsageItems:v5];

  [v3 setSelectedDayUsageReport:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

- (void)_loadLastWeekUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v30 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  id v36 = 0;
  id v14 = [(STUsageDetailsViewModelCoordinator *)self _usageItemsWithUsageBlocks:v12 lastUpdatedDate:&v36 firstPickupByWeekdayByWeek:v13 referenceDate:v10 usageContext:2];

  id v15 = v36;
  id v16 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v17 = [v16 firstWeekday];
  uint64_t v18 = [v16 nextDateAfterDate:v10 matchingUnit:512 value:v17 options:260];

  uint64_t v19 = [STUsageReport alloc];
  id v20 = [v13 objectForKeyedSubscript:&unk_26D967480];
  id v21 = [NSNumber numberWithInteger:v17];
  uint64_t v22 = [v20 objectForKeyedSubscript:v21];
  uint64_t v23 = [(STUsageReport *)v19 initWithReportType:0 startDate:v18 lastUpdatedDate:v15 firstPickup:v22 usageItems:v14];

  [(STUsageReport *)v23 setDisplayName:v11];
  id v24 = [MEMORY[0x263F08A48] mainQueue];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __128__STUsageDetailsViewModelCoordinator__loadLastWeekUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v31[3] = &unk_2647689F8;
  v31[4] = self;
  id v32 = v15;
  id v33 = v14;
  uint64_t v34 = v23;
  id v35 = v30;
  id v25 = v30;
  id v26 = v23;
  id v27 = v14;
  id v28 = v15;
  [v24 addOperationWithBlock:v31];
}

void __128__STUsageDetailsViewModelCoordinator__loadLastWeekUsageWithUsageBlocks_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with last week's usage", v5, 2u);
  }

  int v3 = [*(id *)(a1 + 32) viewModel];
  [v3 setLastUpdatedDate:*(void *)(a1 + 40)];
  [v3 setRawUsageItems:*(void *)(a1 + 48)];
  [v3 setSelectedWeekUsageReport:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)_loadLastWeekDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 referenceDate:(id)a6 completionHandler:(id)a7
{
  id v43 = a7;
  id v12 = (void *)MEMORY[0x263EFF8F0];
  id v13 = a6;
  id v42 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 currentCalendar];
  uint64_t v17 = [v16 firstWeekday];
  uint64_t v18 = [v16 nextDateAfterDate:v13 matchingUnit:512 value:v17 options:260];
  uint64_t v19 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v18 endDate:v13];
  id v49 = 0;
  id v20 = +[UsageDetails detailsForUserWithAltDSID:v15 deviceActivityIdentifier:v14 dateInterval:v19 referenceDate:v13 usageContext:2 error:&v49];

  id v21 = v49;
  if (!v20)
  {
    uint64_t v22 = v19;
    uint64_t v23 = v18;
    id v24 = v16;
    id v25 = +[STUILog usage];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailsViewModelCoordinator _loadLastWeekDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:]();
    }

    id v16 = v24;
    uint64_t v18 = v23;
    uint64_t v19 = v22;
  }
  id v39 = self;
  uint64_t v40 = (void *)v19;
  uint64_t v41 = v16;
  id v26 = [STUsageReport alloc];
  id v27 = [v20 lastUpdatedDate];
  id v28 = [v20 firstPickupByWeekdayByWeek];
  id v29 = [v28 objectForKeyedSubscript:&unk_26D967480];
  id v30 = [NSNumber numberWithInteger:v17];
  uint64_t v31 = [v29 objectForKeyedSubscript:v30];
  id v32 = [v20 usageItems];
  id v33 = [(STUsageReport *)v26 initWithReportType:0 startDate:v18 lastUpdatedDate:v27 firstPickup:v31 usageItems:v32];

  [(STUsageReport *)v33 setDisplayName:v42];
  uint64_t v34 = [MEMORY[0x263F08A48] mainQueue];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __165__STUsageDetailsViewModelCoordinator__loadLastWeekDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke;
  v44[3] = &unk_264768A20;
  v44[4] = v39;
  id v45 = v20;
  id v47 = v21;
  id v48 = v43;
  id v46 = v33;
  id v35 = v21;
  id v36 = v43;
  id v37 = v33;
  id v38 = v20;
  [v34 addOperationWithBlock:v44];
}

void __165__STUsageDetailsViewModelCoordinator__loadLastWeekDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with last week's device activity", v7, 2u);
  }

  int v3 = [*(id *)(a1 + 32) viewModel];
  uint64_t v4 = [*(id *)(a1 + 40) lastUpdatedDate];
  [v3 setLastUpdatedDate:v4];

  uint64_t v5 = [*(id *)(a1 + 40) usageItems];
  [v3 setRawUsageItems:v5];

  [v3 setSelectedWeekUsageReport:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 56));
  }
}

- (void)_loadAllHistoricalUsageWithUsageBlocks:(id)a3 selectedItemDisplayName:(id)a4 selectedDay:(unint64_t)a5 selectedWeek:(unint64_t)a6 hadUsageData:(BOOL)a7 referenceDate:(id)a8 completionHandler:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v38 = a8;
  id v15 = a9;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__7;
  v65[4] = __Block_byref_object_dispose__7;
  id v66 = 0;
  id v16 = objc_opt_new();
  uint64_t v17 = objc_opt_new();
  id v37 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  }
  uint64_t v19 = v14;
  id v36 = v15;
  id v20 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  id v21 = [v13 firstObject];
  uint64_t v22 = [v21 startDate];

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke;
  v50[3] = &unk_264768A48;
  unint64_t v62 = a6;
  BOOL v64 = a7;
  id v35 = v13;
  id v51 = v35;
  uint64_t v52 = self;
  v61 = v65;
  id v23 = v17;
  id v53 = v23;
  id v24 = v38;
  id v54 = v24;
  id v39 = v19;
  id v55 = v39;
  unint64_t v63 = a5;
  id v25 = v16;
  id v56 = v25;
  id v26 = v22;
  id v57 = v26;
  id v27 = v37;
  id v58 = v27;
  id v28 = v18;
  id v59 = v28;
  id v29 = v20;
  id v60 = v29;
  +[STUsageDetailsViewModel _enumerateWeeklyReportStartDatesWithReferenceDate:v24 ascending:0 block:v50];
  id v30 = [MEMORY[0x263F08A48] mainQueue];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_2;
  v42[3] = &unk_264768A70;
  id v31 = v25;
  id v43 = v31;
  id v44 = self;
  id v48 = v65;
  id v32 = v29;
  id v45 = v32;
  id v33 = v27;
  id v46 = v33;
  unint64_t v49 = a6;
  id v34 = v36;
  id v47 = v34;
  [v30 addOperationWithBlock:v42];

  _Block_object_dispose(v65, 8);
}

void __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 120);
  if (*(unsigned char *)(a1 + 136)) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = a3 == 0;
  }
  if (v9 && v8 == a3)
  {
    id v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v12 = [v11 dateByAddingUnit:0x2000 value:-1 toDate:v7 options:0];

    id v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K >= %@", @"startDate", v12];
    id v14 = [*(id *)(a1 + 32) filteredArrayUsingPredicate:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 112) + 8);
    obuint64_t j = *(id *)(v15 + 40);
    id v16 = [*(id *)(a1 + 40) _usageItemsWithUsageBlocks:v14 lastUpdatedDate:&obj firstPickupByWeekdayByWeek:*(void *)(a1 + 48) referenceDate:*(void *)(a1 + 56) usageContext:0];
    objc_storeStrong((id *)(v15 + 40), obj);
    [*(id *)(a1 + 40) _updateWeekAndDayReportsWithUsageItems:v16 weekStartDate:v7 lastUpdatedDate:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) referenceDate:*(void *)(a1 + 56) selectedItemDisplayName:*(void *)(a1 + 64) isSelectedWeek:1 selectedDay:*(void *)(a1 + 128) weekUsageReports:0 dayUsageReports:0 dayUsageReportByWeekdays:0 firstPickupByWeekdayByWeek:*(void *)(a1 + 48)];
    [*(id *)(a1 + 72) addObjectsFromArray:v16];
    [*(id *)(a1 + 32) removeObjectsInArray:v14];
  }
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(*(void *)(a1 + 112) + 8);
    uint64_t v22 = *(void *)(v19 + 40);
    id v20 = (id *)(v19 + 40);
    uint64_t v21 = v22;
    if (v22) {
      id v23 = 0;
    }
    else {
      id v23 = &v28;
    }
    if (!v21) {
      id v28 = 0;
    }
    id v24 = [v17 _usageItemsWithUsageBlocks:v18 lastUpdatedDate:v23 firstPickupByWeekdayByWeek:*(void *)(a1 + 48) referenceDate:*(void *)(a1 + 56) usageContext:0];
    if (!v21) {
      objc_storeStrong(v20, v28);
    }
    id v25 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 0, objc_msgSend(v24, "count"));
    [*(id *)(a1 + 72) insertObjects:v24 atIndexes:v25];
    [*(id *)(a1 + 32) removeAllObjects];
  }
  id v26 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v27 = [v26 dateByAddingUnit:0x2000 value:1 toDate:v7 options:0];

  if ([*(id *)(a1 + 80) compare:v27] == -1) {
    [*(id *)(a1 + 40) _updateWeekAndDayReportsWithUsageItems:*(void *)(a1 + 72) weekStartDate:v7 lastUpdatedDate:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) referenceDate:*(void *)(a1 + 56) selectedItemDisplayName:*(void *)(a1 + 64) isSelectedWeek:v8 == a3 selectedDay:*(void *)(a1 + 128) weekUsageReports:*(void *)(a1 + 88) dayUsageReports:*(void *)(a1 + 96) dayUsageReportByWeekdays:*(void *)(a1 + 104) firstPickupByWeekdayByWeek:*(void *)(a1 + 48)];
  }
  else {
    *a4 = 1;
  }
}

void __171__STUsageDetailsViewModelCoordinator__loadAllHistoricalUsageWithUsageBlocks_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v8 = 134217984;
    uint64_t v9 = v3;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with all historical usage (#items: %lu)", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) viewModel];
  [v4 setLastUpdatedDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [v4 setRawUsageItems:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 48) count])
  {
    [v4 setDayUsageReportByWeekdays:*(void *)(a1 + 48)];
  }
  else
  {
    [v4 setDayUsageReportByWeekdays:0];
    [v4 setSelectedDayUsageReport:0];
  }
  uint64_t v5 = [*(id *)(a1 + 56) count];
  if (v5)
  {
    unint64_t v6 = v5;
    [v4 setWeekUsageReports:*(void *)(a1 + 56)];
    if (*(void *)(a1 + 80) >= v6) {
      [v4 setSelectedWeek:v6 - 1];
    }
  }
  else
  {
    [v4 setWeekUsageReports:0];
    [v4 setSelectedWeekUsageReport:0];
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)_loadAllHistoricalDeviceActivityForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 selectedItemDisplayName:(id)a5 selectedDay:(unint64_t)a6 selectedWeek:(unint64_t)a7 hadUsageData:(BOOL)a8 referenceDate:(id)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v34 = a5;
  id v17 = a9;
  id v18 = a10;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__7;
  v70[4] = __Block_byref_object_dispose__7;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__7;
  v68[4] = __Block_byref_object_dispose__7;
  id v69 = (id)objc_opt_new();
  id v33 = objc_opt_new();
  id v32 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  if (a6 == 0x7FFFFFFFFFFFFFFFLL) {
    id v31 = 0;
  }
  else {
    id v31 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  }
  id v30 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  uint64_t v62 = 0;
  unint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__7;
  id v66 = __Block_byref_object_dispose__7;
  id v67 = 0;
  obuint64_t j = 0;
  id v29 = v15;
  uint64_t v19 = +[UsageDetails earliestUsageDateForUserWithAltDSID:v15 deviceActivityIdentifier:v16 error:&obj];
  objc_storeStrong(&v67, obj);
  if (v19)
  {
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke;
    v44[3] = &unk_264768A98;
    unint64_t v58 = a7;
    BOOL v60 = a8;
    id v45 = v17;
    id v46 = v29;
    id v55 = &v62;
    id v47 = v16;
    id v48 = self;
    id v49 = v34;
    unint64_t v59 = a6;
    id v20 = v33;
    id v50 = v20;
    id v51 = v19;
    id v56 = v70;
    id v57 = v68;
    id v21 = v32;
    id v52 = v21;
    id v53 = v31;
    id v22 = v30;
    id v54 = v22;
    +[STUsageDetailsViewModel _enumerateWeeklyReportStartDatesWithReferenceDate:v45 ascending:0 block:v44];
    id v23 = [MEMORY[0x263F08A48] mainQueue];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_269;
    v35[3] = &unk_264768AC0;
    id v36 = v20;
    id v37 = self;
    uint64_t v41 = v70;
    id v38 = v22;
    id v39 = v21;
    unint64_t v43 = a7;
    id v40 = v18;
    id v42 = &v62;
    [v23 addOperationWithBlock:v35];

    id v24 = v45;
  }
  else
  {
    id v25 = (void *)v63[5];
    id v26 = (void (**)(id, id))v18;
    id v27 = v25;
    if (v26)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v26[2](v26, v27);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_4;
        block[3] = &unk_264767628;
        v74 = v26;
        id v73 = v27;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }

    id v24 = +[STUILog usage];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailsViewModelCoordinator _loadAllHistoricalDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:selectedDay:selectedWeek:hadUsageData:referenceDate:completionHandler:]();
    }
  }

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(v70, 8);
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(unsigned char *)(a1 + 152)) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = a3 == 0;
  }
  uint64_t v46 = *(void *)(a1 + 136);
  if (v8 && *(void *)(a1 + 136) == a3)
  {
    uint64_t v45 = a3;
    uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v11 = [v10 dateByAddingUnit:0x2000 value:-1 toDate:v7 options:0];

    id v12 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v11 endDate:*(void *)(a1 + 32)];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(*(void *)(a1 + 112) + 8);
    obuint64_t j = *(id *)(v16 + 40);
    id v17 = +[UsageDetails detailsForUserWithAltDSID:v13 deviceActivityIdentifier:v14 dateInterval:v12 referenceDate:v15 usageContext:0 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    if (!v17)
    {
      id v40 = +[STUILog usage];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_1();
      }

      *a4 = 1;
      goto LABEL_23;
    }
    id v42 = *(void **)(a1 + 56);
    id v18 = [v17 usageItems];
    [v17 lastUpdatedDate];
    unint64_t v43 = v12;
    uint64_t v19 = v44 = a4;
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 64);
    uint64_t v22 = *(void *)(a1 + 144);
    [v17 firstPickupByWeekdayByWeek];
    id v24 = v23 = v7;
    [v42 _updateWeekAndDayReportsWithUsageItems:v18 weekStartDate:v23 lastUpdatedDate:v19 referenceDate:v20 selectedItemDisplayName:v21 isSelectedWeek:1 selectedDay:v22 weekUsageReports:0 dayUsageReports:0 dayUsageReportByWeekdays:0 firstPickupByWeekdayByWeek:v24];

    id v7 = v23;
    a4 = v44;

    a3 = v45;
  }
  if ([*(id *)(a1 + 72) count]) {
    goto LABEL_14;
  }
  id v11 = [*(id *)(a1 + 80) earlierDate:v7];
  id v25 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v11 endDate:*(void *)(a1 + 32)];
  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 48);
  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v29 = *(void *)(*(void *)(a1 + 112) + 8);
  id v47 = *(id *)(v29 + 40);
  id v30 = +[UsageDetails detailsForUserWithAltDSID:v26 deviceActivityIdentifier:v27 dateInterval:v25 referenceDate:v28 usageContext:0 error:&v47];
  objc_storeStrong((id *)(v29 + 40), v47);
  if (v30)
  {
    uint64_t v31 = [v30 lastUpdatedDate];
    uint64_t v32 = *(void *)(*(void *)(a1 + 120) + 8);
    id v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    uint64_t v34 = [v30 firstPickupByWeekdayByWeek];
    uint64_t v35 = *(void *)(*(void *)(a1 + 128) + 8);
    id v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    id v37 = *(void **)(a1 + 72);
    id v38 = [v30 usageItems];
    [v37 addObjectsFromArray:v38];

LABEL_14:
    id v39 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v11 = [v39 dateByAddingUnit:0x2000 value:1 toDate:v7 options:0];

    if ([*(id *)(a1 + 80) compare:v11] == -1) {
      [*(id *)(a1 + 56) _updateWeekAndDayReportsWithUsageItems:*(void *)(a1 + 72) weekStartDate:v7 lastUpdatedDate:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) referenceDate:*(void *)(a1 + 32) selectedItemDisplayName:*(void *)(a1 + 64) isSelectedWeek:v46 == a3 selectedDay:*(void *)(a1 + 144) weekUsageReports:*(void *)(a1 + 88) dayUsageReports:*(void *)(a1 + 96) dayUsageReportByWeekdays:*(void *)(a1 + 104) firstPickupByWeekdayByWeek:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)];
    }
    else {
      *a4 = 1;
    }
    goto LABEL_23;
  }
  uint64_t v41 = +[STUILog usage];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_2();
  }

  *a4 = 1;
LABEL_23:
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_269(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = +[STUILog usage];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v8 = 134217984;
    uint64_t v9 = v3;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Updating view model with all historical device activity (#items: %lu)", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) viewModel];
  [v4 setLastUpdatedDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [v4 setRawUsageItems:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 48) count])
  {
    [v4 setDayUsageReportByWeekdays:*(void *)(a1 + 48)];
  }
  else
  {
    [v4 setDayUsageReportByWeekdays:0];
    [v4 setSelectedDayUsageReport:0];
  }
  uint64_t v5 = [*(id *)(a1 + 56) count];
  if (v5)
  {
    unint64_t v6 = v5;
    [v4 setWeekUsageReports:*(void *)(a1 + 56)];
    if (*(void *)(a1 + 88) >= v6) {
      [v4 setSelectedWeek:v6 - 1];
    }
  }
  else
  {
    [v4 setWeekUsageReports:0];
    [v4 setSelectedWeekUsageReport:0];
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
}

- (void)_updateWeekAndDayReportsWithUsageItems:(id)a3 weekStartDate:(id)a4 lastUpdatedDate:(id)a5 referenceDate:(id)a6 selectedItemDisplayName:(id)a7 isSelectedWeek:(BOOL)a8 selectedDay:(unint64_t)a9 weekUsageReports:(id)a10 dayUsageReports:(id)a11 dayUsageReportByWeekdays:(id)a12 firstPickupByWeekdayByWeek:(id)a13
{
  BOOL v43 = a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v39 = a6;
  id v20 = a7;
  id v36 = a11;
  id v38 = a13;
  id v21 = a12;
  id v22 = a10;
  id v23 = [[STUsageReport alloc] initWithReportType:0 startDate:v18 lastUpdatedDate:v19 firstPickup:0 usageItems:v17];
  id v37 = v20;
  [(STUsageReport *)v23 setDisplayName:v20];
  [v22 addObject:v23];

  id v24 = [MEMORY[0x263F08A48] mainQueue];
  if (v43)
  {
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke;
    v58[3] = &unk_264767078;
    v58[4] = self;
    unint64_t v59 = v23;
    [v24 addOperationWithBlock:v58];
  }
  id v40 = v23;
  if (v21) {
    id v25 = objc_opt_new();
  }
  else {
    id v25 = 0;
  }
  uint64_t v26 = NSNumber;
  uint64_t v27 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "component:fromDate:", 0x2000, v18));

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_2;
  v45[3] = &unk_264768AE8;
  id v46 = v39;
  id v47 = v19;
  id v48 = v38;
  id v49 = v28;
  id v50 = v17;
  id v51 = v37;
  id v55 = v25;
  unint64_t v56 = a9;
  BOOL v57 = v43;
  id v52 = v36;
  id v53 = v24;
  id v54 = self;
  id v29 = v25;
  id v44 = v24;
  id v30 = v36;
  id v42 = v37;
  id v31 = v17;
  id v32 = v28;
  id v33 = v38;
  id v34 = v19;
  id v35 = v39;
  +[STUsageDetailsViewModel _enumerateDayReportStartDatesWithStartOfWeek:v18 ascending:1 block:v45];
  [v21 addObject:v29];
}

void __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) viewModel];
  [v2 setSelectedWeekUsageReport:v1];
}

void __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = (void *)MEMORY[0x22A63C410]();
  if ([*(id *)(a1 + 32) compare:v5] != -1)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
    int v8 = [STUsageReport alloc];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
    id v11 = [v10 objectForKeyedSubscript:v7];
    id v12 = [(STUsageReport *)v8 initWithReportType:1 startDate:v5 lastUpdatedDate:v9 firstPickup:v11 usageItems:*(void *)(a1 + 64)];

    [(STUsageReport *)v12 setDisplayName:*(void *)(a1 + 72)];
    if (*(void *)(a1 + 112) == a3)
    {
      [*(id *)(a1 + 80) addObject:v12];
      if (*(unsigned char *)(a1 + 120))
      {
        uint64_t v14 = MEMORY[0x263EF8330];
        uint64_t v15 = 3221225472;
        uint64_t v16 = __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_3;
        id v17 = &unk_264767078;
        uint64_t v13 = *(void **)(a1 + 88);
        uint64_t v18 = *(void *)(a1 + 96);
        id v19 = v12;
        [v13 addOperationWithBlock:&v14];
      }
    }
    objc_msgSend(*(id *)(a1 + 104), "setObject:forKeyedSubscript:", v12, v7, v14, v15, v16, v17, v18);
  }
}

void __257__STUsageDetailsViewModelCoordinator__updateWeekAndDayReportsWithUsageItems_weekStartDate_lastUpdatedDate_referenceDate_selectedItemDisplayName_isSelectedWeek_selectedDay_weekUsageReports_dayUsageReports_dayUsageReportByWeekdays_firstPickupByWeekdayByWeek___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) viewModel];
  [v2 setSelectedDayUsageReport:v1];
}

- (STUsageDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSString)selectedDeviceIdentifier
{
  return self->_selectedDeviceIdentifier;
}

- (NSDate)initialUsageFetchDate
{
  return self->_initialUsageFetchDate;
}

- (void)setInitialUsageFetchDate:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
}

- (int64_t)usageContext
{
  return self->_usageContext;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (NSFetchedResultsController)usageFetchedResultsController
{
  return (NSFetchedResultsController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUsageFetchedResultsController:(id)a3
{
}

- (STDebouncer)usageChangeDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)lastUsageDataRefreshTime
{
  return self->_lastUsageDataRefreshTime;
}

- (void)setLastUsageDataRefreshTime:(id)a3
{
}

- (NSTimer)usageDataRefreshTimer
{
  return self->_usageDataRefreshTimer;
}

- (void)setUsageDataRefreshTimer:(id)a3
{
}

- (NSManagedObjectID)currentUsageRequestObjectID
{
  return self->_currentUsageRequestObjectID;
}

- (void)setCurrentUsageRequestObjectID:(id)a3
{
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (void)setRefreshing:(BOOL)a3
{
  self->_refreshing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUsageRequestObjectID, 0);
  objc_storeStrong((id *)&self->_usageDataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_lastUsageDataRefreshTime, 0);
  objc_storeStrong((id *)&self->_usageChangeDebouncer, 0);
  objc_storeStrong((id *)&self->_usageFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_initialUsageFetchDate, 0);
  objc_storeStrong((id *)&self->_selectedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)initWithPersistenceController:organizationIdentifier:userDSID:devices:selectedDeviceIdentifier:selectedUsageReportType:usageContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Unable to setup fetched results controller for usage blocks: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "initForLocalDeviceWithPersistenceController failed to fetch device details from DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initForLocalDeviceWithPersistenceController:selectedUsageReportType:usageContext:managedObjectContext:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "initForLocalDeviceWithPersistenceController Failed to fetch local device: %{public}@. Will default to All Devices", v2, v3, v4, v5, v6);
}

void __70__STUsageDetailsViewModelCoordinator__refreshUsageDataWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to refresh local device activity data: %{public}@", v2, v3, v4, v5, v6);
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch user when creating usage request: %{public}@", v2, v3, v4, v5, v6);
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to create usage request: %{public}@", v2, v3, v4, v5, v6);
}

void __83__STUsageDetailsViewModelCoordinator__refreshLegacyUsageDataWithCompletionHandler___block_invoke_166_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to save usage request: %{public}@", v2, v3, v4, v5, v6);
}

void __60__STUsageDetailsViewModelCoordinator_debouncer_didDebounce___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to load usage view model after usage blocks changed: %{public}@", v2, v3, v4, v5, v6);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_225B06000, log, OS_LOG_TYPE_ERROR, "No users found", v1, 2u);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_225B06000, log, OS_LOG_TYPE_ERROR, "No usage blocks found", v1, 2u);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not find expected device in ST core data: %@. Empty usage will be shown.", v2, v3, v4, v5, v6);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "loadViewModel no localDevice found! Setting to first device found %@", v4, 0xCu);
}

void __73__STUsageDetailsViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_225B06000, v0, OS_LOG_TYPE_FAULT, "More than 1 user found: %@", v1, 0xCu);
}

- (void)_loadTodayDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch toaday's usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_loadLastWeekDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:referenceDate:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch last week's usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_loadAllHistoricalDeviceActivityForUserWithAltDSID:deviceActivityIdentifier:selectedItemDisplayName:selectedDay:selectedWeek:hadUsageData:referenceDate:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch earliest usage date using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch previous week usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

void __208__STUsageDetailsViewModelCoordinator__loadAllHistoricalDeviceActivityForUserWithAltDSID_deviceActivityIdentifier_selectedItemDisplayName_selectedDay_selectedWeek_hadUsageData_referenceDate_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch all usage details using DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

@end