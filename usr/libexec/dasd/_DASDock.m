@interface _DASDock
+ (id)dockManager;
- (BOOL)applicationIsAdmissibleForDockMembership:(id)a3;
- (BOOL)dockDisabled;
- (NSDate)lastActivationInformationUpdateTimestamp;
- (NSDate)lastPolicyUpdateTimestamp;
- (NSDictionary)meanLaunchVersusResumeTimeDeltas;
- (NSMutableDictionary)activeDockAssertions;
- (NSMutableDictionary)applicationActivationCounts;
- (NSMutableDictionary)applicationProcessHandles;
- (NSMutableDictionary)lastFrozenFootprintObservedForApplication;
- (NSMutableDictionary)lastPhysFootprintObservedForApplication;
- (NSSet)dockedApplications;
- (NSSet)excludedApplications;
- (NSSet)springboardVisibleApplications;
- (NSUserDefaults)persistence;
- (OS_os_log)logger;
- (RBSDomainAttribute)domainAttribute;
- (RBSProcessMonitor)processMonitor;
- (_DASDataProtectionStateMonitor)lockStateMonitor;
- (_DASDock)init;
- (double)dockCapacityPercentage;
- (id)admissibleApplications;
- (id)computeOptimalPolicyForApps:(id)a3 withValues:(id)a4 scaledWeights:(id)a5 andMemoryFootprint:(id)a6;
- (id)computePolicyForCurrentState;
- (id)getProcessHandleFromRunningBoardForPid:(int)a3;
- (id)quantizeNumericMap:(id)a3;
- (id)quantizedMaxExpectedTotalActivationTimeForApps:(id)a3;
- (int64_t)frozen_to_swap_index;
- (int64_t)getLedgerCountForProcess:(int)a3;
- (int64_t)phys_footprint_index;
- (unint64_t)getPhysMemSizeInBytes;
- (unsigned)maxDockCapacity;
- (unsigned)weightScaleFactor;
- (void)acquireDockAppAssertionForProcess:(id)a3;
- (void)applyPolicyChangesFrom:(id)a3 to:(id)a4;
- (void)configureMaximumDockCapacity;
- (void)getFootprintsForProcess:(int)a3 physFootprintReference:(int64_t *)a4 frozenFootprintReference:(int64_t *)a5;
- (void)handleDeathForProcess:(id)a3 withDockAssertion:(id)a4;
- (void)handleFailureToAcquireAssertion:(id)a3 forProcess:(id)a4 withError:(id)a5;
- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4;
- (void)initProcessMonitorForDockedApplications;
- (void)initializeLedgerIndices;
- (void)invalidateDockedAppAssertion:(id)a3 forProcess:(id)a4;
- (void)persistApplicationProcessHandles;
- (void)recordState:(id)a3 forProcess:(id)a4 associatedWithApplication:(id)a5;
- (void)refreshApplicationActivationCounts;
- (void)refreshApplicationActivationInformation;
- (void)refreshApplicationSpringboardVisibility;
- (void)refreshLedgerInformationForApplicationProcesses;
- (void)refreshLedgerInformationForProcess:(id)a3;
- (void)registerForTrial;
- (void)removeInactiveAssertions;
- (void)restoreApplicationProcessHandles;
- (void)setActiveDockAssertions:(id)a3;
- (void)setApplicationActivationCounts:(id)a3;
- (void)setApplicationProcessHandles:(id)a3;
- (void)setClassCUnlockMonitor;
- (void)setDefaultExcludedApplications;
- (void)setDockCapacityPercentage:(double)a3;
- (void)setDockDisabled:(BOOL)a3;
- (void)setDockedApplications:(id)a3;
- (void)setDomainAttribute:(id)a3;
- (void)setExcludedApplications:(id)a3;
- (void)setFrozen_to_swap_index:(int64_t)a3;
- (void)setLastActivationInformationUpdateTimestamp:(id)a3;
- (void)setLastFrozenFootprintObservedForApplication:(id)a3;
- (void)setLastPhysFootprintObservedForApplication:(id)a3;
- (void)setLastPolicyUpdateTimestamp:(id)a3;
- (void)setLockStateMonitor:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMaxDockCapacity:(unsigned int)a3;
- (void)setMeanLaunchVersusResumeTimeDeltas:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPhys_footprint_index:(int64_t)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setSpringboardVisibleApplications:(id)a3;
- (void)setWeightScaleFactor:(unsigned int)a3;
- (void)updatePolicy;
- (void)updateTrialParameters;
- (void)zNormalizeArray:(id)a3 intoQuantizedVector:(char *)a4 withScaleFactor:(id)a5;
@end

@implementation _DASDock

- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 bundle];
  v9 = [v8 identifier];

  if (v9 && ![(NSSet *)self->_excludedApplications containsObject:v9])
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FD6A4();
    }
    v10 = [v7 state];
    [(_DASDock *)self recordState:v10 forProcess:v6 associatedWithApplication:v9];
    if ([v10 taskState] == 3) {
      [(_DASDock *)self updatePolicy];
    }
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FD638();
    }
  }
}

- (void)persistApplicationProcessHandles
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = self->_applicationProcessHandles;
  objc_sync_enter(v4);
  applicationProcessHandles = self->_applicationProcessHandles;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008944;
  v8[3] = &unk_1001779D8;
  id v6 = v3;
  id v9 = v6;
  [(NSMutableDictionary *)applicationProcessHandles enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v4);
  id v7 = self->_persistence;
  objc_sync_enter(v7);
  [(NSUserDefaults *)self->_persistence setObject:v6 forKey:@"applicationProcessIdentifiers"];
  objc_sync_exit(v7);
}

