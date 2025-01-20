@interface UARPUpdaterServiceManager
- (BOOL)automaticUpdatesDisabledForIdentifier:(id)a3;
- (BOOL)automaticUpdatesDisabledForService:(id)a3;
- (BOOL)bypassProgressForUARPConsent:(id)a3 sendConsent:(BOOL)a4;
- (BOOL)consentDisabledForModelNumber:(id)a3;
- (BOOL)consentDisabledForUARPConsent:(id)a3 sendConsent:(BOOL)a4;
- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)handleBsdNotificationReceived:(id)a3 identifier:(id)a4;
- (BOOL)handleEAEventStreamMessage:(id)a3 updater:(id)a4 identifer:(id)a5;
- (BOOL)handleIOKitEventStreamMessage:(id)a3 updater:(id)a4 identifier:(id)a5;
- (BOOL)handleXPCStreamEvent:(id)a3;
- (BOOL)isXPCEventStreamSupported:(id)a3;
- (BOOL)queryIsBusy;
- (UARPUpdaterServiceManager)initWithQueue:(id)a3;
- (id)keyComponents:(id)a3;
- (id)keyForEventStream:(id)a3 updaterInstance:(id)a4 eventIdentifier:(id)a5;
- (id)queryPendingTssRequestsForUpdater:(id)a3;
- (id)updaterForAccessoryNeedingConsentWithName:(id)a3;
- (id)updaterForRegistryEntryID:(id)a3;
- (id)updaterForServiceName:(id)a3;
- (void)bsdNotificationRulesChangedForUpdaterServiceInstance:(id)a3 notificationNames:(id)a4;
- (void)checkinDASActivities;
- (void)checkinDASActivityRulesForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dasActivityRulesChangedForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4;
- (void)dealloc;
- (void)handleDASXPCActivity:(id)a3;
- (void)initServiceNameList;
- (void)matchingRulesChangedForUpdaterServiceInstance:(id)a3 matchingRules:(id)a4;
- (void)queryLaunchRules;
- (void)tssResponse:(id)a3 updaterName:(id)a4;
@end

@implementation UARPUpdaterServiceManager

- (UARPUpdaterServiceManager)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UARPUpdaterServiceManager;
  v4 = [(UARPUpdaterServiceManager *)&v6 init];
  if (v4)
  {
    v4->_log = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "updaterManager");
    [(UARPUpdaterServiceManager *)v4 initServiceNameList];
    v4->_queue = (OS_dispatch_queue *)a3;
    v4->_busyServiceNameList = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v4;
}

- (void)initServiceNameList
{
  id v3 = +[NSMutableArray array];
  v4 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:+[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/" isDirectory:1] includingPropertiesForKeys:0 options:1 errorHandler:0];
  v5 = (NSString *)[(NSDirectoryEnumerator *)v4 nextObject];
  if (v5)
  {
    v7 = v5;
    *(void *)&long long v6 = 138412290;
    long long v20 = v6;
    do
    {
      v8 = +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v7, v20);
      if (v8)
      {
        v9 = v8;
        if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSBundle infoDictionary](v8, "infoDictionary"), "objectForKeyedSubscript:", @"UARP Updater"), "BOOLValue"))
        {
          v10 = [(NSBundle *)v9 bundleIdentifier];
          if (v10)
          {
            v11 = v10;
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v20;
              v22 = v11;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Located UARP updater bundle %@", buf, 0xCu);
            }
            v13 = [[UARPUpdaterServiceInstance alloc] initWithServiceBundle:v9 delegate:self];
            unsigned int v14 = [(UARPUpdaterServiceManager *)self automaticUpdatesDisabledForService:[(UARPUpdaterServiceInstance *)v13 serviceName]];
            v15 = self->_log;
            BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
            if (v14)
            {
              if (v16)
              {
                v17 = [(UARPUpdaterServiceInstance *)v13 serviceName];
                *(_DWORD *)buf = v20;
                v22 = v17;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "UARP updater service disabled %@", buf, 0xCu);
              }
            }
            else
            {
              if (v16)
              {
                v19 = [(UARPUpdaterServiceInstance *)v13 serviceName];
                *(_DWORD *)buf = v20;
                v22 = v19;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "UARP updater service enabled %@", buf, 0xCu);
              }
              [v3 addObject:v13];
            }
          }
        }
      }
      else
      {
        v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v22 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to access XPC bundle at %@", buf, 0xCu);
        }
      }
      v7 = (NSString *)[(NSDirectoryEnumerator *)v4 nextObject];
    }
    while (v7);
  }
  self->_updaterList = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v3];
}

