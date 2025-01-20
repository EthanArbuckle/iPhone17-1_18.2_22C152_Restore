@interface BTShareAudioSessionDaemon
- (BTShareAudioSessionDaemon)init;
- (CUBluetoothDevice)wxDevice;
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFDevice)darwinDevice;
- (id)progressHandler;
- (int)_runAdvertiser;
- (int)_runConfirm;
- (int)_runConnectGuestHeadphones;
- (int)_runFinish;
- (int)_runGuestiOSConnect;
- (int)_runGuestiOSPairSetupPublic;
- (int)_runGuestiOSShareAudio;
- (int)_runGuestiOSShareAudioConnect;
- (int)_runInit;
- (int)_runScannerNearbyInfo;
- (int)_runScannerProxPairing;
- (int)_runShareAudioServiceStart;
- (int)_runShowHeadphonesPairingInstructions;
- (int)_runWaitForConfigRequestOrProxTrigger;
- (int)_runWaitForConnectRequest;
- (int)_runWaitForGuestHeadphones;
- (int)_runWaitForGuestHeadphonesPairingMode;
- (int)_runWaitForProxTrigger;
- (int)mode;
- (void)_bleScannerNearbyInfoDeviceFound:(id)a3;
- (void)_bleScannerProxPairingDeviceFound:(id)a3;
- (void)_cleanup;
- (void)_invalidate;
- (void)_pickableRoutesChanged;
- (void)_pickableRoutesChanged:(id)a3;
- (void)_reportError:(id)a3;
- (void)_reportProgress:(int)a3;
- (void)_reportProgress:(int)a3 info:(id)a4;
- (void)_reportProgressTriggeredDevice:(int)a3;
- (void)_run;
- (void)_runDefault;
- (void)_runGuestiOSShareAudioConnectProcessResponse:(id)a3 error:(id)a4;
- (void)_runGuestiOSShareAudioConnectSendRequest;
- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4;
- (void)_runGuestiOSShareAudioSendRequest;
- (void)_runShareAudioServiceConfigRequest:(id)a3 responseHandler:(id)a4;
- (void)_runShareAudioServiceConfigResponse:(id)a3;
- (void)_runShareAudioServiceConnectRequest:(id)a3 responseHandler:(id)a4;
- (void)_runStory6TV;
- (void)_runStory6iOS;
- (void)activate;
- (void)invalidate;
- (void)setDarwinDevice:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMode:(int)a3;
- (void)setProgressHandler:(id)a3;
- (void)setStatusMonitor:(id)a3;
- (void)setWxDevice:(id)a3;
- (void)userConfirmed:(BOOL)a3;
@end

@implementation BTShareAudioSessionDaemon

- (BTShareAudioSessionDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTShareAudioSessionDaemon;
  v2 = [(BTShareAudioSessionDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009FF40;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0078;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    [(BTShareAudioSessionDaemon *)self _reportProgress:20];
    [(BTShareAudioSessionDaemon *)self _cleanup];
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_run
{
  int mode = self->_mode;
  if (mode == 2)
  {
    [(BTShareAudioSessionDaemon *)self _runStory6TV];
  }
  else if (mode == 1)
  {
    [(BTShareAudioSessionDaemon *)self _runStory6iOS];
  }
  else
  {
    [(BTShareAudioSessionDaemon *)self _runDefault];
  }
}

- (void)_runDefault
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = [(BTShareAudioSessionDaemon *)self _runInit];
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = [(BTShareAudioSessionDaemon *)self _runScannerProxPairing];
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = [(BTShareAudioSessionDaemon *)self _runScannerNearbyInfo];
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = [(BTShareAudioSessionDaemon *)self _runAdvertiser];
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = [(BTShareAudioSessionDaemon *)self _runWaitForProxTrigger];
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = [(BTShareAudioSessionDaemon *)self _runConfirm];
              if (v8 == 4 || v8 == 2)
              {
                if (self->_triggerediOS)
                {
                  unsigned int v9 = [(BTShareAudioSessionDaemon *)self _runGuestiOSConnect];
                  if (v9 != 4 && v9 != 2) {
                    return;
                  }
                  unsigned int v10 = [(BTShareAudioSessionDaemon *)self _runGuestiOSPairSetupPublic];
                  if (v10 != 4 && v10 != 2) {
                    return;
                  }
                  unsigned int v11 = [(BTShareAudioSessionDaemon *)self _runGuestiOSShareAudio];
                  if (v11 != 2 && v11 != 4) {
                    return;
                  }
                }
                else if (([(SFDevice *)self->_triggeredDevice paired] & 1) == 0)
                {
                  unsigned int v12 = [(BTShareAudioSessionDaemon *)self _runShowHeadphonesPairingInstructions];
                  if (v12 != 4 && v12 != 2) {
                    return;
                  }
                  unsigned int v13 = [(BTShareAudioSessionDaemon *)self _runWaitForGuestHeadphonesPairingMode];
                  if (v13 != 4 && v13 != 2) {
                    return;
                  }
                }
                unsigned int v14 = [(BTShareAudioSessionDaemon *)self _runConnectGuestHeadphones];
                if (v14 == 4 || v14 == 2)
                {
                  unsigned int v15 = [(BTShareAudioSessionDaemon *)self _runWaitForGuestHeadphones];
                  if (v15 == 4 || v15 == 2)
                  {
                    [(BTShareAudioSessionDaemon *)self _runFinish];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_runStory6iOS
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = [(BTShareAudioSessionDaemon *)self _runInit];
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = [(BTShareAudioSessionDaemon *)self _runGuestiOSConnect];
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = [(BTShareAudioSessionDaemon *)self _runGuestiOSPairSetupPublic];
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = [(BTShareAudioSessionDaemon *)self _runGuestiOSShareAudio];
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = [(BTShareAudioSessionDaemon *)self _runConnectGuestHeadphones];
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = [(BTShareAudioSessionDaemon *)self _runGuestiOSShareAudioConnect];
              if (v8 == 4 || v8 == 2)
              {
                [(BTShareAudioSessionDaemon *)self _runFinish];
              }
            }
          }
        }
      }
    }
  }
}

