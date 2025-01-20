void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL OUTLINED_FUNCTION_5()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return _os_crash_msg();
}

BOOL bridge_version_parse(const char *a1, uint64_t a2)
{
  return sscanf(a1, "%u.%u.%u.%u.%u,%u", a2, a2 + 4, a2 + 8, a2 + 12, a2 + 16, a2 + 20) == 6;
}

uint64_t bridge_version_parse_components(const char *a1, const char *a2, _DWORD *a3)
{
  v5 = a3 + 3;
  v6 = a3 + 4;
  int v7 = sscanf(a1, "%u.%u.%u.%u.%u", a3, a3 + 1, a3 + 2, a3 + 3, a3 + 4);
  if (v7 != 5)
  {
    if (v7 != 4)
    {
      if (v7 != 3) {
        return 0;
      }
      _DWORD *v5 = 0;
    }
    _DWORD *v6 = 0;
  }
  __endptr = 0;
  unint64_t v8 = strtol(a2, &__endptr, 10);
  if (!__endptr) {
    return 0;
  }
  if (*__endptr || HIDWORD(v8) != 0) {
    return 0;
  }
  a3[5] = v8;
  return 1;
}

char *bridge_version_unparse(_DWORD *a1)
{
  v2 = 0;
  asprintf(&v2, "%u.%u.%u.%u.%u,%u", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  return v2;
}

uint64_t bridge_version_serialize(long long *a1, unsigned char *a2, uint64_t a3)
{
  *(unsigned char *)a3 = 1;
  *(unsigned char *)(a3 + 1) = *a2;
  *(unsigned char *)(a3 + 2) = a2[1];
  *(_DWORD *)(a3 + 24) = *((_DWORD *)a1 + 5);
  long long v3 = *a1;
  *(_DWORD *)(a3 + 20) = *((_DWORD *)a1 + 4);
  *(_OWORD *)(a3 + 4) = v3;
  return 1;
}

BOOL bridge_version_deserialize(unsigned __int8 *a1, uint64_t a2, unsigned char *a3)
{
  int v3 = *a1;
  if (v3 == 1)
  {
    long long v4 = *(_OWORD *)(a1 + 4);
    *(_DWORD *)(a2 + 16) = *((_DWORD *)a1 + 5);
    *(_OWORD *)a2 = v4;
    *(_DWORD *)(a2 + 20) = *((_DWORD *)a1 + 6);
    if (a3)
    {
      *a3 = a1[1];
      a3[1] = a1[2];
    }
  }
  return v3 == 1;
}

uint64_t bridge_version_compare(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 2)
  {
    int v3 = *(_DWORD *)(a2 + 20);
    if (v3 == 1) {
      return 0;
    }
    int v4 = *(_DWORD *)(a3 + 20);
    if (v4 == 1) {
      return 0;
    }
  }
  else if (a1 == 1)
  {
    int v3 = *(_DWORD *)(a2 + 20);
    if (v3 == 1) {
      return 2;
    }
    int v4 = *(_DWORD *)(a3 + 20);
    if (v4 == 1) {
      return 2;
    }
  }
  else
  {
    if (a1) {
      bridge_version_compare_cold_1();
    }
    int v3 = *(_DWORD *)(a2 + 20);
    int v4 = *(_DWORD *)(a3 + 20);
  }
  if (v3 != v4) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    unsigned int v6 = *(_DWORD *)(a2 + v5);
    unsigned int v7 = *(_DWORD *)(a3 + v5);
    if (v6 > v7) {
      break;
    }
    if (v6 < v7) {
      return 1;
    }
    v5 += 4;
    if (v5 == 20) {
      return 2;
    }
  }
  return 3;
}

uint64_t bridge_version_read_plist(const char *a1, _DWORD *a2, uint64_t a3)
{
  int v5 = open(a1, 0);
  if (v5 == -1)
  {
    unint64_t v8 = 0;
LABEL_21:
    uint64_t v14 = 0;
    goto LABEL_22;
  }
  int v6 = v5;
  v7.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v7.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v20.st_blksize = v7;
  *(timespec *)v20.st_qspare = v7;
  v20.st_birthtimespec = v7;
  *(timespec *)&v20.st_size = v7;
  v20.st_mtimespec = v7;
  v20.st_ctimespec = v7;
  *(timespec *)&v20.st_uid = v7;
  v20.st_atimespec = v7;
  *(timespec *)&v20.st_dev = v7;
  if (fstat(v5, &v20))
  {
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = malloc_type_malloc(v20.st_size, 0x9F49D29AuLL);
  ssize_t v10 = read(v6, v9, v20.st_size);
  if (v10 == v20.st_size)
  {
    uint64_t v11 = xpc_create_from_plist();
    unint64_t v8 = (void *)v11;
    if (!v11 || MEMORY[0x1E0196010](v11) == MEMORY[0x1E4F14590]) {
      goto LABEL_10;
    }
  }
  unint64_t v8 = 0;
LABEL_10:
  free(v9);
LABEL_11:
  close(v6);
  if (!v8) {
    goto LABEL_21;
  }
  string = xpc_dictionary_get_string(v8, "BridgeVersion");
  v13 = xpc_dictionary_get_string(v8, "BridgeBuildGroup");
  uint64_t v14 = 0;
  if (string)
  {
    if (v13)
    {
      uint64_t v14 = bridge_version_parse_components(string, v13, a2);
      if (a3)
      {
        *(_WORD *)a3 = 0;
        v15 = xpc_dictionary_get_dictionary(v8, "SEPEpoch");
        v16 = v15;
        if (v15)
        {
          int64_t int64 = xpc_dictionary_get_int64(v15, "Major");
          int64_t v18 = xpc_dictionary_get_int64(v16, "Minor");
          if ((unint64_t)(int64 - 1) <= 0xFE && v18 <= 255 && v18 >= 1)
          {
            *(unsigned char *)a3 = int64;
            *(unsigned char *)(a3 + 1) = v18;
          }
        }
      }
    }
  }
LABEL_22:

  return v14;
}

uint64_t bridge_version_read_current(_DWORD *a1, uint64_t a2)
{
  return bridge_version_read_plist("/System/Library/CoreServices/BridgeVersion.plist", a1, a2);
}

char *bridge_version_copy_current_string()
{
  memset(v2, 170, sizeof(v2));
  int plist = bridge_version_read_plist("/System/Library/CoreServices/BridgeVersion.plist", v2, 0);
  double result = 0;
  if (plist)
  {
    int v3 = 0;
    asprintf(&v3, "%u.%u.%u.%u.%u,%u", LODWORD(v2[0]), HIDWORD(v2[0]), LODWORD(v2[1]), HIDWORD(v2[1]), LODWORD(v2[2]), HIDWORD(v2[2]));
    return v3;
  }
  return result;
}

const char *remote_device_type_get_description(unsigned int a1)
{
  if (a1 > 0x10) {
    return "<unknown>";
  }
  else {
    return (const char *)remote_device_type_str[a1];
  }
}

uint64_t remote_device_type_is_trusted(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((a1 - 17) <= 0xFFFFFFEF) {
    remote_device_type_is_trusted_cold_1();
  }
  if ((a1 - 1) >= 0x10) {
    remote_device_type_is_trusted_cold_2(&v2, v3);
  }
  return (0x500Fu >> (a1 - 1)) & 1;
}

uint64_t remote_device_type_parse(char *__s2)
{
  uint64_t v2 = 1;
  while (strcmp((const char *)remote_device_type_str[v2], __s2))
  {
    if (++v2 == 17) {
      return 0;
    }
  }
  return v2;
}

const char *remote_device_state_get_description(int a1)
{
  if ((a1 - 1) > 2) {
    return "<unknown>";
  }
  else {
    return (const char *)remote_device_state_str[a1];
  }
}

uint64_t remote_device_get_type(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -1431655766;
  int v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_type_block_invoke;
  v7[3] = &unk_1E6C245F8;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AC1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id rsd_log()
{
  if (rsd_log_once != -1) {
    dispatch_once(&rsd_log_once, &__block_literal_global_362);
  }
  uint64_t v0 = (void *)rsd_log__log;
  return v0;
}

BOOL remote_device_xpc_remote_connection_tls_enabled(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v2 = [v1 dq];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __remote_device_xpc_remote_connection_tls_enabled_block_invoke;
  v9[3] = &unk_1E6C245F8;
  uint64_t v11 = &v12;
  int v3 = v1;
  id v10 = v3;
  dispatch_sync(v2, v9);

  id v4 = rsd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v3[1];
    if (*((unsigned char *)v13 + 24)) {
      int v6 = "";
    }
    else {
      int v6 = " not";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v17 = v5;
    __int16 v18 = 2080;
    v19 = v6;
    _os_log_impl(&dword_1DB9AA000, v4, OS_LOG_TYPE_INFO, "%{public}s> RemoteXPC is%s encrypted", buf, 0x16u);
  }

  BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_1DB9AC3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

sec_identity_t remote_device_copy_xpc_remote_connection_tls_identity(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (__SecIdentity *)local_device_copy_identity();
  sec_identity_t v3 = sec_identity_create(v2);
  if (v2) {
    CFRelease(v2);
  }

  return v3;
}

void sub_1DB9AC444(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void remote_device_authenticate(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  int v6 = a2;
  id v7 = a3;
  if (!v5) {
    remote_device_get_type_cold_1();
  }
  if (!v6) {
    remote_device_authenticate_cold_2();
  }
  id v8 = (void (**)(void, void))v7;
  if (!v7) {
    remote_device_authenticate_cold_3();
  }
  _remote_device_crash_if_not_connected(v5);
  uint64_t v9 = sec_trust_copy_ref(v6);
  CFArrayRef v10 = SecTrustCopyCertificateChain(v9);
  if (!v10)
  {
    uint64_t v11 = rsd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      remote_device_authenticate_cold_5();
    }

    v8[2](v8, 0);
  }
  uint64_t v12 = [(__CFArray *)v10 lastObject];
  if (!v12)
  {
    int v13 = rsd_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      remote_device_authenticate_cold_4();
    }

    v8[2](v8, 0);
  }
  CFDataRef v14 = SecCertificateCopyData(v12);
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "cmd", "authenticate_device");
  BytePtr = CFDataGetBytePtr(v14);
  size_t Length = CFDataGetLength(v14);
  xpc_dictionary_set_data(v15, "identity_cert", BytePtr, Length);
  __int16 v18 = [v5 connection];
  v19 = [v5 dq];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __remote_device_authenticate_block_invoke;
  v22[3] = &unk_1E6C24698;
  uint64_t v20 = v8;
  id v24 = v20;
  id v21 = v5;
  id v23 = v21;
  xpc_connection_send_message_with_reply(v18, v15, v19, v22);

  if (v14) {
    CFRelease(v14);
  }
  if (v12) {
    CFRelease(v12);
  }

  if (v9) {
    CFRelease(v9);
  }
}

void sub_1DB9AC6D8(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DB9ACBEC(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_1DB9AD028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id remoted_queue()
{
  if (remoted_queue_once != -1) {
    dispatch_once(&remoted_queue_once, &__block_literal_global_366);
  }
  uint64_t v0 = (void *)remoted_queue_queue;
  return v0;
}

id remote_service_copy_properties(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_service_copy_properties_cold_1();
  }
  uint64_t v2 = v1;
  id v3 = v1[2];

  return v3;
}

uint64_t remote_service_copy_property(void *a1, const char *a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  id v4 = v3;
  id v5 = (void *)*((void *)v3 + 2);
  if (v5)
  {
    uint64_t v6 = xpc_dictionary_get_value(v5, a2);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t remote_service_get_name(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

int64_t remote_service_get_version(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_service_copy_properties_cold_1();
  }
  uint64_t v2 = v1;
  id v3 = (void *)*((void *)v1 + 2);
  if (v3) {
    int64_t int64 = xpc_dictionary_get_int64(v3, "ServiceVersion");
  }
  else {
    int64_t int64 = 0;
  }

  return int64;
}

BOOL remote_service_should_encrypt_socket_data(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_service_copy_properties_cold_1();
  }
  uint64_t v2 = v1;
  BOOL v3 = _remote_device_supports_encrypting_socket_data(v1[4])
    && _remote_service_properties_should_encrypt_socket_data(v2[2])
    && remote_device_xpc_remote_connection_tls_enabled(v2[4]);

  return v3;
}

BOOL _remote_device_supports_encrypting_socket_data(void *a1)
{
  id v1 = a1;
  BOOL v2 = remote_device_xpc_remote_connection_tls_enabled(v1)
    && (unint64_t)objc_msgSend(v1, "messaging_protocol_version") > 4;

  return v2;
}

BOOL _remote_service_properties_should_encrypt_socket_data(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (!v1)
  {
    id v4 = 0;
    id v7 = 0;
LABEL_9:
    BOOL v8 = 1;
    goto LABEL_10;
  }
  uint64_t v3 = xpc_dictionary_get_value(v1, "EncryptSocketData");
  id v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x1E4F14570];
  if (v3 && MEMORY[0x1E0196010](v3) == v5 && !xpc_BOOL_get_value(v4))
  {
    BOOL v8 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = xpc_dictionary_get_value(v2, "UsesRemoteXPC");
  id v7 = (void *)v6;
  if (!v6 || MEMORY[0x1E0196010](v6) != v5) {
    goto LABEL_9;
  }
  BOOL v8 = !xpc_BOOL_get_value(v7);
LABEL_10:

LABEL_11:
  return v8;
}

BOOL remote_service_xpc_remote_connection_tls_enabled(uint64_t a1)
{
  return remote_device_xpc_remote_connection_tls_enabled(*(void **)(a1 + 32));
}

uint64_t remote_service_get_xpc_remote_connection_version_flags(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_service_copy_properties_cold_1();
  }
  BOOL v2 = v1;
  uint64_t v3 = (void *)*((void *)v1 + 4);
  if (!v3) {
    remote_service_get_xpc_remote_connection_version_flags_cold_2(&v6, v7);
  }
  uint64_t xpc_remote_connection_version_flags = remote_device_get_xpc_remote_connection_version_flags(v3);

  return xpc_remote_connection_version_flags;
}

uint64_t remote_device_get_xpc_remote_connection_version_flags(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  BOOL v2 = v1;
  id v3 = remote_device_copy_property(v1, (uint64_t)"RemoteXPCVersionFlags");
  id v4 = v3;
  if (v3 && MEMORY[0x1E0196010](v3) == MEMORY[0x1E4F145F8])
  {
    uint64_t value = xpc_uint64_get_value(v4);
  }
  else
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      remote_device_get_xpc_remote_connection_version_flags_cold_2();
    }

    uint64_t value = 0;
  }

  return value;
}