- (void)recordState:(id)a3 forProcess:(id)a4 associatedWithApplication:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isRunning])
  {
    v11 = [v8 endowmentNamespaces];
    unsigned int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        sub_1000FD710();
      }
      v13 = self->_applicationProcessHandles;
      objc_sync_enter(v13);
      unsigned int v14 = [v9 pid];
      v15 = [(NSMutableDictionary *)self->_applicationProcessHandles objectForKey:v10];
      unsigned int v16 = [v15 pid];

      if (v14 != v16)
      {
        [(NSMutableDictionary *)self->_applicationProcessHandles setObject:v9 forKey:v10];
        [(_DASDock *)self persistApplicationProcessHandles];
      }
      objc_sync_exit(v13);

      v17 = self;
      objc_sync_enter(v17);
      v18 = [(NSMutableDictionary *)v17->_applicationActivationCounts objectForKey:v10];
      v19 = v18;
      applicationActivationCounts = v17->_applicationActivationCounts;
      if (v18)
      {
        +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 intValue] + 1);
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = &off_1001872A0;
      }
      [(NSMutableDictionary *)applicationActivationCounts setObject:v21 forKey:v10];
      if (v19) {

      }
      objc_sync_exit(v17);
    }
    if ([v8 taskState] == 3) {
      [(_DASDock *)self refreshLedgerInformationForApplicationProcesses];
    }
  }
  else
  {
    v22 = self->_applicationProcessHandles;
    objc_sync_enter(v22);
    [(NSMutableDictionary *)self->_applicationProcessHandles removeObjectForKey:v10];
    [(_DASDock *)self persistApplicationProcessHandles];
    objc_sync_exit(v22);
  }
}

+ (id)dockManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5A1C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4358 != -1) {
    dispatch_once(&qword_1001C4358, block);
  }
  v2 = (void *)qword_1001C4360;

  return v2;
}

- (_DASDock)init
{
  v38.receiver = self;
  v38.super_class = (Class)_DASDock;
  v2 = [(_DASDock *)&v38 init];
  id v3 = v2;
  if (v2)
  {
    v2->_dockDisabled = 0;
    os_log_t v4 = os_log_create("com.apple.aprs", "DASDock");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v4;

    [(_DASDock *)v3 registerForTrial];
    [(_DASDock *)v3 updateTrialParameters];
    if ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0 || v3->_dockDisabled)
    {
      id v6 = v3->_logger;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (v3->_dockDisabled) {
          CFStringRef v7 = @"Trial";
        }
        else {
          CFStringRef v7 = @"Feature flag";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v40 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DASDock disabled by %@.", buf, 0xCu);
      }
    }
    else
    {
      id v9 = v3->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initializing DASDock...", buf, 2u);
      }
      *(void *)&v3->_maxDockCapacity = 0x7A12000000000;
      [(_DASDock *)v3 configureMaximumDockCapacity];
      uint64_t v10 = +[NSDate distantPast];
      lastPolicyUpdateTimestamp = v3->_lastPolicyUpdateTimestamp;
      v3->_lastPolicyUpdateTimestamp = (NSDate *)v10;

      uint64_t v12 = +[NSDate distantPast];
      lastActivationInformationUpdateTimestamp = v3->_lastActivationInformationUpdateTimestamp;
      v3->_lastActivationInformationUpdateTimestamp = (NSDate *)v12;

      unsigned int v14 = (NSSet *)objc_alloc_init((Class)NSSet);
      dockedApplications = v3->_dockedApplications;
      v3->_dockedApplications = v14;

      unsigned int v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      applicationActivationCounts = v3->_applicationActivationCounts;
      v3->_applicationActivationCounts = v16;

      v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      activeDockAssertions = v3->_activeDockAssertions;
      v3->_activeDockAssertions = v18;

      v20 = (NSSet *)objc_alloc_init((Class)NSSet);
      excludedApplications = v3->_excludedApplications;
      v3->_excludedApplications = v20;

      [(_DASDock *)v3 setDefaultExcludedApplications];
      v22 = (NSSet *)objc_alloc_init((Class)NSSet);
      springboardVisibleApplications = v3->_springboardVisibleApplications;
      v3->_springboardVisibleApplications = v22;

      [(_DASDock *)v3 refreshApplicationSpringboardVisibility];
      v24 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
      meanLaunchVersusResumeTimeDeltas = v3->_meanLaunchVersusResumeTimeDeltas;
      v3->_meanLaunchVersusResumeTimeDeltas = v24;

      v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      applicationProcessHandles = v3->_applicationProcessHandles;
      v3->_applicationProcessHandles = v26;

      v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lastPhysFootprintObservedForApplication = v3->_lastPhysFootprintObservedForApplication;
      v3->_lastPhysFootprintObservedForApplication = v28;

      v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lastFrozenFootprintObservedForApplication = v3->_lastFrozenFootprintObservedForApplication;
      v3->_lastFrozenFootprintObservedForApplication = v30;

      uint64_t v32 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"DockApp"];
      domainAttribute = v3->_domainAttribute;
      v3->_domainAttribute = (RBSDomainAttribute *)v32;

      [(_DASDock *)v3 initializeLedgerIndices];
      v34 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.dock.persistence"];
      persistence = v3->_persistence;
      v3->_persistence = v34;

      [(_DASDock *)v3 restoreApplicationProcessHandles];
      [(_DASDock *)v3 initProcessMonitorForDockedApplications];
      uint64_t v36 = objc_opt_new();
      lockStateMonitor = v3->_lockStateMonitor;
      v3->_lockStateMonitor = (_DASDataProtectionStateMonitor *)v36;

      [(_DASDock *)v3 setClassCUnlockMonitor];
    }
  }
  return v3;
}

