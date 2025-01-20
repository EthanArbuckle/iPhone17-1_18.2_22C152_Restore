@interface WFOtherNetworkContext
- (BOOL)isEnterprise;
- (BOOL)isPasswordSharingSupported;
- (BOOL)isUsingRandomMACAddress;
- (BOOL)otherNetworkViewController:(id)a3 isValidPassword:(id)a4;
- (BOOL)supportsRandomMACAddress;
- (BOOL)validateCredentials;
- (BOOL)validatePassword;
- (NSArray)WAPIIdentities;
- (NSArray)WAPIRootCertificates;
- (NSArray)availableTLSIdentities;
- (NSString)hardwareMACAddress;
- (NSString)randomMACAddress;
- (NSString)username;
- (WFNetworkProfile)profile;
- (WFNetworkScanRecord)network;
- (WFOtherNetworkContext)initWithType:(unint64_t)a3;
- (WFOtherNetworkContext)initWithType:(unint64_t)a3 authTraits:(int64_t)a4 supportRandomAddress:(BOOL)a5 useRandomAddress:(BOOL)a6 randomMACAddress:(id)a7 hardwareMACAddress:(id)a8;
- (WFUserSuppliedNetwork)userSuppliedNetwork;
- (id)privateAddressModeChangeHandler;
- (int64_t)availableAuthTraits;
- (int64_t)requestedFields;
- (int64_t)securityMode;
- (unint64_t)type;
- (void)_updateActivityStringForError:(id)a3 networkName:(id)a4;
- (void)finishWithError:(id)a3 forNetwork:(id)a4 profile:(id)a5;
- (void)gatherCredentials:(id)a3;
- (void)otherNetworkViewControllerUserDidTapJoin:(id)a3;
- (void)savePrivateAddressMode:(unint64_t)a3;
- (void)setAvailableAuthTraits:(int64_t)a3;
- (void)setAvailableTLSIdentities:(id)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setIsUsingRandomMACAddress:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setPrivateAddressModeChangeHandler:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRandomMACAddress:(id)a3;
- (void)setRequestedFields:(int64_t)a3;
- (void)setSupportsRandomMACAddress:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserSuppliedNetwork:(id)a3;
- (void)setWAPIIdentities:(id)a3;
- (void)setWAPIRootCertificates:(id)a3;
@end

@implementation WFOtherNetworkContext

- (WFOtherNetworkContext)initWithType:(unint64_t)a3
{
  return [(WFOtherNetworkContext *)self initWithType:a3 authTraits:0 supportRandomAddress:0 useRandomAddress:0 randomMACAddress:0 hardwareMACAddress:0];
}

- (WFOtherNetworkContext)initWithType:(unint64_t)a3 authTraits:(int64_t)a4 supportRandomAddress:(BOOL)a5 useRandomAddress:(BOOL)a6 randomMACAddress:(id)a7 hardwareMACAddress:(id)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v15 = a8;
  CFArrayRef v34 = 0;
  CFArrayRef theArray = 0;
  v33.receiver = self;
  v33.super_class = (Class)WFOtherNetworkContext;
  v16 = [(WFOtherNetworkContext *)&v33 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_25;
  }
  v16->_unint64_t type = a3;
  v16->_availableAuthTraits = a4;
  if (a4)
  {
    if (!WFWAPIRootCertificateListCreate((CFTypeRef *)&theArray) && CFArrayGetCount(theArray)) {
      objc_storeStrong((id *)&v17->_WAPIRootCertificates, theArray);
    }
    if (!WFWAPIIdentityListCreate(&v34, 0) && CFArrayGetCount(v34)) {
      objc_storeStrong((id *)&v17->_WAPIIdentities, v34);
    }
  }
  OSStatus v32 = 0;
  v18 = WFAllIdentities(&v32);
  v19 = v18;
  if (!v32 && [v18 count]) {
    objc_storeStrong((id *)&v17->_availableTLSIdentities, v19);
  }
  unint64_t type = v17->_type;
  if (type)
  {
    if (type != 1) {
      goto LABEL_17;
    }
    uint64_t v21 = 128;
  }
  else
  {
    uint64_t v21 = 384;
  }
  v17->_requestedFields = v21;
