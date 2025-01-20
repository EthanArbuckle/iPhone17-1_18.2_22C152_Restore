@interface WFSaveSettingsOperation
- (BOOL)isCurrentNetwork;
- (NSArray)settings;
- (NSOperationQueue)keychainQueue;
- (NSString)interfaceName;
- (NSString)ssid;
- (WFSaveSettingsOperation)initWithSSID:(id)a3 interfaceName:(id)a4 settings:(id)a5;
- (__SCNetworkSet)_createNewSetForNetworkNamed:(id)a3 interfaceName:(id)a4;
- (__SCNetworkSet)_defaultSetRetained;
- (__SCPreferences)prefs;
- (id)name;
- (void)_applyProxySettings:(id)a3 service:(__SCNetworkProtocol *)a4;
- (void)dealloc;
- (void)setCurrentNetwork:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setKeychainQueue:(id)a3;
- (void)setName:(id)a3;
- (void)setPrefs:(__SCPreferences *)a3;
- (void)setSettings:(id)a3;
- (void)setSsid:(id)a3;
- (void)start;
@end

@implementation WFSaveSettingsOperation

- (WFSaveSettingsOperation)initWithSSID:(id)a3 interfaceName:(id)a4 settings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WFSaveSettingsOperation;
  v11 = [(WFSaveSettingsOperation *)&v21 init];
  v12 = v11;
  if (!v8) {
    goto LABEL_8;
  }
  if (!v11)
  {
    name = 0;
    goto LABEL_7;
  }
  uint64_t v13 = [v8 copy];
  ssid = v12->_ssid;
  v12->_ssid = (NSString *)v13;

  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v15 = [v9 copy];
  interfaceName = v12->_interfaceName;
  v12->_interfaceName = (NSString *)v15;

  if (v10
    && (objc_storeStrong((id *)&v12->_settings, a5),
        SCPreferencesRef v17 = SCPreferencesCreateWithAuthorization(0, @"com.apple.wifikit", 0, 0),
        (v12->_prefs = v17) != 0))
  {
    uint64_t v18 = [NSString stringWithFormat:@"Save settings for '%@'", v12->_ssid];
    name = (WFSaveSettingsOperation *)v12->_name;
    v12->_name = (NSString *)v18;
  }
  else
  {
LABEL_8:
    name = v12;
    v12 = 0;
  }
LABEL_7:

  return v12;
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
  v4.super_class = (Class)WFSaveSettingsOperation;
  [(WFSaveSettingsOperation *)&v4 dealloc];
}

- (void)start
{
  v2 = self;
  v144[1] = *MEMORY[0x263EF8340];
  v135.receiver = self;
  v135.super_class = (Class)WFSaveSettingsOperation;
  [(WFOperation *)&v135 start];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = [(WFSaveSettingsOperation *)v2 ssid];
      *(_DWORD *)buf = 138412290;
      v137 = v6;
      _os_log_impl(&dword_226071000, v5, v4, "Starting persisting settings for ssid: %@", buf, 0xCu);
    }
  }

  v7 = (void *)[objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:1];
  [v7 activate];
  id v8 = v2->_interfaceName;
  v124 = v7;
  v121 = [v7 userSettings];
  id v9 = [v121 OSSpecificAttributes];
  uint64_t v10 = *MEMORY[0x263F55EF0];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F55EF0]];

  v125 = v11;
  if (!v11
    || ([(WFSaveSettingsOperation *)v2 ssid],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKey:v12],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v23)
    {
      v25 = v23;
      if (os_log_type_enabled(v25, v24))
      {
        [(WFSaveSettingsOperation *)v2 ssid];
        v26 = v8;
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v137 = v27;
        _os_log_impl(&dword_226071000, v25, v24, "No existing custom network settings for ssid: %@", buf, 0xCu);

        id v8 = v26;
      }
    }
    uint64_t v13 = 0;
