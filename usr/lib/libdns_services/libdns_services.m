uint64_t dnssd_getaddrinfo_result_get_interface_index(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t dnssd_getaddrinfo_result_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 192);
}

uint64_t dnssd_getaddrinfo_result_get_address(uint64_t a1)
{
  return a1 + 32;
}

const char *dnssd_getaddrinfo_result_get_provider_name(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 88));
}

uint64_t dnssd_getaddrinfo_result_get_protocol(uint64_t a1)
{
  return *(unsigned int *)(a1 + 196);
}

const char *dnssd_getaddrinfo_result_get_hostname(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 64));
}

const char *dnssd_getaddrinfo_result_get_actual_hostname(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 72));
}

char *dnssd_getaddrinfo_result_get_tracker_hostname(uint64_t a1)
{
  result = *(char **)(a1 + 152);
  if (result) {
    return (char *)xpc_string_get_string_ptr(result);
  }
  return result;
}

uint64_t dnssd_getaddrinfo_result_is_from_cache(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 206);
}

uint64_t dnssd_getaddrinfo_result_has_extended_dns_error(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 210);
}

char *dnssd_cname_array_get_cname(uint64_t a1, size_t a2)
{
  result = *(char **)(a1 + 24);
  if (result) {
    return (char *)xpc_array_get_string(result, a2);
  }
  return result;
}

uint64_t dnssd_getaddrinfo_result_get_tracker_is_approved(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 208);
}

uint64_t dnssd_getaddrinfo_result_get_tracker_can_block_request(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 209);
}

char *dnssd_getaddrinfo_result_get_tracker_owner(uint64_t a1)
{
  result = *(char **)(a1 + 160);
  if (result) {
    return (char *)xpc_string_get_string_ptr(result);
  }
  return result;
}

void *dnssd_cname_array_get_count(uint64_t a1)
{
  result = *(void **)(a1 + 24);
  if (result) {
    return (void *)xpc_array_get_count(result);
  }
  return result;
}

uint64_t ___dnssd_getaddrinfo_take_results_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 96);
  *(void *)(*(void *)(result + 40) + 96) = 0;
  return result;
}

void ___dnssd_getaddrinfo_activate_block_invoke_2(uint64_t a1)
{
}

uint64_t dnssd_getaddrinfo_result_service_is_valid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 207);
}

uint64_t dnssd_getaddrinfo_result_get_negative_reason(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

uint64_t ___dnssd_getaddrinfo_append_results_block_invoke(uint64_t result)
{
  v1 = (void *)(*(void *)(result + 32) + 96);
  do
  {
    v2 = v1;
    uint64_t v3 = *v1;
    v1 = (void *)(*v1 + 24);
  }
  while (v3);
  void *v2 = *(void *)(result + 40);
  return result;
}

const void *dnssd_getaddrinfo_result_get_validation_data(uint64_t a1, void *a2)
{
  length = *(void **)(a1 + 168);
  if (!length)
  {
    bytes_ptr = 0;
    if (!a2) {
      return bytes_ptr;
    }
    goto LABEL_3;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(length);
  length = (void *)xpc_data_get_length(*(xpc_object_t *)(a1 + 168));
  if (a2) {
LABEL_3:
  }
    *a2 = length;
  return bytes_ptr;
}

void dnssd_getaddrinfo_set_use_failover(uint64_t a1, BOOL value)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 56), "use_failover", value);
  }
}

void dnssd_getaddrinfo_set_protocols(uint64_t a1, uint64_t value)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 56), "protocols", value);
  }
}

void dnssd_getaddrinfo_set_log_privacy_level(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 56), "log_privacy_level", a2);
  }
}

void dnssd_getaddrinfo_set_interface_index(uint64_t a1, uint64_t value)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 56), "interface_index", value);
  }
}

void dnssd_getaddrinfo_set_hostname(uint64_t a1, char *string)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "hostname", string);
  }
}

void dnssd_getaddrinfo_set_flags(uint64_t a1, uint64_t value)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 56), "flags", value);
  }
}

void dnssd_getaddrinfo_set_service_scheme(uint64_t a1, char *string)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "service_scheme", string);
  }
}

void *___dnssd_get_empty_cname_array_block_invoke()
{
  result = _dnssd_cname_array_create(0, 0);
  _dnssd_get_empty_cname_array_s_empty_cname_array = (uint64_t)result;
  *((_DWORD *)result + 2) = 0x7FFFFFFF;
  *((_DWORD *)result + 3) = 0x7FFFFFFF;
  return result;
}

void dnssd_getaddrinfo_set_event_handler(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    uint64_t v3 = _Block_copy(aBlock);
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = *(const void **)(a1 + 112);
  if (v4) {
    _Block_release(v4);
  }
  *(void *)(a1 + 112) = v3;
}

void dnssd_getaddrinfo_set_result_handler(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    uint64_t v3 = _Block_copy(aBlock);
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = *(const void **)(a1 + 104);
  if (v4) {
    _Block_release(v4);
  }
  *(void *)(a1 + 104) = v3;
}

dispatch_queue_t ___dnssd_client_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.dnssd.client", 0);
  _dnssd_client_queue_queue = (uint64_t)result;
  return result;
}

uint64_t dnssd_getaddrinfo_result_get_cnames(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 80);
  if (!result)
  {
    if (_dnssd_get_empty_cname_array_s_once != -1) {
      dispatch_once(&_dnssd_get_empty_cname_array_s_once, &__block_literal_global_65);
    }
    return _dnssd_get_empty_cname_array_s_empty_cname_array;
  }
  return result;
}

void ___dnssd_client_connection_block_invoke()
{
  if (_dnssd_client_queue_once != -1) {
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_56);
  }
  _dnssd_client_connection_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.dnssd.service", (dispatch_queue_t)_dnssd_client_queue_queue, 2uLL);
  xpc_connection_set_event_handler((xpc_connection_t)_dnssd_client_connection_connection, &__block_literal_global_21);
  v0 = (_xpc_connection_s *)_dnssd_client_connection_connection;

  xpc_connection_activate(v0);
}

void dnssd_getaddrinfo_set_queue(uint64_t a1, dispatch_object_t object)
{
  if (*(unsigned char *)(a1 + 144))
  {
    if (!*(void *)(a1 + 40))
    {
      *(void *)(a1 + 40) = object;
      dispatch_retain(object);
      _dnssd_client_activate_getaddrinfo_async((void *)a1);
    }
  }
  else
  {
    dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 40);
    if (v4) {
      dispatch_release(v4);
    }
    *(void *)(a1 + 40) = object;
  }
}

void ___dnssd_client_send_getaddrinfo_command_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  if (v3[34] == 1)
  {
    if (MEMORY[0x210561130](a2) != MEMORY[0x263EF8708])
    {
      if (a2 == (void *)MEMORY[0x263EF86A0]) {
        goto LABEL_10;
      }
      if (a2 == (void *)MEMORY[0x263EF86A8]) {
        int v5 = -65563;
      }
      else {
        int v5 = -65537;
      }
      goto LABEL_9;
    }
    int int32 = mdns_xpc_dictionary_get_int32(a2, "error", 0);
    if (int32)
    {
      int v5 = int32;
LABEL_9:
      _dnssd_client_fail_getaddrinfo(v3, v5);
      goto LABEL_10;
    }
    v3[34] = 2;
  }
LABEL_10:
  v7 = *(void **)(a1 + 32);

  os_release(v7);
}

void dnssd_getaddrinfo_invalidate(void *a1)
{
  os_retain(a1);
  if (_dnssd_client_queue_once != -1) {
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_56);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __dnssd_getaddrinfo_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_94;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_dnssd_client_queue_queue, block);
}

void *dnssd_getaddrinfo_create()
{
  objc_opt_class();
  uint64_t v0 = _os_object_alloc();
  v1 = (void *)v0;
  if (v0)
  {
    *(void *)(v0 + 16) = &_dnssd_getaddrinfo_kind;
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    v1[7] = v2;
    if (!v2 || (dispatch_queue_t v3 = dispatch_queue_create("com.apple.dnssd.getaddrinfo.mutex", 0), (v1[6] = v3) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void dnssd_getaddrinfo_activate(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 144))
  {
    if (*(void *)(a1 + 40)) {
      _dnssd_client_activate_getaddrinfo_async((void *)a1);
    }
    *(unsigned char *)(a1 + 144) = 1;
  }
}

void _dnssd_client_activate_getaddrinfo_async(void *a1)
{
  os_retain(a1);
  if (_dnssd_client_queue_once != -1) {
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_56);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___dnssd_client_activate_getaddrinfo_async_block_invoke;
  block[3] = &__block_descriptor_tmp_58;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_dnssd_client_queue_queue, block);
}

char *_dnssd_getaddrinfo_copy_description(uint64_t a1, int a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10 = *(void **)(a1 + 64);
  if (v10)
  {
    string_ptr = xpc_string_get_string_ptr(v10);
    if ((a3 & (string_ptr != 0)) != 0) {
      v13 = "<redacted hostname>";
    }
    else {
      v13 = string_ptr;
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = 0;
  size_t v15 = 0;
  if (v13) {
    LOBYTE(v16) = (_BYTE)v13;
  }
  else {
    v16 = "<NO HOSTNAME>";
  }
  while (1)
  {
    v22 = v14;
    uint64_t v17 = (uint64_t)&v14[v15];
    if (a2)
    {
      unsigned int v18 = _dnssd_snprintf(&v22, v17, "dnssd_%s (%p): ", a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8));
      if ((v18 & 0x80000000) != 0) {
        goto LABEL_17;
      }
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v19 = 0;
    }
    unsigned int v20 = _dnssd_snprintf(&v22, v17, "hostname: %s", a4, a5, a6, a7, a8, (char)v16);
    if ((v20 & 0x80000000) != 0)
    {
LABEL_17:
      if (v14)
      {
        free(v14);
        return 0;
      }
      return v14;
    }
    if (v14) {
      return v14;
    }
    size_t v15 = v19 + v20 + 1;
    uint64_t result = (char *)malloc_type_malloc(v15, 0xA172743EuLL);
    if (!result) {
      break;
    }
    v14 = result;
    char *result = 0;
  }
  __break(1u);
  return result;
}

uint64_t _dnssd_snprintf(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v10 = *a1;
  size_t v11 = a2 - (void)*a1;
  uint64_t result = vsnprintf(*a1, v11, a3, &a9);
  if ((result & 0x80000000) == 0)
  {
    size_t v13 = result;
    if (v11 < result) {
      size_t v13 = v11;
    }
    *a1 = &v10[v13];
  }
  return result;
}

void __dnssd_getaddrinfo_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 136);
  if (v2 != 4)
  {
    v4 = &g_gai_list;
    do
    {
      int v5 = v4;
      uint64_t v6 = *v4;
      v4 = (uint64_t *)(*v4 + 24);
      if (v6) {
        BOOL v7 = v6 == v1;
      }
      else {
        BOOL v7 = 1;
      }
    }
    while (!v7);
    if (v6)
    {
      *int v5 = *(void *)(v1 + 24);
      *(void *)(v1 + 24) = 0;
      os_release((void *)v1);
      int v2 = *(_DWORD *)(v1 + 136);
    }
    if ((v2 - 1) <= 1)
    {
      xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
      if (v8)
      {
        v9 = v8;
        xpc_dictionary_set_uint64(v8, "id", *(void *)(v1 + 32));
        xpc_dictionary_set_string(v9, "command", "stop");
        if (_dnssd_client_connection_once != -1) {
          dispatch_once(&_dnssd_client_connection_once, &__block_literal_global_17);
        }
        v10 = (_xpc_connection_s *)_dnssd_client_connection_connection;
        if (_dnssd_client_queue_once != -1) {
          dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_56);
        }
        xpc_connection_send_message_with_reply(v10, v9, (dispatch_queue_t)_dnssd_client_queue_queue, &__block_literal_global);
        xpc_release(v9);
      }
    }
    size_t v11 = *(NSObject **)(v1 + 88);
    if (v11)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v1 + 88));
      dispatch_release(v11);
      *(void *)(v1 + 88) = 0;
    }
    _dnssd_getaddrinfo_remove_all_results((void *)v1);
    if (*(void *)(v1 + 40))
    {
      os_retain((void *)v1);
      v12 = *(NSObject **)(v1 + 40);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___dnssd_getaddrinfo_invalidate_block_invoke;
      block[3] = &__block_descriptor_tmp_53;
      block[4] = v1;
      dispatch_async(v12, block);
    }
    *(_DWORD *)(v1 + 136) = 4;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  os_release((void *)v1);
}

void ___dnssd_client_activate_getaddrinfo_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 136)) {
    goto LABEL_7;
  }
  xpc_object_t value = _dnssd_xpc_dictionary_get_value(*(void **)(v2 + 56), "hostname", MEMORY[0x263EF8798]);
  if (!value)
  {
    int v10 = -6705;
    goto LABEL_10;
  }
  xpc_object_t v4 = xpc_copy(value);
  *(void *)(v2 + 64) = v4;
  if (!v4
    || (dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, *(dispatch_queue_t *)(v2 + 40)),
        (*(void *)(v2 + 88) = v5) == 0))
  {
    int v10 = -6729;
LABEL_10:
    os_retain((void *)v2);
    size_t v11 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___dnssd_getaddrinfo_activate_block_invoke_3;
    block[3] = &__block_descriptor_tmp_61;
    block[4] = v2;
    int v13 = v10;
    dispatch_async(v11, block);
    *(_DWORD *)(v2 + 136) = 3;
    goto LABEL_7;
  }
  os_retain((void *)v2);
  uint64_t v6 = *(NSObject **)(v2 + 88);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___dnssd_getaddrinfo_activate_block_invoke;
  handler[3] = &__block_descriptor_tmp_59;
  handler[4] = v2;
  handler[5] = v6;
  dispatch_source_set_event_handler(v6, handler);
  BOOL v7 = *(NSObject **)(v2 + 88);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 0x40000000;
  v14[2] = ___dnssd_getaddrinfo_activate_block_invoke_2;
  v14[3] = &__block_descriptor_tmp_60;
  v14[4] = v2;
  dispatch_source_set_cancel_handler(v7, v14);
  dispatch_activate(*(dispatch_object_t *)(v2 + 88));
  uint64_t v8 = ++_dnssd_client_get_new_id_last_id;
  *(_DWORD *)(v2 + 136) = 1;
  *(void *)(v2 + 24) = g_gai_list;
  *(void *)(v2 + 32) = v8;
  g_gai_list = v2;
  os_retain((void *)v2);
  int v9 = _dnssd_client_send_getaddrinfo_command(v2);
  if (v9) {
    _dnssd_client_fail_getaddrinfo((void *)v2, v9);
  }
LABEL_7:
  os_release(*(void **)(a1 + 32));
}

void ___dnssd_getaddrinfo_activate_block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  char data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 40));
  if ((data & 2) != 0)
  {
    uint64_t v3 = v1[14];
    if (v3) {
      (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 2, 0);
    }
  }
  if (data)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long block = 0u;
    long long v22 = 0u;
    uint64_t v4 = _dnssd_getaddrinfo_take_results((uint64_t)v1);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = v5;
        uint64_t v5 = *(void *)(v5 + 24);
        *(void *)(v7 + 24) = 0;
        *((void *)&block + v6++) = v7;
        if (v6 == 32 || v5 == 0)
        {
          uint64_t v9 = v1[13];
          if (v9) {
            (*(void (**)(uint64_t, long long *, uint64_t))(v9 + 16))(v9, &block, v6);
          }
          if (v6)
          {
            p_long long block = (void **)&block;
            do
            {
              size_t v11 = *p_block++;
              os_release(v11);
              --v6;
            }
            while (v6);
          }
        }
      }
      while (v5);
    }
  }
  if ((data & 4) != 0)
  {
    uint64_t v17 = 0;
    unsigned int v18 = &v17;
    uint64_t v19 = 0x2000000000;
    int v20 = 0;
    v12 = v1[6];
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 0x40000000;
    *(void *)&long long v22 = ___dnssd_getaddrinfo_process_events_block_invoke;
    *((void *)&v22 + 1) = &unk_264123420;
    *(void *)&long long v23 = &v17;
    *((void *)&v23 + 1) = v1;
    dispatch_sync(v12, &block);
    uint64_t v13 = v1[14];
    if (v13)
    {
      unsigned int v14 = *((_DWORD *)v18 + 6);
      if (v14)
      {
        unsigned int v15 = v14 + 6729;
        if (v14 == -6705) {
          unsigned int v14 = -65540;
        }
        if (v15 >= 2) {
          uint64_t v16 = v14;
        }
        else {
          uint64_t v16 = 4294901757;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, 1, v16);
      }
    }
    _Block_object_dispose(&v17, 8);
  }
}

void _dnssd_getaddrinfo_result_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    xpc_release(v2);
    a1[8] = 0;
  }
  uint64_t v3 = (void *)a1[9];
  if (v3)
  {
    xpc_release(v3);
    a1[9] = 0;
  }
  uint64_t v4 = (void *)a1[10];
  if (v4)
  {
    os_release(v4);
    a1[10] = 0;
  }
  uint64_t v5 = (void *)a1[11];
  if (v5)
  {
    xpc_release(v5);
    a1[11] = 0;
  }
  uint64_t v6 = (void *)a1[14];
  if (v6)
  {
    xpc_release(v6);
    a1[14] = 0;
  }
  uint64_t v7 = (void *)a1[15];
  if (v7)
  {
    xpc_release(v7);
    a1[15] = 0;
  }
  uint64_t v8 = (void *)a1[16];
  if (v8)
  {
    xpc_release(v8);
    a1[16] = 0;
  }
  uint64_t v9 = (void *)a1[17];
  if (v9)
  {
    xpc_release(v9);
    a1[17] = 0;
  }
  int v10 = (void *)a1[18];
  if (v10)
  {
    xpc_release(v10);
    a1[18] = 0;
  }
  size_t v11 = (void *)a1[19];
  if (v11)
  {
    xpc_release(v11);
    a1[19] = 0;
  }
  v12 = (void *)a1[20];
  if (v12)
  {
    xpc_release(v12);
    a1[20] = 0;
  }
  uint64_t v13 = (void *)a1[12];
  if (v13)
  {
    xpc_release(v13);
    a1[12] = 0;
  }
  unsigned int v14 = (void *)a1[13];
  if (v14)
  {
    xpc_release(v14);
    a1[13] = 0;
  }
  unsigned int v15 = (void *)a1[21];
  if (v15)
  {
    xpc_release(v15);
    a1[21] = 0;
  }
  uint64_t v16 = (void *)a1[22];
  if (v16)
  {
    xpc_release(v16);
    a1[22] = 0;
  }
}

