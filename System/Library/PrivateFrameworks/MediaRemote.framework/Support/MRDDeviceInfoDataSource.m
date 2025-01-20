@interface MRDDeviceInfoDataSource
+ (id)_workerQueue;
- (CUPairingManager)pairingManager;
- (MRDAirPlayLeaderInfoPublisher)airPlayLeaderInfoPublisher;
- (MRDDeviceInfoDataSource)init;
- (MRDDeviceInfoDataSourceDelegate)delegate;
- (MRDeviceInfo)deviceInfo;
- (NSString)deviceName;
- (NSString)deviceUID;
- (id)_currentDeviceInfo;
- (id)_deviceInfoArchiveClasses;
- (id)_deviceInfoFilePath;
- (id)_readDeviceInfo;
- (id)_readLegacyDeviceInfoIdentifier;
- (id)allClusteredDevices;
- (id)clusteredDevices;
- (id)discoverySession;
- (id)networkIdentifier;
- (void)_deviceInfoDidChange;
- (void)_deviceInfoDidChangeWithDeviceInfo:(id)a3;
- (void)_otherDeviceInfoDidChange:(id)a3;
- (void)_writeDeviceInfo:(id)a3 toPath:(id)a4;
- (void)dealloc;
- (void)handleGroupSessionDidStartEligibilityMonitoringNotification:(id)a3;
- (void)handleGroupSessionServerDidStartNotification:(id)a3;
- (void)reloadDeviceInfoImmediately;
- (void)setAirPlayLeaderInfoPublisher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setPairingManager:(id)a3;
@end

@implementation MRDDeviceInfoDataSource

