uint64_t deviceClassIsHomepod()
{
  return 0;
}

id nplog_obj()
{
  if (nplog_obj_log_once != -1) {
    dispatch_once(&nplog_obj_log_once, &__block_literal_global_10);
  }
  v0 = (void *)nplog_obj_g_log;
  return v0;
}

uint64_t __nplog_obj_block_invoke()
{
  nplog_obj_g_log = (uint64_t)os_log_create("com.apple.networkserviceproxy", "");
  return MEMORY[0x1F41817F8]();
}

id NPGetInternalQueue()
{
  if (qword_1EB53BD58 != -1) {
    dispatch_once(&qword_1EB53BD58, &__block_literal_global_251);
  }
  v0 = (void *)qword_1EB53BD50;
  return v0;
}

void sub_1A0FF2CC4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A0FF3AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
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

BOOL NetworkServiceProxyIsEnabled()
{
  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  return NetworkServiceProxyGetStatus() == 1;
}

uint64_t NetworkServiceProxyGetStatus()
{
  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  v0 = +[NSPManager sharedManager];
  int v1 = [v0 currentNetworkHasProxies];

  if (v1)
  {
    v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_INFO, "NSP is disabled because the current network has proxies", buf, 2u);
    }
    uint64_t v3 = 3;
  }
  else
  {
    v4 = +[NSPManager sharedManager];
    int v5 = [v4 isEnabled];

    if (v5) {
      return 1;
    }
    v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      uint64_t v3 = 2;
      _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_INFO, "NSP is disabled by the current configuration", v7, 2u);
    }
    else
    {
      uint64_t v3 = 2;
    }
  }

  return v3;
}

void sub_1A0FF4848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NetworkServiceProxyStart()
{
  +[NPTunnel initializeProtocol];
  if (qword_1EB53BAA8 != -1)
  {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
}

NPFlowProperties *createPropertiesFromMetaData(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v2 = [[NPFlowProperties alloc] initWithTLVData:v1]) == 0)
  {
    v2 = objc_alloc_init(NPFlowProperties);
  }

  return v2;
}

void sub_1A0FF493C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id createMetadataFromProperties(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1) {
    uint64_t v3 = (void *)[v1 copyTLVData];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1A0FF49A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NetworkServiceProxySetServiceNameForConnection(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 _TCPConnectionMetadata];
  v6 = createPropertiesFromMetaData(v5);

  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  [v6 setServiceID:serviceNameToID(v4)];
  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 serviceID];
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "Setting service name to %@ (%llu)", (uint8_t *)&v12, 0x16u);
  }

  if (![v6 timestamps])
  {
    if (g_recordTimestamps)
    {
      v8 = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
      v9 = v8;
      if (v8)
      {
        v8[14] = 0;
        *((_OWORD *)v8 + 5) = 0u;
        *((_OWORD *)v8 + 6) = 0u;
        *((_OWORD *)v8 + 3) = 0u;
        *((_OWORD *)v8 + 4) = 0u;
        *((_OWORD *)v8 + 1) = 0u;
        *((_OWORD *)v8 + 2) = 0u;
        *(_OWORD *)v8 = 0u;
      }
    }
    else
    {
      v9 = 0;
    }
    [v6 setTimestamps:v9];
  }
  uint64_t v10 = (uint64_t *)[v6 timestamps];
  if (v10 && g_recordTimestamps && !*v10) {
    *uint64_t v10 = mach_absolute_time();
  }
  v11 = createMetadataFromProperties(v6);
  if (v11) {
    objc_msgSend(v3, "set_TCPConnectionMetadata:", v11);
  }
  kdebug_trace();
}

void sub_1A0FF4BBC(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t serviceNameToID(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (const char *)[v1 UTF8String];
    uint64_t v3 = (uint64_t)v2;
    if (v2)
    {
      strlen(v2);
      uint64_t v3 = SipHash();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1A0FF4C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NetworkServiceProxySetServiceNameForTask(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 _TCPConnectionMetadata];
  v6 = createPropertiesFromMetaData(v5);

  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  [v6 setServiceID:serviceNameToID(v4)];
  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = [v6 serviceID];
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "Setting service name to %@ (%llu)", (uint8_t *)&v9, 0x16u);
  }

  v8 = createMetadataFromProperties(v6);
  if (v8) {
    objc_msgSend(v3, "set_TCPConnectionMetadata:", v8);
  }
  kdebug_trace();
}

void sub_1A0FF4E28(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetFallbackTimeout(void *a1, uint64_t a2)
{
  id v6 = a1;
  id v3 = [v6 _TCPConnectionMetadata];
  id v4 = createPropertiesFromMetaData(v3);

  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  [v4 setFallbackTimeout:(double)a2];
  int v5 = createMetadataFromProperties(v4);
  if (v5) {
    objc_msgSend(v6, "set_TCPConnectionMetadata:", v5);
  }
}

void sub_1A0FF4F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetCurrentLocation(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = getSigningIdentifier();
  if (v6)
  {
    v7 = getServerConnection();
    [v7 setCurrentLatitude:v5 longitude:v6 timestamp:a2 forClient:a3];
  }
  else
  {
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier, cannot set the current location", v8, 2u);
    }
  }
}

void sub_1A0FF5050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getSigningIdentifier()
{
  if (qword_1EB53BAA0 != -1) {
    dispatch_once(&qword_1EB53BAA0, &__block_literal_global_48);
  }
  v0 = (void *)qword_1EB53BA98;
  return v0;
}

id getServerConnection()
{
  if (qword_1EB53BA90 != -1) {
    dispatch_once(&qword_1EB53BA90, &__block_literal_global_45);
  }
  v0 = (void *)qword_1EB53BA88;
  return v0;
}

uint64_t createObjectsFromDictionary()
{
  v0 = (void *)MEMORY[0x1F4188790]();
  v2 = v1;
  id v4 = v3;
  id v6 = v5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = v0;
  id v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v11 = 0;
    id v12 = 0;
    goto LABEL_7;
  }
  int v9 = [v7 objectForKeyedSubscript:@"appRule"];
  if (!v9)
  {
    __int16 v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      __int16 v11 = 0;
      id v12 = 0;
LABEL_44:
      uint64_t v13 = 0;
      goto LABEL_45;
    }
    int buffer = 138412290;
    v44 = @"appRule";
    uint64_t v15 = "Failed to set the NSP configuration: dictionary is missing the %@ key";
LABEL_47:
    _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&buffer, 0xCu);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int buffer = 138412290;
    v44 = @"appRule";
    uint64_t v15 = "Failed to set the NSP configuration: %@ key is not a dictionary";
    goto LABEL_47;
  }
  v39 = (void *)[v9 mutableCopy];
  v40 = [v39 objectForKeyedSubscript:@"app"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = (id)[v40 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v16 = v10;
  [v10 setObject:v8 forKeyedSubscript:@"label"];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"bundle"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v19 = getSigningIdentifier();
    if (!v19)
    {
      v31 = nplog_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buffer) = 0;
        _os_log_error_impl(&dword_1A0FEE000, v31, OS_LOG_TYPE_ERROR, "Failed to get the current process' signing identifier", (uint8_t *)&buffer, 2u);
      }

      goto LABEL_37;
    }
    v20 = (void *)v19;
    [v16 setObject:v19 forKeyedSubscript:@"bundle"];
  }
  v21 = [v16 objectForKeyedSubscript:@"ExecutablePath"];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22) {
    goto LABEL_19;
  }
  pid_t v23 = getpid();
  if (proc_pidpath(v23, &buffer, 0x1000u) <= 0)
  {
    v32 = nplog_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v35 = __error();
      v36 = strerror(*v35);
      *(_DWORD *)buf = 136315138;
      v42 = v36;
      _os_log_error_impl(&dword_1A0FEE000, v32, OS_LOG_TYPE_ERROR, "Failed to get the current process' path: %s", buf, 0xCu);
    }

LABEL_37:
    __int16 v11 = 0;
    id v12 = 0;
    BOOL v26 = 1;
    goto LABEL_43;
  }
  v24 = [NSString stringWithUTF8String:&buffer];
  [v16 setObject:v24 forKeyedSubscript:@"ExecutablePath"];

LABEL_19:
  v38 = [v7 objectForKeyedSubscript:@"edgeSet"];
  if (v38)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = nplog_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int buffer = 138412290;
        v44 = @"edgeSet";
        _os_log_error_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_ERROR, "Failed to set the NSP configuration: %@ key is not a dictionary", (uint8_t *)&buffer, 0xCu);
      }
      __int16 v11 = 0;
      id v12 = 0;
      BOOL v26 = 1;
      goto LABEL_30;
    }
    [v16 removeObjectForKey:@"edges"];
  }
  [v39 setObject:v16 forKeyedSubscript:@"app"];
  id v25 = [[NSPAppRule alloc] initFromDictionary:v39];
  id v12 = v25;
  __int16 v11 = 0;
  BOOL v26 = v25 == 0;
  if (!v38 || !v25) {
    goto LABEL_42;
  }
  v37 = [NPWaldo alloc];
  v27 = [v12 matchSigningIdentifier];
  __int16 v11 = [(NPWaldo *)v37 initWithIdentifier:v27 timestamp:&unk_1EF43BCB8 fromDictionary:v38 source:2];

  if (!v11)
  {
    v33 = nplog_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer) = 0;
      _os_log_error_impl(&dword_1A0FEE000, v33, OS_LOG_TYPE_ERROR, "Invalid edge set, disabling app rule", (uint8_t *)&buffer, 2u);
    }

    __int16 v11 = 0;
    [v12 setEnabled:MEMORY[0x1E4F1CC28]];
    goto LABEL_41;
  }
  v28 = [v12 requireTFO];
  BOOL v29 = v28 == 0;

  if (v29)
  {
LABEL_41:
    BOOL v26 = 0;
    goto LABEL_42;
  }
  v30 = [v12 requireTFO];
  [(NPWaldo *)v11 setRequireTFO:v30];
  BOOL v26 = 0;
LABEL_30:

LABEL_42:
LABEL_43:

  if (v26) {
    goto LABEL_44;
  }
LABEL_7:
  id v12 = v12;
  void *v4 = v12;
  __int16 v11 = v11;
  void *v2 = v11;
  uint64_t v13 = 1;
LABEL_45:

  return v13;
}

void sub_1A0FF5748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t NetworkServiceProxySetCurrentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
}

BOOL NetworkServiceProxyEnableForSessionTask(void *a1)
{
  id v1 = a1;
  v2 = [v1 _TCPConnectionMetadata];
  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  kdebug_trace();
  id v3 = createPropertiesFromMetaData(v2);
  [v3 setEnableNSP:1];
  if (![v3 timestamps])
  {
    if (g_recordTimestamps)
    {
      id v4 = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
      id v5 = v4;
      if (v4)
      {
        v4[14] = 0;
        *((_OWORD *)v4 + 5) = 0u;
        *((_OWORD *)v4 + 6) = 0u;
        *((_OWORD *)v4 + 3) = 0u;
        *((_OWORD *)v4 + 4) = 0u;
        *((_OWORD *)v4 + 1) = 0u;
        *((_OWORD *)v4 + 2) = 0u;
        *(_OWORD *)id v4 = 0u;
      }
    }
    else
    {
      id v5 = 0;
    }
    [v3 setTimestamps:v5];
  }
  id v6 = (uint64_t *)[v3 timestamps];
  if (v6 && g_recordTimestamps && !*v6) {
    uint64_t *v6 = mach_absolute_time();
  }
  if (([v1 _preconnect] & 1) == 0)
  {
    id v7 = [v1 originalRequest];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (id v8 = v7, [v8 _CFURLRequest])
      && (int v9 = (__CFHTTPMessage *)CFURLRequestCopyHTTPRequest()) != 0)
    {
      id v10 = v8;
      __int16 v11 = [v10 allHTTPHeaderFields];
      id v12 = [v11 objectForKeyedSubscript:@"Host"];
      if (![v12 length])
      {
        uint64_t v13 = [v10 URL];
        __int16 v14 = [v13 host];

        if ([(__CFString *)v14 length])
        {
          id v12 = v14;
          CFHTTPMessageSetHeaderFieldValue(v9, @"Host", v14);
        }
        else
        {
          uint64_t v18 = nplog_obj();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v27 = 0;
            _os_log_error_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_ERROR, "Failed to derive the request Host: header", v27, 2u);
          }

          id v12 = v14;
        }
      }
      uint64_t v19 = [v11 objectForKeyedSubscript:@"Accept"];
      uint64_t v20 = [v19 length];

      if (!v20) {
        CFHTTPMessageSetHeaderFieldValue(v9, @"Accept", @"*/*");
      }
      v21 = [v11 objectForKeyedSubscript:@"Accept-Language"];
      uint64_t v22 = [v21 length];

      if (!v22)
      {
        if (qword_1EB53BAB8 != -1) {
          dispatch_once(&qword_1EB53BAB8, &__block_literal_global_78);
        }
        CFHTTPMessageSetHeaderFieldValue(v9, @"Accept-Language", (CFStringRef)qword_1EB53BAB0);
      }
      pid_t v23 = [v11 objectForKeyedSubscript:@"Accept-Encoding"];
      uint64_t v24 = [v23 length];

      if (!v24) {
        CFHTTPMessageSetHeaderFieldValue(v9, @"Accept-Encoding", @"br, gzip, deflate");
      }
      id v25 = [v11 objectForKeyedSubscript:@"keep-alive"];
      uint64_t v26 = [v25 length];

      if (!v26) {
        CFHTTPMessageSetHeaderFieldValue(v9, @"Connection", @"keep-alive");
      }

      CFDataRef v15 = CFHTTPMessageCopySerializedMessage(v9);
      CFRelease(v9);
    }
    else
    {
      CFDataRef v15 = 0;
    }

    if (v15) {
      [v3 setRequestData:v15];
    }
  }
  uint64_t v16 = createMetadataFromProperties(v3);
  if (v16) {
    objc_msgSend(v1, "set_TCPConnectionMetadata:", v16);
  }

  return v16 != 0;
}

void sub_1A0FF5C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NetworkServiceProxyEnableInParameters(void *a1)
{
  id v13 = a1;
  id v1 = (void *)nw_parameters_copy_metadata();
  if (qword_1EB53BAA8 != -1) {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
  }
  [@"com.apple.NetworkServiceProxy" UTF8String];
  nw_parameters_set_account_id();
  if (v1 && MEMORY[0x1A622BC50](v1) == MEMORY[0x1E4F14580])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    v2 = (void *)[v3 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v1) freeWhenDone:0];
  }
  else
  {
    v2 = 0;
  }
  id v5 = createPropertiesFromMetaData(v2);
  [v5 setEnableNSP:1];
  if (![v5 timestamps])
  {
    if (g_recordTimestamps)
    {
      id v6 = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
      id v7 = v6;
      if (v6)
      {
        v6[14] = 0;
        *((_OWORD *)v6 + 5) = 0u;
        *((_OWORD *)v6 + 6) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *((_OWORD *)v6 + 4) = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        *((_OWORD *)v6 + 2) = 0u;
        *(_OWORD *)id v6 = 0u;
      }
    }
    else
    {
      id v7 = 0;
    }
    [v5 setTimestamps:v7];
  }
  id v8 = (uint64_t *)[v5 timestamps];
  if (v8 && g_recordTimestamps && !*v8) {
    uint64_t *v8 = mach_absolute_time();
  }
  int v9 = createMetadataFromProperties(v5);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    xpc_object_t v12 = xpc_data_create((const void *)[v11 bytes], objc_msgSend(v11, "length"));
    nw_parameters_set_metadata();
  }
}

void sub_1A0FF5EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void NetworkServiceProxySetServiceNameInParameters(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = nw_parameters_copy_metadata();
  id v6 = (void *)v5;
  if (qword_1EB53BAA8 == -1)
  {
    if (!v5)
    {
LABEL_4:
      id v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_1EB53BAA8, &__block_literal_global_50);
    if (!v6) {
      goto LABEL_4;
    }
  }
  if (MEMORY[0x1A622BC50](v6) != MEMORY[0x1E4F14580]) {
    goto LABEL_4;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  bytes_ptr = xpc_data_get_bytes_ptr(v6);
  id v7 = (void *)[v8 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v6) freeWhenDone:0];
LABEL_6:
  id v10 = createPropertiesFromMetaData(v7);
  [v10 setServiceID:serviceNameToID(v4)];
  id v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = [v10 serviceID];
    _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "Setting service name to %@ (%llu)", (uint8_t *)&v16, 0x16u);
  }

  xpc_object_t v12 = createMetadataFromProperties(v10);
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
    xpc_object_t v15 = xpc_data_create((const void *)[v14 bytes], objc_msgSend(v14, "length"));
    nw_parameters_set_metadata();
  }
}

void sub_1A0FF613C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL NetworkServiceProxySetRemoteEndpointsForSessionTask(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 _TCPConnectionMetadata];
  if (![v4 count])
  {
    id v11 = 0;
    goto LABEL_9;
  }
  id v6 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = [(NPTunnelTuscanyEndpoint *)v6 hosts];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [v4 count];

    if (v9 == v10)
    {
      id v11 = v7;
LABEL_9:
      +[NPTunnel initializeProtocol];
      xpc_object_t v12 = createPropertiesFromMetaData(v5);
      [v12 setReplacementEndpoint:v11];
      id v14 = createMetadataFromProperties(v12);
      BOOL v13 = v14 != 0;
      if (v14)
      {
        objc_msgSend(v3, "set_TCPConnectionMetadata:", v14);
      }
      else
      {
        xpc_object_t v15 = nplog_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17) = 0;
          _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Failed to create meta-data from properties in NetworkServiceProxySetRemoteEndpointsForSessionTask", (uint8_t *)&v17, 2u);
        }
      }
      id v7 = v11;
      goto LABEL_15;
    }
  }
  xpc_object_t v12 = nplog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, "Invalid endpoints passed to NetworkServiceProxySetRemoteEndpointsForSessionTask: %@", (uint8_t *)&v17, 0xCu);
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

void sub_1A0FF63B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NetworkServiceProxySetRemoteAddressMapForSessionTask(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v22 = a2;
  id v4 = [v3 _TCPConnectionMetadata];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v22;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v6)
  {
    id v25 = v4;
    uint64_t v26 = *(void *)v32;
    id v24 = v3;
LABEL_3:
    uint64_t v23 = v6;
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v32 != v26) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(NSObject **)(*((void *)&v31 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = nplog_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v8;
          __int16 v37 = 2112;
          v38 = v9;
          _os_log_error_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_ERROR, "Set of addresses in address map for hostname %@ is not an NSSet: (%@)", buf, 0x16u);
        }

        goto LABEL_33;
      }
      uint64_t v10 = v5;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v11);
            }
            xpc_object_t v15 = *(NSObject **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v18 = nplog_obj();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v36 = v15;
                __int16 v37 = 2112;
                v38 = v8;
                _os_log_error_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_ERROR, "Address (%@) in address map for hostname %@ is not a string", buf, 0x16u);
              }

              id v3 = v24;
              id v4 = v25;
              id v5 = v10;

              uint64_t v17 = 0;
              uint64_t v9 = v11;
              goto LABEL_23;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v3 = v24;
      id v4 = v25;
      id v5 = v10;

      if (++v7 == v23)
      {
        uint64_t v6 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    uint64_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Hostname (%@) in addressMap parameter is not a string", buf, 0xCu);
    }
LABEL_33:
    uint64_t v17 = 0;
LABEL_23:
    int v16 = v5;
    goto LABEL_24;
  }
LABEL_18:

  +[NPTunnel initializeProtocol];
  int v16 = createPropertiesFromMetaData(v4);
  [v16 setReplacementAddressMap:v5];
  uint64_t v9 = createMetadataFromProperties(v16);
  if (v9)
  {
    objc_msgSend(v3, "set_TCPConnectionMetadata:", v9);
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v20 = nplog_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_ERROR, "Failed to create meta-data from properties in NetworkServiceProxySetRemoteEndpointMapForSessionTask", buf, 2u);
    }

    uint64_t v9 = 0;
    uint64_t v17 = 0;
  }
LABEL_24:

  return v17;
}

void sub_1A0FF6828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t myIsEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A0FF6924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id copySystemVersionDictionary()
{
  if (qword_1EB53BA80 != -1) {
    dispatch_once(&qword_1EB53BA80, &__block_literal_global);
  }
  v0 = (void *)_MergedGlobals_29;
  return v0;
}

uint64_t __copySystemVersionDictionary_block_invoke()
{
  _MergedGlobals_29 = _CFCopySystemVersionDictionary();
  return MEMORY[0x1F41817F8]();
}

id copyOSNameString()
{
  v0 = (void *)MGCopyAnswer();
  return v0;
}

id copyOSVersionString()
{
  v0 = (void *)MGCopyAnswer();
  return v0;
}

id copyOSBuildString()
{
  v0 = copySystemVersionDictionary();
  id v1 = [v0 objectForKey:*MEMORY[0x1E4F1CD10]];

  return v1;
}

void sub_1A0FF6A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id copyProductTypeString()
{
  v0 = (void *)MGCopyAnswer();
  return v0;
}

uint64_t __getServerConnection_block_invoke()
{
  qword_1EB53BA88 = (uint64_t)-[NSPServerClient initWithCallbackQueue:]([NSPServerClient alloc], 0);
  return MEMORY[0x1F41817F8]();
}

id latitudeLongitudeToGeohash(unint64_t a1, double a2, double a3)
{
  unint64_t v3 = a1;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1 > 0xC)
  {
    unint64_t v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v23 = 134217984;
      unint64_t v24 = v3;
      _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "Geohash length is too big (%lu), maximum is 12", (uint8_t *)&v23, 0xCu);
    }

LABEL_25:
    uint64_t v20 = 0;
    goto LABEL_26;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 1 << (5 * a1 - 1);
  double v7 = 90.0;
  double v8 = -180.0;
  double v9 = 180.0;
  double v10 = -90.0;
  do
  {
    double v11 = v8 + (v9 - v8) * 0.5;
    if (v11 <= a3) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0;
    }
    v5 |= v12;
    if (v6 == 1) {
      break;
    }
    if (v11 <= a3) {
      double v8 = v8 + (v9 - v8) * 0.5;
    }
    else {
      double v9 = v8 + (v9 - v8) * 0.5;
    }
    unint64_t v13 = v6 >> 1;
    if (v10 + (v7 - v10) * 0.5 <= a2)
    {
      double v10 = v10 + (v7 - v10) * 0.5;
    }
    else
    {
      double v7 = v10 + (v7 - v10) * 0.5;
      unint64_t v13 = 0;
    }
    v5 |= v13;
    BOOL v14 = v6 > 3;
    v6 >>= 2;
  }
  while (v14);
  unint64_t v15 = a1 + 1;
  int v16 = malloc_type_malloc(a1 + 1, 0xC1886358uLL);
  if (!v16)
  {
    v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 134217984;
      unint64_t v24 = v15;
      _os_log_error_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the geohash", (uint8_t *)&v23, 0xCu);
    }

    goto LABEL_25;
  }
  uint64_t v17 = v16;
  bzero(v16, v3 + 1);
  if (v3)
  {
    uint64_t v18 = 5 * v3 - 5;
    uint64_t v19 = v17;
    do
    {
      *v19++ = a0123456789bcde[(v5 >> v18) & 0x1F];
      v18 -= 5;
      --v3;
    }
    while (v3);
  }
  uint64_t v20 = (void *)[[NSString alloc] initWithCString:v17 encoding:4];
  free(v17);
LABEL_26:
  return v20;
}

