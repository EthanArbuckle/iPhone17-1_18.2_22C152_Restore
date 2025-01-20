@interface WAIOReporterMessagePopulator
+ (BOOL)supportsSecureCoding;
+ (id)getIORPopAvailabeIOReportersTempFile;
+ (id)getUnavailablePredTempFile;
+ (id)getUsageTempFile;
- (BOOL)_runIOLegendTest;
- (BOOL)doesMessageNeedPrepopulation:(id)a3;
- (BOOL)failNextCreateOrUpdateSample;
- (BOOL)hasAttemptedUnpersisting;
- (BOOL)ioReportersCacheNeedsUpdating;
- (BOOL)persistFileExistedAtPIDLoad;
- (BOOL)persistTimerRunning;
- (BOOL)rescanTimerRunning;
- (BOOL)runIOLegendTest;
- (NSDate)pidLaunchDate;
- (NSMutableArray)cachedPredicatesNotYetFound;
- (NSMutableDictionary)cachedChannelsCountPerIORPopulatable;
- (NSMutableDictionary)cachedIOPopAvailableChannels;
- (NSMutableDictionary)cachedIOReportSample;
- (NSMutableDictionary)cachedIOReportSubbedChannels;
- (NSMutableDictionary)cachedUsage;
- (NSNumber)providerNum;
- (NSString)drvName;
- (NSString)drvPath;
- (NSString)infraInterfaceName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)persistTimer;
- (OS_dispatch_source)rescanTimer;
- (RecommendationPreferences)preferences;
- (WAApple80211)apple80211Wrapper;
- (WAIOReporterMessagePopulator)init;
- (WAIOReporterMessagePopulator)initWithCoder:(id)a3;
- (WAIOReporterPersistenceDelegate)persistenceDelegate;
- (WAIOReporterPopulatorMessageDelegate)messageDelegate;
- (id)_buildPredicateList:(int64_t)a3 wlan:(int64_t)a4;
- (id)_createStructuredIOReportDictionary:(id)a3;
- (id)_getCachedUsage;
- (id)createChannelWithProviderID:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8;
- (id)getCachedUsage;
- (int)pid;
- (int64_t)wlanType;
- (unint64_t)_addDriverChannelsMatchingPredicateList:(int64_t)a3;
- (unsigned)_getCCPipeDriverForWLAN;
- (unsigned)_getIOServiceWithForceRefresh:(BOOL)a3 apple80211:(id)a4;
- (unsigned)_iorPreparedForSampling:(unsigned __int8)a3;
- (unsigned)doesChannelExistInStructuredDict:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8;
- (unsigned)doesDriverHaveChannelsInStructuredDict:(int64_t)a3 containsStale:(char *)a4;
- (unsigned)srv;
- (void)_buildOrRescanToBuildChannelAvailabilityCaches:(int64_t)a3;
- (void)_calculateEstimatedUptime;
- (void)_cancelDelayedInvocationForPersist;
- (void)_cancelDelayedInvocationForRescan;
- (void)_clearIOReporterCache;
- (void)_delayedInvocationForPersist;
- (void)_delayedInvocationForRescan;
- (void)_findChannelsAndBuildChannelCaches:(int64_t)a3;
- (void)_freeIORCaches;
- (void)_freeSubscriptionSample:(id)a3;
- (void)_handleUnpersistForUsageData;
- (void)_incrementPredicateCachedUsageWithPrefix:(id)a3 q:(id *)a4;
- (void)_persistIORObjects:(unsigned __int8)a3;
- (void)_prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6 isResubscribe:(BOOL)a7;
- (void)_removeIORChannelsPersistenceFiles;
- (void)_scanPredicatesWithMode:(int64_t)a3;
- (void)_signalPotentialNewIORChannels;
- (void)_unpersistIORObjects;
- (void)determineChannelsPerIORPopulatable;
- (void)determineChannelsPerIORPopulatableWithinPopulatorBlock;
- (void)encodeWithCoder:(id)a3;
- (void)freeIORCaches;
- (void)injectErrorOnNextCreateOrUpdateSample;
- (void)persistIORObjects:(unsigned __int8)a3;
- (void)prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6;
- (void)prepopulateMessageWithinPopulatorBlock:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6;
- (void)scanPredicatesNotYetFoundAndMutable;
- (void)setApple80211Wrapper:(id)a3;
- (void)setCachedChannelsCountPerIORPopulatable:(id)a3;
- (void)setCachedIOPopAvailableChannels:(id)a3;
- (void)setCachedIOReportSample:(id)a3;
- (void)setCachedIOReportSubbedChannels:(id)a3;
- (void)setCachedPredicatesNotYetFound:(id)a3;
- (void)setCachedUsage:(id)a3;
- (void)setDrvName:(id)a3;
- (void)setDrvPath:(id)a3;
- (void)setFailNextCreateOrUpdateSample:(BOOL)a3;
- (void)setHasAttemptedUnpersisting:(BOOL)a3;
- (void)setInfraInterfaceName:(id)a3;
- (void)setIoReportersCacheNeedsUpdating:(BOOL)a3;
- (void)setMessageDelegate:(id)a3;
- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3;
- (void)setPersistTimer:(id)a3;
- (void)setPersistTimerRunning:(BOOL)a3;
- (void)setPersistenceDelegate:(id)a3;
- (void)setPid:(int)a3;
- (void)setPidLaunchDate:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setProviderNum:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRescanTimer:(id)a3;
- (void)setRescanTimerRunning:(BOOL)a3;
- (void)setSrv:(unsigned int)a3;
- (void)setWlanType:(int64_t)a3;
- (void)signalPotentialNewIORChannels;
- (void)unpersistIORObjects;
@end

@implementation WAIOReporterMessagePopulator

- (WAIOReporterMessagePopulator)init
{
  v16.receiver = self;
  v16.super_class = (Class)WAIOReporterMessagePopulator;
  v2 = [(WAIOReporterMessagePopulator *)&v16 init];
  if (v2)
  {
    if (qword_1000F0F90 != -1) {
      dispatch_once(&qword_1000F0F90, &stru_1000D0CD8);
    }
    if (qword_1000F0F78 != -1) {
      dispatch_once(&qword_1000F0F78, &stru_1000D0C78);
    }
    if (qword_1000F0F80 != -1) {
      dispatch_once(&qword_1000F0F80, &stru_1000D0C98);
    }
    if (qword_1000F0F88 != -1) {
      dispatch_once(&qword_1000F0F88, &stru_1000D0CB8);
    }
    id v3 = objc_alloc_init((Class)NSMutableArray);
    [(WAIOReporterMessagePopulator *)v2 setCachedPredicatesNotYetFound:v3];

    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(WAIOReporterMessagePopulator *)v2 setCachedUsage:v4];

    v5 = +[NSString stringWithFormat:@"dunno"];
    [(WAIOReporterMessagePopulator *)v2 setInfraInterfaceName:v5];

    v6 = +[RecommendationPreferences sharedObject];
    [(WAIOReporterMessagePopulator *)v2 setPreferences:v6];

    v7 = [(WAIOReporterMessagePopulator *)v2 preferences];

    if (v7)
    {
      *(_WORD *)&v2->_ioReportersCacheNeedsUpdating = 0;
      v2->_persistFileExistedAtPIDLoad = 0;
      v8 = +[NSProcessInfo processInfo];
      v2->_pid = [v8 processIdentifier];

      uint64_t v9 = +[NSDate now];
      pidLaunchDate = v2->_pidLaunchDate;
      v2->_pidLaunchDate = (NSDate *)v9;

      v2->_srv = 0;
      drvName = v2->_drvName;
      v2->_drvName = 0;

      providerNum = v2->_providerNum;
      v2->_providerNum = 0;

      v2->_wlanType = 0;
      p_super = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = dispatch_queue_create("com.apple.wifi.analytics.IOReporterQ", p_super);
      [(WAIOReporterMessagePopulator *)v2 setQueue:v14];
    }
    else
    {
      v14 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[WAIOReporterMessagePopulator init]";
        __int16 v19 = 1024;
        int v20 = 327;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error RecommendationPreferences init", buf, 0x12u);
      }
      p_super = &v2->super;
      v2 = 0;
    }
  }
  else
  {
    p_super = 0;
  }

  return v2;
}

- (unsigned)_getIOServiceWithForceRefresh:(BOOL)a3 apple80211:(id)a4
{
  id v6 = a4;
  if (a3 || (unsigned int srv = self->_srv) == 0)
  {
    +[WAUtil incrementValueForKey:@"Fetch IOService Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      v11 = "-[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:]";
      __int16 v12 = 1024;
      int v13 = 359;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Getting _srv", (uint8_t *)&v10, 0x12u);
    }

    unsigned int srv = [v6 getIOReportingService];
    self->_unsigned int srv = srv;
  }

  return srv;
}

- (unsigned)_getCCPipeDriverForWLAN
{
  *(void *)mainPort = 0;
  CFMutableDictionaryRef v2 = IOServiceNameMatching("CCPipe");
  if (!v2)
  {
    int v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      __int16 v16 = 1024;
      int v17 = 375;
      v11 = "%{public}s::%d:IOServiceMatching failed";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
    }
LABEL_30:

LABEL_31:
    io_registry_entry_t v4 = 0;
    goto LABEL_21;
  }
  CFMutableDictionaryRef v3 = v2;
  if (IOMainPort(0, &mainPort[1]))
  {
    __int16 v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      __int16 v16 = 1024;
      int v17 = 378;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOMasterPort failed", buf, 0x12u);
    }

    CFRelease(v3);
    goto LABEL_31;
  }
  if (IOServiceGetMatchingServices(mainPort[1], v3, mainPort))
  {
    int v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      __int16 v16 = 1024;
      int v17 = 381;
      v11 = "%{public}s::%d:IOServiceGetMatchingServices failed";
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  io_registry_entry_t v4 = IOIteratorNext(mainPort[0]);
  if (v4)
  {
    while (1)
    {
      CFStringRef v5 = (const __CFString *)IORegistryEntrySearchCFProperty(v4, "IOService", @"LogIdentifier", kCFAllocatorDefault, 3u);
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 == CFStringGetTypeID() && CFEqual(v5, @"wlan0"))
      {
        v8 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446722;
        v15 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
        __int16 v16 = 1024;
        int v17 = 390;
        __int16 v18 = 2112;
        CFStringRef v19 = v5;
        goto LABEL_19;
      }
      if (v5) {
        CFRelease(v5);
      }
      CFStringRef v5 = (const __CFString *)IORegistryEntrySearchCFProperty(v4, "IOService", @"Owner", kCFAllocatorDefault, 3u);
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID()
        && CFEqual(v5, @"com.apple.driver.ACIWiFiDriver"))
      {
        break;
      }
      if (v5) {
        CFRelease(v5);
      }
      io_registry_entry_t v4 = IOIteratorNext(mainPort[0]);
      if (!v4) {
        goto LABEL_21;
      }
    }
    v8 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136446722;
    v15 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
    __int16 v16 = 1024;
    int v17 = 403;
    __int16 v18 = 2112;
    CFStringRef v19 = v5;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found Match %@", buf, 0x1Cu);
LABEL_20:

    CFRelease(v5);
  }
LABEL_21:
  IOObjectRelease(mainPort[0]);
  return v4;
}

- (void)freeIORCaches
{
  objc_initWeak(&location, self);
  CFMutableDictionaryRef v3 = WALogCategoryDefaultHandle();
  io_registry_entry_t v4 = (char *)os_signpost_id_generate(v3);

  CFStringRef v5 = WALogCategoryDefaultHandle();
  CFTypeID v6 = v5;
  if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "IOR freeIORCaches", "", buf, 2u);
  }

  CFTypeID v7 = [(WAIOReporterMessagePopulator *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015384;
  v8[3] = &unk_1000D0D20;
  objc_copyWeak(v9, &location);
  v9[1] = v4;
  dispatch_sync(v7, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_freeIORCaches
{
  CFMutableDictionaryRef v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    CFTypeID v7 = "-[WAIOReporterMessagePopulator _freeIORCaches]";
    __int16 v8 = 1024;
    int v9 = 436;
    __int16 v10 = 2080;
    v11 = "-[WAIOReporterMessagePopulator _freeIORCaches]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s", (uint8_t *)&v6, 0x1Cu);
  }

  io_registry_entry_t v4 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _freeIORCaches", "", (uint8_t *)&v6, 2u);
  }

  [(WAIOReporterMessagePopulator *)self setCachedChannelsCountPerIORPopulatable:0];
  [(WAIOReporterMessagePopulator *)self setCachedIOPopAvailableChannels:0];
  [(WAIOReporterMessagePopulator *)self setCachedIOReportSubbedChannels:0];
  [(WAIOReporterMessagePopulator *)self setCachedIOReportSample:0];
  CFStringRef v5 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _freeIORCaches", "", (uint8_t *)&v6, 2u);
  }
}

- (void)_freeSubscriptionSample:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136446722;
    v27 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
    __int16 v28 = 1024;
    int v29 = 449;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Clearing cachedIOReportSubbedChannels and cachedIOReportSample for %@", (uint8_t *)&v26, 0x1Cu);
  }

  int v6 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _freeSubscriptionSample", "", (uint8_t *)&v26, 2u);
  }

  CFTypeID v7 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
  __int16 v8 = [v7 objectForKeyedSubscript:v4];
  int v9 = [v8 objectForKeyedSubscript:@"iorsub"];

  if (v9)
  {
    __int16 v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136446722;
      v27 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      __int16 v28 = 1024;
      int v29 = 453;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Freeing cachedIOReportSubbedChannels iorsub for %@", (uint8_t *)&v26, 0x1Cu);
    }

    v11 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
    __int16 v12 = [v11 objectForKeyedSubscript:v4];
    [v12 setObject:0 forKeyedSubscript:@"iorsub"];
  }
  int v13 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  v14 = [v13 objectForKeyedSubscript:v4];
  v15 = [v14 objectForKeyedSubscript:@"sampleValues"];

  if (v15)
  {
    __int16 v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136446722;
      v27 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      __int16 v28 = 1024;
      int v29 = 458;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Freeing cachedIOReportSample sampleValues for %@", (uint8_t *)&v26, 0x1Cu);
    }

    int v17 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
    __int16 v18 = [v17 objectForKeyedSubscript:v4];
    [v18 setObject:0 forKeyedSubscript:@"sampleValues"];
  }
  CFStringRef v19 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  int v20 = [v19 objectForKeyedSubscript:v4];
  v21 = [v20 objectForKeyedSubscript:@"structuredDict"];

  if (v21)
  {
    v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136446722;
      v27 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      __int16 v28 = 1024;
      int v29 = 463;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Freeing cachedIOReportSample structuredDict for %@", (uint8_t *)&v26, 0x1Cu);
    }

    v23 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
    v24 = [v23 objectForKeyedSubscript:v4];
    [v24 setObject:0 forKeyedSubscript:@"structuredDict"];
  }
  v25 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v25))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR _freeSubscriptionSample", "", (uint8_t *)&v26, 2u);
  }
}

- (BOOL)runIOLegendTest
{
  objc_initWeak(&location, self);
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  CFMutableDictionaryRef v3 = [(WAIOReporterMessagePopulator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015B38;
  block[3] = &unk_1000D0D48;
  objc_copyWeak(&v6, &location);
  block[4] = &v7;
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return (char)v3;
}

- (BOOL)_runIOLegendTest
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CFMutableDictionaryRef v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
    __int16 v32 = 1024;
    int v33 = 488;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:runIOLegendTest starting", buf, 0x12u);
  }

  if (!self->_hasAttemptedUnpersisting) {
    [(WAIOReporterMessagePopulator *)self _unpersistIORObjects];
  }
  id v4 = +[WAApple80211Manager sharedObject];
  CFStringRef v5 = [v4 getInfraApple80211];

  if (v5)
  {
    id v6 = (void *)v26;
    *(void *)&long long v26 = @"Interface en";

    uint64_t v7 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = @"Peer";

    __int16 v8 = (void *)v27;
    *(void *)&long long v27 = @"00:00:00:00:00:00";

    uint64_t v9 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = @"DataPath";

    char v25 = 0;
    +[WAUtil incrementValueForKey:@"Legend Query Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    char v10 = [v5 getIOReportLegendItemsMatching:&v26 retErr:&v25];
    if (v25 == 1)
    {
      +[WAUtil incrementValueForKey:@"Legend Query Failed" inMutableDict:self->_cachedUsage onQueue:self->_queue];
      [(WAIOReporterMessagePopulator *)self _incrementPredicateCachedUsageWithPrefix:@"Failed Pred: " q:&v26];
      v11 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        __int16 v32 = 1024;
        int v33 = 512;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching", buf, 0x12u);
      }
    }
    if (![v10 count]) {
      [(WAIOReporterMessagePopulator *)self _incrementPredicateCachedUsageWithPrefix:@"Zero Results Pred: " q:&v26];
    }
    id v23 = [v10 count];
    if (v23)
    {
      int v12 = 100;
      do
      {
        int v13 = WALogCategoryDefaultHandle();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR getIOReportLegendItemsMatching", "", buf, 2u);
        }

        +[WAUtil incrementValueForKey:@"Legend Query Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
        v14 = [v5 getIOReportLegendItemsMatching:&v26 retErr:&v25];

        if (v25 == 1)
        {
          +[WAUtil incrementValueForKey:@"Legend Query Failed" inMutableDict:self->_cachedUsage onQueue:self->_queue];
          [(WAIOReporterMessagePopulator *)self _incrementPredicateCachedUsageWithPrefix:@"Failed Pred: " q:&v26];
          v15 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
            __int16 v32 = 1024;
            int v33 = 529;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching", buf, 0x12u);
          }
        }
        if (!objc_msgSend(v14, "count", v23))
        {
          [(WAIOReporterMessagePopulator *)self _incrementPredicateCachedUsageWithPrefix:@"Zero Results Pred: " q:&v26];
          __int16 v16 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
            __int16 v32 = 1024;
            int v33 = 534;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find requests from query", buf, 0x12u);
          }
        }
        int v17 = WALogCategoryDefaultHandle();
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR getIOReportLegendItemsMatching", "", buf, 2u);
        }

        char v10 = v14;
        --v12;
      }
      while (v12);
    }
    else
    {
      v22 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        __int16 v32 = 1024;
        int v33 = 517;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:getIOReportLegendItemsMatching returned 0 size", buf, 0x12u);
      }

      v14 = v10;
    }

    if (v23)
    {
      __int16 v18 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        __int16 v32 = 1024;
        int v33 = 543;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:runIOLegendTest complete: success", buf, 0x12u);
      }
      BOOL v19 = 1;
      goto LABEL_37;
    }
  }
  else
  {
    int v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
      __int16 v32 = 1024;
      int v33 = 495;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", buf, 0x12u);
    }
  }
  __int16 v18 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    id v31 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
    __int16 v32 = 1024;
    int v33 = 547;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:runIOLegendTest failed", buf, 0x12u);
  }
  BOOL v19 = 0;
LABEL_37:

  sub_100016220((uint64_t)&v26);
  return v19;
}

- (unsigned)doesChannelExistInStructuredDict:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  __int16 v16 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  int v17 = [v16 objectForKeyedSubscript:&off_1000E3FE8];
  __int16 v18 = [v17 objectForKeyedSubscript:@"structuredDict"];

  BOOL v19 = [v18 objectForKeyedSubscript:v12];

  if (!v19) {
    goto LABEL_16;
  }
  int v20 = [v18 objectForKeyedSubscript:v12];
  v21 = [v20 objectForKeyedSubscript:v14];

  if (!v21)
  {
    BOOL v19 = 0;
    goto LABEL_17;
  }
  v22 = [v18 objectForKeyedSubscript:v12];
  id v23 = [v22 objectForKeyedSubscript:v14];
  v24 = [v23 objectForKeyedSubscript:v15];

  if (!v24) {
    goto LABEL_15;
  }
  if ((unint64_t)[v13 count] <= 1)
  {
    int v33 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v38 = "-[WAIOReporterMessagePopulator doesChannelExistInStructuredDict:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v39 = 1024;
      int v40 = 571;
      v34 = "%{public}s::%d:legCh is not >= 2";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x12u);
    }
LABEL_14:

LABEL_15:
    BOOL v19 = 0;
    goto LABEL_16;
  }
  uint64_t v25 = [v13 objectAtIndex:2];
  if (!v25)
  {
    int v33 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v38 = "-[WAIOReporterMessagePopulator doesChannelExistInStructuredDict:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v39 = 1024;
      int v40 = 573;
      v34 = "%{public}s::%d:chName not valid";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  BOOL v19 = (void *)v25;
  long long v26 = [v18 objectForKeyedSubscript:v12];
  long long v27 = [v26 objectForKeyedSubscript:v14];
  long long v28 = [v27 objectForKeyedSubscript:v15];
  long long v29 = [v28 objectForKeyedSubscript:v19];

  if (!v29)
  {
LABEL_16:
    LOBYTE(v21) = 0;
    goto LABEL_17;
  }
  __int16 v30 = [v13 objectAtIndex:0];
  id v36 = [v30 unsignedLongLongValue];

  v21 = [v18 objectForKeyedSubscript:v12];
  id v31 = [v21 objectForKeyedSubscript:v14];
  __int16 v32 = [v31 objectForKeyedSubscript:v15];
  [v32 objectForKeyedSubscript:v19];

  LOBYTE(v21) = v36 == (id)IOReportChannelGetChannelID();
LABEL_17:

  return v21;
}

- (unsigned)doesDriverHaveChannelsInStructuredDict:(int64_t)a3 containsStale:(char *)a4
{
  uint64_t entryID = 0;
  *a4 = 0;
  uint64_t v6 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = (void *)v6;
  __int16 v8 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  uint64_t v9 = [v8 objectForKeyedSubscript:&off_1000E3FE8];
  if (!v9)
  {

    goto LABEL_9;
  }
  char v10 = (void *)v9;
  v11 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  id v12 = [v11 objectForKeyedSubscript:&off_1000E3FE8];
  id v13 = [v12 objectForKeyedSubscript:@"structuredDict"];

  if (!v13) {
    goto LABEL_52;
  }
  memset(name, 0, sizeof(name));
  id v14 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  id v15 = [v14 objectForKeyedSubscript:&off_1000E3FE8];
  uint64_t v7 = [v15 objectForKeyedSubscript:@"structuredDict"];

  if (a3 != 1)
  {
    if (a3)
    {
      int v17 = 0;
      goto LABEL_35;
    }
    __int16 v16 = +[WAApple80211Manager sharedObject];
    int v17 = [v16 getInfraApple80211];

    if (v17)
    {
      io_registry_entry_t v18 = [v17 getIOReportingService];
      goto LABEL_11;
    }
    v41 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
      __int16 v54 = 1024;
      int v55 = 614;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", buf, 0x12u);
    }

LABEL_9:
    goto LABEL_52;
  }
  io_registry_entry_t v18 = [(WAIOReporterMessagePopulator *)self _getCCPipeDriverForWLAN];
  int v17 = 0;
