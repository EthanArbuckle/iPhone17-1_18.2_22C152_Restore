uint64_t sub_2C3C(uint64_t a1)
{
  uint64_t result;

  result = DNSServiceRegister((DNSServiceRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(_DWORD *)(a1 + 104), *(_DWORD *)(a1 + 108), *(const char **)(a1 + 48), *(const char **)(a1 + 56), *(const char **)(a1 + 64), *(const char **)(a1 + 72), bswap32(*(unsigned __int16 *)(a1 + 112)) >> 16, *(void *)(a1 + 80), *(const void **)(a1 + 88), (DNSServiceRegisterReply)sub_3668, *(void **)(a1 + 96));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_2CB4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a1 == 2)
  {
    v15 = (void **)(a4 + 16);
    v16 = (void *)(a4 + 16);
    while (1)
    {
      v16 = (void *)*v16;
      if (!v16) {
        break;
      }
      if (v16[2] == a2)
      {
        for (i = *v15; i != v16; i = (void *)*i)
          v15 = (void **)i;
        *v15 = (void *)*v16;
        unint64_t v18 = v16[4];
        if (v18)
        {
          for (unint64_t j = 0; j < v18; ++j)
          {
            v20 = *(NSObject **)(v16[5] + 8 * j);
            if (v20)
            {
              dispatch_source_cancel(v20);
              dispatch_release(*(dispatch_object_t *)(v16[5] + 8 * j));
              unint64_t v18 = v16[4];
            }
          }
        }
        free((void *)v16[5]);
        dispatch_release((dispatch_object_t)v16[3]);
        free(v16);
        return;
      }
    }
    return;
  }
  if (a1 != 1) {
    return;
  }
  v7 = (char *)malloc_type_malloc(0x30uLL, 0x10A0040716DF78EuLL);
  *((void *)v7 + 1) = *(void *)(a4 + 8);
  *((void *)v7 + 2) = a2;
  snprintf(__str, 0x64uLL, "com.apple.bonjour.registration.token%llu", a2);
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
  *((void *)v7 + 3) = dispatch_queue_create(__str, v9);
  *((void *)v7 + 4) = 0;
  v10 = (size_t *)(v7 + 32);
  *((void *)v7 + 5) = 0;
  *(void *)v7 = *(void *)(a4 + 16);
  *(void *)(a4 + 16) = v7;
  if (!xpc_dictionary_get_value(a3, "Bonjour"))
  {
    uint64_t v82 = 0;
    length = 0;
    *(void *)v85 = 0;
    v86 = v85;
    uint64_t v87 = 0x2000000000;
    int v88 = 0;
    xpc_object_t objects = 0;
    p_xpc_object_t objects = &objects;
    uint64_t v81 = 0x2000000000;
    unint64_t int64 = xpc_dictionary_get_int64(a3, "Flags");
    int v22 = int64;
    if (HIDWORD(int64))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3AD4();
      }
      int v22 = 0;
    }
    int64_t v23 = xpc_dictionary_get_int64(a3, "InterfaceIndex");
    int v24 = v23;
    if ((unint64_t)(v23 - 0x100000000) <= 0xFFFFFFFE7FFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3A58();
      }
      int v24 = 0;
    }
    string = xpc_dictionary_get_string(a3, "Name");
    v26 = xpc_dictionary_get_string(a3, "RegistrationType");
    v27 = xpc_dictionary_get_string(a3, "Domain");
    v28 = xpc_dictionary_get_string(a3, "Host");
    unint64_t v29 = xpc_dictionary_get_int64(a3, "Port");
    __int16 v30 = v29;
    if (v29 >= 0x10000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_39DC();
      }
      __int16 v30 = 0;
    }
    data = xpc_dictionary_get_data(a3, "TXTRecord", (size_t *)&length);
    size_t v32 = (size_t)length;
    if ((unint64_t)length >= 0x10000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_3960();
      }
      size_t v32 = 0;
      data = 0;
      length = 0;
    }
    v33 = *((void *)v7 + 3);
    *(void *)&block.ai_flags = _NSConcreteStackBlock;
    *(void *)&block.ai_sockxpc_type_t type = 0x40000000;
    *(void *)&block.ai_addrlen = sub_2C3C;
    block.ai_canonname = (char *)&unk_4190;
    block.ai_addr = (sockaddr *)v85;
    block.ai_next = (addrinfo *)&objects;
    int v76 = v22;
    int v77 = v24;
    v69 = string;
    v70 = v26;
    v71 = v27;
    v72 = v28;
    __int16 v78 = v30;
    size_t v73 = v32;
    v74 = data;
    v75 = v7;
    dispatch_sync(v33, &block);
    if (*((_DWORD *)v86 + 6))
    {
      _os_assumes_log();
    }
    else
    {
      dnssd_sock_t v34 = DNSServiceRefSockFD((DNSServiceRef)p_objects[3]);
      v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v34, 0, *((dispatch_queue_t *)v7 + 3));
      dispatch_set_context(v35, p_objects[3]);
      dispatch_source_set_event_handler_f(v35, (dispatch_function_t)&DNSServiceProcessResult);
      dispatch_source_set_cancel_handler_f(v35, (dispatch_function_t)&DNSServiceRefDeallocate);
      dispatch_resume(v35);
      if (v35)
      {
        *((void *)v7 + 4) = 1;
        v36 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
        *((void *)v7 + 5) = v36;
        void *v36 = v35;
      }
    }
    _Block_object_dispose(&objects, 8);
    _Block_object_dispose(v85, 8);
    return;
  }
  length = 0;
  xpc_object_t value = xpc_dictionary_get_value(a3, "Bonjour");
  v12 = value;
  xpc_object_t objects = value;
  if (!value)
  {
    _os_assumes_log();
    goto LABEL_48;
  }
  xpc_type_t type = xpc_get_type(value);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (v12 != &_xpc_BOOL_true) {
      _os_assumes_log();
    }
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v14 = xpc_array_create(&objects, 1uLL);
      goto LABEL_47;
    }
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      xpc_object_t v14 = xpc_retain(v12);
LABEL_47:
      v12 = v14;
      goto LABEL_48;
    }
  }
  v12 = 0;
