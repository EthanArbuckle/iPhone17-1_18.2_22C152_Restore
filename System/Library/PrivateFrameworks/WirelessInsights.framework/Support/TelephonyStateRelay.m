@interface TelephonyStateRelay
+ (TelephonyStateRelay)sharedInstance;
+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5;
- (BOOL)getAirplaneModeActive:(id *)a3;
- (BOOL)getInterfaceCostExpensive:(id)a3 error:(id *)a4;
- (BOOL)getIsSatelliteProvisioned:(id)a3 error:(id *)a4;
- (BOOL)getLowDataMode:(id)a3 error:(id *)a4;
- (BOOL)isMultiSim;
- (CoreTelephonyClient)coreTelephonyClient;
- (TelephonyStateRelay)init;
- (id).cxx_construct;
- (id)copyCTRegistrationDisplayStatus:(id)a3 error:(id *)a4;
- (id)copyCTRegistrationStatus:(id)a3 error:(id *)a4;
- (id)findDelegateEntryByDelegate:(id)a3;
- (id)getCTCurrentDataSubscriptionContextSync:(id *)a3;
- (id)getCTSignalStrengthInfo:(id)a3 error:(id *)a4;
- (id)getCTSubscriptionInfoWithError:(id *)a3;
- (id)getHomeCarrierMCC:(id)a3 error:(id *)a4;
- (id)getHomeCarrierMNC:(id)a3 error:(id *)a4;
- (id)getStewieState;
- (id)getTelephonyClientInstance;
- (void)addTelephonyStateDelegate:(id)a3 withQueue:(dispatch_queue_s *)a4;
- (void)airplaneModeStatusChanged;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)ctServerRadioStateChangedNotification:(__CFDictionary *)a3;
- (void)currentDataSimChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)getAirplaneModeStatus:(id)a3;
- (void)getRadioAccessTechnology:(id)a3 delegate:(id)a4;
- (void)getRadioStateForDelegate:(id)a3;
- (void)getSatelliteRegistrationStatus:(id)a3 delegate:(id)a4;
- (void)handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)handleContextUpdated:(id)a3 forKey:(int)a4 withState:(id)a5;
- (void)handleCurrentDataSimChanged:(id)a3;
- (void)handleDataStatusChanged:(id)a3 dataStatus:(id)a4;
- (void)handleDisplayStatusChanged:(id)a3 displayStatus:(id)a4;
- (void)handleInterfaceCostExpensiveChanged:(id)a3 info:(BOOL)a4;
- (void)handleLowDataModeChanged:(id)a3 info:(BOOL)a4;
- (void)handlePlmnChanged:(id)a3 plmn:(id)a4;
- (void)handleRadioAccessTechnologyChanged:(id)a3 info:(id)a4;
- (void)handleRadioStateChangedTo:(id)a3;
- (void)handleRegistrationStatusChanged:(id)a3;
- (void)handleSatelliteCapabilityChanged:(id)a3 info:(id)a4;
- (void)handleSatelliteRegistrationStatusForContext:(id)a3 changedTo:(BOOL)a4;
- (void)handleSignalStrengthChanged:(id)a3 info:(id)a4;
- (void)handleStewieStateChanged:(id)a3;
- (void)handleSubscriptionInfoChanged;
- (void)interfaceCostExpensiveChanged:(id)a3 isExpensive:(BOOL)a4;
- (void)lowDataModeChanged:(id)a3 userEnabled:(BOOL)a4;
- (void)plmnChanged:(id)a3 plmn:(id)a4;
- (void)registerAirplaneModeCallbacks;
- (void)removeTelephonyStateDelegate:(id)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)stateChanged:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation TelephonyStateRelay

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(TelephonyStateRelay *)self handleCellMonitorUpdate:v7 info:v6];
  [(TelephonyStateRelay *)self handleRadioAccessTechnologyChanged:v7 info:v6];
}

- (void)handleRadioAccessTechnologyChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = +[WISTelephonyUtils getServingCellInfo:a4];
  id v20 = 0;
  v8 = +[WISTelephonyUtils getRATFromCellInfo:v7 error:&v20];
  id v9 = v20;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    v11 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TelephonyStateRelay:#N Error while fetching RAT: %@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = [v6 slotID];
    if (v13 == (id)1)
    {
      p_currentRadioAccessTechnology = &self->_currentRadioAccessTechnology;
      v18 = [(NSMutableArray *)self->_currentRadioAccessTechnology objectAtIndexedSubscript:0];
      unsigned __int8 v19 = [v8 isEqual:v18];

      if ((v19 & 1) == 0)
      {
        uint64_t v17 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      if (v13 != (id)2)
      {
LABEL_15:
        [(TelephonyStateRelay *)self handleContextUpdated:v6 forKey:9 withState:v8];
        goto LABEL_16;
      }
      p_currentRadioAccessTechnology = &self->_currentRadioAccessTechnology;
      v15 = [(NSMutableArray *)self->_currentRadioAccessTechnology objectAtIndexedSubscript:1];
      unsigned __int8 v16 = [v8 isEqual:v15];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = 1;
LABEL_14:
        [(NSMutableArray *)*p_currentRadioAccessTechnology setObject:v8 atIndexedSubscript:v17];
        goto LABEL_15;
      }
    }
  }
LABEL_16:
}

- (void)handleContextUpdated:(id)a3 forKey:(int)a4 withState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_delegates;
  id v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v13 queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000DC38;
        block[3] = &unk_1001B7B78;
        block[4] = v13;
        id v17 = v8;
        int v19 = a4;
        id v18 = v9;
        dispatch_async(v14, block);
      }
      id v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)handleCellMonitorUpdate:(id)a3 info:(id)a4
{
}

+ (TelephonyStateRelay)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068588;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7CD0 != -1) {
    dispatch_once(&qword_1001D7CD0, block);
  }
  v2 = (void *)qword_1001D7CC8;

  return (TelephonyStateRelay *)v2;
}

- (TelephonyStateRelay)init
{
  v25.receiver = self;
  v25.super_class = (Class)TelephonyStateRelay;
  v2 = [(TelephonyStateRelay *)&v25 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    delegates = v2->_delegates;
    v2->_delegates = v3;

    v2->_telephonyClientQueue = (dispatch_queue_s *)dispatch_queue_create("com.apple.wirelessinsightsd.TelephonyStateRelay.CallbackQueue", 0);
    uint64_t v5 = [(TelephonyStateRelay *)v2 getTelephonyClientInstance];
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v5;

    id v7 = (CTStewieStateMonitor *)[objc_alloc((Class)CTStewieStateMonitor) initWithDelegate:v2 queue:v2->_telephonyClientQueue];
    stewieStateMonitor = v2->_stewieStateMonitor;
    v2->_stewieStateMonitor = v7;

    [(CTStewieStateMonitor *)v2->_stewieStateMonitor start];
    uint64_t v9 = +[TUCallCenter callCenterWithQueue:v2->_telephonyClientQueue];
    tuCallCenter = v2->_tuCallCenter;
    v2->_tuCallCenter = (TUCallCenter *)v9;

    [(TelephonyStateRelay *)v2 registerAirplaneModeCallbacks];
    v2->_isMultiSim = [(TelephonyStateRelay *)v2 isMultiSim];
    uint64_t v11 = _CTServerConnectionCreateOnTargetQueue();
    fRef = v2->_ctServerConnection.fRef;
    v2->_ctServerConnection.fRef = (__CTServerConnection *)v11;
    id location = fRef;
    sub_10006AE58((const void **)&location);
    objc_initWeak(&location, v2);
    objc_copyWeak(&v24, &location);
    _CTServerConnectionRegisterBlockForNotification();
    _CTServerConnectionGetRadioState();
    uint64_t v13 = +[NSNumber numberWithInt:5];
    radioState = v2->_radioState;
    v2->_radioState = (NSNumber *)v13;

    id v15 = objc_alloc((Class)NSMutableArray);
    unsigned __int8 v16 = +[NSString stringWithUTF8String:"NotSet"];
    v27[0] = v16;
    id v17 = +[NSString stringWithUTF8String:"NotSet"];
    v27[1] = v17;
    id v18 = +[NSArray arrayWithObjects:v27 count:2];
    int v19 = (NSMutableArray *)[v15 initWithArray:v18];
    currentRadioAccessTechnology = v2->_currentRadioAccessTechnology;
    v2->_currentRadioAccessTechnology = v19;

    long long v21 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:&off_1001C4078];
    currentSatelliteStatus = v2->_currentSatelliteStatus;
    v2->_currentSatelliteStatus = v21;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient) {
    [(CoreTelephonyClient *)coreTelephonyClient setDelegate:0];
  }
  if (self->_ctServerConnection.fRef) {
    _CTServerConnectionUnregisterForAllNotifications();
  }
  [(NSMutableSet *)self->_delegates removeAllObjects];
  v4.receiver = self;
  v4.super_class = (Class)TelephonyStateRelay;
  [(TelephonyStateRelay *)&v4 dealloc];
}