- (void)registerForTrial
{
  id v3 = +[_DASTrialManager sharedInstance];
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = +[_DASTrialManager sharedInstance];
  os_log_t v4 = [v3 factorWithName:@"APRS_DockDisabled"];
  logger = self->_logger;
  BOOL v6 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      CFStringRef v7 = logger;
      int v15 = 67109120;
      LODWORD(v16) = [v4 BOOLeanValue];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trial: dockDisabled set to %d", (uint8_t *)&v15, 8u);
    }
    self->_dockDisabled = [v4 BOOLeanValue];
  }
  else if (v6)
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load dockDisabled", (uint8_t *)&v15, 2u);
  }
  id v8 = [v3 factorWithName:@"APRS_DockCapacityLevel"];
  id v9 = self->_logger;
  BOOL v10 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      [v8 doubleValue];
      int v15 = 134217984;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: dockCapacityLevel set to %f", (uint8_t *)&v15, 0xCu);
    }
    [v8 doubleValue];
    double v14 = v13;
  }
  else
  {
    double v14 = 10.0;
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load dockCapacityLevel", (uint8_t *)&v15, 2u);
    }
  }
  self->_dockCapacityPercentage = v14;
}

- (void)applyPolicyChangesFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v36;
    *(void *)&long long v11 = 138412290;
    long long v29 = v11;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v14, v29) & 1) == 0)
        {
          logger = v8->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v29;
            uint64_t v41 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Removing %@", buf, 0xCu);
          }
          uint64_t v16 = [(NSMutableDictionary *)v8->_applicationProcessHandles objectForKey:v14];
          v17 = v16;
          if (v16)
          {
            activeDockAssertions = v8->_activeDockAssertions;
            v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v16 pid]);
            v20 = [(NSMutableDictionary *)activeDockAssertions objectForKey:v19];

            if (v20) {
              [(_DASDock *)v8 invalidateDockedAppAssertion:v20 forProcess:v17];
            }
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v10);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v6;
  id v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v24 = *(void *)v32;
    *(void *)&long long v23 = 138412290;
    long long v30 = v23;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        if ((objc_msgSend(v9, "containsObject:", v26, v30, (void)v31) & 1) == 0)
        {
          v27 = [(NSMutableDictionary *)v8->_applicationProcessHandles objectForKey:v26];
          v28 = v8->_logger;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            uint64_t v41 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Adding %@", buf, 0xCu);
          }
          [(_DASDock *)v8 acquireDockAppAssertionForProcess:v27];
        }
      }
      id v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  objc_sync_exit(v8);
  if (os_log_type_enabled((os_log_t)v8->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FD77C();
  }
}

- (void)updatePolicy
{
  id v3 = self->_lastPolicyUpdateTimestamp;
  objc_sync_enter(v3);
  [(NSDate *)self->_lastPolicyUpdateTimestamp timeIntervalSinceNow];
  double v5 = v4;
  objc_sync_exit(v3);

  if (v5 <= -0.25)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FD81C();
    }
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(NSSet *)v6->_dockedApplications copy];
    id v8 = [(_DASDock *)v6 computePolicyForCurrentState];
    if (([v7 isEqualToSet:v8] & 1) == 0)
    {
      [(_DASDock *)v6 applyPolicyChangesFrom:v8 to:v7];
      id v9 = (NSSet *)[v8 copy];
      dockedApplications = v6->_dockedApplications;
      v6->_dockedApplications = v9;
    }
    long long v11 = +[NSDate now];
    lastPolicyUpdateTimestamp = self->_lastPolicyUpdateTimestamp;
    self->_lastPolicyUpdateTimestamp = v11;

    objc_sync_exit(v6);
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FD7E8();
    }
  }
}

