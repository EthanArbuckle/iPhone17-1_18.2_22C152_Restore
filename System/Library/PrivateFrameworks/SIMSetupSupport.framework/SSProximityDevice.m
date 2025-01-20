@interface SSProximityDevice
- (CUMessageSession)session;
- (CoreTelephonyClient)client;
- (NSDictionary)remoteInfo;
- (SSProximityDevice)initWithQueue:(id)a3 endpoint:(unint64_t)a4 remoteInfo:(id)a5;
- (id)eventHandler;
- (id)skEventFromDictionary:(id)a3;
- (id)templateSession;
- (unint64_t)endpoint;
- (void)activate:(id)a3;
- (void)invalidate:(BOOL)a3;
- (void)proxSetupAuthEventUpdate:(id)a3;
- (void)setClient:(id)a3;
- (void)setEndpoint:(unint64_t)a3;
- (void)setEventHandler:(id)a3;
- (void)setRemoteInfo:(id)a3;
- (void)setSession:(id)a3;
- (void)templateSession;
- (void)verifyPIN:(id)a3;
@end

@implementation SSProximityDevice

- (SSProximityDevice)initWithQueue:(id)a3 endpoint:(unint64_t)a4 remoteInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    v16.receiver = self;
    v16.super_class = (Class)SSProximityDevice;
    v10 = [(SSProximityDevice *)&v16 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      v10->_endpoint = a4;
      objc_storeStrong((id *)&v10->_remoteInfo, a5);
      uint64_t v12 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v8];
      id v13 = p_isa[2];
      p_isa[2] = (id)v12;

      [p_isa[2] setDelegate:p_isa];
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)activate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  client = self->_client;
  unint64_t endpoint = self->_endpoint;
  remoteInfo = self->_remoteInfo;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__SSProximityDevice_activate___block_invoke;
  v9[3] = &unk_264828010;
  id v8 = v4;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [(CoreTelephonyClient *)client getProximityTransportSession:endpoint remoteDeviceInfo:remoteInfo completion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __30__SSProximityDevice_activate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = sLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __30__SSProximityDevice_activate___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setSession:v5];

    id v15 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_super v16 = [v15 client];
    id v17 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v18 = [v17 endpoint];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __30__SSProximityDevice_activate___block_invoke_1;
    v19[3] = &unk_264827FE8;
    id v20 = *(id *)(a1 + 32);
    [v16 activateProximityTransfer:v18 completion:v19];
  }
}

void __30__SSProximityDevice_activate___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __30__SSProximityDevice_activate___block_invoke_1_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate:(BOOL)a3
{
}

void __32__SSProximityDevice_invalidate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __32__SSProximityDevice_invalidate___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)verifyPIN:(id)a3
{
  id v4 = a3;
  client = self->_client;
  unint64_t endpoint = self->_endpoint;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__SSProximityDevice_verifyPIN___block_invoke;
  v8[3] = &unk_264828038;
  id v9 = v4;
  id v7 = v4;
  [(CoreTelephonyClient *)client validateProximityTransfer:endpoint pin:v7 completion:v8];
}

void __31__SSProximityDevice_verifyPIN___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __31__SSProximityDevice_verifyPIN___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (id)templateSession
{
  session = self->_session;
  if (session)
  {
    id v3 = session;
  }
  else
  {
    id v4 = sLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SSProximityDevice templateSession](v4);
    }
  }
  return session;
}

- (void)proxSetupAuthEventUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSProximityDevice *)self eventHandler];

  if (v5)
  {
    uint64_t v6 = [(SSProximityDevice *)self eventHandler];
    id v7 = [(SSProximityDevice *)self skEventFromDictionary:v4];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
  else
  {
    uint64_t v8 = sLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SSProximityDevice proxSetupAuthEventUpdate:](v8);
    }
  }
}

- (id)skEventFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"eventType"];
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 intValue];
  id v7 = [v3 objectForKeyedSubscript:@"error"];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F68070]) initWithEventType:v6 error:v7];
  }
  else
  {
    if ((int)v6 > 119)
    {
      if ((int)v6 <= 199)
      {
        if (v6 == 120)
        {
          v14 = [v3 objectForKeyedSubscript:@"pairingFlags"];

          if (v14) {
            uint64_t v15 = [v14 intValue];
          }
          else {
            uint64_t v15 = 0;
          }
          id v17 = [v3 objectForKeyedSubscript:@"passwordType"];

          if (v17) {
            uint64_t v18 = [v17 intValue];
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v5 = [v3 objectForKeyedSubscript:@"throttleSeconds"];

          if (v5) {
            uint64_t v19 = [v5 intValue];
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v8 = [objc_alloc((Class)getSKAuthenticationRequestEventClass()) initWithPasswordType:v18 pairingFlags:v15 throttleSeconds:v19];
          goto LABEL_15;
        }
        if (v6 == 130)
        {
          objc_super v16 = [v3 objectForKeyedSubscript:@"password"];
          id v9 = (void *)[objc_alloc((Class)getSKAuthenticationResponseEventClass()) initWithPassword:v16];

          goto LABEL_16;
        }
      }
    }
    else if ((v6 > 0x29 || ((1 << v6) & 0x30040100401) == 0) && v6 == 110)
    {
      uint64_t v10 = [v3 objectForKeyedSubscript:@"password"];
      uint64_t v11 = [v3 objectForKeyedSubscript:@"passwordType"];

      if (v11) {
        uint64_t v12 = [v11 intValue];
      }
      else {
        uint64_t v12 = 0;
      }
      id v9 = (void *)[objc_alloc((Class)getSKAuthenticationPresentEventClass()) initWithPasswordType:v12 password:v10];

      uint64_t v5 = v11;
      goto LABEL_16;
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x263F68070]) initWithEventType:v6];
  }
LABEL_15:
  id v9 = (void *)v8;
LABEL_16:

LABEL_17:
  return v9;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClient:(id)a3
{
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_unint64_t endpoint = a3;
}

- (CUMessageSession)session
{
  return (CUMessageSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)remoteInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

void __30__SSProximityDevice_activate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __30__SSProximityDevice_activate___block_invoke_1_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __32__SSProximityDevice_invalidate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31__SSProximityDevice_verifyPIN___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "verify PIN(%@) failed : %@", (uint8_t *)&v4, 0x16u);
}

- (void)templateSession
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "invalid template session", v1, 2u);
}

- (void)proxSetupAuthEventUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "no event handler registerred", v1, 2u);
}

@end