- (MRDDeviceInfoDataSource)init
{
  v44.receiver = self;
  v44.super_class = (Class)MRDDeviceInfoDataSource;
  v2 = [(MRDDeviceInfoDataSource *)&v44 init];
  if (v2)
  {
    v3 = (CUPairingManager *)objc_alloc_init((Class)MSVWeakLinkClass());
    pairingManager = v2->_pairingManager;
    v2->_pairingManager = v3;

    v5 = [(id)objc_opt_class() _workerQueue];
    [(CUPairingManager *)v2->_pairingManager setDispatchQueue:v5];

    uint64_t v6 = [(MRDDeviceInfoDataSource *)v2 _currentDeviceInfo];
    deviceInfo = v2->_deviceInfo;
    v2->_deviceInfo = (MRDeviceInfo *)v6;

    objc_initWeak(&location, v2);
    CFStringRef v45 = @"UserAssignedDeviceName";
    v25 = +[NSArray arrayWithObjects:&v45 count:1];
    id v8 = &_dispatch_main_q;
    v41[1] = _NSConcreteStackBlock;
    v41[2] = (id)3221225472;
    v41[3] = sub_1000B8AA4;
    v41[4] = &unk_10041AED8;
    objc_copyWeak(&v42, &location);
    v2->_gestaltNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    v9 = +[MCProfileConnection sharedConnection];
    [v9 addObserver:v2];

    v10 = +[NSNotificationCenter defaultCenter];
    v11 = +[MRAVOutputContext sharedAudioPresentationContext];
    [v10 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextOutputDevicesDidChangeNotification object:v11];
    [v10 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextOutputDeviceDidChangeNotification object:v11];
    [v10 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextDidAddOutputDeviceNotification object:0];
    [v10 addObserver:v2 selector:"_outputContextDidChange" name:MRAVOutputContextDidRemoveOutputDeviceNotification object:0];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000B8B28;
    handler[3] = &unk_10041AF00;
    objc_copyWeak(v41, &location);
    notify_register_dispatch("com.apple.airplay.prefsChanged", &v2->_airplayPerfsNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000B8B68;
    v38[3] = &unk_10041AF00;
    objc_copyWeak(&v39, &location);
    notify_register_dispatch("com.apple.airplay.advertisingDidChange", &v2->_airplayAdvertisingNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v38);

    if (+[MRAVClusterController canBeClusterMember])
    {
      v12 = +[MRAVClusterController sharedController];
      [v12 registerObserver:v2];

      [v10 addObserver:v2 selector:"_otherDeviceInfoDidChange:" name:_MRDeviceInfoDidChangeNotification object:0];
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000B8BA8;
    v36[3] = &unk_10041AF28;
    objc_copyWeak(&v37, &location);
    [(CUPairingManager *)v2->_pairingManager setIdentityCreatedHandler:v36];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000B8C38;
    v34[3] = &unk_10041AF50;
    objc_copyWeak(&v35, &location);
    [(CUPairingManager *)v2->_pairingManager setIdentityDeletedHandler:v34];
    if (MSVDeviceIsAudioAccessory())
    {
      v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:v2 selector:"handleGroupSessionServerDidStartNotification:" name:@"MRDGroupSessionServerDidStartNotification" object:0];

      v14 = +[NSNotificationCenter defaultCenter];
      [v14 addObserver:v2 selector:"handleGroupSessionDidStartEligibilityMonitoringNotification:" name:@"MRDGroupSessionServerDidStartEligibilityMonitoringNotification" object:0];

      v15 = +[NSNotificationCenter defaultCenter];
      [v15 addObserver:v2 selector:"handleGroupSessionServerDidStopNotification:" name:@"MRDGroupSessionServerDidStopNotification" object:0];
    }
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"handleSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000B8CBC;
    v31[3] = &unk_10041AF78;
    objc_copyWeak(&v33, &location);
    v18 = v2;
    v32 = v18;
    id v19 = [v17 addObserverForName:@"MRDRoutingServerAirplayActiveDidChange" object:0 queue:0 usingBlock:v31];

    v20 = +[NSNotificationCenter defaultCenter];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000B8D78;
    v28[3] = &unk_10041AF78;
    objc_copyWeak(&v30, &location);
    v21 = v18;
    v29 = v21;
    id v22 = [v20 addObserverForName:@"MRDNowPlayingAirplaySessionStarted" object:0 queue:0 usingBlock:v28];

    v23 = [(id)objc_opt_class() _workerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B8E34;
    block[3] = &unk_100415CC8;
    v27 = v21;
    dispatch_async(v23, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(v41);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  MGCancelNotifications();
  v3 = +[MCProfileConnection sharedConnection];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
  notify_cancel(self->_airplayPerfsNotifyToken);
  notify_cancel(self->_airplayAdvertisingNotifyToken);
  notify_cancel(self->_airplayLeaderInfoNotifyToken);

  v5.receiver = self;
  v5.super_class = (Class)MRDDeviceInfoDataSource;
  [(MRDDeviceInfoDataSource *)&v5 dealloc];
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)reloadDeviceInfoImmediately
{
  id v4 = [(MRDDeviceInfoDataSource *)self _currentDeviceInfo];
  v3 = self;
  objc_sync_enter(v3);
  [(MRDDeviceInfoDataSource *)v3 _deviceInfoDidChangeWithDeviceInfo:v4];
  objc_sync_exit(v3);
}

+ (id)_workerQueue
{
  if (qword_10047E0C8 != -1) {
    dispatch_once(&qword_10047E0C8, &stru_10041AF98);
  }
  v2 = (void *)qword_10047E0C0;

  return v2;
}

- (void)_deviceInfoDidChange
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_deviceInfoReloadScheduled)
  {
    v2->_deviceInfoReloadScheduled = 1;
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    id v4 = [(id)objc_opt_class() _workerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B9224;
    block[3] = &unk_100415CC8;
    void block[4] = v2;
    dispatch_after(v3, v4, block);
  }
  objc_sync_exit(v2);
}

- (void)_deviceInfoDidChangeWithDeviceInfo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (([v5 isEqual:v6->_deviceInfo] & 1) == 0)
  {
    objc_storeStrong((id *)&v6->_deviceInfo, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    if (objc_opt_respondsToSelector())
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B93A0;
      block[3] = &unk_1004159B8;
      id v9 = WeakRetained;
      v10 = v6;
      id v11 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  objc_sync_exit(v6);
}

- (void)_otherDeviceInfoDidChange:(id)a3
{
  id v14 = a3;
  id v4 = +[MRAVClusterController sharedController];
  id v5 = [v4 clusterLeaderUID];

  if (v5)
  {
    uint64_t v6 = +[MRAVClusterController sharedController];
    id v7 = [v6 clusterStatus];

    if (v7 == (id)2)
    {
      id v8 = [v14 userInfo];
      id v9 = [v8 objectForKeyedSubscript:kMRPairedDeviceUserInfoKey];

      v10 = [v9 deviceUID];
      unsigned int v11 = [v10 isEqualToString:v5];

      if (v11)
      {
        v12 = self;
        objc_sync_enter(v12);
        unsigned int v13 = [(MRDeviceInfo *)v12->_deviceInfo isProxyGroupPlayer];
        if (v13 != [v9 isProxyGroupPlayer]) {
          [(MRDDeviceInfoDataSource *)v12 _deviceInfoDidChange];
        }
        objc_sync_exit(v12);
      }
    }
  }
}

- (id)_currentDeviceInfo
{
  uint64_t v3 = +[NSDate date];
  id v4 = +[NSUUID UUID];
  uint64_t v5 = [v4 UUIDString];

  v93 = (void *)v5;
  uint64_t v6 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"CurrentDeviceInfo", v5];
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v104 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v8 = +[MRAVOutputContext sharedAudioPresentationContext];
  id v9 = objc_alloc_init((Class)MRDeviceInfo);
  v10 = [(MRDDeviceInfoDataSource *)self deviceName];
  [v9 setName:v10];

  unsigned int v11 = (void *)MSVCopyLocalizedModelName();
  [v9 setLocalizedModelName:v11];

  v94 = self;
  v12 = [(MRDDeviceInfoDataSource *)self networkIdentifier];
  [v9 setManagedConfigurationDeviceIdentifier:v12];

  unsigned int v13 = (void *)MSVCopySystemBuildVersion();
  [v9 setBuildVersion:v13];

  objc_msgSend(v9, "setProtocolVersion:", +[MRProtocolMessage currentProtocolVersion](MRProtocolMessage, "currentProtocolVersion"));
  id v14 = +[MCProfileConnection sharedConnection];
  unsigned int v15 = [v14 effectiveBoolValueForSetting:MCFeatureRemoteAppPairingAllowed];

  [v9 setPairingAllowed:v15 != 2];
  v16 = (void *)MGCopyAnswer();
  [v9 setModelID:v16];

  v17 = (void *)MGCopyAnswer();
  [v9 setComputerName:v17];

  objc_msgSend(v9, "setDeviceClass:", +[MRDeviceInfo deviceClass](MRDeviceInfo, "deviceClass"));
  v18 = (void *)MRMediaRemoteCopyLocalAirPlayReceiverTightSyncIdentity();
  [v9 setTightSyncUID:v18];

  id v19 = +[MRAVClusterController sharedController];
  unsigned int v20 = [v19 needsCommandRedirection];

  v92 = (void *)v3;
  if (!v20)
  {
    id v22 = +[MRDMediaRemoteServer server];
    v28 = [v22 routingServer];
    objc_msgSend(v9, "setProxyGroupPlayer:", objc_msgSend(v28, "isSilentPrimary"));
    goto LABEL_7;
  }
  v21 = +[MRAVClusterController sharedController];
  id v22 = [v21 clusterLeaderUID];

  if (v22)
  {
    v23 = +[MRDMediaRemoteServer server];
    v24 = [v23 nowPlayingServer];
    v25 = [v24 originClients];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_1000BA134;
    v101[3] = &unk_100417338;
    id v22 = v22;
    id v102 = v22;
    v26 = objc_msgSend(v25, "msv_firstWhere:", v101);

    v27 = [v26 deviceInfo];
    objc_msgSend(v9, "setProxyGroupPlayer:", objc_msgSend(v27, "isProxyGroupPlayer"));

    v28 = v102;
LABEL_7:
  }
  v29 = (void *)MRMediaRemoteCopyLocalAirPlaySenderDefaultGroupIdentity();
  [v9 setSenderDefaultGroupUID:v29];

  id v30 = (void *)MRMediaRemoteCopyLocalAirPlayGroupName();
  [v9 setGroupName:v30];

  [v9 setGroupLeader:MRMediaRemoteAirPlayReceiverGetIsGroupLeader()];
  v31 = +[MRDMediaRemoteServer server];
  v32 = [v31 routingServer];
  objc_msgSend(v9, "setAirPlayActive:", objc_msgSend(v32, "airplayActive"));

  id v33 = [(MRDDeviceInfoDataSource *)v94 deviceUID];
  [v9 setDeviceUID:v33];

  v34 = (void *)MRMediaRemoteCopyLocalClusterID();
  [v9 setClusterID:v34];

  id v35 = (void *)MRMediaRemoteCopyLocalClusterLeaderIdentity();
  [v9 setClusterLeaderID:v35];

  [v9 setClusterType:MRMediaRemoteCopyLocalAirPlayReceiverClusterType()];
  v36 = +[MRUserSettings currentSettings];
  objc_msgSend(v9, "setClusterAware:", objc_msgSend(v36, "useClusterDevices"));

  [v9 setConfiguredClusterSize:(int)MRMediaRemoteGetLocalClusterSize()];
  [v9 setClusterLeader:MRMediaRemoteIsClusterLeader()];
  id v37 = [v8 contextID];
  [v9 setRoutingContextID:v37];

  v91 = v8;
  v38 = [v8 outputDevices];
  id v39 = objc_alloc_init((Class)NSMutableArray);
  id v40 = objc_alloc_init((Class)NSMutableSet);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v41 = v38;
  id v42 = [v41 countByEnumeratingWithState:&v97 objects:v112 count:16];
  if (!v42) {
    goto LABEL_28;
  }
  id v43 = v42;
  uint64_t v44 = *(void *)v98;
  do
  {
    for (i = 0; i != v43; i = (char *)i + 1)
    {
      if (*(void *)v98 != v44) {
        objc_enumerationMutation(v41);
      }
      v46 = *(__CFString **)(*((void *)&v97 + 1) + 8 * i);
      if ([(__CFString *)v46 isLocalDevice])
      {
        uint64_t v47 = [v9 tightSyncUID];
        v48 = v47;
        if (v47) {
          CFStringRef v49 = (const __CFString *)v47;
        }
        else {
          CFStringRef v49 = @"LOCAL";
        }
        [v40 addObject:v49];
        goto LABEL_26;
      }
      v50 = [(__CFString *)v46 logicalDeviceID];

      if (v50)
      {
        uint64_t v51 = [(__CFString *)v46 logicalDeviceID];
        goto LABEL_22;
      }
      v52 = [(__CFString *)v46 uid];

      if (v52)
      {
        uint64_t v51 = [(__CFString *)v46 uid];
LABEL_22:
        v48 = v51;
        if (v51)
        {
          id v53 = [objc_alloc((Class)MRDeviceInfo) initWithOutputDevice:v46];
          [v39 addObject:v53];
          [v40 addObject:v48];

          goto LABEL_26;
        }
      }
      v48 = _MRLogForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v104 = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "unable to get an output device identifier, device will not be added to protobuf's grouped devices: %{public}@", buf, 0xCu);
      }
LABEL_26:
    }
    id v43 = [v41 countByEnumeratingWithState:&v97 objects:v112 count:16];
  }
  while (v43);
LABEL_28:

  objc_msgSend(v9, "setGroupLogicalDeviceCount:", objc_msgSend(v40, "count"));
  [v9 setGroupedDevices:v39];
  v54 = [(MRDDeviceInfoDataSource *)v94 clusteredDevices];
  [v9 setClusteredDevices:v54];

  v55 = [(MRDDeviceInfoDataSource *)v94 allClusteredDevices];
  [v9 setAllClusteredDevices:v55];

  if (MSVDeviceIsAppleTV()) {
    [v9 setSupportsExtendedMotion:1];
  }
  v56 = +[MRUserSettings currentSettings];
  objc_msgSend(v9, "setSupportsSystemPairing:", objc_msgSend(v56, "useExternalDeviceSystemPairing"));

  v57 = +[NSBundle mainBundle];
  v58 = [v57 bundleIdentifier];
  [v9 setBundleIdentifier:v58];

  v96 = v57;
  v59 = [v57 infoDictionary];
  v60 = [v59 objectForKeyedSubscript:kCFBundleVersionKey];
  [v9 setBundleVersion:v60];

  v61 = [(MRDDeviceInfoDataSource *)v94 _readDeviceInfo];
  v62 = [v61 objectForKeyedSubscript:@"identifier"];
  [v9 setIdentifier:v62];

  v63 = (void *)MRMediaRemoteAirPlayReceiverCopyGroupIdentity();
  if (!v63)
  {
    v64 = objc_msgSend(v41, "msv_firstWhere:", &stru_10041AFB8);
    v63 = [v64 groupID];

    if (!v63)
    {
      v63 = [v61 objectForKeyedSubscript:@"defaultGroupUID"];
    }
  }
  [v9 setGroupUID:v63];
  v65 = (void *)MRMediaRemoteAirPlayReceiverCopyAirPlayGroupIdentity();
  if (!v65)
  {
    v66 = objc_msgSend(v41, "msv_firstWhere:", &stru_10041AFD8);
    v65 = [v66 airPlayGroupID];

    if (!v65)
    {
      v65 = [v61 objectForKeyedSubscript:@"defaultGroupUID"];
    }
  }
  v95 = v61;
  [v9 setAirPlayGroupUID:v65];
  v67 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  [v9 setSystemMediaApplication:v67];

  v68 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  [v9 setSystemPodcastApplication:v68];

  v69 = (void *)MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
  [v9 setSystemBooksApplication:v69];

  uint64_t v70 = MRMediaRemoteCopyLocalDeviceAirPlayReceiverDisplayID();
  v71 = (void *)v70;
  if (v70)
  {
    uint64_t v111 = v70;
    v72 = +[NSArray arrayWithObjects:&v111 count:1];
    [v9 setAirPlayReceivers:v72];
  }
  v90 = v71;
  [v9 setSupportsSharedQueue:1];
  [v9 setSharedQueueVersion:3];
  [v9 setSupportsACL:1];
  v73 = +[MRUserSettings currentSettings];
  objc_msgSend(v9, "setSupportsMultiplayer:", objc_msgSend(v73, "supportMultiplayerHost"));

  [v9 setGroupContainsDiscoverableGroupLeader:MRMediaRemoteGetLocalGroupContainsDiscoverableGroupLeader()];
  [v9 setParentGroupContainsDiscoverableGroupLeader:MRMediaRemoteGetParentGroupContainsDiscoverableGroupLeader()];
  v74 = +[MRUserSettings currentSettings];
  if ([v74 supportGenericAudioGroup]) {
    uint64_t v75 = 3;
  }
  else {
    uint64_t v75 = 2;
  }
  [v9 setLastSupportedClusterType:v75];

  v76 = +[MRUserSettings currentSettings];
  objc_msgSend(v9, "setSupportsOutputContextSync:", objc_msgSend(v76, "supportOutputContextSync"));

  [v9 setLastSupportedProtocolMessageType:137];
  v77 = +[MRDMediaRemoteServer server];
  v78 = [v77 routingServer];
  v79 = [v78 systemEndpointController];
  v80 = [v79 activeOutputDeviceUID:0];
  [v9 setActiveSystemEndpointUID:v80];

  v81 = [v9 name];

  v82 = _MRLogForCategory();
  BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
  if (v81)
  {
    v84 = v92;
    if (v83)
    {
      v85 = [v9 name];
      v86 = +[NSDate date];
      [v86 timeIntervalSinceDate:v92];
      *(_DWORD *)buf = 138544130;
      CFStringRef v104 = @"CurrentDeviceInfo";
      __int16 v105 = 2114;
      v106 = v93;
      __int16 v107 = 2112;
      v108 = v85;
      __int16 v109 = 2048;
      uint64_t v110 = v87;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);

      goto LABEL_46;
    }
  }
  else
  {
    v84 = v92;
    if (v83)
    {
      v85 = +[NSDate date];
      [v85 timeIntervalSinceDate:v92];
      *(_DWORD *)buf = 138543874;
      CFStringRef v104 = @"CurrentDeviceInfo";
      __int16 v105 = 2114;
      v106 = v93;
      __int16 v107 = 2048;
      v108 = v88;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
LABEL_46:
    }
  }

  return v9;
}

