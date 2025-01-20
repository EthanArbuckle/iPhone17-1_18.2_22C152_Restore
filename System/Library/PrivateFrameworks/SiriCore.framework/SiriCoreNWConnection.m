@interface SiriCoreNWConnection
+ (void)getMetricsContext:(id)a3;
- (BOOL)_connectByPOPMethod;
- (BOOL)hasActiveConnection;
- (BOOL)isCanceled;
- (BOOL)isEstablishing;
- (BOOL)isMultipath;
- (BOOL)isPeerConnectionError:(id)a3;
- (BOOL)isPeerNotNearbyError:(id)a3;
- (BOOL)isReady;
- (BOOL)providerStatsIndicatePoorLinkQuality;
- (BOOL)shouldFallbackFromError:(id)a3;
- (BOOL)shouldFallbackQuickly;
- (BOOL)supportsInitialPayload;
- (SiriCoreNWConnection)initWithQueue:(id)a3;
- (id)_connectionId;
- (id)_getAttemptedEndpoints;
- (id)_queue;
- (id)_sendBufferBytesRemaining:(id)a3;
- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5;
- (id)_url;
- (id)analysisInfo;
- (id)connectionType;
- (id)delegate;
- (id)headerDataWithForceReconnect:(BOOL)a3;
- (id)resolvedHost;
- (void)_addCorrespondingMetricsFromConnection:(id)a3 inState:(int)a4;
- (void)_cancelConnectionUnviableTimer;
- (void)_cancelOpenTimer;
- (void)_cancelSlowOpenTimer;
- (void)_cancelStaleConnectionTimer;
- (void)_closeWithError:(id)a3;
- (void)_configureConnection:(id)a3;
- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4;
- (void)_invokeOpenCompletionWithError:(id)a3;
- (void)_receivedBetterRouteNotification:(BOOL)a3;
- (void)_receivedViabilityChangeNotification:(BOOL)a3;
- (void)_setupOpenSlowTimer;
- (void)_setupOpenTimer;
- (void)_setupStaleConnectionTimer;
- (void)_startConnectionUnviableTimer;
- (void)close;
- (void)dealloc;
- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6;
- (void)readData:(id)a3;
- (void)setConnectByPOPMethod:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setKeepAlive:(double)a3 withInterval:(double)a4 withCount:(unint64_t)a5;
- (void)setPolicyRoute:(id)a3;
- (void)setPrefersWWAN:(BOOL)a3;
- (void)setProviderConnectionPolicy:(id)a3;
- (void)setRetransmitConnectionDropTime:(double)a3;
- (void)setStaleInterval:(double)a3;
- (void)updateConnectionMetrics:(id)a3 completion:(id)a4;
- (void)writeData:(id)a3 completion:(id)a4;
@end

@implementation SiriCoreNWConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentErrorFromNWConnection, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_attemptedEndpoints, 0);
  objc_storeStrong((id *)&self->_connectionUnviableTimer, 0);
  objc_storeStrong((id *)&self->_staleConnectionTimer, 0);
  objc_storeStrong((id *)&self->_openSlowTimer, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong(&self->_openCompletion, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_content_context, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_resolvedHost, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_addCorrespondingMetricsFromConnection:(id)a3 inState:(int)a4
{
  v6 = a3;
  v7 = v6;
  if ((a4 - 1) >= 2)
  {
    if (a4 == 3)
    {
      uint64_t v14 = mach_absolute_time();
      queue = self->_queue;
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __71__SiriCoreNWConnection__addCorrespondingMetricsFromConnection_inState___block_invoke;
      v48[3] = &unk_26443B078;
      v49 = v7;
      uint64_t v50 = v14;
      nw_connection_access_establishment_report(v49, queue, v48);
    }
  }
  else
  {
    nw_path_t v8 = nw_connection_copy_current_path(v6);
    if (v8)
    {
      v9 = SiriCoreGetConnectionNetworkPathReport(v7, v8);
      v10 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v10 logEventWithType:1016 context:v9];

      if (v9)
      {
        id v11 = objc_alloc_init(MEMORY[0x263F6E4B0]);
        v12 = [v9 objectForKey:@"connectionPreparingPathHasDNS"];
        if (v12)
        {
          v13 = [v9 objectForKey:@"connectionPreparingPathHasDNS"];
          objc_msgSend(v11, "setHasDNS:", objc_msgSend(v13, "BOOLValue"));
        }
        else
        {
          [v11 setHasDNS:0];
        }

        v16 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
        [v16 logNetworkConnectionStatePreparationSnapshotCaptured:v11];

        id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v18 = [v9 objectForKey:@"connectionPreparingPathGateways"];
        if (v18)
        {
          v19 = (void *)v18;
          v20 = [v9 objectForKey:@"connectionPreparingPathGateways"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v22 = [v9 objectForKey:@"connectionPreparingPathGateways"];
            v23 = +[SiriCoreNetworkingAnalytics endpointsFromArray:v22];
            uint64_t v24 = [v23 mutableCopy];

            id v17 = (id)v24;
          }
        }
        id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v26 = [v9 objectForKey:@"connectionPreparingPathInterfaces"];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [v9 objectForKey:@"connectionPreparingPathInterfaces"];
          objc_opt_class();
          char v29 = objc_opt_isKindOfClass();

          v30 = off_26443A000;
          if (v29)
          {
            v31 = [v9 objectForKey:@"connectionPreparingPathInterfaces"];
            v32 = +[SiriCoreNetworkingAnalytics pathInterfacesFromArray:v31];
            uint64_t v33 = [v32 mutableCopy];

            id v25 = (id)v33;
          }
        }
        else
        {
          v30 = off_26443A000;
        }
        id v34 = objc_alloc_init(MEMORY[0x263F6E458]);
        v35 = [v9 objectForKey:@"connectionPreparingPathIsExpensive"];
        if (v35)
        {
          v36 = [v9 objectForKey:@"connectionPreparingPathIsExpensive"];
          objc_msgSend(v34, "setIsExpensive:", objc_msgSend(v36, "BOOLValue"));
        }
        else
        {
          [v34 setIsExpensive:0];
        }

        [v34 setPathGateways:v17];
        v37 = [v9 objectForKey:@"connectionInfo"];
        if (v37)
        {
          v38 = [v9 objectForKey:@"connectionInfo"];
          [v34 setConnectionInfo:v38];
        }
        else
        {
          [v34 setConnectionInfo:&stru_26CD85388];
        }

        v39 = [v9 objectForKey:@"connectionPreparingPathHasIpv6"];
        if (v39)
        {
          v40 = [v9 objectForKey:@"connectionPreparingPathHasIpv6"];
          objc_msgSend(v34, "setHasIpv6:", objc_msgSend(v40, "BOOLValue"));
        }
        else
        {
          [v34 setHasIpv6:0];
        }

        v41 = [v9 objectForKey:@"connectionPreparingPathHasIpv4"];
        if (v41)
        {
          v42 = [v9 objectForKey:@"connectionPreparingPathHasIpv4"];
          objc_msgSend(v34, "setHasIpv4:", objc_msgSend(v42, "BOOLValue"));
        }
        else
        {
          [v34 setHasIpv4:0];
        }

        v43 = [v9 objectForKey:@"connectionPreparingPathIsConstrained"];
        if (v43)
        {
          v44 = [v9 objectForKey:@"connectionPreparingPathIsConstrained"];
          objc_msgSend(v34, "setIsConstrained:", objc_msgSend(v44, "BOOLValue"));
        }
        else
        {
          [v34 setIsConstrained:0];
        }

        [v34 setPathInterfaces:v25];
        v45 = [v9 objectForKey:@"connectionPreparingPathStatus"];
        if (v45)
        {
          v46 = [v9 objectForKey:@"connectionPreparingPathStatus"];
          objc_msgSend(v34, "setStatus:", +[SiriCoreNetworkingAnalytics pathStatusFromNumber:](SiriCoreNetworkingAnalytics, "pathStatusFromNumber:", v46));

          v30 = off_26443A000;
        }
        else
        {
          [v34 setStatus:0];
        }

        v47 = [(__objc2_class *)v30[11] sharedSiriCoreNetworkingAnalytics];
        [v47 logDebugNetworkConnectionStatePreparationSnapshotCaptured:v34];
      }
    }
  }
}

