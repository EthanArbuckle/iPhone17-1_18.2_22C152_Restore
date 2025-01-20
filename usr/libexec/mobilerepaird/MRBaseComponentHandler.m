@interface MRBaseComponentHandler
+ (id)getHwRevision;
+ (void)handleComponentSUCase:(id)a3 lastAUthCheckBuildVersion:(id)a4 followUpItemID:(id)a5 queryString:(id)a6 suCasekey:(id)a7 startBuildVersion:(id)a8 componentAuth:(id)a9;
- (BOOL)clearStateFile:(BOOL *)a3;
- (BOOL)disableUIForComponent;
- (BOOL)displayFollowup;
- (BOOL)displayModalPopup;
- (BOOL)displayNotification;
- (BOOL)isSUCaseForComponent;
- (BOOL)legacyPopup;
- (BOOL)notifyServer;
- (BOOL)supportsRepair;
- (BOOL)unlockCheckActivityRequired;
- (MRBaseComponentHandler)init;
- (NSString)componentDataCollectionPresentedKey;
- (NSString)componentEnableNonAuthUIKey;
- (NSString)componentFirstUIDisplayedTimeKey;
- (NSString)componentFollowupClientID;
- (NSString)componentForceKey;
- (NSString)componentHasDisplayedFollowUpKey;
- (NSString)componentHasNotifiedServerKey;
- (NSString)componentLastCheckTimeKey;
- (NSString)componentName;
- (NSString)componentNtwkActivityName;
- (NSString)componentRetriggerCountKey;
- (NSString)componentSUCaseKey;
- (NSString)componentStatusKey;
- (NSString)componentUnLockCheckCountKey;
- (NSString)componentUnlockCheckerActivityName;
- (NSString)finishRepairKey;
- (NSString)finishRepairMessage;
- (NSString)finishRepairTitle;
- (NSString)followUpInfoMessage;
- (NSString)lastKnownComponentIdentifierKey;
- (NSString)lastKnownComponentIdentifierValue;
- (NSString)popUpNotificationMessage;
- (NSString)popUpNotificationTitle;
- (NSString)stateFilePath;
- (NSURL)linkedSensitiveURL;
- (double)timeIntervalOverride;
- (id)componentAuthHandler;
- (id)createCriteriaForUnlockCheckerWithInterval:(double)a3;
- (int)componentFollowupRetriggerdays;
- (int)componentfollowUpDisplaydays;
- (int)deviceClass;
- (int64_t)componentId;
- (void)checkInAndHandleAuthStatus;
- (void)clearNSUserDefaults;
- (void)clearRepairFollowUp;
- (void)createFinishRepairFollowUpWithNotification:(BOOL)a3;
- (void)createRepairFollowUp;
- (void)mainNonAuthRepairFlow;
- (void)popUpNotificationNowWithMessage;
- (void)scheduleNetworkActivity;
- (void)scheduleUnlockCheckerActivity:(double)a3 forFinishRepair:(BOOL)a4;
- (void)sendAnalyticsForCount:(int64_t)a3;
- (void)setComponentAuthHandler:(id)a3;
- (void)setComponentDataCollectionPresentedKey:(id)a3;
- (void)setComponentEnableNonAuthUIKey:(id)a3;
- (void)setComponentFirstUIDisplayedTimeKey:(id)a3;
- (void)setComponentFollowupClientID:(id)a3;
- (void)setComponentFollowupRetriggerdays:(int)a3;
- (void)setComponentForceKey:(id)a3;
- (void)setComponentHasDisplayedFollowUpKey:(id)a3;
- (void)setComponentHasNotifiedServerKey:(id)a3;
- (void)setComponentId:(int64_t)a3;
- (void)setComponentLastCheckTimeKey:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentNtwkActivityName:(id)a3;
- (void)setComponentRetriggerCountKey:(id)a3;
- (void)setComponentSUCaseKey:(id)a3;
- (void)setComponentStatusKey:(id)a3;
- (void)setComponentUnLockCheckCountKey:(id)a3;
- (void)setComponentUnlockCheckerActivityName:(id)a3;
- (void)setComponentfollowUpDisplaydays:(int)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDisableUIForComponent:(BOOL)a3;
- (void)setDisplayFollowup:(BOOL)a3;
- (void)setDisplayModalPopup:(BOOL)a3;
- (void)setDisplayNotification:(BOOL)a3;
- (void)setFinishRepairKey:(id)a3;
- (void)setFinishRepairMessage:(id)a3;
- (void)setFinishRepairTitle:(id)a3;
- (void)setFollowUpInfoMessage:(id)a3;
- (void)setIsSUCaseForComponent:(BOOL)a3;
- (void)setLastKnownComponentIdentifierKey:(id)a3;
- (void)setLastKnownComponentIdentifierValue:(id)a3;
- (void)setLegacyPopup:(BOOL)a3;
- (void)setLinkedSensitiveURL:(id)a3;
- (void)setNotifyServer:(BOOL)a3;
- (void)setPopUpNotificationMessage:(id)a3;
- (void)setPopUpNotificationTitle:(id)a3;
- (void)setStateFilePath:(id)a3;
- (void)setSupportsRepair:(BOOL)a3;
- (void)setTimeIntervalOverride:(double)a3;
- (void)setUnlockCheckActivityRequired:(BOOL)a3;
- (void)unlockCheckerActivityBody;
- (void)unlockCheckerActivityBodyForFinishRepair;
@end

@implementation MRBaseComponentHandler