- (id)discoverySession
{
  if (qword_10047E0D8 != -1) {
    dispatch_once(&qword_10047E0D8, &stru_10041AFF8);
  }
  v2 = (void *)qword_10047E0D0;

  return v2;
}

- (id)clusteredDevices
{
  v2 = [(MRDDeviceInfoDataSource *)self discoverySession];
  [v2 availableOutputDevices];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v7 isLocalDevice])
        {
          id v4 = objc_alloc_init((Class)NSMutableArray);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v8 = objc_msgSend(v7, "clusterCompositionMembers", 0);
          id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v16;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v16 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = [objc_alloc((Class)MRDeviceInfo) initWithOutputDevice:*(void *)(*((void *)&v15 + 1) + 8 * (void)j)];
                [v4 addObject:v13];
              }
              id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v10);
          }

          goto LABEL_18;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v4;
}

- (id)allClusteredDevices
{
  v2 = [(MRDDeviceInfoDataSource *)self discoverySession];
  [v2 availableOutputDevices];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v7 isLocalDevice])
        {
          id v4 = objc_alloc_init((Class)NSMutableArray);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v8 = objc_msgSend(v7, "allClusterMembersOutputDevices", 0);
          id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v16;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v16 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = [objc_alloc((Class)MRDeviceInfo) initWithOutputDevice:*(void *)(*((void *)&v15 + 1) + 8 * (void)j)];
                [v4 addObject:v13];
              }
              id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v10);
          }

          goto LABEL_18;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v4;
}

