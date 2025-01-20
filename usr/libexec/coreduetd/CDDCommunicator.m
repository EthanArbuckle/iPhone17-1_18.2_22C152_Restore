@interface CDDCommunicator
- (BOOL)appsDifferBetween:(id)a3 and:(id)a4;
- (BOOL)hasRemote;
- (BOOL)initialized;
- (BOOL)isConversionRequiredForMessage:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5;
- (BOOL)isPluggedIn;
- (BOOL)itemsDifferIn:(id)a3 and:(id)a4;
- (BOOL)registerScheduledExchange:(id *)a3;
- (CDD)cdd;
- (CDDCommControl)control;
- (CDDCommunicator)initWithCDDinstance:(id)a3;
- (NSArray)exclusiveApps;
- (NSArray)lastFocalNonApps;
- (NSArray)nonTrafficBundleID;
- (NSDictionary)registeredDevices;
- (NSString)lastFocalApp;
- (double)currentBatteryLevel;
- (id)convertMessage:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5;
- (id)currentFocalApplication;
- (id)currentFocalNonApps;
- (id)generateFocalNonAppFocalMutableSet;
- (id)generateNonAppFocalString;
- (id)getAckMessage;
- (id)getCurrrentSupportedVersions;
- (id)getDictionaryFromConfigurationPlist:(id)a3;
- (id)getScheduledForecasts;
- (id)getScheduledMessage:(id)a3 withForecasts:(BOOL)a4;
- (id)getStringArrayFromConfigurationPlist:(id)a3;
- (id)getVersionsDictFromMaxVersion:(unint64_t)a3 minVersion:(unint64_t)a4;
- (id)handleMessageVersioning:(id)a3;
- (id)makeAckMessage;
- (id)makeForecastMessage:(id *)a3;
- (id)makeRemoteDeviceSyncMessage;
- (id)makeScheduledMessage:(id)a3 withForecasts:(BOOL)a4;
- (id)makeSystemComboMessage;
- (id)obtainForegroundApplication;
- (id)satisfyForecastDataRequest:(id)a3;
- (int)thermalPressureLevel;
- (unint64_t)currentCellQuality;
- (unint64_t)currentWiFiWiredQuality;
- (unint64_t)getOutgoingVersionForIncomingVersions:(id)a3;
- (unint64_t)localMaxSupportedVersionNumber;
- (unint64_t)localMinSupportedVersionNumber;
- (unint64_t)remoteVersionNumber;
- (void)checkDevices:(id)a3;
- (void)dealloc;
- (void)deregisterForSystemConditionChanges;
- (void)exchangeSystemComboMessage:(BOOL)a3;
- (void)handleAppStateChanged;
- (void)handleNetworkChanged;
- (void)informCommunicationError;
- (void)receiveForecast:(id)a3 paramDict:(id)a4 device:(id)a5;
- (void)receiveInBedTimes:(id)a3;
- (void)receiveRequestedForecast:(id)a3 paramDict:(id)a4 transactionId:(unint64_t)a5 device:(id)a6;
- (void)receiveSystemData:(id)a3 device:(id)a4;
- (void)registerForSystemConditionChanges;
- (void)requestRemoteDeviceSync;
- (void)setInitialized:(BOOL)a3;
- (void)setLastFocalApp:(id)a3;
- (void)setLastFocalNonApps:(id)a3;
- (void)setRemoteVersionNumber:(unint64_t)a3;
- (void)setupCommControl;
- (void)syncStateWithActiveRemote;
- (void)triggerExchangeForFocalApp:(id)a3 inState:(int)a4 withNonApps:(id)a5 byClient:(unint64_t)a6;
- (void)triggerFocalAppExchange:(id)a3 inState:(int)a4;
- (void)triggerFocalAppExchange:(id)a3 inState:(int)a4 shouldSendMessage:(BOOL)a5;
- (void)triggerNonAppFocalExchange:(id)a3 byClient:(unint64_t)a4;
- (void)triggerNonAppFocalExchange:(id)a3 byClient:(unint64_t)a4 shouldSendMessage:(BOOL)a5;
- (void)triggerSystemDataExchange:(BOOL)a3 wakeRemote:(BOOL)a4;
@end

@implementation CDDCommunicator

- (CDDCommunicator)initWithCDDinstance:(id)a3
{
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CDDCommunicator;
  v6 = [(CDDCommunicator *)&v46 init];
  v7 = v6;
  if (!v6)
  {
    v33 = 0;
    goto LABEL_18;
  }
  p_cdd = (id *)&v6->cdd;
  objc_storeStrong((id *)&v6->cdd, a3);
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.coreduetdCommDaemonQueue", v10);
  daemonQueue = v7->daemonQueue;
  v7->daemonQueue = (OS_dispatch_queue *)v11;

  os_log_t v13 = os_log_create("com.apple.coreduet.admissionCheck", "communicator");
  log = v7->_log;
  v7->_log = (OS_os_log *)v13;

  uint64_t v15 = +[NSMutableArray array];
  scheduledForecastRequests = v7->scheduledForecastRequests;
  v7->scheduledForecastRequests = (NSMutableArray *)v15;

  v7->localMinSupportedVersionNumber = 1;
  *(int64x2_t *)&v7->remoteVersionNumber = vdupq_n_s64(2uLL);
  localFocalApp = v7->localFocalApp;
  v7->localFocalApp = 0;

  id v18 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreDuet"];
  [v18 synchronize];
  v19 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100022810(v19);
  }

  v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  localNonAppsInFocus = v7->localNonAppsInFocus;
  v7->localNonAppsInFocus = v20;

  lastSystemExchange = v7->lastSystemExchange;
  v7->lastSystemExchange = 0;

  v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  lastSentFocalNonFocalState = v7->lastSentFocalNonFocalState;
  v7->lastSentFocalNonFocalState = v23;

  v7->shouldTriggerDelayedMessage = 1;
  registeredDevices = v7->registeredDevices;
  v7->registeredDevices = 0;

  uint64_t v26 = +[NSMutableDictionary dictionary];
  systemData = v7->systemData;
  v7->systemData = (NSMutableDictionary *)v26;

  uint64_t v28 = [(CDDCommunicator *)v7 getStringArrayFromConfigurationPlist:@"CDDCommFocalAppWhitelist"];
  focalAppWhitelist = v7->focalAppWhitelist;
  v7->focalAppWhitelist = (NSArray *)v28;

  v30 = [(CDD *)v7->cdd config];
  if ((int)[v30 commMinClientGranularity] <= 899)
  {

    goto LABEL_9;
  }
  v31 = [*p_cdd config];
  int v32 = [v31 commSyncBoundarySeconds];

  if (v32 <= 3599)
  {
LABEL_9:
    v34 = [*p_cdd config];
    [v34 setCommMinClientGranularity:900];

    v35 = [*p_cdd config];
    [v35 setCommSyncBoundarySeconds:86400];

    v36 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "CDDCommunicator: sanitized configuration inputs.", buf, 2u);
    }
  }
  v37 = [[CDDCommControl alloc] initWithCommInstance:v7];
  control = v7->control;
  v7->control = v37;

  if (v7->control)
  {
    v39 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = v7->control;
      *(_DWORD *)buf = 134217984;
      v48 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "CDDCommunicator: control setup %p.", buf, 0xCu);
    }

    uint64_t v41 = [(CDDCommunicator *)v7 getStringArrayFromConfigurationPlist:@"CDDCommExclusiveApps"];
    exclusiveApps = v7->exclusiveApps;
    v7->exclusiveApps = (NSArray *)v41;

    uint64_t v43 = [(CDDCommunicator *)v7 getStringArrayFromConfigurationPlist:@"CDDCommNonTrafficBundleID"];
    nonTrafficBundleID = v7->nonTrafficBundleID;
    v7->nonTrafficBundleID = (NSArray *)v43;

    v33 = v7;
  }
  else
  {
    v33 = 0;
  }

