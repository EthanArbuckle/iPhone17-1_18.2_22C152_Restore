@interface SMNetworkReachabilityObserver
+ (id)sharedNetworkReachabilityObserver;
- (BOOL)isNetworkReachable;
- (SMNetworkReachabilityObserver)init;
- (void)_startPathMonitor;
- (void)_stopPathMonitor;
- (void)dealloc;
@end

@implementation SMNetworkReachabilityObserver

- (SMNetworkReachabilityObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SMNetworkReachabilityObserver;
  v2 = [(SMNetworkReachabilityObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.routined.SMNetworkReachabilityObserver", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    [(SMNetworkReachabilityObserver *)v2 _startPathMonitor];
  }
  return v2;
}

- (void)dealloc
{
  [(SMNetworkReachabilityObserver *)self _stopPathMonitor];
  v3.receiver = self;
  v3.super_class = (Class)SMNetworkReachabilityObserver;
  [(SMNetworkReachabilityObserver *)&v3 dealloc];
}

+ (id)sharedNetworkReachabilityObserver
{
  if (qword_1EBE38848 != -1) {
    dispatch_once(&qword_1EBE38848, &__block_literal_global_45);
  }
  v2 = (void *)_MergedGlobals_97;

  return v2;
}

uint64_t __66__SMNetworkReachabilityObserver_sharedNetworkReachabilityObserver__block_invoke()
{
  _MergedGlobals_97 = objc_alloc_init(SMNetworkReachabilityObserver);

  return MEMORY[0x1F41817F8]();
}

- (void)_startPathMonitor
{
  pathMonitor = self->_pathMonitor;
  if (!pathMonitor)
  {
    v4 = (OS_nw_path_monitor *)nw_path_monitor_create();
    v5 = self->_pathMonitor;
    self->_pathMonitor = v4;

    pathMonitor = self->_pathMonitor;
  }
  nw_path_monitor_set_queue(pathMonitor, (dispatch_queue_t)self->_observerQueue);
  objc_initWeak(&location, self);
  objc_super v6 = self->_pathMonitor;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SMNetworkReachabilityObserver__startPathMonitor__block_invoke;
  v7[3] = &unk_1E6B95BE8;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v6, v7);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__SMNetworkReachabilityObserver__startPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v5 = (nw_path_get_status(v3) & 0xFFFFFFFD) == 1 && nw_path_has_dns(v3);
    int v6 = WeakRetained[24];
    WeakRetained[24] = v5;
    if (v6 != v5)
    {
      v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"NO";
        if (v5) {
          id v8 = @"YES";
        }
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Network reachability updated, reachable, %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)_stopPathMonitor
{
  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    v4 = self->_pathMonitor;
    self->_pathMonitor = 0;
  }
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SMNetworkReachabilityObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E6B93860;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SMNetworkReachabilityObserver_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);

  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end