id remote_service_copy_device(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_service_copy_properties_cold_1();
  }
  BOOL v2 = v1;
  id v3 = (void *)*((void *)v1 + 4);
  if (!v3) {
    remote_service_get_xpc_remote_connection_version_flags_cold_2(&v6, v7);
  }
  id v4 = v3;

  return v4;
}

uint64_t remote_device_get_xpc_remote_connection_mode_flags(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  BOOL v2 = v1;
  int type = remote_device_get_type(v1);
  if (type == 13 || type == 10) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL remote_service_supports_feature(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  id v4 = v3;
  uint64_t v5 = (void *)*((void *)v3 + 2);
  if (v5)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v6 = xpc_dictionary_get_value(v5, "Features");
    id v7 = (void *)v6;
    if (v6 && MEMORY[0x1E0196010](v6) == MEMORY[0x1E4F14568])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __remote_service_supports_feature_block_invoke;
      v10[3] = &unk_1E6C245A8;
      v10[4] = &v11;
      v10[5] = a2;
      xpc_array_apply(v7, v10);
    }
    BOOL v8 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void sub_1DB9AD738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_service_supports_feature_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145F0])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    uint64_t v5 = 1;
    if (!strcmp(string_ptr, *(const char **)(a1 + 40)))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t remote_service_set_connect_timeout(void *a1, int a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  v3[10] = a2;

  return 0;
}

uint64_t remote_service_set_keepalive(void *a1, BOOL a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  id v4 = v3;
  xpc_object_t v5 = xpc_BOOL_create(a2);
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  return 0;
}

uint64_t remote_service_set_keepalive_time(void *a1, int a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  v3[14] = a2;

  return 0;
}

uint64_t remote_service_set_keepcount(void *a1, int a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  v3[15] = a2;

  return 0;
}

uint64_t remote_service_set_keepinterval(void *a1, int a2)
{
  id v3 = a1;
  if (!v3) {
    remote_service_copy_properties_cold_1();
  }
  v3[16] = a2;

  return 0;
}

uint64_t remote_service_create_connected_socket(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_service_copy_properties_cold_1();
  }
  BOOL v2 = v1;
  if (!v1[3]) {
    remote_service_create_connected_socket_cold_2(&v5, v6);
  }
  uint64_t connected_socket_impl = _remote_service_create_connected_socket_impl(v1, 1);

  return connected_socket_impl;
}

uint64_t _remote_service_create_connected_socket_impl(void *a1, int a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = -1;
  id v4 = remoted_queue();
  dispatch_assert_queue_not_V2(v4);

  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "connect");
  xpc_dictionary_set_uint64(v5, "connect_timeout", *((unsigned int *)v3 + 10));
  xpc_connection_t v6 = v3[6];
  if (v6) {
    xpc_dictionary_set_value(v5, "keepalive", v6);
  }
  xpc_dictionary_set_uint64(v5, "keepalive_time", *((unsigned int *)v3 + 14));
  xpc_dictionary_set_uint64(v5, "keepcount", *((unsigned int *)v3 + 15));
  xpc_dictionary_set_uint64(v5, "keepinterval", *((unsigned int *)v3 + 16));
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v3[3], v5);
  BOOL v8 = v7;
  if (v7 && MEMORY[0x1E0196010](v7) != MEMORY[0x1E4F145A8])
  {
    int v9 = xpc_dictionary_dup_fd(v8, "fd");
    *((_DWORD *)v35 + 6) = v9;
  }
  int v10 = *((_DWORD *)v35 + 6);
  if (v10 == -1)
  {
    uint64_t v23 = 0xFFFFFFFFLL;
  }
  else
  {
    id v11 = rsd_log();
    int v12 = remote_socket_poll_connect_sync(v10, v11);

    if (v12)
    {
      if (close(*((_DWORD *)v35 + 6)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      uint64_t v13 = v35;
      *((_DWORD *)v35 + 6) = -1;
      if (a2)
      {
        char v14 = rsd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB9AA000, v14, OS_LOG_TYPE_DEFAULT, "socket connection failed, heartbeat remote device and try again", buf, 2u);
        }

        dispatch_queue_t v15 = dispatch_queue_create("remote client heartbeat", 0);
        dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
        uint64_t v17 = v15;
        if (!v17)
        {
          uint64_t v33 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          int v38 = 134217984;
          uint64_t v39 = 0;
          _os_log_send_and_compose_impl();
          uint64_t v27 = _os_crash_msg();
          _remote_service_create_connected_socket_impl_cold_1(v27);
        }
        __int16 v18 = v17;

        v19 = v16;
        if (!v19)
        {
          uint64_t v33 = 0;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          int v38 = 134217984;
          uint64_t v39 = 0;
          _os_log_send_and_compose_impl();
          uint64_t v28 = _os_crash_msg();
          _remote_service_create_connected_socket_impl_cold_1(v28);
        }
        uint64_t v20 = v19;

        xpc_connection_t v21 = v3[4];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = ___remote_service_create_connected_socket_impl_block_invoke;
        v29[3] = &unk_1E6C24840;
        v32 = &v34;
        v30 = v3;
        v22 = v20;
        v31 = v22;
        remote_device_heartbeat(v21, v18, v29);
        dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

        uint64_t v13 = v35;
      }
    }
    else
    {
      BOOL should_encrypt_socket_data = remote_service_should_encrypt_socket_data(v3);
      uint64_t v13 = v35;
      if (should_encrypt_socket_data)
      {
        int v25 = [(xpc_connection_t *)v3 proxySocketOverRemoteXPC:*((unsigned int *)v35 + 6)];
        uint64_t v13 = v35;
        *((_DWORD *)v35 + 6) = v25;
      }
    }
    uint64_t v23 = *((unsigned int *)v13 + 6);
  }

  _Block_object_dispose(&v34, 8);
  return v23;
}

void sub_1DB9ADDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void remote_service_connect_socket(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t v7 = a1;
  id v5 = a2;
  id v6 = a3;
  if (!v7) {
    remote_service_copy_properties_cold_1();
  }
  if (!v7[3]) {
    remote_service_create_connected_socket_cold_2(&v8, v9);
  }
  _remote_service_connect_socket_impl(v7, v5, v6, 1);
}

void _remote_service_connect_socket_impl(void *a1, void *a2, void *a3, char a4)
{
  xpc_object_t v7 = a1;
  id v8 = a2;
  id v9 = a3;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "cmd", "connect");
  xpc_dictionary_set_uint64(v10, "connect_timeout", *((unsigned int *)v7 + 10));
  id v11 = v7[6];
  if (v11) {
    xpc_dictionary_set_value(v10, "keepalive", v11);
  }
  xpc_dictionary_set_uint64(v10, "keepalive_time", *((unsigned int *)v7 + 14));
  xpc_dictionary_set_uint64(v10, "keepcount", *((unsigned int *)v7 + 15));
  xpc_dictionary_set_uint64(v10, "keepinterval", *((unsigned int *)v7 + 16));
  int v12 = rsd_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    _remote_service_connect_socket_impl_cold_1();
  }

  uint64_t v13 = v7[3];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___remote_service_connect_socket_impl_block_invoke;
  v17[3] = &unk_1E6C248B8;
  char v21 = a4;
  id v18 = v8;
  v19 = v7;
  id v20 = v9;
  id v14 = v9;
  dispatch_queue_t v15 = v7;
  dispatch_semaphore_t v16 = v8;
  xpc_connection_send_message_with_reply(v13, v10, v16, v17);
}

void remote_device_copy_uuid(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  id v4 = v3;
  id v5 = [v3 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_uuid_block_invoke;
  v7[3] = &unk_1E6C245D0;
  id v8 = v4;
  uint64_t v9 = a2;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __remote_device_copy_uuid_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  id v3 = *(unsigned __int8 **)(a1 + 40);
  if (v2)
  {
    id v4 = (const unsigned __int8 *)[*(id *)(a1 + 32) uuid];
    uuid_copy(v3, v4);
  }
  else
  {
    id v5 = *(unsigned __int8 **)(a1 + 40);
    uuid_clear(v5);
  }
}

uint64_t __remote_device_get_type_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t remote_device_get_name(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  id v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_name_block_invoke;
  v7[3] = &unk_1E6C245F8;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AE61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_name_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

id remote_device_copy_properties(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_properties_block_invoke;
  v7[3] = &unk_1E6C245F8;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_1DB9AE760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __remote_device_copy_properties_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) properties];
  return MEMORY[0x1F41817F8]();
}

id remote_device_copy_property(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  id v4 = v3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_semaphore_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [v3 dq];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_device_copy_property_block_invoke;
  block[3] = &unk_1E6C24620;
  id v10 = v4;
  id v11 = &v13;
  uint64_t v12 = a2;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void sub_1DB9AE8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_property_block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) properties];
  uint64_t v2 = xpc_dictionary_get_value(v5, *(const char **)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t remote_device_copy_product_type(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_product_type_block_invoke;
  v7[3] = &unk_1E6C24648;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AEA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_product_type_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) properties];
  string = xpc_dictionary_get_string(v2, "ProductType");

  if (string) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = strdup(string);
  }
}

uint64_t remote_device_copy_os_version(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_os_version_block_invoke;
  v7[3] = &unk_1E6C24648;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AEBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_os_version_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) properties];
  string = xpc_dictionary_get_string(v2, "OSVersion");

  if (string) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = strdup(string);
  }
}

uint64_t remote_device_copy_os_build(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_os_build_block_invoke;
  v7[3] = &unk_1E6C24648;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AED24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_os_build_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) properties];
  string = xpc_dictionary_get_string(v2, "BuildVersion");

  if (string) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = strdup(string);
  }
}

uint64_t remote_device_copy_bridge_version_string(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_bridge_version_string_block_invoke;
  v7[3] = &unk_1E6C24648;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AEE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_bridge_version_string_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) properties];
  string = xpc_dictionary_get_string(v2, "BridgeVersion");

  if (string) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = strdup(string);
  }
}

BOOL remote_device_get_bridge_version(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  id v4 = v3;
  uint64_t v5 = (const char *)remote_device_copy_bridge_version_string(v3);
  if (v5)
  {
    id v6 = (char *)v5;
    BOOL v7 = bridge_version_parse(v5, a2);
    free(v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t remote_device_copy_boot_session_uuid(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  if (!a2) {
    remote_device_copy_boot_session_uuid_cold_2();
  }
  id v4 = v3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [v3 dq];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_device_copy_boot_session_uuid_block_invoke;
  block[3] = &unk_1E6C24670;
  id v11 = &v13;
  uint64_t v12 = a2;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  uint64_t v7 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v7;
}

void sub_1DB9AF05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_boot_session_uuid_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) properties];
  uuid = xpc_dictionary_get_uuid(v2, "BootSessionUUID");

  id v4 = *(unsigned __int8 **)(a1 + 48);
  if (uuid)
  {
    uuid_copy(v4, uuid);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uuid_clear(v4);
  }
}

uint64_t remote_device_copy_build_version(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v3 = remote_device_copy_os_build(v1);

  return v3;
}

uint64_t remote_device_copy_internal_build(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  uint64_t v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = -86;
  uint64_t v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_internal_build_block_invoke;
  v7[3] = &unk_1E6C245F8;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AF224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_internal_build_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) properties];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(v2, "AppleInternal");
}

uint64_t remote_device_get_messaging_protocol_version(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  id v2 = [v1 dq];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __remote_device_get_messaging_protocol_version_block_invoke;
  v6[3] = &unk_1E6C245F8;
  id v7 = v1;
  id v8 = &v9;
  id v3 = v1;
  dispatch_sync(v2, v6);

  uint64_t v4 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_1DB9AF380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_messaging_protocol_version_block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "messaging_protocol_version");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL remote_device_get_connectable(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "get_connectable");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    id v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      remote_device_get_connectable_cold_2();
    }

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = xpc_dictionary_get_BOOL(v5, "result");
  }

  return v6;
}

int64_t remote_device_get_latest_connect_result(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "get_latest_connect_error");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    id v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      remote_device_get_latest_connect_result_cold_2();
    }

    int64_t int64 = 0;
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, "result");
  }

  return int64;
}

void _remote_device_crash_if_not_connected(void *a1)
{
  id v1 = a1;
  if (remote_device_get_state(v1) <= 1) {
    _remote_device_crash_if_not_connected_cold_1();
  }
}

void __remote_device_authenticate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    id v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __remote_device_authenticate_block_invoke_cold_1();
    }

    *__error() = 83;
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    xpc_object_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      int v9 = 136446210;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1DB9AA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_authenticate failed", (uint8_t *)&v9, 0xCu);
    }

LABEL_11:
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_12:
  v7();
}

uint64_t remote_device_copy_service_names(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  _remote_device_crash_if_not_connected(v1);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "list_services");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    id v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_service_names_cold_2();
    }

    uint64_t v6 = (uint64_t)xpc_array_create(0, 0);
  }
  else
  {
    uint64_t v6 = xpc_dictionary_get_value(v5, "services");
    if (!v6) {
      remote_device_copy_service_names_cold_3(&v9, v10);
    }
  }

  return v6;
}