- (void)_runStory6TV
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = [(BTShareAudioSessionDaemon *)self _runInit];
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = [(BTShareAudioSessionDaemon *)self _runScannerProxPairing];
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = [(BTShareAudioSessionDaemon *)self _runShareAudioServiceStart];
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = [(BTShareAudioSessionDaemon *)self _runAdvertiser];
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = [(BTShareAudioSessionDaemon *)self _runWaitForConfigRequestOrProxTrigger];
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = [(BTShareAudioSessionDaemon *)self _runConfirm];
              if (v8 == 4 || v8 == 2)
              {
                if (self->_configRequestReceived)
                {
                  unsigned int v9 = [(BTShareAudioSessionDaemon *)self _runWaitForConnectRequest];
                  if (v9 != 2 && v9 != 4) {
                    return;
                  }
                }
                else if (([(SFDevice *)self->_triggeredDevice paired] & 1) == 0)
                {
                  unsigned int v10 = [(BTShareAudioSessionDaemon *)self _runShowHeadphonesPairingInstructions];
                  if (v10 != 4 && v10 != 2) {
                    return;
                  }
                  unsigned int v11 = [(BTShareAudioSessionDaemon *)self _runWaitForGuestHeadphonesPairingMode];
                  if (v11 != 4 && v11 != 2) {
                    return;
                  }
                }
                unsigned int v12 = [(BTShareAudioSessionDaemon *)self _runConnectGuestHeadphones];
                if (v12 == 4 || v12 == 2)
                {
                  unsigned int v13 = [(BTShareAudioSessionDaemon *)self _runWaitForGuestHeadphones];
                  if (v13 == 4 || v13 == 2)
                  {
                    [(BTShareAudioSessionDaemon *)self _runFinish];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runInit
{
  if (!self->_initialized)
  {
    self->_prefHeadphoneTrigger = CFPrefs_GetInt64() != 0;
    self->_prefiOSTrigger = CFPrefs_GetInt64() != 0;
    uint64_t Int64 = CFPrefs_GetInt64();
    if (Int64 <= 0x7FFFFFFF && Int64 >= (uint64_t)0xFFFFFFFF80000000) {
      int v6 = Int64;
    }
    else {
      int v6 = -1;
    }
    self->_prefOverrideColorCode = v6;
    uint64_t v7 = CFPrefs_GetInt64();
    if (v7 <= 0x7FFFFFFF && v7 >= (uint64_t)0xFFFFFFFF80000000) {
      int v10 = v7;
    }
    else {
      int v10 = -1;
    }
    self->_prefOverrideProductID = v10;
    uint64_t v11 = CFPrefs_GetInt64();
    if ((unint64_t)(v11 - 1000) < 0xFFFFFFFFFFFFF831 || v11 == 0) {
      int v13 = -40;
    }
    else {
      int v13 = v11;
    }
    self->_prefRSSIThreshold = v13;
    self->_prefRespectDeviceSupport = CFPrefs_GetInt64() == 0;
    if (!self->_preventProxCardsClient)
    {
      unsigned int v14 = (SFClient *)objc_alloc_init((Class)SFClient);
      preventProxCardsClient = self->_preventProxCardsClient;
      self->_preventProxCardsClient = v14;

      [(SFClient *)self->_preventProxCardsClient activateAssertionWithIdentifier:@"com.apple.sharing.PreventProxCards"];
    }
    self->_initialized = 1;
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  return 4;
}

- (int)_runScannerProxPairing
{
  if (!self->_prefHeadphoneTrigger) {
    return 2;
  }
  if (self->_configRequestReceived || self->_triggeredDevice && self->_triggeredNeedsSetupDevice)
  {
    if (self->_bleProxPairingScanner)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFDeviceDiscovery *)self->_bleProxPairingScanner invalidate];
      bleProxPairingScanner = self->_bleProxPairingScanner;
      self->_bleProxPairingScanner = 0;
    }
    return 2;
  }
  if (!self->_bleProxPairingScanner)
  {
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v5 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    int v6 = self->_bleProxPairingScanner;
    self->_bleProxPairingScanner = v5;
    uint64_t v7 = v5;

    [(SFDeviceDiscovery *)v7 setChangeFlags:13];
    [(SFDeviceDiscovery *)v7 setDiscoveryFlags:2];
    [(SFDeviceDiscovery *)v7 setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)v7 setPurpose:@"ShareAudio"];
    [(SFDeviceDiscovery *)v7 setScanRate:50];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A09FC;
    v10[3] = &unk_100233888;
    v10[4] = v7;
    v10[5] = self;
    [(SFDeviceDiscovery *)v7 setDeviceFoundHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A0A18;
    v9[3] = &unk_1002338B0;
    v9[4] = v7;
    v9[5] = self;
    [(SFDeviceDiscovery *)v7 setDeviceChangedHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A0A34;
    v8[3] = &unk_100232A38;
    v8[4] = v7;
    v8[5] = self;
    [(SFDeviceDiscovery *)v7 activateWithCompletion:v8];
  }
  return 4;
}

- (int)_runScannerNearbyInfo
{
  if (!self->_prefiOSTrigger) {
    return 2;
  }
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  if (self->_triggeredDevice)
  {
    if (bleNearbyInfoScanner)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFDeviceDiscovery *)self->_bleNearbyInfoScanner invalidate];
      unsigned int v4 = self->_bleNearbyInfoScanner;
      self->_bleNearbyInfoScanner = 0;
    }
    return 2;
  }
  if (!bleNearbyInfoScanner)
  {
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    uint64_t v7 = self->_bleNearbyInfoScanner;
    self->_bleNearbyInfoScanner = v6;
    unsigned int v8 = v6;

    [(SFDeviceDiscovery *)v8 setChangeFlags:13];
    [(SFDeviceDiscovery *)v8 setDiscoveryFlags:1];
    [(SFDeviceDiscovery *)v8 setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)v8 setPurpose:@"ShareAudio"];
    [(SFDeviceDiscovery *)v8 setScanRate:50];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A0DBC;
    v11[3] = &unk_100233888;
    v11[4] = v8;
    v11[5] = self;
    [(SFDeviceDiscovery *)v8 setDeviceFoundHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A0DD8;
    v10[3] = &unk_1002338B0;
    v10[4] = v8;
    v10[5] = self;
    [(SFDeviceDiscovery *)v8 setDeviceChangedHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A0DF4;
    v9[3] = &unk_100232A38;
    v9[4] = v8;
    v9[5] = self;
    [(SFDeviceDiscovery *)v8 activateWithCompletion:v9];
  }
  return 4;
}

