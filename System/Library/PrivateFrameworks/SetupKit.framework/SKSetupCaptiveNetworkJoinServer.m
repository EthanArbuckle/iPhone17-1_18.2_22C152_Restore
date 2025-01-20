@interface SKSetupCaptiveNetworkJoinServer
+ (void)resetWithCompletionHandler:(id)a3;
- (BOOL)_bleAdvertiserShouldRun;
- (SKSetupCaptiveNetworkJoinServer)init;
- (id)descriptionWithLevel:(int)a3;
- (int)mode;
- (void)_activate;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerAcceptConnecton:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_captiveDetectedNotificationUpdate:(BOOL)a3;
- (void)_captiveNetworkLoginInfo:(id)a3 cookie:(unsigned int)a4 responseHandler:(id)a5;
- (void)_captiveNetworkLoginRequest:(id)a3 responseHandler:(id)a4;
- (void)_captiveNetworkProbeEnsureStopped;
- (void)_captiveNetworkProbeRequest:(id)a3 responseHandler:(id)a4;
- (void)_captiveNetworkProbeResult:(int)a3 responseHandler:(id)a4;
- (void)_cfuEnsuredStarted;
- (void)_cfuEnsuredStopped;
- (void)_connectionEnded:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_networkRelayAWDLStartRequest:(id)a3 responseHandler:(id)a4;
- (void)_networkRelayDeviceEnsureStopped;
- (void)_networkRelaySetupRequest:(id)a3 responseHandler:(id)a4;
- (void)_oobEnsureStarted;
- (void)_run;
- (void)_runDefault;
- (void)_runDetected;
- (void)dealloc;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4;
- (void)setMode:(int)a3;
@end

@implementation SKSetupCaptiveNetworkJoinServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_nrDeviceManager, 0);
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_awdlAdvertiser, 0);
  objc_storeStrong((id *)&self->_cfuController, 0);
  objc_storeStrong((id *)&self->_captiveNetworkInterfaceName, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);

  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)_oobEnsureStarted
{
  if (!self->super._skCnx)
  {
    v3 = objc_alloc_init(SKConnection);
    [(SKConnection *)v3 setSendDataHandler:self->super._sendDataHandler];
    [(SKSetupBase *)self _connectionStartWithSKConnection:v3 clientMode:0 completeOnFailure:0 completion:&__block_literal_global_200];
  }
}

- (void)_captiveDetectedNotificationUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  p_captiveDetectedNotifyToken = &self->_captiveDetectedNotifyToken;
  int v7 = *p_captiveDetectedNotifyToken;
  if (v3)
  {
    if (v7 == -1)
    {
      notify_register_check("com.apple.coreutils.captive-network-state", p_captiveDetectedNotifyToken);
      int v7 = *p_captiveDetectedNotifyToken;
    }
    notify_set_state(v7, 1uLL);
    notify_post("com.apple.coreutils.captive-network-state");
  }
  else if (v7 != -1)
  {
    notify_set_state(v7, 0);
    notify_post("com.apple.coreutils.captive-network-state");
    notify_cancel(*p_captiveDetectedNotifyToken);
    int *p_captiveDetectedNotifyToken = -1;
  }
}

- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30)
  {
    v6 = v10;
    if (var0 != -1)
    {
LABEL_3:
      [v6 isConnected];
      [v10 linkType];
      StringFromNRLinkType = (void *)createStringFromNRLinkType();
      [v10 linkSubtype];
      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
      v9 = [v10 proxyServiceInterfaceName];
      LogPrintF();

      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      v6 = v10;
      goto LABEL_3;
    }
  }
LABEL_5:
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id StringFromNRLinkType = (id)createStringFromNRLinkType();
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  v5 = [v9 proxyServiceInterfaceName];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [v9 linkType];
    id StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v9 linkSubtype];
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }
}

