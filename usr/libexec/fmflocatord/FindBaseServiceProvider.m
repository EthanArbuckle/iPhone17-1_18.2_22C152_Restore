@interface FindBaseServiceProvider
- (BOOL)allowServerRequests;
- (BOOL)completedStartupRegister;
- (BOOL)enqueueRequest:(id)a3;
- (BOOL)isProviderEnabledForLocations;
- (BOOL)locServicesCapable;
- (BOOL)shouldRegisterForNetworkMonitor;
- (BOOL)shouldRegisterForWristMonitor;
- (FindBaseServiceProvider)init;
- (Locator)standardLocator;
- (NSMutableArray)requests;
- (NSMutableDictionary)fullDeviceInfo;
- (NSMutableDictionary)locationDeviceInfo;
- (NSMutableDictionary)standardDeviceContext;
- (NSRecursiveLock)requestModifierLock;
- (NSString)apsToken;
- (NSString)lastForcedRegisterTimePrefKey;
- (NSString)serviceIdentifierInURL;
- (OS_dispatch_queue)registerQueue;
- (id)_constructLocationDeviceInfo;
- (id)_constructNonCriticalFullDeviceInfo;
- (id)_constructNonEssentialDeviceInfo;
- (id)_constructNonVolatileFullDeviceInfo;
- (id)_constructPairedDevicesInfo;
- (id)_constructStandardDeviceContext;
- (id)_constructVolatileFullDeviceInfo;
- (id)_nonEssentialRegisterDigestPrefKey;
- (id)_registerDigestPrefKey;
- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4;
- (id)connectionStringForNRDevice:(id)a3;
- (id)copyHandlerForCommand:(id)a3 params:(id)a4;
- (id)formattedURLForTemplate:(id)a3;
- (id)newLocationManager;
- (id)pairingIdForNRDevice:(id)a3;
- (id)serviceName;
- (id)substituteStandardURLPlaceholders:(id)a3;
- (unsigned)authInvalidError;
- (unsigned)essentialServerInfoMissingError;
- (void)_beginXPCTransaction;
- (void)_endXPCTransaction;
- (void)_registerDeviceWithCause:(id)a3 includeKeys:(unint64_t)a4;
- (void)ackLocateCommand:(id)a3 withStatusCode:(int64_t)a4 andStatusMessage:(id)a5 withCompletion:(id)a6;
- (void)ackRegisterCommand:(id)a3 withCompletion:(id)a4;
- (void)appInstallStateChanged:(id)a3;
- (void)dealloc;
- (void)deinitializeProvider;
- (void)deleteRegisterDigest;
- (void)deregisterCommonNotifications;
- (void)deviceNameChanged:(id)a3;
- (void)didCancelRequest:(id)a3;
- (void)didReceiveResponseFor:(id)a3;
- (void)fmfLocationServicesStateChanged:(id)a3;
- (void)handleQueueCheckResponseWithStatus:(int64_t)a3 andBody:(id)a4;
- (void)localeChanged:(id)a3;
- (void)locationServicesStateChanged:(id)a3;
- (void)registerCommonNotifications;
- (void)registerDeviceWithCause:(id)a3;
- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4;
- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4 includeKeys:(unint64_t)a5;
- (void)sendCurrentLocation:(id)a3 isFinished:(BOOL)a4 forCmd:(id)a5 withReason:(int64_t)a6 andAccuracyChange:(double)a7;
- (void)sendQueueCheckRequest:(id)a3;
- (void)sendQueueCheckRequest:(id)a3 withReasons:(id)a4;
- (void)setAllowServerRequests:(BOOL)a3;
- (void)setApsToken:(id)a3;
- (void)setCompletedStartupRegister:(BOOL)a3;
- (void)setLastForcedRegisterTimePrefKey:(id)a3;
- (void)setRegisterQueue:(id)a3;
- (void)setRequestModifierLock:(id)a3;
- (void)setRequests:(id)a3;
- (void)setStandardLocator:(id)a3;
- (void)showAlertFromServerResponse:(id)a3;
- (void)tryToFetchAuthToken;
- (void)unregisterDevice;
@end

@implementation FindBaseServiceProvider

- (void)dealloc
{
  v3 = [(FindBaseServiceProvider *)self standardLocator];
  [v3 stopLocator];

  v4.receiver = self;
  v4.super_class = (Class)FindBaseServiceProvider;
  [(FindBaseServiceProvider *)&v4 dealloc];
}

- (FindBaseServiceProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)FindBaseServiceProvider;
  v2 = [(FindBaseServiceProvider *)&v7 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(FindBaseServiceProvider *)v2 setRequests:v3];

    objc_super v4 = objc_opt_new();
    [(FindBaseServiceProvider *)v2 setRequestModifierLock:v4];

    dispatch_queue_t v5 = dispatch_queue_create("fmf.deviceRegisterQ", 0);
    [(FindBaseServiceProvider *)v2 setRegisterQueue:v5];
  }
  return v2;
}

- (id)serviceName
{
  return @"find-base";
}

- (void)registerCommonNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"deviceNameChanged:" name:@"DeviceNameChangedNotification" object:0];
  [v3 addObserver:self selector:"locationServicesStateChanged:" name:@"LocationServicesStateChangedNotification" object:0];
  [v3 addObserver:self selector:"fmfLocationServicesStateChanged:" name:@"FMFLocationServicesStateChangedNotification" object:0];
  [v3 addObserver:self selector:"localeChanged:" name:@"LocaleChangedNotification" object:0];
  [v3 addObserver:self selector:"appInstallStateChanged:" name:@"FMFAppInstallStateChangedNotification" object:0];
}

