@interface MRExternalDeviceController
+ (Class)externalDeviceClass;
- (BOOL)_isManagedConfigIDAllowed:(id)a3;
- (BOOL)isDiscovering;
- (MRExternalDeviceController)initWithBonjourServiceType:(id)a3;
- (MRExternalDeviceControllerDelegate)delegate;
- (NSString)bonjourServiceType;
- (void)beginDiscovery;
- (void)dealloc;
- (void)endDiscovery;
- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRExternalDeviceController

+ (Class)externalDeviceClass
{
  return (Class)objc_opt_class();
}

- (MRExternalDeviceController)initWithBonjourServiceType:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"MRExternalDeviceController.m", 58, @"Invalid parameter not satisfying: %@", @"bonjourServiceType" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)MRExternalDeviceController;
  v6 = [(MRExternalDeviceController *)&v28 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bonjourServiceType = v6->_bonjourServiceType;
    v6->_bonjourServiceType = (NSString *)v7;

    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v12;

    v14 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x1E4F18D68]);
    serviceBrowser = v6->_serviceBrowser;
    v6->_serviceBrowser = v14;

    [(NSNetServiceBrowser *)v6->_serviceBrowser setDelegate:v6];
    v16 = +[MRUserSettings currentSettings];
    uint64_t v17 = [v16 usePeerToPeerExternalDeviceConnections];

    v18 = _MRLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = @"NO";
      if (v17) {
        v19 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Configuring external device net service browser with includesPeerToPeer = %@", buf, 0xCu);
    }

    [(NSNetServiceBrowser *)v6->_serviceBrowser setIncludesPeerToPeer:v17];
    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    discoveredDevices = v6->_discoveredDevices;
    v6->_discoveredDevices = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    resolvingServices = v6->_resolvingServices;
    v6->_resolvingServices = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    monitoringServices = v6->_monitoringServices;
    v6->_monitoringServices = v24;
  }
  return v6;
}

- (void)dealloc
{
  [(MRExternalDeviceController *)self endDiscovery];
  [(NSNetServiceBrowser *)self->_serviceBrowser setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MRExternalDeviceController;
  [(MRExternalDeviceController *)&v3 dealloc];
}

- (void)beginDiscovery
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_discovering)
  {
    objc_super v3 = _MRLogForCategory(3uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bonjourServiceType = self->_bonjourServiceType;
      int v5 = 138543362;
      v6 = bonjourServiceType;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "Beginning network service search for %{public}@...", (uint8_t *)&v5, 0xCu);
    }

    [(NSNetServiceBrowser *)self->_serviceBrowser searchForServicesOfType:self->_bonjourServiceType inDomain:@"local"];
    self->_discovering = 1;
  }
}

- (void)endDiscovery
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_discovering)
  {
    objc_super v3 = _MRLogForCategory(3uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bonjourServiceType = self->_bonjourServiceType;
      int v5 = 138543362;
      v6 = bonjourServiceType;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "Stopping network service search for %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(NSNetServiceBrowser *)self->_serviceBrowser stop];
    self->_discovering = 0;
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6 = a4;
  uint64_t v7 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDeviceController netServiceBrowser:didFindService:moreComing:]();
  }

  [v6 setDelegate:self];
  [(NSMutableSet *)self->_resolvingServices addObject:v6];
  v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v6 scheduleInRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

  [v6 startMonitoring];
  [(NSMutableSet *)self->_monitoringServices addObject:v6];
  [v6 resolveWithTimeout:10.0];
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDeviceController netServiceBrowser:didRemoveService:moreComing:]();
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = self->_discoveredDevices;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "name", (void)v22);
        v15 = [v6 name];
        char v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          id v17 = v13;

          if (v17)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            char v19 = objc_opt_respondsToSelector();

            if (v19)
            {
              id v20 = objc_loadWeakRetained((id *)&self->_delegate);
              [v20 externalDeviceController:self didRemoveDevice:v17];
            }
            [(NSMutableSet *)self->_discoveredDevices removeObject:v17];
          }
          goto LABEL_16;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = 0;
