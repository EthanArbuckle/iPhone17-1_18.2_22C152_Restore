@interface SDController
+ (id)backgroundWorkQueue;
+ (id)datastoreForDomain:(unsigned int)a3;
+ (id)datastores;
+ (id)domainMap;
+ (id)getMeContactIdentifier;
+ (id)getMeEmailAddresses;
+ (id)rankQueue;
+ (id)workQueue;
+ (void)activated;
+ (void)deactivated;
+ (void)handleMemoryPressureWithStatus:(unint64_t)a3;
+ (void)initialize;
+ (void)readyForQueries;
+ (void)setDatastores:(id)a3;
+ (void)setParsecDatastore:(id)a3;
- (BOOL)_valueFromArray:(id)a3 notInSet:(id)a4;
- (BOOL)blocklistCheck:(id)a3 withOptions:(int64_t)a4;
- (BOOL)deviceFirstUnlockedInMKB;
- (BOOL)deviceFirstUnlockedInSB;
- (BOOL)deviceUnlocked;
- (BOOL)disableABCReporting:(id)a3;
- (BOOL)indexingEnabled;
- (BOOL)keepRunning;
- (BOOL)managedIndex;
- (BOOL)privateIndex;
- (BOOL)setupHasComplete;
- (BOOL)unlockedSinceBoot;
- (NSUserDefaults)defaultsCenter;
- (OS_dispatch_queue)firstUnlockQueue;
- (OS_dispatch_queue)indexQueue;
- (SDController)init;
- (SPCoreSpotlightIndexer)indexer;
- (id)cacheDeleteId;
- (id)disabledBundleSet;
- (id)extraTTRInfo;
- (id)indexDirectory;
- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (int64_t)startedOnce;
- (void)deviceStateWillChange:(BOOL)a3;
- (void)didReceiveMemoryPressureNotification:(unint64_t)a3;
- (void)didReceiveSignal:(unint64_t)a3;
- (void)dumpTTRDebugFiles;
- (void)firstUnlockSBCompleted;
- (void)indexAvailableForProtectionClass:(id)a3 newIndex:(BOOL)a4;
- (void)issueLoadTrial:(id)a3;
- (void)locked;
- (void)lockedCx;
- (void)locking;
- (void)lockingCx;
- (void)migrationCompleted;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)recordEngagementForBundleID:(id)a3 uniqueIdentifier:(id)a4 protectionClass:(id)a5 userQuery:(id)a6 date:(id)a7;
- (void)registerMessageHandlers;
- (void)setDefaultsCenter:(id)a3;
- (void)setFirstUnlockQueue:(id)a3;
- (void)setIndexQueue:(id)a3;
- (void)setIndexer:(id)a3;
- (void)setStartedOnce:(int64_t)a3;
- (void)startIndexer;
- (void)unlockAppUninstallMonitor;
- (void)unlockMigrationMonitor;
- (void)unlocked;
- (void)updateApplicationsWithCompletion:(id)a3 clean:(BOOL)a4;
- (void)updateParsecEnabled;
@end

@implementation SDController

- (id)indexDirectory
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingString:@"/Library/Spotlight/CoreSpotlight"];

  return v3;
}

+ (id)datastoreForDomain:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [a1 domainMap];
  v5 = +[NSNumber numberWithInt:v3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)blocklistCheck:(id)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  if (!qword_1000A8D88)
  {
    id v10 = +[SPBackupRankingMetadataHandler sharedInstance];
    if (qword_1000A8D88 != -1) {
      dispatch_once(&qword_1000A8D88, &stru_100092558);
    }
  }
  if (v4 < 0 || !byte_1000A8D78)
  {
    if (!qword_1000A8D90
      && qword_1000A8D80
      && [v5 isEqualToString:PRSRankingContactsBundleString]
      && qword_1000A8D90 != -1)
    {
      dispatch_once(&qword_1000A8D90, &stru_100092578);
    }
    v7 = +[SDController datastoreForDomain:2];
    v8 = [v7 appBlocklist];
    unsigned __int8 v6 = [v8 containsObject:v5];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)deviceUnlocked
{
  v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 unlocked];

  return v3;
}

