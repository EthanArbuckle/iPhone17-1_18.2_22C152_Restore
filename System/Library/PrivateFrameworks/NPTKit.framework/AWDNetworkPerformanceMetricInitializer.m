@interface AWDNetworkPerformanceMetricInitializer
+ (id)createPerformanceMetricFromDictionary:(id)a3;
@end

@implementation AWDNetworkPerformanceMetricInitializer

+ (id)createPerformanceMetricFromDictionary:(id)a3
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(AWDNetworkPerformanceMetric);
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v166 objects:v170 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = @"awdl_master_channel";
    v9 = @"awdl_op_mode";
    uint64_t v10 = *(void *)v167;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v167 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v166 + 1) + 8 * v11);
        if ([v12 isEqual:@"acceptable_performance_result"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAcceptablePerformanceResult:v13 != 0];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"awdl_election_parameters"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlElectionParameters:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:v8])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlMasterChannel:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:v9])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlOpMode:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"awdl_power_state"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlPowerState:v13 != 0];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"awdl_schedule"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlSchedule:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"awdl_secondary_master_channel"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlSecondaryMasterChannel:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"awdl_sync_channel_sequence"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlSyncChannelSequence:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"awdl_sync_state"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setAwdlSyncState:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"bt_connected_devices_count"])
        {
          v14 = v8;
          v15 = v9;
          v16 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v17 = [v16 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setBtConnectedDevicesCount:v17];

          v9 = v15;
          v8 = v14;
          goto LABEL_42;
        }
        if ([v12 isEqual:@"bt_is_connectable"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setBtIsConnectable:v13 != 0];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"bt_is_discoverable"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setBtIsDiscoverable:v13 != 0];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"bt_is_power_on"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setBtIsPowerOn:v13 != 0];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"bt_is_scanning"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setBtIsScanning:v13 != 0];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"calling_client"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCallingClient:v13];
          goto LABEL_42;
        }
        if ([v12 isEqual:@"cellular_active_contexts"])
        {
          v18 = v9;
          v19 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v20 = [v19 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularActiveContexts:v20];
          goto LABEL_38;
        }
        if ([v12 isEqual:@"cellular_allows_voip"])
        {
          v21 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v22 = [v21 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularAllowsVoip:v22 != 0];

          v9 = @"awdl_op_mode";
          goto LABEL_41;
        }
        if ([v12 isEqual:@"cellular_attached"])
        {
          v18 = v9;
          v23 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v20 = [v23 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularAttached:v20];
LABEL_38:

          v9 = v18;
LABEL_41:
          v8 = @"awdl_master_channel";
          goto LABEL_42;
        }
        if ([v12 isEqual:@"cellular_bandinfo"])
        {
          v18 = v9;
          v24 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v20 = [v24 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularBandinfo:v20];
          goto LABEL_38;
        }
        v8 = @"awdl_master_channel";
        if ([v12 isEqual:@"cellular_bandwidth"])
        {
          v25 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v25 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularBandwidth:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_carrier_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularCarrierName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_data_bearer_so_mask"])
        {
          v27 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v27 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularDataBearerSoMask:v26];
LABEL_51:

          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_data_bearer_technology"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularDataBearerTechnology:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_data_plan_signaling_reduction_override"])
        {
          v28 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v28 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularDataPlanSignalingReductionOverride:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_data_possible"])
        {
          v29 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v29 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularDataPossible:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_in_home_country"])
        {
          v30 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v30 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularInHomeCountry:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_indicator"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularIndicator:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_indicator_override"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularIndicatorOverride:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_iso_country_code"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularIsoCountryCode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_lqm"])
        {
          v31 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v31 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularLqm:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_lte_max_scheduled_layers"])
        {
          v32 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v32 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularLteMaxScheduledLayers:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_mobile_country_code"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMobileCountryCode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_mobile_network_code"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMobileNetworkCode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_new_radio_coverage"])
        {
          v33 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v33 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioCoverage:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_data_bearer"])
        {
          v34 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v34 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioDataBearer:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_mmwave_data_bearer"])
        {
          v35 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v35 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioMmwaveDataBearer:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_nsa_coverage"])
        {
          v36 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v36 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioNsaCoverage:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_nsa_data_bearer"])
        {
          v37 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v37 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioNsaDataBearer:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_sa_coverage"])
        {
          v38 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v38 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioSaCoverage:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_sa_data_bearer"])
        {
          v39 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v39 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioSaDataBearer:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_new_radio_sub6_data_bearer"])
        {
          v40 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v40 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNewRadioSub6DataBearer:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_configured_bw"])
        {
          v41 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v41 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrConfiguredBw:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_layers"])
        {
          v42 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v42 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrLayers:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_modulation"])
        {
          v43 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v43 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrModulation:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_rsrp"])
        {
          v44 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v44 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrRsrp:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_rsrq"])
        {
          v45 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v45 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrRsrq:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_snr"])
        {
          v46 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v46 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrSnr:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_pid"])
        {
          v47 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v47 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularPid:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_radio_access_technology"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRadioAccessTechnology:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_radio_access_technology_ct_data_status"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRadioAccessTechnologyCtDataStatus:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"cellular_roam_allowed"])
        {
          v48 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v48 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRoamAllowed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_rsrp"])
        {
          v49 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v49 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRsrp:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_snr"])
        {
          v50 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v50 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularSnr:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_tac"])
        {
          v51 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v51 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTac:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_total_active_contexts"])
        {
          v52 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v52 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTotalActiveContexts:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_total_bw"])
        {
          v53 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v53 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTotalBw:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_total_ccs"])
        {
          v54 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v54 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTotalCcs:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_total_layers"])
        {
          v55 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v55 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTotalLayers:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_uarfcn"])
        {
          v56 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v56 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularUarfcn:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_cdn_pop"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadCdnPop:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_cdn_uuid"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadCdnUuid:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_connection_time"])
        {
          v57 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v57 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadConnectionTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_domain_lookup_time"])
        {
          v58 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v58 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadDomainLookupTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_end_data_bearer_technology"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadEndDataBearerTechnology:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_end_primary_ipv4_interface"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadEndPrimaryIpv4Interface:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_end_rat"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadEndRat:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_file_size"])
        {
          v59 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v59 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadFileSize:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_interface_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadInterfaceName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_interface_service_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadInterfaceServiceName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_is_cellular"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setDownloadIsCellular:](v4, "setDownloadIsCellular:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_is_constrained"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setDownloadIsConstrained:](v4, "setDownloadIsConstrained:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_is_expensive"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setDownloadIsExpensive:](v4, "setDownloadIsExpensive:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_is_multipath"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setDownloadIsMultipath:](v4, "setDownloadIsMultipath:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_is_proxy_connection"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setDownloadIsProxyConnection:](v4, "setDownloadIsProxyConnection:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_is_reused_connection"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setDownloadIsReusedConnection:](v4, "setDownloadIsReusedConnection:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_max_speed_observed"])
        {
          v60 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v60 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadMaxSpeedObserved:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_number_of_streams"])
        {
          v61 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v61 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadNumberOfStreams:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_protocol_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadProtocolName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_remote_address"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadRemoteAddress:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_remote_port"])
        {
          v62 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v62 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadRemotePort:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_request_time"])
        {
          v63 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v63 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadRequestTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_request_to_response_time"])
        {
          v64 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v64 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadRequestToResponseTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_response_time"])
        {
          v65 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v65 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadResponseTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_secure_connection_time"])
        {
          v66 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v66 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadSecureConnectionTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_server"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadServer:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_speed"])
        {
          v67 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v67 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadSpeed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_stable_speed"])
        {
          v68 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v68 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadStableSpeed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_start_data_bearer_technology"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadStartDataBearerTechnology:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_start_primary_ipv4_interface"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadStartPrimaryIpv4Interface:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"download_start_rat"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadStartRat:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"network_is_apple_reachable"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkIsAppleReachable:v13 != 0];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"network_primary_ipv4_interface_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkPrimaryIpv4InterfaceName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"network_primary_ipv4_service_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkPrimaryIpv4ServiceName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"nptkit_framework_version"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setNptkitFrameworkVersion:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"performance_test_start_time"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setPerformanceTestStartTime:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"ping_address"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setPingAddress:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"ping_loss_percent"])
        {
          v69 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v69 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingLossPercent:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_max_latency"])
        {
          v70 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v70 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingMaxLatency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_mean_latency"])
        {
          v71 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v71 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingMeanLatency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_min_latency"])
        {
          v72 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v72 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingMinLatency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_standard_deviation"])
        {
          v73 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v73 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingStandardDeviation:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"power_battery_warning_level"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setPowerBatteryWarningLevel:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"power_source_type"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setPowerSourceType:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"power_state_caps"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setPowerStateCaps:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_active_processor_count"])
        {
          v74 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v74 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setSystemActiveProcessorCount:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"system_battery_level"])
        {
          v75 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v75 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setSystemBatteryLevel:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"system_battery_state"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemBatteryState:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_device_class"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemDeviceClass:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_device_model"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemDeviceModel:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_low_power_mode_enabled"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemLowPowerModeEnabled:v13 != 0];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_os_variant"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemOsVariant:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_physical_memory"])
        {
          v76 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v76 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setSystemPhysicalMemory:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"system_powersource_connected"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemPowersourceConnected:v13 != 0];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"system_processor_count"])
        {
          v77 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v77 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setSystemProcessorCount:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"system_version"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setSystemVersion:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_cdn_pop"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadCdnPop:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_cdn_uuid"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadCdnUuid:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_connection_time"])
        {
          v78 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v78 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadConnectionTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_domain_lookup_time"])
        {
          v79 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v79 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadDomainLookupTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_end_data_bearer_technology"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadEndDataBearerTechnology:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_end_primary_ipv4_interface"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadEndPrimaryIpv4Interface:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_end_rat"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadEndRat:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_file_size"])
        {
          v80 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v80 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadFileSize:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_interface_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadInterfaceName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_interface_service_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadInterfaceServiceName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_is_cellular"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setUploadIsCellular:](v4, "setUploadIsCellular:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_is_constrained"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setUploadIsConstrained:](v4, "setUploadIsConstrained:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_is_expensive"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setUploadIsExpensive:](v4, "setUploadIsExpensive:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_is_multipath"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setUploadIsMultipath:](v4, "setUploadIsMultipath:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_is_proxy_connection"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setUploadIsProxyConnection:](v4, "setUploadIsProxyConnection:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_is_reused_connection"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setUploadIsReusedConnection:](v4, "setUploadIsReusedConnection:", [v13 BOOLValue]);
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_max_speed_observed"])
        {
          v81 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v81 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadMaxSpeedObserved:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_number_of_streams"])
        {
          v82 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v82 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadNumberOfStreams:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_protocol_name"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadProtocolName:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_remote_address"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadRemoteAddress:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_remote_port"])
        {
          v83 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v83 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadRemotePort:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_request_time"])
        {
          v84 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v84 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadRequestTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_request_to_response_time"])
        {
          v85 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v85 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadRequestToResponseTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_response_time"])
        {
          v86 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v86 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadResponseTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_secure_connection_time"])
        {
          v87 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v87 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadSecureConnectionTime:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_server"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadServer:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_speed"])
        {
          v88 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v88 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadSpeed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_stable_speed"])
        {
          v89 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v89 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadStableSpeed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_start_data_bearer_technology"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadStartDataBearerTechnology:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_start_primary_ipv4_interface"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadStartPrimaryIpv4Interface:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"upload_start_rat"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setUploadStartRat:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"use_wifi_was_specified"])
        {
          v90 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v90 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUseWifiWasSpecified:v26 != 0];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_average_phy_rate_rx"])
        {
          v91 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v91 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiAveragePhyRateRx:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_average_rssi"])
        {
          v92 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v92 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiAverageRssi:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_average_snr"])
        {
          v93 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v93 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiAverageSnr:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_average_tcp_rtt"])
        {
          v94 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v94 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiAverageTcpRtt:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_btc_mode"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiBtcMode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_cca"])
        {
          v95 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v95 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiCca:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_channel"])
        {
          v96 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v96 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiChannel:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_cwf_cca"])
        {
          v97 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v97 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiCwfCca:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_eapol_control_mode"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiEapolControlMode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_eapol_supplicant_state"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiEapolSupplicantState:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_guard_interval"])
        {
          v98 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v98 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiGuardInterval:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_hidden_state"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiHiddenState:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_is_captive"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiIsCaptive:v13 != 0];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_mcs_index"])
        {
          v99 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v99 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiMcsIndex:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_noise"])
        {
          v100 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v100 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiNoise:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_number_of_spatial_streams"])
        {
          v101 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v101 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiNumberOfSpatialStreams:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_op_mode"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiOpMode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_phy_mode"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiPhyMode:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_rssi"])
        {
          v102 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v102 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiRssi:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_security"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          [(AWDNetworkPerformanceMetric *)v4 setWifiSecurity:v13];
          goto LABEL_54;
        }
        if ([v12 isEqual:@"wifi_tx_rate"])
        {
          v103 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v103 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiTxRate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wrm_channel_type"])
        {
          v104 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v104 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWrmChannelType:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_cellid"])
        {
          v105 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v105 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularCellid:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_responsiveness"])
        {
          v106 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v106 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityResponsiveness:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_aggregated_DL_BW"])
        {
          v107 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v107 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularAggregatedDLBW:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_aggregated_UL_BW"])
        {
          v108 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v108 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularAggregatedULBW:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_issa"])
        {
          v109 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v109 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularIssa:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_lac"])
        {
          v110 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v110 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularLac:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_lte_nr_configured_bw"])
        {
          v111 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v111 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularLteNrConfiguredBw:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_max_dl_mod"])
        {
          v112 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v112 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMaxDlMod:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_max_nw_mimo_lyr"])
        {
          v113 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v113 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMaxNwMimoLyr:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_max_schd_mimo_lyr"])
        {
          v114 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v114 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMaxSchdMimoLyr:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_max_ue_rank"])
        {
          v115 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v115 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMaxUeRank:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_max_ul_mod"])
        {
          v116 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v116 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularMaxUlMod:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nr_sinr"])
        {
          v117 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v117 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrSinr:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_nrarfcn"])
        {
          v118 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v118 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularNrarfcn:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_radio_frequency"])
        {
          v119 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v119 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRadioFrequency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_total_dl_mimo_layers"])
        {
          v120 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v120 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTotalDlMimoLayers:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_total_num_ccs"])
        {
          v121 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v121 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularTotalNumCcs:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_start_radio_frequency"])
        {
          v122 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v122 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadStartRadioFrequency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_end_radio_frequency"])
        {
          v123 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v123 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadEndRadioFrequency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_primary_ipv6_interface_name"])
        {
          v124 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v124 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkPrimaryIpv6InterfaceName:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_primary_ipv6_service_name"])
        {
          v125 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v125 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkPrimaryIpv6ServiceName:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_start_radio_frequency"])
        {
          v126 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v126 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadStartRadioFrequency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_end_radio_frequency"])
        {
          v127 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v127 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadEndRadioFrequency:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_error"])
        {
          v128 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v128 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadError:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_error"])
        {
          v129 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v129 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityError:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_download_speed"])
        {
          v130 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v130 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityDownloadSpeed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_upload_speed"])
        {
          v131 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v131 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityUploadSpeed:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_rating"])
        {
          v132 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v132 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityRating:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"vpn_status"])
        {
          v133 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v133 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setVpnConnectionState:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_error"])
        {
          v134 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v134 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadError:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_error_domain"])
        {
          v135 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v135 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadErrorDomain:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_error_code"])
        {
          v136 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v136 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadErrorCode:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_error_domain"])
        {
          v137 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v137 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadErrorDomain:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_error_code"])
        {
          v138 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v138 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadErrorCode:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_error"])
        {
          v139 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v139 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingError:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_error_domain"])
        {
          v140 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v140 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingErrorDomain:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"ping_error_code"])
        {
          v141 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v141 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setPingErrorCode:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_error_domain"])
        {
          v142 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v142 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityErrorDomain:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"network_quality_error_code"])
        {
          v143 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v143 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setNetworkQualityErrorCode:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_rn_mobile_country_code"])
        {
          v144 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v144 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRnMobileCountryCode:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_rn_mobile_network_code"])
        {
          v145 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v145 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setCellularRnMobileNetworkCode:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"cellular_data_is_enabled"])
        {
          v13 = [v5 objectForKeyedSubscript:v12];
          -[AWDNetworkPerformanceMetric setCellularDataIsEnabled:](v4, "setCellularDataIsEnabled:", [v13 BOOLValue]);
LABEL_54:
          v9 = @"awdl_op_mode";
LABEL_42:

          goto LABEL_43;
        }
        if ([v12 isEqual:@"download_start_cellular_estimate"])
        {
          v146 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v146 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadStartCellularEstimate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_end_cellular_estimate"])
        {
          v147 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v147 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadEndCellularEstimate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_max_cellular_estimate"])
        {
          v148 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v148 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadMaxCellularEstimate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_start_cellular_estimate"])
        {
          v149 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v149 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadStartCellularEstimate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_end_cellular_estimate"])
        {
          v150 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v150 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadEndCellularEstimate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_max_cellular_estimate"])
        {
          v151 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v151 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadMaxCellularEstimate:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_responsiveness"])
        {
          v152 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v152 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadResponsiveness:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_responsiveness_confidence"])
        {
          v153 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v153 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadResponsivenessConfidence:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_responsiveness_rating"])
        {
          v154 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v154 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadResponsivenessRating:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_speed_confidence"])
        {
          v155 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v155 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadSpeedConfidence:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"download_speed_rating"])
        {
          v156 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v156 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setDownloadSpeedRating:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_responsiveness"])
        {
          v157 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v157 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadResponsiveness:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_responsiveness_confidence"])
        {
          v158 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v158 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadResponsivenessConfidence:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_responsiveness_rating"])
        {
          v159 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v159 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadResponsivenessRating:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_speed_confidence"])
        {
          v160 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v160 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadSpeedConfidence:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"upload_speed_rating"])
        {
          v161 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v161 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setUploadSpeedRating:v26];
          goto LABEL_51;
        }
        if ([v12 isEqual:@"wifi_channel_band"])
        {
          v162 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v162 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiChannelBand:v26];
          goto LABEL_51;
        }
        v9 = @"awdl_op_mode";
        if ([v12 isEqual:@"wifi_channel_width"])
        {
          v163 = NSString;
          v13 = [v5 objectForKeyedSubscript:v12];
          v26 = [v163 stringWithFormat:@"%@", v13];
          [(AWDNetworkPerformanceMetric *)v4 setWifiChannelWidth:v26];
          goto LABEL_51;
        }
LABEL_43:
        ++v11;
      }
      while (v7 != v11);
      uint64_t v164 = [v5 countByEnumeratingWithState:&v166 objects:v170 count:16];
      uint64_t v7 = v164;
    }
    while (v164);
  }

  return v4;
}

@end