- (int)_runShareAudioServiceStart
{
  if (!self->_shareAudioService)
  {
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v3 = objc_alloc_init(BTShareAudioService);
    shareAudioService = self->_shareAudioService;
    self->_shareAudioService = v3;
    unsigned int v5 = v3;

    dispatch_queue_t v6 = dispatch_queue_create("ShareAudioService", 0);
    [(BTShareAudioService *)v5 setDispatchQueue:v6];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A1094;
    v9[3] = &unk_100235CA8;
    v9[4] = v5;
    v9[5] = self;
    [(BTShareAudioService *)v5 setConfigRequestHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A1144;
    v8[3] = &unk_100235CA8;
    v8[4] = v5;
    v8[5] = self;
    [(BTShareAudioService *)v5 setConnectRequestHandler:v8];
    [(BTShareAudioService *)v5 activate];
  }
  return 4;
}

- (void)_runShareAudioServiceConfigRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000A14A4;
  v24 = sub_1000A14B4;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A14BC;
  v17[3] = &unk_1002330A0;
  v19 = &v20;
  id v7 = a4;
  id v18 = v7;
  unsigned int v8 = objc_retainBlock(v17);
  if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_configResponseHandler)
  {
    uint64_t v14 = BTErrorF();
    unsigned int v9 = (void *)v21[5];
    v21[5] = v14;
  }
  else
  {
    CFStringGetTypeID();
    unsigned int v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_guestHeadphonesAddress, v9);
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      int v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      guestHeadphonesName = self->_guestHeadphonesName;
      self->_guestHeadphonesName = v10;

      self->_guestHeadphonesProductID = CFDictionaryGetInt64Ranged();
      id v12 = objc_retainBlock(v7);
      id configResponseHandler = self->_configResponseHandler;
      self->_id configResponseHandler = v12;

      self->_configRequestReceived = 1;
      [(BTShareAudioSessionDaemon *)self _reportProgressTriggeredDevice:100];
      [(BTShareAudioSessionDaemon *)self _run];
    }
    else
    {
      uint64_t v15 = BTErrorF();
      v16 = (void *)v21[5];
      v21[5] = v15;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v20, 8);
}

- (void)_runShareAudioServiceConfigResponse:(id)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1000A14A4;
  uint64_t v15 = sub_1000A14B4;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A17A4;
  v8[3] = &unk_1002330A0;
  int v10 = &v11;
  id v3 = a3;
  id v9 = v3;
  unsigned int v4 = objc_retainBlock(v8);
  unsigned int v5 = (void *)MGCopyAnswer();
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [v6 setObject:v5 forKeyedSubscript:@"btAd"];
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v3 + 2))(v3, 0, 0, v6);
  }
  else
  {
    uint64_t v7 = BTErrorF();
    id v6 = (id)v12[5];
    v12[5] = v7;
  }

  ((void (*)(void *))v4[2])(v4);
  _Block_object_dispose(&v11, 8);
}

- (void)_runShareAudioServiceConnectRequest:(id)a3 responseHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v7 = objc_retainBlock(v6);
  id connectResponseHandler = self->_connectResponseHandler;
  self->_id connectResponseHandler = v7;

  self->_connectRequestReceived = 1;
  [(BTShareAudioSessionDaemon *)self _run];
}

