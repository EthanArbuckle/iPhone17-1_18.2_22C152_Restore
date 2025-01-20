@interface WFClient
+ (WFClient)sharedInstance;
- (BOOL)extraLoggingEnabled;
- (BOOL)hasShownSBPickerDontAsk;
- (BOOL)isCellularOutrankingWiFi;
- (BOOL)isDiagnosticsEnabled;
- (BOOL)isDiagnosticsModeEnabled;
- (BOOL)isInfraAssociationAllowed;
- (BOOL)isKnownNetworkUIEnabled;
- (BOOL)isManagedAppleID;
- (BOOL)isMfpCapable;
- (BOOL)isNANUIEnabled;
- (BOOL)isNetworkRestrictionActive;
- (BOOL)isPowerModificationDisabled;
- (BOOL)isWAPIEnabled;
- (BOOL)isWPA3EnterpriseEnabled;
- (BOOL)isWPA3PersonalEnabled;
- (BOOL)isWiFiHealthUIDisabled;
- (BOOL)lockdownModeEnabled;
- (BOOL)powered;
- (BOOL)showAllHS20Networks;
- (BOOL)userAutoJoinState;
- (CWFInterface)cInterface;
- (NSNumber)rssiThresholdNumber;
- (NSRunLoop)callbackRunLoop;
- (NSString)hardwareMACAddress;
- (NSString)whitelistingUUID;
- (OS_dispatch_queue)serialClientQueue;
- (OS_dispatch_queue)stateMonitorQueue;
- (WFClient)init;
- (WFClient)initWithCallbackRunLoop:(id)a3;
- (WFInterface)interface;
- (__WiFiManagerClient)manager;
- (id)newRandomMACAddressForSSID:(id)a3;
- (int)cellularOutrankWiFiNotificationToken;
- (int64_t)_askToJoinModeFromCoreWiFiAskToJoinMode:(int64_t)a3;
- (int64_t)_coreWiFiAskToJoinModeFromAskToJoinMode:(int64_t)a3;
- (int64_t)_coreWiFiHotspotJoinOptionFromAutoHotspotMode:(int64_t)a3;
- (int64_t)_hotspotJoinOptionFromCoreWiFiAutoHotspotMode:(int64_t)a3;
- (int64_t)askToJoinMode;
- (int64_t)autoInstantHotspotJoinOption;
- (unint64_t)airplaneModeBehavior;
- (unint64_t)cellularOutrankState;
- (unint64_t)cellularOutrankWiFiSymtpomsState;
- (void)_askToJoinNotification:(unsigned int)a3;
- (void)_joinRecommendationWithID:(unsigned int)a3 network:(__WiFiNetwork *)a4;
- (void)_logWiFiManagerPropertyChange:(id)a3 value:(BOOL)a4;
- (void)_managedConfigurationDidChange:(id)a3;
- (void)_notifyWiFiPropertyChanged:(id)a3 value:(id)a4;
- (void)_registerForCellularRankingStateNotification;
- (void)_scheduleCallbacksWithManager:(__WiFiManagerClient *)a3 runLoop:(id)a4;
- (void)_setupDefaultInterfaceWithManager:(__WiFiManagerClient *)a3 coreWiFiInterface:(id)a4;
- (void)_startMonitoringCoreWiFiEventsWithInterface:(id)a3;
- (void)_trustNotificationWithID:(unsigned int)a3 network:(__WiFiNetwork *)a4 data:(id)a5;
- (void)_unscheduleCallbacksWithManager:(__WiFiManagerClient *)a3;
- (void)_updateAirplaneModeStickiness;
- (void)_updateCellularRankingState;
- (void)_updateManagedAppleIDState;
- (void)_updateNetworkRestrictionActive;
- (void)_updateOSSpecificAttributes:(id)a3;
- (void)_updatePowerModificationDisableState;
- (void)_updatePowerState;
- (void)_updateWPA3Properties:(__WiFiManagerClient *)a3;
- (void)_updateWithDeviceAttachment:(__WiFiDeviceClient *)a3;
- (void)_userAutoJoinStateDidChange:(BOOL)a3 info:(id)a4;
- (void)asyncMISDiscoveryState:(id)a3;
- (void)asyncMISState:(id)a3;
- (void)asyncPowered:(id)a3;
- (void)asyncUserAutoJoinState:(id)a3;
- (void)dealloc;
- (void)dispatchAskToJoinAction:(unint64_t)a3 notificationId:(unsigned int)a4 network:(id)a5;
- (void)dispatchCertificateTrustAction:(int64_t)a3 profile:(id)a4;
- (void)dispatchJoinRecommendationAction:(int64_t)a3 profile:(id)a4;
- (void)reloadConfiguration;
- (void)setAirplaneModeBehavior:(unint64_t)a3;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAutoInstantHotspotJoinOption:(int64_t)a3;
- (void)setAutoJoinEnabled:(BOOL)a3;
- (void)setCInterface:(id)a3;
- (void)setCallbackRunLoop:(id)a3;
- (void)setCellularOutrankState:(unint64_t)a3;
- (void)setCellularOutrankWiFiNotificationToken:(int)a3;
- (void)setCellularOutrankWiFiSymtpomsState:(unint64_t)a3;
- (void)setClientTypeAsForeground;
- (void)setDiagnosticsEnabled:(BOOL)a3;
- (void)setDiagnosticsModeEnabled:(BOOL)a3;
- (void)setEnableRandomMACForNetwork:(id)a3 enable:(BOOL)a4 randomMAC:(id)a5;
- (void)setExtraLoggingEnabled:(BOOL)a3;
- (void)setHasShownSBPickerDontAsk:(BOOL)a3;
- (void)setInterface:(id)a3;
- (void)setLockdownModeEnabled:(BOOL)a3;
- (void)setMISDiscoveryState:(BOOL)a3 immediateDisable:(BOOL)a4;
- (void)setMISState:(BOOL)a3;
- (void)setManagedAppleID:(BOOL)a3;
- (void)setManager:(__WiFiManagerClient *)a3;
- (void)setMfpCapable:(BOOL)a3;
- (void)setNanUIEnabled:(BOOL)a3;
- (void)setNetworkRestrictionActive:(BOOL)a3;
- (void)setPowerModificationDisableState:(BOOL)a3;
- (void)setPowered:(BOOL)a3;
- (void)setPoweredToggle:(BOOL)a3 handler:(id)a4;
- (void)setRandomAddressModeForNetwork:(id)a3 mode:(unint64_t)a4 randomMAC:(id)a5;
- (void)setRssiThresholdNumber:(id)a3;
- (void)setSerialClientQueue:(id)a3;
- (void)setShowAllHS20Networks:(BOOL)a3;
- (void)setStateMonitorQueue:(id)a3;
- (void)setUserAutoJoinState:(BOOL)a3;
- (void)setUserAutoJoinState:(BOOL)a3 completion:(id)a4;
- (void)setWAPIEnabled:(BOOL)a3;
- (void)setWPA3EnterpriseEnabled:(BOOL)a3;
- (void)setWPA3PersonalEnabled:(BOOL)a3;
- (void)setWiFiHealthUIDisabled:(BOOL)a3;
@end

@implementation WFClient

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2(uint64_t a1, void *a2)
{
  v61[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [v3 type];
  switch(v5)
  {
    case 1:
      v11 = WFLogForCategory(0);
      os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_226071000, v11, v12, "CWFEventTypePowerChanged - event %@", buf, 0xCu);
      }

      [WeakRetained _updatePowerState];
      goto LABEL_25;
    case 2:
      v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_226071000, v13, v14, "CWFEventTypeSSIDChanged - event %@", buf, 0xCu);
      }

LABEL_25:
      v15 = [WeakRetained interface];
      [v15 asyncCurrentNetwork:0];
      goto LABEL_53;
    case 3:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      goto LABEL_54;
    case 4:
      v16 = WFLogForCategory(0);
      os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_226071000, v16, v17, "CWFEventTypeCountryCodeChanged - event %@", buf, 0xCu);
      }

      v15 = [WeakRetained interface];
      [v15 updateDeviceScanChannelsPerCurLocale];
      goto LABEL_53;
    case 6:
      v18 = WFLogForCategory(0);
      os_log_type_t v19 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v18 && os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_226071000, v18, v19, "CWFEventTypeLinkChanged - event %@", buf, 0xCu);
      }

      v20 = [WeakRetained interface];
      [v20 asyncCurrentNetwork:0];

      dispatch_time_t v21 = dispatch_time(0, 1000000000);
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_75;
      v55[3] = &unk_26478E528;
      v55[4] = WeakRetained;
      dispatch_after(v21, MEMORY[0x263EF83A0], v55);
      goto LABEL_54;
    case 7:
      v22 = [v3 info];
      v23 = [v22 objectForKey:@"LinkQualityMetric"];

      v24 = [WeakRetained interface];
      v25 = [v24 currentNetwork];

      if (!v25)
      {
        v28 = 0;
LABEL_61:
        v30 = 0;
        goto LABEL_63;
      }
      uint64_t v26 = [v23 RSSI];
      float v27 = WFScaleRSSI(v26);
      v28 = 0;
      if (v26)
      {
        float v29 = v27;
        v30 = 0;
        if (v27 == 0.0) {
          goto LABEL_63;
        }
        v31 = [WFLinkQuality alloc];
        v32 = [WeakRetained interface];
        v33 = [v32 currentNetwork];
        v34 = [v33 ssid];
        *(float *)&double v35 = v29;
        v28 = [(WFLinkQuality *)v31 initWithSSID:v34 rssi:v26 scaledRSSI:v35];

        if (v28)
        {
          v60 = @"WFInterfaceLinkQualityKey";
          v61[0] = v28;
          v30 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
          goto LABEL_63;
        }
        goto LABEL_61;
      }
      v30 = 0;