- (void)addTelephonyStateDelegate:(id)a3 withQueue:(dispatch_queue_s *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (a4)
    {
      telephonyClientQueue = self->_telephonyClientQueue;
      if (telephonyClientQueue)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100068B24;
        block[3] = &unk_1001B62E0;
        uint64_t v11 = self;
        v12 = a4;
        id v10 = v6;
        dispatch_async(telephonyClientQueue, block);
      }
    }
  }
}

- (void)removeTelephonyStateDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    telephonyClientQueue = self->_telephonyClientQueue;
    if (telephonyClientQueue)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100068C54;
      v7[3] = &unk_1001B7948;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(telephonyClientQueue, v7);
    }
  }
}

- (id)getTelephonyClientInstance
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
  {
    v3 = coreTelephonyClient;
  }
  else
  {
    v3 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:self->_telephonyClientQueue];
    [(CoreTelephonyClient *)v3 setDelegate:self];
  }

  return v3;
}

- (void)registerAirplaneModeCallbacks
{
  CFStringRef name = CFStringCreateWithCString(kCFAllocatorDefault, "com.apple.wirelessinsightsd.TelephonyStateRelayPrefs", 0x600u);
  if (name) {
    v3 = sub_100069050;
  }
  else {
    v3 = 0;
  }
  if (v3)
  {
    CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, "com.apple.radios.plist", 0x600u);
    CFStringRef v16 = v4;
    if (v4) {
      uint64_t v5 = sub_100069050;
    }
    else {
      uint64_t v5 = 0;
    }
    if (v5)
    {
      id v6 = SCPreferencesCreate(kCFAllocatorDefault, name, v4);
      fRef = self->_airplaneModePrefs.fRef;
      self->_airplaneModePrefs.fRef = v6;
      context.version = (CFIndex)fRef;
      sub_10006AE8C((const void **)&context);
      id v8 = self->_airplaneModePrefs.fRef;
      if (v8) {
        uint64_t v9 = sub_100069058;
      }
      else {
        uint64_t v9 = 0;
      }
      if (v9)
      {
        context.version = 0;
        context.info = self;
        memset(&context.retain, 0, 24);
        if (SCPreferencesSetCallback(v8, (SCPreferencesCallBack)sub_100069060, &context))
        {
          if (!SCPreferencesSetDispatchQueue(self->_airplaneModePrefs.fRef, (dispatch_queue_t)self->_telephonyClientQueue)&& os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
          {
            sub_100144F60();
          }
        }
        else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          sub_100144F2C();
        }
        id v14 = 0;
        BOOL v10 = [(TelephonyStateRelay *)self getAirplaneModeActive:&v14];
        id v11 = v14;
        self->_airplaneModeActive = v10;
        if (v11)
        {
          v12 = *(NSObject **)(qword_1001D8080 + 48);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [v11 localizedDescription];
            *(_DWORD *)buf = 138412290;
            int v19 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TelephonyStateRelay:#N Unable to fetch airplane mode status: %@", buf, 0xCu);
          }
          self->_airplaneModeActive = 0;
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
      {
        sub_100144EF8();
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      sub_100144EC4();
    }
    sub_10005AC84((const void **)&v16);
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
  {
    sub_100144E90();
  }
  sub_10005AC84((const void **)&name);
}

- (BOOL)getAirplaneModeActive:(id *)a3
{
  if (self->_airplaneModePrefs.fRef) {
    CFStringRef v4 = sub_100069058;
  }
  else {
    CFStringRef v4 = 0;
  }
  if (v4)
  {
    CFStringRef key = CFStringCreateWithCString(kCFAllocatorDefault, "AirplaneMode", 0x600u);
    if (key) {
      id v6 = sub_100069050;
    }
    else {
      id v6 = 0;
    }
    if (v6)
    {
      SCPreferencesSynchronize(self->_airplaneModePrefs.fRef);
      SCPreferencesLock(self->_airplaneModePrefs.fRef, 1u);
      Value = (void *)SCPreferencesGetValue(self->_airplaneModePrefs.fRef, key);
      SCPreferencesUnlock(self->_airplaneModePrefs.fRef);
      if (Value)
      {
        CFTypeID v8 = CFGetTypeID(Value);
        if (v8 == CFBooleanGetTypeID())
        {
          unsigned __int8 v9 = [Value BOOLValue];

LABEL_18:
          sub_10005AC84((const void **)&key);
          return v9;
        }
        CFRelease(Value);
        CFStringRef v10 = @"Returned value for airplane mode status is of unexpected type";
      }
      else
      {
        CFStringRef v10 = @"Could not retrieve airplane mode preference";
      }
      +[TelephonyStateRelay setError:a3 code:0 message:v10];
    }
    else
    {
      +[TelephonyStateRelay setError:a3 code:0 message:@"Could not allocate preference name"];
    }
    unsigned __int8 v9 = 0;
    goto LABEL_18;
  }
  +[TelephonyStateRelay setError:a3 code:0 message:@"Airplane mode preferences not set, cannot fetch status"];
  return 0;
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
}

- (void)plmnChanged:(id)a3 plmn:(id)a4
{
}

- (void)currentDataSimChanged:(id)a3
{
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(TelephonyStateRelay *)self handleDisplayStatusChanged:v7 displayStatus:v6];
  [(TelephonyStateRelay *)self handleRegistrationStatusChanged:v7];
  -[TelephonyStateRelay handleSatelliteRegistrationStatusForContext:changedTo:](self, "handleSatelliteRegistrationStatusForContext:changedTo:", v7, [v6 isSatelliteSystem]);
}

- (void)lowDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
}

