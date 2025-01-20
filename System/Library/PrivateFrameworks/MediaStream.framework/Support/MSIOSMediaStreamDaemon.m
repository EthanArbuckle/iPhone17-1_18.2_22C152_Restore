@interface MSIOSMediaStreamDaemon
- (BOOL)isWaitingForAuth;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)mayDownloadPersonID:(id)a3;
- (MSIOSMediaStreamDaemon)init;
- (NSMutableDictionary)personIDToPowerBudgetMap;
- (NSMutableDictionary)personIDToPowerBudgetPersistedValuesMap;
- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3;
- (id)_powerBudgetForPersonID:(id)a3;
- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4;
- (void)MSPowerBudgetGotSignificantEvent:(id)a3;
- (void)_readPowerBudgetParametersForPersonID:(id)a3;
- (void)_serverSideConfigurationDidChange:(id)a3;
- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)deleteAssetCollections:(id)a3 personID:(id)a4;
- (void)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 reply:(id)a5;
- (void)didBeginForegroundFocusForPersonID:(id)a3;
- (void)didEndForegroundFocusForPersonID:(id)a3;
- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4;
- (void)didIdle;
- (void)didReceiveAuthenticationFailureForPersonID:(id)a3;
- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3;
- (void)didReceiveGlobalResetSyncForPersonID:(id)a3;
- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3;
- (void)didReceivePushNotificationForPersonID:(id)a3;
- (void)didUnidle;
- (void)enqueueAssetCollections:(id)a3 personID:(id)a4 reply:(id)a5;
- (void)forgetEverythingForPersonID:(id)a3;
- (void)pauseForUUID:(id)a3;
- (void)pauseManagerDidPause:(id)a3;
- (void)pauseManagerDidUnpause:(id)a3;
- (void)resetServerStateForPersonID:(id)a3;
- (void)serverSideConfigurationForPersonID:(id)a3 reply:(id)a4;
- (void)setPersonIDToPowerBudgetMap:(id)a3;
- (void)setPersonIDToPowerBudgetPersistedValuesMap:(id)a3;
- (void)start;
- (void)stop;
- (void)unpauseForUUID:(id)a3;
@end

@implementation MSIOSMediaStreamDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIDToPowerBudgetMap, 0);
  objc_storeStrong((id *)&self->_personIDToPowerBudgetPersistedValuesMap, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_devAPSConnection, 0);
  objc_storeStrong((id *)&self->_prodAPSConnection, 0);

  objc_storeStrong((id *)&self->_center, 0);
}

- (void)setPersonIDToPowerBudgetMap:(id)a3
{
}

- (void)setPersonIDToPowerBudgetPersistedValuesMap:(id)a3
{
}

- (BOOL)mayDownloadPersonID:(id)a3
{
  v3 = [(MSIOSMediaStreamDaemon *)self _powerBudgetForPersonID:a3];
  unsigned __int8 v4 = [v3 isFileTransferAllowed];

  return v4;
}

- (void)didReceivePushNotificationForPersonID:(id)a3
{
  id v3 = [(MSIOSMediaStreamDaemon *)self _powerBudgetForPersonID:a3];
  [v3 didReceivePushNotification];
}

- (void)didEndForegroundFocusForPersonID:(id)a3
{
  id v3 = [(MSIOSMediaStreamDaemon *)self _powerBudgetForPersonID:a3];
  [v3 didEndForegroundFocus];
}

- (void)didBeginForegroundFocusForPersonID:(id)a3
{
  id v3 = [(MSIOSMediaStreamDaemon *)self _powerBudgetForPersonID:a3];
  [v3 didBeginForegroundFocus];
}

- (void)didReceiveGlobalResetSyncForPersonID:(id)a3
{
  id v3 = [(MSIOSMediaStreamDaemon *)self _powerBudgetForPersonID:a3];
  [v3 didReceiveGlobalResetSync];
}

- (void)_serverSideConfigurationDidChange:(id)a3
{
  id v4 = a3;
  v5 = +[NSThread currentThread];
  v6 = +[NSThread mainThread];

  if (v5 == v6)
  {
    v7 = [v4 userInfo];

    id v4 = [v7 objectForKey:kMSSSCCNPersonIDKey];

    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 138412546;
        *(void *)&v9[4] = objc_opt_class();
        *(_WORD *)&v9[12] = 2112;
        *(void *)&v9[14] = v4;
        id v8 = *(id *)&v9[4];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Server-side configuration has changed for personID %@. Reading new values.", v9, 0x16u);
      }
      -[MSIOSMediaStreamDaemon _readPowerBudgetParametersForPersonID:](self, "_readPowerBudgetParametersForPersonID:", v4, *(_OWORD *)v9, *(void *)&v9[16]);
    }
  }
  else
  {
    [(MSIOSMediaStreamDaemon *)self performSelectorOnMainThread:"_serverSideConfigurationDidChange:" withObject:v4 waitUntilDone:0];
  }
}

