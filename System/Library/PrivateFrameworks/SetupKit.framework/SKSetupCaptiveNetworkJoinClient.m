@interface SKSetupCaptiveNetworkJoinClient
- (BOOL)_runNetworkRelayPeerStart;
- (SKSetupCaptiveNetworkJoinClient)init;
- (void)_captiveProbeRequest;
- (void)_captiveProbeResponse:(id)a3;
- (void)_invalidate;
- (void)_networkRelayEnsureStopped;
- (void)_postEvent:(id)a3;
- (void)_run;
- (void)_runAWDLFoundDevice:(id)a3;
- (void)_runAWDLFoundTimerStart;
- (void)_runAWDLStart;
- (void)_runCaptiveNetworkLoginResponse:(id)a3;
- (void)_runCaptiveNetworkLoginStart;
- (void)_runNetworkRelaySelfStart;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4;
@end

@implementation SKSetupCaptiveNetworkJoinClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_nrDeviceManager, 0);
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_networkRelayTimer, 0);
  objc_storeStrong((id *)&self->_networkRelayProxyInterface, 0);
  objc_storeStrong((id *)&self->_networkRelayPeerIPStr, 0);
  objc_storeStrong((id *)&self->_awdlTimer, 0);
  objc_storeStrong((id *)&self->_awdlPeerDevice, 0);
  objc_storeStrong((id *)&self->_awdlName, 0);

  objc_storeStrong((id *)&self->_awdlBrowser, 0);
}

- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  int var0 = self->super._ucat->var0;
  if (var0 <= 30)
  {
    v8 = v16;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_8;
      }
      v8 = v16;
    }
    if ([v8 isConnected]) {
      v9 = "yes";
    }
    else {
      v9 = "no";
    }
    [v16 linkType];
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v16 linkSubtype];
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    [v16 proxyServiceInterfaceName];
    v15 = v14 = StringFromNRLinkSubtype;
    v12 = v9;
    v13 = StringFromNRLinkType;
    LogPrintF();
  }
LABEL_8:
  if (objc_msgSend(v16, "isConnected", v12, v13, v14, v15)
    && !self->_networkRelayProxyInterface
    && [v6 length])
  {
    objc_storeStrong((id *)&self->_networkRelayProxyInterface, a4);
    [(SKSetupCaptiveNetworkJoinClient *)self _run];
  }
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
  BOOL v4 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  id v6 = [v10 proxyServiceInterfaceName];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [v10 linkType];
    id StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v10 linkSubtype];
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();
  }
  if (v4 && !self->_networkRelayProxyInterface && [v6 length])
  {
    objc_storeStrong((id *)&self->_networkRelayProxyInterface, v6);
    [(SKSetupCaptiveNetworkJoinClient *)self _run];
  }
}

- (void)_runCaptiveNetworkLoginResponse:(id)a3
{
  id v9 = a3;
  CFStringGetTypeID();
  BOOL v4 = CFDictionaryGetTypedValue();
  if (v4)
  {
    CFStringGetTypeID();
    v5 = CFDictionaryGetTypedValue();
    if (v5)
    {
      id v6 = (void *)[objc_alloc(NSURL) initWithString:v5];
      if (v6)
      {
        v7 = self->_networkRelayProxyInterface;
        if (v7)
        {
          v8 = [[SKEventCaptiveNetworkPresent alloc] initWithCaptiveURL:v6 interfaceIdentifier:v7 ssid:v4];
          [(SKSetupBase *)self _reportEvent:v8];
          self->_captiveNetworkLoginDone = 1;
          [(SKSetupCaptiveNetworkJoinClient *)self _run];
        }
        else
        {
          NSErrorF_safe();
          v8 = (SKEventCaptiveNetworkPresent *)objc_claimAutoreleasedReturnValue();
          [(SKSetupBase *)self _completeWithError:v8];
        }
      }
      else
      {
        NSErrorF_safe();
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[SKSetupBase _completeWithError:](self, "_completeWithError:", v7, v5);
      }
    }
    else
    {
      id v6 = NSErrorF_safe();
      [(SKSetupBase *)self _completeWithError:v6];
    }
  }
  else
  {
    v5 = NSErrorF_safe();
    [(SKSetupBase *)self _completeWithError:v5];
  }
}

