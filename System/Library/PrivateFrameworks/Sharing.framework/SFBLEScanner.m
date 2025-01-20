@interface SFBLEScanner
- (BOOL)_btSessionUsable;
- (BOOL)_needActiveScan;
- (BOOL)_needDups;
- (BOOL)_updateCounterpart:(id)a3;
- (BOOL)_watchSetupParseData:(id)a3 fields:(id)a4;
- (BOOL)pairingUpdatePairedInfo:(id)a3 fields:(id)a4 bleDevice:(id)a5;
- (BOOL)pairingUpdatePairedInfoMB:(id)a3 fields:(id)a4 bleDevice:(id)a5;
- (BOOL)rssiLog;
- (BOOL)rssiLogStdOut;
- (BOOL)scanCache;
- (NSArray)deviceFilter;
- (NSData)payloadFilterData;
- (NSData)payloadFilterMask;
- (NSSet)trackedPeers;
- (NSSet)useCases;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SFBLERecorder)recorder;
- (SFBLEScanner)initWithType:(int64_t)a3;
- (double)rescanInterval;
- (double)timeout;
- (id)_useCasesToString:(id)a3;
- (id)bluetoothStateChangedHandler;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (id)modelWithProductID:(unsigned __int16)a3;
- (id)pairingParsePayload:(id)a3 identifier:(id)a4 bleDevice:(id)a5 peerInfo:(id)a6;
- (id)scanStateChangedHandler;
- (id)timeoutHandler;
- (int)_btSessionEnsureStarted;
- (int64_t)rescanIntervalScreenOff;
- (int64_t)rssiThreshold;
- (int64_t)scanInterval;
- (int64_t)scanRate;
- (int64_t)scanState;
- (int64_t)scanWindow;
- (unsigned)changeFlags;
- (unsigned)statusToHeadsetStatus:(unsigned __int8)a3 forProductID:(unsigned __int16)a4;
- (void)_activateWithCompletion:(id)a3;
- (void)_btSessionEnsureStopped;
- (void)_foundDevice:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 fields:(id)a6;
- (void)_invalidate;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_nearbyParseManufacturerData:(id)a3 fields:(id)a4;
- (void)_nearbyParseNearbyActionPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5;
- (void)_nearbyParseNearbyInfoPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5;
- (void)_poweredOff;
- (void)_poweredOn;
- (void)_recordDevice:(id)a3 data:(id)a4 rssi:(id)a5 info:(id)a6;
- (void)_removeAllDevicesWithReason:(id)a3;
- (void)_rescanLostFired;
- (void)_rescanTimerFired;
- (void)_restartIfNeeded;
- (void)_restartIfNeeded:(BOOL)a3;
- (void)_rssiLogClose;
- (void)_rssiLogOpen;
- (void)_startTimeoutIfNeeded;
- (void)_timeoutTimerFired;
- (void)_updateRescanTimer;
- (void)_updateTrackedPeers;
- (void)_watchSetupParseName:(id)a3 fields:(id)a4;
- (void)activateWithCompletion:(id)a3;
- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5;
- (void)awdlDidUpdateState:(id)a3;
- (void)awdlStartedScanning:(id)a3;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)foundAWDLDevice:(id)a3 rssi:(id)a4;
- (void)foundNearbyDevice:(id)a3 data:(id)a4 peerInfo:(id)a5;
- (void)foundPairingDevice:(id)a3 payload:(id)a4 rssi:(id)a5 peerInfo:(id)a6 withTimeInMachContSeconds:(double)a7;
- (void)foundPeripheralDevice:(id)a3 advertisementData:(id)a4 RSSI:(id)a5;
- (void)invalidate;
- (void)nearby:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7;
- (void)nearby:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)nearby:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5;
- (void)nearby:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)nearbyDidUpdateState:(id)a3;
- (void)pairing:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)pairing:(id)a3 foundDevice:(id)a4 payload:(id)a5 rssi:(id)a6 peerInfo:(id)a7;
- (void)pairingDidUpdateState:(id)a3;
- (void)pairingParseAccessoryStatusPayloadPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5;
- (void)pairingStartedScanning:(id)a3;
- (void)parseStatus3:(unsigned __int8)a3 productID:(unsigned int)a4 caseLEDColor:(unsigned __int8 *)a5 caseLEDStatus:(char *)a6;
- (void)performUpdate:(id)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPayloadFilterData:(id)a3 mask:(id)a4;
- (void)setRecorder:(id)a3;
- (void)setRescanInterval:(double)a3;
- (void)setRescanIntervalScreenOff:(int64_t)a3;
- (void)setRssiLog:(BOOL)a3;
- (void)setRssiLogStdOut:(BOOL)a3;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setScanCache:(BOOL)a3;
- (void)setScanInterval:(int64_t)a3;
- (void)setScanRate:(int64_t)a3;
- (void)setScanStateChangedHandler:(id)a3;
- (void)setScanWindow:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setTrackedPeers:(id)a3;
- (void)setUseCases:(id)a3;
@end

@implementation SFBLEScanner

- (int64_t)rescanIntervalScreenOff
{
  return self->_rescanIntervalScreenOff;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)_restartIfNeeded
{
}

- (NSSet)useCases
{
  return self->_useCases;
}

- (NSSet)trackedPeers
{
  return self->_trackedPeers;
}

- (int64_t)scanRate
{
  return self->_scanRate;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (NSData)payloadFilterData
{
  return self->_payloadFilterData;
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

uint64_t __30__SFBLEScanner_performUpdate___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 152) = 1;
  return result;
}

unsigned char *__30__SFBLEScanner_performUpdate___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 0;
  result = *(unsigned char **)(a1 + 32);
  if (result[9])
  {
    if (!result[48]) {
      return (unsigned char *)[result _restartIfNeeded];
    }
  }
  return result;
}

- (SFBLEScanner)initWithType:(int64_t)a3
{
  v11 = 0;
  int v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SFBLEScanner;
  v4 = [(SFBLEScanner *)&v9 init];
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = SFMainQueue();
  dispatchQueue = v4->_dispatchQueue;
  v4->_dispatchQueue = (OS_dispatch_queue *)v5;

  v4->_payloadType = a3;
  v4->_rescanInterval = 10.0;
  v4->_rescanIntervalScreenOff = -1;
  v4->_scanRate = 20;
  ASPrintF();
  if (v11)
  {
    v4->_ucat = (LogCategory *)LogCategoryCreateEx();
    free(v11);
    v7 = 0;
    if (!v10) {
      v7 = v4;
    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)nearby:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v17 = a5;
  id v12 = a6;
  id v13 = a7;
  dispatchQueue = self->_dispatchQueue;
  v15 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby && wpNearby == v15 && self->_wpNearbyType == a4)
  {
    [(SFBLEScanner *)self _recordDevice:v12 data:v17 rssi:0 info:v13];
    [(SFBLEScanner *)self foundNearbyDevice:v12 data:v17 peerInfo:v13];
  }
}

- (void)_recordDevice:(id)a3 data:(id)a4 rssi:(id)a5 info:(id)a6
{
  recorder = self->_recorder;
  if (recorder)
  {
    id v11 = 0;
    BOOL v8 = [(SFBLERecorder *)recorder recordDevice:a3 data:a4 rssi:a5 info:a6 error:&v11];
    id v9 = v11;
    if (!v8)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)nearby:(id)a3 didStartScanningForType:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v7 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v9 = wpNearby == v7;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9 && self->_wpNearbyType == a4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_scanState != 1)
    {
      self->_scanState = 1;
      scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
      if (scanStateChangedHandler) {
        scanStateChangedHandler[2](scanStateChangedHandler, 1);
      }
    }
    [(SFBLEScanner *)self _startTimeoutIfNeeded];
  }
}

- (void)_startTimeoutIfNeeded
{
  if (!self->_timeoutFired && self->_timeout > 0.0 && !self->_timeoutTimer)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_6;
    }
    while (1)
    {
      v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      timeoutTimer = self->_timeoutTimer;
      self->_timeoutTimer = v4;

      v6 = self->_timeoutTimer;
      if (v6) {
        break;
      }
      FatalErrorF();
LABEL_6:
      LogPrintF();
    }
    unint64_t v7 = (unint64_t)(self->_timeout * 1000000000.0);
    dispatch_time_t v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(v6, v8, v7, v7 >> 2);
    BOOL v9 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__SFBLEScanner__startTimeoutIfNeeded__block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SFBLEScanner_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCases, 0);
  objc_storeStrong((id *)&self->_trackedPeers, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_scanStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_payloadFilterMask, 0);
  objc_storeStrong((id *)&self->_payloadFilterData, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_wpPairing, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_wpAirDrop, 0);
  objc_storeStrong((id *)&self->_scanUseCases, 0);
  objc_storeStrong((id *)&self->_scanParamPeers, 0);
  objc_storeStrong((id *)&self->_scanParamFilterMask, 0);
  objc_storeStrong((id *)&self->_scanParamFilterData, 0);
  objc_storeStrong((id *)&self->_trackedPeersApplied, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
  objc_storeStrong((id *)&self->_rescanTimer, 0);
  objc_storeStrong((id *)&self->_lostTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_centralManager, 0);
}

- (void)performUpdate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SFBLEScanner_performUpdate___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  uint64_t v5 = (void (**)(void))a3;
  dispatch_async(dispatchQueue, block);
  v5[2](v5);

  v6 = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__SFBLEScanner_performUpdate___block_invoke_2;
  v7[3] = &unk_1E5BBC870;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)setUseCases:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__SFBLEScanner_setUseCases___block_invoke;
  v6[3] = &unk_1E5BBBD18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v6];
}

- (void)setChangeFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__SFBLEScanner_setChangeFlags___block_invoke;
  v3[3] = &unk_1E5BBEE88;
  v3[4] = self;
  unsigned int v4 = a3;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v3];
}

- (void)setRssiThreshold:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__SFBLEScanner_setRssiThreshold___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  void v3[5] = a3;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v3];
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__SFBLEScanner__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E5BBC9C8;
    v7[4] = v5;
    dispatch_time_t v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

uint64_t __33__SFBLEScanner_setRssiThreshold___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 360) = *(void *)(result + 40);
  return result;
}

uint64_t __31__SFBLEScanner_setChangeFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 260) = *(_DWORD *)(result + 40);
  return result;
}

void __28__SFBLEScanner_setUseCases___block_invoke(uint64_t a1)
{
}

- (void)foundNearbyDevice:(id)a3 data:(id)a4 peerInfo:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = getWPNearbyKeyRSSI[0]();
  id v12 = [v9 objectForKeyedSubscript:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = [v12 integerValue];
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = getWPNearbyKeyManufacturerData[0]();
  v15 = [v9 objectForKeyedSubscript:v14];

  if ([v15 length])
  {
    [v10 setObject:v15 forKeyedSubscript:@"mfrD"];
    [(SFBLEScanner *)self _nearbyParseManufacturerData:v15 fields:v10];
  }
  else
  {
    id v19 = v8;
    uint64_t v20 = [v19 bytes];
    uint64_t v21 = v20 + [v19 length];
    int64_t wpNearbyType = self->_wpNearbyType;
    if (wpNearbyType == 1)
    {
      [(SFBLEScanner *)self _nearbyParseNearbyInfoPtr:v20 end:v21 fields:v10];
    }
    else if (!wpNearbyType)
    {
      [(SFBLEScanner *)self _nearbyParseNearbyActionPtr:v20 end:v21 fields:v10];
    }
  }
  v16 = [v9 objectForKeyedSubscript:@"kDeviceChannel"];
  if (v16) {
    [v10 setObject:v16 forKeyedSubscript:@"ch"];
  }
  id v17 = getWPNearbyKeyDeviceAddress[0]();
  v18 = [v9 objectForKeyedSubscript:v17];

  if ([v18 length] == 6) {
    [v10 setObject:v18 forKeyedSubscript:@"bdAddr"];
  }
  getWPNearbyKeyPaired[0]();
  if (CFDictionaryGetInt64()) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"paired"];
  }
  [(SFBLEScanner *)self _foundDevice:v23 advertisementData:v8 rssi:v13 fields:v10];
}

- (void)_nearbyParseNearbyInfoPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  id v7 = a5;
  if (a4 - a3 >= 1)
  {
    char v9 = *a3++;
    char v8 = v9;
    id v10 = [NSNumber numberWithInt:v9 & 0xF];
    [v7 setObject:v10 forKeyedSubscript:@"al"];

    if ((v9 & 0x10) != 0)
    {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"meD"];
      if ((v8 & 0x20) == 0)
      {
LABEL_4:
        if ((v8 & 0x40) == 0) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    else if ((v8 & 0x20) == 0)
    {
      goto LABEL_4;
    }
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"rgC"];
    if ((v8 & 0x40) != 0) {
LABEL_5:
    }
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"adU"];
  }
LABEL_6:
  if (a4 - a3 < 1) {
    goto LABEL_30;
  }
  id v11 = (char *)(a3 + 1);
  char v12 = *a3;
  if (*a3 < 0)
  {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ue"];
    if ((v12 & 0x40) == 0)
    {
LABEL_9:
      if ((v12 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*a3 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"uw"];
  if ((v12 & 8) != 0) {
LABEL_10:
  }
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ds"];
LABEL_11:
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  if ((v12 & 0x20) != 0) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"wl"];
  }
  if ((v12 & 4) != 0) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = MEMORY[0x1E4F1CC28];
  }
  [v7 setObject:v14 forKeyedSubscript:@"wp"];
  int64_t v15 = a4 - v11;
  if ((v12 & 0x10) != 0 && v15 >= 3)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 1 length:3];
    [v7 setObject:v16 forKeyedSubscript:@"at"];

    id v11 = (char *)(a3 + 4);
    int64_t v15 = a4 - (a3 + 4);
  }
  if ((v12 & 2) != 0 && v15 >= 1)
  {
    char v17 = *v11++;
    char v24 = v17;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v24 length:1];
    [v7 setObject:v18 forKeyedSubscript:@"hsi"];

    int64_t v15 = a4 - v11;
  }
  if ((v12 & 1) == 0 || v15 < 1) {
    goto LABEL_30;
  }
  unsigned int v19 = *v11;
  if (*v11 < 0)
  {
    uint64_t v21 = [NSNumber numberWithUnsignedInt:2048];
    [v7 setObject:v21 forKeyedSubscript:@"df"];

    if ((v19 & 1) == 0)
    {
LABEL_26:
      if ((v19 & 2) == 0) {
        goto LABEL_27;
      }
      goto LABEL_39;
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_26;
  }
  v22 = [NSNumber numberWithUnsignedChar:1];
  [v7 setObject:v22 forKeyedSubscript:@"camS"];

  if ((v19 & 2) == 0)
  {
LABEL_27:
    if ((v19 & 4) == 0) {
      goto LABEL_28;
    }
LABEL_40:
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"iLagS"];
    if ((v19 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_39:
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enD"];
  if ((v19 & 4) != 0) {
    goto LABEL_40;
  }
LABEL_28:
  if ((v19 & 8) != 0)
  {
LABEL_29:
    char v23 = (v19 >> 4) & 7;
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v23 length:1];
    [v7 setObject:v20 forKeyedSubscript:@"ars"];
  }
LABEL_30:
}

- (void)_nearbyParseManufacturerData:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = v6;
  char v8 = (unsigned char *)[v15 bytes];
  uint64_t v9 = [v15 length];
  if (v9 >= 2 && *v8 == 76 && !v8[1] && (unint64_t)v9 >= 4)
  {
    id v11 = &v8[v9];
    char v12 = v8 + 2;
    do
    {
      uint64_t v13 = v12[1] & 0x1F;
      if (v11 - (v12 + 2) < v13) {
        break;
      }
      int v14 = *v12;
      v12 += v13 + 2;
      if (v14 == 16)
      {
        -[SFBLEScanner _nearbyParseNearbyInfoPtr:end:fields:](self, "_nearbyParseNearbyInfoPtr:end:fields:");
      }
      else if (v14 == 15)
      {
        -[SFBLEScanner _nearbyParseNearbyActionPtr:end:fields:](self, "_nearbyParseNearbyActionPtr:end:fields:");
      }
    }
    while (v11 - v12 > 1);
  }
}

uint64_t __40__SFBLEScanner__activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartIfNeeded];
}

- (void)setScanStateChangedHandler:(id)a3
{
}

- (void)setRescanIntervalScreenOff:(int64_t)a3
{
  self->_rescanIntervalScreenOff = a3;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (void)_foundDevice:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 fields:(id)a6
{
  id v10 = a3;
  id v81 = a4;
  id v11 = a6;
  if ((unint64_t)(a5 - 20) >= 0x6B) {
    int64_t v12 = a5;
  }
  else {
    int64_t v12 = a5 - 126;
  }
  if ((unint64_t)(v12 - 1) >= 0xFFFFFFFFFFFFFFA5) {
    int64_t v13 = v12;
  }
  else {
    int64_t v13 = 0;
  }
  if (v13 < 0 && (self->_rssiLogStdOut || self->_rssiEventLogFile))
  {
    int v85 = 0;
    __int16 v84 = 0;
    int v83 = 0;
    CFDictionaryGetHardwareAddress();
    int v14 = [v11 objectForKeyedSubscript:@"ch"];
    uint64_t v15 = [v14 integerValue];

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_rssiEventLogFile)
    {
      if (v16) {
        char v17 = v16;
      }
      else {
        char v17 = &stru_1EF9BDC68;
      }
      v72 = (SFBLEDevice *)v13;
      uint64_t v73 = v15;
      id v69 = v10;
      v71 = (const char *)&v83;
      id v74 = v81;
      v75 = v17;
      FPrintF();
    }
    if (self->_rssiLogStdOut)
    {
      if (v16) {
        v18 = v16;
      }
      else {
        v18 = &stru_1EF9BDC68;
      }
      id v74 = v81;
      v75 = v18;
      v72 = (SFBLEDevice *)v13;
      uint64_t v73 = v15;
      id v69 = v10;
      v71 = (const char *)&v83;
      FPrintF();
    }
  }
  if (v13) {
    BOOL v19 = !self->_needDups;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || (int64_t rssiThreshold = self->_rssiThreshold) == 0 || v13 >= rssiThreshold)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__SFBLEScanner__foundDevice_advertisementData_rssi_fields___block_invoke;
    aBlock[3] = &unk_1E5BBF380;
    aBlock[4] = self;
    v80 = (void (**)(void *, SFBLEDevice *))_Block_copy(aBlock);
    LOBYTE(v83) = 0;
    v22 = [(id)gSFNearbyAgent idsDeviceForBluetoothDeviceID:v10 conflictDetected:&v83];
    uint64_t v23 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v10];
    if (v23)
    {
      char v24 = (SFBLEDevice *)v23;
      if (v22)
      {
        uint64_t v25 = [v22 uniqueIDOverride];
        if (v25) {
          [v11 setObject:v25 forKeyedSubscript:@"idsID"];
        }
        v26 = objc_msgSend(NSNumber, "numberWithBool:", v83, v69, v71, v72, v73, v74, v75);
        [v11 setObject:v26 forKeyedSubscript:@"idsIDCD"];
      }
      else
      {
        uint64_t v25 = 0;
      }
      v38 = [(SFBLEDevice *)v24 advertisementFields];
      CFStringGetTypeID();
      v78 = CFDictionaryGetTypedValue();

      v77 = (void *)v25;
      if (v25) {
        uint64_t v25 = [v78 isEqual:v25] - 1;
      }
      CFStringGetTypeID();
      uint64_t v39 = CFDictionaryGetTypedValue();
      v40 = (void *)v39;
      if (v22)
      {
        if (!v39)
        {
          v40 = [v22 modelIdentifier];
          if (v40) {
            [v11 setObject:v40 forKeyedSubscript:@"model"];
          }
        }
      }
      v41 = [(SFBLEDevice *)v24 advertisementFields];
      CFStringGetTypeID();
      v42 = CFDictionaryGetTypedValue();

      v79 = v22;
      v76 = v42;
      if (v40)
      {
        if ([v42 isEqual:v40]) {
          uint64_t v25 = v25;
        }
        else {
          uint64_t v25 = v25 | 8;
        }
      }
      [(SFBLEDevice *)v24 setLastSeen:CFAbsoluteTimeGetCurrent()];
      v43 = [(SFBLEDevice *)v24 advertisementData];
      char v44 = [v43 isEqual:v81];

      if ((v44 & 1) == 0)
      {
        [(SFBLEDevice *)v24 setAdvertisementData:v81];
        uint64_t v25 = v25 | 1;
      }
      uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
      if ([(SFBLEDevice *)v24 connectedServices] != Int64Ranged)
      {
        [(SFBLEDevice *)v24 setConnectedServices:Int64Ranged];
        uint64_t v25 = v25 | 8;
      }
      if (v13)
      {
        [(SFBLEDevice *)v24 updateRSSI:v13];
        uint64_t v25 = v25 | 4;
      }
      uint64_t v46 = [(SFBLEDevice *)v24 bluetoothAddress];
      if (v46)
      {
        v47 = (void *)v46;
      }
      else
      {
        CFDataGetTypeID();
        v47 = CFDictionaryGetTypedValue();
        if (v47)
        {
          [(SFBLEDevice *)v24 setBluetoothAddress:v47];
          uint64_t v25 = v25 | 8;
        }
      }
      CFStringGetTypeID();
      uint64_t v48 = CFDictionaryGetTypedValue();
      v49 = (void *)v48;
      if (v79 && !v48)
      {
        v49 = [v79 name];
      }
      if (v49)
      {
        id v50 = v11;
        v51 = v47;
        id v52 = v10;
        v53 = [(SFBLEDevice *)v24 name];
        char v54 = [v53 isEqual:v49];

        if ((v54 & 1) == 0)
        {
          [(SFBLEDevice *)v24 setName:v49];
          uint64_t v25 = v25 | 8;
        }
        id v10 = v52;
        v47 = v51;
        id v11 = v50;
      }
      uint64_t Int64 = CFDictionaryGetInt64();
      if (v79) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"paired"];
      }
      if (![(SFBLEDevice *)v24 paired] || Int64)
      {
        if (![(SFBLEDevice *)v24 paired] && Int64)
        {
          [(SFBLEDevice *)v24 setPaired:1];
          uint64_t v25 = v25 | 8;
        }
      }
      else
      {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"paired"];
      }
      v56 = [(SFBLEDevice *)v24 counterpartIdentifier];
      if (v56)
      {

        if (!v11) {
          goto LABEL_95;
        }
      }
      else
      {
        if ([(SFBLEScanner *)self _updateCounterpart:v24]) {
          uint64_t v25 = v25 | 8;
        }
        else {
          uint64_t v25 = v25;
        }
        if (!v11) {
          goto LABEL_95;
        }
      }
      [(SFBLEDevice *)v24 setAdvertisementFields:v11];
