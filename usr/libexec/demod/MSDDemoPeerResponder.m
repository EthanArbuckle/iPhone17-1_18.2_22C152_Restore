@interface MSDDemoPeerResponder
+ (id)sharedInstance;
- (BOOL)_queryThermalMitigationStatus;
- (MSDDemoPeerResponder)init;
- (MSDRapportDeviceAdvertiser)rpDeviceAdvertiser;
- (MSDRapportMessageHandler)rpMessageHandler;
- (NSDictionary)messageHandlerTable;
- (NSMutableArray)subscribers;
- (NSString)devicePublicID;
- (NSString)pairingPassword;
- (id)_constructMessageHandlerTable;
- (id)_getDeviceAddresses;
- (id)_handleAdjustVolumeRequestMessage:(id)a3;
- (id)_handleChangeWiFiSettingsRequestMessage:(id)a3;
- (id)_handleEnumerateScriptsRequestMessage:(id)a3;
- (id)_handleFetchDeviceInfoRequestMessage:(id)a3;
- (id)_handleGetAXSettingsRequestMessage:(id)a3;
- (id)_handleInitiateAirPlayAssistedRequestMessage:(id)a3;
- (id)_handleInitiateIPDResetRequestMessage:(id)a3;
- (id)_handleInvokeInputRecoveryRequestMessage:(id)a3;
- (id)_handleLaunchAppRequestMessage:(id)a3;
- (id)_handleLaunchScriptRequestMessage:(id)a3;
- (id)_handleListAppsRequestMessage:(id)a3;
- (id)_handleListAvailableEnvironmentsRequestMessage:(id)a3;
- (id)_handleLoadLSMeasurementsRequestMessage:(id)a3;
- (id)_handleObtainGKMetricsRequestMessage:(id)a3;
- (id)_handleObtainGKResultsRequestMessage:(id)a3;
- (id)_handleQueryIPDResetStageRequestMessage:(id)a3;
- (id)_handleReadIPDStatusRequestMessage:(id)a3;
- (id)_handleResetToPassThroughRequestMessage:(id)a3;
- (id)_handleRetrieveHSCoachingSuggestionRequestMessage:(id)a3;
- (id)_handleSetAXSettingsRequestMessage:(id)a3;
- (id)_handleSetActiveEnvironmentRequestMessage:(id)a3;
- (id)_handleSetImmersionLevelRequestMessage:(id)a3;
- (id)_handleSkipAutoIPDAdjustmentRequestMessage:(id)a3;
- (id)_handleSubscribeDeviceInfoRequestMessage:(id)a3;
- (id)_handleTerminateAppRequestMessage:(id)a3;
- (id)_handleTriggerSnapshotRevertRequestMessage:(id)a3;
- (id)_handleWipeCustomerAssetsRequestMessage:(id)a3;
- (id)_prepareDeviceInfoDictionaryForRequest:(id)a3;
- (id)didReceiveRequestMessage:(id)a3 fromDevice:(id)a4;
- (void)_uploadPairingPassword;
- (void)advertiserDidHidePairingPassword;
- (void)advertiserDidShowPairingPassword:(id)a3;
- (void)advertiserDidUpdateLocalDevicePublicIDFrom:(id)a3 to:(id)a4;
- (void)didReceiveEventMessage:(id)a3 fromDevice:(id)a4;
- (void)setDevicePublicID:(id)a3;
- (void)setMessageHandlerTable:(id)a3;
- (void)setPairingPassword:(id)a3;
- (void)setRpDeviceAdvertiser:(id)a3;
- (void)setRpMessageHandler:(id)a3;
- (void)setSubscribers:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MSDDemoPeerResponder

+ (id)sharedInstance
{
  if (qword_100189D20 != -1) {
    dispatch_once(&qword_100189D20, &stru_100154118);
  }
  v2 = (void *)qword_100189D28;

  return v2;
}