LABEL_11:
  if (!v18)
  {
LABEL_35:
    v37 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

      goto LABEL_52;
    }
    *(_DWORD *)buf = 136446722;
    v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    __int16 v54 = 1024;
    int v55 = 624;
    __int16 v56 = 2048;
    int64_t v57 = a3;
    v38 = "%{public}s::%d:Can't find io_service_t for driver %ld";
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, v38, buf, 0x1Cu);
    goto LABEL_38;
  }
  if (IORegistryEntryGetRegistryEntryID(v18, &entryID))
  {
    v37 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446722;
    v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    __int16 v54 = 1024;
    int v55 = 626;
    __int16 v56 = 2048;
    int64_t v57 = a3;
    v38 = "%{public}s::%d:Can't call IORegistryEntryGetRegistryEntryID on driver %ld";
    goto LABEL_37;
  }
  if (IORegistryEntryGetName(v18, name))
  {
    v37 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446722;
    v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    __int16 v54 = 1024;
    int v55 = 628;
    __int16 v56 = 2048;
    int64_t v57 = a3;
    v38 = "%{public}s::%d:Can't call IORegistryEntryGetName on driver %ld";
    goto LABEL_37;
  }
  v43 = v17;
  v46 = +[NSString stringWithCString:name encoding:4];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [v7 allKeys];
  id v19 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (!v19) {
    goto LABEL_51;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v48;
  while (2)
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v48 != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      v24 = [v7 objectForKeyedSubscript:v23];

      if (!v24)
      {
        long long v28 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v54 = 1024;
          int v55 = 638;
          __int16 v56 = 2112;
          int64_t v57 = (int64_t)v23;
          __int16 v39 = "%{public}s::%d:Issue strDict[foundDriver] %@ doesnt have value";
          goto LABEL_43;
        }
LABEL_50:

        goto LABEL_51;
      }
      if ([v23 containsString:v46])
      {
        uint64_t v25 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v54 = 1024;
          int v55 = 641;
          __int16 v56 = 2112;
          int64_t v57 = (int64_t)v46;
          __int16 v58 = 2112;
          v59 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found matching driver name %@ in dict as %@", buf, 0x26u);
        }

        *a4 = 1;
      }
      long long v26 = [v7 objectForKeyedSubscript:v23];
      long long v27 = [v26 objectEnumerator];
      long long v28 = [v27 nextObject];

      if (!v28)
      {
        long long v28 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v54 = 1024;
          int v55 = 646;
          __int16 v56 = 2112;
          int64_t v57 = (int64_t)v23;
          __int16 v39 = "%{public}s::%d:Issue firstGroup %@ doesnt have value";
LABEL_43:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v39, buf, 0x1Cu);
        }
        goto LABEL_50;
      }
      long long v29 = [v28 objectEnumerator];
      __int16 v30 = [v29 nextObject];

      if (!v30)
      {
        __int16 v30 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v54 = 1024;
          int v55 = 649;
          __int16 v56 = 2112;
          int64_t v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Issue firstSubGroup %@ doesnt have value", buf, 0x1Cu);
        }
        goto LABEL_49;
      }
      id v31 = [v30 objectEnumerator];
      __int16 v32 = [v31 nextObject];

      if (!v32)
      {
        int v40 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v54 = 1024;
          int v55 = 652;
          __int16 v56 = 2112;
          int64_t v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Issue firstChannel %@ doesnt have value", buf, 0x1Cu);
        }

LABEL_49:
        goto LABEL_50;
      }
      int v33 = [v32 objectForKeyedSubscript:@"DriverID"];
      id v34 = [v33 unsignedLongLongValue];
      uint64_t v35 = entryID;

      if (v34 == (id)v35)
      {
        id v36 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          v53 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v54 = 1024;
          int v55 = 655;
          __int16 v56 = 2112;
          int64_t v57 = (int64_t)v32;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found matching firstChannel %@ with matching drvID", buf, 0x1Cu);
        }

        *a4 = 0;
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    id v20 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_51:

LABEL_52:
  LOBYTE(v6) = 0;
  return v6;
}

- (id)createChannelWithProviderID:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ((unint64_t)[v15 count] <= 1)
  {
    v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136446466;
      long long v27 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v28 = 1024;
      int v29 = 673;
      uint64_t v25 = "%{public}s::%d:legCh is not >= 2";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x12u);
    }
  }
  else
  {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    if (v19)
    {
      id v20 = v19;
      [v19 setObject:v13 forKeyedSubscript:@"DriverID"];
      [v20 setObject:v14 forKeyedSubscript:@"DriverName"];
      [v20 setObject:v15 forKeyedSubscript:@"LegendChannel"];
      if (v16) {
        [v20 setObject:v16 forKeyedSubscript:@"IOReportGroupName"];
      }
      if (v17) {
        [v20 setObject:v17 forKeyedSubscript:@"IOReportSubGroupName"];
      }
      if (v18) {
        [v20 setObject:v18 forKeyedSubscript:@"IOReportChannelInfo"];
      }
      uint64_t v21 = v20;
      v22 = v21;
      goto LABEL_10;
    }
    v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136446466;
      long long v27 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v28 = 1024;
      int v29 = 676;
      uint64_t v25 = "%{public}s::%d:failed to alloc newch";
      goto LABEL_17;
    }
  }

  uint64_t v21 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136446466;
    long long v27 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
    __int16 v28 = 1024;
    int v29 = 700;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create IOReportChannelRef", (uint8_t *)&v26, 0x12u);
  }
  v22 = 0;
LABEL_10:

  return v22;
}

- (void)_incrementPredicateCachedUsageWithPrefix:(id)a3 q:(id *)a4
{
  CFStringRef var7 = &stru_1000D3628;
  CFStringRef var0 = (const __CFString *)a4->var0;
  CFStringRef var1 = (const __CFString *)a4->var1;
  if (!a4->var0) {
    CFStringRef var0 = &stru_1000D3628;
  }
  if (!var1) {
    CFStringRef var1 = &stru_1000D3628;
  }
  CFStringRef var2 = (const __CFString *)a4->var2;
  CFStringRef var3 = (const __CFString *)a4->var3;
  if (!var2) {
    CFStringRef var2 = &stru_1000D3628;
  }
  if (!var3) {
    CFStringRef var3 = &stru_1000D3628;
  }
  CFStringRef var4 = (const __CFString *)a4->var4;
  CFStringRef var5 = (const __CFString *)a4->var5;
  if (!var4) {
    CFStringRef var4 = &stru_1000D3628;
  }
  if (!var5) {
    CFStringRef var5 = &stru_1000D3628;
  }
  CFStringRef var6 = (const __CFString *)a4->var6;
  if (!var6) {
    CFStringRef var6 = &stru_1000D3628;
  }
  if (a4->var7) {
    CFStringRef var7 = (const __CFString *)a4->var7;
  }
  id v13 = +[NSString stringWithFormat:@"%@ G: %@,%@,%@,%@ g: %@,%@,%@,%@", a3, var0, var1, var2, var3, var4, var5, var6, var7];
  +[WAUtil incrementValueForKey:v13 inMutableDict:self->_cachedUsage onQueue:self->_queue];
}

- (id)_buildPredicateList:(int64_t)a3 wlan:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      id v6 = [(id)qword_1000F0F60 mutableCopy];
      if (a4 == 1)
      {
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000F0F70;
        id v39 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v93 objects:v112 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v94;
          do
          {
            for (i = 0; i != v40; i = (char *)i + 1)
            {
              if (*(void *)v94 != v41) {
                objc_enumerationMutation(v7);
              }
              [v6 addObject:*(void *)(*((void *)&v93 + 1) + 8 * i)];
            }
            id v40 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v93 objects:v112 count:16];
          }
          while (v40);
        }
      }
      else if (a4 == 2)
      {
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000F0F68;
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v97 objects:v113 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v98;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v98 != v10) {
                objc_enumerationMutation(v7);
              }
              [v6 addObject:*(void *)(*((void *)&v97 + 1) + 8 * (void)j)];
            }
            id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v97 objects:v113 count:16];
          }
          while (v9);
        }
      }
      else
      {
        v43 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v109 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          __int16 v110 = 1024;
          int v111 = 746;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
        }

        WALogCategoryDefaultHandle();
        uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v44 = "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchAllStaticPredicates";
          goto LABEL_110;
        }
      }
      goto LABEL_105;
    case 1:
      id v6 = objc_alloc_init((Class)NSMutableArray);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v12 = (id)qword_1000F0F60;
      id v13 = [v12 countByEnumeratingWithState:&v89 objects:v107 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v90;
        do
        {
          for (k = 0; k != v14; k = (char *)k + 1)
          {
            if (*(void *)v90 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v89 + 1) + 8 * (void)k);
            id v18 = [v17 objectForKeyedSubscript:@"mutates"];

            if (v18) {
              [v6 addObject:v17];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v89 objects:v107 count:16];
        }
        while (v14);
      }

      if (a4 == 1)
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v19 = (id)qword_1000F0F70;
        id v45 = [v19 countByEnumeratingWithState:&v81 objects:v105 count:16];
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = *(void *)v82;
          do
          {
            for (m = 0; m != v46; m = (char *)m + 1)
            {
              if (*(void *)v82 != v47) {
                objc_enumerationMutation(v19);
              }
              long long v49 = *(void **)(*((void *)&v81 + 1) + 8 * (void)m);
              long long v50 = [v49 objectForKeyedSubscript:@"mutates"];

              if (v50) {
                [v6 addObject:v49];
              }
            }
            id v46 = [v19 countByEnumeratingWithState:&v81 objects:v105 count:16];
          }
          while (v46);
        }
      }
      else if (a4 == 2)
      {
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v19 = (id)qword_1000F0F68;
        id v20 = [v19 countByEnumeratingWithState:&v85 objects:v106 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v86;
          do
          {
            for (n = 0; n != v21; n = (char *)n + 1)
            {
              if (*(void *)v86 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v85 + 1) + 8 * (void)n);
              uint64_t v25 = [v24 objectForKeyedSubscript:@"mutates"];

              if (v25) {
                [v6 addObject:v24];
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v85 objects:v106 count:16];
          }
          while (v21);
        }
      }
      else
      {
        v51 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v109 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          __int16 v110 = 1024;
          int v111 = 790;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 0x12u);
        }

        id v19 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 2u);
        }
      }

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v7 = self->_cachedPredicatesNotYetFound;
      id v52 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v77 objects:v104 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v78;
        do
        {
          for (ii = 0; ii != v53; ii = (char *)ii + 1)
          {
            if (*(void *)v78 != v54) {
              objc_enumerationMutation(v7);
            }
            uint64_t v56 = *(void *)(*((void *)&v77 + 1) + 8 * (void)ii);
            if (([v6 containsObject:v56] & 1) == 0) {
              [v6 addObject:v56];
            }
          }
          id v53 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v77 objects:v104 count:16];
        }
        while (v53);
      }
      goto LABEL_105;
    case 2:
      id v6 = [(NSMutableArray *)self->_cachedPredicatesNotYetFound copy];
      break;
    case 3:
      id v6 = objc_alloc_init((Class)NSMutableArray);
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v26 = (id)qword_1000F0F60;
      id v27 = [v26 countByEnumeratingWithState:&v73 objects:v103 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v74;
        do
        {
          for (jj = 0; jj != v28; jj = (char *)jj + 1)
          {
            if (*(void *)v74 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = *(void **)(*((void *)&v73 + 1) + 8 * (void)jj);
            __int16 v32 = [v31 objectForKeyedSubscript:@"mutates"];

            if (v32) {
              [v6 addObject:v31];
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v73 objects:v103 count:16];
        }
        while (v28);
      }

      if (a4 == 1)
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000F0F70;
        id v57 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v65 objects:v101 count:16];
        if (v57)
        {
          id v58 = v57;
          uint64_t v59 = *(void *)v66;
          do
          {
            for (kk = 0; kk != v58; kk = (char *)kk + 1)
            {
              if (*(void *)v66 != v59) {
                objc_enumerationMutation(v7);
              }
              v61 = *(void **)(*((void *)&v65 + 1) + 8 * (void)kk);
              v62 = [v61 objectForKeyedSubscript:@"mutates" (void)v65];

              if (v62) {
                [v6 addObject:v61];
              }
            }
            id v58 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v65 objects:v101 count:16];
          }
          while (v58);
        }
      }
      else if (a4 == 2)
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000F0F68;
        id v33 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v69 objects:v102 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v70;
          do
          {
            for (mm = 0; mm != v34; mm = (char *)mm + 1)
            {
              if (*(void *)v70 != v35) {
                objc_enumerationMutation(v7);
              }
              v37 = *(void **)(*((void *)&v69 + 1) + 8 * (void)mm);
              v38 = [v37 objectForKeyedSubscript:@"mutates"];

              if (v38) {
                [v6 addObject:v37];
              }
            }
            id v34 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v69 objects:v102 count:16];
          }
          while (v34);
        }
      }
      else
      {
        v63 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v109 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          __int16 v110 = 1024;
          int v111 = 844;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchMutablePredicates", buf, 0x12u);
        }

        WALogCategoryDefaultHandle();
        uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v44 = "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchMutablePredicates";
LABEL_110:
          _os_log_fault_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_FAULT, v44, buf, 2u);
        }
      }
