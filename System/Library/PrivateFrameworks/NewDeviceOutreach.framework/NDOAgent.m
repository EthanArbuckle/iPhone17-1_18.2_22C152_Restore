@interface NDOAgent
- (NDOAgent)initWithCallingProcessBundleID:(id)a3;
- (NDOAgent)initWithWarrantyProvider:(id)a3 deviceProvider:(id)a4;
- (NDOAgentDeviceProvider)deviceProvider;
- (NDOAgentWarrantyProvider)warrantyProvider;
- (void)_getInfosForDevices:(id)a3 usingPolicy:(unint64_t)a4 updateFollowUps:(BOOL)a5 withReply:(id)a6;
- (void)allFUPEligibleDevices:(id)a3;
- (void)appSupportAvailability:(id)a3 withReply:(id)a4;
- (void)appleAccountAddedWithReply:(id)a3;
- (void)checkIsAvailableInStore:(id)a3 withReply:(id)a4;
- (void)clearAllUserInitiatedFollowUpDismissalsWithCompletion:(id)a3;
- (void)clearUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 completion:(id)a4;
- (void)defaultDevice:(id)a3;
- (void)dismissFollowUpForSerialNumber:(id)a3 completion:(id)a4;
- (void)dismissNotificationForSerialNumber:(id)a3 completion:(id)a4;
- (void)getAllFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getBTDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getBTPioneerDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getClientConfigurationWithReply:(id)a3;
- (void)getDecodedParamsForPath:(id)a3 withReply:(id)a4;
- (void)getDefaultDeviceInfoUsingPolicy:(unint64_t)a3 withReply:(id)a4;
- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8;
- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 withReply:(id)a5;
- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 withReply:(id)a6;
- (void)getEligibleBluetoothAndWatchDeviceInfos:(id)a3;
- (void)getPrimaryFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getWarrantyUsingPolicy:(unint64_t)a3 params:(id)a4 withReply:(id)a5;
- (void)getWarrantyUsingPolicy:(unint64_t)a3 serialNumber:(id)a4 sessionID:(id)a5 params:(id)a6 withReply:(id)a7;
- (void)pairedBTDevices:(id)a3;
- (void)pairedBTPioneerDevices:(id)a3;
- (void)pairedWatches:(id)a3;
- (void)performMigrationIfNeeded;
- (void)primaryFUPEligibleDevices:(id)a3;
- (void)readAPSSupportedOverride:(id)a3;
- (void)readULWebURLOverride:(id)a3;
- (void)readWebURLOverride:(id)a3;
- (void)scheduleOutreachAfter:(double)a3 withReply:(id)a4;
- (void)scheduleOutreachWithReply:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setWarrantyProvider:(id)a3;
- (void)storeUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 completion:(id)a4;
@end

@implementation NDOAgent

- (NDOAgent)initWithCallingProcessBundleID:(id)a3
{
  id v5 = a3;
  p_callingProcessBundleID = &self->_callingProcessBundleID;
  objc_storeStrong((id *)&self->_callingProcessBundleID, a3);
  if (!self->_callingProcessBundleID)
  {
    v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446210;
      v14 = "-[NDOAgent initWithCallingProcessBundleID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: callingProcessBundleID is nil. Falling back to Preferences Bundle ID", (uint8_t *)&v13, 0xCu);
    }

    v8 = *p_callingProcessBundleID;
    *p_callingProcessBundleID = (NSString *)@"com.apple.Preferences";
  }
  v9 = [[NDOAgentDefaultWarrantyProvider alloc] initWithCallingProcessBundleID:self->_callingProcessBundleID];
  v10 = +[NDODeviceProvider sharedProvider];
  v11 = [(NDOAgent *)self initWithWarrantyProvider:v9 deviceProvider:v10];

  return v11;
}

- (NDOAgent)initWithWarrantyProvider:(id)a3 deviceProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NDOAgent;
  v8 = [(NDOAgent *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(NDOAgent *)v8 setWarrantyProvider:v6];
    [(NDOAgent *)v9 setDeviceProvider:v7];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.NewDeviceOutreach/.ndoagent.policyqueue", v10);
    policyLookupQueue = v9->_policyLookupQueue;
    v9->_policyLookupQueue = (OS_dispatch_queue *)v11;

    dispatch_group_t v13 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v13;
  }
  return v9;
}