LABEL_63:
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_81;
      v53[3] = &unk_26478E528;
      id v54 = v30;
      id v48 = v30;
      dispatch_async(MEMORY[0x263EF83A0], v53);

LABEL_54:
      return;
    case 13:
      v36 = [v3 info];
      v15 = [v36 objectForKey:@"JoinStatus"];

      v37 = WFLogForCategory(0);
      os_log_type_t v38 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v37 && os_log_type_enabled(v37, v38))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_226071000, v37, v38, "CWFEventTypeJoinStatusChanged - event='%@'", buf, 0xCu);
      }

      if (v15)
      {
        v39 = [v15 error];
        uint64_t v40 = [v39 code];

        if (v40)
        {
          v41 = WFLogForCategory(0);
          os_log_type_t v42 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v41)
          {
            v43 = v41;
            if (os_log_type_enabled(v43, v42))
            {
              v44 = [v15 error];
              *(_DWORD *)buf = 136315394;
              v57 = "-[WFClient _startMonitoringCoreWiFiEventsWithInterface:]_block_invoke";
              __int16 v58 = 2112;
              v59 = v44;
              _os_log_impl(&dword_226071000, v43, v42, "%s: updating asyncCurrentNetwork on join error %@", buf, 0x16u);
            }
          }

          v45 = [WeakRetained interface];
          [v45 asyncCurrentNetwork:0];
        }
      }
LABEL_53:

      goto LABEL_54;
    case 19:
    case 20:
      v6 = WFLogForCategory(0);
      os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v3;
        _os_log_impl(&dword_226071000, v6, v7, "CWFEventTypeIPChanged - event='%@'", buf, 0xCu);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_85;
      block[3] = &unk_26478E528;
      id v52 = v3;
      dispatch_async(MEMORY[0x263EF83A0], block);
      v8 = v52;
      goto LABEL_14;
    default:
      if (v5 == 27)
      {
        v46 = WFLogForCategory(0);
        os_log_type_t v47 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v46 && os_log_type_enabled(v46, v47))
        {
          *(_DWORD *)buf = 138412290;
          v57 = (const char *)v3;
          _os_log_impl(&dword_226071000, v46, v47, "CWFEventTypeUserSettingsChanged - event='%@'", buf, 0xCu);
        }

        [WeakRetained reloadConfiguration];
      }
      else if (v5 == 30)
      {
        v9 = WFLogForCategory(0);
        os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v9 && os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138412290;
          v57 = (const char *)v3;
          _os_log_impl(&dword_226071000, v9, v10, "CWFEventTypeKnownNetworkProfileChanged - event %@", buf, 0xCu);
        }

        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_86;
        v49[3] = &unk_26478E7D8;
        v49[4] = WeakRetained;
        id v50 = v3;
        dispatch_async(MEMORY[0x263EF83A0], v49);
        v8 = v50;
LABEL_14:
      }
      goto LABEL_54;
  }
}

- (WFInterface)interface
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  interface = self->_interface;
  if (!interface)
  {
    v4 = WFLogForCategory(0);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      int v13 = 136315138;
      os_log_type_t v14 = "-[WFClient interface]";
      _os_log_impl(&dword_226071000, v4, v5, "%s: recreating WFInterface in WFClient because it's nil when trying to access", (uint8_t *)&v13, 0xCu);
    }

    if (self->_manager)
    {
      v6 = self->_cInterface;
      if (!v6)
      {
        os_log_type_t v7 = WFLogForCategory(0);
        os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
        {
          int v13 = 136315138;
          os_log_type_t v14 = "-[WFClient interface]";
          _os_log_impl(&dword_226071000, v7, v8, "%s: recreating cInterface to recreate WFInterface", (uint8_t *)&v13, 0xCu);
        }

        v6 = (CWFInterface *)[objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:1];
        v9 = [(CWFInterface *)v6 requestParameters];
        [v9 setTimeout:120000000000];

        objc_storeStrong((id *)&self->_cInterface, v6);
        [(CWFInterface *)v6 resume];
        [(WFClient *)self _startMonitoringCoreWiFiEventsWithInterface:v6];
      }
      [(WFClient *)self _setupDefaultInterfaceWithManager:self->_manager coreWiFiInterface:v6];
    }
    else
    {
      WFLogForCategory(0);
      v6 = (CWFInterface *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled((os_log_t)v6, v12))
      {
        int v13 = 136315138;
        os_log_type_t v14 = "-[WFClient interface]";
        _os_log_impl(&dword_226071000, (os_log_t)v6, v12, "%s: cannot recreate WFInterface in WFClient because WiFiManagerClientRef is nil", (uint8_t *)&v13, 0xCu);
      }
    }

    interface = self->_interface;
  }
  os_log_type_t v10 = interface;
  return v10;
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 integerValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  LOBYTE(v4) = [v4 startMonitoringEventType:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v4 & 1) == 0)
  {
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7)
    {
      v9 = v7;
      if (os_log_type_enabled(v9, v8))
      {
        uint64_t v10 = [v3 integerValue];
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 136315650;
        os_log_type_t v14 = "-[WFClient _startMonitoringCoreWiFiEventsWithInterface:]_block_invoke";
        __int16 v15 = 2048;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        _os_log_impl(&dword_226071000, v9, v8, "%s: unable to register for event %lu - error %@", buf, 0x20u);
      }
    }
  }
}

uint64_t __25__WFClient_asyncPowered___block_invoke_121(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) powered];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (BOOL)powered
{
  return self->_powered;
}

void __45__WFClient__notifyWiFiPropertyChanged_value___block_invoke(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  uint64_t v6 = a1[5];
  v7[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WFClientUserInterfacePropertyChangedNotification" object:v3 userInfo:v5];
}

void __25__WFClient_asyncPowered___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[WFClient asyncPowered:]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePowerState];
  if (*(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __25__WFClient_asyncPowered___block_invoke_121;
    v6[3] = &unk_26478EFE0;
    id v5 = *(id *)(a1 + 32);
    v6[4] = WeakRetained;
    id v7 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

- (void)_updatePowerState
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_manager)
  {
    os_log_type_t v3 = [(WFClient *)self cInterface];
    int v4 = [v3 powerOn];

    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFClient _updatePowerState]";
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_impl(&dword_226071000, v5, v6, "%s: current power %d", buf, 0x12u);
    }

    if (self->_powered != v4)
    {
      self->_powered = v4;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__WFClient__updatePowerState__block_invoke;
      block[3] = &unk_26478E528;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

- (BOOL)isCellularOutrankingWiFi
{
  return [(WFClient *)self cellularOutrankState] != 0;
}

- (unint64_t)cellularOutrankState
{
  return self->_cellularOutrankState;
}

- (CWFInterface)cInterface
{
  return self->_cInterface;
}

- (void)asyncPowered:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(WFClient *)self stateMonitorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__WFClient_asyncPowered___block_invoke;
  block[3] = &unk_26478F490;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)stateMonitorQueue
{
  stateMonitorQueue = self->_stateMonitorQueue;
  if (!stateMonitorQueue)
  {
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("WFWiFiStateMonitorQueue", 0);
    id v5 = self->_stateMonitorQueue;
    self->_stateMonitorQueue = v4;

    stateMonitorQueue = self->_stateMonitorQueue;
  }
  return stateMonitorQueue;
}

- (WFClient)initWithCallbackRunLoop:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:1];
  id v7 = [v6 requestParameters];
  [v7 setTimeout:120000000000];

  v27.receiver = self;
  v27.super_class = (Class)WFClient;
  id v8 = [(WFClient *)&v27 init];
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v9 = WiFiManagerClientCreate();
  if (v9)
  {
    v8->_manager = (__WiFiManagerClient *)v9;
    v8->_cellularOutrankWiFiNotificationToken = -1;
    [(WFClient *)v8 _registerForCellularRankingStateNotification];
    objc_storeStrong((id *)&v8->_callbackRunLoop, a3);
    [(WFClient *)v8 _scheduleCallbacksWithManager:v8->_manager runLoop:v5];
    if (v6)
    {
      [v6 resume];
      [(WFClient *)v8 setCInterface:v6];
      v8->_powered = [v6 powerOn];
      manager = v8->_manager;
      int v11 = [(WFClient *)v8 cInterface];
      [(WFClient *)v8 _setupDefaultInterfaceWithManager:manager coreWiFiInterface:v11];

      uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v8 selector:sel__managedConfigurationDidChange_ name:*MEMORY[0x263F536E0] object:0];

      int v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 136315394;
        float v29 = "-[WFClient initWithCallbackRunLoop:]";
        __int16 v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_226071000, v13, v14, "%s %@", buf, 0x16u);
      }

      dispatch_queue_t v15 = dispatch_queue_create("com.apple.wifikit.wfclient-serial", 0);
      serialClientQueue = v8->_serialClientQueue;
      v8->_serialClientQueue = (OS_dispatch_queue *)v15;

      dispatch_queue_t v17 = dispatch_queue_create("WFWiFiStateMonitorQueue", 0);
      stateMonitorQueue = v8->_stateMonitorQueue;
      v8->_stateMonitorQueue = (OS_dispatch_queue *)v17;

      if (objc_opt_class())
      {
        uint64_t v19 = [MEMORY[0x263F526E0] shared];
        v8->_lockdownModeEnabled = [v19 enabled];
      }
      uint64_t v20 = 2;
      if (v8->_lockdownModeEnabled) {
        uint64_t v20 = -1;
      }
      v8->_askToJoinMode = v20;
      v8->_autoInstantHotspotJoinOption = 1;
      [(WFClient *)v8 reloadConfiguration];
      dispatch_time_t v21 = [(WFClient *)v8 cInterface];
      [(WFClient *)v8 _startMonitoringCoreWiFiEventsWithInterface:v21];
      goto LABEL_13;
    }
    v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v25 = "Fail to create CoreWiFi Interface";
  }
  else
  {
    v23 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v25 = "failed to create WiFiManagerClientRef";
  }
  _os_log_impl(&dword_226071000, v23, v24, v25, buf, 2u);