LABEL_95:
      v80[2](v80, v24);
      unsigned int changeFlags = self->_changeFlags;
      int var0 = self->_ucat->var0;
      if (changeFlags == -1 || (changeFlags & v25) != 0)
      {
        if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v70 = v24;
          LogPrintF();
        }
        deviceChangedHandler = (void (**)(id, SFBLEDevice *, uint64_t))self->_deviceChangedHandler;
        if (deviceChangedHandler) {
          deviceChangedHandler[2](deviceChangedHandler, v24, v25);
        }
      }
      else if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v70 = v24;
        LogPrintF();
      }

      v22 = v79;
      v29 = v77;
      goto LABEL_123;
    }
    uint64_t v27 = CFDictionaryGetInt64();
    CFStringGetTypeID();
    uint64_t v28 = CFDictionaryGetTypedValue();
    v29 = (void *)v28;
    if (v22)
    {
      if (!v28)
      {
        v29 = [v22 name];
      }
      CFStringGetTypeID();
      v30 = CFDictionaryGetTypedValue();
      if (v30 || ([v22 modelIdentifier], (v30 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, @"model", v69, v71, v72, v73, v74, v75);
      }
      v31 = objc_msgSend(v22, "uniqueIDOverride", v69);
      if (v31) {
        [v11 setObject:v31 forKeyedSubscript:@"idsID"];
      }
      v32 = [NSNumber numberWithBool:v83];
      [v11 setObject:v32 forKeyedSubscript:@"idsIDCD"];

      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"paired"];
    }
    else
    {
      if (!v27)
      {
        uint64_t v33 = 0;
        goto LABEL_45;
      }
      int v59 = self->_ucat->var0;
      if (v59 <= 60 && (v59 != -1 || _LogCategory_Initialize()))
      {
        id v69 = v10;
        LogPrintF();
      }
    }
    uint64_t v33 = 1;
LABEL_45:
    char v24 = objc_alloc_init(SFBLEDevice);
    [(SFBLEDevice *)v24 setAdvertisementData:v81];
    if (v11) {
      [(SFBLEDevice *)v24 setAdvertisementFields:v11];
    }
    CFDataGetTypeID();
    [(SFBLEDevice *)v24 setBluetoothAddress:CFDictionaryGetTypedValue()];
    [(SFBLEDevice *)v24 setConnectedServices:CFDictionaryGetInt64Ranged()];
    [(SFBLEDevice *)v24 setFoundTicks:mach_absolute_time()];
    [(SFBLEDevice *)v24 setIdentifier:v10];
    [(SFBLEDevice *)v24 setLastSeen:CFAbsoluteTimeGetCurrent()];
    if (v29) {
      [(SFBLEDevice *)v24 setName:v29];
    }
    -[SFBLEDevice setPaired:](v24, "setPaired:", v33, v69);
    if (v13) {
      [(SFBLEDevice *)v24 updateRSSI:v13];
    }
    [(SFBLEScanner *)self _updateCounterpart:v24];
    v80[2](v80, v24);
    devices = self->_devices;
    if (!devices)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v36 = self->_devices;
      self->_devices = v35;

      devices = self->_devices;
    }
    [(NSMutableDictionary *)devices setObject:v24 forKeyedSubscript:v10];
    int v37 = self->_ucat->var0;
    if (v37 <= 8 && (v37 != -1 || _LogCategory_Initialize()))
    {
      v70 = v24;
      LogPrintF();
    }
    deviceFoundHandler = (void (**)(id, SFBLEDevice *))self->_deviceFoundHandler;
    if (deviceFoundHandler) {
      deviceFoundHandler[2](deviceFoundHandler, v24);
    }
LABEL_123:

    int v62 = [(SFBLEScanner *)self _needActiveScan];
    int activeScan = self->_activeScan;
    if (activeScan == v62)
    {
LABEL_135:
      if (!self->_needDups && (self->_changeFlags & 0x16) != 0 && [(SFBLEScanner *)self _needDups])
      {
        int v68 = self->_ucat->var0;
        if (v68 <= 30 && (v68 != -1 || _LogCategory_Initialize()))
        {
          v70 = v24;
          v71 = (const char *)self->_changeFlags;
          LogPrintF();
        }
        self->_needDups = 1;
      }
      else if (activeScan == v62)
      {
        goto LABEL_147;
      }
      [(SFBLEScanner *)self _restartIfNeeded];
LABEL_147:
      [(SFBLEScanner *)self _updateRescanTimer];

      goto LABEL_148;
    }
    int v64 = self->_ucat->var0;
    if (v64 <= 30)
    {
      if (v64 != -1)
      {
        BOOL v65 = self->_activeScan;
LABEL_127:
        v66 = "yes";
        if (v65) {
          v67 = "yes";
        }
        else {
          v67 = "no";
        }
        if (!v62) {
          v66 = "no";
        }
        v71 = v66;
        v72 = v24;
        v70 = (void *)v67;
        LogPrintF();
        goto LABEL_134;
      }
      if (_LogCategory_Initialize())
      {
        BOOL v65 = self->_activeScan;
        goto LABEL_127;
      }
    }
LABEL_134:
    self->_int activeScan = v62;
    goto LABEL_135;
  }
  int v21 = self->_ucat->var0;
  if (v21 <= 10 && (v21 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_148:
}

- (void)_restartIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v139[5] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_90;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_needDups)
  {
    int64_t changeFlags = self->_changeFlags;
    if ((changeFlags & 0x16) == 0)
    {
      int v7 = self->_ucat->var0;
      if (v7 <= 30)
      {
        if (v7 == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_12;
          }
          int64_t changeFlags = self->_changeFlags;
        }
        int64_t v116 = changeFlags;
        LogPrintF();
      }
LABEL_12:
      self->_needDups = 0;
    }
  }
  int64_t payloadType = self->_payloadType;
  if (payloadType > 14)
  {
    if ((unint64_t)(payloadType - 15) >= 2)
    {
      if (payloadType != 17)
      {
LABEL_38:
        int v18 = self->_ucat->var0;
        if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_90;
      }
LABEL_36:
      objc_msgSend(MEMORY[0x1E4F1CA48], "array", v116);
      id v137 = (id)objc_claimAutoreleasedReturnValue();
      centralManager = self->_centralManager;
      if (!centralManager)
      {
LABEL_85:

        return;
      }
      switch([(CBCentralManager *)centralManager state])
      {
        case 5:
          if (self->_payloadType != 17) {
            goto LABEL_78;
          }
          uint64_t v32 = [(Class)getCBUUIDClass[0]() UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
          if (!v32)
          {
            int v115 = self->_ucat->var0;
            if (v115 <= 90 && (v115 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }

LABEL_90:
            int v38 = self->_ucat->var0;
            if (v38 <= 60 && (v38 != -1 || _LogCategory_Initialize())) {
              goto LABEL_266;
            }
            return;
          }
          uint64_t v33 = (void *)v32;
          [v137 addObject:v32];
          v34 = [(Class)getCBUUIDClass[0]() UUIDWithString:@"FE25"];

          [v137 addObject:v34];
LABEL_78:
          int64_t scanInterval = self->_scanInterval;
          if (self->_scanWindow >= 1) {
            int64_t scanWindow = self->_scanWindow;
          }
          else {
            int64_t scanWindow = 30;
          }
          if (scanInterval <= 0)
          {
            int64_t scanRate = self->_scanRate;
            if (scanRate <= 49)
            {
              if (scanRate <= 39)
              {
                if (scanRate <= 19) {
                  int64_t scanInterval = 966;
                }
                else {
                  int64_t scanInterval = 300;
                }
              }
              else
              {
                int64_t scanInterval = 40;
              }
            }
            else
            {
              int64_t scanInterval = 30;
            }
          }
          if ([v137 count])
          {
            int64_t v89 = scanWindow;
          }
          else
          {
            int64_t scanInterval = 0;
            int64_t v89 = 0;
          }
          BOOL scanStarted = self->_scanStarted;
          if (v3 || !self->_scanStarted) {
            goto LABEL_210;
          }
          if (self->_activeScan == self->_scanParamActive
            && self->_needDups == self->_scanParamDups
            && scanInterval == self->_scanParamInterval
            && v89 == self->_scanParamWindow)
          {
            int v91 = self->_ucat->var0;
            if (v91 <= 20 && (v91 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
          }
          else
          {
            BOOL scanStarted = 1;
LABEL_210:
            BOOL v92 = scanStarted && v3;
            int v93 = self->_ucat->var0;
            if (v93 <= 30 && (v93 != -1 || _LogCategory_Initialize()))
            {
              unint64_t v94 = self->_payloadType + 1;
              if (v94 > 0x12) {
                v95 = "?";
              }
              else {
                v95 = off_1E5BBF410[v94];
              }
              v96 = "yes";
              if (self->_activeScan) {
                v97 = "yes";
              }
              else {
                v97 = "no";
              }
              if (self->_needDups) {
                v98 = "yes";
              }
              else {
                v98 = "no";
              }
              if (v3) {
                v99 = "yes";
              }
              else {
                v99 = "no";
              }
              if (!v92) {
                v96 = "no";
              }
              v123 = v99;
              v124 = v96;
              uint64_t v121 = (uint64_t)v97;
              int64_t v122 = (int64_t)v98;
              v119 = (const char *)v89;
              int64_t v120 = scanInterval;
              v118 = v95;
              LogPrintF();
            }
            if (v92) {
              [(CBCentralManager *)self->_centralManager stopScan];
            }
            v133 = self->_centralManager;
            v136 = getCBCentralManagerScanOptionActive[0]();
            v138[0] = v136;
            v100 = [NSNumber numberWithBool:self->_activeScan];
            v139[0] = v100;
            v101 = getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
            v138[1] = v101;
            v102 = [NSNumber numberWithBool:self->_needDups];
            v139[1] = v102;
            v103 = getCBCentralManagerScanOptionIsPrivilegedDaemonKey[0]();
            v138[2] = v103;
            v139[2] = MEMORY[0x1E4F1CC38];
            v104 = getCBCentralManagerScanOptionScanInterval[0]();
            v138[3] = v104;
            [NSNumber numberWithInteger:scanInterval];
            v105 = int64_t v132 = scanInterval;
            v139[3] = v105;
            v106 = getCBCentralManagerScanOptionScanWindow[0]();
            v138[4] = v106;
            [NSNumber numberWithInteger:v89];
            v107 = int64_t v131 = v89;
            v139[4] = v107;
            v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:5];
            [(CBCentralManager *)v133 scanForPeripheralsWithServices:v137 options:v108];

            self->_scanParamActive = self->_activeScan;
            self->_scanParamDups = self->_needDups;
            self->_scanParamInterval = v132;
            self->_scanParamWindow = v131;
          }
          if (self->_scanState != 1)
          {
            self->_scanState = 1;
            scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
            if (scanStateChangedHandler) {
              scanStateChangedHandler[2](scanStateChangedHandler, 1);
            }
          }
          [(SFBLEScanner *)self _startTimeoutIfNeeded];

          goto LABEL_192;
        default:
          int v31 = self->_ucat->var0;
          if (v31 <= 20 && (v31 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_85;
      }
    }
    wpNearby = self->_wpNearby;
    if (!wpNearby) {
      return;
    }
    if (self->_scanCache && self->_scanStarted)
    {
      int v113 = self->_ucat->var0;
      if (v113 <= 20 && (v113 != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_266;
      }
      return;
    }
    if ([(WPNearby *)wpNearby state] != 3) {
      goto LABEL_254;
    }
    if (![(SFBLEScanner *)self _needDups] && self->_needDups)
    {
      int v14 = self->_ucat->var0;
      if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v15 = self->_payloadType + 1;
        if (v15 > 0x12) {
          v16 = "?";
        }
        else {
          v16 = off_1E5BBF410[v15];
        }
        v117 = (void *)v16;
        LogPrintF();
      }
      self->_needDups = 0;
    }
    int64_t v42 = self->_scanRate;
    uint64_t v43 = 10;
    if (v42 > 29) {
      uint64_t v43 = 20;
    }
    if (v42 <= 49) {
      int64_t v44 = v43;
    }
    else {
      int64_t v44 = 40;
    }
    BOOL v45 = v3 || !self->_scanStarted;
    scanParamFilterData = self->_scanParamFilterData;
    v47 = self->_payloadFilterData;
    uint64_t v48 = scanParamFilterData;
    if (v47 == v48)
    {
    }
    else
    {
      v49 = v48;
      if ((v47 == 0) == (v48 != 0)) {
        goto LABEL_140;
      }
      int v50 = [(NSData *)v47 isEqual:v48];

      if (!v50) {
        goto LABEL_141;
      }
    }
    scanParamFilterMask = self->_scanParamFilterMask;
    v47 = self->_payloadFilterMask;
    id v52 = scanParamFilterMask;
    if (v47 == v52)
    {
    }
    else
    {
      v49 = v52;
      if ((v47 == 0) == (v52 != 0)) {
        goto LABEL_140;
      }
      int v53 = [(NSData *)v47 isEqual:v52];

      if (!v53) {
        goto LABEL_141;
      }
    }
    scanParamPeers = self->_scanParamPeers;
    v47 = self->_deviceFilter;
    v55 = scanParamPeers;
    if (v47 == (NSData *)v55)
    {
    }
    else
    {
      v49 = v55;
      if ((v47 == 0) == (v55 != 0)) {
        goto LABEL_140;
      }
      int v56 = [(NSData *)v47 isEqual:v55];

      if (!v56)
      {
LABEL_141:
        BOOL v60 = self->_scanStarted && v3;
        goto LABEL_144;
      }
    }
    if (v44 != self->_scanParamMode
      || self->_rssiThreshold != self->_scanParamRSSI
      || self->_needDups != self->_scanParamDups
      || self->_scanCache != self->_scanParamCache)
    {
      goto LABEL_141;
    }
    scanUseCases = self->_scanUseCases;
    v47 = self->_useCases;
    v58 = scanUseCases;
    if (v47 == (NSData *)v58)
    {

      goto LABEL_244;
    }
    v49 = v58;
    if ((v47 == 0) != (v58 != 0))
    {
      char v59 = [(NSData *)v47 isEqual:v58];

      if ((v59 & 1) == 0) {
        goto LABEL_141;
      }
LABEL_244:
      if (!v45)
      {
        int v111 = self->_ucat->var0;
        if (v111 <= 20 && (v111 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_191;
      }
      BOOL v60 = 0;
      if (self->_scanStarted && v3)
      {
        int v110 = self->_ucat->var0;
        if (v110 <= 30 && (v110 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        -[WPNearby clearDuplicatesForType:](self->_wpNearby, "clearDuplicatesForType:", self->_wpNearbyType, v117);
        goto LABEL_190;
      }
LABEL_144:
      int v61 = self->_ucat->var0;
      if (v61 > 30 || v61 == -1 && !_LogCategory_Initialize())
      {
LABEL_183:
        if (v60) {
          [(WPNearby *)self->_wpNearby stopScanningForType:self->_wpNearbyType];
        }
        id v74 = self->_wpNearby;
        int64_t wpNearbyType = self->_wpNearbyType;
        payloadFilterData = self->_payloadFilterData;
        payloadFilterMask = self->_payloadFilterMask;
        deviceFilter = self->_deviceFilter;
        int64_t rssiThreshold = self->_rssiThreshold;
        if (rssiThreshold)
        {
          v80 = [NSNumber numberWithInteger:self->_rssiThreshold];
        }
        else
        {
          v80 = 0;
        }
        BYTE1(v117) = self->_scanCache;
        LOBYTE(v117) = self->_needDups;
        -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:](v74, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:", wpNearbyType, payloadFilterData, payloadFilterMask, deviceFilter, v44, v80, v117, self->_useCases, v120, v121, v122, v123, v124, v125, v126, v127, v128);
        if (rssiThreshold) {

        }
LABEL_190:
        id v81 = (NSData *)[(NSData *)self->_payloadFilterData copy];
        v82 = self->_scanParamFilterData;
        self->_scanParamFilterData = v81;

        int v83 = (NSData *)[(NSData *)self->_payloadFilterMask copy];
        __int16 v84 = self->_scanParamFilterMask;
        self->_scanParamFilterMask = v83;

        int v85 = (NSArray *)[(NSArray *)self->_deviceFilter copy];
        v86 = self->_scanParamPeers;
        self->_scanParamPeers = v85;

        self->_int64_t scanParamMode = v44;
        self->_scanParamRSSI = self->_rssiThreshold;
        self->_scanParamDups = self->_needDups;
        self->_scanParamCache = self->_scanCache;
        v87 = (NSSet *)[(NSSet *)self->_useCases copy];
        v88 = self->_scanUseCases;
        self->_scanUseCases = v87;

LABEL_191:
        [(SFBLEScanner *)self _updateTrackedPeers];
        goto LABEL_192;
      }
      if (self->_payloadFilterData) {
        int v62 = self->_payloadFilterData;
      }
      else {
        int v62 = (NSData *)&stru_1EF9BDC68;
      }
      NSUInteger v63 = [(NSArray *)self->_deviceFilter count];
      int64_t v64 = self->_scanRate;
      BOOL v135 = v3;
      NSUInteger v130 = v63;
      if (v64 <= 19)
      {
        BOOL v65 = "Invalid";
        switch(v64)
        {
          case 0:
            goto LABEL_170;
          case 1:
            BOOL v65 = "BackgroundOld";
            break;
          case 2:
            BOOL v65 = "NormalOld";
            break;
          case 3:
            BOOL v65 = "HighOld";
            break;
          case 4:
            BOOL v65 = "AggressiveOld";
            break;
          case 10:
            BOOL v65 = "Background";
            break;
          default:
            goto LABEL_169;
        }
        goto LABEL_170;
      }
      if (v64 > 39)
      {
        if (v64 == 40)
        {
          BOOL v65 = "High";
          goto LABEL_170;
        }
        if (v64 == 50)
        {
          BOOL v65 = "Aggressive";
          goto LABEL_170;
        }
      }
      else
      {
        if (v64 == 20)
        {
          BOOL v65 = "Normal";
          goto LABEL_170;
        }
        if (v64 == 30)
        {
          BOOL v65 = "HighNormal";
LABEL_170:
          v129 = v65;
          int64_t v66 = self->_rssiThreshold;
          if (self->_needDups) {
            v67 = "yes";
          }
          else {
            v67 = "no";
          }
          if (self->_scanCache) {
            int v68 = "yes";
          }
          else {
            int v68 = "no";
          }
          NSUInteger v69 = [(NSSet *)self->_trackedPeers count];
          uint64_t v70 = [(SFBLEScanner *)self _useCasesToString:self->_useCases];
          v71 = (void *)v70;
          if (v135) {
            v72 = "yes";
          }
          else {
            v72 = "no";
          }
          if (v60) {
            uint64_t v73 = "yes";
          }
          else {
            uint64_t v73 = "no";
          }
          v127 = v72;
          v128 = v73;
          NSUInteger v125 = v69;
          uint64_t v126 = v70;
          v123 = v67;
          v124 = v68;
          uint64_t v121 = (uint64_t)v129;
          int64_t v122 = v66;
          int64_t v120 = v130;
          v117 = v62;
          LogPrintF();

          goto LABEL_183;
        }
      }
LABEL_169:
      BOOL v65 = "?";
      goto LABEL_170;
    }
LABEL_140:

    goto LABEL_141;
  }
  if (payloadType == -1) {
    goto LABEL_36;
  }
  if (payloadType != 5)
  {
    if (payloadType == 7)
    {
      wpPairing = self->_wpPairing;
      if (!wpPairing) {
        return;
      }
      if ([(WPPairing *)wpPairing state] == 3)
      {
        int64_t v10 = self->_scanRate;
        if (v10 <= 49) {
          int64_t v11 = 2 * (v10 > 39);
        }
        else {
          int64_t v11 = 3;
        }
        int v12 = v3 || !self->_scanStarted;
        int64_t v20 = self->_rssiThreshold;
        if (v20 == self->_scanParamRSSI && self->_needDups == self->_scanParamDups)
        {
          int64_t scanParamMode = self->_scanParamMode;
          if (((v11 == scanParamMode) & ~v12) != 0)
          {
            int v41 = self->_ucat->var0;
            if (v41 <= 20 && (v41 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            goto LABEL_192;
          }
          BOOL v22 = self->_scanStarted && v3;
          if (v11 == scanParamMode && v22)
          {
            int v23 = self->_ucat->var0;
            if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            [(WPPairing *)self->_wpPairing clearProximityPairingServiceDuplicates];
LABEL_100:
            self->_scanParamRSSI = self->_rssiThreshold;
            self->_scanParamDups = self->_needDups;
            self->_int64_t scanParamMode = v11;
            goto LABEL_192;
          }
        }
        else
        {
          BOOL v22 = self->_scanStarted && v3;
        }
        int v24 = self->_ucat->var0;
        if (v24 <= 30)
        {
          if (v24 != -1)
          {
            BOOL v134 = v3;
LABEL_62:
            uint64_t v25 = SFScanRateToString(v10);
            if (self->_needDups) {
              v26 = "yes";
            }
            else {
              v26 = "no";
            }
            uint64_t v27 = -[SFBLEScanner _useCasesToString:](self, "_useCasesToString:", self->_useCases, v116);
            uint64_t v28 = (void *)v27;
            if (v134) {
              v29 = "yes";
            }
            else {
              v29 = "no";
            }
            if (v22) {
              v30 = "yes";
            }
            else {
              v30 = "no";
            }
            int64_t v122 = (int64_t)v29;
            v123 = v30;
            int64_t v120 = (int64_t)v26;
            uint64_t v121 = v27;
            int64_t v116 = v20;
            v119 = v25;
            LogPrintF();

            goto LABEL_95;
          }
          if (_LogCategory_Initialize())
          {
            BOOL v134 = v3;
            int64_t v20 = self->_rssiThreshold;
            int64_t v10 = self->_scanRate;
            goto LABEL_62;
          }
        }
LABEL_95:
        if (v22) {
          [(WPPairing *)self->_wpPairing stopProximityPairingServiceScanning];
        }
        uint64_t v39 = self->_wpPairing;
        if (self->_rssiThreshold)
        {
          v40 = objc_msgSend(NSNumber, "numberWithInteger:");
          [(WPPairing *)v39 startProximityPairingServiceScanningWithRSSI:v40 duplicates:self->_needDups scanMode:v11];
        }
        else
        {
          [(WPPairing *)self->_wpPairing startProximityPairingServiceScanningWithRSSI:0 duplicates:self->_needDups scanMode:v11];
        }
        goto LABEL_100;
      }
LABEL_254:
      int v112 = self->_ucat->var0;
      if (v112 <= 20 && (v112 != -1 || _LogCategory_Initialize())) {
        goto LABEL_266;
      }
      return;
    }
    goto LABEL_38;
  }
  wpAirDrop = self->_wpAirDrop;
  if (!wpAirDrop) {
    return;
  }
  if ([(WPAWDL *)wpAirDrop state] == 3)
  {
    [(WPAWDL *)self->_wpAirDrop stopConnectionlessAWDLServiceScanning];
    [(WPAWDL *)self->_wpAirDrop startConnectionlessAWDLServiceScanning];
LABEL_192:
    self->_BOOL scanStarted = 1;
    [(SFBLEScanner *)self _updateRescanTimer];
    [(CURetrier *)self->_startRetrier succeededDirect];
    return;
  }
  int v114 = self->_ucat->var0;
  if (v114 <= 20 && (v114 != -1 || _LogCategory_Initialize())) {
LABEL_266:
  }
    LogPrintF();
}

void __59__SFBLEScanner__foundDevice_advertisementData_rssi_fields___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 72) == 7)
  {
    id v8 = v3;
    unsigned int v4 = [v3 advertisementFields];
    uint64_t v5 = CFDictionaryGetInt64Ranged() & 0x24;
    uint64_t Int64 = CFDictionaryGetInt64();
    if (v5 | Int64)
    {
      if (Int64)
      {
        if ([v8 proxPairingTicks])
        {
          [v8 setProxPairingTicks:0];
          int v7 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
          if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
    }
    else if (![v8 proxPairingTicks])
    {
      [v8 setProxPairingTicks:mach_absolute_time()];
    }

    id v3 = v8;
  }
}

- (BOOL)_updateCounterpart:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_payloadType == 7
    && ([v4 bluetoothAddress], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v7 = (void *)v6;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = self->_devices;
    uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          int64_t v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
          int v14 = v13;
          if (v13 == v5)
          {
            unint64_t v15 = 0;
          }
          else
          {
            unint64_t v15 = [v13 bluetoothAddress];
            if ([v15 isEqual:v7])
            {
              v16 = [v14 identifier];
              [v5 setCounterpartIdentifier:v16];

              BOOL v17 = 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
    BOOL v17 = 0;
LABEL_15:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_needActiveScan
{
  return 0;
}

- (void)_updateTrackedPeers
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(NSSet *)self->_trackedPeers count] && !self->_invalidateCalled)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v12 = self->_trackedPeersApplied;
    uint64_t v13 = [(NSSet *)v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * v16);
          if (![(NSSet *)self->_trackedPeers containsObject:v17])
          {
            int var0 = self->_ucat->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              -[WPNearby stopTrackingPeer:forType:](self->_wpNearby, "stopTrackingPeer:forType:", v17, self->_wpNearbyType, v17);
            }
            else
            {
              -[WPNearby stopTrackingPeer:forType:](self->_wpNearby, "stopTrackingPeer:forType:", v17, self->_wpNearbyType, v29);
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v19 = [(NSSet *)v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
        uint64_t v14 = v19;
      }
      while (v19);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v20 = self->_trackedPeers;
    uint64_t v21 = [(NSSet *)v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * v24);
          if (![(NSSet *)self->_trackedPeersApplied containsObject:v25])
          {
            int v26 = self->_ucat->var0;
            if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              -[WPNearby startTrackingPeer:forType:](self->_wpNearby, "startTrackingPeer:forType:", v25, self->_wpNearbyType, v25);
            }
            else
            {
              -[WPNearby startTrackingPeer:forType:](self->_wpNearby, "startTrackingPeer:forType:", v25, self->_wpNearbyType, v29);
            }
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v27 = [(NSSet *)v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
        uint64_t v22 = v27;
      }
      while (v27);
    }

    uint64_t v28 = self->_trackedPeers;
    trackedPeersApplied = self->_trackedPeersApplied;
    self->_trackedPeersApplied = v28;
  }
  else
  {
    if (![(NSSet *)self->_trackedPeersApplied count]) {
      return;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v3 = self->_trackedPeersApplied;
    uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v31;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * v7);
          int v9 = self->_ucat->var0;
          if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v29 = v8;
            LogPrintF();
          }
          -[WPNearby stopTrackingPeer:forType:](self->_wpNearby, "stopTrackingPeer:forType:", v8, self->_wpNearbyType, v29);
          ++v7;
        }
        while (v5 != v7);
        uint64_t v10 = [(NSSet *)v3 countByEnumeratingWithState:&v30 objects:v42 count:16];
        uint64_t v5 = v10;
      }
      while (v10);
    }

    trackedPeersApplied = self->_trackedPeersApplied;
    self->_trackedPeersApplied = 0;
  }
}

- (void)_updateRescanTimer
{
  unint64_t v3 = [(NSMutableDictionary *)self->_devices count];
  if (self->_rescanInterval <= 0.0 || v3 == 0)
  {
    if (self->_rescanTimer)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v9 = self->_rescanTimer;
      if (v9)
      {
        uint64_t v14 = v9;
        dispatch_source_cancel((dispatch_source_t)v9);
        rescanTimer = self->_rescanTimer;
        self->_rescanTimer = 0;
      }
    }
  }
  else
  {
    if (v3 >= 0x15) {
      int rescanIntervalScreenOff = 60;
    }
    else {
      int rescanIntervalScreenOff = 10;
    }
    if (([(id)gSFNearbyAgent screenOn] & 1) == 0
      && rescanIntervalScreenOff <= SLODWORD(self->_rescanIntervalScreenOff))
    {
      int rescanIntervalScreenOff = self->_rescanIntervalScreenOff;
    }
    if (self->_rescanTimer)
    {
      if (rescanIntervalScreenOff == self->_rescanSecondsActual) {
        return;
      }
      int v7 = self->_ucat->var0;
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      CUDispatchTimerSet();
    }
    else
    {
      int v8 = self->_ucat->var0;
      if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      int v12 = self->_rescanTimer;
      self->_rescanTimer = v11;

      uint64_t v13 = self->_rescanTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __34__SFBLEScanner__updateRescanTimer__block_invoke;
      handler[3] = &unk_1E5BBC870;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_rescanTimer);
    }
    self->_rescanSecondsActual = rescanIntervalScreenOff;
  }
}

- (BOOL)_needDups
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int64_t payloadType = self->_payloadType;
  if (payloadType != 15)
  {
    if (payloadType != 7)
    {
      LOBYTE(v14) = [(NSMutableDictionary *)self->_devices count] != 0;
      return v14;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v4 = self->_devices;
    uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          uint64_t v10 = [v9 advertisementFields];
          if (CFDictionaryGetInt64()
            || ((__int16 Int64Ranged = CFDictionaryGetInt64Ranged(), (Int64Ranged & 0x12) != 0)
              ? (BOOL v12 = (Int64Ranged & 0x200) == 0)
              : (BOOL v12 = 0),
                v12))
          {

            goto LABEL_33;
          }
          uint64_t v13 = CFDictionaryGetInt64Ranged();

          if (v13 == 5) {
            goto LABEL_33;
          }
        }
        uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    goto LABEL_29;
  }
  int v14 = [(id)gSFNearbyAgent screenOn];
  if (v14)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = self->_devices;
    uint64_t v15 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v4);
          }
          uint64_t v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
          long long v20 = [v19 advertisementFields];

          if (CFDictionaryGetInt64()
            || CFDictionaryGetInt64() && CFDictionaryGetInt64Ranged() - 50 > 0x1E)
          {

LABEL_33:
            LOBYTE(v14) = 1;
            return v14;
          }
          char v21 = CFDictionaryGetInt64Ranged();

          if ((v21 & 0x10) != 0) {
            goto LABEL_33;
          }
        }
        uint64_t v16 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    LOBYTE(v14) = 0;
  }
  return v14;
}