BOOL geohashToLatitudeLongitude(void *a1, double *a2, double *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  unint64_t v6 = (const char *)[v5 UTF8String];
  char v7 = strlen(v6);
  *a3 = 0.0;
  *a2 = 0.0;
  size_t v8 = strlen(v6);
  if (!v8)
  {
    uint64_t v11 = 0;
LABEL_12:
    unint64_t v16 = 1 << (5 * v7 - 1);
    double v17 = -90.0;
    double v18 = 90.0;
    double v19 = -180.0;
    double v20 = 180.0;
    do
    {
      if ((v16 & v11) != 0) {
        double v19 = v19 + (v20 - v19) * 0.5;
      }
      else {
        double v20 = v19 + (v20 - v19) * 0.5;
      }
      if (v16 == 1) {
        break;
      }
      if ((v11 & (v16 >> 1)) != 0) {
        double v17 = v17 + (v18 - v17) * 0.5;
      }
      else {
        double v18 = v17 + (v18 - v17) * 0.5;
      }
      BOOL v21 = v16 > 3;
      v16 >>= 2;
    }
    while (v21);
    *a3 = v19 + (v19 - v20) * 0.5;
    *a2 = v17 + (v17 - v18) * 0.5;
    BOOL v14 = 1;
    goto LABEL_22;
  }
  size_t v9 = v8;
  double v10 = memchr("0123456789bcdefghjkmnpqrstuvwxyz", *v6, 0x21uLL);
  if (v10)
  {
    uint64_t v11 = 0;
    size_t v12 = 0;
    char v13 = 5 * v7 - 5;
    while (1)
    {
      v11 |= (v10 - "0123456789bcdefghjkmnpqrstuvwxyz") << v13;
      if (v9 - 1 == v12) {
        goto LABEL_12;
      }
      double v10 = memchr("0123456789bcdefghjkmnpqrstuvwxyz", v6[v12 + 1], 0x21uLL);
      v13 -= 5;
      ++v12;
      if (!v10)
      {
        BOOL v14 = v12 >= v9;
        goto LABEL_9;
      }
    }
  }
  size_t v12 = 0;
  BOOL v14 = 0;
LABEL_9:
  unint64_t v15 = nplog_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v23 = v6[v12];
    *(_DWORD *)buf = 138412546;
    id v25 = v5;
    __int16 v26 = 1024;
    int v27 = v23;
    _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Invalid character in geohash %@: %c", buf, 0x12u);
  }

LABEL_22:
  return v14;
}

void sub_1A0FF6F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t getRTTFromFrame(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ((unint64_t)[v1 length] <= 7)
  {
    v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      uint64_t v7 = [v1 length];
      _os_log_error_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_ERROR, "Received data is less than an RTT-frame: %lu", (uint8_t *)&v6, 0xCu);
    }

    goto LABEL_8;
  }
  unsigned int v3 = *(_DWORD *)[v1 bytes];
  if (!v3)
  {
LABEL_8:
    unint64_t v4 = 0xFFFFFFFFLL;
    goto LABEL_9;
  }
  if (v3 >= 0x3E8) {
    unint64_t v4 = (unint64_t)((double)v3 / 1000.0);
  }
  else {
    unint64_t v4 = 1;
  }
LABEL_9:

  return v4;
}

void sub_1A0FF70C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getSigningIdentifier_block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    id v1 = v0;
    CFErrorRef error = 0;
    CFStringRef v2 = SecTaskCopySigningIdentifier(v0, &error);
    unsigned int v3 = (void *)qword_1EB53BA98;
    qword_1EB53BA98 = (uint64_t)v2;

    if (qword_1EB53BA98)
    {
LABEL_11:
      if (error) {
        CFRelease(error);
      }
      CFRelease(v1);
      return;
    }
    CFErrorRef v4 = error;
    id v5 = nplog_obj();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v13 = error;
        uint64_t v7 = "Failed to obtain the signing identifier: %@";
        uint64_t v8 = v5;
        uint32_t v9 = 12;
LABEL_15:
        _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Failed to obtain the signing identifier";
      uint64_t v8 = v5;
      uint32_t v9 = 2;
      goto LABEL_15;
    }

    goto LABEL_11;
  }
  double v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a SecTask for self", buf, 2u);
  }
}

uint64_t getDesignatedRequirement()
{
  return 0;
}

void logHTTPRequestData(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CFStringRef v2 = nplog_obj();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    if ((unint64_t)[v1 length] > 0x3E7) {
      size_t v4 = 1000;
    }
    else {
      size_t v4 = [v1 length];
    }
    bzero(__dst, 0x3E8uLL);
    memcpy(__dst, (const void *)[v1 bytes], v4);
    if (v4)
    {
      id v5 = __dst;
      do
      {
        if ((char)*v5 <= 31) {
          *id v5 = 32;
        }
        ++v5;
        --v4;
      }
      while (v4);
    }
    BOOL v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      uint64_t v8 = __dst;
      _os_log_debug_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
    }
  }
}

void sub_1A0FF73B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL30NetworkServiceProxyInitializerv_block_invoke()
{
  id v0 = +[NSPManager sharedManager];
  [v0 start];
}

void sub_1A0FF741C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL28getHTTPPreferredLanguageCodev_block_invoke()
{
  id v0 = (void *)CFPreferencesCopyAppValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v0 count])
      {
        id v1 = [v0 objectAtIndexedSubscript:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v2 = v1;
          if (!CFBundleGetLocalizationInfoForLocalization()
            || (BOOL v3 = (void *)CFBundleCopyLocalizationForLocalizationInfo(), (v4 = v3) == 0)
            || (id v5 = (void *)[v3 mutableCopy], CFRelease(v4), !v5))
          {
            id v5 = (void *)[v2 mutableCopy];
          }
          if ((unint64_t)[v5 length] >= 4) {
            objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"_", @"-", 0, 0, objc_msgSend(v5, "length"));
          }
          BOOL v6 = [v5 lowercaseString];
          if ([(__CFString *)v6 isEqualToString:@"ru-ru"])
          {

            BOOL v6 = @"ru";
          }

          int v7 = (void *)qword_1EB53BAB0;
          qword_1EB53BAB0 = (uint64_t)v6;
        }
      }
    }
  }
  if (!qword_1EB53BAB0) {
    qword_1EB53BAB0 = @"en";
  }
}

void sub_1A0FF7610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A0FF7C3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

long long *np_loopback_protocol_get_id()
{
  if (_MergedGlobals_30 != -1) {
    dispatch_once(&_MergedGlobals_30, &__block_literal_global_0);
  }
  return &xmmword_1EB53BAC8;
}

void __np_loopback_protocol_get_id_block_invoke()
{
  unk_1EB53BBC0 = 0u;
  unk_1EB53BBB0 = 0u;
  *(_OWORD *)&qword_1EB53BBA0 = 0u;
  unk_1EB53BB90 = 0u;
  unk_1EB53BB80 = 0u;
  unk_1EB53BB70 = 0u;
  unk_1EB53BB60 = 0u;
  *(_OWORD *)&qword_1EB53BB50 = 0u;
  *(_OWORD *)&qword_1EB53BB40 = 0u;
  *(_OWORD *)algn_1EB53BB30 = 0u;
  unk_1EB53BB20 = 0u;
  *(_OWORD *)&qword_1EB53BB10 = 0u;
  unk_1EB53BB00 = 0u;
  xmmword_1EB53BBE0 = 0u;
  unk_1EB53BBF0 = 0u;
  xmmword_1EB53BBD0 = 0u;
  xmmword_1EB53BAF0 = 0u;
  qword_1EB53BAE8 = 0;
  xmmword_1EB53BAC8 = 0u;
  unk_1EB53BAD8 = 0u;
  __strlcpy_chk();
  qword_1EB53BAE8 = 0x100000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&xmmword_1EB53BAF0 = np_loopback_add_input_handler;
  *((void *)&xmmword_1EB53BAF0 + 1) = np_loopback_remove_input_handler;
  qword_1EB53BB40 = (uint64_t)np_loopback_get_input_frames;
  qword_1EB53BB48 = (uint64_t)np_loopback_get_output_frames;
  qword_1EB53BB50 = (uint64_t)np_loopback_finalize_output_frames;
  qword_1EB53BBA0 = (uint64_t)np_loopback_supports_external_data;
  qword_1EB53BBC8 = (uint64_t)np_loopback_waiting_for_output;
  qword_1EB53BB18 = (uint64_t)np_loopback_connected;
  qword_1EB53BB28 = (uint64_t)np_loopback_error;
  qword_1EB53BB08 = (uint64_t)np_loopback_connect;
  qword_1EB53BB10 = (uint64_t)np_loopback_disconnect;
  if ((nw_protocol_register_extended() & 1) == 0)
  {
    id v0 = nplog_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v1 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v0, OS_LOG_TYPE_ERROR, "Failed to register the np_tunnel_flow protocol", v1, 2u);
    }
  }
}

uint64_t np_loopback_add_input_handler(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(void **)(a1 + 40);
  *(void *)(a2 + 32) = a1;
  *(void *)(a1 + 48) = a2;
  id v4 = v3;
  uuid_copy((unsigned __int8 *)[v4 protocol], (const unsigned __int8 *)a2);

  return 1;
}

BOOL np_loopback_remove_input_handler(void *a1, uint64_t a2, int a3)
{
  *(void *)(a2 + 32) = 0;
  uint64_t v4 = a1[6];
  if (v4 == a2)
  {
    a1[6] = 0;
    uint64_t v7 = a1[4];
    if (v7) {
      (*(void (**)(void))(*(void *)(v7 + 24) + 8))();
    }
    if (a3)
    {
      uint64_t v8 = (void *)a1[5];
      [v8 handleDetachedFromProtocol];
      a1[5] = 0;
    }
  }
  return v4 == a2;
}

uint64_t np_loopback_get_input_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 40) addInputFramesToArray:a6 maximumBytes:a4 minimumBytes:a3 maximumFrameCount:a5];
}

uint64_t np_loopback_get_output_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 40) addOutputFramesToArray:a6 maximumBytes:a4 minimumBytes:a3 maximumFrameCount:a5];
}

uint64_t np_loopback_finalize_output_frames(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  nw_frame_array_foreach();
  [v1 notifyInputHandler];

  return 1;
}

uint64_t np_loopback_supports_external_data(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 48) + 24) + 176))();
}

uint64_t np_loopback_waiting_for_output(uint64_t a1)
{
  return [*(id *)(a1 + 40) waitingForOutput];
}

uint64_t np_loopback_connected(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(result + 48) + 24) + 40))();
  }
  return result;
}

uint64_t np_loopback_error(uint64_t result)
{
  if (result)
  {
    result = *(void *)(result + 48);
    if (result) {
      return (*(uint64_t (**)(void))(*(void *)(result + 24) + 56))();
    }
  }
  return result;
}

uint64_t np_loopback_connect(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  [v2 setWaitingForOutput:1];
  BOOL v3 = (*(void (**)(uint64_t))(*(void *)(a1 + 24) + 112))(a1);
  uint64_t v4 = (void *)nw_parameters_copy_context();
  uint64_t v7 = v2;
  id v5 = v2;
  nw_queue_context_async();

  return 1;
}

void np_loopback_disconnect(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  BOOL v3 = (*(void (**)(uint64_t))(*(void *)(a1 + 24) + 112))(a1);
  uint64_t v4 = (void *)nw_parameters_copy_context();
  BOOL v6 = v2;
  id v5 = v2;
  nw_queue_context_async();
}

uint64_t np_loopback_protocol_create(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (_MergedGlobals_30 != -1) {
    dispatch_once(&_MergedGlobals_30, &__block_literal_global_0);
  }
  if (nw_protocols_are_equal()
    && (BOOL v6 = objc_alloc_init(NPTuscanyLoopbackConnection)) != 0)
  {
    uint64_t v7 = v6;
    *(void *)([(NPTuscanyLoopbackConnection *)v7 protocol] + 40) = v7;
    uint64_t v8 = [(NPTuscanyLoopbackConnection *)v7 protocol];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void np_loopback_output_frame_finalizer(void *a1, int a2, void *a3)
{
  if (a2) {
    [a3 handleOutputFrame:a1];
  }
  else {
    np_loopback_input_frame_finalizer(a1);
  }
}

void sub_1A0FF94A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void np_loopback_input_frame_finalizer(void *a1)
{
  id v1 = a1;
  int buffer = (void *)nw_frame_get_buffer();
  nw_frame_reset();

  free(buffer);
}

uint64_t __np_loopback_finalize_output_frames_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  nw_frame_array_remove();
  nw_frame_finalize();

  return 1;
}

uint64_t __np_loopback_connect_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) protocol];
  if (*(void *)(result + 48))
  {
    id v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)([*(id *)(a1 + 32) protocol]
                                                                            + 48)
                                                                + 24)
                                                    + 40);
    uint64_t v3 = *(void *)([*(id *)(a1 + 32) protocol] + 48);
    uint64_t v4 = [*(id *)(a1 + 32) protocol];
    return v5(v3, v4);
  }
  return result;
}

uint64_t __np_loopback_disconnect_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) protocol];
  if (*(void *)(result + 48))
  {
    id v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)([*(id *)(a1 + 32) protocol]
                                                                            + 48)
                                                                + 24)
                                                    + 48);
    uint64_t v3 = *(void *)([*(id *)(a1 + 32) protocol] + 48);
    uint64_t v4 = [*(id *)(a1 + 32) protocol];
    return v5(v3, v4);
  }
  return result;
}

uint64_t isa_nsstring(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t isa_nsdata(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_1A0FFD9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

long long *np_direct_protocol_get_id()
{
  if (_MergedGlobals_31 != -1) {
    dispatch_once(&_MergedGlobals_31, &__block_literal_global_1);
  }
  return &xmmword_1EB53BC08;
}

void __np_direct_protocol_get_id_block_invoke()
{
  unk_1EB53BD00 = 0u;
  unk_1EB53BCF0 = 0u;
  *(_OWORD *)&qword_1EB53BCE0 = 0u;
  unk_1EB53BCD0 = 0u;
  unk_1EB53BCC0 = 0u;
  unk_1EB53BCB0 = 0u;
  unk_1EB53BCA0 = 0u;
  *(_OWORD *)&qword_1EB53BC90 = 0u;
  *(_OWORD *)&qword_1EB53BC80 = 0u;
  *(_OWORD *)algn_1EB53BC70 = 0u;
  unk_1EB53BC60 = 0u;
  unk_1EB53BC50 = 0u;
  unk_1EB53BC40 = 0u;
  xmmword_1EB53BD20 = 0u;
  unk_1EB53BD30 = 0u;
  xmmword_1EB53BD10 = 0u;
  xmmword_1EB53BC30 = 0u;
  qword_1EB53BC28 = 0;
  xmmword_1EB53BC08 = 0u;
  unk_1EB53BC18 = 0u;
  __strlcpy_chk();
  qword_1EB53BC28 = 0x100000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&xmmword_1EB53BC30 = np_direct_add_input_handler;
  *((void *)&xmmword_1EB53BC30 + 1) = np_direct_remove_input_handler;
  qword_1EB53BC80 = (uint64_t)np_direct_get_input_frames;
  qword_1EB53BC88 = (uint64_t)np_direct_get_output_frames;
  qword_1EB53BC90 = (uint64_t)np_direct_finalize_output_frames;
  qword_1EB53BCE0 = (uint64_t)np_direct_supports_external_data;
  qword_1EB53BD08 = (uint64_t)np_direct_waiting_for_output;
  qword_1EB53BC58 = (uint64_t)np_direct_connected;
  qword_1EB53BC68 = (uint64_t)np_direct_error;
  if ((nw_protocol_register_extended() & 1) == 0)
  {
    id v0 = nplog_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v1 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v0, OS_LOG_TYPE_ERROR, "Failed to register the np_tunnel_flow protocol", v1, 2u);
    }
  }
}

uint64_t np_direct_add_input_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  *(void *)(a2 + 32) = a1;
  *(void *)(a1 + 48) = a2;
  id v4 = v3;
  uuid_copy((unsigned __int8 *)[v4 protocol], (const unsigned __int8 *)a2);

  return 1;
}

BOOL np_direct_remove_input_handler(void *a1, uint64_t a2, int a3)
{
  *(void *)(a2 + 32) = 0;
  uint64_t v4 = a1[6];
  if (v4 == a2)
  {
    a1[6] = 0;
    uint64_t v7 = a1[4];
    if (v7) {
      (*(void (**)(void))(*(void *)(v7 + 24) + 8))();
    }
    if (a3)
    {
      uint64_t v8 = (void *)a1[5];
      [v8 handleDetachedFromProtocol];
      a1[5] = 0;
    }
  }
  return v4 == a2;
}

uint64_t np_direct_get_input_frames(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 80))();
}

uint64_t np_direct_get_output_frames(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 firstTxByteTimestamp];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v2 setFirstTxByteTimestamp:v4];
  }
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 88))();

  return v5;
}

uint64_t np_direct_finalize_output_frames(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 96))();
}

uint64_t np_direct_supports_external_data(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 48) + 24) + 176))();
}

uint64_t np_direct_waiting_for_output(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 216))();
}

void np_direct_connected(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 date];
    [v5 setConnectionStartDate:v4];

    [v5 createConnectionInfo];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 24) + 40))();
  }
}

uint64_t np_direct_error(uint64_t result)
{
  if (result)
  {
    uint64_t result = *(void *)(result + 48);
    if (result) {
      return (*(uint64_t (**)(void))(*(void *)(result + 24) + 56))();
    }
  }
  return result;
}

