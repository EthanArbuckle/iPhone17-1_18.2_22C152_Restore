@interface MSDMailProcessor
+ (id)sharedInstance;
- (BOOL)ack:(BOOL)a3;
- (BOOL)demodReady;
- (BOOL)fullKeysSent;
- (BOOL)isAllowedRequest:(id)a3 relayNeeded:(BOOL)a4;
- (BOOL)processRequest:(id)a3;
- (BOOL)updateManifestInfo:(id)a3 error:(id *)a4;
- (BOOL)waitingForCommand;
- (MSDMailProcessor)init;
- (MSDTargetDevice)device;
- (NSTimer)pingTimer;
- (id)fullKeyList;
- (id)pingWithType:(unint64_t)a3;
- (id)reducedKeyList;
- (int64_t)pingIntervalToUse;
- (unint64_t)convertPingType:(unint64_t)a3;
- (unint64_t)pingInterval;
- (unint64_t)queuedPingType;
- (void)handlePingTimerTicking:(id)a3;
- (void)pingAndProcess:(unint64_t)a3 waitForCompletion:(BOOL)a4;
- (void)reportBundleInstallCompleted;
- (void)reportCachingHubFailed;
- (void)reportS3ServerFailed;
- (void)scheduleF200EventPing;
- (void)sendImmediateDeviceInfoPing;
- (void)sendPushNotificationPing;
- (void)setDemodReady:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setFullKeysSent:(BOOL)a3;
- (void)setPingInterval:(unint64_t)a3;
- (void)setPingTimer:(id)a3;
- (void)setQueuedPingType:(unint64_t)a3;
- (void)setWaitingForCommand:(BOOL)a3;
- (void)start;
- (void)startPeriodicPing;
@end

@implementation MSDMailProcessor

+ (id)sharedInstance
{
  if (qword_100189AE0 != -1) {
    dispatch_once(&qword_100189AE0, &stru_100153140);
  }
  v2 = (void *)qword_100189AD8;

  return v2;
}

- (MSDMailProcessor)init
{
  v3 = sub_100068730();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MSDMailProcessor init", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)MSDMailProcessor;
  v4 = [(MSDMailProcessor *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(MSDMailProcessor *)v4 setDemodReady:0];
    v6 = +[MSDTargetDevice sharedInstance];
    [(MSDMailProcessor *)v5 setDevice:v6];

    v7 = v5;
  }

  return v5;
}

- (void)start
{
  v3 = sub_100068730();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MSDMailProcessor start", v10, 2u);
  }

  v4 = [(MSDMailProcessor *)self device];
  uint64_t v5 = [v4 hubHostName];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(MSDMailProcessor *)self device];
    v8 = [v7 hubPort];

    if (v8)
    {
      objc_super v9 = +[MSDPushNotificationHandler sharedInstance];
      [v9 enablePushNotifications];

      [(MSDMailProcessor *)self setPingInterval:30];
      [(MSDMailProcessor *)self pingAndProcess:1 waitForCompletion:0];
      [(MSDMailProcessor *)self startPeriodicPing];
    }
  }
  else
  {
  }
}

- (void)scheduleF200EventPing
{
}

- (void)reportCachingHubFailed
{
}

- (void)reportS3ServerFailed
{
}

- (void)reportBundleInstallCompleted
{
}

- (void)sendPushNotificationPing
{
}

- (void)sendImmediateDeviceInfoPing
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[MSDMailProcessor sendImmediateDeviceInfoPing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - Sending immediate device info ping.", (uint8_t *)&v4, 0xCu);
  }

  [(MSDMailProcessor *)self pingAndProcess:8 waitForCompletion:0];
}

- (void)startPeriodicPing
{
  v3 = sub_100068730();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(MSDMailProcessor *)self device];
    uint64_t v5 = [v4 hubHostName];
    v6 = [(MSDMailProcessor *)self device];
    v7 = [v6 hubPort];
    *(_DWORD *)buf = 136315650;
    v11 = "-[MSDMailProcessor startPeriodicPing]";
    __int16 v12 = 2114;
    v13 = v5;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: serverAddress is %{public}@, serverPort is %{public}@.", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006968C;
  block[3] = &unk_100151AC8;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)handlePingTimerTicking:(id)a3
{
}

- (unint64_t)pingInterval
{
  return self->_pingInterval;
}

- (void)setPingInterval:(unint64_t)a3
{
  unint64_t pingInterval = self->_pingInterval;
  self->_unint64_t pingInterval = a3;
  uint64_t v5 = sub_100068730();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = self->_pingInterval;
    int v7 = 134217984;
    unint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ping interval changed to %tu", (uint8_t *)&v7, 0xCu);
  }

  if (pingInterval) {
    [(MSDMailProcessor *)self startPeriodicPing];
  }
}

- (BOOL)waitingForCommand
{
  return self->_waitingForCommand;
}