- (void)_runCaptiveNetworkLoginStart
{
  v7[1] = *MEMORY[0x263EF8340];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = @"timeoutSeconds";
  v7[0] = &unk_26D1D0418;
  BOOL v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SKSetupCaptiveNetworkJoinClient__runCaptiveNetworkLoginStart__block_invoke;
  v5[3] = &unk_264549518;
  v5[4] = self;
  [(SKSetupBase *)self sendRequestID:@"_cnLg" requestMessage:MEMORY[0x263EFFA78] options:v4 responseHandler:v5];
}

void __63__SKSetupCaptiveNetworkJoinClient__runCaptiveNetworkLoginStart__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  v11 = *(_DWORD ***)(a1 + 32);
  int v12 = *v11[18];
  id v19 = v10;
  if (!v10 || v9)
  {
    if (v12 <= 90)
    {
      if (v12 != -1 || (int v15 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v15))
      {
        v18 = CUPrintNSError();
        LogPrintF();

        v11 = *(_DWORD ***)(a1 + 32);
      }
    }
    if (v9)
    {
      [v11 _completeWithError:v9];
    }
    else
    {
      id v16 = NSErrorF_safe();
      [v11 _completeWithError:v16];
    }
  }
  else
  {
    id v13 = v10;
    if (v12 <= 30)
    {
      if (v12 != -1 || (int v14 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v14))
      {
        v17 = CUPrintNSObjectOneLine();
        LogPrintF();

        id v13 = v19;
        v11 = *(_DWORD ***)(a1 + 32);
      }
      else
      {
        id v13 = v19;
      }
    }
    objc_msgSend(v11, "_runCaptiveNetworkLoginResponse:", v13, v17);
  }
}