- (id)computePolicyForCurrentState
{
  id v3 = [(_DASDock *)self admissibleApplications];
  id v4 = [v3 count];
  if ((unint64_t)v4 < 0xFF)
  {
    id v6 = v4;
    uint64_t v24 = [(_DASDock *)self quantizedMaxExpectedTotalActivationTimeForApps:v3];
    id v25 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
    id v26 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
    id v8 = self;
    objc_sync_enter(v8);
    if (!v6)
    {
LABEL_17:
      objc_sync_exit(v8);

      id v5 = [(_DASDock *)v8 computeOptimalPolicyForApps:v3 withValues:v25 scaledWeights:v26 andMemoryFootprint:v7];

      goto LABEL_18;
    }
    uint64_t v10 = 0;
    unsigned int v11 = v6;
    *(void *)&long long v9 = 138412290;
    long long v23 = v9;
    while (1)
    {
      uint64_t v12 = [v3 objectAtIndex:v10, v23];
      double v13 = [(NSMutableDictionary *)v8->_lastPhysFootprintObservedForApplication objectForKey:v12];
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = (uint64_t)[v13 unsignedIntValue];
        if (!v15)
        {
          logger = v8->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v28 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Observed a process footprint of zero bytes: %@", buf, 0xCu);
          }
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v15 = 0xFFFFFFFFLL;
      }
      v17 = +[NSNumber numberWithUnsignedInt:v15 / v8->_weightScaleFactor];
      [v26 setObject:v17 atIndexedSubscript:v10];

      v18 = +[NSNumber numberWithUnsignedInt:v15];
      [v7 setObject:v18 atIndexedSubscript:v10];

      uint64_t v19 = [v24 objectForKey:v12];
      v20 = (void *)v19;
      if (v19) {
        id v21 = (_UNKNOWN **)v19;
      }
      else {
        id v21 = &off_1001872B8;
      }
      [v25 setObject:v21 atIndexedSubscript:v10];

LABEL_16:
      if (v11 <= ++v10) {
        goto LABEL_17;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FD850();
  }
  id v5 = objc_alloc_init((Class)NSSet);
LABEL_18:

  return v5;
}

- (id)computeOptimalPolicyForApps:(id)a3 withValues:(id)a4 scaledWeights:(id)a5 andMemoryFootprint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)NSMutableSet);
  if ((unint64_t)[v10 count] > 1)
  {
    p_maxDockCapacity = &self->_maxDockCapacity;
    uint64_t v16 = self->_maxDockCapacity / self->_weightScaleFactor;
    v17 = objc_alloc_init(_DASKnapsackSolver);
    id v18 = objc_alloc_init((Class)NSSet);
    id v19 = [objc_alloc((Class)NSSet) initWithObjects:&off_1001872D0, 0];
    v20 = +[NSNumber numberWithUnsignedInt:v16];
    id v21 = v12;
    id v22 = v17;
    v43 = v21;
    long long v23 = -[_DASKnapsackSolver solveKnapsackWithCapacity:forItemWeights:andItemValues:](v17, "solveKnapsackWithCapacity:forItemWeights:andItemValues:", v20);

    v42 = v23;
    if ([v23 isEqualToSet:v19])
    {
      uint64_t v24 = v22;
      id v12 = v43;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        sub_1000FD884();
      }
    }
    else if ([v23 isEqualToSet:v18])
    {
      uint64_t v24 = v22;
      id v12 = v43;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        sub_1000FD8B8();
      }
    }
    else
    {
      id v36 = v19;
      long long v37 = self;
      id v38 = v18;
      v39 = v22;
      id v40 = v11;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v25 = v23;
      id v26 = [v25 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v26)
      {
        id v27 = v26;
        LODWORD(v28) = 0;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = [*(id *)(*((void *)&v44 + 1) + 8 * i) unsignedShortValue];
            long long v32 = [v10 objectAtIndex:v31];
            [v14 addObject:v32];

            long long v33 = [v13 objectAtIndex:v31];
            uint64_t v28 = [v33 unsignedIntValue] + v28;
          }
          id v27 = [v25 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v27);
      }
      else
      {
        uint64_t v28 = 0;
      }

      logger = v37->_logger;
      uint64_t v24 = v39;
      id v11 = v40;
      id v12 = v43;
      id v18 = v38;
      id v19 = v36;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
        sub_1000FD8EC(logger, v28, p_maxDockCapacity);
      }
    }
    id v15 = [v14 copy];
  }
  else
  {
    id v15 = v14;
  }

  return v15;
}

- (id)admissibleApplications
{
  [(_DASDock *)self refreshApplicationActivationInformation];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = self;
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableDictionary *)v4->_applicationProcessHandles allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(_DASDock *)v4 applicationIsAdmissibleForDockMembership:v9]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  id v10 = [v3 copy];

  return v10;
}

- (BOOL)applicationIsAdmissibleForDockMembership:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_applicationProcessHandles objectForKey:v4];

  id v6 = [(NSMutableDictionary *)self->_lastPhysFootprintObservedForApplication objectForKey:v4];
  uint64_t v7 = v6;
  if (v6) {
    BOOL v23 = (uint64_t)[v6 longValue] > 0;
  }
  else {
    BOOL v23 = 0;
  }
  id v8 = [(NSMutableDictionary *)self->_applicationActivationCounts objectForKey:v4];

  uint64_t v9 = [(NSMutableDictionary *)self->_lastFrozenFootprintObservedForApplication objectForKey:v4];
  id v10 = [v9 longValue];

  unsigned int v11 = [(NSSet *)self->_excludedApplications containsObject:v4];
  unsigned int v12 = [(NSSet *)self->_springboardVisibleApplications containsObject:v4];
  springboardVisibleApplications = self->_springboardVisibleApplications;
  id v14 = objc_alloc_init((Class)NSSet);
  BOOL v15 = ![(NSSet *)springboardVisibleApplications isEqualToSet:v14]
     && self->_springboardVisibleApplications != 0;
  id v22 = v5;
  BOOL v16 = v5 != 0;

  if ((uint64_t)v10 > 0) {
    int v17 = 1;
  }
  else {
    int v17 = v11;
  }
  int v18 = v16 & ~(v17 | v15 & ~v12) & v23;
  if (v8) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 0;
  }
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111682;
    BOOL v25 = v19;
    __int16 v26 = 1024;
    BOOL v27 = v22 != 0;
    __int16 v28 = 1024;
    BOOL v29 = v23;
    __int16 v30 = 1024;
    BOOL v31 = v8 != 0;
    __int16 v32 = 1024;
    BOOL v33 = (uint64_t)v10 > 0;
    __int16 v34 = 1024;
    unsigned int v35 = v11;
    __int16 v36 = 1024;
    int v37 = v15 & ~v12;
    __int16 v38 = 1024;
    unsigned int v39 = v12;
    __int16 v40 = 1024;
    BOOL v41 = v15;
    __int16 v42 = 2112;
    CFStringRef v43 = @"111000(00|10|11)";
    __int16 v44 = 2112;
    id v45 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)logger, OS_LOG_TYPE_DEBUG, "Admissible: %d, Flags: %d%d%d%d%d%d%d%d %@, %@", buf, 0x4Cu);
  }

  return v19;
}

