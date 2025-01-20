@interface RMSDiscoverySessionProxy
- (BOOL)isNetworkAvailable;
- (NSArray)availableServices;
- (NSArray)pairedNetworkNames;
- (RMSDiscoverySessionDelegate)delegate;
- (RMSDiscoverySessionProxy)init;
- (int64_t)discoveryTypes;
- (void)_availableServicesDidUpdateNotification:(id)a3;
- (void)_handleSessionDidEndNotification:(id)a3;
- (void)_updateNetworkAvailability;
- (void)_wifiAvailabilityDidChange:(id)a3;
- (void)beginDiscovery;
- (void)dealloc;
- (void)endDiscovery;
- (void)heartbeatDidFail;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryTypes:(int64_t)a3;
- (void)setPairedNetworkNames:(id)a3;
@end

@implementation RMSDiscoverySessionProxy

- (RMSDiscoverySessionProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)RMSDiscoverySessionProxy;
  v2 = [(RMSSessionProxy *)&v7 initWithTimeout:*(double *)&RMSDiscoverySessionTimeout];
  if (v2)
  {
    uint64_t v3 = +[RMSIDSClient sharedClient];
    idsClient = v2->_idsClient;
    v2->_idsClient = (RMSIDSClient *)v3;

    v2->_wifiAvailable = 1;
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__availableServicesDidUpdateNotification_ name:@"RMSIDSClientAvailableServicesDidUpdateNotification" object:0];
    [v5 addObserver:v2 selector:sel__handleSessionDidEndNotification_ name:@"RMSIDSClientSessionDidEndNotification" object:0];
    [v5 addObserver:v2 selector:sel__companionAvailabilityDidChange_ name:@"RMSIDSClientCompanionAvailabilityDidChangeNotification" object:0];
    [v5 addObserver:v2 selector:sel__wifiAvailabilityDidChange_ name:@"RMSIDSClientWifiAvailabilityDidChangeNotification" object:0];
    [(RMSDiscoverySessionProxy *)v2 _updateNetworkAvailability];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RMSDiscoverySessionProxy;
  [(RMSSessionProxy *)&v4 dealloc];
}

- (void)beginDiscovery
{
  if (!self->_discovering)
  {
    self->_discovering = 1;
    objc_initWeak(&location, self);
    idsClient = self->_idsClient;
    uint64_t discoveryTypes_low = LODWORD(self->_discoveryTypes);
    pairedNetworkNames = self->_pairedNetworkNames;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__RMSDiscoverySessionProxy_beginDiscovery__block_invoke;
    v6[3] = &unk_264E74080;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [(RMSIDSClient *)idsClient beginDiscoverySessionWithDiscoveryTypes:discoveryTypes_low pairedNetworkNames:pairedNetworkNames completionHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __42__RMSDiscoverySessionProxy_beginDiscovery__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v9 = RMSLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Begin discovery success, session established", buf, 2u);
      }

      [v8 setSessionIdentifier:a3];
      [v8 beginHeartbeat];
      *((void *)v8 + 6) = 0;
    }
    else
    {
      v10 = (void *)WeakRetained[10];
      WeakRetained[10] = 0;

      *((unsigned char *)v8 + 56) = 0;
      uint64_t v11 = *((void *)v8 + 6);
      if (v11 >= 7) {
        uint64_t v11 = 7;
      }
      *((void *)v8 + 6) = v11 + 1;
      id v12 = objc_loadWeakRetained((id *)v8 + 8);
      [v12 discoverySessionDidUpdateAvailableServices:*(void *)(a1 + 32)];

      dispatch_time_t v13 = dispatch_time(0, 1000000000 * *((void *)v8 + 6));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__RMSDiscoverySessionProxy_beginDiscovery__block_invoke_12;
      block[3] = &unk_264E74058;
      objc_copyWeak(&v15, v6);
      dispatch_after(v13, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v15);
    }
  }
}

void __42__RMSDiscoverySessionProxy_beginDiscovery__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained beginDiscovery];
}

- (void)setPairedNetworkNames:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_pairedNetworkNames, a3);
  if ([(RMSSessionProxy *)self sessionIdentifier]) {
    [(RMSIDSClient *)self->_idsClient updatePairedNetworkNames:self->_pairedNetworkNames sessionIdentifier:[(RMSSessionProxy *)self sessionIdentifier]];
  }
}

- (void)heartbeatDidFail
{
  self->_discovering = 0;
  [(RMSDiscoverySessionProxy *)self beginDiscovery];
}

- (void)endDiscovery
{
  uint64_t v3 = RMSLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23C83A000, v3, OS_LOG_TYPE_DEFAULT, "end discovery invoked", v5, 2u);
  }

  if ([(RMSSessionProxy *)self sessionIdentifier])
  {
    [(RMSIDSClient *)self->_idsClient endDiscoverySession:[(RMSSessionProxy *)self sessionIdentifier]];
    [(RMSSessionProxy *)self setSessionIdentifier:0];
  }
  availableServices = self->_availableServices;
  self->_availableServices = 0;

  self->_discovering = 0;
  [(RMSSessionProxy *)self endHeartbeat];
}

- (void)_availableServicesDidUpdateNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(RMSSessionProxy *)self sessionMatchesNotification:v4])
  {
    id v5 = [v4 userInfo];
    v6 = [v5 objectForKeyedSubscript:@"RMSIDSClientAvailableServicesNotificationKey"];
    availableServices = self->_availableServices;
    self->_availableServices = v6;

    id v8 = RMSLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_availableServices;
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "Discovery proxy handling available services update: %@", (uint8_t *)&v11, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained discoverySessionDidUpdateAvailableServices:self];
  }
}

- (void)_handleSessionDidEndNotification:(id)a3
{
  if ([(RMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__RMSDiscoverySessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_264E740A8;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __61__RMSDiscoverySessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) endHeartbeat];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 56))
  {
    *(unsigned char *)(v3 + 56) = 0;
    id v4 = *(void **)(a1 + 32);
    return [v4 beginDiscovery];
  }
  return result;
}

- (void)_wifiAvailabilityDidChange:(id)a3
{
  id v6 = a3;
  if (-[RMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    id v4 = [v6 userInfo];
    id v5 = [v4 objectForKey:@"RMSIDSClientWifiAvailabilityNotificationKey"];
    self->_wifiAvailable = [v5 BOOLValue];

    [(RMSDiscoverySessionProxy *)self _updateNetworkAvailability];
  }
}

- (void)_updateNetworkAvailability
{
  if ([(RMSIDSClient *)self->_idsClient isCompanionAvailable]) {
    BOOL wifiAvailable = self->_wifiAvailable;
  }
  else {
    BOOL wifiAvailable = 0;
  }
  if (self->_networkAvailable != wifiAvailable)
  {
    self->_networkAvailable = wifiAvailable;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 discoverySessionNetworkAvailabilityDidChange:self];
    }
  }
}

- (RMSDiscoverySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSDiscoverySessionDelegate *)WeakRetained;
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
  self->_discoveryTypes = a3;
}

- (NSArray)availableServices
{
  return self->_availableServices;
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
  objc_storeStrong((id *)&self->_availableServices, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsClient, 0);
}

@end