- (void)_runNetworkRelaySelfStart
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__575;
  v45 = __Block_byref_object_dispose__576;
  id v46 = 0;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke;
  v40[3] = &unk_2645494E8;
  v40[4] = self;
  v40[5] = &v41;
  v3 = (void (**)(void))MEMORY[0x223C632B0](v40, a2);
  BOOL v4 = self->_nrDeviceManager;
  if (!v4)
  {
    BOOL v4 = (NRDeviceManager *)[MEMORY[0x263F58218] copySharedDeviceManager];
    if (!v4)
    {
      uint64_t v30 = NSErrorF_safe();
      BOOL v4 = (NRDeviceManager *)v42[5];
      v42[5] = (id)v30;
      goto LABEL_27;
    }
    objc_storeStrong((id *)&self->_nrDeviceManager, v4);
  }
  p_nrDeviceIdentifier = &self->_nrDeviceIdentifier;
  id v6 = self->_nrDeviceIdentifier;
  if (v6)
  {
    int var0 = self->super._ucat->var0;
    if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v32 = [(NRDeviceIdentifier *)v6 nrDeviceIdentifier];
      LogPrintF();
    }
    -[NRDeviceManager unregisterDevice:](v4, "unregisterDevice:", v6, v32);
    id v8 = *p_nrDeviceIdentifier;
    *p_nrDeviceIdentifier = 0;
  }
  id v9 = (void *)[MEMORY[0x263F58210] newEphemeralDeviceIdentifier];
  if (v9)
  {
    objc_storeStrong((id *)&self->_nrDeviceIdentifier, v9);
    id v10 = objc_alloc_init(MEMORY[0x263F58248]);
    v11 = [(NSString *)self->_networkRelayPeerIPStr UTF8String];
    if (v11)
    {
      memset(v38, 0, sizeof(v38));
      int v39 = 0;
      uint64_t v37 = 0;
      if (StringToSockAddr())
      {
        uint64_t v24 = NSErrorF_safe();
        id v13 = v42[5];
        v42[5] = (id)v24;
      }
      else
      {
        int v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v38 length:v37];
        [v10 setAwdlAddressData:v12];

        if ([(NSData *)self->super._pskData length])
        {
          [(NSData *)self->super._pskData bytes];
          [(NSData *)self->super._pskData length];
          CryptoHKDF();
          id v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", v47, 32, v47);
        }
        else
        {
          skCnx = self->super._skCnx;
          int v15 = v42;
          id obj = v42[5];
          id v13 = [(SKConnection *)skCnx deriveKeyWithSaltPtr:"NetworkRelaySalt" saltLen:16 infoPtr:"NetworkRelayInfo" infoLen:16 keyLen:32 error:&obj];
          objc_storeStrong(v15 + 5, obj);
        }
        if (v13)
        {
          [v10 setOutOfBandKey:v13];
          id v16 = objc_alloc_init(MEMORY[0x263F58230]);
          [v16 setAllowedLinkTypes:&unk_26D1D0310];
          [v16 setAllowedLinkSubtypes:&unk_26D1D0328];
          [v16 setProxyCapability:2];
          v17 = (void *)[objc_alloc(MEMORY[0x263F58228]) initWithDeviceIdentifier:*p_nrDeviceIdentifier delegate:self queue:self->super._dispatchQueue];
          if (v17)
          {
            objc_storeStrong((id *)&self->_nrDeviceMonitor, v17);
            int v18 = self->super._ucat->var0;
            if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
            {
              v32 = v9;
              v33 = v11;
              LogPrintF();
            }
            dispatchQueue = self->super._dispatchQueue;
            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_85;
            v35[3] = &unk_2645491E8;
            v35[4] = self;
            -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:](v4, "registerDevice:properties:operationalproperties:queue:completionBlock:", v9, v10, v16, dispatchQueue, v35, v32, v33);
            dispatch_source_t v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
            objc_storeStrong((id *)&self->_networkRelayTimer, v20);
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 3221225472;
            handler[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_2;
            handler[3] = &unk_2645494C0;
            handler[4] = v20;
            handler[5] = self;
            dispatch_source_set_event_handler(v20, handler);
            CUDispatchTimerSet();
            dispatch_activate(v20);
          }
          else
          {
            uint64_t v28 = NSErrorF_safe();
            id v29 = v42[5];
            v42[5] = (id)v28;
          }
        }
        else
        {
          v25 = v42;
          id v26 = v42[5];
          if (v26)
          {
            id v27 = v26;
            id v16 = v25[5];
            v25[5] = v27;
          }
          else
          {
            uint64_t v31 = NSErrorF_safe();
            id v16 = v42[5];
            v42[5] = (id)v31;
          }
        }
      }
    }
    else
    {
      uint64_t v22 = NSErrorF_safe();
      id v23 = v42[5];
      v42[5] = (id)v22;
    }
  }
  else
  {
    uint64_t v21 = NSErrorF_safe();
    id v10 = v42[5];
    v42[5] = (id)v21;
  }

LABEL_27:
  v3[2](v3);

  _Block_object_dispose(&v41, 8);
}

uint64_t __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    uint64_t v2 = result;
    v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), uint64_t v1 = *(void *)(v2 + 40), v5))
      {
        id v7 = CUPrintNSError();
        LogPrintF();

        v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v1 + 8) + 40);
    return [v3 _completeWithError:v6];
  }
  return result;
}