uint64_t remote_device_copy_local_service_names(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  _remote_device_crash_if_not_connected(v1);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "list_local_services");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    id v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_local_service_names_cold_2();
    }

    uint64_t v6 = (uint64_t)xpc_array_create(0, 0);
  }
  else
  {
    uint64_t v6 = xpc_dictionary_get_value(v5, "services");
    if (!v6) {
      remote_device_copy_service_names_cold_3(&v9, v10);
    }
  }

  return v6;
}

OS_remote_service *remote_device_copy_service(void *a1, const char *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  if (!v4) {
    remote_device_get_type_cold_1();
  }
  if (!a2) {
    remote_device_copy_service_cold_2();
  }
  xpc_object_t v5 = v4;
  _remote_device_crash_if_not_connected(v4);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "cmd", "get_service");
  xpc_dictionary_set_string(v6, "name", a2);
  id v7 = [v5 connection];
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v7, v6);

  if (MEMORY[0x1E0196010](v8) == MEMORY[0x1E4F145A8])
  {
    uint64_t v34 = rsd_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_service_cold_3();
    }

    uint64_t v11 = __error();
    unint64_t v12 = 0;
    int v13 = 83;
    goto LABEL_22;
  }
  string = xpc_dictionary_get_string(v8, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v10 = rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB9AA000, v10, OS_LOG_TYPE_DEFAULT, "remote_device_copy_service: service not found", buf, 2u);
    }

    uint64_t v11 = __error();
    unint64_t v12 = 0;
    int v13 = 3;
LABEL_22:
    *uint64_t v11 = v13;
    goto LABEL_23;
  }
  uint64_t v14 = xpc_dictionary_get_dictionary(v8, "service");
  if (!v14) {
    remote_device_copy_service_cold_4(&v36, buf);
  }
  uint64_t v15 = (void *)v14;
  id v16 = v5;
  id v17 = v15;
  if (MEMORY[0x1E0196010]() != MEMORY[0x1E4F14590]) {
    remote_device_copy_service_cold_9(&v36, buf);
  }
  unint64_t v12 = objc_alloc_init(OS_remote_service);
  id v18 = rsd_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    id v20 = (void *)xpc_copy_clean_description();
    char v21 = rsd_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      remote_device_copy_service_cold_8();
    }

    free(v20);
  }
  v22 = xpc_dictionary_get_string(v17, "name");
  if (!v22) {
    remote_device_copy_service_cold_5(&v36, buf);
  }
  v12->name = strdup(v22);
  objc_storeStrong((id *)&v12->device, a1);
  uint64_t v23 = xpc_dictionary_get_dictionary(v17, "properties");
  properties = v12->properties;
  v12->properties = (OS_xpc_object *)v23;

  xpc_dictionary_get_value(v17, "endpoint");
  int v25 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  if (!v25) {
    remote_device_copy_service_cold_6(&v36, buf);
  }
  v26 = v25;
  xpc_connection_t v27 = xpc_connection_create_from_endpoint(v25);
  if (!v27) {
    remote_device_copy_service_cold_7(&v36, buf);
  }
  uint64_t v28 = v27;
  v29 = remoted_queue();
  xpc_connection_set_target_queue(v28, v29);

  xpc_connection_set_event_handler(v28, &__block_literal_global_386);
  xpc_connection_activate(v28);
  connection = v12->connection;
  v12->connection = v28;
  v31 = v28;

  v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  proxies = v12->proxies;
  v12->proxies = v32;

LABEL_23:
  return v12;
}

uint64_t remote_device_check_service(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  if (!a2) {
    remote_device_copy_service_cold_2();
  }
  id v4 = v3;
  _remote_device_crash_if_not_connected(v3);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "check_service");
  xpc_dictionary_set_string(v5, "name", a2);
  xpc_object_t v6 = [v4 connection];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  if (MEMORY[0x1E0196010](v7) == MEMORY[0x1E4F145A8])
  {
    uint64_t v10 = rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      remote_device_check_service_cold_3();
    }

    uint64_t v9 = 0;
    *__error() = 83;
  }
  else
  {
    string = xpc_dictionary_get_string(v7, "result");
    if (string && !strcmp(string, "OK"))
    {
      uint64_t v11 = rsd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136446210;
        uint64_t v14 = a2;
        _os_log_impl(&dword_1DB9AA000, v11, OS_LOG_TYPE_DEFAULT, "remote_device_check_service: service %{public}s found", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t remote_device_get_state(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -1431655766;
  id v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_state_block_invoke;
  v7[3] = &unk_1E6C245F8;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9AFFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_state_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void remote_device_set_connected_callback(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5) {
    remote_device_get_type_cold_1();
  }
  id v8 = v7;
  if (!v7) {
    remote_device_set_connected_callback_cold_2();
  }
  uint64_t v9 = [v5 dq];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_device_set_connected_callback_block_invoke;
  block[3] = &unk_1E6C246E8;
  id v14 = v5;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v5;
  dispatch_sync(v9, block);
}

void __remote_device_set_connected_callback_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2
    || [*(id *)(a1 + 32) state] == 3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __remote_device_set_connected_callback_block_invoke_2;
    v4[3] = &unk_1E6C246C0;
    id v2 = *(NSObject **)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    dispatch_async(v2, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnected_callback:", *(void *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setConnected_callback_queue:", *(void *)(a1 + 40));
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "setConnected_callback_self_retain:", v3);
  }
}

uint64_t __remote_device_set_connected_callback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void remote_device_set_disconnected_callback(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5) {
    remote_device_get_type_cold_1();
  }
  id v8 = v7;
  if (!v7) {
    remote_device_set_connected_callback_cold_2();
  }
  uint64_t v9 = [v5 dq];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_device_set_disconnected_callback_block_invoke;
  block[3] = &unk_1E6C246E8;
  id v14 = v5;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v5;
  dispatch_sync(v9, block);
}

void __remote_device_set_disconnected_callback_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __remote_device_set_disconnected_callback_block_invoke_2;
    v4[3] = &unk_1E6C246C0;
    id v2 = *(NSObject **)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    dispatch_async(v2, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDisconnected_callback:", *(void *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setDisconnected_callback_queue:", *(void *)(a1 + 40));
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "setDisconnected_callback_self_retain:", v3);
  }
}

uint64_t __remote_device_set_disconnected_callback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void remote_device_cancel(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  id v3 = [v1 dq];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_device_cancel_block_invoke;
  block[3] = &unk_1E6C24558;
  id v6 = v2;
  id v4 = v2;
  dispatch_sync(v3, block);
}

void __remote_device_cancel_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) connection];
  xpc_connection_cancel(v1);
}

void remote_device_heartbeat(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5) {
    remote_device_get_type_cold_1();
  }
  id v8 = v7;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "cmd", "heartbeat");
  id v10 = [v5 connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __remote_device_heartbeat_block_invoke;
  handler[3] = &unk_1E6C24710;
  id v13 = v8;
  id v11 = v8;
  xpc_connection_send_message_with_reply(v10, v9, v6, handler);
}

void __remote_device_heartbeat_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    string = xpc_dictionary_get_string(xdict, "result");
    uint64_t v4 = *(void *)(a1 + 32);
    if (string) {
      BOOL v5 = strcmp(string, "OK") == 0;
    }
    else {
      BOOL v5 = 0;
    }
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v5);
  }
}

uint64_t remote_device_get_heartbeat_stats(void *a1, _OWORD *a2)
{
  id v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  uint64_t v4 = v3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "get_heartbeat_stats");
  id v6 = [v4 connection];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  if (MEMORY[0x1E0196010](v7) == MEMORY[0x1E4F145A8])
  {
    uint64_t v10 = 0;
  }
  else
  {
    size_t length = 0xAAAAAAAAAAAAAAAALL;
    data = (long long *)xpc_dictionary_get_data(v7, "heartbeat_stats", &length);
    if (data) {
      BOOL v9 = length == 48;
    }
    else {
      BOOL v9 = 0;
    }
    uint64_t v10 = v9;
    if (v9)
    {
      long long v11 = *data;
      long long v12 = data[2];
      a2[1] = data[1];
      a2[2] = v12;
      *a2 = v11;
    }
  }

  return v10;
}

uint64_t remote_device_timesync(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  _remote_device_crash_if_not_connected(v1);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "timesync");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    id v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      remote_device_timesync_cold_2();
    }
    int int64 = 35;
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v5, "result");
  if (string && strcmp(string, "OK"))
  {
    int int64 = xpc_dictionary_get_int64(v5, "error_code");
    id v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v2[1];
      int v12 = 136446466;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      int v15 = int64;
      _os_log_impl(&dword_1DB9AA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_timesync: %{errno}d", (uint8_t *)&v12, 0x12u);
    }
LABEL_11:

    uint64_t v10 = 0;
    *__error() = int64;
    goto LABEL_12;
  }
  uint64_t v10 = 1;
LABEL_12:

  return v10;
}

uint64_t remote_device_reset(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "reset");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    xpc_object_t v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      remote_device_reset_cold_2();
    }
    int v9 = 35;
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v5, "result");
  if (string && strcmp(string, "OK"))
  {
    xpc_object_t v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v2[1];
      int v12 = 136446210;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1DB9AA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_reset: client lacks privilege", (uint8_t *)&v12, 0xCu);
    }
    int v9 = 1;
LABEL_12:

    uint64_t v10 = 0;
    *__error() = v9;
    goto LABEL_13;
  }
  uint64_t v10 = 1;
LABEL_13:

  return v10;
}

uint64_t remote_device_disconnect(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "disconnect_device");
  uint64_t v4 = [v2 connection];
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1E0196010](v5) == MEMORY[0x1E4F145A8])
  {
    uint64_t v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      remote_device_disconnect_cold_2();
    }
    int int64 = 35;
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v5, "result");
  if (string && strcmp(string, "OK"))
  {
    int int64 = xpc_dictionary_get_int64(v5, "error_code");
    uint64_t v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v2[1];
      int v12 = 136446466;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      int v15 = int64;
      _os_log_impl(&dword_1DB9AA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_disconnect: %{errno}d", (uint8_t *)&v12, 0x12u);
    }
LABEL_11:

    uint64_t v10 = 0;
    *__error() = int64;
    goto LABEL_12;
  }
  uint64_t v10 = 1;
LABEL_12:

  return v10;
}

uint64_t remote_device_set_alias(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = a1;
  if (!v3) {
    remote_device_get_type_cold_1();
  }
  if (!a2) {
    remote_device_set_alias_cold_2();
  }
  uint64_t v4 = v3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "set_alias");
  xpc_dictionary_set_string(v5, "device_alias", a2);
  id v6 = [v4 connection];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  if (MEMORY[0x1E0196010](v7) == MEMORY[0x1E4F145A8])
  {
    uint64_t v11 = 0;
  }
  else
  {
    string = xpc_dictionary_get_string(v7, "result");
    if (!string || !strcmp(string, "OK"))
    {
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v9 = rsd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v4[1];
        int v13 = 136446210;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1DB9AA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_set_alias: client lacks privilege", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v11 = 0;
      *__error() = 1;
    }
  }

  return v11;
}

uint64_t remote_device_get_alias(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_get_type_cold_1();
  }
  id v2 = v1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v3 = [v1 dq];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_alias_block_invoke;
  v7[3] = &unk_1E6C245F8;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DB9B0F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_alias_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t local_device_copy_description()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, "cmd", "get_local_device_description");
  id v1 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(v1, v0);

  if (MEMORY[0x1E0196010](v2) == MEMORY[0x1E4F145A8])
  {
    id v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      local_device_copy_description_cold_1();
    }

    uint64_t v5 = 0;
    *__error() = 35;
  }
  else
  {
    string = xpc_dictionary_get_string(v2, "result");
    if (!string || !strcmp(string, "OK"))
    {
      uint64_t v5 = xpc_dictionary_get_dictionary(v2, "device");
      if (!v5) {
        local_device_copy_description_cold_2(&v8, buf);
      }
    }
    else
    {
      id v4 = rsd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB9AA000, v4, OS_LOG_TYPE_DEFAULT, "local_device_copy_description: failed", buf, 2u);
      }

      uint64_t v5 = 0;
    }
  }

  return v5;
}

id remoted_conn()
{
  if (remoted_conn_once != -1) {
    dispatch_once(&remoted_conn_once, &__block_literal_global_389);
  }
  xpc_object_t v0 = (void *)remoted_conn_conn;
  return v0;
}

uint64_t local_device_copy_identity()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v1 = empty;
  if (!empty)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    int v34 = 134217984;
    uint64_t v35 = 0;
    _os_log_send_and_compose_impl();
    uint64_t v25 = _os_crash_msg();
    _remote_service_create_connected_socket_impl_cold_1(v25);
  }
  xpc_dictionary_set_string(empty, "cmd", "get_local_device_identity");
  xpc_object_t v2 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);

  if (!v3)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    int v34 = 134217984;
    uint64_t v35 = 0;
    _os_log_send_and_compose_impl();
    uint64_t v26 = _os_crash_msg();
    _remote_service_create_connected_socket_impl_cold_1(v26);
  }
  if (MEMORY[0x1E0196010](v3) == MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_3();
    }
    goto LABEL_23;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_13();
    }
LABEL_23:
    SecCertificateRef v22 = 0;
    SecAccessControlRef v11 = 0;
    SecKeyRef v21 = 0;
    uint64_t v16 = 0;
    CFDictionaryRef v20 = 0;
    CFDataRef data = 0;
    xpc_object_t xdict = 0;
