void config_agent_free_dns_information(void *a1)
{
  uint64_t vars8;

  if (a1)
  {
    xpc_release(a1);
  }
  else
  {
    syslog(3, "Attempting to free invalid resolver");
  }
}

dispatch_queue_t ____nwi_client_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.SystemConfiguration.NetworkInformation", 0);
  __nwi_client_queue_q = (uint64_t)result;
  return result;
}

void __dns_configuration_free_block_invoke()
{
  if (!--dnsinfo_active)
  {
    libSC_info_client_release(dnsinfo_client);
    dnsinfo_client = 0;
  }
}

void libSC_info_client_release(uint64_t a1)
{
  v1 = *(void **)(a1 + 8);

  xpc_release(v1);
}

void ___nwi_client_init_block_invoke()
{
  if (nwi_active++) {
    BOOL v1 = nwi_client == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (nwi_store_force_refresh_block_invoke_once != -1) {
      dispatch_once(&nwi_store_force_refresh_block_invoke_once, &__block_literal_global_21);
    }
    if (__nwi_client_queue_once != -1) {
      dispatch_once(&__nwi_client_queue_once, &__block_literal_global_27);
    }
    nwi_client = (uint64_t)libSC_info_client_create(__nwi_client_queue_q, "com.apple.SystemConfiguration.NetworkInformation", "Network information");
    if (!nwi_client) {
      --nwi_active;
    }
  }
}

dispatch_queue_t ____dns_configuration_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.SystemConfiguration.DNSConfiguration", 0);
  __dns_configuration_queue_q = (uint64_t)result;
  return result;
}

uint64_t nwi_state_copy()
{
  uint64_t v15 = *MEMORY[0x263EF8C08];
  if (nwi_state_copy_initialized != -1) {
    dispatch_once(&nwi_state_copy_initialized, &__block_literal_global_0);
  }
  pthread_mutex_lock(&nwi_store_lock);
  int v0 = 1;
  atomic_compare_exchange_strong(nwi_store_force_refresh, (unsigned int *)&v0, 0);
  BOOL v1 = v0 == 1;
  if (!G_nwi_state)
  {
    v3 = 0;
    goto LABEL_13;
  }
  check[0] = 0;
  if (nwi_store_token_valid != 1) {
    goto LABEL_12;
  }
  uint32_t v2 = notify_check(nwi_store_token, check);
  if (v2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8C10], "nwi notify_check: failed with %u\n", v2);
LABEL_12:
    v3 = (atomic_uint *)G_nwi_state;
    G_nwi_state = 0;
    goto LABEL_13;
  }
  if (check[0]) {
    int v4 = 1;
  }
  else {
    int v4 = v1;
  }
  if (v4 == 1) {
    goto LABEL_12;
  }
  v3 = 0;
  uint64_t v11 = G_nwi_state;
  if (G_nwi_state) {
    goto LABEL_27;
  }
LABEL_13:
  if (!libSC_info_available())
  {
    if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(check[0]) = 0;
      _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "*** network information requested between fork() and exec()", (uint8_t *)check, 2u);
    }
    goto LABEL_30;
  }
  _nwi_client_init();
  if (!nwi_client || !*(unsigned char *)nwi_client) {
    goto LABEL_30;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (client_proc_name) {
    xpc_dictionary_set_string(v5, "proc_name", (const char *)client_proc_name);
  }
  xpc_dictionary_set_int64(v6, "request_op", 131073);
  v7 = libSC_send_message_with_reply_sync(nwi_client, v6);
  xpc_release(v6);
  if (!v7)
  {
LABEL_30:
    uint64_t v12 = 0;
    G_nwi_state = 0;
    goto LABEL_31;
  }
  *(void *)check = 0;
  data = xpc_dictionary_get_data(v7, "configuration", (size_t *)check);
  if (!data || (v9 = data, *(void *)check < 8uLL))
  {
LABEL_29:
    xpc_release(v7);
    goto LABEL_30;
  }
  v10 = (atomic_uint *)malloc_type_malloc(*(size_t *)check, 0xA5BF6884uLL);
  memcpy(v10, v9, *(size_t *)check);
  if (*v10 != 538379777)
  {
    free(v10);
    goto LABEL_29;
  }
  v10[5] = 0;
  xpc_release(v7);
  G_nwi_state = (uint64_t)v10;
  atomic_fetch_add(v10 + 5, 1u);
  uint64_t v11 = G_nwi_state;
  if (G_nwi_state)
  {
LABEL_27:
    atomic_fetch_add((atomic_uint *volatile)(v11 + 20), 1u);
    uint64_t v12 = G_nwi_state;
    goto LABEL_31;
  }
  uint64_t v12 = 0;
LABEL_31:
  pthread_mutex_unlock(&nwi_store_lock);
  if (v3 && atomic_fetch_add(v3 + 5, 0xFFFFFFFF) == 1)
  {
    _nwi_client_release();
    free(v3);
  }
  return v12;
}