- (void)interfaceCostExpensiveChanged:(id)a3 isExpensive:(BOOL)a4
{
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    CFTypeID v8 = [v6 uuid];
    sub_100144FFC(v8, (uint64_t)v7, (uint64_t)&v11);
  }
  unsigned __int8 v9 = [v7 valueForKey:kCTCapabilitySatellite];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CFStringRef v10 = [v9 valueForKey:kCTCapabilityStatus];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [(TelephonyStateRelay *)self handleSatelliteCapabilityChanged:v6 info:v10];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      sub_100144FC8();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    sub_100144F94();
  }
}

- (void)subscriptionInfoDidChange
{
  self->_isMultiSim = [(TelephonyStateRelay *)self isMultiSim];

  [(TelephonyStateRelay *)self handleSubscriptionInfoChanged];
}

- (void)stateChanged:(id)a3
{
}

- (void)ctServerRadioStateChangedNotification:(__CFDictionary *)a3
{
  if (a3)
  {
    CFStringRef v4 = CFDictionaryGetValue(a3, kCTRadioStateKey);
    if (v4)
    {
      if (![(NSNumber *)self->_radioState isEqualToNumber:v4])
      {
        objc_storeStrong((id *)&self->_radioState, v4);
        [(TelephonyStateRelay *)self handleRadioStateChangedTo:v4];
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      sub_100145088();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    sub_100145054();
  }
}

- (id)getCTSubscriptionInfoWithError:(id *)a3
{
  return [(CoreTelephonyClient *)self->_coreTelephonyClient getSubscriptionInfoWithError:a3];
}

- (id)getCTCurrentDataSubscriptionContextSync:(id *)a3
{
  return [(CoreTelephonyClient *)self->_coreTelephonyClient getCurrentDataSubscriptionContextSync:a3];
}

- (id)getCTSignalStrengthInfo:(id)a3 error:(id *)a4
{
  CFStringRef v4 = [(CoreTelephonyClient *)self->_coreTelephonyClient getSignalStrengthInfo:a3 error:a4];

  return v4;
}

- (id)copyCTRegistrationDisplayStatus:(id)a3 error:(id *)a4
{
  return [(CoreTelephonyClient *)self->_coreTelephonyClient copyRegistrationDisplayStatus:a3 error:a4];
}

- (id)copyCTRegistrationStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TelephonyStateRelay *)self coreTelephonyClient];
  id v8 = [v7 copyRegistrationStatus:v6 error:a4];

  return v8;
}