void __71__SiriCoreNWConnection__addCorrespondingMetricsFromConnection_inState___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    SiriCoreGetConnectionReadyReport(*(void **)(a1 + 32), a2);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v3 logEventWithType:1017 machAbsoluteTime:*(void *)(a1 + 40) context:v43];

    v4 = v43;
    if (v43)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F6E4B8]);
      v6 = [v43 objectForKey:@"connectionInfo"];
      if (v6)
      {
        v7 = [v43 objectForKey:@"connectionInfo"];
        [v5 setConnectionInfo:v7];
      }
      else
      {
        [v5 setConnectionInfo:&stru_26CD85388];
      }

      nw_path_t v8 = [v43 objectForKey:@"connectionEstablishmentPreviousAttemptCount"];
      if (v8)
      {
        v9 = [v43 objectForKey:@"connectionEstablishmentPreviousAttemptCount"];
        [v9 doubleValue];
        [v5 setConnectionEstablishmentPreviousAttemptCount:v10];
      }
      else
      {
        [v5 setConnectionEstablishmentPreviousAttemptCount:0];
      }

      id v11 = [v43 objectForKey:@"connectionEstablishmentAttemptDelay"];
      if (v11)
      {
        v12 = [v43 objectForKey:@"connectionEstablishmentAttemptDelay"];
        [v12 doubleValue];
        [v5 setConnectionEstablishmentAttemptDelay:v13];
      }
      else
      {
        [v5 setConnectionEstablishmentAttemptDelay:0];
      }

      uint64_t v14 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
      [v14 logNetworkConnectionStateReadySnapshotCaptured:v5];

      id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v16 = [v43 objectForKey:@"connectionEstablishmentResolution"];
      if (v16)
      {
        id v17 = (void *)v16;
        uint64_t v18 = [v43 objectForKey:@"connectionEstablishmentResolution"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v20 = [v43 objectForKey:@"connectionEstablishmentResolution"];
          v21 = +[SiriCoreNetworkingAnalytics establishmentResolutionFromArray:v20];
          uint64_t v22 = [v21 mutableCopy];

          id v15 = (id)v22;
        }
      }
      id v23 = objc_alloc_init(MEMORY[0x263F6E4D8]);
      uint64_t v24 = [v43 objectForKey:@"connectionEstablishmentProxyConfiguration"];
      if (v24)
      {
        id v25 = (void *)v24;
        uint64_t v26 = [v43 objectForKey:@"connectionEstablishmentProxyConfiguration"];
        objc_opt_class();
        char v27 = objc_opt_isKindOfClass();

        if (v27)
        {
          v28 = [v43 objectForKey:@"connectionEstablishmentProxyConfiguration"];
          uint64_t v29 = +[SiriCoreNetworkingAnalytics proxyConfigurationFromDictionary:v28];

          id v23 = (id)v29;
        }
      }
      id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v31 = [v43 objectForKey:@"connectionEstablishmentProtocols"];
      if (v31)
      {
        v32 = (void *)v31;
        uint64_t v33 = [v43 objectForKey:@"connectionEstablishmentProtocols"];
        objc_opt_class();
        char v34 = objc_opt_isKindOfClass();

        if (v34)
        {
          v35 = [v43 objectForKey:@"connectionEstablishmentProtocols"];
          v36 = +[SiriCoreNetworkingAnalytics handShakeProtocolFromArray:v35];
          uint64_t v37 = [v36 mutableCopy];

          id v30 = (id)v37;
        }
      }
      id v38 = objc_alloc_init(MEMORY[0x263F6E460]);
      [v38 setResolutions:v15];
      [v38 setProxyConfiguration:v23];
      v39 = [v43 objectForKey:@"connectionEstablishmentDuration"];
      if (v39)
      {
        v40 = [v43 objectForKey:@"connectionEstablishmentDuration"];
        [v40 doubleValue];
        [v38 setDurationInMs:(unint64_t)v41];
      }
      else
      {
        [v38 setDurationInMs:0];
      }

      [v38 setConnectionEstablishmentProtocols:v30];
      v42 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
      [v42 logDebugNetworkConnectionStateReadySnapshotCaptured:v38];

      v4 = v43;
    }
  }
}

- (id)_getAttemptedEndpoints
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  attemptedEndpoints = self->_attemptedEndpoints;
  if (attemptedEndpoints)
  {
    v4 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      id v17 = "-[SiriCoreNWConnection _getAttemptedEndpoints]";
      __int16 v18 = 2112;
      v19 = attemptedEndpoints;
      _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_INFO, "%s cached %@", (uint8_t *)&v16, 0x16u);
      attemptedEndpoints = self->_attemptedEndpoints;
    }
    id v5 = attemptedEndpoints;
  }
  else
  {
    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = self->_connection;
    if (v6 && !self->_isCanceled)
    {
      v7 = (void *)nw_connection_copy_attempted_endpoint_array();
      if (v7)
      {
        uint64_t count = nw_array_get_count();
        if (count)
        {
          uint64_t v9 = count;
          for (uint64_t i = 0; i != v9; ++i)
          {
            id v11 = nw_array_get_object_at_index();
            uint64_t description = nw_endpoint_get_description();
            if (description)
            {
              double v13 = (void *)[[NSString alloc] initWithUTF8String:description];
              if (v13) {
                [(NSArray *)v5 addObject:v13];
              }
            }
          }
        }
      }
    }
    uint64_t v14 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      id v17 = "-[SiriCoreNWConnection _getAttemptedEndpoints]";
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v16, 0x16u);
    }
  }

  return v5;
}