void _nwi_client_init()
{
  if (__nwi_client_queue_once != -1) {
    dispatch_once(&__nwi_client_queue_once, &__block_literal_global_27);
  }
  int v0 = __nwi_client_queue_q;

  dispatch_sync(v0, &__block_literal_global_17);
}

void dns_configuration_free(void *a1)
{
  if (a1)
  {
    if (__dns_configuration_queue_once != -1) {
      dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_19);
    }
    dispatch_sync((dispatch_queue_t)__dns_configuration_queue_q, &__block_literal_global_12);
    free(a1);
  }
}

void libSC_client_dealloc(void **a1)
{
  if (a1)
  {
    free(a1[2]);
    free(a1[3]);
    free(a1);
  }
}

void __dns_configuration_copy_block_invoke()
{
  if (dnsinfo_active++) {
    BOOL v1 = dnsinfo_client == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (_block_invoke_once != -1) {
      dispatch_once(&_block_invoke_once, &__block_literal_global_5);
    }
    if (__dns_configuration_queue_once != -1) {
      dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_19);
    }
    dnsinfo_client = (uint64_t)libSC_info_client_create(__dns_configuration_queue_q, "com.apple.SystemConfiguration.DNSConfiguration", "DNS configuration");
    if (!dnsinfo_client) {
      --dnsinfo_active;
    }
  }
}

void *libSC_info_client_create(NSObject *a1, const char *a2, const char *a3)
{
  handler[6] = *MEMORY[0x263EF8C08];
  if (_available) {
    return 0;
  }
  v3 = malloc_type_malloc(0x20uLL, 0x103004009027118uLL);
  *(unsigned char *)v3 = 1;
  v3[2] = strdup(a3);
  v3[3] = strdup(a2);
  mach_service = xpc_connection_create_mach_service(a2, a1, 2uLL);
  handler[0] = MEMORY[0x263EF8BF8];
  handler[1] = 0x40000000;
  handler[2] = __libSC_info_client_create_block_invoke;
  handler[3] = &__block_descriptor_tmp_1;
  handler[4] = v3;
  handler[5] = mach_service;
  xpc_connection_set_event_handler(mach_service, handler);
  v3[1] = mach_service;
  xpc_connection_set_context(mach_service, v3);
  xpc_connection_set_finalizer_f(mach_service, (xpc_finalizer_t)libSC_client_dealloc);
  xpc_connection_resume(mach_service);
  return v3;
}

_DWORD *dns_configuration_copy()
{
  uint64_t v66 = *MEMORY[0x263EF8C08];
  if (!libSC_info_available())
  {
    if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "*** DNS configuration requested between fork() and exec()", buf, 2u);
    }
    return 0;
  }
  if (__dns_configuration_queue_once != -1) {
    dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_19);
  }
  dispatch_sync((dispatch_queue_t)__dns_configuration_queue_q, &__block_literal_global);
  if (!dnsinfo_client || !*(unsigned char *)dnsinfo_client) {
    return 0;
  }
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  BOOL v1 = v0;
  if (dns_configuration_copy_proc_name) {
    xpc_dictionary_set_string(v0, "proc_name", (const char *)dns_configuration_copy_proc_name);
  }
  xpc_dictionary_set_int64(v1, "request_op", 65537);
  uint32_t v2 = libSC_send_message_with_reply_sync(dnsinfo_client, v1);
  xpc_release(v1);
  if (!v2) {
    return 0;
  }
  size_t length = 0;
  data = (unsigned int *)xpc_dictionary_get_data(v2, "configuration", &length);
  if (!data) {
    goto LABEL_21;
  }
  size_t v4 = length;
  if (length < 0x38 || length >= 0x100001) {
    goto LABEL_21;
  }
  xpc_object_t v5 = data;
  uint64_t v6 = bswap32(data[12]) + 56;
  if (v6 != length)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v65 = v6;
      *(_WORD *)&v65[8] = 2048;
      *(void *)&v65[10] = v4;
      v8 = MEMORY[0x263EF8CC0];
      v9 = "DNS configuration: size error (%zu != %zu)";
      uint32_t v10 = 22;
      goto LABEL_20;
    }