- (void)deregisterCommonNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"DeviceNameChangedNotification" object:0];
  [v3 removeObserver:self name:@"LocationServicesStateChangedNotification" object:0];
  [v3 removeObserver:self name:@"FMFLocationServicesStateChangedNotification" object:0];
  [v3 removeObserver:self name:@"LocaleChangedNotification" object:0];
  [v3 removeObserver:self name:@"FMFAppInstallStateChangedNotification" object:0];
}

- (void)deleteRegisterDigest
{
  id v5 = [(FindBaseServiceProvider *)self _registerDigestPrefKey];
  +[FMPreferencesUtil removeKey:v5 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  id v3 = [(FindBaseServiceProvider *)self _nonEssentialRegisterDigestPrefKey];
  +[FMPreferencesUtil removeKey:v3 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  objc_super v4 = [(FindBaseServiceProvider *)self lastForcedRegisterTimePrefKey];
  +[FMPreferencesUtil removeKey:v4 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)deinitializeProvider
{
  v2 = self;
  v30.receiver = self;
  v30.super_class = (Class)FindBaseServiceProvider;
  [(ServiceProvider *)&v30 deinitializeProvider];
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = [(FindBaseServiceProvider *)v2 fm_logID];
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ Deinitializing...", buf, 0xCu);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(FindBaseServiceProvider *)v2 requests];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 138412546;
    long long v25 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
        v12 = sub_10001B6D4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          [(FindBaseServiceProvider *)v2 fm_logID];
          v14 = v13 = v2;
          v15 = [v11 fm_logID];
          *(_DWORD *)buf = v25;
          v32 = v14;
          __int16 v33 = 2112;
          v34 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ cancelling request %@", buf, 0x16u);

          v2 = v13;
        }

        [v11 setDelegate:0];
        [v11 cancel];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v8);
  }

  v16 = +[NSMutableArray array];
  [(FindBaseServiceProvider *)v2 setRequests:v16];

  uint64_t v17 = [(FindBaseServiceProvider *)v2 standardLocator];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(FindBaseServiceProvider *)v2 standardLocator];
    unsigned int v20 = [v19 locatorRunning];

    if (v20)
    {
      v21 = sub_10001B6D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Stopping standard locate...", buf, 2u);
      }

      v22 = [(FindBaseServiceProvider *)v2 standardLocator];
      [v22 stopLocator];

      v23 = [(FindBaseServiceProvider *)v2 standardLocator];
      [v23 setReceivedLocationBlock:0];

      v24 = [(FindBaseServiceProvider *)v2 standardLocator];
      [v24 setStoppedLocatorBlock:0];
    }
  }
  -[FindBaseServiceProvider setStandardLocator:](v2, "setStandardLocator:", 0, v25);
}

- (NSString)serviceIdentifierInURL
{
  return (NSString *)&stru_10005BAE8;
}

- (id)formattedURLForTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [(FindBaseServiceProvider *)self substituteStandardURLPlaceholders:v4];
  id v6 = [objc_alloc((Class)NSURL) initWithString:v5];
  if (!v6)
  {
    long long v7 = sub_10001B6D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not create an NSURL from the url string %@ for the template %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v6;
}

- (id)substituteStandardURLPlaceholders:(id)a3
{
  id v4 = a3;
  id v5 = +[PreferencesMgr sharedInstance];
  id v6 = [v5 hostportOverride];

  if ([v6 length])
  {
    uint64_t v7 = [v4 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v6];
  }
  else
  {
    id v8 = [(ServiceProvider *)self account];
    int v9 = [v8 serverHost];

    if (!v9) {
      goto LABEL_6;
    }
    v10 = [(ServiceProvider *)self account];
    __int16 v11 = [v10 serverHost];
    uint64_t v7 = [v4 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v11];

    id v4 = v10;
  }

  id v4 = (id)v7;
LABEL_6:
  id v12 = +[PreferencesMgr sharedInstance];
  v13 = [v12 protocolSchemeOverride];

  if ([v13 length])
  {
    uint64_t v14 = [v4 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v13];
  }
  else
  {
    v15 = [(ServiceProvider *)self account];
    v16 = [v15 serverProtocolScheme];

    if (!v16) {
      goto LABEL_11;
    }
    uint64_t v17 = [(ServiceProvider *)self account];
    v18 = [v17 serverProtocolScheme];
    uint64_t v14 = [v4 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v18];

    id v4 = v17;
  }

  id v4 = (id)v14;
LABEL_11:
  v19 = [(FindBaseServiceProvider *)self serviceIdentifierInURL];

  if (v19)
  {
    unsigned int v20 = [(FindBaseServiceProvider *)self serviceIdentifierInURL];
    uint64_t v21 = [v4 stringByReplacingOccurrencesOfString:@"${service}" withString:v20];

    id v4 = (id)v21;
  }
  v22 = [(ServiceProvider *)self account];
  v23 = [v22 authId];

  if (v23)
  {
    v24 = [(ServiceProvider *)self account];
    long long v25 = [v24 authId];
    uint64_t v26 = [v4 stringByReplacingOccurrencesOfString:@"${dsid}" withString:v25];

    id v4 = (id)v26;
  }
  long long v27 = +[SystemConfig sharedInstance];
  long long v28 = [v27 deviceUDID];

  if (v28)
  {
    uint64_t v29 = [v4 stringByReplacingOccurrencesOfString:@"${udid}" withString:v28];

    id v4 = (id)v29;
  }

  return v4;
}

- (NSMutableDictionary)standardDeviceContext
{
  return (NSMutableDictionary *)[(FindBaseServiceProvider *)self _constructStandardDeviceContext];
}

