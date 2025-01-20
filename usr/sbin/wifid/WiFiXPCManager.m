@interface WiFiXPCManager
+ (id)__filteredScanResults:(__CFArray *)a3 scanParameters:(id)a4;
+ (id)sharedXPCManager;
- (BOOL)__isActivityRegisteredWithType:(int64_t)a3;
- (BOOL)isBackgroundActivityRegistered;
- (BOOL)isDisableAutoJoinActivityRegistered;
- (BOOL)isForegroundActivityRegistered;
- (BOOL)isQuiesceWiFiActivityRegistered;
- (BOOL)isWiFiBoundActivityRegistered;
- (BOOL)isWoWActivityRegistered;
- (WiFiXPCManager)init;
- (__WiFiDeviceManager)__deviceManagerWithInterfaceName:(id)a3;
- (__WiFiManager)getWiFiManager;
- (__WiFiNetwork)__copyCurrentKnownNetworkRef;
- (__WiFiNetwork)__copyCurrentNetworkRef;
- (__WiFiNetwork)__copyCurrentSessionBasedNetworkRef;
- (__WiFiNetwork)copyCachedCurrentKnownNetworkRef:(id)a3;
- (__WiFiNetwork)copyCachedCurrentNetworkRef:(id)a3;
- (__WiFiNetwork)copyCachedCurrentSessionBasedNetworkRef;
- (id)__OSSpecificAttributes;
- (id)__copyCurrentNetworkHotspotNetwork;
- (id)__getSensingParams:(id)a3;
- (id)__peerAssistedDiscoveryNetworksForUUID:(id)a3;
- (id)__queueForRequest:(id)a3;
- (id)__sanitizeSensingParams:(id)a3;
- (id)__supportedRequestTypes;
- (id)copyCachedCurrentHotspotNetwork;
- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)__addKnownBSS:(id)a3;
- (void)__addKnownNetworkProfile:(id)a3;
- (void)__associate:(id)a3 XPCConnection:(id)a4;
- (void)__clearAutoJoinDenyList:(id)a3;
- (void)__disassociate:(id)a3 XPCConnection:(id)a4;
- (void)__getAutoHotspotMode:(id)a3;
- (void)__getAutoJoinDenyList:(id)a3;
- (void)__getAutoJoinMetric:(id)a3;
- (void)__getAutoJoinStatistics:(id)a3;
- (void)__getBackgroundScanConfiguration:(id)a3;
- (void)__getCountryBandSupport:(id)a3;
- (void)__getCurrentNetworkProfile:(id)a3 XPCConnection:(id)a4;
- (void)__getCurrentScanResult:(id)a3;
- (void)__getDeviceUUID:(id)a3;
- (void)__getKnownNetworkProfiles:(id)a3;
- (void)__getPassword:(id)a3;
- (void)__getThermalIndex:(id)a3;
- (void)__getUserAutoJoinState:(id)a3;
- (void)__getUserSettings:(id)a3;
- (void)__getWiFiAssistOverrideReasons:(id)a3;
- (void)__handleActivity:(id)a3;
- (void)__performANQP:(id)a3;
- (void)__performAutoJoin:(id)a3;
- (void)__performNDD:(id)a3 XPCConnection:(id)a4;
- (void)__performRanging:(id)a3;
- (void)__performScan:(id)a3 XPCConnection:(id)a4;
- (void)__performSensing:(id)a3;
- (void)__removeKnownBSS:(id)a3;
- (void)__removeKnownNetworkProfile:(id)a3;
- (void)__resetAutoJoinStatistics:(id)a3;
- (void)__setAutoHotspotMode:(id)a3;
- (void)__setAutoJoinDenyList:(id)a3;
- (void)__setBackgroundScanConfiguration:(id)a3;
- (void)__setBlockedBands:(id)a3;
- (void)__setCompanionCountryCode:(id)a3;
- (void)__setOSSpecificAttributeForKey:(__CFString *)a3 attributes:(id)a4;
- (void)__setPassword:(id)a3;
- (void)__setPeerAssistedDiscoveryNetwork:(id)a3 interfaceName:(id)a4 UUID:(id)a5;
- (void)__setPower:(id)a3 XPCConnection:(id)a4;
- (void)__setRangeable:(id)a3;
- (void)__setRangingIdentifier:(id)a3;
- (void)__setThermalIndex:(id)a3;
- (void)__setUserAutoJoinState:(id)a3 XPCConnection:(id)a4;
- (void)__setUserSettings:(id)a3;
- (void)__startAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4;
- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4;
- (void)__stopAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4;
- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4;
- (void)__updateKnownBSS:(id)a3;
- (void)__updateKnownNetworkProfile:(id)a3 XPCConnection:(id)a4;
- (void)__updateSoftAPBand:(id)a3 XPCConnection:(id)a4;
- (void)activate;
- (void)associationDoneWithNetwork:(__WiFiNetwork *)a3 error:(int)a4 interfaceName:(id)a5;
- (void)autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4;
- (void)autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4;
- (void)autoJoinUpdatedWithState:(int64_t)a3 interfaceName:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)replayLinkUpEventWithInterfaceName:(id)a3;
- (void)sendAutoHotspotModeDidChangeEvent;
- (void)sendInternetRelayLinkChangedEvent:(BOOL)a3 rssi:(int64_t)a4 interfaceName:(id)a5;
- (void)sendKnownNetworkDidChangeEventForProfile:(id)a3 eventType:(int64_t)a4;
- (void)sendUserAutoJoinStateDidChangeEvent;
- (void)sendUserSettingsDidChangeEvent;
- (void)sendWiFiAssistEventWithInterfaceName:(id)a3 linkQualityMetricInfo:(id)a4;
- (void)sendWoWDidChangeEventWithInterfaceName:(id)a3;
- (void)sendXPCEvent:(id)a3;
- (void)setCachedCurrentHotspotNetwork:(id)a3;
- (void)setCachedCurrentKnownNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4;
- (void)setCachedCurrentNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4;
- (void)setCachedCurrentSessionBasedNetworkRef:(__WiFiNetwork *)a3;
- (void)setWiFiManager:(__WiFiManager *)a3;
- (void)willAssociateWithNetwork:(__WiFiNetwork *)a3 isAutoJoin:(BOOL)a4 interfaceName:(id)a5;
@end

@implementation WiFiXPCManager

- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4
{
  v7 = sub_100005EFC((uint64_t)self->_managerRef);
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000849C;
    v8[3] = &unk_10023EC30;
    v8[4] = self;
    v8[5] = a4;
    dispatch_async(v7, v8);
  }
}

- (void)sendWiFiAssistEventWithInterfaceName:(id)a3 linkQualityMetricInfo:(id)a4
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [a4 objectForKeyedSubscript:@"WIFI_ASSIST_OVERRIDE_REASON"];
  if (v8)
  {
    id v9 = +[NSMutableOrderedSet orderedSet];
    [v9 addObject:v8];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [a4 objectForKeyedSubscript:@"WIFI_ASSIST_OVERRIDE_REASONS"];
  if ([v10 count])
  {
    if (!v9) {
      id v9 = +[NSMutableOrderedSet orderedSet];
    }
    [v9 addObjectsFromArray:v10];
  }
  mutexQueue = self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023CF4;
  block[3] = &unk_100242568;
  block[4] = self;
  block[5] = a3;
  block[6] = v9;
  block[7] = &v15;
  dispatch_sync(mutexQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    id v12 = objc_alloc_init((Class)CWFXPCEvent);
    [v12 setType:34];
    [v12 setInterfaceName:a3];
    [v12 setTimestamp:+[NSDate date](NSDate, "date")];
    if (v9)
    {
      uint64_t v19 = CWFEventWiFiAssistOverrideReasonsKey;
      id v20 = [v9 array];
      v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    }
    else
    {
      v13 = 0;
    }
    [v12 setInfo:v13];
    [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v12 reply:0];
  }
  _Block_object_dispose(&v15, 8);
}

- (id)__peerAssistedDiscoveryNetworksForUUID:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = sub_100022D28;
  v11 = sub_100022C20;
  uint64_t v12 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008330;
  block[3] = &unk_1002424A8;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(mutexQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)__isActivityRegisteredWithType:(int64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(CWFXPCManager *)self->_XPCManager registeredActivities];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) type] == (id)a3)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (BOOL)isWiFiBoundActivityRegistered
{
  return [(WiFiXPCManager *)self __isActivityRegisteredWithType:3];
}

- (BOOL)isForegroundActivityRegistered
{
  return [(WiFiXPCManager *)self __isActivityRegisteredWithType:2];
}

- (BOOL)isBackgroundActivityRegistered
{
  return [(WiFiXPCManager *)self __isActivityRegisteredWithType:1];
}

+ (id)sharedXPCManager
{
  if (qword_10027DBD8 != -1) {
    dispatch_once(&qword_10027DBD8, &stru_100242540);
  }
  return (id)qword_10027DBD0;
}

- (void)setCachedCurrentNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4
{
  objc_sync_enter(self);
  if (a3)
  {
    uint64_t v7 = sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
    currentNetworkMap = self->_currentNetworkMap;
    if (v7)
    {
      [(NSMutableDictionary *)currentNetworkMap setObject:v7 forKeyedSubscript:a4];
      CFRelease(v7);
    }
    else
    {
      [(NSMutableDictionary *)currentNetworkMap setObject:0 forKeyedSubscript:a4];
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_currentNetworkMap setObject:0 forKeyedSubscript:a4];
  }

  objc_sync_exit(self);
}

- (void)setCachedCurrentKnownNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4
{
  objc_sync_enter(self);
  if (a3)
  {
    uint64_t v7 = sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
    currentKnownNetworkMap = self->_currentKnownNetworkMap;
    if (v7)
    {
      [(NSMutableDictionary *)currentKnownNetworkMap setObject:v7 forKeyedSubscript:a4];
      CFRelease(v7);
    }
    else
    {
      [(NSMutableDictionary *)currentKnownNetworkMap setObject:0 forKeyedSubscript:a4];
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_currentKnownNetworkMap setObject:0 forKeyedSubscript:a4];
  }

  objc_sync_exit(self);
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  uint64_t v9 = [(WiFiXPCManager *)self __queueForRequest:a5];
  if (v9)
  {
    long long v10 = v9;
    qos_class_t v11 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F06C;
    block[3] = &unk_1002425E0;
    block[4] = a5;
    block[5] = self;
    block[6] = a4;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    dispatch_async(v10, v12);
    _Block_release(v12);
  }
  else if ([a5 response])
  {
    long long v13 = (void (**)(id, NSError *, void))[a5 response];
    v13[2](v13, +[NSError errorWithDomain:NSPOSIXErrorDomain code:6 userInfo:0], 0);
  }
}

- (id)__queueForRequest:(id)a3
{
  if ((char *)[a3 type] - 57 <= (char *)1)
  {
    id v5 = [a3 info];
    if (!objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue")) {
      return self->_currentNetworkQueue;
    }
  }
  managerRef = self->_managerRef;

  return (id)sub_100005EFC((uint64_t)managerRef);
}

- (void)__getCurrentNetworkProfile:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  if (objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue"))
  {
    if (CWFGetOSLog()) {
      id v8 = CWFGetOSLog();
    }
    else {
      id v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int valuePtr = 136446722;
      v30 = "-[WiFiXPCManager __getCurrentNetworkProfile:XPCConnection:]";
      __int16 v31 = 2082;
      v32 = "WiFiXPCManager.m";
      __int16 v33 = 1024;
      int v34 = 454;
      LODWORD(v28) = 28;
      p_int valuePtr = &valuePtr;
      _os_log_send_and_compose_impl();
    }
    uint64_t v9 = [(WiFiXPCManager *)self __copyCurrentSessionBasedNetworkRef];
    long long v10 = [(WiFiXPCManager *)self __copyCurrentKnownNetworkRef];
  }
  else
  {
    uint64_t v9 = [(WiFiXPCManager *)self copyCachedCurrentSessionBasedNetworkRef];
    long long v10 = -[WiFiXPCManager copyCachedCurrentKnownNetworkRef:](self, "copyCachedCurrentKnownNetworkRef:", [objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")]);
  }
  qos_class_t v11 = v10;
  if (objc_msgSend(objc_msgSend(a3, "requestParameters"), "virtualInterfaceRole") == 10)
  {
    id v12 = [(WiFiXPCManager *)self copyCachedCurrentHotspotNetwork];
    if (v12)
    {
      long long v13 = v12;
      if (v11) {
        CFRelease(v11);
      }
      if ([v13 matchingKnownNetworkProfile]) {
        v14 = (__WiFiNetwork *)sub_1000CFEE8([v13 matchingKnownNetworkProfile], 0);
      }
      else {
        v14 = (__WiFiNetwork *)sub_1000D1628(v13);
      }
      qos_class_t v11 = v14;
      if (v14) {
        sub_10001C6A4((uint64_t)v14, @"IsPersonalHotspot", kCFBooleanTrue);
      }
    }
  }
  if (v11)
  {
    CFStringRef v15 = sub_10001F928(v9);
    CFStringRef v16 = sub_10001F928(v11);
    BOOL v17 = 0;
    if (v15 && v16) {
      BOOL v17 = CFEqual(v15, v16) != 0;
    }
    if (sub_10001FC1C((uint64_t)v11)
      && objc_msgSend(objc_msgSend(a4, "valueForEntitlement:", @"com.apple.wifi.eap-nearby-device-setup-config-copy"), "BOOLValue"))
    {
      int valuePtr = -1431655766;
      int v18 = sub_1001245BC(v11);
      int valuePtr = v18;
      uint64_t v19 = sub_1000ECB18(v18);
      if (v18 == 1 && !sub_100124628(v11))
      {
        int valuePtr = 4;
        CFAllocatorRef Default = CFAllocatorGetDefault();
        CFNumberRef v21 = CFNumberCreate(Default, kCFNumberIntType, &valuePtr);
        if (v21)
        {
          CFNumberRef v22 = v21;
          sub_10001C6A4((uint64_t)v11, @"ShareableStatus", v21);
          CFRelease(v22);
        }
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    v23 = sub_10001CECC((CFDictionaryRef *)v11);
    v24 = v23;
    if (v23)
    {
      [v23 setSessionBased:v17];
      [v24 setNearbyShareableStatus:v19];
    }
    v25 = 0;
    if (v9) {
      goto LABEL_33;
    }
  }
  else
  {
    v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    v24 = 0;
    if (v9) {
LABEL_33:
    }
      CFRelease(v9);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v25)
  {
    if (![a3 response]) {
      return;
    }
  }
  else
  {
    id v26 = +[NSMutableDictionary dictionary];
    [v26 setObject:v24 forKeyedSubscript:CWFXPCResultKey];
    if (![a3 response]) {
      return;
    }
  }
  (*((void (**)(void))[a3 response] + 2))();
}

- (__WiFiNetwork)copyCachedCurrentSessionBasedNetworkRef
{
  objc_sync_enter(self);
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef) {
    id v4 = (__WiFiNetwork *)sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)cachedCurrentSessionBasedNetworkRef);
  }
  else {
    id v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

- (__WiFiNetwork)copyCachedCurrentKnownNetworkRef:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->_currentKnownNetworkMap objectForKeyedSubscript:a3];
  if (v5) {
    id v6 = (__WiFiNetwork *)sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)v5);
  }
  else {
    id v6 = 0;
  }
  objc_sync_exit(self);
  return v6;
}

