@interface SocketRemoteXpcProxy
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)proxyServer;
- (OS_xpc_remote_connection)peer;
- (SocketRemoteXpcProxy)initWithSocket:(int)a3 device:(id)a4 queue:(id)a5 server:(BOOL)a6;
- (id)onCancel;
- (int)proxyClient;
- (int)takeOwnershipOfClientSocket;
- (void)activate;
- (void)cancel;
- (void)setOnCancel:(id)a3;
@end

@implementation SocketRemoteXpcProxy

- (SocketRemoteXpcProxy)initWithSocket:(int)a3 device:(id)a4 queue:(id)a5 server:(BOOL)a6
{
  id v8 = a4;
  v9 = a5;
  uintptr_t handle = -1;
  v29.receiver = self;
  v29.super_class = (Class)SocketRemoteXpcProxy;
  v10 = [(SocketRemoteXpcProxy *)&v29 init];
  if (!v10) {
    goto LABEL_14;
  }
  remote_device_get_type(v8);
  if (MEMORY[0x1E4F95FB8])
  {
    xpc_remote_connection_get_version_flags();
    v12 = (void *)xpc_remote_connection_create_with_connected_fd();
    if (remote_device_xpc_remote_connection_tls_enabled(v8))
    {
      v13 = remote_device_copy_xpc_remote_connection_tls_identity(v8);
      id v28 = v8;
      xpc_remote_connection_set_tls();
    }
    id v14 = rsd_log();
    int connected_ipv6_pair = remote_socket_create_connected_ipv6_pair((int *)&handle + 1, (int *)&handle, v14);

    if (connected_ipv6_pair)
    {
      v16 = rsd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SocketRemoteXpcProxy initWithSocket:device:queue:server:](v16);
      }

      goto LABEL_12;
    }
    int v18 = HIDWORD(handle);
    int v19 = fcntl(SHIDWORD(handle), 3, 0);
    fcntl(v18, 4, v19 & 0xFFFFFFFB);
    int v20 = handle;
    int v21 = fcntl(handle, 3, 0);
    fcntl(v20, 4, v21 | 4u);
    fcntl(SHIDWORD(handle), 2, 1);
    fcntl(handle, 2, 1);
    v10->_proxyClient = HIDWORD(handle);
    objc_storeStrong((id *)&v10->_queue, a5);
    peer = v10->_peer;
    v10->_peer = (OS_xpc_remote_connection *)v12;
    id v23 = v12;

    dispatch_source_t v24 = dispatch_source_create(MEMORY[0x1E4F14478], (int)handle, 0, v9);
    proxyServer = v10->_proxyServer;
    v10->_proxyServer = (OS_dispatch_source *)v24;

    id onCancel = v10->_onCancel;
    v10->_id onCancel = 0;

LABEL_14:
    v17 = v10;
    goto LABEL_15;
  }
  v11 = rsd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SocketRemoteXpcProxy initWithSocket:device:queue:server:]();
  }

LABEL_12:
  v17 = 0;
LABEL_15:

  return v17;
}

void __59__SocketRemoteXpcProxy_initWithSocket_device_queue_server___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

