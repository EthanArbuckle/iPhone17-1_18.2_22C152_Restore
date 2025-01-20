@interface SFShareAudioSessionDaemon
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFShareAudioSessionDaemon)init;
- (id)progressHandler;
- (int)_runAdvertiser;
- (int)_runConfirm;
- (int)_runConnectGuestHeadphones;
- (int)_runFinish;
- (int)_runGuestiOSConnect;
- (int)_runGuestiOSPairSetupPublic;
- (int)_runGuestiOSShareAudio;
- (int)_runInit;
- (int)_runScannerNearbyInfo;
- (int)_runScannerProxPairing;
- (int)_runShowHeadphonesPairingInstructions;
- (int)_runWaitForGuestHeadphones;
- (int)_runWaitForGuestHeadphonesPairingMode;
- (int)_runWaitForProxTrigger;
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
- (void)_runGuestiOSShareAudioProcessResponse:(id)a3 error:(id)a4;
- (void)_runGuestiOSShareAudioSendRequest;
- (void)activate;
- (void)invalidate;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setStatusMonitor:(id)a3;
- (void)userConfirmed;
@end

@implementation SFShareAudioSessionDaemon

- (SFShareAudioSessionDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioSessionDaemon;
  v2 = [(SFShareAudioSessionDaemon *)&v7 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1DBC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1EEC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    [(SFShareAudioSessionDaemon *)self _reportProgress:20];
    [(SFShareAudioSessionDaemon *)self _cleanup];
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    unsigned int v3 = [(SFShareAudioSessionDaemon *)self _runInit];
    if (v3 == 4 || v3 == 2)
    {
      unsigned int v4 = [(SFShareAudioSessionDaemon *)self _runScannerNearbyInfo];
      if (v4 == 4 || v4 == 2)
      {
        unsigned int v5 = [(SFShareAudioSessionDaemon *)self _runScannerProxPairing];
        if (v5 == 4 || v5 == 2)
        {
          unsigned int v6 = [(SFShareAudioSessionDaemon *)self _runAdvertiser];
          if (v6 == 4 || v6 == 2)
          {
            unsigned int v7 = [(SFShareAudioSessionDaemon *)self _runWaitForProxTrigger];
            if (v7 == 4 || v7 == 2)
            {
              unsigned int v8 = [(SFShareAudioSessionDaemon *)self _runConfirm];
              if (v8 == 4 || v8 == 2)
              {
                if (self->_triggerediOS)
                {
                  unsigned int v9 = [(SFShareAudioSessionDaemon *)self _runGuestiOSConnect];
                  if (v9 != 4 && v9 != 2) {
                    return;
                  }
                  unsigned int v10 = [(SFShareAudioSessionDaemon *)self _runGuestiOSPairSetupPublic];
                  if (v10 != 4 && v10 != 2) {
                    return;
                  }
                  unsigned int v11 = [(SFShareAudioSessionDaemon *)self _runGuestiOSShareAudio];
                  if (v11 != 2 && v11 != 4) {
                    return;
                  }
                }
                else if (([(SFDevice *)self->_triggeredDevice paired] & 1) == 0)
                {
                  unsigned int v12 = [(SFShareAudioSessionDaemon *)self _runShowHeadphonesPairingInstructions];
                  if (v12 != 4 && v12 != 2) {
                    return;
                  }
                  unsigned int v13 = [(SFShareAudioSessionDaemon *)self _runWaitForGuestHeadphonesPairingMode];
                  if (v13 != 4 && v13 != 2) {
                    return;
                  }
                }
                unsigned int v14 = [(SFShareAudioSessionDaemon *)self _runConnectGuestHeadphones];
                if (v14 == 4 || v14 == 2)
                {
                  unsigned int v15 = [(SFShareAudioSessionDaemon *)self _runWaitForGuestHeadphones];
                  if (v15 == 4 || v15 == 2)
                  {
                    [(SFShareAudioSessionDaemon *)self _runFinish];
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
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
  if (self->_triggeredDevice && self->_triggeredNeedsSetupDevice)
  {
    if (self->_bleProxPairingScanner)
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
    v10[2] = sub_1000C2610;
    v10[3] = &unk_1008CC7C0;
    v10[4] = v7;
    v10[5] = self;
    [(SFDeviceDiscovery *)v7 setDeviceFoundHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C262C;
    v9[3] = &unk_1008CC7E8;
    v9[4] = v7;
    v9[5] = self;
    [(SFDeviceDiscovery *)v7 setDeviceChangedHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000C2648;
    v8[3] = &unk_1008CB4B0;
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
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
    v11[2] = sub_1000C29D0;
    v11[3] = &unk_1008CC7C0;
    v11[4] = v8;
    v11[5] = self;
    [(SFDeviceDiscovery *)v8 setDeviceFoundHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C29EC;
    v10[3] = &unk_1008CC7E8;
    v10[4] = v8;
    v10[5] = self;
    [(SFDeviceDiscovery *)v8 setDeviceChangedHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C2A08;
    v9[3] = &unk_1008CB4B0;
    v9[4] = v8;
    v9[5] = self;
    [(SFDeviceDiscovery *)v8 activateWithCompletion:v9];
  }
  return 4;
}

- (int)_runAdvertiser
{
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (self->_triggeredDevice)
  {
    if (bleNearbyActionAdvertiser)
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFService *)self->_bleNearbyActionAdvertiser invalidate];
      unsigned int v4 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = 0;
    }
    return 2;
  }
  else
  {
    if (!bleNearbyActionAdvertiser)
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v6 = (SFService *)objc_alloc_init((Class)SFService);
      uint64_t v7 = self->_bleNearbyActionAdvertiser;
      self->_bleNearbyActionAdvertiser = v6;
      unsigned int v8 = v6;

      [(SFService *)v8 setAdvertiseRate:60];
      [(SFService *)v8 setDeviceActionType:27];
      [(SFService *)v8 setDispatchQueue:self->_dispatchQueue];
      [(SFService *)v8 setIdentifier:@"a5989962-d94b-4755-bbca-59ecf498ad2f"];
      [(SFService *)v8 setLabel:@"ShareAudio"];
      [(SFService *)v8 setNeedsSetup:1];
      [(SFService *)v8 setPairSetupDisabled:1];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000C2D04;
      v9[3] = &unk_1008CB4B0;
      v9[4] = v8;
      v9[5] = self;
      [(SFService *)v8 activateWithCompletion:v9];
    }
    return 4;
  }
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

- (int)_runConfirm
{
  int confirmState = self->_confirmState;
  if (confirmState != 4 && confirmState != 2)
  {
    if (confirmState)
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
      {
        triggeredDevice = self->_triggeredDevice;
        LogPrintF();
      }
      self->_int confirmState = 1;
      -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 100, triggeredDevice);
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
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_int guestiOSConnectState = 1;
      [(SFShareAudioSessionDaemon *)self _reportProgressTriggeredDevice:200];
      unsigned int v5 = (SFSession *)objc_alloc_init((Class)SFSession);
      guestiOSSession = self->_guestiOSSession;
      self->_guestiOSSession = v5;
      uint64_t v7 = v5;

      [(SFSession *)v7 setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)v7 setLabel:@"ShareAudio"];
      [(SFSession *)v7 setPeerDevice:self->_triggeredDevice];
      [(SFSession *)v7 setServiceIdentifier:SFServiceIdentifierShareAudio];
      [(SFSession *)v7 setSessionFlags:1];
      [(SFSession *)v7 setStatusMonitor:self->_statusMonitor];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000C3240;
      v13[3] = &unk_1008CB4B0;
      v13[4] = v7;
      v13[5] = self;
      [(SFSession *)v7 setErrorHandler:v13];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000C3364;
      v12[3] = &unk_1008CA640;
      v12[4] = v7;
      v12[5] = self;
      [(SFSession *)v7 setInterruptionHandler:v12];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000C33E8;
      v11[3] = &unk_1008CA640;
      v11[4] = v7;
      v11[5] = self;
      [(SFSession *)v7 setInvalidationHandler:v11];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000C346C;
      v10[3] = &unk_1008CA640;
      v10[4] = v7;
      v10[5] = self;
      [(SFSession *)v7 setSessionStartedHandler:v10];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000C3520;
      v9[3] = &unk_1008CB4B0;
      v9[4] = v7;
      v9[5] = self;
      [(SFSession *)v7 activateWithCompletion:v9];
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
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_int guestiOSPairSetupPublicState = 1;
      unsigned int v5 = self->_guestiOSSession;
      [(SFSession *)v5 setFixedPIN:@"public"];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000C37C0;
      v7[3] = &unk_1008CB4B0;
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
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      self->_int guestiOSShareAudioState = 1;
      [(SFShareAudioSessionDaemon *)self _runGuestiOSShareAudioSendRequest];
    }
  }
  return self->_guestiOSShareAudioState;
}

- (void)_runGuestiOSShareAudioSendRequest
{
  if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = (void *)MGCopyAnswer();
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:@"btAd"];
    unsigned int v5 = (void *)GestaltCopyAnswer();
    if (v5) {
      [v3 setObject:v5 forKeyedSubscript:@"dname"];
    }
    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C3BA4;
    v9[3] = &unk_1008CA5D0;
    v9[4] = guestiOSSession;
    v9[5] = self;
    void v9[6] = v3;
    unsigned int v8 = guestiOSSession;
    [(SFSession *)v8 appleIDAddProof:v3 dispatchQueue:dispatchQueue completion:v9];
  }
  else
  {
    if (dword_100967040 <= 90 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_int guestiOSShareAudioState = 3;
    unsigned int v5 = NSErrorF();
    [(SFShareAudioSessionDaemon *)self _reportError:v5];
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
    if (dword_100967040 <= 90 && (dword_100967040 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v9;
      LogPrintF();
    }
    self->_int guestiOSShareAudioState = 3;
    -[SFShareAudioSessionDaemon _reportError:](self, "_reportError:", v9, v13);
  }
  else
  {
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    guestiOSSession = self->_guestiOSSession;
    dispatchQueue = self->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000C3ED8;
    v14[3] = &unk_1008CC838;
    v14[4] = guestiOSSession;
    v14[5] = self;
    id v15 = v8;
    unsigned int v12 = guestiOSSession;
    [(SFSession *)v12 appleIDVerifyProof:v15 dispatchQueue:dispatchQueue completion:v14];
  }
}

- (int)_runShowHeadphonesPairingInstructions
{
  int result = self->_guestHeadphonesInstructionsState;
  if (!result)
  {
    if (!self->_triggeredNeedsSetupDevice)
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
      {
        triggeredDevice = self->_triggeredDevice;
        LogPrintF();
        -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120, triggeredDevice);
      }
      else
      {
        -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 120, v4);
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
    uint64_t v4 = [(SFSession *)self->_guestiOSSession pairingDeriveKeyForIdentifier:@"ShareAudio" keyLength:16];
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
    {
      guestHeadphonesAddress = self->_guestHeadphonesAddress;
      id v7 = v4;
      LogPrintF();
    }
    self->_guestHeadphonesConnectState = 1;
    -[SFShareAudioSessionDaemon _reportProgressTriggeredDevice:](self, "_reportProgressTriggeredDevice:", 300, guestHeadphonesAddress, v7);
    id v5 = objc_alloc_init((Class)SFBluetoothPairingSession);
    objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, v5);
    [v5 setDeviceAddress:self->_guestHeadphonesAddress];
    [v5 setDispatchQueue:self->_dispatchQueue];
    if (self->_triggerediOS || ![(SFDevice *)self->_triggeredDevice paired])
    {
      [v5 setGuestKey:v4];
      [v5 setGuestMode:1];
      if (self->_triggerediOS && !self->_guestiOSContact) {
        [v5 setUserNotInContacts:1];
      }
    }
    else
    {
      [v5 setAggregate:1];
      [v5 setConnectOnly:1];
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000C43CC;
    v8[3] = &unk_1008CB4B0;
    v8[4] = v5;
    v8[5] = self;
    [v5 setCompletionHandler:v8];
    [v5 activate];

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
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
      {
        guestHeadphonesAddress = self->_guestHeadphonesAddress;
        LogPrintF();
      }
      self->_int guestiOSWaitForRouteState = 1;
      -[SFShareAudioSessionDaemon _reportProgress:](self, "_reportProgress:", 320, guestHeadphonesAddress);
      id v5 = [(Class)off_1009670B0[0]() sharedAVSystemController];
      id v6 = off_1009670B8[0]();
      id v13 = v6;
      id v7 = +[NSArray arrayWithObjects:&v13 count:1];

      id v8 = off_1009670C0[0]();
      [v5 setAttribute:v7 forKey:v8 error:0];

      id v9 = +[NSNotificationCenter defaultCenter];
      int v10 = off_1009670B8[0]();
      [v9 addObserver:self selector:"_pickableRoutesChanged:" name:v10 object:v5];

      self->_observingPickableRoutes = 1;
      [(SFShareAudioSessionDaemon *)self _pickableRoutesChanged];
    }
  }
  return self->_guestiOSWaitForRouteState;
}

- (int)_runFinish
{
  id v3 = self->_guestHeadphonesRouteUID;
  if (v3)
  {
    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v3;
      LogPrintF();
    }
    CFStringRef v10 = @"mediaRouteID";
    uint64_t v11 = v3;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1, v7);
    [(SFShareAudioSessionDaemon *)self _reportProgress:40 info:v4];
  }
  else
  {
    if (dword_100967040 <= 90 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v8 = @"error";
    uint64_t v4 = NSErrorWithOSStatusF();
    id v9 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [(SFShareAudioSessionDaemon *)self _reportProgress:50 info:v5];
  }
  [(SFShareAudioSessionDaemon *)self _cleanup];

  return 4;
}

- (void)_cleanup
{
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

  [(SFBluetoothPairingSession *)self->_guestHeadphonesPairingSession invalidate];
  guestHeadphonesPairingSession = self->_guestHeadphonesPairingSession;
  self->_guestHeadphonesPairingSession = 0;

  [(SFSession *)self->_guestiOSSession invalidate];
  guestiOSSession = self->_guestiOSSession;
  self->_guestiOSSession = 0;

  if (self->_observingPickableRoutes)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    CFStringRef v10 = off_1009670B8[0]();
    [v9 removeObserver:self name:v10 object:0];

    self->_observingPickableRoutes = 0;
  }
  [(SFClient *)self->_preventProxCardsClient invalidate];
  preventProxCardsClient = self->_preventProxCardsClient;
  self->_preventProxCardsClient = 0;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  triggeredDevice = self->_triggeredDevice;
  self->_triggeredDevice = 0;

  triggeredNeedsSetupDevice = self->_triggeredNeedsSetupDevice;
  self->_triggeredNeedsSetupDevice = 0;

  self->_triggerediOS = 0;
  proximityController = self->_proximityController;

  [(SDProximityController *)proximityController clearDeviceList];
}

- (void)_bleScannerNearbyInfoDeviceFound:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_triggeredDevice)
  {
    uint64_t v11 = v5;
    if ([v5 paired])
    {
      id v6 = v11;
      if (dword_100967040 <= 10)
      {
        if (dword_100967040 != -1) {
          goto LABEL_33;
        }
        int v9 = _LogCategory_Initialize();
        id v6 = v11;
        if (v9) {
          goto LABEL_33;
        }
      }
    }
    else
    {
      if (([v11 deviceFlags] & 0x800) != 0)
      {
        id v7 = [v11 bleDevice];
        int v8 = [v7 rssiEstimate];
        [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v11];
        if ((id)[(SDProximityController *)self->_proximityController checkDeviceRegion:v11] == (id)2)
        {
          if (dword_100967040 <= 50 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          if (_os_feature_enabled_impl()) {
            goto LABEL_16;
          }
        }
        else if (_os_feature_enabled_impl())
        {
          if (dword_100967040 > 50 || dword_100967040 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_21;
          }
          goto LABEL_11;
        }
        if (v8 < 0 && v8 >= self->_prefRSSIThreshold)
        {
LABEL_16:
          if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          objc_storeStrong((id *)&self->_triggeredDevice, a3);
          self->_triggerediOS = 1;
          [(SFShareAudioSessionDaemon *)self _run];
          goto LABEL_21;
        }
        if (dword_100967040 > 10 || dword_100967040 == -1 && !_LogCategory_Initialize())
        {
LABEL_21:

LABEL_22:
          id v6 = v11;
          goto LABEL_23;
        }
LABEL_11:
        LogPrintF();
        goto LABEL_21;
      }
      id v6 = v11;
      if (dword_100967040 <= 10)
      {
        if (dword_100967040 != -1 || (v10 = _LogCategory_Initialize(), id v6 = v11, v10))
        {
LABEL_33:
          LogPrintF();
          goto LABEL_22;
        }
      }
    }
  }
LABEL_23:
}

- (void)_bleScannerProxPairingDeviceFound:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = v5;
  p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
  if (!self->_triggeredNeedsSetupDevice)
  {
    unsigned int v8 = [v5 needsSetup];
    if ((v8 & 1) != 0 || !self->_triggeredDevice)
    {
      int v9 = [v6 bleDevice];
      int v10 = [v9 advertisementFields];

      if ((v8 & 1) != 0
        || !self->_prefRespectDeviceSupport
        || ([v6 deviceFlags] & 0x800) != 0)
      {
        if (CFDictionaryGetInt64Ranged() != 8208 && (CFDictionaryGetInt64Ranged() & 0x24) != 0)
        {
          if (dword_100967040 > 10 || dword_100967040 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_58;
          }
        }
        else
        {
          if (!CFDictionaryGetInt64())
          {
            uint64_t v11 = [v6 bleDevice];
            id v12 = [v11 smoothedRSSI];
            if ((v12 & 0x80000000) != 0)
            {
              if (v8) {
                unsigned int v13 = -60;
              }
              else {
                unsigned int v13 = -45;
              }
              if ((v8 & 1) == 0)
              {
                [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v6];
                if ((id)[(SDProximityController *)self->_proximityController checkDeviceRegion:v6] == (id)2)
                {
                  if (dword_100967040 <= 50 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
                    LogPrintF();
                  }
                  _os_feature_enabled_impl();
                }
                else if (_os_feature_enabled_impl())
                {
                  if (dword_100967040 > 50 || dword_100967040 == -1 && !_LogCategory_Initialize()) {
                    goto LABEL_57;
                  }
                  goto LABEL_79;
                }
              }
              char v14 = _os_feature_enabled_impl();
              if (v13 <= v12 || (v14 & 1) != 0)
              {
                int Int64Ranged = CFDictionaryGetInt64Ranged();
                v16 = [v11 bluetoothAddress];
                v17 = v16;
                if (Int64Ranged && [v16 length] == (id)6)
                {
                  unsigned int v35 = v8;
                  id v36 = v3;
                  v39 = v10;
                  v40 = v6;
                  v38 = v17;
                  id v33 = [v17 bytes];
                  v18 = NSPrintF();
                  v19 = [off_1009670B0[0]() sharedAVSystemController:v33];
                  v20 = off_1009670C8[0]();
                  v37 = v19;
                  v21 = [v19 attributeForKey:v20];

                  long long v43 = 0u;
                  long long v44 = 0u;
                  long long v41 = 0u;
                  long long v42 = 0u;
                  id v22 = v21;
                  id v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
                  if (v23)
                  {
                    id v24 = v23;
                    uint64_t v25 = *(void *)v42;
                    while (2)
                    {
                      for (i = 0; i != v24; i = (char *)i + 1)
                      {
                        if (*(void *)v42 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                        off_1009670D0[0]();
                        if (CFDictionaryGetInt64())
                        {
                          v28 = off_1009670D8();
                          v29 = [v27 objectForKeyedSubscript:v28];

                          if ([v29 rangeOfString:v18 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
                          {
                            id v6 = v40;
                            if (dword_100967040 <= 10
                              && (dword_100967040 != -1 || _LogCategory_Initialize()))
                            {
                              LogPrintF();
                            }

                            int v10 = v39;
                            v17 = v38;
                            goto LABEL_56;
                          }
                        }
                      }
                      id v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
                      if (v24) {
                        continue;
                      }
                      break;
                    }
                  }

                  int v10 = v39;
                  id v6 = v40;
                  v17 = v38;
                  id v3 = v36;
                  p_triggeredNeedsSetupDevice = &self->_triggeredNeedsSetupDevice;
                  unsigned int v8 = v35;
                }
                if ((v8 & 1) == 0 && ![v6 paired]) {
                  goto LABEL_47;
                }
                if (v17)
                {
                  if ([v17 length] == (id)6)
                  {
                    id v32 = [v17 bytes];
                    NSPrintF();
                    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
                    guestHeadphonesAddress = self->_guestHeadphonesAddress;
                    self->_guestHeadphonesAddress = v30;

                    if (v8)
                    {
                      if (!self->_triggeredDevice) {
                        objc_storeStrong((id *)&self->_triggeredDevice, v3);
                      }
                      goto LABEL_48;
                    }
LABEL_47:
                    p_triggeredNeedsSetupDevice = &self->_triggeredDevice;
LABEL_48:
                    objc_storeStrong((id *)p_triggeredNeedsSetupDevice, v3);
                    if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                      [(SFShareAudioSessionDaemon *)self _run];
                    }
                    else
                    {
                      [(SFShareAudioSessionDaemon *)self _run];
                    }
                    goto LABEL_56;
                  }
                  if (dword_100967040 > 90 || dword_100967040 == -1 && !_LogCategory_Initialize())
                  {
LABEL_56:

LABEL_57:
LABEL_58:

                    goto LABEL_59;
                  }
                }
                else if (dword_100967040 > 90 || dword_100967040 == -1 && !_LogCategory_Initialize())
                {
                  goto LABEL_56;
                }
                LogPrintF();
                goto LABEL_56;
              }
              if (dword_100967040 > 10 || dword_100967040 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_57;
              }
            }
            else if (dword_100967040 > 10 || dword_100967040 == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_57;
            }
LABEL_79:
            LogPrintF();
            goto LABEL_57;
          }
          if (dword_100967040 > 10 || dword_100967040 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_58;
          }
        }
      }
      else if (dword_100967040 > 10 || dword_100967040 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_58;
      }
      LogPrintF();
      goto LABEL_58;
    }
  }
LABEL_59:
}

- (void)_pickableRoutesChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C55F0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_pickableRoutesChanged
{
  if (self->_guestiOSWaitForRouteState == 1)
  {
    id v3 = self->_guestHeadphonesAddress;
    if (v3)
    {
      uint64_t v4 = [(Class)off_1009670B0[0]() sharedAVSystemController];
      id v5 = off_1009670C8[0]();
      v16 = v4;
      id v6 = [v4 attributeForKey:v5];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            unsigned int v13 = off_1009670D8();
            char v14 = [v12 objectForKeyedSubscript:v13];

            if ([(NSString *)v14 rangeOfString:v3 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              guestHeadphonesRouteUID = self->_guestHeadphonesRouteUID;
              self->_guestHeadphonesRouteUID = v14;

              self->_int guestiOSWaitForRouteState = 4;
              [(SFShareAudioSessionDaemon *)self _run];
              goto LABEL_17;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
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
  if (dword_100967040 <= 90 && (dword_100967040 != -1 || _LogCategory_Initialize()))
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
  if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
  if (dword_100967040 <= 30 && (dword_100967040 != -1 || _LogCategory_Initialize())) {
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
  id v11 = [v5 advertisementFields];

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

  if ((self->_prefOverrideProductID & 0x80000000) == 0)
  {
    uint64_t v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
LABEL_11:
    id v10 = (void *)v9;
LABEL_12:
    [v6 setObject:v10 forKeyedSubscript:@"pid"];
    goto LABEL_13;
  }
  if (self->_guestHeadphonesProductID)
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    goto LABEL_11;
  }
  id v10 = NSDictionaryGetNSNumber();
  if (v10) {
    goto LABEL_12;
  }
LABEL_13:

  [(SFShareAudioSessionDaemon *)self _reportProgress:v3 info:v6];
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (dword_100967040 <= 50)
  {
    id v6 = v3;
    if (dword_100967040 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = v6, v5))
    {
      LogPrintF();
      uint64_t v4 = v6;
    }
  }
}

- (void)userConfirmed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6058;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_triggeredNeedsSetupDevice, 0);
  objc_storeStrong((id *)&self->_triggeredDevice, 0);
  objc_storeStrong((id *)&self->_preventProxCardsClient, 0);
  objc_storeStrong((id *)&self->_guestiOSSession, 0);
  objc_storeStrong((id *)&self->_guestiOSDeviceAddress, 0);
  objc_storeStrong((id *)&self->_guestiOSContact, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesRouteUID, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesPairingSession, 0);
  objc_storeStrong((id *)&self->_guestHeadphonesAddress, 0);
  objc_storeStrong((id *)&self->_bleProxPairingScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoScanner, 0);

  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
}

@end