- (BOOL)isDisableAutoJoinActivityRegistered
{
  return [(WiFiXPCManager *)self __isActivityRegisteredWithType:6];
}

- (id)__supportedRequestTypes
{
  return &off_1002641B0;
}

- (__WiFiDeviceManager)__deviceManagerWithInterfaceName:(id)a3
{
  if (!a3) {
    return 0;
  }
  CFArrayRef v4 = sub_10000500C((CFArrayRef)self->_managerRef);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  if (CFArrayGetCount(v4) < 1)
  {
    CFRelease(v5);
    return 0;
  }
  CFIndex v6 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v6);
    uint64_t v8 = sub_100016E18((uint64_t)ValueAtIndex);
    if (v8 && (uint64_t v9 = sub_1000680F8(v8)) != 0)
    {
      CFArrayRef v10 = v9;
      if (CFArrayGetCount(v9) < 1)
      {
        CFTypeRef v14 = 0;
      }
      else
      {
        CFIndex v11 = 0;
        do
        {
          CFDictionaryRef v12 = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v11);
          Value = (void *)CFDictionaryGetValue(v12, @"VIRT_IF_NAME");
          if (Value && [Value isEqualToString:a3]) {
            CFTypeRef v14 = CFRetain(ValueAtIndex);
          }
          else {
            CFTypeRef v14 = 0;
          }
          ++v11;
        }
        while (CFArrayGetCount(v10) > v11 && !v14);
      }
      CFRelease(v10);
    }
    else
    {
      CFTypeRef v14 = 0;
    }
    ++v6;
  }
  while (CFArrayGetCount(v5) > v6 && !v14);
  CFRelease(v5);
  if (!v14) {
    return 0;
  }

  return (__WiFiDeviceManager *)CFAutorelease(v14);
}

- (__WiFiNetwork)__copyCurrentSessionBasedNetworkRef
{
  return (__WiFiNetwork *)sub_1000A4550((const __CFArray *)self->_managerRef);
}

- (__WiFiNetwork)__copyCurrentNetworkRef
{
  CFArrayRef v2 = sub_10000500C((CFArrayRef)self->_managerRef);
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    CFArrayRef v10 = 0;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      uint64_t v8 = sub_100016E18((uint64_t)ValueAtIndex);
      if (v8 && (uint64_t v9 = (const void *)sub_100016E20(v8)) != 0) {
        CFArrayRef v10 = (__WiFiNetwork *)sub_10000E5D0((uint64_t)ValueAtIndex, v9);
      }
      else {
        CFArrayRef v10 = 0;
      }
      ++v6;
    }
    while (v5 > v6 && !v10);
  }
  CFRelease(v3);
  return v10;
}

- (__WiFiNetwork)__copyCurrentKnownNetworkRef
{
  CFArrayRef v2 = sub_10000500C((CFArrayRef)self->_managerRef);
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    CFArrayRef v10 = 0;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      uint64_t v8 = sub_100016E18((uint64_t)ValueAtIndex);
      if (v8 && (uint64_t v9 = (const void *)sub_100016E20(v8)) != 0) {
        CFArrayRef v10 = (__WiFiNetwork *)sub_100111718((uint64_t)ValueAtIndex, v9);
      }
      else {
        CFArrayRef v10 = 0;
      }
      ++v6;
    }
    while (v5 > v6 && !v10);
  }
  CFRelease(v3);
  return v10;
}

- (id)__copyCurrentNetworkHotspotNetwork
{
  CFArrayRef v2 = sub_10000500C((CFArrayRef)self->_managerRef);
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    do
    {
      CFArrayGetValueAtIndex(v3, v6);
      uint64_t v7 = sub_10012D6A8();
      uint64_t v8 = (void *)v7;
      ++v6;
    }
    while (v5 > v6 && !v7);
  }
  CFRelease(v3);
  return v8;
}

- (__WiFiNetwork)copyCachedCurrentNetworkRef:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->_currentNetworkMap objectForKeyedSubscript:a3];
  if (v5) {
    CFIndex v6 = (__WiFiNetwork *)sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)v5);
  }
  else {
    CFIndex v6 = 0;
  }
  objc_sync_exit(self);
  return v6;
}

- (id)copyCachedCurrentHotspotNetwork
{
  objc_sync_enter(self);
  id v3 = [(CWFScanResult *)self->_currentHotspotNetwork copy];
  objc_sync_exit(self);
  return v3;
}

- (void)setCachedCurrentHotspotNetwork:(id)a3
{
  objc_sync_enter(self);

  self->_currentHotspotNetwork = (CWFScanResult *)[a3 copy];
  objc_sync_exit(self);
}

- (void)setCachedCurrentSessionBasedNetworkRef:(__WiFiNetwork *)a3
{
  objc_sync_enter(self);
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
  {
    CFRelease(cachedCurrentSessionBasedNetworkRef);
    self->_cachedCurrentSessionBasedNetworkRef = 0;
  }
  if (a3) {
    self->_cachedCurrentSessionBasedNetworkRef = (__WiFiNetwork *)sub_10001961C((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
  }

  objc_sync_exit(self);
}

- (void)__getDeviceUUID:(id)a3
{
  CFArrayRef v4 = sub_100091840(self->_managerRef, @"DeviceUUID");
  if (v4) {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
  }
  else {
    id v5 = 0;
  }
  id v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:v5 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    uint64_t v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__getCurrentScanResult:(id)a3
{
  id v5 = [a3 info];
  unsigned int v6 = [[v5 objectForKeyedSubscript:CWFXPCForceNoCacheKey] boolValue];
  if (v6)
  {
    uint64_t v7 = CWFGetOSLog() ? CWFGetOSLog() : &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136446722;
      id v20 = "-[WiFiXPCManager __getCurrentScanResult:]";
      __int16 v21 = 2082;
      CFNumberRef v22 = "WiFiXPCManager.m";
      __int16 v23 = 1024;
      int v24 = 411;
      LODWORD(v18) = 28;
      BOOL v17 = &v19;
      _os_log_send_and_compose_impl();
    }
  }
  if (objc_msgSend(objc_msgSend(a3, "requestParameters", v17, v18), "virtualInterfaceRole") == 10)
  {
    if (v6) {
      id v8 = [(WiFiXPCManager *)self __copyCurrentNetworkHotspotNetwork];
    }
    else {
      id v8 = [(WiFiXPCManager *)self copyCachedCurrentHotspotNetwork];
    }
    id v10 = v8;
  }
  else
  {
    if (v6) {
      uint64_t v9 = [(WiFiXPCManager *)self __copyCurrentNetworkRef];
    }
    else {
      uint64_t v9 = [[self copyCachedCurrentNetworkRef:objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")]
    }
    CFIndex v11 = v9;
    if (v9)
    {
      id v10 = sub_10000AD1C((uint64_t)v9);
      if (v6) {
        CFDictionaryRef v12 = [(WiFiXPCManager *)self __copyCurrentKnownNetworkRef];
      }
      else {
        CFDictionaryRef v12 = [-[WiFiXPCManager copyCachedCurrentKnownNetworkRef:](self, "copyCachedCurrentKnownNetworkRef:", [objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")]);
      }
      long long v13 = v12;
      if (v12)
      {
        CFTypeRef v14 = sub_10001CECC((CFDictionaryRef *)v12);
        if (v14) {
          id v10 = [v10 scanResultWithMatchingKnownNetworkProfile:v14];
        }
        CFRelease(v13);
      }
      CFRelease(v11);
    }
    else
    {
      id v10 = 0;
    }
  }
  id v15 = +[NSMutableDictionary dictionary];
  [v15 setObject:v10 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    CFStringRef v16 = (void (**)(id, void, id))[a3 response];
    v16[2](v16, 0, v15);
  }
}

- (void)__getKnownNetworkProfiles:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfilePropertiesKey];
  CFArrayRef v7 = sub_10008EE94((uint64_t)self->_managerRef);
  if (v7)
  {
    CFArrayRef v8 = v7;
    uint64_t v9 = [(WiFiXPCManager *)self __copyCurrentSessionBasedNetworkRef];
    id v10 = v9;
    if (v9) {
      CFStringRef v11 = sub_10001F928(v9);
    }
    else {
      CFStringRef v11 = 0;
    }
    id v12 = +[NSMutableArray array];
    if (CFArrayGetCount(v8) >= 1)
    {
      CFIndex v13 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, v13);
        CFStringRef v15 = sub_10001F928(ValueAtIndex);
        BOOL v16 = 0;
        if (v11 && v15) {
          BOOL v16 = CFEqual(v11, v15) != 0;
        }
        BOOL v17 = sub_10001CECC((CFDictionaryRef *)ValueAtIndex);
        if (v17)
        {
          uint64_t v18 = v17;
          [v17 setSessionBased:v16];
          [v12 addObject:[v18 filteredNetworkProfileWithProperties:v6]];
        }
        ++v13;
      }
      while (CFArrayGetCount(v8) > v13);
    }
    if (v10) {
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  else
  {
    if (+[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0])
    {
      if (![a3 response]) {
        return;
      }
      goto LABEL_17;
    }
    id v12 = 0;
  }
  id v19 = +[NSMutableDictionary dictionary];
  id v20 = [v12 copy];
  [v19 setObject:v20 forKeyedSubscript:CWFXPCResultKey];
  if (![a3 response]) {
    return;
  }
LABEL_17:
  __int16 v21 = (void (*)(void))*((void *)[a3 response] + 2);

  v21();
}

- (void)__getThermalIndex:(id)a3
{
  uint64_t v4 = sub_1000A1A60((uint64_t)self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = +[NSNumber numberWithUnsignedInt:v4];
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    CFArrayRef v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__getCountryBandSupport:(id)a3
{
  uint64_t v4 = sub_1000A1A68(self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = +[NSNumber numberWithUnsignedInt:v4];
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    CFArrayRef v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__setThermalIndex:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCThermalIndexKey];
  if (v6) {
    sub_1000A1AE8((uint64_t)self->_managerRef, (uint64_t)[v6 unsignedIntValue]);
  }
  else {
    +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if ([a3 response])
  {
    CFArrayRef v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__setCompanionCountryCode:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCCountryCodeKey];
  if (v6)
  {
    sub_10009E48C((uint64_t)self->_managerRef, [v6 stringValue]);
    sub_1000AE044((uint64_t)self->_managerRef, 1);
  }
  else
  {
    +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if ([a3 response])
  {
    CFArrayRef v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__setPeerAssistedDiscoveryNetwork:(id)a3 interfaceName:(id)a4 UUID:(id)a5
{
  mutexQueue = self->_mutexQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100155894;
  v6[3] = &unk_1002424D0;
  v6[4] = a5;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a3;
  dispatch_async(mutexQueue, v6);
}

- (void)__startAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCAWDLPeerAssistedDiscoveryParamsKey];
  if (!v9
    || (id v10 = v9, (v11 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 22;
    goto LABEL_37;
  }
  CFStringRef v12 = v11;
  CFIndex v13 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
  if (!v13)
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 6;
    goto LABEL_37;
  }
  uint64_t v14 = (uint64_t)v13;
  if (objc_msgSend(-[WiFiXPCManager __peerAssistedDiscoveryNetworksForUUID:](self, "__peerAssistedDiscoveryNetworksForUUID:", objc_msgSend(a4, "UUID")), "objectForKeyedSubscript:", v12))
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 37;
    goto LABEL_37;
  }
  id v15 = +[NSMutableDictionary dictionary];
  if ([v10 peerMACAddress])
  {
    BOOL v16 = ether_aton((const char *)[v10 peerMACAddress].UTF8String);
    if (v16) {
      [v15 setObject:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16, 6) forKeyedSubscript:@"AWDL_IF_MAC_ADDRESS"];
    }
  }
  if ([v10 peerMasterChannel]) {
    [v15 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "peerMasterChannel")) forKeyedSubscript:@"AWDL_INFO_PEER_MASTER_CHANNEL"];
  }
  if ([v10 peerPreferredChannel]) {
    [v15 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "peerPreferredChannel"))] forKeyedSubscript:@"AWDL_INFO_PREFERRED_CHANNEL"];
  }
  if ([v10 peerSecondaryPreferredChannel])
  {
    unsigned __int16 v25 = (unsigned __int16)[v10 peerSecondaryPreferredChannel];
    [v15 setObject:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v25, 2) forKeyedSubscript:@"AWDL_INFO_EXT"];
  }
  if ([v10 peerAssistedDiscoveryMetric]) {
    [v15 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "peerAssistedDiscoveryMetric"))] forKeyedSubscript:@"AWDL_INFO_ASSISTED_DISCOVERY_METRIC"];
  }
  if ([v10 peerSupportedChannelFlags]) {
    [v15 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "peerSupportedChannelFlags"))] forKeyedSubscript:@"AWDL_INFO_SUPPORTED_CHANNEL_FLAGS"];
  }
  id v17 = +[NSMutableDictionary dictionary];
  if ([v10 localMasterChannel]) {
    [v17 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "localMasterChannel")) forKeyedSubscript:@"AWDL_INFO_PEER_MASTER_CHANNEL"];
  }
  if ([v10 localPreferredChannel]) {
    [v17 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 localPreferredChannel]) forKeyedSubscript:@"AWDL_INFO_PREFERRED_CHANNEL"];
  }
  if ([v10 localSecondaryPreferredChannel])
  {
    unsigned __int16 v25 = (unsigned __int16)[v10 localSecondaryPreferredChannel];
    [v17 setObject:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v25, 2) forKeyedSubscript:@"AWDL_INFO_EXT"];
  }
  if ([v10 localAssistedDiscoveryMetric]) {
    [v17 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "localAssistedDiscoveryMetric"))] forKeyedSubscript:@"AWDL_INFO_ASSISTED_DISCOVERY_METRIC"];
  }
  if ([v17 count]) {
    [v15 setObject:v17 forKeyedSubscript:@"AWDL_INFO_SELF"];
  }
  if ([v10 followMode])
  {
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"APPLE80211KEY_AWDL_INFO_ASSISTED_DISCOVERY_FOLLOW"];
    if ([v10 followModePreferredBand]) {
      [v15 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 followModePreferredBand]) forKeyedSubscript:@"AWDL_INFO_PEER_PREFERRED_BAND"];
    }
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100155E14;
  aBlock[3] = &unk_1002424F8;
  aBlock[4] = self;
  aBlock[5] = v12;
  aBlock[6] = a4;
  aBlock[7] = a3;
  uint64_t v18 = _Block_copy(aBlock);
  int v19 = sub_1001186D0(v14, v12, 4, v15, (uint64_t)sub_100155EF8, (uint64_t)v18, [a4 processName]);
  if (v19)
  {
    NSErrorDomain v20 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v21 = v19;
LABEL_37:
    CFNumberRef v22 = +[NSError errorWithDomain:v20 code:v21 userInfo:0];
    if (v22)
    {
      if ([a3 response])
      {
        __int16 v23 = (void (**)(id, NSError *, void))[a3 response];
        v23[2](v23, v22, 0);
      }
    }
  }
}

