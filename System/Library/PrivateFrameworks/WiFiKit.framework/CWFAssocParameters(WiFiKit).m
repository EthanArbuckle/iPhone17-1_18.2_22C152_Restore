@interface CWFAssocParameters(WiFiKit)
+ (id)associationParametersFromScanRecord:()WiFiKit profile:;
@end

@implementation CWFAssocParameters(WiFiKit)

+ (id)associationParametersFromScanRecord:()WiFiKit profile:
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F386C8]);
  v8 = [v5 attributes];
  v9 = (void *)[v8 mutableCopy];
  v10 = (const void *)WiFiNetworkCreate();

  if ([v5 carPlayType] == 1)
  {
    v11 = WFLogForCategory(5uLL);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        v14 = [v5 ssid];
        *(_DWORD *)buf = 138412290;
        v58 = v14;
        _os_log_impl(&dword_226071000, v13, v12, "adding kWiFiJoiningFromUI == 1 for CarPlayOnly network %@", buf, 0xCu);
      }
    }

    WiFiNetworkSetProperty();
  }
  if ([v6 isInstantHotspotJoin])
  {
    v15 = WFLogForCategory(5uLL);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15)
    {
      v17 = v15;
      if (os_log_type_enabled(v17, v16))
      {
        v18 = [v5 ssid];
        *(_DWORD *)buf = 138412290;
        v58 = v18;
        _os_log_impl(&dword_226071000, v17, v16, "adding kWiFiInstantHotspotJoining for instant hotspot join to %@", buf, 0xCu);
      }
    }

    WiFiNetworkSetProperty();
  }
  if (v6)
  {
    v19 = [v6 scanAttributes];
    v20 = (void *)[v19 mutableCopy];

    [v20 removeObjectForKey:@"enabled"];
    [v20 removeObjectForKey:*MEMORY[0x263F55E98]];
    unint64_t v21 = 0x263F08000uLL;
    v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isHidden"));
    [v20 setObject:v22 forKey:@"HIDDEN_NETWORK"];

    WiFiNetworkCreate();
    if ([v5 isEnterprise])
    {
      WiFiNetworkMergeForAssociation();
      v23 = [v6 enterpriseProfile];
      if (v23)
      {
        WiFiNetworkSetProperty();
      }
      else
      {
        v24 = WFLogForCategory(5uLL);
        os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v24)
        {
          v26 = v24;
          if (os_log_type_enabled(v26, v25))
          {
            v55 = [v5 ssid];
            *(_DWORD *)buf = 138412290;
            v58 = v55;
            _os_log_impl(&dword_226071000, v26, v25, "enterprise profile is nil for %@", buf, 0xCu);
          }
          unint64_t v21 = 0x263F08000;
        }
      }
      uint64_t v27 = [v6 policyUUID];
      if (v27)
      {
        v28 = (void *)v27;
        uint64_t Property = WiFiNetworkGetProperty();

        if (!Property)
        {
          v30 = WFLogForCategory(5uLL);
          uint64_t v31 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v30)
          {
            v32 = v30;
            if (os_log_type_enabled(v32, (os_log_type_t)v31))
            {
              v56 = [v6 policyUUID];
              v54 = [v5 ssid];
              *(_DWORD *)buf = 138412546;
              v58 = v56;
              __int16 v59 = 2112;
              v60 = v54;
              _os_log_impl(&dword_226071000, v32, (os_log_type_t)v31, "setting policyUUID %@ for %@", buf, 0x16u);
            }
            unint64_t v21 = 0x263F08000uLL;
          }

          v33 = [v6 policyUUID];
          WiFiNetworkSetProperty();
        }
      }
    }
    v34 = objc_msgSend(v6, "originatorBundleIdentifier", v54);

    if (v34)
    {
      v35 = [v6 originatorBundleIdentifier];
      WiFiNetworkSetProperty();
    }
    v36 = [v6 hotspotDeviceIdentifier];

    if (v36)
    {
      v37 = [v6 hotspotDeviceIdentifier];
      WiFiNetworkSetProperty();
    }
    if ([v6 isInSaveDataMode]) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = 2;
    }
    [*(id *)(v21 + 2584) numberWithInt:v38];
    WiFiNetworkSetProperty();
    CoreWiFiNetworkProfile = (void *)WiFiNetworkCreateCoreWiFiNetworkProfile();
    if ([v6 wasAddedFromWiFiPasswordSharing])
    {
      v40 = WFLogForCategory(5uLL);
      os_log_type_t v41 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v40)
      {
        v42 = v40;
        if (os_log_type_enabled(v42, v41))
        {
          v43 = [v5 ssid];
          *(_DWORD *)buf = 138412290;
          v58 = v43;
          _os_log_impl(&dword_226071000, v42, v41, "'%@' was added from WiFi password sharing, setting add reason.", buf, 0xCu);
        }
      }

      [CoreWiFiNetworkProfile setAddReason:11];
    }
    [v7 setKnownNetworkProfile:CoreWiFiNetworkProfile];
    v44 = WFLogForCategory(5uLL);
    os_log_type_t v45 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v44 && os_log_type_enabled(v44, v45))
    {
      *(_DWORD *)buf = 138412290;
      v58 = CoreWiFiNetworkProfile;
      _os_log_impl(&dword_226071000, v44, v45, "known network profile %@", buf, 0xCu);
    }
  }
  v46 = [v6 password];

  if (v46)
  {
    v47 = WFLogForCategory(5uLL);
    os_log_type_t v48 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v47)
    {
      v49 = v47;
      if (os_log_type_enabled(v49, v48))
      {
        v50 = [v5 ssid];
        *(_DWORD *)buf = 138412290;
        v58 = v50;
        _os_log_impl(&dword_226071000, v49, v48, "password provided to assoication parameters for %@", buf, 0xCu);
      }
    }

    v51 = [v6 password];
    [v7 setPassword:v51];
  }
  CoreWiFiScanResult = (void *)WiFiNetworkCreateCoreWiFiScanResult();
  [v7 setScanResult:CoreWiFiScanResult];
  if (v10) {
    CFRelease(v10);
  }
  [v7 setRememberUponSuccessfulAssociation:1];

  return v7;
}

@end