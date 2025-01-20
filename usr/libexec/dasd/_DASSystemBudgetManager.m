@interface _DASSystemBudgetManager
+ (id)identifierWithActivity:(id)a3;
+ (id)involvedProcessesForActivity:(id)a3 withIdentifier:(id)a4;
+ (id)sharedInstance;
- (NSDictionary)budgets;
- (NSMutableSet)remoteActivities;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBudgetModulator)systemBudgetModulator;
- (_DASBudgetPersisting)sharedMemoryPersistence;
- (_DASEnergyUsageTracker)energyUsageTracker;
- (_DASNetworkUsageTracker)networkUsageTracker;
- (_DASSystemBudgetManager)init;
- (double)balanceForBudgetWithName:(id)a3;
- (double)capacityForBudgetWithName:(id)a3;
- (id)allBudgets;
- (id)budgetKeyPathForBudgetName:(id)a3;
- (id)customBANetworkingBudget;
- (id)dataBudgetForActivity:(id)a3;
- (id)defaultSystemCellularBudget;
- (id)defaultSystemEnergyBudget;
- (id)getMissingBudgetsWithExistingBudgets:(id)a3;
- (id)remoteWidgetBudget;
- (id)requiredBudgetNames;
- (os_unfair_lock_s)lock;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)instantiateConfiguredBudgets;
- (void)onBudgetChange:(id)a3;
- (void)postNotificationWithBudget:(id)a3;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityNoLongerRunningWithParameters:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)reportActivityRunningWithParameters:(id)a3;
- (void)reportMetricsForNetworkUsage:(double)a3 forDataBudget:(id)a4 totalUsage:(double)a5 usageInCell:(double)a6 usageInInexpensive:(double)a7 forActivity:(id)a8;
- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setBudgets:(id)a3;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setEnergyUsageTracker:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNetworkUsageTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteActivities:(id)a3;
- (void)setSharedMemoryPersistence:(id)a3;
- (void)setSystemBudgetModulator:(id)a3;
- (void)startTrackingActivity:(id)a3;
- (void)stopTrackingActivity:(id)a3;
- (void)unlocked_instantiateConfiguredBudgets;
- (void)updateBudget:(id)a3;
- (void)updateContextStore:(id)a3;
@end

@implementation _DASSystemBudgetManager