- (void)performMigrationIfNeeded
{
  v3 = [(NDOAgent *)self warrantyProvider];
  int v4 = [v3 migrationVersion];

  if (v4 <= 1)
  {
    id v5 = [(NDOAgent *)self deviceProvider];
    id v12 = [v5 defaultDevice];

    id v6 = [(NDOAgent *)self warrantyProvider];
    id v7 = [v12 serialNumber];
    v8 = [v6 migrateLegacyCachedWarrantyIfNeededForSerialNumber:v7];

    v9 = [(NDOAgent *)self warrantyProvider];
    v10 = +[NDODeviceInfo deviceInfoWithDevice:v12 warranty:v8];
    [v9 migrateLegacyFollowUpIfNeededWithDeviceInfo:v10];

    dispatch_queue_t v11 = [(NDOAgent *)self warrantyProvider];
    [v11 setMigrationVersion:2];
  }
}

- (void)appleAccountAddedWithReply:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"PostUpgradeActivityCompleted"];

  if (v6)
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 doubleForKey:@"AccountLoginOutreachDelay"];
    double v9 = v8;

    v10 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v11 = [v10 BOOLForKey:@"InitialOutreachActivityScheduled"];

    id v12 = _NDOLogSystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 136446466;
        v26 = "-[NDOAgent appleAccountAddedWithReply:]";
        __int16 v27 = 2048;
        double v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: New warranty to be downloaded after: %f", buf, 0x16u);
      }

      dispatch_time_t v14 = dispatch_time(0, (uint64_t)v9);
      v15 = dispatch_get_global_queue(9, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C6E0;
      block[3] = &unk_10001CAD8;
      block[4] = self;
      id v22 = v4;
      dispatch_after(v14, v15, block);

      objc_super v16 = v22;
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 136446466;
        v26 = "-[NDOAgent appleAccountAddedWithReply:]";
        __int16 v27 = 2048;
        double v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Outreach to be scheduled after: %f", buf, 0x16u);
      }

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000C6D0;
      v23[3] = &unk_10001C720;
      id v24 = v4;
      [(NDOAgent *)self scheduleOutreachAfter:v23 withReply:v9];
      v20 = +[NSUserDefaults standardUserDefaults];
      [v20 setBool:1 forKey:@"InitialOutreachActivityScheduled"];

      objc_super v16 = v24;
    }
  }
  else
  {
    v17 = _NDOLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v26 = "-[NDOAgent appleAccountAddedWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: Skipped scheduling/downloading new warranty and scheduling postUpgrade activity now", buf, 0xCu);
    }

    v18 = objc_opt_new();
    v19 = +[NSDate date];
    +[NDOScheduler scheduleActivityWithDelegate:v18 forDate:v19];

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)scheduleOutreachWithReply:(id)a3
{
}

- (void)scheduleOutreachAfter:(double)a3 withReply:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  unsigned __int8 v6 = objc_opt_new();
  id v7 = +[NDOScheduler newSchedulerWithActivityDelegate:v6];

  [v7 scheduleActivityWithDelay:a3];
  v5[2](v5, 1);
}

- (void)checkIsAvailableInStore:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking for %@ in the App Store", (uint8_t *)&v9, 0xCu);
  }

  double v8 = objc_opt_new();
  [v8 checkIsAvailableInStore:v5 withReply:v6];
}

- (void)appSupportAvailability:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Availability for %@", (uint8_t *)&v9, 0xCu);
  }

  double v8 = objc_opt_new();
  [v8 appSupportAvailability:v5 withReply:v6];
}

- (void)readWebURLOverride:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  if (!+[NDOUtilities isInternal])
  {
    id v4 = 0;
    if (!v3) {
      goto LABEL_8;
    }
LABEL_7:
    v3[2](v3, v4);
    goto LABEL_8;
  }
  id v4 = +[NDOServerVersionUtilities readWebURLOverride];
  id v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "readWebURLOverride = %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)readULWebURLOverride:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  if (!+[NDOUtilities isInternal])
  {
    id v4 = 0;
    if (!v3) {
      goto LABEL_8;
    }
LABEL_7:
    v3[2](v3, v4);
    goto LABEL_8;
  }
  id v4 = +[NDOServerVersionUtilities readULWebURLOverride];
  id v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "readULWebURLOverride = %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)readAPSSupportedOverride:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v4 = +[NDOServerVersionUtilities readAPSSupportedOverride];
  id v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "readAPSSupportedOverride = %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3) {
    v3[2](v3, v4);
  }
}

