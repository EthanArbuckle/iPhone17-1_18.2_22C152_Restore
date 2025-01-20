@interface W5WiFiInterface
- (BOOL)isAWDLRealTimeMode;
- (BOOL)isSnifferSupported;
- (BOOL)isUsingCustomDNSSettings;
- (BOOL)isUsingCustomProxySetting;
- (BOOL)setChannel:(id)a3;
- (BOOL)setSTBCEnabled:(BOOL)a3;
- (BOOL)smartCCADesenseSupported;
- (BOOL)smartCCADesenseUSBPresence;
- (NSString)interfaceName;
- (W5WiFiInterface)init;
- (W5WiFiInterface)initWithCoreWiFiInterface:(id)a3;
- (id)__dnsSetupConfig;
- (id)__dnsStateConfig;
- (id)__ipv4SetupConfig;
- (id)__ipv4StateConfig;
- (id)__ipv6SetupConfig;
- (id)__ipv6StateConfig;
- (id)__proxiesSetupConfig;
- (id)cachedPreferredNetworksListWithUUID:(id)a3;
- (id)channel;
- (id)currentNetwork;
- (id)currentPreferredNetwork;
- (id)lastAssociatedSSID;
- (id)lastAssociatedSSIDString;
- (id)linkQualityUpdates;
- (id)performScanOnChannels:(id)a3 translate:(BOOL)a4;
- (id)preferredNetworksList;
- (id)scanCache:(BOOL)a3;
- (id)supportedChannels;
- (id)updatedWiFiCallback;
- (int)role;
- (int64_t)ipv4ConfigMethod;
- (int64_t)ipv6ConfigMethod;
- (int64_t)security;
- (void)__addlinkQualityUpdate:(id)a3;
- (void)__clearLinkQualityUpdates;
- (void)__startEventMonitoring;
- (void)__stopEventMonitoring;
- (void)__updateAWDLRealTimeMode:(BOOL)a3;
- (void)__updateLastAssociatedSSID;
- (void)clearCachedPreferredNetworksListWithUUID:(id)a3;
- (void)dealloc;
- (void)disassociate;
- (void)setUpdatedWiFiCallback:(id)a3;
- (void)setUpdatedWiFiInterfaceCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5WiFiInterface