LABEL_30:
    if (SCPreferencesLock(v2->_prefs, 0) || (SCPreferencesSynchronize(v2->_prefs), SCPreferencesLock(v2->_prefs, 1u)))
    {
      v31 = (void *)[v11 mutableCopy];
      if (!v31)
      {
        v31 = [MEMORY[0x263EFF9A0] dictionary];
      }
      v32 = [(WFSaveSettingsOperation *)v2 ssid];
      v33 = [(WFSaveSettingsOperation *)v2 _createNewSetForNetworkNamed:v32 interfaceName:v8];

      if (v33)
      {
        v34 = v8;
        v35 = v33;
        uint64_t v36 = SCNetworkSetGetSetID(v33);

        v37 = [(WFSaveSettingsOperation *)v2 ssid];
        [v31 setObject:v36 forKey:v37];

        SCPreferencesCommitChanges(v2->_prefs);
        SCPreferencesApplyChanges(v2->_prefs);
        uint64_t v13 = (void *)v36;
      }
      else
      {
        v35 = 0;
        v34 = v8;
        v38 = WFLogForCategory(0);
        uint64_t v39 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v38)
        {
          v40 = v38;
          if (os_log_type_enabled(v40, (os_log_type_t)v39))
          {
            [(WFSaveSettingsOperation *)v2 ssid];
            v122 = v13;
            v41 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v137 = v41;
            _os_log_impl(&dword_226071000, v40, (os_log_type_t)v39, "Failed to create new set for network named %{public}@", buf, 0xCu);

            uint64_t v13 = v122;
          }
        }
      }
      SCPreferencesUnlock(v2->_prefs);
      SCPreferencesSynchronize(v2->_prefs);
      id v42 = objc_alloc_init(MEMORY[0x263F386F8]);
      uint64_t v143 = v10;
      v144[0] = v31;
      v43 = [NSDictionary dictionaryWithObjects:v144 forKeys:&v143 count:1];
      [v42 setOSSpecificAttributes:v43];

      id v134 = 0;
      v44 = v124;
      char v45 = [v124 applyUserSettings:v42 properties:0 error:&v134];
      CFArrayRef v46 = (const __CFArray *)v134;
      if ((v45 & 1) == 0)
      {
        v47 = WFLogForCategory(0);
        os_log_type_t v48 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v47 && os_log_type_enabled(v47, v48))
        {
          *(_DWORD *)buf = 138412546;
          v137 = (const char *)v31;
          __int16 v138 = 2112;
          CFArrayRef v139 = v46;
          _os_log_impl(&dword_226071000, v47, v48, "failed to apply custom network set %@, error='%@'", buf, 0x16u);
        }

        v44 = v124;
      }

      id v8 = v34;
      if (v35)
      {
        v28 = v35;
        goto LABEL_50;
      }
    }
    else
    {
      v92 = WFLogForCategory(0);
      os_log_type_t v93 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v92 && os_log_type_enabled(v92, v93))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v92, v93, "Failed to get SCPreferencesLock", buf, 2u);
      }

      v44 = v124;
    }
    v94 = WFLogForCategory(0);
    os_log_type_t v95 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v94 && os_log_type_enabled(v94, v95))
    {
      *(_DWORD *)buf = 138543362;
      v137 = (const char *)v13;
      _os_log_impl(&dword_226071000, v94, v95, "Failed to get SCNetworkSetRef for UUID %{public}@", buf, 0xCu);
    }
    v123 = v13;

    v28 = 0;
    CFArrayRef v63 = 0;
    LOBYTE(v53) = 1;
    v62 = v121;
    v51 = v125;
    goto LABEL_128;
  }
  v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 138543362;
    v137 = (const char *)v13;
    _os_log_impl(&dword_226071000, v14, v15, "Using existing UUID for network settings %{public}@", buf, 0xCu);
  }

  CFArrayRef v16 = SCNetworkSetCopyAll(v2->_prefs);
  if (!v16)
  {
LABEL_25:
    v29 = WFLogForCategory(0);
    os_log_type_t v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)buf = 138543362;
      v137 = (const char *)v13;
      _os_log_impl(&dword_226071000, v29, v30, "Unable to find networkSet matching UUID: %{public}@", buf, 0xCu);
    }

    goto LABEL_30;
  }
  CFArrayRef v17 = v16;
  uint64_t v18 = v8;
  CFIndex Count = CFArrayGetCount(v16);
  if (Count < 1)
  {
LABEL_17:
    CFRelease(v17);
    id v8 = v18;
    goto LABEL_25;
  }
  CFIndex v20 = Count;
  CFIndex v21 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v17, v21);
    if ([v13 isEqualToString:SCNetworkSetGetSetID(ValueAtIndex)]) {
      break;
    }
    if (v20 == ++v21) {
      goto LABEL_17;
    }
  }
  v28 = (const __SCNetworkSet *)CFRetain(ValueAtIndex);
  CFRelease(v17);
  id v8 = v18;
  if (!v28) {
    goto LABEL_25;
  }
  v44 = v124;