uint64_t _dnssd_getaddrinfo_take_results(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___dnssd_getaddrinfo_take_results_block_invoke;
  v4[3] = &unk_264123338;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _dnssd_cname_array_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

void ___dnssd_client_connection_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x210561130](a2) == MEMORY[0x263EF8708])
  {
    string = xpc_dictionary_get_string(a2, "command");
    if (string && !strcmp(string, "keepalive"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        uint64_t v13 = reply;
        xpc_dictionary_send_reply();
        xpc_release(v13);
      }
    }
    else
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "id");
      uint64_t uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v10 = g_gai_list;
      if (g_gai_list)
      {
        while (*(void *)(v10 + 32) != uint64_limited)
        {
          uint64_t v10 = *(void *)(v10 + 24);
          if (!v10) {
            return;
          }
        }
        int int32 = mdns_xpc_dictionary_get_int32(a2, "error", 0);
        if (int32)
        {
          _dnssd_client_fail_getaddrinfo((void *)v10, int32);
        }
        else
        {
          xpc_object_t array = xpc_dictionary_get_array(a2, "results");
          if (array)
          {
            v17[0] = 0;
            v17[1] = v17;
            v17[2] = 0x2000000000;
            v17[3] = &v18;
            uint64_t v18 = 0;
            applier[0] = MEMORY[0x263EF8330];
            applier[1] = 0x40000000;
            applier[2] = ___dnssd_client_handle_message_block_invoke;
            applier[3] = &unk_264123248;
            applier[4] = v17;
            applier[5] = v10;
            xpc_array_apply(array, applier);
            if (v18)
            {
              unsigned int v15 = *(NSObject **)(v10 + 48);
              block[0] = MEMORY[0x263EF8330];
              block[1] = 0x40000000;
              block[2] = ___dnssd_getaddrinfo_append_results_block_invoke;
              block[3] = &__block_descriptor_tmp_49;
              block[4] = v10;
              void block[5] = v18;
              dispatch_sync(v15, block);
              dispatch_source_merge_data(*(dispatch_source_t *)(v10 + 88), 1uLL);
              uint64_t v18 = 0;
            }
            _Block_object_dispose(v17, 8);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = g_gai_list;
    if (a2 == (void *)MEMORY[0x263EF86A0] && g_gai_list != 0)
    {
      do
      {
        uint64_t v5 = *(void *)(v3 + 24);
        *(_DWORD *)(v3 + 136) = 1;
        int v6 = _dnssd_client_send_getaddrinfo_command(v3);
        if (v6) {
          _dnssd_client_fail_getaddrinfo((void *)v3, v6);
        }
        else {
          _dnssd_getaddrinfo_remove_all_results((void *)v3);
        }
        uint64_t v3 = v5;
      }
      while (v5);
    }
  }
}

uint64_t ___dnssd_client_handle_message_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  xpc_object_t value = _dnssd_xpc_dictionary_get_value(a3, "rname", MEMORY[0x263EF8798]);
  if (!value) {
    return 1;
  }
  int v6 = value;
  xpc_object_t v7 = _dnssd_xpc_dictionary_get_value(a3, "rdata", MEMORY[0x263EF86F8]);
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v7;
  int int32 = mdns_xpc_dictionary_get_int32(a3, "error", 0);
  xpc_object_t v10 = xpc_dictionary_get_value(a3, "flags");
  int uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)v10, 0xFFFFFFFFuLL);
  xpc_object_t v11 = xpc_dictionary_get_value(a3, "interface_index");
  int v79 = _mdns_xpc_object_get_uint64_limited((uint64_t)v11, 0xFFFFFFFFuLL);
  xpc_object_t v12 = xpc_dictionary_get_value(a3, "rtype");
  unsigned __int16 v13 = _mdns_xpc_object_get_uint64_limited((uint64_t)v12, 0xFFFFuLL);
  xpc_object_t v14 = xpc_dictionary_get_value(a3, "rprotocol");
  unsigned __int16 v15 = _mdns_xpc_object_get_uint64_limited((uint64_t)v14, 0xFFFFuLL);
  uint64_t v16 = MEMORY[0x263EF8798];
  xpc_object_t v80 = _dnssd_xpc_dictionary_get_value(a3, "provider_name", MEMORY[0x263EF8798]);
  xpc_object_t v17 = _mdns_xpc_dictionary_get_object(a3, "tracker_hostname", v16);
  xpc_object_t v18 = _mdns_xpc_dictionary_get_object(a3, "tracker_owner", v16);
  BOOL v77 = xpc_dictionary_get_BOOL(a3, "tracker_approved");
  BOOL v76 = xpc_dictionary_get_BOOL(a3, "tracker_can_block_request");
  LOBYTE(v93) = 0;
  unsigned int v19 = mdns_xpc_dictionary_get_int32(a3, "negative_reason", (BOOL *)&v93);
  BOOL v20 = v19 >= 6 || v93 == 0;
  unsigned int v21 = v20 ? 0 : v19;
  xpc_object_t v81 = _dnssd_xpc_dictionary_get_value(a3, "validation_data", MEMORY[0x263EF86F8]);
  xpc_object_t xdict = _dnssd_xpc_dictionary_get_value(a3, "extended_dns_error", MEMORY[0x263EF8708]);
  if (int32)
  {
    if (int32 != -65554) {
      return 1;
    }
  }
  if (v17)
  {
    mdns_xpc_string_replace_if_different((xpc_object_t *)(v4 + 120), v17);
    xpc_object_t object = *(xpc_object_t *)(v4 + 120);
  }
  else
  {
    xpc_object_t object = 0;
  }
  int v22 = v15;
  int v23 = v13;
  if (v18)
  {
    mdns_xpc_string_replace_if_different((xpc_object_t *)(v4 + 128), v18);
    xpc_object_t v73 = *(xpc_object_t *)(v4 + 128);
  }
  else
  {
    xpc_object_t v73 = 0;
  }
  if (v13 - 64 >= 2)
  {
    if (v13 != 28 && v13 != 1) {
      return 1;
    }
    xpc_object_t array = xpc_dictionary_get_array(a3, "cname_update");
    if (array)
    {
      long long v25 = array;
      if (v13 == 28) {
        long long v26 = (void **)(v4 + 80);
      }
      else {
        long long v26 = (void **)(v4 + 72);
      }
      LODWORD(v93) = 0;
      if (*v26)
      {
        os_release(*v26);
        *long long v26 = 0;
      }
      *long long v26 = _dnssd_cname_array_create(v25, (int *)&v93);
    }
    if (int32 == -65554)
    {
      int v35 = 3;
    }
    else
    {
      if (uint64_limited >= 0) {
        int v36 = 1;
      }
      else {
        int v36 = 4;
      }
      if ((uint64_limited & 2) != 0) {
        int v35 = v36;
      }
      else {
        int v35 = 2;
      }
      size_t v37 = xpc_data_get_length(v8);
      if (v13 == 1)
      {
        if (v37 != 4) {
          return 1;
        }
        v38 = *(void **)(v4 + 64);
        int v39 = 2;
        goto LABEL_57;
      }
      if (v37 != 16) {
        return 1;
      }
    }
    if (v13 == 1) {
      int v39 = 2;
    }
    else {
      int v39 = 30;
    }
    v38 = *(void **)(v4 + 64);
    if (v23 == 28)
    {
      v40 = (void **)(v4 + 80);
LABEL_59:
      v41 = *v40;
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      objc_opt_class();
      uint64_t v43 = _os_object_alloc();
      if (v43)
      {
        uint64_t v31 = v43;
        *(void *)(v43 + 16) = &_dnssd_getaddrinfo_result_kind;
        *(_DWORD *)(v43 + 188) = v79;
        *(_DWORD *)(v43 + 192) = v35;
        *(_DWORD *)(v43 + 196) = v22;
        *(_DWORD *)(v43 + 200) = v21;
        if (MEMORY[0x210561130](v38) == MEMORY[0x263EF8798])
        {
          xpc_object_t v44 = xpc_copy(v38);
          *(void *)(v31 + 64) = v44;
          if (v44)
          {
            if (MEMORY[0x210561130](v6) == MEMORY[0x263EF8798])
            {
              xpc_object_t v45 = xpc_copy(v6);
              *(void *)(v31 + 72) = v45;
              if (v45)
              {
                if (!v41)
                {
                  if (_dnssd_get_empty_cname_array_s_once != -1) {
                    dispatch_once(&_dnssd_get_empty_cname_array_s_once, &__block_literal_global_65);
                  }
                  v41 = (void *)_dnssd_get_empty_cname_array_s_empty_cname_array;
                }
                *(void *)(v31 + 80) = v41;
                os_retain(v41);
                if (v39 == 30)
                {
                  *(_WORD *)(v31 + 32) = 7708;
                  if (*(_DWORD *)(v31 + 192) != 3)
                  {
                    *(_OWORD *)(v31 + 40) = *bytes_ptr;
                    if (*(unsigned __int8 *)(v31 + 40) == 254 && (*(unsigned char *)(v31 + 41) & 0xC0) == 0x80) {
                      *(_DWORD *)(v31 + 56) = *(_DWORD *)(v31 + 188);
                    }
                  }
                }
                else
                {
                  *(_WORD *)(v31 + 32) = 528;
                  if (*(_DWORD *)(v31 + 192) != 3) {
                    *(_DWORD *)(v31 + 36) = *(_DWORD *)bytes_ptr;
                  }
                }
                if (!v80
                  || MEMORY[0x210561130](v80) == MEMORY[0x263EF8798]
                  && (xpc_object_t v46 = xpc_copy(v80), (*(void *)(v31 + 88) = v46) != 0))
                {
                  if (object)
                  {
                    *(void *)(v31 + 152) = xpc_retain(object);
                    if (v73) {
                      *(void *)(v31 + 160) = xpc_retain(v73);
                    }
                    *(unsigned char *)(v31 + 208) = v77;
                    *(unsigned char *)(v31 + 209) = v76;
                  }
                  if (!v81
                    || MEMORY[0x210561130](v81) == MEMORY[0x263EF86F8]
                    && (xpc_object_t v47 = xpc_copy(v81), (*(void *)(v31 + 168) = v47) != 0))
                  {
                    if (xdict)
                    {
                      xpc_object_t v48 = xpc_dictionary_get_value(xdict, "code");
                      *(_WORD *)(v31 + 204) = _mdns_xpc_object_get_uint64_limited((uint64_t)v48, 0xFFFFuLL);
                      xpc_object_t v49 = _mdns_xpc_dictionary_get_object(xdict, "text", MEMORY[0x263EF8798]);
                      *(void *)(v31 + 176) = v49;
                      uint64_t v50 = a1;
                      if (v49) {
                        xpc_retain(v49);
                      }
                      *(unsigned char *)(v31 + 210) = 1;
                      goto LABEL_113;
                    }
LABEL_112:
                    uint64_t v50 = a1;
LABEL_113:
                    if ((~uint64_limited & 0x40000002) == 0) {
                      *(unsigned char *)(v31 + 206) = 1;
                    }
                    **(void **)(*(void *)(*(void *)(v50 + 32) + 8) + 24) = v31;
                    *(void *)(*(void *)(*(void *)(v50 + 32) + 8) + 24) = v31 + 24;
                    return 1;
                  }
                }
              }
            }
          }
        }
        goto LABEL_148;
      }
      return 1;
    }
LABEL_57:
    v40 = (void **)(v4 + 72);
    goto LABEL_59;
  }
  if (int32 != -65554 && !xpc_data_get_length(v8)) {
    return 1;
  }
  long long v27 = *(void **)(v4 + 64);
  long long v28 = (unsigned __int16 *)xpc_data_get_bytes_ptr(v8);
  size_t v29 = xpc_data_get_length(v8);
  objc_opt_class();
  uint64_t v30 = _os_object_alloc();
  if (!v30) {
    return 1;
  }
  uint64_t v31 = v30;
  *(void *)(v30 + 16) = &_dnssd_getaddrinfo_result_kind;
  *(_DWORD *)(v30 + 188) = v79;
  *(_DWORD *)(v30 + 192) = 5;
  *(_DWORD *)(v30 + 196) = v22;
  *(_DWORD *)(v30 + 200) = v21;
  if (MEMORY[0x210561130](v27) != MEMORY[0x263EF8798]) {
    goto LABEL_148;
  }
  *(void *)(v31 + 64) = xpc_copy(v27);
  if (MEMORY[0x210561130](v6) != MEMORY[0x263EF8798]) {
    goto LABEL_148;
  }
  xpc_object_t v32 = xpc_copy(v6);
  *(void *)(v31 + 72) = v32;
  if (!v32) {
    goto LABEL_148;
  }
  if (!v28 || !v29)
  {
    *(unsigned char *)(v31 + 207) = 0;
    if (!v80) {
      goto LABEL_105;
    }
LABEL_103:
    if (MEMORY[0x210561130](v80) == MEMORY[0x263EF8798])
    {
      xpc_object_t v56 = xpc_copy(v80);
      *(void *)(v31 + 88) = v56;
      if (v56) {
        goto LABEL_105;
      }
    }
LABEL_148:
    os_release((void *)v31);
    return 1;
  }
  if (v29 >= 2)
  {
    if (*v28)
    {
      uint64_t v87 = 0;
      uint64_t v88 = (uint64_t)&v87;
      uint64_t v89 = 0x2000000000;
      LOBYTE(v90) = 0;
      uint64_t v93 = MEMORY[0x263EF8330];
      uint64_t v94 = 0x40000000;
      v95 = __dnssd_svcb_is_valid_block_invoke;
      v96 = &unk_264123490;
      v97 = &v87;
      _dnssd_svcb_extract_values(v28, v29, 0, (uint64_t)&v93);
      char v34 = *(unsigned char *)(v88 + 24) == 0;
      _Block_object_dispose(&v87, 8);
    }
    else
    {
      char v34 = dnssd_svcb_service_name_is_empty((uint64_t)v28, v29) ^ 1;
    }
    *(unsigned char *)(v31 + 207) = v34;
    unsigned int v33 = bswap32(*v28) >> 16;
  }
  else
  {
    LOWORD(v33) = 0;
    *(unsigned char *)(v31 + 207) = 0;
  }
  *(_WORD *)(v31 + 186) = v33;
  uint64_t v87 = 0;
  uint64_t v88 = (uint64_t)&v87;
  uint64_t v89 = 0x2000000000;
  LOWORD(v90) = 0;
  uint64_t v93 = MEMORY[0x263EF8330];
  uint64_t v94 = 0x40000000;
  v95 = __dnssd_svcb_get_port_block_invoke;
  v96 = &unk_2641234B8;
  v97 = &v87;
  _dnssd_svcb_extract_values(v28, v29, 3, (uint64_t)&v93);
  __int16 v51 = *(_WORD *)(v88 + 24);
  _Block_object_dispose(&v87, 8);
  *(_WORD *)(v31 + 184) = v51;
  if (v29 < 2) {
    goto LABEL_92;
  }
  v59 = v28 + 1;
  if (v28 == (unsigned __int16 *)-2 || (char *)v28 + v29 <= v59) {
    goto LABEL_92;
  }
  v60 = v28 + 1;
  while (*v60)
  {
    v60 += *v60 + 1;
    if (v60) {
      BOOL v61 = v60 >= (unsigned char *)v28 + v29;
    }
    else {
      BOOL v61 = 1;
    }
    if (v61) {
      goto LABEL_92;
    }
  }
  if ((unsigned __int16)((_WORD)v60 - (_WORD)v59 + 1) > 0x100uLL) {
    goto LABEL_92;
  }
  uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x3F1uLL, 0xF1748037uLL);
  if (result)
  {
    v62 = (char *)result;
    LODWORD(v63) = *((unsigned __int8 *)v28 + 2);
    v64 = (unsigned char *)result;
    if (*((unsigned char *)v28 + 2)
      || (*(unsigned char *)uint64_t result = 46, v64 = (unsigned char *)(result + 1), LODWORD(v63) = *v59, *v59))
    {
      while (v63 <= 0x3F)
      {
        v65 = v59 + 1;
        unint64_t v66 = (unint64_t)&v59[v63 + 1];
        if (v66 >= (unint64_t)(v28 + 129)) {
          break;
        }
        if ((unint64_t)v65 < v66)
        {
          uint64_t v63 = v63;
          do
          {
            unsigned int v68 = *v65++;
            unsigned int v67 = v68;
            if (v68 == 92 || v67 == 46)
            {
              *v64++ = 92;
            }
            else if (v67 <= 0x20)
            {
              *(_WORD *)v64 = 12380;
              unsigned int v69 = (205 * v67) >> 11;
              v64[2] = v69 | 0x30;
              v64 += 3;
              LOBYTE(v67) = (v67 - 10 * v69) | 0x30;
            }
            *v64++ = v67;
            --v63;
          }
          while (v63);
        }
        unsigned char *v64 = 0;
        v70 = &v59[*v59];
        *v64++ = 46;
        int v71 = v70[1];
        v59 = v70 + 1;
        LODWORD(v63) = v71;
        if (!v71) {
          goto LABEL_142;
        }
      }
    }
    else
    {
LABEL_142:
      unsigned char *v64 = 0;
      if (v64 != (unsigned char *)-1)
      {
        if (dnssd_svcb_service_name_is_empty((uint64_t)v28, v29)) {
          xpc_object_t v72 = xpc_copy(*(xpc_object_t *)(v31 + 64));
        }
        else {
          xpc_object_t v72 = xpc_string_create(v62);
        }
        *(void *)(v31 + 144) = v72;
        free(v62);
        if (!*(void *)(v31 + 144)) {
          goto LABEL_148;
        }
        goto LABEL_92;
      }
    }
    free(v62);
LABEL_92:
    uint64_t v87 = 0;
    uint64_t v88 = (uint64_t)&v87;
    uint64_t v89 = 0x2000000000;
    v90 = 0;
    uint64_t v93 = MEMORY[0x263EF8330];
    uint64_t v94 = 0x40000000;
    v95 = __dnssd_svcb_copy_doh_uri_block_invoke;
    v96 = &unk_2641234E0;
    v97 = &v87;
    _dnssd_svcb_extract_values(v28, v29, 0x8000, (uint64_t)&v93);
    v52 = *(char **)(v88 + 24);
    _Block_object_dispose(&v87, 8);
    if (v52)
    {
      *(void *)(v31 + 112) = xpc_string_create(v52);
      free(v52);
      if (!*(void *)(v31 + 112)) {
        goto LABEL_148;
      }
    }
    uint64_t v87 = 0;
    uint64_t v88 = (uint64_t)&v87;
    uint64_t v89 = 0x2000000000;
    v90 = 0;
    uint64_t v93 = MEMORY[0x263EF8330];
    uint64_t v94 = 0x40000000;
    v95 = __dnssd_svcb_copy_doh_path_block_invoke;
    v96 = &unk_264123508;
    v97 = &v87;
    _dnssd_svcb_extract_values(v28, v29, 7, (uint64_t)&v93);
    v53 = *(char **)(v88 + 24);
    _Block_object_dispose(&v87, 8);
    if (v53)
    {
      *(void *)(v31 + 120) = xpc_string_create(v53);
      free(v53);
      if (!*(void *)(v31 + 120)) {
        goto LABEL_148;
      }
    }
    size_t length = 0;
    uint64_t v87 = 0;
    uint64_t v88 = (uint64_t)&v87;
    uint64_t v89 = 0x2000000000;
    v90 = 0;
    uint64_t v93 = MEMORY[0x263EF8330];
    uint64_t v94 = 0x40000000;
    v95 = __dnssd_svcb_copy_ech_config_block_invoke;
    v96 = &unk_264123530;
    v97 = &v87;
    p_size_t length = &length;
    _dnssd_svcb_extract_values(v28, v29, 5, (uint64_t)&v93);
    v54 = *(void **)(v88 + 24);
    _Block_object_dispose(&v87, 8);
    if (v54)
    {
      *(void *)(v31 + 96) = xpc_data_create(v54, length);
      free(v54);
      if (!*(void *)(v31 + 96)) {
        goto LABEL_148;
      }
    }
    size_t v85 = 0;
    uint64_t v87 = 0;
    uint64_t v88 = (uint64_t)&v87;
    uint64_t v89 = 0x2000000000;
    v90 = 0;
    uint64_t v93 = MEMORY[0x263EF8330];
    uint64_t v94 = 0x40000000;
    v95 = __dnssd_svcb_copy_odoh_config_block_invoke;
    v96 = &unk_264123558;
    v97 = &v87;
    p_size_t length = &v85;
    _dnssd_svcb_extract_values(v28, v29, 32769, (uint64_t)&v93);
    v55 = *(void **)(v88 + 24);
    _Block_object_dispose(&v87, 8);
    if (v55)
    {
      *(void *)(v31 + 128) = xpc_data_create(v55, v85);
      free(v55);
      if (!*(void *)(v31 + 128)) {
        goto LABEL_148;
      }
    }
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 0x40000000;
    v84[2] = ___dnssd_getaddrinfo_result_create_svcb_block_invoke;
    v84[3] = &__block_descriptor_tmp_46;
    v84[4] = v31;
    uint64_t v93 = MEMORY[0x263EF8330];
    uint64_t v94 = 0x40000000;
    v95 = __dnssd_svcb_access_alpn_values_block_invoke;
    v96 = &unk_264123580;
    v97 = v84;
    _dnssd_svcb_extract_values(v28, v29, 1, (uint64_t)&v93);
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 0x40000000;
    v83[2] = ___dnssd_getaddrinfo_result_create_svcb_block_invoke_2;
    v83[3] = &__block_descriptor_tmp_48;
    v83[4] = v31;
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x2000000000;
    char v102 = 1;
    uint64_t v93 = MEMORY[0x263EF8330];
    uint64_t v94 = 0x40000000;
    v95 = __dnssd_svcb_access_address_hints_block_invoke;
    v96 = &unk_2641235A8;
    v97 = v83;
    p_size_t length = (size_t *)&v99;
    _dnssd_svcb_extract_values(v28, v29, 4, (uint64_t)&v93);
    if (*((unsigned char *)v100 + 24))
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 0x40000000;
      uint64_t v89 = (uint64_t)__dnssd_svcb_access_address_hints_block_invoke_2;
      v90 = &unk_2641235D0;
      v91 = v83;
      v92 = &v99;
      _dnssd_svcb_extract_values(v28, v29, 6, (uint64_t)&v87);
    }
    _Block_object_dispose(&v99, 8);
    if (!v80)
    {
LABEL_105:
      if (object)
      {
        *(void *)(v31 + 152) = xpc_retain(object);
        if (v73) {
          *(void *)(v31 + 160) = xpc_retain(v73);
        }
        *(unsigned char *)(v31 + 208) = v77;
        *(unsigned char *)(v31 + 209) = v76;
      }
      if (!v81) {
        goto LABEL_112;
      }
      if (MEMORY[0x210561130](v81) == MEMORY[0x263EF86F8])
      {
        xpc_object_t v57 = xpc_copy(v81);
        *(void *)(v31 + 168) = v57;
        if (v57) {
          goto LABEL_112;
        }
      }
      goto LABEL_148;
    }
    goto LABEL_103;
  }
  __break(1u);
  return result;
}

xpc_object_t _dnssd_xpc_dictionary_get_value(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t result = xpc_dictionary_get_value(a1, a2);
  if (result)
  {
    xpc_object_t v5 = result;
    if (MEMORY[0x210561130]() == a3) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _mdns_xpc_object_get_uint64_limited(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (MEMORY[0x210561130]() == MEMORY[0x263EF87A0])
    {
      xpc_object_t result = xpc_uint64_get_value(v3);
      if (result > a2) {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int64_t mdns_xpc_dictionary_get_int32(void *a1, const char *a2, BOOL *a3)
{
  int64_t result = (int64_t)_mdns_xpc_dictionary_get_object(a1, a2, MEMORY[0x263EF8738]);
  if (!result)
  {
    BOOL v5 = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_6;
  }
  int64_t result = xpc_int64_get_value((xpc_object_t)result);
  BOOL v5 = (int)result == result;
  if ((int)result == result) {
    int64_t result = result;
  }
  else {
    int64_t result = 0;
  }
  if (a3) {
LABEL_6:
  }
    *a3 = v5;
  return result;
}

xpc_object_t _mdns_xpc_dictionary_get_object(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  xpc_object_t v5 = value;
  if (value && MEMORY[0x210561130](value) != a3) {
    return 0;
  }
  return v5;
}

void *_dnssd_cname_array_create(void *a1, int *a2)
{
  objc_opt_class();
  uint64_t v4 = _os_object_alloc();
  xpc_object_t v5 = (void *)v4;
  if (v4)
  {
    *(void *)(v4 + 16) = &_dnssd_cname_array_kind;
    if (a1 && (xpc_object_t v6 = xpc_copy(a1), (v5[3] = v6) == 0))
    {
      uint64_t v8 = 0;
      int v7 = -6729;
    }
    else
    {
      int v7 = 0;
      uint64_t v8 = v5;
      xpc_object_t v5 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
    int v7 = -6728;
  }
  if (a2) {
    *a2 = v7;
  }
  if (v5) {
    os_release(v5);
  }
  return v8;
}

_WORD *_dnssd_svcb_extract_values(_WORD *result, unint64_t a2, int a3, uint64_t a4)
{
  unint64_t v4 = a2 - 2;
  if (a2 >= 2)
  {
    if (*result)
    {
      xpc_object_t v5 = result + 1;
      if (result != (_WORD *)-2 && (_WORD *)((char *)result + a2) > v5)
      {
        uint64_t v8 = result + 1;
        while (*v8)
        {
          v8 += *v8 + 1;
          if (v8) {
            BOOL v9 = v8 >= (unsigned char *)result + a2;
          }
          else {
            BOOL v9 = 1;
          }
          if (v9) {
            return result;
          }
        }
        unint64_t v10 = (unsigned __int16)((_WORD)v8 - (_WORD)v5 + 1);
        if (v10 <= 0x100)
        {
          xpc_object_t v11 = (_WORD *)((char *)v5 + v10);
          for (i = v4 - v10; i >= 4 && v11 != 0; xpc_object_t v11 = (unsigned __int16 *)((char *)v15 + v14))
          {
            unint64_t v14 = bswap32(v11[1]) >> 16;
            BOOL v9 = i - 4 >= v14;
            unint64_t i = i - 4 - v14;
            if (!v9) {
              break;
            }
            unsigned __int16 v15 = v11 + 2;
            if (a3 == bswap32(*v11) >> 16)
            {
              int64_t result = (_WORD *)(*(uint64_t (**)(uint64_t, unsigned __int16 *, unint64_t))(a4 + 16))(a4, v11 + 2, v14);
              if (!result) {
                break;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _dnssd_client_send_getaddrinfo_command(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2) {
    return 4294960567;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "id", *(void *)(a1 + 32));
  xpc_dictionary_set_string(v3, "command", "getaddrinfo");
  xpc_dictionary_set_value(v3, "params", *(xpc_object_t *)(a1 + 56));
  os_retain((void *)a1);
  if (_dnssd_client_connection_once != -1) {
    dispatch_once(&_dnssd_client_connection_once, &__block_literal_global_17);
  }
  unint64_t v4 = (_xpc_connection_s *)_dnssd_client_connection_connection;
  if (_dnssd_client_queue_once != -1) {
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_56);
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___dnssd_client_send_getaddrinfo_command_block_invoke;
  handler[3] = &__block_descriptor_tmp_51;
  handler[4] = a1;
  xpc_connection_send_message_with_reply(v4, v3, (dispatch_queue_t)_dnssd_client_queue_queue, handler);
  xpc_release(v3);
  return 0;
}

void _dnssd_getaddrinfo_remove_all_results(void *a1)
{
  xpc_object_t v2 = (void *)a1[9];
  if (v2)
  {
    os_release(v2);
    a1[9] = 0;
  }
  uint64_t v3 = (void *)a1[10];
  if (v3)
  {
    os_release(v3);
    a1[10] = 0;
  }
  unint64_t v4 = (void *)_dnssd_getaddrinfo_take_results((uint64_t)a1);
  xpc_object_t v5 = a1[11];
  if (v5) {
    dispatch_source_merge_data(v5, 2uLL);
  }
  if (v4)
  {
    do
    {
      xpc_object_t v6 = (void *)v4[3];
      os_release(v4);
      unint64_t v4 = v6;
    }
    while (v6);
  }
}

void _dnssd_getaddrinfo_finalize(void *a1)
{
  xpc_object_t v2 = a1[5];
  if (v2)
  {
    dispatch_release(v2);
    a1[5] = 0;
  }
  uint64_t v3 = a1[6];
  if (v3)
  {
    dispatch_release(v3);
    a1[6] = 0;
  }
  unint64_t v4 = (void *)a1[7];
  if (v4)
  {
    xpc_release(v4);
    a1[7] = 0;
  }
  xpc_object_t v5 = (void *)a1[8];
  if (v5)
  {
    xpc_release(v5);
    a1[8] = 0;
  }
  xpc_object_t v6 = (void *)a1[9];
  if (v6)
  {
    os_release(v6);
    a1[9] = 0;
  }
  int v7 = (void *)a1[10];
  if (v7)
  {
    os_release(v7);
    a1[10] = 0;
  }
  uint64_t v8 = (const void *)a1[13];
  if (v8)
  {
    _Block_release(v8);
    a1[13] = 0;
  }
  BOOL v9 = (const void *)a1[14];
  if (v9)
  {
    _Block_release(v9);
    a1[14] = 0;
  }
  unint64_t v10 = (void *)a1[15];
  if (v10)
  {
    xpc_release(v10);
    a1[15] = 0;
  }
  xpc_object_t v11 = (void *)a1[16];
  if (v11)
  {
    xpc_release(v11);
    a1[16] = 0;
  }
}

uint64_t dnssd_svcb_service_name_is_empty(uint64_t a1, unint64_t a2)
{
  if (a2 < 2) {
    return 0;
  }
  BOOL v3 = 0;
  unint64_t v4 = a1 + 2;
  if (a1 == -2)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 0;
    if (a1 + a2 > v4)
    {
      xpc_object_t v6 = (unsigned char *)(a1 + 2);
      while (*v6)
      {
        v6 += *v6 + 1;
        if (v6) {
          BOOL v7 = (unint64_t)v6 >= a1 + a2;
        }
        else {
          BOOL v7 = 1;
        }
        if (v7)
        {
          BOOL v3 = 0;
          BOOL v5 = 0;
          return v3 & v5;
        }
      }
      unint64_t v8 = (unsigned __int16)((_WORD)v6 - v4 + 1);
      BOOL v5 = v8 < 0x101;
      BOOL v3 = v8 == 1;
    }
  }
  return v3 & v5;
}

uint64_t __dnssd_svcb_access_alpn_values_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    unint64_t v6 = 0;
    do
    {
      v6 += 1 + *(unsigned __int8 *)(a2 + v6);
      memset(v14, 0, 255);
      if (v6 > a3) {
        break;
      }
      __memcpy_chk();
      if (((*(uint64_t (**)(void, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v14, v7, v8, v9, v10, v11, v12) & 1) == 0)break; {
    }
      }
    while (v6 < a3);
  }
  return 0;
}

uint64_t ___dnssd_getaddrinfo_result_create_svcb_block_invoke(uint64_t a1, char *string)
{
  xpc_object_t v3 = xpc_string_create(string);
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v4)
  {
    *(void *)(*(void *)(a1 + 32) + 136) = xpc_array_create(0, 0);
    unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  xpc_array_append_value(v4, v3);
  if (v3) {
    xpc_release(v3);
  }
  return 1;
}

uint64_t __dnssd_svcb_access_address_hints_block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 && (a3 & 0xF) == 0)
  {
    unint64_t v7 = 0;
    do
    {
      if (v7 >= a3) {
        break;
      }
      uint64_t v10 = 0;
      long long v11 = 0uLL;
      int v12 = 0;
      long long v8 = *(_OWORD *)(a2 + v7);
      LOWORD(v10) = 7708;
      long long v11 = v8;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void, uint64_t *, unint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &v10, a3, a4);
      v7 += 16;
    }
    while (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return 0;
}

uint64_t __dnssd_svcb_access_address_hints_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 3) == 0)
  {
    unint64_t v6 = 0;
    do
    {
      if (v6 >= a3) {
        break;
      }
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      int v7 = *(_DWORD *)(a2 + v6);
      LOWORD(v9) = 528;
      HIDWORD(v9) = v7;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      v6 += 4;
    }
    while (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return 0;
}

uint64_t ___dnssd_getaddrinfo_result_create_svcb_block_invoke_2(uint64_t a1, unsigned __int8 *bytes)
{
  xpc_object_t v3 = xpc_data_create(bytes, *bytes);
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 104);
  if (!v4)
  {
    *(void *)(*(void *)(a1 + 32) + 104) = xpc_array_create(0, 0);
    unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 104);
  }
  xpc_array_append_value(v4, v3);
  if (v3) {
    xpc_release(v3);
  }
  return 1;
}

uint64_t dnssd_getaddrinfo_result_get_service_priority(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 186);
}

uint64_t dnssd_getaddrinfo_result_get_service_port(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 184);
}

const char *dnssd_getaddrinfo_result_get_service_name(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 144));
}

const char *dnssd_getaddrinfo_result_get_doh_uri(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 112));
}

void ___dnssd_getaddrinfo_invalidate_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[14];
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(v2[14], 3, 0);
    xpc_object_t v2 = *(void **)(a1 + 32);
  }

  os_release(v2);
}