- (void)dealloc
{
  [(NSArray *)self->_serviceNameList dealloc];

  v3.receiver = self;
  v3.super_class = (Class)UARPUpdaterServiceManager;
  [(UARPUpdaterServiceManager *)&v3 dealloc];
}

- (void)queryLaunchRules
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "First launch. Querying plugin launch rules.", buf, 2u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  updaterList = self->_updaterList;
  id v5 = [(NSArray *)updaterList countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(updaterList);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) queryLaunchRules];
      }
      id v6 = [(NSArray *)updaterList countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)checkinDASActivities
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  updaterList = self->_updaterList;
  id v3 = [(NSArray *)updaterList countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(updaterList);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) checkinDASActivities];
      }
      id v4 = [(NSArray *)updaterList countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)matchingRulesChangedForUpdaterServiceInstance:(id)a3 matchingRules:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014A44;
  block[3] = &unk_10007D500;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (void)bsdNotificationRulesChangedForUpdaterServiceInstance:(id)a3 notificationNames:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014D48;
  block[3] = &unk_10007D500;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (void)dasActivityRulesChangedForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F8C;
  block[3] = &unk_10007D500;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (void)checkinDASActivityRulesForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015244;
  block[3] = &unk_10007D500;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (id)updaterForServiceName:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  updaterList = self->_updaterList;
  id v5 = [(NSArray *)updaterList countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(updaterList);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "serviceName"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)updaterList countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)updaterForAccessoryNeedingConsentWithName:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  updaterList = self->_updaterList;
  id v5 = [(NSArray *)updaterList countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(updaterList);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "accessoriesNeedingConsent"), "containsObject:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)updaterList countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)bypassProgressForUARPConsent:(id)a3 sendConsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[UARPUpdaterServiceManager updaterForAccessoryNeedingConsentWithName:](self, "updaterForAccessoryNeedingConsentWithName:", [a3 accessoryName]);
  if ([v7 consentDisabledForService])
  {
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v8 = -[UARPUpdaterServiceManager consentDisabledForModelNumber:](self, "consentDisabledForModelNumber:", [a3 appleModelNumber]);
  if (v8 && v4)
  {
LABEL_6:
    [v7 consentReceivedPostLogoutMode:a3];
LABEL_7:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)consentDisabledForUARPConsent:(id)a3 sendConsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[UARPUpdaterServiceManager updaterForAccessoryNeedingConsentWithName:](self, "updaterForAccessoryNeedingConsentWithName:", [a3 accessoryName]);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = [v7 serviceName];
    __int16 v13 = 2114;
    id v14 = [a3 accessoryName];
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Check if consent is diabled for service %{public}@ accessory %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if ([v7 consentDisabledForService])
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v9 = -[UARPUpdaterServiceManager consentDisabledForModelNumber:](self, "consentDisabledForModelNumber:", [a3 appleModelNumber]);
  if (v9 && v4)
  {
LABEL_8:
    [v7 consentReceived:a3];
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)updaterForRegistryEntryID:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  updaterList = self->_updaterList;
  id v5 = [(NSArray *)updaterList countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(updaterList);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 isTrackingIONotificationPortForRegistryEntryID:a3]) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)updaterList countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)keyForEventStream:(id)a3 updaterInstance:(id)a4 eventIdentifier:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@,%@,%@", a3, [a4 serviceName], a5);
}

- (id)keyComponents:(id)a3
{
  BOOL v4 = +[NSCharacterSet characterSetWithCharactersInString:@","];
  return [a3 componentsSeparatedByCharactersInSet:v4];
}

- (BOOL)isXPCEventStreamSupported:(id)a3
{
  if ([a3 isEqualToString:@"com.apple.iokit.matching"]) {
    return 1;
  }
  return [a3 isEqualToString:@"com.apple.ExternalAccessory.matching"];
}

