@interface TVRMSPairingServiceProvider
- (NSArray)pairedNetworkNames;
- (TVRMSPairingServiceProvider)init;
- (id)searchType;
- (int64_t)serviceDiscoverySource;
- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3;
- (void)dealloc;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)setPairedNetworkNames:(id)a3;
@end

@implementation TVRMSPairingServiceProvider

- (TVRMSPairingServiceProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVRMSPairingServiceProvider;
  v2 = [(TVRMSBonjourServiceProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    unmonitoredServices = v2->_unmonitoredServices;
    v2->_unmonitoredServices = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    monitoredServices = v2->_monitoredServices;
    v2->_monitoredServices = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVRMSPairingServiceProvider;
  [(TVRMSBonjourServiceProvider *)&v4 dealloc];
}

- (id)searchType
{
  return @"_touch-able._tcp.";
}

- (int64_t)serviceDiscoverySource
{
  return 2;
}

- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3
{
  id v4 = a3;
  if ([(TVRMSBonjourServiceProvider *)self serviceTypeFromTXTDictionary:v4] == 2)
  {
    uint64_t v5 = [v4 objectForKey:@"OSsi"];
    int64_t v6 = v5 != 0;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)setPairedNetworkNames:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  p_pairedNetworkNames = &self->_pairedNetworkNames;
  uint64_t v5 = self->_pairedNetworkNames;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10, p_pairedNetworkNames, v22) & 1) == 0)
        {
          v11 = [(NSMutableDictionary *)self->_monitoredServices objectForKeyedSubscript:v10];
          [(NSMutableDictionary *)self->_monitoredServices removeObjectForKey:v10];
          [(NSMutableDictionary *)self->_unmonitoredServices setObject:v11 forKeyedSubscript:v10];
          v12 = [(TVRMSBonjourServiceProvider *)self netServiceBrowser];
          [(TVRMSBonjourServiceProvider *)self netServiceBrowser:v12 didRemoveService:v11 moreComing:1];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  objc_storeStrong((id *)p_pairedNetworkNames, v22);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = *p_pairedNetworkNames;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_unmonitoredServices, "objectForKeyedSubscript:", v18, p_pairedNetworkNames);
        if (v19)
        {
          [(NSMutableDictionary *)self->_unmonitoredServices removeObjectForKey:v18];
          v20 = [(TVRMSBonjourServiceProvider *)self netServiceBrowser];
          [(TVRMSPairingServiceProvider *)self netServiceBrowser:v20 didFindService:v19 moreComing:1];
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 name];
  pairedNetworkNames = self->_pairedNetworkNames;
  if (pairedNetworkNames && ![(NSArray *)pairedNetworkNames containsObject:v10])
  {
    v13 = _TVRCRMSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Discovered a paired service with network name [%@] that doesn't have a matching pairing record, disregarding", buf, 0xCu);
    }

    v12 = &OBJC_IVAR___TVRMSPairingServiceProvider__unmonitoredServices;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TVRMSPairingServiceProvider;
    [(TVRMSBonjourServiceProvider *)&v14 netServiceBrowser:v8 didFindService:v9 moreComing:v5];
    v12 = &OBJC_IVAR___TVRMSPairingServiceProvider__monitoredServices;
  }
  [*(id *)((char *)&self->super.super.isa + *v12) setObject:v9 forKeyedSubscript:v10];
}

- (NSArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
  objc_storeStrong((id *)&self->_monitoredServices, 0);

  objc_storeStrong((id *)&self->_unmonitoredServices, 0);
}

@end