- (id)_useCasesToString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((v6 & 1) == 0) {
          char v6 = 1;
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "unsignedIntValue", v14);
        if (v9 >= 0x20000)
        {
          if (v9 >= 327680)
          {
            if (v9 > 589824)
            {
              if (v9 <= 2147418111)
              {
                switch(v9)
                {
                  case 589825:
                    uint64_t v10 = "FindNearbyPencil";
                    break;
                  case 655360:
                    uint64_t v10 = "AccessDigitalHomeKey";
                    break;
                  case 786432:
                    uint64_t v10 = "ProxControlDeviceClose";
                    break;
                  default:
LABEL_149:
                    uint64_t v10 = "?";
                    break;
                }
              }
              else
              {
                switch(v9)
                {
                  case 2147418112:
                    uint64_t v10 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    uint64_t v10 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    uint64_t v10 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    uint64_t v10 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    uint64_t v10 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    uint64_t v10 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    uint64_t v10 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    uint64_t v10 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    uint64_t v10 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_149;
                }
              }
            }
            else if (v9 > 458752)
            {
              switch(v9)
              {
                case 524288:
                  uint64_t v10 = "ADPD";
                  break;
                case 524289:
                  uint64_t v10 = "ADPDBuffer";
                  break;
                case 524290:
                  uint64_t v10 = "MicroLocation";
                  break;
                case 524291:
                  uint64_t v10 = "MicroLocationLeech";
                  break;
                default:
                  if (v9 == 458753)
                  {
                    uint64_t v10 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v9 != 589824) {
                      goto LABEL_149;
                    }
                    uint64_t v10 = "FindNearbyRemote";
                  }
                  break;
              }
            }
            else
            {
              switch(v9)
              {
                case 393216:
                  uint64_t v10 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  uint64_t v10 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  uint64_t v10 = "MacSetup";
                  break;
                case 393219:
                  uint64_t v10 = "AppleIDSignIn";
                  break;
                case 393220:
                  uint64_t v10 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v9 == 327680)
                  {
                    uint64_t v10 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v9 != 458752) {
                      goto LABEL_149;
                    }
                    uint64_t v10 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v9)
            {
              case 131072:
                uint64_t v10 = "SharingDefault";
                break;
              case 131073:
                uint64_t v10 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                uint64_t v10 = "SharingSiriWatchAuth";
                break;
              case 131075:
                uint64_t v10 = "SharingMacAutoUnlock";
                break;
              case 131076:
                uint64_t v10 = "SharingEDTScreenOn";
                break;
              case 131077:
                uint64_t v10 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                uint64_t v10 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                uint64_t v10 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                uint64_t v10 = "SharingWombatBackground";
                break;
              case 131081:
                uint64_t v10 = "SharingUniversalControl";
                break;
              case 131082:
                uint64_t v10 = "SharingPeopleProximity";
                break;
              case 131083:
                uint64_t v10 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                uint64_t v10 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                uint64_t v10 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                uint64_t v10 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                uint64_t v10 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                uint64_t v10 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_149;
              case 131090:
                uint64_t v10 = "SharingAirDrop";
                break;
              case 131091:
                uint64_t v10 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                uint64_t v10 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                uint64_t v10 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                uint64_t v10 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                uint64_t v10 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                uint64_t v10 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                uint64_t v10 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                uint64_t v10 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                uint64_t v10 = "SharingVisionProDiscovery";
                break;
              case 131100:
                uint64_t v10 = "SharingVisionProStateChange";
                break;
              case 131101:
                uint64_t v10 = "SharingContinuityScreen";
                break;
              case 131102:
                uint64_t v10 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v9 == 196608)
                {
                  uint64_t v10 = "DigitalIDTSA";
                }
                else
                {
                  if (v9 != 0x40000) {
                    goto LABEL_149;
                  }
                  uint64_t v10 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else if (v9 <= 0x20000)
        {
          switch(v9)
          {
            case 65536:
              uint64_t v10 = "FindMyAction";
              break;
            case 65537:
              uint64_t v10 = "FindMyBackground";
              break;
            case 65538:
              uint64_t v10 = "FindMyActionHELE";
              break;
            case 65539:
              uint64_t v10 = "FindMyBackgroundHELE";
              break;
            case 65540:
              uint64_t v10 = "FindMyActionTransient";
              break;
            case 65541:
              uint64_t v10 = "FindMyBackgroundTransient";
              break;
            case 65542:
              uint64_t v10 = "FindMyActionHELETransient";
              break;
            case 65543:
              uint64_t v10 = "FindMyBackgroundHELETransient";
              break;
            case 65544:
              uint64_t v10 = "FindMyNotOptedIn";
              break;
            case 65545:
              uint64_t v10 = "FindMyOptedIn";
              break;
            case 65546:
              uint64_t v10 = "FindMySepAlertsEnabled";
              break;
            case 65547:
              uint64_t v10 = "FindMyTemporaryAggressiveLegacy";
              break;
            case 65548:
              uint64_t v10 = "FindMyTemporaryLongAggressive";
              break;
            case 65549:
              uint64_t v10 = "FindMyBTFindingUserInitiated";
              break;
            case 65550:
              uint64_t v10 = "FindMyHELE";
              break;
            case 65551:
              uint64_t v10 = "FindMyBeaconOnDemand";
              break;
            case 65552:
              uint64_t v10 = "FindMyWildTimedScan";
              break;
            case 65553:
              uint64_t v10 = "FindMyBackgroundLeechScan";
              break;
            case 65554:
              uint64_t v10 = "FindMySnifferMode";
              break;
            case 65555:
              uint64_t v10 = "FindMyUnpair";
              break;
            case 65556:
              uint64_t v10 = "FindMyUnpairHELE";
              break;
            case 65557:
              uint64_t v10 = "FindMyPlaySound";
              break;
            case 65558:
              uint64_t v10 = "FindMyPlaySoundHELE";
              break;
            case 65559:
              uint64_t v10 = "FindMyNotOptedInBeepOnMoveWaking";
              break;
            case 65560:
              uint64_t v10 = "FindMyUTTransient";
              break;
            case 65561:
              uint64_t v10 = "FindMyUTHELETransient";
              break;
            default:
              JUMPOUT(0);
          }
        }
        else
        {
          uint64_t v10 = "Unspecified";
          switch(v9)
          {
            case 0:
              break;
            case 1:
              uint64_t v10 = "HealthKit";
              break;
            case 2:
              uint64_t v10 = "HomeKit";
              break;
            case 3:
              uint64_t v10 = "FindMyObjectConnection";
              break;
            case 4:
              uint64_t v10 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              uint64_t v10 = "MIDI";
              break;
            case 6:
              uint64_t v10 = "Continuity";
              break;
            case 7:
              uint64_t v10 = "InstantHotSpot";
              break;
            case 8:
              uint64_t v10 = "NearBy";
              break;
            case 9:
              uint64_t v10 = "Sharing";
              break;
            case 10:
              uint64_t v10 = "HearingSupport";
              break;
            case 11:
              uint64_t v10 = "Magnet";
              break;
            case 12:
              uint64_t v10 = "HID";
              break;
            case 13:
              uint64_t v10 = "LEA";
              break;
            case 14:
              uint64_t v10 = "External";
              break;
            case 15:
              uint64_t v10 = "ExternalMedical";
              break;
            case 16:
              uint64_t v10 = "ExternalLock";
              break;
            case 17:
              uint64_t v10 = "ExternalWatch";
              break;
            case 18:
              uint64_t v10 = "SmartRouting";
              break;
            case 19:
              uint64_t v10 = "DigitalID";
              break;
            case 20:
              uint64_t v10 = "DigitalKey";
              break;
            case 21:
              uint64_t v10 = "DigitalCarKey";
              break;
            case 22:
              uint64_t v10 = "HeySiri";
              break;
            case 23:
              uint64_t v10 = "ThirdPartyApp";
              break;
            case 24:
              uint64_t v10 = "CNJ";
              break;
            default:
              switch(v9)
              {
                case 256:
                  uint64_t v10 = "DevicePresenceDetection";
                  break;
                case 257:
                  uint64_t v10 = "AudioBox";
                  break;
                case 258:
                  uint64_t v10 = "SIMTransfer";
                  break;
                case 259:
                  uint64_t v10 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  uint64_t v10 = "MacMigrate";
                  break;
                case 263:
                  uint64_t v10 = "HIDUARTService";
                  break;
                case 264:
                  uint64_t v10 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  uint64_t v10 = "BaseBandFastConnect";
                  break;
                case 266:
                  uint64_t v10 = "SafetyAlerts";
                  break;
                case 267:
                  uint64_t v10 = "LECarPlay";
                  break;
                case 268:
                  uint64_t v10 = "TCCBluetooth";
                  break;
                case 269:
                  uint64_t v10 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_149;
              }
              break;
          }
        }
        int v14 = v10;
        NSAppendPrintF();
      }
      uint64_t v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16, v14);
    }
    while (v5);
  }
  uint64_t v11 = v19;
  if (!v19) {
    uint64_t v11 = &stru_1EF9BDC68;
  }
  BOOL v12 = v11;

  return v12;
}

