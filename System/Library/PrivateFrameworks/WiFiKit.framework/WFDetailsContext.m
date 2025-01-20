@interface WFDetailsContext
- (BOOL)autoJoinEnabled;
- (BOOL)autoLoginEnabled;
- (BOOL)demoModeEnabled;
- (BOOL)diagnosable;
- (BOOL)isConnectedWithHardwareAddress;
- (BOOL)isCredentialsVisible;
- (BOOL)isCurrent;
- (BOOL)isInSaveDataMode;
- (BOOL)isJoinable;
- (BOOL)isKnownNetwork;
- (BOOL)isPrivacyProxyConfigurable;
- (BOOL)isPrivacyProxyEnabled;
- (BOOL)isRandomMACAddressConfigurable;
- (BOOL)isRandomMACAddressDisabled;
- (BOOL)isRandomMACFeatureEnabled;
- (BOOL)isRandomMACSwitchOn;
- (BOOL)isWiFiOutranked;
- (BOOL)isWiFiOutrankedDev;
- (BOOL)isWifiModeConfigurable;
- (BOOL)needsDismissal;
- (BOOL)shouldHideCredentials;
- (BOOL)supportsAirportManagement;
- (CWFNetworkProfile)profile;
- (DADevice)daDevice;
- (NSArray)recommendations;
- (NSString)description;
- (NSString)hardwareMACAddress;
- (NSString)password;
- (NSString)portalURL;
- (NSString)randomMACAddress;
- (NSString)staticPrivateMACFooterText;
- (NSString)turnOFFPrivateMACFooterText;
- (NSString)turnONPrivateMACFooterText;
- (NSString)username;
- (NetworkQualityAssessment)networkQualityAssessment;
- (WFDetailsContext)initWithNetwork:(id)a3 profile:(id)a4 ipMonitor:(id)a5 interface:(id)a6 privateMACConfig:(id)a7 wifiModeConfig:(id)a8;
- (WFDiagnosticsContext)diagnosticsContext;
- (WFIPMonitor)ipMonitor;
- (WFInterface)interface;
- (WFNetworkScanRecord)network;
- (WFNetworkView)provider;
- (WFPortalContext)portalContext;
- (ct_green_tea_logger_s)greenTeaLogger;
- (id)WiFiModeChangedHandler;
- (id)actionHandler;
- (id)autoJoinHandler;
- (id)autoLoginHandler;
- (id)credentialsTappedHandler;
- (id)lowDataModeHandler;
- (id)networkQualityHandler;
- (id)privacyProxyHandler;
- (id)privateMACHandler;
- (int64_t)entryContext;
- (int64_t)privacyProxyTierStatus;
- (int64_t)requestedFields;
- (int64_t)wifiMode;
- (unint64_t)autoJoinConfigurable;
- (unint64_t)networkOrigin;
- (unint64_t)privateAddressMode;
- (unint64_t)scrollToCellType;
- (void)cancel;
- (void)cancelNetworkQualityRun;
- (void)dealloc;
- (void)disableRandomMAC;
- (void)enableRandomMAC:(BOOL)a3;
- (void)forget;
- (void)join;
- (void)manage;
- (void)openPortalURL;
- (void)openRecommendationLink;
- (void)overrideWiFiOutrank;
- (void)renewLease;
- (void)runNetworkQualityWithCompletionHandler:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setAutoJoinConfigurable:(unint64_t)a3;
- (void)setAutoJoinEnabled:(BOOL)a3;
- (void)setAutoJoinHandler:(id)a3;
- (void)setAutoLoginEnabled:(BOOL)a3;
- (void)setAutoLoginHandler:(id)a3;
- (void)setConnectedWithHardwareAddress:(BOOL)a3;
- (void)setCredentialsTappedHandler:(id)a3;
- (void)setCredentialsVisible:(BOOL)a3;
- (void)setCurrent:(BOOL)a3;
- (void)setDaDevice:(id)a3;
- (void)setDemoModeEnabled:(BOOL)a3;
- (void)setDiagnosable:(BOOL)a3;
- (void)setDiagnosticsContext:(id)a3;
- (void)setEntryContext:(int64_t)a3;
- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setInterface:(id)a3;
- (void)setIpMonitor:(id)a3;
- (void)setIsInSaveDataMode:(BOOL)a3;
- (void)setIsPrivacyProxyEnabled:(BOOL)a3;
- (void)setJoinable:(BOOL)a3;
- (void)setKnownNetwork:(BOOL)a3;
- (void)setLowDataModeHandler:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setNetworkQualityAssessment:(id)a3;
- (void)setNetworkQualityHandler:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPortalContext:(id)a3;
- (void)setPrivacyProxyConfigurable:(BOOL)a3;
- (void)setPrivacyProxyHandler:(id)a3;
- (void)setPrivacyProxyTierStatus:(int64_t)a3;
- (void)setPrivateAddressMode:(unint64_t)a3;
- (void)setPrivateMACHandler:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRandomMACAddressDisabled:(BOOL)a3;
- (void)setRandomMACSwitchOn:(BOOL)a3;
- (void)setRecommendations:(id)a3;
- (void)setRequestedFields:(int64_t)a3;
- (void)setScrollToCellType:(unint64_t)a3;
- (void)setStaticPrivateMACFooterText:(id)a3;
- (void)setSupportsAirportManagement:(BOOL)a3;
- (void)setTurnOFFPrivateMACFooterText:(id)a3;
- (void)setTurnONPrivateMACFooterText:(id)a3;
- (void)setUsername:(id)a3;
- (void)setWiFiModeChangedHandler:(id)a3;
- (void)setWiFiOutranked:(BOOL)a3;
- (void)setWiFiOutranked:(BOOL)a3 privateCellular:(BOOL)a4;
- (void)setWiFiOutrankedDev:(BOOL)a3;
- (void)setWifiMode:(int64_t)a3;
- (void)setWifiModeConfig:(id)a3;
- (void)setWifiModeConfigurable:(BOOL)a3;
- (void)updatePrivateAddressMode:(unint64_t)a3;
@end