LABEL_24:
    uint64_t v12 = 0;
    xCFDataRef data = 0;
    goto LABEL_25;
  }
  id v6 = xpc_dictionary_get_dictionary(v3, "identity");
  xpc_object_t xdict = v6;
  if (!v6)
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_4();
    }
    goto LABEL_23;
  }
  xpc_dictionary_get_value(v6, "identity_cert");
  xCFDataRef data = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (!xdata)
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_5();
    }
    SecCertificateRef v22 = 0;
    SecAccessControlRef v11 = 0;
    SecKeyRef v21 = 0;
    uint64_t v16 = 0;
    CFDictionaryRef v20 = 0;
    CFDataRef data = 0;
    goto LABEL_24;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  CFDataRef data = (const __CFData *)[v7 initWithBytes:bytes_ptr length:xpc_data_get_length(xdata)];
  if (!data)
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_6();
    }
    SecCertificateRef v22 = 0;
    SecAccessControlRef v11 = 0;
    SecKeyRef v21 = 0;
    uint64_t v16 = 0;
    CFDictionaryRef v20 = 0;
    CFDataRef data = 0;
    goto LABEL_48;
  }
  SecCertificateRef v9 = SecCertificateCreateWithData(0, data);
  if (!v9)
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_7();
    }
    SecCertificateRef v22 = 0;
    goto LABEL_46;
  }
  SecCertificateRef v10 = v9;
  SecAccessControlRef v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B598], 0x40000000uLL, &error);
  SecCertificateRef v27 = v10;
  if (!v11)
  {
    uint64_t v5 = rsd_log();
    SecCertificateRef v22 = v10;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_8();
    }
LABEL_46:
    SecAccessControlRef v11 = 0;
LABEL_47:
    SecKeyRef v21 = 0;
    uint64_t v16 = 0;
    CFDictionaryRef v20 = 0;
LABEL_48:
    uint64_t v12 = 0;
    goto LABEL_25;
  }
  uint64_t v12 = xpc_dictionary_get_value(xdict, "identity_key");
  if (!v12)
  {
    uint64_t v5 = rsd_log();
    SecCertificateRef v22 = v10;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_9();
    }
    goto LABEL_47;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v14 = xpc_data_get_bytes_ptr(v12);
  uint64_t v15 = [v13 initWithBytes:v14 length:xpc_data_get_length(v12)];
  uint64_t v16 = (void *)v15;
  if (v15)
  {
    uint64_t v17 = *MEMORY[0x1E4F3B548];
    v32[0] = *MEMORY[0x1E4F3B8B0];
    v32[1] = v17;
    uint64_t v18 = *MEMORY[0x1E4F3B890];
    v32[2] = *MEMORY[0x1E4F3B6B0];
    v32[3] = v18;
    v33[0] = v15;
    v33[1] = v11;
    uint64_t v19 = *MEMORY[0x1E4F3B898];
    v33[2] = MEMORY[0x1E4F1CC28];
    v33[3] = v19;
    CFDictionaryRef v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
    SecKeyRef v21 = SecKeyCreateWithData((CFDataRef)[MEMORY[0x1E4F1C9B8] data], v20, &error);
    if (v21)
    {
      SecCertificateRef v22 = v27;
      uint64_t v23 = SecIdentityCreate();
      if (v23) {
        goto LABEL_26;
      }
      uint64_t v5 = rsd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        local_device_copy_identity_cold_12();
      }
    }
    else
    {
      uint64_t v5 = rsd_log();
      SecCertificateRef v22 = v27;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        local_device_copy_identity_cold_11();
      }
      SecKeyRef v21 = 0;
    }
  }
  else
  {
    uint64_t v5 = rsd_log();
    SecCertificateRef v22 = v27;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_copy_identity_cold_10();
    }
    SecKeyRef v21 = 0;
    uint64_t v16 = 0;
    CFDictionaryRef v20 = 0;
  }
LABEL_25:

  uint64_t v23 = 0;
LABEL_26:

  if (v21) {
    CFRelease(v21);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (error) {
    CFRelease(error);
  }
  return v23;
}

void sub_1DB9B185C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef a16)
{
  CFRelease(v16);
  CFRelease(v17);
  if (cf) {
    CFRelease(cf);
  }
  if (a16) {
    CFRelease(a16);
  }
  _Unwind_Resume(a1);
}

uint64_t local_device_delete_identity()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (!empty) {
    local_device_delete_identity_cold_1(&v8, v9);
  }
  id v1 = empty;
  xpc_dictionary_set_string(empty, "cmd", "delete_local_device_identity");
  xpc_object_t v2 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);

  if (!v3) {
    local_device_delete_identity_cold_2(&v8, v9);
  }
  if (MEMORY[0x1E0196010](v3) == MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_delete_identity_cold_3();
    }
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_delete_identity_cold_4();
    }
LABEL_11:

    uint64_t v6 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = 1;
LABEL_12:

  return v6;
}

uint64_t local_device_create_identity()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (!empty) {
    local_device_delete_identity_cold_1(&v8, v9);
  }
  id v1 = empty;
  xpc_dictionary_set_string(empty, "cmd", "create_local_device_identity");
  xpc_object_t v2 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v2, v1);

  if (!v3) {
    local_device_delete_identity_cold_2(&v8, v9);
  }
  if (MEMORY[0x1E0196010](v3) == MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_create_identity_cold_3();
    }
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      local_device_create_identity_cold_4();
    }
LABEL_11:

    uint64_t v6 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = 1;
LABEL_12:

  return v6;
}

uint64_t local_device_copy_service_names()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, "cmd", "list_local_device_services");
  id v1 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(v1, v0);

  if (MEMORY[0x1E0196010](v2) == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      local_device_copy_service_names_cold_1();
    }

    uint64_t v5 = 0;
    *__error() = 35;
  }
  else
  {
    string = xpc_dictionary_get_string(v2, "result");
    if (!string || !strcmp(string, "OK"))
    {
      uint64_t v5 = xpc_dictionary_get_array(v2, "services");
      if (!v5) {
        local_device_copy_service_names_cold_2(&v8, buf);
      }
    }
    else
    {
      id v4 = rsd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB9AA000, v4, OS_LOG_TYPE_DEFAULT, "local_device_copy_service_names: failed", buf, 2u);
      }

      uint64_t v5 = 0;
    }
  }

  return v5;
}

OS_remote_device *remote_device_copy_unique_of_type(unsigned int a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1 - 17 <= 0xFFFFFFEF) {
    remote_device_copy_unique_of_type_cold_1();
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "cmd", "get_unique_device");
  xpc_dictionary_set_uint64(v2, "device_type", a1);
  xpc_object_t v3 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v2);

  if (MEMORY[0x1E0196010](v4) == MEMORY[0x1E4F145A8])
  {
    uint64_t v12 = rsd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_unique_of_type_cold_2();
    }

    id v7 = __error();
    uint64_t v8 = 0;
    int v9 = 35;
    goto LABEL_13;
  }
  string = xpc_dictionary_get_string(v4, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB9AA000, v6, OS_LOG_TYPE_DEFAULT, "remote_device_copy_unique_of_type: device not found", buf, 2u);
    }

    id v7 = __error();
    uint64_t v8 = 0;
    int v9 = 3;
LABEL_13:
    *id v7 = v9;
    goto LABEL_14;
  }
  uint64_t v10 = xpc_dictionary_get_dictionary(v4, "device");
  if (!v10) {
    remote_device_copy_unique_of_type_cold_3(&v14, buf);
  }
  SecAccessControlRef v11 = v10;
  uint64_t v8 = remote_device_create_from_client_description(v10);

LABEL_14:
  return v8;
}

OS_remote_device *remote_device_create_from_client_description(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = rsd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    xpc_object_t v4 = (void *)xpc_copy_clean_description();
    uint64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      remote_device_create_from_client_description_cold_1();
    }

    free(v4);
  }
  uint64_t v6 = objc_alloc_init(OS_remote_device);
  remote_device_update_from_client_description(v6, v1);
  xpc_dictionary_get_value(v1, "endpoint");
  id v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = xpc_connection_create_from_endpoint(v7);
  int v9 = [(OS_remote_device *)v6 dq];
  xpc_connection_set_target_queue(v8, v9);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v6);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __remote_device_create_from_client_description_block_invoke;
  handler[3] = &unk_1E6C248E0;
  objc_copyWeak(&v22, &location);
  uint64_t v10 = v8;
  SecKeyRef v21 = v10;
  xpc_connection_set_event_handler(v10, handler);
  [(OS_remote_device *)v6 setConnection:v10];
  SecAccessControlRef v11 = [(OS_remote_device *)v6 dq];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_device_create_from_client_description_block_invoke_394;
  block[3] = &unk_1E6C24908;
  id v12 = v1;
  id v18 = v12;
  id v13 = v6;
  uint64_t v19 = v13;
  dispatch_sync(v11, block);

  xpc_connection_activate(v10);
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "cmd", "helo_device");
  xpc_dictionary_set_uint64(v14, "device_state", [(OS_remote_device *)v13 state]);
  xpc_connection_send_message(v10, v14);
  uint64_t v15 = v13;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v15;
}

void sub_1DB9B2148(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

OS_remote_device *remote_device_copy_device_with_name(const char *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "cmd", "get_device");
  xpc_dictionary_set_string(v2, "device_name", a1);
  BOOL v3 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v2);

  if (MEMORY[0x1E0196010](v4) == MEMORY[0x1E4F145A8])
  {
    id v12 = rsd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_device_with_name_cold_1();
    }

    id v7 = __error();
    uint64_t v8 = 0;
    int v9 = 35;
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v4, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB9AA000, v6, OS_LOG_TYPE_DEFAULT, "remote_device_copy_device_with_name: device not found", buf, 2u);
    }

    id v7 = __error();
    uint64_t v8 = 0;
    int v9 = 3;
LABEL_12:
    *id v7 = v9;
    goto LABEL_13;
  }
  uint64_t v10 = xpc_dictionary_get_dictionary(v4, "device");
  if (!v10) {
    remote_device_copy_unique_of_type_cold_3(&v14, buf);
  }
  SecAccessControlRef v11 = v10;
  uint64_t v8 = remote_device_create_from_client_description(v10);

LABEL_13:
  return v8;
}

OS_remote_device *remote_device_copy_device_with_uuid(const unsigned __int8 *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "cmd", "get_device");
  xpc_dictionary_set_uuid(v2, "UUID", a1);
  BOOL v3 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v2);

  if (MEMORY[0x1E0196010](v4) == MEMORY[0x1E4F145A8])
  {
    id v12 = rsd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_device_with_name_cold_1();
    }

    id v7 = __error();
    uint64_t v8 = 0;
    int v9 = 35;
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v4, "result");
  if (string && strcmp(string, "OK"))
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB9AA000, v6, OS_LOG_TYPE_DEFAULT, "remote_device_copy_device_with_uuid: device not found", buf, 2u);
    }

    id v7 = __error();
    uint64_t v8 = 0;
    int v9 = 3;
LABEL_12:
    *id v7 = v9;
    goto LABEL_13;
  }
  uint64_t v10 = xpc_dictionary_get_dictionary(v4, "device");
  if (!v10) {
    remote_device_copy_unique_of_type_cold_3(&v14, buf);
  }
  SecAccessControlRef v11 = v10;
  uint64_t v8 = remote_device_create_from_client_description(v10);

LABEL_13:
  return v8;
}

OS_remote_device *remote_device_copy_device_with_uuid_and_trust_level(const unsigned __int8 *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "cmd", "get_device");
  xpc_dictionary_set_uuid(v4, "UUID", a1);
  if (a2) {
    uint64_t v5 = "trusted";
  }
  else {
    uint64_t v5 = "untrusted";
  }
  xpc_dictionary_set_string(v4, "trust_level", v5);
  uint64_t v6 = (_xpc_connection_s *)remoted_conn();
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  if (MEMORY[0x1E0196010](v7) == MEMORY[0x1E4F145A8])
  {
    uint64_t v15 = rsd_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      remote_device_copy_device_with_name_cold_1();
    }

    uint64_t v10 = __error();
    SecAccessControlRef v11 = 0;
    int v12 = 35;
    goto LABEL_15;
  }
  string = xpc_dictionary_get_string(v7, "result");
  if (string && strcmp(string, "OK"))
  {
    int v9 = rsd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB9AA000, v9, OS_LOG_TYPE_DEFAULT, "remote_device_copy_device_with_uuid_and_trust_level: device not found", buf, 2u);
    }

    uint64_t v10 = __error();
    SecAccessControlRef v11 = 0;
    int v12 = 3;
LABEL_15:
    *uint64_t v10 = v12;
    goto LABEL_16;
  }
  id v13 = xpc_dictionary_get_dictionary(v7, "device");
  if (!v13) {
    remote_device_copy_unique_of_type_cold_3(&v17, buf);
  }
  uint64_t v14 = v13;
  SecAccessControlRef v11 = remote_device_create_from_client_description(v13);

LABEL_16:
  return v11;
}

void remote_device_browse_present(int a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  xpc_object_t v7 = objc_alloc_init(OS_remote_device_browser);
  _remote_device_start_browsing(v7, a1, v6, v5, 1);
}

void _remote_device_start_browsing(void *a1, int a2, void *a3, void *a4, int a5)
{
  LODWORD(v8) = a2;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  if (v8) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = 0xFFFFLL;
  }
  id v10 = a4;
  SecAccessControlRef v11 = a3;
  objc_msgSend(v9, "setDevice_type:", v8);
  [v9 setCallback:v10];

  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("remote device browse", 0, v11);
  [v9 setCbq:v12];

  id v13 = [v9 cbq];
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted", v13);
  [v9 setConnection:mach_service];

  uint64_t v15 = [v9 connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = ___remote_device_start_browsing_block_invoke;
  handler[3] = &unk_1E6C24530;
  id v16 = v9;
  id v24 = v16;
  xpc_connection_set_event_handler(v15, handler);

  uint64_t v17 = [v16 connection];
  xpc_connection_activate(v17);

  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v18, "cmd", "browse");
  xpc_dictionary_set_uint64(v18, "device_type", v8);
  if (a5) {
    xpc_dictionary_set_BOOL(v18, "present_only", 1);
  }
  uint64_t v19 = (void *)MEMORY[0x1E0195EA0](v18);
  CFDictionaryRef v20 = rsd_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = v19;
    _os_log_impl(&dword_1DB9AA000, v20, OS_LOG_TYPE_DEFAULT, "Starting browsing: %s", buf, 0xCu);
  }

  free(v19);
  SecKeyRef v21 = [v16 connection];
  id v22 = [v16 cbq];
  xpc_connection_send_message_with_reply(v21, v18, v22, &__block_literal_global_407);
}