- (void)reportActivityRunningWithParameters:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001118C;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (_DASSystemBudgetManager)init
{
  v38.receiver = self;
  v38.super_class = (Class)_DASSystemBudgetManager;
  v2 = [(_DASSystemBudgetManager *)&v38 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "systemBudgetManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.systemBudgetManagement", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[_DASSharedMemoryBudgetPersistence persistence];
    sharedMemoryPersistence = v2->_sharedMemoryPersistence;
    v2->_sharedMemoryPersistence = (_DASBudgetPersisting *)v9;

    uint64_t v11 = +[_DASNetworkUsageTracker sharedInstance];
    networkUsageTracker = v2->_networkUsageTracker;
    v2->_networkUsageTracker = (_DASNetworkUsageTracker *)v11;

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100040FD4;
    v36[3] = &unk_100175FD0;
    v13 = v2;
    v37 = v13;
    uint64_t v14 = +[_DASEnergyUsageTracker instanceWithReportingHandler:v36];
    energyUsageTracker = v13->_energyUsageTracker;
    v13->_energyUsageTracker = (_DASEnergyUsageTracker *)v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    [(_DASSystemBudgetManager *)v13 instantiateConfiguredBudgets];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000411B0;
    v34[3] = &unk_100175FF8;
    v16 = v13;
    v35 = v16;
    v17 = objc_retainBlock(v34);
    id v18 = v16[3];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000411BC;
    v32[3] = &unk_100176020;
    id v33 = v17;
    v19 = v17;
    [v18 enumerateKeysAndObjectsUsingBlock:v32];
    v20 = [v16[3] allValues];
    v21 = v2->_sharedMemoryPersistence;
    v22 = v2->_queue;
    v23 = +[_DKKnowledgeStore knowledgeStore];
    uint64_t v24 = +[_DASBudgetModulator modulatorForBudgetTypes:@"System" withBudgets:v20 persistence:v21 withQueue:v22 withStore:v23];
    id v25 = v16[4];
    v16[4] = (id)v24;

    [(_DASNetworkUsageTracker *)v2->_networkUsageTracker setModulator:v16[4]];
    v26 = [v16[3] allValues];
    [v16 updateContextStore:v26];

    int out_token = 0;
    v27 = dispatch_get_global_queue(-32768, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000411CC;
    handler[3] = &unk_1001759D0;
    v30 = v16;
    notify_register_dispatch("com.apple.dasd.budgetnotifications", &out_token, v27, handler);
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041308;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3C70 != -1) {
    dispatch_once(&qword_1001C3C70, block);
  }
  v2 = (void *)qword_1001C3C78;

  return v2;
}

- (id)defaultSystemEnergyBudget
{
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x4069000000000000;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_10004147C;
  uint64_t v9 = &unk_100175598;
  v10 = self;
  uint64_t v11 = &v12;
  if (qword_1001C3C80 != -1) {
    dispatch_once(&qword_1001C3C80, &v6);
  }
  double v2 = v13[3];
  os_log_t v3 = +[NSDate now];
  id v4 = +[_DASBudget budgetWithName:@"com.apple.dasd.systemEnergy" capacity:2 allocationType:v3 lastModulatedDate:v2];

  _Block_object_dispose(&v12, 8);

  return v4;
}

- (id)defaultSystemCellularBudget
{
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x4189000000000000;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_1000415EC;
  uint64_t v9 = &unk_100175598;
  v10 = self;
  uint64_t v11 = &v12;
  if (qword_1001C3C88 != -1) {
    dispatch_once(&qword_1001C3C88, &v6);
  }
  double v2 = v13[3];
  os_log_t v3 = +[NSDate now];
  id v4 = +[_DASBudget budgetWithName:@"com.apple.dasd.systemCellular" capacity:1 allocationType:v3 lastModulatedDate:v2];

  _Block_object_dispose(&v12, 8);

  return v4;
}

- (id)customBANetworkingBudget
{
  double v2 = +[NSDate now];
  os_log_t v3 = +[_DASBudget budgetWithName:@"com.apple.dasd.baCellular" capacity:0 allocationType:v2 lastModulatedDate:174762.0];

  return v3;
}

- (id)remoteWidgetBudget
{
  double v2 = +[NSDate now];
  os_log_t v3 = +[_DASBudget budgetWithName:@"com.apple.dasd.remoteWidget" capacity:0 allocationType:v2 lastModulatedDate:750.0];

  return v3;
}

- (id)dataBudgetForActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 clientDataBudgetName];

  budgets = self->_budgets;
  if (v5)
  {
    uint64_t v7 = [v4 clientDataBudgetName];
    id v8 = [(NSDictionary *)budgets objectForKeyedSubscript:v7];
  }
  else
  {
    id v8 = [(NSDictionary *)budgets objectForKeyedSubscript:@"com.apple.dasd.systemCellular"];
  }

  return v8;
}

- (void)instantiateConfiguredBudgets
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004183C;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)unlocked_instantiateConfiguredBudgets
{
  sharedMemoryPersistence = self->_sharedMemoryPersistence;
  id v4 = [(_DASSystemBudgetManager *)self requiredBudgetNames];
  v5 = [(_DASBudgetPersisting *)sharedMemoryPersistence loadBudgetsWithExpectedNames:v4];

  id v6 = (NSDictionary *)objc_alloc_init((Class)NSMutableArray);
  [(NSDictionary *)v6 addObjectsFromArray:v5];
  NSUInteger v7 = [(NSDictionary *)v6 count];
  log = self->_log;
  BOOL v9 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    v10 = "Found stored budgets: %@";
    uint64_t v11 = log;
    uint32_t v12 = 12;
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v10 = "No stored budgets";
    uint64_t v11 = log;
    uint32_t v12 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:
  v13 = [(_DASSystemBudgetManager *)self getMissingBudgetsWithExistingBudgets:v6];
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 addEntriesFromDictionary:v13];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = v6;
  id v16 = [(NSDictionary *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v21 = [v20 name:v26];
        [v14 setObject:v20 forKeyedSubscript:v21];
      }
      id v17 = [(NSDictionary *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  v22 = (NSDictionary *)[v14 copy];
  budgets = self->_budgets;
  self->_budgets = v22;

  uint64_t v24 = self->_log;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = self->_budgets;
    *(_DWORD *)buf = 138412290;
    v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "Loaded + new Budgets: %@", buf, 0xCu);
  }
}