- (int)_runAdvertiser
{
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (self->_triggeredDevice)
  {
    if (bleNearbyActionAdvertiser)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFService *)self->_bleNearbyActionAdvertiser invalidate];
      unsigned int v5 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = 0;
    }
    return 2;
  }
  else
  {
    if (!bleNearbyActionAdvertiser)
    {
      int DeviceClass = GestaltGetDeviceClass();
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v7 = (SFService *)objc_alloc_init((Class)SFService);
      unsigned int v8 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = v7;
      id v9 = v7;

      [(SFService *)v9 setAdvertiseRate:60];
      if (DeviceClass == 4) {
        uint64_t v10 = 31;
      }
      else {
        uint64_t v10 = 27;
      }
      [(SFService *)v9 setDeviceActionType:v10];
      [(SFService *)v9 setDispatchQueue:self->_dispatchQueue];
      [(SFService *)v9 setIdentifier:@"a5989962-d94b-4755-bbca-59ecf498ad2f"];
      [(SFService *)v9 setLabel:@"ShareAudio"];
      [(SFService *)v9 setNeedsSetup:1];
      [(SFService *)v9 setPairSetupDisabled:1];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000A1B3C;
      v11[3] = &unk_100232A38;
      v11[4] = v9;
      v11[5] = self;
      [(SFService *)v9 activateWithCompletion:v11];
    }
    return 4;
  }
}

- (int)_runWaitForConfigRequestOrProxTrigger
{
  BOOL configRequestReceived = self->_configRequestReceived;
  int result = 4;
  if (!configRequestReceived)
  {
    if (self->_triggeredDevice) {
      return 4;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (int)_runWaitForProxTrigger
{
  if (self->_triggeredDevice) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int)_runWaitForConnectRequest
{
  if (self->_connectRequestReceived) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int)_runConfirm
{
  int confirmState = self->_confirmState;
  if (confirmState == 4)
  {
    id v4 = objc_retainBlock(self->_configResponseHandler);
    id configResponseHandler = self->_configResponseHandler;
    self->_id configResponseHandler = 0;

    if (v4) {
      [(BTShareAudioSessionDaemon *)self _runShareAudioServiceConfigResponse:v4];
    }
  }
  else if (confirmState != 2)
  {
    if (confirmState)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
      {
        triggeredDevice = self->_triggeredDevice;
        LogPrintF();
      }
      self->_int confirmState = 1;
      -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100, triggeredDevice);
    }
  }
  return self->_confirmState;
}

- (int)_runGuestiOSConnect
{
  int guestiOSConnectState = self->_guestiOSConnectState;
  if (guestiOSConnectState != 4 && guestiOSConnectState != 2)
  {
    if (guestiOSConnectState)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_int guestiOSConnectState = 1;
      [(BTShareAudioSessionDaemon *)self _reportProgressTriggeredDevice:200];
      id v5 = objc_alloc_init((Class)SFSession);
      objc_storeStrong((id *)&self->_guestiOSSession, v5);
      [v5 setDispatchQueue:self->_dispatchQueue];
      [v5 setLabel:@"ShareAudio"];
      darwinDevice = self->_darwinDevice;
      if (!darwinDevice) {
        darwinDevice = self->_triggeredDevice;
      }
      [v5 setPeerDevice:darwinDevice];
      [v5 setServiceIdentifier:@"com.apple.sharing.ShareAudio"];
      [v5 setSessionFlags:1];
      [v5 setStatusMonitor:self->_statusMonitor];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000A20E4;
      v12[3] = &unk_100232A38;
      v12[4] = v5;
      v12[5] = self;
      [v5 setErrorHandler:v12];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000A2208;
      v11[3] = &unk_100232A10;
      v11[4] = v5;
      v11[5] = self;
      [v5 setInterruptionHandler:v11];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000A228C;
      v10[3] = &unk_100232A10;
      v10[4] = v5;
      v10[5] = self;
      [v5 setInvalidationHandler:v10];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000A2310;
      v9[3] = &unk_100232A10;
      v9[4] = v5;
      v9[5] = self;
      [v5 setSessionStartedHandler:v9];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000A23C4;
      v8[3] = &unk_100232A38;
      void v8[4] = v5;
      v8[5] = self;
      [v5 activateWithCompletion:v8];
    }
  }
  return self->_guestiOSConnectState;
}

- (int)_runGuestiOSPairSetupPublic
{
  int guestiOSPairSetupPublicState = self->_guestiOSPairSetupPublicState;
  if (guestiOSPairSetupPublicState != 4 && guestiOSPairSetupPublicState != 2)
  {
    if (guestiOSPairSetupPublicState)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_int guestiOSPairSetupPublicState = 1;
      id v5 = self->_guestiOSSession;
      [(SFSession *)v5 setFixedPIN:@"public"];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000A2664;
      v7[3] = &unk_100232A38;
      v7[4] = v5;
      v7[5] = self;
      [(SFSession *)v5 pairSetupWithFlags:16 completion:v7];
    }
  }
  return self->_guestiOSPairSetupPublicState;
}

- (int)_runGuestiOSShareAudio
{
  int guestiOSShareAudioState = self->_guestiOSShareAudioState;
  if (guestiOSShareAudioState != 4 && guestiOSShareAudioState != 2)
  {
    if (guestiOSShareAudioState)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      self->_int guestiOSShareAudioState = 1;
      [(BTShareAudioSessionDaemon *)self _runGuestiOSShareAudioSendRequest];
    }
  }
  return self->_guestiOSShareAudioState;
}