- (void)_networkRelaySetupRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v6 = a4;
  uint64_t v52 = 0;
  v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__85;
  v56 = __Block_byref_object_dispose__86;
  id v57 = 0;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke;
  v49[3] = &unk_264549378;
  v51 = &v52;
  v49[4] = self;
  id v7 = v6;
  id v50 = v7;
  v39 = (void (**)(void))MEMORY[0x223C632B0](v49);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v36 = CUPrintNSObjectOneLine();
    LogPrintF();
  }
  CFStringGetTypeID();
  uint64_t v9 = [ (id) CFDictionaryGetTypedValue() UTF8String];
  if (!v9)
  {
    v26 = NSErrorF_safe();
    [(SKSetupBase *)self _completeWithError:v26];

    goto LABEL_35;
  }
  memset(v47, 0, sizeof(v47));
  int v48 = 0;
  uint64_t v46 = 0;
  if (StringToSockAddr() || (memset(&obj[1], 0, 24), int v45 = 0, CUGetInterfaceAddresses()))
  {
    uint64_t v27 = NSErrorF_safe();
    id v28 = v53[5];
    v53[5] = (id)v27;

    goto LABEL_35;
  }
  if (SockAddrToString())
  {
    uint64_t v29 = NSErrorF_safe();
    id v41 = v53[5];
    v53[5] = (id)v29;

    goto LABEL_35;
  }
  v40 = [NSString stringWithUTF8String:v61];
  id v10 = self->_nrDeviceManager;
  if (v10) {
    goto LABEL_12;
  }
  id v10 = (NRDeviceManager *)[MEMORY[0x263F58218] copySharedDeviceManager];
  if (v10)
  {
    objc_storeStrong((id *)&self->_nrDeviceManager, v10);
LABEL_12:
    p_nrDeviceIdentifier = &self->_nrDeviceIdentifier;
    v12 = self->_nrDeviceIdentifier;
    if (v12)
    {
      int v13 = self->super._ucat->var0;
      if (v13 < 31 && (v13 != -1 || _LogCategory_Initialize()))
      {
        v36 = [(NRDeviceIdentifier *)v12 nrDeviceIdentifier];
        LogPrintF();
      }
      -[NRDeviceManager unregisterDevice:](v10, "unregisterDevice:", v12, v36);
      v14 = *p_nrDeviceIdentifier;
      *p_nrDeviceIdentifier = 0;
    }
    v15 = (void *)[MEMORY[0x263F58210] newEphemeralDeviceIdentifier];
    if (v15)
    {
      objc_storeStrong((id *)&self->_nrDeviceIdentifier, v15);
      id v16 = objc_alloc_init(MEMORY[0x263F58248]);
      v17 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v47 length:v46];
      [v16 setAwdlAddressData:v17];

      if ([(NSData *)self->super._pskData length])
      {
        [(NSData *)self->super._pskData bytes];
        [(NSData *)self->super._pskData length];
        CryptoHKDF();
        v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", v60, 32, v60);
      }
      else
      {
        skCnx = self->super._skCnx;
        v20 = v53 + 5;
        obj[0] = v53[5];
        v18 = [(SKConnection *)skCnx deriveKeyWithSaltPtr:"NetworkRelaySalt" saltLen:16 infoPtr:"NetworkRelayInfo" infoLen:16 keyLen:32 error:obj];
        objc_storeStrong(v20, obj[0]);
      }
      if (v18)
      {
        [v16 setOutOfBandKey:v18];
        id v21 = objc_alloc_init(MEMORY[0x263F58230]);
        [v21 setAllowedLinkTypes:&unk_26D1D02E0];
        [v21 setAllowedLinkSubtypes:&unk_26D1D02F8];
        [v21 setProxyCapability:1];
        if (objc_opt_respondsToSelector()) {
          [v21 setProxyProviderRequiresWiFi:1];
        }
        v22 = self->_nrDeviceMonitor;
        if (!v22)
        {
          v22 = (NRDeviceMonitor *)[objc_alloc(MEMORY[0x263F58228]) initWithDeviceIdentifier:v15 delegate:self queue:self->super._dispatchQueue];
          objc_storeStrong((id *)&self->_nrDeviceMonitor, v22);
        }
        int v23 = self->super._ucat->var0;
        if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
        {
          v37 = v40;
          uint64_t v38 = v9;
          v36 = v15;
          LogPrintF();
        }
        dispatchQueue = self->super._dispatchQueue;
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke_189;
        v43[3] = &unk_2645491E8;
        v43[4] = self;
        -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:](v10, "registerDevice:properties:operationalproperties:queue:completionBlock:", v15, v16, v21, dispatchQueue, v43, v36, v37, v38);
        v58 = @"_ip";
        v59 = v40;
        v25 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        (*((void (**)(id, void *, void, void, void *))v7 + 2))(v7, v25, 0, 0, &__block_literal_global_193);
      }
      else
      {
        v31 = v53;
        id v32 = v53[5];
        if (v32)
        {
          id v33 = v32;
          id v21 = v31[5];
          v31[5] = v33;
        }
        else
        {
          uint64_t v35 = NSErrorF_safe();
          id v21 = v53[5];
          v53[5] = (id)v35;
        }
      }
    }
    else
    {
      uint64_t v30 = NSErrorF_safe();
      id v16 = v53[5];
      v53[5] = (id)v30;
    }

    goto LABEL_34;
  }
  uint64_t v34 = NSErrorF_safe();
  id v10 = (NRDeviceManager *)v53[5];
  v53[5] = (id)v34;