LABEL_18:
  return v33;
}

- (void)setupCommControl
{
  [(CDDCommControl *)self->control setupIDSLink];
  daemonQueue = self->daemonQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011F94;
  v8[3] = &unk_100038A78;
  v8[4] = self;
  v4 = v8;
  id v5 = daemonQueue;
  v6 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182A0;
  block[3] = &unk_100038AA0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  dispatch_async(v5, block);
}

- (void)registerForSystemConditionChanges
{
  v3 = +[_CDClientContext userContext];
  context = self->_context;
  self->_context = v3;

  id v5 = +[_CDContextQueries keyPathForPluginStatus];
  v29 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v5];

  v6 = +[_CDContextQueries keyPathForBatteryLevel];
  uint64_t v28 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v6];

  id v7 = +[_CDContextQueries keyPathForThermalPressureLevel];
  v27 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v7];

  v8 = +[_CDContextQueries keyPathForForegroundApp];
  v36[0] = v8;
  v9 = +[_CDContextQueries keyPathForServicesAppearingForeground];
  v36[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v36 count:2];
  id v11 = +[_CDContextualPredicate predicateForChangeAtKeyPaths:v10];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100012438;
  v34[3] = &unk_100038D18;
  v34[4] = self;
  v12 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.cddcommunicator.pluginChanged" contextualPredicate:v29 clientIdentifier:@"com.apple.coreduetd.CDDCommunicator" callback:v34];
  pluggedInRegistration = self->_pluggedInRegistration;
  self->_pluggedInRegistration = v12;

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100012498;
  v33[3] = &unk_100038D18;
  v33[4] = self;
  v14 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.cddcommunicator.batteryChanged" contextualPredicate:v28 clientIdentifier:@"com.apple.coreduetd.CDDCommunicator" callback:v33];
  batteryRegistration = self->_batteryRegistration;
  self->_batteryRegistration = v14;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100012530;
  v32[3] = &unk_100038D18;
  v32[4] = self;
  v16 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.cddcommunicator.thermalChanged" contextualPredicate:v27 clientIdentifier:@"com.apple.coreduetd.CDDCommunicator" callback:v32];
  thermalRegistration = self->_thermalRegistration;
  self->_thermalRegistration = v16;

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100012590;
  v31[3] = &unk_100038D18;
  v31[4] = self;
  id v18 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.cddcommunicator.appChanged" contextualPredicate:v11 clientIdentifier:@"com.apple.coreduetd.CDDCommunicator" callback:v31];
  applicationRegistration = self->_applicationRegistration;
  self->_applicationRegistration = v18;

  v20 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v35[0] = v20;
  v21 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v35[1] = v21;
  v22 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v35[2] = v22;
  v23 = +[NSArray arrayWithObjects:v35 count:3];
  v24 = +[_CDContextualPredicate predicateForChangeAtKeyPaths:v23];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100012598;
  v30[3] = &unk_100038D18;
  v30[4] = self;
  v25 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.cddcommunicator.nwchanged" contextualPredicate:v24 clientIdentifier:@"com.apple.coreduetd.CDDCommunicator" callback:v30];
  networkRegistration = self->_networkRegistration;
  self->_networkRegistration = v25;

  [(_CDLocalContext *)self->_context registerCallback:self->_networkRegistration];
  [(_CDLocalContext *)self->_context registerCallback:self->_pluggedInRegistration];
  [(_CDLocalContext *)self->_context registerCallback:self->_batteryRegistration];
  [(_CDLocalContext *)self->_context registerCallback:self->_thermalRegistration];
  [(_CDLocalContext *)self->_context registerCallback:self->_applicationRegistration];
}

- (void)deregisterForSystemConditionChanges
{
  [(_CDLocalContext *)self->_context deregisterCallback:self->_pluggedInRegistration];
  [(_CDLocalContext *)self->_context deregisterCallback:self->_batteryRegistration];
  [(_CDLocalContext *)self->_context deregisterCallback:self->_thermalRegistration];
  [(_CDLocalContext *)self->_context deregisterCallback:self->_applicationRegistration];
  context = self->_context;
  networkRegistration = self->_networkRegistration;

  [(_CDLocalContext *)context deregisterCallback:networkRegistration];
}

- (id)getDictionaryFromConfigurationPlist:(id)a3
{
  id v3 = a3;
  v4 = +[CDDPaths CDDConfigurationBundlePath];
  id v5 = +[NSBundle bundleWithPath:v4];

  if (!v5)
  {
    v6 = +[CDDPaths CDDConfigurationBundlePathDefault];
    id v5 = +[NSBundle bundleWithPath:v6];

    id v7 = +[_CDLogging communicatorChannel];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (!v5)
    {
      if (v8)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no bundle found in path default", (uint8_t *)&v16, 2u);
      }
      id v5 = 0;
      goto LABEL_16;
    }
    if (v8)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "loaded bundle in default path", (uint8_t *)&v16, 2u);
    }
  }
  v9 = [v5 objectForInfoDictionaryKey:v3];
  id v7 = +[_CDLogging communicatorChannel];
  BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v10)
    {
      id v14 = [v3 UTF8String];
      int v16 = 136315138;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no array of strings for key %s found in configuration plist", (uint8_t *)&v16, 0xCu);
    }
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if (v10)
  {
    id v11 = [v3 UTF8String];
    int v16 = 136315138;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found dict for key %s in configuration plist:", (uint8_t *)&v16, 0xCu);
  }

  id v7 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v12 = [v9 description];
    id v13 = [v12 UTF8String];
    int v16 = 136315138;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found dict content in plist: %s", (uint8_t *)&v16, 0xCu);
  }
LABEL_17:

  return v9;
}

- (id)getStringArrayFromConfigurationPlist:(id)a3
{
  id v3 = a3;
  v4 = +[CDDPaths CDDConfigurationBundlePath];
  id v5 = +[NSBundle bundleWithPath:v4];

  if (!v5)
  {
    v6 = +[CDDPaths CDDConfigurationBundlePathDefault];
    id v5 = +[NSBundle bundleWithPath:v6];

    id v7 = +[_CDLogging communicatorChannel];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (!v5)
    {
      if (v8)
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no bundle found in path default", (uint8_t *)&v18, 2u);
      }
      id v5 = 0;
      goto LABEL_16;
    }
    if (v8)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "loaded bundle in default path", (uint8_t *)&v18, 2u);
    }
  }
  id v9 = objc_alloc((Class)NSArray);
  BOOL v10 = [v5 objectForInfoDictionaryKey:v3];
  id v11 = [v9 initWithArray:v10];

  id v7 = +[_CDLogging communicatorChannel];
  BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v12)
    {
      id v16 = [v3 UTF8String];
      int v18 = 136315138;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no array of strings for key %s found in configuration plist", (uint8_t *)&v18, 0xCu);
    }
