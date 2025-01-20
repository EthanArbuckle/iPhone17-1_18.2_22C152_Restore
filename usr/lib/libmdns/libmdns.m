BOOL _mdns_address_equal(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a1 + 25);
  if (v2 != *(unsigned __int8 *)(a2 + 25)) {
    return 0;
  }
  if (v2 == 30) {
    return *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
  }
        && *(void *)(a1 + 32) == *(void *)(a2 + 32)
        && *(void *)(a1 + 40) == *(void *)(a2 + 40);
  return v2 == 2
      && *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
      && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28);
}

void *_mdns_address_copy_description(void *a1, int a2, char a3)
{
  v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || mdns_string_builder_append_sockaddr_description(v7, (uint64_t)(a1 + 3), a3))
  {
    v8 = 0;
  }
  else
  {
    v8 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v8;
}

uint64_t mdns_address_create_ipv4(unsigned int a1, unsigned int a2)
{
  uint64_t result = _mdns_address_new();
  if (result)
  {
    *(_WORD *)(result + 24) = 528;
    *(_WORD *)(result + 26) = __rev16(a2);
    *(_DWORD *)(result + 28) = bswap32(a1);
  }
  return result;
}

uint64_t _mdns_address_new()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    v2 = &_mdns_address_kind;
    *(void *)(v0 + 16) = &_mdns_address_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

__n128 mdns_address_create_ipv6(__n128 *a1, unsigned int a2, int a3)
{
  uint64_t v6 = _mdns_address_new();
  if (v6)
  {
    *(_WORD *)(v6 + 24) = 7708;
    *(_WORD *)(v6 + 26) = __rev16(a2);
    __n128 result = *a1;
    *(__n128 *)(v6 + 32) = *a1;
    *(_DWORD *)(v6 + 48) = a3;
  }
  return result;
}

uint64_t mdns_address_create_from_ip_address_string(char *a1)
{
  uint64_t v1 = a1;
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v19 = 0;
  int v2 = *a1;
  if (v2 == 91)
  {
    v3 = a1 + 1;
    uint64_t result = (uint64_t)strchr(a1 + 1, 93);
    if (!result) {
      return result;
    }
    uint64_t v5 = result;
    if (_mdns_address_parse_ipv6(v3, (unsigned __int8 *)result, &v21, &v19)) {
      return 0;
    }
    unsigned int v6 = *(unsigned __int8 *)(v5 + 1);
    if (v6 == 58)
    {
      v7 = (unsigned __int8 *)(v5 + 2);
      goto LABEL_15;
    }
    if (*(unsigned char *)(v5 + 1)) {
      return 0;
    }
LABEL_24:
    int v14 = v19;
    uint64_t result = _mdns_address_new();
    if (result)
    {
      *(_WORD *)(result + 24) = 7708;
      *(_WORD *)(result + 26) = bswap32(v6) >> 16;
      *(_OWORD *)(result + 32) = v21;
      *(_DWORD *)(result + 48) = v14;
    }
    return result;
  }
  if (!_mdns_address_parse_ipv6(a1, 0, &v21, &v19))
  {
    unsigned int v6 = 0;
    goto LABEL_24;
  }
  v8 = strchr(v1, 58);
  if (v8)
  {
    v9 = v8;
    int64_t v10 = v8 - v1;
    if ((unint64_t)(v8 - v1) > 0x7F) {
      return 0;
    }
    __memcpy_chk();
    v20[v10] = 0;
    v7 = (unsigned __int8 *)(v9 + 1);
    uint64_t v1 = v20;
  }
  else
  {
    v7 = 0;
  }
  if (inet_pton(2, v1, &v21) != 1) {
    return 0;
  }
LABEL_15:
  if (v7)
  {
    int v11 = *v7;
    if ((v11 - 48) <= 9)
    {
      unsigned int v6 = 0;
      v12 = v7 + 1;
      while (1)
      {
        unsigned int v6 = 10 * v6 + (char)v11 - 48;
        if (HIWORD(v6)) {
          break;
        }
        int v13 = *v12++;
        int v11 = v13;
        if ((v13 - 48) >= 0xA)
        {
          if (!v11) {
            goto LABEL_23;
          }
          return 0;
        }
      }
    }
    return 0;
  }
  unsigned int v6 = 0;
LABEL_23:
  if (v2 == 91) {
    goto LABEL_24;
  }
  int v15 = v21;
  int v16 = BYTE1(v21);
  int v17 = BYTE2(v21);
  int v18 = BYTE3(v21);
  uint64_t result = _mdns_address_new();
  if (result)
  {
    *(_WORD *)(result + 24) = 528;
    *(_WORD *)(result + 26) = bswap32(v6) >> 16;
    *(_DWORD *)(result + 28) = bswap32((v15 << 24) | (v16 << 16) | (v17 << 8) | v18);
  }
  return result;
}

uint64_t _mdns_address_parse_ipv6(unsigned char *a1, unsigned __int8 *a2, _OWORD *a3, _DWORD *a4)
{
  unsigned int v6 = a2;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    unsigned int v6 = a1 - 1;
    while (*++v6)
      ;
  }
  uint64_t v8 = v6 - a1;
  if (v6 <= a1)
  {
LABEL_8:
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = (unint64_t)a1;
    while (*(unsigned char *)v9 != 37)
    {
      ++v9;
      if (!--v8) {
        goto LABEL_8;
      }
    }
  }
  if (v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = (unint64_t)v6;
  }
  unint64_t v11 = v10 - (void)a1;
  if (v10 - (unint64_t)a1 > 0x7F) {
    return 4294960554;
  }
  __memcpy_chk();
  v22[v11] = 0;
  if (inet_pton(30, v22, &v21) != 1) {
    return 4294960554;
  }
  if (v9)
  {
    v12 = (unsigned __int8 *)(v9 + 1);
    unint64_t v13 = (unint64_t)&v6[-v9 - 1];
    if (v13 >= 0x11)
    {
      if (v13 == -1 || (int v14 = (char *)malloc_type_malloc((size_t)&v6[-v9], 0xA172743EuLL), (p_dst = v14) == 0)) {
        __break(1u);
      }
    }
    else
    {
      int v14 = 0;
      p_dst = &__dst;
    }
    memcpy(p_dst, (const void *)(v9 + 1), (size_t)&v6[-v9 - 1]);
    p_dst[v13] = 0;
    LODWORD(v13) = if_nametoindex(p_dst);
    if (v14) {
      free(v14);
    }
    if (!v13)
    {
      if (v12 >= v6) {
        return 4294960554;
      }
      unint64_t v13 = 0;
      int v17 = &v6[~v9];
      int v18 = (unsigned __int8 *)(v9 + 1);
      while (1)
      {
        int v19 = *v18;
        if ((v19 - 48) > 9) {
          break;
        }
        unint64_t v13 = ((char)v19 - 48) + 10 * v13;
        if (HIDWORD(v13)) {
          return 4294960554;
        }
        ++v18;
        if (!--v17)
        {
          int v18 = v6;
          break;
        }
      }
      if (v18 != v6 || v18 == v12) {
        return 4294960554;
      }
    }
  }
  else
  {
    LODWORD(v13) = 0;
  }
  if (a3) {
    *a3 = v21;
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t mdns_address_get_sockaddr(uint64_t a1)
{
  return a1 + 24;
}

uint64_t mdns_address_get_port(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 25);
  if (v1 == 30 || v1 == 2) {
    return bswap32(*(unsigned __int16 *)(a1 + 26)) >> 16;
  }
  else {
    return 0;
  }
}

uint64_t mdns_bpf_open(int a1, int *a2)
{
  int v4 = 0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  while (1)
  {
    snprintf(__str, 0x20uLL, "/dev/bpf%d", v4);
    uint64_t v5 = open(__str, a1);
    if ((v5 & 0x80000000) == 0)
    {
      int v6 = 0;
      if (!a2) {
        return v5;
      }
      goto LABEL_17;
    }
    if (!*__error())
    {
      int v6 = -6700;
      goto LABEL_13;
    }
    int v6 = *__error();
    if (v6 != 16) {
      break;
    }
    if (++v4 == 100)
    {
      int v6 = 16;
      if (!a2) {
        return v5;
      }
      goto LABEL_17;
    }
  }
  if (!v6) {
    goto LABEL_16;
  }
LABEL_13:
  if (_mdns_bpf_log_s_once != -1) {
    dispatch_once(&_mdns_bpf_log_s_once, &__block_literal_global);
  }
  v7 = _mdns_bpf_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mdns_bpf_log_s_log, OS_LOG_TYPE_ERROR))
  {
LABEL_16:
    if (!a2) {
      return v5;
    }
    goto LABEL_17;
  }
  *(_DWORD *)buf = 136446466;
  unint64_t v10 = __str;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_23814D000, v7, OS_LOG_TYPE_ERROR, "Failed to open %{public}s: %{mdns:err}ld", buf, 0x16u);
  if (a2) {
LABEL_17:
  }
    *a2 = v6;
  return v5;
}

os_log_t ___mdns_bpf_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "bpf");
  _mdns_bpf_log_s_log = (uint64_t)result;
  return result;
}

uint64_t mdns_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16) && (int v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32)) != 0) {
    return v4(a1, a2);
  }
  else {
    return 0;
  }
}

const char *mdns_cf_callback_copy_description(uint64_t a1)
{
  return _mdns_obj_copy_description_as_cfstring(a1);
}

void mdns_cf_callback_release(int a1, void *object)
{
}

void *mdns_cf_callback_retain(int a1, void *object)
{
  return object;
}

BOOL mdns_cfarray_enumerate(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    CFIndex v5 = Count;
    BOOL v6 = 0;
    for (i = 0; i != v5; BOOL v6 = i >= v5)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      if (((*(uint64_t (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex) & 1) == 0) {
        break;
      }
      ++i;
    }
  }
  return v6;
}

BOOL mdns_cfset_enumerate(const __CFSet *a1, uint64_t a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  CFIndex Count = CFSetGetCount(a1);
  if (Count < 1) {
    return 1;
  }
  CFIndex v5 = Count;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
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
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)values = 0u;
  long long v12 = 0u;
  if ((unint64_t)Count <= 0x40)
  {
    BOOL v6 = values;
    CFSetGetValues(a1, (const void **)values);
    while (((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, *v6) & 1) != 0)
    {
      ++v6;
      if (!--v5) {
        return 1;
      }
    }
    return 0;
  }
  uint64_t v8 = a2;
  char v9 = 1;
  memset(v10, 0, sizeof(v10));
  CFSetApplyFunction(a1, (CFSetApplierFunction)_mdns_cf_applier_function, &v8);
  return v9 != 0;
}

void _mdns_cf_applier_function(uint64_t a1, unsigned char *a2)
{
  if (a2[8]) {
    a2[8] = (*(uint64_t (**)(void))(*(void *)a2 + 16))();
  }
}

os_log_t ___mhc_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mDNSResponder", "helper_client");
  _mhc_log_s_log = (uint64_t)result;
  return result;
}

dispatch_queue_t ___mhc_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mhc", 0);
  _mhc_queue_s_queue = (uint64_t)result;
  return result;
}

void ___mhc_create_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (MEMORY[0x23EC89A00](a2) == MEMORY[0x263EF8720])
  {
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_5);
    }
    int v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2082;
      long long v12 = string;
      BOOL v6 = "Connection received error event -- connnection: %{public}@, error: %{public}s";
      goto LABEL_11;
    }
  }
  else
  {
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_5);
    }
    int v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      long long v12 = (const char *)a2;
      BOOL v6 = "Connection received unexpected event -- connection: %{public}@, event: %@";
LABEL_11:
      _os_log_debug_impl(&dword_23814D000, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, 0x16u);
    }
  }
}

uint64_t _mhc_set_ip_forwarding(BOOL a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  uint64_t v5 = v4;
  if (a2) {
    BOOL v6 = "set_ipv6_forwarding";
  }
  else {
    BOOL v6 = "set_ipv4_forwarding";
  }
  xpc_dictionary_set_string(v4, "command", v6);
  xpc_dictionary_set_BOOL(v5, "enable", a1);
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2000000000;
  int v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  long long v12 = ___mhc_set_ip_forwarding_block_invoke;
  uint64_t v13 = &unk_264D05650;
  long long v14 = &v16;
  char v15 = a2;
  if (_mhc_queue_s_once != -1) {
    dispatch_once(&_mhc_queue_s_once, &__block_literal_global_14);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.mDNSResponder_Helper", (dispatch_queue_t)_mhc_queue_s_queue, 2uLL);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___mhc_create_connection_block_invoke;
  handler[3] = &__block_descriptor_tmp_11;
  handler[4] = mach_service;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_activate(mach_service);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
  v12((uint64_t)v11, v8);
  if (mach_service)
  {
    xpc_connection_cancel(mach_service);
    xpc_release(mach_service);
  }
  if (v8) {
    xpc_release(v8);
  }
  if (v5) {
    xpc_release(v5);
  }
  uint64_t v9 = *((unsigned int *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void ___mhc_set_ip_forwarding_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  xpc_object_t value = xpc_dictionary_get_value(xdict, "error");
  if (value && (xpc_object_t v4 = value, MEMORY[0x23EC89A00]() == MEMORY[0x263EF8738]))
  {
    int64_t v7 = xpc_int64_get_value(v4);
    int v5 = v7;
    BOOL v6 = v7 != v7;
    if ((int)v7 != v7) {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
    BOOL v6 = 1;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(_DWORD *)(v8 + 24)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v6;
  }
  if (!v9) {
    *(_DWORD *)(v8 + 24) = -6712;
  }
  if (_mhc_log_s_once != -1) {
    dispatch_once(&_mhc_log_s_once, &__block_literal_global_5);
  }
  uint64_t v10 = _mhc_log_s_log;
  uint64_t v11 = *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v11) {
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled((os_log_t)_mhc_log_s_log, v12))
  {
    if (*(unsigned char *)(a1 + 40)) {
      int v13 = 6;
    }
    else {
      int v13 = 4;
    }
    v14[0] = 67109376;
    v14[1] = v13;
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    _os_log_impl(&dword_23814D000, v10, v12, "Set IPv%d forwarding -- error: %{mdns:err}ld", (uint8_t *)v14, 0x12u);
  }
}

void _mdns_client_finalize(void *a1)
{
  v3 = a1 + 4;
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v4 = a1[5];
    if (v4)
    {
      int v5 = a1[3];
      if (v5)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 0x40000000;
        v7[2] = ___mdns_client_finalize_block_invoke;
        v7[3] = &__block_descriptor_tmp_3_18;
        v7[4] = v4;
        v7[5] = v2;
        dispatch_async(v5, v7);
      }
    }
  }
  void *v3 = 0;
  v3[1] = 0;
  BOOL v6 = a1[3];
  if (v6)
  {
    dispatch_release(v6);
    a1[3] = 0;
  }
}

uint64_t ___mdns_client_finalize_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

void mdns_client_set_queue(uint64_t a1, dispatch_object_t object)
{
  if (!*(unsigned char *)(a1 + 49))
  {
    if (object) {
      dispatch_retain(object);
    }
    uint64_t v4 = *(NSObject **)(a1 + 24);
    if (v4) {
      dispatch_release(v4);
    }
    *(void *)(a1 + 24) = object;
  }
}

void mdns_client_activate(uint64_t a1)
{
  *(unsigned char *)(a1 + 49) = 1;
  uint64_t v2 = os_retain((void *)a1);
  v3 = (*(uint64_t (**)(void *))(*(void *)(a1 + 16) + 48))(v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_client_activate_block_invoke;
  block[3] = &__block_descriptor_tmp_20;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __mdns_client_activate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(v1 + 16) + 64);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v2)
    {
      v2(*(void *)(a1 + 32));
      uint64_t v3 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v1 + 48) = 1;
    uint64_t v1 = v3;
  }

  os_release((void *)v1);
}

void mdns_client_invalidate(uint64_t a1)
{
  *(unsigned char *)(a1 + 49) = 1;
  uint64_t v2 = os_retain((void *)a1);
  uint64_t v3 = (*(uint64_t (**)(void *))(*(void *)(a1 + 16) + 48))(v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_client_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __mdns_client_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48) != 2)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(v1 + 16) + 72);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v2)
    {
      v2(*(void *)(a1 + 32));
      uint64_t v3 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v1 + 48) = 2;
    uint64_t v1 = v3;
  }

  os_release((void *)v1);
}

BOOL mdns_odoh_config_is_valid_inner(unsigned __int16 *a1, unint64_t a2)
{
  *(void *)&v18[5] = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2 > 0xB)
    {
      int v10 = *a1;
      if (v10 == 256 || v10 == 1791)
      {
        uint64_t v11 = bswap32(a1[1]) >> 16;
        if (v11 + 4 > a2)
        {
          if (_mdns_crypto_log_s_once != -1) {
            dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
          }
          uint64_t v12 = _mdns_crypto_log_s_log;
          BOOL result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
          if (result)
          {
            int v17 = 67109120;
            v18[0] = v11;
            int v5 = "Config length field is too large: %hu";
            BOOL v6 = v12;
            uint32_t v7 = 8;
            goto LABEL_31;
          }
          return result;
        }
        if ((bswap32(a1[5]) >> 16) + 8 != v11)
        {
          if (_mdns_crypto_log_s_once != -1) {
            dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
          }
          uint64_t v15 = _mdns_crypto_log_s_log;
          BOOL result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
          if (result)
          {
            uint64_t v16 = (bswap32(a1[5]) >> 16) + 8;
            int v17 = 67109376;
            v18[0] = v11;
            LOWORD(v18[1]) = 2048;
            *(void *)((char *)&v18[1] + 2) = v16;
            int v5 = "Config length does not match: %hu != %zu";
            BOOL v6 = v15;
            uint32_t v7 = 18;
            goto LABEL_31;
          }
          return result;
        }
        if (a1[2] == 0x2000 && a1[3] == 256 && a1[4] == 256) {
          return 1;
        }
        if (_mdns_crypto_log_s_once != -1) {
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
        }
        int v13 = _mdns_crypto_log_s_log;
        BOOL result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_INFO);
        if (!result) {
          return result;
        }
        LOWORD(v17) = 0;
        long long v14 = "Config details are not supported";
      }
      else
      {
        if (_mdns_crypto_log_s_once != -1) {
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
        }
        int v13 = _mdns_crypto_log_s_log;
        BOOL result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_INFO);
        if (!result) {
          return result;
        }
        LOWORD(v17) = 0;
        long long v14 = "Config version is not supported";
      }
      _os_log_impl(&dword_23814D000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 2u);
      return 0;
    }
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    uint64_t v3 = _mdns_crypto_log_s_log;
    BOOL result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      int v17 = 134217984;
      *(void *)uint64_t v18 = a2;
      int v5 = "Config length is too short: %zu";
      BOOL v6 = v3;
      uint32_t v7 = 12;
LABEL_31:
      _os_log_error_impl(&dword_23814D000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v17, v7);
      return 0;
    }
  }
  else
  {
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    uint64_t v8 = _mdns_crypto_log_s_log;
    BOOL result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      LOWORD(v17) = 0;
      int v5 = "Config is NULL";
      BOOL v6 = v8;
      uint32_t v7 = 2;
      goto LABEL_31;
    }
  }
  return result;
}

uint64_t __mdns_encrypt_oblivious_request_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  return 1;
}

os_log_t ___mdns_crypto_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "crypto");
  _mdns_crypto_log_s_log = (uint64_t)result;
  return result;
}

dispatch_data_t mdns_decrypt_oblivious_response(NSObject *a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (!a2 || !a3 || !a4)
  {
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    long long v23 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    long long v24 = "Parameters are invalid";
    goto LABEL_21;
  }
  cchpke_params_x25519_AESGCM128_HKDF_SHA256();
  size_t v8 = cchpke_params_sizeof_kdf_hash();
  uint64_t v9 = cchpke_params_sizeof_aead_tag();
  uint64_t v10 = cchpke_params_sizeof_aead_key();
  unint64_t v11 = dispatch_data_get_size(a1);
  if (v11 <= v9 + 5)
  {
    if (_mdns_crypto_log_s_once == -1) {
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v12 = v11;
    int v13 = malloc_type_calloc(1uLL, v11, 0xF1748037uLL);
    if (v13)
    {
      long long v14 = v13;
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 0x40000000;
      applier[2] = __mdns_decrypt_oblivious_response_block_invoke;
      applier[3] = &__block_descriptor_tmp_3_36;
      applier[4] = v13;
      dispatch_data_apply(a1, applier);
      if (*v14 != 2)
      {
        if (_mdns_crypto_log_s_once != -1) {
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
        }
        long long v25 = _mdns_crypto_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
        {
          int v36 = *v14;
          *(_DWORD *)buf = 67109120;
          LODWORD(v64) = v36;
          _os_log_error_impl(&dword_23814D000, v25, OS_LOG_TYPE_ERROR, "Invalid message type %u", buf, 8u);
        }
        free(v14);
        return 0;
      }
      size_t size = v10;
      unsigned int v15 = *(unsigned __int16 *)(v14 + 1);
      size_t v16 = __rev16(v15);
      if (v12 <= v16 + 5 + v9)
      {
        if (_mdns_crypto_log_s_once != -1) {
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
        }
        uint64_t v28 = _mdns_crypto_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v64) = v16;
        long long v20 = "Invalid response nonce length %hu";
        long long v21 = v28;
        uint32_t v22 = 8;
LABEL_33:
        _os_log_error_impl(&dword_23814D000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
LABEL_73:
        dispatch_data_t v26 = 0;
LABEL_74:
        free(v14);
        return v26;
      }
      v60 = v14;
      uint64_t v17 = bswap32(*(unsigned __int16 *)&v14[v16 + 3]) >> 16;
      if (v12 != v16 + 5 + v17)
      {
        if (_mdns_crypto_log_s_once != -1) {
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
        }
        long long v29 = _mdns_crypto_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218752;
          unint64_t v64 = v12;
          __int16 v65 = 2048;
          uint64_t v66 = v16 + 3;
          __int16 v67 = 2048;
          *(void *)v68 = 2;
          *(_WORD *)&v68[8] = 2048;
          *(void *)&v68[10] = v17;
          _os_log_error_impl(&dword_23814D000, v29, OS_LOG_TYPE_ERROR, "Invalid ciphertext length: %zu != %zu + %zu + %zu", buf, 0x2Au);
        }
        dispatch_data_t v26 = 0;
        long long v14 = v60;
        goto LABEL_74;
      }
      unint64_t v18 = v17 - v9;
      if ((unint64_t)(v17 - v9) <= 3)
      {
        if (_mdns_crypto_log_s_once != -1) {
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
        }
        long long v14 = v60;
        uint64_t v19 = _mdns_crypto_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        *(_DWORD *)buf = 134217984;
        unint64_t v64 = v18;
        long long v20 = "Invalid plaintext length: %zu";
        long long v21 = v19;
        uint32_t v22 = 12;
        goto LABEL_33;
      }
      ccsha256_di();
      if (a5 + v16 != -2)
      {
        size_t v59 = v17 - v9;
        long long v30 = (char *)malloc_type_calloc(1uLL, a5 + v16 + 2, 0xF1748037uLL);
        long long v14 = v60;
        if (v30)
        {
          long long v31 = v30;
          memcpy(v30, a4, a5);
          *(_WORD *)&v31[a5] = v15;
          memcpy(&v31[a5 + 2], v60 + 3, v16);
          if (size)
          {
            long long v32 = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
            if (v32)
            {
              long long v33 = v32;
              if (cchpke_initiator_export())
              {
                if (_mdns_crypto_log_s_once != -1) {
                  dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
                }
                long long v34 = _mdns_crypto_log_s_log;
                if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_23814D000, v34, OS_LOG_TYPE_ERROR, "cchpke_initiator_export failed", buf, 2u);
                }
                free(v33);
                long long v35 = v31;
LABEL_72:
                free(v35);
                goto LABEL_73;
              }
              if (v8)
              {
                long long v37 = malloc_type_calloc(1uLL, v8, 0xF1748037uLL);
                if (v37)
                {
                  int v38 = cchkdf_extract();
                  free(v33);
                  free(v31);
                  if (v38)
                  {
                    if (_mdns_crypto_log_s_once != -1) {
                      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
                    }
                    long long v39 = _mdns_crypto_log_s_log;
                    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109120;
                      LODWORD(v64) = v38;
                      _os_log_error_impl(&dword_23814D000, v39, OS_LOG_TYPE_ERROR, "Secret extract error: %d", buf, 8u);
                    }
                    long long v35 = v37;
                    goto LABEL_72;
                  }
                  long long v40 = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
                  if (v40)
                  {
                    long long v41 = v40;
                    int v42 = cchkdf_expand();
                    if (v42)
                    {
                      int v43 = v42;
                      if (_mdns_crypto_log_s_once != -1) {
                        dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
                      }
                      v44 = _mdns_crypto_log_s_log;
                      if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109120;
                        LODWORD(v64) = v43;
                        _os_log_error_impl(&dword_23814D000, v44, OS_LOG_TYPE_ERROR, "Secret key expand error: %d", buf, 8u);
                      }
                      free(v37);
                      long long v35 = v41;
                      goto LABEL_72;
                    }
                    size_t v45 = cchpke_params_sizeof_aead_nonce();
                    if (v45)
                    {
                      v46 = malloc_type_calloc(1uLL, v45, 0xF1748037uLL);
                      if (v46)
                      {
                        v47 = v46;
                        int v48 = cchkdf_expand();
                        free(v37);
                        if (v48)
                        {
                          if (_mdns_crypto_log_s_once != -1) {
                            dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
                          }
                          v49 = _mdns_crypto_log_s_log;
                          if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 67109120;
                            LODWORD(v64) = v48;
                            _os_log_error_impl(&dword_23814D000, v49, OS_LOG_TYPE_ERROR, "Secret nonce expand error: %d", buf, 8u);
                          }
                          free(v41);
                          long long v35 = v47;
                          goto LABEL_72;
                        }
                        v50 = (unsigned __int16 *)malloc_type_calloc(1uLL, v59, 0xF1748037uLL);
                        if (v50)
                        {
                          v51 = v50;
                          ccaes_gcm_decrypt_mode();
                          int v52 = ccgcm_one_shot();
                          free(v41);
                          free(v47);
                          free(v60);
                          if (v52)
                          {
                            if (_mdns_crypto_log_s_once != -1) {
                              dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
                            }
                            uint64_t v53 = _mdns_crypto_log_s_log;
                            if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_89;
                            }
                            *(_WORD *)buf = 0;
                            v54 = "Decrypt error: decrypt_error";
                            v55 = v53;
                            uint32_t v56 = 2;
                          }
                          else
                          {
                            size_t v57 = bswap32(*v51) >> 16;
                            if (v59 >= v57 + 4)
                            {
                              dispatch_data_t v26 = dispatch_data_create(v51 + 1, v57, 0, 0);
                              goto LABEL_90;
                            }
                            if (_mdns_crypto_log_s_once != -1) {
                              dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
                            }
                            uint64_t v58 = _mdns_crypto_log_s_log;
                            if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
                            {
LABEL_89:
                              dispatch_data_t v26 = 0;
LABEL_90:
                              long long v14 = v51;
                              goto LABEL_74;
                            }
                            *(_DWORD *)buf = 134218752;
                            unint64_t v64 = v59;
                            __int16 v65 = 2048;
                            uint64_t v66 = 2;
                            __int16 v67 = 1024;
                            *(_DWORD *)v68 = v57;
                            *(_WORD *)&v68[4] = 2048;
                            *(void *)&v68[6] = 2;
                            v54 = "Invalid plaintext length: %zu < %zu + %hu + %zu";
                            v55 = v58;
                            uint32_t v56 = 38;
                          }
                          _os_log_error_impl(&dword_23814D000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
                          goto LABEL_89;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
  }
  dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
LABEL_19:
  long long v23 = _mdns_crypto_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    long long v24 = "Invalid encrypted response length";
LABEL_21:
    _os_log_error_impl(&dword_23814D000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
  }
  return 0;
}

uint64_t __mdns_decrypt_oblivious_response_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  return 1;
}

NSObject *mdns_dispatch_create_oneshot_monotonic_timer(unsigned int a1, unsigned int a2, dispatch_queue_t queue)
{
  int v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
  if (v5)
  {
    if (a2 >= 0x64) {
      int v6 = 100;
    }
    else {
      int v6 = a2;
    }
    uint64_t v7 = (10000 * v6) * (unint64_t)a1;
    dispatch_time_t v8 = dispatch_time(0x8000000000000000, 1000000 * a1);
    dispatch_source_set_timer(v5, v8, 0xFFFFFFFFFFFFFFFFLL, v7);
  }
  return v5;
}

void _mdns_dns_configurator_finalize(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 32) = 0;
  }
}

__CFString *_mdns_dns_configurator_copy_description(uint64_t a1, int a2, char a3)
{
  if (a3)
  {
    long long v27 = 0;
    asprintf(&v27, "<%s: %p>", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1);
    return (__CFString *)v27;
  }
  else
  {
    os_log_t result = CFStringCreateMutable(0, 0);
    if (result)
    {
      int v6 = result;
      if (a2) {
        CFStringAppendFormat(result, 0, @"<%s: %p>: ", *(void *)(*(void *)(a1 + 16) + 8), a1);
      }
      CFStringAppendFormat(v6, 0, @"id: %@", *(void *)(a1 + 32));
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCC8]);
      if (Value) {
        CFStringAppendFormat(v6, 0, @", interface: %@", Value);
      }
      CFArrayRef v8 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCF0]);
      if (v8)
      {
        CFArrayRef v9 = v8;
        CFStringAppend(v6, @", server addresses: {");
        CFIndex Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          CFIndex v11 = Count;
          CFIndex v12 = 0;
          int v13 = &stru_26EB175B8;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v9, v12);
            CFStringAppendFormat(v6, 0, @"%@%@", v13, ValueAtIndex);
            ++v12;
            int v13 = @", ";
          }
          while (v11 != v12);
        }
        CFStringAppend(v6, @"}");
      }
      unsigned int v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCF8]);
      if (v15) {
        CFStringAppendFormat(v6, 0, @", port: %@", v15);
      }
      CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BD00]);
      if (v16)
      {
        CFArrayRef v17 = v16;
        CFStringAppend(v6, @", domains: {");
        CFIndex v18 = CFArrayGetCount(v17);
        CFArrayRef v19 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BD08]);
        CFArrayRef theArray = v19;
        if (v19) {
          CFIndex v20 = CFArrayGetCount(v19);
        }
        else {
          CFIndex v20 = 0;
        }
        if (v18 >= 1)
        {
          CFIndex v21 = 0;
          uint32_t v22 = &stru_26EB175B8;
          do
          {
            long long v23 = CFArrayGetValueAtIndex(v17, v21);
            long long v24 = @"<MISSING ORDER>";
            if (v21 < v20) {
              long long v24 = (__CFString *)CFArrayGetValueAtIndex(theArray, v21);
            }
            CFStringAppendFormat(v6, 0, @"%@%@ (%@)", v22, v23, v24);
            ++v21;
            uint32_t v22 = @", ";
          }
          while (v18 != v21);
        }
        CFStringAppend(v6, @"}");
      }
      long long v25 = mdns_cfstring_to_utf8_cstring(v6);
      CFRelease(v6);
      return (__CFString *)v25;
    }
  }
  return result;
}

void *mdns_dns_configurator_create(char *cStr, _DWORD *a2)
{
  int v7 = 0;
  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v3)
  {
    int v5 = 0;
    int v7 = -6700;
    if (!a2) {
      return v5;
    }
    goto LABEL_3;
  }
  CFStringRef v4 = v3;
  int v5 = mdns_dns_configurator_create_with_cfstring_id(v3, &v7);
  CFRelease(v4);
  if (a2) {
LABEL_3:
  }
    *a2 = v7;
  return v5;
}

void *mdns_dns_configurator_create_with_cfstring_id(const void *a1, int *a2)
{
  uint64_t v4 = _os_object_alloc();
  int v5 = (void *)v4;
  if (v4)
  {
    int v6 = &_mdns_dns_configurator_kind;
    *(void *)(v4 + 16) = &_mdns_dns_configurator_kind;
    do
    {
      int v7 = (void (*)(void *))v6[2];
      if (v7) {
        v7(v5);
      }
      int v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v5[3] = Mutable;
    if (Mutable)
    {
      v5[4] = a1;
      CFRetain(a1);
      int v9 = 0;
      uint64_t v10 = v5;
      int v5 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      int v9 = -6729;
    }
  }
  else
  {
    uint64_t v10 = 0;
    int v9 = -6728;
  }
  if (a2) {
    *a2 = v9;
  }
  if (v5) {
    os_release(v5);
  }
  return v10;
}

uint64_t mdns_dns_configurator_set_interface(uint64_t a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v3) {
    return 4294960596;
  }
  CFStringRef v4 = v3;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCC8], v3);
  CFRelease(v4);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCD8], *(const void **)(a1 + 32));
  return 0;
}

uint64_t mdns_dns_configurator_add_ipv4_server_address(uint64_t a1, unsigned int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned int v7 = bswap32(a2);
  CFStringRef v3 = inet_ntop(2, &v7, v8, 0x10u);
  if (v3)
  {
    CFStringRef v4 = v3;
    uint64_t v5 = a1;
    return mdns_dns_configurator_add_server_address_string(v5, v4);
  }
  if (!*__error()) {
    return 4294960596;
  }
  uint64_t result = *__error();
  if (!result)
  {
    uint64_t v5 = a1;
    CFStringRef v4 = 0;
    return mdns_dns_configurator_add_server_address_string(v5, v4);
  }
  return result;
}

uint64_t mdns_dns_configurator_add_server_address_string(uint64_t a1, const char *a2)
{
  CFStringRef v4 = (const void *)*MEMORY[0x263F1BCF0];
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCF0]);
  if (!Value)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (!Mutable) {
      return 4294960567;
    }
    Value = Mutable;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v4, Mutable);
    CFRelease(Value);
  }
  CFStringRef v7 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v7) {
    return 4294960596;
  }
  CFStringRef v8 = v7;
  CFArrayAppendValue((CFMutableArrayRef)Value, v7);
  CFRelease(v8);
  return 0;
}

uint64_t mdns_dns_configurator_add_ipv6_server_address(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = inet_ntop(30, a2, __s, 0x40u);
  if (v5) {
    goto LABEL_4;
  }
  if (!*__error()) {
    return 4294960596;
  }
  uint64_t result = *__error();
  if (!result)
  {
LABEL_4:
    if (a3)
    {
      size_t v7 = strlen(__s);
      CFStringRef v8 = &__s[v7];
      size_t v9 = 64 - v7;
      if (if_indextoname(a3, v10)) {
        snprintf(v8, v9, "%%%s");
      }
      else {
        snprintf(v8, v9, "%%%u");
      }
    }
    return mdns_dns_configurator_add_server_address_string(a1, v5);
  }
  return result;
}

uint64_t mdns_dns_configurator_add_domain(uint64_t a1, const char *a2, unsigned int a3)
{
  int v6 = (const void *)*MEMORY[0x263F1BD00];
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BD00]);
  if (!Value)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (!Mutable) {
      return 4294960567;
    }
    Value = Mutable;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v6, Mutable);
    CFRelease(Value);
  }
  size_t v9 = (const void *)*MEMORY[0x263F1BD08];
  uint64_t v10 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BD08]);
  if (v10) {
    goto LABEL_7;
  }
  CFMutableArrayRef v11 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v11) {
    return 4294960567;
  }
  uint64_t v10 = v11;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v9, v11);
  CFRelease(v10);
LABEL_7:
  CFStringRef v12 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v12) {
    return 4294960596;
  }
  CFStringRef v13 = v12;
  uint64_t valuePtr = a3;
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFArrayAppendValue((CFMutableArrayRef)Value, v13);
    CFArrayAppendValue((CFMutableArrayRef)v10, v15);
    CFRelease(v13);
    uint64_t v16 = 0;
    CFStringRef v13 = (CFStringRef)v15;
  }
  else
  {
    uint64_t v16 = 4294960567;
  }
  CFRelease(v13);
  return v16;
}

uint64_t mdns_dns_configurator_set_port(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v3) {
    return 4294960567;
  }
  CFNumberRef v4 = v3;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1BCF8], v3);
  CFRelease(v4);
  return 0;
}

uint64_t mdns_dns_configurator_register(uint64_t a1, const __CFString *a2)
{
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(0, a2, 0, 0);
  if (!v3)
  {
    if (!SCError()) {
      return 4294960596;
    }
    uint64_t v4 = SCError();
    if (v4) {
      return v4;
    }
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x263F1BC10], *(CFStringRef *)(a1 + 32), (CFStringRef)*MEMORY[0x263F1BC38]);
  if (!NetworkServiceEntity)
  {
    if (!SCError()) {
      goto LABEL_14;
    }
    uint64_t v6 = SCError();
    if (v6) {
      goto LABEL_12;
    }
  }
  if (SCDynamicStoreSetValue(v3, NetworkServiceEntity, *(CFPropertyListRef *)(a1 + 24)))
  {
    uint64_t v7 = 0;
    if (!v3) {
      goto LABEL_16;
    }
LABEL_15:
    CFRelease(v3);
    goto LABEL_16;
  }
  if (!SCError())
  {
LABEL_14:
    uint64_t v7 = 4294960596;
    if (!v3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v6 = SCError();
LABEL_12:
  uint64_t v7 = v6;
  if (v3) {
    goto LABEL_15;
  }
LABEL_16:
  if (NetworkServiceEntity) {
    CFRelease(NetworkServiceEntity);
  }
  return v7;
}

uint64_t mdns_dns_configurator_deregister(uint64_t a1, const __CFString *a2)
{
  return mdns_dns_configurator_deregister_configuration(*(const __CFString **)(a1 + 32), a2);
}

uint64_t mdns_dns_configurator_deregister_configuration(const __CFString *a1, const __CFString *a2)
{
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(0, a2, 0, 0);
  if (!v3)
  {
    if (!SCError()) {
      return 4294960596;
    }
    uint64_t v4 = SCError();
    if (v4) {
      return v4;
    }
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x263F1BC10], a1, (CFStringRef)*MEMORY[0x263F1BC38]);
  if (!NetworkServiceEntity)
  {
    if (!SCError()) {
      goto LABEL_14;
    }
    uint64_t v6 = SCError();
    if (v6) {
      goto LABEL_12;
    }
  }
  if (SCDynamicStoreRemoveValue(v3, NetworkServiceEntity))
  {
    uint64_t v7 = 0;
    if (!v3) {
      goto LABEL_16;
    }
LABEL_15:
    CFRelease(v3);
    goto LABEL_16;
  }
  if (!SCError())
  {
LABEL_14:
    uint64_t v7 = 4294960596;
    if (!v3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v6 = SCError();
LABEL_12:
  uint64_t v7 = v6;
  if (v3) {
    goto LABEL_15;
  }
LABEL_16:
  if (NetworkServiceEntity) {
    CFRelease(NetworkServiceEntity);
  }
  return v7;
}

void _mdns_push_server_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    os_release(v2);
    a1[6] = 0;
  }
  SCDynamicStoreRef v3 = (const void *)a1[8];
  if (v3)
  {
    CFRelease(v3);
    a1[8] = 0;
  }
  uint64_t v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0;
  }
  uint64_t v5 = (void *)a1[7];
  if (v5)
  {
    free(v5);
    a1[7] = 0;
  }
}

void *_mdns_push_server_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v21 = 0;
  uint32_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  int v24 = 0;
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6)
  {
    CFMutableArrayRef v11 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  if (a2)
  {
    int appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1);
    *((_DWORD *)v22 + 6) = appended;
    if (appended) {
      goto LABEL_13;
    }
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 64)) >= 1)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2000000000;
    v20[3] = "addresses: {";
    CFArrayRef v9 = *(const __CFArray **)(a1 + 64);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 0x40000000;
    v18[2] = ___mdns_push_server_copy_description_block_invoke;
    v18[3] = &unk_264D05780;
    v18[5] = v20;
    v18[6] = v7;
    v18[4] = &v21;
    char v19 = a3;
    mdns_cfarray_enumerate(v9, (uint64_t)v18);
    int v10 = mdns_string_builder_append_formatted(v7, "}");
    *((_DWORD *)v22 + 6) = v10;
    _Block_object_dispose(v20, 8);
    CFMutableArrayRef v11 = 0;
    if (v10) {
      goto LABEL_14;
    }
  }
  if (*(void *)(a1 + 48))
  {
    int v12 = mdns_string_builder_append_formatted(v7, "srv name: ");
    *((_DWORD *)v22 + 6) = v12;
    if (v12) {
      goto LABEL_13;
    }
    int v13 = mdns_string_builder_append_description(v7, *(void *)(a1 + 48), a3);
    *((_DWORD *)v22 + 6) = v13;
    if (v13) {
      goto LABEL_13;
    }
  }
  int v14 = mdns_string_builder_append_formatted(v7, ", ");
  *((_DWORD *)v22 + 6) = v14;
  if (v14) {
    goto LABEL_13;
  }
  CFNumberRef v15 = *(const char **)(a1 + 56);
  if (!v15) {
    CFNumberRef v15 = "";
  }
  int v16 = mdns_string_builder_append_formatted(v7, "interface: %s/%u", v15, *(_DWORD *)(a1 + 96));
  *((_DWORD *)v22 + 6) = v16;
  if (v16) {
LABEL_13:
  }
    CFMutableArrayRef v11 = 0;
  else {
    CFMutableArrayRef v11 = mdns_string_builder_copy_string((uint64_t)v7);
  }
LABEL_14:
  os_release(v7);
LABEL_15:
  _Block_object_dispose(&v21, 8);
  return v11;
}

BOOL ___mdns_push_server_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

dispatch_queue_t ___mdns_push_notifications_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.push-notifications-queue", 0);
  _mdns_push_notifications_queue_s_queue = (uint64_t)result;
  return result;
}

void __mdns_push_server_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3)
  {
    os_retain(*(void **)(v2 + 40));
    if (_mdns_dso_session_queue_s_once != -1) {
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __mdns_dso_session_invalidate_block_invoke;
    block[3] = &__block_descriptor_tmp_7_671;
    block[4] = v3;
    dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
    os_release(*(void **)(*(void *)(a1 + 32) + 40));
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(void *)(v2 + 88);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(v2 + 80);
    if (v5)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 0x40000000;
      v6[2] = __mdns_push_server_invalidate_block_invoke_2;
      v6[3] = &unk_264D05738;
      v6[4] = v4;
      dispatch_async(v5, v6);
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(v2 + 80))
  {
    dispatch_release(*(dispatch_object_t *)(v2 + 80));
    *(void *)(*(void *)(a1 + 32) + 80) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 88))
  {
    _Block_release(*(const void **)(v2 + 88));
    uint64_t v2 = *(void *)(a1 + 32);
    *(void *)(v2 + 88) = 0;
  }
  os_release((void *)v2);
}

uint64_t __mdns_push_server_invalidate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void _mdns_dns_push_service_definition_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2)
  {
    os_release(v2);
    a1[3] = 0;
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    os_release(v3);
    a1[4] = 0;
  }
  uint64_t v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
  uint64_t v5 = (const void *)a1[6];
  if (v5)
  {
    CFRelease(v5);
    a1[6] = 0;
  }
  uint64_t v6 = (const void *)a1[7];
  if (v6)
  {
    CFRelease(v6);
    a1[7] = 0;
  }
  uint64_t v7 = (void *)a1[8];
  if (v7)
  {
    free(v7);
    a1[8] = 0;
  }
}

void *_mdns_dns_push_service_definition_copy_description(uint64_t a1, int a2, int a3)
{
  uint64_t v19 = 0;
  CFIndex v20 = &v19;
  uint64_t v21 = 0x2000000000;
  uint64_t v22 = 0;
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6)
  {
    CFStringRef v8 = 0;
    goto LABEL_28;
  }
  uint64_t v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1))
  {
    goto LABEL_4;
  }
  CFArrayRef v9 = *(const char **)(a1 + 64);
  if (!v9) {
    CFArrayRef v9 = "";
  }
  if (mdns_string_builder_append_formatted(v7, "interface: %s/%u", v9, *(_DWORD *)(a1 + 72))
    || mdns_string_builder_append_formatted(v7, ", hostname: "))
  {
LABEL_4:
    CFStringRef v8 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      if (a3)
      {
        CFMutableArrayRef v11 = (void *)(v10 + 16);
        while (1)
        {
          CFMutableArrayRef v11 = (void *)*v11;
          if (!v11) {
            break;
          }
          int v12 = (uint64_t (*)(void))v11[3];
          if (v12)
          {
            int v13 = (char *)v12();
            goto LABEL_18;
          }
        }
        int v13 = 0;
LABEL_18:
        int v14 = "«REDACTED»";
        if (v13) {
          int v14 = v13;
        }
      }
      else
      {
        int v13 = 0;
        int v14 = *(const char **)(v10 + 40);
      }
    }
    else
    {
      int v13 = 0;
      int v14 = "«NO HOSTNAME»";
    }
    if (mdns_string_builder_append_formatted(v7, "%s", v14)) {
      goto LABEL_29;
    }
    if (mdns_string_builder_append_formatted(v7, ", port: %u", *(unsigned __int16 *)(a1 + 76))) {
      goto LABEL_29;
    }
    if (mdns_string_builder_append_formatted(v7, ", domains: {")) {
      goto LABEL_29;
    }
    v20[3] = (uint64_t)"";
    CFSetRef v15 = *(const __CFSet **)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 0x40000000;
    v17[2] = ___mdns_dns_push_service_definition_copy_description_block_invoke;
    v17[3] = &unk_264D057C8;
    char v18 = a3;
    v17[4] = &v19;
    v17[5] = v7;
    if (!mdns_cfset_enumerate(v15, (uint64_t)v17) || mdns_string_builder_append_formatted(v7, "}"))
    {
LABEL_29:
      CFStringRef v8 = 0;
      if (!v13) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    CFStringRef v8 = mdns_string_builder_copy_string((uint64_t)v7);
    if (v13) {
LABEL_26:
    }
      free(v13);
  }
LABEL_27:
  os_release(v7);
LABEL_28:
  _Block_object_dispose(&v19, 8);
  return v8;
}

BOOL ___mdns_dns_push_service_definition_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = (void *)(a2 + 16);
    while (1)
    {
      uint64_t v3 = (void *)*v3;
      if (!v3) {
        break;
      }
      uint64_t v4 = (uint64_t (*)(uint64_t, void, uint64_t))v3[3];
      if (v4)
      {
        uint64_t v5 = (char *)v4(a2, 0, 1);
        goto LABEL_8;
      }
    }
    uint64_t v5 = 0;
LABEL_8:
    uint64_t v6 = "«REDACTED»";
    if (v5) {
      uint64_t v6 = v5;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(const char **)(a2 + 40);
  }
  int appended = mdns_string_builder_append_formatted(*(void **)(a1 + 40), "%s%s", *(const char **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v6);
  if (v5) {
    free(v5);
  }
  BOOL result = appended == 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ", ";
  return result;
}

void *mdns_dns_push_service_definition_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    uint64_t v2 = &_mdns_dns_push_service_definition_kind;
    *(void *)(v0 + 16) = &_mdns_dns_push_service_definition_kind;
    do
    {
      uint64_t v3 = (void (*)(void *))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
    v1[5] = Mutable;
    if (!Mutable
      || (CFMutableSetRef v6 = CFSetCreateMutable(v4, 0, &mdns_domain_name_cf_set_callbacks), (v1[6] = v6) == 0)
      || (CFMutableArrayRef v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x263EFFF70]), (v1[7] = v7) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void mdns_dns_push_service_definition_append_server_address(uint64_t a1, const void *a2)
{
}

uint64_t mdns_dns_push_service_definition_add_domain(uint64_t a1, const void *a2)
{
  return 0;
}

void _mdns_dns_relay_finalize(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    nw_connection_cancel(v2);
    nw_release(*(void **)(a1 + 24));
    *(void *)(a1 + 24) = 0;
  }
}

char *_mdns_dns_relay_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFArrayRef v9 = __s1;
  __s1[0] = 0;
  if (a2
    && (mdns_snprintf_add(&v9, (uint64_t)&v11, "<%s: %p>: ", a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8)) & 0x80000000) != 0)
  {
    return 0;
  }
  BOOL result = strdup(__s1);
  if (!result) {
    __break(1u);
  }
  return result;
}

void mdns_dns_relay_set_client_connection(uint64_t a1, void *obj)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    nw_retain(obj);
    CFAllocatorRef v4 = *(void **)(a1 + 24);
    if (v4) {
      nw_release(v4);
    }
    *(void *)(a1 + 24) = obj;
  }
}

__n128 mdns_dns_relay_set_server_address(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)(a1 + 52) = *(_OWORD *)(a2 + 12);
    *(__n128 *)(a1 + 40) = result;
  }
  return result;
}

void mdns_dns_relay_activate(unsigned char *a1)
{
  if (!a1[72])
  {
    a1[72] = 1;
    os_retain(a1);
    if (_mdns_dns_relay_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_relay_queue_s_once, &__block_literal_global_32);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __mdns_dns_relay_activate_block_invoke;
    block[3] = &__block_descriptor_tmp_105;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_mdns_dns_relay_queue_s_queue, block);
  }
}

void __mdns_dns_relay_activate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(nw_connection_t **)(a1 + 32);
  uint64_t v3 = v2[3];
  if (v3)
  {
    if (_mdns_dns_relay_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_relay_queue_s_once, &__block_literal_global_32);
    }
    nw_connection_set_queue(v3, (dispatch_queue_t)_mdns_dns_relay_queue_s_queue);
    os_retain(v2);
    CFAllocatorRef v4 = v2[3];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___mdns_dns_relay_activate_internal_block_invoke;
    handler[3] = &__block_descriptor_tmp_25_107;
    handler[4] = v2;
    nw_connection_set_state_changed_handler(v4, handler);
    nw_connection_start(v2[3]);
  }
  else
  {
    _mdns_dns_relay_terminate(*(void *)(a1 + 32));
  }
  os_release(*(void **)(a1 + 32));
}

void ___mdns_dns_relay_activate_internal_block_invoke(uint64_t a1, int a2, nw_error_t error)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 24))
  {
    if (a2 != 5)
    {
      if (a2 == 4)
      {
        if (error) {
          nw_error_get_error_code(error);
        }
      }
      else
      {
        if (a2 != 3) {
          return;
        }
        secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14480], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14468]);
        if (secure_tcp)
        {
          uint64_t v5 = secure_tcp;
          nw_protocol_stack_t v6 = nw_parameters_copy_default_protocol_stack(secure_tcp);
          if (v6)
          {
            CFMutableArrayRef v7 = v6;
            if (_mdns_get_dns_over_bytestream_protocol_definition_s_once != -1) {
              dispatch_once(&_mdns_get_dns_over_bytestream_protocol_definition_s_once, &__block_literal_global_986);
            }
            if (_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def)
            {
              options = nw_framer_create_options((nw_protocol_definition_t)_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def);
              if (options)
              {
                nw_protocol_stack_prepend_application_protocol(v7, options);
                address = nw_endpoint_create_address((const sockaddr *)(v3 + 40));
                uint64_t v10 = address;
                if (address)
                {
                  uint64_t v11 = nw_connection_create(address, v5);
                  BOOL v12 = v11 != 0;
                }
                else
                {
                  BOOL v12 = 0;
                  uint64_t v11 = 0;
                }
LABEL_13:
                nw_release(v5);
                nw_release(v7);
                if (options) {
                  nw_release(options);
                }
                if (v10) {
                  nw_release(v10);
                }
                *(void *)(v3 + 32) = v11;
                if (v12)
                {
                  if (_mdns_dns_relay_queue_s_once != -1) {
                    dispatch_once(&_mdns_dns_relay_queue_s_once, &__block_literal_global_32);
                  }
                  nw_connection_set_queue(v11, (dispatch_queue_t)_mdns_dns_relay_queue_s_queue);
                  os_retain((void *)v3);
                  int v13 = *(NSObject **)(v3 + 32);
                  handler[0] = MEMORY[0x263EF8330];
                  handler[1] = 0x40000000;
                  handler[2] = ___mdns_dns_relay_set_up_server_connection_block_invoke;
                  handler[3] = &__block_descriptor_tmp_26;
                  handler[4] = v3;
                  nw_connection_set_state_changed_handler(v13, handler);
                  nw_connection_start(*(nw_connection_t *)(v3 + 32));
                  return;
                }
                goto LABEL_24;
              }
              BOOL v12 = 0;
            }
            else
            {
              BOOL v12 = 0;
              options = 0;
            }
            uint64_t v11 = 0;
            uint64_t v10 = 0;
            goto LABEL_13;
          }
          nw_release(v5);
        }
        *(void *)(v3 + 32) = 0;
      }
LABEL_24:
      _mdns_dns_relay_terminate(v3);
      return;
    }
  }
  else if (a2 != 5)
  {
    return;
  }
  int v14 = *(void **)(a1 + 32);

  os_release(v14);
}

void _mdns_dns_relay_terminate(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    if (*(_DWORD *)(a1 + 68))
    {
      *(unsigned char *)(a1 + 73) = 1;
    }
    else
    {
      nw_connection_cancel(v2);
      nw_release(*(void **)(a1 + 24));
      *(void *)(a1 + 24) = 0;
    }
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    nw_connection_cancel(v3);
    nw_release(*(void **)(a1 + 32));
    *(void *)(a1 + 32) = 0;
  }
}

void ___mdns_dns_relay_set_up_server_connection_block_invoke(uint64_t a1, int a2, nw_error_t error)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3[4])
  {
    if (a2 != 5)
    {
      if (a2 == 4)
      {
        if (error) {
          nw_error_get_error_code(error);
        }
        _mdns_dns_relay_terminate((uint64_t)v3);
      }
      else if (a2 == 3)
      {
        (*(void (**)(void, void, nw_error_t))(v3[2] + 48))(*(void *)(a1 + 32), v3[3], error);
        CFAllocatorRef v4 = v3[4];
        completion[0] = MEMORY[0x263EF8330];
        completion[1] = 0x40000000;
        completion[2] = ___mdns_dns_relay_schedule_server_receive_block_invoke;
        completion[3] = &__block_descriptor_tmp_27_109;
        completion[4] = v3;
        nw_connection_receive_message(v4, completion);
      }
      return;
    }
  }
  else if (a2 != 5)
  {
    return;
  }
  uint64_t v5 = *(void **)(a1 + 32);

  os_release(v5);
}

void ___mdns_dns_relay_schedule_server_receive_block_invoke(uint64_t a1, uint64_t a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 32)) {
    return;
  }
  if (a2) {
    _mdns_dns_relay_send_dns_message_to_client(v6, a2);
  }
  if (a5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    _mdns_dns_relay_terminate(v9);
    return;
  }
  if (!context)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    goto LABEL_14;
  }
  BOOL is_final = nw_content_context_get_is_final(context);
  uint64_t v11 = *(void *)(a1 + 32);
  if (!is_final)
  {
LABEL_14:
    BOOL v12 = *(NSObject **)(v11 + 32);
    completion[0] = MEMORY[0x263EF8330];
    completion[1] = 0x40000000;
    completion[2] = ___mdns_dns_relay_schedule_server_receive_block_invoke;
    completion[3] = &__block_descriptor_tmp_27_109;
    completion[4] = v11;
    nw_connection_receive_message(v12, completion);
    return;
  }

  _mdns_dns_relay_send_dns_message_to_client(v11, 0);
}

void _mdns_dns_relay_send_dns_message_to_client(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 24) || *(unsigned char *)(a1 + 73))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_17;
  }
  int v10 = 0;
  if (!a2)
  {
    CFAllocatorRef v4 = *MEMORY[0x263F14458];
    obj = v4;
    nw_retain(v4);
    uint64_t v3 = 0;
LABEL_9:
    uint64_t v5 = *(NSObject **)(a1 + 24);
    completion[0] = MEMORY[0x263EF8330];
    completion[1] = 0x40000000;
    completion[2] = ___mdns_dns_relay_send_dns_message_to_client_block_invoke;
    completion[3] = &__block_descriptor_tmp_28_111;
    completion[4] = a1;
    nw_connection_send(v5, v3, v4, 1, completion);
    uint64_t v6 = *(unsigned int *)(a1 + 68) + 1;
    uint64_t v7 = v6 << 31 >> 31;
    *(_DWORD *)(a1 + 68) = v6;
    if (v7 == v6 && (v7 & 0x8000000000000000) == 0)
    {
      int v10 = 0;
      if (!v3) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_17:
    _os_assert_log();
    _os_crash();
    __break(1u);
    return;
  }
  obj = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, void **, int *))(*(void *)(a1 + 16) + 56))(a1, a2, &obj, &v10);
  if (!v10)
  {
    CFAllocatorRef v4 = obj;
    goto LABEL_9;
  }
  _mdns_dns_relay_terminate(a1);
  if (v3) {
LABEL_12:
  }
    dispatch_release(v3);
LABEL_13:
  if (obj) {
    nw_release(obj);
  }
}

void ___mdns_dns_relay_send_dns_message_to_client_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 68);
  *(_DWORD *)(v2 + 68) = v3 - 1;
  if (!v3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    return;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 24);
  if (v6)
  {
    if (*(unsigned char *)(v5 + 73) && !*(_DWORD *)(v5 + 68))
    {
      nw_connection_cancel(v6);
      nw_release(*(void **)(*(void *)(a1 + 32) + 24));
      *(void *)(*(void *)(a1 + 32) + 24) = 0;
      if (!a2) {
        return;
      }
    }
    else if (!a2)
    {
      return;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    _mdns_dns_relay_terminate(v8);
  }
}

dispatch_queue_t ___mdns_dns_relay_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.dns-relay-queue", 0);
  _mdns_dns_relay_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t mdns_dot_relay_create(int *a1)
{
  uint64_t v2 = _os_object_alloc();
  uint64_t v3 = v2;
  if (v2)
  {
    CFAllocatorRef v4 = &_mdns_dot_relay_kind;
    *(void *)(v2 + 16) = &_mdns_dot_relay_kind;
    do
    {
      uint64_t v5 = (void (*)(uint64_t))v4[2];
      if (v5) {
        v5(v3);
      }
      CFAllocatorRef v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
  }
  if (a1)
  {
    if (v3) {
      int v6 = 0;
    }
    else {
      int v6 = -6728;
    }
    *a1 = v6;
  }
  return v3;
}

dispatch_data_t _mdns_dot_relay_handle_dns_message_to_client(int a1, dispatch_data_t data, NSObject **a3, int *a4)
{
  __int16 buffer = bswap32(dispatch_data_get_size(data)) >> 16;
  uint64_t v7 = dispatch_data_create(&buffer, 2uLL, 0, 0);
  uint64_t v8 = v7;
  if (v7)
  {
    dispatch_data_t concat = dispatch_data_create_concat(v7, data);
    dispatch_release(v8);
    if (concat)
    {
      uint64_t v8 = *MEMORY[0x263F14448];
      nw_retain((void *)*MEMORY[0x263F14448]);
      int v10 = 0;
      if (!a3) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    uint64_t v8 = 0;
  }
  else
  {
    dispatch_data_t concat = 0;
  }
  int v10 = -6729;
  if (a3)
  {
LABEL_4:
    *a3 = v8;
    uint64_t v8 = 0;
  }
LABEL_5:
  if (a4) {
    *a4 = v10;
  }
  if (v8) {
    nw_release(v8);
  }
  return concat;
}

void _mdns_dot_relay_schedule_client_receive(uint64_t a1, nw_connection_t connection)
{
  uint32_t v2 = *(unsigned __int16 *)(a1 + 80);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dot_relay_schedule_client_receive_block_invoke;
  v4[3] = &__block_descriptor_tmp_5;
  if (v2) {
    uint32_t v3 = v2;
  }
  else {
    uint32_t v3 = 2;
  }
  v4[4] = a1;
  uint32_t v5 = v3;
  nw_connection_receive(connection, v3, v3, v4);
}

void ___mdns_dot_relay_schedule_client_receive_block_invoke(uint64_t a1, dispatch_data_t data, NSObject *a3, int a4, uint64_t a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 24) || !*(void *)(v5 + 32)) {
    return;
  }
  if (!a5) {
    goto LABEL_7;
  }
  if (_mdns_dns_relay_log_s_once != -1) {
    dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_116);
  }
  uint64_t v11 = _mdns_dns_relay_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_ERROR))
  {
LABEL_7:
    if (data) {
      goto LABEL_8;
    }
LABEL_17:
    size_t size = 0;
    goto LABEL_18;
  }
  *(_DWORD *)applier = 138543362;
  *(void *)&applier[4] = a5;
  _os_log_error_impl(&dword_23814D000, v11, OS_LOG_TYPE_ERROR, "DoT receive error: %{public}@", applier, 0xCu);
  if (!data) {
    goto LABEL_17;
  }
LABEL_8:
  size_t size = dispatch_data_get_size(data);
  if (size != *(_DWORD *)(a1 + 40))
  {
LABEL_18:
    if (_mdns_dns_relay_log_s_once != -1) {
      dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_116);
    }
    int v16 = _mdns_dns_relay_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v17 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)applier = 67109376;
      *(_DWORD *)&applier[4] = v17;
      *(_WORD *)&applier[8] = 2048;
      *(void *)&applier[10] = size;
      _os_log_error_impl(&dword_23814D000, v16, OS_LOG_TYPE_ERROR, "Expected to receive %u bytes from client, but received %zu bytes instead", applier, 0x12u);
    }
    char v15 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(_WORD *)(v13 + 80))
  {
    *(_WORD *)(v13 + 80) = 0;
    _mdns_dns_relay_send_dns_message_to_server(v13, data);
  }
  else
  {
    unsigned __int16 v19 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2000000000;
    v20[3] = 0;
    *(void *)applier = MEMORY[0x263EF8330];
    *(void *)&applier[8] = 0x40000000;
    *(void *)&applier[16] = ___mdns_dispatch_data_memcpy_block_invoke;
    uint64_t v22 = &unk_264D05850;
    uint64_t v24 = 2;
    long long v25 = &v19;
    uint64_t v23 = v20;
    dispatch_data_apply(data, applier);
    _Block_object_dispose(v20, 8);
    *(_WORD *)(*(void *)(a1 + 32) + 80) = bswap32(v19) >> 16;
    if (_mdns_dns_relay_log_s_once != -1) {
      dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_116);
    }
    int v14 = _mdns_dns_relay_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      int v18 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 80);
      *(_DWORD *)applier = 67109120;
      *(_DWORD *)&applier[4] = v18;
      _os_log_debug_impl(&dword_23814D000, v14, OS_LOG_TYPE_DEBUG, "Received message length %u from client", applier, 8u);
    }
  }
  char v15 = 1;
LABEL_23:
  if (!data) {
    char v15 = 1;
  }
  if (a5 || (v15 & 1) == 0)
  {
    _mdns_dns_relay_terminate(*(void *)(a1 + 32));
  }
  else if (a3 && a4 && nw_content_context_get_is_final(a3))
  {
    _mdns_dns_relay_send_dns_message_to_server(*(void *)(a1 + 32), 0);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 32) + 16) + 48))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 24));
  }
}

BOOL ___mdns_dispatch_data_memcpy_block_invoke(void *a1, int a2, unint64_t a3, void *__src, size_t a5)
{
  unint64_t v5 = a1[5];
  BOOL v6 = v5 > a3;
  size_t v7 = v5 - a3;
  if (!v6) {
    return 0;
  }
  if (v7 >= a5) {
    size_t v10 = a5;
  }
  else {
    size_t v10 = v7;
  }
  memcpy((void *)(a1[6] + a3), __src, v10);
  *(void *)(*(void *)(a1[4] + 8) + 24) = v10 + a3;
  return *(void *)(*(void *)(a1[4] + 8) + 24) < a1[5];
}

void _mdns_dns_relay_send_dns_message_to_server(uint64_t a1, NSObject *a2)
{
  uint32_t v2 = (NSObject **)MEMORY[0x263F14448];
  if (!a2) {
    uint32_t v2 = (NSObject **)MEMORY[0x263F14458];
  }
  uint32_t v3 = *v2;
  CFAllocatorRef v4 = *(NSObject **)(a1 + 32);
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 0x40000000;
  completion[2] = ___mdns_dns_relay_send_dns_message_to_server_block_invoke;
  completion[3] = &__block_descriptor_tmp_12_121;
  completion[4] = a1;
  nw_connection_send(v4, a2, v3, 1, completion);
}

void ___mdns_dns_relay_send_dns_message_to_server_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 32)) {
      _mdns_dns_relay_terminate(v2);
    }
  }
}

os_log_t ___mdns_dns_relay_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "dns_relay");
  _mdns_dns_relay_log_s_log = (uint64_t)result;
  return result;
}

uint64_t mdns_doh_relay_create(int *a1)
{
  uint64_t v2 = _os_object_alloc();
  uint64_t v3 = v2;
  if (v2)
  {
    CFAllocatorRef v4 = &_mdns_doh_relay_kind;
    *(void *)(v2 + 16) = &_mdns_doh_relay_kind;
    do
    {
      unint64_t v5 = (void (*)(uint64_t))v4[2];
      if (v5) {
        v5(v3);
      }
      CFAllocatorRef v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
  }
  if (a1)
  {
    if (v3) {
      int v6 = 0;
    }
    else {
      int v6 = -6728;
    }
    *a1 = v6;
  }
  return v3;
}

NSObject *_mdns_doh_relay_handle_dns_message_to_client(uint64_t a1, NSObject *a2, NSObject **a3, _DWORD *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v11 = 0;
  size_t v7 = (void *)MEMORY[0x23EC88D10]();
  if (!v7)
  {
    uint64_t v9 = 0;
    a2 = 0;
    int v11 = -6729;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  size_t size = dispatch_data_get_size(a2);
  snprintf(__str, 0x80uLL, "%zu", size);
  nw_http_fields_set_value_by_name();
  nw_http_fields_set_value_by_name();
  uint64_t v9 = _mdns_create_http_response_context(200, (uint64_t)v7, &v11);
  if (v11)
  {
    a2 = 0;
    if (!a3) {
      goto LABEL_7;
    }
LABEL_6:
    *a3 = v9;
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  dispatch_retain(a2);
  if (a3) {
    goto LABEL_6;
  }
LABEL_7:
  if (a4) {
    *a4 = v11;
  }
  if (v7) {
    nw_release(v7);
  }
  if (v9) {
    nw_release(v9);
  }
  return a2;
}

NSObject *_mdns_create_http_response_context(uint64_t a1, uint64_t a2, int *a3)
{
  well_known = (void *)nw_http_response_create_well_known();
  if (!well_known)
  {
    uint64_t v8 = 0;
    metadata_for_response = 0;
    goto LABEL_10;
  }
  if (a2) {
    nw_http_response_set_header_fields();
  }
  metadata_for_response = nw_http_create_metadata_for_response();
  if (!metadata_for_response)
  {
    uint64_t v8 = 0;
LABEL_10:
    int v9 = -6729;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  size_t v7 = nw_content_context_create("https");
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  nw_content_context_set_metadata_for_protocol(v7, metadata_for_response);
  int v9 = 0;
  if (a3) {
LABEL_11:
  }
    *a3 = v9;
LABEL_12:
  if (well_known) {
    nw_release(well_known);
  }
  if (metadata_for_response) {
    nw_release(metadata_for_response);
  }
  return v8;
}

void _mdns_doh_relay_schedule_client_receive(uint64_t a1, nw_connection_t connection)
{
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 0x40000000;
  completion[2] = ___mdns_doh_relay_schedule_client_receive_block_invoke;
  completion[3] = &__block_descriptor_tmp_14;
  completion[4] = a1;
  nw_connection_receive_message(connection, completion);
}

void ___mdns_doh_relay_schedule_client_receive_block_invoke(uint64_t a1, int a2, NSObject *a3, int a4, nw_error_t error)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  unint64_t v5 = *(void **)(a1 + 32);
  if (!v5[3] || !v5[4]) {
    return;
  }
  int v6 = error;
  if (error)
  {
    nw_error_get_error_code(error);
    if (_mdns_dns_relay_log_s_once != -1) {
LABEL_91:
    }
      dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_116);
    long long v41 = _mdns_dns_relay_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_23814D000, v41, OS_LOG_TYPE_ERROR, "DoH receive error: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    int v6 = 0;
    nw_protocol_metadata_t v9 = 0;
    goto LABEL_48;
  }
  int v6 = nw_protocol_copy_http_definition();
  nw_protocol_metadata_t v9 = nw_content_context_copy_protocol_metadata(a3, v6);
  if (!v9)
  {
LABEL_48:
    _mdns_dns_relay_terminate((uint64_t)v5);
    goto LABEL_54;
  }
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2000000000;
  char v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2000000000;
  uint64_t v52 = 0;
  if (nw_http_metadata_get_version() != 4)
  {
    size_t v10 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 505;
    goto LABEL_37;
  }
  size_t v10 = (void *)nw_http_metadata_copy_request();
  if (!v10) {
    goto LABEL_27;
  }
  if (!nw_http_request_has_method())
  {
    uint64_t v13 = 0;
    uint64_t v12 = 501;
    goto LABEL_37;
  }
  if (v5[11])
  {
    uint64_t v43 = 0;
    uint64_t v44 = (uint64_t)&v43;
    uint64_t v45 = 0x2000000000;
    LOBYTE(v46) = 0;
    uint64_t completion = 0;
    p_uint64_t completion = (uint64_t)&completion;
    uint64_t v60 = 0x2000000000;
    LOBYTE(v61) = 0;
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 0x40000000;
    unint64_t v64 = ___mdns_doh_relay_handle_request_block_invoke;
    __int16 v65 = &unk_264D058B8;
    uint64_t v66 = &v43;
    __int16 v67 = &completion;
    v68 = v5;
    nw_http_request_access_authority();
    if (*(unsigned char *)(v44 + 24))
    {
      BOOL v11 = *(unsigned char *)(p_completion + 24) != 0;
      uint64_t v12 = *(unsigned char *)(p_completion + 24) ? 0 : 404;
    }
    else
    {
      BOOL v11 = 0;
      uint64_t v12 = 400;
    }
    _Block_object_dispose(&completion, 8);
    _Block_object_dispose(&v43, 8);
    if (!v11) {
      goto LABEL_36;
    }
  }
  uint64_t v43 = MEMORY[0x263EF8330];
  uint64_t v44 = 0x40000000;
  uint64_t v45 = (uint64_t)___mdns_doh_relay_handle_request_block_invoke_2;
  v46 = &unk_264D058E0;
  v47 = &v53;
  int v48 = &v49;
  nw_http_request_access_path();
  if (!*((unsigned char *)v54 + 24))
  {
    uint64_t v13 = 0;
    uint64_t v12 = 404;
    goto LABEL_37;
  }
  CFURLRef v14 = (const __CFURL *)v50[3];
  if (!v14)
  {
LABEL_27:
    uint64_t v13 = 0;
LABEL_28:
    uint64_t v12 = 500;
    goto LABEL_37;
  }
  if (v5[10]) {
    char v15 = (const char *)v5[10];
  }
  else {
    char v15 = "";
  }
  CFStringRef v16 = CFURLCopyFileSystemPath(v14, kCFURLPOSIXPathStyle);
  if (!v16) {
    goto LABEL_25;
  }
  CFStringRef v17 = v16;
  int v18 = mdns_cfstring_to_utf8_cstring(v16);
  CFRelease(v17);
  if (!v18) {
    goto LABEL_25;
  }
  int v19 = strcmp(v18, v15);
  free(v18);
  if (v19) {
    goto LABEL_25;
  }
  CFStringRef String = CFURLCopyQueryString((CFURLRef)v50[3], &stru_26EB175B8);
  uint64_t v13 = String;
  if (!String) {
    goto LABEL_26;
  }
  uint64_t v21 = mdns_cfstring_to_utf8_cstring(String);
  CFRelease(v13);
  if (!v21)
  {
LABEL_25:
    uint64_t v13 = 0;
LABEL_26:
    uint64_t v12 = 400;
    goto LABEL_37;
  }
  if (strncmp(v21, "dns=", 4uLL)) {
    goto LABEL_34;
  }
  uint64_t v22 = v21 + 4;
  size_t v23 = strlen(v21 + 4);
  if ((v23 & 3) == 1) {
    goto LABEL_34;
  }
  size_t v28 = v23;
  if (!v23)
  {
    long long v40 = MEMORY[0x263EF8388];
LABEL_83:
    uint64_t v13 = dispatch_data_create_with_transform();
    free(v21);
    dispatch_release(v40);
    if (v13)
    {
      if (dispatch_data_get_size(v13) >= 0xC)
      {
        _mdns_dns_relay_send_dns_message_to_server((uint64_t)v5, v13);
        int v26 = 0;
LABEL_42:
        nw_release(v10);
        goto LABEL_43;
      }
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  uint64_t v29 = 0;
  while (1)
  {
    int v30 = v22[v29];
    BOOL v31 = (v30 - 48) >= 0xA && (v30 & 0xFFFFFFDF) - 65 >= 0x1A;
    if (v31 && v30 != 95 && v30 != 45) {
      break;
    }
    if (v23 == ++v29)
    {
      size_t v32 = (v23 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v32 < v28) {
        break;
      }
      size_t size = (v28 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      long long v33 = malloc_type_calloc(v32, 1uLL, 0xF1748037uLL);
      if (!v33)
      {
        __break(1u);
        goto LABEL_91;
      }
      uint64_t v34 = 0;
      do
      {
        int v35 = v22[v34];
        char v36 = v22[v34];
        if (v35 == 45) {
          char v36 = 43;
        }
        if (v35 == 95) {
          char v37 = 47;
        }
        else {
          char v37 = v36;
        }
        v33[v34++] = v37;
      }
      while (v28 != v34);
      size_t v38 = (v28 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (size > v28)
      {
        long long v39 = v33;
        memset(&v33[v28], 61, size - v28);
        long long v33 = v39;
        size_t v38 = (v28 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
      long long v40 = dispatch_data_create(v33, v38, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
      if (!v40)
      {
        uint64_t v12 = 500;
        goto LABEL_35;
      }
      goto LABEL_83;
    }
  }
LABEL_34:
  uint64_t v12 = 400;
LABEL_35:
  free(v21);
LABEL_36:
  uint64_t v13 = 0;
LABEL_37:
  int v57 = 0;
  uint64_t v24 = _mdns_create_http_response_context(v12, 0, &v57);
  if (!v57)
  {
    long long v25 = v5[3];
    uint64_t completion = MEMORY[0x263EF8330];
    p_uint64_t completion = 0x40000000;
    uint64_t v60 = (uint64_t)___mdns_dns_relay_send_data_to_client_block_invoke;
    v61 = &__block_descriptor_tmp_22;
    v62 = v5;
    nw_connection_send(v25, 0, v24, 1, &completion);
  }
  if (v24) {
    nw_release(v24);
  }
  int v26 = v57;
  if (v10) {
    goto LABEL_42;
  }
LABEL_43:
  long long v27 = (const void *)v50[3];
  if (v27)
  {
    CFRelease(v27);
    v50[3] = 0;
  }
  if (v13) {
    dispatch_release(v13);
  }
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  if (v26) {
    goto LABEL_48;
  }
  if (a3 && a4 && nw_content_context_get_is_final(a3)) {
    _mdns_dns_relay_send_dns_message_to_server((uint64_t)v5, 0);
  }
  else {
    (*(void (**)(void *, void))(v5[2] + 48))(v5, v5[3]);
  }
LABEL_54:
  if (v6) {
    nw_release(v6);
  }
  if (v9) {
    nw_release(v9);
  }
}

unint64_t ___mdns_doh_relay_handle_request_block_invoke(unint64_t result, char *__s)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (__s)
  {
    unint64_t v3 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    size_t v4 = strlen(__s);
    uint64_t v5 = *(void *)(v3 + 48);
    int v6 = *(const char **)(v5 + 88);
    int v7 = *(unsigned __int16 *)(v5 + 96);
    os_log_t result = strlen(v6);
    size_t v8 = v4 - result;
    BOOL v11 = 0;
    if (v4 >= result)
    {
      unint64_t v9 = result;
      os_log_t result = strncasecmp(__s, v6, result);
      if (!result)
      {
        BOOL v10 = v7 == 443 && v4 == v9;
        if (v10
          || (snprintf(__str, 0x20uLL, ":%u", v7), os_log_t result = strlen(__str), v8 == result)
          && (os_log_t result = strncasecmp(&__s[v9], __str, v8), !result))
        {
          BOOL v11 = 1;
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = v11;
  }
  return result;
}

CFURLRef ___mdns_doh_relay_handle_request_block_invoke_2(CFURLRef result, char *__s)
{
  if (__s)
  {
    CFURLRef v3 = result;
    *(unsigned char *)(*(void *)(*((void *)result + 4) + 8) + 24) = 1;
    size_t v4 = strlen(__s);
    os_log_t result = CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)__s, v4, 0x8000100u, 0);
    *(void *)(*(void *)(*((void *)v3 + 5) + 8) + 24) = result;
  }
  return result;
}

void ___mdns_dns_relay_send_data_to_client_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24) && a2)
  {
    if (*(void *)(v2 + 32)) {
      _mdns_dns_relay_terminate(v2);
    }
  }
}

void _mdns_doh_relay_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 88);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 88) = 0;
  }
  CFURLRef v3 = *(void **)(a1 + 80);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 80) = 0;
  }
}

uint64_t mdns_doh_relay_set_request_uri_path(uint64_t a1, char *a2)
{
  if (*(unsigned char *)(a1 + 72)) {
    return 4294960577;
  }
  mdns_replace_string((void **)(a1 + 80), a2);
  return 0;
}

uint64_t mdns_doh_relay_set_host_and_port(uint64_t a1, char *a2, __int16 a3)
{
  v10[2] = *(char **)MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 72)) {
    return 4294960577;
  }
  unsigned int v6 = inet_pton(30, a2, v10);
  if (v6 <= 1)
  {
    if (v6 == 1)
    {
      v10[0] = 0;
      asprintf(v10, "[%s]", a2);
      int v7 = v10[0];
      if (!v10[0]) {
        return 4294960568;
      }
      size_t v8 = *(void **)(a1 + 88);
      if (v8)
      {
        free(v8);
        int v7 = v10[0];
      }
      *(void *)(a1 + 88) = v7;
      goto LABEL_11;
    }
LABEL_10:
    mdns_replace_string((void **)(a1 + 88), a2);
LABEL_11:
    uint64_t result = 0;
    *(_WORD *)(a1 + 96) = a3;
    return result;
  }
  if (!*__error()) {
    return 4294960596;
  }
  uint64_t result = *__error();
  if (!result) {
    goto LABEL_10;
  }
  return result;
}

void _mdns_dns_service_manager_finalize(void *a1)
{
  _mdns_dns_service_manager_enumerate_all_service_array_pointers((uint64_t)a1, (uint64_t)&__block_literal_global_110);
  uint64_t v2 = (const void *)a1[10];
  if (v2)
  {
    CFRelease(v2);
    a1[10] = 0;
  }
  CFURLRef v3 = a1[11];
  if (v3)
  {
    dispatch_release(v3);
    a1[11] = 0;
  }
  size_t v4 = (const void *)a1[13];
  if (v4)
  {
    _Block_release(v4);
    a1[13] = 0;
  }
}

uint64_t _mdns_dns_service_manager_enumerate_all_service_array_pointers(uint64_t a1, uint64_t a2)
{
  v7[7] = *MEMORY[0x263EF8340];
  v7[0] = a1 + 24;
  v7[1] = a1 + 32;
  v7[2] = a1 + 40;
  v7[3] = a1 + 48;
  v7[4] = a1 + 56;
  v7[5] = a1 + 64;
  void v7[6] = a1 + 72;
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if (result)
  {
    uint64_t v4 = 1;
    unint64_t v5 = 6;
    while (v4 != 7)
    {
      char v6 = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v7[v4++]);
      if ((v6 & 1) == 0)
      {
        unint64_t v5 = v4 - 2;
        return v5 > 5;
      }
    }
    return v5 > 5;
  }
  return result;
}

uint64_t ___mdns_dns_service_manager_finalize_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  if (*a2)
  {
    CFRelease(*a2);
    *a2 = 0;
  }
  return 1;
}

void *_mdns_dns_service_manager_copy_description(void *a1, int a2, char a3)
{
  uint64_t v19 = 0;
  CFIndex v20 = &v19;
  uint64_t v21 = 0x2000000000;
  int v22 = 0;
  uint64_t v15 = 0;
  CFStringRef v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  char v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    int v7 = v6;
    if (a2)
    {
      int appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1);
      *((_DWORD *)v20 + 6) = appended;
      if (appended) {
        goto LABEL_7;
      }
    }
    int v9 = mdns_string_builder_append_formatted(v7, "{");
    *((_DWORD *)v20 + 6) = v9;
    if (v9) {
      goto LABEL_7;
    }
    v16[3] = (uint64_t)"\n\t";
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    v13[2] = ___mdns_dns_service_manager_copy_description_block_invoke;
    v13[3] = &unk_264D06160;
    v13[4] = &v19;
    v13[5] = &v15;
    v13[6] = v7;
    char v14 = a3;
    _mdns_dns_service_manager_enumerate_all_services((uint64_t)a1, (uint64_t)v13);
    if (*((_DWORD *)v20 + 6)
      || (int v10 = mdns_string_builder_append_formatted(v7, "\n}"), (*((_DWORD *)v20 + 6) = v10) != 0))
    {
LABEL_7:
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = mdns_string_builder_copy_string((uint64_t)v7);
    }
    os_release(v7);
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

BOOL ___mdns_dns_service_manager_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ",\n\t";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_manager_enumerate_all_services(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
  v3[3] = &unk_264D06778;
  v3[4] = a2;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
  v4[3] = &unk_264D06750;
  v4[4] = v3;
  return _mdns_dns_service_manager_enumerate_all_service_array_pointers(a1, (uint64_t)v4);
}

BOOL ___mdns_dns_service_manager_enumerate_all_services_block_invoke(uint64_t a1, const __CFArray *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_enumerate_array_including_variants_and_discovered_alts_block_invoke;
  v4[3] = &unk_264D067A0;
  v4[4] = v2;
  return mdns_cfarray_enumerate(a2, (uint64_t)v4);
}

uint64_t ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke(uint64_t a1, void *a2)
{
  if (*a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return 1;
  }
}

uint64_t ___mdns_dns_service_enumerate_array_including_variants_and_discovered_alts_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    CFArrayRef v5 = *(const __CFArray **)(a2 + 128);
    if (!v5 || (uint64_t result = mdns_cfarray_enumerate(v5, *(void *)(a1 + 32)), result))
    {
      CFArrayRef v6 = *(const __CFArray **)(a2 + 144);
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        return mdns_cfarray_enumerate(v6, v7);
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

void _mdns_dns_service_finalize(void *a1)
{
  if (a1[14])
  {
    uint64_t v2 = (void (*)(void))a1[15];
    if (v2) {
      v2();
    }
    a1[14] = 0;
  }
  CFURLRef v3 = (const void *)a1[10];
  if (v3)
  {
    CFRelease(v3);
    a1[10] = 0;
  }
  while (1)
  {
    uint64_t v4 = (void *)a1[11];
    if (!v4) {
      break;
    }
    a1[11] = *v4;
    _domain_item_free(v4);
  }
  CFArrayRef v5 = (void *)a1[6];
  if (v5)
  {
    nw_release(v5);
    a1[6] = 0;
  }
  CFArrayRef v6 = (void *)a1[12];
  if (v6)
  {
    nw_release(v6);
    a1[12] = 0;
  }
  uint64_t v7 = (void *)a1[13];
  if (v7)
  {
    free(v7);
    a1[13] = 0;
  }
  size_t v8 = (const void *)a1[16];
  if (v8)
  {
    CFRelease(v8);
    a1[16] = 0;
  }
  int v9 = (void *)a1[17];
  if (v9)
  {
    os_release(v9);
    a1[17] = 0;
  }
  int v10 = (const void *)a1[18];
  if (v10)
  {
    CFRelease(v10);
    a1[18] = 0;
  }
  BOOL v11 = (const void *)a1[19];
  if (v11)
  {
    CFRelease(v11);
    a1[19] = 0;
  }
  uint64_t v12 = (void *)a1[20];
  if (v12)
  {
    xpc_release(v12);
    a1[20] = 0;
  }
  uint64_t v13 = (void *)a1[21];
  if (v13)
  {
    free(v13);
    a1[21] = 0;
  }
  char v14 = (void *)a1[22];
  if (v14)
  {
    free(v14);
    a1[22] = 0;
  }
  uint64_t v15 = (const void *)a1[24];
  if (v15)
  {
    CFRelease(v15);
    a1[24] = 0;
  }
  CFStringRef v16 = (void *)a1[26];
  if (v16)
  {
    nw_release(v16);
    a1[26] = 0;
  }
  uint64_t v17 = (void *)a1[27];
  if (v17)
  {
    os_release(v17);
    a1[27] = 0;
  }
  uint64_t v18 = (const void *)a1[29];
  if (v18)
  {
    CFRelease(v18);
    a1[29] = 0;
  }
}

void _domain_item_free(void *a1)
{
  uint64_t v2 = (void *)a1[1];
  if (v2) {
    os_release(v2);
  }

  free(a1);
}

uint64_t _mdns_dns_service_equal(uint64_t a1, uint64_t a2)
{
  return _mdns_dns_service_equal_ex(a1, a2, 0);
}

uint64_t _mdns_dns_service_equal_ex(uint64_t a1, uint64_t a2, char a3)
{
  if (a1 == a2) {
    return 1;
  }
  int v5 = *(unsigned __int8 *)(a1 + 280);
  if (v5 != *(unsigned __int8 *)(a2 + 280)
    || *(_DWORD *)(a1 + 256) != *(_DWORD *)(a2 + 256)
    || v5 == 3 && *(_DWORD *)(a1 + 260) != *(_DWORD *)(a2 + 260))
  {
    return 0;
  }
  uint64_t v7 = *(const void **)(a1 + 80);
  size_t v8 = *(const void **)(a2 + 80);
  if (v7 == v8 || (uint64_t result = 0, v7) && v8 && (uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 80), v8), result))
  {
    if (a3) {
      return 1;
    }
    uint64_t v10 = a1 + 88;
    uint64_t v11 = a2 + 88;
    while (1)
    {
      uint64_t v11 = *(void *)v11;
      uint64_t v10 = *(void *)v10;
      if (!v10 || v11 == 0) {
        break;
      }
      int v13 = _domain_item_compare(v10, v11, 0);
      uint64_t result = 0;
      if (v13) {
        return result;
      }
    }
    return !(v10 | v11);
  }
  return result;
}

uint64_t _domain_item_compare(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(_DWORD *)(v3 + 48);
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = v4 - *(_DWORD *)(v5 + 48);
  if (v6)
  {
    if (v6 < 1) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    if (v3 != v5 && v4 >= 1)
    {
      uint64_t v12 = *(unsigned char **)(v3 + 24);
      int v13 = *(unsigned char **)(v5 + 24);
      while (1)
      {
        int v14 = v4 - 1;
        if (v4 < 1) {
          return (a3 & 1) == 0 && *(_DWORD *)(a1 + 16) < *(_DWORD *)(a2 + 16);
        }
        uint64_t v15 = v12;
        CFStringRef v16 = v13;
        if (v4 != 1)
        {
          int v17 = 1;
          uint64_t v15 = v12;
          do
          {
            if (!*v15) {
              break;
            }
            v15 += *v15 + 1;
            ++v17;
          }
          while (v4 != v17);
          int v18 = 1;
          CFStringRef v16 = v13;
          do
          {
            if (!*v16) {
              break;
            }
            v16 += *v16 + 1;
            ++v18;
          }
          while (v4 != v18);
        }
        unsigned int v21 = *v15;
        uint64_t v19 = v15 + 1;
        unsigned int v20 = v21;
        unsigned int v24 = *v16;
        int v22 = v16 + 1;
        unsigned int v23 = v24;
        if (v20 >= v24) {
          uint64_t v25 = v23;
        }
        else {
          uint64_t v25 = v20;
        }
        int v26 = mdns_memcmp_us_ascii_case_insensitive(v19, v22, v25, v4);
        if (v26) {
          return (char)v26;
        }
        if (v20 < v23) {
          break;
        }
        int v4 = v14;
        if (v20 > v23)
        {
          LOBYTE(v26) = 1;
          return (char)v26;
        }
      }
      LOBYTE(v26) = -1;
      return (char)v26;
    }
    return (a3 & 1) == 0 && *(_DWORD *)(a1 + 16) < *(_DWORD *)(a2 + 16);
  }
}

void *_mdns_dns_service_copy_description(uint64_t a1, int a2, int a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2000000000;
  int v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2000000000;
  uint64_t v64 = 0;
  int v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    uint64_t v7 = v6;
    if (!a2
      || (int v8 = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v66 + 6) = v8) == 0))
    {
      int appended = mdns_string_builder_append_formatted(v7, "id: %llu", *(void *)(a1 + 24));
      *((_DWORD *)v66 + 6) = appended;
      if (!appended)
      {
        int v10 = mdns_string_builder_append_formatted(v7, ", type: ");
        *((_DWORD *)v66 + 6) = v10;
        if (!v10)
        {
          int v11 = *(unsigned __int8 *)(a1 + 281) > 5uLL
              ? mdns_string_builder_append_formatted(v7, "«INVALID %u»")
              : mdns_string_builder_append_formatted(v7, "%s");
          *((_DWORD *)v66 + 6) = v11;
          if (!v11)
          {
            int v13 = mdns_string_builder_append_formatted(v7, ", source: ");
            *((_DWORD *)v66 + 6) = v13;
            if (!v13)
            {
              int v14 = (*(char *)(a1 + 282) - 1) > 4
                  ? mdns_string_builder_append_formatted(v7, "«INVALID %u»")
                  : mdns_string_builder_append_formatted(v7, "%s");
              *((_DWORD *)v66 + 6) = v14;
              if (!v14)
              {
                int v15 = mdns_string_builder_append_formatted(v7, ", scope: ");
                *((_DWORD *)v66 + 6) = v15;
                if (!v15)
                {
                  switch(*(unsigned char *)(a1 + 280))
                  {
                    case 1:
                      int v16 = mdns_string_builder_append_formatted(v7, "none", v58);
                      goto LABEL_27;
                    case 2:
                      int v16 = mdns_string_builder_append_formatted(v7, "interface", v58);
                      goto LABEL_27;
                    case 3:
                      int v16 = mdns_string_builder_append_formatted(v7, "service (%u)");
                      goto LABEL_27;
                    case 4:
                      int v17 = mdns_string_builder_append_formatted(v7, "uuid");
                      *((_DWORD *)v66 + 6) = v17;
                      if (v17) {
                        goto LABEL_32;
                      }
                      if (a3) {
                        goto LABEL_28;
                      }
                      *(void *)uu = 0;
                      uint64_t v71 = 0;
                      nw_resolver_config_get_identifier();
                      memset(out, 0, 37);
                      uuid_unparse(uu, out);
                      int v18 = mdns_string_builder_append_formatted(v7, " (%s)", out);
                      uint64_t v12 = 0;
                      *((_DWORD *)v66 + 6) = v18;
                      if (!v18) {
                        goto LABEL_28;
                      }
                      goto LABEL_33;
                    case 5:
                      int v16 = mdns_string_builder_append_formatted(v7, "none+interface");
                      goto LABEL_27;
                    default:
                      int v16 = mdns_string_builder_append_formatted(v7, "«INVALID %d»");
LABEL_27:
                      *((_DWORD *)v66 + 6) = v16;
                      if (v16) {
                        goto LABEL_32;
                      }
LABEL_28:
                      uint64_t v19 = *(const char **)(a1 + 104);
                      if (!v19) {
                        uint64_t v19 = "";
                      }
                      int v20 = mdns_string_builder_append_formatted(v7, ", interface: %s/%u", v19, *(_DWORD *)(a1 + 256));
                      *((_DWORD *)v66 + 6) = v20;
                      if (v20) {
                        goto LABEL_32;
                      }
                      int v21 = mdns_string_builder_append_formatted(v7, ", servers: {");
                      *((_DWORD *)v66 + 6) = v21;
                      if (v21) {
                        goto LABEL_32;
                      }
                      v62[3] = 0;
                      CFArrayRef v23 = *(const __CFArray **)(a1 + 80);
                      if (v23)
                      {
                        v59[0] = MEMORY[0x263EF8330];
                        v59[1] = 0x40000000;
                        v59[2] = ___mdns_dns_service_copy_description_block_invoke;
                        v59[3] = &unk_264D06410;
                        v59[4] = &v65;
                        v59[5] = &v61;
                        v59[6] = v7;
                        char v60 = a3;
                        mdns_cfarray_enumerate(v23, (uint64_t)v59);
                        if (*((_DWORD *)v66 + 6)) {
                          goto LABEL_32;
                        }
                      }
                      int v24 = mdns_string_builder_append_formatted(v7, "}");
                      *((_DWORD *)v66 + 6) = v24;
                      if (v24) {
                        goto LABEL_32;
                      }
                      int v25 = mdns_string_builder_append_formatted(v7, ", domains: {");
                      *((_DWORD *)v66 + 6) = v25;
                      if (v25) {
                        goto LABEL_32;
                      }
                      v62[3] = 0;
                      uint64_t v26 = *(void *)(a1 + 136);
                      if (!v26) {
                        uint64_t v26 = a1;
                      }
                      long long v27 = *(void **)(v26 + 88);
                      if (!v27) {
                        goto LABEL_45;
                      }
                      size_t v28 = 0;
                      break;
                  }
                  while (1)
                  {
                    int v29 = mdns_string_builder_append_description_with_prefix(v7, v28, v27[1], a3);
                    *((_DWORD *)v66 + 6) = v29;
                    if (v29) {
                      break;
                    }
                    v62[3] = (uint64_t)", ";
                    long long v27 = (void *)*v27;
                    size_t v28 = ", ";
                    if (!v27)
                    {
LABEL_45:
                      int v30 = mdns_string_builder_append_formatted(v7, "}");
                      *((_DWORD *)v66 + 6) = v30;
                      if (!v30)
                      {
                        int v31 = mdns_string_builder_append_formatted(v7, ", attributes: {");
                        *((_DWORD *)v66 + 6) = v31;
                        if (!v31)
                        {
                          uint64_t v32 = 0;
                          long long v33 = v62;
                          v62[3] = (uint64_t)"";
                          do
                          {
                            if (((uint64_t)(&off_264D06430)[v32 + 1] & *(_WORD *)(a1 + 276)) != 0)
                            {
                              int v34 = mdns_string_builder_append_formatted(v7, "%s%s", (const char *)v33[3], (&off_264D06430)[v32]);
                              *((_DWORD *)v66 + 6) = v34;
                              if (v34) {
                                goto LABEL_32;
                              }
                              long long v33 = v62;
                              v62[3] = (uint64_t)", ";
                            }
                            v32 += 2;
                          }
                          while (v32 != 14);
                          if (*(void *)(a1 + 96) && nw_resolver_config_get_allow_failover())
                          {
                            int v35 = mdns_string_builder_append_formatted(v7, "%sallows-failover", (const char *)v62[3]);
                            *((_DWORD *)v66 + 6) = v35;
                            if (v35) {
                              break;
                            }
                            v62[3] = (uint64_t)", ";
                          }
                          if (!*(void *)(a1 + 240)
                            || !*(void *)(a1 + 248)
                            || (int v36 = mdns_string_builder_append_formatted(v7, "%sreports-push-connection-error", (const char *)v62[3]), (*((_DWORD *)v66 + 6) = v36) == 0))
                          {
                            int v37 = mdns_string_builder_append_formatted(v7, "}");
                            *((_DWORD *)v66 + 6) = v37;
                            if (!v37)
                            {
                              int v38 = mdns_string_builder_append_formatted(v7, ", interface properties: {");
                              *((_DWORD *)v66 + 6) = v38;
                              if (!v38)
                              {
                                uint64_t v39 = 0;
                                long long v40 = v62;
                                v62[3] = (uint64_t)"";
                                do
                                {
                                  if (((uint64_t)(&off_264D064A0)[v39 + 1] & *(_WORD *)(a1 + 276)) != 0)
                                  {
                                    int v41 = mdns_string_builder_append_formatted(v7, "%s%s", (const char *)v40[3], (&off_264D064A0)[v39]);
                                    *((_DWORD *)v66 + 6) = v41;
                                    if (v41) {
                                      goto LABEL_32;
                                    }
                                    long long v40 = v62;
                                    v62[3] = (uint64_t)", ";
                                  }
                                  v39 += 2;
                                }
                                while (v39 != 16);
                                int v42 = mdns_string_builder_append_formatted(v7, "}");
                                *((_DWORD *)v66 + 6) = v42;
                                if (!v42)
                                {
                                  if (!*(void *)(a1 + 96)) {
                                    goto LABEL_100;
                                  }
                                  int v43 = mdns_string_builder_append_formatted(v7, ", resolver config: {");
                                  *((_DWORD *)v66 + 6) = v43;
                                  if (!v43)
                                  {
                                    int v44 = mdns_string_builder_append_formatted(v7, "provider name: ");
                                    *((_DWORD *)v66 + 6) = v44;
                                    if (!v44)
                                    {
                                      provider_name_cstr = _mdns_dns_service_get_provider_name_cstr(a1);
                                      if (!provider_name_cstr) {
                                        goto LABEL_102;
                                      }
                                      v46 = provider_name_cstr;
                                      if (a3)
                                      {
                                        if ((int)DNSMessagePrintObfuscatedString((uint64_t)out, 64, provider_name_cstr) < 0)v46 = "«REDACTED»"; {
                                        else
                                        }
                                          v46 = out;
                                      }
                                      int v47 = mdns_string_builder_append_formatted(v7, "%s", v46);
                                      *((_DWORD *)v66 + 6) = v47;
                                      if (!v47)
                                      {
LABEL_102:
                                        int v48 = mdns_string_builder_append_formatted(v7, ", provider path: ");
                                        *((_DWORD *)v66 + 6) = v48;
                                        if (!v48)
                                        {
                                          uint64_t v49 = *(void *)(a1 + 136);
                                          if (!v49 || !*(void *)(v49 + 96)) {
                                            uint64_t v49 = a1;
                                          }
                                          v50 = *(char **)(v49 + 168);
                                          if (!v50) {
                                            goto LABEL_101;
                                          }
                                          if (a3)
                                          {
                                            if ((int)DNSMessagePrintObfuscatedString((uint64_t)out, 64, v50) < 0) {
                                              v50 = "«REDACTED»";
                                            }
                                            else {
                                              v50 = out;
                                            }
                                          }
                                          int v51 = mdns_string_builder_append_formatted(v7, "%s", v50);
                                          *((_DWORD *)v66 + 6) = v51;
                                          if (!v51)
                                          {
LABEL_101:
                                            int v52 = mdns_string_builder_append_formatted(v7, "}");
                                            *((_DWORD *)v66 + 6) = v52;
                                            if (!v52)
                                            {
LABEL_100:
                                              if (!*(void *)(a1 + 176)
                                                || (int v53 = mdns_string_builder_append_formatted(v7, ", connection hostname: %s", *(const char **)(a1 + 176)), (*((_DWORD *)v66 + 6) = v53) == 0))
                                              {
                                                if (!*(_WORD *)(a1 + 278)
                                                  || (int v54 = mdns_string_builder_append_formatted(v7, ", port: %d", *(unsigned __int16 *)(a1 + 278)), (*((_DWORD *)v66 + 6) = v54) == 0))
                                                {
                                                  uint64_t v55 = *(void *)(a1 + 216);
                                                  if (!v55
                                                    || (int v56 = mdns_string_builder_append_formatted(v7, ", SRV name: %s", *(const char **)(v55 + 40)), (*((_DWORD *)v66 + 6) = v56) == 0))
                                                  {
                                                    int v57 = *(void *)(a1 + 136)
                                                        ? mdns_string_builder_append_formatted(v7, ", parent: %llu")
                                                        : mdns_string_builder_append_formatted(v7, ", use count: %d");
                                                    *((_DWORD *)v66 + 6) = v57;
                                                    if (!v57)
                                                    {
                                                      uint64_t v12 = mdns_string_builder_copy_string((uint64_t)v7);
                                                      goto LABEL_33;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      break;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_32:
    uint64_t v12 = 0;
LABEL_33:
    os_release(v7);
  }
  else
  {
    uint64_t v12 = 0;
  }
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  return v12;
}

BOOL ___mdns_dns_service_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

char *_mdns_dns_service_get_provider_name_cstr(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if (!v1 || !*(void *)(v1 + 96)) {
    uint64_t v1 = a1;
  }
  uint64_t result = *(char **)(v1 + 160);
  if (result) {
    return (char *)xpc_string_get_string_ptr(result);
  }
  return result;
}

uint64_t mdns_dns_service_manager_create(NSObject *a1, int *a2)
{
  int v4 = (void *)_os_object_alloc();
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    int v6 = &_mdns_dns_service_manager_kind;
    v4[2] = &_mdns_dns_service_manager_kind;
    do
    {
      uint64_t v7 = (void (*)(uint64_t))v6[2];
      if (v7) {
        v7(v5);
      }
      int v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    if (_mdns_dns_service_manager_enumerate_all_service_array_pointers(v5, (uint64_t)&__block_literal_global_141)&& (CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks), (*(void *)(v5 + 80) = Mutable) != 0))
    {
      *(void *)(v5 + 88) = a1;
      dispatch_retain(a1);
      int v4 = 0;
      int v9 = 0;
    }
    else
    {
      int v9 = -6729;
      int v4 = (void *)v5;
      uint64_t v5 = 0;
    }
  }
  else
  {
    int v9 = -6728;
  }
  if (a2) {
    *a2 = v9;
  }
  if (v4) {
    os_release(v4);
  }
  return v5;
}

BOOL __mdns_dns_service_manager_create_block_invoke(uint64_t a1, CFMutableArrayRef *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
  *a2 = Mutable;
  return Mutable != 0;
}

uint64_t mdns_dns_service_manager_set_report_symptoms(uint64_t result, char a2)
{
  if (!*(unsigned char *)(result + 132)) {
    *(unsigned char *)(result + 128) = a2;
  }
  return result;
}

uint64_t ___mdns_os_variant_has_internal_diagnostics_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  _mdns_os_variant_has_internal_diagnostics_s_uint64_t result = result;
  return result;
}

uint64_t mdns_dns_service_manager_enable_problematic_qtype_workaround(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 132)) {
    *(_DWORD *)(result + 120) = a2;
  }
  return result;
}

void mdns_dns_service_manager_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 132))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    int v4 = *(const void **)(a1 + 104);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 104) = v3;
  }
}

void mdns_dns_service_manager_activate(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 132))
  {
    *(unsigned char *)(a1 + 132) = 1;
    if (_mdns_dns_service_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __mdns_dns_service_manager_activate_block_invoke;
    block[3] = &__block_descriptor_tmp_4;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  }
}

void __mdns_dns_service_manager_activate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 131) && !*(void *)(v1 + 96))
  {
    dispatch_source_t v2 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, *(dispatch_queue_t *)(v1 + 88));
    *(void *)(v1 + 96) = v2;
    if (v2)
    {
      os_retain((void *)v1);
      uint64_t v3 = *(NSObject **)(v1 + 96);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_dns_service_manager_activate_internal_block_invoke;
      handler[3] = &__block_descriptor_tmp_5_145;
      handler[4] = v1;
      dispatch_source_set_event_handler(v3, handler);
      int v4 = *(NSObject **)(v1 + 96);
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 0x40000000;
      v5[2] = ___mdns_dns_service_manager_activate_internal_block_invoke_2;
      v5[3] = &__block_descriptor_tmp_6_146;
      v5[4] = v1;
      dispatch_source_set_cancel_handler(v4, v5);
      dispatch_activate(*(dispatch_object_t *)(v1 + 96));
    }
    else
    {
      _mdns_dns_service_manager_terminate(v1, -6729);
    }
  }
}

uint64_t ___mdns_dns_service_manager_activate_internal_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 104);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 3, 0);
  }
  return result;
}

void ___mdns_dns_service_manager_activate_internal_block_invoke_2(uint64_t a1)
{
}

void _mdns_dns_service_manager_terminate(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 130))
  {
    *(unsigned char *)(a1 + 131) = 1;
    int v4 = *(NSObject **)(a1 + 96);
    if (v4)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
      dispatch_release(v4);
      *(void *)(a1 + 96) = 0;
    }
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), i);
        mdns_interface_monitor_invalidate(ValueAtIndex);
      }
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 80));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    v13[2] = ___mdns_dns_service_manager_terminate_block_invoke;
    v13[3] = &__block_descriptor_tmp_117;
    v13[4] = a1;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 0x40000000;
    _DWORD v14[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v14[3] = &unk_264D06750;
    v14[4] = v13;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(a1, (uint64_t)v14);
    int v9 = *(void **)(a1 + 112);
    if (v9)
    {
      mdns_system_remove_network_policy(v9);
      *(void *)(a1 + 112) = 0;
    }
    os_retain((void *)a1);
    int v10 = *(NSObject **)(a1 + 88);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    void v11[2] = ___mdns_dns_service_manager_terminate_block_invoke_2;
    v11[3] = &__block_descriptor_tmp_118;
    v11[4] = a1;
    int v12 = a2;
    dispatch_async(v10, v11);
  }
}

uint64_t ___mdns_dns_service_manager_terminate_block_invoke(uint64_t a1, const __CFArray *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___mdns_dns_service_manager_terminate_services_block_invoke;
  v5[3] = &__block_descriptor_tmp_119;
  v5[4] = v3;
  mdns_cfarray_enumerate(a2, (uint64_t)v5);
  CFArrayRemoveAllValues(a2);
  return 1;
}

void ___mdns_dns_service_manager_terminate_block_invoke_2(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[13];
  if (v3)
  {
    if (*(_DWORD *)(a1 + 40)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    (*(void (**)(void, uint64_t))(v3 + 16))(v2[13], v4);
    dispatch_source_t v2 = *(void **)(a1 + 32);
  }

  os_release(v2);
}

uint64_t ___mdns_dns_service_manager_terminate_services_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

void _mdns_dns_service_manager_terminate_service(uint64_t a1, uint64_t a2)
{
  _mdns_dns_service_clear_use_count(a2);
  _mdns_dns_service_make_defunct(a2);
  if (*(void *)(a2 + 96) && *(unsigned char *)(a2 + 284))
  {
    *(unsigned char *)(a2 + 284) = 0;
    _mdns_dns_service_manager_cancel_resolver_config_updates();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 0x40000000;
  v10[2] = ___mdns_dns_service_manager_terminate_service_block_invoke;
  v10[3] = &__block_descriptor_tmp_130;
  v10[4] = a1;
  CFArrayRef v4 = *(const __CFArray **)(a2 + 128);
  if (v4)
  {
    mdns_cfarray_enumerate(v4, (uint64_t)v10);
    uint64_t v5 = *(const void **)(a2 + 128);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a2 + 128) = 0;
    }
  }
  CFArrayRef v6 = *(const __CFArray **)(a2 + 144);
  if (v6)
  {
    mdns_cfarray_enumerate(v6, (uint64_t)v10);
    uint64_t v7 = *(const void **)(a2 + 144);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a2 + 144) = 0;
    }
  }
  CFArrayRef v8 = *(const __CFArray **)(a2 + 152);
  if (v8)
  {
    mdns_cfarray_enumerate(v8, (uint64_t)v10);
    int v9 = *(const void **)(a2 + 152);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(a2 + 152) = 0;
    }
  }
}

void _mdns_dns_service_clear_use_count(uint64_t a1)
{
  dispatch_source_t v2 = *(NSObject **)(a1 + 224);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 224));
    dispatch_release(v2);
    *(void *)(a1 + 224) = 0;
  }
  *(_DWORD *)(a1 + 264) = 0;
}

void _mdns_dns_service_make_defunct(uint64_t a1)
{
  *(_WORD *)(a1 + 276) |= 1u;
  dispatch_source_t v2 = *(NSObject **)(a1 + 200);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 200));
    dispatch_release(v2);
    *(void *)(a1 + 200) = 0;
  }
  _mdns_dns_service_forget_all_ddr_queriers(a1);
  if (*(void *)(a1 + 208))
  {
    nw_array_apply();
    uint64_t v3 = *(void **)(a1 + 208);
    if (v3)
    {
      nw_release(v3);
      *(void *)(a1 + 208) = 0;
    }
  }
  CFArrayRef v4 = *(void **)(a1 + 64);
  if (v4)
  {
    mdns_resolver_invalidate(v4);
    os_release(*(void **)(a1 + 64));
    *(void *)(a1 + 64) = 0;
  }
  uint64_t v5 = *(unsigned char **)(a1 + 72);
  if (v5)
  {
    v5[103] = 1;
    os_retain(v5);
    if (_mdns_push_notifications_queue_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_36);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __mdns_push_server_invalidate_block_invoke;
    block[3] = &__block_descriptor_tmp_2_76;
    block[4] = v5;
    dispatch_async((dispatch_queue_t)_mdns_push_notifications_queue_s_queue, block);
    os_release(*(void **)(a1 + 72));
    *(void *)(a1 + 72) = 0;
  }
  CFArrayRef v6 = *(NSObject **)(a1 + 240);
  if (v6)
  {
    dispatch_release(v6);
    *(void *)(a1 + 240) = 0;
  }
  uint64_t v7 = *(const void **)(a1 + 248);
  if (v7)
  {
    _Block_release(v7);
    *(void *)(a1 + 248) = 0;
  }
}

uint64_t _mdns_dns_service_manager_cancel_resolver_config_updates()
{
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  return nw_resolver_config_cancel_updates();
}

uint64_t ___mdns_dns_service_manager_terminate_service_block_invoke(uint64_t a1)
{
  return 1;
}

void ___mdns_dns_service_manager_cancel_resolver_config_updates_block_invoke(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
  dispatch_source_t v2 = *(void **)(a1 + 40);

  nw_release(v2);
}

void _mdns_dns_service_forget_all_ddr_queriers(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 184);
  if (v2)
  {
    mdns_client_invalidate(v2);
    os_release(*(void **)(a1 + 184));
    *(void *)(a1 + 184) = 0;
  }
  CFArrayRef v3 = *(const __CFArray **)(a1 + 192);
  if (v3)
  {
    mdns_cfarray_enumerate(v3, (uint64_t)&__block_literal_global_134);
    CFArrayRef v4 = *(__CFArray **)(a1 + 192);
    CFArrayRemoveAllValues(v4);
  }
}

uint64_t ___mdns_dns_service_forget_all_ddr_connections_block_invoke(int a1, int a2, nw_connection_t connection)
{
  return 1;
}

uint64_t ___mdns_dns_service_forget_all_ddr_queriers_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

dispatch_queue_t ___mdns_dns_service_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.dns-service-queue", 0);
  _mdns_dns_service_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t mdns_dns_service_manager_register_native_service(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_register_native_service_block_invoke;
  v8[3] = &unk_264D05A48;
  v8[4] = &v9;
  v8[5] = &v13;
  v8[6] = a1;
  v8[7] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  if (a3) {
    *a3 = *((_DWORD *)v14 + 6);
  }
  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

void __mdns_dns_service_manager_register_native_service_block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 131))
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = 0;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6752;
    return;
  }
  CFArrayRef v3 = *(__CFArray **)(v2 + 24);
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v22 = 0;
  CFArrayRef v23 = &v22;
  uint64_t v24 = 0x2000000000;
  int v25 = 0;
  unsigned int v6 = *(_DWORD *)(v4 + 48);
  unsigned int v7 = *(unsigned __int8 *)(v4 + 52);
  if (*(unsigned char *)(v4 + 52)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 || v7 > 2)
  {
    uint64_t v10 = 0;
    int v11 = -6705;
LABEL_25:
    *((_DWORD *)v23 + 6) = v11;
    goto LABEL_26;
  }
  uint64_t v12 = _mdns_dns_service_create(1, 1, (0x50201u >> (8 * v7)) & 7, &v25);
  uint64_t v10 = v12;
  if (v12)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 0x40000000;
    long long v27 = ___mdns_dns_service_create_native_source_service_from_definition_block_invoke;
    size_t v28 = &unk_264D05D98;
    int v29 = &v22;
    uint64_t v30 = v12;
    mdns_cfarray_enumerate(*(const __CFArray **)(v4 + 24), (uint64_t)&buf);
    int v13 = *((_DWORD *)v23 + 6);
    if (v13) {
      goto LABEL_40;
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 0x40000000;
    v21[2] = ___mdns_dns_service_create_native_source_service_from_definition_block_invoke_2;
    v21[3] = &unk_264D05DC0;
    v21[4] = &v22;
    v21[5] = v10;
    mdns_cfset_enumerate(*(const __CFSet **)(v4 + 32), (uint64_t)v21);
    int v13 = *((_DWORD *)v23 + 6);
    if (v13)
    {
LABEL_40:
      os_release((void *)v10);
      _Block_object_dispose(&v22, 8);
      uint64_t v18 = 0;
      *(_DWORD *)(v5 + 24) = v13;
      goto LABEL_35;
    }
    *(_DWORD *)(v10 + 256) = v6;
    if (v6) {
      *(void *)(v10 + 104) = mdns_system_interface_index_to_name(v6);
    }
    *(_WORD *)(v10 + 276) = 6;
    int v14 = *(unsigned __int8 *)(v4 + 53);
    if (*(unsigned char *)(v4 + 53)) {
      __int16 v15 = 8198;
    }
    else {
      __int16 v15 = 6;
    }
    *(_WORD *)(v10 + 276) = v15;
    if (*(unsigned char *)(v4 + 54))
    {
      int v11 = 0;
      if (v14) {
        __int16 v16 = 24582;
      }
      else {
        __int16 v16 = 16390;
      }
      *(_WORD *)(v10 + 276) = v16;
    }
    else
    {
      int v11 = 0;
    }
    goto LABEL_25;
  }
  int v11 = *((_DWORD *)v23 + 6);
LABEL_26:
  _Block_object_dispose(&v22, 8);
  if (!v11)
  {
    _mdns_dns_service_increment_use_count(v10);
    CFArrayAppendValue(v3, (const void *)v10);
    _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v2, v10);
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v19 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_23814D000, v19, OS_LOG_TYPE_DEFAULT, "Registered native service -- %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v17 = *(void *)(v10 + 24);
    *(_DWORD *)(v5 + 24) = 0;
    goto LABEL_34;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  *(_DWORD *)(v5 + 24) = v11;
  if (v10)
  {
LABEL_34:
    os_release((void *)v10);
    uint64_t v18 = v17;
  }
LABEL_35:
  *(void *)(*(void *)(a1[4] + 8) + 24) = v18;
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    int v20 = *(NSObject **)(a1[6] + 96);
    if (v20) {
      dispatch_source_merge_data(v20, 1uLL);
    }
  }
}

uint64_t _mdns_dns_service_create(char a1, char a2, char a3, int *a4)
{
  uint64_t v8 = _os_object_alloc();
  uint64_t v9 = v8;
  if (!v8)
  {
    int v12 = -6728;
    if (!a4) {
      return v9;
    }
    goto LABEL_7;
  }
  uint64_t v10 = &_mdns_dns_service_kind;
  *(void *)(v8 + 16) = &_mdns_dns_service_kind;
  do
  {
    int v11 = (void (*)(uint64_t))v10[2];
    if (v11) {
      v11(v9);
    }
    uint64_t v10 = (_UNKNOWN **)*v10;
  }
  while (v10);
  int v12 = 0;
  *(void *)(v9 + 24) = atomic_fetch_add_explicit(&_mdns_get_next_dns_service_id_s_next_id, 1uLL, memory_order_relaxed);
  *(unsigned char *)(v9 + 281) = a1;
  *(unsigned char *)(v9 + 282) = a2;
  *(unsigned char *)(v9 + 280) = a3;
  if (a4) {
LABEL_7:
  }
    *a4 = v12;
  return v9;
}

BOOL ___mdns_dns_service_create_native_source_service_from_definition_block_invoke(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _mdns_dns_service_append_address(*(void *)(a1 + 40), a2);
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_create_native_source_service_from_definition_block_invoke_2(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_increment_use_count(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 264);
  CFArrayRef v3 = *(NSObject **)(a1 + 224);
  if (v2 == 1)
  {
    if (!v3)
    {
      int v2 = 1;
      goto LABEL_7;
    }
    *(_DWORD *)(a1 + 264) = 0;
    goto LABEL_5;
  }
  if (v3)
  {
LABEL_5:
    dispatch_source_cancel(v3);
    dispatch_release(v3);
    *(void *)(a1 + 224) = 0;
    int v2 = *(_DWORD *)(a1 + 264);
  }
LABEL_7:
  uint64_t result = (v2 + 1);
  *(_DWORD *)(a1 + 264) = result;
  return result;
}

void _mdns_dns_service_manager_update_interface_properties_for_service(CFArrayRef *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v4 = *(_DWORD *)(a2 + 256);
  CFIndex Count = CFArrayGetCount(a1[10]);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1[10], v7);
      if (ValueAtIndex[34] == v4) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
    uint64_t v10 = (uint64_t)ValueAtIndex;
    goto LABEL_14;
  }
LABEL_5:
  uint64_t v9 = mdns_interface_monitor_create(v4);
  if (v9)
  {
    uint64_t v10 = v9;
    if (_mdns_dns_service_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
    }
    mdns_interface_monitor_set_queue(v10, (dispatch_object_t)_mdns_dns_service_queue_s_queue);
    os_retain(a1);
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = ___mdns_dns_service_manager_get_interface_monitor_block_invoke;
    uint64_t v19 = &__block_descriptor_tmp_58;
    int v20 = a1;
    uint64_t v21 = v10;
    mdns_interface_monitor_set_update_handler(v10, buf);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 0x40000000;
    v17[2] = ___mdns_dns_service_manager_get_interface_monitor_block_invoke_2;
    v17[3] = &__block_descriptor_tmp_60;
    v17[4] = v10;
    v17[5] = a1;
    mdns_interface_monitor_set_event_handler(v10, v17);
    if (!*(unsigned char *)(v10 + 154))
    {
      if (*(void *)(v10 + 32)) {
        _mdns_interface_monitor_activate_async((void *)v10);
      }
      *(unsigned char *)(v10 + 154) = 1;
    }
    CFArrayAppendValue(a1[10], (const void *)v10);
LABEL_14:
    __int16 v11 = *(_WORD *)(a2 + 276) & 0xF80F;
    *(_WORD *)(a2 + 276) = v11;
    int v12 = *(_DWORD *)(v10 + 144);
    __int16 v13 = v11 & 0xFF0F | (16 * (v12 & 0xF));
    if ((v12 & 0xF) != 0) {
      *(_WORD *)(a2 + 276) = v13;
    }
    if (*(unsigned char *)(a2 + 282) == 2 && *(_DWORD *)(a2 + 256) && (v12 & 0x10) != 0)
    {
      v13 |= 0x100u;
      *(_WORD *)(a2 + 276) = v13;
    }
    if ((v12 & 0x60) != 0) {
      *(_WORD *)(a2 + 276) = (16 * v12) & 0x600 | v13;
    }
    return;
  }
  if (_mdns_dns_service_log_s_once != -1) {
    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
  }
  int v14 = _mdns_dns_service_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
  {
    __int16 v15 = *(const char **)(a2 + 104);
    if (!v15) {
      __int16 v15 = "";
    }
    int v16 = *(_DWORD *)(a2 + 256);
    *(_DWORD *)long long buf = 136446466;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_error_impl(&dword_23814D000, v14, OS_LOG_TYPE_ERROR, "Failed to get interface monitor for interface %{public}s/%u", buf, 0x12u);
  }
}

os_log_t ___mdns_dns_service_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "dns_service");
  _mdns_dns_service_log_s_log = (uint64_t)result;
  return result;
}

void ___mdns_dns_service_manager_get_interface_monitor_block_invoke(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    CFArrayRef v3 = *(_DWORD **)(a1 + 40);
    v19.length = CFArrayGetCount(*(CFArrayRef *)(v4 + 80));
    v19.location = 0;
    if (CFArrayContainsValue(*(CFArrayRef *)(v4 + 80), v19, v3))
    {
      if (a2 < 0)
      {
        int v5 = v3[34];
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        CFIndex v6 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v5;
          _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_INFO, "Network change event for interface index %u", buf, 8u);
        }
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 0x40000000;
        void v11[2] = ___mdns_dns_service_manager_handle_network_change_event_block_invoke;
        v11[3] = &__block_descriptor_tmp_61;
        int v12 = v5;
        CFArrayRef v7 = *(const __CFArray **)(v4 + 40);
        *(void *)long long buf = MEMORY[0x263EF8330];
        uint64_t v14 = 0x40000000;
        __int16 v15 = ___mdns_dns_service_manager_enumerate_service_array_including_variants_block_invoke;
        int v16 = &unk_264D05E68;
        uint64_t v17 = v11;
        mdns_cfarray_enumerate(v7, (uint64_t)buf);
        CFArrayRef v8 = *(const __CFArray **)(v4 + 56);
        *(void *)long long buf = MEMORY[0x263EF8330];
        uint64_t v14 = 0x40000000;
        __int16 v15 = ___mdns_dns_service_manager_enumerate_service_array_including_variants_block_invoke;
        int v16 = &unk_264D05E68;
        uint64_t v17 = v11;
        mdns_cfarray_enumerate(v8, (uint64_t)buf);
        CFArrayRef v9 = *(const __CFArray **)(v4 + 48);
        *(void *)long long buf = MEMORY[0x263EF8330];
        uint64_t v14 = 0x40000000;
        __int16 v15 = ___mdns_dns_service_manager_handle_network_change_event_block_invoke_2;
        int v16 = &__block_descriptor_tmp_62;
        LODWORD(v17) = v5;
        mdns_cfarray_enumerate(v9, (uint64_t)buf);
      }
      uint64_t v10 = *(NSObject **)(v4 + 96);
      if (v10) {
        dispatch_source_merge_data(v10, 1uLL);
      }
    }
  }
}

void ___mdns_dns_service_manager_get_interface_monitor_block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    v7.length = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 80));
    v7.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(*(void *)(a1 + 40) + 80), v7, *(const void **)(a1 + 32));
    if ((FirstIndexOfValue & 0x8000000000000000) == 0) {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(void *)(a1 + 40) + 80), FirstIndexOfValue);
    }
    int v5 = *(void **)(a1 + 32);
    mdns_interface_monitor_invalidate(v5);
  }
  else if (a2 == 2)
  {
    os_release(*(void **)(a1 + 32));
    CFArrayRef v3 = *(void **)(a1 + 40);
    os_release(v3);
  }
}

uint64_t ___mdns_dns_service_manager_handle_network_change_event_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 256) == *(_DWORD *)(a1 + 32)) {
    *(unsigned char *)(a2 + 286) = 1;
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_enumerate_service_array_including_variants_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    CFArrayRef v5 = *(const __CFArray **)(a2 + 128);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      return mdns_cfarray_enumerate(v5, v6);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t ___mdns_dns_service_manager_handle_network_change_event_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 256) == *(_DWORD *)(a1 + 32)) {
    *(_DWORD *)(a2 + 264) = 0;
  }
  return 1;
}

void _mdns_dns_service_add_domain(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v6 = malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6[1] = a2;
    os_retain(a2);
    *(_DWORD *)(v7 + 16) = a3;
    uint64_t v8 = a1 + 88;
    do
    {
      CFArrayRef v9 = (void *)v8;
      uint64_t v8 = *(void *)v8;
      if (!v8) {
        goto LABEL_6;
      }
      int v10 = _domain_item_compare(v7, v8, 1);
    }
    while (v10 > 0);
    if (v10)
    {
LABEL_6:
      *(void *)uint64_t v7 = v8;
      void *v9 = v7;
      return;
    }
    if (*(_DWORD *)(v8 + 16) > a3) {
      *(_DWORD *)(v8 + 16) = a3;
    }
    _domain_item_free((void *)v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t _mdns_dns_service_append_address(uint64_t a1, void *value)
{
  CFMutableArrayRef Mutable = *(__CFArray **)(a1 + 80);
  if (!Mutable)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
    *(void *)(a1 + 80) = Mutable;
    if (!Mutable) {
      return 4294960567;
    }
  }
  CFArrayAppendValue(Mutable, value);
  return 0;
}

void mdns_dns_service_manager_deregister_native_service(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (_mdns_dns_service_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
    }
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = __mdns_dns_service_manager_deregister_native_service_block_invoke;
    v4[3] = &__block_descriptor_tmp_8_151;
    v4[4] = a1;
    void v4[5] = a2;
    dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
  }
}

void __mdns_dns_service_manager_deregister_native_service_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 131))
  {
    uint64_t service_by_id = _mdns_dns_service_manager_get_service_by_id(*(const __CFArray **)(v1 + 24), *(void *)(a1 + 40));
    if (service_by_id)
    {
      _mdns_dns_service_manager_deregister_service(v1, service_by_id);
    }
  }
}

uint64_t _mdns_dns_service_manager_get_service_by_id(const __CFArray *a1, uint64_t a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_manager_get_service_by_id_block_invoke;
  v4[3] = &unk_264D06238;
  v4[4] = &v5;
  void v4[5] = a2;
  mdns_cfarray_enumerate(a1, (uint64_t)v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _mdns_dns_service_manager_deregister_service(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a2 + 264) - 1;
  *(_DWORD *)(a2 + 264) = v2;
  if (!v2)
  {
    unsigned int v5 = *(_DWORD *)(a2 + 272);
    if (!v5) {
      goto LABEL_13;
    }
    if (_mdns_dns_service_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
    }
    oneshot_monotonic_timer = mdns_dispatch_create_oneshot_monotonic_timer(v5, 5u, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
    *(void *)(a2 + 224) = oneshot_monotonic_timer;
    int v7 = *(_DWORD *)(a2 + 264);
    if (oneshot_monotonic_timer)
    {
      *(_DWORD *)(a2 + 264) = v7 + 1;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 0x40000000;
      _DWORD v14[2] = ___mdns_dns_service_decrement_use_count_block_invoke;
      v14[3] = &__block_descriptor_tmp_76;
      v14[4] = a2;
      void v14[5] = a1;
      dispatch_source_set_event_handler(oneshot_monotonic_timer, v14);
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v8 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a2 + 24);
        int v10 = *(_DWORD *)(a2 + 272);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v16 = v9;
        __int16 v17 = 1024;
        int v18 = v10;
        _os_log_impl(&dword_23814D000, v8, OS_LOG_TYPE_INFO, "Keeping orphaned DNS service %llu for up to %u milliseconds", buf, 0x12u);
      }
      dispatch_activate(*(dispatch_object_t *)(a2 + 224));
      int v7 = *(_DWORD *)(a2 + 264);
    }
    if (!v7)
    {
LABEL_13:
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      __int16 v11 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a2 + 24);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v16 = v12;
        _os_log_impl(&dword_23814D000, v11, OS_LOG_TYPE_INFO, "Deregistered DNS service -- service id: %llu", buf, 0xCu);
      }
      __int16 v13 = *(NSObject **)(a1 + 96);
      if (v13) {
        dispatch_source_merge_data(v13, 1uLL);
      }
    }
  }
}

void ___mdns_dns_service_decrement_use_count_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 224))
  {
    _mdns_dns_service_clear_use_count(v2);
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    CFArrayRef v3 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_23814D000, v3, OS_LOG_TYPE_INFO, "Deregistered orphaned DNS service due to timeout -- service id: %llu", (uint8_t *)&v6, 0xCu);
    }
    unsigned int v5 = *(NSObject **)(*(void *)(a1 + 40) + 96);
    if (v5) {
      dispatch_source_merge_data(v5, 1uLL);
    }
  }
}

BOOL ___mdns_dns_service_manager_get_service_by_id_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 24) == *(void *)(a1 + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void mdns_dns_service_manager_apply_dns_config(uint64_t a1, uint64_t a2)
{
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __mdns_dns_service_manager_apply_dns_config_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_154;
  v4[4] = a1;
  void v4[5] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
}

void __mdns_dns_service_manager_apply_dns_config_block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 131)) {
    return;
  }
  uint64_t v2 = *(unsigned int **)(a1 + 40);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 48));
  if (Count > 3)
  {
    CFIndex v5 = Count;
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    int v6 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_DEFAULT, "Purging %u discovered services down to 4", buf, 8u);
    }
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
    MutableCopy = CFArrayCreateMutableCopy(v4, 0, *(CFArrayRef *)(v1 + 48));
    v33.location = 0;
    v33.length = v5;
    CFArraySortValues(MutableCopy, v33, (CFComparatorFunction)_mdns_dns_service_compare_time, 0);
    for (unint64_t i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, i);
      if (i < 4) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
      else {
        _mdns_dns_service_manager_terminate_service(v1, (uint64_t)ValueAtIndex);
      }
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    __int16 v11 = *(const void **)(v1 + 48);
    if (v11) {
      CFRelease(v11);
    }
    *(void *)(v1 + 48) = Mutable;
  }
  else
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  }
  CFArrayRef v12 = CFArrayCreateMutable(v4, 0, &mdns_cfarray_callbacks);
  if (!v12)
  {
    int v24 = -6729;
    goto LABEL_36;
  }
  CFArrayRef v13 = v12;
  int appended = _mdns_append_dns_service_from_config_by_scope(v12, v2, 1);
  if (appended
    || (int appended = _mdns_append_dns_service_from_config_by_scope(v13, v2, 2)) != 0
    || (int appended = _mdns_append_dns_service_from_config_by_scope(v13, v2, 3)) != 0)
  {
    int v24 = appended;
    CFRelease(v13);
LABEL_36:
    _mdns_dns_service_manager_terminate(v1, v24);
    return;
  }
  CFIndex v15 = CFArrayGetCount(v13);
  CFIndex v16 = CFArrayGetCount(*(CFArrayRef *)(v1 + 32));
  if (v16 - 1 >= 0)
  {
    uint64_t v17 = v16;
    do
    {
      int v18 = (const __CFArray **)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 32), --v17);
      v34.location = 0;
      v34.length = v15;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v13, v34, v18);
      if (FirstIndexOfValue < 0)
      {
        _mdns_dns_service_manager_terminate_service(v1, (uint64_t)v18);
      }
      else
      {
        CFIndex v20 = FirstIndexOfValue;
        __int16 v21 = *((_WORD *)CFArrayGetValueAtIndex(v13, FirstIndexOfValue) + 138) & 0xE;
        *((_WORD *)v18 + 138) = *((_WORD *)v18 + 138) & 0xFFF1 | v21;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 0x40000000;
        v25[2] = ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke;
        v25[3] = &__block_descriptor_tmp_69;
        __int16 v26 = v21;
        CFArrayRef v22 = v18[18];
        if (v22) {
          mdns_cfarray_enumerate(v22, (uint64_t)v25);
        }
        CFArraySetValueAtIndex(v13, v20, v18);
      }
    }
    while (v17 > 0);
  }
  CFArrayRef v23 = *(const void **)(v1 + 32);
  if (v23) {
    CFRelease(v23);
  }
  *(void *)(v1 + 32) = v13;
  *(void *)long long buf = MEMORY[0x263EF8330];
  uint64_t v28 = 0x40000000;
  int v29 = ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke_2;
  uint64_t v30 = &__block_descriptor_tmp_70;
  uint64_t v31 = v1;
  mdns_cfarray_enumerate(v13, (uint64_t)buf);
  _mdns_dns_service_manager_remove_unneeded_interface_monitors(v1);
}

uint64_t _mdns_append_dns_service_from_config_by_scope(const __CFArray *a1, unsigned int *a2, int a3)
{
  char v3 = a3;
  uint64_t v55 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 3:
      CFIndex v5 = (uint64_t *)(a2 + 9);
      a2 += 8;
      break;
    case 2:
      CFIndex v5 = (uint64_t *)(a2 + 4);
      a2 += 3;
      break;
    case 1:
      CFIndex v5 = (uint64_t *)(a2 + 1);
      break;
    default:
      return 0;
  }
  uint64_t v6 = *a2;
  if ((int)v6 < 1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *v5;
  unsigned int appended = 0;
  uint64_t v42 = v8;
  uint64_t v40 = v6;
  while (1)
  {
    uint64_t v9 = *(void *)(v8 + 8 * v7);
    if (*(_WORD *)(v9 + 20) == 5353 || !*(_DWORD *)(v9 + 8)) {
      goto LABEL_64;
    }
    int v10 = *(char **)v9;
    if (*(void *)v9)
    {
      buf[0] = 0;
      if (DomainNameAppendString(buf, v10, 0))
      {
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        __int16 v11 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = *(char **)v9;
          *(_DWORD *)int v44 = 136315138;
          *(void *)&v44[4] = v39;
          _os_log_error_impl(&dword_23814D000, v11, OS_LOG_TYPE_ERROR, "Encountered invalid dns_config_t resolver domain name: %s", v44, 0xCu);
        }
        uint64_t v8 = v42;
        goto LABEL_64;
      }
    }
    uint64_t v12 = _mdns_dns_service_create(1, 2, v3, (int *)&appended);
    uint64_t result = appended;
    if (appended) {
      goto LABEL_68;
    }
    int v14 = *(_DWORD *)(v9 + 8);
    if (v14 >= 1) {
      break;
    }
LABEL_40:
    *(_DWORD *)(v12 + 256) = *(_DWORD *)(v9 + 64);
    char v3 = a3;
    if (a3 == 3) {
      int v31 = *(_DWORD *)(v9 + 76);
    }
    else {
      int v31 = 0;
    }
    uint64_t v6 = v40;
    uint64_t v8 = v42;
    *(_DWORD *)(v12 + 260) = v31;
    *(_WORD *)(v12 + 276) = 0;
    if (*(void *)v9) {
      uint64_t v32 = *(char **)v9;
    }
    else {
      uint64_t v32 = ".";
    }
    CFIndex Count = CFArrayGetCount(a1);
    if (Count < 1)
    {
LABEL_51:
      int v37 = *(_DWORD *)(v9 + 68);
      if ((v37 & 2) != 0) {
        *(_WORD *)(v12 + 276) |= 2u;
      }
      if ((v37 & 4) != 0) {
        *(_WORD *)(v12 + 276) |= 4u;
      }
      if ((*(unsigned char *)(v9 + 74) & 4) != 0) {
        *(_WORD *)(v12 + 276) |= 8u;
      }
      unsigned int v38 = *(_DWORD *)(v12 + 256);
      if (v38) {
        *(void *)(v12 + 104) = mdns_system_interface_index_to_name(v38);
      }
      unsigned int appended = _mdns_dns_service_add_domain_by_string(v12, v32, *(_DWORD *)(v9 + 60));
      if (appended) {
        goto LABEL_69;
      }
      CFArrayAppendValue(a1, (const void *)v12);
    }
    else
    {
      CFIndex v34 = Count;
      CFIndex v35 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, v35);
        if (_mdns_dns_service_equal_ex((uint64_t)ValueAtIndex, v12, 1)) {
          break;
        }
        if (v34 == ++v35)
        {
          char v3 = a3;
          uint64_t v6 = v40;
          uint64_t v8 = v42;
          if (!v12) {
            goto LABEL_64;
          }
          goto LABEL_51;
        }
      }
      uint64_t result = _mdns_dns_service_add_domain_by_string((uint64_t)ValueAtIndex, v32, *(_DWORD *)(v9 + 60));
      unsigned int appended = result;
      if (result) {
        goto LABEL_68;
      }
      char v3 = a3;
      uint64_t v6 = v40;
      uint64_t v8 = v42;
      if (!v12) {
        goto LABEL_64;
      }
    }
    os_release((void *)v12);
LABEL_64:
    if (++v7 == v6) {
      return 0;
    }
  }
  uint64_t v15 = 0;
  unsigned int v16 = *(unsigned __int16 *)(v9 + 20);
  if (!*(_WORD *)(v9 + 20)) {
    unsigned int v16 = 53;
  }
  __int16 v17 = __rev16(v16);
  while (1)
  {
    uint64_t v18 = *(void *)(*(void *)(v9 + 12) + 8 * v15);
    int v19 = *(unsigned __int8 *)(v18 + 1);
    if (v19 == 30) {
      break;
    }
    if (v19 == 2)
    {
      int v20 = *(_DWORD *)(v18 + 4);
      uint64_t v21 = _mdns_address_new();
      if (!v21) {
        goto LABEL_67;
      }
      CFArrayRef v22 = (void *)v21;
      *(_WORD *)(v21 + 24) = 528;
      *(_WORD *)(v21 + 26) = v17;
      *(_DWORD *)(v21 + 28) = v20;
      goto LABEL_37;
    }
LABEL_39:
    if (++v15 >= v14) {
      goto LABEL_40;
    }
  }
  CFArrayRef v23 = (int *)(v18 + 24);
  int v24 = (uint8_t *)(v18 + 8);
  memset(v44, 0, sizeof(v44));
  int v46 = 0;
  uint64_t v45 = 0;
  if (*(unsigned __int8 *)(v18 + 8) == 254 && (*(unsigned char *)(v18 + 9) & 0xC0) == 0x80)
  {
    int v25 = *(_DWORD *)(v9 + 64);
    if (v25)
    {
      if (*v23 != v25)
      {
        *(_OWORD *)int v44 = *(_OWORD *)v18;
        uint64_t v45 = *(void *)(v18 + 16);
        int v46 = v25;
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        __int16 v26 = _mdns_dns_service_log_s_log;
        BOOL v27 = os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT);
        int v24 = &v44[8];
        CFArrayRef v23 = &v46;
        if (v27)
        {
          int v28 = *(_DWORD *)(v18 + 24);
          *(_DWORD *)long long buf = 68158466;
          int v48 = 28;
          __int16 v49 = 2096;
          uint64_t v50 = v18;
          __int16 v51 = 1024;
          int v52 = v28;
          __int16 v53 = 1024;
          int v54 = v25;
          _os_log_impl(&dword_23814D000, v26, OS_LOG_TYPE_DEFAULT, "Corrected scope ID of link-local server address %{network:sockaddr}.*P from %u to %u", buf, 0x1Eu);
          int v24 = &v44[8];
          CFArrayRef v23 = &v46;
        }
      }
    }
  }
  int v29 = *v23;
  uint64_t v30 = _mdns_address_new();
  if (v30)
  {
    CFArrayRef v22 = (void *)v30;
    *(_WORD *)(v30 + 24) = 7708;
    *(_WORD *)(v30 + 26) = v17;
    *(_OWORD *)(v30 + 32) = *(_OWORD *)v24;
    *(_DWORD *)(v30 + 48) = v29;
LABEL_37:
    unsigned int appended = _mdns_dns_service_append_address(v12, v22);
    os_release(v22);
    uint64_t result = appended;
    if (appended) {
      goto LABEL_68;
    }
    int v14 = *(_DWORD *)(v9 + 8);
    goto LABEL_39;
  }
LABEL_67:
  uint64_t result = 4294960568;
  unsigned int appended = -6728;
LABEL_68:
  if (v12)
  {
LABEL_69:
    os_release((void *)v12);
    return appended;
  }
  return result;
}

uint64_t ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke(uint64_t a1, uint64_t a2)
{
  __int16 v2 = *(_WORD *)(a2 + 276) & 0xFFF1;
  *(_WORD *)(a2 + 276) = v2;
  *(_WORD *)(a2 + 276) = *(_WORD *)(a1 + 32) | v2;
  return 1;
}

uint64_t ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 264))
  {
    _mdns_dns_service_increment_use_count(a2);
    _mdns_dns_service_manager_update_interface_properties_for_service(*(CFArrayRef **)(a1 + 32), a2);
  }
  return 1;
}

void _mdns_dns_service_manager_remove_unneeded_interface_monitors(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
  if (Count - 1 >= 0)
  {
    CFIndex v3 = Count;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), --v3);
      int v5 = ValueAtIndex[34];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 0x40000000;
      v6[2] = ___mdns_dns_service_manager_uses_interface_block_invoke;
      v6[3] = &__block_descriptor_tmp_125;
      int v7 = v5;
      if (_mdns_dns_service_manager_enumerate_all_services(a1, (uint64_t)v6))
      {
        mdns_interface_monitor_invalidate(ValueAtIndex);
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v3);
      }
    }
    while (v3 > 0);
  }
}

BOOL ___mdns_dns_service_manager_uses_interface_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a2 + 256) != *(_DWORD *)(a1 + 32);
}

uint64_t _mdns_dns_service_add_domain_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  unsigned int v8 = 0;
  int v5 = mdns_domain_name_create(a2, (uint64_t)a2, &v8);
  if (v5)
  {
    uint64_t v6 = v5;
    _mdns_dns_service_add_domain(a1, v5, a3);
    unsigned int v8 = 0;
    os_release(v6);
  }
  return v8;
}

uint64_t _mdns_dns_service_compare_time(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a2 + 32);
  BOOL v4 = v2 > v3;
  BOOL v5 = v2 < v3;
  if (v4) {
    return -1;
  }
  else {
    return v5;
  }
}

void mdns_dns_service_manager_register_path_resolver(uint64_t a1, uint64_t a2)
{
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __mdns_dns_service_manager_register_path_resolver_block_invoke;
  v4[3] = &__block_descriptor_tmp_13;
  v4[4] = a1;
  void v4[5] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
}

void __mdns_dns_service_manager_register_path_resolver_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 131))
  {
    unint64_t v2 = *(const unsigned __int8 **)(a1 + 40);
    uint64_t service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v1 + 40), v2);
    if (service_by_uuid)
    {
      uint64_t v10 = service_by_uuid;
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      __int16 v11 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(v10 + 24);
        *(_DWORD *)int v20 = 134218498;
        *(void *)&void v20[4] = v12;
        *(_WORD *)&v20[12] = 1040;
        *(_DWORD *)&v20[14] = 16;
        *(_WORD *)&v20[18] = 2096;
        *(void *)&v20[20] = v2;
        _os_log_debug_impl(&dword_23814D000, v11, OS_LOG_TYPE_DEBUG, "Already registered service -- service id: %llu, uuid: %{uuid_t}.16P", v20, 0x1Cu);
      }
    }
    else
    {
      BOOL v4 = (void *)nw_resolver_config_create();
      nw_resolver_config_set_identifier();
      os_retain((void *)v1);
      nw_retain(v4);
      if (_mdns_dns_service_queue_s_once != -1) {
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
      }
      *(void *)int v20 = MEMORY[0x263EF8330];
      *(void *)&v20[8] = 0x40000000;
      *(void *)&v20[16] = ___mdns_dns_service_manager_register_path_resolver_internal_block_invoke;
      *(void *)&v20[24] = &__block_descriptor_tmp_73;
      uint64_t v21 = v1;
      CFArrayRef v22 = v4;
      nw_resolver_config_watch_updates();
      int v13 = 0;
      BOOL v5 = _mdns_dns_service_create_from_resolver_config(v4, 3, 4, &v13);
      if (v5)
      {
        uint64_t v6 = v5;
        v5[284] = 1;
        int v7 = *(__CFArray **)(v1 + 40);
        _mdns_dns_service_increment_use_count((uint64_t)v5);
        CFArrayAppendValue(v7, v6);
        _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v1, (uint64_t)v6);
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        unsigned int v8 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v15 = v6;
          _os_log_impl(&dword_23814D000, v8, OS_LOG_TYPE_DEFAULT, "Registered service -- %@", buf, 0xCu);
        }
        os_release(v6);
      }
      else
      {
        _mdns_dns_service_manager_cancel_resolver_config_updates();
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        uint64_t v9 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 68158466;
          *(_DWORD *)uint64_t v15 = 16;
          *(_WORD *)&v15[4] = 2096;
          *(void *)&v15[6] = v2;
          __int16 v16 = 2112;
          __int16 v17 = v4;
          __int16 v18 = 2048;
          uint64_t v19 = v13;
          _os_log_error_impl(&dword_23814D000, v9, OS_LOG_TYPE_ERROR, "Failed to register service -- uuid: %{uuid_t}.16P, config: %@, error: %{mdns:err}ld", buf, 0x26u);
        }
      }
      nw_release(v4);
    }
  }
}

uint64_t _mdns_dns_service_manager_get_service_by_uuid(const __CFArray *a1, const unsigned __int8 *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  int v13 = 3;
  memset(dst, 0, sizeof(dst));
  uuid_copy(dst, a2);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___mdns_dns_service_manager_get_service_by_uuid_block_invoke;
  v9[3] = &unk_264D05F10;
  long long v10 = *(_OWORD *)dst;
  int v11 = v13;
  v9[4] = &v5;
  mdns_cfarray_enumerate(a1, (uint64_t)v9);
  uint64_t v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

void ___mdns_dns_service_manager_register_path_resolver_internal_block_invoke(uint64_t a1, int a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t path_service_by_config = _mdns_dns_service_manager_get_path_service_by_config(*(const __CFArray **)(v2 + 40), v3);
    if (path_service_by_config)
    {
      uint64_t v5 = path_service_by_config;
      _mdns_dns_service_manager_deregister_service(v2, path_service_by_config);
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v6 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_DEFAULT, "Deregistered service -- %@", (uint8_t *)&buf, 0xCu);
      }
    }
    return;
  }
  if (v3)
  {
    if (nw_resolver_config_get_protocol() == 3)
    {
      uint64_t v7 = _mdns_dns_service_manager_get_path_service_by_config(*(const __CFArray **)(v2 + 40), v3);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t provider_name = nw_resolver_config_get_provider_name();
        uint64_t provider_path = nw_resolver_config_get_provider_path();
        uint64_t odoh_config = nw_resolver_config_get_odoh_config();
        uint64_t v12 = (void *)nw_resolver_config_copy_proxy_config();
        if (v12) {
          nw_proxy_config_set_prohibit_direct();
        }
        uint64_t v13 = *(void *)(v8 + 64);
        if (v13)
        {
          uint64_t v14 = *(void (**)(void))(*(void *)(v13 + 16) + 96);
          if (v14) {
            v14();
          }
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v15 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v8;
            _os_log_impl(&dword_23814D000, v15, OS_LOG_TYPE_DEFAULT, "Updated ODoH config -- %@", (uint8_t *)&buf, 0xCu);
          }
        }
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 0x40000000;
        uint64_t v23 = ___mdns_dns_service_manager_handle_resolver_config_update_block_invoke;
        int v24 = &__block_descriptor_tmp_77_162;
        uint64_t v25 = provider_name;
        uint64_t v26 = provider_path;
        uint64_t v27 = odoh_config;
        uint64_t v28 = 0;
        int v29 = v12;
        CFArrayRef v16 = *(const __CFArray **)(v8 + 128);
        if (v16) {
          mdns_cfarray_enumerate(v16, (uint64_t)&buf);
        }
        if (v12) {
          nw_release(v12);
        }
        if (*(void *)(v8 + 96) && !*(void *)(v8 + 136))
        {
          if (*(void *)(v8 + 160))
          {
            string_ptr = xpc_string_get_string_ptr(*(xpc_object_t *)(v8 + 160));
            __int16 v18 = (const char *)nw_resolver_config_get_provider_name();
            if (string_ptr)
            {
              if (v18 && !strcmp(string_ptr, v18))
              {
LABEL_33:
                uint64_t v19 = *(const char **)(v8 + 168);
                int v20 = (const char *)nw_resolver_config_get_provider_path();
                if (v19)
                {
                  if (v20 && !strcmp(v19, v20)) {
                    return;
                  }
                }
                else if (!v20)
                {
                  return;
                }
              }
            }
            else if (!v18)
            {
              goto LABEL_33;
            }
          }
          else if (!nw_resolver_config_get_provider_name())
          {
            goto LABEL_33;
          }
          uint64_t v21 = *(NSObject **)(v2 + 96);
          if (v21) {
            dispatch_source_merge_data(v21, 1uLL);
          }
        }
      }
    }
  }
}

char *_mdns_dns_service_create_from_resolver_config(void *a1, char a2, char a3, int *a4)
{
  uint64_t v15 = 0;
  CFArrayRef v16 = (int *)&v15;
  uint64_t v17 = 0x2000000000;
  int v18 = 0;
  unsigned int protocol = nw_resolver_config_get_protocol();
  if (protocol < 4) {
    char v9 = protocol + 1;
  }
  else {
    char v9 = 0;
  }
  uint64_t v10 = _mdns_dns_service_create(v9, a2, a3, v16 + 6);
  int v11 = v16[6];
  if (!v11)
  {
    nw_resolver_config_enumerate_name_servers();
    int v11 = v16[6];
    if (!v11)
    {
      nw_resolver_config_enumerate_match_domains();
      *(void *)(v10 + 96) = a1;
      nw_retain(a1);
      interface_name = (const char *)nw_resolver_config_get_interface_name();
      if (interface_name)
      {
        uint64_t v13 = interface_name;
        uint64_t result = strdup(interface_name);
        if (!result)
        {
          __break(1u);
          return result;
        }
        *(void *)(v10 + 104) = result;
        *(_DWORD *)(v10 + 256) = if_nametoindex(v13);
      }
      *(_WORD *)(v10 + 276) = 6;
      _mdns_dns_service_update_nw_config_data(v10);
      int v11 = 0;
      v16[6] = 0;
    }
  }
  if (a4) {
    *a4 = v11;
  }
  _Block_object_dispose(&v15, 8);
  return (char *)v10;
}

BOOL ___mdns_dns_service_create_from_resolver_config_block_invoke(uint64_t a1, char *a2)
{
  uint64_t v3 = (void *)mdns_address_create_from_ip_address_string(a2);
  BOOL result = 1;
  if (v3)
  {
    BOOL v4 = v3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _mdns_dns_service_append_address(*(void *)(a1 + 40), v3);
    os_release(v4);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      return 0;
    }
  }
  return result;
}

uint64_t ___mdns_dns_service_create_from_resolver_config_block_invoke_2(uint64_t a1, char *a2)
{
  return 1;
}

uint64_t _mdns_dns_service_update_nw_config_data(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 96);
  if (result && !*(void *)(a1 + 136))
  {
    uint64_t provider_name = (const char *)nw_resolver_config_get_provider_name();
    BOOL v4 = *(void **)(a1 + 160);
    if (v4)
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (string_ptr)
      {
        if (!provider_name)
        {
          uint64_t v10 = *(void **)(a1 + 160);
          if (!v10) {
            goto LABEL_15;
          }
          xpc_release(v10);
          xpc_object_t v7 = 0;
LABEL_14:
          *(void *)(a1 + 160) = v7;
          goto LABEL_15;
        }
        if (!strcmp(string_ptr, provider_name)) {
          goto LABEL_15;
        }
      }
      else if (!provider_name)
      {
        goto LABEL_15;
      }
      uint64_t v6 = *(void **)(a1 + 160);
      if (v6)
      {
        xpc_release(v6);
        *(void *)(a1 + 160) = 0;
      }
    }
    else if (!provider_name)
    {
LABEL_15:
      uint64_t result = nw_resolver_config_get_provider_path();
      uint64_t v8 = (const char *)result;
      char v9 = *(void **)(a1 + 168);
      if (v9)
      {
        if (!result) {
          goto LABEL_22;
        }
        uint64_t result = strcmp(*(const char **)(a1 + 168), (const char *)result);
        if (!result) {
          return result;
        }
        free(v9);
        *(void *)(a1 + 168) = 0;
      }
      else if (!result)
      {
        return result;
      }
      uint64_t result = (uint64_t)strdup(v8);
      if (result)
      {
LABEL_23:
        *(void *)(a1 + 168) = result;
        return result;
      }
      __break(1u);
LABEL_22:
      free(v9);
      uint64_t result = 0;
      goto LABEL_23;
    }
    xpc_object_t v7 = xpc_string_create(provider_name);
    goto LABEL_14;
  }
  return result;
}

uint64_t _mdns_dns_service_manager_get_path_service_by_config(const __CFArray *a1, uint64_t a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_manager_get_path_service_by_config_block_invoke;
  v4[3] = &unk_264D05F38;
  v4[4] = &v5;
  void v4[5] = a2;
  mdns_cfarray_enumerate(a1, (uint64_t)v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___mdns_dns_service_manager_handle_resolver_config_update_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 64);
  if (v2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(v2 + 16) + 96);
    if (v3) {
      v3();
    }
  }
  return 1;
}

BOOL ___mdns_dns_service_manager_get_path_service_by_config_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 96) == *(void *)(a1 + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_manager_get_service_by_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (_mdns_dns_service_scope_id_match(a2, a1 + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_scope_id_match(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  switch(*(unsigned char *)(a1 + 280))
  {
    case 1:
      return !*(unsigned char *)(a2 + 16);
    case 2:
      int v3 = *(unsigned __int8 *)(a2 + 16);
      goto LABEL_12;
    case 3:
      if (*(unsigned char *)(a2 + 16) != 2) {
        return 0;
      }
      int v4 = *(_DWORD *)(a1 + 260);
      return v4 == *(_DWORD *)a2;
    case 4:
      if (*(unsigned char *)(a2 + 16) == 3)
      {
        if (*(void *)(a1 + 96))
        {
          *(void *)uu1 = 0;
          uint64_t v7 = 0;
          nw_resolver_config_get_identifier();
          if (!uuid_compare(uu1, (const unsigned __int8 *)a2)) {
            return 1;
          }
        }
      }
      return 0;
    case 5:
      int v3 = *(unsigned __int8 *)(a2 + 16);
      if (!*(unsigned char *)(a2 + 16)) {
        return 1;
      }
      if (v3 != 1) {
        return 0;
      }
LABEL_12:
      int v4 = *(_DWORD *)(a1 + 256);
      return v4 == *(_DWORD *)a2;
    default:
      return 0;
  }
}

uint64_t mdns_dns_service_manager_register_custom_service(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_register_custom_service_block_invoke;
  block[3] = &unk_264D05AD0;
  block[4] = &v7;
  void block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __mdns_dns_service_manager_register_custom_service_block_invoke(void *a1)
{
  v26[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 131)) {
    goto LABEL_21;
  }
  uint64_t v3 = a1[6];
  uint64_t v4 = nw_resolver_config_create_with_dictionary();
  if (!v4)
  {
    CFArrayRef v16 = (char *)MEMORY[0x23EC89910](v3);
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v17 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v18 = "<NO DESC.>";
      if (v16) {
        int v18 = v16;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)uint64_t v21 = v18;
      _os_log_error_impl(&dword_23814D000, v17, OS_LOG_TYPE_ERROR, "Failed to create nw_resolver_config for dictionary: %s", buf, 0xCu);
      if (!v16) {
        goto LABEL_21;
      }
    }
    else if (!v16)
    {
      goto LABEL_21;
    }
    free(v16);
    goto LABEL_21;
  }
  uint64_t v5 = (void *)v4;
  v26[0] = 0;
  v26[1] = 0;
  nw_resolver_config_get_identifier();
  uint64_t service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v2 + 56), (const unsigned __int8 *)v26);
  if (!service_by_uuid)
  {
    int v19 = 0;
    int v11 = _mdns_dns_service_create_from_resolver_config(v5, 5, 4, &v19);
    if (v11)
    {
      uint64_t v7 = v11;
      uint64_t v12 = *(__CFArray **)(v2 + 56);
      _mdns_dns_service_increment_use_count((uint64_t)v11);
      CFArrayAppendValue(v12, v7);
      _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v2, (uint64_t)v7);
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v13 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v21 = v7;
        _os_log_impl(&dword_23814D000, v13, OS_LOG_TYPE_DEFAULT, "Registered custom service -- %@", buf, 0xCu);
      }
      os_release(v7);
      goto LABEL_14;
    }
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v15 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 68158466;
      *(_DWORD *)uint64_t v21 = 16;
      *(_WORD *)&v21[4] = 2096;
      *(void *)&void v21[6] = v26;
      __int16 v22 = 2112;
      uint64_t v23 = v5;
      __int16 v24 = 2048;
      uint64_t v25 = v19;
      _os_log_error_impl(&dword_23814D000, v15, OS_LOG_TYPE_ERROR, "Failed to register custom service -- uuid: %{uuid_t}.16P, config: %@, error: %{mdns:err}ld", buf, 0x26u);
    }
    nw_release(v5);
LABEL_21:
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = (void *)service_by_uuid;
  int v8 = _mdns_dns_service_increment_use_count(service_by_uuid);
  if (_mdns_dns_service_log_s_once != -1) {
    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
  }
  uint64_t v9 = _mdns_dns_service_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v7[3];
    *(_DWORD *)long long buf = 134218240;
    *(void *)uint64_t v21 = v10;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v8;
    _os_log_impl(&dword_23814D000, v9, OS_LOG_TYPE_INFO, "Registered existing custom service -- service id: %llu, use count: %d", buf, 0x12u);
  }
LABEL_14:
  nw_release(v5);
  uint64_t v14 = v7[3];
LABEL_15:
  *(void *)(*(void *)(a1[4] + 8) + 24) = v14;
}

void mdns_dns_service_manager_deregister_custom_service(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (_mdns_dns_service_queue_s_once != -1) {
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
    }
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = __mdns_dns_service_manager_deregister_custom_service_block_invoke;
    v4[3] = &__block_descriptor_tmp_15;
    v4[4] = a1;
    void v4[5] = a2;
    dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
  }
}

void __mdns_dns_service_manager_deregister_custom_service_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 131))
  {
    uint64_t service_by_id = _mdns_dns_service_manager_get_service_by_id(*(const __CFArray **)(v1 + 56), *(void *)(a1 + 40));
    if (service_by_id)
    {
      _mdns_dns_service_manager_deregister_service(v1, service_by_id);
    }
  }
}

void mdns_dns_service_manager_register_doh_uri(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_register_doh_uri_block_invoke;
  block[3] = &__block_descriptor_tmp_16_168;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
}

void __mdns_dns_service_manager_register_doh_uri_block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (!*(unsigned char *)(v2 + 131))
  {
    uint64_t v3 = (const char *)a1[5];
    if (v3 && (__int16 v22 = (char *)a1[6], (v4 = strdup(v3)) != 0))
    {
      uint64_t v1 = v4;
      uint64_t v5 = strchr(v4, 123);
      if (v5) {
        *uint64_t v5 = 0;
      }
      nw_endpoint_t url = nw_endpoint_create_url(v1);
      if (url)
      {
        uint64_t v7 = url;
        url_scheme = (const char *)nw_endpoint_get_url_scheme();
        if (url_scheme && !strcasecmp("https", url_scheme))
        {
          hostname = nw_endpoint_get_hostname(v7);
          uint64_t url_path = nw_endpoint_get_url_path();
          if (hostname
            && (int v11 = (const char *)url_path) != 0
            && (CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 48)), Count >= 1))
          {
            CFIndex v13 = Count;
            CFIndex v14 = 0;
            while (1)
            {
              uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 48), v14);
              if (*(void *)(ValueAtIndex + 96))
              {
                if (nw_resolver_config_get_protocol() == 2)
                {
                  uint64_t provider_name = (const char *)nw_resolver_config_get_provider_name();
                  uint64_t provider_path = (const char *)nw_resolver_config_get_provider_path();
                  if (!strcasecmp(hostname, provider_name) && !strcasecmp(v11, provider_path)) {
                    break;
                  }
                }
              }
              if (v13 == ++v14) {
                goto LABEL_18;
              }
            }
          }
          else
          {
LABEL_18:
            if (_mdns_dns_service_log_s_once != -1) {
              dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
            }
            int v18 = _mdns_dns_service_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315138;
              *(void *)&uint8_t buf[4] = v1;
              _os_log_impl(&dword_23814D000, v18, OS_LOG_TYPE_DEFAULT, "Registering discovered DoH resolver at %s", buf, 0xCu);
            }
            int v19 = (void *)nw_resolver_config_create();
            nw_resolver_config_set_class();
            nw_resolver_config_set_protocol();
            nw_endpoint_get_hostname(v7);
            nw_resolver_config_set_provider_name();
            nw_endpoint_get_url_path();
            nw_resolver_config_set_provider_path();
            *(void *)long long buf = 0;
            *(void *)&uint8_t buf[8] = 0;
            MEMORY[0x23EC89840](buf);
            nw_resolver_config_set_identifier();
            int v23 = 0;
            uint64_t ValueAtIndex = _mdns_dns_service_create(3, 4, 4, &v23);
            if (v23)
            {
              if (v19) {
                nw_release(v19);
              }
              if (!ValueAtIndex) {
                goto LABEL_31;
              }
            }
            else
            {
              *(void *)(ValueAtIndex + 48) = nw_retain(v7);
              *(unsigned char *)(ValueAtIndex + 56) = 1;
              *(void *)(ValueAtIndex + 96) = v19;
              *(_WORD *)(ValueAtIndex + 276) = 6;
              _mdns_dns_service_update_nw_config_data(ValueAtIndex);
            }
            int v20 = *(__CFArray **)(v2 + 48);
            _mdns_dns_service_increment_use_count(ValueAtIndex);
            CFArrayAppendValue(v20, (const void *)ValueAtIndex);
            _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v2, ValueAtIndex);
            os_release((void *)ValueAtIndex);
            _mdns_dns_service_manager_fetch_doh_pvd((void *)ValueAtIndex);
          }
          if (v22)
          {
            if (_mdns_dns_service_log_s_once != -1) {
              dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
            }
            uint64_t v21 = _mdns_dns_service_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = v22;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = v1;
              _os_log_impl(&dword_23814D000, v21, OS_LOG_TYPE_DEFAULT, "Adding domain %s to DoH resolver at %s", buf, 0x16u);
            }
            _mdns_dns_service_add_domain_by_string(ValueAtIndex, v22, 0);
          }
        }
LABEL_31:
        free(v1);
        nw_release(v7);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    free(v1);
  }
}

void _mdns_dns_service_manager_fetch_doh_pvd(void *a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  os_retain(a1);
  uint64_t v2 = a1[6];
  nw_retain(v2);
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  uint64_t v3 = (void *)_mdns_dns_service_queue_s_queue;
  hostname = nw_endpoint_get_hostname(v2);
  uint64_t url_path = nw_endpoint_get_url_path();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke;
  v8[3] = &unk_264D06028;
  v8[5] = v2;
  v8[6] = a1;
  v8[4] = &v9;
  pvd_query = http_task_create_pvd_query(v3, (uint64_t)hostname, url_path, v8);
  v10[3] = (uint64_t)pvd_query;
  uint64_t v7 = (void *)MEMORY[0x23EC893C0]();
  [pvd_query resume];
  _Block_object_dispose(&v9, 8);
}

void ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (xdict)
  {
    string = xpc_dictionary_get_string(xdict, "dohTemplate");
    if (string)
    {
      uint64_t v5 = (char *)string;
      size_t v6 = strlen(string);
      uint64_t v7 = strchr(v5, 123);
      if (v7) {
        size_t v6 = v7 - v5;
      }
      nw_endpoint_t url = nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 40));
      if (url && (uint64_t v9 = url, strlen(url) == v6) && !strncasecmp(v5, v9, v6))
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "secondsRemaining");
        if (uint64 || (uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "seconds-remaining")) != 0)
        {
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v17 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = *(void *)(a1 + 40);
            *(_DWORD *)long long buf = 138412546;
            uint64_t v31 = v18;
            __int16 v32 = 2048;
            uint64_t v33 = uint64;
            _os_log_impl(&dword_23814D000, v17, OS_LOG_TYPE_INFO, "DoH resolver for %@ will expire in %llu seconds", buf, 0x16u);
          }
          if (_mdns_get_future_continuous_time_onceToken != -1) {
            dispatch_once(&_mdns_get_future_continuous_time_onceToken, &__block_literal_global_96);
          }
          unint64_t v19 = 1000000000
              * uint64
              * *(unsigned int *)algn_26895832C
              / _mdns_get_future_continuous_time_time_base;
          uint64_t v20 = mach_continuous_time() + v19;
        }
        else
        {
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v25 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = *(void *)(a1 + 40);
            *(_DWORD *)long long buf = 138412290;
            uint64_t v31 = v26;
            _os_log_impl(&dword_23814D000, v25, OS_LOG_TYPE_INFO, "DoH resolver for %@ does not specify an expiration", buf, 0xCu);
          }
          uint64_t v20 = 0;
        }
        *(void *)(*(void *)(a1 + 48) + 40) = v20;
        xpc_object_t value = xpc_dictionary_get_value(xdict, "dnsZones");
        xpc_object_t v22 = xpc_dictionary_get_value(xdict, "trustedNames");
        if (v22)
        {
          int v23 = v22;
          if (MEMORY[0x23EC89A00]() == MEMORY[0x263EF86D8])
          {
            applier[0] = MEMORY[0x263EF8330];
            applier[1] = 0x40000000;
            applier[2] = ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke_89;
            applier[3] = &__block_descriptor_tmp_91;
            long long v28 = *(_OWORD *)(a1 + 40);
            xpc_object_t v29 = value;
            xpc_array_apply(v23, applier);
          }
        }
      }
      else
      {
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        uint64_t v10 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v31 = v11;
          __int16 v32 = 2080;
          uint64_t v33 = (uint64_t)v5;
          uint64_t v12 = "DoH resolver for %@ does not match DoH template %s";
          CFIndex v13 = v10;
          uint32_t v14 = 22;
LABEL_29:
          _os_log_error_impl(&dword_23814D000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        }
      }
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v15 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v31 = v24;
        uint64_t v12 = "DoH resolver for %@ missing DoH template";
        CFIndex v13 = v15;
        uint32_t v14 = 12;
        goto LABEL_29;
      }
    }
  }
  http_task_cancel(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  os_release(*(void **)(a1 + 48));
  nw_release(*(void **)(a1 + 40));
}

uint64_t ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke_89(void *a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (MEMORY[0x23EC89A00](a3) == MEMORY[0x263EF8798])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v7 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = string_ptr;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_23814D000, v7, OS_LOG_TYPE_DEFAULT, "Query trusted name %s for DoH resolver for %@", buf, 0x16u);
    }
    uint64_t v9 = (void *)a1[6];
    if (v9)
    {
      if (string_ptr)
      {
        uint64_t v10 = (void *)a1[4];
        if (v10)
        {
          uint64_t v11 = (void *)a1[5];
          if (MEMORY[0x23EC89A00](v9) == MEMORY[0x263EF86D8])
          {
            uint64_t v21 = 0;
            asprintf(&v21, ".%s", string_ptr);
            xpc_object_t v12 = xpc_array_create(0, 0);
            applier[0] = MEMORY[0x263EF8330];
            applier[1] = 0x40000000;
            applier[2] = ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke;
            applier[3] = &__block_descriptor_tmp_98;
            void applier[4] = string_ptr;
            void applier[5] = v12;
            applier[6] = v21;
            xpc_array_apply(v9, applier);
            if (v21)
            {
              free(v21);
              uint64_t v21 = 0;
            }
            if (xpc_array_get_count(v12))
            {
              uint64_t v16 = 0;
              uint64_t v17 = &v16;
              uint64_t v18 = 0x2000000000;
              uint64_t v19 = 0;
              nw_retain(v10);
              os_retain(v11);
              nw_endpoint_t host = nw_endpoint_create_host(string_ptr, "443");
              if (_mdns_dns_service_queue_s_once != -1) {
                dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
              }
              *(void *)long long buf = MEMORY[0x263EF8330];
              *(void *)&uint8_t buf[8] = 0x40000000;
              *(void *)&buf[16] = ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_2;
              int v23 = &unk_264D060B0;
              uint64_t v26 = v10;
              xpc_object_t v27 = v12;
              long long v28 = v11;
              uint64_t v24 = &v16;
              nw_endpoint_t v25 = host;
              pvd_query = http_task_create_pvd_query((void *)_mdns_dns_service_queue_s_queue, (uint64_t)string_ptr, (uint64_t)"", buf);
              v17[3] = (uint64_t)pvd_query;
              uint64_t v15 = (void *)MEMORY[0x23EC893C0]();
              [pvd_query resume];
              _Block_object_dispose(&v16, 8);
            }
            else if (v12)
            {
              xpc_release(v12);
            }
          }
        }
      }
    }
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (MEMORY[0x23EC89A00](a3) == MEMORY[0x263EF8798])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (!strcasecmp(*(const char **)(a1 + 32), string_ptr)
      || (size_t v6 = strlen(*(const char **)(a1 + 48)), v7 = strlen(string_ptr), v7 >= v6)
      && !strcasecmp(*(const char **)(a1 + 48), &string_ptr[v7 - v6]))
    {
      xpc_array_append_value(*(xpc_object_t *)(a1 + 40), a3);
    }
  }
  return 1;
}

void ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (xdict)
  {
    string = xpc_dictionary_get_string(xdict, "dohTemplate");
    if (string)
    {
      uint64_t v4 = string;
      nw_endpoint_t url = nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 48));
      if (url && !strcasecmp(v4, url))
      {
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        uint64_t v17 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(const char **)(a1 + 40);
          uint64_t v18 = *(void *)(a1 + 48);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v25 = v18;
          __int16 v26 = 2112;
          xpc_object_t v27 = v19;
          _os_log_impl(&dword_23814D000, v17, OS_LOG_TYPE_DEFAULT, "DoH resolver at %@ is trusted for %@", buf, 0x16u);
        }
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 0x40000000;
        v23[2] = ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_100;
        v23[3] = &__block_descriptor_tmp_101;
        uint64_t v20 = *(void **)(a1 + 56);
        uint64_t v21 = *(void *)(a1 + 64);
        v23[4] = *(void *)(a1 + 48);
        v23[5] = v21;
        xpc_array_apply(v20, v23);
      }
      else
      {
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        uint64_t v6 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 40);
          uint64_t v7 = *(void *)(a1 + 48);
          *(_DWORD *)long long buf = 138412802;
          uint64_t v25 = v7;
          __int16 v26 = 2080;
          xpc_object_t v27 = v4;
          __int16 v28 = 2112;
          uint64_t v29 = v8;
          uint64_t v9 = "DoH resolver for %@ does not match trusted DoH template %s for %@";
          uint64_t v10 = v6;
          uint32_t v11 = 32;
LABEL_17:
          _os_log_error_impl(&dword_23814D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
        }
      }
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v15 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v25 = v16;
        uint64_t v9 = "Trusted name %@ missing DoH template";
        uint64_t v10 = v15;
        uint32_t v11 = 12;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v12 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint32_t v14 = *(const char **)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      xpc_object_t v27 = v14;
      uint64_t v9 = "No PvD file found at %@ for DoH server %@";
      uint64_t v10 = v12;
      uint32_t v11 = 22;
      goto LABEL_17;
    }
  }
  http_task_cancel(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  nw_release(*(void **)(a1 + 40));
  nw_release(*(void **)(a1 + 48));
  xpc_object_t v22 = *(void **)(a1 + 56);
  if (v22) {
    xpc_release(v22);
  }
  os_release(*(void **)(a1 + 64));
}

uint64_t ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_100(uint64_t a1, int a2, xpc_object_t xstring)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  string_ptr = (char *)xpc_string_get_string_ptr(xstring);
  if (_mdns_dns_service_log_s_once != -1) {
    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
  }
  uint64_t v5 = _mdns_dns_service_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    uint64_t v9 = string_ptr;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_23814D000, v5, OS_LOG_TYPE_DEFAULT, "Adding domain %s to discovered DoH resolver for %@", (uint8_t *)&v8, 0x16u);
  }
  _mdns_dns_service_add_domain_by_string(*(void *)(a1 + 40), string_ptr, 0);
  return 1;
}

uint64_t ___mdns_get_future_continuous_time_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_mdns_get_future_continuous_time_time_base);
}

void mdns_dns_service_manager_invalidate(uint64_t a1)
{
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_19_183;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
}

void __mdns_dns_service_manager_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 130))
  {
    _mdns_dns_service_manager_terminate(v2, 0);
    *(unsigned char *)(*(void *)(a1 + 32) + 130) = 1;
  }
}

uint64_t _mdns_dns_service_manager_get_service(const __CFArray *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  int v14 = -1;
  v11[0] = 0;
  v11[1] = v11;
  void v11[2] = 0x2000000000;
  int v12 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 0x40000000;
  v10[2] = ___mdns_dns_service_manager_get_service_block_invoke;
  v10[3] = &unk_264D061E8;
  v10[8] = a3;
  v10[9] = a2;
  v10[4] = 0;
  void v10[5] = v13;
  v10[6] = v11;
  unsigned char v10[7] = &v15;
  mdns_cfarray_enumerate(a1, (uint64_t)v10);
  uint64_t v5 = v16;
  if (a4)
  {
    uint64_t v6 = v16[3];
    if (v6)
    {
      uint64_t preferred_encrypted_alt = _mdns_dns_service_get_preferred_encrypted_alt(v6, (a4 & 2) != 0);
      uint64_t v5 = v16;
      if (preferred_encrypted_alt) {
        v16[3] = preferred_encrypted_alt;
      }
    }
  }
  uint64_t v8 = v5[3];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t _mdns_dns_service_manager_prepare_service(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v92 = *MEMORY[0x263EF8340];
  if (!a2) {
    return v2;
  }
  int v4 = *(unsigned __int8 *)(a2 + 281);
  if (v4 != 5)
  {
    if (*(void *)(a2 + 64)) {
      return v2;
    }
    if ((v4 - 3) < 2)
    {
      int v4 = 4;
    }
    else
    {
      if (v4 == 1)
      {
        int v22 = 0;
LABEL_41:
        int v81 = 0;
        __int16 v26 = mdns_resolver_create(v4, *(_DWORD *)(a2 + 256), &v81);
        if (!v26)
        {
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v74 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          {
            uint64_t v75 = *(void *)(v2 + 24);
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = v75;
            v76 = "Failed to create resolver for service -- service id: %llu";
            v77 = v74;
            uint32_t v78 = 12;
LABEL_158:
            _os_log_error_impl(&dword_23814D000, v77, OS_LOG_TYPE_ERROR, v76, buf, v78);
          }
LABEL_144:
          if (*(void *)(v2 + 64)) {
            return v2;
          }
          goto LABEL_145;
        }
        uint64_t v27 = (uint64_t)v26;
        if (!*(void *)(v2 + 96))
        {
LABEL_72:
          if (*(void *)(v2 + 176))
          {
            if (!*(unsigned char *)(v27 + 137))
            {
              uint64_t v40 = *(void (**)(uint64_t))(*(void *)(v27 + 16) + 64);
              if (v40) {
                v40(v27);
              }
            }
          }
          if (*(_WORD *)(v2 + 278))
          {
            if (!*(unsigned char *)(v27 + 137))
            {
              int v41 = *(void (**)(uint64_t))(*(void *)(v27 + 16) + 72);
              if (v41) {
                v41(v27);
              }
            }
          }
          if (!*(unsigned char *)(v2 + 56) || *(unsigned char *)(v27 + 137))
          {
            BOOL v42 = *(unsigned __int8 *)(v27 + 137) != 0;
            if (*(unsigned char *)(v27 + 137))
            {
LABEL_95:
              CFArrayRef v47 = *(const __CFArray **)(v2 + 80);
              if (v47)
              {
                CFIndex Count = CFArrayGetCount(v47);
                if (Count < 1)
                {
                  uint64_t v50 = 0;
                }
                else
                {
                  CFIndex v49 = 0;
                  uint64_t v50 = 0;
                  do
                  {
                    uint64_t ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 80), v49);
                    int v52 = mdns_resolver_add_server_address(v27, (uint64_t)ValueAtIndex);
                    if (v52)
                    {
                      int v53 = v52;
                      if (_mdns_dns_service_log_s_once != -1) {
                        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                      }
                      log = _mdns_dns_service_log_s_log;
                      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v54 = *(void *)(v2 + 24);
                        *(_DWORD *)long long buf = 134218498;
                        *(void *)&uint8_t buf[4] = v54;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = ValueAtIndex;
                        *(_WORD *)&unsigned char buf[22] = 2048;
                        v89 = (void *)v53;
                        _os_log_error_impl(&dword_23814D000, log, OS_LOG_TYPE_ERROR, "Failed to add address to resolver -- service id: %llu, address: %@, error: %{mdns:err}ld", buf, 0x20u);
                      }
                    }
                    else
                    {
                      ++v50;
                    }
                    ++v49;
                  }
                  while (Count != v49);
                }
                if (Count && v50 < 1)
                {
                  os_release((void *)v27);
                  goto LABEL_144;
                }
              }
              if (_mdns_dns_service_queue_s_once != -1) {
                dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
              }
              mdns_resolver_set_queue(v27, (dispatch_object_t)_mdns_dns_service_queue_s_queue);
              os_retain((void *)a1);
              os_retain((void *)v27);
              os_retain((void *)v2);
              *(void *)&long long aBlock = MEMORY[0x263EF8330];
              *((void *)&aBlock + 1) = 0x40000000;
              v83 = ___mdns_dns_service_manager_prepare_resolver_block_invoke;
              v84 = &__block_descriptor_tmp_205;
              uint64_t v85 = a1;
              uint64_t v86 = v2;
              uint64_t v87 = v27;
              mdns_resolver_set_event_handler(v27, &aBlock);
              *(void *)(v2 + 64) = v27;
              if (*(unsigned char *)(v2 + 283))
              {
                *(unsigned char *)(v2 + 283) = 0;
                uint64_t v55 = *(NSObject **)(a1 + 96);
                if (v55)
                {
                  dispatch_source_merge_data(v55, 1uLL);
                  uint64_t v27 = *(void *)(v2 + 64);
                }
              }
              mdns_resolver_activate((unsigned char *)v27);
              if (*(unsigned __int8 *)(v2 + 281) - 2 >= 4
                && nw_settings_get_ddr_enabled()
                && !*(void *)(v2 + 200))
              {
                if (_mdns_dns_service_queue_s_once != -1) {
                  dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
                }
                dispatch_source_t v56 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
                *(void *)(v2 + 200) = v56;
                if (v56)
                {
                  if (_mdns_os_variant_has_internal_diagnostics_s_once != -1) {
                    dispatch_once(&_mdns_os_variant_has_internal_diagnostics_s_once, &__block_literal_global_254);
                  }
                  if (_mdns_os_variant_has_internal_diagnostics_s_result)
                  {
                    unsigned int v57 = *(_DWORD *)(a1 + 124);
                    if (v57 <= 0xA) {
                      int v58 = 10;
                    }
                    else {
                      int v58 = *(_DWORD *)(a1 + 124);
                    }
                    if (v57) {
                      unsigned int v59 = v58;
                    }
                    else {
                      unsigned int v59 = 1800;
                    }
                  }
                  else
                  {
                    unsigned int v59 = 1800;
                  }
                  uint64_t v69 = *(NSObject **)(v2 + 200);
                  dispatch_time_t v70 = dispatch_time(0x8000000000000000, 1000000000 * v59);
                  dispatch_source_set_timer(v69, v70, 1000000000 * v59, 50000000 * v59);
                  uint64_t v71 = *(NSObject **)(v2 + 200);
                  *(void *)long long buf = MEMORY[0x263EF8330];
                  *(void *)&uint8_t buf[8] = 0x40000000;
                  *(void *)&buf[16] = ___mdns_dns_service_manager_schedule_ddr_probe_block_invoke;
                  v89 = &__block_descriptor_tmp_214;
                  uint64_t v90 = a1;
                  uint64_t v91 = v2;
                  dispatch_source_set_event_handler(v71, buf);
                  dispatch_activate(*(dispatch_object_t *)(v2 + 200));
                  _mdns_dns_service_forget_all_ddr_queriers(v2);
                  _mdns_dns_service_manager_start_ddr_querier_ex((void *)a1, v2, 0);
                  goto LABEL_144;
                }
                if (_mdns_dns_service_log_s_once != -1) {
                  dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                }
                uint64_t v79 = _mdns_dns_service_log_s_log;
                if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)long long buf = 0;
                  v76 = "Failed to create DDR timer";
                  v77 = v79;
                  uint32_t v78 = 2;
                  goto LABEL_158;
                }
              }
              goto LABEL_144;
            }
          }
          else
          {
            BOOL v42 = 0;
            *(unsigned char *)(v27 + 133) = 1;
          }
          if ((*(_WORD *)(v2 + 276) & 8) != 0) {
            int v43 = 2000;
          }
          else {
            int v43 = 1000;
          }
          *(_DWORD *)(v27 + 124) = v43;
          *(unsigned char *)(v27 + 132) = *(unsigned char *)(a1 + 128);
          if (((v22 | v42) & 1) == 0)
          {
            *(unsigned char *)(v27 + 138) = 1;
            int v44 = *(_DWORD *)(a1 + 120);
            if (v44 >= 0x64) {
              int v45 = 100;
            }
            else {
              int v45 = *(_DWORD *)(a1 + 120);
            }
            if (v44 <= 0) {
              int v46 = 0;
            }
            else {
              int v46 = v45;
            }
            *(_DWORD *)(v27 + 128) = v46;
          }
          goto LABEL_95;
        }
        uint64_t provider_name = nw_resolver_config_get_provider_name();
        uint64_t provider_path = nw_resolver_config_get_provider_path();
        if (!*(unsigned char *)(v27 + 137))
        {
          uint64_t v30 = *(void (**)(uint64_t, uint64_t))(*(void *)(v27 + 16) + 56);
          if (!v30 || (v30(v27, provider_name), !*(unsigned char *)(v27 + 137)))
          {
            uint64_t v31 = *(void (**)(uint64_t, uint64_t))(*(void *)(v27 + 16) + 80);
            if (v31) {
              v31(v27, provider_path);
            }
          }
        }
        uint64_t identity_reference = nw_resolver_config_get_identity_reference();
        if (identity_reference)
        {
          if (*(unsigned char *)(v27 + 137))
          {
            int v81 = -6719;
            goto LABEL_52;
          }
          uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v27 + 16) + 88);
          if (v33)
          {
            int v81 = v33(v27, identity_reference, 0);
            if (v81)
            {
LABEL_52:
              if (_mdns_dns_service_log_s_once != -1) {
                dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
              }
              uint64_t v34 = _mdns_dns_service_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
              {
                uint64_t v35 = *(void *)(v2 + 24);
                *(_DWORD *)long long buf = 134217984;
                *(void *)&uint8_t buf[4] = v35;
                _os_log_error_impl(&dword_23814D000, v34, OS_LOG_TYPE_ERROR, "Failed to set identity reference for service -- service id: %llu", buf, 0xCu);
              }
            }
          }
          else
          {
            int v81 = 0;
          }
        }
        if (nw_resolver_config_get_protocol() == 3)
        {
          uint64_t odoh_config = nw_resolver_config_get_odoh_config();
          int v37 = (void *)nw_resolver_config_copy_proxy_config();
          if (v37) {
            nw_proxy_config_set_prohibit_direct();
          }
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          unsigned int v38 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v37;
            _os_log_impl(&dword_23814D000, v38, OS_LOG_TYPE_DEFAULT, "Resolver proxy config: %@", buf, 0xCu);
          }
          uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void *))(*(void *)(v27 + 16) + 96);
          if (v39) {
            v39(v27, provider_name, provider_path, odoh_config, 0, v37);
          }
          if (v37) {
            nw_release(v37);
          }
          if (*(unsigned char *)(a1 + 129))
          {
            if (*(unsigned char *)(v2 + 282) != 4)
            {
              *(_WORD *)(v2 + 276) |= 0x1000u;
              if (!*(unsigned char *)(v27 + 137)) {
                *(unsigned char *)(v27 + 140) = 1;
              }
            }
          }
        }
        goto LABEL_72;
      }
      if (v4 != 2)
      {
LABEL_145:
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        int v23 = _mdns_dns_service_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        uint64_t v73 = *(void *)(v2 + 24);
        LODWORD(aBlock) = 134217984;
        *(void *)((char *)&aBlock + 4) = v73;
        uint64_t v25 = "Failed to prepare resolver -- service id: %llu";
        goto LABEL_153;
      }
      int v4 = 3;
    }
    int v22 = 1;
    goto LABEL_41;
  }
  if (*(void *)(a2 + 72)) {
    return v2;
  }
  uint64_t v5 = _os_object_alloc();
  if (!v5) {
    goto LABEL_35;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &_mdns_push_server_kind;
  *(void *)(v5 + 16) = &_mdns_push_server_kind;
  do
  {
    uint64_t v8 = (void (*)(void *))v7[2];
    if (v8) {
      v8(v6);
    }
    uint64_t v7 = (_UNKNOWN **)*v7;
  }
  while (v7);
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
  v6[8] = Mutable;
  if (!Mutable || (CFMutableArrayRef v11 = CFArrayCreateMutable(v9, 0, MEMORY[0x263EFFF70]), (v6[9] = v11) == 0))
  {
    os_release(v6);
LABEL_35:
    *(void *)(v2 + 72) = 0;
LABEL_36:
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    int v23 = _mdns_dns_service_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    uint64_t v24 = *(void *)(v2 + 24);
    LODWORD(aBlock) = 134217984;
    *(void *)((char *)&aBlock + 4) = v24;
    uint64_t v25 = "Failed to prepare push server -- service id: %llu";
LABEL_153:
    _os_log_error_impl(&dword_23814D000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&aBlock, 0xCu);
    return 0;
  }
  *(void *)(v2 + 72) = v6;
  CFArrayRef v12 = *(const __CFArray **)(v2 + 232);
  if (v12)
  {
    CFIndex v13 = CFArrayGetCount(v12);
    if (v13 >= 1)
    {
      CFIndex v14 = v13;
      for (CFIndex i = 0; i != v14; ++i)
      {
        uint64_t v16 = CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 232), i);
        uint64_t v17 = *(void *)(v2 + 72);
        if (!*(unsigned char *)(v17 + 103)) {
          CFArrayAppendValue(*(CFMutableArrayRef *)(v17 + 72), v16);
        }
      }
    }
  }
  uint64_t v18 = *(void *)(v2 + 72);
  if (!*(unsigned char *)(v18 + 103))
  {
    unsigned int v19 = *(_DWORD *)(v2 + 256);
    if (*(_DWORD *)(v18 + 96) != v19)
    {
      *(_DWORD *)(v18 + 96) = v19;
      if (*(void *)(v18 + 56))
      {
        free(*(void **)(v18 + 56));
        *(void *)(v18 + 56) = 0;
        unsigned int v19 = *(_DWORD *)(v18 + 96);
      }
    }
    if (v19 && !*(void *)(v18 + 56)) {
      *(void *)(v18 + 56) = mdns_system_interface_index_to_name(v19);
    }
  }
  CFArrayRef v20 = *(const __CFArray **)(v2 + 80);
  if (!v20 || CFArrayGetCount(v20) < 1)
  {
    uint64_t v60 = *(void *)(v2 + 216);
    uint64_t v61 = *(void *)(v2 + 72);
    if (v60)
    {
      if (!*(unsigned char *)(v61 + 103))
      {
        os_retain(*(void **)(v2 + 216));
        v62 = *(void **)(v61 + 48);
        if (v62) {
          os_release(v62);
        }
        *(void *)(v61 + 48) = v60;
      }
      goto LABEL_134;
    }
    if (v61) {
      return v2;
    }
    goto LABEL_36;
  }
  CFArrayRef v21 = *(const __CFArray **)(v2 + 80);
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 0x40000000;
  v83 = ___mdns_dns_service_manager_prepare_push_service_block_invoke;
  v84 = &__block_descriptor_tmp_244;
  uint64_t v85 = v2;
  mdns_cfarray_enumerate(v21, (uint64_t)&aBlock);
LABEL_134:
  uint64_t v63 = *(void *)(v2 + 240);
  if (v63)
  {
    uint64_t v64 = *(const void **)(v2 + 248);
    if (v64)
    {
      uint64_t v65 = *(void *)(v2 + 72);
      dispatch_retain(*(dispatch_object_t *)(v2 + 240));
      uint64_t v66 = _Block_copy(v64);
      uint64_t v67 = *(NSObject **)(v65 + 80);
      if (v67) {
        dispatch_release(v67);
      }
      *(void *)(v65 + 80) = v63;
      int v68 = *(const void **)(v65 + 88);
      if (v68) {
        _Block_release(v68);
      }
      *(void *)(v65 + 88) = v66;
    }
  }
  *(unsigned char *)(*(void *)(v2 + 72) + 103) = 1;
  return v2;
}

void ___mdns_dns_service_manager_prepare_resolver_block_invoke(void *a1, int a2, xpc_object_t xdict)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = (char *)a1[6];
  switch(a2)
  {
    case 1:
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      CFArrayRef v12 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
      {
        CFIndex v13 = *(const char **)(v3 + 24);
        int v29 = 134218242;
        uint64_t v30 = v13;
        __int16 v31 = 2112;
        __int16 v32 = v5;
        _os_log_impl(&dword_23814D000, v12, OS_LOG_TYPE_INFO, "Resolver has been invalidated -- service id: %llu, resolver: %@", (uint8_t *)&v29, 0x16u);
      }
      os_release(v5);
      os_release((void *)v3);
      os_release(v4);
      break;
    case 3:
      if (!xdict || *(char **)(v3 + 64) != v5) {
        return;
      }
      int int64 = xpc_dictionary_get_int64(xdict, "error_code");
      if (*(unsigned char *)(v3 + 282) == 4)
      {
        if (int64 == -6736)
        {
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v15 = _mdns_dns_service_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR)) {
            return;
          }
          int v22 = *(const char **)(v3 + 24);
          int v29 = 134217984;
          uint64_t v30 = v22;
          uint64_t v17 = "Received unexpected error for discovered service id: %llu";
        }
        else
        {
          if (int64 != -6776) {
            return;
          }
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v15 = _mdns_dns_service_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR)) {
            return;
          }
          uint64_t v16 = *(const char **)(v3 + 24);
          int v29 = 134217984;
          uint64_t v30 = v16;
          uint64_t v17 = "Received authentication error for discovered service id: %llu";
        }
        _os_log_error_impl(&dword_23814D000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, 0xCu);
        return;
      }
      if (!*(void *)(v3 + 96)) {
        return;
      }
      if (int64)
      {
        if (int64 == -6736)
        {
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          uint64_t v25 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          {
            __int16 v28 = *(const char **)(v3 + 24);
            int v29 = 134217984;
            uint64_t v30 = v28;
            _os_log_error_impl(&dword_23814D000, v25, OS_LOG_TYPE_ERROR, "Reporting EBADMSG error for service id: %llu", (uint8_t *)&v29, 0xCu);
          }
        }
        else
        {
          if (int64 != -6776) {
            return;
          }
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
          CFArrayRef v20 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = *(const char **)(v3 + 24);
            int v29 = 134217984;
            uint64_t v30 = v27;
            _os_log_error_impl(&dword_23814D000, v20, OS_LOG_TYPE_ERROR, "Reporting EAUTH error for service id: %llu", (uint8_t *)&v29, 0xCu);
          }
        }
      }
      else
      {
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        int v23 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = *(const char **)(v3 + 24);
          int v29 = 134217984;
          uint64_t v30 = v24;
          _os_log_impl(&dword_23814D000, v23, OS_LOG_TYPE_INFO, "Reporting success for service id: %llu", (uint8_t *)&v29, 0xCu);
        }
      }
      nw_resolver_config_report_error();
      break;
    case 2:
      if (xdict && *(char **)(v3 + 64) == v5)
      {
        BOOL v8 = xpc_dictionary_get_BOOL(xdict, "cannot_connect");
        if (_mdns_dns_service_log_s_once != -1) {
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
        }
        CFAllocatorRef v9 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v10 = "";
          CFMutableArrayRef v11 = *(const char **)(v3 + 24);
          int v29 = 136446722;
          if (v8) {
            __int16 v10 = "not";
          }
          uint64_t v30 = v10;
          __int16 v31 = 2048;
          __int16 v32 = v11;
          __int16 v33 = 2112;
          uint64_t v34 = v5;
          _os_log_impl(&dword_23814D000, v9, OS_LOG_TYPE_DEFAULT, "Resolver can%{public}s connect -- service id: %llu, resolver: %@", (uint8_t *)&v29, 0x20u);
        }
        if (v8)
        {
          if (*(unsigned char *)(v3 + 283)) {
            return;
          }
          *(unsigned char *)(v3 + 283) = 1;
        }
        else
        {
          if (!*(unsigned char *)(v3 + 283)) {
            return;
          }
          *(unsigned char *)(v3 + 283) = 0;
        }
        unsigned int v19 = v4[12];
        if (v19) {
          dispatch_source_merge_data(v19, 1uLL);
        }
      }
      break;
    default:
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEBUG))
      {
        if (xdict)
        {
          uint64_t v18 = (char *)MEMORY[0x23EC89910](xdict);
          if (_mdns_dns_service_log_s_once != -1) {
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
          }
        }
        else
        {
          uint64_t v18 = 0;
        }
        CFArrayRef v21 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEBUG))
        {
          __int16 v26 = "<invalid event value>";
          int v29 = 138412802;
          uint64_t v30 = (const char *)v3;
          if (!a2) {
            __int16 v26 = "null";
          }
          __int16 v31 = 2080;
          __int16 v32 = v26;
          __int16 v33 = 2082;
          uint64_t v34 = v18;
          _os_log_debug_impl(&dword_23814D000, v21, OS_LOG_TYPE_DEBUG, "DNS service (%@) got unhandled event: %s info: %{public}s", (uint8_t *)&v29, 0x20u);
          if (!v18) {
            return;
          }
        }
        else if (!v18)
        {
          return;
        }
        free(v18);
      }
      break;
  }
}

void ___mdns_dns_service_manager_schedule_ddr_probe_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  _mdns_dns_service_forget_all_ddr_queriers(v2);

  _mdns_dns_service_manager_start_ddr_querier_ex(v1, v2, 0);
}

void _mdns_dns_service_manager_start_ddr_querier_ex(void *a1, uint64_t a2, char *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v4 = *(void **)(a2 + 64);
  if (v4)
  {
    if (a3 && !*(void *)(a2 + 192))
    {
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
      *(void *)(a2 + 192) = Mutable;
      if (!Mutable) {
        return;
      }
      int v4 = *(void **)(a2 + 64);
    }
    querier = mdns_resolver_create_querier(v4, 0);
    if (querier)
    {
      uint64_t v15 = (uint64_t)querier;
      ++*(_DWORD *)(a2 + 268);
      mdns_querier_set_log_label((uint64_t)querier, "S%llu.DDR%u", v9, v10, v11, v12, v13, v14, *(void *)(a2 + 24));
      if (_mdns_dns_service_queue_s_once != -1) {
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
      }
      mdns_client_set_queue(v15, (dispatch_object_t)_mdns_dns_service_queue_s_queue);
      if (a3) {
        uint64_t v16 = a3;
      }
      else {
        uint64_t v16 = "\x04_dns\bresolver\x04arpa";
      }
      mdns_querier_set_query(v15, v16, 64, 1);
      if (!*(unsigned char *)(v15 + 49)) {
        *(_DWORD *)(v15 + 236) = -1;
      }
      if (a3)
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 192), (const void *)v15);
      }
      else
      {
        uint64_t v17 = *(void *)(a2 + 184);
        if (v17)
        {
          mdns_client_invalidate(v17);
          os_release(*(void **)(a2 + 184));
        }
        *(void *)(a2 + 184) = v15;
        os_retain((void *)v15);
      }
      os_retain(a1);
      os_retain((void *)a2);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___mdns_dns_service_manager_start_ddr_querier_ex_block_invoke;
      aBlock[3] = &__block_descriptor_tmp_218;
      aBlock[4] = a2;
      aBlock[5] = v15;
      aBlock[6] = a1;
      aBlock[7] = a3;
      mdns_querier_set_result_handler(v15, aBlock);
      os_retain((void *)v15);
      if (_mdns_resolver_queue_s_once != -1) {
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
      }
      *(void *)&long long block = MEMORY[0x263EF8330];
      *((void *)&block + 1) = 0x40000000;
      int v22 = __mdns_querier_set_time_limit_ms_block_invoke;
      int v23 = &__block_descriptor_tmp_7_1453;
      uint64_t v24 = v15;
      int v25 = 15000;
      dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, &block);
      mdns_client_activate(v15);
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v18 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = "alias ";
        if (!a3) {
          unsigned int v19 = "";
        }
        LODWORD(block) = 136446210;
        *(void *)((char *)&block + 4) = v19;
        _os_log_error_impl(&dword_23814D000, v18, OS_LOG_TYPE_ERROR, "Failed to create DDR %{public}squerier", (uint8_t *)&block, 0xCu);
      }
    }
  }
}

uint64_t ___mdns_dns_service_manager_prepare_push_service_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  if (!*(unsigned char *)(v2 + 103)) {
    CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 64), a2);
  }
  return 1;
}

void ___mdns_dns_service_manager_start_ddr_querier_ex_block_invoke(uint64_t a1)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(const void **)(a1 + 40);
  if (*(const void **)(v3 + 184) == v2)
  {
    if (v2)
    {
      os_release(*(void **)(a1 + 40));
      *(void *)(v3 + 184) = 0;
    }
  }
  else
  {
    CFArrayRef v4 = *(const __CFArray **)(v3 + 192);
    if (!v4) {
      goto LABEL_164;
    }
    v143.length = CFArrayGetCount(v4);
    v143.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(v3 + 192), v143, v2);
    if (FirstIndexOfValue < 0) {
      goto LABEL_164;
    }
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v3 + 192), FirstIndexOfValue);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v6 + 248) == 1)
  {
    uint64_t v7 = *(void *)(v6 + 136);
    if (v7)
    {
      unint64_t v8 = *(void *)(v7 + 32);
      unint64_t v9 = *(unsigned int *)(v7 + 40);
    }
    else
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0;
    }
    if (*(void *)(a1 + 56)) {
      v77 = *(unsigned __int8 **)(*(void *)(*(void *)(v6 + 88) + 56) + 24);
    }
    else {
      v77 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(CFArrayRef **)(a1 + 48);
    int AnswerSection = 0;
    *(void *)v89 = 0;
    uint64_t v12 = (unsigned __int16 *)DNSMessageCollapse(v8, v9, v89, (uint64_t *)&AnswerSection);
    if (!AnswerSection)
    {
      uint64_t v13 = *(const void **)(v10 + 152);
      if (v13)
      {
        CFRelease(v13);
        *(void *)(v10 + 152) = 0;
      }
      *(unsigned char *)(v10 + 287) = 0;
      if (*(void *)v89 >= 0xCuLL)
      {
        unsigned int v14 = __rev16(v12[3]);
        if (v14)
        {
          v88 = 0;
          int AnswerSection = DNSMessageGetAnswerSection((unint64_t)v12, *(unint64_t *)v89, &v88);
          if (!AnswerSection)
          {
            group = dispatch_group_create();
            int v15 = 0;
            *(void *)uint64_t v87 = v88;
            v76 = (void *)*MEMORY[0x263F14468];
            while (1)
            {
              unint64_t v85 = 0;
              uint64_t v86 = 0;
              int AnswerSection = _DNSMessageExtractRecordEx((unint64_t)v12, *(uint64_t *)v89, *(char **)v87, 0, 0, 0, 0, &v86, &v85, 0, 0, 0, 0, v87);
              if (AnswerSection) {
                goto LABEL_162;
              }
              uint64_t v16 = v86;
              if (v86)
              {
                unint64_t v17 = v85;
                if (v85 >= 2)
                {
                  if (*v86)
                  {
                    *(void *)long long buf = 0;
                    *(void *)&uint8_t buf[8] = buf;
                    *(void *)&buf[16] = 0x2000000000;
                    LOBYTE(v116) = 0;
                    uint64_t block = MEMORY[0x263EF8330];
                    uint64_t v107 = 0x40000000;
                    v108 = __dnssd_svcb_is_valid_block_invoke;
                    v109 = &unk_264D07258;
                    v110 = buf;
                    _dnssd_svcb_extract_values(v86, v85, 0, (uint64_t)&block);
                    int v18 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
                    _Block_object_dispose(buf, 8);
                    if (!v18)
                    {
                      unint64_t v17 = v85;
                      uint64_t v16 = v86;
                      if (v85 >= 2)
                      {
LABEL_29:
                        if (!*v16)
                        {
                          if (!v77)
                          {
                            unsigned int v19 = v16 + 1;
                            if (v16 != (unsigned __int16 *)-2 && (unsigned __int16 *)((char *)v16 + v17) > v19)
                            {
                              CFArrayRef v20 = v16 + 1;
                              while (*v20)
                              {
                                v20 += *v20 + 1;
                                if (v20) {
                                  BOOL v21 = v20 >= (unsigned char *)v16 + v17;
                                }
                                else {
                                  BOOL v21 = 1;
                                }
                                if (v21) {
                                  goto LABEL_33;
                                }
                              }
                              if ((unsigned __int16)((_WORD)v20 - (_WORD)v19 + 1) <= 0x100uLL) {
                                _mdns_dns_service_manager_start_ddr_querier_ex(v11, v10);
                              }
                            }
                          }
                          goto LABEL_33;
                        }
                      }
                      uint64_t v81 = 0;
                      v82 = &v81;
                      uint64_t v83 = 0x2000000000;
                      char v84 = 0;
                      v80[0] = MEMORY[0x263EF8330];
                      v80[1] = 0x40000000;
                      v80[2] = ___mdns_dns_service_manager_process_ddr_response_block_invoke;
                      v80[3] = &unk_264D06588;
                      v80[4] = &v81;
                      uint64_t block = MEMORY[0x263EF8330];
                      uint64_t v107 = 0x40000000;
                      v108 = __dnssd_svcb_access_alpn_values_block_invoke;
                      v109 = &unk_264D072F8;
                      v110 = v80;
                      _dnssd_svcb_extract_values(v16, v17, 1, (uint64_t)&block);
                      if (!*((unsigned char *)v82 + 24)) {
                        goto LABEL_32;
                      }
                      if (v85 < 2) {
                        goto LABEL_32;
                      }
                      int v22 = v86;
                      int v23 = v86 + 1;
                      if (v86 == (unsigned __int16 *)-2 || (unsigned __int16 *)((char *)v86 + v85) <= v23) {
                        goto LABEL_32;
                      }
                      uint64_t v24 = v86 + 1;
                      while (*(unsigned char *)v24)
                      {
                        uint64_t v24 = (unsigned __int16 *)((char *)v24 + *(unsigned __int8 *)v24 + 1);
                        if (v24) {
                          BOOL v25 = v24 >= (unsigned __int16 *)((char *)v86 + v85);
                        }
                        else {
                          BOOL v25 = 1;
                        }
                        if (v25) {
                          goto LABEL_32;
                        }
                      }
                      if ((unsigned __int16)((_WORD)v24 - (_WORD)v23 + 1) > 0x100uLL) {
                        goto LABEL_32;
                      }
                      uint64_t v26 = malloc_type_calloc(1uLL, 0x3F1uLL, 0xF1748037uLL);
                      if (!v26) {
                        __break(1u);
                      }
                      LODWORD(v27) = *((unsigned __int8 *)v22 + 2);
                      __int16 v28 = v26;
                      if (*((unsigned char *)v22 + 2)
                        || (*uint64_t v26 = 46, v28 = v26 + 1, LODWORD(v27) = *(unsigned __int8 *)v23, *(unsigned char *)v23))
                      {
                        while (v27 <= 0x3F)
                        {
                          int v29 = (unsigned __int8 *)v23 + 1;
                          unint64_t v30 = (unint64_t)v23 + v27 + 1;
                          if (v30 >= (unint64_t)(v22 + 129)) {
                            break;
                          }
                          if ((unint64_t)v29 < v30)
                          {
                            uint64_t v27 = v27;
                            do
                            {
                              unsigned int v32 = *v29++;
                              unsigned int v31 = v32;
                              if (v32 == 92 || v31 == 46)
                              {
                                *v28++ = 92;
                              }
                              else if (v31 <= 0x20)
                              {
                                *(_WORD *)__int16 v28 = 12380;
                                unsigned int v33 = (205 * v31) >> 11;
                                v28[2] = v33 | 0x30;
                                v28 += 3;
                                LOBYTE(v31) = (v31 - 10 * v33) | 0x30;
                              }
                              *v28++ = v31;
                              --v27;
                            }
                            while (v27);
                          }
                          *__int16 v28 = 0;
                          uint64_t v34 = (char *)v23 + *(unsigned __int8 *)v23;
                          *v28++ = 46;
                          int v35 = v34[1];
                          int v23 = (unsigned __int16 *)(v34 + 1);
                          LODWORD(v27) = v35;
                          if (!v35) {
                            goto LABEL_72;
                          }
                        }
LABEL_148:
                        free(v26);
LABEL_32:
                        _Block_object_dispose(&v81, 8);
                        goto LABEL_33;
                      }
LABEL_72:
                      *__int16 v28 = 0;
                      if (v28 == (unsigned char *)-1) {
                        goto LABEL_148;
                      }
                      __s = v26;
                      int is_empty = dnssd_svcb_service_name_is_empty((uint64_t)v86, v85);
                      int v37 = __s;
                      p_uint64_t block = __s;
                      if (is_empty)
                      {
                        if (!v77) {
                          goto LABEL_147;
                        }
                        p_uint64_t block = (const char *)&block;
                        int v39 = DomainNameToString(v77, 0, (unsigned __int8 *)&block, 0);
                        int v37 = __s;
                        if (v39) {
                          goto LABEL_147;
                        }
                      }
                      size_t v40 = strlen(p_block);
                      if (v40 && p_block[v40 - 1] == 46) {
                        p_block[v40 - 1] = 0;
                      }
                      os_log_t log = (os_log_t)p_block;
                      uint64_t configure_tls = 0;
                      p_uint64_t configure_tls = (uint64_t)&configure_tls;
                      uint64_t v135 = 0x2000000000;
                      LOWORD(v136) = 0;
                      *(void *)long long buf = MEMORY[0x263EF8330];
                      *(void *)&uint8_t buf[8] = 0x40000000;
                      *(void *)&buf[16] = __dnssd_svcb_get_port_block_invoke;
                      *(void *)&long long v116 = &unk_264D07280;
                      *((void *)&v116 + 1) = &configure_tls;
                      _dnssd_svcb_extract_values(v86, v85, 3, (uint64_t)buf);
                      unsigned int v68 = *(unsigned __int16 *)(p_configure_tls + 24);
                      _Block_object_dispose(&configure_tls, 8);
                      uint64_t configure_tls = 0;
                      p_uint64_t configure_tls = (uint64_t)&configure_tls;
                      uint64_t v135 = 0x2000000000;
                      v136 = 0;
                      *(void *)long long buf = MEMORY[0x263EF8330];
                      *(void *)&uint8_t buf[8] = 0x40000000;
                      *(void *)&buf[16] = __dnssd_svcb_copy_doh_path_block_invoke;
                      *(void *)&long long v116 = &unk_264D072A8;
                      *((void *)&v116 + 1) = &configure_tls;
                      _dnssd_svcb_extract_values(v86, v85, 7, (uint64_t)buf);
                      int v41 = *(char **)(p_configure_tls + 24);
                      _Block_object_dispose(&configure_tls, 8);
                      if (v41)
                      {
                        BOOL v42 = strchr(v41, 123);
                        if (v42) {
                          *BOOL v42 = 0;
                        }
                      }
                      uint64_t v79 = 0;
                      uint64_t configure_tls = 0;
                      p_uint64_t configure_tls = (uint64_t)&configure_tls;
                      uint64_t v135 = 0x2000000000;
                      v136 = 0;
                      *(void *)long long buf = MEMORY[0x263EF8330];
                      *(void *)&uint8_t buf[8] = 0x40000000;
                      *(void *)&buf[16] = __dnssd_svcb_copy_odoh_config_block_invoke;
                      *(void *)&long long v116 = &unk_264D072D0;
                      *((void *)&v116 + 1) = &configure_tls;
                      p_isa = &v79;
                      _dnssd_svcb_extract_values(v86, v85, 32769, (uint64_t)buf);
                      int v43 = *(void **)(p_configure_tls + 24);
                      _Block_object_dispose(&configure_tls, 8);
                      int v44 = *((unsigned __int8 *)v82 + 24);
                      int v45 = v79;
                      if (v44 == 3 && v43 && v79)
                      {
                        int v44 = 4;
                        *((unsigned char *)v82 + 24) = 4;
                      }
                      nw_endpoint_t endpoint = v45;
                      uint64_t v74 = v43;
                      uint64_t configure_tls = 0;
                      p_uint64_t configure_tls = (uint64_t)&configure_tls;
                      uint64_t v135 = 0x2000000000;
                      v136 = 0;
                      *(void *)long long buf = MEMORY[0x263EF8330];
                      *(void *)&uint8_t buf[8] = 0x40000000;
                      *(void *)&buf[16] = ___mdns_dns_service_get_discovered_alt_block_invoke;
                      *(void *)&long long v116 = &unk_264D065F0;
                      int v71 = v44;
                      LOBYTE(v118) = v44;
                      p_isa = &log->isa;
                      *((void *)&v116 + 1) = &configure_tls;
                      CFArrayRef v46 = *(const __CFArray **)(v10 + 144);
                      if (v46)
                      {
                        mdns_cfarray_enumerate(v46, (uint64_t)buf);
                        CFArrayRef v47 = *(const void **)(p_configure_tls + 24);
                        _Block_object_dispose(&configure_tls, 8);
                        if (v47)
                        {
                          _mdns_dns_service_manager_add_pending_alt(v11, v10, v47);
                          if (!v41) {
                            goto LABEL_144;
                          }
LABEL_143:
                          free(v41);
                          goto LABEL_144;
                        }
                      }
                      else
                      {
                        _Block_object_dispose(&configure_tls, 8);
                      }
                      if ((v71 - 2) > 2) {
                        goto LABEL_107;
                      }
                      uint64_t v67 = v41;
                      uint64_t v48 = nw_resolver_config_create();
                      nw_resolver_config_set_class();
                      nw_resolver_config_set_protocol();
                      nw_resolver_config_set_provider_name();
                      if (v67) {
                        nw_resolver_config_set_provider_path();
                      }
                      obj = (void *)v48;
                      if (v74 != 0 && endpoint != 0) {
                        nw_resolver_config_set_odoh_config();
                      }
                      if (*(void *)(v10 + 104) || (unsigned int v58 = *(_DWORD *)(v10 + 256)) != 0 && if_indextoname(v58, buf)) {
                        nw_resolver_config_set_interface_name();
                      }
                      uint64_t configure_tls = 0;
                      p_uint64_t configure_tls = 0;
                      MEMORY[0x23EC89840](&configure_tls);
                      nw_resolver_config_set_identifier();
                      int v41 = v67;
                      if (obj)
                      {
                        if (nw_resolver_config_get_class() == 4)
                        {
                          LODWORD(configure_tls) = 0;
                          CFIndex v49 = _mdns_dns_service_create_discovered_alt(v10, obj, v68, 0, 0, &configure_tls);
                          if (v49)
                          {
                            uint64_t v50 = (char *)v49;
                            LODWORD(configure_tls) = _mdns_dns_service_manager_add_pending_alt(v11, v10, v49);
                            nw_release(obj);
                            os_release(v50);
                          }
                          else
                          {
                            if (_mdns_dns_service_log_s_once != -1) {
                              dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                            }
                            uint64_t v63 = _mdns_dns_service_log_s_log;
                            if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)long long buf = 134217984;
                              *(void *)&uint8_t buf[4] = (int)configure_tls;
                              _os_log_error_impl(&dword_23814D000, v63, OS_LOG_TYPE_ERROR, "Failed to create discovered oblivious DNS service -- error: %{mdns:err}ld", buf, 0xCu);
                            }
                            nw_release(obj);
                          }
                          int v41 = v67;
                          if (v67) {
                            goto LABEL_143;
                          }
LABEL_144:
                          if (v74) {
                            free(v74);
                          }
                          int v37 = __s;
LABEL_147:
                          uint64_t v26 = v37;
                          goto LABEL_148;
                        }
                        if (_mdns_dns_service_log_s_once != -1) {
                          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                        }
                        int v53 = _mdns_dns_service_log_s_log;
                        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)long long buf = 67109891;
                          uint64_t v54 = "";
                          if (v67) {
                            uint64_t v54 = v67;
                          }
                          *(_DWORD *)&uint8_t buf[4] = v71;
                          *(_WORD *)&uint8_t buf[8] = 2081;
                          *(void *)&buf[10] = log;
                          *(_WORD *)&buf[18] = 1024;
                          *(_DWORD *)&buf[20] = v68;
                          LOWORD(v116) = 2081;
                          *(void *)((char *)&v116 + 2) = v54;
                          _os_log_impl(&dword_23814D000, v53, OS_LOG_TYPE_INFO, "Verifying discovered service -- type: %{mdns:dns_service_type}d, provider name: %{private}s, port: %d, path: %{private}s", buf, 0x22u);
                        }
                        aBlock[0] = MEMORY[0x263EF8330];
                        aBlock[1] = 0x40000000;
                        aBlock[2] = ___mdns_dns_service_manager_register_discovered_service_block_invoke;
                        aBlock[3] = &__block_descriptor_tmp_224;
                        aBlock[4] = v10;
                        aBlock[5] = obj;
                        __int16 v92 = v68;
                        aBlock[6] = v11;
                        v105[0] = 0;
                        v105[1] = v105;
                        v105[2] = 0x2000000000;
                        v105[3] = 0;
                        v104[0] = 0;
                        v104[1] = v104;
                        v104[2] = 0x2000000000;
                        v104[3] = 0;
                        v102[0] = 0;
                        v102[1] = v102;
                        v102[2] = 0x2000000000;
                        char v103 = 0;
                        endpointa = nw_endpoint_create_host_with_numeric_port();
                        uint64_t configure_tls = MEMORY[0x263EF8330];
                        p_uint64_t configure_tls = 0x40000000;
                        uint64_t v135 = (uint64_t)___mdns_dns_service_manager_probe_discovered_service_block_invoke;
                        v136 = &unk_264D06668;
                        char v141 = v71;
                        v137 = v102;
                        v138 = v105;
                        v139 = v104;
                        os_log_t v140 = log;
                        uint64_t v55 = nw_parameters_create_secure_tcp(&configure_tls, v76);
                        dispatch_source_t v56 = *(char **)(v10 + 104);
                        if (v56 || (v59 = *(_DWORD *)(v10 + 256)) != 0 && (dispatch_source_t v56 = if_indextoname(v59, v132)) != 0)
                        {
                          if (_mdns_dns_service_log_s_once != -1) {
                            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                          }
                          loga = _mdns_dns_service_log_s_log;
                          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
                          {
                            LODWORD(v127) = 136446210;
                            *(void *)((char *)&v127 + 4) = v56;
                            _os_log_impl(&dword_23814D000, loga, OS_LOG_TYPE_INFO, "Scoping discovered service to %{public}s", (uint8_t *)&v127, 0xCu);
                          }
                          unsigned int v57 = nw_interface_create_with_name();
                          nw_parameters_require_interface(v55, v57);
                          if (v57) {
                            nw_release(v57);
                          }
                        }
                        uint64_t v98 = 0;
                        v99 = &v98;
                        uint64_t v100 = 0x2000000000;
                        nw_connection_t v101 = 0;
                        nw_connection_t v101 = nw_connection_create(endpointa, v55);
                        if (endpointa) {
                          nw_release(endpointa);
                        }
                        if (v55) {
                          nw_release(v55);
                        }
                        uint64_t v60 = v99[3];
                        if (_mdns_dns_service_queue_s_once != -1) {
                          dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
                        }
                        nw_connection_set_queue(v60, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
                        os_retain((void *)v10);
                        dispatch_group_enter(group);
                        v96[0] = 0;
                        v96[1] = v96;
                        v96[2] = 0x2000000000;
                        char v97 = 0;
                        v94[0] = 0;
                        v94[1] = v94;
                        v94[2] = 0x2000000000;
                        char v95 = 0;
                        v93[0] = 0;
                        v93[1] = v93;
                        v93[2] = 0x2000000000;
                        v93[3] = 0;
                        *(void *)&long long v127 = 0;
                        *((void *)&v127 + 1) = &v127;
                        uint64_t v128 = 0x3002000000;
                        v129 = __Block_byref_object_copy_;
                        v130 = __Block_byref_object_dispose_;
                        v131 = 0;
                        v131 = _Block_copy(aBlock);
                        uint64_t v61 = v99[3];
                        *(void *)long long buf = MEMORY[0x263EF8330];
                        *(void *)&uint8_t buf[8] = 0x40000000;
                        *(void *)&buf[16] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_232;
                        *(void *)&long long v116 = &unk_264D066B8;
                        *((void *)&v116 + 1) = &v98;
                        p_isa = v96;
                        char v126 = v71;
                        v118 = v105;
                        v119 = v104;
                        v120 = v94;
                        v121 = v93;
                        uint64_t v124 = v10;
                        v125 = group;
                        v122 = &v127;
                        v123 = v102;
                        nw_connection_set_state_changed_handler(v61, buf);
                        nw_connection_start((nw_connection_t)v99[3]);
                        if (*(void *)(v10 + 208) || (uint64_t v62 = nw_array_create(), (*(void *)(v10 + 208) = v62) != 0))
                        {
                          nw_array_append();
                        }
                        else
                        {
                          if (_mdns_dns_service_log_s_once != -1) {
                            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                          }
                          uint64_t v64 = _mdns_dns_service_log_s_log;
                          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v65 = *(void *)(v10 + 24);
                            *(_DWORD *)v113 = 134217984;
                            uint64_t v114 = v65;
                            _os_log_error_impl(&dword_23814D000, v64, OS_LOG_TYPE_ERROR, "Cancelling service's DDR verification connection because of lack of resources -- service id: %llu", v113, 0xCu);
                          }
                          nw_connection_cancel((nw_connection_t)v99[3]);
                        }
                        int v41 = v67;
                        _Block_object_dispose(&v127, 8);
                        _Block_object_dispose(v93, 8);
                        _Block_object_dispose(v94, 8);
                        _Block_object_dispose(v96, 8);
                        _Block_object_dispose(&v98, 8);
                        _Block_object_dispose(v102, 8);
                        _Block_object_dispose(v104, 8);
                        _Block_object_dispose(v105, 8);
                      }
                      else
                      {
LABEL_107:
                        if (_mdns_dns_service_log_s_once != -1) {
                          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
                        }
                        __int16 v51 = _mdns_dns_service_log_s_log;
                        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)long long buf = 67109891;
                          int v52 = "";
                          if (v41) {
                            int v52 = v41;
                          }
                          *(_DWORD *)&uint8_t buf[4] = v71;
                          *(_WORD *)&uint8_t buf[8] = 2081;
                          *(void *)&buf[10] = log;
                          *(_WORD *)&buf[18] = 1024;
                          *(_DWORD *)&buf[20] = v68;
                          LOWORD(v116) = 2081;
                          *(void *)((char *)&v116 + 2) = v52;
                          _os_log_error_impl(&dword_23814D000, v51, OS_LOG_TYPE_ERROR, "Failed to create discovered DNS config -- type: %{mdns:dns_service_type}d, provider name: %{private}s, port: %d, path: %{private}s", buf, 0x22u);
                          if (v41) {
                            goto LABEL_143;
                          }
                          goto LABEL_144;
                        }
                      }
                      if (!v41) {
                        goto LABEL_144;
                      }
                      goto LABEL_143;
                    }
                  }
                  else if ((dnssd_svcb_service_name_is_empty((uint64_t)v86, v85) & 1) == 0)
                  {
                    goto LABEL_29;
                  }
                }
              }
LABEL_33:
              if (++v15 == v14)
              {
                os_retain(v11);
                os_retain((void *)v10);
                if (_mdns_dns_service_queue_s_once != -1) {
                  dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
                }
                uint64_t block = MEMORY[0x263EF8330];
                uint64_t v107 = 0x40000000;
                v108 = ___mdns_dns_service_manager_process_ddr_response_block_invoke_2;
                v109 = &__block_descriptor_tmp_222;
                v110 = (unsigned char *)v10;
                v111 = v11;
                v112 = group;
                dispatch_group_notify(group, (dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
                goto LABEL_162;
              }
            }
          }
        }
        goto LABEL_163;
      }
    }
LABEL_162:
    if (v12) {
LABEL_163:
    }
      free(v12);
  }
LABEL_164:
  os_release(*(void **)(a1 + 48));
  os_release(*(void **)(a1 + 32));
  os_release(*(void **)(a1 + 40));
}

uint64_t ___mdns_dns_service_manager_process_ddr_response_block_invoke(uint64_t a1, char *__s1)
{
  if (!strcmp(__s1, "dot"))
  {
    char v4 = 2;
    goto LABEL_5;
  }
  if (!strcmp(__s1, "h2"))
  {
    char v4 = 3;
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
  return 1;
}

BOOL ___mdns_dns_service_get_discovered_alt_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 96))
  {
    if (*(unsigned __int8 *)(a2 + 281) == *(unsigned __int8 *)(a1 + 48))
    {
      uint64_t provider_name = (const char *)nw_resolver_config_get_provider_name();
      if (!strcasecmp(provider_name, *(const char **)(a1 + 40))) {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
      }
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_manager_add_pending_alt(CFArrayRef *a1, uint64_t a2, const void *a3)
{
  CFArrayRef Mutable = *(const __CFArray **)(a2 + 152);
  if (!Mutable)
  {
    CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
    *(void *)(a2 + 152) = Mutable;
    if (!Mutable) {
      return 4294960567;
    }
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___mdns_dns_service_array_contains_service_block_invoke;
  v9[3] = &__block_descriptor_tmp_147;
  v9[4] = a3;
  uint64_t result = mdns_cfarray_enumerate(Mutable, (uint64_t)v9);
  if (result)
  {
    unint64_t v8 = *(__CFArray **)(a2 + 152);
    _mdns_dns_service_increment_use_count((uint64_t)a3);
    CFArrayAppendValue(v8, a3);
    _mdns_dns_service_manager_update_interface_properties_for_service(a1, (uint64_t)a3);
    return 0;
  }
  return result;
}

const char *_mdns_dns_service_create_discovered_alt(uint64_t a1, void *a2, unsigned int a3, int a4, uint64_t a5, _DWORD *a6)
{
  uint64_t result = (const char *)nw_resolver_config_get_provider_name();
  if (a5)
  {
    if (!result || (uint64_t result = strdup(result)) == 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v13 = (char *)result;
    nw_resolver_config_set_provider_name();
  }
  else
  {
    uint64_t v13 = 0;
  }
  int v30 = 0;
  unsigned int v14 = _mdns_dns_service_create_from_resolver_config(a2, 4, *(unsigned char *)(a1 + 280), &v30);
  uint64_t v15 = (uint64_t)v14;
  if (!v30)
  {
    *((void *)v14 + 17) = a1;
    os_retain((void *)a1);
    *(_WORD *)(v15 + 276) = *(_WORD *)(a1 + 276) & 0xE;
    *(_WORD *)(v15 + 278) = a3;
    if (v13) {
      *(void *)(v15 + 176) = v13;
    }
    if (a4)
    {
      uint64_t v16 = *(const void **)(v15 + 80);
      if (v16)
      {
        CFRelease(v16);
        *(void *)(v15 + 80) = 0;
      }
      CFArrayRef v17 = *(const __CFArray **)(a1 + 80);
      if (v17)
      {
        CFIndex Count = CFArrayGetCount(v17);
        if (Count >= 1)
        {
          CFIndex v19 = Count;
          CFIndex v20 = 0;
          __int16 v21 = __rev16(a3);
          while (1)
          {
            uint64_t ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), v20);
            int v23 = ValueAtIndex;
            int v24 = *((unsigned __int8 *)ValueAtIndex + 25);
            if (v24 == 30) {
              break;
            }
            if (v24 == 2)
            {
              int v25 = ValueAtIndex[7];
              uint64_t v26 = _mdns_address_new();
              if (!v26) {
                goto LABEL_24;
              }
              uint64_t v27 = (void *)v26;
              *(_WORD *)(v26 + 24) = 528;
              *(_WORD *)(v26 + 26) = v21;
              *(_DWORD *)(v26 + 28) = v25;
LABEL_21:
              _mdns_dns_service_append_address(v15, v27);
              os_release(v27);
            }
LABEL_22:
            if (v19 == ++v20) {
              goto LABEL_25;
            }
          }
          int v28 = ValueAtIndex[12];
          uint64_t v29 = _mdns_address_new();
          if (!v29)
          {
LABEL_24:
            _mdns_dns_service_append_address(v15, 0);
            goto LABEL_22;
          }
          uint64_t v27 = (void *)v29;
          *(_WORD *)(v29 + 24) = 7708;
          *(_WORD *)(v29 + 26) = v21;
          *(_OWORD *)(v29 + 32) = *((_OWORD *)v23 + 2);
          *(_DWORD *)(v29 + 48) = v28;
          goto LABEL_21;
        }
      }
    }
LABEL_25:
    uint64_t v13 = 0;
  }
  if (a6) {
    *a6 = v30;
  }
  if (v13) {
    free(v13);
  }
  return (const char *)v15;
}

void ___mdns_dns_service_manager_register_discovered_service_block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(_WORD *)(v6 + 276))
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v10 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(char **)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)long long buf = 134217984;
      CFIndex v19 = v11;
      uint64_t v12 = "Service became defunct before discovered child service could be validated -- service id: %llu";
      uint64_t v13 = v10;
      uint32_t v14 = 12;
LABEL_19:
      _os_log_impl(&dword_23814D000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
LABEL_20:
    nw_release(*(void **)(a1 + 40));
    if (!a4) {
      return;
    }
    goto LABEL_21;
  }
  if (!a2)
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v15 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v12 = "Failed to validate discovered service, ignoring";
      uint64_t v13 = v15;
      uint32_t v14 = 2;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int v17 = 0;
  uint64_t v7 = _mdns_dns_service_create_discovered_alt(v6, *(void **)(a1 + 40), *(unsigned __int16 *)(a1 + 56), a3, (uint64_t)a4, &v17);
  if (!v7)
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v16 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      CFIndex v19 = (char *)v17;
      _os_log_error_impl(&dword_23814D000, v16, OS_LOG_TYPE_ERROR, "Failed to create discovered DNS service -- error: %{mdns:err}ld", buf, 0xCu);
    }
    goto LABEL_20;
  }
  unint64_t v8 = (char *)v7;
  int v17 = _mdns_dns_service_manager_add_pending_alt(*(CFArrayRef **)(a1 + 48), *(void *)(a1 + 32), v7);
  if (!v17)
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    unint64_t v9 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex v19 = v8;
      _os_log_impl(&dword_23814D000, v9, OS_LOG_TYPE_INFO, "Registered discovered service -- %@", buf, 0xCu);
    }
  }
  nw_release(*(void **)(a1 + 40));
  os_release(v8);
  if (a4) {
LABEL_21:
  }
    free(a4);
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke(uint64_t a1, id a2)
{
  uint64_t v3 = a2;
  if (!v3) {
    return;
  }
  char v4 = v3;
  sec_protocol_options_set_tls_server_name(v3, *(const char **)(a1 + 56));
  sec_protocol_options_set_peer_authentication_required(v4, 1);
  int v5 = *(unsigned __int8 *)(a1 + 64);
  if (v5 == 2)
  {
    uint64_t v6 = "dot";
LABEL_6:
    sec_protocol_options_add_tls_application_protocol(v4, v6);
    goto LABEL_7;
  }
  if ((v5 - 3) <= 1)
  {
    uint64_t v6 = "h2";
    goto LABEL_6;
  }
LABEL_7:
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2;
  v8[3] = &unk_264D06640;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v10 = v7;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  sec_protocol_options_set_verify_block(v4, v8, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
  sec_release(v4);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_232(uint64_t a1, int a2)
{
  if (*(void *)(*(void *)(a1 + 96) + 208) && nw_array_contains_object())
  {
    switch(a2)
    {
      case 1:
      case 4:
        char v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        uint64_t v5 = *(void *)(*(void *)(a1 + 96) + 208);
        _mdns_dns_service_forget_ddr_connection(v5, v4);
        break;
      case 3:
        long long v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (_mdns_dns_service_queue_s_once != -1)
        {
          uint64_t v12 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
          long long v10 = v12;
        }
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 0x40000000;
        v13[2] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2_233;
        void v13[3] = &unk_264D06690;
        uint64_t v17 = *(void *)(a1 + 96);
        char v18 = *(unsigned char *)(a1 + 112);
        long long v11 = *(_OWORD *)(a1 + 48);
        long long v14 = *(_OWORD *)(a1 + 32);
        long long v15 = v11;
        long long v16 = *(_OWORD *)(a1 + 64);
        nw_connection_access_establishment_report(v10, (dispatch_queue_t)_mdns_dns_service_queue_s_queue, v13);
        break;
      case 5:
        goto LABEL_8;
      default:
        return;
    }
  }
  else if (a2 == 5)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) + 16))();
    uint64_t v6 = *(const void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v6)
    {
      _Block_release(v6);
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = 0;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
    long long v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v7)
    {
      nw_release(v7);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
    os_release(*(void **)(a1 + 96));
    unint64_t v8 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    long long v9 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
}

void ___mdns_dns_service_manager_process_ddr_response_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 152))
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 152));
    uint64_t v2 = *(void *)(a1 + 32);
    if (Count >= 1)
    {
      *(unsigned char *)(v2 + 287) = 1;
      if (*(void *)(*(void *)(a1 + 40) + 96))
      {
        dispatch_source_merge_data(*(dispatch_source_t *)(*(void *)(a1 + 40) + 96), 1uLL);
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
  }
  os_release((void *)v2);
  os_release(*(void **)(a1 + 40));
  char v4 = *(NSObject **)(a1 + 48);
  if (v4)
  {
    dispatch_release(v4);
  }
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2_233(CFIndex a1, NSObject *a2)
{
  CFIndex v2 = a1;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 80) + 208) && nw_array_contains_object())
  {
    uint64_t v39 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v39 + 136);
    if (!v4 || !*(void *)(v4 + 96)) {
      uint64_t v4 = *(void *)(v2 + 80);
    }
    CFIndex v5 = *(void *)(*(void *)(v2 + 64) + 8);
    int v37 = (char **)(*(void *)(*(void *)(v2 + 72) + 8) + 24);
    LODWORD(v6) = *(unsigned __int8 *)(v2 + 88);
    CFArrayRef v7 = *(const __CFArray **)(*(void *)(*(void *)(v2 + 48) + 8) + 24);
    unint64_t v8 = *(void **)(v4 + 160);
    if (!v8
      || ((CFArrayRef v9 = *(const __CFArray **)(*(void *)(*(void *)(v2 + 56) + 8) + 24),
           string_ptr = xpc_string_get_string_ptr(v8),
           v9)
        ? (BOOL v11 = string_ptr == 0)
        : (BOOL v11 = 1),
          v11))
    {
      LODWORD(v14) = 0;
    }
    else
    {
      uint64_t v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], string_ptr, 0x8000100u);
      v56.length = CFArrayGetCount(v9);
      v56.location = 0;
      int v13 = CFArrayContainsValue(v9, v56, v12);
      LODWORD(v14) = v13 != 0;
      if (v13)
      {
        if (_mdns_dns_service_log_s_once != -1) {
          goto LABEL_76;
        }
        goto LABEL_15;
      }
LABEL_17:
      if (v12) {
        CFRelease(v12);
      }
    }
    CFArrayRef v16 = *(const __CFArray **)(v39 + 80);
    if (v16)
    {
      CFIndex Count = CFArrayGetCount(v16);
      if (Count >= 1)
      {
        int v36 = (int)v14;
        CFIndex v32 = v5;
        unsigned int v33 = a2;
        CFIndex v34 = v2;
        CFIndex v2 = 0;
        unsigned int v35 = v6 - 3;
        a2 = "0";
        while (1)
        {
          uint64_t ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v39 + 80), v2);
          if (v7)
          {
            char v18 = ValueAtIndex;
            CFIndex v19 = CFArrayGetCount(v7);
            if (v19 >= 1) {
              break;
            }
          }
          int v26 = 0;
LABEL_57:
          if (++v2 >= Count || (v26 & 1) != 0)
          {
            a2 = v33;
            CFIndex v2 = v34;
            CFIndex v5 = v32;
            LODWORD(v14) = v36;
            goto LABEL_62;
          }
        }
        CFIndex v5 = v19;
        uint64_t v6 = 1;
        while (1)
        {
          CFStringRef v20 = (const __CFString *)CFArrayGetValueAtIndex(v7, v6 - 1);
          __int16 v21 = mdns_cfstring_to_utf8_cstring(v20);
          if (v21) {
            break;
          }
          int v26 = 0;
LABEL_51:
          if (v6++ >= v5) {
            goto LABEL_57;
          }
        }
        long long v14 = v21;
        nw_endpoint_t host = nw_endpoint_create_host(v21, "0");
        if (!host)
        {
          int v26 = 0;
          goto LABEL_50;
        }
        uint64_t v12 = host;
        if (nw_endpoint_get_type(host) == nw_endpoint_type_address)
        {
          address = nw_endpoint_get_address(v12);
          int sa_family = address->sa_family;
          if (sa_family == *((unsigned __int8 *)v18 + 25) && address->sa_len == *((unsigned __int8 *)v18 + 24))
          {
            if (sa_family == 30)
            {
              if (*(void *)&address->sa_data[6] == v18[4] && *(void *)&address[1].sa_len == v18[5]) {
                goto LABEL_33;
              }
            }
            else if (sa_family == 2 && *(_DWORD *)&address->sa_data[2] == *((_DWORD *)v18 + 7))
            {
LABEL_33:
              if (_mdns_dns_service_log_s_once != -1) {
                dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
              }
              int v25 = _mdns_dns_service_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v12;
                _os_log_impl(&dword_23814D000, v25, OS_LOG_TYPE_INFO, "Discovered service verified, address %{public}@ in certificate", (uint8_t *)&buf, 0xCu);
              }
              if ((v36 & 1) == 0 && !*v37)
              {
                if (v35 <= 1 && sa_family == 30)
                {
                  asprintf(v37, "[%s]", v14);
                }
                else
                {
                  uint64_t v29 = strdup(v14);
                  if (!v29)
                  {
                    __break(1u);
LABEL_76:
                    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
LABEL_15:
                    long long v15 = _mdns_dns_service_log_s_log;
                    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
                    {
                      LODWORD(buf) = 138543362;
                      *(void *)((char *)&buf + 4) = v12;
                      _os_log_impl(&dword_23814D000, v15, OS_LOG_TYPE_INFO, "Discovered service verified, name \"%{public}@\" in certificate", (uint8_t *)&buf, 0xCu);
                    }
                    goto LABEL_17;
                  }
                  *int v37 = v29;
                }
              }
              int v26 = 1;
              goto LABEL_49;
            }
          }
        }
        int v26 = 0;
LABEL_49:
        nw_release(v12);
LABEL_50:
        free(v14);
        if (v26) {
          goto LABEL_57;
        }
        goto LABEL_51;
      }
    }
    else
    {
      CFIndex Count = 0;
    }
    int v26 = 0;
LABEL_62:
    uint64_t v40 = 0;
    int v41 = &v40;
    uint64_t v42 = 0x2000000000;
    char v43 = 0;
    if (a2)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 0x40000000;
      CFArrayRef v47 = ___mdns_dns_server_validate_discovered_service_connection_block_invoke;
      uint64_t v48 = &unk_264D06708;
      CFIndex v49 = &v40;
      char v53 = (char)v14;
      char v54 = v26;
      CFIndex v50 = Count;
      uint64_t v51 = v39;
      int v52 = v37;
      nw_establishment_report_enumerate_resolution_reports(a2, &buf);
    }
    if ((v14 | v26))
    {
      char v30 = 1;
    }
    else if (*((unsigned char *)v41 + 24))
    {
      char v30 = 1;
      *(unsigned char *)(v5 + 24) = 1;
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      unsigned int v31 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 138412290;
        uint64_t v45 = v39;
        _os_log_error_impl(&dword_23814D000, v31, OS_LOG_TYPE_ERROR, "Discovered service could not be verified for %@", v44, 0xCu);
      }
      char v30 = 0;
    }
    _Block_object_dispose(&v40, 8);
    *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = v30;
    _mdns_dns_service_forget_ddr_connection(*(void *)(*(void *)(v2 + 80) + 208), *(NSObject **)(*(void *)(*(void *)(v2 + 32) + 8) + 24));
  }
}

void _mdns_dns_service_forget_ddr_connection(uint64_t a1, NSObject *a2)
{
  if (a1 && nw_array_remove_object())
  {
    nw_connection_cancel(a2);
  }
}

BOOL ___mdns_dns_server_validate_discovered_service_connection_block_invoke(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_server_validate_discovered_service_connection_block_invoke_2(uint64_t a1, nw_endpoint_t endpoint)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (nw_endpoint_get_type(endpoint) == nw_endpoint_type_address)
  {
    address = nw_endpoint_get_address(endpoint);
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      if (*(uint64_t *)(a1 + 40) < 1)
      {
        int v5 = 0;
      }
      else
      {
        uint64_t v6 = address;
        CFIndex v7 = 0;
        do
        {
          uint64_t ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 48) + 80), v7);
          int sa_family = v6->sa_family;
          if (sa_family == *((unsigned __int8 *)ValueAtIndex + 25)
            && sa_family == 2
            && v6->sa_len == *((unsigned __int8 *)ValueAtIndex + 24))
          {
            unsigned int v11 = *(_DWORD *)&v6->sa_data[2];
            if (v11 == ValueAtIndex[7]
              && (vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(bswap32(v11)), (int8x16_t)xmmword_2381819A0), (int32x4_t)xmmword_2381819B0))) & 1) != 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
              if (_mdns_dns_service_log_s_once != -1) {
                dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
              }
              uint64_t v12 = _mdns_dns_service_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138543362;
                nw_endpoint_t v18 = endpoint;
                _os_log_impl(&dword_23814D000, v12, OS_LOG_TYPE_INFO, "Discovered service verified, private address %{public}@ used", buf, 0xCu);
              }
            }
          }
          if (!*(unsigned char *)(a1 + 64) && !*(unsigned char *)(a1 + 65))
          {
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
            {
              int v13 = *(void **)(a1 + 56);
              if (v13)
              {
                if (!*v13)
                {
                  hostname = nw_endpoint_get_hostname(endpoint);
                  if (hostname)
                  {
                    long long v15 = strdup(hostname);
                    if (!v15) {
                      __break(1u);
                    }
                    **(void **)(a1 + 56) = v15;
                  }
                }
              }
            }
          }
          int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
            break;
          }
          ++v7;
        }
        while (v7 < *(void *)(a1 + 40));
      }
    }
  }
  else
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return v5 == 0;
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2(uint64_t a1, int a2, sec_trust_t trust, void (**a4)(void, void))
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = sec_trust_copy_ref(trust);
  CFIndex v7 = _Block_copy(a4);
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  void v11[2] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_3;
  void v11[3] = &unk_264D06618;
  long long v12 = *(_OWORD *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  void v11[4] = v7;
  OSStatus v8 = SecTrustEvaluateAsyncWithError(v6, (dispatch_queue_t)_mdns_dns_service_queue_s_queue, v11);
  if (v6) {
    CFRelease(v6);
  }
  if (v8)
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    CFArrayRef v9 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      _os_log_error_impl(&dword_23814D000, v9, OS_LOG_TYPE_ERROR, "Failed to start aynchronous trust evaluation -- provider name: %s, error: %{mdns:err}ld", buf, 0x16u);
    }
    a4[2](a4, 0);
    if (v7) {
      _Block_release(v7);
    }
  }
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_3(void *a1, SecTrustRef trust, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (a3)
    {
      CFArrayRef v5 = SecTrustCopyCertificateChain(trust);
      if (v5)
      {
        CFArrayRef v6 = v5;
        if (CFArrayGetCount(v5) >= 1)
        {
          CFArrayGetValueAtIndex(v6, 0);
          CFIndex v7 = *(const void **)(*(void *)(a1[6] + 8) + 24);
          if (v7)
          {
            CFRelease(v7);
            *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
          }
          OSStatus v8 = *(const void **)(*(void *)(a1[7] + 8) + 24);
          if (v8)
          {
            CFRelease(v8);
            *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
          }
          *(void *)(*(void *)(a1[6] + 8) + 24) = SecCertificateCopyIPAddresses();
          *(void *)(*(void *)(a1[7] + 8) + 24) = SecCertificateCopyDNSNames();
        }
        CFRelease(v6);
      }
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1) {
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
      }
      uint64_t v10 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        uint64_t v13 = a4;
        _os_log_error_impl(&dword_23814D000, v10, OS_LOG_TYPE_ERROR, "Aynchronous trust evaluation failed: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
  unsigned int v11 = (const void *)a1[4];
  if (v11) {
    _Block_release(v11);
  }
}

BOOL ___mdns_dns_service_array_contains_service_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

uint64_t ___mdns_dns_service_manager_get_service_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4 || ((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2) & 1) == 0)
  {
    if (_mdns_dns_service_scope_id_match(a2, *(void *)(a1 + 64)))
    {
      unsigned int v9 = 0;
      int v5 = _mdns_dns_service_handles_domain_name(a2, *(unsigned char **)(a1 + 72), &v9);
      if ((v5 & 0x80000000) == 0)
      {
        int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        if (v5 > v6)
        {
          unsigned int v7 = v9;
LABEL_7:
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
          return 1;
        }
        if (v5 == v6)
        {
          unsigned int v7 = v9;
          if (v9 < *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
            goto LABEL_7;
          }
        }
      }
    }
  }
  return 1;
}

uint64_t _mdns_dns_service_get_preferred_encrypted_alt(uint64_t a1, char a2)
{
  uint64_t v10 = 0;
  unsigned int v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2000000000;
  char v9 = 0;
  CFArrayRef v3 = *(const __CFArray **)(a1 + 144);
  if (v3 && *(unsigned __int8 *)(a1 + 281) - 2 >= 4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = ___mdns_dns_service_get_preferred_encrypted_alt_block_invoke;
    v6[3] = &unk_264D06210;
    char v7 = a2;
    void v6[4] = v8;
    void v6[5] = &v10;
    mdns_cfarray_enumerate(v3, (uint64_t)v6);
    uint64_t v4 = v11[3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v4;
}

BOOL ___mdns_dns_service_get_preferred_encrypted_alt_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(_WORD *)(a2 + 276) & 0x801) != 0) {
    return 1;
  }
  int v4 = *(void *)(a2 + 96) && nw_resolver_config_get_class() == 4;
  if (*(unsigned __int8 *)(a1 + 48) != v4) {
    return 1;
  }
  int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if ((v5 - 3) >= 2)
  {
    int v6 = *(unsigned __int8 *)(a2 + 281);
    if ((v6 - 3) < 2 || v6 == 2 && (v7 = v5 == 2, int v5 = 2, !v7))
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
      int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  return (v5 - 5) < 0xFFFFFFFE;
}

uint64_t _mdns_dns_service_handles_domain_name(uint64_t a1, unsigned char *a2, _DWORD *a3)
{
  int v5 = (uint64_t *)(a1 + 88);
  while (1)
  {
    int v5 = (uint64_t *)*v5;
    if (!v5) {
      return 0xFFFFFFFFLL;
    }
    unsigned int v6 = *a2;
    if (*a2)
    {
      int v7 = 0;
      OSStatus v8 = a2;
      while (v6 <= 0x3F)
      {
        v8 += v6 + 1;
        if (v8 - a2 > 255) {
          break;
        }
        ++v7;
        unsigned int v6 = *v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      int v7 = -1;
    }
    else
    {
      int v7 = 0;
    }
LABEL_10:
    uint64_t v9 = v5[1];
    uint64_t v10 = *(unsigned int *)(v9 + 48);
    BOOL v11 = __OFSUB__(v7, v10);
    int v12 = v7 - v10;
    if (v12 < 0 == v11)
    {
      if (!v10) {
        break;
      }
      uint64_t v13 = a2;
      if (v12 >= 1)
      {
        uint64_t v13 = a2;
        do
        {
          if (!*v13) {
            break;
          }
          v13 += *v13 + 1;
          --v12;
        }
        while (v12);
      }
      if (DomainNameEqual(v13, *(unsigned __int8 **)(v9 + 24))) {
        break;
      }
    }
  }
  if (a3) {
    *a3 = *((_DWORD *)v5 + 4);
  }
  return v10;
}

uint64_t mdns_dns_service_manager_get_unscoped_native_service(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  OSStatus v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_get_unscoped_native_service_block_invoke;
  block[3] = &unk_264D05B58;
  block[4] = &v7;
  void block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_unscoped_native_service_block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    CFArrayRef v3 = *(const __CFArray **)(v2 + 24);
    uint64_t v4 = a1[6];
    v7[0] = 0;
    v7[1] = 0;
    int v8 = 0;
    uint64_t service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)v7, 0);
    uint64_t result = _mdns_dns_service_manager_prepare_service(a1[5], service);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_interface_scoped_native_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_get_interface_scoped_native_service_block_invoke;
  void v8[3] = &unk_264D05B80;
  void v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  int v9 = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  uint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_interface_scoped_native_service_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    CFArrayRef v3 = *(const __CFArray **)(v2 + 24);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(_DWORD *)(a1 + 56);
    uint64_t v9 = 0;
    uint64_t v10 = 0x100000000;
    int v8 = v5;
    uint64_t service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)&v8, 0);
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), service);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_unscoped_system_service(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = __mdns_dns_service_manager_get_unscoped_system_service_with_options_block_invoke;
  v6[3] = &unk_264D05BA8;
  void v6[4] = &v8;
  void v6[5] = a1;
  void v6[6] = a2;
  int v7 = 0;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v6);
  uint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_unscoped_system_service_with_options_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    CFArrayRef v3 = *(const __CFArray **)(v2 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(_DWORD *)(a1 + 56);
    v8[0] = 0;
    v8[1] = 0;
    int v9 = 0;
    uint64_t service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)v8, v5);
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), service);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_interface_scoped_system_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  void v8[2] = __mdns_dns_service_manager_get_interface_scoped_system_service_with_options_block_invoke;
  void v8[3] = &unk_264D05BD0;
  void v8[4] = &v11;
  v8[5] = a1;
  v8[6] = a2;
  int v9 = a3;
  int v10 = 0;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  uint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_interface_scoped_system_service_with_options_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    CFArrayRef v3 = *(const __CFArray **)(v2 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = *(_DWORD *)(a1 + 56);
    int v5 = *(_DWORD *)(a1 + 60);
    uint64_t v10 = 0;
    uint64_t v11 = 0x100000000;
    int v9 = v6;
    uint64_t service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)&v9, v5);
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), service);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_service_scoped_system_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  void v8[2] = __mdns_dns_service_manager_get_service_scoped_system_service_block_invoke;
  void v8[3] = &unk_264D05BF8;
  void v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  int v9 = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  uint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_service_scoped_system_service_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    CFArrayRef v3 = *(const __CFArray **)(v2 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(_DWORD *)(a1 + 56);
    uint64_t v9 = 0;
    uint64_t v10 = 0x200000000;
    int v8 = v5;
    uint64_t service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)&v8, 0);
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), service);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_custom_service(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_get_custom_service_block_invoke;
  block[3] = &unk_264D05C20;
  block[4] = &v7;
  void block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_custom_service_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t service_by_id = _mdns_dns_service_manager_get_service_by_id(*(const __CFArray **)(v2 + 56), *(void *)(a1 + 48));
    if (service_by_id) {
      uint64_t service_by_id = (uint64_t)_mdns_dns_service_manager_get_usable_service_instance(*(CFArrayRef **)(a1 + 40), service_by_id, 0);
    }
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), service_by_id);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

__CFArray *_mdns_dns_service_manager_get_usable_service_instance(CFArrayRef *a1, uint64_t a2, int a3)
{
  int v5 = *(_DWORD *)(a2 + 256);
  if (a3) {
    BOOL v6 = v5 == a3;
  }
  else {
    BOOL v6 = 1;
  }
  char v7 = !v6;
  if (v5 && (v7 & 1) != 0) {
    return 0;
  }
  if ((v7 & 1) == 0 && (*(_WORD *)(a2 + 276) & 1) == 0) {
    return (__CFArray *)a2;
  }
  if (v5) {
    int v9 = *(_DWORD *)(a2 + 256);
  }
  else {
    int v9 = a3;
  }
  uint64_t v19 = 0;
  CFStringRef v20 = &v19;
  uint64_t v21 = 0x2000000000;
  uint64_t v22 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 0x40000000;
  v17[2] = ___mdns_dns_service_get_variant_for_interface_block_invoke;
  v17[3] = &unk_264D062E8;
  int v18 = v9;
  v17[4] = &v19;
  CFArrayRef v10 = *(const __CFArray **)(a2 + 128);
  if (v10)
  {
    mdns_cfarray_enumerate(v10, (uint64_t)v17);
    CFArrayRef Mutable = (__CFArray *)v20[3];
    _Block_object_dispose(&v19, 8);
    if (Mutable) {
      return Mutable;
    }
  }
  else
  {
    _Block_object_dispose(&v19, 8);
  }
  LODWORD(v17[0]) = 0;
  uint64_t v11 = _mdns_dns_service_create(*(unsigned char *)(a2 + 281), *(unsigned char *)(a2 + 282), *(unsigned char *)(a2 + 280), (int *)v17);
  uint64_t v12 = v11;
  if (!LODWORD(v17[0]))
  {
    *(void *)(v11 + 136) = a2;
    os_retain((void *)a2);
    *(_DWORD *)(v12 + 256) = v9;
    *(_WORD *)(v12 + 276) = *(_WORD *)(a2 + 276) & 6;
    uint64_t v13 = *(const void **)(a2 + 80);
    *(void *)(v12 + 80) = v13;
    if (v13) {
      CFRetain(v13);
    }
    uint64_t v14 = *(void **)(a2 + 96);
    *(void *)(v12 + 96) = v14;
    if (v14) {
      nw_retain(v14);
    }
    unsigned int v15 = *(_DWORD *)(v12 + 256);
    if (v15) {
      *(void *)(v12 + 104) = mdns_system_interface_index_to_name(v15);
    }
    goto LABEL_26;
  }
  if (!v11) {
    return 0;
  }
LABEL_26:
  CFArrayRef Mutable = *(__CFArray **)(a2 + 128);
  if (Mutable
    || (CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks),
        (*(void *)(a2 + 128) = Mutable) != 0))
  {
    _mdns_dns_service_increment_use_count(v12);
    CFArrayAppendValue(Mutable, (const void *)v12);
    _mdns_dns_service_manager_update_interface_properties_for_service(a1, v12);
    CFArrayRef Mutable = (__CFArray *)v12;
  }
  os_release((void *)v12);
  return Mutable;
}

BOOL ___mdns_dns_service_get_variant_for_interface_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 256) == *(_DWORD *)(a1 + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t mdns_dns_service_manager_get_uuid_scoped_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  void v8[2] = __mdns_dns_service_manager_get_uuid_scoped_service_block_invoke;
  void v8[3] = &unk_264D05C48;
  void v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  int v9 = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  uint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_uuid_scoped_service_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    CFArrayRef v3 = *(const unsigned __int8 **)(a1 + 48);
    uint64_t service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v2 + 48), v3);
    if (service_by_uuid
      || (uint64_t service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v2 + 40), v3)) != 0)
    {
      uint64_t service_by_uuid = (uint64_t)_mdns_dns_service_manager_get_usable_service_instance(*(CFArrayRef **)(a1 + 40), service_by_uuid, *(_DWORD *)(a1 + 56));
    }
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), service_by_uuid);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_discovered_service(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_get_discovered_service_block_invoke;
  block[3] = &unk_264D05C70;
  block[4] = &v7;
  void block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_discovered_service_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 131))
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000;
    uint64_t v15 = 0;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2000000000;
    int v11 = -1;
    CFArrayRef v4 = *(const __CFArray **)(v2 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___mdns_dns_service_manager_get_discovered_service_block_invoke;
    v9[3] = &unk_264D060D8;
    void v9[5] = &v12;
    v9[6] = v3;
    v9[4] = v10;
    mdns_cfarray_enumerate(v4, (uint64_t)v9);
    if (v13[3])
    {
      uint64_t v5 = mach_continuous_approximate_time();
      uint64_t v6 = v13[3];
      *(void *)(v6 + 32) = v5;
    }
    else
    {
      uint64_t v6 = 0;
    }
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(&v12, 8);
    if (v6) {
      usable_service_instance = _mdns_dns_service_manager_get_usable_service_instance(*(CFArrayRef **)(a1 + 40), v6, 0);
    }
    else {
      usable_service_instance = 0;
    }
    uint64_t result = _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 40), (uint64_t)usable_service_instance);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___mdns_dns_service_manager_get_discovered_service_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = _mdns_dns_service_handles_domain_name((uint64_t)a2, *(unsigned char **)(a1 + 48), 0);
  if (a2[12] && v4 > *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
  uint64_t v5 = a2[5];
  if (v5 && v5 < mach_continuous_time())
  {
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v6 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a2[6];
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_INFO, "DoH resolver for %@ has passed expiration", (uint8_t *)&v10, 0xCu);
    }
    a2[5] = 0;
    while (1)
    {
      int v8 = (void *)a2[11];
      if (!v8) {
        break;
      }
      a2[11] = *v8;
      _domain_item_free(v8);
    }
    _mdns_dns_service_manager_fetch_doh_pvd(a2);
  }
  return 1;
}

void mdns_dns_service_manager_apply_pending_updates(uint64_t a1)
{
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_apply_pending_updates_block_invoke;
  block[3] = &__block_descriptor_tmp_41;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
}

void __mdns_dns_service_manager_apply_pending_updates_block_invoke(uint64_t a1)
{
  v28[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 131))
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 0x40000000;
    uint64_t v20 = (uint64_t)___mdns_dns_service_manager_remove_unused_services_block_invoke;
    uint64_t v21 = &__block_descriptor_tmp_104;
    uint64_t v22 = v2;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 0x40000000;
    int v25 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    int v26 = &unk_264D06750;
    uint64_t v27 = &v18;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v2, (uint64_t)&v23);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 0x40000000;
    int v25 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    int v26 = &unk_264D06750;
    uint64_t v27 = (uint64_t *)&__block_literal_global_141_195;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v3, (uint64_t)&v23);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 0x40000000;
    int v25 = ___mdns_dns_service_manager_handle_pending_alts_block_invoke;
    int v26 = &__block_descriptor_tmp_146;
    uint64_t v27 = (uint64_t *)v4;
    _mdns_dns_service_manager_enumerate_all_services(v4, (uint64_t)&v23);
    _mdns_dns_service_manager_enumerate_all_services(*(void *)(a1 + 32), (uint64_t)&__block_literal_global_107);
    _mdns_dns_service_manager_enumerate_all_services(*(void *)(a1 + 32), (uint64_t)&__block_literal_global_128);
    _mdns_dns_service_manager_remove_unneeded_interface_monitors(*(void *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 0x40000000;
    int v25 = ___mdns_dns_service_manager_update_interface_properties_block_invoke;
    int v26 = &__block_descriptor_tmp_124;
    uint64_t v27 = (uint64_t *)v5;
    _mdns_dns_service_manager_enumerate_all_services(v5, (uint64_t)&v23);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v18 = 0;
    uint64_t v19 = (uint64_t)&v18;
    uint64_t v20 = 0x2000000000;
    LOBYTE(v21) = 0;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 0x40000000;
    int v25 = ___mdns_dns_service_manager_update_policies_block_invoke;
    int v26 = &unk_264D06260;
    uint64_t v27 = &v18;
    _mdns_dns_service_manager_enumerate_all_services(v6, (uint64_t)&v23);
    uint64_t v7 = *(void **)(v6 + 112);
    if (*(unsigned char *)(v19 + 24))
    {
      if (!v7)
      {
        int v8 = (void *)MEMORY[0x23EC893C0]();
        if (objc_opt_class())
        {
          uint64_t v9 = (void *)[objc_alloc((Class)&off_26EB26250) initFromPrivilegedProcess];
          [v9 setPriority:500];
          id v10 = objc_alloc((Class)&off_26EB26350);
          uint64_t v11 = (void *)[v10 initWithUUIDBytes:MEMORY[0x263EF89D8]];
          uint64_t v12 = unk_26EB2659C(&off_26EB26A48, "removeNetworkAgentUUID:", v11);
          id v13 = objc_alloc((Class)&off_26EB26C70);
          uint64_t v14 = unk_26EB274E4(&off_26EB27EE0, "allInterfaces");
          v28[0] = v14;
          uint64_t v15 = unk_26EB274A8(&off_26EB27EE0, "flowRemoteAddressEmpty");
          v28[1] = v15;
          __int16 v16 = +[NSArray arrayWithObjects:v28 count:2];
          uint64_t v17 = (void *)[v13 initWithOrder:0 result:v12 conditions:v16];
          [v9 addPolicy:v17];

          [v9 apply];
        }
        else
        {
          uint64_t v9 = 0;
        }
        goto LABEL_9;
      }
    }
    else if (v7)
    {
      mdns_system_remove_network_policy(v7);
      uint64_t v9 = 0;
LABEL_9:
      *(void *)(v6 + 112) = v9;
    }
    _Block_object_dispose(&v18, 8);
  }
}

uint64_t ___mdns_dns_service_manager_remove_unused_services_block_invoke(uint64_t a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count - 1 >= 0)
  {
    CFIndex v5 = Count;
    do
    {
      uint64_t ValueAtIndex = CFArrayGetValueAtIndex(theArray, --v5);
      if (!ValueAtIndex[66])
      {
        _mdns_dns_service_manager_terminate_service(*(void *)(a1 + 32), (uint64_t)ValueAtIndex);
        CFArrayRemoveValueAtIndex(theArray, v5);
      }
    }
    while (v5 > 0);
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_pending_alts_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 287))
  {
    *(unsigned char *)(a2 + 287) = 0;
    CFArrayRef v4 = *(const __CFArray **)(a2 + 152);
    if (v4)
    {
      if (CFArrayGetCount(v4) >= 1)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 0x40000000;
        v9[2] = ___mdns_dns_service_manager_handle_pending_alts_block_invoke_2;
        v9[3] = &__block_descriptor_tmp_145;
        uint64_t v5 = *(void *)(a1 + 32);
        v9[4] = a2;
        void v9[5] = v5;
        CFArrayRef v6 = *(const __CFArray **)(a2 + 144);
        if (v6)
        {
          mdns_cfarray_enumerate(v6, (uint64_t)v9);
          uint64_t v7 = *(const void **)(a2 + 144);
          if (v7) {
            CFRelease(v7);
          }
        }
        *(void *)(a2 + 144) = *(void *)(a2 + 152);
        *(void *)(a2 + 152) = 0;
      }
    }
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_update_interface_properties_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

BOOL ___mdns_dns_service_manager_update_policies_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t preferred_encrypted_alt = _mdns_dns_service_get_preferred_encrypted_alt(a2, 1);
  if (preferred_encrypted_alt) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return preferred_encrypted_alt == 0;
}

uint64_t ___mdns_dns_service_manager_update_nw_config_data_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t ___mdns_dns_service_manager_update_service_usability_block_invoke(uint64_t a1, uint64_t a2)
{
  __int16 v2 = *(_WORD *)(a2 + 276);
  if (*(unsigned char *)(a2 + 283))
  {
    if ((*(_WORD *)(a2 + 276) & 0x800) == 0)
    {
      __int16 v3 = v2 | 0x800;
LABEL_6:
      *(_WORD *)(a2 + 276) = v3;
    }
  }
  else if ((*(_WORD *)(a2 + 276) & 0x800) != 0)
  {
    __int16 v3 = v2 & 0xF7FF;
    goto LABEL_6;
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_pending_alts_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFArrayRef v4 = *(const __CFArray **)(*(void *)(a1 + 32) + 152);
  *(void *)&long long v8 = MEMORY[0x263EF8330];
  *((void *)&v8 + 1) = 0x40000000;
  uint64_t v9 = ___mdns_dns_service_array_contains_service_block_invoke;
  id v10 = &__block_descriptor_tmp_147;
  uint64_t v11 = a2;
  if (mdns_cfarray_enumerate(v4, (uint64_t)&v8))
  {
    _mdns_dns_service_manager_terminate_service(*(void *)(a1 + 40), a2);
    if (_mdns_dns_service_log_s_once != -1) {
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_66);
    }
    uint64_t v5 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a2 + 24);
      LODWORD(v8) = 134217984;
      *(void *)((char *)&v8 + 4) = v6;
      _os_log_impl(&dword_23814D000, v5, OS_LOG_TYPE_INFO, "Deregistered discovered service -- id: %llu", (uint8_t *)&v8, 0xCu);
    }
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_network_changes_block_invoke(uint64_t a1, const __CFArray *a2)
{
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_network_changes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 286))
  {
    *(unsigned char *)(a2 + 286) = 0;
    _mdns_dns_service_make_defunct(a2);
  }
  CFArrayRef v3 = *(const __CFArray **)(a2 + 128);
  if (v3)
  {
    CFIndex Count = CFArrayGetCount(v3);
    if (Count - 1 >= 0)
    {
      CFIndex v5 = Count;
      do
      {
        uint64_t ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 128), --v5);
        if (ValueAtIndex[286])
        {
          ValueAtIndex[286] = 0;
          _mdns_dns_service_make_defunct((uint64_t)ValueAtIndex);
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a2 + 128), v5);
        }
      }
      while (v5 > 0);
    }
  }
  return 1;
}

uint64_t mdns_dns_service_manager_enumerate(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_enumerate_block_invoke;
  block[3] = &unk_264D05CB8;
  void block[5] = &v7;
  block[6] = a1;
  block[4] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_enumerate_block_invoke(uint64_t *a1)
{
  uint64_t result = a1[6];
  if (*(unsigned char *)(result + 131))
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    uint64_t result = _mdns_dns_service_manager_enumerate_all_services(result, a1[4]);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

uint64_t mdns_dns_service_manager_get_count(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  if (_mdns_dns_service_queue_s_once != -1) {
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __mdns_dns_service_manager_get_count_block_invoke;
  v4[3] = &unk_264D05D30;
  v4[4] = &v5;
  void v4[5] = a1;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __mdns_dns_service_manager_get_count_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (!*(unsigned char *)(result + 131))
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 0x40000000;
    v3[2] = __mdns_dns_service_manager_get_count_block_invoke_2;
    v3[3] = &unk_264D05D08;
    v3[4] = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v4[3] = &unk_264D06750;
    v4[4] = v3;
    return _mdns_dns_service_manager_enumerate_all_service_array_pointers(result, (uint64_t)v4);
  }
  return result;
}

uint64_t __mdns_dns_service_manager_get_count_block_invoke_2(uint64_t a1, const __CFArray *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = __mdns_dns_service_manager_get_count_block_invoke_3;
  v3[3] = &unk_264D05CE0;
  v3[4] = *(void *)(a1 + 32);
  mdns_cfarray_enumerate(a2, (uint64_t)v3);
  return 1;
}

uint64_t __mdns_dns_service_manager_get_count_block_invoke_3(uint64_t a1, uint64_t a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  CFArrayRef v4 = *(const __CFArray **)(a2 + 128);
  if (v4)
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += Count;
    }
  }
  CFArrayRef v6 = *(const __CFArray **)(a2 + 144);
  if (v6)
  {
    CFIndex v7 = CFArrayGetCount(v6);
    if (v7 >= 1) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v7;
    }
  }
  return 1;
}

void mdns_dns_service_manager_handle_sleep(uint64_t a1)
{
  mdns_dns_service_manager_enumerate(a1, (uint64_t)&__block_literal_global_50);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  uint64_t v1 = _mdns_resolver_queue_s_queue;

  dispatch_async(v1, &__block_literal_global_1441);
}

uint64_t __mdns_dns_service_manager_handle_sleep_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 281) - 2 <= 2)
  {
    CFArrayRef v3 = *(void **)(a2 + 64);
    if (v3)
    {
      mdns_resolver_invalidate(v3);
      os_release(*(void **)(a2 + 64));
      *(void *)(a2 + 64) = 0;
      *(unsigned char *)(a2 + 285) = 1;
    }
  }
  return 1;
}

uint64_t mdns_dns_service_manager_handle_wake(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = __mdns_dns_service_manager_handle_wake_block_invoke;
  v2[3] = &__block_descriptor_tmp_51;
  v2[4] = a1;
  return mdns_dns_service_manager_enumerate(a1, (uint64_t)v2);
}

uint64_t __mdns_dns_service_manager_handle_wake_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 285))
  {
    _mdns_dns_service_manager_prepare_service(*(void *)(a1 + 32), a2);
    *(unsigned char *)(a2 + 285) = 0;
  }
  return 1;
}

uint64_t mdns_dns_service_set_context(uint64_t result, uint64_t a2)
{
  *(void *)(result + 112) = a2;
  return result;
}

uint64_t mdns_dns_service_get_context(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t mdns_dns_service_set_context_finalizer(uint64_t result, uint64_t a2)
{
  *(void *)(result + 120) = a2;
  return result;
}

void *mdns_dns_service_create_querier(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2) {
    return mdns_resolver_create_querier(v2, a2);
  }
  if (a2) {
    *a2 = -6720;
  }
  return 0;
}

uint64_t mdns_dns_service_get_scope(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 280);
}

uint64_t mdns_dns_service_get_interface_index(uint64_t a1)
{
  return *(unsigned int *)(a1 + 256);
}

uint64_t mdns_dns_service_get_id(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t mdns_dns_service_is_defunct(uint64_t a1)
{
  return *(_WORD *)(a1 + 276) & 1;
}

BOOL mdns_dns_service_is_encrypted(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 281) - 2 < 4;
}

uint64_t mdns_dns_service_a_queries_advised(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 1) & 1;
}

uint64_t mdns_dns_service_aaaa_queries_advised(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 2) & 1;
}

uint64_t mdns_dns_service_has_connection_problems(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 11) & 1;
}

uint64_t mdns_dns_service_interface_has_ipv4_connectivity(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 4) & 1;
}

uint64_t mdns_dns_service_interface_has_ipv6_connectivity(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 5) & 1;
}

uint64_t mdns_dns_service_interface_is_cellular(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 3) & 1;
}

uint64_t mdns_dns_service_interface_is_expensive(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 6) & 1;
}

uint64_t mdns_dns_service_interface_is_constrained(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 7) & 1;
}

uint64_t mdns_dns_service_interface_is_clat46(uint64_t a1)
{
  return HIBYTE(*(unsigned __int16 *)(a1 + 276)) & 1;
}

uint64_t mdns_dns_service_interface_is_vpn(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 9) & 1;
}

uint64_t mdns_dns_service_get_resolver_type(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 281) - 1) > 3u) {
    return 0;
  }
  else {
    return dword_2381819C0[(*(unsigned char *)(a1 + 281) - 1)];
  }
}

uint64_t mdns_dns_service_allows_failover(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 96);
  if (result) {
    return nw_resolver_config_get_allow_failover();
  }
  return result;
}

BOOL mdns_dns_service_is_native(uint64_t a1)
{
  return *(unsigned char *)(a1 + 282) == 1;
}

void _mdns_dns_service_definition_finalize(void *a1)
{
  uint64_t v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  CFArrayRef v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  CFArrayRef v4 = (void *)a1[5];
  if (v4)
  {
    free(v4);
    a1[5] = 0;
  }
}

void *_mdns_dns_service_definition_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v30 = 0;
  unsigned int v31 = &v30;
  uint64_t v32 = 0x2000000000;
  int v33 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2000000000;
  uint64_t v29 = 0;
  CFArrayRef v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    CFIndex v7 = v6;
    if (!a2
      || (int v8 = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v31 + 6) = v8) == 0))
    {
      uint64_t v9 = *(const char **)(a1 + 40);
      if (!v9) {
        uint64_t v9 = "";
      }
      int appended = mdns_string_builder_append_formatted(v7, "interface: %s/%u, interface scope: ", v9, *(_DWORD *)(a1 + 48));
      *((_DWORD *)v31 + 6) = appended;
      if (!appended)
      {
        int v11 = *(unsigned __int8 *)(a1 + 52);
        if (v11 == 2)
        {
          int v12 = mdns_string_builder_append_formatted(v7, "unscoped+scoped", v21);
        }
        else if (v11 == 1)
        {
          int v12 = mdns_string_builder_append_formatted(v7, "scoped");
        }
        else
        {
          int v12 = *(unsigned char *)(a1 + 52)
              ? mdns_string_builder_append_formatted(v7, "«INVALID %d»")
              : mdns_string_builder_append_formatted(v7, "unscoped", v21);
        }
        *((_DWORD *)v31 + 6) = v12;
        if (!v12)
        {
          int v14 = mdns_string_builder_append_formatted(v7, ", addresses: {");
          *((_DWORD *)v31 + 6) = v14;
          if (!v14)
          {
            v27[3] = 0;
            CFArrayRef v16 = *(const __CFArray **)(a1 + 24);
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 0x40000000;
            v24[2] = ___mdns_dns_service_definition_copy_description_block_invoke;
            v24[3] = &unk_264D06830;
            v24[4] = &v30;
            v24[5] = &v26;
            v24[6] = v7;
            char v25 = a3;
            mdns_cfarray_enumerate(v16, (uint64_t)v24);
            id v13 = 0;
            if (*((_DWORD *)v31 + 6)) {
              goto LABEL_18;
            }
            int v17 = mdns_string_builder_append_formatted(v7, "}");
            *((_DWORD *)v31 + 6) = v17;
            if (!v17)
            {
              int v18 = mdns_string_builder_append_formatted(v7, ", domains: {");
              *((_DWORD *)v31 + 6) = v18;
              if (!v18)
              {
                v27[3] = 0;
                CFSetRef v19 = *(const __CFSet **)(a1 + 32);
                v22[0] = MEMORY[0x263EF8330];
                v22[1] = 0x40000000;
                v22[2] = ___mdns_dns_service_definition_copy_description_block_invoke_2;
                v22[3] = &unk_264D06858;
                v22[4] = &v30;
                v22[5] = &v26;
                v22[6] = v7;
                char v23 = a3;
                mdns_cfset_enumerate(v19, (uint64_t)v22);
                if (!*((_DWORD *)v31 + 6))
                {
                  int v20 = mdns_string_builder_append_formatted(v7, "}");
                  *((_DWORD *)v31 + 6) = v20;
                  if (!v20)
                  {
                    id v13 = mdns_string_builder_copy_string((uint64_t)v7);
                    goto LABEL_18;
                  }
                }
              }
            }
          }
        }
      }
    }
    id v13 = 0;
LABEL_18:
    os_release(v7);
    goto LABEL_19;
  }
  id v13 = 0;
LABEL_19:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v13;
}

BOOL ___mdns_dns_service_definition_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_definition_copy_description_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void *mdns_dns_service_definition_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    uint64_t v2 = &_mdns_dns_service_definition_kind;
    *(void *)(v0 + 16) = &_mdns_dns_service_definition_kind;
    do
    {
      CFArrayRef v3 = (void (*)(void *))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &mdns_cfarray_callbacks);
    v1[3] = Mutable;
    if (!Mutable || (CFMutableSetRef v6 = CFSetCreateMutable(v4, 0, &mdns_domain_name_cf_set_callbacks), (v1[4] = v6) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void mdns_dns_service_definition_set_interface_index(uint64_t a1, unsigned int a2, char a3)
{
  *(unsigned char *)(a1 + 52) = a3;
  if (*(_DWORD *)(a1 + 48) != a2)
  {
    *(_DWORD *)(a1 + 48) = a2;
    CFAllocatorRef v4 = *(void **)(a1 + 40);
    if (v4)
    {
      free(v4);
      *(void *)(a1 + 40) = 0;
      a2 = *(_DWORD *)(a1 + 48);
    }
  }
  if (a2)
  {
    if (!*(void *)(a1 + 40)) {
      *(void *)(a1 + 40) = mdns_system_interface_index_to_name(a2);
    }
  }
  else
  {
    *(unsigned char *)(a1 + 52) = 0;
  }
}

uint64_t mdns_dns_service_definition_append_server_address(uint64_t a1, const void *a2)
{
  return 0;
}

uint64_t mdns_dns_service_definition_add_domain(uint64_t a1, const void *a2)
{
  return 0;
}

id _mdns_heuristics_log()
{
  if (_mdns_heuristics_log_s_once != -1) {
    dispatch_once(&_mdns_heuristics_log_s_once, &__block_literal_global_43);
  }
  uint64_t v0 = (void *)_mdns_heuristics_log_s_log;

  return v0;
}

uint64_t ___mdns_heuristics_log_block_invoke()
{
  _mdns_heuristics_log_s_os_log_t log = (uint64_t)os_log_create("com.apple.mdns", "heuristics");

  return MEMORY[0x270F9A758]();
}

id getHeuristicsQueue()
{
  if (getHeuristicsQueue_onceToken != -1) {
    dispatch_once(&getHeuristicsQueue_onceToken, &__block_literal_global_47);
  }
  uint64_t v0 = (void *)getHeuristicsQueue_queue;

  return v0;
}

void __dns_heuristics_report_resolution_failure_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = _mdns_heuristics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_23814D000, v2, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_failure %@ %d", (uint8_t *)&v6, 0x12u);
  }

  uint64_t v5 = (void *)MEMORY[0x23EC893C0]();
  +[DNSHeuristics reportResolutionFailure:*(void *)(a1 + 32) isTimeout:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __getHeuristicsQueue_block_invoke()
{
  getHeuristicsQueue_queue = (uint64_t)dispatch_queue_create("DNSHeuristicsQueue", 0);

  return MEMORY[0x270F9A758]();
}

void __dns_heuristics_report_resolution_success_block_invoke()
{
  uint64_t v0 = _mdns_heuristics_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_23814D000, v0, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_success", v2, 2u);
  }

  uint64_t v1 = (void *)MEMORY[0x23EC893C0]();
  +[DNSHeuristics updateHeuristicState:1 isTimeout:0];
}

uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, void *a5)
{
  if (__dst) {
    int v6 = __dst + 256;
  }
  else {
    int v6 = 0;
  }
  uint64_t result = 4294960586;
  if ((unint64_t)__src < a1) {
    return result;
  }
  unint64_t v8 = a1 + a2;
  if (a1 + a2 <= (unint64_t)__src) {
    return result;
  }
  uint64_t v10 = __dst;
  unsigned int v11 = *__src;
  if (*__src)
  {
    int v12 = 0;
    do
    {
      if (v11 > 0x3F)
      {
        if ((~v11 & 0xC0) != 0) {
          return 4294960554;
        }
        if ((uint64_t)(v8 - (void)__src) < 2) {
          return 4294960546;
        }
        if (!v12)
        {
          int v12 = __src + 2;
          if (!v10) {
            goto LABEL_23;
          }
        }
        __src = (char *)(a1 + (__src[1] | ((unint64_t)(v11 & 0x3F) << 8)));
        if ((unint64_t)__src >= v8) {
          return 4294960546;
        }
        unsigned int v11 = *__src;
        if (v11 > 0xBF) {
          return 4294960554;
        }
      }
      else
      {
        id v13 = &__src[v11 + 1];
        if ((unint64_t)v13 >= v8) {
          return 4294960546;
        }
        if (v10)
        {
          uint64_t v14 = v11 + 1;
          if (v6 - v10 <= v14) {
            return 4294960545;
          }
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }
        unsigned int v11 = *v13;
        __src = v13;
      }
    }
    while (v11);
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  int v12 = 0;
  if (__dst) {
LABEL_22:
  }
    *uint64_t v10 = 0;
LABEL_23:
  uint64_t result = 0;
  if (a5)
  {
    if (v12) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = __src + 1;
    }
    *a5 = v15;
  }
  return result;
}

uint64_t DNSMessageExtractDomainNameString(unint64_t a1, uint64_t a2, char *a3, unsigned __int8 *a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!result)
  {
    uint64_t result = DomainNameToString(__dst, 0, a4, 0);
    if (a5)
    {
      if (!result) {
        *a5 = v8;
      }
    }
  }
  return result;
}

uint64_t DomainNameToString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, void *a4)
{
  if (a2 && (uint64_t)(a2 - (void)a1) < 1) {
    return 4294960546;
  }
  LODWORD(i) = *a1;
  if (*a1)
  {
    uint64_t v5 = a1;
    do
    {
      if (i > 0x3F) {
        return 4294960554;
      }
      int v6 = &v5[i + 1];
      if (v6 - a1 > 255) {
        return 4294960554;
      }
      if (a2 && (unint64_t)v6 >= a2) {
        return 4294960546;
      }
      uint64_t v7 = v5 + 1;
      if (v7 < v6)
      {
        for (uint64_t i = i; i; --i)
        {
          unsigned __int8 v8 = *v7;
          if (((char)*v7 - 32) > 0x5E)
          {
            if ((*v7 & 0x80) == 0)
            {
              *a3 = 92;
              if (v8 <= 0x63u) {
                char v10 = 48;
              }
              else {
                char v10 = 49;
              }
              a3[1] = v10;
              if (v8 >= 0x64u) {
                char v11 = v8 / 0xAu - 10;
              }
              else {
                char v11 = v8 / 0xAu;
              }
              a3[2] = v11 + 48;
              a3[3] = (v8 % 0xAu) | 0x30;
              a3 += 4;
              goto LABEL_26;
            }
          }
          else if (*v7 - 32 <= 0x3C && ((1 << (v8 - 32)) & 0x1000000000004001) != 0)
          {
            *a3++ = 92;
          }
          *a3++ = v8;
LABEL_26:
          ++v7;
        }
      }
      *a3++ = 46;
      LODWORD(i) = *v6;
      uint64_t v5 = v6;
    }
    while (*v6);
    if (v6 != a1) {
      goto LABEL_30;
    }
  }
  *a3++ = 46;
  int v6 = a1;
LABEL_30:
  *a3 = 0;
  uint64_t result = 0;
  if (a4) {
    *a4 = v6 + 1;
  }
  return result;
}

uint64_t DNSMessageExtractQuestion(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, void *a7)
{
  uint64_t v14 = 0;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v14);
  if (!result)
  {
    id v13 = v14;
    if (a1 + a2 - (unint64_t)v14 < 4)
    {
      return 4294960546;
    }
    else
    {
      if (a5) {
        *a5 = bswap32(*v14) >> 16;
      }
      if (a6) {
        *a6 = bswap32(v13[1]) >> 16;
      }
      uint64_t result = 0;
      if (a7) {
        *a7 = v13 + 2;
      }
    }
  }
  return result;
}

uint64_t DNSMessageExtractRecord(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, void *a10)
{
  return _DNSMessageExtractRecordEx(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0, 0, a10);
}

uint64_t _DNSMessageExtractRecordEx(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, char *a10, unint64_t a11, size_t *a12, unint64_t *a13, void *a14)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  v99 = 0;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v99);
  if (!result)
  {
    int v20 = v99;
    if (a1 + a2 - (unint64_t)v99 < 0xA) {
      return 4294960546;
    }
    uint64_t v21 = (unsigned __int16 *)(v99 + 10);
    unint64_t v22 = __rev16(*((unsigned __int16 *)v99 + 4));
    if (a1 + a2 - (unint64_t)(v99 + 10) < v22)
    {
      return 4294960546;
    }
    else
    {
      char v97 = a7;
      char v23 = a13;
      unsigned int v24 = __rev16(*(unsigned __int16 *)v99);
      if (a11 || a13)
      {
        uint64_t v100 = 0;
        __int16 v96 = v24;
        uint64_t v29 = (char *)v21 + v22;
        switch(v24)
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 7u:
          case 8u:
          case 9u:
          case 0xCu:
          case 0x27u:
            uint64_t result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!result)
            {
              if (v100 != v29) {
                goto LABEL_105;
              }
              int v30 = __src[0];
              unsigned int v31 = __src;
              if (__src[0])
              {
                do
                {
                  uint64_t v32 = &v31[v30];
                  int v33 = v32[1];
                  unsigned int v31 = v32 + 1;
                  int v30 = v33;
                }
                while (v33);
              }
              unint64_t v26 = v31 - __src + 1;
              if (v26 < a11) {
                size_t v25 = v31 - __src + 1;
              }
              else {
                size_t v25 = a11;
              }
              memcpy(a10, __src, v25);
              char v23 = a13;
              goto LABEL_102;
            }
            break;
          case 6u:
            uint64_t result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!result)
            {
              uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v100, v101, &v100);
              if (!result)
              {
                if (v29 - (unsigned char *)v100 != 20) {
                  goto LABEL_105;
                }
                int v59 = __src[0];
                uint64_t v60 = __src;
                if (__src[0])
                {
                  do
                  {
                    uint64_t v61 = &v60[v59];
                    int v62 = v61[1];
                    uint64_t v60 = v61 + 1;
                    int v59 = v62;
                  }
                  while (v62);
                }
                int64_t v63 = v60 - __src;
                int v64 = v101[0];
                char v95 = a8;
                uint64_t v90 = &a10[a11];
                v93 = v100;
                uint64_t v65 = v101;
                if (v101[0])
                {
                  do
                  {
                    uint64_t v66 = &v65[v64];
                    int v67 = v66[1];
                    uint64_t v65 = v66 + 1;
                    int v64 = v67;
                  }
                  while (v67);
                }
                int64_t v89 = v65 - v101;
                unint64_t v68 = v65 - v101 + 1;
                unint64_t v26 = v63 + v68 + 21;
                if (v63 + 1 >= a11) {
                  size_t v69 = a11;
                }
                else {
                  size_t v69 = v63 + 1;
                }
                uint64_t v51 = a10;
                memcpy(a10, __src, v69);
                dispatch_time_t v70 = &a10[v69];
                if (v90 - v70 >= v68) {
                  size_t v71 = v89 + 1;
                }
                else {
                  size_t v71 = v90 - v70;
                }
                memcpy(v70, v101, v71);
                uint64_t v72 = &v70[v71];
                if ((unint64_t)(v90 - v72) >= 0x14) {
                  size_t v73 = 20;
                }
                else {
                  size_t v73 = v90 - v72;
                }
                uint64_t v74 = v72;
                uint64_t v75 = v93;
                goto LABEL_91;
              }
            }
            break;
          case 0xEu:
          case 0x11u:
          case 0x1Au:
            uint64_t result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!result)
            {
              uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v100, v101, &v100);
              if (!result)
              {
                if (v100 != v29) {
                  goto LABEL_105;
                }
                int v39 = __src[0];
                uint64_t v40 = __src;
                if (__src[0])
                {
                  do
                  {
                    int v41 = &v40[v39];
                    int v42 = v41[1];
                    uint64_t v40 = v41 + 1;
                    int v39 = v42;
                  }
                  while (v42);
                }
                __int16 v92 = &a10[a11];
                unint64_t v43 = v40 - __src + 1;
                int v44 = v101[0];
                char v95 = a8;
                uint64_t v45 = v101;
                if (v101[0])
                {
                  do
                  {
                    CFArrayRef v46 = &v45[v44];
                    int v47 = v46[1];
                    uint64_t v45 = v46 + 1;
                    int v44 = v47;
                  }
                  while (v47);
                }
                int64_t v48 = v45 - v101;
                unint64_t v49 = v45 - v101 + 1;
                unint64_t v26 = v49 + v43;
                if (v43 >= a11) {
                  size_t v50 = a11;
                }
                else {
                  size_t v50 = v40 - __src + 1;
                }
                uint64_t v51 = a10;
                memcpy(a10, __src, v50);
                int v52 = &a10[v50];
                if (v92 - v52 >= v49) {
                  size_t v53 = v48 + 1;
                }
                else {
                  size_t v53 = v92 - v52;
                }
                char v54 = v101;
                goto LABEL_100;
              }
            }
            break;
          case 0xFu:
          case 0x12u:
          case 0x15u:
          case 0x24u:
            if (v22 < 3) {
              goto LABEL_105;
            }
            uint64_t result = DNSMessageExtractDomainName(a1, a2, v99 + 12, __src, &v100);
            if (!result)
            {
              if (v100 != v29) {
                goto LABEL_105;
              }
              CFIndex v34 = a10;
              int v35 = __src[0];
              char v95 = a8;
              uint64_t v91 = &a10[a11];
              int v36 = __src;
              if (__src[0])
              {
                do
                {
                  int v37 = &v36[v35];
                  int v38 = v37[1];
                  int v36 = v37 + 1;
                  int v35 = v38;
                }
                while (v38);
              }
              int64_t v55 = v36 - __src;
              unint64_t v56 = v36 - __src + 1;
              unint64_t v26 = v36 - __src + 3;
              BOOL v57 = a11 >= 2;
              uint64_t v58 = 2;
              goto LABEL_93;
            }
            break;
          case 0x21u:
            if (v22 < 7) {
              goto LABEL_105;
            }
            uint64_t result = DNSMessageExtractDomainName(a1, a2, v99 + 16, __src, &v100);
            if (!result)
            {
              if (v100 != v29) {
                goto LABEL_105;
              }
              CFIndex v34 = a10;
              int v76 = __src[0];
              char v95 = a8;
              uint64_t v91 = &a10[a11];
              v77 = __src;
              if (__src[0])
              {
                do
                {
                  uint32_t v78 = &v77[v76];
                  int v79 = v78[1];
                  v77 = v78 + 1;
                  int v76 = v79;
                }
                while (v79);
              }
              int64_t v55 = v77 - __src;
              unint64_t v56 = v77 - __src + 1;
              unint64_t v26 = v77 - __src + 7;
              BOOL v57 = a11 >= 6;
              uint64_t v58 = 6;
LABEL_93:
              if (v57) {
                size_t v88 = v58;
              }
              else {
                size_t v88 = a11;
              }
              uint64_t v51 = v34;
              memcpy(v34, v20 + 10, v88);
              int v52 = &v51[v88];
              if (v91 - v52 >= v56) {
                size_t v53 = v55 + 1;
              }
              else {
                size_t v53 = v91 - v52;
              }
              char v54 = __src;
LABEL_100:
              memcpy(v52, v54, v53);
              uint64_t v87 = &v52[v53];
              goto LABEL_101;
            }
            break;
          case 0x2Fu:
            uint64_t result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!result)
            {
              if (v100 <= v29)
              {
                v80 = &a10[a11];
                int v81 = __src[0];
                char v95 = a8;
                v82 = __src;
                if (__src[0])
                {
                  do
                  {
                    uint64_t v83 = &v82[v81];
                    int v84 = v83[1];
                    v82 = v83 + 1;
                    int v81 = v84;
                  }
                  while (v84);
                }
                size_t v85 = v29 - (unsigned char *)v100;
                unint64_t v26 = v82 - __src + 1 + v29 - (unsigned char *)v100;
                if (v82 - __src + 1 < a11) {
                  size_t v86 = v82 - __src + 1;
                }
                else {
                  size_t v86 = a11;
                }
                char __dst = v100;
                uint64_t v51 = a10;
                memcpy(a10, __src, v86);
                uint64_t v72 = &a10[v86];
                if (v80 - v72 >= v85) {
                  size_t v73 = v85;
                }
                else {
                  size_t v73 = v80 - v72;
                }
                uint64_t v74 = v72;
                uint64_t v75 = __dst;
LABEL_91:
                memcpy(v74, v75, v73);
                uint64_t v87 = &v72[v73];
LABEL_101:
                size_t v25 = v87 - v51;
                a8 = v95;
                goto LABEL_102;
              }
LABEL_105:
              uint64_t result = 4294960554;
            }
            break;
          default:
            if (a11 >= v22) {
              size_t v25 = v22;
            }
            else {
              size_t v25 = a11;
            }
            memcpy(a10, v99 + 10, v25);
            unint64_t v26 = v22;
LABEL_102:
            uint64_t v28 = v97;
            uint64_t v27 = a6;
            LOWORD(v24) = v96;
            if (!a5) {
              goto LABEL_8;
            }
            goto LABEL_7;
        }
      }
      else
      {
        size_t v25 = 0;
        unint64_t v26 = 0;
        uint64_t v28 = a7;
        uint64_t v27 = a6;
        if (a5) {
LABEL_7:
        }
          *a5 = v24;
LABEL_8:
        if (v27) {
          *uint64_t v27 = bswap32(*((unsigned __int16 *)v20 + 1)) >> 16;
        }
        if (v28) {
          *uint64_t v28 = bswap32(*((_DWORD *)v20 + 1));
        }
        if (a8) {
          *a8 = v21;
        }
        if (a9) {
          *a9 = v22;
        }
        if (a12) {
          *a12 = v25;
        }
        if (v23) {
          *char v23 = v26;
        }
        uint64_t result = 0;
        if (a14) {
          *a14 = (char *)v21 + v22;
        }
      }
    }
  }
  return result;
}

uint64_t DomainNameLength(unsigned char *a1)
{
  int v1 = *a1;
  uint64_t v2 = a1;
  if (*a1)
  {
    uint64_t v2 = a1;
    do
    {
      uint64_t v3 = &v2[v1];
      int v4 = v3[1];
      uint64_t v2 = v3 + 1;
      int v1 = v4;
    }
    while (v4);
  }
  return v2 - a1 + 1;
}

uint64_t DNSMessageGetAnswerSection(unint64_t a1, unint64_t a2, char **a3)
{
  if (a2 < 0xC) {
    return 4294960553;
  }
  v12[7] = v3;
  v12[8] = v4;
  unsigned int v7 = __rev16(*(unsigned __int16 *)(a1 + 4));
  unsigned __int8 v8 = (char *)(a1 + 12);
  if (v7)
  {
    unint64_t v10 = a1 + a2;
    while (1)
    {
      v12[0] = 0;
      uint64_t result = DNSMessageExtractDomainName(a1, a2, v8, 0, v12);
      if (result) {
        break;
      }
      if (v10 - v12[0] <= 3) {
        return 4294960546;
      }
      unsigned __int8 v8 = (char *)(v12[0] + 4);
      if (!--v7) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t result = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  return result;
}

uint64_t DNSMessageGetOptRecord(unsigned __int16 *a1, unint64_t a2, char **a3, void *a4)
{
  *(void *)int v17 = 0;
  uint64_t result = DNSMessageGetAnswerSection((unint64_t)a1, a2, (char **)v17);
  if (!result)
  {
    unsigned int v9 = __rev16(a1[4]) + (bswap32(a1[3]) >> 16);
    if (v9)
    {
      while (1)
      {
        __int16 v16 = 0;
        LODWORD(result) = _DNSMessageExtractRecordEx((unint64_t)a1, a2, *(char **)v17, 0, &v16, 0, 0, 0, 0, 0, 0, 0, 0, v17);
        if (result || v16 == 41) {
          break;
        }
        if (!--v9) {
          goto LABEL_6;
        }
      }
      if (v16 == 41) {
        unsigned int v14 = -6742;
      }
      else {
        unsigned int v14 = 0;
      }
      if (result) {
        return result;
      }
      else {
        return v14;
      }
    }
    else
    {
LABEL_6:
      unsigned int v10 = __rev16(a1[5]);
      if (v10)
      {
        uint64_t v11 = 0;
        int v12 = 0;
        while (1)
        {
          __int16 v15 = 0;
          id v13 = *(char **)v17;
          uint64_t result = _DNSMessageExtractRecordEx((unint64_t)a1, a2, *(char **)v17, 0, &v15, 0, 0, 0, 0, 0, 0, 0, 0, v17);
          if (result) {
            break;
          }
          if (v15 == 41)
          {
            if (v12 || *v13) {
              return 4294960554;
            }
            uint64_t v11 = *(void *)v17 - (void)v13;
            int v12 = v13;
          }
          else
          {
            id v13 = v12;
          }
          if (!--v10)
          {
            if (!a3) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
        }
      }
      else
      {
        id v13 = 0;
        uint64_t v11 = 0;
        if (a3) {
LABEL_16:
        }
          *a3 = v13;
LABEL_17:
        uint64_t result = 0;
        if (a4) {
          *a4 = v11;
        }
      }
    }
  }
  return result;
}

uint64_t DNSMessageWriteQuery(__int16 a1, __int16 a2, unsigned char *__src, __int16 a4, __int16 a5, uint64_t a6, void *a7)
{
  *(_WORD *)(a6 + 10) = 0;
  *(_DWORD *)(a6 + 6) = 0;
  *(unsigned char *)a6 = HIBYTE(a1);
  *(unsigned char *)(a6 + 1) = a1;
  *(unsigned char *)(a6 + 2) = HIBYTE(a2);
  *(unsigned char *)(a6 + 3) = a2;
  *(_WORD *)(a6 + 4) = 256;
  int v11 = *__src;
  int v12 = __src;
  if (*__src)
  {
    int v12 = __src;
    do
    {
      id v13 = &v12[v11];
      int v14 = v13[1];
      int v12 = v13 + 1;
      int v11 = v14;
    }
    while (v14);
  }
  unint64_t v15 = v12 - __src + 1;
  if (v15 > 0x100) {
    return 4294960553;
  }
  memcpy((void *)(a6 + 12), __src, v12 - __src + 1);
  __int16 v16 = (unsigned char *)(a6 + 12 + v15);
  *__int16 v16 = HIBYTE(a4);
  v16[1] = a4;
  v16[2] = HIBYTE(a5);
  v16[3] = a5;
  uint64_t result = 0;
  if (a7) {
    *a7 = v15 + 16;
  }
  return result;
}

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v51 = 0;
  int v50 = 0;
  if (a2 < 0xC)
  {
LABEL_69:
    int v36 = 0;
    uint64_t v21 = 0;
    int DomainName = -6743;
    goto LABEL_58;
  }
  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    int v36 = 0;
    uint64_t v21 = 0;
    int DomainName = -6764;
    goto LABEL_58;
  }
  *(void *)uint64_t v51 = a1 + 12;
  int DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v50 + 1, &v50, v51);
  if (DomainName) {
    goto LABEL_63;
  }
  if ((unsigned __int16)v50 != 1)
  {
    int v36 = 0;
    uint64_t v21 = 0;
    int DomainName = -6756;
    goto LABEL_58;
  }
  int v9 = __src[0];
  unsigned int v10 = __src;
  if (__src[0])
  {
    do
    {
      int v11 = &v10[v9];
      int v12 = v11[1];
      unsigned int v10 = v11 + 1;
      int v9 = v12;
    }
    while (v12);
  }
  int64_t v13 = v10 - __src;
  unint64_t __n = v10 - __src + 1;
  uint64_t v40 = *(char **)v51;
  __memcpy_chk();
  unsigned int v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    int v15 = 0;
    unsigned int v42 = -1;
LABEL_9:
    int v16 = 0;
    *(void *)uint64_t v51 = v40;
    char v17 = 1;
    while (1)
    {
      unint64_t v49 = 0;
      LODWORD(v47) = 0;
      LOWORD(v46) = 0;
      unsigned __int16 v48 = 0;
      int DomainName = _DNSMessageExtractRecordEx(a1, a2, *(char **)v51, (char *)v52, &v46, &v48, &v47, (unsigned __int16 **)&v49, 0, 0, 0, 0, 0, v51);
      if (DomainName) {
        break;
      }
      if ((unsigned __int16)v46 == 5 && v48 == (unsigned __int16)v50 && DomainNameEqual(v52, __dst))
      {
        int DomainName = DNSMessageExtractDomainName(a1, a2, v49, (char *)__dst, 0);
        if (DomainName) {
          break;
        }
        char v17 = 0;
        unsigned int v18 = v42;
        if (v42 >= v47) {
          unsigned int v18 = v47;
        }
        unsigned int v42 = v18;
        if (++v16 == v14) {
          goto LABEL_22;
        }
      }
      else if (v14 == ++v16)
      {
        if (v17) {
          goto LABEL_25;
        }
LABEL_22:
        if (++v15 != v14) {
          goto LABEL_9;
        }
        goto LABEL_25;
      }
    }
LABEL_63:
    int v36 = 0;
LABEL_57:
    uint64_t v21 = 0;
    goto LABEL_58;
  }
  unsigned int v42 = -1;
LABEL_25:
  int v38 = a4;
  CFSetRef v19 = 0;
  int v20 = 0;
  uint64_t v21 = 0;
  size_t size = v13 + 17;
  char v22 = 1;
  a4 = &v47;
  while (1)
  {
    char v41 = v22;
    *(void *)uint64_t v51 = v40;
    if (v14) {
      break;
    }
    unsigned int v44 = 0;
    if (v21) {
      goto LABEL_52;
    }
LABEL_45:
    if (!size || (int v30 = (char *)malloc_type_calloc(1uLL, size, 0xF1748037uLL)) == 0)
    {
      __break(1u);
      goto LABEL_69;
    }
    uint64_t v21 = v30;
    if (size < 0xC) {
      goto LABEL_67;
    }
    int v31 = *(_DWORD *)a1;
    *((_WORD *)v30 + 2) = *(_WORD *)(a1 + 4);
    *(_DWORD *)int v30 = v31;
    *(_DWORD *)(v30 + 6) = 0;
    *((_WORD *)v30 + 5) = 0;
    if (size - 12 < __n) {
      goto LABEL_67;
    }
    CFSetRef v19 = &v30[size];
    uint64_t v32 = v30 + 12;
    memcpy(v30 + 12, __src, __n);
    int v33 = &v32[__n];
    if ((unint64_t)(v19 - &v32[__n]) < 4) {
      goto LABEL_67;
    }
    char v22 = 0;
    char v34 = BYTE2(v50);
    __int16 v35 = v50;
    *int v33 = HIBYTE(v50);
    v33[1] = v34;
    v33[2] = HIBYTE(v35);
    v33[3] = v35;
    int v20 = v33 + 4;
    *((_WORD *)v21 + 2) = 256;
    if ((v41 & 1) == 0) {
      goto LABEL_54;
    }
  }
  unsigned int v44 = 0;
  unsigned int v23 = v14;
  do
  {
    unint64_t v49 = 0;
    uint64_t v47 = 0;
    unsigned int v46 = 0;
    unsigned __int16 v48 = 0;
    unsigned __int16 v45 = 0;
    unsigned int v24 = *(char **)v51;
    int DomainName = _DNSMessageExtractRecordEx(a1, a2, *(char **)v51, (char *)v52, &v48, &v45, &v46, 0, 0, 0, 0, 0, (unint64_t *)&v47, v51);
    if (DomainName) {
      goto LABEL_65;
    }
    if (v48 == HIWORD(v50) && v45 == (unsigned __int16)v50 && DomainNameEqual(v52, __dst))
    {
      if (v21)
      {
        if (v19 - v20 < 2) {
          goto LABEL_64;
        }
        *(_WORD *)int v20 = 3264;
        if ((unint64_t)(v19 - v20 - 2) < 0xA) {
          goto LABEL_64;
        }
        unsigned int v25 = v46;
        if (v46 >= v42) {
          unsigned int v25 = v42;
        }
        unsigned int v46 = v25;
        char v26 = v48;
        unsigned __int16 v27 = v45;
        __int16 v28 = v47;
        v20[2] = HIBYTE(v48);
        v20[3] = v26;
        void v20[4] = HIBYTE(v27);
        v20[5] = v27;
        v20[6] = HIBYTE(v25);
        v20[7] = BYTE2(v25);
        v20[8] = BYTE1(v25);
        v20[9] = v25;
        v20[10] = HIBYTE(v28);
        v20[11] = v28;
        uint64_t v29 = v20 + 12;
        if (v19 - v29 < (unint64_t)v47)
        {
LABEL_64:
          int DomainName = -6762;
LABEL_65:
          int v36 = 0;
          goto LABEL_66;
        }
        int DomainName = _DNSMessageExtractRecordEx(a1, a2, v24, 0, 0, 0, 0, 0, 0, v29, v47, (size_t *)&v49, 0, 0);
        if (DomainName) {
          goto LABEL_65;
        }
        int v20 = &v49[(void)v29];
        ++v44;
      }
      else
      {
        size += v47 + 12;
      }
    }
    --v23;
  }
  while (v23);
  if (!v21) {
    goto LABEL_45;
  }
LABEL_52:
  if (size >= 0xC)
  {
    *((_WORD *)v21 + 3) = bswap32(v44) >> 16;
LABEL_54:
    a4 = v38;
    int DomainName = 0;
    if (a3) {
      *a3 = v20 - v21;
    }
    int v36 = v21;
    goto LABEL_57;
  }
LABEL_67:
  int v36 = 0;
  int DomainName = -6762;
LABEL_66:
  a4 = v38;
LABEL_58:
  if (a4) {
    *(_DWORD *)a4 = DomainName;
  }
  if (v21) {
    free(v21);
  }
  return v36;
}

uint64_t DomainNameEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  while (1)
  {
    uint64_t v4 = *v3;
    if (v3 != v2)
    {
      int v5 = *v2;
      if (v4 != v5 || mdns_memcmp_us_ascii_case_insensitive(v3 + 1, v2 + 1, *v3, v5)) {
        break;
      }
    }
    v3 += v4 + 1;
    v2 += v4 + 1;
    if (!v4) {
      return 1;
    }
  }
  return 0;
}

uint64_t DomainNameAppendDomainName(unsigned char *a1, unsigned char *a2, void *a3)
{
  int v5 = *a1;
  int v6 = a1;
  if (*a1)
  {
    int v6 = a1;
    do
    {
      unsigned int v7 = &v6[v5];
      int v8 = v7[1];
      int v6 = v7 + 1;
      int v5 = v8;
    }
    while (v8);
  }
  unint64_t v9 = v6 - a1;
  int v10 = *a2;
  int v11 = a2;
  if (*a2)
  {
    int v11 = a2;
    do
    {
      int v12 = &v11[v10];
      int v13 = v12[1];
      int v11 = v12 + 1;
      int v10 = v13;
    }
    while (v13);
  }
  uint64_t result = 4294960553;
  if (v9 <= 0x100)
  {
    size_t v15 = v11 - a2 + 1;
    if (v15 <= 0x100)
    {
      size_t v16 = v15 + v9;
      if (v15 + v9 <= 0x100)
      {
        memcpy(&a1[v9], a2, v15);
        uint64_t result = 0;
        if (a3) {
          *a3 = &a1[v16];
        }
      }
    }
  }
  return result;
}

uint64_t DomainNameAppendString(unsigned char *a1, char *a2, void *a3)
{
  uint64_t v3 = a1;
  while (*v3)
  {
    v3 += *v3 + 1;
    if (v3 >= a1 + 256) {
      return 4294960554;
    }
  }
  int v5 = *a2;
  if (*a2)
  {
    if (v5 != 46) {
      goto LABEL_9;
    }
    if (a2[1])
    {
      int v5 = 46;
LABEL_9:
      unint64_t v6 = (unint64_t)(a1 + 255);
      do
      {
        if ((unint64_t)(v3 + 64) >= v6) {
          unsigned int v7 = (unsigned char *)v6;
        }
        else {
          unsigned int v7 = v3 + 64;
        }
        int v8 = v3 + 1;
        unint64_t v9 = v3 + 1;
        int v10 = (unsigned __int8 *)a2;
        do
        {
          a2 = (char *)(v10 + 1);
          if (v5 == 92)
          {
            int v5 = *a2;
            if (!*a2) {
              return 4294960546;
            }
            a2 = (char *)(v10 + 2);
            if (v5 - 48 <= 9)
            {
              int v11 = *a2;
              if ((v11 - 48) <= 9)
              {
                int v12 = v10[3];
                if ((v12 - 48) <= 9)
                {
                  int v13 = 100 * v5 + 10 * (char)v11 + (char)v12;
                  unsigned int v14 = (char *)(v10 + 4);
                  if (v13 < 5584)
                  {
                    a2 = v14;
                    LOBYTE(v5) = v13 + 48;
                  }
                }
              }
            }
          }
          else if (v5 == 46)
          {
            break;
          }
          if (v9 >= v7) {
            return 4294960545;
          }
          *v9++ = v5;
          int v5 = *a2;
          int v10 = (unsigned __int8 *)a2;
        }
        while (*a2);
        if (v9 == v8) {
          return 4294960554;
        }
        unsigned char *v3 = (_BYTE)v9 - (_BYTE)v8;
        unsigned char *v9 = 0;
        int v5 = *a2;
        uint64_t v3 = v9;
      }
      while (*a2);
      goto LABEL_29;
    }
  }
  unint64_t v9 = v3;
LABEL_29:
  uint64_t result = 0;
  if (a3) {
    *a3 = v9 + 1;
  }
  return result;
}

unsigned char *DomainNameDupEx(unsigned char *result, int a2, unsigned __int8 **a3, size_t *a4)
{
  unsigned int v7 = result;
  int v8 = *result;
  unint64_t v9 = result;
  if (*result)
  {
    unint64_t v9 = result;
    do
    {
      int v10 = &v9[v8];
      int v11 = v10[1];
      unint64_t v9 = v10 + 1;
      int v8 = v11;
    }
    while (v11);
  }
  size_t v12 = v9 - result + 1;
  if (v9 - result == -1 || (uint64_t result = malloc_type_malloc(v9 - result + 1, 0xA172743EuLL)) == 0)
  {
    __break(1u);
  }
  else
  {
    int v13 = result;
    memcpy(result, v7, v12);
    if (a2)
    {
      unsigned int v14 = *v13;
      if (*v13)
      {
        size_t v15 = v13;
        do
        {
          size_t v16 = v15 + 1;
          char v17 = v16;
          uint64_t v18 = v14;
          do
          {
            int v19 = *v17;
            if ((v19 - 65) < 0x1A) {
              LOBYTE(v19) = v19 + 32;
            }
            *v17++ = v19;
            --v18;
          }
          while (v18);
          size_t v15 = &v16[v14];
          unsigned int v14 = *v15;
        }
        while (*v15);
      }
    }
    *a3 = v13;
    if (a4) {
      *a4 = v12;
    }
    return 0;
  }
  return result;
}

BOOL DomainLabelEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = *a1;
  int v3 = *a2;
  return v2 == v3 && mdns_memcmp_us_ascii_case_insensitive(a1 + 1, a2 + 1, v2, v3) == 0;
}

uint64_t DomainNameFromString(unsigned char *a1, char *a2, void *a3)
{
  *a1 = 0;
  return DomainNameAppendString(a1, a2, a3);
}

uint64_t DomainNameLabelCount(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)result;
  if (!*(unsigned char *)result) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  int v3 = (unsigned char *)v2;
  while (v1 <= 0x3F)
  {
    v3 += v1 + 1;
    if ((uint64_t)&v3[-v2] > 255) {
      break;
    }
    uint64_t result = (result + 1);
    unsigned int v1 = *v3;
    if (!*v3) {
      return result;
    }
  }
  return 0xFFFFFFFFLL;
}

const char *DNSRecordTypeValueToString(int a1)
{
  if (a1 > 248)
  {
    if (a1 >= 0x8000)
    {
      switch(a1)
      {
        case 0x8000:
          return "TA";
        case 0x8001:
          return "DLV";
        case 0xFFFF:
          return "Reserved";
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 249:
          uint64_t result = "TKEY";
          break;
        case 250:
          uint64_t result = "TSIG";
          break;
        case 251:
          uint64_t result = "IXFR";
          break;
        case 252:
          uint64_t result = "AXFR";
          break;
        case 253:
          uint64_t result = "MAILB";
          break;
        case 254:
          uint64_t result = "MAILA";
          break;
        case 255:
          uint64_t result = "ANY";
          break;
        case 256:
          uint64_t result = "URI";
          break;
        case 257:
          uint64_t result = "CAA";
          break;
        case 258:
          uint64_t result = "AVC";
          break;
        case 259:
          uint64_t result = "DOA";
          break;
        case 260:
          uint64_t result = "AMTRELAY";
          break;
        default:
          return 0;
      }
    }
  }
  else
  {
    int v1 = a1 - 1;
    uint64_t result = "A";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "NS";
        break;
      case 2:
        uint64_t result = "MD";
        break;
      case 3:
        uint64_t result = "MF";
        break;
      case 4:
        uint64_t result = "CNAME";
        break;
      case 5:
        uint64_t result = "SOA";
        break;
      case 6:
        uint64_t result = "MB";
        break;
      case 7:
        uint64_t result = "MG";
        break;
      case 8:
        uint64_t result = "MR";
        break;
      case 9:
        uint64_t result = "NULL";
        break;
      case 10:
        uint64_t result = "WKS";
        break;
      case 11:
        uint64_t result = "PTR";
        break;
      case 12:
        uint64_t result = "HINFO";
        break;
      case 13:
        uint64_t result = "MINFO";
        break;
      case 14:
        uint64_t result = "MX";
        break;
      case 15:
        uint64_t result = "TXT";
        break;
      case 16:
        uint64_t result = "RP";
        break;
      case 17:
        uint64_t result = "AFSDB";
        break;
      case 18:
        uint64_t result = "X25";
        break;
      case 19:
        uint64_t result = "ISDN";
        break;
      case 20:
        uint64_t result = "RT";
        break;
      case 21:
        uint64_t result = "NSAP";
        break;
      case 22:
        uint64_t result = "NSAP-PTR";
        break;
      case 23:
        uint64_t result = "SIG";
        break;
      case 24:
        uint64_t result = "KEY";
        break;
      case 25:
        uint64_t result = "PX";
        break;
      case 26:
        uint64_t result = "GPOS";
        break;
      case 27:
        uint64_t result = "AAAA";
        break;
      case 28:
        uint64_t result = "LOC";
        break;
      case 29:
        uint64_t result = "NXT";
        break;
      case 30:
        uint64_t result = "EID";
        break;
      case 31:
        uint64_t result = "NIMLOC";
        break;
      case 32:
        uint64_t result = "SRV";
        break;
      case 33:
        uint64_t result = "ATMA";
        break;
      case 34:
        uint64_t result = "NAPTR";
        break;
      case 35:
        uint64_t result = "KX";
        break;
      case 36:
        uint64_t result = "CERT";
        break;
      case 37:
        uint64_t result = "A6";
        break;
      case 38:
        uint64_t result = "DNAME";
        break;
      case 39:
        uint64_t result = "SINK";
        break;
      case 40:
        uint64_t result = "OPT";
        break;
      case 41:
        uint64_t result = "APL";
        break;
      case 42:
        uint64_t result = "DS";
        break;
      case 43:
        uint64_t result = "SSHFP";
        break;
      case 44:
        uint64_t result = "IPSECKEY";
        break;
      case 45:
        uint64_t result = "RRSIG";
        break;
      case 46:
        uint64_t result = "NSEC";
        break;
      case 47:
        uint64_t result = "DNSKEY";
        break;
      case 48:
        uint64_t result = "DHCID";
        break;
      case 49:
        uint64_t result = "NSEC3";
        break;
      case 50:
        uint64_t result = "NSEC3PARAM";
        break;
      case 51:
        uint64_t result = "TLSA";
        break;
      case 52:
        uint64_t result = "SMIMEA";
        break;
      case 54:
        uint64_t result = "HIP";
        break;
      case 55:
        uint64_t result = "NINFO";
        break;
      case 56:
        uint64_t result = "RKEY";
        break;
      case 57:
        uint64_t result = "TALINK";
        break;
      case 58:
        uint64_t result = "CDS";
        break;
      case 59:
        uint64_t result = "CDNSKEY";
        break;
      case 60:
        uint64_t result = "OPENPGPKEY";
        break;
      case 61:
        uint64_t result = "CSYNC";
        break;
      case 62:
        uint64_t result = "ZONEMD";
        break;
      case 63:
        uint64_t result = "SVCB";
        break;
      case 64:
        uint64_t result = "HTTPS";
        break;
      case 98:
        uint64_t result = "SPF";
        break;
      case 99:
        uint64_t result = "UINFO";
        break;
      case 100:
        uint64_t result = "UID";
        break;
      case 101:
        uint64_t result = "GID";
        break;
      case 102:
        uint64_t result = "UNSPEC";
        break;
      case 103:
        uint64_t result = "NID";
        break;
      case 104:
        uint64_t result = "L32";
        break;
      case 105:
        uint64_t result = "L64";
        break;
      case 106:
        uint64_t result = "LP";
        break;
      case 107:
        uint64_t result = "EUI48";
        break;
      case 108:
        uint64_t result = "EUI64";
        break;
      default:
        return 0;
    }
  }
  return result;
}

unsigned __int16 *DNSRecordTypeStringToValue(const void *a1)
{
  uint64_t result = (unsigned __int16 *)bsearch(a1, &DNSRecordTypeStringToValue_sTable, 0x5AuLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
  if (result) {
    return (unsigned __int16 *)result[4];
  }
  return result;
}

uint64_t _DNSRecordTypeStringToValueCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

const char *DNSRCodeToString(int a1)
{
  uint64_t result = "NoError";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "FormErr";
      break;
    case 2:
      uint64_t result = "ServFail";
      break;
    case 3:
      uint64_t result = "NXDomain";
      break;
    case 4:
      uint64_t result = "NotImp";
      break;
    case 5:
      uint64_t result = "Refused";
      break;
    case 6:
      uint64_t result = "YXDomain";
      break;
    case 7:
      uint64_t result = "YXRRSet";
      break;
    case 8:
      uint64_t result = "NXRRSet";
      break;
    case 9:
      uint64_t result = "NotAuth";
      break;
    case 10:
      uint64_t result = "NotZone";
      break;
    case 11:
      uint64_t result = "DSOTYPENI";
      break;
    case 12:
    case 13:
    case 14:
    case 15:
      goto LABEL_5;
    case 16:
      uint64_t result = "BADVERS";
      break;
    case 17:
      uint64_t result = "BADKEY";
      break;
    case 18:
      uint64_t result = "BADTIME";
      break;
    case 19:
      uint64_t result = "BADMODE";
      break;
    case 20:
      uint64_t result = "BADNAME";
      break;
    case 21:
      uint64_t result = "BADALG";
      break;
    case 22:
      uint64_t result = "BADTRUNC";
      break;
    case 23:
      uint64_t result = "BADCOOKIE";
      break;
    default:
      if (a1 == 0xFFFF) {
        uint64_t result = "Reserved";
      }
      else {
LABEL_5:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t DNSRCodeFromString(const void *a1)
{
  int v1 = (unsigned int *)bsearch(a1, &DNSRCodeFromString_sTable, 0x15uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRCodeFromStringCmp);
  if (v1) {
    return v1[2];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _DNSRCodeFromStringCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

uint64_t DNSMessageToString(char *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  __src[127] = *(void **)MEMORY[0x263EF8340];
  v106 = 0;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global_356);
  }
  uint64_t v109 = 0;
  memset(v108, 0, sizeof(v108));
  *(void *)uint64_t v107 = 0;
  uint64_t v105 = 0;
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_649;
  }
  _GetCUSymAddr_DataBuffer_Init_sAddr(v108, v119, 512, -1);
  if (a2 < 0xC)
  {
LABEL_652:
    uint64_t v79 = 4294960553;
    goto LABEL_642;
  }
  unint64_t v8 = ((unint64_t)a1[2] >> 3) & 0xF;
  unsigned int v103 = __rev16(*((unsigned __int16 *)a1 + 2));
  unsigned int v101 = __rev16(*((unsigned __int16 *)a1 + 3));
  unsigned int v100 = __rev16(*((unsigned __int16 *)a1 + 4));
  uint64_t v98 = a4;
  unsigned int v99 = __rev16(*((unsigned __int16 *)a1 + 5));
  unint64_t v9 = "";
  if ((a3 & 0x20) != 0) {
    goto LABEL_75;
  }
  unint64_t v10 = a1[3] | (a1[2] << 8);
  uint64_t v11 = __rev16(*(unsigned __int16 *)a1);
  if ((a3 & 4) != 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    int v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
    uint64_t v16 = 81;
    if ((v10 & 0x8000u) != 0) {
      uint64_t v16 = 82;
    }
    unint64_t v95 = v10;
    uint64_t v96 = v16;
    uint64_t v94 = v11;
    size_t v15 = "id: 0x%04X (%u), flags: 0x%04X (%c/";
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "ID:               0x%04X (%u)\n", v11, v11);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    int v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
    uint64_t v14 = 81;
    if ((v10 & 0x8000u) != 0) {
      uint64_t v14 = 82;
    }
    uint64_t v94 = v14;
    size_t v15 = "Flags:            0x%04X %c/";
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = v13(v108, v15);
  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_641;
  }
  if (v8 > 6 || v8 == 3)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    int v17 = v8;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "OPCODE%d");
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    int v17 = v8;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s");
  }
  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_641;
  }
  for (uint64_t i = 0; i != 14; i += 2)
  {
    if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_649;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, ", %s", (&kDNSHeaderFlagsDescs)[i]);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_641;
      }
    }
  }
  int v19 = DNSRCodeToString(v10 & 0xF);
  if (v19)
  {
    int v20 = v19;
    LODWORD(v8) = v17;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t v92 = (uint64_t)v20;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, ", %s");
  }
  else
  {
    LODWORD(v8) = v17;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t v92 = v10 & 0xF;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, ", RCODE%d");
  }
  if (CUSymAddr_DataBuffer_AppendF_sAddr)
  {
LABEL_641:
    uint64_t v79 = CUSymAddr_DataBuffer_AppendF_sAddr;
    goto LABEL_642;
  }
  if ((a3 & 4) == 0)
  {
    if ((a3 & 0x40) != 0) {
      goto LABEL_633;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\n", v92, v94);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "Question count:   %u\n", v103);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "Answer count:     %u\n", v101);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "Authority count:  %u\n", v100);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "Additional count: %u\n", v99);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    unint64_t v9 = "";
LABEL_75:
    if ((a3 & 0x10) == 0) {
      goto LABEL_76;
    }
LABEL_633:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_226);
    }
    if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v108, "", 1);
    if (!CUSymAddr_DataBuffer_AppendF_sAddr)
    {
      if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_230);
      }
      if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
      {
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v108, v98, &v105);
        goto LABEL_641;
      }
LABEL_649:
      uint64_t v79 = 4294960561;
      goto LABEL_642;
    }
    goto LABEL_641;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_649;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, ")", v92, v94);
  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_641;
  }
  if ((a3 & 0x40) != 0) {
    goto LABEL_633;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_649;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, ", counts: %u/%u/%u/%u", v103, v101, v100, v99);
  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_641;
  }
  unint64_t v9 = ", ";
  if ((a3 & 0x10) != 0) {
    goto LABEL_633;
  }
LABEL_76:
  int v97 = v8;
  int v104 = (a3 >> 3) & 1;
  *(void *)uint64_t v107 = a1 + 12;
  if (v103)
  {
    uint64_t v21 = 0;
    int v22 = 0;
    unsigned int v23 = v117;
    while (1)
    {
      LOWORD(__src[0]) = 0;
      LOWORD(v120[0]) = 0;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion((unint64_t)a1, a2, *(char **)v107, v23, __src, v120, v107);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_641;
      }
      BOOL v24 = SLOWORD(v120[0]) < 0;
      if (a3) {
        LOWORD(v120[0]) &= ~0x8000u;
      }
      int v25 = a3 & v24;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s", v9);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (v21 && DomainNameEqual((unsigned __int8 *)v23, v21))
        {
          char v26 = v23;
          unsigned int v23 = (char *)v21;
        }
        else
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0, v118, 0);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
          if (v104 && _NameIsPrivate((const char *)v118))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s ");
          }
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
          if (v23 == v117) {
            char v26 = v116;
          }
          else {
            char v26 = v117;
          }
          *char v26 = 0;
        }
        int v30 = "ANY";
        if (LOWORD(v120[0]) != 255) {
          int v30 = 0;
        }
        if (LOWORD(v120[0]) == 1) {
          int v31 = "IN";
        }
        else {
          int v31 = v30;
        }
        if (v31)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "CLASS%u");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (a3)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v32 = "QM";
          if (v25) {
            uint64_t v32 = "QU";
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", v32);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
        }
        int v33 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v33)
        {
          char v34 = v33;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v91 = (uint64_t)v34;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s?");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v91 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u?");
        }
        unint64_t v9 = ", ";
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
      }
      else
      {
        if (!v22)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\nQUESTION SECTION\n");
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0, v118, 0);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (v104 && _NameIsPrivate((const char *)v118))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~-30s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%-30s");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        unsigned __int16 v27 = "QM";
        if (v25) {
          unsigned __int16 v27 = "QU";
        }
        if ((a3 & 1) == 0) {
          unsigned __int16 v27 = "";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %2s", v27);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        __int16 v28 = "ANY";
        if (LOWORD(v120[0]) != 255) {
          __int16 v28 = 0;
        }
        if (LOWORD(v120[0]) == 1) {
          uint64_t v29 = "IN";
        }
        else {
          uint64_t v29 = v28;
        }
        if (v29)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CLASS%u");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        __int16 v35 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v35)
        {
          int v36 = v35;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v91 = (uint64_t)v36;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %-5s\n");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v91 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u\n");
        }
        char v26 = v23;
        unsigned int v23 = (char *)v21;
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
      }
      uint64_t v21 = (unsigned __int8 *)v23;
      ++v22;
      unsigned int v23 = v26;
      if (v103 == v22) {
        goto LABEL_202;
      }
    }
  }
  uint64_t v21 = 0;
  char v26 = v117;
LABEL_202:
  if (v100 + v101 + v99)
  {
    int v37 = 0;
    while (1)
    {
      __src[0] = 0;
      v120[0] = 0;
      LODWORD(v115) = 0;
      LOWORD(v114) = 0;
      LOWORD(v113) = 0;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx((unint64_t)a1, a2, *(char **)v107, v26, &v114, &v113, &v115, (unsigned __int16 **)__src, v120, 0, 0, 0, 0, v107);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_641;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v26, 0, v118, 0);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_641;
      }
      BOOL v38 = (__int16)v113 < 0;
      if (a3) {
        LOWORD(v113) = (unsigned __int16)v113 & 0x7FFF;
      }
      int v39 = a3 & v38;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s", v9);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (v21 && DomainNameEqual((unsigned __int8 *)v26, v21))
        {
          uint64_t v40 = v26;
          char v26 = (char *)v21;
        }
        else
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v26, 0, v118, 0);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
          if (v104 && _NameIsPrivate((const char *)v118))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s ");
          }
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
          if (v26 == v117) {
            uint64_t v40 = v116;
          }
          else {
            uint64_t v40 = v117;
          }
          *uint64_t v40 = 0;
        }
        if ((unsigned __int16)v114 == 41)
        {
          if (v39)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "CF ");
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_641;
            }
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          int v41 = (a3 >> 3) & 1;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "OPT %u", (unsigned __int16)v113);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
          if (v115)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " 0x%08X");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " 0");
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%u", v115);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
          if (v39)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CF");
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_641;
            }
          }
          unsigned int v42 = "ANY";
          if ((unsigned __int16)v113 != 255) {
            unsigned int v42 = 0;
          }
          if ((unsigned __int16)v113 == 1) {
            unint64_t v43 = "IN";
          }
          else {
            unint64_t v43 = v42;
          }
          if (v43)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", v43);
            int v41 = (a3 >> 3) & 1;
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_641;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            int v41 = (a3 >> 3) & 1;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CLASS%u", (unsigned __int16)v113);
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_641;
            }
          }
          if (DNSRecordTypeValueToString((unsigned __int16)v114))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_649;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u");
          }
        }
        unint64_t v9 = ", ";
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        goto LABEL_373;
      }
      if (v101 && !v37) {
        break;
      }
      if (v100 && v101 == v37)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\nAUTHORITY SECTION\n");
        goto LABEL_285;
      }
      if (v99 && v100 + v101 == v37)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\nADDITIONAL SECTION\n");
        goto LABEL_285;
      }
LABEL_286:
      if ((unsigned __int16)v114 == 41)
      {
        if (v104 && _NameIsPrivate((const char *)v118))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        unsigned int v44 = "";
        if (v39) {
          unsigned int v44 = " CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s OPT %u", v44, (unsigned __int16)v113);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        int v41 = (a3 >> 3) & 1;
        if (v115)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " 0x%08X");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " 0");
        }
      }
      else
      {
        if (v104)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~-42s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%-42s");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        unsigned __int16 v45 = "";
        if (v39) {
          unsigned __int16 v45 = "CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %6u %2s", v115, v45);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        unsigned int v46 = "ANY";
        if ((unsigned __int16)v113 != 255) {
          unsigned int v46 = 0;
        }
        if ((unsigned __int16)v113 == 1) {
          uint64_t v47 = "IN";
        }
        else {
          uint64_t v47 = v46;
        }
        if (v47)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", v47);
          int v41 = (a3 >> 3) & 1;
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          int v41 = (a3 >> 3) & 1;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CLASS%u", (unsigned __int16)v113);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_641;
          }
        }
        if (DNSRecordTypeValueToString((unsigned __int16)v114))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %-5s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u");
        }
      }
      uint64_t v40 = v26;
      char v26 = (char *)v21;
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_641;
      }
LABEL_373:
      if ((a3 & 2) == 0) {
        DNSRecordDataToStringEx((unsigned __int16 *)__src[0], v120[0], (unsigned __int16)v114, (unint64_t)a1, a2, v41, (uint64_t)&v106);
      }
      if (v106)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", (const char *)v106);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
        if (v106)
        {
          free(v106);
          v106 = 0;
        }
      }
      else
      {
        if (v41)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v91 = v120[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " [%zu B]");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          unint64_t v93 = v120[0];
          unint64_t v95 = v120[0];
          uint64_t v91 = (uint64_t)__src[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %#H");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
      }
      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v114 == 5)
        {
          int DomainName = DNSMessageExtractDomainName((unint64_t)a1, a2, (char *)__src[0], v40, 0);
          unint64_t v49 = v117;
          if (v40 == v117) {
            unint64_t v49 = v116;
          }
          if (!DomainName)
          {
            char v26 = v40;
            uint64_t v40 = v49;
          }
          *uint64_t v40 = 0;
        }
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_649;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\n");
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_641;
        }
      }
      ++v37;
      uint64_t v21 = (unsigned __int8 *)v26;
      char v26 = v40;
      if (v101 + v99 + v100 == v37) {
        goto LABEL_405;
      }
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\nANSWER SECTION\n");
LABEL_285:
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    goto LABEL_286;
  }
LABEL_405:
  if (v97 != 6) {
    goto LABEL_633;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
  }
  int v50 = a1;
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_649;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "[");
  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_641;
  }
  uint64_t v51 = &a1[a2];
  int v52 = *(char **)v107;
  if (*(void *)v107 >= (unint64_t)&a1[a2])
  {
LABEL_626:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    if ((a3 >> 2)) {
      uint64_t v89 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "]", v91, v93, v95, v96);
    }
    else {
      uint64_t v89 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "\n]", v91, v93, v95, v96);
    }
    uint64_t v79 = v89;
    if (v89) {
      goto LABEL_642;
    }
    goto LABEL_633;
  }
  if ((a3 >> 2)) {
    size_t v53 = "";
  }
  else {
    size_t v53 = "\n\t";
  }
  if ((a3 >> 2)) {
    char v54 = ", ";
  }
  else {
    char v54 = ",\n\t";
  }
  v102 = v54;
  while (v52 >= v50)
  {
    if ((unint64_t)(v51 - v52) < 4
      || (v55 = __rev16(*((unsigned __int16 *)v52 + 1)), unint64_t v56 = v52 + 4, v51 - (v52 + 4) < v55))
    {
LABEL_650:
      uint64_t v79 = 4294960546;
      goto LABEL_642;
    }
    unsigned int v57 = *(unsigned __int16 *)v52;
    unint64_t v58 = (unint64_t)&v56[v55];
    *(void *)uint64_t v107 = &v56[v55];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_649;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s", v53);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    uint64_t v61 = __rev16(v57);
    if (!v60 & v59)
    {
      switch((int)v61)
      {
        case '@':
          int v62 = "SUBSCRIBE";
          goto LABEL_440;
        case 'A':
          int v62 = "PUSH";
          goto LABEL_440;
        case 'B':
          int v62 = "UNSUBSCRIBE";
          goto LABEL_440;
        case 'C':
          int v62 = "RECONFIRM";
          goto LABEL_440;
        default:
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_649;
          }
          uint64_t v91 = v61;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "DSO-TYPE%u: ");
          break;
      }
    }
    else
    {
      int v62 = "Reserved";
      switch((int)v61)
      {
        case 0:
          break;
        case 1:
          int v62 = "KeepAlive";
          break;
        case 2:
          int v62 = "Retry Delay";
          break;
        case 3:
          int v62 = "Encryption Padding";
          break;
        default:
          JUMPOUT(0);
      }
LABEL_440:
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_649;
      }
      uint64_t v91 = (uint64_t)v62;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s: ");
    }
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_641;
    }
    uint64_t v114 = 0;
    v115 = (unsigned __int16 *)(v52 + 4);
    switch((int)v61)
    {
      case '@':
        uint64_t v63 = DNSMessageExtractDomainNameString((unint64_t)a1, a2, v52 + 4, (unsigned __int8 *)__src, &v115);
        if (v63) {
          goto LABEL_571;
        }
        int v64 = v115;
        if (v58 - (void)v115 == 4)
        {
          if (v104 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)__src;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)__src;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s");
          }
          if (v63) {
            goto LABEL_571;
          }
          uint64_t v72 = __rev16(v64[1]);
          size_t v73 = "ANY";
          if (v72 != 255) {
            size_t v73 = 0;
          }
          if (v72 == 1) {
            uint64_t v74 = "IN";
          }
          else {
            uint64_t v74 = v73;
          }
          if (v74)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)v74;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = v72;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CLASS%u");
          }
          if (v63) {
            goto LABEL_571;
          }
          uint64_t v80 = __rev16(*v64);
          int v81 = DNSRecordTypeValueToString(v80);
          if (v81)
          {
            v82 = v81;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v91 = (uint64_t)v82;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
              goto LABEL_616;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v91 = v80;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u");
              goto LABEL_616;
            }
          }
          goto LABEL_623;
        }
        uint64_t v79 = 4294960553;
        goto LABEL_618;
      case 'A':
        if (v58 <= (unint64_t)v56) {
          goto LABEL_650;
        }
        int v65 = (a3 >> 3) & 1;
        while (1)
        {
          unint64_t v112 = 0;
          v113 = 0;
          int v110 = 0;
          int v111 = 0;
          uint64_t v63 = _DNSMessageExtractRecordEx((unint64_t)a1, a2, v56, (char *)v120, (_WORD *)&v110 + 1, &v110, &v111, &v113, &v112, 0, 0, 0, 0, &v115);
          if (v63) {
            goto LABEL_571;
          }
          if ((unint64_t)v115 > v58) {
            goto LABEL_624;
          }
          uint64_t v63 = DomainNameToString((unsigned __int8 *)v120, 0, (unsigned __int8 *)__src, 0);
          if (v63) {
            goto LABEL_571;
          }
          if (v65 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)__src;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)__src;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s");
          }
          if (v63) {
            goto LABEL_571;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_623;
          }
          uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " 0x%08X", v111);
          if (v63) {
            goto LABEL_571;
          }
          uint64_t v66 = "ANY";
          if ((unsigned __int16)v110 != 255) {
            uint64_t v66 = 0;
          }
          if ((unsigned __int16)v110 == 1) {
            int v67 = "IN";
          }
          else {
            int v67 = v66;
          }
          if (v67)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)v67;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (unsigned __int16)v110;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CLASS%u");
          }
          if (v63) {
            goto LABEL_571;
          }
          unint64_t v68 = DNSRecordTypeValueToString(HIWORD(v110));
          if (v68)
          {
            size_t v69 = v68;
            int v65 = (a3 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)v69;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
          }
          else
          {
            int v65 = (a3 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = HIWORD(v110);
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u");
          }
          if (v63) {
            goto LABEL_571;
          }
          DNSRecordDataToStringEx(v113, v112, HIWORD(v110), (unint64_t)a1, a2, v65, (uint64_t)&v114);
          if (v114)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", (const char *)v114);
            if (v63) {
              goto LABEL_571;
            }
            if (v114)
            {
              free(v114);
              uint64_t v114 = 0;
            }
          }
          else
          {
            if (v65)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_623;
              }
              uint64_t v91 = v112;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " [%zu B]");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_623;
              }
              unint64_t v93 = v112;
              unint64_t v95 = v112;
              uint64_t v91 = (uint64_t)v113;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %#H");
            }
            if (v63) {
              goto LABEL_571;
            }
          }
          unint64_t v56 = (char *)v115;
          if ((unint64_t)v115 >= v58) {
            goto LABEL_617;
          }
        }
      case 'B':
        if (v55 != 2) {
          goto LABEL_652;
        }
        unsigned int v70 = *((unsigned __int16 *)v52 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_623;
        }
        uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%u", __rev16(v70));
        goto LABEL_571;
      case 'C':
        uint64_t v63 = DNSMessageExtractDomainNameString((unint64_t)a1, a2, v52 + 4, (unsigned __int8 *)__src, &v115);
        if (v63) {
          goto LABEL_571;
        }
        size_t v71 = v115;
        if (v58 - (unint64_t)v115 >= 4)
        {
          v115 += 2;
          if (v104 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v91 = (uint64_t)__src;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%~s");
              goto LABEL_555;
            }
LABEL_623:
            uint64_t v79 = 4294960561;
            goto LABEL_618;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_623;
          }
          uint64_t v91 = (uint64_t)__src;
          uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "%s");
LABEL_555:
          if (v63) {
            goto LABEL_571;
          }
          unsigned int v75 = __rev16(v71[1]);
          int v76 = "ANY";
          if (v75 != 255) {
            int v76 = 0;
          }
          if (v75 == 1) {
            v77 = "IN";
          }
          else {
            v77 = v76;
          }
          if (v77)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            unint64_t v78 = (unint64_t)a1;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", v77);
            if (v63) {
              goto LABEL_571;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " CLASS%u", v75);
            unint64_t v78 = (unint64_t)a1;
            if (v63) {
              goto LABEL_571;
            }
          }
          uint64_t v83 = __rev16(*v71);
          int v84 = DNSRecordTypeValueToString(v83);
          if (v84)
          {
            size_t v85 = v84;
            int v86 = (a3 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = (uint64_t)v85;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s");
          }
          else
          {
            int v86 = (a3 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v91 = v83;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " TYPE%u");
          }
          if (v63) {
            goto LABEL_571;
          }
          uint64_t v87 = v115;
          unint64_t v88 = v58 - (void)v115;
          DNSRecordDataToStringEx(v115, v58 - (void)v115, v83, v78, a2, v86, (uint64_t)&v114);
          if (v114)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " %s", (const char *)v114);
              if (v63) {
                goto LABEL_571;
              }
              if (v114)
              {
                free(v114);
                uint64_t v114 = 0;
              }
              goto LABEL_617;
            }
          }
          else if (v86)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v91 = v88;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " [%zu B]");
              goto LABEL_616;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v93 = v88;
              unint64_t v95 = v88;
              uint64_t v91 = (uint64_t)v87;
              uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, " '%H'");
LABEL_616:
              if (v63) {
                goto LABEL_571;
              }
LABEL_617:
              uint64_t v79 = 0;
              goto LABEL_618;
            }
          }
          goto LABEL_623;
        }
LABEL_624:
        uint64_t v79 = 4294960546;
LABEL_618:
        if (v114) {
          free(v114);
        }
        if (v79) {
          goto LABEL_642;
        }
        int v52 = *(char **)v107;
        size_t v53 = v102;
        uint64_t v51 = &a1[a2];
        int v50 = a1;
        if (*(void *)v107 >= (unint64_t)&a1[a2]) {
          goto LABEL_626;
        }
        break;
      default:
        if (v104)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            uint64_t v91 = v55;
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "[%u B]");
            goto LABEL_571;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v93 = v55;
            unint64_t v95 = v55;
            uint64_t v91 = (uint64_t)(v52 + 4);
            uint64_t v63 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v108, "'%H'");
LABEL_571:
            uint64_t v79 = v63;
            goto LABEL_618;
          }
        }
        goto LABEL_623;
    }
  }
  uint64_t v79 = 4294960586;
LABEL_642:
  if (v106) {
    free(v106);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_234);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
    _GetCUSymAddr_DataBuffer_Free_sAddr(v108);
  }
  return v79;
}

uint64_t _NameIsPrivate(const char *a1)
{
  uint64_t result = strcasecmp(a1, ".");
  if (result) {
    return strcasecmp(a1, "ipv4only.arpa.") != 0;
  }
  return result;
}

uint64_t DNSRecordDataToStringEx(unsigned __int16 *a1, unint64_t a2, int a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  v90[127] = *(void **)MEMORY[0x263EF8340];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global_356);
  }
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  memset(v85, 0, sizeof(v85));
  uint64_t v84 = 0;
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_427;
  }
  uint64_t v79 = a7;
  unint64_t v13 = (unint64_t)a1 + a2;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v85, v89, 256, -1);
  uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960582;
  if (a3 <= 32)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4) {
          goto LABEL_429;
        }
        uint64_t appended = _AppendIPv4Address((uint64_t)v85, 0, (unsigned int *)a1, a6);
        if (appended) {
          goto LABEL_421;
        }
        goto LABEL_413;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v90, 0);
          if (appended) {
            goto LABEL_421;
          }
        }
        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, (unsigned __int8 *)v90, 0);
          if (appended) {
            goto LABEL_421;
          }
        }
        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0, a6, (const char *)v90);
        if (appended) {
          goto LABEL_421;
        }
        goto LABEL_413;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
        goto LABEL_422;
      case 6:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v90, &v87);
          if (appended) {
            goto LABEL_421;
          }
          if ((unint64_t)v87 >= v13) {
            goto LABEL_429;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0, a6, (const char *)v90);
          if (appended) {
            goto LABEL_421;
          }
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v87, (unsigned __int8 *)v90, &v87);
          if (appended) {
            goto LABEL_421;
          }
        }
        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, (unsigned __int8 *)v90, &v87);
          if (appended) {
            goto LABEL_421;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0, a6, (const char *)v90);
          if (appended) {
            goto LABEL_421;
          }
          uint64_t appended = DomainNameToString(v87, (unint64_t)a1 + a2, (unsigned __int8 *)v90, &v87);
          if (appended) {
            goto LABEL_421;
          }
        }
        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)" ", a6, (const char *)v90);
        if (appended) {
          goto LABEL_421;
        }
        uint64_t v74 = (unsigned int *)v87;
        if (v13 - (void)v87 != 20) {
          goto LABEL_429;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %u %u %u %u %u", bswap32(*v74), bswap32(v74[1]), bswap32(v74[2]), bswap32(v74[3]), bswap32(v74[4]));
          goto LABEL_412;
        }
        goto LABEL_427;
      case 13:
      case 16:
        if (!a2) {
          goto LABEL_429;
        }
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "[%zu B]");
        }
        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%#H");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%#{txt}");
        }
        if (!appended) {
          goto LABEL_413;
        }
        goto LABEL_421;
      case 15:
        if ((uint64_t)a2 < 3) {
          goto LABEL_429;
        }
        unsigned int v72 = *a1;
        size_t v71 = (char *)(a1 + 1);
        unsigned int v70 = v72;
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, v71, (unsigned __int8 *)v90, 0);
          if (appended) {
            goto LABEL_421;
          }
        }
        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)v71, v13, (unsigned __int8 *)v90, 0);
          if (appended) {
            goto LABEL_421;
          }
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u", __rev16(v70));
        if (appended) {
          goto LABEL_421;
        }
        int v76 = " ";
        break;
      default:
        if (a3 == 25) {
          goto LABEL_229;
        }
        if (a3 != 28) {
          goto LABEL_422;
        }
        if (a2 != 16) {
          goto LABEL_429;
        }
        uint64_t appended = _AppendIPv6Address((uint64_t)v85, 0, (uint64_t)a1, a6);
        if (appended) {
          goto LABEL_421;
        }
        goto LABEL_413;
    }
    goto LABEL_411;
  }
  switch(a3)
  {
    case ')':
      if (v13 < (unint64_t)a1) {
        goto LABEL_430;
      }
      uint64_t v16 = "";
      while (2)
      {
        if ((unint64_t)a1 >= v13) {
          goto LABEL_413;
        }
        if (v13 - (unint64_t)a1 < 4) {
          goto LABEL_428;
        }
        int v17 = a1 + 2;
        unint64_t v18 = __rev16(a1[1]);
        if (v13 - (unint64_t)(a1 + 2) < v18) {
          goto LABEL_428;
        }
        unsigned int v19 = *a1;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s{", v16);
        if (appended) {
          goto LABEL_421;
        }
        unsigned int v20 = __rev16(v19);
        if (v20 == 12)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "Padding");
        }
        else if (v20 == 15)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "EDE");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "CODE%u");
        }
        if (appended) {
          goto LABEL_421;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, ", ");
        if (appended) {
          goto LABEL_421;
        }
        uint64_t v21 = (unsigned __int16 *)&v17[v18];
        if (v20 != 15 || !v18)
        {
          if (a6)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "[%u B]");
          }
          else if (v20 == 12 && v18 && !*v17 && !memcmp(a1 + 2, (char *)a1 + 5, v18 - 1))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "<%u zero bytes>");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "'%H'");
          }
          goto LABEL_78;
        }
        if (v18 < 2) {
          goto LABEL_428;
        }
        unsigned int v22 = a1[2];
        int v23 = (unsigned __int16)((_WORD)v21 - ((_WORD)a1 + 6));
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        unsigned int v24 = __rev16(v22);
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "code: %u", v24);
        if (appended) {
          goto LABEL_421;
        }
        if (v23 | v24)
        {
          if (v24 <= 0x18)
          {
            int v25 = off_264D07188[v24];
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " (%s)", v25);
            if (appended) {
              goto LABEL_421;
            }
          }
          if (v23)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, ", extra-text: ");
            if (appended) {
              goto LABEL_421;
            }
            if (a6)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_427;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "«REDACTED»");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_427;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "'%.*s'");
            }
LABEL_78:
            if (appended) {
              goto LABEL_421;
            }
          }
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "}");
          a1 = v21;
          uint64_t v16 = ", ";
          if (appended) {
            goto LABEL_421;
          }
          continue;
        }
        goto LABEL_427;
      }
    case '*':
    case ',':
    case '-':
    case '1':
      goto LABEL_422;
    case '+':
      if (a2 < 4) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u %u %u", __rev16(*a1), *((unsigned __int8 *)a1 + 2), *((unsigned __int8 *)a1 + 3));
      if (appended) {
        goto LABEL_421;
      }
      if (a2 == 4) {
        goto LABEL_413;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %.4H", a1 + 2, a2 - 4, a2 - 4);
      if (appended) {
        goto LABEL_421;
      }
      goto LABEL_413;
    case '.':
      uint64_t v82 = 0;
      uint64_t v83 = 0;
      uint64_t v81 = 0;
      if (a2 < 0x13) {
        goto LABEL_429;
      }
      if (DNSRecordTypeValueToString(__rev16(*a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "TYPE%u");
      }
      if (appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %u %u %u", *((unsigned __int8 *)a1 + 2), *((unsigned __int8 *)a1 + 3), bswap32(*((_DWORD *)a1 + 1)));
      if (appended) {
        goto LABEL_421;
      }
      uint64_t v82 = 0;
      uint64_t v83 = 0;
      uint64_t v81 = 0;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_248);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_427;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880, (char *)&v83 + 4, &v83, (char *)&v82 + 4, &v82, (char *)&v81 + 4, &v81);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %u%02u%02u%02u%02u%02u", HIDWORD(v83), v83, HIDWORD(v82), v82, HIDWORD(v81), v81);
      if (appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_248);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_427;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880, (char *)&v83 + 4, &v83, (char *)&v82 + 4, &v82, (char *)&v81 + 4, &v81);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %u%02u%02u%02u%02u%02u", HIDWORD(v83), v83, HIDWORD(v82), v82, HIDWORD(v81), v81);
      if (appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %u", __rev16(a1[8]));
      if (appended) {
        goto LABEL_421;
      }
      uint64_t v87 = (unsigned __int8 *)(a1 + 9);
      uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 18, v13, (unsigned __int8 *)v90, &v87);
      if (appended) {
        goto LABEL_421;
      }
      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)" ", a6, (const char *)v90);
      if (appended) {
        goto LABEL_421;
      }
      unint64_t v88 = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_244);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v87, v13 - (void)v87, 0, &v88, 0);
      if (appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %s", v88);
      }
      else {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561;
      }
      int v52 = v88;
      if (v88) {
LABEL_243:
      }
        free(v52);
LABEL_244:
      if (!CUSymAddr_DataBuffer_Append_sAddr) {
        goto LABEL_413;
      }
      goto LABEL_422;
    case '/':
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v90, &v87);
        if (appended) {
          goto LABEL_421;
        }
      }
      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, (unsigned __int8 *)v90, &v87);
        if (appended) {
          goto LABEL_421;
        }
      }
      if ((unint64_t)v87 >= v13) {
        goto LABEL_429;
      }
      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0, a6, (const char *)v90);
      if (appended) {
        goto LABEL_421;
      }
      size_t v73 = v87;
LABEL_343:
      uint64_t appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v85, v73, v13);
      if (appended) {
        goto LABEL_421;
      }
      goto LABEL_413;
    case '0':
LABEL_229:
      if (a2 < 5) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u %u %u", __rev16(*a1), *((unsigned __int8 *)a1 + 2), *((unsigned __int8 *)a1 + 3));
      if (appended) {
        goto LABEL_421;
      }
      uint64_t v87 = (unsigned __int8 *)(a1 + 2);
      v90[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_244);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v87, v13 - (void)v87, 0, v90, 0);
      if (appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %s", (const char *)v90[0]);
      }
      else {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561;
      }
      int v52 = (char *)v90[0];
      if (v90[0]) {
        goto LABEL_243;
      }
      goto LABEL_244;
    case '2':
      if (a2 < 5) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u %u %u", *(unsigned __int8 *)a1, *((unsigned __int8 *)a1 + 1), __rev16(a1[1]));
      if (appended) {
        goto LABEL_421;
      }
      uint64_t v87 = (unsigned __int8 *)(a1 + 2);
      if ((uint64_t)(a2 - 4) < 1) {
        goto LABEL_429;
      }
      uint64_t v87 = (unsigned __int8 *)a1 + 5;
      unint64_t v53 = *((unsigned __int8 *)a1 + 4);
      if (a2 - 5 < v53) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %.4H", v87, v53, v53);
      if (appended) {
        goto LABEL_421;
      }
      char v54 = &v87[v53];
      uint64_t v87 = v54;
      if ((uint64_t)(v13 - (void)v54) < 1) {
        goto LABEL_429;
      }
      int64_t v55 = v54 + 1;
      uint64_t v87 = v54 + 1;
      unint64_t v56 = *v54;
      if (v13 - (unint64_t)(v54 + 1) < v56) {
        goto LABEL_429;
      }
      if (!*v54) {
        goto LABEL_293;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " ");
      if (appended) {
        goto LABEL_421;
      }
      int64_t v55 = v87;
LABEL_293:
      unsigned int v57 = &v55[v56];
      while (2)
      {
        unint64_t v58 = v57 - v87;
        if (v57 != v87)
        {
          uint64_t v59 = 0;
          switch(v58)
          {
            case 1uLL:
              uint64_t v60 = 0;
              unint64_t v61 = (unint64_t)*v87++ << 32;
              goto LABEL_312;
            case 2uLL:
              uint64_t v66 = 0;
              unint64_t v64 = (unint64_t)v87[1] << 24;
              unint64_t v61 = v64 | ((unint64_t)*v87 << 32);
              v87 += 2;
              goto LABEL_309;
            case 3uLL:
              unsigned __int8 v67 = v87[2];
              unint64_t v64 = ((unint64_t)v67 << 16) | ((unint64_t)v87[1] << 24);
              unint64_t v61 = v64 | ((unint64_t)*v87 << 32);
              v87 += 3;
              BYTE4(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v67 & 0xF)];
              uint64_t v66 = 5;
              goto LABEL_309;
            case 4uLL:
              goto LABEL_298;
            default:
              uint64_t v59 = v87[4];
LABEL_298:
              unint64_t v62 = v87[3];
              unint64_t v63 = v59 | (v62 << 8);
              unint64_t v64 = ((unint64_t)v87[1] << 24) | ((unint64_t)v87[2] << 16) | v63;
              unint64_t v61 = v64 | ((unint64_t)*v87 << 32);
              if (v58 >= 5) {
                uint64_t v65 = 5;
              }
              else {
                uint64_t v65 = v57 - v87;
              }
              v87 += v65;
              if (v58 == 1)
              {
                uint64_t v60 = 0;
              }
              else
              {
                if (v58 == 4)
                {
                  uint64_t v66 = 7;
                }
                else
                {
                  HIBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v59 & 0x1F];
                  uint64_t v66 = 8;
                }
                char v68 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v62 >> 2) & 0x1F];
                BYTE6(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 5) & 0x1F];
                BYTE5(v90[0]) = v68;
                BYTE4(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v64 >> 15) & 0x1F];
LABEL_309:
                BYTE3(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v64 >> 20) & 0x1F];
                BYTE2(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v64 >> 25) & 0x1F];
                if (v66) {
                  uint64_t v60 = v66;
                }
                else {
                  uint64_t v60 = 4;
                }
              }
LABEL_312:
              BYTE1(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v61 >> 30) & 0x1F];
              LOBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v61 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_226);
              }
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_427;
              }
              if (v60) {
                uint64_t v69 = v60;
              }
              else {
                uint64_t v69 = 2;
              }
              uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v85, v90, v69);
              if (CUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_422;
              }
              continue;
          }
        }
        break;
      }
      size_t v73 = v57;
      goto LABEL_343;
    default:
      if ((a3 - 64) < 2)
      {
        if (v13 < (unint64_t)a1)
        {
LABEL_430:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960586;
          goto LABEL_422;
        }
        if (a2 >= 2)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u", __rev16(*a1));
            if (appended) {
              goto LABEL_421;
            }
            unint64_t v88 = (char *)(a1 + 1);
            uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 2, (unint64_t)a1 + a2, (unsigned __int8 *)v90, &v88);
            if (appended) {
              goto LABEL_421;
            }
            uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)" ", a6, (const char *)v90);
            if (appended) {
              goto LABEL_421;
            }
            char v26 = v88;
            if ((unint64_t)v88 >= v13) {
              goto LABEL_413;
            }
            while (2)
            {
              if (v13 - (unint64_t)v26 < 4)
              {
LABEL_428:
                uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960546;
                goto LABEL_422;
              }
              unsigned __int16 v27 = (const char *)__rev16(*(unsigned __int16 *)v26);
              unsigned int v28 = *((unsigned __int16 *)v26 + 1);
              uint64_t v29 = _DNSSVCBKeyToString((int)v27);
              if (v29)
              {
                int v30 = v29;
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  unint64_t v78 = v30;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %s=\"");
                  goto LABEL_108;
                }
              }
              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  unint64_t v78 = v27;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " key%u=\"");
LABEL_108:
                  if (appended) {
                    goto LABEL_421;
                  }
                  int v31 = (const char *)__rev16(v28);
                  uint64_t v32 = (char *)(v26 + 4);
                  unint64_t v88 = (char *)(v26 + 4);
                  if (v13 - (unint64_t)(v26 + 4) >= v31)
                  {
                    switch((int)v27)
                    {
                      case 0:
                        if (v31) {
                          goto LABEL_429;
                        }
                        unint64_t v33 = (unint64_t)&v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        char v34 = 0;
                        char v35 = 1;
                        do
                        {
                          int v36 = (const char *)__rev16(*(unsigned __int16 *)v32);
                          unint64_t v88 = v32 + 2;
                          int v37 = _DNSSVCBKeyToString((int)v36);
                          if ((v35 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s", v34);
                            if (appended) {
                              goto LABEL_421;
                            }
                          }
                          if (v37)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            unint64_t v78 = v37;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s");
                          }
                          else
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            unint64_t v78 = v36;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "key%u");
                          }
                          if (appended) {
                            goto LABEL_421;
                          }
                          char v35 = 0;
                          uint64_t v32 = v88;
                          char v34 = ",";
                        }
                        while ((unint64_t)v88 < v33);
                        goto LABEL_212;
                      case 1:
                        BOOL v38 = (char *)&v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        int v39 = 0;
                        char v40 = 1;
                        while (1)
                        {
                          unint64_t v88 = v32 + 1;
                          unint64_t v41 = *v32;
                          if (v38 - (v32 + 1) < v41) {
                            goto LABEL_429;
                          }
                          ++v32;
                          if ((v40 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s", v39);
                            if (appended) {
                              goto LABEL_421;
                            }
                            uint64_t v32 = v88;
                          }
                          unsigned int v42 = &v32[v41];
                          while (v32 < v42)
                          {
                            unint64_t v43 = (const char *)*v32;
                            if ((v43 - 32) > 0x5E)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_427;
                              }
                              unint64_t v78 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%03d");
                            }
                            else if (v43 == 92 || v43 == 44)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_427;
                              }
                              unint64_t v78 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%c");
                            }
                            else
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_427;
                              }
                              unint64_t v78 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%c");
                            }
                            if (appended) {
                              goto LABEL_421;
                            }
                            uint64_t v32 = ++v88;
                          }
                          char v40 = 0;
                          int v39 = ",";
                          if (v32 >= v38) {
                            goto LABEL_212;
                          }
                        }
                      case 2:
                        goto LABEL_136;
                      case 3:
                        if (v31 != 2) {
                          goto LABEL_429;
                        }
                        unsigned int v44 = *((unsigned __int16 *)v26 + 2);
                        unint64_t v88 = (char *)&v31[(void)v32];
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_427;
                        }
                        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u", __rev16(v44));
                        if (appended) {
                          goto LABEL_421;
                        }
                        goto LABEL_212;
                      case 4:
                        if ((v31 & 3) != 0) {
                          goto LABEL_429;
                        }
                        unsigned __int16 v45 = (char *)&v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        unsigned int v46 = "";
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv4Address((uint64_t)v85, (uint64_t)v46, (unsigned int *)v32, a6);
                          if (CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_422;
                          }
                          uint64_t v32 = v88 + 4;
                          unint64_t v88 = v32;
                          if (v32 < v45)
                          {
                            unsigned int v46 = ",";
                            continue;
                          }
                          goto LABEL_212;
                        }
                      case 5:
                        goto LABEL_132;
                      case 6:
                        if ((v31 & 0xF) != 0) {
                          goto LABEL_429;
                        }
                        uint64_t v47 = (char *)&v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        unsigned __int16 v48 = "";
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv6Address((uint64_t)v85, (uint64_t)v48, (uint64_t)v32, a6);
                          if (CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_422;
                          }
                          uint64_t v32 = v88 + 16;
                          unint64_t v88 = v32;
                          if (v32 < v47)
                          {
                            unsigned __int16 v48 = ",";
                            continue;
                          }
                          goto LABEL_212;
                        }
                      default:
                        if (v27 == 32769)
                        {
LABEL_132:
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_427;
                          }
                          unint64_t v78 = v88;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%.4H");
                        }
                        else
                        {
LABEL_136:
                          if (!a6)
                          {
                            unint64_t v49 = (char *)&v31[(void)v32];
                            while (v32 < v49)
                            {
                              int v50 = (const char *)*v32;
                              if ((v50 - 33) > 0x5D)
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_427;
                                }
                                unint64_t v78 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%03d");
                              }
                              else if ((v50 - 34) > 0x3A {
                                     || ((1 << (v50 - 34)) & 0x4000000020000C1) == 0)
                              }
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_427;
                                }
                                unint64_t v78 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%c");
                              }
                              else
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_427;
                                }
                                unint64_t v78 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%c");
                              }
                              if (appended) {
                                goto LABEL_421;
                              }
                              uint64_t v32 = ++v88;
                            }
                            goto LABEL_212;
                          }
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_427;
                          }
                          unint64_t v78 = v31;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "<%u redacted bytes>");
                        }
                        if (appended) {
                          goto LABEL_421;
                        }
                        unint64_t v88 = (char *)&v31[(void)v88];
LABEL_212:
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_427;
                        }
                        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\"", v78);
                        if (CUSymAddr_DataBuffer_Append_sAddr) {
                          goto LABEL_422;
                        }
                        char v26 = v88;
                        if ((unint64_t)v88 >= v13) {
                          goto LABEL_413;
                        }
                        continue;
                    }
                  }
                  goto LABEL_428;
                }
              }
              break;
            }
          }
LABEL_427:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561;
          goto LABEL_422;
        }
LABEL_429:
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960554;
        goto LABEL_422;
      }
      if (a3 != 33) {
        goto LABEL_422;
      }
      if (a2 < 7) {
        goto LABEL_429;
      }
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, (unsigned __int8 *)v90, 0);
        if (appended) {
          goto LABEL_421;
        }
      }
      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 6, (unint64_t)a1 + a2, (unsigned __int8 *)v90, 0);
        if (appended) {
          goto LABEL_421;
        }
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u %u %u ", __rev16(*a1), __rev16(a1[1]), __rev16(a1[2]));
      if (appended) {
        goto LABEL_421;
      }
      int v76 = 0;
LABEL_411:
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)v76, a6, (const char *)v90);
LABEL_412:
      uint64_t CUSymAddr_DataBuffer_Append_sAddr = CUSymAddr_DataBuffer_AppendF_sAddr;
      if (!CUSymAddr_DataBuffer_AppendF_sAddr)
      {
LABEL_413:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_226);
        }
        if (_GetCUSymAddr_DataBuffer_Append_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v85, "", 1);
          if (appended)
          {
LABEL_421:
            uint64_t CUSymAddr_DataBuffer_Append_sAddr = appended;
            goto LABEL_422;
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_230);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v85, v79, &v84);
            goto LABEL_421;
          }
        }
        goto LABEL_427;
      }
LABEL_422:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_234);
      }
      if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
        _GetCUSymAddr_DataBuffer_Free_sAddr(v85);
      }
      return CUSymAddr_DataBuffer_Append_sAddr;
  }
}

uint64_t _AppendIPv4Address(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  if (a4)
  {
    unsigned int v4 = bswap32(*a3);
    if (v4) {
      BOOL v5 = v4 == 2130706433;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
  }
  else
  {
    int v6 = 0;
  }
  return _AppendIPAddress(a1, a2, (uint64_t)a3, 4, v6);
}

uint64_t _AppendIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (*(void *)a3 | *(void *)(a3 + 7)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = *(unsigned __int8 *)(a3 + 15) > 1u;
    }
    int v5 = v4;
  }
  else
  {
    int v5 = 0;
  }
  return _AppendIPAddress(a1, a2, a3, 16, v5);
}

uint64_t _AppendDomainNameStringEx(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  if (a3 && _NameIsPrivate(a4))
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%~s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  return 4294960561;
}

uint64_t _DNSRecordDataAppendTypeBitMap(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = a3 - (void)a2;
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      if ((unint64_t)v3 < 3) {
        return 4294960554;
      }
      uint64_t v5 = a2[1];
      if ((v5 - 33) < 0xFFFFFFE0) {
        return 4294960554;
      }
      int v6 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < v5) {
        return 4294960554;
      }
      uint64_t v14 = a3 - (void)(a2 + 2);
      uint64_t v15 = a2[1];
      unsigned int v7 = 0;
      unsigned int v8 = 8 * v5;
      int v9 = *a2 << 8;
      if ((8 * v5) <= 1) {
        int v10 = 1;
      }
      else {
        int v10 = 8 * v5;
      }
      BOOL v11 = 1;
      while (1)
      {
        if ((v6[(unint64_t)v7 >> 3] >> (~(_BYTE)v7 & 7)))
        {
          size_t v12 = DNSRecordTypeValueToString(v9 + v7);
          if (!v12)
          {
            size_t v12 = __str;
            snprintf(__str, 0x20uLL, "TYPE%u", v9 + v7);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            return 4294960561;
          }
          uint64_t result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " %s", v12);
          if (result) {
            break;
          }
        }
        BOOL v11 = ++v7 < v8;
        if (v10 == v7)
        {
          v6 += v15;
          uint64_t v3 = a3 - (void)v6;
          goto LABEL_19;
        }
      }
      uint64_t v3 = v14;
      if (v11) {
        return result;
      }
LABEL_19:
      a2 = v6;
      if (v3 > 0) {
        continue;
      }
      break;
    }
  }
  return 0;
}

const char *_DNSSVCBKeyToString(int a1)
{
  uint64_t result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "alpn";
      break;
    case 2:
      uint64_t result = "no-default-alpn";
      break;
    case 3:
      uint64_t result = "port";
      break;
    case 4:
      uint64_t result = "ipv4hint";
      break;
    case 5:
      uint64_t result = "echconfig";
      break;
    case 6:
      uint64_t result = "ipv6hint";
      break;
    case 7:
      uint64_t result = "dohpath";
      break;
    default:
      BOOL v4 = "odohconfig";
      if (a1 != 32769) {
        BOOL v4 = 0;
      }
      if (a1 == 0x8000) {
        uint64_t result = "dohuri";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }
  return result;
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a4 != 16 && a4 != 4) {
    return 4294960553;
  }
  if (!a5)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%.*a");
    }
    return 4294960561;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (!_GetCUSymAddr_SNPrintF_sAddr) {
    return 4294960561;
  }
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%~s");
    }
    return 4294960561;
  }
  return result;
}

uint64_t DNSComputeDNSKeyTag(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    do
    {
      int v4 = *(unsigned __int8 *)(a1 + v2);
      if ((v2 & 1) == 0) {
        v4 <<= 8;
      }
      v3 += v4;
      ++v2;
    }
    while (a2 != v2);
  }
  else
  {
    int v3 = 0;
  }
  return (unsigned __int16)(v3 + HIWORD(v3));
}

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, uint64_t a2, const char *a3)
{
  if (_NameIsPrivate(a3))
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", a3);
    }
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%s");
    }
  }
  return 4294960561;
}

uint64_t DNSMessagePrintObfuscatedIPv4Address(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = bswap32(a3);
  unsigned int v7 = a3;
  if (a3 && a3 != 2130706433) {
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, (uint64_t)&v6, 4);
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (_GetCUSymAddr_SNPrintF_sAddr) {
    return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%#.4a", COERCE_DOUBLE(&v7));
  }
  else {
    return 4294960561;
  }
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a4 != 16 && a4 != 4) {
    return 4294960553;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (!_GetCUSymAddr_SNPrintF_sAddr) {
    return 4294960561;
  }
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", v9);
    }
    return 4294960561;
  }
  return result;
}

uint64_t DNSMessagePrintObfuscatedIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a3 | *(void *)(a3 + 7)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(unsigned __int8 *)(a3 + 15) >= 2u;
  }
  if (v6)
  {
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, a3, 16);
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%.16a", *(double *)&a3);
    }
    else {
      return 4294960561;
    }
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
      BOOL v6 = (unsigned char *)(a1 + 2);
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

_WORD *_dnssd_svcb_extract_values(_WORD *result, unint64_t a2, int a3, uint64_t a4)
{
  unint64_t v4 = a2 - 2;
  if (a2 >= 2)
  {
    if (*result)
    {
      unsigned int v5 = result + 1;
      if (result != (_WORD *)-2 && (_WORD *)((char *)result + a2) > v5)
      {
        unint64_t v8 = result + 1;
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
          BOOL v11 = (_WORD *)((char *)v5 + v10);
          for (i = v4 - v10; i >= 4 && v11 != 0; BOOL v11 = (unsigned __int16 *)((char *)v15 + v14))
          {
            unint64_t v14 = bswap32(v11[1]) >> 16;
            BOOL v9 = i - 4 >= v14;
            unint64_t i = i - 4 - v14;
            if (!v9) {
              break;
            }
            uint64_t v15 = v11 + 2;
            if (a3 == bswap32(*v11) >> 16)
            {
              uint64_t result = (_WORD *)(*(uint64_t (**)(uint64_t, unsigned __int16 *, unint64_t))(a4 + 16))(a4, v11 + 2, v14);
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

uint64_t __dnssd_svcb_get_port_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3 == 2) {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = bswap32(*a2) >> 16;
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

void _mdns_domain_name_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 40) = 0;
  }
}

uint64_t _mdns_domain_name_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  size_t v2 = *(void *)(a1 + 32);
  if (v2 != *(void *)(a2 + 32)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 61) && *(unsigned char *)(a2 + 61)) {
    return memcmp(*(const void **)(a1 + 24), *(const void **)(a2 + 24), v2) == 0;
  }
  return DomainNameEqual(*(unsigned __int8 **)(a1 + 24), *(unsigned __int8 **)(a2 + 24)) != 0;
}

void *_mdns_domain_name_copy_description(void *a1, int a2, int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
    goto LABEL_9;
  }
  uint64_t v8 = (const char *)a1[5];
  if (a3)
  {
    if ((int)DNSMessagePrintObfuscatedString((uint64_t)v11, 64, v8) < 0) {
      uint64_t v8 = "«REDACTED»";
    }
    else {
      uint64_t v8 = v11;
    }
  }
  if (mdns_string_builder_append_formatted(v7, "%s", v8)) {
LABEL_9:
  }
    uint64_t v9 = 0;
  else {
    uint64_t v9 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v9;
}

uint64_t _mdns_domain_name_cf_callback_hash(uint64_t a1)
{
  size_t v2 = (os_unfair_lock_s *)(a1 + 52);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
  if (!*(unsigned char *)(a1 + 60))
  {
    int v3 = -2128831035;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      unsigned int v5 = *(unsigned __int8 **)(a1 + 24);
      do
      {
        int v7 = *v5++;
        unsigned __int8 v6 = v7;
        unsigned __int8 v8 = v7 + 32;
        if ((v7 - 65) < 0x1A) {
          unsigned __int8 v6 = v8;
        }
        int v3 = 16777619 * (v6 ^ v3);
        --v4;
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 56) = v3;
    *(unsigned char *)(a1 + 60) = 1;
  }
  os_unfair_lock_unlock(v2);
  return *(unsigned int *)(a1 + 56);
}

uint64_t _mdns_domain_name_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  return _mdns_domain_name_equal(a1, a2);
}

void *mdns_domain_name_create(char *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  int appended = DomainNameAppendString(v6, a1, 0);
  if (appended)
  {
    uint64_t result = 0;
    if (!a3) {
      return result;
    }
  }
  else
  {
    uint64_t result = mdns_domain_name_create_with_labels(v6, &appended);
    if (!a3) {
      return result;
    }
  }
  *a3 = appended;
  return result;
}

void *mdns_domain_name_create_with_labels(unsigned char *a1, int *a2)
{
  int v8 = 0;
  if (!*a1)
  {
    if (_mdns_domain_name_get_root_s_once != -1) {
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global_487);
    }
    uint64_t v4 = (void *)_mdns_domain_name_get_root_s_root;
    if (_mdns_domain_name_get_root_s_root) {
      goto LABEL_7;
    }
  }
  uint64_t v4 = _mdns_domain_name_create(a1, &v8);
  int v5 = v8;
  if (v8)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
LABEL_7:
    int v5 = 0;
    unsigned __int8 v6 = v4;
    int v8 = 0;
    uint64_t v4 = 0;
  }
  if (a2) {
    *a2 = v5;
  }
  if (v4) {
    os_release(v4);
  }
  return v6;
}

void *_mdns_domain_name_create(unsigned char *a1, int *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)_os_object_alloc();
  int v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = &_mdns_domain_name_kind;
    v4[2] = &_mdns_domain_name_kind;
    do
    {
      uint64_t v7 = (void (*)(void *))v6[2];
      if (v7) {
        v7(v5);
      }
      unsigned __int8 v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    DomainNameDupEx(a1, 0, (unsigned __int8 **)v5 + 3, v5 + 4);
    int v8 = DomainNameToString((unsigned __int8 *)v5[3], 0, (unsigned __int8 *)__s1, 0);
    if (v8)
    {
      int v19 = v8;
      uint64_t v4 = v5;
      int v5 = 0;
    }
    else
    {
      uint64_t v9 = strdup(__s1);
      if (!v9) {
        __break(1u);
      }
      void v5[5] = v9;
      *((_DWORD *)v5 + 13) = 0;
      uint64_t v10 = (unsigned char *)v5[3];
      unsigned int v11 = *v10;
      if (*v10)
      {
        int v12 = 0;
        unint64_t v13 = (unsigned char *)v5[3];
        while (v11 <= 0x3F)
        {
          v13 += v11 + 1;
          if (v13 - v10 > 255) {
            break;
          }
          ++v12;
          unsigned int v11 = *v13;
          if (!*v13) {
            goto LABEL_15;
          }
        }
        int v12 = -1;
      }
      else
      {
        int v12 = 0;
      }
LABEL_15:
      *((_DWORD *)v5 + 12) = v12;
      unint64_t v14 = v5[4];
      if (v14)
      {
        if (*v10 - 65 >= 0x1A)
        {
          uint64_t v16 = 1;
          while (v14 != v16)
          {
            unsigned int v17 = v10[v16++] - 65;
            if (v17 <= 0x19)
            {
              unint64_t v18 = v16 - 1;
              goto LABEL_24;
            }
          }
          unint64_t v18 = v5[4];
LABEL_24:
          BOOL v15 = v18 >= v14;
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 1;
      }
      uint64_t v4 = 0;
      int v19 = 0;
      *((unsigned char *)v5 + 61) = v15;
    }
  }
  else
  {
    int v19 = -6728;
  }
  if (a2) {
    *a2 = v19;
  }
  if (v4) {
    os_release(v4);
  }
  return v5;
}

void *___mdns_domain_name_get_root_block_invoke()
{
  char v1 = 0;
  uint64_t result = _mdns_domain_name_create(&v1, 0);
  *((_DWORD *)result + 2) = 0x7FFFFFFF;
  *((_DWORD *)result + 3) = 0x7FFFFFFF;
  _mdns_domain_name_get_root_s_root = (uint64_t)result;
  return result;
}

uint64_t mdns_domain_name_get_presentation(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

dispatch_queue_t ___mdns_dso_session_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.dso-session-queue", 0);
  _mdns_dso_session_queue_s_queue = (uint64_t)result;
  return result;
}

os_log_t ___mdns_dso_session_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "dso_session");
  _mdns_dso_session_log_s_os_log_t log = (uint64_t)result;
  return result;
}

void __mdns_dso_session_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 184))())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(NSObject **)(v2 + 72);
    if (v3)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 72));
      dispatch_release(v3);
      *(void *)(v2 + 72) = 0;
    }
    *(void *)(v2 + 32) = 0;
    *(void *)(v2 + 104) = 0;
    uint64_t v4 = *(NSObject **)(v2 + 80);
    if (v4)
    {
      nw_connection_cancel(v4);
      int v5 = *(void **)(v2 + 80);
      if (v5)
      {
        nw_release(v5);
        *(void *)(v2 + 80) = 0;
      }
      unsigned __int8 v6 = *(void **)(v2 + 88);
      if (v6)
      {
        free(v6);
        *(void *)(v2 + 88) = 0;
      }
      uint64_t v7 = *(void **)(v2 + 96);
      if (v7)
      {
        free(v7);
        *(void *)(v2 + 96) = 0;
      }
      *(_DWORD *)(v2 + 112) = 0;
    }
    (*(void (**)(uint64_t, void, void, uint64_t, void, void))(*(void *)(v2 + 16) + 176))(v2, 0, 0, 1, 0, 0);
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = (const void *)v8[7];
    if (v9)
    {
      _Block_release(v9);
      void v8[7] = 0;
    }
    uint64_t v10 = (const void *)v8[8];
    if (v10)
    {
      _Block_release(v10);
      void v8[8] = 0;
    }
    (*(void (**)(void *))(v8[2] + 192))(v8);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24);
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (!v12 && (!*__error() || *__error())) {
    __uint64_t v12 = 1;
  }
  unint64_t v13 = (v12 - v11) / 0xF4240;
  if (__ROR8__(0x790FB65668C26139 * v13, 6) <= 0x10C6F7A0B5EDuLL) {
    int64_t v14 = (v12 - v11) / 0xF4240;
  }
  else {
    int64_t v14 = v13 + 1;
  }
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_574);
  }
  BOOL v15 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40);
    int v17 = 134218496;
    uint64_t v18 = v16;
    __int16 v19 = 2048;
    unint64_t v20 = (unint64_t)((unsigned __int128)(v14 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 7;
    __int16 v21 = 2048;
    unint64_t v22 = v14 - 1000 * v20;
    _os_log_impl(&dword_23814D000, v15, OS_LOG_TYPE_DEFAULT, "[DSO%llu] DSO session invalidated -- duration: %{mdns:time_duration}lld %lldms", (uint8_t *)&v17, 0x20u);
  }
  os_release(*(void **)(a1 + 32));
}

void _mdns_extended_dns_error_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

void *_mdns_extended_dns_error_copy_description(uint64_t a1, int a2, int a3)
{
  unsigned __int8 v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v7, "code: %u", *(unsigned __int16 *)(a1 + 32))|| (v9 = *(unsigned __int16 *)(a1 + 32), v9 <= 0x18)&& mdns_string_builder_append_formatted(v7, " (%s)", off_264D07188[v9])|| mdns_string_builder_append_formatted(v7, ", extra-text: ")|| (!a3? ((uint64_t v11 = *(void **)(a1 + 24)) == 0 || !xpc_string_get_string_ptr(v11)? (appended = mdns_string_builder_append_formatted(v7, "«EXTRA TEXT»")): (appended = mdns_string_builder_append_formatted(v7, "'%s'"))): (appended = mdns_string_builder_append_formatted(v7, "«REDACTED»", v13)), appended))
  {
    int v8 = 0;
  }
  else
  {
    int v8 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v8;
}

xpc_object_t ___mdns_copy_empty_string_block_invoke()
{
  xpc_object_t result = xpc_string_create("");
  _mdns_copy_empty_string_s_empty_string = (uint64_t)result;
  return result;
}

size_t mdns_snprintf_add(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    uint64_t v10 = *a1;
  }
  else {
    uint64_t v10 = 0;
  }
  if (a1) {
    size_t v11 = a2 - (void)v10;
  }
  else {
    size_t v11 = 0;
  }
  size_t v12 = vsnprintf(v10, v11, a3, &a9);
  size_t v13 = v12;
  if (a1 && v11 && (v12 & 0x80000000) == 0)
  {
    if (v11 <= v12) {
      size_t v12 = strlen(v10);
    }
    else {
      size_t v12 = v12;
    }
    *a1 = &v10[v12];
  }
  return v13;
}

void mdns_replace_string(void **a1, char *__s1)
{
  if (__s1)
  {
    int v3 = strdup(__s1);
    if (v3) {
      goto LABEL_5;
    }
    __break(1u);
  }
  int v3 = 0;
LABEL_5:
  if (*a1) {
    free(*a1);
  }
  *a1 = v3;
}

char *mdns_cfstring_to_utf8_cstring(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    char v1 = strdup(CStringPtr);
    if (!v1)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
  }
  else
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    if (MaximumSizeForEncoding == -1) {
      goto LABEL_9;
    }
    unsigned __int8 v6 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xA172743EuLL);
    if (!v6) {
      goto LABEL_9;
    }
    char v1 = (char *)v6;
    CFIndex usedBufLen = 0;
    v9.location = 0;
    v9.length = Length;
    if (CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, v6, MaximumSizeForEncoding, &usedBufLen) != Length)
    {
LABEL_10:
      free(v1);
      return 0;
    }
    v1[usedBufLen] = 0;
  }
  return v1;
}

uint64_t __Block_byref_object_copy__719(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__720(uint64_t a1)
{
}

void __http_task_create_dns_query_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v18 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (v8) {
      goto LABEL_5;
    }
LABEL_10:
    size_t v12 = getHeuristicsQueue();
    dispatch_async(v12, &__block_literal_global_275);
    goto LABEL_17;
  }
  if (!v8)
  {
    nw_activity_complete_with_reason();
    goto LABEL_10;
  }
  nw_activity_complete_with_reason();
LABEL_5:
  CFRange v9 = [v8 domain];
  uint64_t v10 = *MEMORY[0x263F08570];
  if ([v9 isEqualToString:*MEMORY[0x263F08570]]) {
    BOOL v11 = [v8 code] == -999 || [v8 code] == -1009;
  }
  else {
    BOOL v11 = 0;
  }

  size_t v13 = [v8 domain];
  if ([v13 isEqualToString:v10]) {
    BOOL v14 = [v8 code] == -1001;
  }
  else {
    BOOL v14 = 0;
  }

  if (v11) {
    goto LABEL_18;
  }
  id v15 = [*(id *)(a1 + 32) URL];
  uint64_t v16 = getHeuristicsQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __dns_heuristics_report_resolution_failure_block_invoke;
  block[3] = &unk_264D068B0;
  id v20 = v15;
  BOOL v21 = v14;
  size_t v12 = v15;
  dispatch_async(v16, block);

LABEL_17:
LABEL_18:
  [v7 statusCode];
  int v17 = (void *)[v18 _createDispatchData];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id _http_task_create_data_task(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v8 = 0;
  CFRange v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__719;
  size_t v12 = __Block_byref_object_dispose__720;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = ___http_task_create_data_task_block_invoke;
  v7[3] = &unk_264D07718;
  v7[5] = v4;
  void v7[6] = &v8;
  v7[4] = v3;
  _http_task_shared_session_critical_region(v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_2381694E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___http_task_create_data_task_block_invoke(void *a1)
{
  uint64_t v2 = (void *)g_shared_session;
  if (!g_shared_session)
  {
    if (_http_task_create_shared_session_s_once != -1) {
      dispatch_once(&_http_task_create_shared_session_s_once, &__block_literal_global_146);
    }
    id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v3 setHTTPCookieStorage:0];
    [v3 setURLCache:0];
    [v3 setURLCredentialStorage:0];
    id v4 = +[NSSet setWithObjects:@"User-Agent", @"Accept-Language", 0];
    [v3 set_suppressedAutoAddedHTTPHeaders:v4];

    [v3 set_allowsTLSSessionTickets:1];
    [v3 set_allowsTCPFastOpen:1];
    [v3 set_disableAPWakeOnIdleConnections:1];
    id v5 = objc_alloc_init((Class)&off_26EB24F00);
    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
    }
    id v6 = (id)_mdns_resolver_queue_s_queue;
    [v5 setUnderlyingQueue:v6];

    uint64_t v7 = +[NSURLSession sessionWithConfiguration:v3 delegate:_http_task_create_shared_session_delegate delegateQueue:v5];

    uint64_t v8 = (void *)g_shared_session;
    g_shared_session = v7;

    uint64_t v2 = (void *)g_shared_session;
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = [v2 dataTaskWithRequest:a1[4] completionHandler:a1[5]];

  return MEMORY[0x270F9A758]();
}

void _http_task_shared_session_critical_region(void *a1)
{
  char v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_http_task_shared_session_critical_region_s_lock);
  v1[2](v1);

  os_unfair_lock_unlock((os_unfair_lock_t)&_http_task_shared_session_critical_region_s_lock);
}

uint64_t ___http_task_create_shared_session_block_invoke()
{
  +[NSURLSession _disableAppSSO];
  +[NSURLSession _disableATS];
  _http_task_create_shared_session_delegate = objc_alloc_init(MDNSHTTPSessionDelegate);

  return MEMORY[0x270F9A758]();
}

void *http_task_create_pvd_query(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  CFRange v9 = (void *)MEMORY[0x23EC893C0]();
  uint64_t v10 = +[NSString stringWithFormat:@"https://%s/.well-known/pvd%s", a2, a3];
  id v11 = objc_alloc((Class)&off_26EB202A8);
  size_t v12 = (void *)[objc_alloc((Class)&off_26EB204B8) initWithString:v10];
  id v13 = (void *)[v11 initWithURL:v12];

  [v13 setHTTPMethod:@"GET"];
  [v13 setValue:@"application/pvd+json" forHTTPHeaderField:@"accept"];
  [v13 setValue:@"application/pvd+json" forHTTPHeaderField:@"content-type"];
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__719;
  unsigned __int16 v27 = __Block_byref_object_dispose__720;
  id v28 = (id)nw_activity_create();
  if (v24[5]) {
    nw_activity_activate();
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __http_task_create_pvd_query_block_invoke;
  v19[3] = &unk_264D073C0;
  id v14 = v7;
  id v20 = v14;
  unint64_t v22 = &v23;
  id v15 = v8;
  id v21 = v15;
  uint64_t v16 = _http_task_create_data_task(v13, v19);
  if (v16 && v24[5])
  {
    int v17 = (void *)nw_activity_create();
    [v16 set_nw_activity:v17];
  }
  _Block_object_dispose(&v23, 8);

  return v16;
}

void sub_2381699A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __http_task_create_pvd_query_block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __http_task_create_pvd_query_block_invoke_2;
  block[3] = &unk_264D07718;
  void block[4] = a2;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v8 = v6;
  id v5 = a2;
  dispatch_async(v3, block);
}

void __http_task_create_pvd_query_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v12 = +[NSJSONSerialization JSONObjectWithData:v2 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      id v4 = [v12 objectForKeyedSubscript:@"expires"];
      id v5 = [v12 objectForKeyedSubscript:@"seconds-remaining"];
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || v5)
        {
          if (v5) {
            xpc_dictionary_set_uint64(v3, "seconds-remaining", [v5 unsignedLongLongValue]);
          }
        }
        else
        {
          id v6 = objc_alloc_init((Class)&off_26EB23DE0);
          id v7 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
          [v6 setTimeZone:v7];

          long long v8 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
          [v6 setLocale:v8];

          [v6 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
          [v6 setFormatterBehavior:0];
          CFRange v9 = [v6 dateFromString:v4];
          [v9 timeIntervalSinceNow];
          xpc_dictionary_set_uint64(v3, "seconds-remaining", (unint64_t)v10);
        }
      }
      nw_activity_complete_with_reason();
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      nw_activity_complete_with_reason();
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    nw_activity_complete_with_reason();
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v11();
  }
}

void http_task_cancel(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x23EC893C0]();
  [a1 cancel];
}

void __http_task_prepare_for_system_sleep_block_invoke()
{
  if (g_shared_session)
  {
    [(id)g_shared_session invalidateAndCancel];
    uint64_t v0 = (void *)g_shared_session;
    g_shared_session = 0;
  }
}

void _mdns_interface_monitor_finalize(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    dispatch_release(v2);
    a1[4] = 0;
  }
  id v3 = (void *)a1[5];
  if (v3)
  {
    nw_release(v3);
    a1[5] = 0;
  }
  id v4 = (const void *)a1[8];
  if (v4)
  {
    _Block_release(v4);
    a1[8] = 0;
  }
  id v5 = (const void *)a1[9];
  if (v5)
  {
    _Block_release(v5);
    a1[9] = 0;
  }
  id v6 = (void *)a1[10];
  if (v6)
  {
    free(v6);
    a1[10] = 0;
  }
  id v7 = (void *)a1[15];
  if (v7)
  {
    nw_release(v7);
    a1[15] = 0;
  }
  long long v8 = (void *)a1[16];
  if (v8)
  {
    nw_release(v8);
    a1[16] = 0;
  }

  _mdns_interface_monitor_forget_signatures((uint64_t)a1);
}

void _mdns_interface_monitor_forget_signatures(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 88);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 88) = 0;
  }
  *(void *)(a1 + 96) = 0;
  id v3 = *(void **)(a1 + 104);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 104) = 0;
  }
  *(void *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 152) = 0;
}

char *_mdns_interface_monitor_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v20 = __s1;
  __s1[0] = 0;
  if (!a2
    || (mdns_snprintf_add(&v20, (uint64_t)&v22, "<%s: %p>: ", a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 16) + 8)) & 0x80000000) == 0)
  {
    if (*(_DWORD *)(a1 + 136))
    {
      name = *(NSObject **)(a1 + 80);
    }
    else
    {
      name = *(NSObject **)(a1 + 128);
      if (name) {
        name = nw_interface_get_name(name);
      }
    }
    double v10 = "";
    if (name) {
      LOBYTE(v10) = (_BYTE)name;
    }
    if ((mdns_snprintf_add(&v20, (uint64_t)&v22, "interface %s/%u: ", a4, a5, a6, a7, a8, (char)v10) & 0x80000000) == 0)
    {
      uint64_t v16 = 0;
      int v17 = "";
      while (1)
      {
        if (((uint64_t)(&off_264D07460)[v16 + 1] & *(_DWORD *)(a1 + 144)) != 0)
        {
          int v18 = mdns_snprintf_add(&v20, (uint64_t)&v22, "%s%s", v11, v12, v13, v14, v15, (char)v17);
          int v17 = ", ";
          if (v18 < 0) {
            break;
          }
        }
        v16 += 2;
        if (v16 == 14)
        {
          xpc_object_t result = strdup(__s1);
          if (!result) {
            __break(1u);
          }
          return result;
        }
      }
    }
  }
  return 0;
}

uint64_t mdns_interface_monitor_create(unsigned int a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = _os_object_alloc();
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  id v4 = &_mdns_interface_monitor_kind;
  *(void *)(v2 + 16) = &_mdns_interface_monitor_kind;
  do
  {
    id v5 = (void (*)(uint64_t))v4[2];
    if (v5) {
      v5(v3);
    }
    id v4 = (_UNKNOWN **)*v4;
  }
  while (v4);
  *(_DWORD *)(v3 + 148) = 0;
  *(_DWORD *)(v3 + 136) = a1;
  if (a1)
  {
    id v6 = mdns_system_interface_index_to_name(a1);
    *(void *)(v3 + 80) = v6;
    if (v6)
    {
      uint64_t v7 = nw_interface_create_with_index();
      if (v7)
      {
        long long v8 = v7;
        CFRange v9 = nw_parameters_create();
        if (v9)
        {
          double v10 = v9;
          nw_parameters_require_interface(v9, v8);
          evaluator_for_nw_endpoint_t endpoint = nw_path_create_evaluator_for_endpoint();
          *(void *)(v3 + 40) = evaluator_for_endpoint;
          if (evaluator_for_endpoint)
          {
            uint64_t v12 = nw_path_evaluator_copy_path();
            if (v12)
            {
              uint64_t v13 = v12;
LABEL_13:
              *(_DWORD *)(v3 + 140) = _mdns_get_interface_flags_from_nw_path(v13, 0);
              goto LABEL_21;
            }
            if (_mdns_ifmon_log_s_once != -1) {
              dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
            }
            __int16 v19 = _mdns_ifmon_log_s_log;
            if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
            {
LABEL_46:
              os_release((void *)v3);
              uint64_t v3 = 0;
              uint64_t v13 = 0;
              if (!v8) {
                goto LABEL_23;
              }
              goto LABEL_22;
            }
            *(_WORD *)long long buf = 0;
            id v20 = "Failed to copy path from path evaluator";
          }
          else
          {
            if (_mdns_ifmon_log_s_once != -1) {
              dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
            }
            __int16 v19 = _mdns_ifmon_log_s_log;
            if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR)) {
              goto LABEL_46;
            }
            *(_WORD *)long long buf = 0;
            id v20 = "Failed to create path evaluator";
          }
          _os_log_error_impl(&dword_23814D000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
          goto LABEL_46;
        }
        if (_mdns_ifmon_log_s_once != -1) {
          dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
        }
        int v18 = _mdns_ifmon_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_23814D000, v18, OS_LOG_TYPE_ERROR, "Failed to create params", buf, 2u);
        }
        double v10 = 0;
        goto LABEL_46;
      }
      if (_mdns_ifmon_log_s_once != -1) {
        dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
      }
      int v17 = _mdns_ifmon_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
      {
        int v21 = *(_DWORD *)(v3 + 136);
        *(_DWORD *)long long buf = 67109120;
        int v24 = v21;
        _os_log_error_impl(&dword_23814D000, v17, OS_LOG_TYPE_ERROR, "Failed to create interface for index %u", buf, 8u);
      }
    }
    double v10 = 0;
    long long v8 = 0;
    goto LABEL_46;
  }
  long long v8 = nw_path_create_evaluator_for_endpoint();
  if (v8)
  {
    uint64_t v13 = nw_path_evaluator_copy_path();
    nw_release(v8);
    if (v13)
    {
      uint64_t v14 = nw_path_copy_interface();
      long long v8 = v14;
      if (v14)
      {
        *(void *)(v3 + 120) = v14;
        nw_retain(v14);
        uint64_t v15 = *(void **)(v3 + 120);
        *(void *)(v3 + 128) = v15;
        nw_retain(v15);
        nw_release(v8);
        double v10 = 0;
        long long v8 = 0;
      }
      else
      {
        double v10 = 0;
      }
      goto LABEL_13;
    }
    long long v8 = 0;
  }
  else
  {
    uint64_t v13 = 0;
  }
  double v10 = 0;
LABEL_21:
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 0x40000000;
  v22[2] = __mdns_interface_monitor_create_block_invoke;
  v22[3] = &__block_descriptor_tmp_769;
  v22[4] = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  __mdns_interface_monitor_create_block_invoke((uint64_t)v22);
  os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  *(_DWORD *)(v3 + 144) = *(_DWORD *)(v3 + 140);
  if (v8) {
LABEL_22:
  }
    nw_release(v8);
LABEL_23:
  if (v10) {
    nw_release(v10);
  }
  if (v13) {
    nw_release(v13);
  }
  return v3;
}

uint64_t _mdns_get_interface_flags_from_nw_path(NSObject *a1, int a2)
{
  unsigned int v3 = a2 & 0xFFFFFFF0 | nw_path_has_ipv4(a1);
  if (nw_path_has_ipv6(a1)) {
    v3 |= 2u;
  }
  if (nw_path_is_expensive(a1)) {
    v3 |= 4u;
  }
  if (nw_path_is_constrained(a1)) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

uint64_t __mdns_interface_monitor_create_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 136))
  {
    name = *(const char **)(v2 + 80);
  }
  else
  {
    id v4 = *(NSObject **)(v2 + 120);
    if (!v4)
    {
LABEL_10:
      uint64_t ifstate = 0;
      goto LABEL_11;
    }
    name = nw_interface_get_name(v4);
  }
  if (name) {
    BOOL v5 = g_nwi_state == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_10;
  }
  uint64_t ifstate = nwi_state_get_ifstate();
LABEL_11:
  _mdns_interface_monitor_update_signatures_from_nwi_state(*(void *)(a1 + 32), ifstate);
  uint64_t result = _mdns_get_interface_flags_from_nwi_state(ifstate, *(_DWORD *)(*(void *)(a1 + 32) + 140));
  *(_DWORD *)(*(void *)(a1 + 32) + 140) = result;
  return result;
}

uint64_t _mdns_interface_monitor_update_signatures_from_nwi_state(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v20 = 0;
  if (a2)
  {
    signature = (void *)nwi_ifstate_get_signature();
    int v5 = v20;
  }
  else
  {
    int v5 = 0;
    signature = 0;
  }
  int updated = _mdns_interface_monitor_update_signature((const void **)(a1 + 88), (void *)(a1 + 96), (char *)(a1 + 152), signature, v5 & ~(v5 >> 31));
  int v20 = 0;
  if (a2)
  {
    uint64_t v7 = (void *)nwi_ifstate_get_signature();
    int v8 = v20;
  }
  else
  {
    int v8 = 0;
    uint64_t v7 = 0;
  }
  CFRange v9 = (unsigned char *)(a1 + 153);
  unsigned int v10 = _mdns_interface_monitor_update_signature((const void **)(a1 + 104), (void *)(a1 + 112), (char *)(a1 + 153), v7, v8 & ~(v8 >> 31));
  if (updated & v10)
  {
    uint64_t v11 = 1;
  }
  else if (updated)
  {
    uint64_t v11 = (v10 & 1) == 0 && *v9 == 0;
  }
  else if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = v10;
  }
  if (_mdns_ifmon_log_s_once != -1) {
    dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
  }
  uint64_t v12 = _mdns_ifmon_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(const char **)(a1 + 80);
    if (!v14) {
      uint64_t v14 = "";
    }
    int v15 = *(unsigned __int8 *)(a1 + 152);
    if (*(unsigned char *)(a1 + 152)) {
      int v15 = *(_DWORD *)(a1 + 96);
    }
    int v16 = *(_DWORD *)(a1 + 136);
    uint64_t v17 = *(void *)(a1 + 88);
    int v18 = *v9;
    if (*v9) {
      int v18 = *(_DWORD *)(a1 + 112);
    }
    uint64_t v19 = *(void *)(a1 + 104);
    int v20 = 136447746;
    int v21 = v14;
    __int16 v22 = 1024;
    int v23 = v16;
    __int16 v24 = 1040;
    int v25 = v15;
    __int16 v26 = 2096;
    uint64_t v27 = v17;
    __int16 v28 = 1040;
    int v29 = v18;
    __int16 v30 = 2096;
    uint64_t v31 = v19;
    __int16 v32 = 1024;
    int v33 = v11;
    _os_log_debug_impl(&dword_23814D000, v12, OS_LOG_TYPE_DEBUG, "Signature update -- interface: %{public}s/%u, IPv4: %{mdns:base64}.*P, IPv6: %{mdns:base64}.*P, network changed: %{mdns:yesno}d", (uint8_t *)&v20, 0x38u);
  }
  return v11;
}

uint64_t _mdns_get_interface_flags_from_nwi_state(uint64_t a1, int a2)
{
  uint64_t v2 = a2 & 0xFFFFFFCF;
  if (a1)
  {
    LODWORD(v2) = (nwi_ifstate_get_flags() >> 2) & 0x10 | v2;
    if (nwi_ifstate_get_vpn_server()) {
      return v2 | 0x20;
    }
    else {
      return v2;
    }
  }
  return v2;
}

uint64_t _mdns_interface_monitor_update_signature(const void **a1, void *a2, char *a3, void *__s2, size_t __n)
{
  if (!__n)
  {
    char v13 = 0;
    if (*a3) {
      goto LABEL_10;
    }
    return 0;
  }
  unsigned int v10 = (void *)*a1;
  if (*a2 == __n && !memcmp(*a1, __s2, __n))
  {
    if (!*a3) {
      goto LABEL_8;
    }
    return 0;
  }
  if (v10)
  {
    free(v10);
    *a1 = 0;
  }
  *a2 = 0;
  uint64_t result = (uint64_t)malloc_type_malloc(__n, 0xA172743EuLL);
  if (result)
  {
    uint64_t v12 = result;
    memcpy((void *)result, __s2, __n);
    *a1 = (const void *)v12;
    *a2 = __n;
LABEL_8:
    char v13 = 1;
LABEL_10:
    *a3 = v13;
    return 1;
  }
  __break(1u);
  return result;
}

os_log_t ___mdns_ifmon_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "interface_monitor");
  _mdns_ifmon_log_s_os_log_t log = (uint64_t)result;
  return result;
}

void mdns_interface_monitor_activate(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 154))
  {
    if (*(void *)(a1 + 32)) {
      _mdns_interface_monitor_activate_async((void *)a1);
    }
    *(unsigned char *)(a1 + 154) = 1;
  }
}

void _mdns_interface_monitor_activate_async(void *a1)
{
  os_retain(a1);
  if (_mdns_internal_queue_s_once != -1) {
    dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_8);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___mdns_interface_monitor_activate_async_block_invoke;
  block[3] = &__block_descriptor_tmp_22_778;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_internal_queue_s_queue, block);
}

void ___mdns_interface_monitor_activate_async_block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 155) || *(unsigned char *)(v2 + 156)) {
    goto LABEL_68;
  }
  *(unsigned char *)(v2 + 155) = 1;
  if (!_mdns_start_interface_availability_monitoring_s_store)
  {
    SCDynamicStoreRef v3 = SCDynamicStoreCreate(0, @"com.apple.mdns.interface-monitor", (SCDynamicStoreCallBack)_mdns_store_changed, 0);
    if (v3) {
      goto LABEL_7;
    }
    if (SCError())
    {
      int v4 = SCError();
      if (!v4)
      {
LABEL_7:
        CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, (CFStringRef)*MEMORY[0x263F1BC10]);
        if (NetworkInterface) {
          goto LABEL_10;
        }
        if (SCError())
        {
          int v6 = SCError();
          if (!v6)
          {
LABEL_10:
            values[0] = (void *)NetworkInterface;
            CFArrayRef v7 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
            if (v7)
            {
              CFArrayRef v8 = v7;
              if (!SCDynamicStoreSetNotificationKeys(v3, v7, 0))
              {
                if (SCError())
                {
                  int v9 = SCError();
                  if (!v9) {
                    goto LABEL_14;
                  }
                  int v15 = v9;
                }
                else
                {
                  int v15 = -6700;
                }
                if (_mdns_ifmon_log_s_once != -1) {
                  dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
                }
                int v16 = _mdns_ifmon_log_s_log;
                if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
                {
LABEL_40:
                  if (!v3) {
                    goto LABEL_42;
                  }
LABEL_41:
                  CFRelease(v3);
                  goto LABEL_42;
                }
                LODWORD(buf) = 134217984;
                *(void *)((char *)&buf + 4) = v15;
                uint64_t v17 = "Failed to set notification keys for interface availability monitoring: %{mdns:err}ld";
LABEL_72:
                _os_log_error_impl(&dword_23814D000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&buf, 0xCu);
                if (!v3) {
                  goto LABEL_42;
                }
                goto LABEL_41;
              }
LABEL_14:
              if (_mdns_internal_queue_s_once != -1) {
                dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_8);
              }
              if (SCDynamicStoreSetDispatchQueue(v3, (dispatch_queue_t)_mdns_internal_queue_s_queue)) {
                goto LABEL_19;
              }
              if (SCError())
              {
                int v10 = SCError();
                if (!v10)
                {
LABEL_19:
                  _mdns_start_interface_availability_monitoring_s_store = (uint64_t)v3;
LABEL_42:
                  if (NetworkInterface) {
                    CFRelease(NetworkInterface);
                  }
                  if (v8) {
                    CFRelease(v8);
                  }
                  goto LABEL_46;
                }
                int v18 = v10;
              }
              else
              {
                int v18 = -6700;
              }
              if (_mdns_ifmon_log_s_once != -1) {
                dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
              }
              int v16 = _mdns_ifmon_log_s_log;
              if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR)) {
                goto LABEL_40;
              }
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v18;
              uint64_t v17 = "Failed to set dispatch queue for interface availability monitoring: %{mdns:err}ld";
              goto LABEL_72;
            }
            if (_mdns_ifmon_log_s_once != -1) {
              dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
            }
            uint64_t v36 = _mdns_ifmon_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              int v33 = "Failed to create notification keys array for interface availability monitoring";
              uint64_t v34 = v36;
              uint32_t v35 = 2;
              goto LABEL_70;
            }
            goto LABEL_29;
          }
          int v13 = v6;
        }
        else
        {
          int v13 = -6700;
        }
        if (_mdns_ifmon_log_s_once != -1) {
          dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
        }
        uint64_t v14 = _mdns_ifmon_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v13;
          int v33 = "Failed to create interfaces state key for interface availability monitoring: %{mdns:err}ld";
          uint64_t v34 = v14;
          uint32_t v35 = 12;
LABEL_70:
          _os_log_error_impl(&dword_23814D000, v34, OS_LOG_TYPE_ERROR, v33, (uint8_t *)&buf, v35);
        }
LABEL_29:
        CFArrayRef v8 = 0;
        if (!v3) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      int v11 = v4;
    }
    else
    {
      int v11 = -6700;
    }
    if (_mdns_ifmon_log_s_once != -1) {
      dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
    }
    uint64_t v12 = _mdns_ifmon_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_error_impl(&dword_23814D000, v12, OS_LOG_TYPE_ERROR, "Failed to create store for interface availability monitoring: %{mdns:err}ld", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_46:
  dispatch_source_t v19 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, *(dispatch_queue_t *)(v2 + 32));
  *(void *)(v2 + 56) = v19;
  if (!v19)
  {
LABEL_82:
    _mdns_interface_monitor_terminate((void *)v2, -6729);
    goto LABEL_68;
  }
  os_retain((void *)v2);
  int v20 = *(NSObject **)(v2 + 56);
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 0x40000000;
  unsigned int v42 = ___mdns_interface_monitor_activate_internal_block_invoke;
  unint64_t v43 = &__block_descriptor_tmp_23_785;
  uint64_t v44 = v2;
  dispatch_source_set_event_handler(v20, &buf);
  int v21 = *(NSObject **)(v2 + 56);
  values[0] = (void *)MEMORY[0x263EF8330];
  values[1] = (void *)0x40000000;
  values[2] = ___mdns_interface_monitor_activate_internal_block_invoke_2;
  values[3] = &__block_descriptor_tmp_24_786;
  values[4] = (void *)v2;
  dispatch_source_set_cancel_handler(v21, values);
  dispatch_activate(*(dispatch_object_t *)(v2 + 56));
  if (*(void *)(v2 + 40))
  {
    os_retain((void *)v2);
    if (_mdns_internal_queue_s_once != -1) {
      dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_8);
    }
    update_handler[10] = MEMORY[0x263EF8330];
    update_handler[11] = 0x40000000;
    update_handler[12] = ___mdns_interface_monitor_activate_internal_block_invoke_3;
    update_handler[13] = &__block_descriptor_tmp_26_787;
    update_handler[14] = v2;
    nw_path_evaluator_set_update_handler();
    update_void handler[5] = MEMORY[0x263EF8330];
    update_handler[6] = 0x40000000;
    update_handler[7] = ___mdns_interface_monitor_activate_internal_block_invoke_4;
    update_handler[8] = &__block_descriptor_tmp_27_788;
    update_handler[9] = v2;
    nw_path_evaluator_set_cancel_handler();
    nw_path_evaluator_start();
    *(unsigned char *)(v2 + 157) = 1;
  }
  if (*(_DWORD *)(v2 + 136)) {
    goto LABEL_56;
  }
  nw_path_monitor_t v22 = nw_path_monitor_create();
  *(void *)(v2 + 48) = v22;
  if (!v22)
  {
    if (_mdns_ifmon_log_s_once != -1) {
      dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
    }
    int v37 = _mdns_ifmon_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(update_handler[0]) = 0;
      _os_log_error_impl(&dword_23814D000, v37, OS_LOG_TYPE_ERROR, "Failed to create path monitor", (uint8_t *)update_handler, 2u);
    }
    goto LABEL_82;
  }
  int v23 = v22;
  if (_mdns_internal_queue_s_once != -1) {
    dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_8);
  }
  nw_path_monitor_set_queue(v23, (dispatch_queue_t)_mdns_internal_queue_s_queue);
  os_retain((void *)v2);
  __int16 v24 = *(NSObject **)(v2 + 48);
  update_handler[0] = MEMORY[0x263EF8330];
  update_handler[1] = 0x40000000;
  update_handler[2] = ___mdns_interface_monitor_activate_internal_block_invoke_28;
  update_handler[3] = &__block_descriptor_tmp_29_790;
  update_handler[4] = v2;
  nw_path_monitor_set_update_handler(v24, update_handler);
  int v25 = *(NSObject **)(v2 + 48);
  cancel_handler[0] = MEMORY[0x263EF8330];
  cancel_handler[1] = 0x40000000;
  cancel_handler[2] = ___mdns_interface_monitor_activate_internal_block_invoke_2_30;
  cancel_handler[3] = &__block_descriptor_tmp_31;
  cancel_handler[4] = v2;
  nw_path_monitor_set_cancel_handler(v25, cancel_handler);
  nw_path_monitor_start(*(nw_path_monitor_t *)(v2 + 48));
  *(unsigned char *)(v2 + 157) = 1;
LABEL_56:
  __int16 v26 = &g_monitor_list;
  do
  {
    uint64_t v27 = v26;
    uint64_t v28 = *v26;
    __int16 v26 = (uint64_t *)(*v26 + 24);
  }
  while (v28);
  os_retain((void *)v2);
  *uint64_t v27 = v2;
  if (_mdns_start_nwi_state_monitoring_s_nwi_notify_token == -1)
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    if (_mdns_internal_queue_s_once != -1) {
      dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_8);
    }
    uint32_t v30 = notify_register_dispatch(notify_key, &_mdns_start_nwi_state_monitoring_s_nwi_notify_token, (dispatch_queue_t)_mdns_internal_queue_s_queue, &__block_literal_global_39);
    if (_mdns_start_nwi_state_monitoring_s_nwi_notify_token == -1)
    {
      uint32_t v31 = v30;
      if (_mdns_nwi_log_s_once != -1) {
        dispatch_once(&_mdns_nwi_log_s_once, &__block_literal_global_43_791);
      }
      __int16 v32 = _mdns_nwi_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_nwi_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unsigned __int16 v45 = 67109120;
        uint32_t v46 = v31;
        _os_log_error_impl(&dword_23814D000, v32, OS_LOG_TYPE_ERROR, "Failed to register for NWI state notifications (status %u)", v45, 8u);
      }
    }
    else
    {
      _mdns_nwi_state_update();
    }
  }
  _mdns_interface_monitor_check_nwi_state_for_updates(v2);
LABEL_68:
  os_release(*(void **)(a1 + 32));
}

void ___mdns_interface_monitor_activate_internal_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2000000000;
  int v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000;
  char v19 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  void v11[2] = ___mdns_interface_monitor_update_block_invoke;
  void v11[3] = &unk_264D075D8;
  void v11[4] = &v20;
  void v11[5] = &v16;
  v11[6] = &v12;
  v11[7] = v2;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 148));
  ___mdns_interface_monitor_update_block_invoke(v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 148));
  unsigned int v3 = *(_DWORD *)(v2 + 144);
  int v4 = *((_DWORD *)v21 + 6);
  *(_DWORD *)(v2 + 144) = v4;
  int v5 = *((unsigned __int8 *)v17 + 24);
  if (*(_DWORD *)(v2 + 136))
  {
    int v6 = (void *)v13[3];
    if (!v6) {
      goto LABEL_8;
    }
    nw_release(v6);
    CFArrayRef v7 = v13 + 3;
  }
  else
  {
    CFArrayRef v8 = *(void **)(v2 + 128);
    if (v8)
    {
      nw_release(v8);
      *(void *)(v2 + 128) = 0;
    }
    CFArrayRef v7 = v13 + 3;
    *(void *)(v2 + 128) = v13[3];
  }
  void *v7 = 0;
LABEL_8:
  if (v5) {
    uint64_t v9 = v4 ^ v3 | 0x80;
  }
  else {
    uint64_t v9 = v4 ^ v3;
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 64);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v9);
    }
  }
}

void ___mdns_interface_monitor_activate_internal_block_invoke_2(uint64_t a1)
{
}

void ___mdns_interface_monitor_activate_internal_block_invoke_3(uint64_t a1, NSObject *a2)
{
}

void ___mdns_interface_monitor_activate_internal_block_invoke_4(uint64_t a1)
{
}

void ___mdns_interface_monitor_activate_internal_block_invoke_28(uint64_t a1, NSObject *a2)
{
}

void ___mdns_interface_monitor_activate_internal_block_invoke_2_30(uint64_t a1)
{
}

void _mdns_nwi_state_update()
{
  uint64_t v0 = nwi_state_copy();
  if (!v0)
  {
    if (_mdns_nwi_log_s_once != -1) {
      dispatch_once(&_mdns_nwi_log_s_once, &__block_literal_global_43_791);
    }
    char v1 = _mdns_nwi_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_nwi_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_23814D000, v1, OS_LOG_TYPE_ERROR, "Failed to copy NWI state", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  int v5 = buf;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___mdns_nwi_state_update_block_invoke;
  v3[3] = &unk_264D07648;
  v3[4] = buf;
  void v3[5] = v0;
  os_unfair_lock_lock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  ___mdns_nwi_state_update_block_invoke((uint64_t)v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  if (*((void *)v5 + 3)) {
    nwi_state_release();
  }
  for (uint64_t i = g_monitor_list; i; uint64_t i = *(void *)(i + 24))
    _mdns_interface_monitor_check_nwi_state_for_updates(i);
  _Block_object_dispose(buf, 8);
}

void _mdns_interface_monitor_check_nwi_state_for_updates(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 136))
  {
    name = *(const char **)(a1 + 80);
  }
  else
  {
    unsigned int v3 = *(NSObject **)(a1 + 120);
    if (!v3) {
      goto LABEL_10;
    }
    name = nw_interface_get_name(v3);
  }
  if (name) {
    BOOL v4 = g_nwi_state == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t ifstate = nwi_state_get_ifstate();
    goto LABEL_11;
  }
LABEL_10:
  uint64_t ifstate = 0;
LABEL_11:
  int interface_flags_from_nwi_state = _mdns_get_interface_flags_from_nwi_state(ifstate, *(_DWORD *)(a1 + 140));
  int updated = _mdns_interface_monitor_update_signatures_from_nwi_state(a1, ifstate);

  _mdns_interface_monitor_trigger_update(a1, interface_flags_from_nwi_state, updated);
}

void _mdns_interface_monitor_terminate(void *object, int a2)
{
  BOOL v4 = object[7];
  if (v4)
  {
    dispatch_source_cancel((dispatch_source_t)object[7]);
    dispatch_release(v4);
    object[7] = 0;
  }
  int v5 = (void *)object[5];
  if (v5)
  {
    if (!*((unsigned char *)object + 157) || (nw_path_evaluator_cancel(), (int v5 = (void *)object[5]) != 0))
    {
      nw_release(v5);
      object[5] = 0;
    }
  }
  uint64_t v6 = object[6];
  if (v6)
  {
    nw_path_monitor_cancel(v6);
    uint64_t v7 = (void *)object[6];
    if (v7)
    {
      nw_release(v7);
      object[6] = 0;
    }
  }
  CFArrayRef v8 = (void *)g_monitor_list;
  if (g_monitor_list)
  {
    if ((void *)g_monitor_list == object)
    {
      uint64_t v10 = &g_monitor_list;
LABEL_16:
      *uint64_t v10 = object[3];
      object[3] = 0;
      os_release(object);
    }
    else
    {
      while (1)
      {
        uint64_t v9 = v8;
        CFArrayRef v8 = (void *)v8[3];
        if (!v8) {
          break;
        }
        if (v8 == object)
        {
          uint64_t v10 = v9 + 3;
          goto LABEL_16;
        }
      }
    }
  }
  os_retain(object);
  int v11 = object[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  v12[2] = ___mdns_interface_monitor_terminate_block_invoke;
  v12[3] = &__block_descriptor_tmp_45;
  int v13 = a2;
  v12[4] = object;
  dispatch_async(v11, v12);
}

void ___mdns_interface_monitor_terminate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  unsigned int v3 = *(const void ***)(a1 + 32);
  BOOL v4 = (void (**)(const void *, uint64_t, void))v3[9];
  if (v4)
  {
    if (v2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    v4[2](v3[9], v5, v2);
    unsigned int v3 = *(const void ***)(a1 + 32);
  }
  if (!v2 && v3[9])
  {
    _Block_release(v3[9]);
    unsigned int v3 = *(const void ***)(a1 + 32);
    v3[9] = 0;
  }

  os_release(v3);
}

void _mdns_interface_monitor_trigger_update(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)(a1 + 140) != a2 || a3 != 0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 0x40000000;
    void v7[2] = ___mdns_interface_monitor_trigger_update_block_invoke;
    v7[3] = &__block_descriptor_tmp_33_793;
    v7[4] = a1;
    int v8 = a2;
    char v9 = a3;
    uint64_t v5 = (os_unfair_lock_s *)(a1 + 148);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 148));
    ___mdns_interface_monitor_trigger_update_block_invoke((uint64_t)v7);
    os_unfair_lock_unlock(v5);
    uint64_t v6 = *(NSObject **)(a1 + 56);
    if (v6) {
      dispatch_source_merge_data(v6, 1uLL);
    }
  }
}

uint64_t ___mdns_interface_monitor_trigger_update_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  *(_DWORD *)(v1 + 140) = *(_DWORD *)(result + 40);
  if (*(unsigned char *)(result + 44)) {
    *(unsigned char *)(v1 + 158) = 1;
  }
  return result;
}

uint64_t ___mdns_nwi_state_update_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = g_nwi_state;
  g_nwi_state = *(void *)(result + 40);
  return result;
}

os_log_t ___mdns_nwi_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "NWI");
  _mdns_nwi_log_s_os_log_t log = (uint64_t)result;
  return result;
}

void _mdns_interface_monitor_trigger_update_with_path(uint64_t a1, NSObject *a2)
{
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2000000000;
  uint64_t v21 = 0;
  if (*(_DWORD *)(a1 + 136)) {
    goto LABEL_2;
  }
  uint64_t v7 = nw_path_copy_interface();
  v19[3] = v7;
  uint64_t v8 = *(void *)(a1 + 120);
  if (!v7)
  {
    BOOL v4 = (_DWORD *)(a1 + 140);
    int interface_flags_from_nw_path = _mdns_get_interface_flags_from_nw_path(a2, *(_DWORD *)(a1 + 140));
    if (!v8) {
      goto LABEL_3;
    }
LABEL_10:
    _mdns_interface_monitor_forget_signatures(a1);
    uint64_t v10 = v19[3];
    if (!v10 || (nw_interface_get_name(v10) ? (BOOL v11 = g_nwi_state == 0) : (BOOL v11 = 1), v11)) {
      uint64_t ifstate = 0;
    }
    else {
      uint64_t ifstate = nwi_state_get_ifstate();
    }
    _mdns_interface_monitor_update_signatures_from_nwi_state(a1, ifstate);
    int interface_flags_from_nw_path = _mdns_get_interface_flags_from_nwi_state(ifstate, interface_flags_from_nw_path);
    char v6 = 1;
    goto LABEL_18;
  }
  if (!v8
    || (uint32_t index = nw_interface_get_index(*(nw_interface_t *)(a1 + 120)),
        index != nw_interface_get_index((nw_interface_t)v19[3])))
  {
    int interface_flags_from_nw_path = _mdns_get_interface_flags_from_nw_path(a2, *(_DWORD *)(a1 + 140));
    goto LABEL_10;
  }
LABEL_2:
  BOOL v4 = (_DWORD *)(a1 + 140);
  int interface_flags_from_nw_path = _mdns_get_interface_flags_from_nw_path(a2, *(_DWORD *)(a1 + 140));
LABEL_3:
  if (*v4 == interface_flags_from_nw_path) {
    goto LABEL_20;
  }
  char v6 = 0;
LABEL_18:
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 0x40000000;
  v15[2] = ___mdns_interface_monitor_trigger_update_with_path_block_invoke;
  v15[3] = &unk_264D07600;
  int v16 = interface_flags_from_nw_path;
  char v17 = v6;
  v15[4] = &v18;
  v15[5] = a1;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 148));
  ___mdns_interface_monitor_trigger_update_with_path_block_invoke((uint64_t)v15);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 148));
  int v13 = *(NSObject **)(a1 + 56);
  if (v13) {
    dispatch_source_merge_data(v13, 1uLL);
  }
LABEL_20:
  uint64_t v14 = (void *)v19[3];
  if (v14)
  {
    nw_release(v14);
    v19[3] = 0;
  }
  _Block_object_dispose(&v18, 8);
}

void ___mdns_interface_monitor_trigger_update_with_path_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(_DWORD *)(v1 + 140) = *(_DWORD *)(a1 + 48);
  if (*(unsigned char *)(a1 + 52))
  {
    *(unsigned char *)(v1 + 158) = 1;
    unsigned int v3 = *(void **)(v1 + 120);
    if (v3)
    {
      nw_release(v3);
      *(void *)(*(void *)(a1 + 40) + 120) = 0;
      uint64_t v1 = *(void *)(a1 + 40);
    }
    *(void *)(v1 + 120) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void *___mdns_interface_monitor_update_block_invoke(void *a1)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = *(_DWORD *)(a1[7] + 140);
  uint64_t v1 = a1[7];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(v1 + 158);
  *(unsigned char *)(v1 + 158) = 0;
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(v1 + 120);
  os_log_t result = *(void **)(*(void *)(a1[6] + 8) + 24);
  if (result) {
    return nw_retain(result);
  }
  return result;
}

ifaddrs *_mdns_store_changed()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  if (getifaddrs(&v10))
  {
    if (*__error())
    {
      int v0 = *__error();
      if (!v0) {
        goto LABEL_4;
      }
    }
    else
    {
      int v0 = -6700;
    }
    if (_mdns_ifmon_log_s_once != -1) {
      dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_764);
    }
    uint64_t v8 = _mdns_ifmon_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v12 = v0;
      _os_log_error_impl(&dword_23814D000, v8, OS_LOG_TYPE_ERROR, "getifaddrs() failed: %{mdns:err}ld", buf, 0xCu);
    }
    goto LABEL_21;
  }
LABEL_4:
  for (uint64_t i = g_monitor_list; i; uint64_t i = *(void *)(i + 24))
  {
    int v2 = *(_DWORD *)(i + 136);
    if (v2)
    {
      unsigned int v3 = *(_DWORD *)(i + 140);
      BOOL v4 = v10;
      if (v10)
      {
        while (1)
        {
          ifa_addr = v4->ifa_addr;
          if (ifa_addr)
          {
            if (ifa_addr->sa_family == 18 && v2 == *(unsigned __int16 *)ifa_addr->sa_data) {
              break;
            }
          }
          BOOL v4 = v4->ifa_next;
          if (!v4) {
            goto LABEL_11;
          }
        }
        int v7 = v3 & 0xFFFFFFBF;
        int v6 = (v3 >> 6) & 1;
      }
      else
      {
LABEL_11:
        int v6 = (*(_DWORD *)(i + 140) & 0x40) == 0;
        int v7 = v3 | 0x40;
      }
      _mdns_interface_monitor_trigger_update(i, v7, v6);
    }
  }
LABEL_21:
  os_log_t result = v10;
  if (v10) {
    return (ifaddrs *)MEMORY[0x23EC88860]();
  }
  return result;
}

dispatch_queue_t ___mdns_internal_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.interface-monitor", 0);
  _mdns_internal_queue_s_queue = (uint64_t)result;
  return result;
}

void mdns_interface_monitor_invalidate(void *a1)
{
  os_retain(a1);
  if (_mdns_internal_queue_s_once != -1) {
    dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_8);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_interface_monitor_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2_810;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_internal_queue_s_queue, block);
}

void __mdns_interface_monitor_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 156))
  {
    _mdns_interface_monitor_terminate((void *)v2, 0);
    uint64_t v2 = *(void *)(a1 + 32);
    *(unsigned char *)(v2 + 156) = 1;
  }

  os_release((void *)v2);
}

void mdns_interface_monitor_set_queue(uint64_t a1, dispatch_object_t object)
{
  if (*(unsigned char *)(a1 + 154))
  {
    if (!*(void *)(a1 + 32))
    {
      *(void *)(a1 + 32) = object;
      dispatch_retain(object);
      _mdns_interface_monitor_activate_async((void *)a1);
    }
  }
  else
  {
    dispatch_retain(object);
    BOOL v4 = *(NSObject **)(a1 + 32);
    if (v4) {
      dispatch_release(v4);
    }
    *(void *)(a1 + 32) = object;
  }
}

void mdns_interface_monitor_set_event_handler(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    unsigned int v3 = _Block_copy(aBlock);
  }
  else {
    unsigned int v3 = 0;
  }
  BOOL v4 = *(const void **)(a1 + 72);
  if (v4) {
    _Block_release(v4);
  }
  *(void *)(a1 + 72) = v3;
}

void mdns_interface_monitor_set_update_handler(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    unsigned int v3 = _Block_copy(aBlock);
  }
  else {
    unsigned int v3 = 0;
  }
  BOOL v4 = *(const void **)(a1 + 64);
  if (v4) {
    _Block_release(v4);
  }
  *(void *)(a1 + 64) = v3;
}

uint64_t mdns_interface_monitor_get_interface_index(uint64_t a1)
{
  return *(unsigned int *)(a1 + 136);
}

uint64_t mdns_interface_monitor_has_ipv4_connectivity(uint64_t a1)
{
  return *(_DWORD *)(a1 + 144) & 1;
}

uint64_t mdns_interface_monitor_has_ipv6_connectivity(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 1) & 1;
}

uint64_t mdns_interface_monitor_is_expensive(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 2) & 1;
}

uint64_t mdns_interface_monitor_is_constrained(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 3) & 1;
}

uint64_t mdns_interface_monitor_is_clat46(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 4) & 1;
}

uint64_t mdns_interface_monitor_is_vpn(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 5) & 1;
}

const void *mdns_managed_defaults_create(const char *a1, int *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)cStr = 0;
  asprintf((char **)cStr, "/Library/Managed Preferences/mobile/%s.plist", a1);
  if (!*(void *)cStr)
  {
    int Code = -6728;
    goto LABEL_20;
  }
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(0, *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  if (!v4)
  {
    if (*(void *)cStr) {
      free(*(void **)cStr);
    }
    goto LABEL_19;
  }
  CFStringRef v5 = v4;
  *(void *)cStr = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v7 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFURLPOSIXPathStyle, 0);
  CFRelease(v5);
  if (!v7)
  {
LABEL_19:
    int Code = -6729;
LABEL_20:
    if (_mdns_managed_defaults_log_s_once != -1) {
      dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_834);
    }
    uint64_t v15 = _mdns_managed_defaults_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cStr = 136446466;
      *(void *)&cStr[4] = a1;
      __int16 v22 = 2048;
      uint64_t v23 = Code;
      _os_log_error_impl(&dword_23814D000, v15, OS_LOG_TYPE_ERROR, "Failed to create URL -- domain: %{public}s, error: %{mdns:err}ld", cStr, 0x16u);
    }
    BOOL v11 = 0;
    if (a2) {
      goto LABEL_14;
    }
    return v11;
  }
  uint64_t v8 = CFReadStreamCreateWithFile(v6, v7);
  char v9 = v8;
  if (!v8)
  {
    int Code = -6729;
LABEL_34:
    if (_mdns_managed_defaults_log_s_once != -1) {
      dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_834);
    }
    char v17 = _mdns_managed_defaults_log_s_log;
    if (v9) {
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    }
    else {
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    }
    if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, v18))
    {
      *(_DWORD *)cStr = 138543618;
      *(void *)&cStr[4] = v7;
      __int16 v22 = 2048;
      uint64_t v23 = Code;
      _os_log_impl(&dword_23814D000, v17, v18, "Failed to create read stream -- url: %{public}@, error: %{mdns:err}ld", cStr, 0x16u);
    }
    goto LABEL_41;
  }
  if (!CFReadStreamOpen(v8))
  {
    CFRelease(v9);
    int Code = -6755;
    goto LABEL_34;
  }
  CFErrorRef error = 0;
  CFPropertyListRef v10 = CFPropertyListCreateWithStream(0, v9, 0, 0, 0, &error);
  if (v10)
  {
    BOOL v11 = v10;
    CFTypeID v12 = CFGetTypeID(v10);
    if (v12 == CFDictionaryGetTypeID())
    {
      int Code = 0;
    }
    else
    {
      CFRelease(v11);
      BOOL v11 = 0;
      int Code = -6756;
    }
  }
  else
  {
    if (error) {
      int Code = CFErrorGetCode(error);
    }
    else {
      int Code = -6700;
    }
    if (_mdns_managed_defaults_log_s_once != -1) {
      dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_834);
    }
    char v19 = _mdns_managed_defaults_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cStr = 138543362;
      *(void *)&cStr[4] = error;
      _os_log_error_impl(&dword_23814D000, v19, OS_LOG_TYPE_ERROR, "CFPropertyListCreateWithStream failed: %{public}@", cStr, 0xCu);
    }
    BOOL v11 = 0;
  }
  if (error) {
    CFRelease(error);
  }
  CFRelease(v9);
  if (v11)
  {
    int Code = 0;
    goto LABEL_13;
  }
  if (_mdns_managed_defaults_log_s_once != -1) {
    dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_834);
  }
  int v16 = _mdns_managed_defaults_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)cStr = 138543618;
    *(void *)&cStr[4] = v7;
    __int16 v22 = 2048;
    uint64_t v23 = Code;
    _os_log_error_impl(&dword_23814D000, v16, OS_LOG_TYPE_ERROR, "Failed to create dictionary -- url: %{public}@, error: %{mdns:err}ld", cStr, 0x16u);
  }
LABEL_41:
  BOOL v11 = 0;
LABEL_13:
  CFRelease(v7);
  if (a2) {
LABEL_14:
  }
    *a2 = Code;
  return v11;
}

os_log_t ___mdns_managed_defaults_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "managed_defaults");
  _mdns_managed_defaults_log_s_os_log_t log = (uint64_t)result;
  return result;
}

unint64_t mdns_managed_defaults_get_int_clamped(const __CFDictionary *a1, const void *a2, unint64_t a3, int *a4)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 != CFNumberGetTypeID() || CFNumberIsFloatType(v7))
    {
      int v9 = -6756;
    }
    else
    {
      uint64_t valuePtr = 0;
      if (CFNumberGetValue(v7, kCFNumberSInt64Type, &valuePtr))
      {
        int v9 = 0;
        int64_t v10 = valuePtr;
        if (valuePtr >= 0x7FFFFFFF) {
          int64_t v10 = 0x7FFFFFFFLL;
        }
        if (v10 <= (uint64_t)0xFFFFFFFF80000000) {
          a3 = 0xFFFFFFFF80000000;
        }
        else {
          a3 = v10;
        }
      }
      else
      {
        int v9 = -6700;
      }
    }
  }
  else
  {
    int v9 = -6727;
  }
  if (a4) {
    *a4 = v9;
  }
  return a3;
}

BOOL mdns_managed_defaults_get_BOOL_easy(const char *a1, const void *a2, BOOL a3, int *a4)
{
  int v14 = 0;
  CFDictionaryRef v7 = (const __CFDictionary *)mdns_managed_defaults_create(a1, &v14);
  CFDictionaryRef v8 = v7;
  int v9 = v14;
  if (!v14)
  {
    CFNumberRef Value = CFDictionaryGetValue(v7, a2);
    if (Value)
    {
      BOOL v11 = Value;
      CFTypeID v12 = CFGetTypeID(Value);
      if (v12 == CFBooleanGetTypeID())
      {
        int v9 = 0;
        a3 = v11 == (const void *)*MEMORY[0x263EFFB40];
      }
      else
      {
        int v9 = -6756;
      }
    }
    else
    {
      int v9 = -6727;
    }
    int v14 = v9;
  }
  if (a4) {
    *a4 = v9;
  }
  if (v8) {
    CFRelease(v8);
  }
  return a3;
}

char *_mdns_obj_copy_description(void *a1)
{
  uint64_t v2 = 0;
  asprintf(&v2, "<%s: %p>", *(const char **)(a1[2] + 8), a1);
  return v2;
}

const char *_mdns_obj_copy_description_as_cfstring(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  do
  {
    uint64_t v1 = (void *)*v1;
    if (!v1) {
      return 0;
    }
    uint64_t v2 = (uint64_t (*)(void))v1[3];
  }
  while (!v2);
  os_log_t result = (const char *)v2();
  if (result)
  {
    CFStringRef v4 = (char *)result;
    os_log_t result = (const char *)CFStringCreateWithCStringNoCopy(0, result, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
    if (!result)
    {
      free(v4);
      return 0;
    }
  }
  return result;
}

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  if (a3)
  {
    while (1)
    {
      unsigned int v5 = *a1++;
      unsigned int v4 = v5;
      unsigned int v6 = v5 + 32;
      if (v5 - 65 < 0x1A) {
        unsigned int v4 = v6;
      }
      unsigned int v8 = *a2++;
      unsigned int v7 = v8;
      unsigned int v9 = v8 + 32;
      if (v8 - 65 < 0x1A) {
        unsigned int v7 = v9;
      }
      if (v4 > v7) {
        a4 = 1;
      }
      if (v4 < v7) {
        a4 = -1;
      }
      if (v4 != v7) {
        break;
      }
      if (!--a3) {
        return 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return a4;
}

void _mdns_message_finalize(uint64_t a1)
{
  *(void *)(a1 + 32) = 0;
  uint64_t v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

char *_mdns_message_copy_description(uint64_t a1, uint64_t a2, int a3)
{
  int v16 = 0;
  os_log_t result = *(char **)(a1 + 32);
  if (result)
  {
    char v5 = a3;
    int v6 = *(unsigned char *)(a1 + 48) ? 36 : 4;
    unsigned int v7 = a3 ? v6 | 8 : v6;
    DNSMessageToString(result, *(void *)(a1 + 40), v7, (uint64_t)&v16);
    os_log_t result = v16;
    if (!v16 && (v5 & 1) == 0)
    {
      os_log_t result = 0;
      unint64_t v8 = *(unsigned char *)(a1 + 48) ? 12 : 0;
      unint64_t v9 = *(void *)(a1 + 40);
      if (v9 >= v8)
      {
        uint64_t v10 = v9 - v8;
        if ((uint64_t)(v9 - v8) < 0)
        {
          return 0;
        }
        else
        {
          uint64_t v11 = *(void *)(a1 + 32);
          os_log_t result = (char *)malloc_type_malloc((2 * v10) | 1, 0xA172743EuLL);
          if (result)
          {
            CFTypeID v12 = result;
            if (v9 != v8)
            {
              uint64_t v13 = (unsigned __int8 *)(v11 + v8);
              int v14 = result;
              do
              {
                unsigned int v15 = *v13++;
                *int v14 = a0123456789abcd[(unint64_t)v15 >> 4];
                CFTypeID v12 = v14 + 2;
                v14[1] = a0123456789abcd[v15 & 0xF];
                v14 += 2;
                --v10;
              }
              while (v10);
            }
            char *v12 = 0;
          }
          else
          {
            __break(1u);
          }
        }
      }
    }
  }
  return result;
}

unsigned char *mdns_message_create_with_dispatch_data(NSObject *a1)
{
  size_t v39 = 0;
  buffer_ptr = 0;
  dispatch_data_t v1 = dispatch_data_create_map(a1, (const void **)&buffer_ptr, &v39);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  size_t v4 = v39;
  unsigned int v3 = buffer_ptr;
  if (buffer_ptr) {
    BOOL v5 = v39 >= 0xC;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5
    && (*((unsigned char *)buffer_ptr + 2) & 0x78) == 0x30
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 2))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 3))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 4))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 5))
    && ((*((unsigned char *)buffer_ptr + 2) & 0x80) == 0 || __rev16(*(unsigned __int16 *)buffer_ptr)))
  {
    uint64_t v6 = 0;
    unsigned int v7 = (char *)buffer_ptr + 12;
    unint64_t v8 = (char *)buffer_ptr + v39;
    while (v7 < v8)
    {
      if ((unint64_t)(v8 - v7) >= 4)
      {
        uint64_t v9 = __rev16(*((unsigned __int16 *)v7 + 1));
        uint64_t v10 = v8 - (v7 + 4);
        v7 += v9 + 4;
        ++v6;
        if (v10 >= v9) {
          continue;
        }
      }
      goto LABEL_21;
    }
    if ((*((unsigned char *)buffer_ptr + 2) & 0x80) != 0 || v6)
    {
      uint64_t v16 = 0;
      char v17 = &off_26EB17298;
      do
      {
        if (((uint64_t (*)(void *, size_t))*v17)(v3, v4))
        {
          switch(*((_WORD *)&off_26EB17298 + 8 * v16 + 4))
          {
            case 0:
              goto LABEL_32;
            case 1:
              uint64_t v21 = _os_object_alloc();
              CFTypeID v12 = (unsigned char *)v21;
              if (!v21) {
                goto LABEL_27;
              }
              __int16 v22 = &_mdns_dso_keepalive_message_kind;
              *(void *)(v21 + 16) = &_mdns_dso_keepalive_message_kind;
              do
              {
                uint64_t v23 = (void (*)(unsigned char *))v22[2];
                if (v23) {
                  v23(v12);
                }
                __int16 v22 = (_UNKNOWN ***)*v22;
              }
              while (v22);
              break;
            case 2:
              uint64_t v24 = _os_object_alloc();
              CFTypeID v12 = (unsigned char *)v24;
              if (!v24) {
                goto LABEL_27;
              }
              int v25 = &_mdns_dso_retry_delay_message_kind;
              *(void *)(v24 + 16) = &_mdns_dso_retry_delay_message_kind;
              do
              {
                __int16 v26 = (void (*)(unsigned char *))v25[2];
                if (v26) {
                  v26(v12);
                }
                int v25 = (_UNKNOWN ***)*v25;
              }
              while (v25);
              break;
            case 3:
              uint64_t v27 = _os_object_alloc();
              CFTypeID v12 = (unsigned char *)v27;
              if (!v27) {
                goto LABEL_27;
              }
              uint64_t v28 = &_mdns_dso_push_message_kind;
              *(void *)(v27 + 16) = &_mdns_dso_push_message_kind;
              do
              {
                int v29 = (void (*)(unsigned char *))v28[2];
                if (v29) {
                  v29(v12);
                }
                uint64_t v28 = (_UNKNOWN ***)*v28;
              }
              while (v28);
              break;
            case 4:
              uint64_t v30 = _os_object_alloc();
              CFTypeID v12 = (unsigned char *)v30;
              if (!v30) {
                goto LABEL_27;
              }
              uint32_t v31 = &_mdns_dso_subscribe_message_kind;
              *(void *)(v30 + 16) = &_mdns_dso_subscribe_message_kind;
              do
              {
                __int16 v32 = (void (*)(unsigned char *))v31[2];
                if (v32) {
                  v32(v12);
                }
                uint32_t v31 = (_UNKNOWN ***)*v31;
              }
              while (v31);
              break;
            case 5:
              uint64_t v33 = _os_object_alloc();
              CFTypeID v12 = (unsigned char *)v33;
              if (!v33) {
                goto LABEL_27;
              }
              uint64_t v34 = &_mdns_dso_unsubscribe_message_kind;
              *(void *)(v33 + 16) = &_mdns_dso_unsubscribe_message_kind;
              do
              {
                uint32_t v35 = (void (*)(unsigned char *))v34[2];
                if (v35) {
                  v35(v12);
                }
                uint64_t v34 = (_UNKNOWN ***)*v34;
              }
              while (v34);
              break;
            case 6:
              uint64_t v36 = _os_object_alloc();
              CFTypeID v12 = (unsigned char *)v36;
              if (!v36) {
                goto LABEL_27;
              }
              int v37 = &_mdns_dso_reconfirm_message_kind;
              *(void *)(v36 + 16) = &_mdns_dso_reconfirm_message_kind;
              do
              {
                BOOL v38 = (void (*)(unsigned char *))v37[2];
                if (v38) {
                  v38(v12);
                }
                int v37 = (_UNKNOWN ***)*v37;
              }
              while (v37);
              break;
            default:
              goto LABEL_77;
          }
          goto LABEL_26;
        }
        ++v16;
        v17 += 2;
      }
      while (v16 != 6);
LABEL_32:
      uint64_t v18 = _os_object_alloc();
      CFTypeID v12 = (unsigned char *)v18;
      if (!v18) {
        goto LABEL_27;
      }
      char v19 = &_mdns_dso_unspecified_message_kind;
      *(void *)(v18 + 16) = &_mdns_dso_unspecified_message_kind;
      do
      {
        uint64_t v20 = (void (*)(unsigned char *))v19[2];
        if (v20) {
          v20(v12);
        }
        char v19 = (_UNKNOWN ***)*v19;
      }
      while (v19);
      goto LABEL_26;
    }
  }
LABEL_21:
  uint64_t v11 = _os_object_alloc();
  CFTypeID v12 = (unsigned char *)v11;
  if (v11)
  {
    uint64_t v13 = &_mdns_message_kind;
    *(void *)(v11 + 16) = &_mdns_message_kind;
    do
    {
      int v14 = (void (*)(unsigned char *))v13[2];
      if (v14) {
        v14(v12);
      }
      uint64_t v13 = (_UNKNOWN **)*v13;
    }
    while (v13);
LABEL_26:
    v12[48] = 1;
    if (_mdns_message_set_msg_data(v12, v2))
    {
      os_release(v12);
LABEL_77:
      CFTypeID v12 = 0;
    }
  }
LABEL_27:
  dispatch_release(v2);
  return v12;
}

uint64_t _mdns_message_set_msg_data(void *a1, dispatch_data_t data)
{
  size_t v7 = 0;
  buffer_ptr = 0;
  if (data)
  {
    dispatch_data_t v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v7);
    if (!v3) {
      return 4294960568;
    }
  }
  else
  {
    size_t v7 = 0;
    buffer_ptr = 0;
    dispatch_data_t v3 = (dispatch_data_t)MEMORY[0x263EF8388];
  }
  BOOL v5 = a1[3];
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t result = 0;
  uint64_t v6 = buffer_ptr;
  a1[3] = v3;
  a1[4] = v6;
  a1[5] = v7;
  return result;
}

BOOL _mdns_dso_reconfirm_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  BOOL result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      BOOL result = 0;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC) {
          return 0;
        }
        BOOL result = 0;
        size_t v4 = a1 + 8;
        if (a1 != (unsigned __int16 *)-16)
        {
          int64_t v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) >= v5)
          {
            if (__rev16(a1[6]) == 67 && v4 < (unsigned __int16 *)((char *)v4 + v5))
            {
              uint64_t v6 = a1 + 8;
              while (1)
              {
                uint64_t v7 = *v6;
                if (!*v6) {
                  break;
                }
                if (v7 > 0x3F) {
                  return 0;
                }
                BOOL result = 0;
                unint64_t v8 = &v6[v7];
                if ((char *)v4 + v5 - v6 > v7)
                {
                  uint64_t v6 = v8 + 1;
                  if (v8 + 1 - (unsigned char *)v4 < 256) {
                    continue;
                  }
                }
                return result;
              }
              unsigned __int16 v9 = (_WORD)v6 - (_WORD)v4 + 1;
              if ((_WORD)v6 - (_WORD)v4 != 0xFFFF) {
                return v5 > v9 && v5 - v9 > 3;
              }
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_unsubscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  BOOL result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      BOOL result = 0;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
        {
          return 0;
        }
        else
        {
          BOOL result = 0;
          if (a1 != (unsigned __int16 *)-16)
          {
            int64_t v4 = __rev16(a1[7]);
            if ((uint64_t)(a2 - 16) >= v4) {
              return __rev16(a1[6]) == 66 && v4 == 2;
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_subscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  BOOL result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      BOOL result = 0;
      if (((char)a1[1] & 0x80000000) == 0)
      {
        if (__rev16(*a1))
        {
          if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC) {
            return 0;
          }
          BOOL result = 0;
          int64_t v4 = a1 + 8;
          if (a1 == (unsigned __int16 *)-16) {
            return result;
          }
          int64_t v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) < v5) {
            return result;
          }
          if (__rev16(a1[6]) != 64) {
            return 0;
          }
          uint64_t v6 = (char *)v4 + v5;
          if (v4 >= (unsigned __int16 *)((char *)v4 + v5)) {
            return 0;
          }
          uint64_t v7 = v4;
          while (1)
          {
            uint64_t v8 = *(unsigned __int8 *)v7;
            if (!*(unsigned char *)v7) {
              break;
            }
            if (v8 > 0x3F) {
              return 0;
            }
            BOOL result = 0;
            unsigned __int16 v9 = (char *)v7 + v8;
            BOOL v12 = __OFSUB__(v6 - (char *)v7, v8);
            BOOL v10 = v6 - (char *)v7 == v8;
            BOOL v11 = v6 - (char *)v7 - v8 < 0;
            if (v6 - (char *)v7 > v8) {
              uint64_t v7 = (unsigned __int16 *)(v9 + 1);
            }
            if (v11 ^ v12 | v10 || v9 + 1 - (unsigned char *)v4 >= 256) {
              return result;
            }
          }
          int v13 = (unsigned __int16)((_WORD)v7 - (_WORD)v4) + 1;
          int64_t v14 = v5 - (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
          BOOL v16 = v5 > (unsigned __int16)v13 && v14 == 4;
          return (v13 & 0x10000) == 0 && v16;
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_push_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  if (a2 > 0x3FFE) {
    return 0;
  }
  v17[7] = v2;
  v17[8] = v3;
  BOOL result = 0;
  if (a1 && a2 >= 0xC)
  {
    BOOL result = 0;
    int v7 = *((char *)a1 + 2);
    unsigned int v8 = __rev16(*a1);
    BOOL v9 = !v8 && v7 < 0;
    if (!v9 && (v7 & 0x80000000) == 0 && !v8)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC) {
        return 0;
      }
      int64_t v10 = __rev16(a1[7]);
      if ((uint64_t)(a2 - 16) < v10) {
        return 0;
      }
      BOOL result = 0;
      BOOL v11 = (char *)(a1 + 8);
      if (a1 != (unsigned __int16 *)-16 && __rev16(a1[6]) == 65)
      {
        BOOL v12 = &v11[v10];
        v17[0] = a1 + 8;
        if (v11 < &v11[v10])
        {
          uint64_t v13 = 0;
          while (1)
          {
            int v16 = 0;
            int v15 = 0;
            unint64_t v14 = 0;
            if (_DNSMessageExtractRecordEx((unint64_t)a1, a2, v11, 0, (_WORD *)&v16 + 1, &v16, &v15, 0, &v14, 0, 0, 0, 0, v17))return 0; {
            BOOL v11 = (char *)v17[0];
            }
            if (v17[0] > (unint64_t)v12) {
              return 0;
            }
            if ((v15 & 0x80000000) == 0) {
              break;
            }
            if (v15 == -2)
            {
              if (v14) {
                return 0;
              }
            }
            else if (v15 == -1)
            {
              break;
            }
LABEL_21:
            ++v13;
            if (v17[0] >= (unint64_t)v12) {
              return v13 != 0;
            }
          }
          if (HIWORD(v16) == 255 || (unsigned __int16)v16 == 255) {
            return 0;
          }
          goto LABEL_21;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t _mdns_dso_retry_delay_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2 >= 0x14)
  {
    uint64_t v2 = 0;
    int v3 = *((char *)a1 + 2);
    unsigned int v4 = __rev16(*a1);
    BOOL v5 = !v4 && v3 < 0;
    if (!v5 && (v3 & 0x80000000) == 0 && !v4)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC || (int64_t v6 = __rev16(a1[7]), (uint64_t)(a2 - 16) < v6))
      {
        BOOL v10 = 0;
        BOOL v9 = 0;
      }
      else
      {
        unsigned int v7 = __rev16(a1[6]);
        BOOL v9 = a1 != (unsigned __int16 *)-16 && v7 == 2;
        BOOL v10 = v6 == 4;
      }
      return v10 & v9;
    }
  }
  return v2;
}

BOOL _mdns_dso_keepalive_message_validator(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x18
    && (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0xC
    && (int64_t v2 = __rev16(*(unsigned __int16 *)(a1 + 14)), (uint64_t)(a2 - 16) >= v2)
    && ((v3 = __rev16(*(unsigned __int16 *)(a1 + 12)), v2 == 8) ? (BOOL v4 = a1 == -16) : (BOOL v4 = 1),
        !v4 ? (BOOL v5 = v3 == 1) : (BOOL v5 = 0),
        v5))
  {
    return bswap32(*(_DWORD *)(a1 + 20)) >> 4 > 0x270;
  }
  else
  {
    return 0;
  }
}

uint64_t mdns_query_message_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    int64_t v2 = &_mdns_query_message_kind;
    *(void *)(v0 + 16) = &_mdns_query_message_kind;
    do
    {
      unsigned int v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      int64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(unsigned char *)(v1 + 48) = 1;
    if (_mdns_message_set_msg_data((void *)v1, 0)) {
      goto LABEL_11;
    }
    if (_mdns_domain_name_get_root_s_once != -1) {
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global_487);
    }
    uint64_t v4 = _mdns_domain_name_get_root_s_root;
    *(void *)(v1 + 56) = _mdns_domain_name_get_root_s_root;
    if (!v4)
    {
LABEL_11:
      os_release((void *)v1);
      return 0;
    }
  }
  return v1;
}

void _mdns_query_message_finalize(uint64_t a1)
{
  int64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 56) = 0;
  }
}

void mdns_query_message_set_qname(uint64_t a1, void *object)
{
  if ((*(unsigned char *)(a1 + 70) & 0x20) == 0)
  {
    if (object) {
      os_retain(object);
    }
    uint64_t v4 = *(void **)(a1 + 56);
    if (v4) {
      os_release(v4);
    }
    *(void *)(a1 + 56) = object;
  }
}

uint64_t mdns_query_message_construct(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(unsigned __int8 *)(a1 + 70);
  if (v2) {
    __int16 v3 = 288;
  }
  else {
    __int16 v3 = 256;
  }
  size_t size = 0;
  uint64_t v4 = DNSMessageWriteQuery(*(_WORD *)(a1 + 68), v3 & 0xFFEF | (16 * ((v2 >> 1) & 1)), *(unsigned char **)(*(void *)(a1 + 56) + 24), *(_WORD *)(a1 + 64), *(_WORD *)(a1 + 66), (uint64_t)buffer, &size);
  if (v4) {
    return v4;
  }
  char v5 = *(unsigned char *)(a1 + 70);
  if ((v5 & 0x1C) != 0 || *(unsigned char *)(a1 + 71))
  {
    size_t v6 = size;
    if (size <= 0x200)
    {
      size_t v7 = size + 11;
      unsigned int v8 = &buffer[size];
      *(void *)unsigned int v8 = 0;
      *(_DWORD *)(v8 + 7) = 0;
      *(_DWORD *)(v8 + 1) = 141568;
      if ((v5 & 4) != 0) {
        void v8[7] = 0x80;
      }
      v27[2] = 256;
      size_t size = v6 + 11;
      char v9 = *(unsigned char *)(a1 + 71);
      if (v9)
      {
        unint64_t v10 = *(unsigned __int8 *)(a1 + 72);
        unint64_t v11 = v6 + ((v10 + 7) >> 3) + 19;
        uint64_t v12 = 4294960553;
        if (v11 <= v7 || v11 > 0x200) {
          return v12;
        }
        uint64_t v13 = &buffer[v7];
        bzero(&buffer[v7], &buffer[v11] - &buffer[v7]);
        *(_WORD *)(v8 + 9) = bswap32(&buffer[v11] - v8 - 11) >> 16;
        *(_WORD *)uint64_t v13 = 2048;
        void v13[4] = 0;
        __int16 v14 = (unsigned __int16)&buffer[v11] - ((_WORD)v13 + 4);
        v13[2] = HIBYTE(v14);
        void v13[3] = v14;
        void v13[5] = v9;
        v13[6] = v10;
        void v13[7] = 0;
        int v15 = v13 + 8;
        if (v10 >= 8) {
          memcpy(v15, (const void *)(a1 + 73), v10 >> 3);
        }
        if ((v10 & 7) != 0) {
          *((unsigned char *)v15 + (v10 >> 3)) = *((unsigned char *)v15 + (v10 >> 3)) & ~(-1 << (8 - (v10 & 7))) | *(unsigned char *)(a1 + 73 + (v10 >> 3)) & (-1 << (8 - (v10 & 7)));
        }
        size_t size = v6 + ((v10 + 7) >> 3) + 19;
        size_t v7 = size;
      }
      if ((v5 & 0x10) == 0) {
        goto LABEL_23;
      }
      if (v7 <= 0x1FA)
      {
        uint64_t v12 = 4294960554;
        if (v7 <= v6 || v7 - v6 < 0xB) {
          return v12;
        }
        size_t v16 = v7 + 6;
        char v17 = &buffer[v7];
        uint64_t v18 = &buffer[v7 + 6];
        bzero(&buffer[v7], (char *)v27 - buffer);
        *(_WORD *)(v8 + 9) = bswap32(v18 - v8 - 11) >> 16;
        *(_DWORD *)char v17 = 33558272;
        *((_WORD *)v17 + 2) = 0;
        size_t size = v16;
        size_t v7 = v16;
LABEL_23:
        if ((v5 & 8) != 0)
        {
          size_t v19 = (v7 + 131) & 0xFFFFFFFFFFFFFF80;
          uint64_t v12 = 4294960553;
          if (v19 <= v7) {
            return v12;
          }
          if (v19 > 0x200) {
            return v12;
          }
          uint64_t v12 = 4294960554;
          if (v7 <= v6 || v7 - v6 < 0xB) {
            return v12;
          }
          uint64_t v20 = &buffer[v7];
          size_t v21 = &buffer[v19] - &buffer[v7];
          bzero(&buffer[v7], v21);
          *(_WORD *)(v8 + 9) = bswap32(&buffer[v19] - v8 - 11) >> 16;
          *(_WORD *)uint64_t v20 = 3072;
          v20[2] = (unsigned __int16)(v21 - 4) >> 8;
          v20[3] = v21 - 4;
          size_t size = v19;
          size_t v7 = v19;
        }
        goto LABEL_30;
      }
    }
    return 4294960553;
  }
  size_t v7 = size;
LABEL_30:
  __int16 v22 = dispatch_data_create(buffer, v7, 0, 0);
  if (!v22) {
    return 4294960568;
  }
  uint64_t v23 = v22;
  uint64_t v12 = _mdns_message_set_msg_data((void *)a1, v22);
  dispatch_release(v23);
  if (!v12) {
    *(unsigned char *)(a1 + 70) |= 0x20u;
  }
  return v12;
}

id _mdns_ne_dns_proxy_state_watch_log()
{
  if (_mdns_ne_dns_proxy_state_watch_log_s_once != -1) {
    dispatch_once(&_mdns_ne_dns_proxy_state_watch_log_s_once, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)_mdns_ne_dns_proxy_state_watch_log_s_log;

  return v0;
}

id _mdns_ne_dns_proxy_state_watch_queue()
{
  if (_mdns_ne_dns_proxy_state_watch_queue_s_once != -1) {
    dispatch_once(&_mdns_ne_dns_proxy_state_watch_queue_s_once, &__block_literal_global_8_961);
  }
  uint64_t v0 = (void *)_mdns_ne_dns_proxy_state_watch_queue_s_queue;

  return v0;
}

void _mdns_ne_dns_proxy_state_watch_fetch_manager_status(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unint64_t v2 = [(id)g_managers indexOfObjectIdenticalTo:v1];
  unint64_t v3 = [(id)g_managers count];
  uint64_t v4 = _mdns_ne_dns_proxy_state_watch_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2 >= v3)
  {
    if (v5)
    {
      *(_DWORD *)long long buf = 134217984;
      id v8 = v1;
      _os_log_impl(&dword_23814D000, v4, OS_LOG_TYPE_INFO, "Not fetching status for stale manager -- address: %p", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)long long buf = 134217984;
      id v8 = v1;
      _os_log_impl(&dword_23814D000, v4, OS_LOG_TYPE_INFO, "Fetching status for manager -- address: %p", buf, 0xCu);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke;
    v6[3] = &unk_264D077A8;
    void v6[4] = v1;
    [v1 fetchStatusWithCompletionHandler:v6];
  }
}

void ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (a2 > 4) {
      size_t v6 = "«UNKNOWN STATUS»";
    }
    else {
      size_t v6 = off_264D077E0[a2];
    }
    *(_DWORD *)long long buf = 134218498;
    uint64_t v10 = v5;
    __int16 v11 = 2082;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    unint64_t v14 = a2;
    _os_log_impl(&dword_23814D000, v4, OS_LOG_TYPE_DEFAULT, "Fetched status for manager -- address: %p, status: %{public}s (%lld)", buf, 0x20u);
  }

  size_t v7 = _mdns_ne_dns_proxy_state_watch_queue();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke_29;
  void v8[3] = &unk_264D07780;
  void v8[4] = *(void *)(a1 + 32);
  v8[5] = a2;
  dispatch_async(v7, v8);
}

void ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke_29(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  unint64_t v3 = [(id)g_managers indexOfObjectIdenticalTo:v2];
  if (v3 >= [(id)g_managers count])
  {
    size_t v6 = _mdns_ne_dns_proxy_state_watch_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      id v8 = v2;
      _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_DEFAULT, "Not handling status update for stale manager -- address: %p", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v1 == 3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    uint64_t v5 = +[NSNumber numberWithUnsignedInt:v4];
    [(id)g_states setObject:v5 atIndexedSubscript:v3];

    _mdns_ne_dns_proxy_state_watch_check_for_collective_state_change();
  }
}

void _mdns_ne_dns_proxy_state_watch_check_for_collective_state_change()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v0 = g_current_state;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v1 = (id)g_states;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:buf count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    char v4 = 0;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v1);
        }
        int v7 = [[*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntValue:v12];
        if (v7)
        {
          if (v7 == 2)
          {

            int v8 = 2;
            goto LABEL_15;
          }
        }
        else
        {
          char v4 = 1;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:buf count:16];
    }
    while (v3);
  }
  else
  {
    char v4 = 0;
  }

  int v8 = (v4 & 1) == 0;
LABEL_15:
  if (v8 != v0)
  {
    g_current_state = v8;
    uint64_t v9 = off_264D077C8[v0];
    uint64_t v10 = off_264D077C8[v8];
    __int16 v11 = _mdns_ne_dns_proxy_state_watch_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446466;
      char v17 = v9;
      __int16 v18 = 2082;
      size_t v19 = v10;
      _os_log_impl(&dword_23814D000, v11, OS_LOG_TYPE_DEFAULT, "State change: %{public}s -> %{public}s", buf, 0x16u);
    }
  }
}

uint64_t ___mdns_ne_dns_proxy_state_watch_queue_block_invoke()
{
  _mdns_ne_dns_proxy_state_watch_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mdns.ne-dns-proxy-state-watch", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t ___mdns_ne_dns_proxy_state_watch_log_block_invoke()
{
  _mdns_ne_dns_proxy_state_watch_log_s_os_log_t log = (uint64_t)os_log_create("com.apple.mdns", "ne_dns_proxy_state_watch");

  return MEMORY[0x270F9A758]();
}

void ___mdns_ne_dns_proxy_state_watch_load_managers_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _mdns_ne_dns_proxy_state_watch_queue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___mdns_ne_dns_proxy_state_watch_load_managers_block_invoke_2;
  block[3] = &unk_264D076F0;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void ___mdns_ne_dns_proxy_state_watch_load_managers_block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v1 = *(id *)(a1 + 32);
  id v2 = objc_alloc_init((Class)&off_26EB25A58);
  uint64_t v3 = (void *)g_managers;
  g_managers = (uint64_t)v2;

  id v4 = objc_alloc_init((Class)&off_26EB25A58);
  uint64_t v5 = (void *)g_states;
  g_states = (uint64_t)v4;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)g_managers, "indexOfObjectIdenticalTo:", v11, (void)v14) == 0x7FFFFFFFFFFFFFFFLL)
        {
          [(id)g_managers addObject:v11];
          [(id)g_states addObject:&unk_26EB1B270];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v8);
  }

  _mdns_ne_dns_proxy_state_watch_check_for_collective_state_change();
  uint64_t v12 = [(id)g_managers count];
  long long v13 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_23814D000, v13, OS_LOG_TYPE_DEFAULT, "Updated DNS proxy managers -- count: %llu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 3221225472;
  size_t v19 = ___mdns_ne_dns_proxy_state_watch_handle_new_managers_block_invoke;
  uint64_t v20 = &__block_descriptor_40_e34_v32__0__NEDNSProxyManager_8Q16_B24l;
  uint64_t v21 = v12;
  [(id)g_managers enumerateObjectsUsingBlock:&buf];
}

void ___mdns_ne_dns_proxy_state_watch_handle_new_managers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 134218754;
    uint64_t v9 = a3 + 1;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_DEFAULT, "DNS proxy manager (%llu/%llu) -- address: %p, description: %@", (uint8_t *)&v8, 0x2Au);
  }

  [v5 setDelegate:0];
  _mdns_ne_dns_proxy_state_watch_fetch_manager_status(v5);
}

nw_protocol_definition_t ___mdns_get_dns_over_bytestream_protocol_definition_block_invoke()
{
  nw_protocol_definition_t result = nw_framer_create_definition("DNS over bytestream", 0, &__block_literal_global_18);
  _mdns_get_dns_over_bytestream_protocol_definition_s_framer_def = (uint64_t)result;
  return result;
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_4(int a1, nw_framer_t framer)
{
  return 1;
}

void ___mdns_create_dns_over_bytestream_framer_block_invoke_3(int a1, nw_framer_t framer, uint64_t a3, size_t a4)
{
  if (a4 < 0x10000)
  {
    *(_WORD *)output___int16 buffer = bswap32(a4) >> 16;
    nw_framer_write_output(framer, output_buffer, 2uLL);
    nw_framer_write_output_no_copy(framer, a4);
  }
  else
  {
    nw_framer_mark_failed_with_error(framer, 40);
  }
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke(int a1, nw_framer_t framer)
{
  do
  {
    if (!nw_framer_parse_input(framer, 2uLL, 2uLL, temp_buffer, &__block_literal_global_9)) {
      break;
    }
    size_t v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    id v4 = nw_framer_message_create(framer);
    LODWORD(v3) = nw_framer_deliver_input_no_copy(framer, v3, v4, 1);
    nw_release(v4);
  }
  while (v3);
  return 2;
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return 2 * (a3 > 1);
}

void *mdns_retain(void *a1)
{
  return a1;
}

uint64_t mdns_copy_description(uint64_t a1)
{
  id v1 = (void *)(a1 + 16);
  while (1)
  {
    id v1 = (void *)*v1;
    if (!v1) {
      break;
    }
    id v2 = (uint64_t (*)(void))v1[3];
    if (v2) {
      return v2();
    }
  }
  return 0;
}

uint64_t mdns_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16) && (id v4 = *(uint64_t (**)(void))(v2 + 32)) != 0) {
    return v4();
  }
  else {
    return 0;
  }
}

void mdns_free_context_finalizer(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t mdns_pf_set_thread_nat64_rules(unsigned __int8 *a1, unsigned int a2, int a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unsigned int v30 = 0;
  uint64_t thread_nat64_rule_user = _mdns_pf_create_thread_nat64_rule_user((int *)&v30);
  if (v30)
  {
    __int16 v12 = 0;
    long long v17 = 0;
    size_t v19 = 0;
    goto LABEL_19;
  }
  if (a2 >= 0x81)
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v24 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 68158210;
      *(_DWORD *)uint32_t v35 = 16;
      *(_WORD *)&v35[4] = 2096;
      *(void *)&v35[6] = a1;
      __int16 v36 = 1024;
      unsigned int v37 = a2;
      _os_log_error_impl(&dword_23814D000, v24, OS_LOG_TYPE_ERROR, "Invalid IPv6 prefix length: %{network:in6_addr}.16P/%d", buf, 0x18u);
    }
    int v10 = -6743;
    goto LABEL_33;
  }
  if ((a2 & 0x80) == 0)
  {
    uint64_t v7 = a2 >> 3;
    char v8 = a2 & 7;
    while (!(a1[v7] << v8))
    {
      char v8 = 0;
      if (++v7 == 16) {
        goto LABEL_7;
      }
    }
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v23 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 68158210;
      *(_DWORD *)uint32_t v35 = 16;
      *(_WORD *)&v35[4] = 2096;
      *(void *)&v35[6] = a1;
      __int16 v36 = 1024;
      unsigned int v37 = a2;
      _os_log_error_impl(&dword_23814D000, v23, OS_LOG_TYPE_ERROR, "Invalid IPv6 prefix: %{network:in6_addr}.16P/%d", buf, 0x18u);
    }
    int v10 = -6761;
    goto LABEL_33;
  }
LABEL_7:
  uint64_t v9 = inet_ntop(30, a1, (char *)v32, 0x2Eu);
  if (!v9)
  {
    if (*__error())
    {
      int v10 = *__error();
      if (!v10) {
        goto LABEL_10;
      }
    }
    else
    {
      int v10 = -6700;
    }
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v21 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)uint32_t v35 = v10;
      _os_log_error_impl(&dword_23814D000, v21, OS_LOG_TYPE_ERROR, "inet_ntop() for IPv6 prefix failed: %{mdns:err}ld", buf, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_10:
  snprintf((char *)__str, 0x6EuLL, "%s/%d", v9, a2);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    int v25 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_23814D000, v25, OS_LOG_TYPE_ERROR, "Failed to create destination XPC dictionary", buf, 2u);
    }
    int v10 = -6729;
LABEL_33:
    __int16 v12 = 0;
    long long v17 = 0;
    size_t v19 = 0;
    unsigned int v30 = v10;
    goto LABEL_19;
  }
  __int16 v12 = v11;
  id v13 = (const char **)MEMORY[0x263F5BA88];
  xpc_dictionary_set_string(v11, (const char *)*MEMORY[0x263F5BA88], (const char *)__str);
  unsigned int v30 = 0;
  *(_DWORD *)long long buf = a3;
  __int16 v14 = inet_ntop(2, buf, (char *)__str, 0x10u);
  if (v14) {
    goto LABEL_14;
  }
  if (!*__error())
  {
    int v15 = -6700;
    goto LABEL_35;
  }
  int v15 = *__error();
  if (v15)
  {
LABEL_35:
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    __int16 v22 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v32 = 134217984;
      uint64_t v33 = v15;
      _os_log_error_impl(&dword_23814D000, v22, OS_LOG_TYPE_ERROR, "inet_ntop() for IPv4 address failed: %{mdns:err}ld", v32, 0xCu);
    }
    goto LABEL_39;
  }
LABEL_14:
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  if (!v16)
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    __int16 v26 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v32 = 0;
      _os_log_error_impl(&dword_23814D000, v26, OS_LOG_TYPE_ERROR, "Failed to create NAT64 XPC dictionary", v32, 2u);
    }
    int v15 = -6729;
LABEL_39:
    long long v17 = 0;
    size_t v19 = 0;
    unsigned int v30 = v15;
    goto LABEL_19;
  }
  long long v17 = v16;
  xpc_dictionary_set_string(v16, *v13, v14);
  xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x263F5BA98], 0x8000uLL);
  xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x263F5BA90], 0xBFFFuLL);
  xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x263F5BAA0], 0);
  unsigned int v30 = 0;
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  if (!v18)
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v27 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__str = 0;
      _os_log_error_impl(&dword_23814D000, v27, OS_LOG_TYPE_ERROR, "Failed to create NAT64 rule XPC dictionary", __str, 2u);
    }
    size_t v19 = 0;
    unsigned int v30 = -6729;
    goto LABEL_19;
  }
  size_t v19 = v18;
  xpc_dictionary_set_uint64(v18, (const char *)*MEMORY[0x263F5BA38], 0xDuLL);
  xpc_dictionary_set_uint64(v19, (const char *)*MEMORY[0x263F5BA58], 0x1EuLL);
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x263F5BAB8], v12);
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x263F5BA70], v17);
  unsigned int v30 = 0;
  if (PFUserBeginRules() == -1)
  {
    unsigned int v30 = -6729;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v28 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)__str = 0;
    int v29 = "PFUserBeginRules() failed to create a valid transaction ID";
LABEL_78:
    _os_log_error_impl(&dword_23814D000, v28, OS_LOG_TYPE_ERROR, v29, __str, 2u);
    goto LABEL_19;
  }
  if ((PFUserAddRule() & 1) == 0)
  {
    unsigned int v30 = -6700;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v28 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)__str = 0;
    int v29 = "PFUserAddRule() failed";
    goto LABEL_78;
  }
  if ((PFUserCommitRules() & 1) == 0)
  {
    unsigned int v30 = -6700;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    uint64_t v28 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__str = 0;
      int v29 = "PFUserCommitRules() failed";
      goto LABEL_78;
    }
  }
LABEL_19:
  if (thread_nat64_rule_user) {
    PFUserRelease();
  }
  if (v12) {
    xpc_release(v12);
  }
  if (v17) {
    xpc_release(v17);
  }
  if (v19) {
    xpc_release(v19);
  }
  return v30;
}

uint64_t _mdns_pf_create_thread_nat64_rule_user(int *a1)
{
  if (_mdns_pf_queue_s_once != -1) {
    dispatch_once(&_mdns_pf_queue_s_once, &__block_literal_global_5_1121);
  }
  uint64_t v2 = PFUserCreate();
  if (v2)
  {
    int v3 = 0;
    if (a1) {
LABEL_5:
    }
      *a1 = v3;
  }
  else
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    id v5 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_23814D000, v5, OS_LOG_TYPE_ERROR, "PFUserCreate() failed to create nat64 rule user", v6, 2u);
    }
    int v3 = -6700;
    if (a1) {
      goto LABEL_5;
    }
  }
  return v2;
}

os_log_t ___mdns_pf_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "pf");
  _mdns_pf_log_s_os_log_t log = (uint64_t)result;
  return result;
}

dispatch_queue_t ___mdns_pf_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.pf-queue", 0);
  _mdns_pf_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t mdns_pf_set_thread_pass_all_rule_for_conn_tracking(const char *a1)
{
  unsigned int v14 = 0;
  uint64_t thread_filter_rule_user = _mdns_pf_create_thread_filter_rule_user((int *)&v14);
  if (v14)
  {
    id v4 = 0;
    char v8 = 0;
    goto LABEL_8;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    int v10 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_23814D000, v10, OS_LOG_TYPE_ERROR, "Failed to create conn tracking rule XPC dictionary", buf, 2u);
    }
    id v4 = 0;
    goto LABEL_25;
  }
  id v4 = v3;
  id v5 = (const char **)MEMORY[0x263F5BA38];
  xpc_dictionary_set_uint64(v3, (const char *)*MEMORY[0x263F5BA38], 0);
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x263F5BA50], 2uLL);
  id v6 = (const char **)MEMORY[0x263F5BA68];
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x263F5BA68], 1uLL);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263F5BA60], a1);
  unsigned int v14 = 0;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (!v7)
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    xpc_object_t v11 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_23814D000, v11, OS_LOG_TYPE_ERROR, "Failed to create pass IGMP rule XPC dictionary", buf, 2u);
    }
LABEL_25:
    char v8 = 0;
    unsigned int v14 = -6729;
    goto LABEL_8;
  }
  char v8 = v7;
  xpc_dictionary_set_uint64(v7, *v5, 0);
  xpc_dictionary_set_uint64(v8, (const char *)*MEMORY[0x263F5BA78], 2uLL);
  xpc_dictionary_set_uint64(v8, *v6, 1uLL);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263F5BA40], 1);
  unsigned int v14 = 0;
  if (PFUserBeginRules() == -1)
  {
    unsigned int v14 = -6729;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    __int16 v12 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    id v13 = "PFUserBeginRules() failed to create a valid transaction ID";
LABEL_42:
    _os_log_error_impl(&dword_23814D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_8;
  }
  if ((PFUserAddRule() & 1) == 0)
  {
    unsigned int v14 = -6700;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    __int16 v12 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    id v13 = "PFUserAddRule() for connection tracking failed";
    goto LABEL_42;
  }
  if ((PFUserAddRule() & 1) == 0)
  {
    unsigned int v14 = -6700;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    __int16 v12 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    id v13 = "PFUserAddRule() for pass IGMP failed";
    goto LABEL_42;
  }
  if ((PFUserCommitRules() & 1) == 0)
  {
    unsigned int v14 = -6700;
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    __int16 v12 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v13 = "PFUserCommitRules() failed";
      goto LABEL_42;
    }
  }
LABEL_8:
  if (thread_filter_rule_user) {
    PFUserRelease();
  }
  if (v4) {
    xpc_release(v4);
  }
  if (v8) {
    xpc_release(v8);
  }
  return v14;
}

uint64_t _mdns_pf_create_thread_filter_rule_user(int *a1)
{
  if (_mdns_pf_queue_s_once != -1) {
    dispatch_once(&_mdns_pf_queue_s_once, &__block_literal_global_5_1121);
  }
  uint64_t v2 = PFUserCreate();
  if (v2)
  {
    int v3 = 0;
    if (a1) {
LABEL_5:
    }
      *a1 = v3;
  }
  else
  {
    if (_mdns_pf_log_s_once != -1) {
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1104);
    }
    id v5 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_23814D000, v5, OS_LOG_TYPE_ERROR, "PFUserCreate() failed to create filter rule user", v6, 2u);
    }
    int v3 = -6700;
    if (a1) {
      goto LABEL_5;
    }
  }
  return v2;
}

uint64_t mdns_pf_delete_thread_rules()
{
  unsigned int v1 = 0;
  if (!_mdns_pf_create_thread_nat64_rule_user((int *)&v1)) {
    return v1;
  }
  PFUserDeleteRules();
  PFUserRelease();
  return 0;
}

uint64_t mdns_pf_delete_thread_pass_all_rule_for_conn_tracking()
{
  unsigned int v1 = 0;
  if (!_mdns_pf_create_thread_filter_rule_user((int *)&v1)) {
    return v1;
  }
  PFUserDeleteRules();
  PFUserRelease();
  return 0;
}

void mdns_power_cancel_all_events(const void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = IOPMCopyScheduledPowerEvents();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, i);
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"scheduledby");
        if (Value)
        {
          CFStringRef v9 = Value;
          if (CFEqual(Value, a1))
          {
            CFDateRef v10 = (const __CFDate *)CFDictionaryGetValue(ValueAtIndex, @"time");
            CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"eventtype");
            IOReturn v12 = IOPMCancelScheduledPowerEvent(v10, v9, v11);
            if (_mdns_power_log_s_once != -1) {
              dispatch_once(&_mdns_power_log_s_once, &__block_literal_global_1136);
            }
            id v13 = _mdns_power_log_s_log;
            if (v12) {
              os_log_type_t v14 = OS_LOG_TYPE_ERROR;
            }
            else {
              os_log_type_t v14 = OS_LOG_TYPE_INFO;
            }
            if (os_log_type_enabled((os_log_t)_mdns_power_log_s_log, v14))
            {
              *(_DWORD *)long long buf = 134218754;
              uint64_t v16 = v12;
              __int16 v17 = 2112;
              CFStringRef v18 = v9;
              __int16 v19 = 2112;
              CFStringRef v20 = v11;
              __int16 v21 = 2112;
              CFDateRef v22 = v10;
              _os_log_impl(&dword_23814D000, v13, v14, "IOPMCancelScheduledPowerEvent -- error: %{mdns:err}ld, id: %@, type: %@, time: %@", buf, 0x2Au);
            }
          }
        }
      }
    }
    CFRelease(v3);
  }
}

os_log_t ___mdns_power_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "power");
  _mdns_power_log_s_os_log_t log = (uint64_t)result;
  return result;
}

uint64_t mdns_power_schedule_wake(void *a1, int a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int valuePtr = a3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v7 = CFDateCreate(v5, Current + (double)a2);
  if (!v7) {
    return 4294960567;
  }
  CFDateRef v8 = v7;
  CFNumberRef v9 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
  if (v9)
  {
    CFNumberRef v10 = v9;
    *(_OWORD *)keys = xmmword_264D078E8;
    uint64_t v24 = @"leeway";
    values[0] = a1;
    values[1] = v8;
    values[2] = v9;
    CFDictionaryRef v11 = CFDictionaryCreate(v5, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v11)
    {
      CFDictionaryRef v12 = v11;
      uint64_t v13 = IOPMRequestSysWake();
      if (_mdns_power_log_s_once != -1) {
        dispatch_once(&_mdns_power_log_s_once, &__block_literal_global_1136);
      }
      os_log_type_t v14 = _mdns_power_log_s_log;
      if (v13) {
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      }
      else {
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
      }
      if (os_log_type_enabled((os_log_t)_mdns_power_log_s_log, v15))
      {
        *(_DWORD *)long long buf = 134218242;
        uint64_t v19 = (int)v13;
        __int16 v20 = 2112;
        CFDictionaryRef v21 = v12;
        _os_log_impl(&dword_23814D000, v14, v15, "IOPMRequestSysWake -- error: %{mdns:err}ld, request: %@", buf, 0x16u);
      }
      CFRelease(v12);
    }
    else
    {
      uint64_t v13 = 4294960567;
    }
    CFRelease(v8);
  }
  else
  {
    uint64_t v13 = 4294960567;
    CFNumberRef v10 = v8;
  }
  CFRelease(v10);
  return v13;
}

void _mdns_resolver_finalize(void *a1)
{
  CFArrayRef v2 = (void *)a1[6];
  if (v2)
  {
    nw_release(v2);
    a1[6] = 0;
  }
  CFArrayRef v3 = (void *)a1[8];
  if (v3)
  {
    free(v3);
    a1[8] = 0;
  }
  id v4 = (const void *)a1[7];
  if (v4)
  {
    CFRelease(v4);
    a1[7] = 0;
  }
  CFAllocatorRef v5 = a1[9];
  if (v5)
  {
    dispatch_release(v5);
    a1[9] = 0;
  }
  id v6 = (const void *)a1[10];
  if (v6)
  {
    _Block_release(v6);
    a1[10] = 0;
  }
}

void *_mdns_resolver_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2000000000;
  int v26 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  v22[3] = 0;
  id v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    CFDateRef v7 = v6;
    if (a2)
    {
      int appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1);
      *((_DWORD *)v24 + 6) = appended;
      if (appended) {
        goto LABEL_5;
      }
    }
    int v9 = mdns_string_builder_append_formatted(v7, "%s", *(const char **)(*(void *)(a1 + 16) + 48));
    *((_DWORD *)v24 + 6) = v9;
    if (v9) {
      goto LABEL_5;
    }
    CFDictionaryRef v12 = *(NSObject **)(a1 + 48);
    if (v12)
    {
      name = nw_interface_get_name(v12);
      os_log_type_t v14 = name ? name : "???";
      uint32_t index = nw_interface_get_index(*(nw_interface_t *)(a1 + 48));
      int v16 = mdns_string_builder_append_formatted(v7, " using interface %s (%u)", v14, index);
      *((_DWORD *)v24 + 6) = v16;
      if (v16) {
        goto LABEL_5;
      }
    }
    int v17 = mdns_string_builder_append_formatted(v7, " with servers [");
    *((_DWORD *)v24 + 6) = v17;
    if (v17) {
      goto LABEL_5;
    }
    CFArrayRef v18 = *(const __CFArray **)(a1 + 56);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 0x40000000;
    v20[2] = ___mdns_resolver_copy_description_block_invoke;
    v20[3] = &unk_264D07B88;
    void v20[4] = &v23;
    v20[5] = v22;
    v20[6] = v7;
    char v21 = a3;
    mdns_cfarray_enumerate(v18, (uint64_t)v20);
    if (*((_DWORD *)v24 + 6)
      || (int v19 = mdns_string_builder_append_formatted(v7, "]"), (*((_DWORD *)v24 + 6) = v19) != 0))
    {
LABEL_5:
      CFNumberRef v10 = 0;
    }
    else
    {
      CFNumberRef v10 = mdns_string_builder_copy_string((uint64_t)v7);
    }
    os_release(v7);
  }
  else
  {
    CFNumberRef v10 = 0;
  }
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v23, 8);
  return v10;
}

BOOL ___mdns_resolver_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void _mdns_server_finalize(void *a1)
{
  CFArrayRef v2 = (void *)a1[6];
  if (v2)
  {
    nw_release(v2);
    a1[6] = 0;
  }
  CFArrayRef v3 = (void *)a1[7];
  if (v3)
  {
    nw_release(v3);
    a1[7] = 0;
  }
  id v4 = (void *)a1[8];
  if (v4)
  {
    CFAllocatorRef v5 = (void *)*v4;
    if (*v4)
    {
      do
      {
        id v6 = (void *)*v5;
        _pqw_qname_item_free(v5);
        CFAllocatorRef v5 = v6;
      }
      while (v6);
    }
    free(v4);
    a1[8] = 0;
  }
}

void _pqw_qname_item_free(void *a1)
{
  CFArrayRef v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }

  free(a1);
}

void *_mdns_server_copy_description(uint64_t a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    CFDateRef v7 = v6;
    if (!a2
      || !mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a1 + 48)) == nw_endpoint_type_address)
      {
        address = nw_endpoint_get_address(*(nw_endpoint_t *)(a1 + 48));
        if (*(unsigned char *)(a1 + 111)) {
          char v9 = a3 | 2;
        }
        else {
          char v9 = a3;
        }
        if (!mdns_string_builder_append_sockaddr_description(v7, (uint64_t)address, v9))
        {
LABEL_18:
          CFNumberRef v10 = mdns_string_builder_copy_string((uint64_t)v7);
          goto LABEL_19;
        }
      }
      else
      {
        hostname = nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 48));
        CFDictionaryRef v12 = "«MISSING HOSTNAME»";
        if (hostname)
        {
          CFDictionaryRef v12 = hostname;
          if (a3)
          {
            int v13 = DNSMessagePrintObfuscatedString((uint64_t)v16, 64, hostname);
            CFDictionaryRef v12 = "«REDACTED HOSTNAME»";
            if (v13 >= 0) {
              CFDictionaryRef v12 = v16;
            }
          }
        }
        if (!mdns_string_builder_append_formatted(v7, "%s", v12))
        {
          if (*(unsigned char *)(a1 + 111)) {
            goto LABEL_18;
          }
          int port = nw_endpoint_get_port(*(nw_endpoint_t *)(a1 + 48));
          if (!mdns_string_builder_append_formatted(v7, ":%u", port)) {
            goto LABEL_18;
          }
        }
      }
    }
    CFNumberRef v10 = 0;
LABEL_19:
    os_release(v7);
    return v10;
  }
  return 0;
}

void _mdns_session_finalize(uint64_t a1)
{
  CFArrayRef v2 = *(void **)(a1 + 32);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 32) = 0;
  }
  *(void *)(a1 + 48) = 0;
}

void *_mdns_session_copy_description(void *a1, int a2)
{
  id v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  CFAllocatorRef v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
    id v6 = 0;
  }
  else {
    id v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

void *mdns_resolver_create(int a1, int a2, int *a3)
{
  switch(a1)
  {
    case 1:
      CFAllocatorRef v5 = (void *)_os_object_alloc();
      id v6 = v5;
      if (!v5) {
        goto LABEL_35;
      }
      CFDateRef v7 = &_mdns_normal_resolver_kind;
      v5[2] = &_mdns_normal_resolver_kind;
      do
      {
        CFDateRef v8 = (void (*)(void *))v7[2];
        if (v8) {
          v8(v6);
        }
        CFDateRef v7 = (_UNKNOWN **)*v7;
      }
      while (v7);
      goto LABEL_26;
    case 2:
      CFAllocatorRef v5 = (void *)_os_object_alloc();
      id v6 = v5;
      if (!v5) {
        goto LABEL_35;
      }
      CFNumberRef v10 = &_mdns_tcp_resolver_kind;
      v5[2] = &_mdns_tcp_resolver_kind;
      do
      {
        CFDictionaryRef v11 = (void (*)(void *))v10[2];
        if (v11) {
          v11(v6);
        }
        CFNumberRef v10 = (_UNKNOWN **)*v10;
      }
      while (v10);
      goto LABEL_26;
    case 3:
      CFAllocatorRef v5 = (void *)_os_object_alloc();
      id v6 = v5;
      if (!v5) {
        goto LABEL_35;
      }
      CFDictionaryRef v12 = &_mdns_tls_resolver_kind;
      v5[2] = &_mdns_tls_resolver_kind;
      do
      {
        int v13 = (void (*)(void *))v12[2];
        if (v13) {
          v13(v6);
        }
        CFDictionaryRef v12 = (_UNKNOWN **)*v12;
      }
      while (v12);
      goto LABEL_26;
    case 4:
      CFAllocatorRef v5 = (void *)_os_object_alloc();
      id v6 = v5;
      if (v5)
      {
        os_log_type_t v14 = &_mdns_https_resolver_kind;
        v5[2] = &_mdns_https_resolver_kind;
        do
        {
          os_log_type_t v15 = (void (*)(void *))v14[2];
          if (v15) {
            v15(v6);
          }
          os_log_type_t v14 = (_UNKNOWN **)*v14;
        }
        while (v14);
LABEL_26:
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &mdns_cfarray_callbacks);
        void v6[7] = Mutable;
        if (Mutable)
        {
          if (!a2 || (uint64_t v17 = nw_interface_create_with_index(), (v6[6] = v17) != 0))
          {
            CFAllocatorRef v5 = 0;
            int v9 = 0;
            goto LABEL_30;
          }
          int v9 = -6700;
        }
        else
        {
          int v9 = -6729;
        }
        CFAllocatorRef v5 = v6;
        id v6 = 0;
      }
      else
      {
LABEL_35:
        int v9 = -6728;
      }
LABEL_30:
      if (a3) {
        *a3 = v9;
      }
      if (v5) {
        os_release(v5);
      }
      return v6;
    default:
      CFAllocatorRef v5 = 0;
      id v6 = 0;
      int v9 = -6756;
      goto LABEL_30;
  }
}

uint64_t _mdns_https_resolver_get_client_address(uint64_t a1)
{
  return a1 + 200;
}

uint64_t _mdns_https_resolver_get_custom_port(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 228);
}

uint64_t _mdns_https_resolver_get_effective_connection_hostname(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 152);
  if (!result) {
    return *(void *)(a1 + 144);
  }
  return result;
}

nw_parameters_t _mdns_https_resolver_get_stream_params(void *a1, int *a2)
{
  nw_parameters_t v3 = (nw_parameters_t)a1[23];
  if (!v3)
  {
    if (a1[18])
    {
      uint64_t v13 = 0;
      os_log_type_t v14 = &v13;
      uint64_t v15 = 0x2000000000;
      char v16 = 0;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 0x40000000;
      v12[2] = ___mdns_https_resolver_create_stream_params_block_invoke;
      v12[3] = &unk_264D07AD8;
      v12[4] = &v13;
      void v12[5] = a1;
      nw_parameters_t tcp = _mdns_nw_parameters_create_tcp(v12);
      if (!tcp)
      {
        _Block_object_dispose(&v13, 8);
        int v4 = -6729;
        goto LABEL_20;
      }
      nw_parameters_t v3 = tcp;
      int v8 = *((unsigned __int8 *)v14 + 24);
      _Block_object_dispose(&v13, 8);
      if (!v8)
      {
        nw_release(v3);
        int v4 = -6700;
LABEL_20:
        nw_parameters_t v3 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      nw_parameters_t v3 = _mdns_nw_parameters_create_tcp((void *)*MEMORY[0x263F14468]);
      if (!v3)
      {
        int v4 = -6729;
        goto LABEL_17;
      }
    }
    CFDictionaryRef v11 = 0;
    int v9 = (const char *)a1[20];
    if (!v9) {
      int v9 = "";
    }
    asprintf(&v11, "https://%s%s", (const char *)a1[18], v9);
    nw_parameters_set_url();
    if (v11) {
      free(v11);
    }
    CFNumberRef v10 = a1[6];
    if (v10) {
      nw_parameters_require_interface(v3, v10);
    }
    int v4 = 0;
LABEL_17:
    a1[23] = v3;
    if (!a2) {
      return v3;
    }
    goto LABEL_3;
  }
  int v4 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v4;
  return v3;
}

void ___mdns_https_resolver_create_stream_params_block_invoke(uint64_t a1, id a2)
{
  nw_parameters_t v3 = a2;
  if (v3)
  {
    int v4 = v3;
    sec_protocol_options_set_tls_server_name(v3, *(const char **)(*(void *)(a1 + 40) + 144));
    sec_protocol_options_set_peer_authentication_required(v4, 1);
    sec_protocol_options_add_tls_application_protocol(v4, "h2");
    sec_release(v4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

nw_parameters_t _mdns_nw_parameters_create_tcp(void *a1)
{
  secure_nw_parameters_t tcp = nw_parameters_create_secure_tcp(a1, (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14468]);
  if (secure_tcp)
  {
    nw_parameters_set_indefinite();
    nw_parameters_set_no_wake_from_sleep();
  }
  return secure_tcp;
}

uint64_t _mdns_https_resolver_update_odoh_config_async(void *a1, char *__s1, char *a3, const void *a4, size_t a5, void *a6)
{
  CFNumberRef v10 = a3;
  if (__s1)
  {
    CFDictionaryRef v12 = strdup(__s1);
    if (!v12) {
      goto LABEL_14;
    }
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    CFNumberRef v10 = strdup(v10);
    if (v10) {
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
LABEL_15:
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
LABEL_13:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___mdns_https_resolver_update_odoh_config_async_block_invoke;
    block[3] = &__block_descriptor_tmp_44_1240;
    void block[4] = v12;
    void block[5] = a1;
    block[6] = v10;
    void block[7] = v6;
    block[8] = a6;
    dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
    return 0;
  }
  CFDictionaryRef v12 = 0;
  if (a3) {
    goto LABEL_6;
  }
LABEL_7:
  xpc_object_t v6 = 0;
  if (!a4 || !a5 || (xpc_object_t v6 = xpc_data_create(a4, a5)) != 0)
  {
    if (a6) {
      nw_retain(a6);
    }
    os_retain(a1);
    if (_mdns_resolver_queue_s_once == -1) {
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  if (v12) {
    free(v12);
  }
  if (v10) {
    free(v10);
  }
  return 4294960567;
}

void ___mdns_https_resolver_update_odoh_config_async_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = a1[5];
    int v4 = *(void **)(v3 + 144);
    if (v4)
    {
      free(v4);
      *(void *)(a1[5] + 144) = 0;
      uint64_t v2 = a1[4];
      uint64_t v3 = a1[5];
    }
    *(void *)(v3 + 144) = v2;
  }
  uint64_t v5 = a1[6];
  if (v5)
  {
    uint64_t v6 = a1[5];
    CFDateRef v7 = *(void **)(v6 + 160);
    if (v7)
    {
      free(v7);
      *(void *)(a1[5] + 160) = 0;
      uint64_t v6 = a1[5];
      uint64_t v5 = a1[6];
    }
    *(void *)(v6 + 160) = v5;
  }
  int v8 = (void *)a1[5];
  CFNumberRef v10 = (void *)a1[7];
  int v9 = (void *)a1[8];
  CFDictionaryRef v11 = (void *)v8[23];
  if (v11)
  {
    nw_release(v11);
    v8[23] = 0;
  }
  CFDictionaryRef v12 = (void *)v8[21];
  if (v12 != v10)
  {
    if (v12) {
      xpc_release(v12);
    }
    v8[21] = v10;
    if (v10) {
      xpc_retain(v10);
    }
  }
  uint64_t v13 = (void *)v8[22];
  if (v13 != v9)
  {
    if (v13) {
      nw_release(v13);
    }
    v8[22] = v9;
    if (v9) {
      nw_retain(v9);
    }
  }
  os_log_type_t v14 = (void *)a1[7];
  if (v14) {
    xpc_release(v14);
  }
  uint64_t v15 = (void *)a1[8];
  if (v15) {
    nw_release(v15);
  }
  char v16 = (void *)a1[5];

  os_release(v16);
}

dispatch_queue_t ___mdns_resolver_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mdns.resolver-queue", 0);
  _mdns_resolver_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t _mdns_https_resolver_set_identity(uint64_t a1, UInt8 *bytes, CFIndex length)
{
  unsigned int v7 = 0;
  if (bytes)
  {
    CFTypeRef v4 = _mdns_copy_sec_identity(bytes, length, (int *)&v7);
    uint64_t result = v7;
    if (v7) {
      return result;
    }
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  uint64_t v6 = *(const void **)(a1 + 192);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t result = 0;
  *(void *)(a1 + 192) = v4;
  return result;
}

CFTypeRef _mdns_copy_sec_identity(UInt8 *bytes, CFIndex length, int *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  CFDataRef v4 = CFDataCreate(0, bytes, length);
  if (!v4)
  {
LABEL_21:
    CFTypeRef v11 = 0;
    int v13 = -6729;
    if (!a3) {
      return v11;
    }
    goto LABEL_14;
  }
  CFDataRef v5 = v4;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    CFRelease(v5);
    goto LABEL_21;
  }
  unsigned int v7 = Mutable;
  int v8 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F17530], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x263F175B0], v5);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171D0]);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x263F17590], v8);
  OSStatus v9 = SecItemCopyMatching(v7, &result);
  if (v9)
  {
    int v13 = v9;
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    char v16 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      CFDataRef v21 = v5;
      __int16 v22 = 2048;
      CFStringRef v23 = (CFStringRef)v13;
      _os_log_error_impl(&dword_23814D000, v16, OS_LOG_TYPE_ERROR, "Failed to find identity item -- reference: %@, error: %{mdns:err}ld", buf, 0x16u);
    }
    CFTypeRef v11 = 0;
  }
  else if (result && (CFTypeID v10 = CFGetTypeID(result), v10 == SecIdentityGetTypeID()))
  {
    CFTypeRef v11 = result;
    CFTypeRef result = 0;
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    CFDictionaryRef v12 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      CFDataRef v21 = v5;
      _os_log_debug_impl(&dword_23814D000, v12, OS_LOG_TYPE_DEBUG, "Found identity with reference %@", buf, 0xCu);
    }
    int v13 = 0;
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v15 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_FAULT))
    {
      if (result)
      {
        CFTypeID v18 = CFGetTypeID(result);
        CFStringRef v17 = CFCopyTypeIDDescription(v18);
      }
      else
      {
        CFStringRef v17 = @"none";
      }
      *(_DWORD *)long long buf = 138412546;
      CFDataRef v21 = v5;
      __int16 v22 = 2114;
      CFStringRef v23 = v17;
      _os_log_fault_impl(&dword_23814D000, v15, OS_LOG_TYPE_FAULT, "Unexpected identity item type -- reference: %@, type: %{public}@", buf, 0x16u);
    }
    CFTypeRef v11 = 0;
    int v13 = -6756;
  }
  CFRelease(v5);
  CFRelease(v7);
  if (result) {
    CFRelease(result);
  }
  if (a3) {
LABEL_14:
  }
    *a3 = v13;
  return v11;
}

os_log_t ___mdns_resolver_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "resolver");
  _mdns_resolver_log_s_os_log_t log = (uint64_t)result;
  return result;
}

uint64_t _mdns_https_resolver_set_url_path(uint64_t a1, char *a2)
{
  return 0;
}

uint64_t _mdns_https_resolver_set_port(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 228) = a2;
  return result;
}

uint64_t _mdns_https_resolver_set_connection_hostname(uint64_t a1, char *a2)
{
  return 0;
}

uint64_t _mdns_https_resolver_set_provider_name(uint64_t a1, char *a2)
{
  return 0;
}

void _mdns_https_resolver_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[18];
  if (v2)
  {
    free(v2);
    a1[18] = 0;
  }
  uint64_t v3 = (void *)a1[19];
  if (v3)
  {
    free(v3);
    a1[19] = 0;
  }
  CFDataRef v4 = (void *)a1[20];
  if (v4)
  {
    free(v4);
    a1[20] = 0;
  }
  CFDataRef v5 = (void *)a1[21];
  if (v5)
  {
    xpc_release(v5);
    a1[21] = 0;
  }
  uint64_t v6 = (void *)a1[22];
  if (v6)
  {
    nw_release(v6);
    a1[22] = 0;
  }
  unsigned int v7 = (void *)a1[23];
  if (v7)
  {
    nw_release(v7);
    a1[23] = 0;
  }
  int v8 = (const void *)a1[24];
  if (v8)
  {
    CFRelease(v8);
    a1[24] = 0;
  }
}

uint64_t _mdns_tls_resolver_get_custom_port(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 176);
}

uint64_t _mdns_tls_resolver_get_effective_connection_hostname(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 152);
  if (!result) {
    return *(void *)(a1 + 144);
  }
  return result;
}

nw_parameters_t _mdns_tls_resolver_get_stream_params(void *a1, int *a2)
{
  nw_parameters_t v3 = (nw_parameters_t)a1[20];
  if (!v3)
  {
    if (a1[18] || a1[21])
    {
      uint64_t v11 = 0;
      CFDictionaryRef v12 = &v11;
      uint64_t v13 = 0x2000000000;
      char v14 = 0;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 0x40000000;
      v10[2] = ___mdns_tls_resolver_create_stream_params_block_invoke;
      void v10[3] = &unk_264D07A90;
      v10[4] = &v11;
      void v10[5] = a1;
      nw_parameters_t tcp = _mdns_nw_parameters_create_tcp(v10);
      if (!tcp)
      {
        _Block_object_dispose(&v11, 8);
        int v4 = -6729;
LABEL_19:
        nw_parameters_t v3 = 0;
        goto LABEL_12;
      }
      nw_parameters_t v3 = tcp;
      int v8 = *((unsigned __int8 *)v12 + 24);
      _Block_object_dispose(&v11, 8);
      if (!v8)
      {
        int v4 = -6777;
LABEL_18:
        nw_release(v3);
        goto LABEL_19;
      }
    }
    else
    {
      nw_parameters_t v3 = _mdns_nw_parameters_create_tcp((void *)*MEMORY[0x263F14468]);
      if (!v3)
      {
        int v4 = -6729;
        goto LABEL_12;
      }
    }
    OSStatus v9 = a1[6];
    if (v9) {
      nw_parameters_require_interface(v3, v9);
    }
    int v4 = _mdns_add_dns_over_bytestream_framer(v3);
    if (!v4)
    {
LABEL_12:
      a1[20] = v3;
      if (!a2) {
        return v3;
      }
      goto LABEL_3;
    }
    goto LABEL_18;
  }
  int v4 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v4;
  return v3;
}

void ___mdns_tls_resolver_create_stream_params_block_invoke(uint64_t a1, id a2)
{
  nw_parameters_t v3 = a2;
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(const char **)(v5 + 144);
    if (v6)
    {
      sec_protocol_options_set_tls_server_name(v3, v6);
      sec_protocol_options_set_peer_authentication_required(v4, 1);
      uint64_t v5 = *(void *)(a1 + 40);
    }
    unsigned int v7 = *(NSObject **)(v5 + 168);
    if (v7)
    {
      sec_protocol_options_set_local_identity(v4, v7);
      uint64_t v5 = *(void *)(a1 + 40);
    }
    verify_block[0] = MEMORY[0x263EF8330];
    verify_block[1] = 0x40000000;
    verify_block[2] = ___mdns_tls_resolver_create_stream_params_block_invoke_2;
    verify_block[3] = &__block_descriptor_tmp_39_1266;
    verify_void block[4] = v5;
    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
    }
    sec_protocol_options_set_verify_block(v4, verify_block, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    sec_release(v4);
  }
}

uint64_t _mdns_add_dns_over_bytestream_framer(NSObject *a1)
{
  nw_protocol_stack_t v1 = nw_parameters_copy_default_protocol_stack(a1);
  if (!v1) {
    return 4294960567;
  }
  uint64_t v2 = v1;
  if (_mdns_copy_dns_over_bytestream_framer_s_once != -1) {
    dispatch_once(&_mdns_copy_dns_over_bytestream_framer_s_once, &__block_literal_global_12);
  }
  if (!_mdns_copy_dns_over_bytestream_framer_s_framer_def
    || (nw_retain((void *)_mdns_copy_dns_over_bytestream_framer_s_framer_def),
        (nw_parameters_t v3 = (void *)_mdns_copy_dns_over_bytestream_framer_s_framer_def) == 0))
  {
    uint64_t v5 = 4294960567;
    nw_protocol_options_t options = v2;
LABEL_9:
    nw_release(options);
    return v5;
  }
  nw_protocol_options_t options = nw_framer_create_options((nw_protocol_definition_t)_mdns_copy_dns_over_bytestream_framer_s_framer_def);
  if (options)
  {
    nw_protocol_stack_prepend_application_protocol(v2, options);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 4294960567;
  }
  nw_release(v2);
  nw_release(v3);
  if (options) {
    goto LABEL_9;
  }
  return v5;
}

nw_protocol_definition_t ___mdns_copy_dns_over_bytestream_framer_block_invoke()
{
  nw_protocol_definition_t result = nw_framer_create_definition("DNS over byte-stream", 0, &__block_literal_global_29);
  _mdns_copy_dns_over_bytestream_framer_s_framer_def = (uint64_t)result;
  return result;
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_1257(int a1, nw_framer_t framer)
{
  return 1;
}

void _mdns_normal_resolver_kind_block_invoke_3(int a1, nw_framer_t framer, uint64_t a3, size_t a4)
{
  if (a4 < 0x10000)
  {
    *(_WORD *)output___int16 buffer = bswap32(a4) >> 16;
    nw_framer_write_output(framer, output_buffer, 2uLL);
    nw_framer_write_output_no_copy(framer, a4);
  }
  else
  {
    nw_framer_mark_failed_with_error(framer, 40);
  }
}

uint64_t _mdns_normal_resolver_kind_block_invoke(int a1, nw_framer_t framer)
{
  do
  {
    if (!nw_framer_parse_input(framer, 2uLL, 2uLL, temp_buffer, &__block_literal_global_20_1262)) {
      break;
    }
    size_t v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    int v4 = nw_framer_message_create(framer);
    LODWORD(v3) = nw_framer_deliver_input_no_copy(framer, v3, v4, 1);
    nw_release(v4);
  }
  while (v3);
  return 2;
}

uint64_t _mdns_normal_resolver_kind_block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return 2 * (a3 > 1);
}

void ___mdns_tls_resolver_create_stream_params_block_invoke_2(uint64_t a1, int a2, sec_trust_t trust, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = sec_trust_copy_ref(trust);
  OSStatus Allowed = SecTrustSetNetworkFetchAllowed(v6, 0);
  if (Allowed)
  {
    OSStatus v9 = Allowed;
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    CFTypeID v10 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 144);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    CFDictionaryRef v12 = "Failed to disable network fetch for trust evaluation -- provider name: %s, error: %{mdns:err}ld";
LABEL_18:
    _os_log_error_impl(&dword_23814D000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
    goto LABEL_15;
  }
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  result[0] = MEMORY[0x263EF8330];
  result[1] = 0x40000000;
  result[2] = ___mdns_tls_resolver_create_stream_params_block_invoke_35;
  result[3] = &unk_264D07A48;
  result[4] = a4;
  OSStatus v8 = SecTrustEvaluateAsyncWithError(v6, (dispatch_queue_t)_mdns_resolver_queue_s_queue, result);
  if (!v8)
  {
    if (!v6) {
      return;
    }
    goto LABEL_6;
  }
  OSStatus v13 = v8;
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  CFTypeID v10 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 144);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v17 = v14;
    __int16 v18 = 2048;
    uint64_t v19 = v13;
    CFDictionaryRef v12 = "Failed to start aynchronous trust evaluation -- provider name: %s, error: %{mdns:err}ld";
    goto LABEL_18;
  }
LABEL_15:
  (*(void (**)(uint64_t, void))(a4 + 16))(a4, 0);
  if (v6) {
LABEL_6:
  }
    CFRelease(v6);
}

uint64_t ___mdns_tls_resolver_create_stream_params_block_invoke_35(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ((a3 & 1) == 0)
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v6 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = a4;
      _os_log_error_impl(&dword_23814D000, v6, OS_LOG_TYPE_ERROR, "Aynchronous trust evaluation failed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t _mdns_tls_resolver_set_identity(uint64_t a1, UInt8 *bytes, CFIndex length)
{
  unsigned int v8 = 0;
  if (bytes)
  {
    int v4 = (__SecIdentity *)_mdns_copy_sec_identity(bytes, length, (int *)&v8);
    uint64_t result = v8;
    if (v8) {
      return result;
    }
    sec_identity_t v6 = sec_identity_create(v4);
    if (v4) {
      CFRelease(v4);
    }
    if (!v6) {
      return 4294960567;
    }
  }
  else
  {
    sec_identity_t v6 = 0;
  }
  unsigned int v7 = *(void **)(a1 + 168);
  if (v7) {
    sec_release(v7);
  }
  uint64_t result = 0;
  *(void *)(a1 + 168) = v6;
  return result;
}

uint64_t _mdns_tls_resolver_set_port(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 176) = a2;
  return result;
}

uint64_t _mdns_tls_resolver_set_connection_hostname(uint64_t a1, char *a2)
{
  return 0;
}

uint64_t _mdns_tls_resolver_set_provider_name(uint64_t a1, char *a2)
{
  return 0;
}

void _mdns_tls_resolver_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[18];
  if (v2)
  {
    free(v2);
    a1[18] = 0;
  }
  size_t v3 = (void *)a1[19];
  if (v3)
  {
    free(v3);
    a1[19] = 0;
  }
  int v4 = (void *)a1[20];
  if (v4)
  {
    nw_release(v4);
    a1[20] = 0;
  }
  uint64_t v5 = (void *)a1[21];
  if (v5)
  {
    sec_release(v5);
    a1[21] = 0;
  }
}

NSObject *_mdns_tcp_resolver_get_stream_params(uint64_t a1, int *a2)
{
  uint64_t result = *(NSObject **)(a1 + 144);
  if (!result && (v6 = 0, uint64_t result = _mdns_create_tcp_parameters(&v6), *(void *)(a1 + 144) = result, (v5 = v6) != 0))
  {
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
  }
  else
  {
    int v5 = 0;
    if (!a2) {
      return result;
    }
  }
  *a2 = v5;
  return result;
}

NSObject *_mdns_create_tcp_parameters(int *a1)
{
  nw_parameters_t tcp = _mdns_nw_parameters_create_tcp((void *)*MEMORY[0x263F14480]);
  size_t v3 = tcp;
  if (tcp)
  {
    int v4 = _mdns_add_dns_over_bytestream_framer(tcp);
    if (v4)
    {
      nw_release(v3);
      size_t v3 = 0;
    }
    else
    {
      nw_parameters_set_prefer_no_proxy(v3, 1);
    }
  }
  else
  {
    int v4 = -6729;
  }
  if (a1) {
    *a1 = v4;
  }
  return v3;
}

void _mdns_tcp_resolver_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  if (v2)
  {
    nw_release(v2);
    *(void *)(a1 + 144) = 0;
  }
}

NSObject *_mdns_normal_resolver_get_stream_params(uint64_t a1, int *a2)
{
  uint64_t result = *(NSObject **)(a1 + 152);
  if (!result && (v6 = 0, uint64_t result = _mdns_create_tcp_parameters(&v6), *(void *)(a1 + 152) = result, (v5 = v6) != 0))
  {
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
  }
  else
  {
    int v5 = 0;
    if (!a2) {
      return result;
    }
  }
  *a2 = v5;
  return result;
}

nw_parameters_t _mdns_normal_resolver_get_datagram_params(uint64_t a1, int *a2)
{
  nw_parameters_t secure_udp = *(nw_parameters_t *)(a1 + 144);
  if (secure_udp)
  {
    int v4 = 0;
    if (a2) {
LABEL_3:
    }
      *a2 = v4;
  }
  else
  {
    nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14480], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14468]);
    if (secure_udp)
    {
      nw_parameters_set_no_wake_from_sleep();
      int v4 = 0;
    }
    else
    {
      int v4 = -6729;
    }
    *(void *)(a1 + 144) = secure_udp;
    if (a2) {
      goto LABEL_3;
    }
  }
  return secure_udp;
}

void _mdns_normal_resolver_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  if (v2)
  {
    nw_release(v2);
    *(void *)(a1 + 144) = 0;
  }
  size_t v3 = *(void **)(a1 + 152);
  if (v3)
  {
    nw_release(v3);
    *(void *)(a1 + 152) = 0;
  }
}

void mdns_resolver_set_queue(uint64_t a1, dispatch_object_t object)
{
  if (!*(unsigned char *)(a1 + 137))
  {
    dispatch_retain(object);
    int v4 = *(NSObject **)(a1 + 72);
    if (v4) {
      dispatch_release(v4);
    }
    *(void *)(a1 + 72) = object;
  }
}

void mdns_resolver_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 137))
  {
    if (aBlock) {
      size_t v3 = _Block_copy(aBlock);
    }
    else {
      size_t v3 = 0;
    }
    int v4 = *(const void **)(a1 + 80);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 80) = v3;
  }
}

uint64_t mdns_resolver_set_provider_name(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 137)) {
    return 4294960577;
  }
  nw_protocol_stack_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 56);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t mdns_resolver_set_connection_hostname(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 137)) {
    return 4294960577;
  }
  nw_protocol_stack_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 64);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t mdns_resolver_set_port(uint64_t result)
{
  if (!*(unsigned char *)(result + 137))
  {
    nw_protocol_stack_t v1 = *(uint64_t (**)(void))(*(void *)(result + 16) + 72);
    if (v1) {
      return v1();
    }
  }
  return result;
}

uint64_t mdns_resolver_set_url_path(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 137)) {
    return 4294960577;
  }
  nw_protocol_stack_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 80);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t mdns_resolver_set_identity_reference(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 137)) {
    return 4294960577;
  }
  nw_protocol_stack_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 88);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t mdns_resolver_update_odoh_config(uint64_t a1)
{
  nw_protocol_stack_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 96);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t mdns_resolver_set_squash_cnames(uint64_t result, char a2)
{
  if (!*(unsigned char *)(result + 137)) {
    *(unsigned char *)(result + 133) = a2;
  }
  return result;
}

uint64_t mdns_resolver_enable_symptom_reporting(uint64_t result, char a2)
{
  if (!*(unsigned char *)(result + 137)) {
    *(unsigned char *)(result + 132) = a2;
  }
  return result;
}

uint64_t mdns_resolver_add_server_address(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 137)) {
    return 4294960577;
  }
  *(_DWORD *)&v9[24] = 0;
  *(void *)&v9[16] = 0;
  size_t v3 = (_OWORD *)(a2 + 24);
  int v4 = *(unsigned __int8 *)(a2 + 25);
  if (v4 == 30)
  {
    *(_OWORD *)uint64_t v9 = *v3;
    *(_OWORD *)&v9[12] = *(_OWORD *)(a2 + 36);
  }
  else
  {
    if (v4 != 2) {
      return 4294960540;
    }
    *(_OWORD *)uint64_t v9 = *v3;
  }
  if (!*(_WORD *)&v9[2]) {
    *(_WORD *)&v9[2] = bswap32(*(unsigned __int16 *)(*(void *)(a1 + 16) + 156)) >> 16;
  }
  nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)v9);
  if (!address) {
    return 4294960596;
  }
  nw_endpoint_t v6 = address;
  if (*(void *)(a1 + 48)) {
    nw_endpoint_set_interface();
  }
  uint64_t v7 = _mdns_resolver_add_server_by_endpoint(a1, v6);
  nw_release(v6);
  return v7;
}

uint64_t _mdns_resolver_add_server_by_endpoint(uint64_t a1, void *a2)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (Count > 31) {
    return 4294960532;
  }
  int v5 = Count;
  uint64_t v6 = _os_object_alloc();
  if (!v6) {
    return 4294960568;
  }
  uint64_t v7 = v6;
  unsigned int v8 = &_mdns_server_kind;
  *(void *)(v6 + 16) = &_mdns_server_kind;
  do
  {
    uint64_t v9 = (void (*)(uint64_t))v8[2];
    if (v9) {
      v9(v7);
    }
    unsigned int v8 = (_UNKNOWN **)*v8;
  }
  while (v8);
  *(void *)(v7 + 48) = a2;
  nw_retain(a2);
  uint64_t v10 = *(void *)(a1 + 16);
  if (*(_WORD *)(v10 + 156))
  {
    int v11 = *(unsigned __int16 *)(v10 + 156);
    if (nw_endpoint_get_port(*(nw_endpoint_t *)(v7 + 48)) == v11) {
      *(unsigned char *)(v7 + 111) = 1;
    }
  }
  *(_DWORD *)(v7 + 100) = v5 + 1;
  uint64_t v12 = mach_continuous_time();
  if (mdns_mach_ticks_per_second_s_once != -1) {
    dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
  }
  uint64_t v13 = v12 - 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
  *(void *)(v7 + 80) = v13;
  *(void *)(v7 + 88) = v13;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), (const void *)v7);
  os_release((void *)v7);
  return 0;
}

uint64_t mdns_resolver_set_initial_datagram_retransmission_interval(uint64_t result, unsigned int a2)
{
  if (!*(unsigned char *)(result + 137))
  {
    int v2 = 1000 * a2;
    if (a2 >= 0x418938) {
      int v2 = -1;
    }
    *(_DWORD *)(result + 124) = v2;
  }
  return result;
}

uint64_t mdns_resolver_disable_connection_reuse(uint64_t result, char a2)
{
  if (!*(unsigned char *)(result + 137)) {
    *(unsigned char *)(result + 138) = a2;
  }
  return result;
}

uint64_t mdns_resolver_enable_problematic_qtype_workaround(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 137))
  {
    if (a2 >= 0x64) {
      int v2 = 100;
    }
    else {
      int v2 = a2;
    }
    if (a2 <= 0) {
      int v2 = 0;
    }
    *(_DWORD *)(result + 128) = v2;
  }
  return result;
}

void mdns_resolver_activate(unsigned char *a1)
{
  if (!a1[137])
  {
    a1[137] = 1;
    os_retain(a1);
    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __mdns_resolver_activate_block_invoke;
    block[3] = &__block_descriptor_tmp_1309;
    void block[4] = a1;
    dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
  }
}

void __mdns_resolver_activate_block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 136) && !*(unsigned char *)(v1 + 135))
  {
    *(unsigned char *)(v1 + 135) = 1;
    if (*(void *)(v1 + 80) && !*(void *)(v1 + 72))
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      __int16 v18 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_23814D000, v18, OS_LOG_TYPE_ERROR, "API misuse: an event handler without a queue is useless!", buf, 2u);
      }
      uint64_t v19 = *(const void **)(v1 + 80);
      if (v19)
      {
        _Block_release(v19);
        *(void *)(v1 + 80) = 0;
      }
    }
    if (!*(_DWORD *)(v1 + 124)) {
      *(_DWORD *)(v1 + 124) = 1000;
    }
    if (CFArrayGetCount(*(CFArrayRef *)(v1 + 56)) <= 0)
    {
      uint64_t v14 = *(uint64_t (**)(uint64_t))(*(void *)(v1 + 16) + 120);
      if (v14)
      {
        if (v14(v1))
        {
          uint64_t v15 = *(uint64_t (**)(uint64_t))(*(void *)(v1 + 16) + 128);
          if (v15) {
            v15(v1);
          }
          host_with_numeric_int port = nw_endpoint_create_host_with_numeric_port();
          if (host_with_numeric_port)
          {
            uint64_t v17 = (void *)host_with_numeric_port;
            if (*(void *)(v1 + 48)) {
              nw_endpoint_set_interface();
            }
            _mdns_resolver_add_server_by_endpoint(v1, v17);
            nw_release(v17);
          }
        }
      }
    }
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 56));
    if (Count >= 1)
    {
      CFIndex v3 = Count;
      CFIndex v4 = 0;
      int v5 = (void *)(v1 + 24);
      do
      {
        CFDictionaryRef ValueAtIndex = (char *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 56), v4);
        *((void *)ValueAtIndex + 3) = 0;
        *int v5 = ValueAtIndex;
        if (nw_endpoint_get_type(*((nw_endpoint_t *)ValueAtIndex + 6)) == nw_endpoint_type_address)
        {
          evaluator_for_nw_endpoint_t endpoint = nw_path_create_evaluator_for_endpoint();
          *((void *)ValueAtIndex + 7) = evaluator_for_endpoint;
          if (evaluator_for_endpoint)
          {
            if (_mdns_resolver_queue_s_once != -1) {
              dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
            }
            nw_path_evaluator_set_queue();
            os_retain((void *)v1);
            os_retain(ValueAtIndex);
            if (_mdns_resolver_queue_s_once != -1) {
              dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
            }
            *(void *)long long buf = MEMORY[0x263EF8330];
            *(void *)&uint8_t buf[8] = 0x40000000;
            *(void *)&uint8_t buf[16] = ___mdns_resolver_set_up_server_path_evaluator_block_invoke;
            __int16 v22 = &__block_descriptor_tmp_67;
            uint64_t v23 = v1;
            uint64_t v24 = ValueAtIndex;
            nw_path_evaluator_set_update_handler();
            nw_path_evaluator_set_cancel_handler();
            nw_path_evaluator_start();
            unsigned int v8 = nw_path_evaluator_copy_path();
            if (v8)
            {
              uint64_t v9 = v8;
              ValueAtIndex[106] = _mdns_get_server_usability_from_path(v8, (*(_DWORD *)(*(void *)(v1 + 16) + 144) - 3) < 2);
              nw_release(v9);
            }
            goto LABEL_23;
          }
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint64_t v10 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v25 = 138412290;
            int v26 = ValueAtIndex;
            _os_log_error_impl(&dword_23814D000, v10, OS_LOG_TYPE_ERROR, "Failed to create path evaluator for %@", v25, 0xCu);
          }
        }
        ValueAtIndex[106] = 2;
LABEL_23:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        int v11 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = ValueAtIndex[106] + 1;
          uint64_t v13 = "<INVALID USABILITY>";
          if (v12 <= 5) {
            uint64_t v13 = off_264D07EF0[v12];
          }
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = ValueAtIndex;
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_23814D000, v11, OS_LOG_TYPE_DEFAULT, "Server %@ usability is %{public}s", buf, 0x16u);
        }
        ++v4;
        int v5 = ValueAtIndex + 24;
      }
      while (v3 != v4);
    }
    _mdns_resolver_check_for_problematic_servers(v1);
    uint64_t v1 = *(void *)(a1 + 32);
  }
  os_release((void *)v1);
}

void ___mdns_resolver_set_up_server_path_evaluator_block_invoke(uint64_t a1, NSObject *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char server_usability_from_path = _mdns_get_server_usability_from_path(a2, (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 16) + 144) - 3) < 2);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(char *)(v4 + 106);
  if (server_usability_from_path != *(unsigned char *)(v4 + 106))
  {
    unsigned int v6 = v5 - 1;
    *(unsigned char *)(v4 + 106) = server_usability_from_path;
    if ((server_usability_from_path - 1) > 3u)
    {
      if (v6 <= 3)
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        int v11 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 40);
          int v14 = 138412290;
          uint64_t v15 = v12;
          _os_log_impl(&dword_23814D000, v11, OS_LOG_TYPE_DEFAULT, "Server %@ usability is now unusable", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v7 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        unsigned int v9 = *(char *)(v8 + 106) + 1;
        if (v9 > 5) {
          uint64_t v10 = "<INVALID USABILITY>";
        }
        else {
          uint64_t v10 = off_264D07EF0[v9];
        }
        int v14 = 138412546;
        uint64_t v15 = v8;
        __int16 v16 = 2082;
        uint64_t v17 = v10;
        _os_log_impl(&dword_23814D000, v7, OS_LOG_TYPE_DEFAULT, "Server %@ usability is now %{public}s", (uint8_t *)&v14, 0x16u);
      }
      if (v5 == 4 || v6 >= 4)
      {
        _mdns_resolver_unpenalize_server(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
        _mdns_resolver_handle_revived_server(*(void *)(a1 + 32), *(void *)(a1 + 40), 1, 0);
      }
    }
  }
}

void ___mdns_resolver_set_up_server_path_evaluator_block_invoke_68(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
  int v2 = *(void **)(a1 + 40);

  os_release(v2);
}

uint64_t _mdns_get_server_usability_from_path(NSObject *a1, int a2)
{
  nw_path_status_t status = nw_path_get_status(a1);
  char v5 = 1;
  if (status != nw_path_status_satisfied && status != nw_path_status_satisfiable)
  {
    if (status == nw_path_status_unsatisfied)
    {
      if (nw_path_is_per_app_vpn()) {
        return 3;
      }
      if (nw_path_get_reason() == 2) {
        return 4;
      }
      if ((nw_path_has_nat64_prefixes() & 1) != 0 || a2 && nw_path_has_dns(a1))
      {
        unsigned int v6 = nw_path_copy_endpoint();
        if (v6)
        {
          uint64_t v7 = v6;
          if (nw_endpoint_get_type(v6) == nw_endpoint_type_address)
          {
            nw_endpoint_t address = nw_endpoint_get_address(v7);
            if (address)
            {
              int sa_family = address->sa_family;
              nw_release(v7);
              if (sa_family == 2) {
                return 2;
              }
              else {
                return -1;
              }
            }
          }
          nw_release(v7);
        }
      }
    }
    return -1;
  }
  return v5;
}

void _mdns_resolver_check_for_problematic_servers(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 16) + 158) || *(void *)(a1 + 104)) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2)
  {
LABEL_8:
    if (!*(unsigned char *)(a1 + 140))
    {
      if (_mdns_resolver_queue_s_once != -1) {
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
      }
      dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
      *(void *)(a1 + 104) = v3;
      if (!v3)
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint64_t v7 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_23814D000, v7, OS_LOG_TYPE_ERROR, "Failed to create probe timer", buf, 2u);
        }
        return;
      }
      uint64_t v4 = v3;
      dispatch_time_t v5 = dispatch_time(0x8000000000000000, 7200000000000);
      dispatch_source_set_timer(v4, v5, 0x68C61714000uLL, 0x53D1AC1000uLL);
      unsigned int v6 = *(NSObject **)(a1 + 104);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_resolver_check_for_problematic_servers_block_invoke;
      handler[3] = &__block_descriptor_tmp_131;
      handler[4] = a1;
      dispatch_source_set_event_handler(v6, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 104));
      _mdns_resolver_start_probe_querier(a1);
    }
    if (!*(unsigned char *)(a1 + 139))
    {
      *(unsigned char *)(a1 + 139) = 1;
      _mdns_resolver_generate_connection_event(a1);
    }
    return;
  }
  while ((*(char *)(v2 + 106) - 1) > 3 || *(unsigned char *)(v2 + 110) || *(_DWORD *)(v2 + 96) >= 3u)
  {
    uint64_t v2 = *(void *)(v2 + 24);
    if (!v2) {
      goto LABEL_8;
    }
  }
}

void ___mdns_resolver_check_for_problematic_servers_block_invoke(uint64_t a1)
{
}

void _mdns_resolver_start_probe_querier(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (v2)
  {
    mdns_client_invalidate(v2);
    os_release(*(void **)(a1 + 112));
    *(void *)(a1 + 112) = 0;
  }
  querier = mdns_resolver_create_querier((void *)a1, 0);
  *(void *)(a1 + 112) = querier;
  if (querier)
  {
    int v10 = *(_DWORD *)(a1 + 120) + 1;
    *(_DWORD *)(a1 + 120) = v10;
    mdns_querier_set_log_label((uint64_t)querier, "PQ%u", v4, v5, v6, v7, v8, v9, v10);
    uint64_t v11 = *(void *)(a1 + 112);
    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
    }
    mdns_client_set_queue(v11, (dispatch_object_t)_mdns_resolver_queue_s_queue);
    mdns_querier_set_query(*(void *)(a1 + 112), "\x05apple\x03com", 2, 1);
    uint64_t v12 = *(void *)(a1 + 112);
    mdns_client_activate(v12);
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v13 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_23814D000, v13, OS_LOG_TYPE_ERROR, "Failed to create probe querier", buf, 2u);
    }
  }
}

void _mdns_resolver_generate_connection_event(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "cannot_connect", *(unsigned char *)(a1 + 139));
  _mdns_resolver_generate_event((NSObject **)a1, 2, v2);
  if (v2)
  {
    xpc_release(v2);
  }
}

void _mdns_resolver_generate_event(NSObject **object, int a2, void *a3)
{
  if (!*((unsigned char *)object + 136))
  {
    if (object[10])
    {
      os_retain(object);
      xpc_retain(a3);
      uint64_t v6 = object[9];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___mdns_resolver_generate_event_block_invoke;
      block[3] = &__block_descriptor_tmp_114;
      int v8 = a2;
      void block[4] = object;
      void block[5] = a3;
      dispatch_async(v6, block);
    }
  }
}

void ___mdns_resolver_generate_event_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
  os_release(*(void **)(a1 + 32));
  xpc_object_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    xpc_release(v2);
  }
}

void *mdns_resolver_create_querier(void *a1, int *a2)
{
  uint64_t v4 = (void *)_os_object_alloc();
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = &_mdns_querier_kind;
    v4[2] = &_mdns_querier_kind;
    do
    {
      uint64_t v7 = (void (*)(void *))v6[2];
      if (v7) {
        v7(v5);
      }
      uint64_t v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    *((_DWORD *)v5 + 52) = 0;
    v5[8] = a1;
    os_retain(a1);
    uint64_t v8 = mdns_query_message_create();
    v5[11] = v8;
    BOOL v9 = v8 == 0;
    if (v8) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v5;
    }
    if (v9)
    {
      uint64_t v5 = 0;
      int v10 = -6729;
    }
    else
    {
      int v10 = 0;
    }
    if (a2) {
      goto LABEL_13;
    }
  }
  else
  {
    int v10 = -6728;
    if (a2) {
LABEL_13:
    }
      *a2 = v10;
  }
  if (v4) {
    os_release(v4);
  }
  return v5;
}

uint64_t mdns_querier_set_log_label(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(unsigned char *)(a1 + 49)) {
    return 4294960577;
  }
  v15[0] = 0;
  v15[1] = &a9;
  vasprintf(v15, a2, &a9);
  if (!v15[0]) {
    return 4294960568;
  }
  int v14 = 0;
  asprintf(&v14, "[%s] ", v15[0]);
  int v10 = v14;
  if (v14)
  {
    uint64_t v11 = *(void **)(a1 + 128);
    if (v11)
    {
      free(v11);
      int v10 = v14;
    }
    uint64_t v12 = 0;
    *(void *)(a1 + 128) = v10;
    int v14 = 0;
  }
  else
  {
    uint64_t v12 = 4294960568;
  }
  if (v15[0]) {
    free(v15[0]);
  }
  return v12;
}

uint64_t mdns_querier_set_query(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v9 = 0;
  uint64_t v7 = mdns_domain_name_create_with_labels(a2, (int *)&v9);
  if (!v9 && !*(unsigned char *)(a1 + 49)) {
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)(a1 + 16) + 56))(a1, v7, a3, a4);
  }
  if (v7) {
    os_release(v7);
  }
  return v9;
}

uint64_t _mdns_querier_get_class(uint64_t a1)
{
  return *(unsigned __int16 *)(*(void *)(a1 + 88) + 66);
}

uint64_t _mdns_querier_get_type(uint64_t a1)
{
  return *(unsigned __int16 *)(*(void *)(a1 + 88) + 64);
}

uint64_t _mdns_querier_get_name(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 88) + 56);
}

void _mdns_querier_invalidate(uint64_t a1)
{
}

void _mdns_querier_conclude_ex(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(NSObject **)(a1 + 96);
  if (v8)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v8);
    *(void *)(a1 + 96) = 0;
  }
  unsigned int v9 = *(NSObject **)(a1 + 120);
  if (v9)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 120));
    dispatch_release(v9);
    *(void *)(a1 + 120) = 0;
  }
  int v10 = *(NSObject **)(a1 + 152);
  if (v10)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 152));
    dispatch_release(v10);
    *(void *)(a1 + 152) = 0;
  }
  uint64_t v11 = *(void **)(a1 + 144);
  if (v11)
  {
    os_release(v11);
    *(void *)(a1 + 144) = 0;
  }
  _mdns_resolver_deregister_querier(*(void *)(a1 + 64), a1);
  if (*(unsigned char *)(a1 + 249) != 3)
  {
    *(unsigned char *)(a1 + 249) = 3;
    switch(a2)
    {
      case 1:
        if (a4) {
          os_retain(a4);
        }
        uint64_t v12 = *(void **)(a1 + 136);
        if (v12) {
          os_release(v12);
        }
        *(void *)(a1 + 136) = a4;
        uint64_t v13 = *(void **)(a1 + 160);
        if (v13)
        {
          os_release(v13);
          *(void *)(a1 + 160) = 0;
          a4 = *(void **)(a1 + 136);
        }
        int v14 = (unsigned __int16 *)a4[4];
        unint64_t v15 = a4[5];
        size_t size = 0;
        *(void *)long long buf = 0;
        if (!DNSMessageGetOptRecord(v14, v15, (char **)buf, &size) && *(void *)buf && size >= 0xB)
        {
          size_t v16 = *(void *)buf + size;
          unint64_t v17 = *(void *)buf + 11;
          while (v16 > v17)
          {
            if (v16 - v17 < 4) {
              break;
            }
            uint64_t v18 = (unsigned __int16 *)v17;
            unint64_t v19 = v17 + 4;
            int64_t v20 = __rev16(v18[1]);
            if ((uint64_t)(v16 - v19) < v20) {
              break;
            }
            unint64_t v17 = v19 + v20;
            if (__rev16(*v18) == 15)
            {
              if (v20 <= 1) {
                break;
              }
              char v21 = v17 - ((_BYTE)v18 + 6);
              size_t v22 = (unsigned __int16)(v17 - ((_WORD)v18 + 6));
              if ((_WORD)v17 == (_WORD)v18 + 6) {
                uint64_t v23 = 0;
              }
              else {
                uint64_t v23 = (const char *)(v18 + 3);
              }
              unsigned int v24 = v18[2];
              uint64_t v25 = _os_object_alloc();
              uint64_t v26 = v25;
              if (!v25) {
                goto LABEL_78;
              }
              unsigned int v27 = bswap32(v24) >> 16;
              uint64_t v28 = &_mdns_extended_dns_error_kind;
              *(void *)(v25 + 16) = &_mdns_extended_dns_error_kind;
              do
              {
                int v29 = (void (*)(uint64_t))v28[2];
                if (v29) {
                  v29(v26);
                }
                uint64_t v28 = (_UNKNOWN **)*v28;
              }
              while (v28);
              if (v22)
              {
                uint64_t v30 = *(void *)(v26 + 24);
              }
              else
              {
                if (_mdns_copy_empty_string_s_once != -1) {
                  dispatch_once(&_mdns_copy_empty_string_s_once, &__block_literal_global_681);
                }
                if (_mdns_copy_empty_string_s_empty_string)
                {
                  xpc_retain((xpc_object_t)_mdns_copy_empty_string_s_empty_string);
                  uint64_t v30 = _mdns_copy_empty_string_s_empty_string;
                }
                else
                {
                  uint64_t v30 = 0;
                }
                *(void *)(v26 + 24) = v30;
              }
              if (v30
                || (unsigned __int16 v40 = strnlen(v23, v22),
                    (CFStringRef v41 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v23, v40, 0x8000100u, 0)) != 0)&& (CFRelease(v41), v50 = mdns_xpc_string_create_with_format(v42, v43, v44, v45, v46, v47, v48, v49, v21), (*(void *)(v26 + 24) = v50) != 0))
              {
                *(_WORD *)(v26 + 32) = v27;
                goto LABEL_78;
              }
              os_release((void *)v26);
              break;
            }
          }
        }
        uint64_t v26 = 0;
LABEL_78:
        *(void *)(a1 + 160) = v26;
        LODWORD(v51) = *(unsigned __int8 *)(*(void *)(a1 + 64) + 133);
        if (!*(unsigned char *)(*(void *)(a1 + 64) + 133)) {
          goto LABEL_104;
        }
        uint64_t v51 = *(void *)(a1 + 136);
        if (!v51) {
          goto LABEL_104;
        }
        unint64_t v52 = *(void *)(v51 + 32);
        if (!v52) {
          goto LABEL_93;
        }
        int v75 = 0;
        size_t size = 0;
        unint64_t v53 = DNSMessageCollapse(v52, *(void *)(v51 + 40), &size, (uint64_t *)&v75);
        if (!v53) {
          goto LABEL_90;
        }
        char v54 = v53;
        int64_t v55 = dispatch_data_create(v53, size, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
        if (v55)
        {
          unint64_t v56 = v55;
          unsigned int v57 = mdns_message_create_with_dispatch_data(v55);
          dispatch_release(v56);
          if (v57)
          {
            os_retain(v57);
            unint64_t v58 = *(void **)(a1 + 136);
            if (v58) {
              os_release(v58);
            }
            *(void *)(a1 + 136) = v57;
            os_release(v57);
            uint64_t v59 = *(void *)(a1 + 136);
            if (v59)
            {
              uint64_t v60 = *(void *)(v59 + 32);
              unint64_t v61 = *(void *)(v59 + 40);
            }
            else
            {
              uint64_t v60 = 0;
              unint64_t v61 = 0;
            }
            if (_mdns_resolver_log_s_once != -1) {
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
            }
            unint64_t v63 = _mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v64 = "";
              uint64_t v65 = *(void *)(a1 + 136);
              if (*(void *)(a1 + 128)) {
                unint64_t v64 = *(const char **)(a1 + 128);
              }
              int v66 = 12;
              *(_DWORD *)long long buf = 136446978;
              if (v61 < 0xC) {
                int v66 = v61;
              }
              *(void *)&uint8_t buf[4] = v64;
              __int16 v78 = 1040;
              *(_DWORD *)uint64_t v79 = v66;
              *(_WORD *)&v79[4] = 2098;
              *(void *)&v79[6] = v60;
              __int16 v80 = 2112;
              uint64_t v81 = v65;
              _os_log_impl(&dword_23814D000, v63, OS_LOG_TYPE_DEFAULT, "%{public}sUsing squashed response -- %{public,mdns:dnshdr}.*P, %@", buf, 0x26u);
            }
            LODWORD(v51) = 1;
            goto LABEL_104;
          }
        }
        else
        {
          free(v54);
        }
        int v75 = -6729;
LABEL_90:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        unint64_t v62 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          unsigned int v72 = *(const char **)(a1 + 128);
          if (!v72) {
            unsigned int v72 = "";
          }
          *(_DWORD *)long long buf = 136446466;
          *(void *)&uint8_t buf[4] = v72;
          __int16 v78 = 2048;
          *(void *)uint64_t v79 = v75;
          _os_log_error_impl(&dword_23814D000, v62, OS_LOG_TYPE_ERROR, "%{public}sFailed to squash response -- error:%{mdns:err}ld", buf, 0x16u);
        }
LABEL_93:
        LODWORD(v51) = 0;
LABEL_104:
        if (a3 == 1) {
          int v67 = 1;
        }
        else {
          int v67 = v51;
        }
        *(unsigned char *)(a1 + 253) = v67;
        if (v67 == 1)
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint32_t v31 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            char v68 = *(const char **)(a1 + 128);
            if (!v68) {
              char v68 = "";
            }
            *(_DWORD *)long long buf = 136446210;
            *(void *)&uint8_t buf[4] = v68;
            uint64_t v33 = "%{public}sQuerier concluded -- reason: response (fabricated)";
            goto LABEL_120;
          }
        }
        else
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint32_t v31 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            uint64_t v69 = *(const char **)(a1 + 128);
            if (!v69) {
              uint64_t v69 = "";
            }
            *(_DWORD *)long long buf = 136446210;
            *(void *)&uint8_t buf[4] = v69;
            uint64_t v33 = "%{public}sQuerier concluded -- reason: response";
            goto LABEL_120;
          }
        }
LABEL_121:
        unsigned int v70 = *(NSObject **)(a1 + 24);
        if (v70)
        {
          uint64_t v71 = *(void *)(a1 + 80);
          *(void *)(a1 + 80) = 0;
          os_retain((void *)a1);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = ___mdns_querier_conclude_ex_block_invoke;
          block[3] = &unk_264D07B40;
          char v74 = a2;
          void block[4] = v71;
          void block[5] = a1;
          dispatch_async(v70, block);
        }
        if (*(unsigned char *)(a1 + 254))
        {
          *(unsigned char *)(a1 + 254) = 0;
          os_release((void *)a1);
        }
        return;
      case 2:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint32_t v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = *(const char **)(a1 + 128);
          if (!v32) {
            __int16 v32 = "";
          }
          *(_DWORD *)long long buf = 136446210;
          *(void *)&uint8_t buf[4] = v32;
          uint64_t v33 = "%{public}sQuerier concluded -- reason: timeout";
          goto LABEL_120;
        }
        goto LABEL_121;
      case 3:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint32_t v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = *(const char **)(a1 + 128);
          if (!v34) {
            uint64_t v34 = "";
          }
          *(_DWORD *)long long buf = 136446210;
          *(void *)&uint8_t buf[4] = v34;
          uint64_t v33 = "%{public}sQuerier concluded -- reason: invalidation";
          goto LABEL_120;
        }
        goto LABEL_121;
      case 4:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint32_t v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          uint32_t v35 = *(const char **)(a1 + 128);
          if (!v35) {
            uint32_t v35 = "";
          }
          *(_DWORD *)long long buf = 136446210;
          *(void *)&uint8_t buf[4] = v35;
          uint64_t v33 = "%{public}sQuerier concluded -- reason: resolver invalidation";
          goto LABEL_120;
        }
        goto LABEL_121;
      case 5:
        *(_DWORD *)(a1 + 240) = a3;
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        __int16 v36 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          unsigned int v37 = *(const char **)(a1 + 128);
          if (!v37) {
            unsigned int v37 = "";
          }
          uint64_t v38 = *(int *)(a1 + 240);
          *(_DWORD *)long long buf = 136446466;
          *(void *)&uint8_t buf[4] = v37;
          __int16 v78 = 2048;
          *(void *)uint64_t v79 = v38;
          _os_log_error_impl(&dword_23814D000, v36, OS_LOG_TYPE_ERROR, "%{public}sQuerier concluded -- error: %{mdns:err}ld", buf, 0x16u);
        }
        goto LABEL_121;
      case 6:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint32_t v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          size_t v39 = *(const char **)(a1 + 128);
          if (!v39) {
            size_t v39 = "";
          }
          *(_DWORD *)long long buf = 136446210;
          *(void *)&uint8_t buf[4] = v39;
          uint64_t v33 = "%{public}sQuerier concluded -- reason: connection problem";
LABEL_120:
          _os_log_impl(&dword_23814D000, v31, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
        }
        goto LABEL_121;
      default:
        goto LABEL_121;
    }
  }
}

void _mdns_resolver_deregister_querier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(NSObject **)(a2 + 96);
  if (v4)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a2 + 96));
    dispatch_release(v4);
    *(void *)(a2 + 96) = 0;
  }
  _mdns_forget_session_list((uint64_t *)(a2 + 104));
  _mdns_forget_session_list((uint64_t *)(a2 + 112));
  uint64_t v5 = (void *)(a1 + 32);
  do
  {
    uint64_t v6 = v5;
    uint64_t v7 = *v5;
    uint64_t v5 = (void *)(*v5 + 56);
    if (v7) {
      BOOL v8 = v7 == a2;
    }
    else {
      BOOL v8 = 1;
    }
  }
  while (!v8);
  if (v7) {
    goto LABEL_17;
  }
  unsigned int v9 = (void *)(a1 + 40);
  do
  {
    uint64_t v6 = v9;
    uint64_t v10 = *v9;
    unsigned int v9 = (void *)(*v9 + 56);
    if (v10) {
      BOOL v11 = v10 == a2;
    }
    else {
      BOOL v11 = 1;
    }
  }
  while (!v11);
  if (v10)
  {
LABEL_17:
    void *v6 = *(void *)(a2 + 56);
    *(void *)(a2 + 56) = 0;
    os_release((void *)a2);
  }
}

void ___mdns_querier_conclude_ex_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 40) + 248) = *(unsigned char *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    dispatch_source_t v3 = *(const void **)(a1 + 32);
    if (v3) {
      _Block_release(v3);
    }
  }
  uint64_t v4 = *(void **)(a1 + 40);

  os_release(v4);
}

void _mdns_forget_session_list(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      *(void *)(v1 + 24) = 0;
      _mdns_session_invalidate((unsigned char *)v1);
      os_release((void *)v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

void _mdns_session_invalidate(unsigned char *a1)
{
  a1[88] = 3;
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___mdns_session_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_50;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void ___mdns_session_invalidate_block_invoke(uint64_t a1)
{
  _mdns_session_invalidate_internal(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_source_t v3 = *(void (**)(void))(*(void *)(v2 + 72) + 16);
  if (v3)
  {
    v3(*(void *)(v2 + 48));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 48) = 0;
  uint64_t v4 = *(void **)(a1 + 32);

  os_release(v4);
}

void _mdns_session_invalidate_internal(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    dispatch_release(v2);
    *(void *)(a1 + 40) = 0;
  }
  dispatch_source_t v3 = *(void (**)(uint64_t))(*(void *)(a1 + 16) + 72);
  if (v3)
  {
    v3(a1);
  }
}

void _mdns_querier_activate(unsigned char *object)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (!object[249])
  {
    object[249] = 1;
    if (!object[254])
    {
      os_retain(object);
      object[254] = 1;
    }
    if (*(unsigned char *)(*(void *)(*((void *)object + 8) + 16) + 160))
    {
      LOWORD(v2) = 0;
    }
    else
    {
      uint32_t v3 = arc4random();
      unsigned int v2 = v3 + v3 / 0xFFFF + 1;
    }
    uint64_t v4 = *((void *)object + 11);
    char v5 = *(unsigned char *)(v4 + 70);
    if ((v5 & 0x20) == 0)
    {
      *(_WORD *)(v4 + 68) = v2;
      *(unsigned char *)(v4 + 70) = v5 & 0xF7 | (8 * *(unsigned char *)(*(void *)(*((void *)object + 8) + 16) + 159));
      uint64_t v4 = *((void *)object + 11);
      char v5 = *(unsigned char *)(v4 + 70);
    }
    uint64_t v6 = *((void *)object + 8);
    if ((v5 & 0x20) == 0)
    {
      *(unsigned char *)(v4 + 70) = v5 & 0xEF | (16 * ((*(_DWORD *)(*(void *)(v6 + 16) + 144) - 3) < 2));
      uint64_t v6 = *((void *)object + 8);
    }
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 136);
    if (v7)
    {
      uint64_t v8 = v7();
      if (v8)
      {
        int v9 = *(unsigned __int8 *)(v8 + 1);
        if (v9 == 30)
        {
          uint64_t v12 = *((void *)object + 11);
          if ((*(unsigned char *)(v12 + 70) & 0x20) == 0)
          {
            *(_WORD *)(v12 + 71) = 14338;
            *(void *)(v12 + 81) = 0;
            *(void *)(v12 + 73) = 0;
            int v13 = *(_DWORD *)(v8 + 8);
            *(_DWORD *)(v12 + 76) = *(_DWORD *)(v8 + 11);
            *(_DWORD *)(v12 + 73) = v13;
          }
        }
        else if (v9 == 2)
        {
          uint64_t v10 = *((void *)object + 11);
          if ((*(unsigned char *)(v10 + 70) & 0x20) == 0)
          {
            unsigned int v11 = bswap32(*(_DWORD *)(v8 + 4));
            *(_WORD *)(v10 + 71) = 6145;
            *(void *)(v10 + 76) = 0;
            *(void *)(v10 + 81) = 0;
            *(unsigned char *)(v10 + 73) = HIBYTE(v11);
            *(unsigned char *)(v10 + 74) = BYTE2(v11);
            *(unsigned char *)(v10 + 75) = BYTE1(v11);
          }
        }
      }
    }
    int message_construct = mdns_query_message_construct(*((void *)object + 11));
    if (!message_construct)
    {
      if (object[249] != 1) {
        return;
      }
      uint64_t v15 = *((void *)object + 8);
      if (*(unsigned char *)(v15 + 136))
      {
        _mdns_querier_conclude_async(object);
        return;
      }
      if (*((void *)object + 16)) {
        size_t v16 = (const char *)*((void *)object + 16);
      }
      else {
        size_t v16 = "";
      }
      signed int v17 = *((_DWORD *)object + 59);
      if (v17)
      {
        if (v17 < 1)
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          char v21 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            LODWORD(handler) = 136446210;
            *(void *)((char *)&handler + 4) = v16;
            _os_log_impl(&dword_23814D000, v21, OS_LOG_TYPE_INFO, "%{public}sPending querier will start when DNS traffic is observed", (uint8_t *)&handler, 0xCu);
          }
          goto LABEL_37;
        }
        oneshot_timer = _mdns_resolver_create_oneshot_timer(v17, 0);
        *((void *)object + 19) = oneshot_timer;
        if (oneshot_timer)
        {
          *(void *)&long long handler = MEMORY[0x263EF8330];
          *((void *)&handler + 1) = 0x40000000;
          uint32_t v31 = ___mdns_resolver_handle_new_querier_block_invoke;
          __int16 v32 = &__block_descriptor_tmp_141;
          uint64_t v33 = object;
          uint64_t v34 = v15;
          dispatch_source_set_event_handler(oneshot_timer, &handler);
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          unint64_t v19 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            int v20 = *((_DWORD *)object + 59);
            int v26 = 136446466;
            unsigned int v27 = v16;
            __int16 v28 = 1024;
            int v29 = v20;
            _os_log_impl(&dword_23814D000, v19, OS_LOG_TYPE_INFO, "%{public}sPending querier will start after at most %d ms or when DNS traffic is observed", (uint8_t *)&v26, 0x12u);
          }
          dispatch_activate(*((dispatch_object_t *)object + 19));
LABEL_37:
          size_t v22 = (void *)(v15 + 40);
          do
          {
            uint64_t v23 = v22;
            uint64_t v24 = *v22;
            size_t v22 = (void *)(*v22 + 56);
          }
          while (v24);
          *uint64_t v23 = object;
          os_retain(object);
          return;
        }
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint64_t v25 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LODWORD(handler) = 136446210;
          *(void *)((char *)&handler + 4) = v16;
          _os_log_error_impl(&dword_23814D000, v25, OS_LOG_TYPE_ERROR, "%{public}sFailed to create flexible start timer for querier, will start immediately", (uint8_t *)&handler, 0xCu);
        }
      }
      _mdns_resolver_start_querier(v15, object);
      return;
    }
    _mdns_querier_conclude_with_error_async(object, message_construct);
  }
}

void _mdns_querier_conclude_async(void *a1)
{
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = ___mdns_querier_conclude_async_block_invoke;
  v2[3] = &__block_descriptor_tmp_142_1423;
  v2[4] = a1;
  char v3 = 4;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v2);
}

NSObject *_mdns_resolver_create_oneshot_timer(unsigned int a1, unsigned int a2)
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  uint64_t v4 = _mdns_resolver_queue_s_queue;

  return mdns_dispatch_create_oneshot_monotonic_timer(a1, a2, v4);
}

void ___mdns_resolver_handle_new_querier_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 152);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 152));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 152) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = (void *)(*(void *)(a1 + 40) + 40);
  do
  {
    char v5 = v4;
    uint64_t v6 = *v4;
    uint64_t v4 = (void *)(*v4 + 56);
    if (v6) {
      BOOL v7 = v6 == v2;
    }
    else {
      BOOL v7 = 1;
    }
  }
  while (!v7);
  if (v6)
  {
    *char v5 = *(void *)(v2 + 56);
    *(void *)(v2 + 56) = 0;
    os_release((void *)v2);
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v8 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
    {
      int v9 = *(const char **)(*(void *)(a1 + 32) + 128);
      if (!v9) {
        int v9 = "";
      }
      int v10 = 136446210;
      unsigned int v11 = v9;
      _os_log_impl(&dword_23814D000, v8, OS_LOG_TYPE_INFO, "%{public}sStarting pending querier because leeway elapsed", (uint8_t *)&v10, 0xCu);
    }
    _mdns_resolver_start_querier(*(void *)(a1 + 40), *(unsigned char **)(a1 + 32));
  }
}

void _mdns_resolver_start_querier(uint64_t a1, unsigned char *object)
{
  if (object[249] == 1)
  {
    object[249] = 2;
    unsigned int v4 = *((_DWORD *)object + 56);
    if (v4 && (int v5 = _mdns_querier_reset_time_limit((uint64_t)object, v4)) != 0)
    {
      _mdns_querier_conclude_with_error_async(object, v5);
    }
    else
    {
      _mdns_resolver_register_querier_ex(a1, object, 0);
    }
  }
}

void _mdns_querier_conclude_with_error_async(void *a1, int a2)
{
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_querier_conclude_with_error_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_72;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void ___mdns_querier_conclude_with_error_async_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(void *)(a1 + 32), 5, *(_DWORD *)(a1 + 40), 0);
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

uint64_t _mdns_querier_reset_time_limit(uint64_t a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 249) != 2) {
    return 0;
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  unsigned int v4 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    int v5 = *(const char **)(a1 + 128);
    if (!v5) {
      int v5 = "";
    }
    *(_DWORD *)long long buf = 136446466;
    unsigned int v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_23814D000, v4, OS_LOG_TYPE_INFO, "%{public}sResetting time limit to %u ms", buf, 0x12u);
  }
  uint64_t v6 = *(NSObject **)(a1 + 120);
  if (v6)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 120));
    dispatch_release(v6);
    *(void *)(a1 + 120) = 0;
  }
  if (!a2) {
    return 0;
  }
  oneshot_timer = _mdns_resolver_create_oneshot_timer(a2, 5u);
  *(void *)(a1 + 120) = oneshot_timer;
  if (oneshot_timer)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___mdns_querier_reset_time_limit_block_invoke;
    handler[3] = &__block_descriptor_tmp_122_1421;
    handler[4] = a1;
    dispatch_source_set_event_handler(oneshot_timer, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 120));
    return 0;
  }
  return 4294960567;
}

uint64_t _mdns_resolver_register_querier_ex(uint64_t a1, _WORD *object, int a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v5 + 158)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (v6)
  {
    if (*(unsigned char *)(v5 + 161) && *(unsigned char *)(a1 + 134))
    {
      uint64_t v8 = *(void *)(a1 + 88) - mach_continuous_time();
      if ((v8 & 0x8000000000000000) == 0)
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        int v9 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          if (mdns_mach_ticks_per_second_s_once != -1) {
            dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
          }
          int v15 = 134218240;
          unint64_t v16 = v8 / mdns_mach_ticks_per_second_s_ticks_per_second;
          __int16 v17 = 2048;
          unint64_t v18 = 1000
              * (v8 % mdns_mach_ticks_per_second_s_ticks_per_second)
              / mdns_mach_ticks_per_second_s_ticks_per_second;
          _os_log_impl(&dword_23814D000, v9, OS_LOG_TYPE_INFO, "Suspicious mode (%lld.%03lld seconds left): forcing query over bytestream", (uint8_t *)&v15, 0x16u);
        }
        object[125] = 259;
        goto LABEL_6;
      }
      *(unsigned char *)(a1 + 134) = 0;
    }
    char v7 = 0;
    *((unsigned char *)object + 251) = 0;
    *((void *)object + 27) = 0;
    *((_DWORD *)object + 53) = 0;
    goto LABEL_20;
  }
  *((unsigned char *)object + 251) = 1;
LABEL_6:
  char v7 = 0;
  *((void *)object + 27) = 0;
  *((_DWORD *)object + 53) = 0;
  if (!*(unsigned char *)(a1 + 138)) {
    char v7 = *(unsigned char *)(*(void *)(a1 + 16) + 162) ^ 1;
  }
LABEL_20:
  *((unsigned char *)object + 252) = v7;
  int v10 = (void *)(a1 + 32);
  do
  {
    unsigned int v11 = v10;
    uint64_t v12 = *v10;
    int v10 = (void *)(*v10 + 56);
  }
  while (v12);
  *unsigned int v11 = object;
  os_retain(object);
  *((void *)object + 9) = 0;
  *((unsigned char *)object + 247) = 0;
  if (*((unsigned char *)object + 251)) {
    int v13 = 2000;
  }
  else {
    int v13 = *(_DWORD *)(*((void *)object + 8) + 124);
  }
  *((_DWORD *)object + 51) = v13;
  return _mdns_querier_initiate_send(object);
}

void _mdns_querier_initiate_send(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(NSObject **)(a1 + 96);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v2);
    *(void *)(a1 + 96) = 0;
  }
  char v3 = (void *)*MEMORY[0x263EF8378];
  uint64_t v4 = *(void *)(a1 + 72);
  p_name = &OBJC_PROTOCOL___OS_mdns_signed_result.name;
  while (1)
  {
    if (v4) {
      goto LABEL_8;
    }
    if (*(void *)(a1 + 144) && !_mdns_resolver_get_server(*(void *)(a1 + 64), *(_DWORD *)(a1 + 228))) {
      break;
    }
    uint64_t eligible_server = _mdns_querier_get_eligible_server(a1);
    _mdns_querier_set_current_server(a1, eligible_server);
    uint64_t v4 = *(void *)(a1 + 72);
    if (!v4)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v33 = p_name[172];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = *(const char **)(a1 + 128);
        if (!v34) {
          uint64_t v34 = "";
        }
        *(_DWORD *)long long buf = 136446210;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_debug_impl(&dword_23814D000, v33, OS_LOG_TYPE_DEBUG, "%{public}sNo more eligible servers", buf, 0xCu);
      }
      return;
    }
LABEL_8:
    uint64_t v7 = *(void *)(a1 + 64);
    if (*(_DWORD *)(*(void *)(v7 + 16) + 144) == 1 || *(_DWORD *)(v7 + 128))
    {
      int v8 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 88))(a1);
      if ((v8 & 0xFFFE) == 0x40)
      {
        int v9 = v8;
        if (*(unsigned char *)(v4 + 112))
        {
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          int v10 = p_name[172];
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
          {
            unsigned int v11 = *(const char **)(a1 + 128);
            if (!v11) {
              unsigned int v11 = "";
            }
            *(_DWORD *)long long buf = 136446722;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v4;
            *(_WORD *)&unsigned char buf[22] = 1024;
            LODWORD(v46) = v9;
            uint64_t v12 = v10;
            int v13 = "%{public}sNot sending query to server %@, which mixes up responses of type %{mdns:rrtype}d";
LABEL_18:
            _os_log_impl(&dword_23814D000, v12, OS_LOG_TYPE_INFO, v13, buf, 0x1Cu);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
        if (!*(unsigned char *)(v4 + 107))
        {
          uint64_t v22 = *(void *)(v4 + 64);
          if (v22)
          {
            if (*(_DWORD *)(v22 + 8) >= *(_DWORD *)(v22 + 12))
            {
              if (_mdns_resolver_log_s_once != -1) {
                dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
              }
              int v10 = p_name[172];
              if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
              {
                uint64_t v23 = *(const char **)(a1 + 128);
                if (!v23) {
                  uint64_t v23 = "";
                }
                *(_DWORD *)long long buf = 136446722;
                *(void *)&uint8_t buf[4] = v23;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v4;
                *(_WORD *)&unsigned char buf[22] = 1024;
                LODWORD(v46) = v9;
                uint64_t v12 = v10;
                int v13 = "%{public}sNot sending query to server %@, which ignores queries of type %{mdns:rrtype}d";
                goto LABEL_18;
              }
LABEL_19:
              if (!*(void *)(a1 + 144))
              {
                uint64_t v14 = *(void *)(a1 + 88);
                size_t v15 = *(void *)(v14 + 40);
                if (v15 < 0xD)
                {
                  int v39 = -6762;
                }
                else
                {
                  unint64_t v16 = (char *)malloc_type_malloc(*(void *)(v14 + 40), 0xA172743EuLL);
                  if (v16)
                  {
                    int v10 = v16;
                    memcpy(v16, *(const void **)(v14 + 32), v15);
                    *((_WORD *)v10 + 1) = -31615;
                    __int16 v17 = dispatch_data_create(v10, v15, 0, v3);
                    if (!v17) {
                      goto LABEL_90;
                    }
                    unint64_t v18 = v17;
                    uint64_t v19 = mdns_message_create_with_dispatch_data(v17);
                    dispatch_release(v18);
                    *(void *)(a1 + 144) = v19;
                    if (!v19)
                    {
                      int v39 = -6729;
LABEL_92:
                      unsigned __int16 v40 = (void *)a1;
LABEL_93:
                      _mdns_querier_conclude_with_error_async(v40, v39);
                      return;
                    }
                    *(_WORD *)(a1 + 244) = -4;
                    p_name = (char **)(&OBJC_PROTOCOL___OS_mdns_signed_result + 8);
                    goto LABEL_25;
                  }
                  __break(1u);
LABEL_90:
                  free(v10);
                  int v39 = -6729;
                }
                *(void *)(a1 + 144) = 0;
                goto LABEL_92;
              }
LABEL_25:
              uint64_t v20 = 0;
              if ((*(_DWORD *)(v4 + 100) - 1) >= 0x20) {
                int v21 = 0;
              }
              else {
                int v21 = 1 << (*(unsigned char *)(v4 + 100) - 1);
              }
              *(_DWORD *)(a1 + 228) |= v21;
              *(void *)(a1 + 72) = 0;
              *(unsigned char *)(a1 + 247) = 0;
              goto LABEL_31;
            }
          }
        }
      }
    }
    uint64_t v20 = *(void *)(a1 + 72);
LABEL_31:
    uint64_t v4 = 0;
    if (v20)
    {
      oneshot_timer = _mdns_resolver_create_oneshot_timer(*(_DWORD *)(a1 + 204), 5u);
      *(void *)(a1 + 96) = oneshot_timer;
      if (!oneshot_timer)
      {
        unsigned __int16 v40 = (void *)a1;
        int v39 = -6729;
        goto LABEL_93;
      }
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_querier_initiate_send_block_invoke;
      handler[3] = &__block_descriptor_tmp_70_1333;
      handler[4] = a1;
      dispatch_source_set_event_handler(oneshot_timer, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      uint64_t v25 = *(void **)(a1 + 72);
      if (*(unsigned char *)(a1 + 252))
      {
        if (!v25) {
          return;
        }
        int v26 = (void *)v25[4];
        if (v26) {
          goto LABEL_68;
        }
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        unsigned int v27 = p_name[172];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = *(const char **)(a1 + 128);
          if (!v38) {
            uint64_t v38 = "";
          }
          *(_DWORD *)long long buf = 136446466;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v25;
          _os_log_debug_impl(&dword_23814D000, v27, OS_LOG_TYPE_DEBUG, "%{public}sCreating shared session to %@", buf, 0x16u);
        }
        int v44 = 0;
        int v26 = _mdns_resolver_create_session(*(void *)(a1 + 64), v25, 1, 0, 0, &v44);
        if (v26)
        {
          os_retain(*(void **)(a1 + 64));
          if (!*((unsigned char *)v26 + 88))
          {
            v26[6] = *(void *)(a1 + 64);
            v26[9] = _mdns_querier_get_shared_session_s_resolver_callbacks;
            *((_DWORD *)v26 + 20) = 10000;
          }
          _mdns_session_activate((uint64_t)v26);
          uint8_t v25[4] = v26;
LABEL_68:
          if ((*(_DWORD *)(v26[4] + 100) - 1) >= 0x20) {
            int v32 = 0;
          }
          else {
            int v32 = 1 << (*(unsigned char *)(v26[4] + 100) - 1);
          }
          *(_DWORD *)(a1 + 212) |= v32;
          _mdns_querier_send_query(a1, (uint64_t)v26);
          return;
        }
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        CFStringRef v41 = _mdns_resolver_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_102;
        }
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v44;
        uint64_t v42 = "Failed to create session to %@ for resolver: %{mdns:err}ld";
      }
      else
      {
        if (!v25) {
          return;
        }
        uint64_t v28 = 112;
        if (*(unsigned char *)(a1 + 251))
        {
          int v29 = (void *)(a1 + 112);
        }
        else
        {
          uint64_t v28 = 104;
          int v29 = (void *)(a1 + 104);
        }
        uint64_t v30 = *(void *)(a1 + v28);
        if (v30)
        {
          while (1)
          {
            int v26 = (void *)v30;
            if (*(void **)(v30 + 32) == v25) {
              goto LABEL_68;
            }
            uint64_t v30 = *(void *)(v30 + 24);
            if (!v30)
            {
              int v29 = v26 + 3;
              break;
            }
          }
        }
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint32_t v31 = p_name[172];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v37 = *(const char **)(a1 + 128);
          if (!v37) {
            unsigned int v37 = "";
          }
          *(_DWORD *)long long buf = 136446466;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v25;
          _os_log_debug_impl(&dword_23814D000, v31, OS_LOG_TYPE_DEBUG, "%{public}sCreating session to %@", buf, 0x16u);
        }
        int v44 = 0;
        int v26 = _mdns_resolver_create_session(*(void *)(a1 + 64), v25, *(unsigned __int8 *)(a1 + 251), a1 + 168, *(void *)(*(void *)(*(void *)(a1 + 88) + 56) + 24), &v44);
        if (v26)
        {
          os_retain((void *)a1);
          if (!*((unsigned char *)v26 + 88))
          {
            v26[6] = a1;
            v26[9] = _mdns_querier_get_unshared_session_s_querier_callbacks;
            if (*(unsigned char *)(a1 + 251)) {
              *((_DWORD *)v26 + 20) = 10000;
            }
          }
          _mdns_session_activate((uint64_t)v26);
          *int v29 = v26;
          goto LABEL_68;
        }
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        CFStringRef v41 = _mdns_resolver_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
LABEL_102:
          _mdns_resolver_penalize_server_ex(*(void *)(a1 + 64), (uint64_t)v25, 0, 0, 0);
          *(void *)(a1 + 72) = 0;
          *(unsigned char *)(a1 + 247) = 0;
          return;
        }
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v44;
        uint64_t v42 = "Failed to create session to %@ for querier: %{mdns:err}ld";
      }
      _os_log_error_impl(&dword_23814D000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0x16u);
      goto LABEL_102;
    }
  }
  unsigned int v35 = *(unsigned __int16 *)(a1 + 244);
  __int16 v36 = *(void **)(a1 + 144);
  os_retain((void *)a1);
  os_retain(v36);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  *(void *)long long buf = MEMORY[0x263EF8330];
  *(void *)&uint8_t buf[8] = 0x40000000;
  *(void *)&uint8_t buf[16] = ___mdns_querier_conclude_with_response_async_block_invoke;
  uint64_t v46 = &__block_descriptor_tmp_71;
  char v49 = v35 >> 15;
  uint64_t v47 = a1;
  uint64_t v48 = v36;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, buf);
}

uint64_t _mdns_resolver_get_server(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v3 = (uint64_t *)(a1 + 24);
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    if (*(_DWORD *)(result + 100) != 1
      || *(unsigned char *)(result + 108)
      || ((*(char *)(result + 106) - 1) <= 3 ? (BOOL v5 = (a2 & 1) == 0) : (BOOL v5 = 0), !v5))
    {
      uint64_t v6 = mach_continuous_time();
      uint64_t v7 = *v3;
      if (*v3)
      {
        uint64_t v8 = v6;
        int v9 = v3;
        do
        {
          if (*(unsigned char *)(v7 + 108) && (uint64_t v10 = v8 - *(void *)(v7 + 72), v10 >= 0))
          {
            uint64_t *v9 = *(void *)(v7 + 24);
            *(void *)(v7 + 24) = 0;
            *(unsigned char *)(v7 + 108) = 0;
            uint64_t v11 = *v3;
            if (*v3 && !*(unsigned char *)(v11 + 108))
            {
              unsigned int v14 = *(_DWORD *)(v7 + 100);
              uint64_t v12 = v3;
              if (*(_DWORD *)(v11 + 100) <= v14)
              {
                do
                {
                  uint64_t v15 = v11;
                  uint64_t v11 = *(void *)(v11 + 24);
                }
                while (v11 && !*(unsigned char *)(v11 + 108) && *(_DWORD *)(v11 + 100) <= v14);
                uint64_t v12 = (uint64_t *)(v15 + 24);
              }
            }
            else
            {
              uint64_t v12 = v3;
            }
            *(void *)(v7 + 24) = v11;
            uint64_t *v12 = v7;
            if (_mdns_resolver_log_s_once != -1) {
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
            }
            int v13 = _mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
            {
              if (mdns_mach_ticks_per_second_s_once != -1) {
                dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
              }
              *(_DWORD *)long long buf = 138412802;
              uint64_t v18 = v7;
              __int16 v19 = 2048;
              unint64_t v20 = v10 / (unint64_t)mdns_mach_ticks_per_second_s_ticks_per_second;
              __int16 v21 = 2048;
              unint64_t v22 = 1000
                  * (v10 % (unint64_t)mdns_mach_ticks_per_second_s_ticks_per_second)
                  / mdns_mach_ticks_per_second_s_ticks_per_second;
              _os_log_impl(&dword_23814D000, v13, OS_LOG_TYPE_INFO, "Unpenalizing server %@ (penalty expired %lld.%03lld seconds ago)", buf, 0x20u);
            }
          }
          else
          {
            int v9 = (uint64_t *)(v7 + 24);
          }
          uint64_t v7 = *v9;
        }
        while (*v9);
        for (uint64_t result = *v3; result; uint64_t result = *(void *)(result + 24))
        {
          if ((*(char *)(result + 106) - 1) <= 3)
          {
            int v16 = (*(_DWORD *)(result + 100) - 1) >= 0x20 ? 0 : 1 << (*(unsigned char *)(result + 100) - 1);
            if ((v16 & a2) == 0) {
              break;
            }
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void ___mdns_querier_conclude_with_response_async_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(void *)(a1 + 32), 1, *(unsigned __int8 *)(a1 + 48), *(void **)(a1 + 40));
  os_release(*(void **)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);

  os_release(v2);
}

uint64_t _mdns_querier_get_eligible_server(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 228);
  if (*(unsigned char *)(a1 + 251)) {
    v2 |= *(_DWORD *)(a1 + 216) | *(_DWORD *)(a1 + 220);
  }
  uint64_t result = _mdns_resolver_get_server(*(void *)(a1 + 64), v2);
  if (result)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 112);
    if (v4 && v4 != a1)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v6 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(const char **)(a1 + 128);
        if (!v7) {
          uint64_t v7 = "";
        }
        int v8 = 136446210;
        int v9 = v7;
        _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}sBacking off while probe querier is active", (uint8_t *)&v8, 0xCu);
      }
      return 0;
    }
  }
  return result;
}

uint64_t _mdns_querier_set_current_server(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  *(unsigned char *)(result + 247) = 0;
  if (a2)
  {
    int v2 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(unsigned char *)(a2 + 100) - 1);
    if ((v2 & *(_DWORD *)(result + 212)) == 0)
    {
      if (*(unsigned char *)(result + 251)) {
        int v3 = 2000;
      }
      else {
        int v3 = *(_DWORD *)(*(void *)(result + 64) + 124);
      }
      *(_DWORD *)(result + 204) = v3;
    }
  }
  return result;
}

uint64_t ___mdns_querier_initiate_send_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(NSObject **)(v1 + 96);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 96));
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 96) = 0;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  int v4 = *(unsigned __int8 *)(v1 + 251);
  if (*(unsigned char *)(v1 + 251)) {
    unsigned int v5 = 900000;
  }
  else {
    unsigned int v5 = 30000;
  }
  unsigned int v6 = *(_DWORD *)(v1 + 204);
  if (v6 <= v5 >> 1) {
    unsigned int v5 = 2 * v6;
  }
  *(_DWORD *)(v1 + 204) = v5;
  uint64_t v7 = *(void *)(v1 + 72);
  if (v7)
  {
    if (v4)
    {
      _mdns_resolver_penalize_server_ex(*(void *)(v1 + 64), *(void *)(v1 + 72), 0, 0, 0);
      *(void *)(v1 + 72) = 0;
      int v8 = (unsigned char *)(v1 + 247);
LABEL_22:
      unsigned char *v8 = 0;
      goto LABEL_23;
    }
    int v8 = (unsigned char *)(v1 + 247);
    int v9 = *(unsigned __int8 *)(v1 + 247);
    if (v9 == 255 || (unsigned char *v8 = v9 + 1, v9))
    {
      uint64_t v10 = *(void **)(v1 + 104);
      if (v10)
      {
        while (v10[4] != v7)
        {
          uint64_t v10 = (void *)v10[3];
          if (!v10) {
            goto LABEL_21;
          }
        }
        _mdns_resolver_penalize_server_ex(*(void *)(v1 + 64), v7, 1, v1, v10[8]);
        unsigned int v11 = *(_DWORD *)(v7 + 100) - 1;
        if (v11 < 0x20) {
          int v12 = ~(1 << v11);
        }
        else {
          int v12 = -1;
        }
        *(_DWORD *)(v1 + 200) &= v12;
      }
LABEL_21:
      *(void *)(v1 + 72) = 0;
      goto LABEL_22;
    }
  }
LABEL_23:

  return _mdns_querier_initiate_send(v1);
}

void *_mdns_resolver_create_session(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6)
{
  int v12 = *(_DWORD *)(*(void *)(a1 + 16) + 144);
  if ((v12 - 2) < 2) {
    goto LABEL_5;
  }
  if (v12 == 4)
  {
    int v13 = (void *)_os_object_alloc();
    unsigned int v14 = v13;
    if (!v13) {
      goto LABEL_38;
    }
    __int16 v17 = &_mdns_url_session_kind;
    v13[2] = &_mdns_url_session_kind;
    do
    {
      uint64_t v18 = (void (*)(void *))v17[2];
      if (v18) {
        v18(v14);
      }
      __int16 v17 = (_UNKNOWN **)*v17;
    }
    while (v17);
  }
  else
  {
    if (v12 != 1)
    {
      int v13 = 0;
      unsigned int v14 = 0;
      int v19 = -6756;
      goto LABEL_33;
    }
    if (a3)
    {
LABEL_5:
      int v13 = (void *)_os_object_alloc();
      unsigned int v14 = v13;
      if (v13)
      {
        uint64_t v15 = &_mdns_connection_session_kind;
        v13[2] = &_mdns_connection_session_kind;
        do
        {
          int v16 = (void (*)(void *))v15[2];
          if (v16) {
            v16(v14);
          }
          uint64_t v15 = (_UNKNOWN **)*v15;
        }
        while (v15);
        goto LABEL_23;
      }
LABEL_38:
      int v19 = -6728;
      goto LABEL_33;
    }
    int v13 = (void *)_os_object_alloc();
    unsigned int v14 = v13;
    if (!v13) {
      goto LABEL_38;
    }
    unint64_t v20 = &_mdns_udp_socket_session_kind;
    v13[2] = &_mdns_udp_socket_session_kind;
    do
    {
      __int16 v21 = (void (*)(void *))v20[2];
      if (v21) {
        v21(v14);
      }
      unint64_t v20 = (_UNKNOWN **)*v20;
    }
    while (v20);
  }
LABEL_23:
  v14[4] = a2;
  os_retain(a2);
  uint64_t v22 = v14[2];
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
  if (v23)
  {
    int v24 = v23(v14, a1, a3, a4, a5);
    if (v24)
    {
      int v19 = v24;
      int v13 = v14;
      unsigned int v14 = 0;
      goto LABEL_33;
    }
    uint64_t v22 = v14[2];
  }
  uint64_t v25 = *(uint64_t (**)(void *))(v22 + 88);
  if (v25) {
    char v26 = v25(v14);
  }
  else {
    char v26 = *(unsigned char *)(v22 + 104) != 0;
  }
  *((unsigned char *)v14 + 89) = v26;
  unsigned int v27 = *(uint64_t (**)(void *))(v22 + 96);
  if (v27) {
    char v28 = v27(v14);
  }
  else {
    char v28 = *(unsigned char *)(v22 + 105) != 0;
  }
  int v13 = 0;
  int v19 = 0;
  *((unsigned char *)v14 + 90) = v28;
LABEL_33:
  if (a6) {
    *a6 = v19;
  }
  if (v13) {
    os_release(v13);
  }
  return v14;
}

void _mdns_session_activate(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 88))
  {
    unsigned int v2 = *(_DWORD *)(a1 + 80);
    if (v2)
    {
      oneshot_timer = _mdns_resolver_create_oneshot_timer(v2, 5u);
      *(void *)(a1 + 40) = oneshot_timer;
      if (!oneshot_timer)
      {
        int v7 = -6729;
        goto LABEL_13;
      }
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_session_activate_block_invoke;
      handler[3] = &__block_descriptor_tmp_123_1356;
      handler[4] = a1;
      dispatch_source_set_event_handler(oneshot_timer, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 40));
    }
    uint64_t v4 = mach_continuous_time();
    *(void *)(a1 + 56) = v4;
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
    }
    *(void *)(a1 + 64) = v4 - 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
    unsigned int v5 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 64);
    if (!v5 || (int v6 = v5(a1)) == 0)
    {
      *(unsigned char *)(a1 + 88) = 1;
      return;
    }
    int v7 = v6;
LABEL_13:
    *(unsigned char *)(a1 + 88) = 2;
    _mdns_common_session_terminate_async((void *)a1, v7);
  }
}

void _mdns_resolver_penalize_server_ex(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (!a4) {
      goto LABEL_25;
    }
    if (!*(_DWORD *)(a1 + 128)) {
      goto LABEL_25;
    }
    if (*(unsigned char *)(a2 + 107)) {
      goto LABEL_25;
    }
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)(a4 + 16) + 88))(a4);
    if ((v10 & 0xFFFE) != 0x40) {
      goto LABEL_25;
    }
    int v11 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(unsigned char *)(a2 + 100) - 1);
    if ((v11 & *(_DWORD *)(a4 + 200)) == 0) {
      goto LABEL_25;
    }
    int v12 = v10;
    int v13 = *(uint64_t **)(a2 + 64);
    if (!v13)
    {
      int v14 = *(_DWORD *)(*(void *)(a4 + 64) + 128);
      uint64_t v15 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
      if (!v15) {
        goto LABEL_52;
      }
      int v13 = v15;
      *((_DWORD *)v15 + 3) = v14;
      *(void *)(a2 + 64) = v15;
    }
    int v16 = *(unsigned __int8 **)(*(void *)(*(void *)(a4 + 88) + 56) + 24);
    if (!_pqw_info_can_accept_qname(v13, v16)) {
      goto LABEL_25;
    }
    int v17 = *((_DWORD *)v13 + 3);
    if (*((_DWORD *)v13 + 2) >= (v17 - 1))
    {
      unint64_t v20 = (void *)*v13;
      if (*v13)
      {
        do
        {
          __int16 v21 = (void *)*v20;
          _pqw_qname_item_free(v20);
          unint64_t v20 = v21;
        }
        while (v21);
        *int v13 = 0;
        int v17 = *((_DWORD *)v13 + 3);
      }
LABEL_20:
      *((_DWORD *)v13 + 2) = v17;
      if (_mdns_resolver_log_s_once == -1) {
        goto LABEL_21;
      }
      goto LABEL_53;
    }
    uint64_t v18 = malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
    if (v18)
    {
      int v19 = (uint64_t *)v18;
      DomainNameDupEx(v16, 0, (unsigned __int8 **)v18 + 1, 0);
      *int v19 = *v13;
      *int v13 = (uint64_t)v19;
      int v17 = *((_DWORD *)v13 + 2) + 1;
      goto LABEL_20;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
LABEL_21:
    uint64_t v22 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(const char **)(a4 + 128);
      if (!v23) {
        uint64_t v23 = "";
      }
      int v24 = *((_DWORD *)v13 + 2);
      int v25 = *((_DWORD *)v13 + 3);
      int v36 = 136447234;
      unsigned int v37 = v23;
      __int16 v38 = 1024;
      *(_DWORD *)int v39 = v24;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v25;
      __int16 v40 = 2112;
      uint64_t v41 = a2;
      __int16 v42 = 1024;
      int v43 = v12;
      _os_log_impl(&dword_23814D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}sNo response (%u/%u) from server %@ for qtype %{mdns:rrtype}d", (uint8_t *)&v36, 0x28u);
    }
LABEL_25:
    if (a5 - *(void *)(a2 + 80) < 0) {
      return;
    }
  }
  char v26 = (void *)(a1 + 24);
  do
  {
    unsigned int v27 = v26;
    uint64_t v28 = *v26;
    char v26 = (void *)(*v26 + 24);
    if (v28) {
      BOOL v29 = v28 == a2;
    }
    else {
      BOOL v29 = 1;
    }
  }
  while (!v29);
  if (v28)
  {
    *unsigned int v27 = *(void *)(a2 + 24);
    *(void *)(a2 + 24) = 0;
    uint64_t v30 = mach_continuous_time();
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
    }
    *(void *)(a2 + 72) = v30 + 60 * mdns_mach_ticks_per_second_s_ticks_per_second;
    *(unsigned char *)(a2 + 108) = 1;
    do
    {
      uint32_t v31 = v27;
      uint64_t v32 = *v27;
      unsigned int v27 = (void *)(*v27 + 24);
    }
    while (v32);
    *uint32_t v31 = a2;
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v33 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    uint64_t v34 = "";
    if (a4 && *(void *)(a4 + 128)) {
      uint64_t v34 = *(const char **)(a4 + 128);
    }
    int v36 = 136446466;
    unsigned int v37 = v34;
    __int16 v38 = 2112;
    *(void *)int v39 = a2;
    _os_log_impl(&dword_23814D000, v33, OS_LOG_TYPE_INFO, "%{public}sPenalizing server %@ for 60 seconds", (uint8_t *)&v36, 0x16u);
  }
  if (a3)
  {
    if (!*(unsigned char *)(a2 + 109)) {
      *(unsigned char *)(a2 + 109) = 1;
    }
    if (*(unsigned char *)(a1 + 132))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a2 + 48)) == nw_endpoint_type_address)
      {
        nw_endpoint_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 48));
        _mdns_symptoms_report_dns_server_symptom(413697, (uint64_t)address);
      }
    }
  }
}

void _mdns_querier_send_query(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 + 32) + 100) - 1) >= 0x20) {
    int v3 = 0;
  }
  else {
    int v3 = 1 << (*(unsigned char *)(*(void *)(a2 + 32) + 100) - 1);
  }
  if (*(unsigned char *)(a2 + 88) == 1 && *(unsigned char *)(a2 + 90))
  {
    *(_DWORD *)(a1 + 216) &= ~v3;
    if (!*(unsigned char *)(a2 + 89) || (*(_DWORD *)(a1 + 220) & v3) == 0)
    {
      _mdns_querier_send_query_immediate(a1, a2);
      *(_DWORD *)(a1 + 220) |= v3;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 216) |= v3;
  }
}

void _mdns_querier_send_query_immediate(uint64_t a1, uint64_t a2)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a2 + 88) == 1)
  {
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t v5 = *(unsigned __int16 *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 24);
    *(void *)(a2 + 64) = mach_continuous_time();
    int v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 16) + 80);
    if (v7) {
      v7(a2, v6, v5);
    }
  }
  atomic_fetch_add((atomic_uint *volatile)(a1 + 208), 1u);
  int v8 = "";
  if (*(void *)(a1 + 128)) {
    int v9 = *(const char **)(a1 + 128);
  }
  else {
    int v9 = "";
  }
  unint64_t v10 = *(void *)(*(void *)(a1 + 88) + 40);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = 152;
  if (!*(unsigned char *)(a2 + 89)) {
    uint64_t v12 = 148;
  }
  int v13 = *(_DWORD *)(*(void *)(v11 + 16) + v12);
  interface_log_string = _mdns_resolver_get_interface_log_string(v11);
  uint64_t v15 = *(void *)(a1 + 88);
  if (v10 < 0xC)
  {
    if (*(unsigned char *)(a1 + 255))
    {
      BOOL v29 = (void *)(v15 + 16);
      while (1)
      {
        BOOL v29 = (void *)*v29;
        if (!v29) {
          break;
        }
        uint64_t v30 = (uint64_t (*)(void, void, uint64_t))v29[3];
        if (v30)
        {
          uint64_t v31 = v30(*(void *)(a1 + 88), 0, 1);
          if (!v31) {
            break;
          }
          unint64_t v20 = (void *)v31;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint64_t v32 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = *(_DWORD *)(a1 + 208);
            uint64_t v34 = *(void *)(a2 + 32);
            uint64_t v35 = *(void *)(*(void *)(a1 + 88) + 32);
            int v88 = 136448258;
            uint64_t v89 = v9;
            __int16 v90 = 2048;
            unint64_t v91 = v10;
            __int16 v92 = 1024;
            int v93 = v33;
            __int16 v94 = 2112;
            uint64_t v95 = v34;
            __int16 v96 = 1024;
            int v97 = v13;
            __int16 v98 = 2082;
            unsigned int v99 = interface_log_string;
            __int16 v100 = 1040;
            *(_DWORD *)unsigned int v101 = v10;
            *(_WORD *)&v101[4] = 2098;
            *(void *)&v101[6] = v35;
            *(_WORD *)&v101[14] = 2082;
            *(void *)&v101[16] = v20;
            char v26 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %{public}s";
            unsigned int v27 = v32;
            uint32_t v28 = 80;
LABEL_28:
            _os_log_impl(&dword_23814D000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v88, v28);
          }
LABEL_29:
          free(v20);
          goto LABEL_39;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v44 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = *(_DWORD *)(a1 + 208);
      uint64_t v46 = *(void *)(a2 + 32);
      uint64_t v47 = *(void *)(*(void *)(a1 + 88) + 32);
      int v88 = 136448258;
      uint64_t v89 = v9;
      __int16 v90 = 2048;
      unint64_t v91 = v10;
      __int16 v92 = 1024;
      int v93 = v45;
      __int16 v94 = 2112;
      uint64_t v95 = v46;
      __int16 v96 = 1024;
      int v97 = v13;
      __int16 v98 = 2082;
      unsigned int v99 = interface_log_string;
      __int16 v100 = 1040;
      *(_DWORD *)unsigned int v101 = v10;
      *(_WORD *)&v101[4] = 2098;
      *(void *)&v101[6] = v47;
      *(_WORD *)&v101[14] = 2112;
      *(void *)&v101[16] = v15;
      uint64_t v41 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %@";
      __int16 v42 = v44;
      uint32_t v43 = 80;
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(v15 + 32);
    if (*(unsigned char *)(a1 + 255))
    {
      int v17 = (void *)(v15 + 16);
      while (1)
      {
        int v17 = (void *)*v17;
        if (!v17) {
          break;
        }
        uint64_t v18 = (uint64_t (*)(void, void, uint64_t))v17[3];
        if (v18)
        {
          uint64_t v19 = v18(*(void *)(a1 + 88), 0, 1);
          if (!v19) {
            break;
          }
          unint64_t v20 = (void *)v19;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint64_t v21 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = *(_DWORD *)(a1 + 208);
            uint64_t v23 = *(void *)(a2 + 32);
            uint64_t v24 = bswap32(*(_DWORD *)v16);
            unint64_t v25 = bswap64(*(void *)(v16 + 4));
            int v88 = 136448258;
            uint64_t v89 = v9;
            __int16 v90 = 2048;
            unint64_t v91 = v10;
            __int16 v92 = 1024;
            int v93 = v22;
            __int16 v94 = 2112;
            uint64_t v95 = v23;
            __int16 v96 = 1024;
            int v97 = v13;
            __int16 v98 = 2082;
            unsigned int v99 = interface_log_string;
            __int16 v100 = 2048;
            *(void *)unsigned int v101 = v24;
            *(_WORD *)&v101[8] = 2048;
            *(void *)&v101[10] = v25;
            *(_WORD *)&v101[18] = 2082;
            *(void *)&v101[20] = v20;
            char v26 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{mdns:dns.idflags}08"
                  "lX, counts: %{mdns:dns.counts}016llX, %{public}s";
            unsigned int v27 = v21;
            uint32_t v28 = 84;
            goto LABEL_28;
          }
          goto LABEL_29;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v36 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = *(_DWORD *)(a1 + 208);
      uint64_t v38 = *(void *)(a2 + 32);
      uint64_t v39 = bswap32(*(_DWORD *)v16);
      unint64_t v40 = bswap64(*(void *)(v16 + 4));
      int v88 = 136448258;
      uint64_t v89 = v9;
      __int16 v90 = 2048;
      unint64_t v91 = v10;
      __int16 v92 = 1024;
      int v93 = v37;
      __int16 v94 = 2112;
      uint64_t v95 = v38;
      __int16 v96 = 1024;
      int v97 = v13;
      __int16 v98 = 2082;
      unsigned int v99 = interface_log_string;
      __int16 v100 = 2048;
      *(void *)unsigned int v101 = v39;
      *(_WORD *)&v101[8] = 2048;
      *(void *)&v101[10] = v40;
      *(_WORD *)&v101[18] = 2112;
      *(void *)&v101[20] = v15;
      uint64_t v41 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{mdns:dns.idflags}08lX, co"
            "unts: %{mdns:dns.counts}016llX, %@";
      __int16 v42 = v36;
      uint32_t v43 = 84;
LABEL_38:
      _os_log_impl(&dword_23814D000, v42, OS_LOG_TYPE_DEFAULT, v41, (uint8_t *)&v88, v43);
    }
  }
LABEL_39:
  if (!*(_DWORD *)(*(void *)(a1 + 64) + 128)) {
    goto LABEL_46;
  }
  uint64_t v48 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v48 + 107)) {
    goto LABEL_46;
  }
  uint64_t v49 = *(void *)(a1 + 88);
  if ((*(_WORD *)(v49 + 64) & 0xFFFE) != 0x40) {
    goto LABEL_46;
  }
  int v50 = (*(_DWORD *)(v48 + 100) - 1) >= 0x20 ? 0 : 1 << (*(unsigned char *)(v48 + 100) - 1);
  if ((v50 & *(_DWORD *)(a1 + 200)) != 0) {
    goto LABEL_46;
  }
  uint64_t v51 = *(uint64_t **)(v48 + 64);
  if (v51)
  {
    if (!_pqw_info_can_accept_qname(v51, *(unsigned __int8 **)(*(void *)(v49 + 56) + 24))) {
      goto LABEL_46;
    }
  }
  uint64_t v52 = *(void *)(a1 + 192);
  if (v52) {
    goto LABEL_70;
  }
  __int16 v53 = *(_WORD *)(v48 + 104);
  if (!v53)
  {
    if (nw_endpoint_get_type(*(nw_endpoint_t *)(v48 + 48)) == nw_endpoint_type_address)
    {
      if (nw_endpoint_get_address(*(nw_endpoint_t *)(v48 + 48))->sa_family == 30) {
        __int16 v53 = 28;
      }
      else {
        __int16 v53 = 1;
      }
    }
    else
    {
      __int16 v53 = 1;
    }
    *(_WORD *)(v48 + 104) = v53;
  }
  uint64_t v54 = mdns_query_message_create();
  if (!v54)
  {
LABEL_103:
    *(void *)(a1 + 192) = 0;
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v86 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v87 = *(const char **)(a1 + 128);
      if (!v87) {
        uint64_t v87 = "";
      }
      int v88 = 136446210;
      uint64_t v89 = v87;
      _os_log_error_impl(&dword_23814D000, v86, OS_LOG_TYPE_ERROR, "%{public}sFailed to create test query", (uint8_t *)&v88, 0xCu);
    }
    goto LABEL_46;
  }
  uint64_t v52 = v54;
  mdns_query_message_set_qname(v54, *(void **)(v49 + 56));
  if ((*(unsigned char *)(v52 + 70) & 0x20) == 0)
  {
    *(_WORD *)(v52 + 64) = v53;
    *(_WORD *)(v52 + 66) = *(_WORD *)(v49 + 66);
  }
  uint32_t v55 = arc4random();
  if ((*(unsigned char *)(v52 + 70) & 0x20) == 0)
  {
    if (v55 % 0xFFFF == 65534) {
      __int16 v56 = 1;
    }
    else {
      __int16 v56 = -2 - v55 % 0xFFFF;
    }
    if (v55 % 0xFFFF + 1 == *(unsigned __int16 *)(v49 + 68)) {
      __int16 v57 = v56;
    }
    else {
      __int16 v57 = v55 % 0xFFFF + 1;
    }
    *(_WORD *)(v52 + 68) = v57;
  }
  if (mdns_query_message_construct(v52))
  {
    os_release((void *)v52);
    goto LABEL_103;
  }
  *(void *)(a1 + 192) = v52;
LABEL_70:
  if (*(unsigned char *)(a2 + 88) == 1)
  {
    uint64_t v58 = *(void *)(v52 + 24);
    uint64_t v59 = *(unsigned __int16 *)(v52 + 64);
    *(void *)(a2 + 64) = mach_continuous_time();
    uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 16) + 80);
    if (v60) {
      v60(a2, v58, v59);
    }
  }
  int v61 = *(unsigned __int8 *)(a1 + 246);
  if (v61 != 255) {
    *(unsigned char *)(a1 + 246) = v61 + 1;
  }
  uint64_t v62 = *(void *)(a1 + 192);
  if (v62)
  {
    unint64_t v63 = *(void *)(v62 + 40);
    if (*(unsigned char *)(a1 + 255))
    {
      unint64_t v64 = (void *)(v62 + 16);
      while (1)
      {
        unint64_t v64 = (void *)*v64;
        if (!v64) {
          break;
        }
        uint64_t v65 = (uint64_t (*)(void, void, uint64_t))v64[3];
        if (v65)
        {
          uint64_t v66 = v65(*(void *)(a1 + 192), 0, 1);
          if (!v66) {
            break;
          }
          int v67 = (void *)v66;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          char v68 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            if (*(void *)(a1 + 128)) {
              int v8 = *(const char **)(a1 + 128);
            }
            int v69 = *(unsigned __int8 *)(a1 + 246);
            uint64_t v70 = *(void *)(a2 + 32);
            uint64_t v71 = *(void *)(a1 + 64);
            uint64_t v72 = 152;
            if (!*(unsigned char *)(a2 + 89)) {
              uint64_t v72 = 148;
            }
            int v73 = *(_DWORD *)(*(void *)(v71 + 16) + v72);
            char v74 = _mdns_resolver_get_interface_log_string(v71);
            int v75 = 12;
            uint64_t v76 = *(void *)(*(void *)(a1 + 192) + 32);
            if (v63 < 0xC) {
              int v75 = v63;
            }
            int v88 = 136448258;
            uint64_t v89 = v8;
            __int16 v90 = 2048;
            unint64_t v91 = v63;
            __int16 v92 = 1024;
            int v93 = v69;
            __int16 v94 = 2112;
            uint64_t v95 = v70;
            __int16 v96 = 1024;
            int v97 = v73;
            __int16 v98 = 2082;
            unsigned int v99 = v74;
            __int16 v100 = 1040;
            *(_DWORD *)unsigned int v101 = v75;
            *(_WORD *)&v101[4] = 2098;
            *(void *)&v101[6] = v76;
            *(_WORD *)&v101[14] = 2082;
            *(void *)&v101[16] = v67;
            _os_log_impl(&dword_23814D000, v68, OS_LOG_TYPE_DEFAULT, "%{public}sSent %zu-byte test query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %{public}s", (uint8_t *)&v88, 0x50u);
          }
          free(v67);
          goto LABEL_46;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    v77 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      if (*(void *)(a1 + 128)) {
        int v8 = *(const char **)(a1 + 128);
      }
      int v78 = *(unsigned __int8 *)(a1 + 246);
      uint64_t v79 = *(void *)(a2 + 32);
      uint64_t v80 = *(void *)(a1 + 64);
      uint64_t v81 = 152;
      if (!*(unsigned char *)(a2 + 89)) {
        uint64_t v81 = 148;
      }
      int v82 = *(_DWORD *)(*(void *)(v80 + 16) + v81);
      uint64_t v83 = _mdns_resolver_get_interface_log_string(v80);
      int v84 = 12;
      uint64_t v85 = *(void *)(*(void *)(a1 + 192) + 32);
      if (v63 < 0xC) {
        int v84 = v63;
      }
      int v88 = 136448258;
      uint64_t v89 = v8;
      __int16 v90 = 2048;
      unint64_t v91 = v63;
      __int16 v92 = 1024;
      int v93 = v78;
      __int16 v94 = 2112;
      uint64_t v95 = v79;
      __int16 v96 = 1024;
      int v97 = v82;
      __int16 v98 = 2082;
      unsigned int v99 = v83;
      __int16 v100 = 1040;
      *(_DWORD *)unsigned int v101 = v84;
      *(_WORD *)&v101[4] = 2098;
      *(void *)&v101[6] = v85;
      *(_WORD *)&v101[14] = 2112;
      *(void *)&v101[16] = v62;
      _os_log_impl(&dword_23814D000, v77, OS_LOG_TYPE_DEFAULT, "%{public}sSent %zu-byte test query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %@", (uint8_t *)&v88, 0x50u);
    }
  }
LABEL_46:
  _mdns_resolver_start_pending_queriers(*(void *)(a1 + 64));
}

const char *_mdns_resolver_get_interface_log_string(uint64_t a1)
{
  unsigned int v2 = (char **)(a1 + 64);
  uint64_t v1 = *(char **)(a1 + 64);
  if (!v1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 48);
    if (v4)
    {
      name = nw_interface_get_name(v4);
      uint64_t v4 = *(NSObject **)(a1 + 48);
      if (v4) {
        LODWORD(v4) = nw_interface_get_index(v4);
      }
    }
    else
    {
      name = "any";
    }
    uint64_t v6 = "";
    if (name) {
      uint64_t v6 = name;
    }
    asprintf(v2, "%s/%u", v6, v4);
    uint64_t v1 = *v2;
  }
  if (v1) {
    return v1;
  }
  else {
    return "???";
  }
}

BOOL _pqw_info_can_accept_qname(uint64_t *a1, unsigned __int8 *a2)
{
  if (*((_DWORD *)a1 + 2) >= *((_DWORD *)a1 + 3)) {
    return 0;
  }
  int v3 = (uint64_t **)a1;
  while (1)
  {
    int v3 = (uint64_t **)*v3;
    BOOL result = v3 == 0;
    if (!v3) {
      break;
    }
    if (DomainNameEqual((unsigned __int8 *)v3[1], a2)) {
      return 0;
    }
  }
  return result;
}

void _mdns_resolver_start_pending_queriers(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unsigned int v2 = *(NSObject **)(a1 + 96);
    if (v2)
    {
LABEL_7:
      dispatch_source_merge_data(v2, 1uLL);
      return;
    }
    if (_mdns_resolver_queue_s_once != -1) {
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
    }
    int v3 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
    *(void *)(a1 + 96) = v3;
    if (v3)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_resolver_start_pending_queriers_block_invoke;
      handler[3] = &__block_descriptor_tmp_121_1335;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      unsigned int v2 = *(NSObject **)(a1 + 96);
      goto LABEL_7;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v4 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_23814D000, v4, OS_LOG_TYPE_ERROR, "Failed to create pending querier starter GCD source", buf, 2u);
    }
  }
}

void ___mdns_resolver_start_pending_queriers_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  unsigned int v2 = (void *)(v1 + 40);
  uint64_t v3 = v4;
  if (v4)
  {
    do
    {
      *unsigned int v2 = *(void *)(v3 + 56);
      *(void *)(v3 + 56) = 0;
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v6 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      {
        int v7 = *(const char **)(v3 + 128);
        if (!v7) {
          int v7 = "";
        }
        *(_DWORD *)long long buf = 136446210;
        uint64_t v11 = v7;
        _os_log_impl(&dword_23814D000, v6, OS_LOG_TYPE_INFO, "%{public}sStarting pending querier due to observed traffic activity", buf, 0xCu);
      }
      _mdns_resolver_start_querier(*(void *)(a1 + 32), (unsigned char *)v3);
      os_release((void *)v3);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 40);
      unsigned int v2 = (void *)(v8 + 40);
      uint64_t v3 = v9;
    }
    while (v9);
  }
}

void _mdns_querier_session_receive(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = mdns_message_create_with_dispatch_data(a2);
  if (v5)
  {
    uint64_t v6 = v5;
    __int16 v28 = 0;
    int v7 = *(unsigned __int8 *)(a1 + 89);
    if (*(unsigned char *)(a1 + 89)) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (BOOL *)&v28 + 1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a3 + 64) + 16) + 161)) {
      BOOL v9 = *(unsigned char *)(a1 + 89) != 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = &v28;
    }
    __int16 v27 = 0;
    int is_response_acceptable = _mdns_querier_is_response_acceptable(a3, (uint64_t)v5, v8, v10, &v27);
    if (*(void *)(a3 + 128)) {
      uint64_t v12 = *(const char **)(a3 + 128);
    }
    else {
      uint64_t v12 = "";
    }
    _mdns_resolver_log_receive(*(void *)(a3 + 64), a1, v6, is_response_acceptable, v12, *(unsigned __int8 *)(a3 + 255));
    uint64_t v13 = *(void *)(a1 + 32);
    if (is_response_acceptable)
    {
      uint64_t v14 = *(void *)(a3 + 64);
      uint64_t v15 = *(void *)(a1 + 56);
      int v16 = (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 16) + 88))(a3);
      _mdns_resolver_note_responsiveness(v14, v13, v7 != 0, v15, v16);
      if (v27 > 9 || ((1 << v27) & 0x209) == 0)
      {
        _mdns_querier_handle_bad_rcode(a3, v6, v27, v13);
        goto LABEL_49;
      }
      if (v7 || !HIBYTE(v28))
      {
        _mdns_querier_conclude_ex(a3, 1, 0, v6);
        goto LABEL_49;
      }
      *(unsigned char *)(a3 + 250) = 1;
    }
    else
    {
      if ((_BYTE)v28) {
        char v17 = v9;
      }
      else {
        char v17 = 1;
      }
      if (v17)
      {
        uint64_t v18 = *(void *)(a3 + 64);
        if (*(_DWORD *)(v18 + 128))
        {
          uint64_t v19 = *(void *)(a3 + 192);
          if (v19)
          {
            int is_query_response = _mdns_message_is_query_response_ex(*((char **)v6 + 4), *((void *)v6 + 5), v19, 0, 0, 1);
            uint64_t v18 = *(void *)(a3 + 64);
            if (is_query_response)
            {
              if ((*(_DWORD *)(v13 + 100) - 1) >= 0x20) {
                int v21 = 0;
              }
              else {
                int v21 = 1 << (*(unsigned char *)(v13 + 100) - 1);
              }
              *(_DWORD *)(a3 + 200) |= v21;
              _mdns_resolver_note_responsiveness(v18, v13, v7 != 0, *(void *)(a1 + 56), *(unsigned __int16 *)(*(void *)(a3 + 192) + 64));
              goto LABEL_49;
            }
          }
        }
        if (*(_DWORD *)(*(void *)(v18 + 16) + 144) == 1 && !*(unsigned char *)(v13 + 112))
        {
          int v25 = (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 16) + 88))(a3);
          char v26 = _mdns_qtype_is_problematic;
          if (v25 != 1 && v25 != 28)
          {
            if ((v25 & 0xFFFE) != 0x40) {
              goto LABEL_49;
            }
            char v26 = _mdns_qtype_is_address_type;
          }
          *(_WORD *)long long buf = 0;
          if (_mdns_message_is_query_response_ex(*((char **)v6 + 4), *((void *)v6 + 5), *(void *)(a3 + 88), 0, buf, 0)&& ((unsigned int (*)(void))v26)(*(unsigned __int16 *)buf))
          {
            *(unsigned char *)(v13 + 112) = 1;
          }
        }
LABEL_49:
        os_release(v6);
        return;
      }
      *(unsigned char *)(a3 + 250) = 2;
      uint64_t v22 = *(void *)(a3 + 64);
      if (mdns_mach_ticks_per_second_s_once != -1) {
        dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
      }
      uint64_t v23 = mdns_mach_ticks_per_second_s_ticks_per_second;
      *(void *)(v22 + 88) = mach_continuous_time() + 10 * v23;
      *(unsigned char *)(v22 + 134) = 1;
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v24 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        int v30 = 10;
        _os_log_impl(&dword_23814D000, v24, OS_LOG_TYPE_INFO, "Got suspicious response, entering suspicious mode for %d seconds", buf, 8u);
      }
    }
    _mdns_resolver_deregister_querier(*(void *)(a3 + 64), a3);
    _mdns_resolver_register_querier_ex(*(void *)(a3 + 64), (_WORD *)a3, 1);
    goto LABEL_49;
  }

  _mdns_querier_conclude_ex(a3, 5, -6729, 0);
}

uint64_t _mdns_querier_is_response_acceptable(uint64_t a1, uint64_t a2, BOOL *a3, unsigned char *a4, _WORD *a5)
{
  unint64_t v7 = *(void *)(a2 + 40);
  if (v7 < 0xC)
  {
    uint64_t result = 0;
LABEL_21:
    char v16 = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_18;
  }
  __int16 v17 = 0;
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t result = _mdns_message_is_query_response_ex((char *)v11, v7, *(void *)(a1 + 88), &v17, 0, 0);
  if (!result) {
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)(a1 + 88);
  if (v17 == *(_WORD *)(v13 + 68))
  {
    char v14 = *(unsigned char *)(v11 + 3);
    if (a3)
    {
      BOOL v15 = (*(unsigned char *)(v11 + 2) & 2) != 0
         && ((*(unsigned char *)(v13 + 70) & 4) != 0
          || !__rev16(*(unsigned __int16 *)(v11 + 6))
          || !__rev16(*(unsigned __int16 *)(v11 + 8)) && !__rev16(*(unsigned __int16 *)(v11 + 10)));
      *a3 = v15;
    }
    if (a5) {
      *a5 = v14 & 0xF;
    }
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = 0;
  }
  char v16 = 1;
  if (a4) {
LABEL_18:
  }
    *a4 = v16 & (result ^ 1);
  return result;
}

void _mdns_resolver_log_receive(uint64_t a1, uint64_t a2, void *a3, int a4, const char *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = "";
  }
  unint64_t v11 = a3[5];
  uint64_t v12 = 152;
  if (!*(unsigned char *)(a2 + 89)) {
    uint64_t v12 = 148;
  }
  int v13 = *(_DWORD *)(*(void *)(a1 + 16) + v12);
  interface_log_string = _mdns_resolver_get_interface_log_string(a1);
  if (v11 < 0xC)
  {
    if (a6)
    {
      __int16 v27 = a3 + 2;
      while (1)
      {
        __int16 v27 = (void *)*v27;
        if (!v27) {
          break;
        }
        __int16 v28 = (uint64_t (*)(void *, void, uint64_t))v27[3];
        if (v28)
        {
          uint64_t v29 = v28(a3, 0, 1);
          if (!v29) {
            break;
          }
          uint64_t v19 = (void *)v29;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint64_t v30 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = *(void *)(a2 + 32);
            uint64_t v32 = a3[4];
            int v43 = 136448258;
            uint64_t v44 = v10;
            __int16 v45 = 1024;
            int v46 = a4;
            __int16 v47 = 2048;
            unint64_t v48 = v11;
            __int16 v49 = 2112;
            uint64_t v50 = v31;
            __int16 v51 = 1024;
            int v52 = v13;
            __int16 v53 = 2082;
            uint64_t v54 = interface_log_string;
            __int16 v55 = 1040;
            *(_DWORD *)__int16 v56 = v11;
            *(_WORD *)&v56[4] = 2098;
            *(void *)&v56[6] = v32;
            *(_WORD *)&v56[14] = 2082;
            *(void *)&v56[16] = v19;
            uint64_t v24 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s"
                  " -- %{public,mdns:dnshdr}.*P, %{public}s";
            int v25 = v30;
            uint32_t v26 = 80;
LABEL_25:
            _os_log_impl(&dword_23814D000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v43, v26);
          }
LABEL_26:
          free(v19);
          return;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v40 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = *(void *)(a2 + 32);
      uint64_t v42 = a3[4];
      int v43 = 136448258;
      uint64_t v44 = v10;
      __int16 v45 = 1024;
      int v46 = a4;
      __int16 v47 = 2048;
      unint64_t v48 = v11;
      __int16 v49 = 2112;
      uint64_t v50 = v41;
      __int16 v51 = 1024;
      int v52 = v13;
      __int16 v53 = 2082;
      uint64_t v54 = interface_log_string;
      __int16 v55 = 1040;
      *(_DWORD *)__int16 v56 = v11;
      *(_WORD *)&v56[4] = 2098;
      *(void *)&v56[6] = v42;
      *(_WORD *)&v56[14] = 2112;
      *(void *)&v56[16] = a3;
      int v37 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s -- %{"
            "public,mdns:dnshdr}.*P, %@";
      uint64_t v38 = v40;
      uint32_t v39 = 80;
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v15 = a3[4];
    if (a6)
    {
      char v16 = a3 + 2;
      while (1)
      {
        char v16 = (void *)*v16;
        if (!v16) {
          break;
        }
        __int16 v17 = (uint64_t (*)(void *, void, uint64_t))v16[3];
        if (v17)
        {
          uint64_t v18 = v17(a3, 0, 1);
          if (!v18) {
            break;
          }
          uint64_t v19 = (void *)v18;
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint64_t v20 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(a2 + 32);
            uint64_t v22 = bswap32(*(_DWORD *)v15);
            unint64_t v23 = bswap64(*(void *)(v15 + 4));
            int v43 = 136448258;
            uint64_t v44 = v10;
            __int16 v45 = 1024;
            int v46 = a4;
            __int16 v47 = 2048;
            unint64_t v48 = v11;
            __int16 v49 = 2112;
            uint64_t v50 = v21;
            __int16 v51 = 1024;
            int v52 = v13;
            __int16 v53 = 2082;
            uint64_t v54 = interface_log_string;
            __int16 v55 = 2048;
            *(void *)__int16 v56 = v22;
            *(_WORD *)&v56[8] = 2048;
            *(void *)&v56[10] = v23;
            *(_WORD *)&v56[18] = 2082;
            *(void *)&v56[20] = v19;
            uint64_t v24 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s"
                  " -- %{mdns:dns.idflags}08lX, counts: %{mdns:dns.counts}016llX, %{public}s";
            int v25 = v20;
            uint32_t v26 = 84;
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v33 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = *(void *)(a2 + 32);
      uint64_t v35 = bswap32(*(_DWORD *)v15);
      unint64_t v36 = bswap64(*(void *)(v15 + 4));
      int v43 = 136448258;
      uint64_t v44 = v10;
      __int16 v45 = 1024;
      int v46 = a4;
      __int16 v47 = 2048;
      unint64_t v48 = v11;
      __int16 v49 = 2112;
      uint64_t v50 = v34;
      __int16 v51 = 1024;
      int v52 = v13;
      __int16 v53 = 2082;
      uint64_t v54 = interface_log_string;
      __int16 v55 = 2048;
      *(void *)__int16 v56 = v35;
      *(_WORD *)&v56[8] = 2048;
      *(void *)&v56[10] = v36;
      *(_WORD *)&v56[18] = 2112;
      *(void *)&v56[20] = a3;
      int v37 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s -- %{"
            "mdns:dns.idflags}08lX, counts: %{mdns:dns.counts}016llX, %@";
      uint64_t v38 = v33;
      uint32_t v39 = 84;
LABEL_35:
      _os_log_impl(&dword_23814D000, v38, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v43, v39);
    }
  }
}

void _mdns_resolver_note_responsiveness(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a4 - *(void *)(a2 + 80) >= 1) {
    *(void *)(a2 + 80) = a4;
  }
  if ((a5 & 0xFFFFFFFE) == 0x40 && !*(unsigned char *)(a2 + 107)) {
    *(unsigned char *)(a2 + 107) = 1;
  }
  _mdns_resolver_unpenalize_server(a1, a2, 1);
  if (*(unsigned char *)(a2 + 109))
  {
    *(unsigned char *)(a2 + 109) = 0;
    if (*(unsigned char *)(a1 + 132))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a2 + 48)) == nw_endpoint_type_address)
      {
        nw_endpoint_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 48));
        _mdns_symptoms_report_dns_server_symptom(413698, (uint64_t)address);
      }
    }
  }
  if (!a3)
  {
    if (!*(void *)(a2 + 40))
    {
      unsigned int v9 = *(_DWORD *)(a1 + 124);
      if (v9 / 0xA + v9 <= v9) {
        unsigned int v10 = *(_DWORD *)(a1 + 124);
      }
      else {
        unsigned int v10 = v9 / 0xA + v9;
      }
      oneshot_timer = _mdns_resolver_create_oneshot_timer(v10, 5u);
      *(void *)(a2 + 40) = oneshot_timer;
      if (oneshot_timer)
      {
        uint64_t v12 = mach_continuous_time();
        int v13 = *(NSObject **)(a2 + 40);
        uint64_t v21 = MEMORY[0x263EF8330];
        *(void *)&long long v22 = 0x40000000;
        *((void *)&v22 + 1) = ___mdns_resolver_schedule_fast_recovery_check_block_invoke;
        unint64_t v23 = &__block_descriptor_tmp_120_1343;
        uint64_t v24 = a2;
        uint64_t v25 = a1;
        uint64_t v26 = v12;
        dispatch_source_set_event_handler(v13, &v21);
        dispatch_activate(*(dispatch_object_t *)(a2 + 40));
      }
      else
      {
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint64_t v20 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          _os_log_error_impl(&dword_23814D000, v20, OS_LOG_TYPE_ERROR, "Failed to create fast recovery timer", (uint8_t *)&v21, 2u);
        }
      }
    }
    goto LABEL_31;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 16) + 158)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)(a2 + 110))
  {
    *(_DWORD *)(a2 + 96) = 0;
    *(unsigned char *)(a2 + 110) = 0;
  }
  else
  {
    unsigned int v14 = *(_DWORD *)(a2 + 96);
    *(_DWORD *)(a2 + 96) = 0;
    *(unsigned char *)(a2 + 110) = 0;
    if (v14 < 3) {
      goto LABEL_25;
    }
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v15 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *(_DWORD *)(*(void *)(a1 + 16) + 152);
    LODWORD(v21) = 67109378;
    HIDWORD(v21) = v16;
    LOWORD(v22) = 2112;
    *(void *)((char *)&v22 + 2) = a2;
    _os_log_impl(&dword_23814D000, v15, OS_LOG_TYPE_DEFAULT, "Cleared stream problems with %{mdns:protocol}d server %@", (uint8_t *)&v21, 0x12u);
  }
LABEL_25:
  if (*(unsigned char *)(a1 + 139))
  {
    uint64_t v17 = *(void *)(a1 + 24);
    if (v17)
    {
      while ((*(char *)(v17 + 106) - 1) > 3 || *(unsigned char *)(v17 + 110) || *(_DWORD *)(v17 + 96) >= 3u)
      {
        uint64_t v17 = *(void *)(v17 + 24);
        if (!v17) {
          goto LABEL_31;
        }
      }
      *(unsigned char *)(a1 + 139) = 0;
      uint64_t v18 = *(NSObject **)(a1 + 104);
      if (v18)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 104));
        dispatch_release(v18);
        *(void *)(a1 + 104) = 0;
      }
      uint64_t v19 = *(void *)(a1 + 112);
      if (v19)
      {
        mdns_client_invalidate(v19);
        os_release(*(void **)(a1 + 112));
        *(void *)(a1 + 112) = 0;
      }
      _mdns_resolver_generate_connection_event(a1);
      os_retain((void *)a1);
      if (_mdns_resolver_queue_s_once != -1) {
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
      }
      uint64_t v21 = MEMORY[0x263EF8330];
      *(void *)&long long v22 = 0x40000000;
      *((void *)&v22 + 1) = ___mdns_resolver_start_serverless_queries_async_block_invoke;
      unint64_t v23 = &__block_descriptor_tmp_119_1341;
      uint64_t v24 = a1;
      dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, &v21);
    }
  }
LABEL_31:
  _mdns_resolver_start_pending_queriers(a1);
}

void _mdns_querier_handle_bad_rcode(uint64_t a1, void *object, int a3, uint64_t a4)
{
  if ((*(_DWORD *)(a4 + 100) - 1) >= 0x20) {
    int v8 = 0;
  }
  else {
    int v8 = 1 << (*(unsigned char *)(a4 + 100) - 1);
  }
  *(_DWORD *)(a1 + 228) |= v8;
  int v9 = *(__int16 *)(a1 + 244);
  unsigned int v10 = *(void **)(a1 + 144);
  if (v9 < 0)
  {
    if (v10)
    {
      os_release(v10);
      *(void *)(a1 + 144) = 0;
    }
    *(_WORD *)(a1 + 244) = 0;
  }
  else if (v10 && (a3 == 5 || v9 != 5))
  {
    goto LABEL_15;
  }
  os_retain(object);
  unint64_t v11 = *(void **)(a1 + 144);
  if (v11) {
    os_release(v11);
  }
  *(void *)(a1 + 144) = object;
  *(_WORD *)(a1 + 244) = a3;
LABEL_15:
  if (a3 == 5) {
    _mdns_resolver_penalize_server_ex(*(void *)(a1 + 64), a4, 0, 0, 0);
  }
  if (_mdns_resolver_get_server(*(void *)(a1 + 64), *(_DWORD *)(a1 + 228)))
  {
    if (*(void *)(a1 + 72) == a4)
    {
      *(void *)(a1 + 72) = 0;
      *(unsigned char *)(a1 + 247) = 0;
      _mdns_querier_initiate_send(a1);
    }
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0;
    _mdns_querier_conclude_ex(a1, 1, 0, v12);
    os_release(v12);
  }
}

uint64_t _mdns_message_is_query_response_ex(char *a1, unint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5, char a6)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2 < 0xC) {
    return 0;
  }
  unsigned int v10 = __rev16(*(unsigned __int16 *)a1);
  if (!a4 && v10 != *(unsigned __int16 *)(a3 + 68)) {
    return 0;
  }
  if ((a1[2] & 0xF8) != 0x80) {
    return 0;
  }
  if (__rev16(*((unsigned __int16 *)a1 + 2)) != 1) {
    return 0;
  }
  int v12 = 0;
  if (DNSMessageExtractQuestion((unint64_t)a1, a2, a1 + 12, (char *)v13, (_WORD *)&v12 + 1, &v12, 0))return 0; {
  if ((a6 & 1) == 0)
  }
  {
    uint64_t result = DomainNameEqual(v13, *(unsigned __int8 **)(*(void *)(a3 + 56) + 24));
    if (!result) {
      return result;
    }
  }
  if (!a5 && HIWORD(v12) != *(unsigned __int16 *)(a3 + 64) || (unsigned __int16)v12 != *(unsigned __int16 *)(a3 + 66)) {
    return 0;
  }
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = HIWORD(v12);
  }
  return 1;
}

BOOL _mdns_qtype_is_problematic(int a1)
{
  return (a1 & 0xFFFFFFFE) == 64;
}

BOOL _mdns_qtype_is_address_type(int a1)
{
  return a1 == 1 || a1 == 28;
}

void _mdns_resolver_unpenalize_server(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a2 + 108)) {
    return;
  }
  uint64_t v4 = (uint64_t *)(a1 + 24);
  uint64_t v5 = (void *)(a1 + 24);
  do
  {
    uint64_t v6 = v5;
    uint64_t v7 = *v5;
    uint64_t v5 = (void *)(*v5 + 24);
    if (v7) {
      BOOL v8 = v7 == a2;
    }
    else {
      BOOL v8 = 1;
    }
  }
  while (!v8);
  if (!v7) {
    return;
  }
  void *v6 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 108) = 0;
  if (a3)
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    int v9 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    int v14 = 138412290;
    uint64_t v15 = a2;
    unsigned int v10 = "Unpenalizing responsive server %@";
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    int v9 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    int v14 = 138412290;
    uint64_t v15 = a2;
    unsigned int v10 = "Unpenalizing server %@";
  }
  _os_log_impl(&dword_23814D000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);
LABEL_19:
  uint64_t v11 = *v4;
  if (*v4)
  {
    if (!*(unsigned char *)(v11 + 108))
    {
      unsigned int v12 = *(_DWORD *)(a2 + 100);
      if (*(_DWORD *)(v11 + 100) <= v12)
      {
        do
        {
          uint64_t v13 = v11;
          uint64_t v11 = *(void *)(v11 + 24);
        }
        while (v11 && !*(unsigned char *)(v11 + 108) && *(_DWORD *)(v11 + 100) <= v12);
        uint64_t v4 = (uint64_t *)(v13 + 24);
      }
    }
  }
  *(void *)(a2 + 24) = v11;
  *uint64_t v4 = a2;
}

void ___mdns_resolver_start_serverless_queries_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 136))
  {
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3)
    {
      while ((*(char *)(v3 + 106) - 1) > 3)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (!v3) {
          goto LABEL_14;
        }
      }
      uint64_t v4 = *(void *)(v2 + 32);
      if (v4)
      {
        do
        {
          if (!*(void *)(v4 + 72))
          {
            *(void *)(v4 + 72) = 0;
            *(unsigned char *)(v4 + 247) = 0;
            if (*(unsigned char *)(v4 + 251)) {
              int v5 = 2000;
            }
            else {
              int v5 = *(_DWORD *)(*(void *)(v4 + 64) + 124);
            }
            *(_DWORD *)(v4 + 204) = v5;
            _mdns_querier_initiate_send(v4);
          }
          uint64_t v4 = *(void *)(v4 + 56);
        }
        while (v4);
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
  }
LABEL_14:

  os_release((void *)v2);
}

void ___mdns_resolver_schedule_fast_recovery_check_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(NSObject **)(v2 + 40);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 40));
    dispatch_release(v3);
    *(void *)(a1[4] + 40) = 0;
    uint64_t v2 = a1[4];
  }
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  _mdns_resolver_handle_revived_server(v4, v2, 0, v5);
}

void _mdns_resolver_handle_revived_server(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 136) && (*(char *)(a2 + 106) - 5) >= 0xFFFFFFFC)
  {
    int v5 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(unsigned char *)(a2 + 100) - 1);
    for (uint64_t i = *(void *)(a1 + 32); i; uint64_t i = *(void *)(i + 56))
    {
      if ((*(_DWORD *)(i + 228) & v5) == 0)
      {
        uint64_t v8 = *(void *)(i + 72);
        if (*(unsigned char *)(i + 251))
        {
          if (!v8) {
            goto LABEL_22;
          }
        }
        else
        {
          if ((a3 & 1) == 0)
          {
            if (!*(unsigned char *)(a2 + 107)
              && ((*(uint64_t (**)(uint64_t))(*(void *)(i + 16) + 88))(i) & 0xFFFE) == 0x40)
            {
              continue;
            }
            int v9 = *(void **)(i + 104);
            if (v9)
            {
              while (v9[4] != a2)
              {
                int v9 = (void *)v9[3];
                if (!v9) {
                  goto LABEL_19;
                }
              }
              if (v9[8] - a4 > 0) {
                continue;
              }
            }
          }
LABEL_19:
          if (!v8 || v8 == a2 || *(unsigned char *)(v8 + 109))
          {
LABEL_22:
            *(_DWORD *)(i + 212) &= ~v5;
            if (_mdns_resolver_log_s_once != -1) {
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
            }
            unsigned int v10 = _mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
            {
              uint64_t v11 = *(const char **)(i + 128);
              if (!v11) {
                uint64_t v11 = "";
              }
              *(_DWORD *)long long buf = 136446210;
              uint64_t v15 = v11;
              _os_log_impl(&dword_23814D000, v10, OS_LOG_TYPE_INFO, "%{public}sRestarting querier", buf, 0xCu);
            }
            *(void *)(i + 72) = 0;
            *(unsigned char *)(i + 247) = 0;
            if (*(unsigned char *)(i + 251)) {
              int v12 = 2000;
            }
            else {
              int v12 = *(_DWORD *)(*(void *)(i + 64) + 124);
            }
            *(_DWORD *)(i + 204) = v12;
            _mdns_querier_initiate_send(i);
          }
        }
      }
    }
  }
}

void _mdns_querier_session_handle_event(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v8 = _mdns_resolver_log_s_log;
  if (a3) {
    BOOL v9 = a2 == 3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v10))
  {
    uint64_t v11 = *(const char **)(a4 + 128);
    if (!v11) {
      uint64_t v11 = "";
    }
    int v25 = 136446722;
    uint64_t v26 = v11;
    __int16 v27 = 1024;
    int v28 = a2;
    __int16 v29 = 2048;
    uint64_t v30 = a3;
    _os_log_impl(&dword_23814D000, v8, v10, "%{public}sQuerier session event -- type: %{mdns:session_event}d, error: %{mdns:err}ld", (uint8_t *)&v25, 0x1Cu);
  }
  if ((a2 - 3) < 2)
  {
    int v12 = *(unsigned __int8 *)(a1 + 89);
    uint64_t v13 = (void *)(a4 + 104);
    if (*(unsigned char *)(a1 + 89)) {
      uint64_t v13 = (void *)(a4 + 112);
    }
    do
    {
      int v14 = v13;
      uint64_t v15 = *v13;
      uint64_t v13 = (void *)(*v13 + 24);
      if (v15) {
        BOOL v16 = v15 == a1;
      }
      else {
        BOOL v16 = 1;
      }
    }
    while (!v16);
    if (!v15) {
      return;
    }
    *int v14 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = 0;
    _mdns_session_invalidate((unsigned char *)a1);
    os_release((void *)a1);
    if (!v12) {
      return;
    }
    uint64_t v17 = *(void *)(a1 + 32);
    if (a2 == 3)
    {
      if (a3)
      {
        uint64_t v18 = *(void *)(a4 + 64);
        _mdns_resolver_generate_error_event((NSObject **)v18, a3);
      }
      else
      {
        if (*(unsigned char *)(a4 + 249) == 3) {
          goto LABEL_44;
        }
        uint64_t v18 = *(void *)(a4 + 64);
      }
      if (*(void *)(a4 + 128)) {
        long long v22 = *(const char **)(a4 + 128);
      }
      else {
        long long v22 = "";
      }
      char v23 = _mdns_resolver_handle_stream_error(v18, v17, v22);
      int v24 = *(unsigned __int8 *)(v18 + 140);
      _mdns_resolver_penalize_server_ex(v18, v17, 0, 0, 0);
      if (v24 && (v23 & 1) != 0) {
        goto LABEL_43;
      }
    }
LABEL_44:
    _mdns_querier_handle_stream_termination((int8x8_t *)a4, v17);
    return;
  }
  if (a2 != 2)
  {
    if (a2 == 1) {
      _mdns_querier_send_query(a4, a1);
    }
    return;
  }
  if (*(unsigned char *)(a1 + 89))
  {
    uint64_t v19 = *(void *)(a4 + 64);
    uint64_t v20 = *(void *)(a4 + 128) ? *(const char **)(a4 + 128) : "";
    int v21 = _mdns_resolver_handle_stream_lateness(*(void *)(a4 + 64), *(void *)(a1 + 32), *(void *)(a1 + 56), v20);
    if (*(unsigned char *)(v19 + 140))
    {
      if (v21) {
LABEL_43:
      }
        _mdns_querier_conclude_ex(a4, 6, 0, 0);
    }
  }
}

void _mdns_resolver_generate_error_event(NSObject **a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "error_code", a2);
  _mdns_resolver_generate_event(a1, 3, v4);
  if (v4)
  {
    xpc_release(v4);
  }
}

uint64_t _mdns_resolver_handle_stream_error(uint64_t a1, uint64_t a2, const char *a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 16) + 158))
  {
    uint64_t v6 = mach_continuous_time();
    unint64_t v7 = v6 - *(void *)(a2 + 88);
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
    }
    if (v7 >= mdns_mach_ticks_per_second_s_ticks_per_second)
    {
      unsigned int v8 = *(_DWORD *)(a2 + 96);
      if (*(unsigned char *)(a2 + 110)) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 >= 3;
      }
      int v10 = !v9;
      *(void *)(a2 + 88) = v6;
      if (v8 == -1)
      {
        BOOL v11 = 1;
      }
      else
      {
        *(_DWORD *)(a2 + 96) = v8 + 1;
        BOOL v11 = v8 > 1;
      }
      if ((v10 & v11) == 1) {
        _mdns_resolver_log_server_problems(a1, a2, a3);
      }
    }
    _mdns_resolver_check_for_problematic_servers(a1);
  }
  return *(unsigned __int8 *)(a1 + 139);
}

void _mdns_querier_handle_stream_termination(int8x8_t *a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a2 + 100) - 1;
  if (v3 < 0x20) {
    unsigned int v4 = ~(1 << v3);
  }
  else {
    unsigned int v4 = -1;
  }
  a1[27] = vand_s8((int8x8_t)vdup_n_s32(v4), a1[27]);
  int8x8_t v5 = a1[9];
  if (*(void *)&v5 != a2)
  {
    if (*(void *)&v5 || *(void *)&a1[12]) {
      return;
    }
    goto LABEL_14;
  }
  uint64_t eligible_server = _mdns_querier_get_eligible_server((uint64_t)a1);
  if (eligible_server)
  {
    if (*(unsigned char *)(eligible_server + 108)) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = eligible_server;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  _mdns_querier_set_current_server((uint64_t)a1, v7);
  if (a1[9])
  {
LABEL_14:
    _mdns_querier_initiate_send((uint64_t)a1);
  }
}

uint64_t _mdns_resolver_handle_stream_lateness(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  if (*(unsigned char *)(*(void *)(a1 + 16) + 158) && a3 - *(void *)(a2 + 80) >= 1)
  {
    if (*(unsigned char *)(a2 + 110))
    {
      *(unsigned char *)(a2 + 110) = 1;
    }
    else
    {
      unsigned int v5 = *(_DWORD *)(a2 + 96);
      *(unsigned char *)(a2 + 110) = 1;
      if (v5 <= 2) {
        _mdns_resolver_log_server_problems(a1, a2, a4);
      }
    }
    _mdns_resolver_check_for_problematic_servers(a1);
  }
  return *(unsigned __int8 *)(a1 + 139);
}

void _mdns_resolver_log_server_problems(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v6 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = "";
    int v8 = *(_DWORD *)(*(void *)(a1 + 16) + 152);
    if (a3) {
      uint64_t v7 = a3;
    }
    int v9 = *(unsigned __int8 *)(a2 + 110);
    int v10 = *(_DWORD *)(a2 + 96);
    int v11 = 136447234;
    int v12 = v7;
    __int16 v13 = 1024;
    int v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = a2;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_error_impl(&dword_23814D000, v6, OS_LOG_TYPE_ERROR, "%{public}sHaving stream problems with %{mdns:protocol}d server %@ -- lateness: %{BOOL}d, error count: %u", (uint8_t *)&v11, 0x28u);
  }
}

uint64_t ___mdns_session_activate_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  unsigned int v3 = *(NSObject **)(result + 40);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(result + 40));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t result = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(result + 88) == 1)
  {
    unsigned int v4 = **(uint64_t (***)(uint64_t, uint64_t, void, uint64_t))(result + 72);
    if (v4)
    {
      uint64_t v5 = *(void *)(result + 48);
      return v4(result, 2, 0, v5);
    }
  }
  return result;
}

void _mdns_common_session_terminate_async(void *a1, int a2)
{
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_common_session_terminate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_115_1357;
  v4[4] = a1;
  int v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void ___mdns_common_session_terminate_async_block_invoke(uint64_t a1)
{
  _mdns_common_session_finish(*(void *)(a1 + 32), 3, *(unsigned int *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

void _mdns_common_session_finish(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 88) != 3)
  {
    _mdns_session_invalidate_internal(a1);
    *(unsigned char *)(a1 + 88) = 3;
    uint64_t v6 = **(void (***)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 72);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      v6(a1, a2, a3, v7);
    }
  }
}

void _mdns_resolver_session_receive(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v5 = mdns_message_create_with_dispatch_data(a2);
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a3 + 32);
  if (!v7) {
    goto LABEL_19;
  }
  char v8 = 0;
  do
  {
    while (1)
    {
      uint64_t v9 = v7;
      uint64_t v7 = *(void *)(v7 + 56);
      __int16 v16 = 0;
      if (_mdns_querier_is_response_acceptable(v9, (uint64_t)v6, 0, 0, &v16)) {
        break;
      }
LABEL_15:
      if (!v7) {
        goto LABEL_18;
      }
    }
    if ((v8 & 1) == 0)
    {
      if (*(void *)(v9 + 128)) {
        int v10 = *(const char **)(v9 + 128);
      }
      else {
        int v10 = "";
      }
      _mdns_resolver_log_receive(a3, a1, v6, 1, v10, *(unsigned __int8 *)(v9 + 255));
    }
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(unsigned __int8 *)(a1 + 89);
    uint64_t v13 = *(void *)(a1 + 56);
    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)(v9 + 16) + 88))(v9);
    _mdns_resolver_note_responsiveness(a3, v11, v12, v13, v14);
    if (v16 <= 9 && ((1 << v16) & 0x209) != 0)
    {
      char v8 = 1;
      _mdns_querier_conclude_ex(v9, 1, 0, v6);
      goto LABEL_15;
    }
    _mdns_querier_handle_bad_rcode(v9, v6, v16, *(void *)(a1 + 32));
    char v8 = 1;
  }
  while (v7);
LABEL_18:
  if ((v8 & 1) == 0) {
LABEL_19:
  }
    _mdns_resolver_log_receive(a3, a1, v6, 0, 0, 0);
  os_release(v6);
}

void _mdns_resolver_session_handle_event(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  char v8 = _mdns_resolver_log_s_log;
  if (a3) {
    BOOL v9 = a2 == 3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v10))
  {
    v15[0] = 67109376;
    v15[1] = a2;
    __int16 v16 = 2048;
    uint64_t v17 = a3;
    _os_log_impl(&dword_23814D000, v8, v10, "Resolver session event -- type: %{mdns:session_event}d, error: %{mdns:err}ld", (uint8_t *)v15, 0x12u);
  }
  if ((a2 - 3) >= 2)
  {
    if (a2 == 2)
    {
      _mdns_resolver_handle_stream_lateness(a4, *(void *)(a1 + 32), *(void *)(a1 + 56), 0);
    }
    else if (a2 == 1)
    {
      int v11 = (*(_DWORD *)(*(void *)(a1 + 32) + 100) - 1) >= 0x20
          ? 0
          : 1 << (*(unsigned char *)(*(void *)(a1 + 32) + 100) - 1);
      for (uint64_t i = *(void *)(a4 + 32); i; uint64_t i = *(void *)(i + 56))
      {
        if (*(unsigned char *)(i + 251))
        {
          if ((*(_DWORD *)(i + 216) & v11) != 0) {
            _mdns_querier_send_query(i, a1);
          }
        }
      }
    }
    return;
  }
  uint64_t v13 = *(void *)(a4 + 24);
  if (!v13) {
    return;
  }
  while (*(void *)(v13 + 32) != a1)
  {
    uint64_t v13 = *(void *)(v13 + 24);
    if (!v13) {
      return;
    }
  }
  if (a1)
  {
    _mdns_session_invalidate((unsigned char *)a1);
    os_release(*(void **)(v13 + 32));
    *(void *)(v13 + 32) = 0;
  }
  if (a2 == 3)
  {
    if (a3)
    {
      _mdns_resolver_generate_error_event((NSObject **)a4, a3);
LABEL_33:
      _mdns_resolver_handle_stream_error(a4, v13, 0);
      _mdns_resolver_penalize_server_ex(a4, v13, 0, 0, 0);
      goto LABEL_35;
    }
    if (!*(_DWORD *)(a1 + 84)) {
      goto LABEL_33;
    }
  }
LABEL_35:
  for (j = *(int8x8_t **)(a4 + 32); j; j = (int8x8_t *)j[7])
  {
    if (j[31].i8[3]) {
      _mdns_querier_handle_stream_termination(j, v13);
    }
  }
}

void _mdns_url_session_send(uint64_t a1, NSObject *a2, int a3)
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  unint64_t p_applier = (unint64_t)&applier;
  uint64_t v7 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v66 = *(void *)(a1 + 112);
    LODWORD(applier) = 138412290;
    *(void *)((char *)&applier + 4) = v66;
    _os_log_debug_impl(&dword_23814D000, v7, OS_LOG_TYPE_DEBUG, "Sending message on URL %@", (uint8_t *)&applier, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 184);
  if (!v8)
  {
    unsigned int v103 = 0;
    uint64_t v105 = 0;
    BOOL v10 = 0;
LABEL_44:
    os_retain((void *)a1);
    uint64_t v31 = *(void **)(*(void *)(a1 + 32) + 48);
    nw_endpoint_t url = nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 112));
    size_t size = *(void *)(v8 + 192);
    v114[0] = MEMORY[0x263EF8330];
    v114[1] = 0x40000000;
    v114[2] = ___mdns_url_session_send_block_invoke_110;
    v114[3] = &__block_descriptor_tmp_112;
    v114[4] = a1;
    BOOL v115 = v10;
    id v113 = v31;
    int v110 = a2;
    uint64_t v33 = v114;
    context = (void *)MEMORY[0x23EC893C0](v33);
    if (v10)
    {
      id v34 = objc_alloc((Class)&off_26EB202A8);
      id v35 = objc_alloc((Class)&off_26EB204B8);
      unint64_t v36 = +[NSString stringWithUTF8String:url];
      int v37 = (void *)[v35 initWithString:v36];
      uint64_t v38 = (void *)[v34 initWithURL:v37];

      [v38 setHTTPMethod:@"POST"];
      [v38 setHTTPBody:v110];
      uint32_t v39 = @"application/oblivious-dns-message";
    }
    else
    {
      uint64_t v40 = [v110 base64EncodedStringWithOptions:0];
      uint64_t v41 = [v40 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

      uint64_t v42 = [v41 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

      int v43 = [v42 stringByReplacingOccurrencesOfString:@"=" withString:&stru_26EB175B8];

      uint64_t v44 = +[NSString stringWithFormat:@"%s?dns=%@", url, v43];
      id v45 = objc_alloc((Class)&off_26EB202A8);
      int v46 = a3;
      __int16 v47 = (void *)[objc_alloc((Class)&off_26EB204B8) initWithString:v44];
      uint64_t v38 = (void *)[v45 initWithURL:v47];

      a3 = v46;
      [v38 setHTTPMethod:@"GET"];

      uint32_t v39 = @"application/dns-message";
    }
    unint64_t v48 = v39;
    [v38 setValue:v48 forHTTPHeaderField:@"accept"];
    [v38 setValue:v48 forHTTPHeaderField:@"content-type"];
    __int16 v49 = nw_endpoint_copy_interface();
    uint64_t v50 = v49;
    if (v49)
    {
      __int16 v51 = +[NSString stringWithUTF8String:nw_interface_get_name(v49)];
      [v38 setBoundInterfaceIdentifier:v51];
    }
    *(void *)long long buf = 0;
    v130 = buf;
    uint64_t v131 = 0x3032000000;
    v132 = __Block_byref_object_copy__719;
    v133 = __Block_byref_object_dispose__720;
    id v134 = 0;
    if (a3 == 28 || a3 == 1)
    {
      uint64_t v52 = nw_activity_create();
      __int16 v53 = (void *)*((void *)v130 + 5);
      *((void *)v130 + 5) = v52;

      if (*((void *)v130 + 5)) {
        nw_activity_activate();
      }
    }
    *(void *)&long long applier = MEMORY[0x263EF8330];
    *((void *)&applier + 1) = 3221225472;
    v121 = __http_task_create_dns_query_block_invoke;
    v122 = &unk_264D073C0;
    v125 = buf;
    id v54 = v38;
    id v123 = v54;
    __int16 v55 = v33;
    id v124 = v55;
    __int16 v56 = _http_task_create_data_task(v54, &applier);
    [v56 set_hostOverride:v113];
    if (v56 && *((void *)v130 + 5)) {
      [v56 set_nw_activity:];
    }
    if (size)
    {
      uint64_t v57 = [v56 _effectiveConfiguration];
      uint64_t v58 = (void *)[objc_alloc((Class)&off_26EB22F60) _initWithConfiguration:v57];
      uint64_t v59 = *MEMORY[0x263EFC6A8];
      size_t v126 = size;
      uint64_t v127 = v59;
      uint64_t v60 = +[NSArray arrayWithObjects:&v126 count:1];
      uint64_t v128 = v60;
      int v61 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
      [v58 set_socketStreamProperties:v61];

      [v56 _adoptEffectiveConfiguration:v58];
    }

    _Block_object_dispose(buf, 8);

    *(void *)(a1 + 144) = v56;
    if (v56)
    {
      unint64_t v63 = (void *)MEMORY[0x23EC893C0](v62);
      [v56 resume];
      nw_protocol_options_t options = v103;
      __int16 v15 = v105;
      if (!v103) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    os_release((void *)a1);
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    nw_protocol_options_t options = v103;
    __int16 v15 = v105;
    __int16 v100 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(applier) = 0;
      _os_log_error_impl(&dword_23814D000, v100, OS_LOG_TYPE_ERROR, "Failed to create HTTP task", (uint8_t *)&applier, 2u);
    }
    goto LABEL_83;
  }
  int v112 = a3;
  uint64_t v9 = *(void *)(v8 + 168);
  BOOL v10 = v9 != 0;
  if (!v9)
  {
    nw_protocol_options_t options = 0;
    char v14 = 0;
    __int16 v15 = 0;
    goto LABEL_23;
  }
  size_t length = xpc_data_get_length(*(xpc_object_t *)(v8 + 168));
  bytes_ptr = (unsigned __int16 *)xpc_data_get_bytes_ptr(*(xpc_object_t *)(v8 + 168));
  if (nw_http_oblivious_config_is_valid())
  {
    *(void *)&long long applier = 0;
    if (nw_endpoint_get_port(*(nw_endpoint_t *)(a1 + 112)) == 443)
    {
      nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 112));
      nw_endpoint_get_url_path();
      asprintf((char **)&applier, "/dns-query?targethost=%s&targetpath=%s");
    }
    else
    {
      nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 112));
      nw_endpoint_get_url_path();
      asprintf((char **)&applier, "/dns-query?targethost=%s:%u&targetpath=%s");
    }
    nw_protocol_options_t options = (void *)nw_oblivious_http_create_options();
    if ((void)applier)
    {
      free((void *)applier);
      *(void *)&long long applier = 0;
    }
    if (options)
    {
      __int16 v15 = 0;
      char v14 = 1;
      goto LABEL_23;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v71 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
LABEL_82:
      nw_protocol_options_t options = 0;
      __int16 v15 = 0;
LABEL_83:
      int v72 = -6700;
      goto LABEL_84;
    }
    *(_WORD *)long long buf = 0;
    int v73 = "Failed to create oblivious http options";
    char v74 = buf;
LABEL_87:
    _os_log_error_impl(&dword_23814D000, v71, OS_LOG_TYPE_ERROR, v73, v74, 2u);
    goto LABEL_82;
  }
  if (!a2 || !bytes_ptr)
  {
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    uint64_t v64 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_78;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v65 = "Parameters are NULL";
LABEL_104:
    uint64_t v81 = v64;
    uint32_t v82 = 2;
LABEL_105:
    _os_log_error_impl(&dword_23814D000, v81, OS_LOG_TYPE_ERROR, v65, buf, v82);
    goto LABEL_78;
  }
  if (length <= 1)
  {
    if (_mdns_crypto_log_s_once == -1)
    {
LABEL_16:
      __int16 v16 = _mdns_crypto_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      {
LABEL_77:
        uint64_t v64 = _mdns_crypto_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
        {
LABEL_78:
          uint64_t v70 = _mdns_resolver_log_s_once;
LABEL_79:
          if (v70 != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          uint64_t v71 = _mdns_resolver_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_82;
          }
          LOWORD(applier) = 0;
          int v73 = "Failed to create oblivious request";
          char v74 = (uint8_t *)&applier;
          goto LABEL_87;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v65 = "Failed to parse supported config";
        goto LABEL_104;
      }
      *(_DWORD *)long long buf = 134217984;
      *(void *)(p_applier + 164) = length;
      _os_log_error_impl(&dword_23814D000, v16, OS_LOG_TYPE_ERROR, "Config length is too short: %zu", buf, 0xCu);
LABEL_75:
      if (_mdns_crypto_log_s_once != -1) {
        dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
      }
      goto LABEL_77;
    }
LABEL_138:
    dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    goto LABEL_16;
  }
  unint64_t p_applier = bswap32(*bytes_ptr) >> 16;
  if (length - 2 == p_applier)
  {
    int v67 = bytes_ptr + 1;
    while (!mdns_odoh_config_is_valid_inner(v67, p_applier))
    {
      if (p_applier >= 4)
      {
        unint64_t v68 = bswap32(v67[1]) >> 16;
        int v67 = (unsigned __int16 *)((char *)v67 + v68);
        BOOL v69 = p_applier > v68;
        p_applier -= v68;
        if (v69) {
          continue;
        }
      }
      goto LABEL_75;
    }
    if (!v67) {
      goto LABEL_75;
    }
  }
  else if (!mdns_odoh_config_is_valid_inner(bytes_ptr, length))
  {
    goto LABEL_75;
  }
  uint64_t v111 = cchpke_params_x25519_AESGCM128_HKDF_SHA256();
  uint64_t v75 = cchpke_params_sizeof_kdf_hash();
  uint64_t v76 = ccsha256_di();
  if (!v75) {
    goto LABEL_137;
  }
  size_t length = v76;
  v77 = malloc_type_calloc(1uLL, v75, 0xF1748037uLL);
  if (!v77) {
    goto LABEL_137;
  }
  unint64_t p_applier = (unint64_t)v77;
  int v78 = cchkdf_extract();
  if (v78)
  {
    int v79 = v78;
    free((void *)p_applier);
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    uint64_t v80 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_78;
    }
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v79;
    uint64_t v65 = "Extract error: %d";
    uint64_t v81 = v80;
    uint32_t v82 = 8;
    goto LABEL_105;
  }
  size_t v102 = dispatch_data_get_size(a2);
  uint32_t v101 = arc4random_uniform(0x10u);
  uint64_t sizea = v102 + v101 + 4;
  size_t length = v111;
  uint64_t v104 = cchpke_params_sizeof_aead_tag();
  uint64_t v83 = sizea + v104 + cchpke_params_sizeof_kem_enc();
  if (v75 + v83 == -5) {
    goto LABEL_137;
  }
  size_t length = 1;
  int v84 = (char *)malloc_type_calloc(1uLL, v75 + v83 + 5, 0xF1748037uLL);
  if (!v84) {
    goto LABEL_137;
  }
  char *v84 = 1;
  *(_WORD *)(v84 + 1) = bswap32(v75) >> 16;
  size_t length = (size_t)v84;
  int v85 = cchkdf_expand();
  uint64_t v86 = (void *)p_applier;
  int v87 = v85;
  free(v86);
  if (v87)
  {
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    int v88 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v87;
      _os_log_error_impl(&dword_23814D000, v88, OS_LOG_TYPE_ERROR, "Expand error: %d", buf, 8u);
    }
    goto LABEL_121;
  }
  contexta = (void *)length;
  unint64_t p_applier = length + v75 + 3;
  *(_WORD *)unint64_t p_applier = bswap32(v83) >> 16;
  uint64_t v89 = malloc_type_calloc(1uLL, 0x60uLL, 0xF1748037uLL);
  if (!v89) {
    goto LABEL_137;
  }
  size_t length = (size_t)v89;
  LODWORD(v128) = 0;
  ccrng();
  int v90 = cchpke_initiator_setup();
  if (v90)
  {
    int v91 = v90;
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    __int16 v92 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v91;
      _os_log_error_impl(&dword_23814D000, v92, OS_LOG_TYPE_ERROR, "Setup error: %d", buf, 8u);
    }
LABEL_120:
    free(contexta);
LABEL_121:
    free((void *)length);
    goto LABEL_78;
  }
  unint64_t p_applier = v102 + v101 + 4;
  if (v102 + v101 == -4 || (int v93 = malloc_type_calloc(1uLL, sizea, 0xF1748037uLL)) == 0)
  {
LABEL_137:
    __break(1u);
    goto LABEL_138;
  }
  __int16 v94 = v93;
  _WORD *v93 = bswap32(v102) >> 16;
  *(_WORD *)((char *)v93 + v102 + 2) = bswap32(v101) >> 16;
  *(void *)&long long applier = MEMORY[0x263EF8330];
  *((void *)&applier + 1) = 0x40000000;
  v121 = __mdns_encrypt_oblivious_request_block_invoke;
  v122 = &__block_descriptor_tmp_24;
  id v123 = v93 + 1;
  dispatch_data_apply(a2, &applier);
  int v95 = cchpke_initiator_encrypt();
  if (v95)
  {
    int v96 = v95;
    if (_mdns_crypto_log_s_once != -1) {
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_21);
    }
    int v97 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v96;
      _os_log_error_impl(&dword_23814D000, v97, OS_LOG_TYPE_ERROR, "Encrypt error: %d", buf, 8u);
    }
    free(v94);
    goto LABEL_120;
  }
  *(void *)(a1 + 152) = length;
  *(void *)(a1 + 160) = 96;
  *(void *)(a1 + 168) = v94;
  *(void *)(a1 + 176) = sizea;
  dispatch_data_t v98 = dispatch_data_create(contexta, v75 + v83 + 5, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  uint64_t v70 = _mdns_resolver_log_s_once;
  if (!v98) {
    goto LABEL_79;
  }
  __int16 v15 = v98;
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  unsigned int v99 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(applier) = 0;
    _os_log_debug_impl(&dword_23814D000, v99, OS_LOG_TYPE_DEBUG, "Created oblivious request", (uint8_t *)&applier, 2u);
  }
  nw_protocol_options_t options = 0;
  char v14 = 0;
  a2 = v15;
LABEL_23:
  if (!*(void *)(v8 + 176))
  {
    unsigned int v103 = options;
    uint64_t v105 = v15;
    a3 = v112;
    goto LABEL_44;
  }
  nw_parameters_clear_custom_proxy_configs();
  nw_parameters_add_custom_proxy_config();
  if (options)
  {
    uint64_t v17 = nw_parameters_copy_default_protocol_stack(*(nw_parameters_t *)(a1 + 120));
    nw_protocol_stack_clear_application_protocols(v17);
    nw_protocol_stack_append_application_protocol();
    if (v17) {
      nw_release(v17);
    }
  }
  nw_connection_t v18 = nw_connection_create(*(nw_endpoint_t *)(a1 + 112), *(nw_parameters_t *)(a1 + 120));
  *(void *)(a1 + 128) = v18;
  if (!v18)
  {
    int v72 = -6729;
LABEL_84:
    _mdns_common_session_terminate_async((void *)a1, v72);
    if (!options) {
      goto LABEL_61;
    }
LABEL_60:
    nw_release(options);
    goto LABEL_61;
  }
  os_retain((void *)a1);
  __int16 v19 = *(NSObject **)(a1 + 128);
  int v20 = options;
  uint64_t v21 = v15;
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  nw_connection_set_queue(v19, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  long long v22 = *(NSObject **)(a1 + 128);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___mdns_url_session_send_block_invoke;
  handler[3] = &__block_descriptor_tmp_97;
  handler[4] = a1;
  nw_connection_set_state_changed_handler(v22, handler);
  int v24 = (void *)MEMORY[0x23EC88D10](v23);
  if (v9) {
    int v25 = "Oblivious Message";
  }
  else {
    int v25 = "HTTP Message";
  }
  nw_http_fields_set_value_by_name();
  nw_http_fields_set_value_by_name();
  size_t v26 = dispatch_data_get_size(a2);
  snprintf((char *)&applier, 0x80uLL, "%zu", v26);
  nw_http_fields_set_value_by_name();
  nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 112));
  __int16 v27 = (void *)nw_http_request_create_from_url();
  nw_http_request_set_header_fields();
  metadata_for_request = nw_http_create_metadata_for_request();
  if (v27) {
    nw_release(v27);
  }
  __int16 v29 = nw_content_context_create(v25);
  nw_content_context_set_metadata_for_protocol(v29, metadata_for_request);
  if (metadata_for_request) {
    nw_release(metadata_for_request);
  }
  __int16 v15 = v21;
  if (v24) {
    nw_release(v24);
  }
  nw_content_context_set_is_final(v29, 1);
  nw_connection_send(*(nw_connection_t *)(a1 + 128), a2, v29, 1, (nw_connection_send_completion_t)*MEMORY[0x263F14430]);
  nw_protocol_options_t options = v20;
  if (v29) {
    nw_release(v29);
  }
  nw_connection_start(*(nw_connection_t *)(a1 + 128));
  *(void *)(a1 + 136) = _mdns_create_and_start_connection_activity(*(void *)(a1 + 128), v112);
  uint64_t v30 = *(NSObject **)(a1 + 128);
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 0x40000000;
  completion[2] = ___mdns_url_session_send_block_invoke_102;
  completion[3] = &__block_descriptor_tmp_109;
  completion[4] = a1;
  BOOL v117 = v9 != 0;
  char v118 = v14;
  nw_connection_receive_message(v30, completion);
  if (v20) {
    goto LABEL_60;
  }
LABEL_61:
  if (v15) {
    dispatch_release(v15);
  }
}

void sub_238179708(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void ___mdns_url_session_send_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 128))
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v7 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = nw_connection_state_to_string();
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 128);
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = a3;
      _os_log_debug_impl(&dword_23814D000, v7, OS_LOG_TYPE_DEBUG, "Connection state changed to %s for connection %@ error %@", (uint8_t *)&v10, 0x20u);
    }
    switch(a2)
    {
      case 3:
        _mdns_url_session_handle_connection_no_longer_pending(*(void *)(a1 + 32));
        break;
      case 4:
        _mdns_common_session_finish(*(void *)(a1 + 32), 3, 4294960543);
        break;
      case 5:
        uint64_t v5 = *(void *)(a1 + 32);
LABEL_10:
        _mdns_url_session_handle_connection_no_longer_pending(v5);
        os_release(*(void **)(a1 + 32));
        break;
    }
  }
  else if (a2 == 5)
  {
    goto LABEL_10;
  }
}

uint64_t _mdns_create_and_start_connection_activity(uint64_t a1, int a2)
{
  if (a2 != 1 && a2 != 28) {
    return 0;
  }
  uint64_t v2 = nw_activity_create();
  if (v2) {
    nw_connection_start_activity();
  }
  return v2;
}

void ___mdns_url_session_send_block_invoke_102(uint64_t a1, uint64_t error_code, NSObject *a3, uint64_t a4, NSObject *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 128)) {
    return;
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v9 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v30) = 134217984;
    *(void *)((char *)&v30 + 4) = error_code;
    _os_log_debug_impl(&dword_23814D000, v9, OS_LOG_TYPE_DEBUG, "Received data %p", (uint8_t *)&v30, 0xCu);
  }
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = &v30;
  uint64_t v31 = 0x2000000000;
  uint64_t v32 = 0;
  if (a3)
  {
    int v10 = nw_protocol_copy_http_definition();
    a3 = nw_content_context_copy_protocol_metadata(a3, v10);
    if (v10) {
      nw_release(v10);
    }
    if (a3)
    {
      uint64_t v11 = (void *)nw_http_metadata_copy_response();
      nw_release(a3);
      if (v11)
      {
        LODWORD(a3) = nw_http_response_get_status_code();
        __int16 v12 = (void *)nw_http_response_copy_header_fields();
        nw_http_fields_access_value_by_name();
        if (v12) {
          nw_release(v12);
        }
        nw_release(v11);
      }
      else
      {
        LODWORD(a3) = 0;
      }
    }
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v13 = _mdns_resolver_log_s_log;
  if (a3 != 200 || error_code == 0) {
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v15))
  {
    uint64_t v16 = "";
    if (!error_code) {
      uint64_t v16 = "out";
    }
    *(_DWORD *)long long buf = 67109378;
    LODWORD(v29[0]) = a3;
    WORD2(v29[0]) = 2082;
    *(void *)((char *)v29 + 6) = v16;
    _os_log_impl(&dword_23814D000, v13, v15, "Received HTTP status %u with%{public}s body", buf, 0x12u);
  }
  if (error_code)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (*(unsigned char *)(a1 + 41))
      {
        uint64_t v17 = 0;
      }
      else
      {
        error_code = (uint64_t)mdns_decrypt_oblivious_response(error_code, *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 160), *(const void **)(*(void *)(a1 + 32) + 168), *(void *)(*(void *)(a1 + 32) + 176));
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint64_t v21 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v29[0] = error_code;
          _os_log_debug_impl(&dword_23814D000, v21, OS_LOG_TYPE_DEBUG, "Decrypted %@", buf, 0xCu);
        }
        uint64_t v17 = error_code;
        if (!error_code)
        {
          char v19 = 0;
          char v18 = 0;
          error_code = 4294960520;
          goto LABEL_47;
        }
      }
      long long v22 = *(NSObject **)(*((void *)&v30 + 1) + 24);
      if (v22) {
        _mdns_https_resolver_set_client_address(*(void *)(*(void *)(a1 + 32) + 184), v22);
      }
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(v23 + 184);
      if (!*(unsigned char *)(v24 + 230))
      {
        *(unsigned char *)(v24 + 230) = 1;
        _mdns_resolver_generate_error_event((NSObject **)v24, 0);
        uint64_t v23 = *(void *)(a1 + 32);
      }
      _mdns_common_session_invoke_receive(v23, error_code);
      if (v17) {
        dispatch_release(v17);
      }
    }
    else
    {
      int v20 = *(NSObject **)(*((void *)&v30 + 1) + 24);
      if (v20) {
        _mdns_https_resolver_set_client_address(*(void *)(*(void *)(a1 + 32) + 184), v20);
      }
      _mdns_common_session_invoke_receive(*(void *)(a1 + 32), error_code);
    }
    error_code = 0;
    char v19 = 1;
    char v18 = 1;
  }
  else
  {
    char v18 = 0;
    char v19 = 1;
  }
LABEL_47:
  int v25 = *(void **)(*((void *)&v30 + 1) + 24);
  if (v25)
  {
    nw_release(v25);
    *(void *)(*((void *)&v30 + 1) + 24) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 136))
  {
    nw_connection_end_activity();
    nw_activity_complete_with_reason();
    size_t v26 = *(void **)(*(void *)(a1 + 32) + 136);
    if (v26)
    {
      nw_release(v26);
      *(void *)(*(void *)(a1 + 32) + 136) = 0;
    }
  }
  if (v18)
  {
    char v27 = v19 ^ 1;
    if (!a5) {
      char v27 = 1;
    }
    if ((v27 & 1) == 0) {
      error_code = nw_error_get_error_code(a5);
    }
  }
  else
  {
    if (a3 == 401)
    {
      error_code = 4294960520;
    }
    else if (a3)
    {
      error_code = 4294960560;
    }
    else if (a5)
    {
      error_code = nw_error_get_error_code(a5);
    }
    else
    {
      error_code = 4294960543;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 184) + 230) = 0;
  }
  _mdns_common_session_finish(*(void *)(a1 + 32), 3, error_code);
  _Block_object_dispose(&v30, 8);
}

void ___mdns_url_session_send_block_invoke_110(uint64_t a1, NSObject *a2, int a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 144))
  {
    int v9 = *(unsigned __int8 *)(a1 + 40);
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    int v10 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)a2;
      _os_log_debug_impl(&dword_23814D000, v10, OS_LOG_TYPE_DEBUG, "Received response %@", (uint8_t *)&v15, 0xCu);
      if (a2)
      {
LABEL_6:
        if (v9)
        {
          uint64_t v11 = mdns_decrypt_oblivious_response(a2, *(void *)(v4 + 152), *(void *)(v4 + 160), *(const void **)(v4 + 168), *(void *)(v4 + 176));
          if (_mdns_resolver_log_s_once != -1) {
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
          }
          __int16 v12 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
          {
            int v15 = 138412290;
            uint64_t v16 = (uint64_t)v11;
            _os_log_debug_impl(&dword_23814D000, v12, OS_LOG_TYPE_DEBUG, "Decrypted response %@", (uint8_t *)&v15, 0xCu);
          }
          a2 = v11;
          if (!v11)
          {
            if (a3 == 401) {
              a4 = 4294960520;
            }
            else {
              a4 = 4294960519;
            }
LABEL_29:
            _mdns_common_session_finish(*(void *)(a1 + 32), 3, a4);
            uint64_t v4 = *(void *)(a1 + 32);
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v11 = 0;
        }
        _mdns_common_session_invoke_receive(v4, (uint64_t)a2);
        if (!a4)
        {
LABEL_27:
          if (v11) {
            dispatch_release(v11);
          }
          goto LABEL_29;
        }
LABEL_20:
        if (_mdns_resolver_log_s_once != -1) {
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
        }
        uint64_t v13 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          int v15 = 138412290;
          uint64_t v16 = a4;
          _os_log_error_impl(&dword_23814D000, v13, OS_LOG_TYPE_ERROR, "Got error %@", (uint8_t *)&v15, 0xCu);
        }
        unsigned int Code = CFErrorGetCode((CFErrorRef)a4);
        if (Code) {
          a4 = Code;
        }
        else {
          a4 = 4294960596;
        }
        goto LABEL_27;
      }
    }
    else if (a2)
    {
      goto LABEL_6;
    }
    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
LABEL_30:
  os_release((void *)v4);
}

void _mdns_common_session_invoke_receive(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 88) == 1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 40);
    if (v4)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
      dispatch_release(v4);
      *(void *)(a1 + 40) = 0;
    }
    int v5 = *(_DWORD *)(a1 + 84);
    if (v5 != -1) {
      *(_DWORD *)(a1 + 84) = v5 + 1;
    }
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 72) + 8);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      v6(a1, a2, v7);
    }
  }
}

void ___mdns_url_session_send_block_invoke_104(uint64_t a1, char *hostname)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nw_endpoint_create_host(hostname, "0");
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  unsigned int v3 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_23814D000, v3, OS_LOG_TYPE_DEBUG, "Received client address %@", (uint8_t *)&v5, 0xCu);
  }
}

const sockaddr *_mdns_https_resolver_set_client_address(uint64_t a1, nw_endpoint_t endpoint)
{
  *(void *)(a1 + 200) = 0;
  uint64_t v2 = (sockaddr *)(a1 + 200);
  *(_DWORD *)(a1 + 224) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  uint64_t result = nw_endpoint_get_address(endpoint);
  if (result)
  {
    int sa_family = result->sa_family;
    if (sa_family == 30)
    {
      sockaddr v5 = *result;
      *(_OWORD *)&v2->sa_data[10] = *(_OWORD *)&result->sa_data[10];
    }
    else
    {
      if (sa_family != 2) {
        return result;
      }
      sockaddr v5 = *result;
    }
    *uint64_t v2 = v5;
  }
  return result;
}

void _mdns_url_session_handle_connection_no_longer_pending(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 192))
  {
    unint64_t v1 = --g_pending_odoh_connection_count;
    *(unsigned char *)(a1 + 192) = 0;
    uint64_t v2 = g_pending_odoh_sessions;
    if (g_pending_odoh_sessions) {
      BOOL v3 = v1 > 9;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      g_pending_odoh_sessions = *(void *)(g_pending_odoh_sessions + 104);
      *(void *)(v2 + 104) = 0;
      _mdns_url_session_activate_for_odoh((unsigned char *)v2);
      os_release((void *)v2);
    }
  }
}

void _mdns_url_session_activate_for_odoh(unsigned char *object)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  object[192] = 1;
  ++g_pending_odoh_connection_count;
  uint64_t v2 = &g_active_odoh_sessions;
  do
  {
    BOOL v3 = v2;
    uint64_t v4 = *v2;
    uint64_t v2 = (uint64_t *)(*v2 + 104);
  }
  while (v4);
  uint64_t *v3 = (uint64_t)object;
  os_retain(object);
  *((void *)object + 12) = mach_continuous_time();
  ++g_active_odoh_session_count;
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  sockaddr v5 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    uint64_t v7 = g_active_odoh_session_count;
    _os_log_debug_impl(&dword_23814D000, v5, OS_LOG_TYPE_DEBUG, "Active ODoH session count increase: %zu", (uint8_t *)&v6, 0xCu);
  }
  _mdns_common_session_make_ready_async(object);
}

void _mdns_common_session_make_ready_async(void *a1)
{
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___mdns_common_session_make_ready_async_block_invoke;
  block[3] = &__block_descriptor_tmp_93_1386;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void ___mdns_common_session_make_ready_async_block_invoke(uint64_t a1)
{
  _mdns_common_session_invoke_ready_event_handler(*(void *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

uint64_t _mdns_common_session_invoke_ready_event_handler(uint64_t result)
{
  if (*(unsigned char *)(result + 88) == 1 && !*(unsigned char *)(result + 90))
  {
    *(unsigned char *)(result + 90) = 1;
    unint64_t v1 = *(uint64_t (***)(uint64_t, uint64_t, void, void))(result + 72);
    if (*v1) {
      return (*v1)(result, 1, 0, *(void *)(result + 48));
    }
  }
  return result;
}

void _mdns_url_session_invalidate(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[16];
  if (v2)
  {
    if (a1[17])
    {
      nw_connection_end_activity();
      nw_activity_complete_with_reason();
      uint64_t v2 = a1[16];
    }
    nw_connection_cancel(v2);
    BOOL v3 = (void *)a1[16];
    if (v3)
    {
      nw_release(v3);
      a1[16] = 0;
    }
  }
  uint64_t v4 = (void *)a1[17];
  if (v4)
  {
    nw_release(v4);
    a1[17] = 0;
  }
  sockaddr v5 = (void *)a1[18];
  if (v5)
  {
    http_task_cancel(v5);
    a1[18] = 0;
  }
  _mdns_url_session_forget_crypto(a1);
  _mdns_url_session_handle_connection_no_longer_pending((uint64_t)a1);
  int v6 = &g_active_odoh_sessions;
  do
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void *)*v6;
    int v6 = (uint64_t *)(*v6 + 104);
    if (v8) {
      BOOL v9 = v8 == a1;
    }
    else {
      BOOL v9 = 1;
    }
  }
  while (!v9);
  if (v8)
  {
    uint64_t *v7 = a1[13];
    a1[13] = 0;
    os_release(a1);
    --g_active_odoh_session_count;
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    int v10 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      uint64_t v19 = g_active_odoh_session_count;
      _os_log_debug_impl(&dword_23814D000, v10, OS_LOG_TYPE_DEBUG, "Active ODoH session count decrease: %zu", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v11 = g_active_odoh_session_interrupt_timer;
    if (g_active_odoh_session_interrupt_timer)
    {
      dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
      dispatch_release(v11);
      g_active_odoh_session_interrupt_timer = 0;
    }
    if (g_pending_odoh_sessions) {
      _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session();
    }
  }
  else
  {
    __int16 v12 = &g_pending_odoh_sessions;
    do
    {
      uint64_t v13 = v12;
      __int16 v14 = (void *)*v12;
      __int16 v12 = (uint64_t *)(*v12 + 104);
      if (v14) {
        BOOL v15 = v14 == a1;
      }
      else {
        BOOL v15 = 1;
      }
    }
    while (!v15);
    if (v14)
    {
      *uint64_t v13 = a1[13];
      a1[13] = 0;
      os_release(a1);
    }
    if (!g_pending_odoh_sessions)
    {
      uint64_t v16 = g_active_odoh_session_interrupt_timer;
      if (g_active_odoh_session_interrupt_timer)
      {
        dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
        dispatch_release(v16);
        g_active_odoh_session_interrupt_timer = 0;
      }
    }
  }
  uint64_t v17 = (void *)a1[23];
  if (v17)
  {
    os_release(v17);
    a1[23] = 0;
  }
}

void _mdns_url_session_forget_crypto(void *a1)
{
  uint64_t v2 = (void *)a1[19];
  if (v2)
  {
    memset_s(v2, a1[20], 0, a1[20]);
    BOOL v3 = (void *)a1[19];
    if (v3)
    {
      free(v3);
      a1[19] = 0;
    }
  }
  a1[20] = 0;
  uint64_t v4 = (void *)a1[21];
  if (v4)
  {
    memset_s(v4, a1[22], 0, a1[22]);
    sockaddr v5 = (void *)a1[21];
    if (v5)
    {
      free(v5);
      a1[21] = 0;
    }
  }
  a1[22] = 0;
}

void _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session()
{
  uint64_t v0 = (void *)g_active_odoh_sessions;
  if (g_active_odoh_sessions) {
    BOOL v1 = g_active_odoh_session_interrupt_timer == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    uint64_t v2 = mach_continuous_time() - v0[12];
    if (mdns_mach_ticks_per_second_s_once != -1) {
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
    }
    if (v2 / mdns_mach_ticks_per_second_s_ticks_per_second > 9) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = 10000
    }
         - (1000 * (v2 % mdns_mach_ticks_per_second_s_ticks_per_second) / mdns_mach_ticks_per_second_s_ticks_per_second
          + 1000 * (v2 / mdns_mach_ticks_per_second_s_ticks_per_second));
    g_active_odoh_session_interrupt_timer = (uint64_t)_mdns_resolver_create_oneshot_timer(v3, 5u);
    if (g_active_odoh_session_interrupt_timer)
    {
      os_retain(v0);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke;
      handler[3] = &__block_descriptor_tmp_91_1388;
      handler[4] = v0;
      dispatch_source_set_event_handler((dispatch_source_t)g_active_odoh_session_interrupt_timer, handler);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 0x40000000;
      v4[2] = ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke_2;
      v4[3] = &__block_descriptor_tmp_92;
      v4[4] = v0;
      dispatch_source_set_cancel_handler((dispatch_source_t)g_active_odoh_session_interrupt_timer, v4);
      dispatch_activate((dispatch_object_t)g_active_odoh_session_interrupt_timer);
    }
  }
}

void ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke(uint64_t a1)
{
  uint64_t v2 = g_active_odoh_session_interrupt_timer;
  if (g_active_odoh_session_interrupt_timer)
  {
    dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
    dispatch_release(v2);
    g_active_odoh_session_interrupt_timer = 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);

  _mdns_common_session_finish(v3, 4, 0);
}

void ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke_2(uint64_t a1)
{
}

uint64_t _mdns_url_session_activate(void *a1)
{
  if (*(void *)(a1[23] + 176))
  {
    if ((unint64_t)g_pending_odoh_connection_count >= 0xA)
    {
      BOOL v1 = &g_pending_odoh_sessions;
      do
      {
        uint64_t v2 = v1;
        uint64_t v3 = *v1;
        BOOL v1 = (uint64_t *)(*v1 + 104);
      }
      while (v3);
      *uint64_t v2 = (uint64_t)a1;
      os_retain(a1);
      _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session();
    }
    else
    {
      _mdns_url_session_activate_for_odoh(a1);
    }
  }
  else
  {
    _mdns_common_session_make_ready_async(a1);
  }
  return 0;
}

uint64_t _mdns_url_session_initialize(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int v14 = 0;
  if (*(_DWORD *)(a2[2] + 144) == 4) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)(a1 + 184) = v4;
  if (v4)
  {
    os_retain(v4);
    sockaddr v5 = *(uint64_t (**)(void *, unsigned int *))(a2[2] + 112);
    if (v5)
    {
      int v6 = v5(a2, &v14);
      uint64_t result = v14;
      if (!v14)
      {
        uint64_t v8 = nw_parameters_copy_url_endpoint();
        *(void *)(a1 + 112) = v8;
        if (v8)
        {
          BOOL v9 = nw_parameters_copy(v6);
          *(void *)(a1 + 120) = v9;
          int v10 = nw_parameters_copy_default_protocol_stack(v9);
          nw_protocol_stack_clear_application_protocols(v10);
          if (v10) {
            nw_release(v10);
          }
          nw_parameters_set_metadata();
          nw_parameters_set_fast_open_enabled(*(nw_parameters_t *)(a1 + 120), 1);
          return v14;
        }
        else
        {
          return 4294960567;
        }
      }
    }
    else
    {
      return 4294960561;
    }
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v11 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = *(unsigned int *)(a2[2] + 144);
      if (v12 > 4) {
        uint64_t v13 = "<INVALID RESOLVER TYPE>";
      }
      else {
        uint64_t v13 = off_264D07F20[v12];
      }
      *(_DWORD *)long long buf = 136446210;
      uint64_t v16 = v13;
      _os_log_fault_impl(&dword_23814D000, v11, OS_LOG_TYPE_FAULT, "Trying to initialize an mdns_url_session using a non-https resolver of type %{public}s", buf, 0xCu);
    }
    return 4294960540;
  }
  return result;
}

void _mdns_url_session_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[14];
  if (v2)
  {
    nw_release(v2);
    a1[14] = 0;
  }
  uint64_t v3 = (void *)a1[15];
  if (v3)
  {
    nw_release(v3);
    a1[15] = 0;
  }
  _mdns_url_session_forget_crypto(a1);
  uint64_t v4 = (void *)a1[23];
  if (v4)
  {
    os_release(v4);
    a1[23] = 0;
  }
}

void _mdns_udp_socket_session_send(uint64_t a1, dispatch_data_t data)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  size_t v8 = 0;
  buffer_ptr = 0;
  dispatch_data_t v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v8);
  if (v3)
  {
    uint64_t v4 = v3;
    if (sendto(*(_DWORD *)(a1 + 136), buffer_ptr, v8, 0, (const sockaddr *)(a1 + 104), *(_DWORD *)(a1 + 132)) < 0)
    {
      if (*__error())
      {
        int v5 = *__error();
        if (!v5) {
          goto LABEL_11;
        }
      }
      else
      {
        int v5 = -6700;
      }
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      int v6 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 1024;
        int v13 = v5;
        _os_log_error_impl(&dword_23814D000, v6, OS_LOG_TYPE_ERROR, "sending to %@ failed: %{darwin.errno}d", buf, 0x12u);
      }
    }
LABEL_11:
    dispatch_release(v4);
  }
}

void _mdns_udp_socket_session_invalidate(uint64_t a1)
{
  BOOL v1 = *(NSObject **)(a1 + 96);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v1);
    *(void *)(a1 + 96) = 0;
  }
}

uint64_t _mdns_udp_socket_session_activate(uint64_t a1)
{
  uintptr_t v2 = *(int *)(a1 + 136);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF83E8], v2, 0, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  *(void *)(a1 + 96) = v3;
  if (!v3) {
    return 4294960567;
  }
  os_retain((void *)a1);
  dispatch_set_context(*(dispatch_object_t *)(a1 + 96), (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 96), (dispatch_function_t)_mdns_udp_socket_session_read_handler);
  dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 96), (dispatch_function_t)_mdns_udp_socket_session_cancel_handler);
  dispatch_activate(*(dispatch_object_t *)(a1 + 96));
  return 0;
}

void _mdns_udp_socket_session_cancel_handler(_DWORD *object)
{
  int v2 = object[34];
  if ((v2 & 0x80000000) == 0)
  {
    close(v2);
    object[34] = -1;
  }

  os_release(object);
}

void _mdns_udp_socket_session_read_handler(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)&v10.sa_len = 0;
  *(void *)&v10.sa_data[6] = 0;
  int v12 = 0;
  uint64_t v11 = 0;
  socklen_t v9 = 28;
  ssize_t v2 = recvfrom(*(_DWORD *)(a1 + 136), buffer, 0x200uLL, 0, &v10, &v9);
  if (v2 < 0)
  {
    if (*__error())
    {
      uint64_t v3 = *__error();
      if (!v3) {
        goto LABEL_4;
      }
      if (v3 == 35) {
        return;
      }
    }
    else
    {
      uint64_t v3 = 4294960596;
    }
    _mdns_common_session_finish(a1, 3, v3);
    return;
  }
LABEL_4:
  if (*(unsigned char *)(a1 + 105) == 2)
  {
    if (*(_DWORD *)(a1 + 108) != *(_DWORD *)&v10.sa_data[2]) {
      return;
    }
    int v4 = *(unsigned __int16 *)(a1 + 106);
    int v5 = *(unsigned __int16 *)v10.sa_data;
    goto LABEL_7;
  }
  BOOL v6 = *(void *)(a1 + 112) == *(void *)&v10.sa_data[6] && *(void *)(a1 + 120) == v11;
  if (!v6 || *(unsigned __int16 *)(a1 + 106) != *(unsigned __int16 *)v10.sa_data) {
    return;
  }
  if (*(unsigned __int8 *)(a1 + 112) == 254 && (*(unsigned char *)(a1 + 113) & 0xC0) == 0x80)
  {
    int v4 = *(_DWORD *)(a1 + 128);
    if (v4)
    {
      int v5 = v12;
LABEL_7:
      if (v4 != v5) {
        return;
      }
    }
  }
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  dispatch_data_t v7 = dispatch_data_create(buffer, v2, (dispatch_queue_t)_mdns_resolver_queue_s_queue, 0);
  if (v7)
  {
    size_t v8 = v7;
    _mdns_common_session_invoke_receive(a1, (uint64_t)v7);
    dispatch_release(v8);
  }
}

uint64_t _mdns_udp_socket_session_initialize(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, unsigned __int8 *a5)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  nw_endpoint_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(*(void *)(a1 + 32) + 48));
  int sa_family = address->sa_family;
  if (sa_family != 30 && sa_family != 2) {
    return 4294960540;
  }
  int v12 = address;
  v54[0] = 0;
  v54[1] = 0;
  if (sa_family == 30)
  {
    if (*(_DWORD *)&address->sa_data[6] || *(_DWORD *)&address->sa_data[10]) {
      goto LABEL_9;
    }
    int v35 = *(_DWORD *)&address[1].sa_len;
    if (v35)
    {
      if (v35 == -65536)
      {
        int v36 = *(_DWORD *)&address[1].sa_data[2];
LABEL_139:
        LOWORD(v54[0]) = 528;
        WORD1(v54[0]) = *(_WORD *)address->sa_data;
        HIDWORD(v54[0]) = v36;
        int v12 = (const sockaddr *)v54;
        int sa_family = 2;
        goto LABEL_10;
      }
    }
    else
    {
      int v36 = *(_DWORD *)&address[1].sa_data[2];
      if ((v36 | 0x1000000) != 0x1000000) {
        goto LABEL_139;
      }
    }
LABEL_9:
    int sa_family = 30;
  }
LABEL_10:
  if (sa_family == 2) {
    int v13 = 2;
  }
  else {
    int v13 = 30;
  }
  int v14 = socket(v13, 2, 17);
  if (v14 < 0)
  {
    if (*__error())
    {
      uint64_t v16 = *__error();
      if (!v16) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v16 = 4294960596;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v33 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v53[0].val[0] = 134217984;
      *(void *)&v53[0].val[1] = (int)v16;
      _os_log_error_impl(&dword_23814D000, v33, OS_LOG_TYPE_ERROR, "Failed to create UDP socket: %{darwin.errno}ld", (uint8_t *)v53, 0xCu);
    }
    return v16;
  }
LABEL_16:
  int v52 = 1;
  if (sa_family == 2)
  {
    if (!setsockopt(v14, 0xFFFF, 4226, &v52, 4u)) {
      goto LABEL_43;
    }
    if (*__error())
    {
      int v15 = *__error();
      if (!v15) {
        goto LABEL_43;
      }
    }
    else
    {
      int v15 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    id v34 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v53[0].val[0] = 67109120;
      v53[0].val[1] = v15;
      _os_log_error_impl(&dword_23814D000, v34, OS_LOG_TYPE_ERROR, "setsockopt() for SOL_SOCKET/SO_RANDOMPORT failed %{darwin.errno}d", (uint8_t *)v53, 8u);
    }
  }
  else
  {
    uint64_t v50 = a4;
    __int16 v51 = v12;
    uint64_t v17 = a5;
    unsigned int v18 = 0;
    *(void *)&v53[0].val[2] = 0;
    *(void *)&v53[0].val[4] = 0;
    v53[0].val[6] = 0;
    *(void *)v53[0].val = 7708;
    *(_OWORD *)&v53[0].val[2] = *MEMORY[0x263EF88F0];
    while (1)
    {
      uint32_t v19 = arc4random() | 0xFFFFC000;
      HIWORD(v53[0].val[0]) = bswap32(v19) >> 16;
      if (!bind(v14, (const sockaddr *)v53, 0x1Cu))
      {
        int v20 = 0;
        goto LABEL_32;
      }
      if (!*__error()) {
        break;
      }
      int v20 = *__error();
      unsigned int v21 = v18 + 1;
      if (v20 != 48 || v18++ >= 0x270F) {
        goto LABEL_33;
      }
    }
    int v20 = -6700;
LABEL_32:
    unsigned int v21 = v18 + 1;
LABEL_33:
    if (v20)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v23 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)__int16 v56 = v20;
        *(_WORD *)&v56[8] = 1024;
        unsigned int v57 = v21;
        _os_log_error_impl(&dword_23814D000, v23, OS_LOG_TYPE_ERROR, "Binding IPv6 socket to random port failed -- error: %{mdns:err}ld, tries: %d", buf, 0x12u);
      }
    }
    else
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      uint64_t v24 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)__int16 v56 = (unsigned __int16)v19;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v21;
        _os_log_debug_impl(&dword_23814D000, v24, OS_LOG_TYPE_DEBUG, "Binding IPv6 socket to random port succeeded -- port: %u, tries: %d", buf, 0xEu);
      }
    }
    a5 = v17;
    a4 = v50;
    int v12 = v51;
  }
LABEL_43:
  if (!setsockopt(v14, 0xFFFF, 4130, &v52, 4u)) {
    goto LABEL_52;
  }
  if (*__error())
  {
    int v25 = *__error();
    if (!v25) {
      goto LABEL_52;
    }
  }
  else
  {
    int v25 = -6700;
  }
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  size_t v26 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v25;
    _os_log_error_impl(&dword_23814D000, v26, OS_LOG_TYPE_ERROR, "setsockopt() for SOL_SOCKET/SO_NOSIGPIPE failed %{darwin.errno}d", (uint8_t *)v53, 8u);
  }
LABEL_52:
  if (setsockopt(v14, 0xFFFF, 0x10000, &v52, 4u))
  {
    if (*__error())
    {
      int v27 = *__error();
      if (!v27) {
        goto LABEL_61;
      }
    }
    else
    {
      int v27 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    int v28 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v53[0].val[0] = 67109120;
      v53[0].val[1] = v27;
      _os_log_error_impl(&dword_23814D000, v28, OS_LOG_TYPE_ERROR, "setsockopt() for SOL_SOCKET/SO_NOWAKEFROMSLEEP failed %{darwin.errno}d", (uint8_t *)v53, 8u);
    }
  }
LABEL_61:
  int v29 = fcntl(v14, 3, 0);
  if (fcntl(v14, 4, v29 | 4u) == -1 && *__error()) {
    __error();
  }
  long long v30 = *(NSObject **)(a2 + 48);
  if (v30)
  {
    *(_DWORD *)long long buf = 0;
    *(_DWORD *)long long buf = nw_interface_get_index(v30);
    if (sa_family == 2)
    {
      if (!setsockopt(v14, 0, 25, buf, 4u)) {
        goto LABEL_96;
      }
      if (*__error())
      {
        int v31 = *__error();
        if (!v31) {
          goto LABEL_96;
        }
      }
      else
      {
        int v31 = -6700;
      }
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      int v37 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v53[0].val[0] = 67109120;
        v53[0].val[1] = v31;
        uint64_t v38 = "setsockopt() for IPPROTO_IP/IP_BOUND_IF failed %{darwin.errno}d";
        goto LABEL_141;
      }
    }
    else
    {
      if (!setsockopt(v14, 41, 125, buf, 4u)) {
        goto LABEL_96;
      }
      if (*__error())
      {
        int v32 = *__error();
        if (!v32) {
          goto LABEL_96;
        }
      }
      else
      {
        int v32 = -6700;
      }
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      int v37 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v53[0].val[0] = 67109120;
        v53[0].val[1] = v32;
        uint64_t v38 = "setsockopt() for IPPROTO_IPV6/IPV6_BOUND_IF failed %{darwin.errno}d";
LABEL_141:
        _os_log_error_impl(&dword_23814D000, v37, OS_LOG_TYPE_ERROR, v38, (uint8_t *)v53, 8u);
        if (!a4) {
          goto LABEL_126;
        }
        goto LABEL_97;
      }
    }
  }
LABEL_96:
  if (!a4) {
    goto LABEL_126;
  }
LABEL_97:
  int v39 = a4[4];
  if (v39 == 3)
  {
    long long v41 = *(_OWORD *)(*(void *)a4 + 40);
    *(_OWORD *)v53[0].val = *(_OWORD *)(*(void *)a4 + 24);
    *(_OWORD *)&v53[0].val[4] = v41;
    *(_DWORD *)long long buf = audit_token_to_pid(v53);
    if (!setsockopt(v14, 0xFFFF, 4359, buf, 4u)) {
      goto LABEL_126;
    }
    if (*__error())
    {
      int v42 = *__error();
      if (!v42) {
        goto LABEL_126;
      }
    }
    else
    {
      int v42 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v44 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v42;
    id v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED failed %{darwin.errno}d";
LABEL_144:
    _os_log_error_impl(&dword_23814D000, v44, OS_LOG_TYPE_ERROR, v45, (uint8_t *)v53, 8u);
    goto LABEL_126;
  }
  if (v39 == 2)
  {
    if (!setsockopt(v14, 0xFFFF, 4360, a4, 0x10u)) {
      goto LABEL_126;
    }
    if (*__error())
    {
      int v43 = *__error();
      if (!v43) {
        goto LABEL_126;
      }
    }
    else
    {
      int v43 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v44 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v43;
    id v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED_UUID failed %{darwin.errno}d";
    goto LABEL_144;
  }
  if (v39 != 1 || !setsockopt(v14, 0xFFFF, 4359, a4, 4u)) {
    goto LABEL_126;
  }
  if (!*__error())
  {
    int v40 = -6700;
LABEL_113:
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v44 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v40;
    id v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED failed %{darwin.errno}d";
    goto LABEL_144;
  }
  int v40 = *__error();
  if (v40) {
    goto LABEL_113;
  }
LABEL_126:
  if (!a5)
  {
LABEL_133:
    if (sa_family == 2) {
      size_t v48 = 16;
    }
    else {
      size_t v48 = 28;
    }
    memcpy((void *)(a1 + 104), v12, v48);
    uint64_t v16 = 0;
    *(_DWORD *)(a1 + 132) = v48;
    *(_DWORD *)(a1 + 136) = v14;
    return v16;
  }
  uint64_t v46 = DomainNameToString(a5, 0, (unsigned __int8 *)v53, 0);
  if (!v46)
  {
    if ((ne_session_set_socket_attributes() & 1) == 0)
    {
      if (_mdns_resolver_log_s_once != -1) {
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
      }
      __int16 v47 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)__int16 v56 = v53;
        _os_log_error_impl(&dword_23814D000, v47, OS_LOG_TYPE_ERROR, "ne_session_set_socket_attributes() failed for '%s'", buf, 0xCu);
      }
    }
    goto LABEL_133;
  }
  uint64_t v16 = v46;
  if ((v14 & 0x80000000) == 0) {
    close(v14);
  }
  return v16;
}

uint64_t _mdns_udp_socket_session_finalize(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 136);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a1 + 136) = -1;
  }
  return result;
}

uint64_t _mdns_udp_socket_session_init(uint64_t result)
{
  *(_DWORD *)(result + 136) = -1;
  return result;
}

uint64_t _mdns_connection_session_is_bytestream(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 104);
}

void _mdns_connection_session_send(uint64_t a1, NSObject *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  BOOL v6 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 96);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v13 = v10;
    _os_log_debug_impl(&dword_23814D000, v6, OS_LOG_TYPE_DEBUG, "Sending message on connection %@", buf, 0xCu);
  }
  uint64_t started = _mdns_create_and_start_connection_activity(*(void *)(a1 + 96), a3);
  size_t v8 = *(NSObject **)(a1 + 96);
  socklen_t v9 = *MEMORY[0x263F14448];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  void v11[2] = ___mdns_connection_session_send_block_invoke;
  void v11[3] = &__block_descriptor_tmp_80_1414;
  void v11[4] = started;
  void v11[5] = a1;
  nw_connection_send(v8, a2, v9, 1, v11);
}

void ___mdns_connection_session_send_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (*(void *)(*(void *)(a1 + 40) + 96))
    {
      nw_connection_end_activity();
      int v4 = *(void **)(a1 + 32);
    }
    nw_release(v4);
  }
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (*(void *)(v5 + 96))
    {
      _mdns_common_session_finish(v5, 3, 4294960543);
    }
  }
}

void _mdns_connection_session_invalidate(uint64_t a1)
{
  ssize_t v2 = *(NSObject **)(a1 + 96);
  if (v2)
  {
    nw_connection_cancel(v2);
    uint64_t v3 = *(void **)(a1 + 96);
    if (v3)
    {
      nw_release(v3);
      *(void *)(a1 + 96) = 0;
    }
  }
}

uint64_t _mdns_connection_session_activate(nw_connection_t *a1)
{
  os_retain(a1);
  ssize_t v2 = a1[12];
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  nw_connection_set_queue(v2, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  uint64_t v3 = a1[12];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = ___mdns_connection_session_activate_block_invoke;
  v6[3] = &__block_descriptor_tmp_76_1416;
  void v6[4] = a1;
  nw_connection_set_state_changed_handler(v3, v6);
  nw_connection_start(a1[12]);
  int v4 = a1[12];
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 0x40000000;
  completion[2] = ___mdns_connection_session_schedule_receive_block_invoke;
  completion[3] = &__block_descriptor_tmp_78;
  completion[4] = a1;
  nw_connection_receive_message(v4, completion);
  return 0;
}

void ___mdns_connection_session_activate_block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = *(void **)(a1 + 32);
  if (v4[12])
  {
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    uint64_t v5 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = nw_connection_state_to_string();
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
      int v8 = 136315394;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_debug_impl(&dword_23814D000, v5, OS_LOG_TYPE_DEBUG, "Connection state changed to %s for connection %@", (uint8_t *)&v8, 0x16u);
    }
    switch(a2)
    {
      case 3:
        _mdns_common_session_invoke_ready_event_handler(*(void *)(a1 + 32));
        break;
      case 4:
        _mdns_common_session_finish(*(void *)(a1 + 32), 3, 4294960543);
        break;
      case 5:
        int v4 = *(void **)(a1 + 32);
LABEL_10:
        os_release(v4);
        break;
    }
  }
  else if (a2 == 5)
  {
    goto LABEL_10;
  }
}

void ___mdns_connection_session_schedule_receive_block_invoke(uint64_t a1, uint64_t a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 96))
  {
    if (a2) {
      _mdns_common_session_invoke_receive(v6, a2);
    }
    if (context) {
      BOOL is_final = nw_content_context_get_is_final(context);
    }
    else {
      BOOL is_final = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (a5 || is_final)
    {
      if (a5) {
        uint64_t v12 = 4294960543;
      }
      else {
        uint64_t v12 = 0;
      }
      _mdns_common_session_finish(v10, 3, v12);
    }
    else
    {
      uint64_t v11 = *(NSObject **)(v10 + 96);
      completion[0] = MEMORY[0x263EF8330];
      completion[1] = 0x40000000;
      completion[2] = ___mdns_connection_session_schedule_receive_block_invoke;
      completion[3] = &__block_descriptor_tmp_78;
      completion[4] = v10;
      nw_connection_receive_message(v11, completion);
    }
  }
}

uint64_t _mdns_connection_session_initialize(uint64_t a1, uint64_t a2, int a3, NSObject *a4, unsigned __int8 *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unsigned int v32 = 0;
  uint64_t v8 = *(void *)(a2 + 16);
  if (*(unsigned char *)(v8 + 158)) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = a3 == 0;
  }
  if (v9)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t, unsigned int *))(v8 + 104);
    if (v14)
    {
      uint64_t v15 = v14(a2, &v32);
      char v13 = v32;
      if (v32) {
        return v32;
      }
      uint64_t v12 = v15;
      goto LABEL_11;
    }
    return -6735;
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, unsigned int *))(v8 + 112);
  if (!v10) {
    return -6735;
  }
  uint64_t v11 = v10(a2, &v32);
  if (v32) {
    return v32;
  }
  uint64_t v12 = v11;
  char v13 = 1;
LABEL_11:
  *(unsigned char *)(a1 + 104) = v13;
  if (!a4) {
    goto LABEL_25;
  }
  if ((LODWORD(a4[2].isa) - 1) > 2)
  {
    a4 = 0;
    goto LABEL_25;
  }
  nw_parameters_t v16 = nw_parameters_copy(v12);
  if (!v16) {
    return -6729;
  }
  uint64_t v12 = v16;
  int isa = (int)a4[2].isa;
  switch(isa)
  {
    case 3:
      long long v19 = *(_OWORD *)((char *)a4->isa + 40);
      *(_OWORD *)long long buf = *(_OWORD *)((char *)a4->isa + 24);
      *(_OWORD *)&uint8_t buf[16] = v19;
      nw_parameters_set_source_application();
      break;
    case 2:
      nw_parameters_set_e_proc_uuid();
      break;
    case 1:
      nw_parameters_set_pid();
      break;
  }
  a4 = v12;
LABEL_25:
  uint64_t v20 = *(void *)(a1 + 32);
  unsigned int v21 = *(NSObject **)(v20 + 48);
  if (a5)
  {
    nw_endpoint_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v20 + 48));
    nw_endpoint_t v23 = nw_endpoint_create_address(address);
    if (v23)
    {
      uint64_t v24 = v23;
      int v25 = DomainNameToString(a5, 0, buf, 0);
      if (v25)
      {
        int v28 = v25;
      }
      else
      {
        nw_endpoint_get_port(v24);
        host_with_numeric_int port = nw_endpoint_create_host_with_numeric_port();
        if (host_with_numeric_port)
        {
          int v27 = (void *)host_with_numeric_port;
          nw_endpoint_set_parent_endpoint();
          nw_release(v27);
          unsigned int v21 = v24;
          goto LABEL_39;
        }
        int v28 = -6729;
      }
      nw_release(v24);
    }
    else
    {
      int v28 = -6729;
    }
    if (_mdns_resolver_log_s_once != -1) {
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
    }
    int v29 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v28;
      _os_log_error_impl(&dword_23814D000, v29, OS_LOG_TYPE_ERROR, "Failed to create domain-attributed endpoint for %@: %{mdns:err}ld", buf, 0x16u);
    }
  }
  uint64_t v24 = 0;
LABEL_39:
  nw_connection_t v30 = nw_connection_create(v21, v12);
  *(void *)(a1 + 96) = v30;
  if (v30)
  {
    if (!a4) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  unsigned int v32 = -6729;
  if (a4) {
LABEL_41:
  }
    nw_release(a4);
LABEL_42:
  if (v24) {
    nw_release(v24);
  }
  return v32;
}

void ___mdns_querier_reset_time_limit_block_invoke(uint64_t a1)
{
}

void ___mdns_querier_conclude_async_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, 0);
  ssize_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

void _mdns_querier_set_query(uint64_t a1, void *a2, __int16 a3, __int16 a4)
{
  mdns_query_message_set_qname(*(void *)(a1 + 88), a2);
  uint64_t v7 = *(void *)(a1 + 88);
  if ((*(unsigned char *)(v7 + 70) & 0x20) == 0)
  {
    *(_WORD *)(v7 + 64) = a3;
    *(_WORD *)(v7 + 66) = a4;
  }
}

uint64_t _mdns_querier_get_internal_queue()
{
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  return _mdns_resolver_queue_s_queue;
}

void _mdns_querier_finalize(void *a1)
{
  a1[9] = 0;
  ssize_t v2 = (void *)a1[8];
  if (v2)
  {
    os_release(v2);
    a1[8] = 0;
  }
  uint64_t v3 = (const void *)a1[10];
  if (v3)
  {
    _Block_release(v3);
    a1[10] = 0;
  }
  int v4 = (void *)a1[11];
  if (v4)
  {
    os_release(v4);
    a1[11] = 0;
  }
  uint64_t v5 = (void *)a1[16];
  if (v5)
  {
    free(v5);
    a1[16] = 0;
  }
  uint64_t v6 = (void *)a1[17];
  if (v6)
  {
    os_release(v6);
    a1[17] = 0;
  }
  uint64_t v7 = (void *)a1[20];
  if (v7)
  {
    os_release(v7);
    a1[20] = 0;
  }
  uint64_t v8 = (void *)a1[24];
  if (v8)
  {
    os_release(v8);
    a1[24] = 0;
  }

  _mdns_querier_clear_delegation((uint64_t)a1);
}

void _mdns_querier_clear_delegation(uint64_t a1)
{
  ssize_t v2 = (void **)(a1 + 168);
  int v3 = *(_DWORD *)(a1 + 184);
  switch(v3)
  {
    case 3:
      if (*v2)
      {
        os_release(*v2);
        *ssize_t v2 = 0;
      }
      break;
    case 2:
      uuid_clear((unsigned __int8 *)(a1 + 168));
      break;
    case 1:
      *(_DWORD *)ssize_t v2 = 0;
      break;
  }
  *(_DWORD *)(a1 + 184) = 0;
}

void *_mdns_querier_copy_description(void *a1, int a2, char a3)
{
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
    goto LABEL_18;
  }
  if (mdns_string_builder_append_description(v7, *(void *)(a1[11] + 56), a3)) {
    goto LABEL_18;
  }
  if (DNSRecordTypeValueToString(*(unsigned __int16 *)(a1[11] + 64))
     ? mdns_string_builder_append_formatted(v7, " %s")
     : mdns_string_builder_append_formatted(v7, " TYPE%u"))
  {
    goto LABEL_18;
  }
  int v10 = *(unsigned __int16 *)(a1[11] + 66);
  uint64_t v11 = "ANY";
  if (v10 != 255) {
    uint64_t v11 = 0;
  }
  if (v10 == 1) {
    uint64_t v11 = "IN";
  }
  if (v11
     ? mdns_string_builder_append_formatted(v7, " %s")
     : mdns_string_builder_append_formatted(v7, " CLASS%u"))
  {
LABEL_18:
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v9;
}

void mdns_resolver_invalidate(void *a1)
{
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1) {
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_145);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __mdns_resolver_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_4_1438;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void __mdns_resolver_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 136))
  {
    *(unsigned char *)(v2 + 136) = 1;
    int v3 = *(NSObject **)(v2 + 104);
    if (v3)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 104));
      dispatch_release(v3);
      *(void *)(v2 + 104) = 0;
    }
    uint64_t v4 = *(void *)(v2 + 112);
    if (v4)
    {
      mdns_client_invalidate(v4);
      os_release(*(void **)(v2 + 112));
      *(void *)(v2 + 112) = 0;
    }
    while (1)
    {
      uint64_t v8 = *(void *)(v2 + 24);
      if (!v8) {
        break;
      }
      *(void *)(v2 + 24) = *(void *)(v8 + 24);
      if (*(void *)(v8 + 56))
      {
        nw_path_evaluator_cancel();
        uint64_t v5 = *(void **)(v8 + 56);
        if (v5)
        {
          nw_release(v5);
          *(void *)(v8 + 56) = 0;
        }
      }
      uint64_t v6 = *(unsigned char **)(v8 + 32);
      if (v6)
      {
        _mdns_session_invalidate(v6);
        os_release(*(void **)(v8 + 32));
        *(void *)(v8 + 32) = 0;
      }
      uint64_t v7 = *(NSObject **)(v8 + 40);
      if (v7)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(v8 + 40));
        dispatch_release(v7);
        *(void *)(v8 + 40) = 0;
      }
    }
    _mdns_resolver_invalidate_and_forget_queriers((void **)(v2 + 32));
    _mdns_resolver_invalidate_and_forget_queriers((void **)(v2 + 40));
    BOOL v9 = *(NSObject **)(v2 + 96);
    if (v9)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 96));
      dispatch_release(v9);
      *(void *)(v2 + 96) = 0;
    }
    if (*(void *)(v2 + 80))
    {
      os_retain((void *)v2);
      int v10 = *(NSObject **)(v2 + 72);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___mdns_resolver_invalidate_internal_block_invoke;
      block[3] = &__block_descriptor_tmp_49;
      void block[4] = v2;
      dispatch_async(v10, block);
    }
  }
  os_release(*(void **)(a1 + 32));
}

void _mdns_resolver_invalidate_and_forget_queriers(void **a1)
{
  BOOL v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    do
    {
      uint64_t v2 = (void *)v1[7];
      v1[7] = 0;
      _mdns_querier_conclude_ex((uint64_t)v1, 4, 0, 0);
      os_release(v1);
      BOOL v1 = v2;
    }
    while (v2);
  }
}

void ___mdns_resolver_invalidate_internal_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

void __mdns_resolver_prepare_for_system_sleep_block_invoke()
{
  if (_mdns_resolver_log_s_once != -1) {
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_54);
  }
  uint64_t v0 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_23814D000, v0, OS_LOG_TYPE_INFO, "Preparing for system sleep", v2, 2u);
  }
  BOOL v1 = (void *)MEMORY[0x23EC893C0]();
  _http_task_shared_session_critical_region(&__block_literal_global_747);
}

uint64_t mdns_querier_set_dnssec_ok(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 49))
  {
    uint64_t v2 = *(void *)(result + 88);
    if ((*(unsigned char *)(v2 + 70) & 0x20) == 0)
    {
      if (a2) {
        char v3 = 4;
      }
      else {
        char v3 = 0;
      }
      *(unsigned char *)(v2 + 70) = *(unsigned char *)(v2 + 70) & 0xFB | v3;
    }
  }
  return result;
}

uint64_t mdns_querier_set_checking_disabled(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 49))
  {
    uint64_t v2 = *(void *)(result + 88);
    if ((*(unsigned char *)(v2 + 70) & 0x20) == 0)
    {
      if (a2) {
        char v3 = 2;
      }
      else {
        char v3 = 0;
      }
      *(unsigned char *)(v2 + 70) = *(unsigned char *)(v2 + 70) & 0xFD | v3;
    }
  }
  return result;
}

void mdns_querier_set_delegator_pid(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 49))
  {
    _mdns_querier_clear_delegation(a1);
    *(_DWORD *)(a1 + 184) = 1;
    *(_DWORD *)(a1 + 168) = a2;
  }
}

void mdns_querier_set_delegator_uuid(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 49))
  {
    memset(dst, 0, sizeof(dst));
    uuid_copy(dst, a2);
    _mdns_querier_clear_delegation(a1);
    *(_DWORD *)(a1 + 184) = 2;
    uuid_copy((unsigned __int8 *)(a1 + 168), dst);
  }
}

uint64_t mdns_querier_set_user_id(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 49)) {
    *(_DWORD *)(result + 232) = a2;
  }
  return result;
}

void mdns_querier_set_result_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 49))
  {
    if (aBlock) {
      char v3 = _Block_copy(aBlock);
    }
    else {
      char v3 = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 80);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 80) = v3;
  }
}

void __mdns_querier_set_time_limit_ms_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 249) != 3)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(v2 + 224) = v3;
    int v4 = _mdns_querier_reset_time_limit(v2, v3);
    if (v4) {
      _mdns_querier_conclude_with_error_async((void *)v2, v4);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);

  os_release(v5);
}

uint64_t mdns_querier_get_qname(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)(a1 + 88) + 56) + 24);
}

uint64_t mdns_querier_get_qtype(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 88))();
}

uint64_t mdns_querier_get_qclass(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 96))();
}

uint64_t mdns_querier_get_resolver_type(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 16) + 144);
}

uint64_t mdns_querier_get_result_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 248);
}

uint64_t mdns_querier_get_send_count(uint64_t a1)
{
  return atomic_load((unsigned int *)(a1 + 208));
}

uint64_t mdns_querier_get_query_length(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 88) + 40);
}

uint64_t mdns_querier_get_response_ptr(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if (v1) {
    return *(void *)(v1 + 32);
  }
  else {
    return 0;
  }
}

uint64_t mdns_querier_get_response_length(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if (v1) {
    return *(unsigned int *)(v1 + 40);
  }
  else {
    return 0;
  }
}

uint64_t mdns_querier_response_is_fabricated(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 253);
}

uint64_t mdns_querier_get_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 240);
}

uint64_t mdns_querier_get_dnssec_ok(uint64_t a1)
{
  return (*(unsigned __int8 *)(*(void *)(a1 + 88) + 70) >> 2) & 1;
}

BOOL mdns_querier_match(uint64_t a1, unsigned __int8 *a2, int a3, int a4)
{
  uint64_t v4 = *(void *)(a1 + 88);
  BOOL result = 0;
  if (*(unsigned __int16 *)(v4 + 64) == a3 && *(unsigned __int16 *)(v4 + 66) == a4)
  {
    uint64_t v5 = *(unsigned __int8 **)(*(void *)(v4 + 56) + 24);
    if (v5)
    {
      if (DomainNameEqual(v5, a2)) {
        return 1;
      }
    }
  }
  return result;
}

BOOL mdns_querier_has_concluded(uint64_t a1)
{
  return *(unsigned char *)(a1 + 248) != 0;
}

uint64_t mdns_querier_get_user_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 232);
}

uint64_t mdns_querier_set_context(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(result + 49)) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

uint64_t mdns_querier_get_context(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t mdns_querier_set_context_finalizer(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(result + 49)) {
    *(void *)(result + 40) = a2;
  }
  return result;
}

uint64_t mdns_querier_set_start_time_leeway(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 49)) {
    *(_DWORD *)(result + 236) = a2;
  }
  return result;
}

uint64_t mdns_querier_enable_sensitive_logging(uint64_t result, char a2)
{
  if (!*(unsigned char *)(result + 49)) {
    *(unsigned char *)(result + 255) = a2;
  }
  return result;
}

uint64_t mdns_security_create_self_signed_certificate(uint64_t a1, uint64_t a2, void *a3, int a4, int *a5)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  int valuePtr = a4;
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (!v7) {
    goto LABEL_21;
  }
  CFNumberRef v8 = v7;
  BOOL v9 = (void *)*MEMORY[0x263F16F98];
  keys[0] = *(void **)MEMORY[0x263F16FA8];
  keys[1] = v9;
  values[0] = a3;
  values[1] = v7;
  CFDictionaryRef v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(v8);
  if (!v10)
  {
LABEL_21:
    uint64_t v16 = 0;
    int v12 = -6729;
    goto LABEL_16;
  }
  keys[0] = 0;
  SecKeyRef RandomKey = SecKeyCreateRandomKey(v10, (CFErrorRef *)keys);
  if (RandomKey)
  {
    int v12 = 0;
  }
  else
  {
    if (!keys[0])
    {
      CFDictionaryRef v18 = v10;
LABEL_20:
      CFRelease(v18);
      uint64_t v16 = 0;
      int v12 = -6700;
      goto LABEL_16;
    }
    int Code = CFErrorGetCode((CFErrorRef)keys[0]);
    if (Code) {
      int v12 = Code;
    }
    else {
      int v12 = -6700;
    }
  }
  if (keys[0]) {
    CFRelease(keys[0]);
  }
  CFRelease(v10);
  if (!RandomKey)
  {
    uint64_t v16 = 0;
    goto LABEL_16;
  }
  uint64_t SelfSignedCertificate = SecGenerateSelfSignedCertificate();
  if (!SelfSignedCertificate)
  {
    CFDictionaryRef v18 = RandomKey;
    goto LABEL_20;
  }
  uint64_t v15 = (const void *)SelfSignedCertificate;
  uint64_t v16 = SecIdentityCreate();
  if (!v16) {
    int v12 = -6700;
  }
  CFRelease(RandomKey);
  CFRelease(v15);
LABEL_16:
  if (a5) {
    *a5 = v12;
  }
  return v16;
}

uint64_t mdns_security_set_per_user_certificate_trust_settings()
{
  if (!SecTrustStoreForDomain()) {
    return 4294960596;
  }

  return MEMORY[0x270EFDE38]();
}

uint64_t mdns_security_remove_per_user_certificate_trust_settings()
{
  if (!SecTrustStoreForDomain()) {
    return 4294960596;
  }

  return MEMORY[0x270EFDE30]();
}

os_log_t ___mdns_signed_result_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "signed_result");
  _mdns_signed_result_log_s_os_log_t log = (uint64_t)result;
  return result;
}

uint64_t _mdns_necp_validate_result()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
  if (_mdns_necp_get_shared_fd_s_fd < 0)
  {
    _mdns_necp_get_shared_fd_s_fd = necp_open();
    if (_mdns_necp_get_shared_fd_s_fd < 0)
    {
      if (*__error())
      {
        uint64_t v0 = *__error();
        os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
        if (!v0) {
          goto LABEL_4;
        }
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
        uint64_t v0 = 4294960596;
      }
      if (_mdns_signed_result_log_s_once != -1) {
        dispatch_once(&_mdns_signed_result_log_s_once, &__block_literal_global_1500);
      }
      uint64_t v1 = _mdns_signed_result_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_signed_result_log_s_log, OS_LOG_TYPE_ERROR))
      {
        int v4 = 134217984;
        uint64_t v5 = (int)v0;
        uint64_t v2 = "Failed to create NECP file descriptor: %{mdns:err}ld";
        goto LABEL_23;
      }
      return v0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
LABEL_4:
  if (!necp_client_action()) {
    return 0;
  }
  if (*__error())
  {
    uint64_t v0 = *__error();
    if (!v0) {
      return v0;
    }
  }
  else
  {
    uint64_t v0 = 4294960596;
  }
  if (_mdns_signed_result_log_s_once != -1) {
    dispatch_once(&_mdns_signed_result_log_s_once, &__block_literal_global_1500);
  }
  uint64_t v1 = _mdns_signed_result_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_signed_result_log_s_log, OS_LOG_TYPE_ERROR))
  {
    int v4 = 134217984;
    uint64_t v5 = (int)v0;
    uint64_t v2 = "Failed to validate data: %{mdns:err}ld";
LABEL_23:
    _os_log_error_impl(&dword_23814D000, v1, OS_LOG_TYPE_ERROR, v2, (uint8_t *)&v4, 0xCu);
  }
  return v0;
}

uint64_t _mdns_signed_browse_result_get_uuid(uint64_t a1)
{
  return *(void *)(a1 + 32) + 32;
}

uint64_t _mdns_signed_browse_result_get_data(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 40);
  }
  return *(void *)(a1 + 32);
}

void _mdns_signed_browse_result_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  unsigned int v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  a1[5] = 0;
}

void *_mdns_signed_browse_result_copy_description(void *a1, int a2, int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  CFNumberRef v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = a1[4];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)(v8 + 32), out);
  BOOL v9 = 0;
  if (!mdns_string_builder_append_formatted(v7, "client ID: %s, service instance: ", out))
  {
    if (!_mdns_string_builder_append_domain_name_string(v7, v8 + 58, *(unsigned __int16 *)(v8 + 56), a3))
    {
      BOOL v9 = mdns_string_builder_copy_string((uint64_t)v7);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  os_release(v7);
  return v9;
}

uint64_t _mdns_string_builder_append_domain_name_string(void *a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 > 0x3F0) {
    return mdns_string_builder_append_formatted(a1, "«TOO LONG: %zu chars»");
  }
  if (!a4) {
    return mdns_string_builder_append_formatted(a1, "%.*s");
  }
  __memcpy_chk();
  v7[a3] = 0;
  DNSMessagePrintObfuscatedString((uint64_t)v8, 64, v7);
  return mdns_string_builder_append_formatted(a1, "%s");
}

uint64_t _mdns_signed_result_compute_txt_rdata_24_bit_hash(int a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int v3 = 16777619 * ((16777619 * (a1 ^ (a3 >> 8))) ^ a3);
  if (a3)
  {
    uint64_t v4 = a3;
    do
    {
      int v5 = *a2++;
      unsigned int v3 = 16777619 * (v3 ^ v5);
      --v4;
    }
    while (v4);
  }
  return v3 & 0xFFFFFF ^ HIBYTE(v3);
}

uint64_t mdns_signed_browse_result_create_from_data(uint64_t a1, size_t a2, int *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a2 < 0x3A)
  {
    uint64_t v4 = 0;
    int appended = -6743;
    goto LABEL_16;
  }
  uint64_t v4 = a1;
  if (*(_DWORD *)(a1 + 48) != 5)
  {
    uint64_t v4 = 0;
    int appended = -6756;
    goto LABEL_16;
  }
  unint64_t v5 = *(unsigned __int16 *)(a1 + 56);
  if (a2 - 58 < v5)
  {
    uint64_t v4 = 0;
    int appended = -6750;
    goto LABEL_16;
  }
  if (v5 > 0x3F0)
  {
    uint64_t v4 = 0;
    int appended = -6744;
    goto LABEL_16;
  }
  __memcpy_chk();
  v16[v5] = 0;
  v15[0] = 0;
  int appended = DomainNameAppendString(v15, v16, 0);
  if (appended || (int appended = _mdns_necp_validate_result()) != 0)
  {
    uint64_t v4 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = malloc_type_malloc(a2, 0xA172743EuLL);
  if (!v8)
  {
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v5 = (unint64_t)v8;
  memcpy(v8, (const void *)v4, a2);
  uint64_t v9 = _os_object_alloc();
  uint64_t v4 = v9;
  if (!v9)
  {
LABEL_25:
    free((void *)v5);
    int appended = -6728;
    goto LABEL_16;
  }
  CFDictionaryRef v10 = &_mdns_signed_browse_result_kind;
  *(void *)(v9 + 16) = &_mdns_signed_browse_result_kind;
  do
  {
    uint64_t v11 = (void (*)(uint64_t))v10[2];
    if (v11) {
      v11(v4);
    }
    CFDictionaryRef v10 = (_UNKNOWN **)*v10;
  }
  while (v10);
  DomainNameDupEx(v15, 0, (unsigned __int8 **)(v4 + 24), 0);
  int v12 = -2128831035;
  for (uint64_t i = 32; i != 48; ++i)
    int v12 = 16777619 * (v12 ^ *(unsigned __int8 *)(v5 + i));
  int appended = 0;
  *(_DWORD *)(v4 + 48) = v12;
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = a2;
LABEL_16:
  if (a3) {
    *a3 = appended;
  }
  return v4;
}

BOOL mdns_signed_browse_result_contains(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  if (!a3) {
    return DomainNameEqual(*(unsigned __int8 **)(a1 + 24), a2) != 0;
  }
  uint64_t v3 = 0;
  unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 52);
  int v5 = *(_DWORD *)(a1 + 48);
  unsigned int v7 = bswap32(a3);
  do
    LOWORD(v5) = 403 * (v5 ^ *((unsigned __int8 *)&v7 + v3++));
  while (v3 != 4);
  return HIBYTE(v4) == (v5 ^ BYTE1(v5))
      && DomainNameEqual(*(unsigned __int8 **)(a1 + 24), a2) != 0;
}

BOOL mdns_signed_browse_result_covers_txt_rdata(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  if (a3 >> 16) {
    return 0;
  }
  int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 52) & 0xFFFFFF;
  return v3 == _mdns_signed_result_compute_txt_rdata_24_bit_hash(*(_DWORD *)(a1 + 48), a2, (unsigned __int16)a3);
}

uint64_t _mdns_signed_resolve_result_get_uuid(uint64_t a1)
{
  return *(void *)(a1 + 32) + 32;
}

uint64_t _mdns_signed_resolve_result_get_data(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 40);
  }
  return *(void *)(a1 + 32);
}

void _mdns_signed_resolve_result_finalize(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  int v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  a1[5] = 0;
}

void *_mdns_signed_resolve_result_copy_description(void *a1, int a2, int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  unsigned int v7 = v6;
  if (!a2 || !mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
    uint64_t v9 = a1[4];
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)(v9 + 32), out);
    uint64_t v8 = 0;
    if (mdns_string_builder_append_formatted(v7, "client ID: %s", out)) {
      goto LABEL_6;
    }
    uint64_t v11 = 0;
    v14[0] = "service instance";
    v14[1] = v9 + 62;
    unsigned __int16 v15 = *(_WORD *)(v9 + 56);
    int v16 = 0;
    __int16 v17 = 0;
    CFDictionaryRef v18 = "hostname";
    uint64_t v19 = v9 + 62 + v15;
    __int16 v20 = *(_WORD *)(v9 + 60);
    char v12 = 1;
    while (1)
    {
      char v13 = v12;
      if (mdns_string_builder_append_formatted(v7, ", %s: ", (const char *)v14[3 * v11])
        || _mdns_string_builder_append_domain_name_string(v7, v14[3 * v11 + 1], LOWORD(v14[3 * v11 + 2]), a3))
      {
        break;
      }
      char v12 = 0;
      uint64_t v11 = 1;
      if ((v13 & 1) == 0)
      {
        if (mdns_string_builder_append_formatted(v7, ", port: %u", bswap32(*(unsigned __int16 *)(v9 + 58)) >> 16))break; {
        uint64_t v8 = mdns_string_builder_copy_string((uint64_t)v7);
        }
        goto LABEL_6;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  os_release(v7);
  return v8;
}

uint64_t mdns_signed_resolve_result_create_from_data(uint64_t a1, size_t a2, int *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  size_t v4 = a2 - 62;
  if (a2 < 0x3E)
  {
    uint64_t v5 = 0;
    int appended = -6743;
    goto LABEL_18;
  }
  uint64_t v5 = a1;
  if (*(_DWORD *)(a1 + 48) != 6)
  {
    uint64_t v5 = 0;
    int appended = -6756;
    goto LABEL_18;
  }
  size_t v6 = *(unsigned __int16 *)(a1 + 56);
  BOOL v7 = v4 >= v6;
  unint64_t v8 = v4 - v6;
  if (!v7 || (unint64_t v9 = *(unsigned __int16 *)(a1 + 60), v8 < v9))
  {
    uint64_t v5 = 0;
    int appended = -6750;
    goto LABEL_18;
  }
  if (v9 > 0x3F0)
  {
    uint64_t v5 = 0;
    int appended = -6744;
    goto LABEL_18;
  }
  __memcpy_chk();
  v20[v9] = 0;
  v19[0] = 0;
  int appended = DomainNameAppendString(v19, v20, 0);
  if (appended || (int appended = _mdns_necp_validate_result()) != 0)
  {
    uint64_t v5 = 0;
    goto LABEL_18;
  }
  char v12 = malloc_type_malloc(a2, 0xA172743EuLL);
  if (!v12)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v9 = (unint64_t)v12;
  memcpy(v12, (const void *)v5, a2);
  uint64_t v13 = _os_object_alloc();
  uint64_t v5 = v13;
  if (!v13)
  {
LABEL_27:
    free((void *)v9);
    int appended = -6728;
    goto LABEL_18;
  }
  uint64_t v14 = &_mdns_signed_resolve_result_kind;
  *(void *)(v13 + 16) = &_mdns_signed_resolve_result_kind;
  do
  {
    unsigned __int16 v15 = (void (*)(uint64_t))v14[2];
    if (v15) {
      v15(v5);
    }
    uint64_t v14 = (_UNKNOWN **)*v14;
  }
  while (v14);
  DomainNameDupEx(v19, 0, (unsigned __int8 **)(v5 + 24), 0);
  int v16 = -2128831035;
  for (uint64_t i = 32; i != 48; ++i)
    int v16 = 16777619 * (v16 ^ *(unsigned __int8 *)(v9 + i));
  int appended = 0;
  *(_DWORD *)(v5 + 48) = v16;
  *(void *)(v5 + 32) = v9;
  *(void *)(v5 + 40) = a2;
LABEL_18:
  if (a3) {
    *a3 = appended;
  }
  return v5;
}

BOOL mdns_signed_resolve_result_covers_txt_rdata(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  if (a3 >> 16) {
    return 0;
  }
  int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 52) & 0xFFFFFF;
  return v3 == _mdns_signed_result_compute_txt_rdata_24_bit_hash(*(_DWORD *)(a1 + 48), a2, (unsigned __int16)a3);
}

uint64_t _mdns_signed_hostname_result_get_uuid(uint64_t a1)
{
  return *(void *)(a1 + 24) + 32;
}

uint64_t _mdns_signed_hostname_result_get_data(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 32);
  }
  return *(void *)(a1 + 24);
}

void _mdns_signed_hostname_result_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
  *(void *)(a1 + 32) = 0;
}

void *_mdns_signed_hostname_result_copy_description(void *a1, int a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  size_t v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  BOOL v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = a1[3];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)(v8 + 32), out);
  unint64_t v9 = 0;
  if (!mdns_string_builder_append_formatted(v7, "client ID: %s, hostname: ", out))
  {
    if (!_mdns_string_builder_append_domain_name_string(v7, v8 + 88, *(unsigned int *)(v8 + 84), a3)
      && !mdns_string_builder_append_formatted(v7, ", address: "))
    {
      v11[0] = *(_OWORD *)(v8 + 56);
      *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)(v8 + 68);
      if (!mdns_string_builder_append_sockaddr_description(v7, (uint64_t)v11, a3))
      {
        unint64_t v9 = mdns_string_builder_copy_string((uint64_t)v7);
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_9:
  os_release(v7);
  return v9;
}

void *mdns_signed_hostname_result_create_from_data(_DWORD *a1, size_t a2, int *a3)
{
  if (a2 < 0x58)
  {
    uint64_t v8 = 0;
    int v6 = -6743;
  }
  else if (a1[12] == 4)
  {
    if (a2 - 88 < a1[21])
    {
      uint64_t v8 = 0;
      int v6 = -6750;
    }
    else
    {
      int v6 = _mdns_necp_validate_result();
      if (v6)
      {
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v7 = _os_object_alloc();
        uint64_t v8 = v7;
        if (v7)
        {
          unint64_t v9 = &_mdns_signed_hostname_result_kind;
          *(void *)(v7 + 16) = &_mdns_signed_hostname_result_kind;
          do
          {
            CFDictionaryRef v10 = (void (*)(uint64_t))v9[2];
            if (v10) {
              v10(v8);
            }
            unint64_t v9 = (_UNKNOWN **)*v9;
          }
          while (v9);
          os_log_t result = malloc_type_malloc(a2, 0xA172743EuLL);
          if (!result)
          {
            __break(1u);
            return result;
          }
          char v12 = result;
          memcpy(result, a1, a2);
          int v6 = 0;
          *(void *)(v8 + 24) = v12;
          *(void *)(v8 + 32) = a2;
        }
        else
        {
          int v6 = -6728;
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    int v6 = -6756;
  }
  if (a3) {
    *a3 = v6;
  }
  return (void *)v8;
}

void _mdns_string_builder_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
}

void *_mdns_string_builder_copy_description(void *a1, int a2)
{
  size_t v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || mdns_string_builder_append_formatted(v5, "capacity: %zu, string length: %zu", a1[4], a1[5]))
  {
    goto LABEL_4;
  }
  uint64_t v7 = (const char *)v5[3];
  if (v7)
  {
    uint64_t v8 = v5[5];
    size_t v9 = v8 + 1;
    if (v8 == -1)
    {
LABEL_4:
      int v6 = 0;
LABEL_12:
      os_release(v5);
      return v6;
    }
  }
  else
  {
    uint64_t v7 = "";
    size_t v9 = 1;
  }
  os_log_t result = malloc_type_malloc(v9, 0xA172743EuLL);
  if (result)
  {
    int v6 = result;
    memcpy(result, v7, v9);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t mdns_string_builder_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = &_mdns_string_builder_kind;
    *(void *)(v0 + 16) = &_mdns_string_builder_kind;
    do
    {
      int v3 = (void (*)(uint64_t))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(void *)(v1 + 32) = 0;
  }
  return v1;
}

uint64_t mdns_string_builder_append_formatted(void *a1, char *__format, ...)
{
  va_start(va, __format);
  if (a1[3] || (uint64_t result = _mdns_string_builder_grow_buffer(a1, a1[4]), !result))
  {
    for (char i = 1; ; char i = 0)
    {
      size_t v6 = a1[4] - a1[5];
      unsigned int v7 = vsnprintf((char *)(a1[3] + a1[5]), v6, __format, va);
      if ((v7 & 0x80000000) != 0)
      {
        *(unsigned char *)(a1[3] + a1[5]) = 0;
        return 4294960596;
      }
      uint64_t v8 = v7;
      if (v6 > v7)
      {
        uint64_t result = 0;
        a1[5] += v8;
        return result;
      }
      if ((i & 1) == 0) {
        break;
      }
      uint64_t v9 = a1[5];
      uint64_t v10 = v7 + 1;
      BOOL v11 = __CFADD__(v9, v10);
      unint64_t v12 = v9 + v10;
      if (v11) {
        return 4294960567;
      }
      uint64_t v13 = a1[4];
      if (v13 < 0) {
        return 4294960567;
      }
      if (v12 <= 2 * v13) {
        unint64_t v14 = 2 * v13;
      }
      else {
        unint64_t v14 = v12;
      }
      uint64_t result = _mdns_string_builder_grow_buffer(a1, v14);
      if (result) {
        return result;
      }
    }
    return 4294960534;
  }
  return result;
}

uint64_t _mdns_string_builder_grow_buffer(void *a1, unint64_t a2)
{
  if (a1[3] && a1[4] >= a2) {
    return 0;
  }
  if (a2 <= 0x40) {
    size_t v3 = 64;
  }
  else {
    size_t v3 = a2;
  }
  size_t v4 = malloc_good_size(v3);
  if (v4 < v3) {
    return 4294960534;
  }
  size_t v5 = v4;
  size_t v6 = malloc_type_calloc(v4, 1uLL, 0xF1748037uLL);
  if (!v6)
  {
    __break(1u);
    return 0;
  }
  unsigned int v7 = v6;
  uint64_t v8 = (const void *)a1[3];
  if (v8)
  {
    memcpy(v6, v8, a1[5] + 1);
    uint64_t v9 = (void *)a1[3];
    if (v9) {
      free(v9);
    }
  }
  uint64_t result = 0;
  a1[3] = v7;
  a1[4] = v5;
  return result;
}

uint64_t mdns_string_builder_append_description(void *a1, uint64_t a2, char a3)
{
  size_t v4 = (void *)(a2 + 16);
  while (1)
  {
    size_t v4 = (void *)*v4;
    if (!v4) {
      break;
    }
    size_t v5 = (uint64_t (*)(uint64_t, void, void))v4[3];
    if (v5)
    {
      size_t v6 = (const char *)v5(a2, 0, a3 & 1);
      if (v6)
      {
        unsigned int v7 = (char *)v6;
        uint64_t appended = mdns_string_builder_append_formatted(a1, "%s", v6);
        free(v7);
        return appended;
      }
      return 4294960567;
    }
  }
  return 4294960567;
}

uint64_t mdns_string_builder_append_description_with_prefix(void *a1, const char *a2, uint64_t a3, char a4)
{
  if (!a2 || (uint64_t result = mdns_string_builder_append_formatted(a1, "%s", a2), !result))
  {
    return mdns_string_builder_append_description(a1, a3, a4);
  }
  return result;
}

uint64_t mdns_string_builder_append_sockaddr_description(void *a1, uint64_t a2, char a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 != 30)
  {
    if (v6 != 2) {
      return mdns_string_builder_append_formatted(a1, "«UNHANDLED ADDRESS FAMILY: %d»");
    }
    unsigned int v7 = (unsigned int *)(a2 + 4);
    if (a3)
    {
      if ((DNSMessagePrintObfuscatedIPv4Address((uint64_t)v11, 64, bswap32(*v7)) & 0x80000000) != 0) {
        v11[0] = 0;
      }
      uint64_t result = mdns_string_builder_append_formatted(a1, "<IPv4:%s>");
      goto LABEL_14;
    }
    if (inet_ntop(2, v7, v11, 0x10u))
    {
LABEL_5:
      uint64_t result = mdns_string_builder_append_formatted(a1, "%s");
LABEL_14:
      if (result) {
        return result;
      }
      if ((a3 & 2) == 0 && *(_WORD *)(a2 + 2)) {
        return mdns_string_builder_append_formatted(a1, ":%d");
      }
      return 0;
    }
    if (*__error())
    {
      uint64_t result = *__error();
      if (result) {
        return result;
      }
      goto LABEL_5;
    }
    return 4294960596;
  }
  if ((a3 & 2) != 0 || !*(_WORD *)(a2 + 2))
  {
    char v9 = 1;
  }
  else
  {
    uint64_t result = mdns_string_builder_append_formatted(a1, "[");
    if (result) {
      return result;
    }
    char v9 = 0;
  }
  if (a3)
  {
    if ((DNSMessagePrintObfuscatedIPv6Address((uint64_t)v11, 64, a2 + 8) & 0x80000000) != 0) {
      v11[0] = 0;
    }
    uint64_t result = mdns_string_builder_append_formatted(a1, "<IPv6:%s>");
  }
  else
  {
    if (!inet_ntop(30, (const void *)(a2 + 8), v11, 0x2Eu))
    {
      if (!*__error()) {
        return 4294960596;
      }
      uint64_t result = *__error();
      if (result) {
        return result;
      }
    }
    uint64_t result = mdns_string_builder_append_formatted(a1, "%s");
  }
  if (!result)
  {
    unsigned int v10 = *(_DWORD *)(a2 + 24);
    if (!v10
      || (!if_indextoname(v10, v11)
        ? (uint64_t result = mdns_string_builder_append_formatted(a1, "%%%u"))
        : (uint64_t result = mdns_string_builder_append_formatted(a1, "%%%s")),
          !result))
    {
      if ((v9 & 1) == 0) {
        return mdns_string_builder_append_formatted(a1, "]:%d");
      }
      return 0;
    }
  }
  return result;
}

void *mdns_string_builder_copy_string(uint64_t a1)
{
  uint64_t v1 = *(const char **)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    size_t v3 = v2 + 1;
    if (v2 == -1) {
      return 0;
    }
  }
  else
  {
    uint64_t v1 = "";
    size_t v3 = 1;
  }
  uint64_t result = malloc_type_malloc(v3, 0xA172743EuLL);
  if (result)
  {
    size_t v4 = result;
    memcpy(result, v1, v3);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t _mdns_symptoms_report_dns_server_symptom(uint64_t a1, uint64_t a2)
{
  if (_mdns_symptoms_get_reporter_s_once != -1) {
    dispatch_once(&_mdns_symptoms_get_reporter_s_once, &__block_literal_global_1554);
  }
  uint64_t result = _mdns_symptoms_get_reporter_s_reporter;
  if (_mdns_symptoms_get_reporter_s_reporter)
  {
    int v4 = *(unsigned __int8 *)(a2 + 1);
    if (v4 == 2 || v4 == 30)
    {
      uint64_t v5 = symptom_new();
      symptom_set_additional_qualifier();
      return MEMORY[0x270F79518](v5);
    }
  }
  return result;
}

void ___mdns_symptoms_get_reporter_block_invoke()
{
  if (MEMORY[0x263F7C1B0]) {
    _mdns_symptoms_get_reporter_s_reporter = symptom_framework_init();
  }
}

os_log_t __mdns_system_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "system");
  mdns_system_log_s_os_log_t log = (uint64_t)result;
  return result;
}

uint64_t mdns_system_set_computer_name_with_utf8_cstring(char *cStr, const __CFString *a2, char a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFStringEncoding v5 = 134217984;
  CFStringRef v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (!v6) {
    return 4294960596;
  }
  CFStringRef v7 = v6;
  unsigned int v15 = 0;
  locked_prefs = _mdns_system_create_locked_prefs(a2, a3 & 1, (int *)&v15);
  unint64_t v14 = locked_prefs;
  if (!v15)
  {
    char v9 = locked_prefs;
    if ((a3 & 2) != 0)
    {
      CFStringEncoding nameEncoding = 0;
      CFStringRef v10 = SCDynamicStoreCopyComputerName(0, &nameEncoding);
      CFStringEncoding v5 = v10 ? nameEncoding : 134217984;
      if (v10) {
        CFRelease(v10);
      }
    }
    if (SCPreferencesSetComputerName(v9, v7, v5))
    {
      unsigned int v15 = 0;
LABEL_13:
      unsigned int v15 = _mdns_system_commit_and_apply_prefs(v9);
      goto LABEL_14;
    }
    if (SCError())
    {
      unsigned int v15 = SCError();
      if (!v15) {
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v15 = -6700;
    }
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
    }
    uint64_t v13 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      CFStringEncoding nameEncoding = 138412802;
      CFStringRef v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = (int)v15;
      _os_log_error_impl(&dword_23814D000, v13, OS_LOG_TYPE_ERROR, "SCPreferencesSetComputerName failed -- name: '%@', encoding: 0x%lX, error: %{mdns:err}ld", (uint8_t *)&nameEncoding, 0x20u);
    }
  }
LABEL_14:
  _mdns_system_unlock_and_forget_prefs(&v14);
  uint64_t v11 = v15;
  CFRelease(v7);
  return v11;
}

const __SCPreferences *_mdns_system_create_locked_prefs(CFStringRef name, Boolean a2, int *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CFStringEncoding v5 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x263EFFB08], name, 0, (AuthorizationRef)*MEMORY[0x263F1BCC0]);
  if (!v5)
  {
    if (SCError())
    {
      int v6 = SCError();
      if (!v6) {
        goto LABEL_4;
      }
      int v8 = v6;
    }
    else
    {
      int v8 = -6700;
    }
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
    }
    char v9 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      uint64_t v13 = v8;
      _os_log_error_impl(&dword_23814D000, v9, OS_LOG_TYPE_ERROR, "SCPreferencesCreateWithAuthorization failed: %{mdns:err}ld", (uint8_t *)&v12, 0xCu);
    }
    CFStringRef v7 = 0;
LABEL_23:
    CFStringEncoding v5 = 0;
    if (!a3) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_4:
  if (SCPreferencesLock(v5, a2))
  {
    CFStringRef v7 = 0;
    int v8 = 0;
    if (!a3) {
      goto LABEL_25;
    }
LABEL_24:
    *a3 = v8;
    goto LABEL_25;
  }
  if (!SCError())
  {
    int v8 = -6700;
    goto LABEL_18;
  }
  int v8 = SCError();
  if (v8)
  {
LABEL_18:
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
    }
    CFStringRef v10 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      uint64_t v13 = v8;
      _os_log_error_impl(&dword_23814D000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed: %{mdns:err}ld", (uint8_t *)&v12, 0xCu);
    }
    CFStringRef v7 = v5;
    goto LABEL_23;
  }
  CFStringRef v7 = 0;
  if (a3) {
    goto LABEL_24;
  }
LABEL_25:
  if (v7) {
    CFRelease(v7);
  }
  return v5;
}

uint64_t _mdns_system_commit_and_apply_prefs(const __SCPreferences *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!SCPreferencesCommitChanges(a1))
  {
    if (SCError())
    {
      uint64_t v2 = SCError();
      if (!v2) {
        goto LABEL_4;
      }
      uint64_t v3 = v2;
    }
    else
    {
      uint64_t v3 = 4294960596;
    }
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
    }
    int v4 = mdns_system_log_s_log;
    if (!os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR)) {
      return v3;
    }
    int v7 = 134217984;
    uint64_t v8 = (int)v3;
    CFStringEncoding v5 = "SCPreferencesCommitChanges failed: %{mdns:err}ld";
LABEL_20:
    _os_log_error_impl(&dword_23814D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
    return v3;
  }
LABEL_4:
  if (SCPreferencesApplyChanges(a1)) {
    return 0;
  }
  if (SCError())
  {
    uint64_t v3 = SCError();
    if (!v3) {
      return v3;
    }
  }
  else
  {
    uint64_t v3 = 4294960596;
  }
  if (mdns_system_log_s_once != -1) {
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
  }
  int v4 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    int v7 = 134217984;
    uint64_t v8 = (int)v3;
    CFStringEncoding v5 = "SCPreferencesApplyChanges failed: %{mdns:err}ld";
    goto LABEL_20;
  }
  return v3;
}

void _mdns_system_unlock_and_forget_prefs(const __SCPreferences **a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    if (!SCPreferencesUnlock(v1))
    {
      if (!SCError())
      {
        int v3 = -6700;
        goto LABEL_7;
      }
      int v2 = SCError();
      if (v2)
      {
        int v3 = v2;
LABEL_7:
        if (mdns_system_log_s_once != -1) {
          dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
        }
        int v4 = mdns_system_log_s_log;
        if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
        {
          int v5 = 134217984;
          uint64_t v6 = v3;
          _os_log_error_impl(&dword_23814D000, v4, OS_LOG_TYPE_ERROR, "SCPreferencesUnlock failed: %{mdns:err}ld", (uint8_t *)&v5, 0xCu);
        }
      }
    }
    CFRelease(v1);
  }
}

uint64_t mdns_system_set_local_host_name_with_utf8_cstring(char *cStr, const __CFString *a2, Boolean a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (!v5) {
    return 4294960596;
  }
  CFStringRef v6 = v5;
  unsigned int v13 = 0;
  locked_prefs = _mdns_system_create_locked_prefs(a2, a3, (int *)&v13);
  int v12 = locked_prefs;
  if (!v13)
  {
    uint64_t v8 = locked_prefs;
    if (SCPreferencesSetLocalHostName(locked_prefs, v6))
    {
      unsigned int v13 = 0;
LABEL_7:
      unsigned int v13 = _mdns_system_commit_and_apply_prefs(v8);
      goto LABEL_8;
    }
    if (SCError())
    {
      unsigned int v13 = SCError();
      if (!v13) {
        goto LABEL_7;
      }
    }
    else
    {
      unsigned int v13 = -6700;
    }
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
    }
    uint64_t v11 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = (int)v13;
      _os_log_error_impl(&dword_23814D000, v11, OS_LOG_TYPE_ERROR, "SCPreferencesSetLocalHostName failed -- name: '%@', error: %{mdns:err}ld", buf, 0x16u);
    }
  }
LABEL_8:
  _mdns_system_unlock_and_forget_prefs(&v12);
  uint64_t v9 = v13;
  CFRelease(v6);
  return v9;
}

uint64_t mdns_system_set_ipv4_forwarding(BOOL a1)
{
  return _mhc_set_ip_forwarding(a1, 0);
}

uint64_t mdns_system_set_ipv6_forwarding(BOOL a1)
{
  return _mhc_set_ip_forwarding(a1, 1);
}

char *mdns_system_interface_index_to_name(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = if_indextoname(a1, v9);
  if (v2)
  {
    os_log_t result = strdup(v2);
    if (result) {
      return result;
    }
    goto LABEL_6;
  }
  if (!*__error())
  {
LABEL_7:
    int v4 = -6700;
    goto LABEL_8;
  }
  int v4 = *__error();
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  if (mdns_system_log_s_once != -1) {
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1572);
  }
  CFStringRef v5 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = a1;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_23814D000, v5, OS_LOG_TYPE_ERROR, "if_indextoname() for %u failed: %{darwin.errno}ld", (uint8_t *)v6, 0x12u);
  }
  return 0;
}

uint64_t mdns_system_pid_to_uuid(int a1, unsigned __int8 *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  if (proc_pidinfo(a1, 17, 1uLL, v4, 56) != 56) {
    return 4294960596;
  }
  if (a2) {
    uuid_copy(a2, (const unsigned __int8 *)v4);
  }
  return 0;
}

void mdns_system_remove_network_policy(void *a1)
{
  int v2 = (void *)MEMORY[0x23EC893C0]();
  if (objc_opt_class())
  {
    [a1 removeAllPolicies];
    [a1 apply];
  }
}

id mdns_system_add_net_agent_match_domains(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x23EC893C0]();
  id v4 = objc_alloc_init((Class)&off_26EB26250);
  int v25 = (void *)[objc_alloc((Class)&off_26EB26350) initWithUUIDBytes:a1];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = a2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = objc_alloc((Class)&off_26EB26C70);
          int v12 = unk_26EB265E4(&off_26EB26A48, "netAgentUUID:", v25, context);
          unsigned int v13 = unk_26EB27484(&off_26EB27EE0, "domain:", v10);
          int v31 = v13;
          +[NSArray arrayWithObjects:&v31 count:1];
          v15 = uint64_t v14 = v4;
          __int16 v16 = (void *)[v11 initWithOrder:1 result:v12 conditions:v15];

          id v4 = v14;
          [v14 addPolicy:v16];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }

  id v17 = objc_alloc((Class)&off_26EB26C70);
  uint64_t v18 = unk_26EB265E4(&off_26EB26A48, "netAgentUUID:", v25);
  uint64_t v19 = [v25 UUIDString];
  __int16 v20 = unk_26EB27484(&off_26EB27EE0, "domain:", v19);
  nw_connection_t v30 = v20;
  uint64_t v21 = +[NSArray arrayWithObjects:&v30 count:1];
  uint64_t v22 = (void *)[v17 initWithOrder:1 result:v18 conditions:v21];

  [v4 addPolicy:v22];
  [v4 setPriority:300];
  [v4 apply];

  return v4;
}

uint64_t mdns_tcpinfo_get_ipv4(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(_OWORD *)&void v10[3] = 0u;
  memset(v9, 0, sizeof(v9));
  WORD2(v9[0]) = 528;
  WORD3(v9[0]) = __rev16(a2);
  DWORD2(v9[0]) = bswap32(a1);
  LOWORD(v10[0]) = 528;
  HIWORD(v10[0]) = __rev16(a4);
  *(void *)&v10[1] = bswap32(a3);
  uint64_t info = _mdns_tcpinfo_get_info(v9, a5);
  if (_mdns_tcpinfo_log_s_once != -1) {
    dispatch_once(&_mdns_tcpinfo_log_s_once, &__block_literal_global_1600);
  }
  uint64_t v6 = _mdns_tcpinfo_log_s_log;
  if (info) {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled((os_log_t)_mdns_tcpinfo_log_s_log, v7))
  {
    *(_DWORD *)long long buf = 67110144;
    int v12 = DWORD2(v9[0]);
    __int16 v13 = 1024;
    unsigned int v14 = bswap32(WORD3(v9[0])) >> 16;
    __int16 v15 = 1024;
    int v16 = v10[1];
    __int16 v17 = 1024;
    unsigned int v18 = bswap32(HIWORD(v10[0])) >> 16;
    __int16 v19 = 2048;
    uint64_t v20 = (int)info;
    _os_log_impl(&dword_23814D000, v6, v7, "TCP info get -- local: %{network:in_addr}d:%d, remote: %{network:in_addr}d:%d, error: %{mdns:err}ld", buf, 0x24u);
  }
  return info;
}

uint64_t _mdns_tcpinfo_get_info(unsigned char *a1, void *a2)
{
  *a1 = 6;
  memset(__src, 0, 408);
  size_t v4 = 408;
  if (sysctlbyname("net.inet.tcp.info", __src, &v4, a1, 0x3CuLL) == -1)
  {
    if (!*__error()) {
      return 4294960596;
    }
    uint64_t result = *__error();
    if (!a2) {
      return result;
    }
  }
  else
  {
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
  }
  if (!result)
  {
    memcpy(a2, __src, 0x198uLL);
    return 0;
  }
  return result;
}

os_log_t ___mdns_tcpinfo_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "tcpinfo");
  _mdns_tcpinfo_log_s_os_log_t log = (uint64_t)result;
  return result;
}

uint64_t mdns_tcpinfo_get_ipv6(_OWORD *a1, unsigned int a2, _OWORD *a3, unsigned int a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  memset(v9, 0, 60);
  WORD2(v9[0]) = 7708;
  WORD3(v9[0]) = __rev16(a2);
  *(_OWORD *)((char *)v9 + 12) = *a1;
  LOWORD(v9[2]) = 7708;
  WORD1(v9[2]) = __rev16(a4);
  *(_OWORD *)((char *)&v9[2] + 8) = *a3;
  uint64_t info = _mdns_tcpinfo_get_info(v9, a5);
  if (_mdns_tcpinfo_log_s_once != -1) {
    dispatch_once(&_mdns_tcpinfo_log_s_once, &__block_literal_global_1600);
  }
  uint64_t v6 = _mdns_tcpinfo_log_s_log;
  if (info) {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled((os_log_t)_mdns_tcpinfo_log_s_log, v7))
  {
    *(_DWORD *)long long buf = 68159234;
    int v11 = 16;
    __int16 v12 = 2096;
    unint64_t v13 = (unint64_t)v9 | 0xC;
    __int16 v14 = 1024;
    unsigned int v15 = bswap32(WORD3(v9[0])) >> 16;
    __int16 v16 = 1040;
    int v17 = 16;
    __int16 v18 = 2096;
    __int16 v19 = (char *)&v9[2] + 8;
    __int16 v20 = 1024;
    unsigned int v21 = bswap32(WORD1(v9[2])) >> 16;
    __int16 v22 = 2048;
    uint64_t v23 = (int)info;
    _os_log_impl(&dword_23814D000, v6, v7, "TCP info get -- local: %{network:in6_addr}.16P.%d, remote: %{network:in6_addr}.16P.%d, error: %{mdns:err}ld", buf, 0x38u);
  }
  return info;
}

uint64_t mdns_mach_ticks_per_second()
{
  if (mdns_mach_ticks_per_second_s_once != -1) {
    dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1611);
  }
  return mdns_mach_ticks_per_second_s_ticks_per_second;
}

void __mdns_mach_ticks_per_second_block_invoke()
{
  kern_return_t v1;
  BOOL v2;
  NSObject *v3;
  mach_timebase_info info;
  uint8_t buf[4];
  kern_return_t v6;
  __int16 v7;
  uint32_t numer;
  __int16 v9;
  uint32_t denom;
  uint64_t v11;

  int v11 = *MEMORY[0x263EF8340];
  unint64_t v0 = 1000000000;
  uint64_t info = 0;
  uint64_t v1 = mach_timebase_info(&info);
  if (v1 || (info.numer ? (int v2 = info.denom == 0) : (int v2 = 1), v2))
  {
    if (_mdns_ticks_log_s_once != -1) {
      dispatch_once(&_mdns_ticks_log_s_once, &__block_literal_global_3);
    }
    int v3 = _mdns_ticks_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ticks_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109632;
      uint64_t v6 = v1;
      os_log_type_t v7 = 1024;
      numer = info.numer;
      uint64_t v9 = 1024;
      denom = info.denom;
      _os_log_error_impl(&dword_23814D000, v3, OS_LOG_TYPE_ERROR, "Unexpected results from mach_timebase_info: err %d numer %u denom %u", buf, 0x14u);
    }
  }
  else
  {
    unint64_t v0 = 1000000000 * (unint64_t)info.denom / info.numer;
  }
  mdns_mach_ticks_per_second_s_ticks_per_second = v0;
}

os_log_t ___mdns_ticks_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mdns", "ticks");
  _mdns_ticks_log_s_os_log_t log = (uint64_t)result;
  return result;
}

CFDataRef mdns_xpc_create_dictionary_from_plist_data(UInt8 *bytes, CFIndex length, int *a3)
{
  CFDataRef v4 = CFDataCreate(0, bytes, length);
  if (v4)
  {
    CFPropertyListRef v5 = CFPropertyListCreateWithData(0, v4, 0, 0, 0);
    CFRelease(v4);
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 == CFDictionaryGetTypeID())
      {
        CFDataRef v4 = (const __CFData *)_CFXPCCreateXPCObjectFromCFObject();
        if (v4) {
          int v7 = 0;
        }
        else {
          int v7 = -6700;
        }
      }
      else
      {
        CFDataRef v4 = 0;
        int v7 = -6756;
      }
    }
    else
    {
      CFDataRef v4 = 0;
      int v7 = -6717;
    }
  }
  else
  {
    CFPropertyListRef v5 = 0;
    int v7 = -6728;
  }
  if (a3) {
    *a3 = v7;
  }
  if (v5) {
    CFRelease(v5);
  }
  return v4;
}

xpc_object_t mdns_xpc_string_create_with_format(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xpc_string_create_with_format_and_arguments("%.*s", &a9);
}

uint64_t mdns_tlv16_get_value(unsigned __int16 *a1, unint64_t a2, int a3, int64_t *a4, unsigned __int16 **a5, void *a6)
{
  if ((unint64_t)a1 > a2) {
    return 4294960586;
  }
  do
  {
    if ((uint64_t)(a2 - (void)a1) < 1) {
      return 4294960569;
    }
    if (a2 - (unint64_t)a1 < 4) {
      return 4294960546;
    }
    int64_t v6 = __rev16(a1[1]);
    int v7 = a1 + 2;
    if ((uint64_t)(a2 - (void)(a1 + 2)) < v6) {
      return 4294960546;
    }
    unsigned int v8 = bswap32(*a1);
    a1 = (unsigned __int16 *)((char *)v7 + v6);
  }
  while (a3 != HIWORD(v8));
  if (a4) {
    *a4 = v6;
  }
  if (a5) {
    *a5 = v7;
  }
  uint64_t v9 = 0;
  if (a6) {
    *a6 = a1;
  }
  return v9;
}

uint64_t mdns_tlv16_set(unsigned char *a1, uint64_t a2, __int16 a3, size_t __n, void *__src, void *a6)
{
  uint64_t v7 = __n;
  if (a2 && a2 - (uint64_t)a1 < __n + 4) {
    return 4294960533;
  }
  *a1 = HIBYTE(a3);
  a1[1] = a3;
  a1[2] = BYTE1(__n);
  a1[3] = __n;
  unsigned int v8 = a1 + 4;
  if (__n) {
    memcpy(a1 + 4, __src, __n);
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = &v8[v7];
  }
  return result;
}

uint64_t mdns_tlv16_get_required_length(unsigned int a1)
{
  return a1 + 4;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE5358](anURL, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53E8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x270EF4880](time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x270EF4898]();
}

uint64_t IOPMRequestSysWake()
{
  return MEMORY[0x270EF48C0]();
}

uint64_t PFUserAddRule()
{
  return MEMORY[0x270F51698]();
}

uint64_t PFUserBeginRules()
{
  return MEMORY[0x270F516A0]();
}

uint64_t PFUserCommitRules()
{
  return MEMORY[0x270F516A8]();
}

uint64_t PFUserCreate()
{
  return MEMORY[0x270F516B0]();
}

uint64_t PFUserDeleteRules()
{
  return MEMORY[0x270F516B8]();
}

uint64_t PFUserRelease()
{
  return MEMORY[0x270F516C0]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x270F054D8](store, nameEncoding);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x270F05530](allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05540](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreRemoveValue(SCDynamicStoreRef store, CFStringRef key)
{
  return MEMORY[0x270F05548](store, key);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x270F05568](store, key, value);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056E8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056F0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x270F05700](allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x270F05718](prefs, wait);
}

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef name, CFStringEncoding nameEncoding)
{
  return MEMORY[0x270F05738](prefs, name, *(void *)&nameEncoding);
}

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef name)
{
  return MEMORY[0x270F05748](prefs, name);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x270F05760](prefs);
}

uint64_t SecCertificateCopyDNSNames()
{
  return MEMORY[0x270EFD708]();
}

uint64_t SecCertificateCopyIPAddresses()
{
  return MEMORY[0x270EFD738]();
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x270EFD940]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x270EFD958]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x270EFDD58](trust, queue, result);
}

OSStatus SecTrustSetNetworkFetchAllowed(SecTrustRef trust, Boolean allowFetch)
{
  return MEMORY[0x270EFDDC8](trust, allowFetch);
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x270EFDE18]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x270ED80E0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x270ED8800]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x270ED8B88]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x270ED8BB0]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x270ED8BB8]();
}

uint64_t cchpke_initiator_encrypt()
{
  return MEMORY[0x270ED8BE0]();
}

uint64_t cchpke_initiator_export()
{
  return MEMORY[0x270ED8BE8]();
}

uint64_t cchpke_initiator_setup()
{
  return MEMORY[0x270ED8BF0]();
}

uint64_t cchpke_params_sizeof_aead_key()
{
  return MEMORY[0x270ED8BF8]();
}

uint64_t cchpke_params_sizeof_aead_nonce()
{
  return MEMORY[0x270ED8C00]();
}

uint64_t cchpke_params_sizeof_aead_tag()
{
  return MEMORY[0x270ED8C08]();
}

uint64_t cchpke_params_sizeof_kdf_hash()
{
  return MEMORY[0x270ED8C10]();
}

uint64_t cchpke_params_sizeof_kem_enc()
{
  return MEMORY[0x270ED8C18]();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return MEMORY[0x270ED8C20]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x270ED92E0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x270ED92E8](data, buffer_ptr, size_ptr);
}

uint64_t dispatch_data_create_with_transform()
{
  return MEMORY[0x270ED92F8]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x270EDA148]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x270EDA358](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

uint64_t ne_session_set_socket_attributes()
{
  return MEMORY[0x270EDA668]();
}

uint64_t necp_client_action()
{
  return MEMORY[0x270EDA6D8]();
}

uint64_t necp_open()
{
  return MEMORY[0x270EDA6E8]();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x270EF7990]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A0]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x270EF79D0]();
}

uint64_t nw_array_append()
{
  return MEMORY[0x270EF7A58]();
}

uint64_t nw_array_apply()
{
  return MEMORY[0x270EF7A68]();
}

uint64_t nw_array_contains_object()
{
  return MEMORY[0x270EF7A70]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x270EF7A80]();
}

uint64_t nw_array_remove_object()
{
  return MEMORY[0x270EF7A98]();
}

void nw_connection_access_establishment_report(nw_connection_t connection, dispatch_queue_t queue, nw_establishment_report_access_block_t access_block)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BB0](endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x270EF7BD8]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x270EF7CC0]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x270EF7D20]();
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x270EF7D28]();
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x270EF7D48](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x270EF7D58](context_identifier);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x270EF7D60](context);
}

void nw_content_context_set_is_final(nw_content_context_t context, BOOL is_final)
{
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
}

uint64_t nw_endpoint_copy_interface()
{
  return MEMORY[0x270EF7E60]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x270EF7E88](address);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EA8](hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x270EF7EC0]();
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return (nw_endpoint_t)MEMORY[0x270EF7ED0](url);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x270EF7EE0](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F28](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F50](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F60](endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F70](endpoint);
}

uint64_t nw_endpoint_get_url_path()
{
  return MEMORY[0x270EF7F80]();
}

uint64_t nw_endpoint_get_url_scheme()
{
  return MEMORY[0x270EF7F88]();
}

uint64_t nw_endpoint_set_interface()
{
  return MEMORY[0x270EF7FA8]();
}

uint64_t nw_endpoint_set_parent_endpoint()
{
  return MEMORY[0x270EF7FB0]();
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x270EF7FC8](error);
}

void nw_establishment_report_enumerate_resolution_reports(nw_establishment_report_t report, nw_report_resolution_report_enumerator_t enumerate_block)
{
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8128](identifier, *(void *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x270EF8138](framer_definition);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x270EF8148](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x270EF8178](framer);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x270EF8188](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x270EF81E0](framer, output_length);
}

uint64_t nw_http_create_metadata_for_request()
{
  return MEMORY[0x270EF8208]();
}

uint64_t nw_http_create_metadata_for_response()
{
  return MEMORY[0x270EF8218]();
}

uint64_t nw_http_fields_access_value_by_name()
{
  return MEMORY[0x270EF8220]();
}

uint64_t nw_http_fields_create()
{
  return MEMORY[0x270EF8240]();
}

uint64_t nw_http_fields_set_value_by_name()
{
  return MEMORY[0x270EF8250]();
}

uint64_t nw_http_metadata_copy_request()
{
  return MEMORY[0x270EF8260]();
}

uint64_t nw_http_metadata_copy_response()
{
  return MEMORY[0x270EF8270]();
}

uint64_t nw_http_metadata_get_version()
{
  return MEMORY[0x270EF8280]();
}

uint64_t nw_http_oblivious_config_is_valid()
{
  return MEMORY[0x270EF8288]();
}

uint64_t nw_http_request_access_authority()
{
  return MEMORY[0x270EF8290]();
}

uint64_t nw_http_request_access_path()
{
  return MEMORY[0x270EF82A0]();
}

uint64_t nw_http_request_create_from_url()
{
  return MEMORY[0x270EF82C8]();
}

uint64_t nw_http_request_has_method()
{
  return MEMORY[0x270EF82D0]();
}

uint64_t nw_http_request_set_header_fields()
{
  return MEMORY[0x270EF82D8]();
}

uint64_t nw_http_response_copy_header_fields()
{
  return MEMORY[0x270EF82E8]();
}

uint64_t nw_http_response_create_well_known()
{
  return MEMORY[0x270EF82F8]();
}

uint64_t nw_http_response_get_status_code()
{
  return MEMORY[0x270EF8308]();
}

uint64_t nw_http_response_set_header_fields()
{
  return MEMORY[0x270EF8318]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x270EF8338]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x270EF8350]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x270EF8370](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x270EF8388](interface);
}

uint64_t nw_oblivious_http_create_options()
{
  return MEMORY[0x270EF84C0]();
}

uint64_t nw_parameters_add_custom_proxy_config()
{
  return MEMORY[0x270EF84C8]();
}

uint64_t nw_parameters_clear_custom_proxy_configs()
{
  return MEMORY[0x270EF84D0]();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x270EF84E0](parameters);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x270EF84F0](parameters);
}

uint64_t nw_parameters_copy_url_endpoint()
{
  return MEMORY[0x270EF8510]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8520]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x270EF8558](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x270EF8568](configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_e_proc_uuid()
{
  return MEMORY[0x270EF8638]();
}

void nw_parameters_set_fast_open_enabled(nw_parameters_t parameters, BOOL fast_open_enabled)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x270EF8668]();
}

uint64_t nw_parameters_set_metadata()
{
  return MEMORY[0x270EF86A8]();
}

uint64_t nw_parameters_set_no_wake_from_sleep()
{
  return MEMORY[0x270EF86C8]();
}

uint64_t nw_parameters_set_pid()
{
  return MEMORY[0x270EF86D0]();
}

void nw_parameters_set_prefer_no_proxy(nw_parameters_t parameters, BOOL prefer_no_proxy)
{
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x270EF8750]();
}

uint64_t nw_parameters_set_url()
{
  return MEMORY[0x270EF8778]();
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x270EF87A0]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x270EF87C0]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E0]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8800]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8818]();
}

uint64_t nw_path_evaluator_set_cancel_handler()
{
  return MEMORY[0x270EF8828]();
}

uint64_t nw_path_evaluator_set_queue()
{
  return MEMORY[0x270EF8830]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8838]();
}

uint64_t nw_path_evaluator_start()
{
  return MEMORY[0x270EF8850]();
}

uint64_t nw_path_get_reason()
{
  return MEMORY[0x270EF8908]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8920](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x270EF8958](path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x270EF8960](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x270EF8978](path);
}

uint64_t nw_path_has_nat64_prefixes()
{
  return MEMORY[0x270EF8980]();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x270EF8990](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B0](path);
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x270EF89D8]();
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A00]();
}

void nw_path_monitor_set_cancel_handler(nw_path_monitor_t monitor, nw_path_monitor_cancel_handler_t cancel_handler)
{
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

uint64_t nw_protocol_copy_http_definition()
{
  return MEMORY[0x270EF8B30]();
}

uint64_t nw_protocol_stack_append_application_protocol()
{
  return MEMORY[0x270EF9018]();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_proxy_config_set_prohibit_direct()
{
  return MEMORY[0x270EF9080]();
}

void nw_release(void *obj)
{
}

uint64_t nw_resolution_report_enumerate_endpoints()
{
  return MEMORY[0x270EF93A0]();
}

uint64_t nw_resolver_config_cancel_updates()
{
  return MEMORY[0x270EF93B0]();
}

uint64_t nw_resolver_config_copy_proxy_config()
{
  return MEMORY[0x270EF93B8]();
}

uint64_t nw_resolver_config_create()
{
  return MEMORY[0x270EF93C0]();
}

uint64_t nw_resolver_config_create_with_dictionary()
{
  return MEMORY[0x270EF93C8]();
}

uint64_t nw_resolver_config_enumerate_match_domains()
{
  return MEMORY[0x270EF93D0]();
}

uint64_t nw_resolver_config_enumerate_name_servers()
{
  return MEMORY[0x270EF93D8]();
}

uint64_t nw_resolver_config_get_allow_failover()
{
  return MEMORY[0x270EF93E0]();
}

uint64_t nw_resolver_config_get_class()
{
  return MEMORY[0x270EF93E8]();
}

uint64_t nw_resolver_config_get_identifier()
{
  return MEMORY[0x270EF93F0]();
}

uint64_t nw_resolver_config_get_identity_reference()
{
  return MEMORY[0x270EF93F8]();
}

uint64_t nw_resolver_config_get_interface_name()
{
  return MEMORY[0x270EF9400]();
}

uint64_t nw_resolver_config_get_odoh_config()
{
  return MEMORY[0x270EF9408]();
}

uint64_t nw_resolver_config_get_protocol()
{
  return MEMORY[0x270EF9410]();
}

uint64_t nw_resolver_config_get_provider_name()
{
  return MEMORY[0x270EF9418]();
}

uint64_t nw_resolver_config_get_provider_path()
{
  return MEMORY[0x270EF9420]();
}

uint64_t nw_resolver_config_report_error()
{
  return MEMORY[0x270EF9428]();
}

uint64_t nw_resolver_config_set_class()
{
  return MEMORY[0x270EF9430]();
}

uint64_t nw_resolver_config_set_identifier()
{
  return MEMORY[0x270EF9438]();
}

uint64_t nw_resolver_config_set_interface_name()
{
  return MEMORY[0x270EF9440]();
}

uint64_t nw_resolver_config_set_odoh_config()
{
  return MEMORY[0x270EF9448]();
}

uint64_t nw_resolver_config_set_protocol()
{
  return MEMORY[0x270EF9450]();
}

uint64_t nw_resolver_config_set_provider_name()
{
  return MEMORY[0x270EF9458]();
}

uint64_t nw_resolver_config_set_provider_path()
{
  return MEMORY[0x270EF9460]();
}

uint64_t nw_resolver_config_watch_updates()
{
  return MEMORY[0x270EF9468]();
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x270EF94A8](obj);
}

uint64_t nw_settings_get_ddr_enabled()
{
  return MEMORY[0x270EF94B0]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x270EF95D8](options);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x270EDA7B0]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x270EDA7D8]();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return MEMORY[0x270EDA7E0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x270EDA7E8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x270EDA800]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x270EDA810]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x270EDA820]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x270EDB198](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x270EFDE98](identity);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
}

void sec_protocol_options_set_tls_server_name(sec_protocol_options_t options, const char *server_name)
{
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

void sec_release(void *obj)
{
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x270EFDFD8](trust);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x270EDB3C0](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
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

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x270F79500]();
}

uint64_t symptom_new()
{
  return MEMORY[0x270F79510]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x270F79528]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
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

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
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

xpc_object_t xpc_string_create_with_format_and_arguments(const char *fmt, va_list ap)
{
  return (xpc_object_t)MEMORY[0x270EDC3E8](fmt, ap);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}