uint64_t __dnssd_getaddrinfo_result_enumerate_service_address_hints_block_invoke(uint64_t a1, int a2, xpc_object_t xdata)
{
  xpc_data_get_bytes_ptr(xdata);
  unint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

uint64_t __dnssd_getaddrinfo_result_enumerate_alpn_values_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  xpc_string_get_string_ptr(xstring);
  unint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void dnssd_getaddrinfo_set_delegate_audit_token(uint64_t a1, void *bytes)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 56), "delegate_id", bytes, 0x20uLL);
  }
}

const void *dnssd_getaddrinfo_result_get_ech_config(uint64_t a1, void *a2)
{
  size_t length = *(void **)(a1 + 96);
  if (!length)
  {
    bytes_ptr = 0;
    if (!a2) {
      return bytes_ptr;
    }
    goto LABEL_3;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(length);
  size_t length = (void *)xpc_data_get_length(*(xpc_object_t *)(a1 + 96));
  if (a2) {
LABEL_3:
  }
    *a2 = length;
  return bytes_ptr;
}

void *dnssd_getaddrinfo_result_enumerate_service_address_hints(uint64_t a1, uint64_t a2)
{
  int64_t result = *(void **)(a1 + 104);
  if (result)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 0x40000000;
    applier[2] = __dnssd_getaddrinfo_result_enumerate_service_address_hints_block_invoke;
    applier[3] = &unk_2641231A0;
    applier[4] = a2;
    return (void *)xpc_array_apply(result, applier);
  }
  return result;
}

void *dnssd_getaddrinfo_result_enumerate_alpn_values(uint64_t a1, uint64_t a2)
{
  int64_t result = *(void **)(a1 + 136);
  if (result)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 0x40000000;
    applier[2] = __dnssd_getaddrinfo_result_enumerate_alpn_values_block_invoke;
    applier[3] = &unk_264123178;
    applier[4] = a2;
    return (void *)xpc_array_apply(result, applier);
  }
  return result;
}

void dnssd_getaddrinfo_set_delegate_uuid(uint64_t a1, unsigned __int8 *uuid)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_uuid(*(xpc_object_t *)(a1 + 56), "delegate_id", uuid);
  }
}

void advertising_proxy_ref_dealloc(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __advertising_proxy_ref_dealloc_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  dispatch_async(v1, block);
}

void __advertising_proxy_ref_dealloc_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(void *)(v1 + 16) = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    unint64_t v4 = (_xpc_connection_s *)*((void *)v3 + 1);
    if (v4)
    {
      xpc_connection_cancel(v4);
      uint64_t v3 = *(void **)(a1 + 32);
      if (!v3)
      {
LABEL_12:
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        LOWORD(v13) = 0;
        long long v8 = MEMORY[0x263EF8438];
        uint64_t v9 = "dns_services: advertising_proxy_ref_dealloc successfully released conn_ref";
        goto LABEL_16;
      }
    }
    int v5 = *(_DWORD *)v3;
    if (*(_DWORD *)v3)
    {
      unint64_t v6 = global_os_log;
      if (v5 < 10001)
      {
        if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136447490;
          unint64_t v14 = "advertising_proxy_ref_dealloc_block_invoke";
          __int16 v15 = 1024;
          *(_DWORD *)uint64_t v16 = v5;
          *(_WORD *)&v16[4] = 2048;
          *(void *)&v16[6] = v3;
          *(_WORD *)&v16[14] = 2080;
          *(void *)&v16[16] = "conn_ref";
          *(_WORD *)&v16[24] = 2080;
          *(void *)&v16[26] = "advertising_proxy_services.c";
          __int16 v17 = 1024;
          int v18 = 280;
          _os_log_impl(&dword_20D928000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", (uint8_t *)&v13, 0x36u);
          uint64_t v3 = *(void **)(a1 + 32);
          int v5 = *(_DWORD *)v3;
        }
        *(_DWORD *)uint64_t v3 = v5 - 1;
        if (v5 == 1)
        {
          int v7 = global_os_log;
          if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 136447234;
            unint64_t v14 = "advertising_proxy_ref_dealloc_block_invoke";
            __int16 v15 = 2048;
            *(void *)uint64_t v16 = v3;
            *(_WORD *)&v16[8] = 2080;
            *(void *)&v16[10] = "conn_ref";
            *(_WORD *)&v16[18] = 2080;
            *(void *)&v16[20] = "advertising_proxy_services.c";
            *(_WORD *)&v16[28] = 1024;
            *(_DWORD *)&v16[30] = 280;
            _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", (uint8_t *)&v13, 0x30u);
            uint64_t v3 = *(void **)(a1 + 32);
          }
          ++advertising_proxy_conn_ref_finalized;
          free(v3);
        }
        goto LABEL_12;
      }
      if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
LABEL_23:
      }
        abort();
      int v13 = 136447490;
      unint64_t v14 = "advertising_proxy_ref_dealloc_block_invoke";
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = v5;
      *(_WORD *)&v16[4] = 2048;
      *(void *)&v16[6] = v3;
      *(_WORD *)&v16[14] = 2080;
      *(void *)&v16[16] = "conn_ref";
      *(_WORD *)&v16[24] = 2080;
      *(void *)&v16[26] = "advertising_proxy_services.c";
      __int16 v17 = 1024;
      int v18 = 280;
      uint64_t v11 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
      int v12 = v6;
    }
    else
    {
      uint64_t v10 = global_os_log;
      if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      int v13 = 136447490;
      unint64_t v14 = "advertising_proxy_ref_dealloc_block_invoke";
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = 0;
      *(_WORD *)&v16[4] = 2048;
      *(void *)&v16[6] = v3;
      *(_WORD *)&v16[14] = 2080;
      *(void *)&v16[16] = "conn_ref";
      *(_WORD *)&v16[24] = 2080;
      *(void *)&v16[26] = "advertising_proxy_services.c";
      __int16 v17 = 1024;
      int v18 = 280;
      uint64_t v11 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
      int v12 = v10;
    }
    _os_log_impl(&dword_20D928000, v12, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v13, 0x36u);
    goto LABEL_23;
  }
  if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
    return;
  }
  LOWORD(v13) = 0;
  long long v8 = MEMORY[0x263EF8438];
  uint64_t v9 = "dns_services: advertising_proxy_ref_dealloc called with NULL advertising_proxy_conn_ref";
LABEL_16:
  _os_log_impl(&dword_20D928000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 2u);
}

uint64_t advertising_proxy_enable(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_enable", "enable", a3, 0, 0, 477);
}

uint64_t adv_send_command_with_dict_(void *a1, NSObject *a2, const char *a3, char *string, uint64_t a5, uint64_t a6, xpc_object_t xdict, int a8)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (global_os_log)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v25 = 4294901756;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = a3;
      long long v26 = MEMORY[0x263EF8438];
      long long v27 = "%s: NULL cti_connection_t OR Callback OR Client_Queue parameter";
      uint32_t v28 = 12;
      goto LABEL_38;
    }
    return v25;
  }
  global_os_log = (uint64_t)os_log_create("com.apple.srp-mdns-proxy", "0");
  if (!a2) {
    goto LABEL_14;
  }
LABEL_3:
  xpc_object_t v16 = xdict;
  if (xdict || (xpc_object_t v16 = xpc_dictionary_create(0, 0, 0)) != 0)
  {
    xpc_dictionary_set_string(v16, "xpc-command", string);
    __int16 v17 = (int *)malloc_type_calloc(1uLL, 0x48uLL, 0x10F0040DDE7724DuLL);
    if (v17)
    {
      int v18 = v17;
      dispatch_retain(a2);
      *((void *)v18 + 6) = a2;
      *((void *)v18 + 7) = a3;
      *((void *)v18 + 2) = a5;
      *((void *)v18 + 5) = a6;
      xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.srp-mdns-proxy.proxy", a2, 2uLL);
      *((void *)v18 + 1) = mach_service;
      if (mach_service)
      {
        BOOL v20 = global_os_log;
        if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = *v18;
          *(_DWORD *)buf = 136447490;
          v41 = "adv_init_connection";
          __int16 v42 = 1024;
          int v43 = v21;
          __int16 v44 = 2048;
          xpc_object_t v45 = v18;
          __int16 v46 = 2080;
          xpc_object_t v47 = "conn_ref";
          __int16 v48 = 2080;
          xpc_object_t v49 = "advertising_proxy_services.c";
          __int16 v50 = 1024;
          int v51 = 379;
          _os_log_impl(&dword_20D928000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:  retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
        }
        int v22 = *v18;
        if (*v18)
        {
          int v23 = v22 + 1;
          *int v18 = v22 + 1;
          if (v22 + 1 >= 10001)
          {
            long long v24 = global_os_log;
            if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
              goto LABEL_43;
            }
            *(_DWORD *)buf = 136447490;
            v41 = "adv_init_connection";
            __int16 v42 = 1024;
            int v43 = v23;
            __int16 v44 = 2048;
            xpc_object_t v45 = v18;
            __int16 v46 = 2080;
            xpc_object_t v47 = "conn_ref";
            __int16 v48 = 2080;
            xpc_object_t v49 = "advertising_proxy_services.c";
            __int16 v50 = 1024;
            int v51 = 379;
            goto LABEL_42;
          }
        }
        else
        {
          ++advertising_proxy_conn_ref_created;
          *int v18 = 1;
        }
        uint64_t v30 = (_xpc_connection_s *)*((void *)v18 + 1);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 0x40000000;
        handler[2] = __adv_init_connection_block_invoke;
        handler[3] = &__block_descriptor_tmp_63;
        handler[4] = v18;
        xpc_connection_set_event_handler(v30, handler);
        xpc_connection_set_finalizer_f(*((xpc_connection_t *)v18 + 1), (xpc_finalizer_t)adv_connection_finalize);
        xpc_connection_set_context(*((xpc_connection_t *)v18 + 1), v18);
        xpc_connection_resume(*((xpc_connection_t *)v18 + 1));
        uint64_t v31 = (_xpc_connection_s *)*((void *)v18 + 1);
        xpc_object_t v32 = *((void *)v18 + 6);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 0x40000000;
        v38[2] = __adv_init_connection_block_invoke_2;
        v38[3] = &__block_descriptor_tmp_64;
        v38[4] = v18;
        xpc_connection_send_message_with_reply(v31, v16, v32, v38);
        if (a1)
        {
          *a1 = v18;
          unsigned int v33 = global_os_log;
          if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = *v18;
            *(_DWORD *)buf = 136447490;
            v41 = "adv_init_connection";
            __int16 v42 = 1024;
            int v43 = v34;
            __int16 v44 = 2048;
            xpc_object_t v45 = v18;
            __int16 v46 = 2080;
            xpc_object_t v47 = "conn_ref";
            __int16 v48 = 2080;
            xpc_object_t v49 = "advertising_proxy_services.c";
            __int16 v50 = 1024;
            int v51 = a8;
            _os_log_impl(&dword_20D928000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:  retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
          }
          int v35 = *v18;
          if (!*v18)
          {
            uint64_t v25 = 0;
            ++advertising_proxy_conn_ref_created;
            char v29 = 1;
            *int v18 = 1;
            goto LABEL_32;
          }
          int v36 = v35 + 1;
          *int v18 = v35 + 1;
          if (v35 + 1 >= 10001)
          {
            long long v24 = global_os_log;
            if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
              goto LABEL_43;
            }
            *(_DWORD *)buf = 136447490;
            v41 = "adv_init_connection";
            __int16 v42 = 1024;
            int v43 = v36;
            __int16 v44 = 2048;
            xpc_object_t v45 = v18;
            __int16 v46 = 2080;
            xpc_object_t v47 = "conn_ref";
            __int16 v48 = 2080;
            xpc_object_t v49 = "advertising_proxy_services.c";
            __int16 v50 = 1024;
            int v51 = a8;
LABEL_42:
            _os_log_impl(&dword_20D928000, v24, OS_LOG_TYPE_FAULT, "%{public}s: ALLOC: retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
LABEL_43:
            abort();
          }
        }
        uint64_t v25 = 0;
        char v29 = 1;
LABEL_32:
        if (v16 != xdict) {
          xpc_release(v16);
        }
        if (v29) {
          return 0;
        }
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          return v25;
        }
        *(_DWORD *)buf = 136315394;
        v41 = a3;
        __int16 v42 = 1024;
        int v43 = v25;
        long long v26 = MEMORY[0x263EF8438];
        long long v27 = "%s: Since init_connection() returned %d error returning w/o sending msg";
        uint32_t v28 = 18;
LABEL_38:
        _os_log_impl(&dword_20D928000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
        return v25;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "dns_services: init_connection() conn_ref/lib_q is NULL", buf, 2u);
      }
      uint64_t v25 = 4294901757;
      free(v18);
    }
    else
    {
      uint64_t v25 = 4294901757;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "dns_services: init_connection() No memory to allocate!", buf, 2u);
      }
    }
    char v29 = 0;
    goto LABEL_32;
  }
  uint64_t v25 = 4294901757;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    long long v26 = MEMORY[0x263EF8438];
    long long v27 = "dns_services: init_connection() No memory to allocate!";
    uint32_t v28 = 2;
    goto LABEL_38;
  }
  return v25;
}

void __adv_init_connection_block_invoke(uint64_t a1, void *a2)
{
}

void __adv_init_connection_block_invoke_2(uint64_t a1, void *a2)
{
}

void adv_event_handler(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1 != (void *)MEMORY[0x263EF86A8])
  {
    if (MEMORY[0x210561130]() != MEMORY[0x263EF8708])
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
        int v18 = 136315138;
        uint64_t v19 = string;
        _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "adv_event_handler: Unexpected Connection Error [%s]", (uint8_t *)&v18, 0xCu);
      }
      int v5 = *(void (**)(uint64_t, void, uint64_t))(a2 + 16);
      if (v5)
      {
        unint64_t v6 = *(void (**)(uint64_t, void *, uint64_t))(a2 + 40);
        if (v6) {
          v6(a2, a1, 4294901733);
        }
        else {
          v5(a2, 0, 4294901733);
        }
        *(void *)(a2 + 16) = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "adv_event_handler: no callback", (uint8_t *)&v18, 2u);
        }
        xpc_connection_cancel(*(xpc_connection_t *)(a2 + 8));
      }
      return;
    }
    int v12 = *(void (**)(uint64_t, void *, void))(a2 + 40);
    if (v12 || (int v12 = *(void (**)(uint64_t, void *, void))(a2 + 16)) != 0)
    {
      v12(a2, a1, 0);
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v17 = *(const char **)(a2 + 56);
    int v18 = 136315138;
    uint64_t v19 = v17;
    unint64_t v14 = MEMORY[0x263EF8438];
    __int16 v15 = "adv_event_handler (%s): no callback";
    uint32_t v16 = 12;
LABEL_24:
    _os_log_impl(&dword_20D928000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v16);
    return;
  }
  uint64_t v7 = *(void *)(a2 + 8);
  BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v8) {
      return;
    }
    int v13 = *(const char **)(a2 + 56);
    int v18 = 136315650;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = a2;
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    unint64_t v14 = MEMORY[0x263EF8438];
    __int16 v15 = "adv_event_handler (%s): spurious invalid callback %p %p";
    uint32_t v16 = 32;
    goto LABEL_24;
  }
  if (v8)
  {
    uint64_t v9 = *(const char **)(a2 + 56);
    int v18 = 136315650;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = a2;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "adv_event_handler (%s): cleanup %p %p", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v10 = *(void (**)(uint64_t, void, uint64_t))(a2 + 16);
  if (v10)
  {
    uint64_t v11 = *(void (**)(uint64_t, void, uint64_t))(a2 + 40);
    if (v11) {
      v11(a2, MEMORY[0x263EF86A8], 4294901727);
    }
    else {
      v10(a2, 0, 4294901727);
    }
    *(void *)(a2 + 16) = 0;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "No callback", (uint8_t *)&v18, 2u);
  }
  xpc_release(*(xpc_object_t *)(a2 + 8));
  *(void *)(a2 + 8) = 0;
}

void adv_connection_finalize(int *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *a1;
    int v7 = 67109120;
    LODWORD(v8) = v2;
    _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "adv_connection_finalize: releasing conn_ref at %d", (uint8_t *)&v7, 8u);
  }
  else if (!a1)
  {
    return;
  }
  int v3 = *a1;
  if (!*a1)
  {
    unint64_t v4 = global_os_log;
    if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    int v7 = 136447490;
    BOOL v8 = "adv_connection_finalize";
    __int16 v9 = 1024;
    *(_DWORD *)uint64_t v10 = 0;
    *(_WORD *)&v10[4] = 2048;
    *(void *)&v10[6] = a1;
    *(_WORD *)&v10[14] = 2080;
    *(void *)&v10[16] = "conn_ref";
    *(_WORD *)&v10[24] = 2080;
    *(void *)&v10[26] = "advertising_proxy_services.c";
    __int16 v11 = 1024;
    int v12 = 290;
    unint64_t v6 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
    goto LABEL_17;
  }
  unint64_t v4 = global_os_log;
  if (v3 >= 10001)
  {
    if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    int v7 = 136447490;
    BOOL v8 = "adv_connection_finalize";
    __int16 v9 = 1024;
    *(_DWORD *)uint64_t v10 = v3;
    *(_WORD *)&v10[4] = 2048;
    *(void *)&v10[6] = a1;
    *(_WORD *)&v10[14] = 2080;
    *(void *)&v10[16] = "conn_ref";
    *(_WORD *)&v10[24] = 2080;
    *(void *)&v10[26] = "advertising_proxy_services.c";
    __int16 v11 = 1024;
    int v12 = 290;
    unint64_t v6 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
LABEL_17:
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v7, 0x36u);
LABEL_18:
    abort();
  }
  if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136447490;
    BOOL v8 = "adv_connection_finalize";
    __int16 v9 = 1024;
    *(_DWORD *)uint64_t v10 = v3;
    *(_WORD *)&v10[4] = 2048;
    *(void *)&v10[6] = a1;
    *(_WORD *)&v10[14] = 2080;
    *(void *)&v10[16] = "conn_ref";
    *(_WORD *)&v10[24] = 2080;
    *(void *)&v10[26] = "advertising_proxy_services.c";
    __int16 v11 = 1024;
    int v12 = 290;
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", (uint8_t *)&v7, 0x36u);
    int v3 = *a1;
  }
  *a1 = v3 - 1;
  if (v3 == 1)
  {
    int v5 = global_os_log;
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136447234;
      BOOL v8 = "adv_connection_finalize";
      __int16 v9 = 2048;
      *(void *)uint64_t v10 = a1;
      *(_WORD *)&v10[8] = 2080;
      *(void *)&v10[10] = "conn_ref";
      *(_WORD *)&v10[18] = 2080;
      *(void *)&v10[20] = "advertising_proxy_services.c";
      *(_WORD *)&v10[28] = 1024;
      *(_DWORD *)&v10[30] = 290;
      _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", (uint8_t *)&v7, 0x30u);
    }
    ++advertising_proxy_conn_ref_finalized;
    free(a1);
  }
}

uint64_t advertising_proxy_enable_with_interfaces(void *a1, NSObject *a2, uint64_t a3, const char **a4, int a5)
{
  LODWORD(v5) = a5;
  uint64_t v10 = 4294901757;
  xpc_object_t empty = xpc_array_create_empty();
  if (empty)
  {
    int v12 = empty;
    if ((int)v5 < 1)
    {
LABEL_6:
      xpc_object_t v13 = xpc_dictionary_create_empty();
      if (v13)
      {
        unint64_t v14 = v13;
        xpc_dictionary_set_value(v13, "permitted-interfaces", v12);
        uint64_t v10 = adv_send_command_with_dict_(a1, a2, "advertising_proxy_enable", "enable", a3, 0, v14, 506);
        xpc_release(v12);
        int v12 = v14;
      }
    }
    else
    {
      uint64_t v5 = v5;
      while (*a4)
      {
        xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, *a4++);
        if (!--v5) {
          goto LABEL_6;
        }
      }
      uint64_t v10 = 4294901747;
    }
    xpc_release(v12);
  }
  return v10;
}

uint64_t advertising_proxy_set_service_needed(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, BOOL a7)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (!empty) {
    return 4294901757;
  }
  __int16 v15 = empty;
  if (a5) {
    xpc_dictionary_set_string(empty, "name", a5);
  }
  if (a6) {
    xpc_dictionary_set_string(v15, "service-type", a6);
  }
  xpc_dictionary_set_BOOL(v15, "needed", a7);
  uint64_t v16 = adv_send_command_with_dict_(a1, a2, "advertising_proxy_set_service_needed", "need service instance", 0, (uint64_t)adv_set_service_needed_callback, v15, 545);
  if (*a1)
  {
    *(void *)(*a1 + 64) = a4;
    *(void *)(*a1 + 24) = a3;
  }
  xpc_release(v15);
  return v16;
}

uint64_t adv_set_service_needed_callback(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(result + 24);
  if (v1) {
    return v1(result, *(void *)(result + 64));
  }
  return result;
}

uint64_t advertising_proxy_flush_entries(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_flush_entries", "flush entries", a3, 0, 0, 802);
}

uint64_t advertising_proxy_get_service_list(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_get_service_list", "list services", a3, (uint64_t)adv_service_list_callback, 0, 812);
}

void adv_service_list_callback(uint64_t a1, xpc_object_t xdict, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = a3;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v56) = v4;
      uint64_t v5 = MEMORY[0x263EF8438];
      unint64_t v6 = "adv_service_list_callback: error response code %d";
      uint32_t v7 = 8;