LABEL_16:
    id v11 = 0;
    goto LABEL_17;
  }
  if (v12)
  {
    id v13 = [v3 UTF8String];
    int v18 = 136315138;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found array of strings for key %s in configuration plist:", (uint8_t *)&v18, 0xCu);
  }

  id v7 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v14 = [v11 description];
    id v15 = [v14 UTF8String];
    int v18 = 136315138;
    id v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "found whitelisted array in plist: %s", (uint8_t *)&v18, 0xCu);
  }
LABEL_17:

  return v11;
}

- (void)dealloc
{
  [(NSMutableArray *)self->scheduledForecastRequests enumerateObjectsUsingBlock:&stru_100038D58];
  v3.receiver = self;
  v3.super_class = (Class)CDDCommunicator;
  [(CDDCommunicator *)&v3 dealloc];
}

- (double)currentBatteryLevel
{
  context = self->_context;
  objc_super v3 = +[_CDContextQueries keyPathForBatteryLevel];
  v4 = [(_CDLocalContext *)context objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)isPluggedIn
{
  context = self->_context;
  objc_super v3 = +[_CDContextQueries keyPathForPluginStatus];
  v4 = [(_CDLocalContext *)context objectForKeyedSubscript:v3];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (int)thermalPressureLevel
{
  context = self->_context;
  objc_super v3 = +[_CDContextQueries keyPathForThermalPressureLevel];
  v4 = [(_CDLocalContext *)context objectForKeyedSubscript:v3];
  int v5 = [v4 intValue];

  return v5;
}

- (id)currentFocalApplication
{
  context = self->_context;
  objc_super v3 = +[_CDContextQueries keyPathForForegroundApp];
  v4 = [(_CDLocalContext *)context objectForKeyedSubscript:v3];

  return v4;
}

- (BOOL)itemsDifferIn:(id)a3 and:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            if (!objc_msgSend(v6, "containsObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
            {
              BOOL v13 = 0;
              goto LABEL_14;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      BOOL v13 = 1;
LABEL_14:
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)appsDifferBetween:(id)a3 and:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if ((!v5 || v6) && (v5 || !v6)) {
    unsigned int v8 = [v5 isEqualToString:v6] ^ 1;
  }
  else {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)currentFocalNonApps
{
  context = self->_context;
  objc_super v3 = +[_CDContextQueries keyPathForServicesAppearingForeground];
  v4 = [(_CDLocalContext *)context objectForKeyedSubscript:v3];

  return v4;
}

- (void)handleAppStateChanged
{
  objc_super v3 = [(CDDCommunicator *)self currentFocalApplication];
  v4 = [(CDDCommunicator *)self lastFocalApp];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    *(void *)long long v15 = v3;
    *(_WORD *)&v15[8] = 2112;
    long long v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Focal App: %@, Previous: %@", (uint8_t *)&v14, 0x16u);
  }
  id v6 = [(CDDCommunicator *)self currentFocalNonApps];
  id v7 = [(CDDCommunicator *)self lastFocalNonApps];
  unsigned int v8 = [(CDDCommunicator *)self appsDifferBetween:v3 and:v4];
  if (v7) {
    unsigned int v9 = [(CDDCommunicator *)self itemsDifferIn:v6 and:v7];
  }
  else {
    unsigned int v9 = 1;
  }
  id v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109376;
    *(_DWORD *)long long v15 = v8;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Apps Differ: %u, Non-Apps Differ: %u", (uint8_t *)&v14, 0xEu);
  }
  if ((v8 ^ 1 | v9))
  {
    if ((v8 | v9 ^ 1))
    {
      if (v3 && ([v3 isEqualToString:&stru_100039CF8] & 1) == 0)
      {
        uint64_t v11 = self;
        BOOL v12 = v3;
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v11 = self;
        BOOL v12 = v4;
        uint64_t v13 = 1;
      }
      [(CDDCommunicator *)v11 triggerExchangeForFocalApp:v12 inState:v13 withNonApps:v6 byClient:31];
    }
    else
    {
      [(CDDCommunicator *)self triggerNonAppFocalExchange:v6 byClient:31];
    }
  }
  else
  {
    [(CDDCommunicator *)self triggerFocalAppExchange:v4 inState:1];
    [(CDDCommunicator *)self triggerFocalAppExchange:v3 inState:0];
    [(CDDCommunicator *)self setLastFocalApp:v3];
  }
  [(CDDCommunicator *)self setLastFocalApp:v3];
  [(CDDCommunicator *)self setLastFocalNonApps:v6];
}

- (unint64_t)currentWiFiWiredQuality
{
  context = self->_context;
  v4 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  id v5 = [(_CDLocalContext *)context objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

  id v7 = self->_context;
  unsigned int v8 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  unsigned int v9 = [(_CDLocalContext *)v7 objectForKeyedSubscript:v8];
  id v10 = [v9 unsignedIntegerValue];

  if (v10 <= v6) {
    return (unint64_t)v6;
  }
  else {
    return (unint64_t)v10;
  }
}

- (unint64_t)currentCellQuality
{
  context = self->_context;
  objc_super v3 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v4 = [(_CDLocalContext *)context objectForKeyedSubscript:v3];
  id v5 = [v4 unsignedIntegerValue];

  return (unint64_t)v5;
}

- (void)handleNetworkChanged
{
  unint64_t v3 = [(CDDCommunicator *)self currentWiFiWiredQuality];
  BOOL v4 = v3 > 0x31 && self->_lastWiFiWiredQuality > 0x31;
  char v5 = (self->_lastWiFiWiredQuality > 0x31) ^ (v3 > 0x31);
  unint64_t v6 = [(CDDCommunicator *)self currentCellQuality];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = log;
    unsigned int v9 = +[NSNumber numberWithUnsignedInteger:v3];
    id v10 = +[NSNumber numberWithUnsignedInteger:v6];
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    long long v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network quality changed: %@ and %@", (uint8_t *)&v12, 0x16u);
  }
  char v11 = v4 | (v5 | (self->_lastCellQuality < 0x32) ^ (v6 < 0x32)) ^ 1;
  self->_lastWiFiWiredQuality = v3;
  self->_lastCellQuality = v6;
  if ((v11 & 1) == 0) {
    [(CDDCommunicator *)self triggerSystemDataExchange:1 wakeRemote:0];
  }
}

- (BOOL)registerScheduledExchange:(id *)a3
{
  char v5 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CDDCommunicator: registering exchange.", buf, 2u);
  }

  unint64_t var5 = a3->var2.var5;
  if (var5)
  {
    id v7 = [(CDD *)self->cdd config];
    signed int v8 = [v7 commMinClientGranularity];

    if (var5 < v8) {
      return 0;
    }
  }
  unsigned int v9 = malloc_type_calloc(1uLL, 0x88uLL, 0x92B5BEB3uLL);
  id v10 = v9;
  _OWORD *v9 = *(_OWORD *)&a3->var0;
  long long v11 = *(_OWORD *)&a3->var2.var6;
  long long v13 = *(_OWORD *)&a3->var2.var0;
  long long v12 = *(_OWORD *)&a3->var2.var2;
  v9[3] = *(_OWORD *)&a3->var2.var4;
  v9[4] = v11;
  v9[1] = v13;
  v9[2] = v12;
  long long v15 = *(_OWORD *)&a3->var2.var10;
  long long v14 = *(_OWORD *)&a3->var2.var12;
  long long v16 = *(_OWORD *)&a3->var2.var8;
  *((void *)v9 + 16) = *(void *)&a3->var2.var14;
  v9[6] = v15;
  v9[7] = v14;
  v9[5] = v16;
  if (a3->var1)
  {
    free(v9);
    return 0;
  }
  long long v18 = self->scheduledForecastRequests;
  daemonQueue = self->daemonQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100013684;
  v25[3] = &unk_100038D80;
  uint64_t v26 = v18;
  v27 = v10;
  v20 = v25;
  v21 = daemonQueue;
  v22 = v18;
  v23 = (void *)os_transaction_create();
  *(void *)buf = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  v30 = sub_1000182A0;
  v31 = &unk_100038AA0;
  id v32 = v23;
  id v33 = v20;
  id v24 = v23;
  dispatch_async(v21, buf);

  return 1;
}

- (id)obtainForegroundApplication
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000138EC;
  v21 = sub_1000138FC;
  id v22 = 0;
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  long long v13 = sub_100013904;
  long long v14 = &unk_100038DA8;
  v2 = dispatch_semaphore_create(0);
  long long v15 = v2;
  long long v16 = &v17;
  unint64_t v3 = objc_retainBlock(&v11);
  id v4 = objc_alloc((Class)FBSDisplayLayoutMonitor);
  id v5 = [v4 initWithDisplayType:0 handler:v3 v11 v12 v13 v14];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v2, v6);
  [v5 invalidate];
  id v7 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v18[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning foreground app as %@ on start", buf, 0xCu);
  }

  id v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (void)syncStateWithActiveRemote
{
  unint64_t v3 = [(CDDCommunicator *)self obtainForegroundApplication];
  if (v3)
  {
    id v4 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      dispatch_time_t v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App %@ foreground on start", (uint8_t *)&v5, 0xCu);
    }

    [(CDDCommunicator *)self triggerFocalAppExchange:v3 inState:0];
  }
  [(CDDCommunicator *)self triggerSystemDataExchange:1 wakeRemote:1];
}