- (MRBaseComponentHandler)init
{
  v21.receiver = self;
  v21.super_class = (Class)MRBaseComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v2[21] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    v4 = (void *)*((void *)v2 + 24);
    *((void *)v2 + 24) = 0;

    *(void *)(v3 + 28) = 0xF00000005;
    *((_WORD *)v3 + 11) = 1;
    v3[16] = 1;
    v5 = (void *)*((void *)v3 + 27);
    *((void *)v3 + 27) = 0;

    v3[24] = 0;
    v6 = (void *)*((void *)v3 + 20);
    *((void *)v3 + 20) = 0;

    v7 = (void *)*((void *)v3 + 29);
    *((void *)v3 + 29) = 0;

    v8 = (void *)*((void *)v3 + 31);
    *((void *)v3 + 31) = 0;

    v9 = (void *)*((void *)v3 + 30);
    *((void *)v3 + 30) = 0;

    v10 = (void *)MGCopyAnswer();
    *((_DWORD *)v3 + 9) = [v10 intValue];

    v11 = +[NSUserDefaults standardUserDefaults];
    [v11 doubleForKey:@"timeIntervalOverride"];
    double v13 = v12;

    unsigned __int8 has_internal_content = os_variant_has_internal_content();
    double v15 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
    if ((has_internal_content & (v13 != 0.0)) != 0) {
      double v15 = v13;
    }
    *((double *)v3 + 22) = v15;
    v16 = handleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *((void *)v3 + 22);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "the XPC time internal will be %f", buf, 0xCu);
    }

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mobilerepaird.asyncqueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    v19 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v18;
  }
  return (MRBaseComponentHandler *)v3;
}

- (void)createRepairFollowUp
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    __int16 v10 = 2080;
    v11 = "-[MRBaseComponentHandler createRepairFollowUp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if (self->displayFollowup)
  {
    v5 = +[MRUINotificationHelper sharedSingleton];
    [v5 createRepairFollowUpWithNotification:self->displayNotification actionURL:self->linkedSensitiveURL repairTitle:self->popUpNotificationTitle infoText:self->followUpInfoMessage itemID:self->componentFollowupClientID timeInterval:self->componentName componentName:self->timeIntervalOverride];
  }
  else
  {
    v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(MRBaseComponentHandler *)self componentName];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] followup skipped", "-[MRBaseComponentHandler createRepairFollowUp]");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
  }
}

- (void)createFinishRepairFollowUpWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    double v15 = v6;
    __int16 v16 = 2080;
    uint64_t v17 = "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if (self->displayFollowup)
  {
    v7 = +[MRUINotificationHelper sharedSingleton];
    v8 = +[NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE"];
    v9 = +[NSURL URLWithString:v8];
    __int16 v10 = [(MRBaseComponentHandler *)self finishRepairTitle];
    v11 = [(MRBaseComponentHandler *)self finishRepairMessage];
    [v7 createRepairFollowUpWithNotification:v3 actionURL:v9 repairTitle:v10 infoText:v11 itemID:self->finishRepairKey timeInterval:self->componentName componentName:0.0];
  }
  else
  {
    v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(MRBaseComponentHandler *)self componentName];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] followup skipped", "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]");
      double v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      double v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
  }
}

- (void)clearRepairFollowUp
{
  BOOL v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    __int16 v12 = 2080;
    double v13 = "-[MRBaseComponentHandler clearRepairFollowUp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  v5 = +[MRUINotificationHelper sharedSingleton];
  [v5 clearRepairFollowUpForClientID:self->componentFollowupClientID];

  if (self->finishRepairKey)
  {
    v6 = +[MRUINotificationHelper sharedSingleton];
    [v6 clearRepairFollowUpForClientID:self->finishRepairKey];

    id v7 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Preferences"];
    finishRepairKey = self->finishRepairKey;
    v8 = +[NSArray arrayWithObjects:&finishRepairKey count:1];
    [v7 removeDeliveredNotificationsWithIdentifiers:v8];
  }
}

- (BOOL)clearStateFile:(BOOL *)a3
{
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    __int16 v23 = 2080;
    v24 = "-[MRBaseComponentHandler clearStateFile:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  id v7 = +[NSFileManager defaultManager];
  unsigned int v8 = [v7 fileExistsAtPath:self->stateFilePath];

  if (!v8)
  {
    id v12 = 0;
LABEL_10:
    BOOL v14 = 1;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = v8;
    goto LABEL_12;
  }
  v9 = +[NSFileManager defaultManager];
  stateFilePath = self->stateFilePath;
  id v20 = 0;
  unsigned __int8 v11 = [v9 removeItemAtPath:stateFilePath error:&v20];
  id v12 = v20;

  if (v11) {
    goto LABEL_10;
  }
  double v13 = handleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = [(MRBaseComponentHandler *)self componentName];
    uint64_t v17 = self->stateFilePath;
    dispatch_queue_t v18 = [v12 localizedDescription];
    v19 = +[NSString stringWithFormat:@"remove item at path %@ failed: %@", v17, v18];
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%@][%@]", buf, 0x16u);
  }
  BOOL v14 = 0;
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

- (void)clearNSUserDefaults
{
  BOOL v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    int v7 = 138412546;
    unsigned int v8 = v4;
    __int16 v9 = 2080;
    __int16 v10 = "-[MRBaseComponentHandler clearNSUserDefaults]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", (uint8_t *)&v7, 0x16u);
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:self->componentUnLockCheckCountKey];
  [v5 removeObjectForKey:self->componentLastCheckTimeKey];
  [v5 removeObjectForKey:self->componentHasDisplayedFollowUpKey];
  [v5 removeObjectForKey:self->componentFirstUIDisplayedTimeKey];
  [v5 removeObjectForKey:self->componentSUCaseKey];
  [v5 removeObjectForKey:self->componentRetriggerCountKey];
  if (self->componentHasNotifiedServerKey) {
    [v5 removeObjectForKey:];
  }
  [v5 removeObjectForKey:self->finishRepairKey];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForBluetooth"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForWifi"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForBaseband"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForNFC"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForUWB"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForAudio"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForTrueDepthIR"];
  [v5 synchronize];
  id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  [v6 removeObjectForKey:self->componentFollowupClientID];

  [(MRBaseComponentHandler *)self clearStateFile:0];
}