LABEL_50:
  v123 = v13;
  v49 = WFLogForCategory(0);
  if (!v44)
  {
    os_log_type_t v106 = OSLogForWFLogLevel(1uLL);
    v51 = v125;
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, v106)) {
      goto LABEL_147;
    }
    *(_DWORD *)buf = 136315138;
    v137 = "-[WFSaveSettingsOperation start]";
    v107 = "%s: failed to CWFInterface";
    goto LABEL_141;
  }
  os_log_type_t v50 = OSLogForWFLogLevel(3uLL);
  v51 = v125;
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v49 && os_log_type_enabled(v49, v50))
  {
    *(_DWORD *)buf = 136315394;
    v137 = "-[WFSaveSettingsOperation start]";
    __int16 v138 = 2112;
    CFArrayRef v139 = (const __CFArray *)v8;
    _os_log_impl(&dword_226071000, v49, v50, "%s: interfaceName %@", buf, 0x16u);
  }

  if (!v8)
  {
    v49 = WFLogForCategory(0);
    os_log_type_t v106 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, v106)) {
      goto LABEL_147;
    }
    *(_DWORD *)buf = 136315138;
    v137 = "-[WFSaveSettingsOperation start]";
    v107 = "%s: failed to get interface name for device";
LABEL_141:
    _os_log_impl(&dword_226071000, v49, v106, v107, buf, 0xCu);