@implementation WFDetailsContext

- (WFDetailsContext)initWithNetwork:(id)a3 profile:(id)a4 ipMonitor:(id)a5 interface:(id)a6 privateMACConfig:(id)a7 wifiModeConfig:(id)a8
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v125 = a4;
  id obj = a5;
  id v16 = a5;
  id v123 = a6;
  id v17 = a7;
  id v124 = a8;
  v126.receiver = self;
  v126.super_class = (Class)WFDetailsContext;
  v18 = [(WFDetailsContext *)&v126 init];

  if (!v18) {
    goto LABEL_137;
  }
  if (!v15)
  {
    v114 = WFLogForCategory(0);
    os_log_type_t v115 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v114 || !os_log_type_enabled(v114, v115)) {
      goto LABEL_136;
    }
    *(_DWORD *)buf = 136315138;
    v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v116 = "%s: nil network";
    goto LABEL_135;
  }
  id v121 = a6;
  objc_storeStrong((id *)&v18->_network, a3);
  if (v125)
  {
    objc_storeStrong((id *)&v18->_profile, a4);
    v18->_knownNetwork = 1;
    id v19 = v123;
    if ([v125 autoJoinConfigurable])
    {
      v20 = WFLogForCategory(0);
      os_log_type_t v21 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v20)
      {
        v22 = v20;
        if (os_log_type_enabled(v22, v21))
        {
          v23 = [v15 ssid];
          *(_DWORD *)buf = 138412290;
          v128 = v23;
          _os_log_impl(&dword_226071000, v22, v21, "'%@' is autoJoinConfigurable", buf, 0xCu);
        }
      }

      v18->_requestedFields |= 0x20uLL;
    }
    if ([v125 autoLoginConfigurable])
    {
      v24 = WFLogForCategory(0);
      os_log_type_t v25 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v24)
      {
        v26 = v24;
        if (os_log_type_enabled(v26, v25))
        {
          v27 = [v15 ssid];
          *(_DWORD *)buf = 138412290;
          v128 = v27;
          _os_log_impl(&dword_226071000, v26, v25, "'%@' is autoLoginConfigurable", buf, 0xCu);
        }
      }

      v18->_requestedFields |= 0x40uLL;
    }
    if ([v125 saveDataModeConfigurable])
    {
      v28 = WFLogForCategory(0);
      os_log_type_t v29 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v28)
      {
        v30 = v28;
        if (os_log_type_enabled(v30, v29))
        {
          v31 = [v15 ssid];
          *(_DWORD *)buf = 138412290;
          v128 = v31;
          _os_log_impl(&dword_226071000, v30, v29, "'%@' is saveDataModeConfigurable", buf, 0xCu);
        }
      }

      v18->_requestedFields |= 0x200uLL;
    }
    int v32 = [v125 networkQualityVisible];
    v33 = WFLogForCategory(0);
    os_log_type_t v34 = OSLogForWFLogLevel(3uLL);
    BOOL v36 = (unint64_t)WFCurrentLogLevel() > 2 && v33 != 0;
    if (v32)
    {
      if (v36)
      {
        v37 = v33;
        if (os_log_type_enabled(v37, v34))
        {
          v38 = [v15 ssid];
          *(_DWORD *)buf = 138412290;
          v128 = v38;
          _os_log_impl(&dword_226071000, v37, v34, "NetQuality: '%@' is networkQualityVisible", buf, 0xCu);
        }
      }

      v18->_requestedFields |= 0x800uLL;
    }
    else
    {
      if (v36)
      {
        v43 = v33;
        if (os_log_type_enabled(v43, v34))
        {
          v44 = [v15 ssid];
          *(_DWORD *)buf = 138412290;
          v128 = v44;
          _os_log_impl(&dword_226071000, v43, v34, "NetQuality: %@ is NOT networkQualityVisible", buf, 0xCu);
        }
      }
    }
    if ([v125 forgetable])
    {
      v45 = WFLogForCategory(0);
      os_log_type_t v46 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v45)
      {
        v47 = v45;
        if (os_log_type_enabled(v47, v46))
        {
          v48 = [v15 ssid];
          *(_DWORD *)buf = 138412290;
          v128 = v48;
          _os_log_impl(&dword_226071000, v47, v46, "'%@' is forgettable", buf, 0xCu);
        }
      }

      v18->_requestedFields |= 0x10uLL;
    }
  }
  else
  {
    v39 = WFLogForCategory(0);
    os_log_type_t v40 = OSLogForWFLogLevel(3uLL);
    id v19 = v123;
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v39)
    {
      v41 = v39;
      if (os_log_type_enabled(v41, v40))
      {
        v42 = [v15 ssid];
        *(_DWORD *)buf = 136315394;
        v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
        __int16 v129 = 2112;
        *(void *)v130 = v42;
        _os_log_impl(&dword_226071000, v41, v40, "%s: not a known network %@, nil profile", buf, 0x16u);
      }
    }

    v18->_knownNetwork = 0;
  }
  if ([v15 isPrivateMACDisabledByProfile]
    && [v15 isSupervised])
  {
    char v49 = [v15 isRandomMACAddressEnabled];
  }
  else
  {
    char v49 = 1;
  }
  v18->_BOOL randomMACAddressConfigurable = v49;
  int v50 = [v125 isAutoJoinDisabled];
  v18->_BOOL autoJoinEnabled = v50 ^ 1;
  if (((v50 ^ 1) & 1) == 0)
  {
    v51 = [v125 hasDisabledUntilDate];

    if (v51)
    {
      v52 = WFLogForCategory(0);
      os_log_type_t v53 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v52)
      {
        v54 = v52;
        if (os_log_type_enabled(v54, v53))
        {
          v55 = [v125 SSID];
          [v125 hasDisabledUntilDate];
          id v56 = v17;
          id v57 = v16;
          v58 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
          __int16 v129 = 2112;
          *(void *)v130 = v55;
          *(_WORD *)&v130[8] = 2112;
          v131 = v58;
          _os_log_impl(&dword_226071000, v54, v53, "%s: %@ autojoin temporarily disabled until %@, overriding UI switch to show enabled", buf, 0x20u);

          id v16 = v57;
          id v17 = v56;
          id v19 = v123;
        }
      }

      v18->_BOOL autoJoinEnabled = 1;
    }
  }
  v18->_BOOL autoLoginEnabled = [v125 bypassCaptive] ^ 1;
  if ([v125 lowDataMode] == 1)
  {
    BOOL v59 = 1;
  }
  else if ([v125 isPersonalHotspot])
  {
    BOOL v59 = [v125 lowDataMode] == 0;
  }
  else
  {
    BOOL v59 = 0;
  }
  v60 = v19;
  v18->_BOOL isInSaveDataMode = v59;
  v18->_BOOL isPrivacyProxyEnabled = [v125 isPrivacyProxyEnabled];
  if (MEMORY[0x263F8BAC8]) {
    v18->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  v61 = WFLogForCategory(0);
  os_log_type_t v62 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v61)
  {
    v63 = v61;
    if (os_log_type_enabled(v63, v62))
    {
      [v17 hardwareMACAddress];
      id v64 = v17;
      id v65 = v16;
      v66 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v128 = v66;
      _os_log_impl(&dword_226071000, v63, v62, "hardwareMAC is '%@'", buf, 0xCu);

      id v16 = v65;
      id v17 = v64;
      v60 = v19;
    }
  }
  v67 = [v17 hardwareMACAddress];
  uint64_t v68 = [v67 formattedWiFiAddress];
  hardwareMACAddress = v18->_hardwareMACAddress;
  v18->_hardwareMACAddress = (NSString *)v68;

  if (v18->_greenTeaLogger)
  {
    v70 = [MEMORY[0x263F08AB0] processInfo];
    v71 = [v70 processName];

    v72 = getCTGreenTeaOsLogHandle();
    v73 = v72;
    if (v72 && os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      v74 = v18->_hardwareMACAddress;
      *(_DWORD *)buf = 138413058;
      v128 = v71;
      __int16 v129 = 2080;
      *(void *)v130 = "com.apple.wifikit";
      *(_WORD *)&v130[8] = 2112;
      v131 = v71;
      *(_WORD *)v132 = 2112;
      *(void *)&v132[2] = v74;
      _os_log_impl(&dword_226071000, v73, OS_LOG_TYPE_INFO, "<%@>[%s][%@]:WLAN hardware MAC address..%@", buf, 0x2Au);
    }
  }
  v75 = [v15 randomMACAddress];
  uint64_t v76 = [v75 formattedWiFiAddress];
  randomMACAddress = v18->_randomMACAddress;
  v18->_randomMACAddress = (NSString *)v76;

  if (v18->_greenTeaLogger)
  {
    v78 = [MEMORY[0x263F08AB0] processInfo];
    v79 = [v78 processName];

    v80 = getCTGreenTeaOsLogHandle();
    v81 = v80;
    if (v80 && os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      v82 = v18->_randomMACAddress;
      *(_DWORD *)buf = 138413058;
      v128 = v79;
      __int16 v129 = 2080;
      *(void *)v130 = "com.apple.wifikit";
      *(_WORD *)&v130[8] = 2112;
      v131 = v79;
      *(_WORD *)v132 = 2112;
      *(void *)&v132[2] = v82;
      _os_log_impl(&dword_226071000, v81, OS_LOG_TYPE_INFO, "<%@>[%s][%@]:WLAN random MAC address..%@", buf, 0x2Au);
    }
  }
  v18->_randomMACFeatureEnabled = [v17 isPrivateAddressSupported];
  v83 = WFLogForCategory(0);
  os_log_type_t v84 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v83)
  {
    v85 = v83;
    if (os_log_type_enabled(v85, v84))
    {
      int v86 = [v17 isConnectedWithHardwareAddress];
      *(_DWORD *)buf = 67109120;
      LODWORD(v128) = v86;
      _os_log_impl(&dword_226071000, v85, v84, "Network connected with hardware Address: %d", buf, 8u);
    }
  }
  v18->_connectedWithHardwareAddress = [v17 isConnectedWithHardwareAddress];
  if (v18->_randomMACFeatureEnabled) {
    v18->_requestedFields |= 0x400uLL;
  }
  uint64_t v87 = [v17 privateAddressMode];
  v18->_unint64_t privateAddressMode = v87;
  v18->_randomMACAddressDisabled = v87 != 2;
  v18->_randomMACSwitchOn = v87 == 2;
  v88 = WFLogForCategory(0);
  os_log_type_t v89 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v88)
  {
    v90 = v88;
    if (os_log_type_enabled(v90, v89))
    {
      v91 = [v15 ssid];
      BOOL autoJoinEnabled = v18->_autoJoinEnabled;
      id v119 = v17;
      BOOL autoLoginEnabled = v18->_autoLoginEnabled;
      BOOL isInSaveDataMode = v18->_isInSaveDataMode;
      BOOL isPrivacyProxyEnabled = v18->_isPrivacyProxyEnabled;
      unint64_t privateAddressMode = v18->_privateAddressMode;
      [v15 randomMACAddress];
      v95 = id v120 = v16;
      BOOL randomMACAddressConfigurable = v18->_randomMACAddressConfigurable;
      *(_DWORD *)buf = 138414082;
      v128 = v91;
      __int16 v129 = 1024;
      *(_DWORD *)v130 = autoJoinEnabled;
      v60 = v123;
      *(_WORD *)&v130[4] = 1024;
      *(_DWORD *)&v130[6] = autoLoginEnabled;
      id v17 = v119;
      LOWORD(v131) = 1024;
      *(_DWORD *)((char *)&v131 + 2) = isInSaveDataMode;
      HIWORD(v131) = 1024;
      *(_DWORD *)v132 = isPrivacyProxyEnabled;
      *(_WORD *)&v132[4] = 2048;
      *(void *)&v132[6] = privateAddressMode;
      __int16 v133 = 2112;
      v134 = v95;
      __int16 v135 = 1024;
      BOOL v136 = randomMACAddressConfigurable;
      _os_log_impl(&dword_226071000, v90, v89, "%@ - autoJoinEnabled=%d autoLoginEnabled=%d isInSaveDataMode=%d isPrivacyProxyEnabled=%d _privateAddressMode=%ld randomMAC='%@' _randomMACAddressConfigurable=%d", buf, 0x3Eu);

      id v16 = v120;
    }
  }
  if (!v16)
  {
    v114 = WFLogForCategory(0);
    os_log_type_t v115 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v114 || !os_log_type_enabled(v114, v115)) {
      goto LABEL_136;
    }
    *(_DWORD *)buf = 136315138;
    v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v116 = "%s: nil ipmonitor";
    goto LABEL_135;
  }
  objc_storeStrong((id *)&v18->_ipMonitor, obj);
  objc_storeStrong((id *)&v18->_interface, v121);
  if (!v60)
  {
    v114 = WFLogForCategory(0);
    os_log_type_t v115 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v114 || !os_log_type_enabled(v114, v115)) {
      goto LABEL_136;
    }
    *(_DWORD *)buf = 136315138;
    v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v116 = "%s: nil interface";
