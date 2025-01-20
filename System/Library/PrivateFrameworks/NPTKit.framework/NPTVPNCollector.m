@interface NPTVPNCollector
+ (id)collectorName;
- (NEConfiguration)config;
- (NEConfigurationManager)configManager;
- (NEVPNManager)manager;
- (NSArray)eventsToMonitor;
- (NSMutableDictionary)cachedMetadata;
- (OS_dispatch_queue)backgroundQueue;
- (id)getVPNStatusAsString:(int64_t)a3;
- (id)metadataDidChangeHandler;
- (void)collectVPNAddressesWithCompletion:(id)a3;
- (void)getExtendedStatus:(int)a3 session:(void *)a4 completionHandler:(id)a5;
- (void)setBackgroundQueue:(id)a3;
- (void)setCachedMetadata:(id)a3;
- (void)setConfig:(id)a3;
- (void)setConfigManager:(id)a3;
- (void)setEventsToMonitor:(id)a3;
- (void)setManager:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
- (void)vpnNotificationReceived:(id)a3;
@end

@implementation NPTVPNCollector

- (void)startCollectingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = [MEMORY[0x263F14640] sharedManager];
  [(NPTVPNCollector *)self setManager:v6];

  v7 = [MEMORY[0x263F145C0] sharedManager];
  [(NPTVPNCollector *)self setConfigManager:v7];

  dispatch_queue_t v8 = dispatch_queue_create("NPTVPNCollector.backgroundQueue", MEMORY[0x263EF83A8]);
  [(NPTVPNCollector *)self setBackgroundQueue:v8];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTVPNCollector *)self setCachedMetadata:v9];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v11 = [(NPTVPNCollector *)self cachedMetadata];
  [v11 setObject:v10 forKeyedSubscript:@"initial_state"];

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13 = [(NPTVPNCollector *)self cachedMetadata];
  [v13 setObject:v12 forKeyedSubscript:@"events"];

  v14 = [(NPTVPNCollector *)self manager];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke;
  v26[3] = &unk_2643A1B80;
  id v27 = v5;
  v28 = self;
  id v29 = v4;
  id v15 = v4;
  id v16 = v5;
  [v14 loadFromPreferencesWithCompletionHandler:v26];

  v17 = [MEMORY[0x263F08A00] defaultCenter];
  v18 = [MEMORY[0x263F14640] sharedManager];
  v19 = [v18 connection];
  [v17 addObserver:self selector:sel_vpnNotificationReceived_ name:@"com.apple.networkextension.statuschanged" object:v19];

  v20 = [MEMORY[0x263F08A00] defaultCenter];
  v21 = [MEMORY[0x263F14640] sharedManager];
  v22 = [v21 connection];
  [v20 addObserver:self selector:sel_vpnNotificationReceived_ name:@"NEVPNErrorDomain" object:v22];

  v23 = [MEMORY[0x263F08A00] defaultCenter];
  v24 = [MEMORY[0x263F14640] sharedManager];
  v25 = [v24 connection];
  [v23 addObserver:self selector:sel_vpnNotificationReceived_ name:@"com.apple.networkextension.app-configuration-changed" object:v25];
}

void __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  id v5 = *(void **)(a1 + 40);
  v6 = [v5 manager];
  v7 = [v6 connection];
  dispatch_queue_t v8 = objc_msgSend(v5, "getVPNStatusAsString:", objc_msgSend(v7, "status"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"vpn_status"];

  id v9 = [*(id *)(a1 + 40) manager];
  id v10 = [v9 connection];
  v11 = [v10 connectedDate];
  id v12 = [v4 stringFromDate:v11];
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:@"vpn_connected_date"];

  if (v3)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = [*(id *)(a1 + 40) cachedMetadata];
    [v14 setObject:v13 forKeyedSubscript:@"initial_state"];

    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v15 addObject:v3];
    uint64_t v16 = *(void *)(a1 + 48);
    if (v16)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = (void *)[v15 copy];
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, v17, v18);
    }
  }
  else
  {
    v19 = [*(id *)(a1 + 40) configManager];
    v20 = [*(id *)(a1 + 40) backgroundQueue];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_2;
    v24[3] = &unk_2643A1B58;
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    v23 = *(void **)(a1 + 48);
    id v25 = v21;
    uint64_t v26 = v22;
    id v27 = v23;
    [v19 loadConfigurationsWithCompletionQueue:v20 handler:v24];
  }
}

