@interface WFGetSettingsOperation
- (NSArray)settings;
- (NSOperationQueue)keychainQueue;
- (NSString)interfaceName;
- (NSString)ssid;
- (WFGetSettingsOperation)initWithSSID:(id)a3 interfaceName:(id)a4;
- (__SCPreferences)prefs;
- (id)name;
- (void)dealloc;
- (void)setInterfaceName:(id)a3;
- (void)setKeychainQueue:(id)a3;
- (void)setName:(id)a3;
- (void)setPrefs:(__SCPreferences *)a3;
- (void)setSettings:(id)a3;
- (void)setSsid:(id)a3;
- (void)start;
@end

@implementation WFGetSettingsOperation

- (WFGetSettingsOperation)initWithSSID:(id)a3 interfaceName:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WFGetSettingsOperation;
  v8 = [(WFGetSettingsOperation *)&v20 init];
  if (!v8)
  {
    name = 0;
    goto LABEL_6;
  }
  if (!v6)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFGetSettingsOperation initWithSSID:interfaceName:]";
    v19 = "%s: missing ssid";
    goto LABEL_16;
  }
  uint64_t v9 = [v6 copy];
  ssid = v8->_ssid;
  v8->_ssid = (NSString *)v9;

  if (!v7)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFGetSettingsOperation initWithSSID:interfaceName:]";
    v19 = "%s: missing interfaceName";
LABEL_16:
    _os_log_impl(&dword_226071000, v17, v18, v19, buf, 0xCu);
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v11 = [v7 copy];
  interfaceName = v8->_interfaceName;
  v8->_interfaceName = (NSString *)v11;

  SCPreferencesRef v13 = SCPreferencesCreateWithAuthorization(0, @"com.apple.wifikit", 0, 0);
  v8->_prefs = v13;
  if (!v13)
  {
LABEL_18:
    name = v8;
    v8 = 0;
    goto LABEL_6;
  }
  uint64_t v14 = [NSString stringWithFormat:@"Get settings for '%@'", v8->_ssid];
  name = (WFGetSettingsOperation *)v8->_name;
  v8->_name = (NSString *)v14;
LABEL_6:

  return v8;
}

- (void)dealloc
{
  prefs = self->_prefs;
  if (prefs)
  {
    CFRelease(prefs);
    self->_prefs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFGetSettingsOperation;
  [(WFGetSettingsOperation *)&v4 dealloc];
}

- (void)start
{
  v109[1] = *MEMORY[0x263EF8340];
  v102.receiver = self;
  v102.super_class = (Class)WFGetSettingsOperation;
  [(WFOperation *)&v102 start];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      id v6 = [(WFGetSettingsOperation *)self ssid];
      interfaceName = self->_interfaceName;
      *(_DWORD *)buf = 138412546;
      v104 = v6;
      __int16 v105 = 2112;
      v106 = interfaceName;
      _os_log_impl(&dword_226071000, v5, v4, "Getting custom network settings for '%@' using interface='%@'", buf, 0x16u);
    }
  }

  v8 = self->_interfaceName;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:1];
  [v9 activate];
  v10 = [v9 userSettings];
  uint64_t v11 = [v10 OSSpecificAttributes];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F55EF0]];

  SCPreferencesRef v13 = WFLogForCategory(0);
  if (!v12)
  {
    os_log_type_t v79 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v79))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v13, v79, "No custom settings exist in WiFiManager", buf, 2u);
    }
    goto LABEL_129;
  }
  os_log_type_t v14 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v13 && os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 138412290;
    v104 = v12;
    _os_log_impl(&dword_226071000, v13, v14, "Existing custom network settings %@", buf, 0xCu);
  }

  v15 = [(WFGetSettingsOperation *)self ssid];
  v16 = [v12 objectForKey:v15];

  if (!v16)
  {
    SCPreferencesRef v13 = WFLogForCategory(0);
    os_log_type_t v80 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v13)
    {
      v81 = v13;
      if (os_log_type_enabled(v81, v80))
      {
        v82 = [(WFGetSettingsOperation *)self ssid];
        *(_DWORD *)buf = 138412290;
        v104 = v82;
        _os_log_impl(&dword_226071000, v81, v80, "No custom settings exist for network named %@", buf, 0xCu);
      }
    }