- (void)checkDevices:(id)a3
{
  id v4 = a3;
  if (self->initialized)
  {
    int v5 = +[NSMutableDictionary dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = -[CDDCommControl identifierFromDeviceDescription:](self->control, "identifierFromDeviceDescription:", v11, (void)v22);
          if (v12)
          {
            long long v13 = [v11 objectForKeyedSubscript:&off_10003B258];
            [v5 setObject:v13 forKeyedSubscript:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v8);
    }

    long long v14 = [v5 allKeys];
    long long v15 = +[NSSet setWithArray:v14];

    long long v16 = [(NSDictionary *)self->registeredDevices allKeys];
    uint64_t v17 = +[NSSet setWithArray:v16];

    BOOL hasRemote = self->hasRemote;
    if (([v17 isEqualToSet:v15] & 1) == 0)
    {
      objc_storeStrong((id *)&self->registeredDevices, v5);
      if ([(NSDictionary *)self->registeredDevices count])
      {
        self->BOOL hasRemote = 1;
        if (!hasRemote) {
          [(CDDCommunicator *)self registerForSystemConditionChanges];
        }
        [(CDDCommunicator *)self informCommunicationError];
        uint64_t v19 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v20 = [(CDDCommunicator *)self remoteVersionNumber];
          unint64_t v21 = [(CDDCommunicator *)self localMaxSupportedVersionNumber];
          *(_DWORD *)buf = 134218240;
          unint64_t v27 = v20;
          __int16 v28 = 2048;
          unint64_t v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: Resetting outgoing version number from %llu to %llu.", buf, 0x16u);
        }

        [(CDDCommunicator *)self setRemoteVersionNumber:[(CDDCommunicator *)self localMaxSupportedVersionNumber]];
      }
      else
      {
        self->BOOL hasRemote = 0;
        if (hasRemote) {
          [(CDDCommunicator *)self deregisterForSystemConditionChanges];
        }
      }
      notify_post("com.apple.coreduetd.remoteDeviceChange");
    }
  }
  else
  {
    int v5 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not initialized at checkDevices", buf, 2u);
    }
  }
}

- (id)convertMessage:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5
{
  id v7 = [a3 mutableCopy];
  id v8 = [v7 objectForKeyedSubscript:&off_10003B258];
  if (a4 == 1 && a5 == 2)
  {
    uint64_t v9 = +[CDDCommunicatorHelper sharedInstance];
    id v10 = [v8 objectForKeyedSubscript:&off_10003B270];
    uint64_t v11 = [v9 getNewThermalValueForOldValue:v10];
LABEL_7:
    uint64_t v12 = (void *)v11;
    [v8 setObject:v11 forKeyedSubscript:&off_10003B270];

    goto LABEL_8;
  }
  if (a4 == 2 && a5 == 1)
  {
    uint64_t v9 = +[CDDCommunicatorHelper sharedInstance];
    id v10 = [v8 objectForKeyedSubscript:&off_10003B270];
    uint64_t v11 = [v9 getOldThermalValueForNewValue:v10];
    goto LABEL_7;
  }
LABEL_8:
  [v7 setObject:v8 forKeyedSubscript:&off_10003B258];

  return v7;
}

- (id)getVersionsDictFromMaxVersion:(unint64_t)a3 minVersion:(unint64_t)a4
{
  v9[0] = @"MaxVersion";
  int v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  v9[1] = @"MinVersion";
  v10[0] = v5;
  id v6 = +[NSNumber numberWithUnsignedLongLong:a4];
  v10[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)getCurrrentSupportedVersions
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014820;
  block[3] = &unk_100038A78;
  void block[4] = self;
  if (qword_100040F20 != -1) {
    dispatch_once(&qword_100040F20, block);
  }
  return (id)qword_100040F18;
}

- (unint64_t)getOutgoingVersionForIncomingVersions:(id)a3
{
  id v4 = a3;
  int v5 = [(CDDCommunicator *)self getCurrrentSupportedVersions];
  id v6 = +[CDDCommunicatorHelper sharedInstance];
  id v7 = [v6 highestCommonVersionFor:v5 and:v4];

  return (unint64_t)v7;
}

