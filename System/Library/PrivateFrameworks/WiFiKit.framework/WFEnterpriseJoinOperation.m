@interface WFEnterpriseJoinOperation
- (CWFAssocParameters)associationParameters;
- (CWFInterface)interface;
- (WFEnterpriseJoinOperation)initWithAssocParameters:(id)a3 interface:(id)a4;
- (WFEnterpriseJoinOperation)initWithNetwork:(id)a3 profile:(id)a4;
- (WFNetworkProfile)profile;
- (WFNetworkScanRecord)network;
- (__WiFiDeviceClient)device;
- (__WiFiManagerClient)manager;
- (id)name;
- (void)_handleEnterpriseJoinResult:(int64_t)a3 userInfo:(id)a4 network:(__WiFiNetwork *)a5;
- (void)_joinComplete:(int)a3 userInfo:(__CFDictionary *)a4 network:(__WiFiNetwork *)a5;
- (void)_joinWithCoreWiFi;
- (void)_joinWithMobileWiFi;
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

@implementation WFEnterpriseJoinOperation

- (WFEnterpriseJoinOperation)initWithAssocParameters:(id)a3 interface:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFEnterpriseJoinOperation;
  v9 = [(WFEnterpriseJoinOperation *)&v19 init];
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_associationParameters, a3);
      objc_storeStrong((id *)&v10->_interface, a4);
      v11 = NSString;
      v12 = [v7 scanResult];
      v13 = [(WFEnterpriseJoinOperation *)v12 networkName];
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
        v21 = "-[WFEnterpriseJoinOperation initWithAssocParameters:interface:]";
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

- (WFEnterpriseJoinOperation)initWithNetwork:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFEnterpriseJoinOperation;
  v9 = [(WFEnterpriseJoinOperation *)&v21 init];
  v10 = v9;
  v11 = 0;
  if (!v7 || !v9) {
    goto LABEL_26;
  }
  objc_storeStrong((id *)&v9->_network, a3);
  if (!v8)
  {
    v11 = 0;
LABEL_26:

    v10 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v10->_profile, a4);
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
    goto LABEL_25;
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
      goto LABEL_25;
    }
    *(_WORD *)v20 = 0;
    os_log_type_t v18 = "failed to get array of WiFiDeviceClients";
    goto LABEL_24;
  }
  uint64_t v14 = (__WiFiDeviceClient *)[(__WiFiManagerClient *)v11 objectAtIndex:0];
  v10->_device = v14;
  if (!v14)
  {
    v16 = WFLogForCategory(5uLL);
    os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16 || !os_log_type_enabled(v16, v17)) {
      goto LABEL_25;
    }
    *(_WORD *)v20 = 0;
    os_log_type_t v18 = "failed to get WiFiDeviceClient";
LABEL_24:
    _os_log_impl(&dword_226071000, v16, v17, v18, v20, 2u);
LABEL_25:

    goto LABEL_26;
  }
  CFRetain(v14);
LABEL_9:

  return v10;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)WFEnterpriseJoinOperation;
  [(WFOperation *)&v3 start];
  [(WFEnterpriseJoinOperation *)self _joinWithCoreWiFi];
}