LABEL_21:
    xpc_release(v2);
    return 0;
  }
  uint64_t v7 = bswap32(data[13]);
  if (0x100000 - length < v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v65 = v7;
      *(_WORD *)&v65[4] = 2048;
      *(void *)&v65[6] = 0x100000 - v4;
      v8 = MEMORY[0x263EF8CC0];
      v9 = "DNS configuration: padding error (%u > %zu)";
      uint32_t v10 = 18;
LABEL_20:
      _os_log_impl(&dword_20D88F000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  uint64_t v11 = malloc_type_malloc(length + v7, 0x158E9C56uLL);
  memcpy(v11, v5, v4);
  bzero((char *)v11 + v4, v7);
  xpc_release(v2);
  if (!v11) {
    return v11;
  }
  unsigned int v13 = v11[12];
  unsigned int v14 = bswap32(v11[13]);
  unsigned int v15 = bswap32(*v11);
  *uint64_t v11 = v15;
  if (v14 < 8 * v15) {
    goto LABEL_89;
  }
  unsigned int v16 = bswap32(v13);
  unsigned int v17 = 8 * v15;
  uint64_t v18 = 8 * v15 ? (uint64_t)v11 + v16 + 56 : 0;
  unsigned int v19 = v14 - v17;
  *(void *)(v11 + 1) = v18;
  unsigned int v20 = bswap32(v11[3]);
  v11[3] = v20;
  if (v19 < 8 * v20) {
    goto LABEL_89;
  }
  unsigned int v21 = 8 * v20;
  uint64_t v22 = (uint64_t)v11 + v16 + v17 + 56;
  uint64_t v23 = v21 ? v22 : 0;
  unsigned int v24 = v19 - v21;
  *((void *)v11 + 2) = v23;
  unsigned int v25 = bswap32(v11[8]);
  v11[8] = v25;
  if (v24 < 8 * v25) {
    goto LABEL_89;
  }
  unsigned int v26 = 8 * v25;
  uint64_t v27 = v22 + v21;
  if (8 * v25) {
    uint64_t v28 = v22 + v21;
  }
  else {
    uint64_t v28 = 0;
  }
  *(void *)(v11 + 9) = v28;
  if (v16 < 8)
  {
    int v31 = 0;
    int v30 = 0;
    int v29 = 0;
    goto LABEL_86;
  }
  int v29 = 0;
  int v30 = 0;
  int v31 = 0;
  v32 = v11 + 14;
  unsigned int v33 = v24 - v26;
  uint64_t v34 = v27 + v26;
  do
  {
    unsigned int v35 = bswap32(v32[1]);
    unsigned int v36 = bswap32(*v32);
    if (v36 - 1 > 2) {
      goto LABEL_83;
    }
    if (v35 - 8 < 0x64) {
      goto LABEL_89;
    }
    *((void *)v32 + 1) = 0;
    unsigned int v37 = bswap32(v32[4]);
    v32[4] = v37;
    if (v33 < 8 * v37) {
      goto LABEL_89;
    }
    unsigned int v38 = 8 * v37;
    uint64_t v39 = 8 * v37 ? v34 : 0;
    unsigned int v40 = v33 - v38;
    *(void *)(v32 + 5) = v39;
    *((_WORD *)v32 + 14) = bswap32(*((unsigned __int16 *)v32 + 14)) >> 16;
    unsigned int v41 = bswap32(v32[8]);
    v32[8] = v41;
    if (v40 < 8 * v41) {
      goto LABEL_89;
    }
    unsigned int v42 = 8 * v41;
    uint64_t v43 = v34 + v38;
    uint64_t v44 = 8 * v41 ? v43 : 0;
    unsigned int v45 = v40 - v42;
    *(void *)(v32 + 9) = v44;
    unsigned int v46 = bswap32(v32[11]);
    v32[11] = v46;
    if (v40 - v42 < 8 * v46) {
      goto LABEL_89;
    }
    unsigned int v47 = 8 * v46;
    uint64_t v48 = v43 + v42;
    uint64_t v49 = 8 * v46 ? v48 : 0;
    *((void *)v32 + 6) = v49;
    *((void *)v32 + 7) = 0;
    *((int8x16_t *)v32 + 4) = vrev32q_s8(*((int8x16_t *)v32 + 4));
    *((int8x8_t *)v32 + 10) = vrev32_s8(*(int8x8_t *)(v32 + 20));
    unsigned int v50 = v35 - 108;
    if (v35 - 108 != bswap32(v32[26])) {
      goto LABEL_89;
    }
    v51 = v32 + 2;
    if (v50 < 8)
    {
      int v54 = 0;
      int v53 = 0;
      int v52 = 0;
    }
    else
    {
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      v55 = v32 + 27;
      do
      {
        unsigned int v56 = v55[1];
        switch(bswap32(*v55))
        {
          case 0xAu:
            void *v51 = v55 + 2;
            break;
          case 0xBu:
            uint64_t v57 = *(void *)(v32 + 5);
            if (!v57) {
              goto LABEL_89;
            }
            *(void *)(v57 + 8 * v54++) = v55 + 2;
            break;
          case 0xCu:
            uint64_t v58 = *(void *)(v32 + 9);
            if (!v58) {
              goto LABEL_89;
            }
            *(void *)(v58 + 8 * v53++) = v55 + 2;
            break;
          case 0xDu:
            uint64_t v59 = *((void *)v32 + 6);
            if (!v59) {
              goto LABEL_89;
            }
            *(void *)(v59 + 8 * v52++) = v55 + 2;
            break;
          case 0xEu:
            *((void *)v32 + 7) = v55 + 2;
            break;
          case 0xFu:
            *((void *)v32 + 11) = v55 + 2;
            break;
          case 0x10u:
            *((void *)v32 + 12) = v55 + 2;
            break;
          default:
            break;
        }
        unsigned int v60 = bswap32(v56);
        v55 = (unsigned int *)((char *)v55 + v60);
        v50 -= v60;
      }
      while (v50 > 7);
    }
    if (v54 != v37 || v53 != v41 || v52 != v46) {
      goto LABEL_89;
    }
    uint64_t v34 = v48 + v47;
    unsigned int v33 = v45 - v47;
    switch(v36)
    {
      case 3u:
        uint64_t v61 = *(void *)(v11 + 9);
        if (!v61) {
          goto LABEL_89;
        }
        int v62 = v29++;
        break;
      case 2u:
        uint64_t v61 = *((void *)v11 + 2);
        if (!v61) {
          goto LABEL_89;
        }
        int v62 = v30++;
        break;
      case 1u:
        uint64_t v61 = *(void *)(v11 + 1);
        if (!v61) {
          goto LABEL_89;
        }
        int v62 = v31++;
        break;
      default:
        goto LABEL_83;
    }
    *(void *)(v61 + 8 * v62) = v51;
LABEL_83:
    v32 = (_DWORD *)((char *)v32 + v35);
    v16 -= v35;
  }
  while (v16 > 7);
  unsigned int v15 = *v11;
LABEL_86:
  if (v31 != v15 || v30 != v11[3] || v29 != v11[8])
  {
LABEL_89:
    free(v11);
    return 0;
  }
  return v11;
}

uint64_t config_agent_copy_dns_information(uint64_t a1)
{
  if (!is_config_agent_type_dns(a1)) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 212))
  {
    v3 = (const char *)(a1 + 80);
    if (strncmp(v3, "DNSAgent(p)", 0xBuLL) && strncmp(v3, "DNSAgent(m)", 0xBuLL))
    {
      if (*v3) {
        size_t v4 = v3;
      }
      else {
        size_t v4 = "DNSAgent";
      }
      syslog(3, "Cannot parse config agent (%s). No data available", v4);
    }
    return 0;
  }

  return xpc_create_from_plist();
}