- (void)getDecodedParamsForPath:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000CD90;
    v7[3] = &unk_10001CB00;
    id v8 = v5;
    +[NDOServerVersionUtilities getDecodedParamsForPath:a3 withCompletion:v7];
  }
}

- (void)getClientConfigurationWithReply:(id)a3
{
  id v4 = a3;
  id v5 = +[NDOServerVersionUtilities clientConfig];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)defaultDevice:(id)a3
{
  id v5 = a3;
  id v7 = [(NDOAgent *)self deviceProvider];
  int v6 = [v7 defaultDevice];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)pairedWatches:(id)a3
{
  id v5 = a3;
  id v8 = [(NDOAgent *)self deviceProvider];
  int v6 = [v8 pairedWatches];
  id v7 = [v6 allValues];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)pairedBTDevices:(id)a3
{
  id v5 = a3;
  id v8 = [(NDOAgent *)self deviceProvider];
  int v6 = [v8 pairedBTDevices];
  id v7 = [v6 allValues];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)pairedBTPioneerDevices:(id)a3
{
  id v5 = a3;
  id v8 = [(NDOAgent *)self deviceProvider];
  int v6 = [v8 pairedBTPioneerDevices];
  id v7 = [v6 allValues];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)allFUPEligibleDevices:(id)a3
{
  id v5 = a3;
  id v8 = [(NDOAgent *)self deviceProvider];
  int v6 = [v8 allFUPEligibleDevices];
  id v7 = [v6 allValues];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)primaryFUPEligibleDevices:(id)a3
{
  id v5 = a3;
  id v8 = [(NDOAgent *)self deviceProvider];
  int v6 = [v8 primaryFUPEligibleDevices];
  id v7 = [v6 allValues];
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (void)getDefaultDeviceInfoUsingPolicy:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = [(NDOAgent *)self deviceProvider];
  id v8 = [v7 defaultDevice];

  int v9 = [v8 serialNumber];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D288;
  v12[3] = &unk_10001CB28;
  dispatch_time_t v14 = self;
  id v15 = v6;
  id v13 = v8;
  id v10 = v6;
  id v11 = v8;
  [(NDOAgent *)self getWarrantyUsingPolicy:a3 serialNumber:v9 sessionID:0 params:0 withReply:v12];
}

- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_time_t v14 = [[NDOWarrantyDownloader alloc] initWithCallingProcessBundleID:self->_callingProcessBundleID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D494;
  v16[3] = &unk_10001CB50;
  id v17 = v10;
  id v15 = v10;
  [(NDOWarrantyDownloader *)v14 downloadDeviceForLocalDevices:v13 sessionID:v12 params:v11 completionHandler:v16];
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 withReply:(id)a5
{
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = +[NSUserDefaults standardUserDefaults];
  uint64_t v19 = [v18 dictionaryForKey:@"PairedWatchesSerialNumbersMap"];

  v20 = +[NSUserDefaults standardUserDefaults];
  uint64_t v21 = [v20 dictionaryForKey:@"PairedBluetoothDevicesSerialNumbers"];

  if (v19 | v21)
  {
    unint64_t v31 = a4;
    id v22 = [(id)v19 objectForKeyedSubscript:v14];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [(id)v21 objectForKeyedSubscript:v14];
    }
    v25 = v24;

    v26 = _NDOLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100012140();
    }

    if (v25)
    {
      id v27 = v25;

      double v28 = _NDOLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_1000120C8();
      }

      id v14 = v27;
    }

    a4 = v31;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000D6F0;
  v32[3] = &unk_10001CB78;
  id v33 = v14;
  v34 = self;
  id v35 = v17;
  BOOL v36 = a7;
  id v29 = v17;
  id v30 = v14;
  [(NDOAgent *)self getWarrantyUsingPolicy:a4 serialNumber:v30 sessionID:v15 params:v16 withReply:v32];
}