+ (id)domainMap
{
  return (id)qword_1000A8D60;
}

- (void)deviceStateWillChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(SDController *)self startIndexer];
  }

  +[SPCoreSpotlightIndexer deviceStateWillChange:v3];
}

- (void)migrationCompleted
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController migrationCompleted", (uint8_t *)&v6, 2u);
  }

  char v4 = [(SDController *)self indexer];
  [v4 resume];

  id v5 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "com.apple.spotlight.index.firstUnlock";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resuming \"%s\" queue", (uint8_t *)&v6, 0xCu);
  }

  dispatch_resume((dispatch_object_t)self->_firstUnlockQueue);
  [(SDController *)self unlockAppUninstallMonitor];
  [(SDController *)self unlockMigrationMonitor];
}

- (void)firstUnlockSBCompleted
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController firstUnlockSBCompleted", v5, 2u);
  }

  [(SDController *)self unlockAppUninstallMonitor];
  [(SDController *)self unlockMigrationMonitor];
  char v4 = +[SPBackupRankingMetadataHandler sharedInstance];
  [v4 backUpFileProtectionClassCheck];
}

- (void)locking
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController locking", v5, 2u);
  }

  char v4 = [(SDController *)self indexer];
  [v4 locking];
}

- (void)locked
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController locked", v5, 2u);
  }

  char v4 = [(SDController *)self indexer];
  [v4 locked];
}

- (void)lockingCx
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController locking Cx", v5, 2u);
  }

  char v4 = [(SDController *)self indexer];
  [v4 lockingCx];
}

- (void)lockedCx
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController locked Cx", v5, 2u);
  }

  char v4 = [(SDController *)self indexer];
  [v4 lockedCx];
}

- (void)unlocked
{
  BOOL v3 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### SDController unlocked", v6, 2u);
  }

  [(SDController *)self unlockAppUninstallMonitor];
  char v4 = dispatch_get_global_queue(17, 2uLL);
  tracing_dispatch_async();

  id v5 = [(SDController *)self indexer];
  [v5 unlock];
}

- (void)didReceiveSignal:(unint64_t)a3
{
  if (a3 == 1)
  {
    +[SPCoreSpotlightIndexer sync];
  }
  else if (a3 == 15)
  {
    +[SDAppUninstallMonitor shutdown];
    [(SPXPCServer *)self->_xpcServer shutdown];
    [(SPXPCServer *)self->_xpcBackgroundServer shutdown];
    +[SPCoreSpotlightIndexer shutdown];
  }
}

+ (void)handleMemoryPressureWithStatus:(unint64_t)a3
{
  +[SPCoreSpotlightIndexer shrink:](SPCoreSpotlightIndexer, "shrink:");
  char v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 _LSClearSchemaCaches];

  id v5 = +[SDController datastores];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 shrink:a3];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)didReceiveMemoryPressureNotification:(unint64_t)a3
{
  if (a3 != 1) {
    tracing_dispatch_async();
  }
}

+ (void)activated
{
  byte_1000A8D10 = 1;
}

+ (void)deactivated
{
  byte_1000A8D10 = 0;
  if (byte_1000A8D11 == 1 && qword_1000A8D18 != 0)
  {
    [(id)objc_opt_class() handleMemoryPressureWithStatus:qword_1000A8D18];
    byte_1000A8D11 = 0;
    qword_1000A8D18 = 0;
  }
}

+ (id)getMeContactIdentifier
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8D20);
  id v2 = (id)qword_1000A8CF8;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8D20);

  return v2;
}