- (void)setWaitingForCommand:(BOOL)a3
{
  if (self->_waitingForCommand != a3)
  {
    BOOL v3 = a3;
    self->_waitingForCommand = a3;
    unint64_t v5 = [(MSDMailProcessor *)self pingIntervalToUse];
    unint64_t v6 = [(MSDMailProcessor *)self pingInterval];
    if (v3)
    {
      if (v6 <= v5) {
        return;
      }
    }
    else if (v6 == v5)
    {
      return;
    }
    [(MSDMailProcessor *)self setPingInterval:v5];
  }
}

- (void)pingAndProcess:(unint64_t)a3 waitForCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v5 = a3;
  if (([(MSDMailProcessor *)self queuedPingType] & a3) == 0)
  {
    if ((v5 & 8) != 0) {
      unint64_t v5 = 1;
    }
    [(MSDMailProcessor *)self setQueuedPingType:[(MSDMailProcessor *)self queuedPingType] | v5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000699E8;
    v11[3] = &unk_100153168;
    v11[4] = self;
    v11[5] = v5;
    int v7 = objc_retainBlock(v11);
    unint64_t v8 = +[MSDWorkQueueSet sharedInstance];
    id v9 = [v8 pollingQueue];
    v10 = v9;
    if (v4) {
      dispatch_sync(v9, v7);
    }
    else {
      dispatch_async(v9, v7);
    }
  }
}

- (id)pingWithType:(unint64_t)a3
{
  unint64_t v5 = sub_100068730();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000D1D18();
  }

  if (a3 - 1 <= 1)
  {
    if ([(MSDMailProcessor *)self fullKeysSent]) {
      [(MSDMailProcessor *)self reducedKeyList];
    }
    else {
    uint64_t v10 = [(MSDMailProcessor *)self fullKeyList];
    }
    v11 = [(MSDMailProcessor *)self device];
    v70 = (void *)v10;
    int v7 = [v11 deviceInformationForPing:v10];

    if (!v7)
    {
      v52 = sub_100068730();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_1000D18CC(self, v52);
      }

      v16 = 0;
      v13 = 0;
      v28 = 0;
      v26 = 0;
      int v7 = 0;
      goto LABEL_51;
    }
    __int16 v12 = [v7 objectForKey:@"InternalStatus"];
    v13 = v12;
    if (v12
      && [v12 intValue] != 199
      && ![(MSDMailProcessor *)self demodReady])
    {
      [(MSDMailProcessor *)self setDemodReady:1];
      [(MSDMailProcessor *)self setPingInterval:[(MSDMailProcessor *)self pingIntervalToUse]];
    }
    __int16 v14 = [(MSDMailProcessor *)self device];
    v15 = [v14 hubSuppliedSettings];
    v16 = [v15 objectForKey:@"PingFrequency"];

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v16 unsignedIntegerValue]) {
      id v17 = [v16 integerValue];
    }
    else {
      id v17 = [(MSDMailProcessor *)self pingInterval];
    }
    v18 = +[NSNumber numberWithInteger:v17];
    [v7 setObject:v18 forKey:@"MSDPingFrequency"];

    v19 = +[NSNumber numberWithUnsignedInteger:[(MSDMailProcessor *)self convertPingType:a3]];
    [v7 setObject:v19 forKey:@"MSDDemoPingType"];
    goto LABEL_25;
  }
  if (a3 == 32)
  {
    v20 = [(MSDMailProcessor *)self device];
    int v7 = [v20 getS3ServerFailureEventForPing];

    if (v7)
    {
      unint64_t v8 = self;
      uint64_t v9 = 32;
      goto LABEL_24;
    }
    v55 = sub_100068730();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_1000D1CA0(v55, v63, v64, v65, v66, v67, v68, v69);
    }
LABEL_74:

    v16 = 0;
    v13 = 0;
    v28 = 0;
    v26 = 0;
    int v7 = 0;
    v70 = 0;
    goto LABEL_51;
  }
  if (a3 == 16)
  {
    unint64_t v6 = [(MSDMailProcessor *)self device];
    int v7 = [v6 getCachingHubFailureEventForPing];

    if (v7)
    {
      unint64_t v8 = self;
      uint64_t v9 = 16;
LABEL_24:
      v19 = +[NSNumber numberWithUnsignedInteger:[(MSDMailProcessor *)v8 convertPingType:v9]];
      [v7 setObject:v19 forKey:@"MSDDemoPingType"];
      v16 = 0;
      v13 = 0;
      v70 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v55 = sub_100068730();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_1000D1C28(v55, v56, v57, v58, v59, v60, v61, v62);
    }
    goto LABEL_74;
  }
  v16 = 0;
  v13 = 0;
  int v7 = 0;
  v70 = 0;