- (NSMutableDictionary)fullDeviceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [(FindBaseServiceProvider *)self _constructNonVolatileFullDeviceInfo];
  [v3 addEntriesFromDictionary:v5];

  id v6 = [(FindBaseServiceProvider *)self _constructVolatileFullDeviceInfo];
  [v3 addEntriesFromDictionary:v6];

  uint64_t v7 = [(FindBaseServiceProvider *)self _constructNonCriticalFullDeviceInfo];
  [v3 addEntriesFromDictionary:v7];

  id v8 = +[PreferencesMgr sharedInstance];
  int v9 = [v8 deviceInfoOverrides];

  if (v9) {
    [v3 addEntriesFromDictionary:v9];
  }

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)locationDeviceInfo
{
  id v3 = [(FindBaseServiceProvider *)self _constructLocationDeviceInfo];
  id v4 = [(FindBaseServiceProvider *)self _constructNonVolatileFullDeviceInfo];
  [v3 addEntriesFromDictionary:v4];

  id v5 = [(FindBaseServiceProvider *)self _constructVolatileFullDeviceInfo];
  [v3 addEntriesFromDictionary:v5];

  id v6 = [(FindBaseServiceProvider *)self _constructNonCriticalFullDeviceInfo];
  [v3 addEntriesFromDictionary:v6];

  uint64_t v7 = +[PreferencesMgr sharedInstance];
  id v8 = [v7 locationDeviceInfoOverrides];

  if (v8) {
    [v3 addEntriesFromDictionary:v8];
  }

  return (NSMutableDictionary *)v3;
}

- (id)_constructStandardDeviceContext
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[NSDate date];
  id v4 = [v3 stringValueForServer];

  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"deviceTS"];
  }

  return v2;
}

- (id)_constructVolatileFullDeviceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[FMFConfig sharedInstance];
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isLocationServicesEnabled]);
  [v3 setObject:v5 forKeyedSubscript:@"locationServicesEnabled"];

  id v6 = +[FMFConfig sharedInstance];
  uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isLocationServicesEnabledForShareMyLocation]);
  [v3 setObject:v7 forKeyedSubscript:@"smlLS"];

  id v8 = +[SystemConfig sharedInstance];
  int v9 = [v8 deviceName];
  [v3 fm_safelyMapKey:@"deviceName" toObject:v9];

  v10 = +[SystemConfig sharedInstance];
  __int16 v11 = [v10 timezone];
  [v3 fm_safelyMapKey:@"timezone" toObject:v11];

  id v12 = +[SystemConfig sharedInstance];
  v13 = [v12 locale];
  [v3 fm_safelyMapKey:@"locale" toObject:v13];

  uint64_t v14 = +[SystemConfig sharedInstance];
  v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 processIdentifier]);
  v16 = [v15 stringValue];
  [v3 fm_safelyMapKey:@"processId" toObject:v16];

  uint64_t v17 = +[SystemConfig sharedInstance];
  v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 unlockState]);
  [v3 setObject:v18 forKeyedSubscript:@"unlockState"];

  v19 = +[SystemConfig sharedInstance];
  id v20 = [v19 isFMFAppRemoved];

  uint64_t v21 = +[NSNumber numberWithBool:v20];
  [v3 fm_safelyMapKey:@"isFMFAppRemoved" toObject:v21];

  v22 = objc_alloc_init(FMDGainsboroughPairedDeviceSimulation);
  if ([(FMDGainsboroughPairedDeviceSimulation *)v22 isPairedDeviceSimulationActive]) {
    [v3 fm_safelyMapKey:@"deviceName" toObject:@"Gainsborough's iPhone"];
  }
  v23 = [(FindBaseServiceProvider *)self _constructPairedDevicesInfo];
  [v3 setObject:v23 forKeyedSubscript:@"otherDevices"];

  return v3;
}

- (id)_constructNonVolatileFullDeviceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[SystemConfig sharedInstance];
  id v5 = [v4 deviceUDID];
  [v3 fm_safelyMapKey:@"udid" toObject:v5];

  id v6 = +[SystemConfig sharedInstance];
  LODWORD(v4) = [v6 canRegisterWithIDSID];

  if (v4)
  {
    uint64_t v7 = +[SystemConfig sharedInstance];
    id v8 = [v7 idsDeviceID];
    [v3 fm_safelyMapKey:@"idsDeviceId" toObject:v8];
  }
  int v9 = +[SystemConfig sharedInstance];
  v10 = [v9 deviceClassString];
  [v3 fm_safelyMapKey:@"deviceClass" toObject:v10];

  __int16 v11 = +[SystemConfig sharedInstance];
  id v12 = [v11 productType];
  [v3 fm_safelyMapKey:@"productType" toObject:v12];

  v13 = +[SystemConfig sharedInstance];
  uint64_t v14 = [v13 buildVersion];
  [v3 fm_safelyMapKey:@"buildVersion" toObject:v14];

  v15 = +[SystemConfig sharedInstance];
  v16 = [v15 productVersion];
  [v3 fm_safelyMapKey:@"productVersion" toObject:v16];

  uint64_t v17 = +[SystemConfig sharedInstance];
  v18 = [v17 platform];
  [v3 fm_safelyMapKey:@"platform" toObject:v18];

  v19 = +[FMSystemInfo sharedInstance];
  id v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 isInternalBuild]);
  [v3 fm_safelyMapKey:@"isInternal" toObject:v20];

  uint64_t v21 = +[SystemConfig sharedInstance];
  v22 = [v21 serialNumber];
  [v3 fm_safelyMapKey:@"serialNumber" toObject:v22];

  v23 = [(ServiceProvider *)self account];
  v24 = [v23 versionHistory];
  long long v25 = [v24 componentsJoinedByString:@","];
  [v3 fm_safelyMapKey:@"versionHistory" toObject:v25];

  uint64_t v26 = +[SystemConfig sharedInstance];
  long long v27 = [v26 deviceColor];
  [v3 fm_safelyMapKey:@"deviceColor" toObject:v27];

  long long v28 = +[SystemConfig sharedInstance];
  uint64_t v29 = [v28 deviceEnclosureColor];
  [v3 fm_safelyMapKey:@"enclosureColor" toObject:v29];

  objc_super v30 = +[SystemConfig sharedInstance];
  v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 forceTouchAvailable]);
  [v3 fm_safelyMapKey:@"supportsForceTouch" toObject:v31];

  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"supportsNotifyV2"];

  return v3;
}