+ (id)getMeEmailAddresses
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8D20);
  id v2 = (id)qword_1000A8D00;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8D20);

  return v2;
}

- (BOOL)_valueFromArray:(id)a3 notInSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(v6, "containsObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)registerMessageHandlers
{
  [(SPXPCServer *)self->_xpcBackgroundServer setHandlerForMessageName:@"Apps" handler:&stru_1000922B8];
  [(SPXPCServer *)self->_xpcBackgroundServer setHandlerForMessageName:@"SendSFFeedback" handler:&stru_1000922F8];
  xpcBackgroundServer = self->_xpcBackgroundServer;

  [(SPXPCServer *)xpcBackgroundServer setDefaultMessageHandler:&stru_100092318];
}

+ (id)rankQueue
{
  return (id)qword_1000A8D38;
}

+ (id)workQueue
{
  return (id)qword_1000A8D08;
}

+ (id)backgroundWorkQueue
{
  return (id)qword_1000A8D40;
}

+ (void)initialize
{
  notify_post("com.apple.searchd.launched");
  if (os_variant_has_internal_diagnostics())
  {
    id v2 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Feature flag enabled", buf, 2u);
    }

    CFPreferencesSetAppValue(@"SPBullseyeFeatureFlag", &off_100098AB0, SpotlightUIPrefsDomain);
  }
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  char v4 = dispatch_get_global_queue(17, 0);
  dispatch_after(v3, v4, &stru_100092338);

  uint64_t v5 = MGGetProductType();
  if (v5 == 2702125347 || v5 == 4240173202)
  {
    byte_1000A8D48 = 1;
LABEL_8:
    byte_1000A8738 = 0;
    return;
  }
  if (byte_1000A8D48) {
    goto LABEL_8;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SpotlightIndexEnabled", kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    byte_1000A8738 = AppBooleanValue != 0;
  }
  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 addSuiteNamed:@"com.apple.searchd"];

  id v8 = SPGetDisabledDomainSet();
  [v8 containsObject:&off_100098AC8];

  ADClientSetValueForScalarKey();
  id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.spotlightui"];
  id v10 = [v9 integerForKey:@"SPUISearchFirstTimeShowCount"];

  if ((uint64_t)v10 <= 0)
  {
    byte_1000A8D49 = 0;
  }
  else
  {
    long long v11 = SPGetDisabledDomainSet();
    byte_1000A8D49 = [v11 containsObject:@"DOMAIN_PARSEC"] ^ 1;
  }
}

+ (void)setParsecDatastore:(id)a3
{
}

+ (void)setDatastores:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:v3];
  uint64_t v5 = (void *)qword_1000A8D58;
  qword_1000A8D58 = (uint64_t)v4;

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = (void *)qword_1000A8D60;
  qword_1000A8D60 = (uint64_t)v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "domain", (void)v17);
        long long v15 = (void *)qword_1000A8D60;
        v16 = +[NSNumber numberWithUnsignedInt:v14];
        [v15 setObject:v13 forKeyedSubscript:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

+ (void)readyForQueries
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B040;
  block[3] = &unk_1000923B8;
  block[4] = a1;
  if (qword_1000A8D68 != -1) {
    dispatch_once(&qword_1000A8D68, block);
  }
}

- (void)startIndexer
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_onceStartIndexer, 1u) & 1) == 0)
  {
    id v3 = SPLogForSPLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "### Indexer starting", v6, 2u);
    }

    [(SPCoreSpotlightIndexer *)self->_indexer upgradeCheck];
    dispatch_activate((dispatch_object_t)self->_indexQueue);
    [(SPCoreSpotlightIndexer *)self->_indexer start];
    if (byte_1000A8738)
    {
      id v4 = +[SDNetworkQualityInquiry sharedInstance];
      uint64_t v5 = dispatch_get_global_queue(17, 0);
      tracing_dispatch_async();
    }
  }
}