- (void)refreshApplicationActivationInformation
{
  obj = self;
  objc_sync_enter(obj);
  v2 = +[NSDate now];
  [(NSDate *)obj->_lastActivationInformationUpdateTimestamp timeIntervalSinceNow];
  if (v3 <= -3600.0)
  {
    [(_DASDock *)obj refreshApplicationActivationCounts];
    [(_DASDock *)obj refreshApplicationSpringboardVisibility];
    id v4 = +[_APRSBiomeEventAnalyzer sharedInstance];
    uint64_t v5 = [v4 meanDeltaTimeBetweenColdLaunchAndResume];
    meanLaunchVersusResumeTimeDeltas = obj->_meanLaunchVersusResumeTimeDeltas;
    obj->_meanLaunchVersusResumeTimeDeltas = (NSDictionary *)v5;

    objc_storeStrong((id *)&obj->_lastActivationInformationUpdateTimestamp, v2);
  }

  objc_sync_exit(obj);
}

- (void)refreshApplicationActivationCounts
{
  id v4 = +[NSDate date];
  uint64_t v5 = [v4 dateByAddingTimeInterval:-172800.0];
  id v6 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v4];
  uint64_t v7 = +[_DKSystemEventStreams appInFocusStream];
  id v8 = +[NSPredicate predicateWithValue:1];
  uint64_t v9 = +[_DKHistogramQuery histogramQueryForStream:v7 interval:v6 withPredicate:v8];

  id v10 = +[_DKKnowledgeStore knowledgeStore];
  id v18 = 0;
  unsigned int v11 = [v10 executeQuery:v9 error:&v18];
  id v12 = v18;

  if (v12)
  {
    logger = self->_logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Error obtaining results for app usage history: %@", buf, 0xCu);
    }
  }
  id v14 = [v11 countDictionary];

  BOOL v15 = self;
  objc_sync_enter(v15);
  if (v14)
  {
    BOOL v16 = (NSMutableDictionary *)[v14 mutableCopy];
  }
  else
  {
    if (v15->_applicationActivationCounts) {
      goto LABEL_8;
    }
    BOOL v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  applicationActivationCounts = v15->_applicationActivationCounts;
  v15->_applicationActivationCounts = v16;

LABEL_8:
  objc_sync_exit(v15);
}

- (void)refreshApplicationSpringboardVisibility
{
  double v3 = self->_springboardVisibleApplications;
  objc_sync_enter(v3);
  id v4 = (NSSet *)SBSCopyDisplayIdentifiers();
  springboardVisibleApplications = self->_springboardVisibleApplications;
  self->_springboardVisibleApplications = v4;

  id v6 = self->_springboardVisibleApplications;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSSet);
    unsigned int v8 = [(NSSet *)v6 isEqualToSet:v7];

    if (v8)
    {
      logger = self->_logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        id v10 = "Warning: SBSCopyDisplayIdentifiers returned an empty set";
        unsigned int v11 = (uint8_t *)&v12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Warning: SBSCopyDisplayIdentifiers returned nil";
      unsigned int v11 = buf;
      goto LABEL_7;
    }
  }
  objc_sync_exit(v3);
}

- (id)quantizedMaxExpectedTotalActivationTimeForApps:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = self;
  objc_sync_enter(v6);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        __int16 v12 = -[NSMutableDictionary objectForKey:](v6->_applicationActivationCounts, "objectForKey:", v11, (void)v22);
        [v12 floatValue];
        float v14 = v13;

        BOOL v15 = [(NSDictionary *)v6->_meanLaunchVersusResumeTimeDeltas objectForKey:v11];
        [v15 floatValue];
        float v17 = v16;

        *(float *)&double v18 = v14 * fminf(fmaxf(v17, 1.0), 20000.0);
        BOOL v19 = +[NSNumber numberWithFloat:v18];
        [v5 setObject:v19 forKey:v11];
      }
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  id v20 = [(_DASDock *)v6 quantizeNumericMap:v5];

  return v20;
}

- (id)quantizeNumericMap:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allValues];
  id v6 = [v5 count];
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1000A7750;
  long long v22 = sub_1000A7760;
  id v23 = 0;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v6];
  id v8 = (void *)v19[5];
  v19[5] = (uint64_t)v7;

  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  float v17 = 0;
  float v17 = malloc_type_calloc((size_t)v6, 1uLL, 0x100004077774924uLL);
  uint64_t v9 = v15[3];
  if (v9)
  {
    [(_DASDock *)self zNormalizeArray:v5 intoQuantizedVector:v9 withScaleFactor:&off_1001872E8];
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A7768;
    v12[3] = &unk_100177960;
    v12[4] = &v14;
    v12[5] = v13;
    v12[6] = &v18;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];
    free((void *)v15[3]);
    id v10 = [(id)v19[5] copy];
    _Block_object_dispose(v13, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_1000FD9FC();
    }
    id v10 = [(id)v19[5] copy];
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (void)zNormalizeArray:(id)a3 intoQuantizedVector:(char *)a4 withScaleFactor:(id)a5
{
  id v8 = a3;
  [a5 floatValue];
  float v10 = v9;
  unint64_t v11 = (unint64_t)[v8 count];
  __int16 v12 = (float *)malloc_type_malloc(4 * v11, 0x100004052888210uLL);
  if (v12)
  {
    float v13 = v12;
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        BOOL v15 = [v8 objectAtIndex:i];
        [v15 floatValue];
        v13[i] = v16;
      }
      uint64_t v17 = 0;
      float v18 = 0.0;
      do
        float v18 = v18 + v13[v17++];
      while (v11 != v17);
      float v19 = v18 / (float)v11;
      float v20 = 0.0;
      id v21 = v13;
      unint64_t v22 = v11;
      do
      {
        float v23 = *v21++;
        float v20 = v20 + (float)((float)(v23 - v19) * (float)(v23 - v19));
        --v22;
      }
      while (v22);
      float v24 = sqrtf(v20 / (float)v11);
      long long v25 = v13;
      do
      {
        float v26 = *v25++;
        float v27 = v10 * (float)((float)(v26 - v19) / v24);
        float v28 = fabsf(v27);
        float v29 = -127.0;
        if (v27 >= 127.0) {
          float v29 = 127.0;
        }
        if (v28 >= 127.0) {
          float v27 = v29;
        }
        *a4++ = (int)v27 ^ 0x80;
        --v11;
      }
      while (v11);
    }
    free(v13);
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    sub_1000FDA3C();
  }
}