BOOL is_config_agent_type_proxy(BOOL result)
{
  if (result)
  {
    BOOL v1 = result;
    return !strcmp((const char *)(result + 16), "SystemConfig") && strcmp((const char *)(v1 + 48), "ProxyAgent") == 0;
  }
  return result;
}

BOOL is_config_agent_type_dns(BOOL result)
{
  if (result)
  {
    BOOL v1 = result;
    return !strcmp((const char *)(result + 16), "SystemConfig") && strcmp((const char *)(v1 + 48), "DNSAgent") == 0;
  }
  return result;
}

void *libSC_send_message_with_reply_sync(uint64_t a1, xpc_object_t message)
{
  *(void *)&v22[5] = *MEMORY[0x263EF8C08];
  size_t v4 = (uint64_t *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263EF8D00];
  uint64_t v6 = (void *)MEMORY[0x263EF8CD0];
  uint64_t v7 = MEMORY[0x263EF8D08];
  v8 = MEMORY[0x263EF8CC0];
  while (1)
  {
    do
      xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 8), message);
    while (!v9);
    uint32_t v10 = v9;
    uint64_t v11 = MEMORY[0x21055EC50]();
    if (v11 == v5) {
      break;
    }
    uint64_t v12 = v11;
    if (v10 != v6 || v11 != v7)
    {
      unsigned int v14 = (void *)MEMORY[0x263EF8CD8];
      BOOL v15 = os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT);
      if (v10 == v14 && v12 == v7)
      {
        if (v15)
        {
          uint64_t v16 = *v4;
          int v19 = 136315138;
          uint64_t v20 = v16;
          _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "%s server not available", (uint8_t *)&v19, 0xCu);
        }
        *(unsigned char *)a1 = 0;
      }
      else
      {
        if (v15)
        {
          uint64_t v17 = *v4;
          int v19 = 136315138;
          uint64_t v20 = v17;
          _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "%s xpc_connection_send_message_with_reply_sync() with unexpected reply", (uint8_t *)&v19, 0xCu);
        }
        log_xpc_object((uint64_t)"  reply", (uint64_t)v10);
      }
      xpc_release(v10);
      return 0;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      libSC_send_message_with_reply_sync_cold_1(buf, v4, v22);
    }
    xpc_release(v6);
  }
  return v10;
}

BOOL libSC_info_available()
{
  return (_available & 1) == 0;
}

const char *__dns_configuration_copy_block_invoke_2()
{
  dispatch_queue_t result = getprogname();
  dns_configuration_copy_proc_name = (uint64_t)result;
  return result;
}

const char *nwi_state_get_notify_key()
{
  return "com.apple.system.SystemConfiguration.nwi";
}

const char *___nwi_client_init_block_invoke_2()
{
  dispatch_queue_t result = getprogname();
  client_proc_name = (uint64_t)result;
  return result;
}