- (void)unlockAppUninstallMonitor
{
  if (byte_1000A8738 && (atomic_exchange((atomic_uchar *volatile)&self->_onceUnlockAppUninstallMonitor, 1u) & 1) == 0)
  {
    id v2 = SPLogForSPLogCategoryIndex();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "### Uninstall Monitor Unlock", v4, 2u);
    }

    id v3 = +[SDAppUninstallMonitor sharedInstance];
    [v3 unlock];
  }
}

- (void)unlockMigrationMonitor
{
  if (byte_1000A8738 && (atomic_exchange((atomic_uchar *volatile)&self->_onceUnlockMigrationMonitor, 1u) & 1) == 0)
  {
    id v2 = SPLogForSPLogCategoryIndex();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "### Migration Monitor Unlock", v4, 2u);
    }

    id v3 = +[SDMigrationMonitor sharedInstance];
    [v3 unlock];
  }
}

- (SDController)init
{
  v54.receiver = self;
  v54.super_class = (Class)SDController;
  id v2 = [(SDController *)&v54 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_initially_inactive(0);
    id v4 = dispatch_queue_attr_make_with_overcommit();
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.spotlight.index", v6);
    id v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    +[SPCoreSpotlightIndexer setIndexerDelegate:v2];
    if (byte_1000A8738) {
      uint64_t v9 = byte_1000A8D48;
    }
    else {
      uint64_t v9 = byte_1000A8D48 | 2;
    }
    +[SDLockHandler setLockHandlerWithDelegate:v2 options:v9];
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = dispatch_queue_attr_make_with_overcommit();
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.searchd.workq", v11);
    long long v13 = (void *)qword_1000A8D08;
    qword_1000A8D08 = (uint64_t)v12;

    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v15 = dispatch_queue_attr_make_with_overcommit();
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.searchd.rankq", v15);
    long long v17 = (void *)qword_1000A8D38;
    qword_1000A8D38 = (uint64_t)v16;

    long long v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.searchd.bgworkq", v19);
    v21 = (void *)qword_1000A8D40;
    qword_1000A8D40 = (uint64_t)v20;

    if ((byte_1000A8D48 & 1) == 0)
    {
      id v22 = objc_alloc((Class)SPXPCServer);
      v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v24 = dispatch_queue_create("com.apple.searchd.foreground", v23);
      id v25 = [v22 initListenerWithServiceName:@"com.apple.searchd" onQueue:v24 qos:33];
      v26 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v25;

      [*((id *)v2 + 1) setDisconnectHandler:&stru_100092438];
      [*((id *)v2 + 1) setFirstConnectionBlock:&stru_1000923F8];
      id v27 = objc_alloc((Class)SPXPCServer);
      v28 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      dispatch_queue_t v29 = dispatch_queue_create("com.apple.searchd.background", v28);
      id v30 = [v27 initListenerWithServiceName:@"com.apple.searchd.background" onQueue:v29 qos:9];
      v31 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v30;

      [*((id *)v2 + 2) setDisconnectHandler:&stru_100092458];
      [*((id *)v2 + 2) setDefaultMessageHandler:&stru_100092478];
      [*((id *)v2 + 1) setDefaultMessageHandler:&stru_100092498];
      [v2 registerMessageHandlers];
    }
    v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v33 = dispatch_queue_create_with_target_V2("com.apple.spotlight.index.firstUnlock", v32, *((dispatch_queue_t *)v2 + 6));
    v34 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v33;

    v35 = SPLogForSPLogCategoryIndex();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "com.apple.spotlight.index.firstUnlock";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Suspending \"%s\" queue", buf, 0xCu);
    }

    dispatch_suspend(*((dispatch_object_t *)v2 + 7));
    v36 = +[SDLockHandler sharedLockHandler];
    uint64_t v37 = +[SPCoreSpotlightIndexer sharedInstance];
    v38 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v37;

    [v36 start];
    v39 = +[SDLockHandler sharedLockHandler];
    unsigned int v40 = [v39 unlockedSinceBoot];

    if (v40)
    {
      [v2 startIndexer];
    }
    else
    {
      v41 = SPLogForSPLogCategoryIndex();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "### delaying indexer start until first unlock", buf, 2u);
      }
    }
    if ((byte_1000A8D48 & 1) == 0) {
      +[SDClient registerMessageHandlersWithServer:*((void *)v2 + 1)];
    }
    +[SDSignalHandler setDelegate:v2 memoryStatusFlags:55];
    +[SDSignalHandler setupHandlers];
    if ((byte_1000A8D48 & 1) == 0)
    {
      [*((id *)v2 + 1) startListening];
      [*((id *)v2 + 2) startListening];
      if (byte_1000A8738)
      {
        v42 = +[SDEventMonitor sharedInstance];
        v43 = +[SDAppUninstallMonitor sharedInstance];
        [v43 registerHandlerWithEventMonitor:v42];
        v44 = +[SDMigrationMonitor sharedInstance];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_10000C3DC;
        v52[3] = &unk_1000921B0;
        id v53 = v2;
        [v44 monitorDataMigrationWithCompletionBlock:v52];

        [v42 startMonitoringEvents];
        if (byte_1000A8738)
        {
          v45 = dispatch_get_global_queue(17, 0);
          tracing_dispatch_async();
        }
      }
      if (+[SSBiomeConsumers enabled])
      {
        v46 = +[SSBiomeConsumers sharedInstance];
        [v46 start];
      }
      id v47 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.spotlightui"];
      [v47 addObserver:v2 forKeyPath:@"SPUISearchFirstTimeShowCount" options:0 context:0];
      [v47 addObserver:v2 forKeyPath:@"SBSearchDisabledDomains" options:0 context:0];
      [v2 setDefaultsCenter:v47];
      [v2 updateParsecEnabled];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10000C4C8, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)sub_10000C4C8, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v50 = dispatch_get_global_queue(9, 0);
      tracing_dispatch_async();

      if (qword_1000A8D70 != -1) {
        dispatch_once(&qword_1000A8D70, &stru_1000924F8);
      }
    }
  }
  return (SDController *)v2;
}