- (id)getScheduledForecasts
{
  unint64_t v3 = +[NSDate date];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_1000138EC;
  long long v15 = sub_1000138FC;
  id v16 = +[NSMutableArray array];
  daemonQueue = self->daemonQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014A2C;
  block[3] = &unk_100038E98;
  void block[4] = self;
  id v9 = v3;
  id v10 = &v11;
  id v5 = v3;
  dispatch_sync(daemonQueue, block);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (BOOL)isConversionRequiredForMessage:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  if (a4 != a5 && (a4 == 1 || a5 == 1))
  {
    id v10 = [v7 objectForKeyedSubscript:&off_10003B288];
    unsigned int v11 = [v10 intValue];

    if (v11 <= 7) {
      unsigned int v9 = (0x83u >> v11) & 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)handleMessageVersioning:(id)a3
{
  id v4 = a3;
  if (self->localMaxSupportedVersionNumber == self->remoteVersionNumber
    || !-[CDDCommunicator isConversionRequiredForMessage:fromVersion:toVersion:](self, "isConversionRequiredForMessage:fromVersion:toVersion:", v4))
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(CDDCommunicator *)self convertMessage:v4 fromVersion:self->localMaxSupportedVersionNumber toVersion:self->remoteVersionNumber];
  }
  id v6 = v5;

  return v6;
}

- (id)makeSystemComboMessage
{
  v36 = +[NSDate date];
  [v36 timeIntervalSinceReferenceDate];
  uint64_t v4 = (uint64_t)v3;
  id v5 = +[NSTimeZone systemTimeZone];
  id v6 = [v5 secondsFromGMT];

  dispatch_assert_queue_V2((dispatch_queue_t)self->daemonQueue);
  [(CDDCommunicator *)self currentBatteryLevel];
  double v8 = v7;
  unsigned int v9 = [(CDDCommunicator *)self isPluggedIn];
  LOBYTE(v5) = v9;
  uint64_t v10 = v9;
  int v11 = [(CDDCommunicator *)self thermalPressureLevel];
  uint64_t v12 = v11;
  uint64_t v13 = [(CDD *)self->cdd privacyMonitor];
  id v14 = [v13 updateAllowed];

  self->_lastBatteryPercentageSent = v8;
  self->_lastPluginStateSent = (char)v5;
  self->_lastThermalLevelSent = v11;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  id v16 = +[NSNumber numberWithLongLong:v4];
  [v15 setObject:v16 forKey:&off_10003B288];

  uint64_t v17 = +[NSNumber numberWithLongLong:v6];
  [v15 setObject:v17 forKey:&off_10003B2A0];

  long long v18 = +[NSNumber numberWithDouble:v8];
  [v15 setObject:v18 forKey:&off_10003B258];

  uint64_t v19 = +[NSNumber numberWithDouble:100.0];
  [v15 setObject:v19 forKey:&off_10003B2B8];

  unint64_t v20 = +[NSNumber numberWithLongLong:v10];
  [v15 setObject:v20 forKey:&off_10003B2D0];

  unint64_t v21 = +[NSNumber numberWithLongLong:v12];
  [v15 setObject:v21 forKey:&off_10003B270];

  long long v22 = +[NSNumber numberWithBool:v14];
  [v15 setObject:v22 forKey:&off_10003B2E8];

  self->_lastWiFiWiredQuality = [(CDDCommunicator *)self currentWiFiWiredQuality];
  self->_lastCellQuality = [(CDDCommunicator *)self currentCellQuality];
  long long v23 = +[NSNumber numberWithUnsignedInteger:self->_lastWiFiWiredQuality];
  [v15 setObject:v23 forKey:&off_10003B300];

  long long v24 = +[NSNumber numberWithUnsignedInteger:self->_lastCellQuality];
  [v15 setObject:v24 forKey:&off_10003B318];

  localFocalApp = self->localFocalApp;
  if (localFocalApp && sub_100015164(self->focalAppWhitelist, localFocalApp)) {
    [v15 setObject:self->localFocalApp forKey:&off_10003B330];
  }
  uint64_t v26 = [(CDDCommunicator *)self generateNonAppFocalString];
  if (v26) {
    [v15 setObject:v26 forKey:&off_10003B348];
  }
  unint64_t v27 = [(CDD *)self->cdd watchUpdate];
  [v27 addWatchfaceInfo:v15];

  __int16 v28 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_100022880(v15, v28);
  }

  systemData = self->systemData;
  v30 = +[NSString stringWithFormat:@"%@", &off_10003B360];
  [(NSMutableDictionary *)systemData setObject:v15 forKey:v30];

  v38[0] = &off_10003B2A0;
  v37[0] = &off_10003B288;
  v37[1] = &off_10003B2A0;
  v31 = +[NSNumber numberWithUnsignedLongLong:self->remoteVersionNumber];
  v38[1] = v31;
  v37[2] = &off_10003B2D0;
  id v32 = [(CDDCommunicator *)self getCurrrentSupportedVersions];
  v37[3] = &off_10003B258;
  v38[2] = v32;
  v38[3] = v15;
  id v33 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

  v34 = [(CDDCommunicator *)self handleMessageVersioning:v33];

  return v34;
}

- (id)makeScheduledMessage:(id)a3 withForecasts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[NSMutableArray array];
  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v7 = [(CDDCommunicator *)self getScheduledForecasts];
  if (v7)
  {
    double v8 = (void *)v7;
    [v6 addObjectsFromArray:v7];

LABEL_4:
    id v9 = v6;
    goto LABEL_5;
  }
  int v11 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: null forecast data.", v12, 2u);
  }

  id v9 = 0;
LABEL_5:

  return v9;
}