LABEL_105:

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (unint64_t)_addDriverChannelsMatchingPredicateList:(int64_t)a3
{
  uint64_t entryID = 0;
  CFMutableDictionaryRef v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR addDriverChannelsMatchingPredicateList", "Mode %ld", buf, 0xCu);
  }

  id v4 = +[WAApple80211Manager sharedObject];
  v139 = [v4 getInfraApple80211];

  if (!v139)
  {
    v11 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 868;
    v115 = "%{public}s::%d:invalid apple80211API";
LABEL_161:
    v116 = v11;
    uint32_t v117 = 18;
LABEL_162:
    _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, v115, buf, v117);
    goto LABEL_163;
  }
  CFStringRef v5 = self;
  if (self->_srv && self->_drvName && self->_providerNum && self->_drvPath && self->_wlanType) {
    goto LABEL_25;
  }
  unsigned int v6 = [(WAIOReporterMessagePopulator *)self _getIOServiceWithForceRefresh:0 apple80211:v139];
  self->_unsigned int srv = v6;
  if (!v6)
  {
    v11 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 875;
    v115 = "%{public}s::%d:Failed to retrieve io_service_t of driver";
    goto LABEL_161;
  }
  if (!IORegistryEntryGetRegistryEntryID(v6, &entryID)) {
    goto LABEL_17;
  }
  uint64_t v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    unsigned int srv = self->_srv;
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 878;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = entryID;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = srv;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx _srv was %d", buf, 0x22u);
  }

  unsigned int v9 = [(WAIOReporterMessagePopulator *)self _getIOServiceWithForceRefresh:1 apple80211:v139];
  self->_unsigned int srv = v9;
  uint64_t v10 = WALogCategoryDefaultHandle();
  v11 = v10;
  if (!v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 882;
    v115 = "%{public}s::%d:Failed to find io_service_t";
    goto LABEL_161;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = self->_srv;
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 884;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found new io_service_t _srv is now %d", buf, 0x18u);
  }

  if (!IORegistryEntryGetRegistryEntryID(self->_srv, &entryID))
  {
LABEL_17:
    id v13 = [v139 getIOReportingDriverName];
    drvName = self->_drvName;
    self->_drvName = v13;

    if (self->_drvName)
    {
      id v15 = objc_alloc((Class)NSNumber);
      id v16 = (NSNumber *)[v15 initWithLongLong:entryID];
      providerNum = self->_providerNum;
      self->_providerNum = v16;

      if (self->_providerNum)
      {
        id v18 = [v139 getIOReportingClassPath];
        drvPath = self->_drvPath;
        self->_drvPath = v18;

        if (self->_drvPath)
        {
          id v20 = [v139 getDriverType];
          CFStringRef v5 = self;
          self->_int64_t wlanType = (int64_t)v20;
          if (v20)
          {
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&uint8_t buf[8] = 3221225472;
            *(void *)&buf[16] = nullsub_1;
            *(void *)&buf[24] = &unk_1000D0CF8;
            *(void *)&buf[32] = v20;
            if (qword_1000F0F58 != -1) {
              dispatch_once(&qword_1000F0F58, buf);
            }
            if (!self->_drvName || !self->_providerNum)
            {
LABEL_143:
              v11 = WALogCategoryDefaultHandle();
              if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                goto LABEL_163;
              }
              BOOL v111 = v5->_drvName == 0;
              int64_t wlanType = v5->_wlanType;
              BOOL v113 = v5->_providerNum == 0;
              BOOL v114 = v5->_drvPath == 0;
              *(_DWORD *)buf = 136447490;
              *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 903;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v111;
              *(_WORD *)&buf[24] = 1024;
              *(_DWORD *)&buf[26] = v113;
              *(_WORD *)&buf[30] = 1024;
              *(_DWORD *)&buf[32] = v114;
              *(_WORD *)&buf[36] = 2048;
              *(void *)&buf[38] = wlanType;
              v115 = "%{public}s::%d:Invalid drvName %d and providerNum %d and drvPath %d _wlanType %ld";
              v116 = v11;
              uint32_t v117 = 46;
              goto LABEL_162;
            }
LABEL_25:
            if (v5->_drvPath && v5->_wlanType)
            {
              -[WAIOReporterMessagePopulator _buildPredicateList:wlan:](v5, "_buildPredicateList:wlan:", a3);
              long long v156 = 0u;
              long long v157 = 0u;
              long long v154 = 0u;
              long long v155 = 0u;
              id obj = (id)objc_claimAutoreleasedReturnValue();
              id v129 = [obj countByEnumeratingWithState:&v154 objects:v176 count:16];
              if (!v129)
              {
                uint64_t v127 = 0;
                unint64_t v128 = 0;
                v138 = 0;
                goto LABEL_138;
              }
              uint64_t v127 = 0;
              unint64_t v128 = 0;
              v138 = 0;
              uint64_t v120 = *(void *)v155;
              *(void *)&long long v21 = 136447490;
              long long v118 = v21;
              while (1)
              {
                for (i = 0; i != v129; i = (char *)i + 1)
                {
                  if (*(void *)v155 != v120) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v22 = *(NSObject **)(*((void *)&v154 + 1) + 8 * i);
                  long long v175 = 0u;
                  memset(buf, 0, sizeof(buf));
                  char v153 = 0;
                  id v23 = WALogCategoryDefaultHandle();
                  if (os_signpost_enabled(v23))
                  {
                    *(_WORD *)v159 = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Query and append IOReportLegend", "", v159, 2u);
                  }

                  v24 = [v22 objectForKeyedSubscript:@"gbegin"];
                  BOOL v25 = v24 == 0;

                  if (!v25)
                  {
                    uint64_t v26 = [v22 objectForKeyedSubscript:@"gbegin"];
                    id v27 = *(void **)buf;
                    *(void *)buf = v26;
                  }
                  id v28 = [v22 objectForKeyedSubscript:@"gcont", v118];
                  BOOL v29 = v28 == 0;

                  if (!v29)
                  {
                    uint64_t v30 = [v22 objectForKeyedSubscript:@"gcont"];
                    id v31 = *(void **)&buf[8];
                    *(void *)&uint8_t buf[8] = v30;
                  }
                  __int16 v32 = [v22 objectForKeyedSubscript:@"gends"];
                  BOOL v33 = v32 == 0;

                  if (!v33)
                  {
                    uint64_t v34 = [v22 objectForKeyedSubscript:@"gends"];
                    uint64_t v35 = *(void **)&buf[16];
                    *(void *)&buf[16] = v34;
                  }
                  id v36 = [v22 objectForKeyedSubscript:@"gis"];
                  BOOL v37 = v36 == 0;

                  if (!v37)
                  {
                    uint64_t v38 = [v22 objectForKeyedSubscript:@"gis"];
                    id v39 = *(void **)&buf[24];
                    *(void *)&buf[24] = v38;
                  }
                  id v40 = [v22 objectForKeyedSubscript:@"sgbegin"];
                  BOOL v41 = v40 == 0;

                  if (!v41)
                  {
                    uint64_t v42 = [v22 objectForKeyedSubscript:@"sgbegin"];
                    v43 = *(void **)&buf[32];
                    *(void *)&buf[32] = v42;
                  }
                  v44 = [v22 objectForKeyedSubscript:@"sgcont"];
                  BOOL v45 = v44 == 0;

                  if (!v45)
                  {
                    uint64_t v46 = [v22 objectForKeyedSubscript:@"sgcont"];
                    uint64_t v47 = *(void **)&buf[40];
                    *(void *)&buf[40] = v46;
                  }
                  long long v48 = [v22 objectForKeyedSubscript:@"sgends"];
                  BOOL v49 = v48 == 0;

                  if (!v49)
                  {
                    uint64_t v50 = [v22 objectForKeyedSubscript:@"sgends"];
                    v51 = (void *)v175;
                    *(void *)&long long v175 = v50;
                  }
                  id v52 = [v22 objectForKeyedSubscript:@"sgis"];
                  BOOL v53 = v52 == 0;

                  if (!v53)
                  {
                    uint64_t v54 = [v22 objectForKeyedSubscript:@"sgis"];
                    int v55 = (void *)*((void *)&v175 + 1);
                    *((void *)&v175 + 1) = v54;
                  }
                  +[WAUtil incrementValueForKey:@"Legend Query Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
                  v137 = [v139 getIOReportLegendItemsMatching:buf retErr:&v153];
                  if (v153 == 1)
                  {
                    +[WAUtil incrementValueForKey:@"Legend Query Failed" inMutableDict:self->_cachedUsage onQueue:self->_queue];
                    [(WAIOReporterMessagePopulator *)self _incrementPredicateCachedUsageWithPrefix:@"Failed Pred: " q:buf];
                    uint64_t v56 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v159 = 136446722;
                      v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      __int16 v161 = 1024;
                      int v162 = 949;
                      __int16 v163 = 2112;
                      uint64_t v164 = (uint64_t)v22;
                      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching pred %@", v159, 0x1Cu);
                    }
                  }
                  if (![v137 count])
                  {
                    [(WAIOReporterMessagePopulator *)self _incrementPredicateCachedUsageWithPrefix:@"Zero Results Pred: " q:buf];
                    if ([(NSMutableArray *)self->_cachedPredicatesNotYetFound containsObject:v22])
                    {
                      long long v95 = [v22 objectForKeyedSubscript:@"rare"];
                      BOOL v96 = v95 == 0;

                      long long v97 = WALogCategoryDefaultHandle();
                      BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
                      if (!v96)
                      {
                        if (v98)
                        {
                          *(_DWORD *)v159 = 136446722;
                          v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                          __int16 v161 = 1024;
                          int v162 = 964;
                          __int16 v163 = 2112;
                          uint64_t v164 = (uint64_t)v22;
                          long long v99 = v97;
                          long long v100 = "%{public}s::%d:Failed to discover known missing rare pred %@";
                          goto LABEL_119;
                        }
LABEL_120:

                        long long v91 = WALogCategoryDefaultHandle();
                        if (!os_signpost_enabled(v91)) {
                          goto LABEL_123;
                        }
                        *(_DWORD *)v159 = 138412290;
                        v160 = (const char *)v22;
                        long long v92 = v91;
                        long long v93 = "Failed Dictionary %@";
                        uint32_t v94 = 12;
                        goto LABEL_122;
                      }
                      if (!v98) {
                        goto LABEL_120;
                      }
                      *(_DWORD *)v159 = 136446722;
                      v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      __int16 v161 = 1024;
                      int v162 = 962;
                      __int16 v163 = 2112;
                      uint64_t v164 = (uint64_t)v22;
                      long long v99 = v97;
                      long long v100 = "%{public}s::%d:Failed to discover known missing pred %@";
                    }
                    else
                    {
                      v101 = WALogCategoryDefaultHandle();
                      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                      {
                        id v102 = [(NSMutableArray *)self->_cachedPredicatesNotYetFound count];
                        *(_DWORD *)v159 = 136446978;
                        v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                        __int16 v161 = 1024;
                        int v162 = 956;
                        __int16 v163 = 2048;
                        uint64_t v164 = (uint64_t)v102;
                        __int16 v165 = 2112;
                        v166 = v22;
                        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Adding _cachedPredicatesNotYetFound existing count %lu %@", v159, 0x26u);
                      }

                      [(NSMutableArray *)self->_cachedPredicatesNotYetFound addObject:v22];
                      long long v97 = WALogCategoryDefaultHandle();
                      if (!os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_120;
                      }
                      cachedPredicatesNotYetFound = self->_cachedPredicatesNotYetFound;
                      *(_DWORD *)v159 = 136446722;
                      v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      __int16 v161 = 1024;
                      int v162 = 959;
                      __int16 v163 = 2112;
                      uint64_t v164 = (uint64_t)cachedPredicatesNotYetFound;
                      long long v99 = v97;
                      long long v100 = "%{public}s::%d:_cachedPredicatesNotYetFound is now %@";
                    }
LABEL_119:
                    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, v100, v159, 0x1Cu);
                    goto LABEL_120;
                  }
                  id v57 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                  {
                    id v58 = [v137 count];
                    *(_DWORD *)v159 = 136446978;
                    v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                    __int16 v161 = 1024;
                    int v162 = 972;
                    __int16 v163 = 2048;
                    uint64_t v164 = (uint64_t)v58;
                    __int16 v165 = 2112;
                    v166 = v22;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found %lu legends pred %@", v159, 0x26u);
                  }

                  if ([(NSMutableArray *)self->_cachedPredicatesNotYetFound containsObject:v22])
                  {
                    uint64_t v59 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v159 = 136446722;
                      v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      __int16 v161 = 1024;
                      int v162 = 975;
                      __int16 v163 = 2112;
                      uint64_t v164 = (uint64_t)v22;
                      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found a previously missing pred %@", v159, 0x1Cu);
                    }

                    [(NSMutableArray *)self->_cachedPredicatesNotYetFound removeObject:v22];
                    v60 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                    {
                      v61 = self->_cachedPredicatesNotYetFound;
                      *(_DWORD *)v159 = 136446722;
                      v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                      __int16 v161 = 1024;
                      int v162 = 977;
                      __int16 v163 = 2112;
                      uint64_t v164 = (uint64_t)v61;
                      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_cachedPredicatesNotYetFound is now %@", v159, 0x1Cu);
                    }
                  }
                  long long v151 = 0u;
                  long long v152 = 0u;
                  long long v149 = 0u;
                  long long v150 = 0u;
                  id v131 = v137;
                  id v122 = [v131 countByEnumeratingWithState:&v149 objects:v173 count:16];
                  if (v122)
                  {
                    uint64_t v125 = *(void *)v150;
                    do
                    {
                      for (j = 0; j != v122; j = (char *)j + 1)
                      {
                        if (*(void *)v150 != v125) {
                          objc_enumerationMutation(v131);
                        }
                        v62 = *(void **)(*((void *)&v149 + 1) + 8 * (void)j);
                        v133 = [v62 objectForKeyedSubscript:@"IOReportChannels"];
                        v135 = [v62 objectForKeyedSubscript:@"IOReportChannelInfo"];
                        uint64_t v63 = [v62 objectForKeyedSubscript:@"IOReportGroupName"];
                        uint64_t v64 = [v62 objectForKeyedSubscript:@"IOReportSubGroupName"];
                        if (v64) {
                          BOOL v65 = v63 == 0;
                        }
                        else {
                          BOOL v65 = 0;
                        }
                        if (!v65)
                        {
                          long long v147 = 0u;
                          long long v148 = 0u;
                          long long v145 = 0u;
                          long long v146 = 0u;
                          id v130 = v133;
                          id v66 = [v130 countByEnumeratingWithState:&v145 objects:v172 count:16];
                          v123 = (void *)v63;
                          v124 = v64;
                          if (!v66) {
                            goto LABEL_101;
                          }
                          uint64_t v121 = *(void *)v146;
                          while (1)
                          {
                            id v119 = v66;
                            for (k = 0; k != v119; k = (char *)k + 1)
                            {
                              if (*(void *)v146 != v121) {
                                objc_enumerationMutation(v130);
                              }
                              long long v68 = *(void **)(*((void *)&v145 + 1) + 8 * (void)k);
                              long long v69 = v138;
                              if (!v138)
                              {
                                long long v82 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                                long long v83 = [v82 objectForKeyedSubscript:&off_1000E3FE8];
                                BOOL v84 = v83 == 0;

                                if (v84)
                                {
                                  Aggregate = (void *)IOReportCreateAggregate();
                                  long long v86 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                                  [v86 setObject:Aggregate forKeyedSubscript:&off_1000E3FE8];
                                }
                                long long v87 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                                uint64_t v88 = [v87 objectForKeyedSubscript:&off_1000E3FE8];

                                long long v69 = (void *)v88;
                                if (!v88)
                                {
                                  v104 = WALogCategoryDefaultHandle();
                                  if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v159 = 136446466;
                                    v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                    __int16 v161 = 1024;
                                    int v162 = 1014;
                                    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to alloc drvchs", v159, 0x12u);
                                  }

                                  v105 = WALogCategoryDefaultHandle();
                                  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v159 = 136446466;
                                    v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                    __int16 v161 = 1024;
                                    int v162 = 1016;
                                    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to alloc drvchs", v159, 0x12u);
                                  }
                                  v138 = 0;
                                  goto LABEL_131;
                                }
                              }
                              v138 = v69;
                              long long v70 = [v69 objectForKeyedSubscript:@"IOReportChannels"];
                              if (!v70)
                              {
                                id v71 = objc_alloc_init((Class)NSMutableArray);
                                [v138 setObject:v71 forKeyedSubscript:@"IOReportChannels"];

                                long long v70 = [v138 objectForKeyedSubscript:@"IOReportChannels"];
                                if (!v70)
                                {
                                  v105 = WALogCategoryDefaultHandle();
                                  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v159 = 136446466;
                                    v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                    __int16 v161 = 1024;
                                    int v162 = 1024;
                                    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to retrieve or alloc chlist", v159, 0x12u);
                                  }
LABEL_131:

                                  sub_100016220((uint64_t)buf);
                                  v11 = obj;
                                  v106 = obj;
                                  goto LABEL_132;
                                }
                              }
                              long long v143 = 0u;
                              long long v144 = 0u;
                              long long v141 = 0u;
                              long long v142 = 0u;
                              long long v72 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                              long long v73 = [v72 objectForKeyedSubscript:&off_1000E3FE8];
                              long long v74 = [v73 objectForKeyedSubscript:@"IOReportChannels"];

                              long long v75 = (char *)[v74 countByEnumeratingWithState:&v141 objects:v171 count:16];
                              if (v75)
                              {
                                uint64_t v76 = *(void *)v142;
                                while (2)
                                {
                                  for (m = 0; m != v75; ++m)
                                  {
                                    if (*(void *)v142 != v76) {
                                      objc_enumerationMutation(v74);
                                    }
                                    uint64_t ChannelID = IOReportChannelGetChannelID();
                                    long long v79 = [v68 objectAtIndex:0];
                                    id v80 = [v79 unsignedLongLongValue];

                                    if (v80 == (id)ChannelID)
                                    {
                                      ++v127;
                                      goto LABEL_91;
                                    }
                                  }
                                  long long v75 = (char *)[v74 countByEnumeratingWithState:&v141 objects:v171 count:16];
                                  if (v75) {
                                    continue;
                                  }
                                  break;
                                }
                              }

                              long long v81 = [(WAIOReporterMessagePopulator *)self createChannelWithProviderID:self->_providerNum providerName:self->_drvName legCh:v68 groupName:v123 subgroupName:v124 chinfo:v135];
                              if (v81)
                              {
                                [v70 addObject:v81];
                                ++v128;
                              }
                              else
                              {
                                long long v74 = WALogCategoryDefaultHandle();
                                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)v159 = v118;
                                  v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                                  __int16 v161 = 1024;
                                  int v162 = 1042;
                                  __int16 v163 = 2112;
                                  uint64_t v164 = (uint64_t)v123;
                                  __int16 v165 = 2112;
                                  v166 = v124;
                                  __int16 v167 = 2112;
                                  v168 = v68;
                                  __int16 v169 = 2112;
                                  v170 = v135;
                                  _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create channel groupName %@ subgroup %@ legCh %@ chinfo %@, continuing", v159, 0x3Au);
                                }
LABEL_91:

                                long long v81 = 0;
                              }
                            }
                            id v66 = [v130 countByEnumeratingWithState:&v145 objects:v172 count:16];
                            if (!v66)
                            {
LABEL_101:

                              long long v90 = v123;
                              long long v89 = v124;
                              goto LABEL_105;
                            }
                          }
                        }
                        long long v89 = WALogCategoryDefaultHandle();
                        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v159 = 136446722;
                          v160 = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                          __int16 v161 = 1024;
                          int v162 = 989;
                          __int16 v163 = 2112;
                          long long v90 = (void *)v64;
                          uint64_t v164 = v64;
                          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unpacking legend yields subgroupName %@ with no groupName, continuing", v159, 0x1Cu);
                        }
                        else
                        {
                          long long v90 = (void *)v64;
                        }
LABEL_105:
                      }
                      id v122 = [v131 countByEnumeratingWithState:&v149 objects:v173 count:16];
                    }
                    while (v122);
                  }

                  long long v91 = WALogCategoryDefaultHandle();
                  if (os_signpost_enabled(v91))
                  {
                    *(_WORD *)v159 = 0;
                    long long v92 = v91;
                    long long v93 = "";
                    uint32_t v94 = 2;
LABEL_122:
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Query and append IOReportLegend", v93, v159, v94);
                  }
LABEL_123:

                  sub_100016220((uint64_t)buf);
                }
                id v129 = [obj countByEnumeratingWithState:&v154 objects:v176 count:16];
                if (!v129)
                {
LABEL_138:

                  v109 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136446978;
                    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 1057;
                    *(_WORD *)&buf[18] = 2048;
                    *(void *)&buf[20] = v128;
                    *(_WORD *)&buf[28] = 2048;
                    *(void *)&buf[30] = v127;
                    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finished finding IOReporter channels... Success - added %lu duplicate %lu", buf, 0x26u);
                  }

                  v108 = WALogCategoryDefaultHandle();
                  if (os_signpost_enabled(v108))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)&uint8_t buf[4] = a3;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v108, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR addDriverChannelsMatchingPredicateList", "Mode %ld", buf, 0xCu);
                  }
                  goto LABEL_142;
                }
              }
            }
            goto LABEL_143;
          }
          v11 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_163;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 899;
          v115 = "%{public}s::%d:failed to get _wlanType through getDriverType";
        }
        else
        {
          v11 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_163;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 896;
          v115 = "%{public}s::%d:failed to get _drvPath through getIOReportingClassPath";
        }
      }
      else
      {
        v11 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_163;
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 893;
        v115 = "%{public}s::%d:failed to alloc providerNum";
      }
    }
    else
    {
      v11 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_163;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 890;
      v115 = "%{public}s::%d:Failed to get _drvName through getIOReportingDriverName";
    }
    goto LABEL_161;
  }
  v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 886;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = entryID;
    v115 = "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx";
    v116 = v11;
    uint32_t v117 = 28;
    goto LABEL_162;
  }
LABEL_163:
  uint64_t v127 = 0;
  unint64_t v128 = 0;
  v106 = 0;
  v138 = 0;
LABEL_132:

  v107 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1065;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v128;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v127;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%{public}s::%d:Finished finding IOReporter channels... Error - added %lu duplicate %lu", buf, 0x26u);
  }

  v108 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v108))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v108, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR addDriverChannelsMatchingPredicateList", "Error", buf, 2u);
  }
  id obj = v106;
LABEL_142:

  return v128;
}

- (void)signalPotentialNewIORChannels
{
  objc_initWeak(&location, self);
  CFMutableDictionaryRef v3 = WALogCategoryDefaultHandle();
  id v4 = (char *)os_signpost_id_generate(v3);

  CFStringRef v5 = WALogCategoryDefaultHandle();
  unsigned int v6 = v5;
  if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "IOR signalPotentialNewIORChannels", "", buf, 2u);
  }

  uint64_t v7 = [(WAIOReporterMessagePopulator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019600;
  block[3] = &unk_1000D0D70;
  objc_copyWeak(v9, &location);
  block[4] = self;
  v9[1] = v4;
  dispatch_sync(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_signalPotentialNewIORChannels
{
  CFMutableDictionaryRef v3 = +[NSDate date];
  if (self->_rescanTimerRunning)
  {
    id v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v129 = 1024;
      int v130 = 1108;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Ignoring, waiting for _rescanTimerRunning to run", buf, 0x12u);
    }
    goto LABEL_132;
  }
  +[WAUtil incrementValueForKey:@"Rescan Signal Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Rescan Siganl Date"];
  [(NSMutableDictionary *)self->_cachedUsage setObject:v3 forKey:@"Rescan Siganl Date"];
  CFStringRef v5 = +[WAApple80211Manager sharedObject];
  id v4 = [v5 getInfraApple80211];

  if (!v4)
  {
    uint64_t v50 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_94;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1117;
    id v80 = "%{public}s::%d:invalid apple80211API";
    long long v81 = v50;
    os_log_type_t v82 = OS_LOG_TYPE_ERROR;
    goto LABEL_93;
  }
  id v6 = [v4 getPhyMode];
  uint64_t v7 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_cachedUsage setObject:v8 forKeyedSubscript:@"Phy Types Found after signal API"];
  }
  unsigned int v9 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:v6];
  v11 = [v9 objectForKeyedSubscript:v10];

  id v124 = v6;
  if (!v11)
  {
    id v25 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v26 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
    id v27 = +[NSNumber numberWithUnsignedInteger:v6];
    [v26 setObject:v25 forKeyedSubscript:v27];

    CFStringRef v21 = 0;
    char v23 = 1;
    char v24 = 1;
LABEL_23:
    char v22 = 1;
    goto LABEL_24;
  }
  unsigned int v12 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1134;
    __int16 v131 = 2048;
    double v132 = *(double *)&v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Already recscanned due to this phy %lu", buf, 0x1Cu);
  }

  id v13 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  id v14 = [v13 objectForKeyedSubscript:&off_1000E3FE8];
  id v15 = [v14 count];

  id v16 = [(NSMutableDictionary *)self->_cachedChannelsCountPerIORPopulatable objectForKeyedSubscript:&off_1000E3FE8];
  id v17 = [v16 unsignedIntegerValue];

  if (v17 > v15)
  {
    id v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(NSMutableDictionary *)self->_cachedChannelsCountPerIORPopulatable objectForKeyedSubscript:&off_1000E3FE8];
      id v20 = [v19 unsignedIntegerValue];
      *(_DWORD *)buf = 136446978;
      unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v129 = 1024;
      int v130 = 1143;
      __int16 v131 = 2048;
      double v132 = *(double *)&v15;
      __int16 v133 = 2048;
      double v134 = *(double *)&v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Considering Exploratory Rescan: currentChannelCount %lu previous max chanels %lu", buf, 0x26u);
    }
    CFStringRef v21 = 0;
    char v22 = 0;
    char v23 = 1;
    char v24 = 1;
    goto LABEL_24;
  }
  id v28 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];

  if (v28)
  {
    BOOL v29 = [(NSMutableDictionary *)self->_cachedUsage valueForKey:@"Rescan Permitted: Last Rescan Date"];
    [v3 timeIntervalSinceDate:v29];
    if (v30 >= 0.0) {
      double v31 = v30;
    }
    else {
      double v31 = -v30;
    }
    if ([(RecommendationPreferences *)self->_preferences ior_rescan_budget_exploratory_seconds] < v31)
    {
      __int16 v32 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1158;
        __int16 v131 = 2048;
        double v132 = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Considering Exploratory Rescan: Last rescan was %f s ago", buf, 0x1Cu);
      }

      CFStringRef v21 = 0;
      char v24 = 0;
      char v23 = 1;
      goto LABEL_23;
    }
  }
  uint64_t v54 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1167;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Rescan not selected due to isExploratory or isLessThanPreviousMaxChannels", buf, 0x12u);
  }

  int v55 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];

  if (!v55)
  {
    id v56 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_cachedUsage setObject:v56 forKeyedSubscript:@"Interface Types Found after signal API"];
  }
  id v57 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API", v124];
  id v58 = [v57 objectForKeyedSubscript:@"ap"];
  if (v58)
  {
  }
  else
  {
    unsigned int v59 = [v4 hasSoftAPInterfaceListed];

    if (v59)
    {
      v60 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1182;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found AP", buf, 0x12u);
      }

      char v23 = 0;
      char v24 = 1;
      char v22 = 1;
      CFStringRef v21 = @"ap";
      goto LABEL_24;
    }
  }
  v61 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
  v62 = [v61 objectForKeyedSubscript:@"nan"];
  if (v62)
  {
  }
  else
  {
    unsigned int v69 = [v4 hasNANInterfaceListed];

    if (v69)
    {
      long long v70 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1190;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found NAN", buf, 0x12u);
      }

      char v23 = 0;
      char v24 = 1;
      char v22 = 1;
      CFStringRef v21 = @"nan";
      goto LABEL_24;
    }
  }
  id v71 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
  long long v72 = [v71 objectForKeyedSubscript:@"awdl"];
  if (v72)
  {
  }
  else
  {
    unsigned int v73 = [v4 hasAWDLInterfaceListed];

    if (v73)
    {
      long long v74 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1198;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found AWDL", buf, 0x12u);
      }

      char v23 = 0;
      char v24 = 1;
      char v22 = 1;
      CFStringRef v21 = @"awdl";
      goto LABEL_24;
    }
  }
  long long v75 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
  uint64_t v76 = [v75 objectForKeyedSubscript:@"ir"];
  if (v76)
  {

LABEL_91:
    uint64_t v50 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_94;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1211;
    id v80 = "%{public}s::%d:Rescan not selected due to No new Interfaces found";
    long long v81 = v50;
    os_log_type_t v82 = OS_LOG_TYPE_DEBUG;
LABEL_93:
    _os_log_impl((void *)&_mh_execute_header, v81, v82, v80, buf, 0x12u);
    goto LABEL_94;
  }
  unsigned int v78 = [v4 hasIRInterfaceListed];

  if (!v78) {
    goto LABEL_91;
  }
  long long v79 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1206;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Interface found IR", buf, 0x12u);
  }

  char v23 = 0;
  char v24 = 1;
  char v22 = 1;
  CFStringRef v21 = @"ir";
