@interface BAAgentDownloadRulesEngine
- (BAAgentDownloadRulesEngine)initWithDelegate:(id)a3;
- (BAAgentDownloadRulesEngineDelegate)delegate;
- (BOOL)isConnectedToPower;
- (BOOL)isValidTimeForDownloads;
- (BOOL)lastDownloadIsValidValue;
- (BOOL)networkingIsCheap;
- (OS_dispatch_queue)rulesEngineWorkQueue;
- (__CFRunLoopSource)powerRunLoopSource;
- (float)batteryLevel;
- (int)debugRuleValidity;
- (void)_powerSourceHasChanged;
- (void)_setupPowerSourceMonitor;
- (void)_setupXPCActivity;
- (void)dealloc;
- (void)resume;
- (void)setDebugRuleValidity:(int)a3;
- (void)setDebugValidityTimeOverride:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setLastDownloadIsValidValue:(BOOL)a3;
- (void)setNetworkingIsCheap:(BOOL)a3;
- (void)setPowerRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setRulesEngineWorkQueue:(id)a3;
@end

@implementation BAAgentDownloadRulesEngine

- (BAAgentDownloadRulesEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BAAgentDownloadRulesEngine;
  v5 = [(BAAgentDownloadRulesEngine *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(BAAgentDownloadRulesEngine *)v5 setDelegate:v4];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.backgroundassets.rulesengine", 0);
    [(BAAgentDownloadRulesEngine *)v6 setRulesEngineWorkQueue:v7];

    [(BAAgentDownloadRulesEngine *)v6 setLastDownloadIsValidValue:[(BAAgentDownloadRulesEngine *)v6 isValidTimeForDownloads]];
  }

  return v6;
}

- (void)dealloc
{
  if ([(BAAgentDownloadRulesEngine *)self powerRunLoopSource])
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, [(BAAgentDownloadRulesEngine *)self powerRunLoopSource], kCFRunLoopCommonModes);
    CFRelease(self->_powerRunLoopSource);
    [(BAAgentDownloadRulesEngine *)self setPowerRunLoopSource:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)BAAgentDownloadRulesEngine;
  [(BAAgentDownloadRulesEngine *)&v4 dealloc];
}

- (void)setDebugValidityTimeOverride:(int)a3
{
  v5 = [(BAAgentDownloadRulesEngine *)self rulesEngineWorkQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A204;
  v6[3] = &unk_10005D640;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)isValidTimeForDownloads
{
  if ([(BAAgentDownloadRulesEngine *)self debugRuleValidity])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(BAAgentDownloadRulesEngine *)self isConnectedToPower];
    [(BAAgentDownloadRulesEngine *)self setLastDownloadIsValidValue:v3];
  }
  return v3;
}

- (BOOL)isConnectedToPower
{
  CFTypeRef v2 = IOPSCopyPowerSourcesInfo();
  BOOL v3 = v2;
  if (v2)
  {
    CFArrayRef v4 = IOPSCopyPowerSourcesList(v2);
    for (CFIndex i = 0; ; ++i)
    {
      CFIndex Count = CFArrayGetCount(v4);
      BOOL v7 = i < Count;
      if (i >= Count) {
        break;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
      CFDictionaryRef v9 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
      if (v9)
      {
        Value = CFDictionaryGetValue(v9, @"Power Source State");
        if (Value)
        {
          if (CFEqual(@"AC Power", Value)) {
            break;
          }
        }
      }
    }
    CFRelease(v3);
    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    v11 = sub_100013ABC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Failed to get power sources. Assume connected to power.", v13, 2u);
    }

    return 1;
  }
  return v7;
}

- (float)batteryLevel
{
  CFTypeRef v2 = IOPSCopyPowerSourcesInfo();
  BOOL v3 = v2;
  if (v2)
  {
    CFArrayRef v4 = IOPSCopyPowerSourcesList(v2);
    CFIndex v5 = 0;
    float v6 = 0.0;
    while (v5 < CFArrayGetCount(v4))
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, v5);
      CFDictionaryRef v8 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
      if (v8)
      {
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v8, @"Current Capacity");
        CFNumberRef v10 = Value;
        if (Value)
        {
          CFTypeID v11 = CFGetTypeID(Value);
          if (v11 == CFNumberGetTypeID())
          {
            float valuePtr = 0.0;
            CFNumberGetValue(v10, kCFNumberFloatType, &valuePtr);
            if (valuePtr > v6) {
              float v6 = valuePtr;
            }
          }
        }
      }
      ++v5;
    }
    CFRelease(v3);
    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    v12 = sub_100013ABC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Failed to get power sources. Assume full battery.", buf, 2u);
    }

    return 100.0;
  }
  return v6;
}

- (void)resume
{
  [(BAAgentDownloadRulesEngine *)self _setupXPCActivity];

  [(BAAgentDownloadRulesEngine *)self _setupPowerSourceMonitor];
}

- (void)_setupPowerSourceMonitor
{
  [(BAAgentDownloadRulesEngine *)self setPowerRunLoopSource:IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)j__objc_msgSend__powerSourceHasChanged, self)];
  if ([(BAAgentDownloadRulesEngine *)self powerRunLoopSource])
  {
    Main = CFRunLoopGetMain();
    CFArrayRef v4 = [(BAAgentDownloadRulesEngine *)self powerRunLoopSource];
    CFRunLoopAddSource(Main, v4, kCFRunLoopCommonModes);
  }
}

- (void)_setupXPCActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, 14400);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002A878;
  v4[3] = &unk_10005D668;
  objc_copyWeak(&v5, &location);
  xpc_activity_register("com.apple.backgroundassets.periodic_check", v3, v4);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &stru_10005D6A8);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_powerSourceHasChanged
{
  unsigned int v3 = [(BAAgentDownloadRulesEngine *)self lastDownloadIsValidValue];
  if (v3 != [(BAAgentDownloadRulesEngine *)self isValidTimeForDownloads])
  {
    CFArrayRef v4 = [(BAAgentDownloadRulesEngine *)self rulesEngineWorkQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002AB14;
    block[3] = &unk_10005C998;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (BAAgentDownloadRulesEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BAAgentDownloadRulesEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)networkingIsCheap
{
  return self->_networkingIsCheap;
}

- (void)setNetworkingIsCheap:(BOOL)a3
{
  self->_networkingIsCheap = a3;
}

- (__CFRunLoopSource)powerRunLoopSource
{
  return self->_powerRunLoopSource;
}

- (void)setPowerRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_powerRunLoopSource = a3;
}

- (BOOL)lastDownloadIsValidValue
{
  return self->_lastDownloadIsValidValue;
}

- (void)setLastDownloadIsValidValue:(BOOL)a3
{
  self->_lastDownloadIsValidCFNumberRef Value = a3;
}

- (OS_dispatch_queue)rulesEngineWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRulesEngineWorkQueue:(id)a3
{
}

- (int)debugRuleValidity
{
  return self->_debugRuleValidity;
}

- (void)setDebugRuleValidity:(int)a3
{
  self->_debugRuleValidity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesEngineWorkQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end