uint64_t __39__SFBLEScanner_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)setDispatchQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)_activateWithCompletion:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    uint64_t v23 = 4294960572;
    goto LABEL_42;
  }
  if (self->_startRetrier)
  {
    uint64_t v23 = 4294960575;
    goto LABEL_42;
  }
  int64_t payloadType = self->_payloadType;
  if (payloadType > 14)
  {
    if ((unint64_t)(payloadType - 15) < 2)
    {
      self->_int64_t wpNearbyType = payloadType != 15;
      if (self->_wpNearby) {
        goto LABEL_26;
      }
      uint64_t v10 = +[SFBLEClient sharedClient];
      uint64_t v11 = [v10 addNearbyDelegate:self];
      wpNearby = self->_wpNearby;
      self->_wpNearby = v11;

      if (self->_wpNearby) {
        goto LABEL_26;
      }
LABEL_52:
      uint64_t v23 = 4294960567;
LABEL_42:
      int v24 = self->_ucat->var0;
      if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v33 = v23;
        LogPrintF();
      }
      if (v4)
      {
        long long v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28760];
        uint64_t v27 = (int)v23;
        uint64_t v36 = *MEMORY[0x1E4F28568];
        uint64_t v28 = [NSString stringWithUTF8String:DebugGetErrorString()];
        long long v29 = (void *)v28;
        long long v30 = @"?";
        if (v28) {
          long long v30 = (__CFString *)v28;
        }
        v37[0] = v30;
        long long v31 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1, v33, v34);
        long long v32 = [v25 errorWithDomain:v26 code:v27 userInfo:v31];
        v4[2](v4, v32);
      }
      goto LABEL_32;
    }
    if (payloadType != 17)
    {
LABEL_33:
      int v21 = self->_ucat->var0;
      if (v21 <= 60)
      {
        if (v21 != -1)
        {
LABEL_35:
          if ((unint64_t)(payloadType + 1) > 0x12) {
            uint64_t v22 = "?";
          }
          else {
            uint64_t v22 = off_1E5BBF410[payloadType + 1];
          }
          uint64_t v33 = payloadType;
          long long v34 = v22;
          LogPrintF();
          goto LABEL_41;
        }
        if (_LogCategory_Initialize())
        {
          int64_t payloadType = self->_payloadType;
          goto LABEL_35;
        }
      }
LABEL_41:
      uint64_t v23 = 4294960561;
      goto LABEL_42;
    }
LABEL_21:
    if (self->_centralManager) {
      goto LABEL_26;
    }
    uint64_t v13 = (CBCentralManager *)[objc_alloc((Class)getCBCentralManagerClass_0[0]()) initWithDelegate:self queue:self->_dispatchQueue];
    centralManager = self->_centralManager;
    self->_centralManager = v13;

    if (self->_centralManager) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
  if (payloadType == -1) {
    goto LABEL_21;
  }
  if (payloadType == 5)
  {
    if (self->_wpAirDrop) {
      goto LABEL_26;
    }
    long long v15 = +[SFBLEClient sharedClient];
    long long v16 = [v15 addAirDropDelegate:self];
    wpAirDrop = self->_wpAirDrop;
    self->_wpAirDrop = v16;

    if (self->_wpAirDrop) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
  if (payloadType != 7) {
    goto LABEL_33;
  }
  if ([(SFBLEScanner *)self _btSessionUsable]) {
    [(SFBLEScanner *)self _btSessionEnsureStarted];
  }
  if (!self->_wpPairing)
  {
    uint64_t v7 = +[SFBLEClient sharedClient];
    int v8 = [v7 addPairingDelegate:self];
    wpPairing = self->_wpPairing;
    self->_wpPairing = v8;

    if (!self->_wpPairing) {
      goto LABEL_52;
    }
  }
LABEL_26:
  if (self->_rssiLog && !self->_rssiEventLogFile) {
    [(SFBLEScanner *)self _rssiLogOpen];
  }
  long long v18 = (CURetrier *)objc_alloc_init(MEMORY[0x1E4F5E1D0]);
  startRetrier = self->_startRetrier;
  self->_startRetrier = v18;

  long long v20 = self->_startRetrier;
  if (!v20) {
    goto LABEL_52;
  }
  [(CURetrier *)v20 setDispatchQueue:self->_dispatchQueue];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __40__SFBLEScanner__activateWithCompletion___block_invoke;
  v35[3] = &unk_1E5BBC870;
  v35[4] = self;
  [(CURetrier *)self->_startRetrier setActionHandler:v35];
  [(CURetrier *)self->_startRetrier startDirect];
  if (v4) {
    v4[2](v4, 0);
  }
LABEL_32:
}

uint64_t __26__SFBLEScanner_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SFBLEScanner_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dealloc
{
  if (self->_btSession)
  {
    FatalErrorF();
    goto LABEL_15;
  }
  if (self->_centralManager)
  {
LABEL_15:
    FatalErrorF();
    goto LABEL_16;
  }
  if (self->_rescanTimer)
  {
LABEL_16:
    FatalErrorF();
    goto LABEL_17;
  }
  if (self->_startRetrier)
  {
LABEL_17:
    FatalErrorF();
    goto LABEL_18;
  }
  if (self->_wpAirDrop)
  {
LABEL_18:
    FatalErrorF();
    goto LABEL_19;
  }
  if (self->_wpNearby)
  {
LABEL_19:
    FatalErrorF();
    goto LABEL_20;
  }
  if (self->_wpPairing)
  {
LABEL_20:
    long long v16 = (SFBLEScanner *)FatalErrorF();
    [(SFBLEScanner *)v16 _rssiLogClose];
    return;
  }
  [(SFBLEScanner *)self _rssiLogClose];
  id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_id bluetoothStateChangedHandler = 0;

  devices = self->_devices;
  self->_devices = 0;

  deviceFilter = self->_deviceFilter;
  self->_deviceFilter = 0;

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0;

  id deviceChangedHandler = self->_deviceChangedHandler;
  self->_id deviceChangedHandler = 0;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;
  }
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  payloadFilterData = self->_payloadFilterData;
  self->_payloadFilterData = 0;

  payloadFilterMask = self->_payloadFilterMask;
  self->_payloadFilterMask = 0;

  id scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_id scanStateChangedHandler = 0;

  id timeoutHandler = self->_timeoutHandler;
  self->_id timeoutHandler = 0;

  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SFBLEScanner;
  [(SFBLEScanner *)&v18 dealloc];
}

- (void)_rssiLogClose
{
  if (self->_rssiEventLogFile)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    FPrintF();
    FPrintF();
    fclose(self->_rssiEventLogFile);
    self->_rssiEventLogFile = 0;
  }
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  devices = self->_devices;
  self->_devices = 0;

  lostTimer = self->_lostTimer;
  if (lostTimer)
  {
    char v6 = lostTimer;
    dispatch_source_cancel(v6);
    uint64_t v7 = self->_lostTimer;
    self->_lostTimer = 0;
  }
  rescanTimer = self->_rescanTimer;
  if (rescanTimer)
  {
    int v9 = rescanTimer;
    dispatch_source_cancel(v9);
    uint64_t v10 = self->_rescanTimer;
    self->_rescanTimer = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    BOOL v12 = timeoutTimer;
    dispatch_source_cancel(v12);
    uint64_t v13 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(CURetrier *)self->_startRetrier invalidateDirect];
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0;

  int64_t payloadType = self->_payloadType;
  if (payloadType > 14)
  {
    switch(payloadType)
    {
      case 15:
        [(SFBLEScanner *)self _updateTrackedPeers];
        wpNearby = self->_wpNearby;
        uint64_t v20 = 0;
        break;
      case 16:
        [(SFBLEScanner *)self _updateTrackedPeers];
        wpNearby = self->_wpNearby;
        uint64_t v20 = 1;
        break;
      case 17:
LABEL_22:
        [(CBCentralManager *)self->_centralManager stopScan];
        centralManager = self->_centralManager;
        self->_centralManager = 0;
LABEL_31:

        goto LABEL_32;
      default:
        goto LABEL_41;
    }
    [(WPNearby *)wpNearby stopScanningForType:v20];
    centralManager = self->_wpNearby;
    if (centralManager)
    {
      int v21 = +[SFBLEClient sharedClient];
      [v21 removeNearbyDelegate:self];

      centralManager = self->_wpNearby;
    }
    self->_wpNearby = 0;
    goto LABEL_31;
  }
  switch(payloadType)
  {
    case -1:
      goto LABEL_22;
    case 5:
      [(WPAWDL *)self->_wpAirDrop stopConnectionlessAWDLServiceScanning];
      centralManager = self->_wpAirDrop;
      if (centralManager)
      {
        objc_super v18 = +[SFBLEClient sharedClient];
        [v18 removeAirDropDelegate:self];

        centralManager = self->_wpAirDrop;
      }
      self->_wpAirDrop = 0;
      goto LABEL_31;
    case 7:
      [(WPPairing *)self->_wpPairing stopProximityPairingServiceScanning];
      centralManager = self->_wpPairing;
      if (centralManager)
      {
        SEL v17 = +[SFBLEClient sharedClient];
        [v17 removePairingDelegate:self];

        centralManager = self->_wpPairing;
      }
      self->_wpPairing = 0;
      goto LABEL_31;
  }
LABEL_41:
  int v31 = self->_ucat->var0;
  if (v31 > 60) {
    goto LABEL_32;
  }
  if (v31 != -1) {
    goto LABEL_43;
  }
  if (_LogCategory_Initialize())
  {
    int64_t payloadType = self->_payloadType;
LABEL_43:
    int64_t v32 = payloadType;
    uint64_t v33 = SFBLEPayloadTypeToString(payloadType);
    LogPrintF();
  }
LABEL_32:
  self->_BOOL scanStarted = 0;
  [(SFBLEScanner *)self _btSessionEnsureStopped];
  int v22 = self->_ucat->var0;
  if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  [(SFBLEScanner *)self _rssiLogClose];
  id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_id bluetoothStateChangedHandler = 0;

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0;

  id deviceChangedHandler = self->_deviceChangedHandler;
  self->_id deviceChangedHandler = 0;

  id v28 = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_id scanStateChangedHandler = 0;

  id timeoutHandler = self->_timeoutHandler;
  self->_id timeoutHandler = 0;
}

- (void)_btSessionEnsureStopped
{
  p_btSession = &self->_btSession;
  if (self->_btSession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue[0])((uint64_t)p_btSession);
    *p_btSession = 0;
  }
  self->_btStarted = 0;
}

- (NSString)description
{
  id v41 = 0;
  unint64_t v3 = self->_payloadType + 1;
  if (v3 > 0x12) {
    uint64_t v4 = "?";
  }
  else {
    uint64_t v4 = off_1E5BBF410[v3];
  }
  int64_t v32 = v4;
  NSAppendPrintF();
  id v5 = v41;
  char v6 = v5;
  if (self->_invalidateCalled)
  {
    id v40 = v5;
    NSAppendPrintF();
    id v7 = v40;

    char v6 = v7;
  }
  if (self->_activeScan)
  {
    long long v39 = v6;
    NSAppendPrintF();
    id v8 = v6;

    char v6 = v8;
  }
  if (self->_needDups)
  {
    long long v38 = v6;
    NSAppendPrintF();
    id v9 = v6;

    char v6 = v9;
  }
  if (self->_rssiThreshold)
  {
    long long v37 = v6;
    NSAppendPrintF();
    id v10 = v6;

    char v6 = v10;
  }
  if (self->_scanCache)
  {
    uint64_t v36 = v6;
    NSAppendPrintF();
    id v11 = v6;

    char v6 = v11;
  }
  id v35 = v6;
  int64_t scanRate = self->_scanRate;
  if (scanRate > 19)
  {
    if (scanRate > 39)
    {
      if (scanRate == 40)
      {
        uint64_t v13 = "High";
        goto LABEL_31;
      }
      if (scanRate == 50)
      {
        uint64_t v13 = "Aggressive";
        goto LABEL_31;
      }
    }
    else
    {
      if (scanRate == 20)
      {
        uint64_t v13 = "Normal";
        goto LABEL_31;
      }
      if (scanRate == 30)
      {
        uint64_t v13 = "HighNormal";
        goto LABEL_31;
      }
    }
LABEL_30:
    uint64_t v13 = "?";
  }
  else
  {
    uint64_t v13 = "Invalid";
    switch(scanRate)
    {
      case 0:
        break;
      case 1:
        uint64_t v13 = "BackgroundOld";
        break;
      case 2:
        uint64_t v13 = "NormalOld";
        break;
      case 3:
        uint64_t v13 = "HighOld";
        break;
      case 4:
        uint64_t v13 = "AggressiveOld";
        break;
      case 10:
        uint64_t v13 = "Background";
        break;
      default:
        goto LABEL_30;
    }
  }
LABEL_31:
  uint64_t v27 = v13;
  NSAppendPrintF();
  id v14 = v35;

  v34[5] = v14;
  uint64_t v28 = [(NSMutableDictionary *)self->_devices count];
  NSAppendPrintF();
  id v15 = v14;

  v34[4] = v15;
  NSUInteger v29 = [(NSArray *)self->_deviceFilter count];
  NSAppendPrintF();
  id v16 = v15;

  v34[3] = v16;
  NSUInteger v30 = [(NSSet *)self->_trackedPeers count];
  NSAppendPrintF();
  id v17 = v16;

  payloadFilterData = self->_payloadFilterData;
  if (!payloadFilterData)
  {
    if (!self->_payloadFilterMask) {
      goto LABEL_35;
    }
    payloadFilterData = (NSData *)&stru_1EF9BDC68;
  }
  v34[2] = v17;
  NSUInteger v30 = (NSUInteger)payloadFilterData;
  NSAppendPrintF();
  id v19 = v17;

  id v17 = v19;
LABEL_35:
  NSUInteger rescanSecondsActual = self->_rescanSecondsActual;
  if ((int)rescanSecondsActual >= 1)
  {
    v34[1] = v17;
    NSUInteger v30 = rescanSecondsActual;
    NSAppendPrintF();
    id v21 = v17;

    id v17 = v21;
  }
  NSUInteger changeFlags = self->_changeFlags;
  if (changeFlags)
  {
    if (changeFlags == -1)
    {
      v34[0] = v17;
      uint64_t v23 = (id *)v34;
    }
    else
    {
      id v33 = v17;
      NSUInteger v30 = changeFlags;
      uint64_t v23 = &v33;
    }
    NSAppendPrintF();
    id v24 = *v23;

    id v17 = v24;
  }
  if (!self->_useCases)
  {
    int v31 = -[SFBLEScanner _useCasesToString:](self, "_useCasesToString:", 0, v30);
    NSAppendPrintF();
    id v25 = v17;

    id v17 = v25;
  }

  return (NSString *)v17;
}

- (void)setDeviceFilter:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v4;
    LogPrintF();
  }
  char v6 = objc_msgSend(v4, "copy", v8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__SFBLEScanner_setDeviceFilter___block_invoke;
  v9[3] = &unk_1E5BBBD18;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v9];
}

void __32__SFBLEScanner_setDeviceFilter___block_invoke(uint64_t a1)
{
}

- (void)setPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    goto LABEL_3;
  }
  while (1)
  {
    uint64_t v9 = objc_msgSend(v6, "length", v14, v15);
    if (v9 == [v7 length]) {
      break;
    }
    id v6 = (id)[v6 length];
    [v7 length];
    FatalErrorF();
LABEL_3:
    id v14 = v6;
    id v15 = v7;
    LogPrintF();
  }
  id v10 = (void *)[v6 copy];
  id v11 = (void *)[v7 copy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__SFBLEScanner_setPayloadFilterData_mask___block_invoke;
  v16[3] = &unk_1E5BBD418;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v16];
}

void __42__SFBLEScanner_setPayloadFilterData_mask___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 320), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  unint64_t v3 = (id *)(*(void *)(a1 + 32) + 328);

  objc_storeStrong(v3, v2);
}

- (void)setScanCache:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__SFBLEScanner_setScanCache___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  BOOL v4 = a3;
  v3[4] = self;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v3];
}

uint64_t __29__SFBLEScanner_setScanCache___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 258))
  {
    *(unsigned char *)(v2 + 258) = v1;
    *(unsigned char *)(*(void *)(result + 32) + 104) = 0;
  }
  return result;
}

- (void)setScanRate:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__SFBLEScanner_setScanRate___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  void v3[5] = a3;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v3];
}

uint64_t __28__SFBLEScanner_setScanRate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 376) = *(void *)(result + 40);
  return result;
}

- (void)setTimeout:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__SFBLEScanner_setTimeout___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v3];
}

double __27__SFBLEScanner_setTimeout___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    unint64_t v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;
  }
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 408) = result;
  return result;
}

- (void)setTrackedPeers:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v4;
    LogPrintF();
  }
  id v6 = objc_msgSend(v4, "copy", v8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__SFBLEScanner_setTrackedPeers___block_invoke;
  v9[3] = &unk_1E5BBBD18;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  [(SFBLEScanner *)self _invokeBlockActivateSafe:v9];
}

void __32__SFBLEScanner_setTrackedPeers___block_invoke(uint64_t a1)
{
}

unsigned char *__41__SFBLEScanner__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  double result = *(unsigned char **)(a1 + 32);
  if (!result[152])
  {
    return (unsigned char *)[result _restartIfNeeded];
  }
  return result;
}

- (void)_poweredOff
{
  IOPMConnectionGetSystemCapabilities();
  int v3 = IOPMIsASleep();
  self->_poweredOffSleep = v3;
  if (v3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    [(SFBLEScanner *)self _removeAllDevicesWithReason:@"BTPowerOff"];
  }
}

- (void)_poweredOn
{
  if (self->_poweredOffSleep)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_poweredOffSleep = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    devices = self->_devices;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__SFBLEScanner__poweredOn__block_invoke;
    v6[3] = &__block_descriptor_40_e36_v32__0__NSUUID_8__SFBLEDevice_16_B24l;
    *(CFAbsoluteTime *)&v6[4] = Current;
    [(NSMutableDictionary *)devices enumerateKeysAndObjectsUsingBlock:v6];
  }
  [(SFBLEScanner *)self _restartIfNeeded];
}

uint64_t __26__SFBLEScanner__poweredOn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setLastSeen:*(double *)(a1 + 32)];
}

- (void)_removeAllDevicesWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_BOOL scanStarted = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_devices;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v9), v15, v16, (void)v17);
        int var0 = self->_ucat->var0;
        if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
        {
          id v15 = v4;
          id v16 = v10;
          LogPrintF();
        }
        id deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
        if (deviceLostHandler) {
          deviceLostHandler[2](deviceLostHandler, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v13 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v7 = v13;
    }
    while (v13);
  }

  [(NSMutableDictionary *)self->_devices removeAllObjects];
  self->_int activeScan = 0;
  self->_needDups = 0;
  int v14 = self->_ucat->var0;
  if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SFBLEScanner *)self _updateRescanTimer];
}