uint64_t np_direct_protocol_create(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (_MergedGlobals_31 != -1) {
    dispatch_once(&_MergedGlobals_31, &__block_literal_global_1);
  }
  if (nw_protocols_are_equal()
    && (BOOL v6 = [[NPDirectFlow alloc] initWithParameters:v5]) != 0)
  {
    uint64_t v7 = v6;
    *(void *)([(NPDirectFlow *)v7 protocol] + 40) = v7;
    uint64_t v8 = [(NPDirectFlow *)v7 protocol];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

BOOL NSPPrivacyProxyTokenIssuerReadFrom(char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_28;
      case 2u:
        double v19 = objc_alloc_init(NSPPrivacyProxyTokenKey);
        [a1 addTokenKeys:v19];
        if PBReaderPlaceMark() && (NSPPrivacyProxyTokenKeyReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_29:

LABEL_30:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 32;
        goto LABEL_28;
      case 4u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 40;
        goto LABEL_28;
      case 5u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
LABEL_28:
        double v19 = *(NSPPrivacyProxyTokenKey **)&a1[v18];
        *(void *)&a1[v18] = v17;
        goto LABEL_29;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_30;
    }
  }
}

uint64_t NSPPrivacyProxyProxyInfoReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_74;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_76;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_74:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_76:
          uint64_t v51 = 48;
          goto LABEL_94;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 64;
          goto LABEL_55;
        case 3u:
          __int16 v26 = PBReaderReadData();
          if (v26) {
            [a1 addProxyKeyInfo:v26];
          }
          goto LABEL_58;
        case 4u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 96;
          goto LABEL_55;
        case 5u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          a1[116] |= 4u;
          while (2)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v14 = v28++ >= 9;
                if (v14)
                {
                  uint64_t v29 = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_80:
          BOOL v52 = v29 != 0;
          uint64_t v53 = 113;
          goto LABEL_89;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_55;
        case 7u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_55;
        case 8u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_55;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_55;
        case 0xAu:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          a1[116] |= 8u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  uint64_t v35 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v35 = 0;
          }
LABEL_84:
          BOOL v52 = v35 != 0;
          uint64_t v53 = 114;
          goto LABEL_89;
        case 0xBu:
          __int16 v26 = PBReaderReadString();
          if (v26) {
            [a1 addBootstrapAddresses:v26];
          }
          goto LABEL_58;
        case 0xCu:
          __int16 v26 = PBReaderReadString();
          if (v26) {
            [a1 addAllowedNextHops:v26];
          }
          goto LABEL_58;
        case 0xDu:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 88;
LABEL_55:
          v39 = *(void **)&a1[v25];
          *(void *)&a1[v25] = v24;

          continue;
        case 0xEu:
          __int16 v26 = PBReaderReadString();
          if (v26) {
            [a1 addPreferredPathPatterns:v26];
          }
LABEL_58:

          continue;
        case 0xFu:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          a1[116] |= 2u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                BOOL v14 = v41++ >= 9;
                if (v14)
                {
                  uint64_t v42 = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v42 = 0;
          }
LABEL_88:
          BOOL v52 = v42 != 0;
          uint64_t v53 = 112;
LABEL_89:
          a1[v53] = v52;
          continue;
        case 0x10u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v19 = 0;
          a1[116] |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v3;
        unint64_t v49 = *(void *)(a2 + v48);
        if (v49 == -1 || v49 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
        *(void *)(a2 + v48) = v49 + 1;
        v19 |= (unint64_t)(v50 & 0x7F) << v46;
        if ((v50 & 0x80) == 0) {
          goto LABEL_91;
        }
        v46 += 7;
        BOOL v14 = v47++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_93;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_91:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_93:
      uint64_t v51 = 8;
LABEL_94:
      *(_DWORD *)&a1[v51] = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyResolverInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_23;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
LABEL_23:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (2)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_41:
          uint64_t v32 = 28;
          goto LABEL_46;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_43;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_45:
      uint64_t v32 = 24;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyProxiedContentMapReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              while (1)
              {
                uint64_t v21 = *v3;
                unint64_t v22 = *(void *)(a2 + v21);
                if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                  break;
                }
                char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
                *(void *)(a2 + v21) = v22 + 1;
                v20 |= (unint64_t)(v23 & 0x7F) << v18;
                if ((v23 & 0x80) == 0) {
                  goto LABEL_92;
                }
                v18 += 7;
                BOOL v14 = v19++ >= 9;
                if (v14)
                {
                  uint64_t v20 = 0;
                  goto LABEL_94;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_92:
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v20 = 0;
              }
LABEL_94:
              BOOL v69 = v20 != 0;
              uint64_t v70 = 80;
              goto LABEL_120;
            case 2u:
              uint64_t v50 = PBReaderReadString();
              uint64_t v51 = *(void **)(a1 + 40);
              *(void *)(a1 + 40) = v50;

              goto LABEL_121;
            case 3u:
              if (v16 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v25 = 0;
                  unsigned int v26 = 0;
                  uint64_t v27 = 0;
                  while (1)
                  {
                    uint64_t v28 = *v3;
                    unint64_t v29 = *(void *)(a2 + v28);
                    if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
                    *(void *)(a2 + v28) = v29 + 1;
                    v27 |= (unint64_t)(v30 & 0x7F) << v25;
                    if (v30 < 0)
                    {
                      v25 += 7;
                      BOOL v14 = v26++ >= 9;
                      if (!v14) {
                        continue;
                      }
                    }
                    goto LABEL_38;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_38:
                  PBRepeatedUInt32Add();
                }
                PBReaderRecallMark();
              }
              else
              {
                char v72 = 0;
                unsigned int v73 = 0;
                uint64_t v74 = 0;
                while (1)
                {
                  uint64_t v75 = *v3;
                  unint64_t v76 = *(void *)(a2 + v75);
                  if (v76 == -1 || v76 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v77 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
                  *(void *)(a2 + v75) = v76 + 1;
                  v74 |= (unint64_t)(v77 & 0x7F) << v72;
                  if (v77 < 0)
                  {
                    v72 += 7;
                    BOOL v14 = v73++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_132;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_132:
                PBRepeatedUInt32Add();
              }
LABEL_121:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 4u:
              char v31 = PBReaderReadString();
              if (v31) {
                [(id)a1 addHostnames:v31];
              }
              goto LABEL_83;
            case 5u:
              char v31 = PBReaderReadString();
              if (v31) {
                [(id)a1 addProcesses:v31];
              }
              goto LABEL_83;
            case 6u:
              char v52 = 0;
              unsigned int v53 = 0;
              uint64_t v54 = 0;
              *(unsigned char *)(a1 + 88) |= 0x20u;
              while (2)
              {
                uint64_t v55 = *v3;
                unint64_t v56 = *(void *)(a2 + v55);
                if (v56 == -1 || v56 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
                  *(void *)(a2 + v55) = v56 + 1;
                  v54 |= (unint64_t)(v57 & 0x7F) << v52;
                  if (v57 < 0)
                  {
                    v52 += 7;
                    BOOL v14 = v53++ >= 9;
                    if (v14)
                    {
                      uint64_t v54 = 0;
                      goto LABEL_110;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v54 = 0;
              }
LABEL_110:
              BOOL v69 = v54 != 0;
              uint64_t v70 = 84;
              goto LABEL_120;
            case 7u:
              char v58 = 0;
              unsigned int v59 = 0;
              uint64_t v40 = 0;
              *(unsigned char *)(a1 + 88) |= 1u;
              while (2)
              {
                uint64_t v60 = *v3;
                unint64_t v61 = *(void *)(a2 + v60);
                if (v61 == -1 || v61 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v62 = *(unsigned char *)(*(void *)(a2 + *v7) + v61);
                  *(void *)(a2 + v60) = v61 + 1;
                  v40 |= (unint64_t)(v62 & 0x7F) << v58;
                  if (v62 < 0)
                  {
                    v58 += 7;
                    BOOL v14 = v59++ >= 9;
                    if (v14)
                    {
                      LODWORD(v40) = 0;
                      goto LABEL_114;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v40) = 0;
              }
LABEL_114:
              uint64_t v71 = 48;
              goto LABEL_115;
            case 8u:
              char v32 = 0;
              unsigned int v33 = 0;
              uint64_t v34 = 0;
              *(unsigned char *)(a1 + 88) |= 0x10u;
              while (2)
              {
                uint64_t v35 = *v3;
                unint64_t v36 = *(void *)(a2 + v35);
                if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
                  *(void *)(a2 + v35) = v36 + 1;
                  v34 |= (unint64_t)(v37 & 0x7F) << v32;
                  if (v37 < 0)
                  {
                    v32 += 7;
                    BOOL v14 = v33++ >= 9;
                    if (v14)
                    {
                      uint64_t v34 = 0;
                      goto LABEL_98;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v34 = 0;
              }
LABEL_98:
              BOOL v69 = v34 != 0;
              uint64_t v70 = 83;
              goto LABEL_120;
            case 9u:
              char v31 = PBReaderReadString();
              if (v31) {
                [(id)a1 addUrls:v31];
              }
LABEL_83:

              goto LABEL_121;
            case 0xAu:
              char v38 = 0;
              unsigned int v39 = 0;
              uint64_t v40 = 0;
              *(unsigned char *)(a1 + 88) |= 2u;
              while (2)
              {
                uint64_t v41 = *v3;
                unint64_t v42 = *(void *)(a2 + v41);
                if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
                  *(void *)(a2 + v41) = v42 + 1;
                  v40 |= (unint64_t)(v43 & 0x7F) << v38;
                  if (v43 < 0)
                  {
                    v38 += 7;
                    BOOL v14 = v39++ >= 9;
                    if (v14)
                    {
                      LODWORD(v40) = 0;
                      goto LABEL_102;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v40) = 0;
              }
LABEL_102:
              uint64_t v71 = 64;
LABEL_115:
              *(_DWORD *)(a1 + v71) = v40;
              goto LABEL_121;
            case 0xBu:
              char v63 = 0;
              unsigned int v64 = 0;
              uint64_t v65 = 0;
              *(unsigned char *)(a1 + 88) |= 8u;
              while (2)
              {
                uint64_t v66 = *v3;
                unint64_t v67 = *(void *)(a2 + v66);
                if (v67 == -1 || v67 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
                  *(void *)(a2 + v66) = v67 + 1;
                  v65 |= (unint64_t)(v68 & 0x7F) << v63;
                  if (v68 < 0)
                  {
                    v63 += 7;
                    BOOL v14 = v64++ >= 9;
                    if (v14)
                    {
                      uint64_t v65 = 0;
                      goto LABEL_119;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v65 = 0;
              }
LABEL_119:
              BOOL v69 = v65 != 0;
              uint64_t v70 = 82;
              goto LABEL_120;
            case 0xCu:
              char v44 = 0;
              unsigned int v45 = 0;
              uint64_t v46 = 0;
              *(unsigned char *)(a1 + 88) |= 4u;
              while (2)
              {
                uint64_t v47 = *v3;
                unint64_t v48 = *(void *)(a2 + v47);
                if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
                  *(void *)(a2 + v47) = v48 + 1;
                  v46 |= (unint64_t)(v49 & 0x7F) << v44;
                  if (v49 < 0)
                  {
                    v44 += 7;
                    BOOL v14 = v45++ >= 9;
                    if (v14)
                    {
                      uint64_t v46 = 0;
                      goto LABEL_106;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v46 = 0;
              }
LABEL_106:
              BOOL v69 = v46 != 0;
              uint64_t v70 = 81;
LABEL_120:
              *(unsigned char *)(a1 + v70) = v69;
              goto LABEL_121;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_121;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTokenKeyReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_39;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_41:
        uint64_t v32 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            uint64_t v18 = PBReaderReadData();
            unsigned int v19 = *(void **)(a1 + 24);
            *(void *)(a1 + 24) = v18;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_45:
        uint64_t v32 = 8;
      }
      *(void *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTokenActivationQueryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_39;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 16) = v19;
        goto LABEL_42;
      case 2u:
        unint64_t v24 = objc_alloc_init(NSPPrivacyProxyBAAValidation);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || !NSPPrivacyProxyBAAValidationReadFrom((uint64_t)v24, a2)) {
          goto LABEL_44;
        }
        goto LABEL_37;
      case 3u:
        unint64_t v24 = objc_alloc_init(NSPPrivacyProxyTokenInfo);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark() || !NSPPrivacyProxyTokenInfoReadFrom((char *)v24, a2)) {
          goto LABEL_44;
        }
        goto LABEL_37;
      case 4u:
        uint64_t v25 = PBReaderReadData();
        char v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;

        goto LABEL_42;
      case 5u:
        unint64_t v24 = objc_alloc_init(NSPPrivacyProxyAuxiliaryAuthInfo);
        [(id)a1 addAuxiliaryAuthArray:v24];
        if PBReaderPlaceMark() && (NSPPrivacyProxyAuxiliaryAuthInfoReadFrom((uint64_t)v24, a2))
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_44:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_42;
    }
  }
}

void enable_timestamps(char a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __enable_timestamps_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v2 = a1;
  if (enable_timestamps_onceToken != -1) {
    dispatch_once(&enable_timestamps_onceToken, block);
  }
}

void __enable_timestamps_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    if (mach_timebase_info((mach_timebase_info_t)&g_timebaseInfo))
    {
      id v1 = nplog_obj();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v2 = 0;
        _os_log_error_impl(&dword_1A0FEE000, v1, OS_LOG_TYPE_ERROR, "Failed to get the timebase info", v2, 2u);
      }
    }
    else
    {
      g_recordTimestamps = 1;
    }
  }
}

double get_interval_for_mach_times(unint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  double result = 0.0;
  if (a2 > a1)
  {
    if (g_recordTimestamps)
    {
      LODWORD(a4) = g_timebaseInfo;
      LODWORD(a5) = unk_1E953B9F8;
      return (double)(a2 - a1) * (double)*(unint64_t *)&a4 / (double)*(unint64_t *)&a5 / 1000000.0;
    }
  }
  return result;
}

void *create_timestamps()
{
  if (!g_recordTimestamps) {
    return 0;
  }
  double result = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
  if (result)
  {
    result[14] = 0;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_OWORD *)result + 4) = 0u;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)double result = 0u;
  }
  return result;
}

uint64_t __NPGetInternalQueue_block_invoke()
{
  qword_1EB53BD50 = (uint64_t)dispatch_queue_create("NetworkServiceProxy internal queue", 0);
  return MEMORY[0x1F41817F8]();
}

id get_nsdata_from_xpc_object(void *a1, const char *a2)
{
  uint64_t v2 = xpc_dictionary_get_value(a1, a2);
  uint64_t v3 = (void *)v2;
  if (v2 && MEMORY[0x1A622BC50](v2) == MEMORY[0x1E4F14580]) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id get_nsdictionary_from_xpc_object(void *a1, const char *a2)
{
  uint64_t v2 = xpc_dictionary_get_value(a1, a2);
  uint64_t v3 = (void *)v2;
  if (v2 && MEMORY[0x1A622BC50](v2) == MEMORY[0x1E4F14590]) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id get_nsarray_from_xpc_object(void *a1, const char *a2)
{
  uint64_t v2 = xpc_dictionary_get_value(a1, a2);
  uint64_t v3 = (void *)v2;
  if (v2 && MEMORY[0x1A622BC50](v2) == MEMORY[0x1E4F14568]) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0;
  }

  return v4;
}

uint64_t NSPPrivacyProxyAuthenticationInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v16 = v10 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 80) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_53;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_55:
        *(_DWORD *)(a1 + 56) = v20;
        goto LABEL_66;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 64;
        goto LABEL_30;
      case 3u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 48;
LABEL_30:
        char v26 = *(void **)(a1 + v25);
        *(void *)(a1 + v25) = v24;

        goto LABEL_66;
      case 4u:
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v28 = 0;
            unsigned int v29 = 0;
            uint64_t v30 = 0;
            while (1)
            {
              uint64_t v31 = *v3;
              unint64_t v32 = *(void *)(a2 + v31);
              if (v32 == -1 || v32 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v14 = v29++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_43;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v14 = v36++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_65;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_65:
          PBRepeatedUInt32Add();
        }
        goto LABEL_66;
      case 5u:
        PBReaderReadString();
        uint64_t v34 = (NSPPrivacyProxyTokenAttester *)objc_claimAutoreleasedReturnValue();
        if (v34) {
          [(id)a1 addAccessTokenKnownOrigins:v34];
        }
        goto LABEL_51;
      case 6u:
        PBReaderReadString();
        uint64_t v34 = (NSPPrivacyProxyTokenAttester *)objc_claimAutoreleasedReturnValue();
        if (v34) {
          [(id)a1 addAccessTokenBlockedIssuers:v34];
        }
        goto LABEL_51;
      case 7u:
        uint64_t v34 = objc_alloc_init(NSPPrivacyProxyTokenAttester);
        [(id)a1 addNonDefaultAttesters:v34];
        if PBReaderPlaceMark() && (NSPPrivacyProxyTokenAttesterReadFrom((uint64_t)v34, a2))
        {
          PBReaderRecallMark();
LABEL_51:

LABEL_66:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_66;
    }
  }
}

void NPFrameStream::NPFrameStream(NPFrameStream *this, Log *a2, Socket *a3, BufferPool *a4, int a5)
{
  FrameStream::FrameStream((uint64_t)this, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5);
  *(void *)uint64_t v5 = &unk_1EF426688;
  *(void *)(v5 + 16) = &unk_1EF426728;
  *(void *)(v5 + 24) = &unk_1EF426750;
  *(_OWORD *)(v5 + 264) = 0u;
  *(_OWORD *)(v5 + 280) = 0u;
  *(_DWORD *)(v5 + 296) = 0;
  *(_OWORD *)(v5 + 304) = 0u;
  *(_OWORD *)(v5 + 320) = 0u;
  *(_OWORD *)(v5 + 336) = 0u;
}

double FrameStream::FrameStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a4;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 48) = a3;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = *(unsigned char *)(a1 + 84) & 0xC0 | 1;
  *(void *)(a3 + 24) = a1 + 16;
  *(void *)a1 = &unk_1EF426570;
  *(void *)(a1 + 16) = &unk_1EF426608;
  *(void *)(a1 + 24) = &unk_1EF426630;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = &unk_1EF426DC8;
  double result = 0.0;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(unsigned char *)(a1 + 84) &= ~2u;
  *(void *)(a1 + 240) = a1 + 85;
  *(void *)(a1 + 248) = 20;
  *(void *)(a1 + 256) = 0;
  return result;
}

uint64_t NPFrameStream::flush(uint64_t *a1)
{
  uint64_t v2 = a1 + 7;
  uint64_t v3 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)(a1 + 7), a1[7]);
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      uint64_t v5 = (*(void (**)(uint64_t *))(*a1 + 136))(a1);
      BOOL v6 = *(const void **)(v4 + 24);
      size_t v7 = *(void *)(v4 + 32);
      char v8 = dispatch_get_global_queue(0, 0);
      destructor[0] = MEMORY[0x1E4F143A8];
      destructor[1] = 3221225472;
      destructor[2] = ___ZN13NPFrameStream5flushER3AIO_block_invoke;
      destructor[3] = &__block_descriptor_40_e5_v8__0l;
      destructor[4] = v4;
      dispatch_data_t v9 = dispatch_data_create(v6, v7, v8, destructor);

      [v5 write:v9];
      uint64_t v4 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)v2, *v2);
    }
    while (v4);
  }
  return 0;
}

void sub_1A100F264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN13NPFrameStream5flushER3AIO_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 24))();
}

uint64_t NPFrameStream::dispose(NPFrameStream *this, const char *a2, int a3)
{
  uint64_t v6 = *((void *)this + 34);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
    *((void *)this + 34) = 0;
  }
  return FrameStream::dispose(this, a2, a3);
}

uint64_t FrameStream::dispose(FrameStream *this, const char *a2, int a3)
{
  PendingStream::dispose(this, a2, a3);
  *((unsigned char *)this + 84) &= ~2u;
  uint64_t result = *((void *)this + 26);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
    *((void *)this + 26) = 0;
  }
  *((void *)this + 30) = (char *)this + 85;
  *((void *)this + 31) = 20;
  return result;
}

dispatch_data_t NPFrameStream::initialData(NPFrameStream *this, int a2)
{
  uint64_t v3 = (uint64_t *)((char *)this + 56);
  uint64_t v2 = *((void *)this + 7);
  if (v2)
  {
    dispatch_data_t v5 = dispatch_data_create(*(const void **)(v2 + 24), *(void *)(v2 + 32), 0, 0);
    if (a2)
    {
      LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)v3, *v3);
      (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
    }
  }
  else
  {
    dispatch_data_t v5 = 0;
  }
  return v5;
}

void sub_1A100F424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NPFrameStream::takeCurrentPacket(NPFrameStream *this)
{
  uint64_t v1 = *((void *)this + 34);
  *((void *)this + 34) = 0;
  return v1;
}

uint64_t NPFrameStream::amountToBeRead(NPFrameStream *this)
{
  uint64_t v2 = *((void *)this + 34);
  if (v2)
  {
    uint64_t v3 = *(unsigned __int16 *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 32))(v2) + 16);
    uint64_t v4 = (void *)(*((void *)this + 34) + 32);
  }
  else
  {
    uint64_t v4 = (void *)((char *)this + 304);
    uint64_t v3 = 20;
  }
  return v3 - *v4;
}

uint64_t NPFrameStream::handleReadData(NPFrameStream *this, nw_frame_array_s *a2)
{
  uint64_t v4 = 0;
  dispatch_data_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  nw_frame_array_foreach();
  uint64_t v2 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_1A100F560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ___ZN13NPFrameStream14handleReadDataEP16nw_frame_array_s_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  nw_frame_unclaimed_bytes();
  BOOL v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;

  return v3;
}

void sub_1A100FBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void NPFrameStream::logCurrentState(NPFrameStream *this, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = nplog_obj();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *((void *)this + 39);
      uint64_t v7 = *((void *)this + 40);
      uint64_t v9 = *((void *)this + 42);
      uint64_t v8 = *((void *)this + 43);
      uint64_t v10 = *((void *)this + 41);
      int v16 = 134219008;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v9;
      _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "[bytes = %lu, frames = %lu, last frame = %lu, partial frames = %lu, partial headers = %lu]", (uint8_t *)&v16, 0x34u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *((void *)this + 39);
    uint64_t v12 = *((void *)this + 40);
    uint64_t v14 = *((void *)this + 42);
    uint64_t v13 = *((void *)this + 43);
    uint64_t v15 = *((void *)this + 41);
    int v16 = 134219008;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "[bytes = %lu, frames = %lu, last frame = %lu, partial frames = %lu, partial headers = %lu]", (uint8_t *)&v16, 0x34u);
  }
}

uint64_t NPFrameStream::handleConnectionConnected(NPFrameStream *this)
{
  int v2 = 0;
  return (*(uint64_t (**)(NPFrameStream *, int *))(*(void *)this + 64))(this, &v2);
}

uint64_t PendingStream::fd(PendingStream *this)
{
  return *(unsigned int *)(*((void *)this + 6) + 16);
}

uint64_t FrameStream::dispatch()
{
  uint64_t result = MEMORY[0x1F4188790]();
  BOOL v3 = (char *)result;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((v2 & 1) == 0)
  {
    char v4 = v2;
    uint64_t v5 = v1;
    if ((v2 & 4) == 0) {
      goto LABEL_17;
    }
    if ((*(unsigned char *)(result + 84) & 4) != 0)
    {
      uint64_t result = (***(uint64_t (****)(void, int *, uint64_t))(result + 48))(*(void *)(result + 48), v22, 0x8000);
      if (result >= 1) {
        goto LABEL_17;
      }
      uint64_t v14 = *(uint64_t (**)(char *, const char *, void))(*(void *)v3 + 80);
      uint64_t v15 = "tarpit escapee";
      return v14(v3, v15, 0);
    }
    uint64_t v6 = *(uint64_t (****)(void, uint64_t, uint64_t))(result + 48);
    uint64_t v7 = *((void *)v3 + 30);
    uint64_t v8 = *((void *)v3 + 31);
    while (1)
    {
      uint64_t v9 = (**v6)(v6, v7, v8);
      if (!v9) {
        break;
      }
      if (v9 < 0)
      {
        uint64_t result = (*(uint64_t (**)(void))(**((void **)v3 + 6) + 72))(*((void *)v3 + 6));
        if (result) {
          goto LABEL_17;
        }
        uint64_t v18 = (*(uint64_t (**)(void, void))(**((void **)v3 + 6) + 80))(*((void *)v3 + 6), 0);
        int v16 = *(uint64_t (**)(char *, const char *, void))(*(void *)v3 + 80);
        uint64_t v17 = (const char *)v18;
        goto LABEL_24;
      }
      uint64_t v10 = *((void *)v3 + 31);
      uint64_t v7 = *((void *)v3 + 30) + v9;
      uint64_t v8 = v10 - v9;
      *((void *)v3 + 30) = v7;
      *((void *)v3 + 31) = v10 - v9;
      if (v10 == v9)
      {
        if ((v3[84] & 2) != 0)
        {
          uint64_t v19 = *((void *)v3 + 26);
          if (v19) {
            __int16 v20 = (char *)(v19 + 112);
          }
          else {
            __int16 v20 = v3 + 85;
          }
          uint64_t result = (*(uint64_t (**)(char *, char *))(*(void *)v3 + 96))(v3, v20);
          if (*(_DWORD *)(*((void *)v3 + 6) + 16) == -1) {
            return result;
          }
          v3[84] &= ~2u;
          uint64_t result = *((void *)v3 + 26);
          if (result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
            *((void *)v3 + 26) = 0;
          }
          *((void *)v3 + 30) = v3 + 85;
          *((void *)v3 + 31) = 20;
LABEL_17:
          if ((v4 & 2) == 0)
          {
            if ((v4 & 8) != 0)
            {
              uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 64))(v3, v5);
              if (!result)
              {
                if ((v3[84] & 8) != 0) {
                  return shutdown(*(_DWORD *)(*((void *)v3 + 6) + 16), 1);
                }
                else {
                  return (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 40))(v3, v5);
                }
              }
            }
            return result;
          }
          uint64_t v14 = *(uint64_t (**)(char *, const char *, void))(*(void *)v3 + 80);
          uint64_t v15 = "hangup";
          return v14(v3, v15, 0);
        }
        uint64_t result = FrameStream::header((FrameStream *)v3);
        if (!result) {
          return result;
        }
        uint64_t v7 = *((void *)v3 + 30);
        uint64_t v8 = *((void *)v3 + 31);
      }
      uint64_t v6 = (uint64_t (***)(void, uint64_t, uint64_t))*((void *)v3 + 6);
    }
    int v16 = *(uint64_t (**)(char *, const char *, void))(*(void *)v3 + 80);
    uint64_t v17 = "peer closed";
LABEL_24:
    return v16(v3, v17, 0);
  }
  uint64_t v11 = *(Socket **)(result + 48);
  unsigned int v21 = 4;
  v22[0] = 0;
  if (Socket::get(v11, 0xFFFF, 4103, v22, &v21)) {
    int v12 = v22[0];
  }
  else {
    int v12 = 0;
  }
  uint64_t v13 = strerror(v12);
  return (*(uint64_t (**)(char *, char *, void))(*(void *)v3 + 80))(v3, v13, ((v12 - 60) < 6) & (0x23u >> (v12 - 60)));
}

int *PendingStream::blocked(uint64_t a1)
{
  uint64_t result = *(int **)(a1 + 32);
  if (result[2] <= 0) {
    return (int *)Log::trace((Log *)result, "[%d] blocked", *(_DWORD *)(a1 + 80));
  }
  return result;
}

int *PendingStream::writable(uint64_t a1)
{
  uint64_t result = *(int **)(a1 + 32);
  if (result[2] <= 0) {
    return (int *)Log::trace((Log *)result, "[%d] writable", *(_DWORD *)(a1 + 80));
  }
  return result;
}

int *PendingStream::emit(Log **this, const char *a2, const char *a3)
{
  uint64_t result = __error();
  if (*result != 36) {
    return (int *)Log::error(this[4], "[%d] %s (%s)", *((_DWORD *)this + 20), a2, a3);
  }
  return result;
}

uint64_t PendingStream::readable(uint64_t a1, int *a2, int a3)
{
  uint64_t v6 = *(int **)(a1 + 32);
  if (v6[2] <= 1)
  {
    uint64_t v7 = "no";
    if (a3) {
      uint64_t v7 = "yes";
    }
    Log::info((Log *)v6, "[%d] readable (%s)", *(_DWORD *)(a1 + 80), v7);
  }
  int v8 = *(_DWORD *)(a1 + 8);
  if (!a3)
  {
    if ((v8 & 4) != 0)
    {
      unsigned int v9 = v8 & 0xFFFFFFFB;
      uint16_t v10 = 8;
      goto LABEL_11;
    }
    return 1;
  }
  if ((v8 & 4) != 0) {
    return 1;
  }
  unsigned int v9 = v8 | 4;
  uint16_t v10 = 5;
LABEL_11:
  *(_DWORD *)(a1 + 8) = v9;
  return AIO::rw(a2, (void *)a1, 4, v10);
}

uint64_t PendingStream::reclaim(PendingStream *this)
{
  return 0;
}

uint64_t PendingStream::dubious(PendingStream *this, const char *a2)
{
  return (*(uint64_t (**)(PendingStream *, const char *, void))(*(void *)this + 80))(this, a2, 0);
}

char *FrameStream::advise(FrameStream *this, int a2, unsigned int a3)
{
  char v3 = a3;
  uint64_t v6 = (int *)*((void *)this + 4);
  if (v6[2] <= 1)
  {
    if (a3 > 5) {
      uint64_t v7 = "<unknown>";
    }
    else {
      uint64_t v7 = (&Frame::Exception::label(int)::names)[a3];
    }
    Log::info((Log *)v6, "[%d] exception '%s' on channel %d", *((_DWORD *)this + 20), v7, a2);
  }
  uint64_t result = (char *)malloc_type_malloc(0x8DuLL, 0x500D4304uLL);
  if (result)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = &unk_1EF426B88;
    *((void *)result + 3) = result + 112;
    *((void *)result + 4) = 25;
    *((void *)result + 5) = 0;
    result[136] = v3;
    *((_DWORD *)result + 32) = 168099865;
    *((_DWORD *)result + 33) = a2;
    unsigned int v9 = *(uint64_t (**)(char *, char *, char *))(*((void *)this + 3) + 48);
    return (char *)v9((char *)this + 24, result, (char *)this + 24);
  }
  return result;
}

uint64_t FrameStream::acknowledge(FrameStream *this, int a2, int a3, int a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 && *(int *)(*((void *)this + 4) + 8) <= 1)
  {
    uint64_t v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = *((_DWORD *)this + 20);
      v11[0] = 67109632;
      v11[1] = v10;
      __int16 v12 = 1024;
      int v13 = a3;
      __int16 v14 = 1024;
      int v15 = a2;
      _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "[%d] sending ack(%d) on channel %d", (uint8_t *)v11, 0x14u);
    }
  }
  int v8 = (char *)malloc_type_malloc(0x90uLL, 0x500D4304uLL);
  if (!v8) {
    return 0;
  }
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 8) = 0u;
  *(void *)int v8 = &unk_1EF426B88;
  *((void *)v8 + 3) = v8 + 112;
  *((void *)v8 + 4) = 28;
  *((void *)v8 + 5) = 0;
  *((_DWORD *)v8 + 33) = a2;
  *((_DWORD *)v8 + 34) = a3;
  *((_DWORD *)v8 + 32) = 167772188;
  return (*(uint64_t (**)(char *))(*((void *)this + 3) + 48))((char *)this + 24);
}

char *FrameStream::helloack(FrameStream *this, int a2)
{
  char v4 = (int *)*((void *)this + 4);
  if (v4[2] <= 0) {
    Log::trace((Log *)v4, "[%d] sending hack (time %d)", *((_DWORD *)this + 20), a2);
  }
  uint64_t result = (char *)malloc_type_malloc(0x8CuLL, 0x500D4304uLL);
  if (result)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = &unk_1EF426B88;
    *((void *)result + 3) = result + 112;
    *((void *)result + 4) = 24;
    *((void *)result + 5) = 0;
    *((_DWORD *)result + 32) = 167968792;
    *((_DWORD *)result + 33) = a2;
    uint64_t v6 = *(uint64_t (**)(char *, char *, char *))(*((void *)this + 3) + 48);
    return (char *)v6((char *)this + 24, result, (char *)this + 24);
  }
  return result;
}

int *non-virtual thunk to'PendingStream::emit(Log **this, const char *a2, const char *a3)
{
  return PendingStream::emit(this - 2, a2, a3);
}

uint64_t Transfer::address(Transfer *this)
{
  return 0;
}

uint64_t Transfer::session(Transfer *this, char *a2)
{
  return 0;
}

