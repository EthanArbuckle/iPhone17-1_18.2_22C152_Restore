@interface RMSBonjourServiceProvider
- (NSNetServiceBrowser)netServiceBrowser;
- (NSString)searchDomain;
- (NSString)searchScope;
- (NSString)searchType;
- (RMSBonjourServiceProvider)init;
- (RMSServiceProviderDelegate)delegate;
- (id)_identifierForNetService:(id)a3;
- (id)_searchString;
- (id)_valueForTXTRecordKey:(id)a3 inTXTDictionary:(id)a4;
- (int64_t)serviceDiscoverySource;
- (int64_t)serviceFlagsFromTXTDictionary:(id)a3;
- (int64_t)serviceTypeFromTXTDictionary:(id)a3;
- (void)_updateCacheWithService:(id)a3 identifier:(id)a4;
- (void)_updateService:(id)a3 withNetService:(id)a4 txtData:(id)a5;
- (void)beginDiscovery;
- (void)dealloc;
- (void)endDiscovery;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RMSBonjourServiceProvider

- (RMSBonjourServiceProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)RMSBonjourServiceProvider;
  v2 = [(RMSBonjourServiceProvider *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    services = v2->_services;
    v2->_services = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    netServiceBrowser = v2->_netServiceBrowser;
    v2->_netServiceBrowser = (NSNetServiceBrowser *)v5;

    [(NSNetServiceBrowser *)v2->_netServiceBrowser setDelegate:v2];
    CFPreferencesAppSynchronize(@"com.apple.RemoteMediaServices");
    v7 = (void *)CFPreferencesCopyAppValue(@"BonjourCacheKey", @"com.apple.RemoteMediaServices");
    uint64_t v8 = [v7 mutableCopy];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v8;

    if (!v2->_cache)
    {
      uint64_t v10 = objc_opt_new();
      v11 = v2->_cache;
      v2->_cache = (NSMutableDictionary *)v10;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSNetServiceBrowser *)self->_netServiceBrowser setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)RMSBonjourServiceProvider;
  [(RMSBonjourServiceProvider *)&v3 dealloc];
}

- (NSString)searchType
{
  return (NSString *)@"_daap._tcp.";
}

- (NSString)searchDomain
{
  return (NSString *)@"local.";
}

- (NSString)searchScope
{
  return 0;
}

- (int64_t)serviceDiscoverySource
{
  return 0;
}

- (void)beginDiscovery
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = [(RMSBonjourServiceProvider *)self _searchString];
  v4 = RMSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Searching for services of type: %@", (uint8_t *)&v7, 0xCu);
  }

  netServiceBrowser = self->_netServiceBrowser;
  v6 = [(RMSBonjourServiceProvider *)self searchDomain];
  [(NSNetServiceBrowser *)netServiceBrowser searchForServicesOfType:v3 inDomain:v6];
}

- (void)endDiscovery
{
}

- (int64_t)serviceTypeFromTXTDictionary:(id)a3
{
  objc_super v3 = [(RMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"DvTy" inTXTDictionary:a3];
  if ([v3 containsString:@"AppleTV"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)serviceFlagsFromTXTDictionary:(id)a3
{
  return 0;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = RMSLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 name];
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "Net service browser did find service: %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v9 = [(RMSBonjourServiceProvider *)self _identifierForNetService:v6];
  [v6 setDelegate:self];
  [v6 startMonitoring];
  uint64_t v10 = objc_opt_new();
  [v10 setState:0];
  [v10 setNetService:v6];
  [(NSMutableDictionary *)self->_services setObject:v10 forKeyedSubscript:v9];
  v11 = [(NSMutableDictionary *)self->_cache objectForKey:v9];
  if (v11)
  {
    v12 = [[RMSService alloc] initWithData:v11];
    [v10 setService:v12];
    [v10 setAvailable:1];
    objc_super v13 = RMSLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "Found cached data for service: %@", (uint8_t *)&v15, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v12];
  }
  else
  {
    v12 = (RMSService *)objc_opt_new();
    [v10 setService:v12];
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v9 = [(RMSBonjourServiceProvider *)self _identifierForNetService:a4];
  id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:");
  if ([v6 isAvailable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v8 = [v6 service];
    [WeakRetained serviceProvider:self serviceDidBecomeUnavailable:v8];
  }
  [(NSMutableDictionary *)self->_services removeObjectForKey:v9];
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RMSBonjourServiceProvider *)self _identifierForNetService:v6];
  id v9 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v8];
  uint64_t v10 = RMSLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v6 name];
    int v18 = 138412290;
    v19 = v11;
    _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "Service txt record update: %@", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v12 = [v9 state];
  if (v12 == 2)
  {
    int v15 = RMSLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_23C83A000, v15, OS_LOG_TYPE_DEFAULT, "DNS resolution already complete for this service, updating clients immediately", (uint8_t *)&v18, 2u);
    }

    v16 = [v9 service];
    [(RMSBonjourServiceProvider *)self _updateService:v16 withNetService:v6 txtData:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v16];

    [(RMSBonjourServiceProvider *)self _updateCacheWithService:v16 identifier:v8];
  }
  else if (!v12)
  {
    objc_super v13 = RMSLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v6 name];
      int v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "Performing DNS resolution for service: %@", (uint8_t *)&v18, 0xCu);
    }
    [v9 setState:1];
    [v6 resolveWithTimeout:10.0];
  }
}

