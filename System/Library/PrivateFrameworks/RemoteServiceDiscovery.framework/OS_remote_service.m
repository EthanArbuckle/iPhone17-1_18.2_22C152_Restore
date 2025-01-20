@interface OS_remote_service
- (int)proxySocketOverRemoteXPC:(int)a3;
- (void)dealloc;
@end

@implementation OS_remote_service

- (int)proxySocketOverRemoteXPC:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [SocketRemoteXpcProxy alloc];
  device = self->device;
  id v7 = remoted_queue();
  v8 = [(SocketRemoteXpcProxy *)v5 initWithSocket:v3 device:device queue:v7 server:0];

  if (v8)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    int v9 = [(SocketRemoteXpcProxy *)v8 takeOwnershipOfClientSocket];
    if (v9 < 0)
    {
      v10 = rsd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[OS_remote_service proxySocketOverRemoteXPC:]();
      }
    }
    [(NSMutableArray *)self->proxies addObject:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__OS_remote_service_proxySocketOverRemoteXPC___block_invoke;
    v13[3] = &unk_1E6C24580;
    v13[4] = self;
    objc_copyWeak(&v14, &location);
    [(SocketRemoteXpcProxy *)v8 setOnCancel:v13];
    [(SocketRemoteXpcProxy *)v8 activate];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = rsd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[OS_remote_service proxySocketOverRemoteXPC:]();
    }

    int v9 = -1;
  }

  return v9;
}

- (void)dealloc
{
  free(self->name);
  v3.receiver = self;
  v3.super_class = (Class)OS_remote_service;
  [(OS_remote_service *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->proxies, 0);
  objc_storeStrong((id *)&self->keepalive, 0);
  objc_storeStrong((id *)&self->device, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->properties, 0);
}

- (void)proxySocketOverRemoteXPC:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to proxy socket over RemoteXPC", v2, v3, v4, v5, v6);
}

- (void)proxySocketOverRemoteXPC:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "RemoteXPC proxy's client socket is invalid", v2, v3, v4, v5, v6);
}

@end