LABEL_147:

    LOBYTE(v53) = 0;
    goto LABEL_148;
  }
  if (!SCPreferencesLock(v2->_prefs, 0))
  {
    SCPreferencesSynchronize(v2->_prefs);
    if (!SCPreferencesLock(v2->_prefs, 1u))
    {
      v49 = WFLogForCategory(0);
      os_log_type_t v108 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49)
      {
        v109 = v28;
        v110 = v49;
        if (os_log_type_enabled(v110, v108))
        {
          int v111 = SCError();
          v112 = SCErrorString(v111);
          *(_DWORD *)buf = 136446210;
          v137 = v112;
          _os_log_impl(&dword_226071000, v110, v108, "SCPreferencesLock failed %{public}s", buf, 0xCu);
        }

        v28 = v109;
      }
      goto LABEL_147;
    }
  }
  CFArrayRef v52 = SCNetworkSetCopyServices(v28);
  CFArrayRef v53 = v52;
  if (!v52)
  {
LABEL_148:
    CFArrayRef v63 = 0;
    v62 = v121;
    goto LABEL_128;
  }
  set = v28;
  if (CFArrayGetCount(v52) < 1) {
    goto LABEL_63;
  }
  CFIndex v54 = 0;
  while (1)
  {
    v55 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v53, v54);
    Interface = SCNetworkServiceGetInterface(v55);
    v57 = SCNetworkInterfaceGetBSDName(Interface);
    int v58 = [v57 isEqualToString:v8];

    if (v58) {
      break;
    }
    if (++v54 >= CFArrayGetCount(v53)) {
      goto LABEL_63;
    }
  }
  if (v55)
  {
    CFArrayRef v118 = v53;
    v119 = v8;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id obj = [(WFSaveSettingsOperation *)v2 settings];
    uint64_t v64 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
    v126 = v2;
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v131;
      uint64_t v129 = *MEMORY[0x263F1BC88];
      uint64_t v127 = *(void *)v131;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v131 != v66) {
            objc_enumerationMutation(obj);
          }
          v68 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          v69 = [v68 protocol];
          v70 = SCNetworkServiceCopyProtocol(v55, v69);

          if (v70)
          {
            v71 = [v68 protocol];
            int v72 = [v71 isEqualToString:v129];

            if (v72)
            {
              [(WFSaveSettingsOperation *)v2 _applyProxySettings:v68 service:v70];
            }
            else
            {
              v73 = WFLogForCategory(0);
              os_log_type_t v74 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v73)
              {
                v75 = v73;
                if (os_log_type_enabled(v75, v74))
                {
                  v76 = [v68 protocol];
                  CFArrayRef v77 = [v68 items];
                  *(_DWORD *)buf = 138412546;
                  v137 = v76;
                  __int16 v138 = 2112;
                  CFArrayRef v139 = v77;
                  _os_log_impl(&dword_226071000, v75, v74, "%@ saving to SC %@", buf, 0x16u);

                  v2 = v126;
                }

                uint64_t v66 = v127;
              }

              CFDictionaryRef v78 = [v68 items];
              int v79 = SCNetworkProtocolSetConfiguration(v70, v78);

              if (!v79)
              {
                v80 = WFLogForCategory(0);
                os_log_type_t v81 = OSLogForWFLogLevel(1uLL);
                if (WFCurrentLogLevel() && v80)
                {
                  v82 = v80;
                  if (os_log_type_enabled(v82, v81))
                  {
                    v83 = [v68 protocol];
                    CFArrayRef v84 = [(WFSaveSettingsOperation *)v2 ssid];
                    int v85 = SCError();
                    v86 = SCErrorString(v85);
                    *(_DWORD *)buf = 138412802;
                    v137 = v83;
                    __int16 v138 = 2112;
                    CFArrayRef v139 = v84;
                    __int16 v140 = 2080;
                    v141 = v86;
                    _os_log_impl(&dword_226071000, v82, v81, "WiFi: Couldn't set configuration for %@ for %@: %s", buf, 0x20u);
                  }
                }

                uint64_t v66 = v127;
              }
            }
            CFRelease(v70);
          }
        }
        uint64_t v65 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
      }
      while (v65);
    }

    v28 = set;
    if ([(WFSaveSettingsOperation *)v2 isCurrentNetwork] && !SCNetworkSetSetCurrent(set))
    {
      v113 = WFLogForCategory(0);
      os_log_type_t v114 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v113)
      {
        v115 = v113;
        if (os_log_type_enabled(v115, v114))
        {
          int v116 = SCError();
          v117 = SCErrorString(v116);
          *(_DWORD *)buf = 136446210;
          v137 = v117;
          _os_log_impl(&dword_226071000, v115, v114, "SCNetworkSetSetCurrent failed: %{public}s", buf, 0xCu);
        }

        v2 = v126;
      }

      LOBYTE(v53) = 0;
      v44 = v124;
      v51 = v125;
      id v8 = v119;
      v28 = set;
      v62 = v121;
    }
    else
    {
      v44 = v124;
      v51 = v125;
      id v8 = v119;
      if (SCPreferencesCommitChanges(v2->_prefs))
      {
        if (SCPreferencesApplyChanges(v2->_prefs))
        {
          if (!SCPreferencesUnlock(v2->_prefs))
          {
            v87 = WFLogForCategory(0);
            os_log_type_t v88 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v87)
            {
              v89 = v87;
              if (os_log_type_enabled(v89, v88))
              {
                int v90 = SCError();
                v91 = SCErrorString(v90);
                *(_DWORD *)buf = 136446210;
                v137 = v91;
                _os_log_impl(&dword_226071000, v89, v88, "WiFi: SCPreferencesUnlock failed: %{public}s", buf, 0xCu);
              }

              v28 = set;
            }
          }
          SCPreferencesSynchronize(v2->_prefs);
        }
        else
        {
          v101 = WFLogForCategory(0);
          os_log_type_t v102 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v101)
          {
            v103 = v101;
            if (os_log_type_enabled(v103, v102))
            {
              int v104 = SCError();
              v105 = SCErrorString(v104);
              *(_DWORD *)buf = 136446210;
              v137 = v105;
              _os_log_impl(&dword_226071000, v103, v102, "WiFi: SCPreferencesApplyChanges failed: %{public}s", buf, 0xCu);
            }

            v28 = set;
          }

          SCPreferencesUnlock(v2->_prefs);
        }
      }
      else
      {
        v96 = WFLogForCategory(0);
        os_log_type_t v97 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v96)
        {
          v98 = v96;
          if (os_log_type_enabled(v98, v97))
          {
            int v99 = SCError();
            v100 = SCErrorString(v99);
            *(_DWORD *)buf = 136446210;
            v137 = v100;
            _os_log_impl(&dword_226071000, v98, v97, "WiFi: SCPreferencesCommitChanges failed: %{public}s", buf, 0xCu);
          }

          v28 = set;
        }
      }
      LOBYTE(v53) = 0;
      v62 = v121;
    }
    CFArrayRef v63 = v118;
  }
  else
  {
LABEL_63:
    CFArrayRef v59 = v53;
    v60 = WFLogForCategory(0);
    os_log_type_t v61 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v60 && os_log_type_enabled(v60, v61))
    {
      *(_DWORD *)buf = 136315394;
      v137 = "-[WFSaveSettingsOperation start]";
      __int16 v138 = 2114;
      CFArrayRef v139 = v53;
      _os_log_impl(&dword_226071000, v60, v61, "%s: failed to get airport service from interfaces %{public}@", buf, 0x16u);
    }

    LOBYTE(v53) = 0;
    v28 = set;
    v62 = v121;
    v51 = v125;
    CFArrayRef v63 = v59;
  }