LABEL_17:
  v17->_supportsRandomMACAddress = a5;
  v17->_isUsingRandomMACAddress = a6;
  uint64_t v22 = [v15 formattedWiFiAddress];
  hardwareMACAddress = v17->_hardwareMACAddress;
  v17->_hardwareMACAddress = (NSString *)v22;

  uint64_t v24 = [v14 formattedWiFiAddress];
  randomMACAddress = v17->_randomMACAddress;
  v17->_randomMACAddress = (NSString *)v24;

  v26 = WFLogForCategory(0);
  os_log_type_t v27 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v26)
  {
    v28 = v26;
    if (os_log_type_enabled(v28, v27))
    {
      int v29 = a4 & 1;
      availableTLSIdentities = v17->_availableTLSIdentities;
      if (availableTLSIdentities) {
        LODWORD(availableTLSIdentities) = [(NSArray *)availableTLSIdentities count];
      }
      *(_DWORD *)buf = 136315650;
      v37 = "-[WFOtherNetworkContext initWithType:authTraits:supportRandomAddress:useRandomAddress:randomMACAddress:hardwareMACAddress:]";
      __int16 v38 = 1024;
      int v39 = v29;
      __int16 v40 = 1024;
      int v41 = (int)availableTLSIdentities;
      _os_log_impl(&dword_226071000, v28, v27, "%s: WAPIEnabled: %d tlsIdentities %d", buf, 0x18u);
    }
  }
LABEL_25:

  return v17;
}

- (void)finishWithError:(id)a3 forNetwork:(id)a4 profile:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WFOtherNetworkContext *)self setNetwork:v9];
  [(WFOtherNetworkContext *)self setProfile:v10];
  v11 = WFLogForCategory(0);
  os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
  {
    network = self->_network;
    *(_DWORD *)buf = 136315650;
    __int16 v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
    __int16 v39 = 2112;
    NSUInteger v40 = (NSUInteger)network;
    __int16 v41 = 2112;
    int64_t v42 = (int64_t)v10;
    _os_log_impl(&dword_226071000, v11, v12, "%s: network %@ profile %@", buf, 0x20u);
  }

  if (v8)
  {
    unint64_t v14 = [v8 code];
    if (v14 <= 0x11)
    {
      if (((1 << v14) & 0x8B) != 0)
      {
        if (self->_type != 1)
        {
          int64_t requestedFields = 385;
          goto LABEL_44;
        }
        id v15 = [(WFOtherNetworkContext *)self network];
        int v16 = [v15 isEnterprise];

        if (v16)
        {
          v17 = WFLogForCategory(0);
          os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v17)
          {
            v19 = v17;
            if (os_log_type_enabled(v19, v18))
            {
              v20 = [(WFOtherNetworkContext *)self network];
              *(_DWORD *)buf = 136315394;
              __int16 v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
              __int16 v39 = 2112;
              NSUInteger v40 = (NSUInteger)v20;
              _os_log_impl(&dword_226071000, v19, v18, "%s: network %@ is enterprise", buf, 0x16u);
            }
          }

          if (self->_availableTLSIdentities)
          {
            uint64_t v21 = WFLogForCategory(0);
            os_log_type_t v22 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() < 4 || !v21) {
              goto LABEL_35;
            }
            v23 = v21;
            if (!os_log_type_enabled(v23, v22))
            {
LABEL_34:

LABEL_35:
              int64_t requestedFields = 15;
              goto LABEL_44;
            }
LABEL_33:
            NSUInteger v31 = [(NSArray *)self->_availableTLSIdentities count];
            *(_DWORD *)buf = 136315394;
            __int16 v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
            __int16 v39 = 2048;
            NSUInteger v40 = v31;
            _os_log_impl(&dword_226071000, v23, v22, "%s: available TLS identities %lu", buf, 0x16u);
            goto LABEL_34;
          }
LABEL_43:
          int64_t requestedFields = 3;
LABEL_44:
          CFArrayRef v34 = WFLogForCategory(0);
          os_log_type_t v35 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v34 && os_log_type_enabled(v34, v35))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
            __int16 v39 = 2112;
            NSUInteger v40 = (NSUInteger)v8;
            __int16 v41 = 2048;
            int64_t v42 = requestedFields;
            _os_log_impl(&dword_226071000, v34, v35, "%s: error %@ newRequested fields %ld", buf, 0x20u);
          }

          self->_int64_t requestedFields = requestedFields;
          goto LABEL_49;
        }
        goto LABEL_36;
      }
      if (v14 == 17)
      {
        if (self->_type != 1)
        {
          int64_t requestedFields = 0;
          goto LABEL_44;
        }
        v25 = [(WFOtherNetworkContext *)self network];
        int v26 = [v25 isEnterprise];

        if (v26)
        {
          os_log_type_t v27 = WFLogForCategory(0);
          os_log_type_t v28 = OSLogForWFLogLevel(3uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 3 && v27)
          {
            int v29 = v27;
            if (os_log_type_enabled(v29, v28))
            {
              v30 = [(WFOtherNetworkContext *)self network];
              *(_DWORD *)buf = 136315394;
              __int16 v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
              __int16 v39 = 2112;
              NSUInteger v40 = (NSUInteger)v30;
              _os_log_impl(&dword_226071000, v29, v28, "%s: network %@ is enterprise", buf, 0x16u);
            }
          }

          if (self->_availableTLSIdentities)
          {
            uint64_t v21 = WFLogForCategory(0);
            os_log_type_t v22 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() < 4 || !v21) {
              goto LABEL_35;
            }
            v23 = v21;
            if (!os_log_type_enabled(v23, v22)) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
          goto LABEL_43;
        }
LABEL_36:
        int64_t requestedFields = 1;
        goto LABEL_44;
      }
    }
    OSStatus v32 = WFLogForCategory(0);
    os_log_type_t v33 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v32 && os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v38 = "-[WFOtherNetworkContext finishWithError:forNetwork:profile:]";
      __int16 v39 = 2112;
      NSUInteger v40 = (NSUInteger)v8;
      _os_log_impl(&dword_226071000, v32, v33, "%s: unhandled error %@", buf, 0x16u);
    }

    int64_t requestedFields = self->_requestedFields;
    goto LABEL_44;
  }