void __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v52 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  [v6 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  v7 = *(void **)(a1 + 40);
  dispatch_queue_t v8 = [v7 manager];
  id v9 = [v8 connection];
  id v10 = objc_msgSend(v7, "getVPNStatusAsString:", objc_msgSend(v9, "status"));
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"vpn_status"];

  v11 = [*(id *)(a1 + 40) manager];
  id v12 = [v11 connection];
  uint64_t v13 = [v12 connectedDate];
  v51 = v6;
  v14 = [v6 stringFromDate:v13];
  uint64_t v50 = a1;
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"vpn_connected_date"];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = 0;
    uint64_t v19 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(v15);
        }
        id v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v22 = [v21 VPN];

        if (v22)
        {
          v23 = +[NPTLogger metadata];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219415000, v23, OS_LOG_TYPE_DEFAULT, "VPN Configuration Found", buf, 2u);
          }

          if (!v18
            || ([v21 VPN],
                v24 = objc_claimAutoreleasedReturnValue(),
                int v25 = [v24 isEnabled],
                v24,
                v25))
          {
            id v26 = v21;

            v18 = v26;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  [*(id *)(v50 + 40) setConfig:v18];
  if (v18)
  {
    id v27 = [v18 name];
    [*(id *)(v50 + 32) setObject:v27 forKeyedSubscript:@"vpn_name"];

    v28 = NSNumber;
    id v29 = [v18 VPN];
    v30 = objc_msgSend(v28, "numberWithBool:", objc_msgSend(v29, "isEnabled"));
    [*(id *)(v50 + 32) setObject:v30 forKeyedSubscript:@"vpn_enabled"];

    v31 = [v18 VPN];
    if ([v31 tunnelType] == 1) {
      v32 = @"Packet";
    }
    else {
      v32 = @"AppProxy";
    }
    [*(id *)(v50 + 32) setObject:v32 forKeyedSubscript:@"vpn_tunnel_type"];

    v33 = [v18 VPN];
    v34 = [v33 protocol];
    v35 = [v34 serverAddress];
    [*(id *)(v50 + 32) setObject:v35 forKeyedSubscript:@"vpn_protocol_server_address"];

    v36 = [*(id *)(v50 + 40) manager];
    v37 = [v36 protocolConfiguration];
    v38 = [v37 dictionary];
    [*(id *)(v50 + 32) setObject:v38 forKeyedSubscript:@"vpn_protocol"];

    dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_41;
    v53[3] = &unk_2643A1B30;
    v40 = *(void **)(v50 + 40);
    id v54 = *(id *)(v50 + 32);
    dispatch_semaphore_t v55 = v39;
    v41 = v39;
    [v40 collectVPNAddressesWithCompletion:v53];
    dispatch_time_t v42 = dispatch_walltime(0, 500000000);
    dispatch_semaphore_wait(v41, v42);
  }
  uint64_t v43 = *(void *)(v50 + 32);
  v44 = [*(id *)(v50 + 40) cachedMetadata];
  [v44 setObject:v43 forKeyedSubscript:@"initial_state"];

  id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
  v46 = v45;
  if (v52) {
    [v45 addObject:v52];
  }
  uint64_t v47 = *(void *)(v50 + 48);
  if (v47)
  {
    uint64_t v48 = *(void *)(v50 + 32);
    v49 = (void *)[v46 copy];
    (*(void (**)(uint64_t, uint64_t, void *))(v47 + 16))(v47, v48, v49);
  }
}

intptr_t __49__NPTVPNCollector_startCollectingWithCompletion___block_invoke_41(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  id v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

- (void)collectVPNAddressesWithCompletion:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = 0;
  v9[1] = 0;
  id v5 = [(NPTVPNCollector *)self config];
  id v6 = [v5 identifier];
  [v6 getUUIDBytes:v9];

  ne_session_create();
  v7 = [(NPTVPNCollector *)self backgroundQueue];
  id v8 = v4;
  ne_session_get_status();
}

