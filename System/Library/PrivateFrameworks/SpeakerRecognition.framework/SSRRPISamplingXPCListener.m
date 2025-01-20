@interface SSRRPISamplingXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SSRRPISamplingXPCListener)init;
- (SSRRPISamplingXPCListener)initWithListener:(id)a3;
- (void)listen;
@end

@implementation SSRRPISamplingXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObject, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = *MEMORY[0x263F38100];
  v9 = *MEMORY[0x263F38100];
  if (self->_listener == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[SSRRPISamplingXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s SSRRPISamplingXPCListener start listening", (uint8_t *)&v18, 0xCu);
    }
    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD46B88];
    [v7 setExportedInterface:v11];

    v12 = [@"com.apple.ssr.rpisamplingservice" stringByReplacingOccurrencesOfString:@"com.apple." withString:&stru_26CD357C0];
    char v10 = [MEMORY[0x263F380D0] xpcConnection:v7 hasEntitlement:v12];
    if (v10)
    {
      exportedObject = self->_exportedObject;
      if (!exportedObject)
      {
        v14 = +[SSRRPISampler sharedInstance];
        v15 = self->_exportedObject;
        self->_exportedObject = v14;

        exportedObject = self->_exportedObject;
      }
      [v7 setExportedObject:exportedObject];
      [v7 resume];
    }
    else
    {
      v16 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315394;
        v19 = "-[SSRRPISamplingXPCListener listener:shouldAcceptNewConnection:]";
        __int16 v20 = 2112;
        v21 = @"com.apple.ssr.rpisamplingservice";
        _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s SSRRPISamplingXPCListener does not have entitlement: %@", (uint8_t *)&v18, 0x16u);
      }
      [v7 invalidate];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      v19 = "-[SSRRPISamplingXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s we got unknown types of XPC connection request", (uint8_t *)&v18, 0xCu);
    }
    char v10 = 0;
  }

  return v10;
}

- (void)listen
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SSRRPISamplingXPCListener listen]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s SSRRPISamplingXPCListener start listening", (uint8_t *)&v4, 0xCu);
  }
}

- (SSRRPISamplingXPCListener)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.ssr.rpisamplingservice"];
  int v4 = [(SSRRPISamplingXPCListener *)self initWithListener:v3];

  return v4;
}

- (SSRRPISamplingXPCListener)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSRRPISamplingXPCListener;
  uint64_t v6 = [(SSRRPISamplingXPCListener *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listener, a3);
  }

  return v7;
}

@end