- (id)makeForecastMessage:(id *)a3
{
  unint64_t var8 = a3->var8;
  uint64_t v4 = 1;
  if ((var8 & 0x800) == 0) {
    uint64_t v4 = 2;
  }
  if ((var8 & 0x400) != 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  if (a3->var13)
  {
    id v6 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CDDCommunicator: invalid attribute format.", buf, 2u);
    }

    goto LABEL_10;
  }
  uint64_t v12 = -[CDD pmfOverHourOfDayWithParams:](self->cdd, "pmfOverHourOfDayWithParams:");
  if (!v12)
  {
LABEL_10:
    uint64_t v7 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CDDCommunicator: failed to generate forecast.", buf, 2u);
    }
    double v8 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = v12;
  if (a3->var14)
  {
    p_var2 = a3;
    if (v5)
    {
      if (v5 == 2) {
        p_var2 = &a3->var2;
      }
      else {
        p_var2 = &a3->var1;
      }
    }
  }
  else
  {
    p_var2 = 0;
  }
  uint64_t v14 = sub_100013EB0(v12, v5, 0, (uint64_t)p_var2);
  id v15 = (void *)v14;
  if (v14)
  {
    v39 = (void *)v14;
    v43[0] = &off_10003B288;
    v38 = +[NSNumber numberWithUnsignedLongLong:a3->var8];
    *(void *)buf = v38;
    v43[1] = &off_10003B2A0;
    v37 = +[NSNumber numberWithUnsignedLongLong:a3->var9];
    v45 = v37;
    v43[2] = &off_10003B258;
    id v16 = +[NSNumber numberWithUnsignedLongLong:a3->var13];
    objc_super v46 = v16;
    v43[3] = &off_10003B2B8;
    uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:a3->var3];
    v47 = v17;
    v43[4] = &off_10003B2D0;
    long long v18 = +[NSNumber numberWithUnsignedLongLong:a3->var4];
    v48 = v18;
    v43[5] = &off_10003B270;
    uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:a3->var5];
    v49 = v19;
    v43[6] = &off_10003B2E8;
    unint64_t v20 = +[NSNumber numberWithUnsignedLongLong:a3->var6];
    v50 = v20;
    unint64_t v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:v43 count:7];
    long long v22 = [v21 mutableCopy];

    if (a3->var14)
    {
      unint64_t v23 = a3->var8;
      uint64_t v24 = 1;
      if ((v23 & 0x800) == 0) {
        uint64_t v24 = 2;
      }
      if ((v23 & 0x400) != 0) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = v24;
      }
      if (v25 == 2)
      {
        uint64_t v26 = +[NSString stringWithUTF8String:a3->var2];
      }
      else
      {
        if (v25 == 1) {
          +[NSNumber numberWithDouble:a3->var1];
        }
        else {
        uint64_t v26 = +[NSNumber numberWithUnsignedLongLong:a3->var0];
        }
      }
      unint64_t v27 = (void *)v26;
      [v22 setObject:v26 forKey:&off_10003B330];
    }
    id v15 = v39;
    if (!v22) {
      sub_100022918();
    }
    __int16 v28 = [(CDD *)self->cdd knowledgeStore];
    unint64_t v29 = +[_DKPredictor predictorWithKnowledgeStore:v28];

    v30 = [v29 localInBedPeriod];
    v31 = [v30 startDate];
    v42[0] = v31;
    id v32 = [v30 endDate];
    v42[1] = v32;
    id v33 = +[NSArray arrayWithObjects:v42 count:2];

    v41[0] = &off_10003B2B8;
    v40[0] = &off_10003B288;
    v40[1] = &off_10003B2A0;
    v34 = +[NSNumber numberWithUnsignedLongLong:self->remoteVersionNumber];
    v41[1] = v34;
    v40[2] = &off_10003B2D0;
    v35 = [(CDDCommunicator *)self getCurrrentSupportedVersions];
    v41[2] = v35;
    v41[3] = v39;
    v40[3] = &off_10003B258;
    v40[4] = &off_10003B270;
    v40[5] = &off_10003B2B8;
    v41[4] = v33;
    v41[5] = v22;
    v36 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:6];

    double v8 = [(CDDCommunicator *)self handleMessageVersioning:v36];
  }
  else
  {
    long long v22 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CDDCommunicator: failed to pack forecast.", buf, 2u);
    }
    double v8 = 0;
  }

LABEL_13:

  return v8;
}

- (id)makeRemoteDeviceSyncMessage
{
  v9[0] = &off_10003B348;
  v8[0] = &off_10003B288;
  v8[1] = &off_10003B2A0;
  double v3 = +[NSNumber numberWithUnsignedLongLong:self->remoteVersionNumber];
  v9[1] = v3;
  v8[2] = &off_10003B2D0;
  uint64_t v4 = [(CDDCommunicator *)self getCurrrentSupportedVersions];
  void v9[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  id v6 = [(CDDCommunicator *)self handleMessageVersioning:v5];

  return v6;
}

- (id)makeAckMessage
{
  v10[0] = &off_10003B2E8;
  v9[0] = &off_10003B288;
  v9[1] = &off_10003B2A0;
  double v3 = +[NSNumber numberWithUnsignedLongLong:self->remoteVersionNumber];
  v10[1] = v3;
  void v9[2] = &off_10003B2D0;
  uint64_t v4 = [(CDDCommunicator *)self getCurrrentSupportedVersions];
  void v10[2] = v4;
  void v9[3] = &off_10003B258;
  uint64_t v5 = +[NSDate date];
  v10[3] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  uint64_t v7 = [(CDDCommunicator *)self handleMessageVersioning:v6];

  return v7;
}

- (void)receiveInBedTimes:(id)a3
{
}

- (void)receiveForecast:(id)a3 paramDict:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->initialized && ![(CDD *)self->cdd classCLocked])
  {
    if (v8)
    {
      if (v9)
      {
        int v11 = [(CDDCommControl *)self->control identifierFromDeviceDescription:v10];
        uint64_t v12 = sub_100015D10(v9);
        cdd = self->cdd;
        id v23 = 0;
        unsigned __int8 v14 = [(CDD *)cdd saveForecast:v8 queryParameters:v12 deviceIdentifier:v11 error:&v23];
        id v15 = v23;
        free(v12);
        id v16 = +[_CDLogging communicatorChannel];
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v14)
        {
          if (v17)
          {
            id v18 = [v8 description];
            uint64_t v19 = [v18 UTF8String];
            id v20 = [v9 description];
            id v21 = [v20 UTF8String];
            *(_DWORD *)buf = 136315394;
            uint64_t v25 = v19;
            __int16 v26 = 2080;
            id v27 = v21;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: forecasts saved. %s paramdict = %s ", buf, 0x16u);
          }
        }
        else if (v17)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: failed to save forecast with %@", buf, 0xCu);
        }

        goto LABEL_16;
      }
      id v15 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        long long v22 = "CDDCommunicator: saveForecast: no param dictionary.";
        goto LABEL_12;
      }
    }
    else
    {
      id v15 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        long long v22 = "CDDCommunicator: saveForecast: no forecast data.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v22, buf, 2u);
      }
    }
LABEL_16:
  }
}