- (void)popUpNotificationNowWithMessage
{
  BOOL v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v11 = v4;
    __int16 v12 = 2080;
    double v13 = "-[MRBaseComponentHandler popUpNotificationNowWithMessage]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if (![(MRBaseComponentHandler *)self displayModalPopup])
  {
    int v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(MRBaseComponentHandler *)self componentName];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] SU case skipped popup", "-[MRBaseComponentHandler popUpNotificationNowWithMessage]");
      __int16 v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v11 = v8;
      __int16 v12 = 2112;
      double v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    goto LABEL_9;
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"settingsView"];

  if (!v6 || self->legacyPopup)
  {
    int v7 = +[MRUINotificationHelper sharedSingleton];
    [v7 popUpNotificationNowWithMessage:self->popUpNotificationMessage title:self->popUpNotificationTitle openSensitiveURL:self->linkedSensitiveURL componentName:self->componentName legacyPopup:self->legacyPopup];
LABEL_9:
  }
}

- (void)scheduleNetworkActivity
{
  BOOL v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    unsigned int v8 = v4;
    __int16 v9 = 2080;
    __int16 v10 = "-[MRBaseComponentHandler scheduleNetworkActivity]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  v5 = [(NSString *)self->componentNtwkActivityName UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000675C;
  handler[3] = &unk_100018620;
  handler[4] = self;
  xpc_activity_register(v5, XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)unlockCheckerActivityBody
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
  v5 = (char *)[v3 integerForKey:v4];

  unsigned int v6 = [(MRBaseComponentHandler *)self componentHasNotifiedServerKey];
  unsigned int v7 = [v3 BOOLForKey:v6];

  if ([v3 BOOLForKey:self->componentDataCollectionPresentedKey]) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = ![(MRBaseComponentHandler *)self notifyServer];
  }
  char v41 = 0;
  __int16 v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  [v3 doubleForKey:self->componentLastCheckTimeKey];
  double v13 = (double)(uint64_t)(v11 - v12);
  if (self->timeIntervalOverride <= v13) {
    double timeIntervalOverride = v13;
  }
  else {
    double timeIntervalOverride = self->timeIntervalOverride;
  }
  double v15 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
  __int16 v16 = (char *)[v3 integerForKey:v15];

  id v17 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  id v18 = [v17 integerForKey:self->componentFollowupClientID];

  if ((uint64_t)v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
  {
    ++v5;
    v19 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
    [v3 setInteger:v5 forKey:v19];

    id v20 = [(MRBaseComponentHandler *)self componentLastCheckTimeKey];
    [v3 setDouble:v20 forKey:v11];

    [v3 synchronize];
  }
  objc_super v21 = handleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(MRBaseComponentHandler *)self componentName];
    __int16 v23 = +[NSString stringWithFormat:@"Set count main body:%ld", v5];
    *(_DWORD *)buf = 138412546;
    v43 = v22;
    __int16 v44 = 2112;
    v45 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  unsigned int v24 = [(MRBaseComponentHandler *)self isSUCaseForComponent];
  signed int v25 = [(MRBaseComponentHandler *)self componentfollowUpDisplaydays];
  if (!v24)
  {
    if (v5 != (char *)v25) {
      goto LABEL_25;
    }
    v31 = handleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(MRBaseComponentHandler *)self componentName];
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] handling clear all followup", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      *(_DWORD *)buf = 138412546;
      v43 = v32;
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self clearRepairFollowUp];
    [(MRBaseComponentHandler *)self clearStateFile:0];
    v30 = v5;
    goto LABEL_24;
  }
  if ((uint64_t)v5 >= v25) {
    unsigned int v26 = v8;
  }
  else {
    unsigned int v26 = 0;
  }
  if (v26 == 1)
  {
    v27 = handleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(MRBaseComponentHandler *)self componentName];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] SU handling clear all followup", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      *(_DWORD *)buf = 138412546;
      v43 = v28;
      __int16 v44 = 2112;
      v45 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self clearRepairFollowUp];
    [(MRBaseComponentHandler *)self clearStateFile:&v41];
    if (v41)
    {
      v30 = (char *)[(MRBaseComponentHandler *)self componentfollowUpDisplaydays];
LABEL_24:
      [(MRBaseComponentHandler *)self sendAnalyticsForCount:v30];
    }
  }