- (id)_constructNonEssentialDeviceInfo
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);

  return v2;
}

- (id)_constructNonCriticalFullDeviceInfo
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[SystemConfig sharedInstance];
  id v4 = v3;
  if (v3) {
    [v3 batteryStats];
  }

  return v2;
}

- (id)_constructLocationDeviceInfo
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[SystemConfig sharedInstance];
  id v4 = [v3 deviceUDID];
  [v2 fm_safelyMapKey:@"udid" toObject:v4];

  id v5 = +[SystemConfig sharedInstance];
  id v6 = v5;
  if (v5) {
    [v5 batteryStats];
  }

  return v2;
}

- (id)_registerDigestPrefKey
{
  id v3 = [(ServiceProvider *)self account];
  uint64_t v4 = objc_opt_class();
  id v5 = [(ServiceProvider *)self account];
  id v6 = [v5 uniqueId];
  uint64_t v7 = +[NSString stringWithFormat:@"RegisterDigest-%@-%@", v4, v6];

  return v7;
}

- (id)_nonEssentialRegisterDigestPrefKey
{
  id v3 = [(ServiceProvider *)self account];
  uint64_t v4 = objc_opt_class();
  id v5 = [(ServiceProvider *)self account];
  id v6 = [v5 uniqueId];
  uint64_t v7 = +[NSString stringWithFormat:@"RegisterDigestNonEssential-%@-%@", v4, v6];

  return v7;
}

- (NSString)lastForcedRegisterTimePrefKey
{
  id v3 = [(ServiceProvider *)self account];
  uint64_t v4 = objc_opt_class();
  id v5 = [(ServiceProvider *)self account];
  id v6 = [v5 uniqueId];
  uint64_t v7 = +[NSString stringWithFormat:@"LastForcedRegisterTime-%@-%@", v4, v6];

  return (NSString *)v7;
}

- (id)_constructPairedDevicesInfo
{
  id v35 = +[NSMutableArray array];
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getPairedDevices];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v38;
    uint64_t v7 = NRDevicePropertyIsPaired;
    uint64_t v8 = NRDevicePropertyIsAltAccount;
    uint64_t v32 = NRDevicePropertyLastActiveDate;
    uint64_t v31 = NRDevicePropertyUDID;
    uint64_t v30 = NRDevicePropertyProductType;
    uint64_t v29 = NRDevicePropertyName;
    uint64_t v33 = *(void *)v38;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        __int16 v11 = [v10 valueForProperty:v7];
        unsigned int v12 = [v11 BOOLValue];

        v13 = [v10 valueForProperty:v8];
        unsigned __int8 v14 = [v13 BOOLValue];

        if (v12 && (v14 & 1) == 0)
        {
          v15 = +[NSMutableDictionary dictionary];
          v16 = [v10 valueForProperty:v32];
          uint64_t v17 = v16;
          if (v16)
          {
            +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 fm_epoch]);
            v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = &off_10005EEB8;
          }
          [v15 fm_safelyMapKey:@"lastActiveTime" toObject:v18];
          [v15 fm_safelyMapKey:@"deviceClass" toObject:@"Watch"];
          [v15 fm_safelyMapKey:@"platform" toObject:@"watchos"];
          v19 = [(FindBaseServiceProvider *)self connectionStringForNRDevice:v10];
          [v15 fm_safelyMapKey:@"connectionStatus" toObject:v19];

          id v20 = [(FindBaseServiceProvider *)self pairingIdForNRDevice:v10];
          uint64_t v21 = [v20 UUIDString];
          [v15 fm_safelyMapKey:@"pairingId" toObject:v21];

          v22 = [v10 valueForProperty:v31];
          [v15 fm_safelyMapKey:@"udid" toObject:v22];

          v23 = [v10 valueForProperty:v30];
          [v15 fm_safelyMapKey:@"productType" toObject:v23];

          v24 = [v10 valueForProperty:v29];
          [v15 fm_safelyMapKey:@"deviceName" toObject:v24];

          [v35 addObject:v15];
          uint64_t v6 = v33;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v5);
  }

  long long v25 = objc_alloc_init(FMDGainsboroughPairedDeviceSimulation);
  if ([(FMDGainsboroughPairedDeviceSimulation *)v25 isPairedDeviceSimulationActive])
  {
    uint64_t v26 = [(FMDGainsboroughPairedDeviceSimulation *)v25 pairedDeviceInfo];
    [v35 addObjectsFromArray:v26];
  }

  return v35;
}

- (id)pairingIdForNRDevice:(id)a3
{
  return [a3 valueForProperty:NRDevicePropertyPairingID];
}