- (BOOL)providerStatsIndicatePoorLinkQuality
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  connection = self->_connection;
  if (!connection) {
    return 0;
  }
  v3 = connection;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v4 = nw_connection_copy_tcp_info();
  id v5 = (void *)v4;
  if (v4 && MEMORY[0x21D4B95F0](v4) == MEMORY[0x263EF8708])
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __60__SiriCoreNWConnection_providerStatsIndicatePoorLinkQuality__block_invoke;
    applier[3] = &unk_26443B050;
    applier[4] = &v10;
    xpc_dictionary_apply(v5, applier);
  }
  if (*((unsigned char *)v11 + 24))
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = *MEMORY[0x263F28358];
    BOOL v6 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[SiriCoreNWConnection providerStatsIndicatePoorLinkQuality]";
      _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_INFO, "%s Connection has poor quality.", buf, 0xCu);
      BOOL v6 = *((unsigned char *)v11 + 24) == 0;
    }
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __60__SiriCoreNWConnection_providerStatsIndicatePoorLinkQuality__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  bytes_ptr = (char *)xpc_data_get_bytes_ptr(v5);
  if (bytes_ptr)
  {
    v7 = bytes_ptr;
    if (xpc_data_get_length(v5) == 408 && MEMORY[0x21D4B95F0](v5) == MEMORY[0x263EF86F8])
    {
      nw_path_t v8 = (os_log_t *)MEMORY[0x263F28358];
      if ((*v7 & 0xFE) == 4 && *(void *)(v7 + 92) <= 0x100uLL)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        uint64_t v9 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          int v18 = 136315394;
          v19 = "-[SiriCoreNWConnection providerStatsIndicatePoorLinkQuality]_block_invoke";
          __int16 v20 = 2080;
          *(void *)v21 = a2;
          _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s Treating %s as ok quality", (uint8_t *)&v18, 0x16u);
        }
      }
      uint64_t v10 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        int v12 = *((_DWORD *)v7 + 5);
        int v11 = *((_DWORD *)v7 + 6);
        int v13 = *((_DWORD *)v7 + 7);
        int v14 = *((_DWORD *)v7 + 16);
        uint64_t v15 = *(void *)(v7 + 92);
        uint64_t v16 = *(void *)(v7 + 284);
        int v18 = 136316930;
        v19 = "-[SiriCoreNWConnection providerStatsIndicatePoorLinkQuality]_block_invoke";
        __int16 v20 = 1024;
        *(_DWORD *)v21 = v11;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = v12;
        __int16 v22 = 1024;
        int v23 = v13;
        __int16 v24 = 1024;
        int v25 = v14;
        __int16 v26 = 2048;
        uint64_t v27 = v15;
        __int16 v28 = 2048;
        uint64_t v29 = v16;
        __int16 v30 = 2080;
        uint64_t v31 = a2;
        _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s TCP srtt: %d rttcur:%d rttvar:%d sbbytes:%d txunacked:%lld txretransmitpackets:%lld for if=%s", (uint8_t *)&v18, 0x42u);
      }
    }
  }

  return 1;
}

- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5
{
  BOOL v5 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a5;
  if (AFIsInternalInstall() && (AFIsNano() & 1) == 0) {
    _AFPreferencesShouldUseTFO();
  }
  nw_path_t v8 = self->_policy;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(SAConnectionPolicy *)v8 enableTcpFastOpen];
    [v10 BOOLValue];

    int v11 = [(SAConnectionPolicy *)v9 disableMPTCP];
    int v12 = [v11 BOOLValue];

    int v13 = [(SAConnectionPolicy *)v9 enableOptimisticDNS];
    int v26 = [v13 BOOLValue];
  }
  else
  {
    int v12 = 0;
    int v26 = 1;
  }
  int v14 = (void *)MEMORY[0x21D4B91D0](*MEMORY[0x263F14478]);
  if (v5 && !self->_connectByPOPEnabled)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke;
    v29[3] = &unk_26443B000;
    char v30 = 1;
    v29[4] = self;
    uint64_t v15 = MEMORY[0x21D4B91D0](v29);

    int v14 = (void *)v15;
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2;
  v28[3] = &unk_26443B028;
  v28[4] = self;
  uint64_t v16 = (void *)MEMORY[0x21D4B91D0](v28);
  secure_tcp = nw_parameters_create_secure_tcp(v14, v16);
  if (v5 && !self->_connectByPOPEnabled)
  {
    size_t v18 = strlen(a3);
    xpc_object_t v19 = xpc_data_create(a3, v18);
    nw_parameters_set_tls_session_id();
  }
  __int16 v20 = +[SiriCoreNWContext sharedInstance];
  v21 = [v20 nwContext];

  nw_parameters_set_context();
  nw_parameters_set_data_mode();
  AFIsHorseman();
  nw_parameters_set_traffic_class();
  if ((AFIsHorseman() | v12))
  {
    if (self->_prefersWWAN) {
      nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_cellular);
    }
  }
  else
  {
    nw_parameters_set_multipath_service(secure_tcp, nw_multipath_service_interactive);
  }
  nw_parameters_set_indefinite();
  nw_parameters_set_tfo();
  if (self->_connectByPOPEnabled)
  {
    __int16 v22 = self->_connectionId;
    NetworkServiceProxyEnableInParameters();
    NetworkServiceProxySetServiceNameInParameters();
  }
  if (v7) {
    nw_parameters_set_initial_data_payload();
  }
  if (v26)
  {
    int v23 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SiriCoreNWConnection _setParametersForHost:useTLS:initialPayload:]";
      _os_log_impl(&dword_21CBF7000, v23, OS_LOG_TYPE_INFO, "%s optimisticDNS", buf, 0xCu);
    }
    nw_parameters_set_expired_dns_behavior(secure_tcp, nw_parameters_expired_dns_behavior_allow);
  }
  *(_OWORD *)buf = 0u;
  long long v32 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x263EF8960], 0xFu, (task_info_t)buf, &task_info_outCnt)) {
    nw_parameters_set_source_application();
  }

  return secure_tcp;
}

void __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke(uint64_t a1, id a2)
{
  options = a2;
  sec_protocol_options_set_tls_tickets_enabled(options, *(unsigned char *)(a1 + 40));
  v3 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v3)
  {
    uint64_t v4 = [v3 enableTLS13];

    if (v4)
    {
      sec_protocol_options_set_max_tls_protocol_version(options, tls_protocol_version_TLSv13);
      sec_protocol_options_set_tls_resumption_enabled(options, 1);
      sec_protocol_options_set_tls_false_start_enabled(options, 1);
      sec_protocol_options_add_tls_application_protocol(options, "http/1.1");
    }
  }
}

void __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2(uint64_t a1, void *a2)
{
  options = a2;
  nw_tcp_options_set_no_delay(options, 1);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(double *)(v3 + 200) != 0.0 || *(double *)(v3 + 192) != 0.0 || *(void *)(v3 + 216))
  {
    nw_tcp_options_set_enable_keepalive(options, 1);
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(double *)(v3 + 200);
    if (v4 != 0.0)
    {
      nw_tcp_options_set_keepalive_interval(options, v4);
      uint64_t v3 = *(void *)(a1 + 32);
    }
    double v5 = *(double *)(v3 + 192);
    if (v5 != 0.0)
    {
      nw_tcp_options_set_keepalive_idle_time(options, v5);
      uint64_t v3 = *(void *)(a1 + 32);
    }
    uint64_t v6 = *(void *)(v3 + 216);
    if (v6)
    {
      nw_tcp_options_set_keepalive_count(options, v6);
      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  double v7 = *(double *)(v3 + 208);
  nw_path_t v8 = options;
  if (v7 != 0.0)
  {
    nw_tcp_options_set_retransmit_connection_drop_time(options, v7);
    nw_path_t v8 = options;
  }
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (void)setRetransmitConnectionDropTime:(double)a3
{
  self->_retransmissionBasedConnectionDropTime = a3;
}

- (void)setKeepAlive:(double)a3 withInterval:(double)a4 withCount:(unint64_t)a5
{
  self->_keepaliveIdleTime = a3;
  self->_keepaliveIntervalTime = a4;
  self->_keepaliveUnackedCount = a5;
}

- (BOOL)shouldFallbackFromError:(id)a3
{
  return 1;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (BOOL)isEstablishing
{
  return self->_isEstablishing;
}

- (BOOL)isMultipath
{
  return self->_isMPTCP;
}

- (BOOL)isPeerNotNearbyError:(id)a3
{
  return 0;
}

- (BOOL)isPeerConnectionError:(id)a3
{
  return 0;
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SiriCoreNWConnection_close__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__SiriCoreNWConnection_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)_receivedBetterRouteNotification:(BOOL)a3
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connectionProviderReceivedBetterRouteNotification:self];
  }
}