LABEL_135:
    _os_log_impl(&dword_226071000, v114, v115, v116, buf, 0xCu);
LABEL_136:

LABEL_137:
    v18 = 0;
    v60 = v123;
    goto LABEL_122;
  }
  v18->_supportsAirportManagement = 0;
  v18->_wifiModeConfigurable = [v124 isWifiModeConfigurable];
  v18->_wifiMode = [v124 wifiMode];
  v97 = [MEMORY[0x263F55C28] sharedInstance];
  v18->_demoModeEnabled = [v97 isStoreDemoModeEnabled:0];

  if (v18->_demoModeEnabled)
  {
    v98 = WFLogForCategory(0);
    os_log_type_t v99 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v98 && os_log_type_enabled(v98, v99))
    {
      *(_DWORD *)buf = 136315138;
      v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
      _os_log_impl(&dword_226071000, v98, v99, "%s: demo mode enabled", buf, 0xCu);
    }
  }
  id credentialsTappedHandler = v18->_credentialsTappedHandler;
  v18->_id credentialsTappedHandler = &__block_literal_global_3;

  v101 = [WFPortalContext alloc];
  v102 = [v125 captiveProfile];
  uint64_t v103 = [(WFPortalContext *)v101 initWithCaptiveProfile:v102];
  portalContext = v18->_portalContext;
  v18->_portalContext = (WFPortalContext *)v103;

  if (objc_opt_class())
  {
    v105 = [MEMORY[0x263F526E0] shared];
    int v106 = [v105 enabled];
  }
  else
  {
    int v106 = 0;
  }
  v107 = WFLogForCategory(0);
  os_log_type_t v108 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v107 && os_log_type_enabled(v107, v108))
  {
    v109 = "disabled";
    if (v106) {
      v109 = "enabled";
    }
    *(_DWORD *)buf = 136315394;
    v128 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    __int16 v129 = 2080;
    *(void *)v130 = v109;
    _os_log_impl(&dword_226071000, v107, v108, "%s: Lockdown mode is %s", buf, 0x16u);
  }

  v110 = [v15 scanResult];
  char v111 = [v110 isAllowedInLockdownMode];

  v18->_autoJoinConfigurable = v106 && (v111 & 1) == 0;