LABEL_49:
  v36.receiver = self;
  v36.super_class = (Class)WFOtherNetworkContext;
  [(WFCredentialsContext *)&v36 finishWithError:v8 forNetwork:v9 profile:v10];
}

- (BOOL)validateCredentials
{
  v3 = [(WFCredentialsContext *)self provider];
  v4 = v3;
  if (self->_type != 1)
  {
    if ([(WFOtherNetworkContext *)self securityMode]) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  int64_t requestedFields = self->_requestedFields;
  if ((requestedFields & 0x80) == 0)
  {
LABEL_9:
    if (requestedFields != 128) {
      goto LABEL_15;
    }
LABEL_10:
    id v8 = [v4 SSID];
    if ([v8 isEmpty])
    {
    }
    else
    {
      id v10 = [v4 SSID];

      if (v10)
      {
        BOOL v9 = 1;
        goto LABEL_16;
      }
    }
LABEL_15:
    v12.receiver = self;
    v12.super_class = (Class)WFOtherNetworkContext;
    BOOL v9 = [(WFCredentialsContext *)&v12 validateCredentials];
    goto LABEL_16;
  }
  v6 = [v3 SSID];
  if (![v6 isEmpty])
  {
    v7 = [v4 SSID];

    if (!v7) {
      goto LABEL_12;
    }
    int64_t requestedFields = self->_requestedFields;
    goto LABEL_9;
  }

LABEL_12:
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

- (BOOL)validatePassword
{
  v3 = [(WFCredentialsContext *)self provider];
  v4 = v3;
  if (self->_type != 1)
  {
    if ([(WFOtherNetworkContext *)self securityMode]) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  int64_t requestedFields = self->_requestedFields;
  if ((requestedFields & 0x80) == 0)
  {
LABEL_9:
    if (requestedFields != 128) {
      goto LABEL_15;
    }
LABEL_10:
    id v8 = [v4 SSID];
    if ([v8 isEmpty])
    {
    }
    else
    {
      id v10 = [v4 SSID];

      if (v10)
      {
        BOOL v9 = 1;
        goto LABEL_16;
      }
    }
LABEL_15:
    v12.receiver = self;
    v12.super_class = (Class)WFOtherNetworkContext;
    BOOL v9 = [(WFCredentialsContext *)&v12 validatePassword];
    goto LABEL_16;
  }
  v6 = [v3 SSID];
  if (![v6 isEmpty])
  {
    v7 = [v4 SSID];

    if (!v7) {
      goto LABEL_12;
    }
    int64_t requestedFields = self->_requestedFields;
    goto LABEL_9;
  }

LABEL_12:
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

- (void)_updateActivityStringForError:(id)a3 networkName:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFCredentialsContext *)self provider];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (v6)
    {
      id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"kWFLocOtherNetworkFailedPromptFormat" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];

      objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v7);
      v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "-[WFOtherNetworkContext _updateActivityStringForError:networkName:]";
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        _os_log_impl(&dword_226071000, v13, v14, "%s: error %@ activityString %@", buf, 0x20u);
      }
    }
    else
    {
      objc_super v12 = 0;
    }
    id v15 = [(WFCredentialsContext *)self provider];
    [v15 setActivityString:v12];
  }
}

