@interface CBExtension
- (BOOL)allowRSSI;
- (BOOL)present;
- (BOOL)screenLocked;
- (BOOL)triggerIfPending;
- (BOOL)triggeredUI;
- (CBDiscovery)discoveryClient;
- (CBExtensionsDaemon)extensionsDaemon;
- (NSDictionary)discoveryInfo;
- (NSMutableDictionary)deviceMap;
- (NSMutableDictionary)triggeredDeviceMap;
- (NSString)bundleID;
- (NSString)extensionID;
- (NSString)sceneIdentifier;
- (NSString)viewControllerClassName;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcDiscoveryInfo;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_updateRSSIFilter;
- (void)invalidate;
- (void)reset;
- (void)setAllowRSSI:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setDiscoveryInfo:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExtensionID:(id)a3;
- (void)setExtensionsDaemon:(id)a3;
- (void)setPresent:(BOOL)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setScreenLocked:(BOOL)a3;
- (void)setTriggeredDeviceMap:(id)a3;
- (void)setTriggeredUI:(BOOL)a3;
- (void)setViewControllerClassName:(id)a3;
- (void)setXpcDiscoveryInfo:(id)a3;
- (void)updateWithXPCDiscoveryInfo:(id)a3;
@end

@implementation CBExtension

- (BOOL)triggerIfPending
{
  if (self->_triggeredUI)
  {
    if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    return 0;
  }
  else
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    triggeredDeviceMap = self->_triggeredDeviceMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005D028;
    v6[3] = &unk_100997348;
    v6[4] = self;
    v6[5] = &v7;
    [(NSMutableDictionary *)triggeredDeviceMap enumerateKeysAndObjectsUsingBlock:v6];
    [(CBExtension *)self _updateRSSIFilter];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  return v4;
}

- (void)_updateRSSIFilter
{
  if (self->_allowRSSI
    && !self->_triggeredUI
    && ([(NSMutableDictionary *)self->_deviceMap count]
     || [(NSMutableDictionary *)self->_triggeredDeviceMap count]))
  {
    if (((unint64_t)[(CBDiscovery *)self->_discoveryClient discoveryFlags] & 0x200000000) != 0) {
      return;
    }
    if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
    {
      extensionID = self->_extensionID;
      LogPrintF_safe();
    }
    discoveryClient = self->_discoveryClient;
    unint64_t v4 = (unint64_t)[(CBDiscovery *)discoveryClient discoveryFlags] | 0x200000000;
  }
  else
  {
    if (((unint64_t)[(CBDiscovery *)self->_discoveryClient discoveryFlags] & 0x200000000) == 0) {
      return;
    }
    if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
    {
      extensionID = self->_extensionID;
      LogPrintF_safe();
    }
    discoveryClient = self->_discoveryClient;
    unint64_t v4 = (unint64_t)[(CBDiscovery *)discoveryClient discoveryFlags] & 0xFFFFFFFDFFFFFFFFLL;
  }

  [(CBDiscovery *)discoveryClient setDiscoveryFlags:v4];
}

- (id)description
{
  return [(CBExtension *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v13 = [(id)objc_opt_class() description];
  CUAppendF();
  id v4 = 0;

  extensionID = self->_extensionID;
  if (extensionID)
  {
    v14 = extensionID;
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    v15 = discoveryClient;
    CUAppendF();
    id v8 = v4;

    id v4 = v8;
  }
  CUAppendF();
  id v9 = v4;

  sceneIdentifier = self->_sceneIdentifier;
  if (sceneIdentifier)
  {
    v16 = sceneIdentifier;
    CUAppendF();
    id v11 = v9;

    id v9 = v11;
  }

  return v9;
}

- (void)invalidate
{
  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    if (dword_1009F7CA8 <= 30)
    {
      if (dword_1009F7CA8 != -1 || (int v4 = _LogCategory_Initialize(), discoveryClient = self->_discoveryClient, v4))
      {
        extensionID = self->_extensionID;
        uint64_t v7 = discoveryClient;
        LogPrintF_safe();
        discoveryClient = self->_discoveryClient;
      }
    }
    [(CBDiscovery *)discoveryClient invalidate];
    v5 = self->_discoveryClient;
    self->_discoveryClient = 0;
  }
}

- (void)reset
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v3 = [(NSMutableDictionary *)self->_triggeredDeviceMap allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  v5 = CBStackConnectDeviceRequest;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v27;
    id v8 = &dword_1009F7CA8;
    do
    {
      id v9 = 0;
      id v25 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v9);
        id v11 = [(NSMutableDictionary *)self->_triggeredDeviceMap objectForKeyedSubscript:v10];
        unsigned int v12 = [v11 present];
        int isa = (int)v5[81].isa;
        if (v12)
        {
          if (isa <= 30 && (isa != -1 || _LogCategory_Initialize()))
          {
            extensionID = self->_extensionID;
            [v11 device];
            v24 = v21 = extensionID;
            LogPrintF_safe();
          }
          [v11 setUiTicks:0, v21, v24];
        }
        else if (isa <= 30 && (isa != -1 || _LogCategory_Initialize()))
        {
          uint64_t v15 = v7;
          v16 = v3;
          v17 = v5;
          v18 = v8;
          v19 = self->_extensionID;
          [v11 device];
          v24 = v22 = v19;
          id v8 = v18;
          v5 = v17;
          v3 = v16;
          uint64_t v7 = v15;
          id v6 = v25;
          LogPrintF_safe();

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggeredDeviceMap, "setObject:forKeyedSubscript:", 0, v10, v22);
        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggeredDeviceMap, "setObject:forKeyedSubscript:", 0, v10, v21);
        }

        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  if (self->_triggeredUI
    && (self->_triggeredUI = 0, int v20 = (int)v5[81].isa, v20 <= 30)
    && (v20 != -1 || _LogCategory_Initialize()))
  {
    v23 = self->_extensionID;
    LogPrintF_safe();
    [(CBExtension *)self _updateRSSIFilter];
  }
  else
  {
    [(CBExtension *)self _updateRSSIFilter];
  }
}