LABEL_25:
  if (v18)
  {
    if ((uint64_t)v16 <= [(MRBaseComponentHandler *)self componentFollowupRetriggerdays])
    {
      ++v16;
      v34 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
      [v3 setInteger:v16 forKey:v34];
    }
    if (v16 == (char *)[(MRBaseComponentHandler *)self componentFollowupRetriggerdays]
      && (uint64_t)v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
    {
      v35 = handleForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(MRBaseComponentHandler *)self componentName];
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] handling followup retrigger", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
        *(_DWORD *)buf = 138412546;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [(MRBaseComponentHandler *)self clearRepairFollowUp];
      [(MRBaseComponentHandler *)self setDisplayNotification:0];
      [(MRBaseComponentHandler *)self createRepairFollowUp];
    }
  }
  if ((([(MRBaseComponentHandler *)self notifyServer] & v8 ^ 1 | v7) & 1) == 0)
  {
    v38 = handleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [(MRBaseComponentHandler *)self componentName];
      v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] Scheduling network activity", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      *(_DWORD *)buf = 138412546;
      v43 = v39;
      __int16 v44 = 2112;
      v45 = v40;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self scheduleNetworkActivity];
  }
  if ((uint64_t)v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays]
    || (![(MRBaseComponentHandler *)self notifyServer] | v7) != 1
    || ((![(MRBaseComponentHandler *)self isSUCaseForComponent] | v8) & 1) == 0)
  {
    [(MRBaseComponentHandler *)self scheduleUnlockCheckerActivity:0 forFinishRepair:self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride)];
  }
}

- (void)unlockCheckerActivityBodyForFinishRepair
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
  v5 = (char *)[v3 integerForKey:v4];

  unsigned int v6 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
  unsigned int v7 = (char *)[v3 integerForKey:v6];

  id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  id v9 = [v8 integerForKey:@"clearFinishRepairFollowup"];

  double v10 = +[NSDate date];
  [v10 timeIntervalSince1970];
  double v12 = v11;

  [v3 doubleForKey:self->componentLastCheckTimeKey];
  double v14 = (double)(uint64_t)(v12 - v13);
  if (self->timeIntervalOverride <= v14) {
    double timeIntervalOverride = v14;
  }
  else {
    double timeIntervalOverride = self->timeIntervalOverride;
  }
  if ((uint64_t)v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
  {
    ++v5;
    __int16 v16 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
    [v3 setInteger:v5 forKey:v16];

    id v17 = [(MRBaseComponentHandler *)self componentLastCheckTimeKey];
    [v3 setDouble:v17 forKey:v12];
  }
  id v18 = handleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(MRBaseComponentHandler *)self componentName];
    id v20 = +[NSString stringWithFormat:@"Set count FinishRepair:%ld", v5];
    *(_DWORD *)buf = 138412546;
    v32 = v19;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  objc_super v21 = handleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(MRBaseComponentHandler *)self componentName];
    __int16 v23 = +[NSString stringWithFormat:@"Retigger count:%ld", v7];
    *(_DWORD *)buf = 138412546;
    v32 = v22;
    __int16 v33 = 2112;
    v34 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  if ((uint64_t)v5 >= [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
  {
    unsigned int v24 = handleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      signed int v25 = [(MRBaseComponentHandler *)self componentName];
      unsigned int v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] handling clear all followup", "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      __int16 v33 = 2112;
      v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self clearRepairFollowUp];
    [(MRBaseComponentHandler *)self sendAnalyticsForCount:v5];
  }
  if (v9)
  {
    if ((uint64_t)v7 <= [(MRBaseComponentHandler *)self componentFollowupRetriggerdays])
    {
      ++v7;
      v27 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
      [v3 setInteger:v7 forKey:v27];
    }
    if (v7 == (char *)[(MRBaseComponentHandler *)self componentFollowupRetriggerdays]
      && (uint64_t)v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
    {
      v28 = handleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(MRBaseComponentHandler *)self componentName];
        v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] handling followup retrigger", "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
        *(_DWORD *)buf = 138412546;
        v32 = v29;
        __int16 v33 = 2112;
        v34 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [(MRBaseComponentHandler *)self clearRepairFollowUp];
      [(MRBaseComponentHandler *)self createFinishRepairFollowUpWithNotification:0];
    }
  }
  if ((uint64_t)v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays]) {
    [(MRBaseComponentHandler *)self scheduleUnlockCheckerActivity:1 forFinishRepair:self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride)];
  }
}

- (id)createCriteriaForUnlockCheckerWithInterval:(double)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, (uint64_t)a3);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);

  return v4;
}

- (void)scheduleUnlockCheckerActivity:(double)a3 forFinishRepair:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    __int16 v16 = v8;
    __int16 v17 = 2080;
    id v18 = "-[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if ([(MRBaseComponentHandler *)self unlockCheckActivityRequired])
  {
    id v9 = [(MRBaseComponentHandler *)self componentUnlockCheckerActivityName];
    double v10 = (const char *)[v9 UTF8String];
    if (v4)
    {
      double v11 = (double *)v14;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      double v12 = sub_100007978;
    }
    else
    {
      double v11 = (double *)v13;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      double v12 = sub_1000079F4;
    }
    *((void *)v11 + 2) = v12;
    *((void *)v11 + 3) = &unk_100018648;
    *((void *)v11 + 4) = self;
    v11[5] = a3;
    xpc_activity_register(v10, XPC_ACTIVITY_CHECK_IN, v11);
  }
}