- (BOOL)keepRunning
{
  return 1;
}

+ (id)datastores
{
  return (id)qword_1000A8D58;
}

- (void)updateParsecEnabled
{
  id v3 = SPGetDisabledDomainSet();
  [v3 containsObject:@"DOMAIN_ZKWS"];
  unsigned int v4 = 0;
  if (([v3 containsObject:@"DOMAIN_PARSEC"] & 1) == 0)
  {
    uint64_t v5 = +[MCProfileConnection sharedConnection];
    unsigned int v4 = [v5 isSpotlightInternetResultsAllowed];
  }
  ADClientSetValueForScalarKey();
  id v6 = [(SDController *)self defaultsCenter];
  id v7 = [v6 integerForKey:@"SPUISearchFirstTimeShowCount"];

  if ((uint64_t)v7 > 0) {
    char v8 = v4;
  }
  else {
    char v8 = 0;
  }
  byte_1000A8D49 = v8;
  objc_msgSend((id)qword_1000A8D50, "setParsecState:");
  uint64_t v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    int v15 = 134217984;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[FEEDBACK-DEBUG] (_userPrefsChanged) firstTimeShowCount: %ld", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v11 = SPLogForSPLogCategoryDefault();
  os_log_type_t v12 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v11, v12))
  {
    int v15 = 67109120;
    LODWORD(v16) = v4 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[FEEDBACK-DEBUG] (_userPrefsChanged) DOMAIN_PARSEC disabled: %d", (uint8_t *)&v15, 8u);
  }

  long long v13 = SPLogForSPLogCategoryDefault();
  os_log_type_t v14 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v13, v14))
  {
    int v15 = 67109120;
    LODWORD(v16) = byte_1000A8D49;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[FEEDBACK-DEBUG] (_userPrefsChanged) _permitParsecFeedback: %d", (uint8_t *)&v15, 8u);
  }

  +[SPFeedbackSender synchronizedBlock:&stru_100092538];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"SPUISearchFirstTimeShowCount"] & 1) != 0
    || [v10 isEqualToString:@"SBSearchDisabledDomains"])
  {
    [(SDController *)self updateParsecEnabled];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SDController;
    if ([(SDController *)&v14 respondsToSelector:"observeValueForKeyPath:ofObject:change:context:"])
    {
      v13.receiver = self;
      v13.super_class = (Class)SDController;
      [(SDController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
  }
}

- (BOOL)privateIndex
{
  return 0;
}

- (BOOL)managedIndex
{
  return 0;
}

- (OS_dispatch_queue)indexQueue
{
  return self->_indexQueue;
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

- (BOOL)indexingEnabled
{
  return byte_1000A8738;
}

- (BOOL)setupHasComplete
{
  return _BYSetupAssistantHasCompletedInitialRun(self, a2);
}

- (void)updateApplicationsWithCompletion:(id)a3 clean:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[SPApplicationMetadataUpdater sharedInstance];
  [v6 updateWithCompletionHandler:v5 clean:v4 activity:0];
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  +[SDController readyForQueries];
  id v16 = +[SPCoreSpotlightDatastore sharedInstance];
  long long v17 = [v16 taskForTopHitQueryWithQueryString:v15 queryContext:v14 eventHandler:v13 resultsHandler:v12 completionHandler:v11];

  return v17;
}

- (BOOL)unlockedSinceBoot
{
  id v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 unlockedSinceBoot];

  return v3;
}

- (BOOL)deviceFirstUnlockedInMKB
{
  id v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 unlockedSinceBoot];

  return v3;
}