- (id)requiredBudgetNames
{
  return +[NSMutableSet setWithObjects:@"com.apple.dasd.systemEnergy", @"com.apple.dasd.systemCellular", @"com.apple.dasd.baCellular", @"com.apple.dasd.remoteWidget", 0];
}

- (id)getMissingBudgetsWithExistingBudgets:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [(_DASSystemBudgetManager *)self requiredBudgetNames];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint32_t v12 = [v11 name];

        if (v12)
        {
          v13 = [v11 name];
          [v6 removeObject:v13];
        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Skipping adding stored budget without a name", buf, 2u);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v8);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (!v16)
  {
    uint64_t v18 = 0;
    goto LABEL_32;
  }
  id v17 = v16;
  uint64_t v18 = 0;
  uint64_t v19 = *(void *)v29;
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v15);
      }
      v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
      if ([v21 isEqualToString:@"com.apple.dasd.systemEnergy"])
      {
        uint64_t v22 = [(_DASSystemBudgetManager *)self defaultSystemEnergyBudget];
      }
      else if ([v21 isEqualToString:@"com.apple.dasd.systemCellular"])
      {
        uint64_t v22 = [(_DASSystemBudgetManager *)self defaultSystemCellularBudget];
      }
      else if ([v21 isEqualToString:@"com.apple.dasd.baCellular"])
      {
        uint64_t v22 = [(_DASSystemBudgetManager *)self customBANetworkingBudget];
      }
      else
      {
        if (![v21 isEqualToString:@"com.apple.dasd.remoteWidget"]) {
          goto LABEL_26;
        }
        uint64_t v22 = [(_DASSystemBudgetManager *)self remoteWidgetBudget];
      }
      v23 = (void *)v22;

      uint64_t v18 = v23;
LABEL_26:
      [v5 setObject:v18 forKeyedSubscript:v21];
      uint64_t v24 = self->_log;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "Added missing budget: %@", buf, 0xCu);
      }
    }
    id v17 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
  }
  while (v17);
LABEL_32:

  return v5;
}

- (id)budgetKeyPathForBudgetName:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = @"com.apple.dasd.baCellular";
  if ([v3 isEqualToString:@"com.apple.dasd.baCellular"]
    || (CFStringRef v4 = @"com.apple.dasd.remoteWidget",
        [v3 isEqualToString:@"com.apple.dasd.remoteWidget"]))
  {
    v5 = +[NSString stringWithFormat:@"/system/budget/%@", v4];
    id v6 = +[_CDContextualKeyPath keyPathWithKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)postNotificationWithBudget:(id)a3
{
  id v20 = a3;
  [v20 balance];
  double v4 = v3;
  v5 = [v20 name];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.dasd.systemEnergy"];

  if (v6)
  {
    CFStringRef v7 = @"Negative";
    if (v4 > 0.0) {
      CFStringRef v7 = @"Positive";
    }
    id v8 = +[NSString stringWithFormat:@"Energy Budget is %@", v7];
    [v20 balance];
    v10 = +[NSString stringWithFormat:@"Exact budget value is %.0lf", v9];
    uint64_t v11 = +[_DASNotificationManager sharedManager];
    uint32_t v12 = v11;
    v13 = v8;
    id v14 = v10;
    CFStringRef v15 = 0;
  }
  else
  {
    id v16 = [v20 name];
    unsigned int v17 = [v16 isEqualToString:@"com.apple.dasd.systemCellular"];

    if (!v17) {
      goto LABEL_10;
    }
    CFStringRef v18 = @"Negative";
    if (v4 > 0.0) {
      CFStringRef v18 = @"Positive";
    }
    id v8 = +[NSString stringWithFormat:@"Data Budget is %@", v18];
    [v20 balance];
    v10 = +[NSString stringWithFormat:@"Exact budget value is %.1lfMB", v19 * 0.000000953674316];
    uint64_t v11 = +[_DASNotificationManager sharedManager];
    uint32_t v12 = v11;
    CFStringRef v15 = @"network";
    v13 = v8;
    id v14 = v10;
  }
  [v11 postNotificationAtDate:0 withTitle:v13 withTextContent:v14 icon:v15 url:0 expirationDate:0];

LABEL_10:
}

- (void)onBudgetChange:(id)a3
{
  id v4 = a3;
  [v4 balance];
  unsigned int v6 = +[NSNumber numberWithInt:v5 > 0.0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = log;
    uint64_t v9 = [v4 name];
    int v20 = 138412546;
    v21 = v9;
    __int16 v22 = 2114;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating budget status for %@ to %{public}@", (uint8_t *)&v20, 0x16u);
  }
  v10 = +[_CDClientContext userContext];
  uint64_t v11 = [v4 name];
  unsigned int v12 = [v11 isEqualToString:@"com.apple.dasd.systemEnergy"];

  if (v12)
  {
    uint64_t v13 = +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus];
LABEL_7:
    id v16 = (void *)v13;
LABEL_8:
    [v10 setObject:v6 forKeyedSubscript:v16];
    goto LABEL_9;
  }
  id v14 = [v4 name];
  unsigned int v15 = [v14 isEqualToString:@"com.apple.dasd.systemCellular"];

  if (v15)
  {
    uint64_t v13 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
    goto LABEL_7;
  }
  double v19 = [v4 name];
  id v16 = [(_DASSystemBudgetManager *)self budgetKeyPathForBudgetName:v19];

  if (v16) {
    goto LABEL_8;
  }
LABEL_9:

  id v17 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  unsigned int v18 = [v17 BOOLForKey:@"postBudgetNotifications"];

  if (v18) {
    [(_DASSystemBudgetManager *)self postNotificationWithBudget:v4];
  }
}