LABEL_23:

LABEL_24:
  uint64_t v26 = v8->_manager;
  if (v26)
  {
    CFRelease(v26);
    v8->_manager = 0;
  }
  dispatch_time_t v21 = v8;
  id v8 = 0;
LABEL_13:

  return v8;
}

- (void)setCInterface:(id)a3
{
}

- (void)reloadConfiguration
{
  os_log_type_t v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WFClient_reloadConfiguration__block_invoke;
  block[3] = &unk_26478E528;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_startMonitoringCoreWiFiEventsWithInterface:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke;
  v12[3] = &unk_26478E3E8;
  objc_copyWeak(&v13, &location);
  [v4 setInterruptionHandler:v12];
  id v5 = [(WFClient *)self cInterface];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2;
  v10[3] = &unk_26478F3C8;
  objc_copyWeak(&v11, &location);
  [v5 setEventHandler:v10];

  id v6 = [(WFClient *)self stateMonitorQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_88;
  v8[3] = &unk_26478E528;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_setupDefaultInterfaceWithManager:(__WiFiManagerClient *)a3 coreWiFiInterface:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (WFInterface *)WiFiManagerClientCopyDevices();
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:]";
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_226071000, v7, v8, "%s: devices %@", (uint8_t *)&v19, 0x16u);
  }

  if (v6)
  {
    id v9 = [[WFInterface alloc] initWithDevice:[(WFInterface *)v6 objectAtIndex:0] coreWiFiInterface:v5];
    interface = self->_interface;
    self->_interface = v9;

    [(WFInterface *)self->_interface setWifiClient:self];
    id v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      id v13 = self->_interface;
      int v19 = 136315394;
      uint64_t v20 = "-[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:]";
      __int16 v21 = 2112;
      v22 = v13;
      os_log_type_t v14 = "%s: Setting up WFInterface %@ in WFClient";
      dispatch_queue_t v15 = v11;
      os_log_type_t v16 = v12;
      uint32_t v17 = 22;
LABEL_14:
      _os_log_impl(&dword_226071000, v15, v16, v14, (uint8_t *)&v19, v17);
    }
  }
  else
  {
    id v11 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v18))
    {
      int v19 = 136315138;
      uint64_t v20 = "-[WFClient _setupDefaultInterfaceWithManager:coreWiFiInterface:]";
      os_log_type_t v14 = "%s: failed to acquire WiFiDeviceClientRef";
      dispatch_queue_t v15 = v11;
      os_log_type_t v16 = v18;
      uint32_t v17 = 12;
      goto LABEL_14;
    }
  }
}

- (void)_scheduleCallbacksWithManager:(__WiFiManagerClient *)a3 runLoop:(id)a4
{
  [a4 getCFRunLoop];
  WiFiManagerClientScheduleWithRunLoop();
  WiFiManagerClientRegisterNotificationCallback();
  WiFiManagerClientRegisterDeviceAttachmentCallback();
  MEMORY[0x270F4B5E8](a3, _WiFiManagerClientManagedAppleIDCabllack, self);
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_81(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFInterfaceLinkQualityNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

void __31__WFClient_reloadConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    int v28 = 136315138;
    float v29 = "-[WFClient reloadConfiguration]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: reloading WFClient configuration", (uint8_t *)&v28, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) cInterface];
  id v5 = [v4 userSettings];

  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_askToJoinModeFromCoreWiFiAskToJoinMode:", objc_msgSend(v5, "askToJoinMode"));
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 24)) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v6;
  }
  if (v8 != *(void *)(v7 + 48))
  {
    *(void *)(v7 + 48) = v8;
    id v9 = *(void **)(a1 + 32);
    __int16 v10 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v9 _notifyWiFiPropertyChanged:@"kWFClientUserInterfacePropertyATJKey" value:v10];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  uint64_t v11 = objc_msgSend((id)v7, "_hotspotJoinOptionFromCoreWiFiAutoHotspotMode:", objc_msgSend(v5, "autoHotspotMode"));
  uint64_t v12 = *(void *)(a1 + 32);
  if (v11 != *(void *)(v12 + 56))
  {
    *(void *)(v12 + 56) = v11;
    id v13 = *(void **)(a1 + 32);
    os_log_type_t v14 = [NSNumber numberWithInteger:v11];
    [v13 _notifyWiFiPropertyChanged:@"kWFClientUserInterfacePropertyHotspotAJKey" value:v14];
  }
  dispatch_queue_t v15 = [v5 OSSpecificAttributes];

  if (v15)
  {
    os_log_type_t v16 = [v5 OSSpecificAttributes];
    uint32_t v17 = [v16 objectForKeyedSubscript:@"WAPIEnabled"];
    *(unsigned char *)(*(void *)(a1 + 32) + 11) = [v17 BOOLValue];

    os_log_type_t v18 = [v5 OSSpecificAttributes];
    int v19 = [v18 objectForKeyedSubscript:@"DiagnosticsEnabled"];
    *(unsigned char *)(*(void *)(a1 + 32) + 12) = [v19 BOOLValue];

    uint64_t v20 = [v5 OSSpecificAttributes];
    __int16 v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F55F98]];
    *(unsigned char *)(*(void *)(a1 + 32) + 18) = [v21 BOOLValue];

    v22 = [v5 OSSpecificAttributes];
    uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F55E70]];
    *(unsigned char *)(*(void *)(a1 + 32) + 20) = [v23 BOOLValue];

    os_log_type_t v24 = [v5 OSSpecificAttributes];
    v25 = [v24 objectForKeyedSubscript:@"WiFiMobileAssetIsHealthMonitorDisabled"];
    *(unsigned char *)(*(void *)(a1 + 32) + 19) = [v25 BOOLValue];

    *(unsigned char *)(*(void *)(a1 + 32) + 21) = CFPreferencesGetAppBooleanValue(@"ShowWiFiUI", @"com.apple.wifi.ui", 0) != 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 22) = CFPreferencesGetAppBooleanValue(@"ShowWiFiAwareUI", @"com.apple.wifi.ui", 0) != 0;
  }
  else
  {
    uint64_t v26 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
    {
      int v28 = 138412290;
      float v29 = (const char *)v5;
      _os_log_impl(&dword_226071000, v26, v27, "nil OSSpecificAttributes from user settings='%@'", (uint8_t *)&v28, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _updateNetworkRestrictionActive];
  [*(id *)(a1 + 32) _updateAirplaneModeStickiness];
  [*(id *)(a1 + 32) _updateWPA3Properties:*(void *)(*(void *)(a1 + 32) + 80)];
  [*(id *)(a1 + 32) _updatePowerModificationDisableState];
  [*(id *)(a1 + 32) _updateManagedAppleIDState];
  [*(id *)(a1 + 32) _updateCellularRankingState];
}

- (void)_updateWPA3Properties:(__WiFiManagerClient *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(WFClient *)self setWPA3PersonalEnabled:WiFiManagerClientIsWPA3PersonalSupported() != 0];
  [(WFClient *)self setWPA3EnterpriseEnabled:WiFiManagerClientIsWPA3EnterpriseSupported() != 0];
  [(WFClient *)self setMfpCapable:WiFiManagerClientIsMfpCapableDevice() != 0];
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    uint64_t v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      int v7 = 136315906;
      uint64_t v8 = "-[WFClient _updateWPA3Properties:]";
      __int16 v9 = 1024;
      BOOL v10 = [(WFClient *)self isWPA3PersonalEnabled];
      __int16 v11 = 1024;
      BOOL v12 = [(WFClient *)self isWPA3EnterpriseEnabled];
      __int16 v13 = 1024;
      BOOL v14 = [(WFClient *)self isMfpCapable];
      _os_log_impl(&dword_226071000, v6, v5, "%s: WPA3 personal (%d) WPA3 enterprise (%d) MFP Capable (%d)", (uint8_t *)&v7, 0x1Eu);
    }
  }
}

- (void)setWPA3PersonalEnabled:(BOOL)a3
{
  self->_WPA3PersonalEnabled = a3;
}

- (void)setWPA3EnterpriseEnabled:(BOOL)a3
{
  self->_WPA3EnterpriseEnabled = a3;
}

- (void)setMfpCapable:(BOOL)a3
{
  self->_mfpCapable = a3;
}

- (BOOL)isWPA3PersonalEnabled
{
  return self->_WPA3PersonalEnabled;
}

- (BOOL)isWPA3EnterpriseEnabled
{
  return self->_WPA3EnterpriseEnabled;
}