uint64_t non-virtual thunk to'FrameStream::eof(FrameStream *this, int a2)
{
  return FrameStream::done((FrameStream *)((char *)this - 24), a2);
}

uint64_t non-virtual thunk to'PendingStream::readable(uint64_t a1, int *a2, int a3)
{
  return PendingStream::readable(a1 - 24, a2, a3);
}

uint64_t Transfer::attach(Transfer *this, Transfer *a2)
{
  return 0;
}

uint64_t Transfer::receipt(Transfer *this)
{
  return 0;
}

uint64_t Transfer::transmit()
{
  return 0;
}

char *non-virtual thunk to'FrameStream::advise(FrameStream *this, int a2, unsigned int a3)
{
  return FrameStream::advise((FrameStream *)((char *)this - 24), a2, a3);
}

uint64_t PendingStream::flush(_DWORD *a1, int *a2)
{
  char v4 = (uint64_t *)(a1 + 14);
  uint64_t v5 = (void *)*((void *)a1 + 7);
  if (v5)
  {
    while (1)
    {
      uint64_t v6 = (*(uint64_t (**)(void, void, void))(**((void **)a1 + 6) + 40))(*((void *)a1 + 6), v5[3], v5[4]);
      if (v6 < 0)
      {
        if (((*(uint64_t (**)(void))(**((void **)a1 + 6) + 72))(*((void *)a1 + 6)) & 1) == 0)
        {
          uint64_t v18 = (*(uint64_t (**)(void, void))(**((void **)a1 + 6) + 80))(*((void *)a1 + 6), 0);
          (*(void (**)(_DWORD *, uint64_t, void))(*(void *)a1 + 80))(a1, v18, 0);
          return v6;
        }
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v7 = (int *)*((void *)a1 + 4);
        if (v7[2] <= 0)
        {
          int v8 = a1[20];
          unsigned int v9 = (const char *)(*(uint64_t (**)(void *))(*v5 + 40))(v5);
          Log::trace((Log *)v7, "[%d] wrote %ld of <%s:%ld>", v8, v6, v9, v5[4]);
        }
      }
      uint64_t v10 = v5[4] - v6;
      v5[3] += v6;
      v5[4] = v10;
      if (v10) {
        break;
      }
      uint64_t v11 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)v4, *v4);
      (*(void (**)(uint64_t))(*(void *)v11 + 24))(v11);
      uint64_t v5 = (void *)*v4;
      if (!*v4) {
        goto LABEL_9;
      }
    }
    (*(void (**)(_DWORD *, int *))(*(void *)a1 + 32))(a1, a2);
    int v16 = a1[2];
    if ((v16 & 8) != 0) {
      return a1[18];
    }
    a1[2] = v16 | 8;
    int v13 = a2;
    __int16 v14 = a1;
    uint16_t v15 = 5;
    goto LABEL_13;
  }
LABEL_9:
  int v12 = a1[2];
  if ((v12 & 8) != 0)
  {
    a1[2] = v12 & 0xFFFFFFF7;
    int v13 = a2;
    __int16 v14 = a1;
    uint16_t v15 = 8;
LABEL_13:
    AIO::rw(v13, v14, 8, v15);
  }
  return a1[18];
}

uint64_t PendingStream::dispose(PendingStream *this, const char *a2, int a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *((_DWORD *)this + 20);
      int v7 = *((_DWORD *)this + 18);
      int v17 = 67109634;
      int v18 = v6;
      __int16 v19 = 2080;
      __int16 v20 = a2;
      __int16 v21 = 1024;
      int v22 = v7;
      int v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1A0FEE000, v8, v9, "[%d] dispose ('%s') :: queue=%u", (uint8_t *)&v17, 0x18u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (*((_DWORD *)this + 18))
  {
    uint64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = *((_DWORD *)this + 20);
      int v11 = *((_DWORD *)this + 18);
      int v17 = 67109634;
      int v18 = v10;
      __int16 v19 = 2080;
      __int16 v20 = a2;
      __int16 v21 = 1024;
      int v22 = v11;
      int v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (*(int *)(*((void *)this + 4) + 8) <= 0)
  {
    uint64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v16 = *((_DWORD *)this + 20);
      int v17 = 67109378;
      int v18 = v16;
      __int16 v19 = 2080;
      __int16 v20 = a2;
      _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "[%d] dispose ('%s')", (uint8_t *)&v17, 0x12u);
    }
    goto LABEL_8;
  }
LABEL_9:
  int v13 = (uint64_t *)((char *)this + 56);
  uint64_t v12 = *((void *)this + 7);
  if (v12)
  {
    do
    {
      uint64_t v14 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)this + 56, v12);
      (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
      uint64_t v12 = *v13;
    }
    while (*v13);
  }
  *((unsigned char *)this + 84) = *((unsigned char *)this + 84) & 0xC2 | 1;
  return (*(uint64_t (**)(void))(**((void **)this + 6) + 24))(*((void *)this + 6));
}

size_t Pending::write(Pending *this, const void *a2, size_t a3)
{
  *((void *)this + 4) += a3;
  return a3;
}

void Pending::~Pending(Pending *this)
{
}

uint64_t Pending::header(Pending *this)
{
  return 0;
}

uint64_t Pending::label(Pending *this)
{
  uint64_t v1 = (uint64_t (*)(void))Frame::Prefix::meta(void)::meta[5
                                                        * *(unsigned __int8 *)((*(uint64_t (**)(Pending *))(*(void *)this + 32))(this)
                                                                             + 18)
                                                        + 1];
  return v1();
}

uint64_t Frame::Ack::size(Frame::Ack *this)
{
  return 28;
}

const char *Frame::Ack::string(Frame::Ack *this)
{
  return "ack";
}

BOOL Frame::Ack::validate(Frame::Ack *this)
{
  return this == 28;
}

uint64_t Frame::Prefix::Meta::fencrypt(uint64_t a1, uint64_t (***a2)(void, uint64_t, uint64_t, void, void))
{
  return (**a2)(a2, a1 - 64, 4, *(unsigned __int16 *)(a1 + 16) - 20, 0);
}

uint64_t Frame::Prefix::Meta::fdecrypt(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void))(*(void *)a2 + 8))(a2, a1 - 64, 4, *(unsigned __int16 *)(a1 + 16) - 20, 0);
}

uint64_t Frame::Data::size(Frame::Data *this)
{
  return 24;
}

const char *Frame::Data::string(Frame::Data *this)
{
  return "data";
}

BOOL Frame::Data::validate(Frame::Data *this)
{
  return (this - 24) < 0x4E9;
}

uint64_t Frame::Hello::size(Frame::Hello *this)
{
  return 88;
}

const char *Frame::Hello::string(Frame::Hello *this)
{
  return "hello";
}

BOOL Frame::Hello::validate(Frame::Hello *this)
{
  return this == 88;
}

uint64_t Frame::Prefix::Meta::hencrypt(uint64_t a1, uint64_t (***a2)(void, uint64_t, uint64_t, void, void))
{
  return (**a2)(a2, a1 - 64, 72, 0, 0);
}

uint64_t Frame::Prefix::Meta::hdecrypt(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void))(*(void *)a2 + 8))(a2, a1 - 64, 72, 0, 0);
}

uint64_t Frame::Hack::size(Frame::Hack *this)
{
  return 24;
}

const char *Frame::Hack::string(Frame::Hack *this)
{
  return "hack";
}

BOOL Frame::Hack::validate(Frame::Hack *this)
{
  return this == 24;
}

uint64_t Frame::Request::size(Frame::Request *this)
{
  return 57;
}

const char *Frame::Request::string(Frame::Request *this)
{
  return "request";
}

BOOL Frame::Request::validate(Frame::Request *this)
{
  return (this - 57) < 0x4C8;
}

uint64_t Frame::Exception::size(Frame::Exception *this)
{
  return 25;
}

const char *Frame::Exception::string(Frame::Exception *this)
{
  return "exception";
}

BOOL Frame::Exception::validate(Frame::Exception *this)
{
  return this == 25;
}

uint64_t Frame::Rekey::size(Frame::Rekey *this)
{
  return 116;
}

const char *Frame::Rekey::string(Frame::Rekey *this)
{
  return "rekey";
}

BOOL Frame::Rekey::validate(Frame::Rekey *this)
{
  return this == 116;
}

uint64_t Frame::Capacity::size(Frame::Capacity *this)
{
  return 20;
}

const char *Frame::Capacity::string(Frame::Capacity *this)
{
  return "capacity";
}

BOOL Frame::Capacity::validate(Frame::Capacity *this)
{
  return (this - 20) < 0x4ED;
}

uint64_t Frame::Advertise::size(Frame::Advertise *this)
{
  return 24;
}

const char *Frame::Advertise::string(Frame::Advertise *this)
{
  return "advertise";
}

BOOL Frame::Advertise::validate(Frame::Advertise *this)
{
  return (this - 24) < 0x4E9;
}

uint64_t Frame::Ping::size(Frame::Ping *this)
{
  return 44;
}

const char *Frame::Ping::string(Frame::Ping *this)
{
  return "ping";
}

BOOL Frame::Ping::validate(Frame::Ping *this)
{
  return (this & 0xFFFFFFFB) == 40;
}

uint64_t Log::trace(Log *this, const char *a2, ...)
{
  va_start(va, a2);
  if (*((int *)this + 2) <= 0)
  {
    va_copy(v4, va);
    (*(void (**)(void, Log *, const char *, const char *, va_list *))(**((void **)this + 3) + 16))(*((void *)this + 3), this, "trace", a2, &v4);
    ++*((_DWORD *)this + 10);
  }
  return 0;
}

uint64_t AIO::rw(int *a1, void *a2, char a3, uint16_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v8 = (*(uint64_t (**)(void *))(*(void *)a2 + 16))(a2);
  if (v8 == -1) {
    return 0;
  }
  if ((a3 & 4) != 0)
  {
    changelist[0].ident = v8;
    changelist[0].filter = -1;
    changelist[0].flags = a4;
    changelist[0].fflags = 0;
    int v9 = 1;
    changelist[0].data = 0;
    changelist[0].udata = a2;
    if ((a3 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v9 = 0;
  if ((a3 & 8) != 0)
  {
LABEL_6:
    int v10 = &changelist[v9];
    v10->ident = v8;
    v10->filter = -2;
    v10->flags = a4;
    v10->fflags = 0;
    v10->data = 0;
    v10->udata = a2;
    ++v9;
  }
LABEL_7:
  if (kevent(*a1, changelist, v9, 0, 0, 0))
  {
    int v11 = (*(uint64_t (**)(void *))(*(void *)a2 + 16))(a2);
    uint64_t v12 = __error();
    int v13 = strerror(*v12);
    printf("<<<<<<<<< kevent setup failed (%d: %s) >>>>>>>>>>\n", v11, v13);
    return 0;
  }
  return 1;
}

void Buffer::~Buffer(Buffer *this)
{
  *(void *)this = &unk_1EF426B88;
}

{
  *(void *)this = &unk_1EF426B88;
  JUMPOUT(0x1A622A8A0);
}

uint64_t Buffer::header(Buffer *this)
{
  return (uint64_t)this + 112;
}

uint64_t FrameStream::header(FrameStream *this)
{
  if (*((unsigned __int8 *)this + 103) > 9uLL
    || (char v2 = (Frame::Ack *)*(unsigned __int16 *)((char *)this + 101),
        (Frame::Prefix::meta(void)::meta[5 * *((unsigned __int8 *)this + 103) + 2](v2) & 1) == 0))
  {
    (*(void (**)(FrameStream *, const char *))(*(void *)this + 88))(this, "invalid header");
    return 0;
  }
  uint64_t result = (uint64_t)malloc_type_malloc((size_t)v2 + 116, 0x500D4304uLL);
  if (!result)
  {
    *((void *)this + 26) = 0;
    return result;
  }
  *(void *)(result + 40) = 0;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 8) = 0u;
  *(void *)uint64_t result = &unk_1EF426B88;
  *((void *)this + 26) = result;
  *((void *)this + 30) = result + 132;
  long long v4 = *(_OWORD *)((char *)this + 85);
  *(_DWORD *)(result + 128) = *(_DWORD *)((char *)this + 101);
  *(_OWORD *)(result + 112) = v4;
  uint64_t v5 = (int *)*((void *)this + 4);
  if (v5[2] <= 0)
  {
    int v6 = *((_DWORD *)this + 20);
    int v7 = (const char *)((uint64_t (*)(void))Frame::Prefix::meta(void)::meta[5 * *((unsigned __int8 *)this + 103) + 1])();
    Log::trace((Log *)v5, "[%d] incoming <%s:%d>", v6, v7, v2);
  }
  *((void *)this + 3(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = (char *)v2 - 20;
  if (v2 != (Frame::Ack *)20)
  {
    *((unsigned char *)this + 84) |= 2u;
    return 1;
  }
  (*(void (**)(FrameStream *, char *))(*(void *)this + 96))(this, (char *)this + 85);
  int v8 = (_DWORD *)*((void *)this + 6);
  if (v8[4] == -1) {
    return 0;
  }
  *((unsigned char *)this + 84) &= ~2u;
  uint64_t v9 = *((void *)this + 26);
  if (v9)
  {
    (*(void (**)(void))(*(void *)v9 + 24))(*((void *)this + 26));
    *((void *)this + 26) = 0;
    int v8 = (_DWORD *)*((void *)this + 6);
  }
  *((void *)this + 30) = (char *)this + 85;
  *((void *)this + 3(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = 20;
  return (*(unsigned int (**)(_DWORD *))(*(void *)v8 + 88))(v8) != 0;
}

uint64_t Socket::get(Socket *this, int a2, int a3, int *a4, unsigned int *a5)
{
  if (!getsockopt(*((_DWORD *)this + 4), a2, a3, a4, a5)) {
    return 1;
  }
  return Socket::error(this, "Socket.get", 0);
}

uint64_t Socket::error(Socket *this, const char *a2, const char *a3)
{
  char v3 = (void (***)(void, const char *, const char *, void))*((void *)this + 3);
  if (v3)
  {
    if (!a3) {
      a3 = (const char *)(*(uint64_t (**)(Socket *, void))(*(void *)this + 80))(this, 0);
    }
    (**v3)(v3, a2, a3, *((unsigned int *)this + 4));
  }
  return 0;
}

uint64_t Log::error(Log *this, const char *a2, ...)
{
  va_start(va, a2);
  if (*((int *)this + 2) <= 4)
  {
    va_copy(v4, va);
    (*(void (**)(void, Log *, const char *, const char *, va_list *))(**((void **)this + 3) + 16))(*((void *)this + 3), this, "error", a2, &v4);
    ++*((_DWORD *)this + 11);
  }
  return 0;
}

uint64_t Log::info(Log *this, const char *a2, ...)
{
  va_start(va, a2);
  if (*((int *)this + 2) <= 1)
  {
    va_copy(v4, va);
    (*(void (**)(void, Log *, const char *, const char *, va_list *))(**((void **)this + 3) + 16))(*((void *)this + 3), this, "info", a2, &v4);
    ++*((_DWORD *)this + 9);
  }
  return 0;
}

uint64_t FrameStream::done(FrameStream *this, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(int *)(*((void *)this + 4) + 8) <= 1)
  {
    va_list v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *((_DWORD *)this + 20);
      v8[0] = 67109376;
      v8[1] = v7;
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_debug_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEBUG, "[%d] sending eof on channel %d", (uint8_t *)v8, 0xEu);
    }
  }
  uint64_t v5 = (char *)malloc_type_malloc(0x8CuLL, 0x500D4304uLL);
  if (!v5) {
    return 0;
  }
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 8) = 0u;
  *(void *)uint64_t v5 = &unk_1EF426B88;
  *((void *)v5 + 3) = v5 + 112;
  *((void *)v5 + 4) = 24;
  *((void *)v5 + 5) = 0;
  *((_DWORD *)v5 + 32) = 167837720;
  *((_DWORD *)v5 + 33) = a2;
  return (*(uint64_t (**)(char *))(*((void *)this + 3) + 48))((char *)this + 24);
}

uint64_t LRU<Pending,LRULinks<Pending>::Deref>::pop(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return a2;
  }
  if (*(void *)a1 == a2) {
    *(void *)a1 = *(void *)(a2 + 16);
  }
  uint64_t v2 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) == a2)
  {
    *(void *)(a1 + 8) = v2;
    if (!v2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v2) {
LABEL_6:
  }
    *(void *)(v2 + 16) = *(void *)(a2 + 16);
LABEL_7:
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3) {
    *(void *)(v3 + 8) = v2;
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  --*(_DWORD *)(a1 + 16);
  return a2;
}

void set_nsobject_in_xpc_object(void *a1, const char *a2, uint64_t a3)
{
  id v8 = a1;
  uint64_t v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  if (v5)
  {
    id v6 = v8;
    int v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v6, a2, v7);
  }
}

uint64_t NSPPrivacyProxyTokenActivationResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  va_list v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        __int16 v24 = objc_alloc_init(NSPPrivacyProxyAuxiliaryAuthInfo);
        [(id)a1 addAuxiliaryAuthArray:v24];
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyAuxiliaryAuthInfoReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v2(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_39;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v20 = 0;
            }
LABEL_39:
            *(void *)(a1 + 8) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        PBReaderReadData();
        __int16 v24 = (NSPPrivacyProxyAuxiliaryAuthInfo *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addActivatedTokenList:v24];
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyObliviousHTTPConfigReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  va_list v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          unint64_t v17 = objc_alloc_init(NSPPrivacyProxyObliviousTargetInfo);
          [(id)a1 addObliviousTargets:v17];
          if PBReaderPlaceMark() && (NSPPrivacyProxyObliviousTargetInfoReadFrom(v17, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 8;
          goto LABEL_35;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 56) |= 1u;
          break;
        case 4u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 40;
          goto LABEL_35;
        case 5u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 48;
          goto LABEL_35;
        case 6u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 32;
LABEL_35:
          unsigned int v27 = *(void **)(a1 + v20);
          *(void *)(a1 + v20) = v19;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_39;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_41;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_41:
      *(_DWORD *)(a1 + 16) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void tuscanyClientCreate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  operator new();
}

void sub_1A1026DF4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  MEMORY[0x1A622A8A0](v4, 0x10B1C40DA21B781);

  _Unwind_Resume(a1);
}

void tuscanyLoopbackClientCreate(void *a1)
{
  id v1 = a1;
  operator new();
}

void sub_1A1026F24(_Unwind_Exception *a1)
{
  MEMORY[0x1A622A8A0](v2, 0x10B1C40DA21B781);

  _Unwind_Resume(a1);
}

void *tuscanyClientDestroy(void *result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = result[61];
    (*(void (**)(void *))(*result + 80))(result);
    uint64_t result = (void *)(*(uint64_t (**)(void *))(*v1 + 8))(v1);
    if (v2)
    {
      JUMPOUT(0x1A622A8A0);
    }
  }
  return result;
}

uint64_t tuscanyClientHandleConnectionConnected(uint64_t result)
{
  if (result)
  {
    int v1 = 0;
    return (*(uint64_t (**)(uint64_t, int *))(*(void *)result + 64))(result, &v1);
  }
  return result;
}

NPFrameStream *tuscanyClientHandleReadData(NPFrameStream *result, nw_frame_array_s *a2)
{
  if (result) {
    return (NPFrameStream *)NPFrameStream::handleReadData(result, a2);
  }
  return result;
}

uint64_t tuscanyClientGetAmountToRead(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 272);
    if (v2)
    {
      uint64_t v3 = *(unsigned __int16 *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 32))(v2) + 16);
      uint64_t v4 = (void *)(*(void *)(v1 + 272) + 32);
    }
    else
    {
      uint64_t v4 = (void *)(v1 + 304);
      uint64_t v3 = 20;
    }
    return v3 - *v4;
  }
  return result;
}

BOOL tuscanyClientSendData(id *a1, void *a2, void *a3, unint64_t *a4)
{
  int v7 = a2;
  char v8 = a3;
  if (a1) {
    BOOL v9 = NPTuscanyClient::sendData(a1, v7, v8, a4);
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

void sub_1A1027158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL NPTuscanyClient::sendData(id *this, NPTunnelFlow *a2, NSData *a3, unint64_t *a4)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  int v7 = a3;
  uint64_t v58 = 0;
  unsigned int v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v46 = v7;
  char v43 = v6;
  uint64_t v57 = [(NSData *)v7 length];
  uint64_t v40 = [(NPTunnelFlow *)v6 window];
  if (a4) {
    *a4 = 0;
  }
  location = this + 60;
  id WeakRetained = objc_loadWeakRetained(this + 60);
  int v9 = [WeakRetained flowIsFirstFlow:v43];

  unint64_t v10 = nplog_obj();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(NPTunnelFlow *)v43 hashKey];
      uint64_t v13 = [(NPTunnelFlow *)v43 identifier];
      uint64_t v14 = [(NSData *)v7 length];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      char v63 = (void *)v14;
      _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) sending %lu bytes of data through the tunnel", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = [(NPTunnelFlow *)v43 hashKey];
    uint64_t v38 = [(NPTunnelFlow *)v43 identifier];
    uint64_t v39 = [(NSData *)v7 length];
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v38;
    *(_WORD *)&buf[22] = 2048;
    char v63 = (void *)v39;
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) sending %lu bytes of data through the tunnel", buf, 0x20u);
  }

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke;
  v49[3] = &unk_1E5A3B6D0;
  unsigned int v53 = this;
  int v15 = v43;
  uint64_t v50 = v15;
  uint64_t v51 = &v58;
  char v52 = &v54;
  unint64_t v42 = (void (**)(void, void, void, void))MEMORY[0x1A622B750](v49);
  if ([(NPTunnelFlow *)v15 state] == 1)
  {
    if ([(NSData *)v7 length])
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke_159;
      v47[3] = &unk_1E5A3B6F8;
      unint64_t v48 = v42;
      [(NSData *)v7 enumerateByteRangesUsingBlock:v47];
    }
    else
    {
      v42[2](v42, 0, 0, 0);
    }
    if (*((unsigned char *)v59 + 24))
    {
      if (![(NPTunnelFlow *)v15 isBestEffort])
      {
        if ([(NSData *)v7 length]
          || (id v16 = objc_loadWeakRetained(location),
              int v17 = [v16 flowIsFirstFlow:v15],
              v16,
              v17))
        {
          id v18 = objc_loadWeakRetained(location);
          [v18 startConnectionTimer];
        }
      }
    }
  }
  [(NPTunnelFlow *)v15 identifier];
  id v19 = this[33];
  if (v19) {
    unint64_t v20 = (unint64_t)v19 - 24;
  }
  else {
    unint64_t v20 = 1256;
  }
  char v21 = v55;
  unint64_t v22 = v55[3];
  if (v22)
  {
    BOOL v23 = 0;
    while (1)
    {
      if (v23 || !*((unsigned char *)v59 + 24)) {
        goto LABEL_38;
      }
      if (v22 >= v20) {
        LODWORD(v22) = v20;
      }
      int v24 = (int)v22 >= 1256 ? 1256 : v22;
      BOOL v23 = v24 < 1;
      if (v24 >= 1) {
        break;
      }
LABEL_37:
      unint64_t v22 = v21[3];
      if (!v22) {
        goto LABEL_38;
      }
    }
    uint64_t v25 = [(NSData *)v7 length];
    size_t v26 = v24 & ~(v24 >> 31);
    dispatch_data_t subrange = dispatch_data_create_subrange(&v7->super, v25 - v55[3], v26);
    int v28 = [(NPTunnelFlow *)v15 identifier];
    unsigned int v29 = subrange;
    size_t size = dispatch_data_get_size(v29);
    uint64_t v31 = (char *)malloc_type_malloc(size + 140, 0x500D4304uLL);
    unint64_t v32 = v31;
    if (!v31) {
      goto LABEL_34;
    }
    *(_OWORD *)(v31 + 24) = 0u;
    *(_OWORD *)(v31 + 8) = 0u;
    *(void *)uint64_t v31 = &unk_1EF426B88;
    *((void *)v31 + 3) = v31 + 112;
    *((void *)v31 + 4) = 24;
    *((void *)v31 + 5) = 0;
    *((_DWORD *)v31 + 33) = v28;
    *((_WORD *)v31 + 65) = 2561;
    *((_WORD *)v31 + 64) = size + 24;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZN6Client5chunkEPU27objcproto16OS_dispatch_data8NSObjectj_block_invoke;
    char v63 = &__block_descriptor_40_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
    unsigned int v64 = v31;
    dispatch_data_apply(v29, buf);
    if ((*((uint64_t (**)(id *, char *, void))*this + 26))(this, v32, 0))
    {

      int v7 = v46;
      if ((size & 0x8000000000000000) == 0)
      {
        *(_DWORD *)(v41 + 12) -= v26;
        v55[3] -= v26;
LABEL_36:

        char v21 = v55;
        goto LABEL_37;
      }
    }
    else
    {
LABEL_34:
    }
    id v33 = objc_loadWeakRetained(location);
    [v33 setFallbackReason:36];

    +[NPDiagnosticReport logInternalError:@"FailedToCreateDataFrame" context:0];
    *((unsigned char *)v59 + 24) = 0;
    int v7 = v46;
    goto LABEL_36;
  }