- (MSDDemoPeerResponder)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDDemoPeerResponder;
  v2 = [(MSDDemoPeerResponder *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MSDDemoPeerResponder *)v2 _constructMessageHandlerTable];
    [(MSDDemoPeerResponder *)v3 setMessageHandlerTable:v4];

    v5 = +[NSMutableArray arrayWithCapacity:0];
    [(MSDDemoPeerResponder *)v3 setSubscribers:v5];
  }
  return v3;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerResponder: Starting responder...", buf, 2u);
  }

  v4 = [(MSDDemoPeerResponder *)v2 rpDeviceAdvertiser];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    v6 = [[MSDRapportDeviceAdvertiser alloc] initWithObserver:v2];
    [(MSDDemoPeerResponder *)v2 setRpDeviceAdvertiser:v6];

    objc_super v7 = [(MSDDemoPeerResponder *)v2 rpDeviceAdvertiser];
    [v7 activate];
  }
  v8 = [(MSDDemoPeerResponder *)v2 rpMessageHandler];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    v10 = [(MSDDemoPeerResponder *)v2 messageHandlerTable];
    v11 = [v10 allKeys];

    v12 = [[MSDRapportMessageHandler alloc] initWithObserver:v2];
    [(MSDDemoPeerResponder *)v2 setRpMessageHandler:v12];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v16);
          v18 = [(MSDDemoPeerResponder *)v2 rpMessageHandler];
          [v18 listenForIncomingRequestMessageOfID:v17];

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v14);
    }
  }
  objc_sync_exit(v2);
}

- (void)stop
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerResponder: Stopping responder...", v7, 2u);
  }

  v4 = [(MSDDemoPeerResponder *)v2 rpDeviceAdvertiser];

  if (v4)
  {
    BOOL v5 = [(MSDDemoPeerResponder *)v2 rpDeviceAdvertiser];
    [v5 deactivate];

    [(MSDDemoPeerResponder *)v2 setRpDeviceAdvertiser:0];
  }
  v6 = [(MSDDemoPeerResponder *)v2 rpMessageHandler];

  if (v6) {
    [(MSDDemoPeerResponder *)v2 setRpMessageHandler:0];
  }
  objc_sync_exit(v2);
}