- (void)gatherCredentials:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFCredentialsContext *)self provider];
  id v6 = [v5 SSID];

  id v7 = [(WFOtherNetworkContext *)self network];
  if (v7)
  {
    id v8 = [(WFOtherNetworkContext *)self network];
    id v9 = [v8 ssid];
  }
  else
  {
    id v9 = v6;
  }

  if (([v6 isEqualToString:v9] & 1) == 0)
  {
    id v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
      __int16 v86 = 2112;
      uint64_t v87 = (uint64_t)v9;
      __int16 v88 = 2112;
      v89 = v6;
      _os_log_impl(&dword_226071000, v10, v11, "%s: network name changed from %@ -> %@", buf, 0x20u);
    }

    id v12 = v6;
    id v9 = v12;
  }
  v13 = [(WFCredentialsContext *)self provider];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(WFCredentialsContext *)self provider];
    [v15 setJoining:1];
  }
  int v16 = [(WFCredentialsContext *)self provider];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    __int16 v18 = NSString;
    id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v20 = [v19 localizedStringForKey:@"kWFLocOtherNetworkJoiningPromptFormat" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
    uint64_t v21 = objc_msgSend(v18, "stringWithFormat:", v20, v9);
    uint64_t v22 = [(WFCredentialsContext *)self provider];
    [v22 setActivityString:v21];
  }
  v23 = objc_alloc_init(WFUserSuppliedNetwork);
  v76 = v9;
  [(WFUserSuppliedNetwork *)v23 setSsid:v9];
  uint64_t v24 = [(WFOtherNetworkContext *)self network];

  if (v24)
  {
    v25 = WFLogForCategory(0);
    os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v25)
    {
      os_log_type_t v27 = v25;
      if (os_log_type_enabled(v27, v26))
      {
        os_log_type_t v28 = [(WFOtherNetworkContext *)self network];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
        __int16 v86 = 2112;
        uint64_t v87 = (uint64_t)v28;
        _os_log_impl(&dword_226071000, v27, v26, "%s: using security mode from network: %@", buf, 0x16u);
      }
    }

    int v29 = [(WFOtherNetworkContext *)self network];
    -[WFUserSuppliedNetwork setSecurity:](v23, "setSecurity:", [v29 securityMode]);
  }
  v30 = [(WFCredentialsContext *)self provider];
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    OSStatus v32 = [(WFCredentialsContext *)self provider];
    uint64_t v33 = [v32 securityMode];

    CFArrayRef v34 = WFLogForCategory(0);
    os_log_type_t v35 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v34)
    {
      objc_super v36 = v23;
      v37 = self;
      __int16 v38 = v34;
      if (os_log_type_enabled(v38, v35))
      {
        __int16 v39 = [(WFCredentialsContext *)v37 provider];
        uint64_t v40 = WFWiFiSecurityModeFromOtherSecurityMode(v33);
        __int16 v41 = WFStringFromWFSecurityMode(v40);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
        __int16 v86 = 2112;
        uint64_t v87 = (uint64_t)v39;
        __int16 v88 = 2112;
        v89 = v41;
        __int16 v90 = 2048;
        uint64_t v91 = v33;
        _os_log_impl(&dword_226071000, v38, v35, "%s: using security mode from provider: %@ - %@ (%ld)", buf, 0x2Au);
      }
      self = v37;
      v23 = v36;
    }

    [(WFUserSuppliedNetwork *)v23 setSecurity:WFWiFiSecurityModeFromOtherSecurityMode(v33)];
  }
  int64_t v42 = [(WFCredentialsContext *)self provider];
  uint64_t v43 = [v42 username];
  [(WFUserSuppliedNetwork *)v23 setUsername:v43];

  v44 = [(WFCredentialsContext *)self provider];
  v45 = [v44 password];
  [(WFUserSuppliedNetwork *)v23 setPassword:v45];

  v46 = [(WFCredentialsContext *)self provider];
  -[WFUserSuppliedNetwork setTLSIdentity:](v23, "setTLSIdentity:", [v46 TLSIdentity]);

  v47 = WFLogForCategory(0);
  os_log_type_t v48 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v47)
  {
    v49 = v47;
    if (os_log_type_enabled(v49, v48))
    {
      uint64_t v50 = [(WFUserSuppliedNetwork *)v23 security];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
      __int16 v86 = 2048;
      uint64_t v87 = v50;
      _os_log_impl(&dword_226071000, v49, v48, "%s: otherNetworkRecord.security: %ld", buf, 0x16u);
    }
  }
  v75 = v23;
  if ([(WFUserSuppliedNetwork *)v23 security] == 128)
  {
    v51 = [(WFCredentialsContext *)self provider];
    if (objc_opt_respondsToSelector())
    {
      v52 = [(WFCredentialsContext *)self provider];
      char v53 = objc_opt_respondsToSelector();

      if (v53)
      {
        *(void *)buf = 0;
        v83 = 0;
        v54 = 0;
        if (!WFWAPIIdentityListCreate((__CFArray **)buf, &v83))
        {
          if (CFArrayGetCount(*(CFArrayRef *)buf))
          {
            v55 = self;
            v73 = v6;
            id v74 = v4;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            obj = v83;
            uint64_t v56 = [(__CFArray *)obj countByEnumeratingWithState:&v79 objects:v84 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              v54 = 0;
              uint64_t v58 = *(void *)v80;
              do
              {
                for (uint64_t i = 0; i != v57; ++i)
                {
                  if (*(void *)v80 != v58) {
                    objc_enumerationMutation(obj);
                  }
                  v60 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                  v61 = (const void *)[v60 valueForKey:@"certRef"];
                  v62 = [(WFCredentialsContext *)v55 provider];
                  v63 = [v62 WAPIIdentity];

                  if (v61) {
                    BOOL v64 = v63 == 0;
                  }
                  else {
                    BOOL v64 = 1;
                  }
                  if (!v64 && CFEqual(v61, v63))
                  {
                    uint64_t v65 = [v60 valueForKey:@"pemData"];

                    v54 = (void *)v65;
                  }
                }
                uint64_t v57 = [(__CFArray *)obj countByEnumeratingWithState:&v79 objects:v84 count:16];
              }
              while (v57);
            }
            else
            {
              v54 = 0;
            }

            id v6 = v73;
            id v4 = v74;
            self = v55;
          }
          else
          {
            v54 = 0;
          }
        }
        v66 = [(WFCredentialsContext *)self provider];
        v67 = [v66 WAPIRootCertificate];
        v68 = WFWAPICertificateBlobString(v67, v54);
        [(WFUserSuppliedNetwork *)v75 setPassword:v68];
      }
    }
    else
    {
    }
  }
  v69 = WFLogForCategory(0);
  os_log_type_t v70 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v69)
  {
    v71 = v69;
    if (os_log_type_enabled(v71, v70))
    {
      v72 = WFStringFromWFSecurityMode([(WFUserSuppliedNetwork *)v75 security]);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFOtherNetworkContext gatherCredentials:]";
      __int16 v86 = 2112;
      uint64_t v87 = (uint64_t)v76;
      __int16 v88 = 2112;
      v89 = v72;
      _os_log_impl(&dword_226071000, v71, v70, "%s: user joining other network %@ (security %@)", buf, 0x20u);
    }
  }

  [(WFOtherNetworkContext *)self setUserSuppliedNetwork:v75];
  v78.receiver = self;
  v78.super_class = (Class)WFOtherNetworkContext;
  [(WFCredentialsContext *)&v78 gatherCredentials:v4];
}

