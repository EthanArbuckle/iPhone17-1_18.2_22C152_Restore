@interface TVRMSBonjourServiceProvider
- (NSNetServiceBrowser)netServiceBrowser;
- (NSString)searchDomain;
- (NSString)searchScope;
- (NSString)searchType;
- (TVRMSBonjourServiceProvider)init;
- (TVRMSServiceProviderDelegate)delegate;
- (id)_identifierForNetService:(id)a3;
- (id)_searchString;
- (id)_valueForTXTRecordKey:(id)a3 inTXTDictionary:(id)a4;
- (int64_t)serviceDiscoverySource;
- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3;
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

@implementation TVRMSBonjourServiceProvider

- (TVRMSBonjourServiceProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)TVRMSBonjourServiceProvider;
  v2 = [(TVRMSBonjourServiceProvider *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    services = v2->_services;
    v2->_services = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    netServiceBrowser = v2->_netServiceBrowser;
    v2->_netServiceBrowser = (NSNetServiceBrowser *)v5;

    [(NSNetServiceBrowser *)v2->_netServiceBrowser setDelegate:v2];
    CFPreferencesAppSynchronize(@"com.apple.TVRemoteMediaServices");
    v7 = (void *)CFPreferencesCopyAppValue(@"BonjourCacheKey", @"com.apple.TVRemoteMediaServices");
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
  v3.super_class = (Class)TVRMSBonjourServiceProvider;
  [(TVRMSBonjourServiceProvider *)&v3 dealloc];
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
  objc_super v3 = [(TVRMSBonjourServiceProvider *)self _searchString];
  v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Searching for services of type: %@", (uint8_t *)&v7, 0xCu);
  }

  netServiceBrowser = self->_netServiceBrowser;
  v6 = [(TVRMSBonjourServiceProvider *)self searchDomain];
  [(NSNetServiceBrowser *)netServiceBrowser searchForServicesOfType:v3 inDomain:v6];
}

- (void)endDiscovery
{
}

- (int64_t)serviceTypeFromTXTDictionary:(id)a3
{
  objc_super v3 = [(TVRMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"DvTy" inTXTDictionary:a3];
  if ([v3 containsString:@"AppleTV"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3
{
  return 0;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _TVRCRMSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 name];
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Net service browser did find service: %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v9 = [(TVRMSBonjourServiceProvider *)self _identifierForNetService:v6];
  [v6 setDelegate:self];
  [v6 startMonitoring];
  uint64_t v10 = objc_opt_new();
  [v10 setState:0];
  [v10 setNetService:v6];
  [(NSMutableDictionary *)self->_services setObject:v10 forKeyedSubscript:v9];
  v11 = [(NSMutableDictionary *)self->_cache objectForKey:v9];
  if (v11)
  {
    v12 = [[TVRMSService alloc] initWithData:v11];
    [v10 setService:v12];
    [v10 setAvailable:1];
    objc_super v13 = _TVRCRMSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Found cached data for service: %@", (uint8_t *)&v15, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v12];
  }
  else
  {
    v12 = (TVRMSService *)objc_opt_new();
    [v10 setService:v12];
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v9 = [(TVRMSBonjourServiceProvider *)self _identifierForNetService:a4];
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
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TVRMSBonjourServiceProvider *)self _identifierForNetService:v6];
  id v9 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v8];
  uint64_t v10 = _TVRCRMSLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11)
    {
LABEL_16:

      goto LABEL_17;
    }
    v16 = [v6 name];
    int v20 = 138412290;
    v21 = v16;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Service no longer exists for: %@", (uint8_t *)&v20, 0xCu);
LABEL_11:

    goto LABEL_16;
  }
  if (v11)
  {
    v12 = [v6 name];
    int v20 = 138412290;
    v21 = v12;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Service txt record update: %@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v13 = [v9 state];
  if (v13 == 2)
  {
    uint64_t v17 = _TVRCRMSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_2266D3000, v17, OS_LOG_TYPE_DEFAULT, "DNS resolution already complete for this service, updating clients immediately", (uint8_t *)&v20, 2u);
    }

    uint64_t v10 = [v9 service];
    if (v10)
    {
      [(TVRMSBonjourServiceProvider *)self _updateService:v10 withNetService:v6 txtData:v7];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v10];

      [(TVRMSBonjourServiceProvider *)self _updateCacheWithService:v10 identifier:v8];
      goto LABEL_16;
    }
    v16 = _TVRCRMSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v6 name];
      int v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "Bonjour service no longer exists for: %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_11;
  }
  if (!v13)
  {
    v14 = _TVRCRMSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 name];
      int v20 = 138412290;
      v21 = v15;
      _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "Performing DNS resolution for service: %@", (uint8_t *)&v20, 0xCu);
    }
    [v9 setState:1];
    [v6 resolveWithTimeout:10.0];
  }