OS_remote_device_browser *remote_device_start_browsing(int a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  xpc_object_t v7 = objc_alloc_init(OS_remote_device_browser);
  _remote_device_start_browsing(v7, a1, v6, v5, 0);

  return v7;
}

void remote_device_browser_cancel(void *a1)
{
  id v1 = a1;
  if (!v1) {
    remote_device_browser_cancel_cold_1();
  }
  xpc_object_t v2 = v1;
  BOOL v3 = rsd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v4 = 0;
    _os_log_impl(&dword_1DB9AA000, v3, OS_LOG_TYPE_DEFAULT, "Browsing stopped by client", v4, 2u);
  }

  _remote_device_browser_cancel(v2);
}

void _remote_device_browser_cancel(void *a1)
{
  id v1 = a1;
  if (([v1 canceling] & 1) == 0)
  {
    [v1 setCanceling:1];
    xpc_object_t v2 = [v1 connection];
    xpc_connection_cancel(v2);

    BOOL v3 = [v1 cbq];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___remote_device_browser_cancel_block_invoke;
    block[3] = &unk_1E6C24558;
    id v5 = v1;
    dispatch_async(v3, block);
  }
}

OS_remote_device_browser *remote_device_start_browsing_matching(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5) {
    remote_device_start_browsing_matching_cold_1();
  }
  uint64_t v8 = v7;
  id v9 = objc_alloc_init(OS_remote_device_browser);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __remote_device_start_browsing_matching_block_invoke;
  v16[3] = &unk_1E6C24760;
  id v18 = v5;
  id v19 = v8;
  id v17 = v6;
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = (void *)MEMORY[0x1E0195B90](v16);
  matching_int type = _remote_device_get_matching_type(v10);
  _remote_device_start_browsing(v9, matching_type, v11, v13, 0);

  return v9;
}

void __remote_device_start_browsing_matching_block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    if (v5) {
      __remote_device_start_browsing_matching_block_invoke_cold_1(&v12, v13);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __remote_device_start_browsing_matching_block_invoke_cold_2();
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __remote_device_start_browsing_matching_block_invoke_263;
    v9[3] = &unk_1E6C24738;
    uint64_t v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    remote_device_set_connected_callback(v6, v8, v9);
  }
}

void __remote_device_start_browsing_matching_block_invoke_263(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (remote_device_get_state(v3) == 2)
  {
    xpc_object_t v4 = *(void **)(a1 + 32);
    id v5 = v3;
    id v6 = v4;
    matching_int type = _remote_device_get_matching_type(v6);
    if (!matching_type || matching_type == remote_device_get_type(v5))
    {
      string = xpc_dictionary_get_string(v6, "AvailableService");
      if (!string)
      {
LABEL_17:

        uint64_t v15 = rsd_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __remote_device_start_browsing_matching_block_invoke_263_cold_1();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_20;
      }
      id v9 = string;
      id v10 = (void *)remote_device_copy_service_names(v5);
      if (xpc_array_get_count(v10))
      {
        size_t v11 = 0;
        while (1)
        {
          uint64_t v12 = xpc_array_get_string(v10, v11);
          if (!strcmp(v9, v12)) {
            break;
          }
          if (++v11 >= xpc_array_get_count(v10)) {
            goto LABEL_9;
          }
        }

        goto LABEL_17;
      }
LABEL_9:
    }
    id v13 = rsd_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __remote_device_start_browsing_matching_block_invoke_263_cold_2();
    }

    goto LABEL_20;
  }
  uint64_t v14 = rsd_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __remote_device_start_browsing_matching_block_invoke_263_cold_3();
  }

LABEL_20:
}

uint64_t _remote_device_get_matching_type(void *a1)
{
  string = xpc_dictionary_get_string(a1, "DeviceType");
  if (!string) {
    return 0;
  }
  xpc_object_t v2 = string;
  uint64_t v3 = 1;
  while (strcmp((const char *)remote_device_type_str[v3], v2))
  {
    if (++v3 == 17) {
      return 0;
    }
  }
  return v3;
}

void remote_service_listen_with_device(const char *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (_set_stream_handler_once != -1) {
    dispatch_once(&_set_stream_handler_once, &__block_literal_global);
  }
  id v7 = strdup(a1);
  uint64_t v8 = _listening_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __remote_service_listen_with_device_block_invoke_3;
  block[3] = &unk_1E6C247F0;
  id v13 = v6;
  uint64_t v14 = v7;
  id v12 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __remote_service_listen_with_device_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.RemoteServiceDiscovery.listener-demux", 0);
  id v1 = (void *)_listening_queue;
  _listening_queue = (uint64_t)v0;

  xpc_object_t v2 = _listening_queue;
  xpc_set_event_stream_handler("com.apple.remoted.service", v2, &__block_literal_global_289);
}

void __remote_service_listen_with_device_block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
  xpc_object_t v4 = _listening_service_find(string);
  if (v4)
  {
    id v5 = xpc_dictionary_get_value(xdict, "device");
    id v6 = remote_device_create_from_client_description(v5);
    uint64_t v7 = xpc_dictionary_dup_fd(xdict, "fd");
    _remote_service_accept(v4, v6, v7);
  }
  else
  {
    uint64_t v8 = objc_alloc_init(OS_remote_pending_event);
    objc_storeStrong((id *)&v8->event, a2);
    v8->service_name = strdup(string);
    objc_storeStrong((id *)&v8->next, (id)_pending_events);
    id v5 = (void *)_pending_events;
    _pending_events = (uint64_t)v8;
  }
}

id _listening_service_find(const char *a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)_listening_queue);
  id v2 = (id)_listening_services;
  if (v2)
  {
    do
    {
      if (!strcmp(*((const char **)v2 + 1), a1)) {
        break;
      }
      id v3 = *((id *)v2 + 6);

      id v2 = v3;
    }
    while (v3);
  }
  return v2;
}

void _remote_service_accept(void *a1, void *a2, uint64_t a3)
{
  location[10] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if ([v5 shouldEncryptSocketData] && _remote_device_supports_encrypting_socket_data(v6))
  {
    uint64_t v7 = [SocketRemoteXpcProxy alloc];
    uint64_t v8 = [(SocketRemoteXpcProxy *)v7 initWithSocket:a3 device:v6 queue:_listening_queue server:1];
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, v8);
    LODWORD(a3) = [(SocketRemoteXpcProxy *)v8 takeOwnershipOfClientSocket];
    if ((a3 & 0x80000000) != 0)
    {
      id v9 = rsd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[OS_remote_service proxySocketOverRemoteXPC:]();
      }
    }
    [*((id *)v5 + 5) addObject:v8];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___remote_service_accept_block_invoke;
    v18[3] = &unk_1E6C24580;
    id v19 = v5;
    objc_copyWeak(&v20, location);
    [(SocketRemoteXpcProxy *)v8 setOnCancel:v18];
    [(SocketRemoteXpcProxy *)v8 activate];
    objc_destroyWeak(&v20);

    objc_destroyWeak(location);
  }
  if (a3 == -1) {
    _remote_service_accept_cold_1(&v17, location);
  }
  id v10 = *((void *)v5 + 2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___remote_service_accept_block_invoke_410;
  block[3] = &unk_1E6C24930;
  id v14 = v5;
  id v15 = v6;
  int v16 = a3;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v10, block);
}

void sub_1DB9B3770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __remote_service_listen_with_device_block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (const char **)(a1 + 48);
  id v3 = (void *)xpc_copy_event();
  if (!v3)
  {
    xpc_object_t v4 = rsd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __remote_service_listen_with_device_block_invoke_3_cold_3();
    }
  }
  _listening_service_find(*v2);
  if (objc_claimAutoreleasedReturnValue()) {
    __remote_service_listen_with_device_block_invoke_3_cold_2(&v24, v25);
  }
  id v5 = objc_alloc_init(OS_remote_listening_service);
  v5->service_name = *(const char **)(a1 + 48);
  uint64_t v6 = MEMORY[0x1E0195B90](*(void *)(a1 + 40));
  id accept_block = v5->accept_block;
  v5->id accept_block = (id)v6;

  objc_storeStrong((id *)&v5->queue, *(id *)(a1 + 32));
  objc_storeStrong((id *)&v5->next, (id)_listening_services);
  uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  proxies = v5->proxies;
  v5->proxies = v8;

  objc_storeStrong((id *)&_listening_services, v5);
  if (v3)
  {
    uint64_t v10 = xpc_dictionary_get_value(v3, "ServiceProperties");
    properties = v5->properties;
    v5->properties = (OS_xpc_object *)v10;
  }
  if (v5->properties && MEMORY[0x1E0196010]() != MEMORY[0x1E4F14590]) {
    __remote_service_listen_with_device_block_invoke_3_cold_1(&v24, v25);
  }
  id v12 = *v2;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  SecKeyRef v21 = __remote_service_listen_with_device_block_invoke_295;
  id v22 = &unk_1E6C247C8;
  id v13 = v5;
  uint64_t v23 = v13;
  id v14 = v20;
  dispatch_assert_queue_V2((dispatch_queue_t)_listening_queue);
  id v15 = (id)_pending_events;
  if (v15)
  {
    int v16 = v15;
    uint64_t v17 = 0;
    do
    {
      if (!strcmp((const char *)v16[1], v12))
      {
        v21((uint64_t)v14, v16);
        if (v17) {
          id v18 = v17 + 3;
        }
        else {
          id v18 = (id *)&_pending_events;
        }
        objc_storeStrong(v18, (id)v16[3]);
      }
      id v19 = v16;

      int v16 = v19[3];
      uint64_t v17 = v19;
    }
    while (v16);
  }
}

void __remote_service_listen_with_device_block_invoke_295(uint64_t a1, void *a2)
{
  xpc_object_t v4 = (void *)a2[2];
  id v5 = a2;
  xpc_dictionary_get_value(v4, "device");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = remote_device_create_from_client_description(v9);
  uint64_t v7 = (void *)a2[2];

  uint64_t v8 = xpc_dictionary_dup_fd(v7, "fd");
  _remote_service_accept(*(void **)(a1 + 32), v6, v8);
}

void remote_service_listen(const char *a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __remote_service_listen_block_invoke;
  v7[3] = &unk_1E6C24818;
  id v8 = v5;
  id v6 = v5;
  remote_service_listen_with_device(a1, a2, v7);
}

uint64_t __remote_service_listen_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL remote_control_attach_loopback()
{
  return do_control_channel_request("attach_loopback", 0);
}

BOOL do_control_channel_request(const char *a1, const char *a2)
{
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted.control", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_413);
  xpc_connection_activate(mach_service);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", a1);
  if (a2) {
    xpc_dictionary_set_string(v5, "arg", a2);
  }
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
  uint64_t v7 = MEMORY[0x1E0196010]();
  uint64_t v8 = MEMORY[0x1E4F145A8];
  if (v7 != MEMORY[0x1E4F145A8]) {
    xpc_connection_cancel(mach_service);
  }

  return v7 != v8;
}

BOOL remote_control_connect_loopback()
{
  return do_control_channel_request("connect_loopback", 0);
}

BOOL remote_control_detach_loopback()
{
  return do_control_channel_request("detach_loopback", 0);
}

BOOL remote_control_suspend_loopback()
{
  return do_control_channel_request("suspend_loopback", 0);
}

BOOL remote_control_resume_loopback()
{
  return do_control_channel_request("resume_loopback", 0);
}

BOOL remote_control_reset_loopback()
{
  return do_control_channel_request("reset_loopback", 0);
}

BOOL remote_control_enable_bonjour(const char *a1)
{
  return do_control_channel_request("enable_bonjour", a1);
}

BOOL remote_control_disable_bonjour()
{
  return do_control_channel_request("disable_bonjour", 0);
}

BOOL remote_control_enable_bonjour_loopback(const char *a1)
{
  return do_control_channel_request("enable_bonjour_loopback", a1);
}

BOOL remote_control_enable_network_peer(const char *a1)
{
  return do_control_channel_request("enable_network_peer", a1);
}

BOOL remote_control_disable_network_peer()
{
  return do_control_channel_request("disable_network_peer", 0);
}

BOOL remote_control_connect_network_peer(const char *a1)
{
  return do_control_channel_request("connect_network_peer", a1);
}

int64_t remote_compute_controller_add_node(const char *a1, const char *a2)
{
  if (!a1) {
    remote_compute_controller_add_node_cold_1();
  }
  if (!a2) {
    remote_compute_controller_add_node_cold_2();
  }
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_314);
  xpc_connection_activate(mach_service);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "add_device");
  xpc_dictionary_set_string(v5, "address", a2);
  xpc_dictionary_set_string(v5, "interface_name", a1);
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_add_node_cold_3();
    }
    int64_t v7 = 54;
    goto LABEL_10;
  }
  int64_t v7 = _check_operation_result(v6);
  if (v7)
  {
    uint64_t v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_add_node_cold_4();
    }
LABEL_10:
  }
  xpc_connection_cancel(mach_service);

  return v7;
}

xpc_connection_t remoted_connection_create_mach_service(const char *a1, NSObject *a2)
{
  int v4 = 0;
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a1, a2, 0);
  if (xpc_user_sessions_enabled()
    && xpc_is_system_session()
    && os_variant_is_darwinos())
  {
    xpc_user_sessions_get_foreground_uid();
    xpc_connection_set_target_user_session_uid();
  }
  return mach_service;
}