- (BOOL)getLowDataMode:(id)a3 error:(id *)a4
{
  id v6 = +[CTServiceDescriptor descriptorWithSubscriptionContext:a3];
  LOBYTE(a4) = [(CoreTelephonyClient *)self->_coreTelephonyClient lowDataMode:v6 error:a4];

  return (char)a4;
}

- (BOOL)getInterfaceCostExpensive:(id)a3 error:(id *)a4
{
  id v6 = +[CTServiceDescriptor descriptorWithSubscriptionContext:a3];
  LOBYTE(a4) = [(CoreTelephonyClient *)self->_coreTelephonyClient interfaceCostExpensive:v6 error:a4];

  return (char)a4;
}

- (id)getStewieState
{
  return [(CTStewieStateMonitor *)self->_stewieStateMonitor getState];
}

- (void)getRadioStateForDelegate:(id)a3
{
  id v4 = a3;
  telephonyClientQueue = self->_telephonyClientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000697E8;
  v7[3] = &unk_1001B7948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(telephonyClientQueue, v7);
}

- (void)getRadioAccessTechnology:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  telephonyClientQueue = self->_telephonyClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069A0C;
  block[3] = &unk_1001B6698;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(telephonyClientQueue, block);
}

- (void)getSatelliteRegistrationStatus:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  telephonyClientQueue = self->_telephonyClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069CC8;
  block[3] = &unk_1001B6698;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(telephonyClientQueue, block);
}

- (void)getAirplaneModeStatus:(id)a3
{
  id v4 = a3;
  telephonyClientQueue = self->_telephonyClientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100069F20;
  v7[3] = &unk_1001B7948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(telephonyClientQueue, v7);
}

- (BOOL)getIsSatelliteProvisioned:(id)a3 error:(id *)a4
{
  BOOL v6 = 0;
  *a4 = [(CoreTelephonyClient *)self->_coreTelephonyClient context:a3 getCapability:kCTCapabilitySatellite status:&v6 with:0];
  return v6;
}

- (id)getHomeCarrierMCC:(id)a3 error:(id *)a4
{
  id v4 = [(CoreTelephonyClient *)self->_coreTelephonyClient copyMobileSubscriberCountryCode:a3 error:a4];

  return v4;
}

- (id)getHomeCarrierMNC:(id)a3 error:(id *)a4
{
  id v4 = [(CoreTelephonyClient *)self->_coreTelephonyClient copyMobileSubscriberNetworkCode:a3 error:a4];

  return v4;
}

- (void)handleCurrentDataSimChanged:(id)a3
{
}

- (void)handleSubscriptionInfoChanged
{
}

- (void)handleDataStatusChanged:(id)a3 dataStatus:(id)a4
{
}

- (void)handleDisplayStatusChanged:(id)a3 displayStatus:(id)a4
{
}

- (void)handleRegistrationStatusChanged:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(TelephonyStateRelay *)self coreTelephonyClient];
    id v18 = 0;
    id v6 = [v5 copyRegistrationStatus:v4 error:&v18];
    id v7 = v18;

    id v8 = *(NSObject **)(qword_1001D8080 + 48);
    if (v7 || !v6)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
      {
        id v10 = [v7 localizedDescription];
        sub_1001450F0(v10, (uint64_t)buf, v8);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v4 uuid];
      BOOL isMultiSim = self->_isMultiSim;
      *(_DWORD *)buf = 138412802;
      long long v20 = v11;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 1024;
      BOOL v24 = isMultiSim;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "TelephonyStateRelay:#D Registration status change for context %@: %@, _isMultiSim: %{BOOL}d", buf, 0x1Cu);
    }
    if (+[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:v6])
    {
      if (self->_isMultiSim)
      {
        tuCallCenter = self->_tuCallCenter;
        uint64_t v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        id v15 = sub_10006A410;
        CFStringRef v16 = &unk_1001B7B50;
        id v17 = v4;
        if ([(TUCallCenter *)tuCallCenter anyCallPassesTest:&v13])
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
            sub_1001450BC();
          }

          goto LABEL_17;
        }
      }
      -[TelephonyStateRelay handleContextUpdated:forKey:withState:](self, "handleContextUpdated:forKey:withState:", v4, 8, v6, v13, v14, v15, v16);
    }
    else
    {
      [(TelephonyStateRelay *)self handleContextUpdated:v4 forKey:8 withState:v6];
    }