LABEL_34:

LABEL_35:
  v39[2](v39);

  _Block_object_dispose(&v52, 8);
}

uint64_t __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      v5 = CUPrintNSError();
      LogPrintF();
    }
    v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

void __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke_189(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 144);
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(void *)(a1 + 32), v6))
    {
      id v7 = CUPrintNSError();
      LogPrintF();

      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 32));
  [*(id *)(a1 + 32) _run];
}

- (void)_networkRelayAWDLStartRequest:(id)a3 responseHandler:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__85;
  v24 = __Block_byref_object_dispose__86;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__SKSetupCaptiveNetworkJoinServer__networkRelayAWDLStartRequest_responseHandler___block_invoke;
  v17[3] = &unk_264549378;
  v19 = &v20;
  v17[4] = self;
  id v8 = v7;
  id v18 = v8;
  uint64_t v9 = (void (**)(void))MEMORY[0x223C632B0](v17);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = CUPrintNSObjectOneLine();
    LogPrintF();
  }
  CFStringGetTypeID();
  v11 = CFDictionaryGetTypedValue();
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F38530]);
    objc_storeStrong((id *)&self->_awdlAdvertiser, v12);
    [v12 setAdvertiseFlags:2048];
    [v12 setDispatchQueue:self->super._dispatchQueue];
    [v12 setDomain:@"local."];
    [v12 setInterfaceName:@"awdl0"];
    [v12 setName:v11];
    [v12 setPort:1234];
    [v12 setServiceType:@"_setupkit._tcp"];
    v26 = @"rpBA";
    v27[0] = v11;
    int v13 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v12 setTxtDictionary:v13];

    int v14 = self->super._ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v11;
      LogPrintF();
    }
    objc_msgSend(v12, "activate", v16);
    (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, MEMORY[0x263EFFA78], 0, 0, &__block_literal_global_151);
  }
  else
  {
    uint64_t v15 = NSErrorF_safe();
    id v12 = (id)v21[5];
    v21[5] = v15;
  }

  v9[2](v9);
  _Block_object_dispose(&v20, 8);
}