- (void)_receivedViabilityChangeNotification:(BOOL)a3
{
  if (self->_isViable != a3)
  {
    BOOL v3 = a3;
    self->_isViable = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connectionProvider:self receivedViabilityChangeNotification:v3];
  }
}

- (void)_closeWithError:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_isCanceled)
  {
    double v5 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[SiriCoreNWConnection _closeWithError:]";
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    resolvedHost = self->_resolvedHost;
    self->_resolvedHost = 0;

    self->_isReady = 0;
    self->_isViable = 1;
    self->_isCanceled = 1;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke;
    v37[3] = &unk_26443AF40;
    v37[4] = self;
    id v38 = v4;
    uint64_t v7 = MEMORY[0x21D4B91D0](v37);
    nw_path_t v8 = (void *)v7;
    connection = self->_connection;
    if (connection)
    {
      uint64_t v10 = connection;
      int v11 = self->_connection;
      self->_connection = 0;

      __int16 v28 = self->_content_context;
      content_context = self->_content_context;
      self->_content_context = 0;

      if (!self->_attemptedEndpoints)
      {
        int v13 = [(SiriCoreNWConnection *)self _getAttemptedEndpoints];
        attemptedEndpoints = self->_attemptedEndpoints;
        self->_attemptedEndpoints = v13;
      }
      uint64_t v15 = dispatch_group_create();
      dispatch_group_enter(v15);
      uint64_t v16 = objc_alloc_init(SiriCoreConnectionMetrics);
      BOOL connectByPOPEnabled = self->_connectByPOPEnabled;
      BOOL isMPTCP = self->_isMPTCP;
      xpc_object_t v19 = self->_attemptedEndpoints;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke_2;
      v35[3] = &unk_26443AF18;
      __int16 v20 = v15;
      v36 = v20;
      [(SiriCoreConnectionMetrics *)v16 setConnectionMetricsFromConnection:v10 isPop:connectByPOPEnabled isMPTCP:isMPTCP attemptedEndpoints:v19 completion:v35];
      metrics = self->_metrics;
      self->_metrics = v16;
      __int16 v22 = v16;

      dispatch_group_enter(v20);
      int v23 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke_3;
      v33[3] = &unk_26443AF18;
      char v34 = v20;
      __int16 v24 = v20;
      [v23 networkActivityRemoveNWConnection:v10 completion:v33];

      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke_4;
      block[3] = &unk_26443AFD8;
      char v30 = v10;
      uint64_t v31 = v28;
      id v32 = v8;
      int v26 = v28;
      uint64_t v27 = v10;
      dispatch_group_notify(v24, queue, block);
    }
    else
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
  }
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelStaleConnectionTimer];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 40);
  if (*(void *)(v2 + 112))
  {
    if (v3)
    {
      id v4 = 0;
    }
    else
    {
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:17 userInfo:0];
      uint64_t v2 = *(void *)(a1 + 32);
      BOOL v3 = *(void **)(a1 + 40);
    }
    if (v3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = v4;
    }
    [(id)v2 _invokeOpenCompletionWithError:v6];
    goto LABEL_12;
  }
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));

    if (WeakRetained)
    {
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [v4 connectionProvider:*(void *)(a1 + 32) receivedError:*(void *)(a1 + 40)];
LABEL_12:
    }
  }
  uint64_t v7 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v7 setIsConnectionActive:0];

  id v8 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v8 setNetIdAvailable:0];
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke_2(uint64_t a1)
{
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke_3(uint64_t a1)
{
}

uint64_t __40__SiriCoreNWConnection__closeWithError___block_invoke_4(uint64_t a1)
{
  nw_connection_send(*(nw_connection_t *)(a1 + 32), 0, *(nw_content_context_t *)(a1 + 40), 1, &__block_literal_global_3312);
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = a2;
  BOOL v3 = v2;
  if (v2)
  {
    int error_code = nw_error_get_error_code(v2);
    if (nw_error_get_error_domain(v3) != nw_error_domain_posix || error_code != 57)
    {
      double v5 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        uint64_t v7 = "-[SiriCoreNWConnection _closeWithError:]_block_invoke_5";
        __int16 v8 = 2112;
        uint64_t v9 = v3;
        _os_log_error_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_ERROR, "%s close error is %@", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)updateConnectionMetrics:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  __int16 v8 = [(SiriCoreNWConnection *)self _getAttemptedEndpoints];
  uint64_t v9 = self->_metrics;
  uint64_t v10 = v9;
  connection = self->_connection;
  if (connection)
  {
    [v6 setConnectionMetricsFromConnection:connection isPop:self->_connectByPOPEnabled isMPTCP:self->_isMPTCP attemptedEndpoints:v8 completion:v7];
  }
  else
  {
    if (v9)
    {
      int v12 = [(SiriCoreConnectionMetrics *)v9 tcpInfoMetricsByInterfaceName];
      int v13 = (void *)[v12 copy];
      [v6 setTCPInfoMetricsByInterfaceName:v13];

      int v14 = [(SiriCoreConnectionMetrics *)v10 flowNetworkInterfaceType];
      uint64_t v15 = (void *)[v14 copy];
      [v6 setFlowNetworkInterfaceType:v15];

      uint64_t v16 = [(SiriCoreConnectionMetrics *)v10 subflowCount];
      [v6 setSubflowCount:v16];

      id v17 = [(SiriCoreConnectionMetrics *)v10 connectedSubflowCount];
      [v6 setConnectedSubflowCount:v17];

      size_t v18 = [(SiriCoreConnectionMetrics *)v10 primarySubflowInterfaceName];
      [v6 setPrimarySubflowInterfaceName:v18];

      xpc_object_t v19 = [(SiriCoreConnectionMetrics *)v10 subflowSwitchCounts];
      [v6 setSubflowSwitchCounts:v19];

      __int16 v20 = [(SiriCoreConnectionMetrics *)v10 dnsResolutionTime];
      [v6 setDnsResolutionTime:v20];

      v21 = [(SiriCoreConnectionMetrics *)v10 connectionStartTimeToDNSResolutionTimeMsec];
      [v6 setConnectionStartTimeToDNSResolutionTimeMsec:v21];

      __int16 v22 = [(SiriCoreConnectionMetrics *)v10 connectionEstablishmentTimeMsec];
      [v6 setConnectionEstablishmentTimeMsec:v22];

      int v23 = [(SiriCoreConnectionMetrics *)v10 connectionStartTimeToConnectionEstablishmentTimeMsec];
      [v6 setConnectionStartTimeToConnectionEstablishmentTimeMsec:v23];

      __int16 v24 = [(SiriCoreConnectionMetrics *)v10 tlsHandshakeTimeMsec];
      [v6 setTlsHandshakeTimeMsec:v24];

      int v25 = [(SiriCoreConnectionMetrics *)v10 connectionStartTimeToTLSHandshakeTimeMsec];
      [v6 setConnectionStartTimeToTLSHandshakeTimeMsec:v25];
    }
    else
    {
      int v25 = [(NSURL *)self->_url absoluteString];
      int v26 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v33 = "-[SiriCoreNWConnection updateConnectionMetrics:completion:]";
        _os_log_impl(&dword_21CBF7000, v26, OS_LOG_TYPE_INFO, "%s Reporting missing metrics to ABC", buf, 0xCu);
      }
      uint64_t v27 = +[SiriCoreSymptomsReporter sharedInstance];
      if (v25)
      {
        char v30 = @"url";
        uint64_t v31 = v25;
        __int16 v28 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      }
      else
      {
        __int16 v28 = 0;
      }
      uint64_t v29 = [MEMORY[0x263F08AB0] processInfo];
      objc_msgSend(v27, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:", @"connection_metrics", @"no_nwconnection", v28, objc_msgSend(v29, "processIdentifier"), 0);

      if (v25) {
    }
      }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (id)analysisInfo
{
  BOOL v3 = self->_connection;
  id v4 = [SiriCoreAceConnectionAnalysisInfo alloc];
  url = self->_url;
  uint64_t interfaceIndex = self->_interfaceIndex;
  uint64_t v7 = [(SiriCoreNWConnection *)self _sendBufferBytesRemaining:v3];
  BOOL prefersWWAN = self->_prefersWWAN;
  uint64_t v9 = [(SiriCoreNWConnection *)self connectionType];
  uint64_t v10 = [(SAConnectionPolicy *)self->_policy policyId];
  int v11 = [(SiriCoreAceConnectionAnalysisInfo *)v4 initWithConnectionURL:url interfaceIndex:interfaceIndex sendBufferSize:v7 wwanPreferred:prefersWWAN connectionType:v9 policyId:v10];

  return v11;
}

- (id)connectionType
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  connection = self->_connection;
  if (!connection)
  {
    int v12 = [SiriCoreConnectionType alloc];
    int64_t v13 = 0;
LABEL_13:
    id v17 = [(SiriCoreConnectionType *)v12 initWithTechnology:v13];
    goto LABEL_14;
  }
  if (self->_connectionType)
  {
LABEL_12:
    uint64_t v16 = [SiriCoreConnectionType alloc];
    int64_t v13 = [(SiriCoreConnectionType *)self->_connectionType technology];
    int v12 = v16;
    goto LABEL_13;
  }
  id v4 = connection;
  BOOL isMPTCP = self->_isMPTCP;
  id v6 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSNumber;
    __int16 v8 = v6;
    uint64_t v9 = [v7 numberWithBool:isMPTCP];
    int v31 = 136315394;
    id v32 = "-[SiriCoreNWConnection connectionType]";
    __int16 v33 = 2112;
    uint64_t v34 = v9;
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s Connection is MPTCP %@", (uint8_t *)&v31, 0x16u);
  }
  if (isMPTCP)
  {
    uint64_t v10 = [SiriCoreConnectionType alloc];
    uint64_t v11 = 3000;
LABEL_10:
    int v14 = [(SiriCoreConnectionType *)v10 initWithTechnology:v11];
    connectionType = self->_connectionType;
    self->_connectionType = v14;
LABEL_11:

    goto LABEL_12;
  }
  if (self->_connectByPOPEnabled)
  {
    uint64_t v10 = [SiriCoreConnectionType alloc];
    uint64_t v11 = 3003;
    goto LABEL_10;
  }
  uint64_t v19 = nw_connection_copy_connected_path();
  if (v19)
  {
    connectionType = (SiriCoreConnectionType *)v19;
    __int16 v20 = nw_path_copy_interface();
    if (v20)
    {
      v21 = v20;
      name = nw_interface_get_name(v20);
      if (name) {
        LODWORD(name) = nw_interface_get_index(v21);
      }
      self->_uint64_t interfaceIndex = (int)name;
      BOOL v23 = nw_path_uses_interface_type(&connectionType->super, nw_interface_type_cellular);
      BOOL v24 = nw_path_uses_interface_type(&connectionType->super, nw_interface_type_wifi);
      BOOL v25 = nw_path_uses_interface_type(&connectionType->super, nw_interface_type_wired);
      if (v23)
      {
        int v26 = +[SiriCoreNetworkManager connectionTypeForInterfaceName:0 isCellular:1];
      }
      else
      {
        BOOL v27 = v25;
        __int16 v28 = [SiriCoreConnectionType alloc];
        if (v24)
        {
          uint64_t v29 = 1000;
        }
        else if (v27)
        {
          uint64_t v29 = 3006;
        }
        else
        {
          uint64_t v29 = 0;
        }
        int v26 = [(SiriCoreConnectionType *)v28 initWithTechnology:v29];
      }
      char v30 = self->_connectionType;
      self->_connectionType = v26;

      goto LABEL_11;
    }
    id v17 = [[SiriCoreConnectionType alloc] initWithTechnology:0];
  }
  else
  {
    id v17 = [[SiriCoreConnectionType alloc] initWithTechnology:0];
  }

LABEL_14:

  return v17;
}

- (id)_sendBufferBytesRemaining:(id)a3
{
  return (id)[NSNumber numberWithInt:0];
}

- (BOOL)supportsInitialPayload
{
  return 1;
}

- (BOOL)shouldFallbackQuickly
{
  return 0;
}

- (id)headerDataWithForceReconnect:(BOOL)a3
{
  return 0;
}

- (void)writeData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (void (**)(void, void))v7;
  connection = self->_connection;
  if (connection && !self->_isCanceled)
  {
    if (v6 && dispatch_data_get_size(v6))
    {
      ++self->_readWriteCounter;
      content_context = self->_content_context;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __45__SiriCoreNWConnection_writeData_completion___block_invoke;
      v12[3] = &unk_26443AF90;
      v12[4] = self;
      int64_t v13 = v8;
      nw_connection_send(connection, v6, content_context, 0, v12);
    }
    else if (v8)
    {
      v8[2](v8, 0);
    }
  }
  else if (v7)
  {
    uint64_t v10 = 0;
    if (!connection && !self->_isCanceled)
    {
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:29 userInfo:0];
    }
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

void __45__SiriCoreNWConnection_writeData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = a2;
  if (v3 && !*(unsigned char *)(*(void *)(a1 + 32) + 83))
  {
    double v5 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v14 = "-[SiriCoreNWConnection writeData:completion:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v3;
      _os_log_error_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_ERROR, "%s write error is %@", buf, 0x16u);
    }
    CFErrorRef v6 = nw_error_copy_cf_error(v3);
    CFErrorRef v7 = v6;
    __int16 v8 = (void *)MEMORY[0x263F087E8];
    if (v6)
    {
      uint64_t v11 = *MEMORY[0x263F08608];
      CFErrorRef v12 = v6;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v4 = [v8 errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:26 userInfo:v9];
    }
    else
    {
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:26 userInfo:0];
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v4);
  }
}