LABEL_11:
      _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
    }
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, "instances");
  if (!value)
  {
    uint64_t v4 = 4294901727;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v5 = MEMORY[0x263EF8438];
    unint64_t v6 = "adv_service_list_callback: non-error response doesn't contain an instances key";
    goto LABEL_10;
  }
  __int16 v9 = value;
  if (MEMORY[0x210561130]() != MEMORY[0x263EF86D8])
  {
    uint64_t v4 = 4294901727;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v5 = MEMORY[0x263EF8438];
    unint64_t v6 = "adv_service_list_callback: Non-error response instances value is not an array";
LABEL_10:
    uint32_t v7 = 2;
    goto LABEL_11;
  }
  size_t count = xpc_array_get_count(v9);
  if (!count)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "adv_service_list_callback: No registered services.", buf, 2u);
    }
    uint64_t v10 = 0;
    uint64_t v4 = 0;
    goto LABEL_13;
  }
  size_t v15 = 0;
  while (1)
  {
    xpc_object_t v16 = xpc_array_get_value(v9, v15);
    if (!v16 || (__int16 v17 = v16, MEMORY[0x210561130]() != MEMORY[0x263EF8708]))
    {
      uint64_t v4 = 4294901727;
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 134217984;
      xpc_object_t v56 = (const char *)v15;
      uint64_t v5 = MEMORY[0x263EF8438];
      unint64_t v6 = "adv_service_list_callback: services array[%zd] is not a dictionary";
      uint32_t v7 = 12;
      goto LABEL_11;
    }
    int v18 = (int *)malloc_type_calloc(1uLL, 0x48uLL, 0x10700407CE2CC6FuLL);
    if (!v18)
    {
      uint64_t v4 = 4294901727;
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      uint64_t v5 = MEMORY[0x263EF8438];
      unint64_t v6 = "adv_ctl_list_callback: no memory for host object";
      goto LABEL_10;
    }
    uint64_t v10 = v18;
    uint64_t v19 = global_os_log;
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *v10;
      *(_DWORD *)buf = 136447490;
      xpc_object_t v56 = "adv_host_allocate_";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = v20;
      *(_WORD *)&v58[4] = 2048;
      *(void *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(void *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(void *)&v58[26] = "advertising_proxy_services.c";
      __int16 v59 = 1024;
      int v60 = 161;
      _os_log_impl(&dword_20D928000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:  retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
    }
    int v21 = *v10;
    if (*v10)
    {
      int v22 = v21 + 1;
      int *v10 = v21 + 1;
      if (v21 + 1 >= 10001)
      {
        xpc_object_t v13 = global_os_log;
        if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
          goto LABEL_108;
        }
        *(_DWORD *)buf = 136447490;
        xpc_object_t v56 = "adv_host_allocate_";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = v22;
        *(_WORD *)&v58[4] = 2048;
        *(void *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(void *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(void *)&v58[26] = "advertising_proxy_services.c";
        __int16 v59 = 1024;
        int v60 = 161;
        int v51 = "%{public}s: ALLOC: retain at %2.2d: %p (%10s): %s:%d";
LABEL_106:
        uint64_t v52 = v13;
LABEL_107:
        _os_log_impl(&dword_20D928000, v52, OS_LOG_TYPE_FAULT, v51, buf, 0x36u);
        goto LABEL_108;
      }
    }
    else
    {
      ++adv_host_created;
      int *v10 = 1;
    }
    string = xpc_dictionary_get_string(v17, "regname");
    if (string) {
      string = strdup(string);
    }
    *((void *)v10 + 2) = string;
    uint64_t v24 = xpc_dictionary_get_string(v17, "hostname");
    if (!v24) {
      break;
    }
    uint64_t v25 = strdup(v24);
    *((void *)v10 + 1) = v25;
    if (!*((void *)v10 + 2) || !v25) {
      goto LABEL_85;
    }
    *((unsigned char *)v10 + 56) = xpc_dictionary_get_BOOL(v17, "removed");
    *((void *)v10 + 8) = xpc_dictionary_get_int64(v17, "update-server-id");
    long long v26 = xpc_dictionary_get_string(v17, "name");
    if (v26 && (long long v27 = strdup(v26)) != 0)
    {
      uint32_t v28 = v27;
      *((_WORD *)v10 + 20) = 1;
      char v29 = malloc_type_calloc(1uLL, 0x30uLL, 0x1050040D8A327FFuLL);
      *((void *)v10 + 6) = v29;
      if (!v29)
      {
        uint64_t v4 = 4294901727;
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        *(_WORD *)buf = 0;
        xpc_object_t v49 = MEMORY[0x263EF8438];
        __int16 v50 = "adv_service_list_callback: no memory for instance object.";
        goto LABEL_87;
      }
      uint64_t v30 = xpc_dictionary_get_string(v17, "regtype");
      if (v30) {
        uint64_t v30 = strdup(v30);
      }
      uint64_t v31 = (char **)*((void *)v10 + 6);
      v31[2] = (char *)v30;
      *uint64_t v31 = v28;
      xpc_object_t v32 = xpc_dictionary_get_string(v17, "type");
      if (v32) {
        xpc_object_t v32 = strdup(v32);
      }
      *(void *)(*((void *)v10 + 6) + 8) = v32;
      unsigned int v33 = xpc_dictionary_get_string(v17, "port");
      if (v33)
      {
        int v34 = atoi(v33);
        if (v34 >= 0x10000)
        {
          uint64_t v4 = 4294901727;
          if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          *(_WORD *)buf = 0;
          xpc_object_t v49 = MEMORY[0x263EF8438];
          __int16 v50 = "adv_service_list_callback: invalid port.";
LABEL_87:
          _os_log_impl(&dword_20D928000, v49, OS_LOG_TYPE_DEFAULT, v50, buf, 2u);
          goto LABEL_13;
        }
        uint64_t v35 = *((void *)v10 + 6);
        *(_WORD *)(v35 + 24) = v34;
      }
      else
      {
        uint64_t v35 = *((void *)v10 + 6);
      }
      if (!*(void *)(v35 + 8))
      {
        uint64_t v4 = 4294901727;
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        *(_WORD *)buf = 0;
        xpc_object_t v49 = MEMORY[0x263EF8438];
        __int16 v50 = "adv_ctl_list_callback: service type not provided";
        goto LABEL_87;
      }
    }
    else
    {
      *((_WORD *)v10 + 20) = 0;
    }
    xpc_object_t v36 = xpc_dictionary_get_value(v17, "addresses");
    if (v36)
    {
      size_t v37 = v36;
      size_t v38 = xpc_array_get_count(v36);
      if (v38 >= 0x65)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          xpc_object_t v56 = (const char *)v38;
          _os_log_error_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "adv_services_list_callback: too many addresses: %zd", buf, 0xCu);
        }
        size_t v38 = 100;
      }
      *((_WORD *)v10 + 12) = v38;
      int v39 = malloc_type_calloc(v38, 0x18uLL, 0x105004022079F3DuLL);
      *((void *)v10 + 4) = v39;
      if (!v39)
      {
        uint64_t v4 = 4294901727;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "adv_service_list_callback: no memory for address object.", buf, 2u);
        }
        goto LABEL_13;
      }
      if (*((_WORD *)v10 + 12))
      {
        uint64_t v40 = 0;
        size_t v41 = 0;
        do
        {
          __int16 v42 = xpc_array_get_string(v37, v41);
          uint64_t v43 = *((void *)v10 + 4);
          *(_WORD *)(v43 + v40) = 0;
          if (v42) {
            __int16 v42 = strdup(v42);
          }
          uint64_t v44 = v43 + v40;
          *(void *)(v44 + 8) = v42;
          *(_WORD *)(v44 + 16) = 0;
          ++v41;
          v40 += 24;
        }
        while (v41 < *((unsigned __int16 *)v10 + 12));
      }
    }
    v10[7] = xpc_dictionary_get_int64(v17, "lease");
    xpc_object_t v45 = *(void (**)(uint64_t, int *, void))(a1 + 16);
    if (v45) {
      v45(a1, v10, 0);
    }
    int v46 = *v10;
    if (!*v10)
    {
      xpc_object_t v13 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136447490;
        xpc_object_t v56 = "adv_service_list_callback";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = 0;
        *(_WORD *)&v58[4] = 2048;
        *(void *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(void *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(void *)&v58[26] = "advertising_proxy_services.c";
        __int16 v59 = 1024;
        int v60 = 227;
        int v51 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
        goto LABEL_106;
      }
LABEL_108:
      abort();
    }
    xpc_object_t v47 = global_os_log;
    if (v46 >= 10001)
    {
      if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT)) {
        goto LABEL_108;
      }
      *(_DWORD *)buf = 136447490;
      xpc_object_t v56 = "adv_service_list_callback";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = v46;
      *(_WORD *)&v58[4] = 2048;
      *(void *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(void *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(void *)&v58[26] = "advertising_proxy_services.c";
      __int16 v59 = 1024;
      int v60 = 227;
      int v51 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
      uint64_t v52 = v47;
      goto LABEL_107;
    }
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447490;
      xpc_object_t v56 = "adv_service_list_callback";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = v46;
      *(_WORD *)&v58[4] = 2048;
      *(void *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(void *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(void *)&v58[26] = "advertising_proxy_services.c";
      __int16 v59 = 1024;
      int v60 = 227;
      _os_log_impl(&dword_20D928000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
      int v46 = *v10;
    }
    int *v10 = v46 - 1;
    if (v46 == 1)
    {
      __int16 v48 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        xpc_object_t v56 = "adv_service_list_callback";
        __int16 v57 = 2048;
        *(void *)v58 = v10;
        *(_WORD *)&v58[8] = 2080;
        *(void *)&v58[10] = "host";
        *(_WORD *)&v58[18] = 2080;
        *(void *)&v58[20] = "advertising_proxy_services.c";
        *(_WORD *)&v58[28] = 1024;
        *(_DWORD *)&v58[30] = 227;
        _os_log_impl(&dword_20D928000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", buf, 0x30u);
      }
      ++adv_host_finalized;
      adv_host_finalize(v10);
    }
    uint64_t v10 = 0;
    uint64_t v4 = 0;
    if (++v15 == count) {
      goto LABEL_13;
    }
  }
  *((void *)v10 + 1) = 0;
LABEL_85:
  uint64_t v4 = 4294901727;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    xpc_object_t v49 = MEMORY[0x263EF8438];
    __int16 v50 = "adv_ctl_list_callback: regname or hostname not provided";
    goto LABEL_87;
  }
LABEL_13:
  __int16 v11 = *(void (**)(uint64_t, void, uint64_t))(a1 + 16);
  if (v11) {
    v11(a1, 0, v4);
  }
  if (v10)
  {
    int v12 = *v10;
    if (!*v10)
    {
      xpc_object_t v13 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136447490;
        xpc_object_t v56 = "adv_service_list_callback";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = 0;
        *(_WORD *)&v58[4] = 2048;
        *(void *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(void *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(void *)&v58[26] = "advertising_proxy_services.c";
        __int16 v59 = 1024;
        int v60 = 237;
        int v51 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
        goto LABEL_106;
      }
      goto LABEL_108;
    }
    xpc_object_t v13 = global_os_log;
    if (v12 >= 10001)
    {
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136447490;
        xpc_object_t v56 = "adv_service_list_callback";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = v12;
        *(_WORD *)&v58[4] = 2048;
        *(void *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(void *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(void *)&v58[26] = "advertising_proxy_services.c";
        __int16 v59 = 1024;
        int v60 = 237;
        int v51 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
        goto LABEL_106;
      }
      goto LABEL_108;
    }
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447490;
      xpc_object_t v56 = "adv_service_list_callback";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = v12;
      *(_WORD *)&v58[4] = 2048;
      *(void *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(void *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(void *)&v58[26] = "advertising_proxy_services.c";
      __int16 v59 = 1024;
      int v60 = 237;
      _os_log_impl(&dword_20D928000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
      int v12 = *v10;
    }
    int *v10 = v12 - 1;
    if (v12 == 1)
    {
      unint64_t v14 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        xpc_object_t v56 = "adv_service_list_callback";
        __int16 v57 = 2048;
        *(void *)v58 = v10;
        *(_WORD *)&v58[8] = 2080;
        *(void *)&v58[10] = "host";
        *(_WORD *)&v58[18] = 2080;
        *(void *)&v58[20] = "advertising_proxy_services.c";
        *(_WORD *)&v58[28] = 1024;
        *(_DWORD *)&v58[30] = 237;
        _os_log_impl(&dword_20D928000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", buf, 0x30u);
      }
      ++adv_host_finalized;
      adv_host_finalize(v10);
    }
  }
}

void adv_host_finalize(void *a1)
{
  int v2 = (void *)a1[4];
  if (v2) {
    free(v2);
  }

  free(a1);
}

uint64_t advertising_proxy_block_service(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_block_service", "block service", a3, 0, 0, 822);
}

uint64_t advertising_proxy_unblock_service(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_unblock_service", "unblock service", a3, 0, 0, 832);
}

uint64_t advertising_proxy_regenerate_ula(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_regenerate_ula", "regenerate ULA", a3, 0, 0, 842);
}

uint64_t advertising_proxy_advertise_prefix(void *a1, int a2, NSObject *a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v5 = "advertise prefix high priority";
    unint64_t v6 = a3;
    int v7 = 853;
  }
  else
  {
    uint64_t v5 = "advertise prefix";
    unint64_t v6 = a3;
    int v7 = 856;
  }
  return adv_send_command_with_dict_(a1, v6, "advertising_proxy_advertise_prefix", v5, a4, 0, 0, v7);
}

uint64_t advertising_proxy_add_prefix(void *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_add_prefix", "add prefix", a3, 0, a4, a5, 868);
}

uint64_t adv_send_command_with_data_(void *a1, NSObject *a2, const char *a3, char *a4, uint64_t a5, uint64_t a6, const void *a7, size_t a8, int a9)
{
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  if (v17)
  {
    int v18 = v17;
    if (a7)
    {
      if (a8) {
        xpc_dictionary_set_data(v17, "data", a7, a8);
      }
    }
    uint64_t v19 = adv_send_command_with_dict_(a1, a2, a3, a4, a5, a6, v18, a9);
    xpc_release(v18);
    return v19;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v21 = 0;
      _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "dns_services: init_connection() No memory to allocate!", v21, 2u);
    }
    return 4294901757;
  }
}

uint64_t advertising_proxy_remove_prefix(void *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_remove_prefix", "remove prefix", a3, 0, a4, a5, 879);
}

uint64_t advertising_proxy_add_nat64_prefix(void *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_add_nat64_prefix", "add nat64 prefix", a3, 0, a4, a5, 890);
}

uint64_t advertising_proxy_remove_nat64_prefix(void *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_remove_nat64_prefix", "remove nat64 prefix", a3, 0, a4, a5, 901);
}

uint64_t advertising_proxy_stop(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_stop", "stop", a3, 0, 0, 911);
}

uint64_t advertising_proxy_get_ula(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_get_ula", "get ula", a3, (uint64_t)adv_ula_callback, 0, 921);
}

void adv_ula_callback(uint64_t a1, xpc_object_t xdict, uint64_t a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v9[0] = xpc_dictionary_get_uint64(xdict, "ula");
    uint64_t v5 = *(void (**)(uint64_t, void *, uint64_t))(a1 + 16);
    if (!v5) {
      return;
    }
    int v7 = v9;
    uint64_t v6 = a1;
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v9[0]) = 67109120;
    HIDWORD(v9[0]) = a3;
    _os_log_impl(&dword_20D928000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "adv_service_list_callback: error response code %d", (uint8_t *)v9, 8u);
  }
  uint64_t v5 = *(void (**)(uint64_t, void *, uint64_t))(a1 + 16);
  if (v5)
  {
    uint64_t v6 = a1;
    int v7 = 0;
    uint64_t v8 = a3;
LABEL_8:
    v5(v6, v7, v8);
  }
}

uint64_t advertising_proxy_disable_srp_replication(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_srp_replication", "disable SRP replication", a3, 0, 0, 931);
}

uint64_t advertising_proxy_drop_srpl_connection(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_drop_srpl_connection", "drop srpl connection", a3, 0, 0, 941);
}

uint64_t advertising_proxy_undrop_srpl_connection(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_undrop_srpl_connection", "undrop srpl connection", a3, 0, 0, 951);
}

uint64_t advertising_proxy_drop_srpl_advertisement(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_drop_srpl_advertisement", "drop srpl advertisement", a3, 0, 0, 961);
}

uint64_t advertising_proxy_undrop_srpl_advertisement(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_undrop_srpl_advertisement", "undrop srpl advertisement", a3, 0, 0, 971);
}

uint64_t advertising_proxy_start_dropping_push_connections(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_start_dropping_push_connections", "start dropping push connections", a3, 0, 0, 981);
}

uint64_t advertising_proxy_start_breaking_time_validation(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_start_breaking_time_validation", "start breaking time validation", a3, 0, 0, 991);
}

uint64_t advertising_proxy_block_anycast_service(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_block_anycast_service", "block anycast service", a3, 0, 0, 1001);
}

uint64_t advertising_proxy_unblock_anycast_service(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_unblock_anycast_service", "unblock anycast service", a3, 0, 0, 1011);
}

uint64_t advertising_proxy_start_thread_shutdown(void *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_start_thread_shutdown", "start thread shutdown", a3, 0, 0, 1021);
}

uint64_t advertising_proxy_set_variable(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, char *__s, const char *a6)
{
  size_t v12 = strlen(__s);
  size_t v13 = strlen(a6);
  size_t v14 = v12 + v13 + 2;
  size_t v15 = (char *)malloc_type_malloc(v14, 0xE281D674uLL);
  if (!v15) {
    return 4294901757;
  }
  xpc_object_t v16 = v15;
  size_t v17 = v12 + 1;
  memcpy(v15, __s, v17);
  memcpy(&v16[v17], a6, v13 + 1);
  uint64_t v18 = adv_send_command_with_data_(a1, a2, "advertising_proxy_get_service_list", "set variable", 0, (uint64_t)adv_set_variable_callback, v16, v14, 1049);
  free(v16);
  if (!v18)
  {
    *(void *)(*a1 + 64) = a4;
    *(void *)(*a1 + 32) = a3;
  }
  return v18;
}

uint64_t adv_set_variable_callback(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(result + 32);
  if (v3) {
    return v3(result, *(void *)(result + 64), a2, a3);
  }
  return result;
}

uint64_t dnssd_copy_description(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  while (1)
  {
    uint64_t v1 = (void *)*v1;
    if (!v1) {
      break;
    }
    int v2 = (uint64_t (*)(void))v1[2];
    if (v2) {
      return v2();
    }
  }
  return 0;
}

void ___dnssd_getaddrinfo_activate_block_invoke_3(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[14];
  if (v3)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 40);
    unsigned int v5 = v4 + 6729;
    if (v4 == -6705) {
      unsigned int v4 = -65540;
    }
    if (v5 >= 2) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = 4294901757;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, 1, v6);
    int v2 = *(void **)(a1 + 32);
  }

  os_release(v2);
}

void _dnssd_client_fail_getaddrinfo(void *object, int a2)
{
  unsigned int v4 = &g_gai_list;
  do
  {
    unsigned int v5 = v4;
    uint64_t v6 = (void *)*v4;
    unsigned int v4 = (uint64_t *)(*v4 + 24);
    if (v6) {
      BOOL v7 = v6 == object;
    }
    else {
      BOOL v7 = 1;
    }
  }
  while (!v7);
  if (v6)
  {
    *unsigned int v5 = *((void *)object + 3);
    *((void *)object + 3) = 0;
    os_release(object);
  }
  *((_DWORD *)object + 34) = 3;
  uint64_t v8 = *((void *)object + 6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  void v9[2] = ___dnssd_getaddrinfo_post_error_event_block_invoke;
  v9[3] = &__block_descriptor_tmp_50;
  v9[4] = object;
  int v10 = a2;
  dispatch_sync(v8, v9);
  dispatch_source_merge_data(*((dispatch_source_t *)object + 11), 4uLL);
}

uint64_t ___dnssd_getaddrinfo_post_error_event_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 140) = *(_DWORD *)(result + 40);
  return result;
}

void *_dnssd_getaddrinfo_result_copy_description(uint64_t a1, int a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  __int16 v11 = *(void **)(a1 + 64);
  if (v11)
  {
    string_ptr = xpc_string_get_string_ptr(v11);
    if ((a3 & (string_ptr != 0)) != 0) {
      size_t v13 = "<redacted hostname>";
    }
    else {
      size_t v13 = string_ptr;
    }
  }
  else
  {
    size_t v13 = 0;
  }
  int v14 = *(unsigned __int8 *)(a1 + 33);
  if (v14 == 30)
  {
    if ((a3 & 1) == 0)
    {
      if (inet_ntop(30, (const void *)(a1 + 40), __s, 0x40u))
      {
        unsigned int v15 = *(_DWORD *)(a1 + 56);
        if (v15)
        {
          size_t v16 = strlen(__s);
          size_t v17 = &__s[v16];
          uint64_t v18 = if_indextoname(v15, v28);
          size_t v19 = 64 - v16;
          if (v18) {
            snprintf(v17, v19, "%%%s");
          }
          else {
            snprintf(v17, v19, "%%%u");
          }
        }
      }
    }
  }
  else if (v14 == 2 && (a3 & 1) == 0)
  {
    inet_ntop(2, (const void *)(a1 + 36), __s, 0x40u);
  }
  int v20 = 0;
  size_t v21 = 0;
  if (!v13) {
    size_t v13 = "<NO HOSTNAME>";
  }
  while (1)
  {
    *(void *)uint32_t v28 = v20;
    uint64_t v22 = (uint64_t)v20 + v21;
    if (a2)
    {
      unsigned int v23 = _dnssd_snprintf((char **)v28, v22, "dnssd_%s (%p): ", a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8));
      if ((v23 & 0x80000000) != 0) {
        break;
      }
      uint64_t v24 = v23;
    }
    else
    {
      uint64_t v24 = 0;
    }
    unsigned int v25 = _dnssd_snprintf((char **)v28, v22, "hostname: %s, address: %s, type: %s, ifindex: %lu", a4, a5, a6, a7, a8, (char)v13);
    if ((v25 & 0x80000000) != 0) {
      break;
    }
    if (v20) {
      return v20;
    }
    size_t v21 = v24 + v25 + 1;
    long long v26 = malloc_type_malloc(v21, 0xA172743EuLL);
    if (!v26) {
      __break(1u);
    }
    int v20 = v26;
    *long long v26 = 0;
  }
  if (v20)
  {
    free(v20);
    return 0;
  }
  return v20;
}

uint64_t _dnssd_cname_array_copy_description(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v11 = 0;
  uint64_t v12 = 0;
  size_t v13 = "[";
  while (1)
  {
    uint64_t v41 = 0;
    __int16 v42 = &v41;
    uint64_t v43 = 0x2000000000;
    int v44 = 0;
    uint64_t v37 = 0;
    size_t v38 = (char **)&v37;
    uint64_t v39 = 0x2000000000;
    uint64_t v40 = v11;
    uint64_t v14 = (uint64_t)&v11[v12];
    uint64_t v33 = 0;
    int v34 = &v33;
    uint64_t v35 = 0x2000000000;
    unsigned int v15 = &v40;
    uint64_t v36 = 0;
    if (a2)
    {
      unsigned int v16 = _dnssd_snprintf(&v40, v14, "dnssd_%s (%p): ", a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8));
      *((_DWORD *)v42 + 6) = v16;
      if ((v16 & 0x80000000) != 0) {
        goto LABEL_20;
      }
      v34[3] += v16;
      unsigned int v15 = v38 + 3;
    }
    unsigned int v17 = _dnssd_snprintf(v15, v14, v13, a4, a5, a6, a7, a8, v30);
    *((_DWORD *)v42 + 6) = v17;
    if ((v17 & 0x80000000) != 0)
    {
LABEL_20:
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
      if (v11)
      {
        free(v11);
        return 0;
      }
      return (uint64_t)v11;
    }
    v34[3] += v17;
    if (a3)
    {
      unsigned int v23 = v13;
      uint64_t v24 = v38;
      unsigned int v25 = *(void **)(a1 + 24);
      if (v25) {
        LOBYTE(v25) = xpc_array_get_count(v25);
      }
      unsigned int v26 = _dnssd_snprintf(v24 + 3, v14, "<%zu redacted cnames>", v18, v19, v20, v21, v22, (char)v25);
      *((_DWORD *)v42 + 6) = v26;
      size_t v13 = v23;
      if ((v26 & 0x80000000) != 0) {
        goto LABEL_20;
      }
      v34[3] += v26;
    }
    else
    {
      long long v27 = *(void **)(a1 + 24);
      if (v27)
      {
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 0x40000000;
        applier[2] = ___dnssd_cname_array_copy_description_block_invoke;
        applier[3] = &unk_264123270;
        applier[4] = &v41;
        void applier[5] = &v37;
        void applier[6] = &v33;
        applier[7] = v14;
        if (!xpc_array_apply(v27, applier)) {
          goto LABEL_20;
        }
      }
    }
    uint64_t result = _dnssd_snprintf(v38 + 3, v14, "]", v18, v19, v20, v21, v22, v31);
    *((_DWORD *)v42 + 6) = result;
    if ((result & 0x80000000) != 0) {
      goto LABEL_20;
    }
    uint64_t v29 = v34[3] + result;
    v34[3] = v29;
    if (v11)
    {
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
      return (uint64_t)v11;
    }
    uint64_t v12 = v29 + 1;
    if (v29 == -1) {
      break;
    }
    uint64_t result = (uint64_t)malloc_type_malloc(v29 + 1, 0xA172743EuLL);
    if (!result) {
      break;
    }
    __int16 v11 = (char *)result;
    *(unsigned char *)uint64_t result = 0;
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }
  __break(1u);
  return result;
}

BOOL ___dnssd_cname_array_copy_description_block_invoke(void *a1, uint64_t a2, xpc_object_t xstring)
{
  xpc_string_get_string_ptr(xstring);
  int v10 = (const char *)&unk_20D937457;
  if (a2) {
    int v10 = ", ";
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = _dnssd_snprintf((char **)(*(void *)(a1[5] + 8) + 24), a1[7], "%s%s", v5, v6, v7, v8, v9, (char)v10);
  uint64_t v11 = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
  if ((v11 & 0x80000000) == 0) {
    *(void *)(*(void *)(a1[6] + 8) + 24) += v11;
  }
  return (int)v11 >= 0;
}

uint64_t ___dnssd_getaddrinfo_process_events_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(v1 + 140);
  *(_DWORD *)(v1 + 140) = 0;
  return result;
}

void dnssd_getaddrinfo_set_account_id(uint64_t a1, char *string)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "account_id", string);
  }
}