- (void)updateContextStore:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_DASSystemBudgetManager *)self onBudgetChange:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)involvedProcessesForActivity:(id)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSMutableSet set];
  id v8 = [v6 relatedApplications];
  long long v9 = [v6 involvedProcesses];

  if ([v9 count]) {
    [v7 addObjectsFromArray:v9];
  }
  if ([v8 count]) {
    [v7 addObjectsFromArray:v8];
  }
  if (v5) {
    [v7 addObject:v5];
  }

  return v7;
}

+ (id)identifierWithActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clientName];
  if ([v4 isEqualToString:_DASClientNameXPCActivity]) {
    goto LABEL_5;
  }
  id v5 = [v3 clientName];
  if (([v5 isEqualToString:_DASClientNameBGST] & 1) != 0
    || [v3 delayedStart])
  {

LABEL_5:
    goto LABEL_6;
  }
  long long v10 = [v3 userInfo];
  long long v11 = [v10 objectForKeyedSubscript:kNWEndpointKey];

  if (v11)
  {
    uint64_t v7 = @"nsurlsessiond";
    goto LABEL_18;
  }
LABEL_6:
  id v6 = [v3 bundleId];

  if (v6)
  {
    uint64_t v7 = [v3 bundleId];
    goto LABEL_18;
  }
  if ([v3 pid])
  {
    +[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", [v3 pid]);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      goto LABEL_18;
    }
    id v8 = +[_DASDaemonLogger logForCategory:@"systemBudgetManager"];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000F4BAC(v3);
    }
  }
  long long v9 = +[_DASDaemonLogger logForCategory:@"systemBudgetManager"];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000F4AF8(v3);
  }

  uint64_t v7 = 0;
LABEL_18:

  return v7;
}

- (id)allBudgets
{
  id v3 = +[NSMutableArray array];
  budgets = self->_budgets;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000427A0;
  v8[3] = &unk_100175AE0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)budgets enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v3 = [(NSDictionary *)self->_budgets objectForKeyedSubscript:a3];
  [v3 balance];
  double v5 = v4;

  return v5;
}

- (double)capacityForBudgetWithName:(id)a3
{
  id v3 = [(NSDictionary *)self->_budgets objectForKeyedSubscript:a3];
  [v3 capacity];
  double v5 = v4;

  return v5;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    double v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Set Balance: %.2lf for %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [(NSDictionary *)self->_budgets objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 setBalance:a3];
    [(_DASSystemBudgetManager *)self updateBudget:v9];
  }
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    double v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Decrement budget by: %.2lf for %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [(NSDictionary *)self->_budgets objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 decrementBy:a3];
    [(_DASSystemBudgetManager *)self updateBudget:v9];
  }
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = [(NSDictionary *)self->_budgets objectForKeyedSubscript:a4];
  if (v6)
  {
    id v7 = v6;
    [v6 setCapacity:a3];
    [(_DASSystemBudgetManager *)self updateBudget:v7];
    id v6 = v7;
  }
}

- (void)updateBudget:(id)a3
{
}