- (BOOL)deviceFirstUnlockedInSB
{
  id v2 = +[SDLockHandler sharedLockHandler];
  unsigned __int8 v3 = [v2 firstUnlockedInSB];

  return v3;
}

- (id)disabledBundleSet
{
  return (id)_SPGetDisabledBundleSet(1, a2);
}

- (void)recordEngagementForBundleID:(id)a3 uniqueIdentifier:(id)a4 protectionClass:(id)a5 userQuery:(id)a6 date:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[PRSAnonymousPipelineManager sharedManager];
  [v16 userEngagedItemWithIdentifier:v14 forBundle:v15 forQuery:v12];

  id v17 = objc_alloc_init((Class)CSSearchableItem);
  [v17 setUniqueIdentifier:v14];

  [v17 setBundleID:v15];
  id v18 = objc_alloc((Class)CSSearchableItemAttributeSet);
  v24[0] = @"kMDItemLastUsedDate";
  v24[1] = @"_kMDItemShortcutLastUsedDate";
  v25[0] = v11;
  v25[1] = v11;
  v24[2] = @"_kMDItemLaunchString";
  v25[2] = v12;
  long long v19 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  id v20 = [v18 initWithAttributes:v19];
  [v17 setAttributeSet:v20];

  [v17 setIsUpdate:1];
  v21 = +[SPCoreSpotlightIndexer sharedInstance];
  id v23 = v17;
  id v22 = +[NSArray arrayWithObjects:&v23 count:1];

  [v21 indexSearchableItems:v22 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v13 forBundleID:v15 options:0 completionHandler:0];
}

- (void)dumpTTRDebugFiles
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v2 = +[SDFeedbackInterceptor sharedInstance];
    [v2 dumpTTRDebugFiles];
  }
}