- (id)connectionStringForNRDevice:(id)a3
{
  return @"unknown";
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4 includeKeys:(unint64_t)a5
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10000E878;
  v16[4] = sub_10000E888;
  id v8 = a3;
  id v17 = v8;
  int v9 = [(FindBaseServiceProvider *)self registerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E890;
  block[3] = &unk_100059730;
  block[4] = self;
  id v12 = v8;
  BOOL v15 = a4;
  v13 = v16;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(v9, block);

  _Block_object_dispose(v16, 8);
}

- (void)registerDeviceWithCause:(id)a3
{
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4
{
}

- (void)_registerDeviceWithCause:(id)a3 includeKeys:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(FindBaseServiceProvider *)self essentialServerInfoMissingError];
  if (v6 == 1196379972)
  {
    uint64_t v7 = [[FMRequestRegister alloc] initWithProvider:self andCause:v5];
    id v8 = [(FMRequestRegister *)v7 registrationInformationDigestIncludingKeys];
    int v9 = [(FindBaseServiceProvider *)self _registerDigestPrefKey];
    if (qword_10006D418 && [(id)qword_10006D418 isEqualToData:v8])
    {
      id v10 = sub_10001B6D4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = [(FindBaseServiceProvider *)self fm_logID];
        *(_DWORD *)buf = 138412546;
        id v45 = v11;
        __int16 v46 = 2112;
        id v47 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Not sending register with cause %@ because there is already another register with the same registration information in-progress", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v21 = +[FMPreferencesUtil dataForKey:v9 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
      id v10 = v21;
      if (v21) {
        unsigned int v22 = [v21 isEqualToData:v8];
      }
      else {
        unsigned int v22 = 0;
      }
      long long v25 = sub_10001B6D4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Reg-info matching complete. Essentitial info matches - [%i]", buf, 8u);
      }

      if (v22)
      {
        if ([(FindBaseServiceProvider *)self completedStartupRegister]
          || (+[FMFLocatorDaemon sharedInstance],
              uint64_t v26 = objc_claimAutoreleasedReturnValue(),
              unsigned int v27 = [v26 isFirstRunAfterBoot],
              v26,
              !v27))
        {
          if ([(FindBaseServiceProvider *)self completedStartupRegister]
            || (+[StartupRegisterManager sharedInstance],
                uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                unsigned int v30 = [v29 shouldForceRegisterOnStartup],
                v29,
                !v30))
          {
            v36 = sub_10001B6D4();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v5;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Reg-info unchanged. Ignoring register %@", buf, 0xCu);
            }

            goto LABEL_41;
          }
          long long v28 = sub_10001B6D4();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v31 = +[StartupRegisterManager sharedInstance];
            *(_DWORD *)buf = 138412546;
            id v45 = v5;
            __int16 v46 = 2112;
            id v47 = v31;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Reg-info unchanged but forcing register %@ due to %@", buf, 0x16u);
          }
        }
        else
        {
          long long v28 = sub_10001B6D4();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v5;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Reg-info unchanged but forcing register %@", buf, 0xCu);
          }
        }
      }
      uint64_t v32 = sub_10001B6D4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [(FindBaseServiceProvider *)self fm_logID];
        *(_DWORD *)buf = 138412546;
        id v45 = v33;
        __int16 v46 = 2112;
        id v47 = v5;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@ Sending register with cause %@ because registration information has changed", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10000F1A8;
      v42[3] = &unk_100059538;
      id v34 = v8;
      id v43 = v34;
      [(FMRequest *)v7 setWillSendHandler:v42];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000F1B8;
      v37[3] = &unk_100059758;
      objc_copyWeak(&v41, (id *)buf);
      id v38 = v34;
      id v39 = v9;
      long long v40 = self;
      [(FMRequest *)v7 setCompletionHandler:v37];
      if (![(FindBaseServiceProvider *)self enqueueRequest:v7])
      {
        id v35 = (void *)qword_10006D418;
        qword_10006D418 = 0;
      }
      objc_destroyWeak(&v41);

      objc_destroyWeak((id *)buf);
    }
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v12 = v6;
  v13 = sub_10001B6D4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v14 = [(FindBaseServiceProvider *)self fm_logID];
    BOOL v15 = +[CommonUtil stringForFourCC:v12];
    *(_DWORD *)buf = 138412802;
    id v45 = v14;
    __int16 v46 = 2112;
    id v47 = v5;
    __int16 v48 = 2112;
    v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Not sending register with cause %@ to server since some essential server info is missing - '%@'", buf, 0x20u);
  }
  BOOL v16 = v12 == 1480675411;
  id v17 = +[FMSystemInfo sharedInstance];
  unsigned int v18 = [v17 isInternalBuild];

  if (v16)
  {
    if (v18)
    {
      v19 = sub_10001B6D4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [(FindBaseServiceProvider *)self serviceName];
        *(_DWORD *)buf = 138412290;
        id v45 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ is not functional as an APS token is not available.", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v18)
    {
      v23 = sub_10001B6D4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(FindBaseServiceProvider *)self serviceName];
        *(_DWORD *)buf = 138412290;
        id v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ is not functional as authentication credentials are not available.", buf, 0xCu);
      }
    }
    [(FindBaseServiceProvider *)self tryToFetchAuthToken];
  }
LABEL_42:
}

- (void)unregisterDevice
{
  id v3 = [[FMRequestUnregister alloc] initWithProvider:self];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F558;
  v4[3] = &unk_100059538;
  v4[4] = self;
  [(FMRequest *)v3 setCompletionHandler:v4];
  [(FindBaseServiceProvider *)self enqueueRequest:v3];
}

- (void)sendQueueCheckRequest:(id)a3
{
}