- (void)MSPowerBudgetGotSignificantEvent:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000064DC;
  block[3] = &unk_100018C28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetPersistedValuesMap];
  v9 = [v6 personID];
  v10 = [v8 objectForKey:v9];

  if (v10 && ([v10 isEqualToDictionary:v7] & 1) != 0)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = v7;

    v12 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetPersistedValuesMap];
    v13 = [v6 personID];
    if (v11)
    {
      [v12 setObject:v11 forKey:v13];

      id v24 = 0;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v24];
      id v15 = v24;
      if (v14)
      {
        v16 = [v6 personID];
        v17 = sub_1000067F0(v16);
        id v23 = v15;
        unsigned __int8 v18 = [v14 writeToFile:v17 options:1 error:&v23];
        id v19 = v23;

        if ((v18 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to save persisted power budget for personID values: %@", buf, 0xCu);
        }
        id v15 = v19;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to archive persisted power budget for personID values: %@", buf, 0xCu);
      }
    }
    else
    {
      [v12 removeObjectForKey:v13];

      v20 = +[NSFileManager defaultManager];
      v21 = [v6 personID];
      v22 = sub_1000067F0(v21);
      [v20 removeItemAtPath:v22 error:0];

      id v11 = 0;
    }
  }
}

- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3
{
  id v4 = a3;
  v5 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetPersistedValuesMap];
  id v6 = [v4 personID];
  id v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v8 = [v4 personID];
    v9 = sub_1000067F0(v8);
    id v14 = 0;
    id v7 = +[NSKeyedUnarchiver MSSafeUnarchiveObjectWithFile:v9 outError:&v14];
    id v10 = v14;

    if (v7)
    {
      id v11 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetPersistedValuesMap];
      v12 = [v4 personID];
      [v11 setObject:v7 forKey:v12];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to unarchive persisted power budget values: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (NSMutableDictionary)personIDToPowerBudgetPersistedValuesMap
{
  personIDToPowerBudgetPersistedValuesMap = self->_personIDToPowerBudgetPersistedValuesMap;
  if (!personIDToPowerBudgetPersistedValuesMap)
  {
    id v4 = +[NSMutableDictionary dictionary];
    v5 = self->_personIDToPowerBudgetPersistedValuesMap;
    self->_personIDToPowerBudgetPersistedValuesMap = v4;

    personIDToPowerBudgetPersistedValuesMap = self->_personIDToPowerBudgetPersistedValuesMap;
  }

  return personIDToPowerBudgetPersistedValuesMap;
}

- (id)_powerBudgetForPersonID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetMap];
    id v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543618;
        id v11 = self;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Creating power budget object for person ID %@", (uint8_t *)&v10, 0x16u);
      }
      id v6 = objc_alloc_init((Class)MSPowerBudget);
      id v7 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetMap];
      [v7 setObject:v6 forKey:v4];

      [v6 setPersonID:v4];
      [v6 setDelegate:self];
      [(MSIOSMediaStreamDaemon *)self _readPowerBudgetParametersForPersonID:v4];
      id v8 = +[MSBatteryPowerMonitor defaultMonitor];
      LODWORD(v7) = [v8 isExternalPowerConnected];

      if (v7) {
        [v6 didBeginExternalPower];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_readPowerBudgetParametersForPersonID:(id)a3
{
  id v5 = a3;
  id v4 = -[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:");
  if (v4)
  {
    +[MSServerSideConfigManager doubleValueForParameter:kMSSSCKMaxActiveTimeAfterPush forPersonID:v5 defaultValue:60.0];
    objc_msgSend(v4, "setMaxActiveTimeAfterPush:");
    +[MSServerSideConfigManager doubleValueForParameter:kMSSSCKMaxActiveTimeAfterLossOfForeground forPersonID:v5 defaultValue:600.0];
    objc_msgSend(v4, "setMaxActiveTimeAfterLossOfForeground:");
    +[MSServerSideConfigManager doubleValueForParameter:kMSSSCKMaxActiveTimeAfterGlobalResetSync forPersonID:v5 defaultValue:1800.0];
    objc_msgSend(v4, "setMaxActiveTimeAfterGlobalResetSync:");
  }
}

- (NSMutableDictionary)personIDToPowerBudgetMap
{
  personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  if (!personIDToPowerBudgetMap)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_personIDToPowerBudgetMap;
    self->_personIDToPowerBudgetMap = v4;

    personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  }

  return personIDToPowerBudgetMap;
}

- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 timeIntervalSinceNow];
  LODWORD(v4) = vcvtpd_s64_f64(v8 / 86400.0);
  if ((int)v4 > 1)
  {
    v9 = MSMSLocalizedString();
    int v10 = +[NSNumber numberWithInteger:v4];
    v17 = +[NSString stringWithValidatedFormat:v9, @"%@", 0, v10 validFormatSpecifiers error];

    id v11 = MSMSLocalizedString();
    __int16 v12 = MSMSLocalizedString();
    id v13 = +[NSNumber numberWithBool:1];
    id v14 = +[NSNumber numberWithBool:1];
    id v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, kCFUserNotificationAlertHeaderKey, v17, kCFUserNotificationAlertMessageKey, v12, kCFUserNotificationDefaultButtonTitleKey, v13, kCFUserNotificationAlertTopMostKey, v14, SBUserNotificationDontDismissOnUnlock, 0);

    id v16 = +[MSAlertManager sharedAlertManager];
    [v16 displayAlertForPersonID:v6 notificationDict:v15 completionBlock:0];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Received quota excess failure for person ID %@. Next retry date: %{public}@", buf, 0x16u);
  }
}