LABEL_17:
}

- (void)_updateCacheWithService:(id)a3 identifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 data];
  if (v8)
  {
    [(NSMutableDictionary *)self->_cache setObject:v8 forKey:v7];
    CFPreferencesSetAppValue(@"BonjourCacheKey", self->_cache, @"com.apple.TVRemoteMediaServices");
    CFPreferencesAppSynchronize(@"com.apple.TVRemoteMediaServices");
  }
  else
  {
    id v9 = _TVRCRMSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Unable to update service cache: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)netServiceDidResolveAddress:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVRMSBonjourServiceProvider *)self _identifierForNetService:v4];
  id v6 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v5];
  id v7 = v6;
  if (!v6)
  {
    uint64_t v8 = _TVRCRMSLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    v16 = [v4 name];
    int v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Service no longer exists for: %@", (uint8_t *)&v18, 0xCu);
LABEL_10:

    goto LABEL_11;
  }
  [v6 setAvailable:1];
  [v7 setState:2];
  uint64_t v8 = [v7 service];
  if (!v8)
  {
    v16 = _TVRCRMSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v4 name];
      int v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "Bonjour service no longer exists for: %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_10;
  }
  id v9 = [v4 TXTRecordData];
  [(TVRMSBonjourServiceProvider *)self _updateService:v8 withNetService:v4 txtData:v9];

  int v10 = _TVRCRMSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v4 name];
    uint64_t v12 = [v8 displayName];
    uint64_t v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    int v18 = 138412802;
    v19 = v11;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Service [%@] resolved and fully available: %@, source: %@", (uint8_t *)&v18, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v8];

  [(TVRMSBonjourServiceProvider *)self _updateCacheWithService:v8 identifier:v5];
LABEL_11:
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Service did not resolve: %@", (uint8_t *)&v7, 0xCu);
  }
  [v4 resolveWithTimeout:30.0];
}

- (void)_updateService:(id)a3 withNetService:(id)a4 txtData:(id)a5
{
  id v16 = a3;
  uint64_t v8 = (void *)MEMORY[0x263F089E8];
  id v9 = a4;
  int v10 = [v8 dictionaryFromTXTRecordData:a5];
  id v11 = [v9 name];
  [v16 setNetworkName:v11];

  uint64_t v12 = [v9 hostName];
  [v16 setHostName:v12];

  uint64_t v13 = [v9 port];
  [v16 setPort:v13];
  objc_msgSend(v16, "setServiceType:", -[TVRMSBonjourServiceProvider serviceTypeFromTXTDictionary:](self, "serviceTypeFromTXTDictionary:", v10));
  objc_msgSend(v16, "setServiceLegacyFlags:", -[TVRMSBonjourServiceProvider serviceLegacyFlagsFromTXTDictionary:](self, "serviceLegacyFlagsFromTXTDictionary:", v10));
  v14 = [(TVRMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"hG" inTXTDictionary:v10];
  [v16 setHomeSharingGroupKey:v14];
  objc_msgSend(v16, "setServiceDiscoverySource:", -[TVRMSBonjourServiceProvider serviceDiscoverySource](self, "serviceDiscoverySource"));
  int v15 = [(TVRMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"Name" inTXTDictionary:v10];
  if (!v15)
  {
    int v15 = [(TVRMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"Machine Name" inTXTDictionary:v10];
    if (!v15)
    {
      int v15 = [(TVRMSBonjourServiceProvider *)self _valueForTXTRecordKey:@"CtlN" inTXTDictionary:v10];
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
  int v7 = [v4 domain];

  uint64_t v8 = [v3 stringWithFormat:@"%@%@%@", v5, v6, v7];

  return v8;
}

- (id)_searchString
{
  objc_super v3 = [(TVRMSBonjourServiceProvider *)self searchType];
  id v4 = [(TVRMSBonjourServiceProvider *)self searchScope];
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

- (TVRMSServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSServiceProviderDelegate *)WeakRetained;
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

@end