- (void)updateWithXPCDiscoveryInfo:(id)a3
{
  id v4 = a3;
  p_discoveryClient = &self->_discoveryClient;
  id v6 = self->_discoveryClient;
  uint64_t v7 = v6;
  if (!v6)
  {
    id v8 = objc_alloc_init((Class)CBDiscovery);
    objc_storeStrong((id *)&self->_discoveryClient, v8);
    [v8 setAppID:self->_extensionID];
    [v8 setDispatchQueue:self->_dispatchQueue];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10005D544;
    v23[3] = &unk_100997370;
    id v9 = v8;
    id v24 = v9;
    id v25 = self;
    [v9 setDeviceFoundHandler:v23];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005D560;
    v20[3] = &unk_100997370;
    uint64_t v7 = (CBDiscovery *)v9;
    v21 = v7;
    v22 = self;
    [(CBDiscovery *)v7 setDeviceLostHandler:v20];
  }
  id v10 = [(CBDiscovery *)v7 updateWithXPCSubscriberInfo:v4];
  if (([(CBDiscovery *)*p_discoveryClient bleRSSIThresholdHint] & 0x80000000) == 0) {
    [(CBDiscovery *)*p_discoveryClient setBleRSSIThresholdHint:4294967226];
  }
  if (([gCBDaemonServer prefCBExtensionRSSIOverride] & 0x80000000) != 0) {
    -[CBDiscovery setBleRSSIThresholdHint:](*p_discoveryClient, "setBleRSSIThresholdHint:", [gCBDaemonServer prefCBExtensionRSSIOverride]);
  }
  if (v6)
  {
    if (v10)
    {
      if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
      {
        extensionID = self->_extensionID;
        v13 = v7;
        LogPrintF_safe();
      }
      id v11 = [(CBExtensionsDaemon *)self->_extensionsDaemon daemonServer];
      [v11 scheduleDiscoveryUpdateImmediate:0];
    }
    else if (dword_1009F7CA8 <= 20 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
    {
      extensionID = self->_extensionID;
      LogPrintF_safe();
    }
  }
  else
  {
    if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
    {
      extensionID = self->_extensionID;
      v13 = v7;
      LogPrintF_safe();
    }
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10005D57C;
    v17 = &unk_100997398;
    v18 = v7;
    v19 = self;
    [(CBDiscovery *)v18 activateWithCompletion:&v14];
  }
  self->_allowRSSI = ([(CBDiscovery *)self->_discoveryClient bleRSSIThresholdHint] & 0x80) != 0;
  [(CBExtension *)self _updateRSSIFilter];
}

- (void)_deviceFound:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [(CBExtensionsDaemon *)self->_extensionsDaemon daemonServer];
    uint64_t v7 = [v6 prefFilterNearbyActionExtraData];

    if (v7)
    {
      id v8 = [v4 nearbyActionExtraData];
      id v9 = v7;
      id v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if (!v8)
        {

LABEL_15:
          if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
          {
            long long v29 = CUPrintNSDataHex();
            LogPrintF_safe();
          }
LABEL_34:

          goto LABEL_35;
        }
        unsigned __int8 v11 = [v8 isEqual:v9];

        if ((v11 & 1) == 0) {
          goto LABEL_15;
        }
      }
    }
    signed int v12 = [v4 rssi];
    signed int v13 = [(CBDiscovery *)self->_discoveryClient bleRSSIThresholdHint];
    if (v13 < 0 && (!v12 || v12 < v13))
    {
      if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
      {
        extensionID = self->_extensionID;
        id v31 = v4;
        LogPrintF_safe();
      }
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v24 = self->_deviceMap;
        self->_deviceMap = v23;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v4, v5, extensionID, v31);
      id v25 = [(NSMutableDictionary *)self->_triggeredDeviceMap objectForKeyedSubscript:v5];
      v14 = v25;
      if (v25)
      {
        [(CBTriggeredDevice *)v25 setPresent:0];
        if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
        {
          long long v26 = self->_extensionID;
          [(CBTriggeredDevice *)v14 device];
          v32 = v30 = v26;
          LogPrintF_safe();
        }
      }
      [(CBExtension *)self _updateRSSIFilter];
    }
    else
    {
      if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
      {
        extensionID = self->_extensionID;
        id v31 = v4;
        LogPrintF_safe();
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_triggeredDeviceMap, "objectForKeyedSubscript:", v5, extensionID, v31);
      v14 = (CBTriggeredDevice *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v14 = objc_alloc_init(CBTriggeredDevice);
        triggeredDeviceMap = self->_triggeredDeviceMap;
        if (!triggeredDeviceMap)
        {
          v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v17 = self->_triggeredDeviceMap;
          self->_triggeredDeviceMap = v16;

          triggeredDeviceMap = self->_triggeredDeviceMap;
        }
        [(NSMutableDictionary *)triggeredDeviceMap setObject:v14 forKeyedSubscript:v5];
      }
      [(CBTriggeredDevice *)v14 setDevice:v4];
      [(CBTriggeredDevice *)v14 setPresent:1];
      uint64_t v18 = mach_absolute_time();
      [(CBTriggeredDevice *)v14 setTriggerTicks:v18];
      if ([(CBTriggeredDevice *)v14 uiTicks])
      {
        if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
        {
          long long v27 = [(CBTriggeredDevice *)v14 device];
          [(CBTriggeredDevice *)v14 uiTicks];
          UpTicksToSecondsF();
          v34 = CUPrintDurationDouble();
          LogPrintF_safe();
        }
      }
      else if (self->_triggeredUI)
      {
        if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
      }
      else
      {
        v36 = @"unknown";
        if ([(CBExtensionsDaemon *)self->_extensionsDaemon remoteAlertAllowedAndReturnReason:&v36 extension:self])
        {
          extensionsDaemon = self->_extensionsDaemon;
          id v35 = 0;
          unsigned __int8 v20 = [(CBExtensionsDaemon *)extensionsDaemon remoteAlertStartWithCBExtension:self device:v4 error:&v35];
          id v21 = v35;
          if (v20)
          {
            [(CBTriggeredDevice *)v14 setUiTicks:v18];
            self->_triggeredUI = 1;
            [(CBExtension *)self _updateRSSIFilter];
          }
          else if (dword_1009F7CA8 <= 90 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
          {
            v33 = CUPrintNSError();
            LogPrintF_safe();
          }
        }
        else if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }

    goto LABEL_34;
  }
LABEL_35:
}