- (void)activate
{
  v3 = [(SocketRemoteXpcProxy *)self peer];
  v4 = [(SocketRemoteXpcProxy *)self queue];
  xpc_remote_connection_set_target_queue();

  v5 = [(SocketRemoteXpcProxy *)self peer];
  handler[5] = MEMORY[0x1E4F143A8];
  handler[6] = 3221225472;
  handler[7] = __32__SocketRemoteXpcProxy_activate__block_invoke;
  handler[8] = &unk_1E6C24530;
  handler[9] = self;
  xpc_remote_connection_set_event_handler();

  v6 = [(SocketRemoteXpcProxy *)self proxyServer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __32__SocketRemoteXpcProxy_activate__block_invoke_5;
  handler[3] = &unk_1E6C24558;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);

  v7 = [(SocketRemoteXpcProxy *)self proxyServer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__SocketRemoteXpcProxy_activate__block_invoke_7;
  v10[3] = &unk_1E6C24558;
  v10[4] = self;
  dispatch_source_set_cancel_handler(v7, v10);

  id v8 = [(SocketRemoteXpcProxy *)self peer];
  xpc_remote_connection_activate();

  v9 = [(SocketRemoteXpcProxy *)self proxyServer];
  dispatch_activate(v9);
}

void __32__SocketRemoteXpcProxy_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    v10 = rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138543362;
      size_t v12 = (size_t)v3;
      _os_log_impl(&dword_1DB9AA000, v10, OS_LOG_TYPE_INFO, "RemoteXPC error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) cancel];
  }
  else
  {
    v4 = xpc_dictionary_get_value(v3, "data");
    size_t length = xpc_data_get_length(v4);
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      size_t v12 = length;
      _os_log_impl(&dword_1DB9AA000, v6, OS_LOG_TYPE_INFO, "Proxying %zu bytes from RemoteXPC to socket", (uint8_t *)&v11, 0xCu);
    }

    v7 = [*(id *)(a1 + 32) proxyServer];
    int handle = dispatch_source_get_handle(v7);
    bytes_ptr = xpc_data_get_bytes_ptr(v4);
    write(handle, bytes_ptr, length);
  }
}

void __32__SocketRemoteXpcProxy_activate__block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) proxyServer];
  int handle = dispatch_source_get_handle(v3);

  v5 = [*v2 proxyServer];
  size_t v6 = dispatch_source_get_data(v5) + 1;

  v7 = malloc_type_malloc(v6, 0x9087CE49uLL);
  ssize_t v8 = read(handle, v7, v6);
  v9 = rsd_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v13 = 134217984;
      ssize_t v14 = v8;
      _os_log_impl(&dword_1DB9AA000, v9, OS_LOG_TYPE_INFO, "Proxying %zu bytes from socket over RemoteXPC", (uint8_t *)&v13, 0xCu);
    }

    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_data(empty, "data", v7, v8);
    size_t v12 = [*(id *)(a1 + 32) peer];
    xpc_remote_connection_send_message();
  }
  else
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1DB9AA000, v9, OS_LOG_TYPE_INFO, "Client closed their socket", (uint8_t *)&v13, 2u);
    }

    empty = [*(id *)(a1 + 32) proxyServer];
    dispatch_source_cancel(empty);
  }

  free(v7);
}

void __32__SocketRemoteXpcProxy_activate__block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) proxyServer];
  int handle = dispatch_source_get_handle(v2);

  [*(id *)(a1 + 32) cancel];
  close(handle);
  if (([*(id *)(a1 + 32) proxyClient] & 0x80000000) == 0)
  {
    close([*(id *)(a1 + 32) proxyClient]);
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = -1;
  }
  v4 = [*(id *)(a1 + 32) onCancel];

  if (v4)
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB9AA000, v5, OS_LOG_TYPE_INFO, "Cancel socket proxy", v7, 2u);
    }

    size_t v6 = [*(id *)(a1 + 32) onCancel];
    v6[2]();

    [*(id *)(a1 + 32) setOnCancel:0];
  }
}

- (int)takeOwnershipOfClientSocket
{
  int result = [(SocketRemoteXpcProxy *)self proxyClient];
  self->_proxyClient = -1;
  return result;
}

- (void)cancel
{
  id v3 = [(SocketRemoteXpcProxy *)self proxyServer];
  dispatch_source_cancel(v3);

  v4 = [(SocketRemoteXpcProxy *)self peer];
  xpc_remote_connection_send_barrier();
}

void __30__SocketRemoteXpcProxy_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) peer];
  xpc_remote_connection_cancel();
}

- (OS_xpc_remote_connection)peer
{
  return self->_peer;
}

- (int)proxyClient
{
  return self->_proxyClient;
}

- (OS_dispatch_source)proxyServer
{
  return self->_proxyServer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)onCancel
{
  return self->_onCancel;
}

- (void)setOnCancel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCancel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

- (void)initWithSocket:device:queue:server:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "RemoteXPC is unavailable.", v2, v3, v4, v5, v6);
}

- (void)initWithSocket:(NSObject *)a1 device:queue:server:.cold.2(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_1DB9AA000, a1, OS_LOG_TYPE_ERROR, "creating socket pair failed: %s", v3, 0xCu);
}

@end