- (BOOL)handleXPCStreamEvent:(id)a3
{
  id v5 = [(UARPUpdaterServiceManager *)self keyComponents:+[NSString stringWithUTF8String:xpc_dictionary_get_string(a3, _xpc_event_key_name)]];
  if ([v5 count] != (id)3) {
    goto LABEL_10;
  }
  id v6 = [v5 objectAtIndexedSubscript:1];
  id v7 = [(UARPUpdaterServiceManager *)self updaterForServiceName:v6];
  if (!v7)
  {
    unsigned int v11 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v11) {
      return v11;
    }
    sub_10005027C();
    goto LABEL_10;
  }
  id v8 = v7;
  id v9 = [v5 objectAtIndexedSubscript:0];
  id v10 = [v5 objectAtIndexedSubscript:2];
  if ([v9 isEqualToString:@"com.apple.iokit.matching"])
  {
    if ([(UARPUpdaterServiceManager *)self handleIOKitEventStreamMessage:a3 updater:v8 identifier:v10])
    {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if ([v9 isEqualToString:@"com.apple.ExternalAccessory.matching"])
  {
    if ([(UARPUpdaterServiceManager *)self handleEAEventStreamMessage:a3 updater:v8 identifer:v10])
    {
LABEL_14:
      [(NSMutableSet *)self->_busyServiceNameList addObject:v6];
      LOBYTE(v11) = 1;
      return v11;
    }
LABEL_10:
    LOBYTE(v11) = 0;
    return v11;
  }
  unsigned int v11 = [v9 isEqualToString:@"com.apple.notifyd.matching"];
  if (v11)
  {
    unsigned int v11 = [(UARPUpdaterServiceManager *)self handleBsdNotificationReceived:v8 identifier:v10];
    if (v11) {
      goto LABEL_14;
    }
  }
  return v11;
}

- (void)handleDASXPCActivity:(id)a3
{
  xpc_object_t v5 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  if (v5)
  {
    id v6 = v5;
    id v7 = (id)_CFXPCCreateCFObjectFromXPCObject();
    xpc_release(v6);
    id v8 = (const char *)objc_msgSend(v7, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "name"));
    xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      v19 = "-[UARPUpdaterServiceManager handleDASXPCActivity:]";
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2048;
      xpc_activity_state_t v23 = state;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: activity %@, state %ld", (uint8_t *)&v18, 0x20u);
    }
    if (state == 2)
    {
      unsigned int v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        v19 = v8;
        __int16 v20 = 2112;
        v21 = (const char *)v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RUN Handler called for activity: %@, criteria: %@", (uint8_t *)&v18, 0x16u);
      }
      if (!xpc_activity_set_state((xpc_activity_t)a3, 4)
        && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_1000503B4();
      }
      id v12 = [(UARPUpdaterServiceManager *)self keyComponents:v8];
      if ([v12 count] == (id)3)
      {
        id v13 = [v12 objectAtIndexedSubscript:1];
        id v14 = [(UARPUpdaterServiceManager *)self updaterForServiceName:v13];
        if (v14)
        {
          v15 = v14;
          id v16 = [v7 mutableCopy];
          objc_msgSend(v16, "removeObjectForKey:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "name"));
          v17 = -[UARPServiceUpdaterDASMatchingRule initWithIdentifier:matchingDictionary:]([UARPServiceUpdaterDASMatchingRule alloc], "initWithIdentifier:matchingDictionary:", [v12 objectAtIndexedSubscript:2], v16);
          [v15 dasActivityReceived:v17];
          [(NSMutableSet *)self->_busyServiceNameList addObject:v13];

          if (!xpc_activity_set_state((xpc_activity_t)a3, 5)
            && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          {
            sub_1000502E4();
          }
        }
        else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        {
          sub_10005027C();
        }
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_10005034C();
      }
    }
  }
}

- (BOOL)automaticUpdatesDisabledForIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"disabledProductIdentifiers", @"com.apple.mobileaccessoryupdater");
  LOBYTE(v3) = objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(v3, "objectAtIndex:", 0)), "BOOLValue");

  return (char)v3;
}

- (BOOL)consentDisabledForModelNumber:(id)a3
{
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"disabledConsentProductIdentifiers", @"com.apple.mobileaccessoryupdater");
  LOBYTE(a3) = objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", a3), "BOOLValue");

  return (char)a3;
}

- (BOOL)automaticUpdatesDisabledForService:(id)a3
{
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"disabledUARPServices", @"com.apple.mobileaccessoryupdater");
  LOBYTE(a3) = objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", a3), "BOOLValue");

  return (char)a3;
}

- (BOOL)handleIOKitEventStreamMessage:(id)a3 updater:(id)a4 identifier:(id)a5
{
  unsigned int v9 = [(UARPUpdaterServiceManager *)self automaticUpdatesDisabledForIdentifier:a5];
  if (v9)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = a5;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Ignoring IOKit event because automatic updates are disabled for %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    unsigned int v11 = [[UARPServiceUpdaterMatchedIOKitRule alloc] initWithIdentifier:a5 registryEntryID:xpc_dictionary_get_uint64(a3, "IOMatchLaunchServiceID")];
    [a4 ioKitRuleMatched:v11];
  }
  return v9 ^ 1;
}