- (void)readData:(id)a3
{
  id v4 = a3;
  double v5 = (void (**)(void, void, void))v4;
  connection = self->_connection;
  if (!connection)
  {
    if (!self->_isCanceled)
    {
      CFErrorRef v7 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:25 userInfo:0];
      goto LABEL_6;
    }
LABEL_5:
    CFErrorRef v7 = 0;
LABEL_6:
    ((void (**)(void, void, void *))v5)[2](v5, 0, v7);

    goto LABEL_7;
  }
  if (self->_isCanceled) {
    goto LABEL_5;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__SiriCoreNWConnection_readData___block_invoke;
  v8[3] = &unk_26443AF68;
  v8[4] = self;
  id v9 = v4;
  nw_connection_receive(connection, 0, 0xFFFFFFFF, v8);

LABEL_7:
}

void __33__SiriCoreNWConnection_readData___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = a5;
  uint64_t v11 = v10;
  ++*(void *)(*(void *)(a1 + 32) + 144);
  if ((!v8 || v10) && !*(unsigned char *)(*(void *)(a1 + 32) + 83))
  {
    int64_t v13 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SiriCoreNWConnection readData:]_block_invoke";
      __int16 v22 = 2112;
      BOOL v23 = v11;
      _os_log_error_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_ERROR, "%s read error is %@", buf, 0x16u);
      if (v11)
      {
LABEL_8:
        CFErrorRef v14 = nw_error_copy_cf_error(v11);
        __int16 v15 = (void *)MEMORY[0x263F087E8];
        if (v14)
        {
          CFErrorRef v16 = v14;
          uint64_t v18 = *MEMORY[0x263F08608];
          CFErrorRef v19 = v14;
          uint64_t v17 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          CFErrorRef v12 = [v15 errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:25 userInfo:v17];

LABEL_13:
          goto LABEL_5;
        }
LABEL_12:
        CFErrorRef v12 = [v15 errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:25 userInfo:0];
        CFErrorRef v16 = 0;
        goto LABEL_13;
      }
    }
    else if (v11)
    {
      goto LABEL_8;
    }
    __int16 v15 = (void *)MEMORY[0x263F087E8];
    goto LABEL_12;
  }
  CFErrorRef v12 = 0;
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasActiveConnection
{
  return self->_connection != 0;
}