- (void)getPrimaryFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  id v8 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10000DB50;
  v20[4] = sub_10000DB60;
  id v21 = +[NSMutableArray array];
  int v9 = [(NDOAgent *)self deviceProvider];
  id v10 = [v9 primaryFUPEligibleDevices];
  id v11 = [v10 allValues];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DB68;
  v19[3] = &unk_10001CBF0;
  v19[4] = self;
  v19[5] = v20;
  v19[6] = a3;
  [v11 enumerateObjectsUsingBlock:v19];
  policyLookupQueue = self->_policyLookupQueue;
  group = self->_group;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DD88;
  block[3] = &unk_10001CC18;
  id v16 = v8;
  id v17 = v20;
  BOOL v18 = a4;
  block[4] = self;
  id v14 = v8;
  dispatch_group_notify(group, policyLookupQueue, block);

  _Block_object_dispose(v20, 8);
}

- (void)getEligibleBluetoothAndWatchDeviceInfos:(id)a3
{
  id v4 = a3;
  id v12 = (id)objc_opt_new();
  id v5 = [(NDOAgent *)self deviceProvider];
  id v6 = [v5 pairedWatches];
  id v7 = [v6 allValues];
  [v12 addObjectsFromArray:v7];

  id v8 = [(NDOAgent *)self deviceProvider];
  int v9 = [v8 pairedBTDevices];
  id v10 = [v9 allValues];
  [v12 addObjectsFromArray:v10];

  id v11 = [v12 copy];
  [(NDOAgent *)self _getInfosForDevices:v11 usingPolicy:2 updateFollowUps:1 withReply:v4];
}

- (void)getAllFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v11 = [(NDOAgent *)self deviceProvider];
  int v9 = [v11 allFUPEligibleDevices];
  id v10 = [v9 allValues];
  [(NDOAgent *)self _getInfosForDevices:v10 usingPolicy:a3 updateFollowUps:v5 withReply:v8];
}

- (void)_getInfosForDevices:(id)a3 usingPolicy:(unint64_t)a4 updateFollowUps:(BOOL)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10000DB50;
  v20[4] = sub_10000DB60;
  id v21 = +[NSMutableArray array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E200;
  v19[3] = &unk_10001CBF0;
  v19[5] = v20;
  v19[6] = a4;
  v19[4] = self;
  [v10 enumerateObjectsUsingBlock:v19];
  policyLookupQueue = self->_policyLookupQueue;
  group = self->_group;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E420;
  block[3] = &unk_10001CC18;
  id v16 = v11;
  id v17 = v20;
  BOOL v18 = a5;
  block[4] = self;
  id v14 = v11;
  dispatch_group_notify(group, policyLookupQueue, block);

  _Block_object_dispose(v20, 8);
}

- (void)getBTDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  id v8 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10000DB50;
  v20[4] = sub_10000DB60;
  id v21 = +[NSMutableArray array];
  int v9 = [(NDOAgent *)self deviceProvider];
  id v10 = [v9 pairedBTDevices];
  id v11 = [v10 allValues];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E704;
  v19[3] = &unk_10001CBF0;
  v19[4] = self;
  v19[5] = v20;
  v19[6] = a3;
  [v11 enumerateObjectsUsingBlock:v19];
  policyLookupQueue = self->_policyLookupQueue;
  group = self->_group;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E924;
  block[3] = &unk_10001CC18;
  id v16 = v8;
  id v17 = v20;
  BOOL v18 = a4;
  block[4] = self;
  id v14 = v8;
  dispatch_group_notify(group, policyLookupQueue, block);

  _Block_object_dispose(v20, 8);
}

- (void)getBTPioneerDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  id v8 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10000DB50;
  v20[4] = sub_10000DB60;
  id v21 = +[NSMutableArray array];
  int v9 = [(NDOAgent *)self deviceProvider];
  id v10 = [v9 pairedBTPioneerDevices];
  id v11 = [v10 allValues];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000EBF4;
  v19[3] = &unk_10001CBF0;
  v19[4] = self;
  v19[5] = v20;
  v19[6] = a3;
  [v11 enumerateObjectsUsingBlock:v19];
  policyLookupQueue = self->_policyLookupQueue;
  group = self->_group;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EE14;
  block[3] = &unk_10001CC18;
  id v16 = v8;
  id v17 = v20;
  BOOL v18 = a4;
  block[4] = self;
  id v14 = v8;
  dispatch_group_notify(group, policyLookupQueue, block);

  _Block_object_dispose(v20, 8);
}