- (BOOL)isMfpCapable
{
  return self->_mfpCapable;
}

- (void)_updatePowerModificationDisableState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(WFClient *)self manager];
  int IsPowerModificationDisabled = WiFiManagerClientIsPowerModificationDisabled();
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = "Enabled";
    if (IsPowerModificationDisabled) {
      uint64_t v6 = "Disabled";
    }
    int v7 = 136315394;
    uint64_t v8 = "-[WFClient _updatePowerModificationDisableState]";
    __int16 v9 = 2080;
    BOOL v10 = v6;
    _os_log_impl(&dword_226071000, v4, v5, "%s: PowerModification is %s", (uint8_t *)&v7, 0x16u);
  }

  [(WFClient *)self setPowerModificationDisableState:IsPowerModificationDisabled != 0];
}

- (void)setPowerModificationDisableState:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_powerModificationDisabled == a3)
  {
    os_log_type_t v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "-[WFClient setPowerModificationDisableState:]";
      _os_log_impl(&dword_226071000, v3, v4, "%s: No change in state", buf, 0xCu);
    }
  }
  else
  {
    self->_powerModificationDisabled = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__WFClient_setPowerModificationDisableState___block_invoke;
    block[3] = &unk_26478E528;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_updateNetworkRestrictionActive
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(WFClient *)self manager];
  int IsRestrictionPolicyActive = WiFiManagerClientIsRestrictionPolicyActive();
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    int v7 = "-[WFClient _updateNetworkRestrictionActive]";
    __int16 v8 = 1024;
    BOOL v9 = IsRestrictionPolicyActive != 0;
    _os_log_impl(&dword_226071000, v4, v5, "%s: restrictionState %d", (uint8_t *)&v6, 0x12u);
  }

  [(WFClient *)self setNetworkRestrictionActive:IsRestrictionPolicyActive != 0];
}

- (void)setNetworkRestrictionActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)os_log_type_t v18 = "-[WFClient setNetworkRestrictionActive:]";
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)int v19 = v3;
    _os_log_impl(&dword_226071000, v5, v6, "%s: restriction %d", buf, 0x12u);
  }

  if (self->_networkRestrictionActive != v3)
  {
    if (v3)
    {
      int v7 = [(WFClient *)self cInterface];
      __int16 v8 = [v7 userSettings];

      BOOL v9 = [v8 OSSpecificAttributes];
      uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F55FA0]];
      whitelistingUUID = self->_whitelistingUUID;
      self->_whitelistingUUID = v10;
    }
    else
    {
      __int16 v8 = self->_whitelistingUUID;
      self->_whitelistingUUID = 0;
    }

    if (self->_networkRestrictionActive != v3)
    {
      BOOL v12 = WFLogForCategory(0);
      os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
      {
        BOOL networkRestrictionActive = self->_networkRestrictionActive;
        uint64_t v15 = self->_whitelistingUUID;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)os_log_type_t v18 = networkRestrictionActive;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v3;
        *(_WORD *)int v19 = 2112;
        *(void *)&v19[2] = v15;
        _os_log_impl(&dword_226071000, v12, v13, "Restriction policy changed (was %d is %d) policyUUID='%@'", buf, 0x18u);
      }

      self->_BOOL networkRestrictionActive = v3;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__WFClient_setNetworkRestrictionActive___block_invoke;
      block[3] = &unk_26478E528;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

- (void)_updateManagedAppleIDState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(WFClient *)self manager];
  int IsManagedAppleID = WiFiManagerClientIsManagedAppleID();
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = "Non-Managed";
    if (IsManagedAppleID) {
      os_log_type_t v6 = "Managed";
    }
    int v7 = 136315394;
    __int16 v8 = "-[WFClient _updateManagedAppleIDState]";
    __int16 v9 = 2080;
    uint64_t v10 = v6;
    _os_log_impl(&dword_226071000, v4, v5, "%s: %s Account", (uint8_t *)&v7, 0x16u);
  }

  [(WFClient *)self setManagedAppleID:IsManagedAppleID != 0];
}

- (void)setManagedAppleID:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_managedAppleID == a3)
  {
    BOOL v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "-[WFClient setManagedAppleID:]";
      _os_log_impl(&dword_226071000, v3, v4, "%s: No change in state", buf, 0xCu);
    }
  }
  else
  {
    self->_managedAppleID = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__WFClient_setManagedAppleID___block_invoke;
    block[3] = &unk_26478E528;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_updateCellularRankingState
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(WFClient *)self cellularOutrankWiFiSymtpomsState];
  p_unint64_t cellularOutrankWiFiSymtpomsState = &self->_cellularOutrankWiFiSymtpomsState;
  if (notify_get_state([(WFClient *)self cellularOutrankWiFiNotificationToken], &self->_cellularOutrankWiFiSymtpomsState))
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v5 || !os_log_type_enabled(v5, v6)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFClient _updateCellularRankingState]";
    int v7 = "%s: notify_get_state returned error";
    uint64_t v8 = v5;
    os_log_type_t v9 = v6;
    uint32_t v10 = 12;
LABEL_11:
    _os_log_impl(&dword_226071000, v8, v9, v7, buf, v10);
LABEL_12:

    return;
  }
  unint64_t v11 = *p_cellularOutrankWiFiSymtpomsState;
  if (v3 == *p_cellularOutrankWiFiSymtpomsState)
  {
    os_log_type_t v5 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v5 || !os_log_type_enabled(v5, v12)) {
      goto LABEL_12;
    }
    unint64_t v13 = *p_cellularOutrankWiFiSymtpomsState;
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFClient _updateCellularRankingState]";
    __int16 v26 = 2048;
    os_log_type_t v27 = (const char *)v13;
    int v7 = "%s: no change to cellular outranking state: %llu";
    uint64_t v8 = v5;
    os_log_type_t v9 = v12;
    uint32_t v10 = 22;
    goto LABEL_11;
  }
  if (v11)
  {
    if ((v11 & 0x40000000) != 0)
    {
      uint64_t v14 = 5;
    }
    else
    {
      uint64_t v15 = 3;
      uint64_t v16 = 4;
      if ((v11 & 0x800) == 0) {
        uint64_t v16 = 2;
      }
      if ((v11 & 0x8000) == 0) {
        uint64_t v15 = v16;
      }
      if ((v11 & 0x2000000) != 0) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v15;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(WFClient *)self setCellularOutrankState:v14];
  uint32_t v17 = WFLogForCategory(0);
  os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v17)
  {
    int v19 = v17;
    if (os_log_type_enabled(v19, v18))
    {
      if ([(WFClient *)self isCellularOutrankingWiFi]) {
        uint64_t v20 = "TRUE";
      }
      else {
        uint64_t v20 = "FALSE";
      }
      unint64_t v21 = [(WFClient *)self cellularOutrankState];
      unint64_t cellularOutrankWiFiSymtpomsState = self->_cellularOutrankWiFiSymtpomsState;
      *(_DWORD *)buf = 136315906;
      v25 = "-[WFClient _updateCellularRankingState]";
      __int16 v26 = 2080;
      os_log_type_t v27 = v20;
      __int16 v28 = 2048;
      unint64_t v29 = v21;
      __int16 v30 = 2048;
      unint64_t v31 = cellularOutrankWiFiSymtpomsState;
      _os_log_impl(&dword_226071000, v19, v18, "%s: symptoms cellular outrank recommendation is set to %s (%lu - %llu)", buf, 0x2Au);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WFClient__updateCellularRankingState__block_invoke;
  block[3] = &unk_26478E528;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (unint64_t)cellularOutrankWiFiSymtpomsState
{
  return self->_cellularOutrankWiFiSymtpomsState;
}

- (void)_updateAirplaneModeStickiness
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(WFClient *)self manager];
  unint64_t v3 = (const void *)WiFiManagerClientCopyProperty();
  os_log_type_t v4 = (const void *)*MEMORY[0x263EFFB40];
  if (v3) {
    BOOL v5 = v3 == v4;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = v5;
  if (v3) {
    CFRelease(v3);
  }
  if (v6)
  {
    [(WFClient *)self manager];
    int v7 = (const void *)WiFiManagerClientCopyProperty();
    if (v7 != v4 || v7 == 0) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = 2;
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (v9 != self->_airplaneModeBehavior)
  {
    uint32_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = off_26478F578[v9];
      int v13 = 136315394;
      uint64_t v14 = "-[WFClient _updateAirplaneModeStickiness]";
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_226071000, v10, v11, "%s: updating to %@", (uint8_t *)&v13, 0x16u);
    }

    self->_airplaneModeBehavior = v9;
  }
}

- (__WiFiManagerClient)manager
{
  return self->_manager;
}