LABEL_128:
  SCPreferencesUnlock(v2->_prefs);
  if (v63) {
    CFRelease(v63);
  }
  if ((v53 & 1) == 0) {
    CFRelease(v28);
  }
  [(WFOperation *)v2 finish];
}

- (void)_applyProxySettings:(id)a3 service:(__SCNetworkProtocol *)a4
{
  char v45 = self;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = SCNetworkProtocolGetConfiguration(a4);
  v7 = [[WFSettingsProxy alloc] initWithDictionary:v6];
  if ([(WFSettingsProxy *)v7 customProxy]
    && [(WFSettingsProxy *)v7 authenticated]
    && ![v5 authenticated]
    || objc_msgSend(v5, "authenticated", v45))
  {
    if (v7 && ([v5 authenticated] & 1) == 0)
    {
      v19 = WFLogForCategory(0);
      os_log_type_t v20 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v19)
      {
        CFIndex v21 = v19;
        if (os_log_type_enabled(v21, v20))
        {
          v22 = [(WFSettingsProxy *)v7 server];
          v23 = [(WFSettingsProxy *)v7 port];
          os_log_type_t v24 = [(WFSettingsProxy *)v7 username];
          *(_DWORD *)buf = 138412802;
          v51 = v22;
          __int16 v52 = 2112;
          CFArrayRef v53 = v23;
          __int16 v54 = 2112;
          v55 = v24;
          _os_log_impl(&dword_226071000, v21, v20, "Removing HTTP proxy password in KC server %@, port %@, username %@", buf, 0x20u);
        }
      }

      v14 = [(WFSettingsProxy *)v7 server];
      os_log_type_t v15 = [(WFSettingsProxy *)v7 port];
      CFArrayRef v16 = [(WFSettingsProxy *)v7 username];
      uint64_t v18 = +[WFProxyKeychainOperation removePasswordOperationForHost:v14 port:v15 username:v16];
    }
    else
    {
      if (!objc_msgSend(v5, "authenticated", v45)) {
        goto LABEL_22;
      }
      id v8 = WFLogForCategory(0);
      os_log_type_t v9 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v8)
      {
        uint64_t v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          v11 = [v5 server];
          v12 = [v5 port];
          uint64_t v13 = [v5 username];
          *(_DWORD *)buf = 138412802;
          v51 = v11;
          __int16 v52 = 2112;
          CFArrayRef v53 = v12;
          __int16 v54 = 2112;
          v55 = v13;
          _os_log_impl(&dword_226071000, v10, v9, "Saving new HTTP proxy password in KC server %@, port %@, username %@", buf, 0x20u);
        }
      }

      v14 = [v5 server];
      os_log_type_t v15 = [v5 port];
      CFArrayRef v16 = [v5 username];
      CFArrayRef v17 = [v5 password];
      uint64_t v18 = +[WFProxyKeychainOperation savePassswordOperationForHost:v14 port:v15 username:v16 password:v17];
    }
    if (v18)
    {
      objc_initWeak((id *)buf, v18);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __55__WFSaveSettingsOperation__applyProxySettings_service___block_invoke;
      v46[3] = &unk_26478E398;
      objc_copyWeak(&v48, (id *)buf);
      id v47 = v5;
      [v18 setCompletionBlock:v46];
      [(WFSaveSettingsOperation *)v45 addDependency:v18];
      v25 = [(WFSaveSettingsOperation *)v45 keychainQueue];
      v49 = v18;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
      [v25 addOperations:v26 waitUntilFinished:1];

      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
LABEL_27:

      goto LABEL_28;
    }
