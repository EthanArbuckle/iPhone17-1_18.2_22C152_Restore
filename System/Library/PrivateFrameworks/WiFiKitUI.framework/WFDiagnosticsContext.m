@interface WFDiagnosticsContext
- (BOOL)captive;
- (BOOL)managed;
- (BOOL)multiAP;
- (NSDate)networkQualityDate;
- (NSNumber)channel;
- (NSString)BSSID;
- (NSString)adviceString;
- (NSString)awdl;
- (NSString)beaconPER;
- (NSString)bluetooth;
- (NSString)cca;
- (NSString)channelPerformance;
- (NSString)channelString;
- (NSString)channelWidth;
- (NSString)coexFooter;
- (NSString)deployment;
- (NSString)gateway;
- (NSString)internet;
- (NSString)motion;
- (NSString)probeFooter;
- (NSString)recvFrames;
- (NSString)rssi;
- (NSString)rssiPerformance;
- (NSString)scan;
- (NSString)security;
- (NSString)securityAdvice;
- (NSString)transmitPER;
- (WFDetailsContext)context;
- (WFDiagnosticsContext)initWithNetwork:(id)a3 profile:(id)a4 detailsContext:(id)a5;
- (WFNetworkProfile)profile;
- (WFNetworkScanRecord)network;
- (__WiFiDeviceClient)device;
- (__WiFiManagerClient)manager;
- (double)networkQualityResponsiveness;
- (id)refreshHandler;
- (int64_t)requestedFields;
- (void)cancel;
- (void)setContext:(id)a3;
- (void)setDevice:(__WiFiDeviceClient *)a3;
- (void)setManager:(__WiFiManagerClient *)a3;
- (void)setNetwork:(id)a3;
- (void)setNetworkQualityDate:(id)a3;
- (void)setNetworkQualityResponsiveness:(double)a3;
- (void)setProfile:(id)a3;
- (void)setRefreshHandler:(id)a3;
- (void)updateInfo:(id)a3;
@end

@implementation WFDiagnosticsContext

- (WFDiagnosticsContext)initWithNetwork:(id)a3 profile:(id)a4 detailsContext:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)WFDiagnosticsContext;
  v12 = [(WFDiagnosticsContext *)&v32 init];
  v13 = v12;
  if (!v12)
  {
    v28 = 0;
    goto LABEL_39;
  }
  if (!v9)
  {
    v30 = WFLogForCategory(0);
    os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[WFDiagnosticsContext initWithNetwork:profile:detailsContext:]";
      _os_log_impl(&dword_2257EC000, v30, v31, "%s: nil network", buf, 0xCu);
    }

    v28 = v13;
    v13 = 0;
    goto LABEL_39;
  }
  objc_storeStrong((id *)&v12->_network, a3);
  objc_storeStrong((id *)&v13->_context, a5);
  uint64_t v14 = [(WFNetworkScanRecord *)v13->_network bssid];
  BSSID = v13->_BSSID;
  v13->_BSSID = (NSString *)v14;

  uint64_t v16 = [v9 securityMode];
  if (v16 <= 63)
  {
    switch(v16)
    {
      case 0:
        goto LABEL_23;
      case 1:
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"kWFLocDiagnosticsSecurityWEP";
        break;
      case 2:
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"kWFLocDiagnosticsSecurityLEAP";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_33;
      case 4:
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"kWFLocDiagnosticsSecurityWPAPersonal";
        break;
      case 8:
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"kWFLocDiagnosticsSecurityWPA2Personal";
        break;
      default:
        if (v16 == 16)
        {
          v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v18 = v17;
          v19 = @"kWFLocDiagnosticsSecurityWPAEnterprise";
        }
        else
        {
          if (v16 != 32) {
            goto LABEL_33;
          }
          v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v18 = v17;
          v19 = @"kWFLocDiagnosticsSecurityWPA2 Enterprise";
        }
        break;
    }
  }
  else if (v16 > 519)
  {
    if (v16 > 1074)
    {
      if (v16 == 1075)
      {
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"kWFLocDiagnosticsSecurityAnyEAPEncryption";
      }
      else
      {
        if (v16 != 2048) {
          goto LABEL_33;
        }
LABEL_23:
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"kWFLocDiagnosticsSecurityOpen";
      }
    }
    else if (v16 == 520)
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      v19 = @"kWFLocDiagnosticsSecurityWPA3Transition";
    }
    else
    {
      if (v16 != 1024) {
        goto LABEL_33;
      }
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      v19 = @"kWFLocDiagnosticsSecurityWPA3Enterprise";
    }
  }
  else if (v16 > 255)
  {
    if (v16 == 256)
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      v19 = @"kWFLocDiagnosticsSecurityWEP40_128";
    }
    else
    {
      if (v16 != 512) {
        goto LABEL_33;
      }
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      v19 = @"kWFLocDiagnosticsSecurityWPA3Personal";
    }
  }
  else if (v16 == 64)
  {
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = v17;
    v19 = @"kWFLocDiagnosticsSecurityWAPIPersonal";
  }
  else
  {
    if (v16 != 128) {
      goto LABEL_33;
    }
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = v17;
    v19 = @"kWFLocDiagnosticsSecurityWAPIEnterprise";
  }
  uint64_t v20 = [v17 localizedStringForKey:v19 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
  security = v13->_security;
  v13->_security = (NSString *)v20;

LABEL_33:
  v13->_captive = [v10 isCaptive];
  v22 = [v10 networkQualityDate];
  uint64_t v23 = [v22 copy];
  networkQualityDate = v13->_networkQualityDate;
  v13->_networkQualityDate = (NSDate *)v23;

  [v10 networkQualityResponsiveness];
  v13->_networkQualityResponsiveness = v25;
  uint64_t v26 = WiFiManagerClientCreate();
  v13->_manager = (__WiFiManagerClient *)v26;
  if (v26)
  {
    v27 = (void *)WiFiManagerClientCopyDevices();
    if ([v27 count]) {
      v13->_device = (__WiFiDeviceClient *)[v27 objectAtIndex:0];
    }
  }
  if (v13->_device)
  {
    WiFiDeviceClientRegisterDiagnosticsCallback();
    v28 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v28 getCFRunLoop];
    WiFiManagerClientScheduleWithRunLoop();
LABEL_39:
  }
  return v13;
}