void __remote_compute_controller_add_node_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    id v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __remote_compute_controller_add_node_block_invoke_cold_1();
    }
  }
}

int64_t _check_operation_result(void *a1)
{
  id v1 = a1;
  string = xpc_dictionary_get_string(v1, "result");
  if (!string)
  {
    int v4 = rsd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      _check_operation_result_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_8;
  }
  if (!strcmp(string, "OK"))
  {
    int64_t int64 = 0;
    goto LABEL_10;
  }
  int64_t int64 = xpc_dictionary_get_int64(v1, "error_code");
  if (!int64)
  {
    int v4 = rsd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      _check_operation_result_cold_2();
    }
LABEL_8:

    int64_t int64 = 94;
  }
LABEL_10:

  return int64;
}

int64_t remote_compute_controller_remove_node(const char *a1)
{
  if (!a1) {
    remote_compute_controller_add_node_cold_1();
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_319);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "remove_device");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_remove_node_cold_2();
    }
    int64_t v5 = 54;
    goto LABEL_9;
  }
  int64_t v5 = _check_operation_result(v4);
  if (v5)
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_remove_node_cold_3();
    }
LABEL_9:
  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_controller_remove_node_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    id v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __remote_compute_controller_add_node_block_invoke_cold_1();
    }
  }
}

int64_t remote_compute_node_listen(const char *a1)
{
  if (!a1) {
    remote_compute_controller_add_node_cold_1();
  }
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_322);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "listen");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_node_listen_cold_2();
    }
    int64_t v5 = 54;
    goto LABEL_9;
  }
  int64_t v5 = _check_operation_result(v4);
  if (v5)
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_node_listen_cold_3();
    }
LABEL_9:
  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_node_listen_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    id v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __remote_compute_controller_add_node_block_invoke_cold_1();
    }
  }
}

int64_t remote_compute_node_listen_cancel(const char *a1)
{
  if (!a1) {
    remote_compute_controller_add_node_cold_1();
  }
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_325);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "listen_cancel");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_node_listen_cancel_cold_2();
    }
    int64_t v5 = 54;
    goto LABEL_9;
  }
  int64_t v5 = _check_operation_result(v4);
  if (v5)
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_node_listen_cancel_cold_3();
    }
LABEL_9:
  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_node_listen_cancel_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    id v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __remote_compute_controller_add_node_block_invoke_cold_1();
    }
  }
}

uint64_t remote_compute_node_disconnect_controller(void *a1)
{
  id v1 = a1;
  if ([v1 type] == 15)
  {
    if (remote_device_disconnect(v1)) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = *__error();
    }
  }
  else
  {
    xpc_object_t v3 = rsd_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      remote_compute_node_disconnect_controller_cold_1();
    }

    uint64_t v2 = 22;
  }

  return v2;
}

int64_t remote_compute_controller_browse(const char *a1)
{
  if (!a1) {
    remote_compute_controller_add_node_cold_1();
  }
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_328);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "browse");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_browse_cold_2();
    }
    int64_t v5 = 54;
    goto LABEL_9;
  }
  int64_t v5 = _check_operation_result(v4);
  if (v5)
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_browse_cold_3();
    }
LABEL_9:
  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_controller_browse_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    uint64_t v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __remote_compute_controller_add_node_block_invoke_cold_1();
    }
  }
}

int64_t remote_compute_controller_browse_cancel(const char *a1)
{
  if (!a1) {
    remote_compute_controller_add_node_cold_1();
  }
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_331);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "browse_cancel");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_browse_cancel_cold_2();
    }
    int64_t v5 = 54;
    goto LABEL_9;
  }
  int64_t v5 = _check_operation_result(v4);
  if (v5)
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      remote_compute_controller_browse_cancel_cold_3();
    }
LABEL_9:
  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_controller_browse_cancel_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    uint64_t v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __remote_compute_controller_add_node_block_invoke_cold_1();
    }
  }
}

int64_t local_device_compute_platform_require_tls(BOOL a1)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_334);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "require_tls");
  xpc_dictionary_set_BOOL(v3, "is_tls_required", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      local_device_compute_platform_require_tls_cold_1();
    }
    int64_t v5 = 54;
    goto LABEL_8;
  }
  int64_t v5 = _check_operation_result(v4);
  if (v5)
  {
    uint64_t v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      local_device_compute_platform_require_tls_cold_2();
    }
LABEL_8:
  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __local_device_compute_platform_require_tls_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    uint64_t v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __local_device_compute_platform_require_tls_block_invoke_cold_1();
    }
  }
}

uint64_t remote_compute_platform_tls_required(BOOL *a1)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_338);
  xpc_connection_activate(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "is_tls_required_cmd");
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v9 = rsd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      local_device_compute_platform_require_tls_cold_1();
    }

    uint64_t v8 = 0;
    uint64_t v6 = 54;
  }
  else
  {
    int64_t v5 = _check_operation_result(v4);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = rsd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        remote_compute_platform_tls_required_cold_3();
      }

      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v11 = xpc_dictionary_get_value(v4, "is_tls_required");
      if (v11)
      {
        uint64_t v8 = v11;
        uint64_t v6 = 0;
        if (a1) {
          *a1 = xpc_BOOL_get_value(v11);
        }
      }
      else
      {
        id v12 = rsd_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          remote_compute_platform_tls_required_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
        }

        uint64_t v8 = 0;
        uint64_t v6 = 72;
      }
    }
  }
  xpc_connection_cancel(mach_service);

  return v6;
}

void __remote_compute_platform_tls_required_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    uint64_t v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __local_device_compute_platform_require_tls_block_invoke_cold_1();
    }
  }
}

uint64_t __remote_device_xpc_remote_connection_tls_enabled_block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "remotexpc_tls_enabled");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id remote_device_copy_xpc_remote_connection_tls_verify_block(void *a1)
{
  id v1 = a1;
  if (remote_device_xpc_remote_connection_tls_enabled(v1))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __remote_device_copy_xpc_remote_connection_tls_verify_block_block_invoke;
    v5[3] = &unk_1E6C24508;
    id v6 = v1;
    uint64_t v2 = (void *)MEMORY[0x1E0195B90](v5);
    xpc_object_t v3 = (void *)[v2 copy];
  }
  else
  {
    xpc_object_t v3 = 0;
  }

  return v3;
}

void __remote_device_copy_xpc_remote_connection_tls_verify_block_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

sec_identity_t remote_service_copy_xpc_remote_connection_tls_identity(uint64_t a1)
{
  return remote_device_copy_xpc_remote_connection_tls_identity(*(void **)(a1 + 32));
}

id remote_service_copy_xpc_remote_connection_tls_verify_block(uint64_t a1)
{
  return remote_device_copy_xpc_remote_connection_tls_verify_block(*(void **)(a1 + 32));
}

uint64_t __rsd_log_block_invoke()
{
  rsd_log__log = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "RemoteServiceDiscovery");
  return MEMORY[0x1F41817F8]();
}

uint64_t __remoted_queue_block_invoke()
{
  remoted_queue_queue = (uint64_t)dispatch_queue_create("remote client queue", 0);
  return MEMORY[0x1F41817F8]();
}

intptr_t ___remote_service_create_connected_socket_impl_block_invoke(void *a1)
{
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = _remote_service_create_connected_socket_impl(a1[4], 0);
  uint64_t v2 = a1[5];
  return dispatch_semaphore_signal(v2);
}

void ___remote_service_connect_socket_impl_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    id v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___remote_service_connect_socket_impl_block_invoke_cold_1();
    }
    goto LABEL_14;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (!string)
  {
    id v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___remote_service_connect_socket_impl_block_invoke_cold_2();
    }
    goto LABEL_14;
  }
  int64_t v5 = string;
  if (!strcmp(string, "ERROR"))
  {
    id v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___remote_service_connect_socket_impl_block_invoke_cold_3();
    }
    goto LABEL_14;
  }
  if (!strcmp(v5, "INTERRUPTED"))
  {
    id v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___remote_service_connect_socket_impl_block_invoke_cold_4();
    }
    goto LABEL_14;
  }
  if (strcmp(v5, "OK"))
  {
    id v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___remote_service_connect_socket_impl_block_invoke_cold_6();
    }
LABEL_14:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  int v7 = xpc_dictionary_dup_fd(v3, "fd");
  uint64_t v8 = rsd_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    ___remote_service_connect_socket_impl_block_invoke_cold_5();
  }

  id v9 = remoted_queue();
  id v10 = rsd_log();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___remote_service_connect_socket_impl_block_invoke_380;
  v12[3] = &unk_1E6C24890;
  char v16 = *(unsigned char *)(a1 + 56);
  uint64_t v11 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  remote_socket_poll_connect_async(v7, v9, v10, v11, v12);

LABEL_15:
}

void ___remote_service_connect_socket_impl_block_invoke_380(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 && *(unsigned char *)(a1 + 56))
  {
    int64_t v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB9AA000, v5, OS_LOG_TYPE_DEFAULT, "socket connection failed, heartbeat remote device and try again", buf, 2u);
    }

    id v6 = *(void **)(*(void *)(a1 + 32) + 32);
    id v7 = remoted_queue();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___remote_service_connect_socket_impl_block_invoke_381;
    v9[3] = &unk_1E6C24868;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    remote_device_heartbeat(v6, v7, v9);
  }
  else
  {
    if (remote_service_should_encrypt_socket_data(*(void **)(a1 + 32))
      && remote_device_xpc_remote_connection_tls_enabled(*(void **)(*(void *)(a1 + 32) + 32)))
    {
      [*(id *)(a1 + 32) proxySocketOverRemoteXPC:a2];
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
}

uint64_t ___remote_service_connect_socket_impl_block_invoke_381(void *a1)
{
  return _remote_service_connect_socket_impl(a1[4], a1[5], a1[6], 0);
}

void __remote_service_create_from_client_description_block_invoke()
{
  dispatch_queue_t v0 = rsd_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_DEFAULT, "Error on service connection", v1, 2u);
  }
}

void __remoted_conn_block_invoke()
{
  dispatch_queue_t v0 = remoted_queue();
  xpc_connection_t mach_service = remoted_connection_create_mach_service("com.apple.remoted", v0);
  uint64_t v2 = (void *)remoted_conn_conn;
  remoted_conn_conn = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)remoted_conn_conn, &__block_literal_global_392);
  id v3 = (_xpc_connection_s *)remoted_conn_conn;
  xpc_connection_activate(v3);
}

void __remoted_conn_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1E0196010](a2);
  uint64_t v3 = MEMORY[0x1E4F145A8];
  xpc_object_t v4 = rsd_log();
  int64_t v5 = v4;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __remoted_conn_block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __remoted_conn_block_invoke_2_cold_2();
  }
}

void remote_device_update_from_client_description(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v3 = a2;
  if ([v11 type])
  {
    int v4 = [v11 type];
    if (v4 != xpc_dictionary_get_uint64(v3, "device_type")) {
      remote_device_update_from_client_description_cold_6(&v12, v13);
    }
  }
  else
  {
    objc_msgSend(v11, "setType:", xpc_dictionary_get_uint64(v3, "device_type"));
    if (![v11 type]) {
      remote_device_update_from_client_description_cold_1(&v12, v13);
    }
  }
  if (objc_msgSend(v11, "device_id"))
  {
    uint64_t v5 = objc_msgSend(v11, "device_id");
    if (v5 != xpc_dictionary_get_uint64(v3, "device_id")) {
      remote_device_update_from_client_description_cold_5(&v12, v13);
    }
  }
  else
  {
    objc_msgSend(v11, "setDevice_id:", xpc_dictionary_get_uint64(v3, "device_id"));
    if (!objc_msgSend(v11, "device_id")) {
      remote_device_update_from_client_description_cold_2(&v12, v13);
    }
  }
  id v6 = v11;
  if (!v11[1])
  {
    string = xpc_dictionary_get_string(v3, "device_name");
    if (!string) {
      remote_device_update_from_client_description_cold_3(&v12, v13);
    }
    uint64_t v8 = strdup(string);
    id v6 = v11;
    v11[1] = v8;
    if (!v8) {
      remote_device_update_from_client_description_cold_4(&v12, v13);
    }
  }
  if (!v6[2])
  {
    id v9 = xpc_dictionary_get_string(v3, "device_alias");
    if (v9) {
      v11[2] = strdup(v9);
    }
  }
  objc_msgSend(v11, "setMessaging_protocol_version:", xpc_dictionary_get_uint64(v3, "device_messaging_protocol_version"));
  objc_msgSend(v11, "setRemotexpc_tls_enabled:", xpc_dictionary_get_BOOL(v3, "device_tls_enabled"));
  objc_msgSend(v11, "setUuid:", xpc_dictionary_get_uuid(v3, "UUID"));
  id v10 = xpc_dictionary_get_dictionary(v3, "properties");
  [v11 setProperties:v10];
}

void __remote_device_create_from_client_description_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    id v9 = rsd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __remote_device_create_from_client_description_block_invoke_cold_1();
    }
    goto LABEL_22;
  }
  if (MEMORY[0x1E0196010](v3) != MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(v3, "cmd");
    id v6 = string;
    if (!string || strcmp(string, "found_device"))
    {
      id v7 = rsd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = WeakRetained[1];
        *(_DWORD *)buf = 136446466;
        uint64_t v26 = v8;
        __int16 v27 = 2080;
        uint64_t v28 = v6;
        _os_log_impl(&dword_1DB9AA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s> Device connection received unexpected command \"%s\"", buf, 0x16u);
      }

      goto LABEL_23;
    }
    id v13 = rsd_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = WeakRetained[1];
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1DB9AA000, v13, OS_LOG_TYPE_INFO, "%{public}s> Updated device", buf, 0xCu);
    }

    id v9 = WeakRetained;
    id v15 = v3;
    char v16 = [v9 dq];
    dispatch_assert_queue_V2(v16);

    uint64_t v17 = xpc_dictionary_get_dictionary(v15, "device");
    if (!v17) {
      __remote_device_create_from_client_description_block_invoke_cold_2(&v24, buf);
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = rsd_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v20)
    {
      SecKeyRef v21 = (void *)xpc_copy_clean_description();
      id v22 = rsd_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __remote_device_create_from_client_description_block_invoke_cold_3();
      }

      free(v21);
    }
    remote_device_update_from_client_description(v9, v18);
    uint64_t int64 = xpc_dictionary_get_uint64(v18, "device_state");
    remote_device_advance_state(v9, uint64);