uint64_t __81__SKSetupCaptiveNetworkJoinServer__networkRelayAWDLStartRequest_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      int v5 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)_networkRelayDeviceEnsureStopped
{
  int v13 = self->_nrDeviceManager;
  int v3 = self->_nrDeviceIdentifier;
  if (v13) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v12 = [(NRDeviceIdentifier *)v3 nrDeviceIdentifier];
      LogPrintF();

      -[NRDeviceManager unregisterDevice:](v13, "unregisterDevice:", v3, v12);
    }
    else
    {
      -[NRDeviceManager unregisterDevice:](v13, "unregisterDevice:", v3, v11);
    }
  }
  nrDeviceIdentifier = self->_nrDeviceIdentifier;
  self->_nrDeviceIdentifier = 0;

  nrDeviceManager = self->_nrDeviceManager;
  self->_nrDeviceManager = 0;

  nrDeviceMonitor = self->_nrDeviceMonitor;
  self->_nrDeviceMonitor = 0;

  if (self->_awdlAdvertiser)
  {
    int v9 = self->super._ucat->var0;
    if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(CUBonjourAdvertiser *)self->_awdlAdvertiser invalidate];
  awdlAdvertiser = self->_awdlAdvertiser;
  self->_awdlAdvertiser = 0;
}

- (void)_cfuEnsuredStopped
{
  if (self->_mode == 1 && GestaltGetDeviceClass() != 7)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    cfuController = self->_cfuController;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStopped__block_invoke;
    v7[3] = &unk_2645488C8;
    v7[4] = cfuController;
    BOOL v4 = cfuController;
    [(FLFollowUpController *)v4 clearPendingFollowUpItemsWithUniqueIdentifiers:&unk_26D1D02C8 completion:v7];
  }
  if (self->_cfuController)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  id v6 = self->_cfuController;
  self->_cfuController = 0;
}

uint64_t __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStopped__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30)
  {
    id v7 = v3;
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v7, v3))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();

      id v4 = v7;
    }
  }

  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_cfuEnsuredStarted
{
  v14[1] = *MEMORY[0x263EF8340];
  p_cfuController = &self->_cfuController;
  if (!self->_cfuController)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v5 = (void *)[objc_alloc(getFLFollowUpControllerClass()) initWithClientIdentifier:@"com.apple.SetupKit"];
    objc_storeStrong((id *)p_cfuController, v5);
    id v6 = objc_alloc_init(getFLFollowUpItemClass());
    id v7 = v6;
    if (v6)
    {
      [v6 setUniqueIdentifier:@"com.apple.SetupKit.followup.captive-portal"];
      id v8 = getFLGroupIdentifierDevice();
      [v7 setGroupIdentifier:v8];

      int v9 = SKLocalizedString(@"CNJ_CFU_TITLE");
      [v7 setTitle:v9];

      id v10 = objc_alloc_init(getFLFollowUpActionClass());
      if (v10)
      {
        uint64_t v11 = (void *)[objc_alloc(NSURL) initWithString:@"prefs:root=Network&cfuAction=launchCaptive&activate=true"];
        [v10 setUrl:v11];

        v14[0] = v10;
        id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
        [v7 setActions:v12];

        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStarted__block_invoke;
        v13[3] = &unk_2645488C8;
        v13[4] = self;
        [v5 postFollowUpItem:v7 completion:v13];
      }
    }
  }
}

uint64_t __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStarted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
  if (v6 <= 30)
  {
    id v9 = v4;
    if (v6 != -1 || (id v4 = (id)_LogCategory_Initialize(), v5 = v9, v4))
    {
      id v8 = CUPrintNSError();
      LogPrintF();

      id v5 = v9;
    }
  }

  return MEMORY[0x270F9A758](v4, v5);
}

- (void)_captiveNetworkProbeResult:(int)a3 responseHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 4294896138;
  id v7 = a4;
  if (!v4)
  {
    int v8 = CNWebsheetNotifyComplete();
    self->_captiveNetworkWebSheetActive = 0;
    if (v8) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 4294896139;
    }
    self->_captiveNetworkWebSheetCompleted = 1;
  }
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    int v13 = v12 = v4;
    LogPrintF();
  }
  id v16 = @"_cnPR";
  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v6, v12, v13);
  v17[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __78__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeResult_responseHandler___block_invoke;
  v14[3] = &unk_264548CB0;
  int v15 = v6;
  v14[4] = self;
  (*((void (**)(id, void *, void, void, void *))v7 + 2))(v7, v11, 0, 0, v14);
}