- (void)_registerForCellularRankingStateNotification
{
  if ([(WFClient *)self cellularOutrankWiFiNotificationToken] == -1)
  {
    objc_initWeak(&location, self);
    p_cellularOutrankWiFiNotificationToken = &self->_cellularOutrankWiFiNotificationToken;
    os_log_type_t v4 = dispatch_get_global_queue(21, 0);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__WFClient__registerForCellularRankingStateNotification__block_invoke;
    v5[3] = &unk_26478F4B8;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("com.apple.symptoms.celloutrankrecommendation", p_cellularOutrankWiFiNotificationToken, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (int)cellularOutrankWiFiNotificationToken
{
  return self->_cellularOutrankWiFiNotificationToken;
}

- (void)_notifyWiFiPropertyChanged:(id)a3 value:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[WFClient _notifyWiFiPropertyChanged:value:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_226071000, v8, v9, "%s: key='%@' value='%@'", buf, 0x20u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__WFClient__notifyWiFiPropertyChanged_value___block_invoke;
  block[3] = &unk_26478E7B0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (int64_t)_hotspotJoinOptionFromCoreWiFiAutoHotspotMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 1;
  }
  else {
    return qword_226113838[a3];
  }
}

- (int64_t)_askToJoinModeFromCoreWiFiAskToJoinMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_2_88(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFClient _startMonitoringCoreWiFiEventsWithInterface:]_block_invoke_2";
    _os_log_impl(&dword_226071000, v2, v3, "%s: Entering WFClient stateMonitorQueue", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  os_log_type_t v9 = __Block_byref_object_copy__4;
  id v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_110;
  v4[3] = &unk_26478F3F0;
  id v5 = *(id *)(a1 + 32);
  p_long long buf = &buf;
  [&unk_26D9E21E8 enumerateObjectsUsingBlock:v4];

  _Block_object_dispose(&buf, 8);
}

+ (WFClient)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)_sharedWFClient;
  return (WFClient *)v2;
}

void __26__WFClient_sharedInstance__block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(WFClient);
  uint64_t v1 = (void *)_sharedWFClient;
  _sharedWFClient = (uint64_t)v0;

  id v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    int v4 = 136315138;
    id v5 = "+[WFClient sharedInstance]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: WFClient sharedInstance is deprecated and should be removed.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  os_log_type_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_cellularOutrankWiFiNotificationToken);
  self->_cellularOutrankWiFiNotificationToken = -1;
  if (self->_manager)
  {
    -[WFClient _unscheduleCallbacksWithManager:](self, "_unscheduleCallbacksWithManager:");
    manager = self->_manager;
    if (manager)
    {
      CFRelease(manager);
      self->_manager = 0;
    }
  }
  interface = self->_interface;
  if (interface)
  {
    self->_interface = 0;
  }
  cInterface = self->_cInterface;
  if (cInterface)
  {
    [(CWFInterface *)cInterface invalidate];
    id v7 = self->_cInterface;
    self->_cInterface = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)WFClient;
  [(WFClient *)&v8 dealloc];
}

- (WFClient)init
{
  os_log_type_t v3 = [MEMORY[0x263EFF9F0] mainRunLoop];
  int v4 = [(WFClient *)self initWithCallbackRunLoop:v3];

  return v4;
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_226071000, v2, v3, "Core WiFi Service restarted.", v4, 2u);
  }

  [WeakRetained reloadConfiguration];
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_74);
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_72()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"WFClientServerRestartedNotification" object:0];
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_75(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) interface];
  [v1 asyncCurrentNetwork:0];
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_85(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v2 = [*(id *)(a1 + 32) info];
  [v3 postNotificationName:@"WFInterfaceIPAddressChangedNotification" object:0 userInfo:v2];
}

void __56__WFClient__startMonitoringCoreWiFiEventsWithInterface___block_invoke_86(uint64_t a1)
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) info];
  [v4 postNotificationName:@"WFClientPreferredNetworksDidChangeNotification" object:v2 userInfo:v3];
}

- (void)_unscheduleCallbacksWithManager:(__WiFiManagerClient *)a3
{
  if (a3)
  {
    id v5 = [(WFClient *)self callbackRunLoop];
    [v5 getCFRunLoop];
    WiFiManagerClientUnscheduleFromRunLoop();

    [(WFClient *)self setCallbackRunLoop:0];
    WiFiManagerClientRegisterNotificationCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterUserAutoJoinStateChangedCallback();
    WiFiManagerClientRegisterPreferredNetworksChangedCallback();
    MEMORY[0x270F4B5E8](a3, 0, 0);
  }
}

- (void)_updateWithDeviceAttachment:(__WiFiDeviceClient *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)long long buf = 136315138;
    id v14 = "-[WFClient _updateWithDeviceAttachment:]";
    _os_log_impl(&dword_226071000, v5, v6, "%s: Device became available", buf, 0xCu);
  }

  id v7 = [(WFClient *)self interface];

  if (v7)
  {
    objc_super v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)long long buf = 136315138;
      id v14 = "-[WFClient _updateWithDeviceAttachment:]";
      _os_log_impl(&dword_226071000, v8, v9, "%s: interface already exists", buf, 0xCu);
    }

    id v10 = [(WFClient *)self interface];
    [v10 setDevice:a3];
  }
  else
  {
    id v10 = dispatch_get_global_queue(21, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__WFClient__updateWithDeviceAttachment___block_invoke;
    v12[3] = &unk_26478E500;
    void v12[4] = self;
    v12[5] = a3;
    dispatch_async(v10, v12);
  }

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"WFClientInterfaceAvailableNotification" object:self];
}

void __40__WFClient__updateWithDeviceAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cInterface];
  id v3 = [v2 interfaceName];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WFClient__updateWithDeviceAttachment___block_invoke_2;
  block[3] = &unk_26478EB18;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __40__WFClient__updateWithDeviceAttachment___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [WFInterface alloc];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) cInterface];
  id v6 = [(WFInterface *)v3 initWithDevice:v4 coreWiFiInterface:v5 interfaceName:v2];
  [*(id *)(a1 + 40) setInterface:v6];

  long long v7 = *(void **)(a1 + 40);
  id v8 = [v7 interface];
  [v8 setWifiClient:v7];
}

void __29__WFClient__updatePowerState__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFClientPowerStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)setPowered:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WFClient *)self powered] == a3)
  {
    os_log_type_t v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      id v11 = @"OFF";
      if (v3) {
        id v11 = @"ON";
      }
      *(_DWORD *)long long buf = 136315394;
      uint64_t v16 = "-[WFClient setPowered:]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_226071000, v9, v10, "%s: no change to power state (%@)", buf, 0x16u);
    }
  }
  else
  {
    self->_powered = v3;
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      long long v7 = @"OFF";
      if (v3) {
        long long v7 = @"ON";
      }
      *(_DWORD *)long long buf = 136315394;
      uint64_t v16 = "-[WFClient setPowered:]";
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_226071000, v5, v6, "%s: setting power to %@", buf, 0x16u);
    }

    id v8 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__WFClient_setPowered___block_invoke;
    block[3] = &unk_26478F418;
    void block[4] = self;
    BOOL v14 = v3;
    dispatch_async(v8, block);

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __23__WFClient_setPowered___block_invoke_119;
    v12[3] = &unk_26478E528;
    void v12[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __23__WFClient_setPowered___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) cInterface];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v9 = 0;
  char v4 = [v2 setPower:v3 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    os_log_type_t v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      id v8 = @"ON";
      if (!*(unsigned char *)(a1 + 40)) {
        id v8 = @"OFF";
      }
      *(_DWORD *)long long buf = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_226071000, v6, v7, "failed to set power to %@, error: %@", buf, 0x16u);
    }
  }
}

void __23__WFClient_setPowered___block_invoke_119(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFClientPowerStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)setPoweredToggle:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(WFClient *)self powered] == v4)
  {
    id v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      id v13 = @"OFF";
      if (v4) {
        id v13 = @"ON";
      }
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[WFClient setPoweredToggle:handler:]";
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_226071000, v11, v12, "%s: no change to power state (%@)", buf, 0x16u);
    }
  }
  else
  {
    self->_powered = v4;
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      id v9 = @"OFF";
      if (v4) {
        id v9 = @"ON";
      }
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[WFClient setPoweredToggle:handler:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_226071000, v7, v8, "%s: setting power to %@", buf, 0x16u);
    }

    os_log_type_t v10 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__WFClient_setPoweredToggle_handler___block_invoke;
    block[3] = &unk_26478F468;
    BOOL v16 = v4;
    void block[4] = self;
    id v15 = v6;
    dispatch_async(v10, block);
  }
}

void __37__WFClient_setPoweredToggle_handler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = *(unsigned __int8 *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) cInterface];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v12 = 0;
  char v4 = [v2 setPower:v3 error:&v12];
  id v5 = v12;

  if ((v4 & 1) == 0)
  {
    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = @"ON";
      if (!*(unsigned char *)(a1 + 48)) {
        os_log_type_t v8 = @"OFF";
      }
      *(_DWORD *)long long buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_226071000, v6, v7, "failed to set power to %@, error: %@", buf, 0x16u);
    }

    v14[3] = *(unsigned char *)(a1 + 48) == 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__WFClient_setPoweredToggle_handler___block_invoke_120;
  v9[3] = &unk_26478F440;
  id v10 = *(id *)(a1 + 40);
  id v11 = &v13;
  v9[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v9);

  _Block_object_dispose(&v13, 8);
}

void __37__WFClient_setPoweredToggle_handler___block_invoke_120(void *a1)
{
  (*(void (**)(void, BOOL))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 24) != 0);
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFClientPowerStateChangedNotification" object:a1[4]];
}

- (void)setWAPIEnabled:(BOOL)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3) {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA80];
  }
  os_log_type_t v7 = @"WAPIEnabled";
  v8[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(WFClient *)self _updateOSSpecificAttributes:v6];

  self->_WAPIEnabled = a3;
}

- (int64_t)_coreWiFiAskToJoinModeFromAskToJoinMode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 4) {
    return a3 + 1;
  }
  else {
    return 1;
  }
}