- (void)pauseManagerDidUnpause:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unpaused.", v4, 2u);
  }
  [(MSIOSMediaStreamDaemon *)self retryOutstandingActivities];
}

- (void)pauseManagerDidPause:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Paused.", v4, 2u);
  }
  [(MSIOSMediaStreamDaemon *)self stopAllActivities];
}

- (BOOL)isWaitingForAuth
{
  v2 = +[MSAuthenticationManager sharedManager];
  unsigned __int8 v3 = [v2 isWaitingForAuth];

  return v3;
}

- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = +[MSAuthenticationManager sharedManager];
  [v4 didEncounterAuthenticationSuccessForPersonID:v3];
}

- (void)didReceiveAuthenticationFailureForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = +[MSAuthenticationManager sharedManager];
  [v4 didEncounterAuthenticationFailureForPersonID:v3];
}

- (void)forgetEverythingForPersonID:(id)a3
{
  id v7 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  if (v7)
  {
    [(MSIOSMediaStreamDaemon *)self forgetPersonID:v7];
    [(MSIOSMediaStreamDaemon *)self _updatePushNotificationTopicsOutListenToProduction:0 outListenToDevelopment:0];
    id v4 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetMap];
    [v4 removeObjectForKey:v7];

    id v5 = [(MSIOSMediaStreamDaemon *)self personIDToPowerBudgetPersistedValuesMap];
    [v5 removeObjectForKey:v7];
  }
  id v6 = +[MSAuthenticationManager sharedManager];
  [v6 rearmAuthenticationAlert];

  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)unpauseForUUID:(id)a3
{
  id v4 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v5 = +[MSPauseManager sharedManager];
  [v5 unpauseUUID:v4];

  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)pauseForUUID:(id)a3
{
  id v4 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v5 = +[MSPauseManager sharedManager];
  [v5 pingPauseUUID:v4];

  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)resetServerStateForPersonID:(id)a3
{
  id v4 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v5 = MSPlatform();
  id v6 = [v5 baseURLForPersonID:v4];
  id v7 = +[MSResetServer resetServerObjectWithPersonID:v4 baseURL:v6];

  [v7 setDaemon:self];
  [v7 resetServer];
  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3
{
}

- (void)serverSideConfigurationForPersonID:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v9 = [(MSIOSMediaStreamDaemon *)self serverSideConfigurationForPersonID:v7];

  double v8 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, kMSCXPCReplyRetval, 0);
  [(MSIOSMediaStreamDaemon *)self releaseBusy];
  v6[2](v6, v8);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v6 = [v5 topic];
  id v7 = [v5 userInfo];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received push notification for invitations topic: %@ userInfo: %@", (uint8_t *)&v9, 0x16u);
  }
  if ([(MSIOSMediaStreamDaemon *)v6 isEqualToString:@"com.apple.mediastream.subscription.push"])
  {
    double v8 = [v7 objectForKey:@"r"];
    [(MSIOSMediaStreamDaemon *)self pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:v8];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    int v10 = self;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Received unknown push notification, ignoring", (uint8_t *)&v9, 0xCu);
  }
  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received new push token.", v7, 2u);
  }
  id v6 = +[MSMSPlatform thePlatform];
  [v6 setPushToken:v5];

  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4
{
  id v7 = MSPlatform();
  id v8 = [v7 subscriberPluginClass];

  int v9 = [v8 personIDForPollingTriggeredByPushNotification];
  if ([v9 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "personID waiting for push: %@", (uint8_t *)&v13, 0xCu);
    }
    int v10 = MSPlatform();
    unsigned __int8 v11 = [v10 personIDUsesProductionPushEnvironment:v9];
    char v12 = v11 ^ 1;

    if (a4) {
LABEL_5:
    }
      *a4 = v12;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The subscription plugin class does not support push notification refreshing.", (uint8_t *)&v13, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Not listening to push notifications.", (uint8_t *)&v13, 2u);
    }
    [self->_prodAPSConnection _setEnabledTopics:0];
    [self->_devAPSConnection _setEnabledTopics:0];
    unsigned __int8 v11 = 0;
    char v12 = 0;
    if (a4) {
      goto LABEL_5;
    }
  }
  if (a3) {
    *a3 = v11;
  }
}