uint64_t __78__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeResult_responseHandler___block_invoke(uint64_t result)
{
  if (!*(_DWORD *)(result + 40)) {
    return [*(id *)(result + 32) _reportEventType:202];
  }
  return result;
}

- (void)_captiveNetworkProbeRequest:(id)a3 responseHandler:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__85;
  id v28 = __Block_byref_object_dispose__86;
  id v29 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeRequest_responseHandler___block_invoke;
  v21[3] = &unk_264549378;
  int v23 = &v24;
  v21[4] = self;
  id v8 = v7;
  id v22 = v8;
  id v9 = (void (**)(void))MEMORY[0x223C632B0](v21);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_captiveNetworkWebSheetActive)
  {
    uint64_t v11 = self->_captiveNetworkInterfaceName;
    if (v11)
    {
      uint64_t v12 = objc_alloc_init(SKCaptiveContext);
      [(SKCaptiveContext *)v12 setResponseHandler:v8];
      [(SKCaptiveContext *)v12 setServer:self];
      int v13 = v12;
      if (!CNProberCreate())
      {

        uint64_t v14 = NSErrorF_safe();
        int v15 = (void *)v25[5];
        v25[5] = v14;
      }
    }
    else
    {
      uint64_t v19 = NSErrorF_safe();
      int v13 = (SKCaptiveContext *)v25[5];
      v25[5] = v19;
    }
  }
  else
  {
    if (self->_captiveNetworkWebSheetCompleted) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 4294960551;
    }
    int v17 = self->super._ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = CUPrintErrorCode();
      LogPrintF();
    }
    uint64_t v30 = @"_cnPR";
    id v18 = objc_msgSend(NSNumber, "numberWithInt:", v16, v20);
    v31[0] = v18;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];

    (*((void (**)(id, NSString *, void, void, void *))v8 + 2))(v8, v11, 0, 0, &__block_literal_global_106);
  }

  v9[2](v9);
  _Block_object_dispose(&v24, 8);
}

uint64_t __79__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeRequest_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)_captiveNetworkProbeEnsureStopped
{
  if (self->_captiveNetworkWebSheetActive)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CNWebsheetNotifyComplete();
    self->_captiveNetworkWebSheetActive = 0;
  }
}

- (void)_captiveNetworkLoginInfo:(id)a3 cookie:(unsigned int)a4 responseHandler:(id)a5
{
  v32[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__85;
  id v29 = __Block_byref_object_dispose__86;
  id v30 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__SKSetupCaptiveNetworkJoinServer__captiveNetworkLoginInfo_cookie_responseHandler___block_invoke;
  v22[3] = &unk_264549378;
  uint64_t v24 = &v25;
  v22[4] = self;
  id v10 = v9;
  id v23 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x223C632B0](v22);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v21 = CUPrintNSObjectOneLine();
    LogPrintF();
  }
  if (v8)
  {
    CFStringGetTypeID();
    int v13 = CFDictionaryGetTypedValue();
    if (v13)
    {
      CFStringGetTypeID();
      uint64_t v14 = CFDictionaryGetTypedValue();
      if (v14)
      {
        CFStringGetTypeID();
        int v15 = CFDictionaryGetTypedValue();
        if (v15)
        {
          self->_captiveNetworkCookie = a4;
          objc_storeStrong((id *)&self->_captiveNetworkInterfaceName, v15);
          self->_captiveNetworkWebSheetActive = 1;
          v31[0] = @"_cnSS";
          v31[1] = @"_cnUR";
          v32[0] = v14;
          v32[1] = v13;
          uint64_t v16 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
          (*((void (**)(id, void *, void, void, void *))v10 + 2))(v10, v16, 0, 0, &__block_literal_global_94);
        }
        else
        {
          uint64_t v20 = NSErrorF_safe();
          uint64_t v16 = (void *)v26[5];
          v26[5] = v20;
        }
      }
      else
      {
        uint64_t v19 = NSErrorF_safe();
        int v15 = (void *)v26[5];
        v26[5] = v19;
      }
    }
    else
    {
      uint64_t v18 = NSErrorF_safe();
      uint64_t v14 = (void *)v26[5];
      v26[5] = v18;
    }
  }
  else
  {
    uint64_t v17 = NSErrorF_safe();
    int v13 = (void *)v26[5];
    v26[5] = v17;
  }

  v11[2](v11);
  _Block_object_dispose(&v25, 8);
}