LABEL_22:
    goto LABEL_23;
  }
  id v10 = (char *)MEMORY[0x1E0195EA0](v3);
  id v11 = rsd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = WeakRetained[1];
    *(_DWORD *)buf = 136446466;
    uint64_t v26 = v12;
    __int16 v27 = 2080;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1DB9AA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s> Error on device connection: %s", buf, 0x16u);
  }

  free(v10);
  if (v3 == (id)MEMORY[0x1E4F14520]) {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
  else {
    remote_device_advance_state(WeakRetained, 3);
  }
LABEL_23:
}

void remote_device_advance_state(void *a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = [v3 dq];
  dispatch_assert_queue_V2(v4);

  int v5 = [v3 state];
  if (v5 != a2)
  {
    int v6 = v5;
    id v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      remote_device_advance_state_cold_4();
    }

    switch(v6)
    {
      case 1:
        if ((a2 & 0xFFFFFFFE) != 2) {
          remote_device_advance_state_cold_1(&v27, v28);
        }
        break;
      case 2:
        if (a2 != 3) {
          remote_device_advance_state_cold_2(&v27, v28);
        }
        break;
      case 3:
        remote_device_advance_state_cold_3();
    }
    [v3 setState:a2];
    uint64_t v8 = objc_msgSend(v3, "connected_callback");
    if (v8)
    {

      if ((a2 & 0xFFFFFFFE) == 2)
      {
        id v9 = objc_msgSend(v3, "connected_callback");
        id v10 = objc_msgSend(v3, "connected_callback_queue");
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __remote_device_advance_state_block_invoke;
        block[3] = &unk_1E6C246C0;
        id v26 = v9;
        id v11 = v3;
        id v25 = v11;
        id v12 = v9;
        dispatch_async(v10, block);

        objc_msgSend(v11, "setConnected_callback:", 0);
        objc_msgSend(v11, "setConnected_callback_queue:", 0);
        objc_msgSend(v11, "setConnected_callback_self_retain:", 0);
      }
    }
    id v13 = objc_msgSend(v3, "disconnected_callback");

    if (a2 == 3 && v13)
    {
      uint64_t v14 = objc_msgSend(v3, "disconnected_callback");
      id v15 = objc_msgSend(v3, "disconnected_callback_queue");
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      BOOL v20 = __remote_device_advance_state_block_invoke_2;
      SecKeyRef v21 = &unk_1E6C246C0;
      id v23 = v14;
      id v16 = v3;
      id v22 = v16;
      id v17 = v14;
      dispatch_async(v15, &v18);

      objc_msgSend(v16, "setDisconnected_callback:", 0, v18, v19, v20, v21);
      objc_msgSend(v16, "setDisconnected_callback_queue:", 0);
      objc_msgSend(v16, "setDisconnected_callback_self_retain:", 0);
    }
  }
}

void __remote_device_create_from_client_description_block_invoke_394(uint64_t a1)
{
  uint64_t int64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "device_state");
  id v3 = *(void **)(a1 + 40);
  remote_device_advance_state(v3, uint64);
}

uint64_t __remote_device_advance_state_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __remote_device_advance_state_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void ___remote_device_start_browsing_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    int v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DB9AA000, v6, OS_LOG_TYPE_INFO, "Connection invalidated", (uint8_t *)&buf, 2u);
    }

    _remote_device_browser_cancel(*(void **)(a1 + 32));
  }
  else
  {
    string = xpc_dictionary_get_string(v3, "cmd");
    if (string && !strcmp(string, "found_device"))
    {
      id v7 = rsd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DB9AA000, v7, OS_LOG_TYPE_INFO, "Got new device", (uint8_t *)&buf, 2u);
      }

      int v5 = *(id *)(a1 + 32);
      id v8 = v3;
      if ([v5 canceling])
      {
        id v9 = rsd_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DB9AA000, v9, OS_LOG_TYPE_INFO, "Not delivering the device because client is canceling the browser", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        id v10 = [v5 cbq];
        dispatch_assert_queue_V2(v10);

        id v11 = xpc_dictionary_get_dictionary(v8, "device");
        if (!v11) {
          __remote_device_create_from_client_description_block_invoke_cold_2(&v15, &buf);
        }
        id v9 = v11;
        id v12 = remote_device_create_from_client_description(v11);
        id v13 = [v5 cbq];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v17 = ___remote_device_new_device_note_block_invoke;
        uint64_t v18 = &unk_1E6C24908;
        uint64_t v19 = v5;
        BOOL v20 = v12;
        uint64_t v14 = v12;
        dispatch_async(v13, &buf);
      }
    }
    else
    {
      int v5 = rsd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __remoted_conn_block_invoke_2_cold_2();
      }
    }
  }
}

void ___remote_device_start_browsing_block_invoke_405(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (MEMORY[0x1E0196010]() == MEMORY[0x1E4F145A8])
  {
    int v4 = (void *)MEMORY[0x1E0195EA0](v2);
    int v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ___remote_device_start_browsing_block_invoke_405_cold_1();
    }

    free(v4);
  }
  else
  {
    id v3 = rsd_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1DB9AA000, v3, OS_LOG_TYPE_INFO, "Started browsing.", v6, 2u);
    }
  }
}

void ___remote_device_new_device_note_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) callback];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), 0);
  }
}

uint64_t ___remote_device_browser_cancel_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  v2[2](v2, 0, 1);

  [*(id *)(a1 + 32) setCallback:0];
  id v3 = *(void **)(a1 + 32);
  return [v3 setCanceled:1];
}

void ___remote_service_accept_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 removeObject:WeakRetained];
}

uint64_t ___remote_service_accept_block_invoke_410(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))(*(void *)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __do_control_channel_request_block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1E0196010](a2) != MEMORY[0x1E4F145A8])
  {
    id v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __do_control_channel_request_block_invoke_cold_1();
    }
  }
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return _os_log_send_and_compose_impl();
}

void remote_socket_poll_connect_async(int a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    remote_socket_poll_connect_async_cold_1();
  }
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F144B0], a1, 0, v9);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __remote_socket_poll_connect_async_block_invoke;
  id v26 = &unk_1E6C249A8;
  id v28 = v12;
  uint64_t v29 = v31;
  id v27 = v11;
  int v30 = a1;
  id v14 = v12;
  id v15 = v11;
  dispatch_source_set_mandatory_cancel_handler();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __remote_socket_poll_connect_async_block_invoke_4;
  v18[3] = &unk_1E6C249D0;
  int v22 = a1;
  dispatch_source_t v20 = v13;
  uint64_t v21 = v31;
  uint64_t v19 = v10;
  id v16 = v13;
  id v17 = v10;
  dispatch_source_set_event_handler(v16, v18);
  dispatch_activate(v16);

  _Block_object_dispose(v31, 8);
}

void __remote_socket_poll_connect_async_block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (close(*(_DWORD *)(a1 + 56)) == -1) {
      __remote_socket_poll_connect_async_block_invoke_cold_1();
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __remote_socket_poll_connect_async_block_invoke_3;
    v7[3] = &unk_1E6C24980;
    id v2 = (id *)v8;
    id v3 = *(NSObject **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v8[0] = v4;
    v8[1] = v5;
    int v6 = v7;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __remote_socket_poll_connect_async_block_invoke_2;
    block[3] = &unk_1E6C24958;
    id v2 = &v10;
    id v3 = *(NSObject **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 56);
    int v6 = block;
  }
  dispatch_async(v3, v6);
}

uint64_t __remote_socket_poll_connect_async_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0);
}

uint64_t __remote_socket_poll_connect_async_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0xFFFFFFFFLL, *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __remote_socket_poll_connect_async_block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v2 = _remote_socket_expect_connected(*(_DWORD *)(a1 + 56), *(void **)(a1 + 32), (int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2)
  {
    if (v3) {
      __remote_socket_poll_connect_async_block_invoke_4_cold_1(&v5, v6);
    }
  }
  else if (!v3)
  {
    __remote_socket_poll_connect_async_block_invoke_4_cold_2(&v5, v6);
  }
  id v4 = *(NSObject **)(a1 + 40);
  dispatch_source_cancel(v4);
}

BOOL _remote_socket_expect_connected(int a1, void *a2, int *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  if (!a3) {
    a3 = &v10;
  }
  socklen_t v9 = 4;
  int v10 = 0;
  if (getsockopt(a1, 0xFFFF, 4103, a3, &v9) == -1) {
    _remote_socket_expect_connected_cold_1(&v8, v11);
  }
  int v6 = *a3;
  if (*a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      _remote_socket_expect_connected_cold_3();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _remote_socket_expect_connected_cold_2();
  }

  return v6 == 0;
}

uint64_t remote_socket_poll_connect_sync(int a1, void *a2)
{
  int v3 = a2;
  v8.fd = a1;
  *(_DWORD *)&v8.events = 4;
  int v4 = poll(&v8, 1u, -1);
  if (!v4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      remote_socket_poll_connect_sync_cold_3();
    }
    goto LABEL_12;
  }
  if (v4 == -1)
  {
    if (*__error() == 4)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        remote_socket_poll_connect_sync_cold_1();
      }
    }
    else
    {
      int v6 = v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        remote_socket_poll_connect_sync_cold_2();
      }
    }
LABEL_12:
    uint64_t v5 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  uint64_t v5 = (_remote_socket_expect_connected(a1, v3, 0) - 1);
LABEL_13:

  return v5;
}

uint64_t remote_socket_create_connected_ipv6_pair(int *a1, int *a2, void *a3)
{
  uint64_t v5 = a3;
  int v6 = socket(30, 1, 0);
  if (v6 == -1)
  {
    dispatch_source_t v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_1();
    }

    goto LABEL_29;
  }
  int v7 = v6;
  *(void *)&v19.sae_srcif = 7708;
  long long v18 = *MEMORY[0x1E4F148D0];
  *(_OWORD *)&v19.sae_srcaddr = *MEMORY[0x1E4F148D0];
  LODWORD(v19.sae_dstaddr) = 0;
  if (bind(v6, (const sockaddr *)&v19, 0x1Cu) == -1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_2();
    }
    goto LABEL_19;
  }
  if (listen(v7, 128) == -1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_3();
    }
LABEL_19:

LABEL_27:
    int v15 = v7;
LABEL_28:
    close(v15);
LABEL_29:
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_30;
  }
  v20[0] = 28;
  if (getsockname(v7, (sockaddr *)&v19, v20) == -1)
  {
    id v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_4();
    }
    goto LABEL_26;
  }
  __int16 sae_srcif_high = HIWORD(v19.sae_srcif);
  if (!HIWORD(v19.sae_srcif))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_5();
    }
    goto LABEL_27;
  }
  int v9 = socket(30, 1, 0);
  if (v9 == -1)
  {
    id v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_1();
    }
LABEL_26:

    goto LABEL_27;
  }
  int v10 = v9;
  if (fcntl(v9, 4, 4) == -1)
  {
    id v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_7();
    }
    goto LABEL_37;
  }
  LOWORD(v20[0]) = 7708;
  HIWORD(v20[0]) = sae_srcif_high;
  v20[1] = 0;
  long long v21 = v18;
  int v22 = 0;
  *(&v19.sae_srcif + 1) = -1431655766;
  v19.sae_srcif = 0;
  v19.sae_srcaddr = 0;
  *(void *)&v19.sae_srcaddrlen = 0xAAAAAAAA00000000;
  v19.sae_dstaddr = (const sockaddr *)v20;
  *(void *)&v19.sae_dstaddrlen = 0xAAAAAAAA0000001CLL;
  if (connectx(v10, &v19, 0, 0, 0, 0, 0, 0) == -1 && *__error() != 36)
  {
    id v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_9();
    }
    goto LABEL_37;
  }
  memset(&v19, 170, 28);
  v20[0] = 0;
  int v11 = accept(v7, (sockaddr *)&v19, v20);
  if (v11 == -1)
  {
    id v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      remote_socket_create_connected_ipv6_pair_cold_8();
    }
LABEL_37:

    close(v7);
    int v15 = v10;
    goto LABEL_28;
  }
  *a1 = v10;
  *a2 = v11;
  close(v7);
  uint64_t v12 = 0;
LABEL_30:

  return v12;
}

void bridge_version_compare_cold_1()
{
}

void remote_device_type_is_trusted_cold_1()
{
}

void remote_device_type_is_trusted_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_15();
  _os_crash_msg();
  __break(1u);
}

void remote_device_get_type_cold_1()
{
}

void remote_device_authenticate_cold_2()
{
}

void remote_device_authenticate_cold_3()
{
}

void remote_device_authenticate_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to get cert chain's leaf certificate.", v2, v3, v4, v5, v6);
}

void remote_device_authenticate_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to copy certificate chain.", v2, v3, v4, v5, v6);
}

void remote_service_copy_properties_cold_1()
{
}

void remote_service_get_xpc_remote_connection_version_flags_cold_2(void *a1, _OWORD *a2)
{
}

void remote_device_get_xpc_remote_connection_version_flags_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Invalid or missing remote device connection version flags", v2, v3, v4, v5, v6);
}

void remote_service_create_connected_socket_cold_2(void *a1, _OWORD *a2)
{
}