- (BOOL)handleBsdNotificationReceived:(id)a3 identifier:(id)a4
{
  return 1;
}

- (BOOL)handleEAEventStreamMessage:(id)a3 updater:(id)a4 identifer:(id)a5
{
  unsigned int v9 = [(UARPUpdaterServiceManager *)self automaticUpdatesDisabledForIdentifier:a5];
  if (v9)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = a5;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Ignoring EA event because automatic updates are disabled for %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    value = (NSString *)xpc_dictionary_get_value(a3, "EAMatchingSerialNumber");
    id v12 = value;
    if (value)
    {
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_string) {
        id v12 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v12)];
      }
      else {
        id v12 = 0;
      }
    }
    int v13 = [[UARPServiceUpdaterMatchedEARule alloc] initWithEAIdentifier:a5 accessorySerialNumber:v12];
    [a4 eaRuleMatched:v13];
  }
  return v9 ^ 1;
}

- (void)consentReceived:(id)a3
{
  id v4 = -[UARPUpdaterServiceManager updaterForAccessoryNeedingConsentWithName:](self, "updaterForAccessoryNeedingConsentWithName:", [a3 accessoryName]);
  [v4 consentReceived:a3];
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  id v4 = -[UARPUpdaterServiceManager updaterForAccessoryNeedingConsentWithName:](self, "updaterForAccessoryNeedingConsentWithName:", [a3 accessoryName]);
  [v4 consentReceivedPostLogoutMode:a3];
}