uint64_t __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_85(uint64_t a1, void *a2)
{
  id v10 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  id v3 = v10;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  if (v10)
  {
    if (v5 <= 90 && (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6)))
    {
      id v9 = CUPrintNSError();
      LogPrintF();

      int v4 = (_DWORD **)objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v10, v9);
    }
    else
    {
      int v4 = (_DWORD **)objc_msgSend(v4, "_completeWithError:", v10, v8);
    }
    goto LABEL_10;
  }
  if (v5 <= 30)
  {
    if (v5 != -1 || (int v4 = (_DWORD **)_LogCategory_Initialize(), v3 = 0, v4))
    {
      int v4 = (_DWORD **)LogPrintF();
LABEL_10:
      id v3 = v10;
    }
  }

  return MEMORY[0x270F9A758](v4, v3);
}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelaySelfStart__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1 == (void *)v2[33])
  {
    if (v1)
    {
      int v4 = v1;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(void **)(v5 + 264);
      *(void *)(v5 + 264) = 0;

      uint64_t v2 = *(void **)(a1 + 40);
    }
    NSErrorF_safe();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _completeWithError:v7];
  }
}

- (BOOL)_runNetworkRelayPeerStart
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  if (CUGetInterfaceAddresses())
  {
    v11 = NSErrorF_safe();
    [(SKSetupBase *)self _completeWithError:v11];

    return 0;
  }
  else
  {
    int v3 = SockAddrToString();
    BOOL v4 = v3 == 0;
    if (v3)
    {
      int v6 = NSErrorF_safe();
      [(SKSetupBase *)self _completeWithError:v6];
    }
    else
    {
      uint64_t v5 = [NSString stringWithUTF8String:v23];
      uint64_t v21 = @"_ip";
      uint64_t v22 = v5;
      int v6 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v19 = @"timeoutSeconds";
      dispatch_source_t v20 = &unk_26D1D0418;
      id v7 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        int v12 = CUPrintNSObjectOneLine();
        LogPrintF();
      }
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelayPeerStart__block_invoke;
      v13[3] = &unk_264548D28;
      v13[4] = self;
      id v14 = v5;
      id v9 = v5;
      [(SKSetupBase *)self sendRequestID:@"_ntRl" requestMessage:v6 options:v7 responseHandler:v13];
    }
  }
  return v4;
}

void __60__SKSetupCaptiveNetworkJoinClient__runNetworkRelayPeerStart__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v24 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v24 || v8)
  {
    id v14 = *(_DWORD ***)(a1 + 32);
    int v15 = *v14[18];
    if (v15 <= 90)
    {
      if (v15 != -1 || (int v16 = _LogCategory_Initialize(), v14 = *(_DWORD ***)(a1 + 32), v16))
      {
        uint64_t v22 = CUPrintNSError();
        LogPrintF();

        id v14 = *(_DWORD ***)(a1 + 32);
      }
    }
    if (v8)
    {
      [v14 _completeWithError:v8];
    }
    else
    {
      uint64_t v17 = NSErrorF_safe();
      [v14 _completeWithError:v17];
    }
  }
  else
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 UTF8String];
    v11 = *(id **)(a1 + 32);
    if (v10)
    {
      objc_storeStrong(v11 + 31, v9);
      int v12 = *(_DWORD ***)(a1 + 32);
      int v13 = *v12[18];
      if (v13 <= 30 && (v13 != -1 || (v18 = _LogCategory_Initialize(), int v12 = *(_DWORD ***)(a1 + 32), v18)))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 32), "_run", v21, v9);
      }
      else
      {
        objc_msgSend(v12, "_run", v20, v23);
      }
    }
    else
    {
      id v19 = NSErrorF_safe();
      [v11 _completeWithError:v19];
    }
  }
}

- (void)_runAWDLFoundDevice:(id)a3
{
  id v13 = a3;
  uint64_t v5 = [v13 name];
  awdlName = self->_awdlName;
  id v7 = v5;
  id v8 = awdlName;
  if (v7 == v8)
  {
  }
  else
  {
    id v9 = v8;
    if ((v7 == 0) == (v8 != 0))
    {

LABEL_15:
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_11;
    }
    char v10 = [(NSString *)v7 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_15;
    }
  }
  int v11 = self->super._ucat->var0;
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_awdlPeerDevice, a3);
  [(SKSetupCaptiveNetworkJoinClient *)self _run];