LABEL_26:
  if (os_variant_has_internal_content())
  {
    v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000D1BC0();
    }
  }
  else
  {
    v22 = [v7 objectForKey:@"MSDExistingAccounts"];
    v21 = [v22 objectForKey:@"iCloudRecoveryKey"];

    v23 = [v7 objectForKeyedSubscript:@"MSDExistingAccounts"];
    [v23 setObject:@"<redacted>" forKeyedSubscript:@"iCloudRecoveryKey"];

    v24 = sub_100068600();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000D1BC0();
    }

    v25 = [v7 objectForKeyedSubscript:@"MSDExistingAccounts"];
    [v25 setObject:v21 forKeyedSubscript:@"iCloudRecoveryKey"];
  }
  v26 = objc_alloc_init(MSDPingRequest);
  [(MSDPingRequest *)v26 setRequestInfo:v7];
  v27 = +[MSDServerRequestHandler sharedInstance];
  v28 = [v27 handleRequestSync:v26];

  v29 = [v28 error];

  if (v29)
  {
    v43 = sub_100068600();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1000D1B2C(v28, v43);
    }
    goto LABEL_50;
  }
  v30 = [v28 data];
  v31 = [v28 statusCode];
  unsigned int v32 = [v31 intValue];

  if (!v30)
  {
    v43 = sub_100068730();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1000D1964(v43, v44, v45, v46, v47, v48, v49, v50);
    }
LABEL_50:

LABEL_51:
    id v41 = 0;
    id v40 = 0;
    v30 = 0;
    goto LABEL_54;
  }
  if (a3 == 1 && (v32 & 0xFFFFFFFB) == 0xC8)
  {
    [(MSDMailProcessor *)self setFullKeysSent:1];
    if ([v13 intValue] == 20 || objc_msgSend(v13, "intValue") == 100)
    {
      v33 = [v7 objectForKey:@"MSDExistingAccounts" v70];
      v34 = [v33 objectForKey:@"iCloudCDPState"];

      id v35 = [v34 integerValue];
      if (v35 == [&off_1001621B0 integerValue])
      {
        v36 = [(MSDMailProcessor *)self device];
        v37 = [v36 iCloudAccountRecoveryKey];

        if (v37)
        {
          v38 = sub_100068600();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "iCloud account recovery key successfully uploaded. Removing local copy...", buf, 2u);
          }

          v39 = [(MSDMailProcessor *)self device];
          [v39 saveiCloudAccountRecoveryKey:0];
        }
      }
    }
  }
  if (!objc_msgSend(v30, "length", v70))
  {
    id v41 = 0;
LABEL_53:
    id v40 = 0;
    goto LABEL_54;
  }
  id v71 = 0;
  id v40 = +[NSJSONSerialization JSONObjectWithData:v30 options:0 error:&v71];
  id v41 = v71;
  if (!v40)
  {
    v53 = sub_100068730();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_1000D19DC(v41, (uint64_t)v30, v53);
    }

    goto LABEL_53;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v40;
    v42 = v40;
    goto LABEL_55;
  }
  v54 = sub_100068730();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    sub_1000D1AB4();
  }

LABEL_54:
  v42 = 0;
LABEL_55:

  return v42;
}

- (BOOL)ack:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_alloc_init(MSDAckRequest);
  [(MSDAckRequest *)v4 setStatus:v3];
  unint64_t v5 = +[MSDServerRequestHandler sharedInstance];
  unint64_t v6 = [v5 handleRequestSync:v4];

  int v7 = [v6 error];
  LOBYTE(v5) = v7 == 0;

  return (char)v5;
}

- (id)fullKeyList
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"UniqueDeviceID", @"MSDTotalStorageAvailable", @"MSDPricingRequestUpdate", @"BatteryCurrentCapacity", @"BatteryIsCharging", @"ExternalPowerSourceConnected", @"MSDDemoContentStatus", @"MSDDemoManualUpdateState", @"MSDNetworkInterfacesEnabled", @"MSDCurrentWiFiSSID", @"MSDPersistentWiFiSSID", @"MSDCellularConfiguration", @"MSDHubSuppliedSettingsID", @"MSDApnsKey", @"MinOSVersionAvailable", @"ProductVersion", @"BuildVersion",
           @"MSDDemoProductDescription",
           @"MSDDemoLastRebootTime",
           @"MSDDemoLastRevertTime",
           @"MSDLastShallowRefreshTime",
           @"MSDDemoSystemLanguage",
           @"MSDDemoSystemRegion",
           @"MSDDemoPreferencesLanguage",
           @"MSDDemoPreferencesRegion",
           @"IdleDuration",
           @"PairedDeviceInfo",
           0);
}