- (BOOL)queryIsBusy
{
  if (![(NSMutableSet *)self->_busyServiceNameList count]) {
    return 0;
  }
  id v21 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_busyServiceNameList;
  id v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    BOOL v22 = 0;
    uint64_t v5 = *(void *)v31;
    uint64_t v20 = *(void *)v31;
    do
    {
      id v6 = 0;
      id v23 = v4;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(NSMutableSet **)(*((void *)&v30 + 1) + 8 * (void)v6);
        id v8 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", v7, v20);
        if ([v8 queryIsServiceBusy])
        {
          BOOL v22 = 1;
        }
        else
        {
          v25 = v6;
          id v9 = [v8 findAndReleaseAllIONotificationPorts];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v27;
            do
            {
              for (i = 0; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v27 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v35 = "-[UARPUpdaterServiceManager queryIsBusy]";
                  __int16 v36 = 2112;
                  v37 = v7;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Releasing still registered IONotificationPort for %@", buf, 0x16u);
                }
                IONotificationPortDestroy((IONotificationPortRef)[v14 pointerValue]);
              }
              id v11 = [v9 countByEnumeratingWithState:&v26 objects:v38 count:16];
            }
            while (v11);
          }

          [v21 addObject:v7];
          uint64_t v5 = v20;
          id v4 = v23;
          id v6 = v25;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v4);
  }
  else
  {
    BOOL v22 = 0;
  }
  [(NSMutableSet *)self->_busyServiceNameList minusSet:v21];
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    busyServiceNameList = self->_busyServiceNameList;
    *(_DWORD *)buf = 136315394;
    v35 = "-[UARPUpdaterServiceManager queryIsBusy]";
    __int16 v36 = 2112;
    v37 = busyServiceNameList;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Busy Services: %@", buf, 0x16u);
  }
  return v22;
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  kern_return_t v12;
  BOOLean_t v13;
  kern_return_t ParentEntry;
  io_registry_entry_t v15;
  const char *v16;
  char *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  io_registry_entry_t v26;
  uint64_t v27;
  uint64_t v28;
  CFTypeRef v29;
  CFTypeRef v30;
  void *v31;
  CFTypeRef v32;
  CFTypeRef v33;
  void *v34;
  const char *v35;
  const char *v36;
  CFMutableDictionaryRef v37;
  void *v38;
  NSNumber *v39;
  CFDictionaryRef v40;
  io_service_t v41;
  CFTypeRef v42;
  const char *v43;
  char *v44;
  CFTypeRef v45;
  CFTypeRef v46;
  CFTypeRef v47;
  CFTypeRef v48;
  CFMutableDictionaryRef v49;
  void *v50;
  IONotificationPort *v51;
  CFDictionaryRef v52;
  BOOL v53;
  const char *v55;
  char *v56;
  dispatch_queue_t *v57;
  io_object_t v58;
  kern_return_t v59;
  id v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  id v64;
  id v65;
  io_object_t object;
  void block[4];
  int v68;
  uint64_t v69;
  uint64_t entryID;
  void v71[5];
  void v72[5];
  void v73[3];
  void v74[3];
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  io_registry_entry_t *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  const char *v86;
  _OWORD v87[8];
  io_registry_entry_t parent[16];
  long long v89;
  long long v90;
  long long v91;
  long long v92;
  uint8_t v93[4];
  uint64_t v94;
  io_name_t location;
  io_name_t name;

  id v5 = [a3 unsignedLongLongValue];
  CFDictionaryRef v6 = IORegistryEntryIDMatching((uint64_t)v5);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10005041C();
    }
    return 0;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100050490();
    }
    return 0;
  }
  io_registry_entry_t v8 = MatchingService;
  v64 = v5;
  v65 = a3;
  entryID = 0;
  memset(name, 0, sizeof(name));
  memset(location, 0, sizeof(location));
  IORegistryEntryGetRegistryEntryID(MatchingService, &entryID);
  IORegistryEntryGetName(v8, name);
  IORegistryEntryGetLocationInPlane(v8, "IOService", location);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    if (location[0]) {
      v55 = "@";
    }
    else {
      v55 = "";
    }
    parent[0] = 136316674;
    if (location[0]) {
      v56 = location;
    }
    else {
      v56 = "";
    }
    *(void *)&parent[1] = "IOPortGetParentPortForService";
    LOWORD(parent[3]) = 1024;
    *(io_registry_entry_t *)((char *)&parent[3] + 2) = v8;
    HIWORD(parent[4]) = 2080;
    *(void *)&parent[5] = name;
    LOWORD(parent[7]) = 2080;
    *(void *)((char *)&parent[7] + 2) = v55;
    HIWORD(parent[9]) = 2080;
    *(void *)&parent[10] = v56;
    LOWORD(parent[12]) = 2048;
    *(void *)((char *)&parent[12] + 2) = entryID;
    HIWORD(parent[14]) = 1024;
    parent[15] = 1;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: service: %d (%s%s%s, 0x%llx), builtIn: %d", (uint8_t *)parent, 0x40u);
  }
  IOObjectRetain(v8);
  object = v8;
  while (!IORegistryEntryInPlane(v8, "IOPort"))
  {
    LODWORD(v87[0]) = 0;
    ParentEntry = IORegistryEntryGetParentEntry(v8, "IOService", (io_registry_entry_t *)v87);
    IOObjectRelease(v8);
    io_registry_entry_t v8 = v87[0];
    if (ParentEntry) {
      int v15 = 0;
    }
    else {
      int v15 = v87[0];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      parent[0] = 136315394;
      *(void *)&parent[1] = "IOPortGetParentPortForService";
      LOWORD(parent[3]) = 1024;
      *(io_registry_entry_t *)((char *)&parent[3] + 2) = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Walking up IOService plane for currentService: %d", (uint8_t *)parent, 0x12u);
      if (!v15)
      {
LABEL_29:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          parent[0] = 136316162;
          if (location[0]) {
            id v16 = "@";
          }
          else {
            id v16 = "";
          }
          *(void *)&parent[1] = "IOPortGetParentPortForService";
          v17 = location;
          if (!location[0]) {
            v17 = "";
          }
          LOWORD(parent[3]) = 2080;
          *(void *)((char *)&parent[3] + 2) = "IOPort";
          HIWORD(parent[5]) = 2080;
          *(void *)&parent[6] = name;
          LOWORD(parent[8]) = 2080;
          *(void *)((char *)&parent[8] + 2) = v16;
          HIWORD(parent[10]) = 2080;
          *(void *)&parent[11] = v17;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Could not find upstream service in %s plane! (service: %s%s%s)", (uint8_t *)parent, 0x34u);
        }
        goto LABEL_39;
      }
    }
    else if (!v15)
    {
      goto LABEL_29;
    }
  }
  CFAllocatorRef v9 = kCFAllocatorDefault;
  while (1)
  {
    if (v8 != object && IOObjectConformsTo(v8, "IOPort"))
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, @"BuiltIn", kCFAllocatorDefault, 0);
      id v11 = (id)CFMakeCollectable(CFProperty);
      if (v11)
      {
        if ([v11 BOOLValue])
        {
          v57 = (dispatch_queue_t *)self;
          v58 = object;
          goto LABEL_81;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100050A90(v93, &v94);
      }
    }
    parent[0] = 0;
    uint64_t v12 = IORegistryEntryGetParentEntry(v8, "IOPort", parent);
    IOObjectRelease(v8);
    if (v12) {
      break;
    }
    int v13 = IOObjectConformsTo(parent[0], "IOService");
    io_registry_entry_t v8 = parent[0];
    if (!v13)
    {
      IOObjectRelease(parent[0]);
      goto LABEL_39;
    }
    if (!parent[0]) {
      goto LABEL_39;
    }
  }
  int v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v18) {
    sub_100050A14(v18, v19, v20, v21, v22, v23, v24, v25);
  }
