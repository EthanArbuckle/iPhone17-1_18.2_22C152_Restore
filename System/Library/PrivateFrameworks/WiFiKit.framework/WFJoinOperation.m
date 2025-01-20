@interface WFJoinOperation
- (CWFAssocParameters)associationParameters;
- (CWFInterface)interface;
- (WFJoinOperation)initWithAssocParameters:(id)a3 interface:(id)a4;
- (WFJoinOperation)initWithNetwork:(id)a3 profile:(id)a4;
- (WFNetworkProfile)profile;
- (WFNetworkScanRecord)network;
- (__WiFiDeviceClient)device;
- (__WiFiManagerClient)manager;
- (id)name;
- (void)_joinComplete:(int)a3 userInfo:(__CFDictionary *)a4 network:(__WiFiNetwork *)a5;
- (void)_joinWithCoreWiFi;
- (void)dealloc;
- (void)joinNetworkRef:(__WiFiNetwork *)a3;
- (void)setAssociationParameters:(id)a3;
- (void)setDevice:(__WiFiDeviceClient *)a3;
- (void)setInterface:(id)a3;
- (void)setManager:(__WiFiManagerClient *)a3;
- (void)setName:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setProfile:(id)a3;
- (void)start;
@end

@implementation WFJoinOperation

- (WFJoinOperation)initWithAssocParameters:(id)a3 interface:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFJoinOperation;
  v9 = [(WFJoinOperation *)&v19 init];
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_associationParameters, a3);
      objc_storeStrong((id *)&v10->_interface, a4);
      v11 = NSString;
      v12 = [v7 scanResult];
      v13 = [(WFJoinOperation *)v12 networkName];
      uint64_t v14 = [v11 stringWithFormat:@"Association operation to network='%@'", v13];
      name = v10->_name;
      v10->_name = (NSString *)v14;
    }
    else
    {
      v13 = WFLogForCategory(5uLL);
      os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v18))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[WFJoinOperation initWithAssocParameters:interface:]";
        _os_log_impl(&dword_226071000, v13, v18, "%s: missing association parameters", buf, 0xCu);
      }
      v12 = v10;
      v10 = 0;
    }
    v16 = v10;

    v10 = v12;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (WFJoinOperation)initWithNetwork:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFJoinOperation;
  v9 = [(WFJoinOperation *)&v21 init];
  v10 = v9;
  if (!v9 || (objc_storeStrong((id *)&v9->_profile, a4), !v7))
  {
    v11 = 0;
LABEL_25:

    v10 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v10->_network, a3);
  v11 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  v10->_manager = v11;
  if (!v11)
  {
    v16 = WFLogForCategory(5uLL);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16)
    {
      if (os_log_type_enabled(v16, v19))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_226071000, v16, v19, "failed to create WiFiManagerClientRef", v20, 2u);
      }
      v11 = 0;
    }
    goto LABEL_24;
  }
  v12 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v12 getCFRunLoop];
  WiFiManagerClientScheduleWithRunLoop();

  v13 = (__WiFiManagerClient *)WiFiManagerClientCopyDevices();
  v11 = v13;
  if (!v13 || ![(__WiFiManagerClient *)v13 count])
  {
    v16 = WFLogForCategory(5uLL);
    os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16 || !os_log_type_enabled(v16, v17)) {
      goto LABEL_24;
    }
    *(_WORD *)v20 = 0;
    os_log_type_t v18 = "failed to get array of WiFiDeviceClients";
    goto LABEL_23;
  }
  uint64_t v14 = (__WiFiDeviceClient *)[(__WiFiManagerClient *)v11 objectAtIndex:0];
  v10->_device = v14;
  if (!v14)
  {
    v16 = WFLogForCategory(5uLL);
    os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16 || !os_log_type_enabled(v16, v17)) {
      goto LABEL_24;
    }
    *(_WORD *)v20 = 0;
    os_log_type_t v18 = "failed to get WiFiDeviceClient";
LABEL_23:
    _os_log_impl(&dword_226071000, v16, v17, v18, v20, 2u);
LABEL_24:

    goto LABEL_25;
  }
  CFRetain(v14);
LABEL_8:

  return v10;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)WFJoinOperation;
  [(WFOperation *)&v3 start];
  [(WFJoinOperation *)self _joinWithCoreWiFi];
}