LABEL_22:
    uint64_t v18 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18)
    {
      uint64_t v18 = v18;
      if (os_log_type_enabled(v18, v27))
      {
        v28 = [v5 server];
        v29 = [v5 port];
        os_log_type_t v30 = [v5 username];
        *(_DWORD *)buf = 138412802;
        v51 = v28;
        __int16 v52 = 2112;
        CFArrayRef v53 = v29;
        __int16 v54 = 2112;
        v55 = v30;
        _os_log_impl(&dword_226071000, v18, v27, "Failed to create WFProxyKeychainOperation for host: %@, port: %@, user: %@", buf, 0x20u);
      }
    }
    goto LABEL_27;
  }
LABEL_28:
  v31 = WFLogForCategory(0);
  os_log_type_t v32 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v31)
  {
    v33 = v31;
    if (os_log_type_enabled(v33, v32))
    {
      v34 = [v5 protocol];
      v35 = [v5 items];
      *(_DWORD *)buf = 138412546;
      v51 = v34;
      __int16 v52 = 2112;
      CFArrayRef v53 = v35;
      _os_log_impl(&dword_226071000, v33, v32, "%@ saving to SC %@", buf, 0x16u);
    }
  }

  CFDictionaryRef v36 = [v5 items];
  BOOL v37 = SCNetworkProtocolSetConfiguration(a4, v36) == 0;

  if (v37)
  {
    v38 = WFLogForCategory(0);
    os_log_type_t v39 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v38)
    {
      v40 = v38;
      if (os_log_type_enabled(v40, v39))
      {
        v41 = [v5 protocol];
        id v42 = [(WFSaveSettingsOperation *)v45 ssid];
        int v43 = SCError();
        v44 = SCErrorString(v43);
        *(_DWORD *)buf = 138412802;
        v51 = v41;
        __int16 v52 = 2112;
        CFArrayRef v53 = v42;
        __int16 v54 = 2080;
        v55 = v44;
        _os_log_impl(&dword_226071000, v40, v39, "WiFi: Couldn't set configuration for %@ for %@: %s", buf, 0x20u);
      }
    }
  }
}

void __55__WFSaveSettingsOperation__applyProxySettings_service___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained error];

  if (v3)
  {
    os_log_type_t v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        v7 = [*(id *)(a1 + 32) server];
        id v8 = [*(id *)(a1 + 32) port];
        os_log_type_t v9 = [*(id *)(a1 + 32) username];
        int v10 = 138412802;
        v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        os_log_type_t v15 = v9;
        _os_log_impl(&dword_226071000, v6, v5, "Error saving password to the keychain for host: %@, port: %@, user: %@", (uint8_t *)&v10, 0x20u);
      }
    }
  }
}

- (__SCNetworkSet)_createNewSetForNetworkNamed:(id)a3 interfaceName:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = [(WFSaveSettingsOperation *)self _defaultSetRetained];
  if (!v8)
  {
    v11 = 0;
    goto LABEL_54;
  }
  os_log_type_t v9 = v8;
  SCNetworkSetRef v10 = SCNetworkSetCreate(self->_prefs);
  if (!v10)
  {
    v31 = WFLogForCategory(0);
    os_log_type_t v32 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v31)
    {
      v33 = v31;
      if (os_log_type_enabled(v33, v32))
      {
        int v34 = SCError();
        *(_DWORD *)buf = 136446210;
        v67 = SCErrorString(v34);
        _os_log_impl(&dword_226071000, v33, v32, "WiFi: SCNetworkSetCreate() failed: %{public}s\n", buf, 0xCu);
      }
    }