- (void)sendQueueCheckRequest:(id)a3 withReasons:(id)a4
{
  id v5 = a3;
  [(FindBaseServiceProvider *)self _beginXPCTransaction];
  uint64_t v6 = [[FMRequestQueueCheck alloc] initWithProvider:self andServerContext:v5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F988;
  v7[3] = &unk_100059538;
  v7[4] = self;
  [(FMRequest *)v6 setCompletionHandler:v7];
  [(FindBaseServiceProvider *)self enqueueRequest:v6];

  [(FindBaseServiceProvider *)self _endXPCTransaction];
}

- (void)sendCurrentLocation:(id)a3 isFinished:(BOOL)a4 forCmd:(id)a5 withReason:(int64_t)a6 andAccuracyChange:(double)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = sub_10001B6D4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100037200(self, v14);
  }

  BOOL v15 = sub_10001B76C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = [(FindBaseServiceProvider *)self serviceName];
    [v12 horizontalAccuracy];
    uint64_t v18 = v17;
    [v12 coordinate];
    uint64_t v20 = v19;
    [v12 coordinate];
    *(_DWORD *)buf = 138413059;
    unsigned int v27 = v16;
    __int16 v28 = 2049;
    uint64_t v29 = v18;
    __int16 v30 = 2049;
    uint64_t v31 = v20;
    __int16 v32 = 2049;
    uint64_t v33 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@: Publishing Location with Accuracy: %{private}f Longitude: %{private}f Latitude: %{private}f", buf, 0x2Au);
  }
  unsigned int v22 = [[FMRequestCurrentLocation alloc] initWithProvider:self location:v12 finalLocation:v10 locateCommand:v13 reason:a6 accuracyChange:a7];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000FE54;
  v25[3] = &unk_100059538;
  v25[4] = self;
  [(FMRequest *)v22 setCompletionHandler:v25];
  ct_green_tea_logger_create_static();
  v23 = getCTGreenTeaOsLogHandle();
  v24 = v23;
  if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
  }

  [(FindBaseServiceProvider *)self enqueueRequest:v22];
}

- (void)ackRegisterCommand:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"ackURL"];
  if (v8)
  {
    int v9 = +[NSURL URLWithString:v8];
    BOOL v10 = [[FMRequestAckRegister alloc] initWithProvider:self registerCommand:v6 ackURL:v9];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    unint64_t v14 = sub_1000101BC;
    BOOL v15 = &unk_100059560;
    BOOL v16 = self;
    id v17 = v7;
    [(FMRequest *)v10 setCompletionHandler:&v12];
    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v10, v12, v13, v14, v15, v16);
  }
  else
  {
    int v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = [(FindBaseServiceProvider *)self serviceName];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: Not acking the register command because there is no ack URL", buf, 0xCu);
    }
  }
}

- (void)ackLocateCommand:(id)a3 withStatusCode:(int64_t)a4 andStatusMessage:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 objectForKeyedSubscript:@"ackURL"];
  if (v13)
  {
    unint64_t v14 = +[NSURL URLWithString:v13];
    BOOL v15 = [[FMRequestAckLocate alloc] initWithProvider:self locateCommand:v10 ackURL:v14 cmdStatusCode:a4 cmdStatusMessage:v11];
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_10001057C;
    uint64_t v20 = &unk_100059560;
    uint64_t v21 = self;
    id v22 = v12;
    [(FMRequest *)v15 setCompletionHandler:&v17];
    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v15, v17, v18, v19, v20, v21);
  }
  else
  {
    unint64_t v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = [(FindBaseServiceProvider *)self serviceName];
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: Not acking the locate command because there is no ack URL", buf, 0xCu);
    }
  }
}

- (BOOL)locServicesCapable
{
  return 1;
}

- (void)handleQueueCheckResponseWithStatus:(int64_t)a3 andBody:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    id v8 = [v7 objectForKeyedSubscript:@"cmd"];
    int v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(FindBaseServiceProvider *)self serviceName];
      int v22 = 138412546;
      v23 = v10;
      __int16 v24 = 2112;
      long long v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Command Received: %@", (uint8_t *)&v22, 0x16u);
    }
    id v11 = [(FindBaseServiceProvider *)self copyHandlerForCommand:v8 params:v7];
    id v12 = v11;
    if (v11)
    {
      [v11 executeCommand];
      uint64_t v13 = sub_10001B6D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = [(FindBaseServiceProvider *)self serviceName];
        int v22 = 138412546;
        v23 = v14;
        __int16 v24 = 2112;
        long long v25 = v8;
        BOOL v15 = "%@: Successfully finished command %@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      uint64_t v13 = sub_10001B6D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = [(FindBaseServiceProvider *)self serviceName];
        int v22 = 138412546;
        v23 = v14;
        __int16 v24 = 2112;
        long long v25 = v8;
        BOOL v15 = "%@: No handler found for command %@";
        goto LABEL_11;
      }
    }

    BOOL v16 = +[StartupRegisterManager sharedInstance];
    [v16 eventDidOccur:8];

    if (a3 == 210 || a3 == 204)
    {
      id v17 = sub_10001B6D4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [(FindBaseServiceProvider *)self serviceName];
        int v22 = 138412290;
        v23 = v20;
        uint64_t v21 = "%@: No more pending messages on the server...";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      if (a3 != 200)
      {
LABEL_23:

        goto LABEL_24;
      }
      id v17 = sub_10001B6D4();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v18)
        {
          uint64_t v19 = [(FindBaseServiceProvider *)self serviceName];
          int v22 = 138412290;
          v23 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@: More messages pending - checking now...", (uint8_t *)&v22, 0xCu);
        }
        [(FindBaseServiceProvider *)self sendQueueCheckRequest:0];
        goto LABEL_23;
      }
      if (v18)
      {
        uint64_t v20 = [(FindBaseServiceProvider *)self serviceName];
        int v22 = 138412290;
        v23 = v20;
        uint64_t v21 = "%@: Not checking for new messages - previous command was not successful or duplicate";
        goto LABEL_21;
      }
    }

    goto LABEL_23;
  }
  id v8 = +[StartupRegisterManager sharedInstance];
  [v8 eventDidOccur:8];
LABEL_24:
}