- (void)_rescanTimerFired
{
  int var0 = self->_ucat->var0;
  if (self->_poweredOffSleep)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return;
  }
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_devices count];
    LogPrintF();
  }
  int v4 = [(SFBLEScanner *)self _needActiveScan];
  int activeScan = self->_activeScan;
  if (activeScan != v4)
  {
    int v6 = self->_ucat->var0;
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
        BOOL v7 = self->_activeScan;
LABEL_17:
        uint64_t v8 = "yes";
        if (v7) {
          uint64_t v9 = "yes";
        }
        else {
          uint64_t v9 = "no";
        }
        if (!v4) {
          uint64_t v8 = "no";
        }
        id v15 = v9;
        id v16 = v8;
        LogPrintF();
        goto LABEL_24;
      }
      if (_LogCategory_Initialize())
      {
        BOOL v7 = self->_activeScan;
        goto LABEL_17;
      }
    }
LABEL_24:
    self->_int activeScan = v4;
  }
  if (![(NSMutableDictionary *)self->_devices count])
  {
    if (self->_needDups)
    {
      self->_needDups = 0;
      int v13 = self->_ucat->var0;
      if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else if (activeScan == v4)
    {
      return;
    }
  }
  if (!self->_lostTimer)
  {
    [(NSMutableDictionary *)self->_devices enumerateKeysAndObjectsUsingBlock:&__block_literal_global_33];
    id v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    lostTimer = self->_lostTimer;
    self->_lostTimer = v10;

    id v12 = self->_lostTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33__SFBLEScanner__rescanTimerFired__block_invoke_2;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_lostTimer);
  }
  [(SFBLEScanner *)self _restartIfNeeded:1];
}

uint64_t __33__SFBLEScanner__rescanTimerFired__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setLastSeen:0.0];
}

uint64_t __33__SFBLEScanner__rescanTimerFired__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescanLostFired];
}

- (void)_rescanLostFired
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  lostTimer = self->_lostTimer;
  if (lostTimer)
  {
    int v4 = lostTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_lostTimer;
    self->_lostTimer = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v6 = [(NSMutableDictionary *)self->_devices allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v11, v18);
        [v12 lastSeen];
        if (v13 == 0.0)
        {
          int var0 = self->_ucat->var0;
          if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
          {
            long long v18 = v12;
            LogPrintF();
          }
          id v15 = _Block_copy(self->_deviceLostHandler);
          id v16 = v15;
          if (v15) {
            (*((void (**)(void *, void *))v15 + 2))(v15, v12);
          }

          [(NSMutableDictionary *)self->_devices removeObjectForKey:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v8 = v17;
    }
    while (v17);
  }
}

- (void)_rssiLogOpen
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  bzero(__filename, 0x400uLL);
  SNPrintF();
  NormalizePath();
  if (mkpath() && (!*__error() || *__error()))
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  SNPrintF();
  __strlcat_chk();
  int v4 = fopen(__filename, "a");
  self->_rssiEventLogFile = v4;
  if (v4)
  {
    setlinebuf(v4);
    int v5 = self->_ucat->var0;
    if (v5 <= 50 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    FPrintF();
    FPrintF();
    FPrintF();
    FPrintF();
  }
  else
  {
    int v6 = self->_ucat->var0;
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      __error();
      LogPrintF();
    }
  }
}

uint64_t __37__SFBLEScanner__startTimeoutIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutTimerFired];
}

- (void)_timeoutTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    int v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    int v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  }
  self->_id timeoutHandler = 0;
}

uint64_t __34__SFBLEScanner__updateRescanTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescanTimerFired];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v10 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  centralManager = self->_centralManager;
  if (centralManager) {
    BOOL v5 = centralManager == v10;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = [(CBCentralManager *)v10 state];
    if ((unint64_t)(v6 - 1) > 4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_1A56EA6A8[v6 - 1];
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    switch(v7)
    {
      case 1:
        [(SFBLEScanner *)self _removeAllDevicesWithReason:@"BTReset"];
        break;
      case 2:
        [(SFBLEScanner *)self _poweredOff];
        break;
      case 3:
        [(SFBLEScanner *)self _poweredOn];
        break;
    }
    id bluetoothStateChangedHandler = (void (**)(id, void))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v7);
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v16 = a4;
  id v10 = a5;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  double v13 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  centralManager = self->_centralManager;

  if (centralManager && centralManager == v13)
  {
    id v15 = [v16 identifier];
    if (v15)
    {
      [(SFBLEScanner *)self _recordDevice:v15 data:0 rssi:v11 info:v10];
      [(SFBLEScanner *)self foundPeripheralDevice:v16 advertisementData:v10 RSSI:v11];
    }
  }
}

- (void)foundPeripheralDevice:(id)a3 advertisementData:(id)a4 RSSI:(id)a5
{
  id v29 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 identifier];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = getCBAdvertisementDataChannel[0]();
    id v12 = [v29 objectForKeyedSubscript:v11];

    if (v12) {
      [v10 setObject:v12 forKeyedSubscript:@"ch"];
    }
    double v13 = getCBAdvertisementDataDeviceAddress[0]();
    uint64_t v14 = [v29 objectForKeyedSubscript:v13];

    if ([v14 length] == 6) {
      [v10 setObject:v14 forKeyedSubscript:@"bdAddr"];
    }
    id v15 = getCBAdvertisementDataManufacturerDataKey[0]();
    id v16 = [v29 objectForKeyedSubscript:v15];

    if (!v16) {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    if (self->_payloadType == 17)
    {
      uint64_t v27 = v12;
      id v28 = v8;
      uint64_t v17 = getCBAdvertisementDataServiceDataKey();
      long long v18 = [v29 objectForKeyedSubscript:v17];

      long long v19 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FE25"];
      long long v20 = [v18 objectForKeyedSubscript:v19];
      if (v20)
      {
        if (![(SFBLEScanner *)self _watchSetupParseData:v20 fields:v10])
        {

          id v12 = v27;
          id v8 = v28;
LABEL_23:

          goto LABEL_24;
        }
        long long v21 = v16;
        id v16 = v20;
      }
      else
      {
        long long v22 = getCBAdvertisementDataLocalNameKey[0]();
        long long v21 = [v29 objectForKeyedSubscript:v22];

        if (v21)
        {
          [v10 setObject:v21 forKeyedSubscript:@"name"];
          [(SFBLEScanner *)self _watchSetupParseName:v21 fields:v10];
        }
      }

      id v12 = v27;
      id v8 = v28;
    }
    uint64_t v23 = [v8 integerValue];
    getCBAdvertisementDataSaturated[0]();
    if (CFDictionaryGetInt64())
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v25 = v23;
        uint64_t v26 = v9;
        LogPrintF();
      }
      uint64_t v23 = 127;
    }
    -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v9, v16, v23, v10, v25, v26);
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_watchSetupParseName:(id)a3 fields:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [v17 dataUsingEncoding:4];
    [v5 setObject:v6 forKeyedSubscript:@"wd"];
    uint64_t v7 = 0;
LABEL_24:

    goto LABEL_25;
  }
  if ((unint64_t)[v17 length] < 8)
  {
    uint64_t v7 = 0;
    goto LABEL_25;
  }
  uint64_t v7 = objc_msgSend(v17, "substringWithRange:", 0, 5);
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"wi"];
  }
  unsigned __int8 v8 = [v17 characterAtIndex:5];
  uint64_t v9 = MEMORY[0x1E4F14390];
  if (v8 > 0x7Fu)
  {
    if (!__maskrune(v8, 0x500uLL)) {
      goto LABEL_12;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v8 + 60) & 0x500) == 0)
  {
    goto LABEL_12;
  }
  id v10 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890", (char)v8, 0x3FuLL);
  if (v10)
  {
    id v11 = [NSNumber numberWithInt:v10 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"];
    [v5 setObject:v11 forKeyedSubscript:@"wv"];
  }
LABEL_12:
  unsigned __int8 v12 = [v17 characterAtIndex:6];
  if (v12 > 0x7Fu)
  {
    if (!__maskrune(v12, 0x500uLL)) {
      goto LABEL_18;
    }
  }
  else if ((*(_DWORD *)(v9 + 4 * v12 + 60) & 0x500) == 0)
  {
    goto LABEL_18;
  }
  double v13 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890", (char)v12, 0x3FuLL);
  if (v13)
  {
    uint64_t v14 = [NSNumber numberWithInt:v13 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"];
    [v5 setObject:v14 forKeyedSubscript:@"wm"];
  }
LABEL_18:
  unsigned __int8 v15 = [v17 characterAtIndex:7];
  if (v15 > 0x7Fu)
  {
    if (!__maskrune(v15, 0x500uLL)) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if ((*(_DWORD *)(v9 + 4 * v15 + 60) & 0x500) != 0)
  {
LABEL_22:
    id v16 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890", (char)v15, 0x3FuLL);
    if (!v16) {
      goto LABEL_25;
    }
    uint64_t v6 = [NSNumber numberWithInt:v16 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"];
    [v5 setObject:v6 forKeyedSubscript:@"ws"];
    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)_watchSetupParseData:(id)a3 fields:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] >= 0xD
    && (id v7 = v5, *(unsigned char *)[v7 bytes] == 6))
  {
    if (_os_feature_enabled_impl())
    {
      [v6 setObject:v7 forKeyedSubscript:@"wd"];
    }
    else
    {
      uint64_t v9 = objc_msgSend(v7, "subdataWithRange:", 2, 4);
      id v10 = (void *)[objc_alloc(getWatchSetupAdvertisementIdentifierClass()) initWithPackedIdentifierData:v9];
      id v11 = [v10 humanReadableName];
      [v6 setObject:v11 forKeyedSubscript:@"name"];

      unsigned __int8 v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "advertisingIdentifier"));
      [v6 setObject:v12 forKeyedSubscript:@"wi"];

      double v13 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v10, "deviceSize"));
      [v6 setObject:v13 forKeyedSubscript:@"ws"];

      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v10, "enclosureMaterial"));
      [v6 setObject:v14 forKeyedSubscript:@"wm"];

      unsigned __int8 v15 = objc_msgSend(v7, "subdataWithRange:", 6, 7);
      id v16 = (void *)[objc_alloc(getWatchSetupExtendedMetadataClass()) initWithPackedExtendedMetadataData:v15];
      id v17 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v16, "pairingVersion"));
      [v6 setObject:v17 forKeyedSubscript:@"wpv"];
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_btSessionUsable
{
  return 1;
}

- (int)_btSessionEnsureStarted
{
  if (self->_btStarted) {
    return 0;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v10 = _btSessionEventHandler;
  int v4 = self;
  int v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue[0])((uint64_t)self->_ucat->var4, (uint64_t)&v10, (uint64_t)v4, v4->_dispatchQueue);
  if (v5)
  {
    int v6 = v5;
    CFRelease(v4);
    int v7 = v6 + 310000;
    if (v6 != -310000)
    {
      int v8 = self->_ucat->var0;
      if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  else
  {
    int v7 = 0;
    self->_btStarted = 1;
  }
  return v7;
}

- (void)awdlDidUpdateState:(id)a3
{
  uint64_t v9 = (WPAWDL *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpAirDrop = self->_wpAirDrop;
  if (wpAirDrop) {
    BOOL v5 = wpAirDrop == v9;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = [(WPAWDL *)v9 state];
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    switch(v6)
    {
      case 1:
        [(SFBLEScanner *)self _removeAllDevicesWithReason:@"BTReset"];
        break;
      case 2:
        [(SFBLEScanner *)self _poweredOff];
        break;
      case 3:
        [(SFBLEScanner *)self _poweredOn];
        break;
    }
    id bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
    }
  }
}

- (void)awdlStartedScanning:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  BOOL v5 = (WPAWDL *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpAirDrop = self->_wpAirDrop;

  if (wpAirDrop) {
    BOOL v7 = wpAirDrop == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_scanState != 1)
    {
      self->_scanState = 1;
      id scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
      if (scanStateChangedHandler) {
        scanStateChangedHandler[2](scanStateChangedHandler, 1);
      }
    }
    [(SFBLEScanner *)self _startTimeoutIfNeeded];
  }
}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v12 = a4;
  dispatchQueue = self->_dispatchQueue;
  BOOL v7 = (WPAWDL *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpAirDrop = self->_wpAirDrop;

  if (wpAirDrop) {
    BOOL v9 = wpAirDrop == v7;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v12;
      LogPrintF();
    }
    self->_BOOL scanStarted = 0;
    [(CURetrier *)self->_startRetrier failedDirect];
  }
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  id v10 = (WPAWDL *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpAirDrop = self->_wpAirDrop;

  if (wpAirDrop && wpAirDrop == v10)
  {
    [(SFBLEScanner *)self _recordDevice:0 data:v12 rssi:v8 info:0];
    [(SFBLEScanner *)self foundAWDLDevice:v12 rssi:v8];
  }
}

- (void)foundAWDLDevice:(id)a3 rssi:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if ([v6 length] == 10)
  {
    id v8 = v6;
    uint64_t v9 = [v8 bytes];
    LODWORD(v13) = 0;
    WORD2(v13) = 0;
    HIBYTE(v13) = *(unsigned char *)(v9 + 1);
    BYTE1(v14) = *(unsigned char *)(v9 + 2);
    int v10 = *(_DWORD *)(v9 + 3);
    HIWORD(v14) = *(_WORD *)(v9 + 7);
    *(_DWORD *)((char *)&v14 + 2) = v10;
    BYTE6(v13) = 16;
    LOBYTE(v14) = 0x80;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v13];
    if (v11)
    {
      id v12 = (void *)v11;
      -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v11, v8, [v7 integerValue], 0);
    }
  }
}

- (void)nearbyDidUpdateState:(id)a3
{
  uint64_t v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby) {
    BOOL v5 = wpNearby == v9;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = [(WPNearby *)v9 state];
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    switch(v6)
    {
      case 1:
        [(SFBLEScanner *)self _removeAllDevicesWithReason:@"BTReset"];
        break;
      case 2:
        [(SFBLEScanner *)self _poweredOff];
        break;
      case 3:
        [(SFBLEScanner *)self _poweredOn];
        break;
    }
    id bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
    }
  }
}

- (void)nearby:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  id v14 = a5;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v11 = wpNearby == v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 && self->_wpNearbyType == a4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v14;
      LogPrintF();
    }
    self->_BOOL scanStarted = 0;
    [(CURetrier *)self->_startRetrier failedDirect];
  }
}

- (void)nearby:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  id v17 = a4;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v11 = wpNearby == v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11 || self->_wpNearbyType != a5)
  {
LABEL_22:
    id v12 = 0;
    goto LABEL_25;
  }
  id v12 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v17];
  int var0 = self->_ucat->var0;
  if (!v12)
  {
    if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v17;
      LogPrintF();
    }
    goto LABEL_22;
  }
  if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v12;
    LogPrintF();
  }
  id deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
  if (deviceLostHandler) {
    deviceLostHandler[2](deviceLostHandler, v12);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v17, v16);
  if (![(SFBLEScanner *)self _needDups])
  {
    int v15 = self->_ucat->var0;
    if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v12;
      LogPrintF();
    }
    self->_needDups = 0;
    [(SFBLEScanner *)self _restartIfNeeded];
  }
LABEL_25:
  [(SFBLEScanner *)self _updateRescanTimer];
}

- (void)_nearbyParseNearbyActionPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  id v36 = a5;
  if (a4 - a3 < 1)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    unsigned int v8 = *(unsigned __int8 *)a3++;
    uint64_t v7 = v8;
    if (v8)
    {
      uint64_t v9 = [NSNumber numberWithUnsignedChar:v7];
      [v36 setObject:v9 forKeyedSubscript:@"af1"];

      if ((v7 & 0x20) != 0) {
        [v36 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"nk"];
      }
      if ((v7 & 0x40) != 0) {
        [v36 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ns"];
      }
    }
  }
  if (a4 - a3 < 1)
  {
    unsigned int v10 = 0;
    if ((v7 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  unsigned int v11 = *(unsigned __int8 *)a3++;
  unsigned int v10 = v11;
  id v12 = [NSNumber numberWithUnsignedChar:v11];
  [v36 setObject:v12 forKeyedSubscript:@"dt"];

  if (v11 == 50) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"na"];
  }
  if ((v7 & 0x80) != 0)
  {
LABEL_14:
    if (a4 - a3 >= 3)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:3];
      [v36 setObject:v13 forKeyedSubscript:@"at"];

      a3 += 3;
    }
  }
LABEL_16:
  if ((v10 <= 0x24 && ((1 << v10) & 0x1200480A00) != 0 || v10 == 84) && a4 - a3 >= 1)
  {
    id v14 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a3 >> 5];
    [v36 setObject:v14 forKeyedSubscript:@"cl"];

    char v15 = *a3++;
    id v16 = [NSNumber numberWithUnsignedChar:v15 & 0x1F];
    [v36 setObject:v16 forKeyedSubscript:@"md"];
  }
  if ((v10 - 33 <= 0x33 && ((1 << (v10 - 33)) & 0x8000000000009) != 0 || v10 - 9 < 3)
    && a4 - a3 >= 1)
  {
    unsigned int v17 = *(unsigned __int8 *)a3++;
    long long v18 = [NSNumber numberWithUnsignedChar:v17];
    [v36 setObject:v18 forKeyedSubscript:@"cc"];
  }
  if (v10 <= 0x2B && ((1 << v10) & 0x80100000242) != 0 || v10 == 84)
  {
    if (a4 - a3 <= 0)
    {
      BOOL v24 = v10 == 10;
      goto LABEL_43;
    }
  }
  else
  {
    int64_t v21 = a4 - a3;
    BOOL v35 = v10 == 33 || v10 == 11;
    if (!v35 || v21 <= 0) {
      goto LABEL_30;
    }
  }
  unsigned int v19 = *(unsigned __int8 *)a3++;
  long long v20 = [NSNumber numberWithUnsignedChar:v19];
  [v36 setObject:v20 forKeyedSubscript:@"ov"];

  int64_t v21 = a4 - a3;
LABEL_30:
  if (v10 == 8 && v21 >= 9)
  {
    long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:9];
    [v36 setObject:v22 forKeyedSubscript:@"ach"];
    a3 += 9;

    int64_t v21 = a4 - a3;
  }
  if (v10 == 8 && v21 >= 3)
  {
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:3];
    [v36 setObject:v23 forKeyedSubscript:@"ssidH"];
    a3 += 3;
LABEL_46:

    goto LABEL_47;
  }
  BOOL v24 = v10 == 10;
  if (v10 == 10 && v21 >= 1)
  {
    unsigned int v25 = *(unsigned __int8 *)a3++;
    uint64_t v26 = ((v25 << 11) | (2 * v25)) & 0x2000E | (((v25 >> 4) & 1) << 18) | (16 * ((v25 >> 3) & 1)) & 0xFFFEFFFF | (((v25 >> 5) & 1) << 16);
    if ((v25 & 0x80u) == 0) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = v26 | 0x400000;
    }
    id v28 = [NSNumber numberWithUnsignedLongLong:v27];
    [v36 setObject:v28 forKeyedSubscript:@"pf"];

    BOOL v24 = 1;
  }
LABEL_43:
  if (v24 && a4 - a3 >= 1)
  {
    unsigned int v29 = *(unsigned __int8 *)a3++;
    uint64_t v23 = [NSNumber numberWithUnsignedChar:v29];
    [v36 setObject:v23 forKeyedSubscript:@"ov"];
    goto LABEL_46;
  }
LABEL_47:
  if (v10 == 51 || v10 == 9)
  {
    if (a4 - a3 >= 1)
    {
      unsigned int v31 = *(unsigned __int8 *)a3;
      NSUInteger v30 = a3 + 1;
      int64_t v32 = [NSNumber numberWithUnsignedChar:v31];
      [v36 setObject:v32 forKeyedSubscript:@"af2"];

      if ((v31 & 4) != 0 && a4 - v30 >= 3)
      {
        id v33 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:3];
        long long v34 = @"tatag";
LABEL_56:
        [v36 setObject:v33 forKeyedSubscript:v34];
      }
    }
  }
  else if (v10 == 1 && a4 - a3 >= 1)
  {
    id v33 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a3];
    long long v34 = @"md";
    goto LABEL_56;
  }
}

