const char *_DNSSVCBKeyToString(int a1)
{
  const char *result;
  const char *v4;

  result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "alpn";
      break;
    case 2:
      result = "no-default-alpn";
      break;
    case 3:
      result = "port";
      break;
    case 4:
      result = "ipv4hint";
      break;
    case 5:
      result = "echconfig";
      break;
    case 6:
      result = "ipv6hint";
      break;
    case 7:
      result = "dohpath";
      break;
    default:
      v4 = "odohconfig";
      if (a1 != 32769) {
        v4 = 0;
      }
      if (a1 == 0x8000) {
        result = "dohuri";
      }
      else {
        result = v4;
      }
      break;
  }
  return result;
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
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
  char v10 = 0;
  memset(v9, 0, sizeof(v9));
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

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, const char *a2)
{
  if (_NameIsPrivate(a2))
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      v3 = "%~s";
      return _GetCUSymAddr_SNPrintF_sAddr(a1, 64, v3);
    }
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      v3 = "%s";
      return _GetCUSymAddr_SNPrintF_sAddr(a1, 64, v3);
    }
  }
  return 4294960561;
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 16 && a3 != 4) {
    return 4294960553;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (!_GetCUSymAddr_SNPrintF_sAddr) {
    return 4294960561;
  }
  char v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v7, 33, "%.4H", a2, a3, a3);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, 64, "%~s", v7);
    }
    return 4294960561;
  }
  return result;
}

char *put_hex_from_bytes(unsigned __int8 *a1, uint64_t a2, char *__str, unint64_t a4)
{
  v4 = __str;
  if (a1)
  {
    uint64_t v5 = a2;
    if (a2)
    {
      if (2 * a2 < a4)
      {
        v6 = a1;
        v7 = &__str[a4];
        do
        {
          int v8 = *v6++;
          v4 += snprintf(v4, v7 - v4, "%02X", v8);
          --v5;
        }
        while (v5);
      }
    }
  }
  return v4;
}

void _dnssec_obj_rr_nsec3_finalize(uint64_t a1)
{
  v2 = *(void **)(a1 + 80);
  if (v2)
  {
    ref_count_obj_release(v2);
    *(void *)(a1 + 80) = 0;
  }
}

uint64_t _dnssec_obj_rr_nsec3_compare(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return 3;
  }
  v6 = *(unsigned char **)(*(void *)(a2 + 16) + 16);
  if (!domain_name_labels_get_parent(*(unsigned char **)(*(void *)(a1 + 16) + 16), 1uLL))
  {
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      v11 = mDNSLogCategory_DNSSEC;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return 2;
      }
    }
    else
    {
      v11 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return 2;
      }
    }
    int v14 = 136447234;
    v15 = "my_parent != NULL";
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
    __int16 v20 = 1024;
    int v21 = 205;
    __int16 v22 = 2048;
    uint64_t v23 = 0;
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v14, 0x30u);
    return 2;
  }
  if (!domain_name_labels_get_parent(v6, 1uLL))
  {
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      v11 = mDNSLogCategory_DNSSEC;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return 2;
      }
    }
    else
    {
      v11 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return 2;
      }
    }
    int v14 = 136447234;
    v15 = "others_parent != NULL";
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
    __int16 v20 = 1024;
    int v21 = 208;
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    goto LABEL_28;
  }
  if (domain_name_labels_canonical_compare()) {
    return 2;
  }
  v7 = *(unsigned __int8 **)(*(void *)(a1 + 16) + 16);
  int v8 = *(unsigned __int8 **)(*(void *)(a2 + 16) + 16);

  return domain_name_label_canonical_compare(v7, v8, 0);
}

BOOL dnssec_obj_rr_nsec3_asserts_name_exists_data_does_not_exist(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  if (*(unsigned __int16 *)(a1 + 34) != a3) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 24);
  v7 = (unsigned __int8 *)(*(unsigned __int8 *)(v6 + 4)
                         + v6
                         + 5
                         + *(unsigned __int8 *)(*(unsigned __int8 *)(v6 + 4) + v6 + 5)
                         + 1);
  unsigned __int16 v8 = *(_WORD *)(a1 + 36)
     - (*(unsigned __int8 *)(v6 + 4)
      + 5
      + *(unsigned __int8 *)(*(unsigned __int8 *)(v6 + 4) + v6 + 5)
      + 1);
  if (rdata_parser_type_bit_maps_cover_dns_type(v7, v8, a4)) {
    return 0;
  }
  unint64_t v9 = (unint64_t)&v7[v8];
  if ((unint64_t)(v7 + 1) < v9)
  {
    int v10 = 0;
    do
    {
      uint64_t v11 = v7[1];
      unint64_t v12 = (unint64_t)&v7[v11 + 2];
      if (v12 > v9) {
        break;
      }
      if (*v7) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v11 == 0;
      }
      if (!v13) {
        v10 |= (v7[2] & 4) >> 2;
      }
      v7 += v11 + 2;
    }
    while (v12 + 1 < v9);
    if (v10) {
      return 0;
    }
  }
  uint64_t nsec3_hashed_name = dnssec_obj_domain_name_get_nsec3_hashed_name(a2, a1);
  if (nsec3_hashed_name) {
    return ref_count_obj_compare(*(void *)(a1 + 16), nsec3_hashed_name, 1) == 0;
  }
  __int16 v16 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_25:
      int v18 = 136447234;
      v19 = "hashed_name != NULL";
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2082;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
      __int16 v24 = 1024;
      int v25 = 316;
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v18, 0x30u);
      return 0;
    }
  }
  else
  {
    __int16 v16 = mDNSLogCategory_DNSSEC_redacted;
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if (result) {
      goto LABEL_25;
    }
  }
  return result;
}

uint64_t dnssec_obj_rr_nsec3_asserts_name_does_not_exist(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned __int16 *)(a1 + 34) != a3) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t nsec3_hashed_name = dnssec_obj_domain_name_get_nsec3_hashed_name(a2, a1);
  if (nsec3_hashed_name)
  {
    uint64_t v7 = nsec3_hashed_name;
    int v8 = *(unsigned __int8 *)(a1 + 88);
    int v9 = ref_count_obj_compare(v4, nsec3_hashed_name, 0);
    if (v8)
    {
      if (v9 == -1) {
        return 1;
      }
      return ref_count_obj_compare(v7, v5, 0) == -1;
    }
    if (v9 == -1) {
      return ref_count_obj_compare(v7, v5, 0) == -1;
    }
    return 0;
  }
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    unint64_t v12 = mDNSLogCategory_DNSSEC;
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_18:
      int v13 = 136447234;
      int v14 = "hashed_name != NULL";
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2082;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rr_nsec3.c";
      __int16 v19 = 1024;
      int v20 = 339;
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v13, 0x30u);
      return 0;
    }
  }
  else
  {
    unint64_t v12 = mDNSLogCategory_DNSSEC_redacted;
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if (result) {
      goto LABEL_18;
    }
  }
  return result;
}

void _mdns_dso_session_finalize(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 48) = 0;
  }
  v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    _Block_release(v3);
    *(void *)(a1 + 56) = 0;
  }
  uint64_t v4 = *(const void **)(a1 + 64);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(a1 + 64) = 0;
  }
  uint64_t v5 = *(void **)(a1 + 88);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 88) = 0;
  }
  uint64_t v6 = *(void **)(a1 + 96);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v7 = *(NSObject **)(a1 + 72);
  if (v7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v7);
    *(void *)(a1 + 72) = 0;
  }
}

char *_mdns_dso_session_copy_description(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(*(void *)(a1 + 16) + 200);
  if (v1)
  {
    return (char *)v1();
  }
  else
  {
    uint64_t result = strdup("<This is a DSO session object.>");
    if (!result) {
      __break(1u);
    }
  }
  return result;
}

double _mdns_dso_session_init(uint64_t a1)
{
  double result = 1.27561485e-307;
  *(void *)(a1 + 116) = 0x36EE8000003A98;
  *(void *)(a1 + 40) = atomic_fetch_add_explicit(&_mdns_dso_session_get_next_id_s_last_id, 1uLL, memory_order_relaxed)
                       + 1;
  return result;
}

void *_mdns_dso_client_session_copy_description(uint64_t a1, int a2, char a3)
{
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2000000000;
  int v27 = 0;
  uint64_t v6 = (void *)mdns_string_builder_create();
  if (v6)
  {
    uint64_t v7 = v6;
    if (a2
      && (int appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v25 + 6) = appended) != 0))
    {
      int v9 = 0;
    }
    else
    {
      mdns_string_builder_append_formatted(v7, "[DSO%llu", *(void *)(a1 + 40));
      if (!*(unsigned char *)(a1 + 124)) {
        mdns_string_builder_append_formatted(v7, " inactive");
      }
      if (*(unsigned __int8 *)(a1 + 214) - 1 > 8) {
        int v10 = "invalid_session_state";
      }
      else {
        int v10 = (&off_10014A788)[(*(unsigned char *)(a1 + 214) - 1)];
      }
      mdns_string_builder_append_formatted(v7, " %s", v10);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) < 1)
      {
        uint64_t v12 = *(void *)(a1 + 136);
        if (v12)
        {
          mdns_string_builder_append_description_with_prefix(v7, " ", v12, a3);
          mdns_string_builder_append_formatted(v7, "@interface %u", *(_DWORD *)(a1 + 208));
        }
      }
      else
      {
        v23[0] = 0;
        v23[1] = v23;
        v23[2] = 0x2000000000;
        v23[3] = " ";
        CFArrayRef v11 = *(const __CFArray **)(a1 + 152);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 0x40000000;
        v21[2] = ___mdns_dso_client_session_copy_description_block_invoke;
        v21[3] = &unk_10014A6E8;
        v21[5] = v23;
        v21[6] = v7;
        v21[4] = &v24;
        char v22 = a3;
        mdns_cfarray_enumerate(v11, (uint64_t)v21);
        _Block_object_dispose(v23, 8);
      }
      uint64_t v13 = *(void *)(a1 + 176);
      if (v13)
      {
        if (*(void *)(a1 + 136)) {
          int v14 = "->";
        }
        else {
          int v14 = " ";
        }
        mdns_string_builder_append_description_with_prefix(v7, v14, v13, a3);
      }
      __int16 v15 = *(NSObject **)(a1 + 80);
      if (v15)
      {
        __int16 v16 = nw_connection_copy_description(v15);
        if (v16)
        {
          __int16 v17 = v16;
          mdns_string_builder_append_formatted(v7, ", %s", v16);
          free(v17);
        }
      }
      mdns_string_builder_append_formatted(v7, ", activity count: %zu", *(void *)(a1 + 104));
      if (*(void *)(a1 + 32))
      {
        int64_t v18 = mach_continuous_time() - *(void *)(a1 + 32);
        if (v18 >= 1)
        {
          unint64_t v19 = mdns_ticks_to_milliseconds(v18);
          mdns_string_builder_append_formatted(v7, ", last activity %llums ago", v19);
        }
      }
      mdns_string_builder_append_formatted(v7, ", inactivity timeout: %ums, keepalive interval: %ums", *(_DWORD *)(a1 + 128), *(_DWORD *)(a1 + 132));
      mdns_string_builder_append_formatted(v7, ", keepalive msg id: %u", *(unsigned __int16 *)(a1 + 212));
      if (*(unsigned char *)(a1 + 215)) {
        mdns_string_builder_append_formatted(v7, ", reports connection error");
      }
      mdns_string_builder_append_formatted(v7, "]");
      int v9 = mdns_string_builder_copy_string((uint64_t)v7);
    }
    os_release(v7);
  }
  else
  {
    int v9 = 0;
  }
  _Block_object_dispose(&v24, 8);
  return v9;
}

BOOL ___mdns_dso_client_session_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(void **)(a1 + 48), *(const char **)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), a2, *(unsigned char *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void _mdns_dso_client_session_invalidate(uint64_t a1)
{
  _mdns_dso_client_session_schedule_user_event(a1, 5, 0);
  v2 = *(const void **)(a1 + 200);
  if (v2)
  {
    _Block_release(v2);
    *(void *)(a1 + 200) = 0;
  }
}

void _mdns_dso_client_session_schedule_user_event(uint64_t a1, char a2, int a3)
{
  if (*(void *)(a1 + 200))
  {
    os_retain((void *)a1);
    uint64_t v6 = _Block_copy(*(const void **)(a1 + 200));
    uint64_t v7 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = ___mdns_dso_client_session_schedule_user_event_block_invoke;
    block[3] = &unk_10014A680;
    char v10 = a2;
    int v9 = a3;
    block[4] = v6;
    block[5] = a1;
    dispatch_async(v7, block);
  }
}

void ___mdns_dso_client_session_schedule_user_event_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  os_release(*(void **)(a1 + 40));
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    _Block_release(v2);
  }
}

BOOL _mdns_dso_client_session_check_and_move_to_done_state(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 214);
  if (v1 != 9) {
    *(unsigned char *)(a1 + 214) = 9;
  }
  return v1 != 9;
}

void _mdns_dso_client_session_close(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v12 = *(NSObject **)(a1 + 184);
  if (v12)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 184));
    dispatch_release(v12);
    *(void *)(a1 + 184) = 0;
  }
  uint64_t v13 = *(NSObject **)(a1 + 192);
  if (v13)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
    dispatch_release(v13);
    *(void *)(a1 + 192) = 0;
  }
  int v14 = *(void **)(a1 + 176);
  if (!v14)
  {
LABEL_11:
    if (a5) {
      goto LABEL_12;
    }
LABEL_22:
    if (!a6) {
      return;
    }
    goto LABEL_23;
  }
  if (a3)
  {
    if (a4)
    {
      uint64_t v15 = mach_continuous_time();
      if (mdns_mach_ticks_per_second_s_once != -1) {
        dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3471);
      }
      v14[5] = v15 + 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
      int v14 = *(void **)(a1 + 176);
      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
      ++v14[4];
    }
  }
  os_release(v14);
  *(void *)(a1 + 176) = 0;
  if (!a5) {
    goto LABEL_22;
  }
LABEL_12:
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
  }
  __int16 v16 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    int v21 = 134217984;
    uint64_t v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Restarting DSO session", (uint8_t *)&v21, 0xCu);
  }
  *(void *)(a1 + 40) = atomic_fetch_add_explicit(&_mdns_dso_session_get_next_id_s_last_id, 1uLL, memory_order_relaxed)
                       + 1;
  *(unsigned char *)(a1 + 214) = 3;
  if (!_mdns_dso_client_session_connect_or_delay_reconnecting(a1))
  {
    uint64_t v18 = a1;
    char v19 = 1;
    int v20 = 0;
LABEL_24:
    _mdns_dso_client_session_schedule_user_event(v18, v19, v20);
    return;
  }
  if (a6)
  {
LABEL_23:
    *(unsigned char *)(a1 + 214) = 8;
    uint64_t v18 = a1;
    char v19 = 4;
    int v20 = a2;
    goto LABEL_24;
  }
}

uint64_t _mdns_dso_client_session_connect_or_delay_reconnecting(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(unsigned char *)(a1 + 214) != 3)
  {
    uint64_t v19 = 4294960587;
    goto LABEL_64;
  }
  uint64_t v42 = *(void *)(a1 + 168);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v42 + 24));
  if (Count < 1)
  {
    uint64_t v19 = 4294960569;
    goto LABEL_46;
  }
  uint64_t v3 = Count;
  uint64_t v41 = v1;
  CFIndex v4 = 0;
  char v5 = 0;
  char v6 = 0;
  unint64_t v7 = 0;
  int v8 = 0;
  *(_DWORD *)handler = 0;
  unsigned int v9 = -1;
  unsigned int v10 = 0xFFFF;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v42 + 24), v4);
    LODWORD(completion[0]) = 0;
    if (_mdns_dso_server_endpoint_is_usable_now((uint64_t)ValueAtIndex, handler, (int *)completion))
    {
      if ((v5 & 1) == 0) {
        char v5 = 1;
      }
      unsigned int priority = nw_endpoint_get_priority();
      int weight = nw_endpoint_get_weight();
      if (v10 <= priority) {
        int v14 = v8;
      }
      else {
        int v14 = 0;
      }
      int v15 = v14 + weight;
      if (v10 <= priority) {
        unint64_t v16 = v7;
      }
      else {
        unint64_t v16 = 0;
      }
      if (!weight) {
        ++v16;
      }
      if (v10 >= priority)
      {
        unsigned int v10 = priority;
        int v8 = v15;
        unint64_t v7 = v16;
      }
    }
    else
    {
      unsigned int v17 = completion[0];
      if (v9 < LODWORD(completion[0])) {
        unsigned int v17 = v9;
      }
      if (*(_DWORD *)handler == -6760) {
        unsigned int v9 = v17;
      }
      v6 |= *(_DWORD *)handler == -6760;
    }
    ++v4;
  }
  while (v3 != v4);
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      char v18 = 1;
      uint64_t v19 = 4294960536;
      goto LABEL_47;
    }
    uint64_t v19 = 4294960569;
LABEL_45:
    uint64_t v1 = v41;
LABEL_46:
    unsigned int v9 = 0;
    char v18 = 0;
LABEL_47:
    int v27 = *(void **)(v1 + 176);
    if (v27)
    {
      os_release(v27);
      *(void *)(v1 + 176) = 0;
    }
    char v28 = v18 ^ 1;
    if (v19 != -6760) {
      char v28 = 1;
    }
    if ((v28 & 1) == 0 && v9)
    {
      v29 = *(NSObject **)(v1 + 184);
      if (v29)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(v1 + 184));
        dispatch_release(v29);
        *(void *)(v1 + 184) = 0;
      }
      if (_mdns_dso_session_queue_s_once != -1) {
        dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
      }
      monotonic_timer = _mdns_dispatch_create_monotonic_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 5u, _mdns_dso_session_queue_s_queue);
      *(void *)(v1 + 184) = monotonic_timer;
      if (monotonic_timer)
      {
        *(void *)handler = _NSConcreteStackBlock;
        *(void *)&handler[8] = 0x40000000;
        *(void *)&handler[16] = ___mdns_dso_client_session_schedule_reconnecting_block_invoke;
        *(void *)&handler[24] = &__block_descriptor_tmp_19_5986;
        uint64_t v46 = v1;
        dispatch_source_set_event_handler(monotonic_timer, handler);
        dispatch_activate(*(dispatch_object_t *)(v1 + 184));
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = 4294960567;
      }
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
      }
      v31 = _mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(v1 + 40);
        *(_DWORD *)handler = 134218498;
        *(void *)&handler[4] = v32;
        *(_WORD *)&handler[12] = 1024;
        *(_DWORD *)&handler[14] = v9;
        *(_WORD *)&handler[18] = 2112;
        *(void *)&handler[20] = v1;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[DSO%llu] -> Wait for reconnection -- delay: %ums, session: %@", handler, 0x1Cu);
      }
      if (!v19) {
        return v19;
      }
    }
LABEL_64:
    _mdns_dso_session_handle_failure(v1, v19, 1, 0);
    return v19;
  }
  uint32_t v20 = arc4random() % (v8 + 1);
  if (v7) {
    int v21 = arc4random() % v7 + 1;
  }
  else {
    int v21 = 0;
  }
  CFIndex v22 = 0;
  uint32_t v23 = 0;
  if (v3 <= 1) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v3;
  }
  while (1)
  {
    int v25 = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v42 + 24), v22);
    if (!_mdns_dso_server_endpoint_is_usable_now((uint64_t)v25, 0, 0)
      || nw_endpoint_get_priority() != v10)
    {
      goto LABEL_43;
    }
    int v26 = nw_endpoint_get_weight();
    if (!v20) {
      break;
    }
    if (v26)
    {
      v23 += v26;
      if (v23 >= v20) {
        goto LABEL_66;
      }
    }
LABEL_43:
    if (v24 == ++v22)
    {
LABEL_44:
      uint64_t v19 = 4294960560;
      goto LABEL_45;
    }
  }
  if (v26) {
    goto LABEL_43;
  }
  if (!v21) {
    goto LABEL_44;
  }
  if (--v21) {
    goto LABEL_43;
  }
LABEL_66:
  uint64_t v1 = v41;
  *(void *)(v41 + 176) = v25;
  os_retain(v25);
  unsigned int v43 = 0;
  v34 = (void *)(*(uint64_t (**)(uint64_t, unsigned int *))(*(void *)(v1 + 16) + 64))(v1, &v43);
  v35 = v34;
  if (!v43)
  {
    *(void *)(v41 + 80) = v34;
    nw_retain(v34);
    os_retain((void *)v41);
    nw_retain(v35);
    v36 = *(NSObject **)(v41 + 80);
    if (_mdns_dso_session_queue_s_once != -1) {
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
    }
    nw_connection_set_queue(v36, (dispatch_queue_t)_mdns_dso_session_queue_s_queue);
    v37 = *(NSObject **)(v41 + 80);
    *(void *)handler = _NSConcreteStackBlock;
    *(void *)&handler[8] = 0x40000000;
    *(void *)&handler[16] = ___mdns_dso_session_prepare_connection_with_nw_connection_block_invoke;
    *(void *)&handler[24] = &__block_descriptor_tmp_15_5992;
    uint64_t v46 = v41;
    v47 = v35;
    nw_connection_set_state_changed_handler(v37, handler);
    nw_connection_start(*(nw_connection_t *)(v41 + 80));
    v38 = *(NSObject **)(v41 + 80);
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 0x40000000;
    completion[2] = ___mdns_dso_session_schedule_receive_block_invoke;
    completion[3] = &__block_descriptor_tmp_17_5993;
    completion[4] = v41;
    nw_connection_receive_message(v38, completion);
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    v39 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = *(void *)(v41 + 40);
      *(_DWORD *)handler = 134218242;
      *(void *)&handler[4] = v40;
      *(_WORD *)&handler[12] = 2112;
      *(void *)&handler[14] = v35;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Start connection -- connection: %@", handler, 0x16u);
    }
  }
  if (v35) {
    nw_release(v35);
  }
  uint64_t v19 = v43;
  if (v43) {
    goto LABEL_46;
  }
  return v19;
}

uint64_t ___mdns_dso_client_session_schedule_reconnecting_block_invoke(uint64_t a1)
{
  return _mdns_dso_client_session_connect_or_delay_reconnecting(*(void *)(a1 + 32));
}

void _mdns_dso_session_handle_failure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  unsigned int v9 = *(void (**)(uint64_t, uint64_t))(v8 + 152);
  if (v9)
  {
    v9(a1, a2);
    uint64_t v8 = *(void *)(a1 + 16);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 168))(a1, a4))
  {
    _mdns_dso_session_close_internal(a1, a2, a3, 0, a4, 1);
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    unsigned int v10 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 134218752;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = (int)a2;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 1024;
      int v21 = a4;
      uint64_t v12 = "[DSO%llu] DSO session failed, closing -- error: %{mdns:err}ld, forcibly: %{BOOL}d, restartable: %{BOOL}d";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x22u);
    }
  }
  else
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    unsigned int v10 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 134218752;
      uint64_t v15 = v13;
      __int16 v16 = 2048;
      uint64_t v17 = (int)a2;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 1024;
      int v21 = a4;
      uint64_t v12 = "[DSO%llu] DSO session failed, waiting to restart -- error: %{mdns:err}ld, forcibly: %{BOOL}d, restartable: %{BOOL}d";
      goto LABEL_12;
    }
  }
}

uint64_t _mdns_dso_session_close_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _mdns_dso_session_stop_inactivity_timer(a1);
  *(void *)(a1 + 104) = 0;
  uint64_t v12 = *(NSObject **)(a1 + 80);
  if (v12)
  {
    if (a3) {
      nw_connection_force_cancel(v12);
    }
    else {
      nw_connection_cancel(v12);
    }
    uint64_t v13 = *(void **)(a1 + 80);
    if (v13)
    {
      nw_release(v13);
      *(void *)(a1 + 80) = 0;
    }
    int v14 = *(void **)(a1 + 88);
    if (v14)
    {
      free(v14);
      *(void *)(a1 + 88) = 0;
    }
    uint64_t v15 = *(void **)(a1 + 96);
    if (v15)
    {
      free(v15);
      *(void *)(a1 + 96) = 0;
    }
    *(_DWORD *)(a1 + 112) = 0;
  }
  __int16 v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 16) + 176);

  return v16(a1, a2, a3, a4, a5, a6);
}

void _mdns_dso_session_stop_inactivity_timer(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 72);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v2);
    *(void *)(a1 + 72) = 0;
  }
  *(void *)(a1 + 32) = 0;
}

void ___mdns_dso_session_queue_block_invoke(id a1)
{
  _mdns_dso_session_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mdns.dso-session-queue", 0);
}

void ___mdns_dso_session_prepare_connection_with_nw_connection_block_invoke(uint64_t a1, int a2, nw_error_t error)
{
  if (*(void *)(*(void *)(a1 + 32) + 80) != *(void *)(a1 + 40)) {
    goto LABEL_2;
  }
  if (error) {
    uint64_t error_code = nw_error_get_error_code(error);
  }
  else {
    uint64_t error_code = 0;
  }
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
  }
  char v6 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 40);
    uint64_t v27 = nw_connection_state_to_string();
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 80);
    *(_DWORD *)v33 = 134218754;
    *(void *)&v33[4] = v26;
    *(_WORD *)&v33[12] = 2082;
    *(void *)&v33[14] = v27;
    __int16 v34 = 2112;
    uint64_t v35 = v28;
    __int16 v36 = 2048;
    uint64_t v37 = (int)error_code;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[DSO%llu] DSO session connection state change -- state: %{public}s, connection: %@, error: %{mdns:err}ld", v33, 0x2Au);
  }
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      return;
    case 3:
      unint64_t v7 = (void *)nw_connection_copy_connected_local_endpoint();
      uint64_t v8 = nw_connection_copy_connected_remote_endpoint();
      if (_mdns_dso_session_log_s_once == -1) {
        goto LABEL_15;
      }
      break;
    case 4:
      if (error_code != 54) {
        goto LABEL_46;
      }
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
      }
      int v25 = _mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        uint64_t v31 = *(void *)(v30 + 40);
        uint64_t v32 = *(void *)(v30 + 80);
        *(_DWORD *)v33 = 134218242;
        *(void *)&v33[4] = v31;
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[DSO%llu] DSO session is forcibly aborted by the other side -- %@", v33, 0x16u);
      }
      uint64_t error_code = 54;
      goto LABEL_47;
    case 5:
      goto LABEL_3;
    default:
      uint64_t error_code = 4294960587;
      goto LABEL_47;
  }
  while (1)
  {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
LABEL_15:
    unsigned int v9 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)v33 = 134218498;
      *(void *)&v33[4] = v10;
      *(_WORD *)&v33[12] = 2112;
      *(void *)&v33[14] = v7;
      __int16 v34 = 2112;
      uint64_t v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Start connection -> Connection ready -- %@ <---> %@", v33, 0x20u);
    }
    if (v7) {
      nw_release(v7);
    }
    if (v8) {
      nw_release((void *)v8);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v8 + 88);
    if (v11)
    {
      free(v11);
      *(void *)(v8 + 88) = 0;
    }
    uint64_t v12 = nw_connection_copy_endpoint(*(nw_connection_t *)(v8 + 80));
    if (v12)
    {
      unint64_t v7 = v12;
      hostname = nw_endpoint_get_hostname(v12);
      if (!hostname) {
        goto LABEL_48;
      }
      int v14 = strdup(hostname);
      if (!v14) {
        goto LABEL_48;
      }
      *(void *)(v8 + 88) = v14;
      nw_release(v7);
    }
    *(_DWORD *)(v8 + 112) = 0;
    nw_path_t v15 = nw_connection_copy_current_path(*(nw_connection_t *)(v8 + 80));
    if (v15)
    {
      unint64_t v7 = v15;
      *(_DWORD *)(v8 + 112) = nw_path_get_interface_index();
      nw_release(v7);
    }
    __int16 v16 = *(void **)(v8 + 96);
    if (v16)
    {
      free(v16);
      *(void *)(v8 + 96) = 0;
    }
    unsigned int v17 = *(_DWORD *)(v8 + 112);
    if (!v17) {
      goto LABEL_35;
    }
    memset(v33, 0, 17);
    __int16 v18 = if_indextoname(v17, v33);
    if (!v18) {
      goto LABEL_35;
    }
    int v19 = strdup(v18);
    if (v19) {
      break;
    }
LABEL_48:
    __break(1u);
  }
  *(void *)(v8 + 96) = v19;
LABEL_35:
  __int16 v20 = nw_connection_copy_parameters(*(nw_connection_t *)(v8 + 80));
  int v21 = nw_parameters_copy_default_protocol_stack(v20);
  nw_protocol_options_t v22 = nw_protocol_stack_copy_transport_protocol(v21);
  int maximum_segment_size = nw_tcp_options_get_maximum_segment_size();
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
  }
  uint64_t v24 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = *(void *)(v8 + 40);
    *(_DWORD *)v33 = 134218240;
    *(void *)&v33[4] = v29;
    *(_WORD *)&v33[12] = 1024;
    *(_DWORD *)&v33[14] = maximum_segment_size;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[DSO%llu] mss is %d", v33, 0x12u);
  }
  nw_release(v22);
  nw_release(v21);
  nw_release(v20);
  (*(void (**)(uint64_t))(*(void *)(v8 + 16) + 80))(v8);
  uint64_t error_code = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 88))();
LABEL_46:
  if (error_code)
  {
LABEL_47:
    _mdns_dso_session_handle_failure(*(void *)(a1 + 32), error_code, 1, 1);
LABEL_2:
    if (a2 == 5)
    {
LABEL_3:
      os_release(*(void **)(a1 + 32));
      nw_release(*(void **)(a1 + 40));
    }
  }
}

void ___mdns_dso_session_schedule_receive_block_invoke(uint64_t a1, NSObject *a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  if (!*(void *)(*(void *)(a1 + 32) + 80)) {
    return;
  }
  uint64_t error_code = a5;
  char v44 = 0;
  if (context)
  {
    BOOL is_final = nw_content_context_get_is_final(context);
    if (!error_code) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  BOOL is_final = 0;
  if (a5) {
LABEL_4:
  }
    uint64_t error_code = nw_error_get_error_code((nw_error_t)error_code);
LABEL_5:
  if (error_code) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = is_final;
  }
  if (v9)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 160);
    if (v10) {
      v10();
    }
    char v44 = 1;
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    uint64_t v11 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v12;
      uint64_t v13 = "[DSO%llu] DSO session is gracefully closed by the other side.";
      int v14 = v11;
      uint32_t v15 = 12;
      goto LABEL_58;
    }
  }
  else if (error_code == 61 || error_code == 54)
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    uint64_t v16 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = error_code;
      uint64_t v13 = "[DSO%llu] DSO session is forcibly aborted by the other side -- error: %{mdns:err}ld";
      int v14 = v16;
      uint32_t v15 = 22;
LABEL_58:
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      if (!a2) {
        goto LABEL_39;
      }
LABEL_21:
      if (dispatch_data_get_size(a2))
      {
        int v17 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 96))();
        uint64_t v18 = *(void *)(a1 + 32);
        if (!v17)
        {
          uint64_t error_code = 4294960587;
          goto LABEL_40;
        }
        int v19 = mdns_message_create_with_dispatch_data(a2, 1);
        if (!v19)
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t error_code = 4294960567;
          goto LABEL_40;
        }
        __int16 v20 = v19;
        int v21 = (_UNKNOWN **)*((void *)v19 + 2);
        if (!v21) {
          goto LABEL_31;
        }
        while (v21 != &_mdns_dso_message_kind)
        {
          int v21 = (_UNKNOWN **)*v21;
          if (!v21) {
            goto LABEL_31;
          }
        }
        if (!(*(unsigned int (**)(uint64_t, unsigned char *))(*(void *)(v18 + 16) + 120))(v18, v19))
        {
          char v45 = 0;
          __int16 v36 = (_UNKNOWN **)v20[2];
          if (v36)
          {
            while (v36 != &_mdns_dso_message_kind)
            {
              __int16 v36 = (_UNKNOWN **)*v36;
              if (!v36) {
                goto LABEL_51;
              }
            }
            uint64_t error_code = (*(uint64_t (**)(uint64_t, void *, char *, char *))(*(void *)(v18 + 16) + 128))(v18, v20, &v44, &v45);
            if (!v45)
            {
              if (_mdns_dso_session_log_s_once != -1) {
                dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
              }
              uint64_t v37 = _mdns_dso_session_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v38 = *(void *)(v18 + 40);
                size_t size = dispatch_data_get_size(a2);
                uint64_t v40 = *(void **)(v18 + 88);
                uint64_t v41 = *(void *)(v18 + 96);
                int v42 = *(_DWORD *)(v18 + 112);
                *(_DWORD *)buf = 134219010;
                *(void *)&buf[4] = v38;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = size;
                *(_WORD *)&buf[22] = 2082;
                v47 = v40;
                LOWORD(v48) = 2082;
                *(void *)((char *)&v48 + 2) = v41;
                WORD5(v48) = 1024;
                HIDWORD(v48) = v42;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Received %zu-byte session DSO message from %{public}s over DSO session via %{public}s/%u", buf, 0x30u);
              }
            }
          }
          else
          {
LABEL_51:
            uint64_t error_code = 4294960560;
          }
        }
        else
        {
LABEL_31:
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
          }
          nw_protocol_options_t v22 = _mdns_dso_session_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = *(void *)(v18 + 40);
            size_t v24 = dispatch_data_get_size(a2);
            int v25 = *(void **)(v18 + 88);
            uint64_t v26 = *(void *)(v18 + 96);
            int v27 = *(_DWORD *)(v18 + 112);
            *(_DWORD *)buf = 134219010;
            *(void *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2082;
            v47 = v25;
            LOWORD(v48) = 2082;
            *(void *)((char *)&v48 + 2) = v26;
            WORD5(v48) = 1024;
            HIDWORD(v48) = v27;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Received %zu-byte user DSO message from %{public}s over DSO session via %{public}s/%u", buf, 0x30u);
          }
          if (*(void *)(v18 + 64))
          {
            os_retain((void *)v18);
            dispatch_retain(a2);
            uint64_t v28 = _Block_copy(*(const void **)(v18 + 64));
            uint64_t v29 = *(NSObject **)(v18 + 48);
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 0x40000000;
            *(void *)&buf[16] = ___mdns_dso_session_schedule_user_receive_block_invoke;
            v47 = &unk_10014A578;
            *(void *)&long long v48 = v28;
            *((void *)&v48 + 1) = v18;
            v49 = a2;
            dispatch_async(v29, buf);
          }
          uint64_t error_code = 0;
        }
        os_release(v20);
      }
      goto LABEL_39;
    }
  }
  if (a2) {
    goto LABEL_21;
  }
LABEL_39:
  uint64_t v18 = *(void *)(a1 + 32);
  if (error_code)
  {
LABEL_40:
    uint64_t v30 = v18;
    uint64_t v31 = error_code;
    uint64_t v32 = 1;
    uint64_t v33 = 1;
LABEL_43:
    _mdns_dso_session_handle_failure(v30, v31, v32, v33);
    return;
  }
  if (v44)
  {
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    goto LABEL_43;
  }
  __int16 v34 = *(void (**)(void))(*(void *)(v18 + 16) + 136);
  if (v34)
  {
    v34(*(void *)(a1 + 32));
    uint64_t v18 = *(void *)(a1 + 32);
  }
  uint64_t v35 = *(NSObject **)(v18 + 80);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 0x40000000;
  *(void *)&buf[16] = ___mdns_dso_session_schedule_receive_block_invoke;
  v47 = &__block_descriptor_tmp_17_5993;
  *(void *)&long long v48 = v18;
  nw_connection_receive_message(v35, buf);
}

void ___mdns_dso_session_schedule_user_receive_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 104))()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  os_release(*(void **)(a1 + 40));
  v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    _Block_release(v3);
  }
}

void ___mdns_dso_session_log_block_invoke(id a1)
{
  _mdns_dso_session_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "dso_session");
}

uint64_t _mdns_dso_client_session_check_and_move_to_closing_state(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 214);
  if ((v2 & 0xFE) == 8) {
    return 0;
  }
  if (a2)
  {
    if (v2 == 3) {
      return 0;
    }
    char v4 = 3;
  }
  else
  {
    char v4 = 8;
  }
  *(unsigned char *)(a1 + 214) = v4;
  return 1;
}

void _mdns_dso_client_session_handle_error(uint64_t a1, unsigned int a2)
{
  if (a2 - 51 <= 0xE && ((1 << (a2 - 51)) & 0x6609) != 0 && *(unsigned char *)(a1 + 215))
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    char v4 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218240;
      uint64_t v7 = v5;
      __int16 v8 = 2048;
      uint64_t v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Reporting connection error to the client -- error: %{mdns:err}ld", (uint8_t *)&v6, 0x16u);
    }
    _mdns_dso_client_session_schedule_user_event(a1, 2, a2);
  }
}

uint64_t _mdns_dso_client_session_schedule_keepalive_message(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 214) != 7) {
    return 4294960587;
  }
  int v2 = *(NSObject **)(a1 + 192);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
    dispatch_release(v2);
    *(void *)(a1 + 192) = 0;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 132);
  if (v3 == -1) {
    return 0;
  }
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
  }
  monotonic_timer = _mdns_dispatch_create_monotonic_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 5u, _mdns_dso_session_queue_s_queue);
  *(void *)(a1 + 192) = monotonic_timer;
  if (monotonic_timer)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = ___mdns_dso_client_session_schedule_keepalive_message_block_invoke;
    handler[3] = &__block_descriptor_tmp_30_6011;
    handler[4] = a1;
    dispatch_source_set_event_handler(monotonic_timer, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 192));
    return 0;
  }
  return 4294960567;
}

void ___mdns_dso_client_session_schedule_keepalive_message_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int v3 = *(NSObject **)(v2 + 192);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 192));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 192) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 214) == 7)
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    char v4 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[DSO%llu] Sending keepalive message", (uint8_t *)&v8, 0xCu);
    }
    uint64_t keepalive_message = _mdns_dso_session_create_keepalive_message(*(void *)(a1 + 32), *(_WORD *)(*(void *)(a1 + 32) + 212));
    if (keepalive_message)
    {
      int v6 = (void *)keepalive_message;
      _mdns_dso_session_send_data_immediately(*(void *)(a1 + 32), *(dispatch_data_t *)(keepalive_message + 24), 1, 1);
      os_release(v6);
    }
  }
}

uint64_t _mdns_dso_session_create_keepalive_message(uint64_t a1, __int16 a2)
{
  uint64_t result = _os_object_alloc();
  if (result)
  {
    uint64_t v5 = result;
    int v6 = &_mdns_dso_keepalive_message_builder_kind;
    *(void *)(result + 16) = &_mdns_dso_keepalive_message_builder_kind;
    do
    {
      uint64_t v7 = (void (*)(uint64_t))v6[2];
      if (v7) {
        v7(v5);
      }
      int v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    *(_WORD *)(v5 + 28) = a2;
    *(void *)(v5 + 32) = *(void *)(a1 + 116);
    message = mdns_dso_message_builder_create_message(v5);
    os_release((void *)v5);
    return (uint64_t)message;
  }
  return result;
}

void _mdns_dso_session_send_data_immediately(uint64_t a1, dispatch_data_t data, char a3, char a4)
{
  uint64_t v7 = *(NSObject **)(a1 + 80);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = ___mdns_dso_session_send_data_immediately_block_invoke;
  v8[3] = &__block_descriptor_tmp_32_6013;
  v8[4] = a1;
  v8[5] = v7;
  v8[6] = dispatch_data_get_size(data);
  char v9 = a4;
  char v10 = a3;
  nw_connection_send(v7, data, _nw_content_context_default_message, 1, v8);
}

void ___mdns_dso_session_send_data_immediately_block_invoke(uint64_t a1, nw_error_t error)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[10] != *(void *)(a1 + 40)) {
    return;
  }
  if (error)
  {
    uint64_t error_code = nw_error_get_error_code(error);
    if (error_code)
    {
      uint64_t v5 = error_code;
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
      }
      int v6 = _mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(v19 + 40);
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v22 = *(void *)(v19 + 88);
        uint64_t v23 = *(void *)(v19 + 96);
        LODWORD(v19) = *(_DWORD *)(v19 + 112);
        int v24 = 134219266;
        uint64_t v25 = v20;
        __int16 v26 = 2048;
        uint64_t v27 = v21;
        __int16 v28 = 2082;
        uint64_t v29 = v22;
        __int16 v30 = 2082;
        uint64_t v31 = v23;
        __int16 v32 = 1024;
        int v33 = v19;
        __int16 v34 = 2048;
        uint64_t v35 = (int)v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[DSO%llu] Failed to send %zu-byte DSO message to %{public}s over DSO session via %{public}s/%u -- error: %{mdns:err}ld", (uint8_t *)&v24, 0x3Au);
      }
      _mdns_dso_session_handle_failure(*(void *)(a1 + 32), v5, 1, 1);
      return;
    }
  }
  else if ((*(unsigned int (**)(void))(v2[2] + 104))(*(void *)(a1 + 32)) && !v2[13])
  {
    _mdns_dso_session_schedule_inactivity_timer_ex(*(void **)(a1 + 32), 0);
  }
  if (*(unsigned char *)(a1 + 56)) {
    return;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    uint64_t v7 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(v8 + 88);
      uint64_t v12 = *(void *)(v8 + 96);
      LODWORD(v8) = *(_DWORD *)(v8 + 112);
      int v24 = 134219010;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      __int16 v28 = 2082;
      uint64_t v29 = v11;
      __int16 v30 = 2082;
      uint64_t v31 = v12;
      __int16 v32 = 1024;
      int v33 = v8;
      uint64_t v13 = "[DSO%llu] Sent %zu-byte user DSO message to %{public}s over DSO session via %{public}s/%u";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0x30u);
    }
  }
  else
  {
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    uint64_t v7 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v14 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(v14 + 88);
      uint64_t v18 = *(void *)(v14 + 96);
      LODWORD(v14) = *(_DWORD *)(v14 + 112);
      int v24 = 134219010;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2082;
      uint64_t v29 = v17;
      __int16 v30 = 2082;
      uint64_t v31 = v18;
      __int16 v32 = 1024;
      int v33 = v14;
      uint64_t v13 = "[DSO%llu] Sent %zu-byte session DSO message to %{public}s over DSO session via %{public}s/%u";
      goto LABEL_23;
    }
  }
}

uint64_t _mdns_dso_session_schedule_inactivity_timer_ex(void *a1, uint64_t a2)
{
  if (!(*(unsigned int (**)(void))(a1[2] + 104))() || a1[13]) {
    return 4294960587;
  }
  _mdns_dso_session_stop_inactivity_timer((uint64_t)a1);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(a1[2] + 112))(a1, a2);
  if (!result)
  {
    uint64_t result = a1[9];
    if (result)
    {
      dispatch_activate((dispatch_object_t)result);
      uint64_t v5 = mach_continuous_time();
      uint64_t result = 0;
      a1[4] = v5;
    }
  }
  return result;
}

uint64_t _mdns_dso_client_session_process_dso_message(uint64_t a1, void *a2, unsigned char *a3, char *a4)
{
  int v6 = (_UNKNOWN **)(a2 + 2);
  uint64_t v5 = a2[2];
  int v7 = *(unsigned __int16 *)(v5 + 56);
  if (!*(_WORD *)(v5 + 56))
  {
    char v15 = 0;
    uint64_t result = 4294960554;
    goto LABEL_36;
  }
  int v11 = *(unsigned char *)(_mdns_dso_message_get_header(a2[4], a2[5]) + 3) & 0xF;
  if (!mdns_dso_message_is_unidirectional((unsigned __int16 *)a2[4], a2[5]))
  {
    if (v7 != 1) {
      goto LABEL_25;
    }
    int v17 = *(unsigned __int8 *)(a1 + 214);
    if (v17 == 7)
    {
      if (v11)
      {
LABEL_24:
        char v15 = 0;
LABEL_35:
        uint64_t result = 0;
        goto LABEL_36;
      }
      uint64_t result = _mdns_dso_client_session_accept_keepalive_message(a1, (uint64_t)a2, a3);
      if (!result)
      {
        if (_mdns_dso_session_log_s_once != -1) {
          dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
        }
        uint64_t v22 = _mdns_dso_session_log_s_log;
        char v15 = 1;
        if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(a1 + 40);
          int v24 = 134217984;
          uint64_t v25 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[DSO%llu] Keepalive message acked", (uint8_t *)&v24, 0xCu);
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (v17 != 6) {
        goto LABEL_25;
      }
      if (v11)
      {
        char v15 = 0;
        uint64_t result = 4294960543;
        goto LABEL_36;
      }
      uint64_t result = _mdns_dso_client_session_accept_keepalive_message(a1, (uint64_t)a2, 0);
      if (!result)
      {
        *(unsigned char *)(a1 + 214) = 7;
        uint64_t v18 = *(NSObject **)(a1 + 192);
        if (v18)
        {
          dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
          dispatch_release(v18);
          *(void *)(a1 + 192) = 0;
        }
        uint64_t result = _mdns_dso_session_schedule_inactivity_timer_ex((void *)a1, 0);
        if (!result)
        {
          uint64_t v19 = *(void *)(a1 + 176);
          if (!v19) {
            goto LABEL_25;
          }
          *(void *)(v19 + 32) = 0;
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
          }
          uint64_t v20 = _mdns_dso_session_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(a1 + 40);
            int v24 = 134218242;
            uint64_t v25 = v21;
            __int16 v26 = 2112;
            uint64_t v27 = a1;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Preparing session -> Session ready -- session: %@", (uint8_t *)&v24, 0x16u);
          }
          _mdns_dso_client_session_schedule_user_event(a1, 3, 0);
          goto LABEL_24;
        }
      }
    }
    char v15 = 0;
    goto LABEL_36;
  }
  if (v7 != 1)
  {
    if (v7 == 2)
    {
      do
        int v6 = (_UNKNOWN **)*v6;
      while (v6 != (_UNKNOWN **)&_mdns_dso_retry_delay_message_kind);
      unsigned int v12 = bswap32(*(_DWORD *)(a2[4] + 16));
      uint64_t v13 = *(void *)(a1 + 176);
      uint64_t v14 = mach_continuous_time();
      if (mdns_mach_ticks_per_second_s_once != -1) {
        dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3471);
      }
      char v15 = 0;
      *(void *)(v13 + 40) = mdns_mach_ticks_per_second_s_ticks_per_second * (v12 / 0x3E8uLL)
                            + mdns_mach_ticks_per_second_s_ticks_per_second * (unint64_t)(v12 % 0x3E8) / 0x3E8
                            + v14;
      *a3 = 1;
      goto LABEL_35;
    }
LABEL_25:
    char v15 = 0;
    uint64_t result = 4294960560;
    goto LABEL_36;
  }
  if (v11) {
    goto LABEL_24;
  }
  uint64_t result = _mdns_dso_client_session_accept_keepalive_message(a1, (uint64_t)a2, a3);
  char v15 = 0;
  if (!result) {
    goto LABEL_35;
  }
LABEL_36:
  if (a4) {
    *a4 = v15;
  }
  return result;
}

uint64_t _mdns_dso_client_session_accept_keepalive_message(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = *(_UNKNOWN ***)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = a2;
    while (v5 != (_UNKNOWN **)&_mdns_dso_keepalive_message_kind)
    {
      uint64_t v5 = (_UNKNOWN **)*v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(v6 + 32);
  if (*(void *)(v6 + 40) - 16 >= __rev16(*(unsigned __int16 *)(v7 + 14))) {
    uint64_t v8 = (unsigned int *)(v7 + 16);
  }
  else {
    uint64_t v8 = 0;
  }
  unsigned int v9 = bswap32(*v8);
  if (v9 <= 0x1388) {
    unsigned int v10 = 5000;
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a1 + 128) = v10;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)(a1 + 16) + 104))(a1) || *(void *)(a1 + 104)) {
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 72)) {
    return 4294960587;
  }
  int64_t v15 = mach_continuous_time() - *(void *)(a1 + 32);
  if (v15 < 0) {
    return 4294960587;
  }
  unint64_t v16 = mdns_ticks_to_milliseconds(v15);
  int v17 = *(NSObject **)(a1 + 72);
  if (v17)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v17);
    *(void *)(a1 + 72) = 0;
  }
  if (v16 >= v10)
  {
    if (a3) {
      *a3 = 1;
    }
    goto LABEL_14;
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t result = _mdns_dso_session_schedule_inactivity_timer_ex((void *)a1, v10 - v16);
  if (!result)
  {
LABEL_14:
    uint64_t result = 0;
    uint64_t v12 = *(void *)(v6 + 32);
    uint64_t v13 = v12 + 16;
    if (*(void *)(v6 + 40) - 16 < __rev16(*(unsigned __int16 *)(v12 + 14))) {
      uint64_t v13 = 0;
    }
    unsigned int v14 = bswap32(*(_DWORD *)(v13 + 4));
    if (v14 <= 0x2710) {
      unsigned int v14 = 10000;
    }
    *(_DWORD *)(a1 + 132) = v14;
  }
  return result;
}

BOOL _mdns_dso_client_session_check_if_dso_message_belongs_to_user(uint64_t a1, void *a2)
{
  char v4 = (unsigned __int16 *)a2[4];
  unint64_t v5 = a2[5];
  if (mdns_dso_message_is_unidirectional(v4, v5)) {
    return *(unsigned __int16 *)(a2[2] + 56) > 2u;
  }
  _mdns_dso_message_get_header((uint64_t)v4, v5);
  return *(unsigned __int16 *)(a1 + 212) != bswap32(*v4) >> 16;
}

uint64_t _mdns_dso_client_session_set_up_inactivity_timer(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a2;
  if (!a2) {
    unsigned int v2 = *(_DWORD *)(a1 + 128);
  }
  if (v2 == -1) {
    return 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = ___mdns_dso_client_session_set_up_inactivity_timer_ex_block_invoke;
  v8[3] = &__block_descriptor_tmp_28_6020;
  v8[4] = a1;
  unsigned int v9 = v2;
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
  }
  monotonic_timer = _mdns_dispatch_create_monotonic_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 5u, _mdns_dso_session_queue_s_queue);
  if (!monotonic_timer) {
    return 4294960567;
  }
  unint64_t v5 = monotonic_timer;
  dispatch_source_set_event_handler(monotonic_timer, v8);
  uint64_t v6 = *(NSObject **)(a1 + 72);
  if (v6)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
    dispatch_release(v6);
  }
  uint64_t result = 0;
  *(void *)(a1 + 72) = v5;
  return result;
}

void ___mdns_dso_client_session_set_up_inactivity_timer_ex_block_invoke(uint64_t a1)
{
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
  }
  unsigned int v2 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
    int v4 = *(_DWORD *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Hit inactivity timeout, closing the idle session -- inactivity timeout: %ums", (uint8_t *)&v6, 0x12u);
  }
  _mdns_dso_session_stop_inactivity_timer(*(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 32);
  if ((*(unsigned int (**)(uint64_t))(*(void *)(v5 + 16) + 104))(v5))
  {
    if (!*(void *)(v5 + 104)) {
      _mdns_dso_session_handle_failure(*(void *)(a1 + 32), 0, 0, 0);
    }
  }
}

BOOL _mdns_dso_client_session_is_session_ready(uint64_t a1)
{
  return *(unsigned char *)(a1 + 214) == 7;
}

BOOL _mdns_dso_client_session_expects_message(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 214) & 0xFE) == 6;
}

uint64_t _mdns_dso_client_session_prepare_session(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 214) != 5) {
    return 4294960587;
  }
  uint64_t keepalive_message = _mdns_dso_session_create_keepalive_message(a1, *(_WORD *)(a1 + 212));
  if (!keepalive_message) {
    return 4294960567;
  }
  uint64_t v3 = (dispatch_data_t *)keepalive_message;
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
  }
  monotonic_timer = _mdns_dispatch_create_monotonic_timer(0x7530u, 0xFFFFFFFFFFFFFFFFLL, 5u, _mdns_dso_session_queue_s_queue);
  if (monotonic_timer)
  {
    *(void *)(a1 + 192) = monotonic_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = ___mdns_dso_client_session_prepare_session_block_invoke;
    handler[3] = &__block_descriptor_tmp_27_6022;
    handler[4] = a1;
    dispatch_source_set_event_handler(monotonic_timer, handler);
    if (_mdns_dso_session_log_s_once != -1) {
      dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
    }
    uint64_t v5 = _mdns_dso_session_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Connection ready -> Preparing session", buf, 0xCu);
    }
    _mdns_dso_session_send_data_immediately(a1, v3[3], 0, 0);
    dispatch_activate(*(dispatch_object_t *)(a1 + 192));
    uint64_t v7 = 0;
    *(unsigned char *)(a1 + 214) = 6;
  }
  else
  {
    uint64_t v7 = 4294960567;
  }
  os_release(v3);
  return v7;
}

void ___mdns_dso_client_session_prepare_session_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 192);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 192));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 192) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 214) == 6)
  {
    _mdns_dso_session_handle_failure(v2, 4294960574, 1, 1);
  }
}

uint64_t _mdns_dso_client_session_set_connection_ready(uint64_t result)
{
  *(unsigned char *)(result + 214) = 5;
  return result;
}

BOOL _mdns_dso_client_session_evaluate_trust(uint64_t a1, int a2, sec_trust_t trust, int *a4)
{
  CFErrorRef error = 0;
  if (trust)
  {
    uint64_t v6 = sec_trust_copy_ref(trust);
    if (v6)
    {
      uint64_t v7 = v6;
      CFArrayRef v8 = *(const __CFArray **)(a1 + 160);
      if (v8)
      {
        SecTrustSetNetworkFetchAllowed(v6, 0);
        SecTrustSetAnchorCertificatesOnly(v7, 1u);
        SecTrustSetAnchorCertificates(v7, v8);
        CFDataRef v9 = SecTrustCopyExceptions(v7);
        if (v9) {
          SecTrustSetExceptions(v7, v9);
        }
        BOOL v10 = SecTrustEvaluateWithError(v7, &error);
        if (v10)
        {
          int Code = 0;
        }
        else if (error)
        {
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
          }
          uint64_t v12 = _mdns_dso_session_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 134218242;
            uint64_t v17 = v14;
            __int16 v18 = 2112;
            CFErrorRef v19 = error;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[DSO%llu] TLS certificate evaluation failed -- reason: %@", buf, 0x16u);
          }
          int Code = CFErrorGetCode(error);
        }
        else
        {
          int Code = -6754;
        }
        CFRelease(v7);
        if (v9) {
          CFRelease(v9);
        }
      }
      else
      {
        CFRelease(v6);
        int Code = 0;
        BOOL v10 = 1;
      }
      if (error) {
        CFRelease(error);
      }
    }
    else
    {
      BOOL v10 = 0;
      int Code = -6729;
    }
  }
  else
  {
    BOOL v10 = 0;
    int Code = -6705;
  }
  if (a4) {
    *a4 = Code;
  }
  return v10;
}

nw_connection_t _mdns_dso_client_session_prepare_connection(void *a1, int *a2)
{
  uint64_t v4 = a1[2];
  *(void *)__int16 v18 = _NSConcreteStackBlock;
  *(void *)&v18[8] = 0x40000000;
  *(void *)&v18[16] = ___mdns_dso_session_create_tls_nw_parameters_block_invoke;
  CFErrorRef v19 = &__block_descriptor_tmp_26_6025;
  uint64_t v20 = a1;
  uint64_t v21 = v4;
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v18, _nw_parameters_configure_protocol_default_configuration);
  if (!secure_tcp)
  {
LABEL_20:
    nw_connection_t v12 = 0;
    int v15 = -6729;
    if (!a2) {
      return v12;
    }
    goto LABEL_17;
  }
  uint64_t v6 = secure_tcp;
  nw_parameters_set_no_wake_from_sleep();
  nw_protocol_stack_t v7 = nw_parameters_copy_default_protocol_stack(v6);
  if (!v7)
  {
    nw_release(v6);
    goto LABEL_20;
  }
  CFArrayRef v8 = v7;
  if (_mdns_get_dns_over_bytestream_protocol_definition_s_once != -1) {
    dispatch_once(&_mdns_get_dns_over_bytestream_protocol_definition_s_once, &__block_literal_global_6206);
  }
  if (!_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def)
  {
    options = 0;
    goto LABEL_23;
  }
  options = nw_framer_create_options((nw_protocol_definition_t)_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def);
  if (!options)
  {
LABEL_23:
    nw_connection_t v12 = 0;
    goto LABEL_24;
  }
  BOOL v10 = nw_protocol_stack_copy_transport_protocol(v8);
  nw_tcp_options_set_maximum_segment_size(v10, 0x1C2u);
  nw_protocol_stack_prepend_application_protocol(v8, options);
  uint64_t v11 = a1[22];
  if (!v11)
  {
    nw_connection_t v12 = 0;
    int v15 = -6718;
    goto LABEL_14;
  }
  nw_connection_t v12 = nw_connection_create(*(nw_endpoint_t *)(v11 + 24), v6);
  if (!v12)
  {
LABEL_24:
    int v15 = -6729;
    goto LABEL_14;
  }
  int maximum_segment_size = nw_tcp_options_get_maximum_segment_size();
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
  }
  uint64_t v14 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = a1[5];
    *(_DWORD *)__int16 v18 = 134218240;
    *(void *)&v18[4] = v17;
    *(_WORD *)&v18[12] = 1024;
    *(_DWORD *)&v18[14] = maximum_segment_size;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[DSO%llu] mss is %d", v18, 0x12u);
  }
  nw_release(v10);
  int v15 = 0;
LABEL_14:
  nw_release(v6);
  nw_release(v8);
  if (options) {
    nw_release(options);
  }
  if (a2) {
LABEL_17:
  }
    *a2 = v15;
  return v12;
}

void ___mdns_dso_session_create_tls_nw_parameters_block_invoke(uint64_t a1, nw_protocol_options_t options)
{
  uint64_t v3 = nw_tls_copy_sec_protocol_options(options);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  if (v5)
  {
    uint64_t v6 = *(NSObject **)(v4 + 48);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    _OWORD v7[2] = ___mdns_dso_session_create_tls_nw_parameters_block_invoke_2;
    v7[3] = &__block_descriptor_tmp_24_6028;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v4;
    if (_mdns_dso_session_queue_s_once != -1) {
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
    }
    uint64_t v6 = _mdns_dso_session_queue_s_queue;
    uint64_t v5 = v7;
  }
  sec_protocol_options_set_verify_block(v3, v5, v6);
  if (v3) {
    sec_release(v3);
  }
}

uint64_t ___mdns_dso_session_create_tls_nw_parameters_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 72);
  if (v5) {
    uint64_t v6 = v5(*(void *)(a1 + 40), a2, a3, 0);
  }
  else {
    uint64_t v6 = 0;
  }
  nw_protocol_stack_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);

  return v7(a4, v6);
}

uint64_t _mdns_dso_client_session_check_configuration(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) <= 0 && !*(void *)(a1 + 136)
    || !*(void *)(a1 + 200)
    || !*(_WORD *)(a1 + 212))
  {
    return 4294960578;
  }
  if (*(unsigned char *)(a1 + 214) == 1) {
    return 0;
  }
  return 4294960587;
}

uint64_t _mdns_dso_client_session_activate(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) < 1)
  {
    if (!*(void *)(a1 + 136)) {
      return 4294960591;
    }
    uint64_t srv = nw_endpoint_create_srv();
    if (!srv) {
      return 4294960567;
    }
    BOOL v10 = (void *)srv;
    nw_parameters_t v11 = nw_parameters_create();
    if (!v11)
    {
      nw_release(v10);
      return 4294960567;
    }
    nw_connection_t v12 = v11;
    if (*(_DWORD *)(a1 + 208))
    {
      uint64_t v13 = nw_interface_create_with_index();
      if (!v13) {
        goto LABEL_30;
      }
      nw_parameters_require_interface(v12, v13);
    }
    else
    {
      uint64_t v13 = 0;
    }
    int v15 = nw_resolver_create_with_endpoint();
    if (v15)
    {
      unint64_t v16 = v15;
      nw_retain(v15);
      uint64_t v22 = _NSConcreteStackBlock;
      uint64_t v23 = 0x40000000;
      int v24 = ___mdns_dso_client_session_start_srv_resolution_block_invoke;
      uint64_t v25 = &__block_descriptor_tmp_20_6032;
      __int16 v26 = v16;
      nw_resolver_set_cancel_handler();
      if (_mdns_dso_session_queue_s_once != -1) {
        dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
      }
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 0x40000000;
      *(void *)&buf[16] = ___mdns_dso_client_session_start_srv_resolution_block_invoke_2;
      __int16 v34 = &__block_descriptor_tmp_22_6033;
      uint64_t v35 = a1;
      nw_resolver_set_update_handler();
      if (_mdns_dso_session_log_s_once != -1) {
        dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
      }
      uint64_t v17 = _mdns_dso_session_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 136);
        int v20 = *(_DWORD *)(a1 + 208);
        *(_DWORD *)uint64_t v27 = 134218498;
        uint64_t v28 = v18;
        __int16 v29 = 2112;
        uint64_t v30 = v19;
        __int16 v31 = 1024;
        int v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Start -> Start SRV resolution -- service name: %@, interface index: %u", v27, 0x1Cu);
      }
      uint64_t v5 = 0;
      *(void *)(a1 + 144) = v16;
      *(unsigned char *)(a1 + 214) = 2;
LABEL_31:
      nw_release(v10);
      nw_release(v12);
      if (v13)
      {
        uint64_t v14 = v13;
LABEL_33:
        nw_release(v14);
        return v5;
      }
      return v5;
    }
LABEL_30:
    uint64_t v5 = 4294960567;
    goto LABEL_31;
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) >= 1)
  {
    uint64_t v2 = nw_array_create();
    if (v2)
    {
      uint64_t v3 = v2;
      CFArrayRef v4 = *(const __CFArray **)(a1 + 152);
      uint64_t v22 = _NSConcreteStackBlock;
      uint64_t v23 = 0x40000000;
      int v24 = ___mdns_dso_client_session_start_connection_with_server_addresses_block_invoke;
      uint64_t v25 = &__block_descriptor_tmp_10_6030;
      __int16 v26 = v3;
      if (mdns_cfarray_enumerate(v4, (uint64_t)&v22) && nw_array_get_count())
      {
        *(unsigned char *)(a1 + 214) = 3;
        uint64_t v5 = _mdns_dso_client_session_add_nw_endpoints(a1);
        if (!v5)
        {
          if (_mdns_dso_session_log_s_once != -1) {
            dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
          }
          uint64_t v6 = _mdns_dso_session_log_s_log;
          uint64_t v5 = 0;
          if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = *(void *)(a1 + 40);
            uint64_t v8 = *(void *)(a1 + 152);
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v8;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Start -> Start connection directly -- addresses: %@", buf, 0x16u);
            uint64_t v5 = 0;
          }
        }
      }
      else
      {
        uint64_t v5 = 4294960539;
      }
      uint64_t v14 = v3;
      goto LABEL_33;
    }
    return 4294960567;
  }
  return 4294960578;
}

nw_endpoint_t ___mdns_dso_client_session_start_connection_with_server_addresses_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)&v6[24] = 0;
  *(void *)&v6[16] = 0;
  uint64_t v2 = (_OWORD *)(a2 + 24);
  int v3 = *(unsigned __int8 *)(a2 + 25);
  if (v3 == 30)
  {
    *(_OWORD *)uint64_t v6 = *v2;
    *(_OWORD *)&v6[12] = *(_OWORD *)(a2 + 36);
  }
  else
  {
    nw_endpoint_t result = 0;
    if (v3 != 2) {
      return result;
    }
    *(_OWORD *)uint64_t v6 = *v2;
  }
  if (!*(_WORD *)&v6[2]) {
    *(_WORD *)&v6[2] = 21763;
  }
  nw_endpoint_t result = nw_endpoint_create_address((const sockaddr *)v6);
  if (result)
  {
    uint64_t v5 = result;
    nw_array_append();
    nw_release(v5);
    return (nw_endpoint_t)1;
  }
  return result;
}

uint64_t _mdns_dso_client_session_add_nw_endpoints(uint64_t a1)
{
  uint64_t v11 = 0;
  nw_connection_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = 0;
  uint64_t v2 = _os_object_alloc();
  if (v2)
  {
    int v3 = (void *)v2;
    CFArrayRef v4 = &_mdns_dso_server_endpoint_manager_kind;
    *(void *)(v2 + 16) = &_mdns_dso_server_endpoint_manager_kind;
    do
    {
      uint64_t v5 = (void (*)(void *))v4[2];
      if (v5) {
        v5(v3);
      }
      CFArrayRef v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
    v3[3] = Mutable;
    if (Mutable) {
      int v7 = 0;
    }
    else {
      int v7 = -6729;
    }
    if (!Mutable) {
      int v3 = 0;
    }
    int v14 = v7;
    uint64_t v8 = *((unsigned int *)v12 + 6);
    if (v8)
    {
      if (Mutable)
      {
        os_release(v3);
        uint64_t v8 = *((unsigned int *)v12 + 6);
      }
      goto LABEL_19;
    }
  }
  else
  {
    int v14 = -6728;
    uint64_t v8 = *((unsigned int *)v12 + 6);
    if (v8) {
      goto LABEL_19;
    }
    int v3 = 0;
  }
  block[5] = _NSConcreteStackBlock;
  void block[6] = 0x40000000;
  block[7] = ___mdns_dso_client_session_add_nw_endpoints_block_invoke;
  block[8] = &unk_10014A4F0;
  block[9] = &v11;
  block[10] = v3;
  nw_array_apply();
  *(void *)(a1 + 168) = v3;
  *(unsigned char *)(a1 + 214) = 3;
  os_retain((void *)a1);
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = ___mdns_dso_client_session_add_nw_endpoints_block_invoke_2;
  block[3] = &__block_descriptor_tmp_13_6038;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
  uint64_t v8 = 0;
  *((_DWORD *)v12 + 6) = 0;
LABEL_19:
  _Block_object_dispose(&v11, 8);
  return v8;
}

void ___mdns_dso_client_session_start_srv_resolution_block_invoke(uint64_t a1)
{
}

void ___mdns_dso_client_session_start_srv_resolution_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 2)
  {
    if (!a3)
    {
      uint64_t v8 = 4294960569;
LABEL_16:
      _mdns_dso_session_handle_failure(*(void *)(a1 + 32), v8, 1, 0);
      return;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 214) == 2)
    {
      uint64_t srv_weighted_variant = nw_resolver_create_srv_weighted_variant();
      if (srv_weighted_variant)
      {
        int v7 = (void *)srv_weighted_variant;
        uint64_t v8 = _mdns_dso_client_session_add_nw_endpoints(v5);
        if (_mdns_dso_session_log_s_once != -1) {
          dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
        }
        CFDataRef v9 = _mdns_dso_session_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(v5 + 40);
          int v12 = 134218242;
          uint64_t v13 = v10;
          __int16 v14 = 2112;
          uint64_t v15 = a3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DSO%llu] Start SRV resolution -> SRV resolution finished -- endpoints: %@", (uint8_t *)&v12, 0x16u);
        }
        nw_release(v7);
      }
      else
      {
        uint64_t v8 = 4294960567;
      }
    }
    else
    {
      uint64_t v8 = 4294960587;
    }
    nw_resolver_cancel();
    uint64_t v11 = *(void **)(v5 + 144);
    if (v11)
    {
      nw_release(v11);
      *(void *)(v5 + 144) = 0;
    }
    if (v8) {
      goto LABEL_16;
    }
  }
}

BOOL ___mdns_dso_client_session_add_nw_endpoints_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = _os_object_alloc();
  if (v6)
  {
    int v7 = (void *)v6;
    uint64_t v8 = &_mdns_dso_server_endpoint_kind;
    *(void *)(v6 + 16) = &_mdns_dso_server_endpoint_kind;
    do
    {
      CFDataRef v9 = (void (*)(void *))v8[2];
      if (v9) {
        v9(v7);
      }
      uint64_t v8 = (_UNKNOWN **)*v8;
    }
    while (v8);
    v7[3] = nw_retain(a3);
    CFArrayAppendValue(*(CFMutableArrayRef *)(v5 + 24), v7);
    os_release(v7);
    int v10 = 0;
  }
  else
  {
    int v10 = -6728;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void ___mdns_dso_client_session_add_nw_endpoints_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[214] == 3)
  {
    _mdns_dso_client_session_connect_or_delay_reconnecting((uint64_t)v2);
    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }

  os_release(v2);
}

void _mdns_dso_client_session_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 136);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 136) = 0;
  }
  if (*(void *)(a1 + 144))
  {
    nw_resolver_cancel();
    int v3 = *(void **)(a1 + 144);
    if (v3)
    {
      nw_release(v3);
      *(void *)(a1 + 144) = 0;
    }
  }
  CFArrayRef v4 = *(const void **)(a1 + 152);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 152) = 0;
  }
  uint64_t v5 = *(const void **)(a1 + 160);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 160) = 0;
  }
  uint64_t v6 = *(void **)(a1 + 168);
  if (v6)
  {
    os_release(v6);
    *(void *)(a1 + 168) = 0;
  }
  int v7 = *(void **)(a1 + 176);
  if (v7)
  {
    os_release(v7);
    *(void *)(a1 + 176) = 0;
  }
  uint64_t v8 = *(NSObject **)(a1 + 184);
  if (v8)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 184));
    dispatch_release(v8);
    *(void *)(a1 + 184) = 0;
  }
  CFDataRef v9 = *(NSObject **)(a1 + 192);
  if (v9)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 192));
    dispatch_release(v9);
    *(void *)(a1 + 192) = 0;
  }
  int v10 = *(const void **)(a1 + 200);
  if (v10)
  {
    _Block_release(v10);
    *(void *)(a1 + 200) = 0;
  }
}

int32x2_t _mdns_dso_client_session_init(int32x2_t *a1)
{
  int32x2_t result = vdup_n_s32(0x3A98u);
  a1[16] = result;
  a1[26].i8[6] = 1;
  return result;
}

void __mdns_dso_session_add_activity_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 104))())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    ++*(void *)(v2 + 104);
    _mdns_dso_session_stop_inactivity_timer(v2);
    int v3 = *(void **)(a1 + 32);
    os_release(v3);
  }
}

void __mdns_dso_session_remove_activity_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 104))())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 104);
    if (v3)
    {
      *(void *)(v2 + 104) = v3 - 1;
      if ((*(unsigned int (**)(uint64_t))(*(void *)(v2 + 16) + 104))(v2))
      {
        if (!*(void *)(v2 + 104)) {
          _mdns_dso_session_schedule_inactivity_timer_ex(*(void **)(a1 + 32), 0);
        }
      }
    }
    CFArrayRef v4 = *(void **)(a1 + 32);
    os_release(v4);
  }
}

void mdns_dso_session_send(void *a1, NSObject *a2)
{
  if ((*(unsigned int (**)(void))(a1[2] + 104))())
  {
    os_retain(a1);
    dispatch_retain(a2);
    if (_mdns_dso_session_queue_s_once != -1) {
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
    }
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = __mdns_dso_session_send_block_invoke;
    v4[3] = &__block_descriptor_tmp_5_6048;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, v4);
  }
}

void __mdns_dso_session_send_block_invoke(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 104))();
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    _mdns_dso_session_send_data_immediately((uint64_t)v3, *(dispatch_data_t *)(a1 + 40), 1, 0);
    uint64_t v3 = *(void **)(a1 + 32);
    CFArrayRef v4 = *(uint64_t (**)(void))(v3[2] + 144);
    if (v4)
    {
      uint64_t v5 = v4();
      uint64_t v3 = *(void **)(a1 + 32);
      if (v5)
      {
        _mdns_dso_session_handle_failure((uint64_t)v3, v5, 1, 1);
        uint64_t v3 = *(void **)(a1 + 32);
      }
    }
  }
  os_release(v3);
  uint64_t v6 = *(NSObject **)(a1 + 40);
  if (v6)
  {
    dispatch_release(v6);
  }
}

void mdns_dso_session_invalidate(void *a1)
{
  os_retain(a1);
  if (_mdns_dso_session_queue_s_once != -1) {
    dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __mdns_dso_session_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_7_6050;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
}

void __mdns_dso_session_invalidate_block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 184))())
  {
    _mdns_dso_session_close_internal(*(void *)(a1 + 32), 0, 0, 1, 0, 0);
    int v2 = *(void **)(a1 + 32);
    uint64_t v3 = (const void *)v2[7];
    if (v3)
    {
      _Block_release(v3);
      v2[7] = 0;
    }
    CFArrayRef v4 = (const void *)v2[8];
    if (v4)
    {
      _Block_release(v4);
      v2[8] = 0;
    }
    (*(void (**)(void *))(v2[2] + 192))(v2);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t monotonic_time_ns = mdns_get_monotonic_time_ns();
  unint64_t v7 = (monotonic_time_ns - v5) / 0xF4240uLL;
  if (__ROR8__(0x790FB65668C26139 * v7, 6) <= 0x10C6F7A0B5EDuLL) {
    int64_t v8 = (monotonic_time_ns - v5) / 0xF4240uLL;
  }
  else {
    int64_t v8 = v7 + 1;
  }
  if (_mdns_dso_session_log_s_once != -1) {
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
  }
  CFDataRef v9 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
    int v11 = 134218496;
    uint64_t v12 = v10;
    __int16 v13 = 2048;
    unint64_t v14 = (unint64_t)((unsigned __int128)(v8 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 7;
    __int16 v15 = 2048;
    unint64_t v16 = v8 - 1000 * v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DSO%llu] DSO session invalidated -- duration: %{mdns:time_duration}lld %lldms", (uint8_t *)&v11, 0x20u);
  }
  os_release(*(void **)(a1 + 32));
}

uint64_t dnssec_objs_sort(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    uint64_t v5 = (void *)result;
    do
    {
      uint64_t v6 = v4++;
      uint64_t v7 = *(void *)(v3 + 8 * v4);
      int32x2_t result = ref_count_obj_compare(v7, *(void *)(v3 + 8 * v6), 0);
      uint64_t v8 = v4;
      if (result == -1)
      {
        CFDataRef v9 = v5;
        uint64_t v8 = v4;
        do
        {
          v9[1] = *v9;
          if (!--v8) {
            break;
          }
          uint64_t v10 = *--v9;
          int32x2_t result = ref_count_obj_compare(v7, v10, 0);
        }
        while (result == -1);
      }
      *(void *)(v3 + 8 * v8) = v7;
      ++v5;
    }
    while (v6 != v2);
  }
  return result;
}

void __is_apple_internal_build_block_invoke(id a1)
{
  is_apple_internal_build_is_internal = os_variant_has_internal_diagnostics();
}

id _system_util_log()
{
  if (_system_util_log_s_once != -1) {
    dispatch_once(&_system_util_log_s_once, &__block_literal_global_9_6084);
  }
  v0 = (void *)_system_util_log_s_log;

  return v0;
}

void ___system_util_log_block_invoke(id a1)
{
  _system_util_log_s_log = (uint64_t)os_log_create("com.apple.mDNSResponder", "system_util");

  _objc_release_x1();
}

uint64_t __util_device_media_access_unicast_addr_enumerate_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v10 = a4;
  if (a2 == 2) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 16;
  }
  uint64_t v7 = +[NSMutableData dataWithLength:v6 + 4];
  [v7 appendBytes:a3 length:v6];
  [v7 appendBytes:&v10 length:4];
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    uint64_t v8 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v8;
}

id util_is_car_play(uint64_t a1)
{
  uint64_t v3 = +[NSString stringWithUTF8String:a1];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    [v4 activate];
    uint64_t v5 = [v4 interfaceName];
    unsigned int v6 = [v5 isEqualToString:v3];

    if (v6)
    {
      uint64_t v7 = [v4 currentKnownNetworkProfile];
      id v8 = [v7 isCarPlay];
    }
    else
    {
      id v8 = 0;
    }
    [v4 invalidate];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id util_is_managed_network(uint64_t a1)
{
  uint64_t v3 = +[NSString stringWithUTF8String:a1];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    [v4 activate];
    uint64_t v5 = [v4 interfaceName];
    unsigned int v6 = [v5 isEqualToString:v3];

    if (v6)
    {
      uint64_t v7 = [v4 currentKnownNetworkProfile];
      id v8 = [v7 isBlueAtlasNetwork];
    }
    else
    {
      id v8 = 0;
    }
    [v4 invalidate];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void util_managed_network_change_handler(void *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __util_managed_network_change_handler_block_invoke;
  block[3] = &unk_10014A870;
  id v3 = a1;
  id v1 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __util_managed_network_change_handler_block_invoke(uint64_t a1)
{
  if (util_managed_network_change_handler_s_interface)
  {
    [(id)util_managed_network_change_handler_s_interface stopMonitoringEventType:30];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)util_managed_network_change_handler_s_interface;
    util_managed_network_change_handler_s_interface = v3;

    [(id)util_managed_network_change_handler_s_interface activate];
  }
  id v5 = objc_retainBlock(*(id *)(a1 + 32));
  unsigned int v6 = (void *)util_managed_network_change_handler_s_handler;
  util_managed_network_change_handler_s_handler = (uint64_t)v5;

  if (util_managed_network_change_handler_s_handler)
  {
    id location = 0;
    objc_initWeak(&location, (id)util_managed_network_change_handler_s_interface);
    uint64_t v7 = (void *)util_managed_network_change_handler_s_interface;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __util_managed_network_change_handler_block_invoke_2;
    v15[3] = &unk_10014A848;
    objc_copyWeak(&v16, &location);
    [v7 setEventHandler:v15];
    id v14 = 0;
    unsigned __int8 v8 = [(id)util_managed_network_change_handler_s_interface startMonitoringEventType:30 error:&v14];
    id v9 = v14;
    int v10 = _system_util_log();
    int v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Registered for known network privacy risk changes", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to register for known network changes with error %@", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(id)util_managed_network_change_handler_s_interface setEventHandler:0];
    [(id)util_managed_network_change_handler_s_interface invalidate];
    uint64_t v12 = (void *)util_managed_network_change_handler_s_interface;
    util_managed_network_change_handler_s_interface = 0;

    __int16 v13 = _system_util_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Un-registering for known network privacy risk changes", buf, 2u);
    }
  }
}

void sub_1000ED974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __util_managed_network_change_handler_block_invoke_2(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __util_managed_network_change_handler_block_invoke_3;
  block[3] = &unk_10014A820;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void __util_managed_network_change_handler_block_invoke_3(uint64_t a1)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    unsigned int v6 = [v5 currentKnownNetworkProfile];
    unsigned int v7 = [v6 isBlueAtlasNetwork];

    unsigned __int8 v8 = [v5 currentKnownNetworkProfile];
    id WeakRetained = [v8 shortSSID];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if (util_managed_network_change_handler_s_handler)
  {
    char v9 = (id)util_managed_network_change_handler_s_last_blue_atlas_id == WeakRetained ? 0 : v7;
    if ((v9 & 1) != 0 || (v7 & 1) == 0 && (util_managed_network_change_handler_s_last_blue_atlas_id || !WeakRetained))
    {
      int v10 = _system_util_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12[0] = 67109120;
        v12[1] = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Updating privacy risk status %d", (uint8_t *)v12, 8u);
      }

      (*(void (**)(void))(util_managed_network_change_handler_s_handler + 16))();
    }
  }
  if (v7) {
    uint64_t v11 = (uint64_t)WeakRetained;
  }
  else {
    uint64_t v11 = 0;
  }
  util_managed_network_change_handler_s_last_blue_atlas_id = v11;
}

void _dnssec_obj_validation_manager_finalize(void *a1)
{
  id v2 = (void *)a1[2];
  if (v2)
  {
    ref_count_obj_release(v2);
    a1[2] = 0;
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    ref_count_obj_release(v3);
    a1[4] = 0;
  }
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    ref_count_obj_release(v4);
    a1[5] = 0;
  }
  _dnssec_obj_validation_manager_reset_validation_key_requestor((uint64_t)a1);
  _dnssec_obj_validation_manager_reset_insecure_validation((uint64_t)a1);
  unint64_t v5 = a1[16];
  if (v5)
  {
    for (unint64_t i = 0; i < v5; ++i)
    {
      unsigned int v7 = *(void **)(a1[15] + 8 * i);
      if (v7)
      {
        ref_count_obj_release(v7);
        unint64_t v5 = a1[16];
        *(void *)(a1[15] + 8 * i) = 0;
      }
    }
  }
  unsigned __int8 v8 = (void *)a1[15];
  if (v8)
  {
    free(v8);
    a1[15] = 0;
  }
}

void _dnssec_obj_validation_manager_reset_validation_key_requestor(uint64_t a1)
{
  *(unsigned char *)(a1 + 72) = 0;
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v3 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v3 = mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    int v6 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 1024;
    unsigned int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Canceling the existing validation key requestor", (uint8_t *)v10, 0xEu);
  }
LABEL_11:
  mDNS_StopQuery((unsigned int *)&mDNSStorage, *(void *)(a1 + 56));
  unsigned __int8 v8 = *(void **)(a1 + 56);
  if (v8)
  {
    free(v8);
    *(void *)(a1 + 56) = 0;
  }
LABEL_13:
  char v9 = *(void **)(a1 + 64);
  if (v9)
  {
    ref_count_obj_release(v9);
    *(void *)(a1 + 64) = 0;
  }
}

void _dnssec_obj_validation_manager_reset_insecure_validation(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v3 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v3 = mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    int v6 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    int v8 = *(_DWORD *)(a1 + 112);
    BOOL v9 = *(void *)(a1 + 88) != 0;
    v11[0] = 67109888;
    v11[1] = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    __int16 v14 = 1026;
    int v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Canceling the existing insecure validation - state: %{public, mdns:dnssec_inval_state}d, validated: %{mdns:yesno}d", (uint8_t *)v11, 0x1Au);
  }
LABEL_11:
  mDNS_StopQuery((unsigned int *)&mDNSStorage, *(void *)(a1 + 80));
  int v10 = *(void **)(a1 + 80);
  if (v10)
  {
    free(v10);
    *(void *)(a1 + 80) = 0;
  }
LABEL_13:
  *(_DWORD *)(a1 + 112) = 0;
  *(void *)(a1 + 88) = 0;
  _dnssec_obj_validation_manager_stop_negative_ds_query(a1);
}

void _dnssec_obj_validation_manager_stop_negative_ds_query(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (!v2) {
    goto LABEL_18;
  }
  uint64_t v3 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    int v5 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    uint64_t v7 = *(void *)(a1 + 104);
    if (v7)
    {
      int v8 = *(_DWORD *)(v7 + 24);
      uint64_t v7 = *(void *)(v7 + 16);
    }
    else
    {
      int v8 = 0;
    }
    goto LABEL_15;
  }
  uint64_t v3 = mDNSLogCategory_DNSSEC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
  {
    int v5 = *(unsigned __int16 *)(a1 + 24);
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    uint64_t v7 = *(void *)(a1 + 104);
    if (v7)
    {
      int v8 = *(_DWORD *)(v7 + 24);
      uint64_t v7 = *(void *)(v7 + 16);
    }
    else
    {
      int v8 = 0;
    }
LABEL_15:
    v12[0] = 67110147;
    v12[1] = v5;
    __int16 v13 = 1024;
    unsigned int v14 = v6;
    __int16 v15 = 2160;
    uint64_t v16 = 1752392040;
    __int16 v17 = 1040;
    int v18 = v8;
    __int16 v19 = 2101;
    uint64_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[Q%u->SubQ%u] Stop DS denial look up question - DS denial lookup name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", (uint8_t *)v12, 0x28u);
  }
LABEL_16:
  mDNS_StopQuery((unsigned int *)&mDNSStorage, *(void *)(a1 + 96));
  int v10 = *(void **)(a1 + 96);
  if (v10)
  {
    free(v10);
    *(void *)(a1 + 96) = 0;
  }
LABEL_18:
  __int16 v11 = *(void **)(a1 + 104);
  if (v11)
  {
    ref_count_obj_release(v11);
    *(void *)(a1 + 104) = 0;
  }
}

uint64_t _dnssec_obj_validation_manager_compare()
{
  return 2;
}

BOOL dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    uint64_t v2 = a2;
    if (a2) {
      goto LABEL_5;
    }
    return 0;
  }
  uint64_t v2 = a1;
  if (a2) {
    return 0;
  }
LABEL_5:
  int v3 = *(_DWORD *)(v2 + 40);
  if (v3 != 4 && v3 != 2) {
    return 0;
  }
  if (!*(void *)(v2 + 32))
  {
    uint64_t v19 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }
    else
    {
      uint64_t v19 = mDNSLogCategory_DNSSEC_redacted;
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }
    int v21 = 136447234;
    uint64_t v22 = (uint64_t)"dnssec_obj_rrset_get_rr_count(me) > 0";
    __int16 v23 = 2082;
    *(void *)int v24 = "";
    *(_WORD *)&v24[8] = 2082;
    *(void *)&v24[10] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
    *(_WORD *)&v24[18] = 1024;
    int v25 = 361;
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    uint64_t v16 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    __int16 v17 = v19;
    uint32_t v18 = 48;
    goto LABEL_39;
  }
  int v5 = *(unsigned __int8 **)(v2 + 24);
  if (**(unsigned __int8 **)v5 != 240)
  {
    char v8 = 0;
    do
    {
      while (1)
      {
        int v9 = *(unsigned __int16 *)(*(void *)v5 + 4);
        if (v9 != 43)
        {
          if (v9 == 46) {
            return 0;
          }
          if (v9 != 48) {
            break;
          }
        }
        int v5 = (unsigned __int8 *)*((void *)v5 + 1);
        char v8 = 1;
        if (!v5) {
          goto LABEL_23;
        }
      }
      int v5 = (unsigned __int8 *)*((void *)v5 + 1);
    }
    while (v5);
    if ((v8 & 1) == 0) {
      return 1;
    }
LABEL_23:
    uint64_t v10 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      uint64_t v12 = *(void *)(v2 + 16);
      if (v12)
      {
        int v13 = *(_DWORD *)(v12 + 24);
        uint64_t v14 = *(void *)(v12 + 16);
      }
      else
      {
        int v13 = 0;
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v10 = mDNSLogCategory_DNSSEC_redacted;
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      uint64_t v15 = *(void *)(v2 + 16);
      if (v15)
      {
        int v13 = *(_DWORD *)(v15 + 24);
        uint64_t v14 = *(void *)(v15 + 16);
      }
      else
      {
        int v13 = 0;
        uint64_t v14 = 0;
      }
    }
    int v21 = 141558787;
    uint64_t v22 = 1752392040;
    __int16 v23 = 1040;
    *(_DWORD *)int v24 = v13;
    *(_WORD *)&v24[4] = 2101;
    *(void *)&v24[6] = v14;
    *(_WORD *)&v24[14] = 1024;
    *(_DWORD *)&v24[16] = dnssec_obj_rrset_get_rr_type(v2);
    uint64_t v16 = "Received positive DNSKEY or DS RRSet without RRSIG, malformed - name: %{sensitive, mask.hash, mdnsresponder:do"
          "main_name}.*P, type: %{mdns:rrtype}d.";
    __int16 v17 = v10;
    uint32_t v18 = 34;
LABEL_39:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v21, v18);
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)v5 + 56);
  return !v6 || *(_DWORD *)(v6 + 32) || *(unsigned char *)(v6 + 40) || *(void *)(v6 + 48) == 0;
}

_DWORD *_dnssec_obj_validation_manager_start_sub_query(uint64_t a1, __int16 a2, __int16 a3, int a4, uint64_t a5, uint64_t a6, int *a7)
{
  BOOL result = malloc_type_calloc(1uLL, 0x2B8uLL, 0xF1748037uLL);
  if (result)
  {
    uint64_t v14 = (uint64_t)result;
    result[53] = -1;
    *((void *)result + 17) = *(void *)(*(void *)(a5 + 24) + 136);
    result[81] = a4;
    __memcpy_chk();
    *(_WORD *)(v14 + 344) = a2;
    *(_WORD *)(v14 + 342) = a3;
    *(unsigned char *)(v14 + 655) = (a4 & 0x200000) != 0;
    *(unsigned char *)(v14 + 635) = (a4 & 0x1000) != 0;
    *(_DWORD *)(v14 + 244) = getpid();
    *(void *)(v14 + 152) = a6;
    *(void *)(v14 + 176) = a5;
    int started = mDNS_StartQuery((unsigned int *)&mDNSStorage, v14);
    if (a7)
    {
      if (started) {
        int v16 = -6736;
      }
      else {
        int v16 = 0;
      }
      *a7 = v16;
    }
    if (started)
    {
      free((void *)v14);
      return 0;
    }
    return (_DWORD *)v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void dnssec_obj_validation_manager_start_insecure_validation(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = 0xFFFFE5C200000000;
  _dnssec_obj_validation_manager_reset_validation_key_requestor(a1);
  _dnssec_obj_validation_manager_reset_insecure_validation(a1);
  *(_DWORD *)(a1 + 140) = 0;
  *(unsigned char *)(a1 + 144) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  int v26 = 0;
  if (*(void *)(a1 + 80)) {
    return;
  }
  if (*(_DWORD *)(a1 + 112) || !v4 || ((int v5 = *(_DWORD *)(v4 + 40), v5 != 2) ? (v6 = v5 == 4) : (v6 = 1), !v6))
  {
    __int16 v17 = 0;
    int v18 = -6709;
LABEL_27:
    int v26 = v18;
    goto LABEL_28;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  char v8 = *(unsigned __int8 **)(v7 + 16);
  unsigned int v9 = *v8;
  if (!*v8) {
    goto LABEL_39;
  }
  uint64_t v10 = *(void *)(a2 + 24);
  if (!v10) {
    goto LABEL_39;
  }
  unint64_t v11 = -1;
  uint64_t v12 = *(void *)(v7 + 16);
  do
  {
    unint64_t v13 = v11;
    uint64_t v14 = v12 + v9;
    unsigned int v15 = *(unsigned __int8 *)(v14 + 1);
    uint64_t v12 = v14 + 1;
    unsigned int v9 = v15;
    ++v11;
  }
  while (v15);
  if (*(_WORD *)(v10 + 342) == 43 && v13 + 2 <= 1)
  {
LABEL_39:
    __int16 v17 = 0;
    int v18 = -6736;
    goto LABEL_27;
  }
  __int16 v17 = dnssec_obj_domain_name_copy_parent_domain(v8, v11, &v26);
  int v18 = v26;
  if (v26) {
    goto LABEL_28;
  }
  int started = _dnssec_obj_validation_manager_start_negative_ds_query(a1, (uint64_t)v17, a2);
  int v26 = started;
  if (started)
  {
    int v18 = started;
LABEL_28:
    _dnssec_obj_validation_manager_fail_insecure_validation(a1, v18);
    if (!v17) {
      return;
    }
    goto LABEL_37;
  }
  uint64_t v20 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v20 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
  }
  int v21 = *(unsigned __int16 *)(a1 + 24);
  unsigned int v22 = bswap32(*(unsigned __int16 *)(*(void *)(a1 + 96) + 340)) >> 16;
  uint64_t v24 = *(void *)(v7 + 16);
  uint64_t v23 = *(void *)(v7 + 24);
  *(_DWORD *)buf = 67110147;
  int v28 = v21;
  __int16 v29 = 1024;
  unsigned int v30 = v22;
  __int16 v31 = 2160;
  uint64_t v32 = 1752392040;
  __int16 v33 = 1040;
  int v34 = v23;
  __int16 v35 = 2101;
  uint64_t v36 = v24;
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Start insecure validation - unsigned domain: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x28u);
LABEL_32:
  *(_DWORD *)(a1 + 112) = 1;
  if (v17) {
    ++*(_DWORD *)v17;
  }
  int v25 = *(void **)(a1 + 104);
  if (v25) {
    ref_count_obj_release(v25);
  }
  *(void *)(a1 + 104) = v17;
  int v26 = 0;
  if (v17) {
LABEL_37:
  }
    ref_count_obj_release(v17);
}

uint64_t _dnssec_obj_validation_manager_start_negative_ds_query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v18 = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      return -6709;
    }
  }
  if (*(void *)(a1 + 96)) {
    return -6709;
  }
  __int16 rr_class = dnssec_obj_rrset_get_rr_class(v6);
  int started = _dnssec_obj_validation_manager_start_sub_query(a2, rr_class, 43, 4096, a3, (uint64_t)_query_record_with_insecure_validation_reply, (int *)&v18);
  *(void *)(a1 + 96) = started;
  if (!v18)
  {
    unsigned int v9 = started;
    uint64_t v10 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
      {
        int v12 = *(unsigned __int16 *)(a1 + 24);
        unsigned int v13 = bswap32(*((unsigned __int16 *)v9 + 170)) >> 16;
        if (a2)
        {
          int v14 = *(_DWORD *)(a2 + 24);
          uint64_t v15 = *(void *)(a2 + 16);
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = 0;
        }
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v10 = mDNSLogCategory_DNSSEC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
      {
        int v12 = *(unsigned __int16 *)(a1 + 24);
        unsigned int v13 = bswap32(*((unsigned __int16 *)v9 + 170)) >> 16;
        if (a2)
        {
          int v14 = *(_DWORD *)(a2 + 24);
          uint64_t v15 = *(void *)(a2 + 16);
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = 0;
        }
LABEL_18:
        *(_DWORD *)buf = 67110147;
        int v20 = v12;
        __int16 v21 = 1024;
        unsigned int v22 = v13;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040;
        __int16 v25 = 1040;
        int v26 = v14;
        __int16 v27 = 2101;
        uint64_t v28 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Searching for DS denial - q_name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x28u);
      }
    }
  }
  return v18;
}

void _dnssec_obj_validation_manager_fail_insecure_validation(uint64_t a1, int a2)
{
  uint64_t v4 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 104);
      if (v6)
      {
        int v7 = *(_DWORD *)(v6 + 24);
        uint64_t v6 = *(void *)(v6 + 16);
      }
      else
      {
        int v7 = 0;
      }
      uint64_t v9 = *(void *)(a1 + 96);
      if (v9) {
        LODWORD(v9) = bswap32(*(unsigned __int16 *)(v9 + 340)) >> 16;
      }
      int v10 = *(unsigned __int16 *)(a1 + 24);
      int v11 = *(_DWORD *)(a1 + 112);
      uint64_t v12 = *(void *)(a1 + 80);
      if (v12) {
        LODWORD(v12) = bswap32(*(unsigned __int16 *)(v12 + 340)) >> 16;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v4 = mDNSLogCategory_DNSSEC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 104);
      if (v6)
      {
        int v7 = *(_DWORD *)(v6 + 24);
        uint64_t v6 = *(void *)(v6 + 16);
      }
      else
      {
        int v7 = 0;
      }
      uint64_t v9 = *(void *)(a1 + 96);
      if (v9) {
        LODWORD(v9) = bswap32(*(unsigned __int16 *)(v9 + 340)) >> 16;
      }
      int v10 = *(unsigned __int16 *)(a1 + 24);
      int v11 = *(_DWORD *)(a1 + 112);
      uint64_t v12 = *(void *)(a1 + 80);
      if (v12) {
        LODWORD(v12) = bswap32(*(unsigned __int16 *)(v12 + 340)) >> 16;
      }
LABEL_23:
      v13[0] = 67110659;
      v13[1] = v10;
      __int16 v14 = 1026;
      int v15 = v11;
      __int16 v16 = 2160;
      uint64_t v17 = 1752392040;
      __int16 v18 = 1040;
      int v19 = v7;
      __int16 v20 = 2101;
      uint64_t v21 = v6;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 1024;
      int v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[Q%u] Insecure validation failed - state: %{public, mdns:dnssec_inval_state}d, DS denial lookup name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, DS denial lookup q: Q%u, secure DS denial q: Q%u", (uint8_t *)v13, 0x34u);
    }
  }
  _dnssec_obj_validation_manager_reset_insecure_validation(a1);
  *(_DWORD *)(a1 + 112) = 3;
  *(_DWORD *)(a1 + 48) = 3;
  *(_DWORD *)(a1 + 52) = a2;
}

uint64_t _update_validated_cache_with_rrset(uint64_t a1, int a2)
{
  unsigned int v126 = 0;
  int v119 = *(_DWORD *)(a1 + 44);
  size_t v125 = 0;
  v123 = dnssec_obj_rrset_copy_rrs((void *)a1, &v125, &v126);
  if (v126) {
    goto LABEL_199;
  }
  size_t v2 = v125;
  if (!v125) {
    goto LABEL_223;
  }
  uint64_t cache_record = resource_record_get_cache_record(*(void *)(*v123 + 56));
  if (!cache_record)
  {
    v103 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_DNSSEC != mDNSLogCategory_State)
    {
      v103 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        goto LABEL_223;
      }
      goto LABEL_222;
    }
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
    {
LABEL_222:
      *(_DWORD *)buf = 136447234;
      *(void *)v128 = "cr != NULL";
      *(_WORD *)&v128[8] = 2082;
      *(void *)&v128[10] = "";
      *(_WORD *)&v128[18] = 2082;
      *(void *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_mdns_core.c";
      *(_WORD *)&v128[28] = 1024;
      *(_DWORD *)&v128[30] = 314;
      *(_WORD *)&v128[34] = 2048;
      *(void *)&v128[36] = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
    }
LABEL_223:
    unsigned int v126 = -6736;
    goto LABEL_199;
  }
  uint64_t v4 = *(void *)(cache_record + 96);
  if (!v4) {
    goto LABEL_223;
  }
  v121 = CacheGroupForName((uint64_t)mDNSStorage, *(_DWORD *)(v4 + 200), (unsigned char *)(v4 + 376));
  if (!v121) {
    goto LABEL_223;
  }
  uint64_t v5 = *v123;
  uint64_t v6 = resource_record_get_cache_record(*(void *)(*v123 + 56));
  if (v6)
  {
    if ((*(_DWORD *)(v6 + 80) + 1000 * a2) <= 1) {
      int v7 = 1;
    }
    else {
      int v7 = *(_DWORD *)(v6 + 80) + 1000 * a2;
    }
    uint64_t v8 = v121[2];
    if (v8)
    {
      while (1)
      {
        uint64_t v9 = *(void *)(v5 + 48);
        if (v9) {
          uint64_t v9 = *(void *)(v9 + 24);
        }
        uint64_t v10 = *(void *)(v8 + 56);
        if (v10) {
          uint64_t v10 = *(void *)(v10 + 24);
        }
        if (v9 == v10)
        {
          uint64_t v11 = *(void *)(v8 + 64);
          if (v11)
          {
            if (*(_DWORD *)(v11 + 32) == 1 && identical_dnssec_validated_same_name_resource_record(v5, v8 + 8)) {
              break;
            }
          }
        }
        uint64_t v8 = *(void *)v8;
        if (!v8) {
          goto LABEL_27;
        }
      }
      if (*(unsigned char *)(v8 + 109)) {
        unsigned int v12 = dword_100164DF8 + 939524096;
      }
      else {
        unsigned int v12 = *(_DWORD *)(v8 + 80) + 1000 * *(_DWORD *)(v8 + 16);
      }
      if (v12 <= 1) {
        unsigned int v12 = 1;
      }
      if ((int)(v7 - v12) <= 999)
      {
        unsigned int v126 = 0;
        goto LABEL_199;
      }
    }
    goto LABEL_27;
  }
  v105 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
  }
  else
  {
    v105 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
  }
  *(_DWORD *)buf = 136447234;
  *(void *)v128 = "rr_cr != NULL";
  *(_WORD *)&v128[8] = 2082;
  *(void *)&v128[10] = "";
  *(_WORD *)&v128[18] = 2082;
  *(void *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj"
                         "_validation_manager.c";
  *(_WORD *)&v128[28] = 1024;
  *(_DWORD *)&v128[30] = 1759;
  *(_WORD *)&v128[34] = 2048;
  *(void *)&v128[36] = 0;
  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
LABEL_27:
  unsigned int v13 = CacheGroupForName((uint64_t)mDNSStorage, *(_DWORD *)(v4 + 200), (unsigned char *)(v4 + 376));
  if (v13 && (uint64_t v19 = v13[2]) != 0)
  {
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = *(void *)(v19 + 64);
      if (v21
        && *(_DWORD *)(v21 + 32) == 1
        && SameNameRecordAnswersQuestion((unsigned __int8 *)(v19 + 8), 0, v4, v14, v15, v16, v17, v18))
      {
        *(_DWORD *)(v19 + 80) = dword_100164DF8 + ~(1000 * *(_DWORD *)(v19 + 16));
        *(unsigned char *)(v19 + 108) = 4;
        SetNextCacheCheckTimeForRecord((uint64_t)mDNSStorage, v19);
        ++v20;
      }
      uint64_t v19 = *(void *)v19;
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }
  bzero(v144, 0x800uLL);
  if (v2 > 0x100)
  {
    unsigned int v126 = -6751;
    v106 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        goto LABEL_199;
      }
    }
    else
    {
      v106 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        goto LABEL_199;
      }
    }
    unsigned int v110 = bswap32(*(unsigned __int16 *)(v4 + 340));
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v128 = HIWORD(v110);
    *(_WORD *)&v128[4] = 2048;
    *(void *)&v128[6] = v2;
    *(_WORD *)&v128[14] = 2048;
    *(void *)&v128[16] = 256;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_FAULT, "[Q%u] RRSet size too large, unable to process - rr_count: %zu, size limit: %zu", buf, 0x1Cu);
    goto LABEL_199;
  }
  uint64_t v117 = 0;
  uint64_t v118 = v20;
  v114 = (unsigned char *)(v4 + 376);
  uint64_t v115 = v4;
  uint64_t v22 = 0;
  uint64_t v124 = 0;
  uint64_t v23 = 0;
  if (v2 <= 1) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v2;
  }
  uint64_t v120 = v24;
  while (1)
  {
    uint64_t v25 = v23;
    size_t v26 = v2;
    __int16 v27 = (unsigned __int8 *)v123[v22];
    uint64_t v28 = resource_record_get_cache_record(*((void *)v27 + 7));
    if (!v28) {
      break;
    }
    uint64_t v29 = v121[2];
    if (v29)
    {
      uint64_t v30 = v28;
      while (1)
      {
        uint64_t v31 = *((void *)v27 + 6);
        if (v31) {
          uint64_t v31 = *(void *)(v31 + 24);
        }
        uint64_t v32 = *(void *)(v29 + 56);
        if (v32) {
          uint64_t v32 = *(void *)(v32 + 24);
        }
        if (v31 == v32)
        {
          uint64_t v33 = *(void *)(v29 + 64);
          if (v33)
          {
            if (*(_DWORD *)(v33 + 32) == 1
              && identical_dnssec_validated_same_name_resource_record((uint64_t)v27, v29 + 8))
            {
              break;
            }
          }
        }
        uint64_t v29 = *(void *)v29;
        if (!v29) {
          goto LABEL_66;
        }
      }
      int v116 = *(_DWORD *)(v29 + 16);
      *(_DWORD *)(v29 + 80) = *(_DWORD *)(v30 + 80);
      *(_DWORD *)(v29 + 16) = a2;
      *(unsigned char *)(v29 + 108) = 0;
      SetNextCacheCheckTimeForRecord((uint64_t)mDNSStorage, v29);
      uint64_t v34 = mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v71 = *(void *)(v30 + 40);
          if (v71)
          {
            v72 = *(unsigned char **)(v30 + 40);
            if (v71 == -256)
            {
LABEL_132:
              while (v72)
              {
                uint64_t v73 = *v72;
                if (v73 > 0x3F) {
                  break;
                }
                if (!*v72)
                {
                  unsigned __int16 v75 = (_WORD)v72 - v71 + 1;
                  goto LABEL_145;
                }
                v72 += v73 + 1;
                if (v71 != -256) {
                  goto LABEL_131;
                }
              }
            }
            else
            {
LABEL_131:
              if ((unint64_t)v72 < v71 + 256) {
                goto LABEL_132;
              }
            }
            unsigned __int16 v75 = 257;
LABEL_145:
            int v112 = v75;
          }
          else
          {
            int v112 = 0;
          }
          int v80 = *(unsigned __int16 *)(v30 + 12);
          int actual_ttl = resource_record_get_actual_ttl((uint64_t)mDNSStorage, v29 + 8);
          *(_DWORD *)buf = 68158978;
          *(_DWORD *)v128 = v112;
          *(_WORD *)&v128[4] = 2098;
          *(void *)&v128[6] = v71;
          *(_WORD *)&v128[14] = 1024;
          *(_DWORD *)&v128[16] = v80;
          *(_WORD *)&v128[20] = 1024;
          *(_DWORD *)&v128[22] = v116;
          *(_WORD *)&v128[26] = 1024;
          *(_DWORD *)&v128[28] = a2;
          *(_WORD *)&v128[32] = 1024;
          *(_DWORD *)&v128[34] = actual_ttl;
          v79 = v34;
LABEL_147:
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Rescuing DNSSEC validated record - name: %{public, mdnsresponder:domain_name}.*P, type: %{mdns:rrtype}d, old original ttl: %u, new original ttl: %u, new actual ttl: %u", buf, 0x2Au);
        }
      }
      else
      {
        uint64_t v35 = mDNSLogCategory_DNSSEC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v36 = *(void *)(v30 + 40);
          v111 = v35;
          if (v36)
          {
            uint64_t v37 = *(unsigned char **)(v30 + 40);
            if (v36 == -256)
            {
LABEL_61:
              while (v37)
              {
                uint64_t v38 = *v37;
                if (v38 > 0x3F) {
                  break;
                }
                if (!*v37)
                {
                  unsigned __int16 v74 = (_WORD)v37 - v36 + 1;
                  goto LABEL_142;
                }
                v37 += v38 + 1;
                if (v36 != -256) {
                  goto LABEL_60;
                }
              }
            }
            else
            {
LABEL_60:
              if ((unint64_t)v37 < v36 + 256) {
                goto LABEL_61;
              }
            }
            unsigned __int16 v74 = 257;
LABEL_142:
            int v76 = v74;
          }
          else
          {
            int v76 = 0;
          }
          int v77 = *(unsigned __int16 *)(v30 + 12);
          int v78 = resource_record_get_actual_ttl((uint64_t)mDNSStorage, v29 + 8);
          *(_DWORD *)buf = 68158978;
          *(_DWORD *)v128 = v76;
          *(_WORD *)&v128[4] = 2098;
          *(void *)&v128[6] = v36;
          *(_WORD *)&v128[14] = 1024;
          *(_DWORD *)&v128[16] = v77;
          *(_WORD *)&v128[20] = 1024;
          *(_DWORD *)&v128[22] = v116;
          *(_WORD *)&v128[26] = 1024;
          *(_DWORD *)&v128[28] = a2;
          *(_WORD *)&v128[32] = 1024;
          *(_DWORD *)&v128[34] = v78;
          v79 = v111;
          goto LABEL_147;
        }
      }
      if (*(unsigned char *)(v29 + 109))
      {
        int v82 = dword_100164DF8;
        int v83 = dword_100164DF8 + 939524096;
      }
      else
      {
        int v83 = *(_DWORD *)(v29 + 80) + 1000 * *(_DWORD *)(v29 + 16);
        int v82 = dword_100164DF8;
      }
      size_t v2 = v26;
      uint64_t v23 = v25;
      uint64_t v65 = v120;
      if (v83 - v82 > 0)
      {
LABEL_152:
        ++v117;
        --v118;
        goto LABEL_107;
      }
      v84 = mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
          goto LABEL_152;
        }
      }
      else
      {
        v84 = mDNSLogCategory_DNSSEC_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
          goto LABEL_152;
        }
      }
      *(_DWORD *)buf = 136447234;
      *(void *)v128 = "RRExpireTime(cr) - mDNSStorage.timenow > 0";
      *(_WORD *)&v128[8] = 2082;
      *(void *)&v128[10] = "";
      *(_WORD *)&v128[18] = 2082;
      *(void *)&v128[20] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec"
                             "_obj_validation_manager.c";
      *(_WORD *)&v128[28] = 1024;
      *(_DWORD *)&v128[30] = 1826;
      *(_WORD *)&v128[34] = 2048;
      *(void *)&v128[36] = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
      goto LABEL_152;
    }
LABEL_66:
    if (*((void *)v27 + 7)) {
      int v39 = -6705;
    }
    else {
      int v39 = -6709;
    }
    if (*((void *)v27 + 7)) {
      BOOL v40 = (v119 - 3) >= 0xFFFFFFFE;
    }
    else {
      BOOL v40 = 0;
    }
    if (!v40)
    {
      uint64_t v29 = 0;
LABEL_155:
      size_t v2 = v26;
      goto LABEL_102;
    }
    unsigned int v41 = *((_DWORD *)v27 + 4);
    int v42 = CacheGroupForName((uint64_t)mDNSStorage, v41, *((unsigned char **)v27 + 4));
    char v44 = *(long long **)(*((void *)v27 + 7) + 16);
    if (v44)
    {
      uint64_t v45 = (uint64_t)v42;
      if (dword_100164DF8 <= 1) {
        uint64_t v46 = 1;
      }
      else {
        uint64_t v46 = dword_100164DF8;
      }
      v47 = *(void **)((char *)&dword_100164DF8 + &loc_100009410);
      int v48 = v46;
      if (v47)
      {
        os_release(v47);
        int v48 = dword_100164DF8;
        if (dword_100164DF8 <= 1) {
          int v48 = 1;
        }
      }
      xmmword_10016E290 = 0u;
      unk_10016E2A0 = 0u;
      xmmword_10016E270 = 0u;
      unk_10016E280 = 0u;
      xmmword_10016E250 = 0u;
      unk_10016E260 = 0u;
      xmmword_10016E230 = 0u;
      *(_OWORD *)&qword_10016E240 = 0u;
      xmmword_10016E210 = 0u;
      unk_10016E220 = 0u;
      unk_10016E1F0 = 0u;
      *(_OWORD *)&qword_10016E200 = 0u;
      xmmword_10016E1D0 = 0u;
      xmmword_10016E1E0 = 0u;
      long long v49 = v44[1];
      xmmword_10016E1D0 = *v44;
      long long v50 = v44[2];
      long long v51 = v44[3];
      long long v52 = v44[5];
      xmmword_10016E210 = v44[4];
      unk_10016E220 = v52;
      long long v53 = v44[8];
      long long v54 = v44[9];
      long long v55 = v44[7];
      xmmword_10016E230 = v44[6];
      *(_OWORD *)&qword_10016E240 = v55;
      unk_10016E1F0 = v50;
      *(_OWORD *)&qword_10016E200 = v51;
      xmmword_10016E1E0 = v49;
      xmmword_10016E250 = v53;
      unk_10016E260 = v54;
      long long v56 = v44[10];
      long long v57 = v44[11];
      long long v58 = v44[13];
      xmmword_10016E290 = v44[12];
      unk_10016E2A0 = v58;
      xmmword_10016E270 = v56;
      unk_10016E280 = v57;
      *(void *)&xmmword_10016E1D0 = 0;
      *((void *)&xmmword_10016E210 + 1) = 0;
      dword_10016E224 = v48;
      *(void *)&xmmword_10016E230 = 0;
      BYTE12(xmmword_10016E230) = 0;
      qword_10016E240 = 0;
      unk_10016E248 = 0;
      LODWORD(xmmword_10016E1E0) = a2;
      if (*((void *)&v51 + 1)) {
        os_retain(*((void **)&v51 + 1));
      }
      if (v119 == 1)
      {
        uint64_t v59 = 4;
LABEL_87:
        if (*v27 == 240)
        {
          uint64_t v60 = *((void *)v27 + 7);
          if (v60)
          {
            if (!*(_DWORD *)(v60 + 32) && !*(unsigned char *)(v60 + 40))
            {
              uint64_t v61 = *(void *)(v60 + 48);
              if (v61)
              {
                if (*(unsigned char *)(v61 + 107)) {
                  uint64_t v59 = v59 | 0x10;
                }
                else {
                  uint64_t v59 = v59;
                }
              }
            }
          }
        }
        uint64_t NewCacheEntry = CreateNewCacheEntryEx((uint64_t)mDNSStorage, v41 % 0x1F3, v45, v46, 1, (uint64_t)v44 + 132, v59, v43);
        uint64_t v29 = NewCacheEntry;
        if (NewCacheEntry)
        {
          int v63 = *(_DWORD *)(NewCacheEntry + 84);
          v64 = (char *)mDNSStorage + 4 * (v41 % 0x1F3);
          size_t v2 = v26;
          if (*((_DWORD *)v64 + 1066) - v63 >= 1) {
            *((_DWORD *)v64 + 1066) = v63;
          }
          uint64_t v23 = v25;
          int v39 = 0;
          if (dword_100164E10 - v63 >= 1) {
            dword_100164E10 = v63;
          }
          goto LABEL_103;
        }
        int v39 = -6728;
        goto LABEL_155;
      }
      if (v119 == 2)
      {
        uint64_t v59 = 8;
        goto LABEL_87;
      }
      uint64_t v29 = 0;
      int v39 = -6736;
    }
    else
    {
      uint64_t v29 = 0;
      int v39 = -6709;
    }
    size_t v2 = v26;
LABEL_102:
    uint64_t v23 = v25;
LABEL_103:
    uint64_t v65 = v120;
    unsigned int v126 = v39;
    if (qword_10016E208)
    {
      os_release((void *)qword_10016E208);
      int v39 = v126;
    }
    xmmword_10016E290 = 0u;
    unk_10016E2A0 = 0u;
    xmmword_10016E270 = 0u;
    unk_10016E280 = 0u;
    xmmword_10016E250 = 0u;
    unk_10016E260 = 0u;
    xmmword_10016E230 = 0u;
    *(_OWORD *)&qword_10016E240 = 0u;
    xmmword_10016E210 = 0u;
    unk_10016E220 = 0u;
    unk_10016E1F0 = 0u;
    *(_OWORD *)&qword_10016E200 = 0u;
    xmmword_10016E1D0 = 0u;
    xmmword_10016E1E0 = 0u;
    if (v39) {
      goto LABEL_197;
    }
    ++v124;
LABEL_107:
    uint64_t v66 = *(void *)(v29 + 64);
    if (!v66) {
      goto LABEL_197;
    }
    *(void *)(v66 + 24) = v2;
    v144[v22] = v29 + 8;
    if (*(unsigned char *)(v29 + 109)) {
      unsigned int v67 = dword_100164DF8 + 939524096;
    }
    else {
      unsigned int v67 = *(_DWORD *)(v29 + 80) + 1000 * *(_DWORD *)(v29 + 16);
    }
    if (v67 <= 1) {
      uint64_t v68 = 1;
    }
    else {
      uint64_t v68 = v67;
    }
    if (v23)
    {
      int v69 = v23 - v68;
      if (v23 != v68)
      {
        v70 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
            goto LABEL_122;
          }
        }
        else
        {
          v70 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
          {
LABEL_122:
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v128 = v69 / 1000;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_FAULT, "DNSSEC validated records in the same RRSet have different expiration time - difference in second: %d", buf, 8u);
          }
        }
        if (v69 <= 0) {
          uint64_t v23 = v23;
        }
        else {
          uint64_t v23 = v68;
        }
      }
    }
    else
    {
      uint64_t v23 = v68;
    }
    if (++v22 == v65)
    {
      if ((int)v23 - dword_100164DF8 >= 1)
      {
        unsigned int v85 = ((int)v23 - dword_100164DF8) / 0x3E8u;
        if (v118 && !v124)
        {
          v86 = v144;
          do
          {
            uint64_t v87 = *v86++;
            *(unsigned char *)(*(void *)(v87 + 56) + 36) = 1;
            --v65;
          }
          while (v65);
        }
        v88 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          uint64_t v90 = v117;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
          {
            unsigned int v91 = bswap32(*(unsigned __int16 *)(v115 + 340)) >> 16;
            v92 = v114;
            if (v115 == -632)
            {
LABEL_175:
              while (v92)
              {
                uint64_t v93 = *v92;
                if (v93 > 0x3F) {
                  break;
                }
                if (!*v92)
                {
                  int v97 = (unsigned __int16)((_WORD)v92 - (_WORD)v114 + 1);
                  goto LABEL_192;
                }
                v92 += v93 + 1;
                if (v115 != -632) {
                  goto LABEL_174;
                }
              }
            }
            else
            {
LABEL_174:
              if ((unint64_t)v92 < v115 + 632) {
                goto LABEL_175;
              }
            }
            int v97 = 257;
LABEL_192:
            int v98 = *(unsigned __int16 *)(v115 + 342);
            int v99 = *(unsigned __int16 *)(*v123 + 4);
            BOOL v100 = *(unsigned __int8 *)*v123 != 240;
            *(_DWORD *)buf = 67112451;
            *(_DWORD *)v128 = v91;
            *(_WORD *)&v128[4] = 2160;
            *(void *)&v128[6] = 1752392040;
            *(_WORD *)&v128[14] = 1040;
            *(_DWORD *)&v128[16] = v97;
            *(_WORD *)&v128[20] = 2101;
            *(void *)&v128[22] = v114;
            *(_WORD *)&v128[30] = 1024;
            *(_DWORD *)&v128[32] = v98;
            *(_WORD *)&v128[36] = 1024;
            *(_DWORD *)&v128[38] = v99;
            *(_WORD *)&v128[42] = 1024;
            int v129 = a2;
            __int16 v130 = 1024;
            unsigned int v131 = v85;
            __int16 v132 = 1024;
            BOOL v133 = v100;
            __int16 v134 = 1026;
            int v135 = v119;
            __int16 v136 = 2048;
            uint64_t v137 = v117;
            __int16 v138 = 2048;
            uint64_t v139 = v124;
            __int16 v140 = 2048;
            size_t v141 = v2;
            __int16 v142 = 2048;
            uint64_t v143 = v118;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "[Q%u] Update cache for DNSSEC question - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rr_type: %{mdns:rrtype}d, new original ttl: %u, actual ttl: %u, %{mdns:pos/neg}d, DNSSEC result: %{public, mdns:dnssec_result}d, rescued: %zu, added: %zu, total: %zu, purged: %zu.", buf, 0x6Eu);
          }
        }
        else
        {
          v88 = mDNSLogCategory_DNSSEC_redacted;
          BOOL v94 = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO);
          uint64_t v90 = v117;
          if (v94)
          {
            unsigned int v91 = bswap32(*(unsigned __int16 *)(v115 + 340)) >> 16;
            v95 = v114;
            if (v115 == -632)
            {
LABEL_183:
              while (v95)
              {
                uint64_t v96 = *v95;
                if (v96 > 0x3F) {
                  break;
                }
                if (!*v95)
                {
                  int v97 = (unsigned __int16)((_WORD)v95 - (_WORD)v114 + 1);
                  goto LABEL_192;
                }
                v95 += v96 + 1;
                if (v115 != -632) {
                  goto LABEL_182;
                }
              }
            }
            else
            {
LABEL_182:
              if ((unint64_t)v95 < v115 + 632) {
                goto LABEL_183;
              }
            }
            int v97 = 257;
            goto LABEL_192;
          }
        }
        if (v90)
        {
          int v101 = dword_100164DF8;
          if (dword_100164DF8 <= 1) {
            int v101 = 1;
          }
          dword_100164E58 = v101;
        }
LABEL_197:
        if (!v23) {
          goto LABEL_199;
        }
      }
LABEL_198:
      *(unsigned char *)(a1 + 60) = 1;
      *(_DWORD *)(a1 + 52) = v23;
      goto LABEL_199;
    }
  }
  unsigned int v126 = -6736;
  LODWORD(v23) = v25;
  if (v25) {
    goto LABEL_198;
  }
LABEL_199:
  free(v123);
  return v126;
}

void dnssec_obj_validation_manager_remove_validated_cache(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v31 = 0;
    if (*(unsigned char *)(v2 + 60))
    {
      size_t v30 = 0;
      int v3 = dnssec_obj_rrset_copy_rrs((void *)v2, &v30, &v31);
      uint64_t v4 = v31;
      if (v31)
      {
        __int16 v27 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
            return;
          }
        }
        else
        {
          __int16 v27 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
            return;
          }
        }
        *(_DWORD *)buf = 136447234;
        uint64_t v33 = (uint64_t)"err == 0";
        __int16 v34 = 2082;
        *(void *)uint64_t v35 = "";
        *(_WORD *)&v35[8] = 2082;
        *(void *)&v35[10] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnsse"
                              "c_obj_validation_manager.c";
        *(_WORD *)&v35[18] = 1024;
        int v36 = 1267;
        __int16 v37 = 2048;
        uint64_t v38 = v4;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
        return;
      }
      uint64_t v5 = v3;
      size_t v6 = v30;
      if (v30)
      {
        uint64_t v7 = 0;
        while (1)
        {
          uint64_t v8 = v5[v7];
          mDNS_Lock_((unsigned int *)&mDNSStorage, (uint64_t)"_purge_validated_record_from_cache", 1933);
          uint64_t v9 = *(void *)(v8 + 56);
          if (!v9 || *(_DWORD *)(v9 + 32)) {
            goto LABEL_44;
          }
          uint64_t v10 = CacheGroupForName((uint64_t)&mDNSStorage, *(_DWORD *)(v8 + 16), *(unsigned char **)(v8 + 32)) + 2;
          do
          {
            uint64_t v10 = (uint64_t *)*v10;
            if (!v10) {
              goto LABEL_44;
            }
          }
          while (!identical_dnssec_validated_same_name_resource_record(v8, (uint64_t)(v10 + 1)));
          int expiration_time = resource_record_get_expiration_time(*(void *)(v8 + 56));
          if (expiration_time)
          {
            if (expiration_time - dword_100164DF8 >= 4000)
            {
              unsigned int v12 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                {
                  uint64_t v13 = *(void *)(v8 + 32);
                  if (v13)
                  {
                    uint64_t v14 = *(unsigned char **)(v8 + 32);
                    if (v13 == -256)
                    {
LABEL_28:
                      while (v14)
                      {
                        uint64_t v16 = *v14;
                        if (v16 > 0x3F) {
                          break;
                        }
                        if (!*v14)
                        {
                          LOWORD(v14) = (_WORD)v14 - v13 + 1;
                          goto LABEL_40;
                        }
                        v14 += v16 + 1;
                        if (v13 != -256) {
                          goto LABEL_27;
                        }
                      }
                    }
                    else
                    {
LABEL_27:
                      if ((unint64_t)v14 < v13 + 256) {
                        goto LABEL_28;
                      }
                    }
                    LOWORD(v14) = 257;
LABEL_40:
                    LODWORD(v14) = (unsigned __int16)v14;
                  }
                  else
                  {
                    LODWORD(v14) = 0;
                  }
LABEL_41:
                  int v17 = *(unsigned __int16 *)(v8 + 4);
                  *(_DWORD *)buf = 141558787;
                  uint64_t v33 = 1752392040;
                  __int16 v34 = 1040;
                  *(_DWORD *)uint64_t v35 = v14;
                  *(_WORD *)&v35[4] = 2101;
                  *(void *)&v35[6] = v13;
                  *(_WORD *)&v35[14] = 1024;
                  *(_DWORD *)&v35[16] = v17;
                  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Make validated RR expire soon - name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, rr_type: %{mdns:rrtype}d", buf, 0x22u);
                }
              }
              else
              {
                unsigned int v12 = mDNSLogCategory_DNSSEC_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                {
                  uint64_t v13 = *(void *)(v8 + 32);
                  if (v13)
                  {
                    uint64_t v14 = *(unsigned char **)(v8 + 32);
                    if (v13 == -256)
                    {
LABEL_19:
                      while (v14)
                      {
                        uint64_t v15 = *v14;
                        if (v15 > 0x3F) {
                          break;
                        }
                        if (!*v14)
                        {
                          LOWORD(v14) = (_WORD)v14 - v13 + 1;
                          goto LABEL_38;
                        }
                        v14 += v15 + 1;
                        if (v13 != -256) {
                          goto LABEL_18;
                        }
                      }
                    }
                    else
                    {
LABEL_18:
                      if ((unint64_t)v14 < v13 + 256) {
                        goto LABEL_19;
                      }
                    }
                    LOWORD(v14) = 257;
LABEL_38:
                    LODWORD(v14) = (unsigned __int16)v14;
                  }
                  else
                  {
                    LODWORD(v14) = 0;
                  }
                  goto LABEL_41;
                }
              }
              *((_DWORD *)v10 + 20) = dword_100164DF8 + 1000 * (3 - *((_DWORD *)v10 + 4));
            }
            *((unsigned char *)v10 + 108) = 4;
            goto LABEL_44;
          }
          uint64_t v18 = mDNSLogCategory_DNSSEC;
          if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_DNSSEC != mDNSLogCategory_State) {
            break;
          }
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
          {
            uint64_t v20 = *(void *)(v8 + 32);
            if (v20)
            {
              uint64_t v21 = *(unsigned char **)(v8 + 32);
              if (v20 == -256)
              {
LABEL_55:
                while (v21)
                {
                  uint64_t v22 = *v21;
                  if (v22 > 0x3F) {
                    break;
                  }
                  if (!*v21)
                  {
                    LOWORD(v21) = (_WORD)v21 - v20 + 1;
                    goto LABEL_74;
                  }
                  v21 += v22 + 1;
                  if (v20 != -256) {
                    goto LABEL_54;
                  }
                }
              }
              else
              {
LABEL_54:
                if ((unint64_t)v21 < v20 + 256) {
                  goto LABEL_55;
                }
              }
              LOWORD(v21) = 257;
LABEL_74:
              LODWORD(v21) = (unsigned __int16)v21;
            }
            else
            {
              LODWORD(v21) = 0;
            }
LABEL_77:
            int v25 = *(unsigned __int16 *)(v8 + 4);
            *(_DWORD *)buf = 141558787;
            uint64_t v33 = 1752392040;
            __int16 v34 = 1040;
            *(_DWORD *)uint64_t v35 = v21;
            *(_WORD *)&v35[4] = 2101;
            *(void *)&v35[6] = v20;
            *(_WORD *)&v35[14] = 1024;
            *(_DWORD *)&v35[16] = v25;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Invalid expiration time for the current DNSSEC validated record - name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, rr_type: %{mdns:rrtype}d", buf, 0x22u);
          }
LABEL_44:
          mDNS_Unlock_((uint64_t)&mDNSStorage, (uint64_t)"_purge_validated_record_from_cache", 1962);
          if (++v7 == v6) {
            goto LABEL_78;
          }
        }
        uint64_t v18 = mDNSLogCategory_DNSSEC_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
          goto LABEL_44;
        }
        uint64_t v20 = *(void *)(v8 + 32);
        if (v20)
        {
          uint64_t v21 = *(unsigned char **)(v8 + 32);
          if (v20 == -256)
          {
LABEL_64:
            while (v21)
            {
              uint64_t v24 = *v21;
              if (v24 > 0x3F) {
                break;
              }
              if (!*v21)
              {
                LOWORD(v21) = (_WORD)v21 - v20 + 1;
                goto LABEL_76;
              }
              v21 += v24 + 1;
              if (v20 != -256) {
                goto LABEL_63;
              }
            }
          }
          else
          {
LABEL_63:
            if ((unint64_t)v21 < v20 + 256) {
              goto LABEL_64;
            }
          }
          LOWORD(v21) = 257;
LABEL_76:
          LODWORD(v21) = (unsigned __int16)v21;
        }
        else
        {
          LODWORD(v21) = 0;
        }
        goto LABEL_77;
      }
LABEL_78:
      uint64_t v26 = *(void *)(a1 + 32);
      *(unsigned char *)(v26 + 60) = 0;
      *(_DWORD *)(v26 + 52) = 0;
      free(v5);
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
      size_t v6 = (unsigned char *)(a1 + 2);
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
          uint64_t v11 = (_WORD *)((char *)v5 + v10);
          for (i = v4 - v10; i >= 4 && v11 != 0; uint64_t v11 = (unsigned __int16 *)((char *)v15 + v14))
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
              BOOL result = (_WORD *)(*(uint64_t (**)(uint64_t, unsigned __int16 *, unint64_t))(a4 + 16))(a4, v11 + 2, v14);
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

void *__dnssd_svcb_copy_odoh_config_block_invoke(uint64_t a1, const void *a2, size_t size)
{
  if (!a2 || !size) {
    return 0;
  }
  BOOL result = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
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

void ___mdns_get_dns_over_bytestream_protocol_definition_block_invoke(id a1)
{
  _mdns_get_dns_over_bytestream_protocol_definition_s_framer_def = (uint64_t)nw_framer_create_definition("DNS over bytestream", 0, &__block_literal_global_18);
}

int ___mdns_create_dns_over_bytestream_framer_block_invoke_4(id a1, const nw_framer *a2)
{
  return 1;
}

void ___mdns_create_dns_over_bytestream_framer_block_invoke_3(id a1, const nw_framer *a2, const nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  if (a4 < 0x10000)
  {
    *(_WORD *)output_buffer = bswap32(a4) >> 16;
    nw_framer_write_output((nw_framer_t)a2, output_buffer, 2uLL);
    nw_framer_write_output_no_copy((nw_framer_t)a2, a4);
  }
  else
  {
    nw_framer_mark_failed_with_error((nw_framer_t)a2, 40);
  }
}

unint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_6220(id a1, nw_framer *a2)
{
  do
  {
    *(_WORD *)temp_buffer = 0;
    if (!nw_framer_parse_input((nw_framer_t)a2, 2uLL, 2uLL, temp_buffer, &__block_literal_global_9_6221)) {
      break;
    }
    size_t v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    unint64_t v4 = nw_framer_message_create((nw_framer_t)a2);
    LODWORD(v3) = nw_framer_deliver_input_no_copy((nw_framer_t)a2, v3, v4, 1);
    nw_release(v4);
  }
  while (v3);
  return 2;
}

unint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_2(id a1, char *a2, unint64_t a3, BOOL a4)
{
  return 2 * (a3 > 1);
}

uint64_t GetAddrInfoClientRequestStart(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v59, 0, sizeof(v59));
  long long v58 = 0u;
  uint64_t RecordOpStart = 4294901756;
  long long v57 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  uint64_t v13 = (unsigned __int8 *)*((void *)a2 + 1);
  unsigned __int8 v44 = 0;
  if (!AppendDNSNameString(&v44, v13, a3, a4, a5, a6, a7, a8))
  {
    int v25 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
    }
    else
    {
      int v25 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
    }
    int v26 = *a2;
    uint64_t v27 = *((void *)a2 + 1);
    *(_DWORD *)buf = 67109635;
    *(_DWORD *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[8] = 2160;
    *(void *)&buf[10] = 1752392040;
    *(_WORD *)&buf[18] = 2085;
    *(void *)&buf[20] = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[R%u] ERROR: bad hostname '%{sensitive, mask.hash}s'", buf, 0x1Cu);
LABEL_40:
    GetAddrInfoClientRequestStop(a1, v14, v15, v16, v17, v18, v19, v20);
    return RecordOpStart;
  }
  unsigned int v21 = a2[6];
  if (v21 > 3) {
    goto LABEL_40;
  }
  if (v21)
  {
    int v22 = a2[5];
  }
  else
  {
    unsigned int v21 = 3;
    int v22 = a2[5] | 0x8000;
  }
  *(_DWORD *)(a1 + 8) = v21;
  if ((v22 & 0x10000000) != 0)
  {
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "GetAddrInfoClientRequestStart: kDNSServiceFlagsServiceIndex is SET by the client", v16, v17, v18, v19, v20, v37);
    }
    uint64_t v24 = 0;
    int v23 = a2[4];
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t RecordOpStart = InterfaceIndexToInterfaceID(a2[4], &v38, v15, v16, v17, v18, v19, v20);
    if (RecordOpStart) {
      goto LABEL_40;
    }
    int v23 = -1;
    uint64_t v24 = v38;
  }
  char v28 = 0;
  *(void *)a1 = v24;
  uint64_t v29 = (unsigned char *)*((void *)a2 + 1);
  while (1)
  {
    int v30 = *v29++;
    if (v30 == 46) {
      break;
    }
    if (v30 == 92)
    {
      ++v28;
    }
    else
    {
      if (!*(v29 - 1)) {
        goto LABEL_27;
      }
LABEL_24:
      char v28 = 0;
    }
  }
  if (*v29) {
    goto LABEL_24;
  }
  if ((v28 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  if (AlwaysAppendSearchDomains || v44 && !*(&v44 + v44 + 1))
  {
    char v31 = 1;
    goto LABEL_32;
  }
LABEL_31:
  char v31 = 0;
LABEL_32:
  memset(buf, 0, sizeof(buf));
  long long v40 = 0u;
  long long v41 = 0u;
  memset(v43, 0, sizeof(v43));
  long long v42 = 0u;
  *(_DWORD *)buf = *a2;
  *(void *)&buf[8] = &v44;
  *(_WORD *)&buf[18] = 1;
  *(void *)&unsigned char buf[24] = v24;
  *(void *)&long long v40 = __PAIR64__(v22, v23);
  BYTE8(v40) = v31;
  HIDWORD(v40) = a2[7];
  *(void *)&long long v41 = *((void *)a2 + 4);
  DWORD2(v41) = a2[10];
  uint64_t v32 = *((void *)a2 + 7);
  *(void *)&long long v42 = *((void *)a2 + 6);
  *((void *)&v42 + 1) = v32;
  LODWORD(v43[0]) = a2[16];
  *(_OWORD *)((char *)v43 + 8) = *(_OWORD *)(a2 + 18);
  BYTE12(v41) = *((unsigned char *)a2 + 88);
  WORD4(v43[1]) = *(_WORD *)((char *)a2 + 89);
  int v33 = *(_DWORD *)(a1 + 8);
  if ((v33 & 2) != 0)
  {
    __int16 v34 = malloc_type_calloc(1uLL, 0x320uLL, 0xF1748037uLL);
    if (v34)
    {
      *(void *)(a1 + 24) = v34;
      *(_WORD *)&buf[16] = 28;
      uint64_t RecordOpStart = QueryRecordOpStart((uint64_t)v34, (uint64_t)buf, a3, a4);
      if (!RecordOpStart)
      {
        int v33 = *(_DWORD *)(a1 + 8);
        goto LABEL_36;
      }
      goto LABEL_40;
    }
LABEL_42:
    __break(1u);
  }
LABEL_36:
  if ((v33 & 1) == 0) {
    return 0;
  }
  uint64_t v35 = malloc_type_calloc(1uLL, 0x320uLL, 0xF1748037uLL);
  if (!v35) {
    goto LABEL_42;
  }
  *(void *)(a1 + 16) = v35;
  *(_WORD *)&buf[16] = 1;
  uint64_t RecordOpStart = QueryRecordOpStart((uint64_t)v35, (uint64_t)buf, a3, a4);
  if (RecordOpStart) {
    goto LABEL_40;
  }
  return RecordOpStart;
}

uint64_t InterfaceIndexToInterfaceID(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = mDNSPlatformInterfaceIDfromInterfaceIndex(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  uint64_t v16 = v10;
  if (!a1 || v10)
  {
LABEL_9:
    uint64_t v17 = 0;
    *a2 = v16;
    return v17;
  }
  if (InterfaceIndexToInterfaceID_getLoopbackIndexOnce != -1) {
    dispatch_once(&InterfaceIndexToInterfaceID_getLoopbackIndexOnce, &__block_literal_global_6264);
  }
  if (a1 <= 0xFFFFFFFB && InterfaceIndexToInterfaceID_loopbackIndex != a1)
  {
    uint64_t v16 = a1;
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "Query pending for interface index %d", v11, v12, v13, v14, v15, a1);
    }
    goto LABEL_9;
  }
  uint64_t v17 = 4294901756;
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ERROR: bad interfaceIndex %d", v11, v12, v13, v14, v15, a1);
  }
  return v17;
}

uint64_t QueryRecordOpStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(unsigned char **)(a2 + 8);
  uint64_t v9 = v8;
  if (v8 == (unsigned char *)-256) {
    goto LABEL_5;
  }
LABEL_2:
  unsigned int v10 = 257;
  if (v9 < v8 + 256 && v9)
  {
    while (1)
    {
      uint64_t v11 = *v9;
      if (v11 > 0x3F)
      {
LABEL_10:
        unsigned int v10 = 257;
        goto LABEL_12;
      }
      if (!*v9) {
        break;
      }
      v9 += v11 + 1;
      if (v8 != (unsigned char *)-256) {
        goto LABEL_2;
      }
LABEL_5:
      if (!v9) {
        goto LABEL_10;
      }
    }
    unsigned int v10 = (unsigned __int16)((_WORD)v9 - (_WORD)v8 + 1);
    if ((_WORD)v9 - (_WORD)v8 == 0xFFFF) {
      goto LABEL_129;
    }
  }
LABEL_12:
  size_t v12 = v10;
  uint64_t v13 = malloc_type_malloc(v10, 0xA172743EuLL);
  if (!v13) {
    goto LABEL_129;
  }
  *(void *)(a1 + 696) = v13;
  memcpy(v13, *(const void **)(a2 + 8), v12);
  *(void *)(a1 + 704) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 728) = *(_DWORD *)a2;
  *(void *)(a1 + 712) = a3;
  *(void *)(a1 + 720) = a4;
  *(unsigned char *)(a1 + 759) = *(unsigned char *)(a2 + 61);
  *(_WORD *)(a1 + 764) = *(_WORD *)(a2 + 81);
  int v14 = *(unsigned __int8 *)(a2 + 83);
  *(unsigned char *)(a1 + 766) = v14;
  int v15 = *(unsigned __int8 *)(a2 + 84);
  *(unsigned char *)(a1 + 767) = v15;
  *(_WORD *)(a1 + 762) = *(_WORD *)(a2 + 16);
  if (!v14 || v15)
  {
    uint64_t v16 = *(_OWORD **)(a2 + 64);
    if (v16) {
      *(_OWORD *)(a1 + 768) = *v16;
    }
  }
  uint64_t v17 = *(void **)(a2 + 88);
  if (v17) {
    os_retain(v17);
  }
  uint64_t v18 = *(void **)(a1 + 784);
  if (v18) {
    os_release(v18);
  }
  *(void *)(a1 + 784) = *(void *)(a2 + 88);
  uint64_t v19 = *(void **)(a2 + 96);
  if (v19) {
    os_retain(v19);
  }
  uint64_t v20 = *(void **)(a1 + 792);
  if (v20) {
    os_release(v20);
  }
  uint64_t v21 = *(void *)(a2 + 96);
  *(void *)(a1 + 792) = v21;
  int v22 = *(_DWORD *)(a2 + 36);
  if (EnableAllowExpired) {
    BOOL v23 = v22 < 0;
  }
  else {
    BOOL v23 = 0;
  }
  char v24 = v23;
  *(unsigned char *)(a1 + 646) = v24;
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 653) = *(unsigned char *)(a2 + 60);
  *(void *)(a1 + 120) = *(void *)(a1 + 784);
  *(void *)(a1 + 128) = v21;
  *(void *)(a1 + 136) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 324) = v22;
  int v25 = *(unsigned char **)(a2 + 8);
  int v26 = v25;
  if (v25 == (unsigned char *)-256)
  {
LABEL_33:
    while (v26)
    {
      uint64_t v27 = *v26;
      if (v27 > 0x3F) {
        break;
      }
      if (!*v26)
      {
        unsigned __int16 v28 = (_WORD)v26 - (_WORD)v25 + 1;
        if (v28 > 0x100u) {
          break;
        }
        memcpy((void *)(a1 + 376), v25, v28);
        goto LABEL_41;
      }
      v26 += v27 + 1;
      if (v25 != (unsigned char *)-256) {
        goto LABEL_32;
      }
    }
  }
  else
  {
LABEL_32:
    if (v26 < v25 + 256) {
      goto LABEL_33;
    }
  }
  *(unsigned char *)(a1 + 376) = 0;
LABEL_41:
  *(_DWORD *)(a1 + 342) = *(_DWORD *)(a2 + 16);
  unsigned int v29 = *(_DWORD *)(a2 + 36);
  *(unsigned char *)(a1 + 632) = BYTE1(v29) & 1;
  int16x8_t v30 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v29), (uint32x4_t)xmmword_10010B0A0);
  *(int8x8_t *)v30.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v30), (int8x8_t)0x1000100010001);
  *(_DWORD *)(a1 + 634) = vmovn_s16(v30).u32[0];
  *(unsigned char *)(a1 + 640) = (v29 & 0x80000) != 0;
  *(unsigned char *)(a1 + 655) = _os_feature_enabled_impl() & (v29 >> 21);
  int v31 = *(unsigned __int8 *)(a2 + 40);
  *(unsigned char *)(a1 + 641) = v31;
  BOOL v32 = *(_WORD *)(a2 + 16) == 1 && *(unsigned char *)(a2 + 105) != 0;
  *(unsigned char *)(a1 + 644) = v32;
  *(unsigned char *)(a1 + 647) = *(unsigned char *)(a2 + 80);
  *(void *)a1 = *(void *)(a2 + 72);
  *(_WORD *)(a1 + 650) = *(_WORD *)(a1 + 766);
  if (*(unsigned char *)(a1 + 765))
  {
    *(unsigned char *)(a1 + 643) = 1;
    if (!*(void *)(a1 + 136)) {
      *(unsigned char *)(a1 + 642) = 1;
    }
  }
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a1 + 768);
  *(unsigned char *)(a1 + 357) = 0;
  *(unsigned char *)(a1 + 689) = *(unsigned char *)(a2 + 104);
  *(_DWORD *)(a1 + 244) = *(_DWORD *)(a2 + 44);
  int v33 = *(_OWORD **)(a2 + 48);
  if (v33) {
    *(_OWORD *)(a1 + 656) = *v33;
  }
  *(_DWORD *)(a1 + 248) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 252) = *(_DWORD *)a2;
  *(void *)(a1 + 152) = QueryRecordOpCallback;
  *(void *)(a1 + 160) = QueryRecordOpResetHandler;
  *(void *)(a1 + 168) = QueryRecordOpEventHandler;
  if (v31)
  {
    __int16 v34 = *(unsigned char **)(a1 + 696);
    if (*v34)
    {
      if (!v34[*v34 + 1]) {
        *(void *)(a1 + 136) = -2;
      }
    }
  }
  int v35 = *(unsigned __int16 *)(a1 + 342);
  if (v35 != 1 && v35 != 28)
  {
    if (v35 != 33) {
      goto LABEL_65;
    }
    int v36 = (unsigned char *)(a1 + 376);
    uint64_t v37 = *(unsigned char *)(a1 + 376) ? *(unsigned __int8 *)(a1 + 376) + 1 : 0;
    if (!SameDomainLabelPointer(&v36[v37], "\x04_tcp"))
    {
      uint64_t v38 = *v36 ? *v36 + 1 : 0;
      if (!SameDomainLabelPointer(&v36[v38], "\x04_udp")) {
        goto LABEL_65;
      }
    }
  }
  if (*(unsigned char *)(a1 + 634)) {
    goto LABEL_65;
  }
  uint64_t v57 = a1 + 376;
  unsigned int v58 = *(unsigned __int8 *)(a1 + 376);
  if (*(unsigned char *)(a1 + 376))
  {
    do
    {
      uint64_t v59 = v57;
      uint64_t v60 = v57 + v58;
      unsigned int v61 = *(unsigned __int8 *)(v60 + 1);
      uint64_t v57 = v60 + 1;
      unsigned int v58 = v61;
    }
    while (v61);
  }
  else
  {
    uint64_t v59 = a1 + 376;
  }
  if (!SameDomainLabelPointer(v59, "\x05local"))
  {
LABEL_65:
    int v39 = 0;
    goto LABEL_66;
  }
  v62 = malloc_type_calloc(1uLL, 0x2B8uLL, 0xF1748037uLL);
  if (!v62) {
LABEL_129:
  }
    __break(1u);
  *(void *)(a1 + 744) = v62;
  memcpy(v62, (const void *)a1, 0x2B8uLL);
  int v39 = 1;
LABEL_66:
  uint64_t RecordOpStartQuestion = QueryRecordOpStartQuestion(a1, a1);
  if (!RecordOpStartQuestion)
  {
    if (callExternalHelpers(*(void *)(a1 + 136), (unsigned char *)(a1 + 376), *(unsigned int *)(a1 + 324), v40, v41, v42, v43, v44))
    {
      external_start_browsing_for_service(*(void *)(a1 + 136), (unsigned __int8 *)(a1 + 376), *(unsigned __int16 *)(a1 + 342), *(_DWORD *)(a1 + 324), *(_DWORD *)(a1 + 244));
    }
    if (!v39) {
      return 0;
    }
    uint64_t v47 = *(void *)(a1 + 744);
    if (!v47)
    {
      uint64_t RecordOpStartQuestion = 4294901754;
      goto LABEL_67;
    }
    long long v48 = (unsigned char *)(v47 + 376);
    unsigned int v49 = *(unsigned __int8 *)(v47 + 376);
    if (*(unsigned char *)(v47 + 376))
    {
      int v50 = 0;
      uint64_t v51 = v47 + 376;
      do
      {
        ++v50;
        uint64_t v52 = v51 + v49;
        unsigned int v53 = *(unsigned __int8 *)(v52 + 1);
        uint64_t v51 = v52 + 1;
        unsigned int v49 = v53;
      }
      while (v53);
      if (v50 == 2
        && !SameDomainNameBytes((unsigned char *)(v47 + 376), ActiveDirectoryPrimaryDomain)
        && !DomainNameIsInSearchList((unsigned char *)(v47 + 376), 0))
      {
        *(_WORD *)(a1 + 752) = *(_WORD *)(v47 + 342);
        *(unsigned char *)(a1 + 754) = *(unsigned char *)(v47 + 632);
        *(unsigned char *)(a1 + 755) = *(unsigned char *)(v47 + 635);
        *(unsigned char *)(a1 + 756) = *(unsigned char *)(v47 + 637);
        *(unsigned char *)(a1 + 757) = *(unsigned char *)(v47 + 641);
        for (unint64_t i = "\x05local"; ; i += v56 + 1)
        {
          if ("\x05local" == (char *)-256)
          {
            if (!i) {
              goto LABEL_101;
            }
          }
          else if (i >= "wed" || i == 0)
          {
            goto LABEL_101;
          }
          uint64_t v56 = *(unsigned __int8 *)i;
          if (v56 > 0x3F) {
            goto LABEL_101;
          }
          if (!*i) {
            break;
          }
        }
        unsigned int v63 = i - "\x05local" + 1;
        if ((unsigned __int16)v63 <= 0x100u)
        {
          memcpy((void *)(v47 + 376), "\x05local", (unsigned __int16)v63);
          goto LABEL_102;
        }
LABEL_101:
        *long long v48 = 0;
LABEL_102:
        *(_WORD *)(v47 + 342) = 6;
        *(unsigned char *)(v47 + 635) = 1;
        *(unsigned char *)(v47 + 637) = 0;
        *(unsigned char *)(v47 + 641) = 0;
      }
    }
    *(unsigned char *)(v47 + 638) = 1;
    unint64_t v64 = v47 + 632;
    *(unsigned char *)(v47 + 632) = 0;
    uint64_t v65 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_127;
      }
      int v67 = *(_DWORD *)(a1 + 728);
      for (j = (unsigned char *)(v47 + 376); ; j += v69 + 1)
      {
        if ((unint64_t)j >= v64 || !j || (uint64_t v69 = *j, v69 > 0x3F))
        {
          int v73 = 257;
          goto LABEL_126;
        }
        if (!*j) {
          break;
        }
      }
      int v73 = (unsigned __int16)((_WORD)j - (_WORD)v48 + 1);
    }
    else
    {
      uint64_t v65 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
      {
LABEL_127:
        uint64_t RecordOpStartQuestion = QueryRecordOpStartQuestion(a1, v47);
        if (!RecordOpStartQuestion) {
          return RecordOpStartQuestion;
        }
        goto LABEL_67;
      }
      int v67 = *(_DWORD *)(a1 + 728);
      for (k = (unsigned char *)(v47 + 376); ; k += v72 + 1)
      {
        if ((unint64_t)k >= v64 || !k || (uint64_t v72 = *k, v72 > 0x3F))
        {
          int v73 = 257;
          goto LABEL_126;
        }
        if (!*k) {
          break;
        }
      }
      int v73 = (unsigned __int16)((_WORD)k - (_WORD)v48 + 1);
    }
LABEL_126:
    unsigned __int16 v74 = DNSTypeName(*(unsigned __int16 *)(v47 + 342));
    v75[0] = 67110147;
    v75[1] = v67;
    __int16 v76 = 2160;
    uint64_t v77 = 1752392040;
    __int16 v78 = 1040;
    int v79 = v73;
    __int16 v80 = 2101;
    uint64_t v81 = v47 + 376;
    __int16 v82 = 2082;
    int v83 = v74;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "[R%u] QueryRecordOpStart: starting parallel unicast query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P %{public}s", (uint8_t *)v75, 0x2Cu);
    goto LABEL_127;
  }
LABEL_67:
  QueryRecordOpStop(a1);
  return RecordOpStartQuestion;
}

void GetAddrInfoClientRequestStop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9) {
    QueryRecordOpStop(v9);
  }
  uint64_t v10 = *(void *)(a1 + 24);
  if (v10)
  {
    QueryRecordOpStop(v10);
    uint64_t v11 = *(void *)(a1 + 24);
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12 || *(unsigned char *)(v12 + 758))
  {
    if (!v11) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(v12 + 637)) {
    mDNSPlatformUpdateDNSStatus(*(void *)(a1 + 16));
  }
  uint64_t v12 = 0;
  if (v11)
  {
LABEL_9:
    if (!*(unsigned char *)(v11 + 758))
    {
      if (*(unsigned char *)(v11 + 637)) {
        mDNSPlatformUpdateDNSStatus(v11);
      }
      uint64_t v11 = 0;
    }
  }
LABEL_16:
  mDNSPlatformTriggerDNSRetry(v12, v11, a3, a4, a5, a6, a7, a8, v15);
  uint64_t v13 = *(void **)(a1 + 16);
  if (v13)
  {
    free(v13);
    *(void *)(a1 + 16) = 0;
  }
  int v14 = *(void **)(a1 + 24);
  if (v14)
  {
    free(v14);
    *(void *)(a1 + 24) = 0;
  }
}

void QueryRecordOpStop(uint64_t a1)
{
  if (*(void *)(a1 + 176))
  {
    resolved_cache_delete(a1);
    mDNS_StopQuery((unsigned int *)mDNSStorage, a1);
    *(void *)(a1 + 176) = 0;
    if (callExternalHelpers(*(void *)(a1 + 136), *(unsigned char **)(a1 + 696), *(unsigned int *)(a1 + 324), v2, v3, v4, v5, v6))
    {
      external_stop_browsing_for_service(*(void *)(a1 + 136), (unsigned __int8 *)(a1 + 376), *(unsigned __int16 *)(a1 + 342), *(_DWORD *)(a1 + 324), *(_DWORD *)(a1 + 244));
    }
  }
  uint64_t v7 = *(void **)(a1 + 696);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 696) = 0;
  }
  uint64_t v8 = *(void **)(a1 + 744);
  if (v8)
  {
    if (!v8[22]
      || (resolved_cache_delete(*(void *)(a1 + 744)),
          mDNS_StopQuery((unsigned int *)mDNSStorage, (uint64_t)v8),
          v8[22] = 0,
          (uint64_t v8 = *(void **)(a1 + 744)) != 0))
    {
      free(v8);
    }
    *(void *)(a1 + 744) = 0;
  }
  uint64_t v9 = *(void **)(a1 + 784);
  if (v9)
  {
    os_release(v9);
    *(void *)(a1 + 784) = 0;
  }
  uint64_t v10 = *(void **)(a1 + 792);
  if (v10)
  {
    os_release(v10);
    *(void *)(a1 + 792) = 0;
  }
}

uint64_t QueryRecordOpStartQuestion(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 176) = a1;
  uint64_t started = mDNS_StartQuery((unsigned int *)mDNSStorage, a2);
  if (started)
  {
    uint64_t v5 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        *(void *)(a2 + 176) = 0;
        return started;
      }
      int v7 = *(_DWORD *)(a1 + 728);
      uint64_t v8 = (unsigned char *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_10:
        while (v8)
        {
          uint64_t v9 = *v8;
          if (v9 > 0x3F) {
            break;
          }
          if (!*v8)
          {
            int v13 = (unsigned __int16)((_WORD)v8 - (a2 + 376) + 1);
            goto LABEL_27;
          }
          v8 += v9 + 1;
          if (a2 != -632) {
            goto LABEL_9;
          }
        }
      }
      else
      {
LABEL_9:
        if ((unint64_t)v8 < a2 + 632) {
          goto LABEL_10;
        }
      }
      int v13 = 257;
    }
    else
    {
      uint64_t v5 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v7 = *(_DWORD *)(a1 + 728);
      uint64_t v11 = (unsigned char *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_18:
        while (v11)
        {
          uint64_t v12 = *v11;
          if (v12 > 0x3F) {
            break;
          }
          if (!*v11)
          {
            int v13 = (unsigned __int16)((_WORD)v11 - (a2 + 376) + 1);
            goto LABEL_27;
          }
          v11 += v12 + 1;
          if (a2 != -632) {
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        if ((unint64_t)v11 < a2 + 632) {
          goto LABEL_18;
        }
      }
      int v13 = 257;
    }
LABEL_27:
    int v14 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
    v16[0] = 67110403;
    v16[1] = v7;
    __int16 v17 = 2160;
    uint64_t v18 = 1752392040;
    __int16 v19 = 1040;
    int v20 = v13;
    __int16 v21 = 2101;
    uint64_t v22 = a2 + 376;
    __int16 v23 = 2082;
    char v24 = v14;
    __int16 v25 = 1024;
    int v26 = started;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[R%u] ERROR: QueryRecordOpStartQuestion mDNS_StartQuery for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P %{public}s failed with error %d", (uint8_t *)v16, 0x32u);
    goto LABEL_28;
  }
  return started;
}

uint64_t DomainNameIsInSearchList(unsigned char *a1, int a2)
{
  int v4 = *a1;
  if (*a1)
  {
    int v5 = 0;
    uint64_t v6 = a1;
    do
    {
      ++v5;
      int v7 = &v6[v4];
      int v8 = v7[1];
      uint64_t v6 = v7 + 1;
      int v4 = v8;
    }
    while (v8);
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v9 = SearchList;
  if (!SearchList) {
    return 0;
  }
  while (1)
  {
    if (!a2 || !SameDomainNameBytes((unsigned char *)(v9 + 8), "\x05local"))
    {
      unsigned int v10 = *(unsigned __int8 *)(v9 + 8);
      if (*(unsigned char *)(v9 + 8))
      {
        int v11 = 0;
        uint64_t v12 = v9 + 8;
        do
        {
          ++v11;
          uint64_t v13 = v12 + v10;
          unsigned int v14 = *(unsigned __int8 *)(v13 + 1);
          uint64_t v12 = v13 + 1;
          unsigned int v10 = v14;
        }
        while (v14);
      }
      else
      {
        int v11 = 0;
      }
      if (v5 >= v11)
      {
        int v15 = a1;
        if (v5 - v11 >= 1)
        {
          int v16 = v5 + 1 - v11;
          int v15 = a1;
          do
          {
            if (!*v15) {
              break;
            }
            v15 += *v15 + 1;
            --v16;
          }
          while (v16 > 1);
        }
        if (SameDomainNameBytes((unsigned char *)(v9 + 8), v15)) {
          break;
        }
      }
    }
    uint64_t v9 = *(void *)v9;
    if (!v9) {
      return 0;
    }
  }
  return 1;
}

uint64_t QueryRecordOpEventHandler(uint64_t result, int a2)
{
  if (a2 != 1) {
    return result;
  }
  uint64_t v2 = result;
  if (*(unsigned char *)(result + 646) != 1) {
    return result;
  }
  uint64_t v3 = *(void *)(result + 176);
  if (!*(unsigned char *)(v3 + 760)) {
    return result;
  }
  resolved_cache_delete(result);
  mDNS_StopQuery((unsigned int *)mDNSStorage, v2);
  *(void *)(v2 + 176) = 0;
  int v4 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled == 1 && mDNSLogCategory_Default != mDNSLogCategory_State)
  {
    int v4 = mDNSLogCategory_Default_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_52;
    }
    int v6 = *(_DWORD *)(v3 + 728);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    __int16 v17 = (unsigned char *)(v2 + 376);
    if (v2 == -632)
    {
LABEL_20:
      while (v17)
      {
        uint64_t v18 = *v17;
        if (v18 > 0x3F) {
          break;
        }
        if (!*v17)
        {
          int v19 = (unsigned __int16)((_WORD)v17 - (v2 + 376) + 1);
          goto LABEL_39;
        }
        v17 += v18 + 1;
        if (v2 != -632) {
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      if ((unint64_t)v17 < v2 + 632) {
        goto LABEL_20;
      }
    }
    int v19 = 257;
LABEL_39:
    uint64_t v20 = *(void *)(v3 + 696);
    if (v20)
    {
      char v24 = *(unsigned char **)(v3 + 696);
      if (v20 == -256)
      {
LABEL_42:
        while (v24)
        {
          uint64_t v25 = *v24;
          if (v25 > 0x3F) {
            break;
          }
          if (!*v24)
          {
            int v23 = (unsigned __int16)((_WORD)v24 - v20 + 1);
            goto LABEL_51;
          }
          v24 += v25 + 1;
          if (v20 != -256) {
            goto LABEL_41;
          }
        }
      }
      else
      {
LABEL_41:
        if ((unint64_t)v24 < v20 + 256) {
          goto LABEL_42;
        }
      }
      int v23 = 257;
    }
    else
    {
      int v23 = 0;
    }
    goto LABEL_51;
  }
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(v3 + 728);
    unsigned int v7 = bswap32(*(unsigned __int16 *)(v2 + 340)) >> 16;
    int v8 = (unsigned char *)(v2 + 376);
    if (v2 == -632)
    {
LABEL_12:
      while (v8)
      {
        uint64_t v9 = *v8;
        if (v9 > 0x3F) {
          break;
        }
        if (!*v8)
        {
          int v19 = (unsigned __int16)((_WORD)v8 - (v2 + 376) + 1);
          goto LABEL_28;
        }
        v8 += v9 + 1;
        if (v2 != -632) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      if ((unint64_t)v8 < v2 + 632) {
        goto LABEL_12;
      }
    }
    int v19 = 257;
LABEL_28:
    uint64_t v20 = *(void *)(v3 + 696);
    if (v20)
    {
      __int16 v21 = *(unsigned char **)(v3 + 696);
      if (v20 == -256)
      {
LABEL_31:
        while (v21)
        {
          uint64_t v22 = *v21;
          if (v22 > 0x3F) {
            break;
          }
          if (!*v21)
          {
            int v23 = (unsigned __int16)((_WORD)v21 - v20 + 1);
            goto LABEL_51;
          }
          v21 += v22 + 1;
          if (v20 != -256) {
            goto LABEL_30;
          }
        }
      }
      else
      {
LABEL_30:
        if ((unint64_t)v21 < v20 + 256) {
          goto LABEL_31;
        }
      }
      int v23 = 257;
    }
    else
    {
      int v23 = 0;
    }
LABEL_51:
    int v26 = *(unsigned __int16 *)(v2 + 342);
    v32[0] = 67111171;
    v32[1] = v6;
    __int16 v33 = 1024;
    unsigned int v34 = v7;
    __int16 v35 = 2160;
    uint64_t v36 = 1752392040;
    __int16 v37 = 1040;
    int v38 = v19;
    __int16 v39 = 2101;
    uint64_t v40 = v2 + 376;
    __int16 v41 = 2160;
    uint64_t v42 = 1752392040;
    __int16 v43 = 1040;
    int v44 = v23;
    __int16 v45 = 2101;
    uint64_t v46 = v20;
    __int16 v47 = 1024;
    int v48 = v26;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[R%u->Q%u] Restarting question that got expired CNAMEs -- current name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, original name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, type: %{mdns:rrtype}d", (uint8_t *)v32, 0x48u);
  }
LABEL_52:
  *(unsigned char *)(v3 + 760) = 0;
  uint64_t v27 = *(unsigned char **)(v3 + 696);
  unsigned __int16 v28 = v27;
  if (v27 == (unsigned char *)-256)
  {
LABEL_54:
    while (v28)
    {
      uint64_t v29 = *v28;
      if (v29 > 0x3F) {
        break;
      }
      if (!*v28)
      {
        unsigned __int16 v30 = (_WORD)v28 - (_WORD)v27 + 1;
        if (v30 > 0x100u) {
          break;
        }
        memcpy((void *)(v2 + 376), v27, v30);
        goto LABEL_62;
      }
      v28 += v29 + 1;
      if (v27 != (unsigned char *)-256) {
        goto LABEL_53;
      }
    }
  }
  else
  {
LABEL_53:
    if (v28 < v27 + 256) {
      goto LABEL_54;
    }
  }
  *(unsigned char *)(v2 + 376) = 0;
LABEL_62:
  *(unsigned char *)(v2 + 646) = 2;
  *(_OWORD *)(v2 + 360) = *(_OWORD *)(v3 + 768);
  if (*(unsigned char *)(v2 + 641) && *(int *)(v3 + 732) >= 1)
  {
    *(_DWORD *)(v3 + 732) = *(_DWORD *)(v3 + 736);
    SearchDomain = NextSearchDomain(v3, (uint64_t)v27, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    SearchDomain = 0;
  }
  return QueryRecordOpRestartUnicastQuestion(v3, v2, SearchDomain);
}

uint64_t *NextSearchDomain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 732);
  unsigned int v10 = &SearchList;
  *(_DWORD *)(a1 + 736) = v9;
  while ((v9 & 0x80000000) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 704);
    do
    {
      unsigned int v10 = (uint64_t *)*v10;
      BOOL v12 = v9-- != 0;
    }
    while (v12 && v10);
    while (1)
    {
      if (!v10) {
        goto LABEL_52;
      }
      uint64_t v14 = v10 + 1;
      unsigned int v13 = *((unsigned __int8 *)v10 + 8);
      if (*((unsigned char *)v10 + 8))
      {
        int v15 = -1;
        uint64_t v16 = v10 + 1;
        do
        {
          int v17 = v15;
          uint64_t v18 = (char *)v16 + v13;
          unsigned int v19 = v18[1];
          uint64_t v16 = (uint64_t *)(v18 + 1);
          unsigned int v13 = v19;
          ++v15;
        }
        while (v19);
        if (v17 + 2 >= 2)
        {
          uint64_t v20 = (unsigned __int8 *)(v10 + 1);
          if (v17)
          {
            uint64_t v20 = (unsigned __int8 *)(v10 + 1);
            do
            {
              if (!*v20) {
                break;
              }
              --v15;
              v20 += *v20 + 1;
            }
            while (v15 > 1);
          }
          if (SameDomainNameBytes(v20, "\ain-addr\x04arpa")
            || SameDomainNameBytes(v20, "\x03ip6\x04arpa"))
          {
            if (mDNS_LoggingEnabled == 1) {
              LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain: skipping search domain %##s, InterfaceID %p", a4, a5, a6, a7, a8, v10 + 8);
            }
            ++*(_DWORD *)(a1 + 732);
            goto LABEL_9;
          }
        }
      }
      ++*(_DWORD *)(a1 + 732);
      if (v10[34] == v11) {
        break;
      }
      if (mDNS_LoggingEnabled) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain skipping domain %##s, InterfaceID %p", a4, a5, a6, a7, a8, v10 + 8);
      }
LABEL_9:
      unsigned int v10 = (uint64_t *)*v10;
    }
    if (mDNS_LoggingEnabled) {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain returning domain %##s, InterfaceID %p", a4, a5, a6, a7, a8, v10 + 8);
    }
    __int16 v21 = *(unsigned char **)(a1 + 696);
    for (unint64_t i = v21; v21 == (unsigned char *)-256; i += v24 + 1)
    {
      if (!i) {
        goto LABEL_36;
      }
LABEL_32:
      uint64_t v24 = *i;
      if (v24 > 0x3F)
      {
LABEL_36:
        unsigned __int16 v23 = 257;
        goto LABEL_38;
      }
      if (!*i)
      {
        unsigned __int16 v23 = (_WORD)i - (_WORD)v21 + 1;
        goto LABEL_38;
      }
    }
    unsigned __int16 v23 = 257;
    if (i < v21 + 256 && i) {
      goto LABEL_32;
    }
LABEL_38:
    int v25 = v23 - 1;
    int v26 = v10 + 1;
    if (v10 != (uint64_t *)-264)
    {
LABEL_39:
      unsigned __int16 v27 = 257;
      if (v26 >= (unsigned char *)v10 + 264 || !v26) {
        goto LABEL_49;
      }
      goto LABEL_43;
    }
    while (v26)
    {
LABEL_43:
      uint64_t v28 = *v26;
      if (v28 > 0x3F) {
        break;
      }
      if (!*v26)
      {
        unsigned __int16 v27 = (_WORD)v26 - (_WORD)v14 + 1;
        goto LABEL_49;
      }
      v26 += v28 + 1;
      if (v10 != (uint64_t *)-264) {
        goto LABEL_39;
      }
    }
    unsigned __int16 v27 = 257;
LABEL_49:
    if (v25 + v27 < 257) {
      return v14;
    }
    int v9 = *(_DWORD *)(a1 + 732);
    unsigned int v10 = &SearchList;
  }
  LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "uDNS_GetNextSearchDomain: count %d less than zero", a4, a5, a6, a7, a8, v9);
LABEL_52:
  uint64_t v14 = 0;
  *(_DWORD *)(a1 + 732) = -1;
  return v14;
}

uint64_t QueryRecordOpRestartUnicastQuestion(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(void *)(a2 + 136) = *(void *)(a1 + 704);
  int v6 = *(unsigned char **)(a1 + 696);
  unsigned int v7 = v6;
  if (v6 == (unsigned char *)-256)
  {
LABEL_3:
    while (v7)
    {
      uint64_t v8 = *v7;
      if (v8 > 0x3F) {
        break;
      }
      if (!*v7)
      {
        unsigned __int16 v9 = (_WORD)v7 - (_WORD)v6 + 1;
        if (v9 > 0x100u) {
          break;
        }
        memcpy((void *)(a2 + 376), v6, v9);
        if (a3) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }
      v7 += v8 + 1;
      if (v6 != (unsigned char *)-256) {
        goto LABEL_2;
      }
    }
  }
  else
  {
LABEL_2:
    if (v7 < v6 + 256) {
      goto LABEL_3;
    }
  }
  *(unsigned char *)(a2 + 376) = 0;
  if (a3) {
LABEL_12:
  }
    AppendDomainName((unsigned char *)(a2 + 376), a3);
LABEL_13:
  uint64_t v10 = a2 + 376;
  unsigned int v11 = *(unsigned __int8 *)(a2 + 376);
  if (*(unsigned char *)(a2 + 376))
  {
    do
    {
      uint64_t v12 = v10;
      uint64_t v13 = v10 + v11;
      unsigned int v14 = *(unsigned __int8 *)(v13 + 1);
      uint64_t v10 = v13 + 1;
      unsigned int v11 = v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v12 = a2 + 376;
  }
  *(unsigned char *)(a2 + 638) = SameDomainLabelPointer(v12, "\x05local") != 0;

  return QueryRecordOpStartQuestion(a1, a2);
}

void *QueryRecordOpResetHandler(void *result)
{
  id v1 = result;
  uint64_t v2 = (void *)result[22];
  uint64_t v3 = (unsigned char *)v2[87];
  int v4 = v3;
  if (v3 == (unsigned char *)-256)
  {
LABEL_3:
    while (v4)
    {
      uint64_t v5 = *v4;
      if (v5 > 0x3F) {
        break;
      }
      if (!*v4)
      {
        unsigned __int16 v6 = (_WORD)v4 - (_WORD)v3 + 1;
        if (v6 > 0x100u) {
          break;
        }
        BOOL result = memcpy(result + 47, v3, v6);
        goto LABEL_11;
      }
      v4 += v5 + 1;
      if (v3 != (unsigned char *)-256) {
        goto LABEL_2;
      }
    }
  }
  else
  {
LABEL_2:
    if (v4 < v3 + 256) {
      goto LABEL_3;
    }
  }
  *((unsigned char *)result + 376) = 0;
LABEL_11:
  if (*((unsigned char *)v1 + 641) && (unsigned int v7 = (unsigned char *)v2[87], *v7) && !v7[*v7 + 1]) {
    uint64_t v8 = &mDNSInterface_LocalOnly;
  }
  else {
    uint64_t v8 = v2 + 88;
  }
  v1[17] = *v8;
  *(void *)((char *)v2 + 732) = 0;
  return result;
}

void QueryRecordOpCallback(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a2 + 176);
  if (*(void *)(v12 + 744) == a2 && *(_WORD *)(a2 + 342) == 6)
  {
    if (*((_WORD *)a3 + 2) != 6) {
      return;
    }
    resolved_cache_delete(a2);
    mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
    *(void *)(a2 + 176) = 0;
    *(_WORD *)(a2 + 342) = *(_WORD *)(v12 + 752);
    *(unsigned char *)(a2 + 632) = *(unsigned char *)(v12 + 754);
    *(unsigned char *)(a2 + 635) = *(unsigned char *)(v12 + 755);
    *(unsigned char *)(a2 + 637) = *(unsigned char *)(v12 + 756);
    int v20 = *(unsigned __int8 *)(v12 + 757);
    *(unsigned char *)(a2 + 641) = v20;
    if (*a3 == 240)
    {
      if (!v20) {
        return;
      }
      SearchDomain = NextSearchDomain(v12, v13, v14, v15, v16, v17, v18, v19);
      if (!SearchDomain) {
        return;
      }
      uint64_t v22 = SearchDomain;
      uint64_t v23 = v12;
      uint64_t v24 = a2;
    }
    else
    {
      uint64_t v23 = v12;
      uint64_t v24 = a2;
      uint64_t v22 = 0;
    }
    goto LABEL_68;
  }
  if (a4 != 1 || *(unsigned char *)(a2 + 646) != 1)
  {
    if (a4 != 4) {
      goto LABEL_30;
    }
    int v25 = mDNSLogCategory_Default;
    uint64_t v26 = 4294901742;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
      {
LABEL_126:
        char v36 = 0;
        goto LABEL_147;
      }
      int v28 = *(_DWORD *)(v12 + 728);
      uint64_t v29 = (unsigned char *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_25:
        while (v29)
        {
          uint64_t v30 = *v29;
          if (v30 > 0x3F) {
            break;
          }
          if (!*v29)
          {
            int v43 = (unsigned __int16)((_WORD)v29 - (a2 + 376) + 1);
            goto LABEL_125;
          }
          v29 += v30 + 1;
          if (a2 != -632) {
            goto LABEL_24;
          }
        }
      }
      else
      {
LABEL_24:
        if ((unint64_t)v29 < a2 + 632) {
          goto LABEL_25;
        }
      }
      int v43 = 257;
    }
    else
    {
      int v25 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_126;
      }
      int v28 = *(_DWORD *)(v12 + 728);
      __int16 v39 = (unsigned char *)(a2 + 376);
      if (a2 == -632)
      {
LABEL_54:
        while (v39)
        {
          uint64_t v40 = *v39;
          if (v40 > 0x3F) {
            break;
          }
          if (!*v39)
          {
            int v43 = (unsigned __int16)((_WORD)v39 - (a2 + 376) + 1);
            goto LABEL_125;
          }
          v39 += v40 + 1;
          if (a2 != -632) {
            goto LABEL_53;
          }
        }
      }
      else
      {
LABEL_53:
        if ((unint64_t)v39 < a2 + 632) {
          goto LABEL_54;
        }
      }
      int v43 = 257;
    }
LABEL_125:
    uint64_t v69 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
    int v92 = 67110147;
    int v93 = v28;
    __int16 v94 = 2160;
    uint64_t v95 = 1752392040;
    __int16 v96 = 1040;
    int v97 = v43;
    __int16 v98 = 2101;
    uint64_t v99 = a2 + 376;
    __int16 v100 = 2082;
    int v101 = v69;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[R%u] QueryRecordOpCallback: Suppressed question %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s)", (uint8_t *)&v92, 0x2Cu);
    goto LABEL_126;
  }
  if (*((_WORD *)a3 + 2) != 5) {
    goto LABEL_30;
  }
  if (a3[2] == 2) {
    *(unsigned char *)(v12 + 760) = 1;
  }
  if (*(unsigned char *)(a2 + 635) || *(_WORD *)(a2 + 342) == 5)
  {
LABEL_30:
    if (*a3 != 240)
    {
      uint64_t v26 = 0;
      goto LABEL_44;
    }
    if (*(unsigned char *)(a2 + 637))
    {
      mDNS_Lock_((unsigned int *)a1, (uint64_t)"GetTimeNow", 723);
      int v31 = *(_DWORD *)(a1 + 64);
      mDNS_Unlock_(a1, (uint64_t)"GetTimeNow", 725);
      if (v31 - *(_DWORD *)(a2 + 240) >= 0)
      {
        BOOL v32 = mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          uint64_t v26 = 4294901728;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = *(_DWORD *)(v12 + 728);
            __int16 v41 = (unsigned char *)(a2 + 376);
            if (a2 == -632)
            {
LABEL_62:
              while (v41)
              {
                uint64_t v42 = *v41;
                if (v42 > 0x3F) {
                  break;
                }
                if (!*v41)
                {
                  int v68 = (unsigned __int16)((_WORD)v41 - (a2 + 376) + 1);
                  goto LABEL_145;
                }
                v41 += v42 + 1;
                if (a2 != -632) {
                  goto LABEL_61;
                }
              }
            }
            else
            {
LABEL_61:
              if ((unint64_t)v41 < a2 + 632) {
                goto LABEL_62;
              }
            }
            int v68 = 257;
            goto LABEL_145;
          }
        }
        else
        {
          BOOL v32 = mDNSLogCategory_Default_redacted;
          uint64_t v26 = 4294901728;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = *(_DWORD *)(v12 + 728);
            unsigned int v34 = (unsigned char *)(a2 + 376);
            if (a2 == -632)
            {
LABEL_38:
              while (v34)
              {
                uint64_t v35 = *v34;
                if (v35 > 0x3F) {
                  break;
                }
                if (!*v34)
                {
                  int v68 = (unsigned __int16)((_WORD)v34 - (a2 + 376) + 1);
                  goto LABEL_145;
                }
                v34 += v35 + 1;
                if (a2 != -632) {
                  goto LABEL_37;
                }
              }
            }
            else
            {
LABEL_37:
              if ((unint64_t)v34 < a2 + 632) {
                goto LABEL_38;
              }
            }
            int v68 = 257;
LABEL_145:
            unsigned __int16 v74 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
            uint64_t v75 = *(void *)(a2 + 136);
            int v92 = 67110403;
            int v93 = v33;
            __int16 v94 = 2160;
            uint64_t v95 = 1752392040;
            __int16 v96 = 1040;
            int v97 = v68;
            __int16 v98 = 2101;
            uint64_t v99 = a2 + 376;
            __int16 v100 = 2082;
            int v101 = v74;
            __int16 v102 = 2048;
            uint64_t v103 = v75;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[R%u] QueryRecordOpCallback: Question %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s) timing out, InterfaceID %p", (uint8_t *)&v92, 0x36u);
          }
        }
        char v36 = 1;
LABEL_147:
        if (&_NEHelperTrackerGetAppInfo)
        {
          int v76 = 1;
          if (!a4) {
            goto LABEL_155;
          }
        }
        else
        {
          int v76 = _os_feature_enabled_impl();
          if (!a4)
          {
LABEL_155:
            uint64_t v77 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, BOOL, uint64_t, uint64_t, void))(v12 + 712);
            if (v77)
            {
              if (a4 == 1)
              {
                if (*(unsigned char *)(v12 + 760)) {
                  BOOL v78 = 1;
                }
                else {
                  BOOL v78 = a3[2] == 2;
                }
              }
              else
              {
                BOOL v78 = 0;
              }
              v77(a1, a2, a3, v78, a4, v26, *(void *)(v12 + 720));
            }
            char v79 = v36 ^ 1;
            if (*(void *)(a1 + 208) != a2) {
              char v79 = 1;
            }
            if ((v79 & 1) == 0)
            {
              resolved_cache_delete(a2);
              mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
              *(void *)(a2 + 176) = 0;
            }
            return;
          }
        }
        if (v76
          && *(_WORD *)(a2 + 340)
          && ((unint64_t)(*((void *)a3 + 3) + 5) > 3 || *((void *)a3 + 3) == -4)
          && *a3 != 240)
        {
          int v80 = *((unsigned __int16 *)a3 + 2);
          if (v80 == 28 || v80 == 1)
          {
            uint64_t v81 = &s_head_0;
            while (1)
            {
              uint64_t v81 = (uint64_t *)*v81;
              if (!v81) {
                break;
              }
              if (v81[1] == a2)
              {
                if (v80 == 1) {
                  CFIndex v82 = 4;
                }
                else {
                  CFIndex v82 = 16;
                }
                CFDataRef v83 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(*((void *)a3 + 5) + 4), v82);
                if (v83)
                {
                  CFDataRef v84 = v83;
                  CFArrayAppendValue((CFMutableArrayRef)v81[6], v83);
                  CFRelease(v84);
                }
                goto LABEL_155;
              }
            }
          }
        }
        goto LABEL_155;
      }
    }
    if (*(unsigned char *)(a2 + 641))
    {
      if (a4)
      {
        if ((*(_DWORD *)(v12 + 732) & 0x80000000) == 0)
        {
          __int16 v37 = NextSearchDomain(v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
          if (v37 || (int v44 = *(unsigned char **)(v12 + 696), *v44) && !v44[*v44 + 1])
          {
            resolved_cache_delete(a2);
            mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
            *(void *)(a2 + 176) = 0;
            uint64_t v23 = v12;
            uint64_t v24 = a2;
            uint64_t v22 = v37;
LABEL_68:
            QueryRecordOpRestartUnicastQuestion(v23, v24, v22);
            return;
          }
        }
      }
    }
    if (!*(unsigned char *)(v12 + 759) || *(_WORD *)(a2 + 342) != 28 || (int v45 = a3[1], v45 == 3))
    {
      if (*(unsigned char *)(v12 + 764))
      {
        if (!*(unsigned char *)(a2 + 643))
        {
          uint64_t v51 = *(void *)(a2 + 80);
          if (v51)
          {
            if (*(void *)(v51 + 96) && nw_resolver_config_get_allow_failover())
            {
              QueryRecordOpStopQuestion(a2);
              int v52 = *(unsigned __int16 *)(v12 + 762);
              *(_WORD *)(a2 + 342) = v52;
              *(unsigned char *)(a2 + 643) = 1;
              if (!*(void *)(a2 + 136)) {
                *(unsigned char *)(a2 + 642) = 1;
              }
              unsigned int v53 = mDNSLogCategory_Default;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
                {
                  int v61 = *(_DWORD *)(v12 + 728);
                  uint64_t v87 = (unsigned char *)(a2 + 376);
                  if (a2 == -632)
                  {
LABEL_185:
                    while (v87)
                    {
                      uint64_t v88 = *v87;
                      if (v88 > 0x3F) {
                        break;
                      }
                      if (!*v87)
                      {
                        int v90 = (unsigned __int16)((_WORD)v87 - (a2 + 376) + 1);
                        goto LABEL_201;
                      }
                      v87 += v88 + 1;
                      if (a2 != -632) {
                        goto LABEL_184;
                      }
                    }
                  }
                  else
                  {
LABEL_184:
                    if ((unint64_t)v87 < a2 + 632) {
                      goto LABEL_185;
                    }
                  }
                  int v90 = 257;
                  goto LABEL_201;
                }
              }
              else
              {
                unsigned int v53 = mDNSLogCategory_Default_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG))
                {
                  int v61 = *(_DWORD *)(v12 + 728);
                  v62 = (unsigned char *)(a2 + 376);
                  if (a2 == -632)
                  {
LABEL_106:
                    while (v62)
                    {
                      uint64_t v63 = *v62;
                      if (v63 > 0x3F) {
                        break;
                      }
                      if (!*v62)
                      {
                        int v90 = (unsigned __int16)((_WORD)v62 - (a2 + 376) + 1);
                        goto LABEL_201;
                      }
                      v62 += v63 + 1;
                      if (a2 != -632) {
                        goto LABEL_105;
                      }
                    }
                  }
                  else
                  {
LABEL_105:
                    if ((unint64_t)v62 < a2 + 632) {
                      goto LABEL_106;
                    }
                  }
                  int v90 = 257;
LABEL_201:
                  int v92 = 67110147;
                  int v93 = v61;
                  __int16 v94 = 2160;
                  uint64_t v95 = 1752392040;
                  __int16 v96 = 1040;
                  int v97 = v90;
                  __int16 v98 = 2101;
                  uint64_t v99 = a2 + 376;
                  __int16 v100 = 2082;
                  int v101 = DNSTypeName(v52);
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "[R%u] Restarting question for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s) due to DNS service failover", (uint8_t *)&v92, 0x2Cu);
                }
              }
              if (*(unsigned char *)(a2 + 641))
              {
                *(void *)(v12 + 732) = 0;
                unsigned int v91 = NextSearchDomain(v12, v54, v55, v56, v57, v58, v59, v60);
              }
              else
              {
                unsigned int v91 = 0;
              }
              QueryRecordOpRestartUnicastQuestion(v12, a2, v91);
              return;
            }
          }
        }
      }
      uint64_t v26 = 4294901742;
      if (*((void *)a3 + 3) || !IsLocalDomain(*((unsigned char **)a3 + 4))) {
        goto LABEL_44;
      }
      int v46 = *(unsigned __int16 *)(a2 + 342);
      if ((v46 != 28 && v46 != 1 || a3[1]) && !DomainNameIsInSearchList((unsigned char *)(a2 + 376), 1)) {
        return;
      }
      __int16 v47 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        int v48 = *(_DWORD *)(v12 + 728);
        uint64_t v72 = (unsigned char *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_138:
          while (v72)
          {
            uint64_t v73 = *v72;
            if (v73 > 0x3F) {
              break;
            }
            if (!*v72)
            {
              int v86 = (unsigned __int16)((_WORD)v72 - (a2 + 376) + 1);
              goto LABEL_196;
            }
            v72 += v73 + 1;
            if (a2 != -632) {
              goto LABEL_137;
            }
          }
        }
        else
        {
LABEL_137:
          if ((unint64_t)v72 < a2 + 632) {
            goto LABEL_138;
          }
        }
        int v86 = 257;
      }
      else
      {
        __int16 v47 = mDNSLogCategory_Default_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        int v48 = *(_DWORD *)(v12 + 728);
        unsigned int v49 = (unsigned char *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_91:
          while (v49)
          {
            uint64_t v50 = *v49;
            if (v50 > 0x3F) {
              break;
            }
            if (!*v49)
            {
              int v86 = (unsigned __int16)((_WORD)v49 - (a2 + 376) + 1);
              goto LABEL_196;
            }
            v49 += v50 + 1;
            if (a2 != -632) {
              goto LABEL_90;
            }
          }
        }
        else
        {
LABEL_90:
          if ((unint64_t)v49 < a2 + 632) {
            goto LABEL_91;
          }
        }
        int v86 = 257;
      }
LABEL_196:
      v89 = DNSTypeName(*(unsigned __int16 *)(a2 + 342));
      int v92 = 67110147;
      int v93 = v48;
      __int16 v94 = 2160;
      uint64_t v95 = 1752392040;
      __int16 v96 = 1040;
      int v97 = v86;
      __int16 v98 = 2101;
      uint64_t v99 = a2 + 376;
      __int16 v100 = 2082;
      int v101 = v89;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[R%u] QueryRecordOpCallback: Question %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s) answering local with negative unicast response", (uint8_t *)&v92, 0x2Cu);
LABEL_44:
      if (a4 == 1)
      {
        char v36 = 0;
        *(unsigned char *)(v12 + 758) = 1;
        goto LABEL_147;
      }
      goto LABEL_126;
    }
    unint64_t v64 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEBUG))
      {
        int v65 = *(_DWORD *)(v12 + 728);
        v70 = (unsigned char *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_130:
          while (v70)
          {
            uint64_t v71 = *v70;
            if (v71 > 0x3F) {
              break;
            }
            if (!*v70)
            {
              int v85 = (unsigned __int16)((_WORD)v70 - (a2 + 376) + 1);
              goto LABEL_192;
            }
            v70 += v71 + 1;
            if (a2 != -632) {
              goto LABEL_129;
            }
          }
        }
        else
        {
LABEL_129:
          if ((unint64_t)v70 < a2 + 632) {
            goto LABEL_130;
          }
        }
        int v85 = 257;
        goto LABEL_192;
      }
    }
    else
    {
      unint64_t v64 = mDNSLogCategory_Default_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEBUG))
      {
        int v65 = *(_DWORD *)(v12 + 728);
        uint64_t v66 = (unsigned char *)(a2 + 376);
        if (a2 == -632)
        {
LABEL_116:
          while (v66)
          {
            uint64_t v67 = *v66;
            if (v67 > 0x3F) {
              break;
            }
            if (!*v66)
            {
              int v85 = (unsigned __int16)((_WORD)v66 - (a2 + 376) + 1);
              goto LABEL_192;
            }
            v66 += v67 + 1;
            if (a2 != -632) {
              goto LABEL_115;
            }
          }
        }
        else
        {
LABEL_115:
          if ((unint64_t)v66 < a2 + 632) {
            goto LABEL_116;
          }
        }
        int v85 = 257;
LABEL_192:
        int v92 = 67110147;
        int v93 = v65;
        __int16 v94 = 2160;
        uint64_t v95 = 1752392040;
        __int16 v96 = 1040;
        int v97 = v85;
        __int16 v98 = 2101;
        uint64_t v99 = a2 + 376;
        __int16 v100 = 1024;
        LODWORD(v101) = v45;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "[R%u] Restarting question for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P AAAA record as question for A record (RCODE %d)", (uint8_t *)&v92, 0x28u);
      }
    }
    resolved_cache_delete(a2);
    mDNS_StopQuery((unsigned int *)mDNSStorage, a2);
    *(void *)(a2 + 176) = 0;
    *(_WORD *)(a2 + 342) = 1;
    QueryRecordOpStartQuestion(v12, a2);
  }
}

void QueryRecordOpStopQuestion(uint64_t a1)
{
  *(void *)(a1 + 176) = 0;
}

BOOL GetAddrInfoClientRequestIsMulticast(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  BOOL result = 1;
  if (!v1 || *(_WORD *)(v1 + 340) || *(int *)(v1 + 212) <= 0)
  {
    uint64_t v2 = *(void *)(a1 + 24);
    if (!v2 || *(_WORD *)(v2 + 340) || *(int *)(v2 + 212) <= 0) {
      return 0;
    }
  }
  return result;
}

uint64_t QueryRecordClientRequestStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v35, 0, 256);
  if (*(unsigned char *)(a2 + 68))
  {
    uint64_t RecordOpStart = 4294901741;
    if (!*(void *)(a2 + 72)) {
      goto LABEL_8;
    }
    uint64_t v13 = (void *)xpc_copy_entitlement_for_token();
    if (!v13) {
      goto LABEL_8;
    }
    uint64_t v14 = v13;
    xpc_release(v13);
    if (v14 != &_xpc_BOOL_true) {
      goto LABEL_8;
    }
    uint64_t v15 = *(void *)(a2 + 48);
    if (!v15)
    {
      uint64_t RecordOpStart = 4294901756;
      goto LABEL_8;
    }
    Querier_RegisterPathResolver(v15);
  }
  uint64_t v29 = 0;
  uint64_t RecordOpStart = InterfaceIndexToInterfaceID(*(_DWORD *)(a2 + 16), &v29, a3, a4, a5, a6, a7, a8);
  if (RecordOpStart)
  {
LABEL_8:
    QueryRecordClientRequestStop(a1, a2, a3, a4, a5, a6, a7, a8, v28);
    return RecordOpStart;
  }
  uint64_t v17 = *(unsigned __int8 **)(a2 + 8);
  v35[0] = 0;
  if (!AppendDNSNameString(v35, v17, a3, a4, a5, a6, a7, a8))
  {
    uint64_t RecordOpStart = 4294901756;
    uint64_t v22 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v22 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
    }
    int v24 = *(_DWORD *)a2;
    uint64_t v25 = *(void *)(a2 + 8);
    *(_DWORD *)buf = 67109635;
    *(_DWORD *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[8] = 2160;
    *(void *)&buf[10] = 1752392040;
    *(_WORD *)&buf[18] = 2085;
    *(void *)&buf[20] = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[R%u] ERROR: bad domain name '%{sensitive, mask.hash}s'", buf, 0x1Cu);
    goto LABEL_8;
  }
  int v18 = *(unsigned __int16 *)(a2 + 24);
  if (v18 != 28 && v18 != 1) {
    goto LABEL_33;
  }
  char v19 = 0;
  int v20 = *(unsigned char **)(a2 + 8);
  while (1)
  {
    int v21 = *v20++;
    if (v21 == 46) {
      break;
    }
    if (v21 == 92)
    {
      ++v19;
    }
    else
    {
      if (!*(v20 - 1)) {
        goto LABEL_27;
      }
LABEL_19:
      char v19 = 0;
    }
  }
  if (*v20) {
    goto LABEL_19;
  }
  if ((v19 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_27:
  if (AlwaysAppendSearchDomains || v35[0] && !v35[v35[0] + 1]) {
    char v23 = 1;
  }
  else {
LABEL_33:
  }
    char v23 = 0;
  memset(buf, 0, sizeof(buf));
  memset(v34, 0, sizeof(v34));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  *(_DWORD *)buf = *(_DWORD *)a2;
  *(void *)&buf[8] = v35;
  int v26 = *(_DWORD *)(a2 + 20);
  LODWORD(v31) = -1;
  DWORD1(v31) = v26;
  *(_WORD *)&buf[16] = v18;
  *(_WORD *)&buf[18] = *(_WORD *)(a2 + 26);
  *(void *)&unsigned char buf[24] = v29;
  BYTE8(v31) = v23;
  HIDWORD(v31) = *(_DWORD *)(a2 + 28);
  *(void *)&long long v32 = *(void *)(a2 + 32);
  DWORD2(v32) = *(_DWORD *)(a2 + 40);
  uint64_t v27 = *(void *)(a2 + 56);
  *(void *)&long long v33 = *(void *)(a2 + 48);
  *((void *)&v33 + 1) = v27;
  LODWORD(v34[0]) = *(_DWORD *)(a2 + 64);
  BYTE4(v34[0]) = *(unsigned char *)(a2 + 68);
  *(_OWORD *)((char *)v34 + 8) = *(_OWORD *)(a2 + 72);
  WORD6(v32) = *(_WORD *)(a2 + 88);
  BYTE8(v34[1]) = *(unsigned char *)(a2 + 90);
  uint64_t RecordOpStart = QueryRecordOpStart(a1, (uint64_t)buf, a3, a4);
  if (RecordOpStart) {
    goto LABEL_8;
  }
  return RecordOpStart;
}

void QueryRecordClientRequestStop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  QueryRecordOpStop(a1);
  if (*(unsigned char *)(a1 + 758))
  {
    int v16 = *(unsigned __int16 *)(a1 + 342);
    if (v16 == 1) {
      uint64_t v17 = a1;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v16 == 28) {
      uint64_t v18 = a1;
    }
    else {
      uint64_t v18 = 0;
    }
    mDNSPlatformTriggerDNSRetry(v17, v18, v10, v11, v12, v13, v14, v15, a9);
  }
}

char *DNSProxyGetStateHandler()
{
  uint64_t v0 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v0, v1, v2, v3, v4, v5, v6, v7);
  if (gProxyManager && CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
  {
    uint64_t v15 = (void *)(gProxyManager + 16);
    while (1)
    {
      uint64_t v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_9;
      }
      int v16 = (uint64_t (*)(void))v15[3];
      if (v16)
      {
        uint64_t v17 = (char *)v16();
        goto LABEL_10;
      }
    }
  }
  uint64_t v17 = strdup("‹No DNS Proxies›");
  if (!v17)
  {
    __break(1u);
LABEL_9:
    uint64_t v17 = 0;
  }
LABEL_10:
  KQueueUnlock((uint64_t)"DNSProxyGetStateHandler", v8, v9, v10, v11, v12, v13, v14);
  return v17;
}

uint64_t DNSProxyStopHandler(const void *a1)
{
  uint64_t v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  if (gProxyManager)
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24));
    uint64_t v18 = gProxyManager;
    CFIndex v19 = CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24));
    if (v19 < 1)
    {
LABEL_6:
      uint64_t v22 = 4294960569;
    }
    else
    {
      CFIndex v20 = v19;
      CFIndex v21 = 0;
      while (CFArrayGetValueAtIndex(*(CFArrayRef *)(v18 + 24), v21) != a1)
      {
        if (v20 == ++v21) {
          goto LABEL_6;
        }
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v18 + 24), v21);
      if (Count)
      {
        if (!CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
        {
          for (uint64_t i = 0; i != 4; ++i)
            close(dp_listener[i]);
          if (mDNS_LoggingEnabled == 1) {
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "mDNSPlatformCloseDNSProxySkts: Closing DNS Proxy Listener Sockets", v12, v13, v14, v15, v16, v25);
          }
        }
      }
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 4294901754;
  }
  KQueueUnlock((uint64_t)"DNSProxyStopHandler", v10, v11, v12, v13, v14, v15, v16);
  return v22;
}

uint64_t DNSProxyStartHandler(const void *a1)
{
  uint64_t v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = gProxyManager;
  if (gProxyManager) {
    goto LABEL_16;
  }
  uint64_t v11 = _os_object_alloc();
  if (!v11)
  {
    gProxyManager = 0;
    uint64_t v23 = 4294960568;
    goto LABEL_42;
  }
  CFIndex v19 = (void *)v11;
  CFIndex v20 = &_mrcs_dns_proxy_manager_kind;
  *(void *)(v11 + 16) = &_mrcs_dns_proxy_manager_kind;
  do
  {
    CFIndex v21 = (void (*)(void *))v20[2];
    if (v21) {
      v21(v19);
    }
    CFIndex v20 = (_UNKNOWN **)*v20;
  }
  while (v20);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mrcs_cfarray_callbacks);
  v19[3] = Mutable;
  if (Mutable) {
    uint64_t v10 = (uint64_t)v19;
  }
  else {
    uint64_t v10 = 0;
  }
  if (Mutable) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = 4294960567;
  }
  if (!Mutable) {
    os_release(v19);
  }
  gProxyManager = v10;
  if (!v23)
  {
LABEL_16:
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v10 + 24));
    uint64_t v25 = gProxyManager;
    CFArrayRef v26 = *(const __CFArray **)(gProxyManager + 24);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 0x40000000;
    v60[2] = ___mrcs_dns_proxy_manager_conflicts_with_proxy_block_invoke;
    v60[3] = &__block_descriptor_tmp_17_4099;
    v60[4] = a1;
    if (mdns_cfarray_enumerate(v26, (uint64_t)v60))
    {
      CFArrayAppendValue(*(CFMutableArrayRef *)(v25 + 24), a1);
      uint64_t v23 = 0;
      if (Count) {
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v23 = 4294960537;
      if (Count) {
        goto LABEL_42;
      }
    }
    if (CFArrayGetCount(*(CFArrayRef *)(gProxyManager + 24)))
    {
      int v27 = socket(2, 2, 17);
      int v28 = socket(30, 2, 17);
      int v29 = socket(2, 1, 6);
      int v30 = socket(30, 1, 6);
      int v31 = v30;
      if (v27 < 0 || v28 < 0 || v29 < 0 || v30 < 0)
      {
        if ((v27 & 0x80000000) == 0) {
          close(v27);
        }
        if ((v28 & 0x80000000) == 0) {
          close(v28);
        }
        if ((v29 & 0x80000000) == 0) {
          close(v29);
        }
        if ((v31 & 0x80000000) == 0) {
          close(v31);
        }
      }
      BindDPSocket(v27, 2, 2);
      BindDPSocket(v28, 30, 2);
      BindDPSocket(v29, 2, 1);
      BindDPSocket(v31, 30, 1);
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "mDNSPlatformInitDNSProxySkts: Opened Listener Sockets for DNS Proxy : %d, %d, %d, %d", v32, v33, v34, v35, v36, v27);
      }
      uint64_t v37 = mDNSStorage[0];
      *(void *)(mDNSStorage[0] + 976) = ProxyUDPCallback;
      *(void *)(v37 + 984) = ProxyTCPCallback;
      *(_WORD *)(v37 + 704) = 13568;
      *(void *)(v37 + 872) = mDNSStorage;
      *(_WORD *)(v37 + 800) = 13568;
      *(void *)(v37 + 960) = mDNSStorage;
      *(_WORD *)(v37 + 888) = 13568;
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: %d, %d, %d, %d", v32, v33, v34, v35, v36, v27);
      *(unsigned char *)(v37 + 792) = 1;
      if (SetupUDPProxySocket(v27, (void *)(v37 + 704), 2, v38, v39, v40, v41, v42)) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! UDPv4 Socket", v43, v44, v45, v46, v47, v59);
      }
      if (SetupUDPProxySocket(v28, (void *)(v37 + 704), 30, v43, v44, v45, v46, v47)) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! UDPv6 Socket", v48, v49, v50, v51, v52, v59);
      }
      if (SetupTCPProxySocket(v29, v37 + 800)) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! TCPv4 Socket", v53, v54, v55, v56, v57, v59);
      }
      if (SetupTCPProxySocket(v31, v37 + 888)) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupDNSProxySkts: ERROR!! TCPv6 Socket", v14, v15, v16, v17, v18, v59);
      }
      dp_listener[0] = v27;
      unk_100164CE0 = v28;
      dword_100164CE4 = v29;
      unk_100164CE8 = v31;
    }
  }
LABEL_42:
  KQueueUnlock((uint64_t)"DNSProxyStartHandler", v12, v13, v14, v15, v16, v17, v18);
  return v23;
}

void ProxyTCPCallback(unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  unsigned __int16 v10 = a5;
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPCallback: DNS Message from %#a:%d to %#a:%d length %d", (uint64_t)a4, a5, a6, a7, a8, (int)a4);
  }
  if ((unsigned __int8 *)a3 != a2
    && gProxyManager
    && mrcs_dns_proxy_manager_get_proxy_by_input_interface(*(const __CFArray **)(gProxyManager + 24), a8))
  {
    ProxyCallbackCommon(a1, a2, a3, a4, v10, a8, 1, a9);
  }
  else
  {
    uint64_t v15 = &DNSProxyClients;
    uint64_t v16 = &DNSProxyClients;
    while (1)
    {
      uint64_t v17 = v16;
      uint64_t v16 = v15;
      uint64_t v15 = (uint64_t *)*v15;
      if (!v15) {
        break;
      }
      if ((unsigned __int16 *)v15[5] == a1)
      {
        uint64_t *v17 = *v15;
        if (mDNS_LoggingEnabled == 1) {
          LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPCallback: free", (uint64_t)a4, a5, a6, a7, a8, v25);
        }
        mDNSPlatformDisposeProxyContext(a1);
        uint64_t v18 = (void *)*v16;
        FreeDNSProxyClient(v18);
        return;
      }
    }
    mDNSPlatformDisposeProxyContext(a1);
    int v24 = mDNSLogCategory_Default;
    LogMsgWithLevel(v24, OS_LOG_TYPE_DEFAULT, "ProxyTCPCallback: socket cannot be found", v19, v20, v21, v22, v23, (int)a9);
  }
}

void FreeDNSProxyClient(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2) {
    free(v2);
  }
  uint64_t v3 = (void *)a1[132];
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)a1[133];
  if (v4) {
    os_release(v4);
  }

  free(a1);
}

void ProxyCallbackCommon(unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8)
{
  if (!gProxyManager
    || (int v10 = a7,
        unsigned __int16 v11 = a5,
        (uint64_t proxy_by_input_interface = mrcs_dns_proxy_manager_get_proxy_by_input_interface(*(const __CFArray **)(gProxyManager + 24), a6)) == 0))
  {
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Rejecting DNS Query coming from InterfaceID %p", (uint64_t)a4, a5, a6, a7, (uint64_t)a8, a6);
    return;
  }
  if (((a3 - a2) & 0xFFFFFFFC) >= 0xCuLL)
  {
    unsigned int v17 = __rev16(*((unsigned __int16 *)a2 + 2));
    *((_WORD *)a2 + 2) = v17;
    unsigned int v18 = __rev16(*((unsigned __int16 *)a2 + 3));
    *((_WORD *)a2 + 3) = v18;
    unsigned int v19 = __rev16(*((unsigned __int16 *)a2 + 4));
    *((_WORD *)a2 + 4) = v19;
    *((_WORD *)a2 + 5) = bswap32(*((unsigned __int16 *)a2 + 5)) >> 16;
    if ((a2[2] & 0xF8) != 0)
    {
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Not a query(%d) for pkt from %#a:%d", (uint64_t)a4, a5, a6, a7, (uint64_t)a8, a2[2] & 0xF8);
      }
      unsigned __int16 v20 = v11;
      char v21 = 4;
      goto LABEL_25;
    }
    if (v17 != 1 || v18 || v19)
    {
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Malformed pkt from %#a:%d, Q:%d, An:%d, Au:%d", (uint64_t)a4, a5, a6, a7, (uint64_t)a8, (int)a4);
      }
    }
    else
    {
      uint64_t v22 = (void *)proxy_by_input_interface;
      bzero(v95, 0x2B8uLL);
      if (getQuestion((unint64_t)a2, a2 + 12, a3, a6, v95))
      {
        if (mDNS_LoggingEnabled)
        {
          unsigned int v91 = mDNSLogCategory_Default;
          DNSTypeName(v96);
          LogMsgWithLevel(v91, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Question %##s (%s)", v28, v29, v30, v31, v32, (int)v98);
        }
        OptRR = LocateOptRR((unint64_t)a2, a3, 0);
        int v92 = OptRR;
        if (OptRR)
        {
          unint64_t v34 = a3;
          int v35 = (int)OptRR;
          uint64_t v36 = skipResourceRecord((unint64_t)a2, OptRR, v34);
          if (v36)
          {
            unsigned int v90 = v36 - v35;
            if (mDNS_LoggingEnabled == 1)
            {
              v89 = mDNSLogCategory_Default;
              int v42 = v36 - v35;
              DNSTypeName(v96);
              LogMsgWithLevel(v89, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: EDNS0 opt length %u present in Question %##s (%s)", v43, v44, v45, v46, v47, v42);
            }
LABEL_32:
            uint64_t v54 = DNSProxyClients;
            if (DNSProxyClients)
            {
              int v55 = *(unsigned __int16 *)a2;
              while (!mDNSSameAddress((int *)(v54 + 8), a4)
                   || *(unsigned __int16 *)(v54 + 28) != v11
                   || *(unsigned __int16 *)(v54 + 30) != v55
                   || *(unsigned __int16 *)(v54 + 1032) != v96
                   || *(unsigned __int16 *)(v54 + 680) != v97
                   || !SameDomainNameBytes((unsigned char *)(v54 + 80), v98))
              {
                uint64_t v54 = *(void *)v54;
                if (!v54) {
                  goto LABEL_41;
                }
              }
              if (mDNS_LoggingEnabled)
              {
                LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "IsDuplicateClient: Found a duplicate client in the list", v56, v57, v58, v59, v60, v88);
                if (mDNS_LoggingEnabled == 1) {
                  LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Found a duplicate for pkt from %#a:%d, ignoring this", v83, v84, v85, v86, v87, (int)a4);
                }
              }
              return;
            }
LABEL_41:
            int v61 = malloc_type_calloc(1uLL, 0x430uLL, 0xF1748037uLL);
            if (v61)
            {
              uint64_t v62 = (uint64_t)v61;
              DNSProxyPrepareOmsg(0x1F4u, (uint64_t)v61);
              *(void *)(v62 + 1064) = v22;
              os_retain(v22);
              int v68 = a4[4];
              *(_OWORD *)(v62 + 8) = *(_OWORD *)a4;
              *(_DWORD *)(v62 + 24) = v68;
              *(_WORD *)(v62 + 28) = v11;
              *(_WORD *)(v62 + 30) = *(_WORD *)a2;
              *(void *)(v62 + 32) = a6;
              *(void *)(v62 + 40) = a1;
              *(unsigned char *)(v62 + 48) = v10;
              *(_WORD *)(v62 + 50) = *((_WORD *)a2 + 1);
              *(void *)(v62 + 72) = a8;
              for (uint64_t i = (uint64_t *)v98; i < &v99; uint64_t i = (uint64_t *)((char *)i + v70 + 1))
              {
                if (!i) {
                  break;
                }
                uint64_t v70 = *(unsigned __int8 *)i;
                if (v70 > 0x3F) {
                  break;
                }
                if (!*(unsigned char *)i)
                {
                  unsigned int v71 = i - v98 + 1;
                  if ((unsigned __int16)v71 <= 0x100u)
                  {
                    memcpy((void *)(v62 + 80), v98, (unsigned __int16)v71);
                    goto LABEL_51;
                  }
                  break;
                }
              }
              *(unsigned char *)(v62 + 80) = 0;
LABEL_51:
              if (!v92) {
                goto LABEL_57;
              }
              if (v90 <= 0xA)
              {
                if (mDNS_LoggingEnabled == 1) {
                  LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Invalid EDNS0 option for pkt from %#a:%d, ignoring this", v63, v64, v65, v66, v67, (int)a4);
                }
                goto LABEL_57;
              }
              *(_WORD *)(v62 + 68) = bswap32(*(unsigned __int16 *)(v92 + 3)) >> 16;
              uint64_t v72 = malloc_type_malloc(v90, 0xA172743EuLL);
              if (v72)
              {
                *(void *)(v62 + 56) = v72;
                memcpy(v72, v92, v90);
                *(_DWORD *)(v62 + 64) = v90;
LABEL_57:
                mDNS_SetupQuestion(v62 + 336, *(unsigned int *)(*(void *)(v62 + 1064) + 64), v98, v96, v62);
                *(unsigned char *)(v62 + 973) = 1;
                *(unsigned char *)(v62 + 971) = 1;
                *(unsigned char *)(v62 + 988) = 1;
                *(_WORD *)(v62 + 682) = 0;
                uint64_t v73 = *(void *)(v62 + 1064);
                *(_DWORD *)(v62 + 584) = *(_DWORD *)(v73 + 72);
                int v74 = *(unsigned __int16 *)(v62 + 678);
                *(_WORD *)(v62 + 1032) = v74;
                if (*(unsigned char *)(v73 + 76))
                {
                  if (v74 == 28)
                  {
                    if (*(unsigned char *)(v73 + 77))
                    {
                      *(_DWORD *)(v62 + 1036) = 1;
                      *(_WORD *)(v62 + 678) = 1;
                    }
                  }
                  else if (v74 == 12)
                  {
                    long long v93 = 0uLL;
                    if (GetReverseIPv6Addr((unsigned char *)(v62 + 80), &v93))
                    {
                      if (nw_nat64_extract_v4())
                      {
                        memset(v94, 0, 30);
                        mDNS_snprintf(v94);
                        *(unsigned char *)(v62 + 712) = 0;
                        AppendDNSNameString((unsigned char *)(v62 + 712), (unsigned __int8 *)v94, v75, v76, v77, v78, v79, v80);
                        *(_DWORD *)(v62 + 536) = DomainNameHashValue(v62 + 712);
                        *(_DWORD *)(v62 + 1036) = 2;
                      }
                    }
                  }
                }
                uint64_t v81 = &DNSProxyClients;
                do
                {
                  CFIndex v82 = v81;
                  uint64_t v81 = (uint64_t *)*v81;
                }
                while (v81);
                *CFIndex v82 = v62;
                mDNS_StartQuery((unsigned int *)mDNSStorage, v62 + 336);
                return;
              }
            }
            __break(1u);
          }
          if (mDNS_LoggingEnabled == 1) {
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: EDNS0 cannot be parsed for pkt from %#a:%d, ignoring", v37, v38, v39, v40, v41, (int)a4);
          }
        }
        else if (mDNS_LoggingEnabled == 1)
        {
          uint64_t v48 = mDNSLogCategory_Default;
          DNSTypeName(v96);
          LogMsgWithLevel(v48, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: EDNS0 opt not present in Question %##s (%s), ptr %p", v49, v50, v51, v52, v53, (int)v98);
        }
        unsigned int v90 = 0;
        goto LABEL_32;
      }
      if (mDNS_LoggingEnabled) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyCallbackCommon: Question cannot be parsed for pkt from %#a:%d", v23, v24, v25, v26, v27, (int)a4);
      }
    }
    unsigned __int16 v20 = v11;
    char v21 = 1;
LABEL_25:
    SendError(a1, (uint64_t)a2, a3, a4, v20, a6, v10, a8, v21);
  }
}

void SendError(unsigned __int16 *a1, uint64_t a2, int a3, int *a4, unsigned __int16 a5, uint64_t a6, int a7, _DWORD *a8, char a9)
{
  if (a3 - (int)a2 >= 8940) {
    int v15 = 8940;
  }
  else {
    int v15 = a3 - a2;
  }
  int v16 = *(_DWORD *)(a2 + 8);
  qword_10016BED8 = *(void *)a2;
  dword_10016BEE0 = v16;
  BYTE2(qword_10016BED8) |= 0x80u;
  BYTE3(qword_10016BED8) = a9;
  memcpy(&unk_10016BEE4, (const void *)(a2 + 12), (v15 - 12));
  unsigned int v17 = (char *)&qword_10016BED8 + v15;
  if (a7) {
    mDNSSendDNSMessage((uint64_t)mDNSStorage, (unint64_t)mDNSStorage + &loc_100007120, (unint64_t)v17, a6, a1, 0, a4, a5, 0, 0);
  }
  else {
    mDNSSendDNSMessage((uint64_t)mDNSStorage, (unint64_t)mDNSStorage + &loc_100007120, (unint64_t)v17, a6, 0, a1, a4, a5, 0, 0);
  }

  mDNSPlatformDisposeProxyContext(a8);
}

void DNSProxyPrepareOmsg(unsigned int a1, uint64_t a2)
{
  __int16 v3 = a1;
  size_t v4 = a1 + 12;
  uint64_t v5 = *(void *)(a2 + 1056);
  uint64_t v6 = (char *)malloc_type_calloc(1uLL, v4, 0xF1748037uLL);
  if (v6)
  {
    uint64_t v12 = v6;
    if (v5)
    {
      uint64_t v13 = *(const void **)(a2 + 1056);
      uint64_t v5 = *(void *)(a2 + 1040) - (void)v13 - 12;
      if (mDNS_LoggingEnabled == 1)
      {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "DNSProxyPrepareOmsg: Preserving offset %ld in size %d", v7, v8, v9, v10, v11, *(_DWORD *)(a2 + 1040) - v13 - 12);
        uint64_t v13 = *(const void **)(a2 + 1056);
      }
      if ((unint64_t)*(unsigned __int16 *)(a2 + 1048) + 12 >= v4) {
        size_t v14 = v4;
      }
      else {
        size_t v14 = *(unsigned __int16 *)(a2 + 1048) + 12;
      }
      memcpy(v12, v13, v14);
      int v15 = *(void **)(a2 + 1056);
      if (v15) {
        free(v15);
      }
    }
    *(void *)(a2 + 1056) = v12;
    *(_WORD *)(a2 + 1048) = v3;
    *(void *)(a2 + 1040) = &v12[v5 + 12];
  }
  else
  {
    __break(1u);
  }
}

void ProxyClientCallback(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a2;
  BOOL v10 = *a3 == 240 || *((unsigned __int16 *)a3 + 2) == *(unsigned __int16 *)(a2 + 342);
  BOOL v154 = v10;
  if (!a4) {
    return;
  }
  uint64_t v11 = *(void *)(a2 + 176);
  if (mDNS_LoggingEnabled == 1)
  {
    uint64_t v12 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
    LogMsgWithLevel(v12, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: %##s (%s)", v13, v14, v15, v16, v17, v11 + 80);
  }
  int v18 = *(_DWORD *)(v11 + 1036);
  if (!*(unsigned char *)(*(void *)(v11 + 1064) + 76))
  {
    if (v18 != 4) {
      goto LABEL_19;
    }
LABEL_130:
    uint64_t v123 = *(void *)(v11 + 1056);
    *(_WORD *)uint64_t v123 = *(_WORD *)(v11 + 30);
    *(_WORD *)(v123 + 2) = 896;
    *(void *)(v123 + 4) = 0;
    uint64_t v83 = putQuestion(*(void *)(v11 + 1056), *(void *)(v11 + 1056) + 12, *(void *)(v11 + 1056) + 12 + *(unsigned __int16 *)(v11 + 1048), (unsigned __int8 *)(v11 + 80), *(unsigned __int16 *)(v11 + 1032), *(unsigned __int16 *)(v11 + 680), a7, a8);
    if (v83) {
      BOOL v124 = 1;
    }
    else {
      BOOL v124 = mDNS_LoggingEnabled == 0;
    }
    if (!v124)
    {
      size_t v125 = mDNSLogCategory_Default;
      DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
      LogMsgWithLevel(v125, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: putQuestion NULL for %##s (%s)", v126, v127, v128, v129, v130, v11 + 80);
      uint64_t v83 = 0;
    }
    goto LABEL_142;
  }
  if (v18 == 4) {
    goto LABEL_130;
  }
  if (v18 == 2)
  {
    if (*a3 != 240 && *(_WORD *)(v8 + 342) == 12 && *((_WORD *)a3 + 2) == 12 && *((_WORD *)a3 + 3) == 1)
    {
      *(_DWORD *)(v11 + 1036) = 3;
      goto LABEL_19;
    }
    *(_DWORD *)(v11 + 1036) = 4;
    goto LABEL_130;
  }
  if (!v18 && *a3 == 240 && *(_WORD *)(v8 + 342) == 28 && *((_WORD *)a3 + 2) == 28 && *((_WORD *)a3 + 3) == 1)
  {
    mDNS_StopQuery((unsigned int *)a1, v8);
    *(_DWORD *)(v11 + 1036) = 1;
    *(_WORD *)(v8 + 342) = 1;
    mDNS_StartQuery((unsigned int *)a1, v8);
    return;
  }
LABEL_19:
  uint64_t v152 = v8;
  __src = (unsigned char *)(v11 + 712);
  unsigned int v19 = (unsigned __int8 *)(v11 + 80);
  unint64_t v20 = v11 + 968;
  char v21 = *(uint64_t **)(v11 + 1056);
  uint64_t v22 = *(void *)(v11 + 1040);
  v158 = (unsigned __int8 *)(v11 + 80);
  while (2)
  {
    uint64_t v165 = *v21;
    int v166 = *((_DWORD *)v21 + 2);
    int v167 = 0;
    mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"AddResourceRecord", 305);
    int v159 = dword_100164DF8;
    mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"AddResourceRecord", 307);
    if (*(unsigned char *)(v11 + 48))
    {
      unsigned __int16 v28 = *(_WORD *)(v11 + 1048);
LABEL_23:
      unsigned __int16 v29 = v28;
      goto LABEL_24;
    }
    unsigned __int16 v29 = *(_WORD *)(v11 + 68);
    unsigned __int16 v28 = *(_WORD *)(v11 + 1048);
    if ((unsigned __int16)(v29 - 1) >= v28) {
      goto LABEL_23;
    }
LABEL_24:
    unint64_t v160 = *(void *)(v11 + 1056) + v29 + 12;
    if (mDNS_LoggingEnabled == 1) {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Limit is %d", v23, v24, v25, v26, v27, v160 - *(_DWORD *)(v11 + 1040));
    }
    uint64_t v30 = CacheGroupForName((uint64_t)mDNSStorage, *(_DWORD *)(v11 + 536), __src);
    if (!v30)
    {
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: CacheGroup not found for %##s", v31, v32, v33, v34, v35, (int)__src);
      }
      uint64_t v48 = 0;
      int v82 = 0;
      goto LABEL_94;
    }
    v155 = v21;
    uint64_t v156 = v22;
    uint64_t v36 = v30[2];
    if (!v36)
    {
LABEL_80:
      if (mDNS_LoggingEnabled == 1) {
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Did not find any valid ResourceRecords", v31, v32, v33, v34, v35, v151);
      }
      uint64_t v48 = 0;
      int v82 = 0;
      goto LABEL_93;
    }
    uint64_t v37 = 0;
    unint64_t v38 = 0;
    int v39 = 12;
    while (1)
    {
      uint64_t v40 = (unsigned __int8 *)(v36 + 8);
      if (!SameNameRecordAnswersQuestion((unsigned __int8 *)(v36 + 8), 0, v11 + 336, v31, v32, v33, v34, v35)) {
        goto LABEL_65;
      }
      uint64_t v41 = *(_WORD **)(v11 + 1056);
      if (!v41[2]) {
        break;
      }
      if (!v38) {
        unint64_t v38 = *(void *)(v11 + 1040);
      }
LABEL_46:
      if (*v40 == 240)
      {
        BOOL v49 = 0;
      }
      else
      {
        long long v181 = 0u;
        memset(v182, 0, sizeof(v182));
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        memset(v168, 0, sizeof(v168));
        long long v163 = 0u;
        long long v164 = 0u;
        int v50 = *(unsigned __int8 *)(*(void *)(v11 + 1064) + 76);
        uint64_t v51 = (unsigned __int8 *)(v36 + 8);
        long long v161 = 0u;
        long long v162 = 0u;
        if (v50)
        {
          uint64_t v51 = (unsigned __int8 *)(v36 + 8);
          if (*(_DWORD *)(v11 + 1036) == 1)
          {
            uint64_t v51 = (unsigned __int8 *)(v36 + 8);
            if (*(_WORD *)(v36 + 12) == 1)
            {
              long long v52 = *(_OWORD *)(v36 + 24);
              long long v161 = *(_OWORD *)v40;
              long long v162 = v52;
              long long v53 = *(_OWORD *)(v36 + 56);
              *(void *)&long long v163 = *(void *)(v36 + 40);
              long long v164 = v53;
              WORD2(v161) = 28;
              WORD6(v161) = 16;
              LOWORD(v168[0]) = 16;
              *((void *)&v163 + 1) = v168;
              if (!nw_nat64_synthesize_v6()) {
                goto LABEL_65;
              }
              *(_OWORD *)((char *)v168 + 4) = 0uLL;
              uint64_t v51 = (unsigned __int8 *)&v161;
            }
          }
        }
        if (mDNS_LoggingEnabled == 1)
        {
          uint64_t v54 = mDNSLogCategory_Default;
          GetRRDisplayString_rdb(v51, (unsigned __int16 *)(*((void *)v51 + 5) + 4), word_100170570);
          unint64_t v20 = v11 + 968;
          LogMsgWithLevel(v54, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Answering question with %s", v55, v56, v57, v58, v59, (int)word_100170570);
        }
        uint64_t v60 = -274877907 * (v159 - *(_DWORD *)(v36 + 80));
        unint64_t v61 = PutResourceRecordTTLWithLimit(*(void *)(v11 + 1056), v38, (_WORD *)(*(void *)(v11 + 1056) + 6), (uint64_t)v51, (v60 >> 38) + ((unint64_t)v60 >> 63) + *(_DWORD *)(v36 + 16), v160, v34, v35);
        uint64_t v48 = *(unsigned char **)(v11 + 1040);
        if (!v61) {
          goto LABEL_92;
        }
        unint64_t v38 = v61;
        v39 += v61 - v48;
        *(void *)(v11 + 1040) = v61;
        BOOL v49 = *(unsigned __int16 *)(v36 + 12) == 5;
      }
      if (*(void *)(v36 + 120))
      {
        uint64_t v37 = *(void *)(v36 + 120);
        if (mDNS_LoggingEnabled == 1)
        {
          uint64_t v62 = mDNSLogCategory_Default;
          GetRRDisplayString_rdb((unsigned __int8 *)(v36 + 8), (unsigned __int16 *)(*(void *)(v36 + 48) + 4), word_100170570);
          LogMsgWithLevel(v62, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: soa set for %s", v63, v64, v65, v66, v67, (int)word_100170570);
          uint64_t v37 = *(void *)(v36 + 120);
        }
      }
      int v68 = *(unsigned __int16 *)(v36 + 12);
      if (*(unsigned __int16 *)(v11 + 678) != v68 && v68 == 5 && mDNS_LoggingEnabled)
      {
        uint64_t v69 = mDNSLogCategory_Default;
        GetRRDisplayString_rdb((unsigned __int8 *)(v36 + 8), (unsigned __int16 *)(*(void *)(v36 + 48) + 4), word_100170570);
        unint64_t v20 = v11 + 968;
        LogMsgWithLevel(v69, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: cname set for %s", v70, v71, v72, v73, v74, (int)word_100170570);
      }
      if (v49)
      {
LABEL_66:
        if (v37)
        {
          unsigned int v19 = (unsigned __int8 *)(v11 + 80);
          if (mDNS_LoggingEnabled == 1)
          {
            uint64_t v75 = mDNSLogCategory_Default;
            GetRRDisplayString_rdb((unsigned __int8 *)(v37 + 8), (unsigned __int16 *)(*(void *)(v37 + 48) + 4), word_100170570);
            LogMsgWithLevel(v75, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: SOA Answering question with %s", v76, v77, v78, v79, v80, (int)word_100170570);
          }
          unint64_t v81 = PutResourceRecordTTLWithLimit(*(void *)(v11 + 1056), v38, (_WORD *)(*(void *)(v11 + 1056) + 8), v37 + 8, *(unsigned int *)(v37 + 16), v160, v34, v35);
          uint64_t v48 = *(unsigned char **)(v11 + 1040);
          if (v81)
          {
            unint64_t v38 = v81;
            v39 += v81 - v48;
            *(void *)(v11 + 1040) = v81;
            goto LABEL_75;
          }
LABEL_90:
          int v82 = 1;
          goto LABEL_93;
        }
        unsigned int v19 = (unsigned __int8 *)(v11 + 80);
        if (!v38) {
          goto LABEL_80;
        }
LABEL_75:
        if (v154 && *(_WORD *)(v11 + 68))
        {
          uint64_t v83 = (unsigned char *)(v38 + 11);
          if (v38 + 11 <= v160)
          {
            ++*(_WORD *)(*(void *)(v11 + 1056) + 10);
            *(void *)unint64_t v38 = 271122432;
            *(_DWORD *)(v38 + 7) = 0;
            uint64_t v84 = "AddEDNS0 option added to response";
            uint64_t v22 = v156;
            if (mDNS_LoggingEnabled == 1) {
              goto LABEL_84;
            }
          }
          else
          {
            if ((mDNS_LoggingEnabled & 1) == 0)
            {
              uint64_t v48 = *(unsigned char **)(v11 + 1040);
              goto LABEL_90;
            }
            uint64_t v83 = 0;
            uint64_t v84 = "AddEDNS0Option: not enough space";
            uint64_t v22 = v156;
LABEL_84:
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, v84, v31, v32, v33, v34, v35, v151);
          }
          uint64_t v48 = *(unsigned char **)(v11 + 1040);
          if (!v83)
          {
            int v82 = 1;
            char v21 = v155;
            goto LABEL_94;
          }
          v39 += v83 - v48;
          *(void *)(v11 + 1040) = v83;
        }
        else
        {
          uint64_t v83 = (unsigned char *)v38;
        }
        uint64_t v8 = v152;
        if (mDNS_LoggingEnabled == 1) {
          LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: Added %d bytes to the packet", v31, v32, v33, v34, v35, v39);
        }
        goto LABEL_141;
      }
LABEL_65:
      uint64_t v36 = *(void *)v36;
      if (!v36) {
        goto LABEL_66;
      }
    }
    unsigned int v42 = *(_WORD *)(v36 + 110) & 0xFE | *(unsigned char *)(v11 + 50) & 1 | ((*(unsigned char *)(v11 + 51) & 0x10 | HIBYTE(*(unsigned __int16 *)(v36 + 110)) & 0xFFFFFFEF) << 8);
    *uint64_t v41 = *(_WORD *)(v11 + 30);
    v41[1] = v42;
    *(void *)(v41 + 2) = 0;
    uint64_t v43 = putQuestion(*(void *)(v11 + 1056), *(void *)(v11 + 1056) + 12, v160, v158, *(unsigned __int16 *)(v11 + 1032), *(unsigned __int16 *)(v11 + 680), v34, v35);
    if (v43)
    {
      unint64_t v38 = (unint64_t)v43;
      v39 += v43 - *(_DWORD *)(v11 + 1040);
      *(void *)(v11 + 1040) = v43;
      if (*(_DWORD *)(v11 + 1036) == 3)
      {
        long long v181 = 0u;
        memset(v182, 0, sizeof(v182));
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        memset(v168, 0, sizeof(v168));
        long long v164 = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        LOBYTE(v161) = -64;
        DWORD1(v161) = 65541;
        uint64_t v44 = (unsigned char *)(v11 + 712);
        long long v163 = (unint64_t)v158;
        if (v20)
        {
LABEL_36:
          if ((unint64_t)v44 < v20) {
            goto LABEL_37;
          }
        }
        else
        {
LABEL_37:
          while (v44)
          {
            uint64_t v45 = *v44;
            if (v45 > 0x3F) {
              break;
            }
            if (!*v44)
            {
              unsigned __int16 v46 = (_WORD)v44 - (_WORD)__src + 1;
              if (v46 <= 0x100u) {
                memcpy((char *)v168 + 4, __src, v46);
              }
              break;
            }
            v44 += v45 + 1;
            if (v20) {
              goto LABEL_36;
            }
          }
        }
        LOWORD(v168[0]) = 264;
        *((void *)&v163 + 1) = v168;
        unint64_t v47 = PutResourceRecordTTLWithLimit(*(void *)(v11 + 1056), v38, (_WORD *)(*(void *)(v11 + 1056) + 6), (uint64_t)&v161, 0, v160, v34, v35);
        uint64_t v48 = *(unsigned char **)(v11 + 1040);
        if (!v47) {
          goto LABEL_92;
        }
        unint64_t v38 = v47;
        v39 += v47 - v48;
        *(void *)(v11 + 1040) = v47;
      }
      goto LABEL_46;
    }
    if (mDNS_LoggingEnabled == 1)
    {
      uint64_t v85 = mDNSLogCategory_Default;
      unsigned int v19 = (unsigned __int8 *)(v11 + 80);
      DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
      LogMsgWithLevel(v85, OS_LOG_TYPE_DEFAULT, "AddResourceRecord: putQuestion NULL for %##s (%s)", v86, v87, v88, v89, v90, (int)v158);
      uint64_t v48 = 0;
      goto LABEL_90;
    }
    uint64_t v48 = 0;
LABEL_92:
    int v82 = 1;
    unsigned int v19 = (unsigned __int8 *)(v11 + 80);
LABEL_93:
    char v21 = v155;
    uint64_t v22 = v156;
LABEL_94:
    if (*(unsigned char *)(v11 + 48))
    {
      unsigned int v91 = 8940;
    }
    else
    {
      unsigned int v92 = *(unsigned __int16 *)(v11 + 68);
      if (*(_WORD *)(v11 + 68))
      {
        if (v92 - 12 >= 0x22EC) {
          int v93 = 8940;
        }
        else {
          int v93 = (unsigned __int16)(v92 - 12);
        }
        if (v92 <= 0xC) {
          unsigned int v91 = 500;
        }
        else {
          unsigned int v91 = v93;
        }
      }
      else
      {
        unsigned int v91 = 500;
      }
    }
    if (*(unsigned __int16 *)(v11 + 1048) < v91)
    {
      if (mDNS_LoggingEnabled == 1)
      {
        __int16 v94 = mDNSLogCategory_Default;
        DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
        LogMsgWithLevel(v94, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: Increase omsg buffer size to %d for %##s (%s)", v95, v96, v97, v98, v99, v91);
      }
      uint64_t v100 = v22 - (void)v21 - 12;
      DNSProxyPrepareOmsg(v91, v11);
      uint64_t v101 = *(void *)(v11 + 1056);
      *(void *)uint64_t v101 = v165;
      *(_DWORD *)(v101 + 8) = v166;
      char v21 = *(uint64_t **)(v11 + 1056);
      uint64_t v22 = (uint64_t)v21 + v100 + 12;
      *(void *)(v11 + 1040) = v22;
      continue;
    }
    break;
  }
  if (mDNS_LoggingEnabled == 1)
  {
    __int16 v102 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
    LogMsgWithLevel(v102, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: AddResourceRecord NULL for %##s (%s)", v103, v104, v105, v106, v107, (int)v19);
  }
  if (v48) {
    int v108 = v82;
  }
  else {
    int v108 = 0;
  }
  uint64_t v8 = v152;
  if (v108 == 1)
  {
    if (*(unsigned char *)(v11 + 48))
    {
      if (mDNS_LoggingEnabled == 1)
      {
        v109 = mDNSLogCategory_Default;
        DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
        LogMsgWithLevel(v109, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: ERROR!! Not enough space to return in TCP for %##s (%s)", v110, v111, v112, v113, v114, (int)v19);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(v11 + 1056) + 2) |= 2u;
    }
    uint64_t v83 = v48;
    goto LABEL_141;
  }
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: No response", v31, v32, v33, v34, v35, v151);
  }
  __int16 v115 = *(_WORD *)(v11 + 682);
  if (!v115) {
    __int16 v115 = 640;
  }
  uint64_t v116 = *(void *)(v11 + 1056);
  *(_WORD *)uint64_t v116 = *(_WORD *)(v11 + 30);
  *(_WORD *)(v116 + 2) = v115;
  *(void *)(v116 + 4) = 0;
  uint64_t v83 = putQuestion(*(void *)(v11 + 1056), *(void *)(v11 + 1056) + 12, *(void *)(v11 + 1056) + 12 + *(unsigned __int16 *)(v11 + 1048), v19, *(unsigned __int16 *)(v11 + 1032), *(unsigned __int16 *)(v11 + 680), v34, v35);
  if (v83)
  {
LABEL_141:
    if (!v154)
    {
      if (mDNS_LoggingEnabled == 1)
      {
        v145 = mDNSLogCategory_Default;
        GetRRDisplayString_rdb(a3, (unsigned __int16 *)(*((void *)a3 + 5) + 4), (unsigned char *)(a1 + 47032));
        LogMsgWithLevel(v145, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: Received %s, not answering yet", v146, v147, v148, v149, v150, a1 + 47032);
      }
      return;
    }
LABEL_142:
    unint64_t v131 = *(void *)(v11 + 1056);
    uint64_t v132 = *(void *)(v11 + 32);
    BOOL v133 = *(unsigned __int16 **)(v11 + 40);
    __int16 v134 = (int *)(v11 + 8);
    unsigned __int16 v135 = *(_WORD *)(v11 + 28);
    if (*(unsigned char *)(v11 + 48)) {
      mDNSSendDNSMessage(a1, v131, (unint64_t)v83, v132, v133, 0, v134, v135, 0, 0);
    }
    else {
      mDNSSendDNSMessage(a1, v131, (unint64_t)v83, v132, 0, v133, v134, v135, 0, 0);
    }
    goto LABEL_145;
  }
  if (mDNS_LoggingEnabled == 1)
  {
    uint64_t v117 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v11 + 1032));
    LogMsgWithLevel(v117, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: putQuestion NULL for %##s (%s)", v118, v119, v120, v121, v122, (int)v19);
  }
LABEL_145:
  mDNS_StopQuery((unsigned int *)a1, v8);
  __int16 v136 = &DNSProxyClients;
  do
  {
    uint64_t v137 = v136;
    __int16 v136 = (uint64_t *)*v136;
    if (v136) {
      BOOL v138 = v136 == (uint64_t *)v11;
    }
    else {
      BOOL v138 = 1;
    }
  }
  while (!v138);
  if (v136)
  {
    *uint64_t v137 = *(void *)v11;
    mDNSPlatformDisposeProxyContext(*(_DWORD **)(v11 + 72));
    FreeDNSProxyClient((void *)v11);
  }
  else
  {
    uint64_t v139 = mDNSLogCategory_Default;
    DNSTypeName(*(unsigned __int16 *)(v8 + 342));
    LogMsgWithLevel(v139, OS_LOG_TYPE_DEFAULT, "ProxyClientCallback: question %##s (%s) not found", v140, v141, v142, v143, v144, v8 + 376);
  }
}

void ProxyUDPCallback(unsigned __int16 *a1, unsigned __int8 *a2, unint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  unsigned __int16 v10 = a5;
  if (mDNS_LoggingEnabled == 1) {
    LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyUDPCallback: DNS Message from %#a:%d to %#a:%d length %d", (uint64_t)a4, a5, a6, a7, a8, (int)a4);
  }

  ProxyCallbackCommon(a1, a2, a3, a4, v10, a8, 0, a9);
}

void dnssec_query_record_result_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a2 + 144);
  if (!v4 || !*(unsigned char *)(v4 + 24))
  {
    uint64_t v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)uint64_t v86 = "dns_question_is_primary_dnssec_requestor(question)";
    *(_WORD *)&v86[8] = 2082;
    *(void *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)uint64_t v88 = 145;
    *(_WORD *)&v88[4] = 2048;
    uint64_t v89 = 0;
    uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }
  if (a4 > 1) {
    return;
  }
  uint64_t v7 = &unk_100170000;
  uint64_t v8 = &unk_100164000;
  uint64_t v9 = &unk_100170000;
  if (!*((void *)a3 + 7))
  {
    uint64_t v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)uint64_t v86 = "answer->dnssec != NULL";
    *(_WORD *)&v86[8] = 2082;
    *(void *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)uint64_t v88 = 155;
    *(_WORD *)&v88[4] = 2048;
    uint64_t v89 = 0;
    uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v12 = *(void *)(v11 + 64);
  if (*(void *)(v12 + 96) == a2)
  {
    uint64_t v64 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)uint64_t v86 = "!_is_insecure_validation_question(dnssec_context, question)";
    *(_WORD *)&v86[8] = 2082;
    *(void *)&v86[10] = "";
    *(_WORD *)&v86[18] = 2082;
    *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)uint64_t v88 = 156;
    *(_WORD *)&v88[4] = 2048;
    uint64_t v89 = 0;
    uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
    goto LABEL_138;
  }
  uint64_t v13 = a1;
  uint64_t v83 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, uint64_t))(v11 + 40);
  int v84 = *(unsigned __int8 *)(v11 + 36);
  uint64_t v14 = *(_DWORD **)(a1 + 20000);
  uint64_t v15 = *(void **)(v11 + 56);
  if (v15 != (void *)v14)
  {
    if (v14) {
      ++*v14;
    }
    if (v15)
    {
      ref_count_obj_release(v15);
      uint64_t v12 = *(void *)(v11 + 64);
    }
    *(void *)(v11 + 56) = v14;
  }
  *(_WORD *)(v12 + 24) = bswap32(*(unsigned __int16 *)(*(void *)(v11 + 24) + 340)) >> 16;
  uint64_t v16 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *((void *)a3 + 4);
      if (v22)
      {
        uint64_t v23 = (unsigned char *)*((void *)a3 + 4);
        if (v22 == -256) {
          goto LABEL_31;
        }
LABEL_28:
        unsigned __int16 v24 = 257;
        if ((unint64_t)v23 < v22 + 256 && v23)
        {
          while (1)
          {
            uint64_t v25 = *v23;
            if (v25 > 0x3F)
            {
LABEL_39:
              unsigned __int16 v24 = 257;
              goto LABEL_55;
            }
            if (!*v23) {
              break;
            }
            v23 += v25 + 1;
            if (v22 != -256) {
              goto LABEL_28;
            }
LABEL_31:
            if (!v23) {
              goto LABEL_39;
            }
          }
          unsigned __int16 v24 = (_WORD)v23 - v22 + 1;
        }
LABEL_55:
        int v72 = v24;
      }
      else
      {
        int v72 = 0;
      }
      BOOL v77 = *a3 != 240;
      uint64_t v36 = *((void *)a3 + 7);
      if (v36)
      {
        if (*(_DWORD *)(v36 + 32) || *(unsigned char *)(v36 + 40)) {
          uint64_t v37 = 0;
        }
        else {
          uint64_t v37 = *(void *)(v36 + 48);
        }
        BOOL v75 = v37 != 0;
      }
      else
      {
        BOOL v75 = 0;
      }
      unsigned int v38 = bswap32(*(unsigned __int16 *)(a2 + 340));
      uint64_t v39 = *((void *)a3 + 3);
      uint64_t v40 = v39 + 5;
      uint64_t v82 = v13;
      if (unint64_t)(v39 + 5) < 6 && ((0x2Du >> v40)) {
        LODWORD(v39) = dword_10010BCC8[v40];
      }
      unsigned int v41 = HIWORD(v38);
      int v42 = *(unsigned __int16 *)(a2 + 342);
      int v43 = *((unsigned __int16 *)a3 + 2);
      int v79 = a3[2];
      int loga = *((_DWORD *)a3 + 2);
      int actual_ttl = resource_record_get_actual_ttl(v82, (uint64_t)a3);
      uint64_t v45 = *((void *)a3 + 7);
      if (v45) {
        LODWORD(v45) = *(_DWORD *)(v45 + 32) == 1;
      }
      *(_DWORD *)buf = 67112451;
      *(_DWORD *)uint64_t v86 = v41;
      *(_WORD *)&v86[4] = 2160;
      *(void *)&v86[6] = 1752392040;
      *(_WORD *)&v86[14] = 1040;
      *(_DWORD *)&v86[16] = v72;
      *(_WORD *)uint64_t v87 = 2101;
      *(void *)&v87[2] = v22;
      *(_WORD *)uint64_t v88 = 1024;
      *(_DWORD *)&v88[2] = v42;
      LOWORD(v89) = 1024;
      *(_DWORD *)((char *)&v89 + 2) = v43;
      HIWORD(v89) = 1024;
      BOOL v90 = v77;
      __int16 v91 = 1024;
      BOOL v92 = v75;
      __int16 v93 = 1024;
      int v94 = a4;
      __int16 v95 = 1024;
      int v96 = v39;
      __int16 v97 = 1024;
      int v98 = v79;
      __int16 v99 = 1024;
      int v100 = loga;
      __int16 v101 = 1024;
      int v102 = actual_ttl;
      __int16 v103 = 1024;
      int v104 = v45;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[Q%u] DNSSEC record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rrtype: %{mdns:rrtype}d, %{mdns:pos/neg}d, contains denial: %{mdns:yesno}d, %{mdns:addrmv}d, interface index: %d, motality: %{mdns:mortality}d, original ttl: %u, actual ttl: %u, validated: %{mdns:yesno}d.", buf, 0x5Eu);
      uint64_t v9 = &unk_100170000;
      uint64_t v8 = &unk_100164000;
      uint64_t v7 = &unk_100170000;
      uint64_t v13 = v82;
    }
  }
  else
  {
    uint64_t v17 = mDNSLogCategory_DNSSEC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *((void *)a3 + 4);
      if (v18)
      {
        unsigned int v19 = (unsigned char *)*((void *)a3 + 4);
        if (v18 == -256) {
          goto LABEL_20;
        }
LABEL_17:
        unsigned __int16 v20 = 257;
        if ((unint64_t)v19 < v18 + 256 && v19)
        {
          while (1)
          {
            uint64_t v21 = *v19;
            if (v21 > 0x3F)
            {
LABEL_38:
              unsigned __int16 v20 = 257;
              goto LABEL_41;
            }
            if (!*v19) {
              break;
            }
            v19 += v21 + 1;
            if (v18 != -256) {
              goto LABEL_17;
            }
LABEL_20:
            if (!v19) {
              goto LABEL_38;
            }
          }
          unsigned __int16 v20 = (_WORD)v19 - v18 + 1;
        }
LABEL_41:
        int v71 = v20;
      }
      else
      {
        int v71 = 0;
      }
      BOOL v74 = *a3 != 240;
      uint64_t v26 = *((void *)a3 + 7);
      if (v26)
      {
        if (*(_DWORD *)(v26 + 32) || *(unsigned char *)(v26 + 40)) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = *(void *)(v26 + 48);
        }
        BOOL v73 = v27 != 0;
      }
      else
      {
        BOOL v73 = 0;
      }
      unsigned int v28 = bswap32(*(unsigned __int16 *)(a2 + 340));
      uint64_t v29 = *((void *)a3 + 3);
      uint64_t v30 = v29 + 5;
      log = v17;
      if (unint64_t)(v29 + 5) < 6 && ((0x2Du >> v30)) {
        LODWORD(v29) = dword_10010BCE0[v30];
      }
      unsigned int v31 = HIWORD(v28);
      int v32 = *(unsigned __int16 *)(a2 + 342);
      int v33 = *((unsigned __int16 *)a3 + 2);
      int v76 = a3[2];
      int v78 = *((_DWORD *)a3 + 2);
      int v34 = resource_record_get_actual_ttl(v13, (uint64_t)a3);
      uint64_t v35 = *((void *)a3 + 7);
      if (v35) {
        LODWORD(v35) = *(_DWORD *)(v35 + 32) == 1;
      }
      *(_DWORD *)buf = 67112451;
      *(_DWORD *)uint64_t v86 = v31;
      *(_WORD *)&v86[4] = 2160;
      *(void *)&v86[6] = 1752392040;
      *(_WORD *)&v86[14] = 1040;
      *(_DWORD *)&v86[16] = v71;
      *(_WORD *)uint64_t v87 = 2101;
      *(void *)&v87[2] = v18;
      *(_WORD *)uint64_t v88 = 1024;
      *(_DWORD *)&v88[2] = v32;
      LOWORD(v89) = 1024;
      *(_DWORD *)((char *)&v89 + 2) = v33;
      HIWORD(v89) = 1024;
      BOOL v90 = v74;
      __int16 v91 = 1024;
      BOOL v92 = v73;
      __int16 v93 = 1024;
      int v94 = a4;
      __int16 v95 = 1024;
      int v96 = v29;
      __int16 v97 = 1024;
      int v98 = v76;
      __int16 v99 = 1024;
      int v100 = v78;
      __int16 v101 = 1024;
      int v102 = v34;
      __int16 v103 = 1024;
      int v104 = v35;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[Q%u] DNSSEC record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rrtype: %{mdns:rrtype}d, %{mdns:pos/neg}d, contains denial: %{mdns:yesno}d, %{mdns:addrmv}d, interface index: %d, motality: %{mdns:mortality}d, original ttl: %u, actual ttl: %u, validated: %{mdns:yesno}d.", buf, 0x5Eu);
      uint64_t v9 = (void *)&unk_100170000;
      uint64_t v8 = (void *)&unk_100164000;
      uint64_t v7 = (unsigned char *)&unk_100170000;
    }
  }
  uint64_t v46 = *((void *)a3 + 7);
  if (v46)
  {
    int v47 = *(_DWORD *)(v46 + 32);
    if (v47)
    {
      if (v47 == 1 && (v84 || *a3 != 240 && (*((_WORD *)a3 + 2) != 5 || *(_WORD *)(a2 + 342) == 5))) {
        v83(v13, a2, a3, a4);
      }
      return;
    }
    uint64_t v48 = *(void *)(v11 + 64);
    if (a4 != 1)
    {
      dnssec_obj_validation_manager_remove_validated_cache(*(void *)(v11 + 64));
      uint64_t v51 = *(void *)(v11 + 64);
      if (*a3 == 240) {
        uint64_t v52 = 40;
      }
      else {
        uint64_t v52 = 32;
      }
      uint64_t v53 = *(void *)(v51 + v52);
      if (!v53) {
        goto LABEL_140;
      }
      int v54 = dnssec_obj_rrset_remove_rr(v53, a3);
      if (!v54)
      {
        uint64_t v55 = *(void **)(v51 + v52);
        if (!v55[4] && v55)
        {
          ref_count_obj_release(v55);
          *(void *)(v51 + v52) = 0;
        }
        *(void *)(v51 + 48) = 0xFFFFE5C200000000;
        *(_DWORD *)(v51 + 140) = 0;
        *(unsigned char *)(v51 + 144) = 0;
        if (*((_WORD *)a3 + 2) == 46) {
          *(unsigned char *)(v51 + 72) = 1;
        }
        goto LABEL_106;
      }
      if (v54 == -6727)
      {
LABEL_140:
        uint64_t v58 = v8[401];
        if (v7[2400] != 1 || v58 == v9[294])
        {
          if (!os_log_type_enabled((os_log_t)v8[401], OS_LOG_TYPE_DEBUG)) {
            return;
          }
        }
        else
        {
          uint64_t v58 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG)) {
            return;
          }
        }
        unsigned int v69 = bswap32(*(unsigned __int16 *)(a2 + 340)) >> 16;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v86 = v69;
        uint64_t v60 = "[Q%u] Added record not found due to possible primary DNSSEC question change";
        goto LABEL_110;
      }
      uint64_t v70 = v54;
      uint64_t v64 = v8[401];
      if (v7[2400] != 1 || v64 == v9[294])
      {
        if (!os_log_type_enabled((os_log_t)v8[401], OS_LOG_TYPE_FAULT)) {
          return;
        }
      }
      else
      {
        uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
          return;
        }
      }
      *(_DWORD *)buf = 136447234;
      *(void *)uint64_t v86 = "err == 0";
      *(_WORD *)&v86[8] = 2082;
      *(void *)&v86[10] = "";
      *(_WORD *)&v86[18] = 2082;
      *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
      *(_WORD *)&v87[8] = 1024;
      *(_DWORD *)uint64_t v88 = 207;
      *(_WORD *)&v88[4] = 2048;
      uint64_t v89 = v70;
      uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
LABEL_138:
      unint64_t v61 = v64;
      os_log_type_t v62 = OS_LOG_TYPE_FAULT;
      uint32_t v63 = 48;
      goto LABEL_111;
    }
    *(_DWORD *)buf = 0;
    uint64_t v49 = 32;
    if (*a3 == 240) {
      uint64_t v49 = 40;
    }
    int v50 = *(void **)(v48 + v49);
    if (v50)
    {
      ++*(_DWORD *)v50;
    }
    else
    {
      int v50 = dnssec_obj_rrset_create(*(_DWORD **)(v48 + 16), *(_DWORD *)(v48 + 136), buf);
      if (*(_DWORD *)buf)
      {
LABEL_100:
        ref_count_obj_release(v50);
        uint64_t v57 = *(int *)buf;
        if (*(_DWORD *)buf == -6730)
        {
          uint64_t v58 = v8[401];
          if (v7[2400] != 1 || v58 == v9[294])
          {
            if (!os_log_type_enabled((os_log_t)v8[401], OS_LOG_TYPE_DEBUG)) {
              return;
            }
          }
          else
          {
            uint64_t v58 = mDNSLogCategory_DNSSEC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG)) {
              return;
            }
          }
          unsigned int v59 = bswap32(*(unsigned __int16 *)(a2 + 340)) >> 16;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v86 = v59;
          uint64_t v60 = "[Q%u] Getting duplicate record add event due to possible primary DNSSEC question change";
LABEL_110:
          unint64_t v61 = v58;
          os_log_type_t v62 = OS_LOG_TYPE_DEBUG;
          uint32_t v63 = 8;
LABEL_111:
          _os_log_impl((void *)&_mh_execute_header, v61, v62, v60, buf, v63);
          return;
        }
        if (!*(_DWORD *)buf)
        {
LABEL_106:
          _dnssec_fetch_key_records(v11);
          _dnssec_make_validation_progress(*(void *)(v11 + 64));
          _dnssec_fetch_key_records(v11);
          return;
        }
        uint64_t v64 = v8[401];
        if (v7[2400] != 1 || v64 == v9[294])
        {
          if (!os_log_type_enabled((os_log_t)v8[401], OS_LOG_TYPE_FAULT)) {
            return;
          }
        }
        else
        {
          uint64_t v64 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
            return;
          }
        }
        *(_DWORD *)buf = 136447234;
        *(void *)uint64_t v86 = "err == 0";
        *(_WORD *)&v86[8] = 2082;
        *(void *)&v86[10] = "";
        *(_WORD *)&v86[18] = 2082;
        *(void *)uint64_t v87 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
        *(_WORD *)&v87[8] = 1024;
        *(_DWORD *)uint64_t v88 = 193;
        *(_WORD *)&v88[4] = 2048;
        uint64_t v89 = v57;
        uint64_t v60 = "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld";
        goto LABEL_138;
      }
    }
    *(_DWORD *)buf = dnssec_obj_rrset_add_rr((uint64_t)v50, a3);
    if (!*(_DWORD *)buf)
    {
      if (*a3 == 240) {
        uint64_t v56 = (void *)(v48 + 40);
      }
      else {
        uint64_t v56 = (void *)(v48 + 32);
      }
      if (!*v56)
      {
        *uint64_t v56 = v50;
        ++*(_DWORD *)v50;
      }
      *(void *)(v48 + 48) = 0xFFFFE5C200000000;
      *(_DWORD *)(v48 + 140) = 0;
      *(unsigned char *)(v48 + 144) = 0;
      *(_DWORD *)buf = 0;
    }
    goto LABEL_100;
  }
}

void _dnssec_fetch_key_records(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (*(_DWORD *)(v1 + 48)) {
    return;
  }
  if (dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(*(void *)(v1 + 32), *(void *)(v1 + 40)))
  {
    if (!*(_DWORD *)(v1 + 112))
    {
      dnssec_obj_validation_manager_start_insecure_validation(v1, a1);
    }
    return;
  }
  int v55 = 0;
  if (*(void *)(v1 + 56) && !*(unsigned char *)(v1 + 72)) {
    return;
  }
  *(_DWORD *)buf = 0;
  uint64_t v3 = *(void *)(v1 + 32);
  if (!v3 || *(_DWORD *)(v3 + 40) == 3 || !*(void *)(v3 + 32))
  {
    uint64_t v4 = 0;
    goto LABEL_17;
  }
  uint64_t v4 = dnssec_obj_rrset_copy_signer_name(v3, (int *)buf);
  int v5 = *(_DWORD *)buf;
  if (!*(_DWORD *)buf || *(_DWORD *)buf == -6727)
  {
LABEL_17:
    uint64_t v8 = *(void *)(v1 + 40);
    if (v8 && *(_DWORD *)(v8 + 40) != 3 && *(void *)(v8 + 32))
    {
      uint64_t v7 = dnssec_obj_rrset_copy_signer_name(v8, (int *)buf);
      int v5 = *(_DWORD *)buf;
      if (*(_DWORD *)buf && *(_DWORD *)buf != -6727)
      {
        uint64_t v6 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    if (v4) {
      uint64_t v6 = (uint64_t)v4;
    }
    else {
      uint64_t v6 = (uint64_t)v7;
    }
    if (v6)
    {
      int v5 = 0;
      ++*(_DWORD *)v6;
      *(_DWORD *)buf = 0;
    }
    else
    {
      int v5 = -6745;
      *(_DWORD *)buf = -6745;
    }
    goto LABEL_29;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
LABEL_29:
  int v55 = v5;
  if (v4) {
    ref_count_obj_release(v4);
  }
  if (v7) {
    ref_count_obj_release(v7);
  }
  int v9 = v55;
  if (v55)
  {
    uint64_t v17 = 0;
    goto LABEL_117;
  }
  uint64_t v10 = *(void *)(v1 + 32);
  if (!v10) {
    goto LABEL_42;
  }
  if (dnssec_obj_rrset_get_rr_type(v10) == 43
    && !ref_count_obj_compare(*(void *)(v1 + 16), v6, 1))
  {
    goto LABEL_135;
  }
  uint64_t v11 = *(void *)(v1 + 32);
  if (v11)
  {
    if (dnssec_obj_rrset_is_dnskey(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 48;
    }
    int rr_class = dnssec_obj_rrset_get_rr_class(*(void *)(v1 + 32));
  }
  else
  {
LABEL_42:
    uint64_t v14 = *(void *)(v1 + 40);
    if (!v14)
    {
      uint64_t v17 = 0;
      int v9 = -6745;
      goto LABEL_112;
    }
    int rr_class = dnssec_obj_rrset_get_rr_class(v14);
    int v12 = 48;
  }
  uint64_t v15 = *(void *)(v1 + 56);
  if (!v15 || !*(unsigned char *)(v1 + 72))
  {
    uint64_t v17 = 0;
    goto LABEL_77;
  }
  if (*(unsigned __int16 *)(v15 + 342) != v12 || *(unsigned __int16 *)(v15 + 344) != rr_class)
  {
    uint64_t v17 = 0;
    int v9 = -6700;
    goto LABEL_112;
  }
  uint64_t v16 = dnssec_obj_domain_name_create_with_labels((unsigned __int8 *)(v15 + 376), 0, &v55);
  uint64_t v17 = v16;
  int v9 = v55;
  if (v55)
  {
LABEL_117:
    *(_DWORD *)(v1 + 48) = 3;
    *(_DWORD *)(v1 + 52) = v9;
LABEL_118:
    if (!v6) {
      goto LABEL_120;
    }
    goto LABEL_119;
  }
  *(unsigned char *)(v1 + 72) = 0;
  int v18 = ref_count_obj_compare((uint64_t)v16, v6, 1);
  char v19 = gSensitiveLoggingEnabled;
  unsigned __int16 v20 = mDNSLogCategory_DNSSEC;
  if (mDNSLogCategory_DNSSEC == mDNSLogCategory_State) {
    char v19 = 0;
  }
  if (v18)
  {
    if (v19)
    {
      unsigned __int16 v20 = mDNSLogCategory_DNSSEC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
      {
        if (v6)
        {
          int v21 = *(_DWORD *)(v6 + 24);
          uint64_t v22 = *(void *)(v6 + 16);
        }
        else
        {
          int v21 = 0;
          uint64_t v22 = 0;
        }
        int v30 = *(unsigned __int16 *)(v1 + 24);
        if (v17)
        {
          int v31 = *((_DWORD *)v17 + 6);
          uint64_t v32 = *((void *)v17 + 2);
        }
        else
        {
          int v31 = 0;
          uint64_t v32 = 0;
        }
LABEL_75:
        *(_DWORD *)buf = 67110915;
        int v58 = v30;
        __int16 v59 = 2160;
        *(void *)uint64_t v60 = 1752392040;
        *(_WORD *)&v60[8] = 1040;
        *(_DWORD *)&v60[10] = v21;
        __int16 v61 = 2101;
        *(void *)os_log_type_t v62 = v22;
        *(_WORD *)&v62[8] = 2160;
        *(void *)&v62[10] = 1752392040;
        *(_WORD *)&v62[18] = 1040;
        int v63 = v31;
        __int16 v64 = 2101;
        uint64_t v65 = v32;
        __int16 v66 = 1024;
        int v67 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[Q%u] New validation key requestor replaces the old one - new name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, old name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d", buf, 0x42u);
      }
    }
    else if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
    {
      if (v6)
      {
        int v21 = *(_DWORD *)(v6 + 24);
        uint64_t v22 = *(void *)(v6 + 16);
      }
      else
      {
        int v21 = 0;
        uint64_t v22 = 0;
      }
      int v30 = *(unsigned __int16 *)(v1 + 24);
      if (v17)
      {
        int v31 = *((_DWORD *)v17 + 6);
        uint64_t v32 = *((void *)v17 + 2);
      }
      else
      {
        int v31 = 0;
        uint64_t v32 = 0;
      }
      goto LABEL_75;
    }
    _dnssec_obj_validation_manager_reset_validation_key_requestor(v1);
LABEL_77:
    if (v12 != 43) {
      goto LABEL_101;
    }
    int v33 = **(unsigned __int8 **)(v6 + 16);
    int v34 = *(_DWORD *)(a1 + 48);
    uint64_t v35 = *(void **)(v1 + 120);
    if (!v35)
    {
      uint64_t v36 = *(void *)(a1 + 56);
      if (v36)
      {
        *(void *)(v1 + 128) = 0;
        uint64_t v37 = (void *)(v36 + 16);
        do
        {
          uint64_t v37 = (void *)*v37;
          if (!v37)
          {
            uint64_t v35 = 0;
            int v42 = -6727;
LABEL_92:
            int v55 = v42;
            *(void *)(v1 + 120) = v35;
            *(_DWORD *)(v1 + 140) = 0;
            *(unsigned char *)(v1 + 144) = 0;
            goto LABEL_93;
          }
        }
        while (ref_count_obj_compare(*(void *)(*(void *)(v37[2] + 16) + 16), v6, 1));
        size_t v38 = 0;
        uint64_t v39 = v37;
        do
        {
          ++v38;
          uint64_t v39 = (void *)v39[1];
        }
        while (v39);
        if (v38)
        {
          if (!(v38 >> 61))
          {
            uint64_t v35 = malloc_type_calloc(v38, 8uLL, 0xF1748037uLL);
            if (v35)
            {
              uint64_t v40 = *(void *)(v1 + 128);
              do
              {
                unsigned int v41 = (_DWORD *)v37[2];
                v35[v40] = v41;
                ++*v41;
                ++v40;
                uint64_t v37 = (void *)v37[1];
              }
              while (v37);
              int v42 = 0;
              *(void *)(v1 + 128) = v40;
              goto LABEL_92;
            }
          }
        }
        __break(1u);
LABEL_135:
        uint64_t v51 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
          {
            int v52 = *(unsigned __int16 *)(v1 + 24);
            if (v6)
            {
              int v53 = *(_DWORD *)(v6 + 24);
              uint64_t v54 = *(void *)(v6 + 16);
            }
            else
            {
              int v53 = 0;
              uint64_t v54 = 0;
            }
            goto LABEL_145;
          }
        }
        else
        {
          uint64_t v51 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
          {
            int v52 = *(unsigned __int16 *)(v1 + 24);
            if (v6)
            {
              int v53 = *(_DWORD *)(v6 + 24);
              uint64_t v54 = *(void *)(v6 + 16);
            }
            else
            {
              int v53 = 0;
              uint64_t v54 = 0;
            }
LABEL_145:
            *(_DWORD *)buf = 67109891;
            int v58 = v52;
            __int16 v59 = 2160;
            *(void *)uint64_t v60 = 1752392040;
            *(_WORD *)&v60[8] = 1040;
            *(_DWORD *)&v60[10] = v53;
            __int16 v61 = 2101;
            *(void *)os_log_type_t v62 = v54;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "[Q%u] Unable to continue the trust chain validation since DS is self-signed - name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x22u);
          }
        }
        uint64_t v17 = 0;
        int v9 = -88993;
        goto LABEL_112;
      }
    }
LABEL_93:
    if (v34 == 1)
    {
      if (v35) {
        goto LABEL_127;
      }
    }
    else
    {
      if (v34)
      {
        int v9 = -6735;
        goto LABEL_112;
      }
      if (v35)
      {
        if (*(unsigned char *)(v1 + 144))
        {
          if (!v33)
          {
LABEL_98:
            int v9 = -6754;
            goto LABEL_112;
          }
LABEL_101:
          int v56 = 0;
          if (*(void *)(v1 + 64))
          {
            int v9 = -6709;
            goto LABEL_112;
          }
          uint64_t started = _dnssec_obj_validation_manager_start_sub_query(v6, rr_class, v12, 0x200000, a1, (uint64_t)_dnssec_query_key_record_result_reply, &v56);
          *(void *)(v1 + 56) = started;
          int v9 = v56;
          if (v56)
          {
LABEL_112:
            int v55 = v9;
            goto LABEL_117;
          }
          uint64_t v44 = started;
          uint64_t v45 = mDNSLogCategory_DNSSEC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
              goto LABEL_116;
            }
            int v46 = *(unsigned __int16 *)(v1 + 24);
            unsigned int v47 = bswap32(*((unsigned __int16 *)v44 + 170)) >> 16;
            if (v6)
            {
              int v48 = *(_DWORD *)(v6 + 24);
              uint64_t v49 = *(void *)(v6 + 16);
            }
            else
            {
              int v48 = 0;
              uint64_t v49 = 0;
            }
          }
          else
          {
            uint64_t v45 = mDNSLogCategory_DNSSEC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
              goto LABEL_116;
            }
            int v46 = *(unsigned __int16 *)(v1 + 24);
            unsigned int v47 = bswap32(*((unsigned __int16 *)v44 + 170)) >> 16;
            if (v6)
            {
              int v48 = *(_DWORD *)(v6 + 24);
              uint64_t v49 = *(void *)(v6 + 16);
            }
            else
            {
              int v48 = 0;
              uint64_t v49 = 0;
            }
          }
          *(_DWORD *)buf = 67110403;
          int v58 = v46;
          __int16 v59 = 1024;
          *(_DWORD *)uint64_t v60 = v47;
          *(_WORD *)&v60[4] = 2160;
          *(void *)&v60[6] = 1752392040;
          __int16 v61 = 1040;
          *(_DWORD *)os_log_type_t v62 = v48;
          *(_WORD *)&v62[4] = 2101;
          *(void *)&v62[6] = v49;
          *(_WORD *)&v62[14] = 1024;
          *(_DWORD *)&v62[16] = v12;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Start to query validated key records to validate the RRSet - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d", buf, 0x2Eu);
LABEL_116:
          int v9 = v56;
          int v55 = v56;
          if (!v56) {
            goto LABEL_118;
          }
          goto LABEL_117;
        }
        goto LABEL_127;
      }
    }
    if (!v33) {
      goto LABEL_98;
    }
    goto LABEL_101;
  }
  if (v19)
  {
    uint64_t v23 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_127;
    }
    int v24 = *(unsigned __int16 *)(v1 + 24);
    if (v17)
    {
      int v25 = *((_DWORD *)v17 + 6);
      uint64_t v26 = *((void *)v17 + 2);
    }
    else
    {
      int v25 = 0;
      uint64_t v26 = 0;
    }
    *(_DWORD *)buf = 67110147;
    int v58 = v24;
    __int16 v59 = 2160;
    *(void *)uint64_t v60 = 1752392040;
    *(_WORD *)&v60[8] = 1040;
    *(_DWORD *)&v60[10] = v25;
    __int16 v61 = 2101;
    *(void *)os_log_type_t v62 = v26;
    *(_WORD *)&v62[8] = 1024;
    *(_DWORD *)&v62[10] = v12;
    int v50 = v23;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_127;
    }
    int v27 = *(unsigned __int16 *)(v1 + 24);
    if (v17)
    {
      int v28 = *((_DWORD *)v17 + 6);
      uint64_t v29 = *((void *)v17 + 2);
    }
    else
    {
      int v28 = 0;
      uint64_t v29 = 0;
    }
    *(_DWORD *)buf = 67110147;
    int v58 = v27;
    __int16 v59 = 2160;
    *(void *)uint64_t v60 = 1752392040;
    *(_WORD *)&v60[8] = 1040;
    *(_DWORD *)&v60[10] = v28;
    __int16 v61 = 2101;
    *(void *)os_log_type_t v62 = v29;
    *(_WORD *)&v62[8] = 1024;
    *(_DWORD *)&v62[10] = v12;
    int v50 = v20;
  }
  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[Q%u] The existing validation key requestor can still be reused - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d", buf, 0x28u);
LABEL_127:
  int v55 = 0;
  if (v6) {
LABEL_119:
  }
    ref_count_obj_release((void *)v6);
LABEL_120:
  if (v17) {
    ref_count_obj_release(v17);
  }
}

void _dnssec_make_validation_progress(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48)) {
    return;
  }
  LODWORD(v106) = 0;
  *(void *)buf = 0;
  size_t v107 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *(_DWORD *)(v2 + 40);
    if (v3 != 4 && v3 != 2) {
      goto LABEL_21;
    }
    uint64_t v6 = (uint64_t *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 40);
    if (!v5)
    {
      if (!*(_DWORD *)(a1 + 112)) {
        goto LABEL_20;
      }
LABEL_18:
      int v9 = 0;
      uint64_t v10 = 0;
      BOOL v11 = *(void *)(a1 + 88) != 0;
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v6 = (uint64_t *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 40);
    if (!v5)
    {
LABEL_21:
      int v9 = 0;
LABEL_22:
      uint64_t v10 = 0;
LABEL_23:
      BOOL v11 = 0;
      goto LABEL_24;
    }
  }
  int v7 = *(_DWORD *)(v5 + 40);
  if (v7 != 4 && v7 != 2) {
    goto LABEL_21;
  }
  if (*(_DWORD *)(a1 + 112)) {
    goto LABEL_18;
  }
  if (!v2)
  {
LABEL_34:
    unint64_t v15 = 0;
    int v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_35;
  }
LABEL_20:
  if (*(_DWORD *)(v2 + 44)) {
    goto LABEL_21;
  }
  if (!dnssec_obj_rrset_is_dnskey(v2))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    if (!v19) {
      goto LABEL_21;
    }
    if (*(_WORD *)(v19 + 342) != 48) {
      goto LABEL_21;
    }
    unsigned __int16 v20 = *(void **)(a1 + 64);
    if (!v20 || !v20[4]) {
      goto LABEL_21;
    }
    int v9 = dnssec_obj_rrset_copy_dnskeys(v20, &v107, (int *)&v106);
    if (v106) {
      goto LABEL_22;
    }
    unint64_t v15 = v107;
    uint64_t v10 = 0;
    if (!dnssec_obj_rrset_matches_dnskey_key_tag(*(void *)(a1 + 32), (uint64_t)v9, v107)) {
      goto LABEL_23;
    }
LABEL_35:
    uint64_t v16 = *v6;
    if (*v6)
    {
      uint64_t v17 = *(void *)(a1 + 56);
      if (!v17) {
        goto LABEL_23;
      }
      if (*(_WORD *)(v17 + 342) != 48) {
        goto LABEL_23;
      }
      if (*(_DWORD *)(v16 + 44)) {
        goto LABEL_23;
      }
      uint64_t v18 = *(void *)(a1 + 64);
      if (!v18 || !*(void *)(v18 + 32)) {
        goto LABEL_23;
      }
      if (!v9)
      {
        int v9 = dnssec_obj_rrset_copy_dnskeys(*(void **)(a1 + 64), &v107, (int *)&v106);
        if (v106) {
          goto LABEL_23;
        }
        uint64_t v16 = *v6;
        unint64_t v15 = v107;
      }
      if (!dnssec_obj_rrset_matches_dnskey_key_tag(v16, (uint64_t)v9, v15)) {
        goto LABEL_23;
      }
    }
    BOOL v11 = 1;
LABEL_24:
    unint64_t v12 = *(void *)buf;
    if (*(void *)buf) {
      goto LABEL_25;
    }
LABEL_70:
    if (!v10) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  if (*(void *)(a1 + 128))
  {
    if (*(_DWORD *)(a1 + 140) || *(unsigned char *)(a1 + 144)) {
      goto LABEL_21;
    }
    goto LABEL_34;
  }
  uint64_t v21 = *(void *)(a1 + 56);
  if (!v21) {
    goto LABEL_21;
  }
  if (*(_WORD *)(v21 + 342) != 43) {
    goto LABEL_21;
  }
  uint64_t v22 = *(void *)(a1 + 64);
  if (!v22 || !*(void *)(v22 + 32)) {
    goto LABEL_21;
  }
  uint64_t v23 = dnssec_obj_rrset_copy_dses_with_supported_algorithm(v22, (size_t *)buf, (int *)&v106);
  uint64_t v10 = (void *)v23;
  if (v106 == -6727)
  {
LABEL_68:
    unint64_t v15 = 0;
    int v9 = 0;
    goto LABEL_35;
  }
  if (v106)
  {
LABEL_59:
    int v9 = 0;
    goto LABEL_23;
  }
  unint64_t v12 = *(void *)buf;
  int v24 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v24)
  {
    while (*(_WORD *)(*v24 + 4) != 46 || !*(void *)buf)
    {
LABEL_66:
      int v24 = (void *)v24[1];
      if (!v24) {
        goto LABEL_59;
      }
    }
    uint64_t v25 = 0;
    unsigned int v26 = __rev16(*(unsigned __int16 *)(*(void *)(*v24 + 40) + 20));
    while (v26 != bswap32(**(unsigned __int16 **)(*(void *)(v23 + 8 * v25) + 24)) >> 16)
    {
      if (*(void *)buf == ++v25) {
        goto LABEL_66;
      }
    }
    goto LABEL_68;
  }
  int v9 = 0;
  BOOL v11 = 0;
  if (!*(void *)buf) {
    goto LABEL_70;
  }
LABEL_25:
  unint64_t v13 = 0;
  do
  {
    uint64_t v14 = (void *)v10[v13];
    if (v14)
    {
      ref_count_obj_release(v14);
      v10[v13] = 0;
    }
    ++v13;
  }
  while (v13 < v12);
LABEL_71:
  free(v10);
LABEL_72:
  size_t v27 = v107;
  if (v107)
  {
    size_t v28 = 0;
    do
    {
      uint64_t v29 = (void *)v9[v28];
      if (v29)
      {
        ref_count_obj_release(v29);
        v9[v28] = 0;
      }
      ++v28;
    }
    while (v28 < v27);
  }
  else if (!v9)
  {
    goto LABEL_80;
  }
  free(v9);
LABEL_80:
  if (!v11) {
    return;
  }
  size_t v106 = 0;
  size_t v107 = 0;
  int v30 = *(_DWORD *)(a1 + 48);
  if (v30)
  {
    int v31 = 0;
    uint64_t v32 = 0;
    int v33 = *(_DWORD *)(a1 + 52);
LABEL_83:
    int v108 = v33;
    goto LABEL_84;
  }
  uint64_t v38 = *(void *)(a1 + 32);
  if (v38)
  {
    int v39 = *(_DWORD *)(v38 + 40);
    if (v39 != 2 && v39 != 4)
    {
      int v31 = 0;
      uint64_t v32 = 0;
      int v30 = 0;
      int v33 = -6745;
      goto LABEL_83;
    }
  }
  int v108 = -6745;
  int v41 = *(_DWORD *)(a1 + 112);
  if (v41)
  {
    int v42 = *(unsigned __int8 **)(a1 + 88);
    if (!v42)
    {
      if (v41 != 3)
      {
        int v31 = 0;
        uint64_t v32 = 0;
        int v30 = 0;
        int v108 = 0;
        goto LABEL_84;
      }
      goto LABEL_106;
    }
    if (*v42 != 240
      || (uint64_t v43 = *((void *)v42 + 7)) == 0
      || *(_DWORD *)(v43 + 32) != 1
      || (uint64_t v44 = *(void *)(a1 + 16), dnssec_obj_resource_record_member_get_validation_result(v43) != 1)
      || !resource_record_get_insecure_validation_usable(v42))
    {
LABEL_106:
      int v31 = 0;
      uint64_t v32 = 0;
      int v48 = -6700;
LABEL_107:
      int v108 = v48;
      goto LABEL_264;
    }
    *(_DWORD *)buf = 0;
    uint64_t v45 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)v42 + 4), 0, (int *)buf);
    int v46 = v45;
    if (*(_DWORD *)buf)
    {
      if (v45) {
        ref_count_obj_release(v45);
      }
      goto LABEL_106;
    }
    if (ref_count_obj_compare(v44, (uint64_t)v45, 1))
    {
      BOOL is_sub_domain_of = dnssec_obj_domain_name_is_sub_domain_of(*(unsigned __int8 **)(v44 + 16), *((unsigned char **)v46 + 2));
      ref_count_obj_release(v46);
      if (!is_sub_domain_of) {
        goto LABEL_106;
      }
    }
    else if (v46)
    {
      ref_count_obj_release(v46);
    }
    uint64_t v93 = *(void *)(a1 + 32);
    if (v93) {
      *(void *)(v93 + 44) = 2;
    }
    uint64_t v94 = *(void *)(a1 + 40);
    if (v94) {
      *(void *)(v94 + 44) = 2;
    }
    uint64_t v32 = 0;
    int v31 = 0;
    goto LABEL_233;
  }
  uint64_t v52 = *(void *)(a1 + 64);
  if (v52)
  {
    int v53 = *(_DWORD *)(v52 + 44);
    if (v53 == 3) {
      goto LABEL_274;
    }
    uint64_t v54 = *(void *)(v52 + 32);
  }
  else
  {
    int v53 = 0;
    uint64_t v54 = 0;
  }
  if (!v38) {
    goto LABEL_150;
  }
  int v55 = *(_DWORD *)(v38 + 40);
  if (v55 != 4 && v55 != 2) {
    goto LABEL_150;
  }
  int v56 = *(_DWORD *)(v38 + 44);
  if (v56)
  {
    size_t v57 = 0;
    int v31 = 0;
    uint64_t v32 = 0;
    int v108 = *(_DWORD *)(v38 + 48);
    goto LABEL_130;
  }
  if (*(void *)(v38 + 32))
  {
    int v58 = *(unsigned __int8 ***)(v38 + 24);
    if (v58)
    {
      __int16 v59 = *v58;
      if (*v59 != 240)
      {
        int v60 = *((unsigned __int16 *)v59 + 2);
        if (v60 != 48 && (v60 != 46 || __rev16(*(unsigned __int16 *)(*((void *)v59 + 5) + 4)) != 48))
        {
          if (v54)
          {
            if (v53 == 1)
            {
              int v31 = dnssec_obj_rrset_copy_dnskeys((void *)v52, &v107, &v108);
              if (!v108)
              {
                size_t v57 = v107;
                int v56 = dnssec_obj_rrset_validate_with_dnskeys(*(uint64_t **)(a1 + 32), (_DWORD **)v31, v107, (unsigned __int8 *)&v108);
                uint64_t v32 = 0;
LABEL_130:
                if (v56 == 3) {
                  goto LABEL_264;
                }
                goto LABEL_152;
              }
              uint64_t v32 = 0;
LABEL_291:
              int v30 = 0;
              goto LABEL_84;
            }
            if (v53 == 2)
            {
              uint64_t v32 = 0;
              goto LABEL_238;
            }
            goto LABEL_274;
          }
          goto LABEL_150;
        }
      }
      goto LABEL_138;
    }
  }
  uint64_t v105 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
      goto LABEL_138;
    }
  }
  else
  {
    uint64_t v105 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
      goto LABEL_138;
    }
  }
  *(_DWORD *)buf = 136447234;
  *(void *)&uint8_t buf[4] = "me->rr_count > 0 && me->rrs != NULL";
  *(_WORD *)&buf[12] = 2082;
  uint64_t v110 = "";
  __int16 v111 = 2082;
  uint64_t v112 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
  __int16 v113 = 1024;
  int v114 = 267;
  __int16 v115 = 2048;
  uint64_t v116 = 0;
  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
LABEL_138:
  size_t v61 = *(void *)(a1 + 128);
  if (v61)
  {
    os_log_type_t v62 = *(_DWORD ***)(a1 + 120);
    if (v62)
    {
      if (!*(unsigned char *)(a1 + 144))
      {
        uint64_t v86 = *(void *)(a1 + 32);
        int v87 = dnssec_obj_rrset_validate_with_dses_or_trust_anchors(v86, 0, 0, v62, v61, &v108);
        if (v87 == 3)
        {
          if (!*(_DWORD *)(v86 + 56)) {
            *(_DWORD *)(v86 + 44) = 0;
          }
          int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 144) = 1;
          goto LABEL_264;
        }
        int v56 = v87;
        size_t v57 = 0;
        goto LABEL_151;
      }
    }
  }
  if (v54)
  {
    if (v53 == 1)
    {
      uint64_t v32 = (_DWORD **)dnssec_obj_rrset_copy_dses_with_supported_algorithm(*(void *)(a1 + 64), &v106, &v108);
      if (v108 != -6727)
      {
        if (!v108)
        {
          int v56 = dnssec_obj_rrset_validate_with_dses_or_trust_anchors(*(void *)(a1 + 32), v32, v106, 0, 0, &v108);
          size_t v57 = 0;
          int v31 = 0;
          goto LABEL_130;
        }
        int v31 = 0;
        goto LABEL_291;
      }
      goto LABEL_209;
    }
    if (v53 == 2)
    {
      uint64_t v32 = 0;
LABEL_209:
      uint64_t v38 = *(void *)(a1 + 32);
LABEL_238:
      size_t v57 = 0;
      int v31 = 0;
      int v56 = 2;
      *(void *)(v38 + 44) = 2;
      int v63 = 1;
      goto LABEL_153;
    }
LABEL_274:
    int v31 = 0;
    uint64_t v32 = 0;
    int v48 = -6709;
    goto LABEL_107;
  }
LABEL_150:
  size_t v57 = 0;
  int v56 = 0;
LABEL_151:
  uint64_t v32 = 0;
  int v31 = 0;
LABEL_152:
  int v63 = 0;
LABEL_153:
  uint64_t v64 = *(void *)(a1 + 40);
  if (!v64) {
    goto LABEL_167;
  }
  int v65 = *(_DWORD *)(v64 + 40);
  if (v65 != 4 && v65 != 2) {
    goto LABEL_167;
  }
  int v66 = *(_DWORD *)(v64 + 44);
  if (!v66)
  {
    if (v54)
    {
      if (v53 != 1)
      {
        if (v53 == 2)
        {
          *(void *)(v64 + 44) = 2;
LABEL_233:
          int v108 = 0;
          int v67 = 2;
          goto LABEL_251;
        }
        int v95 = -6709;
        goto LABEL_242;
      }
      if (!v31)
      {
        int v31 = dnssec_obj_rrset_copy_dnskeys(*(void **)(a1 + 64), &v107, &v108);
        if (v108)
        {
          int v67 = 0;
          if (!v63) {
            goto LABEL_263;
          }
LABEL_251:
          int v96 = mDNSLogCategory_DNSSEC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
            {
LABEL_260:
              int v100 = dword_100164DF8;
              if (dword_100164DF8 <= 1) {
                int v100 = 1;
              }
              dword_100164E58 = v100;
LABEL_263:
              int v30 = v67;
              if (v67 != 3) {
                goto LABEL_84;
              }
LABEL_264:
              __int16 v101 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                {
LABEL_273:
                  int v30 = 3;
                  goto LABEL_84;
                }
              }
              else
              {
                __int16 v101 = mDNSLogCategory_DNSSEC_redacted;
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
                  goto LABEL_273;
                }
              }
              int v104 = *(unsigned __int16 *)(a1 + 24);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v104;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v108;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "[Q%u] Bogus RRSet failed DNSSEC validation - error: %d", buf, 0xEu);
              goto LABEL_273;
            }
          }
          else
          {
            int v96 = mDNSLogCategory_DNSSEC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
              goto LABEL_260;
            }
          }
          int v99 = *(unsigned __int16 *)(a1 + 24);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v99;
          *(_WORD *)&buf[8] = 1026;
          *(_DWORD *)&buf[10] = v67;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "[Q%u] A new RRSet has been validated, scheduling cache update - result: %{public, mdns:dnssec_result}d", buf, 0xEu);
          goto LABEL_260;
        }
        uint64_t v64 = *(void *)(a1 + 40);
        size_t v57 = v107;
      }
      int v66 = dnssec_obj_rrset_validate_with_dnskeys((uint64_t *)v64, (_DWORD **)v31, v57, (unsigned __int8 *)&v108);
      goto LABEL_158;
    }
LABEL_167:
    int v66 = 0;
    goto LABEL_168;
  }
  int v108 = *(_DWORD *)(v64 + 48);
LABEL_158:
  if (v66 == 3) {
    goto LABEL_159;
  }
LABEL_168:
  int v108 = 0;
  if (v56 == 2 || v66 == 2)
  {
    int v67 = 2;
    int v30 = 2;
    if (v63) {
      goto LABEL_251;
    }
  }
  else
  {
    uint64_t v68 = *(void *)(a1 + 40);
    if (!v68)
    {
      uint64_t v75 = *(void *)(a1 + 32);
      if (!v75) {
        goto LABEL_241;
      }
      int v76 = *(_DWORD *)(v75 + 40);
      if (v76 != 2 && v76 != 4)
      {
        int v84 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
            goto LABEL_250;
          }
        }
        else
        {
          int v84 = mDNSLogCategory_DNSSEC_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
            goto LABEL_250;
          }
        }
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "dnssec_obj_rrset_is_completed(me)";
        *(_WORD *)&buf[12] = 2082;
        uint64_t v110 = "";
        __int16 v111 = 2082;
        uint64_t v112 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
        __int16 v113 = 1024;
        int v114 = 416;
        __int16 v115 = 2048;
        uint64_t v116 = 0;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
LABEL_250:
        int v108 = -6745;
        int v67 = 0;
        int v30 = 0;
        if ((v63 & 1) == 0) {
          goto LABEL_84;
        }
        goto LABEL_251;
      }
      BOOL v77 = *(void **)(v75 + 24);
      if (!v77) {
        goto LABEL_250;
      }
      while (1)
      {
        uint64_t v78 = *v77;
        if (*(_WORD *)(*v77 + 4) == 46) {
          break;
        }
        BOOL v77 = (void *)v77[1];
        if (!v77) {
          goto LABEL_250;
        }
      }
      uint64_t v88 = *(unsigned char **)(v78 + 32);
      int v89 = *v88;
      if (*v88)
      {
        uint64_t v90 = 0;
        do
        {
          ++v90;
          __int16 v91 = &v88[v89];
          int v92 = v91[1];
          uint64_t v88 = v91 + 1;
          int v89 = v92;
        }
        while (v92);
      }
      else
      {
        uint64_t v90 = 0;
      }
      if (v90 != *(unsigned __int8 *)(*(void *)(v78 + 40) + 7) || !v56) {
        goto LABEL_250;
      }
      if (v56 != 1) {
        goto LABEL_241;
      }
LABEL_204:
      int v108 = 0;
      int v67 = 1;
      goto LABEL_251;
    }
    *(_DWORD *)buf = 0;
    uint64_t denial_of_existence = dnssec_obj_rrset_get_denial_of_existence(v68, (int *)buf);
    if (*(_DWORD *)buf)
    {
      int v108 = *(_DWORD *)buf;
LABEL_159:
      int v67 = 3;
      if (!v63) {
        goto LABEL_263;
      }
      goto LABEL_251;
    }
    int v70 = *(_DWORD *)(denial_of_existence + 16);
    int v108 = 0;
    uint64_t v71 = *(void *)(a1 + 32);
    if (v71)
    {
      if (v56 == 1 && v66 == 1)
      {
        int v72 = *(_DWORD *)(v71 + 40);
        if (v72 == 2 || v72 == 4)
        {
          BOOL v73 = *(void **)(v71 + 24);
          if (v73)
          {
            while (1)
            {
              uint64_t v74 = *v73;
              if (*(_WORD *)(*v73 + 4) == 46) {
                break;
              }
              BOOL v73 = (void *)v73[1];
              if (!v73) {
                goto LABEL_241;
              }
            }
            int v79 = *(unsigned char **)(v74 + 32);
            int v80 = *v79;
            if (*v79)
            {
              unint64_t v81 = 0;
              do
              {
                ++v81;
                uint64_t v82 = &v79[v80];
                int v83 = v82[1];
                int v79 = v82 + 1;
                int v80 = v83;
              }
              while (v83);
              if (v81 > *(unsigned __int8 *)(*(void *)(v74 + 40) + 7) && v70 == 5) {
                goto LABEL_204;
              }
            }
          }
          goto LABEL_241;
        }
        uint64_t v85 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT))
          {
LABEL_240:
            *(_DWORD *)buf = 136447234;
            *(void *)&uint8_t buf[4] = "dnssec_obj_rrset_is_completed(me)";
            *(_WORD *)&buf[12] = 2082;
            uint64_t v110 = "";
            __int16 v111 = 2082;
            uint64_t v112 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_rrset.c";
            __int16 v113 = 1024;
            int v114 = 396;
            __int16 v115 = 2048;
            uint64_t v116 = 0;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
          }
        }
        else
        {
          uint64_t v85 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
            goto LABEL_240;
          }
        }
LABEL_241:
        int v95 = -6736;
LABEL_242:
        int v108 = v95;
        if ((v63 & 1) == 0) {
          goto LABEL_264;
        }
        int v67 = 3;
        goto LABEL_251;
      }
      if (v56 && v66) {
        goto LABEL_241;
      }
      goto LABEL_250;
    }
    if (!v70 || v70 == 2) {
      goto LABEL_241;
    }
    if (v70 != 5)
    {
      if (!v66) {
        goto LABEL_250;
      }
      if (v66 != 1) {
        goto LABEL_241;
      }
      goto LABEL_204;
    }
    int v67 = 0;
    int v30 = 0;
    int v108 = -6745;
    if (v63) {
      goto LABEL_251;
    }
  }
LABEL_84:
  int v34 = v108;
  *(_DWORD *)(a1 + 48) = v30;
  *(_DWORD *)(a1 + 52) = v34;
  size_t v35 = v107;
  if (v107)
  {
    size_t v36 = 0;
    do
    {
      uint64_t v37 = (void *)v31[v36];
      if (v37)
      {
        ref_count_obj_release(v37);
        v31[v36] = 0;
      }
      ++v36;
    }
    while (v36 < v35);
    goto LABEL_109;
  }
  if (v31) {
LABEL_109:
  }
    free(v31);
  size_t v49 = v106;
  if (v106)
  {
    size_t v50 = 0;
    do
    {
      uint64_t v51 = v32[v50];
      if (v51)
      {
        ref_count_obj_release(v51);
        v32[v50] = 0;
      }
      ++v50;
    }
    while (v50 < v49);
  }
  else if (!v32)
  {
    return;
  }
  free(v32);
}

void _dnssec_query_key_record_result_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  int v6 = *((unsigned __int16 *)a3 + 2);
  if (v6 != 5 || *a3 == 240)
  {
    if (*(void *)(a2 + 144))
    {
      if (a4 <= 1)
      {
        uint64_t v7 = *(void *)(a2 + 176);
        if (v6 == 48 || v6 == 43)
        {
          uint64_t v8 = *((void *)a3 + 7);
          if (v8)
          {
            if (dnssec_obj_resource_record_member_get_validation_result(v8) - 3 >= 0xFFFFFFFE)
            {
              int v44 = 0;
              int v9 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)a3 + 4), 0, &v44);
              if (v44) {
                goto LABEL_113;
              }
              uint64_t v10 = *(void *)(v7 + 24);
              BOOL v11 = mDNSLogCategory_DNSSEC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
              {
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
                  goto LABEL_21;
                }
                unsigned int v12 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                BOOL v13 = *a3 != 240;
                if (v9)
                {
                  int v14 = *((_DWORD *)v9 + 6);
                  uint64_t v15 = *((void *)v9 + 2);
                }
                else
                {
                  int v14 = 0;
                  uint64_t v15 = 0;
                }
              }
              else
              {
                BOOL v11 = mDNSLogCategory_DNSSEC_redacted;
                if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
                  goto LABEL_21;
                }
                unsigned int v12 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                BOOL v13 = *a3 != 240;
                if (v9)
                {
                  int v14 = *((_DWORD *)v9 + 6);
                  uint64_t v15 = *((void *)v9 + 2);
                }
                else
                {
                  int v14 = 0;
                  uint64_t v15 = 0;
                }
              }
              int v16 = *((unsigned __int16 *)a3 + 2);
              int v17 = *((unsigned __int16 *)a3 + 6);
              *(_DWORD *)buf = 67110915;
              *(_DWORD *)int v46 = v12;
              *(_WORD *)&v46[4] = 1024;
              *(_DWORD *)&v46[6] = v13;
              LOWORD(v47) = 1024;
              *(_DWORD *)((char *)&v47 + 2) = a4;
              HIWORD(v47) = 2160;
              *(void *)int v48 = 1752392040;
              *(_WORD *)&v48[8] = 1040;
              LODWORD(v49) = v14;
              WORD2(v49) = 2101;
              *(void *)((char *)&v49 + 6) = v15;
              HIWORD(v49) = 1024;
              int v50 = v16;
              __int16 v51 = 1024;
              int v52 = v17;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Q%u] DNSSEC secure record changes - %{mdns:pos/neg}d, %{mdns:addrmv}d, qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, qtype: %{mdns:rrtype}d, rd_len: %u.", buf, 0x3Au);
LABEL_21:
              uint64_t v18 = *(void *)(v7 + 64);
              if (a4)
              {
                if (!*(_DWORD *)(v18 + 112))
                {
                  int v19 = *((unsigned __int16 *)a3 + 2);
                  if (v19 == 43 || v19 == 48)
                  {
                    *(_DWORD *)buf = 0;
                    unsigned __int16 v20 = *(void **)(v18 + 64);
                    if (v20)
                    {
                      uint64_t v21 = 0;
                      ++*(_DWORD *)v20;
                    }
                    else
                    {
                      size_t v36 = dnssec_obj_domain_name_create_with_labels(*((unsigned __int8 **)a3 + 4), 1, (int *)buf);
                      uint64_t v21 = v36;
                      if (*(_DWORD *)buf)
                      {
                        unsigned __int16 v20 = 0;
                        if (!v36)
                        {
LABEL_78:
                          if (v20) {
                            ref_count_obj_release(v20);
                          }
                          int v44 = *(_DWORD *)buf;
                          if (*(_DWORD *)buf)
                          {
                            if (*(_DWORD *)buf != -6730) {
                              goto LABEL_113;
                            }
                            uint64_t v37 = mDNSLogCategory_DNSSEC;
                            if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                            {
                              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG)) {
                                goto LABEL_113;
                              }
                            }
                            else
                            {
                              uint64_t v37 = mDNSLogCategory_DNSSEC_redacted;
                              if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG)) {
                                goto LABEL_113;
                              }
                            }
                            unsigned int v38 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                            *(_DWORD *)buf = 67109120;
                            *(_DWORD *)int v46 = v38;
                            int v39 = "[Q%u] Getting duplicate secure record add event due to possible primary DNSSEC question change";
                            goto LABEL_94;
                          }
                          goto LABEL_112;
                        }
LABEL_77:
                        ref_count_obj_release(v21);
                        goto LABEL_78;
                      }
                      unsigned __int16 v20 = dnssec_obj_rrset_create(v36, *(_DWORD *)(v18 + 136), buf);
                      if (*(_DWORD *)buf)
                      {
LABEL_76:
                        if (!v21) {
                          goto LABEL_78;
                        }
                        goto LABEL_77;
                      }
                    }
                    *(_DWORD *)buf = dnssec_obj_rrset_add_rr((uint64_t)v20, a3);
                    if (!*(_DWORD *)buf && !*(void *)(v18 + 64))
                    {
                      if (v20) {
                        ++*(_DWORD *)v20;
                      }
                      *(void *)(v18 + 64) = v20;
                    }
                    goto LABEL_76;
                  }
                  int v33 = mDNSLogCategory_DNSSEC;
                  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                  {
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_59;
                    }
                  }
                  else
                  {
                    int v33 = mDNSLogCategory_DNSSEC_redacted;
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT))
                    {
LABEL_59:
                      *(_DWORD *)buf = 136447234;
                      *(void *)int v46 = "validated_key->rrtype == kDNSRecordType_DNSKEY || validated_key->rrtype == kDNSRecordType_DS";
                      *(_WORD *)&v46[8] = 2082;
                      unsigned int v47 = "";
                      *(_WORD *)int v48 = 2082;
                      *(void *)&v48[2] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
                      LOWORD(v49) = 1024;
                      *(_DWORD *)((char *)&v49 + 2) = 387;
                      WORD3(v49) = 2048;
                      *((void *)&v49 + 1) = 0;
LABEL_97:
                      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
                    }
                  }
LABEL_98:
                  int v44 = -6756;
                  goto LABEL_113;
                }
LABEL_28:
                if (*a3 == 240
                  && (uint64_t v22 = *((void *)a3 + 7)) != 0
                  && *(_DWORD *)(v22 + 32) == 1
                  && dnssec_obj_resource_record_member_get_validation_result(v22) == 1)
                {
                  if (*((_WORD *)a3 + 2) == 43)
                  {
                    if (a4 != 1)
                    {
                      *(void *)(v18 + 48) = 0xFFFFE5C200000000;
                      _dnssec_obj_validation_manager_reset_validation_key_requestor(v18);
                      _dnssec_obj_validation_manager_reset_insecure_validation(v18);
                      goto LABEL_110;
                    }
                    if (resource_record_get_insecure_validation_usable(a3))
                    {
                      uint64_t v23 = mDNSLogCategory_DNSSEC;
                      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                      {
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
                        {
                          int v24 = *(unsigned __int16 *)(v18 + 24);
                          unsigned int v25 = bswap32(*(unsigned __int16 *)(*(void *)(v18 + 80) + 340)) >> 16;
                          uint64_t v26 = *((void *)a3 + 4);
                          if (v26)
                          {
                            int v34 = (unsigned char *)*((void *)a3 + 4);
                            if (v26 == -256)
                            {
LABEL_64:
                              while (v34)
                              {
                                uint64_t v35 = *v34;
                                if (v35 > 0x3F) {
                                  break;
                                }
                                if (!*v34)
                                {
                                  int v40 = (unsigned __int16)((_WORD)v34 - v26 + 1);
                                  goto LABEL_105;
                                }
                                v34 += v35 + 1;
                                if (v26 != -256) {
                                  goto LABEL_63;
                                }
                              }
                            }
                            else
                            {
LABEL_63:
                              if ((unint64_t)v34 < v26 + 256) {
                                goto LABEL_64;
                              }
                            }
                            int v40 = 257;
                          }
                          else
                          {
                            int v40 = 0;
                          }
                          goto LABEL_105;
                        }
                      }
                      else
                      {
                        uint64_t v23 = mDNSLogCategory_DNSSEC_redacted;
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
                        {
                          int v24 = *(unsigned __int16 *)(v18 + 24);
                          unsigned int v25 = bswap32(*(unsigned __int16 *)(*(void *)(v18 + 80) + 340)) >> 16;
                          uint64_t v26 = *((void *)a3 + 4);
                          if (v26)
                          {
                            size_t v27 = (unsigned char *)*((void *)a3 + 4);
                            if (v26 == -256)
                            {
LABEL_41:
                              while (v27)
                              {
                                uint64_t v28 = *v27;
                                if (v28 > 0x3F) {
                                  break;
                                }
                                if (!*v27)
                                {
                                  int v40 = (unsigned __int16)((_WORD)v27 - v26 + 1);
                                  goto LABEL_105;
                                }
                                v27 += v28 + 1;
                                if (v26 != -256) {
                                  goto LABEL_40;
                                }
                              }
                            }
                            else
                            {
LABEL_40:
                              if ((unint64_t)v27 < v26 + 256) {
                                goto LABEL_41;
                              }
                            }
                            int v40 = 257;
                          }
                          else
                          {
                            int v40 = 0;
                          }
LABEL_105:
                          int v41 = *((_DWORD *)a3 + 2);
                          *(_DWORD *)buf = 67110403;
                          *(_DWORD *)int v46 = v24;
                          *(_WORD *)&v46[4] = 1024;
                          *(_DWORD *)&v46[6] = v25;
                          strcpy((char *)&v47, "p\bhash");
                          HIBYTE(v47) = 0;
                          *(_DWORD *)int v48 = 68157440;
                          *(_DWORD *)&v48[4] = v40;
                          *(_WORD *)&v48[8] = 2101;
                          *(void *)&long long v49 = v26;
                          WORD4(v49) = 1024;
                          *(_DWORD *)((char *)&v49 + 10) = v41;
                          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Insecure validation complete, scheduling cache update - insecure zone: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, ttl: %u", buf, 0x2Eu);
                        }
                      }
                      *(void *)(v18 + 88) = a3;
                      int v42 = dword_100164DF8;
                      if (dword_100164DF8 <= 1) {
                        int v42 = 1;
                      }
                      dword_100164E58 = v42;
LABEL_109:
                      if (a4)
                      {
LABEL_112:
                        _dnssec_make_validation_progress(*(void *)(v7 + 64));
                        goto LABEL_113;
                      }
LABEL_110:
                      if (dnssec_obj_validation_manager_contains_possibly_unsigned_rrset(*(void *)(v18 + 32), *(void *)(v18 + 40)))
                      {
                        dnssec_obj_validation_manager_start_insecure_validation(v18, v7);
                      }
                      goto LABEL_112;
                    }
                    int v29 = -90021;
                  }
                  else
                  {
                    int v29 = -6756;
                  }
                }
                else
                {
                  int v29 = -6736;
                }
                _dnssec_obj_validation_manager_fail_insecure_validation(v18, v29);
                goto LABEL_109;
              }
              dnssec_obj_validation_manager_remove_validated_cache(*(void *)(v7 + 64));
              uint64_t v18 = *(void *)(v7 + 64);
              if (*(_DWORD *)(v18 + 112)) {
                goto LABEL_28;
              }
              int v30 = *((unsigned __int16 *)a3 + 2);
              if (v30 != 43 && v30 != 48)
              {
                int v33 = mDNSLogCategory_DNSSEC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                {
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_98;
                  }
                }
                else
                {
                  int v33 = mDNSLogCategory_DNSSEC_redacted;
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_98;
                  }
                }
                *(_DWORD *)buf = 136447234;
                *(void *)int v46 = "validated_key->rrtype == kDNSRecordType_DNSKEY || validated_key->rrtype == kDNSRecordType_DS";
                *(_WORD *)&v46[8] = 2082;
                unsigned int v47 = "";
                *(_WORD *)int v48 = 2082;
                *(void *)&v48[2] = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
                LOWORD(v49) = 1024;
                *(_DWORD *)((char *)&v49 + 2) = 397;
                WORD3(v49) = 2048;
                *((void *)&v49 + 1) = 0;
                goto LABEL_97;
              }
              int v31 = dnssec_obj_rrset_remove_rr(*(void *)(v18 + 64), a3);
              if (!v31)
              {
                uint64_t v32 = *(void **)(v18 + 64);
                if (!v32[4] && v32)
                {
                  ref_count_obj_release(v32);
                  *(void *)(v18 + 64) = 0;
                }
                *(void *)(v18 + 48) = 0xFFFFE5C200000000;
                *(_DWORD *)(v18 + 140) = 0;
                *(unsigned char *)(v18 + 144) = 0;
                int v44 = 0;
                goto LABEL_113;
              }
              int v44 = v31;
              if (v31 == -6727)
              {
                uint64_t v37 = mDNSLogCategory_DNSSEC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
                {
                  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_122;
                  }
                }
                else
                {
                  uint64_t v37 = mDNSLogCategory_DNSSEC_redacted;
                  if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_DEBUG))
                  {
LABEL_122:
                    unsigned int v43 = bswap32(*(unsigned __int16 *)(v10 + 340)) >> 16;
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int v46 = v43;
                    int v39 = "[Q%u] Added secure record not found due to possible primary DNSSEC question change";
LABEL_94:
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, v39, buf, 8u);
                  }
                }
              }
LABEL_113:
              if (v9) {
                ref_count_obj_release(v9);
              }
            }
          }
        }
      }
    }
  }
}

void _query_record_with_insecure_validation_reply(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  if (*(void *)(a2 + 144))
  {
    int v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      int v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "!dns_question_is_dnssec_requestor(question)";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&long long v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 330;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", buf, 0x30u);
    return;
  }
  int v7 = *((unsigned __int16 *)a3 + 2);
  if (v7 != 5 && v7 != 43)
  {
    int v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      int v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "answer->rrtype == kDNSRecordType_DS || answer->rrtype == kDNSRecordType_CNAME";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&long long v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 331;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0;
    goto LABEL_27;
  }
  uint64_t v8 = *(void *)(a2 + 176);
  uint64_t v9 = *(void *)(v8 + 64);
  if (!*(_DWORD *)(v9 + 112))
  {
    int v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      int v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "_insecure_validation_in_progress(dnssec_context)";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&long long v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 334;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0;
    goto LABEL_27;
  }
  if (*(void *)(v9 + 96) != a2)
  {
    int v17 = mDNSLogCategory_DNSSEC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    else
    {
      int v17 = mDNSLogCategory_DNSSEC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT)) {
        return;
      }
    }
    *(_DWORD *)buf = 136447234;
    *(void *)BOOL v73 = "_is_insecure_validation_question(dnssec_context, question)";
    *(_WORD *)&v73[8] = 2082;
    *(void *)&v73[10] = "";
    *(_WORD *)&v73[18] = 2082;
    *(void *)&long long v74 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec.c";
    WORD4(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 10) = 335;
    HIWORD(v74) = 2048;
    uint64_t v75 = 0;
    goto LABEL_27;
  }
  if (v7 == 5) {
    return;
  }
  uint64_t v10 = *(void *)(v8 + 24);
  BOOL v11 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    unsigned int v20 = bswap32(*(unsigned __int16 *)(v10 + 340));
    unsigned int v21 = bswap32(*(unsigned __int16 *)(a2 + 340));
    uint64_t v14 = *((void *)a3 + 4);
    if (v14)
    {
      uint64_t v15 = (unsigned char *)*((void *)a3 + 4);
      if (v14 == -256)
      {
LABEL_32:
        while (v15)
        {
          uint64_t v22 = *v15;
          if (v22 > 0x3F) {
            break;
          }
          if (!*v15)
          {
            LOWORD(v15) = (_WORD)v15 - v14 + 1;
            goto LABEL_48;
          }
          v15 += v22 + 1;
          if (v14 != -256) {
            goto LABEL_31;
          }
        }
      }
      else
      {
LABEL_31:
        if ((unint64_t)v15 < v14 + 256) {
          goto LABEL_32;
        }
      }
      LOWORD(v15) = 257;
LABEL_48:
      LODWORD(v15) = (unsigned __int16)v15;
    }
    else
    {
      LODWORD(v15) = 0;
    }
    unsigned int v23 = HIWORD(v20);
    unsigned int v24 = HIWORD(v21);
    BOOL v25 = *a3 != 240;
    uint64_t v26 = *((void *)a3 + 3);
    uint64_t v28 = v26 + 5;
    if (unint64_t)(v26 + 5) < 6 && ((0x2Du >> v28)) {
      LODWORD(v26) = dword_10010BCF8[v28];
    }
  }
  else
  {
    BOOL v11 = mDNSLogCategory_DNSSEC_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    unsigned int v12 = bswap32(*(unsigned __int16 *)(v10 + 340));
    unsigned int v13 = bswap32(*(unsigned __int16 *)(a2 + 340));
    uint64_t v14 = *((void *)a3 + 4);
    if (v14)
    {
      uint64_t v15 = (unsigned char *)*((void *)a3 + 4);
      if (v14 == -256)
      {
LABEL_13:
        while (v15)
        {
          uint64_t v16 = *v15;
          if (v16 > 0x3F) {
            break;
          }
          if (!*v15)
          {
            LOWORD(v15) = (_WORD)v15 - v14 + 1;
            goto LABEL_42;
          }
          v15 += v16 + 1;
          if (v14 != -256) {
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        if ((unint64_t)v15 < v14 + 256) {
          goto LABEL_13;
        }
      }
      LOWORD(v15) = 257;
LABEL_42:
      LODWORD(v15) = (unsigned __int16)v15;
    }
    else
    {
      LODWORD(v15) = 0;
    }
    unsigned int v23 = HIWORD(v12);
    unsigned int v24 = HIWORD(v13);
    BOOL v25 = *a3 != 240;
    uint64_t v26 = *((void *)a3 + 3);
    uint64_t v27 = v26 + 5;
    if (unint64_t)(v26 + 5) < 6 && ((0x2Du >> v27)) {
      LODWORD(v26) = dword_10010BD10[v27];
    }
  }
  int v29 = a3[2];
  int v30 = *((_DWORD *)a3 + 2);
  *(_DWORD *)buf = 67111427;
  *(_DWORD *)BOOL v73 = v23;
  *(_WORD *)&v73[4] = 1024;
  *(_DWORD *)&v73[6] = v24;
  *(_WORD *)&v73[10] = 2160;
  *(void *)&v73[12] = 1752392040;
  LOWORD(v74) = 1040;
  *(_DWORD *)((char *)&v74 + 2) = v15;
  WORD3(v74) = 2101;
  *((void *)&v74 + 1) = v14;
  LOWORD(v75) = 1024;
  *(_DWORD *)((char *)&v75 + 2) = v25;
  HIWORD(v75) = 1024;
  int v76 = a4;
  __int16 v77 = 1024;
  int v78 = v26;
  __int16 v79 = 1024;
  int v80 = v29;
  __int16 v81 = 1024;
  int v82 = v30;
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] DS denial lookup record changes - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P, %{mdns:pos/neg}d, %{mdns:addrmv}d, interface index: %d, mortality: %{mdns:mortality}d, ttl: %u", buf, 0x46u);
LABEL_53:
  uint64_t v31 = *(void *)(v8 + 64);
  int v70 = 0;
  if (*(_DWORD *)(v31 + 112) != 1)
  {
    uint64_t v33 = 0;
    int v60 = 0;
    int v63 = 0;
    int v47 = -6709;
    goto LABEL_115;
  }
  if (*((void *)a3 + 7) || a4 != 1)
  {
    uint64_t v33 = 0;
    goto LABEL_140;
  }
  if (*((_WORD *)a3 + 2) != 43)
  {
    uint64_t v33 = 0;
    int v60 = 0;
    int v63 = 0;
    int v47 = -6756;
    goto LABEL_115;
  }
  uint64_t v32 = *(void *)(v31 + 16);
  uint64_t v33 = *(void *)(v31 + 104);
  if (v33) {
    ++*(_DWORD *)v33;
  }
  if (*a3 == 240)
  {
    uint64_t v34 = *(void *)(v8 + 24);
    if (!ref_count_obj_compare(v32, v33, 1) && *(_WORD *)(v34 + 342) == 43)
    {
      uint64_t v35 = mDNSLogCategory_DNSSEC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_ERROR))
        {
          unsigned int v36 = bswap32(*(unsigned __int16 *)(v34 + 340)) >> 16;
          if (v32)
          {
            int v37 = *(_DWORD *)(v32 + 24);
            uint64_t v38 = *(void *)(v32 + 16);
          }
          else
          {
            int v37 = 0;
            uint64_t v38 = 0;
          }
          goto LABEL_113;
        }
      }
      else
      {
        uint64_t v35 = mDNSLogCategory_DNSSEC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_ERROR))
        {
          unsigned int v36 = bswap32(*(unsigned __int16 *)(v34 + 340)) >> 16;
          if (v32)
          {
            int v37 = *(_DWORD *)(v32 + 24);
            uint64_t v38 = *(void *)(v32 + 16);
          }
          else
          {
            int v37 = 0;
            uint64_t v38 = 0;
          }
LABEL_113:
          *(_DWORD *)buf = 67109891;
          *(_DWORD *)BOOL v73 = v36;
          *(_WORD *)&v73[4] = 2160;
          *(void *)&v73[6] = 1752392040;
          *(_WORD *)&v73[14] = 1040;
          *(_DWORD *)&v73[16] = v37;
          LOWORD(v74) = 2101;
          *(void *)((char *)&v74 + 2) = v38;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "[Q%u] The discovered possible denial of existence for DS record points back to the current question itself, insecure delegation validation fails due to possible missing RRSIG of the original response - qname: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x22u);
        }
      }
      int v60 = 0;
      int v63 = 0;
      int v47 = -90020;
LABEL_115:
      int v70 = v47;
      goto LABEL_116;
    }
    __int16 v45 = *(_WORD *)(*(void *)(v31 + 96) + 344);
    if (v33) {
      ++*(_DWORD *)v33;
    }
    _dnssec_obj_validation_manager_stop_negative_ds_query(v31);
    *(_DWORD *)(v31 + 112) = 2;
    if (*(void *)(v31 + 80))
    {
      int v47 = -6709;
    }
    else
    {
      int v71 = 0;
      uint64_t started = _dnssec_obj_validation_manager_start_sub_query(v33, v45, 43, 2101248, v8, (uint64_t)_dnssec_query_key_record_result_reply, &v71);
      *(void *)(v31 + 80) = started;
      int v47 = v71;
      if (!v71)
      {
        int v48 = started;
        long long v49 = mDNSLogCategory_DNSSEC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_INFO))
          {
            int v50 = *(unsigned __int16 *)(v31 + 24);
            unsigned int v51 = bswap32(*((unsigned __int16 *)v48 + 170)) >> 16;
            if (v33)
            {
              int v52 = *(_DWORD *)(v33 + 24);
              uint64_t v53 = *(void *)(v33 + 16);
            }
            else
            {
              int v52 = 0;
              uint64_t v53 = 0;
            }
            goto LABEL_102;
          }
        }
        else
        {
          long long v49 = mDNSLogCategory_DNSSEC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_INFO))
          {
            int v50 = *(unsigned __int16 *)(v31 + 24);
            unsigned int v51 = bswap32(*((unsigned __int16 *)v48 + 170)) >> 16;
            if (v33)
            {
              int v52 = *(_DWORD *)(v33 + 24);
              uint64_t v53 = *(void *)(v33 + 16);
            }
            else
            {
              int v52 = 0;
              uint64_t v53 = 0;
            }
LABEL_102:
            *(_DWORD *)buf = 67110147;
            *(_DWORD *)BOOL v73 = v50;
            *(_WORD *)&v73[4] = 1024;
            *(_DWORD *)&v73[6] = v51;
            *(_WORD *)&v73[10] = 2160;
            *(void *)&v73[12] = 1752392040;
            LOWORD(v74) = 1040;
            *(_DWORD *)((char *)&v74 + 2) = v52;
            WORD3(v74) = 2101;
            *((void *)&v74 + 1) = v53;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[Q%u->SubQ%u] Possible DS denial found, starting secure DS denial query - DS name: %{sensitive, mask.hash, mdnsresponder:domain_name}.*P", buf, 0x28u);
          }
        }
        int v60 = 0;
        int v63 = (void *)v33;
        goto LABEL_104;
      }
    }
    int v60 = 0;
    int v70 = v47;
    int v63 = (void *)v33;
LABEL_116:
    _dnssec_obj_validation_manager_fail_insecure_validation(v31, v47);
    if (!v33) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }
  if (!dnssec_obj_domain_name_is_sub_domain_of(*(unsigned __int8 **)(v32 + 16), *(unsigned char **)(v33 + 16)))
  {
LABEL_140:
    int v60 = 0;
    int v63 = 0;
    int v47 = -6736;
    goto LABEL_115;
  }
  int v39 = *(unsigned __int8 **)(v32 + 16);
  unsigned int v40 = *v39;
  if (*v39)
  {
    uint64_t v41 = 0;
    uint64_t v42 = *(void *)(v32 + 16);
    do
    {
      ++v41;
      uint64_t v43 = v42 + v40;
      unsigned int v44 = *(unsigned __int8 *)(v43 + 1);
      uint64_t v42 = v43 + 1;
      unsigned int v40 = v44;
    }
    while (v44);
  }
  else
  {
    uint64_t v41 = 0;
  }
  uint64_t v54 = *(unsigned char **)(v33 + 16);
  int v55 = *v54;
  if (*v54)
  {
    uint64_t v56 = -1;
    do
    {
      size_t v57 = &v54[v55];
      int v58 = v57[1];
      uint64_t v54 = v57 + 1;
      int v55 = v58;
      ++v56;
    }
    while (v58);
    uint64_t v59 = -2 - v56;
  }
  else
  {
    uint64_t v59 = -1;
  }
  int v60 = dnssec_obj_domain_name_copy_parent_domain(v39, v41 + v59, &v70);
  int v47 = v70;
  if (v70) {
    goto LABEL_150;
  }
  _dnssec_obj_validation_manager_stop_negative_ds_query(v31);
  int v61 = _dnssec_obj_validation_manager_start_negative_ds_query(v31, v60, v8);
  int v70 = v61;
  if (v61)
  {
    int v47 = v61;
LABEL_150:
    int v63 = 0;
    goto LABEL_116;
  }
  if (v60) {
    ++*(_DWORD *)v60;
  }
  os_log_type_t v62 = *(void **)(v31 + 104);
  if (v62) {
    ref_count_obj_release(v62);
  }
  int v63 = 0;
  *(void *)(v31 + 104) = v60;
LABEL_104:
  int v70 = 0;
  if (v33) {
LABEL_105:
  }
    ref_count_obj_release((void *)v33);
LABEL_106:
  if (v60) {
    ref_count_obj_release(v60);
  }
  if (v63) {
    ref_count_obj_release(v63);
  }
}

void _dnssec_obj_resource_record_member_finalize(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 32) && !*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2)
    {
      ref_count_obj_release(v2);
      *(void *)(a1 + 48) = 0;
    }
  }
}

uint64_t _dnssec_obj_resource_record_member_compare()
{
  return 2;
}

_DWORD *_dnssec_obj_resource_record_member_new()
{
  BOOL result = malloc_type_calloc(1uLL, 0x38uLL, 0xF1748037uLL);
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = &_dnssec_obj_resource_record_member_kind;
    *((void *)result + 1) = &_dnssec_obj_resource_record_member_kind;
    do
    {
      int v3 = (void (*)(_DWORD *))v2[2];
      if (v3) {
        v3(v1);
      }
      uint64_t v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    ++*v1;
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t dnssec_obj_resource_record_member_get_validation_result(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32) == 1) {
    return *(unsigned int *)(a1 + 40);
  }
  uint64_t v2 = mDNSLogCategory_DNSSEC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_DNSSEC == mDNSLogCategory_State)
  {
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_12:
      int v4 = 136447234;
      uint64_t v5 = "me->aware_type == dnssec_aware_rr_validated";
      __int16 v6 = 2082;
      int v7 = "";
      __int16 v8 = 2082;
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSMacOSX/dnssec_v2/dnssec_objs/dnssec_obj_resource_record_member.c";
      __int16 v10 = 1024;
      int v11 = 210;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v4, 0x30u);
      return 0;
    }
  }
  else
  {
    uint64_t v2 = mDNSLogCategory_DNSSEC_redacted;
    uint64_t result = os_log_type_enabled((os_log_t)mDNSLogCategory_DNSSEC_redacted, OS_LOG_TYPE_FAULT);
    if (result) {
      goto LABEL_12;
    }
  }
  return result;
}

id _mdns_heuristics_log()
{
  if (_mdns_heuristics_log_s_once != -1) {
    dispatch_once(&_mdns_heuristics_log_s_once, &__block_literal_global_43_6483);
  }
  uint64_t v0 = (void *)_mdns_heuristics_log_s_log;

  return v0;
}

void ___mdns_heuristics_log_block_invoke(id a1)
{
  _mdns_heuristics_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "heuristics");

  _objc_release_x1();
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
  uint64_t v2 = _mdns_heuristics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_failure %@ %d", (uint8_t *)&v6, 0x12u);
  }

  +[DNSHeuristics reportResolutionFailure:*(void *)(a1 + 32) isTimeout:*(unsigned __int8 *)(a1 + 40)];
}

void __getHeuristicsQueue_block_invoke(id a1)
{
  getHeuristicsQueue_queue = (uint64_t)dispatch_queue_create("DNSHeuristicsQueue", 0);

  _objc_release_x1();
}

void __dns_heuristics_report_resolution_success_block_invoke(id a1)
{
  uint64_t v1 = _mdns_heuristics_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_success", v3, 2u);
  }

  +[DNSHeuristics updateHeuristicState:1 isTimeout:0];
}

void __mhc_bpf_open_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v5 = *(const void **)(a1 + 32);
  int v4 = *(NSObject **)(a1 + 40);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v6 = -1;
    int v7 = -6700;
    goto LABEL_12;
  }
  xpc_object_t v8 = _mdns_xpc_dictionary_get_object(object, "bpf_fd", (const _xpc_type_s *)&_xpc_type_fd);
  if (v8)
  {
    int v9 = xpc_fd_dup(v8);
    if ((v9 & 0x80000000) == 0)
    {
      int v6 = v9;
      int v7 = 0;
      goto LABEL_12;
    }
    int v10 = -6700;
  }
  else
  {
    int v10 = -6712;
  }
  unsigned int int64_limited = _mdns_xpc_dictionary_get_int64_limited(object, "error", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (int64_limited) {
    int v7 = int64_limited;
  }
  else {
    int v7 = v10;
  }
  int v6 = -1;
LABEL_12:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = ___mhc_bpf_open_reply_handler_block_invoke;
  v14[3] = &unk_10014AD98;
  v14[4] = _Block_copy(v5);
  int v15 = v6;
  int v16 = v7;
  dispatch_async(v4, v14);
  __int16 v12 = *(NSObject **)(a1 + 40);
  if (v12) {
    dispatch_release(v12);
  }
  uint64_t v13 = *(const void **)(a1 + 32);
  if (v13) {
    _Block_release(v13);
  }
}

void ___mhc_send_message_with_reply_block_invoke(uint64_t a1, xpc_object_t object)
{
}

void _mhc_common_reply_handler(_xpc_connection_s *a1, void *a2, xpc_object_t object, void (**a4)(void, void))
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, "command");
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_5_6539);
    }
    int v9 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_ERROR))
    {
      if (!string) {
        string = "<NO COMMAND>";
      }
      *(_DWORD *)buf = 136446722;
      __int16 v12 = string;
      __int16 v13 = 2114;
      uint64_t v14 = a1;
      __int16 v15 = 2082;
      int v16 = xpc_dictionary_get_string(object, _xpc_error_key_description);
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s request received error reply -- connection: %{public}@, error: %{public}s", buf, 0x20u);
    }
  }
  if (object == &_xpc_error_connection_interrupted)
  {
    if (_mhc_queue_s_once != -1) {
      dispatch_once(&_mhc_queue_s_once, &__block_literal_global_14);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = ___mhc_common_reply_handler_block_invoke;
    handler[3] = &unk_10014AD70;
    void handler[5] = a1;
    handler[6] = a2;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(a1, a2, (dispatch_queue_t)_mhc_queue_s_queue, handler);
  }
  else
  {
    if (a1)
    {
      xpc_connection_cancel(a1);
      xpc_release(a1);
    }
    if (a2) {
      xpc_release(a2);
    }
    if (a4)
    {
      ((void (**)(void, xpc_object_t))a4)[2](a4, object);
      _Block_release(a4);
    }
  }
}

uint64_t ___mhc_common_reply_handler_block_invoke(uint64_t a1, xpc_object_t object)
{
  return _mhc_common_reply_handler(*(void *)(a1 + 40), *(void *)(a1 + 48), object);
}

void ___mhc_log_block_invoke(id a1)
{
  _mhc_log_s_log = (uint64_t)os_log_create("com.apple.mDNSResponder", "helper_client");
}

void ___mhc_queue_block_invoke(id a1)
{
  _mhc_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mhc", 0);
}

void ___mhc_create_connection_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_5_6539);
    }
    int v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2082;
      string = xpc_dictionary_get_string(object, _xpc_error_key_description);
      int v6 = "Connection received error event -- connnection: %{public}@, error: %{public}s";
      goto LABEL_11;
    }
  }
  else
  {
    if (_mhc_log_s_once != -1) {
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_5_6539);
    }
    int v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      string = (const char *)object;
      int v6 = "Connection received unexpected event -- connection: %{public}@, event: %@";
LABEL_11:
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v8, 0x16u);
    }
  }
}

void ___mhc_bpf_open_reply_handler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    _Block_release(v2);
  }
}

void BindDPSocket(int a1, int a2, int a3)
{
  int v26 = 1;
  if (a3 == 1 && setsockopt(a1, 0xFFFF, 4, &v26, 4u))
  {
    int v5 = *__error();
    int v6 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      if (a2 == 2) {
        int v8 = "IPv4";
      }
      else {
        int v8 = "IPv6";
      }
      goto LABEL_22;
    }
    int v6 = mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 == 2) {
        int v8 = "IPv4";
      }
      else {
        int v8 = "IPv6";
      }
LABEL_22:
      uint64_t v18 = strerror(v5);
      *(_DWORD *)uint64_t v27 = 136446978;
      *(void *)&uint8_t v27[4] = v8;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = a1;
      *(_WORD *)&v27[18] = 1024;
      *(_DWORD *)&v27[20] = v5;
      LOWORD(v28[0]) = 2082;
      *(void *)((char *)v28 + 2) = v18;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BindDPSocket: setsockopt SO_REUSEADDR failed for %{public}s %d errno %d (%{public}s)", v27, 0x22u);
    }
  }
  else if (a2 == 2)
  {
    *(void *)uint64_t v27 = 889192960;
    *(void *)&v27[8] = 0;
    if (bind(a1, (const sockaddr *)v27, 0x10u))
    {
      uint64_t v9 = mDNSLogCategory_Default;
      __error();
      __int16 v10 = __error();
      strerror(*v10);
      LogMsgWithLevel(v9, OS_LOG_TYPE_DEFAULT, "BindDPSocket: bind %d errno %d (%s)", v11, v12, v13, v14, v15, a1);
    }
  }
  else
  {
    if (setsockopt(a1, 41, 27, &v26, 4u) < 0)
    {
      int v16 = "DPFBindSocket: setsockopt IPV6_V6ONLY %d errno %d (%s)";
    }
    else
    {
      *(void *)uint64_t v27 = 889200128;
      *(void *)&v27[8] = 0;
      v28[0] = 0;
      *(void *)&v27[16] = 0;
      if (!bind(a1, (const sockaddr *)v27, 0x1Cu)) {
        return;
      }
      int v16 = "BindDPSocket: bind6 %d errno %d (%s)";
    }
    int v19 = mDNSLogCategory_Default;
    __error();
    unsigned int v20 = __error();
    strerror(*v20);
    LogMsgWithLevel(v19, OS_LOG_TYPE_DEFAULT, v16, v21, v22, v23, v24, v25, a1);
  }
}

uint64_t SetupUDPProxySocket(int a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v53 = 1;
  a2[1] = mDNSStorage;
  a2[10] = 0;
  if (a3 == 2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 6;
  }
  if (a3 == 2) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 7;
  }
  if (a3 == 2) {
    uint64_t v12 = a2 + 3;
  }
  else {
    uint64_t v12 = a2 + 7;
  }
  if (a3 != 2)
  {
    if (a3 != 30)
    {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: wrong family %d", a4, a5, a6, a7, a8, a3);
      return 0xFFFFFFFFLL;
    }
    uint64_t v22 = setsockopt(a1, 41, 61, &v53, 4u);
    if ((v22 & 0x80000000) != 0)
    {
      uint64_t v14 = v22;
      int v37 = mDNSLogCategory_Default;
      __error();
      uint64_t v38 = __error();
      strerror(*v38);
      LogMsgWithLevel(v37, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IPV6_RECVPKTINFO %d errno %d (%s)", v39, v40, v41, v42, v43, a1);
      return v14;
    }
    uint64_t v14 = setsockopt(a1, 41, 37, &v53, 4u);
    if ((v14 & 0x80000000) != 0)
    {
      unsigned int v44 = mDNSLogCategory_Default;
      __error();
      __int16 v45 = __error();
      strerror(*v45);
      LogMsgWithLevel(v44, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IPV6_RECVHOPLIMIT %d errno %d (%s)", v46, v47, v48, v49, v50, a1);
      return v14;
    }
LABEL_17:
    int v23 = fcntl(a1, 3, 0);
    if ((fcntl(a1, 4, v23 | 4u) & 0x80000000) == 0)
    {
      LODWORD(a2[v10]) = a1;
      a2[v11] = myKQSocketCallBack;
      v12[1] = a2;
      _DWORD v12[2] = "UDP Proxy packet reception";
      KQueueSet(a1, 1u, -1, v12);
      return v14;
    }
    uint64_t v31 = mDNSLogCategory_Default;
    int v52 = *__error();
    LogMsgWithLevel(v31, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: fnctl failed %d", v32, v33, v34, v35, v36, v52);
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = setsockopt(a1, 0, 7, &v53, 4u);
  if ((v13 & 0x80000000) != 0)
  {
    uint64_t v14 = v13;
    uint64_t v24 = mDNSLogCategory_Default;
    __error();
    uint64_t v25 = __error();
    strerror(*v25);
    LogMsgWithLevel(v24, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IP_RECVDSTADDR %d errno %d (%s)", v26, v27, v28, v29, v30, a1);
    return v14;
  }
  uint64_t v14 = setsockopt(a1, 0, 20, &v53, 4u);
  if ((v14 & 0x80000000) == 0) {
    goto LABEL_17;
  }
  uint64_t v15 = mDNSLogCategory_Default;
  __error();
  int v16 = __error();
  strerror(*v16);
  LogMsgWithLevel(v15, OS_LOG_TYPE_DEFAULT, "SetupUDPProxySocket: IP_RECVIF %d errno %d (%s)", v17, v18, v19, v20, v21, a1);
  return v14;
}

uint64_t SetupTCPProxySocket(int a1, uint64_t a2)
{
  uint64_t v4 = listen(a1, 100);
  if (v4)
  {
    int v5 = mDNSLogCategory_Default;
    __error();
    int v6 = __error();
    strerror(*v6);
    LogMsgWithLevel(v5, OS_LOG_TYPE_DEFAULT, "SetupTCPProxySocket: listen %d errno %d (%s)", v7, v8, v9, v10, v11, a1);
  }
  else
  {
    int v12 = fcntl(a1, 3, 0);
    fcntl(a1, 4, v12 | 4u);
    *(_DWORD *)(a2 + 16) = a1;
    *(void *)(a2 + 24) = ProxyTCPAccept;
    *(void *)(a2 + 32) = a2;
    *(void *)(a2 + 40) = "TCP Accept";
    *(void *)(a2 + 72) = mDNSStorage;
    KQueueSet(a1, 1u, -1, (void *)(a2 + 24));
  }
  return v4;
}

uint64_t ProxyTCPAccept(int a1, uint64_t a2, uint64_t a3)
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  sockaddr v20 = (sockaddr)0;
  long long v21 = 0u;
  int v5 = "ProxyTCPAccept: IP_RECVIF %d errno %d (%s)";
  int v18 = 1;
  socklen_t v19 = 128;
  while (1)
  {
    uint64_t result = accept(a1, &v20, &v19);
    if (result == -1) {
      return result;
    }
    int v7 = result;
    uint64_t v8 = malloc_type_calloc(1uLL, 0x68uLL, 0xF1748037uLL);
    if (!v8) {
      __break(1u);
    }
    uint64_t v9 = v8;
    v8[4] = -1;
    *((void *)v8 + 9) = *(void *)(a3 + 72);
    int v10 = fcntl(v7, 3, 0);
    fcntl(v7, 4, v10 | 4u);
    if (v20.sa_family == 2)
    {
      if (setsockopt(v7, 0, 20, &v18, 4u)) {
        goto LABEL_10;
      }
    }
    else if (setsockopt(v7, 41, 61, &v18, 4u))
    {
      int v5 = "ProxyTCPAccept: IP_RECVPKTINFO %d errno %d (%s)";
LABEL_10:
      uint64_t v11 = mDNSLogCategory_Default;
      __error();
      int v12 = __error();
      strerror(*v12);
      LogMsgWithLevel(v11, OS_LOG_TYPE_DEFAULT, v5, v13, v14, v15, v16, v17, v7);
      mDNSPlatformDisposeProxyContext(v9);
      return close(v7);
    }
    v9[4] = v7;
    *((void *)v9 + 3) = ProxyTCPSocketCallBack;
    *((void *)v9 + 4) = v9;
    *((void *)v9 + 5) = "TCP Proxy packet reception";
    *((unsigned char *)v9 + 65) = 1;
    *((void *)v9 + 9) = *(void *)(a3 + 72);
    KQueueSet(v7, 1u, -1, v9 + 6);
  }
}

void mDNSPlatformDisposeProxyContext(_DWORD *a1)
{
  if (a1)
  {
    int v2 = a1[4];
    if ((v2 & 0x80000000) == 0)
    {
      close(v2);
      a1[4] = -1;
    }
    uint64_t v3 = (void *)*((void *)a1 + 11);
    if (v3) {
      free(v3);
    }
    free(a1);
  }
}

void ProxyTCPSocketCallBack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  memset(v83, 0, sizeof(v83));
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  memset(v76, 0, sizeof(v76));
  memset(v75, 0, 20);
  memset(v74, 0, 20);
  uint64_t v73 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  memset(v50, 0, sizeof(v50));
  socklen_t v49 = 408;
  LOBYTE(v48) = 0;
  uint64_t v5 = *(unsigned int *)(a3 + 100);
  if (v5 >= 2)
  {
    uint64_t v13 = *(char **)(a3 + 88);
  }
  else
  {
    ssize_t v6 = mDNSPlatformReadTCP(a3, (void *)(a3 + v5 + 96), 2 - v5, &v48);
    if (v6 < 0 || (_BYTE)v48)
    {
      uint64_t v29 = mDNSLogCategory_Default;
      uint64_t v28 = "ProxyTCPRead: attempt to read message length failed";
      goto LABEL_18;
    }
    unsigned int v12 = *(_DWORD *)(a3 + 100) + v6;
    *(_DWORD *)(a3 + 100) = v12;
    if (v12 <= 1)
    {
      LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPRead: nread %d, n %d", v7, v8, v9, v10, v11, v12);
      return;
    }
    size_t v30 = __rev16(*(unsigned __int16 *)(a3 + 96));
    *(_WORD *)(a3 + 96) = v30;
    if (v30 <= 0xB)
    {
      uint64_t v27 = mDNSLogCategory_Default;
      int v41 = v30;
      uint64_t v28 = "ProxyTCPRead: Message length too short (%d bytes)";
      goto LABEL_16;
    }
    uint64_t v13 = (char *)malloc_type_malloc(v30, 0xA172743EuLL);
    if (!v13) {
      __break(1u);
    }
    *(void *)(a3 + 88) = v13;
    LODWORD(v5) = *(_DWORD *)(a3 + 100);
  }
  ssize_t v14 = mDNSPlatformReadTCP(a3, &v13[(v5 - 2)], *(unsigned __int16 *)(a3 + 96) - (v5 - 2), &v48);
  if ((v14 & 0x8000000000000000) == 0 && !(_BYTE)v48)
  {
    int v15 = *(_DWORD *)(a3 + 100) + v14;
    *(_DWORD *)(a3 + 100) = v15;
    if (v15 - 2 != *(unsigned __int16 *)(a3 + 96)) {
      return;
    }
    KQueueSet(a1, 2u, -1, (void *)(a3 + 24));
    memset(v76, 0, sizeof(v76));
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    memset(v83, 0, sizeof(v83));
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    socklen_t v48 = 128;
    if (getsockname(a1, v76, &v48) < 0)
    {
      uint64_t v31 = mDNSLogCategory_Default;
      int v42 = a1;
      __error();
      int v37 = "ProxyTCPReceive: getsockname(fd=%d) errno %d";
    }
    else
    {
      if ((getpeername(a1, v83, &v48) & 0x80000000) == 0)
      {
        if (getsockopt(a1, 6, 512, v50, &v49))
        {
          long long v21 = mDNSLogCategory_Default;
          __error();
          LogMsgWithLevel(v21, OS_LOG_TYPE_DEFAULT, "ProxyTCPReceive: getsockopt for TCP_INFO failed (fd=%d) errno %d", v22, v23, v24, v25, v26, a1);
          return;
        }
        uint64_t v38 = SHIDWORD(v51);
        if (v83[0].sa_family == 30)
        {
          LODWORD(v75[0]) = 6;
          *(sockaddr *)((char *)v75 + 4) = *(sockaddr *)&v83[0].sa_data[6];
          unsigned int v39 = *(unsigned __int16 *)v83[0].sa_data;
          LODWORD(v74[0]) = 6;
          *(sockaddr *)((char *)v74 + 4) = *(sockaddr *)&v76[0].sa_data[6];
          if (mDNS_LoggingEnabled)
          {
            uint64_t v40 = "ProxyTCPReceive received IPv6 packet(len %d) from %#-15a to %#-15a on skt %d %s ifindex %d";
            goto LABEL_36;
          }
LABEL_37:
          (*(void (**)(uint64_t, void, void, void *, void, void *, uint64_t, uint64_t, uint64_t, void *, void *, uint64_t, uint64_t, uint64_t))(**(void **)(a3 + 72) + 984))(a3, *(void *)(a3 + 88), *(void *)(a3 + 88) + *(unsigned __int16 *)(a3 + 96), v75, v39, v74, 13568, v38, a3, v43, v44, v45, v46, v47);
          return;
        }
        if (v83[0].sa_family == 2)
        {
          LODWORD(v75[0]) = 4;
          HIDWORD(v75[0]) = *(_DWORD *)&v83[0].sa_data[2];
          unsigned int v39 = *(unsigned __int16 *)v83[0].sa_data;
          LODWORD(v74[0]) = 4;
          HIDWORD(v74[0]) = *(_DWORD *)&v76[0].sa_data[2];
          if (mDNS_LoggingEnabled)
          {
            uint64_t v40 = "ProxyTCPReceive received IPv4 packet(len %d) from %#-15a to %#-15a on skt %d %s ifindex %d";
LABEL_36:
            uint64_t v46 = 0;
            uint64_t v47 = SHIDWORD(v51);
            unsigned int v44 = v74;
            uint64_t v45 = a1;
            uint64_t v43 = v75;
            LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, v40, v16, v17, v18, v19, v20, *(unsigned __int16 *)(a3 + 96));
            goto LABEL_37;
          }
          goto LABEL_37;
        }
        LogMsgWithLevel(mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT, "ProxyTCPReceive from is unknown address family %d", v16, v17, v18, v19, v20, v83[0].sa_family);
LABEL_28:
        mDNSPlatformDisposeProxyContext((_DWORD *)a3);
        return;
      }
      uint64_t v31 = mDNSLogCategory_Default;
      int v42 = a1;
      __error();
      int v37 = "ProxyTCPReceive: getpeername(fd=%d) errno %d";
    }
    LogMsgWithLevel(v31, OS_LOG_TYPE_DEFAULT, v37, v32, v33, v34, v35, v36, v42);
    goto LABEL_28;
  }
  uint64_t v27 = mDNSLogCategory_Default;
  int v41 = v14;
  uint64_t v28 = "ProxyTCPRead: read failure n %d, closed %d";
LABEL_16:
  uint64_t v29 = v27;
LABEL_18:
  LogMsgWithLevel(v29, OS_LOG_TYPE_DEFAULT, v28, v7, v8, v9, v10, v11, v41);

  mDNSPlatformDisposeProxyContext((_DWORD *)a3);
}

void __mdns_system_log_block_invoke(id a1)
{
  mdns_system_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "system");
}

const __SCPreferences *_mdns_system_create_locked_prefs(int *a1)
{
  int v2 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, @"com.apple.mDNSResponder", 0, kSCPreferencesUseEntitlementAuthorization);
  if (!v2)
  {
    if (SCError())
    {
      int v3 = SCError();
      if (!v3) {
        goto LABEL_4;
      }
      int v5 = v3;
    }
    else
    {
      int v5 = -6700;
    }
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6764);
    }
    ssize_t v6 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      uint64_t v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "SCPreferencesCreateWithAuthorization failed: %{mdns:err}ld", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v4 = 0;
LABEL_23:
    int v2 = 0;
    if (!a1) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_4:
  if (SCPreferencesLock(v2, 0))
  {
    uint64_t v4 = 0;
    int v5 = 0;
    if (!a1) {
      goto LABEL_25;
    }
LABEL_24:
    *a1 = v5;
    goto LABEL_25;
  }
  if (!SCError())
  {
    int v5 = -6700;
    goto LABEL_18;
  }
  int v5 = SCError();
  if (v5)
  {
LABEL_18:
    if (mdns_system_log_s_once != -1) {
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6764);
    }
    uint64_t v7 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      uint64_t v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed: %{mdns:err}ld", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v4 = v2;
    goto LABEL_23;
  }
  uint64_t v4 = 0;
  if (a1) {
    goto LABEL_24;
  }
LABEL_25:
  if (v4) {
    CFRelease(v4);
  }
  return v2;
}

uint64_t _mdns_system_commit_and_apply_prefs(const __SCPreferences *a1)
{
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
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6764);
    }
    uint64_t v4 = mdns_system_log_s_log;
    if (!os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR)) {
      return v3;
    }
    int v7 = 134217984;
    uint64_t v8 = (int)v3;
    int v5 = "SCPreferencesCommitChanges failed: %{mdns:err}ld";
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
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
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6764);
  }
  uint64_t v4 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    int v7 = 134217984;
    uint64_t v8 = (int)v3;
    int v5 = "SCPreferencesApplyChanges failed: %{mdns:err}ld";
    goto LABEL_20;
  }
  return v3;
}

void _mdns_system_unlock_and_forget_prefs(const __SCPreferences **a1)
{
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
          dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6764);
        }
        uint64_t v4 = mdns_system_log_s_log;
        if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
        {
          int v5 = 134217984;
          uint64_t v6 = v3;
          _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "SCPreferencesUnlock failed: %{mdns:err}ld", (uint8_t *)&v5, 0xCu);
        }
      }
    }
    CFRelease(v1);
  }
}

char *mdns_system_interface_index_to_name(unsigned int a1)
{
  *(void *)int v9 = 0;
  uint64_t v10 = 0;
  char v11 = 0;
  int v2 = if_indextoname(a1, v9);
  if (v2)
  {
    uint64_t result = strdup(v2);
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
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_6764);
  }
  int v5 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = a1;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "if_indextoname() for %u failed: %{darwin.errno}ld", (uint8_t *)v6, 0x12u);
  }
  return 0;
}

uint64_t mdns_system_pid_to_uuid(int a1, unsigned __int8 *a2)
{
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

uint64_t mdns_system_pid_to_name(int a1, uint64_t a2)
{
  long long v6 = 0u;
  memset(v7, 0, sizeof(v7));
  if (proc_pidinfo(a1, 13, 1uLL, &v6, 64) != 64) {
    return 0;
  }
  if (!a2) {
    __break(1u);
  }
  uint64_t v3 = 0;
  while (1)
  {
    int v4 = *((unsigned __int8 *)v7 + v3);
    *(unsigned char *)(a2 + v3) = v4;
    if (!v4) {
      break;
    }
    if (++v3 == 15)
    {
      *(unsigned char *)(a2 + 15) = 0;
      return a2;
    }
  }
  return a2;
}

void _mdns_push_server_finalize(void *a1)
{
  int v2 = (void *)a1[6];
  if (v2)
  {
    os_release(v2);
    a1[6] = 0;
  }
  uint64_t v3 = (const void *)a1[8];
  if (v3)
  {
    CFRelease(v3);
    a1[8] = 0;
  }
  int v4 = (const void *)a1[9];
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
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  int v24 = 0;
  long long v6 = (void *)mdns_string_builder_create();
  if (!v6)
  {
    char v11 = 0;
    goto LABEL_15;
  }
  __int16 v7 = v6;
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
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 0x40000000;
    v18[2] = ___mdns_push_server_copy_description_block_invoke;
    v18[3] = &unk_10014AEE0;
    v18[5] = v20;
    v18[6] = v7;
    v18[4] = &v21;
    char v19 = a3;
    mdns_cfarray_enumerate(v9, (uint64_t)v18);
    int v10 = mdns_string_builder_append_formatted(v7, "}");
    *((_DWORD *)v22 + 6) = v10;
    _Block_object_dispose(v20, 8);
    char v11 = 0;
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
  int v15 = *(const char **)(a1 + 56);
  if (!v15) {
    int v15 = "";
  }
  int v16 = mdns_string_builder_append_formatted(v7, "interface: %s/%u", v15, *(_DWORD *)(a1 + 96));
  *((_DWORD *)v22 + 6) = v16;
  if (v16) {
LABEL_13:
  }
    char v11 = 0;
  else {
    char v11 = mdns_string_builder_copy_string((uint64_t)v7);
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

void *mdns_push_server_create()
{
  uint64_t v0 = _os_object_alloc();
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    int v2 = &_mdns_push_server_kind;
    *(void *)(v0 + 16) = &_mdns_push_server_kind;
    do
    {
      uint64_t v3 = (void (*)(void *))v2[2];
      if (v3) {
        v3(v1);
      }
      int v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
    v1[8] = Mutable;
    if (!Mutable || (CFMutableArrayRef v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks), (v1[9] = v5) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void mdns_push_server_set_srv_name(uint64_t a1, void *object)
{
  if (!*(unsigned char *)(a1 + 103))
  {
    os_retain(object);
    int v4 = *(void **)(a1 + 48);
    if (v4) {
      os_release(v4);
    }
    *(void *)(a1 + 48) = object;
  }
}

void *mdns_push_server_create_subscriber(void *a1)
{
  uint64_t v2 = _os_object_alloc();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  int v4 = &_mdns_subscriber_kind;
  *(void *)(v2 + 16) = &_mdns_subscriber_kind;
  do
  {
    CFMutableArrayRef v5 = (void (*)(void *))v4[2];
    if (v5) {
      v5(v3);
    }
    int v4 = (_UNKNOWN **)*v4;
  }
  while (v4);
  v3[15] = atomic_fetch_add_explicit(&mdns_push_server_create_subscriber_s_last_id, 1uLL, memory_order_relaxed) + 1;
  os_retain(a1);
  long long v6 = (void *)v3[7];
  if (v6) {
    os_release(v6);
  }
  v3[7] = a1;
  if (_mdns_domain_name_get_root_s_once != -1) {
    dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
  }
  uint64_t v7 = _mdns_domain_name_get_root_s_root;
  v3[10] = _mdns_domain_name_get_root_s_root;
  if (v7) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = 0;
  }
  if (!v7) {
    os_release(v3);
  }
  return v8;
}

uint64_t _mdns_subscriber_get_class(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 130);
}

uint64_t _mdns_subscriber_get_type(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 128);
}

uint64_t _mdns_subscriber_get_name(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

void _mdns_subscriber_invalidate(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  unsigned __int8 v29 = 0;
  int v3 = _mdns_subscriber_list_remove((uint64_t *)(v2 + 24), (void *)a1, &v29);
  if (v3)
  {
    if (!v29) {
      goto LABEL_15;
    }
  }
  else
  {
    _mdns_subscriber_list_remove((uint64_t *)(v2 + 32), (void *)a1, &v29);
  }
  int v4 = v3 ^ 1;
  uint64_t v5 = *(void *)(v2 + 40);
  uint64_t v6 = *(void *)(a1 + 120);
  if (v5)
  {
    if (_mdns_push_notifications_log_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
    }
    uint64_t v7 = _mdns_push_notifications_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v5 + 40);
      int v9 = *(unsigned __int8 *)(v2 + 102);
      *(_DWORD *)buf = 134219522;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&unsigned char buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v31 = (void *)v2;
      *(_WORD *)uint64_t v32 = 2112;
      *(void *)&_DWORD v32[2] = a1;
      *(_WORD *)&v32[10] = 1024;
      *(_DWORD *)uint64_t v33 = v4;
      *(_WORD *)&v33[4] = 1024;
      int v34 = v29;
      __int16 v35 = 1024;
      int v36 = v9;
      int v10 = "[Sub%llu->DSO%llu] Subscriber removed -- server: %@, subscriber: %@, pending: %{mdns:yesno}d, duplicate: %{m"
            "dns:yesno}d, session ready: %{mdns:yesno}d";
      char v11 = v7;
      uint32_t v12 = 60;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else
  {
    if (_mdns_push_notifications_log_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
    }
    uint64_t v13 = _mdns_push_notifications_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *(unsigned __int8 *)(v2 + 102);
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&unsigned char buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v31 = (void *)a1;
      *(_WORD *)uint64_t v32 = 1024;
      *(_DWORD *)&_DWORD v32[2] = v4;
      *(_WORD *)&v32[6] = 1024;
      *(_DWORD *)&v32[8] = v29;
      *(_WORD *)uint64_t v33 = 1024;
      *(_DWORD *)&v33[2] = v14;
      int v10 = "[Sub%llu] Subscriber removed -- server: %@, subscriber: %@, pending: %{mdns:yesno}d, duplicate: %{mdns:yesno"
            "}d, session ready: %{mdns:yesno}d";
      char v11 = v13;
      uint32_t v12 = 50;
      goto LABEL_14;
    }
  }
LABEL_15:
  if (*(_WORD *)(a1 + 132))
  {
    if (!v29)
    {
      uint64_t v18 = *(void *)(v2 + 40);
      if (v18)
      {
        if (*(unsigned char *)(v2 + 102))
        {
          uint64_t v19 = *(void *)(a1 + 120);
          if (_mdns_push_notifications_log_s_once != -1) {
            dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
          }
          uint64_t v20 = _mdns_push_notifications_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(v18 + 40);
            *(_DWORD *)buf = 134218754;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&unsigned char buf[14] = v21;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v31 = (void *)v2;
            *(_WORD *)uint64_t v32 = 2112;
            *(void *)&_DWORD v32[2] = a1;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Sub%llu->DSO%llu] Subscriber removed and unsubscribing from the session -- server: %@, subscriber: %@", buf, 0x2Au);
          }
          uint64_t v22 = _os_object_alloc();
          uint64_t v23 = (_WORD *)v22;
          if (v22)
          {
            int v24 = &_mdns_dso_unsubscribe_message_builder_kind;
            *(void *)(v22 + 16) = &_mdns_dso_unsubscribe_message_builder_kind;
            do
            {
              uint64_t v25 = (void (*)(_WORD *))v24[2];
              if (v25) {
                v25(v23);
              }
              int v24 = (_UNKNOWN **)*v24;
            }
            while (v24);
          }
          v23[14] = 0;
          v23[16] = *(_WORD *)(a1 + 132);
          message = (NSObject **)mdns_dso_message_builder_create_message((uint64_t)v23);
          mdns_dso_session_send(*(void **)(v2 + 40), message[3]);
          os_release(message);
          os_release(v23);
          uint64_t v27 = *(void **)(v2 + 40);
          if ((*(unsigned int (**)(void *))(v27[2] + 104))(v27))
          {
            os_retain(v27);
            if (_mdns_dso_session_queue_s_once != -1) {
              dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
            }
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 0x40000000;
            *(void *)&buf[16] = __mdns_dso_session_remove_activity_block_invoke;
            uint64_t v31 = &__block_descriptor_tmp_4_6047;
            *(void *)uint64_t v32 = v27;
            dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, buf);
          }
        }
      }
    }
    *(_WORD *)(a1 + 132) = 0;
  }
  int v15 = *(NSObject **)(a1 + 88);
  if (v15)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 88));
    dispatch_release(v15);
    *(void *)(a1 + 88) = 0;
  }
  int v16 = *(const void **)(a1 + 104);
  *(void *)(a1 + 104) = 0;
  if (v16)
  {
    uint64_t v17 = *(NSObject **)(a1 + 24);
    if (v17)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 0x40000000;
      v28[2] = ___mdns_subscriber_invalidate_block_invoke;
      v28[3] = &unk_10014B068;
      _DWORD v28[4] = v16;
      dispatch_async(v17, v28);
    }
    _Block_release(v16);
  }
}

uint64_t _mdns_subscriber_list_remove(uint64_t *a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = *a1;
  if (!*a1) {
    goto LABEL_5;
  }
  uint64_t v6 = a1;
  while ((_mdns_subscriber_equal(v4, (uint64_t)a2) & 1) == 0)
  {
    uint64_t v6 = (uint64_t *)(v4 + 64);
    uint64_t v4 = *(void *)(v4 + 64);
    if (!v4) {
      goto LABEL_5;
    }
  }
  if ((void *)v4 != a2)
  {
    do
    {
      uint64_t v8 = v4;
      uint64_t v4 = *(void *)(v4 + 72);
      if (v4) {
        BOOL v9 = v4 == (void)a2;
      }
      else {
        BOOL v9 = 1;
      }
    }
    while (!v9);
    if (v4)
    {
      *(void *)(v8 + 72) = a2[9];
LABEL_18:
      LOBYTE(v4) = 1;
      goto LABEL_19;
    }
LABEL_5:
    uint64_t result = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_6;
  }
  uint64_t v10 = a2[9];
  if (v10)
  {
    uint64_t *v6 = v10;
    *(void *)(v10 + 64) = a2[8];
    goto LABEL_18;
  }
  LOBYTE(v4) = 0;
  uint64_t *v6 = a2[8];
LABEL_19:
  a2[8] = 0;
  a2[9] = 0;
  os_release(a2);
  uint64_t result = 1;
  if (a3) {
LABEL_6:
  }
    *a3 = v4;
  return result;
}

uint64_t ___mdns_subscriber_invalidate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___mdns_push_notifications_log_block_invoke(id a1)
{
  _mdns_push_notifications_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "push_notifications");
}

uint64_t _mdns_subscriber_equal(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if (*(unsigned __int16 *)(a1 + 128) == *(unsigned __int16 *)(a2 + 128)
    && *(unsigned __int16 *)(a1 + 130) == *(unsigned __int16 *)(a2 + 130))
  {
    return _mdns_domain_name_equal(*(void *)(a1 + 80), *(void *)(a2 + 80));
  }
  return 0;
}

void _mdns_subscriber_activate(_WORD *object)
{
  uint64_t v2 = *((void *)object + 7);
  uint64_t v45 = 0;
  if ((_mdns_subscriber_list_insert_conditionally((uint64_t *)(v2 + 24), object, 0, &v45) & 1) == 0) {
    _mdns_subscriber_list_insert_conditionally((uint64_t *)(v2 + 32), object, 1, 0);
  }
  if (!*(void *)(v2 + 40))
  {
    uint64_t v3 = _os_object_alloc();
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = &_mdns_dso_client_session_kind;
      *(void *)(v3 + 16) = &_mdns_dso_client_session_kind;
      do
      {
        uint64_t v6 = (void (*)(uint64_t))v5[2];
        if (v6) {
          v6(v4);
        }
        uint64_t v5 = (_UNKNOWN **)*v5;
      }
      while (v5);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
      *(void *)(v4 + 152) = Mutable;
      if (!Mutable) {
        uint64_t v4 = 0;
      }
    }
    if (CFArrayGetCount(*(CFArrayRef *)(v2 + 64)) < 1)
    {
      BOOL v9 = *(void **)(v2 + 48);
      if (v9 && !*(unsigned char *)(v4 + 124))
      {
        *(void *)(v4 + 136) = v9;
        os_retain(v9);
      }
    }
    else
    {
      CFArrayRef v8 = *(const __CFArray **)(v2 + 64);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 0x40000000;
      v44[2] = ___mdns_push_server_add_subscriber_block_invoke;
      v44[3] = &__block_descriptor_tmp_20_6825;
      v44[4] = v4;
      mdns_cfarray_enumerate(v8, (uint64_t)v44);
    }
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 72));
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      for (CFIndex i = 0; i != v11; ++i)
      {
        CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 72), i);
        if (!*(unsigned char *)(v4 + 124))
        {
          CFDataRef v14 = ValueAtIndex;
          if (*(void *)(v4 + 160)
            || (CFMutableArrayRef v15 = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks),
                (*(void *)(v4 + 160) = v15) != 0))
          {
            SecCertificateRef v16 = SecCertificateCreateWithData(kCFAllocatorDefault, v14);
            if (v16)
            {
              SecCertificateRef v17 = v16;
              CFArrayAppendValue(*(CFMutableArrayRef *)(v4 + 160), v16);
              CFRelease(v17);
            }
          }
        }
      }
    }
    if (!*(unsigned char *)(v4 + 124)) {
      *(_DWORD *)(v4 + 208) = *(_DWORD *)(v2 + 96);
    }
    if (_mdns_push_notifications_queue_s_once != -1) {
      dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_36);
    }
    if (!*(unsigned char *)(v4 + 124))
    {
      uint64_t v18 = _mdns_push_notifications_queue_s_queue;
      uint64_t v19 = *(NSObject **)(v4 + 48);
      if (v19) {
        dispatch_release(v19);
      }
      *(void *)(v4 + 48) = v18;
      dispatch_retain(v18);
      if (!*(unsigned char *)(v4 + 124))
      {
        *(int32x2_t *)(v4 + 116) = vdup_n_s32(0x3A98u);
        *(_WORD *)(v4 + 212) = 1;
      }
    }
    os_retain((void *)v2);
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000;
    aBlock[2] = ___mdns_push_server_add_subscriber_block_invoke_2;
    aBlock[3] = &__block_descriptor_tmp_23_6826;
    aBlock[4] = v2;
    aBlock[5] = v4;
    if (!*(unsigned char *)(v4 + 124))
    {
      uint64_t v20 = _Block_copy(aBlock);
      uint64_t v21 = *(const void **)(v4 + 200);
      if (v21) {
        _Block_release(v21);
      }
      *(void *)(v4 + 200) = v20;
    }
    if (*(void *)(v2 + 88) && *(void *)(v2 + 80) && !*(unsigned char *)(v4 + 124)) {
      *(unsigned char *)(v4 + 215) = 1;
    }
    *(void *)(v2 + 40) = v4;
    os_retain((void *)v4);
    uint64_t v22 = *(void *)(v2 + 40);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 0x40000000;
    v42[2] = ___mdns_push_server_add_subscriber_block_invoke_4;
    v42[3] = &__block_descriptor_tmp_25_6827;
    v42[4] = v2;
    if (!*(unsigned char *)(v22 + 124))
    {
      uint64_t v23 = _Block_copy(v42);
      int v24 = *(const void **)(v22 + 64);
      if (v24) {
        _Block_release(v24);
      }
      *(void *)(v22 + 64) = v23;
      uint64_t v25 = *(void *)(v2 + 40);
      if (!*(unsigned char *)(v25 + 124))
      {
        if (*(void *)(v25 + 48))
        {
          if (*(void *)(v25 + 64))
          {
            uint64_t v26 = *(void *)(v25 + 16);
            if (!(*(unsigned int (**)(void))(v26 + 56))(*(void *)(v2 + 40)))
            {
              if (_mdns_dso_session_log_s_once != -1) {
                dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_5984);
              }
              uint64_t v27 = _mdns_dso_session_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v28 = *(void *)(v25 + 40);
                *(_DWORD *)buf = 134218242;
                uint64_t v47 = v28;
                __int16 v48 = 2112;
                uint64_t v49 = v25;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[DSO%llu] DSO session start -- session: %@", buf, 0x16u);
              }
              int v29 = (*(uint64_t (**)(uint64_t))(v26 + 48))(v25);
              *(void *)(v25 + 24) = mdns_get_monotonic_time_ns();
              if (!v29) {
                *(unsigned char *)(v25 + 124) = 1;
              }
            }
          }
        }
      }
    }
  }
  _mdns_push_server_send_pending_subscribe_requests(v2);
  if (!v45)
  {
    uint64_t v37 = *(void *)(v2 + 40);
    uint64_t v38 = *((void *)object + 15);
    if (v37)
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
      }
      uint64_t v39 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v40 = *(void *)(v37 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v47 = v38;
      __int16 v48 = 2048;
      uint64_t v49 = v40;
      __int16 v50 = 2112;
      long long v51 = (_WORD *)v2;
      __int16 v52 = 2112;
      long long v53 = object;
      int v34 = "[Sub%llu->DSO%llu] New subscription added to the session -- server: %@, subscriber: %@";
      __int16 v35 = v39;
      uint32_t v36 = 42;
    }
    else
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
      }
      uint64_t v41 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v47 = v38;
      __int16 v48 = 2112;
      uint64_t v49 = v2;
      __int16 v50 = 2112;
      long long v51 = object;
      int v34 = "[Sub%llu] New subscription added to the session -- server: %@, subscriber: %@";
      __int16 v35 = v41;
      uint32_t v36 = 32;
    }
LABEL_70:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    return;
  }
  if (_mdns_push_notifications_log_s_once != -1) {
    dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
  }
  uint64_t v30 = _mdns_push_notifications_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = *((void *)object + 15);
    uint64_t v32 = *(void *)(v45 + 120);
    uint64_t v33 = *(void *)(v2 + 40);
    if (v33) {
      uint64_t v33 = *(void *)(v33 + 40);
    }
    *(_DWORD *)buf = 134219010;
    uint64_t v47 = v31;
    __int16 v48 = 2048;
    uint64_t v49 = v32;
    __int16 v50 = 2048;
    long long v51 = (_WORD *)v33;
    __int16 v52 = 2112;
    long long v53 = (_WORD *)v2;
    __int16 v54 = 2112;
    long long v55 = object;
    int v34 = "[DupSub%llu->Sub%llu->DSO%llu] Existing subscription in the session -- server: %@, subscriber: %@";
    __int16 v35 = v30;
    uint32_t v36 = 52;
    goto LABEL_70;
  }
}

uint64_t _mdns_subscriber_list_insert_conditionally(uint64_t *a1, _WORD *object, char a3, uint64_t *a4)
{
  uint64_t v7 = *a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v8 = v7;
      if (_mdns_subscriber_equal(v7, (uint64_t)object)) {
        break;
      }
      uint64_t v7 = *(void *)(v8 + 64);
      if (!v7)
      {
        a1 = (uint64_t *)(v8 + 64);
        goto LABEL_5;
      }
    }
    object[66] = *(_WORD *)(v8 + 132);
    uint64_t v13 = v8;
    do
    {
      uint64_t v14 = v13;
      uint64_t v13 = *(void *)(v13 + 72);
    }
    while (v13);
    a1 = (uint64_t *)(v14 + 72);
    uint64_t v9 = 1;
LABEL_12:
    *a1 = (uint64_t)object;
    os_retain(object);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    if (!a4) {
      return v11;
    }
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (a3) {
    goto LABEL_12;
  }
  if (a4) {
LABEL_7:
  }
    *a4 = v10;
  return v11;
}

uint64_t ___mdns_push_server_add_subscriber_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 124)) {
    CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 152), a2);
  }
  return 1;
}

void ___mdns_push_server_add_subscriber_block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 40);
  if (v7 == v5)
  {
    switch(a2)
    {
      case 1:
        *(_WORD *)(v6 + 100) = 0;
        uint64_t v9 = *(void **)(v6 + 24);
        if (v9)
        {
          uint64_t v10 = (void *)(v6 + 32);
          do
          {
            uint64_t v11 = v10;
            uint64_t v12 = *v10;
            uint64_t v10 = (void *)(*v10 + 64);
          }
          while (v12);
          void *v11 = v9;
          os_retain(v9);
          uint64_t v13 = *(void **)(v6 + 24);
          if (v13)
          {
            os_release(v13);
            *(void *)(v6 + 24) = 0;
          }
        }
        for (uint64_t i = *(void *)(v6 + 32); i; uint64_t i = *(void *)(i + 64))
        {
          uint64_t v15 = i;
          do
          {
            *(_WORD *)(v15 + 132) = 0;
            uint64_t v15 = *(void *)(v15 + 72);
          }
          while (v15);
        }
        goto LABEL_2;
      case 2:
        uint64_t v16 = *(void *)(v6 + 88);
        if (v16)
        {
          SecCertificateRef v17 = *(NSObject **)(v6 + 80);
          if (v17)
          {
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 0x40000000;
            v18[2] = ___mdns_push_server_add_subscriber_block_invoke_3;
            v18[3] = &unk_10014AF58;
            v18[4] = v16;
            int v19 = a3;
            dispatch_async(v17, v18);
          }
        }
        break;
      case 3:
        *(unsigned char *)(v6 + 102) = 1;
        _mdns_push_server_send_pending_subscribe_requests(v6);
        break;
      case 4:
        if (v7)
        {
          mdns_dso_session_invalidate(v7);
          os_release(*(void **)(*(void *)(a1 + 32) + 40));
          *(void *)(*(void *)(a1 + 32) + 40) = 0;
          uint64_t v6 = *(void *)(a1 + 32);
        }
        *(unsigned char *)(v6 + 102) = 0;
        break;
      case 5:
        goto LABEL_4;
      default:
        return;
    }
  }
  else
  {
LABEL_2:
    if (a2 == 5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
LABEL_4:
      os_release((void *)v6);
      uint64_t v8 = *(void **)(a1 + 40);
      os_release(v8);
    }
  }
}

void ___mdns_push_server_add_subscriber_block_invoke_4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = mdns_message_create_with_dispatch_data(a2, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (_UNKNOWN **)*((void *)v3 + 2);
    if (!v5) {
      goto LABEL_100;
    }
    uint64_t v6 = (_UNKNOWN **)*((void *)v3 + 2);
    while (v6 != &_mdns_dso_message_kind)
    {
      uint64_t v6 = (_UNKNOWN **)*v6;
      if (!v6) {
        goto LABEL_100;
      }
    }
    if (*((_WORD *)v5 + 28))
    {
      if (*((_WORD *)v5 + 28) == 3)
      {
        while (v5 != (_UNKNOWN **)&_mdns_dso_push_message_kind)
        {
          uint64_t v5 = (_UNKNOWN **)*v5;
          if (!v5)
          {
            uint64_t v7 = 0;
            goto LABEL_34;
          }
        }
        uint64_t v7 = v3;
LABEL_34:
        CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
        if (Mutable)
        {
          uint64_t v26 = Mutable;
          long long v58 = v2;
          CFMutableSetRef v27 = CFSetCreateMutable(kCFAllocatorDefault, 0, (const CFSetCallBacks *)&mdns_domain_name_cf_set_callbacks);
          long long v59 = v4;
          if (v27)
          {
            CFSetRef v28 = v27;
            int64_t v29 = 0;
            unint64_t v30 = *((void *)v7 + 5);
            unint64_t v60 = *((void *)v7 + 4);
            if (v30 < 0xC)
            {
              uint64_t v31 = 0;
            }
            else
            {
              uint64_t v31 = 0;
              if ((v30 & 0xFFFFFFFFFFFFFFFCLL) != 0xC)
              {
                int64_t v32 = __rev16(*(unsigned __int16 *)(v60 + 14));
                if ((uint64_t)(v30 - 16) >= v32) {
                  uint64_t v31 = (char *)(v60 + 16);
                }
                else {
                  uint64_t v31 = 0;
                }
                if ((uint64_t)(v30 - 16) >= v32) {
                  int64_t v29 = v32;
                }
                else {
                  int64_t v29 = 0;
                }
              }
            }
            uint64_t v33 = &v31[v29];
            handler[0] = v31;
            if (v31 < &v31[v29])
            {
              int v34 = 0;
              __int16 v35 = 0;
              while (1)
              {
                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                memset(buf, 0, sizeof(buf));
                int v68 = 0;
                int v69 = 0;
                __src = 0;
                *(void *)long long v67 = 0;
                if (_DNSMessageExtractRecordEx(v60, v30, v31, (char *)buf, (_WORD *)&v69 + 1, &v69, &v68, (unsigned __int16 **)&__src, (unint64_t *)v67, 0, 0, 0, 0, handler))break; {
                uint64_t v31 = (char *)handler[0];
                }
                if (handler[0] > (unint64_t)v33) {
                  break;
                }
                if (v68 >= -2)
                {
                  if (v34) {
                    os_release(v34);
                  }
                  int v34 = mdns_domain_name_create_with_labels(buf, 0);
                  if (!v34) {
                    break;
                  }
                  Value = (void *)CFSetGetValue(v28, v34);
                  if (!Value)
                  {
                    CFSetAddValue(v28, v34);
                    Value = v34;
                  }
                  if (v35) {
                    free(v35);
                  }
                  unint64_t v37 = *(void *)v67;
                  if (*(void *)v67)
                  {
                    uint64_t v38 = v26;
                    CFSetRef v39 = v28;
                    uint64_t v40 = (char *)__src;
                    int v41 = HIWORD(v69);
                    size[0] = 0;
                    if (DNSMessageExtractRData(v60, v30, (char *)__src, *(unint64_t *)v67, HIWORD(v69), 0, 0, 0, size)|| !size[0])
                    {
                      goto LABEL_77;
                    }
                    int v42 = (char *)malloc_type_calloc(1uLL, size[0], 0xF1748037uLL);
                    if (!v42)
                    {
                      __break(1u);
LABEL_76:
                      free(v35);
LABEL_77:
                      __int16 v35 = 0;
                      CFSetRef v28 = v39;
                      uint64_t v26 = v38;
                      break;
                    }
                    __int16 v35 = v42;
                    if (DNSMessageExtractRData(v60, v30, v40, v37, v41, v42, size[0], 0, 0)) {
                      goto LABEL_76;
                    }
                    unsigned __int16 v43 = size[0];
                    CFSetRef v28 = v39;
                    uint64_t v26 = v38;
                  }
                  else
                  {
                    unsigned __int16 v43 = 0;
                    __int16 v35 = 0;
                  }
                  unsigned int v44 = mdns_resource_record_create(Value, SHIWORD(v69), v69, v68, v35, v43);
                  if (!v44) {
                    break;
                  }
                  uint64_t v45 = v44;
                  CFArrayAppendValue(v26, v44);
                  os_release(v45);
                  uint64_t v31 = (char *)handler[0];
                }
                if (v31 >= v33)
                {
                  uint64_t v46 = 0;
                  goto LABEL_79;
                }
              }
              uint64_t v46 = v26;
              uint64_t v26 = 0;
LABEL_79:
              uint64_t v47 = v58;
              if (v34) {
                os_release(v34);
              }
              CFRelease(v28);
              if (v35) {
                free(v35);
              }
              uint64_t v4 = v59;
              if (!v46)
              {
LABEL_85:
                if (v26)
                {
                  size_t v49 = v47[3];
                  if (v49)
                  {
                    while (1)
                    {
                      __src = 0;
                      p_src = &__src;
                      uint64_t v65 = 0x2000000000;
                      uint64_t v66 = 0;
                      *(void *)buf = _NSConcreteStackBlock;
                      *(void *)&buf[8] = 0x40000000;
                      *(void *)&buf[16] = ___mdns_subscriber_process_change_notifications_block_invoke;
                      *(void *)&unsigned char buf[24] = &unk_10014AFC0;
                      *(void *)&long long v71 = &__src;
                      *((void *)&v71 + 1) = v49;
                      BOOL v50 = mdns_cfarray_enumerate(v26, (uint64_t)buf);
                      if (v50)
                      {
                        long long v51 = p_src;
                        if (p_src[3])
                        {
                          if (*(void *)(v49 + 88)) {
                            goto LABEL_93;
                          }
                          __int16 v52 = *(NSObject **)(v49 + 24);
                          if (!v52) {
                            goto LABEL_93;
                          }
                          dispatch_source_t v53 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v52);
                          *(void *)(v49 + 88) = v53;
                          if (v53) {
                            break;
                          }
                        }
                      }
LABEL_96:
                      long long v56 = p_src[3];
                      if (v56)
                      {
                        CFRelease(v56);
                        p_src[3] = 0;
                      }
                      _Block_object_dispose(&__src, 8);
                      size_t v49 = *(void *)(v49 + 64);
                      if (!v49) {
                        goto LABEL_99;
                      }
                    }
                    os_retain((void *)v49);
                    __int16 v54 = *(NSObject **)(v49 + 88);
                    size[0] = (size_t)_NSConcreteStackBlock;
                    size[1] = 0x40000000;
                    size[2] = (size_t)___mdns_subscriber_process_change_notifications_block_invoke_2;
                    size[3] = (size_t)&__block_descriptor_tmp_28_6833;
                    size[4] = v49;
                    dispatch_source_set_event_handler(v54, size);
                    long long v55 = *(NSObject **)(v49 + 88);
                    handler[0] = _NSConcreteStackBlock;
                    handler[1] = 0x40000000;
                    handler[2] = ___mdns_subscriber_process_change_notifications_block_invoke_3;
                    handler[3] = &__block_descriptor_tmp_29_6834;
                    handler[4] = v49;
                    dispatch_source_set_cancel_handler(v55, handler);
                    dispatch_activate(*(dispatch_object_t *)(v49 + 88));
                    long long v51 = p_src;
LABEL_93:
                    __swp(v50, (unsigned int *)(v49 + 96));
                    if (v50)
                    {
                      CFRelease((CFTypeRef)v50);
                      long long v51 = p_src;
                    }
                    v51[3] = 0;
                    dispatch_source_merge_data(*(dispatch_source_t *)(v49 + 88), 1uLL);
                    goto LABEL_96;
                  }
LABEL_99:
                  CFRelease(v26);
                  uint64_t v4 = v59;
                }
                goto LABEL_100;
              }
LABEL_84:
              CFRelease(v46);
              goto LABEL_85;
            }
            uint64_t v46 = v27;
          }
          else
          {
            uint64_t v46 = v26;
            uint64_t v26 = 0;
          }
          uint64_t v47 = v58;
          goto LABEL_84;
        }
      }
      goto LABEL_100;
    }
    uint64_t v8 = (unsigned __int16 *)*((void *)v3 + 4);
    unint64_t v9 = *((void *)v4 + 5);
    if (v8) {
      BOOL v10 = v9 >= 0xC;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10 || ((char)v8[1] & 0x80000000) == 0 || !__rev16(*v8)) {
      goto LABEL_100;
    }
    unsigned int v11 = __rev16(*(unsigned __int16 *)_mdns_dso_message_get_header((uint64_t)v8, v9));
    if (!v11)
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
      }
      long long v57 = _mdns_push_notifications_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "Unexpected DSO response message ID: %u", buf, 8u);
      }
      goto LABEL_100;
    }
    uint64_t v13 = v2 + 4;
    uint64_t v12 = v2[4];
    if (!v12) {
      goto LABEL_100;
    }
    if (*(unsigned __int16 *)(v12 + 132) != v11)
    {
      while (1)
      {
        uint64_t v14 = v12;
        uint64_t v12 = *(void *)(v12 + 64);
        if (!v12) {
          goto LABEL_100;
        }
        if (*(unsigned __int16 *)(v12 + 132) == v11)
        {
          uint64_t v13 = (void *)(v14 + 64);
          break;
        }
      }
    }
    if ((*(unsigned char *)(_mdns_dso_message_get_header(*((void *)v4 + 4), *((void *)v4 + 5)) + 3) & 0xF) != 0)
    {
LABEL_100:
      os_release(v4);
      return;
    }
    *uint64_t v13 = *(void *)(v12 + 64);
    *(void *)(v12 + 64) = 0;
    uint64_t v15 = v2 + 3;
    do
    {
      uint64_t v16 = v15;
      uint64_t v17 = *v15;
      uint64_t v15 = (void *)(*v15 + 64);
    }
    while (v17);
    *uint64_t v16 = v12;
    os_retain((void *)v12);
    uint64_t v18 = v2[5];
    uint64_t v19 = *(void *)(v12 + 120);
    if (v18)
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
      }
      uint64_t v20 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_74;
      }
      uint64_t v21 = *(void *)(v18 + 40);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&unsigned char buf[14] = v21;
      uint64_t v22 = "[Sub%llu->DSO%llu] Subscription is now active.";
      uint64_t v23 = v20;
      uint32_t v24 = 22;
    }
    else
    {
      if (_mdns_push_notifications_log_s_once != -1) {
        dispatch_once(&_mdns_push_notifications_log_s_once, &__block_literal_global_6815);
      }
      uint64_t v48 = _mdns_push_notifications_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_push_notifications_log_s_log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_74;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v19;
      uint64_t v22 = "[Sub%llu] Subscription is now active.";
      uint64_t v23 = v48;
      uint32_t v24 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_74:
    os_release((void *)v12);
    goto LABEL_100;
  }
}

void _mdns_push_server_send_pending_subscribe_requests(uint64_t a1)
{
  if (!*(void *)(a1 + 40)) {
    return;
  }
  if (!*(unsigned char *)(a1 + 102)) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return;
  }
  uint64_t v3 = 0;
  do
  {
    if (*(_WORD *)(v2 + 132)) {
      goto LABEL_36;
    }
    int v4 = *(unsigned __int16 *)(a1 + 100);
    unsigned __int16 v5 = v4 + 1;
    while (v5 < 2u)
    {
LABEL_8:
      if (v4 == ++v5) {
        goto LABEL_37;
      }
    }
    uint64_t v6 = *(void *)(a1 + 24);
    if (v6)
    {
      while (*(unsigned __int16 *)(v6 + 132) != v5)
      {
        uint64_t v6 = *(void *)(v6 + 64);
        if (!v6) {
          goto LABEL_13;
        }
      }
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      while (*(unsigned __int16 *)(v7 + 132) != v5)
      {
        uint64_t v7 = *(void *)(v7 + 64);
        if (!v7) {
          goto LABEL_16;
        }
      }
      goto LABEL_8;
    }
LABEL_16:
    *(_WORD *)(a1 + 100) = v5;
    if (!v3)
    {
      uint64_t v8 = _os_object_alloc();
      uint64_t v3 = v8;
      if (v8)
      {
        unint64_t v9 = &_mdns_dso_subscribe_message_builder_kind;
        *(void *)(v8 + 16) = &_mdns_dso_subscribe_message_builder_kind;
        do
        {
          BOOL v10 = (void (*)(uint64_t))v9[2];
          if (v10) {
            v10(v3);
          }
          unint64_t v9 = (_UNKNOWN **)*v9;
        }
        while (v9);
        if (_mdns_domain_name_get_root_s_once != -1) {
          dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
        }
        uint64_t v11 = _mdns_domain_name_get_root_s_root;
        *(void *)(v3 + 32) = _mdns_domain_name_get_root_s_root;
        if (!v11)
        {
          os_release((void *)v3);
          uint64_t v3 = 0;
        }
      }
    }
    *(_WORD *)(v3 + 28) = v5;
    uint64_t v12 = *(void *)(v2 + 80);
    if (v12) {
      os_retain(*(void **)(v2 + 80));
    }
    uint64_t v13 = *(void **)(v3 + 32);
    if (v13) {
      os_release(v13);
    }
    *(void *)(v3 + 32) = v12;
    *(_DWORD *)(v3 + 40) = *(_DWORD *)(v2 + 128);
    message = (NSObject **)mdns_dso_message_builder_create_message(v3);
    mdns_dso_session_send(*(void **)(a1 + 40), message[3]);
    uint64_t v15 = *(void **)(a1 + 40);
    if ((*(unsigned int (**)(void *))(v15[2] + 104))(v15))
    {
      os_retain(v15);
      if (_mdns_dso_session_queue_s_once != -1) {
        dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_67);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = __mdns_dso_session_add_activity_block_invoke;
      block[3] = &__block_descriptor_tmp_3_6046;
      void block[4] = v15;
      dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
    }
    os_release(message);
    uint64_t v16 = v2;
    do
    {
      *(_WORD *)(v16 + 132) = v5;
      uint64_t v16 = *(void *)(v16 + 72);
    }
    while (v16);
LABEL_36:
    uint64_t v2 = *(void *)(v2 + 64);
  }
  while (v2);
LABEL_37:
  if (v3)
  {
    os_release((void *)v3);
  }
}

uint64_t ___mdns_subscriber_process_change_notifications_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(_DWORD *)(a2 + 40);
  if (v5 < -1)
  {
    if (v5 != -2) {
      return 1;
    }
    if (*(_WORD *)(a2 + 56)) {
      return 1;
    }
    int v10 = *(unsigned __int16 *)(a2 + 54);
    if (v10 != 255)
    {
      if (v10 != *(unsigned __int16 *)(v4 + 130)) {
        return 1;
      }
      int v11 = *(unsigned __int16 *)(a2 + 52);
      if (v11 != 255 && v11 != *(unsigned __int16 *)(v4 + 128)) {
        return 1;
      }
    }
  }
  else
  {
    int v6 = *(unsigned __int16 *)(v4 + 130);
    if (v6 != 255 && *(unsigned __int16 *)(a2 + 54) != v6) {
      return 1;
    }
    int v8 = *(unsigned __int16 *)(v4 + 128);
    BOOL v9 = v8 == 255 || *(unsigned __int16 *)(a2 + 52) == v8;
    if (!v9 || (_mdns_domain_name_equal(*(void *)(a2 + 24), *(void *)(v4 + 80)) & 1) == 0) {
      return 1;
    }
  }
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result
    || (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks), (uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) != 0))
  {
    CFArrayAppendValue((CFMutableArrayRef)result, (const void *)a2);
    return 1;
  }
  return result;
}

uint64_t ___mdns_subscriber_process_change_notifications_block_invoke_2(uint64_t result)
{
  __swp(v1, (unsigned int *)(*(void *)(result + 32) + 96));
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 32);
    uint64_t v4 = *(const void **)(v3 + 112);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(*(void *)(v2 + 32) + 112) = 0;
      uint64_t v3 = *(void *)(v2 + 32);
    }
    *(void *)(v3 + 112) = v1;
    uint64_t result = *(void *)(*(void *)(v2 + 32) + 104);
    if (result)
    {
      int v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

void ___mdns_subscriber_process_change_notifications_block_invoke_3(uint64_t a1)
{
}

uint64_t ___mdns_push_server_add_subscriber_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, *(unsigned int *)(a1 + 40));
}

void ___mdns_push_notifications_queue_block_invoke(id a1)
{
  _mdns_push_notifications_queue_s_queue = (uint64_t)dispatch_queue_create("com.apple.mdns.push-notifications-queue", 0);
}

void _mdns_subscriber_set_query(uint64_t a1, void *object, __int16 a3, __int16 a4)
{
  if (object) {
    os_retain(object);
  }
  int v8 = *(void **)(a1 + 80);
  if (v8) {
    os_release(v8);
  }
  *(void *)(a1 + 80) = object;
  *(_WORD *)(a1 + 128) = a3;
  *(_WORD *)(a1 + 130) = a4;
}

uint64_t _mdns_subscriber_get_internal_queue()
{
  if (_mdns_push_notifications_queue_s_once != -1) {
    dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_36);
  }
  return _mdns_push_notifications_queue_s_queue;
}

void _mdns_subscriber_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 56) = 0;
  }
  uint64_t v3 = *(void **)(a1 + 80);
  if (v3)
  {
    os_release(v3);
    *(void *)(a1 + 80) = 0;
  }
  __swp(v3, (unsigned int *)(a1 + 96));
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 112);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 112) = 0;
  }
}

void *_mdns_subscriber_copy_description(uint64_t a1, int a2, int a3)
{
  int v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (!a2
    || !mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1))
  {
    uint64_t v9 = *(void *)(a1 + 80);
    if (v9)
    {
      if (a3)
      {
        int v10 = (void *)(v9 + 16);
        while (1)
        {
          int v10 = (void *)*v10;
          if (!v10) {
            break;
          }
          int v11 = (uint64_t (*)(void))v10[3];
          if (v11)
          {
            uint64_t v12 = (char *)v11();
            goto LABEL_14;
          }
        }
        uint64_t v12 = 0;
LABEL_14:
        uint64_t v13 = "«REDACTED»";
        if (v12) {
          uint64_t v13 = v12;
        }
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v13 = *(const char **)(v9 + 40);
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = "«NO NAME»";
    }
    if (mdns_string_builder_append_formatted(v7, "name: %s, type: ", v13)) {
      goto LABEL_34;
    }
    int v14 = DNSRecordTypeValueToString(*(unsigned __int16 *)(a1 + 128))
        ? mdns_string_builder_append_formatted(v7, "%s")
        : mdns_string_builder_append_formatted(v7, "TYPE%u");
    if (v14 || mdns_string_builder_append_formatted(v7, ", class: ")) {
      goto LABEL_34;
    }
    int v15 = *(unsigned __int16 *)(a1 + 130);
    uint64_t v16 = "ANY";
    if (v15 != 255) {
      uint64_t v16 = 0;
    }
    if (v15 == 1) {
      uint64_t v16 = "IN";
    }
    if (v16
       ? mdns_string_builder_append_formatted(v7, "%s")
       : mdns_string_builder_append_formatted(v7, "CLASS%u"))
    {
LABEL_34:
      int v8 = 0;
      if (!v12) {
        goto LABEL_32;
      }
    }
    else
    {
      int v8 = mdns_string_builder_copy_string((uint64_t)v7);
      if (!v12) {
        goto LABEL_32;
      }
    }
    free(v12);
    goto LABEL_32;
  }
  int v8 = 0;
LABEL_32:
  os_release(v7);
  return v8;
}

void mdns_push_server_invalidate(unsigned char *a1)
{
  a1[103] = 1;
  os_retain(a1);
  if (_mdns_push_notifications_queue_s_once != -1) {
    dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_36);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __mdns_push_server_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2_6854;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_push_notifications_queue_s_queue, block);
}

void __mdns_push_server_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    mdns_dso_session_invalidate(*(void **)(v2 + 40));
    os_release(*(void **)(*(void *)(a1 + 32) + 40));
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = *(void *)(v2 + 88);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(v2 + 80);
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = __mdns_push_server_invalidate_block_invoke_2;
      block[3] = &unk_10014AE30;
      void block[4] = v3;
      dispatch_async(v4, block);
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

void mdns_subscriber_set_event_handler(uint64_t a1, void *aBlock)
{
  if (!*(unsigned char *)(a1 + 49))
  {
    if (aBlock) {
      uint64_t v3 = _Block_copy(aBlock);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 104);
    if (v4) {
      _Block_release(v4);
    }
    *(void *)(a1 + 104) = v3;
  }
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

void mDNSPlatformGetDNSRoutePolicy(uint64_t a1)
{
  *(_DWORD *)(a1 + 280) = -1;
  if (!*(_WORD *)(a1 + 340) || (*(_DWORD *)(a1 + 244) & 0x80000000) != 0) {
    goto LABEL_160;
  }
  bzero(hostname, 0x3F1uLL);
  __int16 v2 = a1 + 376;
  ConvertDomainNameToCString_withescape((unsigned __int8 *)(a1 + 376), (unsigned __int8 *)hostname);
  nw_endpoint_t host = nw_endpoint_create_host(hostname, "0");
  if (host)
  {
    nw_endpoint_t v4 = host;
    nw_parameters_t v5 = nw_parameters_create();
    if (v5)
    {
      unsigned int v6 = v5;
      uint64_t v7 = *(void *)(a1 + 136);
      if (v7 == -4 || v7 == -5 || v7 == -3 || v7 == -1 || v7 == -2 || v7 == 0) {
        int v13 = 0;
      }
      else {
        int v13 = *(void *)(a1 + 136);
      }
      if (!v13) {
        goto LABEL_70;
      }
      int v14 = nw_interface_create_with_index();
      if (v14)
      {
        int v15 = v14;
        nw_parameters_require_interface(v6, v14);
        nw_release(v15);
LABEL_70:
        nw_parameters_set_uid();
        if (*(_DWORD *)(a1 + 244)
          && (nw_parameters_set_pid(),
              *(void *)buf = 0,
              *(void *)&long long v91 = 0,
              mdns_system_pid_to_uuid(*(_DWORD *)(a1 + 244), buf)))
        {
          int v31 = 0;
        }
        else
        {
          nw_parameters_set_e_proc_uuid();
          int v31 = 1;
        }
        uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
        if (evaluator_for_endpoint)
        {
          uint64_t v33 = (void *)evaluator_for_endpoint;
          nw_release(v4);
          nw_release(v6);
          int v34 = nw_path_evaluator_copy_path();
          if (v34)
          {
            __int16 v35 = v34;
            if (nw_path_get_status(v34) == nw_path_status_satisfied)
            {
              int flow_divert_unit = nw_path_get_flow_divert_unit();
              if (!flow_divert_unit)
              {
                unint64_t v60 = nw_path_copy_scoped_interface();
                if (!v60) {
                  goto LABEL_174;
                }
                long long v61 = v60;
                uint32_t index = nw_interface_get_index(v60);
                *(void *)(a1 + 136) = index;
                nw_release(v61);
                if (index == v13) {
                  goto LABEL_174;
                }
                uint64_t v63 = mDNSLogCategory_Default;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
                {
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_174;
                  }
                }
                else
                {
                  uint64_t v63 = mDNSLogCategory_Default_redacted;
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_174;
                  }
                }
                unsigned int v82 = bswap32(*(unsigned __int16 *)(a1 + 340));
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = HIWORD(v82);
                LOWORD(v91) = 1024;
                *(_DWORD *)((char *)&v91 + 2) = v13;
                WORD3(v91) = 1024;
                DWORD2(v91) = index;
                long long v83 = "[Q%u] mDNSPlatformGetDNSRoutePolicy: DNS Route Policy has changed the scoped ifindex from [%d] to [%d]";
                long long v84 = v63;
                uint32_t v85 = 20;
LABEL_173:
                _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, v83, buf, v85);
                goto LABEL_174;
              }
              int v37 = flow_divert_unit;
              *(_DWORD *)(a1 + 280) = flow_divert_unit;
              uint64_t v38 = mDNSLogCategory_Default;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v39 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
                  uint64_t v65 = (unsigned char *)(a1 + 376);
                  if (a1 == -632)
                  {
LABEL_144:
                    while (v65)
                    {
                      uint64_t v66 = *v65;
                      if (v66 > 0x3F) {
                        break;
                      }
                      if (!*v65)
                      {
                        int v77 = (unsigned __int16)((_WORD)v65 - v2 + 1);
                        goto LABEL_172;
                      }
                      v65 += v66 + 1;
                      if (a1 != -632) {
                        goto LABEL_143;
                      }
                    }
                  }
                  else
                  {
LABEL_143:
                    if ((unint64_t)v65 < a1 + 632) {
                      goto LABEL_144;
                    }
                  }
                  int v77 = 257;
                  goto LABEL_172;
                }
              }
              else
              {
                uint64_t v38 = mDNSLogCategory_Default_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v39 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
                  uint64_t v40 = (unsigned char *)(a1 + 376);
                  if (a1 == -632)
                  {
LABEL_83:
                    while (v40)
                    {
                      uint64_t v41 = *v40;
                      if (v41 > 0x3F) {
                        break;
                      }
                      if (!*v40)
                      {
                        int v77 = (unsigned __int16)((_WORD)v40 - v2 + 1);
                        goto LABEL_172;
                      }
                      v40 += v41 + 1;
                      if (a1 != -632) {
                        goto LABEL_82;
                      }
                    }
                  }
                  else
                  {
LABEL_82:
                    if ((unint64_t)v40 < a1 + 632) {
                      goto LABEL_83;
                    }
                  }
                  int v77 = 257;
LABEL_172:
                  *(_DWORD *)buf = 67110147;
                  *(_DWORD *)&uint8_t buf[4] = v39;
                  LOWORD(v91) = 2160;
                  *(void *)((char *)&v91 + 2) = 1752392040;
                  WORD5(v91) = 1040;
                  HIDWORD(v91) = v77;
                  *(_WORD *)int v92 = 2101;
                  *(void *)&v92[2] = a1 + 376;
                  __int16 v93 = 1024;
                  LODWORD(v94) = v37;
                  long long v83 = "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name"
                        "}.*P service ID is set ->service_ID:[%d] ";
                  long long v84 = v38;
                  uint32_t v85 = 40;
                  goto LABEL_173;
                }
              }
            }
            else if (v31 {
                   && nw_path_get_status(v35) == nw_path_status_unsatisfied
            }
                   && nw_path_get_reason() != 3)
            {
              char v50 = 1;
LABEL_180:
              nw_release(v35);
              goto LABEL_181;
            }
LABEL_174:
            if (!*(unsigned char *)(a1 + 651))
            {
              uuid_clear((unsigned __int8 *)(a1 + 360));
              *(void *)buf = 0;
              *(void *)&long long v91 = buf;
              *((void *)&v91 + 1) = 0x2000000000;
              *(void *)int v92 = 0;
              v88[0] = 0;
              v88[1] = v88;
              v88[2] = 0x2000000000;
              char v89 = 0;
              v86[0] = 0;
              v86[1] = v86;
              v86[2] = 0x2000000000;
              int v87 = 0;
              nw_path_enumerate_resolver_configs();
              if (*(void *)(v91 + 24)) {
                nw_resolver_config_get_identifier();
              }
              _Block_object_dispose(v86, 8);
              _Block_object_dispose(v88, 8);
              _Block_object_dispose(buf, 8);
              if (!uuid_is_null((const unsigned __int8 *)(a1 + 360))) {
                Querier_RegisterPathResolver(a1 + 360);
              }
            }
            char v50 = 0;
            goto LABEL_180;
          }
          uint64_t v46 = mDNSLogCategory_Default;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
          {
            if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
            {
              unsigned int v47 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
              dispatch_source_t v53 = (unsigned char *)(a1 + 376);
              if (a1 == -632)
              {
LABEL_123:
                while (v53)
                {
                  uint64_t v54 = *v53;
                  if (v54 > 0x3F) {
                    break;
                  }
                  if (!*v53)
                  {
                    int v72 = (unsigned __int16)((_WORD)v53 - v2 + 1);
                    goto LABEL_166;
                  }
                  v53 += v54 + 1;
                  if (a1 != -632) {
                    goto LABEL_122;
                  }
                }
              }
              else
              {
LABEL_122:
                if ((unint64_t)v53 < a1 + 632) {
                  goto LABEL_123;
                }
              }
              int v72 = 257;
              goto LABEL_166;
            }
          }
          else
          {
            uint64_t v46 = mDNSLogCategory_Default_redacted;
            if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
            {
              unsigned int v47 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
              uint64_t v48 = (unsigned char *)(a1 + 376);
              if (a1 == -632)
              {
LABEL_103:
                while (v48)
                {
                  uint64_t v49 = *v48;
                  if (v49 > 0x3F) {
                    break;
                  }
                  if (!*v48)
                  {
                    int v72 = (unsigned __int16)((_WORD)v48 - v2 + 1);
                    goto LABEL_166;
                  }
                  v48 += v49 + 1;
                  if (a1 != -632) {
                    goto LABEL_102;
                  }
                }
              }
              else
              {
LABEL_102:
                if ((unint64_t)v48 < a1 + 632) {
                  goto LABEL_103;
                }
              }
              int v72 = 257;
LABEL_166:
              long long v78 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
              int v79 = *(_DWORD *)(a1 + 244);
              int v80 = *(_DWORD *)(a1 + 248);
              int v81 = *(_DWORD *)(a1 + 280);
              *(_DWORD *)buf = 67110915;
              *(_DWORD *)&uint8_t buf[4] = v47;
              LOWORD(v91) = 2160;
              *(void *)((char *)&v91 + 2) = 1752392040;
              WORD5(v91) = 1040;
              HIDWORD(v91) = v72;
              *(_WORD *)int v92 = 2101;
              *(void *)&v92[2] = a1 + 376;
              __int16 v93 = 2082;
              uint64_t v94 = v78;
              __int16 v95 = 1024;
              int v96 = v79;
              __int16 v97 = 1024;
              int v98 = v80;
              __int16 v99 = 1024;
              int v100 = v81;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] path is NULL", buf, 0x3Eu);
            }
          }
          char v50 = 0;
LABEL_181:
          nw_release(v33);
          goto LABEL_161;
        }
        int v42 = mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
          {
            unsigned int v43 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
            long long v51 = (unsigned char *)(a1 + 376);
            if (a1 == -632)
            {
LABEL_115:
              while (v51)
              {
                uint64_t v52 = *v51;
                if (v52 > 0x3F) {
                  break;
                }
                if (!*v51)
                {
                  int v64 = (unsigned __int16)((_WORD)v51 - v2 + 1);
                  goto LABEL_157;
                }
                v51 += v52 + 1;
                if (a1 != -632) {
                  goto LABEL_114;
                }
              }
            }
            else
            {
LABEL_114:
              if ((unint64_t)v51 < a1 + 632) {
                goto LABEL_115;
              }
            }
            int v64 = 257;
            goto LABEL_157;
          }
        }
        else
        {
          int v42 = mDNSLogCategory_Default_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
          {
            unsigned int v43 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
            unsigned int v44 = (unsigned char *)(a1 + 376);
            if (a1 == -632)
            {
LABEL_93:
              while (v44)
              {
                uint64_t v45 = *v44;
                if (v45 > 0x3F) {
                  break;
                }
                if (!*v44)
                {
                  int v64 = (unsigned __int16)((_WORD)v44 - v2 + 1);
                  goto LABEL_157;
                }
                v44 += v45 + 1;
                if (a1 != -632) {
                  goto LABEL_92;
                }
              }
            }
            else
            {
LABEL_92:
              if ((unint64_t)v44 < a1 + 632) {
                goto LABEL_93;
              }
            }
            int v64 = 257;
LABEL_157:
            long long v73 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
            int v74 = *(_DWORD *)(a1 + 244);
            int v75 = *(_DWORD *)(a1 + 248);
            int v76 = *(_DWORD *)(a1 + 280);
            *(_DWORD *)buf = 67110915;
            *(_DWORD *)&uint8_t buf[4] = v43;
            LOWORD(v91) = 2160;
            *(void *)((char *)&v91 + 2) = 1752392040;
            WORD5(v91) = 1040;
            HIDWORD(v91) = v64;
            *(_WORD *)int v92 = 2101;
            *(void *)&v92[2] = a1 + 376;
            __int16 v93 = 2082;
            uint64_t v94 = v73;
            __int16 v95 = 1024;
            int v96 = v74;
            __int16 v97 = 1024;
            int v98 = v75;
            __int16 v99 = 1024;
            int v100 = v76;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] evaluator is NULL", buf, 0x3Eu);
          }
        }
        nw_release(v4);
        long long v71 = v6;
        goto LABEL_159;
      }
      CFSetRef v28 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_70;
        }
      }
      else
      {
        CFSetRef v28 = mDNSLogCategory_Default_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_70;
        }
      }
      unsigned int v30 = bswap32(*(unsigned __int16 *)(a1 + 340));
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = HIWORD(v30);
      LOWORD(v91) = 1024;
      *(_DWORD *)((char *)&v91 + 2) = v13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Q%u] mDNSPlatformGetDNSRoutePolicy: nw_interface_create_with_index() returned NULL for index %u", buf, 0xEu);
      goto LABEL_70;
    }
    uint64_t v20 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
      {
        unsigned int v21 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
        uint64_t v26 = (unsigned char *)(a1 + 376);
        if (a1 == -632)
        {
LABEL_57:
          while (v26)
          {
            uint64_t v27 = *v26;
            if (v27 > 0x3F) {
              break;
            }
            if (!*v26)
            {
              int v55 = (unsigned __int16)((_WORD)v26 - v2 + 1);
              goto LABEL_151;
            }
            v26 += v27 + 1;
            if (a1 != -632) {
              goto LABEL_56;
            }
          }
        }
        else
        {
LABEL_56:
          if ((unint64_t)v26 < a1 + 632) {
            goto LABEL_57;
          }
        }
        int v55 = 257;
        goto LABEL_151;
      }
    }
    else
    {
      uint64_t v20 = mDNSLogCategory_Default_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
      {
        unsigned int v21 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
        uint64_t v22 = (unsigned char *)(a1 + 376);
        if (a1 == -632)
        {
LABEL_41:
          while (v22)
          {
            uint64_t v23 = *v22;
            if (v23 > 0x3F) {
              break;
            }
            if (!*v22)
            {
              int v55 = (unsigned __int16)((_WORD)v22 - v2 + 1);
              goto LABEL_151;
            }
            v22 += v23 + 1;
            if (a1 != -632) {
              goto LABEL_40;
            }
          }
        }
        else
        {
LABEL_40:
          if ((unint64_t)v22 < a1 + 632) {
            goto LABEL_41;
          }
        }
        int v55 = 257;
LABEL_151:
        long long v67 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
        int v68 = *(_DWORD *)(a1 + 244);
        int v69 = *(_DWORD *)(a1 + 248);
        int v70 = *(_DWORD *)(a1 + 280);
        *(_DWORD *)buf = 67110915;
        *(_DWORD *)&uint8_t buf[4] = v21;
        LOWORD(v91) = 2160;
        *(void *)((char *)&v91 + 2) = 1752392040;
        WORD5(v91) = 1040;
        HIDWORD(v91) = v55;
        *(_WORD *)int v92 = 2101;
        *(void *)&v92[2] = a1 + 376;
        __int16 v93 = 2082;
        uint64_t v94 = v67;
        __int16 v95 = 1024;
        int v96 = v68;
        __int16 v97 = 1024;
        int v98 = v69;
        __int16 v99 = 1024;
        int v100 = v70;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] parameters is NULL", buf, 0x3Eu);
      }
    }
    long long v71 = v4;
LABEL_159:
    nw_release(v71);
    goto LABEL_160;
  }
  uint64_t v16 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
      uint32_t v24 = (unsigned char *)(a1 + 376);
      if (a1 == -632)
      {
LABEL_49:
        while (v24)
        {
          uint64_t v25 = *v24;
          if (v25 > 0x3F) {
            break;
          }
          if (!*v24)
          {
            int v29 = (unsigned __int16)((_WORD)v24 - v2 + 1);
            goto LABEL_132;
          }
          v24 += v25 + 1;
          if (a1 != -632) {
            goto LABEL_48;
          }
        }
      }
      else
      {
LABEL_48:
        if ((unint64_t)v24 < a1 + 632) {
          goto LABEL_49;
        }
      }
      int v29 = 257;
      goto LABEL_132;
    }
  }
  else
  {
    uint64_t v16 = mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = bswap32(*(unsigned __int16 *)(a1 + 340)) >> 16;
      uint64_t v18 = (unsigned char *)(a1 + 376);
      if (a1 == -632)
      {
LABEL_31:
        while (v18)
        {
          uint64_t v19 = *v18;
          if (v19 > 0x3F) {
            break;
          }
          if (!*v18)
          {
            int v29 = (unsigned __int16)((_WORD)v18 - v2 + 1);
            goto LABEL_132;
          }
          v18 += v19 + 1;
          if (a1 != -632) {
            goto LABEL_30;
          }
        }
      }
      else
      {
LABEL_30:
        if ((unint64_t)v18 < a1 + 632) {
          goto LABEL_31;
        }
      }
      int v29 = 257;
LABEL_132:
      long long v56 = DNSTypeName(*(unsigned __int16 *)(a1 + 342));
      int v57 = *(_DWORD *)(a1 + 244);
      int v58 = *(_DWORD *)(a1 + 248);
      int v59 = *(_DWORD *)(a1 + 280);
      *(_DWORD *)buf = 67110915;
      *(_DWORD *)&uint8_t buf[4] = v17;
      LOWORD(v91) = 2160;
      *(void *)((char *)&v91 + 2) = 1752392040;
      WORD5(v91) = 1040;
      HIDWORD(v91) = v29;
      *(_WORD *)int v92 = 2101;
      *(void *)&v92[2] = a1 + 376;
      __int16 v93 = 2082;
      uint64_t v94 = v56;
      __int16 v95 = 1024;
      int v96 = v57;
      __int16 v97 = 1024;
      int v98 = v58;
      __int16 v99 = 1024;
      int v100 = v59;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Q%u] mDNSPlatformGetDNSRoutePolicy: Query for %{sensitive, mask.hash, mdnsresponder:domain_name}.*P (%{public}s), PID[%d], EUID[%d], ServiceID[%d] host is NULL", buf, 0x3Eu);
    }
  }
LABEL_160:
  char v50 = 0;
LABEL_161:
  *(unsigned char *)(a1 + 654) = v50;
}

uint64_t __mDNSPlatformGetDNSRoutePolicy_block_invoke(void *a1, uint64_t a2)
{
  int allow_failover = nw_resolver_config_get_allow_failover();
  unsigned int v5 = nw_resolver_config_get_class();
  if (v5 && (!allow_failover || !*(unsigned char *)(a1[7] + 643)))
  {
    uint64_t v6 = *(void *)(a1[4] + 8);
    if (*(_DWORD *)(v6 + 24) - 1 >= v5)
    {
      *(_DWORD *)(v6 + 24) = v5;
      *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = allow_failover;
    }
  }
  return 1;
}

void _dnssec_obj_trust_anchor_finalize(uint64_t a1)
{
  __int16 v2 = *(void **)(a1 + 16);
  if (v2)
  {
    ref_count_obj_release(v2);
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t _dnssec_obj_trust_anchor_compare(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24) && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28)) {
    return 2 * (ref_count_obj_compare(*(void *)(a1 + 16), *(void *)(a2 + 16), 1) != 0);
  }
  else {
    return 2;
  }
}

void *dnssec_obj_trust_anchor_create_with_ds_data()
{
  uint64_t v0 = __chkstk_darwin();
  __int16 v2 = v1;
  int v4 = v3;
  int v6 = v5;
  unsigned int v8 = v7;
  unsigned int v9 = (unsigned __int8 *)v0;
  int v22 = 0;
  v23[0] = v10;
  v23[1] = v11;
  v23[2] = v12;
  v23[3] = 2;
  bzero(&v26, 0xFDCuLL);
  long long v13 = v8[1];
  long long v24 = *v8;
  long long v25 = v13;
  int v14 = dnssec_obj_rr_ds_create(v9, 1, v23, 0x24u, 1, &v22);
  int v15 = v14;
  int v16 = v22;
  if (v22)
  {
    uint64_t v18 = 0;
  }
  else if (v14)
  {
    unsigned int v17 = malloc_type_calloc(1uLL, 0x20uLL, 0xF1748037uLL);
    if (!v17) {
      __break(1u);
    }
    uint64_t v18 = v17;
    uint64_t v19 = &_dnssec_obj_trust_anchor_kind;
    v17[1] = &_dnssec_obj_trust_anchor_kind;
    do
    {
      uint64_t v20 = (void (*)(void *))v19[2];
      if (v20) {
        v20(v18);
      }
      uint64_t v19 = (_UNKNOWN **)*v19;
    }
    while (v19);
    int v16 = 0;
    ++*(_DWORD *)v18;
    v18[2] = v15;
    ++*(_DWORD *)v15;
    *((_DWORD *)v18 + 6) = v6;
    *((_DWORD *)v18 + 7) = v4;
    int v22 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    int v16 = -6728;
    int v22 = -6728;
  }
  if (v2) {
    int *v2 = v16;
  }
  if (v15) {
    ref_count_obj_release(v15);
  }
  return v18;
}

size_t mdns_snprintf_add(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    char v10 = *a1;
  }
  else {
    char v10 = 0;
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

uint64_t mdns_get_monotonic_time_ns()
{
  __uint64_t v0 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (!v0 && (!*__error() || *__error())) {
    return 1;
  }
  return v0;
}

void _mdns_message_finalize(uint64_t a1)
{
  *(void *)(a1 + 32) = 0;
  __int16 v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

char *_mdns_message_copy_description(uint64_t a1, uint64_t a2, int a3)
{
  int v16 = 0;
  uint64_t result = *(char **)(a1 + 32);
  if (result)
  {
    char v5 = a3;
    int v6 = *(unsigned char *)(a1 + 48) ? 36 : 4;
    unsigned int v7 = a3 ? v6 | 8 : v6;
    DNSMessageToString(result, *(void *)(a1 + 40), v7, (uint64_t)&v16);
    uint64_t result = v16;
    if (!v16 && (v5 & 1) == 0)
    {
      uint64_t result = 0;
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
          uint64_t result = (char *)malloc_type_malloc((2 * v10) | 1, 0xA172743EuLL);
          if (result)
          {
            size_t v12 = result;
            if (v9 != v8)
            {
              size_t v13 = (unsigned __int8 *)(v11 + v8);
              int v14 = result;
              do
              {
                unsigned int v15 = *v13++;
                *int v14 = a0123456789abcd_0[(unint64_t)v15 >> 4];
                size_t v12 = v14 + 2;
                v14[1] = a0123456789abcd_0[v15 & 0xF];
                v14 += 2;
                --v10;
              }
              while (v10);
            }
            *size_t v12 = 0;
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

unsigned char *mdns_message_create_with_dispatch_data(NSObject *a1, char a2)
{
  size_t v41 = 0;
  buffer_ptr = 0;
  dispatch_data_t v3 = dispatch_data_create_map(a1, (const void **)&buffer_ptr, &v41);
  if (!v3) {
    return 0;
  }
  int v4 = v3;
  size_t v6 = v41;
  char v5 = buffer_ptr;
  if (buffer_ptr) {
    BOOL v7 = v41 >= 0xC;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7
    && (*((unsigned char *)buffer_ptr + 2) & 0x78) == 0x30
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 2))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 3))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 4))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 5))
    && ((*((unsigned char *)buffer_ptr + 2) & 0x80) == 0 || __rev16(*(unsigned __int16 *)buffer_ptr)))
  {
    uint64_t v8 = 0;
    unint64_t v9 = (char *)buffer_ptr + 12;
    uint64_t v10 = (char *)buffer_ptr + v41;
    while (v9 < v10)
    {
      if ((unint64_t)(v10 - v9) >= 4)
      {
        uint64_t v11 = __rev16(*((unsigned __int16 *)v9 + 1));
        uint64_t v12 = v10 - (v9 + 4);
        v9 += v11 + 4;
        ++v8;
        if (v12 >= v11) {
          continue;
        }
      }
      goto LABEL_21;
    }
    if ((*((unsigned char *)buffer_ptr + 2) & 0x80) != 0 || v8)
    {
      uint64_t v18 = 0;
      uint64_t v19 = &off_10014B3A8;
      do
      {
        if (((uint64_t (*)(void *, size_t))*v19)(v5, v6))
        {
          switch(*((_WORD *)&off_10014B3A8 + 8 * v18 + 4))
          {
            case 0:
              goto LABEL_34;
            case 1:
              uint64_t v23 = _os_object_alloc();
              int v14 = (unsigned char *)v23;
              if (!v23) {
                goto LABEL_29;
              }
              long long v24 = &_mdns_dso_keepalive_message_kind;
              *(void *)(v23 + 16) = &_mdns_dso_keepalive_message_kind;
              do
              {
                long long v25 = (void (*)(unsigned char *))v24[2];
                if (v25) {
                  v25(v14);
                }
                long long v24 = (_UNKNOWN ***)*v24;
              }
              while (v24);
              break;
            case 2:
              uint64_t v26 = _os_object_alloc();
              int v14 = (unsigned char *)v26;
              if (!v26) {
                goto LABEL_29;
              }
              uint64_t v27 = &_mdns_dso_retry_delay_message_kind;
              *(void *)(v26 + 16) = &_mdns_dso_retry_delay_message_kind;
              do
              {
                CFSetRef v28 = (void (*)(unsigned char *))v27[2];
                if (v28) {
                  v28(v14);
                }
                uint64_t v27 = (_UNKNOWN ***)*v27;
              }
              while (v27);
              break;
            case 3:
              uint64_t v29 = _os_object_alloc();
              int v14 = (unsigned char *)v29;
              if (!v29) {
                goto LABEL_29;
              }
              unsigned int v30 = &_mdns_dso_push_message_kind;
              *(void *)(v29 + 16) = &_mdns_dso_push_message_kind;
              do
              {
                int v31 = (void (*)(unsigned char *))v30[2];
                if (v31) {
                  v31(v14);
                }
                unsigned int v30 = (_UNKNOWN ***)*v30;
              }
              while (v30);
              break;
            case 4:
              uint64_t v32 = _os_object_alloc();
              int v14 = (unsigned char *)v32;
              if (!v32) {
                goto LABEL_29;
              }
              uint64_t v33 = &_mdns_dso_subscribe_message_kind;
              *(void *)(v32 + 16) = &_mdns_dso_subscribe_message_kind;
              do
              {
                int v34 = (void (*)(unsigned char *))v33[2];
                if (v34) {
                  v34(v14);
                }
                uint64_t v33 = (_UNKNOWN ***)*v33;
              }
              while (v33);
              break;
            case 5:
              uint64_t v35 = _os_object_alloc();
              int v14 = (unsigned char *)v35;
              if (!v35) {
                goto LABEL_29;
              }
              uint32_t v36 = &_mdns_dso_unsubscribe_message_kind;
              *(void *)(v35 + 16) = &_mdns_dso_unsubscribe_message_kind;
              do
              {
                int v37 = (void (*)(unsigned char *))v36[2];
                if (v37) {
                  v37(v14);
                }
                uint32_t v36 = (_UNKNOWN ***)*v36;
              }
              while (v36);
              break;
            case 6:
              uint64_t v38 = _os_object_alloc();
              int v14 = (unsigned char *)v38;
              if (!v38) {
                goto LABEL_29;
              }
              unsigned int v39 = &_mdns_dso_reconfirm_message_kind;
              *(void *)(v38 + 16) = &_mdns_dso_reconfirm_message_kind;
              do
              {
                uint64_t v40 = (void (*)(unsigned char *))v39[2];
                if (v40) {
                  v40(v14);
                }
                unsigned int v39 = (_UNKNOWN ***)*v39;
              }
              while (v39);
              break;
            default:
              goto LABEL_79;
          }
          goto LABEL_26;
        }
        ++v18;
        v19 += 2;
      }
      while (v18 != 6);
LABEL_34:
      uint64_t v20 = _os_object_alloc();
      int v14 = (unsigned char *)v20;
      if (!v20) {
        goto LABEL_29;
      }
      unsigned int v21 = &_mdns_dso_unspecified_message_kind;
      *(void *)(v20 + 16) = &_mdns_dso_unspecified_message_kind;
      do
      {
        int v22 = (void (*)(unsigned char *))v21[2];
        if (v22) {
          v22(v14);
        }
        unsigned int v21 = (_UNKNOWN ***)*v21;
      }
      while (v21);
      goto LABEL_26;
    }
  }
LABEL_21:
  uint64_t v13 = _os_object_alloc();
  int v14 = (unsigned char *)v13;
  if (v13)
  {
    unsigned int v15 = &_mdns_message_kind;
    *(void *)(v13 + 16) = &_mdns_message_kind;
    do
    {
      int v16 = (void (*)(unsigned char *))v15[2];
      if (v16) {
        v16(v14);
      }
      unsigned int v15 = (_UNKNOWN **)*v15;
    }
    while (v15);
LABEL_26:
    if (a2) {
      v14[48] = 1;
    }
    if (_mdns_message_set_msg_data(v14, v4))
    {
      os_release(v14);
LABEL_79:
      int v14 = 0;
    }
  }
LABEL_29:
  dispatch_release(v4);
  return v14;
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
    dispatch_data_t v3 = (dispatch_data_t)&_dispatch_data_empty;
  }
  char v5 = a1[3];
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t result = 0;
  size_t v6 = buffer_ptr;
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
        int v4 = a1 + 8;
        if (a1 != (unsigned __int16 *)-16)
        {
          int64_t v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) >= v5)
          {
            if (__rev16(a1[6]) == 67 && v4 < (unsigned __int16 *)((char *)v4 + v5))
            {
              size_t v6 = a1 + 8;
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
                uint64_t v8 = &v6[v7];
                if ((char *)v4 + v5 - v6 > v7)
                {
                  size_t v6 = v8 + 1;
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
          size_t v6 = (char *)v4 + v5;
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
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global);
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
  unsigned int v2 = *(unsigned __int8 *)(a1 + 70);
  memset(v32, 0, sizeof(v32));
  unsigned int v3 = *(unsigned char **)(*(void *)(a1 + 56) + 24);
  __int16 v4 = *(_WORD *)(a1 + 68);
  __int16 v5 = *(_WORD *)(a1 + 64);
  __int16 v6 = *(_WORD *)(a1 + 66);
  *(_DWORD *)((char *)v32 + 6) = 0;
  WORD5(v32[0]) = 0;
  LOBYTE(v32[0]) = HIBYTE(v4);
  BYTE1(v32[0]) = v4;
  BYTE2(v32[0]) = 1;
  BYTE3(v32[0]) = (__rbit32(v2) >> 26) & 0x30;
  WORD2(v32[0]) = 256;
  unsigned int v7 = v3;
  int v8 = *v3;
  if (*v3)
  {
    unsigned int v7 = v3;
    do
    {
      BOOL v9 = &v7[v8];
      int v10 = v9[1];
      unsigned int v7 = v9 + 1;
      int v8 = v10;
    }
    while (v10);
  }
  uint64_t v11 = v7 - v3;
  uint64_t v12 = v11 + 1;
  if ((unint64_t)(v11 + 1) > 0x100) {
    return 4294960553;
  }
  memcpy((void *)((unint64_t)v32 | 0xC), v3, v11 + 1);
  uint64_t v13 = ((unint64_t)v32 | 0xC) + v12;
  *(unsigned char *)uint64_t v13 = HIBYTE(v5);
  *(unsigned char *)(v13 + 1) = v5;
  *(unsigned char *)(v13 + 2) = HIBYTE(v6);
  *(unsigned char *)(v13 + 3) = v6;
  unint64_t v14 = (char *)(v13 + 4);
  unint64_t v15 = v13 + 4 - (void)v32;
  if ((v2 & 0x1C) == 0 && !*(unsigned char *)(a1 + 71))
  {
    size_t v19 = v14 - (char *)v32;
    goto LABEL_31;
  }
  if (v15 > 0x200) {
    return 4294960553;
  }
  *(_DWORD *)(((unint64_t)v32 | 0xC) + v12 + 11) = 0;
  *(void *)unint64_t v14 = 0;
  *(_DWORD *)(v13 + 5) = 141568;
  if ((v2 & 4) != 0) {
    *(unsigned char *)(v13 + 11) = 0x80;
  }
  size_t v16 = v15 + 11;
  WORD5(v32[0]) = 256;
  char v17 = *(unsigned char *)(a1 + 71);
  if (!v17)
  {
    size_t v19 = v15 + 11;
    if ((v2 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  unint64_t v18 = *(unsigned __int8 *)(a1 + 72);
  size_t v19 = v15 + ((v18 + 7) >> 3) + 19;
  uint64_t v20 = 4294960553;
  if (v19 <= v16 || v19 > 0x200) {
    return v20;
  }
  unsigned int v21 = (char *)v32 + v16;
  bzero((char *)v32 + v16, (char *)v32 + v19 - ((char *)v32 + v16));
  *(_WORD *)(v13 + 13) = bswap32(v32 + v19 - v13 - 15) >> 16;
  *(_WORD *)unsigned int v21 = 2048;
  v21[4] = 0;
  __int16 v22 = (unsigned __int16)v32 + v19 - ((_WORD)v21 + 4);
  v21[2] = HIBYTE(v22);
  v21[3] = v22;
  v21[5] = v17;
  v21[6] = v18;
  void v21[7] = 0;
  uint64_t v23 = v21 + 8;
  if (v18 >= 8) {
    memcpy(v23, (const void *)(a1 + 73), v18 >> 3);
  }
  if ((v18 & 7) != 0) {
    *((unsigned char *)v23 + (v18 >> 3)) = *((unsigned char *)v23 + (v18 >> 3)) & ~(-1 << (8 - (v18 & 7))) | *(unsigned char *)(a1 + 73 + (v18 >> 3)) & (-1 << (8 - (v18 & 7)));
  }
  if ((v2 & 0x10) != 0)
  {
LABEL_21:
    if (v19 <= 0x1FA)
    {
      uint64_t v20 = 4294960554;
      if (v19 <= v15 || v19 - v15 < 0xB) {
        return v20;
      }
      size_t v24 = v19 + 6;
      long long v25 = (_WORD *)((char *)v32 + v19);
      bzero(v25, (char *)v32 + v24 - (char *)v25);
      *(_WORD *)(v13 + 13) = bswap32(v32 + v24 - v13 - 15) >> 16;
      *(_DWORD *)long long v25 = 33558272;
      v25[2] = 0;
      size_t v19 = v24;
      if ((v2 & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_25;
    }
    return 4294960553;
  }
LABEL_18:
  if ((v2 & 8) != 0)
  {
LABEL_25:
    unint64_t v26 = (v19 + 131) & 0xFFFFFFFFFFFFFF80;
    uint64_t v20 = 4294960553;
    if (v26 <= v19) {
      return v20;
    }
    if (v26 > 0x200) {
      return v20;
    }
    uint64_t v20 = 4294960554;
    if (v19 <= v15 || v19 - v15 < 0xB) {
      return v20;
    }
    uint64_t v27 = (char *)v32 + v19;
    CFSetRef v28 = (char *)((char *)v32 + v26 - v27);
    bzero(v27, (size_t)v28);
    *(_WORD *)(v13 + 13) = bswap32(v32 + v26 - v13 - 15) >> 16;
    *(_WORD *)uint64_t v27 = 3072;
    v27[2] = (unsigned __int16)((_WORD)v28 - 4) >> 8;
    v27[3] = (_BYTE)v28 - 4;
    size_t v19 = v26;
  }
LABEL_31:
  uint64_t v29 = dispatch_data_create(v32, v19, 0, 0);
  if (!v29) {
    return 4294960568;
  }
  unsigned int v30 = v29;
  uint64_t v20 = _mdns_message_set_msg_data((void *)a1, v29);
  dispatch_release(v30);
  if (!v20) {
    *(unsigned char *)(a1 + 70) |= 0x20u;
  }
  return v20;
}

uint64_t _mdns_dso_message_get_header(uint64_t result, unint64_t a2)
{
  if (a2 < 0xC || !result)
  {
    _os_assert_log();
    BOOL result = _os_crash();
    __break(1u);
  }
  return result;
}

BOOL mdns_dso_message_is_unidirectional(unsigned __int16 *a1, unint64_t a2)
{
  if (!a1 || a2 < 0xC) {
    return 0;
  }
  int v2 = *((char *)a1 + 2);
  unsigned int v3 = __rev16(*a1);
  BOOL v4 = v2 >= 0 && v3 == 0;
  BOOL result = v4;
  if (v2 < 0 && !v3) {
    return 0;
  }
  return result;
}

void _mdns_extended_dns_error_finalize(uint64_t a1)
{
  int v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

void *_mdns_extended_dns_error_copy_description(uint64_t a1, int a2, int a3)
{
  __int16 v6 = (void *)mdns_string_builder_create();
  if (!v6) {
    return 0;
  }
  unsigned int v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(void *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v7, "code: %u", *(unsigned __int16 *)(a1 + 32))|| (unint64_t v9 = *(unsigned __int16 *)(a1 + 32), v9 <= 0x18)&& mdns_string_builder_append_formatted(v7, " (%s)", off_10014A240[v9])|| mdns_string_builder_append_formatted(v7, ", extra-text: ")|| (!a3? ((v11 = *(void **)(a1 + 24)) == 0 || !xpc_string_get_string_ptr(v11)? (appended = mdns_string_builder_append_formatted(v7, "«EXTRA TEXT»")): (appended = mdns_string_builder_append_formatted(v7, "'%s'"))): (appended = mdns_string_builder_append_formatted(v7, "«REDACTED»", v13)), appended))
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

void ___mdns_copy_empty_string_block_invoke(id a1)
{
  _mdns_copy_empty_string_s_empty_string = (uint64_t)xpc_string_create("");
}

BOOL type_bit_maps_check_length(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1;
  unint64_t v3 = a1 + a2;
  for (unint64_t i = a1 + 1; i < v3; unint64_t i = v5 + 3)
  {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 1) + v2;
    uint64_t v2 = v5 + 2;
  }
  if (v2 != v3)
  {
    unsigned int v7 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT)) {
        return v2 == v3;
      }
    }
    else
    {
      unsigned int v7 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT)) {
        return v2 == v3;
      }
    }
    int v10 = 136447234;
    uint64_t v11 = "ptr == ptr_limit";
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    unint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v16 = 1024;
    int v17 = 42;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v10, 0x30u);
  }
  return v2 == v3;
}

uint64_t rdata_parser_type_bit_maps_cover_dns_type(unsigned __int8 *a1, int a2, unsigned int a3)
{
  unint64_t v3 = (unint64_t)&a1[a2];
  if ((unint64_t)(a1 + 1) >= v3)
  {
    char v4 = 0;
  }
  else
  {
    char v4 = 0;
    do
    {
      uint64_t v5 = a1[1];
      __int16 v6 = &a1[v5 + 2];
      if ((unint64_t)v6 > v3) {
        break;
      }
      unsigned int v7 = 8 * v5;
      if (a3 >> 8 == *a1 && v7 > a3) {
        v4 |= ((1 << (~(_BYTE)a3 & 7)) & a1[((unint64_t)a3 >> 3) + 2]) != 0;
      }
      a1 = v6;
    }
    while ((unint64_t)(v6 + 1) < v3);
  }
  return v4 & 1;
}

uint64_t rdata_parser_ds_get_digest_length(unsigned int a1)
{
  if (a1 <= 3)
  {
    unint64_t v3 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      unint64_t v3 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    int v6 = 136447234;
    unsigned int v7 = "rdata_len >= offsetof(rdata_ds_t, digest)";
    __int16 v8 = 2082;
    unint64_t v9 = "";
    __int16 v10 = 2082;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v12 = 1024;
    int v13 = 351;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v6, 0x30u);
    return 0;
  }
  return (unsigned __int16)(a1 - 4);
}

BOOL rdata_parser_rrsig_check_validity(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x13)
  {
    uint64_t v11 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }
    else
    {
      uint64_t v11 = mDNSLogCategory_Default_redacted;
      BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
    }
    int v14 = 136447234;
    uint64_t v15 = "rdata_len >= min_rdata_len_rrsig";
    __int16 v16 = 2082;
    int v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v20 = 1024;
    int v21 = 474;
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    goto LABEL_22;
  }
  unsigned int v2 = *(unsigned __int8 *)(a1 + 18);
  if (*(unsigned char *)(a1 + 18))
  {
    unint64_t v3 = a1 + a2;
    uint64_t v4 = a1 + 18;
    while (!v3 || v4 + (unint64_t)v2 + 1 <= v3)
    {
      uint64_t v5 = v2 + v4;
      unsigned int v6 = *(unsigned __int8 *)(v5 + 1);
      uint64_t v4 = v5 + 1;
      unsigned int v2 = v6;
      if (!v6) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v4 = a1 + 18;
LABEL_9:
    uint64_t v7 = v4 - (a1 + 18);
    BOOL v8 = __CFADD__(v7, 1);
    unint64_t v9 = v7 + 1;
    if (!v8)
    {
      if (v9 < (unint64_t)a2 - 18) {
        return 1;
      }
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        uint64_t v11 = mDNSLogCategory_Default;
        BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t v11 = mDNSLogCategory_Default_redacted;
        BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
      }
      int v14 = 136447234;
      uint64_t v15 = "signer_name_len < rdata_len - offsetof(rdata_rrsig_t, signer_name)";
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2082;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
      __int16 v20 = 1024;
      int v21 = 481;
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      goto LABEL_22;
    }
  }
  uint64_t v11 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT);
    if (result)
    {
LABEL_21:
      int v14 = 136447234;
      uint64_t v15 = "signer_name_len >= 1";
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2082;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
      __int16 v20 = 1024;
      int v21 = 479;
      __int16 v22 = 2048;
      uint64_t v23 = 0;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v14, 0x30u);
      return 0;
    }
  }
  else
  {
    uint64_t v11 = mDNSLogCategory_Default_redacted;
    BOOL result = os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT);
    if (result) {
      goto LABEL_21;
    }
  }
  return result;
}

uint64_t rdata_parser_dnskey_get_public_key_size(unsigned int a1)
{
  if (a1 <= 3)
  {
    unint64_t v3 = mDNSLogCategory_Default;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    else
    {
      unint64_t v3 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
    }
    int v6 = 136447234;
    uint64_t v7 = "rdata_len >= offsetof(rdata_dnskey_t, public_key)";
    __int16 v8 = 2082;
    unint64_t v9 = "";
    __int16 v10 = 2082;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/mDNSResponder/mDNSShared/dns_objects/utilities/rdata_parser.c";
    __int16 v12 = 1024;
    int v13 = 539;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "AssertMacros: %{public}s, %{public}s file: %{public}s, line: %d, value: %ld", (uint8_t *)&v6, 0x30u);
    return 0;
  }
  return (unsigned __int16)(a1 - 4);
}

void dnssd_analytics_update_dns_query_info(int a1, int a2, int a3, unsigned int a4, unsigned int a5, int a6)
{
  if (a2)
  {
    int v7 = 3;
    if (a2 == 1) {
      int v7 = 1;
    }
    unsigned int v8 = 2 * (a2 != 1);
    if (a1) {
      unsigned int v8 = v7;
    }
    unint64_t v9 = (void *)&s_dns_analytics + 13 * v8;
    if (v9)
    {
      switch(a3)
      {
        case 65:
          __int16 v14 = (char *)&s_dns_analytics + 104 * v8 + 80;
          break;
        case 28:
          __int16 v14 = (char *)&s_dns_analytics + 104 * v8 + 56;
          break;
        case 1:
          __int16 v14 = (char *)&s_dns_analytics + 104 * v8 + 32;
          break;
        default:
          return;
      }
      ++*v9;
      *((void *)&s_dns_analytics + 13 * v8 + 1) += a5;
      *(void *)v14 += a4;
      uint64_t v15 = 16;
      if (a6) {
        uint64_t v15 = 8;
      }
      ++*(void *)&v14[v15];
      __int16 v16 = mDNSLogCategory_Analytics;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEBUG)) {
          return;
        }
      }
      else
      {
        __int16 v16 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEBUG)) {
          return;
        }
      }
      v17[0] = 67110144;
      v17[1] = a1;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 1024;
      unsigned int v21 = a4;
      __int16 v22 = 1024;
      unsigned int v23 = a5;
      __int16 v24 = 1024;
      int v25 = a6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "dnssd_analytics_update_dns_query_info cell %d qtype %d queries %u latency %d pos %d", (uint8_t *)v17, 0x20u);
    }
  }
}

void dnssd_analytics_update_cache_request(int a1, int a2)
{
  if (a1)
  {
    if (a1 != 1)
    {
      uint64_t v4 = mDNSLogCategory_Analytics;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v14 = 67109120;
        int v15 = a1;
        int v6 = "dnssd_analytics_update_cache_request:  unknown CacheRequestType %d";
      }
      else
      {
        uint64_t v4 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v14 = 67109120;
        int v15 = a1;
        int v6 = "dnssd_analytics_update_cache_request:  unknown CacheRequestType %d";
      }
      unsigned int v8 = v4;
LABEL_40:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, 8u);
      return;
    }
    if (a2 == 1)
    {
      ++sCacheRequest_UnicastMissCount;
      return;
    }
    if (!a2)
    {
      ++sCacheRequest_UnicastHitCount;
      return;
    }
    uint64_t v9 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v14 = 67109120;
      int v15 = a2;
      int v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for unicast";
      goto LABEL_39;
    }
    uint64_t v9 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      int v15 = a2;
      int v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for unicast";
LABEL_39:
      unsigned int v8 = v9;
      goto LABEL_40;
    }
  }
  else
  {
    if (a2 == 1)
    {
      ++sCacheRequest_MulticastMissCount;
      return;
    }
    if (!a2)
    {
      ++sCacheRequest_MulticastHitCount;
      return;
    }
    uint64_t v9 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v14 = 67109120;
      int v15 = a2;
      int v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for multicast";
      goto LABEL_39;
    }
    uint64_t v9 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      int v15 = a2;
      int v6 = "dnssd_analytics_update_cache_request:  unknown CacheState %d for multicast";
      goto LABEL_39;
    }
  }
}

void __dnssd_analytics_init_block_invoke(id a1)
{
  dnssd_analytics_init_sAnalyticsQueue = (uint64_t)dispatch_queue_create("com.apple.mDNSResponder.analytics-reporting-queue", 0);
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v1, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v1, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v1, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v1, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_string(v1, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_activity_register("com.apple.mDNSResponder.analytics.daily", v1, &__block_literal_global_8_7242);
  if (v1)
  {
    xpc_release(v1);
  }
}

void __dnssd_analytics_init_block_invoke_2(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_should_defer(a2))
  {
    BOOL v3 = xpc_activity_set_state(a2, 3);
    char v4 = gSensitiveLoggingEnabled;
    uint64_t v5 = mDNSLogCategory_Analytics;
    if (mDNSLogCategory_Analytics == mDNSLogCategory_State) {
      char v4 = 0;
    }
    if (v3)
    {
      if (v4)
      {
        uint64_t v5 = mDNSLogCategory_Analytics_redacted;
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        __int16 v16 = 0;
        int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer";
        int v7 = (uint8_t *)&v16;
      }
      else
      {
        if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        __int16 v17 = 0;
        int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer";
        int v7 = (uint8_t *)&v17;
      }
      uint64_t v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
    if (v4)
    {
      uint64_t v5 = mDNSLogCategory_Analytics_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
      __int16 v14 = 0;
      int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer but failed to set state";
      int v7 = (uint8_t *)&v14;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_WORD *)buf = 0;
      int v6 = "com.apple.mDNSResponder.analytics.daily: Asked to defer but failed to set state";
      int v7 = buf;
    }
LABEL_26:
    uint64_t v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v6, v7, 2u);
    return;
  }
  dispatch_async((dispatch_queue_t)dnssd_analytics_init_sAnalyticsQueue, &__block_literal_global_12_7250);
  if (xpc_activity_set_state(a2, 5)) {
    return;
  }
  uint64_t v5 = mDNSLogCategory_Analytics;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v13 = 0;
    int v6 = "com.apple.mDNSResponder.analytics.daily: Analytics XPC_ACTIVITY_STATE_DONE failed";
    int v7 = (uint8_t *)&v13;
    goto LABEL_26;
  }
  uint64_t v5 = mDNSLogCategory_Analytics_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = 0;
    int v6 = "com.apple.mDNSResponder.analytics.daily: Analytics XPC_ACTIVITY_STATE_DONE failed";
    int v7 = (uint8_t *)&v12;
    goto LABEL_26;
  }
}

void __dnssd_analytics_init_block_invoke_9(id a1)
{
  uint64_t v1 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v1, v2, v3, v4, v5, v6, v7, v8);
  mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"dnssd_analytics_init_block_invoke", 606);
  if (sCacheRequest_UnicastHitCount)
  {
    _post_cache_request_count(1, 0, sCacheRequest_UnicastHitCount);
    sCacheRequest_UnicastHitCFIndex Count = 0;
  }
  if (sCacheRequest_UnicastMissCount)
  {
    _post_cache_request_count(1, 1, sCacheRequest_UnicastMissCount);
    sCacheRequest_UnicastMissCFIndex Count = 0;
  }
  if (sCacheRequest_MulticastHitCount)
  {
    _post_cache_request_count(0, 0, sCacheRequest_MulticastHitCount);
    sCacheRequest_MulticastHitCFIndex Count = 0;
  }
  if (sCacheRequest_MulticastMissCount)
  {
    _post_cache_request_count(0, 1, sCacheRequest_MulticastMissCount);
    sCacheRequest_MulticastMissCFIndex Count = 0;
  }
  if (__PAIR128__(sCacheUsage_MulticastMissCount, sCacheUsage_MulticastHitCount) != 0)
  {
    _post_cache_usage_counts_for_type(0, sCacheUsage_MulticastHitCount, sCacheUsage_MulticastMissCount);
    sCacheUsage_MulticastHitCFIndex Count = 0;
    sCacheUsage_MulticastMissCFIndex Count = 0;
  }
  if (__PAIR128__(sCacheUsage_UnicastMissCount, sCacheUsage_UnicastHitCount) != 0)
  {
    _post_cache_usage_counts_for_type(1, sCacheUsage_UnicastHitCount, sCacheUsage_UnicastMissCount);
    sCacheUsage_UnicastHitCFIndex Count = 0;
    sCacheUsage_UnicastMissCFIndex Count = 0;
  }
  unint64_t v9 = 0;
  os_log_type_t v10 = &s_dns_analytics;
  do
  {
    if (*(void *)v10)
    {
      uint64_t v11 = off_10014B608[v9];
      *(void *)buf = _NSConcreteStackBlock;
      __int16 v12 = v9 >= 2 ? "encrypted" : "standard";
      uint64_t v25 = 0x40000000;
      unint64_t v26 = ___post_dns_analytic_block_invoke;
      uint64_t v27 = &__block_descriptor_tmp_66;
      CFSetRef v28 = v11;
      uint64_t v29 = v12;
      unsigned int v30 = v10;
      if ((analytics_send_event_lazy() & 1) == 0)
      {
        __int16 v13 = mDNSLogCategory_Analytics;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
        {
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
        }
        else
        {
          __int16 v13 = mDNSLogCategory_Analytics_redacted;
          if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
        }
        *(_WORD *)unsigned int v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.dnsqueryinfo: Analytic not posted", v23, 2u);
      }
    }
LABEL_25:
    ++v9;
    os_log_type_t v10 = (long long *)((char *)v10 + 104);
  }
  while (v9 != 4);
  xmmword_1001708F0 = 0u;
  unk_100170900 = 0u;
  xmmword_1001708D0 = 0u;
  unk_1001708E0 = 0u;
  xmmword_1001708B0 = 0u;
  unk_1001708C0 = 0u;
  xmmword_100170890 = 0u;
  unk_1001708A0 = 0u;
  xmmword_100170870 = 0u;
  unk_100170880 = 0u;
  xmmword_100170850 = 0u;
  unk_100170860 = 0u;
  xmmword_100170830 = 0u;
  unk_100170840 = 0u;
  xmmword_100170810 = 0u;
  unk_100170820 = 0u;
  xmmword_1001707F0 = 0u;
  unk_100170800 = 0u;
  xmmword_1001707D0 = 0u;
  unk_1001707E0 = 0u;
  xmmword_1001707B0 = 0u;
  *(_OWORD *)&qword_1001707C0 = 0u;
  xmmword_100170790 = 0u;
  *(_OWORD *)&qword_1001707A0 = 0u;
  s_dns_analytics = 0u;
  unk_100170780 = 0u;
  if ((analytics_send_event_lazy() & 1) == 0)
  {
    __int16 v14 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.unicastassist: Analytic not posted", buf, 2u);
      }
    }
    else
    {
      __int16 v14 = mDNSLogCategory_Analytics_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        goto LABEL_33;
      }
    }
  }
  sUnicastAssist_UnicastCFIndex Count = 0;
  sUnicastAssist_MulticastCFIndex Count = 0;
  sNonUnicastAssist_UnicastCFIndex Count = 0;
  sNonUnicastAssist_MulticastCFIndex Count = 0;
  int v15 = mDNSLogCategory_Analytics;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_40:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.analytics.daily Complete", buf, 2u);
    }
  }
  else
  {
    int v15 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_40;
    }
  }
  mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"dnssd_analytics_init_block_invoke", 618);
  KQueueUnlock((uint64_t)"Analytics Update", v16, v17, v18, v19, v20, v21, v22);
}

void _post_cache_request_count(int a1, int a2, uint64_t a3)
{
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 0x40000000;
  unint64_t v9 = ___post_cache_request_count_block_invoke;
  os_log_type_t v10 = &__block_descriptor_tmp_46_7295;
  int v12 = a1;
  int v13 = a2;
  uint64_t v11 = a3;
  if ((analytics_send_event_lazy() & 1) == 0)
  {
    uint64_t v3 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_WORD *)uint64_t v6 = 0;
      goto LABEL_11;
    }
    uint64_t v3 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.CacheUsage.request: Analytic not posted", v6, 2u);
    }
  }
}

void _post_cache_usage_counts_for_type(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 0x40000000;
  unint64_t v9 = ___post_cache_usage_counts_for_type_block_invoke;
  os_log_type_t v10 = &__block_descriptor_tmp_50_7288;
  int v13 = a1;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  if ((analytics_send_event_lazy() & 1) == 0)
  {
    uint64_t v3 = mDNSLogCategory_Analytics;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Analytics == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_WORD *)uint64_t v6 = 0;
      goto LABEL_11;
    }
    uint64_t v3 = mDNSLogCategory_Analytics_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Analytics_redacted, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "com.apple.mDNSResponder.CacheUsage.entries: Analytic not posted", v6, 2u);
    }
  }
}

xpc_object_t ___post_dns_analytic_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "network", *(const char **)(a1 + 32));
  xpc_dictionary_set_string(v2, "transport", *(const char **)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "latency_ms", *(void *)(*(void *)(a1 + 48) + 8) / **(void **)(a1 + 48));
  xpc_dictionary_set_uint64(v2, "query_bytes", *(void *)(*(void *)(a1 + 48) + 16));
  xpc_dictionary_set_uint64(v2, "reply_bytes", *(void *)(*(void *)(a1 + 48) + 24));
  xpc_dictionary_set_uint64(v2, "v4_queries", *(void *)(*(void *)(a1 + 48) + 32));
  xpc_dictionary_set_uint64(v2, "v4_reply_pos", *(void *)(*(void *)(a1 + 48) + 40));
  xpc_dictionary_set_uint64(v2, "v4_reply_neg", *(void *)(*(void *)(a1 + 48) + 48));
  xpc_dictionary_set_uint64(v2, "v6_queries", *(void *)(*(void *)(a1 + 48) + 56));
  xpc_dictionary_set_uint64(v2, "v6_reply_pos", *(void *)(*(void *)(a1 + 48) + 64));
  xpc_dictionary_set_uint64(v2, "v6_reply_neg", *(void *)(*(void *)(a1 + 48) + 72));
  xpc_dictionary_set_uint64(v2, "https_queries", *(void *)(*(void *)(a1 + 48) + 80));
  xpc_dictionary_set_uint64(v2, "https_reply_pos", *(void *)(*(void *)(a1 + 48) + 88));
  xpc_dictionary_set_uint64(v2, "https_reply_neg", *(void *)(*(void *)(a1 + 48) + 96));
  return v2;
}

void *__cdecl ___post_unicast_assist_block_invoke(id a1)
{
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v1, "unicast", sUnicastAssist_UnicastCount);
  xpc_dictionary_set_uint64(v1, "multicast", sUnicastAssist_MulticastCount);
  xpc_dictionary_set_uint64(v1, "non_unicast", sNonUnicastAssist_UnicastCount);
  xpc_dictionary_set_uint64(v1, "non_multicast", sNonUnicastAssist_MulticastCount);
  return v1;
}

void *___post_cache_usage_counts_for_type_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = v2;
  if (*(_DWORD *)(a1 + 48)) {
    uint64_t v4 = "unicast";
  }
  else {
    uint64_t v4 = "multicast";
  }
  xpc_dictionary_set_string(v2, "requestType", v4);
  xpc_dictionary_set_uint64(v3, "hitCount", *(void *)(a1 + 32));
  xpc_dictionary_set_uint64(v3, "missCount", *(void *)(a1 + 40));
  return v3;
}

void *___post_cache_request_count_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = v2;
  if (*(_DWORD *)(a1 + 40)) {
    uint64_t v4 = "unicast";
  }
  else {
    uint64_t v4 = "multicast";
  }
  xpc_dictionary_set_string(v2, "requestType", v4);
  if (*(_DWORD *)(a1 + 44)) {
    uint64_t v5 = "miss";
  }
  else {
    uint64_t v5 = "hit";
  }
  xpc_dictionary_set_string(v3, "cacheState", v5);
  xpc_dictionary_set_uint64(v3, "requestCount", *(void *)(a1 + 32));
  return v3;
}

void *_mdns_dso_message_builder_copy_description(void *a1, int a2)
{
  uint64_t v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

unsigned char *mdns_dso_message_builder_create_message(uint64_t a1)
{
  uint64_t v16 = 0;
  __int16 buffer = bswap32(*(unsigned __int16 *)(a1 + 28)) >> 16;
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 30) & 0xF;
  if (*(unsigned char *)(v2 + 56)) {
    char v4 = -80;
  }
  else {
    char v4 = 48;
  }
  char v14 = v4;
  char v15 = v3;
  dispatch_data_t v5 = dispatch_data_create(&buffer, 0xCuLL, 0, 0);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v2 + 48);
  if (v7)
  {
    uint64_t v8 = v7(a1);
    if (!v8)
    {
      uint64_t v11 = 0;
      goto LABEL_12;
    }
    unint64_t v9 = v8;
    dispatch_data_t concat = dispatch_data_create_concat(v6, v8);
    dispatch_release(v6);
    if (!concat)
    {
      uint64_t v11 = 0;
      uint64_t v6 = v9;
LABEL_12:
      dispatch_release(v6);
      return v11;
    }
    uint64_t v6 = concat;
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v11 = mdns_message_create_with_dispatch_data(v6, *(_DWORD *)(a1 + 24));
  dispatch_release(v6);
  uint64_t v6 = v9;
  if (v9) {
    goto LABEL_12;
  }
  return v11;
}

dispatch_data_t _mdns_dso_keepalive_message_builder_create_primary_tlv(uint64_t a1)
{
  char v3 = malloc_type_calloc(1uLL, 0xCuLL, 0xF1748037uLL);
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  xpc_object_t v1 = v3;
  _DWORD *v3 = 134217984;
  int v5 = *(_DWORD *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 36);
  *((unsigned char *)v3 + 4) = HIBYTE(v5);
  *((unsigned char *)v3 + 5) = BYTE2(v5);
  *((unsigned char *)v3 + 6) = BYTE1(v5);
  *((unsigned char *)v3 + 7) = v5;
  *((unsigned char *)v3 + 8) = HIBYTE(v4);
  *((unsigned char *)v3 + 9) = BYTE2(v4);
  *((unsigned char *)v3 + 10) = BYTE1(v4);
  *((unsigned char *)v3 + 11) = v4;
  dispatch_data_t result = dispatch_data_create(v3, 0xCuLL, 0, _dispatch_data_destructor_free);
  if (!result)
  {
LABEL_5:
    free(v1);
    return 0;
  }
  return result;
}

char *_mdns_dso_subscribe_message_builder_create_primary_tlv(uint64_t a1)
{
  dispatch_data_t result = 0;
  size_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
  size_t v4 = v3 + 4;
  if (v3 < 0xFFFFFFFFFFFFFFFCLL && !(v4 >> 16))
  {
    size_t v5 = v3 + 8;
    dispatch_data_t result = (char *)malloc_type_calloc(1uLL, v3 + 8, 0xF1748037uLL);
    if (result)
    {
      uint64_t v6 = result;
      *(_WORD *)dispatch_data_t result = 0x4000;
      result[2] = BYTE1(v4);
      result[3] = v4;
      if (v4 < v3) {
        v3 += 4;
      }
      if (v3)
      {
        memcpy(result + 4, *(const void **)(*(void *)(a1 + 32) + 24), v3);
        uint64_t v7 = v3 + 4;
      }
      else
      {
        uint64_t v7 = 4;
      }
      __src[0] = bswap32(*(unsigned __int16 *)(a1 + 40)) >> 16;
      __src[1] = bswap32(*(unsigned __int16 *)(a1 + 42)) >> 16;
      unint64_t v8 = v5 - v7;
      if (v5 - v7 >= 4) {
        size_t v9 = 4;
      }
      else {
        size_t v9 = v5 - v7;
      }
      if (v9) {
        memcpy(&v6[v7], __src, v9);
      }
      if (v8 < 4 || (dispatch_data_t result = (char *)dispatch_data_create(v6, v4 + 4, 0, _dispatch_data_destructor_free)) == 0)
      {
        free(v6);
        return 0;
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void _mdns_dso_subscribe_message_builder_finalize(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    os_release(v2);
    *(void *)(a1 + 32) = 0;
  }
}

dispatch_data_t _mdns_dso_unsubscribe_message_builder_create_primary_tlv(uint64_t a1)
{
  size_t v3 = malloc_type_calloc(1uLL, 6uLL, 0xF1748037uLL);
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  xpc_object_t v1 = v3;
  _DWORD *v3 = 33571328;
  *((_WORD *)v3 + 2) = bswap32(*(unsigned __int16 *)(a1 + 32)) >> 16;
  dispatch_data_t result = dispatch_data_create(v3, 6uLL, 0, _dispatch_data_destructor_free);
  if (!result)
  {
LABEL_5:
    free(v1);
    return 0;
  }
  return result;
}

void __init_log_utility_service_block_invoke(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v7 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        xpc_retain(a2);
        xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)log_utility_server_queue);
        *(void *)uint64_t v12 = _NSConcreteStackBlock;
        *(void *)&v12[8] = 0x40000000;
        *(void *)&v12[16] = __accept_client_block_invoke;
        int v13 = &__block_descriptor_tmp_3_7379;
        char v14 = a2;
        xpc_connection_set_event_handler((xpc_connection_t)a2, v12);
        xpc_connection_resume((xpc_connection_t)a2);
        return;
      }
      *(_DWORD *)uint64_t v12 = 134217984;
      *(void *)&v12[4] = a2;
    }
    else
    {
      uint64_t v7 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)uint64_t v12 = 134217984;
      *(void *)&v12[4] = a2;
    }
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "C%p {action='receives connection'}", v12, 0xCu);
    goto LABEL_24;
  }
  char v4 = gSensitiveLoggingEnabled;
  uint64_t v5 = mDNSLogCategory_XPC;
  if (mDNSLogCategory_XPC == mDNSLogCategory_State) {
    char v4 = 0;
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4)
    {
      uint64_t v5 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
    }
    else if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
    {
      return;
    }
    *(_DWORD *)uint64_t v12 = 134218242;
    *(void *)&v12[4] = a2;
    *(_WORD *)&v12[12] = 2082;
    *(void *)&v12[14] = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    uint64_t v6 = "C%p {xpc_error=\n%{public}s\n}";
    size_t v9 = v5;
    uint32_t v10 = 22;
  }
  else
  {
    if (v4)
    {
      uint64_t v5 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)uint64_t v12 = 134217984;
      *(void *)&v12[4] = a2;
      uint64_t v6 = "C%p {error='receives unknown xpc request'}";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)uint64_t v12 = 134217984;
      *(void *)&v12[4] = a2;
      uint64_t v6 = "C%p {error='receives unknown xpc request'}";
    }
    size_t v9 = v5;
    uint32_t v10 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v6, v12, v10);
}

void __accept_client_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    char v4 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint64_t v6 = *(void *)(a1 + 32);
      buf[0].st_dev = 134217984;
      *(void *)&buf[0].st_mode = v6;
    }
    else
    {
      char v4 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        uint64_t v12 = *(void **)(a1 + 32);
        if (v12) {
          goto LABEL_57;
        }
        return;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      buf[0].st_dev = 134217984;
      *(void *)&buf[0].st_mode = v11;
    }
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "C%p {status='client closed the connection'}", (uint8_t *)buf, 0xCu);
    goto LABEL_19;
  }
  remote_connection = xpc_dictionary_get_remote_connection(object);
  unint64_t v8 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    buf[0].st_dev = 134217984;
    *(void *)&buf[0].st_mode = remote_connection;
    goto LABEL_23;
  }
  unint64_t v8 = mDNSLogCategory_XPC_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT))
  {
    buf[0].st_dev = 134217984;
    *(void *)&buf[0].st_mode = remote_connection;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "C%p {action='handling log utility request'}", (uint8_t *)buf, 0xCu);
  }
LABEL_24:
  xpc_object_t reply = xpc_dictionary_create_reply(object);
  if (!reply)
  {
    uint64_t v19 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        return;
      }
      buf[0].st_dev = 134217984;
      *(void *)&buf[0].st_mode = remote_connection;
    }
    else
    {
      uint64_t v19 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        return;
      }
      buf[0].st_dev = 134217984;
      *(void *)&buf[0].st_mode = remote_connection;
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "C%p {error='cannot create reply response dictionary'}", (uint8_t *)buf, 0xCu);
    return;
  }
  char v15 = reply;
  uid_t euid = xpc_connection_get_euid(remote_connection);
  pid_t pid = xpc_connection_get_pid(remote_connection);
  if (euid)
  {
    uint64_t v18 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v18 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
    }
    buf[0].st_dev = 134218240;
    *(void *)&buf[0].st_mode = remote_connection;
    WORD2(buf[0].st_ino) = 1024;
    *(_DWORD *)((char *)&buf[0].st_ino + 6) = pid;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "C%p {client_pid=%d,error='not running as root'}", (uint8_t *)buf, 0x12u);
LABEL_43:
    if (IsEntitled())
    {
      unsigned int v30 = "Client must be running as root";
LABEL_55:
      xpc_dictionary_set_string(v15, "ErrorDescription", v30);
      uint64_t v32 = 3;
      goto LABEL_56;
    }
LABEL_45:
    int v31 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
      {
LABEL_53:
        buf[0].st_dev = 134218240;
        *(void *)&buf[0].st_mode = remote_connection;
        WORD2(buf[0].st_ino) = 1024;
        *(_DWORD *)((char *)&buf[0].st_ino + 6) = pid;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "C%p {client_pid=%d,error='Client is missing entitlement'}", (uint8_t *)buf, 0x12u);
      }
    }
    else
    {
      int v31 = mDNSLogCategory_XPC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_53;
      }
    }
    unsigned int v30 = "Client is missing the entitlement";
    goto LABEL_55;
  }
  if (!IsEntitled()) {
    goto LABEL_45;
  }
  if (!xpc_dictionary_get_uint64(object, "mDNSResponderStateDump"))
  {
    uint64_t v33 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR))
      {
        buf[0].st_dev = 134217984;
        *(void *)&buf[0].st_mode = remote_connection;
        goto LABEL_89;
      }
    }
    else
    {
      uint64_t v33 = mDNSLogCategory_XPC_redacted;
      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
      {
        buf[0].st_dev = 134217984;
        *(void *)&buf[0].st_mode = remote_connection;
LABEL_89:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "C%p {error='unknown log utility request from client'}", (uint8_t *)buf, 0xCu);
      }
    }
    xpc_dictionary_set_string(v15, "ErrorDescription", "unknown log utility request from client");
    uint64_t v32 = 2;
    goto LABEL_56;
  }
  int uint64 = xpc_dictionary_get_uint64(object, "mDNSResponderStateDump");
  bzero(&__str, 0x400uLL);
  if (is_apple_internal_build_s_once != -1) {
    dispatch_once(&is_apple_internal_build_s_once, &__block_literal_global_6077);
  }
  if (!is_apple_internal_build_is_internal)
  {
    unsigned int v30 = "State dump is only enabled in internal builds";
    goto LABEL_55;
  }
  int v21 = xpc_dictionary_dup_fd(object, "mDNSResponderDumpFD");
  v123.__darwin_time_t tv_sec = 0;
  *(void *)&v123.tv_usec = 0;
  gettimeofday(&v123, 0);
  KQueueLock();
  if (uint64 == 3)
  {
    dump_state_to_fd(v21);
    int v29 = 0;
    goto LABEL_239;
  }
  bzero(__s, 0x400uLL);
  int v122 = uint64;
  int v120 = v21;
  if ((snprintf((char *)&__str, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", "mDNSResponder_state_dump")- 1024) <= 0xFFFFFC00)
  {
    uint64_t v45 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        goto LABEL_121;
      }
    }
    else
    {
      uint64_t v45 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        goto LABEL_121;
      }
    }
    buf[0].st_dev = 67109632;
    *(_DWORD *)&buf[0].st_mode = 1024;
    LOWORD(buf[0].st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = 30;
    HIWORD(buf[0].st_uid) = 2048;
    *(void *)&buf[0].st_gid = 24;
    unsigned int v47 = "snprintf truncates the final string - full name buffer length: %u, directory name length: %zu, file name length: %zu";
    uint64_t v48 = v45;
    uint32_t v49 = 28;
    goto LABEL_103;
  }
  int v34 = opendir("/private/var/log/mDNSResponder");
  if (!v34)
  {
    uint64_t v46 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        goto LABEL_121;
      }
    }
    else
    {
      uint64_t v46 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        goto LABEL_121;
      }
    }
    char v50 = __error();
    long long v51 = strerror(*v50);
    buf[0].st_dev = 136446466;
    *(void *)&buf[0].st_mode = "/private/var/log/mDNSResponder";
    WORD2(buf[0].st_ino) = 2082;
    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v51;
    unsigned int v47 = "State Dump: directory %{public}s cannot be opened, reason: %{public}s";
    uint64_t v48 = v46;
    uint32_t v49 = 22;
LABEL_103:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, v47, (uint8_t *)buf, v49);
LABEL_121:
    v124.__darwin_time_t tv_sec = 0;
    *(void *)&v124.tv_usec = 0;
    memset(buf, 0, 56);
    memset(&v133, 0, 32);
    memset(v131, 0, sizeof(v131));
    gettimeofday(&v124, 0);
    localtime_r(&v124.tv_sec, (tm *)buf);
    strftime((char *)&v133, 0x20uLL, "%F_%H-%M-%S", (const tm *)buf);
    strftime((char *)v131, 0x20uLL, "%z", (const tm *)buf);
    int v61 = snprintf((char *)&__str, 0x400uLL, "%s/%s_%s-%06lu%s.txt", "/private/var/log/mDNSResponder", "mDNSResponder_state_dump", (const char *)&v133, v124.tv_usec, (const char *)v131);
    if ((v61 - 1024) > 0xFFFFFC00)
    {
      unsigned int v62 = open((const char *)&__str, 513, 420);
      if ((v62 & 0x80000000) == 0)
      {
        int v63 = v62;
        dump_state_to_fd(v62);
        close(v63);
        if (uint64 != 2)
        {
LABEL_141:
          int v29 = 0;
          goto LABEL_238;
        }
        memset(&v133, 0, sizeof(v133));
        bzero(buf, 0x400uLL);
        if (archive_write_new())
        {
          archive_write_add_filter_bzip2();
          archive_write_set_format_ustar();
          size_t v64 = strlen((const char *)&__str);
          size_t v65 = v64 + 4;
          if (v64 + 4 < 0x400)
          {
            snprintf((char *)buf, 0x400uLL, "%.*s%s", v64 - 3, (const char *)&__str, "tar.bz2");
            if (!archive_write_open_filename())
            {
              stat((const char *)&__str, &v133);
              if (archive_entry_new())
              {
                strstr((char *)&__str, "mDNSResponder_state_dump");
                archive_entry_copy_stat();
                archive_entry_set_pathname();
                do
                  int v66 = archive_write_header();
                while (v66 == -10);
                if (!v66)
                {
                  st_size_t size = v133.st_size;
                  if ((unint64_t)(v133.st_size - 0x100000000) < 0xFFFFFFFF00000001) {
                    goto LABEL_227;
                  }
                  int v68 = open((const char *)&__str, 0);
                  if (v68 == -1) {
                    goto LABEL_227;
                  }
                  int v69 = v68;
                  int v70 = mmap(0, st_size, 1, 2, v68, 0);
                  if (v70 != (void *)-1)
                  {
                    long long v71 = v70;
                    uint64_t v72 = archive_write_data();
                    uint64_t v73 = v72;
                    if ((v72 & 0x8000000000000000) == 0 && v72 == st_size)
                    {
                      munmap(v71, st_size);
                      close(v69);
                      archive_entry_free();
                      archive_write_close();
                      archive_write_free();
                      remove(&__str, v74);
                      if (strlen((const char *)buf) <= 0x3FF)
                      {
                        uint64_t v75 = 0;
                        int uint64 = v122;
                        while (1)
                        {
                          int v76 = *((unsigned __int8 *)&buf[0].st_dev + v75);
                          __str.__pn_.__r_.__value_.__s.__data_[v75] = v76;
                          if (!v76) {
                            goto LABEL_141;
                          }
                          if (++v75 == 1023)
                          {
                            int v29 = 0;
                            char v126 = 0;
                            goto LABEL_238;
                          }
                        }
                      }
LABEL_231:
                      __str.__pn_.__r_.__value_.__s.__data_[0] = 0;
                      int v114 = mDNSLogCategory_XPC;
                      int uint64 = v122;
                      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                      {
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEFAULT))
                        {
LABEL_236:
                          __int16 v115 = __error();
                          uint64_t v116 = strerror(*v115);
                          buf[0].st_dev = 136315138;
                          *(void *)&buf[0].st_mode = v116;
                          _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "State Dump: Error happens when trying to compress the state dump, reason: %s", (uint8_t *)buf, 0xCu);
                        }
                      }
                      else
                      {
                        int v114 = mDNSLogCategory_XPC_redacted;
                        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_236;
                        }
                      }
                      int v29 = 255;
                      goto LABEL_238;
                    }
                    oslog = mDNSLogCategory_XPC;
                    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                    {
                      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                      {
LABEL_246:
                        *(_DWORD *)unint64_t v131 = 134218240;
                        *(void *)&v131[4] = v73;
                        *(_WORD *)&v131[12] = 1024;
                        *(_DWORD *)&v131[14] = st_size;
                        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "archive_write_data fails: amount_written(%ld) != (%u)", v131, 0x12u);
                      }
                    }
                    else
                    {
                      oslog = mDNSLogCategory_XPC_redacted;
                      if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
                        goto LABEL_246;
                      }
                    }
                    munmap(v71, st_size);
                    close(v69);
                    archive_entry_free();
                    archive_write_close();
                    goto LABEL_229;
                  }
                  int v96 = mDNSLogCategory_XPC;
                  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                  {
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                    {
LABEL_225:
                      uint64_t v112 = __error();
                      __int16 v113 = strerror(*v112);
                      *(_DWORD *)unint64_t v131 = 136446210;
                      *(void *)&v131[4] = v113;
                      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEBUG, "mmap fails: %{public}s", v131, 0xCu);
                    }
                  }
                  else
                  {
                    int v96 = mDNSLogCategory_XPC_redacted;
                    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_225;
                    }
                  }
                  close(v69);
                  goto LABEL_227;
                }
                uint64_t v94 = mDNSLogCategory_XPC;
                if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
                {
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                  {
LABEL_227:
                    archive_entry_free();
                    goto LABEL_228;
                  }
                }
                else
                {
                  uint64_t v94 = mDNSLogCategory_XPC_redacted;
                  if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_227;
                  }
                }
                uint64_t v111 = archive_error_string();
                *(_DWORD *)unint64_t v131 = 136446210;
                *(void *)&v131[4] = v111;
                _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "archive_write_header fails: %{public}s", v131, 0xCu);
                goto LABEL_227;
              }
              __int16 v93 = mDNSLogCategory_XPC;
              if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
              {
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
                {
LABEL_221:
                  int v108 = __error();
                  v109 = strerror(*v108);
                  *(_DWORD *)unint64_t v131 = 136446210;
                  *(void *)&v131[4] = v109;
                  _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "archive_entry_new fails: %{public}s", v131, 0xCu);
                }
              }
              else
              {
                __int16 v93 = mDNSLogCategory_XPC_redacted;
                if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_221;
                }
              }
LABEL_228:
              archive_write_close();
              goto LABEL_229;
            }
            uint64_t v85 = mDNSLogCategory_XPC;
            if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
            {
              if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
              {
LABEL_218:
                uint64_t v107 = archive_error_string();
                *(_DWORD *)unint64_t v131 = 136446210;
                *(void *)&v131[4] = v107;
                int v104 = "archive_write_open_filename fails: %{public}s";
                uint64_t v105 = v85;
                uint32_t v106 = 12;
                goto LABEL_219;
              }
            }
            else
            {
              uint64_t v85 = mDNSLogCategory_XPC_redacted;
              if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_218;
              }
            }
LABEL_229:
            archive_write_free();
            goto LABEL_230;
          }
          uint64_t v84 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_229;
            }
          }
          else
          {
            uint64_t v84 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_229;
            }
          }
          *(_DWORD *)unint64_t v131 = 134218240;
          *(void *)&v131[4] = 1024;
          *(_WORD *)&v131[12] = 2048;
          *(void *)&v131[14] = v65;
          int v104 = "buffer is not large enough to hold the file name - buffer length: %zu, required length: %zu";
          uint64_t v105 = v84;
          uint32_t v106 = 22;
LABEL_219:
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEBUG, v104, v131, v106);
          goto LABEL_229;
        }
        unsigned int v82 = mDNSLogCategory_XPC;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
          {
LABEL_214:
            uint64_t v103 = archive_error_string();
            *(_DWORD *)unint64_t v131 = 136446210;
            *(void *)&v131[4] = v103;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "archive_write_new fails: %{public}s", v131, 0xCu);
          }
        }
        else
        {
          unsigned int v82 = mDNSLogCategory_XPC_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_214;
          }
        }
LABEL_230:
        remove(&__str, v83);
        goto LABEL_231;
      }
      uint64_t v79 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_ERROR))
        {
LABEL_173:
          char v89 = __error();
          uint64_t v90 = strerror(*v89);
          *(_DWORD *)uint64_t v128 = 136446466;
          *(void *)uint64_t v129 = &__str;
          *(_WORD *)&v129[8] = 2082;
          uint64_t v130 = v90;
          long long v86 = "State Dump: file %{public}s cannot be opened, reason: %{public}s";
          int v87 = v79;
          uint32_t v88 = 22;
          goto LABEL_174;
        }
      }
      else
      {
        uint64_t v79 = mDNSLogCategory_Default_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_ERROR)) {
          goto LABEL_173;
        }
      }
LABEL_175:
      long long v91 = mDNSLogCategory_XPC;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0].st_dev) = 0;
          int v92 = "create_new_state_dump_file fails";
          goto LABEL_211;
        }
      }
      else
      {
        long long v91 = mDNSLogCategory_XPC_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0].st_dev) = 0;
          int v92 = "create_new_state_dump_file fails";
          goto LABEL_211;
        }
      }
      goto LABEL_212;
    }
    int v77 = v61;
    uint64_t v78 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        goto LABEL_175;
      }
    }
    else
    {
      uint64_t v78 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        goto LABEL_175;
      }
    }
    *(_DWORD *)uint64_t v128 = 67109376;
    *(_DWORD *)uint64_t v129 = v77;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = 1024;
    long long v86 = "State Dump: snprintf truncates the final string - minimal buffer size: %d, actual buffer size: %u";
    int v87 = v78;
    uint32_t v88 = 14;
LABEL_174:
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, v86, v128, v88);
    goto LABEL_175;
  }
  uint64_t v35 = v34;
  unsigned __int8 v121 = 0;
  __darwin_time_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    int v37 = readdir(v35);
    if (!v37) {
      break;
    }
    uint64_t v38 = v37;
    if (v37->d_namlen >= 0x19u)
    {
      d_name = v37->d_name;
      if (!strncmp(v37->d_name, "mDNSResponder_state_dump", 0x18uLL))
      {
        memset(buf, 0, 144);
        if ((snprintf((char *)&__str, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", v38->d_name)
                          - 1024) <= 0xFFFFFC00)
        {
          uint64_t v52 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }
          else
          {
            uint64_t v52 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }
          size_t v54 = strlen(d_name);
          v133.st_dev = 67109632;
          *(_DWORD *)&v133.st_mode = 1024;
          LOWORD(v133.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v133.st_ino + 2) = 30;
          HIWORD(v133.st_uid) = 2048;
          *(void *)&v133.st_gid = v54;
          int v55 = "snprintf truncates the final string - full name buffer length: %u, directory name length: %zu, file name length: %zu";
          long long v56 = v52;
          uint32_t v57 = 28;
LABEL_117:
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, v55, (uint8_t *)&v133, v57);
          break;
        }
        if (stat((const char *)&__str, buf))
        {
          uint64_t v53 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }
          else
          {
            uint64_t v53 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
              break;
            }
          }
          int v58 = __error();
          int v59 = strerror(*v58);
          v133.st_dev = 136446210;
          *(void *)&v133.st_mode = v59;
          int v55 = "State Dump: error when reading file properties - reason: %{public}s";
          long long v56 = v53;
          uint32_t v57 = 12;
          goto LABEL_117;
        }
        __darwin_time_t tv_sec = buf[0].st_birthtimespec.tv_sec;
        if (v36 <= buf[0].st_birthtimespec.tv_sec)
        {
LABEL_86:
          ++v121;
        }
        else
        {
          unsigned int d_namlen = v38->d_namlen;
          if (d_namlen <= 0x3FF)
          {
            uint64_t v43 = 0;
            while (1)
            {
              int v44 = d_name[v43];
              __s[v43] = v44;
              if (!v44) {
                break;
              }
              if (++v43 == 1023)
              {
                __s[1023] = 0;
                break;
              }
            }
            __darwin_time_t v36 = tv_sec;
            goto LABEL_86;
          }
          __darwin_time_t v118 = buf[0].st_birthtimespec.tv_sec;
          int v42 = mDNSLogCategory_XPC;
          if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
          {
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
              goto LABEL_80;
            }
          }
          else
          {
            int v42 = mDNSLogCategory_XPC_redacted;
            if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
              goto LABEL_80;
            }
          }
          v133.st_dev = 141558787;
          *(void *)&v133.st_mode = 1752392040;
          WORD2(v133.st_ino) = 2085;
          *(__darwin_ino64_t *)((char *)&v133.st_ino + 6) = (__darwin_ino64_t)d_name;
          HIWORD(v133.st_gid) = 1024;
          v133.st_rdev = d_namlen;
          *((_WORD *)&v133.st_rdev + 2) = 1024;
          *(dev_t *)((char *)&v133.st_rdev + 6) = 1024;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "State Dump: filename is too long to be put into the buffer, ignoring the current file - file name to be copied: %{sensitive, mask.hash}s, length: %u, buffer length: %u", (uint8_t *)&v133, 0x22u);
LABEL_80:
          __darwin_time_t v36 = v118;
        }
      }
    }
  }
  closedir(v35);
  bzero(buf, 0x400uLL);
  if (v121 < 5u) {
    goto LABEL_121;
  }
  if ((snprintf((char *)buf, 0x400uLL, "%s/%s", "/private/var/log/mDNSResponder", __s) - 1024) <= 0xFFFFFC00)
  {
    uint64_t v80 = mDNSLogCategory_XPC;
    if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
        goto LABEL_205;
      }
    }
    else
    {
      uint64_t v80 = mDNSLogCategory_XPC_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR)) {
        goto LABEL_205;
      }
    }
    size_t v97 = strlen(__s);
    v133.st_dev = 134218496;
    *(void *)&v133.st_mode = 1024;
    WORD2(v133.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v133.st_ino + 6) = 30;
    HIWORD(v133.st_gid) = 2048;
    *(void *)&v133.st_rdev = v97;
    int v98 = "State Dump: snprintf truncates the final string - buffer length: %zu, directory name length: %zu, old file name length: %zu";
    __int16 v99 = v80;
    uint32_t v100 = 32;
    goto LABEL_204;
  }
  if (!remove((const std::__fs::filesystem::path *)buf, v60)) {
    goto LABEL_121;
  }
  uint64_t v81 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_ERROR)) {
      goto LABEL_203;
    }
  }
  else
  {
    uint64_t v81 = mDNSLogCategory_XPC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_ERROR))
    {
LABEL_203:
      __int16 v101 = __error();
      int v102 = strerror(*v101);
      v133.st_dev = 136446466;
      *(void *)&v133.st_mode = buf;
      WORD2(v133.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v133.st_ino + 6) = (__darwin_ino64_t)v102;
      int v98 = "State Dump: file %{public}s cannot be deleted, reason: %{public}s";
      __int16 v99 = v81;
      uint32_t v100 = 22;
LABEL_204:
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, v98, (uint8_t *)&v133, v100);
    }
  }
LABEL_205:
  long long v91 = mDNSLogCategory_XPC;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_XPC == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0].st_dev) = 0;
      int v92 = "remove_state_dump_if_too_many fails";
LABEL_211:
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, v92, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    long long v91 = mDNSLogCategory_XPC_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_XPC_redacted, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0].st_dev) = 0;
      int v92 = "remove_state_dump_if_too_many fails";
      goto LABEL_211;
    }
  }
LABEL_212:
  int v29 = 255;
  int uint64 = v122;
LABEL_238:
  int v21 = v120;
LABEL_239:
  KQueueUnlock((uint64_t)"State Dump", v22, v23, v24, v25, v26, v27, v28);
  buf[0].st_ino = 0;
  *(void *)&buf[0].st_dev = 0;
  gettimeofday((timeval *)buf, 0);
  int v117 = timediff_ms((uint64_t *)&buf[0].st_dev, &v123.tv_sec);
  if (v29)
  {
    xpc_dictionary_set_string(v15, "ErrorDescription", "State dump fails");
    uint64_t v32 = 3;
  }
  else
  {
    xpc_dictionary_set_int64(v15, "mDNSResponderDumpTimeUsed", v117);
    if (uint64 != 3) {
      xpc_dictionary_set_string(v15, "mDNSResponderDumpFilePath", (const char *)&__str);
    }
    uint64_t v32 = 0;
  }
  close(v21);
LABEL_56:
  xpc_dictionary_set_uint64(v15, "DaemonReplyStatusToClient", v32);
  xpc_connection_send_message(remote_connection, v15);
  uint64_t v12 = v15;
LABEL_57:
  xpc_release(v12);
}

uint64_t timediff_ms(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (*a1 < *a2) {
    return -timediff_ms(a2, a1);
  }
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *((_DWORD *)a2 + 2);
  if (v2 == v3 && v4 < v5) {
    return -timediff_ms(a2, a1);
  }
  int v7 = v2 - v3;
  int v8 = v4 + 1000000;
  if (v4 >= v5) {
    int v8 = *((_DWORD *)a1 + 2);
  }
  return (v8 - v5) / 1000 + 1000 * (v7 - (v4 < v5));
}

void __mdns_trust_checks_init_block_invoke(id a1)
{
  xpc_object_t v1 = _mdns_trust_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Initializing Launch Services -- PENDING", v4, 2u);
  }

  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = dispatch_queue_create("com.apple.dnssd.trust.init", v2);

  dispatch_async(v3, &__block_literal_global_4);
}

id _mdns_trust_log()
{
  if (_mdns_trust_log_s_once != -1) {
    dispatch_once(&_mdns_trust_log_s_once, &__block_literal_global_15_7495);
  }
  uint64_t v0 = (void *)_mdns_trust_log_s_log;

  return v0;
}

void __mdns_trust_checks_init_block_invoke_2(id a1)
{
  xpc_object_t v1 = _mdns_trust_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Initializing Launch Services -- START", buf, 2u);
  }

  atomic_store(1u, g_is_initialized);
  uint64_t v2 = _mdns_trust_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Initializing Launch Services -- COMPLETE", v3, 2u);
  }
}

void ___mdns_trust_log_block_invoke(id a1)
{
  _mdns_trust_log_s_log = (uint64_t)os_log_create("com.apple.mdns", "trust");

  _objc_release_x1();
}

id _mdns_trust_checks_bundle_record_for_app(_OWORD *a1)
{
  uint64_t v5 = 0;
  long long v1 = a1[1];
  v4[0] = *a1;
  v4[1] = v1;
  uint64_t v2 = +[LSBundleRecord bundleRecordForAuditToken:v4 error:&v5];

  return v2;
}

uint64_t _mdns_trust_checks_app_is_local_network_allowed(void *a1)
{
  id v1 = a1;
  if (objc_opt_class())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v2 = +[NEPathController copyAggregatePathRules];
    id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v17;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v2);
          }
          int v7 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v6);
          int v8 = [v1 bundleIdentifier];
          if (v8)
          {
            size_t v9 = [v7 matchSigningIdentifier];
            unsigned int v10 = [v9 isEqualToString:v8];

            if (v10)
            {
              unsigned int v12 = [v7 denyMulticast];
              unsigned int v13 = [v7 multicastPreferenceSet];

              if (v13) {
                unsigned int v14 = 0;
              }
              else {
                unsigned int v14 = 2;
              }
              if (v12) {
                uint64_t v11 = v14;
              }
              else {
                uint64_t v11 = 1;
              }
              goto LABEL_19;
            }
          }

          uint64_t v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 1;
LABEL_19:
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __mdns_trust_checks_local_network_access_policy_update_block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  id v3 = _mdns_trust_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v4 > 2) {
      uint64_t v5 = "<INVALID STATE>";
    }
    else {
      uint64_t v5 = off_10014B860[v4];
    }
    uint64_t v6 = [*(id *)(a1 + 32) localizedShortName];
    int v8 = 136446466;
    size_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Local network alert policy status '%{public}s' for (%{public}@).", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __mdns_trust_checks_local_network_access_policy_update_block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t mdns_trust_checks_check(_OWORD *a1, int a2, unsigned __int8 *a3, unsigned __int8 *a4, int a5, char a6, int *a7)
{
  unsigned __int8 v8 = atomic_load(g_is_initialized);
  if (v8)
  {
    if (a2 != 2 || (a6 & 1) != 0) {
      goto LABEL_14;
    }
    memset(buf, 0, 256);
    if (AppendDNSNameString(buf, a3, v15, v16, v17, v18, v19, v20))
    {
      int v22 = buf[0];
      if (buf[0])
      {
        uint64_t v23 = 0;
        uint64_t v24 = buf;
        do
        {
          uint64_t v25 = v24;
          uint64_t v26 = v23;
          uint64_t v27 = &v24[v22];
          int v28 = v27[1];
          uint64_t v24 = v27 + 1;
          int v22 = v28;
          uint64_t v23 = v25;
        }
        while (v28);
        if (SameDomainNameBytes(v25, "\x05local")) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v26 = 0;
      }
      if ((a5 == 255 || a5 == 12) && IsLocalDomain(buf))
      {
LABEL_14:
        int v29 = _mdns_trust_checks_bundle_record_for_app(a1);
        unsigned int v30 = v29;
        if (!v29)
        {
          int v32 = 2;
          int is_local_network_allowed = 1;
          int v34 = 1;
          goto LABEL_27;
        }
        int v31 = v29;
        if ([v31 developerType] == 1
          || (char v126 = a3, [v31 developerType] == -1)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && ([v31 bundleIdentifier],
              uint64_t v35 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v36 = [v35 hasPrefix:@"com.apple."],
              v35,
              (v36 & 1) != 0))
        {
          int v32 = 2;
          int is_local_network_allowed = 1;
          goto LABEL_17;
        }

        int v37 = v31;
        uint64_t v38 = xpc_copy_entitlement_for_token();
        if (v38)
        {
          unsigned int v39 = (void *)v38;
          uint64_t v40 = _mdns_trust_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            size_t v41 = [v37 localizedShortName];
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "com.apple.developer.on-demand-install-capable";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&unsigned char buf[14] = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Entitlement '%{public}s' disallows request for (%{public}@)", buf, 0x16u);
          }
          int v32 = 0;
          int v34 = 0;
          int is_local_network_allowed = 1;
          int v31 = v37;
LABEL_25:

          goto LABEL_26;
        }

        size_t v54 = (void *)xpc_copy_entitlement_for_token();
        timeval v124 = v21;
        size_t v125 = a4;
        if (v54 == &_xpc_BOOL_true)
        {
          if (objc_opt_class())
          {
            *(void *)uint64_t v132 = 0;
            long long v56 = a1[1];
            *(_OWORD *)buf = *a1;
            *(_OWORD *)&uint8_t buf[16] = v56;
            unsigned __int8 v57 = +[DASession processAllowedWithAuditToken:buf error:v132];
            id v58 = *(id *)v132;
            if (v58)
            {
              int v59 = v58;
              unint64_t v60 = _system_util_log();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                int v122 = [v59 description];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v122;
                _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "DASession processAllowedWithAuditToken err %@", buf, 0xCu);
              }
            }
            if (v57)
            {

              int v32 = 4;
              int v21 = v124;
              goto LABEL_102;
            }
          }
          else
          {
            int v68 = _system_util_log();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "DASession.class not available", buf, 2u);
            }
          }
          int v69 = _mdns_trust_log();
          int v21 = v124;
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Media access not allowed with valid entitlment", buf, 2u);
          }
        }
        if (_os_feature_enabled_impl())
        {
          int v70 = v37;
          long long v71 = +[NSString stringWithUTF8String:"14.0"];
          uint64_t v72 = [v70 SDKVersion];

          id v73 = [v72 compare:v71 options:64];
          int v74 = v125;

          int v32 = 0;
          if (v125 && (unint64_t)v73 <= 1)
          {
            uint64_t v75 = (void *)xpc_copy_entitlement_for_token();

            unsigned __int8 v121 = v70;
            if (v75 == &_xpc_BOOL_true)
            {
              int v123 = 0;
              uint64_t v78 = 0;
              int v32 = 1;
              p_base_prots = &OS_mdns_trust__metaData.base_prots;
              [v70 bundleIdentifier];
            }
            else
            {
              int v117 = [v70 infoDictionary];
              int v76 = [v117 objectForKey:@"NSBonjourServices" ofClass:objc_opt_class()];
              uint64_t v119 = v70;
              id v77 = v76;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              long long v130 = 0u;
              uint64_t v78 = v77;
              id v79 = [v78 countByEnumeratingWithState:&v127 objects:v131 count:16];
              if (v79)
              {
                id v80 = v79;
                uint64_t v81 = *(void *)v128;
                while (2)
                {
                  for (unint64_t i = 0; i != v80; unint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v128 != v81) {
                      objc_enumerationMutation(v78);
                    }
                    long long v83 = (unsigned __int8 *)[*(id *)(*((void *)&v127 + 1) + 8 * i) UTF8String];
                    *(_OWORD *)uint64_t v132 = 0u;
                    memset(v133, 0, sizeof(v133));
                    memset(buf, 0, 256);
                    if (AppendDNSNameString(buf, v125, v84, v85, v86, v87, v88, v89))
                    {
                      v132[0] = 0;
                      if (AppendDNSNameString(v132, v83, v90, v91, v92, v93, v94, v95))
                      {
                        if (SameDomainNameBytes(buf, v132))
                        {
                          int v123 = 0;
                          int v96 = v78;
                          goto LABEL_110;
                        }
                      }
                    }
                  }
                  id v80 = [v78 countByEnumeratingWithState:&v127 objects:v131 count:16];
                  if (v80) {
                    continue;
                  }
                  break;
                }
              }

              int v96 = _mdns_trust_log();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
              {
                __int16 v115 = [v119 localizedShortName];
                *(_DWORD *)buf = 136446466;
                int v74 = v125;
                *(void *)&uint8_t buf[4] = v125;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&unsigned char buf[14] = v115;
                _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "App Info.plist(NSBonjourServices) does not allow '%{public}s' for (%{public}@)", buf, 0x16u);

                int v123 = 1;
              }
              else
              {
                int v123 = 1;
LABEL_110:
                int v74 = v125;
              }
              p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);

              int v32 = 0;
              [v121 bundleIdentifier];
            uint64_t v102 = };
            uint64_t v103 = v78;
            int v104 = &__NSArray0__struct;
            __darwin_time_t v118 = v103;
            if (v103) {
              int v104 = v103;
            }
            uint64_t v105 = p_base_prots[214];
            uint32_t v106 = v104;
            uint64_t v107 = [(__objc2_prot_list *)v105 stringWithUTF8String:v74];
            int v108 = @"<empty>";
            int v120 = (void *)v102;
            if (v102) {
              int v108 = (__CFString *)v102;
            }
            v109 = (void *)v107;
            uint64_t v110 = v108;
            uint64_t v111 = +[NSMutableDictionary dictionary];
            *(void *)uint64_t v132 = @"bundleID";
            *(void *)&v132[8] = @"entitlement";
            *(void *)buf = v110;
            *(void *)&uint8_t buf[8] = v116;
            uint64_t v112 = &__kCFBooleanFalse;
            if (!v123) {
              uint64_t v112 = &__kCFBooleanTrue;
            }
            *(void *)&v133[0] = @"allowed";
            *((void *)&v133[0] + 1) = @"services";
            *(void *)&uint8_t buf[16] = v112;
            *(void *)&unsigned char buf[24] = v106;
            *(void *)&v133[1] = @"service";
            *(void *)&uint8_t buf[32] = v109;
            __int16 v113 = +[NSDictionary dictionaryWithObjects:buf forKeys:v132 count:5];

            _flatten_metric_dictionary(v113, v111, &stru_10014BBD8);
            int v114 = _mdns_trust_log();
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)unint64_t v131 = 138412290;
              *(void *)&v131[4] = v111;
              _os_log_debug_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEBUG, "_mdns_trust_post_analytic flattenedDictionary %@\n", v131, 0xCu);
            }

            AnalyticsSendEvent();
            if (v123)
            {
              int v34 = 0;
              int is_local_network_allowed = 1;
              int v21 = v124;
              goto LABEL_27;
            }
            int v21 = v124;
LABEL_103:
            int v31 = v37;
            int is_local_network_allowed = _mdns_trust_checks_app_is_local_network_allowed(v31);
            if (is_local_network_allowed != 1)
            {
              int v37 = _mdns_trust_log();
              int v34 = 1;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                size_t v97 = off_10014B848[a2];
                if (v125) {
                  int v98 = v125;
                }
                else {
                  int v98 = v126;
                }
                __int16 v99 = off_10014B860[is_local_network_allowed];
                uint32_t v100 = [v31 localizedShortName];
                *(_DWORD *)buf = 136446979;
                *(void *)&uint8_t buf[4] = v97;
                *(_WORD *)&buf[12] = 2081;
                *(void *)&unsigned char buf[14] = v98;
                *(_WORD *)&buf[22] = 2082;
                *(void *)&unsigned char buf[24] = v99;
                int v21 = v124;
                *(_WORD *)&uint8_t buf[32] = 2114;
                *(void *)&buf[34] = v100;
                int v34 = 1;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Local network access to %{public}s(%{private}s) policy '%{public}s' for (%{public}@).", buf, 0x2Au);
              }
              goto LABEL_25;
            }
LABEL_17:
            int v34 = 1;
LABEL_26:

LABEL_27:
            goto LABEL_28;
          }
        }
        else
        {
          int v32 = 0;
        }
LABEL_102:

        goto LABEL_103;
      }
      if (v26 && (a5 == 255 || a5 == 12))
      {
        if (SameDomainNameBytes(v26, "\ain-addr\x04arpa"))
        {
          int v44 = 0;
          memset(v132, 0, sizeof(v132));
          uint64_t v45 = buf;
          uint64_t v46 = 1;
          *(_DWORD *)unint64_t v131 = 0;
          LODWORD(v127) = 0;
LABEL_40:
          v131[4 - v46] = 0;
          int v47 = *v45;
          if ((v47 - 4) >= 0xFFFFFFFD)
          {
            LOBYTE(v48) = 0;
            char v49 = 0;
            ++v45;
            while (1)
            {
              int v50 = *v45;
              if ((v50 - 58) < 0xFFFFFFF6) {
                break;
              }
              unsigned int v48 = v50 + 10 * v48 - 48;
              if (v48 > 0xFF) {
                break;
              }
              v131[4 - v46] = v48;
              if ((v49 & 1) == 0 && ++v44 > 4) {
                break;
              }
              ++v45;
              char v49 = 1;
              if (!--v47)
              {
                if (v46 != v44) {
                  break;
                }
                if (++v46 != 5) {
                  goto LABEL_40;
                }
                if (v44 == 4)
                {
                  LODWORD(v127) = *(_DWORD *)v131;
                  if (SameDomainNameBytes(v45, "\ain-addr\x04arpa"))
                  {
                    long long v51 = (uint8_t *)&v127;
                    int v52 = 2;
                    socklen_t v53 = 16;
                    goto LABEL_74;
                  }
                }
                break;
              }
            }
          }
        }
        else if (SameDomainNameBytes(v26, "\x03ip6\x04arpa"))
        {
          unsigned int v61 = 0;
          *(_OWORD *)uint64_t v132 = 0u;
          memset(v133, 0, 30);
          *(_OWORD *)unint64_t v131 = 0uLL;
          unsigned int v62 = buf;
          while (1)
          {
            int v63 = v62;
            if (*v62 != 1) {
              break;
            }
            int v64 = v62[1];
            if ((v64 - 48) >= 0xA)
            {
              if ((v64 - 97) >= 6)
              {
                if ((v64 - 65) > 5) {
                  break;
                }
                char v65 = -55;
              }
              else
              {
                char v65 = -87;
              }
            }
            else
            {
              char v65 = -48;
            }
            uint64_t v66 = 15 - (v61 >> 1);
            uint8_t v67 = v65 + v64;
            if (v61) {
              uint8_t v67 = v131[v66] | (16 * v67);
            }
            v131[v66] = v67;
            ++v61;
            unsigned int v62 = v63 + 2;
            if (v61 == 32)
            {
              if (SameDomainNameBytes(v63 + 2, "\x03ip6\x04arpa"))
              {
                long long v51 = v131;
                int v52 = 30;
                socklen_t v53 = 46;
LABEL_74:
                inet_ntop(v52, v51, v132, v53);
                if (_mdns_trust_checks_is_local_address(v132)) {
                  goto LABEL_14;
                }
              }
              break;
            }
          }
        }
      }
    }
    int v32 = 0;
    int is_local_network_allowed = 1;
    int v34 = 1;
LABEL_28:
    if (!a7) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  int v32 = 0;
  int is_local_network_allowed = 1;
  int v34 = 1;
  if (a7) {
LABEL_29:
  }
    *a7 = v32;
LABEL_30:
  unsigned int v42 = 2 * (is_local_network_allowed == 2);
  if (is_local_network_allowed == 1) {
    unsigned int v42 = 1;
  }
  if (v34) {
    return v42;
  }
  else {
    return 3;
  }
}

uint64_t _mdns_trust_checks_is_local_address(const char *a1)
{
  nw_endpoint_t host = nw_endpoint_create_host(a1, "0");
  uint64_t evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  id v3 = (void *)nw_path_evaluator_copy_path();
  uint64_t is_direct = nw_path_is_direct();

  return is_direct;
}

void _flatten_metric_dictionary(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  unsigned __int8 v8 = v7;
  if (v5 && v6)
  {
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v5;
        id v9 = v5;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id obj = [v9 allKeys];
        id v10 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v41;
          do
          {
            for (unint64_t i = 0; i != v11; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v41 != v12) {
                objc_enumerationMutation(obj);
              }
              unsigned int v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              uint64_t v15 = [v9 objectForKey:v14];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v16 = _mdns_trust_log();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v46 = v14;
                  __int16 v47 = 2112;
                  unsigned int v48 = v8;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Bad key %@ at path %@\n", buf, 0x16u);
                }
              }
              id v17 = [v8 length];
              id v18 = objc_alloc((Class)NSString);
              if (v17) {
                id v19 = [v18 initWithFormat:@"%@_%@", v8, v14];
              }
              else {
                id v19 = [v18 initWithFormat:@"%@", v14, v32];
              }
              uint64_t v20 = v19;
              _flatten_metric_dictionary(v15, v6, v19);
            }
            id v11 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v11);
        }

LABEL_35:
        id v5 = v33;
        goto LABEL_39;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v5;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id obja = v5;
        id v22 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = 0;
          uint64_t v25 = *(void *)v37;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v37 != v25) {
                objc_enumerationMutation(obja);
              }
              uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
              id v28 = [v8 length];
              id v29 = objc_alloc((Class)NSString);
              if (v28) {
                id v30 = [v29 initWithFormat:@"%@_%zu", v8, (char *)j + v24];
              }
              else {
                id v30 = [v29 initWithFormat:@"%zu", (char *)j + v24, v32];
              }
              int v31 = v30;
              _flatten_metric_dictionary(v27, v6, v30);
            }
            v24 += (uint64_t)j;
            id v23 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v23);
        }

        goto LABEL_35;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        [v6 setObject:v5 forKeyedSubscript:v8];
        goto LABEL_39;
      }
      int v21 = _mdns_trust_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v5;
        __int16 v47 = 2112;
        unsigned int v48 = v8;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Bad value %@ at path %@, ignoring\n", buf, 0x16u);
      }
    }
    else
    {
      int v21 = _mdns_trust_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot have nil path when flattening, skipping object: %@\n", buf, 0xCu);
      }
    }
  }
LABEL_39:
}

void _mdns_dso_server_endpoint_finalize(uint64_t a1)
{
  id v2 = *(void **)(a1 + 24);
  if (v2)
  {
    nw_release(v2);
    *(void *)(a1 + 24) = 0;
  }
}

void *_mdns_dso_server_endpoint_copy_description(void *a1, int a2)
{
  uint64_t v4 = (void *)mdns_string_builder_create();
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
    id v6 = 0;
  }
  else
  {
    description = (const char *)nw_endpoint_get_description();
    mdns_string_builder_append_formatted(v5, "[endpoint: %s", description);
    mdns_string_builder_append_formatted(v5, ", abort count: %zu", a1[4]);
    uint64_t v8 = a1[5];
    if (v8)
    {
      int64_t v9 = v8 - mach_continuous_time();
      if (v9 >= 1)
      {
        unint64_t v10 = mdns_ticks_to_milliseconds(v9);
        mdns_string_builder_append_formatted(v5, ", delayed retry in %llums", v10);
      }
    }
    mdns_string_builder_append_formatted(v5, "]");
    id v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

void _mdns_dso_server_endpoint_manager_finalize(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 24) = 0;
  }
}

const char *_mdns_dso_server_endpoint_manager_copy_description()
{
  return "<This is a DSO server endpoint manager object>";
}

uint64_t _mdns_dso_server_endpoint_is_usable_now(uint64_t a1, _DWORD *a2, int *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) >= 2uLL)
  {
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v7 = mach_continuous_time();
    if (mdns_mach_ticks_per_second_s_once != -1)
    {
      uint64_t v12 = v7;
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_3471);
      uint64_t v7 = v12;
    }
    uint64_t v6 = v7 + 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
    *(void *)(a1 + 40) = v6;
  }
  if (!v6)
  {
    uint64_t result = 1;
    int v9 = -1;
    if (a2) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_7:
  int64_t v8 = mach_continuous_time() - *(void *)(a1 + 40);
  if (v8 >= 0)
  {
    int v9 = 0;
    LODWORD(v6) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    uint64_t result = 1;
    if (!a2) {
      goto LABEL_17;
    }
LABEL_16:
    *a2 = v6;
    goto LABEL_17;
  }
  unint64_t v11 = mdns_ticks_to_milliseconds(-v8);
  uint64_t result = 0;
  int v9 = -1;
  if (v11 < 0xFFFFFFFF) {
    int v9 = v11;
  }
  if (HIDWORD(v11)) {
    LODWORD(v6) = -6737;
  }
  else {
    LODWORD(v6) = -6760;
  }
  if (a2) {
    goto LABEL_16;
  }
LABEL_17:
  if (a3) {
    *a3 = v9;
  }
  return result;
}

void ref_count_obj_release(void *a1)
{
  if ((*(_DWORD *)a1)-- == 1)
  {
    for (unint64_t i = (void *)a1[1]; i; unint64_t i = (void *)*i)
    {
      uint64_t v4 = (void (*)(void *))i[4];
      if (v4) {
        v4(a1);
      }
    }
    free(a1);
  }
}

uint64_t ref_count_obj_compare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == a2) {
    return 0;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6 == *(void **)(a2 + 8))
  {
    while (v6)
    {
      int64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v6[3];
      if (v8)
      {
        uint64_t result = v8(a1, a2, a3);
        if (result != 3) {
          return result;
        }
      }
      uint64_t v6 = (void *)*v6;
    }
    return 3;
  }
  else if (a3)
  {
    return 2;
  }
  else
  {
    return 3;
  }
}

uint64_t _cache_item_get_tracker_state(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    int DispositionRedactLogs = *(_DWORD *)(a1 + 32);
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 8);
    uint64_t AppInfo = NEHelperTrackerGetAppInfo();
    if (!AppInfo)
    {
      unsigned __int16 v9 = 0;
      *(void *)(a1 + 16) = 0;
      return v9;
    }
    uint64_t v4 = AppInfo;
    memset(v15, 0, sizeof(v15));
    uint64_t v5 = *(void *)(v2 + 128);
    uint64_t v6 = v15;
    if (v5) {
      uint64_t v6 = (_OWORD *)(v5 + 24);
    }
    long long v7 = v6[1];
    *(_OWORD *)atoken.val = *v6;
    *(_OWORD *)&atoken.val[4] = v7;
    NEHelperTrackerAppInfoSetAuditToken();
    if (!*(void *)(v2 + 128))
    {
      int v11 = *(_DWORD *)(v2 + 244);
      if (v11)
      {
        uint64_t v12 = *(void *)(v2 + 120);
        if (v12)
        {
          long long v13 = *(_OWORD *)(v12 + 40);
          *(_OWORD *)atoken.val = *(_OWORD *)(v12 + 24);
          *(_OWORD *)&atoken.val[4] = v13;
          pid_t v14 = audit_token_to_pid(&atoken);
          int v11 = *(_DWORD *)(v2 + 244);
        }
        else
        {
          pid_t v14 = 0;
        }
        if (v14 != v11) {
          NEHelperTrackerAppInfoSetPID();
        }
      }
      else
      {
        if (_create_tracker_app_info_s_once != -1) {
          dispatch_once(&_create_tracker_app_info_s_once, &__block_literal_global_7613);
        }
        *(_OWORD *)atoken.val = *(_OWORD *)(v2 + 656);
        NEHelperTrackerAppInfoSetUUID();
      }
    }
    if (*(unsigned char *)(v2 + 653)) {
      NEHelperTrackerAppInfoSetIsBrowser();
    }
    *(void *)(a1 + 16) = v4;
    int DispositionRedactLogs = NEHelperTrackerGetDispositionRedactLogs();
    *(_DWORD *)(a1 + 32) = DispositionRedactLogs;
  }
  if (DispositionRedactLogs) {
    return 2;
  }
  else {
    return 1;
  }
}

void ___create_tracker_app_info_block_invoke(id a1)
{
}

uint64_t resolved_cache_get_tracker_state(uint64_t a1, uint64_t *a2, uint64_t *a3, BOOL *a4, unsigned char *a5)
{
  if (!&_NEHelperTrackerGetAppInfo) {
    return 0;
  }
  unsigned __int16 v9 = &s_head_0;
  do
  {
    unsigned __int16 v9 = (uint64_t *)*v9;
    if (!v9) {
      return 0;
    }
  }
  while (v9[1] != a1);
  uint64_t result = _cache_item_get_tracker_state((uint64_t)v9);
  if (result == 2)
  {
    if (a4) {
      *a4 = *((_DWORD *)v9 + 8) == 3;
    }
    if (a2) {
      *a2 = NEHelperTrackerContextGetDomain();
    }
    if (a3) {
      *a3 = NEHelperTrackerContextGetDomainOwner();
    }
    if (a5) {
      *a5 = NEHelperTrackerContextCanBlockRequest();
    }
    return 2;
  }
  return result;
}

void _cache_item_report(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 48)))
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v2 = *(void *)(a1 + 8);
      memset(v16, 0, sizeof(v16));
      uint64_t v3 = *(void *)(v2 + 120);
      uint64_t v4 = *(void *)(v2 + 128);
      if (v3) {
        uint64_t v5 = (_OWORD *)(v3 + 24);
      }
      else {
        uint64_t v5 = v16;
      }
      if (v4)
      {
        uint64_t v6 = (_OWORD *)(v4 + 24);
        CFArrayRef v7 = *(const __CFArray **)(a1 + 40);
        CFArrayRef v8 = *(const __CFArray **)(a1 + 48);
        BOOL v9 = *(unsigned char *)(v2 + 653) != 0;
        int v10 = *(_DWORD *)(v2 + 252);
        int v11 = v5;
        int v12 = 0;
        long long v13 = 0;
      }
      else
      {
        int v12 = *(_DWORD *)(v2 + 244);
        if (v12)
        {
          if (v3)
          {
            long long v14 = *(_OWORD *)(v3 + 40);
            *(_OWORD *)atoken.val = *(_OWORD *)(v3 + 24);
            *(_OWORD *)&atoken.val[4] = v14;
            LODWORD(v3) = audit_token_to_pid(&atoken);
            int v12 = *(_DWORD *)(v2 + 244);
          }
          CFArrayRef v7 = *(const __CFArray **)(a1 + 40);
          CFArrayRef v8 = *(const __CFArray **)(a1 + 48);
          int v10 = *(_DWORD *)(v2 + 252);
          BOOL v15 = v3 == v12 || v12 == 0;
          BOOL v9 = *(unsigned __int8 *)(v2 + 653) != 0;
          int v11 = v5;
          if (v15) {
            int v12 = 0;
          }
          long long v13 = 0;
        }
        else
        {
          CFArrayRef v7 = *(const __CFArray **)(a1 + 40);
          CFArrayRef v8 = *(const __CFArray **)(a1 + 48);
          BOOL v9 = *(unsigned char *)(v2 + 653) != 0;
          int v10 = *(_DWORD *)(v2 + 252);
          long long v13 = (const unsigned __int8 *)(v2 + 656);
          int v11 = v5;
        }
        uint64_t v6 = 0;
      }
      _mdns_symptoms_report_resolved(v7, v8, v11, v9, v10, v12, v13, v6);
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 48));
  }
}

void resolved_cache_delete(uint64_t a1)
{
  if (&_NEHelperTrackerGetAppInfo || _os_feature_enabled_impl())
  {
    uint64_t v2 = &s_head_0;
    uint64_t v3 = &s_head_0;
    while (1)
    {
      uint64_t v3 = (uint64_t *)*v3;
      if (!v3) {
        break;
      }
      if (v3[1] == a1)
      {
        _cache_item_report((uint64_t)v3);
        for (unint64_t i = (uint64_t *)s_head_0; i != v3; unint64_t i = (uint64_t *)*i)
          uint64_t v2 = i;
        uint64_t *v2 = *v3;
        uint64_t v5 = (const void *)v3[5];
        if (v5)
        {
          CFRelease(v5);
          v3[5] = 0;
        }
        uint64_t v6 = (const void *)v3[6];
        if (v6)
        {
          CFRelease(v6);
          v3[6] = 0;
        }
        if (v3[2]) {
          NEHelperTrackerFreeAppInfo();
        }
        free(v3);
        return;
      }
    }
  }
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t CCDigest()
{
  return _CCDigest();
}

uint64_t CCDigestFinal()
{
  return _CCDigestFinal();
}

uint64_t CCDigestGetOutputSize()
{
  return _CCDigestGetOutputSize();
}

uint64_t CCDigestInit()
{
  return _CCDigestInit();
}

uint64_t CCDigestReset()
{
  return _CCDigestReset();
}

uint64_t CCDigestUpdate()
{
  return _CCDigestUpdate();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
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

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void *context)
{
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return _CFBagCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return _CFBagGetCount(theBag);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return _CFBagGetCountOfValue(theBag, value);
}

void CFBagGetValues(CFBagRef theBag, const void **values)
{
}

void CFBagRemoveAllValues(CFMutableBagRef theBag)
{
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreate(allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return _CFMachPortGetPort(port);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListWrite(propertyList, stream, format, options, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return _CFSetGetValue(theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return _CFSocketCreateRunLoopSource(allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return _CFSocketCreateWithNative(allocator, sock, callBackTypes, callout, context);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return _CFWriteStreamCopyProperty(stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return _CFWriteStreamCreateWithAllocatedBuffers(alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

uint64_t D2DInitialize()
{
  return _D2DInitialize();
}

uint64_t D2DRelease()
{
  return _D2DRelease();
}

uint64_t D2DRetain()
{
  return _D2DRetain();
}

uint64_t D2DStartAdvertisingPairOnTransport()
{
  return _D2DStartAdvertisingPairOnTransport();
}

uint64_t D2DStartBrowsingForKeyOnTransport()
{
  return _D2DStartBrowsingForKeyOnTransport();
}

uint64_t D2DStartResolvingPairOnTransport()
{
  return _D2DStartResolvingPairOnTransport();
}

uint64_t D2DStopAdvertisingPairOnTransport()
{
  return _D2DStopAdvertisingPairOnTransport();
}

uint64_t D2DStopBrowsingForKeyOnTransport()
{
  return _D2DStopBrowsingForKeyOnTransport();
}

uint64_t D2DStopResolvingPairOnTransport()
{
  return _D2DStopResolvingPairOnTransport();
}

uint64_t D2DTerminate()
{
  return _D2DTerminate();
}

CFDateRef DHCPInfoGetLeaseStartTime(CFDictionaryRef info)
{
  return _DHCPInfoGetLeaseStartTime(info);
}

CFDataRef DHCPInfoGetOptionData(CFDictionaryRef info, UInt8 code)
{
  return _DHCPInfoGetOptionData(info, code);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOCancelPowerChange(kernelPort, notificationID);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return _IOObjectGetClass(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return _IOPMCancelScheduledPowerEvent(time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return _IOPMCopyScheduledPowerEvents();
}

uint64_t IOPMRequestSysWake()
{
  return _IOPMRequestSysWake();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t NEHelperTrackerAddIPForAllFlowsRedactLogs()
{
  return _NEHelperTrackerAddIPForAllFlowsRedactLogs();
}

uint64_t NEHelperTrackerAppInfoSetAuditToken()
{
  return _NEHelperTrackerAppInfoSetAuditToken();
}

uint64_t NEHelperTrackerAppInfoSetIsBrowser()
{
  return _NEHelperTrackerAppInfoSetIsBrowser();
}

uint64_t NEHelperTrackerAppInfoSetPID()
{
  return _NEHelperTrackerAppInfoSetPID();
}

uint64_t NEHelperTrackerAppInfoSetUUID()
{
  return _NEHelperTrackerAppInfoSetUUID();
}

uint64_t NEHelperTrackerContextCanBlockRequest()
{
  return _NEHelperTrackerContextCanBlockRequest();
}

uint64_t NEHelperTrackerContextGetDomain()
{
  return _NEHelperTrackerContextGetDomain();
}

uint64_t NEHelperTrackerContextGetDomainOwner()
{
  return _NEHelperTrackerContextGetDomainOwner();
}

uint64_t NEHelperTrackerFreeAppInfo()
{
  return _NEHelperTrackerFreeAppInfo();
}

uint64_t NEHelperTrackerGetAppInfo()
{
  return _NEHelperTrackerGetAppInfo();
}

uint64_t NEHelperTrackerGetDispositionRedactLogs()
{
  return _NEHelperTrackerGetDispositionRedactLogs();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return _SCDynamicStoreCopyComputerName(store, nameEncoding);
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return _SCDynamicStoreCopyKeyList(store, pattern);
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return _SCDynamicStoreCopyLocalHostName(store);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return _SCDynamicStoreCreateRunLoopSource(allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
  return _SCDynamicStoreKeyCreateComputerName(allocator);
}

CFStringRef SCDynamicStoreKeyCreateHostNames(CFAllocatorRef allocator)
{
  return _SCDynamicStoreKeyCreateHostNames(allocator);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return _SCDynamicStoreKeyCreateNetworkInterface(allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return _SCDynamicStoreSetDisconnectCallBack();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetMultiple(SCDynamicStoreRef store, CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFArrayRef keysToNotify)
{
  return _SCDynamicStoreSetMultiple(store, keysToSet, keysToRemove, keysToNotify);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return _SCDynamicStoreSetValue(store, key, value);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

uint64_t SCNetworkReachabilityCreateWithOptions()
{
  return _SCNetworkReachabilityCreateWithOptions();
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return _SCPreferencesCreateWithAuthorization(allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef name, CFStringEncoding nameEncoding)
{
  return _SCPreferencesSetComputerName(prefs, name, nameEncoding);
}

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef name)
{
  return _SCPreferencesSetLocalHostName(prefs, name);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

uint64_t SecCertificateCopyDNSNames()
{
  return _SecCertificateCopyDNSNames();
}

uint64_t SecCertificateCopyIPAddresses()
{
  return _SecCertificateCopyIPAddresses();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return _SecIdentityGetTypeID();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return _SecKeyCreateRSAPublicKey();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return _SecKeyCreateWithData(keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return _SecTrustCopyCertificateChain(trust);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return _SecTrustCopyExceptions(trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return _SecTrustEvaluateAsyncWithError(trust, queue, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return _SecTrustSetAnchorCertificates(trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return _SecTrustSetAnchorCertificatesOnly(trust, anchorCertificatesOnly);
}

BOOL SecTrustSetExceptions(SecTrustRef trust, CFDataRef exceptions)
{
  return _SecTrustSetExceptions(trust, exceptions);
}

OSStatus SecTrustSetNetworkFetchAllowed(SecTrustRef trust, Boolean allowFetch)
{
  return _SecTrustSetNetworkFetchAllowed(trust, allowFetch);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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
  return __os_object_alloc();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_write_add_filter_bzip2()
{
  return _archive_write_add_filter_bzip2();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_filename()
{
  return _archive_write_open_filename();
}

uint64_t archive_write_set_format_ustar()
{
  return _archive_write_set_format_ustar();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return _audit_token_to_asid(atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return _audit_token_to_auid(atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return _audit_token_to_egid(atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return _audit_token_to_euid(atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return _audit_token_to_pidversion(atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return _audit_token_to_rgid(atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return _audit_token_to_ruid(atoken);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return _ccaes_gcm_decrypt_mode();
}

uint64_t ccgcm_one_shot()
{
  return _ccgcm_one_shot();
}

uint64_t cchkdf_expand()
{
  return _cchkdf_expand();
}

uint64_t cchkdf_extract()
{
  return _cchkdf_extract();
}

uint64_t cchpke_initiator_encrypt()
{
  return _cchpke_initiator_encrypt();
}

uint64_t cchpke_initiator_export()
{
  return _cchpke_initiator_export();
}

uint64_t cchpke_initiator_setup()
{
  return _cchpke_initiator_setup();
}

uint64_t cchpke_params_sizeof_aead_key()
{
  return _cchpke_params_sizeof_aead_key();
}

uint64_t cchpke_params_sizeof_aead_nonce()
{
  return _cchpke_params_sizeof_aead_nonce();
}

uint64_t cchpke_params_sizeof_aead_tag()
{
  return _cchpke_params_sizeof_aead_tag();
}

uint64_t cchpke_params_sizeof_kdf_hash()
{
  return _cchpke_params_sizeof_kdf_hash();
}

uint64_t cchpke_params_sizeof_kem_enc()
{
  return _cchpke_params_sizeof_kem_enc();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return _cchpke_params_x25519_AESGCM128_HKDF_SHA256();
}

uint64_t ccrng()
{
  return _ccrng();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return _dispatch_data_apply(data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return _dispatch_data_create_concat(data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return _dispatch_data_create_map(data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return _dispatch_data_get_size(data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
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
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t dns_configuration_copy()
{
  return _dns_configuration_copy();
}

uint64_t dns_configuration_free()
{
  return _dns_configuration_free();
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return _inet_aton(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return _launch_activate_socket(name, fds, cnt);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_approximate_time(void)
{
  return _mach_continuous_approximate_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_good_size(size_t size)
{
  return _malloc_good_size(size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint64_t ne_session_set_socket_attributes()
{
  return _ne_session_set_socket_attributes();
}

uint64_t necp_client_action()
{
  return _necp_client_action();
}

uint64_t necp_open()
{
  return _necp_open();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return _nw_activity_activate();
}

uint64_t nw_activity_complete_with_reason()
{
  return _nw_activity_complete_with_reason();
}

uint64_t nw_activity_create()
{
  return _nw_activity_create();
}

uint64_t nw_array_append()
{
  return _nw_array_append();
}

uint64_t nw_array_apply()
{
  return _nw_array_apply();
}

uint64_t nw_array_contains_object()
{
  return _nw_array_contains_object();
}

uint64_t nw_array_create()
{
  return _nw_array_create();
}

uint64_t nw_array_get_count()
{
  return _nw_array_get_count();
}

uint64_t nw_array_remove_object()
{
  return _nw_array_remove_object();
}

void nw_connection_access_establishment_report(nw_connection_t connection, dispatch_queue_t queue, nw_establishment_report_access_block_t access_block)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_local_endpoint()
{
  return _nw_connection_copy_connected_local_endpoint();
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return _nw_connection_copy_connected_remote_endpoint();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return _nw_connection_copy_current_path(connection);
}

char *__cdecl nw_connection_copy_description(nw_connection_t connection)
{
  return _nw_connection_copy_description(connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return _nw_connection_copy_endpoint(connection);
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return _nw_connection_copy_parameters(connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return _nw_connection_create(endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return _nw_connection_end_activity();
}

void nw_connection_force_cancel(nw_connection_t connection)
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
  return _nw_connection_set_event_handler();
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
  return _nw_connection_start_activity();
}

uint64_t nw_connection_state_to_string()
{
  return _nw_connection_state_to_string();
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return _nw_content_context_copy_protocol_metadata(context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return _nw_content_context_create(context_identifier);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return _nw_content_context_get_is_final(context);
}

void nw_content_context_set_is_final(nw_content_context_t context, BOOL is_final)
{
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
}

uint64_t nw_endpoint_copy_interface()
{
  return _nw_endpoint_copy_interface();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return _nw_endpoint_create_address(address);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return _nw_endpoint_create_host(hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return _nw_endpoint_create_host_with_numeric_port();
}

uint64_t nw_endpoint_create_srv()
{
  return _nw_endpoint_create_srv();
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return _nw_endpoint_create_url(url);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_address(endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return _nw_endpoint_get_description();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_hostname(endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_port(endpoint);
}

uint64_t nw_endpoint_get_priority()
{
  return _nw_endpoint_get_priority();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_url(endpoint);
}

uint64_t nw_endpoint_get_url_path()
{
  return _nw_endpoint_get_url_path();
}

uint64_t nw_endpoint_get_url_scheme()
{
  return _nw_endpoint_get_url_scheme();
}

uint64_t nw_endpoint_get_weight()
{
  return _nw_endpoint_get_weight();
}

uint64_t nw_endpoint_set_interface()
{
  return _nw_endpoint_set_interface();
}

uint64_t nw_endpoint_set_parent_endpoint()
{
  return _nw_endpoint_set_parent_endpoint();
}

int nw_error_get_error_code(nw_error_t error)
{
  return _nw_error_get_error_code(error);
}

void nw_establishment_report_enumerate_resolution_reports(nw_establishment_report_t report, nw_report_resolution_report_enumerator_t enumerate_block)
{
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return _nw_framer_create_definition(identifier, flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return _nw_framer_create_options(framer_definition);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return _nw_framer_deliver_input_no_copy(framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return _nw_framer_message_create(framer);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return _nw_framer_parse_input(framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
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
  return _nw_framer_write_output_no_copy(framer, output_length);
}

uint64_t nw_http_create_metadata_for_request()
{
  return _nw_http_create_metadata_for_request();
}

uint64_t nw_http_fields_access_value_by_name()
{
  return _nw_http_fields_access_value_by_name();
}

uint64_t nw_http_fields_create()
{
  return _nw_http_fields_create();
}

uint64_t nw_http_fields_set_value_by_name()
{
  return _nw_http_fields_set_value_by_name();
}

uint64_t nw_http_metadata_copy_response()
{
  return _nw_http_metadata_copy_response();
}

uint64_t nw_http_oblivious_config_is_valid()
{
  return _nw_http_oblivious_config_is_valid();
}

uint64_t nw_http_request_create_from_url()
{
  return _nw_http_request_create_from_url();
}

uint64_t nw_http_request_set_header_fields()
{
  return _nw_http_request_set_header_fields();
}

uint64_t nw_http_response_copy_header_fields()
{
  return _nw_http_response_copy_header_fields();
}

uint64_t nw_http_response_get_status_code()
{
  return _nw_http_response_get_status_code();
}

uint64_t nw_interface_create_with_index()
{
  return _nw_interface_create_with_index();
}

uint64_t nw_interface_create_with_name()
{
  return _nw_interface_create_with_name();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return _nw_interface_get_index(interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return _nw_interface_get_name(interface);
}

uint64_t nw_nat64_copy_prefixes_from_ipv4only_records()
{
  return _nw_nat64_copy_prefixes_from_ipv4only_records();
}

uint64_t nw_nat64_extract_v4()
{
  return _nw_nat64_extract_v4();
}

uint64_t nw_nat64_synthesize_v6()
{
  return _nw_nat64_synthesize_v6();
}

uint64_t nw_oblivious_http_create_options()
{
  return _nw_oblivious_http_create_options();
}

uint64_t nw_parameters_add_custom_proxy_config()
{
  return _nw_parameters_add_custom_proxy_config();
}

uint64_t nw_parameters_clear_custom_proxy_configs()
{
  return _nw_parameters_clear_custom_proxy_configs();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return _nw_parameters_copy(parameters);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return _nw_parameters_copy_default_protocol_stack(parameters);
}

uint64_t nw_parameters_copy_url_endpoint()
{
  return _nw_parameters_copy_url_endpoint();
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return _nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return _nw_parameters_create_secure_udp(configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_e_proc_uuid()
{
  return _nw_parameters_set_e_proc_uuid();
}

void nw_parameters_set_fast_open_enabled(nw_parameters_t parameters, BOOL fast_open_enabled)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return _nw_parameters_set_indefinite();
}

uint64_t nw_parameters_set_metadata()
{
  return _nw_parameters_set_metadata();
}

uint64_t nw_parameters_set_no_wake_from_sleep()
{
  return _nw_parameters_set_no_wake_from_sleep();
}

uint64_t nw_parameters_set_pid()
{
  return _nw_parameters_set_pid();
}

void nw_parameters_set_prefer_no_proxy(nw_parameters_t parameters, BOOL prefer_no_proxy)
{
}

uint64_t nw_parameters_set_source_application()
{
  return _nw_parameters_set_source_application();
}

uint64_t nw_parameters_set_uid()
{
  return _nw_parameters_set_uid();
}

uint64_t nw_parameters_set_url()
{
  return _nw_parameters_set_url();
}

uint64_t nw_path_copy_endpoint()
{
  return _nw_path_copy_endpoint();
}

uint64_t nw_path_copy_interface()
{
  return _nw_path_copy_interface();
}

uint64_t nw_path_copy_scoped_interface()
{
  return _nw_path_copy_scoped_interface();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

uint64_t nw_path_enumerate_resolver_configs()
{
  return _nw_path_enumerate_resolver_configs();
}

uint64_t nw_path_evaluator_cancel()
{
  return _nw_path_evaluator_cancel();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

uint64_t nw_path_evaluator_set_cancel_handler()
{
  return _nw_path_evaluator_set_cancel_handler();
}

uint64_t nw_path_evaluator_set_queue()
{
  return _nw_path_evaluator_set_queue();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return _nw_path_evaluator_set_update_handler();
}

uint64_t nw_path_evaluator_start()
{
  return _nw_path_evaluator_start();
}

uint64_t nw_path_get_flow_divert_unit()
{
  return _nw_path_get_flow_divert_unit();
}

uint64_t nw_path_get_interface_index()
{
  return _nw_path_get_interface_index();
}

uint64_t nw_path_get_reason()
{
  return _nw_path_get_reason();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return _nw_path_has_dns(path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return _nw_path_has_ipv4(path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return _nw_path_has_ipv6(path);
}

uint64_t nw_path_has_nat64_prefixes()
{
  return _nw_path_has_nat64_prefixes();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return _nw_path_is_constrained(path);
}

uint64_t nw_path_is_direct()
{
  return _nw_path_is_direct();
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return _nw_path_is_expensive(path);
}

uint64_t nw_path_is_per_app_vpn()
{
  return _nw_path_is_per_app_vpn();
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
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
  return _nw_protocol_copy_http_definition();
}

uint64_t nw_protocol_stack_append_application_protocol()
{
  return _nw_protocol_stack_append_application_protocol();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
}

nw_protocol_options_t nw_protocol_stack_copy_transport_protocol(nw_protocol_stack_t stack)
{
  return _nw_protocol_stack_copy_transport_protocol(stack);
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_proxy_config_set_prohibit_direct()
{
  return _nw_proxy_config_set_prohibit_direct();
}

void nw_release(void *obj)
{
}

uint64_t nw_resolution_report_enumerate_endpoints()
{
  return _nw_resolution_report_enumerate_endpoints();
}

uint64_t nw_resolver_cancel()
{
  return _nw_resolver_cancel();
}

uint64_t nw_resolver_config_cancel_updates()
{
  return _nw_resolver_config_cancel_updates();
}

uint64_t nw_resolver_config_copy_proxy_config()
{
  return _nw_resolver_config_copy_proxy_config();
}

uint64_t nw_resolver_config_create()
{
  return _nw_resolver_config_create();
}

uint64_t nw_resolver_config_create_with_dictionary()
{
  return _nw_resolver_config_create_with_dictionary();
}

uint64_t nw_resolver_config_enumerate_match_domains()
{
  return _nw_resolver_config_enumerate_match_domains();
}

uint64_t nw_resolver_config_enumerate_name_servers()
{
  return _nw_resolver_config_enumerate_name_servers();
}

uint64_t nw_resolver_config_get_allow_failover()
{
  return _nw_resolver_config_get_allow_failover();
}

uint64_t nw_resolver_config_get_class()
{
  return _nw_resolver_config_get_class();
}

uint64_t nw_resolver_config_get_identifier()
{
  return _nw_resolver_config_get_identifier();
}

uint64_t nw_resolver_config_get_identity_reference()
{
  return _nw_resolver_config_get_identity_reference();
}

uint64_t nw_resolver_config_get_interface_name()
{
  return _nw_resolver_config_get_interface_name();
}

uint64_t nw_resolver_config_get_odoh_config()
{
  return _nw_resolver_config_get_odoh_config();
}

uint64_t nw_resolver_config_get_protocol()
{
  return _nw_resolver_config_get_protocol();
}

uint64_t nw_resolver_config_get_provider_name()
{
  return _nw_resolver_config_get_provider_name();
}

uint64_t nw_resolver_config_get_provider_path()
{
  return _nw_resolver_config_get_provider_path();
}

uint64_t nw_resolver_config_get_proxy_agent()
{
  return _nw_resolver_config_get_proxy_agent();
}

uint64_t nw_resolver_config_report_error()
{
  return _nw_resolver_config_report_error();
}

uint64_t nw_resolver_config_set_class()
{
  return _nw_resolver_config_set_class();
}

uint64_t nw_resolver_config_set_identifier()
{
  return _nw_resolver_config_set_identifier();
}

uint64_t nw_resolver_config_set_interface_name()
{
  return _nw_resolver_config_set_interface_name();
}

uint64_t nw_resolver_config_set_odoh_config()
{
  return _nw_resolver_config_set_odoh_config();
}

uint64_t nw_resolver_config_set_protocol()
{
  return _nw_resolver_config_set_protocol();
}

uint64_t nw_resolver_config_set_provider_name()
{
  return _nw_resolver_config_set_provider_name();
}

uint64_t nw_resolver_config_set_provider_path()
{
  return _nw_resolver_config_set_provider_path();
}

uint64_t nw_resolver_config_set_proxy_agent()
{
  return _nw_resolver_config_set_proxy_agent();
}

uint64_t nw_resolver_config_watch_updates()
{
  return _nw_resolver_config_watch_updates();
}

uint64_t nw_resolver_create_srv_weighted_variant()
{
  return _nw_resolver_create_srv_weighted_variant();
}

uint64_t nw_resolver_create_with_endpoint()
{
  return _nw_resolver_create_with_endpoint();
}

uint64_t nw_resolver_set_cancel_handler()
{
  return _nw_resolver_set_cancel_handler();
}

uint64_t nw_resolver_set_update_handler()
{
  return _nw_resolver_set_update_handler();
}

void *__cdecl nw_retain(void *obj)
{
  return _nw_retain(obj);
}

uint64_t nw_settings_get_ddr_enabled()
{
  return _nw_settings_get_ddr_enabled();
}

uint64_t nw_tcp_options_get_maximum_segment_size()
{
  return _nw_tcp_options_get_maximum_segment_size();
}

void nw_tcp_options_set_maximum_segment_size(nw_protocol_options_t options, uint32_t maximum_segment_size)
{
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return _nw_tls_copy_sec_protocol_options(options);
}

uint64_t nwi_ifstate_get_flags()
{
  return _nwi_ifstate_get_flags();
}

uint64_t nwi_ifstate_get_signature()
{
  return _nwi_ifstate_get_signature();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return _nwi_ifstate_get_vpn_server();
}

uint64_t nwi_state_copy()
{
  return _nwi_state_copy();
}

uint64_t nwi_state_get_ifstate()
{
  return _nwi_state_get_ifstate();
}

uint64_t nwi_state_get_notify_key()
{
  return _nwi_state_get_notify_key();
}

uint64_t nwi_state_release()
{
  return _nwi_state_release();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return _os_retain(object);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return _recvmsg(a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

uint64_t sandbox_check()
{
  return _sandbox_check();
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return _sec_identity_create(identity);
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
  return _sec_trust_copy_ref(trust);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return _socketpair(a1, a2, a3, a4);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return _strcspn(__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t symptom_framework_init()
{
  return _symptom_framework_init();
}

uint64_t symptom_new()
{
  return _symptom_new();
}

uint64_t symptom_send()
{
  return _symptom_send();
}

uint64_t symptom_set_additional_qualifier()
{
  return _symptom_set_additional_qualifier();
}

uint64_t symptom_set_qualifier()
{
  return _symptom_set_qualifier();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return _uidna_nameToASCII_UTF8(idna, name, length, dest, capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return _uidna_openUTS46(options, pErrorCode);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return _xpc_array_get_data(xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uuid(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return _xpc_copy(object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
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

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return _xpc_fd_dup(xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

xpc_object_t xpc_string_create_with_format_and_arguments(const char *fmt, va_list ap)
{
  return _xpc_string_create_with_format_and_arguments(fmt, ap);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return _xpc_string_get_length(xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_DNSHeuristicsFailureStateInfo(void *a1, const char *a2, ...)
{
  return [a1 DNSHeuristicsFailureStateInfo];
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return [a1 SDKVersion];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return [a1 _createDispatchData];
}

id objc_msgSend__disableATS(void *a1, const char *a2, ...)
{
  return [a1 _disableATS];
}

id objc_msgSend__disableAppSSO(void *a1, const char *a2, ...)
{
  return [a1 _disableAppSSO];
}

id objc_msgSend__effectiveConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _effectiveConfiguration];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allInterfaces(void *a1, const char *a2, ...)
{
  return [a1 allInterfaces];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_apply(void *a1, const char *a2, ...)
{
  return [a1 apply];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assertPresence(void *a1, const char *a2, ...)
{
  return [a1 assertPresence];
}

id objc_msgSend_authRecords(void *a1, const char *a2, ...)
{
  return [a1 authRecords];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copyAggregatePathRules(void *a1, const char *a2, ...)
{
  return [a1 copyAggregatePathRules];
}

id objc_msgSend_copyEmptyHeuristicState(void *a1, const char *a2, ...)
{
  return [a1 copyEmptyHeuristicState];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 currentKnownNetworkProfile];
}

id objc_msgSend_currentTimeMs(void *a1, const char *a2, ...)
{
  return [a1 currentTimeMs];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return [a1 denyMulticast];
}

id objc_msgSend_describeAddr(void *a1, const char *a2, ...)
{
  return [a1 describeAddr];
}

id objc_msgSend_describeQHashes(void *a1, const char *a2, ...)
{
  return [a1 describeQHashes];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return [a1 developerType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_flowRemoteAddressEmpty(void *a1, const char *a2, ...)
{
  return [a1 flowRemoteAddressEmpty];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initFromPrivilegedProcess(void *a1, const char *a2, ...)
{
  return [a1 initFromPrivilegedProcess];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_isBlueAtlasNetwork(void *a1, const char *a2, ...)
{
  return [a1 isBlueAtlasNetwork];
}

id objc_msgSend_isCarPlay(void *a1, const char *a2, ...)
{
  return [a1 isCarPlay];
}

id objc_msgSend_isDNSHeuristicsFilteredNetwork(void *a1, const char *a2, ...)
{
  return [a1 isDNSHeuristicsFilteredNetwork];
}

id objc_msgSend_isSelfDevice(void *a1, const char *a2, ...)
{
  return [a1 isSelfDevice];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return [a1 localizedShortName];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return [a1 matchSigningIdentifier];
}

id objc_msgSend_multicastPreferenceSet(void *a1, const char *a2, ...)
{
  return [a1 multicastPreferenceSet];
}

id objc_msgSend_payloadDictionary(void *a1, const char *a2, ...)
{
  return [a1 payloadDictionary];
}

id objc_msgSend_presence(void *a1, const char *a2, ...)
{
  return [a1 presence];
}

id objc_msgSend_presencePayload(void *a1, const char *a2, ...)
{
  return [a1 presencePayload];
}

id objc_msgSend_presentDevices(void *a1, const char *a2, ...)
{
  return [a1 presentDevices];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_removeAllPolicies(void *a1, const char *a2, ...)
{
  return [a1 removeAllPolicies];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return [a1 sharedManagerForAllUsers];
}

id objc_msgSend_shortSSID(void *a1, const char *a2, ...)
{
  return [a1 shortSSID];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updatePresenseData(void *a1, const char *a2, ...)
{
  return [a1 updatePresenseData];
}