LABEL_39:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10005094C();
  }
  long long v26 = object;
  IOObjectRetain(object);
  long long v27 = 0;
  long long v28 = 0;
  CFAllocatorRef v9 = kCFAllocatorDefault;
  while (1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      parent[0] = 136315394;
      *(void *)&parent[1] = "IOPortGetParentPortForService";
      LOWORD(parent[3]) = 1024;
      *(io_registry_entry_t *)((char *)&parent[3] + 2) = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Checking currentEntry: %d", (uint8_t *)parent, 0x12u);
    }
    long long v29 = IORegistryEntryCreateCFProperty(v26, @"port-type", kCFAllocatorDefault, 0);
    long long v30 = (id)CFMakeCollectable(v29);
    if (v30)
    {
      long long v31 = (void *)v30;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v31 length] == (id)4)
      {
        long long v28 = *(unsigned int *)[v31 bytes];
        if (v28 >= 0x15)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            parent[0] = 136315394;
            *(void *)&parent[1] = "IOPortGetParentPortForService";
            LOWORD(parent[3]) = 2080;
            *(void *)((char *)&parent[3] + 2) = "port-type";
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Invalid %s property value", (uint8_t *)parent, 0x16u);
          }
          long long v28 = 0;
        }
      }
    }
    long long v32 = IORegistryEntryCreateCFProperty(v26, @"port-number", kCFAllocatorDefault, 0);
    long long v33 = (id)CFMakeCollectable(v32);
    if (v33)
    {
      v34 = (void *)v33;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v34 length] == (id)4)
      {
        long long v27 = *(unsigned int *)[v34 bytes];
        if ((v27 - 100) <= 0xFFFFFF9C)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            parent[0] = 136315394;
            *(void *)&parent[1] = "IOPortGetParentPortForService";
            LOWORD(parent[3]) = 2080;
            *(void *)((char *)&parent[3] + 2) = "port-type";
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Invalid %s property value", (uint8_t *)parent, 0x16u);
          }
          long long v27 = 0;
          goto LABEL_60;
        }
      }
    }
    if (v28 && v27) {
      break;
    }
LABEL_60:
    parent[0] = 0;
    IORegistryEntryGetParentEntry(v26, "IOService", parent);
    IOObjectRelease(v26);
    long long v26 = parent[0];
    if (!parent[0]) {
      goto LABEL_70;
    }
  }
  v69 = 0;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  memset(parent, 0, sizeof(parent));
  memset(v87, 0, sizeof(v87));
  IORegistryEntryGetRegistryEntryID(v26, &v69);
  IORegistryEntryGetName(v26, (char *)parent);
  IORegistryEntryGetLocationInPlane(v26, "IOService", (char *)v87);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    if (LOBYTE(v87[0])) {
      v35 = "@";
    }
    else {
      v35 = "";
    }
    v76 = "IOPortGetParentPortForService";
    if (LOBYTE(v87[0])) {
      __int16 v36 = (const char *)v87;
    }
    else {
      __int16 v36 = "";
    }
    v77 = 2080;
    v78 = "port-type";
    v79 = 2080;
    v80 = "port-number";
    v81 = 2080;
    v82 = parent;
    v83 = 2080;
    v84 = v35;
    v85 = 2080;
    v86 = v36;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Found registry entry with %s and %s properties! (currentEntry: %s%s%s)", buf, 0x3Eu);
  }
