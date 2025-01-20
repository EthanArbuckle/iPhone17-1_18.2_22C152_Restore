@interface TVRMSDiscoverySession
+ (id)localDiscoverySession;
+ (id)proxyDiscoverySession;
- (BOOL)isNetworkAvailable;
- (NSArray)availableServices;
- (NSArray)pairedNetworkNames;
- (TVRMSDiscoverySession)init;
- (TVRMSDiscoverySessionDelegate)delegate;
- (id)_providerForDiscoveryType:(int64_t)a3;
- (int64_t)discoveryTypes;
- (void)_enableProviders;
- (void)_handleHSGroupIDDidChangeNotification:(id)a3;
- (void)_updateWifiAvailability;
- (void)beginDiscovery;
- (void)dealloc;
- (void)endDiscovery;
- (void)serviceProvider:(id)a3 serviceDidBecomeAvailable:(id)a4;
- (void)serviceProvider:(id)a3 serviceDidBecomeUnavailable:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryTypes:(int64_t)a3;
- (void)setPairedNetworkNames:(id)a3;
@end

@implementation TVRMSDiscoverySession

+ (id)localDiscoverySession
{
  v2 = objc_alloc_init(TVRMSDiscoverySession);

  return v2;
}

+ (id)proxyDiscoverySession
{
  v2 = objc_alloc_init(TVRMSDiscoverySessionProxy);

  return v2;
}

- (TVRMSDiscoverySession)init
{
  v9.receiver = self;
  v9.super_class = (Class)TVRMSDiscoverySession;
  v2 = [(TVRMSDiscoverySession *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    availableServices = v2->_availableServices;
    v2->_availableServices = (NSMutableSet *)v3;

    uint64_t v5 = +[TVRMSReachability reachabilityForLocalWiFi];
    reachability = v2->_reachability;
    v2->_reachability = (TVRMSReachability *)v5;

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__handleHSGroupIDDidChangeNotification_ name:*MEMORY[0x263F49A90] object:0];
    [v7 addObserver:v2 selector:sel__handleReachabilityChangedNotification_ name:kReachabilityChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(TVRMSDiscoverySession *)self endDiscovery];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVRMSDiscoverySession;
  [(TVRMSDiscoverySession *)&v4 dealloc];
}

- (void)beginDiscovery
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TVRMSDiscoverySession *)self endDiscovery];
  [(TVRMSDiscoverySession *)self _enableProviders];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_providers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "beginDiscovery", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(TVRMSReachability *)self->_reachability startNotifier];
  [(TVRMSDiscoverySession *)self _updateWifiAvailability];
}

- (void)endDiscovery
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TVRMSReachability *)self->_reachability stopNotifier];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_providers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "endDiscovery", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_availableServices removeAllObjects];
}

- (NSArray)availableServices
{
  return (NSArray *)[(NSMutableSet *)self->_availableServices allObjects];
}

- (void)setPairedNetworkNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }
  p_pairedNetworkNames = &self->_pairedNetworkNames;
  objc_storeStrong((id *)&self->_pairedNetworkNames, v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_providers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v12, "setPairedNetworkNames:", *p_pairedNetworkNames, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)serviceProvider:(id)a3 serviceDidBecomeAvailable:(id)a4
{
  if (a4)
  {
    [(NSMutableSet *)self->_availableServices addObject:a4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained discoverySessionDidUpdateAvailableServices:self];
  }
}

- (void)serviceProvider:(id)a3 serviceDidBecomeUnavailable:(id)a4
{
  [(NSMutableSet *)self->_availableServices removeObject:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained discoverySessionDidUpdateAvailableServices:self];
}

- (void)_enableProviders
{
  uint64_t v3 = (NSArray *)objc_opt_new();
  int64_t discoveryTypes = self->_discoveryTypes;
  if (discoveryTypes >= 1)
  {
    for (uint64_t i = 1; i <= discoveryTypes; i *= 2)
    {
      if ((discoveryTypes & i) != 0)
      {
        uint64_t v6 = [(TVRMSDiscoverySession *)self _providerForDiscoveryType:i];
        uint64_t v7 = v6;
        if (v6)
        {
          [v6 setDelegate:self];
          [(NSArray *)v3 addObject:v7];
        }

        int64_t discoveryTypes = self->_discoveryTypes;
      }
    }
  }
  providers = self->_providers;
  self->_providers = v3;
}

- (id)_providerForDiscoveryType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 4:
      uint64_t v6 = _TVRCRMSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Enabling pairing discovery provider", (uint8_t *)&v10, 2u);
      }

      uint64_t v7 = objc_opt_new();
      [v7 setPairedNetworkNames:self->_pairedNetworkNames];
      break;
    case 2:
      id v4 = _TVRCRMSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Enabling appleTV discovery provider", (uint8_t *)&v10, 2u);
      }
      goto LABEL_12;
    case 1:
      id v4 = _TVRCRMSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Enabling home-sharing discovery provider", (uint8_t *)&v10, 2u);
      }
LABEL_12:

      uint64_t v7 = objc_opt_new();
      break;
    default:
      uint64_t v8 = _TVRCRMSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        int64_t v11 = a3;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Discovery controller attempted to enable unknown provider type: %td", (uint8_t *)&v10, 0xCu);
      }

      uint64_t v7 = 0;
      break;
  }

  return v7;
}

- (void)_handleHSGroupIDDidChangeNotification:(id)a3
{
  id v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Home sharing ID changed, restarting discovery", v5, 2u);
  }

  [(TVRMSDiscoverySession *)self endDiscovery];
  [(TVRMSDiscoverySession *)self beginDiscovery];
}

- (void)_updateWifiAvailability
{
  BOOL v3 = [(TVRMSReachability *)self->_reachability currentReachabilityStatus] != 0;
  if (self->_networkAvailable != v3)
  {
    self->_networkAvailable = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 discoverySessionNetworkAvailabilityDidChange:self];
    }
  }
}

- (TVRMSDiscoverySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSDiscoverySessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)discoveryTypes
{
  return self->_discoveryTypes;
}

- (void)setDiscoveryTypes:(int64_t)a3
{
  self->_int64_t discoveryTypes = a3;
}

- (BOOL)isNetworkAvailable
{
  return self->_networkAvailable;
}

- (NSArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_availableServices, 0);

  objc_storeStrong((id *)&self->_reachability, 0);
}

@end