LABEL_24:
  BOOL v33 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Permitted: Last Rescan Date", v124];

  if (v33)
  {
    uint64_t v34 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];
    [v3 timeIntervalSinceDate:v34];
    double v36 = v35;

    BOOL v37 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      double v38 = -v36;
      unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      if (v36 >= 0.0) {
        double v38 = v36;
      }
      __int16 v129 = 1024;
      int v130 = 1219;
      __int16 v131 = 2048;
      double v132 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Last rescan was %f s ago", buf, 0x1Cu);
    }
  }
  char v126 = v22;
  if (v23)
  {
    if (v11)
    {
      if (v22)
      {
        if (v24)
        {
          id v39 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v129 = 1024;
            int v130 = 1285;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:Testing budget with no reason", buf, 0x12u);
          }
          char v40 = v24;

          goto LABEL_103;
        }
        uint64_t v63 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Explore Date"];

        if (v63)
        {
          uint64_t v64 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Explore Date"];
          [v3 timeIntervalSinceDate:v64];
          double v66 = v65;

          if (v66 < 0.0) {
            double v66 = -v66;
          }
          double v67 = (double)[(RecommendationPreferences *)self->_preferences ior_rescan_budget_less_than_previous_max_channels_seconds];
          uint64_t v50 = WALogCategoryDefaultHandle();
          BOOL v68 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (v66 < v67)
          {
            if (v68)
            {
              id v52 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Explore Count"];
              *(_DWORD *)buf = 136446978;
              unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              __int16 v129 = 1024;
              int v130 = 1268;
              __int16 v131 = 2112;
              double v132 = *(double *)&v52;
              __int16 v133 = 2048;
              double v134 = v66;
              BOOL v53 = "%{public}s::%d:Rescan Budget Denied: Explore - previous rescans %@ - last check was %f s ago";
              goto LABEL_68;
            }
            goto LABEL_94;
          }
          if (v68)
          {
            long long v85 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Explore Count"];
            *(_DWORD *)buf = 136446978;
            unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v129 = 1024;
            int v130 = 1271;
            __int16 v131 = 2112;
            double v132 = *(double *)&v85;
            __int16 v133 = 2048;
            double v134 = v66;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Missing Channels - previous rescans %@ - last check was %f s ago", buf, 0x26u);
          }
        }
        else
        {
          uint64_t v50 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v129 = 1024;
            int v130 = 1274;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Explore - first rescan", buf, 0x12u);
          }
        }
        char v40 = v24;

        +[WAUtil incrementValueForKey:@"Rescan Reason: Explore Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
        cachedUsage = self->_cachedUsage;
        CFStringRef v43 = @"Rescan Reason: Explore Date";
      }
      else
      {
        BOOL v45 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Low Channel Date"];

        if (v45)
        {
          uint64_t v46 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Low Channel Date"];
          [v3 timeIntervalSinceDate:v46];
          double v48 = v47;

          if (v48 < 0.0) {
            double v48 = -v48;
          }
          double v49 = (double)[(RecommendationPreferences *)self->_preferences ior_rescan_budget_less_than_previous_max_channels_seconds];
          uint64_t v50 = WALogCategoryDefaultHandle();
          BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (v48 < v49)
          {
            if (v51)
            {
              id v52 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Low Channel Count"];
              *(_DWORD *)buf = 136446978;
              unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              __int16 v129 = 1024;
              int v130 = 1246;
              __int16 v131 = 2112;
              double v132 = *(double *)&v52;
              __int16 v133 = 2048;
              double v134 = v48;
              BOOL v53 = "%{public}s::%d:Rescan Budget Denied: Missing Channels - previous rescans %@ - last check was %f s ago";
LABEL_68:
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v53, buf, 0x26u);
            }
LABEL_94:

            +[WAUtil incrementValueForKey:@"Rescan Denied" inMutableDict:self->_cachedUsage onQueue:self->_queue];
            long long v83 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v84 = self->_cachedUsage;
              *(_DWORD *)buf = 136446722;
              unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              __int16 v129 = 1024;
              int v130 = 1358;
              __int16 v131 = 2112;
              double v132 = *(double *)&v84;
              _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan not performed: %@", buf, 0x1Cu);
            }

            goto LABEL_132;
          }
          if (v51)
          {
            long long v77 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Rescan Reason: Low Channel Count"];
            *(_DWORD *)buf = 136446978;
            unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v129 = 1024;
            int v130 = 1249;
            __int16 v131 = 2112;
            double v132 = *(double *)&v77;
            __int16 v133 = 2048;
            double v134 = v48;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Missing Channels - previous rescans %@ - last check was %f s ago", buf, 0x26u);
          }
        }
        else
        {
          uint64_t v50 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v129 = 1024;
            int v130 = 1252;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: Missing Channels - first rescan", buf, 0x12u);
          }
        }
        char v40 = v24;

        +[WAUtil incrementValueForKey:@"Rescan Reason: Low Channel Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
        cachedUsage = self->_cachedUsage;
        CFStringRef v43 = @"Rescan Reason: Low Channel Date";
      }
    }
    else
    {
      v44 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1232;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: New Phy - granted", buf, 0x12u);
      }
      char v40 = v24;

      +[WAUtil incrementValueForKey:@"Rescan Reason: New Phy Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
      cachedUsage = self->_cachedUsage;
      CFStringRef v43 = @"Rescan Reason: New Phy Date";
    }
  }
  else
  {
    BOOL v41 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v129 = 1024;
      int v130 = 1223;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Budget OK: New Interface - granted", buf, 0x12u);
    }
    char v40 = v24;

    +[WAUtil incrementValueForKey:@"Rescan Reason: New Interface Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    cachedUsage = self->_cachedUsage;
    CFStringRef v43 = @"Rescan Reason: New Interface Date";
  }
  [(NSMutableDictionary *)cachedUsage removeObjectForKey:v43];
  [(NSMutableDictionary *)self->_cachedUsage setObject:v3 forKey:v43];
LABEL_103:
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Rescan Permitted: Last Rescan Date"];
  [(NSMutableDictionary *)self->_cachedUsage setObject:v3 forKey:@"Rescan Permitted: Last Rescan Date"];
  +[WAUtil incrementValueForKey:@"Rescan Permitted: Last Rescan Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  long long v86 = WALogCategoryDefaultHandle();
  long long v87 = v86;
  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v129 = 1024;
      int v130 = 1297;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: New Interface found - rescanning", buf, 0x12u);
    }

    uint64_t v88 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
    long long v89 = [v88 objectForKeyedSubscript:v21];

    if (!v89)
    {
      id v90 = objc_alloc_init((Class)NSMutableDictionary);
      long long v91 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
      [v91 setObject:v90 forKeyedSubscript:v21];
    }
    long long v92 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
    long long v93 = [v92 objectForKeyedSubscript:v21];
    +[WAUtil incrementValueForKey:@"Rescan Permitted: Last Rescan Count" inMutableDict:v93 onQueue:self->_queue];

    uint32_t v94 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
    long long v95 = [v94 objectForKeyedSubscript:v21];
    BOOL v96 = [v95 objectForKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];

    if (v96)
    {
      long long v97 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
      BOOL v98 = [v97 objectForKeyedSubscript:v21];
      [v98 setObject:0 forKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];
    }
    long long v99 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Interface Types Found after signal API"];
    long long v100 = [v99 objectForKeyedSubscript:v21];
    [v100 setObject:v3 forKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];

    v101 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_130;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1311;
    goto LABEL_129;
  }
  if (v11)
  {
    if (v126)
    {
      if (v40)
      {
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
          __int16 v129 = 1024;
          int v130 = 1349;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%{public}s::%d:Rescan granted with no reason", buf, 0x12u);
        }

        goto LABEL_132;
      }
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1340;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: Performing exploratory scan - rescanning", buf, 0x12u);
      }

      +[WAUtil incrementValueForKey:@"Rescan Reason: Explore Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
      [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Rescan Reason: Explore Date"];
      [(NSMutableDictionary *)self->_cachedUsage setObject:v3 forKey:@"Rescan Reason: Explore Date"];
      v123 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v129 = 1024;
        int v130 = 1345;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 0x12u);
      }

      [(WAIOReporterMessagePopulator *)self _buildOrRescanToBuildChannelAvailabilityCaches:1];
      uint64_t v121 = self;
      uint64_t v122 = 1;
LABEL_131:
      [(WAIOReporterMessagePopulator *)v121 _iorPreparedForSampling:v122];
      goto LABEL_132;
    }
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v129 = 1024;
      int v130 = 1331;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: Max channels still not found - rescanning", buf, 0x12u);
    }

    +[WAUtil incrementValueForKey:@"Rescan Reason: Low Channel Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Rescan Reason: Low Channel Date"];
    [(NSMutableDictionary *)self->_cachedUsage setObject:v3 forKey:@"Rescan Reason: Low Channel Date"];
    v101 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
LABEL_130:

      [(WAIOReporterMessagePopulator *)self _buildOrRescanToBuildChannelAvailabilityCaches:1];
      uint64_t v121 = self;
      uint64_t v122 = 0;
      goto LABEL_131;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1336;
LABEL_129:
    _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchUnfoundAndMutablePredicates", buf, 0x12u);
    goto LABEL_130;
  }
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v128 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v129 = 1024;
    int v130 = 1315;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:IORescan: New Phy Type in use - scheduling rescanning", buf, 0x12u);
  }

  id v102 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
  v103 = +[NSNumber numberWithUnsignedInteger:v125];
  v104 = [v102 objectForKeyedSubscript:v103];

  if (!v104)
  {
    id v105 = objc_alloc_init((Class)NSMutableDictionary);
    v106 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
    v107 = +[NSNumber numberWithUnsignedInteger:v125];
    [v106 setObject:v105 forKeyedSubscript:v107];
  }
  v108 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
  v109 = +[NSNumber numberWithUnsignedInteger:v125];
  __int16 v110 = [v108 objectForKeyedSubscript:v109];
  +[WAUtil incrementValueForKey:@"Rescan Permitted: Last Rescan Count" inMutableDict:v110 onQueue:self->_queue];

  BOOL v111 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
  v112 = +[NSNumber numberWithUnsignedInteger:v125];
  BOOL v113 = [v111 objectForKeyedSubscript:v112];
  BOOL v114 = [v113 objectForKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];

  if (v114)
  {
    v115 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
    v116 = +[NSNumber numberWithUnsignedInteger:v125];
    uint32_t v117 = [v115 objectForKeyedSubscript:v116];
    [v117 setObject:0 forKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];
  }
  long long v118 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Phy Types Found after signal API"];
  id v119 = +[NSNumber numberWithUnsignedInteger:v125];
  uint64_t v120 = [v118 objectForKeyedSubscript:v119];
  [v120 setObject:v3 forKeyedSubscript:@"Rescan Permitted: Last Rescan Date"];

  [(WAIOReporterMessagePopulator *)self _delayedInvocationForRescan];
LABEL_132:
}

- (void)_cancelDelayedInvocationForRescan
{
  if (self->_rescanTimerRunning)
  {
    rescanTimer = self->_rescanTimer;
    if (rescanTimer)
    {
      if (!dispatch_source_testcancel(rescanTimer))
      {
        id v4 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136446466;
          id v8 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForRescan]";
          __int16 v9 = 1024;
          int v10 = 1367;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending", (uint8_t *)&v7, 0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_rescanTimer);
        self->_BOOL rescanTimerRunning = 0;
        CFStringRef v5 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          BOOL rescanTimerRunning = self->_rescanTimerRunning;
          int v7 = 136446722;
          id v8 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForRescan]";
          __int16 v9 = 1024;
          int v10 = 1370;
          __int16 v11 = 1024;
          BOOL v12 = rescanTimerRunning;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _rescanTimerRunning %d", (uint8_t *)&v7, 0x18u);
        }
      }
    }
  }
}

- (void)_delayedInvocationForRescan
{
  CFMutableDictionaryRef v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL rescanTimerRunning = self->_rescanTimerRunning;
    unint64_t v5 = [(RecommendationPreferences *)self->_preferences ior_rescan_new_phy_delay_seconds];
    rescanTimer = self->_rescanTimer;
    BOOL v7 = rescanTimer != 0;
    if (rescanTimer) {
      BOOL v8 = dispatch_source_testcancel(rescanTimer) != 0;
    }
    else {
      BOOL v8 = 0;
    }
    *(_DWORD *)buf = 136447490;
    BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    __int16 v34 = 1024;
    int v35 = 1376;
    __int16 v36 = 1024;
    *(_DWORD *)BOOL v37 = rescanTimerRunning;
    *(_WORD *)&v37[4] = 2048;
    *(void *)&v37[6] = v5;
    __int16 v38 = 1024;
    BOOL v39 = v7;
    __int16 v40 = 1024;
    BOOL v41 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_rescanTimerRunning is %d ior_rescan_new_phy_delay_seconds is %lu _timer exists %d testcancel is %d", buf, 0x2Eu);
  }

  if (self->_rescanTimerRunning) {
    goto LABEL_31;
  }
  __int16 v9 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    __int16 v34 = 1024;
    int v35 = 1379;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
  }

  int v10 = self->_rescanTimer;
  if (v10)
  {
    if (!dispatch_source_testcancel(v10))
    {
LABEL_22:
      id v18 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v19 = [(RecommendationPreferences *)self->_preferences ior_rescan_new_phy_delay_seconds];
        *(_DWORD *)buf = 136446722;
        BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v34 = 1024;
        int v35 = 1405;
        __int16 v36 = 2048;
        *(void *)BOOL v37 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s", buf, 0x1Cu);
      }

      id v20 = self->_rescanTimer;
      dispatch_time_t v21 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000* [(RecommendationPreferences *)self->_preferences ior_rescan_new_phy_delay_seconds]);
      dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      char v22 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v34 = 1024;
        int v35 = 1407;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
      }

      char v23 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v34 = 1024;
        int v35 = 1409;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _timer", buf, 0x12u);
      }

      dispatch_resume((dispatch_object_t)self->_rescanTimer);
      self->_BOOL rescanTimerRunning = 1;
      char v24 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v25 = self->_rescanTimerRunning;
        *(_DWORD *)buf = 136446722;
        BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v34 = 1024;
        int v35 = 1413;
        __int16 v36 = 1024;
        *(_DWORD *)BOOL v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _rescanTimerRunning %d", buf, 0x18u);
      }

LABEL_31:
      uint64_t v26 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v27 = self->_rescanTimerRunning;
        unint64_t v28 = [(RecommendationPreferences *)self->_preferences ior_rescan_new_phy_delay_seconds];
        BOOL v29 = self->_rescanTimer;
        if (v29) {
          BOOL v30 = dispatch_source_testcancel(v29) == 0;
        }
        else {
          BOOL v30 = 0;
        }
        *(_DWORD *)buf = 136447234;
        BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v34 = 1024;
        int v35 = 1417;
        __int16 v36 = 1024;
        *(_DWORD *)BOOL v37 = v27;
        *(_WORD *)&v37[4] = 2048;
        *(void *)&v37[6] = v28;
        __int16 v38 = 1024;
        BOOL v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d", buf, 0x28u);
      }
      goto LABEL_36;
    }
LABEL_17:
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
      __int16 v34 = 1024;
      int v35 = 1391;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    id v16 = self->_rescanTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001B7A0;
    handler[3] = &unk_1000D0D98;
    handler[4] = self;
    dispatch_source_set_event_handler(v16, handler);
    id v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
      __int16 v34 = 1024;
      int v35 = 1402;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_22;
  }
  __int16 v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    __int16 v34 = 1024;
    int v35 = 1385;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _rescanTimer", buf, 0x12u);
  }

  BOOL v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  id v13 = self->_rescanTimer;
  self->_rescanTimer = v12;

  id v14 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v33 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    __int16 v34 = 1024;
    int v35 = 1387;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _rescanTimer Done", buf, 0x12u);
  }

  if (self->_rescanTimer) {
    goto LABEL_17;
  }
  uint64_t v26 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to create _timer", buf, 2u);
  }
LABEL_36:
}

- (void)scanPredicatesNotYetFoundAndMutable
{
  objc_initWeak(&location, self);
  CFMutableDictionaryRef v3 = [(WAIOReporterMessagePopulator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BA20;
  block[3] = &unk_1000D0BF0;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_sync(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_scanPredicatesWithMode:(int64_t)a3
{
  id v5 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  id v6 = [v5 objectForKeyedSubscript:&off_1000E3FE8];

  if (v6)
  {
    BOOL v7 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
    BOOL v8 = [v7 objectForKeyedSubscript:&off_1000E3FE8];
    id v9 = [v8 count];

    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = 0;
    if (!a3) {
      goto LABEL_9;
    }
  }
  if (!v9)
  {
    int v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136446978;
      BOOL v33 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
      __int16 v34 = 1024;
      int v35 = 1447;
      __int16 v36 = 2048;
      BOOL v37 = (_UNKNOWN **)a3;
      __int16 v38 = 2048;
      BOOL v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:predicateSearch %ld when previousChannelCount %lu, changing predicateSearch to kWAIORIOReporterSearchAllStaticPredicates", (uint8_t *)&v32, 0x26u);
    }

    a3 = 0;
    goto LABEL_13;
  }
LABEL_9:
  if (a3 == 2)
  {
    uint64_t v11 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];
    if (v11)
    {
      BOOL v12 = (void *)v11;
      id v13 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];
      id v14 = [v13 count];

      if (!v14)
      {
        BOOL v30 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        int v32 = 136446466;
        BOOL v33 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
        __int16 v34 = 1024;
        int v35 = 1454;
        double v31 = "%{public}s::%d:predicateSearch kWAIORIOReporterSearchUnfoundPredicates when cachedPredicatesNotYetFound co"
              "unt == 0 returning without scanning";
        goto LABEL_29;
      }
    }
    a3 = 2;
  }
LABEL_13:
  id v15 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR _scanPredicatesWithMode", "", (uint8_t *)&v32, 2u);
  }

  id v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136446722;
    BOOL v33 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
    __int16 v34 = 1024;
    int v35 = 1460;
    __int16 v36 = 2048;
    BOOL v37 = (_UNKNOWN **)a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:addDriverChannelsMatchingPredicateList from _scanPredicatesWithMode %ld", (uint8_t *)&v32, 0x1Cu);
  }

  unint64_t v17 = [(WAIOReporterMessagePopulator *)self _addDriverChannelsMatchingPredicateList:a3];
  if (v17)
  {
    id v18 = (_UNKNOWN **)v17;
    unint64_t v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136446722;
      BOOL v33 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
      __int16 v34 = 1024;
      int v35 = 1465;
      __int16 v36 = 2048;
      BOOL v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found %lu new channels", (uint8_t *)&v32, 0x1Cu);
    }

    id v20 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
    dispatch_time_t v21 = [v20 objectForKeyedSubscript:&off_1000E3FE8];
    id v22 = [v21 count];

    [(WAIOReporterMessagePopulator *)self _freeSubscriptionSample:&off_1000E3FE8];
    char v23 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
    char v24 = [v23 objectForKeyedSubscript:&off_1000E3FE8];
    unsigned int v25 = [v24 unsignedIntValue];

    if ((unint64_t)v22 > v25)
    {
      uint64_t v26 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136447490;
        BOOL v33 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
        __int16 v34 = 1024;
        int v35 = 1472;
        __int16 v36 = 2112;
        BOOL v37 = &off_1000E3FE8;
        __int16 v38 = 2048;
        BOOL v39 = v18;
        __int16 v40 = 2048;
        id v41 = v9;
        __int16 v42 = 2048;
        id v43 = v22;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Increasing max known channel count for group %@ by %lu from %lu to %lu", (uint8_t *)&v32, 0x3Au);
      }

      id v27 = [objc_alloc((Class)NSNumber) initWithUnsignedLong:v22];
      unint64_t v28 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
      [v28 setObject:v27 forKeyedSubscript:&off_1000E3FE8];
    }
    self->_ioReportersCacheNeedsUpdating = 1;
  }
  BOOL v29 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v29))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR _scanPredicatesWithMode", "", (uint8_t *)&v32, 2u);
  }

  BOOL v30 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136446466;
    BOOL v33 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
    __int16 v34 = 1024;
    int v35 = 1481;
    double v31 = "%{public}s::%d:_scanPredicatesWithMode Complete";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v32, 0x12u);
  }
LABEL_30:
}

- (void)_buildOrRescanToBuildChannelAvailabilityCaches:(int64_t)a3
{
  id v5 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  id v6 = +[NSNumber numberWithUnsignedInteger:5];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  BOOL v8 = WALogCategoryDefaultHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 136446722;
      uint64_t v11 = "-[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]";
      __int16 v12 = 1024;
      int v13 = 1499;
      __int16 v14 = 2048;
      int64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _scanPredicatesWithMode:%ld", (uint8_t *)&v10, 0x1Cu);
    }

    [(WAIOReporterMessagePopulator *)self _scanPredicatesWithMode:a3];
  }
  else
  {
    if (v9)
    {
      int v10 = 136446466;
      uint64_t v11 = "-[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]";
      __int16 v12 = 1024;
      int v13 = 1492;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _findChannelsAndBuildChannelCaches:kWAIORIOReporterSearchAllStaticPredicates", (uint8_t *)&v10, 0x12u);
    }

    [(WAIOReporterMessagePopulator *)self _findChannelsAndBuildChannelCaches:0];
  }
}

- (void)_findChannelsAndBuildChannelCaches:(int64_t)a3
{
  uint64_t v101 = 0;
  value = 0;
  __int16 v100 = 0;
  +[WAUtil incrementValueForKey:@"Find Channels Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  id v5 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [(WAIOReporterMessagePopulator *)self setCachedChannelsCountPerIORPopulatable:v6];
  }
  BOOL v7 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];

  if (v7)
  {
    id v8 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
    BOOL v9 = [v8 objectForKeyedSubscript:&off_1000E3FE8];
    id v10 = [v9 count];
  }
  else
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [(WAIOReporterMessagePopulator *)self setCachedIOPopAvailableChannels:v8];
    id v10 = 0;
  }

  if (a3 && !v10)
  {
    uint64_t v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
      __int16 v105 = 1024;
      int v106 = 1532;
      __int16 v107 = 2048;
      *(void *)v108 = a3;
      *(_WORD *)&v108[8] = 2048;
      unint64_t v109 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:predicateSearch %ld when previousChannelCount %lu, changing predicateSearch to kWAIORIOReporterSearchAllStaticPredicates", buf, 0x26u);
    }

    a3 = 0;
LABEL_15:
    id v16 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR FindChannelsAndBuildChannelCaches", "", buf, 2u);
    }

    uint64_t v17 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
    if (v17)
    {
      id v18 = v17;
      unint64_t v19 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
      id v20 = [v19 objectForKeyedSubscript:&off_1000E3FE8];
      if (!v20)
      {

        unsigned int v24 = 0;
LABEL_34:

LABEL_35:
        if (HIBYTE(v100) | v100)
        {
          +[WAUtil incrementValueForKey:@"Fault Detection: Stale DriverID Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
          [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Fault Detection: Stale DriverID Date"];
          cachedUsage = self->_cachedUsage;
          BOOL v30 = +[NSDate now];
          [(NSMutableDictionary *)cachedUsage setObject:v30 forKey:@"Fault Detection: Stale DriverID Date"];

          [(WAIOReporterMessagePopulator *)self _clearIOReporterCache];
          unsigned int v24 = 0;
        }
        else if (v20)
        {
          id v31 = [(NSMutableArray *)self->_cachedPredicatesNotYetFound count];
          int v32 = WALogCategoryDefaultHandle();
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v31)
          {
            if (v33)
            {
              *(_DWORD *)buf = 136446722;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1570;
              __int16 v107 = 2048;
              *(void *)v108 = a3;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Some predicates not found, searching %ld", buf, 0x1Cu);
            }

            __int16 v34 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1572;
              __int16 v107 = 2048;
              *(void *)v108 = a3;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:%ld", buf, 0x1Cu);
            }

            int v35 = self;
            int64_t v36 = a3;
          }
          else
          {
            if (v33)
            {
              *(_DWORD *)buf = 136446466;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1575;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:All predicates found, searching kWAIORIOReporterSearchMutablePredicates", buf, 0x12u);
            }

            BOOL v39 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1577;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchMutablePredicates", buf, 0x12u);
            }

            int v35 = self;
            int64_t v36 = 3;
          }
          [(WAIOReporterMessagePopulator *)v35 _buildOrRescanToBuildChannelAvailabilityCaches:v36];
LABEL_55:
          __int16 v40 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
          id v41 = [v40 objectForKeyedSubscript:&off_1000E3FE8];

          if (!v41 || (int)IOReportGetChannelCount() <= 0)
          {
            uint32_t v94 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1583;
              _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%{public}s::%d:No WiFi Channels found", buf, 0x12u);
            }

            if (v41)
            {
              CFRelease(v41);
              id v41 = 0;
            }
            goto LABEL_118;
          }
          if (!v24)
          {
            if ([(WAIOReporterMessagePopulator *)self _getCCPipeDriverForWLAN])
            {
              __int16 v42 = (const void *)IOReportCopyChannelsForDriver();
              if (v42 && (int)IOReportGetChannelCount() > 0)
              {
                id v43 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  int ChannelCount = IOReportGetChannelCount();
                  int v45 = IOReportGetChannelCount();
                  *(_DWORD *)buf = 136446978;
                  v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v105 = 1024;
                  int v106 = 1592;
                  __int16 v107 = 1024;
                  *(_DWORD *)v108 = ChannelCount;
                  *(_WORD *)&v108[4] = 1024;
                  *(_DWORD *)&v108[6] = v45;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding %d channels to %d", buf, 0x1Eu);
                }

                int v46 = IOReportMergeChannels();
                double v47 = WALogCategoryDefaultHandle();
                double v48 = v47;
                if (!v46)
                {
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    int v49 = IOReportGetChannelCount();
                    *(_DWORD *)buf = 136446722;
                    v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    __int16 v105 = 1024;
                    int v106 = 1598;
                    __int16 v107 = 1024;
                    *(_DWORD *)v108 = v49;
                    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Final channel count %d", buf, 0x18u);
                  }

                  CFRelease(v42);
                  goto LABEL_70;
                }
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v105 = 1024;
                  int v106 = 1596;
                  __int16 v107 = 2112;
                  *(void *)v108 = v101;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get additionalChannels from CCLogPipe driver %@", buf, 0x1Cu);
                }
              }
              else
              {
                long long v99 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v105 = 1024;
                  int v106 = 1590;
                  __int16 v107 = 2112;
                  *(void *)v108 = v101;
                  _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get additionalChannels from CCLogPipe driver %@", buf, 0x1Cu);
                }

                if (!v42) {
                  goto LABEL_118;
                }
              }
              CFRelease(v42);
              goto LABEL_118;
            }
            uint64_t v50 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1601;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't find _getCCPipeDriverForWLAN", buf, 0x12u);
            }
          }