- (void)_joinWithCoreWiFi
{
  objc_initWeak(&location, self);
  objc_super v3 = [(WFJoinOperation *)self interface];
  v4 = [(WFJoinOperation *)self associationParameters];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__WFJoinOperation__joinWithCoreWiFi__block_invoke;
  v5[3] = &unk_26478E410;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v3 associateWithParameters:v4 reply:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__WFJoinOperation__joinWithCoreWiFi__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [WeakRetained associationParameters];
  id v6 = [v5 scanResult];
  id v7 = [v6 networkName];

  id v8 = WFLogForCategory(5uLL);
  os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v3)
  {
    if (v11 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      __int16 v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_226071000, v8, v9, "{ASSOC*} association failed to %@, error: %@", buf, 0x16u);
    }

    v12 = [*(id *)(a1 + 32) associationParameters];
    v13 = [v12 scanResult];
    uint64_t v14 = [v13 RSSI];

    v15 = [*(id *)(a1 + 32) associationParameters];
    v16 = [v15 scanResult];
    id v8 = [v16 scanRecord];

    os_log_type_t v17 = (const void *)WiFiNetworkCreate();
    int v18 = WiFiNetworkRequiresPassword();
    if (v17) {
      CFRelease(v17);
    }
    os_log_type_t v19 = WFLogForCategory(5uLL);
    os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      objc_super v21 = "is not";
      *(_DWORD *)buf = 136315650;
      if (v18) {
        objc_super v21 = "is";
      }
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v7;
      __int16 v32 = 2048;
      uint64_t v33 = v14;
      _os_log_impl(&dword_226071000, v19, v20, "password %s required for %@, rssi at join: %ld", buf, 0x20u);
    }

    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = [v3 code];
    uint64_t v26 = *MEMORY[0x263F08608];
    v27 = v3;
    v24 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v25 = [v22 associationErrorWithCode:v23 requiresPassword:v18 != 0 signalStrength:v14 userInfo:v24];
    [WeakRetained setError:v25];
  }
  else if (v11 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    _os_log_impl(&dword_226071000, v8, v9, "{ASSOC*} association successful to %@", buf, 0xCu);
  }

  [WeakRetained finish];
}