LABEL_122:
  v112 = v18;

  return v112;
}

void __96__WFDetailsContext_initWithNetwork_profile_ipMonitor_interface_privateMACConfig_wifiModeConfig___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v4 = +[WFMetricsManager sharedManager];
    uint64_t v2 = 13;
  }
  else
  {
    if (a2 != 1) {
      return;
    }
    id v4 = +[WFMetricsManager sharedManager];
    uint64_t v2 = 12;
  }
  v3 = +[WFUserEvent eventWithType:v2];
  [v4 processEvent:v3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (MEMORY[0x263F8BAD0]) {
    ct_green_tea_logger_destroy();
  }
  self->_greenTeaLogger = 0;
  v4.receiver = self;
  v4.super_class = (Class)WFDetailsContext;
  [(WFDetailsContext *)&v4 dealloc];
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WFDetailsContext *)self autoJoinHandler];

  if (v5)
  {
    v6 = [(WFDetailsContext *)self autoJoinHandler];
    v6[2](v6, v3);
  }
  self->_BOOL autoJoinEnabled = v3;
}

- (void)setWifiMode:(int64_t)a3
{
  v5 = [(WFDetailsContext *)self WiFiModeChangedHandler];

  if (v5)
  {
    v6 = [(WFDetailsContext *)self WiFiModeChangedHandler];
    v6[2](v6, a3);
  }
  self->_wifiMode = a3;
}