LABEL_52:
    v11 = 0;
    goto LABEL_53;
  }
  v11 = v10;
  if (([(__CFString *)v6 isEqualToString:@"Automatic"] & 1) == 0) {
    SCNetworkSetSetName(v11, v6);
  }
  CFArrayRef ServiceOrder = SCNetworkSetGetServiceOrder(v9);
  if (!SCNetworkSetSetServiceOrder(v11, ServiceOrder))
  {
    v35 = WFLogForCategory(0);
    os_log_type_t v36 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v35)
    {
      BOOL v37 = v35;
      if (os_log_type_enabled(v37, v36))
      {
        int v38 = SCError();
        *(_DWORD *)buf = 136446210;
        v67 = SCErrorString(v38);
        _os_log_impl(&dword_226071000, v37, v36, "WiFi: SCNetworkSetSetServiceOrder() failed: %{public}s\n", buf, 0xCu);
      }
    }
    CFArrayRef v14 = 0;
LABEL_50:
    SCNetworkSetRemove(v11);
    CFRelease(v11);
    if (v14) {
      CFRelease(v14);
    }
    goto LABEL_52;
  }
  CFArrayRef v13 = SCNetworkSetCopyServices(v9);
  if (!v13) {
    goto LABEL_53;
  }
  CFArrayRef v14 = v13;
  CFIndex Count = CFArrayGetCount(v13);
  if (Count < 1) {
    goto LABEL_60;
  }
  CFIndex v16 = Count;
  CFArrayRef v63 = 0;
  os_log_type_t v61 = v9;
  v62 = v6;
  service = 0;
  CFArrayRef v17 = 0;
  CFIndex v18 = 0;
  uint64_t v64 = v11;
  do
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v14, v18);
    SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (Interface)
    {
      CFIndex v21 = Interface;
      while (1)
      {
        v22 = v17;
        CFArrayRef v17 = SCNetworkInterfaceGetBSDName(v21);

        if ([v17 isEqualToString:v7]) {
          break;
        }
        CFIndex v21 = SCNetworkInterfaceGetInterface(v21);
        if (!v21) {
          goto LABEL_13;
        }
      }
      CFArrayRef v24 = v14;
      v25 = WFLogForCategory(0);
      os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v25 && os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 136315650;
        v67 = "-[WFSaveSettingsOperation _createNewSetForNetworkNamed:interfaceName:]";
        __int16 v68 = 2112;
        v69 = v21;
        __int16 v70 = 2112;
        id v71 = v7;
        _os_log_impl(&dword_226071000, v25, v26, "%s: found interface='%@' matching name='%@'", buf, 0x20u);
      }

      if (service)
      {
        v23 = ValueAtIndex;
        CFArrayRef v14 = v24;
        v11 = v64;
      }
      else
      {
        os_log_type_t v27 = SCNetworkServiceCreate(self->_prefs, v21);
        CFArrayRef v14 = v24;
        if (!v27)
        {
          v51 = WFLogForCategory(0);
          os_log_type_t v52 = OSLogForWFLogLevel(1uLL);
          os_log_type_t v9 = v61;
          v11 = v64;
          if (WFCurrentLogLevel() && v51)
          {
            CFArrayRef v53 = v51;
            if (os_log_type_enabled(v53, v52))
            {
              int v54 = SCError();
              v55 = SCErrorString(v54);
              *(_DWORD *)buf = 136446210;
              v67 = v55;
              _os_log_impl(&dword_226071000, v53, v52, "WiFi: SCNetworkServiceCreate() failed: %{public}s\n", buf, 0xCu);
            }
          }
          goto LABEL_49;
        }
        v23 = v27;
        v11 = v64;
        if (!SCNetworkServiceEstablishDefaultConfiguration(v27))
        {
          uint64_t v56 = WFLogForCategory(0);
          os_log_type_t v57 = OSLogForWFLogLevel(1uLL);
          os_log_type_t v9 = v61;
          if (WFCurrentLogLevel() && v56)
          {
            int v58 = v56;
            if (os_log_type_enabled(v58, v57))
            {
              int v59 = SCError();
              v60 = SCErrorString(v59);
              *(_DWORD *)buf = 136446210;
              v67 = v60;
              _os_log_impl(&dword_226071000, v58, v57, "WiFi: SCNetworkServiceEstablishDefaultConfiguration() failed: %{public}s\n", buf, 0xCu);
            }
          }
LABEL_48:
          SCNetworkServiceRemove(v23);
          CFRelease(v23);
LABEL_49:
          v6 = v62;
          goto LABEL_50;
        }
        SCNetworkServiceSetName(v23, @"Wi-Fi by wifikit");
        service = v23;
        CFArrayRef v63 = ValueAtIndex;
      }
    }
    else
    {
LABEL_13:
      v23 = ValueAtIndex;
    }
    if (!SCNetworkSetAddService(v11, v23))
    {
      os_log_type_t v39 = WFLogForCategory(0);
      os_log_type_t v40 = OSLogForWFLogLevel(1uLL);
      os_log_type_t v9 = v61;
      if (WFCurrentLogLevel() && v39)
      {
        v41 = v39;
        if (os_log_type_enabled(v41, v40))
        {
          int v42 = SCError();
          int v43 = SCErrorString(v42);
          *(_DWORD *)buf = 136446210;
          v67 = v43;
          _os_log_impl(&dword_226071000, v41, v40, "WiFi: SCNetworkSetAddService() failed: %{public}s\n", buf, 0xCu);
        }
      }
      v23 = service;
      if (service) {
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    ++v18;
  }
  while (v18 != v16);

  os_log_type_t v9 = v61;
  v6 = v62;
  v28 = service;
  if (service)
  {
    if (v63)
    {
      CFArrayRef v29 = SCNetworkSetGetServiceOrder(v61);
      if (v29) {
        CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v29);
      }
      else {
        CFArrayRef MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      }
      CFArrayRef v45 = MutableCopy;
      CFIndex v46 = CFArrayGetCount(MutableCopy);
      CFStringRef ServiceID = SCNetworkServiceGetServiceID(v63);
      v73.location = 0;
      v73.length = v46;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v45, v73, ServiceID);
      if (FirstIndexOfValue != -1)
      {
        CFIndex v49 = FirstIndexOfValue;
        CFStringRef v50 = SCNetworkServiceGetServiceID(service);
        CFArraySetValueAtIndex(v45, v49, v50);
        SCNetworkSetSetServiceOrder(v11, v45);
      }
      CFRelease(v45);
      v28 = service;
    }
    CFRelease(v28);
  }