- (void)pairingDidUpdateState:(id)a3
{
  uint64_t v9 = (WPPairing *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpPairing = self->_wpPairing;
  if (wpPairing) {
    BOOL v5 = wpPairing == v9;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = [(WPPairing *)v9 state];
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    switch(v6)
    {
      case 1:
        [(SFBLEScanner *)self _removeAllDevicesWithReason:@"BTReset"];
        break;
      case 2:
        [(SFBLEScanner *)self _poweredOff];
        break;
      case 3:
        [(SFBLEScanner *)self _poweredOn];
        break;
    }
    id bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
    }
  }
}

- (void)pairingStartedScanning:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  BOOL v5 = (WPPairing *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpPairing = self->_wpPairing;

  if (wpPairing) {
    BOOL v7 = wpPairing == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_scanState != 1)
    {
      self->_scanState = 1;
      id scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
      if (scanStateChangedHandler) {
        scanStateChangedHandler[2](scanStateChangedHandler, 1);
      }
    }
    [(SFBLEScanner *)self _startTimeoutIfNeeded];
  }
}

- (void)pairing:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v12 = a4;
  dispatchQueue = self->_dispatchQueue;
  BOOL v7 = (WPPairing *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpPairing = self->_wpPairing;

  if (wpPairing) {
    BOOL v9 = wpPairing == v7;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v12;
      LogPrintF();
    }
    self->_BOOL scanStarted = 0;
    [(CURetrier *)self->_startRetrier failedDirect];
  }
}

- (void)pairing:(id)a3 foundDevice:(id)a4 payload:(id)a5 rssi:(id)a6 peerInfo:(id)a7
{
  id v21 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  id v16 = (WPPairing *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpPairing = self->_wpPairing;

  if (wpPairing && wpPairing == v16)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v21;
      id v20 = v14;
      LogPrintF();
    }
    -[SFBLEScanner _recordDevice:data:rssi:info:](self, "_recordDevice:data:rssi:info:", v21, v12, v13, v14, v19, v20);
    [(SFBLEScanner *)self foundPairingDevice:v21 payload:v12 rssi:v13 peerInfo:v14 withTimeInMachContSeconds:(double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0];
  }
}

- (void)foundPairingDevice:(id)a3 payload:(id)a4 rssi:(id)a5 peerInfo:(id)a6 withTimeInMachContSeconds:(double)a7
{
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  char v15 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v21];
  id v16 = [(SFBLEScanner *)self pairingParsePayload:v12 identifier:v21 bleDevice:v15 peerInfo:v14];
  if (v16)
  {
    long long v18 = [NSNumber numberWithDouble:a7];
    [v16 setObject:v18 forKeyedSubscript:@"sampleTimestamp"];

    id v19 = getWPPairingKeyAdvertisingChannel[0]();
    id v20 = [v14 objectForKeyedSubscript:v19];

    if (v20) {
      [v16 setObject:v20 forKeyedSubscript:@"ch"];
    }
    -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v21, v12, [v13 integerValue], v16);
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (id)pairingParsePayload:(id)a3 identifier:(id)a4 bleDevice:(id)a5 peerInfo:(id)a6
{
  v319[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v13 bytes];
  unint64_t v15 = [v13 length];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((uint64_t)v15 >= 7)
  {
    v313 = v11;
    v311 = v12;
    uint64_t v17 = *(unsigned __int8 *)(v14 + 4);
    uint64_t v18 = *(unsigned __int16 *)(v14 + 5);
    int v19 = 1;
    if ((v18 - 8194) > 0xD || ((1 << (v18 - 2)) & 0x3001) == 0)
    {
      BOOL v35 = [[SFHeadphoneProduct alloc] initWithProductID:v18];
      [(SFHeadphoneProduct *)v35 isAirPods];

      if (v18 != 8203)
      {
        id v36 = [[SFHeadphoneProduct alloc] initWithProductID:v18];
        int v19 = [(SFHeadphoneProduct *)v36 hasSplitBattery];
      }
    }
    int v309 = v19;
    uint64_t v21 = v18;
    v312 = [[SFHeadphoneProduct alloc] initWithProductID:v18];
    long long v22 = [NSNumber numberWithUnsignedChar:v17];
    [v16 setObject:v22 forKeyedSubscript:@"subType"];

    if (!v17 && v15 == 14)
    {
      uint64_t v23 = v14 + 8;
      uint64_t v24 = [(SFBLEScanner *)self statusToHeadsetStatus:*(unsigned __int8 *)(v14 + 7) forProductID:v18];
      unsigned int v25 = [NSNumber numberWithUnsignedInt:v24];
      [v16 setObject:v25 forKeyedSubscript:@"hsStatus"];

      uint64_t v26 = [(SFBLEScanner *)self modelWithProductID:v18];
      [v16 setObject:v26 forKeyedSubscript:@"model"];

      uint64_t v27 = [NSNumber numberWithUnsignedShort:v18];
      [v16 setObject:v27 forKeyedSubscript:@"pid"];

      id v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:6];
      [v16 setObject:v28 forKeyedSubscript:@"publicAddress"];

      [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ns"];
      id v12 = v311;
      unsigned int v29 = v312;
LABEL_369:
      id v37 = v16;
      goto LABEL_370;
    }
    unint64_t v30 = v14 + v15;
    v306 = (unsigned __int8 *)(v14 + 7);
    switch((int)v17)
    {
      case 0:
      case 7:
        v304 = self;
        if (v17)
        {
          if (v15 < 0xD) {
            goto LABEL_373;
          }
          v306 = 0;
          unsigned int v283 = *(unsigned __int8 *)(v14 + 7);
          int v31 = *(unsigned __int8 *)(v14 + 8);
          int v285 = *(unsigned __int8 *)(v14 + 9);
          int v288 = *(unsigned __int8 *)(v14 + 10);
          int64_t v32 = (unsigned __int8 *)(v14 + 12);
          unsigned int v296 = *(unsigned __int8 *)(v14 + 11);
          if (v17 == 7)
          {
            v291 = (unsigned __int8 *)(v14 + 12);
            int v33 = 0;
            uint64_t v34 = 0;
            goto LABEL_59;
          }
          uint64_t v95 = 7;
        }
        else
        {
          if (v15 < 0x13) {
            goto LABEL_373;
          }
          unsigned int v283 = *(unsigned __int8 *)(v14 + 13);
          int v31 = *(unsigned __int8 *)(v14 + 14);
          int v285 = *(unsigned __int8 *)(v14 + 15);
          int v288 = *(unsigned __int8 *)(v14 + 16);
          int64_t v32 = (unsigned __int8 *)(v14 + 18);
          uint64_t v95 = 13;
          unsigned int v296 = *(unsigned __int8 *)(v14 + 17);
        }
        uint64_t v96 = v14 + v95;
        uint64_t v34 = *v32;
        int v33 = 1;
        v291 = (unsigned __int8 *)(v96 + 6);
LABEL_59:
        id v294 = v10;
        if (v21 == 8203)
        {
          int v97 = 1;
        }
        else
        {
          unint64_t v98 = v30;
          v99 = [[SFHeadphoneProduct alloc] initWithProductID:v21];
          int v97 = [(SFHeadphoneProduct *)v99 hasSplitCaseColors];

          unint64_t v30 = v98;
        }
        unint64_t v302 = v30;
        if ((v33 & v97) == 1)
        {
          if ((uint64_t)(v30 - (void)v291) < 1) {
            unsigned int v100 = 0;
          }
          else {
            unsigned int v100 = *v291++;
          }
          uint64_t v114 = v34 >> 4;
          uint64_t v115 = v100 >> 5;
          int64_t v116 = [NSNumber numberWithUnsignedChar:v34 & 0xF];
          [v16 setObject:v116 forKeyedSubscript:@"cc"];

          v117 = [NSNumber numberWithUnsignedChar:v114];
          [v16 setObject:v117 forKeyedSubscript:@"ccR"];

          v118 = [NSNumber numberWithUnsignedChar:v115];
          v119 = @"ccC";
        }
        else
        {
          v101 = +[SFHeadphoneProduct airPodsMax];

          if (v312 == v101) {
            [NSNumber numberWithInt:v34 & 0x1F];
          }
          else {
          v118 = [NSNumber numberWithUnsignedChar:v34];
          }
          v119 = @"cc";
        }
        [v16 setObject:v118 forKeyedSubscript:v119];

        unsigned int v120 = [(SFBLEScanner *)v304 statusToHeadsetStatus:v283 forProductID:v21];
        double v121 = 0.0;
        if (v31 == 255)
        {
          uint64_t v281 = 0;
          double v123 = 0.0;
        }
        else
        {
          unsigned int v122 = v31 & 0x7F;
          if (v122 >= 0x64) {
            unsigned int v122 = 100;
          }
          double v123 = (double)v122 / 100.0;
          uint64_t v124 = 1;
          if ((v31 & 0x80u) != 0) {
            uint64_t v124 = 2;
          }
          uint64_t v281 = v124;
        }
        if (v285 == 255)
        {
          uint64_t v287 = 0;
        }
        else
        {
          unsigned int v125 = v285 & 0x7F;
          if (v125 >= 0x64) {
            unsigned int v125 = 100;
          }
          double v121 = (double)v125 / 100.0;
          uint64_t v126 = 1;
          if ((v285 & 0x80u) != 0) {
            uint64_t v126 = 2;
          }
          uint64_t v287 = v126;
        }
        if (v288 == 255)
        {
          uint64_t v279 = 0;
          double v128 = 0.0;
        }
        else
        {
          unsigned int v127 = v288 & 0x7F;
          if (v127 >= 0x64) {
            unsigned int v127 = 100;
          }
          double v128 = (double)v127 / 100.0;
          uint64_t v129 = 1;
          if ((v288 & 0x80u) != 0) {
            uint64_t v129 = 2;
          }
          uint64_t v279 = v129;
        }
        if (v21 - 8194) < 0xE && ((0x3201u >> (v21 - 2)))
        {
          int v131 = 1;
        }
        else
        {
          NSUInteger v130 = [[SFHeadphoneProduct alloc] initWithProductID:v21];
          int v131 = [(SFHeadphoneProduct *)v130 hasLid];
        }
        if ((v296 & 0x80u) == 0) {
          int v132 = 1;
        }
        else {
          int v132 = v131;
        }
        if (v132) {
          uint64_t v133 = v120;
        }
        else {
          uint64_t v133 = v120 | 0x400;
        }
        BOOL v134 = [NSNumber numberWithUnsignedInt:v133];
        [v16 setObject:v134 forKeyedSubscript:@"hsStatus"];

        if ((v131 & ((v296 & 8) >> 3)) != 0) {
          uint64_t v135 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v135 = MEMORY[0x1E4F1CC28];
        }
        [v16 setObject:v135 forKeyedSubscript:@"lc"];
        v136 = [NSNumber numberWithInt:v296 & 7];
        char v290 = v133;
        if ((v133 & 0x100) != 0)
        {
          [v16 setObject:v136 forKeyedSubscript:@"locP"];

          id v137 = v313;
          v141 = [v313 advertisementFields];
          v139 = [v141 objectForKeyedSubscript:@"locS"];

          id v10 = v294;
          if (!v139) {
            goto LABEL_129;
          }
          v140 = @"locS";
        }
        else
        {
          [v16 setObject:v136 forKeyedSubscript:@"locS"];

          id v137 = v313;
          v138 = [v313 advertisementFields];
          v139 = [v138 objectForKeyedSubscript:@"locP"];

          id v10 = v294;
          if (!v139) {
            goto LABEL_129;
          }
          v140 = @"locP";
        }
        [v16 setObject:v139 forKeyedSubscript:v140];
LABEL_129:
        id v11 = v137;

        LOBYTE(v317) = 0;
        LOBYTE(v315) = 0;
        [(SFBLEScanner *)v304 parseStatus3:v296 productID:v21 caseLEDColor:&v317 caseLEDStatus:&v315];
        v142 = +[SFHeadphoneProduct airPodsMax];

        unsigned int v29 = v312;
        if (v312 == v142)
        {
          v143 = [NSNumber numberWithInt:v283 & 0x1F];
          v144 = @"hbT";
          goto LABEL_134;
        }
        if (v21 == 8207 || v21 == 8194)
        {
          v143 = [NSNumber numberWithInt:(v296 >> 4) & 1];
          v144 = @"csVs";
LABEL_134:
          [v16 setObject:v143 forKeyedSubscript:v144];
        }
        if ([(SFHeadphoneProduct *)v312 supportsDigitalEngraving]
          && (uint64_t)(v302 - (void)v291) >= 17)
        {
          v145 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v291 length:17];
          [v16 setObject:v145 forKeyedSubscript:@"engravingData"];
        }
        v146 = [NSNumber numberWithUnsignedChar:v317];
        [v16 setObject:v146 forKeyedSubscript:@"csLC"];

        v147 = [NSNumber numberWithUnsignedChar:v315];
        [v16 setObject:v147 forKeyedSubscript:@"csLS"];

        v148 = [(SFBLEScanner *)v304 modelWithProductID:v21];
        [v16 setObject:v148 forKeyedSubscript:@"model"];

        v149 = [NSNumber numberWithUnsignedShort:v21];
        [v16 setObject:v149 forKeyedSubscript:@"pid"];

        [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ns"];
        if (v17)
        {
          v150 = getWPPairingKeyDeviceAddress[0]();
          v151 = [v311 objectForKeyedSubscript:v150];
          [v16 setObject:v151 forKeyedSubscript:@"publicAddress"];
        }
        else
        {
          v150 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v306 length:6];
          [v16 setObject:v150 forKeyedSubscript:@"publicAddress"];
        }
        uint64_t v152 = v287;
        uint64_t v153 = v281;

        id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (!v309)
        {
          v157 = objc_alloc_init(SFBatteryInfo);
          v155 = v157;
          double v158 = 1.0;
          if (v123 <= 1.0) {
            double v158 = v123;
          }
          if (v158 < 0.0001) {
            double v158 = 0.0001;
          }
          [(SFBatteryInfo *)v157 setBatteryLevel:v158];
          [(SFBatteryInfo *)v155 setBatteryState:v281];
          [(SFBatteryInfo *)v155 setBatteryType:4];
          id v12 = v311;
          goto LABEL_173;
        }
        if (v279)
        {
          v154 = objc_alloc_init(SFBatteryInfo);
          v155 = v154;
          double v156 = 1.0;
          if (v128 <= 1.0) {
            double v156 = v128;
          }
          if (v156 < 0.0001) {
            double v156 = 0.0001;
          }
          [(SFBatteryInfo *)v154 setBatteryLevel:v156];
          [(SFBatteryInfo *)v155 setBatteryState:v279];
          [(SFBatteryInfo *)v155 setBatteryType:1];
          [v55 addObject:v155];
          if (!(v281 | v287))
          {
            char v290 = 0x80;
            uint64_t v152 = 2;
            uint64_t v153 = 2;
            double v121 = 1.0;
            double v123 = 1.0;
            id v12 = v311;
            goto LABEL_156;
          }
        }
        else
        {
          v155 = 0;
        }
        id v12 = v311;
        if (!v281)
        {
LABEL_164:
          if (!v152) {
            goto LABEL_174;
          }
          v162 = objc_alloc_init(SFBatteryInfo);

          double v163 = 1.0;
          if (v121 <= 1.0) {
            double v163 = v121;
          }
          if (v163 < 0.0001) {
            double v163 = 0.0001;
          }
          [(SFBatteryInfo *)v162 setBatteryLevel:v163];
          [(SFBatteryInfo *)v162 setBatteryState:v152];
          if (v290 < 0) {
            uint64_t v164 = 3;
          }
          else {
            uint64_t v164 = 2;
          }
          [(SFBatteryInfo *)v162 setBatteryType:v164];
          v155 = v162;
LABEL_173:
          [v55 addObject:v155];
LABEL_174:
          [v16 setObject:v55 forKeyedSubscript:@"batteryInfo"];

LABEL_175:
          goto LABEL_369;
        }
LABEL_156:
        v159 = objc_alloc_init(SFBatteryInfo);

        double v160 = 1.0;
        if (v123 <= 1.0) {
          double v160 = v123;
        }
        if (v160 < 0.0001) {
          double v160 = 0.0001;
        }
        [(SFBatteryInfo *)v159 setBatteryLevel:v160];
        [(SFBatteryInfo *)v159 setBatteryState:v153];
        if (v290 < 0) {
          uint64_t v161 = 2;
        }
        else {
          uint64_t v161 = 3;
        }
        [(SFBatteryInfo *)v159 setBatteryType:v161];
        [v55 addObject:v159];
        v155 = v159;
        goto LABEL_164;
      case 1:
        if (v15 < 0xA) {
          goto LABEL_373;
        }
        char v38 = *(unsigned char *)(v14 + 7);
        unsigned int v39 = *(unsigned __int8 *)(v14 + 8);
        char v292 = *(unsigned char *)(v14 + 9);
        if (v15 == 26)
        {
          id v40 = v10;
          unsigned int v297 = 0;
          unsigned int v278 = 0;
          unsigned int v276 = 0;
          unsigned int v286 = 0;
          unsigned int v289 = 0;
          id v41 = (unsigned __int8 *)(v14 + 10);
          int64_t v42 = (char *)(v14 + 11);
          uint64_t v43 = (char *)(v14 + 12);
          int64_t v44 = (char *)(v14 + 13);
          uint64_t v45 = v14 + 14;
          uint64_t v277 = v14 + 17;
        }
        else
        {
          if (v15 < 0x19)
          {
LABEL_373:
            id v37 = 0;
            id v12 = v311;
            unsigned int v29 = v312;
            goto LABEL_370;
          }
          id v40 = v10;
          unsigned int v297 = *(unsigned __int8 *)(v14 + 10);
          unsigned int v278 = *(unsigned __int8 *)(v14 + 11);
          id v41 = (unsigned __int8 *)(v14 + 13);
          unsigned int v276 = *(unsigned __int8 *)(v14 + 12);
          int64_t v42 = (char *)(v14 + 14);
          uint64_t v43 = (char *)(v14 + 15);
          int64_t v44 = (char *)(v14 + 16);
          uint64_t v45 = v14 + 17;
          uint64_t v277 = v14 + 20;
          unsigned int v286 = *(unsigned __int8 *)(v14 + 23);
          unsigned int v289 = *(unsigned __int8 *)(v14 + 24);
        }
        int v102 = *v44;
        int v103 = *v43;
        int v104 = *v42;
        unsigned int v303 = *v41;
        char v275 = v38;
        unsigned int v308 = -[SFBLEScanner statusToHeadsetStatus:forProductID:](self, "statusToHeadsetStatus:forProductID:");
        if ([(SFBLEScanner *)self pairingUpdatePairedInfo:v40 fields:v16 bleDevice:v313])
        {
          if (v15 == 26 || !BluetoothProductIDSupportsOBCState(v21))
          {
            unsigned __int8 v274 = 0;
          }
          else
          {
            if ((v303 & 0x20) != 0) {
              char v105 = 2;
            }
            else {
              char v105 = 1;
            }
            unsigned __int8 v274 = v105;
          }
          double v111 = 0.0;
          if (v104 == -1)
          {
            uint64_t v284 = 0;
            double v112 = 0.0;
          }
          else
          {
            unsigned int v165 = v104 & 0x7F;
            if (v165 >= 0x64) {
              unsigned int v165 = 100;
            }
            double v112 = (double)v165 / 100.0;
            uint64_t v166 = 1;
            if (v104 < 0) {
              uint64_t v166 = 2;
            }
            uint64_t v284 = v166;
          }
          if (v103 == -1)
          {
            uint64_t v280 = 0;
          }
          else
          {
            unsigned int v211 = v103 & 0x7F;
            if (v211 >= 0x64) {
              unsigned int v211 = 100;
            }
            double v111 = (double)v211 / 100.0;
            uint64_t v212 = 1;
            if (v103 < 0) {
              uint64_t v212 = 2;
            }
            uint64_t v280 = v212;
          }
          id v10 = v40;
          v206 = self;
          if (v102 == -1)
          {
            uint64_t v282 = 0;
            double v208 = 0.0;
          }
          else
          {
            unsigned int v213 = v102 & 0x7F;
            if (v213 >= 0x64) {
              unsigned int v213 = 100;
            }
            double v208 = (double)v213 / 100.0;
            uint64_t v214 = 1;
            if (v102 < 0) {
              uint64_t v214 = 2;
            }
            uint64_t v282 = v214;
          }
          id v11 = v313;
          unint64_t v210 = 0x1E4F28000uLL;
          v215 = [NSNumber numberWithUnsignedChar:(v303 >> 2) & 3];
          [v16 setObject:v215 forKeyedSubscript:@"asCount"];

          v216 = [NSNumber numberWithInteger:v303 & 3];
          [v16 setObject:v216 forKeyedSubscript:@"aState"];

          v217 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v277 length:3];
          [v16 setObject:v217 forKeyedSubscript:@"lbic"];

          v218 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v45 length:3];
          [v16 setObject:v218 forKeyedSubscript:@"lch"];

          [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"paired"];
          v219 = [NSNumber numberWithUnsignedChar:v274];
          [v16 setObject:v219 forKeyedSubscript:@"obcState"];
        }
        else
        {
          int v110 = v39 & 0xF;
          double v111 = 0.0;
          if (v110 == 15)
          {
            uint64_t v284 = 0;
            double v112 = 0.0;
            id v10 = v40;
            id v11 = v313;
            char v113 = v292;
          }
          else
          {
            if (v110 >= 0xA) {
              int v110 = 10;
            }
            double v112 = (double)v110 / 10.0;
            char v113 = v292;
            uint64_t v203 = 1;
            if ((v292 & 0x10) != 0) {
              uint64_t v203 = 2;
            }
            uint64_t v284 = v203;
            id v10 = v40;
            id v11 = v313;
          }
          int v204 = v39 >> 4;
          if (v39 >> 4 == 15)
          {
            uint64_t v280 = 0;
          }
          else
          {
            if (v204 >= 0xA) {
              int v204 = 10;
            }
            double v111 = (double)v204 / 10.0;
            uint64_t v205 = 1;
            if ((v113 & 0x20) != 0) {
              uint64_t v205 = 2;
            }
            uint64_t v280 = v205;
          }
          v206 = self;
          int v207 = v113 & 0xF;
          if (v207 == 15)
          {
            uint64_t v282 = 0;
            double v208 = 0.0;
          }
          else
          {
            if (v207 >= 0xA) {
              int v207 = 10;
            }
            double v208 = (double)v207 / 10.0;
            uint64_t v209 = 1;
            if ((v113 & 0x40) != 0) {
              uint64_t v209 = 2;
            }
            uint64_t v282 = v209;
          }
          unint64_t v210 = 0x1E4F28000;
        }
        v220 = [(SFBLEScanner *)v206 modelWithProductID:v21];
        [v16 setObject:v220 forKeyedSubscript:@"model"];

        v221 = [*(id *)(v210 + 3792) numberWithUnsignedShort:v21];
        [v16 setObject:v221 forKeyedSubscript:@"pid"];

        if (v15 == 26) {
          goto LABEL_323;
        }
        LOBYTE(v317) = 0;
        LOBYTE(v315) = 0;
        [(SFBLEScanner *)v206 parseStatus3:v297 productID:v21 caseLEDColor:&v317 caseLEDStatus:&v315];
        if (v21 == 8203
          || (v222 = [[SFHeadphoneProduct alloc] initWithProductID:v21], BOOL v223 = [(SFHeadphoneProduct *)v222 hasSplitCaseColors], v222, v223))
        {
          v224 = [*(id *)(v210 + 3792) numberWithUnsignedChar:v278 & 0xF];
          [v16 setObject:v224 forKeyedSubscript:@"cc"];

          v225 = [*(id *)(v210 + 3792) numberWithUnsignedChar:v278 >> 4];
          [v16 setObject:v225 forKeyedSubscript:@"ccR"];

          v226 = [*(id *)(v210 + 3792) numberWithUnsignedChar:v276 >> 5];
          [v16 setObject:v226 forKeyedSubscript:@"ccC"];
          v227 = v312;
        }
        else
        {
          v228 = +[SFHeadphoneProduct airPodsMax];

          v229 = *(void **)(v210 + 3792);
          v227 = v312;
          if (v312 == v228) {
            [v229 numberWithInt:v278 & 0x1F];
          }
          else {
          v226 = [v229 numberWithUnsignedChar:v278];
          }
          [v16 setObject:v226 forKeyedSubscript:@"cc"];
        }

        v230 = +[SFHeadphoneProduct airPodsMax];

        if (v227 == v230)
        {
          v232 = [*(id *)(v210 + 3792) numberWithInt:v275 & 0x1F];
          v233 = @"hbT";
        }
        else
        {
          int v231 = 1;
          if ((int)v21 > 8205)
          {
            if (v21 == 8206) {
              goto LABEL_308;
            }
            if (v21 != 8207) {
              goto LABEL_306;
            }
          }
          else if (v21 != 8194)
          {
            if (v21 == 8203) {
              goto LABEL_308;
            }
            goto LABEL_306;
          }
          v232 = [*(id *)(v210 + 3792) numberWithInt:(v297 >> 4) & 1];
          v233 = @"csVs";
        }
        [v16 setObject:v232 forKeyedSubscript:v233];

        if ((v21 - 8194) >= 0xE || ((0x3201u >> (v21 - 2)) & 1) == 0)
        {
LABEL_306:
          v234 = [[SFHeadphoneProduct alloc] initWithProductID:v21];
          int v231 = [(SFHeadphoneProduct *)v234 hasLid];

          goto LABEL_308;
        }
        int v231 = 1;