LABEL_48:
  memset(&block, 0, sizeof(block));
  xpc_object_t v37 = xpc_dictionary_get_value(a3, "SockType");
  xpc_object_t objects = v37;
  if (!v37) {
    goto LABEL_54;
  }
  if (xpc_get_type(v37) != (xpc_type_t)&_xpc_type_string)
  {
LABEL_50:
    char v38 = 0;
    goto LABEL_56;
  }
  string_ptr = xpc_string_get_string_ptr(objects);
  if (!strcasecmp(string_ptr, "stream"))
  {
LABEL_54:
    int v41 = 1;
  }
  else
  {
    v40 = xpc_string_get_string_ptr(objects);
    if (strcasecmp(v40, "dgram")) {
      goto LABEL_50;
    }
    int v41 = 2;
  }
  block.ai_sockxpc_type_t type = v41;
  char v38 = 1;
LABEL_56:
  xpc_object_t v42 = xpc_dictionary_get_value(a3, "SockPassive");
  xpc_object_t objects = v42;
  if (v42)
  {
    int v43 = 1;
    if (v42 == &_xpc_BOOL_true)
    {
      block.ai_flags = 1;
      int v43 = 0;
    }
  }
  else
  {
    int v43 = 0;
    block.ai_flags = 1;
  }
  xpc_object_t v44 = xpc_dictionary_get_value(a3, "SockNodeName");
  xpc_object_t objects = v44;
  if (v44 && xpc_get_type(v44) == (xpc_type_t)&_xpc_type_string) {
    v45 = xpc_string_get_string_ptr(objects);
  }
  else {
    v45 = 0;
  }
  xpc_object_t v46 = xpc_dictionary_get_value(a3, "SockServiceName");
  xpc_object_t objects = v46;
  if (v46)
  {
    xpc_type_t v47 = xpc_get_type(v46);
    if (v47 == (xpc_type_t)&_xpc_type_int64)
    {
      int64_t v49 = xpc_int64_get_value(objects);
      v48 = v85;
      snprintf(v85, 0x15uLL, "%lld", v49);
      goto LABEL_70;
    }
    if (v47 == (xpc_type_t)&_xpc_type_string)
    {
      v48 = xpc_string_get_string_ptr(objects);
      goto LABEL_70;
    }
  }
  v48 = 0;
