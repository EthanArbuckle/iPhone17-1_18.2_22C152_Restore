@interface REPipedLocationListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)dealloc;
@end

@implementation REPipedLocationListener

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)REPipedLocationListener;
  v2 = [(RESingleton *)&v8 _init];
  if (v2)
  {
    v3 = RELogForDomain(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_INFO, "Starting piped location listener", v7, 2u);
    }

    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.relevanceengine.pipedlocation"];
    id v5 = v2[1];
    v2[1] = (id)v4;

    [v2[1] setDelegate:v2];
    [v2[1] resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)REPipedLocationListener;
  [(REPipedLocationListener *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = RELogForDomain(5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 description];
    int v11 = 136315138;
    uint64_t v12 = [v8 UTF8String];
    _os_log_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_INFO, "New piped location connection: %s", (uint8_t *)&v11, 0xCu);
  }
  v9 = +[RESingleton sharedInstance];
  [v9 setConnection:v6];

  return 1;
}

- (void).cxx_destruct
{
}

@end