uint64_t __nwi_state_copy_block_invoke()
{
  uint64_t result = notify_register_check("com.apple.system.SystemConfiguration.nwi", &nwi_store_token);
  if (result) {
    return fprintf((FILE *)*MEMORY[0x263EF8C10], "nwi_state: registration failed (%u)\n", result);
  }
  nwi_store_token_valid = 1;
  return result;
}

uint64_t nwi_state_get_first_ifstate(uint64_t result, int a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)(result + 4);
    if (v2 < 1) {
      return 0;
    }
    uint64_t v3 = 12;
    if (a2 == 2) {
      uint64_t v3 = 8;
    }
    if (*(int *)(result + v3) < 1)
    {
      return 0;
    }
    else
    {
      if (a2 != 30) {
        int v2 = 0;
      }
      uint64_t v4 = result + 112 * v2;
      if ((*(unsigned char *)(v4 + 56) & 8) != 0) {
        return 0;
      }
      else {
        return v4 + 40;
      }
    }
  }
  return result;
}

void nwi_state_release(atomic_uint *a1)
{
  if (atomic_fetch_add(a1 + 5, 0xFFFFFFFF) == 1)
  {
    _nwi_client_release();
    free(a1);
  }
}

uint64_t nwi_ifstate_get_flags(uint64_t a1)
{
  uint64_t v2 = 1;
  if (*(unsigned char *)(a1 + 32) != 2) {
    uint64_t v2 = 2;
  }
  uint64_t result = *(void *)(a1 + 16) & 0x44 | v2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 24);
    if (v4)
    {
      uint64_t v5 = a1 + 112 * v4;
      uint64_t v6 = 1;
      if (*(unsigned char *)(v5 + 32) != 2) {
        uint64_t v6 = 2;
      }
      return *(void *)(v5 + 16) & 0x44 | result | v6;
    }
  }
  return result;
}

const char *dns_configuration_notify_key()
{
  return "com.apple.system.SystemConfiguration.dns_configuration";
}

void _dns_configuration_ack(uint64_t a1)
{
  if (a1 && dnsinfo_client && *(unsigned char *)dnsinfo_client)
  {
    if (__dns_configuration_queue_once != -1) {
      dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_19);
    }
    dispatch_sync((dispatch_queue_t)__dns_configuration_queue_q, &__block_literal_global_15);
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v2, "request_op", 65538);
    xpc_dictionary_set_uint64(v2, "generation", *(void *)(a1 + 24));
    xpc_connection_send_message(*(xpc_connection_t *)(dnsinfo_client + 8), v2);
    xpc_release(v2);
  }
}

void ___dns_configuration_ack_block_invoke()
{
}

void _nwi_state_force_refresh()
{
  int v0 = 0;
  atomic_compare_exchange_strong(nwi_store_force_refresh, (unsigned int *)&v0, 1u);
}

void _nwi_client_release()
{
  if (__nwi_client_queue_once != -1) {
    dispatch_once(&__nwi_client_queue_once, &__block_literal_global_27);
  }
  int v0 = __nwi_client_queue_q;

  dispatch_sync(v0, &__block_literal_global_14);
}

void *_nwi_config_agent_copy_data(uint64_t a1, void *a2)
{
  xpc_object_t v2 = 0;
  size[1] = *MEMORY[0x263EF8C08];
  if (a1 && a2)
  {
    _nwi_client_init();
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "request_op", 131075);
    if (client_proc_name) {
      xpc_dictionary_set_string(v5, "proc_name", (const char *)client_proc_name);
    }
    xpc_dictionary_set_uuid(v5, "AgentUUID", (const unsigned __int8 *)a1);
    xpc_dictionary_set_string(v5, "AgentType", (const char *)(a1 + 48));
    uint64_t v6 = libSC_send_message_with_reply_sync(nwi_client, v5);
    xpc_release(v5);
    if (v6)
    {
      size[0] = 0;
      data = xpc_dictionary_get_data(v6, "AgentData", size);
      xpc_object_t v2 = 0;
      if (data)
      {
        v8 = data;
        if (size[0])
        {
          xpc_object_t v2 = malloc_type_malloc(size[0], 0xE1DAE2B3uLL);
          size_t v9 = size[0];
          *a2 = size[0];
          memcpy(v2, v8, v9);
        }
      }
      xpc_release(v6);
    }
    else
    {
      xpc_object_t v2 = 0;
    }
    _nwi_client_release();
  }
  return v2;
}

void _nwi_state_ack(uint64_t a1)
{
  if (a1 && nwi_client && *(unsigned char *)nwi_client)
  {
    if (__nwi_client_queue_once != -1) {
      dispatch_once(&__nwi_client_queue_once, &__block_literal_global_27);
    }
    dispatch_sync((dispatch_queue_t)__nwi_client_queue_q, &__block_literal_global_10);
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v2, "request_op", 131074);
    xpc_dictionary_set_uint64(v2, "generation", *(void *)(a1 + 32));
    xpc_connection_send_message(*(xpc_connection_t *)(nwi_client + 8), v2);
    xpc_release(v2);
  }
}

