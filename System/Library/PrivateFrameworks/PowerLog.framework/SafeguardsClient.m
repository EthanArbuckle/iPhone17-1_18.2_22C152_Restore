@interface SafeguardsClient
+ (void)initialize;
- (BOOL)featureEnabled;
- (BOOL)interrupted;
- (NSXPCConnection)connection;
- (SafeguardsClient)init;
- (void)init;
- (void)reportExcessiveCPUUseBy:(char)a3[33] pid:(int)a4 path:(char)a5[1024] timestamp:(mach_timespec)a6 observed_cpu_nsecs:(int64_t)a7 observation_nsecs:(int64_t)a8 cpu_nsecs_allowed:(int64_t)a9 limit_window_nsecs:(int64_t)a10 flags:(unint64_t)a11;
- (void)setConnection:(id)a3;
- (void)setFeatureEnabled:(BOOL)a3;
- (void)setInterrupted:(BOOL)a3;
@end

@implementation SafeguardsClient

+ (void)initialize
{
  logger = (uint64_t)os_log_create("com.apple.computesafeguards", "safeguardsclient");
  MEMORY[0x1F41817F8]();
}

- (SafeguardsClient)init
{
  v23.receiver = self;
  v23.super_class = (Class)SafeguardsClient;
  v2 = [(SafeguardsClient *)&v23 init];
  os_log_t v3 = os_log_create("com.apple.computesafeguards", "safeguardsclient");
  v4 = (void *)logger;
  logger = (uint64_t)v3;

  if (v2)
  {
    char v5 = _os_feature_enabled_impl();
    v2->_featureEnabled = v5;
    if (v5)
    {
      int v6 = xpc_user_sessions_enabled();
      if (v6) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = 4096;
      }
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.computesafeguards.violationhandler" options:v7];
      connection = v2->_connection;
      v2->_connection = (NSXPCConnection *)v8;

      v10 = v2->_connection;
      if (clientInterface_onceToken != -1) {
        dispatch_once(&clientInterface_onceToken, &__block_literal_global_38);
      }
      [(NSXPCConnection *)v10 setRemoteObjectInterface:clientInterface_interface];
      if (v6)
      {
        LODWORD(location[0]) = 0;
        xpc_user_sessions_get_foreground_uid();
        v11 = [(NSXPCConnection *)v2->_connection _xpcConnection];
        xpc_connection_set_target_user_session_uid();
      }
      objc_initWeak(location, v2);
      v12 = v2->_connection;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __24__SafeguardsClient_init__block_invoke;
      v20[3] = &unk_1E5A45F10;
      objc_copyWeak(&v21, location);
      [(NSXPCConnection *)v12 setInterruptionHandler:v20];
      v13 = v2->_connection;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __24__SafeguardsClient_init__block_invoke_6;
      v18[3] = &unk_1E5A45F10;
      objc_copyWeak(&v19, location);
      [(NSXPCConnection *)v13 setInvalidationHandler:v18];
      [(NSXPCConnection *)v2->_connection resume];
      v14 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1A11A5000, v14, OS_LOG_TYPE_INFO, "Initialized connection", v17, 2u);
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(location);
    }
    else
    {
      v15 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1A11A5000, v15, OS_LOG_TYPE_INFO, "Not setting up connection as feature is not enabled.", (uint8_t *)location, 2u);
      }
    }
  }
  return v2;
}

void __24__SafeguardsClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)os_log_t v3 = 0;
      _os_log_impl(&dword_1A11A5000, v2, OS_LOG_TYPE_INFO, "Connection to service interrupted", v3, 2u);
    }
    [WeakRetained setInterrupted:1];
  }
}

void __24__SafeguardsClient_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)os_log_t v3 = 0;
      _os_log_impl(&dword_1A11A5000, v2, OS_LOG_TYPE_INFO, "Connection to service invalidated", v3, 2u);
    }
  }
}

- (void)reportExcessiveCPUUseBy:(char)a3[33] pid:(int)a4 path:(char)a5[1024] timestamp:(mach_timespec)a6 observed_cpu_nsecs:(int64_t)a7 observation_nsecs:(int64_t)a8 cpu_nsecs_allowed:(int64_t)a9 limit_window_nsecs:(int64_t)a10 flags:(unint64_t)a11
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (self->_featureEnabled)
  {
    v17 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
    {
      v18 = "";
      if ((a11 & 0x100000000) != 0) {
        v18 = "(FATAL) ";
      }
      *(_DWORD *)buf = 136317186;
      v25 = v18;
      __int16 v26 = 2080;
      char *__attribute__((__org_arrdim(0,33))) v27 = a3;
      __int16 v30 = 2080;
      __int16 v28 = 1024;
      int v29 = a4;
      char *__attribute__((__org_arrdim(0,1024))) v31 = a5;
      __int16 v36 = 1024;
      __int16 v32 = 2048;
      double v33 = (double)a7 / 1000000000.0;
      __int16 v34 = 2048;
      double v35 = (double)a8 / 1000000000.0;
      int v37 = 100 * a7 / a8;
      __int16 v38 = 2048;
      double v39 = (double)a9 / 1000000000.0;
      __int16 v40 = 2048;
      unint64_t v41 = a10 / 0x3B9ACA00uLL;
      _os_log_impl(&dword_1A11A5000, v17, OS_LOG_TYPE_INFO, "Received %sCPU usage trigger: \n  %s[%d] (%s) used %.2fs of CPU over %.2f seconds (averaging %d%%), violating a CPU usage limit of %.2fs over %lld seconds.", buf, 0x54u);
    }
    id v19 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_0];
    v20 = [NSString stringWithCString:a3];
    id v21 = [NSString stringWithCString:a5];
    LOBYTE(v22) = BYTE4(a11) & 1;
    [v19 reportExcessiveCPUUseBy:v20 pid:a4 path:v21 endTime:a6 observedValue:a7 observationWindow:a8 limitValue:a9 limitWindow:a10 fatal:v22];
  }
}

void __143__SafeguardsClient_reportExcessiveCPUUseBy_pid_path_timestamp_observed_cpu_nsecs_observation_nsecs_cpu_nsecs_allowed_limit_window_nsecs_flags___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  os_log_t v3 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    __143__SafeguardsClient_reportExcessiveCPUUseBy_pid_path_timestamp_observed_cpu_nsecs_observation_nsecs_cpu_nsecs_allowed_limit_window_nsecs_flags___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (BOOL)featureEnabled
{
  return self->_featureEnabled;
}

- (void)setFeatureEnabled:(BOOL)a3
{
  self->_featureEnabled = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  os_log_t v3 = a2;
  v4[0] = 67109378;
  v4[1] = v2;
  __int16 v5 = 2080;
  uint64_t v6 = xpc_strerror();
  _os_log_error_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v4, 0x12u);
}

void __143__SafeguardsClient_reportExcessiveCPUUseBy_pid_path_timestamp_observed_cpu_nsecs_observation_nsecs_cpu_nsecs_allowed_limit_window_nsecs_flags___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_ERROR, "Failed to report violation %@", (uint8_t *)&v2, 0xCu);
}

@end