- (void)deleteAssetCollections:(id)a3 personID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  [(MSIOSMediaStreamDaemon *)self deleteAssetCollections:v7 forPersonID:v6];

  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v15 = 0;
  id v11 = [(MSIOSMediaStreamDaemon *)self dequeueAssetCollectionWithGUIDs:v10 personID:v9 outError:&v15];

  id v12 = v15;
  int v13 = +[NSNumber numberWithBool:v11];
  id v14 = +[NSMutableDictionary dictionaryWithObject:v13 forKey:kMSCXPCReplyRetval];

  if (v12) {
    [v14 setObject:v12 forKey:kMSCXPCReplyError];
  }
  [(MSIOSMediaStreamDaemon *)self releaseBusy];
  v8[2](v8, v14);
}

- (void)enqueueAssetCollections:(id)a3 personID:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v15 = 0;
  id v11 = [(MSIOSMediaStreamDaemon *)self enqueueAssetCollection:v10 personID:v9 outError:&v15];

  id v12 = v15;
  int v13 = +[NSNumber numberWithBool:v11];
  id v14 = +[NSMutableDictionary dictionaryWithObject:v13 forKey:kMSCXPCReplyRetval];

  if (v12) {
    [v14 setObject:v12 forKey:kMSCXPCReplyError];
  }
  [(MSIOSMediaStreamDaemon *)self releaseBusy];
  v8[2](v8, v14);
}

- (void)stop
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MSIOSMediaStreamDaemon;
  [(MSIOSMediaStreamDaemon *)&v4 stop];
}

- (void)start
{
  [(MSIOSMediaStreamDaemon *)self retainBusy];
  id v3 = objc_alloc((Class)APSConnection);
  objc_super v4 = (APSConnection *)[v3 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.mediastream.mstreamd.push-prod" queue:&_dispatch_main_q];
  p_prodAPSConnection = &self->_prodAPSConnection;
  prodAPSConnection = self->_prodAPSConnection;
  self->_prodAPSConnection = v4;

  id v7 = objc_alloc((Class)APSConnection);
  id v8 = (APSConnection *)[v7 initWithEnvironmentName:APSEnvironmentDevelopment namedDelegatePort:@"com.apple.mediastream.mstreamd.push-dev" queue:&_dispatch_main_q];
  devAPSConnection = self->_devAPSConnection;
  self->_devAPSConnection = v8;

  __int16 v32 = 0;
  [(MSIOSMediaStreamDaemon *)self _updatePushNotificationTopicsOutListenToProduction:(char *)&v32 + 1 outListenToDevelopment:&v32];
  if (HIBYTE(v32) || (p_prodAPSConnection = &self->_devAPSConnection, (_BYTE)v32))
  {
    id v10 = *p_prodAPSConnection;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created APS connection %{public}@", buf, 0xCu);
      }
      [(APSConnection *)v10 setDelegate:self];
      CFStringRef v35 = @"com.apple.mediastream.subscription.push";
      id v11 = +[NSArray arrayWithObjects:&v35 count:1];
      [(APSConnection *)v10 _setEnabledTopics:v11];

      id v12 = [(APSConnection *)v10 publicToken];
      int v13 = +[MSMSPlatform thePlatform];
      [v13 setPushToken:v12];

      if (v12)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v34 = v12;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Retrieved push tokens %{public}@.", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v34 = v32;
          *(_WORD *)&v34[4] = 1024;
          *(_DWORD *)&v34[6] = HIBYTE(v32);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Push tokens not available. Dev: %d, Prod: %d. Waiting...", buf, 0xEu);
        }
        id v14 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
        while (1)
        {
          id v15 = +[MSMSPlatform thePlatform];
          id v16 = [v15 pushToken];
          if (v16) {
            break;
          }
          v17 = +[NSDate date];
          [v17 timeIntervalSinceDate:v14];
          double v19 = v18;

          if (v19 < 0.0)
          {
            __int16 v20 = +[NSRunLoop currentRunLoop];
            unsigned __int8 v21 = [v20 runMode:NSDefaultRunLoopMode beforeDate:v14];

            if (v21) {
              continue;
            }
          }
          goto LABEL_20;
        }

LABEL_20:
        v22 = +[MSMSPlatform thePlatform];
        id v23 = [v22 pushToken];

        if (v23)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            if (HIBYTE(v32)) {
              CFStringRef v24 = @"Prod";
            }
            else {
              CFStringRef v24 = @"Dev";
            }
            *(_DWORD *)buf = 138543362;
            *(void *)v34 = v24;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Retrieved push tokens. %{public}@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not retrieve push token even after waiting for it.", buf, 2u);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "My Photo stream not enabled, not listening to any push notifications.", buf, 2u);
    }
    id v10 = 0;
  }
  v25 = +[NSNotificationCenter defaultCenter];
  uint64_t v26 = kMSAuthenticationManagerDidReceiveAuthenticationChangeNotification;
  v27 = +[MSAuthenticationManager sharedManager];
  v28 = +[NSOperationQueue mainQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000081D4;
  v31[3] = &unk_100018AD0;
  v31[4] = self;
  id v29 = [v25 addObserverForName:v26 object:v27 queue:v28 usingBlock:v31];

  v30.receiver = self;
  v30.super_class = (Class)MSIOSMediaStreamDaemon;
  [(MSIOSMediaStreamDaemon *)&v30 start];
  [(MSIOSMediaStreamDaemon *)self releaseBusy];
}

