@interface AAContextManager
+ (id)sharedContextManager;
- (AAContextManager)init;
- (BOOL)_getBoolPreferencesForKey:(id)a3;
- (unsigned)_generateContextChangedFlags:(BOOL)a3 spl:(BOOL)a4;
- (void)_contextSignalUpdated:(id)a3 withFusedState:(unsigned int)a4;
- (void)_ensureStartedContextMonitorWithCompletion:(id)a3;
- (void)_notifyTips:(int)a3;
- (void)_requestSensingPredictionInfo:(BOOL)a3 spl:(BOOL)a4;
- (void)_setConcertVenueAirPodsInEarTipShown;
- (void)_setConcertVenueAirPodsNearybyTipShown;
- (void)_setPreferencesForKey:(id)a3 withBoolValue:(BOOL)a4;
- (void)_wxDeviceFound:(id)a3;
- (void)_wxDeviceLost:(id)a3;
- (void)_wxDiscoveryEnsureStarted;
- (void)activate;
- (void)invalidate;
@end

@implementation AAContextManager

+ (id)sharedContextManager
{
  if (qword_100263EA8 != -1) {
    dispatch_once(&qword_100263EA8, &stru_1002344C8);
  }
  v2 = (void *)qword_100263EA0;

  return v2;
}

- (AAContextManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAContextManager;
  v2 = [(AAContextManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AAContextManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_concertVenueAirPodsInEarTipShown = [(AAContextManager *)v2 _getBoolPreferencesForKey:@"ConcertVenueAirPodsInEarTipShown"];
    v2->_concertVenueAirPodsNearybyTipShown = [(AAContextManager *)v2 _getBoolPreferencesForKey:@"ConcertVenueAirPodsNearbyTipShown"];
    v6 = v2;
  }

  return v2;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059700;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)activate
{
  if (self->_concertVenueAirPodsNearybyTipShown)
  {
    if (dword_100261128 <= 30 && (dword_100261128 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    [(AAContextManager *)self _wxDiscoveryEnsureStarted];
  }
}

- (void)_wxDiscoveryEnsureStarted
{
  if (dword_100261128 <= 30 && (dword_100261128 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  wxDiscovery = self->_wxDiscovery;
  self->_wxDiscovery = v3;
  v5 = v3;

  [(SFDeviceDiscovery *)v5 setChangeFlags:9];
  [(SFDeviceDiscovery *)v5 setDiscoveryFlags:2];
  [(SFDeviceDiscovery *)v5 setDispatchQueue:self->_dispatchQueue];
  [(SFDeviceDiscovery *)v5 setPurpose:@"AAContextManger"];
  [(SFDeviceDiscovery *)v5 setScanRate:20];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100059A7C;
  v10[3] = &unk_100233888;
  v10[4] = self;
  v10[5] = v5;
  [(SFDeviceDiscovery *)v5 setDeviceFoundHandler:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100059AA0;
  v9[3] = &unk_100233888;
  v9[4] = self;
  v9[5] = v5;
  [(SFDeviceDiscovery *)v5 setDeviceLostHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100059AC4;
  v8[3] = &unk_1002338B0;
  v8[4] = self;
  v8[5] = v5;
  [(SFDeviceDiscovery *)v5 setDeviceChangedHandler:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059AE8;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  v7[5] = v5;
  [(SFDeviceDiscovery *)v5 setInvalidationHandler:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100059B04;
  v6[3] = &unk_100232A38;
  v6[4] = self;
  v6[5] = v5;
  [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
}

- (void)_wxDeviceLost:(id)a3
{
  id v18 = a3;
  dispatch_queue_t v4 = [v18 identifier];
  v5 = [v4 UUIDString];

  if (v5)
  {
    v6 = [v18 bleDevice];
    v7 = [v6 advertisementFields];
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();

    v9 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v5];

    if (v9)
    {
      if (dword_100261128 <= 30 && (dword_100261128 != -1 || _LogCategory_Initialize()))
      {
        v10 = [v18 bleDevice];
        uint64_t v11 = [v10 name];
        v12 = (void *)v11;
        CFStringRef v13 = &stru_10023D730;
        if (v11) {
          CFStringRef v13 = (const __CFString *)v11;
        }
        CFStringRef v16 = v13;
        LogPrintF();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", 0, v5, v5, v16, Int64Ranged);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", 0, v5, v14, v15, v17);
      }
    }
  }
}

- (void)_wxDeviceFound:(id)a3
{
  id v20 = a3;
  dispatch_queue_t v4 = [v20 identifier];
  v5 = [v4 UUIDString];

  if (v5)
  {
    v6 = [v20 bleDevice];
    v7 = [v6 advertisementFields];
    uint64_t Int64 = CFDictionaryGetInt64();
    unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
    if (Int64)
    {
      unsigned __int8 v10 = Int64Ranged;
      uint64_t v11 = CFDictionaryGetInt64Ranged();
      v12 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v5];

      id v13 = v20;
      if (!v12)
      {
        if (dword_100261128 <= 30)
        {
          if (dword_100261128 != -1 || (v14 = _LogCategory_Initialize(), id v13 = v20, v14))
          {
            uint64_t v17 = v5;
            uint64_t v18 = v11;
            uint64_t v19 = v10;
            LogPrintF();
            id v13 = v20;
          }
        }
        if (!self->_wxDevices)
        {
          uint64_t v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          wxDevices = self->_wxDevices;
          self->_wxDevices = v15;

          id v13 = v20;
        }
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", v13, v5, v17, v18, v19);
      if (v10 == 6 && !self->_concertVenueAirPodsNearybyTipShown) {
        [(AAContextManager *)self _requestSensingPredictionInfo:1 spl:0];
      }
    }
  }
}

- (void)_ensureStartedContextMonitorWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SPContextMonitor);
  [(SPContextMonitor *)self->_contextMonitor invalidate];
  contextMonitor = self->_contextMonitor;
  self->_contextMonitor = 0;

  objc_storeStrong((id *)&self->_contextMonitor, v5);
  [v5 setInterruptionHandler:&stru_1002344E8];
  [v5 setInvalidationHandler:&stru_100234508];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005A198;
  v10[3] = &unk_100234530;
  v10[4] = self;
  [v5 setContextSignalUpdatedHandler:v10];
  if (dword_100261128 <= 30 && (dword_100261128 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005A26C;
  v8[3] = &unk_100234558;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 activateWithCompletion:v8];
}

- (void)_requestSensingPredictionInfo:(BOOL)a3 spl:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = self->_contextMonitor;
  if (v7)
  {
    [(SPContextMonitor *)v7 setContextChangeFlags:[(AAContextManager *)self _generateContextChangedFlags:v5 spl:v4]];
  }
  else
  {
    if (dword_100261128 <= 30 && (dword_100261128 != -1 || _LogCategory_Initialize()))
    {
      BOOL v8 = v5;
      BOOL v9 = v4;
      LogPrintF();
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005A4E4;
    v10[3] = &unk_100234580;
    id v11 = 0;
    v12 = self;
    BOOL v13 = v5;
    BOOL v14 = v4;
    -[AAContextManager _ensureStartedContextMonitorWithCompletion:](self, "_ensureStartedContextMonitorWithCompletion:", v10, v8, v9);
  }
}

- (void)_contextSignalUpdated:(id)a3 withFusedState:(unsigned int)a4
{
  id v6 = a3;
  if (a4 != 2)
  {
    if (a4 != 1) {
      goto LABEL_11;
    }
    id v9 = v6;
    BOOL v7 = [v6 locationCategory] == 6;
    id v6 = v9;
    if (!v7) {
      goto LABEL_11;
    }
    [(AAContextManager *)self _notifyTips:1];
    [(AAContextManager *)self _setConcertVenueAirPodsNearybyTipShown];
LABEL_10:
    [(AAContextManager *)self invalidate];
    id v6 = v9;
    goto LABEL_11;
  }
  id v9 = v6;
  unsigned int v8 = [v6 noiseLevel];
  BOOL v7 = [v9 locationCategory] == 6;
  id v6 = v9;
  if (v7 && v8 == 6)
  {
    [(AAContextManager *)self _notifyTips:2];
    [(AAContextManager *)self _setConcertVenueAirPodsInEarTipShown];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_setConcertVenueAirPodsNearybyTipShown
{
  self->_concertVenueAirPodsNearybyTipShown = 1;
  [(AAContextManager *)self _setPreferencesForKey:@"ConcertVenueAirPodsNearbyTipShown" withBoolValue:1];
}

- (void)_setConcertVenueAirPodsInEarTipShown
{
  self->_concertVenueAirPodsInEarTipShown = 1;
  [(AAContextManager *)self _setPreferencesForKey:@"ConcertVenueAirPodsInEarTipShown" withBoolValue:1];
}

- (void)_setPreferencesForKey:(id)a3 withBoolValue:(BOOL)a4
{
  BOOL v4 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a4) {
    BOOL v4 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue((CFStringRef)a3, *v4, @"com.apple.AudioAccessory");

  CFPreferencesAppSynchronize(@"com.apple.AudioAccessory");
}

- (BOOL)_getBoolPreferencesForKey:(id)a3
{
  v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(@"com.apple.AudioAccessory");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.AudioAccessory", 0);

  return AppBooleanValue != 0;
}

- (unsigned)_generateContextChangedFlags:(BOOL)a3 spl:(BOOL)a4
{
  if (a4) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  return v4 | a3;
}

- (void)_notifyTips:(int)a3
{
  if (dword_100261128 <= 30 && (dword_100261128 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v3 = BiomeLibrary();
  int v4 = [v3 Discoverability];
  id v7 = [v4 Signals];

  id v5 = [objc_alloc((Class)BMDiscoverabilitySignals) initWithContentIdentifier:@"com.apple.AudioAccessoryServices.user-reach-loud-environment" context:0 osBuild:0 userInfo:0];
  id v6 = [v7 source];
  [v6 sendEvent:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wxDiscovery, 0);
  objc_storeStrong((id *)&self->_wxDevices, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_contextMonitor, 0);
}

@end