- (void)setAskToJoinMode:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F386F8]);
  objc_msgSend(v5, "setAskToJoinMode:", -[WFClient _coreWiFiAskToJoinModeFromAskToJoinMode:](self, "_coreWiFiAskToJoinModeFromAskToJoinMode:", a3));
  id v6 = [(WFClient *)self cInterface];
  os_log_type_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26D9E1CF0, 0);
  id v12 = 0;
  char v8 = [v6 applyUserSettings:v5 properties:v7 error:&v12];
  id v9 = v12;

  if (v8)
  {
    id v10 = [NSNumber numberWithInteger:a3];
    [(WFClient *)self _notifyWiFiPropertyChanged:@"kWFClientUserInterfacePropertyATJKey" value:v10];
  }
  else
  {
    id v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)long long buf = 134218242;
      int64_t v14 = a3;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_226071000, v10, v11, "failed to set ask to join to %ld, error='%@'", buf, 0x16u);
    }
  }

  self->_askToJoinMode = a3;
}

- (BOOL)hasShownSBPickerDontAsk
{
  id v2 = [(WFClient *)self cInterface];
  uint64_t v3 = [v2 userSettings];

  char v4 = [v3 OSSpecificAttributes];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F55F30]];

  if (v5) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setHasShownSBPickerDontAsk:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3) {
    uint64_t v4 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v4 = MEMORY[0x263EFFA80];
  }
  uint64_t v6 = *MEMORY[0x263F55F30];
  v7[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(WFClient *)self _updateOSSpecificAttributes:v5];
}

void __40__WFClient_setNetworkRestrictionActive___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFClientNetworkRestrictionPolicyDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __45__WFClient_setPowerModificationDisableState___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFClientPowerModificationStateChangedNotification" object:*(void *)(a1 + 32)];
}

void __39__WFClient__updateCellularRankingState__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v6 = @"kWFClientCellularOutrankWiFiStateKey";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "cellularOutrankState"));
  v7[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WFClientCellularOutrankWiFiNotification" object:v3 userInfo:v5];
}

void __56__WFClient__registerForCellularRankingStateNotification__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[WFClient _registerForCellularRankingStateNotification]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: cellular outranking state notification", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCellularRankingState];
}

void __30__WFClient_setManagedAppleID___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFClientManagedAppleIDStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_logWiFiManagerPropertyChange:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    int v8 = 136315650;
    id v9 = "-[WFClient _logWiFiManagerPropertyChange:value:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_226071000, v6, v7, "%s: wifi manager property %@ changed to %d", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)setAirplaneModeBehavior:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t airplaneModeBehavior = self->_airplaneModeBehavior;
  uint64_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  BOOL v9 = (unint64_t)WFCurrentLogLevel() > 2 && v6 != 0;
  if (airplaneModeBehavior != a3)
  {
    if (v9 && os_log_type_enabled(v6, v7))
    {
      if (a3 > 2) {
        id v11 = &stru_26D9BFD58;
      }
      else {
        id v11 = off_26478F578[a3];
      }
      *(_DWORD *)long long buf = 136315394;
      __int16 v28 = "-[WFClient setAirplaneModeBehavior:]";
      __int16 v29 = 2112;
      __int16 v30 = v11;
      _os_log_impl(&dword_226071000, v6, v7, "%s: new state %@", buf, 0x16u);
    }

    if (a3 == 2)
    {
      __int16 v19 = @"KeepWiFiPoweredAirplaneModeEnabled";
      id v20 = @"KeepWiFiPoweredAirplaneMode";
      uint64_t v21 = MEMORY[0x263EFFA88];
      uint64_t v22 = MEMORY[0x263EFFA88];
      __int16 v12 = NSDictionary;
      BOOL v13 = &v21;
      uint64_t v14 = &v19;
    }
    else if (a3 == 1)
    {
      __int16 v15 = @"KeepWiFiPoweredAirplaneModeEnabled";
      id v16 = @"KeepWiFiPoweredAirplaneMode";
      uint64_t v17 = MEMORY[0x263EFFA88];
      uint64_t v18 = MEMORY[0x263EFFA80];
      __int16 v12 = NSDictionary;
      BOOL v13 = &v17;
      uint64_t v14 = &v15;
    }
    else
    {
      if (a3)
      {
        uint64_t v6 = 0;
        goto LABEL_28;
      }
      uint64_t v23 = @"KeepWiFiPoweredAirplaneModeEnabled";
      os_log_type_t v24 = @"KeepWiFiPoweredAirplaneMode";
      uint64_t v25 = MEMORY[0x263EFFA80];
      uint64_t v26 = MEMORY[0x263EFFA80];
      __int16 v12 = NSDictionary;
      BOOL v13 = &v25;
      uint64_t v14 = &v23;
    }
    uint64_t v6 = objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 2, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
LABEL_28:
    [(WFClient *)self _updateOSSpecificAttributes:v6];
    self->_unint64_t airplaneModeBehavior = a3;
    goto LABEL_29;
  }
  if (v9 && os_log_type_enabled(v6, v7))
  {
    if (a3 > 2) {
      __int16 v10 = &stru_26D9BFD58;
    }
    else {
      __int16 v10 = off_26478F578[a3];
    }
    *(_DWORD *)long long buf = 136315394;
    __int16 v28 = "-[WFClient setAirplaneModeBehavior:]";
    __int16 v29 = 2112;
    __int16 v30 = v10;
    _os_log_impl(&dword_226071000, v6, v7, "%s: stickiness already equal to %@", buf, 0x16u);
  }
LABEL_29:
}

- (BOOL)isInfraAssociationAllowed
{
  return WiFiManagerClientIsInfraAllowed() != 0;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  BOOL v8 = (unint64_t)WFCurrentLogLevel() > 2 && v5 != 0;
  if (v3)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_226071000, v5, v6, "Enabled Auto Join", buf, 2u);
    }

    [(WFClient *)self manager];
    WiFiManagerClientEnable();
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_226071000, v5, v6, "Disabled Auto Join", v9, 2u);
    }

    [(WFClient *)self manager];
    WiFiManagerClientDisable();
  }
}

- (void)setAutoInstantHotspotJoinOption:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F386F8]);
  objc_msgSend(v5, "setAutoHotspotMode:", -[WFClient _coreWiFiHotspotJoinOptionFromAutoHotspotMode:](self, "_coreWiFiHotspotJoinOptionFromAutoHotspotMode:", a3));
  os_log_type_t v6 = [(WFClient *)self cInterface];
  os_log_type_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26D9E1D50, 0);
  id v12 = 0;
  char v8 = [v6 applyUserSettings:v5 properties:v7 error:&v12];
  id v9 = v12;

  if (v8)
  {
    __int16 v10 = [NSNumber numberWithInteger:a3];
    [(WFClient *)self _notifyWiFiPropertyChanged:@"kWFClientUserInterfacePropertyHotspotAJKey" value:v10];
  }
  else
  {
    __int16 v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)long long buf = 134218242;
      int64_t v14 = a3;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_226071000, v10, v11, "failed to set auto hotspot join option to %ld, error='%@'", buf, 0x16u);
    }
  }

  self->_autoInstantHotspotJoinOption = a3;
}

- (int64_t)_coreWiFiHotspotJoinOptionFromAutoHotspotMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3) {
    int64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

- (void)asyncUserAutoJoinState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFClient *)self stateMonitorQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __35__WFClient_asyncUserAutoJoinState___block_invoke;
  v7[3] = &unk_26478EEF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__WFClient_asyncUserAutoJoinState___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v13 = "-[WFClient asyncUserAutoJoinState:]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) cInterface];
  int v5 = [v4 userAutoJoinDisabled];

  if (v5 == [*(id *)(a1 + 32) userAutoJoinState])
  {
    int v6 = v5 ^ 1;
    os_log_type_t v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)long long buf = 136315394;
      BOOL v13 = "-[WFClient asyncUserAutoJoinState:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl(&dword_226071000, v7, v8, "%s: user auto join state changed to %d", buf, 0x12u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 23) = v6;
  }
  if (*(void *)(a1 + 40))
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__WFClient_asyncUserAutoJoinState___block_invoke_156;
    v10[3] = &unk_26478EFE0;
    id v9 = *(id *)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __35__WFClient_asyncUserAutoJoinState___block_invoke_156(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) userAutoJoinState];
  os_log_type_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)setUserAutoJoinState:(BOOL)a3
{
}

- (void)setUserAutoJoinState:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  os_log_type_t v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WFClient_setUserAutoJoinState_completion___block_invoke;
  block[3] = &unk_26478F468;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __44__WFClient_setUserAutoJoinState_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 23);
    *(_DWORD *)long long buf = 136315650;
    __int16 v14 = "-[WFClient setUserAutoJoinState:completion:]_block_invoke";
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&dword_226071000, v2, v3, "%s: setting user auto join state to %d (current state=%d)", buf, 0x18u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 23) = *(unsigned char *)(a1 + 48);
  id v6 = [*(id *)(a1 + 32) cInterface];
  BOOL v7 = *(unsigned char *)(a1 + 48) == 0;
  id v12 = 0;
  [v6 setUserAutoJoinDisabled:v7 error:&v12];
  id v8 = (char *)v12;

  if (v8)
  {
    id v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v14 = v8;
      _os_log_impl(&dword_226071000, v9, v10, "Failed to set user auto join state, error: %@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

- (void)_userAutoJoinStateDidChange:(BOOL)a3 info:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[WFClient _userAutoJoinStateDidChange:info:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_226071000, v7, v8, "%s: enabled %d info %@", (uint8_t *)&v10, 0x1Cu);
  }

  self->_userAutoJoinState = v4;
  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"WFClientUserAutoJoinStateChangedNotification" object:self];
}