LABEL_60:
  CFRelease(v14);
LABEL_53:
  CFRelease(v9);
LABEL_54:

  return v11;
}

- (__SCNetworkSet)_defaultSetRetained
{
  CFArrayRef v3 = SCNetworkSetCopyAll(self->_prefs);
  CFArrayRef v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1) {
    goto LABEL_8;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v4, v7);
    os_log_type_t v9 = SCNetworkSetGetName(ValueAtIndex);
    if ([v9 isEqualToString:@"Automatic"]) {
      break;
    }

    if (v6 == ++v7) {
      goto LABEL_8;
    }
  }
  CFRetain(ValueAtIndex);

  if (!ValueAtIndex) {
LABEL_8:
  }
    ValueAtIndex = SCNetworkSetCopyCurrent(self->_prefs);
  if (v4) {
    CFRelease(v4);
  }
  return ValueAtIndex;
}

- (NSOperationQueue)keychainQueue
{
  keychainQueue = self->_keychainQueue;
  if (!keychainQueue)
  {
    CFArrayRef v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    os_log_type_t v5 = self->_keychainQueue;
    self->_keychainQueue = v4;

    [(NSOperationQueue *)self->_keychainQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_keychainQueue setQualityOfService:17];
    keychainQueue = self->_keychainQueue;
  }
  return keychainQueue;
}

- (id)name
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isCurrentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(BOOL)a3
{
  self->_currentNetwork = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
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

- (NSArray)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void)setKeychainQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end