void ___nwi_state_ack_block_invoke()
{
}

uint64_t nwi_state_get_generation(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t nwi_ifstate_get_generation(uint64_t a1)
{
  return *(void *)(a1 + 52);
}

const char *nwi_state_get_ifstate(_DWORD *a1, char *__s1)
{
  if (!a1) {
    return 0;
  }
  int v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((int)v5 >= 1 && (int)v5 <= v4)
  {
    i = (const char *)(a1 + 10);
    while (strcmp(__s1, i))
    {
      i += 112;
      if (!--v5) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    int v8 = v4;
    uint64_t v9 = a1[3];
    if ((int)v9 < 1 || (int)v9 > v8) {
      return 0;
    }
    for (i = (const char *)&a1[28 * v8 + 10]; strcmp(__s1, i); i += 112)
    {
      if (!--v9) {
        return 0;
      }
    }
  }
  return i;
}

uint64_t nwi_ifstate_get_next(uint64_t a1, int a2)
{
  if (*(unsigned __int8 *)(a1 + 32) != a2)
  {
    int v2 = *(_DWORD *)(a1 + 24);
    if (!v2) {
      return 0;
    }
    a1 += 112 * v2;
  }
  if ((*(_WORD *)(a1 + 16) & 0x1008) != 0) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 128) & 8) != 0) {
    return 0;
  }
  else {
    return a1 + 112;
  }
}

uint64_t nwi_ifstate_compare_rank(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 28);
  unsigned int v3 = *(_DWORD *)(a2 + 28);
  BOOL v4 = v2 == v3;
  if (v2 < v3) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 1;
  }
  if (v4) {
    return 0;
  }
  else {
    return v5;
  }
}

uint64_t nwi_state_get_reachability_flags(uint64_t a1, int a2)
{
  if (a1)
  {
    if (a2 == 30 || a2 == 2)
    {
      int v2 = *(_DWORD *)(a1 + 4);
      if (v2 < 1) {
        goto LABEL_14;
      }
      uint64_t v3 = 12;
      if (a2 == 2) {
        uint64_t v3 = 8;
      }
      if (*(int *)(a1 + v3) < 1)
      {
LABEL_14:
        uint64_t v5 = 0;
      }
      else
      {
        if (a2 != 30) {
          int v2 = 0;
        }
        uint64_t v4 = a1 + 112 * v2;
        if ((*(unsigned char *)(v4 + 56) & 8) != 0) {
          uint64_t v5 = 0;
        }
        else {
          uint64_t v5 = v4 + 40;
        }
      }
      uint64_t v7 = (unsigned int *)(a1 + 24);
      if (a2 != 2) {
        uint64_t v7 = (unsigned int *)(a1 + 28);
      }
      if (v5) {
        int v8 = (unsigned int *)(v5 + 60);
      }
      else {
        int v8 = v7;
      }
      return *v8;
    }
    int v10 = *(_DWORD *)(a1 + 4);
    if (v10 >= 1)
    {
      if (*(int *)(a1 + 8) < 1)
      {
        if (*(int *)(a1 + 12) < 1) {
          goto LABEL_40;
        }
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = a1 + 40;
        uint64_t v12 = *(void *)(a1 + 56);
        if ((v12 & 8) != 0) {
          uint64_t v11 = 0;
        }
        if (*(int *)(a1 + 12) <= 0)
        {
          if ((v12 & 8) != 0) {
            goto LABEL_40;
          }
          goto LABEL_37;
        }
      }
      uint64_t v13 = a1 + 112 * v10;
      uint64_t v14 = *(void *)(v13 + 56);
      if ((v14 & 8) != 0) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v13 + 40;
      }
      if (v11)
      {
        if ((v14 & 8) != 0 || *(_DWORD *)(v11 + 28) <= *(_DWORD *)(v15 + 28))
        {
LABEL_37:
          int v8 = (unsigned int *)(v11 + 60);
          return *v8;
        }
LABEL_39:
        int v8 = (unsigned int *)(v15 + 60);
        return *v8;
      }
      if ((v14 & 8) == 0) {
        goto LABEL_39;
      }
    }
LABEL_40:
    uint64_t v6 = *(unsigned int *)(a1 + 24);
    if (v6) {
      return v6;
    }
    int v8 = (unsigned int *)(a1 + 28);
    return *v8;
  }
  return 0;
}

uint64_t nwi_ifstate_get_vpn_server(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 65)) {
    return a1 + 64;
  }
  else {
    return 0;
  }
}

uint64_t nwi_ifstate_get_reachability_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 60);
}

