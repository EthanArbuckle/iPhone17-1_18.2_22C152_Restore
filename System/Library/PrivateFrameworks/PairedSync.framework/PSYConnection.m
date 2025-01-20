@interface PSYConnection
- (BOOL)isValid;
- (NSXPCConnection)connection;
- (PSYConnection)init;
- (PSYConnectionDelegate)delegate;
- (PSYOptions)options;
- (id)remoteConnection;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptions:(id)a3;
- (void)startSync;
- (void)startSyncWithOptions:(id)a3;
@end

@implementation PSYConnection

- (PSYConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSYConnection;
  v2 = [(PSYConnection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.pairedsyncd.connection" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    v6 = PSYConnectionXPCInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)startSync
{
}

- (void)startSyncWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (PSYOptions *)a3;
  if (!v4) {
    v4 = objc_alloc_init(PSYOptions);
  }
  v5 = psy_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = psy_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "Starting sync with options: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(PSYConnection *)self setOptions:v4];
  objc_super v8 = [(PSYConnection *)self remoteConnection];
  [v8 startSyncWithOptions:v4];
}

- (id)remoteConnection
{
  v2 = [(PSYConnection *)self connection];
  uint64_t v3 = [v2 remoteObjectProxy];

  return v3;
}

- (PSYConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isValid
{
  return self->_valid;
}

- (PSYOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
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
  objc_storeStrong((id *)&self->_options, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end