uint64_t __83__SKSetupCaptiveNetworkJoinServer__captiveNetworkLoginInfo_cookie_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)_captiveNetworkLoginRequest:(id)a3 responseHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = CUPrintNSObjectOneLine();
    LogPrintF();
  }
  id v8 = objc_alloc_init(SKCaptiveContext);
  [(SKCaptiveContext *)v8 setResponseHandler:v6];
  [(SKCaptiveContext *)v8 setServer:self];
  id v9 = v8;
  if (!MEMORY[0x223C62C80](_captiveNetworkLoginCallback, v9))
  {
    int v10 = self->super._ucat->var0;
    if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

    uint64_t v11 = NSErrorF_safe();
    (*((void (**)(id, void, void, void *, void *))v6 + 2))(v6, 0, 0, v11, &__block_literal_global_76);
  }
}

- (void)_connectionEnded:(id)a3
{
  [(SKSetupCaptiveNetworkJoinServer *)self _captiveNetworkProbeEnsureStopped];

  [(SKSetupCaptiveNetworkJoinServer *)self _networkRelayDeviceEnsureStopped];
}

- (void)_bleServerAcceptConnecton:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self->super._skCnx;
  if (v4)
  {
    id v5 = v4;
    int var0 = self->super._ucat->var0;
    if (var0 <= 90)
    {
      id v7 = v11;
      if (var0 != -1)
      {
LABEL_4:
        id v9 = v7;
        LogPrintF();
        objc_msgSend(v11, "invalidate", v9, v5);
        goto LABEL_8;
      }
      if (_LogCategory_Initialize())
      {
        id v7 = v11;
        goto LABEL_4;
      }
    }
    objc_msgSend(v11, "invalidate", v8, v10);
  }
  else
  {
    id v5 = objc_alloc_init(SKConnection);
    [(SKConnection *)v5 setBleConnection:v11];
    [(SKSetupBase *)self _connectionStartWithSKConnection:v5 clientMode:0 completeOnFailure:0 completion:&__block_literal_global_93];
  }
LABEL_8:
}

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(CBServer *)self->_bleServer invalidate];
  bleServer = self->_bleServer;
  self->_bleServer = 0;
}

- (void)_bleServerEnsureStarted
{
  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEF78]);
    objc_storeStrong((id *)p_bleServer, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setBleListenPSM:130];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke;
    v8[3] = &unk_264548FF8;
    v8[4] = v4;
    v8[5] = self;
    [v4 setAcceptHandler:v8];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v4;
      LogPrintF();
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke_2;
    v7[3] = &unk_2645496B0;
    v7[4] = v4;
    void v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7, v6);
  }
}

void __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) != *(void *)(v6 + 216))
  {
    id v7 = NSErrorF_safe();
    v5[2](v5, v7);

    goto LABEL_9;
  }
  int v8 = **(_DWORD **)(v6 + 144);
  id v9 = v12;
  if (v8 <= 30)
  {
    if (v8 == -1)
    {
      int v10 = _LogCategory_Initialize();
      uint64_t v6 = *(void *)(a1 + 40);
      if (!v10)
      {
        id v9 = v12;
        goto LABEL_8;
      }
      id v9 = v12;
    }
    id v11 = v9;
    LogPrintF();
    id v9 = v12;
    uint64_t v6 = *(void *)(a1 + 40);
  }