- (void)setWifiModeConfig:(id)a3
{
  id v4 = a3;
  self->_wifiModeConfigurable = [v4 isWifiModeConfigurable];
  int64_t v5 = [v4 wifiMode];

  self->_wifiMode = v5;
}

- (void)setAutoLoginEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(WFDetailsContext *)self autoLoginHandler];

  if (v5)
  {
    v6 = [(WFDetailsContext *)self autoLoginHandler];
    v6[2](v6, v3);
  }
  self->_BOOL autoLoginEnabled = v3;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(WFDetailsContext *)self lowDataModeHandler];

  if (v5)
  {
    v6 = [(WFDetailsContext *)self lowDataModeHandler];
    v6[2](v6, v3);
  }
  self->_BOOL isInSaveDataMode = v3;
}

- (void)setWiFiOutranked:(BOOL)a3
{
  self->_WiFiOutranked = a3;
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_requestedFields = self->_requestedFields & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (void)setWiFiOutranked:(BOOL)a3 privateCellular:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a4)
  {
    self->_WiFiOutranked = a3;
    int64_t requestedFields = self->_requestedFields;
    if (a3) {
      int64_t v8 = requestedFields | 0x4000;
    }
    else {
      int64_t v8 = requestedFields & 0xFFFFFFFFFFFFBFFFLL;
    }
    self->_int64_t requestedFields = v8;
  }
  else
  {
    [(WFDetailsContext *)self setWiFiOutranked:a3];
  }
  v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9)
  {
    v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      v12 = [(WFDetailsContext *)self network];
      v13 = [v12 ssid];
      v14[0] = 67109634;
      v14[1] = v5;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_226071000, v11, v10, "setting WiFiOutranked=%d privateCellular=%d for %@", (uint8_t *)v14, 0x18u);
    }
  }
}

- (void)setWiFiOutrankedDev:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_WiFiOutrankedDev = a3;
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  self->_int64_t requestedFields = self->_requestedFields & 0xFFFFFFFFFFFFDFFFLL | v4;
  BOOL v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      int64_t v8 = [(WFDetailsContext *)self network];
      v9 = [v8 ssid];
      int v10 = 134218242;
      uint64_t v11 = 0x2000;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_226071000, v7, v6, "setting WiFiOutrankedDev=%ld for %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)setIsPrivacyProxyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WFDetailsContext *)self privacyProxyHandler];

  if (v5)
  {
    os_log_type_t v6 = [(WFDetailsContext *)self privacyProxyHandler];
    v6[2](v6, v3);
  }
  self->_BOOL isPrivacyProxyEnabled = v3;
}

- (void)runNetworkQualityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F8C640]);
  os_log_type_t v6 = [(WFDetailsContext *)self ipMonitor];
  v7 = [v6 interfaceName];
  [v5 setNetworkInterfaceName:v7];

  id v8 = objc_alloc(MEMORY[0x263F8C630]);
  id v9 = objc_alloc_init(MEMORY[0x263F8C640]);
  int v10 = (void *)[v8 initWithConfiguration:v9];
  [(WFDetailsContext *)self setNetworkQualityAssessment:v10];

  uint64_t v11 = [(WFDetailsContext *)self networkQualityAssessment];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__WFDetailsContext_runNetworkQualityWithCompletionHandler___block_invoke;
  v13[3] = &unk_26478F1B0;
  __int16 v15 = v16;
  v13[4] = self;
  id v12 = v4;
  id v14 = v12;
  [v11 runWithCompletionHandler:v13];

  _Block_object_dispose(v16, 8);
}