uint64_t nwi_ifstate_get_signature(uint64_t a1, int a2, _DWORD *a3)
{
  if (!a2) {
    goto LABEL_7;
  }
  if (a2 != 30 && a2 != 2) {
    goto LABEL_9;
  }
  if (*(unsigned __int8 *)(a1 + 32) != a2)
  {
    int v3 = *(_DWORD *)(a1 + 24);
    if (!v3) {
      goto LABEL_9;
    }
    a1 += 112 * v3;
LABEL_7:
    if (a1) {
      goto LABEL_8;
    }
LABEL_9:
    uint64_t result = 0;
    *a3 = 0;
    return result;
  }
LABEL_8:
  if ((*(unsigned char *)(a1 + 16) & 0x10) == 0) {
    goto LABEL_9;
  }
  *a3 = 20;
  return a1 + 92;
}

uint64_t nwi_ifstate_get_dns_signature(uint64_t a1, int *a2)
{
  uint64_t v3 = a1;
  *a2 = 0;
  if ((nwi_ifstate_get_flags(a1) & 4) != 0)
  {
    int v5 = *(unsigned __int8 *)(v3 + 32);
    uint64_t v6 = v3;
    if (v5 != 2)
    {
      int v7 = *(_DWORD *)(v3 + 24);
      if (!v7)
      {
        int v10 = 0;
        uint64_t v11 = 0;
        goto LABEL_10;
      }
      uint64_t v6 = v3 + 112 * v7;
    }
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = v6 + 92;
    if ((v8 & 0x10) != 0) {
      int v10 = 20;
    }
    else {
      int v10 = 0;
    }
    uint64_t v11 = v9 & (v8 << 59 >> 63);
LABEL_10:
    uint64_t v12 = v3;
    if (v5 != 30)
    {
      int v13 = *(_DWORD *)(v3 + 24);
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v12 = v3 + 112 * v13;
    }
    if ((*(unsigned char *)(v12 + 16) & 0x10) != 0)
    {
      uint64_t v4 = v12 + 92;
      int v14 = 20;
      goto LABEL_17;
    }
LABEL_14:
    uint64_t v4 = 0;
    if (!v11) {
      return v4;
    }
    int v14 = 0;
LABEL_17:
    uint64_t v15 = v3;
    if (v5 != 2)
    {
      int v16 = *(_DWORD *)(v3 + 24);
      if (!v16) {
        goto LABEL_21;
      }
      uint64_t v15 = v3 + 112 * v16;
    }
    if ((nwi_ifstate_get_flags(v15) & 8) == 0)
    {
LABEL_27:
      *a2 = v10;
      return v11;
    }
LABEL_21:
    if (v5 != 30)
    {
      int v17 = *(_DWORD *)(v3 + 24);
      if (!v17)
      {
        LOBYTE(v18) = 1;
LABEL_25:
        if ((v18 & (v10 != 0)) == 0)
        {
          int v10 = v14;
          uint64_t v11 = v4;
        }
        goto LABEL_27;
      }
      v3 += 112 * v17;
    }
    unint64_t v18 = ((unint64_t)nwi_ifstate_get_flags(v3) >> 3) & 1;
    goto LABEL_25;
  }
  return 0;
}

uint64_t nwi_state_get_interface_names(uint64_t a1, void *a2, int a3)
{
  if (!a2 || !a3) {
    return *(unsigned int *)(a1 + 16);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((int)result >= 1)
  {
    int v5 = 2 * *(_DWORD *)(a1 + 4);
    uint64_t v6 = (int *)(a1 + 224 * *(int *)(a1 + 4) + 40);
    uint64_t v7 = *(unsigned int *)(a1 + 16);
    while (*v6 < v5)
    {
      *a2++ = a1 + 112 * *v6++ + 40;
      if (!--v7) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

void ___nwi_client_release_block_invoke()
{
  if (!--nwi_active)
  {
    libSC_info_client_release(nwi_client);
    nwi_client = 0;
  }
}

uint64_t _libSC_info_fork_child()
{
  uint64_t result = _dispatch_is_fork_of_multithreaded_parent();
  if (result) {
    _available = 1;
  }
  return result;
}

void __libSC_info_client_create_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8C08];
  uint64_t v4 = MEMORY[0x21055EC50](a2);
  if (v4 == MEMORY[0x263EF8D00])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
      int v10 = 136315138;
      uint64_t v11 = v7;
      _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "%s: unexpected message", (uint8_t *)&v10, 0xCu);
    }
    log_xpc_object((uint64_t)"  dict = ", (uint64_t)a2);
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x263EF8D08])
    {
      if (a2 == (void *)MEMORY[0x263EF8CD8])
      {
        if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
          int v10 = 136315138;
          uint64_t v11 = v9;
          _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "%s: server not available", (uint8_t *)&v10, 0xCu);
        }
        **(unsigned char **)(a1 + 32) = 0;
      }
      else if (a2 == (void *)MEMORY[0x263EF8CD0])
      {
        if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEBUG)) {
          __libSC_info_client_create_block_invoke_cold_1(a1);
        }
      }
      else
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF8CE0]);
        if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEBUG)) {
          __libSC_info_client_create_block_invoke_cold_2(a1, (uint64_t)string);
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      int v10 = 136315394;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "%s: unknown event type : %p", (uint8_t *)&v10, 0x16u);
    }
  }
}

