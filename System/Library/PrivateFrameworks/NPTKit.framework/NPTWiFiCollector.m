@interface NPTWiFiCollector
+ (id)BTCModeToString:(int)a3;
+ (id)ControlModeToString:(unsigned int)a3;
+ (id)OpModeToString:(int)a3;
+ (id)PhyModeToString:(int)a3;
+ (id)SecurityTypeToString:(unint64_t)a3;
+ (id)collectorName;
+ (id)convertBSSIDToOUI:(id)a3;
+ (id)convertPowerStateToString:(id)a3;
+ (id)fetchWiFiData:(id)a3;
+ (int64_t)channelBandToInt:(unsigned int)a3;
- (CWFInterface)interface;
- (NSMutableDictionary)cachedMetadata;
- (id)metadataDidChangeHandler;
- (void)setCachedMetadata:(id)a3;
- (void)setInterface:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTWiFiCollector

- (void)startCollectingWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, id))a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTWiFiCollector *)self setCachedMetadata:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [(NPTWiFiCollector *)self cachedMetadata];
  [v8 setObject:v7 forKeyedSubscript:@"initial_state"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [(NPTWiFiCollector *)self cachedMetadata];
  [v10 setObject:v9 forKeyedSubscript:@"events"];

  id v11 = objc_alloc_init(MEMORY[0x263F386E0]);
  [(NPTWiFiCollector *)self setInterface:v11];

  objc_initWeak(&location, self);
  v12 = [(NPTWiFiCollector *)self interface];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __50__NPTWiFiCollector_startCollectingWithCompletion___block_invoke;
  v33[3] = &unk_2643A1C78;
  v31 = &v34;
  objc_copyWeak(&v34, &location);
  [v12 setEventHandler:v33];

  v13 = [(NPTWiFiCollector *)self interface];
  [v13 activate];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (unint64_t i = 0; objc_msgSend(&unk_26CAD5A88, "count", v31) > i; ++i)
  {
    v16 = [&unk_26CAD5A88 objectAtIndexedSubscript:i];
    v17 = [(NPTWiFiCollector *)self interface];
    uint64_t v18 = [v16 integerValue];
    id v32 = 0;
    [v17 startMonitoringEventType:v18 error:&v32];
    id v19 = v32;

    if (v19) {
      [v14 addObject:v19];
    }
  }
  v20 = [(NPTWiFiCollector *)self interface];
  v21 = +[NPTWiFiCollector fetchWiFiData:v20];

  [v5 addEntriesFromDictionary:v21];
  v22 = [(NPTWiFiCollector *)self interface];
  v23 = [v22 currentKnownNetworkProfile];

  v24 = [(NPTWiFiCollector *)self interface];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    v26 = [(NPTWiFiCollector *)self interface];
    uint64_t v27 = [v26 CCA];

    v28 = [NSNumber numberWithInteger:v27];
    [v5 setValue:v28 forKey:@"wifi_cwf_cca"];
  }
  if (v23)
  {
    v29 = [v23 dictionary];
    [v5 addEntriesFromDictionary:v29];
  }
  v30 = [(NPTWiFiCollector *)self cachedMetadata];
  [v30 setObject:v5 forKeyedSubscript:@"initial_state"];

  if (v4) {
    v4[2](v4, v5, v14);
  }

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __50__NPTWiFiCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v133[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v116 = objc_alloc_init(MEMORY[0x263F08790]);
  [v116 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(NPTMetadataEvent);
  id v117 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [MEMORY[0x263EFF910] now];
  [(NPTMetadataEvent *)v6 setTimeStamp:v7];

  [(NPTMetadataEvent *)v6 setCollectorType:objc_opt_class()];
  v8 = [v3 info];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [v3 info];
    id v11 = [v10 allValues];
    v12 = [v11 objectAtIndexedSubscript:0];
    [v5 setObject:v12 forKeyedSubscript:@"info"];
  }
  switch([v3 type])
  {
    case 1:
      [(NPTMetadataEvent *)v6 setEventType:12];
      v13 = NSNumber;
      id v14 = [WeakRetained interface];
      v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "powerOn"));
      [v5 setObject:v15 forKeyedSubscript:@"data"];

      v16 = [v5 objectForKeyedSubscript:@"data"];
      if (v16)
      {
        v128 = @"wifi_power";
        v17 = [v5 objectForKeyedSubscript:@"data"];
        v129 = v17;
        uint64_t v18 = [NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
        [v5 setObject:v18 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 2:
      [(NPTMetadataEvent *)v6 setEventType:11];
      id v19 = [v5 objectForKeyedSubscript:@"info"];
      if (v19)
      {
        [v5 setObject:v19 forKeyedSubscript:@"data"];
      }
      else
      {
        id v67 = [NSString alloc];
        v68 = [WeakRetained interface];
        v69 = [v68 SSID];
        v70 = (void *)[v67 initWithData:v69 encoding:4];
        [v5 setObject:v70 forKeyedSubscript:@"data"];
      }
      v71 = [v5 objectForKeyedSubscript:@"data"];
      if (v71)
      {
        v130 = @"wifi_ssid";
        v72 = [v5 objectForKeyedSubscript:@"data"];
        v131 = v72;
        v73 = [NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
        [v5 setObject:v73 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 3:
      [(NPTMetadataEvent *)v6 setEventType:10];
      v20 = [WeakRetained interface];
      v21 = [v20 BSSID];
      [v117 setObject:v21 forKeyedSubscript:@"wifi_bssid"];

      v22 = [WeakRetained interface];
      v23 = [v22 BSSID];
      v24 = +[NPTWiFiCollector convertBSSIDToOUI:v23];
      [v117 setObject:v24 forKeyedSubscript:@"wifi_oui"];

      if ([v117 count]) {
        id v25 = v117;
      }
      else {
        id v25 = 0;
      }
      goto LABEL_44;
    case 5:
      [(NPTMetadataEvent *)v6 setEventType:15];
      id v26 = [WeakRetained interface];
      uint64_t v27 = [v26 currentScanResult];
      v28 = [v27 dictionary];
      if ([v28 count])
      {
        v29 = [WeakRetained interface];
        v30 = [v29 currentScanResult];
        v31 = [v30 dictionary];
        [v5 setObject:v31 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_82;
    case 6:
      [(NPTMetadataEvent *)v6 setEventType:25];
      id v32 = [v5 objectForKeyedSubscript:@"info"];
      v33 = v32;
      if (v32)
      {
        id v26 = v32;
      }
      else
      {
        v74 = [WeakRetained interface];
        id v26 = [v74 cachedLinkDownStatus];
      }
      v75 = [v26 interfaceName];
      [v117 setObject:v75 forKeyedSubscript:@"interface"];

      v76 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v26, "isLinkDown"));
      [v117 setObject:v76 forKeyedSubscript:@"link_down"];

      v77 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v26, "reason"));
      [v117 setObject:v77 forKeyedSubscript:@"reason"];

      [v5 setObject:v117 forKeyedSubscript:@"data"];
      goto LABEL_83;
    case 7:
      [(NPTMetadataEvent *)v6 setEventType:16];
      id v34 = [v5 objectForKeyedSubscript:@"info"];
      v35 = v34;
      if (v34)
      {
        id v26 = v34;
      }
      else
      {
        v78 = [WeakRetained interface];
        id v26 = [v78 cachedLinkQualityMetric];
      }
      uint64_t v27 = [v26 dictionary];
      if ([v27 count]) {
        goto LABEL_64;
      }
      goto LABEL_65;
    case 10:
      [(NPTMetadataEvent *)v6 setEventType:13];
      v36 = [WeakRetained interface];
      v37 = [v36 interfaceNames];
      [v5 setObject:v37 forKeyedSubscript:@"data"];

      v38 = [v5 objectForKeyedSubscript:@"data"];
      if (v38)
      {
        v126 = @"wifi_interface_names";
        v39 = [v5 objectForKeyedSubscript:@"data"];
        v127 = v39;
        v40 = [NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
        [v5 setObject:v40 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 11:
      [(NPTMetadataEvent *)v6 setEventType:14];
      v41 = [v5 objectForKeyedSubscript:@"info"];
      v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        v79 = [WeakRetained interface];
        id v43 = [v79 interfaceNames];
      }
      [v5 setObject:v43 forKeyedSubscript:@"data"];
      v80 = [v5 objectForKeyedSubscript:@"data"];
      if (v80)
      {
        v124 = @"wifi_interface_names";
        v81 = [v5 objectForKeyedSubscript:@"data"];
        v125 = v81;
        v82 = [NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
        [v5 setObject:v82 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 12:
      [(NPTMetadataEvent *)v6 setEventType:17];
      v44 = [v5 objectForKeyedSubscript:@"info"];
      v45 = v44;
      if (v44)
      {
        id v26 = v44;
      }
      else
      {
        v83 = [WeakRetained interface];
        id v26 = [v83 cachedAutoJoinStatus];
      }
      uint64_t v27 = [v26 dictionary];
      if ([v27 count]) {
        goto LABEL_64;
      }
      goto LABEL_65;
    case 13:
      [(NPTMetadataEvent *)v6 setEventType:18];
      v46 = [v5 objectForKeyedSubscript:@"info"];
      v47 = v46;
      if (v46)
      {
        id v26 = v46;
      }
      else
      {
        v84 = [WeakRetained interface];
        id v26 = [v84 cachedJoinStatus];
      }
      uint64_t v27 = [v26 dictionary];
      if ([v27 count]) {
        goto LABEL_64;
      }
      goto LABEL_65;
    case 14:
      [(NPTMetadataEvent *)v6 setEventType:19];
      v48 = [v5 objectForKeyedSubscript:@"info"];
      v49 = v48;
      if (v48)
      {
        id v26 = v48;
      }
      else
      {
        v85 = [WeakRetained interface];
        id v26 = [v85 cachedRoamStatus];
      }
      uint64_t v27 = [v26 dictionary];
      if ([v27 count])
      {
LABEL_64:
        v86 = [v26 dictionary];
        [v5 setObject:v86 forKeyedSubscript:@"data"];
      }
      else
      {
LABEL_65:
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }
LABEL_82:

LABEL_83:
      goto LABEL_84;
    case 18:
      [(NPTMetadataEvent *)v6 setEventType:9];
      v50 = [v5 objectForKeyedSubscript:@"info"];
      if (v50)
      {
        [v5 setObject:v50 forKeyedSubscript:@"data"];
      }
      else
      {
        v87 = [WeakRetained interface];
        v88 = [v87 networkServiceName];
        [v5 setObject:v88 forKeyedSubscript:@"data"];
      }
      v89 = [v5 objectForKeyedSubscript:@"data"];
      if (v89)
      {
        v132 = @"wifi_network_service_name";
        v90 = [v5 objectForKeyedSubscript:@"data"];
        v133[0] = v90;
        v91 = [NSDictionary dictionaryWithObjects:v133 forKeys:&v132 count:1];
        [v5 setObject:v91 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 19:
      [(NPTMetadataEvent *)v6 setEventType:21];
      v51 = [v5 objectForKeyedSubscript:@"info"];
      if (v51)
      {
        [v5 setObject:v51 forKeyedSubscript:@"data"];
      }
      else
      {
        v92 = [WeakRetained interface];
        v93 = [v92 IPv4Addresses];
        [v5 setObject:v93 forKeyedSubscript:@"data"];
      }
      v94 = [v5 objectForKeyedSubscript:@"data"];
      if (v94)
      {
        v120 = @"wifi_ipv4_addresses";
        v95 = [v5 objectForKeyedSubscript:@"data"];
        v121 = v95;
        v96 = [NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        [v5 setObject:v96 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 20:
      [(NPTMetadataEvent *)v6 setEventType:22];
      v52 = [v5 objectForKeyedSubscript:@"info"];
      if (v52)
      {
        [v5 setObject:v52 forKeyedSubscript:@"data"];
      }
      else
      {
        v97 = [WeakRetained interface];
        v98 = [v97 IPv6Addresses];
        [v5 setObject:v98 forKeyedSubscript:@"data"];
      }
      v99 = [v5 objectForKeyedSubscript:@"data"];
      if (v99)
      {
        v118 = @"wifi_ipv6_addresses";
        v100 = [v5 objectForKeyedSubscript:@"data"];
        v119 = v100;
        v101 = [NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        [v5 setObject:v101 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 21:
      [(NPTMetadataEvent *)v6 setEventType:20];
      v53 = [v5 objectForKeyedSubscript:@"info"];
      if (v53)
      {
        [v5 setObject:v53 forKeyedSubscript:@"data"];
      }
      else
      {
        v102 = [WeakRetained interface];
        v103 = [v102 DNSServerAddresses];
        [v5 setObject:v103 forKeyedSubscript:@"data"];
      }
      v104 = [v5 objectForKeyedSubscript:@"data"];
      if (v104)
      {
        v122 = @"wifi_dns_addresses";
        v105 = [v5 objectForKeyedSubscript:@"data"];
        v123 = v105;
        v106 = [NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
        [v5 setObject:v106 forKeyedSubscript:@"data"];
      }
      else
      {
        [v5 setObject:0 forKeyedSubscript:@"data"];
      }

      goto LABEL_84;
    case 22:
      [(NPTMetadataEvent *)v6 setEventType:24];
      v54 = [WeakRetained interface];
      v55 = [v54 DHCPLeaseStartedAt];
      v56 = [v116 stringFromDate:v55];
      [v117 setObject:v56 forKeyedSubscript:@"wifi_dhcp_start_time"];

      v57 = [WeakRetained interface];
      v58 = [v57 DHCPLeaseExpiresAt];
      v59 = [v116 stringFromDate:v58];
      v60 = v117;
      [v117 setObject:v59 forKeyedSubscript:@"wifi_dhcp_expire_time"];

      goto LABEL_41;
    case 23:
      [(NPTMetadataEvent *)v6 setEventType:23];
      v61 = NSString;
      v62 = [WeakRetained interface];
      unsigned int v63 = [v62 EAP8021XSupplicantState];
      if (v63 > 8) {
        v64 = "<unknown>";
      }
      else {
        v64 = SupplicantStateString_str[v63];
      }
      v65 = [v61 stringWithUTF8String:v64];
      [v117 setObject:v65 forKeyedSubscript:@"wifi_eap8021x_supplicant_state"];

      v57 = [WeakRetained interface];
      v66 = +[NPTWiFiCollector ControlModeToString:](NPTWiFiCollector, "ControlModeToString:", [v57 EAP8021XControlMode]);
      v60 = v117;
      [v117 setObject:v66 forKeyedSubscript:@"wifi_eap8021x_control_mode"];

LABEL_41:
      if ([v60 count]) {
        id v25 = v60;
      }
      else {
        id v25 = 0;
      }
LABEL_44:
      [v5 setObject:v25 forKeyedSubscript:@"data"];
LABEL_84:
      [v5 removeObjectForKey:@"info"];
      if (v6)
      {
        v107 = NSDictionary;
        v108 = [v5 objectForKeyedSubscript:@"data"];
        v109 = [v107 dictionaryWithDictionary:v108];
        [(NPTMetadataEvent *)v6 setData:v109];

        id v110 = WeakRetained;
        objc_sync_enter(v110);
        v111 = [v110 cachedMetadata];
        v112 = [v111 objectForKeyedSubscript:@"events"];
        v113 = [(NPTMetadataEvent *)v6 asDictionary];
        [v112 addObject:v113];

        objc_sync_exit(v110);
        v114 = [v110 metadataDidChangeHandler];

        if (v114)
        {
          v115 = [v110 metadataDidChangeHandler];
          ((void (**)(void, NPTMetadataEvent *, void))v115)[2](v115, v6, 0);
        }
      }
      break;
    default:

      [v5 removeObjectForKey:@"info"];
      id v6 = 0;
      break;
  }
}

- (void)stopCollecting
{
  id v2 = [(NPTWiFiCollector *)self interface];
  [v2 invalidate];
}

+ (id)collectorName
{
  return @"wifi";
}

+ (id)fetchWiFiData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [v4 BSSID];
  [v5 setObject:v6 forKeyedSubscript:@"wifi_bssid"];

  id v7 = [v4 BSSID];
  v8 = +[NPTWiFiCollector convertBSSIDToOUI:v7];
  [v5 setObject:v8 forKeyedSubscript:@"wifi_oui"];

  uint64_t v9 = objc_msgSend(a1, "BTCModeToString:", objc_msgSend(v4, "bluetoothCoexistenceMode"));
  [v5 setObject:v9 forKeyedSubscript:@"wifi_btc_mode"];

  v10 = NSNumber;
  id v11 = [v4 channel];
  v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "channel"));
  [v5 setObject:v12 forKeyedSubscript:@"wifi_channel"];

  v13 = NSNumber;
  id v14 = [v4 channel];
  v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(a1, "channelBandToInt:", objc_msgSend(v14, "band")));
  [v5 setObject:v15 forKeyedSubscript:@"wifi_channel_band"];

  v16 = NSNumber;
  v17 = [v4 channel];
  uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v17, "width"));
  [v5 setObject:v18 forKeyedSubscript:@"wifi_channel_width"];

  id v19 = [v4 countryCode];
  [v5 setObject:v19 forKeyedSubscript:@"wifi_country_code"];

  v20 = objc_msgSend(a1, "ControlModeToString:", objc_msgSend(v4, "EAP8021XControlMode"));
  [v5 setObject:v20 forKeyedSubscript:@"wifi_eapol_control_mode"];

  v21 = NSString;
  unsigned int v22 = [v4 EAP8021XSupplicantState];
  if (v22 > 8) {
    v23 = "<unknown>";
  }
  else {
    v23 = SupplicantStateString_str[v22];
  }
  v24 = [v21 stringWithUTF8String:v23];
  [v5 setObject:v24 forKeyedSubscript:@"wifi_eapol_supplicant_state"];

  id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "guardInterval"));
  [v5 setObject:v25 forKeyedSubscript:@"wifi_guard_interval"];

  id v26 = [v4 MACAddress];
  [v5 setObject:v26 forKeyedSubscript:@"wifi_mac_address"];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "MCSIndex"));
  [v5 setObject:v27 forKeyedSubscript:@"wifi_mcs_index"];

  v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "noise"));
  [v5 setObject:v28 forKeyedSubscript:@"wifi_noise"];

  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfSpatialStreams"));
  [v5 setObject:v29 forKeyedSubscript:@"wifi_number_of_spatial_streams"];

  v30 = objc_msgSend(a1, "OpModeToString:", objc_msgSend(v4, "opMode"));
  [v5 setObject:v30 forKeyedSubscript:@"wifi_op_mode"];

  v31 = objc_msgSend(a1, "PhyModeToString:", objc_msgSend(v4, "PHYMode"));
  [v5 setObject:v31 forKeyedSubscript:@"wifi_phy_mode"];

  id v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "RSSI"));
  [v5 setObject:v32 forKeyedSubscript:@"wifi_rssi"];

  v33 = objc_msgSend(a1, "SecurityTypeToString:", objc_msgSend(v4, "securityType"));
  [v5 setObject:v33 forKeyedSubscript:@"wifi_security"];

  id v34 = [v4 networkName];
  [v5 setObject:v34 forKeyedSubscript:@"wifi_ssid"];

  v35 = NSNumber;
  [v4 txRate];
  v36 = objc_msgSend(v35, "numberWithDouble:");
  [v5 setObject:v36 forKeyedSubscript:@"wifi_tx_rate"];

  v37 = [v4 cachedJoinStatus];
  v38 = v37;
  if (v37)
  {
    v39 = [v37 scanResult];
    v40 = [v39 networkName];
    v41 = [v4 networkName];
    int v42 = [v40 isEqualToString:v41];

    if (v42)
    {
      id v43 = NSNumber;
      v44 = [v4 cachedJoinStatus];
      v45 = [v44 endedAt];
      [v45 timeIntervalSinceNow];
      v47 = [v43 numberWithDouble:-v46];
      [v5 setObject:v47 forKeyedSubscript:@"wifi_assoc_duration"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v48 = NSNumber;
    [v4 rxRate];
    v49 = objc_msgSend(v48, "numberWithDouble:");
    [v5 setObject:v49 forKeyedSubscript:@"wifi_rx_rate"];
  }

  return v5;
}

+ (id)convertBSSIDToOUI:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = 0;
    int v5 = 0;
    while ([v3 characterAtIndex:v4] != 58 || ++v5 != 3)
    {
      if ([v3 length] <= (unint64_t)++v4) {
        goto LABEL_6;
      }
    }
    id v6 = [v3 substringToIndex:v4];
  }
  else
  {
LABEL_6:
    id v6 = 0;
  }

  return v6;
}

+ (id)SecurityTypeToString:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 <= 63)
    {
      if (a3 == 16) {
        return @"WPA2 Personal";
      }
      if (a3 == 32) {
        return @"WPA2 Enterprise";
      }
    }
    else
    {
      switch(a3)
      {
        case 0x40uLL:
          return @"WPA3 Personal";
        case 0x80uLL:
          return @"WPA3 Enterprise";
        case 0x200uLL:
          return @"None";
      }
    }
    return @"Conversion not found";
  }
  else
  {
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        id result = @"Any";
        break;
      case 1uLL:
        id result = @"WEP";
        break;
      case 2uLL:
        id result = @"WAPI";
        break;
      case 4uLL:
        id result = @"WPA Personal";
        break;
      case 8uLL:
        id result = @"WPA Enterprise";
        break;
      default:
        return @"Conversion not found";
    }
  }
  return result;
}