LABEL_70:
          CFDictionaryGetValueIfPresent((CFDictionaryRef)v41, @"IOReportChannels", (const void **)&value);
          if (value && CFArrayGetCount((CFArrayRef)value))
          {
            BOOL v51 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
            if ([v51 isEqualToString:@"dunno"])
            {
            }
            else
            {
              id v52 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];

              if (v52)
              {
LABEL_77:
                id v56 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  id v57 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
                  *(_DWORD *)buf = 136446722;
                  v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v105 = 1024;
                  int v106 = 1616;
                  __int16 v107 = 2112;
                  *(void *)v108 = v57;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%{public}s::%d:InterfaceName is %@", buf, 0x1Cu);
                }
                id v58 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                {
                  unsigned int v59 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                  v60 = [v59 objectForKeyedSubscript:&off_1000E3FE8];
                  v61 = [v60 objectForKeyedSubscript:@"IOReportChannels"];
                  id v62 = [v61 count];
                  *(_DWORD *)buf = 136446978;
                  v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v105 = 1024;
                  int v106 = 1619;
                  __int16 v107 = 2112;
                  *(void *)v108 = &off_1000E3FE8;
                  *(_WORD *)&v108[8] = 2048;
                  unint64_t v109 = (unint64_t)v62;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Cached group %@ has size %lu", buf, 0x26u);
                }
                unint64_t Count = CFArrayGetCount((CFArrayRef)value);
                uint64_t v64 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                double v65 = [v64 objectForKeyedSubscript:&off_1000E3FE8];
                double v66 = [v65 objectForKeyedSubscript:@"IOReportChannels"];
                id v67 = [v66 count];

                if (v67 != (id)Count)
                {
                  BOOL v68 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                  {
                    unsigned int v69 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
                    long long v70 = [v69 objectForKeyedSubscript:&off_1000E3FE8];
                    id v71 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                    long long v72 = [v71 objectForKeyedSubscript:&off_1000E3FE8];
                    unsigned int v73 = [v72 objectForKeyedSubscript:@"IOReportChannels"];
                    id v74 = [v73 count];
                    *(_DWORD *)buf = 136447490;
                    v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    __int16 v105 = 1024;
                    int v106 = 1625;
                    __int16 v107 = 2112;
                    *(void *)v108 = &off_1000E3FE8;
                    *(_WORD *)&v108[8] = 2112;
                    unint64_t v109 = (unint64_t)v70;
                    __int16 v110 = 2048;
                    unint64_t v111 = (unint64_t)v74;
                    __int16 v112 = 2048;
                    unint64_t v113 = Count;
                    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found New Channels to add to cache for group %@, we know we should have %@, current cached channel size %lu new size %lu", buf, 0x3Au);
                  }
                  self->_ioReportersCacheNeedsUpdating = 1;
                  [(WAIOReporterMessagePopulator *)self _freeSubscriptionSample:&off_1000E3FE8];
                  long long v75 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
                  uint64_t v76 = [v75 objectForKeyedSubscript:&off_1000E3FE8];
                  unsigned int v77 = [v76 unsignedIntValue];

                  if (Count > v77)
                  {
                    unsigned int v78 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                    {
                      long long v79 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
                      id v80 = [v79 objectForKeyedSubscript:&off_1000E3FE8];
                      *(_DWORD *)buf = 136447234;
                      v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                      __int16 v105 = 1024;
                      int v106 = 1632;
                      __int16 v107 = 2112;
                      *(void *)v108 = &off_1000E3FE8;
                      *(_WORD *)&v108[8] = 2112;
                      unint64_t v109 = (unint64_t)v80;
                      __int16 v110 = 2048;
                      unint64_t v111 = Count;
                      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Increasing max known channel count for group %@ from %@ to %lu", buf, 0x30u);
                    }
                    id v81 = [objc_alloc((Class)NSNumber) initWithUnsignedLong:Count];
                    os_log_type_t v82 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
                    [v82 setObject:v81 forKeyedSubscript:&off_1000E3FE8];

                    goto LABEL_95;
                  }
                  long long v83 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
                  BOOL v84 = [v83 objectForKeyedSubscript:&off_1000E3FE8];
                  unsigned int v85 = [v84 unsignedIntValue];

                  long long v86 = WALogCategoryDefaultHandle();
                  BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG);
                  if (Count == v85)
                  {
                    if (v87)
                    {
                      *(_DWORD *)buf = 136446722;
                      v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                      __int16 v105 = 1024;
                      int v106 = 1635;
                      __int16 v107 = 2112;
                      *(void *)v108 = &off_1000E3FE8;
                      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "%{public}s::%d:All known channels for group %@ have been found", buf, 0x1Cu);
                    }
                  }
                  else if (v87)
                  {
                    uint64_t v88 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
                    long long v89 = [v88 objectForKeyedSubscript:&off_1000E3FE8];
                    *(_DWORD *)buf = 136447234;
                    v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    __int16 v105 = 1024;
                    int v106 = 1637;
                    __int16 v107 = 2112;
                    *(void *)v108 = &off_1000E3FE8;
                    *(_WORD *)&v108[8] = 2048;
                    unint64_t v109 = Count;
                    __int16 v110 = 2112;
                    unint64_t v111 = (unint64_t)v89;
                    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "%{public}s::%d:There are still missing channels for group %@ have %lu expect %@", buf, 0x30u);
                  }
                }
                if (Count)
                {
LABEL_95:
                  id v90 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
                  [v90 setObject:v41 forKeyedSubscript:&off_1000E3FE8];

                  CFRelease(v41);
                  id v41 = 0;
                  long long v91 = "Success";
LABEL_96:
                  long long v92 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136446722;
                    v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    __int16 v105 = 1024;
                    int v106 = 1651;
                    __int16 v107 = 2080;
                    *(void *)v108 = v91;
                    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finished Finding Channels and Building Caches... %s", buf, 0x1Cu);
                  }

                  if (v41) {
                    CFRelease(v41);
                  }
                  [(WAIOReporterMessagePopulator *)self _delayedInvocationForPersist];
                  long long v93 = WALogCategoryDefaultHandle();
                  if (os_signpost_enabled(v93))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR FindChannelsAndBuildChannelCaches", "", buf, 2u);
                  }
                  goto LABEL_102;
                }
                long long v95 = WALogCategoryDefaultHandle();
                if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_117;
                }
                *(_DWORD *)buf = 136446722;
                v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                __int16 v105 = 1024;
                int v106 = 1641;
                __int16 v107 = 2112;
                *(void *)v108 = &off_1000E3FE8;
                BOOL v96 = "%{public}s::%d:Didn't find any channels for populatable: %@ ";
                long long v97 = v95;
                uint32_t v98 = 28;
                goto LABEL_116;
              }
            }
            BOOL v53 = +[WAApple80211Manager sharedObject];
            uint64_t v54 = [v53 getInfraApple80211];

            if (v54)
            {
              int v55 = [v54 ifName];
              [(WAIOReporterMessagePopulator *)self setInfraInterfaceName:v55];

              goto LABEL_77;
            }
            long long v95 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1612;
              BOOL v96 = "%{public}s::%d:invalid apple80211API";
              goto LABEL_115;
            }
          }
          else
          {
            long long v95 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v105 = 1024;
              int v106 = 1608;
              BOOL v96 = "%{public}s::%d:Failed to copy any channels (via IOReportCopyChannelsForDrivers())... all IOReporter "
                    "metrics disabled";
LABEL_115:
              long long v97 = v95;
              uint32_t v98 = 18;
LABEL_116:
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, v96, buf, v98);
            }
          }
LABEL_117:

LABEL_118:
          long long v91 = "Failure";
          goto LABEL_96;
        }
        BOOL v37 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
          __int16 v105 = 1024;
          int v106 = 1564;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No WiFi Channels exist in cache", buf, 0x12u);
        }

        __int16 v38 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
          __int16 v105 = 1024;
          int v106 = 1566;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _scanPredicatesWithMode:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
        }

        [(WAIOReporterMessagePopulator *)self _scanPredicatesWithMode:0];
        goto LABEL_55;
      }
      dispatch_time_t v21 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
      id v22 = [v21 objectForKeyedSubscript:&off_1000E3FE8];
      char v23 = [v22 objectForKeyedSubscript:@"structuredDict"];

      if (v23)
      {
        unsigned int v24 = [(WAIOReporterMessagePopulator *)self doesDriverHaveChannelsInStructuredDict:1 containsStale:&v100];
        LODWORD(v20) = [(WAIOReporterMessagePopulator *)self doesDriverHaveChannelsInStructuredDict:0 containsStale:(char *)&v100 + 1];
        id v18 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v25 = "is found";
          uint64_t v26 = "is";
          if (v20) {
            id v27 = "is found";
          }
          else {
            id v27 = "is not found";
          }
          v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
          __int16 v105 = 1024;
          int v106 = 1550;
          *(void *)v108 = v27;
          if (HIBYTE(v100)) {
            unint64_t v28 = "is";
          }
          else {
            unint64_t v28 = "is not";
          }
          *(_DWORD *)buf = 136447490;
          if (!v24) {
            unsigned int v25 = "is not found";
          }
          __int16 v107 = 2080;
          *(_WORD *)&v108[8] = 2080;
          unint64_t v109 = (unint64_t)v28;
          if (!(_BYTE)v100) {
            uint64_t v26 = "is not";
          }
          __int16 v110 = 2080;
          unint64_t v111 = (unint64_t)v25;
          __int16 v112 = 2080;
          unint64_t v113 = (unint64_t)v26;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WiFi %s and %s stale, CoreCapture %s and %s stale", buf, 0x3Au);
        }
        goto LABEL_34;
      }
    }
    unsigned int v24 = 0;
    LODWORD(v20) = 0;
    goto LABEL_35;
  }
  if (a3 != 2) {
    goto LABEL_15;
  }
  uint64_t v12 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];
  if (!v12
    || (int v13 = (void *)v12,
        [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound],
        __int16 v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 count],
        v14,
        v13,
        v15))
  {
    a3 = 2;
    goto LABEL_15;
  }
  long long v93 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v104 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
    __int16 v105 = 1024;
    int v106 = 1539;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:predicateSearch kWAIORIOReporterSearchUnfoundPredicates when cachedPredicatesNotYetFound count == 0 returning without scanning", buf, 0x12u);
  }
LABEL_102:
}

- (unsigned)_iorPreparedForSampling:(unsigned __int8)a3
{
  int v3 = a3;
  v103 = 0;
  id v5 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  id v6 = &AnalyticsSendEventLazy_ptr;
  BOOL v7 = +[NSNumber numberWithUnsignedInteger:5];
  id v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    BOOL v9 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];

    if (!v9)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      [(WAIOReporterMessagePopulator *)self setCachedIOReportSubbedChannels:v10];
    }
    uint64_t v11 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];

    if (!v11)
    {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      [(WAIOReporterMessagePopulator *)self setCachedIOReportSample:v12];
    }
    int v13 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
    __int16 v14 = +[NSNumber numberWithUnsignedInteger:5];
    id v15 = [v13 objectForKeyedSubscript:v14];
    if (v15)
    {
      id v16 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
      uint64_t v17 = +[NSNumber numberWithUnsignedInteger:5];
      id v18 = [v16 objectForKeyedSubscript:v17];
      [v18 objectForKeyedSubscript:@"iorsub"];
    }
    unint64_t v19 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Prepare IOReporter", "", buf, 2u);
    }

    id v20 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
    dispatch_time_t v21 = +[NSNumber numberWithUnsignedInteger:5];
    uint64_t v22 = [v20 objectForKeyedSubscript:v21];
    id v102 = self;
    if (!v22)
    {

LABEL_17:
      BOOL v30 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        __int16 v106 = 1024;
        int v107 = 1714;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedIOReportSubbedChannels nil - running and caching IOReportCreateSubscription", buf, 0x12u);
      }

      id v31 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportCreateSubscription", "", buf, 2u);
      }

      +[WAUtil incrementValueForKey:@"CreateSubscription Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
      CFAllocatorGetDefault();
      int v32 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
      BOOL v33 = +[NSNumber numberWithUnsignedInteger:5];
      __int16 v34 = [v32 objectForKeyedSubscript:v33];
      IOReportCreateSubscription();

      +[WAUtil incrementValueForKey:@"CreateSubscription Failed Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
      BOOL v96 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        __int16 v106 = 1024;
        int v107 = 1726;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create iorsub and subbedChannelsRef", buf, 0x12u);
      }

      unint64_t v28 = 0;
      unsigned __int8 v101 = 0;
LABEL_62:
      unsigned int v73 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
      id v74 = +[NSNumber numberWithUnsignedInteger:5];
      long long v75 = [v73 objectForKeyedSubscript:v74];
      uint64_t v76 = [v75 objectForKeyedSubscript:@"iorsub"];
      if (v76)
      {
        unsigned int v77 = (void *)v76;
        unsigned int v78 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
        long long v79 = +[NSNumber numberWithUnsignedInteger:5];
        __int16 v100 = v78;
        id v80 = [v78 objectForKeyedSubscript:v79];
        uint64_t v81 = [v80 objectForKeyedSubscript:@"sampleValues"];
        if (v81)
        {
          os_log_type_t v82 = (void *)v81;
          [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
          long long v83 = v99 = v73;
          BOOL v84 = +[NSNumber numberWithUnsignedInteger:5];
          [v83 objectForKeyedSubscript:v84];
          v86 = unsigned int v85 = v28;
          [v86 objectForKeyedSubscript:@"structuredDict"];
          BOOL v87 = v98 = v74;

          unint64_t v28 = v85;
          id v6 = &AnalyticsSendEventLazy_ptr;
          if (v87)
          {
            unsigned __int8 v29 = 1;
LABEL_69:
            long long v91 = WALogCategoryDefaultHandle();
            if (os_signpost_enabled(v91))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Prepare IOReporter", "", buf, 2u);
            }

            goto LABEL_72;
          }
LABEL_68:
          uint64_t v88 = [v6[286] numberWithUnsignedInteger:5];
          [(WAIOReporterMessagePopulator *)v102 _freeSubscriptionSample:v88];

          +[WAUtil incrementValueForKey:@"IOR Unprepared For Sample Count" inMutableDict:v102->_cachedUsage onQueue:v102->_queue];
          [(NSMutableDictionary *)v102->_cachedUsage removeObjectForKey:@"IOR Unprepared For Sample Date"];
          cachedUsage = v102->_cachedUsage;
          id v90 = +[NSDate now];
          [(NSMutableDictionary *)cachedUsage setObject:v90 forKey:@"IOR Unprepared For Sample Date"];

          unsigned __int8 v29 = v101;
          goto LABEL_69;
        }

        id v6 = &AnalyticsSendEventLazy_ptr;
      }

      goto LABEL_68;
    }
    char v23 = (void *)v22;
    unsigned int v24 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
    unsigned int v25 = +[NSNumber numberWithUnsignedInteger:5];
    uint64_t v26 = [v24 objectForKeyedSubscript:v25];
    id v27 = [v26 objectForKeyedSubscript:@"iorsub"];

    if (!v27) {
      goto LABEL_17;
    }
    int v35 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
    int64_t v36 = +[NSNumber numberWithUnsignedInteger:5];
    BOOL v37 = [v35 objectForKeyedSubscript:v36];
    __int16 v38 = [v37 objectForKeyedSubscript:@"iorsub"];

    if (!v38)
    {
      double v48 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        __int16 v106 = 1024;
        int v107 = 1740;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Don't have iorsub, bailing", buf, 0x12u);
      }
      unint64_t v28 = 0;
      LOBYTE(updated) = 0;
      goto LABEL_61;
    }
    BOOL v39 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
    __int16 v40 = +[NSNumber numberWithUnsignedInteger:5];
    uint64_t v41 = [v39 objectForKeyedSubscript:v40];
    if (v41)
    {
      __int16 v42 = (void *)v41;
      id v43 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
      v44 = +[NSNumber numberWithUnsignedInteger:5];
      int v45 = [v43 objectForKeyedSubscript:v44];
      int v46 = [v45 objectForKeyedSubscript:@"sampleValues"];

      if (v46)
      {
        id v6 = &AnalyticsSendEventLazy_ptr;
        int v49 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
        uint64_t v50 = +[NSNumber numberWithUnsignedInteger:5];
        BOOL v51 = [v49 objectForKeyedSubscript:v50];
        id v52 = [v51 objectForKeyedSubscript:@"structuredDict"];

        if (v52)
        {
          unint64_t v28 = 0;
        }
        else
        {
          BOOL v53 = WALogCategoryDefaultHandle();
          if (os_signpost_enabled(v53))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR createStructuredIOReportDictionary", "", buf, 2u);
          }

          uint64_t v54 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
            __int16 v106 = 1024;
            int v107 = 1789;
            __int16 v108 = 2112;
            CFStringRef v109 = @"WAIORPopSuperSet";
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Making createStructuredIOReportDictionary for %@", buf, 0x1Cu);
          }

          unint64_t v28 = [(WAIOReporterMessagePopulator *)self _createStructuredIOReportDictionary:0];
          int v55 = WALogCategoryDefaultHandle();
          if (os_signpost_enabled(v55))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR createStructuredIOReportDictionary", "", buf, 2u);
          }

          id v56 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
          id v57 = +[NSNumber numberWithUnsignedInteger:5];
          id v58 = [v56 objectForKeyedSubscript:v57];
          [v58 setObject:v28 forKeyedSubscript:@"structuredDict"];
        }
        if (v3 != 1)
        {
          LOBYTE(updated) = 0;
          goto LABEL_54;
        }
        unsigned int v59 = WALogCategoryDefaultHandle();
        if (os_signpost_enabled(v59))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", "", buf, 2u);
        }

        v60 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
        v61 = +[NSNumber numberWithUnsignedInteger:5];
        id v62 = [v60 objectForKeyedSubscript:v61];
        uint64_t v63 = [v62 objectForKeyedSubscript:@"sampleValues"];

        +[WAUtil incrementValueForKey:@"UpdateSamples Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
        int updated = IOReportUpdateSamples();
        double v65 = WALogCategoryDefaultHandle();
        if (os_signpost_enabled(v65))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", "", buf, 2u);
        }

        if (self->_failNextCreateOrUpdateSample)
        {
          double v66 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
            __int16 v106 = 1024;
            int v107 = 1812;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%{public}s::%d:Injecting Error to IOReportUpdateSamples due to _failNextCreateOrUpdateSample", buf, 0x12u);
          }

          +[WAUtil incrementValueForKey:@"Fault Injection: Create or Update Sample Error" inMutableDict:self->_cachedUsage onQueue:self->_queue];
          CFErrorRef v67 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainPOSIX, 1, 0);
          v103 = (__CFString *)v67;
          self->_failNextCreateOrUpdateSample = 0;
          if (!v63) {
            goto LABEL_51;
          }
        }
        else
        {
          CFErrorRef v67 = 0;
          if (!v63) {
            goto LABEL_51;
          }
        }
        if (!v67)
        {
          BOOL v68 = 1;
LABEL_52:
          if (!updated || !v68)
          {
            long long v97 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
              __int16 v106 = 1024;
              int v107 = 1822;
              __int16 v108 = 2112;
              CFStringRef v109 = @"WAIORPopSuperSet";
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOReportUpdateSamples failed for populatable: %@", buf, 0x1Cu);
            }

            if (v103)
            {
              double v48 = WALogCategoryDefaultHandle();
              if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                goto LABEL_61;
              }
              long long v72 = [(__CFString *)v103 localizedDescription];
              *(_DWORD *)buf = 136446978;
              __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
              __int16 v106 = 1024;
              int v107 = 1822;
              __int16 v108 = 2112;
              CFStringRef v109 = v103;
              __int16 v110 = 2112;
              unint64_t v111 = v72;
              long long v93 = "%{public}s::%d:Error returned from IOReportUpdateSamples(): %@ - localized description: %@";
              uint32_t v94 = v48;
              uint32_t v95 = 38;
              goto LABEL_89;
            }
            goto LABEL_57;
          }
LABEL_54:
          unsigned int v69 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
          if ([v69 isEqualToString:@"dunno"])
          {

LABEL_58:
            id v71 = +[WAApple80211Manager sharedObject];
            double v48 = [v71 getInfraApple80211];

            if (v48)
            {
              long long v72 = [v48 ifName];
              [(WAIOReporterMessagePopulator *)self setInfraInterfaceName:v72];
LABEL_60:

LABEL_61:
              unsigned __int8 v101 = updated;

              goto LABEL_62;
            }
            long long v72 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
              goto LABEL_60;
            }
            *(_DWORD *)buf = 136446466;
            __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
            __int16 v106 = 1024;
            int v107 = 1827;
            long long v93 = "%{public}s::%d:invalid apple80211API";
            uint32_t v94 = v72;
            uint32_t v95 = 18;
LABEL_89:
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, v93, buf, v95);
            goto LABEL_60;
          }
          long long v70 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];

          if (!v70) {
            goto LABEL_58;
          }
LABEL_57:
          unsigned __int8 v101 = updated;
          goto LABEL_62;
        }
LABEL_51:
        +[WAUtil incrementValueForKey:@"UpdateSamples Failed Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
        BOOL v68 = v103 == 0;
        goto LABEL_52;
      }
    }
    else
    {
    }
    double v47 = WALogCategoryDefaultHandle();
    double v48 = v47;
    id v6 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
      __int16 v106 = 1024;
      int v107 = 1745;
      __int16 v108 = 2112;
      CFStringRef v109 = @"WAIORPopSuperSet";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:sampleValues not yet saved, but subbedChannelsRef isn't set - state mismatch for: %@, clearing cache", buf, 0x1Cu);
    }
    unint64_t v28 = 0;
    LOBYTE(updated) = 0;
    goto LABEL_61;
  }
  unint64_t v28 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v105 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
    __int16 v106 = 1024;
    int v107 = 1691;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No Channels to build into subscriptions, find channels first", buf, 0x12u);
  }
  unsigned __int8 v29 = 0;