- (int64_t)securityMode
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(WFOtherNetworkContext *)self network];
  int64_t v4 = [v3 securityMode];

  if (self->_type != 1)
  {
    v5 = [(WFCredentialsContext *)self provider];
    if (([v5 conformsToProtocol:&unk_26DA14A48] & 1) == 0)
    {
LABEL_9:

      return v4;
    }
    id v6 = [(WFCredentialsContext *)self provider];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(WFCredentialsContext *)self provider];
      int64_t v4 = WFWiFiSecurityModeFromOtherSecurityMode([v8 securityMode]);

      v5 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v5)
      {
        id v10 = v5;
        if (os_log_type_enabled(v10, v9))
        {
          os_log_type_t v11 = [(WFCredentialsContext *)self provider];
          int v13 = 136315650;
          char v14 = "-[WFOtherNetworkContext securityMode]";
          __int16 v15 = 2112;
          int v16 = v11;
          __int16 v17 = 2048;
          int64_t v18 = v4;
          _os_log_impl(&dword_226071000, v10, v9, "%s: using provider (%@) securityMode %ld", (uint8_t *)&v13, 0x20u);
        }
      }
      goto LABEL_9;
    }
  }
  return v4;
}

- (BOOL)isEnterprise
{
  v3 = [(WFOtherNetworkContext *)self network];
  char v4 = [v3 isEnterprise];

  if (self->_type == 1) {
    return v4;
  }
  uint64_t v6 = [(WFOtherNetworkContext *)self securityMode];
  return WFSecurityModeIsEnterprise(v6);
}