- (void)receiveSystemData:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->initialized)
  {
    id v8 = [(CDDCommControl *)self->control identifierFromDeviceDescription:v7];
    id v9 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v7 objectForKey:&off_10003B288];
      id v10 = v8;
      id v11 = objc_claimAutoreleasedReturnValue();
      id v12 = [v11 UTF8String];
      id v13 = [v7 objectForKey:&off_10003B258];
      id v14 = [v13 UTF8String];
      id v15 = [v7 objectForKey:&off_10003B2A0];
      *(_DWORD *)buf = 136315650;
      id v82 = v12;
      __int16 v83 = 2080;
      id v84 = v14;
      __int16 v85 = 2080;
      id v86 = [v15 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: received system data from \"%s\" (%s:%s):", buf, 0x20u);

      id v8 = v10;
    }

    id v16 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100022970((uint64_t)v6, v16);
    }

    if (v6)
    {
      BOOL v17 = [v6 objectForKey:&off_10003B288];
      uint64_t v18 = [v6 objectForKey:&off_10003B2A0];
      uint64_t v19 = (void *)v18;
      if (v17 && v18)
      {
        id v63 = v7;
        id v20 = [v6 objectForKey:&off_10003B258];
        id v21 = [v6 objectForKey:&off_10003B2B8];
        long long v22 = [v6 objectForKey:&off_10003B2D0];
        v72 = [v6 objectForKey:&off_10003B270];
        id v23 = [v6 objectForKey:&off_10003B2E8];
        id v61 = [v6 objectForKey:&off_10003B330];
        [v6 objectForKey:&off_10003B348];
        v69 = v17;
        id v70 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = +[NSMutableString stringWithFormat:@"\nTimestamp         : %d", [v17 intValue]];
        v68 = v19;
        [v24 appendFormat:@"\nTimestampOffset   : %d sec", [v19 intValue]];
        v67 = v20;
        [v24 appendFormat:@"\nBatteryLevel      : %d%%", [v20 intValue]];
        v66 = v21;
        [v24 appendFormat:@"\nBatteryCapacity   : %d", [v21 intValue]];
        v65 = v22;
        unsigned int v25 = [v22 BOOLValue];
        __int16 v26 = "NO";
        if (v25) {
          __int16 v26 = "YES";
        }
        [v24 appendFormat:@"\nCharging          : %s", v26];
        [v24 appendFormat:@"\nThermalLevel      : %d", [v72 intValue]];
        v64 = v23;
        [v24 appendFormat:@"\nBgAppRefresh      : %d", [v23 intValue]];
        id v60 = v61;
        [v24 appendFormat:@"\nFocalApp          : %s", [v60 UTF8String]];
        id v27 = v70;
        [v24 appendFormat:@"\nFocalNonApp       : %s", [v27 UTF8String]];
        __int16 v28 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v82 = v24;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
        id v62 = v24;

        daemonQueue = self->daemonQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001672C;
        block[3] = &unk_100038EC0;
        void block[4] = self;
        id v78 = v6;
        id v71 = v8;
        id v30 = v8;
        id v79 = v30;
        dispatch_sync(daemonQueue, block);
        v31 = [(NSMutableDictionary *)self->systemData objectForKeyedSubscript:v30];
        id v32 = [v31 objectForKeyedSubscript:&off_10003B258];
        context = self->_context;
        v34 = +[_CDContextQueries keyPathForDefaultPairedDeviceBatteryLevel];
        [(_CDLocalContext *)context setObject:v32 forKeyedSubscript:v34];

        v35 = [(NSMutableDictionary *)self->systemData objectForKeyedSubscript:v30];
        v36 = [v35 objectForKeyedSubscript:&off_10003B2D0];
        v37 = self->_context;
        v38 = +[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus];
        [(_CDLocalContext *)v37 setObject:v36 forKeyedSubscript:v38];

        v39 = [(NSMutableDictionary *)self->systemData objectForKeyedSubscript:v30];
        v40 = [v39 objectForKeyedSubscript:&off_10003B270];
        uint64_t v41 = self->_context;
        v42 = +[_CDContextQueries keyPathForDefaultPairedDeviceThermalPressureLevel];
        [(_CDLocalContext *)v41 setObject:v40 forKeyedSubscript:v42];

        uint64_t v43 = [(NSMutableDictionary *)self->systemData objectForKeyedSubscript:v30];
        v44 = [v43 objectForKeyedSubscript:&off_10003B330];
        v45 = self->_context;
        objc_super v46 = +[_CDContextQueries keyPathForDefaultPairedDeviceForegroundApp];
        [(_CDLocalContext *)v45 setObject:v44 forKeyedSubscript:v46];

        v47 = v27;
        v48 = [v27 componentsSeparatedByString:@","];
        v49 = +[NSMutableArray array];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v50 = v48;
        id v51 = [v50 countByEnumeratingWithState:&v73 objects:v80 count:16];
        id v7 = v63;
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v74;
          do
          {
            for (i = 0; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v74 != v53) {
                objc_enumerationMutation(v50);
              }
              v55 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              if ([v55 length]) {
                [v49 addObject:v55];
              }
            }
            id v52 = [v50 countByEnumeratingWithState:&v73 objects:v80 count:16];
          }
          while (v52);
        }

        id v56 = [v49 copy];
        v57 = self->_context;
        v58 = +[_CDContextQueries keyPathForDefaultPairedServicesAppearingForeground];
        [(_CDLocalContext *)v57 setObject:v56 forKeyedSubscript:v58];

        BOOL v17 = v69;
        id v8 = v71;
      }
      else
      {
        v59 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "CDDCommunicator: missing timestamps for persisting system data.", buf, 2u);
        }
      }
    }
    else
    {
      BOOL v17 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CDDCommunicator: missing system data, cannot proceed.", buf, 2u);
      }
    }
  }
}

- (id)getAckMessage
{
  uint64_t v2 = [(CDDCommunicator *)self makeAckMessage];
  if (!v2) {
    sub_1000229E8();
  }
  double v3 = (void *)v2;
  uint64_t v4 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];
  if (!v4) {
    sub_100022A14();
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

- (id)getScheduledMessage:(id)a3 withForecasts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CDDCommunicator *)self makeScheduledMessage:v6 withForecasts:v4];
  if (!v7) {
    sub_100022A40();
  }
  id v8 = (void *)v7;
  uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  if (!v9) {
    sub_100022A6C();
  }
  id v10 = (void *)v9;

  return v10;
}

- (void)triggerExchangeForFocalApp:(id)a3 inState:(int)a4 withNonApps:(id)a5 byClient:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  [(CDDCommunicator *)self triggerFocalAppExchange:a3 inState:v7 shouldSendMessage:0];
  [(CDDCommunicator *)self triggerNonAppFocalExchange:v10 byClient:a6 shouldSendMessage:0];
  daemonQueue = self->daemonQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000169B0;
  v17[3] = &unk_100038EE8;
  int v19 = v7;
  v17[4] = self;
  id v18 = v10;
  id v12 = v17;
  id v13 = daemonQueue;
  id v14 = v10;
  id v15 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182A0;
  block[3] = &unk_100038AA0;
  id v21 = v15;
  id v22 = v12;
  id v16 = v15;
  dispatch_async(v13, block);
}

- (void)triggerFocalAppExchange:(id)a3 inState:(int)a4
{
}

- (void)triggerFocalAppExchange:(id)a3 inState:(int)a4 shouldSendMessage:(BOOL)a5
{
  id v8 = a3;
  uint64_t v9 = [(CDD *)self->cdd config];
  if ([v9 commEnabled])
  {
    BOOL initialized = self->initialized;

    if (v8 && initialized)
    {
      daemonQueue = self->daemonQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100016B7C;
      v16[3] = &unk_100038F10;
      int v18 = a4;
      v16[4] = self;
      id v17 = v8;
      BOOL v19 = a5;
      id v12 = v16;
      id v13 = daemonQueue;
      id v14 = (void *)os_transaction_create();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000182A0;
      block[3] = &unk_100038AA0;
      id v21 = v14;
      id v22 = v12;
      id v15 = v14;
      dispatch_async(v13, block);
    }
  }
  else
  {
  }
}

- (id)generateNonAppFocalString
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1000138EC;
  id v10 = sub_1000138FC;
  id v11 = 0;
  localNonAppsInFocus = self->localNonAppsInFocus;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100016E48;
  v5[3] = &unk_100038F38;
  v5[4] = &v6;
  [(NSMutableDictionary *)localNonAppsInFocus enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)generateFocalNonAppFocalMutableSet
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  localNonAppsInFocus = self->localNonAppsInFocus;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016FB4;
  v7[3] = &unk_100038C88;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)localNonAppsInFocus enumerateKeysAndObjectsUsingBlock:v7];
  if (self->localFocalApp) {
    [v5 addObject:];
  }

  return v5;
}

- (void)informCommunicationError
{
  daemonQueue = self->daemonQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000170BC;
  v7[3] = &unk_100038A78;
  void v7[4] = self;
  id v3 = v7;
  BOOL v4 = daemonQueue;
  id v5 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182A0;
  block[3] = &unk_100038AA0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  dispatch_async(v4, block);
}

