@interface NRRepeatingAlertEngine
+ (id)createAlertItemDictionary;
+ (id)sharedInstance;
+ (id)sharedUNUserNotificationCenter;
- (NSString)alertString;
- (id)initBase;
- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
- (void)_presentAlertsIfNeeded;
- (void)addErrorCodeToPairingFailureAlert:(unint64_t)a3 withReasonString:(id)a4;
- (void)clearUINotificationwithName:(id)a3;
- (void)presentAlertIfEnabledWithName:(id)a3;
- (void)presentAlertsIfNeeded;
- (void)registerForNotifications;
- (void)resetStateForAlertWithName:(id)a3;
- (void)resume;
- (void)setAlertString:(id)a3;
- (void)setEnabled:(BOOL)a3 withName:(id)a4;
- (void)setEnabled:(BOOL)a3 withName:(id)a4 withDevice:(id)a5;
- (void)sigTerm;
@end

@implementation NRRepeatingAlertEngine

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFE14;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A13E8 != -1) {
    dispatch_once(&qword_1001A13E8, block);
  }
  v2 = (void *)qword_1001A13F0;

  return v2;
}

+ (id)sharedUNUserNotificationCenter
{
  if (qword_1001A1400 != -1) {
    dispatch_once(&qword_1001A1400, &stru_1001697C0);
  }
  v2 = (void *)qword_1001A13F8;

  return v2;
}