- (id)_constructMessageHandlerTable
{
  v31[0] = @"com.apple.MobileStoreDemo.SubscribeDeviceInfo";
  v30 = NSStringFromSelector("_handleSubscribeDeviceInfoRequestMessage:");
  v32[0] = v30;
  v31[1] = @"com.apple.MobileStoreDemo.FetchDeviceInfo";
  v29 = NSStringFromSelector("_handleFetchDeviceInfoRequestMessage:");
  v32[1] = v29;
  v31[2] = @"com.apple.MobileStoreDemo.InitiateAirPlayAssisted";
  v28 = NSStringFromSelector("_handleInitiateAirPlayAssistedRequestMessage:");
  v32[2] = v28;
  v31[3] = @"com.apple.MobileStoreDemo.TriggerSnapshotRevert";
  v27 = NSStringFromSelector("_handleTriggerSnapshotRevertRequestMessage:");
  v32[3] = v27;
  v31[4] = @"com.apple.MobileStoreDemo.InvokeInputRecovery";
  v26 = NSStringFromSelector("_handleInvokeInputRecoveryRequestMessage:");
  v32[4] = v26;
  v31[5] = @"com.apple.MobileStoreDemo.AdjustVolume";
  v25 = NSStringFromSelector("_handleAdjustVolumeRequestMessage:");
  v32[5] = v25;
  v31[6] = @"com.apple.MobileStoreDemo.ListApps";
  v24 = NSStringFromSelector("_handleListAppsRequestMessage:");
  v32[6] = v24;
  v31[7] = @"com.apple.MobileStoreDemo.LaunchApp";
  v23 = NSStringFromSelector("_handleLaunchAppRequestMessage:");
  v32[7] = v23;
  v31[8] = @"com.apple.MobileStoreDemo.TerminateApp";
  long long v22 = NSStringFromSelector("_handleTerminateAppRequestMessage:");
  v32[8] = v22;
  v31[9] = @"com.apple.MobileStoreDemo.ListAvailableEnvironments";
  long long v21 = NSStringFromSelector("_handleListAvailableEnvironmentsRequestMessage:");
  v32[9] = v21;
  v31[10] = @"com.apple.MobileStoreDemo.SetActiveEnvironment";
  long long v20 = NSStringFromSelector("_handleSetActiveEnvironmentRequestMessage:");
  v32[10] = v20;
  v31[11] = @"com.apple.MobileStoreDemo.SetImmersionLevel";
  long long v19 = NSStringFromSelector("_handleSetImmersionLevelRequestMessage:");
  v32[11] = v19;
  v31[12] = @"com.apple.MobileStoreDemo.ResetToPassThrough";
  v18 = NSStringFromSelector("_handleResetToPassThroughRequestMessage:");
  v32[12] = v18;
  v31[13] = @"com.apple.MobileStoreDemo.EnumerateScripts";
  uint64_t v17 = NSStringFromSelector("_handleEnumerateScriptsRequestMessage:");
  v32[13] = v17;
  v31[14] = @"com.apple.MobileStoreDemo.LaunchScript";
  v16 = NSStringFromSelector("_handleLaunchScriptRequestMessage:");
  v32[14] = v16;
  v31[15] = @"com.apple.MobileStoreDemo.ObtainGKResults";
  uint64_t v15 = NSStringFromSelector("_handleObtainGKResultsRequestMessage:");
  v32[15] = v15;
  v31[16] = @"com.apple.MobileStoreDemo.ObtainGKMetrics";
  id v14 = NSStringFromSelector("_handleObtainGKMetricsRequestMessage:");
  v32[16] = v14;
  v31[17] = @"com.apple.MobileStoreDemo.LoadLSMeasurements";
  v2 = NSStringFromSelector("_handleLoadLSMeasurementsRequestMessage:");
  v32[17] = v2;
  v31[18] = @"com.apple.MobileStoreDemo.RetrieveHSCoachingSuggestion";
  v3 = NSStringFromSelector("_handleRetrieveHSCoachingSuggestionRequestMessage:");
  v32[18] = v3;
  v31[19] = @"com.apple.MobileStoreDemo.ReadIPDStatus";
  v4 = NSStringFromSelector("_handleReadIPDStatusRequestMessage:");
  v32[19] = v4;
  v31[20] = @"com.apple.MobileStoreDemo.SkipAutoIPDAdjustment";
  BOOL v5 = NSStringFromSelector("_handleSkipAutoIPDAdjustmentRequestMessage:");
  v32[20] = v5;
  v31[21] = @"com.apple.MobileStoreDemo.InitiateIPDReset";
  v6 = NSStringFromSelector("_handleInitiateIPDResetRequestMessage:");
  v32[21] = v6;
  v31[22] = @"com.apple.MobileStoreDemo.QueryIPDResetStage";
  objc_super v7 = NSStringFromSelector("_handleQueryIPDResetStageRequestMessage:");
  v32[22] = v7;
  v31[23] = @"com.apple.MobileStoreDemo.GetAXSettings";
  v8 = NSStringFromSelector("_handleGetAXSettingsRequestMessage:");
  v32[23] = v8;
  v31[24] = @"com.apple.MobileStoreDemo.SetAXSettings";
  BOOL v9 = NSStringFromSelector("_handleSetAXSettingsRequestMessage:");
  v32[24] = v9;
  v31[25] = @"com.apple.MobileStoreDemo.WipeCustomerAssets";
  v10 = NSStringFromSelector("_handleWipeCustomerAssetsRequestMessage:");
  v32[25] = v10;
  v31[26] = @"com.apple.MobileStoreDemo.ChangeWiFiSettings";
  v11 = NSStringFromSelector("_handleChangeWiFiSettingsRequestMessage:");
  v32[26] = v11;
  id v13 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:27];

  return v13;
}

- (void)_uploadPairingPassword
{
  v6 = objc_alloc_init(MSDKVStoreRequest);
  [(MSDKVStoreRequest *)v6 setIsPost:1];
  v3 = [(MSDDemoPeerResponder *)self devicePublicID];
  [(MSDKVStoreRequest *)v6 setKey:v3];

  v4 = [(MSDDemoPeerResponder *)self pairingPassword];
  [(MSDKVStoreRequest *)v6 setValue:v4];

  [(MSDServerRequest *)v6 setCompletion:&stru_100154138];
  BOOL v5 = +[MSDServerRequestHandler sharedInstance];
  [v5 handleRequestAsync:v6];
}