- (W5WiFiInterface)initWithCoreWiFiInterface:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)W5WiFiInterface;
  v4 = [(W5WiFiInterface *)&v14 init];
  v5 = v4;
  if (!a3) {
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_15;
  }
  v6 = (CWFInterface *)a3;
  v5->_corewifi = v6;
  v7 = [[-[CWFInterface interfaceName](v6, "interfaceName") copy];
  v5->_interfaceName = v7;
  if (!v7) {
    goto LABEL_15;
  }
  if (Apple80211Open()) {
    goto LABEL_15;
  }
  v5->_a11Ref = 0;
  if (Apple80211BindToInterface()) {
    goto LABEL_15;
  }
  v8 = +[NSString stringWithFormat:@"com.apple.wifivelocityd.wifi-%@", v5->_interfaceName];
  v9 = dispatch_queue_create((const char *)[(__CFString *)v8 UTF8String], 0);
  v5->_queue = (OS_dispatch_queue *)v9;
  if (!v9) {
    goto LABEL_15;
  }
  dispatch_queue_set_specific(v9, &v5->_queue, (void *)1, 0);
  dispatch_queue_t v10 = dispatch_queue_create((const char *)[[-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", @".event") UTF8String];
  v5->_eventQueue = (OS_dispatch_queue *)v10;
  if (!v10
    || (v5->_linkQualityUpdates = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
        v5->_cachedPreferredNetworksListUUIDMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        v5->_lastAssociatedSSID = (NSData *)objc_msgSend(-[CWFInterface SSID](v5->_corewifi, "SSID"), "copy"),
        v5->_lastAssociatedSSIDString = (NSString *)objc_msgSend(-[CWFInterface networkName](v5->_corewifi, "networkName"), "copy"), SCDynamicStoreRef v11 = SCDynamicStoreCreate(kCFAllocatorDefault, v8, 0, 0), (v5->_storeRef = v11) == 0))
  {
LABEL_15:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v13 = [(NSString *)v5->_interfaceName UTF8String];
      *(_DWORD *)buf = 136446210;
      v16 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to initialize Wi-Fi interface (%{public}s)", buf, 0xCu);
    }

    return 0;
  }
  return v5;
}

- (W5WiFiInterface)init
{
}

- (void)setUpdatedWiFiInterfaceCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100052068;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  eventQueue = self->_eventQueue;
  if (eventQueue) {
    dispatch_release(eventQueue);
  }
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  if (self->_a11Ref) {
    Apple80211Close();
  }

  v6.receiver = self;
  v6.super_class = (Class)W5WiFiInterface;
  [(W5WiFiInterface *)&v6 dealloc];
}

- (int)role
{
  return [(CWFInterface *)self->_corewifi virtualInterfaceRole];
}

- (id)preferredNetworksList
{
  id v2 = [(CWFInterface *)self->_corewifi knownNetworkProfilesWithProperties:+[NSSet setWithArray:&off_1000EFF60]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v5) {
          id v5 = +[NSMutableArray array];
        }
        [v5 addObject:sub_1000522B4(v8)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }
  return [v5 copy];
}

- (void)__startEventMonitoring
{
  corewifi = self->_corewifi;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100052730;
  v4[3] = &unk_1000DEAC8;
  v4[4] = self;
  [(CWFInterface *)corewifi setEventHandler:v4 eventID:+[CWFEventID eventIDWithType:0 interfaceName:0]];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:1 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:2 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:3 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:4 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:6 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:8 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:7 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:14 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:15 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:16 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:17 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:23 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:18 interfaceName:0] error:0];
  [(CWFInterface *)self->_corewifi startMonitoringEvent:+[CWFEventID eventIDWithType:24 interfaceName:0] error:0];
  Apple80211EventMonitoringInit2();
  Apple80211StartMonitoringEvent();
  Apple80211StartMonitoringEvent();
  Apple80211StartMonitoringEvent();
  Apple80211StartMonitoringEvent();
  Apple80211StartMonitoringEvent();
}

- (void)startEventMonitoring
{
  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052F10;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

- (void)__stopEventMonitoring
{
  [(CWFInterface *)self->_corewifi stopMonitoringAllEvents];
  Apple80211StopMonitoringEvent();
  Apple80211StopMonitoringEvent();
  Apple80211StopMonitoringEvent();
  Apple80211StopMonitoringEvent();
  a11Ref = self->_a11Ref;

  _Apple80211EventMonitoringHalt(a11Ref);
}

- (void)stopEventMonitoring
{
  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053050;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

- (void)__updateAWDLRealTimeMode:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100053124;
  v4[3] = &unk_1000DEAF0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)__updateLastAssociatedSSID
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000531D8;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__clearLinkQualityUpdates
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000532D0;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__addlinkQualityUpdate:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005338C;
  v4[3] = &unk_1000DDC30;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)linkQualityUpdates
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1000534E8;
  long long v10 = sub_1000534F8;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100053504;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)supportedChannels
{
  id v2 = [(CWFInterface *)self->_corewifi supportedChannelsWithCountryCode:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v5) {
          id v5 = +[NSMutableArray array];
        }
        [v5 addObject:sub_100053688(v8)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }
  return [v5 copy];
}

- (id)lastAssociatedSSID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1000534E8;
  long long v10 = sub_1000534F8;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000537EC;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)lastAssociatedSSIDString
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1000534E8;
  long long v10 = sub_1000534F8;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100053930;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)channel
{
  id v2 = [(CWFInterface *)self->_corewifi channel];

  return sub_100053688(v2);
}