- (void)mainNonAuthRepairFlow
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(MRBaseComponentHandler *)v2 componentName];
    *(_DWORD *)buf = 138412546;
    id v41 = v4;
    __int16 v42 = 2080;
    v43 = "-[MRBaseComponentHandler mainNonAuthRepairFlow]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MRBaseComponentHandler *)v2 componentName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] component non authentic", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
    unsigned int v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v41 = v6;
    __int16 v42 = 2112;
    v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  id v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = [(MRBaseComponentHandler *)v2 componentUnLockCheckCountKey];
  id v10 = [v8 integerForKey:v9];

  double v11 = +[NSUserDefaults standardUserDefaults];
  double v12 = [v11 stringForKey:v2->lastKnownComponentIdentifierKey];

  double v13 = +[NSUserDefaults standardUserDefaults];
  LODWORD(v11) = [v13 BOOLForKey:@"ForceDisableUIFlowForInternalBuild"];

  if ((os_variant_has_internal_content() & v11 & 1) != 0 || v2->disableUIForComponent)
  {
    [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
    [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
  }
  else
  {
    if ((uint64_t)v10 >= [(MRBaseComponentHandler *)v2 componentfollowUpDisplaydays]
      && v12
      && v2->lastKnownComponentIdentifierValue
      && (objc_msgSend(v12, "isEqualToString:") & 1) == 0)
    {
      v2->displayNotification = 1;
      *(_WORD *)&v2->displayModalPopup = 1;
      [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
    }
    double v14 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v15 = [v14 BOOLForKey:v2->componentHasDisplayedFollowUpKey];
    unsigned int v16 = [v14 BOOLForKey:v2->componentHasNotifiedServerKey];
    unsigned int v17 = [v14 BOOLForKey:v2->componentDataCollectionPresentedKey];
    id v18 = +[NSDate date];
    [v18 timeIntervalSince1970];
    double v20 = v19;

    objc_super v21 = [(MRBaseComponentHandler *)v2 componentRetriggerCountKey];
    id v22 = [v14 integerForKey:v21];

    if (v15)
    {
      id v23 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      id v24 = [v23 integerForKey:v2->componentFollowupClientID];

      if (v24
        && (!v22
         || (uint64_t)v22 >= [(MRBaseComponentHandler *)v2 componentFollowupRetriggerdays]&& v24 == (id)2))
      {
        [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
      }
      signed int v25 = handleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [(MRBaseComponentHandler *)v2 componentName];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] handling xpc/reboot case", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v41 = v26;
        __int16 v42 = 2112;
        v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [v14 doubleForKey:v2->componentLastCheckTimeKey];
      double v29 = (double)(uint64_t)(v20 - v28);
      if (v2->timeIntervalOverride <= v29)
      {
        [(MRBaseComponentHandler *)v2 unlockCheckerActivityBody];
      }
      else
      {
        v30 = handleForCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [(MRBaseComponentHandler *)v2 componentName];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] scheduling unlock checker activity Interval:%f ", "-[MRBaseComponentHandler mainNonAuthRepairFlow]", v2->timeIntervalOverride - v29);
          v32 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v41 = v31;
          __int16 v42 = 2112;
          v43 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
        }
        [(MRBaseComponentHandler *)v2 scheduleUnlockCheckerActivity:0 forFinishRepair:v2->timeIntervalOverride - v29];
      }
      if ((([(MRBaseComponentHandler *)v2 notifyServer] & v17 ^ 1 | v16) & 1) == 0) {
        [(MRBaseComponentHandler *)v2 scheduleNetworkActivity];
      }
    }
    else
    {
      __int16 v33 = handleForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [(MRBaseComponentHandler *)v2 componentName];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] starting Followup and notification", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
        v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v41 = v34;
        __int16 v42 = 2112;
        v43 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
      [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
      [(MRBaseComponentHandler *)v2 createRepairFollowUp];
      [(MRBaseComponentHandler *)v2 popUpNotificationNowWithMessage];
      [v14 setBool:1 forKey:v2->componentHasDisplayedFollowUpKey];
      [v14 setInteger:(uint64_t)v20 forKey:v2->componentFirstUIDisplayedTimeKey];
      lastKnownComponentIdentifierValue = v2->lastKnownComponentIdentifierValue;
      if (lastKnownComponentIdentifierValue) {
        [v14 setObject:lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
      }
      [v14 synchronize];
      [(MRBaseComponentHandler *)v2 sendAnalyticsForCount:0];
      if ((([(MRBaseComponentHandler *)v2 notifyServer] & v17 ^ 1 | v16) & 1) == 0)
      {
        v37 = handleForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = [(MRBaseComponentHandler *)v2 componentName];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] Scheduling network activity", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
          v39 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v41 = v38;
          __int16 v42 = 2112;
          v43 = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
        }
        [(MRBaseComponentHandler *)v2 scheduleNetworkActivity];
      }
      [(MRBaseComponentHandler *)v2 scheduleUnlockCheckerActivity:0 forFinishRepair:v2->timeIntervalOverride];
    }
  }
  objc_sync_exit(v2);
}