LABEL_72:

  return v29;
}

- (void)determineChannelsPerIORPopulatable
{
  objc_initWeak(&location, self);
  int v3 = WALogCategoryDefaultHandle();
  id v4 = (char *)os_signpost_id_generate(v3);

  id v5 = WALogCategoryDefaultHandle();
  id v6 = v5;
  if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "IOR determineChannelsPerIORPopulatable", "", buf, 2u);
  }

  BOOL v7 = [(WAIOReporterMessagePopulator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EDAC;
  block[3] = &unk_1000D0D70;
  objc_copyWeak(v9, &location);
  block[4] = self;
  v9[1] = v4;
  dispatch_sync(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)determineChannelsPerIORPopulatableWithinPopulatorBlock
{
  if (!self->_hasAttemptedUnpersisting) {
    [(WAIOReporterMessagePopulator *)self unpersistIORObjects];
  }
  +[WAUtil incrementValueForKey:@"External: Determine Channels Within Blocks Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];

  [(WAIOReporterMessagePopulator *)self _findChannelsAndBuildChannelCaches:1];
}

- (BOOL)doesMessageNeedPrepopulation:(id)a3
{
  int v3 = [(id)qword_1000F0F50 objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)prepopulateMessageWithinPopulatorBlock:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!self->_hasAttemptedUnpersisting) {
    [(WAIOReporterMessagePopulator *)self _unpersistIORObjects];
  }
  [(WAIOReporterMessagePopulator *)self _prepopulateMessage:v12 forProcess:v10 groupType:a5 andReply:v11 isResubscribe:0];
}

- (void)prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  int v13 = WALogCategoryDefaultHandle();
  __int16 v14 = (char *)os_signpost_id_generate(v13);

  id v15 = WALogCategoryDefaultHandle();
  id v16 = v15;
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v10 originalClassName];
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v29 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "IOR prepopulateMessage", " message=%{public, signpost.description:attribute}@ ", buf, 0xCu);
  }
  id v18 = [(WAIOReporterMessagePopulator *)self queue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001F1F4;
  v22[3] = &unk_1000D0DC0;
  objc_copyWeak(v26, &location);
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  v26[1] = (id)a5;
  v26[2] = v14;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  dispatch_sync(v18, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)_prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6 isResubscribe:(BOOL)a7
{
  id v12 = a3;
  id v115 = a4;
  id v117 = a6;
  id v13 = v12;
  int v130 = 0;
  v116 = [(WAIOReporterMessagePopulator *)self messageDelegate];
  __int16 v14 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", "", buf, 2u);
  }

  +[WAUtil incrementValueForKey:@"Populate IOReporter Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  int64_t v113 = a5;
  BOOL v114 = a7;
  if (!v13)
  {
    v103 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
      goto LABEL_111;
    }
    *(_DWORD *)buf = 136446466;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 1936;
    v104 = "%{public}s::%d:ERROR messageToPopulate == nil";
LABEL_107:
    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, v104, buf, 0x12u);
    goto LABEL_111;
  }
  id v15 = (void *)qword_1000F0F50;
  id v16 = [v13 originalClassName];
  uint64_t v17 = [v15 objectForKeyedSubscript:v16];

  if (!v17)
  {
    v103 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      __int16 v105 = [v13 originalClassName];
      __int16 v106 = [v13 key];
      *(_DWORD *)buf = 136446978;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 1938;
      __int16 v135 = 2112;
      CFStringRef v136 = v105;
      __int16 v137 = 2112;
      v138 = v106;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWD with original classname: %@ and key: %@ doesn't appear to be setup to be prepopulated. Sending it back as received.", buf, 0x26u);

LABEL_110:
    }
LABEL_111:

LABEL_56:
    id v57 = 0;
    uint64_t v50 = v115;
    goto LABEL_57;
  }
  id v18 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  id v19 = +[NSNumber numberWithUnsignedInteger:5];
  id v20 = [v18 objectForKeyedSubscript:v19];

  if (!v20)
  {
    id v21 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 1942;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _findChannelsAndBuildChannelCaches:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
    }

    [(WAIOReporterMessagePopulator *)self _findChannelsAndBuildChannelCaches:0];
  }
  if (![(WAIOReporterMessagePopulator *)self _iorPreparedForSampling:0])
  {
    +[WAUtil incrementValueForKey:@"IOR Full Teardown Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"IOR Full Teardown Date"];
    cachedUsage = self->_cachedUsage;
    id v23 = +[NSDate now];
    [(NSMutableDictionary *)cachedUsage setObject:v23 forKey:@"IOR Full Teardown Date"];

    [(WAIOReporterMessagePopulator *)self _removeIORChannelsPersistenceFiles];
    [(WAIOReporterMessagePopulator *)self _freeIORCaches];
    id v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 1957;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
    }

    [(WAIOReporterMessagePopulator *)self _buildOrRescanToBuildChannelAvailabilityCaches:0];
    if (![(WAIOReporterMessagePopulator *)self _iorPreparedForSampling:0])
    {
      unsigned int v78 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
        __int16 v133 = 1024;
        int v134 = 1961;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed second to _prepopulateMessage, bailing", buf, 0x12u);
      }

      +[WAUtil incrementValueForKey:@"IOR Full Teardown Failed Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
      goto LABEL_56;
    }
    +[WAUtil incrementValueForKey:@"IOR Full Teardown Recovered Count" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  }
  id v25 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  uint64_t v26 = +[NSNumber numberWithUnsignedInteger:5];
  id v27 = [v25 objectForKeyedSubscript:v26];

  if (!v27)
  {
    v103 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
      goto LABEL_111;
    }
    *(_DWORD *)buf = 136446466;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 1970;
    v104 = "%{public}s::%d:XPC: Didn't have cachedIOPopAvailableChannels, bailing";
    goto LABEL_107;
  }
  unint64_t v28 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
  unsigned __int8 v29 = +[NSNumber numberWithUnsignedInteger:5];
  BOOL v30 = [v28 objectForKeyedSubscript:v29];
  id v31 = [v30 objectForKeyedSubscript:@"iorsub"];

  if (!v31)
  {
    v103 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
      goto LABEL_111;
    }
    *(_DWORD *)buf = 136446466;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 1975;
    v104 = "%{public}s::%d:XPC: Didn't have cachedIOReportSubbedChannels iorsub, bailing";
    goto LABEL_107;
  }
  int v32 = [(WAIOReporterMessagePopulator *)self cachedIOReportSubbedChannels];
  BOOL v33 = +[NSNumber numberWithUnsignedInteger:5];
  __int16 v34 = [v32 objectForKeyedSubscript:v33];
  [v34 objectForKeyedSubscript:@"iorsub"];

  int v35 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  int64_t v36 = +[NSNumber numberWithUnsignedInteger:5];
  BOOL v37 = [v35 objectForKeyedSubscript:v36];
  __int16 v38 = [v37 objectForKeyedSubscript:@"sampleValues"];

  if (!v38)
  {
    v103 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      __int16 v105 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
      int v107 = +[NSNumber numberWithUnsignedInteger:5];
      __int16 v108 = [(__CFString *)v105 objectForKeyedSubscript:v107];
      *(_DWORD *)buf = 136446722;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 1980;
      __int16 v135 = 2112;
      CFStringRef v136 = v108;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%{public}s::%d:Dont have cachedIOReportSample sampleValues %@", buf, 0x1Cu);

      goto LABEL_110;
    }
    goto LABEL_111;
  }
  BOOL v39 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  __int16 v40 = +[NSNumber numberWithUnsignedInteger:5];
  uint64_t v41 = [v39 objectForKeyedSubscript:v40];
  __int16 v42 = [v41 objectForKeyedSubscript:@"sampleValues"];

  id v43 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", "", buf, 2u);
  }

  unsigned __int8 updated = IOReportUpdateSamples();
  int v45 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR IOReportUpdateSamples", "", buf, 2u);
  }

  if (self->_failNextCreateOrUpdateSample)
  {
    int v46 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 1993;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:Injecting Error to IOReportUpdateSamples due to _failNextCreateOrUpdateSample", buf, 0x12u);
    }

    +[WAUtil incrementValueForKey:@"Fault Injection: Create or Update Sample Error" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    CFErrorRef v47 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainPOSIX, 1, 0);
    int v130 = v47;
    self->_failNextCreateOrUpdateSample = 0;
  }
  else
  {
    CFErrorRef v47 = v130;
  }
  if ((updated & (v47 == 0)) != 0) {
    CFStringRef v48 = @"UpdateSamples Calls";
  }
  else {
    CFStringRef v48 = @"UpdateSamples Failed Calls";
  }
  +[WAUtil incrementValueForKey:v48 inMutableDict:self->_cachedUsage onQueue:self->_queue];
  if (v130) {
    unsigned __int8 v49 = 0;
  }
  else {
    unsigned __int8 v49 = updated;
  }
  if ((v49 & 1) == 0)
  {
    CFStringRef v109 = WALogCategoryDefaultHandle();
    uint64_t v50 = v115;
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2005;
      __int16 v135 = 2112;
      CFStringRef v136 = @"WAIORPopSuperSet";
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOReportUpdateSamples failed for populatable: %@", buf, 0x1Cu);
    }

    if (!v130) {
      goto LABEL_39;
    }
    int v55 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    __int16 v110 = [(__CFError *)v130 localizedDescription];
    *(_DWORD *)buf = 136446978;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 2005;
    __int16 v135 = 2112;
    CFStringRef v136 = (const __CFString *)v130;
    __int16 v137 = 2112;
    v138 = v110;
    unint64_t v111 = "%{public}s::%d:Error returned from IOReportUpdateSamples(): %@ - localized description: %@";
    goto LABEL_122;
  }
  uint64_t v50 = v115;
  if (!v42)
  {
    __int16 v112 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2022;
      __int16 v135 = 2112;
      CFStringRef v136 = @"WAIORPopSuperSet";
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Failed to get sample values for populatable type: %@", buf, 0x1Cu);
    }

    if (!v130) {
      goto LABEL_39;
    }
    int v55 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

LABEL_39:
      id v57 = 0;
      goto LABEL_57;
    }
    __int16 v110 = [(__CFError *)v130 localizedDescription];
    *(_DWORD *)buf = 136446978;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 2022;
    __int16 v135 = 2112;
    CFStringRef v136 = (const __CFString *)v130;
    __int16 v137 = 2112;
    v138 = v110;
    unint64_t v111 = "%{public}s::%d:Error returned from IOReportCreateSamples(): %@ - localized description: %@";
LABEL_122:
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, v111, buf, 0x26u);

    goto LABEL_38;
  }
  uint64_t v51 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
  if (!v51
    || (id v52 = (void *)v51,
        [(WAIOReporterMessagePopulator *)self infraInterfaceName],
        BOOL v53 = objc_claimAutoreleasedReturnValue(),
        unsigned int v54 = [v53 isEqualToString:@"dunno"],
        v53,
        v52,
        v54))
  {
    int v55 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      id v56 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
      *(_DWORD *)buf = 136446722;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2024;
      __int16 v135 = 2112;
      CFStringRef v136 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad infraInterfaceName: %@", buf, 0x1Cu);
    }
    goto LABEL_38;
  }
  id v58 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v59 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
    v60 = +[NSNumber numberWithUnsignedInteger:5];
    v61 = [v59 objectForKeyedSubscript:v60];
    CFStringRef v62 = (const __CFString *)[v61 count];
    *(_DWORD *)buf = 136446722;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 2026;
    __int16 v135 = 2048;
    CFStringRef v136 = v62;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%{public}s::%d:cachedIOReportSample has %lu entries in dictionary", buf, 0x1Cu);
  }
  uint64_t v63 = [(WAIOReporterMessagePopulator *)self cachedIOReportSample];
  uint64_t v64 = +[NSNumber numberWithUnsignedInteger:5];
  double v65 = [v63 objectForKeyedSubscript:v64];
  id v57 = [v65 objectForKeyedSubscript:@"structuredDict"];

  if (v57)
  {
    double v66 = [(__CFString *)v57 allKeys];
    id v67 = [v66 count];

    if (v67)
    {
      BOOL v68 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v68))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v68, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR PopulationGroup", "", buf, 2u);
      }

      unsigned int v69 = (void *)qword_1000F0F50;
      long long v70 = [v13 originalClassName];
      id v71 = [v69 objectForKeyedSubscript:v70];
      id v72 = [v71 unsignedIntegerValue];

      unsigned int v73 = dispatch_group_create();
      dispatch_group_enter(v73);
      dispatch_group_enter(v73);
      switch((unint64_t)v72)
      {
        case 0uLL:
        case 6uLL:
          id v74 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            long long v75 = [v13 key];
            uint64_t v76 = [v13 originalClassName];
            *(_DWORD *)buf = 136446978;
            double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
            __int16 v133 = 1024;
            int v134 = 2103;
            __int16 v135 = 2112;
            CFStringRef v136 = v75;
            __int16 v137 = 2112;
            v138 = v76;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%{public}s::%d:unhandled WAIOReporterPopulatableType type! not populating message with key: %@ and classname: %@", buf, 0x26u);
          }
          dispatch_group_leave(v73);
          break;
        case 1uLL:
          long long v91 = WALogCategoryDefaultHandle();
          if (os_signpost_enabled(v91))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopNWActivity Iterator", "", buf, 2u);
          }

          long long v92 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
          v127[0] = _NSConcreteStackBlock;
          v127[1] = 3221225472;
          v127[2] = sub_100020B24;
          v127[3] = &unk_1000D0DE8;
          v127[4] = self;
          id v129 = v117;
          unint64_t v128 = v73;
          sub_100005FB0((uint64_t)v128, v13, v42, v57, v116, v113, v115, v92, v127);

          long long v93 = v129;
          goto LABEL_91;
        case 2uLL:
          uint32_t v94 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
          v124[0] = _NSConcreteStackBlock;
          v124[1] = 3221225472;
          v124[2] = sub_100020CC0;
          v124[3] = &unk_1000D0DE8;
          v124[4] = self;
          id v126 = v117;
          uint64_t v125 = v73;
          sub_1000115B0((uint64_t)v125, v13, v42, v57, v116, v113, v115, v94, v124);

          long long v93 = v126;
          goto LABEL_91;
        case 3uLL:
          uint32_t v95 = WALogCategoryDefaultHandle();
          if (os_signpost_enabled(v95))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopSlowWiFiDiagnosticsCounterSample Iterator", "", buf, 2u);
          }

          BOOL v96 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472;
          v118[2] = sub_100020E08;
          v118[3] = &unk_1000D0DE8;
          v118[4] = self;
          id v120 = v117;
          id v119 = v73;
          sub_100014908((uint64_t)v119, v13, v42, v57, v116, v97, v115, v96, v118);

          long long v93 = v120;
          goto LABEL_91;
        case 4uLL:
          uint32_t v98 = [(WAIOReporterMessagePopulator *)self infraInterfaceName];
          v121[0] = _NSConcreteStackBlock;
          v121[1] = 3221225472;
          v121[2] = sub_100020D64;
          v121[3] = &unk_1000D0DE8;
          v121[4] = self;
          id v123 = v117;
          uint64_t v122 = v73;
          sub_100013638((uint64_t)v122, v13, v42, v57, v116, v99, v115, v98, v121);

          long long v93 = v123;
LABEL_91:

          break;
        case 5uLL:
          id v102 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
            __int16 v133 = 1024;
            int v134 = 2044;
            _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAIORPopSuperSet does not map to a message, replace enumToPopulate of WAIORPopSuperSet back to the intended enumToPopulate", buf, 0x12u);
          }

          break;
        default:
          break;
      }
      __int16 v100 = dispatch_get_global_queue(2, 0);
      dispatch_group_notify(v73, v100, &stru_1000D0E08);

      dispatch_group_leave(v73);
      unsigned __int8 v101 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v101))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v101, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", "", buf, 2u);
      }

      long long v83 = v117;
      goto LABEL_95;
    }
  }
  unsigned int v77 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v133 = 1024;
    int v134 = 2032;
    __int16 v135 = 2112;
    CFStringRef v136 = v57;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad structuredIOReportSample %@", buf, 0x1Cu);
  }

LABEL_57:
  long long v79 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v79))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v79, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateExiting", "", buf, 2u);
  }

  if (v130)
  {
    id v80 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2123;
      __int16 v135 = 2112;
      CFStringRef v136 = (const __CFString *)v130;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%{public}s::%d:Encountered an IOReporter error trying to prepopulate a message. Error: %@", buf, 0x1Cu);
    }

    uint64_t v81 = +[NSNumber numberWithUnsignedInteger:5];
    [(WAIOReporterMessagePopulator *)self _freeSubscriptionSample:v81];

    CFRelease(v130);
    int v130 = 0;
    [(WAIOReporterMessagePopulator *)self _removeIORChannelsPersistenceFiles];
    [(WAIOReporterMessagePopulator *)self _clearIOReporterCache];
    os_log_type_t v82 = WALogCategoryDefaultHandle();
    long long v83 = v117;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2135;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchAllStaticPredicates", buf, 0x12u);
    }

    [(WAIOReporterMessagePopulator *)self _buildOrRescanToBuildChannelAvailabilityCaches:0];
    BOOL v84 = WALogCategoryDefaultHandle();
    unsigned int v85 = v84;
    if (v114)
    {
      if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        goto LABEL_78;
      }
      *(_DWORD *)buf = 136446466;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2143;
      long long v86 = "%{public}s::%d:Already attempted a resubscription - returning without success";
      BOOL v87 = v85;
      os_log_type_t v88 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
        __int16 v133 = 1024;
        int v134 = 2139;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Will attempt a resubscription", buf, 0x12u);
      }

      [(WAIOReporterMessagePopulator *)self _prepopulateMessage:v13 forProcess:v50 groupType:v113 andReply:v117 isResubscribe:1];
      unsigned int v85 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
LABEL_78:

        id v90 = WALogCategoryDefaultHandle();
        if (os_signpost_enabled(v90))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v90, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", "", buf, 2u);
        }

        unsigned int v73 = WALogCategoryDefaultHandle();
        if (os_signpost_enabled(v73))
        {
          *(_WORD *)buf = 0;
          goto LABEL_82;
        }
        goto LABEL_95;
      }
      *(_DWORD *)buf = 136446466;
      double v132 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v133 = 1024;
      int v134 = 2141;
      long long v86 = "%{public}s::%d:Resubscription attempt done";
      BOOL v87 = v85;
      os_log_type_t v88 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v87, v88, v86, buf, 0x12u);
    goto LABEL_78;
  }
  long long v83 = v117;
  (*((void (**)(id, void, void))v117 + 2))(v117, 0, 0);
  long long v89 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v89))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v89, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateIOReporterChannels", "", buf, 2u);
  }

  unsigned int v73 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v73))
  {
    *(_WORD *)buf = 0;
LABEL_82:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PrepopulateExiting", "", buf, 2u);
  }
LABEL_95:
}

+ (id)getIORPopAvailabeIOReportersTempFile
{
  CFMutableDictionaryRef v2 = +[WAUtil wifianalyticsTmpDirectory];
  int v3 = [v2 path];
  BOOL v4 = +[NSString stringWithFormat:@"%@/ch.out", v3];

  return v4;
}

+ (id)getUnavailablePredTempFile
{
  CFMutableDictionaryRef v2 = +[WAUtil wifianalyticsTmpDirectory];
  int v3 = [v2 path];
  BOOL v4 = +[NSString stringWithFormat:@"%@/unavail.out", v3];

  return v4;
}

+ (id)getUsageTempFile
{
  CFMutableDictionaryRef v2 = +[WAUtil wifianalyticsTmpDirectory];
  int v3 = [v2 path];
  BOOL v4 = +[NSString stringWithFormat:@"%@/usage.out", v3];

  return v4;
}

- (void)_removeIORChannelsPersistenceFiles
{
  CFMutableDictionaryRef v2 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
  int v3 = +[NSURL fileURLWithPath:v2 isDirectory:0];

  BOOL v4 = +[NSFileManager defaultManager];
  id v23 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v23];
  id v6 = v23;

  if (v5)
  {
    BOOL v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v25 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v26 = 1024;
      int v27 = 2184;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile file is not deletable", buf, 0x12u);
    }
  }
  else
  {
    if (v6 && [v6 code] != (id)2)
    {
      BOOL v7 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      id v8 = [v6 underlyingErrors];
      *(_DWORD *)buf = 136446978;
      id v25 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v26 = 1024;
      int v27 = 2179;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v3;
      __int16 v30 = 2112;
      id v31 = v8;
      BOOL v9 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile error removing file %@: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      BOOL v7 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      id v8 = [v6 description];
      *(_DWORD *)buf = 136446978;
      id v25 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v26 = 1024;
      int v27 = 2181;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v3;
      __int16 v30 = 2112;
      id v31 = v8;
      BOOL v9 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile successful or does not exist %@: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, 0x26u);
  }
LABEL_11:

  id v12 = +[WAIOReporterMessagePopulator getUnavailablePredTempFile];
  id v13 = +[NSURL fileURLWithPath:v12 isDirectory:0];

  __int16 v14 = +[NSFileManager defaultManager];
  id v22 = v6;
  unsigned __int8 v15 = [v14 removeItemAtURL:v13 error:&v22];
  id v16 = v22;

  if ((v15 & 1) == 0)
  {
    if (v16 && [v16 code] != (id)2)
    {
      uint64_t v17 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      id v18 = [v16 underlyingErrors];
      *(_DWORD *)buf = 136446978;
      id v25 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v26 = 1024;
      int v27 = 2190;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v13;
      __int16 v30 = 2112;
      id v31 = v18;
      id v19 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile error removing file %@: %@";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      uint64_t v17 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      id v18 = [v16 description];
      *(_DWORD *)buf = 136446978;
      id v25 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v26 = 1024;
      int v27 = 2192;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v13;
      __int16 v30 = 2112;
      id v31 = v18;
      id v19 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile successful or does not exist %@: %@";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0x26u);

    goto LABEL_21;
  }
  uint64_t v17 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    id v25 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
    __int16 v26 = 1024;
    int v27 = 2195;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile file is not deletable", buf, 0x12u);
  }
LABEL_21:
}