- (id)networkIdentifier
{
  if (MSVDeviceIsAppleTV()) {
    v2 = (void *)MGCopyAnswer();
  }
  else {
    v2 = 0;
  }
  if (![v2 length])
  {
    id v3 = (void *)MGCopyAnswer();
    if (v3) {
      id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    }
    else {
      id v4 = 0;
    }

    v2 = v4;
  }
  if (![v2 length])
  {
    uint64_t v5 = MGCopyAnswer();

    v2 = (void *)v5;
  }
  if (![v2 length])
  {
    uint64_t v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unknown device network ID", v8, 2u);
    }
  }

  return v2;
}

- (NSString)deviceUID
{
  deviceUID = self->_deviceUID;
  if (!deviceUID)
  {
    id v4 = (NSString *)MRMediaRemoteAirPlayReceiverCopyPairingIdentity();
    uint64_t v5 = self->_deviceUID;
    self->_deviceUID = v4;

    deviceUID = self->_deviceUID;
  }

  return deviceUID;
}

- (NSString)deviceName
{
  deviceName = self->_deviceName;
  if (!deviceName)
  {
    MRCopyDeviceName();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_deviceName;
    self->_deviceName = v4;

    deviceName = self->_deviceName;
  }

  return deviceName;
}

- (id)_deviceInfoFilePath
{
  v2 = (void *)MRCopyMediaRemoteLibraryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"DeviceInfo.plist"];

  return v3;
}