- (void)acquireDockAppAssertionForProcess:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 pid];
    id v7 = self->_activeDockAssertions;
    objc_sync_enter(v7);
    activeDockAssertions = self->_activeDockAssertions;
    float v9 = +[NSNumber numberWithInt:v6];
    float v10 = [(NSMutableDictionary *)activeDockAssertions objectForKey:v9];

    if ([v10 isValid])
    {
      objc_sync_exit(v7);
    }
    else
    {
      unint64_t v11 = +[RBSTarget targetWithPid:v6];
      id v12 = objc_alloc((Class)RBSAssertion);
      domainAttribute = self->_domainAttribute;
      uint64_t v13 = +[NSArray arrayWithObjects:&domainAttribute count:1];
      id v14 = [v12 initWithExplanation:@"DAS: Application is docked." target:v11 attributes:v13];

      id v31 = 0;
      LOBYTE(v13) = [v14 acquireWithError:&v31];
      id v15 = v31;
      if (v13)
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
          sub_1000FDB30();
        }
        float v24 = _NSConcreteStackBlock;
        uint64_t v25 = 3221225472;
        float v26 = sub_1000A7CCC;
        float v27 = &unk_100177988;
        float v28 = self;
        id v29 = v5;
        id v16 = v14;
        id v30 = v16;
        [v29 monitorForDeath:&v24];
        uint64_t v17 = self->_activeDockAssertions;
        float v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6, v24, v25, v26, v27, v28);
        [(NSMutableDictionary *)v17 setObject:v16 forKey:v18];
      }
      else
      {
        [(_DASDock *)self handleFailureToAcquireAssertion:v14 forProcess:v5 withError:v15];
      }
      id v19 = [(NSMutableDictionary *)self->_activeDockAssertions count];

      objc_sync_exit(v7);
      float v20 = [v5 bundle];
      id v21 = [v20 identifier];

      if (v21)
      {
        unint64_t v22 = +[_APRSMetricRecorder sharedInstance];
        [v22 startLoggingForApp:v21 pid:[v5 pid] forEvent:1];
      }
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
        sub_1000FDA7C(logger, (uint64_t)v19);
      }

      float v10 = v14;
    }
  }
}

- (void)handleDeathForProcess:(id)a3 withDockAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_activeDockAssertions;
  objc_sync_enter(v8);
  activeDockAssertions = self->_activeDockAssertions;
  float v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 pid]);
  unint64_t v11 = [(NSMutableDictionary *)activeDockAssertions objectForKey:v10];

  if ([v11 isValid])
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FDB98();
    }
    [(_DASDock *)self invalidateDockedAppAssertion:v11 forProcess:v6];
  }

  objc_sync_exit(v8);
  id v12 = [v6 bundle];
  uint64_t v13 = [v12 identifier];

  if (v13)
  {
    id v14 = self->_applicationProcessHandles;
    objc_sync_enter(v14);
    [(NSMutableDictionary *)self->_applicationProcessHandles removeObjectForKey:v13];
    [(_DASDock *)self persistApplicationProcessHandles];
    objc_sync_exit(v14);
  }
  [(_DASDock *)self removeInactiveAssertions];
  [(_DASDock *)self updatePolicy];
}

- (void)removeInactiveAssertions
{
  double v3 = self->_activeDockAssertions;
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_activeDockAssertions allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        float v9 = [(NSMutableDictionary *)self->_activeDockAssertions objectForKey:v8];
        float v10 = v9;
        if (!v9 || ([v9 isValid] & 1) == 0) {
          [(NSMutableDictionary *)self->_activeDockAssertions removeObjectForKey:v8];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)handleFailureToAcquireAssertion:(id)a3 forProcess:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)logger, OS_LOG_TYPE_ERROR, "Failed to acquire assertion %@ for process %@ with error %@", (uint8_t *)&v19, 0x20u);
  }
  long long v12 = [v9 bundle];
  long long v13 = [v12 identifier];

  if (v13)
  {
    long long v14 = self->_applicationProcessHandles;
    objc_sync_enter(v14);
    id v15 = [(NSMutableDictionary *)self->_applicationProcessHandles objectForKey:v13];
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 currentState];
      unsigned __int8 v18 = [v17 isRunning];

      if ((v18 & 1) == 0)
      {
        [(NSMutableDictionary *)self->_applicationProcessHandles removeObjectForKey:v13];
        [(_DASDock *)self persistApplicationProcessHandles];
      }
    }

    objc_sync_exit(v14);
  }
}