- (void)_cancelSlowOpenTimer
{
  openSlowTimer = self->_openSlowTimer;
  if (openSlowTimer)
  {
    dispatch_source_cancel(openSlowTimer);
    id v4 = self->_openSlowTimer;
    self->_openSlowTimer = 0;
  }
}

- (void)_cancelOpenTimer
{
  openTimer = self->_openTimer;
  if (openTimer)
  {
    dispatch_source_cancel(openTimer);
    id v4 = self->_openTimer;
    self->_openTimer = 0;
  }
}

- (void)_setupOpenSlowTimer
{
  BOOL v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = dispatch_time(0, 6000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SiriCoreNWConnection__setupOpenSlowTimer__block_invoke;
  v8[3] = &unk_26443AF40;
  double v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume(v5);
  openSlowTimer = self->_openSlowTimer;
  self->_openSlowTimer = (OS_dispatch_source *)v5;
  CFErrorRef v7 = v5;
}

void __43__SiriCoreNWConnection__setupOpenSlowTimer__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    CFErrorRef v16 = "-[SiriCoreNWConnection _setupOpenSlowTimer]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Open slow timer firing", buf, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v3 + 120))
  {
    dispatch_time_t v4 = *(void **)(v3 + 128);
    *(void *)(v3 + 128) = 0;
  }
  id v5 = objc_alloc(MEMORY[0x263F087E8]);
  CFErrorRef v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 232);
  if (v7)
  {
    uint64_t v13 = *MEMORY[0x263F08608];
    uint64_t v14 = v7;
    id v8 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v9 = (void *)[v6 initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:33 userInfo:v8];
  }
  else
  {
    id v9 = (void *)[v5 initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:33 userInfo:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    [v12 connectionProvider:*(void *)(a1 + 40) receivedIntermediateError:v9];
  }
}

- (void)_setupOpenTimer
{
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  if (AFIsNano()) {
    int64_t v4 = 6000000000;
  }
  else {
    int64_t v4 = 15000000000;
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  dispatch_source_set_timer(v3, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SiriCoreNWConnection__setupOpenTimer__block_invoke;
  v9[3] = &unk_26443AF40;
  CFErrorRef v6 = v3;
  uint64_t v10 = v6;
  char v11 = self;
  dispatch_source_set_event_handler(v6, v9);
  dispatch_resume(v6);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v6;
  id v8 = v6;
}

void __39__SiriCoreNWConnection__setupOpenTimer__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[SiriCoreNWConnection _setupOpenTimer]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Open timer firing", buf, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 120))
  {
    *(void *)(v4 + 120) = 0;
  }
  id v5 = objc_alloc(MEMORY[0x263F087E8]);
  CFErrorRef v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 232);
  if (v7)
  {
    uint64_t v12 = *MEMORY[0x263F08608];
    uint64_t v13 = v7;
    id v8 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v9 = (void *)[v6 initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:4 userInfo:v8];
  }
  else
  {
    id v9 = (void *)[v5 initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:4 userInfo:0];
  }
  if (AFDeviceSupportsSiriUOD()
    && (id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16)), v10, v10))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    [WeakRetained connectionProvider:*(void *)(a1 + 40) receivedError:v9];
  }
  else
  {
    [*(id *)(a1 + 40) _closeWithError:v9];
  }
}

- (void)_configureConnection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  objc_storeStrong((id *)&self->_content_context, (id)*MEMORY[0x263F14450]);
  CFErrorRef v6 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v6 resetSequenceNumber];

  uint64_t v7 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v7 setIsConnectionActive:1];

  id v8 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  id v9 = [v8 orchestratorRequestId];

  if (!v9)
  {
    id v10 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    [v10 resetNetId];

    char v11 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    [v11 setNetIdAvailable:1];
  }
  uint64_t v12 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v12 logRequestLinkBetweenOrchestratorAndNetworkComponent];

  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  location[1] = (id)MEMORY[0x263EF8330];
  location[2] = (id)3221225472;
  location[3] = __45__SiriCoreNWConnection__configureConnection___block_invoke;
  location[4] = &unk_26443AEC8;
  uint64_t v13 = v5;
  BOOL v23 = v13;
  uint64_t v24 = self;
  MEMORY[0x21D4B8B80]();
  objc_initWeak(location, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __45__SiriCoreNWConnection__configureConnection___block_invoke_27;
  handler[3] = &unk_26443AEF0;
  uint64_t v14 = v13;
  __int16 v20 = v14;
  objc_copyWeak(&v21, location);
  nw_connection_set_viability_changed_handler(v14, handler);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__SiriCoreNWConnection__configureConnection___block_invoke_50;
  v16[3] = &unk_26443AEF0;
  __int16 v15 = v14;
  uint64_t v17 = v15;
  objc_copyWeak(&v18, location);
  nw_connection_set_better_path_available_handler(v15, v16);
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_start(v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(location);
}

void __45__SiriCoreNWConnection__configureConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFErrorRef v6 = v5;
  if (v5 && (CFErrorRef v7 = nw_error_copy_cf_error(v5)) != 0)
  {
    CFErrorRef v8 = v7;
    id v9 = (void *)*MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v9;
      *(_DWORD *)buf = 136315906;
      __int16 v33 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
      __int16 v34 = 1024;
      int v35 = a2;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v8;
      __int16 v38 = 2048;
      uint64_t id = nw_connection_get_id();
      _os_log_error_impl(&dword_21CBF7000, v17, OS_LOG_TYPE_ERROR, "%s state: %d error: %@ for connection: %llu", buf, 0x26u);
    }
    int v10 = 0;
  }
  else
  {
    char v11 = (void *)*MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      *(_DWORD *)buf = 136315650;
      __int16 v33 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
      __int16 v34 = 1024;
      int v35 = a2;
      __int16 v36 = 2048;
      uint64_t v37 = nw_connection_get_id();
      _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_DEFAULT, "%s state: %d for connection: %llu", buf, 0x1Cu);
    }
    CFErrorRef v8 = 0;
    int v10 = 1;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 232), v8);
  uint64_t v13 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v13 + 83) && *(void *)(a1 + 32) == *(void *)(v13 + 40))
  {
    switch((int)a2)
    {
      case 0:
      case 4:
      case 5:
        uint64_t v14 = (void *)MEMORY[0x263F087E8];
        if (v10)
        {
          __int16 v15 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:16 userInfo:0];
        }
        else
        {
          uint64_t v26 = *MEMORY[0x263F08608];
          CFErrorRef v27 = v8;
          uint64_t v16 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          __int16 v15 = [v14 errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:16 userInfo:v16];
        }
        [*(id *)(a1 + 40) _closeWithError:v15];
        goto LABEL_16;
      case 1:
        if (v10) {
          goto LABEL_24;
        }
        id v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08608];
        CFErrorRef v31 = v8;
        CFErrorRef v19 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        __int16 v20 = v18;
        uint64_t v21 = 36;
        break;
      case 2:
        if (v10) {
          goto LABEL_24;
        }
        __int16 v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F08608];
        CFErrorRef v29 = v8;
        CFErrorRef v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        __int16 v20 = v22;
        uint64_t v21 = 35;
        break;
      case 3:
        *(unsigned char *)(*(void *)(a1 + 40) + 82) = nw_connection_uses_multipath();
        [*(id *)(a1 + 40) _setupStaleConnectionTimer];
        [*(id *)(a1 + 40) _invokeOpenCompletionWithError:0];
        goto LABEL_24;
      default:
        goto LABEL_24;
    }
    __int16 v15 = [v20 errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:v21 userInfo:v19];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      [v25 connectionProvider:*(void *)(a1 + 40) receivedIntermediateError:v15];
    }