- (void)updateInfo:(id)a3
{
  id v103 = a3;
  v4 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
  if (!v103 || !v4) {
    goto LABEL_62;
  }
  WiFiNetworkGetProperty();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  BSSID = self->_BSSID;
  self->_BSSID = v5;

  WiFiNetworkGetProperty();
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  channel = self->_channel;
  self->_channel = v7;

  id v9 = [NSString stringWithFormat:@"%@ (%dMHz)", self->_channel, WiFiNetworkGetChannelWidthInMHz()];
  channelString = self->_channelString;
  self->_channelString = v9;

  id v11 = WiFiNetworkGetAPEnv();
  switch([v11 intValue])
  {
    case 1u:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = v12;
      uint64_t v14 = @"kWFLocDiagnosticsLearning";
      break;
    case 2u:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = v12;
      uint64_t v14 = @"kWFLocDiagnosticsSingleAP";
      break;
    case 3u:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = v12;
      uint64_t v14 = @"kWFLocDiagnosticsDualBandSingleAP";
      break;
    case 4u:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = v12;
      uint64_t v14 = @"kWFLocDiagnosticsMultipleAP";
      break;
    default:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = v12;
      uint64_t v14 = @"kWFLocDiagnosticsUnspecifiedEnv";
      break;
  }
  v15 = [v12 localizedStringForKey:v14 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
  deployment = self->_deployment;
  self->_deployment = v15;

  v17 = [v103 objectForKey:*MEMORY[0x263F55E18]];
  if (![v17 isEqualToString:@"Stationary"])
  {
    if ([v17 isEqualToString:@"Walking"])
    {
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      uint64_t v20 = @"kWFLocDiagnosticsWalking";
      goto LABEL_17;
    }
    if ([v17 isEqualToString:@"Running"])
    {
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      uint64_t v20 = @"kWFLocDiagnosticsRunning";
      goto LABEL_17;
    }
    if ([v17 isEqualToString:@"Driving"])
    {
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      uint64_t v20 = @"kWFLocDiagnosticsDriving";
      goto LABEL_17;
    }
    if (![v17 isEqualToString:@"Moving"])
    {
      int v95 = [v17 isEqualToString:@"Driving Stopped"];
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      if (v95) {
        uint64_t v20 = @"kWFLocDiagnosticsDrivingStopped";
      }
      else {
        uint64_t v20 = @"kWFLocDiagnosticsMotionUnknown";
      }
      goto LABEL_17;
    }
  }
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = v18;
  uint64_t v20 = @"kWFLocDiagnosticsMoving";
LABEL_17:
  v21 = [v18 localizedStringForKey:v20 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
  motion = self->_motion;
  self->_motion = v21;

  v102 = [v103 objectForKey:*MEMORY[0x263F55E10]];
  if (v102)
  {
    uint64_t v23 = v17;
    v24 = v11;
    double v25 = v4;
    uint64_t v26 = [v102 objectForKey:@"RSSI"];
    v27 = [v102 objectForKey:@"CCA"];
    if ((int)[v26 intValue] < -59)
    {
      int v31 = [v26 intValue];
      v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = v28;
      if (v31 < -74) {
        v30 = @"kWFLocDiagnosticsRSSIWeak";
      }
      else {
        v30 = @"kWFLocDiagnosticsRSSIModerate";
      }
    }
    else
    {
      v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = v28;
      v30 = @"kWFLocDiagnosticsRSSIStrong";
    }
    objc_super v32 = [v28 localizedStringForKey:v30 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
    rssiPerformance = self->_rssiPerformance;
    self->_rssiPerformance = v32;

    v34 = [NSString stringWithFormat:@"%@ (%@)", v26, self->_rssiPerformance];
    rssi = self->_rssi;
    self->_rssi = v34;

    if ((int)[v27 intValue] > 49)
    {
      int v39 = [v27 intValue];
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v37 = v36;
      if (v39 > 69) {
        v38 = @"kWFLocDiagnosticsCCAWeak";
      }
      else {
        v38 = @"kWFLocDiagnosticsCCAModerate";
      }
    }
    else
    {
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v37 = v36;
      v38 = @"kWFLocDiagnosticsCCAStrong";
    }
    v40 = [v36 localizedStringForKey:v38 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
    cca = self->_cca;
    self->_cca = v40;

    v4 = v25;
    id v11 = v24;
    v17 = v23;
  }
  v42 = [v103 objectForKey:*MEMORY[0x263F55E20]];
  v43 = [v42 objectAtIndexedSubscript:0];

  if (v43)
  {
    v44 = [v43 objectForKey:@"kWiFiLqaMgrNumProbesFail"];
    v45 = [v43 objectForKey:@"kWiFiLqaMgrAverageRTT"];
    if ((int)[v44 intValue] < 1)
    {
      v49 = [NSString stringWithFormat:@"%@ms", v45];
      gateway = self->_gateway;
      self->_gateway = v49;
    }
    else
    {
      gateway = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v47 = [gateway localizedStringForKey:@"kWFLocDiagnosticsProbeNoConnection" value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
      v48 = self->_gateway;
      self->_gateway = v47;
    }
  }
  v50 = [v103 objectForKey:*MEMORY[0x263F55E28]];
  v51 = [v50 objectAtIndexedSubscript:0];

  if (v51)
  {
    v52 = [v51 objectForKey:@"kWiFiLqaMgrNumProbesFail"];
    v53 = v51;
    v54 = [v51 objectForKey:@"kWiFiLqaMgrAverageRTT"];
    if ((int)[v52 intValue] < 1)
    {
      v58 = [NSString stringWithFormat:@"%@ms", v54];
      internet = self->_internet;
      self->_internet = v58;
    }
    else
    {
      internet = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v56 = [internet localizedStringForKey:@"kWFLocDiagnosticsProbeNoConnection" value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
      v57 = self->_internet;
      self->_internet = v56;
    }
    v51 = v53;
  }
  v59 = [v103 objectForKey:*MEMORY[0x263F55E00]];
  v60 = v59;
  if (v59)
  {
    v61 = [v59 objectForKey:@"LINK_CHANGED_IS_LINKDOWN"];
    int v62 = [v61 BOOLValue];

    v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v64 = v63;
    if (v62) {
      v65 = @"kWFLocDiagnosticsAWDLInactive";
    }
    else {
      v65 = @"kWFLocDiagnosticsAWDLActive";
    }
    v66 = [v63 localizedStringForKey:v65 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
    awdl = self->_awdl;
    self->_awdl = v66;
  }
  v68 = [v103 objectForKey:*MEMORY[0x263F55E08]];
  v69 = v68;
  if (v68)
  {
    switch([v68 intValue])
    {
      case 0u:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = v70;
        v72 = @"kWFLocDiagnosticsBTIdle";
        break;
      case 1u:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = v70;
        v72 = @"kWFLocDiagnosticsBT_SCO";
        break;
      case 2u:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = v70;
        v72 = @"kWFLocDiagnosticsBT_A2DP";
        break;
      case 4u:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = v70;
        v72 = @"kWFLocDiagnosticsBTInquiry";
        break;
      case 8u:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = v70;
        v72 = @"kWFLocDiagnosticsBTPaging";
        break;
      default:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = v70;
        v72 = @"kWFLocDiagnosticsBTUnnkown";
        break;
    }
    v73 = [v70 localizedStringForKey:v72 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
    bluetooth = self->_bluetooth;
    self->_bluetooth = v73;
  }
  v99 = v69;
  v100 = v60;
  v101 = v43;
  v75 = [v103 objectForKey:*MEMORY[0x263F55E38]];
  int v76 = [v75 intValue];
  v77 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v78 = v77;
  if (v76) {
    v79 = @"kWFLocDiagnosticsScanInactive";
  }
  else {
    v79 = @"kWFLocDiagnosticsScanActive";
  }
  v80 = [v77 localizedStringForKey:v79 value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
  scan = self->_scan;
  self->_scan = v80;

  v82 = [v103 objectForKey:*MEMORY[0x263F55E30]];
  v83 = v82;
  if (v82)
  {
    v84 = v51;
    v85 = [v82 objectForKey:*MEMORY[0x263F55DE8]];
    uint64_t v86 = [v83 objectForKey:*MEMORY[0x263F55DF0]];
    v87 = (void *)v86;
    if (v85 && v86)
    {
      v96 = NSString;
      v98 = v4;
      v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v88 localizedStringForKey:@"kWFLocDiagnosticsLastScan" value:&stru_26D8F6070 table:@"WiFiKitLocalizableStrings"];
      v97 = v17;
      v90 = v89 = v11;
      v91 = [MEMORY[0x263F08790] localizedStringFromDate:v87 dateStyle:1 timeStyle:1];
      v92 = [v96 stringWithFormat:@"%@ %@ at %@", v90, v85, v91];
      coexFooter = self->_coexFooter;
      self->_coexFooter = v92;

      id v11 = v89;
      v17 = v97;

      v4 = v98;
    }

    v51 = v84;
  }
  v94 = [(WFDiagnosticsContext *)self refreshHandler];
  v94[2]();

  CFRelease(v4);
LABEL_62:
}

- (void)cancel
{
  if (self->_device) {
    WiFiDeviceClientRegisterDiagnosticsCallback();
  }
  if (self->_manager)
  {
    id v3 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v3 getCFRunLoop];
    WiFiManagerClientUnscheduleFromRunLoop();
  }
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (BOOL)captive
{
  return self->_captive;
}

- (BOOL)multiAP
{
  return self->_multiAP;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSString)channelPerformance
{
  return self->_channelPerformance;
}

- (int64_t)requestedFields
{
  return self->requestedFields;
}

- (NSString)rssi
{
  return self->_rssi;
}

- (NSString)rssiPerformance
{
  return self->_rssiPerformance;
}

- (id)refreshHandler
{
  return self->refreshHandler;
}

- (void)setRefreshHandler:(id)a3
{
}

- (NSString)security
{
  return self->_security;
}

- (NSString)adviceString
{
  return self->_adviceString;
}

- (NSString)awdl
{
  return self->_awdl;
}

- (NSString)beaconPER
{
  return self->_beaconPER;
}

- (NSString)bluetooth
{
  return self->_bluetooth;
}

- (NSString)cca
{
  return self->_cca;
}

- (NSString)channelString
{
  return self->_channelString;
}

- (NSString)channelWidth
{
  return self->_channelWidth;
}

- (NSString)coexFooter
{
  return self->_coexFooter;
}

- (NSString)deployment
{
  return self->_deployment;
}

- (NSString)motion
{
  return self->_motion;
}

- (NSString)gateway
{
  return self->_gateway;
}

- (NSString)internet
{
  return self->_internet;
}

- (BOOL)managed
{
  return self->_managed;
}

- (NSString)probeFooter
{
  return self->_probeFooter;
}

- (NSString)recvFrames
{
  return self->_recvFrames;
}

- (NSString)scan
{
  return self->_scan;
}

- (NSString)securityAdvice
{
  return self->_securityAdvice;
}

- (NSString)transmitPER
{
  return self->_transmitPER;
}

- (NSDate)networkQualityDate
{
  return self->_networkQualityDate;
}

- (void)setNetworkQualityDate:(id)a3
{
}

- (double)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  self->_networkQualityResponsiveness = a3;
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (WFDetailsContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
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
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_transmitPER, 0);
  objc_storeStrong((id *)&self->_securityAdvice, 0);
  objc_storeStrong((id *)&self->_scan, 0);
  objc_storeStrong((id *)&self->_recvFrames, 0);
  objc_storeStrong((id *)&self->_probeFooter, 0);
  objc_storeStrong((id *)&self->_internet, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_coexFooter, 0);
  objc_storeStrong((id *)&self->_channelWidth, 0);
  objc_storeStrong((id *)&self->_channelString, 0);
  objc_storeStrong((id *)&self->_cca, 0);
  objc_storeStrong((id *)&self->_bluetooth, 0);
  objc_storeStrong((id *)&self->_beaconPER, 0);
  objc_storeStrong((id *)&self->_awdl, 0);
  objc_storeStrong((id *)&self->_adviceString, 0);
  objc_storeStrong((id *)&self->_security, 0);
  objc_storeStrong(&self->refreshHandler, 0);
  objc_storeStrong((id *)&self->_rssiPerformance, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_channelPerformance, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
}

@end