- (id)extraTTRInfo
{
  id v2 = +[SDSearchQuery appGenreMap];
  unsigned __int8 v3 = +[SDSearchQuery searchContinuationCompatibilitySet];
  BOOL v4 = SPFastHiddenAppsGetNoBuild();
  id v5 = +[SRResourcesManager sharedResourcesManager];
  id v6 = [v5 allLoadedAssets];

  if (_os_feature_enabled_impl())
  {
    id v7 = +[APApplication applicationsWithContentHiddenFromSearch];
    char v8 = sub_10000D22C(v7);

    uint64_t v9 = +[APApplication hiddenApplications];
    id v10 = sub_10000D22C(v9);
  }
  else
  {
    char v8 = 0;
    id v10 = 0;
  }
  id v11 = +[NSString stringWithFormat:@"\nApp Genre Cache:\n%@\n\nSearch Continuation Compatibility Cache:\n%@\n\n(MC)Hidden Apps:\n%@\n\nLoaded Assets:%@\n\nLocked Apps:%@\n\nHiddenApps:%@\n\n", v2, v3, v4, v6, v8, v10];
  id v12 = [v11 dataUsingEncoding:4];

  return v12;
}

- (void)indexAvailableForProtectionClass:(id)a3 newIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v7, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "indexAvailable pc:%@ new: %d", buf, 0x12u);
  }

  if (([v6 isEqualToString:NSFileProtectionCompleteUntilFirstUserAuthentication] & 1) != 0
    || [v6 isEqualToString:@"Priority"])
  {
    if ((byte_1000A8D48 & 1) == 0)
    {
      uint64_t v9 = +[SPApplicationIndexer sharedIndexer];
      [v9 start];
    }
    if (v4)
    {
      id v10 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v6;
        __int16 v17 = 1024;
        int v18 = 1;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New index; trigger apps rebuild pc:%@ new: %d",
          buf,
          0x12u);
      }

      id v11 = SPFastApplicationsGetNoBuild();
      if ([v11 count])
      {
        id v12 = +[SPApplicationIndexer sharedIndexer];
        id v13 = [v11 allKeys];
        [v12 updateApplications:0 appBundleArray:v13 clean:0 activity:0];
      }
    }
    else
    {
      id v14 = [(SDController *)self firstUnlockQueue];
      tracing_dispatch_async();
    }
  }
}

- (void)issueLoadTrial:(id)a3
{
  unsigned __int8 v3 = a3;
  BOOL v4 = v3;
  if (v3) {
    dispatch_group_enter(v3);
  }
  id v5 = +[SDLockHandler sharedLockHandler];
  unsigned int v6 = [v5 unlockedSinceBoot];

  if (v6)
  {
    id v7 = dispatch_get_global_queue(25, 0);
    v11[1] = _NSConcreteStackBlock;
    v11[2] = 3221225472;
    v11[3] = sub_10000F49C;
    v11[4] = &unk_1000921B0;
    os_log_type_t v8 = (id *)&v12;
    id v12 = v4;
    uint64_t v9 = v4;
  }
  else
  {
    id v7 = +[SDController workQueue];
    os_log_type_t v8 = (id *)v11;
    v11[0] = v4;
    id v10 = v4;
  }
  tracing_dispatch_async();
}

- (BOOL)disableABCReporting:(id)a3
{
  if (a3) {
    return [a3 isEqualToString:NSFileProtectionCompleteUnlessOpen];
  }
  else {
    return 0;
  }
}

- (id)cacheDeleteId
{
  return @"com.apple.searchd.cachedelete";
}

- (SPCoreSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
}

- (void)setIndexQueue:(id)a3
{
}

- (void)setFirstUnlockQueue:(id)a3
{
}

- (NSUserDefaults)defaultsCenter
{
  return self->_defaultsCenter;
}

- (void)setDefaultsCenter:(id)a3
{
}

- (int64_t)startedOnce
{
  return self->_startedOnce;
}

- (void)setStartedOnce:(int64_t)a3
{
  self->_startedOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsCenter, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_currentActivation, 0);
  objc_storeStrong((id *)&self->_xpcBackgroundServer, 0);

  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end