LABEL_308:
        if ((v297 & 0x80u) == 0) {
          int v235 = 1;
        }
        else {
          int v235 = v231;
        }
        int v236 = v308;
        if (!v235) {
          int v236 = v308 | 0x400;
        }
        v237 = [*(id *)(v210 + 3792) numberWithInt:v297 & 7];
        unsigned int v308 = v236;
        if ((v236 & 0x100) != 0)
        {
          [v16 setObject:v237 forKeyedSubscript:@"locP"];

          v241 = [v11 advertisementFields];
          v239 = [v241 objectForKeyedSubscript:@"locS"];

          if (v239)
          {
            v240 = @"locS";
            goto LABEL_318;
          }
        }
        else
        {
          [v16 setObject:v237 forKeyedSubscript:@"locS"];

          v238 = [v11 advertisementFields];
          v239 = [v238 objectForKeyedSubscript:@"locP"];

          if (v239)
          {
            v240 = @"locP";
LABEL_318:
            [v16 setObject:v239 forKeyedSubscript:v240];
          }
        }

        if ((v231 & ((v297 & 8) >> 3)) != 0) {
          uint64_t v242 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v242 = MEMORY[0x1E4F1CC28];
        }
        [v16 setObject:v242 forKeyedSubscript:@"lc"];
        v243 = [*(id *)(v210 + 3792) numberWithUnsignedChar:v317];
        [v16 setObject:v243 forKeyedSubscript:@"csLC"];

        v244 = [*(id *)(v210 + 3792) numberWithUnsignedChar:v315];
        [v16 setObject:v244 forKeyedSubscript:@"csLS"];

LABEL_323:
        char v245 = v308;
        v246 = [*(id *)(v210 + 3792) numberWithUnsignedInt:v308];
        [v16 setObject:v246 forKeyedSubscript:@"hsStatus"];

        if (v292 < 0)
        {
          v247 = [*(id *)(v210 + 3792) numberWithUnsignedInt:2048];
          [v16 setObject:v247 forKeyedSubscript:@"df"];
        }
        id v248 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v249 = v248;
        uint64_t v250 = v284;
        if (!v309)
        {
          v254 = v248;
          if (v284)
          {
            v255 = objc_alloc_init(SFBatteryInfo);
            v252 = v255;
            double v256 = 1.0;
            if (v112 <= 1.0) {
              double v256 = v112;
            }
            if (v256 < 0.0001) {
              double v256 = 0.0001;
            }
            [(SFBatteryInfo *)v255 setBatteryLevel:v256];
            [(SFBatteryInfo *)v252 setBatteryState:v284];
            [(SFBatteryInfo *)v252 setBatteryType:4];
            id v12 = v311;
            goto LABEL_358;
          }
          v252 = 0;
          id v12 = v311;
LABEL_360:
          v263 = v254;
LABEL_361:
          [v16 setObject:v263 forKeyedSubscript:@"batteryInfo"];
          uint64_t v264 = MEMORY[0x1E4F1CC28];
          if ((v303 & 0x40) != 0) {
            uint64_t v265 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v265 = MEMORY[0x1E4F1CC28];
          }
          [v16 setObject:v265 forKeyedSubscript:@"srConnected"];
          v266 = [*(id *)(v210 + 3792) numberWithInt:v286 & 0xF];
          [v16 setObject:v266 forKeyedSubscript:@"srAudioRoutingScore1"];

          v267 = [*(id *)(v210 + 3792) numberWithInt:v286 >> 4];
          [v16 setObject:v267 forKeyedSubscript:@"srAudioRoutingScore2"];

          v268 = [*(id *)(v210 + 3792) numberWithInt:v289 & 3];
          [v16 setObject:v268 forKeyedSubscript:@"audioIdleTime"];

          v269 = [*(id *)(v210 + 3792) numberWithInt:(v289 >> 2) & 3];
          [v16 setObject:v269 forKeyedSubscript:@"budsOutofCaseTime"];

          if ((v289 & 0x10) != 0) {
            uint64_t v270 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v270 = v264;
          }
          [v16 setObject:v270 forKeyedSubscript:@"primaryiCloudSignIn"];

LABEL_368:
          unsigned int v29 = v312;
          goto LABEL_369;
        }
        if (v282)
        {
          v251 = objc_alloc_init(SFBatteryInfo);
          v252 = v251;
          double v253 = 1.0;
          if (v208 <= 1.0) {
            double v253 = v208;
          }
          if (v253 < 0.0001) {
            double v253 = 0.0001;
          }
          [(SFBatteryInfo *)v251 setBatteryLevel:v253];
          [(SFBatteryInfo *)v252 setBatteryState:v282];
          [(SFBatteryInfo *)v252 setBatteryType:1];
          v254 = v249;
          [v249 addObject:v252];
          if (!(v284 | v280))
          {
            char v245 = 0x80;
            uint64_t v280 = 2;
            uint64_t v250 = 2;
            double v111 = 1.0;
            double v112 = 1.0;
            id v12 = v311;
LABEL_341:
            v257 = objc_alloc_init(SFBatteryInfo);

            double v258 = 1.0;
            if (v112 <= 1.0) {
              double v258 = v112;
            }
            if (v258 < 0.0001) {
              double v258 = 0.0001;
            }
            [(SFBatteryInfo *)v257 setBatteryLevel:v258];
            [(SFBatteryInfo *)v257 setBatteryState:v250];
            if (v245 < 0) {
              uint64_t v259 = 2;
            }
            else {
              uint64_t v259 = 3;
            }
            [(SFBatteryInfo *)v257 setBatteryType:v259];
            [v254 addObject:v257];
            v252 = v257;
LABEL_349:
            if (v280)
            {
              v260 = objc_alloc_init(SFBatteryInfo);

              double v261 = 1.0;
              if (v111 <= 1.0) {
                double v261 = v111;
              }
              if (v261 < 0.0001) {
                double v261 = 0.0001;
              }
              [(SFBatteryInfo *)v260 setBatteryLevel:v261];
              [(SFBatteryInfo *)v260 setBatteryState:v280];
              if (v245 < 0) {
                uint64_t v262 = 3;
              }
              else {
                uint64_t v262 = 2;
              }
              [(SFBatteryInfo *)v260 setBatteryType:v262];
              v252 = v260;
LABEL_358:
              v263 = v254;
              [v254 addObject:v252];
              goto LABEL_361;
            }
            goto LABEL_360;
          }
        }
        else
        {
          v254 = v248;
          v252 = 0;
        }
        id v12 = v311;
        if (!v284) {
          goto LABEL_349;
        }
        goto LABEL_341;
      case 2:
        uint64_t v46 = [NSNumber numberWithUnsignedShort:v18];
        [v16 setObject:v46 forKeyedSubscript:@"pid"];

        v47 = [(SFBLEScanner *)self modelWithProductID:v18];
        [v16 setObject:v47 forKeyedSubscript:@"model"];

        if (v15 < 8) {
          goto LABEL_373;
        }
        uint64_t v48 = [NSNumber numberWithUnsignedChar:*v306];
        [v16 setObject:v48 forKeyedSubscript:@"CnxM"];

        unsigned int v29 = v312;
        if (v15 < 0xE)
        {
          id v37 = 0;
          id v12 = v311;
          goto LABEL_370;
        }
        v49 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 + 8 length:6];
        [v16 setObject:v49 forKeyedSubscript:@"publicAddress"];

        id v12 = v311;
        if (v15 < 0x11) {
          goto LABEL_372;
        }
        LOBYTE(v50) = *(unsigned char *)(v14 + 14);
        v51 = [NSNumber numberWithDouble:(double)v50 / 10.0];
        [v16 setObject:v51 forKeyedSubscript:@"TxP1"];

        LOBYTE(v52) = *(unsigned char *)(v14 + 15);
        int v53 = [NSNumber numberWithDouble:(double)v52 / 10.0];
        [v16 setObject:v53 forKeyedSubscript:@"TxP2"];

        LOBYTE(v54) = *(unsigned char *)(v14 + 16);
        id v55 = [NSNumber numberWithDouble:(double)v54 / 10.0];
        int v56 = @"TxP3";
LABEL_24:
        [v16 setObject:v55 forKeyedSubscript:v56];
        goto LABEL_175;
      case 3:
        v57 = [NSNumber numberWithUnsignedShort:v18];
        [v16 setObject:v57 forKeyedSubscript:@"pid"];

        v58 = [(SFBLEScanner *)self modelWithProductID:v18];
        [v16 setObject:v58 forKeyedSubscript:@"model"];

        if (v15 < 8) {
          goto LABEL_373;
        }
        char v59 = [NSNumber numberWithUnsignedChar:*v306];
        [v16 setObject:v59 forKeyedSubscript:@"cc"];

        if (v15 < 0xB) {
          goto LABEL_373;
        }
        unsigned int v60 = *(unsigned __int8 *)(v14 + 8);
        if (v60 != 255)
        {
          char v61 = *(unsigned char *)(v14 + 9);
          if ((v61 & 3) == 1)
          {
            int v62 = objc_alloc_init(SFBatteryInfo);
            NSUInteger v63 = v62;
            if (v60 >= 0x64) {
              unsigned int v64 = 100;
            }
            else {
              unsigned int v64 = v60;
            }
            [(SFBatteryInfo *)v62 setBatteryLevel:(double)v64 / 100.0];
            if ((v61 & 0xC0) == 0x40) {
              uint64_t v65 = 2;
            }
            else {
              uint64_t v65 = 1;
            }
            [(SFBatteryInfo *)v63 setBatteryState:v65];
            [(SFBatteryInfo *)v63 setBatteryType:4];
            v319[0] = v63;
            int64_t v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v319 count:1];
            [v16 setObject:v66 forKeyedSubscript:@"batteryInfo"];
          }
        }
        id v12 = v311;
        if (v15 >= 0xD)
        {
          v67 = [NSNumber numberWithDouble:(double)*(__int16 *)(v14 + 11) / 10.0];
          [v16 setObject:v67 forKeyedSubscript:@"TxP1"];

          goto LABEL_368;
        }
        id v37 = 0;
        unsigned int v29 = v312;
        goto LABEL_370;
      case 4:
        if (v15 < 0x1B) {
          goto LABEL_373;
        }
        int v68 = self;
        char v69 = *(unsigned char *)(v14 + 7);
        unsigned int v298 = *(unsigned __int8 *)(v14 + 8);
        char v299 = *(unsigned char *)(v14 + 9);
        uint64_t v70 = *(unsigned __int8 *)(v14 + 10);
        uint64_t v71 = *(unsigned __int8 *)(v14 + 11);
        char v72 = *(unsigned char *)(v14 + 12);
        int v317 = *(_DWORD *)(v14 + 13);
        __int16 v318 = *(_WORD *)(v14 + 17);
        int v315 = *(_DWORD *)(v14 + 19);
        __int16 v316 = *(_WORD *)(v14 + 23);
        unsigned __int16 v307 = *(_WORD *)(v14 + 25);
        v305 = v68;
        char v293 = v69;
        uint64_t v73 = -[SFBLEScanner statusToHeadsetStatus:forProductID:](v68, "statusToHeadsetStatus:forProductID:");
        id v74 = [NSNumber numberWithUnsignedChar:v71];
        [v16 setObject:v74 forKeyedSubscript:@"cc"];

        v75 = [NSNumber numberWithUnsignedInt:v73];
        [v16 setObject:v75 forKeyedSubscript:@"hsStatus"];

        if ((v70 & 8) != 0) {
          uint64_t v76 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v76 = MEMORY[0x1E4F1CC28];
        }
        [v16 setObject:v76 forKeyedSubscript:@"lc"];
        v77 = [NSNumber numberWithInt:v70 & 7];
        char v310 = v73;
        if ((v73 & 0x100) != 0)
        {
          [v16 setObject:v77 forKeyedSubscript:@"locP"];

          v106 = [v11 advertisementFields];
          v79 = [v106 objectForKeyedSubscript:@"locS"];

          if (!v79) {
            goto LABEL_79;
          }
          v80 = @"locS";
        }
        else
        {
          [v16 setObject:v77 forKeyedSubscript:@"locS"];

          v78 = [v11 advertisementFields];
          v79 = [v78 objectForKeyedSubscript:@"locP"];

          if (!v79) {
            goto LABEL_79;
          }
          v80 = @"locP";
        }
        [v16 setObject:v79 forKeyedSubscript:v80];
LABEL_79:

        __int16 v314 = 0;
        [(SFBLEScanner *)v305 parseStatus3:v70 productID:v21 caseLEDColor:(char *)&v314 + 1 caseLEDStatus:&v314];
        v107 = +[SFHeadphoneProduct airPodsPro];
        id v295 = v10;
        if ([v107 productID] == v21)
        {
          BOOL v108 = 1;
        }
        else
        {
          v109 = +[SFHeadphoneProduct b698];
          if ([v109 productID] == v21)
          {
            BOOL v108 = 1;
          }
          else
          {
            v167 = +[SFHeadphoneProduct b698];
            BOOL v108 = [v167 altProductID] == v21;
          }
        }

        v168 = +[SFHeadphoneProduct airPods];
        if ([v168 productID] == v21)
        {
          int v169 = 1;
        }
        else
        {
          v170 = +[SFHeadphoneProduct airPodsSecondGeneration];
          int v169 = [v170 productID] == v21 || v108;
        }
        v171 = +[SFHeadphoneProduct airPodsMax];

        if (v312 == v171)
        {
          v173 = [NSNumber numberWithInt:v293 & 0x1F];
          v174 = @"hbT";
        }
        else
        {
          if (!v169) {
            goto LABEL_199;
          }
          if (v108) {
            uint64_t v172 = (v70 >> 4) & 1 | 2;
          }
          else {
            uint64_t v172 = (v70 >> 4) & 1;
          }
          v173 = [NSNumber numberWithUnsignedChar:v172];
          v174 = @"csVs";
        }
        [v16 setObject:v173 forKeyedSubscript:v174];