void _remote_service_connect_socket_impl_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1DB9AA000, v0, v1, "Sending CONNECT command", v2, v3, v4, v5, v6);
}

void remote_device_copy_boot_session_uuid_cold_2()
{
}

void remote_device_get_connectable_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending GET CONNECTABLE command", v2, v3, v4, v5, v6);
}

void remote_device_get_latest_connect_result_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending GET LATEST CONNECT ERROR command", v2, v3, v4, v5, v6);
}

void _remote_device_crash_if_not_connected_cold_1()
{
}

void __remote_device_authenticate_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received xpc error sending AUTHENTICATE command", v2, v3, v4, v5, v6);
}

void remote_device_copy_service_names_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending LIST SERVICES command", v2, v3, v4, v5, v6);
}

void remote_device_copy_service_names_cold_3(void *a1, _OWORD *a2)
{
}

void remote_device_copy_local_service_names_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending LIST LOCAL SERVICES command", v2, v3, v4, v5, v6);
}

void remote_device_copy_service_cold_2()
{
}

void remote_device_copy_service_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending GET SERVICE command", v2, v3, v4, v5, v6);
}

void remote_device_copy_service_cold_4(void *a1, _OWORD *a2)
{
}

void remote_device_copy_service_cold_5(void *a1, _OWORD *a2)
{
}

void remote_device_copy_service_cold_6(void *a1, _OWORD *a2)
{
}

void remote_device_copy_service_cold_7(void *a1, _OWORD *a2)
{
}

void remote_device_copy_service_cold_8()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "Creating service from: %s", v2, v3, v4, v5, v6);
}

void remote_device_copy_service_cold_9(void *a1, _OWORD *a2)
{
}

void remote_device_check_service_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending CHECK SERVICE command", v2, v3, v4, v5, v6);
}

void remote_device_set_connected_callback_cold_2()
{
}

void remote_device_timesync_cold_2()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "%{public}s> Received error sending TIMESYNC command", v2, v3, v4, v5, v6);
}

void remote_device_reset_cold_2()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "%{public}s> Received error sending RESET DEVICE command", v2, v3, v4, v5, v6);
}

void remote_device_disconnect_cold_2()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "%{public}s> Received error sending DISCONNECT DEVICE command", v2, v3, v4, v5, v6);
}

void remote_device_set_alias_cold_2()
{
}

void local_device_copy_description_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending GET LOCAL DEVICE DESCRIPTION command", v2, v3, v4, v5, v6);
}

void local_device_copy_description_cold_2(void *a1, _OWORD *a2)
{
}

void local_device_copy_identity_cold_3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "Received error sending GET LOCAL DEVICE IDENTITY command: %{public}@", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "No identity in reply.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "No cert data in reply.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to initialize certificate data.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to create certificate from data.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_8()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "Failed to create key ACL: %{public}@", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_9()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "No key data in reply.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_10()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to initialize key data.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_11()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "Failed to create key from data: %{public}@", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_12()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Failed to create identity.", v2, v3, v4, v5, v6);
}

void local_device_copy_identity_cold_13()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "local_device_copy_identity: failed", v2, v3, v4, v5, v6);
}

void local_device_delete_identity_cold_1(void *a1, _OWORD *a2)
{
}

void local_device_delete_identity_cold_2(void *a1, _OWORD *a2)
{
}

void local_device_delete_identity_cold_3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "Received error sending DELETE LOCAL DEVICE IDENTITY command: %{public}@", v2, v3, v4, v5, v6);
}

void local_device_delete_identity_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "local_device_delete_identity: failed", v2, v3, v4, v5, v6);
}

void local_device_create_identity_cold_3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "Received error sending CREATE LOCAL DEVICE IDENTITY command: %{public}@", v2, v3, v4, v5, v6);
}

void local_device_create_identity_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "local_device_create_identity: failed", v2, v3, v4, v5, v6);
}

void local_device_copy_service_names_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending LIST LOCAL DEVICE SERVICES command", v2, v3, v4, v5, v6);
}

void local_device_copy_service_names_cold_2(void *a1, _OWORD *a2)
{
}

void remote_device_copy_unique_of_type_cold_1()
{
}

void remote_device_copy_unique_of_type_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending GET UNIQUE DEVICE command", v2, v3, v4, v5, v6);
}

void remote_device_copy_unique_of_type_cold_3(void *a1, _OWORD *a2)
{
}

void remote_device_create_from_client_description_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "Creating device from: %s", v2, v3, v4, v5, v6);
}

void remote_device_copy_device_with_name_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending GET DEVICE command", v2, v3, v4, v5, v6);
}

void remote_device_browser_cancel_cold_1()
{
}

void remote_device_start_browsing_matching_cold_1()
{
}

void __remote_device_start_browsing_matching_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void __remote_device_start_browsing_matching_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "%{public}s> browsing_matching: Found a candidate", v2, v3, v4, v5, v6);
}

void __remote_device_start_browsing_matching_block_invoke_263_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "%{public}s> browsing_matching: Found a match", v2, v3, v4, v5, v6);
}

void __remote_device_start_browsing_matching_block_invoke_263_cold_2()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "%{public}s> browsing_matching: Device didn't match", v2, v3, v4, v5, v6);
}

void __remote_device_start_browsing_matching_block_invoke_263_cold_3()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "%{public}s> browsing_matching: Device isn't connected", v2, v3, v4, v5, v6);
}

void _remote_service_accept_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void __remote_service_listen_with_device_block_invoke_3_cold_1(void *a1, _OWORD *a2)
{
}

void __remote_service_listen_with_device_block_invoke_3_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_15();
  _os_crash_msg();
  __break(1u);
}

void __remote_service_listen_with_device_block_invoke_3_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF RemoteServiceDiscovery: Tried to listen for unknown service '%{public}s'.", v1, 0xCu);
}

void remote_compute_controller_add_node_cold_1()
{
}

void remote_compute_controller_add_node_cold_2()
{
}

void remote_compute_controller_add_node_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending ADD DEVICE command", v2, v3, v4, v5, v6);
}

void remote_compute_controller_add_node_cold_4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_controller_add_node: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void remoted_connection_create_mach_service_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __remote_compute_controller_add_node_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Unexpected mesage on compute platfrom channel", v2, v3, v4, v5, v6);
}

void _check_operation_result_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _check_operation_result_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Bogus response: operation failed without error code", v2, v3, v4, v5, v6);
}

void remote_compute_controller_remove_node_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending REMOVE DEVICE command", v2, v3, v4, v5, v6);
}

void remote_compute_controller_remove_node_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_controller_remove_node: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void remote_compute_node_listen_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending LISTEN command", v2, v3, v4, v5, v6);
}

void remote_compute_node_listen_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_node_listen: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void remote_compute_node_listen_cancel_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending LISTEN CANCEL command", v2, v3, v4, v5, v6);
}

void remote_compute_node_listen_cancel_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_node_listen_cancel: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void remote_compute_node_disconnect_controller_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "device is not of type compute-controller", v2, v3, v4, v5, v6);
}

void remote_compute_controller_browse_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending BROWSE command", v2, v3, v4, v5, v6);
}

void remote_compute_controller_browse_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_controller_browse: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void remote_compute_controller_browse_cancel_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending BROWSE CANCEL command", v2, v3, v4, v5, v6);
}

void remote_compute_controller_browse_cancel_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_controller_browse_cancel: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void local_device_compute_platform_require_tls_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Received error sending REQUIRE TLS command", v2, v3, v4, v5, v6);
}

void local_device_compute_platform_require_tls_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "local_device_compute_platform_require_tls: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void __local_device_compute_platform_require_tls_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Unexpected mesage on compute platform channel", v2, v3, v4, v5, v6);
}

void remote_compute_platform_tls_required_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void remote_compute_platform_tls_required_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1DB9AA000, v0, v1, "remote_compute_platform_tls_required: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void ___remote_service_connect_socket_impl_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "CONNECT command finished with an XPC error", v2, v3, v4, v5, v6);
}

void ___remote_service_connect_socket_impl_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "CONNECT command failed - bogus reply", v2, v3, v4, v5, v6);
}

void ___remote_service_connect_socket_impl_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "CONNECT command failed with unrecoverable error", v2, v3, v4, v5, v6);
}

void ___remote_service_connect_socket_impl_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "CONNECT command failed with INTERRUPTED", v2, v3, v4, v5, v6);
}

void ___remote_service_connect_socket_impl_block_invoke_cold_5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_DEBUG, "connect socket has succceeded - fd %d", v1, 8u);
}

void ___remote_service_connect_socket_impl_block_invoke_cold_6()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "CONNECT command failed with unknown result: %s", v2, v3, v4, v5, v6);
}

void __remoted_conn_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1DB9AA000, v0, v1, "Error received on client connection:", v2, v3, v4, v5, v6);
}

void __remoted_conn_block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Unexpected message from remoted", v2, v3, v4, v5, v6);
}

void remote_device_update_from_client_description_cold_1(void *a1, _OWORD *a2)
{
}

void remote_device_update_from_client_description_cold_2(void *a1, _OWORD *a2)
{
}

void remote_device_update_from_client_description_cold_3(void *a1, _OWORD *a2)
{
}

void remote_device_update_from_client_description_cold_4(void *a1, _OWORD *a2)
{
}

void remote_device_update_from_client_description_cold_5(void *a1, _OWORD *a2)
{
}

void remote_device_update_from_client_description_cold_6(void *a1, _OWORD *a2)
{
}

void __remote_device_create_from_client_description_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1DB9AA000, v0, v1, "Event fired on deallocated device", v2, v3, v4, v5, v6);
}

void __remote_device_create_from_client_description_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void __remote_device_create_from_client_description_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1DB9AA000, v0, v1, "Updating device from: %s", v2, v3, v4, v5, v6);
}

void remote_device_advance_state_cold_1(void *a1, _OWORD *a2)
{
}

void remote_device_advance_state_cold_2(void *a1, _OWORD *a2)
{
}

void remote_device_advance_state_cold_3()
{
}

void remote_device_advance_state_cold_4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_11();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1DB9AA000, v1, OS_LOG_TYPE_DEBUG, "device advancing from %d to %d", v2, 0xEu);
}

void ___remote_device_start_browsing_block_invoke_405_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1DB9AA000, v0, v1, "Unable to start browsing: %s", v2, v3, v4, v5, v6);
}

void __do_control_channel_request_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DB9AA000, v0, v1, "Unexpected mesage on control channel", v2, v3, v4, v5, v6);
}

void remote_socket_poll_connect_async_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_DEBUG, "asynchronously waiting for connect(2) to complete", v1, 2u);
}

uint64_t __remote_socket_poll_connect_async_block_invoke_cold_1()
{
  return _os_assumes_log();
}

void __remote_socket_poll_connect_async_block_invoke_4_cold_1(void *a1, _OWORD *a2)
{
}

void __remote_socket_poll_connect_async_block_invoke_4_cold_2(void *a1, _OWORD *a2)
{
}

void _remote_socket_expect_connected_cold_1(void *a1, _OWORD *a2)
{
}

void _remote_socket_expect_connected_cold_2()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_DEBUG, "connect(2) completed", v1, 2u);
}

void _remote_socket_expect_connected_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_ERROR, "connect(2) failed with error: %{errno}d", v1, 8u);
}

void remote_socket_poll_connect_sync_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_ERROR, "poll(2) was interrupted while connecting to a service", v1, 2u);
}

void remote_socket_poll_connect_sync_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "poll(2) failed while connecting to a service: %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_poll_connect_sync_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_ERROR, "poll(2) timed out; events: 0x%x", v1, 8u);
}

void remote_socket_create_connected_ipv6_pair_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "socket(2): %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_create_connected_ipv6_pair_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "bind(2): %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_create_connected_ipv6_pair_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "listen(2): %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_create_connected_ipv6_pair_cold_4()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "getsockname(2): %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_create_connected_ipv6_pair_cold_5()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1DB9AA000, v0, OS_LOG_TYPE_ERROR, "getsockname(2) did not populate sin6_port", v1, 2u);
}

void remote_socket_create_connected_ipv6_pair_cold_7()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "fcntl(2): %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_create_connected_ipv6_pair_cold_8()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "accept(2): %{errno}d", v2, v3, v4, v5, v6);
}

void remote_socket_create_connected_ipv6_pair_cold_9()
{
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB9AA000, v0, v1, "connectx(2): %{errno}d", v2, v3, v4, v5, v6);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFRelease(CFTypeRef cf)
{
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1F40F6DC8]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CA200](*(void *)&a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CA530](*(void *)&a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connectx(int a1, const sa_endpoints_t *a2, sae_associd_t a3, unsigned int a4, const iovec *a5, unsigned int a6, size_t *a7, sae_connid_t *a8)
{
  return MEMORY[0x1F40CB448](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4, a5, *(void *)&a6, a7, a8);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
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
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA8](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1F40CBCE0]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC558](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40CC560](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1F40CC840](*(void *)&a1, *(void *)&a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x1F40CD770](a1, *(void *)&a2, *(void *)&a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x1F40F7398](identity);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1F40F75C0](trust);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40CEA90](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x1F40CED10]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x1F40CED58]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1F40CED68]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1F40CF1A8]();
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1F41497E8]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1F4149800]();
}

uint64_t xpc_remote_connection_create_with_connected_fd()
{
  return MEMORY[0x1F4149820]();
}

uint64_t xpc_remote_connection_get_version_flags()
{
  return MEMORY[0x1F4149848]();
}

uint64_t xpc_remote_connection_send_barrier()
{
  return MEMORY[0x1F4149850]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1F4149860]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1F4149880]();
}

uint64_t xpc_remote_connection_set_target_queue()
{
  return MEMORY[0x1F4149890]();
}

uint64_t xpc_remote_connection_set_tls()
{
  return MEMORY[0x1F41498A0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}