- (void)__stopAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v8)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 22;
    goto LABEL_16;
  }
  id v9 = v8;
  id v10 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v8];
  if (!v10)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 6;
    goto LABEL_16;
  }
  uint64_t v11 = (uint64_t)v10;
  id v12 = [[-[WiFiXPCManager __peerAssistedDiscoveryNetworksForUUID:](self, "__peerAssistedDiscoveryNetworksForUUID:", [a4 UUID]) objectForKeyedSubscript:v9];
  if (!v12)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 2;
    goto LABEL_16;
  }
  CFIndex v13 = sub_100019658((int)kCFAllocatorDefault, v12);
  if (!v13)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 12;
LABEL_16:
    id v17 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
    if (!v17) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10015619C;
  v21[3] = &unk_100242520;
  v21[4] = self;
  v21[5] = v9;
  v21[6] = a4;
  v21[7] = a3;
  id v15 = _Block_copy(v21);
  int v16 = sub_1001190F4(v11, v9, v14, (uint64_t)sub_10015625C, (uint64_t)v15);
  if (v16) {
    id v17 = +[NSError errorWithDomain:CWFManagerErrorDomain code:v16 userInfo:0];
  }
  else {
    id v17 = 0;
  }
  CFRelease(v14);
  if (v17)
  {
LABEL_8:
    if ([a3 response])
    {
      uint64_t v18 = (void (**)(id, NSError *, void))[a3 response];
      v18[2](v18, v17, 0);
    }
  }
}

- (void)__addKnownNetworkProfile:(id)a3
{
  id v5 = a3;
  id v6 = [a3 info];
  [objc_msgSend(objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey), "mutableCopy"), "addObjectsFromArray:", &off_1002641C8);
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (!v8) {
    goto LABEL_29;
  }
  id v9 = v8;
  id v10 = [objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v10) {
    goto LABEL_29;
  }
  uint64_t v11 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v10];
  if (!v11)
  {
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = 6;
LABEL_31:
    id v26 = +[NSError errorWithDomain:v33 code:v34 userInfo:0];
    if (!v26) {
      return;
    }
    goto LABEL_25;
  }
  uint64_t v12 = (uint64_t)v11;
  CFIndex v13 = sub_1000CFEE8(v9, 0);
  if (!v13)
  {
LABEL_29:
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = 22;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  CFArrayRef v15 = sub_10010A748(v12, v13);
  if (v15)
  {
    CFArrayRef v23 = v15;
    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 17;
    goto LABEL_36;
  }
  id v16 = [v9 copy];
  [v16 setOSSpecificAttributes:0];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = [[objc_msgSend(v9, "OSSpecificAttributes", 0) allKeys];
  id v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        [v16 setOSSpecificValue:[v9 OSSpecificAttributes][v9 OSSpecificAttributes objectForKeyedSubscript:v35] forKey:v35];
      }
      id v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v19);
  }
  CFArrayRef v22 = (const __CFArray *)sub_1000CFEE8(v16, 0);
  if (v22)
  {
    CFArrayRef v23 = v22;
    if (((unint64_t)[v9 addReason] & 0xFFFFFFFFFFFFFFFELL) == 0xE)
    {
      id v24 = +[NSMutableDictionary dictionary];
      [v24 setObject:sub_10001E404((uint64_t)v23, @"NetworkOriginator") forKeyedSubscript:@"NetworkOriginator"];
      [v24 setObject:sub_10001E404((uint64_t)v23, @"BundleIdentifier") forKeyedSubscript:@"BundleIdentifier"];
      if ([v16 isSessionBased]) {
        [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DisassociateOnSessionEnd"];
      }
      unsigned int v25 = sub_10009865C((uint64_t)self->_managerRef, 0, v23, (const __CFDictionary *)v24, (void (*)(uint64_t, const void *, uint64_t, uint64_t))sub_100156708, (uint64_t)a3);
      id v26 = 0;
      if (!v25) {
        goto LABEL_23;
      }
      NSErrorDomain v27 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v28 = v25;
    }
    else
    {
      id v29 = [[(id)sub_10001E404((uint64_t)v23, @"WiFiManagerKnownNetworksEventType") intValue];
      if (sub_100093634((uint64_t)self->_managerRef, v23, (uint64_t)v29))
      {
        if ([a3 response])
        {
          id v30 = [a3 response];
          (*((void (**)(id, void, void))v30 + 2))(v30, 0, 0);
        }

        id v26 = 0;
        goto LABEL_23;
      }
      NSErrorDomain v27 = NSPOSIXErrorDomain;
      uint64_t v28 = 6;
    }
LABEL_36:
    id v26 = +[NSError errorWithDomain:v27 code:v28 userInfo:0];
LABEL_23:
    CFRelease(v14);
    CFArrayRef v31 = v23;
    goto LABEL_24;
  }
  id v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  CFArrayRef v31 = (const __CFArray *)v14;
LABEL_24:
  CFRelease(v31);
  if (!v26) {
    return;
  }
LABEL_25:
  if ([a3 response])
  {
    v32 = (void (**)(id, NSError *, void))[a3 response];
    v32[2](v32, v26, 0);
  }
}

- (void)__updateKnownNetworkProfile:(id)a3 XPCConnection:(id)a4
{
  id v5 = a3;
  id v7 = [a3 info];
  id v8 = [[objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey) mutableCopy];
  [v8 addObjectsFromArray:&off_1002641E0];
  id v9 = [v5 info];
  id v10 = [v9 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [[[v5 requestParameters] interfaceName];
    if (v12)
    {
      CFIndex v13 = v12;
      uint64_t v14 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v12];
      if (!v14)
      {
        NSErrorDomain v39 = NSPOSIXErrorDomain;
        uint64_t v40 = 6;
        goto LABEL_34;
      }
      uint64_t v15 = (uint64_t)v14;
      id v16 = sub_1000CFEE8(v11, 0);
      if (v16)
      {
        id v17 = v16;
        id v18 = (CFDictionaryRef *)sub_10010AC8C(v15, v16);
        if (!v18)
        {
          long long v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
          long long v37 = v17;
LABEL_27:
          CFRelease(v37);
          goto LABEL_28;
        }
        id v19 = v18;
        uint64_t v20 = sub_10001CECC(v18);
        if (v20)
        {
          uint64_t v21 = v20;
          id v41 = a4;
          v42 = v17;
          id v43 = v5;
          v44 = v19;
          id v22 = [v5 info];
          id v23 = [v11 filteredNetworkProfileWithProperties:v8 OSSpecificKeys:[v22 objectForKeyedSubscript:CWFXPCOSSpecificKeysKey]];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v24 = [[objc_msgSend(v23, "OSSpecificAttributes") allKeys];
          id v25 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v46;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v46 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v21 setOSSpecificValue:objc_msgSend(objc_msgSend(v23, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(void *)(*((void *)&v45 + 1) + 8 * i)) forKey:*(void *)(*((void *)&v45 + 1) + 8 * i)];
              }
              id v26 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
            }
            while (v26);
          }
          [v23 setOSSpecificAttributes:0];
          [v21 mergeWithNetworkProfile:v23];
          id v29 = sub_1000CFEE8(v21, 0);
          if (v29)
          {
            id v19 = v44;
            if ((sub_10009CF8C((uint64_t)self->_managerRef, v29, [v41 processName]) & 1) != 0
              && sub_10009B1AC((uint64_t)self->_managerRef, v29, 1u))
            {
              unsigned int v30 = [v21 disable6EMode] == (id)2;
              CFArrayRef v31 = sub_10001A43C(v29);
              sub_100111BD0(v15, v13, v31, v30);
              v32 = sub_10000E5D0(v15, v13);
              if (v32)
              {
                NSErrorDomain v33 = v32;
                uint64_t v34 = sub_10001A43C(v32);
                long long v35 = sub_10001A43C(v29);
                id v17 = v42;
                id v5 = v43;
                if (v34 && v35 && CFEqual(v34, v35)) {
                  sub_10010C844(v15, (const void **)v29);
                }
                CFRelease(v33);
                long long v36 = 0;
                goto LABEL_25;
              }
              long long v36 = 0;
            }
            else
            {
              long long v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:6 userInfo:0];
            }
            id v17 = v42;
            id v5 = v43;
          }
          else
          {
            long long v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
            id v5 = v43;
            id v19 = v44;
          }
        }
        else
        {
          long long v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
          id v29 = 0;
        }
LABEL_25:
        CFRelease(v17);
        CFRelease(v19);
        if (!v29) {
          goto LABEL_28;
        }
        long long v37 = v29;
        goto LABEL_27;
      }
    }
  }
  NSErrorDomain v39 = NSPOSIXErrorDomain;
  uint64_t v40 = 22;
LABEL_34:
  long long v36 = +[NSError errorWithDomain:v39 code:v40 userInfo:0];
LABEL_28:
  if ([v5 response])
  {
    long long v38 = (void (**)(id, NSError *, void))[v5 response];
    v38[2](v38, v36, 0);
  }
}

- (void)__removeKnownNetworkProfile:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (!v6) {
    goto LABEL_38;
  }
  id v7 = v6;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCRemoveReasonKey];
  if (!v9) {
    goto LABEL_38;
  }
  id v10 = v9;
  id v11 = [objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v11) {
    goto LABEL_38;
  }
  id v12 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
  if (!v12)
  {
    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 6;
    goto LABEL_39;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = sub_1000CFEE8(v7, 0);
  if (!v14)
  {
LABEL_38:
    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 22;
LABEL_39:
    id v24 = +[NSError errorWithDomain:v27 code:v28 userInfo:0];
    goto LABEL_35;
  }
  uint64_t v15 = v14;
  CFArrayRef v16 = sub_10010A748(v13, v14);
  if (v16)
  {
    id v17 = (const void **)v16;
    id v18 = [v10 integerValue];
    int v19 = 0;
    uint64_t v20 = 4;
    switch((unint64_t)v18)
    {
      case 2uLL:
      case 3uLL:
        int v19 = 1;
        goto LABEL_10;
      case 4uLL:
        break;
      case 6uLL:
        int v19 = 0;
        uint64_t v20 = 7;
        break;
      case 7uLL:
        int v19 = 0;
        uint64_t v20 = 12;
        break;
      case 8uLL:
        int v19 = 0;
        uint64_t v20 = 13;
        break;
      default:
        int v19 = 0;
LABEL_10:
        uint64_t v20 = 2;
        break;
    }
    if (sub_10009A098((uint64_t)self->_managerRef, v17, v20))
    {
      sub_10010A7B4(v13, v17);
      if (v19)
      {
        if (CWFGetOSLog()) {
          uint64_t v21 = CWFGetOSLog();
        }
        else {
          uint64_t v21 = &_os_log_default;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v31 = 136315650;
          v32 = "-[WiFiXPCManager __removeKnownNetworkProfile:]";
          __int16 v33 = 2112;
          uint64_t v34 = sub_10001A43C(v17);
          __int16 v35 = 2048;
          id v36 = [v10 integerValue];
          LODWORD(v30) = 32;
          id v29 = &v31;
          _os_log_send_and_compose_impl();
        }
        sub_1000C94E0(v17);
      }
      if (CWFGetOSLog()) {
        id v22 = CWFGetOSLog();
      }
      else {
        id v22 = &_os_log_default;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = "false";
        if (!&_EAPTLSRemoveTrustExceptionsBindings) {
          id v23 = "true";
        }
        int v31 = 136315138;
        v32 = v23;
        LODWORD(v30) = 12;
        id v29 = &v31;
        _os_log_send_and_compose_impl();
      }
      if (&_EAPTLSRemoveTrustExceptionsBindings && sub_10001FC1C((uint64_t)v17))
      {
        sub_10001A43C(v17);
        EAPTLSRemoveTrustExceptionsBindings();
      }
      id v24 = 0;
    }
    else
    {
      id v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:6 userInfo:0];
    }
    CFRelease(v15);
    id v25 = v17;
  }
  else
  {
    id v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    id v25 = (const void **)v15;
  }
  CFRelease(v25);
LABEL_35:
  if (objc_msgSend(a3, "response", v29, v30))
  {
    id v26 = (void (**)(id, NSError *, void))[a3 response];
    v26[2](v26, v24, 0);
  }
}

- (void)__addKnownBSS:(id)a3
{
  id v3 = a3;
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCBSSKey];
    if (v9)
    {
      id v10 = v9;
      id v11 = [[[v3 requestParameters] interfaceName];
      if (v11)
      {
        id v12 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
        if (!v12)
        {
          NSErrorDomain v30 = NSPOSIXErrorDomain;
          uint64_t v31 = 6;
          goto LABEL_26;
        }
        uint64_t v13 = (uint64_t)v12;
        uint64_t v14 = sub_1000CFEE8(v7, 0);
        if (v14)
        {
          uint64_t v15 = v14;
          CFArrayRef v16 = (CFDictionaryRef *)sub_10010AC8C(v13, v14);
          if (!v16)
          {
            NSErrorDomain v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
            uint64_t v28 = v15;
LABEL_21:
            CFRelease(v28);
            goto LABEL_22;
          }
          id v17 = v16;
          id v18 = sub_10001CECC(v16);
          if (v18)
          {
            int v19 = v18;
            if (![v18 matchingKnownBSS:v10])
            {
              uint64_t v34 = self;
              id v35 = v3;
              id v20 = [v10 copy];
              [v20 setOSSpecificAttributes:0];
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v21 = [[[v10 OSSpecificAttributes] allKeys];
              id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v37;
                do
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v37 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    [v20 setOSSpecificValue:objc_msgSend(objc_msgSend(v10, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(void *)(*((void *)&v36 + 1) + 8 * i)) forKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
                  }
                  id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
                }
                while (v23);
              }
              [v19 setBSSList:[objc_msgSend(objc_msgSend(v19, "BSSList"), "setByAddingObject:", v20)];
              id v26 = sub_1000CFEE8(v19, 0);
              if (v26)
              {
                id v3 = v35;
                if (sub_10009B1AC((uint64_t)v34->_managerRef, v26, 1u))
                {
                  NSErrorDomain v27 = 0;
LABEL_19:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v26) {
                    goto LABEL_22;
                  }
                  uint64_t v28 = v26;
                  goto LABEL_21;
                }
                uint64_t v33 = 6;
              }
              else
              {
                uint64_t v33 = 22;
                id v3 = v35;
              }
              NSErrorDomain v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v33 userInfo:0];
              goto LABEL_19;
            }
            uint64_t v32 = 17;
          }
          else
          {
            uint64_t v32 = 2;
          }
          NSErrorDomain v27 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v32 userInfo:0];
          id v26 = 0;
          goto LABEL_19;
        }
      }
    }
  }
  NSErrorDomain v30 = NSPOSIXErrorDomain;
  uint64_t v31 = 22;