- (void)dismissFollowUpForSerialNumber:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  id v7 = [(NDOAgent *)self warrantyProvider];
  [v7 dismissFollowUpForSerialNumber:v6];

  v8[2](v8, 1);
}

- (void)dismissNotificationForSerialNumber:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  id v7 = [(NDOAgent *)self warrantyProvider];
  [v7 dismissNotificationForSerialNumber:v6];

  v8[2](v8, 1);
}

- (void)getWarrantyUsingPolicy:(unint64_t)a3 params:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = [(NDOAgent *)self deviceProvider];
  id v10 = [v12 defaultDevice];
  id v11 = [v10 serialNumber];
  [(NDOAgent *)self getWarrantyUsingPolicy:a3 serialNumber:v11 sessionID:0 params:v9 withReply:v8];
}

- (void)getWarrantyUsingPolicy:(unint64_t)a3 serialNumber:(id)a4 sessionID:(id)a5 params:(id)a6 withReply:(id)a7
{
  id v12 = a4;
  id v54 = a5;
  id v55 = a6;
  id v13 = a7;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = sub_10000DB50;
  v68 = sub_10000DB60;
  id v69 = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10000F9EC;
  v59[3] = &unk_10001CC40;
  double v14 = COERCE_DOUBLE(v12);
  double v60 = v14;
  id v53 = v13;
  id v61 = v53;
  v62 = &v70;
  v63 = &v64;
  v56 = objc_retainBlock(v59);
  *((unsigned char *)v71 + 24) = 0;
  id v15 = _NDOLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v75 = v14;
    __int16 v76 = 2048;
    CFStringRef v77 = (const __CFString *)a3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "getting warranty using policy %@: %lu", buf, 0x16u);
  }

  id v16 = [(NDOAgent *)self warrantyProvider];
  uint64_t v17 = [v16 cachedWarrantyForSerialNumber:*(void *)&v14];
  BOOL v18 = (void *)v65[5];
  v65[5] = v17;

  if (v65[5])
  {
    uint64_t v19 = _NDOLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v20 = (const __CFString *)v65[5];
      *(_DWORD *)buf = 138412546;
      double v75 = v14;
      __int16 v76 = 2112;
      CFStringRef v77 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Has cache: %@ with cached warranty : %@", buf, 0x16u);
    }

    id v21 = [(NDOAgent *)self warrantyProvider];
    *(double *)&id v22 = [v21 cachedWarrantyVersionForSerialNumber:*(void *)&v14];

    if ([v22 isEqualToString:@"2"])
    {
      v23 = [(NDOAgent *)self warrantyProvider];
      *(double *)&id v24 = [v23 cachedWarrantyLocaleForSerialNumber:*(void *)&v14];

      v25 = +[NSLocale preferredLocale];
      v26 = [v25 localeIdentifier];
      unsigned int v27 = [v24 isEqualToString:v26];

      if (v27)
      {
        double v28 = [(NDOAgent *)self warrantyProvider];
        unsigned int v29 = [v28 isSignedInToiCloud];

        if (v29)
        {
          id v30 = _NDOLogSystem();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            double v75 = *(double *)&v24;
            __int16 v76 = 2112;
            CFStringRef v77 = (const __CFString *)v22;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "cached warranty is for locale ('%@') and version ('%@') match system, consider it valid", buf, 0x16u);
          }

          *((unsigned char *)v71 + 24) = 1;
        }
        else
        {
          v34 = _NDOLogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "user is signed out of iCloud, cached warranty not allowed", buf, 2u);
          }
        }
      }
      else
      {
        unint64_t v31 = _NDOLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = +[NSLocale preferredLocale];
          id v33 = [v32 localeIdentifier];
          *(_DWORD *)buf = 138412546;
          double v75 = *(double *)&v24;
          __int16 v76 = 2112;
          CFStringRef v77 = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "cached warranty is for locale '%@', system is now in '%@', consider it invalid", buf, 0x16u);
        }
      }
    }
    else
    {
      _NDOLogSystem();
      *(double *)&id v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v75 = *(double *)&v22;
        __int16 v76 = 2112;
        CFStringRef v77 = @"2";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "cached warranty is of outdated version '%@', current version is '%@', consider it invalid", buf, 0x16u);
      }
    }
  }
  else
  {
    _NDOLogSystem();
    *(double *)&id v22 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v75 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "no cached warranty : %@", buf, 0xCu);
    }
  }

  if (a3 == 2)
  {
    *((unsigned char *)v71 + 24) = 0;
LABEL_37:
    int v48 = 1;
    goto LABEL_46;
  }
  if (a3)
  {
    int v48 = 0;
    goto LABEL_46;
  }
  if (!*((unsigned char *)v71 + 24))
  {
    v49 = _NDOLogSystem();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Default policy query: cached warranty is invalid, refresh it", buf, 2u);
    }

    goto LABEL_37;
  }
  id v35 = _NDOLogSystem();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Default policy query: cached warranty is valid, examine expiration date", buf, 2u);
  }

  BOOL v36 = [(NDOAgent *)self warrantyProvider];
  v37 = [v36 lastUpdatedDateForSerialNumber:*(void *)&v14];

  if (v37)
  {
    [v37 timeIntervalSinceNow];
    double v39 = v38;
    v40 = [(NDOAgent *)self warrantyProvider];
    [v40 cachedWarrantyValidityDurationForSerialNumber:*(void *)&v14];
    double v42 = v41;

    double v43 = v39 + v42;
    if (v43 > 0.0)
    {
      v44 = _NDOLogSystem();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v75 = v43;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "warranty valid for %.02f seconds", buf, 0xCu);
      }
      int v48 = 0;
      goto LABEL_45;
    }
    v44 = _NDOLogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v75 = -v43;
      v45 = "warranty validity expired %.02f seconds ago, refresh it";
      v46 = v44;
      uint32_t v47 = 12;
