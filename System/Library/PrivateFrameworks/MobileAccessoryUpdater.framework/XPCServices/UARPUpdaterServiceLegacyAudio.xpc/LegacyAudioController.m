@interface LegacyAudioController
+ (LegacyAudioController)sharedInstance;
- (LegacyAudioController)init;
- (NSArray)activeAccessories;
- (NSArray)matchingAccessoriesList;
- (NSArray)matchingBSDNotificationsList;
- (NSArray)matchingDASActivityList;
- (id)accessorySeen:(id)a3;
- (id)cachedActiveFirmwareAccessories;
- (id)loadMatchingAccessoriesList;
- (id)loadMatchingBSDNotificationsList;
- (id)loadMatchingDASActivityList;
- (void)addActiveAccessory:(id)a3;
- (void)addActiveFirmwareAnalytics:(id)a3;
- (void)dasActivityReceived:(id)a3;
- (void)removeAccessorySeen:(id)a3;
- (void)removeActiveAccessory:(id)a3;
- (void)sendActiveFirmwareAnalyticsEvent;
- (void)setCachedActiveFirmwareAccessories:(id)a3;
@end

@implementation LegacyAudioController

+ (LegacyAudioController)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FB8C;
  block[3] = &unk_100031748;
  block[4] = a1;
  if (qword_100041EC8 != -1) {
    dispatch_once(&qword_100041EC8, block);
  }
  v2 = (void *)qword_100041EC0;
  return (LegacyAudioController *)v2;
}

- (LegacyAudioController)init
{
  v18.receiver = self;
  v18.super_class = (Class)LegacyAudioController;
  v2 = [(LegacyAudioController *)&v18 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    internalActiveAccessories = v2->_internalActiveAccessories;
    v2->_internalActiveAccessories = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    internalAccessoriesSeen = v2->_internalAccessoriesSeen;
    v2->_internalAccessoriesSeen = v5;

    uint64_t v7 = [(LegacyAudioController *)v2 loadMatchingAccessoriesList];
    matchingAccessoriesList = v2->_matchingAccessoriesList;
    v2->_matchingAccessoriesList = (NSArray *)v7;

    uint64_t v9 = [(LegacyAudioController *)v2 loadMatchingBSDNotificationsList];
    matchingBSDNotificationsList = v2->_matchingBSDNotificationsList;
    v2->_matchingBSDNotificationsList = (NSArray *)v9;

    uint64_t v11 = [(LegacyAudioController *)v2 loadMatchingDASActivityList];
    matchingDASActivityList = v2->_matchingDASActivityList;
    v2->_matchingDASActivityList = (NSArray *)v11;

    v13 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UARPUpdaterServiceLegacyAudioDatabase"];
    database = v2->_database;
    v2->_database = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.legacyAudioController.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;
  }
  return v2;
}

- (id)accessorySeen:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = sub_10000FDD8;
  v16 = sub_10000FDE8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FDF0;
  block[3] = &unk_1000317B0;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeAccessorySeen:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FFC4;
  v7[3] = &unk_1000315A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)addActiveAccessory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010068;
  v7[3] = &unk_1000315A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)removeActiveAccessory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010144;
  v7[3] = &unk_1000315A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (NSArray)activeAccessories
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10000FDD8;
  id v10 = sub_10000FDE8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010240;
  v5[3] = &unk_1000317D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)dasActivityReceived:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010330;
  v7[3] = &unk_1000315A8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)addActiveFirmwareAnalytics:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001043C;
  v7[3] = &unk_1000315A8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (id)loadMatchingAccessoriesList
{
  v2 = (void *)MGCopyAnswer();
  if (([v2 BOOLValue] & 1) == 0) {
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Use Alternate Accessory List from %@", (uint8_t *)&v9, 0xCu);
  }
  id v3 = +[NSURL fileURLWithPath:@"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist"];
  id v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];
  v5 = [v4 objectForKeyedSubscript:@"MobileAccessoryUpdaterProperties"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Alternate Accessory List from %@", (uint8_t *)&v9, 0xCu);
  }

  if (!v5)
  {
LABEL_7:
    id v6 = +[NSBundle mainBundle];
    v5 = [v6 objectForInfoDictionaryKey:@"MobileAccessoryUpdaterProperties"];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Native iAUP Accessory List", (uint8_t *)&v9, 2u);
    }
  }
  id v7 = [v5 objectForKey:@"MatchingDevices"];

  return v7;
}