LABEL_26:
  NSErrorDomain v27 = +[NSError errorWithDomain:v30 code:v31 userInfo:0];
LABEL_22:
  if ([v3 response])
  {
    id v29 = (void (**)(id, NSError *, void))[v3 response];
    v29[2](v29, v27, 0);
  }
}

- (void)__updateKnownBSS:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = [a3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCBSSKey];
    if (v9)
    {
      id v10 = v9;
      id v11 = [[objc_msgSend(a3, "requestParameters") interfaceName];
      if (v11)
      {
        id v12 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
        if (!v12)
        {
          NSErrorDomain v35 = NSPOSIXErrorDomain;
          uint64_t v36 = 6;
          goto LABEL_26;
        }
        uint64_t v13 = (uint64_t)v12;
        uint64_t v14 = sub_1000CFEE8(v7, 0);
        if (v14)
        {
          uint64_t v15 = v14;
          CFArrayRef v16 = (CFDictionaryRef *)sub_10010AC8C(v13, v14);
          if (!v16)
          {
            uint64_t v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
            uint64_t v33 = v15;
LABEL_21:
            CFRelease(v33);
            goto LABEL_22;
          }
          id v17 = v16;
          id v18 = sub_10001CECC(v16);
          if (v18)
          {
            int v19 = v18;
            id v20 = [v18 matchingKnownBSS:v10];
            if (v20)
            {
              id v21 = v20;
              long long v38 = self;
              CFTypeRef cf = v15;
              id v22 = [a3 info];
              id v23 = [v22 objectForKeyedSubscript:CWFXPCBSSPropertiesKey];
              id v24 = [a3 info];
              id v25 = [v10 filteredBSSWithProperties:v23 OSSpecificKeys:[v24 objectForKeyedSubscript:CWFXPCOSSpecificKeysKey]];
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              id v26 = [[[v25 OSSpecificAttributes] allKeys];
              id v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v41;
                do
                {
                  for (i = 0; i != v28; i = (char *)i + 1)
                  {
                    if (*(void *)v41 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [v21 setOSSpecificValue:objc_msgSend(objc_msgSend(v25, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(void *)(*((void *)&v40 + 1) + 8 * i)) forKey:*(void *)(*((void *)&v40 + 1) + 8 * i)];
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
                }
                while (v28);
              }
              [v25 setOSSpecificAttributes:0];
              [v21 mergeWithBSS:v25];
              uint64_t v31 = sub_1000CFEE8(v19, 0);
              if (v31)
              {
                uint64_t v15 = cf;
                if (sub_10009B1AC((uint64_t)v38->_managerRef, v31, 1u))
                {
                  uint64_t v32 = 0;
LABEL_19:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v31) {
                    goto LABEL_22;
                  }
                  uint64_t v33 = v31;
                  goto LABEL_21;
                }
                uint64_t v37 = 6;
              }
              else
              {
                uint64_t v37 = 22;
                uint64_t v15 = cf;
              }
              uint64_t v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v37 userInfo:0];
              goto LABEL_19;
            }
          }
          uint64_t v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
          uint64_t v31 = 0;
          goto LABEL_19;
        }
      }
    }
  }
  NSErrorDomain v35 = NSPOSIXErrorDomain;
  uint64_t v36 = 22;
LABEL_26:
  uint64_t v32 = +[NSError errorWithDomain:v35 code:v36 userInfo:0];
LABEL_22:
  if ([a3 response])
  {
    uint64_t v34 = (void (**)(id, NSError *, void))[a3 response];
    v34[2](v34, v32, 0);
  }
}

- (void)__removeKnownBSS:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = [a3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCBSSKey];
    if (v9)
    {
      id v10 = v9;
      id v11 = [[objc_msgSend(a3, "requestParameters") interfaceName];
      if (v11)
      {
        id v12 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
        if (!v12)
        {
          NSErrorDomain v24 = NSPOSIXErrorDomain;
          uint64_t v25 = 6;
          goto LABEL_21;
        }
        uint64_t v13 = (uint64_t)v12;
        uint64_t v14 = sub_1000CFEE8(v7, 0);
        if (v14)
        {
          uint64_t v15 = v14;
          CFArrayRef v16 = (CFDictionaryRef *)sub_10010AC8C(v13, v14);
          if (!v16)
          {
            +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
            id v22 = v15;
LABEL_13:
            CFRelease(v22);
            goto LABEL_14;
          }
          id v17 = v16;
          id v18 = sub_10001CECC(v16);
          if (v18)
          {
            int v19 = v18;
            id v20 = [v18 matchingKnownBSS:v10];
            if (v20)
            {
              id v21 = [[objc_msgSend(v19, "BSSList") mutableCopy];
              [v21 removeObject:v20];
              [v19 setBSSList:v21];
              id v20 = sub_1000CFEE8(v19, 0);
              if (v20)
              {
                if (sub_10009B1AC((uint64_t)self->_managerRef, v20, 1u))
                {
LABEL_11:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v20) {
                    goto LABEL_14;
                  }
                  id v22 = v20;
                  goto LABEL_13;
                }
                uint64_t v26 = 6;
              }
              else
              {
                uint64_t v26 = 22;
              }
LABEL_27:
              +[NSError errorWithDomain:NSPOSIXErrorDomain code:v26 userInfo:0];
              goto LABEL_11;
            }
          }
          else
          {
            id v20 = 0;
          }
          uint64_t v26 = 2;
          goto LABEL_27;
        }
      }
    }
  }
  NSErrorDomain v24 = NSPOSIXErrorDomain;
  uint64_t v25 = 22;
LABEL_21:
  +[NSError errorWithDomain:v24 code:v25 userInfo:0];
LABEL_14:
  if ([a3 response])
  {
    id v23 = (void (*)(void))*((void *)[a3 response] + 2);
    v23();
  }
}

- (void)__setPower:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCPowerKey];
  if (v8 && (id v9 = v8, (v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    if ([(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v10])
    {
      sub_100091EE8((uint64_t)self->_managerRef, (int)[v9 BOOLValue], (const __CFString *)[a4 processName]);
      goto LABEL_5;
    }
    NSErrorDomain v12 = NSPOSIXErrorDomain;
    uint64_t v13 = 6;
  }
  else
  {
    NSErrorDomain v12 = NSPOSIXErrorDomain;
    uint64_t v13 = 22;
  }
  +[NSError errorWithDomain:v12 code:v13 userInfo:0];
LABEL_5:
  if ([a3 response])
  {
    id v11 = (void (*)(void))*((void *)[a3 response] + 2);
    v11();
  }
}

- (void)__getPassword:(id)a3
{
  id v4 = [a3 info];
  id v5 = [v4 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v5 && (id v6 = (CFDictionaryRef *)sub_1000CFEE8(v5, 0)) != 0)
  {
    id v7 = v6;
    CFStringRef v8 = sub_1000C62C8(v6);
    if (v8)
    {
      id v9 = (__CFString *)v8;
      id v10 = +[NSMutableDictionary dictionary];
      id v11 = [(__CFString *)v9 copy];
      [v10 setObject:v11 forKeyedSubscript:CWFXPCResultKey];
      if ([a3 response])
      {
        NSErrorDomain v12 = (void (**)(id, void, id))[a3 response];
        v12[2](v12, 0, v10);
      }
      CFRelease(v7);
      CFRelease(v9);
      return;
    }
    uint64_t v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
    CFRelease(v7);
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if (v13 && [a3 response])
  {
    uint64_t v14 = (void (*)(void))*((void *)[a3 response] + 2);
    v14();
  }
}

- (void)__setPassword:(id)a3
{
  id v4 = [a3 info];
  id v5 = [v4 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v5)
  {
    id v6 = v5;
    id v7 = [a3 info];
    CFStringRef v8 = (const __CFString *)[v7 objectForKeyedSubscript:CWFXPCPasswordKey];
    id v9 = sub_1000CFEE8(v6, 0);
    if (v9)
    {
      id v10 = v9;
      if (v8)
      {
        if (sub_1000C93E0(v9, v8))
        {
LABEL_5:
          CFRelease(v10);
          goto LABEL_6;
        }
      }
      else if (sub_1000C94E0(v9))
      {
        goto LABEL_5;
      }
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:6 userInfo:0];
      goto LABEL_5;
    }
  }
  +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
LABEL_6:
  if ([a3 response])
  {
    id v11 = (void (*)(void))*((void *)[a3 response] + 2);
    v11();
  }
}

- (void)__disassociate:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCDisassocReasonKey];
  if (!v8 || (id v9 = v8, (v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 22;
LABEL_22:
    CFArrayRef v16 = +[NSError errorWithDomain:v18 code:v19 userInfo:0];
    goto LABEL_17;
  }
  id v11 = v10;
  NSErrorDomain v12 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v10];
  if (!v12)
  {
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 6;
    goto LABEL_22;
  }
  uint64_t v13 = (uint64_t)v12;
  switch((unint64_t)[v9 integerValue])
  {
    case 1uLL:
      uint64_t v14 = 1033;
      break;
    case 2uLL:
    case 5uLL:
    case 6uLL:
      sub_1000A1EFC([+[WiFiXPCManager sharedXPCManager](WiFiXPCManager, "sharedXPCManager") getWiFiManager], [a4 processName]);
      uint64_t v14 = 1011;
      break;
    case 3uLL:
      uint64_t v14 = 1015;
      break;
    case 4uLL:
      uint64_t v14 = 1012;
      break;
    case 7uLL:
      uint64_t v14 = 1027;
      break;
    default:
      uint64_t v14 = 1001;
      break;
  }
  if (CWFGetOSLog()) {
    uint64_t v15 = CWFGetOSLog();
  }
  else {
    uint64_t v15 = &_os_log_default;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    id v23 = [v9 integerValue];
    LODWORD(v21) = 12;
    id v20 = &v22;
    _os_log_send_and_compose_impl();
  }
  sub_1000FEA7C(v13, v11, v14, "-[WiFiXPCManager __disassociate:XPCConnection:]", 1461);
  CFArrayRef v16 = 0;
LABEL_17:
  if (objc_msgSend(a3, "response", v20, v21))
  {
    id v17 = (void (**)(id, NSError *, void))[a3 response];
    v17[2](v17, v16, 0);
  }
}

- (void)__updateSoftAPBand:(id)a3 XPCConnection:(id)a4
{
  id v6 = [a3 info];
  id v7 = [v6 objectForKeyedSubscript:CWFXPCSoftAPBand];
  if (v7 && (id v8 = v7, (v9 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    id v10 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v9];
    if (v10)
    {
      uint64_t v11 = (uint64_t)v10;
      id v12 = [v8 integerValue];
      if (v12 == (id)2)
      {
        if (CWFGetOSLog()) {
          uint64_t v14 = CWFGetOSLog();
        }
        else {
          uint64_t v14 = &_os_log_default;
        }
        int v16 = 2;
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        *(_WORD *)id v23 = 0;
        LODWORD(v22) = 2;
        uint64_t v21 = v23;
      }
      else
      {
        if (v12 != (id)1)
        {
          if (CWFGetOSLog()) {
            uint64_t v15 = CWFGetOSLog();
          }
          else {
            uint64_t v15 = &_os_log_default;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v23 = 134217984;
            *(void *)&v23[4] = [v8 integerValue];
            LODWORD(v22) = 12;
            uint64_t v21 = v23;
            _os_log_send_and_compose_impl();
          }
          int v16 = 2;
          goto LABEL_24;
        }
        if (CWFGetOSLog()) {
          uint64_t v13 = CWFGetOSLog();
        }
        else {
          uint64_t v13 = &_os_log_default;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 1;
LABEL_24:
          sub_10010AF1C(v11, v16);
          id v17 = 0;
          goto LABEL_25;
        }
        *(_WORD *)id v23 = 0;
        LODWORD(v22) = 2;
        uint64_t v21 = v23;
        int v16 = 1;
      }
      _os_log_send_and_compose_impl();
      goto LABEL_24;
    }
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 6;
  }
  else
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 22;
  }
  id v17 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
LABEL_25:
  if (objc_msgSend(a3, "response", v21, v22, *(void *)v23))
  {
    NSErrorDomain v18 = (void (**)(id, NSError *, void))[a3 response];
    v18[2](v18, v17, 0);
  }
}

- (void)__associate:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  if (CWFGetOSLog()) {
    id v8 = CWFGetOSLog();
  }
  else {
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v39 = 0;
    LODWORD(v37) = 2;
    uint64_t v36 = &v39;
    _os_log_send_and_compose_impl();
  }
  id v9 = [a3 info:v36, v37];
  id v10 = [v9 objectForKeyedSubscript:CWFXPCAssocParamsKey];
  if (!v10) {
    goto LABEL_49;
  }
  uint64_t v11 = v10;
  id v12 = [objc_msgSend(v10, "scanResult") scanRecord];
  if (!v12) {
    goto LABEL_49;
  }
  id v13 = v12;
  uint64_t v14 = sub_100019658((int)kCFAllocatorDefault, v12);
  if (!v14) {
    goto LABEL_49;
  }
  uint64_t v15 = v14;
  id v16 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v16)
  {
    NSErrorDomain v34 = NSPOSIXErrorDomain;
    uint64_t v35 = 22;
    goto LABEL_54;
  }
  id v17 = v16;
  NSErrorDomain v18 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v16];
  if (!v18)
  {
    NSErrorDomain v34 = NSPOSIXErrorDomain;
    uint64_t v35 = 6;
    goto LABEL_54;
  }
  uint64_t v19 = (uint64_t)v18;
  id v38 = a4;
  uint64_t v20 = (CFDictionaryRef *)sub_10010A748((uint64_t)v18, v15);
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = sub_10001CECC(v20);
    if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "hiddenState")) {
      [v22 setHiddenState:[v11 knownNetworkProfile].hiddenState];
    }
    if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "EAPProfile")) {
      [v22 setEAPProfile:[objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "EAPProfile")];
    }
    CFRelease(v21);
    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
    id v22 = [[objc_msgSend(v11, "knownNetworkProfile") copy];
    if (!v22) {
      goto LABEL_23;
    }
  }
  [v22 setSSID:[objc_msgSend(objc_msgSend(v11, "scanResult"), "SSID")]];
  [v22 setPublicAirPlayNetwork:[objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork")]];
  id v23 = sub_1000CFEE8(v22, [v22 properties]);
  if (v23)
  {
    NSErrorDomain v24 = v23;
    CFDictionaryRef v25 = sub_10000E5B8((uint64_t)v23);
    if (!v25) {
      goto LABEL_22;
    }
    CFDictionaryRef v26 = v25;
    id v27 = +[NSMutableDictionary dictionary];
    [v27 addEntriesFromDictionary:v26];
    [v27 addEntriesFromDictionary:v13];
    id v28 = [v27 copy];
    CFRelease(v15);
    uint64_t v15 = sub_100019658((int)kCFAllocatorDefault, v28);
    CFRelease(v26);
    if (v15)
    {
LABEL_22:
      CFRelease(v24);
      goto LABEL_23;
    }
LABEL_49:
    uint64_t v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    if (!v32) {
      return;
    }
    goto LABEL_45;
  }
LABEL_23:
  sub_10001C6A4((uint64_t)v15, @"enabled", 0);
  sub_10001C6A4((uint64_t)v15, @"Standalone", 0);
  if ([v11 forceBSSID]) {
    sub_10001C6A4((uint64_t)v15, @"FORCE_BSSID", kCFBooleanTrue);
  }
  if ([v11 bandPreference]) {
    sub_10001C6A4((uint64_t)v15, @"BAND_PREFERENCE", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 bandPreference]));
  }
  if ([v11 colocatedScopeID]) {
    sub_10001C6A4((uint64_t)v15, @"COLOCATED_NETWORK_SCOPE_ID", [v11 colocatedScopeID]);
  }
  if ([v11 has6GHzOnlyBSS])
  {
    unsigned int v29 = sub_1000C6FC0((uint64_t)v15, @"ASSOC_FLAGS");
    sub_10001A610((uint64_t)v15, @"ASSOC_FLAGS", v29 | 0x100000);
  }
  if (!objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "addReason"))
  {
    sub_10001C6A4((uint64_t)v15, @"WiFiManagerKnownNetworksEventType", &off_100263A18);
    if (objc_msgSend(objc_msgSend(v38, "processName"), "isEqualToString:", @"Setup")) {
      sub_1000CE418((uint64_t)v15, 4u);
    }
  }
  id v30 = [objc_msgSend(v11, "EAPCredentials") password];
  if (!v30) {
    id v30 = [v11 password];
  }
  if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork")) {
    sub_1000D2F80((uint64_t)v15, (int)[objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork")]);
  }
  sub_100128BC0((const __CFDictionary *)[v11 scanResult], (const __CFDictionary *)v15);
  if (_os_feature_enabled_impl() && [v11 findAndJoinNetwork]) {
    int v31 = sub_100117728(v19, (uint64_t)v17, v15, (uint64_t)v30, (uint64_t)sub_10015872C, (uint64_t)a3);
  }
  else {
    int v31 = sub_100113EA0(v19, v17, v15, v30, (const __CFString *)[v38 processName], (uint64_t)sub_10015872C, (uint64_t)a3, 1008);
  }
  if (!v31)
  {
    uint64_t v32 = 0;
    goto LABEL_44;
  }
  NSErrorDomain v34 = (NSErrorDomain)CWFManagerErrorDomain;
  uint64_t v35 = v31;
LABEL_54:
  uint64_t v32 = +[NSError errorWithDomain:v34 code:v35 userInfo:0];
LABEL_44:
  CFRelease(v15);
  if (!v32) {
    return;
  }
LABEL_45:
  if ([a3 response])
  {
    uint64_t v33 = (void (**)(id, NSError *, void))[a3 response];
    v33[2](v33, v32, 0);
  }
}