LABEL_38:
  if (a4)
  {
    uint64_t v34 = [(NSData *)v7 length];
    *a4 += v34 - v55[3];
  }
  BOOL v35 = *((unsigned char *)v59 + 24) != 0;

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v35;
}

void sub_1A1027764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);

  _Unwind_Resume(a1);
}

NPTuscanyClient *tuscanyClientSendClose(NPTuscanyClient *a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1) {
    a1 = (NPTuscanyClient *)NPTuscanyClient::sendClose(a1, v3);
  }

  return a1;
}

void sub_1A102787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NPTuscanyClient::sendClose(NPTuscanyClient *this, NPTunnelFlow *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = FrameStream::done(this, [(NPTunnelFlow *)v3 identifier]);

  return v4;
}

void sub_1A10278D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void tuscanyClientSendException(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = v11;
    id v7 = v5;
    uint64_t v8 = [v7 code];
    uint64_t v9 = [v6 identifier];
    if ((unint64_t)(v8 - 1) >= 8) {
      char v10 = 6;
    }
    else {
      char v10 = 0x100010306000303uLL >> (8 * (v8 - 1));
    }
    (*(void (**)(uint64_t, uint64_t, void))(*(void *)a1 + 104))(a1, v9, v10 & 7);
  }
}

void sub_1A10279CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

FrameStream *tuscanyClientSendAcknowledge(FrameStream *result, int a2, int a3)
{
  if (result) {
    return (FrameStream *)FrameStream::acknowledge(result, a2, a3, 1);
  }
  return result;
}

uint64_t tuscanyClientGetInitialWindowSize()
{
  return 0x10000;
}

uint64_t tuscanyClientGetHeaderSize()
{
  return 20;
}

uint64_t tuscanyClientGetMaximumFrameSize(uint64_t result)
{
  if (result) {
    return *(void *)(result + 264);
  }
  return result;
}

uint64_t tuscanyClientGetDataSize(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x14) {
    __assert_rtn("tuscanyClientGetDataSize", "NPTuscanyClient.mm", 562, "dataLen > sizeof(Frame::Header)");
  }
  if (*(unsigned char *)(a1 + 18) == 1) {
    return *(unsigned __int16 *)(a1 + 16) - 24;
  }
  else {
    return 0;
  }
}

NPTuscanyClient *tuscanyClientGetMaxDataSendSize(NPTuscanyClient *result, int a2)
{
  if (result) {
    return (NPTuscanyClient *)NPTuscanyClient::maxSendSize(result, 1, a2);
  }
  return result;
}

uint64_t NPTuscanyClient::maxSendSize(NPTuscanyClient *this, uint64_t a2, int a3)
{
  if (*((void *)this + 33)) {
    uint64_t v3 = *((void *)this + 33);
  }
  else {
    uint64_t v3 = 1280;
  }
  if (!a3) {
    return v3 - 24;
  }
  if (a2 != 1) {
    return v3 - 57;
  }
  id WeakRetained = objc_loadWeakRetained((id *)this + 60);
  uint64_t v5 = [WeakRetained currentMTU];

  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  BOOL v7 = v6 <= 145;
  uint64_t v8 = v6 - 145;
  if (v7) {
    return 0;
  }
  else {
    return v8;
  }
}

void sub_1A1027AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t tuscanyClientGetDayPassSessionCount(void *a1)
{
  uint64_t result = [a1 bytes];
  if (result) {
    return *(unsigned int *)(result + 92);
  }
  return result;
}

uint64_t tuscanyClientSetDayPassSessionCount(uint64_t result, int a2)
{
  *(_DWORD *)(result + 92) = a2;
  return result;
}

BOOL tuscanyClientValidateDayPass(void *a1)
{
  return [a1 length] == 96;
}

id tuscanyClientCreateFakeDayPass()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v0 = 0xDCDCDCDCDCDCDCDCLL;
  *((void *)&v0 + (*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = 0xDCDCDCDCDCDCDCDCLL;
  v3[4] = v0;
  v3[5] = v0;
  v3[2] = v0;
  v3[3] = v0;
  v3[0] = v0;
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:96];
  return v1;
}

Client *tuscanyClientSendPing(Client *result)
{
  if (result) {
    return (Client *)Client::ping(result, 0, 0);
  }
  return result;
}

uint64_t tuscanyClientGetExceptionCounts(uint64_t result, void *a2)
{
  *a2 = 0;
  if (result)
  {
    *a2 = 6;
    result += 496;
  }
  return result;
}

const char *tuscanyClientGetNameForException(unsigned int a1)
{
  if (a1 > 5) {
    return "<unknown>";
  }
  else {
    return (&Frame::Exception::label(int)::names)[a1];
  }
}

NPFrameStream *tuscanyClientGetInitialData(NPFrameStream *a1, int a2)
{
  if (a1)
  {
    NPFrameStream::initialData(a1, a2);
    a1 = (NPFrameStream *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

uint64_t tuscanyClientGetDayPassHostID(void *a1)
{
  uint64_t result = [a1 bytes];
  if (result) {
    return *(unsigned __int16 *)(result + 80);
  }
  return result;
}

uint64_t tuscanyClientGetDayPassPortID(void *a1)
{
  uint64_t result = [a1 bytes];
  if (result) {
    return *(unsigned __int16 *)(result + 82);
  }
  return result;
}

void tuscanyClientGetDayPassOriginAddressString(void *a1, void *a2, socklen_t a3)
{
  id v6 = a1;
  uint64_t v5 = [v6 bytes];
  bzero(a2, a3);
  if (v5) {
    inet_ntop(2, (const void *)(v5 + 80), (char *)a2, a3);
  }
}

void sub_1A1027D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void tuscanyWindowCreate()
{
}

uint64_t tuscanyWindowGetCredits(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

uint64_t tuscanyWindowDestroy(uint64_t result)
{
  if (result) {
    JUMPOUT(0x1A622A8A0);
  }
  return result;
}

uint64_t tuscanyWindowAddCredits(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 12) += a2;
  }
  return result;
}

_DWORD *tuscanyWindowGetAmountToAck(_DWORD *result, int a2)
{
  if (result)
  {
    int v2 = result[1];
    signed int v3 = *result + a2;
    BOOL v4 = v3 < v2;
    if (v3 >= v2) {
      int v5 = 0;
    }
    else {
      int v5 = *result + a2;
    }
    *uint64_t result = v5;
    if (v4) {
      return 0;
    }
    else {
      return (_DWORD *)v3;
    }
  }
  return result;
}

void NPTuscanyConfig::NPTuscanyConfig(NPTuscanyConfig *this)
{
  int v2 = Log::DateTime::self(this);
  *(void *)this = &unk_1EF426B68;
  *((_DWORD *)this + 2) = 0;
  *((void *)this + 2) = "NPTuscanyClient";
  *((void *)this + 3) = v2;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_DWORD *)this + 14) = 0;
  *((void *)this + 8) = &unk_1EF426540;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = 0;
  *((_DWORD *)this + 24) = 42;
  *((void *)this + 13) = &unk_1EF426D30;
  *((void *)this + 14) = &unk_1EF426DA0;
  *((void *)this + 15) = 0x2FFFFFFFFLL;
  *((void *)this + 16) = 0;
  signed int v3 = nplog_obj();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  *((_DWORD *)this + 2) = !v4;
}

uint64_t *Log::DateTime::self(Log::DateTime *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_34, memory_order_acquire) & 1) == 0)
  {
    int v2 = (Log::Stderr *)__cxa_guard_acquire(&_MergedGlobals_34);
    if (v2)
    {
      Log::Stderr::self(v2);
      qword_1EB53BD80 = (uint64_t)&unk_1EF426E80;
      unk_1EB53BD88 = &qword_1EB53BD90;
      __cxa_atexit((void (*)(void *))Log::DateTime::~DateTime, &qword_1EB53BD80, &dword_1A0FEE000);
      __cxa_guard_release(&_MergedGlobals_34);
    }
  }
  return &qword_1EB53BD80;
}

void Log::Stderr::self(Log::Stderr *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB53BD78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB53BD78))
  {
    qword_1EB53BD90 = (uint64_t)&unk_1EF426E58;
    unk_1EB53BD98 = 0;
    __cxa_atexit((void (*)(void *))Log::Stderr::~Stderr, &qword_1EB53BD90, &dword_1A0FEE000);
    __cxa_guard_release(&qword_1EB53BD78);
  }
}

void Log::Stderr::~Stderr(Log::Stderr *this)
{
}

uint64_t Log::Stderr::emit(Log::Stderr *this, const char *__ptr, size_t __size)
{
  fwrite(__ptr, __size, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(*(void *)result + 16);
    return v5();
  }
  return result;
}

void Log::DateTime::~DateTime(Log::DateTime *this)
{
}

uint64_t Log::DateTime::format(Log::DateTime *this, const char **a2, const char *a3, const char *a4, char **a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  gettimeofday(&v17, 0);
  localtime_r(&v17.tv_sec, &v18);
  int v10 = snprintf(__str, 0x400uLL, "%d-%.2d-%.2d %.2d:%.2d:%.2d,%.3d %s.%s: ", v18.tm_year + 1900, v18.tm_mon + 1, v18.tm_mday, v18.tm_hour, v18.tm_min, v18.tm_sec, v17.tv_usec / 1000, a2[2], a3);
  int v11 = 1024 - v10;
  uint64_t v12 = v10;
  uint64_t v13 = &__str[v10];
  int v14 = vsnprintf(v13, 1024 - v10, a4, *a5);
  if (v14 < 0 || v14 > v11) {
    int v14 = snprintf(v13, v11, "<log message too large>");
  }
  uint64_t v15 = v12 + v14;
  __str[v15] = 10;
  __str[(int)v15 + 1] = 0;
  return (*(uint64_t (**)(void, char *))(**((void **)this + 1) + 16))(*((void *)this + 1), __str);
}

void Log::~Log(Log *this)
{
}

uint64_t BufferPool::pop(BufferPool *this)
{
  return LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)this + 8, *((void *)this + 1));
}

uint64_t BufferPool::push(uint64_t this, Pending *a2)
{
  if (a2)
  {
    uint64_t v3 = this;
    if (*(_OWORD *)((char *)a2 + 8) != 0)
    {
      this = fprintf((FILE *)*MEMORY[0x1E4F143C8], "fatal: %s\n", "push (invalid link)");
      MEMORY[0] = 0;
    }
    uint64_t v4 = *(void *)(v3 + 8);
    *((void *)a2 + 2) = v4;
    if (v4) {
      *(void *)(v4 + 8) = a2;
    }
    *(void *)(v3 + 8) = a2;
    if (!*(void *)(v3 + 16)) {
      *(void *)(v3 + 16) = a2;
    }
    ++*(_DWORD *)(v3 + 24);
  }
  return this;
}

void BufferPool::read(BufferPool *this, int a2, void *a3)
{
  __assert_rtn("read", "buffer.h", 308, "\"unexpected Splicing call\"==0");
}

ssize_t Socket::read(Socket *this, void *a2, size_t a3)
{
  return recv(*((_DWORD *)this + 4), a2, a3, 0x80000);
}

void Socket::~Socket(Socket *this)
{
}

Socket *Socket::close(Socket *this)
{
  int v2 = *((_DWORD *)this + 4);
  if (v2 != -1) {
    close(v2);
  }
  *((_DWORD *)this + 4) = -1;
  return this;
}

uint64_t Socket::connect(Socket *a1, uint64_t a2)
{
  int v4 = *((_DWORD *)a1 + 4);
  int v5 = (const sockaddr *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 48))(a2);
  socklen_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  if (connect(v4, v5, v6)) {
    return Socket::error(a1, "Socket.connect", 0) - 1;
  }
  else {
    return 0;
  }
}

ssize_t Socket::write(Socket *this, const void *a2, size_t a3)
{
  return send(*((_DWORD *)this + 4), a2, a3, 0x80000);
}

ssize_t Socket::read(Socket *this, void *a2, int a3, int a4)
{
  return recv(*((_DWORD *)this + 4), a2, a3, a4 | 0x80000u);
}

ssize_t Socket::write(Socket *this, const void *a2, size_t a3, int a4)
{
  return send(*((_DWORD *)this + 4), a2, a3, a4 | 0x80000u);
}

uint64_t Socket::server(int *a1, uint64_t a2, int a3, int *a4)
{
  int v4 = (int)a4;
  int v8 = a3;
  uint64_t result = Socket::set((Socket *)a1, &v8, a3, a4);
  if (result)
  {
    uint64_t result = Socket::bind((Socket *)a1, a2);
    if (result)
    {
      if (listen(a1[4], v4)) {
        return Socket::error((Socket *)a1, "Socket.listen", 0);
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

BOOL Socket::pending(Socket *this)
{
  return *__error() == 35 || *__error() == 35 || *__error() == 36;
}

char *Socket::strerror(Socket *this, int a2)
{
  if (a2)
  {
    int v5 = 0;
    unsigned int v4 = 4;
    if (Socket::get(this, 0xFFFF, 4103, &v5, &v4)) {
      int v2 = v5;
    }
    else {
      int v2 = 0;
    }
  }
  else
  {
    int v2 = *__error();
  }
  return strerror(v2);
}

uint64_t Socket::readmore(Socket *this)
{
  return 0;
}

ssize_t non-virtual thunk to'Socket::write(Socket *this, const void *a2, size_t a3)
{
  return send(*((_DWORD *)this + 2), a2, a3, 0x80000);
}

void non-virtual thunk to'Socket::~Socket(Socket *this)
{
}

uint64_t Socket::bind(Socket *a1, uint64_t a2)
{
  int v4 = *((_DWORD *)a1 + 4);
  int v5 = (const sockaddr *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 48))(a2);
  socklen_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  if (!bind(v4, v5, v6)) {
    return 1;
  }
  return Socket::error(a1, "Socket.bind", 0);
}

uint64_t Socket::set(Socket *this, void *a2, int a3, int *a4)
{
  if (!setsockopt(*((_DWORD *)this + 4), 0xFFFF, 4, a2, 4u)) {
    return 1;
  }
  return Socket::error(this, "Socket.set", 0);
}

void NPTuscanyClient::NPTuscanyClient(NPTuscanyClient *this, NPTunnelTuscany *a2, NSData *a3, NPTuscanyConfig *a4)
{
  BOOL v7 = a2;
  int v8 = a3;
  Client::Client((uint64_t)this, (uint64_t)a4, (uint64_t)a4 + 64, (uint64_t)a4 + 56, (uint64_t)a4 + 104, 0);
  *(void *)this = &unk_1EF426898;
  *((void *)this + 2) = &unk_1EF426980;
  *((void *)this + 3) = &unk_1EF4269A8;
  objc_initWeak((id *)this + 60, v7);
  *((void *)this + 6(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = a4;
  uint64_t v9 = [(NPTunnelTuscany *)v7 maxFrameSize];
  uint64_t v10 = 1280;
  if (v9) {
    uint64_t v10 = v9;
  }
  *((void *)this + 33) = v10;
  *((_OWORD *)this + 3(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  if ([(NSData *)v8 length] == 96)
  {
    int v11 = v8;
    memcpy((char *)this + 544, [(NSData *)v11 bytes], [(NSData *)v11 length]);
  }
  else
  {
    *((_OWORD *)this + 38) = 0u;
    *((_OWORD *)this + 39) = 0u;
    *((_OWORD *)this + 36) = 0u;
    *((_OWORD *)this + 37) = 0u;
    *((_OWORD *)this + 34) = 0u;
    *((_OWORD *)this + 35) = 0u;
  }
}

void sub_1A1028888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Client::Client(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  FrameStream::FrameStream(a1, a2, a5, a3, a6);
  *(_DWORD *)(v8 + 296) = 0;
  *(_OWORD *)(v8 + 264) = 0u;
  *(_OWORD *)(v8 + 280) = 0u;
  *(_OWORD *)(v8 + 304) = 0u;
  *(_OWORD *)(v8 + 320) = 0u;
  *(_OWORD *)(v8 + 336) = 0u;
  *(void *)uint64_t v8 = &unk_1EF426BC8;
  *(void *)(v8 + 16) = &unk_1EF426CB0;
  *(void *)(v8 + 24) = &unk_1EF426CD8;
  *(void *)(v8 + 352) = a4;
  *(void *)(v8 + 360) = 0;
  *(void *)(v8 + 368) = 0;
  *(void *)(v8 + 376) = 0;
  *(void *)(v8 + 384) = &unk_1EF426F28;
  Crypto::zero((unsigned char *)(v8 + 392), 0x20uLL);
  Crypto::zero((unsigned char *)(a1 + 424), 0x20uLL);
  *(void *)(a1 + 456) = -1;
  *(void *)(a1 + 464) = -1;
  *(unsigned char *)(a1 + 472) = 0;
  return a1;
}

void Client::~Client(Client *this)
{
  *(void *)this = &unk_1EF426BC8;
  *((void *)this + 2) = &unk_1EF426CB0;
  *((void *)this + 3) = &unk_1EF426CD8;
  Crypto::Session::~Session((Client *)((char *)this + 384));
  PendingStream::~PendingStream(this);
}

void NPTuscanyClient::~NPTuscanyClient(id *this)
{
  objc_destroyWeak(this + 60);
  *this = &unk_1EF426BC8;
  this[2] = &unk_1EF426CB0;
  this[3] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
}

{
  uint64_t vars8;

  objc_destroyWeak(this + 60);
  *this = &unk_1EF426BC8;
  this[2] = &unk_1EF426CB0;
  this[3] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
  JUMPOUT(0x1A622A8A0);
}

uint64_t Client::flush(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 472))
  {
    Log::trace(*(Log **)(a1 + 32), "connected");
    *(unsigned char *)(a1 + 472) = 1;
  }
  return NPFrameStream::flush((uint64_t *)a1);
}

void NPTuscanyClient::dispose(id *this, const char *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  socklen_t v6 = this + 60;
  id WeakRetained = objc_loadWeakRetained(this + 60);

  if (WeakRetained)
  {
    if (a3)
    {
      uint64_t v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_loadWeakRetained(v6);
        int v14 = [v13 identifier];
        int v15 = 138412546;
        id v16 = v14;
        __int16 v17 = 2080;
        tm v18 = a2;
        _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "%@: Dispose called with error: %s", (uint8_t *)&v15, 0x16u);
      }
      NPFrameStream::logCurrentState((NPFrameStream *)this, 0);
      id v9 = objc_loadWeakRetained(v6);
      [v9 sendUsageReportWithRTT:0xFFFFFFFFLL geohash:0 fallbackReason:31];

      id v10 = objc_loadWeakRetained(v6);
      [v10 setFallbackReason:31];

      if (a2)
      {
        int v11 = [NSString stringWithUTF8String:a2];
      }
      else
      {
        int v11 = 0;
      }
      +[NPDiagnosticReport logInternalError:@"TunnelDisposed" context:v11];
      id v12 = objc_loadWeakRetained(v6);
      [v12 cancelConnection];
    }
    objc_storeWeak(v6, 0);
  }
}

void sub_1A1028DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Client::traffic(_DWORD *a1, uint64_t a2)
{
  if ((*(uint64_t (**)(_DWORD *))(*(void *)a1 + 200))(a1))
  {
    switch(*(unsigned char *)(a2 + 18))
    {
      case 0:
        uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a1 + 152))(a1, a2);
        a1[95] += *(_DWORD *)(a2 + 24);
        return result;
      case 1:
        uint64_t v9 = *(unsigned __int16 *)(a2 + 16) - 24;
        uint64_t v10 = a2 + 24;
        int v11 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 144);
        id v12 = a1;
        uint64_t v13 = a2;
        goto LABEL_10;
      case 3:
        int v14 = *(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a1 + 160);
        int v15 = a1;
        uint64_t v16 = a2;
        goto LABEL_23;
      case 4:
        uint64_t v9 = *(unsigned __int16 *)(a2 + 16) - 57;
        uint64_t v10 = a2 + 57;
        int v11 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 176);
        id v12 = a1;
        uint64_t v13 = a2;
LABEL_10:
        uint64_t result = v11(v12, v13, v10, v9);
        break;
      case 5:
        uint64_t v8 = a2 + 25;
        int v5 = *(uint64_t (**)(_DWORD *, const char *, uint64_t))(*(void *)a1 + 184);
        BOOL v7 = a1;
        socklen_t v6 = (const char *)a2;
        return v5(v7, v6, v8);
      case 9:
        int v14 = *(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a1 + 168);
        int v15 = a1;
        uint64_t v16 = a2;
LABEL_23:
        uint64_t result = v14(v15, v16);
        break;
      default:
        int v5 = *(uint64_t (**)(_DWORD *, const char *, uint64_t))(*(void *)a1 + 80);
        socklen_t v6 = "unsupported cmd";
        goto LABEL_5;
    }
  }
  else
  {
    int v5 = *(uint64_t (**)(_DWORD *, const char *, uint64_t))(*(void *)a1 + 80);
    socklen_t v6 = "decrypt failed";
LABEL_5:
    BOOL v7 = a1;
    uint64_t v8 = 1;
    return v5(v7, v6, v8);
  }
  return result;
}

id NPTuscanyClient::tunnel(id *this)
{
  id WeakRetained = objc_loadWeakRetained(this + 60);
  return WeakRetained;
}

void NPTuscanyClient::inbound(id *this, Frame::Data *a2, const void *a3, int a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *((unsigned int *)a2 + 5);
  kdebug_trace();
  uint64_t v9 = nplog_obj();
  uint64_t v10 = v9;
  if (a3 && a4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained(this + 60);
      char v21 = [WeakRetained identifier];
      int v22 = *((_DWORD *)a2 + 5);
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v21;
      __int16 v26 = 1024;
      int v27 = a4;
      __int16 v28 = 1024;
      int v29 = v22;
      _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "%@: Received a %d-byte data frame for channel %u", buf, 0x18u);
    }
    id v11 = this[34];
    this[34] = 0;
    size_t v12 = a4;
    uint64_t v13 = dispatch_get_global_queue(0, 0);
    destructor[0] = MEMORY[0x1E4F143A8];
    destructor[1] = 3221225472;
    destructor[2] = ___ZN15NPTuscanyClient7inboundERN5Frame4DataEPKvi_block_invoke;
    destructor[3] = &__block_descriptor_40_e5_v8__0l;
    destructor[4] = v11;
    int v14 = dispatch_data_create(a3, v12, v13, destructor);

    id v15 = objc_loadWeakRetained(this + 60);
    [v15 sendData:v14 toClientFlow:v8];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_loadWeakRetained(this + 60);
      __int16 v17 = [v16 identifier];
      int v18 = *((_DWORD *)a2 + 5);
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v17;
      __int16 v26 = 1024;
      int v27 = v18;
      _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Received a 0-byte data frame for channel %u", buf, 0x12u);
    }
    int v14 = objc_loadWeakRetained(this + 60);
    id v19 = (id)[v14 handleFlowClosed:v8 withFallbackReason:12];
  }
}

void sub_1A1029348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NPTuscanyClient::inbound(id *this, Frame::Ack *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((*((_DWORD *)a2 + 6) & 0x80000000) != 0) {
    __assert_rtn("inbound", "NPTuscanyClient.mm", 107, "ack.bytes >= 0");
  }
  if (*((_DWORD *)a2 + 5))
  {
    int v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained(this + 60);
      BOOL v7 = [WeakRetained identifier];
      int v9 = *((_DWORD *)a2 + 5);
      int v8 = *((_DWORD *)a2 + 6);
      int v10 = 138412802;
      id v11 = v7;
      __int16 v12 = 1024;
      int v13 = v8;
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_debug_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEBUG, "%@: Received a %u-byte ack for channel %u", (uint8_t *)&v10, 0x18u);
    }
    id v5 = objc_loadWeakRetained(this + 60);
    [v5 increaseWindowSizeForFlow:*((unsigned int *)a2 + 5) byBytes:*((int *)a2 + 6)];
  }
}