- (void)_joinWithCoreWiFi
{
  objc_initWeak(&location, self);
  objc_super v3 = [(WFEnterpriseJoinOperation *)self interface];
  v4 = [(WFEnterpriseJoinOperation *)self associationParameters];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__WFEnterpriseJoinOperation__joinWithCoreWiFi__block_invoke;
  v5[3] = &unk_26478E410;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v3 associateWithParameters:v4 reply:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__WFEnterpriseJoinOperation__joinWithCoreWiFi__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
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
      v33 = v7;
      __int16 v34 = 2112;
      v35 = v3;
      _os_log_impl(&dword_226071000, v8, v9, "{ASSOC*} association failed to %@, error: %@", buf, 0x16u);
    }

    int v12 = [v3 code];
    if ((v12 & 0xFFFF0000) == 0xEA010000)
    {
      v13 = (const char *)(v12 & 0x15FEFFFF);
      uint64_t v14 = WFLogForCategory(5uLL);
      os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v13;
        _os_log_impl(&dword_226071000, v14, v15, "association failed with EAP specific error: %ld", buf, 0xCu);
      }

      id v8 = [v3 userInfo];
      [WeakRetained _handleEnterpriseJoinResult:v13 userInfo:v8 network:0];
    }
    else
    {
      v16 = [*(id *)(a1 + 32) associationParameters];
      os_log_type_t v17 = [v16 scanResult];
      uint64_t v18 = [v17 RSSI];

      os_log_type_t v19 = [*(id *)(a1 + 32) associationParameters];
      v20 = [v19 scanResult];
      id v8 = [v20 scanRecord];

      objc_super v21 = (const void *)WiFiNetworkCreate();
      int v22 = WiFiNetworkRequiresPassword();
      if (v21) {
        CFRelease(v21);
      }
      v23 = WFLogForCategory(5uLL);
      os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
      {
        v25 = "is not";
        *(_DWORD *)buf = 136315650;
        if (v22) {
          v25 = "is";
        }
        v33 = v25;
        __int16 v34 = 2112;
        v35 = v7;
        __int16 v36 = 2048;
        uint64_t v37 = v18;
        _os_log_impl(&dword_226071000, v23, v24, "password %s required for %@, rssi at join: %ld", buf, 0x20u);
      }

      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = [v3 code];
      uint64_t v30 = *MEMORY[0x263F08608];
      v31 = v3;
      v28 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v29 = [v26 associationErrorWithCode:v27 requiresPassword:v22 != 0 signalStrength:v18 userInfo:v28];
      [WeakRetained setError:v29];
    }
  }
  else if (v11 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v7;
    _os_log_impl(&dword_226071000, v8, v9, "{ASSOC*} association successful to %@", buf, 0xCu);
  }

  [WeakRetained finish];
}

- (void)_joinWithMobileWiFi
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  objc_super v3 = [(WFEnterpriseJoinOperation *)self network];
  v4 = [v3 attributes];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = WiFiNetworkCreate();
  if (!v6)
  {
    v49 = WFLogForCategory(5uLL);
    LOBYTE(v50) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, (os_log_type_t)v50)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v51 = "Unable to create WiFiNetworkRef";
    goto LABEL_50;
  }
  uint64_t v7 = v6;
  id v8 = [(WFEnterpriseJoinOperation *)self profile];
  os_log_type_t v9 = [v8 enterpriseProfile];

  if (!v9)
  {
    v49 = WFLogForCategory(5uLL);
    uint64_t v50 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, (os_log_type_t)v50)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v51 = "Nil enterpriseProfile on WFNetworkProfile";
LABEL_50:
    _os_log_impl(&dword_226071000, v49, (os_log_type_t)v50, v51, buf, 2u);
LABEL_51:

    v52 = [MEMORY[0x263F087E8] associationErrorWithReason:12];
    [(WFOperation *)self setError:v52];

    [(WFOperation *)self finish];
    goto LABEL_41;
  }
  BOOL v10 = [(WFEnterpriseJoinOperation *)self profile];
  int v11 = [v10 scanAttributes];
  int v12 = (const void *)WiFiNetworkCreate();

  if (v12)
  {
    WiFiNetworkMergeForAssociation();
    CFRelease(v12);
  }
  else
  {
    v13 = WFLogForCategory(5uLL);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13)
    {
      os_log_type_t v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        v16 = [(WFEnterpriseJoinOperation *)self profile];
        *(_DWORD *)buf = 136315394;
        v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
        __int16 v57 = 2112;
        v58 = v16;
        _os_log_impl(&dword_226071000, v15, v14, "%s: failed to create profile based networkRef (profile %@)", buf, 0x16u);
      }
    }
  }
  WiFiNetworkSetProperty();
  os_log_type_t v17 = WFLogForCategory(5uLL);
  os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v17)
  {
    os_log_type_t v19 = v17;
    if (os_log_type_enabled(v19, v18))
    {
      v20 = [(WFEnterpriseJoinOperation *)self network];
      [v20 ssid];
      v53 = v9;
      objc_super v21 = v5;
      int v22 = (char *)objc_claimAutoreleasedReturnValue();
      v23 = [(WFEnterpriseJoinOperation *)self profile];
      os_log_type_t v24 = [v23 enterpriseProfile];
      *(_DWORD *)buf = 138412546;
      v56 = v22;
      __int16 v57 = 2112;
      v58 = v24;
      _os_log_impl(&dword_226071000, v19, v18, "Attempting association to %@ | enterprise profile %@", buf, 0x16u);

      v5 = v21;
      os_log_type_t v9 = v53;
    }
  }

  v25 = [(WFEnterpriseJoinOperation *)self profile];
  uint64_t v26 = [v25 policyUUID];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    uint64_t Property = WiFiNetworkGetProperty();

    if (Property) {
      goto LABEL_25;
    }
    v29 = WFLogForCategory(5uLL);
    os_log_type_t v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29)
    {
      v31 = v29;
      if (os_log_type_enabled(v31, v30))
      {
        v32 = [(WFEnterpriseJoinOperation *)self profile];
        v33 = [v32 policyUUID];
        [(WFEnterpriseJoinOperation *)self network];
        v54 = v9;
        v35 = __int16 v34 = v5;
        __int16 v36 = [v35 ssid];
        *(_DWORD *)buf = 136315650;
        v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
        __int16 v57 = 2112;
        v58 = v33;
        __int16 v59 = 2112;
        v60 = v36;
        _os_log_impl(&dword_226071000, v31, v30, "%s: setting policyUUID %@ for %@", buf, 0x20u);

        v5 = v34;
        os_log_type_t v9 = v54;
      }
    }

    v25 = [(WFEnterpriseJoinOperation *)self profile];
    uint64_t v37 = [v25 policyUUID];
    WiFiNetworkSetProperty();
  }