- (BOOL)_queryThermalMitigationStatus
{
  return 0;
}

- (id)_getDeviceAddresses
{
  v2 = +[MSDIpInterface getIpv4Interfaces];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:@"address" v20];
          [v3 addObject:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000DD57C((uint64_t)v3, v10);
    }

    v11 = +[NSArray arrayWithArray:v3];
  }
  else
  {
    v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000DD504(v3, v13, v14, v15, v16, v17, v18, v19);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_prepareDeviceInfoDictionaryForRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = +[MSDTargetDevice sharedInstance];
  id v6 = +[MSDAudioController sharedInstance];
  uint64_t v7 = +[MSDWiFiHelper sharedInstance];
  v8 = +[MSDAccountManager sharedInstance];
  v43 = +[MSDAirPlayAssistedSender sharedInstance];
  id v37 = [v3 extractProtocolVersion];

  uint64_t v9 = [v5 name];
  v40 = (void *)v9;
  if (v9)
  {
    [v4 setObject:v9 forKeyedSubscript:kMSDKPeerDemoDevicePropertyDeviceName];
  }
  else
  {
    v10 = +[NSNull null];
    [v4 setObject:v10 forKeyedSubscript:kMSDKPeerDemoDevicePropertyDeviceName];
  }
  uint64_t v11 = [v5 productType];
  v39 = (void *)v11;
  if (v11)
  {
    [v4 setObject:v11 forKeyedSubscript:kMSDKPeerDemoDevicePropertyProductType];
  }
  else
  {
    v12 = +[NSNull null];
    [v4 setObject:v12 forKeyedSubscript:kMSDKPeerDemoDevicePropertyProductType];
  }
  uint64_t v13 = [v5 serialNumber];
  if (v13)
  {
    [v4 setObject:v13 forKeyedSubscript:kMSDKPeerDemoDevicePropertySerialNumber];
  }
  else
  {
    uint64_t v14 = +[NSNull null];
    [v4 setObject:v14 forKeyedSubscript:kMSDKPeerDemoDevicePropertySerialNumber];
  }
  uint64_t v15 = [v5 OSVersion];
  if (v15)
  {
    [v4 setObject:v15 forKeyedSubscript:kMSDKPeerDemoDevicePropertyOSVersion];
  }
  else
  {
    uint64_t v16 = +[NSNull null];
    [v4 setObject:v16 forKeyedSubscript:kMSDKPeerDemoDevicePropertyOSVersion];
  }
  uint64_t v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 batteryCapacity]);
  [v4 setObject:v17 forKeyedSubscript:kMSDKPeerDemoDevicePropertyBatteryCapacity];

  uint64_t v18 = [v7 getCurrentWiFiSsid];
  if (v18)
  {
    [v4 setObject:v18 forKeyedSubscript:kMSDKPeerDemoDevicePropertyWiFiNetworkName];
  }
  else
  {
    uint64_t v19 = +[NSNull null];
    [v4 setObject:v19 forKeyedSubscript:kMSDKPeerDemoDevicePropertyWiFiNetworkName];
  }
  v42 = v7;
  long long v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 getCurrentWiFiSignalStrength]);
  [v4 setObject:v20 forKeyedSubscript:kMSDKPeerDemoDevicePropertyWiFiSignalStrength];

  v41 = v8;
  long long v21 = [v8 existingAccounts];
  long long v22 = [v21 objectForKeyedSubscript:@"iCloud"];

  if (v22)
  {
    [v4 setObject:v22 forKeyedSubscript:kMSDKPeerDemoDevicePropertyiCloudAccountName];
  }
  else
  {
    long long v23 = +[NSNull null];
    [v4 setObject:v23 forKeyedSubscript:kMSDKPeerDemoDevicePropertyiCloudAccountName];
  }
  [v6 getVolumeForCategory:0];
  v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 setObject:v24 forKeyedSubscript:kMSDKPeerDemoDevicePropertyMainVolume];

  [v6 getVolumeForCategory:1];
  v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 setObject:v25 forKeyedSubscript:kMSDKPeerDemoDevicePropertyEnvironmentVolume];

  [v6 getVolumeForCategory:2];
  v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 setObject:v26 forKeyedSubscript:kMSDKPeerDemoDevicePropertyPhoneCallVolume];

  [v6 getVolumeForCategory:3];
  v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 setObject:v27 forKeyedSubscript:kMSDKPeerDemoDevicePropertyAudioVideoVolume];

  v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isContentFrozen]);
  [v4 setObject:v28 forKeyedSubscript:kMSDKPeerDemoDevicePropertyContentFrozen];

  v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v43 isSenderReady]);
  [v4 setObject:v29 forKeyedSubscript:kMSDKPeerDemoDevicePropertyAirPlayAssistedReady];

  v30 = +[NSNumber numberWithBool:[(MSDDemoPeerResponder *)self _queryThermalMitigationStatus]];
  [v4 setObject:v30 forKeyedSubscript:kMSDKPeerDemoDevicePropertyThermalMitigationNeeded];

  if ((unint64_t)v37 >= 2)
  {
    v31 = [(MSDDemoPeerResponder *)self _getDeviceAddresses];
    if (v31)
    {
      [v4 setObject:v31 forKeyedSubscript:kMSDKPeerDemoDevicePropertyIpAddresses];
    }
    else
    {
      v32 = +[NSNull null];
      [v4 setObject:v32 forKeyedSubscript:kMSDKPeerDemoDevicePropertyIpAddresses];
    }
    v33 = +[NSNumber numberWithBool:BYSetupAssistantNeedsToRun()];
    [v4 setObject:v33 forKeyedSubscript:kMSDKPeerDemoDevicePropertyBuddyInProgress];
  }
  v34 = sub_100068600();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_1000DD608();
  }

  v35 = +[NSDictionary dictionaryWithDictionary:v4];

  return v35;
}

