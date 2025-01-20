@interface MLNetworkUtilities
@end

@implementation MLNetworkUtilities

void __59___MLNetworkUtilities_setupBonjour_name_useBonjour_useUDP___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = a2;
  v6 = +[_MLLog common];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    if (a3) {
      v8 = "added";
    }
    else {
      v8 = "removed";
    }
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v5);
    v10 = nw_endpoint_get_bonjour_service_name(v5);
    int v11 = *(unsigned __int8 *)(a1 + 40);
    int v13 = 138413570;
    v14 = v7;
    if (v11) {
      v12 = "_nwcat._udp";
    }
    else {
      v12 = "_nwcat._tcp";
    }
    __int16 v15 = 2080;
    v16 = v8;
    __int16 v17 = 2080;
    v18 = bonjour_service_name;
    __int16 v19 = 2080;
    v20 = v10;
    __int16 v21 = 2080;
    v22 = v12;
    __int16 v23 = 2080;
    v24 = "local";
    _os_log_debug_impl(&dword_238967000, v6, OS_LOG_TYPE_DEBUG, "%@: Listener %s on %s (%s.%s.%s)", (uint8_t *)&v13, 0x3Eu);
  }
}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke(uint64_t a1, int a2, void *a3)
{
  v5 = a3;
  v6 = v5;
  if (v5) {
    int error_code = nw_error_get_error_code(v5);
  }
  else {
    int error_code = 0;
  }
  *__error() = error_code;
  switch(a2)
  {
    case 3:
      v8 = +[_MLLog common];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_2(a1, v8);
      }
      goto LABEL_13;
    case 2:
      v8 = +[_MLLog common];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_3(a1);
      }
      goto LABEL_13;
    case 1:
      v8 = +[_MLLog common];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_1(a1);
      }
LABEL_13:

      break;
  }
}

void __36___MLNetworkUtilities_configureTLS___block_invoke(uint64_t a1, id a2)
{
  options = a2;
  v3 = (const void *)[*(id *)(a1 + 32) psk];
  size_t v4 = strlen((const char *)[*(id *)(a1 + 32) psk]);
  v5 = dispatch_data_create(v3, v4, 0, 0);
  sec_protocol_options_add_pre_shared_key(options, v5, v5);
  sec_protocol_options_append_tls_ciphersuite(options, (tls_ciphersuite_t)0xA8u);
}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_1(uint64_t a1)
{
  v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  nw_listener_get_port(*(nw_listener_t *)(a1 + 32));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_238967000, v3, v4, "%@: Listener on port %u (%s) waiting", v5, v6, v7, v8, 2u);
}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v5 = (void *)v4;
  uint64_t v6 = "udp";
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v6 = "tcp";
  }
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2080;
  v10 = v6;
  _os_log_debug_impl(&dword_238967000, a2, OS_LOG_TYPE_DEBUG, "%@: listener (%s) failed", (uint8_t *)&v7, 0x16u);
}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_3(uint64_t a1)
{
  v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  nw_listener_get_port(*(nw_listener_t *)(a1 + 32));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_238967000, v3, v4, "%@: Listener on port %u (%s) ready!", v5, v6, v7, v8, 2u);
}

@end