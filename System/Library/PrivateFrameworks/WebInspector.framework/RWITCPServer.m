@interface RWITCPServer
@end

@implementation RWITCPServer

void __44___RWITCPServer__createListenDispatchSource__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(void *)&v8.sa_len = 0;
  *(void *)&v8.sa_data[6] = 0;
  socklen_t v7 = 16;
  uint64_t v2 = accept(*(_DWORD *)(*(void *)(a1 + 32) + 8), &v8, &v7);
  if (v2 == -1)
  {
    v4 = RWIDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44___RWITCPServer__createListenDispatchSource__block_invoke_cold_1();
    }
  }
  else
  {
    v3 = [[_RWITCPConnection alloc] initWithServer:*(void *)(a1 + 32) socket:v2];
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:v3];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44___RWITCPServer__createListenDispatchSource__block_invoke_5;
    v5[3] = &unk_2647F7538;
    v5[4] = *(void *)(a1 + 32);
    v6 = v3;
    v4 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __44___RWITCPServer__createListenDispatchSource__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v4 tcpServer:*(void *)(a1 + 32) receivedConnection:*(void *)(a1 + 40)];
  }
}

void __34___RWITCPServer_connectionClosed___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  v5 = __34___RWITCPServer_connectionClosed___block_invoke_2;
  v6 = &unk_2647F7538;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v2;
  dispatch_async(MEMORY[0x263EF83A0], &v3);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObject:", *(void *)(a1 + 40), v3, v4, v5, v6, v7);
}

void __34___RWITCPServer_connectionClosed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v4 tcpServer:*(void *)(a1 + 32) closedConnection:*(void *)(a1 + 40)];
  }
}

void __44___RWITCPServer__createListenDispatchSource__block_invoke_cold_1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_2(&dword_226FA0000, v1, v2, "_RWITCPServer: Could not accept incoming connection: %{public}s", v3, v4, v5, v6, 2u);
}

@end