LABEL_16:

LABEL_24:
    [*(id *)(a1 + 40) _addCorrespondingMetricsFromConnection:*(void *)(a1 + 32) inState:a2];
  }
}

void __45__SiriCoreNWConnection__configureConnection___block_invoke_27(uint64_t a1, int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = a2;
    __int16 v29 = 2048;
    uint64_t id = nw_connection_get_id();
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s viability is %d for connection:%llu", buf, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    mach_absolute_time();
    AFMachAbsoluteTimeGetTimeInterval();
    double v8 = v7;
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v10 = WeakRetained[5];
    if (v10)
    {
      if (v10 == *(void *)(a1 + 32))
      {
        char v11 = nw_connection_copy_connected_path();
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", nw_path_uses_interface_type(v11, nw_interface_type_other), @"other");
          v24[0] = v13;
          v23[1] = @"wifi";
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_wifi));
          v24[1] = v14;
          v23[2] = @"cellular";
          __int16 v15 = objc_msgSend(NSNumber, "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_cellular));
          v24[2] = v15;
          v23[3] = @"wired";
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_wired));
          v24[3] = v16;
          v23[4] = @"loopback";
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_loopback));
          v24[4] = v17;
          id v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];

          [v9 setValue:v18 forKey:@"interface_type"];
        }
      }
    }
    if (a2)
    {
      if (WeakRetained[19]) {
        [WeakRetained _cancelConnectionUnviableTimer];
      }
      CFErrorRef v19 = [MEMORY[0x263F283F8] sharedAnalytics];
      __int16 v20 = v19;
      uint64_t v21 = 1015;
    }
    else
    {
      if (v8 >= 2.0)
      {
        [WeakRetained _startConnectionUnviableTimer];
      }
      else
      {
        __int16 v22 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:3 userInfo:0];
        [WeakRetained _closeWithError:v22];
      }
      CFErrorRef v19 = [MEMORY[0x263F283F8] sharedAnalytics];
      __int16 v20 = v19;
      uint64_t v21 = 1014;
    }
    [v19 logEventWithType:v21 context:v9];
  }
}

void __45__SiriCoreNWConnection__configureConnection___block_invoke_50(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    if (a2) {
      id v5 = @"available";
    }
    else {
      id v5 = @"not available";
    }
    CFErrorRef v6 = v4;
    int v8 = 136315650;
    id v9 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    __int16 v10 = 2112;
    char v11 = v5;
    __int16 v12 = 2048;
    uint64_t id = nw_connection_get_id();
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s better path is %@ for %llu", (uint8_t *)&v8, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2) {
    WeakRetained[20] = mach_absolute_time();
  }
}

uint64_t __45__SiriCoreNWConnection__configureConnection___block_invoke_57(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    _os_log_debug_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_DEBUG, "%s read closed", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _closeWithError:0];
}

uint64_t __45__SiriCoreNWConnection__configureConnection___block_invoke_58(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    _os_log_debug_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_DEBUG, "%s write closed", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  route = self->_route;
  id v13 = a5;
  id v14 = a4;
  __int16 v15 = [(SAConnectionPolicyRoute *)route cname];
  uint64_t v16 = v15;
  if (!v15)
  {
    uint64_t v16 = [v10 host];
  }
  uint64_t v17 = (NSString *)[v16 copy];
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = v17;

  if (!v15) {
  CFErrorRef v19 = (NSURL *)[v10 copy];
  }
  url = self->_url;
  self->_url = v19;

  uint64_t v21 = (NSString *)[v14 copy];
  connectionId = self->_connectionId;
  self->_connectionId = v21;

  self->_isEstablishing = 1;
  [(SiriCoreNWConnection *)self _setupOpenTimer];
  [(SiriCoreNWConnection *)self _setupOpenSlowTimer];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
  v27[3] = &unk_26443AE78;
  v27[4] = self;
  id v28 = v11;
  id v23 = v11;
  char v24 = (void *)MEMORY[0x21D4B91D0](v27);
  id openCompletion = self->_openCompletion;
  self->_id openCompletion = v24;

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2;
  v26[3] = &unk_26443AEA0;
  v26[4] = self;
  [(SiriCoreNWConnection *)self _getNWConnectionWithInitialData:v13 completion:v26];
}

void __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _cancelOpenTimer];
  [*(id *)(a1 + 32) _cancelSlowOpenTimer];
  *(unsigned char *)(*(void *)(a1 + 32) + 84) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 85) = v4 == 0;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v7)
  {
    [*(id *)(a1 + 32) _configureConnection:v7];
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:31 userInfo:0];
    }
    [*(id *)(a1 + 32) _closeWithError:v6];
  }
}

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, nw_connection_t, void *))a4;
  kdebug_trace();
  int v8 = self->_resolvedHost;
  id v9 = [(NSURL *)self->_url port];
  id v10 = [v9 stringValue];

  id v11 = [(NSURL *)self->_url scheme];
  self->_usingTLS = [v11 caseInsensitiveCompare:@"https"] == 0;

  if (!v10)
  {
    if (self->_usingTLS) {
      id v10 = @"443";
    }
    else {
      id v10 = @"80";
    }
  }
  __int16 v12 = v8;
  id v13 = [(NSString *)v12 UTF8String];
  id v14 = v10;
  host = nw_endpoint_create_host(v13, (const char *)[(__CFString *)v14 UTF8String]);
  uint64_t v16 = (os_log_t *)MEMORY[0x263F28358];
  if (!host)
  {
    id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:22 userInfo:0];
    uint64_t v26 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v33 = "-[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:]";
      _os_log_error_impl(&dword_21CBF7000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create endpoint", buf, 0xCu);
      if (v25) {
        goto LABEL_20;
      }
    }
    else if (v25)
    {
      goto LABEL_20;
    }
  }
  uint64_t v17 = [(SAConnectionPolicy *)self->_policy mptcpFallbackPort];
  if (v17)
  {
    id v18 = (void *)v17;
    [(SAConnectionPolicy *)self->_policy mptcpFallbackPort];
    CFErrorRef v19 = v7;
    __int16 v20 = v14;
    uint64_t v21 = v12;
    v23 = id v22 = v6;
    unsigned __int16 v24 = [v23 integerValue];

    id v6 = v22;
    __int16 v12 = v21;
    id v14 = v20;
    id v7 = v19;
    uint64_t v16 = (os_log_t *)MEMORY[0x263F28358];

    if (!v24) {
      goto LABEL_16;
    }
  }
  else
  {
    unsigned __int16 v24 = 5228;
  }
  __int16 v27 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:]";
    __int16 v34 = 1024;
    int v35 = v24;
    _os_log_impl(&dword_21CBF7000, v27, OS_LOG_TYPE_INFO, "%s mptcp_alternate_port = %d", buf, 0x12u);
  }
  nw_endpoint_set_alternate_port();