void __59__WFDetailsContext_runNetworkQualityWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 downlinkResponsiveness];
  id v8 = [v7 value];

  if (v8)
  {
    id v9 = [v5 downlinkResponsiveness];
    int v10 = [v9 value];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 unsignedLongValue];

    uint64_t v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v19 = 136315394;
      v20 = "-[WFDetailsContext runNetworkQualityWithCompletionHandler:]_block_invoke";
      __int16 v21 = 2048;
      id v22 = v13;
      _os_log_impl(&dword_226071000, v11, v12, "NetQuality: %s: Got responsiveness %lu", (uint8_t *)&v19, 0x16u);
    }
  }
  id v14 = WFLogForCategory(0);
  os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
  {
    int v19 = 136315394;
    v20 = "-[WFDetailsContext runNetworkQualityWithCompletionHandler:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_226071000, v14, v15, "NetQuality: %s: Completed! Error: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v6)
  {
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = [MEMORY[0x263EFF910] now];
    __int16 v17 = [*(id *)(a1 + 32) networkQualityHandler];

    if (v17)
    {
      v18 = [*(id *)(a1 + 32) networkQualityHandler];
      ((void (**)(void, void *, double))v18)[2](v18, v16, (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    }
  }
  [*(id *)(a1 + 32) setNetworkQualityAssessment:0];
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                             + 24));
}

- (void)cancelNetworkQualityRun
{
  BOOL v3 = [(WFDetailsContext *)self networkQualityAssessment];

  if (v3)
  {
    id v4 = [(WFDetailsContext *)self networkQualityAssessment];
    [v4 cancel];

    [(WFDetailsContext *)self setNetworkQualityAssessment:0];
  }
}

- (void)forget
{
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "User tapped forget in network details", v6, 2u);
  }

  id v5 = [(WFDetailsContext *)self actionHandler];
  v5[2](v5, 0);
}

- (void)openRecommendationLink
{
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "User tapped recommendation link in network details", v6, 2u);
  }

  id v5 = [(WFDetailsContext *)self actionHandler];
  v5[2](v5, 4);
}

- (void)renewLease
{
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "User tapped remew lease in network details", v6, 2u);
  }

  id v5 = [(WFDetailsContext *)self actionHandler];
  v5[2](v5, 3);
}

- (void)join
{
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "User tapped join network in details", v6, 2u);
  }

  id v5 = [(WFDetailsContext *)self actionHandler];
  v5[2](v5, 2);
}

- (void)manage
{
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_226071000, v3, v4, "User tapped manage network in details", v6, 2u);
  }

  id v5 = [(WFDetailsContext *)self actionHandler];
  v5[2](v5, 1);
}

- (void)disableRandomMAC
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      id v6 = [(WFDetailsContext *)self network];
      v7 = [v6 ssid];
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_226071000, v5, v4, "user disabled using random mac address for '%@'", (uint8_t *)&v10, 0xCu);
    }
  }

  id v8 = [(WFDetailsContext *)self privateMACHandler];

  if (v8)
  {
    id v9 = [(WFDetailsContext *)self privateMACHandler];
    v9[2](v9, 3);
  }
}

- (void)enableRandomMAC:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    id v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      v7 = [(WFDetailsContext *)self network];
      id v8 = [v7 ssid];
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_226071000, v6, v5, "user enabled using random mac address for '%@'", (uint8_t *)&v11, 0xCu);
    }
  }

  id v9 = [(WFDetailsContext *)self privateMACHandler];

  if (v9)
  {
    int v10 = [(WFDetailsContext *)self privateMACHandler];
    v10[2](v10, 2);
  }
}

- (void)updatePrivateAddressMode:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_226071000, v5, v6, "User tried to set private address mode to : %ld", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(WFDetailsContext *)self privateMACHandler];

  if (v7)
  {
    id v8 = [(WFDetailsContext *)self privateMACHandler];
    v8[2](v8, a3);
  }
  [(WFDetailsContext *)self setPrivateAddressMode:a3];
}