- (void)otherNetworkViewControllerUserDidTapJoin:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__WFOtherNetworkContext_otherNetworkViewControllerUserDidTapJoin___block_invoke;
  v5[3] = &unk_26478F030;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  v5[4] = self;
  [(WFOtherNetworkContext *)self gatherCredentials:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __66__WFOtherNetworkContext_otherNetworkViewControllerUserDidTapJoin___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a1 + 5;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setJoining:0];

  id v9 = objc_loadWeakRetained(a1 + 6);
  id v7 = [a1[4] network];
  id v8 = [v7 ssid];
  [v9 _updateActivityStringForError:v5 networkName:v8];
}

- (BOOL)otherNetworkViewController:(id)a3 isValidPassword:(id)a4
{
  id v5 = a4;
  uint64_t v6 = WFWiFiSecurityModeFromOtherSecurityMode([a3 securityMode]);
  LOBYTE(a3) = WFValidPasswordForSecurityMode(v6, v5);

  return (char)a3;
}

- (void)savePrivateAddressMode:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_226071000, v5, v6, "User joining other network using private address mode: %ld", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(WFOtherNetworkContext *)self privateAddressModeChangeHandler];

  if (v7)
  {
    id v8 = [(WFOtherNetworkContext *)self privateAddressModeChangeHandler];
    v8[2](v8, a3);
  }
}

- (NSArray)availableTLSIdentities
{
  return self->_availableTLSIdentities;
}

- (void)setAvailableTLSIdentities:(id)a3
{
}

- (BOOL)isPasswordSharingSupported
{
  return self->passwordSharingSupported;
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_int64_t requestedFields = a3;
}

- (NSString)username
{
  return self->username;
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (int64_t)availableAuthTraits
{
  return self->_availableAuthTraits;
}

- (void)setAvailableAuthTraits:(int64_t)a3
{
  self->_availableAuthTraits = a3;
}

- (BOOL)supportsRandomMACAddress
{
  return self->_supportsRandomMACAddress;
}

- (void)setSupportsRandomMACAddress:(BOOL)a3
{
  self->_supportsRandomMACAddress = a3;
}

- (BOOL)isUsingRandomMACAddress
{
  return self->_isUsingRandomMACAddress;
}

- (void)setIsUsingRandomMACAddress:(BOOL)a3
{
  self->_isUsingRandomMACAddress = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (WFUserSuppliedNetwork)userSuppliedNetwork
{
  return self->_userSuppliedNetwork;
}

- (void)setUserSuppliedNetwork:(id)a3
{
}

- (id)privateAddressModeChangeHandler
{
  return self->_privateAddressModeChangeHandler;
}

- (void)setPrivateAddressModeChangeHandler:(id)a3
{
}

- (NSArray)WAPIRootCertificates
{
  return self->_WAPIRootCertificates;
}

- (void)setWAPIRootCertificates:(id)a3
{
}

- (NSArray)WAPIIdentities
{
  return self->_WAPIIdentities;
}

- (void)setWAPIIdentities:(id)a3
{
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_WAPIIdentities, 0);
  objc_storeStrong((id *)&self->_WAPIRootCertificates, 0);
  objc_storeStrong(&self->_privateAddressModeChangeHandler, 0);
  objc_storeStrong((id *)&self->_userSuppliedNetwork, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->username, 0);
  objc_storeStrong((id *)&self->_availableTLSIdentities, 0);
}

@end