- (BOOL)isProviderEnabledForLocations
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(FindBaseServiceProvider *)self fm_logID];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ isProviderEnabledForLocations should be handled in a subclass", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (unsigned)essentialServerInfoMissingError
{
  unsigned int v3 = [(FindBaseServiceProvider *)self authInvalidError];
  if (v3 == 1196379972)
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = [(FindBaseServiceProvider *)v4 apsToken];

    if (v5) {
      unsigned int v3 = 1196379972;
    }
    else {
      unsigned int v3 = 1480675411;
    }
    objc_sync_exit(v4);
  }
  return v3;
}

- (unsigned)authInvalidError
{
  unsigned int v3 = [(ServiceProvider *)self account];

  if (!v3) {
    return 1480672067;
  }
  id v4 = [(ServiceProvider *)self account];
  id v5 = [v4 username];
  id v6 = [v5 length];

  if (!v6) {
    return 1481986898;
  }
  id v7 = [(ServiceProvider *)self account];
  id v8 = [v7 authToken];
  id v9 = [v8 length];

  if (!v9) {
    return 1481920331;
  }
  id v10 = [(ServiceProvider *)self account];
  id v11 = [v10 authId];
  id v12 = [v11 length];

  if (v12) {
    return 1196379972;
  }
  else {
    return 1482639684;
  }
}

- (void)tryToFetchAuthToken
{
  id v3 = [(ServiceProvider *)self account];
  id v2 = [v3 authToken];
  [v2 length];
}

- (id)newLocationManager
{
  return 0;
}

- (id)copyHandlerForCommand:(id)a3 params:(id)a4
{
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Base copyHandlerForCommand should not be called", v6, 2u);
  }

  return 0;
}

- (void)showAlertFromServerResponse:(id)a3
{
  id v3 = a3;
  id v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100037298((uint64_t)v3, v4);
  }

  id v5 = [v3 objectForKeyedSubscript:@"title"];
  uint64_t v29 = [v3 objectForKeyedSubscript:@"text"];
  __int16 v28 = [v3 objectForKeyedSubscript:@"okButtonTitle"];
  id v6 = [v3 objectForKeyedSubscript:@"okButtonURL"];
  id v7 = [v3 objectForKeyedSubscript:@"okButtonAction"];
  id v8 = [v3 objectForKeyedSubscript:@"cancelButtonTitle"];
  id v9 = [v3 objectForKeyedSubscript:@"cancelButtonURL"];
  id v10 = [v3 objectForKeyedSubscript:@"cancelButtonAction"];
  id v11 = [v3 objectForKeyedSubscript:@"delay"];
  [v11 doubleValue];
  double v13 = v12;

  if (v5)
  {
    id v14 = objc_alloc_init((Class)FMAlert);
    [v14 setCategory:qword_10006CDE8];
    [v14 setMsgTitle:v5];
    [v14 setMsgText:v29];
    [v14 setShowMsgInLockScreen:1];
    [v14 setDismissMsgOnUnlock:0];
    [v14 setDismissMsgOnLock:0];
    [v14 setDefaultButtonTitle:v28];
    if (v6) {
      BOOL v15 = v7 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15) {
      id v7 = @"open-url";
    }
    if (v9) {
      BOOL v16 = v10 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16) {
      id v10 = @"open-url";
    }
    if (v7)
    {
      id v17 = [(FindBaseServiceProvider *)self alertActionInfoForAction:v7 andURL:v6];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100011314;
      v35[3] = &unk_100059780;
      v36 = v7;
      id v37 = v17;
      id v18 = v17;
      [v14 setDefaultButtonAction:v35];
    }
    uint64_t v26 = v8;
    [v14 setAlternateButtonTitle:v8];
    if (v10)
    {
      uint64_t v19 = [(FindBaseServiceProvider *)self alertActionInfoForAction:v10 andURL:v9];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000113CC;
      v32[3] = &unk_100059780;
      uint64_t v33 = v10;
      id v34 = v19;
      id v20 = v19;
      [v14 setAlternateButtonAction:v32];
    }
    uint64_t v21 = [v14 defaultButtonTitle];
    if (v21)
    {
    }
    else
    {
      int v22 = [v14 alternateButtonTitle];

      if (!v22)
      {
        long long v25 = sub_10001B6D4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Received a server alert without an button. Not showing it", buf, 2u);
        }
        goto LABEL_26;
      }
    }
    if (v13 <= 0.0)
    {
      long long v25 = +[FMAlertManager sharedInstance];
      [v25 activateAlert:v14];
    }
    else
    {
      v23 = sub_10001B6D4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v39 = v13;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Showing alert after %.2f seconds...", buf, 0xCu);
      }

      dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100011484;
      block[3] = &unk_100059350;
      uint64_t v31 = v14;
      dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);
      long long v25 = v31;
    }
LABEL_26:

    id v8 = v26;
  }
}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if ([v5 isEqualToString:@"appleid"])
  {

    id v6 = @"prefs:root=APPLE_ACCOUNT";
    id v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
    v19[0] = @"url";
    v19[1] = @"sensitive";
    v20[0] = v7;
    v20[1] = &__kCFBooleanTrue;
    id v8 = v20;
    id v9 = v19;
LABEL_10:
    id v11 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:2];

    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"settings"])
  {

    id v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE";
    id v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
    v17[0] = @"url";
    v17[1] = @"sensitive";
    v18[0] = v7;
    v18[1] = &__kCFBooleanTrue;
    id v8 = v18;
    id v9 = v17;
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"sml-settings"])
  {

    id v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING";
    id v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING"];
    v15[0] = @"url";
    v15[1] = @"sensitive";
    v16[0] = v7;
    v16[1] = &__kCFBooleanTrue;
    id v8 = v16;
    id v9 = v15;
    goto LABEL_10;
  }
  unsigned int v10 = [v5 isEqualToString:@"open-url"];
  id v11 = 0;
  if (v6 && v10)
  {
    id v7 = +[NSURL URLWithString:v6];
    v13[0] = @"url";
    v13[1] = @"sensitive";
    v14[0] = v7;
    v14[1] = &__kCFBooleanFalse;
    id v8 = v14;
    id v9 = v13;
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (void)deviceNameChanged:(id)a3
{
}

- (void)locationServicesStateChanged:(id)a3
{
}

- (void)fmfLocationServicesStateChanged:(id)a3
{
}

- (void)localeChanged:(id)a3
{
}

- (void)appInstallStateChanged:(id)a3
{
  id v4 = sub_10001B89C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver", v5, 2u);
  }

  [(FindBaseServiceProvider *)self registerDeviceWithCause:@"AppStateChanged"];
}

