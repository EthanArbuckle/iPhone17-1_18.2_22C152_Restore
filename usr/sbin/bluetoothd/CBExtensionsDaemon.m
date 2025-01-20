@interface CBExtensionsDaemon
- (BOOL)remoteAlertActivated;
- (BOOL)remoteAlertAllowedAndReturnReason:(id *)a3 extension:(id)a4;
- (BOOL)remoteAlertStartWithCBExtension:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)resetCBExtension:(id)a3 error:(id *)a4;
- (CBDaemonServer)daemonServer;
- (CUSystemMonitor)systemMonitor;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (id)descriptionWithLevel:(int)a3;
- (id)diagnosticControl:(id)a3 error:(id *)a4;
- (unsigned)assertionFlags;
- (void)_appRegistrationNotification:(id)a3;
- (void)_findExtensionsStart;
- (void)_screenLockedChanged;
- (void)_triggerPendingExtension;
- (void)_updateExtensions:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)prefsChanged;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)screenStateChanged;
- (void)setAssertionFlags:(unsigned int)a3;
- (void)setDaemonServer:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation CBExtensionsDaemon

- (void)_triggerPendingExtension
{
}

- (NSString)description
{
  return (NSString *)[(CBExtensionsDaemon *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v30 = 0;
  v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10004CE9C;
  v34 = sub_10004CD20;
  id v35 = 0;
  int v29 = 12;
  unsigned int v5 = a3;
  uint64_t v28 = 0;
  v15 = [(id)objc_opt_class() description];
  CUAppendF();
  objc_storeStrong(&v35, 0);

  v6 = v31;
  id obj = v31[5];
  id v16 = [(NSMutableDictionary *)self->_extensionMap count];
  CUAppendF();
  objc_storeStrong(v6 + 5, obj);
  uint64_t v23 = 0;
  v24 = (int *)&v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  extensionMap = self->_extensionMap;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005A2CC;
  v22[3] = &unk_100997190;
  v22[4] = &v23;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionMap, "enumerateKeysAndObjectsUsingBlock:", v22, v16);
  if (v24[6] >= 1)
  {
    v8 = v31;
    id v21 = v31[5];
    CUAppendF();
    objc_storeStrong(v8 + 5, v21);
  }
  if (self->_remoteAlertHandle)
  {
    v9 = v31;
    id v20 = v31[5];
    CUAppendF();
    objc_storeStrong(v9 + 5, v20);
  }
  if (v5 <= 0x14)
  {
    v10 = v31;
    id v19 = v31[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v10 + 5, v19);
    v11 = self->_extensionMap;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005A330;
    v17[3] = &unk_1009971E0;
    v17[4] = &v30;
    int v18 = a3;
    [(NSMutableDictionary *)v11 enumerateKeysAndObjectsUsingBlock:v17];
  }
  v12 = (__CFString *)v31[5];
  if (!v12) {
    v12 = &stru_1009C1AC8;
  }
  v13 = v12;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);

  return v13;
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  self->_prefEnforceApprovedExtensions = [(CBDaemonServer *)self->_daemonServer prefEnforceApprovedExtensions];
  if (!self->_appRegistrationObserving)
  {
    v3 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    updateExtensionsCoalescer = self->_updateExtensionsCoalescer;
    self->_updateExtensionsCoalescer = v3;
    unsigned int v5 = v3;

    [(CUCoalescer *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)v5 setMinDelay:5.0];
    [(CUCoalescer *)v5 setMaxDelay:60.0];
    [(CUCoalescer *)v5 setLeeway:1.0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005A81C;
    v12[3] = &unk_100997208;
    v12[4] = v5;
    v12[5] = self;
    [(CUCoalescer *)v5 setActionHandler:v12];
    v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_appRegistrationNotification:" name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v6 addObserver:self selector:"_appRegistrationNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    self->_appRegistrationObserving = 1;
  }
  v7 = self->_systemMonitor;
  if (!v7)
  {
    v7 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    objc_storeStrong((id *)&self->_systemMonitor, v7);
    [(CUSystemMonitor *)v7 setDispatchQueue:self->_dispatchQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005A834;
    v11[3] = &unk_100997230;
    v11[4] = self;
    [(CUSystemMonitor *)v7 setScreenLockedChangedHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005A83C;
    v10[3] = &unk_100997230;
    v10[4] = self;
    [(CUSystemMonitor *)v7 setScreenStateChangedHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000511EC;
    v9[3] = &unk_100997230;
    v9[4] = self;
    [(CUSystemMonitor *)v7 setSystemUIChangedHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005A844;
    v8[3] = &unk_100997230;
    v8[4] = self;
    [(CUSystemMonitor *)v7 activateWithCompletion:v8];
  }
  [(CBExtensionsDaemon *)self _findExtensionsStart];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  self->_invalidateCalled = 1;
  if (self->_appRegistrationObserving)
  {
    v3 = +[NSDistributedNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    self->_appRegistrationObserving = 0;
  }
  [(NSMutableDictionary *)self->_extensionMap enumerateKeysAndObjectsUsingBlock:&stru_100997270];
  [(NSMutableDictionary *)self->_extensionMap removeAllObjects];
  extensionMap = self->_extensionMap;
  self->_extensionMap = 0;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    [(SBSRemoteAlertHandle *)remoteAlertHandle unregisterObserver:self];
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    v6 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

    self->_remoteAlertActivated = 0;
    [(CBDaemonServer *)self->_daemonServer setSystemFlags:0 mask:1];
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  [(CUCoalescer *)self->_updateExtensionsCoalescer invalidate];
  updateExtensionsCoalescer = self->_updateExtensionsCoalescer;
  self->_updateExtensionsCoalescer = 0;
}

- (id)diagnosticControl:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFStringGetTypeID();
  v7 = (const char *)[ (id) CFDictionaryGetTypedValue() UTF8String];
  if (!v7)
  {
    if (a4) {
      goto LABEL_7;
    }
LABEL_29:
    CFStringRef v9 = 0;
    goto LABEL_27;
  }
  v8 = v7;
  if (!strcasecmp(v7, "extension-found"))
  {
    CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      v11 = [(NSMutableDictionary *)self->_extensionMap objectForKeyedSubscript:v10];
      if (v11)
      {
        id v12 = objc_alloc_init((Class)CBDevice);
        [v12 setIdentifier:@"Test Device"];
        [v11 _deviceFound:v12];

LABEL_24:
        CFStringRef v9 = &stru_1009C1AC8;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
LABEL_32:
      if (a4)
      {
        CBErrorF();
        CFStringRef v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CFStringRef v9 = 0;
      }
      goto LABEL_25;
    }
LABEL_30:
    if (a4)
    {
      CBErrorF();
      CFStringRef v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFStringRef v9 = 0;
    }
    goto LABEL_26;
  }
  if (!strcasecmp(v8, "extension-launch"))
  {
    CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      v11 = [(NSMutableDictionary *)self->_extensionMap objectForKeyedSubscript:v10];
      if (v11)
      {
        id v13 = objc_alloc_init((Class)CBDevice);
        [v13 setIdentifier:@"Test Device"];
        id v20 = 0;
        unsigned __int8 v14 = [(CBExtensionsDaemon *)self remoteAlertStartWithCBExtension:v11 device:v13 error:&v20];
        id v15 = v20;
        if (v14)
        {
          CFStringRef v9 = &stru_1009C1AC8;
        }
        else if (a4)
        {
          id v17 = v15;
          id v18 = v15;
          id v15 = v17;
          CFStringRef v9 = 0;
          *a4 = v18;
        }
        else
        {
          CFStringRef v9 = 0;
        }

        goto LABEL_25;
      }
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (!strcasecmp(v8, "extension-reset"))
  {
    CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      v11 = [(NSMutableDictionary *)self->_extensionMap objectForKeyedSubscript:v10];
      if (v11)
      {
        if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
          [v11 reset:v10];
        }
        else
        {
          [v11 reset:v19];
        }
        goto LABEL_24;
      }
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (!strcasecmp(v8, "extension-update"))
  {
    [(CBExtensionsDaemon *)self _findExtensionsStart];
    CFStringRef v9 = &stru_1009C1AC8;
    goto LABEL_27;
  }
  if (!a4) {
    goto LABEL_29;
  }
LABEL_7:
  CBErrorF();
  CFStringRef v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return (id)v9;
}

- (void)prefsChanged
{
  BOOL v3 = [(CBDaemonServer *)self->_daemonServer prefEnforceApprovedExtensions];
  if (self->_prefEnforceApprovedExtensions != v3)
  {
    self->_prefEnforceApprovedExtensions = v3;
    updateExtensionsCoalescer = self->_updateExtensionsCoalescer;
    [(CUCoalescer *)updateExtensionsCoalescer trigger];
  }
}

- (BOOL)resetCBExtension:(id)a3 error:(id *)a4
{
  id v5 = a3;
  extensionMap = self->_extensionMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005AEBC;
  v9[3] = &unk_100997298;
  id v10 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)extensionMap enumerateKeysAndObjectsUsingBlock:v9];
  [(CBExtensionsDaemon *)self _triggerPendingExtension];

  return 1;
}

- (void)_screenLockedChanged
{
  unsigned __int8 v3 = [(CUSystemMonitor *)self->_systemMonitor screenLockedSync];
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if ((v3 & 1) == 0)
  {
    [(CBExtensionsDaemon *)self _triggerPendingExtension];
  }
}

- (void)screenStateChanged
{
  int v3 = [(CUSystemMonitor *)self->_systemMonitor screenState];
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v3 < 30)
  {
    extensionMap = self->_extensionMap;
    [(NSMutableDictionary *)extensionMap enumerateKeysAndObjectsUsingBlock:&stru_1009972B8];
  }
  else
  {
    [(CBExtensionsDaemon *)self _triggerPendingExtension];
  }
}

- (void)setAssertionFlags:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_assertionFlags = a3;

  [(CBExtensionsDaemon *)self _triggerPendingExtension];
}

- (void)_appRegistrationNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B1F0;
  block[3] = &unk_100997230;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_findExtensionsStart
{
  if (self->_findExtensionsRunning)
  {
    if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    self->_findExtensionsDeferred = 1;
  }
  else
  {
    if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    self->_findExtensionsRunning = 1;
    int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    id v5 = dispatch_queue_create("CBExtensionFindLatest", v4);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005B3F8;
    v6[3] = &unk_1009972E0;
    v6[4] = self;
    v6[5] = mach_absolute_time();
    dispatch_async(v5, v6);
  }
}

- (void)_updateExtensions:(id)a3
{
  id v4 = a3;
  id v5 = CBStackConnectDeviceRequest;
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
  {
    id v32 = [v4 count];
    LogPrintF_safe();
  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_extensionMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100997320, v32);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
  v36 = v6;
  if (v7)
  {
    id v8 = v7;
    int v35 = 0;
    int v37 = 0;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v12 = [v6 objectForKeyedSubscript:v11, v33];
        id v13 = [v12 discoveryInfo];
        unsigned __int8 v14 = [v12 xpcDiscoveryInfo];
        if (v14)
        {
          if ([(CBDaemonServer *)self->_daemonServer xpcEventAllowedInfo:v14])
          {
            uint64_t v15 = [(NSMutableDictionary *)self->_extensionMap objectForKeyedSubscript:v11];
            if (v15)
            {
              id v16 = (CBExtension *)v15;
              ++v37;
              int isa = (int)v5[81].isa;
              if (isa <= 30 && (isa != -1 || _LogCategory_Initialize())) {
                goto LABEL_27;
              }
            }
            else
            {
              id v16 = objc_alloc_init(CBExtension);
              id v20 = [v12 bundleID];
              [(CBExtension *)v16 setBundleID:v20];

              [(CBExtension *)v16 setDispatchQueue:self->_dispatchQueue];
              [(CBExtension *)v16 setExtensionID:v11];
              [(CBExtension *)v16 setExtensionsDaemon:self];
              extensionMap = self->_extensionMap;
              if (!extensionMap)
              {
                v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                uint64_t v23 = self->_extensionMap;
                self->_extensionMap = v22;

                extensionMap = self->_extensionMap;
              }
              [(NSMutableDictionary *)extensionMap setObject:v16 forKeyedSubscript:v11];
              ++v35;
              id v5 = CBStackConnectDeviceRequest;
              if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
              {
LABEL_27:
                CUPrintNSObjectOneLine();
                v34 = uint64_t v33 = v11;
                LogPrintF_safe();

                id v5 = CBStackConnectDeviceRequest;
              }
            }
            -[CBExtension setPresent:](v16, "setPresent:", 1, v33, v34);
            CFStringGetTypeID();
            [(CBExtension *)v16 setSceneIdentifier:CFDictionaryGetTypedValue()];
            [(CBExtension *)v16 setScreenLocked:CFDictionaryGetInt64() != 0];
            CFStringGetTypeID();
            [(CBExtension *)v16 setViewControllerClassName:CFDictionaryGetTypedValue()];
            [(CBExtension *)v16 updateWithXPCDiscoveryInfo:v14];

            id v6 = v36;
            goto LABEL_36;
          }
          int v19 = (int)v5[81].isa;
          if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v33 = v11;
            goto LABEL_22;
          }
        }
        else
        {
          int v18 = (int)v5[81].isa;
          if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v33 = v11;
LABEL_22:
            LogPrintF_safe();
          }
        }
LABEL_36:
      }
      id v8 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v24 = [(NSMutableDictionary *)self->_extensionMap allKeys];
  id v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v25)
  {
    id v26 = v25;
    int v27 = 0;
    uint64_t v28 = *(void *)v39;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * (void)j);
        v31 = -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionMap, "objectForKeyedSubscript:", v30, v33);
        if (([v31 present] & 1) == 0)
        {
          [(NSMutableDictionary *)self->_extensionMap setObject:0 forKeyedSubscript:v30];
          [v31 invalidate];
          ++v27;
          if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v33 = v30;
            LogPrintF_safe();
          }
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v26);
  }

  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (BOOL)remoteAlertAllowedAndReturnReason:(id *)a3 extension:(id)a4
{
  id v6 = a4;
  if ((int)[(CUSystemMonitor *)self->_systemMonitor screenState] <= 29)
  {
    if (!a3) {
      goto LABEL_8;
    }
    id v8 = *a3;
    uint64_t v9 = @"Screen off";
    goto LABEL_19;
  }
  if (([v6 screenLocked] & 1) == 0
    && [(CUSystemMonitor *)self->_systemMonitor screenLockedSync])
  {
    if (!a3) {
      goto LABEL_8;
    }
    id v8 = *a3;
    uint64_t v9 = @"Screen locked";
LABEL_19:
    *a3 = v9;
    goto LABEL_20;
  }
  if (self->_remoteAlertActivated)
  {
    if (!a3) {
      goto LABEL_8;
    }
    id v8 = *a3;
    uint64_t v9 = @"UI already active";
    goto LABEL_19;
  }
  if ((self->_assertionFlags & 2) != 0)
  {
    if (!a3) {
      goto LABEL_8;
    }
    id v8 = *a3;
    uint64_t v9 = @"SuppressUIExtensions assertion";
    goto LABEL_19;
  }
  if (([(CUSystemMonitor *)self->_systemMonitor systemUIFlags] & 0x7E409) != 0)
  {
    if (!a3) {
      goto LABEL_8;
    }
    id v8 = CUPrintFlags32();
    id v10 = NSPrintF();
    id v11 = *a3;
    *a3 = v10;

LABEL_20:
    LOBYTE(a3) = 0;
    goto LABEL_8;
  }
  LOBYTE(a3) = 1;
LABEL_8:

  return (char)a3;
}