void log_xpc_object(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  uint64_t v3 = (void *)MEMORY[0x21055EB90](a2);
  if (os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = a1;
    __int16 v6 = 2080;
    uint64_t v7 = v3;
    _os_log_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEFAULT, "%s = %s", (uint8_t *)&v4, 0x16u);
  }
  free(v3);
}

xpc_object_t config_agent_get_dns_nameservers(void *a1)
{
  if (!a1 || MEMORY[0x21055EC50]() != MEMORY[0x263EF8D00]) {
    return 0;
  }

  return xpc_dictionary_get_value(a1, "NameServers");
}

xpc_object_t config_agent_get_dns_searchdomains(void *a1)
{
  if (!a1 || MEMORY[0x21055EC50]() != MEMORY[0x263EF8D00]) {
    return 0;
  }

  return xpc_dictionary_get_value(a1, "SearchDomains");
}

uint64_t config_agent_copy_proxy_information(uint64_t a1)
{
  if (!is_config_agent_type_proxy(a1)) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 212))
  {
    int v4 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v3 = (const char *)(a1 + 80);
    if (v4) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = "ProxyAgent";
    }
    syslog(3, "Cannot parse config agent (%s). No data available", v5);
    return 0;
  }

  return xpc_create_from_plist();
}

void *config_agent_update_proxy_information(void *a1)
{
  BOOL v1 = a1;
  uint64_t v26 = *MEMORY[0x263EF8C08];
  if (a1)
  {
    uint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    *(_OWORD *)uuid_t dst = 0u;
    long long v13 = 0u;
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000;
    uint64_t v11 = 0;
    if (MEMORY[0x21055EC50](a1) == MEMORY[0x263EF8CE8])
    {
      applier[0] = MEMORY[0x263EF8BF8];
      applier[1] = 0x40000000;
      applier[2] = __get_agent_uuid_if_OOB_data_required_block_invoke;
      applier[3] = &unk_2641199E0;
      applier[4] = &v8;
      xpc_array_apply(v1, applier);
    }
    else if (MEMORY[0x21055EC50](v1) == MEMORY[0x263EF8D00])
    {
      xpc_object_t value = xpc_dictionary_get_value(v1, "OutOfBandDataUUID");
      v9[3] = (uint64_t)value;
    }
    if (v9[3] && MEMORY[0x21055EC50]() == MEMORY[0x263EF8CF8] && xpc_data_get_length((xpc_object_t)v9[3]) >= 0x10)
    {
      bytes_ptr = (const unsigned __int8 *)xpc_data_get_bytes_ptr((xpc_object_t)v9[3]);
      uuid_copy(dst, bytes_ptr);
    }
    else
    {
      uuid_clear(dst);
    }
    _Block_object_dispose(&v8, 8);
    if (uuid_is_null(dst))
    {
      return 0;
    }
    else
    {
      applier[0] = 0;
      __strlcpy_chk();
      int v4 = _nwi_config_agent_copy_data((uint64_t)dst, applier);
      BOOL v1 = 0;
      if (v4 && applier[0])
      {
        uint64_t v5 = v4;
        BOOL v1 = (void *)xpc_create_from_plist();
        free(v5);
      }
    }
  }
  return v1;
}

void config_agent_free_proxy_information(void *a1)
{
  if (a1)
  {
    xpc_release(a1);
  }
  else
  {
    syslog(3, "Attempting to free proxy configuration");
  }
}

void __libSC_info_client_create_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8C08];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEBUG, "%s: server failed", (uint8_t *)&v2, 0xCu);
}

void __libSC_info_client_create_block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8C08];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  int v5 = 136315650;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  pid_t v8 = pid;
  __int16 v9 = 2080;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEBUG, "%s: connection error: %d : %s", (uint8_t *)&v5, 0x1Cu);
}

void libSC_send_message_with_reply_sync_cold_1(uint8_t *buf, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  *(_DWORD *)buf = 136315138;
  *a3 = v3;
  _os_log_debug_impl(&dword_20D88F000, MEMORY[0x263EF8CC0], OS_LOG_TYPE_DEBUG, "%s server failure, retrying", buf, 0xCu);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270EDCF00]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x270EDCAA0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270EDCC78](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270EDD0C8](a1, a2);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270EDD140]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDDB50](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDDB68](name, out_token);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDDD50](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDDCB0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDDCB8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDD2B0](__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDD2F0](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDD3A8](uu);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDDDC0](xarray, applier);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDDDE8](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDDDF0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDDE08](connection, message);
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDDE28](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDDE30]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDDE38](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDDE40](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDDE58](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDDE68](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDDE80](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDDE90](xdict, key);
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDDED0](object);
}