- (id)loadMatchingBSDNotificationsList
{
  CFStringRef v4 = @"com.apple.corespeech.voicetriggerassetchange";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (id)loadMatchingDASActivityList
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v4 = [objc_alloc((Class)UARPServiceUpdaterDASMatchingRule) initWithIdentifier:@"PeriodicLaunchActivity" matchingDictionary:v3];
  id v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

- (id)cachedActiveFirmwareAccessories
{
  id v2 = [(NSUserDefaults *)self->_database objectForKey:@"activeFirmwareAccessories"];
  if (!v2) {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)setCachedActiveFirmwareAccessories:(id)a3
{
}

- (void)sendActiveFirmwareAnalyticsEvent
{
  -[NSUserDefaults objectForKey:](self->_database, "objectForKey:");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v25 = long long v31 = 0u;
  id v2 = [v25 allValues];
  id v3 = [v2 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    id v6 = &AMAuthInstallApCreatePersonalizedResponse_ptr;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v7);
        int v9 = v6[178];
        uint64_t v10 = objc_opt_class();
        id v27 = 0;
        id v11 = [v9 unarchivedObjectOfClass:v10 fromData:v8 error:&v27];
        id v12 = v27;
        if (v11)
        {
          v13 = [v11 activeFirmwareVersion];

          if (v13)
          {
            uint64_t v14 = objc_alloc_init(UARPActiveFirmwareAnalyticsEvent);
            dispatch_queue_t v15 = [v11 modelName];
            [(UARPActiveFirmwareAnalyticsEvent *)v14 setModelName:v15];

            v16 = [v11 activeFirmwareVersion];
            [(UARPActiveFirmwareAnalyticsEvent *)v14 setActiveFirmwareVersion:v16];

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [(UARPActiveFirmwareAnalyticsEvent *)v14 modelName];
              objc_super v18 = [(UARPActiveFirmwareAnalyticsEvent *)v14 activeFirmwareVersion];
              *(_DWORD *)buf = 136315650;
              v33 = "-[LegacyAudioController sendActiveFirmwareAnalyticsEvent]";
              __int16 v34 = 2112;
              v35 = v17;
              __int16 v36 = 2112;
              v37 = v18;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: sending active Firmware Event for %@, %@", buf, 0x20u);

              id v6 = &AMAuthInstallApCreatePersonalizedResponse_ptr;
            }
            [(UARPActiveFirmwareAnalyticsEvent *)v14 send];
          }
          v19 = [v11 activeANCVersion];

          if (v19)
          {
            v20 = objc_alloc_init(UARPActiveFirmwareAnalyticsEvent);
            v21 = [v11 modelName];
            [(UARPActiveFirmwareAnalyticsEvent *)v20 setModelName:v21];

            v22 = [v11 activeANCVersion];
            [(UARPActiveFirmwareAnalyticsEvent *)v20 setActiveFirmwareVersion:v22];

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [(UARPActiveFirmwareAnalyticsEvent *)v20 modelName];
              v24 = [(UARPActiveFirmwareAnalyticsEvent *)v20 activeFirmwareVersion];
              *(_DWORD *)buf = 136315650;
              v33 = "-[LegacyAudioController sendActiveFirmwareAnalyticsEvent]";
              __int16 v34 = 2112;
              v35 = v23;
              __int16 v36 = 2112;
              v37 = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: sending active ANC Firmware Event for %@, %@", buf, 0x20u);

              id v6 = &AMAuthInstallApCreatePersonalizedResponse_ptr;
            }
            [(UARPActiveFirmwareAnalyticsEvent *)v20 send];
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10001B8A0(v38, (uint64_t)v12, &v39);
        }

        id v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v2 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v4);
  }

  [(NSUserDefaults *)self->_database removeObjectForKey:@"activeFirmwareAccessories"];
}

- (NSArray)matchingAccessoriesList
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)matchingBSDNotificationsList
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)matchingDASActivityList
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingDASActivityList, 0);
  objc_storeStrong((id *)&self->_matchingBSDNotificationsList, 0);
  objc_storeStrong((id *)&self->_matchingAccessoriesList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_internalAccessoriesSeen, 0);
  objc_storeStrong((id *)&self->_internalActiveAccessories, 0);
}

@end