LABEL_8:
  objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
  [*(id *)(a1 + 40) _run];
  v5[2](v5, 0);
LABEL_9:
}

uint64_t __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void *)(v4 + 216))
  {
    int v6 = **(_DWORD **)(v4 + 144);
    id v13 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        id v11 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v11);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 216);
      *(void *)(v7 + 216) = 0;

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v12 = v5;
        LogPrintF();
        uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_run", v12);
LABEL_13:
        id v3 = v13;
        goto LABEL_14;
      }
      int v9 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 40);
      if (v9)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        goto LABEL_8;
      }
    }
    uint64_t v4 = objc_msgSend((id)v4, "_run", v11);
    goto LABEL_13;
  }
LABEL_14:

  return MEMORY[0x270F9A758](v4, v3);
}

- (void)_bleAdvertiserEnsureStopped
{
  bleAdvertiser = self->_bleAdvertiser;
  if (bleAdvertiser)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (int v5 = _LogCategory_Initialize(), bleAdvertiser = self->_bleAdvertiser, v5))
      {
        uint64_t v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }
  [(CBAdvertiser *)bleAdvertiser invalidate];
  int v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;
}

- (void)_bleAdvertiserEnsureStarted
{
  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEEF8]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setNearbyActionFlags:64];
    [v4 setNearbyActionType:39];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v4;
      LogPrintF();
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__SKSetupCaptiveNetworkJoinServer__bleAdvertiserEnsureStarted__block_invoke;
    v7[3] = &unk_2645496B0;
    v7[4] = v4;
    void v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7, v6);
  }
}

uint64_t __62__SKSetupCaptiveNetworkJoinServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 208))
  {
    id v10 = v3;
    if (v3)
    {
      int v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        int v9 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v9);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(v6 + 208);
      *(void *)(v6 + 208) = 0;
    }
    else
    {
      uint64_t v4 = [(id)v4 _run];
    }
    id v3 = v10;
  }

  return MEMORY[0x270F9A758](v4, v3);
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v3 = [(CBServer *)self->_bleServer bleListeningPSM];
  if (v3) {
    LOBYTE(v3) = [(SKConnection *)self->super._skCnx state] != 1 && GestaltGetDeviceClass() != 7;
  }
  return v3;
}

- (void)_runDetected
{
}

- (void)_runDefault
{
  if (self->super._sendDataHandler) {
    [(SKSetupCaptiveNetworkJoinServer *)self _oobEnsureStarted];
  }
  else {
    [(SKSetupCaptiveNetworkJoinServer *)self _bleServerEnsureStarted];
  }
  if ([(SKSetupCaptiveNetworkJoinServer *)self _bleAdvertiserShouldRun])
  {
    [(SKSetupCaptiveNetworkJoinServer *)self _bleAdvertiserEnsureStarted];
  }
  else
  {
    [(SKSetupCaptiveNetworkJoinServer *)self _bleAdvertiserEnsureStopped];
  }
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    int mode = self->_mode;
    if (mode == 2)
    {
      [(SKSetupCaptiveNetworkJoinServer *)self _runUserRequest];
    }
    else if (mode == 1)
    {
      [(SKSetupCaptiveNetworkJoinServer *)self _runDetected];
    }
    else if (mode)
    {
      int var0 = self->super._ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      [(SKSetupCaptiveNetworkJoinServer *)self _runDefault];
    }
  }
}

- (void)_invalidated
{
  if (!self->_cfuController)
  {
    v2.receiver = self;
    v2.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
    [(SKSetupBase *)&v2 _invalidated];
  }
}