- (void)invalidateDockedAppAssertion:(id)a3 forProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_activeDockAssertions;
  objc_sync_enter(v8);
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FDC04();
  }
  [v6 invalidate];
  activeDockAssertions = self->_activeDockAssertions;
  id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]);
  [(NSMutableDictionary *)activeDockAssertions removeObjectForKey:v10];

  long long v11 = [v7 bundle];
  long long v12 = [v11 identifier];

  if (v12)
  {
    long long v13 = +[_APRSMetricRecorder sharedInstance];
    [v13 endEventForApp:v12 pid:[v7 pid] forEvent:1];
  }
  objc_sync_exit(v8);
}

- (void)initProcessMonitorForDockedApplications
{
  double v3 = +[RBSProcessStateDescriptor descriptor];
  [v3 setValues:1];
  [v3 setEndowmentNamespaces:&off_100187AB0];
  +[RBSProcessPredicate predicateMatchingProcessTypeApplication];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A83D8;
  v8[3] = &unk_1001779B0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v3;
  id v10 = v5;
  long long v11 = self;
  id v6 = +[RBSProcessMonitor monitorWithConfiguration:v8];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v6;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FDC6C();
  }
}

- (id)getProcessHandleFromRunningBoardForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:");
  if (!v5)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FDD6C(logger);
    }
  }
  id v11 = 0;
  id v7 = +[RBSProcessHandle handleForIdentifier:v5 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    id v9 = self->_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000FDCA0(v9, v3, (uint64_t)v8);
    }
  }

  return v7;
}

- (void)initializeLedgerIndices
{
  *(int64x2_t *)&self->_phys_footprint_index = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  getpid();
  ledger();
  uint64_t v3 = malloc_type_malloc(0, 0x1000040565EDBD2uLL);
  if (v3)
  {
    id v4 = v3;
    ledger();
    free(v4);
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
  {
    sub_1000FDE14();
  }
}

- (int64_t)getLedgerCountForProcess:(int)a3
{
  if ((ledger() & 0x80000000) == 0) {
    return 0;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FDE48(logger);
  }
  return 0;
}

- (void)getFootprintsForProcess:(int)a3 physFootprintReference:(int64_t *)a4 frozenFootprintReference:(int64_t *)a5
{
  int64_t v8 = -[_DASDock getLedgerCountForProcess:](self, "getLedgerCountForProcess:");
  id v9 = malloc_type_malloc(48 * v8, 0xC9E76426uLL);
  if (self->_frozen_to_swap_index >= v8 || self->_phys_footprint_index >= v8 || (ledger() & 0x80000000) != 0)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FDEF0(logger);
    }
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v10 = v9[6 * self->_frozen_to_swap_index];
    int64_t v11 = v9[6 * self->_phys_footprint_index];
  }
  free(v9);
  if (a4) {
    *a4 = v11;
  }
  if (a5) {
    *a5 = v10;
  }
}

- (void)refreshLedgerInformationForProcess:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pid];
  id v6 = [v4 bundle];
  id v7 = [v6 identifier];

  if (v7)
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    [(_DASDock *)self getFootprintsForProcess:v5 physFootprintReference:&v15 frozenFootprintReference:&v14];
    int64_t v8 = self->_lastFrozenFootprintObservedForApplication;
    objc_sync_enter(v8);
    lastFrozenFootprintObservedForApplication = self->_lastFrozenFootprintObservedForApplication;
    int64_t v10 = +[NSNumber numberWithLongLong:v14];
    [(NSMutableDictionary *)lastFrozenFootprintObservedForApplication setObject:v10 forKey:v7];

    objc_sync_exit(v8);
    int64_t v11 = self->_lastFrozenFootprintObservedForApplication;
    objc_sync_enter(v11);
    lastPhysFootprintObservedForApplication = self->_lastPhysFootprintObservedForApplication;
    long long v13 = +[NSNumber numberWithLongLong:v15];
    [(NSMutableDictionary *)lastPhysFootprintObservedForApplication setObject:v13 forKey:v7];

    objc_sync_exit(v11);
  }
}

- (void)refreshLedgerInformationForApplicationProcesses
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_applicationProcessHandles copy];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A8AD4;
  v4[3] = &unk_1001779D8;
  v4[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];

  objc_sync_exit(v2);
}

- (unint64_t)getPhysMemSizeInBytes
{
  size_t v7 = 8;
  unint64_t v8 = 0;
  int v3 = sysctlbyname("hw.memsize", &v8, &v7, 0, 0);
  if (v3)
  {
    int v4 = v3;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
      sub_1000FDF98(logger, v4);
    }
  }
  return v8;
}