- (void)joinNetworkRef:(__WiFiNetwork *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = WFLogForCategory(5uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5 && os_log_type_enabled(v5, v6))
  {
    device = self->_device;
    int v9 = 136315650;
    BOOL v10 = "-[WFJoinOperation joinNetworkRef:]";
    __int16 v11 = 2112;
    v12 = a3;
    __int16 v13 = 2112;
    uint64_t v14 = device;
    _os_log_impl(&dword_226071000, v5, v6, "%s: networkRef: %@ device %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v8 = WiFiDeviceClientAssociateAsync();
  if (v8) {
    [(WFJoinOperation *)self _joinComplete:v8 userInfo:0 network:0];
  }
  if (a3) {
    CFRelease(a3);
  }
}

- (void)_joinComplete:(int)a3 userInfo:(__CFDictionary *)a4 network:(__WiFiNetwork *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v59 = *MEMORY[0x263EF8340];
  int v9 = WFLogForCategory(5uLL);
  os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315650;
    v52 = "-[WFJoinOperation _joinComplete:userInfo:network:]";
    __int16 v53 = 1024;
    BOOL v54 = v7;
    __int16 v55 = 2112;
    *(void *)v56 = a4;
    _os_log_impl(&dword_226071000, v9, v10, "%s: error code %d (userInfo %@)", buf, 0x1Cu);
  }

  if (v7 || !a5)
  {
    if (!a5)
    {
      uint64_t v39 = 0;
      uint64_t RSSI = 0;
      uint64_t v13 = 0;
LABEL_45:
      v46 = objc_msgSend(MEMORY[0x263F087E8], "associationErrorWithCode:requiresPassword:signalStrength:isPrivateMACFailureThresholdMet:", v7, v13, RSSI, v39, v47);
      [(WFOperation *)self setError:v46];

      goto LABEL_46;
    }
    uint64_t RSSI = (int)WiFiNetworkGetRSSI();
    int v12 = WiFiNetworkRequiresPassword();
    uint64_t v13 = v12 != 0;
    v49 = (void *)WiFiNetworkCopyRecord();
    uint64_t v14 = [v49 objectForKey:*MEMORY[0x263F55F08]];
    unsigned int v50 = [v14 BOOLValue];

    uint64_t v15 = WFLogForCategory(5uLL);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15)
    {
      os_log_type_t v17 = v15;
      if (os_log_type_enabled(v17, v16))
      {
        int v18 = [(WFJoinOperation *)self profile];
        int v19 = [v18 userProvidedPassword];
        *(_DWORD *)buf = 136316162;
        v52 = "-[WFJoinOperation _joinComplete:userInfo:network:]";
        __int16 v53 = 1024;
        BOOL v54 = v12 != 0;
        uint64_t v13 = v12 != 0;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v19;
        *(_WORD *)&v56[4] = 2048;
        *(void *)&v56[6] = RSSI;
        __int16 v57 = 1024;
        unsigned int v58 = v50;
        _os_log_impl(&dword_226071000, v17, v16, "%s: requiresPassword: %d userProvidedPassword: %d joinRssi: %ld, isPrivateMacFailureThresholdMet: %d", buf, 0x28u);
      }
    }

    if (v12)
    {
      os_log_type_t v20 = [(WFJoinOperation *)self profile];
      int v21 = [v20 userProvidedPassword];

      if (v21)
      {
        uint64_t v22 = WFLogForCategory(5uLL);
        os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v22)
        {
          v24 = v22;
          if (os_log_type_enabled(v24, v23))
          {
            v25 = [(WFJoinOperation *)self profile];
            int v26 = [v25 userProvidedPassword];
            *(_DWORD *)buf = 136315650;
            v52 = "-[WFJoinOperation _joinComplete:userInfo:network:]";
            __int16 v53 = 1024;
            BOOL v54 = 1;
            __int16 v55 = 1024;
            *(_DWORD *)v56 = v26;
            _os_log_impl(&dword_226071000, v24, v23, "%s: requiresPassword %d userProvidedPassword %d", buf, 0x18u);
          }
        }
        unsigned int v48 = v13;
        uint64_t v47 = RSSI;

        v27 = [(WFJoinOperation *)self profile];
        uint64_t v28 = [v27 previousPassword];
        if (v28)
        {
          v29 = (void *)v28;
          __int16 v30 = [(WFJoinOperation *)self profile];
          v31 = [v30 password];
          __int16 v32 = [(WFJoinOperation *)self profile];
          uint64_t v33 = [v32 previousPassword];
          char v34 = [v31 isEqualToString:v33];

          if ((v34 & 1) == 0)
          {
            v35 = WFLogForCategory(5uLL);
            os_log_type_t v36 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v35 && os_log_type_enabled(v35, v36))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v35, v36, "Resave previous password to the keychain", buf, 2u);
            }

            v37 = [(WFJoinOperation *)self profile];
            v38 = [v37 previousPassword];
            WiFiNetworkSetPassword();

            uint64_t RSSI = v47;
            uint64_t v13 = v48;
            goto LABEL_44;
          }
        }
        else
        {
        }
        v40 = [(WFJoinOperation *)self profile];
        v41 = [v40 previousPassword];

        v42 = WFLogForCategory(5uLL);
        os_log_type_t v43 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel()) {
          BOOL v44 = v42 == 0;
        }
        else {
          BOOL v44 = 1;
        }
        int v45 = !v44;
        if (v41)
        {
          uint64_t RSSI = v47;
          uint64_t v13 = v48;
          if (v45 && os_log_type_enabled(v42, v43))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226071000, v42, v43, "Same password in the keychain", buf, 2u);
          }
        }
        else
        {
          uint64_t RSSI = v47;
          uint64_t v13 = v48;
          if (v45 && os_log_type_enabled(v42, v43))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226071000, v42, v43, "Remove added password from keychain", buf, 2u);
          }

          WiFiNetworkRemovePassword();
        }
      }
    }
LABEL_44:

    uint64_t v39 = v50;
    goto LABEL_45;
  }
LABEL_46:
  [(WFOperation *)self finish];
}

- (void)dealloc
{
  device = self->_device;
  if (device)
  {
    CFRelease(device);
    self->_device = 0;
  }
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WFJoinOperation;
  [(WFJoinOperation *)&v5 dealloc];
}

- (id)name
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setName:(id)a3
{
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (__WiFiManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManagerClient *)a3
{
  self->_manager = a3;
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  self->_device = a3;
}

- (CWFAssocParameters)associationParameters
{
  return self->_associationParameters;
}

- (void)setAssociationParameters:(id)a3
{
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_associationParameters, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end