- (void)stopTrackingActivity:(id)a3
{
  id v4 = a3;
  [(_DASEnergyUsageTracker *)self->_energyUsageTracker stopTrackingActivity:v4];
  [(_DASNetworkUsageTracker *)self->_networkUsageTracker stopTrackingActivity:v4];
  if (v5 > 0.0)
  {
    double v6 = v5;
    id v7 = [(_DASSystemBudgetManager *)self dataBudgetForActivity:v4];
    [v7 decrementBy:v6];
    [(_DASBudgetPersisting *)self->_sharedMemoryPersistence updateBudget:v7];
    id v8 = +[_DASDaemonLogger logForCategory:@"networkbudgeting"];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218498;
      double v16 = v6;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2114;
      int v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Decremented data budget by %f for activity %@, data budget is now %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  if ([v4 targetDevice] == (id)3)
  {
    uint64_t v9 = [v4 startDate];
    if (v9)
    {
      int v10 = (void *)v9;
      uint64_t v11 = [v4 widgetID];
      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      __int16 v12 = (void *)v11;
      unsigned int v13 = [(NSMutableSet *)self->_remoteActivities containsObject:v4];

      if (v13)
      {
        int v10 = [(NSDictionary *)self->_budgets objectForKeyedSubscript:@"com.apple.dasd.remoteWidget"];
        [v10 decrementBy:1.0];
        [(_DASBudgetPersisting *)self->_sharedMemoryPersistence updateBudget:v10];
        id v14 = +[_DASDaemonLogger logForCategory:@"remoteWidgetsBudget"];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412546;
          double v16 = *(double *)&v4;
          __int16 v17 = 2114;
          id v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Decremented remote widget budget for activity %@, remote budget is now %{public}@", (uint8_t *)&v15, 0x16u);
        }

        [(NSMutableSet *)self->_remoteActivities removeObject:v4];
        goto LABEL_12;
      }
    }
  }
LABEL_13:
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042EA4;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)startTrackingActivity:(id)a3
{
  id v7 = a3;
  [(_DASEnergyUsageTracker *)self->_energyUsageTracker startTrackingActivity:v7];
  [(_DASNetworkUsageTracker *)self->_networkUsageTracker startTrackingActivity:v7];
  if ([v7 targetDevice] == (id)3)
  {
    remoteActivities = self->_remoteActivities;
    if (!remoteActivities)
    {
      double v5 = +[NSMutableSet set];
      id v6 = self->_remoteActivities;
      self->_remoteActivities = v5;

      remoteActivities = self->_remoteActivities;
    }
    [(NSMutableSet *)remoteActivities addObject:v7];
  }
}

- (void)reportActivityRunning:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042FE4;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)reportActivityNoLongerRunningWithParameters:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043088;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004315C;
  block[3] = &unk_100175548;
  id v12 = v7;
  unsigned int v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

- (void)reportMetricsForNetworkUsage:(double)a3 forDataBudget:(id)a4 totalUsage:(double)a5 usageInCell:(double)a6 usageInInexpensive:(double)a7 forActivity:(id)a8
{
  id v11 = a4;
  id v12 = a8;
  id v9 = v12;
  id v10 = v11;
  AnalyticsSendEventLazy();
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDictionary)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
}

- (_DASBudgetModulator)systemBudgetModulator
{
  return self->_systemBudgetModulator;
}

- (void)setSystemBudgetModulator:(id)a3
{
}

- (_DASBudgetPersisting)sharedMemoryPersistence
{
  return self->_sharedMemoryPersistence;
}

- (void)setSharedMemoryPersistence:(id)a3
{
}

- (_DASNetworkUsageTracker)networkUsageTracker
{
  return self->_networkUsageTracker;
}

- (void)setNetworkUsageTracker:(id)a3
{
}

- (_DASEnergyUsageTracker)energyUsageTracker
{
  return self->_energyUsageTracker;
}

- (void)setEnergyUsageTracker:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableSet)remoteActivities
{
  return self->_remoteActivities;
}

- (void)setRemoteActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteActivities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_energyUsageTracker, 0);
  objc_storeStrong((id *)&self->_networkUsageTracker, 0);
  objc_storeStrong((id *)&self->_sharedMemoryPersistence, 0);
  objc_storeStrong((id *)&self->_systemBudgetModulator, 0);
  objc_storeStrong((id *)&self->_budgets, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end