LABEL_129:

    v25 = 0;
    v26 = 0;
    v16 = 0;
    goto LABEL_23;
  }
  CFArrayRef v17 = SCNetworkSetCopyAll(self->_prefs);
  if (v17)
  {
    CFArrayRef v18 = v17;
    CFIndex Count = CFArrayGetCount(v17);
    if (Count < 1)
    {
LABEL_17:
      CFRelease(v18);
    }
    else
    {
      CFIndex v20 = Count;
      CFIndex v21 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v18, v21);
        if ([v16 isEqualToString:SCNetworkSetGetSetID(ValueAtIndex)]) {
          break;
        }
        if (v20 == ++v21) {
          goto LABEL_17;
        }
      }
      v27 = (const __SCNetworkSet *)CFRetain(ValueAtIndex);
      CFRelease(v18);
      if (v27)
      {
        CFArrayRef v28 = SCNetworkSetCopyServices(v27);
        cf = v27;
        if (!v28)
        {
          v25 = 0;
          v26 = 0;
LABEL_139:
          CFRelease(cf);
          goto LABEL_23;
        }
        CFArrayRef v29 = v28;
        v30 = WFLogForCategory(0);
        os_log_type_t v31 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v30 && os_log_type_enabled(v30, v31))
        {
          *(_DWORD *)buf = 136315394;
          v104 = "-[WFGetSettingsOperation start]";
          __int16 v105 = 2112;
          v106 = v8;
          _os_log_impl(&dword_226071000, v30, v31, "%s: interfaceName %@", buf, 0x16u);
        }
        v100 = v10;

        if (v8)
        {
          if (CFArrayGetCount(v29) >= 1)
          {
            CFIndex v32 = 0;
            while (1)
            {
              v33 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v29, v32);
              Interface = SCNetworkServiceGetInterface(v33);
              v35 = SCNetworkInterfaceGetBSDName(Interface);
              int v36 = [v35 isEqualToString:v8];

              if (v36) {
                break;
              }
              if (++v32 >= CFArrayGetCount(v29)) {
                goto LABEL_35;
              }
            }
            if (v33)
            {
              v99 = [MEMORY[0x263EFF980] array];
              v39 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x263F1BC50]);
              if (v39)
              {
                v40 = v39;
                SCNetworkProtocolGetConfiguration(v39);
                v41 = (char *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v95 = [[WFSettingsIPV4 alloc] initWithDictionary:v41];
                  v42 = WFLogForCategory(0);
                  os_log_type_t type = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v42 && os_log_type_enabled(v42, type))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    __int16 v105 = 2112;
                    v106 = v95;
                    _os_log_impl(&dword_226071000, v42, type, "%s: ipv4 %@", buf, 0x16u);
                  }

                  v43 = v95;
                  if (v95)
                  {
                    [v99 addObject:v95];
                  }
                  else
                  {
                    v44 = WFLogForCategory(0);
                    os_log_type_t typea = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v44 && os_log_type_enabled(v44, typea))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = v41;
                      _os_log_impl(&dword_226071000, v44, typea, "Failed to create WFSettingsIPV4 from protocolDict %@", buf, 0xCu);
                    }

                    v43 = 0;
                  }
                }
                CFRelease(v40);
              }
              else
              {
                v41 = 0;
              }
              v45 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x263F1BC58]);
              if (v45)
              {
                v46 = v45;
                SCNetworkProtocolGetConfiguration(v45);
                v47 = (char *)objc_claimAutoreleasedReturnValue();

                if (v47)
                {
                  v96 = v47;
                  v48 = [[WFSettingsIPV6 alloc] initWithDictionary:v47];
                  v49 = WFLogForCategory(0);
                  os_log_type_t typeb = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v49 && os_log_type_enabled(v49, typeb))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    __int16 v105 = 2112;
                    v106 = v48;
                    _os_log_impl(&dword_226071000, v49, typeb, "%s: ipv6 %@", buf, 0x16u);
                  }

                  if (v48)
                  {
                    v50 = v48;
                    [v99 addObject:v48];
                  }
                  else
                  {
                    v51 = WFLogForCategory(0);
                    os_log_type_t typec = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v51 && os_log_type_enabled(v51, typec))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = v96;
                      _os_log_impl(&dword_226071000, v51, typec, "Failed to create WFSettingsIPV6 from protocolDict %@", buf, 0xCu);
                    }

                    v50 = 0;
                  }

                  v47 = (char *)v96;
                }
                CFRelease(v46);
              }
              else
              {
                v47 = v41;
              }
              v52 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x263F1BC38]);
              if (v52)
              {
                v53 = v52;
                uint64_t v54 = SCNetworkProtocolGetConfiguration(v52);

                v97 = (const char *)v54;
                if (v54)
                {
                  v55 = [[WFSettingsDNS alloc] initWithDictionary:v54];
                  v56 = WFLogForCategory(0);
                  os_log_type_t typed = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v56 && os_log_type_enabled(v56, typed))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    __int16 v105 = 2112;
                    v106 = v55;
                    _os_log_impl(&dword_226071000, v56, typed, "%s: dns %@", buf, 0x16u);
                  }

                  if (v55)
                  {
                    [v99 addObject:v55];
                  }
                  else
                  {
                    v58 = WFLogForCategory(0);
                    os_log_type_t typee = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v58 && os_log_type_enabled(v58, typee))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = v97;
                      _os_log_impl(&dword_226071000, v58, typee, "Failed to create WFSettingsDNS from protocolDict %@", buf, 0xCu);
                    }
                  }
                }
                CFRelease(v53);
                v57 = (char *)v97;
              }
              else
              {
                v57 = v47;
              }
              v59 = SCNetworkServiceCopyProtocol(v33, (CFStringRef)*MEMORY[0x263F1BC88]);
              if (v59)
              {
                v60 = v59;
                v26 = SCNetworkProtocolGetConfiguration(v59);

                if (v26)
                {
                  *(void *)typef = v60;
                  [v26 objectForKey:@"HTTPProxyType"];

                  v98 = [[WFSettingsProxy alloc] initWithDictionary:v26];
                  v61 = WFLogForCategory(0);
                  os_log_type_t v62 = OSLogForWFLogLevel(4uLL);
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v61 && os_log_type_enabled(v61, v62))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = "-[WFGetSettingsOperation start]";
                    __int16 v105 = 2112;
                    v106 = v98;
                    _os_log_impl(&dword_226071000, v61, v62, "%s: proxy %@", buf, 0x16u);
                  }

                  v63 = v98;
                  if (v98)
                  {
                    if ([(WFSettingsProxy *)v98 authenticated])
                    {
                      v64 = WFLogForCategory(0);
                      os_log_type_t v65 = OSLogForWFLogLevel(3uLL);
                      if ((unint64_t)WFCurrentLogLevel() >= 3 && v64 && os_log_type_enabled(v64, v65))
                      {
                        *(_DWORD *)buf = 136315138;
                        v104 = "-[WFGetSettingsOperation start]";
                        _os_log_impl(&dword_226071000, v64, v65, "%s: proxy is authenticated, getting password from keychain", buf, 0xCu);
                      }

                      v85 = [(WFSettingsProxy *)v98 server];
                      v66 = [(WFSettingsProxy *)v98 port];
                      v67 = [(WFSettingsProxy *)v98 username];
                      uint64_t v68 = +[WFProxyKeychainOperation getPasswordOperationForHost:v85 port:v66 username:v67];

                      v69 = (void *)v68;
                      [(WFGetSettingsOperation *)self addDependency:v68];
                      v70 = [(WFGetSettingsOperation *)self keychainQueue];
                      v109[0] = v68;
                      v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:1];
                      [v70 addOperations:v71 waitUntilFinished:1];

                      v72 = [v69 error];

                      if (v72)
                      {
                        v73 = WFLogForCategory(0);
                        os_log_type_t v74 = OSLogForWFLogLevel(1uLL);
                        if (WFCurrentLogLevel() && v73)
                        {
                          v73 = v73;
                          if (os_log_type_enabled(v73, v74))
                          {
                            os_log_type_t v84 = v74;
                            v87 = [(WFSettingsProxy *)v98 server];
                            [(WFSettingsProxy *)v98 port];
                            v75 = v86 = v69;
                            v76 = [(WFSettingsProxy *)v98 username];
                            *(_DWORD *)buf = 138412802;
                            v104 = v87;
                            __int16 v105 = 2112;
                            v106 = v75;
                            __int16 v107 = 2112;
                            v108 = v76;
                            _os_log_impl(&dword_226071000, v73, v84, "Error getting password from the keychain for host: %@, port: %@, user: %@", buf, 0x20u);

                            v69 = v86;
                          }
                        }
                      }
                      else
                      {
                        v73 = [v69 password];
                        [(WFSettingsProxy *)v98 setPassword:v73];
                      }

                      NSLog(&cfstr_KeychainOpComp.isa);
                      v63 = v98;
                    }
                    [v99 addObject:v63];
                  }
                  else
                  {
                    v77 = WFLogForCategory(0);
                    os_log_type_t v78 = OSLogForWFLogLevel(1uLL);
                    if (WFCurrentLogLevel() && v77 && os_log_type_enabled(v77, v78))
                    {
                      *(_DWORD *)buf = 138412290;
                      v104 = (const char *)v26;
                      _os_log_impl(&dword_226071000, v77, v78, "Failed to create WFSettingsProxy from protocolDict %@", buf, 0xCu);
                    }

                    v63 = 0;
                  }

                  v60 = *(const __SCNetworkProtocol **)typef;
                }
                CFRelease(v60);
              }
              else
              {
                v26 = v57;
              }
              v25 = v99;
              p_super = &self->_settings->super;
              self->_settings = v25;
              goto LABEL_137;
            }
          }