- (void)_runGuestiOSShareAudioSendRequest
{
  if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(CUBluetoothDevice *)self->_wxDevice addressString];
  if (v4 || (id v4 = (void *)MGCopyAnswer()) != 0)
  {
    [v3 setObject:v4 forKeyedSubscript:@"btAd"];
    id v5 = [(CUBluetoothDevice *)self->_wxDevice name];
    if (v5 || (id v5 = (void *)GestaltCopyAnswer()) != 0)
    {
      [v3 setObject:v5 forKeyedSubscript:@"dname"];
    }
    id v6 = [(CUBluetoothDevice *)self->_wxDevice productIdentifier];
    if (v6)
    {
      id v7 = +[NSNumber numberWithUnsignedInt:v6];
      [v3 setObject:v7 forKeyedSubscript:@"productID"];
    }
    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A2AA4;
    v11[3] = &unk_100233C40;
    v11[4] = guestiOSSession;
    v11[5] = self;
    void v11[6] = v3;
    uint64_t v10 = guestiOSSession;
    [(SFSession *)v10 appleIDAddProof:v3 dispatchQueue:dispatchQueue completion:v11];
  }
  else
  {
    if (dword_1002617D8 <= 90 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_int guestiOSShareAudioState = 3;
    id v4 = NSErrorF();
    [(BTShareAudioSessionDaemon *)self _reportError:v4];
  }
}

- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  if (v9)
  {
    if (dword_1002617D8 <= 90 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v9;
      LogPrintF();
    }
    self->_int guestiOSShareAudioState = 3;
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v9, v13);
  }
  else
  {
    if (v8)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v10 = self->_guestiOSSession;
      dispatchQueue = self->_dispatchQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000A2E88;
      v14[3] = &unk_100235CF8;
      uint64_t v15 = v10;
      id v16 = self;
      id v17 = v8;
      id v12 = v10;
      [(SFSession *)v12 appleIDVerifyProof:v17 dispatchQueue:dispatchQueue completion:v14];
    }
    else
    {
      if (dword_1002617D8 <= 90 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_int guestiOSShareAudioState = 3;
      NSErrorF();
      id v12 = (SFSession *)objc_claimAutoreleasedReturnValue();
      [(BTShareAudioSessionDaemon *)self _reportError:v12];
    }
  }
}

- (int)_runGuestiOSShareAudioConnect
{
  int guestiOSShareAudioConnectState = self->_guestiOSShareAudioConnectState;
  if (guestiOSShareAudioConnectState != 4 && guestiOSShareAudioConnectState != 2)
  {
    if (guestiOSShareAudioConnectState)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      self->_int guestiOSShareAudioConnectState = 1;
      [(BTShareAudioSessionDaemon *)self _runGuestiOSShareAudioConnectSendRequest];
    }
  }
  return self->_guestiOSShareAudioConnectState;
}

- (void)_runGuestiOSShareAudioConnectSendRequest
{
  if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  guestiOSSession = self->_guestiOSSession;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A32D8;
  v6[3] = &unk_100235CD0;
  v6[4] = guestiOSSession;
  v6[5] = self;
  id v5 = guestiOSSession;
  [(SFSession *)v5 sendRequestID:@"_shCn" options:0 request:v3 responseHandler:v6];
}

- (void)_runGuestiOSShareAudioConnectProcessResponse:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (dword_1002617D8 <= 90 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v6;
      LogPrintF();
    }
    self->_int guestiOSShareAudioConnectState = 3;
    -[BTShareAudioSessionDaemon _reportError:](self, "_reportError:", v6, v7);
  }
  else
  {
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v8;
      LogPrintF();
    }
    self->_int guestiOSShareAudioConnectState = 4;
    [(BTShareAudioSessionDaemon *)self _run];
  }
}

- (int)_runShowHeadphonesPairingInstructions
{
  int result = self->_guestHeadphonesInstructionsState;
  if (!result)
  {
    if (!self->_triggeredNeedsSetupDevice)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
      {
        triggeredDevice = self->_triggeredDevice;
        LogPrintF();
        -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120, triggeredDevice);
      }
      else
      {
        -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120, v4);
      }
    }
    int result = 4;
    self->_guestHeadphonesInstructionsState = 4;
  }
  return result;
}

- (int)_runWaitForGuestHeadphonesPairingMode
{
  if (self->_triggeredNeedsSetupDevice) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int)_runConnectGuestHeadphones
{
  int result = self->_guestHeadphonesConnectState;
  if (!result)
  {
    uint64_t v4 = [(CUBluetoothDevice *)self->_wxDevice addressString];
    guestHeadphonesAddress = v4;
    if (!v4) {
      guestHeadphonesAddress = self->_guestHeadphonesAddress;
    }
    id v6 = guestHeadphonesAddress;

    guestiOSSession = self->_guestiOSSession;
    if (guestiOSSession)
    {
      id v8 = guestiOSSession;
    }
    else
    {
      id v8 = [(BTShareAudioService *)self->_shareAudioService sfSession];
    }
    id v9 = v8;
    uint64_t v10 = [(SFSession *)v8 pairingDeriveKeyForIdentifier:@"ShareAudio" keyLength:16];
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      guestDeviceAddress = self->_guestDeviceAddress;
      uint64_t v14 = v10;
      id v12 = v6;
      LogPrintF();
    }
    self->_guestHeadphonesConnectState = 1;
    -[BTShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 300, v12, guestDeviceAddress, v14);
    id v11 = objc_alloc_init((Class)BTBluetoothPairingSession);
    objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, v11);
    [v11 setDeviceAddress:v6];
    [v11 setDispatchQueue:self->_dispatchQueue];
    if (self->_triggerediOS || ![(SFDevice *)self->_triggeredDevice paired])
    {
      if (self->_guestDeviceAddress) {
        [v11 setGuestAddress:];
      }
      [v11 setGuestKey:v10];
      [v11 setGuestMode:1];
      [v11 setGuestPermanent:self->_confirmPermanent];
      if (self->_triggerediOS && !self->_guestiOSContact || self->_mode == 1) {
        [v11 setUserNotInContacts:1];
      }
    }
    else
    {
      [v11 setAggregate:1];
      [v11 setConnectOnly:1];
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A371C;
    v15[3] = &unk_100232A38;
    v15[4] = v11;
    v15[5] = self;
    [v11 setCompletionHandler:v15];
    [v11 activate];

    return self->_guestHeadphonesConnectState;
  }
  return result;
}