- (id)reducedKeyList
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"UniqueDeviceID", @"MSDPricingRequestUpdate", @"BatteryCurrentCapacity", @"BatteryIsCharging", @"ExternalPowerSourceConnected", @"MSDDemoContentStatus", @"MSDTotalStorageAvailable", @"MSDDemoManualUpdateState", @"MSDNetworkInterfacesEnabled", @"MSDCurrentWiFiSSID", @"MSDPersistentWiFiSSID", @"MSDCellularConfiguration", @"MSDHubSuppliedSettingsID", @"MSDApnsKey", @"MinOSVersionAvailable", @"MSDLastShallowRefreshTime", @"MSDDemoSystemLanguage",
           @"MSDDemoSystemRegion",
           @"MSDDemoPreferencesLanguage",
           @"MSDDemoPreferencesRegion",
           @"IdleDuration",
           @"PairedDeviceInfo",
           0);
}

- (BOOL)processRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[MSDPairedWatchProxy sharedInstance];
  if ([v4 count])
  {
    unint64_t v6 = [v4 objectForKey:@"Command"];
    int v7 = [v4 objectForKey:@"IgnorePairedDevice"];
    unsigned int v8 = [v7 BOOLValue];

    uint64_t v9 = [(MSDMailProcessor *)self device];
    if ([v9 isBetterTogetherDemo]) {
      uint64_t v10 = [v5 paired] & (v8 ^ 1);
    }
    else {
      uint64_t v10 = 0;
    }

    BOOL v15 = [(MSDMailProcessor *)self isAllowedRequest:v4 relayNeeded:v10];
    [(MSDMailProcessor *)self ack:v15];
    if (!v15)
    {
      v101 = sub_100068730();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        sub_1000D1EE8();
      }
      id v40 = 0;
      id v11 = 0;
      __int16 v12 = 0;
      v13 = 0;
      goto LABEL_132;
    }
    v16 = [v4 objectForKey:@"Duration"];
    v13 = v16;
    int v108 = v10;
    if (v16 && (uint64_t)[v16 integerValue] >= 1)
    {
      id v17 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)[v13 integerValue]);
      [v17 timeIntervalSinceReferenceDate];
      unsigned int v110 = (int)v18;
    }
    else
    {
      unsigned int v110 = 0;
    }
    __int16 v12 = [v4 objectForKey:@"ContentType"];
    if ([v12 containsObject:@"Demo"])
    {
      [v4 objectForKey:@"ManifestInfo"];
      uint64_t v112 = v118 = 0;
      unsigned __int8 v19 = -[MSDMailProcessor updateManifestInfo:error:](self, "updateManifestInfo:error:");
      id v11 = 0;
      if ((v19 & 1) == 0)
      {
        v101 = sub_100068600();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
          sub_1000D1E50(v11, v101);
        }
        goto LABEL_128;
      }
      unsigned int v20 = 1;
    }
    else
    {
      uint64_t v112 = 0;
      id v11 = 0;
      unsigned int v20 = 0;
    }
    if ([v12 containsObject:@"Pricing"]) {
      v20 |= 2u;
    }
    v113 = v12;
    if ([v12 containsObject:@"Account"]) {
      v20 |= 4u;
    }
    if ([v6 isEqualToString:@"RevertSnapshot"]) {
      uint64_t v21 = v20 | 8;
    }
    else {
      uint64_t v21 = v20;
    }
    v22 = [v4 objectForKey:@"BackgroundDownloadOnly"];
    unsigned int v23 = [v22 BOOLValue];

    if ([v6 isEqualToString:@"UpdateContent"] && !v23
      || [v6 isEqualToString:@"UpdateOS"])
    {
      v24 = v13;
      v25 = v5;
      +[MSDDemoUpdateTimeKeeper sharedInstance];
      v27 = v26 = v11;
      uint64_t v28 = [v27 setCompletionTime:v110 reserveTimeForCleanup:1];

      if (v28)
      {
        id v11 = (id)v28;
        id v40 = (void *)v112;
        __int16 v12 = v113;
        unint64_t v5 = v25;
        v13 = v24;
        goto LABEL_133;
      }
      id v11 = 0;
      unint64_t v5 = v25;
      v13 = v24;
    }
    if (([v6 isEqualToString:@"ChangePingFrequency"] & 1) == 0
      && ([v6 isEqualToString:@"ChangeSettings"] & 1) == 0
      && ([v6 isEqualToString:@"HoldPowerAssertion"] & 1) == 0
      && ([v6 isEqualToString:@"LiftPowerAssertion"] & 1) == 0)
    {
      id v106 = v11;
      if ((([v6 isEqualToString:@"UpdateContent"] ^ 1 | v23) & 1) == 0)
      {
        v29 = [v4 objectForKey:@"OnlyInstallCriticalComponents"];

        if (v29)
        {
          v30 = [v4 objectForKey:@"OnlyInstallCriticalComponents"];
          id v31 = [v30 BOOLValue];
          unsigned int v32 = [(MSDMailProcessor *)self device];
          [v32 setCriticalUpdatePrioritized:v31];
        }
      }
      v33 = [(MSDMailProcessor *)self device];
      unsigned __int8 v34 = [v33 saveOperationRequest:v6 requestFlag:v21 completeBy:v110];

      id v11 = v106;
      if ((v34 & 1) == 0)
      {
        v101 = sub_100068730();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
          sub_1000D1E1C();
        }
        id v40 = (void *)v112;
        __int16 v12 = v113;
        id v11 = v106;
        goto LABEL_132;
      }
    }
    if ([v6 isEqualToString:@"UpdateContent"])
    {
      if ((v21 & 4) == 0)
      {
        v105 = v13;
        id v107 = v11;
        id v35 = v5;
        v36 = +[NSFileManager defaultManager];
        v37 = [(MSDMailProcessor *)self device];
        v38 = [v37 manifestPath];
        [v36 removeItemAtPath:v38 error:0];

        if (v23)
        {
          v39 = +[MSDBackgroundDownload sharedInstance];
          [v39 kickOffBackgroundDownload];

          BOOL v14 = 1;
          unint64_t v5 = v35;
          v13 = v105;
LABEL_39:
          __int16 v12 = v113;
LABEL_40:
          id v40 = (void *)v112;
          id v11 = v107;
LABEL_54:

          goto LABEL_55;
        }
        v51 = +[MSDUIHelper sharedInstance];
        [v51 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

        v52 = [(MSDMailProcessor *)self device];
        [v52 setWaitingForCommand:0];

        [(MSDMailProcessor *)self setWaitingForCommand:0];
        unint64_t v5 = v35;
        __int16 v12 = v113;
        if ((v21 & 2) != 0)
        {
          v53 = [(MSDMailProcessor *)self device];
          unsigned int v54 = [v53 mode];

          if (v54 == 5)
          {
            v55 = [(MSDMailProcessor *)self device];
            [v55 switchModeImmediately:2];
          }
        }
        uint64_t v56 = +[MSDPlatform sharedInstance];
        v13 = v105;
        if (([v56 macOS] & 1) == 0)
        {
          uint64_t v57 = +[MSDPlatform sharedInstance];
          if (([v57 iOS] & 1) == 0)
          {

            id v11 = v107;
LABEL_73:
            if (v21)
            {
              uint64_t v63 = +[MSDWorkQueueSet sharedInstance];
              uint64_t v64 = [v63 demoUpdateQueue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10006B75C;
              block[3] = &unk_100153190;
              char v117 = v108;
              id v115 = v5;
              unsigned int v116 = v110;
              dispatch_async(v64, block);

              id v11 = v107;
            }
            goto LABEL_52;
          }
        }
        id v11 = v107;
        if (v21 == 2)
        {
          uint64_t v58 = +[MSDPricingUpdateController sharedInstance];
          BOOL v14 = 1;
          [v58 setSwitchModeAfterCompletion:1];

          uint64_t v45 = +[MSDProgressUpdater sharedInstance];
          [v45 updateStage:17];
          goto LABEL_43;
        }
        goto LABEL_73;
      }
      uint64_t v48 = sub_100068600();
      __int16 v12 = v113;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Account update.", buf, 2u);
      }

      uint64_t v49 = [(MSDMailProcessor *)self device];
      [v49 switchModeImmediately:2];
LABEL_51:

LABEL_52:
      BOOL v14 = 1;
      goto LABEL_53;
    }
    __int16 v12 = v113;
    if ([v6 isEqualToString:@"UpdateOS"])
    {
      id v41 = +[MSDUIHelper sharedInstance];
      BOOL v14 = 1;
      [v41 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

      v42 = [(MSDMailProcessor *)self device];
      [v42 saveOSUpdateRequest:v4];

      v43 = [(MSDMailProcessor *)self device];
      [v43 setWaitingForCommand:0];

      [(MSDMailProcessor *)self setWaitingForCommand:0];
      uint64_t v44 = [(MSDMailProcessor *)self device];
      [v44 switchModeImmediately:7];

      uint64_t v45 = +[MSDWorkQueueSet sharedInstance];
      [v45 demoUpdateQueue];
      v47 = id v46 = v11;
      dispatch_async(v47, &stru_1001531B0);

      id v11 = v46;
LABEL_43:

LABEL_53:
      id v40 = (void *)v112;
      goto LABEL_54;
    }
    if ([v6 isEqualToString:@"Restart"])
    {
      if (!v108 || [v5 reboot])
      {
        uint64_t v49 = [(MSDMailProcessor *)self device];
        [v49 reboot];
        goto LABEL_51;
      }
      id v40 = (void *)v112;
LABEL_133:
      BOOL v14 = 0;
      goto LABEL_54;
    }
    if ([v6 isEqualToString:@"TurnSnapshotON"])
    {
      id v59 = v11;
      uint64_t v60 = [(MSDMailProcessor *)self device];
      [v60 setWaitingForCommand:0];

      [(MSDMailProcessor *)self setWaitingForCommand:0];
      if (v108 && ![v5 lockSnapshot]) {
        goto LABEL_140;
      }
      uint64_t v61 = [(MSDMailProcessor *)self device];
      unsigned __int8 v62 = [v61 lockSnapshot];
LABEL_79:
      unsigned __int8 v65 = v62;

      if (v65)
      {
        BOOL v14 = 1;
LABEL_81:
        id v40 = (void *)v112;
        id v11 = v59;
        goto LABEL_54;
      }
LABEL_140:
      id v40 = (void *)v112;
      id v11 = v59;
      goto LABEL_133;
    }
    if ([v6 isEqualToString:@"TurnSnapshotOFF"])
    {
      id v59 = v11;
      if (v108 && ![v5 unlockSnapshot]) {
        goto LABEL_140;
      }
      uint64_t v61 = [(MSDMailProcessor *)self device];
      unsigned __int8 v62 = [v61 unlockSnapshot];
      goto LABEL_79;
    }
    if ([v6 isEqualToString:@"RevertSnapshot"])
    {
      id v59 = v11;
      if (v108 && ![v5 revertSnapshot]) {
        goto LABEL_140;
      }
      uint64_t v61 = [(MSDMailProcessor *)self device];
      unsigned __int8 v62 = [v61 revertSnapshot];
      goto LABEL_79;
    }
    if ([v6 isEqualToString:@"Virgin"])
    {
      id v107 = v11;
      uint64_t v66 = [v4 objectForKey:@"ObliterateDevice"];
      id v67 = [v66 BOOLValue];

      uint64_t v68 = [v4 objectForKey:@"PreserveESim"];
      id v69 = [v68 BOOLValue];

      v70 = sub_100068600();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v120[0]) = v67;
        WORD2(v120[0]) = 1024;
        *(_DWORD *)((char *)v120 + 6) = v69;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Unenrolling device with obliteration: %{BOOL}d and preserve eSim: %{BOOL}d", buf, 0xEu);
      }

      if (v108) {
        [v5 unenrollWithObliteration:v67 callUnregister:1];
      }
      id v71 = [(MSDMailProcessor *)self device];
      unsigned __int8 v72 = [v71 unenrollWithObliteration:v67 preserveESim:v69 callUnregister:0 preserveDDLFlag:0];

      if (v72)
      {
        BOOL v14 = 1;
        goto LABEL_40;
      }
      id v40 = (void *)v112;
      id v11 = v107;
      goto LABEL_133;
    }
    if ([v6 isEqualToString:@"ChangeSettings"])
    {
      id v107 = v11;
      v73 = [(MSDMailProcessor *)self device];
      v74 = [v73 hubSuppliedSettings];

      v75 = [v4 objectForKey:@"Settings"];
      v76 = [(MSDMailProcessor *)self device];
      [v76 saveHubSuppliedSettings:v75];

      v77 = [v74 objectForKey:@"StoreHours"];
      uint64_t v78 = [v75 objectForKey:@"StoreHours"];
      v104 = (void *)v78;
      if (v78)
      {
        v79 = (void *)v78;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v79 count]
          && ([v77 isEqualToArray:v79] & 1) == 0)
        {
          v80 = sub_100068600();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v120[0] = "-[MSDMailProcessor processRequest:]";
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%s - ChangeSettings has new 'StoreHours' set.", buf, 0xCu);
          }

          v81 = [(MSDMailProcessor *)self device];
          [v81 refreshStoreHoursManagerUsingSettings];

          v82 = [(MSDMailProcessor *)self device];
          unsigned int v83 = [v82 isContentFrozen];

          if (v83)
          {
            v84 = [(MSDMailProcessor *)self device];
            [v84 setupSnapshotRevertTimer];
          }
        }
      }
      v111 = v74;
      v85 = [v75 objectForKey:@"PingFrequency"];
      if (v85)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v85 unsignedIntegerValue])
          {
            id v86 = [v85 unsignedIntegerValue];
            if (v86 != (id)[(MSDMailProcessor *)self pingInterval])
            {
              v87 = sub_100068600();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v120[0] = "-[MSDMailProcessor processRequest:]";
                _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%s - ChangeSettings has new 'PingFrequency' set.", buf, 0xCu);
              }

              [(MSDMailProcessor *)self setPingInterval:[(MSDMailProcessor *)self pingIntervalToUse]];
            }
          }
        }
      }
      v103 = v85;
      v109 = v5;
      v88 = [v75 objectForKey:@"DeviceOptions"];
      if (!v88
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ([(MSDMailProcessor *)self device],
            v89 = objc_claimAutoreleasedReturnValue(),
            unsigned int v90 = [v89 updateDeviceOptions:v88 skipImutableKeys:1],
            v89,
            v90))
      {
        v91 = [v111 objectForKey:@"FeatureFlags"];
        v92 = [v75 objectForKey:@"FeatureFlags"];
        if (v92)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v91 isEqualToDictionary:v92] & 1) == 0)
          {
            v93 = sub_100068600();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v120[0] = "-[MSDMailProcessor processRequest:]";
              _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%s - ChangeSettings has new 'FeatureFlags' set.", buf, 0xCu);
            }

            v94 = [(MSDMailProcessor *)self device];
            [v94 processNewFeatureFlags:v92 oldFeatureFlags:v91];
          }
        }

        BOOL v14 = 1;
        unint64_t v5 = v109;
        goto LABEL_39;
      }

      id v11 = v107;
      id v40 = (void *)v112;
      __int16 v12 = v113;
      v101 = v111;
      goto LABEL_132;
    }
    if ([v6 isEqualToString:@"StopBackgroundDownload"])
    {
      uint64_t v49 = +[MSDBackgroundDownload sharedInstance];
      [v49 quitBackgroundDownload];
      goto LABEL_51;
    }
    if ([v6 isEqualToString:@"DemoDeviceLock"])
    {
      v95 = [(MSDMailProcessor *)self device];
      if ([v95 isDDLDevice])
      {
        [(MSDMailProcessor *)self device];
        v96 = id v59 = v11;
        unsigned int v97 = [v96 isContentFrozen];

        id v11 = v59;
        if (v97)
        {
          v98 = +[MSDPlatform sharedInstance];
          id v99 = [v98 watchOS];

          v100 = [(MSDMailProcessor *)self device];
          BOOL v14 = 1;
          LOBYTE(v99) = [v100 unenrollWithObliteration:v99 preserveESim:1 callUnregister:0 preserveDDLFlag:1];

          if (v99) {
            goto LABEL_81;
          }
          v101 = sub_100068600();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
            sub_1000D1D80();
          }
          id v40 = (void *)v112;
          __int16 v12 = v113;
          id v11 = v59;
LABEL_132:

          goto LABEL_133;
        }
      }
      else
      {
      }
      uint64_t v49 = sub_100068600();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1000D1DB4();
      }
      goto LABEL_51;
    }
    v102 = sub_100068730();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      sub_1000D1DE8();
    }

    v101 = [(MSDMailProcessor *)self device];
    [v101 deleteOperationRequest];