LABEL_70:
  if (!v28 || !v27)
  {
    v57 = (dispatch_queue_t *)self;
    v58 = object;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050858((uint64_t)name, location);
    }
    goto LABEL_95;
  }
  v57 = (dispatch_queue_t *)self;
  v58 = object;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    parent[0] = 136315650;
    *(void *)&parent[1] = "IOPortGetParentPortForService";
    LOWORD(parent[3]) = 1024;
    *(io_registry_entry_t *)((char *)&parent[3] + 2) = v28;
    HIWORD(parent[4]) = 1024;
    parent[5] = v27;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Searching for built-in port... (portType: %d, portNumber: %d)", (uint8_t *)parent, 0x18u);
  }
  v37 = IOServiceMatching("IOPort");
  v38 = (id)CFMakeCollectable(v37);
  v73[0] = @"PortType";
  v74[0] = +[NSNumber numberWithUnsignedInt:v28];
  v73[1] = @"PortNumber";
  v39 = +[NSNumber numberWithUnsignedInt:v27];
  v73[2] = @"BuiltIn";
  v74[1] = v39;
  v74[2] = &__kCFBooleanTrue;
  objc_msgSend(v38, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 3), @"IOPropertyMatch");
  if (v38) {
    v40 = (const __CFDictionary *)CFRetain(v38);
  }
  else {
    v40 = 0;
  }
  v41 = IOServiceGetMatchingService(kIOMainPortDefault, v40);
  if (!v41)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050648((uint64_t)v38);
    }
LABEL_95:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050584((uint64_t)name, location);
    }
    IOObjectRelease(v58);
LABEL_98:
    if (os_log_type_enabled(v57[4], OS_LOG_TYPE_ERROR)) {
      sub_100050504();
    }
    return 0;
  }
  io_registry_entry_t v8 = v41;