- (int)_runWaitForGuestHeadphones
{
  int guestiOSWaitForRouteState = self->_guestiOSWaitForRouteState;
  if (guestiOSWaitForRouteState != 4 && guestiOSWaitForRouteState != 2)
  {
    if (guestiOSWaitForRouteState)
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
      {
        guestHeadphonesAddress = self->_guestHeadphonesAddress;
        LogPrintF();
      }
      self->_int guestiOSWaitForRouteState = 1;
      -[BTShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 320, guestHeadphonesAddress);
      id v5 = +[AVSystemController sharedAVSystemController];
      id v6 = +[NSArray arrayWithObject:AVSystemController_PickableRoutesDidChangeNotification];
      [v5 setAttribute:v6 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
      id v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:self selector:"_pickableRoutesChanged:" name:AVSystemController_PickableRoutesDidChangeNotification object:v5];
      self->_observingPickableRoutes = 1;
      [(BTShareAudioSessionDaemon *)self _pickableRoutesChanged];
    }
  }
  return self->_guestiOSWaitForRouteState;
}

- (int)_runFinish
{
  id v3 = objc_retainBlock(self->_connectResponseHandler);
  if (v3)
  {
    if (dword_1002617D8 < 31 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, &__NSDictionary0__struct);
    id connectResponseHandler = self->_connectResponseHandler;
    self->_id connectResponseHandler = 0;
  }
  id v5 = self->_guestHeadphonesRouteUID;
  if (v5)
  {
    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v5;
      LogPrintF();
    }
    CFStringRef v12 = @"mediaRouteID";
    id v13 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1, v9);
    [(BTShareAudioSessionDaemon *)self _reportProgress:40 info:v6];
  }
  else
  {
    if (dword_1002617D8 <= 90 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v10 = @"error";
    id v6 = NSErrorWithOSStatusF();
    id v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(BTShareAudioSessionDaemon *)self _reportProgress:50 info:v7];
  }
  [(BTShareAudioSessionDaemon *)self _cleanup];

  return 4;
}

- (void)_cleanup
{
  id v3 = objc_retainBlock(self->_configResponseHandler);
  if (v3)
  {
    uint64_t v4 = BTErrorF();
    if (dword_1002617D8 < 91 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      v21 = v4;
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v3 + 2))(v3, v4, 0, 0);
    id configResponseHandler = self->_configResponseHandler;
    self->_id configResponseHandler = 0;
  }
  id v6 = objc_retainBlock(self->_connectResponseHandler);
  if (v6)
  {
    id v7 = BTErrorF();
    if (dword_1002617D8 < 91 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
    {
      v21 = v7;
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, v7, 0, 0);
    id connectResponseHandler = self->_connectResponseHandler;
    self->_id connectResponseHandler = 0;
  }
  [(SFService *)self->_bleNearbyActionAdvertiser invalidate];
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0;

  [(SFDeviceDiscovery *)self->_bleNearbyInfoScanner invalidate];
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  self->_bleNearbyInfoScanner = 0;

  [(SFDeviceDiscovery *)self->_bleProxPairingScanner invalidate];
  bleProxPairingScanner = self->_bleProxPairingScanner;
  self->_bleProxPairingScanner = 0;

  self->_guestHeadphonesConnectState = 0;
  guestHeadphonesAddress = self->_guestHeadphonesAddress;
  self->_guestHeadphonesAddress = 0;

  [(BTBluetoothPairingSession *)self->_guestHeadphonesPairingSession invalidate];
  guestHeadphonesPairingSession = self->_guestHeadphonesPairingSession;
  self->_guestHeadphonesPairingSession = 0;

  [(SFSession *)self->_guestiOSSession invalidate];
  guestiOSSession = self->_guestiOSSession;
  self->_guestiOSSession = 0;

  if (self->_observingPickableRoutes)
  {
    uint64_t v15 = +[NSNotificationCenter defaultCenter];
    [v15 removeObserver:self name:AVSystemController_PickableRoutesDidChangeNotification object:0];
    self->_observingPickableRoutes = 0;
  }
  [(SFClient *)self->_preventProxCardsClient invalidate];
  preventProxCardsClient = self->_preventProxCardsClient;
  self->_preventProxCardsClient = 0;

  [(BTShareAudioService *)self->_shareAudioService invalidate];
  shareAudioService = self->_shareAudioService;
  self->_shareAudioService = 0;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  triggeredDevice = self->_triggeredDevice;
  self->_triggeredDevice = 0;

  triggeredNeedsSetupDevice = self->_triggeredNeedsSetupDevice;
  self->_triggeredNeedsSetupDevice = 0;

  self->_triggerediOS = 0;
}