- (id)performScanOnChannels:(id)a3 translate:(BOOL)a4
{
  BOOL v4 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (!v8) {
          id v8 = +[NSMutableArray array];
        }
        id v12 = objc_alloc_init((Class)CWFChannel);
        [v12 setChannel:[v11 channel]];
        [v12 setFlags:[v11 flags]];
        [v8 addObject:v12];
      }
      id v7 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  id v13 = objc_alloc_init((Class)CWFScanParameters);
  [v13 setIncludeHiddenNetworks:1];
  [v13 setMergeScanResults:0];
  [v13 setChannels:v8];
  [v13 setIncludeProperties:[NSSet setWithArray:&off_1000EFF78]];
  id v14 = [(CWFInterface *)self->_corewifi performScanWithParameters:v13 error:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v15)
  {
    id v17 = 0;
    return [v17 copy];
  }
  id v16 = v15;
  id v17 = 0;
  uint64_t v18 = *(void *)v25;
  do
  {
    v19 = 0;
    do
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(v14);
      }
      id v20 = *(id *)(*((void *)&v24 + 1) + 8 * (void)v19);
      if (v17)
      {
        if (!v4) {
          goto LABEL_20;
        }
LABEL_19:
        id v20 = sub_100053C44(v20);
        goto LABEL_20;
      }
      id v17 = +[NSMutableArray array];
      if (v4) {
        goto LABEL_19;
      }
LABEL_20:
      [v17 addObject:v20];
      v19 = (char *)v19 + 1;
    }
    while (v16 != v19);
    id v21 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    id v16 = v21;
  }
  while (v21);
  return [v17 copy];
}

- (void)disassociate
{
}

- (BOOL)setChannel:(id)a3
{
  id v5 = objc_alloc_init((Class)CWFChannel);
  [v5 setChannel:[a3 channel]];
  [v5 setFlags:[a3 flags]];
  uint64_t v7 = 0;
  [(CWFInterface *)self->_corewifi setChannel:v5 error:&v7];
  return v7 == 0;
}

- (id)scanCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)CWFScanParameters);
  [v5 setCacheOnly:1];
  [v5 setIncludeHiddenNetworks:1];
  [v5 setMergeScanResults:0];
  [v5 setIncludeProperties:[NSSet setWithArray:&off_1000EFF90]];
  id v6 = [(CWFInterface *)self->_corewifi performScanWithParameters:v5 error:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7)
  {
    id v9 = 0;
    return [v9 copy];
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v16;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(id *)(*((void *)&v15 + 1) + 8 * (void)v11);
      if (v9)
      {
        if (!v3) {
          goto LABEL_9;
        }
LABEL_8:
        id v12 = sub_100053C44(v12);
        goto LABEL_9;
      }
      id v9 = +[NSMutableArray array];
      if (v3) {
        goto LABEL_8;
      }
LABEL_9:
      [v9 addObject:v12];
      uint64_t v11 = (char *)v11 + 1;
    }
    while (v8 != v11);
    id v13 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    id v8 = v13;
  }
  while (v13);
  return [v9 copy];
}

- (int64_t)security
{
  corewifi = self->_corewifi;
  id v3 = [(CWFInterface *)corewifi securityType];
  id v4 = [(CWFInterface *)corewifi WEPSubtype];
  id v5 = [(CWFInterface *)corewifi WAPISubtype];

  return sub_1000543CC((uint64_t)v3, (uint64_t)v4, (uint64_t)v5);
}

- (id)currentNetwork
{
  id v2 = [(CWFInterface *)self->_corewifi currentScanResult];

  return sub_100053C44(v2);
}

- (id)currentPreferredNetwork
{
  id v2 = [(CWFInterface *)self->_corewifi currentKnownNetworkProfile];

  return sub_1000522B4(v2);
}

- (id)cachedPreferredNetworksListWithUUID:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_1000534E8;
  uint64_t v11 = sub_1000534F8;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000545A8;
  block[3] = &unk_1000DEA78;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)clearCachedPreferredNetworksListWithUUID:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000546B0;
  v4[3] = &unk_1000DDC30;
  v4[4] = a3;
  void v4[5] = self;
  dispatch_async(queue, v4);
}

- (id)__ipv4StateConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv4);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__ipv6StateConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv6);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__ipv4SetupConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetIPv4);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__ipv6SetupConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetIPv6);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__dnsStateConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetDNS);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__dnsSetupConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetDNS);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__proxiesSetupConfig
{
  CFStringRef v3 = (const __CFString *)[(CWFInterface *)self->_corewifi networkServiceID];
  if (!v3) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetProxies);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (int64_t)ipv6ConfigMethod
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100054C60;
  v5[3] = &unk_1000DDD30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)ipv4ConfigMethod
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100054E38;
  v5[3] = &unk_1000DDD30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingCustomDNSSettings
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100055060;
  v5[3] = &unk_1000DDD30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingCustomProxySetting
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100055168;
  v5[3] = &unk_1000DDD30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)smartCCADesenseSupported
{
  return 0;
}