+ (id)__filteredScanResults:(__CFArray *)a3 scanParameters:(id)a4
{
  id v5 = +[NSMutableArray array];
  if (a3 && CFArrayGetCount(a3) >= 1)
  {
    CFIndex v6 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v6);
      if (ValueAtIndex)
      {
        id v9 = sub_10000AD1C((uint64_t)ValueAtIndex);
        if (v9) {
          [v5 addObject:v9];
        }
      }
      ++v6;
    }
    while (CFArrayGetCount(a3) > v6);
  }

  return (id)CWFFilteredScanResults();
}

- (void)__performScan:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCScanParamsKey];
  if (v9 && (id v10 = v9, (v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    id v12 = v11;
    id v13 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
    if (v13)
    {
      uint64_t v42 = (uint64_t)v13;
      id v14 = +[NSMutableDictionary dictionary];
      if ([v10 SSID] || _os_feature_enabled_impl())
      {
        [v10 setScanFlags:[v10 scanFlags] | 0x800];
        if (![a4 processName]
          || (objc_msgSend(objc_msgSend(a4, "processName"), "isEqualToString:", @"locationd") & 1) == 0
          && (objc_msgSend(objc_msgSend(a4, "processName"), "isEqualToString:", @"milod") & 1) == 0)
        {
          [v10 setScanFlags:[v10 scanFlags] | 0x100];
        }
      }
      long long v41 = v14;
      id v44 = a4;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v43 = v10;
      id v15 = [v10 channels:v12];
      id v16 = [v15 countByEnumeratingWithState:&v49 objects:v60 count:16];
      if (v16)
      {
        id v17 = v16;
        id v18 = 0;
        uint64_t v19 = *(void *)v50;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (!v18) {
              id v18 = +[NSMutableArray array];
            }
            v58[0] = @"CHANNEL";
            id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 channel]);
            v58[1] = @"CHANNEL_FLAGS";
            v59[0] = v22;
            v59[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v21 flags]);
            [v18 addObject:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2)];
          }
          id v17 = [v15 countByEnumeratingWithState:&v49 objects:v60 count:16];
        }
        while (v17);
      }
      else
      {
        id v18 = 0;
      }
      [v14 setObject:v18 forKeyedSubscript:@"SCAN_CHANNELS"];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = [v10 SSIDList];
      id v24 = [v23 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v24)
      {
        id v25 = v24;
        id v26 = 0;
        uint64_t v27 = *(void *)v46;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
            if (!v26) {
              id v26 = +[NSMutableArray array];
            }
            CFStringRef v55 = @"SSID_STR";
            uint64_t v56 = v29;
            [v26 addObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1)];
          }
          id v25 = [v23 countByEnumeratingWithState:&v45 objects:v57 count:16];
        }
        while (v25);
      }
      else
      {
        id v26 = 0;
      }
      if ([v26 count])
      {
        CFStringRef v53 = @"SSID_STR";
        CFStringRef v54 = &stru_100248240;
        [v26 addObject:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1)];
      }
      [v41 setObject:v26 forKeyedSubscript:@"SCAN_SSID_LIST"];
      [v41 setObject:objc_msgSend(v43, "SSID") forKeyedSubscript:@"SSID_STR"];
      [v41 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v43, "scanType")) forKeyedSubscript:@"SCAN_TYPE"];
      [v41 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v43 BSSType]) forKeyedSubscript:@"SCAN_BSS_TYPE"];
      [v41 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v43 PHYMode]) forKeyedSubscript:@"SCAN_PHY_MODE"];
      [v41 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v43 restTime]) forKeyedSubscript:@"SCAN_REST_TIME"];
      [v41 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "dwellTime"))] forKeyedSubscript:@"SCAN_DWELL_TIME"];
      [v41 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v43 mergeScanResults]) forKeyedSubscript:@"SCAN_MERGE"];
      if ([v43 numberOfScans]) {
        id v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v43 numberOfScans]);
      }
      else {
        id v30 = (NSNumber *)&off_100263A18;
      }
      [v41 setObject:v30 forKeyedSubscript:@"SCAN_NUM_SCANS"];
      [v41 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v43 scanFlags]) forKeyedSubscript:@"SCAN_FLAGS"];
      if ([v43 shortSSID]) {
        int v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v43 shortSSID]);
      }
      else {
        int v31 = 0;
      }
      [v41 setObject:v31 forKeyedSubscript:@"SCAN_SHORT_SSID"];
      [v41 setObject:objc_msgSend(v43, "BSSID") forKeyedSubscript:@"BSSID"];
      [v41 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "minimumTimestamp"))] forKeyedSubscript:@"SCAN_MIN_TIMESTAMP"];
      [v41 setObject:&__kCFBooleanFalse forKeyedSubscript:@"SCAN_MERGE"];
      [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SCAN_CLOSED_NETWORKS"];
      [v41 setObject:objc_msgSend(v44, "processName") forKeyedSubscript:@"ScanReqClientName"];
      [v41 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(objc_msgSend(v44, "XPCConnection"), "processIdentifier"))] forKeyedSubscript:@"ScanReqClientPid"];
      [v41 setObject:objc_msgSend(a3, "receivedAt") forKeyedSubscript:@"ScanReqReceiptTimestamp"];
      if ([v43 acceptableCacheAge] == (id)-1)
      {
        uint64_t v35 = sub_100016E18(v42);
        if (v35 && (uint64_t v36 = sub_100072970(v35, 0)) != 0)
        {
          uint64_t v37 = v36;
          id v38 = +[WiFiXPCManager __filteredScanResults:v36 scanParameters:v43];
          CFRelease(v37);
        }
        else
        {
          id v38 = 0;
        }
        id v39 = +[NSMutableDictionary dictionary];
        [v39 setObject:v38 forKeyedSubscript:CWFXPCResultKey];
        if (![a3 response]) {
          goto LABEL_49;
        }
LABEL_48:
        (*((void (**)(void))[a3 response] + 2))();
LABEL_49:

        return;
      }
      [v41 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v43, "acceptableCacheAge") / 1000.0) forKeyedSubscript:@"SCAN_MAXAGE"];
      int v32 = sub_10011286C(v42, v40, (const __CFDictionary *)v41, (const __CFString *)[v44 processName], (uint64_t)sub_100159614, (uint64_t)a3);
      if (!v32) {
        return;
      }
      NSErrorDomain v33 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v34 = v32;
    }
    else
    {
      NSErrorDomain v33 = NSPOSIXErrorDomain;
      uint64_t v34 = 6;
    }
  }
  else
  {
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = 22;
  }
  if (+[NSError errorWithDomain:v33 code:v34 userInfo:0])
  {
    if (![a3 response]) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
}

- (void)__performANQP:(id)a3
{
  id v5 = a3;
  id v6 = [a3 info];
  id v7 = [v6 objectForKeyedSubscript:CWFXPCANQPParamsKey];
  if (!v7 || (id v8 = v7, (v9 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v28 = NSPOSIXErrorDomain;
    uint64_t v29 = 22;
    goto LABEL_27;
  }
  id v10 = v9;
  id v11 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v9];
  if (!v11)
  {
    NSErrorDomain v28 = NSPOSIXErrorDomain;
    uint64_t v29 = 6;
    goto LABEL_27;
  }
  uint64_t v12 = (uint64_t)v11;
  id v13 = +[NSMutableDictionary dictionary];
  [v13 setObject:&off_100263A30 forKeyedSubscript:@"GAS_PROTOCOL"];
  [v13 setObject:objc_msgSend(v8, "ANQPElementIDList") forKeyedSubscript:@"GAS_QUERY"];
  id v14 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = [v8 scanResults];
  id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v30 + 1) + 8 * i) scanRecord];
        if (v20) {
          [v14 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }
  uint64_t v21 = sub_10005A4C4((const __CFArray *)v14);
  if (!v21)
  {
    NSErrorDomain v28 = NSPOSIXErrorDomain;
    uint64_t v29 = 12;
LABEL_27:
    id v26 = +[NSError errorWithDomain:v28 code:v29 userInfo:0];
    if (!v26) {
      return;
    }
    goto LABEL_20;
  }
  id v22 = v21;
  [v13 setObject:v21 forKeyedSubscript:@"GAS_NETWORKS"];
  if ([v8 acceptableCacheAge] == (id)-1)
  {
    [v13 setObject:&off_100263A48 forKeyedSubscript:@"SCAN_MAXAGE"];
    id v23 = (NSNumber *)&__kCFBooleanTrue;
    CFStringRef v24 = @"CacheOnly";
  }
  else
  {
    id v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[v8 acceptableCacheAge] / 1000.0);
    CFStringRef v24 = @"SCAN_MAXAGE";
  }
  [v13 setObject:v23 forKeyedSubscript:v24];
  int v25 = sub_100119B00(v12, v10, v13, (uint64_t)sub_100159B80, (uint64_t)a3);
  if (v25) {
    id v26 = +[NSError errorWithDomain:CWFManagerErrorDomain code:v25 userInfo:0];
  }
  else {
    id v26 = 0;
  }
  CFRelease(v22);
  if (v26)
  {
LABEL_20:
    if ([a3 response])
    {
      uint64_t v27 = (void (**)(id, NSError *, void))[a3 response];
      v27[2](v27, v26, 0);
    }
  }
}

- (void)__performRanging:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = [v3 info];
  id v7 = [v6 objectForKeyedSubscript:CWFXPCRangingPeerListKey];
  if (!v7
    || (id v8 = v7,
        id v9 = [v3 info],
        id v10 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CWFXPCRangingTimeoutKey), "unsignedIntegerValue"), (v11 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 22;
    goto LABEL_26;
  }
  id v12 = v11;
  id v13 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
  if (!v13)
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 6;
    goto LABEL_26;
  }
  uint64_t v26 = (uint64_t)v13;
  uint64_t v27 = v12;
  unint64_t v28 = (unint64_t)v10;
  uint64_t v29 = (uint64_t)v3;
  id v14 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v20 = +[NSMutableDictionary dictionary];
        if ([v19 MACAddress]) {
          [v20 setObject:objc_msgSend(v19, "MACAddress") forKeyedSubscript:@"STATION_MAC"];
        }
        if ([v19 PMK]) {
          [v20 setObject:objc_msgSend(v19, "PMK") forKeyedSubscript:@"RANGING_PMK"];
        }
        if ([v19 identifier]) {
          [v20 setObject:objc_msgSend(v19, "identifier") forKeyedSubscript:@"RANGING_TOKEN_ID"];
        }
        if ([v19 numberOfMeasurements]) {
          [v20 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 numberOfMeasurements]) forKeyedSubscript:@"RANGING_NUM_MEASUREMENTS"];
        }
        if ([v19 useCoreRotation]) {
          [v20 setObject:&off_100263A60 forKeyedSubscript:@"RANGING_CORE_MASK"];
        }
        [v14 addObject:v20];
      }
      id v16 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }
  id v3 = (id)v29;
  int v21 = sub_100119E6C(v26, v27, (const __CFArray *)v14, (uint64_t)sub_10015A034, v29, (double)v28);
  if (v21)
  {
    NSErrorDomain v22 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v23 = v21;
LABEL_26:
    CFStringRef v24 = +[NSError errorWithDomain:v22 code:v23 userInfo:0];
    if (v24)
    {
      if ([v3 response])
      {
        int v25 = (void (**)(id, NSError *, void))[v3 response];
        v25[2](v25, v24, 0);
      }
    }
  }
}