- (void)_bleScannerNearbyInfoDeviceFound:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (!self->_triggeredDevice)
  {
    id v9 = (void *)v5;
    uint64_t v5 = (uint64_t)[(id)v5 paired];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v9;
      if (dword_1002617D8 <= 10)
      {
        if (dword_1002617D8 != -1) {
          goto LABEL_24;
        }
        uint64_t v5 = _LogCategory_Initialize();
        uint64_t v6 = (uint64_t)v9;
        if (v5) {
          goto LABEL_24;
        }
      }
    }
    else
    {
      uint64_t v5 = (uint64_t)[v9 deviceFlags];
      if ((v5 & 0x800) != 0)
      {
        id v7 = [v9 bleDevice];
        int v8 = [v7 rssiEstimate];
        if (v8 < 0 && v8 >= self->_prefRSSIThreshold)
        {
          if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          objc_storeStrong((id *)&self->_triggeredDevice, a3);
          self->_triggerediOS = 1;
          [(BTShareAudioSessionDaemon *)self _run];
        }
        else if (dword_1002617D8 <= 10 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_12;
      }
      uint64_t v6 = (uint64_t)v9;
      if (dword_1002617D8 <= 10)
      {
        if (dword_1002617D8 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v6 = (uint64_t)v9, v5))
        {
LABEL_24:
          uint64_t v5 = LogPrintF();
LABEL_12:
          uint64_t v6 = (uint64_t)v9;
        }
      }
    }
  }

  _objc_release_x1(v5, v6);
}

- (void)_bleScannerProxPairingDeviceFound:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  uint64_t v6 = v5;
  p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
  if (!self->_triggeredNeedsSetupDevice)
  {
    unsigned int v8 = [v5 needsSetup];
    if ((v8 & 1) != 0 || !self->_triggeredDevice)
    {
      id v9 = [v6 bleDevice];
      CFStringRef v10 = [v9 advertisementFields];

      if ((v8 & 1) != 0
        || !self->_prefRespectDeviceSupport
        || ([v6 deviceFlags] & 0x800) != 0)
      {
        if ((CFDictionaryGetInt64Ranged() & 0x24) != 0)
        {
          if (dword_1002617D8 > 10 || dword_1002617D8 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_45;
          }
        }
        else
        {
          if (!CFDictionaryGetInt64())
          {
            id v11 = [v6 bleDevice];
            id v12 = [v11 smoothedRSSI];
            id v13 = v12;
            if ((v12 & 0x80000000) != 0)
            {
              if (v8) {
                unsigned int v14 = -60;
              }
              else {
                unsigned int v14 = -45;
              }
              if (v14 <= v12)
              {
                int Int64Ranged = CFDictionaryGetInt64Ranged();
                id v16 = [v11 bluetoothAddress];
                id v17 = v16;
                if (Int64Ranged && [v16 length] == (id)6)
                {
                  unsigned int v31 = v8;
                  id v32 = v3;
                  v34 = v11;
                  v35 = v10;
                  v36 = v6;
                  id v29 = [v17 bytes];
                  id v18 = NSPrintF();
                  v33 = +[AVSystemController sharedAVSystemController];
                  [v33 attributeForKey:AVSystemController_PickableRoutesAttribute];
                  long long v37 = 0u;
                  long long v38 = 0u;
                  long long v39 = 0u;
                  long long v40 = 0u;
                  id v19 = (id)objc_claimAutoreleasedReturnValue();
                  id v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
                  if (v20)
                  {
                    id v21 = v20;
                    uint64_t v22 = *(void *)v38;
                    while (2)
                    {
                      for (i = 0; i != v21; i = (char *)i + 1)
                      {
                        if (*(void *)v38 != v22) {
                          objc_enumerationMutation(v19);
                        }
                        v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                        if (CFDictionaryGetInt64())
                        {
                          id v25 = [v24 objectForKeyedSubscript:AVSystemController_RouteDescriptionKey_RouteUID];
                          if ([v25 rangeOfString:v18 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
                          {
                            uint64_t v6 = v36;
                            if (dword_1002617D8 <= 10
                              && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
                            {
                              LogPrintF();
                            }

                            id v11 = v34;
                            CFStringRef v10 = v35;
                            goto LABEL_43;
                          }
                        }
                      }
                      id v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
                      if (v21) {
                        continue;
                      }
                      break;
                    }
                  }

                  CFStringRef v10 = v35;
                  uint64_t v6 = v36;
                  id v11 = v34;
                  id v3 = v32;
                  unsigned int v8 = v31;
                }
                if ((v8 & 1) == 0 && ![v6 paired]) {
                  goto LABEL_34;
                }
                if (v17)
                {
                  if ([v17 length] == (id)6)
                  {
                    id v28 = [v17 bytes];
                    NSPrintF();
                    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
                    guestHeadphonesAddress = self->_guestHeadphonesAddress;
                    self->_guestHeadphonesAddress = v26;

                    if (v8)
                    {
                      if (!self->_triggeredDevice) {
                        objc_storeStrong((id *)&self->_triggeredDevice, v3);
                      }
                      goto LABEL_35;
                    }
LABEL_34:
                    p_triggeredNeedsSetupDevice = &self->_triggeredDevice;
LABEL_35:
                    objc_storeStrong((id *)p_triggeredNeedsSetupDevice, v3);
                    if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                      [(BTShareAudioSessionDaemon *)self _run];
                    }
                    else
                    {
                      [(BTShareAudioSessionDaemon *)self _run];
                    }
                    goto LABEL_43;
                  }
                  if (dword_1002617D8 > 90 || dword_1002617D8 == -1 && !_LogCategory_Initialize())
                  {
LABEL_43:

LABEL_44:
LABEL_45:

                    goto LABEL_46;
                  }
                }
                else if (dword_1002617D8 > 90 || dword_1002617D8 == -1 && !_LogCategory_Initialize())
                {
                  goto LABEL_43;
                }
                LogPrintF();
                goto LABEL_43;
              }
              if (dword_1002617D8 > 10 || dword_1002617D8 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_44;
              }
            }
            else if (dword_1002617D8 > 10 || dword_1002617D8 == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_44;
            }
            LogPrintF();
            goto LABEL_44;
          }
          if (dword_1002617D8 > 10 || dword_1002617D8 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_45;
          }
        }
      }
      else if (dword_1002617D8 > 10 || dword_1002617D8 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_45;
      }
      LogPrintF();
      goto LABEL_45;
    }
  }
LABEL_46:
}

- (void)_pickableRoutesChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4834;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_pickableRoutesChanged
{
  if (self->_guestiOSWaitForRouteState == 1)
  {
    id v3 = self->_guestHeadphonesAddress;
    if (v3)
    {
      uint64_t v4 = +[AVSystemController sharedAVSystemController];
      [v4 attributeForKey:AVSystemController_PickableRoutesAttribute];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            CFStringRef v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:AVSystemController_RouteDescriptionKey_RouteUID];
            if ([(NSString *)v10 rangeOfString:v3 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              guestHeadphonesRouteUID = self->_guestHeadphonesRouteUID;
              self->_guestHeadphonesRouteUID = v10;

              self->_int guestiOSWaitForRouteState = 4;
              [(BTShareAudioSessionDaemon *)self _run];
              goto LABEL_17;
            }
          }
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
  }
}

- (void)_reportError:(id)a3
{
  id v4 = a3;
  if (dword_1002617D8 <= 90 && (dword_1002617D8 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v4;
    LogPrintF();
  }
  CFStringRef v9 = @"error";
  id v10 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1, v8);
  id v6 = objc_retainBlock(self->_progressHandler);
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 50, v5);
  }
}