- (BOOL)shouldHideCredentials
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFDetailsContext *)self profile];
  uint64_t v4 = [v3 addReason];

  os_log_type_t v5 = [(WFDetailsContext *)self profile];
  uint64_t v6 = [v5 addReason];

  v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    int v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v22 = [(WFDetailsContext *)self network];
      unint64_t v10 = [v22 ssid];
      __int16 v21 = [(WFDetailsContext *)self network];
      BOOL v19 = [v21 securityMode] == 0;
      v20 = [(WFDetailsContext *)self network];
      int v11 = [v20 isSupervised];
      uint64_t v12 = [(WFDetailsContext *)self profile];
      *(_DWORD *)buf = 136316930;
      v24 = "-[WFDetailsContext shouldHideCredentials]";
      __int16 v25 = 2112;
      v26 = v10;
      __int16 v27 = 1024;
      BOOL v28 = v19;
      __int16 v29 = 1024;
      int v30 = v11;
      __int16 v31 = 1024;
      int v32 = [v12 isProfileBased];
      __int16 v33 = 1024;
      BOOL v34 = v6 == 11;
      __int16 v35 = 1024;
      BOOL v36 = [(WFDetailsContext *)self demoModeEnabled];
      __int16 v37 = 1024;
      BOOL v38 = v4 == 10;
      _os_log_impl(&dword_226071000, v9, v8, "%s: Network %@ is open:%d supervised:%d profile-based:%d shared:%d demo-mode-enabled:%d carrier-based:%d", buf, 0x3Au);
    }
  }

  uint64_t v13 = [(WFDetailsContext *)self network];
  if ([v13 securityMode])
  {
    id v14 = [(WFDetailsContext *)self network];
    if ([v14 isSupervised])
    {
      BOOL v15 = 1;
    }
    else
    {
      BOOL v16 = [(WFDetailsContext *)self profile];
      BOOL v15 = 1;
      if (([v16 isProfileBased] & 1) == 0 && v6 != 11)
      {
        BOOL v17 = [(WFDetailsContext *)self demoModeEnabled];
        BOOL v15 = v4 == 10 || v17;
      }
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (WFDiagnosticsContext)diagnosticsContext
{
  diagnosticsContext = self->_diagnosticsContext;
  if (diagnosticsContext)
  {
    self->_diagnosticsContext = 0;
  }
  uint64_t v4 = [WFNetworkProfile alloc];
  os_log_type_t v5 = [(WFDetailsContext *)self profile];
  uint64_t v6 = [(WFNetworkProfile *)v4 initWithCoreWiFiProfile:v5];

  v7 = [WFDiagnosticsContext alloc];
  os_log_type_t v8 = [(WFDetailsContext *)self network];
  int v9 = [(WFDiagnosticsContext *)v7 initWithNetwork:v8 profile:v6 detailsContext:self];
  unint64_t v10 = self->_diagnosticsContext;
  self->_diagnosticsContext = v9;

  int v11 = self->_diagnosticsContext;
  return v11;
}

- (BOOL)needsDismissal
{
  return 1;
}

- (void)cancel
{
  BOOL v3 = [(WFDetailsContext *)self networkQualityAssessment];

  if (v3)
  {
    uint64_t v4 = [(WFDetailsContext *)self networkQualityAssessment];
    [v4 cancel];

    [(WFDetailsContext *)self setNetworkQualityAssessment:0];
  }
  diagnosticsContext = self->_diagnosticsContext;
  self->_diagnosticsContext = 0;
}

- (void)overrideWiFiOutrank
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    os_log_type_t v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      uint64_t v6 = [(WFDetailsContext *)self network];
      v7 = [v6 ssid];
      int v9 = 138412290;
      unint64_t v10 = v7;
      _os_log_impl(&dword_226071000, v5, v4, "User is overriding WiFi outrank for network='%@'", (uint8_t *)&v9, 0xCu);
    }
  }

  [(WFDetailsContext *)self setWiFiOutranked:0];
  os_log_type_t v8 = [(WFDetailsContext *)self actionHandler];
  v8[2](v8, 5);
}

- (unint64_t)networkOrigin
{
  uint64_t v2 = [(WFDetailsContext *)self profile];
  uint64_t v3 = [v2 addReason];

  if (v3 == 10) {
    return 1;
  }
  else {
    return 2 * (v3 == 9);
  }
}

- (NSString)portalURL
{
  uint64_t v2 = [(WFDetailsContext *)self portalContext];
  uint64_t v3 = [v2 portalURLForDisplay];

  return (NSString *)v3;
}

- (void)openPortalURL
{
  uint64_t v2 = [(WFDetailsContext *)self actionHandler];
  v2[2](v2, 6);
}

- (NSString)description
{
  uint64_t v3 = NSString;
  os_log_type_t v4 = (objc_class *)objc_opt_class();
  os_log_type_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDetailsContext *)self network];
  v7 = [v6 ssid];
  os_log_type_t v8 = [v3 stringWithFormat:@"<%@: %p SSID: %@ Current: %d Known: %d Context: %ld>", v5, self, v7, -[WFDetailsContext isCurrent](self, "isCurrent"), -[WFDetailsContext isKnownNetwork](self, "isKnownNetwork"), -[WFDetailsContext entryContext](self, "entryContext")];

  return (NSString *)v8;
}

- (BOOL)autoJoinEnabled
{
  return self->_autoJoinEnabled;
}

- (BOOL)autoLoginEnabled
{
  return self->_autoLoginEnabled;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_isPrivacyProxyEnabled;
}

- (WFNetworkView)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (WFNetworkView *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)diagnosable
{
  return self->_diagnosable;
}

- (void)setDiagnosable:(BOOL)a3
{
  self->_diagnosable = a3;
}

- (BOOL)isRandomMACAddressDisabled
{
  return self->_randomMACAddressDisabled;
}

- (void)setRandomMACAddressDisabled:(BOOL)a3
{
  self->_randomMACAddressDisabled = a3;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_unint64_t privateAddressMode = a3;
}

- (BOOL)isRandomMACAddressConfigurable
{
  return self->_randomMACAddressConfigurable;
}

- (BOOL)isRandomMACFeatureEnabled
{
  return self->_randomMACFeatureEnabled;
}

- (BOOL)isRandomMACSwitchOn
{
  return self->_randomMACSwitchOn;
}

