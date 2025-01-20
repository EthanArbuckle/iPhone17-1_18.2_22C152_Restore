@interface RMSPairingServiceProvider
- (NSArray)pairedNetworkNames;
- (RMSPairingServiceProvider)init;
- (id)searchType;
- (int64_t)serviceDiscoverySource;
- (int64_t)serviceFlagsFromTXTDictionary:(id)a3;
- (void)dealloc;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)setPairedNetworkNames:(id)a3;
@end

@implementation RMSPairingServiceProvider

- (RMSPairingServiceProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)RMSPairingServiceProvider;
  v2 = [(RMSBonjourServiceProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    unmonitoredServices = v2->_unmonitoredServices;
    v2->_unmonitoredServices = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RMSPairingServiceProvider;
  [(RMSBonjourServiceProvider *)&v4 dealloc];
}

- (id)searchType
{
  return @"_touch-able._tcp.";
}

- (int64_t)serviceDiscoverySource
{
  return 2;
}

- (int64_t)serviceFlagsFromTXTDictionary:(id)a3
{
  return [(RMSBonjourServiceProvider *)self serviceTypeFromTXTDictionary:a3] == 2;
}

- (void)setPairedNetworkNames:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_pairedNetworkNames, a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v6 = self->_pairedNetworkNames;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_unmonitoredServices, "objectForKeyedSubscript:", v11, (void)v14);
        if (v12)
        {
          [(NSMutableDictionary *)self->_unmonitoredServices removeObjectForKey:v11];
          v13 = [(RMSBonjourServiceProvider *)self netServiceBrowser];
          [(RMSPairingServiceProvider *)self netServiceBrowser:v13 didFindService:v12 moreComing:1];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 name];
  pairedNetworkNames = self->_pairedNetworkNames;
  if (pairedNetworkNames && ![(NSArray *)pairedNetworkNames containsObject:v10])
  {
    v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v15 = v10;
      _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "Discovered a paired service with network name [%@] that doesn't have a matching pairing record, disregarding", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_unmonitoredServices setObject:v9 forKeyedSubscript:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)RMSPairingServiceProvider;
    [(RMSBonjourServiceProvider *)&v13 netServiceBrowser:v8 didFindService:v9 moreComing:v5];
  }
}

- (NSArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
  objc_storeStrong((id *)&self->_unmonitoredServices, 0);
}

@end