void dnssd_getaddrinfo_set_delegate_pid(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 56), "delegate_id", a2);
  }
}

void dnssd_getaddrinfo_set_need_encrypted_query(uint64_t a1, BOOL value, void *a3)
{
  if (!*(unsigned char *)(a1 + 144))
  {
    unsigned int v4 = *(void **)(a1 + 56);
    xpc_dictionary_set_BOOL(v4, "need_encryption", value);
    if (a3)
    {
      xpc_dictionary_set_value(v4, "fallback_config", a3);
    }
  }
}

void dnssd_getaddrinfo_add_resolver_uuid(uint64_t a1, const unsigned __int8 *a2)
{
  if (!*(unsigned char *)(a1 + 144))
  {
    uint64_t v3 = *(void **)(a1 + 56);
    xpc_object_t value = xpc_dictionary_get_value(v3, "resolver_uuids");
    if (!value)
    {
      xpc_object_t value = xpc_array_create(0, 0);
      xpc_dictionary_set_value(v3, "resolver_uuids", value);
      if (value) {
        xpc_release(value);
      }
    }
    xpc_array_set_uuid(value, 0xFFFFFFFFFFFFFFFFLL, a2);
  }
}

void dnssd_getaddrinfo_set_validation_data(uint64_t a1, void *bytes, size_t length)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 56), "validation_data", bytes, length);
  }
}

void dnssd_getaddrinfo_prohibit_encrypted_dns(uint64_t a1, BOOL value)
{
  if (!*(unsigned char *)(a1 + 144)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 56), "prohibit_encrypted_dns", value);
  }
}

const char *dnssd_getaddrinfo_result_get_doh_path(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 120));
}

const void *dnssd_getaddrinfo_result_get_odoh_config(uint64_t a1, void *a2)
{
  size_t length = *(void **)(a1 + 128);
  if (!length)
  {
    bytes_ptr = 0;
    if (!a2) {
      return bytes_ptr;
    }
    goto LABEL_3;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(length);
  size_t length = (void *)xpc_data_get_length(*(xpc_object_t *)(a1 + 128));
  if (a2) {
LABEL_3:
  }
    *a2 = length;
  return bytes_ptr;
}

uint64_t dnssd_getaddrinfo_result_get_extended_dns_error_code(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 204);
}

char *dnssd_getaddrinfo_result_get_extended_dns_error_text(uint64_t a1)
{
  uint64_t result = *(char **)(a1 + 176);
  if (result) {
    uint64_t result = (char *)xpc_string_get_string_ptr(result);
  }
  if (!result) {
    return (char *)&unk_20D937457;
  }
  return result;
}

uint64_t __dnssd_svcb_is_valid_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3)
  {
    if (a3)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v3 = (unsigned __int16)(a3 >> 1);
      if ((unsigned __int16)(a3 >> 1))
      {
        do
        {
          uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
          if (*(unsigned char *)(v4 + 24)) {
            break;
          }
          unsigned int v5 = bswap32(*a2) >> 16;
          if (v5 - 1 >= 7 && v5 - 0x8000 >= 2) {
            *(unsigned char *)(v4 + 24) = 1;
          }
          ++a2;
          --v3;
        }
        while (v3);
      }
    }
  }
  return 0;
}

uint64_t __dnssd_svcb_get_port_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3 == 2) {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = bswap32(*a2) >> 16;
  }
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_uri_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3) {
    asprintf((char **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  }
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_path_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3) {
    asprintf((char **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  }
  return 0;
}

void *__dnssd_svcb_copy_ech_config_block_invoke(uint64_t a1, const void *a2, size_t size)
{
  if (!a2 || !size) {
    return 0;
  }
  uint64_t result = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    **(void **)(a1 + 40) = size;
    memcpy(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2, size);
    return 0;
  }
  __break(1u);
  return result;
}

void *__dnssd_svcb_copy_odoh_config_block_invoke(uint64_t a1, const void *a2, size_t size)
{
  if (!a2 || !size) {
    return 0;
  }
  uint64_t result = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    **(void **)(a1 + 40) = size;
    memcpy(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2, size);
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t advertising_proxy_resolver_init(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x263EF8438];
  if (a1) {
    uint64_t v1 = a1;
  }
  advertising_proxy_global_os_log = v1;
  return 0;
}

uint64_t advertising_proxy_subscription_retain_(int *a1, char *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v6 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v7 = *a1;
      *(_DWORD *)buf = 136447490;
      uint64_t v14 = "advertising_proxy_subscription_retain_";
      __int16 v15 = 1024;
      int v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = a1;
      __int16 v19 = 2080;
      uint64_t v20 = "subscription";
      __int16 v21 = 2080;
      uint64_t v22 = strrchr(a2, 47) + 1;
      __int16 v23 = 1024;
      int v24 = a3;
      _os_log_impl(&dword_20D928000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    }
    if (*a1)
    {
      int v8 = *a1 + 1;
      *a1 = v8;
      if (v8 >= 10001)
      {
        int v12 = v8;
        uint64_t v9 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          int v10 = strrchr(a2, 47);
          *(_DWORD *)buf = 136447490;
          uint64_t v14 = "advertising_proxy_subscription_retain_";
          __int16 v15 = 1024;
          int v16 = v12;
          __int16 v17 = 2048;
          uint64_t v18 = a1;
          __int16 v19 = 2080;
          uint64_t v20 = "subscription";
          __int16 v21 = 2080;
          uint64_t v22 = v10 + 1;
          __int16 v23 = 1024;
          int v24 = a3;
          _os_log_impl(&dword_20D928000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
        }
        abort();
      }
    }
    else
    {
      ++advertising_proxy_subscription_created;
      *a1 = 1;
    }
  }
  return 0;
}

uint64_t advertising_proxy_subscription_release_(void *a1, char *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  int v6 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    int v7 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v13 = 136447490;
    uint64_t v14 = "advertising_proxy_subscription_release_";
    __int16 v15 = 1024;
    *(_DWORD *)int v16 = 0;
    *(_WORD *)&v16[4] = 2048;
    *(void *)&v16[6] = a1;
    *(_WORD *)&v16[14] = 2080;
    *(void *)&v16[16] = "subscription";
    *(_WORD *)&v16[24] = 2080;
    *(void *)&v16[26] = strrchr(a2, 47) + 1;
    __int16 v17 = 1024;
    int v18 = a3;
    int v12 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_15;
  }
  int v7 = advertising_proxy_global_os_log;
  BOOL v8 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v6 >= 10001)
  {
    if (!v8) {
      goto LABEL_16;
    }
    int v13 = 136447490;
    uint64_t v14 = "advertising_proxy_subscription_release_";
    __int16 v15 = 1024;
    *(_DWORD *)int v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(void *)&v16[6] = a1;
    *(_WORD *)&v16[14] = 2080;
    *(void *)&v16[16] = "subscription";
    *(_WORD *)&v16[24] = 2080;
    *(void *)&v16[26] = strrchr(a2, 47) + 1;
    __int16 v17 = 1024;
    int v18 = a3;
    int v12 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_15:
    _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0x36u);
LABEL_16:
    abort();
  }
  if (v8)
  {
    int v13 = 136447490;
    uint64_t v14 = "advertising_proxy_subscription_release_";
    __int16 v15 = 1024;
    *(_DWORD *)int v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(void *)&v16[6] = a1;
    *(_WORD *)&v16[14] = 2080;
    *(void *)&v16[16] = "subscription";
    *(_WORD *)&v16[24] = 2080;
    *(void *)&v16[26] = strrchr(a2, 47) + 1;
    __int16 v17 = 1024;
    int v18 = a3;
    _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v13, 0x36u);
    int v6 = *(_DWORD *)a1;
  }
  *(_DWORD *)a1 = v6 - 1;
  if (v6 == 1)
  {
    uint64_t v9 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v10 = strrchr(a2, 47);
      int v13 = 136447234;
      uint64_t v14 = "advertising_proxy_subscription_release_";
      __int16 v15 = 2048;
      *(void *)int v16 = a1;
      *(_WORD *)&v16[8] = 2080;
      *(void *)&v16[10] = "subscription";
      *(_WORD *)&v16[18] = 2080;
      *(void *)&v16[20] = v10 + 1;
      *(_WORD *)&v16[28] = 1024;
      *(_DWORD *)&v16[30] = a3;
      _os_log_impl(&dword_20D928000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v13, 0x30u);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(a1);
  }
  return 0;
}

void advertising_proxy_subscription_finalize(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v3 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v8 = 136446466;
      uint64_t v9 = "advertising_proxy_subscription_finalize";
      __int16 v10 = 2048;
      uint64_t v11 = v2;
      _os_log_impl(&dword_20D928000, v3, OS_LOG_TYPE_INFO, "%{public}s: \"subscription->local_instance is not NULL (%p)\"", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v4 = a1[4];
  if (v4)
  {
    unsigned int v5 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v8 = 136446466;
      uint64_t v9 = "advertising_proxy_subscription_finalize";
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"subscription->push_instance is not NULL (%p)\"", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v6 = a1[5];
  if (v6)
  {
    int v7 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v8 = 136446466;
      uint64_t v9 = "advertising_proxy_subscription_finalize";
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"subscription->service is not NULL (%p)\"", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t advertising_proxy_subscription_cancel(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[3];
  if (v2)
  {
    adv_instance_unsubscribe(v2, a1);
    uint64_t v3 = (int *)a1[3];
    if (v3)
    {
      int v4 = *v3;
      if (!*v3)
      {
        uint64_t v29 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_70;
        }
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = 0;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v3;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->local_instance";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 309;
        char v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_65;
      }
      unsigned int v5 = advertising_proxy_global_os_log;
      BOOL v6 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v4 >= 10001)
      {
        if (!v6) {
          goto LABEL_70;
        }
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v4;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v3;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->local_instance";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 309;
        char v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_68;
      }
      if (v6)
      {
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v4;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v3;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->local_instance";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 309;
        _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
        uint64_t v3 = (int *)a1[3];
        int v4 = *v3;
      }
      *uint64_t v3 = v4 - 1;
      if (v4 == 1)
      {
        int v7 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          int v32 = 136447234;
          uint64_t v33 = "advertising_proxy_subscription_cancel";
          __int16 v34 = 2048;
          *(void *)uint64_t v35 = v3;
          *(_WORD *)&v35[8] = 2080;
          *(void *)&v35[10] = "subscription->local_instance";
          *(_WORD *)&v35[18] = 2080;
          *(void *)&v35[20] = "adv-resolve.c";
          *(_WORD *)&v35[28] = 1024;
          *(_DWORD *)&v35[30] = 309;
          _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
          uint64_t v3 = (int *)a1[3];
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize((uint64_t)v3);
      }
    }
    a1[3] = 0;
  }
  int v8 = (void *)a1[4];
  if (v8)
  {
    adv_instance_unsubscribe(v8, a1);
    uint64_t v9 = (int *)a1[4];
    if (v9)
    {
      int v10 = *v9;
      if (!*v9)
      {
        uint64_t v29 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_70;
        }
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = 0;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v9;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->push_instance";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 314;
        char v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_65;
      }
      unsigned int v5 = advertising_proxy_global_os_log;
      BOOL v11 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v10 >= 10001)
      {
        if (!v11) {
          goto LABEL_70;
        }
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v10;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v9;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->push_instance";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 314;
        char v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_68;
      }
      if (v11)
      {
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v10;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v9;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->push_instance";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 314;
        _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
        uint64_t v9 = (int *)a1[4];
        int v10 = *v9;
      }
      int *v9 = v10 - 1;
      if (v10 == 1)
      {
        uint64_t v12 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          int v32 = 136447234;
          uint64_t v33 = "advertising_proxy_subscription_cancel";
          __int16 v34 = 2048;
          *(void *)uint64_t v35 = v9;
          *(_WORD *)&v35[8] = 2080;
          *(void *)&v35[10] = "subscription->push_instance";
          *(_WORD *)&v35[18] = 2080;
          *(void *)&v35[20] = "adv-resolve.c";
          *(_WORD *)&v35[28] = 1024;
          *(_DWORD *)&v35[30] = 314;
          _os_log_impl(&dword_20D928000, v12, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
          uint64_t v9 = (int *)a1[4];
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize((uint64_t)v9);
      }
    }
    a1[4] = 0;
  }
  int v13 = (void *)a1[5];
  if (v13)
  {
    uint64_t v14 = (_DNSServiceRef_t *)v13[3];
    if (v14)
    {
      DNSServiceRefDeallocate(v14);
      v13[3] = 0;
    }
    __int16 v15 = (_DNSServiceRef_t *)v13[4];
    if (v15)
    {
      DNSServiceRefDeallocate(v15);
      v13[4] = 0;
    }
    uint64_t v16 = v13[6];
    if (!v16) {
      goto LABEL_44;
    }
    uint64_t v17 = 0;
    uint64_t v18 = v13[7];
    while (*(void **)(v18 + 8 * v17) != a1)
    {
      if (v16 == ++v17) {
        goto LABEL_44;
      }
    }
    if (a1)
    {
      int v19 = *(_DWORD *)a1;
      if (*(_DWORD *)a1)
      {
        uint64_t v20 = advertising_proxy_global_os_log;
        BOOL v21 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
        if (v19 < 10001)
        {
          if (v21)
          {
            int v32 = 136447490;
            uint64_t v33 = "adv_service_unsubscribe";
            __int16 v34 = 1024;
            *(_DWORD *)uint64_t v35 = v19;
            *(_WORD *)&v35[4] = 2048;
            *(void *)&v35[6] = a1;
            *(_WORD *)&v35[14] = 2080;
            *(void *)&v35[16] = "service->subscribers[i]";
            *(_WORD *)&v35[24] = 2080;
            *(void *)&v35[26] = "adv-resolve.c";
            __int16 v36 = 1024;
            int v37 = 283;
            _os_log_impl(&dword_20D928000, v20, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
            uint64_t v18 = v13[7];
            uint64_t v22 = *(void **)(v18 + 8 * v17);
            int v19 = *(_DWORD *)v22;
          }
          else
          {
            uint64_t v22 = a1;
          }
          *(_DWORD *)uint64_t v22 = v19 - 1;
          if (v19 == 1)
          {
            __int16 v23 = advertising_proxy_global_os_log;
            if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
            {
              int v32 = 136447234;
              uint64_t v33 = "adv_service_unsubscribe";
              __int16 v34 = 2048;
              *(void *)uint64_t v35 = v22;
              *(_WORD *)&v35[8] = 2080;
              *(void *)&v35[10] = "service->subscribers[i]";
              *(_WORD *)&v35[18] = 2080;
              *(void *)&v35[20] = "adv-resolve.c";
              *(_WORD *)&v35[28] = 1024;
              *(_DWORD *)&v35[30] = 283;
              _os_log_impl(&dword_20D928000, v23, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
              uint64_t v22 = *(void **)(v13[7] + 8 * v17);
            }
            ++advertising_proxy_subscription_finalized;
            advertising_proxy_subscription_finalize(v22);
            uint64_t v18 = v13[7];
          }
          goto LABEL_43;
        }
        if (!v21) {
          goto LABEL_70;
        }
        int v32 = 136447490;
        uint64_t v33 = "adv_service_unsubscribe";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v19;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = a1;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "service->subscribers[i]";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 283;
        char v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      }
      else
      {
        uint64_t v20 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_70;
        }
        int v32 = 136447490;
        uint64_t v33 = "adv_service_unsubscribe";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = 0;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = a1;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "service->subscribers[i]";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 283;
        char v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      }
      char v31 = v20;
      goto LABEL_69;
    }
LABEL_43:
    *(void *)(v18 + 8 * v17) = 0;
LABEL_44:
    int v24 = (int *)a1[5];
    if (!v24)
    {
LABEL_53:
      a1[5] = 0;
      return 0;
    }
    int v25 = *v24;
    if (*v24)
    {
      unsigned int v5 = advertising_proxy_global_os_log;
      BOOL v26 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v25 < 10001)
      {
        if (v26)
        {
          int v32 = 136447490;
          uint64_t v33 = "advertising_proxy_subscription_cancel";
          __int16 v34 = 1024;
          *(_DWORD *)uint64_t v35 = v25;
          *(_WORD *)&v35[4] = 2048;
          *(void *)&v35[6] = v24;
          *(_WORD *)&v35[14] = 2080;
          *(void *)&v35[16] = "subscription->service";
          *(_WORD *)&v35[24] = 2080;
          *(void *)&v35[26] = "adv-resolve.c";
          __int16 v36 = 1024;
          int v37 = 319;
          _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
          int v24 = (int *)a1[5];
          int v25 = *v24;
        }
        *int v24 = v25 - 1;
        if (v25 == 1)
        {
          long long v27 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            int v32 = 136447234;
            uint64_t v33 = "advertising_proxy_subscription_cancel";
            __int16 v34 = 2048;
            *(void *)uint64_t v35 = v24;
            *(_WORD *)&v35[8] = 2080;
            *(void *)&v35[10] = "subscription->service";
            *(_WORD *)&v35[18] = 2080;
            *(void *)&v35[20] = "adv-resolve.c";
            *(_WORD *)&v35[28] = 1024;
            *(_DWORD *)&v35[30] = 319;
            _os_log_impl(&dword_20D928000, v27, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
            int v24 = (int *)a1[5];
          }
          ++adv_service_state_finalized;
          adv_service_state_finalize((uint64_t)v24);
        }
        goto LABEL_53;
      }
      if (v26)
      {
        int v32 = 136447490;
        uint64_t v33 = "advertising_proxy_subscription_cancel";
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v25;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = v24;
        *(_WORD *)&v35[14] = 2080;
        *(void *)&v35[16] = "subscription->service";
        *(_WORD *)&v35[24] = 2080;
        *(void *)&v35[26] = "adv-resolve.c";
        __int16 v36 = 1024;
        int v37 = 319;
        char v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_68:
        char v31 = v5;
        goto LABEL_69;
      }
LABEL_70:
      abort();
    }
    uint64_t v29 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_70;
    }
    int v32 = 136447490;
    uint64_t v33 = "advertising_proxy_subscription_cancel";
    __int16 v34 = 1024;
    *(_DWORD *)uint64_t v35 = 0;
    *(_WORD *)&v35[4] = 2048;
    *(void *)&v35[6] = v24;
    *(_WORD *)&v35[14] = 2080;
    *(void *)&v35[16] = "subscription->service";
    *(_WORD *)&v35[24] = 2080;
    *(void *)&v35[26] = "adv-resolve.c";
    __int16 v36 = 1024;
    int v37 = 319;
    char v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
LABEL_65:
    char v31 = v29;
LABEL_69:
    _os_log_impl(&dword_20D928000, v31, OS_LOG_TYPE_INFO, v30, (uint8_t *)&v32, 0x36u);
    goto LABEL_70;
  }
  return 0;
}

void adv_instance_unsubscribe(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v4 = (_DNSServiceRef_t *)a1[6];
  if (v4)
  {
    DNSServiceRefDeallocate(v4);
    a1[6] = 0;
  }
  uint64_t v5 = a1[7];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a1[8];
    while (*(void **)(v7 + 8 * v6) != a2)
    {
      if (v5 == ++v6) {
        return;
      }
    }
    if (!a2) {
      goto LABEL_17;
    }
    int v8 = *(_DWORD *)a2;
    if (*(_DWORD *)a2)
    {
      uint64_t v9 = advertising_proxy_global_os_log;
      BOOL v10 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v8 < 10001)
      {
        if (v10)
        {
          int v15 = 136447490;
          uint64_t v16 = "adv_instance_unsubscribe";
          __int16 v17 = 1024;
          *(_DWORD *)uint64_t v18 = v8;
          *(_WORD *)&v18[4] = 2048;
          *(void *)&v18[6] = a2;
          *(_WORD *)&v18[14] = 2080;
          *(void *)&v18[16] = "instance->subscribers[i]";
          *(_WORD *)&v18[24] = 2080;
          *(void *)&v18[26] = "adv-resolve.c";
          __int16 v19 = 1024;
          int v20 = 263;
          _os_log_impl(&dword_20D928000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v15, 0x36u);
          uint64_t v7 = a1[8];
          a2 = *(void **)(v7 + 8 * v6);
          int v8 = *(_DWORD *)a2;
        }
        *(_DWORD *)a2 = v8 - 1;
        if (v8 == 1)
        {
          BOOL v11 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            int v15 = 136447234;
            uint64_t v16 = "adv_instance_unsubscribe";
            __int16 v17 = 2048;
            *(void *)uint64_t v18 = a2;
            *(_WORD *)&v18[8] = 2080;
            *(void *)&v18[10] = "instance->subscribers[i]";
            *(_WORD *)&v18[18] = 2080;
            *(void *)&v18[20] = "adv-resolve.c";
            *(_WORD *)&v18[28] = 1024;
            *(_DWORD *)&v18[30] = 263;
            _os_log_impl(&dword_20D928000, v11, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v15, 0x30u);
            a2 = *(void **)(a1[8] + 8 * v6);
          }
          ++advertising_proxy_subscription_finalized;
          advertising_proxy_subscription_finalize(a2);
          uint64_t v7 = a1[8];
        }
LABEL_17:
        *(void *)(v7 + 8 * v6) = 0;
        return;
      }
      if (!v10) {
LABEL_24:
      }
        abort();
      int v15 = 136447490;
      uint64_t v16 = "adv_instance_unsubscribe";
      __int16 v17 = 1024;
      *(_DWORD *)uint64_t v18 = v8;
      *(_WORD *)&v18[4] = 2048;
      *(void *)&v18[6] = a2;
      *(_WORD *)&v18[14] = 2080;
      *(void *)&v18[16] = "instance->subscribers[i]";
      *(_WORD *)&v18[24] = 2080;
      *(void *)&v18[26] = "adv-resolve.c";
      __int16 v19 = 1024;
      int v20 = 263;
      int v13 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      uint64_t v14 = v9;
    }
    else
    {
      uint64_t v12 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      int v15 = 136447490;
      uint64_t v16 = "adv_instance_unsubscribe";
      __int16 v17 = 1024;
      *(_DWORD *)uint64_t v18 = 0;
      *(_WORD *)&v18[4] = 2048;
      *(void *)&v18[6] = a2;
      *(_WORD *)&v18[14] = 2080;
      *(void *)&v18[16] = "instance->subscribers[i]";
      *(_WORD *)&v18[24] = 2080;
      *(void *)&v18[26] = "adv-resolve.c";
      __int16 v19 = 1024;
      int v20 = 263;
      int v13 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      uint64_t v14 = v12;
    }
    _os_log_impl(&dword_20D928000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v15, 0x36u);
    goto LABEL_24;
  }
}

void adv_instance_state_finalize(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
  uint64_t v2 = *(_DNSServiceRef_t **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v18 = "adv_instance_state_finalize";
      __int16 v19 = 2048;
      *(void *)int v20 = v2;
      _os_log_impl(&dword_20D928000, v3, OS_LOG_TYPE_INFO, "%{public}s: \"state->resolve_ref is non-null: %p\"", buf, 0x16u);
      uint64_t v2 = *(_DNSServiceRef_t **)(a1 + 48);
    }
    DNSServiceRefDeallocate(v2);
  }
  if (*(void *)(a1 + 56))
  {
    for (unint64_t i = 0; i < *(void *)(a1 + 56); ++i)
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 64) + 8 * i);
      if (v5)
      {
        int v6 = *(_DWORD *)v5;
        if (!*(_DWORD *)v5)
        {
          uint64_t v14 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447490;
            uint64_t v18 = "adv_instance_state_finalize";
            __int16 v19 = 1024;
            *(_DWORD *)int v20 = 0;
            *(_WORD *)&v20[4] = 2048;
            *(void *)&v20[6] = v5;
            *(_WORD *)&v20[14] = 2080;
            *(void *)&v20[16] = "state->subscribers[i]";
            *(_WORD *)&v20[24] = 2080;
            *(void *)&v20[26] = "adv-resolve.c";
            __int16 v21 = 1024;
            int v22 = 153;
            int v15 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
            uint64_t v16 = v14;
            goto LABEL_28;
          }
LABEL_29:
          abort();
        }
        uint64_t v7 = advertising_proxy_global_os_log;
        BOOL v8 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
        if (v6 >= 10001)
        {
          if (v8)
          {
            *(_DWORD *)buf = 136447490;
            uint64_t v18 = "adv_instance_state_finalize";
            __int16 v19 = 1024;
            *(_DWORD *)int v20 = v6;
            *(_WORD *)&v20[4] = 2048;
            *(void *)&v20[6] = v5;
            *(_WORD *)&v20[14] = 2080;
            *(void *)&v20[16] = "state->subscribers[i]";
            *(_WORD *)&v20[24] = 2080;
            *(void *)&v20[26] = "adv-resolve.c";
            __int16 v21 = 1024;
            int v22 = 153;
            int v15 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
            uint64_t v16 = v7;
LABEL_28:
            _os_log_impl(&dword_20D928000, v16, OS_LOG_TYPE_INFO, v15, buf, 0x36u);
          }
          goto LABEL_29;
        }
        if (v8)
        {
          *(_DWORD *)buf = 136447490;
          uint64_t v18 = "adv_instance_state_finalize";
          __int16 v19 = 1024;
          *(_DWORD *)int v20 = v6;
          *(_WORD *)&v20[4] = 2048;
          *(void *)&v20[6] = v5;
          *(_WORD *)&v20[14] = 2080;
          *(void *)&v20[16] = "state->subscribers[i]";
          *(_WORD *)&v20[24] = 2080;
          *(void *)&v20[26] = "adv-resolve.c";
          __int16 v21 = 1024;
          int v22 = 153;
          _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
          uint64_t v5 = *(void **)(*(void *)(a1 + 64) + 8 * i);
          int v6 = *(_DWORD *)v5;
        }
        *(_DWORD *)uint64_t v5 = v6 - 1;
        if (v6 == 1)
        {
          uint64_t v9 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447234;
            uint64_t v18 = "adv_instance_state_finalize";
            __int16 v19 = 2048;
            *(void *)int v20 = v5;
            *(_WORD *)&v20[8] = 2080;
            *(void *)&v20[10] = "state->subscribers[i]";
            *(_WORD *)&v20[18] = 2080;
            *(void *)&v20[20] = "adv-resolve.c";
            *(_WORD *)&v20[28] = 1024;
            *(_DWORD *)&v20[30] = 153;
            _os_log_impl(&dword_20D928000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
            uint64_t v5 = *(void **)(*(void *)(a1 + 64) + 8 * i);
          }
          ++advertising_proxy_subscription_finalized;
          advertising_proxy_subscription_finalize(v5);
        }
      }
    }
  }
  free(*(void **)(a1 + 64));
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    BOOL v11 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v18 = "adv_instance_state_finalize";
      __int16 v19 = 2048;
      *(void *)int v20 = v10;
      _os_log_impl(&dword_20D928000, v11, OS_LOG_TYPE_INFO, "%{public}s: \"state->nsn is not NULL (%p)\"", buf, 0x16u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    int v13 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v18 = "adv_instance_state_finalize";
      __int16 v19 = 2048;
      *(void *)int v20 = v12;
      _os_log_impl(&dword_20D928000, v13, OS_LOG_TYPE_INFO, "%{public}s: \"state->next is not NULL (%p)\"", buf, 0x16u);
    }
  }
}