void sub_1A10294CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NPTuscanyClient::inbound(id *this, Frame::Hack *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  int v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(this + 60);
    socklen_t v6 = [WeakRetained identifier];
    int v7 = *((_DWORD *)a2 + 5);
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 1024;
    int v12 = v7;
    _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Received Hello ack with timestamp: %u", (uint8_t *)&v9, 0x12u);
  }
  id v8 = objc_loadWeakRetained(this + 60);
  [v8 handleHelloAck:*((unsigned int *)a2 + 5)];
}

void sub_1A1029610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NPTuscanyClient::inbound(id *this, Frame::Ping *a2)
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  int v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained(this + 60);
    __int16 v11 = [WeakRetained identifier];
    int v12 = *((_DWORD *)a2 + 8);
    int v13 = *((_DWORD *)a2 + 9);
    *(_DWORD *)buf = 138412802;
    id v19 = v11;
    __int16 v20 = 1024;
    *(_DWORD *)char v21 = v12;
    v21[2] = 1024;
    *(_DWORD *)&v21[3] = v13;
    _os_log_debug_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEBUG, "%@: Received ping response with RTT %u us, variation %u us", buf, 0x18u);
  }
  unsigned int v5 = *((_DWORD *)a2 + 8);
  if (v5) {
    uint64_t v6 = v5 / 0x3E8 + 1;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  char v17 = 0;
  int v16 = *((_DWORD *)a2 + 10);
  if ((_BYTE)v16) {
    int v7 = (void *)[[NSString alloc] initWithCString:&v16 encoding:4];
  }
  else {
    int v7 = 0;
  }
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v14 = objc_loadWeakRetained(this + 60);
    int v15 = [v14 identifier];
    *(_DWORD *)buf = 138412546;
    id v19 = v15;
    __int16 v20 = 2112;
    *(void *)char v21 = v7;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "%@: Received geohash %@ from ping response", buf, 0x16u);
  }
  id v9 = objc_loadWeakRetained(this + 60);
  [v9 handlePingResponseRTT:v6 geohash:v7];
}

void sub_1A1029828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NPTuscanyClient::inbound(Log **this, Frame::Request *a2, const void *a3, int a4)
{
  Log::info(this[4], "unhandled request for %llx with %d bytes on channel %d", *((void *)a2 + 3), a4, *((_DWORD *)a2 + 5));
  uint64_t v6 = *((unsigned int *)a2 + 5);
  int v7 = (uint64_t (*)(Log **, uint64_t, uint64_t))*((void *)*this + 13);
  return v7(this, v6, 1);
}

void NPTuscanyClient::inbound(id *this, Frame::Exception *a2, const void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = *((char *)a2 + 24);
  if (v5 > 5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1A1092DC8[v5];
  }
  int v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(this + 60);
    uint64_t v9 = [WeakRetained identifier];
    int v10 = (void *)v9;
    int v11 = *((_DWORD *)a2 + 5);
    unint64_t v12 = *((unsigned __int8 *)a2 + 24);
    if (v12 > 5) {
      int v13 = "<unknown>";
    }
    else {
      int v13 = (&Frame::Exception::label(int)::names)[v12];
    }
    int v17 = 138413058;
    uint64_t v18 = v9;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 1024;
    int v22 = v12;
    __int16 v23 = 2080;
    int v24 = v13;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Received exception on %u: %d (%s)", (uint8_t *)&v17, 0x22u);
  }
  id v14 = &this[*((unsigned __int8 *)a2 + 24)];
  v14[62] = (char *)v14[62] + 1;
  id v15 = objc_loadWeakRetained(this + 60);
  id v16 = (id)[v15 handleFlowClosed:*((unsigned int *)a2 + 5) withFallbackReason:v6];
}

void sub_1A1029A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Client::encrypt(uint64_t a1, uint64_t a2)
{
  if ((((uint64_t (*)(uint64_t, uint64_t, void))Frame::Prefix::meta(void)::meta[5
                                                                                         * *(unsigned __int8 *)(a2 + 18)
                                                                                         + 3])(a2, a1 + 384, 0) & 1) != 0)return 1;
  int v4 = *(Log **)(a1 + 32);
  return Log::error(v4, "failed to encrypt");
}

uint64_t Client::decrypt(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))Frame::Prefix::meta(void)::meta[5
                                                                                           * *(unsigned __int8 *)(a2 + 18)
                                                                                           + 4])(a2, a1 + 384, 1);
}

uint64_t Client::transmit(Client *this, Pending *a2, Transfer *a3)
{
  if ((*((unsigned char *)this + 84) & 9) != 0
    || (uint64_t v5 = (*(uint64_t (**)(Pending *, Pending *, Transfer *))(*(void *)a2 + 32))(a2, a2, a3),
        !(*(unsigned int (**)(Client *, uint64_t))(*(void *)this + 192))(this, v5)))
  {
    (*(void (**)(Pending *))(*(void *)a2 + 24))(a2);
    return 0;
  }
  else
  {
    Client::enqueue((uint64_t)this, a2);
    return 1;
  }
}

void non-virtual thunk to'NPTuscanyClient::~NPTuscanyClient(id *this)
{
  int v2 = (PendingStream *)(this - 2);
  objc_destroyWeak(this + 58);
  *(this - 2) = &unk_1EF426BC8;
  *this = &unk_1EF426CB0;
  this[1] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream(v2);
}

{
  PendingStream *v2;
  uint64_t vars8;

  int v2 = (PendingStream *)(this - 2);
  objc_destroyWeak(this + 58);
  *(this - 2) = &unk_1EF426BC8;
  *this = &unk_1EF426CB0;
  this[1] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream(v2);
  JUMPOUT(0x1A622A8A0);
}

uint64_t non-virtual thunk to'Client::transmit(Client *this, Pending *a2, Transfer *a3)
{
  return Client::transmit((Client *)((char *)this - 24), a2, a3);
}

unsigned char *Client::dispose(Client *this, const char *a2, int a3)
{
  uint64_t v6 = *((void *)this + 45);
  if (v6)
  {
    int v7 = *(_DWORD *)(v6 + 24);
    if (v7 != -1) {
      close(v7);
    }
    *(_DWORD *)(v6 + 24) = -1;
    MEMORY[0x1A622A8A0](v6, 0x10A0C40F4DCF604);
    *((void *)this + 45) = 0;
  }
  NPFrameStream::dispose(this, a2, a3);
  *((unsigned char *)this + 472) = 0;
  Crypto::zero((unsigned char *)this + 392, 0x20uLL);
  uint64_t result = Crypto::zero((unsigned char *)this + 424, 0x20uLL);
  *((void *)this + 57) = -1;
  *((void *)this + 58) = -1;
  return result;
}

void Client::inbound(Log **this, Frame::Data *a2, const void *a3, int a4)
{
}

uint64_t Client::inbound(Log **this, Frame::Ack *a2)
{
  return Log::info(this[4], "unhandled ack on channel %d", *((_DWORD *)a2 + 5));
}

uint64_t Client::inbound(Log **this, Frame::Hack *a2)
{
  return Log::info(this[4], "unhandled hack");
}

uint64_t Client::inbound(Log **this, Frame::Ping *a2)
{
  return Log::info(this[4], "unhandled ping");
}

uint64_t Client::inbound(Log **this, Frame::Request *a2, const void *a3, int a4)
{
  Log::info(this[4], "unhandled request for %llx with %d bytes on channel %d", *((void *)a2 + 3), a4, *((_DWORD *)a2 + 5));
  uint64_t v6 = *((unsigned int *)a2 + 5);
  int v7 = (uint64_t (*)(Log **, uint64_t, uint64_t))*((void *)*this + 13);
  return v7(this, v6, 1);
}

void Client::inbound(Client *this, Frame::Exception *a2, const void *a3)
{
  uint64_t v3 = (Log *)*((void *)this + 4);
  unint64_t v4 = *((unsigned __int8 *)a2 + 24);
  if (v4 > 5) {
    uint64_t v5 = "<unknown>";
  }
  else {
    uint64_t v5 = (&Frame::Exception::label(int)::names)[v4];
  }
  Log::fatal(v3, "unhandled exception '%s' on channel %d", v5, *((_DWORD *)a2 + 5));
}

BOOL Crypto::Session::encrypt(Crypto::Session *this, int8x16_t *a2, size_t __n, __int32 a4, unsigned int *a5)
{
  int v6 = __n;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    LODWORD(v9) = *a5;
    if (*a5 == a4) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v9;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  size_t v10 = v9 + __n;
  if (v10 >= 0x61) {
    __assert_rtn("encrypt", "crypto.h", 658, "plainsz + skpsz <= sizeof(pt)");
  }
  uint64_t v11 = (a4 + __n);
  if (a4)
  {
    memcpy(__dst, &a2[5], __n);
    Crypto::zero(a2, 0x40uLL);
    Crypto::Bits::stream_to((Crypto::Session *)((char *)this + 8), (Crypto *)a2, (unsigned __int8 *)a2, v11 + 80, *((void *)this + 9), 0);
    memcpy(&a2[5], __dst, v10);
    Crypto::zero(__dst, v10);
  }
  else
  {
    __dst[0] = *((void *)this + 9);
    Crypto::zero(a2, 0x40uLL);
    chacha20_all_64x64();
  }
  Crypto::zero((int8x16_t *)a2[4].i8, 0x10uLL);
  unint64_t v12 = *((void *)this + 9);
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int8x16_t v14 = a2[4];
    a2[4].i64[0] = v12;
    a2[4].i32[2] = v6 + 16;
    a2[4].i32[3] = a4;
    poly1305();
    a2[4] = veorq_s8(veorq_s8(v16, v14), a2[2]);
    *((void *)this + 9) += 2;
  }
  return v12 < 0xFFFFFFFFFFFFFFFELL;
}

uint64_t Crypto::Session::decrypt(Crypto::Session *this, int8x16_t *a2, unsigned int a3, unsigned __int32 a4, unsigned int *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    unint64_t v9 = *a5 + (unint64_t)a3;
    if (v9 >= 0x61) {
      __assert_rtn("decrypt", "crypto.h", 737, "!_decsz || plainsz + decsz <= sizeof(pt)");
    }
    size_t v10 = a3;
  }
  else
  {
    size_t v10 = a3;
    unint64_t v9 = a4 + (unint64_t)a3;
  }
  __dst[0].i64[0] = *((void *)this + 10);
  Crypto::zero(a2, 0x40uLL);
  chacha20_all_64x64();
  unint64_t v11 = *((void *)this + 10);
  if (v11 >= 0xFFFFFFFFFFFFFFFELL)
  {
    __int8 v14 = a2[4].i8[0];
    LOBYTE(v15) = a2[4].i8[1];
    LOBYTE(v16) = a2[4].i8[2];
    LOBYTE(v17) = a2[4].i8[3];
    LOBYTE(v18) = a2[4].i8[4];
    LOBYTE(v19) = a2[4].i8[5];
    LOBYTE(v20) = a2[4].i8[6];
    LOBYTE(v2(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = a2[4].i8[7];
    __int8 v13 = a2[4].i8[8];
    LOBYTE(v22) = a2[4].i8[9];
    LOBYTE(v23) = a2[4].i8[10];
    LOBYTE(v24) = a2[4].i8[11];
    LOBYTE(v25) = a2[4].i8[12];
    LOBYTE(v26) = a2[4].i8[13];
    LOBYTE(v27) = a2[4].i8[14];
    LOBYTE(v28) = a2[4].i8[15];
  }
  else
  {
    int8x16_t v35 = a2[4];
    a2[4].i64[0] = v11;
    a2[4].i32[2] = a3 + 16;
    a2[4].i32[3] = a4;
    poly1305();
    int8x16_t v12 = veorq_s8(veorq_s8(__dst[0], v35), a2[2]);
    a2[4] = v12;
    __int8 v13 = v12.i8[8];
    __int8 v14 = v12.i8[0];
    unint64_t v15 = (unint64_t)v12.i64[0] >> 8;
    unint64_t v16 = (unint64_t)v12.i64[0] >> 16;
    unint64_t v17 = (unint64_t)v12.i64[0] >> 24;
    unint64_t v18 = HIDWORD(v12.i64[0]);
    unint64_t v19 = (unint64_t)v12.i64[0] >> 40;
    unint64_t v20 = HIWORD(v12.i64[0]);
    unint64_t v21 = HIBYTE(v12.i64[0]);
    unint64_t v22 = (unint64_t)v12.i64[1] >> 8;
    unint64_t v23 = (unint64_t)v12.i64[1] >> 16;
    unint64_t v24 = (unint64_t)v12.i64[1] >> 24;
    unint64_t v25 = HIDWORD(v12.i64[1]);
    unint64_t v26 = (unint64_t)v12.i64[1] >> 40;
    unint64_t v27 = HIWORD(v12.i64[1]);
    unint64_t v28 = HIBYTE(v12.i64[1]);
  }
  unsigned int v29 = (v15 | v17 | v14 | v16 | v18 | v19 | v20 | v21 | v13 | v22 | v23 | v24 | v25 | v26 | v27 | v28)
      + 511;
  if ((v29 & 0x100) != 0)
  {
    unint64_t v30 = *((void *)this + 10);
    if (a4)
    {
      unint64_t v31 = v9 + 16;
      unint64_t v32 = (Crypto *)&a2[4];
      id v33 = a2 + 5;
      memcpy(__dst, v33, v10);
      Crypto::Bits::stream_to((Crypto::Session *)((char *)this + 40), v32, (unsigned __int8 *)v32, v31, v30, 1);
      memcpy(v33, __dst, v10);
      Crypto::zero(__dst, v10);
      unint64_t v30 = *((void *)this + 10);
    }
    *((void *)this + 10) = v30 + 2;
  }
  return (v29 >> 8) & 1;
}

unsigned char *Crypto::zero(unsigned char *this, unint64_t a2)
{
  unint64_t v2 = -(int)this & 7;
  if (v2)
  {
    if (v2 >= a2) {
      unint64_t v2 = a2;
    }
    a2 -= v2;
    switch(v2)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        goto LABEL_8;
      case 5uLL:
        goto LABEL_7;
      case 6uLL:
        goto LABEL_6;
      case 7uLL:
        *this++ = 0;
LABEL_6:
        *this++ = 0;
LABEL_7:
        *this++ = 0;
LABEL_8:
        *this++ = 0;
LABEL_9:
        *this++ = 0;
LABEL_10:
        *this++ = 0;
LABEL_11:
        *this++ = 0;
        break;
      default:
        break;
    }
  }
  if (a2 >= 8)
  {
    unint64_t v3 = a2 >> 3;
    do
    {
      *(void *)this = 0;
      this += 8;
      --v3;
    }
    while (v3);
  }
  switch(a2 & 7)
  {
    case 1uLL:
      goto LABEL_22;
    case 2uLL:
      goto LABEL_21;
    case 3uLL:
      goto LABEL_20;
    case 4uLL:
      goto LABEL_19;
    case 5uLL:
      goto LABEL_18;
    case 6uLL:
      goto LABEL_17;
    case 7uLL:
      *this++ = 0;
LABEL_17:
      *this++ = 0;
LABEL_18:
      *this++ = 0;
LABEL_19:
      *this++ = 0;
LABEL_20:
      *this++ = 0;
LABEL_21:
      *this++ = 0;
LABEL_22:
      *this = 0;
      break;
    default:
      return this;
  }
  return this;
}

void __clang_call_terminate(void *a1)
{
}

uint64_t Crypto::Bits::stream_to(Crypto::Bits *this, Crypto *a2, unsigned __int8 *a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  if (a6)
  {
    chacha20_init_64x64();
    chacha20_update();
    return chacha20_final();
  }
  else
  {
    if (!a3) {
      Crypto::zero(a2, a4);
    }
    return chacha20_all_64x64();
  }
}

void PendingStream::~PendingStream(PendingStream *this)
{
  *(void *)this = &unk_1EF4267A8;
  *((void *)this + 2) = &unk_1EF426818;
  *((void *)this + 3) = &unk_1EF426840;
  PendingStream::dispose(this, "dtor", 0);
}

uint64_t Transfer::eof(Transfer *this)
{
  return 0;
}

uint64_t Transfer::advise(Transfer *this)
{
  return 0;
}

void Log::fatal(Log *this, const char *a2, ...)
{
  va_start(va, a2);
  if (*((int *)this + 2) <= 5)
  {
    va_copy(v2, va);
    (*(void (**)(void, Log *, const char *, const char *, va_list *))(**((void **)this + 3) + 16))(*((void *)this + 3), this, "fatal", a2, &v2);
  }
  exit(1);
}

void Crypto::Session::~Session(Crypto::Session *this)
{
  *(void *)this = &unk_1EF426F28;
  va_list v2 = (char *)this + 8;
  Crypto::zero((unsigned char *)this + 8, 0x20uLL);
  Crypto::zero((unsigned char *)this + 40, 0x20uLL);
  *((void *)this + 9) = -1;
  *((void *)this + 10) = -1;
  Crypto::zero((unsigned char *)this + 40, 0x20uLL);
  Crypto::zero(v2, 0x20uLL);
}

uint64_t ___ZN15NPTuscanyClient7inboundERN5Frame4DataEPKvi_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 24))();
}

uint64_t Client::enqueue(uint64_t this, Pending *a2)
{
  uint64_t v2 = this;
  if (a2)
  {
    if (*((void *)a2 + 1) || *((void *)a2 + 2))
    {
      this = fprintf((FILE *)*MEMORY[0x1E4F143C8], "fatal: %s\n", "append (invalid link)");
      MEMORY[0] = 0;
    }
    uint64_t v4 = *(void *)(v2 + 64);
    *((void *)a2 + (*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v4;
    if (v4) {
      *(void *)(v4 + 16) = a2;
    }
    *(void *)(v2 + 64) = a2;
    if (!*(void *)(v2 + 56)) {
      *(void *)(v2 + 56) = a2;
    }
    ++*(_DWORD *)(v2 + 72);
    uint64_t v5 = *(int **)(v2 + 32);
    if (v5[2] <= 0)
    {
      int v6 = *(_DWORD *)(v2 + 80);
      int v7 = (const char *)(*(uint64_t (**)(Pending *))(*(void *)a2 + 40))(a2);
      this = Log::trace((Log *)v5, "[%d] queued <%s:%ld>", v6, v7, *((void *)a2 + 4));
    }
  }
  if (*(_DWORD *)(v2 + 72) == 1 && *(unsigned char *)(v2 + 472))
  {
    return NPFrameStream::flush((uint64_t *)v2);
  }
  return this;
}

void NPTuscanyLoopbackClient::~NPTuscanyLoopbackClient(id *this)
{
  objc_destroyWeak(this + 60);
  *this = &unk_1EF426BC8;
  this[2] = &unk_1EF426CB0;
  this[3] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
}

{
  uint64_t vars8;

  objc_destroyWeak(this + 60);
  *this = &unk_1EF426BC8;
  this[2] = &unk_1EF426CB0;
  this[3] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
  JUMPOUT(0x1A622A8A0);
}

void NPTuscanyLoopbackClient::dispose(id *this, const char *__s1, int a3)
{
  if (strcmp(__s1, "unsupported cmd"))
  {
    NPTuscanyClient::dispose(this, __s1, a3);
  }
}

void NPTuscanyLoopbackClient::inbound(id *this, Frame::Request *a2, const void *a3, int a4)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[5] = *((_DWORD *)a2 + 5);
  NPTuscanyClient::inbound(this, (Frame::Data *)v4, a3, a4);
}

uint64_t NPTuscanyLoopbackClient::encrypt()
{
  return 1;
}

uint64_t NPTuscanyLoopbackClient::decrypt()
{
  return 1;
}

void non-virtual thunk to'NPTuscanyLoopbackClient::~NPTuscanyLoopbackClient(id *this)
{
  uint64_t v2 = (PendingStream *)(this - 2);
  objc_destroyWeak(this + 58);
  *(this - 2) = &unk_1EF426BC8;
  *this = &unk_1EF426CB0;
  this[1] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream(v2);
}

{
  PendingStream *v2;
  uint64_t vars8;

  uint64_t v2 = (PendingStream *)(this - 2);
  objc_destroyWeak(this + 58);
  *(this - 2) = &unk_1EF426BC8;
  *this = &unk_1EF426CB0;
  this[1] = &unk_1EF426CD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream(v2);
  JUMPOUT(0x1A622A8A0);
}

void ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  int v7 = *(unsigned __int16 **)(a1 + 56);
  unint64_t v8 = NPTuscanyClient::maxSendSize((NPTuscanyClient *)v7, [*(id *)(a1 + 32) identifier], 1);
  if (a4 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = a4;
  }
  size_t v10 = [*(id *)(a1 + 32) extraFlowProperties];
  uint64_t v11 = [v10 serviceID];

  uint64_t v71 = 0;
  uint64_t v72 = 0;
  v69[0] = v11;
  v69[1] = a2;
  uint64_t v70 = (unsigned __int16)v9;
  HIDWORD(v70) = [*(id *)(a1 + 32) identifier];
  LODWORD(v7(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = 0x10000;
  int8x16_t v12 = (id *)(v7 + 240);
  id WeakRetained = objc_loadWeakRetained((id *)v7 + 60);
  LODWORD(v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = [WeakRetained flowIsFirstFlow:*(void *)(a1 + 32)];

  if (v11)
  {
    id v14 = objc_loadWeakRetained((id *)v7 + 60);
    int v15 = [v14 dayPassSessionCounter];

    id v16 = objc_loadWeakRetained((id *)v7 + 60);
    char v68 = [v16 dayPassCreationDate];

    if (!v15)
    {
      unint64_t v26 = nplog_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = objc_loadWeakRetained(v12);
        unint64_t v28 = [v27 identifier];
        *(_DWORD *)unint64_t v76 = 138412290;
        *(void *)&v76[4] = v28;
        _os_log_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEFAULT, "%@: No DayPass available, cannot establish tunnel connection", v76, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_40;
    }
    *((_DWORD *)v7 + 159) = v15;
    if (v7[313])
    {
      inet_ntop(2, v7 + 312, (char *)v76, 0x2Eu);
      unint64_t v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = objc_loadWeakRetained((id *)v7 + 60);
        unint64_t v19 = [v18 identifier];
        int v20 = *((_DWORD *)v7 + 159);
        [v68 timeIntervalSinceNow];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v20;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v76;
        __int16 v74 = 2048;
        double v75 = fabs(v21);
        _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "%@: DayPass session count = %u, addr = %s, age = %f", buf, 0x26u);
      }
    }
    else
    {
      unsigned int v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v67 = objc_loadWeakRetained((id *)v7 + 60);
        unint64_t v30 = [v67 identifier];
        int v31 = *((_DWORD *)v7 + 159);
        int v32 = v7[312];
        int v33 = v7[313];
        [v68 timeIntervalSinceNow];
        *(_DWORD *)unint64_t v76 = 138413314;
        *(void *)&v76[4] = v30;
        *(_WORD *)&v76[12] = 1024;
        *(_DWORD *)&v76[14] = v31;
        *(_WORD *)&v76[18] = 1024;
        *(_DWORD *)&v76[20] = v32;
        *(_WORD *)&v76[24] = 1024;
        *(_DWORD *)&v76[26] = v33;
        *(_WORD *)&v76[30] = 2048;
        v77[0] = fabs(v34);
        _os_log_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_DEFAULT, "%@: DayPass session count = %u, hostid = %u, portid = %u, age = %f", v76, 0x28u);
      }
    }
    int8x16_t v35 = nplog_obj();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);

    if (v36)
    {
      uint64_t v37 = 0;
      LOBYTE(v77[0]) = 0;
      memset(v76, 0, sizeof(v76));
      uint64_t v38 = (unsigned __int8 *)(v7 + 288);
      do
      {
        uint64_t v39 = &v76[v37];
        unsigned int v40 = *v38++;
        uint8_t *v39 = Frame::Ticket::tohex(void *,void const*,unsigned long)::hexdigits[(unint64_t)v40 >> 4];
        v39[1] = Frame::Ticket::tohex(void *,void const*,unsigned long)::hexdigits[v40 & 0xF];
        v37 += 2;
      }
      while (v37 != 32);
      uint64_t v41 = nplog_obj();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        id v60 = objc_loadWeakRetained((id *)v7 + 60);
        char v61 = [v60 identifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v61;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v76;
        _os_log_debug_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_DEBUG, "%@: DayPass shared MAC %s", buf, 0x16u);
      }
    }
    *(void *)unint64_t v76 = &unk_1EF426E08;
    *(void *)&v76[8] = 512;
    *(void *)&v76[16] = 0;
    *((unsigned char *)v7 + 84) &= ~1u;
    uint64_t v42 = (unsigned __int16)v70;
    char v43 = (char *)malloc_type_malloc((unsigned __int16)v70 + 265, 0xFDFA9477uLL);
    char v44 = v43;
    if (v43)
    {
      *((void *)v43 + 5) = 0;
      *(_OWORD *)(v43 + 24) = 0u;
      *(_OWORD *)(v43 + 8) = 0u;
      *(void *)char v43 = &unk_1EF426EA8;
      long long v45 = *((_OWORD *)v7 + 36);
      long long v46 = *((_OWORD *)v7 + 37);
      long long v47 = *((_OWORD *)v7 + 38);
      *(_OWORD *)(v43 + 188) = *((_OWORD *)v7 + 39);
      *(_OWORD *)(v43 + 172) = v47;
      *(_OWORD *)(v43 + 156) = v46;
      *(_OWORD *)(v43 + 140) = v45;
      *((_DWORD *)v43 + 5(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = 0;
      *((_DWORD *)v43 + 34) = 167903320;
      *((void *)v43 + 3) = v43 + 120;
      *((void *)v43 + 4) = v42 + 145;
      long long v48 = *((_OWORD *)v7 + 39);
      *(_OWORD *)buf = v48;
      long long v78 = v48;
      *(_DWORD *)buf = v48 ^ 0x53497865;
      LODWORD(v78) = v48 ^ 0x7865534F;
      hchacha((unint64_t)(v7 + 272), (int *)buf, (int *)v7 + 106, 0x14uLL);
      hchacha((unint64_t)(v7 + 272), (int *)&v78, (int *)v7 + 98, 0x14uLL);
      Crypto::zero(buf, 0x10uLL);
      Crypto::zero(&v78, 0x10uLL);
      *((void *)v7 + 57) = 0;
      *((void *)v7 + 58) = 1;
      uint64_t v49 = (*(uint64_t (**)(char *))(*(void *)v44 + 32))(v44);
      if ((*(unsigned int (**)(unsigned __int16 *, uint64_t))(*(void *)v7 + 192))(v7, v49))
      {
        if (Client::populate((Log **)v7, v44 + 208, (unint64_t)v69, v50))
        {
          int v51 = *((_DWORD *)v7 + 159);
          if (v51 != -1)
          {
            *((_DWORD *)v7 + 159) = v51 + 1;
            Client::enqueue((uint64_t)v7, (Pending *)v44);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            BOOL v52 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
            id v53 = objc_loadWeakRetained((id *)v7 + 60);
            id v54 = v53;
            if (v52)
            {
              [v53 setFallbackReason:32];
              uint64_t v57 = @"HelloFrameFailed";
            }
            else
            {
              uint64_t v55 = [v53 timestamps];
              if (v55 && g_recordTimestamps && !*(void *)(v55 + 72)) {
                *(void *)(v55 + 72) = mach_absolute_time();
              }

              id v56 = objc_loadWeakRetained(v12);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v56 start];

              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
                goto LABEL_40;
              }
              id v54 = objc_loadWeakRetained(v12);
              [v54 setFallbackReason:33];
              uint64_t v57 = @"TunnelStartFailed";
            }

            +[NPDiagnosticReport logInternalError:v57 context:0];
LABEL_40:
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
              && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != v9)
            {
              uint64_t v58 = nplog_obj();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                id v62 = objc_loadWeakRetained(v12);
                char v63 = [v62 identifier];
                uint64_t v64 = [*(id *)(a1 + 32) hashKey];
                uint64_t v65 = [*(id *)(a1 + 32) identifier];
                unint64_t v66 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v9;
                *(_DWORD *)unint64_t v76 = 138413058;
                *(void *)&v76[4] = v63;
                *(_WORD *)&v76[12] = 2048;
                *(void *)&v76[14] = v64;
                *(_WORD *)&v76[22] = 2048;
                *(void *)&v76[24] = v65;
                LOWORD(v77[0]) = 2048;
                *(void *)((char *)v77 + 2) = v66;
                _os_log_debug_impl(&dword_1A0FEE000, v58, OS_LOG_TYPE_DEBUG, "%@: Flow %llu (%llu) initial data did not entirely fit in the Hello/Request frame, %lu bytes left over", v76, 0x2Au);
              }
              [*(id *)(a1 + 32) setInitialBytesLeftOver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v9];
            }

            goto LABEL_46;
          }
        }
      }
      free(v44);
    }
    Log::fatal(*((Log **)v7 + 4), "can't create Hello");
  }
  uint64_t v22 = (unsigned __int16)v70;
  unint64_t v23 = (char *)malloc_type_malloc((unsigned __int16)v70 + 169, 0x973590DuLL);
  unint64_t v25 = v23;
  if (v23)
  {
    *((void *)v23 + 5) = 0;
    *(_OWORD *)(v23 + 24) = 0u;
    *(_OWORD *)(v23 + 8) = 0u;
    *(void *)unint64_t v23 = &unk_1EF426EE8;
    if (Client::populate((Log **)v7, v23 + 112, (unint64_t)v69, v24))
    {
      v25[3] = v25 + 14;
      v25[4] = v22 + 57;
    }
    else
    {
      free(v25);
      unint64_t v25 = 0;
    }
  }
  Client::enqueue((uint64_t)v7, (Pending *)v25);