- (BOOL)shouldRegisterForWristMonitor
{
  return 0;
}

- (BOOL)shouldRegisterForNetworkMonitor
{
  return 0;
}

- (BOOL)enqueueRequest:(id)a3
{
  id v31 = a3;
  BOOL v29 = [(FindBaseServiceProvider *)self allowServerRequests];
  if (v29)
  {
    __int16 v30 = self;
    id v4 = [(FindBaseServiceProvider *)self requestModifierLock];
    [v4 lock];

    id v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FindBaseServiceProvider *)v30 fm_logID];
      id v7 = [v31 fm_logID];
      *(_DWORD *)buf = 138412546;
      id v41 = v6;
      __int16 v42 = 2112;
      id v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Enqueueing request %@", buf, 0x16u);
    }
    [v31 setDelegate:v30];
    id v8 = +[NSMutableArray array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = [(FindBaseServiceProvider *)v30 requests];
    id v10 = [v9 countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if ([v31 canReplace:v13]) {
            [v8 addObject:v13];
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v36 objects:v47 count:16];
      }
      while (v10);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v33;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          uint64_t v19 = sub_10001B6D4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v20 = [(FindBaseServiceProvider *)v30 fm_logID];
            uint64_t v21 = [v18 fm_logID];
            int v22 = [v31 fm_logID];
            *(_DWORD *)buf = 138412802;
            id v41 = v20;
            __int16 v42 = 2112;
            id v43 = v21;
            __int16 v44 = 2112;
            id v45 = v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ Discarding %@ because a newer request %@ can replace this one", buf, 0x20u);
          }
          [v18 cancel];
        }
        id v15 = [v14 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v15);
    }

    v23 = [(FindBaseServiceProvider *)v30 requests];
    [v23 addObject:v31];

    [v31 send];
    dispatch_time_t v24 = [(FindBaseServiceProvider *)v30 requestModifierLock];
    [v24 unlock];
  }
  else
  {
    long long v25 = sub_10001B6D4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [(FindBaseServiceProvider *)self fm_logID];
      unsigned int v27 = [v31 fm_logID];
      *(_DWORD *)buf = 138412546;
      id v41 = v26;
      __int16 v42 = 2112;
      id v43 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@: Not sending request %@ to server since the provider is not allowing server requests", buf, 0x16u);
    }
  }

  return v29;
}

- (void)didReceiveResponseFor:(id)a3
{
  id v4 = a3;
  if ([v4 responseErrorType] == (id)257) {
    [(FindBaseServiceProvider *)self didReceiveAuthFailureForRequest:v4];
  }
  id v5 = [v4 alertFromServerResponse];

  if (v5)
  {
    id v6 = [v4 alertFromServerResponse];
    [(FindBaseServiceProvider *)self showAlertFromServerResponse:v6];
  }
  if (([v4 willRetry] & 1) == 0)
  {
    id v7 = sub_10001B6D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(FindBaseServiceProvider *)self fm_logID];
      id v9 = [v4 fm_logID];
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ Removing request %@ from the queue as it was completed or it exhausted its retries", (uint8_t *)&v13, 0x16u);
    }
    id v10 = [(FindBaseServiceProvider *)self requestModifierLock];
    [v10 lock];

    [v4 deinitializeRequest];
    uint64_t v11 = [(FindBaseServiceProvider *)self requests];
    [v11 removeObject:v4];

    double v12 = [(FindBaseServiceProvider *)self requestModifierLock];
    [v12 unlock];
  }
}

- (void)didCancelRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(FindBaseServiceProvider *)self fm_logID];
    id v7 = [v4 fm_logID];
    int v11 = 138412546;
    double v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Removing request %@ from the queue as it was cancelled", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [(FindBaseServiceProvider *)self requestModifierLock];
  [v8 lock];

  [v4 deinitializeRequest];
  id v9 = [(FindBaseServiceProvider *)self requests];
  [v9 removeObject:v4];

  id v10 = [(FindBaseServiceProvider *)self requestModifierLock];
  [v10 unlock];
}

- (void)_beginXPCTransaction
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  id v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 beginTransaction:v6];
}

- (void)_endXPCTransaction
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  id v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 endTransaction:v6];
}

- (NSString)apsToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApsToken:(id)a3
{
}

- (Locator)standardLocator
{
  return self->_standardLocator;
}

- (void)setStandardLocator:(id)a3
{
}

- (BOOL)allowServerRequests
{
  return self->_allowServerRequests;
}

- (void)setAllowServerRequests:(BOOL)a3
{
  self->_allowServerRequests = a3;
}

- (void)setLastForcedRegisterTimePrefKey:(id)a3
{
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
}

- (BOOL)completedStartupRegister
{
  return self->_completedStartupRegister;
}

- (void)setCompletedStartupRegister:(BOOL)a3
{
  self->_completedStartupRegister = a3;
}

- (OS_dispatch_queue)registerQueue
{
  return self->_registerQueue;
}

- (void)setRegisterQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerQueue, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_lastForcedRegisterTimePrefKey, 0);
  objc_storeStrong((id *)&self->_standardLocator, 0);

  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end