- (void)_deviceLost:(id)a3
{
  id v4 = a3;
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
  {
    if (self->_triggeredUI) {
      v5 = "yes";
    }
    else {
      v5 = "no";
    }
    id v13 = v4;
    v14 = v5;
    extensionID = self->_extensionID;
    LogPrintF_safe();
  }
  id v6 = [v4 identifier:extensionID v13:v14];
  if (v6)
  {
    [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v6];
    uint64_t v7 = [(NSMutableDictionary *)self->_triggeredDeviceMap objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      [v7 setPresent:0];
      [(CBExtension *)self _updateRSSIFilter];
      if (self->_triggeredUI)
      {
        id v9 = +[NSDistributedNotificationCenter defaultCenter];
        v15[0] = @"deviceIdentifier";
        v15[1] = @"extensionID";
        CFStringRef v10 = (const __CFString *)self->_extensionID;
        if (!v10) {
          CFStringRef v10 = @"?";
        }
        v16[0] = v6;
        v16[1] = v10;
        unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
        [v9 postNotificationName:@"com.apple.bluetooth.extensionDeviceLost" object:0 userInfo:v11 deliverImmediately:1];
      }
    }
  }
}

- (BOOL)allowRSSI
{
  return self->_allowRSSI;
}

- (void)setAllowRSSI:(BOOL)a3
{
  self->_allowRSSI = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (CBDiscovery)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (NSDictionary)discoveryInfo
{
  return self->_discoveryInfo;
}

- (void)setDiscoveryInfo:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (CBExtensionsDaemon)extensionsDaemon
{
  return self->_extensionsDaemon;
}

- (void)setExtensionsDaemon:(id)a3
{
}

- (NSString)extensionID
{
  return self->_extensionID;
}

- (void)setExtensionID:(id)a3
{
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (NSMutableDictionary)triggeredDeviceMap
{
  return self->_triggeredDeviceMap;
}

- (void)setTriggeredDeviceMap:(id)a3
{
}

- (BOOL)triggeredUI
{
  return self->_triggeredUI;
}

- (void)setTriggeredUI:(BOOL)a3
{
  self->_triggeredUI = a3;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (OS_xpc_object)xpcDiscoveryInfo
{
  return self->_xpcDiscoveryInfo;
}

- (void)setXpcDiscoveryInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcDiscoveryInfo, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_triggeredDeviceMap, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_extensionsDaemon, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryInfo, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end