- (void)exchangeSystemComboMessage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CDDCommunicator *)self generateFocalNonAppFocalMutableSet];
  if ([(NSArray *)self->exclusiveApps count])
  {
    uint64_t v6 = 0;
    do
    {
      lastSentFocalNonFocalState = self->lastSentFocalNonFocalState;
      id v8 = [(NSArray *)self->exclusiveApps objectAtIndex:v6];
      LOBYTE(lastSentFocalNonFocalState) = [(NSMutableSet *)lastSentFocalNonFocalState containsObject:v8];

      if (lastSentFocalNonFocalState) {
        goto LABEL_16;
      }
    }
    while (++v6 < [(NSArray *)self->exclusiveApps count]);
  }
  if ([v5 isEqualToSet:self->lastSentFocalNonFocalState])
  {
    self->shouldTriggerDelayedMessage = 0;
    id v9 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "CDDCommunicator: Same focal app/nonapp state as last sent. Avoiding broadcasting. Any scheduled delayed mess"
            "ages set to void";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ([v5 isSubsetOfSet:self->lastSentFocalNonFocalState])
  {
    id v11 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator:  Focal app/nonapp state subset of last sent.", buf, 2u);
    }

    if (!self->shouldTriggerDelayedMessage)
    {
      self->shouldTriggerDelayedMessage = 1;
      BOOL v19 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "CDDCommunicator:  Scheduled to broadcast delayed focal app/nonapp message.", buf, 2u);
      }

      dispatch_time_t v20 = dispatch_time(0, 10000000000);
      daemonQueue = self->daemonQueue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100017448;
      v22[3] = &unk_100038F60;
      v22[4] = self;
      BOOL v23 = v3;
      dispatch_after(v20, daemonQueue, v22);
      goto LABEL_19;
    }
    id v9 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "CDDCommunicator:  Avoiding broadcast of delayed focal app/nonapp message. Another delayed message already scheduled or ";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_19;
  }
LABEL_16:
  id v12 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CDDCommunicator:  Non-Matching focal app/nonapp state. Broadcasting right away. Any scheduled delayed messages set to void", buf, 2u);
  }

  id v13 = [(CDDCommunicator *)self makeSystemComboMessage];
  id v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
  self->shouldTriggerDelayedMessage = 0;
  control = self->control;
  id v16 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  [(CDDCommControl *)control triggeredExchange:v14 opportunistic:v3 queue:0 timeout:v16 urgent:1];

  id v17 = +[NSDate date];
  lastSystemExchange = self->lastSystemExchange;
  self->lastSystemExchange = v17;

  [(NSMutableSet *)self->lastSentFocalNonFocalState setSet:v5];
LABEL_19:
}

- (void)triggerNonAppFocalExchange:(id)a3 byClient:(unint64_t)a4
{
}

- (void)triggerNonAppFocalExchange:(id)a3 byClient:(unint64_t)a4 shouldSendMessage:(BOOL)a5
{
  id v8 = a3;
  daemonQueue = self->daemonQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000176C8;
  v15[3] = &unk_100038F88;
  id v16 = v8;
  unint64_t v17 = a4;
  v15[4] = self;
  BOOL v18 = a5;
  id v10 = v15;
  id v11 = daemonQueue;
  id v12 = v8;
  id v13 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182A0;
  block[3] = &unk_100038AA0;
  id v20 = v13;
  id v21 = v10;
  id v14 = v13;
  dispatch_async(v11, block);
}

- (void)triggerSystemDataExchange:(BOOL)a3 wakeRemote:(BOOL)a4
{
  id v13 = [(CDD *)self->cdd config];
  if ([v13 commEnabled])
  {
    BOOL initialized = self->initialized;

    if (initialized)
    {
      daemonQueue = self->daemonQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100017C10;
      v14[3] = &unk_100038FB0;
      v14[4] = self;
      BOOL v15 = a3;
      BOOL v16 = a4;
      id v9 = v14;
      id v10 = daemonQueue;
      id v11 = (void *)os_transaction_create();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000182A0;
      block[3] = &unk_100038AA0;
      id v18 = v11;
      id v19 = v9;
      id v12 = v11;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)requestRemoteDeviceSync
{
  daemonQueue = self->daemonQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017EB0;
  v7[3] = &unk_100038A78;
  void v7[4] = self;
  BOOL v3 = v7;
  BOOL v4 = daemonQueue;
  id v5 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182A0;
  block[3] = &unk_100038AA0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  dispatch_async(v4, block);
}

- (id)satisfyForecastDataRequest:(id)a3
{
  BOOL v4 = sub_100015D10(a3);
  id v5 = [(CDDCommunicator *)self makeForecastMessage:v4];
  if (v5)
  {
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    if (v6) {
      free(v4);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)receiveRequestedForecast:(id)a3 paramDict:(id)a4 transactionId:(unint64_t)a5 device:(id)a6
{
}

- (CDD)cdd
{
  return self->cdd;
}

- (CDDCommControl)control
{
  return self->control;
}

- (NSDictionary)registeredDevices
{
  return self->registeredDevices;
}

- (BOOL)initialized
{
  return self->initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->BOOL initialized = a3;
}

- (BOOL)hasRemote
{
  return self->hasRemote;
}

- (unint64_t)remoteVersionNumber
{
  return self->remoteVersionNumber;
}

- (void)setRemoteVersionNumber:(unint64_t)a3
{
  self->remoteVersionNumber = a3;
}

- (unint64_t)localMaxSupportedVersionNumber
{
  return self->localMaxSupportedVersionNumber;
}

- (unint64_t)localMinSupportedVersionNumber
{
  return self->localMinSupportedVersionNumber;
}

- (NSArray)exclusiveApps
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSArray)nonTrafficBundleID
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)lastFocalApp
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLastFocalApp:(id)a3
{
}

- (NSArray)lastFocalNonApps
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setLastFocalNonApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocalNonApps, 0);
  objc_storeStrong((id *)&self->_lastFocalApp, 0);
  objc_storeStrong((id *)&self->registeredDevices, 0);
  objc_storeStrong((id *)&self->daemonQueue, 0);
  objc_storeStrong((id *)&self->nonTrafficBundleID, 0);
  objc_storeStrong((id *)&self->exclusiveApps, 0);
  objc_storeStrong((id *)&self->lastSentFocalNonFocalState, 0);
  objc_storeStrong((id *)&self->lastSystemExchange, 0);
  objc_storeStrong((id *)&self->systemData, 0);
  objc_storeStrong((id *)&self->focalAppWhitelist, 0);
  objc_storeStrong((id *)&self->localNonAppsInFocus, 0);
  objc_storeStrong((id *)&self->localFocalApp, 0);
  objc_storeStrong((id *)&self->scheduledForecastRequests, 0);
  objc_storeStrong((id *)&self->_networkRegistration, 0);
  objc_storeStrong((id *)&self->_applicationRegistration, 0);
  objc_storeStrong((id *)&self->_thermalRegistration, 0);
  objc_storeStrong((id *)&self->_pluggedInRegistration, 0);
  objc_storeStrong((id *)&self->_batteryRegistration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->control, 0);

  objc_storeStrong((id *)&self->cdd, 0);
}

@end