- (void)__setRangeable:(id)a3
{
  id v3 = a3;
  id v5 = [a3 info];
  id obj = [v5 objectForKeyedSubscript:CWFXPCRangingPeerListKey];
  if (!obj
    || (id v6 = [v3 info],
        unsigned int v7 = objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCRangeableKey), "BOOLValue"),
        (id v8 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v21 = NSPOSIXErrorDomain;
    uint64_t v22 = 22;
LABEL_19:
    uint64_t v19 = +[NSError errorWithDomain:v21 code:v22 userInfo:0];
    goto LABEL_14;
  }
  uint64_t v9 = (uint64_t)v8;
  id v10 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v8];
  if (!v10)
  {
    NSErrorDomain v21 = NSPOSIXErrorDomain;
    uint64_t v22 = 6;
    goto LABEL_19;
  }
  uint64_t v24 = (uint64_t)v10;
  uint64_t v25 = v9;
  unsigned int v26 = v7;
  id v23 = v3;
  id v11 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v17 = +[NSMutableDictionary dictionary];
        [v17 setObject:objc_msgSend(v16, "MACAddress") forKeyedSubscript:@"STATION_MAC"];
        [v17 setObject:objc_msgSend(v16, "PMK") forKeyedSubscript:@"RANGING_PMK"];
        [v17 setObject:objc_msgSend(v16, "identifier") forKeyedSubscript:@"RANGING_TOKEN_ID"];
        [v11 addObject:v17];
      }
      id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
  int v18 = sub_100119E54(v24, v25, v26, (const __CFArray *)v11);
  if (v18) {
    uint64_t v19 = +[NSError errorWithDomain:CWFManagerErrorDomain code:v18 userInfo:0];
  }
  else {
    uint64_t v19 = 0;
  }
  id v3 = v23;
LABEL_14:
  if ([v3 response])
  {
    id v20 = (void (**)(id, NSError *, void))[v3 response];
    v20[2](v20, v19, 0);
  }
}

- (void)__setRangingIdentifier:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCRangingIdentifierKey];
  id v7 = [objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v7)
  {
    NSErrorDomain v14 = NSPOSIXErrorDomain;
    uint64_t v15 = 22;
LABEL_15:
    +[NSError errorWithDomain:v14 code:v15 userInfo:0];
    goto LABEL_7;
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t v9 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v7];
  if (!v9)
  {
    NSErrorDomain v14 = NSPOSIXErrorDomain;
    uint64_t v15 = 6;
    goto LABEL_15;
  }
  uint64_t v10 = (uint64_t)v9;
  if (v6)
  {
    id v11 = +[NSMutableDictionary dictionary];
    [v11 setObject:v6 forKeyedSubscript:@"RANGING_TOKEN_ID"];
  }
  else
  {
    id v11 = 0;
  }
  int v12 = sub_100119E64(v10, v8, v11 != 0, (uint64_t)v11);
  if (v12)
  {
    NSErrorDomain v14 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v15 = v12;
    goto LABEL_15;
  }
LABEL_7:
  if ([a3 response])
  {
    id v13 = (void (*)(void))*((void *)[a3 response] + 2);
    v13();
  }
}

- (void)__handleActivity:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCActivityKey];
  if (v6)
  {
    switch((unint64_t)[v6 type])
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
        sub_100092FE4((uint64_t)self->_managerRef);
        break;
      case 4uLL:
        sub_100090CC0((uint64_t)self->_managerRef, 0, 0, 2);
        break;
      case 5uLL:
        sub_100091468((uint64_t)self->_managerRef, 0, 0);
        break;
      case 6uLL:
        sub_100093130((uint64_t)self->_managerRef);
        break;
      case 8uLL:
        unsigned int v7 = [(WiFiXPCManager *)self __isActivityRegisteredWithType:8];
        managerRef = self->_managerRef;
        if (v7) {
          sub_10009EE74((uint64_t)managerRef);
        }
        else {
          sub_10009EF6C((uint64_t)managerRef);
        }
        break;
      case 0xCuLL:
        sub_100093138((uint64_t)self->_managerRef, [(WiFiXPCManager *)self __isActivityRegisteredWithType:12]);
        break;
      default:
        break;
    }
  }
  else
  {
    +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if ([a3 response])
  {
    uint64_t v9 = (void (*)(void))*((void *)[a3 response] + 2);
    v9();
  }
}

- (void)__getUserAutoJoinState:(id)a3
{
  int v4 = sub_100004CF8((uint64_t)self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary];
  if (v4) {
    id v6 = &__kCFBooleanFalse;
  }
  else {
    id v6 = &__kCFBooleanTrue;
  }
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    unsigned int v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__setUserAutoJoinState:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCUserAutoJoinStateKey];
  if (v8) {
    sub_100086500((uint64_t)self->_managerRef, (uint64_t)[v8 BOOLValue], 0, (uint64_t)[a4 processName]);
  }
  else {
    +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if ([a3 response])
  {
    uint64_t v9 = (void (*)(void))*((void *)[a3 response] + 2);
    v9();
  }
}

- (void)__performAutoJoin:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCAutoJoinParamsKey];
  if (v6 && (v7 = v6, (id v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    uint64_t v9 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v8];
    if (v9)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10015ACB0;
      v12[3] = &unk_10023EF80;
      v12[4] = a3;
      sub_100128A68(v9, v7, (uint64_t)v12);
      return;
    }
    uint64_t v10 = 6;
  }
  else
  {
    uint64_t v10 = 22;
  }
  if (+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v10, 0)&& [a3 response])
  {
    id v11 = (void (*)(void))*((void *)[a3 response] + 2);
    v11();
  }
}

- (void)__getAutoHotspotMode:(id)a3
{
  unsigned int v4 = sub_1000A7E70((uint64_t)self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000ECAC0(v4)) forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    id v6 = (void (*)(void))*((void *)[a3 response] + 2);
    v6();
  }
}

- (void)__setAutoHotspotMode:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCAutoHotspotModeKey];
  if (v6)
  {
    managerRef = self->_managerRef;
    int v8 = sub_1000ECAD0((uint64_t)[v6 integerValue]);
    sub_1000A7D80(managerRef, v8, 0);
  }
  else
  {
    +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if ([a3 response])
  {
    uint64_t v9 = (void (*)(void))*((void *)[a3 response] + 2);
    v9();
  }
}

- (void)__getUserSettings:(id)a3
{
  id v5 = objc_alloc_init((Class)CWFUserSettings);
  unsigned int v6 = sub_1000A7E70((uint64_t)self->_managerRef);
  [v5 setAutoHotspotMode:sub_1000ECAC0(v6)];
  unsigned int v7 = sub_10008FF90((uint64_t)self->_managerRef);
  [v5 setAskToJoinMode:sub_1000ECB04(v7)];
  int v8 = sub_100024498((uint64_t)self->_managerRef);
  [v5 setCompatibilityMode:sub_1000ECAE8(v8)];
  [v5 setOSSpecificAttributes:-[WiFiXPCManager __OSSpecificAttributes](self, "__OSSpecificAttributes")];
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setObject:v5 forKeyedSubscript:CWFXPCResultKey];

  if ([a3 response])
  {
    uint64_t v10 = (void (*)(void))*((void *)[a3 response] + 2);
    v10();
  }
}

- (void)__setUserSettings:(id)a3
{
  id v3 = a3;
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCUserSettingsKey];
  if (v6)
  {
    unsigned int v7 = v6;
    id v44 = v3;
    id v8 = [v3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCUserSettingsPropertiesKey];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v50;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          NSErrorDomain v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          switch((unint64_t)objc_msgSend(v14, "integerValue", v38, v41))
          {
            case 1uLL:
              unsigned int v15 = sub_1000ECAD0((uint64_t)[v7 askToJoinMode]);
              if (CWFGetOSLog()) {
                id v16 = CWFGetOSLog();
              }
              else {
                id v16 = &_os_log_default;
              }
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                int v53 = 67109120;
                LODWORD(v54) = v15;
                LODWORD(v41) = 8;
                id v38 = &v53;
                _os_log_send_and_compose_impl();
              }
              sub_10008FE4C((uint64_t)self->_managerRef, v15, 0);
              break;
            case 2uLL:
              int v17 = sub_1000ECAD0((uint64_t)[v7 autoHotspotMode]);
              if (CWFGetOSLog()) {
                int v18 = CWFGetOSLog();
              }
              else {
                int v18 = &_os_log_default;
              }
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                int v53 = 67109120;
                LODWORD(v54) = v17;
                LODWORD(v41) = 8;
                id v38 = &v53;
                _os_log_send_and_compose_impl();
              }
              sub_1000A7D80(self->_managerRef, v17, 0);
              break;
            case 3uLL:
              if (CWFGetOSLog()) {
                uint64_t v19 = CWFGetOSLog();
              }
              else {
                uint64_t v19 = &_os_log_default;
              }
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                id v23 = (__CFString *)[v7 syncMode];
                int v53 = 134217984;
                CFStringRef v54 = v23;
                LODWORD(v41) = 12;
                id v38 = &v53;
                _os_log_send_and_compose_impl();
              }
              nullsub_3(self->_managerRef, [v7 syncMode:v38, v41]);
              break;
            case 4uLL:
              BOOL v20 = sub_1000ECAF8((uint64_t)[v7 compatibilityMode]);
              if (CWFGetOSLog()) {
                NSErrorDomain v21 = CWFGetOSLog();
              }
              else {
                NSErrorDomain v21 = &_os_log_default;
              }
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                int v53 = 67109120;
                LODWORD(v54) = v20;
                LODWORD(v41) = 8;
                id v38 = &v53;
                _os_log_send_and_compose_impl();
              }
              sub_10008FF98((uint64_t)self->_managerRef, v20, 0);
              break;
            default:
              if (CWFGetOSLog()) {
                uint64_t v22 = CWFGetOSLog();
              }
              else {
                uint64_t v22 = &_os_log_default;
              }
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = (__CFString *)[v14 integerValue];
                int v53 = 134217984;
                CFStringRef v54 = v24;
                LODWORD(v41) = 12;
                id v38 = &v53;
                _os_log_send_and_compose_impl();
              }
              break;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v11);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v25 = [v7 OSSpecificAttributes:v38, v41];
    id v26 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        long long v29 = 0;
        do
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(__CFString **)(*((void *)&v45 + 1) + 8 * (void)v29);
          id v31 = [[objc_msgSend(v7, "OSSpecificAttributes", v39, v42) objectForKey:v30];
          if (CWFGetOSLog()) {
            long long v32 = CWFGetOSLog();
          }
          else {
            long long v32 = &_os_log_default;
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            int v53 = 138412546;
            CFStringRef v54 = v30;
            __int16 v55 = 2112;
            id v56 = v31;
            LODWORD(v43) = 22;
            long long v40 = &v53;
            _os_log_send_and_compose_impl();
          }
          if ([(__CFString *)v30 isEqualToString:@"Custom network settings", v40, v43])
          {
            if (CWFGetOSLog()) {
              long long v33 = CWFGetOSLog();
            }
            else {
              long long v33 = &_os_log_default;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              LOWORD(v53) = 0;
              LODWORD(v42) = 2;
              id v39 = &v53;
              _os_log_send_and_compose_impl();
            }
            if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (CWFGetOSLog()) {
                uint64_t v34 = CWFGetOSLog();
              }
              else {
                uint64_t v34 = &_os_log_default;
              }
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v53) = 0;
                LODWORD(v42) = 2;
                id v39 = &v53;
                _os_log_send_and_compose_impl();
              }
            }
            else
            {
              sub_1000A86D0((uint64_t)self->_managerRef, (uint64_t)v31);
            }
          }
          else
          {
            sub_10009317C(self->_managerRef, v30, v31);
          }
          long long v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v35 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
        id v27 = v35;
      }
      while (v35);
    }
    [(WiFiXPCManager *)self sendUserSettingsDidChangeEvent];
    uint64_t v36 = 0;
    id v3 = v44;
  }
  else
  {
    uint64_t v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  if ([v3 response])
  {
    uint64_t v37 = (void (**)(id, NSError *, void))[v3 response];
    v37[2](v37, v36, 0);
  }
}

- (id)__OSSpecificAttributes
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WAPIEnabled" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"DiagnosticsEnabled" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"SBWiFiDontAskShown" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"kWiFiWhitelistingUUIDKey" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"KeepWiFiPoweredAirplaneModeEnabled" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"KeepWiFiPoweredAirplaneMode" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WiFiMobileAssetIsHealthMonitorDisabled" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"deviceSpecificKeyMacRandomisation" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"RotationKeyMacRandomisation" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WiFiCountryBandSupportKey" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"kWiFiWhitelistingUUIDKey" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"Custom network settings" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"kWiFiShowUnprovisionedHS20Networks" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WiFiSettingsLogging" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WiFiATJPickerLogging" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WiFiATJPickerLogging" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"DisableSoftErrorReporting" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"EnableRangingLogDump" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"UserPreferenceJoinAlertMode" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"EnableRangingLogDump" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"lpasEnable" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"mStageAutoJoin" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"optimizedAutoJoin" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"TrgDiscAskIfAppropriateDisconnect" attributes:v3];
  [(WiFiXPCManager *)self __setOSSpecificAttributeForKey:@"WakeMode" attributes:v3];
  return v3;
}

- (void)__setOSSpecificAttributeForKey:(__CFString *)a3 attributes:(id)a4
{
  unsigned int v7 = [(__CFString *)a3 isEqualToString:@"Custom network settings"];
  managerRef = self->_managerRef;
  if (v7)
  {
    CFDictionaryRef v9 = sub_1000A86C8(managerRef);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      [a4 setObject:v9 forKey:a3];
      CFRelease(v10);
    }
  }
  else
  {
    id v11 = sub_100091840(managerRef, a3);
    if (v11)
    {
      [a4 setObject:v11 forKey:a3];
    }
  }
}

- (WiFiXPCManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)WiFiXPCManager;
  CFArrayRef v2 = [(WiFiXPCManager *)&v14 init];
  if (!v2) {
    goto LABEL_12;
  }
  id v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  v2->_wifiManagerQueue = v3;
  if (!v3) {
    goto LABEL_12;
  }
  [(NSOperationQueue *)v3 setMaxConcurrentOperationCount:-1];
  [(NSOperationQueue *)v2->_wifiManagerQueue setQualityOfService:-1];
  unsigned int v4 = (CWFXPCManager *)[objc_alloc((Class)CWFXPCManager) initWithServiceTypes:&off_1002641F8];
  v2->_XPCManager = v4;
  if (!v4) {
    goto LABEL_12;
  }
  id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v2->_peerAssistedDiscoveryNetworkMap = v5;
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v2->_wifiAssistOverrideReasonsMap = v6;
  if (!v6) {
    goto LABEL_12;
  }
  unsigned int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(0, v7);
  v2->_mutexQueue = (OS_dispatch_queue *)v8;
  if (!v8) {
    goto LABEL_12;
  }
  CFDictionaryRef v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifid.current-network", v9);
  v2->_currentNetworkQueue = (OS_dispatch_queue *)v10;
  if (v10
    && (id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        (v2->_currentNetworkMap = v11) != 0)
    && (uint64_t v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        (v2->_currentKnownNetworkMap = v12) != 0))
  {
    [(CWFXPCManager *)v2->_XPCManager setSupportedRequestTypes:+[NSSet setWithArray:[(WiFiXPCManager *)v2 __supportedRequestTypes]]];
    [(CWFXPCManager *)v2->_XPCManager setDelegate:v2];
  }
  else
  {
LABEL_12:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_wifiManagerQueue = 0;
  [(CWFXPCManager *)self->_XPCManager setDelegate:0];
  [(CWFXPCManager *)self->_XPCManager invalidate];

  self->_XPCManager = 0;
  self->_peerAssistedDiscoveryNetworkMap = 0;

  self->_wifiAssistOverrideReasonsMap = 0;
  self->_currentHotspotNetwork = 0;

  self->_currentNetworkMap = 0;
  self->_currentKnownNetworkMap = 0;
  mutexQueue = self->_mutexQueue;
  if (mutexQueue) {
    dispatch_release(mutexQueue);
  }
  currentNetworkQueue = self->_currentNetworkQueue;
  if (currentNetworkQueue) {
    dispatch_release(currentNetworkQueue);
  }
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
  {
    CFRelease(cachedCurrentSessionBasedNetworkRef);
    self->_cachedCurrentSessionBasedNetworkRef = 0;
  }
  managerRef = self->_managerRef;
  if (managerRef)
  {
    CFRelease(managerRef);
    self->_managerRef = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)WiFiXPCManager;
  [(WiFiXPCManager *)&v7 dealloc];
}