LABEL_199:
        v175 = [NSNumber numberWithUnsignedChar:HIBYTE(v314)];
        [v16 setObject:v175 forKeyedSubscript:@"csLC"];

        v176 = [NSNumber numberWithUnsignedChar:v314];
        [v16 setObject:v176 forKeyedSubscript:@"csLS"];

        v177 = [(SFBLEScanner *)v305 modelWithProductID:v21];
        [v16 setObject:v177 forKeyedSubscript:@"model"];

        v178 = [NSNumber numberWithUnsignedShort:v21];
        [v16 setObject:v178 forKeyedSubscript:@"pid"];

        v179 = [NSNumber numberWithUnsignedShort:v307];
        [v16 setObject:v179 forKeyedSubscript:@"pid2"];

        v180 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v317 length:6];
        [v16 setObject:v180 forKeyedSubscript:@"publicAddress"];

        v181 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v315 length:6];
        [v16 setObject:v181 forKeyedSubscript:@"publicAddress2"];

        if (v72) {
          [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"notMyCase"];
        }
        id v10 = v295;
        [(SFBLEScanner *)v305 pairingUpdatePairedInfo:v295 fields:v16 bleDevice:v313];
        id v182 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        int v183 = v299 & 0xF;
        double v184 = 0.0;
        if (v183 == 15)
        {
          uint64_t v185 = 0;
          double v186 = 0.0;
        }
        else
        {
          if (v183 >= 0xA) {
            int v183 = 10;
          }
          double v186 = (double)v183 / 10.0;
          if ((v299 & 0x40) != 0) {
            uint64_t v185 = 2;
          }
          else {
            uint64_t v185 = 1;
          }
        }
        int v187 = v298 & 0xF;
        if (v187 == 15)
        {
          uint64_t v188 = 0;
        }
        else
        {
          if (v187 >= 0xA) {
            int v187 = 10;
          }
          double v184 = (double)v187 / 10.0;
          if ((v299 & 0x10) != 0) {
            uint64_t v188 = 2;
          }
          else {
            uint64_t v188 = 1;
          }
        }
        int v189 = v298 >> 4;
        if (v298 >> 4 == 15)
        {
          uint64_t v190 = 0;
          double v191 = 0.0;
        }
        else
        {
          if (v189 >= 0xA) {
            int v189 = 10;
          }
          double v191 = (double)v189 / 10.0;
          if ((v299 & 0x20) != 0) {
            uint64_t v190 = 2;
          }
          else {
            uint64_t v190 = 1;
          }
        }
        if (v185)
        {
          v192 = objc_alloc_init(SFBatteryInfo);
          v193 = v192;
          double v194 = 1.0;
          if (v186 <= 1.0) {
            double v194 = v186;
          }
          if (v194 < 0.0001) {
            double v194 = 0.0001;
          }
          [(SFBatteryInfo *)v192 setBatteryLevel:v194];
          [(SFBatteryInfo *)v193 setBatteryState:v185];
          [(SFBatteryInfo *)v193 setBatteryType:1];
          [v182 addObject:v193];
          if (!(v190 | v188))
          {
            char v310 = 0x80;
            uint64_t v188 = 2;
            double v184 = 1.0;
            uint64_t v190 = 2;
            double v191 = 1.0;
          }
        }
        if (v188)
        {
          v195 = objc_alloc_init(SFBatteryInfo);
          v196 = v195;
          double v197 = 1.0;
          if (v184 <= 1.0) {
            double v197 = v184;
          }
          if (v197 < 0.0001) {
            double v197 = 0.0001;
          }
          [(SFBatteryInfo *)v195 setBatteryLevel:v197];
          [(SFBatteryInfo *)v196 setBatteryState:v188];
          if (v310 < 0) {
            uint64_t v198 = 2;
          }
          else {
            uint64_t v198 = 3;
          }
          [(SFBatteryInfo *)v196 setBatteryType:v198];
          [v182 addObject:v196];
        }
        if (v190)
        {
          v199 = objc_alloc_init(SFBatteryInfo);
          v200 = v199;
          double v201 = 1.0;
          if (v191 <= 1.0) {
            double v201 = v191;
          }
          if (v201 < 0.0001) {
            double v201 = 0.0001;
          }
          [(SFBatteryInfo *)v199 setBatteryLevel:v201];
          [(SFBatteryInfo *)v200 setBatteryState:v190];
          if (v310 < 0) {
            uint64_t v202 = 3;
          }
          else {
            uint64_t v202 = 2;
          }
          [(SFBatteryInfo *)v200 setBatteryType:v202];
          [v182 addObject:v200];
        }
        [v16 setObject:v182 forKeyedSubscript:@"batteryInfo"];

        unsigned int v29 = v312;
        id v11 = v313;
        id v12 = v311;
        goto LABEL_369;
      case 5:
        unint64_t v300 = v14 + v15;
        id v81 = [NSNumber numberWithUnsignedShort:v18];
        [v16 setObject:v81 forKeyedSubscript:@"pid"];

        v82 = [(SFBLEScanner *)self modelWithProductID:v18];
        [v16 setObject:v82 forKeyedSubscript:@"model"];

        if (v15 >= 8)
        {
          v306 = (unsigned __int8 *)(v14 + 8);
          int v83 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v14 + 7)];
          [v16 setObject:v83 forKeyedSubscript:@"osFl"];
        }
        id v12 = v311;
        unsigned int v29 = v312;
        if ((uint64_t)(v300 - (void)v306) < 1) {
          goto LABEL_369;
        }
        unsigned int v84 = *v306;
        int v85 = [NSNumber numberWithInt:v84 & 3];
        [v16 setObject:v85 forKeyedSubscript:@"osBS"];

        v86 = [NSNumber numberWithInt:(v84 >> 2) & 3];
        [v16 setObject:v86 forKeyedSubscript:@"osBP"];

        if ((uint64_t)(~(unint64_t)v306 + v300) < 1) {
          goto LABEL_369;
        }
        v87 = [NSNumber numberWithUnsignedChar:v306[1]];
        [v16 setObject:v87 forKeyedSubscript:@"osCl"];

        if ((uint64_t)(v300 - (void)v306 - 2) < 18) {
          goto LABEL_369;
        }
        id v55 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v306 + 3 length:18];
        int v56 = @"engravingData";
        goto LABEL_24;
      case 6:
        unint64_t v301 = v14 + v15;
        getWPPairingKeyAccessoryStatusDecrypted[0]();
        id v12 = v311;
        uint64_t Int64 = CFDictionaryGetInt64();
        [(SFBLEScanner *)self pairingUpdatePairedInfo:v10 fields:v16 bleDevice:v11];
        unsigned int v29 = v312;
        if (Int64)
        {
          int64_t v89 = [(SFBLEScanner *)self modelWithProductID:v21];
          [v16 setObject:v89 forKeyedSubscript:@"model"];

          v90 = [NSNumber numberWithUnsignedShort:v21];
          [v16 setObject:v90 forKeyedSubscript:@"pid"];

          int v91 = getWPPairingKeyDeviceAddress[0]();
          BOOL v92 = [v311 objectForKeyedSubscript:v91];
          [v16 setObject:v92 forKeyedSubscript:@"publicAddress"];

          int v93 = [NSNumber numberWithBool:1];
          [v16 setObject:v93 forKeyedSubscript:@"paired"];

          int var0 = self->_ucat->var0;
          if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
          {
            id v273 = v16;
            LogPrintF();
          }
          -[SFBLEScanner pairingParseAccessoryStatusPayloadPtr:end:fields:](self, "pairingParseAccessoryStatusPayloadPtr:end:fields:", v306, v301, v16, v273);
        }
        goto LABEL_369;
      default:
        id v37 = 0;
        id v12 = v311;
        unsigned int v29 = v312;
        goto LABEL_370;
    }
  }
  unsigned int v29 = 0;
LABEL_372:
  id v37 = 0;
LABEL_370:
  id v271 = v37;

  return v271;
}

- (void)pairingParseAccessoryStatusPayloadPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (a4 - a3 < 1) {
    goto LABEL_10;
  }
  char v9 = *a3;
  unsigned int v8 = a3 + 1;
  id v10 = [NSNumber numberWithInt:v9 & 7];
  [v7 setObject:v10 forKeyedSubscript:@"locP"];

  uint64_t v11 = (v9 & 4) != 0 ? MEMORY[0x1E4F1CC38] : MEMORY[0x1E4F1CC28];
  [v7 setObject:v11 forKeyedSubscript:@"lc"];
  if (a4 - v8 < 1)
  {
LABEL_10:
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  int v12 = *(unsigned __int8 *)v8;
  if (v12 != 254)
  {
    if (v12 == 255) {
      goto LABEL_20;
    }
    if ((v12 & 0x80) != 0)
    {
      uint64_t v13 = 2;
LABEL_12:
      int v14 = v12 & 0x7F;
      if (v14 >= 0x64) {
        int v14 = 100;
      }
      double v15 = (double)v14 / 100.0;
      goto LABEL_15;
    }
LABEL_11:
    uint64_t v13 = 1;
    goto LABEL_12;
  }
  double v15 = 0.8;
  uint64_t v13 = 2;
LABEL_15:
  id v16 = objc_alloc_init(SFBatteryInfo);
  uint64_t v17 = v16;
  double v18 = 1.0;
  if (v15 <= 1.0) {
    double v18 = v15;
  }
  if (v18 < 0.0001) {
    double v18 = 0.0001;
  }
  [(SFBatteryInfo *)v16 setBatteryLevel:v18];
  [(SFBatteryInfo *)v17 setBatteryState:v13];
  [(SFBatteryInfo *)v17 setBatteryType:1];
  v20[0] = v17;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v7 setObject:v19 forKeyedSubscript:@"batteryInfo"];

LABEL_20:
}

- (BOOL)pairingUpdatePairedInfo:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SFBLEScanner *)self _btSessionUsable]) {
    BOOL v11 = [(SFBLEScanner *)self pairingUpdatePairedInfoMB:v8 fields:v9 bleDevice:v10];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)pairingUpdatePairedInfoMB:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 paired];
  if (!v10 || (double Current = CFAbsoluteTimeGetCurrent(), [v10 pairCheckTime], Current - v13 > 1.0))
  {
    if (self->_btSession)
    {
      v57[0] = 0;
      v57[1] = 0;
      uint64_t v39 = 0;
      [v8 getUUIDBytes:v57];
      int v14 = softLinkBTDeviceFromIdentifier((uint64_t)self->_btSession, (uint64_t)v57, (uint64_t)&v39);
      BOOL v15 = v14 == 0;
      if (!v14)
      {
        memset(v56, 0, sizeof(v56));
        long long v55 = 0u;
        long long v54 = 0u;
        long long v53 = 0u;
        long long v52 = 0u;
        long long v51 = 0u;
        long long v50 = 0u;
        long long v49 = 0u;
        long long v48 = 0u;
        long long v47 = 0u;
        long long v46 = 0u;
        long long v45 = 0u;
        long long v44 = 0u;
        long long v43 = 0u;
        long long v42 = 0u;
        memset(v40, 0, sizeof(v40));
        __int16 v37 = 0;
        int v36 = 0;
        char v41 = 0;
        if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName[0])(v39, (uint64_t)&v41, 248)&& v41)
        {
          id v16 = [NSString stringWithUTF8String:&v41];
          [v9 setObject:v16 forKeyedSubscript:@"name"];
        }
        int v38 = 0;
        if (((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceGetPairingStatus[0])(v39, (uint64_t)&v38)) {
          uint64_t v11 = v11;
        }
        else {
          uint64_t v11 = v38 != 0;
        }
        uint64_t v17 = [NSNumber numberWithBool:v11];
        [v9 setObject:v17 forKeyedSubscript:@"paired"];

        int v35 = 0;
        ((void (*)(uint64_t, uint64_t))softLinkBTDeviceIsTemporaryPaired[0])(v39, (uint64_t)&v35);
        [v10 setTempPaired:v35 != 0];
        int v34 = 0;
        if (((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceGetConnectedServices[0])(v39, (uint64_t)&v34))
        {
          int v34 = 0;
        }
        else if (v34)
        {
          int v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
          [v9 setObject:v19 forKeyedSubscript:@"CnSv"];
        }
        id v20 = [v10 bluetoothAddress];
        if (v20)
        {
          [v9 setObject:v20 forKeyedSubscript:@"publicAddress"];
        }
        else
        {
          LOBYTE(v40[0]) = 0;
          if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])(v39, (uint64_t)v40, 32)&& LOBYTE(v40[0])&& !((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v40, (uint64_t)&v36))
          {
            unint64_t v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v36 length:6];
            [v9 setObject:v30 forKeyedSubscript:@"publicAddress"];
          }
        }
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v22 = [v9 objectForKeyedSubscript:@"name"];
        uint64_t v23 = (void *)v22;
        uint64_t v24 = "yes";
        if (!v11) {
          uint64_t v24 = "no";
        }
        uint64_t v32 = v22;
        int v33 = v24;
        int v31 = v57;
        LogPrintF();
      }
      uint64_t v11 = v11 != 0;
      if (v10) {
LABEL_29:
      }
        [v10 setPairCheckTime:CFAbsoluteTimeGetCurrent()];
    }
    else
    {
      if (self->_btStarted)
      {
        int v18 = self->_ucat->var0;
        if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
        {
          int v31 = v8;
          LogPrintF();
        }
      }
      BOOL v15 = 0;
      if (v10) {
        goto LABEL_29;
      }
    }
    if (v15) {
      goto LABEL_38;
    }
  }
  unsigned int v25 = objc_msgSend(v10, "bluetoothAddress", v31, v32, v33);
  if (v25) {
    [v9 setObject:v25 forKeyedSubscript:@"publicAddress"];
  }
  if ([v10 connectedServices])
  {
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "connectedServices"));
    [v9 setObject:v26 forKeyedSubscript:@"CnSv"];
  }
  uint64_t v27 = [v10 name];

  if (v27) {
    [v9 setObject:v27 forKeyedSubscript:@"name"];
  }
  id v28 = [NSNumber numberWithBool:v11];
  [v9 setObject:v28 forKeyedSubscript:@"paired"];

LABEL_38:
  return v11;
}

- (id)modelWithProductID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v4 = [[SFHeadphoneProduct alloc] initWithProductID:a3];
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(SFHeadphoneProduct *)v4 bluetoothModel];
LABEL_3:
    id v7 = (__CFString *)v6;
    goto LABEL_4;
  }
  if ((int)v3 <= 788)
  {
    switch(v3)
    {
      case 0x266:
        id v7 = @"ATVRemote1,1";
        break;
      case 0x26D:
        id v7 = @"ATVRemote1,2";
        break;
      case 0x314:
        id v7 = @"ATVRemote1,3";
        break;
      default:
LABEL_19:
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Device1,%u", v3);
        goto LABEL_3;
    }
  }
  else
  {
    id v7 = @"AirPods1,1";
    switch((int)v3)
    {
      case 8194:
        break;
      case 8195:
        id v7 = @"PowerBeats3,1";
        break;
      case 8196:
      case 8199:
      case 8200:
      case 8209:
      case 8210:
      case 8211:
      case 8212:
      case 8213:
      case 8214:
      case 8216:
      case 8217:
      case 8219:
      case 8220:
      case 8221:
      case 8222:
      case 8223:
      case 8224:
      case 8225:
      case 8226:
      case 8227:
      case 8228:
        goto LABEL_19;
      case 8197:
        id v7 = @"BeatsX1,1";
        break;
      case 8198:
        id v7 = @"BeatsSolo3,1";
        break;
      case 8201:
        id v7 = @"BeatsStudio3,2";
        break;
      case 8202:
        id v7 = @"Device1,8202";
        break;
      case 8203:
        id v7 = @"PowerbeatsPro1,1";
        break;
      case 8204:
        id v7 = @"BeatsSoloPro1,1";
        break;
      case 8205:
        id v7 = @"Powerbeats4,1";
        break;
      case 8206:
        id v7 = @"AirPodsPro1,1";
        break;
      case 8207:
        id v7 = @"AirPods1,3";
        break;
      case 8208:
        id v7 = @"Device1,8208";
        break;
      case 8215:
        id v7 = @"BeatsStudioPro1,1";
        break;
      case 8218:
        id v7 = @"Device1,8218";
        break;
      case 8229:
        id v7 = @"Device1,8229";
        break;
      default:
        if (v3 == 789)
        {
          id v7 = @"ATVRemote1,4";
        }
        else
        {
          if (v3 != 21760) {
            goto LABEL_19;
          }
          id v7 = @"Device1,21760";
        }
        break;
    }
  }
LABEL_4:

  return v7;
}

- (void)parseStatus3:(unsigned __int8)a3 productID:(unsigned int)a4 caseLEDColor:(unsigned __int8 *)a5 caseLEDStatus:(char *)a6
{
  uint64_t v8 = *(void *)&a4;
  unsigned int v9 = a3;
  if (a4 == 8203) {
    goto LABEL_2;
  }
  uint64_t v11 = +[SFHeadphoneProduct b507];
  if ([v11 productID] == v8) {
    goto LABEL_6;
  }
  int v12 = +[SFHeadphoneProduct b494];
  if ([v12 productID] == v8)
  {

LABEL_6:
    BOOL v10 = 1;
    goto LABEL_7;
  }
  int v18 = +[SFHeadphoneProduct b607];
  int v19 = [v18 productID];

  if (v19 == v8
    || (+[SFHeadphoneProduct b463],
        id v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 productID],
        v20,
        v21 == v8))
  {
LABEL_2:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  uint64_t v11 = +[SFHeadphoneProduct b498];
  BOOL v10 = [v11 productID] == v8;
LABEL_7:

LABEL_8:
  double v13 = [[SFHeadphoneProduct alloc] initWithProductID:v8];
  if (v10)
  {
    int v14 = (v9 >> 4) & 3;
    if (v14 == 2) {
      char v15 = 1;
    }
    else {
      char v15 = 2 * (v14 != 1);
    }
    if (v9 >= 0x40) {
      unsigned __int8 v16 = 4 * ((v9 & 0xC0) == 64);
    }
    else {
      unsigned __int8 v16 = 3;
    }
  }
  else
  {
    uint64_t v22 = v13;
    uint64_t v17 = +[SFHeadphoneProduct airPodsMax];

    double v13 = v22;
    unsigned __int8 v16 = (v9 >> 5) & 3;
    if (v22 == v17) {
      char v15 = (v9 & 0x10) != 0;
    }
    else {
      char v15 = v9 >> 7;
    }
  }
  *a5 = v16;
  *a6 = v15;
}

- (unsigned)statusToHeadsetStatus:(unsigned __int8)a3 forProductID:(unsigned __int16)a4
{
  int v4 = a4;
  unsigned int v5 = a3;
  uint64_t v6 = [[SFHeadphoneProduct alloc] initWithProductID:a4];
  id v7 = +[SFHeadphoneProduct airPodsMax];
  int v8 = [v7 altProductID];

  if (v8 == v4)
  {
    unsigned int v9 = (v5 >> 1) & 3;
    goto LABEL_18;
  }
  BOOL v10 = +[SFHeadphoneProduct airPodsMax];

  if (v6 == v10)
  {
    unsigned int v9 = (v5 >> 5) & 3;
LABEL_18:
    if (v9 == 3) {
      int v16 = 8;
    }
    else {
      int v16 = dword_1A56EA6D0[v9];
    }
    goto LABEL_21;
  }
  int v11 = v5 & 1;
  int v12 = (v5 >> 1) & 3;
  if (v12 == 1) {
    int v11 = v5 & 1 | 4;
  }
  if (v12 == 2) {
    int v11 = v5 & 1 | 2;
  }
  if (v12 == 3) {
    int v11 = v5 & 1 | 8;
  }
  int v13 = (v5 >> 3) & 3;
  int v14 = v11 | 0x40;
  int v15 = v11 | 0x10;
  if (v13 == 1) {
    v11 |= 0x20u;
  }
  if (v13 == 2) {
    int v11 = v15;
  }
  if (v13 == 3) {
    int v11 = v14;
  }
  int v16 = (4 * v5) & 0x180 ^ 0x100 | v11;
LABEL_21:
  if ((v5 & 0x80u) == 0) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = v16 | 0x200;
  }

  return v17;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSData)payloadFilterMask
{
  return self->_payloadFilterMask;
}

- (double)rescanInterval
{
  return self->_rescanInterval;
}

- (void)setRescanInterval:(double)a3
{
  self->_reint64_t scanInterval = a3;
}

- (BOOL)rssiLog
{
  return self->_rssiLog;
}

- (void)setRssiLog:(BOOL)a3
{
  self->_rssiLog = a3;
}

- (BOOL)rssiLogStdOut
{
  return self->_rssiLogStdOut;
}

- (void)setRssiLogStdOut:(BOOL)a3
{
  self->_rssiLogStdOut = a3;
}

- (SFBLERecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
}

- (int64_t)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(int64_t)a3
{
  self->_int64_t scanInterval = a3;
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (int64_t)scanWindow
{
  return self->_scanWindow;
}

- (void)setScanWindow:(int64_t)a3
{
  self->_int64_t scanWindow = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

@end