LABEL_35:
          p_super = WFLogForCategory(0);
          os_log_type_t v38 = OSLogForWFLogLevel(1uLL);
          v25 = 0;
          if (WFCurrentLogLevel())
          {
            v10 = v100;
            if (p_super)
            {
              if (os_log_type_enabled(p_super, v38))
              {
                *(_DWORD *)buf = 136315394;
                v104 = "-[WFGetSettingsOperation start]";
                __int16 v105 = 2114;
                v106 = v29;
                _os_log_impl(&dword_226071000, p_super, v38, "%s: failed to get airport service from interfaces %{public}@", buf, 0x16u);
              }
              v25 = 0;
              v26 = 0;
            }
            else
            {
              v26 = 0;
            }
            goto LABEL_138;
          }
        }
        else
        {
          p_super = WFLogForCategory(0);
          os_log_type_t v83 = OSLogForWFLogLevel(1uLL);
          v25 = 0;
          if (WFCurrentLogLevel() && p_super)
          {
            if (os_log_type_enabled(p_super, v83))
            {
              *(_DWORD *)buf = 136315138;
              v104 = "-[WFGetSettingsOperation start]";
              _os_log_impl(&dword_226071000, p_super, v83, "%s: failed to get interface name for device", buf, 0xCu);
            }
            v25 = 0;
            v26 = 0;
            goto LABEL_137;
          }
        }
        v26 = 0;
LABEL_137:
        v10 = v100;
LABEL_138:

        CFRelease(v29);
        goto LABEL_139;
      }
    }
  }
  uint64_t v23 = WFLogForCategory(0);
  os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
  {
    *(_DWORD *)buf = 138543362;
    v104 = (const char *)v16;
    _os_log_impl(&dword_226071000, v23, v24, "Failed to get SCNetworkSetRef but network had a valid set UUID %{public}@", buf, 0xCu);
  }

  v25 = 0;
  v26 = 0;
LABEL_23:
  [(WFOperation *)self finish];
}

- (NSOperationQueue)keychainQueue
{
  keychainQueue = self->_keychainQueue;
  if (!keychainQueue)
  {
    os_log_type_t v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v5 = self->_keychainQueue;
    self->_keychainQueue = v4;

    [(NSOperationQueue *)self->_keychainQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_keychainQueue setQualityOfService:17];
    keychainQueue = self->_keychainQueue;
  }
  return keychainQueue;
}

- (id)name
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setName:(id)a3
{
}

- (NSArray)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (__SCPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(__SCPreferences *)a3
{
  self->_prefs = a3;
}

- (void)setKeychainQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end