LABEL_17:
  }
}

- (void)handleSignalStrengthChanged:(id)a3 info:(id)a4
{
}

- (void)handlePlmnChanged:(id)a3 plmn:(id)a4
{
  id v7 = a4;
  id v6 = +[CTXPCServiceSubscriptionContext contextWithServiceDescriptor:a3];
  [(TelephonyStateRelay *)self handleContextUpdated:v6 forKey:2 withState:v7];
}

- (void)handleSatelliteRegistrationStatusForContext:(id)a3 changedTo:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  id v6 = +[NSNumber numberWithBool:v4];
  id v7 = [v14 slotID];
  if (v7 == (id)1)
  {
    p_currentSatelliteStatus = &self->_currentSatelliteStatus;
    id v12 = [(NSMutableArray *)self->_currentSatelliteStatus objectAtIndexedSubscript:0];
    unsigned int v13 = [v12 BOOLValue];

    if (v13 == v4) {
      goto LABEL_9;
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  if (v7 == (id)2)
  {
    p_currentSatelliteStatus = &self->_currentSatelliteStatus;
    id v9 = [(NSMutableArray *)self->_currentSatelliteStatus objectAtIndexedSubscript:1];
    unsigned int v10 = [v9 BOOLValue];

    if (v10 == v4) {
      goto LABEL_9;
    }
    uint64_t v11 = 1;
LABEL_7:
    [(NSMutableArray *)*p_currentSatelliteStatus setObject:v6 atIndexedSubscript:v11];
  }
  [(TelephonyStateRelay *)self handleContextUpdated:v14 forKey:13 withState:v6];
LABEL_9:
}

- (void)handleLowDataModeChanged:(id)a3 info:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = +[NSNumber numberWithBool:v4];
  [(TelephonyStateRelay *)self handleContextUpdated:v7 forKey:10 withState:v6];
}

- (void)handleInterfaceCostExpensiveChanged:(id)a3 info:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = +[NSNumber numberWithBool:v4];
  [(TelephonyStateRelay *)self handleContextUpdated:v7 forKey:11 withState:v6];
}

- (void)handleStewieStateChanged:(id)a3
{
}

- (void)airplaneModeStatusChanged
{
  id v8 = 0;
  BOOL v3 = [(TelephonyStateRelay *)self getAirplaneModeActive:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v4 localizedDescription];
      sub_10014519C(v6, (uint64_t)v9, v5);
    }
  }
  else if (self->_airplaneModeActive != v3)
  {
    self->_airplaneModeActive = v3;
    id v7 = +[NSNumber numberWithBool:v3];
    [(TelephonyStateRelay *)self handleContextUpdated:0 forKey:7 withState:v7];
  }
}

- (void)handleRadioStateChangedTo:(id)a3
{
}

- (void)handleSatelliteCapabilityChanged:(id)a3 info:(id)a4
{
}

- (BOOL)isMultiSim
{
  if (!self->_coreTelephonyClient) {
    return 0;
  }
  v2 = [(TelephonyStateRelay *)self coreTelephonyClient];
  id v11 = 0;
  BOOL v3 = [v2 getSubscriptionInfoWithError:&v11];
  id v4 = v11;

  if (v4 || !v3)
  {
    id v8 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v4 localizedDescription];
      sub_10014521C(v9, (uint64_t)v12, v8);
    }
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v5 = [v3 subscriptionsInUse];
    if (v5)
    {
      id v6 = +[WISTelephonyUtils sanitizedSubscriptions:v5];
      BOOL v7 = (unint64_t)[v6 count] > 1;
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
        sub_1001451E8();
      }
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (id)findDelegateEntryByDelegate:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_delegates;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "matchesDelegate:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5
{
  id v9 = a5;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  [v7 setValue:v9 forKey:NSLocalizedDescriptionKey];
  id v8 = +[NSString stringWithUTF8String:"TelephonyStateRelay"];
  *a3 = +[NSError errorWithDomain:v8 code:a4 userInfo:v7];
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_radioState, 0);
  sub_10006AE58((const void **)&self->_ctServerConnection.fRef);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_currentSatelliteStatus, 0);
  objc_storeStrong((id *)&self->_currentRadioAccessTechnology, 0);
  sub_10006AE8C((const void **)&self->_airplaneModePrefs.fRef);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end