LABEL_46:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) -= v9;
  }
  else
  {
    id v59 = objc_loadWeakRetained(v12);
    objc_msgSend(*(id *)(a1 + 32), "setFallbackReason:", objc_msgSend(v59, "fallbackReason"));
  }
}

void sub_1A102B4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke_159(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a5 = 1;
  return result;
}

void AddressV4::~AddressV4(AddressV4 *this)
{
}

uint64_t AddressV4::port(AddressV4 *this)
{
  return bswap32(*((unsigned __int16 *)this + 5)) >> 16;
}

uint64_t AddressV4::port(uint64_t this, unsigned int a2)
{
  *(_WORD *)(this + 10) = bswap32(a2) >> 16;
  return this;
}

void AddressV4::dup(AddressV4 *this)
{
}

uint64_t AddressV4::namelen(AddressV4 *this)
{
  return 16;
}

uint64_t AddressV4::name(AddressV4 *this)
{
  return (uint64_t)this + 8;
}

char *Address::format(Address *this, char *a2, int a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = 64;
  int v6 = (const sockaddr *)(*(uint64_t (**)(Address *))(*(void *)this + 48))(this);
  socklen_t v7 = (*(uint64_t (**)(Address *))(*(void *)this + 40))(this);
  getnameinfo(v6, v7, a2, a3 - 6, (char *)v9 + 1, 7u, 10);
  strcat(a2, (const char *)v9);
  return a2;
}

uint64_t Client::populate(Log **a1, char *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  int v6 = a1;
  v17[1] = *MEMORY[0x1E4F143B8];
  socklen_t v7 = (int32x2_t *)(a3 - 40);
  do
  {
    size_t v8 = v7[7].u16[0];
    MEMORY[0x1F4188790](a1, a2, a3, a4);
    size_t v10 = (int32x2_t *)((char *)v17 - v9);
    uint64_t v11 = (char *)&v17[8] - v9;
    Log::trace(v6[4], "populating (ch %d, len %ld)", v7[7].i32[1], v8);
    int8x16_t v12 = (const void *)v7[6];
    v10[11] = v7[5];
    __int32 v13 = v7[7].i32[1];
    v10[13] = 0;
    v10[14] = 0;
    v10[10].i32[1] = v13;
    v10[12] = vrev64_s32(v7[8]);
    v10[10].i16[1] = 2564;
    v10[10].i16[0] = v8 + 57;
    v10[15].i8[0] = v7[9].i8[0];
    memcpy((char *)&v10[15] + 1, v12, v8);
    uint64_t v14 = (*((uint64_t (**)(Log **, char *))*v6 + 24))(v6, v11);
    if ((v14 & 1) == 0) {
      break;
    }
    size_t v15 = v8 + 57;
    a1 = (Log **)memcpy(v5, v11, v15);
    v5 += v15;
    v7 += 5;
  }
  while ((unint64_t)v7 < a3);
  return v14;
}

void Client::Hello::~Hello(Client::Hello *this)
{
}

uint64_t Client::Hello::header(Client::Hello *this)
{
  return (uint64_t)this + 120;
}

void Client::Query::~Query(Client::Query *this)
{
}

uint64_t Client::Query::header(Client::Query *this)
{
  return (uint64_t)this + 112;
}

uint64_t ___ZN6Client5chunkEPU27objcproto16OS_dispatch_data8NSObjectj_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return 1;
}

BOOL Client::ping(Client *this, int a2, uint64_t a3)
{
  int v6 = (char *)malloc_type_malloc(0xA0uLL, 0x500D4304uLL);
  if (!v6) {
    return 0;
  }
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 8) = 0u;
  *(void *)int v6 = &unk_1EF426B88;
  *((void *)v6 + 3) = v6 + 112;
  *((void *)v6 + 4) = 44;
  *((void *)v6 + 5) = 0;
  *((void *)v6 + 17) = a3;
  *((void *)v6 + 18) = 0;
  *((_DWORD *)v6 + 32) = 168362028;
  *((_DWORD *)v6 + 33) = a2;
  return ((*(uint64_t (**)(Client *, char *, void))(*(void *)this + 208))(this, v6, 0) & 1) != 0;
}

void sub_1A102D848(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A102D9C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL NSPPrivacyProxyBAAValidationReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    socklen_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8;
LABEL_24:
        int v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 16;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NSPPrivacyProxyTokenInfoReadFrom(char *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    socklen_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 3u:
          uint64_t v19 = PBReaderReadData();
          if (v19) {
            [a1 addUnactivatedTokenList:v19];
          }
          goto LABEL_25;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
LABEL_24:
          uint64_t v19 = *(void **)&a1[v18];
          *(void *)&a1[v18] = v17;
          goto LABEL_25;
        case 5u:
          uint64_t v19 = PBReaderReadData();
          if (v19) {
            [a1 addTokenRequestList:v19];
          }
LABEL_25:

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A1044C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1A10450DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Block_object_dispose((const void *)(v38 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A1046AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A1049574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1049E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1A104A9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void np_protocol_input_frame_finalizer(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;

  nw_frame_reset();
}

void np_tunnel_flow_output_frame_finalizer(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  [a3 handleOutputFrame:v5 send:a2];
  nw_frame_reset();
}

id nplog_large_obj()
{
  if (nplog_large_obj_g_large_init != -1) {
    dispatch_once(&nplog_large_obj_g_large_init, &__block_literal_global_4);
  }
  long long v0 = (void *)nplog_large_obj_large_log_obj;
  return v0;
}

uint64_t __nplog_large_obj_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.networkserviceproxy", "Large");
  uint64_t v1 = nplog_large_obj_large_log_obj;
  nplog_large_obj_large_log_obj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void nsp_print_backtrace()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)unsigned int v9 = 0u;
  long long v10 = 0u;
  int v0 = backtrace(v9, 128);
  uint64_t v1 = backtrace_symbols(v9, v0);
  uint64_t v2 = v1;
  if (v0 >= 1)
  {
    uint64_t v3 = v0;
    id v4 = v1;
    do
    {
      id v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = *v4;
        *(_DWORD *)buf = 136315138;
        char v8 = v6;
        _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "    %s", buf, 0xCu);
      }

      ++v4;
      --v3;
    }
    while (v3);
  }
  free(v2);
}

uint64_t NSPPrivacyProxySignedConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    socklen_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          long long v17 = objc_alloc_init(NSPPrivacyProxyConfiguration);
          objc_storeStrong((id *)(a1 + 24), v17);
          if PBReaderPlaceMark() && (NSPPrivacyProxyConfigurationReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_27;
          }

          return 0;
        case 2u:
          uint64_t v19 = PBReaderReadData();
          long long v20 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v19;

          continue;
        case 3u:
          PBReaderReadData();
          long long v17 = (NSPPrivacyProxyConfiguration *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [(id)a1 addCertificates:v17];
          }
LABEL_27:

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_36;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

unint64_t NSPPrivacyProxyConfigurationRawConfig(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    id v4 = (unsigned char *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v3];
    if (v4)
    {
      id v5 = (int *)MEMORY[0x1E4F940E8];
      int v6 = (int *)MEMORY[0x1E4F940E0];
      socklen_t v7 = (int *)MEMORY[0x1E4F940C8];
      char v8 = (int *)MEMORY[0x1E4F940B8];
      do
      {
        if (*(void *)&v4[*v5] >= *(void *)&v4[*v6] || v4[*v7]) {
          break;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          unint64_t v13 = *(void *)&v4[v12];
          if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0) {
            goto LABEL_14;
          }
          v9 += 7;
          if (v10++ >= 9)
          {
            unint64_t v11 = 0;
            int v16 = v4[*v7];
            goto LABEL_16;
          }
        }
        v4[*v7] = 1;
LABEL_14:
        int v16 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_16:
        if (v16 || (v11 & 7) == 4) {
          break;
        }
        if ((v11 >> 3) == 1)
        {
          PBReaderReadData();
          *(void *)a2 = (id)objc_claimAutoreleasedReturnValue();
          a2 = v4[*v7] == 0;
          goto LABEL_23;
        }
      }
      while ((PBReaderSkipValueWithTag() & 1) != 0);
    }
    a2 = 0;
LABEL_23:
  }
  return a2;
}

uint64_t NSPPrivacyProxyConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  socklen_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_88;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_90;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_88:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_90:
        uint64_t v50 = 128;
        goto LABEL_107;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 136) |= 4u;
        while (2)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              BOOL v14 = v24++ >= 9;
              if (v14)
              {
                uint64_t v25 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_94:
        *(unsigned char *)(a1 + 132) = v25 != 0;
        goto LABEL_108;
      case 3u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 136) |= 1u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v14 = v30++ >= 9;
              if (v14)
              {
                uint64_t v31 = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_98:
        *(void *)(a1 + 8) = v31;
        goto LABEL_108;
      case 5u:
        long long v36 = objc_alloc_init(NSPPrivacyProxyAuthenticationInfo);
        objc_storeStrong((id *)(a1 + 16), v36);
        if (!PBReaderPlaceMark()
          || (NSPPrivacyProxyAuthenticationInfoReadFrom((uint64_t)v36, a2) & 1) == 0)
        {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 6u:
        long long v36 = objc_alloc_init(NSPPrivacyProxyPolicyTierMap);
        [(id)a1 addPolicyTierMap:v36];
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyPolicyTierMapReadFrom((uint64_t)v36, a2) & 1) == 0) {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 7u:
        long long v36 = objc_alloc_init(NSPPrivacyProxyProxyInfo);
        [(id)a1 addProxies:v36];
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyProxyInfoReadFrom(v36, a2) & 1) == 0) {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 8u:
        long long v36 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
        [(id)a1 addPathWeights:v36];
        goto LABEL_61;
      case 9u:
        long long v36 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
        [(id)a1 addResolvers:v36];
        goto LABEL_66;
      case 0xAu:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v19 = 0;
        while (2)
        {
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 1;
            v19 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              BOOL v14 = v38++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_102:
        uint64_t v50 = 48;
        goto LABEL_107;
      case 0xBu:
        long long v36 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
        [(id)a1 addFallbackPathWeights:v36];
LABEL_61:
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyProxyPathWeightReadFrom((uint64_t)v36, a2) & 1) == 0) {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 0xCu:
        uint64_t v42 = PBReaderReadString();
        uint64_t v43 = 104;
        goto LABEL_70;
      case 0xDu:
        long long v36 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
        objc_storeStrong((id *)(a1 + 24), v36);
LABEL_66:
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyResolverInfoReadFrom((uint64_t)v36, a2) & 1) == 0) {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 0xEu:
        uint64_t v42 = PBReaderReadString();
        uint64_t v43 = 32;
LABEL_70:
        char v44 = *(void **)(a1 + v43);
        *(void *)(a1 + v43) = v42;

        goto LABEL_108;
      case 0xFu:
        long long v36 = objc_alloc_init(NSPPrivacyProxyObliviousHTTPConfig);
        [(id)a1 addObliviousConfigs:v36];
        if (!PBReaderPlaceMark()
          || (NSPPrivacyProxyObliviousHTTPConfigReadFrom((uint64_t)v36, a2) & 1) == 0)
        {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 0x10u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 136) |= 2u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v19 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v14 = v46++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_106:
        uint64_t v50 = 80;
LABEL_107:
        *(_DWORD *)(a1 + v50) = v19;
        goto LABEL_108;
      case 0x11u:
        long long v36 = objc_alloc_init(NSPPrivacyProxyProxiedContentMap);
        [(id)a1 addProxiedContentMaps:v36];
        if PBReaderPlaceMark() && (NSPPrivacyProxyProxiedContentMapReadFrom((uint64_t)v36, a2))
        {
LABEL_83:
          PBReaderRecallMark();
LABEL_84:

LABEL_108:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_110:

        return 0;
      case 0x12u:
        PBReaderReadString();
        long long v36 = (NSPPrivacyProxyAuthenticationInfo *)objc_claimAutoreleasedReturnValue();
        if (v36) {
          [(id)a1 addTrustedNetworkDiscoveredProxies:v36];
        }
        goto LABEL_84;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_108;
    }
  }
}

uint64_t NSPPrivacyProxyTokenAttesterReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    socklen_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unsigned int v24 = objc_alloc_init(NSPPrivacyProxyTokenIssuer);
        [(id)a1 addAssociatedIssuers:v24];
        if (!PBReaderPlaceMark() || !NSPPrivacyProxyTokenIssuerReadFrom((char *)v24, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 2)
      {
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v25;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v2(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTransparencyOHTTPEntryReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  socklen_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_40;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_42:
        uint64_t v32 = 2;
        goto LABEL_47;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        while (2)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v19 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                uint64_t v19 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_46:
        uint64_t v32 = 1;
LABEL_47:
        a1[v32] = v19;
        goto LABEL_48;
      case 3u:
        char v29 = objc_alloc_init(NSPPrivacyProxyObliviousTargetInfo);
        [a1 addTargetInformation:v29];
        if PBReaderPlaceMark() && (NSPPrivacyProxyObliviousTargetInfoReadFrom(v29, a2))
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        uint64_t v30 = PBReaderReadData();
        uint64_t v31 = (void *)a1[3];
        a1[3] = v30;

        goto LABEL_48;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

long long *np_tunnel_protocol_get_id()
{
  if (_MergedGlobals_38 != -1) {
    dispatch_once(&_MergedGlobals_38, &__block_literal_global_11);
  }
  return &xmmword_1EB53BDF0;
}

void __np_tunnel_protocol_get_id_block_invoke()
{
  *(_OWORD *)algn_1EB53BEE8 = 0u;
  *(_OWORD *)&qword_1EB53BED8 = 0u;
  *(_OWORD *)&qword_1EB53BEC8 = 0u;
  *(_OWORD *)&algn_1EB53BEA8[16] = 0u;
  *(_OWORD *)algn_1EB53BEA8 = 0u;
  *(_OWORD *)&qword_1EB53BE98 = 0u;
  *(_OWORD *)&qword_1EB53BE88 = 0u;
  *(_OWORD *)&qword_1EB53BE78 = 0u;
  *(_OWORD *)&qword_1EB53BE68 = 0u;
  *(_OWORD *)&qword_1EB53BE58 = 0u;
  *(_OWORD *)&qword_1EB53BE48 = 0u;
  *(_OWORD *)&qword_1EB53BE38 = 0u;
  *(_OWORD *)algn_1EB53BE28 = 0u;
  xmmword_1EB53BF08 = 0u;
  unk_1EB53BF18 = 0u;
  xmmword_1EB53BEF8 = 0u;
  xmmword_1EB53BE18 = 0u;
  qword_1EB53BE10 = 0;
  xmmword_1EB53BDF0 = 0u;
  unk_1EB53BE00 = 0u;
  __strlcpy_chk();
  qword_1EB53BE10 = 0x200000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&xmmword_1EB53BE18 = np_tunnel_add_input_handler;
  *((void *)&xmmword_1EB53BE18 + (*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = np_tunnel_remove_input_handler;
  qword_1EB53BE40 = (uint64_t)np_tunnel_connected;
  qword_1EB53BE48 = (uint64_t)np_tunnel_disconnected;
  qword_1EB53BE50 = (uint64_t)np_tunnel_error;
  qword_1EB53BED0 = (uint64_t)np_tunnel_input_finished;
  qword_1EB53BE58 = (uint64_t)np_tunnel_input_available;
  qword_1EB53BE60 = (uint64_t)np_tunnel_output_available;
  qword_1EB53BE78 = (uint64_t)np_tunnel_finalize_output_frames;
  qword_1EB53BEA0 = (uint64_t)np_tunnel_get_remote_endpoint;
  qword_1EB53BE98 = (uint64_t)np_tunnel_get_local_endpoint;
  qword_1EB53BEE0 = (uint64_t)np_tunnel_get_output_local_endpoint;
  qword_1EB53BE88 = (uint64_t)np_tunnel_get_parameters;
  qword_1EB53BE90 = (uint64_t)np_tunnel_get_path;
  qword_1EB53BEC8 = (uint64_t)np_tunnel_supports_external_data;
  qword_1EB53BEC0 = (uint64_t)np_tunnel_updated_path;
  qword_1EB53BE30 = (uint64_t)np_flow_connect;
  qword_1EB53BE38 = (uint64_t)np_flow_disconnect;
  qword_1EB53BE68 = (uint64_t)np_flow_get_input_frames;
  qword_1EB53BE70 = (uint64_t)np_flow_get_output_frames;
  qword_1EB53BEF0 = (uint64_t)np_flow_waiting_for_output;
  qword_1EB53BED8 = (uint64_t)np_flow_output_finished;
  if ((nw_protocol_register_many_to_one() & 1) == 0)
  {
    int v0 = nplog_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v0, OS_LOG_TYPE_ERROR, "Failed to register the np_tunnel protocol", buf, 2u);
    }
  }
  if ((nw_protocol_register_parameter_modifier() & 1) == 0)
  {
    uint64_t v1 = nplog_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v1, OS_LOG_TYPE_ERROR, "Failed to register parameter modifier function", v2, 2u);
    }
  }
}

BOOL np_tunnel_add_input_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v4 = *(id *)(a1 + 40);
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 timestamps];
    if (v6) {
      BOOL v7 = g_recordTimestamps == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7 && !*(void *)(v6 + 40)) {
      *(void *)(v6 + 40) = mach_absolute_time();
    }
    *(void *)(a2 + 32) = [v5 protocol];
    char v8 = +[NSPManager sharedManager];
    unsigned int v9 = [v8 instantiateFlowWithTunnel:v5 inputProtocol:a2];

    if (v9)
    {
      id v10 = v9;
      *(void *)(a2 + 56) = v10;
      uint64_t v11 = [v5 path];

      if (!v11)
      {
        unint64_t v12 = (*(void (**)(uint64_t))(*(void *)(a2 + 24) + 120))(a2);
        [v5 setPath:v12];
      }
      if (uuid_is_null((const unsigned __int8 *)[v5 protocol])) {
        uuid_copy((unsigned __int8 *)[v5 protocol], (const unsigned __int8 *)a2);
      }
      char v13 = [v5 localEndpoint];

      if (!v13)
      {
        BOOL v14 = (*(void (**)(uint64_t))(*(void *)(a2 + 24) + 128))(a2);
        [v5 setLocalEndpoint:v14];
      }
      if ([v5 addNewFlow:v10])
      {
        uint64_t v15 = [v5 timestamps];
        BOOL v16 = 1;
        if (!v15) {
          goto LABEL_28;
        }
        if (!g_recordTimestamps) {
          goto LABEL_28;
        }
        char v17 = (uint64_t *)(v15 + 48);
        if (*(void *)(v15 + 48)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v19 = [v5 timestamps];
      BOOL v16 = 0;
      if (!v19 || !g_recordTimestamps) {
        goto LABEL_28;
      }
      char v17 = (uint64_t *)(v19 + 48);
      if (!*(void *)(v19 + 48))
      {
LABEL_27:
        *char v17 = mach_absolute_time();
        BOOL v16 = v9 != 0;
        goto LABEL_28;
      }
    }
    BOOL v16 = 0;
LABEL_28:

    goto LABEL_29;
  }
  unsigned int v18 = nplog_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *(void *)(a1 + 16);
    int v22 = 136315138;
    uint64_t v23 = v21;
    _os_log_error_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_ERROR, "No tunnel found for protocol %s", (uint8_t *)&v22, 0xCu);
  }

  BOOL v16 = 0;
LABEL_29:

  return v16;
}

uint64_t np_tunnel_remove_input_handler(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 56);
  id v4 = *(id *)(a1 + 40);
  [v3 dropInputProtocol];
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 56) = 0;
  objc_msgSend(v4, "removeFlow:", objc_msgSend(v3, "identifier"));

  return 1;
}