uint64_t __53__NPTVPNCollector_collectVPNAddressesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((int)a2 < 2)
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
  else
  {
    id v4 = +[NPTLogger metadata];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219415000, v4, OS_LOG_TYPE_DEFAULT, "Fetching additional info for VPN", v7, 2u);
    }

    return [*(id *)(a1 + 32) getExtendedStatus:a2 session:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)getExtendedStatus:(int)a3 session:(void *)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (a3 == 3)
  {
    id v9 = [(NPTVPNCollector *)self backgroundQueue];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke;
    uint64_t v16 = &unk_2643A1BF8;
    id v17 = v8;
    id v18 = v7;
    ne_session_get_info();

    id v10 = v17;
  }
  else
  {
    v11 = +[NPTLogger metadata];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_219415000, v11, OS_LOG_TYPE_DEFAULT, "VPN Session is Not Connected", v12, 2u);
    }

    id v10 = [NSDictionary dictionaryWithDictionary:v8];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    id v5 = xpc_dictionary_get_value(v3, "VPN");
    id v6 = xpc_dictionary_get_value(v3, "IPv4");
    id v7 = xpc_dictionary_get_value(v3, "IPv6");
    id v8 = xpc_dictionary_get_value(v3, "DNSServers");
    if (MEMORY[0x21D48AEE0]() == MEMORY[0x263EF86D8])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke_2;
      applier[3] = &unk_2643A1BD0;
      id v30 = v4;
      xpc_array_apply(v8, applier);
    }
    id v27 = v5;
    if (v5)
    {
      string = xpc_dictionary_get_string(v5, "RemoteAddress");
      if (string) {
        goto LABEL_6;
      }
      goto LABEL_28;
    }
    id v21 = xpc_dictionary_get_value(v3, "IPSec");
    uint64_t v22 = xpc_dictionary_get_value(v3, "PPP");
    v23 = v22;
    if (v21)
    {
      v24 = "RemoteAddress";
      uint64_t v22 = v21;
    }
    else
    {
      if (!v22)
      {
        string = 0;
LABEL_27:

        if (string)
        {
LABEL_6:
          id v10 = [NSString stringWithUTF8String:string];
          if (v6)
          {
LABEL_7:
            v11 = xpc_dictionary_get_value(v6, "Addresses");
            id v12 = v11;
            if (v11 && xpc_array_get_count(v11) && (uint64_t v13 = xpc_array_get_string(v12, 0)) != 0)
            {
              uint64_t v14 = [NSString stringWithUTF8String:v13];
            }
            else
            {
              uint64_t v14 = 0;
            }

            if (v7) {
              goto LABEL_16;
            }
            goto LABEL_30;
          }
LABEL_29:
          uint64_t v14 = 0;
          if (v7)
          {
LABEL_16:
            id v17 = xpc_dictionary_get_value(v7, "Addresses");
            id v18 = v17;
            if (v17 && xpc_array_get_count(v17) && (uint64_t v19 = xpc_array_get_string(v18, 0)) != 0)
            {
              v20 = [NSString stringWithUTF8String:v19];
            }
            else
            {
              v20 = 0;
            }

            goto LABEL_31;
          }
LABEL_30:
          v20 = 0;
LABEL_31:
          [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"vpn_dns_addresses"];
          [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"vpn_ipv4_address"];
          [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:@"vpn_ipv6_address"];
          [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"vpn_remote_address"];
          uint64_t v25 = *(void *)(a1 + 40);
          id v26 = [NSDictionary dictionaryWithDictionary:*(void *)(a1 + 32)];
          (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

          goto LABEL_32;
        }
LABEL_28:
        id v10 = 0;
        if (v6) {
          goto LABEL_7;
        }
        goto LABEL_29;
      }
      v24 = "CommRemoteAddress";
    }
    string = xpc_dictionary_get_string(v22, v24);
    goto LABEL_27;
  }
  id v15 = +[NPTLogger metadata];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219415000, v15, OS_LOG_TYPE_DEFAULT, "Extended session could not be populated", buf, 2u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v14 = [NSDictionary dictionaryWithDictionary:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);