- (id)initBase
{
  v11.receiver = self;
  v11.super_class = (Class)NRRepeatingAlertEngine;
  v2 = [(NRRepeatingAlertEngine *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoRegistry.repeatingAlertEngine", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NRRepeatingAlertEngine createAlertItemDictionary];
    items = v3->_items;
    v3->_items = (NSDictionary *)v8;
  }
  return v3;
}

- (void)resume
{
  [(NRRepeatingAlertEngine *)self registerForNotifications];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0040;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

+ (id)createAlertItemDictionary
{
  v2 = +[NSMutableDictionary dictionary];
  v3 = [[NRRepeatingAlertEngineItemLaunchBridge alloc] initWithName:@"PairedWatchIsIncompatible" strings:&off_100177BC8 maxAcknowledgementCount:3 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:28800.0];
  v4 = [(NRRepeatingAlertEngineItem *)v3 name];
  [v2 setObject:v3 forKeyedSubscript:v4];

  v5 = [[NRRepeatingAlertEngineItemLaunchBridgeToFaceGallery alloc] initWithName:@"PairedWatchWasUpdatedCheckoutFaceGallery" strings:&off_100177BE0 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  dispatch_queue_t v6 = [(NRRepeatingAlertEngineItem *)v5 name];
  [v2 setObject:v5 forKeyedSubscript:v6];

  v7 = [[NRRepeatingAlertEngineItemWatchDidNotReset alloc] initWithName:@"RepeatingAlertPairedWatchDidNotReset" strings:&off_100177BF8 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  uint64_t v8 = [(NRRepeatingAlertEngineItem *)v7 name];
  [v2 setObject:v7 forKeyedSubscript:v8];

  v9 = [[NRRepeatingAlertEngineItemMigrationFailed alloc] initWithName:@"MigrationFailed" strings:&off_100177C10 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v10 = [(NRRepeatingAlertEngineItem *)v9 name];
  [v2 setObject:v9 forKeyedSubscript:v10];

  objc_super v11 = [[NRRepeatingAlertEngineItemMigrationFailedPermanentlyForThisWatch alloc] initWithName:@"MigrationFailedPermanentlyForThisWatch" strings:&off_100177C28 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v12 = [(NRRepeatingAlertEngineItem *)v11 name];
  [v2 setObject:v11 forKeyedSubscript:v12];

  v13 = [[NRRepeatingAlertEngineItemMigrationSamePhone alloc] initWithName:@"SamePhone" strings:&off_100177C40 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v14 = [(NRRepeatingAlertEngineItem *)v13 name];
  [v2 setObject:v13 forKeyedSubscript:v14];

  v15 = [[NRRepeatingAlertEngineItemStandAloneMode alloc] initWithName:@"StandAloneMode" strings:&off_100177C58 maxAcknowledgementCount:1 reoccurrenceInterval:0 localizedStrings:0 userNotificationCenter:60.0];
  v16 = [(NRRepeatingAlertEngineItem *)v15 name];
  [v2 setObject:v15 forKeyedSubscript:v16];

  v17 = [[NRRepeatingAlertEngineItemStandAloneMode alloc] initWithName:@"HealthSyncSetupFailed" strings:&off_100177C70 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v18 = [(NRRepeatingAlertEngineItem *)v17 name];
  [v2 setObject:v17 forKeyedSubscript:v18];

  v19 = [NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup alloc];
  v20 = +[NRRepeatingAlertEngine sharedUNUserNotificationCenter];
  v21 = [(NRRepeatingAlertEngineItem *)v19 initWithName:@"TinkerWatchFoundInAccount" strings:&off_100177C88 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:v20 userNotificationCenter:60.0];

  v22 = [(NRRepeatingAlertEngineItem *)v21 name];
  [v2 setObject:v21 forKeyedSubscript:v22];

  v23 = [NRRepeatingAlertEngineItemLegalBackstopNotification alloc];
  v24 = +[NRRepeatingAlertEngine sharedUNUserNotificationCenter];
  v25 = [(NRRepeatingAlertEngineItem *)v23 initWithName:@"TinkerLegalBackstop" strings:&off_100177CA0 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:v24 userNotificationCenter:60.0];

  v26 = [(NRRepeatingAlertEngineItem *)v25 name];
  [v2 setObject:v25 forKeyedSubscript:v26];

  v27 = [[NRRepeatingAlertEngineItemWatchUnexpectedlyUnpaired alloc] initWithName:@"WatchUnexpectedlyUnpaired" strings:&off_100177CB8 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v28 = [(NRRepeatingAlertEngineItem *)v27 name];
  [v2 setObject:v27 forKeyedSubscript:v28];

  v29 = [[NRRepeatingAlertEngineItemWatchUnexpectedlyUnpairedBridge alloc] initWithName:@"WatchUnexpectedlyUnpairedBridge" strings:&off_100177CD0 maxAcknowledgementCount:5 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:300.0];
  v30 = [(NRRepeatingAlertEngineItem *)v29 name];
  [v2 setObject:v29 forKeyedSubscript:v30];

  v31 = [[NRRepeatingAlertEngineItemWatchesUnpairedProhibited alloc] initWithName:@"WatchesUnpairedProhibited" strings:&off_100177CE8 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v32 = [(NRRepeatingAlertEngineItem *)v31 name];
  [v2 setObject:v31 forKeyedSubscript:v32];

  v33 = [[NRRepeatingAlertEngineItemWatchesUnpairedProhibited alloc] initWithName:@"MigrationNotSupportedForMDMWatch" strings:&off_100177D00 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v34 = [(NRRepeatingAlertEngineItem *)v33 name];
  [v2 setObject:v33 forKeyedSubscript:v34];

  v35 = [[NRRepeatingAlertEngineItemInternalPairingFailed alloc] initWithName:@"InternalPairingFailed" strings:&off_100177D18 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v36 = [(NRRepeatingAlertEngineItem *)v35 name];
  [v2 setObject:v35 forKeyedSubscript:v36];

  v37 = [[NRRepeatingAlertEngineItemInternalMigrationFailed alloc] initWithName:@"InternalMigrationFailed" strings:&off_100177D30 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v38 = [(NRRepeatingAlertEngineItem *)v37 name];
  [v2 setObject:v37 forKeyedSubscript:v38];

  v39 = [[NRRepeatingAlertEngineItemLostIDSPairing alloc] initWithName:@"InternalIDSPairingLost" strings:&off_100177D48 maxAcknowledgementCount:1 reoccurrenceInterval:1 localizedStrings:0 userNotificationCenter:60.0];
  v40 = [(NRRepeatingAlertEngineItem *)v39 name];
  [v2 setObject:v39 forKeyedSubscript:v40];

  return v2;
}

- (void)setEnabled:(BOOL)a3 withName:(id)a4 withDevice:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D07CC;
  v13[3] = &unk_100165C98;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a3;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)setEnabled:(BOOL)a3 withName:(id)a4
{
}

- (void)clearUINotificationwithName:(id)a3
{
  id v3 = [(NSDictionary *)self->_items objectForKeyedSubscript:a3];
  [v3 clearNotifications];
}

- (void)addErrorCodeToPairingFailureAlert:(unint64_t)a3 withReasonString:(id)a4
{
  id v6 = a4;
  if (a3 && v6)
  {
    id v16 = v6;
    v7 = [(NSDictionary *)self->_items objectForKeyedSubscript:@"InternalPairingFailed"];
    id v8 = [v7 strings];
    id v9 = [v8 mutableCopy];

    v10 = +[NSString stringWithFormat:@"[Internal] Pairing Failed! Code: %lu", a3];
    id v11 = +[NSDate date];
    id v12 = +[NRTextFormattingUtilities dateFormatter:v11];

    if (a3 == 3) {
      +[NSString stringWithFormat:@"Apple Watch setup timed out due to inactivity.\n\nThis was likely caused by the Watch app being backgrounded for 10 minutes during the setup flow. If this was the case, no radar is necessary. If this was not the case, file a radar to ‘Watch App & Pairing’. Include a sysdiagnose from 📱 & ⌚️.\nTime: %@", v12, v15];
    }
    else {
    v13 = +[NSString stringWithFormat:@"File a Radar to 'Watch App & Pairing'. Include a sysdiagnose from 📱 & ⌚️.\n\nError: %@\nTime: %@", v16, v12];
    }
    [v9 setObject:v10 atIndexedSubscript:0];
    [v9 setObject:v13 atIndexedSubscript:1];
    id v14 = [(NSDictionary *)self->_items objectForKeyedSubscript:@"InternalPairingFailed"];
    [v14 setStrings:v9];

    id v6 = v16;
  }
}

- (void)presentAlertsIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0B48;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_presentAlertsIfNeeded
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSDictionary *)self->_items allValues];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 shouldTriggerAlertNow]) {
          [v8 presentAlertIfEnabledWithString:self->_alertString];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)sigTerm
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSDictionary *)self->_items allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) dismissAlertAsync];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)presentAlertIfEnabledWithName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D0DE8;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)resetStateForAlertWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    long long v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting alert %@", buf, 0xCu);
    }
  }
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D0F84;
  v10[3] = &unk_100165530;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)queue, v10);
}

- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int out_token = -1;
  id v10 = v7;
  id v11 = (const char *)[v10 UTF8String];
  if (v9)
  {
    if (!notify_register_dispatch(v11, &out_token, v8, v9)) {
      goto LABEL_9;
    }
  }
  else if (!notify_register_check(v11, &out_token))
  {
    goto LABEL_9;
  }
  long long v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to register block and get notify token for %@", buf, 0xCu);
    }
  }
LABEL_9:
  int v15 = out_token;

  return v15;
}

- (void)registerForNotifications
{
  if (self->_notifyToken == -1)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000D11F4;
    v4[3] = &unk_1001697E8;
    objc_copyWeak(&v5, &location);
    self->_notifyToken = [(NRRepeatingAlertEngine *)self registerNotifyTokenWithName:@"com.apple.springboard.homescreenunlocked" withQueue:queue withBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (NSString)alertString
{
  return self->_alertString;
}

- (void)setAlertString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertString, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end