- (id)_handleSubscribeDeviceInfoRequestMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v6 = [MSDRapportDevice alloc];
  uint64_t v7 = [v4 options];
  v8 = [(MSDRapportDevice *)v6 initWithIncomingOptions:v7];

  uint64_t v9 = [(MSDDemoPeerResponder *)self subscribers];
  unsigned __int8 v10 = [v9 containsObject:v8];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(MSDDemoPeerResponder *)self subscribers];
    [v11 addObject:v8];
  }
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result"];
  v12 = [MSDRapportMessage alloc];
  uint64_t v13 = [v4 identifier];
  uint64_t v14 = [(MSDRapportMessage *)v12 initWithIdentifier:v13 andPayload:v5 usingOptions:0];

  return v14;
}

- (id)_handleFetchDeviceInfoRequestMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v6 = [(MSDDemoPeerResponder *)self _prepareDeviceInfoDictionaryForRequest:v4];
  [v5 setObject:v6 forKeyedSubscript:@"DeviceInfo"];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result"];
  uint64_t v7 = [MSDRapportMessage alloc];
  v8 = [v4 identifier];

  uint64_t v9 = [(MSDRapportMessage *)v7 initWithIdentifier:v8 andPayload:v5 usingOptions:0];

  return v9;
}

- (id)_handleInitiateAirPlayAssistedRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDAirPlayAssistedSender sharedInstance];
  id v5 = [v3 payload];
  id v6 = [v5 objectForKeyedSubscript:@"APParameters"];

  uint64_t v7 = [v3 payload];
  v8 = [v7 objectForKeyedSubscript:@"APDiscoveryMode"];

  uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
  unsigned int v10 = [v4 activateSenderUsingParametersData:v6 discoveryMode:[v8 unsignedIntegerValue]];
  CFStringRef v11 = @"Result";
  if (v10)
  {
    CFStringRef v12 = (const __CFString *)&__kCFBooleanTrue;
  }
  else
  {
    [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
    CFStringRef v11 = @"Reason";
    CFStringRef v12 = @"An error has occurred.";
  }
  [v9 setObject:v12 forKeyedSubscript:v11];
  uint64_t v13 = [MSDRapportMessage alloc];
  uint64_t v14 = [v3 identifier];
  uint64_t v15 = [(MSDRapportMessage *)v13 initWithIdentifier:v14 andPayload:v9 usingOptions:0];

  return v15;
}

- (id)_handleTriggerSnapshotRevertRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDTargetDevice sharedInstance];
  id v5 = [v3 payload];
  id v6 = [v5 objectForKeyedSubscript:@"RebootAfterRevert"];

  uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if ([v4 canRevertSnapshot])
  {
    v8 = dispatch_get_global_queue(0, 0);
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    uint64_t v16 = sub_1000BABCC;
    uint64_t v17 = &unk_1001520B0;
    id v18 = v4;
    id v19 = v6;
    dispatch_after(v9, v8, &v14);
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result" v14, v15, v16, v17];
  }
  else
  {
    [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
    [v7 setObject:@"An error has occurred." forKeyedSubscript:@"Reason"];
  }
  unsigned int v10 = [MSDRapportMessage alloc];
  CFStringRef v11 = [v3 identifier];
  CFStringRef v12 = [(MSDRapportMessage *)v10 initWithIdentifier:v11 andPayload:v7 usingOptions:0];

  return v12;
}

- (id)_handleInvokeInputRecoveryRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD67C();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  id v6 = [MSDRapportMessage alloc];
  uint64_t v7 = [v3 identifier];

  v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleAdjustVolumeRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDAudioController sharedInstance];
  id v5 = [v3 payload];
  id v6 = [v5 objectForKeyedSubscript:@"VolumeValue"];

  uint64_t v7 = [v3 payload];
  v8 = [v7 objectForKeyedSubscript:@"VolumeCategory"];

  dispatch_time_t v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
  [v6 floatValue];
  int v11 = v10;
  id v12 = [v8 unsignedIntegerValue];
  LODWORD(v13) = v11;
  unsigned int v14 = [v4 setVolumeTo:v12 forCategory:v13];
  CFStringRef v15 = @"Result";
  if (v14)
  {
    CFStringRef v16 = (const __CFString *)&__kCFBooleanTrue;
  }
  else
  {
    [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
    CFStringRef v15 = @"Reason";
    CFStringRef v16 = @"An error has occurred.";
  }
  [v9 setObject:v16 forKeyedSubscript:v15];
  uint64_t v17 = [MSDRapportMessage alloc];
  id v18 = [v3 identifier];
  id v19 = [(MSDRapportMessage *)v17 initWithIdentifier:v18 andPayload:v9 usingOptions:0];

  return v19;
}

- (id)_handleListAppsRequestMessage:(id)a3
{
  id v3 = a3;
  id v37 = +[MSDAppHelper sharedInstance];
  id v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"AppListKind"];

  uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
  uint64_t v7 = +[NSMutableArray arrayWithCapacity:0];
  id v8 = [v5 unsignedIntegerValue];
  v35 = v5;
  if (v8 == (id)1)
  {
    dispatch_time_t v9 = [v37 runningApps:1];
  }
  else if (v8)
  {
    int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DD764();
    }

    dispatch_time_t v9 = +[NSArray array];
  }
  else
  {
    dispatch_time_t v9 = [v37 visibleApps];
  }
  v33 = (void *)v6;
  v34 = v3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v40;
    id obj = v11;
    while (2)
    {
      CFStringRef v16 = 0;
      uint64_t v17 = v14;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v16);
        id v19 = [v37 bundleLocalizedNameForInstalledApp:v18, v33];
        id v20 = [objc_alloc((Class)MSDKPeerDemoApp) initWithIdentifier:v18 andLocalizedName:v19];
        id v38 = v17;
        long long v21 = +[NSKeyedArchiver archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v38];
        id v14 = v38;

        if (!v21)
        {
          long long v22 = sub_100068600();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000DD6B0(v18, v14, v22);
          }

          id v11 = obj;
          long long v23 = v33;
          [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
          uint64_t v24 = [v14 localizedDescription];
          v25 = (__CFString *)v24;
          if (v24) {
            CFStringRef v26 = (const __CFString *)v24;
          }
          else {
            CFStringRef v26 = @"An error has occurred.";
          }
          CFStringRef v27 = @"Reason";
          v28 = v33;
          goto LABEL_25;
        }
        [v7 addObject:v21];

        CFStringRef v16 = (char *)v16 + 1;
        uint64_t v17 = v14;
      }
      while (v13 != v16);
      id v11 = obj;
      id v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }

  long long v23 = v33;
  [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result"];
  v25 = +[NSArray arrayWithArray:v7];
  CFStringRef v27 = @"AppArchiveList";
  v28 = v33;
  CFStringRef v26 = v25;
LABEL_25:
  [v28 setObject:v26 forKeyedSubscript:v27];

  v29 = [MSDRapportMessage alloc];
  v30 = [v34 identifier];
  v31 = [(MSDRapportMessage *)v29 initWithIdentifier:v30 andPayload:v23 usingOptions:0];

  return v31;
}