void adv_service_state_finalize(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  free(*(void **)(a1 + 16));
  uint64_t v2 = *(_DNSServiceRef_t **)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      int v20 = "adv_service_state_finalize";
      __int16 v21 = 2048;
      *(void *)int v22 = v2;
      _os_log_impl(&dword_20D928000, v3, OS_LOG_TYPE_INFO, "%{public}s: \"state->null_browse_ref is non-null: %p\"", buf, 0x16u);
      uint64_t v2 = *(_DNSServiceRef_t **)(a1 + 24);
    }
    DNSServiceRefDeallocate(v2);
  }
  int v4 = *(_DNSServiceRef_t **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      int v20 = "adv_service_state_finalize";
      __int16 v21 = 2048;
      *(void *)int v22 = v4;
      _os_log_impl(&dword_20D928000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"state->null_browse_ref is non-null: %p\"", buf, 0x16u);
      int v4 = *(_DNSServiceRef_t **)(a1 + 32);
    }
    DNSServiceRefDeallocate(v4);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      int v20 = "adv_service_state_finalize";
      __int16 v21 = 2048;
      *(void *)int v22 = v6;
      _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"state->instances not NULL (%p)\"", buf, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint64_t v9 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      int v20 = "adv_service_state_finalize";
      __int16 v21 = 2048;
      *(void *)int v22 = v8;
      _os_log_impl(&dword_20D928000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"state->next not NULL (%p)\"", buf, 0x16u);
    }
  }
  if (*(void *)(a1 + 48))
  {
    for (unint64_t i = 0; i < *(void *)(a1 + 48); ++i)
    {
      BOOL v11 = *(void **)(*(void *)(a1 + 56) + 8 * i);
      if (v11)
      {
        int v12 = *(_DWORD *)v11;
        if (!*(_DWORD *)v11)
        {
          uint64_t v16 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447490;
            int v20 = "adv_service_state_finalize";
            __int16 v21 = 1024;
            *(_DWORD *)int v22 = 0;
            *(_WORD *)&v22[4] = 2048;
            *(void *)&v22[6] = v11;
            *(_WORD *)&v22[14] = 2080;
            *(void *)&v22[16] = "state->subscribers[i]";
            *(_WORD *)&v22[24] = 2080;
            *(void *)&v22[26] = "adv-resolve.c";
            __int16 v23 = 1024;
            int v24 = 107;
            __int16 v17 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
            uint64_t v18 = v16;
            goto LABEL_32;
          }
LABEL_33:
          abort();
        }
        int v13 = advertising_proxy_global_os_log;
        BOOL v14 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
        if (v12 >= 10001)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136447490;
            int v20 = "adv_service_state_finalize";
            __int16 v21 = 1024;
            *(_DWORD *)int v22 = v12;
            *(_WORD *)&v22[4] = 2048;
            *(void *)&v22[6] = v11;
            *(_WORD *)&v22[14] = 2080;
            *(void *)&v22[16] = "state->subscribers[i]";
            *(_WORD *)&v22[24] = 2080;
            *(void *)&v22[26] = "adv-resolve.c";
            __int16 v23 = 1024;
            int v24 = 107;
            __int16 v17 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
            uint64_t v18 = v13;
LABEL_32:
            _os_log_impl(&dword_20D928000, v18, OS_LOG_TYPE_INFO, v17, buf, 0x36u);
          }
          goto LABEL_33;
        }
        if (v14)
        {
          *(_DWORD *)buf = 136447490;
          int v20 = "adv_service_state_finalize";
          __int16 v21 = 1024;
          *(_DWORD *)int v22 = v12;
          *(_WORD *)&v22[4] = 2048;
          *(void *)&v22[6] = v11;
          *(_WORD *)&v22[14] = 2080;
          *(void *)&v22[16] = "state->subscribers[i]";
          *(_WORD *)&v22[24] = 2080;
          *(void *)&v22[26] = "adv-resolve.c";
          __int16 v23 = 1024;
          int v24 = 107;
          _os_log_impl(&dword_20D928000, v13, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
          BOOL v11 = *(void **)(*(void *)(a1 + 56) + 8 * i);
          int v12 = *(_DWORD *)v11;
        }
        *(_DWORD *)BOOL v11 = v12 - 1;
        if (v12 == 1)
        {
          int v15 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447234;
            int v20 = "adv_service_state_finalize";
            __int16 v21 = 2048;
            *(void *)int v22 = v11;
            *(_WORD *)&v22[8] = 2080;
            *(void *)&v22[10] = "state->subscribers[i]";
            *(_WORD *)&v22[18] = 2080;
            *(void *)&v22[20] = "adv-resolve.c";
            *(_WORD *)&v22[28] = 1024;
            *(_DWORD *)&v22[30] = 107;
            _os_log_impl(&dword_20D928000, v15, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
            BOOL v11 = *(void **)(*(void *)(a1 + 56) + 8 * i);
          }
          ++advertising_proxy_subscription_finalized;
          advertising_proxy_subscription_finalize(v11);
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
}

uint64_t advertising_proxy_registrar_create(int **a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = 4294901747;
  if (a1 && a3)
  {
    uint64_t v9 = advertising_proxy_subscription_create();
    if (v9)
    {
      uint64_t v10 = v9;
      BOOL v11 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        int v12 = *v10;
        *(_DWORD *)buf = 136447490;
        __int16 v19 = "advertising_proxy_registrar_create";
        __int16 v20 = 1024;
        int v21 = v12;
        __int16 v22 = 2048;
        __int16 v23 = v10;
        __int16 v24 = 2080;
        uint64_t v25 = "subscription";
        __int16 v26 = 2080;
        long long v27 = "adv-resolve.c";
        __int16 v28 = 1024;
        int v29 = 348;
        _os_log_impl(&dword_20D928000, v11, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      }
      int v13 = *v10;
      if (*v10)
      {
        int v14 = v13 + 1;
        int *v10 = v13 + 1;
        if (v13 + 1 >= 10001)
        {
          int v15 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447490;
            __int16 v19 = "advertising_proxy_registrar_create";
            __int16 v20 = 1024;
            int v21 = v14;
            __int16 v22 = 2048;
            __int16 v23 = v10;
            __int16 v24 = 2080;
            uint64_t v25 = "subscription";
            __int16 v26 = 2080;
            long long v27 = "adv-resolve.c";
            __int16 v28 = 1024;
            int v29 = 348;
            _os_log_impl(&dword_20D928000, v15, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
          }
          abort();
        }
      }
      else
      {
        ++advertising_proxy_subscription_created;
        int *v10 = 1;
      }
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 0x40000000;
      v17[2] = __advertising_proxy_registrar_create_block_invoke;
      v17[3] = &__block_descriptor_tmp_279;
      void v17[4] = a3;
      v17[5] = v10;
      v17[6] = a4;
      v17[7] = v10;
      dispatch_async(a2, v17);
      uint64_t v4 = 0;
      *a1 = v10;
    }
    else
    {
      return 4294901757;
    }
  }
  return v4;
}

int *advertising_proxy_subscription_create()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v0 = (int *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A0040BC42D5E1uLL);
  if (v0)
  {
    uint64_t v1 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v2 = *v0;
      *(_DWORD *)buf = 136447490;
      uint64_t v8 = "advertising_proxy_subscription_create";
      __int16 v9 = 1024;
      int v10 = v2;
      __int16 v11 = 2048;
      int v12 = v0;
      __int16 v13 = 2080;
      int v14 = "subscription";
      __int16 v15 = 2080;
      uint64_t v16 = "adv-resolve.c";
      __int16 v17 = 1024;
      int v18 = 248;
      _os_log_impl(&dword_20D928000, v1, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    }
    if (*v0)
    {
      int v3 = *v0 + 1;
      int *v0 = v3;
      if (v3 >= 10001)
      {
        int v6 = v3;
        uint64_t v4 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136447490;
          uint64_t v8 = "advertising_proxy_subscription_create";
          __int16 v9 = 1024;
          int v10 = v6;
          __int16 v11 = 2048;
          int v12 = v0;
          __int16 v13 = 2080;
          int v14 = "subscription";
          __int16 v15 = 2080;
          uint64_t v16 = "adv-resolve.c";
          __int16 v17 = 1024;
          int v18 = 248;
          _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
        }
        abort();
      }
    }
    else
    {
      ++advertising_proxy_subscription_created;
      int *v0 = 1;
    }
  }
  return v0;
}

void __advertising_proxy_registrar_create_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), 0, *(void *)(a1 + 48));
  int v2 = *(void **)(a1 + 56);
  if (!v2) {
    return;
  }
  int v3 = *(_DWORD *)v2;
  if (!*(_DWORD *)v2)
  {
    uint64_t v7 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v10 = 136447490;
    __int16 v11 = "advertising_proxy_registrar_create_block_invoke";
    __int16 v12 = 1024;
    *(_DWORD *)__int16 v13 = 0;
    *(_WORD *)&v13[4] = 2048;
    *(void *)&v13[6] = v2;
    *(_WORD *)&v13[14] = 2080;
    *(void *)&v13[16] = "subscription";
    *(_WORD *)&v13[24] = 2080;
    *(void *)&v13[26] = "adv-resolve.c";
    __int16 v14 = 1024;
    int v15 = 351;
    uint64_t v8 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    __int16 v9 = v7;
    goto LABEL_15;
  }
  uint64_t v4 = advertising_proxy_global_os_log;
  BOOL v5 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v3 >= 10001)
  {
    if (!v5) {
      goto LABEL_16;
    }
    int v10 = 136447490;
    __int16 v11 = "advertising_proxy_registrar_create_block_invoke";
    __int16 v12 = 1024;
    *(_DWORD *)__int16 v13 = v3;
    *(_WORD *)&v13[4] = 2048;
    *(void *)&v13[6] = v2;
    *(_WORD *)&v13[14] = 2080;
    *(void *)&v13[16] = "subscription";
    *(_WORD *)&v13[24] = 2080;
    *(void *)&v13[26] = "adv-resolve.c";
    __int16 v14 = 1024;
    int v15 = 351;
    uint64_t v8 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    __int16 v9 = v4;
LABEL_15:
    _os_log_impl(&dword_20D928000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0x36u);
LABEL_16:
    abort();
  }
  if (v5)
  {
    int v10 = 136447490;
    __int16 v11 = "advertising_proxy_registrar_create_block_invoke";
    __int16 v12 = 1024;
    *(_DWORD *)__int16 v13 = v3;
    *(_WORD *)&v13[4] = 2048;
    *(void *)&v13[6] = v2;
    *(_WORD *)&v13[14] = 2080;
    *(void *)&v13[16] = "subscription";
    *(_WORD *)&v13[24] = 2080;
    *(void *)&v13[26] = "adv-resolve.c";
    __int16 v14 = 1024;
    int v15 = 351;
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v10, 0x36u);
    int v2 = *(void **)(a1 + 56);
    int v3 = *(_DWORD *)v2;
  }
  *(_DWORD *)int v2 = v3 - 1;
  if (v3 == 1)
  {
    int v6 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v10 = 136447234;
      __int16 v11 = "advertising_proxy_registrar_create_block_invoke";
      __int16 v12 = 2048;
      *(void *)__int16 v13 = v2;
      *(_WORD *)&v13[8] = 2080;
      *(void *)&v13[10] = "subscription";
      *(_WORD *)&v13[18] = 2080;
      *(void *)&v13[20] = "adv-resolve.c";
      *(_WORD *)&v13[28] = 1024;
      *(_DWORD *)&v13[30] = 351;
      _os_log_impl(&dword_20D928000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v10, 0x30u);
      int v2 = *(void **)(a1 + 56);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(v2);
  }
}

uint64_t advertising_proxy_browse_create(int **a1, NSObject *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v5 = 4294901747;
  if (!a1 || !a3 || !a4) {
    return v5;
  }
  if (a2) {
    int v10 = a2;
  }
  else {
    int v10 = MEMORY[0x263EF83A0];
  }
  __int16 v11 = advertising_proxy_subscription_create();
  if (!v11) {
    return 4294901757;
  }
  __int16 v12 = v11;
  __int16 v13 = (DNSServiceRef *)malloc_type_calloc(1uLL, 0x40uLL, 0x10B004038106158uLL);
  __int16 v14 = advertising_proxy_global_os_log;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v15 = *(_DWORD *)v13;
      int v53 = 136447490;
      v54 = "adv_service_state_create";
      __int16 v55 = 1024;
      *(_DWORD *)xpc_object_t v56 = v15;
      *(_WORD *)&v56[4] = 2048;
      *(void *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(void *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(void *)&v56[26] = "adv-resolve.c";
      __int16 v57 = 1024;
      int v58 = 196;
      _os_log_impl(&dword_20D928000, v14, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    }
    int v16 = *(_DWORD *)v13;
    if (*(_DWORD *)v13)
    {
      int v17 = v16 + 1;
      *(_DWORD *)__int16 v13 = v16 + 1;
      if (v16 + 1 >= 10001)
      {
        int v18 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_95;
        }
        int v53 = 136447490;
        v54 = "adv_service_state_create";
        __int16 v55 = 1024;
        *(_DWORD *)xpc_object_t v56 = v17;
        *(_WORD *)&v56[4] = 2048;
        *(void *)&v56[6] = v13;
        *(_WORD *)&v56[14] = 2080;
        *(void *)&v56[16] = "state";
        *(_WORD *)&v56[24] = 2080;
        *(void *)&v56[26] = "adv-resolve.c";
        __int16 v57 = 1024;
        int v58 = 196;
        uint64_t v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
LABEL_93:
        uint64_t v52 = v18;
        goto LABEL_94;
      }
    }
    else
    {
      ++adv_service_state_created;
      *(_DWORD *)__int16 v13 = 1;
    }
  }
  else if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
  {
    int v53 = 136446466;
    v54 = "adv_service_state_create";
    __int16 v55 = 2082;
    *(void *)xpc_object_t v56 = a3;
    _os_log_error_impl(&dword_20D928000, v14, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for service state %{public}s\"", (uint8_t *)&v53, 0x16u);
  }
  __int16 v20 = strdup(a3);
  v13[2] = (DNSServiceRef)v20;
  if (!v20)
  {
    int v29 = *(_DWORD *)v13;
    if (!*(_DWORD *)v13)
    {
      int v18 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_95;
      }
      int v53 = 136447490;
      v54 = "adv_service_state_create";
      __int16 v55 = 1024;
      *(_DWORD *)xpc_object_t v56 = 0;
      *(_WORD *)&v56[4] = 2048;
      *(void *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(void *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(void *)&v56[26] = "adv-resolve.c";
      __int16 v57 = 1024;
      int v58 = 199;
      uint64_t v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_93;
    }
    uint64_t v30 = advertising_proxy_global_os_log;
    BOOL v31 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v29 >= 10001)
    {
      if (!v31) {
LABEL_95:
      }
        abort();
      int v53 = 136447490;
      v54 = "adv_service_state_create";
      __int16 v55 = 1024;
      *(_DWORD *)xpc_object_t v56 = v29;
      *(_WORD *)&v56[4] = 2048;
      *(void *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(void *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(void *)&v56[26] = "adv-resolve.c";
      __int16 v57 = 1024;
      int v58 = 199;
      uint64_t v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      uint64_t v52 = v30;
LABEL_94:
      _os_log_impl(&dword_20D928000, v52, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v53, 0x36u);
      goto LABEL_95;
    }
    if (v31)
    {
      int v53 = 136447490;
      v54 = "adv_service_state_create";
      __int16 v55 = 1024;
      *(_DWORD *)xpc_object_t v56 = v29;
      *(_WORD *)&v56[4] = 2048;
      *(void *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(void *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(void *)&v56[26] = "adv-resolve.c";
      __int16 v57 = 1024;
      int v58 = 199;
      _os_log_impl(&dword_20D928000, v30, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
      int v29 = *(_DWORD *)v13;
      uint64_t v30 = advertising_proxy_global_os_log;
    }
    *(_DWORD *)__int16 v13 = v29 - 1;
    if (v29 == 1)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v53 = 136447234;
        v54 = "adv_service_state_create";
        __int16 v55 = 2048;
        *(void *)xpc_object_t v56 = v13;
        *(_WORD *)&v56[8] = 2080;
        *(void *)&v56[10] = "state";
        *(_WORD *)&v56[18] = 2080;
        *(void *)&v56[20] = "adv-resolve.c";
        *(_WORD *)&v56[28] = 1024;
        *(_DWORD *)&v56[30] = 199;
        _os_log_impl(&dword_20D928000, v30, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x30u);
      }
      ++adv_service_state_finalized;
      adv_service_state_finalize((uint64_t)v13);
      uint64_t v30 = advertising_proxy_global_os_log;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v53 = 136446466;
      v54 = "adv_service_state_create";
      __int16 v55 = 2082;
      *(void *)xpc_object_t v56 = a3;
      _os_log_error_impl(&dword_20D928000, v30, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for service_type %{public}s\"", (uint8_t *)&v53, 0x16u);
    }
    __int16 v13 = 0;
    uint64_t v5 = 4294901757;
    goto LABEL_42;
  }
  adv_subscriber_add((size_t *)v13 + 6, (void **)v13 + 7, v12);
  *((void *)v12 + 5) = v13;
  int v21 = advertising_proxy_global_os_log;
  BOOL v22 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  __int16 v23 = v13;
  if (v22)
  {
    int v24 = *(_DWORD *)v13;
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = v24;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "subscription->service";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 456;
    _os_log_impl(&dword_20D928000, v21, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    __int16 v23 = (_DWORD *)*((void *)v12 + 5);
  }
  int v25 = *v23;
  if (*v23)
  {
    int v26 = v25 + 1;
    *__int16 v23 = v25 + 1;
    if (v25 + 1 >= 10001)
    {
      long long v27 = v23;
      uint64_t v28 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_95;
      }
      int v53 = 136447490;
      v54 = "advertising_proxy_browse_create";
      __int16 v55 = 1024;
      *(_DWORD *)xpc_object_t v56 = v26;
      *(_WORD *)&v56[4] = 2048;
      *(void *)&v56[6] = v27;
      *(_WORD *)&v56[14] = 2080;
      *(void *)&v56[16] = "subscription->service";
      *(_WORD *)&v56[24] = 2080;
      *(void *)&v56[26] = "adv-resolve.c";
      __int16 v57 = 1024;
      int v58 = 456;
      uint64_t v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
LABEL_84:
      uint64_t v52 = v28;
      goto LABEL_94;
    }
  }
  else
  {
    ++adv_service_state_created;
    *__int16 v23 = 1;
  }
  *((void *)v12 + 2) = a4;
  *((void *)v12 + 6) = a5;
  DNSServiceErrorType v32 = DNSServiceBrowse(v13 + 3, 0, 0, a3, 0, (DNSServiceBrowseReply)advertising_proxy_browse_callback, v13);
  if (!v32)
  {
    DNSServiceErrorType v32 = DNSServiceSetDispatchQueue(v13[3], v10);
    if (!v32)
    {
      __int16 v42 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        int v43 = *(_DWORD *)v13;
        int v53 = 136447490;
        v54 = "advertising_proxy_browse_create";
        __int16 v55 = 1024;
        *(_DWORD *)xpc_object_t v56 = v43;
        *(_WORD *)&v56[4] = 2048;
        *(void *)&v56[6] = v13;
        *(_WORD *)&v56[14] = 2080;
        *(void *)&v56[16] = "service";
        *(_WORD *)&v56[24] = 2080;
        *(void *)&v56[26] = "adv-resolve.c";
        __int16 v57 = 1024;
        int v58 = 471;
        _os_log_impl(&dword_20D928000, v42, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
      }
      int v44 = *(_DWORD *)v13;
      if (*(_DWORD *)v13)
      {
        int v45 = v44 + 1;
        *(_DWORD *)__int16 v13 = v44 + 1;
        if (v44 + 1 >= 10001)
        {
          int v18 = advertising_proxy_global_os_log;
          if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
            goto LABEL_95;
          }
          int v53 = 136447490;
          v54 = "advertising_proxy_browse_create";
          __int16 v55 = 1024;
          *(_DWORD *)xpc_object_t v56 = v45;
          *(_WORD *)&v56[4] = 2048;
          *(void *)&v56[6] = v13;
          *(_WORD *)&v56[14] = 2080;
          *(void *)&v56[16] = "service";
          *(_WORD *)&v56[24] = 2080;
          *(void *)&v56[26] = "adv-resolve.c";
          __int16 v57 = 1024;
          int v58 = 471;
          uint64_t v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
          goto LABEL_93;
        }
      }
      else
      {
        ++adv_service_state_created;
        *(_DWORD *)__int16 v13 = 1;
      }
      DNSServiceErrorType v46 = DNSServiceBrowse(v13 + 4, 0, 0, a3, "default.service.arpa", (DNSServiceBrowseReply)advertising_proxy_browse_callback, v13);
      if (!v46)
      {
        DNSServiceErrorType v46 = DNSServiceSetDispatchQueue(v13[4], v10);
        if (!v46)
        {
          __int16 v48 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            int v49 = *(_DWORD *)v13;
            int v53 = 136447490;
            v54 = "advertising_proxy_browse_create";
            __int16 v55 = 1024;
            *(_DWORD *)xpc_object_t v56 = v49;
            *(_WORD *)&v56[4] = 2048;
            *(void *)&v56[6] = v13;
            *(_WORD *)&v56[14] = 2080;
            *(void *)&v56[16] = "service";
            *(_WORD *)&v56[24] = 2080;
            *(void *)&v56[26] = "adv-resolve.c";
            __int16 v57 = 1024;
            int v58 = 483;
            _os_log_impl(&dword_20D928000, v48, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
          }
          int v50 = *(_DWORD *)v13;
          if (*(_DWORD *)v13)
          {
            int v51 = v50 + 1;
            *(_DWORD *)__int16 v13 = v50 + 1;
            if (v50 + 1 >= 10001)
            {
              int v18 = advertising_proxy_global_os_log;
              if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
                goto LABEL_95;
              }
              int v53 = 136447490;
              v54 = "advertising_proxy_browse_create";
              __int16 v55 = 1024;
              *(_DWORD *)xpc_object_t v56 = v51;
              *(_WORD *)&v56[4] = 2048;
              *(void *)&v56[6] = v13;
              *(_WORD *)&v56[14] = 2080;
              *(void *)&v56[16] = "service";
              *(_WORD *)&v56[24] = 2080;
              *(void *)&v56[26] = "adv-resolve.c";
              __int16 v57 = 1024;
              int v58 = 483;
              uint64_t v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
              goto LABEL_93;
            }
          }
          else
          {
            ++adv_service_state_created;
            *(_DWORD *)__int16 v13 = 1;
          }
          uint64_t v5 = 0;
          *a1 = v12;
          return v5;
        }
      }
      uint64_t v33 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_41;
      }
      int v53 = 136446722;
      v54 = "advertising_proxy_browse_create";
      __int16 v55 = 2082;
      *(void *)xpc_object_t v56 = a3;
      *(_WORD *)&v56[8] = 1024;
      *(_DWORD *)&v56[10] = v46;
      xpc_object_t v47 = "%{public}s: \"browse on service %{public}s in the push domain failed with %d\"";
      goto LABEL_73;
    }
  }
  uint64_t v33 = advertising_proxy_global_os_log;
  if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
  {
    int v53 = 136446722;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 2082;
    *(void *)xpc_object_t v56 = a3;
    *(_WORD *)&v56[8] = 1024;
    *(_DWORD *)&v56[10] = v32;
    xpc_object_t v47 = "%{public}s: \"browse for service %{public}s in the default domains failed with %d\"";
LABEL_73:
    _os_log_error_impl(&dword_20D928000, v33, OS_LOG_TYPE_ERROR, v47, (uint8_t *)&v53, 0x1Cu);
  }
LABEL_41:
  uint64_t v5 = 4294901759;
LABEL_42:
  advertising_proxy_subscription_cancel(v12);
  int v34 = *v12;
  if (!*v12)
  {
    uint64_t v28 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_95;
    }
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = 0;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v12;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "subscription";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 491;
    uint64_t v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_84;
  }
  uint64_t v35 = advertising_proxy_global_os_log;
  BOOL v36 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v34 >= 10001)
  {
    if (!v36) {
      goto LABEL_95;
    }
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = v34;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v12;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "subscription";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 491;
    uint64_t v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    uint64_t v52 = v35;
    goto LABEL_94;
  }
  if (v36)
  {
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = v34;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v12;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "subscription";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 491;
    _os_log_impl(&dword_20D928000, v35, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    int v34 = *v12;
  }
  int *v12 = v34 - 1;
  if (v34 == 1)
  {
    int v37 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v53 = 136447234;
      v54 = "advertising_proxy_browse_create";
      __int16 v55 = 2048;
      *(void *)xpc_object_t v56 = v12;
      *(_WORD *)&v56[8] = 2080;
      *(void *)&v56[10] = "subscription";
      *(_WORD *)&v56[18] = 2080;
      *(void *)&v56[20] = "adv-resolve.c";
      *(_WORD *)&v56[28] = 1024;
      *(_DWORD *)&v56[30] = 491;
      _os_log_impl(&dword_20D928000, v37, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x30u);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(v12);
    if (!v13) {
      return v5;
    }
  }
  else if (!v13)
  {
    return v5;
  }
  adv_service_state_cancel((uint64_t)v13);
  int v38 = *(_DWORD *)v13;
  if (!*(_DWORD *)v13)
  {
    int v18 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_95;
    }
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = 0;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "service";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 495;
    uint64_t v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_93;
  }
  int v18 = advertising_proxy_global_os_log;
  BOOL v39 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v38 >= 10001)
  {
    if (!v39) {
      goto LABEL_95;
    }
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = v38;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "service";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 495;
    uint64_t v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_93;
  }
  if (v39)
  {
    int v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    __int16 v55 = 1024;
    *(_DWORD *)xpc_object_t v56 = v38;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(void *)&v56[16] = "service";
    *(_WORD *)&v56[24] = 2080;
    *(void *)&v56[26] = "adv-resolve.c";
    __int16 v57 = 1024;
    int v58 = 495;
    _os_log_impl(&dword_20D928000, v18, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    int v38 = *(_DWORD *)v13;
  }
  *(_DWORD *)__int16 v13 = v38 - 1;
  if (v38 == 1)
  {
    uint64_t v40 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v53 = 136447234;
      v54 = "advertising_proxy_browse_create";
      __int16 v55 = 2048;
      *(void *)xpc_object_t v56 = v13;
      *(_WORD *)&v56[8] = 2080;
      *(void *)&v56[10] = "service";
      *(_WORD *)&v56[18] = 2080;
      *(void *)&v56[20] = "adv-resolve.c";
      *(_WORD *)&v56[28] = 1024;
      *(_DWORD *)&v56[30] = 495;
      _os_log_impl(&dword_20D928000, v40, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x30u);
    }
    ++adv_service_state_finalized;
    adv_service_state_finalize((uint64_t)v13);
  }
  return v5;
}