LABEL_16:
  objc_msgSend(v6, "stopMonitoring", (void)v22);
  [v6 setDelegate:0];
  v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v6 removeFromRunLoop:v21 forMode:*MEMORY[0x1E4F1C4B0]];

  [(NSMutableSet *)self->_monitoringServices removeObject:v6];
  [(NSMutableSet *)self->_resolvingServices removeObject:v6];
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4 = a3;
  int v5 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDeviceController netServiceDidResolveAddress:]();
  }

  id v6 = +[MRExternalDeviceManager sharedManager];
  uint64_t v7 = +[MRNetServiceTransport createDeviceInfoFromNetService:v4];
  v8 = [v7 identifier];
  uint64_t v9 = [v6 deviceWithIdentifier:v8];

  if (!v9)
  {
    uint64_t v10 = [[MRNetServiceTransport alloc] initWithNetService:v4];
    [(MRNetServiceTransport *)v10 setRequiresCustomPairing:[(NSString *)self->_bonjourServiceType isEqualToString:@"_mediaremotetv._tcp."]];
  }
  uint64_t v11 = (void *)MRPairedDeviceCopyManagedConfigDeviceID(v7);
  dispatch_queue_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 bundleIdentifier];

  v14 = [MEMORY[0x1E4F28F80] processInfo];
  v15 = [v14 processName];

  if (([v13 isEqualToString:@"com.apple.TVRemote"] & 1) == 0
    && ([v13 isEqualToString:@"com.apple.tvremotecore.xpc"] & 1) == 0
    && ![v15 isEqualToString:@"tvremoted"]
    || [(MRExternalDeviceController *)self _isManagedConfigIDAllowed:v11])
  {
    [(NSMutableSet *)self->_discoveredDevices addObject:v9];
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v28 = v13;
    v18 = self;
    char v19 = v9;
    id v20 = v15;
    v21 = v11;
    long long v22 = v7;
    id v23 = v4;
    long long v24 = v6;
    long long v25 = WeakRetained;
    char v26 = objc_opt_respondsToSelector();

    id v6 = v24;
    id v4 = v23;
    uint64_t v7 = v22;
    uint64_t v11 = v21;
    v15 = v20;
    uint64_t v9 = v19;
    self = v18;
    v13 = v28;
    if (v26)
    {
      id v27 = objc_loadWeakRetained((id *)p_delegate);
      [v27 externalDeviceController:self didDiscoverDevice:v9];
    }
  }
  [(NSMutableSet *)self->_resolvingServices removeObject:v4];
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "TXTRecord data did change for service %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)_isManagedConfigIDAllowed:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDeviceController _isManagedConfigIDAllowed:]();
  }

  int v5 = [MEMORY[0x1E4F74230] sharedConnection];
  int v6 = [v5 effectiveValuesForUnionSetting:*MEMORY[0x1E4F74168]];

  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v9 = *(void *)v17;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "lowercaseString", (void)v16);
      dispatch_queue_t v12 = [v3 lowercaseString];
      char v13 = [v11 isEqualToString:v12];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v7 = _MRLogForCategory(3uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MRExternalDeviceController _isManagedConfigIDAllowed:](v7);
    }
  }
  LOBYTE(v8) = 1;
LABEL_16:

  v14 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MRExternalDeviceController _isManagedConfigIDAllowed:]();
  }

  return v8;
}

- (MRExternalDeviceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRExternalDeviceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bonjourServiceType
{
  return self->_bonjourServiceType;
}

- (BOOL)isDiscovering
{
  return self->_discovering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourServiceType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monitoringServices, 0);
  objc_storeStrong((id *)&self->_resolvingServices, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_serviceBrowser, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)netServiceBrowser:didFindService:moreComing:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "Found service %{public}@", v2, v3, v4, v5, v6);
}

- (void)netServiceBrowser:didRemoveService:moreComing:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "Removing service %{public}@", v2, v3, v4, v5, v6);
}

- (void)netServiceDidResolveAddress:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "Resolved service %{public}@", v2, v3, v4, v5, v6);
}

- (void)_isManagedConfigIDAllowed:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_6();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_194F3C000, v1, OS_LOG_TYPE_DEBUG, "Device with managedConfigDeviceID, %{public}@, allowed: %d", v2, 0x12u);
}

- (void)_isManagedConfigIDAllowed:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "No managedConfig allow list found. Allowing all devices", v1, 2u);
}

- (void)_isManagedConfigIDAllowed:.cold.3()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "Checking if device with managedConfigDeviceID, %{public}@, allowed", v2, v3, v4, v5, v6);
}

@end