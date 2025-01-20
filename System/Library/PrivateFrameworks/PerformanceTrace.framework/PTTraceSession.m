@interface PTTraceSession
+ (id)initWithConfig:(id)a3;
- (BOOL)isValid;
- (NSXPCConnection)connection;
- (PTTraceConfig)config;
- (PTTraceSession)init;
- (PTTraceSessionDelegate)delegate;
- (id)_getRemoteObjectProxy;
- (void)_didPingService:(id)a3;
- (void)_initConnection;
- (void)_invalidateSession;
- (void)_ping:(id)a3;
- (void)performanceTraceDidComplete:(id)a3 withToken:(id)a4 withError:(id)a5;
- (void)performanceTraceDidStart:(id)a3;
- (void)performanceTraceDidStop:(id)a3;
- (void)setConfig:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startPerformanceTrace;
- (void)stopPerformanceTrace;
@end

@implementation PTTraceSession

- (PTTraceSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)PTTraceSession;
  result = [(PTTraceSession *)&v3 init];
  if (result) {
    result->_isValid = 1;
  }
  return result;
}

+ (id)initWithConfig:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PTTraceSession);
  [(PTTraceSession *)v4 setConfig:v3];

  [(PTTraceSession *)v4 setConnection:0];
  return v4;
}

- (void)startPerformanceTrace
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Starting Performance Trace", v6, 2u);
  }
  if ([(PTTraceSession *)self isValid])
  {
    id v3 = [(PTTraceSession *)self connection];

    if (!v3) {
      [(PTTraceSession *)self _initConnection];
    }
    v4 = [(PTTraceSession *)self _getRemoteObjectProxy];
    v5 = [(PTTraceSession *)self config];
    [v4 startPerformanceTrace:v5];
  }
  else
  {
    v4 = [MEMORY[0x263F087E8] error:1 description:@"Unable to start Performance Trace as the session is no longer valid"];
    [(PTTraceSession *)self performanceTraceDidStart:v4];
  }
}

- (void)stopPerformanceTrace
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Stopping Performance Trace", v5, 2u);
  }
  id v3 = [(PTTraceSession *)self connection];

  if (!v3) {
    [(PTTraceSession *)self _initConnection];
  }
  v4 = [(PTTraceSession *)self _getRemoteObjectProxy];
  [v4 stopPerformanceTrace];
}

- (void)_ping:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Sending Ping: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(PTTraceSession *)self connection];

  if (!v5) {
    [(PTTraceSession *)self _initConnection];
  }
  v6 = [(PTTraceSession *)self _getRemoteObjectProxy];
  [v6 pingService:v4];
}

- (void)_initConnection
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PerformanceTrace.PerformanceTraceService"];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D08A930];
  [v6 setRemoteObjectInterface:v3];
  [v6 setInvalidationHandler:&__block_literal_global_0];
  [v6 setInterruptionHandler:&__block_literal_global_24];
  id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D08A990];
  [v6 setExportedInterface:v4];

  [v6 setExportedObject:self];
  [(PTTraceSession *)self setConnection:v6];
  v5 = [(PTTraceSession *)self connection];
  [v5 resume];
}

void __33__PTTraceSession__initConnection__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "XPC connection invalidated.", v0, 2u);
  }
}

void __33__PTTraceSession__initConnection__block_invoke_22()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __33__PTTraceSession__initConnection__block_invoke_22_cold_1();
  }
}

- (id)_getRemoteObjectProxy
{
  v2 = [(PTTraceSession *)self connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_78];

  return v3;
}

void __39__PTTraceSession__getRemoteObjectProxy__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __38__PTTraceConfig__getRemoteObjectProxy__block_invoke_cold_1(a2);
  }
}

- (void)_invalidateSession
{
  self->_isValid = 0;
  id v3 = [(PTTraceSession *)self connection];

  if (v3)
  {
    id v4 = [(PTTraceSession *)self connection];
    [v4 invalidate];
  }
}

- (void)performanceTraceDidStart:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PTTraceSession *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(PTTraceSession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PTTraceSession *)self delegate];
      [v8 performanceTraceDidStart:v9];
    }
  }
}

- (void)performanceTraceDidStop:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PTTraceSession *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(PTTraceSession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PTTraceSession *)self delegate];
      [v8 performanceTraceDidStop:v9];
    }
  }
}

- (void)performanceTraceDidComplete:(id)a3 withToken:(id)a4 withError:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PTTraceSession *)self delegate];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(PTTraceSession *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(PTTraceSession *)self delegate];
      [v14 performanceTraceDidComplete:v15 withToken:v8 withError:v9];
    }
  }
  [(PTTraceSession *)self _invalidateSession];
}

- (void)_didPingService:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PTTraceSession *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(PTTraceSession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PTTraceSession *)self delegate];
      [v8 _didPingService:v9];
    }
  }
}

- (PTTraceConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (PTTraceSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __33__PTTraceSession__initConnection__block_invoke_22_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_ERROR, "XPC connection interrupted.", v0, 2u);
}

@end