LABEL_16:
  id v28 = [(SiriCoreNWConnection *)self _setParametersForHost:v13 useTLS:self->_usingTLS initialPayload:v6];
  nw_connection_t v29 = nw_connection_create(host, v28);
  uint64_t v30 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
  [v30 networkActivityAddNWConnection:v29];

  if (!v29)
  {
    id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:23 userInfo:0];
    uint64_t v31 = *MEMORY[0x263F28358];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v33 = "-[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:]";
    _os_log_impl(&dword_21CBF7000, v31, OS_LOG_TYPE_INFO, "%s Failed to create connection", buf, 0xCu);
LABEL_20:
    nw_connection_t v29 = 0;
    goto LABEL_21;
  }
  id v25 = 0;
LABEL_21:
  v7[2](v7, v29, v25);
}

- (void)_cancelStaleConnectionTimer
{
  staleConnectionTimer = self->_staleConnectionTimer;
  if (staleConnectionTimer)
  {
    dispatch_source_cancel(staleConnectionTimer);
    id v4 = self->_staleConnectionTimer;
    self->_staleConnectionTimer = 0;
  }
}

- (void)_setupStaleConnectionTimer
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  unint64_t readWriteCounter = self->_readWriteCounter;
  self->_unint64_t readWriteCounter = readWriteCounter + 1;
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  double staleConnectionInterval = self->_staleConnectionInterval;
  if (staleConnectionInterval == 0.0) {
    unint64_t v5 = 180000000000;
  }
  else {
    unint64_t v5 = (unint64_t)(staleConnectionInterval * 1000000000.0);
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(v3, v6, v5, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__SiriCoreNWConnection__setupStaleConnectionTimer__block_invoke;
  handler[3] = &unk_26443AE50;
  __int16 v12 = v13;
  void handler[4] = self;
  id v7 = v3;
  id v11 = v7;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  staleConnectionTimer = self->_staleConnectionTimer;
  self->_staleConnectionTimer = (OS_dispatch_source *)v7;
  id v9 = v7;

  _Block_object_dispose(v13, 8);
}

void __50__SiriCoreNWConnection__setupStaleConnectionTimer__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_log_t *)MEMORY[0x263F28358];
  uint64_t v3 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 144);
    int v13 = 136315650;
    id v14 = "-[SiriCoreNWConnection _setupStaleConnectionTimer]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_INFO, "%s Checking stale connection. Last counter value %tu current %tu", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 144);
  if (*(void *)(v6 + 24) == v7)
  {
    int v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      id v14 = "-[SiriCoreNWConnection _setupStaleConnectionTimer]_block_invoke";
      _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s Connection is stale!", (uint8_t *)&v13, 0xCu);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    if (v9 == *(void **)(v10 + 136))
    {
      *(void *)(v10 + 136) = 0;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:30 userInfo:0];
    __int16 v12 = [*(id *)(a1 + 32) delegate];
    [v12 connectionProvider:*(void *)(a1 + 32) receivedError:v11];
  }
  else
  {
    *(void *)(v6 + 24) = v7;
  }
}

- (void)_cancelConnectionUnviableTimer
{
  connectionUnviableTimer = self->_connectionUnviableTimer;
  if (connectionUnviableTimer)
  {
    dispatch_source_cancel(connectionUnviableTimer);
    uint64_t v4 = self->_connectionUnviableTimer;
    self->_connectionUnviableTimer = 0;
  }
}

- (void)_startConnectionUnviableTimer
{
  if (self->_connection)
  {
    [(SiriCoreNWConnection *)self _cancelConnectionUnviableTimer];
    uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);
    uint64_t id = (void *)nw_connection_get_id();
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__SiriCoreNWConnection__startConnectionUnviableTimer__block_invoke;
    handler[3] = &unk_26443AE28;
    objc_copyWeak(v8, &location);
    v8[1] = id;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
    connectionUnviableTimer = self->_connectionUnviableTimer;
    self->_connectionUnviableTimer = (OS_dispatch_source *)v3;

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

uint64_t __53__SiriCoreNWConnection__startConnectionUnviableTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelConnectionUnviableTimer];

  uint64_t id = (uint64_t)objc_loadWeakRetained(v2);
  uint64_t v5 = (void *)id;
  if (id)
  {
    uint64_t id = *(void *)(id + 40);
    if (id)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v9 = v5;
      uint64_t id = nw_connection_get_id();
      uint64_t v5 = v9;
      if (v6 == id)
      {
        uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:3 userInfo:0];
        [v9 _closeWithError:v7];

        uint64_t v5 = v9;
      }
    }
    v5[20] = 0;
  }

  return MEMORY[0x270F9A758](id, v5);
}

- (BOOL)_connectByPOPMethod
{
  return self->_connectByPOPEnabled;
}

- (id)_connectionId
{
  return self->_connectionId;
}

- (id)_url
{
  return self->_url;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setStaleInterval:(double)a3
{
  self->_double staleConnectionInterval = a3;
}

- (void)setConnectByPOPMethod:(BOOL)a3
{
  self->_BOOL connectByPOPEnabled = a3;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_BOOL prefersWWAN = a3;
}

- (void)setProviderConnectionPolicy:(id)a3
{
  dispatch_time_t v4 = (SAConnectionPolicy *)[a3 copy];
  policy = self->_policy;
  self->_policy = v4;

  MEMORY[0x270F9A758](v4, policy);
}

- (void)setPolicyRoute:(id)a3
{
  dispatch_time_t v4 = (SAConnectionPolicyRoute *)[a3 copy];
  route = self->_route;
  self->_route = v4;

  MEMORY[0x270F9A758](v4, route);
}

- (void)setDelegate:(id)a3
{
}

- (void)_invokeOpenCompletionWithError:(id)a3
{
  id openCompletion = self->_openCompletion;
  if (openCompletion)
  {
    id v5 = a3;
    uint64_t v7 = (void (**)(id, id))MEMORY[0x21D4B91D0](openCompletion);
    id v6 = self->_openCompletion;
    self->_id openCompletion = 0;

    v7[2](v7, v5);
  }
}

- (id)_queue
{
  return self->_queue;
}

- (void)dealloc
{
  [(SiriCoreNWConnection *)self _cancelOpenTimer];
  [(SiriCoreNWConnection *)self _cancelSlowOpenTimer];
  [(SiriCoreNWConnection *)self _cancelStaleConnectionTimer];
  [(SiriCoreNWConnection *)self _cancelConnectionUnviableTimer];
  [(SiriCoreNWConnection *)self _closeWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreNWConnection;
  [(SiriCoreNWConnection *)&v3 dealloc];
}

- (SiriCoreNWConnection)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriCoreNWConnection;
  id v6 = [(SiriCoreNWConnection *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_isViable = 1;
  }

  return v7;
}

+ (void)getMetricsContext:(id)a3
{
}

@end