- (void)checkInAndHandleAuthStatus
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = (unint64_t)[v2->componentAuthHandler copyComponentStatus];
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:v2->finishRepairKey];

  id v6 = +[NSDate date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  id v9 = +[NSUserDefaults standardUserDefaults];
  id v10 = [(MRBaseComponentHandler *)v2 componentRetriggerCountKey];
  id v11 = [v9 integerForKey:v10];

  double v12 = +[NSUserDefaults standardUserDefaults];
  unsigned int v13 = [v12 BOOLForKey:v2->componentHasDisplayedFollowUpKey];

  double v14 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v15 = [v14 stringForKey:v2->lastKnownComponentIdentifierKey];

  if (v3 == 1)
  {
    [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
    [(MRBaseComponentHandler *)v2 sendAnalyticsForCount:0x7FFFFFFFFFFFFFFFLL];
    [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
  }
  else if (v3)
  {
    if (v3 == -3)
    {
      if (v2->lastKnownComponentIdentifierValue)
      {
        unsigned int v16 = +[NSUserDefaults standardUserDefaults];
        [v16 setObject:v2->lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
      }
      if (v13)
      {
        [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
        [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
        -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](v2, "createFinishRepairFollowUpWithNotification:", [v15 isEqualToString:v2->lastKnownComponentIdentifierValue] ^ 1);
        if (v2->lastKnownComponentIdentifierValue)
        {
          unsigned int v17 = +[NSUserDefaults standardUserDefaults];
          [v17 setObject:v2->lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
        }
LABEL_31:
        v36 = +[NSUserDefaults standardUserDefaults];
        [v36 setBool:1 forKey:v2->finishRepairKey];

        id v37 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
        [v37 removeObjectForKey:@"clearFinishRepairFollowup"];

        goto LABEL_32;
      }
      if (!v5 || ([v15 isEqualToString:v2->lastKnownComponentIdentifierValue] & 1) == 0)
      {
        [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
        [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
        [(MRBaseComponentHandler *)v2 createFinishRepairFollowUpWithNotification:1];
        if (v2->lastKnownComponentIdentifierValue)
        {
          v35 = +[NSUserDefaults standardUserDefaults];
          [v35 setObject:v2->lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
        }
        goto LABEL_31;
      }
      id v23 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      id v24 = [v23 integerForKey:@"clearFinishRepairFollowup"];

      if (v24
        && (!v11
         || (uint64_t)v11 >= [(MRBaseComponentHandler *)v2 componentFollowupRetriggerdays]&& v24 == (id)2))
      {
        signed int v25 = +[MRUINotificationHelper sharedSingleton];
        [v25 clearRepairFollowUpForClientID:v2->finishRepairKey];

        id v26 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Preferences"];
        finishRepairKey = v2->finishRepairKey;
        v27 = +[NSArray arrayWithObjects:&finishRepairKey count:1];
        [v26 removeDeliveredNotificationsWithIdentifiers:v27];
      }
      double v28 = +[NSUserDefaults standardUserDefaults];
      [v28 doubleForKey:v2->componentLastCheckTimeKey];
      double v30 = v29;

      double v31 = (double)(uint64_t)(v8 - v30);
      if (v2->timeIntervalOverride <= v31)
      {
        [(MRBaseComponentHandler *)v2 unlockCheckerActivityBodyForFinishRepair];
      }
      else
      {
        v32 = handleForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [(MRBaseComponentHandler *)v2 componentName];
          id v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] scheduling finish repair unlock checker activity Interval:%f ", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]", v2->timeIntervalOverride - v31);
          *(_DWORD *)buf = 138412546;
          id v42 = v33;
          __int16 v43 = 2112;
          __int16 v44 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
        }
        [(MRBaseComponentHandler *)v2 scheduleUnlockCheckerActivity:1 forFinishRepair:v2->timeIntervalOverride - v31];
      }
    }
    else if ((v3 & 0x8000000000000000) != 0)
    {
      objc_super v21 = handleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [(MRBaseComponentHandler *)v2 componentName];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] IOREG Component Non authentic", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]");
        objc_claimAutoreleasedReturnValue();
        sub_10000FA18();
      }

      [(MRBaseComponentHandler *)v2 mainNonAuthRepairFlow];
    }
  }
  else
  {
    id v18 = handleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(MRBaseComponentHandler *)v2 componentName];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] IOREG Auth Component Not Populated", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]");
      objc_claimAutoreleasedReturnValue();
      sub_10000FA18();
    }

    objc_initWeak(&location, v2);
    asyncQueue = v2->asyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008884;
    block[3] = &unk_100018670;
    objc_copyWeak(&v39, &location);
    block[4] = v2;
    dispatch_async(asyncQueue, block);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
LABEL_32:

  objc_sync_exit(v2);
}

- (void)sendAnalyticsForCount:(int64_t)a3
{
  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = +[NSDate date];
  [v6 timeIntervalSince1970];

  id v7 = [v5 integerForKey:self->componentFirstUIDisplayedTimeKey];
  if (!a3)
  {
    CFStringRef v9 = @"FirstUIDisplayed";
    goto LABEL_10;
  }
  id v8 = v7;
  if ([(MRBaseComponentHandler *)self componentFollowupRetriggerdays] == a3)
  {
    CFStringRef v9 = @"lockscreenCleared";
LABEL_10:
    unsigned int v13 = v9;
    AnalyticsSendEventLazy();
    id v10 = v13;
    goto LABEL_11;
  }
  if ([(MRBaseComponentHandler *)self componentfollowUpDisplaydays] == a3)
  {
    CFStringRef v9 = @"coreFollowUpCleared";
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8)
    {
      CFStringRef v9 = @"repairEvent";
      goto LABEL_10;
    }
    id v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(MRBaseComponentHandler *)self componentName];
      double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] auth never fail before, bogus repair event", "-[MRBaseComponentHandler sendAnalyticsForCount:]");
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v15 = v11;
      __int16 v16 = 2112;
      unsigned int v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
  }
  else
  {
    id v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000FA70(self, a3);
    }
  }
LABEL_11:
}