LABEL_128:
    id v40 = (void *)v112;
    goto LABEL_132;
  }
  id v11 = 0;
  __int16 v12 = 0;
  v13 = 0;
  BOOL v14 = 1;
LABEL_55:

  return v14;
}

- (BOOL)isAllowedRequest:(id)a3 relayNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [v6 objectForKey:@"Command"];
  unsigned int v8 = +[MSDPairedWatchProxy sharedInstance];
  if (![v7 isEqualToString:@"UpdateContent"])
  {
    if ([v7 isEqualToString:@"StopBackgroundDownload"])
    {
      id v11 = [(MSDMailProcessor *)self device];
      unsigned __int8 v12 = [v11 canStopBackgroundDownload];
      goto LABEL_10;
    }
    if ([v7 isEqualToString:@"UpdateOS"])
    {
      id v11 = [(MSDMailProcessor *)self device];
      unsigned __int8 v12 = [v11 canStartOSUpdate];
      goto LABEL_10;
    }
    if ([v7 isEqualToString:@"TurnSnapshotON"])
    {
      double v18 = [(MSDMailProcessor *)self device];
      LOBYTE(self) = [v18 canLockSnapshot];

      if (!v4) {
        goto LABEL_15;
      }
      unsigned __int8 v19 = [v8 canLockSnapshot];
    }
    else if ([v7 isEqualToString:@"TurnSnapshotOFF"])
    {
      unsigned int v20 = [(MSDMailProcessor *)self device];
      LOBYTE(self) = [v20 canUnlockSnapshot];

      if (!v4) {
        goto LABEL_15;
      }
      unsigned __int8 v19 = [v8 canUnlockSnapshot];
    }
    else
    {
      if (![v7 isEqualToString:@"RevertSnapshot"])
      {
        if (![v7 isEqualToString:@"Virgin"])
        {
          if (([v7 isEqualToString:@"Restart"] & 1) != 0
            || ([v7 isEqualToString:@"ChangeSettings"] & 1) != 0)
          {
            LOBYTE(self) = 1;
            goto LABEL_15;
          }
          if (([v7 isEqualToString:@"Shutdown"] & 1) != 0
            || ([v7 isEqualToString:@"HoldPowerAssertion"] & 1) != 0
            || ([v7 isEqualToString:@"LiftPowerAssertion"] & 1) != 0
            || ([v7 isEqualToString:@"MigrateToNewHub"] & 1) != 0
            || ([v7 isEqualToString:@"ChangePingFrequency"] & 1) != 0
            || ([v7 isEqualToString:@"ConfigScreenSaver"] & 1) != 0
            || ![v7 isEqualToString:@"DemoDeviceLock"])
          {
            LOBYTE(self) = 0;
            goto LABEL_15;
          }
          id v11 = [(MSDMailProcessor *)self device];
          if ([v11 isDDLDevice])
          {
            v24 = [(MSDMailProcessor *)self device];
            LOBYTE(self) = [v24 isContentFrozen];
          }
          else
          {
            LOBYTE(self) = 0;
          }
          goto LABEL_11;
        }
        v22 = [v6 objectForKey:@"ObliterateDevice"];
        id v23 = [v22 BOOLValue];

        id v11 = [(MSDMailProcessor *)self device];
        unsigned __int8 v12 = [v11 canUnenrollWithObliteration:v23 consultDeviceOptions:0];
LABEL_10:
        LOBYTE(self) = v12;
LABEL_11:

        goto LABEL_15;
      }
      uint64_t v21 = [(MSDMailProcessor *)self device];
      LOBYTE(self) = [v21 canRevertSnapshot];

      if (!v4) {
        goto LABEL_15;
      }
      unsigned __int8 v19 = [v8 canRevertSnapshot];
    }
    LOBYTE(self) = self & v19;
    goto LABEL_15;
  }
  uint64_t v9 = [v6 objectForKey:@"ContentType"];
  if ([v9 containsObject:@"Account"])
  {
    uint64_t v10 = [(MSDMailProcessor *)self device];
    LOBYTE(self) = [v10 canStartAccountContentUpdate];
  }
  else
  {
    v13 = [v6 objectForKey:@"BackgroundDownloadOnly"];
    unsigned int v14 = [v13 BOOLValue];

    BOOL v15 = [(MSDMailProcessor *)self device];
    v16 = v15;
    if (v14)
    {
      LOBYTE(self) = [v15 canStartBackgroundDownload];
    }
    else
    {
      LODWORD(self) = [v15 canStartContentUpdate];

      if (v4) {
        LODWORD(self) = self & [v8 canUpdateContent];
      }
    }
  }