LABEL_25:
  uint64_t v38 = [(WFEnterpriseJoinOperation *)self profile];
  v39 = [v38 password];

  if (v39)
  {
    v40 = (void *)WiFiNetworkCopyPassword();
    if (v40)
    {
      v41 = [(WFEnterpriseJoinOperation *)self profile];
      v42 = [v41 password];
      char v43 = [v40 isEqualToString:v42];

      if ((v43 & 1) == 0)
      {
        v44 = WFLogForCategory(5uLL);
        os_log_type_t v45 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v44 || !os_log_type_enabled(v44, v45)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136315138;
        v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
        v46 = "%s: keychain password differs from association attempt password updating";
LABEL_37:
        _os_log_impl(&dword_226071000, v44, v45, v46, buf, 0xCu);
LABEL_38:

        v47 = [(WFEnterpriseJoinOperation *)self profile];
        v48 = [v47 password];
        WiFiNetworkSetPassword();
      }
    }
    else if (WiFiNetworkRequiresOneTimePassword())
    {
      v44 = WFLogForCategory(5uLL);
      os_log_type_t v45 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v44 || !os_log_type_enabled(v44, v45)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136315138;
      v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
      v46 = "%s: keychain password doesn't exist and network requires OTP";
      goto LABEL_37;
    }
  }
  [(WFEnterpriseJoinOperation *)self joinNetworkRef:v7];

LABEL_41:
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
    BOOL v10 = "-[WFEnterpriseJoinOperation joinNetworkRef:]";
    __int16 v11 = 2112;
    int v12 = a3;
    __int16 v13 = 2112;
    os_log_type_t v14 = device;
    _os_log_impl(&dword_226071000, v5, v6, "%s: networkRef: %@ device %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v8 = WiFiDeviceClientAssociateAsync();
  if (v8) {
    [(WFEnterpriseJoinOperation *)self _joinComplete:v8 userInfo:0 network:0];
  }
  if (a3) {
    CFRelease(a3);
  }
}

- (void)_joinComplete:(int)a3 userInfo:(__CFDictionary *)a4 network:(__WiFiNetwork *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (HIWORD(a3) == 59905)
  {
    uint64_t v9 = a3 & 0x15FEFFFF;
    -[WFEnterpriseJoinOperation _handleEnterpriseJoinResult:userInfo:network:](self, "_handleEnterpriseJoinResult:userInfo:network:", v9);
  }
  else
  {
    BOOL v10 = WFLogForCategory(5uLL);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      int v17 = 136315650;
      os_log_type_t v18 = "-[WFEnterpriseJoinOperation _joinComplete:userInfo:network:]";
      __int16 v19 = 1024;
      *(_DWORD *)v20 = v7;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = a4;
      _os_log_impl(&dword_226071000, v10, v11, "%s: error code %d (userInfo %@)", (uint8_t *)&v17, 0x1Cu);
    }

    if (v7 || !a5)
    {
      if (a5)
      {
        uint64_t RSSI = (int)WiFiNetworkGetRSSI();
        int v13 = WiFiNetworkRequiresPassword();
        a5 = (__WiFiNetwork *)(v13 != 0);
        os_log_type_t v14 = WFLogForCategory(5uLL);
        os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
        {
          int v17 = 136315650;
          os_log_type_t v18 = "-[WFEnterpriseJoinOperation _joinComplete:userInfo:network:]";
          __int16 v19 = 2048;
          *(void *)v20 = RSSI;
          *(_WORD *)&v20[8] = 1024;
          *(_DWORD *)&v20[10] = v13 != 0;
          _os_log_impl(&dword_226071000, v14, v15, "%s: joinRssi: %ld requiresPassword: %d", (uint8_t *)&v17, 0x1Cu);
        }
      }
      else
      {
        uint64_t RSSI = 0;
      }
      v16 = [MEMORY[0x263F087E8] associationErrorWithCode:v7 requiresPassword:a5 signalStrength:RSSI];
      [(WFOperation *)self setError:v16];
    }
    [(WFOperation *)self finish];
  }
}