LABEL_40:
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
    }
  }
  else
  {
    v44 = _NDOLogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v45 = "warranty validity expired, refresh it";
      v46 = v44;
      uint32_t v47 = 2;
      goto LABEL_40;
    }
  }
  int v48 = 1;
LABEL_45:

LABEL_46:
  v50 = _NDOLogSystem();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v75 = COERCE_DOUBLE("-[NDOAgent getWarrantyUsingPolicy:serialNumber:sessionID:params:withReply:]");
    __int16 v76 = 1024;
    LODWORD(v77) = v48;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s: shouldDownloadWarranty: %d", buf, 0x12u);
  }

  if (v48)
  {
    v51 = [(NDOAgent *)self warrantyProvider];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10000FB08;
    v57[3] = &unk_10001CC68;
    v58 = v56;
    [v51 downloadWarrantyForSerialNumber:*(void *)&v14 sessionID:v54 params:v55 completionHandler:v57];

    v52 = v56;
  }
  else
  {
    v52 = v56;
    ((void (*)(void *, void))v56[2])(v56, 0);
  }

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);
}

- (void)clearUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 completion:(id)a4
{
  BOOL v5 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136380675;
    id v9 = "-[NDOAgent clearUserInitiatedFollowUpDismissalForSerialNumber:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{private}s", (uint8_t *)&v8, 0xCu);
  }

  +[NDOFollowUpDismissalTracker eraseFollowUpDismissalForDeviceSerial:v6];
  if (v5) {
    v5[2](v5);
  }
}

- (void)clearAllUserInitiatedFollowUpDismissalsWithCompletion:(id)a3
{
  v3 = (void (**)(void))a3;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136380675;
    id v6 = "-[NDOAgent clearAllUserInitiatedFollowUpDismissalsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{private}s", (uint8_t *)&v5, 0xCu);
  }

  +[NDOFollowUpDismissalTracker eraseAllFollowUpDismissals];
  if (v3) {
    v3[2](v3);
  }
}

- (void)storeUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 completion:(id)a4
{
  int v5 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136380675;
    id v9 = "-[NDOAgent storeUserInitiatedFollowUpDismissalForSerialNumber:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{private}s", (uint8_t *)&v8, 0xCu);
  }

  +[NDOFollowUpDismissalTracker storeFollowUpDismissalWithDeviceSerial:v6];
  if (v5) {
    v5[2](v5);
  }
}

- (NDOAgentWarrantyProvider)warrantyProvider
{
  return (NDOAgentWarrantyProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWarrantyProvider:(id)a3
{
}

- (NDOAgentDeviceProvider)deviceProvider
{
  return (NDOAgentDeviceProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_warrantyProvider, 0);
  objc_storeStrong((id *)&self->_callingProcessBundleID, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_policyLookupQueue, 0);
}

@end