- (void)setRandomMACSwitchOn:(BOOL)a3
{
  self->_randomMACSwitchOn = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (BOOL)isConnectedWithHardwareAddress
{
  return self->_connectedWithHardwareAddress;
}

- (void)setConnectedWithHardwareAddress:(BOOL)a3
{
  self->_connectedWithHardwareAddress = a3;
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (BOOL)isWiFiOutranked
{
  return self->_WiFiOutranked;
}

- (BOOL)isWiFiOutrankedDev
{
  return self->_WiFiOutrankedDev;
}

- (BOOL)isJoinable
{
  return self->_joinable;
}

- (void)setJoinable:(BOOL)a3
{
  self->_joinable = a3;
}

- (BOOL)isWifiModeConfigurable
{
  return self->_wifiModeConfigurable;
}

- (void)setWifiModeConfigurable:(BOOL)a3
{
  self->_wifiModeConfigurable = a3;
}

- (int64_t)wifiMode
{
  return self->_wifiMode;
}

- (id)credentialsTappedHandler
{
  return self->_credentialsTappedHandler;
}

- (void)setCredentialsTappedHandler:(id)a3
{
}

- (unint64_t)autoJoinConfigurable
{
  return self->_autoJoinConfigurable;
}

- (void)setAutoJoinConfigurable:(unint64_t)a3
{
  self->_autoJoinConfigurable = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (id)autoJoinHandler
{
  return self->_autoJoinHandler;
}

- (void)setAutoJoinHandler:(id)a3
{
}

- (id)autoLoginHandler
{
  return self->_autoLoginHandler;
}

- (void)setAutoLoginHandler:(id)a3
{
}

- (id)lowDataModeHandler
{
  return self->_lowDataModeHandler;
}

- (void)setLowDataModeHandler:(id)a3
{
}

- (id)privacyProxyHandler
{
  return self->_privacyProxyHandler;
}

- (void)setPrivacyProxyHandler:(id)a3
{
}

- (id)privateMACHandler
{
  return self->_privateMACHandler;
}

- (void)setPrivateMACHandler:(id)a3
{
}

- (id)WiFiModeChangedHandler
{
  return self->_WiFiModeChangedHandler;
}

- (void)setWiFiModeChangedHandler:(id)a3
{
}

- (id)networkQualityHandler
{
  return self->_networkQualityHandler;
}

- (void)setNetworkQualityHandler:(id)a3
{
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)supportsAirportManagement
{
  return self->_supportsAirportManagement;
}

- (void)setSupportsAirportManagement:(BOOL)a3
{
  self->_supportsAirportManagement = a3;
}

- (CWFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (WFIPMonitor)ipMonitor
{
  return self->_ipMonitor;
}

- (void)setIpMonitor:(id)a3
{
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (NSString)staticPrivateMACFooterText
{
  return self->_staticPrivateMACFooterText;
}

- (void)setStaticPrivateMACFooterText:(id)a3
{
}

- (NSString)turnONPrivateMACFooterText
{
  return self->_turnONPrivateMACFooterText;
}

- (void)setTurnONPrivateMACFooterText:(id)a3
{
}

- (NSString)turnOFFPrivateMACFooterText
{
  return self->_turnOFFPrivateMACFooterText;
}

- (void)setTurnOFFPrivateMACFooterText:(id)a3
{
}

- (BOOL)isPrivacyProxyConfigurable
{
  return self->_privacyProxyConfigurable;
}

- (void)setPrivacyProxyConfigurable:(BOOL)a3
{
  self->_privacyProxyConfigurable = a3;
}

- (int64_t)privacyProxyTierStatus
{
  return self->_privacyProxyTierStatus;
}

- (void)setPrivacyProxyTierStatus:(int64_t)a3
{
  self->_privacyProxyTierStatus = a3;
}

- (BOOL)isCredentialsVisible
{
  return self->_credentialsVisible;
}

- (void)setCredentialsVisible:(BOOL)a3
{
  self->_credentialsVisible = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int64_t)entryContext
{
  return self->_entryContext;
}

- (void)setEntryContext:(int64_t)a3
{
  self->_entryContext = a3;
}

- (WFPortalContext)portalContext
{
  return self->_portalContext;
}

- (void)setPortalContext:(id)a3
{
}

- (DADevice)daDevice
{
  return self->_daDevice;
}

- (void)setDaDevice:(id)a3
{
}

- (unint64_t)scrollToCellType
{
  return self->_scrollToCellType;
}

- (void)setScrollToCellType:(unint64_t)a3
{
  self->_scrollToCellType = a3;
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_int64_t requestedFields = a3;
}

- (BOOL)isKnownNetwork
{
  return self->_knownNetwork;
}

- (void)setKnownNetwork:(BOOL)a3
{
  self->_knownNetwork = a3;
}

- (void)setDiagnosticsContext:(id)a3
{
}

- (NetworkQualityAssessment)networkQualityAssessment
{
  return self->_networkQualityAssessment;
}

- (void)setNetworkQualityAssessment:(id)a3
{
}

- (BOOL)demoModeEnabled
{
  return self->_demoModeEnabled;
}

- (void)setDemoModeEnabled:(BOOL)a3
{
  self->_demoModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkQualityAssessment, 0);
  objc_storeStrong((id *)&self->_diagnosticsContext, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_daDevice, 0);
  objc_storeStrong((id *)&self->_portalContext, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_turnOFFPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->_turnONPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->_staticPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_ipMonitor, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong(&self->_networkQualityHandler, 0);
  objc_storeStrong(&self->_WiFiModeChangedHandler, 0);
  objc_storeStrong(&self->_privateMACHandler, 0);
  objc_storeStrong(&self->_privacyProxyHandler, 0);
  objc_storeStrong(&self->_lowDataModeHandler, 0);
  objc_storeStrong(&self->_autoLoginHandler, 0);
  objc_storeStrong(&self->_autoJoinHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_credentialsTappedHandler, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end