- (void)_managedConfigurationDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5)
  {
    BOOL v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      os_log_type_t v8 = [v4 userInfo];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v16 = "-[WFClient _managedConfigurationDidChange:]";
      __int16 v17 = 2112;
      int v18 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "%s- userInfo %@", buf, 0x16u);
    }
  }

  dispatch_time_t v9 = dispatch_time(0, 500000000);
  int v10 = [(WFClient *)self serialClientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__WFClient__managedConfigurationDidChange___block_invoke;
  block[3] = &unk_26478E528;
  void block[4] = self;
  dispatch_after(v9, v10, block);

  dispatch_time_t v11 = dispatch_time(0, 100000000);
  __int16 v12 = [(WFClient *)self serialClientQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__WFClient__managedConfigurationDidChange___block_invoke_2;
  v13[3] = &unk_26478E528;
  v13[4] = self;
  dispatch_after(v11, v12, v13);
}

uint64_t __43__WFClient__managedConfigurationDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNetworkRestrictionActive];
}

uint64_t __43__WFClient__managedConfigurationDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePowerModificationDisableState];
}

- (void)_askToJoinNotification:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)long long buf = 136315394;
    BOOL v13 = "-[WFClient _askToJoinNotification:]";
    __int16 v14 = 1024;
    int v15 = v3;
    _os_log_impl(&dword_226071000, v5, v6, "%s- notificationId %d", buf, 0x12u);
  }

  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3, @"WFClientNotificationIdKey");
  dispatch_time_t v11 = v7;
  os_log_type_t v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  dispatch_time_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"WFClientAskToJoinNotification" object:self userInfo:v8];
}

- (void)_trustNotificationWithID:(unsigned int)a3 network:(__WiFiNetwork *)a4 data:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  dispatch_time_t v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)long long buf = 136315906;
    uint64_t v16 = "-[WFClient _trustNotificationWithID:network:data:]";
    __int16 v17 = 1024;
    int v18 = v6;
    __int16 v19 = 2112;
    id v20 = a4;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_226071000, v9, v10, "%s- notificationId %d network %@ data %@", buf, 0x26u);
  }

  dispatch_time_t v11 = (void *)MEMORY[0x263EFF9A0];
  __int16 v12 = [NSNumber numberWithUnsignedInt:v6];
  BOOL v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"WFClientNotificationIdKey", 0);

  if (a4) {
    [v13 setObject:a4 forKey:@"WFClientNotificationNetworkKey"];
  }
  if (v8) {
    [v13 setObject:v8 forKey:@"WFClientEAPTrustNotificationRequestedDataKey"];
  }
  __int16 v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"WFClientEAPTrustNotification" object:self userInfo:v13];
}

- (void)asyncMISState:(id)a3
{
  id v4 = a3;
  int v5 = [(WFClient *)self stateMonitorQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __26__WFClient_asyncMISState___block_invoke;
  v7[3] = &unk_26478EEF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __26__WFClient_asyncMISState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)long long buf = 136315138;
    dispatch_time_t v11 = "-[WFClient asyncMISState:]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  [*(id *)(a1 + 32) manager];
  int MISState = WiFiManagerClientGetMISState();
  int v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)long long buf = 136315394;
    dispatch_time_t v11 = "-[WFClient asyncMISState:]_block_invoke";
    __int16 v12 = 1024;
    BOOL v13 = MISState != 0;
    _os_log_impl(&dword_226071000, v5, v6, "%s: MIS state %d", buf, 0x12u);
  }

  if (*(void *)(a1 + 40))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __26__WFClient_asyncMISState___block_invoke_158;
    v7[3] = &unk_26478EEC8;
    id v8 = *(id *)(a1 + 40);
    BOOL v9 = MISState != 0;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __26__WFClient_asyncMISState___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setMISState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)long long buf = 136315394;
    dispatch_time_t v11 = "-[WFClient setMISState:]";
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_226071000, v5, v6, "%s: setting MIS state %d", buf, 0x12u);
  }

  BOOL v7 = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __24__WFClient_setMISState___block_invoke;
  v8[3] = &unk_26478F418;
  void v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(v7, v8);
}

uint64_t __24__WFClient_setMISState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return MEMORY[0x270F4B648](v2, v3);
}

- (void)asyncMISDiscoveryState:(id)a3
{
  id v4 = a3;
  int v5 = [(WFClient *)self stateMonitorQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __35__WFClient_asyncMISDiscoveryState___block_invoke;
  v7[3] = &unk_26478EEF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__WFClient_asyncMISDiscoveryState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2 && os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)long long buf = 136315138;
    dispatch_time_t v11 = "-[WFClient asyncMISDiscoveryState:]_block_invoke";
    _os_log_impl(&dword_226071000, v2, v3, "%s: Entering WFClient stateMonitorQueue", buf, 0xCu);
  }

  [*(id *)(a1 + 32) manager];
  int MISDiscoveryState = WiFiManagerClientGetMISDiscoveryState();
  int v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)long long buf = 136315394;
    dispatch_time_t v11 = "-[WFClient asyncMISDiscoveryState:]_block_invoke";
    __int16 v12 = 1024;
    BOOL v13 = MISDiscoveryState != 0;
    _os_log_impl(&dword_226071000, v5, v6, "%s: MIS discovery state %d", buf, 0x12u);
  }

  if (*(void *)(a1 + 40))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __35__WFClient_asyncMISDiscoveryState___block_invoke_159;
    v7[3] = &unk_26478EEC8;
    id v8 = *(id *)(a1 + 40);
    BOOL v9 = MISDiscoveryState != 0;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __35__WFClient_asyncMISDiscoveryState___block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setMISDiscoveryState:(BOOL)a3 immediateDisable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v14 = "-[WFClient setMISDiscoveryState:immediateDisable:]";
    __int16 v15 = 1024;
    BOOL v16 = v5;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_226071000, v7, v8, "%s: setting MIS discovery state %d (immediateDisable %d)", buf, 0x18u);
  }

  BOOL v9 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__WFClient_setMISDiscoveryState_immediateDisable___block_invoke;
  v10[3] = &unk_26478EB68;
  void v10[4] = self;
  BOOL v11 = v5;
  BOOL v12 = v4;
  dispatch_async(v9, v10);
}

uint64_t __50__WFClient_setMISDiscoveryState_immediateDisable___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
  return MEMORY[0x270F4B638](v2, v3, v4);
}

- (void)dispatchCertificateTrustAction:(int64_t)a3 profile:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    BOOL v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      os_log_type_t v10 = [v6 ssid];
      int v13 = 136315650;
      uint64_t v14 = "-[WFClient dispatchCertificateTrustAction:profile:]";
      __int16 v15 = 2048;
      int64_t v16 = a3;
      __int16 v17 = 2112;
      BOOL v18 = v10;
      _os_log_impl(&dword_226071000, v9, v8, "%s: dispatching trust action %lu for network %@", (uint8_t *)&v13, 0x20u);
    }
  }

  if (v6)
  {
    BOOL v11 = [v6 networkAttributes];
    [(WFClient *)self manager];
    WiFiManagerClientDispatchNotificationResponse();
  }
  else
  {
    BOOL v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFClient dispatchCertificateTrustAction:profile:]";
      _os_log_impl(&dword_226071000, v11, v12, "%s: nil profile provided", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_joinRecommendationWithID:(unsigned int)a3 network:(__WiFiNetwork *)a4
{
  id v6 = (void *)MEMORY[0x263EFF9A0];
  BOOL v7 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"WFClientNotificationIdKey", 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    os_log_type_t v8 = [[WFNetworkProfile alloc] initWithNetworkRef:a4];
    [v10 setObject:v8 forKey:@"WFClientNotificationNetworkProfileKey"];
  }
  BOOL v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"WFClientAutoJoinRecommendationNotification" object:self userInfo:v10];
}

- (void)dispatchJoinRecommendationAction:(int64_t)a3 profile:(id)a4
{
  int v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    BOOL v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = [v6 ssid];
      int v13 = 136315650;
      uint64_t v14 = "-[WFClient dispatchJoinRecommendationAction:profile:]";
      __int16 v15 = 1024;
      int v16 = v4;
      __int16 v17 = 2112;
      BOOL v18 = v10;
      _os_log_impl(&dword_226071000, v9, v8, "%s: dispatching auto join action %d for network %@", (uint8_t *)&v13, 0x1Cu);
    }
  }

  if (v6)
  {
    BOOL v11 = [v6 networkAttributes];
    [(WFClient *)self manager];
    WiFiManagerClientDispatchNotificationResponse();
  }
  else
  {
    BOOL v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFClient dispatchJoinRecommendationAction:profile:]";
      _os_log_impl(&dword_226071000, v11, v12, "%s: nil profile provided", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)dispatchAskToJoinAction:(unint64_t)a3 notificationId:(unsigned int)a4 network:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  BOOL v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9 && os_log_type_enabled(v9, v10))
  {
    int v14 = 136315650;
    __int16 v15 = "-[WFClient dispatchAskToJoinAction:notificationId:network:]";
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 1024;
    unsigned int v19 = a4;
    _os_log_impl(&dword_226071000, v9, v10, "%s: dispatching ask to join action %lu for notificationId %d", (uint8_t *)&v14, 0x1Cu);
  }

  if (a3 <= 2)
  {
    if (v8) {
      goto LABEL_7;
    }
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  if (!v8) {
    goto LABEL_13;
  }
LABEL_7:
  BOOL v11 = [v8 attributes];
  os_log_type_t v12 = WFLogForCategory(0);
  os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
  {
    int v14 = 136315394;
    __int16 v15 = "-[WFClient dispatchAskToJoinAction:notificationId:network:]";
    __int16 v16 = 2112;
    unint64_t v17 = (unint64_t)v8;
    _os_log_impl(&dword_226071000, v12, v13, "%s: network %@", (uint8_t *)&v14, 0x16u);
  }

LABEL_14:
  [(WFClient *)self manager];
  WiFiManagerClientDispatchNotificationResponse();
}