LABEL_70:
  xpc_object_t v50 = xpc_dictionary_get_value(a3, "SockFamily");
  xpc_object_t objects = v50;
  if (v50 && xpc_get_type(v50) == (xpc_type_t)&_xpc_type_string)
  {
    v51 = xpc_string_get_string_ptr(objects);
    if (!strcasecmp(v51, "IPv4"))
    {
      int v53 = 2;
      goto LABEL_76;
    }
    v52 = xpc_string_get_string_ptr(objects);
    if (!strcasecmp(v52, "IPv6"))
    {
      int v53 = 30;
LABEL_76:
      block.ai_family = v53;
    }
  }
  xpc_object_t v54 = xpc_dictionary_get_value(a3, "SockProtocol");
  xpc_object_t objects = v54;
  if (v54 && xpc_get_type(v54) == (xpc_type_t)&_xpc_type_string)
  {
    v55 = xpc_string_get_string_ptr(objects);
    if (!strcasecmp(v55, "TCP"))
    {
      int v57 = 6;
    }
    else
    {
      v56 = xpc_string_get_string_ptr(objects);
      if (strcasecmp(v56, "UDP")) {
        goto LABEL_84;
      }
      int v57 = 17;
    }
    block.ai_protocol = v57;
  }
LABEL_84:
  if (v38)
  {
    if (!v43) {
      goto LABEL_86;
    }
  }
  else
  {
    _os_assumes_log();
    if (!v43) {
      goto LABEL_86;
    }
  }
  _os_assumes_log();
LABEL_86:
  if (!((unint64_t)v45 | (unint64_t)v48)) {
    _os_assumes_log();
  }
  if (getaddrinfo(v45, v48, &block, &length))
  {
    _os_assumes_log();
    if (v12) {
LABEL_114:
    }
      xpc_release(v12);
  }
  else
  {
    size_t v58 = (size_t)length;
    if (length)
    {
      while (1)
      {
        int v59 = *(_DWORD *)(v58 + 4);
        BOOL v60 = v59 == 30 || v59 == 2;
        if (!v60 || (*(_DWORD *)(v58 + 8) - 1) > 1) {
          goto LABEL_108;
        }
        if (v12)
        {
          size_t count = xpc_array_get_count(v12);
          *((void *)v7 + 4) = count;
          *((void *)v7 + 5) = malloc_type_calloc(count, 8uLL, 0x2004093837F09uLL);
          if (!*((void *)v7 + 4)) {
            goto LABEL_108;
          }
          uint64_t v62 = 0;
          size_t v63 = 0;
          do
          {
            xpc_object_t v64 = xpc_array_get_value(v12, v63);
            if (xpc_get_type(v64) == (xpc_type_t)&_xpc_type_string)
            {
              v65 = xpc_string_get_string_ptr(v64);
              *(void *)(*((void *)v7 + 5) + 8 * v63) = sub_3690(v58, v65, *((NSObject **)v7 + 3));
              if (*(void *)(*((void *)v7 + 5) + 8 * v63)) {
                ++v62;
              }
            }
            else
            {
              _os_assumes_log();
            }
            ++v63;
            size_t v66 = *v10;
          }
          while (v63 < *v10);
        }
        else
        {
          *((void *)v7 + 4) = 1;
          *((void *)v7 + 5) = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
          **((void **)v7 + 5) = sub_3690(v58, v48, *((NSObject **)v7 + 3));
          size_t v66 = *((void *)v7 + 4);
          uint64_t v62 = **((void **)v7 + 5) != 0;
        }
        if (v62 == v66)
        {
          if (v62) {
            goto LABEL_111;
          }
        }
        else
        {
          _os_assumes_log();
          if (v62)
          {
LABEL_111:
            v67 = length;
            goto LABEL_113;
          }
        }
LABEL_108:
        size_t v58 = *(void *)(v58 + 40);
        if (!v58) {
          goto LABEL_111;
        }
      }
    }
    v67 = 0;
LABEL_113:
    freeaddrinfo(v67);
    if (v12) {
      goto LABEL_114;
    }
  }
}