- (void)setWiFiManager:(__WiFiManager *)a3
{
  managerRef = self->_managerRef;
  if (managerRef != a3)
  {
    if (managerRef) {
      CFRelease(managerRef);
    }
    if (a3) {
      id v6 = (__WiFiManager *)CFRetain(a3);
    }
    else {
      id v6 = 0;
    }
    self->_managerRef = v6;
  }
}

- (__WiFiManager)getWiFiManager
{
  return self->_managerRef;
}

- (void)activate
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(WiFiXPCManager *)self __supportedRequestTypes];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CWFXPCManager setTargetQueue:requestType:interfaceName:](self->_XPCManager, "setTargetQueue:requestType:interfaceName:", self->_wifiManagerQueue, [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) integerValue], 0);
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(CWFXPCManager *)self->_XPCManager resume];
}

- (void)invalidate
{
}

- (BOOL)isQuiesceWiFiActivityRegistered
{
  return [(WiFiXPCManager *)self __isActivityRegisteredWithType:5];
}

- (BOOL)isWoWActivityRegistered
{
  return [(WiFiXPCManager *)self __isActivityRegisteredWithType:4];
}

- (void)sendWoWDidChangeEventWithInterfaceName:(id)a3
{
  id v6 = objc_alloc_init((Class)CWFXPCEvent);
  [v6 setType:9];
  [v6 setInterfaceName:a3];
  [v6 setTimestamp:+[NSDate date]];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v6 reply:0];
}

- (void)sendInternetRelayLinkChangedEvent:(BOOL)a3 rssi:(int64_t)a4 interfaceName:(id)a5
{
  BOOL v7 = a3;
  id v10 = objc_alloc_init((Class)CWFXPCEvent);
  [v10 setType:6];
  [v10 setInterfaceName:a5];
  [v10 setTimestamp:[+[NSDate date](NSDate, "date")]];
  id v11 = objc_alloc_init((Class)CWFLinkChangeStatus);
  [v11 setLinkDown:v7];
  [v11 setRSSI:a4];
  uint64_t v18 = CWFEventLinkChangeStatusKey;
  id v19 = v11;
  [v10 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)]];
  if (CWFGetOSLog()) {
    uint64_t v12 = CWFGetOSLog();
  }
  else {
    uint64_t v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109376;
    v15[1] = v7;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    LODWORD(v14) = 18;
    id v13 = v15;
    _os_log_send_and_compose_impl();
  }
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v10, 0, v13, v14);
}

- (void)replayLinkUpEventWithInterfaceName:(id)a3
{
  id v6 = objc_alloc_init((Class)CWFXPCEvent);
  [v6 setType:6];
  [v6 setInterfaceName:a3];
  [v6 setTimestamp:[+[NSDate date](NSDate, "date")]];
  id v7 = objc_alloc_init((Class)CWFLinkChangeStatus);
  [v7 setLinkDown:0];
  uint64_t v13 = CWFEventLinkChangeStatusKey;
  id v14 = v7;
  [v6 setInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)];
  if (CWFGetOSLog()) {
    long long v8 = CWFGetOSLog();
  }
  else {
    long long v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[WiFiXPCManager replayLinkUpEventWithInterfaceName:]";
    LODWORD(v10) = 12;
    long long v9 = &v11;
    _os_log_send_and_compose_impl();
  }
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v6, 0, v9, v10);
}

- (void)autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4
{
  id v8 = objc_alloc_init((Class)CWFXPCEvent);
  [v8 setInternalType:1];
  [v8 setInterfaceName:a4];
  [v8 setTimestamp:[+[NSDate date](NSDate, "date")]];
  uint64_t v9 = CWFInternalEventAutoJoinTriggerKey;
  uint64_t v10 = +[NSNumber numberWithInteger:a3];
  [v8 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v8 reply:0];
}

- (void)autoJoinUpdatedWithState:(int64_t)a3 interfaceName:(id)a4
{
  id v8 = objc_alloc_init((Class)CWFXPCEvent);
  [v8 setInternalType:1];
  [v8 setInterfaceName:a4];
  [v8 setTimestamp:[+[NSDate date](NSDate, "date")]];
  uint64_t v9 = CWFInternalEventAutoJoinStateKey;
  uint64_t v10 = +[NSNumber numberWithInteger:a3];
  [v8 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v8 reply:0];
}

- (void)autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4
{
  BOOL v5 = a3;
  id v8 = objc_alloc_init((Class)CWFXPCEvent);
  [v8 setInternalType:1];
  [v8 setInterfaceName:a4];
  [v8 setTimestamp:[+[NSDate date](NSDate, "date")]];
  id v9 = +[NSMutableDictionary dictionary];
  uint64_t v10 = +[NSNumber numberWithBool:v5];
  [v9 setObject:v10 forKeyedSubscript:CWFInternalEventAutoJoinResultKey];
  [v8 setInfo:v9];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v8 reply:0];
}

- (void)willAssociateWithNetwork:(__WiFiNetwork *)a3 isAutoJoin:(BOOL)a4 interfaceName:(id)a5
{
  BOOL v6 = a4;
  id v10 = sub_10000AD1C((uint64_t)a3);
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_alloc_init((Class)CWFXPCEvent);
    [v12 setInternalType:2];
    [v12 setInterfaceName:a5];
    [v12 setTimestamp:[+[NSDate date](NSDate, "date")]];
    v13[0] = CWFInternalEventScanResultKey;
    v13[1] = CWFInternalEventIsAutoJoinKey;
    v14[0] = v11;
    v14[1] = +[NSNumber numberWithBool:v6];
    [v12 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2)];
    [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v12 reply:0];
  }
}

- (void)associationDoneWithNetwork:(__WiFiNetwork *)a3 error:(int)a4 interfaceName:(id)a5
{
  id v10 = sub_10000AD1C((uint64_t)a3);
  if (v10)
  {
    id v11 = v10;
    id v12 = +[NSMutableDictionary dictionary];
    uint64_t v13 = +[NSError errorWithDomain:CWFManagerErrorDomain code:a4 userInfo:0];
    [v12 setObject:v13 forKeyedSubscript:CWFInternalEventErrorKey];
    [v12 setObject:v11 forKeyedSubscript:CWFInternalEventScanResultKey];
    id v14 = objc_alloc_init((Class)CWFXPCEvent);
    [v14 setInternalType:3];
    [v14 setInterfaceName:a5];
    [v14 setTimestamp:+[NSDate date](NSDate, "date")];
    [v14 setInfo:v12];
    [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v14 reply:0];
  }
}

- (void)sendUserAutoJoinStateDidChangeEvent
{
  id v4 = objc_alloc_init((Class)CWFXPCEvent);
  [v4 setType:25];
  [v4 setTimestamp:+[NSDate date]];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v4 reply:0];
}

- (void)sendAutoHotspotModeDidChangeEvent
{
  id v4 = objc_alloc_init((Class)CWFXPCEvent);
  [v4 setType:26];
  [v4 setTimestamp:[+[NSDate date](NSDate, "date")]];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v4 reply:0];
}

- (void)sendXPCEvent:(id)a3
{
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:a3 reply:0];
}

- (void)sendKnownNetworkDidChangeEventForProfile:(id)a3 eventType:(int64_t)a4
{
  id v8 = objc_alloc_init((Class)CWFXPCEvent);
  [v8 setType:30];
  [v8 setTimestamp:[+[NSDate date](NSDate, "date")]];
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = v9;
  if (a3) {
    [v9 setObject:a3 forKey:CWFInternalEventKnownNetworkProfileKey];
  }
  id v11 = +[NSNumber numberWithInteger:a4];
  [v10 setObject:v11 forKey:CWFInternalEventKnownNetworkEventTypeKey];
  [v8 setInfo:v10];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v8 reply:0];
}

- (id)__sanitizeSensingParams:(id)a3
{
  if (((unint64_t)[a3 numberOfReports] & 0x8000000000000000) == 0
    && (unint64_t)objc_msgSend(objc_msgSend(a3, "matchMACAddresses"), "count") <= 0x20
    && ((unint64_t)[a3 timeout] & 0x8000000000000000) == 0
    && (uint64_t)[a3 timeout] <= 50000
    && (uint64_t)[a3 scheduleOnceAfter] >= -2
    && (uint64_t)[a3 scheduleOnceAfter] <= 15
    && (uint64_t)[a3 scheduleDailyAt] >= -2
    && (uint64_t)[a3 scheduleDailyAt] < 86401)
  {
    return 0;
  }

  return +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
}

- (id)__getSensingParams:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 numberOfReports]) forKeyedSubscript:@"SENSING_PARAMS_NUMBER_OF_REPORTS"];
  [v4 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 matchFrameType]) forKeyedSubscript:@"SENSING_PARAMS_MATCH_FRAME_TYPE"];
  [v4 setObject:objc_msgSend(a3, "matchMACAddresses") forKeyedSubscript:@"SENSING_PARAMS_MATCH_MAC_ADDRESS"];
  [v4 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 timeout]) forKeyedSubscript:@"SENSING_PARAMS_TIMEOUT"];
  [v4 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "submitMetric"))] forKeyedSubscript:@"SENSING_PARAMS_SUBMIT_METRIC"];
  [v4 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 scheduleDailyAt]) forKeyedSubscript:@"SENSING_PARAMS_SCHEDULE_DAILY_AT"];
  [v4 setObject:objc_msgSend(a3, "activityLabels") forKeyedSubscript:@"SENSING_PARAMS_ACTIVITY_LABELS"];
  [v4 setObject:objc_msgSend(a3, "placeLabels") forKeyedSubscript:@"SENSING_PARAMS_PLACE_LABELS"];
  [v4 setObject:[a3 comment] forKeyedSubscript:@"SENSING_PARAMS_COMMENT"];
  if ([a3 scheduleDailyAt] != (id)-2)
  {
    BOOL v5 = +[NSUserDefaults standardUserDefaults];
    if ([a3 scheduleDailyAt] == (id)-1) {
      [(NSUserDefaults *)v5 removeObjectForKey:@"WIFI_SENSING"];
    }
    else {
      [(NSUserDefaults *)v5 setObject:v4 forKey:@"WIFI_SENSING"];
    }
  }
  id v6 = [a3 scheduleOnceAfter];
  if ([a3 scheduleOnceAfter] == (id)-2 && objc_msgSend(a3, "scheduleDailyAt") == (id)-2) {
    id v6 = 0;
  }
  [v4 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6) forKeyedSubscript:@"SENSING_PARAMS_SCHEDULE_ONCE_AFTER"];
  return v4;
}

- (void)__performSensing:(id)a3
{
  id v4 = a3;
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCSensingParamsKey];
  if (!v6) {
    goto LABEL_10;
  }
  id v7 = v6;
  id v8 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v8) {
    goto LABEL_10;
  }
  id v9 = v8;
  id v10 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v8];
  if (!v10)
  {
    NSErrorDomain v16 = NSPOSIXErrorDomain;
    uint64_t v17 = 6;
    goto LABEL_15;
  }
  uint64_t v11 = (uint64_t)v10;
  id v12 = [(WiFiXPCManager *)self __sanitizeSensingParams:v7];
  if (!v12)
  {
    id v13 = [(WiFiXPCManager *)self __getSensingParams:v7];
    if (v13)
    {
      id v14 = v13;
      if (MGGetBoolAnswer() & 1) != 0 && (_os_feature_enabled_impl())
      {
        int v15 = sub_100129CD4(v11, v9, v14, (void (*)(uint64_t, const void *, void, uint64_t, uint64_t))sub_10015CE84, (uint64_t)a3);
        if (!v15) {
          return;
        }
        NSErrorDomain v16 = (NSErrorDomain)CWFManagerErrorDomain;
        uint64_t v17 = v15;
      }
      else
      {
        NSErrorDomain v16 = (NSErrorDomain)CWFManagerErrorDomain;
        uint64_t v17 = -3907;
      }
LABEL_15:
      uint64_t v18 = +[NSError errorWithDomain:v16 code:v17 userInfo:0];
      id v19 = a3;
      if (!v18) {
        return;
      }
      goto LABEL_16;
    }
LABEL_10:
    NSErrorDomain v16 = NSPOSIXErrorDomain;
    uint64_t v17 = 22;
    goto LABEL_15;
  }
  uint64_t v18 = v12;
  id v19 = a3;
LABEL_16:
  if ([v19 response])
  {
    BOOL v20 = (void (**)(id, NSError *, void))[a3 response];
    v20[2](v20, v18, 0);
  }
}

- (void)__performNDD:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCNDDParamsKey];
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = (uint64_t)v8;
  id v10 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (!v10) {
    goto LABEL_11;
  }
  if (!self->_managerRef)
  {
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = 6;
    goto LABEL_14;
  }
  uint64_t v11 = (uint64_t)v10;
  id v12 = [a4 processName];
  if (v12)
  {
    int v13 = sub_10008DB20((uint64_t)self->_managerRef, (uint64_t)[a3 type], v9, (uint64_t)v12, v11);
    if (!v13) {
      goto LABEL_6;
    }
    NSErrorDomain v15 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v16 = v13;
  }
  else
  {
LABEL_11:
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = 22;
  }
LABEL_14:
  +[NSError errorWithDomain:v15 code:v16 userInfo:0];
LABEL_6:
  if ([a3 response])
  {
    id v14 = (void (*)(void))*((void *)[a3 response] + 2);
    v14();
  }
}

- (void)sendUserSettingsDidChangeEvent
{
  id v4 = objc_alloc_init((Class)CWFXPCEvent);
  [v4 setType:27];
  [v4 setTimestamp:[+[NSDate date](NSDate, "date")]];
  [(CWFXPCManager *)self->_XPCManager sendXPCEvent:v4 reply:0];
}

