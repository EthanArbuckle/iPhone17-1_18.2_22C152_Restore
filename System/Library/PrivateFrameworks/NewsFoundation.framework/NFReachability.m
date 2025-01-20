@interface NFReachability
+ (id)sharedInstance;
+ (int64_t)_currentNetworkStatus;
- (NFReachability)init;
- (OS_dispatch_queue)observationQueue;
- (OS_nw_path)currentNetworkPath;
- (OS_nw_path_monitor)networkPathMonitor;
- (int64_t)_statusFromNetworkPath:(id)a3;
- (int64_t)currentReachabilityStatus;
- (void)_updateCurrentNetworkPath:(id)a3;
- (void)dealloc;
- (void)setCurrentNetworkPath:(id)a3;
- (void)setCurrentReachabilityStatus:(int64_t)a3;
- (void)setNetworkPathMonitor:(id)a3;
- (void)setObservationQueue:(id)a3;
@end

@implementation NFReachability

uint64_t __32__NFReachability_sharedInstance__block_invoke()
{
  sharedInstance_s_reachability = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (NFReachability)init
{
  v12.receiver = self;
  v12.super_class = (Class)NFReachability;
  id v2 = [(NFReachability *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("NFReachability.observation", 0);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    nw_path_monitor_t v5 = nw_path_monitor_create();
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    *((void *)v2 + 1) = +[NFReachability _currentNetworkStatus];
    objc_initWeak(&location, v2);
    v7 = *((void *)v2 + 3);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __22__NFReachability_init__block_invoke;
    v9[3] = &unk_264485E30;
    objc_copyWeak(&v10, &location);
    nw_path_monitor_set_update_handler(v7, v9);
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v2 + 3), *((dispatch_queue_t *)v2 + 2));
    nw_path_monitor_start(*((nw_path_monitor_t *)v2 + 3));
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return (NFReachability *)v2;
}

+ (int64_t)_currentNetworkStatus
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)&address.sa_data[6] = 0;
  *(void *)&address.sa_len = 528;
  id v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], &address);
  if (!v2) {
    return 3;
  }
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(v2, &flags)) {
    return 3;
  }
  if ((flags & 2) == 0) {
    return 0;
  }
  if ((flags & 4) != 0 && ((flags & 0x28) == 0 || (flags & 0x10) != 0)) {
    return ((unint64_t)flags >> 17) & 2;
  }
  return 1;
}

void __22__NFReachability_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateCurrentNetworkPath:v3];
}

- (void)_updateCurrentNetworkPath:(id)a3
{
  path = a3;
  v4 = [(NFReachability *)self currentNetworkPath];
  BOOL is_equal = nw_path_is_equal(path, v4);

  if (!is_equal)
  {
    [(NFReachability *)self setCurrentNetworkPath:path];
    [(NFReachability *)self setCurrentReachabilityStatus:[(NFReachability *)self _statusFromNetworkPath:path]];
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_7);
  }
}

- (void)setCurrentReachabilityStatus:(int64_t)a3
{
  self->_currentReachabilityStatus = a3;
}

- (void)setCurrentNetworkPath:(id)a3
{
}

- (OS_nw_path)currentNetworkPath
{
  return self->_currentNetworkPath;
}

- (int64_t)_statusFromNetworkPath:(id)a3
{
  id v3 = a3;
  if ((nw_path_get_status(v3) | 2) == 3)
  {
    int64_t v4 = nw_path_uses_interface_type(v3, nw_interface_type_wifi)
      || nw_path_uses_interface_type(v3, nw_interface_type_wired);
    if (nw_path_uses_interface_type(v3, nw_interface_type_cellular)) {
      v4 |= 2uLL;
    }
    if (nw_path_uses_interface_type(v3, nw_interface_type_other)) {
      v4 |= 4uLL;
    }
  }
  else
  {
    int64_t v4 = 0;
  }
  if (nw_path_is_expensive(v3)) {
    v4 |= 8uLL;
  }
  if (nw_path_is_constrained(v3)) {
    v4 |= 0x10uLL;
  }

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  id v2 = (void *)sharedInstance_s_reachability;
  return v2;
}

- (int64_t)currentReachabilityStatus
{
  return self->_currentReachabilityStatus;
}

void __44__NFReachability__updateCurrentNetworkPath___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"kNFReachabilityChangedNotification" object:0];
}

- (void)dealloc
{
  nw_path_monitor_cancel((nw_path_monitor_t)self->_networkPathMonitor);
  v3.receiver = self;
  v3.super_class = (Class)NFReachability;
  [(NFReachability *)&v3 dealloc];
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void)setObservationQueue:(id)a3
{
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetworkPath, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

@end