- (BOOL)smartCCADesenseUSBPresence
{
  return 0;
}

- (BOOL)isSnifferSupported
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(CWFInterface *)self->_corewifi capabilities];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) unsignedIntValue] == 11)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (BOOL)setSTBCEnabled:(BOOL)a3
{
  uint64_t v18 = 0;
  v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v4 = !a3;
  uint64_t v5 = +[NSString stringWithFormat:@"stbc_disable=%d", !a3];
  [self->_corewifi interfaceName].UTF8String
  __strlcpy_chk();
  LODWORD(v33) = 157;
  bzero(v30, 0x3BDC0uLL);
  uint64_t v29 = 0x1000000000001;
  v30[0] = 1;
  [(NSString *)v5 UTF8String];
  __strlcpy_chk();
  long long v31 = xmmword_1000B0A30;
  DWORD2(v33) = 245192;
  v34 = &v29;
  [(CWFInterface *)self->_corewifi setUserAutoJoinDisabled:1 error:&v18];
  uint64_t v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(CWFInterface *)self->_corewifi userAutoJoinDisabled];
    int v19 = 136316162;
    id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
    __int16 v21 = 2080;
    v22 = "W5WiFiInterface.m";
    __int16 v23 = 1024;
    int v24 = 1628;
    __int16 v25 = 1024;
    unsigned int v26 = v7;
    __int16 v27 = 2114;
    uint64_t v28 = v18;
    LODWORD(v17) = 44;
    long long v16 = &v19;
    _os_log_send_and_compose_impl();
  }
  if (v18)
  {
    long long v15 = sub_10009756C();
    BOOL v11 = 0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      __int16 v21 = 2080;
      v22 = "W5WiFiInterface.m";
      __int16 v23 = 1024;
      int v24 = 1629;
      LODWORD(v17) = 28;
      long long v16 = &v19;
      goto LABEL_7;
    }
  }
  else
  {
    int v8 = Apple80211RawSet();
    long long v9 = sub_10009756C();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v10)
      {
LABEL_8:
        BOOL v11 = 0;
        goto LABEL_12;
      }
      int v19 = 136316162;
      id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      __int16 v21 = 2080;
      v22 = "W5WiFiInterface.m";
      __int16 v23 = 1024;
      int v24 = 1637;
      __int16 v25 = 1024;
      unsigned int v26 = v4;
      __int16 v27 = 1024;
      LODWORD(v28) = v8;
      LODWORD(v17) = 40;
      long long v16 = &v19;
LABEL_7:
      _os_log_send_and_compose_impl();
      goto LABEL_8;
    }
    if (v10)
    {
      int v19 = 136315906;
      id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      __int16 v21 = 2080;
      v22 = "W5WiFiInterface.m";
      __int16 v23 = 1024;
      int v24 = 1633;
      __int16 v25 = 1024;
      unsigned int v26 = v4;
      LODWORD(v17) = 34;
      long long v16 = &v19;
      _os_log_send_and_compose_impl();
    }
    sub_100097044(@"disable_stbc=1", v4);
    BOOL v11 = 1;
  }
LABEL_12:
  -[CWFInterface setUserAutoJoinDisabled:error:](self->_corewifi, "setUserAutoJoinDisabled:error:", 0, &v18, v16, v17);
  uint64_t v12 = sub_10009756C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [(CWFInterface *)self->_corewifi userAutoJoinDisabled];
    int v19 = 136316162;
    id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
    __int16 v21 = 2080;
    v22 = "W5WiFiInterface.m";
    __int16 v23 = 1024;
    int v24 = 1643;
    __int16 v25 = 1024;
    unsigned int v26 = v13;
    __int16 v27 = 2114;
    uint64_t v28 = v18;
    _os_log_send_and_compose_impl();
  }
  return v11;
}

- (id)updatedWiFiCallback
{
  return self->_updatedWiFiCallback;
}

- (void)setUpdatedWiFiCallback:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)isAWDLRealTimeMode
{
  return self->_isAWDLRealTimeMode;
}

@end