LABEL_11:
}

- (void)_runAWDLFoundTimerStart
{
  int v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
  awdlTimer = self->_awdlTimer;
  self->_awdlTimer = v3;
  uint64_t v5 = v3;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SKSetupCaptiveNetworkJoinClient__runAWDLFoundTimerStart__block_invoke;
  v6[3] = &unk_2645494C0;
  v6[4] = v5;
  v6[5] = self;
  dispatch_source_set_event_handler(v5, v6);
  CUDispatchTimerSet();
  dispatch_activate(v5);
}

void __58__SKSetupCaptiveNetworkJoinClient__runAWDLFoundTimerStart__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1 == (void *)v2[30])
  {
    if (v1)
    {
      BOOL v4 = v1;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(void **)(v5 + 240);
      *(void *)(v5 + 240) = 0;

      uint64_t v2 = *(void **)(a1 + 40);
    }
    NSErrorF_safe();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _completeWithError:v7];
  }
}

- (void)_runAWDLStart
{
  v19[2] = *MEMORY[0x263EF8340];
  p_awdlBrowser = &self->_awdlBrowser;
  [(CUBonjourBrowser *)self->_awdlBrowser invalidate];
  awdlPeerDevice = self->_awdlPeerDevice;
  self->_awdlPeerDevice = 0;

  id v5 = objc_alloc_init(MEMORY[0x263F38538]);
  objc_storeStrong((id *)p_awdlBrowser, v5);
  [v5 setChangeFlags:0xFFFFFFFFLL];
  [v5 setDispatchQueue:self->super._dispatchQueue];
  [v5 setDomain:@"local."];
  [v5 setInterfaceName:@"awdl0"];
  [v5 setServiceType:@"_setupkit._tcp"];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke;
  v14[3] = &unk_264548CD8;
  v14[4] = v5;
  v14[5] = self;
  [v5 setDeviceFoundHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_2;
  v13[3] = &unk_264548D00;
  v13[4] = v5;
  void v13[5] = self;
  [v5 setDeviceChangedHandler:v13];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v5 activate];
  *(void *)((char *)v19 + 5) = 0;
  v19[0] = 0;
  RandomString();
  id v7 = (void *)[[NSString alloc] initWithUTF8String:v19];
  objc_storeStrong((id *)&self->_awdlName, v7);
  int v8 = self->super._ucat->var0;
  if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
  {
    int v11 = v7;
    LogPrintF();
  }
  self->_awdlAdvertiserPeerStarted = 0;
  uint64_t v17 = @"_nm";
  int v18 = v7;
  id v9 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1, v11);
  int v15 = @"timeoutSeconds";
  int v16 = &unk_26D1D0418;
  char v10 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_3;
  v12[3] = &unk_264549518;
  v12[4] = self;
  [(SKSetupBase *)self sendRequestID:@"_awSt" requestMessage:v9 options:v10 responseHandler:v12];
}

void *__48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[27]) {
    return (void *)[result _runAWDLFoundDevice:a2];
  }
  return result;
}

void *__48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[27]) {
    return (void *)[result _runAWDLFoundDevice:a2];
  }
  return result;
}