void init_bonjour_registration(uint64_t a1)
{
  *(void *)malloc_type_calloc(1uLL, 0x18uLL, 0xA0040114AFA65uLL) = a1;
  xpc_event_provider_create();
}

uint64_t sub_3668(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    return _os_assumes_log();
  }
  return result;
}

NSObject *sub_3690(uint64_t a1, const char *a2, NSObject *a3)
{
  uint64_t v22 = 0;
  int64_t v23 = &v22;
  uint64_t v24 = 0x2000000000;
  int v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2000000000;
  uint64_t v21 = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(v5 + 1);
  if (v6 == 30)
  {
    if (!*(_DWORD *)(v5 + 8) && !*(_DWORD *)(v5 + 12) && !*(_DWORD *)(v5 + 16))
    {
      v8 = (_DWORD *)(v5 + 20);
      int v9 = 0x1000000;
LABEL_4:
      if (*v8 == v9) {
        int v7 = -1;
      }
      else {
        int v7 = 0;
      }
      goto LABEL_11;
    }
    int v7 = 0;
  }
  else
  {
    int v7 = 0;
    if (v6 == 2)
    {
      v8 = (_DWORD *)(v5 + 4);
      int v9 = 16777343;
      goto LABEL_4;
    }
  }
LABEL_11:
  if (*(_DWORD *)(a1 + 8) == 1) {
    v10 = "tcp";
  }
  else {
    v10 = "udp";
  }
  snprintf(__str, 0xC8uLL, "_%s._%s.", a2, v10);
  __int16 v11 = *(_WORD *)(*(void *)(a1 + 32) + 2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_38C8;
  block[3] = &unk_41B8;
  block[4] = &v22;
  block[5] = &v18;
  int v16 = v7;
  block[6] = __str;
  __int16 v17 = v11;
  dispatch_sync(a3, block);
  if (*((_DWORD *)v23 + 6))
  {
    _os_assumes_log();
    v13 = 0;
  }
  else
  {
    dnssd_sock_t v12 = DNSServiceRefSockFD((DNSServiceRef)v19[3]);
    v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v12, 0, a3);
    dispatch_set_context(v13, (void *)v19[3]);
    dispatch_source_set_event_handler_f(v13, (dispatch_function_t)&DNSServiceProcessResult);
    dispatch_source_set_cancel_handler_f(v13, (dispatch_function_t)&DNSServiceRefDeallocate);
    dispatch_resume(v13);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t sub_38C8(uint64_t a1)
{
  uint64_t result = DNSServiceRegister((DNSServiceRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0, *(_DWORD *)(a1 + 56), 0, *(const char **)(a1 + 48), 0, 0, *(_WORD *)(a1 + 60), 0, 0, 0, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_3944(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_3960()
{
  sub_3930();
  sub_3944(&dword_0, &_os_log_default, v0, "Invalid length for %s (%lu). Ignoring.", v1, v2, v3, v4, 2u);
}

void sub_39DC()
{
  sub_3930();
  sub_3944(&dword_0, &_os_log_default, v0, "Invalid value for %s (%lld). Using 0 instead.", v1, v2, v3, v4, 2u);
}

void sub_3A58()
{
  sub_3930();
  sub_3944(&dword_0, &_os_log_default, v0, "Invalid value for %s (%lld). Using 0 instead.", v1, v2, v3, v4, 2u);
}

void sub_3AD4()
{
  sub_3930();
  sub_3944(&dword_0, &_os_log_default, v0, "Invalid value for %s (%lld). Using 0 instead.", v1, v2, v3, v4, 2u);
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return _DNSServiceRefSockFD(sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return _DNSServiceRegister(sdRef, flags, interfaceIndex, name, regtype, domain, host, port, txtLen, txtRecord, callBack, context);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_event_provider_create()
{
  while (1)
    ;
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

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}