- (void)_clearIOReporterCache
{
  int v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136446466;
    id v10 = "-[WAIOReporterMessagePopulator _clearIOReporterCache]";
    __int16 v11 = 1024;
    int v12 = 2202;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:Removing IOReporter Cache", (uint8_t *)&v9, 0x12u);
  }

  BOOL v4 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR clearIOReporterCache", "", (uint8_t *)&v9, 2u);
  }

  +[WAUtil incrementValueForKey:@"clearIOReporterCaches Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  unsigned __int8 v5 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  [v5 removeAllObjects];

  id v6 = [(WAIOReporterMessagePopulator *)self cachedChannelsCountPerIORPopulatable];
  [v6 removeAllObjects];

  BOOL v7 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];
  [v7 removeAllObjects];

  id v8 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR clearIOReporterCache", "", (uint8_t *)&v9, 2u);
  }
}

- (void)injectErrorOnNextCreateOrUpdateSample
{
  objc_initWeak(&location, self);
  int v3 = [(WAIOReporterMessagePopulator *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000218B4;
  v4[3] = &unk_1000D0E30;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR encodeWithCoder", "", (uint8_t *)&v9, 2u);
  }

  [v4 encodeObject:self->_cachedChannelsCountPerIORPopulatable forKey:@"_cachedChannelsCountPerIORPopulatable"];
  id v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    cachedChannelsCountPerIORPopulatable = self->_cachedChannelsCountPerIORPopulatable;
    int v9 = 136446722;
    id v10 = "-[WAIOReporterMessagePopulator encodeWithCoder:]";
    __int16 v11 = 1024;
    int v12 = 2234;
    __int16 v13 = 2112;
    __int16 v14 = cachedChannelsCountPerIORPopulatable;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:encoded _cachedChannelsCountPerIORPopulatable %@", (uint8_t *)&v9, 0x1Cu);
  }

  id v8 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR encodeWithCoder", "", (uint8_t *)&v9, 2u);
  }
}

- (WAIOReporterMessagePopulator)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WAIOReporterMessagePopulator;
  id v5 = [(WAIOReporterMessagePopulator *)&v17 init];
  if (v5)
  {
    if (qword_1000F0F90 != -1) {
      dispatch_once(&qword_1000F0F90, &stru_1000D0CD8);
    }
    if (qword_1000F0F78 != -1) {
      dispatch_once(&qword_1000F0F78, &stru_1000D0C78);
    }
    if (qword_1000F0F80 != -1) {
      dispatch_once(&qword_1000F0F80, &stru_1000D0C98);
    }
    if (qword_1000F0F88 != -1) {
      dispatch_once(&qword_1000F0F88, &stru_1000D0CB8);
    }
    id v6 = +[NSString stringWithFormat:@"dunno"];
    [(WAIOReporterMessagePopulator *)v5 setInfraInterfaceName:v6];

    *(_WORD *)&v5->_ioReportersCacheNeedsUpdating = 0;
    v5->_persistFileExistedAtPIDLoad = 0;
    BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.wifi.analytics.IOReporterQ", v7);
    [(WAIOReporterMessagePopulator *)v5 setQueue:v8];

    uint64_t v9 = objc_opt_class();
    id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_cachedChannelsCountPerIORPopulatable"];
    cachedChannelsCountPerIORPopulatable = v5->_cachedChannelsCountPerIORPopulatable;
    v5->_cachedChannelsCountPerIORPopulatable = (NSMutableDictionary *)v11;

    __int16 v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = v5->_cachedChannelsCountPerIORPopulatable;
      *(_DWORD *)buf = 136446722;
      id v19 = "-[WAIOReporterMessagePopulator initWithCoder:]";
      __int16 v20 = 1024;
      int v21 = 2265;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:initWithCoder _cachedChannelsCountPerIORPopulatable %@", buf, 0x1Cu);
    }

    drvName = v5->_drvName;
    v5->_drvName = 0;
  }
  return v5;
}

- (void)unpersistIORObjects
{
  objc_initWeak(&location, self);
  int v3 = [(WAIOReporterMessagePopulator *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021DF0;
  v4[3] = &unk_1000D0E30;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_unpersistIORObjects
{
  int v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Unpersist", "", buf, 2u);
  }

  [(WAIOReporterMessagePopulator *)self setCachedIOPopAvailableChannels:0];
  [(WAIOReporterMessagePopulator *)self setCachedPredicatesNotYetFound:0];
  [(WAIOReporterMessagePopulator *)self setCachedUsage:0];
  id v5 = &AnalyticsSendEventLazy_ptr;
  id v6 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
  BOOL v7 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
  id v96 = 0;
  dispatch_queue_t v8 = +[NSData dataWithContentsOfFile:v7 options:8 error:&v96];
  id v9 = v96;

  id v10 = WALogCategoryDefaultHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v11) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v99 = 1024;
    int v100 = 2332;
    __int16 v13 = "%{public}s::%d:unpersist cachedIOPopAvailableChannels file not available";
    __int16 v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_11;
  }
  if (v11)
  {
    id v12 = [v8 length];
    *(_DWORD *)buf = 136446722;
    uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v99 = 1024;
    int v100 = 2314;
    __int16 v101 = 2048;
    id v102 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:from file: cachedIOPopAvailableChannelsData NSData sizeof is %lu", buf, 0x1Cu);
  }

  if (v9)
  {
    id v10 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v99 = 1024;
    int v100 = 2329;
    __int16 v13 = "%{public}s::%d:Failed to unpersist cachedIOPopAvailableChannels";
    __int16 v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, 0x12u);
    goto LABEL_22;
  }
  os_log_type_t v88 = v4;
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  id v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
  id v95 = 0;
  id v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v23 fromData:v8 error:&v95];
  id v24 = v95;

  id v25 = WALogCategoryDefaultHandle();
  __int16 v26 = v25;
  if (v24 || !v10)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2320;
      __int16 v101 = 2112;
      id v102 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive cachedIOPopAvailableChannels: %@", buf, 0x1Cu);
    }

    id v4 = v88;
    id v5 = &AnalyticsSendEventLazy_ptr;
    id v6 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
  }
  else
  {
    id v6 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = objc_opt_class();
      *(_DWORD *)buf = 136446722;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2323;
      __int16 v101 = 2112;
      id v102 = v27;
      id v28 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist rootChannelDictionary class is %@", buf, 0x1Cu);
    }
    [(WAIOReporterMessagePopulator *)self setCachedIOPopAvailableChannels:v10];
    unsigned __int8 v29 = WALogCategoryDefaultHandle();
    id v5 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2326;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedIOPopAvailableChannels success", buf, 0x12u);
    }

    id v4 = v88;
  }
LABEL_22:

  __int16 v30 = v5[268];
  id v31 = [v6 + 210 getUnavailablePredTempFile];
  id v94 = 0;
  int v32 = [v30 dataWithContentsOfFile:v31 options:8 error:&v94];
  id v33 = v94;

  __int16 v34 = WALogCategoryDefaultHandle();
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (!v32)
  {
    if (!v35) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136446466;
    uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v99 = 1024;
    int v100 = 2358;
    BOOL v37 = "%{public}s::%d:unpersist cachedPredicatesNotYetFound file not available";
    __int16 v38 = v34;
    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_30;
  }
  if (v35)
  {
    id v36 = [v32 length];
    *(_DWORD *)buf = 136446722;
    uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v99 = 1024;
    int v100 = 2341;
    __int16 v101 = 2048;
    id v102 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:from file: cachedUnavailableArrayData NSData sizeof is %lu", buf, 0x1Cu);
  }

  if (v33)
  {
    __int16 v34 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136446466;
    uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v99 = 1024;
    int v100 = 2355;
    BOOL v37 = "%{public}s::%d:Failed to unpersist cachedPredicatesNotYetFound";
    __int16 v38 = v34;
    os_log_type_t v39 = OS_LOG_TYPE_ERROR;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v38, v39, v37, buf, 0x12u);
    goto LABEL_41;
  }
  long long v89 = v4;
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  CFErrorRef v47 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v40, v41, v42, v43, v44, v45, v46, objc_opt_class(), 0);
  id v93 = 0;
  __int16 v34 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v47 fromData:v32 error:&v93];
  id v48 = v93;

  unsigned __int8 v49 = WALogCategoryDefaultHandle();
  uint64_t v50 = v49;
  if (v48 || !v34)
  {
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2346;
      __int16 v101 = 2112;
      id v102 = v48;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive cachedPredicatesNotYetFound: %@", buf, 0x1Cu);
    }

    id v4 = v89;
    id v5 = &AnalyticsSendEventLazy_ptr;
    id v6 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
  }
  else
  {
    id v6 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = objc_opt_class();
      *(_DWORD *)buf = 136446722;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2349;
      __int16 v101 = 2112;
      id v102 = v51;
      id v52 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedUnavailableArray class is %@", buf, 0x1Cu);
    }
    [(WAIOReporterMessagePopulator *)self setCachedPredicatesNotYetFound:v34];
    BOOL v53 = WALogCategoryDefaultHandle();
    id v5 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2352;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedPredicatesNotYetFound success", buf, 0x12u);
    }

    id v4 = v89;
  }
LABEL_41:

  unsigned int v54 = v5[268];
  int v55 = [v6 + 210 getUsageTempFile];
  id v92 = 0;
  id v56 = [v54 dataWithContentsOfFile:v55 options:8 error:&v92];
  id v57 = v92;

  id v58 = WALogCategoryDefaultHandle();
  BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
  if (v56)
  {
    if (v59)
    {
      id v60 = [v56 length];
      *(_DWORD *)buf = 136446722;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2367;
      __int16 v101 = 2048;
      id v102 = v60;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:from file: usageDictData NSData sizeof is %lu", buf, 0x1Cu);
    }

    self->_persistFileExistedAtPIDLoad = 1;
    if (v57)
    {
      v61 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
        __int16 v99 = 1024;
        int v100 = 2382;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unpersist cachedUsage", buf, 0x12u);
      }
    }
    else
    {
      id v90 = v4;
      uint64_t v87 = objc_opt_class();
      uint64_t v62 = objc_opt_class();
      uint64_t v63 = objc_opt_class();
      uint64_t v64 = objc_opt_class();
      uint64_t v65 = objc_opt_class();
      uint64_t v66 = objc_opt_class();
      uint64_t v67 = objc_opt_class();
      uint64_t v68 = objc_opt_class();
      unsigned int v69 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v87, v62, v63, v64, v65, v66, v67, v68, objc_opt_class(), 0);
      id v91 = 0;
      long long v70 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v69 fromData:v56 error:&v91];
      id v71 = v91;

      id v72 = WALogCategoryDefaultHandle();
      unsigned int v73 = v72;
      if (v71 || !v70)
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
          __int16 v99 = 1024;
          int v100 = 2373;
          __int16 v101 = 2112;
          id v102 = v71;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive cachedUsage: %@", buf, 0x1Cu);
        }
      }
      else
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          id v74 = objc_opt_class();
          *(_DWORD *)buf = 136446722;
          uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
          __int16 v99 = 1024;
          int v100 = 2376;
          __int16 v101 = 2112;
          id v102 = v74;
          id v75 = v74;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist usageDict class is %@", buf, 0x1Cu);
        }
        [(WAIOReporterMessagePopulator *)self setCachedUsage:v70];
        uint64_t v76 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
          __int16 v99 = 1024;
          int v100 = 2379;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedUsage success", buf, 0x12u);
        }
      }
      id v4 = v90;
    }
  }
  else
  {
    if (v59)
    {
      *(_DWORD *)buf = 136446466;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2385;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedUsage file not available", buf, 0x12u);
    }

    self->_persistFileExistedAtPIDLoad = 0;
  }

  unsigned int v77 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  if (v77
    || ([(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound],
        (unsigned int v77 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_65:
    unsigned int v78 = WALogCategoryDefaultHandle();
    if (!os_signpost_enabled(v78)) {
      goto LABEL_68;
    }
    *(_WORD *)buf = 0;
    long long v79 = "Success";
    goto LABEL_67;
  }
  long long v86 = [(WAIOReporterMessagePopulator *)self cachedUsage];

  if (v86) {
    goto LABEL_65;
  }
  unsigned int v78 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v78))
  {
    *(_WORD *)buf = 0;
    long long v79 = "Fail";
LABEL_67:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v78, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Unpersist", v79, buf, 2u);
  }
LABEL_68:

  id v80 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];

  if (!v80)
  {
    id v81 = objc_alloc_init((Class)NSMutableArray);
    [(WAIOReporterMessagePopulator *)self setCachedPredicatesNotYetFound:v81];
  }
  os_log_type_t v82 = [(WAIOReporterMessagePopulator *)self cachedUsage];

  if (!v82)
  {
    id v83 = objc_alloc_init((Class)NSMutableDictionary);
    [(WAIOReporterMessagePopulator *)self setCachedUsage:v83];
  }
  BOOL v84 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];

  if (v84)
  {
    unsigned int v85 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint32_t v98 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v99 = 1024;
      int v100 = 2412;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unpersist cachedIOPopAvailableChannels exists, running _iorPreparedForSampling to build reliant objects", buf, 0x12u);
    }

    [(WAIOReporterMessagePopulator *)self _iorPreparedForSampling:0];
  }
  [(WAIOReporterMessagePopulator *)self _handleUnpersistForUsageData];
  self->_hasAttemptedUnpersisting = 1;
}

- (void)persistIORObjects:(unsigned __int8)a3
{
  objc_initWeak(&location, self);
  id v5 = [(WAIOReporterMessagePopulator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022DFC;
  block[3] = &unk_1000D0E58;
  objc_copyWeak(&v7, &location);
  unsigned __int8 v8 = a3;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_persistIORObjects:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR Persist", "", buf, 2u);
  }

  [(WAIOReporterMessagePopulator *)self _cancelDelayedInvocationForPersist];
  if (v3 == 1)
  {
    +[WAUtil incrementValueForKey:@"Terminations - Graceful" inMutableDict:self->_cachedUsage onQueue:self->_queue];
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Last Graceful Termination Date"];
    cachedUsage = self->_cachedUsage;
    id v7 = +[NSDate date];
    [(NSMutableDictionary *)cachedUsage setObject:v7 forKey:@"Last Graceful Termination Date"];
  }
  +[WAUtil incrementValueForKey:@"Persist Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Last Persisted Date"];
  unsigned __int8 v8 = self->_cachedUsage;
  id v9 = +[NSDate date];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:@"Last Persisted Date"];

  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Last Persisted PID"];
  id v10 = self->_cachedUsage;
  uint64_t v11 = +[NSNumber numberWithUnsignedLong:self->_pid];
  [(NSMutableDictionary *)v10 setObject:v11 forKey:@"Last Persisted PID"];

  [(WAIOReporterMessagePopulator *)self _calculateEstimatedUptime];
  id v12 = +[NSFileManager defaultManager];
  __int16 v13 = +[WAIOReporterMessagePopulator getUsageTempFile];
  LOBYTE(v11) = [v12 fileExistsAtPath:v13];

  if ((v11 & 1) == 0)
  {
    __int16 v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v15 = +[WAIOReporterMessagePopulator getUsageTempFile];
      *(_DWORD *)buf = 136446722;
      uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      __int16 v65 = 1024;
      int v66 = 2460;
      __int16 v67 = 2112;
      id v68 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persistence file doesnt yet exist %@", buf, 0x1Cu);
    }
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Persist file creation Date"];
    uint64_t v16 = self->_cachedUsage;
    uint64_t v17 = +[NSDate date];
    [(NSMutableDictionary *)v16 setObject:v17 forKey:@"Persist file creation Date"];
  }
  uint64_t v19 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = +[WAIOReporterMessagePopulator getUsageTempFile];
    uint64_t v21 = [(WAIOReporterMessagePopulator *)self cachedUsage];
    uint64_t v22 = objc_opt_class();
    *(_DWORD *)buf = 136446978;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2468;
    __int16 v67 = 2112;
    id v68 = v20;
    __int16 v69 = 2112;
    id v70 = v22;
    id v23 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Updating file %@ with cachedUsage of class %@", buf, 0x26u);
  }
  id v24 = [(WAIOReporterMessagePopulator *)self cachedUsage];
  id v62 = 0;
  id v25 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v62];
  id v26 = v62;

  int v27 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v25 length];
    *(_DWORD *)buf = 136446722;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2471;
    __int16 v67 = 2048;
    id v68 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedUsage sizeof is %lu", buf, 0x1Cu);
  }

  if (v26)
  {
    unsigned int v54 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2472;
    __int16 v67 = 2112;
    id v68 = v26;
    int v55 = "%{public}s::%d:Failed to archive usages: %@";
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x1Cu);
    goto LABEL_53;
  }
  unsigned __int8 v29 = +[WAIOReporterMessagePopulator getUsageTempFile];
  id v61 = 0;
  [v25 writeToFile:v29 options:1 error:&v61];
  id v26 = v61;

  if (v26)
  {
    unsigned int v54 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    id v56 = +[WAIOReporterMessagePopulator getUsageTempFile];
    *(_DWORD *)buf = 136446978;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2474;
    __int16 v67 = 2112;
    id v68 = v56;
    __int16 v69 = 2112;
    id v70 = v26;
LABEL_52:
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to write to file %@: %@", buf, 0x26u);

    goto LABEL_53;
  }

  BOOL ioReportersCacheNeedsUpdating = self->_ioReportersCacheNeedsUpdating;
  id v31 = WALogCategoryDefaultHandle();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (!ioReportersCacheNeedsUpdating)
  {
    if (v32)
    {
      BOOL v53 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
      *(_DWORD *)buf = 136446722;
      uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      __int16 v65 = 1024;
      int v66 = 2506;
      __int16 v67 = 2112;
      id v68 = v53;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Didn't find new channels, not updating file %@", buf, 0x1Cu);
    }
    uint64_t v51 = WALogCategoryDefaultHandle();
    if (!os_signpost_enabled(v51)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    id v52 = "Skipped";
    goto LABEL_36;
  }
  if (v32)
  {
    id v33 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
    __int16 v34 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
    BOOL v35 = objc_opt_class();
    *(_DWORD *)buf = 136446978;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2481;
    __int16 v67 = 2112;
    id v68 = v33;
    __int16 v69 = 2112;
    id v70 = v35;
    id v36 = v35;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Updating file %@ with cachedIOPopAvailableChannels of class %@", buf, 0x26u);
  }
  BOOL v37 = [(WAIOReporterMessagePopulator *)self cachedIOPopAvailableChannels];
  id v60 = 0;
  id v25 = +[NSKeyedArchiver archivedDataWithRootObject:v37 requiringSecureCoding:1 error:&v60];
  id v26 = v60;

  __int16 v38 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = [v25 length];
    *(_DWORD *)buf = 136446722;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2484;
    __int16 v67 = 2048;
    id v68 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedIOPopAvailableChannels sizeof is %lu", buf, 0x1Cu);
  }

  if (v26)
  {
    unsigned int v54 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2485;
    __int16 v67 = 2112;
    id v68 = v26;
    int v55 = "%{public}s::%d:Failed to archive desired channels: %@";
    goto LABEL_49;
  }
  uint64_t v40 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
  id v59 = 0;
  [v25 writeToFile:v40 options:1 error:&v59];
  id v26 = v59;

  if (v26)
  {
    unsigned int v54 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    id v56 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
    *(_DWORD *)buf = 136446978;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2487;
    __int16 v67 = 2112;
    id v68 = v56;
    __int16 v69 = 2112;
    id v70 = v26;
    goto LABEL_52;
  }

  uint64_t v41 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = +[WAIOReporterMessagePopulator getUnavailablePredTempFile];
    uint64_t v43 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];
    uint64_t v44 = objc_opt_class();
    *(_DWORD *)buf = 136446978;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2492;
    __int16 v67 = 2112;
    id v68 = v42;
    __int16 v69 = 2112;
    id v70 = v44;
    id v45 = v44;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Updating file %@ with cachedPredicatesNotYetFound of class %@", buf, 0x26u);
  }
  uint64_t v46 = [(WAIOReporterMessagePopulator *)self cachedPredicatesNotYetFound];
  id v58 = 0;
  id v25 = +[NSKeyedArchiver archivedDataWithRootObject:v46 requiringSecureCoding:1 error:&v58];
  id v26 = v58;

  CFErrorRef v47 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    id v48 = [v25 length];
    *(_DWORD *)buf = 136446722;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2495;
    __int16 v67 = 2048;
    id v68 = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:cachedPredicatesNotYetFound sizeof is %lu", buf, 0x1Cu);
  }

  if (v26)
  {
    unsigned int v54 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2496;
    __int16 v67 = 2112;
    id v68 = v26;
    int v55 = "%{public}s::%d:Failed to archive cachedPredicatesNotYetFound: %@";
    goto LABEL_49;
  }
  unsigned __int8 v49 = +[WAIOReporterMessagePopulator getUnavailablePredTempFile];
  id v57 = 0;
  [v25 writeToFile:v49 options:1 error:&v57];
  id v26 = v57;

  if (v26)
  {
    unsigned int v54 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      id v56 = +[WAIOReporterMessagePopulator getUnavailablePredTempFile];
      *(_DWORD *)buf = 136446978;
      uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      __int16 v65 = 1024;
      int v66 = 2498;
      __int16 v67 = 2112;
      id v68 = v56;
      __int16 v69 = 2112;
      id v70 = v26;
      goto LABEL_52;
    }
LABEL_53:

    goto LABEL_38;
  }

  uint64_t v50 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v64 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v65 = 1024;
    int v66 = 2503;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DONE", buf, 0x12u);
  }

  uint64_t v51 = WALogCategoryDefaultHandle();
  if (!os_signpost_enabled(v51)) {
    goto LABEL_37;
  }
  *(_WORD *)buf = 0;
  id v52 = "Success";
LABEL_36:
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR Persist", v52, buf, 2u);
LABEL_37:

  self->_BOOL ioReportersCacheNeedsUpdating = 0;
LABEL_38:
}

- (void)_cancelDelayedInvocationForPersist
{
  if (self->_persistTimerRunning)
  {
    persistTimer = self->_persistTimer;
    if (persistTimer)
    {
      if (!dispatch_source_testcancel(persistTimer))
      {
        id v4 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136446466;
          unsigned __int8 v8 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist]";
          __int16 v9 = 1024;
          int v10 = 2522;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending", (uint8_t *)&v7, 0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_persistTimer);
        self->_BOOL persistTimerRunning = 0;
        id v5 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          BOOL persistTimerRunning = self->_persistTimerRunning;
          int v7 = 136446722;
          unsigned __int8 v8 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist]";
          __int16 v9 = 1024;
          int v10 = 2525;
          __int16 v11 = 1024;
          BOOL v12 = persistTimerRunning;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _persistTimerRunning %d", (uint8_t *)&v7, 0x18u);
        }
      }
    }
  }
}