LABEL_15:
  return (char)self;
}

- (int64_t)pingIntervalToUse
{
  BOOL v3 = [(MSDMailProcessor *)self device];
  BOOL v4 = [v3 hubSuppliedSettings];
  unint64_t v5 = [v4 objectForKey:@"PingFrequency"];

  if ([(MSDMailProcessor *)self waitingForCommand])
  {
    int64_t v6 = 30;
  }
  else if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 unsignedIntegerValue])
  {
    int64_t v6 = (int64_t)[v5 integerValue];
  }
  else
  {
    int64_t v6 = 600;
  }

  return v6;
}

- (BOOL)updateManifestInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = +[MSDFileDownloadCredentials sharedInstance];
  int v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "receiveDict:%{public}@", (uint8_t *)&v23, 0xCu);
  }

  if (![v5 count])
  {
    unsigned int v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D1FB8(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    sub_1000C3140(a4, 3727740937, @"No suitable demo content found.");
    unsigned int v8 = 0;
    goto LABEL_15;
  }
  unsigned int v8 = [v5 objectForKey:@"Ready"];
  if (!v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v8 BOOLValue] & 1) == 0)
  {
    sub_1000C3140(a4, 3727740939, @"Hub still downloading contents. Please wait.");
LABEL_15:
    id v9 = 0;
    goto LABEL_16;
  }
  id v9 = [v5 mutableCopy];
  [v9 removeObjectForKey:@"Ready"];
  uint64_t v10 = [v9 allKeys];
  id v11 = [v10 count];

  if (!v11)
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D2030();
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    goto LABEL_16;
  }
  if (([v6 updateWithResponseFromGetManifestInfo:v9] & 1) == 0)
  {
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (unint64_t)convertPingType:(unint64_t)a3
{
  BOOL v4 = +[MSDNPIMaskValues sharedInstance];
  unsigned int v5 = [v4 isNPIDevice];

  if (v5) {
    return a3 | 0x40;
  }
  else {
    return a3;
  }
}

- (NSTimer)pingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPingTimer:(id)a3
{
}

- (BOOL)fullKeysSent
{
  return self->_fullKeysSent;
}

- (void)setFullKeysSent:(BOOL)a3
{
  self->_fullKeysSent = a3;
}

- (unint64_t)queuedPingType
{
  return self->_queuedPingType;
}

- (void)setQueuedPingType:(unint64_t)a3
{
  self->_queuedPingType = a3;
}

- (BOOL)demodReady
{
  return self->_demodReady;
}

- (void)setDemodReady:(BOOL)a3
{
  self->_demodReady = a3;
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_pingTimer, 0);
}

@end