void __48__SKSetupCaptiveNetworkJoinClient__runAWDLStart__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = **(_DWORD **)(v9 + 144);
  if (!v15 || v8)
  {
    if (v10 <= 90)
    {
      if (v10 != -1 || (v12 = _LogCategory_Initialize(), uint64_t v9 = *(void *)(a1 + 32), v12))
      {
        id v14 = CUPrintNSError();
        LogPrintF();

        uint64_t v9 = *(void *)(a1 + 32);
      }
    }
    if (v8)
    {
      [(id)v9 _completeWithError:v8];
    }
    else
    {
      id v13 = NSErrorF_safe();
      [(id)v9 _completeWithError:v13];
    }
  }
  else
  {
    if (v10 <= 30)
    {
      if (v10 != -1 || (v11 = _LogCategory_Initialize(), uint64_t v9 = *(void *)(a1 + 32), v11))
      {
        LogPrintF();
        uint64_t v9 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v9 + 210) = 1;
    [*(id *)(a1 + 32) _run];
  }
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      switch(runState)
      {
        case 0:
          int v4 = 11;
          goto LABEL_26;
        case 11:
          [(SKSetupBase *)self _connectionStartWithSKConnection:0 clientMode:1 completeOnFailure:1 completion:&__block_literal_global_621];
          goto LABEL_24;
        case 12:
          int v5 = [(SKConnection *)self->super._skCnx state];
          int v4 = self->super._runState;
          if (v5 != 1) {
            break;
          }
          goto LABEL_25;
        case 13:
          [(SKSetupCaptiveNetworkJoinClient *)self _runAWDLStart];
          goto LABEL_24;
        case 14:
          if (self->_awdlAdvertiserPeerStarted)
          {
            int v4 = 15;
            goto LABEL_26;
          }
          int v4 = 14;
          break;
        case 15:
          [(SKSetupCaptiveNetworkJoinClient *)self _runAWDLFoundTimerStart];
          goto LABEL_24;
        case 16:
          if (!self->_awdlPeerDevice)
          {
            int v4 = 16;
            break;
          }
          uint64_t v6 = 240;
          awdlTimer = self->_awdlTimer;
          if (awdlTimer) {
            goto LABEL_22;
          }
          int v4 = 16;
          goto LABEL_25;
        case 17:
          BOOL v8 = [(SKSetupCaptiveNetworkJoinClient *)self _runNetworkRelayPeerStart];
          int v4 = self->super._runState;
          if (!v8) {
            break;
          }
          goto LABEL_25;
        case 18:
          if (self->_networkRelayPeerIPStr)
          {
            int v4 = 19;
            goto LABEL_26;
          }
          int v4 = 18;
          break;
        case 19:
          [(SKSetupCaptiveNetworkJoinClient *)self _runNetworkRelaySelfStart];
          goto LABEL_24;
        case 20:
          if (!self->_networkRelayProxyInterface)
          {
            int v4 = 20;
            break;
          }
          uint64_t v6 = 264;
          awdlTimer = self->_networkRelayTimer;
          if (awdlTimer)
          {
LABEL_22:
            uint64_t v9 = awdlTimer;
            dispatch_source_cancel(v9);
            int v10 = *(Class *)((char *)&self->super.super.isa + v6);
            *(Class *)((char *)&self->super.super.isa + v6) = 0;

LABEL_24:
            int v4 = self->super._runState;
          }
          else
          {
            int v4 = 20;
          }
LABEL_25:
          ++v4;
          goto LABEL_26;
        case 21:
          [(SKSetupCaptiveNetworkJoinClient *)self _runCaptiveNetworkLoginStart];
          goto LABEL_24;
        case 22:
          if (self->_captiveNetworkLoginDone)
          {
            int v4 = 23;
            goto LABEL_26;
          }
          int v4 = 22;
          break;
        case 23:
          if (self->_captiveNetworkProbingSuccess)
          {
            int v4 = 24;
LABEL_26:
            self->super._int runState = v4;
          }
          else
          {
            int v4 = 23;
          }
          break;
        case 24:
          [(SKSetupBase *)self _completeWithError:0];
          int v4 = self->super._runState;
          break;
        default:
          return;
      }
      if (v4 == runState) {
        break;
      }
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)_postEvent:(id)a3
{
  id v4 = a3;
  if ([v4 eventType] == 201)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [(SKSetupCaptiveNetworkJoinClient *)self _captiveProbeRequest];
    }
    else
    {
      [(SKSetupCaptiveNetworkJoinClient *)self _captiveProbeRequest];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKSetupCaptiveNetworkJoinClient;
    [(SKSetupBase *)&v7 _postEvent:v4];
  }
}

