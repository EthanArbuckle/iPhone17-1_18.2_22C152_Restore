@interface SKStepWiFiPreflight
- (BOOL)checkWiFiAndReturnError:(id *)a3;
- (BOOL)preventAppleWiFi;
- (CUEnvironment)environment;
- (CUMessaging)skMessaging;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepWiFiPreflight)init;
- (id)skCompletionHandler;
- (void)activate;
- (void)dealloc;
- (void)setDispatchQueue:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPreventAppleWiFi:(BOOL)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepWiFiPreflight

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setPreventAppleWiFi:(BOOL)a3
{
  self->_preventAppleWiFi = a3;
}

- (BOOL)preventAppleWiFi
{
  return self->_preventAppleWiFi;
}

- (void)setSkSetupObject:(id)a3
{
}

- (SKSetupBase)skSetupObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_skSetupObject);

  return (SKSetupBase *)WeakRetained;
}

- (void)setSkMessaging:(id)a3
{
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkCompletionHandler:(id)a3
{
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (NSString)label
{
  return self->_label;
}

- (void)setEnvironment:(id)a3
{
}

- (CUEnvironment)environment
{
  return self->_environment;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)checkWiFiAndReturnError:(id *)a3
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6 = [(CUEnvironment *)self->_environment objectForKeyedSubscript:@"_wifiInfo"];
  CFDictionaryGetTypeID();
  v7 = CFGetTypedObject();

  if (!v7) {
    v7 = (void *)WiFiCopyCurrentNetworkInfoEx();
  }
  CFStringGetTypeID();
  v8 = CFDictionaryGetTypedValue();
  if (!v8)
  {
    if (a3) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (CFDictionaryGetInt64())
  {
    if (Int64Ranged != 1)
    {
      uint64_t v10 = NSPrintF();
      if (v10)
      {
        v14 = (void *)v10;
        if (a3)
        {
          NSErrorF_safe();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_27;
      }
    }
  }
  if (Int64Ranged >= 2)
  {
    if (a3) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (self->_preventAppleWiFi && [v8 isEqual:@"AppleWiFi"])
  {
    if (a3)
    {
LABEL_29:
      NSErrorF_safe();
      BOOL v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_27:
    BOOL v12 = 0;
    goto LABEL_19;
  }
  int v11 = self->_ucat->var0;
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v12 = 1;
LABEL_19:

  return v12;
}

- (void)activate
{
  uint64_t v3 = MEMORY[0x223C632B0](self->_skCompletionHandler, a2);
  if (v3)
  {
    v4 = (void *)v3;
    id v11 = 0;
    [(SKStepWiFiPreflight *)self checkWiFiAndReturnError:&v11];
    id v5 = v11;
    uint64_t v6 = MEMORY[0x223C632B0](self->_skCompletionHandler);
    v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    }
  }
  else
  {
    v8 = (SKStepWiFiPreflight *)CUFatalErrorF();
    [(SKStepWiFiPreflight *)v8 setLabel:v10];
  }
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];

  LogCategoryReplaceF();
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKStepWiFiPreflight;
  [(SKStepWiFiPreflight *)&v4 dealloc];
}

- (SKStepWiFiPreflight)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKStepWiFiPreflight;
  v2 = [(SKStepWiFiPreflight *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3->_preventAppleWiFi = 1;
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiPreflight;
    objc_super v4 = v3;
  }

  return v3;
}

@end