LABEL_32:
}

uint64_t __63__NPTVPNCollector_getExtendedStatus_session_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x21D48AEE0]() == MEMORY[0x263EF8798])
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v4)];
    [v5 addObject:v6];
  }
  return 1;
}

- (void)vpnNotificationReceived:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [v5 manager];
  id v7 = objc_alloc_init(NPTMetadataEvent);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = [v4 name];

  if (v9 == @"com.apple.networkextension.app-configuration-changed")
  {
    uint64_t v11 = 4;
  }
  else
  {
    id v10 = [v4 name];

    if (v10 == @"com.apple.networkextension.statuschanged") {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 6;
    }
  }
  [(NPTMetadataEvent *)v7 setEventType:v11];
  id v12 = [MEMORY[0x263EFF910] now];
  [(NPTMetadataEvent *)v7 setTimeStamp:v12];

  [(NPTMetadataEvent *)v7 setCollectorType:objc_opt_class()];
  id v13 = objc_alloc_init(MEMORY[0x263F08790]);
  [v13 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isEnabled"));
  [v8 setObject:v14 forKeyedSubscript:@"vpn_enabled"];

  id v15 = [v6 protocolConfiguration];
  uint64_t v16 = [v15 dictionary];
  [v8 setObject:v16 forKeyedSubscript:@"vpn_protocol"];

  id v17 = [v6 connection];
  id v18 = -[NPTVPNCollector getVPNStatusAsString:](self, "getVPNStatusAsString:", [v17 status]);
  [v8 setObject:v18 forKeyedSubscript:@"vpn_status"];

  uint64_t v19 = [v6 connection];
  v20 = [v19 connectedDate];
  id v21 = [v13 stringFromDate:v20];
  [v8 setObject:v21 forKeyedSubscript:@"vpn_connected_date"];

  uint64_t v22 = [(NPTVPNCollector *)self config];

  if (v22)
  {
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __43__NPTVPNCollector_vpnNotificationReceived___block_invoke;
    v36 = &unk_2643A1B30;
    id v37 = v8;
    dispatch_semaphore_t v38 = v23;
    v24 = v23;
    [(NPTVPNCollector *)self collectVPNAddressesWithCompletion:&v33];
    dispatch_time_t v25 = dispatch_walltime(0, 500000000);
    dispatch_semaphore_wait(v24, v25);
  }
  id v26 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:", v8, v33, v34, v35, v36);
  [(NPTMetadataEvent *)v7 setData:v26];

  id v27 = self;
  objc_sync_enter(v27);
  v28 = [(NPTVPNCollector *)v27 cachedMetadata];
  id v29 = [v28 objectForKeyedSubscript:@"events"];
  id v30 = [(NPTMetadataEvent *)v7 asDictionary];
  [v29 addObject:v30];

  objc_sync_exit(v27);
  v31 = [(NPTVPNCollector *)v27 metadataDidChangeHandler];

  if (v31)
  {
    v32 = [(NPTVPNCollector *)v27 metadataDidChangeHandler];
    ((void (**)(void, NPTMetadataEvent *, void))v32)[2](v32, v7, 0);
  }
}

intptr_t __43__NPTVPNCollector_vpnNotificationReceived___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  id v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

- (void)stopCollecting
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(NPTVPNCollector *)self setManager:0];
}

+ (id)collectorName
{
  return @"vpn";
}

- (id)getVPNStatusAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_2643A1C18[a3];
  }
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

- (NEVPNManager)manager
{
  return (NEVPNManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManager:(id)a3
{
}

- (NEConfigurationManager)configManager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigManager:(id)a3
{
}

- (NEConfiguration)config
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
}

- (OS_dispatch_queue)backgroundQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackgroundQueue:(id)a3
{
}

- (NSArray)eventsToMonitor
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEventsToMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsToMonitor, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end