- (void)_updateCacheWithService:(id)a3 identifier:(id)a4
{
  cache = self->_cache;
  id v7 = a4;
  uint64_t v8 = [a3 data];
  [(NSMutableDictionary *)cache setObject:v8 forKey:v7];

  CFPreferencesSetAppValue(@"BonjourCacheKey", self->_cache, @"com.apple.RemoteMediaServices");
  CFPreferencesAppSynchronize(@"com.apple.RemoteMediaServices");
}

- (void)netServiceDidResolveAddress:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RMSBonjourServiceProvider *)self _identifierForNetService:v4];
  id v6 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v5];
  [v6 setAvailable:1];
  [v6 setState:2];
  id v7 = [v6 service];
  uint64_t v8 = [v4 TXTRecordData];
  [(RMSBonjourServiceProvider *)self _updateService:v7 withNetService:v4 txtData:v8];

  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v4 name];
    v11 = [v7 displayName];
    uint64_t v12 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v12);
    int v15 = 138412802;
    v16 = v10;
    __int16 v17 = 2112;
    int v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Service [%@] resolved and fully available: %@, source: %@", (uint8_t *)&v15, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v7];

  [(RMSBonjourServiceProvider *)self _updateCacheWithService:v7 identifier:v5];
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v4 = a3;
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[RMSBonjourServiceProvider netService:didNotResolve:](v4, v5);
  }

  [v4 resolveWithTimeout:30.0];
}

- (void)_updateService:(id)a3 withNetService:(id)a4 txtData:(id)a5
{
  id v16 = a3;
  uint64_t v8 = (void *)MEMORY[0x263F089E8];
  id v9 = a4;
  uint64_t v10 = [v8 dictionaryFromTXTRecordData:a5];
  v11 = [v9 name];
  [v16 setNetworkName:v11];

  uint64_t v12 = [v9 hostName];
  [v16 setHostName:v12];

  uint64_t v13 = [v9 port];
  [v16 setPort:v13];
  objc_msgSend(v16, "setServiceType:", -[RMSBonjourServiceProvider serviceTypeFromTXTDictionary:](self, "serviceTypeFromTXTDictionary:", v10));
  objc_msgSend(v16, "setServiceFlags:", -[RMSBonjourServiceProvider serviceFlagsFromTXTDictionary:](self, "serviceFlagsFromTXTDictionary:", v10));
  v14 = [(RMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"hG" inTXTDictionary:v10];
  [v16 setHomeSharingGroupKey:v14];
  objc_msgSend(v16, "setServiceDiscoverySource:", -[RMSBonjourServiceProvider serviceDiscoverySource](self, "serviceDiscoverySource"));
  int v15 = [(RMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"Name" inTXTDictionary:v10];
  if (!v15)
  {
    int v15 = [(RMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"Machine Name" inTXTDictionary:v10];
    if (!v15)
    {
      int v15 = [(RMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"CtlN" inTXTDictionary:v10];
    }
  }
  [v16 setDisplayName:v15];
}

- (id)_valueForTXTRecordKey:(id)a3 inTXTDictionary:(id)a4
{
  id v4 = [a4 objectForKey:a3];
  if ([v4 length])
  {
    uint64_t v5 = [v4 bytes];
    id v6 = [NSString stringWithUTF8String:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_identifierForNetService:(id)a3
{
  objc_super v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = [v4 type];
  id v7 = [v4 domain];

  uint64_t v8 = [v3 stringWithFormat:@"%@%@%@", v5, v6, v7];

  return v8;
}

- (id)_searchString
{
  objc_super v3 = [(RMSBonjourServiceProvider *)self searchType];
  id v4 = [(RMSBonjourServiceProvider *)self searchScope];
  if (v4)
  {
    id v5 = [NSString stringWithFormat:@"%@,_%@", v3, v4];
  }
  else
  {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (RMSServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSServiceProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return self->_netServiceBrowser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)netService:(void *)a1 didNotResolve:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = [a1 name];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Service did not resolve: %@", (uint8_t *)&v4, 0xCu);
}

@end