- (id)_deviceInfoArchiveClasses
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)_readLegacyDeviceInfoIdentifier
{
  v2 = (void *)MRCopyDeviceInfoPath();
  id v3 = +[NSData dataWithContentsOfFile:v2];
  if (v3)
  {
    uint64_t v6 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_writeDeviceInfo:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  id v12 = 0;
  uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  if (v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive device info", buf, 2u);
    }
  }
  uint64_t v10 = 0;
  [v6 writeToFile:v5 options:268435457 error:&v10];
  if (v10)
  {
    id v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to write device info file", buf, 2u);
    }
  }
}

- (id)_readDeviceInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BABCC;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  if (qword_10047E0E8 != -1) {
    dispatch_once(&qword_10047E0E8, block);
  }
  return (id)qword_10047E0E0;
}

- (void)handleGroupSessionServerDidStartNotification:(id)a3
{
  id v4 = +[MRDMediaRemoteServer server];
  id v6 = [v4 groupSessionServer];

  id v5 = [v6 sessionManager];
  [v5 addObserver:self];
  [(MRDDeviceInfoDataSource *)self _deviceInfoDidChange];
}

- (void)handleGroupSessionDidStartEligibilityMonitoringNotification:(id)a3
{
  id v4 = +[MRDMediaRemoteServer server];
  id v6 = [v4 groupSessionServer];

  id v5 = [v6 eligibilityMonitor];
  [v5 addObserver:self];

  [(MRDDeviceInfoDataSource *)self _deviceInfoDidChange];
}

- (MRDDeviceInfoDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDDeviceInfoDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRDAirPlayLeaderInfoPublisher)airPlayLeaderInfoPublisher
{
  return self->_airPlayLeaderInfoPublisher;
}

- (void)setAirPlayLeaderInfoPublisher:(id)a3
{
}

- (CUPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void)setDeviceUID:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_airPlayLeaderInfoPublisher, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end