void np_tunnel_connected(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 40);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(a2 + 24) + 216))(a2, a1))
  {
    [v4 writeInitialData];
  }
  else
  {
    [v4 setConnectionState:3];
    [v4 handleConnected];
  }
}

void np_tunnel_disconnected(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 40);
  if ([v1 handledDisconnected])
  {
    uint64_t v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [v1 identifier];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_INFO, "%@: Ignoring extra disconnected callback", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    [v1 setHandledDisconnected:1];
    if ([v1 connectionState] != 5) {
      [v1 setConnectionState:1];
    }
    [v1 handleConnectionIsDisconnected];
  }
}

void np_tunnel_error(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setError:");
  np_tunnel_disconnected(a1);
}

uint64_t np_tunnel_input_finished(uint64_t a1)
{
  return [*(id *)(a1 + 40) setEof:1];
}

uint64_t np_tunnel_input_available(uint64_t a1)
{
  return [*(id *)(a1 + 40) handleInputAvailable];
}

uint64_t np_tunnel_output_available(uint64_t a1)
{
  return [*(id *)(a1 + 40) handleOutputAvailable];
}

uint64_t np_tunnel_finalize_output_frames()
{
  return 1;
}

uint64_t np_tunnel_get_remote_endpoint(uint64_t a1)
{
  return [*(id *)(a1 + 40) endpoint];
}

uint64_t np_tunnel_get_local_endpoint(uint64_t a1)
{
  return [*(id *)(a1 + 40) localEndpoint];
}

id np_tunnel_get_output_local_endpoint(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = *(void *)([v1 protocol] + 32);
  if (!v2
    || (id v3 = *(void (**)(void))(*(void *)(v2 + 24) + 200)) == 0
    || (v3(), (int v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v4 = [v1 localEndpoint];
  }

  return v4;
}

uint64_t np_tunnel_get_parameters(uint64_t a1)
{
  return [*(id *)(a1 + 40) parameters];
}

uint64_t np_tunnel_get_path(uint64_t a1)
{
  return [*(id *)(a1 + 40) path];
}

uint64_t np_tunnel_supports_external_data()
{
  return 1;
}

uint64_t np_tunnel_updated_path(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)(v1 + 24) + 168))();
  }
  else {
    return 1;
  }
}

uint64_t np_flow_connect(uint64_t a1, uint64_t a2)
{
  id v2 = *(id *)(a2 + 56);
  id v3 = [v2 tunnel];
  uint64_t v4 = [v3 timestamps];
  if (v4) {
    BOOL v5 = g_recordTimestamps == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && !*(void *)(v4 + 56)) {
    *(void *)(v4 + 56) = mach_absolute_time();
  }

  uint64_t v6 = [v2 connect];
  return v6;
}

void np_flow_disconnect(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a2 + 56);
  BOOL v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 hashKey];
    _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "Flow %llu is disconnecting", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 + 24) + 48))(a2, a1);
  [v4 disconnect];
}

uint64_t np_flow_get_input_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = *(id *)(a2 + 56);
  kdebug_trace();
  uint64_t v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134217984;
    uint64_t v15 = [v10 hashKey];
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Flow %llu creating input frames", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = [v10 addInputFramesToArray:a6 limitMinimumBytes:a3 limitMaximumBytes:a4 limitMaximumFrames:a5];
  return v12;
}

uint64_t np_flow_get_output_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = *(id *)(a2 + 56);
  kdebug_trace();
  uint64_t v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218240;
    uint64_t v15 = [v10 hashKey];
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Flow %llu creating output frames for %u bytes", (uint8_t *)&v14, 0x12u);
  }

  uint64_t v12 = [v10 addOutputFramesToArray:a6 limitMinimumBytes:a3 limitMaximumBytes:a4 limitMaximumFrames:a5];
  return v12;
}

uint64_t np_flow_waiting_for_output(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 56) waitingForOutput];
}

void *np_tunnel_protocol_create(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  kdebug_trace();
  if (_MergedGlobals_38 != -1) {
    dispatch_once(&_MergedGlobals_38, &__block_literal_global_11);
  }
  if (nw_protocols_are_equal())
  {
    int v6 = +[NSPManager sharedManager];
    uint64_t v7 = [v6 instantiateTunnelWithEndpoint:v4 parameters:v5];

    if (v7)
    {
      id v8 = v7;
      *(void *)([v8 protocol] + 40) = v8;
      uint64_t v7 = (void *)[v8 protocol];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t np_tunnel_protocol_should_accept_new_flow(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 40);
  unint64_t v2 = [v1 connectionState];
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218240;
    unint64_t v8 = v2;
    __int16 v9 = 1024;
    int v10 = [v1 isCancelled];
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "Existing tunnel state is %ld, isCancelled = %d", (uint8_t *)&v7, 0x12u);
  }

  if (v2 > 4 || v2 == 1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v1 isCancelled] ^ 1;
  }

  return v5;
}

uint64_t np_tunnel_protocol_modify_parameters(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v3 || !v4)
  {
    int v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218240;
      id v11 = v3;
      __int16 v12 = 2048;
      char v13 = v5;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "Endpoint (%p) or parameters (%p) is nil, cannot modify parameters", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_8;
  }
  int v6 = +[NSPManager sharedManager];
  int v7 = [v6 createTransformsForEndpoint:v3 parameters:v5];

  if (!v7 || !nw_array_get_count())
  {
LABEL_8:

    uint64_t v8 = 0;
    goto LABEL_9;
  }
  nw_parameters_set_transform_array();

  uint64_t v8 = 1;
LABEL_9:

  return v8;
}

void sub_1A10585F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __np_tunnel_finalize_output_frames_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  nw_frame_array_remove();
  nw_frame_finalize();

  return 1;
}

void sub_1A10599E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1A105B3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A105E170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A10600B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1062210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__734(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A622B750](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__735(uint64_t a1)
{
}

void sub_1A1067338(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A1069E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A106B838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A106BAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A106E678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A1070EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  _Block_object_dispose((const void *)(v49 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1A1071D58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
}

void sub_1A10720F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1072B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1073FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t hchacha(unint64_t result, int *a2, int *a3, unint64_t a4)
{
  int v4 = 2036477234;
  int v5 = 1797285236;
  int v6 = 1634760805;
  int v7 = 857760878;
  int v9 = *a2;
  int v8 = a2[1];
  int v11 = a2[2];
  int v10 = a2[3];
  if (a4)
  {
    unint64_t v12 = 0;
    int v14 = *(_DWORD *)(result + 24);
    int v13 = *(_DWORD *)(result + 28);
    int v15 = *(_DWORD *)(result + 16);
    int v16 = *(_DWORD *)(result + 20);
    int v17 = *(_DWORD *)(result + 8);
    int v18 = *(_DWORD *)(result + 12);
    unint64_t v20 = result;
    LODWORD(result) = *(_DWORD *)result;
    int v19 = *(_DWORD *)(v20 + 4);
    do
    {
      int v21 = result + v6;
      int v22 = v9 ^ v21;
      HIDWORD(v23) = v22;
      LODWORD(v23) = v22;
      int v24 = (v23 >> 16) + v15;
      unsigned int v25 = v24 ^ result;
      HIDWORD(v23) = v25;
      LODWORD(v23) = v25;
      int v26 = (v23 >> 20) + v21;
      LODWORD(v23) = v26 ^ __ROR4__(v22, 16);
      int v27 = v23;
      HIDWORD(v23) = v23;
      int v28 = (v23 >> 24) + v24;
      LODWORD(v23) = v28 ^ __ROR4__(v25, 20);
      int v29 = v23;
      HIDWORD(v23) = v23;
      int v30 = v23 >> 25;
      int v31 = v19 + v7;
      int v32 = v8 ^ v31;
      HIDWORD(v23) = v32;
      LODWORD(v23) = v32;
      int v33 = (v23 >> 16) + v16;
      int v34 = v33 ^ v19;
      HIDWORD(v23) = v34;
      LODWORD(v23) = v34;
      int v35 = (v23 >> 20) + v31;
      LODWORD(v23) = v35 ^ __ROR4__(v32, 16);
      int v36 = v23;
      HIDWORD(v23) = v23;
      int v37 = (v23 >> 24) + v33;
      LODWORD(v23) = v37 ^ __ROR4__(v34, 20);
      int v38 = v23;
      HIDWORD(v23) = v23;
      int v39 = v23 >> 25;
      int v40 = v17 + v4;
      int v41 = v11 ^ v40;
      HIDWORD(v23) = v41;
      LODWORD(v23) = v41;
      int v42 = (v23 >> 16) + v14;
      int v43 = v42 ^ v17;
      HIDWORD(v23) = v43;
      LODWORD(v23) = v43;
      int v44 = (v23 >> 20) + v40;
      LODWORD(v23) = v44 ^ __ROR4__(v41, 16);
      int v45 = v23;
      HIDWORD(v23) = v23;
      int v46 = (v23 >> 24) + v42;
      LODWORD(v23) = v46 ^ __ROR4__(v43, 20);
      int v47 = v23;
      HIDWORD(v23) = v23;
      int v48 = v23 >> 25;
      int v49 = v18 + v5;
      int v50 = v10 ^ v49;
      HIDWORD(v23) = v50;
      LODWORD(v23) = v50;
      int v51 = (v23 >> 16) + v13;
      int v52 = v51 ^ v18;
      HIDWORD(v23) = v52;
      LODWORD(v23) = v52;
      int v53 = (v23 >> 20) + v49;
      LODWORD(v23) = v53 ^ __ROR4__(v50, 16);
      int v54 = v23;
      HIDWORD(v23) = v23;
      int v55 = (v23 >> 24) + v51;
      LODWORD(v23) = v55 ^ __ROR4__(v52, 20);
      int v56 = v23;
      HIDWORD(v23) = v23;
      int v57 = v23 >> 25;
      int v58 = v39 + v26;
      LODWORD(v23) = v58 ^ __ROR4__(v54, 24);
      int v59 = v23;
      HIDWORD(v23) = v23;
      int v60 = (v23 >> 16) + v46;
      LODWORD(v23) = v60 ^ __ROR4__(v38, 25);
      int v61 = v23;
      HIDWORD(v23) = v23;
      int v6 = (v23 >> 20) + v58;
      LODWORD(v23) = v6 ^ __ROR4__(v59, 16);
      HIDWORD(v23) = v23;
      int v10 = v23 >> 24;
      int v14 = v10 + v60;
      LODWORD(v23) = v14 ^ __ROR4__(v61, 20);
      HIDWORD(v23) = v23;
      int v19 = v23 >> 25;
      int v62 = v48 + v35;
      LODWORD(v23) = v62 ^ __ROR4__(v27, 24);
      int v63 = v23;
      HIDWORD(v23) = v23;
      int v64 = (v23 >> 16) + v55;
      LODWORD(v23) = v64 ^ __ROR4__(v47, 25);
      int v65 = v23;
      HIDWORD(v23) = v23;
      int v7 = (v23 >> 20) + v62;
      LODWORD(v23) = v7 ^ __ROR4__(v63, 16);
      HIDWORD(v23) = v23;
      int v9 = v23 >> 24;
      int v13 = v9 + v64;
      LODWORD(v23) = v13 ^ __ROR4__(v65, 20);
      HIDWORD(v23) = v23;
      int v17 = v23 >> 25;
      int v66 = v57 + v44;
      LODWORD(v23) = v66 ^ __ROR4__(v36, 24);
      int v67 = v23;
      HIDWORD(v23) = v23;
      int v68 = (v23 >> 16) + v28;
      LODWORD(v23) = v68 ^ __ROR4__(v56, 25);
      int v69 = v23;
      HIDWORD(v23) = v23;
      int v4 = (v23 >> 20) + v66;
      LODWORD(v23) = v4 ^ __ROR4__(v67, 16);
      HIDWORD(v23) = v23;
      int v8 = v23 >> 24;
      int v15 = v8 + v68;
      LODWORD(v23) = v15 ^ __ROR4__(v69, 20);
      HIDWORD(v23) = v23;
      int v18 = v23 >> 25;
      int v70 = v30 + v53;
      LODWORD(v23) = v70 ^ __ROR4__(v45, 24);
      int v71 = v23;
      HIDWORD(v23) = v23;
      int v72 = (v23 >> 16) + v37;
      LODWORD(v23) = v72 ^ __ROR4__(v29, 25);
      int v73 = v23;
      HIDWORD(v23) = v23;
      int v5 = (v23 >> 20) + v70;
      LODWORD(v23) = v5 ^ __ROR4__(v71, 16);
      HIDWORD(v23) = v23;
      int v11 = v23 >> 24;
      int v16 = v11 + v72;
      v12 += 2;
      LODWORD(v23) = v16 ^ __ROR4__(v73, 20);
      HIDWORD(v23) = v23;
      uint64_t result = (v23 >> 25);
    }
    while (v12 < a4);
  }
  *a3 = v6;
  a3[1] = v7;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v9;
  a3[5] = v8;
  a3[6] = v11;
  a3[7] = v10;
  return result;
}

uint64_t NSPPrivacyProxyPolicyTierMapReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        unint64_t v23 = objc_alloc_init(NSPPrivacyProxyPolicy);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyPolicyReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyPolicyReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v6 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        unint64_t v11 = *(void *)(a2 + v10);
        if (v11 == -1 || v11 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v12 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v11 + 1;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        BOOL v13 = v8++ >= 9;
        if (v13)
        {
          unint64_t v9 = 0;
          int v14 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v14 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v15 = v9 & 7;
      if (v14 || v15 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v15 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v6) + v22);
              *(void *)(a2 + v2(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if (v23 < 0)
              {
                v18 += 7;
                BOOL v13 = v19++ >= 9;
                if (!v13) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (1)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v6) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v13 = v25++ >= 9;
              if (!v13) {
                continue;
              }
            }
            goto LABEL_43;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          PBRepeatedInt32Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTransparencyTokenEntryReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_40;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_42:
        uint64_t v32 = 2;
        goto LABEL_47;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        while (2)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v19 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                uint64_t v19 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_46:
        uint64_t v32 = 1;
LABEL_47:
        a1[v32] = v19;
        goto LABEL_48;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        int v30 = (void *)a1[3];
        a1[3] = v29;

        goto LABEL_48;
      case 4u:
        int v31 = objc_alloc_init(NSPPrivacyProxyTokenKey);
        [a1 addTokenKeys:v31];
        if PBReaderPlaceMark() && (NSPPrivacyProxyTokenKeyReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

void sub_1A107F074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1A107F7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A107FA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSPPrivacyProxyProxyPathWeightReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v25 = 0;
            unsigned int v26 = 0;
            uint64_t v27 = 0;
            while (1)
            {
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v14 = v26++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_39;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          while (1)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_55;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
          PBRepeatedUInt32Add();
        }
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v2(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_43;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_45:
        *(_DWORD *)(a1 + 32) = v20;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyAuxiliaryAuthInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = PBReaderReadData();
        if (v24) {
          [(id)a1 addContentList:v24];
        }
      }
      else if (v17 == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unsigned int v26 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v25;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v2(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A1084314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSPPrivacyProxyObliviousTargetInfoReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v1(*(void (**)(PendingStream *, const char *, uint64_t))(*(void *)this + 80))(this, "out of buffers", 1) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_23;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_23:
          uint64_t v20 = *(void **)&a1[v18];
          *(void *)&a1[v18] = v17;

          continue;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          a1[44] |= 1u;
          while (2)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_44:
          uint64_t v33 = 16;
          goto LABEL_49;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          a1[44] |= 2u;
          break;
        case 5u:
          unsigned int v32 = PBReaderReadString();
          if (v32) {
            [a1 addProcesses:v32];
          }

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_46;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_48:
      uint64_t v33 = 40;
LABEL_49:
      *(_DWORD *)&a1[v33] = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

uint64_t CFBundleCopyLocalizationForLocalizationInfo()
{
  return MEMORY[0x1F40D7488]();
}

uint64_t CFBundleGetLocalizationInfoForLocalization()
{
  return MEMORY[0x1F40D7590]();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1F40D7690](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x1F40D52B8](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CFURLRequestCopyHTTPRequest()
{
  return MEMORY[0x1F40D5448]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1F40C98D8]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1F4147360]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1F4147368]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1F4147370]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1F4147380]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1F41473D0]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1F41473D8]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1F41473E0]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1F41473E8]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1F41473F0]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1F41473F8]();
}

uint64_t SecCertificateCopySummaryProperties()
{
  return MEMORY[0x1F40F6B70]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1F40F6BD8]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1F40F6F58]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1F40F7028]();
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x1F40F7038]();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1F40F7078](revocationFlags);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1F40F7088](server, hostname);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1F40F71B8](trust);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x1F40F71D8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1F40F7200](trust, queue, result);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F7230](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

uint64_t SipHash()
{
  return MEMORY[0x1F4116A60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x1F40D8FC8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CA530](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1F40CA6E8]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1F40CAA48]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x1F40CAAD0]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1F40CACA8]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x1F40CAE30]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x1F40CAE38]();
}

uint64_t cchpke_initiator_encrypt()
{
  return MEMORY[0x1F40CAE60]();
}

uint64_t cchpke_initiator_export()
{
  return MEMORY[0x1F40CAE68]();
}

uint64_t cchpke_initiator_setup()
{
  return MEMORY[0x1F40CAE70]();
}

uint64_t cchpke_params_sizeof_aead_key()
{
  return MEMORY[0x1F40CAE78]();
}

uint64_t cchpke_params_sizeof_aead_nonce()
{
  return MEMORY[0x1F40CAE80]();
}

uint64_t cchpke_params_sizeof_aead_tag()
{
  return MEMORY[0x1F40CAE88]();
}

uint64_t cchpke_params_sizeof_kdf_hash()
{
  return MEMORY[0x1F40CAE90]();
}

uint64_t cchpke_params_sizeof_kem_enc()
{
  return MEMORY[0x1F40CAE98]();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return MEMORY[0x1F40CAEA0]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t chacha20_all_64x64()
{
  return MEMORY[0x1F4116CA8]();
}

uint64_t chacha20_final()
{
  return MEMORY[0x1F4116CB0]();
}

uint64_t chacha20_init_64x64()
{
  return MEMORY[0x1F4116CB8]();
}

uint64_t chacha20_update()
{
  return MEMORY[0x1F4116D18]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA30](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA38](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

uint64_t freemptcpinfo()
{
  return MEMORY[0x1F40F27E8]();
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1F40CC450](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40CC560](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1F40CC648](*(void *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1F40CC718](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1F40CC840](*(void *)&a1, *(void *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

uint64_t nw_array_append()
{
  return MEMORY[0x1F40F2928]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x1F40F2938]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x1F40F2940]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_metadata()
{
  return MEMORY[0x1F40F2AB8]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x1F40F2C58]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1F40F2C60]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_write_multiple()
{
  return MEMORY[0x1F40F2CE0]();
}

uint64_t nw_context_copy_implicit_context()
{
  return MEMORY[0x1F40F2D60]();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1F40F2E38](endpoint);
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x1F40F2E68]();
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1F40F2E70](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2EA8](hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1F40F2ED0](endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x1F40F2EF8]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2F08](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F38](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1F40F2F60](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1F40F2F68](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x1F40F2FD0]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x1F40F2FE0]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x1F40F2FE8]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x1F40F3000]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x1F40F3010]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x1F40F3020]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x1F40F3030]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1F40F3050]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1F40F3058]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1F40F3068]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1F40F3078]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1F40F3088]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x1F40F30A8]();
}

uint64_t nw_frame_set_external_data()
{
  return MEMORY[0x1F40F30C0]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x1F40F30D8]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x1F40F30F0]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x1F40F30F8]();
}

uint64_t nw_frame_uses_external_data()
{
  return MEMORY[0x1F40F3100]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x1F40F3230]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x1F40F3240](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1F40F3248](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1F40F3268](interface);
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x1F40F3390]();
}

uint64_t nw_nat64_extract_v4()
{
  return MEMORY[0x1F40F33A8]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x1F40F3410]();
}

uint64_t nw_parameters_copy_metadata()
{
  return MEMORY[0x1F40F3440]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1F40F3488]();
}

uint64_t nw_parameters_create_protocol_parameters()
{
  return MEMORY[0x1F40F34A8]();
}

uint64_t nw_parameters_get_account_id()
{
  return MEMORY[0x1F40F34E8]();
}

uint64_t nw_parameters_get_data_mode()
{
  return MEMORY[0x1F40F34F8]();
}

uint64_t nw_parameters_get_effective_bundle_id()
{
  return MEMORY[0x1F40F3500]();
}

uint64_t nw_parameters_get_multipath()
{
  return MEMORY[0x1F40F3528]();
}

nw_multipath_service_t nw_parameters_get_multipath_service(nw_parameters_t parameters)
{
  return MEMORY[0x1F40F3530](parameters);
}

uint64_t nw_parameters_get_no_delay()
{
  return MEMORY[0x1F40F3538]();
}

uint64_t nw_parameters_get_tfo()
{
  return MEMORY[0x1F40F3558]();
}

uint64_t nw_parameters_get_tfo_no_cookie()
{
  return MEMORY[0x1F40F3560]();
}

uint64_t nw_parameters_get_tls()
{
  return MEMORY[0x1F40F3568]();
}

uint64_t nw_parameters_has_initial_data_payload()
{
  return MEMORY[0x1F40F3578]();
}

uint64_t nw_parameters_set_account_id()
{
  return MEMORY[0x1F40F35A0]();
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x1F40F35E0]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1F40F35E8]();
}

uint64_t nw_parameters_set_e_proc_uuid()
{
  return MEMORY[0x1F40F3608]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x1F40F3660]();
}

uint64_t nw_parameters_set_metadata()
{
  return MEMORY[0x1F40F3690]();
}

uint64_t nw_parameters_set_no_delay()
{
  return MEMORY[0x1F40F36A0]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x1F40F37A0]();
}

uint64_t nw_parameters_set_transform_array()
{
  return MEMORY[0x1F40F37C0]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1F40F3828]();
}

uint64_t nw_path_get_mtu()
{
  return MEMORY[0x1F40F38F8]();
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x1F40F3950](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x1F40F3958](path);
}

uint64_t nw_protocol_boringssl_identifier()
{
  return MEMORY[0x1F417E2B0]();
}

uint64_t nw_protocol_register_extended()
{
  return MEMORY[0x1F40F3B20]();
}

uint64_t nw_protocol_register_many_to_one()
{
  return MEMORY[0x1F40F3B28]();
}

uint64_t nw_protocol_register_parameter_modifier()
{
  return MEMORY[0x1F40F3B30]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x1F40F3B40]();
}

uint64_t nw_protocol_transform_append_protocol()
{
  return MEMORY[0x1F40F3B90]();
}

uint64_t nw_protocol_transform_create()
{
  return MEMORY[0x1F40F3B98]();
}

uint64_t nw_protocol_transform_disable_protocol()
{
  return MEMORY[0x1F40F3BA0]();
}

uint64_t nw_protocol_transform_replace_endpoint()
{
  return MEMORY[0x1F40F3BA8]();
}

uint64_t nw_protocol_transform_set_fallback_mode()
{
  return MEMORY[0x1F40F3BB0]();
}

uint64_t nw_protocol_transform_set_multipath_service()
{
  return MEMORY[0x1F40F3BB8]();
}

uint64_t nw_protocol_transform_set_no_path_fallback()
{
  return MEMORY[0x1F40F3BC0]();
}

uint64_t nw_protocol_transform_set_no_proxy()
{
  return MEMORY[0x1F40F3BC8]();
}

uint64_t nw_protocol_transform_set_prohibit_direct()
{
  return MEMORY[0x1F40F3BD0]();
}

uint64_t nw_protocol_transform_set_tfo()
{
  return MEMORY[0x1F40F3BD8]();
}

uint64_t nw_protocol_transform_set_tfo_no_cookie()
{
  return MEMORY[0x1F40F3BE0]();
}

uint64_t nw_protocols_are_equal()
{
  return MEMORY[0x1F40F3BE8]();
}

uint64_t nw_queue_cancel_source()
{
  return MEMORY[0x1F40F3C78]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x1F40F3C80]();
}

uint64_t nw_queue_context_create_source()
{
  return MEMORY[0x1F40F3C98]();
}

uint64_t nw_queue_resume_source()
{
  return MEMORY[0x1F40F3CA8]();
}

uint64_t nw_queue_set_timer_values()
{
  return MEMORY[0x1F40F3CB0]();
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x1F40CD098]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x1F40CD0A0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x1F40CD0A8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x1F40CD0B8]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x1F40CD0D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t poly1305()
{
  return MEMORY[0x1F4116D40]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDF30](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1F40CDFF8](*(void *)&a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
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

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
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

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
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

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
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
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}