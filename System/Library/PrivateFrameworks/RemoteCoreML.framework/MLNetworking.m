@interface MLNetworking
@end

@implementation MLNetworking

void __32___MLNetworking_startConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v5 = a3;
  v6 = [*(id *)(a1 + 32) connection];
  v7 = nw_connection_copy_endpoint(v6);

  if (v5)
  {
    int error_code = nw_error_get_error_code(v5);
    *__error() = error_code;
    v9 = [*(id *)(a1 + 32) logType];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __32___MLNetworking_startConnection__block_invoke_cold_2(a1);
    }
  }
  else
  {
    *__error() = 0;
  }
  switch(a2)
  {
    case 1:
      v10 = [*(id *)(a1 + 32) logType];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      hostname = nw_endpoint_get_hostname(v7);
      int port = nw_endpoint_get_port(v7);
      v14 = [*(id *)(a1 + 32) nwOptions];
      int v15 = [v14 useUDP];
      v16 = "tcp";
      int v26 = 138413058;
      v27 = v11;
      __int16 v28 = 2080;
      if (v15) {
        v16 = "udp";
      }
      v29 = hostname;
      __int16 v30 = 1024;
      int v31 = port;
      __int16 v32 = 2080;
      v33 = v16;
      v17 = "%@: connect to %s port %u (%s) failed, is waiting";
      goto LABEL_20;
    case 3:
      v10 = [*(id *)(a1 + 32) logType];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v18 = nw_endpoint_get_hostname(v7);
      int v19 = nw_endpoint_get_port(v7);
      v14 = [*(id *)(a1 + 32) nwOptions];
      int v20 = [v14 useUDP];
      v21 = "tcp";
      int v26 = 138413058;
      v27 = v11;
      __int16 v28 = 2080;
      if (v20) {
        v21 = "udp";
      }
      v29 = v18;
      __int16 v30 = 1024;
      int v31 = v19;
      __int16 v32 = 2080;
      v33 = v21;
      _os_log_impl(&dword_238967000, v10, OS_LOG_TYPE_INFO, "%@: Connection to %s port %u (%s) succeeded!", (uint8_t *)&v26, 0x26u);
      break;
    case 4:
      v10 = [*(id *)(a1 + 32) logType];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v22 = nw_endpoint_get_hostname(v7);
      int v23 = nw_endpoint_get_port(v7);
      v14 = [*(id *)(a1 + 32) nwOptions];
      int v24 = [v14 useUDP];
      v25 = "tcp";
      int v26 = 138413058;
      v27 = v11;
      __int16 v28 = 2080;
      if (v24) {
        v25 = "udp";
      }
      v29 = v22;
      __int16 v30 = 1024;
      int v31 = v23;
      __int16 v32 = 2080;
      v33 = v25;
      v17 = "%@: connect to %s port %u (%s) failed";
LABEL_20:
      _os_log_debug_impl(&dword_238967000, v10, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v26, 0x26u);
      break;
    case 5:
      v10 = [*(id *)(a1 + 32) logType];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __32___MLNetworking_startConnection__block_invoke_cold_1(a1);
      }
      goto LABEL_23;
    default:
      goto LABEL_24;
  }

LABEL_23:
LABEL_24:
}

void __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) logType];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 32) setConnection:v3];
  [*(id *)(a1 + 32) startConnection];
  [*(id *)(a1 + 32) receiveLoop:*(void *)(a1 + 40)];
}

void __26___MLNetworking_sendData___block_invoke(uint64_t a1, nw_error_t error)
{
  if (error)
  {
    int error_code = nw_error_get_error_code(error);
    *__error() = error_code;
    v4 = [*(id *)(a1 + 32) logType];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __26___MLNetworking_sendData___block_invoke_cold_2(a1);
    }
  }
  else
  {
    v4 = [*(id *)(a1 + 32) logType];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __26___MLNetworking_sendData___block_invoke_cold_1(a1);
    }
  }
}

void __29___MLNetworking_receiveLoop___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __29___MLNetworking_receiveLoop___block_invoke_2;
  v20[3] = &unk_264D53000;
  char v26 = a4;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 32);
  id v21 = v12;
  uint64_t v22 = v13;
  uint64_t v25 = *(void *)(a1 + 48);
  id v14 = v11;
  id v23 = v14;
  id v24 = *(id *)(a1 + 40);
  uint64_t v15 = MEMORY[0x23EC97240](v20);
  v16 = (void (**)(void))v15;
  if (v9)
  {
    uint64_t v17 = MEMORY[0x23EC97240](v15);

    (*(void (**)(void, id, id, uint64_t, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v12, a4, v14, v18, v19);
    v16 = (void (**)(void))v17;
  }
  v16[2](v16);
}

void __29___MLNetworking_receiveLoop___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 72) && (v2 = *(NSObject **)(a1 + 32)) != 0 && nw_content_context_get_is_final(v2))
  {
    id v3 = [*(id *)(a1 + 40) logType];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v7 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_debug_impl(&dword_238967000, v3, OS_LOG_TYPE_DEBUG, "%@: complete disconnect is_complete=%d ,context=%p", (uint8_t *)&v9, 0x1Cu);
    }
  }
  else if (!*(void *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    [v4 receiveLoop:v5];
  }
}

void __32___MLNetworking_startConnection__block_invoke_cold_1(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  int v7 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);
}

void __32___MLNetworking_startConnection__block_invoke_cold_2(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  __error();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_238967000, v3, v4, "%@: Start connection error code=%d", v5, v6, v7, v8, v9);
}

void __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);
}

void __26___MLNetworking_sendData___block_invoke_cold_1(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  os_log_t v2 = NSStringFromSelector(v1);
  __error();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x12u);
}

void __26___MLNetworking_sendData___block_invoke_cold_2(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  os_log_t v2 = NSStringFromSelector(v1);
  __error();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_238967000, v3, v4, "%@: send error code=%d.", v5, v6, v7, v8, v9);
}

@end