+ (void)handleComponentSUCase:(id)a3 lastAUthCheckBuildVersion:(id)a4 followUpItemID:(id)a5 queryString:(id)a6 suCasekey:(id)a7 startBuildVersion:(id)a8 componentAuth:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  unsigned __int8 v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  int v19 = DMGetUserDataDisposition();
  double v20 = handleForCategory();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((v19 & 2) != 0)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Update install case", buf, 2u);
    }

    double v20 = DMGetPreviousBuildVersion();
    id v39 = (void *)DMCopyCurrentBuildVersion();
    id v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v20;
      __int16 v42 = 2112;
      __int16 v43 = v39;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Old version is %@:%@", buf, 0x16u);
    }

    id v23 = +[NSUserDefaults standardUserDefaults];
    unsigned int v24 = [v23 BOOLForKey:v13];
    signed int v25 = [v23 stringForKey:v14];
    id v26 = v25;
    if (v24)
    {
      v27 = handleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v15;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] User already seeing UI", buf, 0xCu);
      }
    }
    else if (!v25 || ([v25 isEqualToString:v39] & 1) == 0)
    {
      double v28 = handleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v15;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@] first auth case", buf, 0xCu);
      }

      id v29 = [v18 synchronouslycopyAuthStatus];
      if (v29 == (id)1)
      {
        double v30 = handleForCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] is Trusted", buf, 0xCu);
        }

        [v23 setObject:v39 forKey:v14];
        [v23 synchronize];
      }
      else
      {
        unint64_t v31 = (unint64_t)v29;
        id v38 = v16;
        v32 = handleForCategory();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if ((v31 & 0x8000000000000000) != 0)
        {
          if (v33)
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v15;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%@] is not Trusted", buf, 0xCu);
          }

          id v34 = [objc_alloc((Class)SBFBuildVersion) initWithString:v17];
          id v16 = v38;
          id v37 = v34;
          if (v20 && [v34 compareBuildVersionString:v20 withPrecision:2] == (id)1)
          {
            v35 = handleForCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v15;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "SU case for %@", buf, 0xCu);
            }

            [v23 setBool:1 forKey:v38];
          }
          else
          {
            v36 = handleForCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v20;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "ignoring setting the SU case: previousBuild:%@", buf, 0xCu);
            }
          }
          [v23 setObject:v39 forKey:v14];
          [v23 synchronize];
        }
        else
        {
          if (v33)
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v15;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%@] Auth timeout", buf, 0xCu);
          }

          id v16 = v38;
        }
      }
    }
  }
  else if (v21)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Skipping SU update check:%d", buf, 8u);
  }
}

+ (id)getHwRevision
{
  CFDictionaryRef v2 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"config-number", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      id v6 = [objc_alloc((Class)NSString) initWithData:CFProperty encoding:4];
      id v7 = +[NSCharacterSet characterSetWithCharactersInString:@"/-"];
      id v8 = [v6 componentsSeparatedByCharactersInSet:v7];

      if ((unint64_t)[v8 count] >= 2)
      {
        CFStringRef v9 = [v8 objectAtIndexedSubscript:1];
        id v10 = +[NSString stringWithFormat:@"%@", v9];

LABEL_12:
        IOObjectRelease(v4);
        goto LABEL_13;
      }
    }
    else
    {
      double v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000FB78(v12);
      }

      id v6 = 0;
      id v8 = 0;
    }
    id v10 = 0;
    goto LABEL_12;
  }
  id v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10000FB34(v11);
  }

  CFProperty = 0;
  id v10 = 0;
  id v8 = 0;
  id v6 = 0;
LABEL_13:

  return v10;
}

- (NSString)popUpNotificationMessage
{
  return self->popUpNotificationMessage;
}

- (void)setPopUpNotificationMessage:(id)a3
{
}

- (NSString)popUpNotificationTitle
{
  return self->popUpNotificationTitle;
}

- (void)setPopUpNotificationTitle:(id)a3
{
}

- (NSString)followUpInfoMessage
{
  return self->followUpInfoMessage;
}

- (void)setFollowUpInfoMessage:(id)a3
{
}

- (BOOL)unlockCheckActivityRequired
{
  return self->unlockCheckActivityRequired;
}

- (void)setUnlockCheckActivityRequired:(BOOL)a3
{
  self->unlockCheckActivityRequired = a3;
}

- (NSURL)linkedSensitiveURL
{
  return self->linkedSensitiveURL;
}

- (void)setLinkedSensitiveURL:(id)a3
{
}

- (NSString)componentFollowupClientID
{
  return self->componentFollowupClientID;
}

- (void)setComponentFollowupClientID:(id)a3
{
}

- (NSString)componentUnLockCheckCountKey
{
  return self->componentUnLockCheckCountKey;
}

- (void)setComponentUnLockCheckCountKey:(id)a3
{
}

- (NSString)componentSUCaseKey
{
  return self->componentSUCaseKey;
}

- (void)setComponentSUCaseKey:(id)a3
{
}

- (BOOL)displayNotification
{
  return self->displayNotification;
}

- (void)setDisplayNotification:(BOOL)a3
{
  self->displayNotification = a3;
}

- (BOOL)notifyServer
{
  return self->notifyServer;
}

- (void)setNotifyServer:(BOOL)a3
{
  self->notifyServer = a3;
}

- (BOOL)displayModalPopup
{
  return self->displayModalPopup;
}

- (void)setDisplayModalPopup:(BOOL)a3
{
  self->displayModalPopup = a3;
}

- (BOOL)isSUCaseForComponent
{
  return self->isSUCaseForComponent;
}

- (void)setIsSUCaseForComponent:(BOOL)a3
{
  self->isSUCaseForComponent = a3;
}

- (BOOL)disableUIForComponent
{
  return self->disableUIForComponent;
}

- (void)setDisableUIForComponent:(BOOL)a3
{
  self->disableUIForComponent = a3;
}

- (NSString)componentLastCheckTimeKey
{
  return self->componentLastCheckTimeKey;
}

- (void)setComponentLastCheckTimeKey:(id)a3
{
}

- (NSString)componentHasNotifiedServerKey
{
  return self->componentHasNotifiedServerKey;
}

- (void)setComponentHasNotifiedServerKey:(id)a3
{
}

- (NSString)componentHasDisplayedFollowUpKey
{
  return self->componentHasDisplayedFollowUpKey;
}

- (void)setComponentHasDisplayedFollowUpKey:(id)a3
{
}