- (id)_handleLaunchAppRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"AppIdentifier"];

  uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v16 = 0;
  unsigned int v7 = +[MSDAppLauncherTerminator launchApp:v5 withOptions:0 outError:&v16];
  id v8 = v16;
  if (v7)
  {
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result"];
  }
  else
  {
    [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
    uint64_t v9 = [v8 localizedDescription];
    int v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"An error has occurred.";
    }
    [v6 setObject:v11 forKeyedSubscript:@"Reason"];
  }
  id v12 = [MSDRapportMessage alloc];
  id v13 = [v3 identifier];

  id v14 = [(MSDRapportMessage *)v12 initWithIdentifier:v13 andPayload:v6 usingOptions:0];

  return v14;
}

- (id)_handleTerminateAppRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"AppIdentifier"];

  uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v16 = 0;
  unsigned int v7 = +[MSDAppLauncherTerminator terminateApp:v5 outError:&v16];
  id v8 = v16;
  if (v7)
  {
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result"];
  }
  else
  {
    [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
    uint64_t v9 = [v8 localizedDescription];
    int v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"An error has occurred.";
    }
    [v6 setObject:v11 forKeyedSubscript:@"Reason"];
  }
  id v12 = [MSDRapportMessage alloc];
  id v13 = [v3 identifier];

  id v14 = [(MSDRapportMessage *)v12 initWithIdentifier:v13 andPayload:v6 usingOptions:0];

  return v14;
}

- (id)_handleListAvailableEnvironmentsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD7CC();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleSetActiveEnvironmentRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD7CC();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleSetImmersionLevelRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD7CC();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleResetToPassThroughRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD7CC();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleEnumerateScriptsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD800();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleLaunchScriptRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD834();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleObtainGKResultsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD868();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleObtainGKMetricsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD89C();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleLoadLSMeasurementsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD8D0();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleRetrieveHSCoachingSuggestionRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD904();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleReadIPDStatusRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD938();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleSkipAutoIPDAdjustmentRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD96C();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleInitiateIPDResetRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD9A0();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleQueryIPDResetStageRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DD9D4();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleGetAXSettingsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DDA08();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleSetAXSettingsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DDA3C();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleWipeCustomerAssetsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000DDA70();
  }

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
  [v4 setObject:@"Operation not supported" forKeyedSubscript:@"Reason"];
  uint64_t v6 = [MSDRapportMessage alloc];
  unsigned int v7 = [v3 identifier];

  id v8 = [(MSDRapportMessage *)v6 initWithIdentifier:v7 andPayload:v4 usingOptions:0];

  return v8;
}

- (id)_handleChangeWiFiSettingsRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 payload];
  unsigned int v7 = [v6 objectForKeyedSubscript:@"WiFiSettingsArchive"];
  id v22 = 0;
  id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v5 fromData:v7 error:&v22];
  id v9 = v22;

  if (!v8)
  {
    int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DDAA4();
    }
    goto LABEL_10;
  }
  int v10 = +[MSDWiFiHelper sharedInstance];
  CFStringRef v11 = [v8 ssid];
  id v12 = [v8 password];
  if ([v12 length])
  {
    id v13 = [v8 password];
  }
  else
  {
    id v13 = 0;
  }

  if (([v10 configureWiFi:v11 password:v13] & 1) == 0)
  {
    uint64_t v14 = +[NSError errorDomainMSDWithCode:3727741072 message:@"Failed to configure WiFi."];

    id v9 = (id)v14;
LABEL_10:

    [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Result"];
    uint64_t v15 = [v9 localizedDescription];
    id v16 = (void *)v15;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    else {
      CFStringRef v17 = @"An error has occurred.";
    }
    [v4 setObject:v17 forKeyedSubscript:@"Reason"];

    goto LABEL_14;
  }

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Result"];
LABEL_14:
  uint64_t v18 = [MSDRapportMessage alloc];
  id v19 = [v3 identifier];
  id v20 = [(MSDRapportMessage *)v18 initWithIdentifier:v19 andPayload:v4 usingOptions:0];

  return v20;
}

- (void)advertiserDidUpdateLocalDevicePublicIDFrom:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned int v7 = self;
  objc_sync_enter(v7);
  [(MSDDemoPeerResponder *)v7 setDevicePublicID:v6];
  id v8 = [(MSDDemoPeerResponder *)v7 pairingPassword];

  if (v8) {
    [(MSDDemoPeerResponder *)v7 _uploadPairingPassword];
  }
  objc_sync_exit(v7);
}

- (void)advertiserDidShowPairingPassword:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MSDDemoPeerResponder *)v4 setPairingPassword:v6];
  uint64_t v5 = [(MSDDemoPeerResponder *)v4 devicePublicID];

  if (v5) {
    [(MSDDemoPeerResponder *)v4 _uploadPairingPassword];
  }
  objc_sync_exit(v4);
}

- (void)advertiserDidHidePairingPassword
{
  id obj = self;
  objc_sync_enter(obj);
  [(MSDDemoPeerResponder *)obj setPairingPassword:0];
  objc_sync_exit(obj);
}

- (id)didReceiveRequestMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [(MSDDemoPeerResponder *)self messageHandlerTable];
  int v10 = [v9 objectForKey:v8];
  SEL v11 = NSSelectorFromString(v10);

  if (!v11)
  {
    id v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000DDB0C();
    }

    goto LABEL_12;
  }
  id v12 = (void (*)(MSDDemoPeerResponder *, SEL, id))[(MSDDemoPeerResponder *)self methodForSelector:v11];
  id v13 = sub_100068600();
  uint64_t v14 = v13;
  if (!v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000DDB74();
    }

LABEL_12:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerResponder: Received request message: %{public}@ from device: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v15 = v12(self, v11, v6);
LABEL_13:

  return v15;
}

- (void)didReceiveEventMessage:(id)a3 fromDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000DDBDC();
  }
}

- (MSDRapportDeviceAdvertiser)rpDeviceAdvertiser
{
  return self->_rpDeviceAdvertiser;
}

- (void)setRpDeviceAdvertiser:(id)a3
{
}

- (MSDRapportMessageHandler)rpMessageHandler
{
  return self->_rpMessageHandler;
}

- (void)setRpMessageHandler:(id)a3
{
}

- (NSDictionary)messageHandlerTable
{
  return self->_messageHandlerTable;
}

- (void)setMessageHandlerTable:(id)a3
{
}

- (NSMutableArray)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (NSString)devicePublicID
{
  return self->_devicePublicID;
}

- (void)setDevicePublicID:(id)a3
{
}

- (NSString)pairingPassword
{
  return self->_pairingPassword;
}

- (void)setPairingPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingPassword, 0);
  objc_storeStrong((id *)&self->_devicePublicID, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_messageHandlerTable, 0);
  objc_storeStrong((id *)&self->_rpMessageHandler, 0);

  objc_storeStrong((id *)&self->_rpDeviceAdvertiser, 0);
}

@end