- (void)_delayedInvocationForPersist
{
  BOOL persistTimerRunning = self->_persistTimerRunning;
  id v4 = WALogCategoryDefaultHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (persistTimerRunning)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136446466;
      BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v38 = 1024;
      int v39 = 2532;
      id v6 = "%{public}s::%d:Persist is already scheduled, ignoring additional request";
      int v7 = v4;
      uint32_t v8 = 18;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (v5)
  {
    BOOL v9 = self->_persistTimerRunning;
    unint64_t v10 = [(RecommendationPreferences *)self->_preferences ior_persist_delay_seconds];
    persistTimer = self->_persistTimer;
    BOOL v12 = persistTimer != 0;
    if (persistTimer) {
      BOOL v13 = dispatch_source_testcancel(persistTimer) != 0;
    }
    else {
      BOOL v13 = 0;
    }
    *(_DWORD *)buf = 136447490;
    BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
    __int16 v38 = 1024;
    int v39 = 2536;
    __int16 v40 = 1024;
    *(_DWORD *)uint64_t v41 = v9;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = v10;
    __int16 v42 = 1024;
    BOOL v43 = v12;
    __int16 v44 = 1024;
    BOOL v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_persistTimerRunning is %d ior_persist_delay_seconds is %lu _persistTimer exists %d testcancel is %d", buf, 0x2Eu);
  }

  if (!self->_persistTimerRunning)
  {
    __int16 v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v38 = 1024;
      int v39 = 2539;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
    }

    os_log_type_t v15 = self->_persistTimer;
    if (v15)
    {
      if (!dispatch_source_testcancel(v15))
      {
LABEL_25:
        id v23 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v24 = [(RecommendationPreferences *)self->_preferences ior_persist_delay_seconds];
          *(_DWORD *)buf = 136446722;
          BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v38 = 1024;
          int v39 = 2560;
          __int16 v40 = 2048;
          *(void *)uint64_t v41 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s", buf, 0x1Cu);
        }

        id v25 = self->_persistTimer;
        dispatch_time_t v26 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000* [(RecommendationPreferences *)self->_preferences ior_persist_delay_seconds]);
        dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        int v27 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v38 = 1024;
          int v39 = 2562;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
        }

        id v28 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v38 = 1024;
          int v39 = 2564;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _persistTimer", buf, 0x12u);
        }

        dispatch_resume((dispatch_object_t)self->_persistTimer);
        self->_BOOL persistTimerRunning = 1;
        unsigned __int8 v29 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v30 = self->_persistTimerRunning;
          *(_DWORD *)buf = 136446722;
          BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v38 = 1024;
          int v39 = 2568;
          __int16 v40 = 1024;
          *(_DWORD *)uint64_t v41 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _persistTimerRunning %d", buf, 0x18u);
        }

        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
        __int16 v38 = 1024;
        int v39 = 2545;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _persistTimer", buf, 0x12u);
      }

      uint64_t v17 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      uint64_t v18 = self->_persistTimer;
      self->_persistTimer = v17;

      uint64_t v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
        __int16 v38 = 1024;
        int v39 = 2547;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _persistTimer Done", buf, 0x12u);
      }

      if (!self->_persistTimer)
      {
        id v4 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to create _persistTimer", buf, 2u);
        }
        goto LABEL_40;
      }
    }
    uint64_t v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v38 = 1024;
      int v39 = 2551;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    uint64_t v21 = self->_persistTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000242FC;
    handler[3] = &unk_1000D0D98;
    handler[4] = self;
    dispatch_source_set_event_handler(v21, handler);
    uint64_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v38 = 1024;
      int v39 = 2557;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_25;
  }
LABEL_34:
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v31 = self->_persistTimerRunning;
    unint64_t v32 = [(RecommendationPreferences *)self->_preferences ior_persist_delay_seconds];
    id v33 = self->_persistTimer;
    if (v33) {
      BOOL v34 = dispatch_source_testcancel(v33) == 0;
    }
    else {
      BOOL v34 = 0;
    }
    *(_DWORD *)buf = 136447234;
    BOOL v37 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
    __int16 v38 = 1024;
    int v39 = 2572;
    __int16 v40 = 1024;
    *(_DWORD *)uint64_t v41 = v31;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = v32;
    __int16 v42 = 1024;
    BOOL v43 = v34;
    id v6 = "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d";
    int v7 = v4;
    uint32_t v8 = 40;
    goto LABEL_39;
  }
LABEL_40:
}

- (void)_calculateEstimatedUptime
{
  int v3 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];

  if (v3)
  {
    id v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL v5 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];
      id v6 = +[NSDate now];
      int v7 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];
      [v7 timeIntervalSinceNow];
      double v9 = v8;

      *(_DWORD *)id v25 = 136447234;
      double v10 = -v9;
      *(void *)&v25[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
      if (v9 >= 0.0) {
        double v10 = v9;
      }
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = 2580;
      __int16 v26 = 2112;
      int v27 = v5;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v6;
      __int16 v30 = 2048;
      double v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kWAUnpersistedDateKey] %@ now %@ interval %f", v25, 0x30u);
    }
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Estimated Uptime (s)"];
    cachedUsage = self->_cachedUsage;
    BOOL v12 = [(NSMutableDictionary *)cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    double v15 = -v14;
    if (v14 >= 0.0) {
      double v15 = v14;
    }
    uint64_t v16 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v15, *(_OWORD *)v25);
    uint64_t v17 = cachedUsage;
LABEL_17:
    [(NSMutableDictionary *)v17 setObject:v16 forKey:@"Estimated Uptime (s)"];
    goto LABEL_18;
  }
  pidLaunchDate = self->_pidLaunchDate;
  uint64_t v19 = WALogCategoryDefaultHandle();
  uint64_t v16 = v19;
  if (pidLaunchDate)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = self->_pidLaunchDate;
      uint64_t v21 = +[NSDate now];
      [(NSDate *)self->_pidLaunchDate timeIntervalSinceNow];
      *(_DWORD *)id v25 = 136447234;
      *(void *)&v25[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
      *(_WORD *)&v25[12] = 1024;
      if (v22 < 0.0) {
        double v22 = -v22;
      }
      *(_DWORD *)&v25[14] = 2585;
      __int16 v26 = 2112;
      int v27 = v20;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v21;
      __int16 v30 = 2048;
      double v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_pidLaunchDate %@ now %@ interval %f", v25, 0x30u);
    }
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Estimated Uptime (s)"];
    id v23 = self->_cachedUsage;
    [(NSDate *)self->_pidLaunchDate timeIntervalSinceNow];
    if (v24 < 0.0) {
      double v24 = -v24;
    }
    uint64_t v16 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v24, *(void *)v25, *(void *)&v25[8]);
    uint64_t v17 = v23;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v25 = 136446466;
    *(void *)&v25[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
    *(_WORD *)&v25[12] = 1024;
    *(_DWORD *)&v25[14] = 2590;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d: calculating kWACumulativeUptimeKey unavailable", v25, 0x12u);
  }
LABEL_18:
}

- (void)_handleUnpersistForUsageData
{
  CFMutableDictionaryRef v2 = self;
  CFStringRef v3 = @"Work Bin: Last PID Work";
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Work Bin: Last PID Work"];
  id v79 = objc_alloc_init((Class)NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cachedUsage, "setObject:forKeyedSubscript:");
  id v4 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)v2->_cachedUsage setObject:v5 forKeyedSubscript:@"Work Bin: Previous PIDs Work"];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v6 = [(NSMutableDictionary *)v2->_cachedUsage copy];
  id v7 = [v6 countByEnumeratingWithState:&v96 objects:v116 count:16];
  BOOL v84 = v2;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v97;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v97 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(__CFString **)(*((void *)&v96 + 1) + 8 * i);
        if (([(__CFString *)v11 isEqualToString:@"Work Bin: Previous PIDs Work"] & 1) != 0|| [(__CFString *)v11 isEqualToString:v3])
        {
          BOOL v12 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446978;
            __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            __int16 v102 = 1024;
            int v103 = 2616;
            __int16 v104 = 2112;
            CFStringRef v105 = v3;
            __int16 v106 = 2112;
            int v107 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying key to %@: %@", buf, 0x26u);
          }
        }
        else
        {
          id v13 = v6;
          [(NSMutableDictionary *)v2->_cachedUsage objectForKey:v11];
          v15 = double v14 = v2;
          [(NSMutableDictionary *)v14->_cachedUsage objectForKeyedSubscript:v3];
          v17 = CFStringRef v16 = v3;
          [v17 setObject:v15 forKeyedSubscript:v11];

          [(NSMutableDictionary *)v14->_cachedUsage removeObjectForKey:v11];
          BOOL v12 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = [(NSMutableDictionary *)v14->_cachedUsage objectForKeyedSubscript:v16];
            uint64_t v19 = [v18 objectForKeyedSubscript:v11];
            *(_DWORD *)buf = 136446978;
            __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            __int16 v102 = 1024;
            int v103 = 2623;
            __int16 v104 = 2112;
            CFStringRef v105 = v11;
            __int16 v106 = 2112;
            int v107 = v19;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kLastPIDBin] now contains key %@ with value %@", buf, 0x26u);
          }
          CFStringRef v3 = v16;
          id v6 = v13;
        }

        CFMutableDictionaryRef v2 = v84;
      }
      id v8 = [v6 countByEnumeratingWithState:&v96 objects:v116 count:16];
    }
    while (v8);
  }

  if (v2->_persistFileExistedAtPIDLoad)
  {
    uint64_t v20 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
    uint64_t v21 = [v20 objectForKeyedSubscript:@"Terminations - Graceful"];

    if (!v21)
    {
      double v22 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
      +[WAUtil incrementValueForKey:@"Terminations - Unknown" inMutableDict:v22 onQueue:v2->_queue];
    }
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v23 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
  id v24 = [v23 copy];

  id v25 = [v24 countByEnumeratingWithState:&v92 objects:v115 count:16];
  __int16 v26 = &AnalyticsSendEventLazy_ptr;
  if (v25)
  {
    id v27 = v25;
    uint64_t v82 = *(void *)v93;
    id v80 = v24;
    do
    {
      uint64_t v28 = 0;
      id v81 = v27;
      do
      {
        if (*(void *)v93 != v82) {
          objc_enumerationMutation(v24);
        }
        uint64_t v83 = v28;
        unsigned __int8 v29 = *(__CFString **)(*((void *)&v92 + 1) + 8 * v28);
        if ([(__CFString *)v29 isEqualToString:@"Persist file creation Date"])
        {
          __int16 v30 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
          double v31 = [v30 objectForKeyedSubscript:v29];
          unint64_t v32 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
          [v32 setObject:v31 forKeyedSubscript:v29];
        }
        id v33 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
        BOOL v34 = [v33 objectForKeyedSubscript:v29];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v87 = v29;
        if (isKindOfClass)
        {
          id v36 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
          __int16 v102 = 1024;
          int v103 = 2640;
          __int16 v104 = 2112;
          CFStringRef v105 = v29;
          BOOL v37 = v36;
          __int16 v38 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: NSDate";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, v38, buf, 0x1Cu);
          goto LABEL_35;
        }
        if (([(__CFString *)v29 isEqualToString:@"Last Persisted PID"] & 1) != 0
          || [(__CFString *)v29 isEqualToString:@"Last Terminated PID"])
        {
          id v36 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
          __int16 v102 = 1024;
          int v103 = 2644;
          __int16 v104 = 2112;
          CFStringRef v105 = v29;
          BOOL v37 = v36;
          __int16 v38 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: kWAPersistedPidKey or kWATerminationPidKey";
          goto LABEL_34;
        }
        int v39 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
        __int16 v40 = [v39 objectForKeyedSubscript:v29];
        objc_opt_class();
        char v41 = objc_opt_isKindOfClass();

        if (v41)
        {
          __int16 v42 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            BOOL v43 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
            __int16 v44 = [v43 objectForKeyedSubscript:v29];
            BOOL v45 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
            uint64_t v46 = [v45 objectForKeyedSubscript:v29];
            *(_DWORD *)buf = 136447234;
            __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            __int16 v102 = 1024;
            int v103 = 2649;
            __int16 v104 = 2112;
            CFStringRef v105 = v29;
            __int16 v106 = 2112;
            int v107 = v44;
            __int16 v108 = 2112;
            CFStringRef v109 = v46;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Summing key %@ of kLastPIDBin %@ to kPreviousPIDsBin %@", buf, 0x30u);

            id v27 = v81;
          }

          id v36 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
          CFErrorRef v47 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
          +[WAUtil sumNSNumberForKey:v29 dstDict:v36 otherDict:v47];
        }
        else
        {
          id v48 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
          unsigned __int8 v49 = [v48 objectForKeyedSubscript:v29];
          objc_opt_class();
          char v50 = objc_opt_isKindOfClass();

          if (v50)
          {
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            uint64_t v51 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
            id v52 = [v51 objectForKeyedSubscript:v29];
            id v36 = [v52 copy];

            id v86 = [v36 countByEnumeratingWithState:&v88 objects:v114 count:16];
            if (v86)
            {
              uint64_t v53 = *(void *)v89;
              unsigned int v54 = v87;
              id obj = v36;
              do
              {
                for (j = 0; j != v86; j = (char *)j + 1)
                {
                  if (*(void *)v89 != v53) {
                    objc_enumerationMutation(obj);
                  }
                  CFStringRef v56 = *(const __CFString **)(*((void *)&v88 + 1) + 8 * (void)j);
                  id v57 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
                  id v58 = [v57 objectForKeyedSubscript:v54];
                  id v59 = [v58 objectForKeyedSubscript:v56];
                  objc_opt_class();
                  char v60 = objc_opt_isKindOfClass();

                  if (v60)
                  {
                    id v61 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                    {
                      id v62 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
                      uint64_t v63 = [v62 objectForKeyedSubscript:v54];
                      uint64_t v64 = [v63 objectForKeyedSubscript:v56];
                      __int16 v65 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
                      int v66 = [v65 objectForKeyedSubscript:v87];
                      __int16 v67 = [v66 objectForKeyedSubscript:v56];
                      *(_DWORD *)buf = 136447746;
                      __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
                      __int16 v102 = 1024;
                      int v103 = 2656;
                      __int16 v104 = 2112;
                      CFStringRef v105 = v56;
                      __int16 v106 = 2112;
                      int v107 = v87;
                      __int16 v108 = 2112;
                      CFStringRef v109 = v64;
                      __int16 v110 = 2112;
                      unint64_t v111 = v87;
                      __int16 v112 = 2112;
                      int64_t v113 = v67;
                      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Summing innerKey %@ of kLastPIDBin.%@ %@ to kPreviousPIDsBin.%@ %@", buf, 0x44u);

                      CFMutableDictionaryRef v2 = v84;
                      unsigned int v54 = v87;
                    }
                    id v68 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
                    __int16 v69 = [v68 objectForKeyedSubscript:v54];
                    id v70 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
                    id v71 = [v70 objectForKeyedSubscript:v87];
                    +[WAUtil sumNSNumberForKey:v56 dstDict:v69 otherDict:v71];

                    unsigned int v54 = v87;
                  }
                }
                id v36 = obj;
                id v86 = [obj countByEnumeratingWithState:&v88 objects:v114 count:16];
              }
              while (v86);
              id v24 = v80;
              __int16 v26 = &AnalyticsSendEventLazy_ptr;
              id v27 = v81;
            }
          }
          else
          {
            id v36 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              id v72 = [(NSMutableDictionary *)v2->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
              unsigned int v73 = [v72 objectForKeyedSubscript:v29];
              id v74 = (__CFString *)objc_opt_class();
              *(_DWORD *)buf = 136446978;
              __int16 v101 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
              __int16 v102 = 1024;
              int v103 = 2661;
              __int16 v104 = 2112;
              CFStringRef v105 = v29;
              __int16 v106 = 2112;
              int v107 = v74;
              id v75 = v74;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: unknown class %@", buf, 0x26u);
            }
          }
        }
LABEL_35:

        uint64_t v28 = v83 + 1;
      }
      while ((id)(v83 + 1) != v27);
      id v76 = [v24 countByEnumeratingWithState:&v92 objects:v115 count:16];
      id v27 = v76;
    }
    while (v76);
  }

  +[WAUtil incrementValueForKey:@"Unpersisted Count" inMutableDict:v2->_cachedUsage onQueue:v2->_queue];
  cachedUsage = v2->_cachedUsage;
  unsigned int v78 = [v26[269] date];
  [(NSMutableDictionary *)cachedUsage setObject:v78 forKey:@"PID Unpersisted Date"];

  +[WAUtil logNestedDictionary:v2->_cachedUsage indent:0 prefix:@"Unpersist ior _cachedUsage"];
}

- (id)getCachedUsage
{
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = sub_1000254E4;
  BOOL v12 = sub_1000254F4;
  id v13 = 0;
  CFStringRef v3 = [(WAIOReporterMessagePopulator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000254FC;
  block[3] = &unk_1000D0D48;
  objc_copyWeak(&v7, &location);
  void block[4] = &v8;
  dispatch_sync(v3, block);

  id v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);

  return v4;
}

- (id)_getCachedUsage
{
  if (!self->_hasAttemptedUnpersisting)
  {
    CFStringRef v3 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      cachedUsage = self->_cachedUsage;
      int v7 = 136446722;
      uint64_t v8 = "-[WAIOReporterMessagePopulator _getCachedUsage]";
      __int16 v9 = 1024;
      int v10 = 2691;
      __int16 v11 = 2112;
      BOOL v12 = cachedUsage;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_hasAttemptedUnpersisting not run _cachedUsage is %@", (uint8_t *)&v7, 0x1Cu);
    }

    [(WAIOReporterMessagePopulator *)self _unpersistIORObjects];
  }
  [(WAIOReporterMessagePopulator *)self _calculateEstimatedUptime];
  id v5 = self->_cachedUsage;

  return v5;
}

- (id)_createStructuredIOReportDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = sub_1000254E4;
  BOOL v12 = sub_1000254F4;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  +[WAUtil incrementValueForKey:@"Build Structured Dict Calls" inMutableDict:self->_cachedUsage onQueue:self->_queue];
  IOReportIterate();
  id v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (WAIOReporterPopulatorMessageDelegate)messageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageDelegate);

  return (WAIOReporterPopulatorMessageDelegate *)WeakRetained;
}

- (void)setMessageDelegate:(id)a3
{
}

- (WAIOReporterPersistenceDelegate)persistenceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistenceDelegate);

  return (WAIOReporterPersistenceDelegate *)WeakRetained;
}

- (void)setPersistenceDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)rescanTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRescanTimer:(id)a3
{
}

- (BOOL)rescanTimerRunning
{
  return self->_rescanTimerRunning;
}

- (void)setRescanTimerRunning:(BOOL)a3
{
  self->_BOOL rescanTimerRunning = a3;
}

- (OS_dispatch_source)persistTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPersistTimer:(id)a3
{
}

- (BOOL)persistTimerRunning
{
  return self->_persistTimerRunning;
}

- (void)setPersistTimerRunning:(BOOL)a3
{
  self->_BOOL persistTimerRunning = a3;
}

- (NSMutableDictionary)cachedIOPopAvailableChannels
{
  return self->_cachedIOPopAvailableChannels;
}

- (void)setCachedIOPopAvailableChannels:(id)a3
{
}

- (NSMutableDictionary)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(id)a3
{
}

- (NSMutableDictionary)cachedChannelsCountPerIORPopulatable
{
  return self->_cachedChannelsCountPerIORPopulatable;
}

- (void)setCachedChannelsCountPerIORPopulatable:(id)a3
{
}

- (BOOL)ioReportersCacheNeedsUpdating
{
  return self->_ioReportersCacheNeedsUpdating;
}

- (void)setIoReportersCacheNeedsUpdating:(BOOL)a3
{
  self->_BOOL ioReportersCacheNeedsUpdating = a3;
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
}

- (NSMutableArray)cachedPredicatesNotYetFound
{
  return self->_cachedPredicatesNotYetFound;
}

- (void)setCachedPredicatesNotYetFound:(id)a3
{
}

- (NSMutableDictionary)cachedIOReportSubbedChannels
{
  return self->_cachedIOReportSubbedChannels;
}

- (void)setCachedIOReportSubbedChannels:(id)a3
{
}

- (NSMutableDictionary)cachedIOReportSample
{
  return self->_cachedIOReportSample;
}

- (void)setCachedIOReportSample:(id)a3
{
}

- (WAApple80211)apple80211Wrapper
{
  return self->_apple80211Wrapper;
}

- (void)setApple80211Wrapper:(id)a3
{
}

- (BOOL)hasAttemptedUnpersisting
{
  return self->_hasAttemptedUnpersisting;
}

- (void)setHasAttemptedUnpersisting:(BOOL)a3
{
  self->_hasAttemptedUnpersisting = a3;
}

- (BOOL)persistFileExistedAtPIDLoad
{
  return self->_persistFileExistedAtPIDLoad;
}

- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3
{
  self->_persistFileExistedAtPIDLoad = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)pidLaunchDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPidLaunchDate:(id)a3
{
}

- (BOOL)failNextCreateOrUpdateSample
{
  return self->_failNextCreateOrUpdateSample;
}

- (void)setFailNextCreateOrUpdateSample:(BOOL)a3
{
  self->_failNextCreateOrUpdateSample = a3;
}

- (unsigned)srv
{
  return self->_srv;
}

- (void)setSrv:(unsigned int)a3
{
  self->_unsigned int srv = a3;
}

- (NSString)drvName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDrvName:(id)a3
{
}

- (NSString)drvPath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDrvPath:(id)a3
{
}

- (NSNumber)providerNum
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProviderNum:(id)a3
{
}

- (int64_t)wlanType
{
  return self->_wlanType;
}

- (void)setWlanType:(int64_t)a3
{
  self->_int64_t wlanType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerNum, 0);
  objc_storeStrong((id *)&self->_drvPath, 0);
  objc_storeStrong((id *)&self->_drvName, 0);
  objc_storeStrong((id *)&self->_pidLaunchDate, 0);
  objc_storeStrong((id *)&self->_apple80211Wrapper, 0);
  objc_storeStrong((id *)&self->_cachedIOReportSample, 0);
  objc_storeStrong((id *)&self->_cachedIOReportSubbedChannels, 0);
  objc_storeStrong((id *)&self->_cachedPredicatesNotYetFound, 0);
  objc_storeStrong((id *)&self->_infraInterfaceName, 0);
  objc_storeStrong((id *)&self->_cachedChannelsCountPerIORPopulatable, 0);
  objc_storeStrong((id *)&self->_cachedUsage, 0);
  objc_storeStrong((id *)&self->_cachedIOPopAvailableChannels, 0);
  objc_storeStrong((id *)&self->_persistTimer, 0);
  objc_storeStrong((id *)&self->_rescanTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_persistenceDelegate);
  objc_destroyWeak((id *)&self->_messageDelegate);

  objc_storeStrong((id *)&self->_preferences, 0);
}

@end