void adv_subscriber_add(size_t *a1, void **a2, int *a3)
{
  int v3 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  size_t v6 = *a1;
  uint64_t v7 = *a2;
  if (*a1)
  {
    uint64_t v8 = 0;
    while (v7[v8])
    {
      if (v6 == ++v8) {
        goto LABEL_5;
      }
    }
    v7[v8] = a3;
    int v17 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v18 = *v3;
      int v22 = 136447490;
      __int16 v23 = "adv_subscriber_add";
      __int16 v24 = 1024;
      *(_DWORD *)int v25 = v18;
      *(_WORD *)&v25[4] = 2048;
      *(void *)&v25[6] = v3;
      __int16 v26 = 2080;
      long long v27 = "subscribers[i]";
      __int16 v28 = 2080;
      int v29 = "adv-resolve.c";
      __int16 v30 = 1024;
      int v31 = 373;
      _os_log_impl(&dword_20D928000, v17, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v22, 0x36u);
      int v3 = (int *)v7[v8];
    }
    int v19 = *v3;
    if (*v3)
    {
      int v20 = v19 + 1;
      *int v3 = v19 + 1;
      if (v19 + 1 >= 10001)
      {
        int v16 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        int v22 = 136447490;
        __int16 v23 = "adv_subscriber_add";
        __int16 v24 = 1024;
        *(_DWORD *)int v25 = v20;
        *(_WORD *)&v25[4] = 2048;
        *(void *)&v25[6] = v3;
        __int16 v26 = 2080;
        long long v27 = "subscribers[i]";
        __int16 v28 = 2080;
        int v29 = "adv-resolve.c";
        __int16 v30 = 1024;
        int v31 = 373;
LABEL_23:
        _os_log_impl(&dword_20D928000, v16, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v22, 0x36u);
LABEL_24:
        abort();
      }
    }
    else
    {
      ++advertising_proxy_subscription_created;
      *int v3 = 1;
    }
  }
  else
  {
LABEL_5:
    if (v7) {
      size_t v9 = 2 * v6;
    }
    else {
      size_t v9 = 10;
    }
    int v10 = malloc_type_calloc(v9, 8uLL, 0x2004093837F09uLL);
    if (v10)
    {
      __int16 v11 = v10;
      if (*a2)
      {
        memcpy(v10, v7, 8 * v6);
        free(*a2);
      }
      *a2 = v11;
      *((void *)v11 + v6) = v3;
      __int16 v12 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        int v13 = *v3;
        int v22 = 136447490;
        __int16 v23 = "adv_subscriber_add";
        __int16 v24 = 1024;
        *(_DWORD *)int v25 = v13;
        *(_WORD *)&v25[4] = 2048;
        *(void *)&v25[6] = v3;
        __int16 v26 = 2080;
        long long v27 = "new_subscribers[max_subscribers]";
        __int16 v28 = 2080;
        int v29 = "adv-resolve.c";
        __int16 v30 = 1024;
        int v31 = 389;
        _os_log_impl(&dword_20D928000, v12, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v22, 0x36u);
        int v3 = (int *)*((void *)v11 + v6);
      }
      int v14 = *v3;
      if (*v3)
      {
        int v15 = v14 + 1;
        *int v3 = v14 + 1;
        if (v14 + 1 >= 10001)
        {
          int v16 = advertising_proxy_global_os_log;
          if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
            goto LABEL_24;
          }
          int v22 = 136447490;
          __int16 v23 = "adv_subscriber_add";
          __int16 v24 = 1024;
          *(_DWORD *)int v25 = v15;
          *(_WORD *)&v25[4] = 2048;
          *(void *)&v25[6] = v3;
          __int16 v26 = 2080;
          long long v27 = "new_subscribers[max_subscribers]";
          __int16 v28 = 2080;
          int v29 = "adv-resolve.c";
          __int16 v30 = 1024;
          int v31 = 389;
          goto LABEL_23;
        }
      }
      else
      {
        ++advertising_proxy_subscription_created;
        *int v3 = 1;
      }
      *a1 = v9;
    }
    else
    {
      int v21 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136446466;
        __int16 v23 = "adv_subscriber_add";
        __int16 v24 = 2048;
        *(void *)int v25 = v9;
        _os_log_error_impl(&dword_20D928000, v21, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for %zu subscribers\"", (uint8_t *)&v22, 0x16u);
      }
    }
  }
}

void adv_service_state_cancel(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = *(_DNSServiceRef_t **)(a1 + 32);
  if (v2)
  {
    DNSServiceRefDeallocate(v2);
    *(void *)(a1 + 32) = 0;
    int v3 = *(_DWORD *)a1;
    if (!*(_DWORD *)a1)
    {
      uint64_t v4 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_29;
      }
      int v12 = 136447490;
      int v13 = "adv_service_state_cancel";
      __int16 v14 = 1024;
      *(_DWORD *)int v15 = 0;
      *(_WORD *)&v15[4] = 2048;
      *(void *)&v15[6] = a1;
      *(_WORD *)&v15[14] = 2080;
      *(void *)&v15[16] = "state";
      *(_WORD *)&v15[24] = 2080;
      *(void *)&v15[26] = "adv-resolve.c";
      __int16 v16 = 1024;
      int v17 = 119;
      __int16 v11 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_28;
    }
    uint64_t v4 = advertising_proxy_global_os_log;
    BOOL v5 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v3 >= 10001)
    {
      if (!v5) {
        goto LABEL_29;
      }
      int v12 = 136447490;
      int v13 = "adv_service_state_cancel";
      __int16 v14 = 1024;
      *(_DWORD *)int v15 = v3;
      *(_WORD *)&v15[4] = 2048;
      *(void *)&v15[6] = a1;
      *(_WORD *)&v15[14] = 2080;
      *(void *)&v15[16] = "state";
      *(_WORD *)&v15[24] = 2080;
      *(void *)&v15[26] = "adv-resolve.c";
      __int16 v16 = 1024;
      int v17 = 119;
      __int16 v11 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_28;
    }
    if (v5)
    {
      int v12 = 136447490;
      int v13 = "adv_service_state_cancel";
      __int16 v14 = 1024;
      *(_DWORD *)int v15 = v3;
      *(_WORD *)&v15[4] = 2048;
      *(void *)&v15[6] = a1;
      *(_WORD *)&v15[14] = 2080;
      *(void *)&v15[16] = "state";
      *(_WORD *)&v15[24] = 2080;
      *(void *)&v15[26] = "adv-resolve.c";
      __int16 v16 = 1024;
      int v17 = 119;
      _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x36u);
      int v3 = *(_DWORD *)a1;
    }
    *(_DWORD *)a1 = v3 - 1;
    if (v3 == 1)
    {
      size_t v6 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        int v12 = 136447234;
        int v13 = "adv_service_state_cancel";
        __int16 v14 = 2048;
        *(void *)int v15 = a1;
        *(_WORD *)&v15[8] = 2080;
        *(void *)&v15[10] = "state";
        *(_WORD *)&v15[18] = 2080;
        *(void *)&v15[20] = "adv-resolve.c";
        *(_WORD *)&v15[28] = 1024;
        *(_DWORD *)&v15[30] = 119;
        _os_log_impl(&dword_20D928000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x30u);
      }
      ++adv_service_state_finalized;
      adv_service_state_finalize(a1);
    }
  }
  uint64_t v7 = *(_DNSServiceRef_t **)(a1 + 24);
  if (!v7) {
    return;
  }
  DNSServiceRefDeallocate(v7);
  *(void *)(a1 + 24) = 0;
  int v8 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    uint64_t v4 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_29;
    }
    int v12 = 136447490;
    int v13 = "adv_service_state_cancel";
    __int16 v14 = 1024;
    *(_DWORD *)int v15 = 0;
    *(_WORD *)&v15[4] = 2048;
    *(void *)&v15[6] = a1;
    *(_WORD *)&v15[14] = 2080;
    *(void *)&v15[16] = "state";
    *(_WORD *)&v15[24] = 2080;
    *(void *)&v15[26] = "adv-resolve.c";
    __int16 v16 = 1024;
    int v17 = 124;
    __int16 v11 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_28;
  }
  uint64_t v4 = advertising_proxy_global_os_log;
  BOOL v9 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v8 >= 10001)
  {
    if (!v9) {
      goto LABEL_29;
    }
    int v12 = 136447490;
    int v13 = "adv_service_state_cancel";
    __int16 v14 = 1024;
    *(_DWORD *)int v15 = v8;
    *(_WORD *)&v15[4] = 2048;
    *(void *)&v15[6] = a1;
    *(_WORD *)&v15[14] = 2080;
    *(void *)&v15[16] = "state";
    *(_WORD *)&v15[24] = 2080;
    *(void *)&v15[26] = "adv-resolve.c";
    __int16 v16 = 1024;
    int v17 = 124;
    __int16 v11 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_28:
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0x36u);
LABEL_29:
    abort();
  }
  if (v9)
  {
    int v12 = 136447490;
    int v13 = "adv_service_state_cancel";
    __int16 v14 = 1024;
    *(_DWORD *)int v15 = v8;
    *(_WORD *)&v15[4] = 2048;
    *(void *)&v15[6] = a1;
    *(_WORD *)&v15[14] = 2080;
    *(void *)&v15[16] = "state";
    *(_WORD *)&v15[24] = 2080;
    *(void *)&v15[26] = "adv-resolve.c";
    __int16 v16 = 1024;
    int v17 = 124;
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x36u);
    int v8 = *(_DWORD *)a1;
  }
  *(_DWORD *)a1 = v8 - 1;
  if (v8 == 1)
  {
    int v10 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v12 = 136447234;
      int v13 = "adv_service_state_cancel";
      __int16 v14 = 2048;
      *(void *)int v15 = a1;
      *(_WORD *)&v15[8] = 2080;
      *(void *)&v15[10] = "state";
      *(_WORD *)&v15[18] = 2080;
      *(void *)&v15[20] = "adv-resolve.c";
      *(_WORD *)&v15[28] = 1024;
      *(_DWORD *)&v15[30] = 124;
      _os_log_impl(&dword_20D928000, v10, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x30u);
    }
    ++adv_service_state_finalized;
    adv_service_state_finalize(a1);
  }
}

void advertising_proxy_browse_callback(uint64_t a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a8)
  {
    __int16 v14 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v15 = *(_DWORD *)a8;
      int v28 = 136447490;
      int v29 = "advertising_proxy_browse_callback";
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = v15;
      *(_WORD *)&v31[4] = 2048;
      *(void *)&v31[6] = a8;
      *(_WORD *)&v31[14] = 2080;
      *(void *)&v31[16] = "service";
      *(_WORD *)&v31[24] = 2080;
      *(void *)&v31[26] = "adv-resolve.c";
      __int16 v32 = 1024;
      int v33 = 407;
      _os_log_impl(&dword_20D928000, v14, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v28, 0x36u);
    }
    int v16 = *(_DWORD *)a8;
    if (*(_DWORD *)a8)
    {
      int v17 = v16 + 1;
      *(_DWORD *)a8 = v16 + 1;
      if (v16 + 1 >= 10001)
      {
        uint64_t v18 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_33;
        }
        int v28 = 136447490;
        int v29 = "advertising_proxy_browse_callback";
        __int16 v30 = 1024;
        *(_DWORD *)int v31 = v17;
        *(_WORD *)&v31[4] = 2048;
        *(void *)&v31[6] = a8;
        *(_WORD *)&v31[14] = 2080;
        *(void *)&v31[16] = "service";
        *(_WORD *)&v31[24] = 2080;
        *(void *)&v31[26] = "adv-resolve.c";
        __int16 v32 = 1024;
        int v33 = 407;
        int v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_32;
      }
    }
    else
    {
      ++adv_service_state_created;
      *(_DWORD *)a8 = 1;
    }
  }
  if (a4) {
    uint64_t v20 = 4294901759;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = *(void *)(a8 + 48);
  if (v21)
  {
    unint64_t v22 = 0;
    uint64_t v23 = (a2 >> 1) & 1;
    do
    {
      uint64_t v24 = *(void *)(*(void *)(a8 + 56) + 8 * v22);
      if (v24)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v24, v20, a3, v23, a5, a6, a8);
        unint64_t v21 = *(void *)(a8 + 48);
      }
      ++v22;
    }
    while (v22 < v21);
  }
  if (a4) {
    adv_service_state_cancel(a8);
  }
  int v25 = *(_DWORD *)a8;
  if (!*(_DWORD *)a8)
  {
    uint64_t v18 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    int v28 = 136447490;
    int v29 = "advertising_proxy_browse_callback";
    __int16 v30 = 1024;
    *(_DWORD *)int v31 = 0;
    *(_WORD *)&v31[4] = 2048;
    *(void *)&v31[6] = a8;
    *(_WORD *)&v31[14] = 2080;
    *(void *)&v31[16] = "service";
    *(_WORD *)&v31[24] = 2080;
    *(void *)&v31[26] = "adv-resolve.c";
    __int16 v32 = 1024;
    int v33 = 422;
    int v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_32;
  }
  uint64_t v18 = advertising_proxy_global_os_log;
  BOOL v26 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v25 >= 10001)
  {
    if (!v26) {
      goto LABEL_33;
    }
    int v28 = 136447490;
    int v29 = "advertising_proxy_browse_callback";
    __int16 v30 = 1024;
    *(_DWORD *)int v31 = v25;
    *(_WORD *)&v31[4] = 2048;
    *(void *)&v31[6] = a8;
    *(_WORD *)&v31[14] = 2080;
    *(void *)&v31[16] = "service";
    *(_WORD *)&v31[24] = 2080;
    *(void *)&v31[26] = "adv-resolve.c";
    __int16 v32 = 1024;
    int v33 = 422;
    int v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_32:
    _os_log_impl(&dword_20D928000, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x36u);
LABEL_33:
    abort();
  }
  if (v26)
  {
    int v28 = 136447490;
    int v29 = "advertising_proxy_browse_callback";
    __int16 v30 = 1024;
    *(_DWORD *)int v31 = v25;
    *(_WORD *)&v31[4] = 2048;
    *(void *)&v31[6] = a8;
    *(_WORD *)&v31[14] = 2080;
    *(void *)&v31[16] = "service";
    *(_WORD *)&v31[24] = 2080;
    *(void *)&v31[26] = "adv-resolve.c";
    __int16 v32 = 1024;
    int v33 = 422;
    _os_log_impl(&dword_20D928000, v18, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v28, 0x36u);
    int v25 = *(_DWORD *)a8;
  }
  *(_DWORD *)a8 = v25 - 1;
  if (v25 == 1)
  {
    long long v27 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v28 = 136447234;
      int v29 = "advertising_proxy_browse_callback";
      __int16 v30 = 2048;
      *(void *)int v31 = a8;
      *(_WORD *)&v31[8] = 2080;
      *(void *)&v31[10] = "service";
      *(_WORD *)&v31[18] = 2080;
      *(void *)&v31[20] = "adv-resolve.c";
      *(_WORD *)&v31[28] = 1024;
      *(_DWORD *)&v31[30] = 422;
      _os_log_impl(&dword_20D928000, v27, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v28, 0x30u);
    }
    ++adv_service_state_finalized;
    adv_service_state_finalize(a8);
  }
}

uint64_t advertising_proxy_resolve_create(int **a1, NSObject *a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v8 = 4294901757;
  uint64_t result = 4294901747;
  if (!a1 || !a3 || !a4 || !a6) {
    return result;
  }
  if (a2) {
    int v15 = a2;
  }
  else {
    int v15 = MEMORY[0x263EF83A0];
  }
  int v16 = advertising_proxy_subscription_create();
  if (!v16) {
    return 4294901757;
  }
  int v17 = v16;
  queue = v15;
  uint64_t v18 = adv_instance_state_create(a3, a4, "local");
  if (v18)
  {
    int v19 = (DNSServiceRef *)v18;
    adv_subscriber_add((size_t *)(v18 + 56), (void **)(v18 + 64), v17);
    uint64_t v63 = v17;
    *((void *)v17 + 3) = v19;
    uint64_t v20 = advertising_proxy_global_os_log;
    unint64_t v21 = (int *)v19;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v22 = *(_DWORD *)v19;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 1024;
      *(_DWORD *)unsigned int v67 = v22;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(void *)&v67[16] = "subscription->local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(void *)&v67[26] = "adv-resolve.c";
      __int16 v68 = 1024;
      int v69 = 563;
      _os_log_impl(&dword_20D928000, v20, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      unint64_t v21 = (int *)*((void *)v63 + 3);
    }
    int v23 = *v21;
    if (*v21)
    {
      int v24 = v23 + 1;
      *unint64_t v21 = v23 + 1;
      if (v23 + 1 >= 10001)
      {
        uint64_t v25 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_91;
        }
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = v24;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v21;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "subscription->local_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 563;
        BOOL v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_16;
      }
    }
    else
    {
      ++adv_instance_state_created;
      *unint64_t v21 = 1;
    }
    *((void *)v63 + 1) = a6;
    *((void *)v63 + 6) = a7;
    if (a5) {
      int v28 = a5;
    }
    else {
      int v28 = "local";
    }
    DNSServiceErrorType v29 = DNSServiceResolve(v19 + 6, 0, 0, a3, a4, v28, (DNSServiceResolveReply)advertising_proxy_resolve_callback, v19);
    if (v29)
    {
      DNSServiceErrorType v30 = v29;
      int v31 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446979;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 2081;
        *(void *)unsigned int v67 = a3;
        *(_WORD *)&v67[8] = 2082;
        *(void *)&v67[10] = a4;
        *(_WORD *)&v67[18] = 1024;
        *(_DWORD *)&v67[20] = v30;
        _os_log_error_impl(&dword_20D928000, v31, OS_LOG_TYPE_ERROR, "%{public}s: \"resolve for %{private}s on service %{public}s in the default domains failed with %d\"", buf, 0x26u);
      }
      goto LABEL_27;
    }
    if (DNSServiceSetDispatchQueue(v19[6], queue))
    {
LABEL_27:
      uint64_t v8 = 4294901759;
      int v17 = v63;
      goto LABEL_28;
    }
    uint64_t v40 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v41 = *(_DWORD *)v19;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 1024;
      *(_DWORD *)unsigned int v67 = v41;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(void *)&v67[16] = "local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(void *)&v67[26] = "adv-resolve.c";
      __int16 v68 = 1024;
      int v69 = 584;
      _os_log_impl(&dword_20D928000, v40, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    }
    int v42 = *(_DWORD *)v19;
    if (*(_DWORD *)v19)
    {
      int v43 = v42 + 1;
      *(_DWORD *)int v19 = v42 + 1;
      if (v42 + 1 >= 10001)
      {
        int v37 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_91;
        }
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = v43;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v19;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "local_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 584;
        BOOL v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
LABEL_89:
        long long v27 = v37;
        goto LABEL_90;
      }
    }
    else
    {
      ++adv_instance_state_created;
      *(_DWORD *)int v19 = 1;
    }
    int v17 = v63;
    if (a5)
    {
LABEL_54:
      uint64_t result = 0;
      *a1 = v17;
      return result;
    }
    uint64_t v44 = adv_instance_state_create(a3, a4, "default.service.arpa");
    if (!v44) {
      goto LABEL_28;
    }
    int v45 = (DNSServiceRef *)v44;
    adv_subscriber_add((size_t *)(v44 + 56), (void **)(v44 + 64), v63);
    *((void *)v63 + 4) = v45;
    DNSServiceErrorType v46 = advertising_proxy_global_os_log;
    xpc_object_t v47 = (int *)v45;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v48 = *(_DWORD *)v45;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 1024;
      *(_DWORD *)unsigned int v67 = v48;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v45;
      *(_WORD *)&v67[14] = 2080;
      *(void *)&v67[16] = "subscription->push_instance";
      *(_WORD *)&v67[24] = 2080;
      *(void *)&v67[26] = "adv-resolve.c";
      __int16 v68 = 1024;
      int v69 = 594;
      _os_log_impl(&dword_20D928000, v46, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      xpc_object_t v47 = (int *)*((void *)v63 + 4);
    }
    int v49 = *v47;
    if (*v47)
    {
      int v50 = v49 + 1;
      *xpc_object_t v47 = v49 + 1;
      if (v49 + 1 >= 10001)
      {
        uint64_t v25 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_91;
        }
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = v50;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v47;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "subscription->push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 594;
        BOOL v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_16;
      }
    }
    else
    {
      ++adv_instance_state_created;
      *xpc_object_t v47 = 1;
    }
    DNSServiceErrorType v51 = DNSServiceResolve(v45 + 6, 0, 0, a3, a4, "default.service.arpa", (DNSServiceResolveReply)advertising_proxy_resolve_callback, v45);
    if (v51)
    {
      DNSServiceErrorType v52 = v51;
      int v53 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446979;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 2081;
        *(void *)unsigned int v67 = a3;
        *(_WORD *)&v67[8] = 2082;
        *(void *)&v67[10] = a4;
        *(_WORD *)&v67[18] = 1024;
        *(_DWORD *)&v67[20] = v52;
        _os_log_error_impl(&dword_20D928000, v53, OS_LOG_TYPE_ERROR, "%{public}s: \"resolve for %{private}s on service %{public}s in the push domain failed with %d\"", buf, 0x26u);
      }
    }
    else if (!DNSServiceSetDispatchQueue(v45[6], queue))
    {
      int v58 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        int v59 = *(_DWORD *)v45;
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = v59;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v45;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 605;
        _os_log_impl(&dword_20D928000, v58, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      }
      int v60 = *(_DWORD *)v45;
      int v17 = v63;
      if (*(_DWORD *)v45)
      {
        int v61 = v60 + 1;
        *(_DWORD *)int v45 = v60 + 1;
        if (v60 + 1 >= 10001)
        {
          uint64_t v25 = advertising_proxy_global_os_log;
          if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
            goto LABEL_91;
          }
          *(_DWORD *)buf = 136447490;
          v65 = "advertising_proxy_resolve_create";
          __int16 v66 = 1024;
          *(_DWORD *)unsigned int v67 = v61;
          *(_WORD *)&v67[4] = 2048;
          *(void *)&v67[6] = v45;
          *(_WORD *)&v67[14] = 2080;
          *(void *)&v67[16] = "push_instance";
          *(_WORD *)&v67[24] = 2080;
          *(void *)&v67[26] = "adv-resolve.c";
          __int16 v68 = 1024;
          int v69 = 605;
          BOOL v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
          goto LABEL_16;
        }
      }
      else
      {
        ++adv_instance_state_created;
        *(_DWORD *)int v45 = 1;
      }
      goto LABEL_54;
    }
    adv_instance_state_cancel((uint64_t)v45);
    int v54 = *(_DWORD *)v45;
    if (!*(_DWORD *)v45)
    {
      uint64_t v25 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = 0;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v45;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 622;
        BOOL v26 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
LABEL_16:
        long long v27 = v25;
LABEL_90:
        _os_log_impl(&dword_20D928000, v27, OS_LOG_TYPE_INFO, v26, buf, 0x36u);
        goto LABEL_91;
      }
      goto LABEL_91;
    }
    __int16 v55 = advertising_proxy_global_os_log;
    BOOL v56 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v54 >= 10001)
    {
      if (v56)
      {
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = v54;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v45;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 622;
        BOOL v26 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
        long long v27 = v55;
        goto LABEL_90;
      }
      goto LABEL_91;
    }
    int v17 = v63;
    if (v56)
    {
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 1024;
      *(_DWORD *)unsigned int v67 = v54;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v45;
      *(_WORD *)&v67[14] = 2080;
      *(void *)&v67[16] = "push_instance";
      *(_WORD *)&v67[24] = 2080;
      *(void *)&v67[26] = "adv-resolve.c";
      __int16 v68 = 1024;
      int v69 = 622;
      _os_log_impl(&dword_20D928000, v55, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      int v54 = *(_DWORD *)v45;
    }
    *(_DWORD *)int v45 = v54 - 1;
    if (v54 == 1)
    {
      __int16 v57 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 2048;
        *(void *)unsigned int v67 = v45;
        *(_WORD *)&v67[8] = 2080;
        *(void *)&v67[10] = "push_instance";
        *(_WORD *)&v67[18] = 2080;
        *(void *)&v67[20] = "adv-resolve.c";
        *(_WORD *)&v67[28] = 1024;
        *(_DWORD *)&v67[30] = 622;
        _os_log_impl(&dword_20D928000, v57, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
      }
      ++adv_instance_state_finalized;
      adv_instance_state_finalize((uint64_t)v45);
    }
    uint64_t v8 = 4294901759;
LABEL_28:
    adv_instance_state_cancel((uint64_t)v19);
    int v32 = *(_DWORD *)v19;
    if (!*(_DWORD *)v19)
    {
      int v37 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_91;
      }
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 1024;
      *(_DWORD *)unsigned int v67 = 0;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(void *)&v67[16] = "local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(void *)&v67[26] = "adv-resolve.c";
      __int16 v68 = 1024;
      int v69 = 626;
      BOOL v26 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_89;
    }
    int v33 = advertising_proxy_global_os_log;
    BOOL v34 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v32 < 10001)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        __int16 v66 = 1024;
        *(_DWORD *)unsigned int v67 = v32;
        *(_WORD *)&v67[4] = 2048;
        *(void *)&v67[6] = v19;
        *(_WORD *)&v67[14] = 2080;
        *(void *)&v67[16] = "local_instance";
        *(_WORD *)&v67[24] = 2080;
        *(void *)&v67[26] = "adv-resolve.c";
        __int16 v68 = 1024;
        int v69 = 626;
        _os_log_impl(&dword_20D928000, v33, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
        int v32 = *(_DWORD *)v19;
      }
      *(_DWORD *)int v19 = v32 - 1;
      if (v32 == 1)
      {
        uint64_t v35 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136447234;
          v65 = "advertising_proxy_resolve_create";
          __int16 v66 = 2048;
          *(void *)unsigned int v67 = v19;
          *(_WORD *)&v67[8] = 2080;
          *(void *)&v67[10] = "local_instance";
          *(_WORD *)&v67[18] = 2080;
          *(void *)&v67[20] = "adv-resolve.c";
          *(_WORD *)&v67[28] = 1024;
          *(_DWORD *)&v67[30] = 626;
          _os_log_impl(&dword_20D928000, v35, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize((uint64_t)v19);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 1024;
      *(_DWORD *)unsigned int v67 = v32;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(void *)&v67[16] = "local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(void *)&v67[26] = "adv-resolve.c";
      __int16 v68 = 1024;
      int v69 = 626;
      BOOL v26 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      long long v27 = v33;
      goto LABEL_90;
    }
LABEL_91:
    abort();
  }