- (NSString)componentDataCollectionPresentedKey
{
  return self->componentDataCollectionPresentedKey;
}

- (void)setComponentDataCollectionPresentedKey:(id)a3
{
}

- (NSString)componentFirstUIDisplayedTimeKey
{
  return self->componentFirstUIDisplayedTimeKey;
}

- (void)setComponentFirstUIDisplayedTimeKey:(id)a3
{
}

- (NSString)lastKnownComponentIdentifierKey
{
  return self->lastKnownComponentIdentifierKey;
}

- (void)setLastKnownComponentIdentifierKey:(id)a3
{
}

- (NSString)lastKnownComponentIdentifierValue
{
  return self->lastKnownComponentIdentifierValue;
}

- (void)setLastKnownComponentIdentifierValue:(id)a3
{
}

- (NSString)componentUnlockCheckerActivityName
{
  return self->componentUnlockCheckerActivityName;
}

- (void)setComponentUnlockCheckerActivityName:(id)a3
{
}

- (int)componentFollowupRetriggerdays
{
  return self->componentFollowupRetriggerdays;
}

- (void)setComponentFollowupRetriggerdays:(int)a3
{
  self->componentFollowupRetriggerdays = a3;
}

- (int)componentfollowUpDisplaydays
{
  return self->componentfollowUpDisplaydays;
}

- (void)setComponentfollowUpDisplaydays:(int)a3
{
  self->componentfollowUpDisplaydays = a3;
}

- (NSString)componentForceKey
{
  return self->componentForceKey;
}

- (void)setComponentForceKey:(id)a3
{
}

- (NSString)componentEnableNonAuthUIKey
{
  return self->componentEnableNonAuthUIKey;
}

- (void)setComponentEnableNonAuthUIKey:(id)a3
{
}

- (double)timeIntervalOverride
{
  return self->timeIntervalOverride;
}

- (void)setTimeIntervalOverride:(double)a3
{
  self->double timeIntervalOverride = a3;
}

- (NSString)componentNtwkActivityName
{
  return self->componentNtwkActivityName;
}

- (void)setComponentNtwkActivityName:(id)a3
{
}

- (id)componentAuthHandler
{
  return self->componentAuthHandler;
}

- (void)setComponentAuthHandler:(id)a3
{
}

- (int64_t)componentId
{
  return self->componentId;
}

- (void)setComponentId:(int64_t)a3
{
  self->componentId = a3;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
}

- (BOOL)displayFollowup
{
  return self->displayFollowup;
}

- (void)setDisplayFollowup:(BOOL)a3
{
  self->displayFollowup = a3;
}

- (BOOL)legacyPopup
{
  return self->legacyPopup;
}

- (void)setLegacyPopup:(BOOL)a3
{
  self->legacyPopup = a3;
}

- (NSString)stateFilePath
{
  return self->stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
}

- (int)deviceClass
{
  return self->deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->deviceClass = a3;
}

- (BOOL)supportsRepair
{
  return self->supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->supportsRepair = a3;
}

- (NSString)componentRetriggerCountKey
{
  return self->componentRetriggerCountKey;
}

- (void)setComponentRetriggerCountKey:(id)a3
{
}

- (NSString)finishRepairKey
{
  return self->finishRepairKey;
}

- (void)setFinishRepairKey:(id)a3
{
}

- (NSString)finishRepairMessage
{
  return self->finishRepairMessage;
}

- (void)setFinishRepairMessage:(id)a3
{
}

- (NSString)finishRepairTitle
{
  return self->finishRepairTitle;
}

- (void)setFinishRepairTitle:(id)a3
{
}

- (NSString)componentStatusKey
{
  return self->_componentStatusKey;
}

- (void)setComponentStatusKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStatusKey, 0);
  objc_storeStrong((id *)&self->finishRepairTitle, 0);
  objc_storeStrong((id *)&self->finishRepairMessage, 0);
  objc_storeStrong((id *)&self->finishRepairKey, 0);
  objc_storeStrong((id *)&self->componentRetriggerCountKey, 0);
  objc_storeStrong((id *)&self->stateFilePath, 0);
  objc_storeStrong((id *)&self->componentName, 0);
  objc_storeStrong(&self->componentAuthHandler, 0);
  objc_storeStrong((id *)&self->componentNtwkActivityName, 0);
  objc_storeStrong((id *)&self->componentEnableNonAuthUIKey, 0);
  objc_storeStrong((id *)&self->componentForceKey, 0);
  objc_storeStrong((id *)&self->componentUnlockCheckerActivityName, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierValue, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierKey, 0);
  objc_storeStrong((id *)&self->componentFirstUIDisplayedTimeKey, 0);
  objc_storeStrong((id *)&self->componentDataCollectionPresentedKey, 0);
  objc_storeStrong((id *)&self->componentHasDisplayedFollowUpKey, 0);
  objc_storeStrong((id *)&self->componentHasNotifiedServerKey, 0);
  objc_storeStrong((id *)&self->componentLastCheckTimeKey, 0);
  objc_storeStrong((id *)&self->componentSUCaseKey, 0);
  objc_storeStrong((id *)&self->componentUnLockCheckCountKey, 0);
  objc_storeStrong((id *)&self->componentFollowupClientID, 0);
  objc_storeStrong((id *)&self->linkedSensitiveURL, 0);
  objc_storeStrong((id *)&self->followUpInfoMessage, 0);
  objc_storeStrong((id *)&self->popUpNotificationTitle, 0);
  objc_storeStrong((id *)&self->popUpNotificationMessage, 0);

  objc_storeStrong((id *)&self->asyncQueue, 0);
}

@end