- (void)__getAutoJoinMetric:(id)a3
{
  id v5 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      id v7 = sub_100128EC4((uint64_t)v6);
LABEL_4:
      id v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
      if (![a3 response]) {
        return;
      }
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      uint64_t v11 = (void (*)(void *, NSError *, id))v9[2];
      id v12 = v9;
      int v13 = 0;
      goto LABEL_6;
    }
    uint64_t v14 = 6;
  }
  else
  {
    uint64_t v14 = 22;
  }
  NSErrorDomain v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v14 userInfo:0];
  if (!v15)
  {
    id v7 = 0;
    goto LABEL_4;
  }
  uint64_t v16 = v15;
  if (![a3 response]) {
    return;
  }
  id v12 = [a3 response];
  uint64_t v11 = (void (*)(void *, NSError *, id))v12[2];
  int v13 = v16;
  id v10 = 0;
LABEL_6:

  v11(v12, v13, v10);
}

- (void)__getAutoJoinStatistics:(id)a3
{
  id v5 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      id v7 = sub_100128EF0((uint64_t)v6);
LABEL_4:
      id v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
      if (![a3 response]) {
        return;
      }
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      uint64_t v11 = (void (*)(void *, NSError *, id))v9[2];
      id v12 = v9;
      int v13 = 0;
      goto LABEL_6;
    }
    uint64_t v14 = 6;
  }
  else
  {
    uint64_t v14 = 22;
  }
  NSErrorDomain v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v14 userInfo:0];
  if (!v15)
  {
    id v7 = 0;
    goto LABEL_4;
  }
  uint64_t v16 = v15;
  if (![a3 response]) {
    return;
  }
  id v12 = [a3 response];
  uint64_t v11 = (void (*)(void *, NSError *, id))v12[2];
  int v13 = v16;
  id v10 = 0;
LABEL_6:

  v11(v12, v13, v10);
}

- (void)__resetAutoJoinStatistics:(id)a3
{
  id v5 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      sub_100128F1C((uint64_t)v6);
      goto LABEL_4;
    }
    NSErrorDomain v8 = NSPOSIXErrorDomain;
    uint64_t v9 = 6;
  }
  else
  {
    NSErrorDomain v8 = NSPOSIXErrorDomain;
    uint64_t v9 = 22;
  }
  +[NSError errorWithDomain:v8 code:v9 userInfo:0];
LABEL_4:
  if ([a3 response])
  {
    id v7 = (void (*)(void))*((void *)[a3 response] + 2);
    v7();
  }
}

- (void)__setBlockedBands:(id)a3
{
  id v5 = [a3 info];
  CFArrayRef v6 = (const __CFArray *)[v5 objectForKeyedSubscript:CWFXPCBlockedBandsKey];
  if (v6)
  {
    int v7 = sub_1000AE220((uint64_t)self->_managerRef, v6);
    if (!v7) {
      goto LABEL_3;
    }
    NSErrorDomain v9 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v10 = v7;
  }
  else
  {
    NSErrorDomain v9 = NSPOSIXErrorDomain;
    uint64_t v10 = 22;
  }
  +[NSError errorWithDomain:v9 code:v10 userInfo:0];
LABEL_3:
  if ([a3 response])
  {
    NSErrorDomain v8 = (void (*)(void))*((void *)[a3 response] + 2);
    v8();
  }
}

- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCHostAPConfigurationKey];
  if (!v9
    || (uint64_t v10 = v9, (v11 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v23 = NSPOSIXErrorDomain;
    uint64_t v24 = 22;
    goto LABEL_22;
  }
  CFStringRef v12 = v11;
  int v13 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v11];
  if (!v13)
  {
    NSErrorDomain v23 = NSPOSIXErrorDomain;
    uint64_t v24 = 6;
    goto LABEL_22;
  }
  uint64_t v14 = (uint64_t)v13;
  id v15 = +[NSMutableDictionary dictionary];
  if (![v10 channel]) {
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AP_MODE_MOVETOIOS_MIGRATION"];
  }
  [v15 setObject:objc_msgSend(v10, "SSID") forKeyedSubscript:@"AP_MODE_SSID_BYTES"];
  [v15 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 channel]) forKeyedSubscript:@"CHANNEL"];
  [v15 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(objc_msgSend(v10, "channel"), "flags"))] forKeyedSubscript:@"CHANNEL_FLAGS"];
  [v15 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 PHYMode]) forKeyedSubscript:@"AP_MODE_PHY_MODE"];
  [v15 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "forceBeaconInterval100ms"))] forKeyedSubscript:@"AP_MODE_FORCE_BI_100"];
  [v15 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 forceHiddenMode]) forKeyedSubscript:@"SOFTAP_SOFTAP_HIDDEN_NETWORK"];
  [v15 setObject:objc_msgSend(v10, "IEList") forKeyedSubscript:@"AP_MODE_IE_LIST"];
  uint64_t v16 = (uint64_t)[v10 securityType];
  if (v16 > 79)
  {
    if (v16 == 80)
    {
      [v15 setObject:&off_100263A18 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      uint64_t v17 = &off_100263B08;
      goto LABEL_15;
    }
    if (v16 == 512)
    {
      [v15 setObject:&off_100263A18 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      [v15 setObject:&off_100263A30 forKeyedSubscript:@"AP_MODE_AUTH_UPPER"];
      CFStringRef v18 = @"AP_MODE_CYPHER_TYPE";
      id v19 = v15;
      BOOL v20 = &off_100263A30;
LABEL_16:
      [v19 setObject:v20 forKeyedSubscript:v18];
    }
  }
  else
  {
    if (v16 == 16)
    {
      [v15 setObject:&off_100263A18 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      uint64_t v17 = &off_100263AD8;
      goto LABEL_15;
    }
    if (v16 == 64)
    {
      [v15 setObject:&off_100263A18 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      uint64_t v17 = &off_100263B20;
LABEL_15:
      [v15 setObject:v17 forKeyedSubscript:@"AP_MODE_AUTH_UPPER"];
      [v15 setObject:&off_100263AF0 forKeyedSubscript:@"AP_MODE_CYPHER_TYPE"];
      BOOL v20 = (_UNKNOWN **)[v10 password];
      CFStringRef v18 = @"AP_MODE_KEY";
      id v19 = v15;
      goto LABEL_16;
    }
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_10015D9CC;
  aBlock[3] = &unk_100242590;
  aBlock[4] = a3;
  NSErrorDomain v21 = _Block_copy(aBlock);
  int v22 = sub_1001186D0(v14, v12, 2, v15, (uint64_t)sub_100155EF8, (uint64_t)v21, [a4 processName]);
  if (!v22) {
    return;
  }
  NSErrorDomain v23 = (NSErrorDomain)CWFManagerErrorDomain;
  uint64_t v24 = v22;
LABEL_22:
  id v25 = +[NSError errorWithDomain:v23 code:v24 userInfo:0];
  if (v25)
  {
    if ([a3 response])
    {
      id v26 = (void (**)(id, NSError *, void))[a3 response];
      v26[2](v26, v25, 0);
    }
  }
}

- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = [[[a3 requestParameters] interfaceName];
  if (v7)
  {
    id v8 = v7;
    id v9 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v7];
    if (v9)
    {
      uint64_t v10 = (uint64_t)v9;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_10015DBD4;
      aBlock[3] = &unk_1002425B8;
      aBlock[4] = a3;
      CFStringRef v11 = _Block_copy(aBlock);
      int v12 = sub_100118FBC(v10, v8, 2, (uint64_t)sub_10015625C, (uint64_t)v11);
      if (!v12) {
        return;
      }
      NSErrorDomain v13 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v14 = v12;
    }
    else
    {
      NSErrorDomain v13 = NSPOSIXErrorDomain;
      uint64_t v14 = 6;
    }
  }
  else
  {
    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = 22;
  }
  id v15 = +[NSError errorWithDomain:v13 code:v14 userInfo:0];
  if (v15)
  {
    if ([a3 response])
    {
      uint64_t v16 = (void (**)(id, NSError *, void))[a3 response];
      v16[2](v16, v15, 0);
    }
  }
}

- (void)__getWiFiAssistOverrideReasons:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  int v12 = sub_100022D28;
  NSErrorDomain v13 = sub_100022C20;
  uint64_t v14 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015DDB0;
  block[3] = &unk_10023F3A8;
  block[5] = a3;
  block[6] = &v9;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = (id)v10[5];
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    id v7 = (void (**)(id, void, id))[a3 response];
    v7[2](v7, 0, v5);
  }
  _Block_object_dispose(&v9, 8);
}

- (void)__getBackgroundScanConfiguration:(id)a3
{
  id v5 = [[objc_msgSend(a3, "requestParameters") interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      id v7 = sub_10012DED0((uint64_t)v6);
LABEL_4:
      id v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
      if (![a3 response]) {
        return;
      }
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      uint64_t v11 = (void (*)(void *, NSError *, id))v9[2];
      int v12 = v9;
      NSErrorDomain v13 = 0;
      goto LABEL_6;
    }
    uint64_t v14 = 6;
  }
  else
  {
    uint64_t v14 = 22;
  }
  id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v14 userInfo:0];
  if (!v15)
  {
    id v7 = 0;
    goto LABEL_4;
  }
  uint64_t v16 = v15;
  if (![a3 response]) {
    return;
  }
  int v12 = [a3 response];
  uint64_t v11 = (void (*)(void *, NSError *, id))v12[2];
  NSErrorDomain v13 = v16;
  id v10 = 0;
LABEL_6:

  v11(v12, v13, v10);
}

- (void)__setBackgroundScanConfiguration:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCBackgroundScanConfigurationKey];
  if (v6 && (v7 = v6, (id v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    uint64_t v9 = v8;
    id v10 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v8];
    if (v10)
    {
      int v11 = sub_10012D888((CFMutableArrayRef *)v10, v9, v7);
      if (!v11) {
        goto LABEL_5;
      }
      NSErrorDomain v13 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v14 = v11;
    }
    else
    {
      NSErrorDomain v13 = NSPOSIXErrorDomain;
      uint64_t v14 = 6;
    }
  }
  else
  {
    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = 22;
  }
  +[NSError errorWithDomain:v13 code:v14 userInfo:0];
LABEL_5:
  if ([a3 response])
  {
    int v12 = (void (*)(void))*((void *)[a3 response] + 2);
    v12();
  }
}

- (void)__getAutoJoinDenyList:(id)a3
{
  id v5 = [[[a3 requestParameters] interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      id v7 = sub_10012E320((uint64_t)v6);
LABEL_4:
      id v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
      if (![a3 response]) {
        return;
      }
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      int v11 = (void (*)(void *, NSError *, id))v9[2];
      int v12 = v9;
      NSErrorDomain v13 = 0;
      goto LABEL_6;
    }
    uint64_t v14 = 6;
  }
  else
  {
    uint64_t v14 = 22;
  }
  id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v14 userInfo:0];
  if (!v15)
  {
    id v7 = 0;
    goto LABEL_4;
  }
  uint64_t v16 = v15;
  if (![a3 response]) {
    return;
  }
  int v12 = [a3 response];
  int v11 = (void (*)(void *, NSError *, id))v12[2];
  NSErrorDomain v13 = v16;
  id v10 = 0;
LABEL_6:

  v11(v12, v13, v10);
}

- (void)__setAutoJoinDenyList:(id)a3
{
  id v5 = [[[a3 requestParameters] interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      id v8 = [a3 info];
      unint64_t v9 = [(int)[v8 objectForKeyedSubscript:CWFAutoJoinDenyListAddReasonKey] intValue];
      id v10 = [a3 info];
      int v11 = sub_1000CFEE8([v10 objectForKeyedSubscript:CWFXPCNetworkProfileKey], 0);
      if (!sub_10012E4D4(v7, v9, (uint64_t)v11))
      {
        if (qword_10027DD68) {
          [[(id)qword_10027DD68 WFLog:message:3, "%s - WiFiDeviceManagerSetAutoJoinDenylistedNetwork %lu failed", "-[WiFiXPCManager __setAutoJoinDenyList:]", v9];
        }
      }
      NSErrorDomain v13 = sub_10012E320(v7);
      goto LABEL_8;
    }
    uint64_t v20 = 6;
  }
  else
  {
    uint64_t v20 = 22;
  }
  NSErrorDomain v21 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v20 userInfo:0];
  if (!v21)
  {
    NSErrorDomain v13 = 0;
LABEL_8:
    id v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:v13 forKeyedSubscript:CWFXPCResultKey];
    if (![a3 response]) {
      return;
    }
    id v15 = [a3 response];
    id v16 = [v14 copy];
    uint64_t v17 = (void (*)(void *, NSError *, id))v15[2];
    CFStringRef v18 = v15;
    id v19 = 0;
    goto LABEL_10;
  }
  int v22 = v21;
  if (![a3 response]) {
    return;
  }
  CFStringRef v18 = [a3 response];
  uint64_t v17 = (void (*)(void *, NSError *, id))v18[2];
  id v19 = v22;
  id v16 = 0;
LABEL_10:

  v17(v18, v19, v16);
}

- (void)__clearAutoJoinDenyList:(id)a3
{
  id v5 = [[[a3 requestParameters] interfaceName];
  if (v5)
  {
    id v6 = [(WiFiXPCManager *)self __deviceManagerWithInterfaceName:v5];
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      id v8 = [a3 info];
      uint64_t v9 = (int)[v8 objectForKeyedSubscript:CWFAutoJoinDenyListRemoveReasonKey];
      id v10 = [a3 info];
      int v11 = sub_1000CFEE8([v10 objectForKeyedSubscript:CWFXPCNetworkProfileKey], 0);
      if ((sub_10012E4F4(v7, v9, (uint64_t)v11) & 1) == 0)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s - WiFiDeviceManagerClearAutoJoinDenylistedNetwork %lu failed", "-[WiFiXPCManager __clearAutoJoinDenyList:]", v9);
        }
      }
      NSErrorDomain v13 = sub_10012E320(v7);
      goto LABEL_8;
    }
    uint64_t v20 = 6;
  }
  else
  {
    uint64_t v20 = 22;
  }
  NSErrorDomain v21 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v20 userInfo:0];
  if (!v21)
  {
    NSErrorDomain v13 = 0;
LABEL_8:
    id v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:v13 forKeyedSubscript:CWFXPCResultKey];
    if (![a3 response]) {
      return;
    }
    id v15 = [a3 response];
    id v16 = [v14 copy];
    uint64_t v17 = (void (*)(void *, NSError *, id))v15[2];
    CFStringRef v18 = v15;
    id v19 = 0;
    goto LABEL_10;
  }
  int v22 = v21;
  if (![a3 response]) {
    return;
  }
  CFStringRef v18 = [a3 response];
  uint64_t v17 = (void (*)(void *, NSError *, id))v18[2];
  id v19 = v22;
  id v16 = 0;
LABEL_10:

  v17(v18, v19, v16);
}

@end