- (void)setClientTypeAsForeground
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    id v6 = "-[WFClient setClientTypeAsForeground]";
    _os_log_impl(&dword_226071000, v3, v4, "%s: Setting client type as foreground", (uint8_t *)&v5, 0xCu);
  }

  [(WFClient *)self manager];
  WiFiManagerClientSetType();
}

- (NSString)hardwareMACAddress
{
  [(WFClient *)self manager];
  CFDataRef v2 = (const __CFData *)WiFiManagerClientCopyProperty();
  if (!v2
    || (CFDataRef v3 = v2,
        WFConvertEthernetNetworkAddressToString(v2),
        os_log_type_t v4 = objc_claimAutoreleasedReturnValue(),
        CFRelease(v3),
        !v4))
  {
    int v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_226071000, v5, v6, "Fail to get hardware MAC Address!", v8, 2u);
    }

    os_log_type_t v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setRandomAddressModeForNetwork:(id)a3 mode:(unint64_t)a4 randomMAC:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_log_type_t v10 = dispatch_get_global_queue(21, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__WFClient_setRandomAddressModeForNetwork_mode_randomMAC___block_invoke;
  v13[3] = &unk_26478F4E0;
  id v14 = v9;
  __int16 v15 = self;
  id v16 = v8;
  unint64_t v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __58__WFClient_setRandomAddressModeForNetwork_mode_randomMAC___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFDataRef v2 = (void *)a1[4];
  if (!v2)
  {
    int v14 = WiFiManagerClientSetPrivateMacPrefForScanRecord();
    os_log_type_t v6 = WFLogForCategory(8uLL);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel()) {
      BOOL v15 = v6 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    int v16 = !v15;
    if (v14)
    {
      if (v16 && os_log_type_enabled(v6, v7)) {
        goto LABEL_13;
      }
      goto LABEL_31;
    }
    if (!v16 || !os_log_type_enabled(v6, v7)) {
      goto LABEL_31;
    }
LABEL_29:
    uint64_t v17 = a1[6];
    uint64_t v18 = a1[7];
    uint64_t v19 = a1[4];
    int v20 = 138412802;
    uint64_t v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    os_log_type_t v13 = "failed to save private address for '%@' (mode=%lu, address='%@')";
    goto LABEL_30;
  }
  CFDataRef v3 = ether_aton((const char *)[v2 UTF8String]);
  CFDataRef v4 = CFDataCreate(0, v3->octet, 6);
  int v5 = WiFiManagerClientSetPrivateMacPrefForScanRecord();
  if (v4) {
    CFRelease(v4);
  }
  os_log_type_t v6 = WFLogForCategory(8uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (!v5)
  {
    if (!v9 || !os_log_type_enabled(v6, v7)) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (v9 && os_log_type_enabled(v6, v7))
  {
LABEL_13:
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    uint64_t v12 = a1[4];
    int v20 = 138412802;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    os_log_type_t v13 = "saved private address for '%@' (mode=%lu, address='%@')";
LABEL_30:
    _os_log_impl(&dword_226071000, v6, v7, v13, (uint8_t *)&v20, 0x20u);
  }
LABEL_31:
}

- (void)setEnableRandomMACForNetwork:(id)a3 enable:(BOOL)a4 randomMAC:(id)a5
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  [(WFClient *)self setRandomAddressModeForNetwork:a3 mode:v5 randomMAC:a5];
}

- (id)newRandomMACAddressForSSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WFClient *)self manager];
  uint64_t v5 = (const void *)WiFiManagerClientCopyProperty();
  if (!v5)
  {
    os_log_type_t v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_226071000, v6, v7, "Fail to read hardwareData", (uint8_t *)&v17, 2u);
    }
  }
  [(WFClient *)self manager];
  BOOL v8 = (const void *)WiFiManagerClientCopyProperty();
  if (!v8)
  {
    int v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_226071000, v9, v10, "Fail to read specifierData", (uint8_t *)&v17, 2u);
    }
  }
  [(WFClient *)self manager];
  WiFiManagerClientCopyProperty();
  CFDataRef PrivateMacAddress = (const __CFData *)WiFiManagerClientCreatePrivateMacAddress();
  CFDataRef v12 = PrivateMacAddress;
  if (PrivateMacAddress)
  {
    os_log_type_t v13 = WFConvertEthernetNetworkAddressToString(PrivateMacAddress);
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL v15 = WFLogForCategory(0);
  os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_226071000, v15, v16, "Fail to generate random MAC for ssid: %@", (uint8_t *)&v17, 0xCu);
  }

  os_log_type_t v13 = 0;
  if (v5) {
LABEL_15:
  }
    CFRelease(v5);
LABEL_16:
  if (v12) {
    CFRelease(v12);
  }
  if (v8) {
    CFRelease(v8);
  }

  return v13;
}

- (void)_updateOSSpecificAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F386F8]);
  [v5 setOSSpecificAttributes:v4];
  os_log_type_t v6 = [(WFClient *)self cInterface];
  id v11 = 0;
  char v7 = [v6 applyUserSettings:v5 properties:0 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    int v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)long long buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_226071000, v9, v10, "failed to set OSSpecificAttributes for %@, error='%@'", buf, 0x16u);
    }
  }
}

- (BOOL)isNetworkRestrictionActive
{
  return self->_networkRestrictionActive;
}

- (BOOL)isKnownNetworkUIEnabled
{
  return self->_isKnownNetworkUIEnabled;
}

- (unint64_t)airplaneModeBehavior
{
  return self->_airplaneModeBehavior;
}

- (NSString)whitelistingUUID
{
  return self->_whitelistingUUID;
}

- (BOOL)isWAPIEnabled
{
  return self->_WAPIEnabled;
}

- (BOOL)isDiagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (int64_t)askToJoinMode
{
  return self->_askToJoinMode;
}

- (BOOL)isPowerModificationDisabled
{
  return self->_powerModificationDisabled;
}

- (BOOL)isManagedAppleID
{
  return self->_managedAppleID;
}

- (int64_t)autoInstantHotspotJoinOption
{
  return self->_autoInstantHotspotJoinOption;
}

- (void)setInterface:(id)a3
{
}

- (void)setManager:(__WiFiManagerClient *)a3
{
  self->_manager = a3;
}

- (NSRunLoop)callbackRunLoop
{
  return (NSRunLoop *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCallbackRunLoop:(id)a3
{
}

- (BOOL)showAllHS20Networks
{
  return self->_showAllHS20Networks;
}

- (void)setShowAllHS20Networks:(BOOL)a3
{
  self->_showAllHS20Networks = a3;
}

- (BOOL)isWiFiHealthUIDisabled
{
  return self->_wiFiHealthUIDisabled;
}

- (void)setWiFiHealthUIDisabled:(BOOL)a3
{
  self->_wiFiHealthUIDisabled = a3;
}

- (BOOL)extraLoggingEnabled
{
  return self->_extraLoggingEnabled;
}

- (void)setExtraLoggingEnabled:(BOOL)a3
{
  self->_extraLoggingEnabled = a3;
}

- (BOOL)isDiagnosticsModeEnabled
{
  return self->_diagnosticsModeEnabled;
}

- (void)setDiagnosticsModeEnabled:(BOOL)a3
{
  self->_diagnosticsModeEnabled = a3;
}

- (BOOL)isNANUIEnabled
{
  return self->_nanUIEnabled;
}

- (void)setNanUIEnabled:(BOOL)a3
{
  self->_nanUIEnabled = a3;
}

- (NSNumber)rssiThresholdNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRssiThresholdNumber:(id)a3
{
}

- (BOOL)userAutoJoinState
{
  return self->_userAutoJoinState;
}

- (OS_dispatch_queue)serialClientQueue
{
  return self->_serialClientQueue;
}

- (void)setSerialClientQueue:(id)a3
{
}

- (void)setStateMonitorQueue:(id)a3
{
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (void)setCellularOutrankWiFiNotificationToken:(int)a3
{
  self->_cellularOutrankWiFiNotificationToken = a3;
}

- (void)setCellularOutrankWiFiSymtpomsState:(unint64_t)a3
{
  self->_unint64_t cellularOutrankWiFiSymtpomsState = a3;
}

- (void)setCellularOutrankState:(unint64_t)a3
{
  self->_cellularOutrankState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitorQueue, 0);
  objc_storeStrong((id *)&self->_serialClientQueue, 0);
  objc_storeStrong((id *)&self->_rssiThresholdNumber, 0);
  objc_storeStrong((id *)&self->_callbackRunLoop, 0);
  objc_storeStrong((id *)&self->_cInterface, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_whitelistingUUID, 0);
}

@end