- (void)configureMaximumDockCapacity
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.dock"];
  int v4 = [v3 objectForKey:@"DockCapacityPercentage"];
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    float v7 = v6;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FE104(logger, v7);
    }
  }
  else
  {
    id v9 = self->_logger;
    float v7 = 10.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000FE060(v9);
    }
  }
  unint64_t v10 = [(_DASDock *)self getPhysMemSizeInBytes];
  if (v10)
  {
    float v11 = fminf(v7, 100.0);
    if (v11 >= 0.0) {
      float v12 = v11 / 100.0;
    }
    else {
      float v12 = 0.0;
    }
    long long v13 = self;
    objc_sync_enter(v13);
    v13->_uint64_t maxDockCapacity = fminf(v12 * (float)v10, 4295000000.0);
    objc_sync_exit(v13);

    float v14 = v12 * 100.0;
  }
  else
  {
    float v14 = 0.0;
  }
  uint64_t v15 = self->_logger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t maxDockCapacity = self->_maxDockCapacity;
    uint64_t v17 = v15;
    unsigned __int8 v18 = +[NSNumber numberWithUnsignedInt:maxDockCapacity];
    int v19 = +[NSNumber numberWithUnsignedLongLong:v10];
    *(float *)&double v20 = v14;
    __int16 v21 = +[NSNumber numberWithFloat:v20];
    int v22 = 138412802;
    __int16 v23 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    __int16 v26 = 2112;
    float v27 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Max capacity: %@ bytes, PhysMemSize: %@ bytes, Capacity percentage: %@ percent", (uint8_t *)&v22, 0x20u);
  }
}

- (void)restoreApplicationProcessHandles
{
  id v3 = self->_persistence;
  objc_sync_enter(v3);
  int v4 = [(NSUserDefaults *)self->_persistence valueForKey:@"applicationProcessIdentifiers"];
  objc_sync_exit(v3);

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A8EB8;
    v5[3] = &unk_100175498;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

- (void)setClassCUnlockMonitor
{
  if (![(_DASDataProtectionStateMonitor *)self->_lockStateMonitor unnotifiedIsDataAvailableForClassC])
  {
    objc_initWeak(&location, self);
    lockStateMonitor = self->_lockStateMonitor;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000A908C;
    v4[3] = &unk_100175430;
    objc_copyWeak(&v5, &location);
    [(_DASDataProtectionStateMonitor *)lockStateMonitor setChangeHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)setDefaultExcludedApplications
{
  self->_excludedApplications = +[NSSet setWithArray:&off_100187AC8];

  _objc_release_x1();
}

- (NSMutableDictionary)lastFrozenFootprintObservedForApplication
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastFrozenFootprintObservedForApplication:(id)a3
{
}

- (NSMutableDictionary)lastPhysFootprintObservedForApplication
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastPhysFootprintObservedForApplication:(id)a3
{
}

- (NSMutableDictionary)applicationProcessHandles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationProcessHandles:(id)a3
{
}

- (NSMutableDictionary)activeDockAssertions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveDockAssertions:(id)a3
{
}

- (NSMutableDictionary)applicationActivationCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationActivationCounts:(id)a3
{
}

- (NSDictionary)meanLaunchVersusResumeTimeDeltas
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMeanLaunchVersusResumeTimeDeltas:(id)a3
{
}

- (NSDate)lastActivationInformationUpdateTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastActivationInformationUpdateTimestamp:(id)a3
{
}

- (NSDate)lastPolicyUpdateTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastPolicyUpdateTimestamp:(id)a3
{
}

- (NSSet)dockedApplications
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDockedApplications:(id)a3
{
}

- (NSSet)excludedApplications
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExcludedApplications:(id)a3
{
}

- (NSSet)springboardVisibleApplications
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSpringboardVisibleApplications:(id)a3
{
}

- (_DASDataProtectionStateMonitor)lockStateMonitor
{
  return (_DASDataProtectionStateMonitor *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLockStateMonitor:(id)a3
{
}

- (NSUserDefaults)persistence
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPersistence:(id)a3
{
}

- (RBSDomainAttribute)domainAttribute
{
  return (RBSDomainAttribute *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDomainAttribute:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 136, 1);
}

- (void)setProcessMonitor:(id)a3
{
}

- (int64_t)phys_footprint_index
{
  return self->_phys_footprint_index;
}

- (void)setPhys_footprint_index:(int64_t)a3
{
  self->_phys_footprint_index = a3;
}

- (int64_t)frozen_to_swap_index
{
  return self->_frozen_to_swap_index;
}

- (void)setFrozen_to_swap_index:(int64_t)a3
{
  self->_frozen_to_swap_index = a3;
}

- (unsigned)maxDockCapacity
{
  return self->_maxDockCapacity;
}

- (void)setMaxDockCapacity:(unsigned int)a3
{
  self->_uint64_t maxDockCapacity = a3;
}

- (unsigned)weightScaleFactor
{
  return self->_weightScaleFactor;
}

- (void)setWeightScaleFactor:(unsigned int)a3
{
  self->_weightScaleFactor = a3;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLogger:(id)a3
{
}

- (BOOL)dockDisabled
{
  return self->_dockDisabled;
}

- (void)setDockDisabled:(BOOL)a3
{
  self->_dockDisabled = a3;
}

- (double)dockCapacityPercentage
{
  return self->_dockCapacityPercentage;
}

- (void)setDockCapacityPercentage:(double)a3
{
  self->_dockCapacityPercentage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_domainAttribute, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_springboardVisibleApplications, 0);
  objc_storeStrong((id *)&self->_excludedApplications, 0);
  objc_storeStrong((id *)&self->_dockedApplications, 0);
  objc_storeStrong((id *)&self->_lastPolicyUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_lastActivationInformationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_meanLaunchVersusResumeTimeDeltas, 0);
  objc_storeStrong((id *)&self->_applicationActivationCounts, 0);
  objc_storeStrong((id *)&self->_activeDockAssertions, 0);
  objc_storeStrong((id *)&self->_applicationProcessHandles, 0);
  objc_storeStrong((id *)&self->_lastPhysFootprintObservedForApplication, 0);

  objc_storeStrong((id *)&self->_lastFrozenFootprintObservedForApplication, 0);
}

@end