- (void)_invalidate
{
  [(SKSetupCaptiveNetworkJoinServer *)self _bleAdvertiserEnsureStopped];
  [(SKSetupCaptiveNetworkJoinServer *)self _bleServerEnsureStopped];
  [(SKSetupCaptiveNetworkJoinServer *)self _captiveDetectedNotificationUpdate:0];
  [(SKSetupCaptiveNetworkJoinServer *)self _captiveNetworkProbeEnsureStopped];
  [(SKSetupCaptiveNetworkJoinServer *)self _cfuEnsuredStopped];
  [(SKSetupCaptiveNetworkJoinServer *)self _networkRelayDeviceEnsureStopped];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  [(SKSetupBase *)&v3 _invalidate];
}

- (void)_activate
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke;
  v11[3] = &unk_2645488A0;
  v11[4] = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_2;
  v10[3] = &unk_2645491E8;
  v10[4] = self;
  [(SKSetupBase *)self registerRequestID:@"_awSt" options:0 requestHandler:v11 completionHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_3;
  v9[3] = &unk_2645488A0;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_4;
  v8[3] = &unk_2645491E8;
  v8[4] = self;
  [(SKSetupBase *)self registerRequestID:@"_cnPb" options:0 requestHandler:v9 completionHandler:v8];
  v6[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_5;
  v7[3] = &unk_2645488A0;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_6;
  v6[3] = &unk_2645491E8;
  [(SKSetupBase *)self registerRequestID:@"_ntRl" options:0 requestHandler:v7 completionHandler:v6];
  v4[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_7;
  v5[3] = &unk_2645488A0;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_8;
  v4[3] = &unk_2645491E8;
  [(SKSetupBase *)self registerRequestID:@"_cnLg" options:0 requestHandler:v5 completionHandler:v4];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  [(SKSetupBase *)&v3 _activate];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _networkRelayAWDLStartRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _captiveNetworkProbeRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _networkRelaySetupRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _captiveNetworkLoginRequest:a3 responseHandler:a5];
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_8(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeWithError:a2];
  }
  return result;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v14 = [(id)objc_opt_class() description];
    CUAppendF();
    id v4 = 0;
  }
  uint64_t mode = self->_mode;
  if (mode > 2) {
    uint64_t v6 = @"?";
  }
  else {
    uint64_t v6 = off_264548910[mode];
  }
  int v15 = v6;
  CUAppendF();
  uint64_t v7 = (__CFString *)v4;

  int v8 = [(SKSetupBase *)self pskData];
  int v9 = v8;
  if (v8)
  {
    [v8 length];
    CUAppendF();
    id v10 = v7;

    uint64_t v7 = v10;
  }

  id v11 = &stru_26D1CA560;
  if (v7) {
    id v11 = v7;
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)dealloc
{
  [(SKSetupCaptiveNetworkJoinServer *)self _captiveDetectedNotificationUpdate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  [(SKSetupBase *)&v3 dealloc];
}

- (SKSetupCaptiveNetworkJoinServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  objc_super v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupCaptiveNetworkJoinServer];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_captiveDetectedNotifyToken = -1;
    v2->super._setupType = 2;
    id v4 = v2;
  }

  return v3;
}

+ (void)resetWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(getFLFollowUpControllerClass()) initWithClientIdentifier:@"com.apple.SetupKit"];
  if (v4)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__SKSetupCaptiveNetworkJoinServer_resetWithCompletionHandler___block_invoke;
    v6[3] = &unk_264548878;
    id v8 = v3;
    id v7 = v4;
    [v7 clearPendingFollowUpItemsWithUniqueIdentifiers:&unk_26D1D02B0 completion:v6];
  }
  else
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 90
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (v3)
    {
      int v5 = NSErrorF_safe();
      (*((void (**)(id, void *))v3 + 2))(v3, v5);
    }
  }
}

uint64_t __62__SKSetupCaptiveNetworkJoinServer_resetWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v9 = v4;
  if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || (v5 = _LogCategory_Initialize(), id v4 = v9, v5))
    {
      id v8 = CUPrintNSError();
      LogPrintF_safe();

      id v4 = v9;
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, id))(v6 + 16))(v6, v9);
    id v4 = v9;
  }

  return MEMORY[0x270F9A758](v6, v4);
}

@end