- (BOOL)remoteAlertStartWithCBExtension:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v34 = a4;
  uint64_t v9 = [v8 bundleID];
  if (!v9)
  {
    if (!a5) {
      goto LABEL_39;
    }
LABEL_38:
    CBErrorF();
    BOOL v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if ((int)[(CUSystemMonitor *)self->_systemMonitor screenState] <= 29)
  {
    if (!a5) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (([v8 screenLocked] & 1) == 0
    && [(CUSystemMonitor *)self->_systemMonitor screenLockedSync])
  {
    if (!a5) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (self->_remoteAlertActivated)
  {
    if (a5) {
      goto LABEL_38;
    }
LABEL_39:
    BOOL v27 = 0;
    goto LABEL_28;
  }
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
  {
    id v29 = v8;
    id v31 = v34;
    LogPrintF_safe();
  }
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    [(SBSRemoteAlertHandle *)remoteAlertHandle unregisterObserver:self];
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    id v11 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

    self->_remoteAlertActivated = 0;
    [(CBDaemonServer *)self->_daemonServer setSystemFlags:0 mask:1];
  }
  id v12 = [v8 bundleID:v29, v31];
  uint64_t v13 = [v8 sceneIdentifier];
  unsigned __int8 v14 = (void *)v13;
  if (!v12 || !v13)
  {
    uint64_t v16 = [v8 viewControllerClassName];
    if (v16)
    {
      uint64_t v15 = (void *)v16;
      id v17 = a5;
      id v18 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v9 viewControllerClassName:v16];
LABEL_22:
      int v19 = v18;

      id v20 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
      uint64_t v21 = [v34 dictionaryRepresentation];
      v22 = (void *)v21;
      if (v21)
      {
        CFStringRef v35 = @"device";
        uint64_t v36 = v21;
        uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [v20 setUserInfo:v23];
      }
      v24 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v19, v20, v30, v32, v33);
      id v25 = self->_remoteAlertHandle;
      self->_remoteAlertHandle = v24;

      id v26 = self->_remoteAlertHandle;
      BOOL v27 = v26 != 0;
      if (v26)
      {
        [(SBSRemoteAlertHandle *)v26 registerObserver:self];
        [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:0];
      }
      else if (v17)
      {
        CBErrorF();
        *id v17 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_27;
    }
    if (a5) {
      goto LABEL_43;
    }
LABEL_44:
    BOOL v27 = 0;
    goto LABEL_27;
  }
  uint64_t v15 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:v12];
  if (dword_1009F7CA8 <= 30 && (dword_1009F7CA8 != -1 || _LogCategory_Initialize()))
  {
    id v32 = v12;
    uint64_t v33 = v14;
    uint64_t v30 = v15;
    LogPrintF_safe();
  }
  if (v15)
  {
    id v17 = a5;
    id v18 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithSceneProvidingProcess:v15 configurationIdentifier:v14];
    goto LABEL_22;
  }
  if (!a5) {
    goto LABEL_44;
  }
LABEL_43:
  CBErrorF();
  BOOL v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
  return v27;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C688;
  v7[3] = &unk_100997208;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C80C;
  v7[3] = &unk_100997208;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C98C;
  v8[3] = &unk_100997208;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (unsigned)assertionFlags
{
  return self->_assertionFlags;
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)remoteAlertActivated
{
  return self->_remoteAlertActivated;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_updateExtensionsCoalescer, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);

  objc_storeStrong((id *)&self->_extensionMap, 0);
}

@end