- (void)_networkRelayEnsureStopped
{
  [(CUBonjourBrowser *)self->_awdlBrowser invalidate];
  awdlBrowser = self->_awdlBrowser;
  self->_awdlBrowser = 0;

  awdlTimer = self->_awdlTimer;
  if (awdlTimer)
  {
    int v5 = awdlTimer;
    dispatch_source_cancel(v5);
    uint64_t v6 = self->_awdlTimer;
    self->_awdlTimer = 0;
  }
  networkRelayTimer = self->_networkRelayTimer;
  if (networkRelayTimer)
  {
    BOOL v8 = networkRelayTimer;
    dispatch_source_cancel(v8);
    uint64_t v9 = self->_networkRelayTimer;
    self->_networkRelayTimer = 0;
  }
  int v18 = self->_nrDeviceManager;
  int v10 = self->_nrDeviceIdentifier;
  if (v18) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = [(NRDeviceIdentifier *)v10 nrDeviceIdentifier];
      LogPrintF();

      -[NRDeviceManager unregisterDevice:](v18, "unregisterDevice:", v10, v17);
    }
    else
    {
      -[NRDeviceManager unregisterDevice:](v18, "unregisterDevice:", v10, v16);
    }
  }
  nrDeviceIdentifier = self->_nrDeviceIdentifier;
  self->_nrDeviceIdentifier = 0;

  nrDeviceManager = self->_nrDeviceManager;
  self->_nrDeviceManager = 0;

  nrDeviceMonitor = self->_nrDeviceMonitor;
  self->_nrDeviceMonitor = 0;
}

- (void)_captiveProbeResponse:(id)a3
{
}

- (void)_captiveProbeRequest
{
  v7[1] = *MEMORY[0x263EF8340];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v6 = @"timeoutSeconds";
  v7[0] = &unk_26D1D0418;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SKSetupCaptiveNetworkJoinClient__captiveProbeRequest__block_invoke;
  v5[3] = &unk_264549518;
  v5[4] = self;
  [(SKSetupBase *)self sendRequestID:@"_cnPb" requestMessage:MEMORY[0x263EFFA78] options:v4 responseHandler:v5];
}

void __55__SKSetupCaptiveNetworkJoinClient__captiveProbeRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  BOOL v11 = *(_DWORD ***)(a1 + 32);
  int v12 = *v11[18];
  id v19 = v10;
  if (!v10 || v9)
  {
    if (v12 <= 90)
    {
      if (v12 != -1 || (int v15 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v15))
      {
        int v18 = CUPrintNSError();
        LogPrintF();

        BOOL v11 = *(_DWORD ***)(a1 + 32);
      }
    }
    if (v9)
    {
      [v11 _completeWithError:v9];
    }
    else
    {
      uint64_t v16 = NSErrorF_safe();
      [v11 _completeWithError:v16];
    }
  }
  else
  {
    id v13 = v10;
    if (v12 <= 30)
    {
      if (v12 != -1 || (int v14 = _LogCategory_Initialize(), v11 = *(_DWORD ***)(a1 + 32), v14))
      {
        uint64_t v17 = CUPrintNSObjectOneLine();
        LogPrintF();

        id v13 = v19;
        BOOL v11 = *(_DWORD ***)(a1 + 32);
      }
      else
      {
        id v13 = v19;
      }
    }
    objc_msgSend(v11, "_captiveProbeResponse:", v13, v17);
  }
}

- (void)_invalidate
{
  [(SKSetupCaptiveNetworkJoinClient *)self _networkRelayEnsureStopped];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupCaptiveNetworkJoinClient;
  [(SKSetupBase *)&v3 _invalidate];
}

- (SKSetupCaptiveNetworkJoinClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupCaptiveNetworkJoinClient;
  uint64_t v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupCaptiveNetworkJoinClient];
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end