- (void)_handleEnterpriseJoinResult:(int64_t)a3 userInfo:(id)a4 network:(__WiFiNetwork *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a5)
  {
    uint64_t v9 = (void *)WiFiNetworkCopyRecord();
    BOOL v10 = [v9 objectForKey:*MEMORY[0x263F55F08]];
    a5 = (__WiFiNetwork *)[v10 BOOLValue];
  }
  os_log_type_t v11 = WFLogForCategory(5uLL);
  os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v37 = a3;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 1024;
    int v41 = (int)a5;
    _os_log_impl(&dword_226071000, v11, v12, "handling enterprise join result: %ld userInfo: %@ isPrivateMACFailureThresholdMet: %d", buf, 0x1Cu);
  }

  switch(a3)
  {
    case 3:
      os_log_type_t v15 = [v8 objectForKey:@"RequiredProperties"];
      v16 = WFLogForCategory(5uLL);
      os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v37 = (int64_t)v15;
        _os_log_impl(&dword_226071000, v16, v17, "user input required, requested info %@", buf, 0xCu);
      }

      uint64_t v18 = [v8 objectForKey:@"TLSServerCertificateChain"];
      __int16 v19 = (void *)v18;
      if (v18)
      {
        __int16 v34 = @"kWFAssociationCertificateChainKey";
        uint64_t v35 = v18;
        v20 = NSDictionary;
        uint64_t v21 = &v35;
        int v22 = &v34;
      }
      else if ([v15 containsObject:@"UserName"])
      {
        v32 = @"kWFAssociationUsernameRequiredKey";
        uint64_t v33 = MEMORY[0x263EFFA88];
        v20 = NSDictionary;
        uint64_t v21 = &v33;
        int v22 = &v32;
      }
      else
      {
        if (![v15 containsObject:@"UserPassword"])
        {
          v28 = 0;
          goto LABEL_37;
        }
        os_log_type_t v30 = @"kWFAssociationPasswordRequiredKey";
        uint64_t v31 = MEMORY[0x263EFFA88];
        v20 = NSDictionary;
        uint64_t v21 = &v31;
        int v22 = &v30;
      }
      v28 = objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1, v30, v31, v32, v33, v34, v35);
LABEL_37:
      v29 = [MEMORY[0x263F087E8] associationErrorWithReason:7 userInfo:v28];
      [(WFOperation *)self setError:v29];

      [(WFOperation *)self finish];
      goto LABEL_38;
    case 1:
      v23 = WFLogForCategory(5uLL);
      os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v23, v24, "EAP status = failed", buf, 2u);
      }

      uint64_t v25 = [MEMORY[0x263F087E8] associationErrorWithReason:12];
      break;
    case 0:
      int v13 = WFLogForCategory(5uLL);
      os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v13, v14, "EAP status = ok", buf, 2u);
      }
      goto LABEL_31;
    default:
      uint64_t v26 = WFLogForCategory(5uLL);
      os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 134349056;
        int64_t v37 = a3;
        _os_log_impl(&dword_226071000, v26, v27, "EAP status = unhandled error code %{public}ld", buf, 0xCu);
      }

      uint64_t v25 = [MEMORY[0x263F087E8] associationErrorWithCode:a3 isPrivateMACFailureThresholdMet:a5];
      break;
  }
  int v13 = v25;
  [(WFOperation *)self setError:v25];
LABEL_31:

  [(WFOperation *)self finish];
LABEL_38:
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
  v5.super_class = (Class)WFEnterpriseJoinOperation;
  [(WFEnterpriseJoinOperation *)&v5 dealloc];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_associationParameters, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end