LABEL_81:
  *(void *)&v87[0] = 0;
  IORegistryEntryGetRegistryEntryID(v58, (uint64_t *)v87);
  v42 = IORegistryEntryCreateCFProperty(v8, @"PortDescription", v9, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    if (location[0]) {
      v43 = "@";
    }
    else {
      v43 = "";
    }
    parent[0] = 136316674;
    v44 = location;
    if (!location[0]) {
      v44 = "";
    }
    *(void *)&parent[1] = "IOPortGetParentPortForService";
    LOWORD(parent[3]) = 2080;
    *(void *)((char *)&parent[3] + 2) = "built-in";
    HIWORD(parent[5]) = 2112;
    *(void *)&parent[6] = v42;
    LOWORD(parent[8]) = 2048;
    *(void *)((char *)&parent[8] + 2) = *(void *)&v87[0];
    HIWORD(parent[10]) = 2080;
    *(void *)&parent[11] = name;
    LOWORD(parent[13]) = 2080;
    *(void *)((char *)&parent[13] + 2) = v43;
    HIWORD(parent[15]) = 2080;
    *(void *)&v89 = v44;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Found %s port %@ (0x%llx) for service %s%s%s!", (uint8_t *)parent, 0x48u);
  }
  IOObjectRelease(v58);
  if (!v8) {
    goto LABEL_98;
  }
  v45 = IORegistryEntryCreateCFProperty(v8, @"PortType", 0, 0);
  v46 = (id)CFMakeCollectable(v45);
  v47 = IORegistryEntryCreateCFProperty(v8, @"PortNumber", 0, 0);
  v48 = (id)CFMakeCollectable(v47);
  IOObjectRelease(v8);
  if (!v46 || !v48)
  {
    if (os_log_type_enabled(v57[4], OS_LOG_TYPE_ERROR)) {
      sub_1000506F0();
    }
    return 0;
  }
  v49 = IOServiceMatching("IOPortTransportState");
  v50 = (id)CFMakeCollectable(v49);
  v71[0] = @"ParentPortType";
  v71[1] = @"ParentPortNumber";
  v72[0] = v46;
  v72[1] = v48;
  v71[2] = @"Active";
  v71[3] = @"AuthorizationRequired";
  v72[2] = &__kCFBooleanTrue;
  v72[3] = &__kCFBooleanTrue;
  v71[4] = @"AuthorizationStatus";
  v72[4] = &off_100086788;
  objc_msgSend(v50, "setObject:forKeyedSubscript:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 5), @"IOPropertyMatch");
  *(_DWORD *)location = 0;
  v51 = IONotificationPortCreate(kIOMasterPortDefault);
  IONotificationPortSetDispatchQueue(v51, v57[3]);
  if (v50) {
    v52 = (const __CFDictionary *)CFRetain(v50);
  }
  else {
    v52 = 0;
  }
  v59 = IOServiceAddMatchingNotification(v51, "IOServiceMatched", v52, (IOServiceMatchingCallback)sub_100017404, 0, (io_iterator_t *)location);
  v53 = v59 == 0;
  if (v59)
  {
    if (os_log_type_enabled(v57[4], OS_LOG_TYPE_ERROR)) {
      sub_1000507D8();
    }
    IONotificationPortDestroy(v51);
  }
  else
  {
    v60 = [(dispatch_queue_t *)v57 updaterForRegistryEntryID:v65];
    v61 = v57[4];
    if (v60)
    {
      v62 = v60;
      if (os_log_type_enabled(v57[4], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)name = 136315394;
        *(void *)&name[4] = "-[UARPUpdaterServiceManager enableTRMSystemAuthenticationForRegistryEntryID:]";
        *(_WORD *)&name[12] = 2048;
        *(void *)&name[14] = v64;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%s: Enabling TRM System Authentication Mode for registryEntryID: 0x%llx", (uint8_t *)name, 0x16u);
      }
      objc_msgSend(v62, "storeIONotificationPort:forRegistryEntryID:", +[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v51, v64), v65);
    }
    else if (os_log_type_enabled(v57[4], OS_LOG_TYPE_ERROR))
    {
      sub_100050764();
    }
    v63 = v57[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017684;
    block[3] = &unk_10007D5D0;
    v68 = *(_DWORD *)location;
    dispatch_async(v63, block);
  }
  return v53;
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v5 = -[UARPUpdaterServiceManager updaterForRegistryEntryID:](self, "updaterForRegistryEntryID:");
  if (!v5)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    sub_100050B38(a3);
    goto LABEL_11;
  }
  CFDictionaryRef v6 = v5;
  id v7 = [v5 findAndReleaseIONotificationPortForRegistryEntryID:a3];
  log = self->_log;
  if (!v7)
  {
    BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    sub_100050BBC(a3);
LABEL_11:
    LOBYTE(v10) = 0;
    return v10;
  }
  CFAllocatorRef v9 = v7;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    int v13 = "-[UARPUpdaterServiceManager disableTRMSystemAuthenticationForRegistryEntryID:]";
    __int16 v14 = 2048;
    id v15 = [a3 unsignedLongLongValue];
    __int16 v16 = 2112;
    id v17 = [v6 serviceName];
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Releasing registered IONotificationPort for registryEntryID: 0x%llx / %@", (uint8_t *)&v12, 0x20u);
  }
  IONotificationPortDestroy((IONotificationPortRef)[v9 pointerValue]);

  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  id v9 = +[UARPSupportedAccessory findByAppleModelNumber:a4];
  if (!v9 || (BOOL v10 = v9, ![v9 updaterName]))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100050C40();
    }
    return 0;
  }
  id v11 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", [v10 updaterName]);
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100050CB4(v10);
    }
    return 0;
  }
  return [v11 dynamicAssetSolicitation:a3 modelNumber:a4 notifyService:a5];
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  id v9 = [a4 count];
  if (v9)
  {
    id v22 = a3;
    id v23 = a5;
    id v10 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [a4 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(a4);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v17 = +[UARPSupportedAccessory findByAppleModelNumber:v16];
          int v18 = v17;
          if (!v13) {
            id v13 = [v17 updaterName];
          }
          if ([v18 updaterName]
            && (objc_msgSend(v13, "isEqualToString:", objc_msgSend(v18, "updaterName")) & 1) != 0)
          {
            [v10 addObject:v16];
          }
          else
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              long long v29 = "-[UARPUpdaterServiceManager dynamicAssetSolicitation:modelNumbers:notifyService:]";
              __int16 v30 = 2112;
              long long v31 = v18;
              __int16 v32 = 2112;
              id v33 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Discarding accessory %@ that does not belong to selected service %@", buf, 0x20u);
            }
          }
        }
        id v12 = [a4 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v12);
    }
    else
    {
      id v13 = 0;
    }
    id v20 = [(UARPUpdaterServiceManager *)self updaterForServiceName:v13];
    if (v20)
    {
      LOBYTE(v9) = objc_msgSend(v20, "dynamicAssetSolicitation:modelNumbers:notifyService:", v22, +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v10), v23);
    }
    else
    {
      LODWORD(v9) = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        sub_100050D38();
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
}

- (id)queryPendingTssRequestsForUpdater:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[UARPUpdaterServiceManager queryPendingTssRequestsForUpdater:]";
    __int16 v11 = 2112;
    id v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: For service %@", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [(UARPUpdaterServiceManager *)self updaterForServiceName:a3];
  if (v6)
  {
    id v7 = [v6 queryPendingTssRequests];
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100050E20();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100050DAC();
    }
    return &__NSArray0__struct;
  }
  return v7;
}

- (void)tssResponse:(id)a3 updaterName:(id)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[UARPUpdaterServiceManager tssResponse:updaterName:]";
    __int16 v11 = 2112;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: For service %@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(UARPUpdaterServiceManager *)self updaterForServiceName:a4];
  if (v8)
  {
    [v8 tssResponse:a3];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100050E94();
  }
}

@end