- (void)_reportProgress:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_retainBlock(self->_progressHandler);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, v3, 0);
    id v5 = v6;
  }
}

- (void)_reportProgress:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  if (dword_1002617D8 <= 30 && (dword_1002617D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = objc_retainBlock(self->_progressHandler);
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, uint64_t, id))v6 + 2))(v6, v4, v8);
  }
}

- (void)_reportProgressTriggeredDevice:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(SFDevice *)self->_triggeredDevice bleDevice];
  id v12 = [v5 advertisementFields];

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  if ((self->_prefOverrideColorCode & 0x80000000) == 0)
  {
    uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
LABEL_5:
    id v8 = (void *)v7;
LABEL_6:
    [v6 setObject:v8 forKeyedSubscript:@"colorCode"];
    goto LABEL_7;
  }
  if (self->_guestHeadphonesColorCode)
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    goto LABEL_5;
  }
  id v8 = NSDictionaryGetNSNumber();
  if (v8) {
    goto LABEL_6;
  }
LABEL_7:

  guestHeadphonesName = self->_guestHeadphonesName;
  if (guestHeadphonesName) {
    [v6 setObject:guestHeadphonesName forKeyedSubscript:@"deviceName"];
  }
  if ((self->_prefOverrideProductID & 0x80000000) == 0)
  {
    uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
LABEL_13:
    id v11 = (void *)v10;
LABEL_14:
    [v6 setObject:v11 forKeyedSubscript:@"pid"];
    goto LABEL_15;
  }
  if (self->_guestHeadphonesProductID)
  {
    uint64_t v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    goto LABEL_13;
  }
  id v11 = NSDictionaryGetNSNumber();
  if (v11) {
    goto LABEL_14;
  }
LABEL_15:

  [(BTShareAudioSessionDaemon *)self _reportProgress:v3 info:v6];
}

- (void)userConfirmed:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A51E8;
  v4[3] = &unk_100233810;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (SFDevice)darwinDevice
{
  return self->_darwinDevice;
}

- (void)setDarwinDevice:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_int mode = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
}

- (CUBluetoothDevice)wxDevice
{
  return self->_wxDevice;
}

- (void)setWxDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wxDevice, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_darwinDevice, 0);
  objc_storeStrong((id *)&self->_triggeredNeedsSetupDevice, 0);
  objc_storeStrong((id *)&self->_triggeredDevice, 0);
  objc_storeStrong((id *)&self->_shareAudioService, 0);
  objc_storeStrong((id *)&self->_preventProxCardsClient, 0);
  objc_storeStrong((id *)&self->_guestiOSSession, 0);
  objc_storeStrong((id *)&self->_guestiOSDeviceAddress, 0);
  objc_storeStrong((id *)&self->_guestiOSContact, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesRouteUID, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesName, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesAddress, 0);
  objc_storeStrong((id *)&self->_guestDeviceAddress, 0);
  objc_storeStrong(&self->_connectResponseHandler, 0);
  objc_storeStrong(&self->_configResponseHandler, 0);
  objc_storeStrong((id *)&self->_bleProxPairingScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoScanner, 0);

  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
}

@end