- (void)didUnidle
{
  id v3 = +[MSPowerAssertionManager sharedManager];
  [v3 retainBusy];

  v4.receiver = self;
  v4.super_class = (Class)MSIOSMediaStreamDaemon;
  [(MSIOSMediaStreamDaemon *)&v4 didUnidle];
}

- (void)didIdle
{
  id v3 = +[MSPowerAssertionManager sharedManager];
  [v3 releaseBusy];
  [v3 toggleAssertion];
  v4.receiver = self;
  v4.super_class = (Class)MSIOSMediaStreamDaemon;
  [(MSIOSMediaStreamDaemon *)&v4 didIdle];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.mediastream.mstreamd-access"];
  id v7 = v6;
  if (v6 && [v6 BOOLValue])
  {
    [v5 setExportedObject:self];
    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDaemonProtocols];
    uint64_t v19 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    [v8 setClasses:v16 forSelector:"enqueueAssetCollections:personID:reply:" argumentIndex:0 ofReply:0];
    [v8 setClasses:v16 forSelector:"dequeueAssetCollectionWithGUIDs:personID:reply:" argumentIndex:0 ofReply:0];
    [v8 setClasses:v16 forSelector:"deleteAssetCollections:personID:" argumentIndex:0 ofReply:0];
    [v5 setExportedInterface:v8];
    [v5 _setQueue:&_dispatch_main_q];
    [v5 resume];

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  id v3 = +[MSPauseManager sharedManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)MSIOSMediaStreamDaemon;
  [(MSIOSMediaStreamDaemon *)&v4 dealloc];
}

- (MSIOSMediaStreamDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)MSIOSMediaStreamDaemon;
  v2 = [(MSIOSMediaStreamDaemon *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSXPCListener);
    objc_super v4 = (NSXPCListener *)[v3 initWithMachServiceName:kMSMachServiceName];
    center = v2->_center;
    v2->_center = v4;

    [(NSXPCListener *)v2->_center setDelegate:v2];
    [(NSXPCListener *)v2->_center resume];
    id v6 = +[MSPauseManager sharedManager];
    [v6 setDelegate:v2];

    id v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = kMSBatteryPowerMonitorExternalPowerSourceChangedNotification;
    uint64_t v9 = +[NSOperationQueue mainQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000086DC;
    v14[3] = &unk_100018AD0;
    uint64_t v10 = v2;
    uint64_t v15 = v10;
    id v11 = [v7 addObserverForName:v8 object:0 queue:v9 usingBlock:v14];

    uint64_t v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v10 selector:"_serverSideConfigurationDidChange:" name:kMSServerSideConfigChangedNotification object:0];
  }
  return v2;
}

@end