+ (id)BTCModeToString:(int)a3
{
  if (a3 > 8) {
    return @"Conversion not found";
  }
  else {
    return off_2643A1E80[a3];
  }
}

+ (id)ControlModeToString:(unsigned int)a3
{
  if (a3 > 3) {
    return @"Conversion not found";
  }
  else {
    return off_2643A1EC8[a3];
  }
}

+ (id)OpModeToString:(int)a3
{
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16) {
        return @"MONITOR";
      }
      if (a3 == 32) {
        return @"P2P_GO";
      }
    }
    else
    {
      switch(a3)
      {
        case 64:
          return @"P2P_CLI";
        case 128:
          return @"P2P_DEV";
        case 256:
          return @"NAN";
      }
    }
    return @"Conversion not found";
  }
  else
  {
    id result = @"NONE";
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        id result = @"STA";
        break;
      case 2:
        id result = @"IBSS";
        break;
      case 4:
        id result = @"AHDEMO";
        break;
      case 8:
        id result = @"HOSTAP";
        break;
      default:
        return @"Conversion not found";
    }
  }
  return result;
}

+ (id)PhyModeToString:(int)a3
{
  if (a3 > 31)
  {
    if (a3 > 255)
    {
      switch(a3)
      {
        case 256:
          return @"11ax";
        case 512:
          return @"11BE";
        case 1024:
          return @"6E";
      }
    }
    else
    {
      switch(a3)
      {
        case 32:
          return @"turbo_a";
        case 64:
          return @"turbo_g";
        case 128:
          return @"11ac";
      }
    }
    return @"Conversion not found";
  }
  else
  {
    id result = @"unknown";
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        id result = @"auto";
        break;
      case 2:
        id result = @"11a";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        return @"Conversion not found";
      case 4:
        id result = @"11b";
        break;
      case 8:
        id result = @"11g";
        break;
      default:
        if (a3 != 16) {
          return @"Conversion not found";
        }
        id result = @"11n";
        break;
    }
  }
  return result;
}

+ (id)convertPowerStateToString:(id)a3
{
  uint64_t v3 = [a3 bytes];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (*(_DWORD *)(v4 + 4))
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = *(int *)(v4 + 8 + 4 * v6);
        if (v7 <= 4) {
          [v5 addObject:off_2643A1EE8[v7]];
        }
        ++v6;
      }
      while (v6 < *(unsigned int *)(v4 + 4));
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (int64_t)channelBandToInt:(unsigned int)a3
{
  if (a3 >= 4)
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    uint64_t v3 = (void *)qword_2643A1F10[a3];
  }
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
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
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end