LABEL_36:
  advertising_proxy_subscription_cancel(v17);
  int v36 = *v17;
  if (!*v17)
  {
    int v37 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_91;
    }
    *(_DWORD *)buf = 136447490;
    v65 = "advertising_proxy_resolve_create";
    __int16 v66 = 1024;
    *(_DWORD *)unsigned int v67 = 0;
    *(_WORD *)&v67[4] = 2048;
    *(void *)&v67[6] = v17;
    *(_WORD *)&v67[14] = 2080;
    *(void *)&v67[16] = "subscription";
    *(_WORD *)&v67[24] = 2080;
    *(void *)&v67[26] = "adv-resolve.c";
    __int16 v68 = 1024;
    int v69 = 630;
    BOOL v26 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_89;
  }
  int v37 = advertising_proxy_global_os_log;
  BOOL v38 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v36 >= 10001)
  {
    if (!v38) {
      goto LABEL_91;
    }
    *(_DWORD *)buf = 136447490;
    v65 = "advertising_proxy_resolve_create";
    __int16 v66 = 1024;
    *(_DWORD *)unsigned int v67 = v36;
    *(_WORD *)&v67[4] = 2048;
    *(void *)&v67[6] = v17;
    *(_WORD *)&v67[14] = 2080;
    *(void *)&v67[16] = "subscription";
    *(_WORD *)&v67[24] = 2080;
    *(void *)&v67[26] = "adv-resolve.c";
    __int16 v68 = 1024;
    int v69 = 630;
    BOOL v26 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_89;
  }
  if (v38)
  {
    *(_DWORD *)buf = 136447490;
    v65 = "advertising_proxy_resolve_create";
    __int16 v66 = 1024;
    *(_DWORD *)unsigned int v67 = v36;
    *(_WORD *)&v67[4] = 2048;
    *(void *)&v67[6] = v17;
    *(_WORD *)&v67[14] = 2080;
    *(void *)&v67[16] = "subscription";
    *(_WORD *)&v67[24] = 2080;
    *(void *)&v67[26] = "adv-resolve.c";
    __int16 v68 = 1024;
    int v69 = 630;
    _os_log_impl(&dword_20D928000, v37, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    int v36 = *v17;
  }
  *int v17 = v36 - 1;
  if (v36 == 1)
  {
    BOOL v39 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      v65 = "advertising_proxy_resolve_create";
      __int16 v66 = 2048;
      *(void *)unsigned int v67 = v17;
      *(_WORD *)&v67[8] = 2080;
      *(void *)&v67[10] = "subscription";
      *(_WORD *)&v67[18] = 2080;
      *(void *)&v67[20] = "adv-resolve.c";
      *(_WORD *)&v67[28] = 1024;
      *(_DWORD *)&v67[30] = 630;
      _os_log_impl(&dword_20D928000, v39, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(v17);
  }
  return v8;
}

uint64_t adv_instance_state_create(const char *a1, const char *a2, const char *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  size_t v6 = malloc_type_calloc(1uLL, 0x48uLL, 0x10B004053BFA4E5uLL);
  uint64_t v7 = advertising_proxy_global_os_log;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446723;
      BOOL v26 = "adv_instance_state_create";
      __int16 v27 = 2081;
      *(void *)int v28 = a1;
      *(_WORD *)&char v28[8] = 2082;
      *(void *)&v28[10] = a2;
      _os_log_error_impl(&dword_20D928000, v7, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for state %{private}s . %{public}s\"", (uint8_t *)&v25, 0x20u);
    }
    return 0;
  }
  uint64_t v8 = (uint64_t)v6;
  if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
  {
    int v9 = *(_DWORD *)v8;
    int v25 = 136447490;
    BOOL v26 = "adv_instance_state_create";
    __int16 v27 = 1024;
    *(_DWORD *)int v28 = v9;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = v8;
    *(_WORD *)&v28[14] = 2080;
    *(void *)&v28[16] = "state";
    *(_WORD *)&v28[24] = 2080;
    *(void *)&v28[26] = "adv-resolve.c";
    __int16 v29 = 1024;
    int v30 = 213;
    _os_log_impl(&dword_20D928000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v25, 0x36u);
  }
  int v10 = *(_DWORD *)v8;
  if (*(_DWORD *)v8)
  {
    int v11 = v10 + 1;
    *(_DWORD *)uint64_t v8 = v10 + 1;
    if (v10 + 1 >= 10001)
    {
      int v12 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
      int v25 = 136447490;
      BOOL v26 = "adv_instance_state_create";
      __int16 v27 = 1024;
      *(_DWORD *)int v28 = v11;
      *(_WORD *)&v28[4] = 2048;
      *(void *)&v28[6] = v8;
      *(_WORD *)&v28[14] = 2080;
      *(void *)&v28[16] = "state";
      *(_WORD *)&v28[24] = 2080;
      *(void *)&v28[26] = "adv-resolve.c";
      __int16 v29 = 1024;
      int v30 = 213;
      int v13 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_37;
    }
  }
  else
  {
    ++adv_instance_state_created;
    *(_DWORD *)uint64_t v8 = 1;
  }
  __int16 v14 = strdup(a1);
  *(void *)(v8 + 24) = v14;
  if (!v14)
  {
    uint64_t v20 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v25 = 136446723;
    BOOL v26 = "adv_instance_state_create";
    __int16 v27 = 2081;
    *(void *)int v28 = a1;
    *(_WORD *)&char v28[8] = 2082;
    *(void *)&v28[10] = a2;
    uint64_t v18 = "%{public}s: \"no memory for name %{private}s . %{public}s\"";
LABEL_31:
    int v19 = v20;
    goto LABEL_32;
  }
  int v15 = strdup(a2);
  *(void *)(v8 + 32) = v15;
  if (!v15)
  {
    uint64_t v20 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v25 = 136446723;
    BOOL v26 = "adv_instance_state_create";
    __int16 v27 = 2081;
    *(void *)int v28 = a1;
    *(_WORD *)&char v28[8] = 2082;
    *(void *)&v28[10] = a2;
    uint64_t v18 = "%{public}s: \"no memory for service type %{private}s . %{public}s\"";
    goto LABEL_31;
  }
  if (a3)
  {
    int v16 = strdup(a3);
    *(void *)(v8 + 40) = v16;
    if (!v16)
    {
      uint64_t v17 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136446723;
        BOOL v26 = "adv_instance_state_create";
        __int16 v27 = 2081;
        *(void *)int v28 = a1;
        *(_WORD *)&char v28[8] = 2082;
        *(void *)&v28[10] = a3;
        uint64_t v18 = "%{public}s: \"no memory for domain %{private}s . %{public}s\"";
        int v19 = v17;
LABEL_32:
        _os_log_error_impl(&dword_20D928000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v25, 0x20u);
      }
LABEL_20:
      int v21 = *(_DWORD *)v8;
      if (!*(_DWORD *)v8)
      {
        int v12 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
          goto LABEL_38;
        }
        int v25 = 136447490;
        BOOL v26 = "adv_instance_state_create";
        __int16 v27 = 1024;
        *(_DWORD *)int v28 = 0;
        *(_WORD *)&v28[4] = 2048;
        *(void *)&v28[6] = v8;
        *(_WORD *)&v28[14] = 2080;
        *(void *)&v28[16] = "state";
        *(_WORD *)&v28[24] = 2080;
        *(void *)&v28[26] = "adv-resolve.c";
        __int16 v29 = 1024;
        int v30 = 236;
        int v13 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_37;
      }
      int v12 = advertising_proxy_global_os_log;
      BOOL v22 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v21 >= 10001)
      {
        if (!v22) {
          goto LABEL_38;
        }
        int v25 = 136447490;
        BOOL v26 = "adv_instance_state_create";
        __int16 v27 = 1024;
        *(_DWORD *)int v28 = v21;
        *(_WORD *)&v28[4] = 2048;
        *(void *)&v28[6] = v8;
        *(_WORD *)&v28[14] = 2080;
        *(void *)&v28[16] = "state";
        *(_WORD *)&v28[24] = 2080;
        *(void *)&v28[26] = "adv-resolve.c";
        __int16 v29 = 1024;
        int v30 = 236;
        int v13 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_37:
        _os_log_impl(&dword_20D928000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v25, 0x36u);
LABEL_38:
        abort();
      }
      if (v22)
      {
        int v25 = 136447490;
        BOOL v26 = "adv_instance_state_create";
        __int16 v27 = 1024;
        *(_DWORD *)int v28 = v21;
        *(_WORD *)&v28[4] = 2048;
        *(void *)&v28[6] = v8;
        *(_WORD *)&v28[14] = 2080;
        *(void *)&v28[16] = "state";
        *(_WORD *)&v28[24] = 2080;
        *(void *)&v28[26] = "adv-resolve.c";
        __int16 v29 = 1024;
        int v30 = 236;
        _os_log_impl(&dword_20D928000, v12, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v25, 0x36u);
        int v21 = *(_DWORD *)v8;
      }
      *(_DWORD *)uint64_t v8 = v21 - 1;
      if (v21 == 1)
      {
        int v23 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          int v25 = 136447234;
          BOOL v26 = "adv_instance_state_create";
          __int16 v27 = 2048;
          *(void *)int v28 = v8;
          *(_WORD *)&char v28[8] = 2080;
          *(void *)&v28[10] = "state";
          *(_WORD *)&v28[18] = 2080;
          *(void *)&v28[20] = "adv-resolve.c";
          *(_WORD *)&v28[28] = 1024;
          *(_DWORD *)&v28[30] = 236;
          _os_log_impl(&dword_20D928000, v23, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v25, 0x30u);
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize(v8);
      }
      return 0;
    }
  }
  return v8;
}

void adv_instance_state_cancel(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = *(_DNSServiceRef_t **)(a1 + 48);
  if (!v2) {
    return;
  }
  DNSServiceRefDeallocate(v2);
  *(void *)(a1 + 48) = 0;
  int v3 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    uint64_t v4 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v8 = 136447490;
    int v9 = "adv_instance_state_cancel";
    __int16 v10 = 1024;
    *(_DWORD *)int v11 = 0;
    *(_WORD *)&v11[4] = 2048;
    *(void *)&v11[6] = a1;
    *(_WORD *)&v11[14] = 2080;
    *(void *)&v11[16] = "state";
    *(_WORD *)&v11[24] = 2080;
    *(void *)&v11[26] = "adv-resolve.c";
    __int16 v12 = 1024;
    int v13 = 171;
    uint64_t v7 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_15;
  }
  uint64_t v4 = advertising_proxy_global_os_log;
  BOOL v5 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v3 >= 10001)
  {
    if (!v5) {
      goto LABEL_16;
    }
    int v8 = 136447490;
    int v9 = "adv_instance_state_cancel";
    __int16 v10 = 1024;
    *(_DWORD *)int v11 = v3;
    *(_WORD *)&v11[4] = 2048;
    *(void *)&v11[6] = a1;
    *(_WORD *)&v11[14] = 2080;
    *(void *)&v11[16] = "state";
    *(_WORD *)&v11[24] = 2080;
    *(void *)&v11[26] = "adv-resolve.c";
    __int16 v12 = 1024;
    int v13 = 171;
    uint64_t v7 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_15:
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0x36u);
LABEL_16:
    abort();
  }
  if (v5)
  {
    int v8 = 136447490;
    int v9 = "adv_instance_state_cancel";
    __int16 v10 = 1024;
    *(_DWORD *)int v11 = v3;
    *(_WORD *)&v11[4] = 2048;
    *(void *)&v11[6] = a1;
    *(_WORD *)&v11[14] = 2080;
    *(void *)&v11[16] = "state";
    *(_WORD *)&v11[24] = 2080;
    *(void *)&v11[26] = "adv-resolve.c";
    __int16 v12 = 1024;
    int v13 = 171;
    _os_log_impl(&dword_20D928000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v8, 0x36u);
    int v3 = *(_DWORD *)a1;
  }
  *(_DWORD *)a1 = v3 - 1;
  if (v3 == 1)
  {
    size_t v6 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      int v8 = 136447234;
      int v9 = "adv_instance_state_cancel";
      __int16 v10 = 2048;
      *(void *)int v11 = a1;
      *(_WORD *)&v11[8] = 2080;
      *(void *)&v11[10] = "state";
      *(_WORD *)&v11[18] = 2080;
      *(void *)&v11[20] = "adv-resolve.c";
      *(_WORD *)&v11[28] = 1024;
      *(_DWORD *)&v11[30] = 171;
      _os_log_impl(&dword_20D928000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v8, 0x30u);
    }
    ++adv_instance_state_finalized;
    adv_instance_state_finalize(a1);
  }
}

void advertising_proxy_resolve_callback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a10)
  {
    int v16 = *(_DWORD *)a10;
    if (!*(_DWORD *)a10)
    {
      int v25 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136447490;
      uint64_t v31 = "advertising_proxy_resolve_callback";
      __int16 v32 = 1024;
      *(_DWORD *)int v33 = 0;
      *(_WORD *)&v33[4] = 2048;
      *(void *)&v33[6] = a10;
      *(_WORD *)&v33[14] = 2080;
      *(void *)&v33[16] = "instance";
      *(_WORD *)&v33[24] = 2080;
      *(void *)&v33[26] = "adv-resolve.c";
      __int16 v34 = 1024;
      int v35 = 514;
      int v28 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_35;
    }
    uint64_t v17 = advertising_proxy_global_os_log;
    BOOL v18 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v16 >= 10001)
    {
      if (!v18) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136447490;
      uint64_t v31 = "advertising_proxy_resolve_callback";
      __int16 v32 = 1024;
      *(_DWORD *)int v33 = v16;
      *(_WORD *)&v33[4] = 2048;
      *(void *)&v33[6] = a10;
      *(_WORD *)&v33[14] = 2080;
      *(void *)&v33[16] = "instance";
      *(_WORD *)&v33[24] = 2080;
      *(void *)&v33[26] = "adv-resolve.c";
      __int16 v34 = 1024;
      int v35 = 514;
      int v28 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      __int16 v29 = v17;
LABEL_38:
      _os_log_impl(&dword_20D928000, v29, OS_LOG_TYPE_INFO, v28, buf, 0x36u);
LABEL_39:
      abort();
    }
    if (v18)
    {
      *(_DWORD *)buf = 136447490;
      uint64_t v31 = "advertising_proxy_resolve_callback";
      __int16 v32 = 1024;
      *(_DWORD *)int v33 = v16;
      *(_WORD *)&v33[4] = 2048;
      *(void *)&v33[6] = a10;
      *(_WORD *)&v33[14] = 2080;
      *(void *)&v33[16] = "instance";
      *(_WORD *)&v33[24] = 2080;
      *(void *)&v33[26] = "adv-resolve.c";
      __int16 v34 = 1024;
      int v35 = 514;
      _os_log_impl(&dword_20D928000, v17, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      int v16 = *(_DWORD *)a10;
    }
    *(_DWORD *)a10 = v16 - 1;
    if (v16 == 1)
    {
      int v19 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        uint64_t v31 = "advertising_proxy_resolve_callback";
        __int16 v32 = 2048;
        *(void *)int v33 = a10;
        *(_WORD *)&v33[8] = 2080;
        *(void *)&v33[10] = "instance";
        *(_WORD *)&v33[18] = 2080;
        *(void *)&v33[20] = "adv-resolve.c";
        *(_WORD *)&v33[28] = 1024;
        *(_DWORD *)&v33[30] = 514;
        _os_log_impl(&dword_20D928000, v19, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
      }
      ++adv_instance_state_finalized;
      adv_instance_state_finalize(a10);
    }
  }
  if (a4) {
    uint64_t v20 = 4294901759;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = *(void *)(a10 + 56);
  if (v21)
  {
    for (unint64_t i = 0; i < v21; ++i)
    {
      uint64_t v23 = *(void *)(*(void *)(a10 + 64) + 8 * i);
      if (v23)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(v23, v20, a3, 1, a5, a6, a7, a8, a9, a10);
        unint64_t v21 = *(void *)(a10 + 56);
      }
    }
  }
  if (a4) {
    adv_instance_state_cancel(a10);
  }
  int v24 = *(_DWORD *)a10;
  if (!*(_DWORD *)a10)
  {
    int v25 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136447490;
    uint64_t v31 = "advertising_proxy_resolve_callback";
    __int16 v32 = 1024;
    *(_DWORD *)int v33 = 0;
    *(_WORD *)&v33[4] = 2048;
    *(void *)&v33[6] = a10;
    *(_WORD *)&v33[14] = 2080;
    *(void *)&v33[16] = "instance";
    *(_WORD *)&v33[24] = 2080;
    *(void *)&v33[26] = "adv-resolve.c";
    __int16 v34 = 1024;
    int v35 = 529;
    int v28 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
LABEL_35:
    __int16 v29 = v25;
    goto LABEL_38;
  }
  int v25 = advertising_proxy_global_os_log;
  BOOL v26 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v24 >= 10001)
  {
    if (!v26) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136447490;
    uint64_t v31 = "advertising_proxy_resolve_callback";
    __int16 v32 = 1024;
    *(_DWORD *)int v33 = v24;
    *(_WORD *)&v33[4] = 2048;
    *(void *)&v33[6] = a10;
    *(_WORD *)&v33[14] = 2080;
    *(void *)&v33[16] = "instance";
    *(_WORD *)&v33[24] = 2080;
    *(void *)&v33[26] = "adv-resolve.c";
    __int16 v34 = 1024;
    int v35 = 529;
    int v28 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_35;
  }
  if (v26)
  {
    *(_DWORD *)buf = 136447490;
    uint64_t v31 = "advertising_proxy_resolve_callback";
    __int16 v32 = 1024;
    *(_DWORD *)int v33 = v24;
    *(_WORD *)&v33[4] = 2048;
    *(void *)&v33[6] = a10;
    *(_WORD *)&v33[14] = 2080;
    *(void *)&v33[16] = "instance";
    *(_WORD *)&v33[24] = 2080;
    *(void *)&v33[26] = "adv-resolve.c";
    __int16 v34 = 1024;
    int v35 = 529;
    _os_log_impl(&dword_20D928000, v25, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    int v24 = *(_DWORD *)a10;
  }
  *(_DWORD *)a10 = v24 - 1;
  if (v24 == 1)
  {
    __int16 v27 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      uint64_t v31 = "advertising_proxy_resolve_callback";
      __int16 v32 = 2048;
      *(void *)int v33 = a10;
      *(_WORD *)&v33[8] = 2080;
      *(void *)&v33[10] = "instance";
      *(_WORD *)&v33[18] = 2080;
      *(void *)&v33[20] = "adv-resolve.c";
      *(_WORD *)&v33[28] = 1024;
      *(_DWORD *)&v33[30] = 529;
      _os_log_impl(&dword_20D928000, v27, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
    }
    ++adv_instance_state_finalized;
    adv_instance_state_finalize(a10);
  }
}

uint64_t advertising_proxy_get_addresses()
{
  return 0;
}

uint64_t mdns_xpc_string_replace_if_different(xpc_object_t *a1, xpc_object_t object)
{
  uint64_t result = (uint64_t)*a1;
  if ((xpc_object_t)result != object)
  {
    if (result)
    {
      uint64_t result = xpc_equal((xpc_object_t)result, object);
      if (result) {
        return result;
      }
      if (*a1)
      {
        xpc_release(*a1);
        *a1 = 0;
      }
    }
    uint64_t result = (uint64_t)xpc_retain(object);
    *a1 = (xpc_object_t)result;
  }
  return result;
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x270ED7BB0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, regtype, domain, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x270ED7C10](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x270ED7C18](service, queue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x270ED80E0]();
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x270EDAA50](object);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}