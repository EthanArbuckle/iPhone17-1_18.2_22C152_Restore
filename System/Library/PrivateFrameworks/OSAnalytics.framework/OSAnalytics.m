void sub_1A7C7118C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C7218C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id ns2xpc(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v2 = xpc_string_create((const char *)[v1 UTF8String]);
LABEL_9:
    xpc_object_t v5 = v2;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v2 = xpc_int64_create([v1 longLongValue]);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v1;
    xpc_object_t v2 = xpc_data_create((const void *)[v3 bytes], objc_msgSend(v3, "length"));
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v1 timeIntervalSince1970];
    xpc_object_t v2 = xpc_date_create((uint64_t)(v4 * 1000000000.0));
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    id v7 = v1;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v26 + 1) + 8 * i);
          v13 = (const char *)[v12 UTF8String];
          v14 = [v7 objectForKeyedSubscript:v12];
          v15 = ns2xpc(v14);
          xpc_dictionary_set_value(v5, v13, v15);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v9);
    }
LABEL_30:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v1;
    uint64_t v16 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v7);
          }
          v20 = ns2xpc(*(void *)(*((void *)&v22 + 1) + 8 * j));
          xpc_array_append_value(v5, v20);
        }
        uint64_t v17 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v17);
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = (id)objc_opt_class();
    id v21 = v31;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ns2xpc: unrecognized class: %@", buf, 0xCu);
  }
  xpc_object_t v5 = 0;
LABEL_10:

  return v5;
}

uint64_t __xpc2ns_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v5 = xpc2ns(a3);
  v6 = *(void **)(a1 + 32);
  id v7 = [NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

id xpc2ns(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = MEMORY[0x1AD0D88F0]();
  if (v2 == MEMORY[0x1E4F145F0])
  {
    uint64_t v5 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
LABEL_15:
    id v4 = (id)v5;
    goto LABEL_16;
  }
  uint64_t v3 = v2;
  if (v2 == MEMORY[0x1E4F145C0])
  {
    uint64_t v5 = [NSNumber numberWithLongLong:xpc_int64_get_value(v1)];
    goto LABEL_15;
  }
  if (v2 == MEMORY[0x1E4F14580])
  {
    size_t length = xpc_data_get_length(v1);
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:xpc_data_get_bytes_ptr(v1) length:length];
    goto LABEL_15;
  }
  if (v2 == MEMORY[0x1E4F14588])
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(xpc_date_get_value(v1) / 0x3B9ACA00uLL)];
    goto LABEL_15;
  }
  if (v2 == MEMORY[0x1E4F14590])
  {
    uint64_t v8 = objc_opt_new();
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __xpc2ns_block_invoke;
    applier[3] = &unk_1E5D20640;
    id v4 = v8;
    id v14 = v4;
    xpc_dictionary_apply(v1, applier);
    uint64_t v9 = v14;
LABEL_21:

    goto LABEL_16;
  }
  if (v2 == MEMORY[0x1E4F14568])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:xpc_array_get_count(v1)];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __xpc2ns_block_invoke_2;
    v11[3] = &unk_1E5D20668;
    id v4 = v10;
    id v12 = v4;
    xpc_array_apply(v1, v11);
    uint64_t v9 = v12;
    goto LABEL_21;
  }
  if (v2 == MEMORY[0x1E4F145B8])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "xpc2ns: unrecognized type: %p", buf, 0xCu);
  }
  id v4 = 0;
LABEL_16:

  return v4;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

BOOL OSASetOwnership(int a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && (int v9 = *(_DWORD *)(a2 + 16), v9 != [v7 unsignedIntValue]))
  {
    id v10 = v7;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  int v11 = *(_DWORD *)(a2 + 20);
  if (v11 != [v8 unsignedIntValue])
  {
    id v14 = v8;
    if (v10) {
      uid_t v12 = [v10 unsignedIntValue];
    }
    else {
      uid_t v12 = -1;
    }
    gid_t v13 = [v14 unsignedIntValue];

    goto LABEL_14;
  }
LABEL_7:
  if (v10)
  {
    uid_t v12 = [v10 unsignedIntValue];
    gid_t v13 = -1;
LABEL_14:
    BOOL v15 = fchown(a1, v12, v13) == 0;
    goto LABEL_15;
  }
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

uint64_t OSASafeOpenReadOnly(uint64_t a1, void *a2)
{
  return OSASafeOpen(a1, 0, 0, a2);
}

uint64_t OSASafeOpen(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = open((const char *)a1, a2 | 0x20000000, a3);
    if ((v8 & 0x80000000) == 0)
    {
      uint64_t v9 = v8;
      memset(&v15, 0, sizeof(v15));
      if (fstat(v8, &v15))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          OSASafeOpen_cold_2(a1);
        }
      }
      else
      {
        int v10 = v15.st_mode & 0xF000;
        BOOL v12 = v10 == 0x8000 && v15.st_nlink == 1;
        if (v10 == 0x4000 || v12)
        {
          if (v7)
          {
            v7[2](v7, v9);
            a1 = 1;
            goto LABEL_22;
          }
          a1 = 0;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Path was safe to open, but no block was provided", buf, 2u);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          OSASafeOpen_cold_1(a1);
        }
      }
      a1 = 0;
LABEL_22:
      close(v9);
      goto LABEL_23;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      OSASafeOpen_cold_3(a1);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15.st_dev) = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Skipping safe open because no path was provided", (uint8_t *)&v15, 2u);
LABEL_10:
    a1 = 0;
  }
LABEL_23:

  return a1;
}

uint64_t OSAIsRSDDevice()
{
  if (MGGetSInt32Answer() == 10) {
    return 1;
  }
  return OSAIsDebugEnabledForRSD();
}

uint64_t OSAIsDebugEnabledForRSD()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 addSuiteNamed:@"com.apple.osanalytics"];
  id v1 = +[OSASystemConfiguration sharedInstance];
  if ([v1 appleInternal]) {
    uint64_t v2 = [v0 BOOLForKey:@"enableDebugProxySync"];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *OSADateFormat(unsigned int a1, double a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((a1 & 0x80000000) != 0 || a1 > 7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      id v14 = @"recently";
      goto LABEL_12;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = a1;
    int v10 = MEMORY[0x1E4F14500];
    int v11 = "unrecognized date format %d";
    BOOL v12 = buf;
    uint32_t v13 = 8;
LABEL_10:
    _os_log_impl(&dword_1A7C6D000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, v13);
    goto LABEL_11;
  }
  double v4 = (double)(uint64_t)floor(a2);
  time_t v16 = (uint64_t)(*MEMORY[0x1E4F1CF78] + v4);
  uint64_t v5 = localtime(&v16);
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 134217984;
    time_t v24 = v16;
    int v10 = MEMORY[0x1E4F14500];
    int v11 = "unable to convert localtime from %ld secs";
    BOOL v12 = buf;
    uint32_t v13 = 12;
    goto LABEL_10;
  }
  uint64_t v6 = a1;
  id v7 = (&formatters)[2 * a1];
  if (!strftime((char *)buf, 0x40uLL, v7, v5))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v17 = 136315650;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    time_t v20 = v16;
    __int16 v21 = 1024;
    int v22 = (int)((a2 - v4) * 1000000.0);
    int v10 = MEMORY[0x1E4F14500];
    int v11 = "unable to strftime with format '%s' from %lds+%dus}";
    BOOL v12 = (uint8_t *)&v17;
    uint32_t v13 = 28;
    goto LABEL_10;
  }
  if ((0x69uLL >> v6))
  {
    uint64_t v8 = buf;
  }
  else
  {
    uint64_t v8 = (uint8_t *)v25;
    uint64_t v9 = fmtcheck((const char *)buf, "unknown-%u");
    if (!snprintf(v25, 0x40uLL, v9, (int)((a2 - v4) * 1000000.0) / LODWORD((&formatters)[2 * v6 + 1]))) {
      goto LABEL_11;
    }
  }
  id v14 = [NSString stringWithUTF8String:v8];
LABEL_12:
  return v14;
}

BOOL SimulateCrash(int a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  pid_t v5 = getpid();
  if (v5 == a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      SimulateCrash_cold_1((uint64_t)v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    SimulateCrash_cold_2();
  }

  return v5 == a1;
}

BOOL WriteStackshotReport(void *a1, uint64_t a2)
{
  return _WriteStackshotReport(a1, a2, 0, 0, 0, 0);
}

BOOL _WriteStackshotReport(void *a1, uint64_t a2, int a3, int a4, unsigned int a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a6;
  uint32_t v13 = getprogname();
  if ([v11 length])
  {
    id v14 = (void *)MEMORY[0x1AD0D8030]();
    OSAnalyticsHelperServiceConnection();
    stat v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v33 = v14;
      *(_OWORD *)buf = 0u;
      long long v40 = 0u;
      if (!v13)
      {
        pid_t v16 = getpid();
        uint32_t v13 = (const char *)buf;
        __sprintf_chk((char *)buf, 0, 0x20uLL, "%d", v16);
      }
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v17, "operation", 2uLL);
      xpc_dictionary_set_string(v17, "caller", v13);
      if (v11) {
        uint64_t v18 = (const char *)[v11 UTF8String];
      }
      else {
        uint64_t v18 = "(none)";
      }
      xpc_dictionary_set_string(v17, "reason", v18);
      xpc_dictionary_set_uint64(v17, "exception_code", a2);
      xpc_dictionary_set_uint64(v17, "PID", a4);
      xpc_dictionary_set_uint64(v17, "flags", a5);
      if (v12)
      {
        int v31 = a3;
        xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v32 = v12;
        id v21 = v12;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(id *)(*((void *)&v34 + 1) + 8 * i);
              long long v27 = (const char *)[v26 UTF8String];
              id v28 = [v21 objectForKeyedSubscript:v26];
              xpc_dictionary_set_string(v20, v27, (const char *)[v28 UTF8String]);
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v23);
        }

        xpc_dictionary_set_value(v17, "additional_payload", v20);
        id v12 = v32;
        a3 = v31;
      }
      if (a3)
      {
        xpc_connection_send_message(v15, v17);
        BOOL v19 = 1;
      }
      else
      {
        xpc_object_t v29 = xpc_connection_send_message_with_reply_sync(v15, v17);
        BOOL v19 = xpc_dictionary_get_BOOL(v29, "result");
      }
      id v14 = v33;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Stackshot requires reason; ignoring request",
        buf,
        2u);
      BOOL v19 = 0;
    }
  }

  return v19;
}

BOOL WriteStackshotReport_async(void *a1, uint64_t a2)
{
  return _WriteStackshotReport(a1, a2, 1, 0, 0, 0);
}

BOOL WriteStackshotReportWithPID(void *a1, uint64_t a2, int a3)
{
  return _WriteStackshotReport(a1, a2, 0, a3, 0, 0);
}

BOOL WriteStackshotReportWithPayload(void *a1, uint64_t a2, int a3, void *a4)
{
  return _WriteStackshotReport(a1, a2, 0, a3, 0, a4);
}

BOOL WriteStackshotReportWithOptionsAndPayload(void *a1, uint64_t a2, int a3, unsigned int a4, void *a5)
{
  return _WriteStackshotReport(a1, a2, 0, a3, a4, a5);
}

BOOL WriteStackshotReportWithPID_async(void *a1, uint64_t a2, int a3)
{
  return _WriteStackshotReport(a1, a2, 1, a3, 0, 0);
}

BOOL WriteStackshotReportWithOptions(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  return _WriteStackshotReport(a1, a2, 0, a3, a4, 0);
}

BOOL WriteStackshotReportWithOptions_async(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  return _WriteStackshotReport(a1, a2, 1, a3, a4, 0);
}

BOOL WriteStackshotReport_stdc(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1AD0D8030]();
  pid_t v5 = [NSString stringWithUTF8String:a1];
  BOOL v6 = _WriteStackshotReport(v5, a2, 0, 0, 0, 0);

  return v6;
}

BOOL WriteCrashReportWithStackshot(int a1, unsigned int *a2, void *a3)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, 0, 0);
}

BOOL _WriteCrashReportWithStackshot(int a1, unsigned int *a2, void *a3, void *a4, int a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x1AD0D8030]();
  OSAnalyticsHelperServiceConnection();
  id v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "operation", 3uLL);
    xpc_dictionary_set_uint64(v13, "PID", a1);
    xpc_dictionary_set_uint64(v13, "ers_namespace", *a2);
    xpc_dictionary_set_uint64(v13, "ers_code", *(void *)(a2 + 1));
    xpc_dictionary_set_uint64(v13, "ers_flags", *(void *)(a2 + 3));
    if (v9) {
      id v14 = (const char *)[v9 UTF8String];
    }
    else {
      id v14 = "(none)";
    }
    xpc_dictionary_set_string(v13, "reason", v14);
    if (v10)
    {
      int v27 = a5;
      id v28 = v11;
      id v29 = v9;
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = v10;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(id *)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v23 = (const char *)[v22 UTF8String];
            id v24 = [v17 objectForKeyedSubscript:v22];
            xpc_dictionary_set_string(v16, v23, (const char *)[v24 UTF8String]);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v19);
      }

      xpc_dictionary_set_value(v13, "additional_payload", v16);
      id v11 = v28;
      id v9 = v29;
      a5 = v27;
    }
    if (a5)
    {
      xpc_connection_send_message(v12, v13);
      BOOL v15 = 1;
    }
    else
    {
      xpc_object_t v25 = xpc_connection_send_message_with_reply_sync(v12, v13);
      BOOL v15 = xpc_dictionary_get_BOOL(v25, "result");
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

BOOL WriteCrashReportWithStackshot_async(int a1, unsigned int *a2, void *a3)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, 0, 1);
}

BOOL WriteCrashReportWithStackshotWithPayload(int a1, unsigned int *a2, void *a3, void *a4)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, a4, 0);
}

BOOL WriteCrashReportWithStackshotWithPayload_async(int a1, unsigned int *a2, void *a3, void *a4)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, a4, 1);
}

BOOL WriteSystemMemoryResetReport(const char *a1, uint64_t a2, uint64_t a3)
{
  return WriteSystemMemoryResetReportWithPids(a1, a2, a3, 0, 0);
}

BOOL WriteSystemMemoryResetReportWithPids(const char *a1, uint64_t a2, uint64_t a3, int *a4, int a5)
{
  id v9 = (void *)MEMORY[0x1AD0D8030]();
  OSAnalyticsHelperServiceConnection();
  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "operation", 4uLL);
    if (a1) {
      id v12 = a1;
    }
    else {
      id v12 = "";
    }
    xpc_dictionary_set_string(v11, "reason", v12);
    xpc_dictionary_set_uint64(v11, "event_code", a2);
    if (a4 && a5)
    {
      xpc_object_t v13 = xpc_array_create(0, 0);
      if (a5 >= 1)
      {
        uint64_t v14 = a5;
        do
        {
          int64_t v15 = *a4++;
          xpc_object_t v16 = xpc_int64_create(v15);
          xpc_array_append_value(v13, v16);

          --v14;
        }
        while (v14);
      }
      xpc_dictionary_set_value(v11, "pids", v13);
    }
    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v10, v11);
    BOOL v18 = xpc_dictionary_get_BOOL(v17, "result");
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

uint64_t includeSection(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 objectForKeyedSubscript:a2];
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3) {
    uint64_t v5 = [v3 BOOLValue];
  }

  return v5;
}

uint64_t excludeSection(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 objectForKeyedSubscript:a2];
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3) {
    uint64_t v5 = [v3 BOOLValue] ^ 1;
  }

  return v5;
}

uint64_t kcdata_iter_size(uint64_t a1)
{
  int v1 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 0xFFFFFFF0) == 0x20) {
    int v1 = 17;
  }
  if (v1 <= 2309)
  {
    if (v1 == 17 || v1 == 19) {
      return *(unsigned int *)(a1 + 4);
    }
LABEL_18:
    unsigned int v4 = *(_DWORD *)(a1 + 4);
    goto LABEL_19;
  }
  if (v1 != 2310)
  {
    if (v1 == 2312)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 4);
      if (v4 == 32)
      {
        if ((*(unsigned char *)(a1 + 8) & 0x8F) == 0) {
          return 24;
        }
        unsigned int v4 = 32;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 112)
  {
    if ((*(unsigned char *)(a1 + 8) & 0x8F) == 0) {
      return 104;
    }
    unsigned int v4 = 112;
  }
LABEL_19:
  BOOL v5 = v4 >= (*(_DWORD *)(a1 + 8) & 0xFu);
  unsigned int v6 = v4 - (*(_DWORD *)(a1 + 8) & 0xF);
  if (v5) {
    return v6;
  }
  else {
    return 0;
  }
}

__CFString *DecodeQOS(unsigned int a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"QOS_CLASS_UNKNOWN (%u)", (int)a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E5D1F848[a1];
  }
  return v1;
}

id DecodeThreadFlags(unint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memcpy(__dst, off_1E5D1F638, sizeof(__dst));
  long long v10 = xmmword_1E5D1F838;
  unsigned int v4 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 32; ++i)
  {
    if (((1 << i) & a1) != 0)
    {
      if (*(void *)&__dst[256 * a2 + 8 * i])
      {
        objc_msgSend(v4, "addObject:");
      }
      else
      {
        unsigned int v6 = [NSString stringWithFormat:@"%@_0x%04X", *(void *)&__dst[8 * a2 - 16], (1 << i)];
        [v4 addObject:v6];
      }
    }
  }
  for (uint64_t j = 8; j != -8; j -= 8)

  for (uint64_t k = 504; k != -8; k -= 8)
  return v4;
}

void sub_1A7C7D7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DiagnosticsReporterServicesLibraryCore()
{
  if (!DiagnosticsReporterServicesLibraryCore_frameworkLibrary) {
    DiagnosticsReporterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return DiagnosticsReporterServicesLibraryCore_frameworkLibrary;
}

uint64_t __DiagnosticsReporterServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DiagnosticsReporterServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getOSADiagnosticsReporterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("OSADiagnosticsReporter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOSADiagnosticsReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOSADiagnosticsReporterClass_block_invoke_cold_1();
    DiagnosticsReporterServicesLibrary();
  }
}

void DiagnosticsReporterServicesLibrary()
{
  if (!DiagnosticsReporterServicesLibraryCore())
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getDiagnosticsReporterLaunchOptionsClass_block_invoke(uint64_t a1)
{
  DiagnosticsReporterServicesLibrary();
  Class result = objc_getClass("DiagnosticsReporterLaunchOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDiagnosticsReporterLaunchOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getDiagnosticsReporterLaunchOptionsClass_block_invoke_cold_1();
    return (Class)+[OSATasking proxyTasking:v5 taskId:v6 usingConfig:v7 fromBlob:v8];
  }
  return result;
}

void sub_1A7C7EE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

id selectConfigFromBlob(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v44 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a1 options:0 format:0 error:&v44];
  id v4 = v44;
  id v5 = v4;
  if (!v3)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    id v8 = NSString;
    id v6 = [v4 domain];
    id v9 = [v8 stringWithFormat:@"blob failed to unserialize (error %@:%ld)", v6, objc_msgSend(v5, "code")];
    v50 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    uint64_t v11 = [v7 errorWithDomain:@"OSATasking" code:3 userInfo:v10];

    id v5 = (void *)v10;
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v3 objectForKeyedSubscript:@"PayloadContent"];
  }
  else
  {
    id v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52 = @"blob missing payload";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    uint64_t v11 = [v26 errorWithDomain:@"OSATasking" code:2 userInfo:v9];
    goto LABEL_36;
  }
  uint64_t v12 = [v3 objectForKeyedSubscript:@"PayloadType"];
  int v13 = [v12 isEqualToString:@"TaskingConfigurations"];

  if (!v13)
  {
    id v27 = v6;
    goto LABEL_33;
  }
  long long v37 = v5;
  uint64_t v14 = +[OSASystemConfiguration sharedInstance];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v36 = v6;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (!v16)
  {
    id v27 = 0;
    goto LABEL_30;
  }
  uint64_t v17 = v16;
  long long v34 = v3;
  uint64_t v35 = a2;
  uint64_t v18 = *(void *)v41;
  id v38 = v15;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v41 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      id v21 = [v14 uiCountryCode];
      if (!matchSelector(@"Country", v21, v20)) {
        goto LABEL_22;
      }
      id v22 = [v14 buildVersion];
      if (!matchSelector(@"OS Version", v22, v20)) {
        goto LABEL_21;
      }
      uint64_t v23 = [v14 modelCode];
      if (!matchSelector(@"Product", v23, v20)) {
        goto LABEL_20;
      }
      id v24 = [v14 releaseType];
      if (!matchSelector(@"ReleaseType", v24, v20))
      {

LABEL_20:
LABEL_21:

LABEL_22:
        continue;
      }
      xpc_object_t v25 = [v14 productVersion];
      BOOL matched = matchSelector(@"ProductVersion", v25, v20);

      id v15 = v38;
      if (matched)
      {
        id v27 = [v20 objectForKey:@"ConfigurationContent"];
        goto LABEL_28;
      }
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v55 count:16];
  }
  while (v17);
  id v27 = 0;
LABEL_28:
  uint64_t v3 = v34;
  a2 = v35;
LABEL_30:

  id v6 = v36;
  id v5 = v37;
  if (![v27 count])
  {
    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    v54 = @"no matching configs";
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    uint64_t v30 = [v28 errorWithDomain:@"OSATasking" code:1 userInfo:v29];

    id v5 = (void *)v30;
  }

LABEL_33:
  if (v27 && (isConfigValid(v27) & 1) == 0)
  {
    long long v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48 = @"content invalid";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v11 = [v31 errorWithDomain:@"OSATasking" code:4 userInfo:v9];
    id v6 = v27;
LABEL_36:

    id v27 = 0;
    id v5 = (void *)v11;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v46 = v32;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Tasking selection error: %@", buf, 0xCu);
    }
    if (a2) {
      *a2 = v5;
    }
  }

  return v27;
}

uint64_t installAwdTasking(void *a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v43 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v35 = v4;
      id v36 = v3;
      uint64_t v8 = *(void *)v53;
      char v40 = 1;
      uint64_t v37 = *(void *)v53;
      id v38 = v5;
LABEL_4:
      uint64_t v9 = 0;
      uint64_t v39 = v7;
      while (1)
      {
        uint64_t v10 = v8;
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = v5;
        uint64_t v44 = v9;
        uint64_t v12 = *(void **)(*((void *)&v52 + 1) + 8 * v9);
        uint64_t v13 = objc_msgSend(v12, "objectForKey:", @"User", v35, v36);
        uint64_t v14 = [v12 objectForKey:@"Key"];
        id v15 = [v12 objectForKey:@"Domain"];
        uint64_t v16 = [v12 objectForKey:@"Value"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v58 = v13;
          __int16 v59 = 2112;
          v60 = v15;
          __int16 v61 = 2112;
          uint64_t v62 = v14;
          __int16 v63 = 2112;
          v64 = v16;
          _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "writing %@@%@:%@=%@", buf, 0x2Au);
        }
        uint64_t v17 = [MEMORY[0x1E4F83920] sharedClient];
        uint64_t v18 = (void *)v13;
        uint64_t v19 = v17;
        v46 = (void *)v14;
        uint64_t v47 = v18;
        int v45 = objc_msgSend(v17, "setPreference:forUser:inDomain:toValue:", v14);
        if (v45)
        {
          [v43 addObject:v12];
          id v5 = v11;
          uint64_t v8 = v10;
        }
        else
        {
          long long v41 = v16;
          long long v42 = v15;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v20 = v43;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v49 != v23) {
                  objc_enumerationMutation(v20);
                }
                xpc_object_t v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                id v26 = [v25 objectForKey:@"Key"];
                id v27 = [v25 objectForKey:@"User"];
                id v28 = [v25 objectForKey:@"Domain"];
                [v19 deletePreference:v26 forUser:v27 inDomain:v28];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v22);
          }

          char v40 = 0;
          uint64_t v8 = v37;
          id v5 = v38;
          uint64_t v7 = v39;
          uint64_t v16 = v41;
          id v15 = v42;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Applying awd task failed", buf, 2u);
            char v40 = 0;
          }
        }

        if (!v45) {
          break;
        }
        uint64_t v9 = v44 + 1;
        if (v44 + 1 == v7)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }

      id v4 = v35;
      id v3 = v36;
      if ((v40 & 1) == 0)
      {
        uint64_t v29 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
    }
    int v30 = [v43 writeToFile:v4 atomically:1];
    BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v31)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v58 = (uint64_t)v4;
        long long v32 = MEMORY[0x1E4F14500];
        long long v33 = "awd task successfully applied and saved as %@";
LABEL_32:
        _os_log_impl(&dword_1A7C6D000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
      }
    }
    else if (v31)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = (uint64_t)v4;
      long long v32 = MEMORY[0x1E4F14500];
      long long v33 = "Could not write task blob to file: %@";
      goto LABEL_32;
    }
    uint64_t v29 = 1;
    goto LABEL_34;
  }
  uint64_t v29 = 1;
LABEL_35:

  return v29;
}

BOOL matchSelector(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = v5 != 0;
  uint64_t v7 = [a3 objectForKey:a1];
  uint64_t v8 = (void *)v7;
  if (v5 && v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v7 options:0 error:0];
    if (v9)
    {
      uint64_t v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
      BOOL v6 = v10 != 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        matchSelector_cold_1(v10 != 0, (uint64_t)v5, (uint64_t)v8);
      }
    }
    else
    {
      BOOL v6 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid regex '%@'", (uint8_t *)&v12, 0xCu);
        BOOL v6 = 0;
      }
    }
  }
  return v6;
}

uint64_t isConfigValid(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (!v2)
  {
    uint64_t v13 = 1;
    goto LABEL_36;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v16;
  id v5 = MEMORY[0x1E4F14500];
  while (2)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v16 != v4) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v13 = 0;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid PayloadContent entry - expected dictionary", buf, 2u);
LABEL_35:
        uint64_t v13 = 0;
        goto LABEL_36;
      }
      uint64_t v8 = [v7 objectForKey:@"User"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 length])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Missing or invalid 'User' key", buf, 2u);
        }
        goto LABEL_34;
      }
      uint64_t v9 = [v7 objectForKey:@"Domain"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v9 length])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Missing or invalid 'Domain' key", buf, 2u);
        }

LABEL_34:
        goto LABEL_35;
      }
      uint64_t v10 = [v7 objectForKey:@"Key"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length])
      {
        id v11 = [v7 objectForKey:@"Value"];
        if (v11)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            id v20 = v8;
            __int16 v21 = 2112;
            uint64_t v22 = v9;
            __int16 v23 = 2112;
            id v24 = v10;
            __int16 v25 = 2112;
            id v26 = v11;
            _os_log_debug_impl(&dword_1A7C6D000, v5, OS_LOG_TYPE_DEBUG, "validated %@@%@:%@=%@", buf, 0x2Au);
          }
          int v12 = 0;
        }
        else
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v20 = v8;
            __int16 v21 = 2112;
            uint64_t v22 = v9;
            __int16 v23 = 2112;
            id v24 = v10;
            _os_log_impl(&dword_1A7C6D000, v5, OS_LOG_TYPE_DEFAULT, "Missing 'Value' key for %@ / %@ / %@", buf, 0x20u);
          }
          int v12 = 1;
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v8;
          __int16 v21 = 2112;
          uint64_t v22 = v9;
          _os_log_impl(&dword_1A7C6D000, v5, OS_LOG_TYPE_DEFAULT, "Missing or invalid 'Key' key for %@ / %@", buf, 0x16u);
        }
        int v12 = 1;
      }

      if (v12) {
        goto LABEL_35;
      }
      id v5 = MEMORY[0x1E4F14500];
    }
    uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v27 count:16];
    uint64_t v13 = 1;
    if (v3) {
      continue;
    }
    break;
  }
LABEL_36:

  return v13;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1A7C80E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C80FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C812C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C82400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *processName()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v1 = *(_OWORD *)(v0 + 20);
  v6[0] = *(_OWORD *)(v0 + 4);
  v6[1] = v1;
  char v7 = *(unsigned char *)(v0 + 36);
  char v8 = 0;
  if (LOBYTE(v6[0]))
  {
    uint64_t v2 = [NSString stringWithUTF8String:v6];
  }
  else
  {
    uint64_t v2 = @"unknown";
  }
  uint64_t v3 = @"(unprintable)";
  if (v2) {
    uint64_t v3 = v2;
  }
  uint64_t v4 = v3;

  return v4;
}

__CFString *killDescription(unint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown-%llu)", a1);
    long long v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v1 = off_1E5D1FA38[a1];
  }
  return v1;
}

__CFString *freezeSkipReason(unsigned int a1)
{
  if (a1 > 0xA) {
    return @"(unknown-reason)";
  }
  else {
    return off_1E5D1FAB8[(char)a1];
  }
}

void sub_1A7C88DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 120), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACAccountTypeIdentifierExchange()
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getACAccountTypeIdentifierExchangeSymbolLoc_ptr;
  uint64_t v8 = getACAccountTypeIdentifierExchangeSymbolLoc_ptr;
  if (!getACAccountTypeIdentifierExchangeSymbolLoc_ptr)
  {
    long long v1 = (void *)AccountsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "ACAccountTypeIdentifierExchange");
    getACAccountTypeIdentifierExchangeSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A7C89444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t AccountsLibraryCore()
{
  if (!AccountsLibraryCore_frameworkLibrary) {
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AccountsLibraryCore_frameworkLibrary;
}

uint64_t __AccountsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccountsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  AccountsLibrary();
  Class result = objc_getClass("ACAccountStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getACAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getACAccountStoreClass_block_invoke_cold_1();
    return (Class)AccountsLibrary();
  }
  return result;
}

uint64_t AccountsLibrary()
{
  uint64_t v0 = AccountsLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getACAccountTypeIdentifierIMAPSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccountsLibrary();
  Class result = dlsym(v2, "ACAccountTypeIdentifierIMAP");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getACAccountTypeIdentifierIMAPSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getACAccountTypeIdentifierExchangeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccountsLibrary();
  Class result = dlsym(v2, "ACAccountTypeIdentifierExchange");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getACAccountTypeIdentifierExchangeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DataAccessLibraryCore()
{
  if (!DataAccessLibraryCore_frameworkLibrary) {
    DataAccessLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return DataAccessLibraryCore_frameworkLibrary;
}

uint64_t __DataAccessLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataAccessLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkDAAccountEmailAddressSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataAccessLibraryCore();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "kDAAccountEmailAddress");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDAAccountEmailAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getACEmailAliasKeyEmailAddressesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccountsLibrary();
  uint64_t result = dlsym(v2, "ACEmailAliasKeyEmailAddresses");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getACEmailAliasKeyEmailAddressesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t OSAIsRSDHost()
{
  return 0;
}

BOOL OSAIsRSDDisplay()
{
  return MGGetSInt32Answer() == 10;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OSASyncCrashReporter(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  [v3 addObject:@"com.apple.ReportCrash"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = (mach_port_t *)MEMORY[0x1E4F14638];
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v27 = a2;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = (const char *)[v12 UTF8String];
        mach_port_t sp = 0;
        if (bootstrap_look_up(*v9, v13, &sp) || sp + 1 < 2)
        {
          long long v17 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v34 = *MEMORY[0x1E4F28568];
          long long v18 = [NSString stringWithFormat:@"unable to lookup port for %@", v12];
          id v35 = v18;
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          id v20 = v17;
          uint64_t v21 = 1;
LABEL_19:
          long long v16 = [v20 errorWithDomain:@"OSASyncCrashReporter" code:v21 userInfo:v19];

          a2 = v27;
          goto LABEL_20;
        }
        uint64_t v28 = 0;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v12;
          _os_log_impl(&dword_1A7C6D000, v10, OS_LOG_TYPE_DEFAULT, "sending sync request to %@", buf, 0xCu);
        }
        mach_error_t v14 = rc_sync_request(sp, 1, 0, &v28);
        if (v14)
        {
          uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v36 = *MEMORY[0x1E4F28568];
          long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"sync request failed (mach ipc: %s)", mach_error_string(v14));
          uint64_t v37 = v18;
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          id v20 = v22;
          uint64_t v21 = 2;
          goto LABEL_19;
        }
        int v15 = (int)v28;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v39 = v28;
          _os_log_impl(&dword_1A7C6D000, v10, OS_LOG_TYPE_DEFAULT, "synced after %lld total events", buf, 0xCu);
        }
        v7 += v15;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v40 count:16];
      long long v16 = 0;
      a2 = v27;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    long long v16 = 0;
    unsigned int v7 = 0;
  }
LABEL_20:

  if (a2)
  {
    id v23 = v16;
    *a2 = v23;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v23 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v39 = v24;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to lookup port for %@", buf, 0xCu);
    }
  }
  if (v16) {
    uint64_t v25 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v25 = v7;
  }

  return v25;
}

id OSASanitizePath(void *a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v52 = a1;
  id v51 = a2;
  if (OSASanitizePath_onceToken != -1) {
    dispatch_once(&OSASanitizePath_onceToken, &__block_literal_global_3);
  }
  id v53 = (id)[MEMORY[0x1E4F1CA80] set];
  if ([v52 length])
  {
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__3;
    v78 = __Block_byref_object_dispose__3;
    id v79 = v52;
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__3;
    v72 = __Block_byref_object_dispose__3;
    id v73 = 0;
    v57 = [v51 objectForKeyedSubscript:@"debug_block"];
    uint64_t v3 = OSASanitizePath_domain_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __OSASanitizePath_block_invoke_47;
    block[3] = &unk_1E5D1FBF0;
    uint64_t v66 = &v74;
    v67 = &v68;
    id v46 = v51;
    id v65 = v46;
    dispatch_sync(v3, block);
    long long v48 = [(id)OSASanitizePath_domainInfos objectForKeyedSubscript:v69[5]];
    long long v50 = [(id)v75[5] lastPathComponent];
    id v4 = [(id)v75[5] stringByDeletingLastPathComponent];
    uint64_t v5 = [v4 componentsSeparatedByString:@"/"];

    uint64_t v58 = objc_opt_new();
    long long v49 = [v48 objectForKeyedSubscript:@"MSK"];
    if (v49) {
      [v58 addObject:v49];
    }
    if (v57)
    {
      uint64_t v6 = NSString;
      uint64_t v7 = v69[5];
      uint64_t v8 = [v58 componentsJoinedByString:@"/"];
      uint64_t v9 = [v6 stringWithFormat:@"  domain %@ => [%@]", v7, v8];
      ((void (**)(void, void *))v57)[2](v57, v9);
    }
    uint64_t v10 = getRuleForSpecifier((void *)v69[5]);
    id v11 = getRules(0);
    int v55 = shouldMaskFile(v11, 1);
    uint64_t v47 = v11;
    __int16 v59 = getBundleTypes(v11, 0);
    id v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v41 = [v5 count];
      id v42 = [v5 componentsJoinedByString:@"+"];
      int v43 = [v58 count];
      uint64_t v44 = [v58 componentsJoinedByString:@"+"];
      *(_DWORD *)buf = 67110146;
      int v82 = v41;
      __int16 v83 = 2112;
      id v84 = v42;
      __int16 v85 = 1024;
      int v86 = v43;
      __int16 v87 = 2112;
      v88 = v44;
      __int16 v89 = 1024;
      int v90 = v55;
      _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "parts %d (%@), new_parts %d (%@) mask %d", buf, 0x28u);
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v5;
    uint64_t v14 = [obj countByEnumeratingWithState:&v60 objects:v80 count:16];
    if (v14)
    {
      uint64_t v56 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v61 != v56) {
            objc_enumerationMutation(obj);
          }
          long long v16 = *(__CFString **)(*((void *)&v60 + 1) + 8 * i);
          if ([(__CFString *)v16 length])
          {
            if (v10)
            {
              LOBYTE(v55) = shouldMaskFile(v10, v55 & 1);
              uint64_t v17 = getBundleTypes(v10, v59);

              __int16 v59 = (void *)v17;
            }
            long long v18 = [(__CFString *)v16 pathExtension];
            if ([v18 length]
              && ([v59 objectForKeyedSubscript:v18],
                  uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                  (id v20 = v19) != 0))
            {
              uint64_t v21 = getRuleForSpecifier(v19);

              uint64_t v22 = [NSString stringWithFormat:@"bundle(%@)", v18];
              int v23 = 0;
            }
            else
            {
              int v24 = [v53 containsObject:v16];
              if (v10) {
                char v25 = v24;
              }
              else {
                char v25 = 1;
              }
              if (v24) {
                uint64_t v22 = @"keep       ";
              }
              else {
                uint64_t v22 = @"none       ";
              }
              if (v25)
              {
                uint64_t v21 = 0;
                int v23 = v24 ^ 1;
              }
              else
              {
                uint64_t v21 = getSubruleForSpecifier(v10, (uint64_t)v16);
                if (v21)
                {
                  int v23 = 0;
                  uint64_t v22 = @"explicit   ";
                }
                else
                {
                  uint64_t v21 = getSubruleForSpecifier(v10, @"@mask");
                  if (v21)
                  {
                    int v23 = 1;
                    uint64_t v22 = @"mask       ";
                  }
                  else
                  {
                    uint64_t v21 = getSubruleForSpecifier(v10, @"@keep");
                    if (v21)
                    {
                      int v23 = 0;
                      uint64_t v22 = @"keep       ";
                    }
                    else
                    {
                      int v23 = 1;
                      uint64_t v22 = @"none       ";
                    }
                  }
                }
              }
            }
            if (v57)
            {
              id v26 = NSString;
              uint64_t v27 = [v58 componentsJoinedByString:@"/"];
              uint64_t v28 = (void *)v27;
              uint64_t v29 = &stru_1EFE17BD0;
              if (v23) {
                uint64_t v29 = @" -> *";
              }
              long long v30 = [v26 stringWithFormat:@"    rule <%@> => %@[%@%@]", v22, v27, v16, v29];
              ((void (**)(void, void *))v57)[2](v57, v30);
            }
            if (v23) {
              long long v31 = @"*";
            }
            else {
              long long v31 = v16;
            }
            [v58 addPart:v31];

            uint64_t v10 = (void *)v21;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v60 objects:v80 count:16];
      }
      while (v14);
    }

    if (![v50 length]) {
      goto LABEL_55;
    }
    long long v32 = [v46 objectForKeyedSubscript:OSASanitizeOptionKeepFilename];
    if (v32 && (objc_opt_respondsToSelector() & 1) != 0 && ([v32 BOOLValue] & 1) == 0)
    {
      if (v55)
      {
        id v34 = v50;
        id v38 = [v34 pathExtension];
        long long v50 = [@"*" stringByAppendingPathExtension:v38];

        if (!v57) {
          goto LABEL_53;
        }
        id v39 = NSString;
        id v35 = [v58 componentsJoinedByString:@"/"];
        char v40 = [v39 stringWithFormat:@"    last <masking    > => %@[%@ -> %@]", v35, v34, v50];
        ((void (**)(void, void *))v57)[2](v57, v40);
      }
      else
      {
        if (!v57) {
          goto LABEL_54;
        }
        int v45 = NSString;
        id v34 = [v58 componentsJoinedByString:@"/"];
        id v35 = [v45 stringWithFormat:@"    last <keeping    > => %@[%@]", v34, v50];
        ((void (**)(void, void *))v57)[2](v57, v35);
      }
    }
    else
    {
      if (!v57)
      {
LABEL_54:
        [v58 addPart:v50];

LABEL_55:
        uint64_t v36 = [v58 componentsJoinedByString:@"/"];

        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&v74, 8);

        goto LABEL_57;
      }
      long long v33 = NSString;
      id v34 = [v58 componentsJoinedByString:@"/"];
      id v35 = [v33 stringWithFormat:@"    last <option-keep> => %@[%@]", v34, v50];
      ((void (**)(void, void *))v57)[2](v57, v35);
    }

LABEL_53:
    goto LABEL_54;
  }
  uint64_t v36 = 0;
LABEL_57:

  return v36;
}

void sub_1A7C8D9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void __OSASanitizePath_block_invoke()
{
  v25[2] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.osanalytics.sanitizer", 0);
  long long v1 = (void *)OSASanitizePath_domain_queue;
  OSASanitizePath_domain_queue = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  v24[0] = @"KPX";
  uint64_t v3 = objc_opt_new();
  [v3 addObject:@"/var/mobile"];
  [v3 sortUsingComparator:&__block_literal_global_104];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __OSASanitizePath_block_invoke_cold_1(v3);
  }
  v24[1] = @"MSK";
  v25[0] = v3;
  v25[1] = @"/Users/USER";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v2 setObject:v4 forKeyedSubscript:@"HomeDirectory"];

  v22[0] = @"KPX";
  uint64_t v5 = getVolumes(0);
  v22[1] = @"MSK";
  v23[0] = v5;
  v23[1] = @"/Volumes/NETWORK";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v2 setObject:v6 forKeyedSubscript:@"NetworkVolume"];

  v20[0] = @"KPX";
  uint64_t v7 = objc_opt_new();
  v20[1] = @"MSK";
  v21[0] = v7;
  v21[1] = &stru_1EFE17BD0;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v2 setObject:v8 forKeyedSubscript:@"SystemVolume"];

  v18[0] = @"KPX";
  uint64_t v9 = objc_opt_new();
  v18[1] = @"MSK";
  v19[0] = v9;
  v19[1] = @"/Volumes/VOLUME";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v2 setObject:v10 forKeyedSubscript:@"MountedVolume"];

  long long v16 = @"KPX";
  id v11 = getVolumes(1);
  uint64_t v17 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v2 setObject:v12 forKeyedSubscript:@"StagedVolume"];

  id v13 = (void *)OSASanitizePath_domainInfos;
  OSASanitizePath_domainInfos = (uint64_t)v2;
  id v14 = v2;

  int v15 = (void *)OSASanitizePath_orderedDomainList;
  OSASanitizePath_orderedDomainList = (uint64_t)&unk_1EFE25E50;
}

id getVolumes(int a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v9 = 0;
  int v3 = getmntinfo(&v9, 2);
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 1112;
    do
    {
      if (((*((unsigned char *)v9 + v5 - 1047) & 0x10) == 0) != a1)
      {
        char v6 = *((unsigned char *)&v9->f_bsize + v5);
        *((unsigned char *)&v9->f_bsize + v5) = 0;
        uint64_t v7 = [NSString stringWithUTF8String:(char *)v9 + v5 - 1024];
        *((unsigned char *)&v9->f_bsize + v5) = v6;
        if ((unint64_t)[v7 length] >= 2) {
          [v2 addObject:v7];
        }
      }
      v5 += 2168;
      --v4;
    }
    while (v4);
  }
  [v2 sortUsingComparator:&__block_literal_global_109];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    getVolumes_cold_1(a1, v2);
  }
  return v2;
}

void __OSASanitizePath_block_invoke_47(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __OSASanitizePath_block_invoke_47_cold_2(a1);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v2 = (id)OSASanitizePath_orderedDomainList;
  uint64_t v52 = [v2 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v52)
  {
    uint64_t v4 = a1 + 48;
    uint64_t v5 = *(void *)v60;
    char v6 = MEMORY[0x1E4F14500];
    *(void *)&long long v3 = 138413058;
    long long v47 = v3;
    uint64_t v7 = &randomlySelectForRetention__logRetentionCountQueue;
    uint64_t v48 = *(void *)v60;
    id v49 = v2;
    uint64_t v54 = a1 + 48;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v60 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)v4 + 8) + 40), *(id *)(*((void *)&v59 + 1) + 8 * v8));
        char v9 = [*(id *)(*(void *)(*(void *)v4 + 8) + 40) isEqualToString:@"StagedVolume"];
        uint64_t v10 = @"MountedVolume";
        if ((v9 & 1) == 0)
        {
          char v11 = [*(id *)(*(void *)(*(void *)v4 + 8) + 40) isEqualToString:@"SystemVolume"];
          uint64_t v10 = @"MountedVolume";
          if ((v11 & 1) == 0) {
            uint64_t v10 = *(__CFString **)(*(void *)(*(void *)v4 + 8) + 40);
          }
        }
        id v12 = v10;
        id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
        id v14 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = *(void *)(*(void *)(*(void *)v4 + 8) + 40);
          if (v13)
          {
            if (objc_opt_respondsToSelector()) {
              int v25 = [v13 BOOLValue];
            }
            else {
              int v25 = 0;
            }
          }
          else
          {
            int v25 = 1;
          }
          buf.st_dev = v47;
          *(void *)&buf.st_mode = v24;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v12;
          HIWORD(buf.st_gid) = 2112;
          *(void *)&buf.st_rdev = v13;
          LOWORD(buf.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&buf.st_atimespec.tv_sec + 2) = v25;
          _os_log_debug_impl(&dword_1A7C6D000, v6, OS_LOG_TYPE_DEBUG, "evaluate domain %@ (%@) option %@ check %d", (uint8_t *)&buf, 0x26u);
          uint64_t v5 = v48;
        }

        if (!v13 || (objc_opt_respondsToSelector() & 1) != 0 && [v13 BOOLValue])
        {
          id v51 = v12;
          long long v50 = objc_msgSend((id)v7[31], "objectForKeyedSubscript:", *(void *)(*(void *)(*(void *)v4 + 8) + 40), v47);
          int v15 = [v50 objectForKeyedSubscript:@"KPX"];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v56;
            while (2)
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v56 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
                if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v23 = *(void *)(*(void *)(*(void *)v54 + 8) + 40);
                  buf.st_dev = 138412546;
                  *(void *)&buf.st_mode = v23;
                  WORD2(buf.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v21;
                  _os_log_debug_impl(&dword_1A7C6D000, v6, OS_LOG_TYPE_DEBUG, "checking domain %@ prefix '%@'", (uint8_t *)&buf, 0x16u);
                }
                if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hasPrefix:v21])
                {
                  uint64_t v22 = [v21 length];
                  if (v22 == [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length]
                    || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "characterAtIndex:", objc_msgSend(v21, "length")) == 47)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
                      __OSASanitizePath_block_invoke_47_cold_1(v54);
                    }
                    uint64_t v31 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "substringFromIndex:", objc_msgSend(v21, "length"));
                    uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
                    long long v33 = *(void **)(v32 + 40);
                    *(void *)(v32 + 40) = v31;

                    id v2 = v49;
                    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:@"StagedVolume"])
                    {
                      id v34 = NSString;
                      v64[0] = v21;
                      v64[1] = @"System/Library/CoreServices/SystemVersion.plist";
                      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
                      uint64_t v36 = [v34 pathWithComponents:v35];

                      if ([v36 length]
                        && (uint64_t v37 = (const char *)[v36 fileSystemRepresentation]) != 0)
                      {
                        memset(&buf, 0, sizeof(buf));
                        int v38 = stat(v37, &buf);
                        id v39 = @"MountedVolume";
                        if (!v38) {
                          id v39 = @"SystemVolume";
                        }
                        id v53 = v39;
                        uint64_t v28 = v39;
                        id v27 = v21;
                        char v40 = [(id)OSASanitizePath_domainInfos objectForKeyedSubscript:*(void *)(*(void *)(*(void *)v54 + 8) + 40)];
                        int v41 = [v40 objectForKeyedSubscript:@"KPX"];
                        [v41 removeObject:v27];
                        id v42 = [(id)OSASanitizePath_domainInfos objectForKeyedSubscript:v28];

                        int v43 = [v42 objectForKeyedSubscript:@"KPX"];

                        [v43 addObject:v27];
                        objc_storeStrong((id *)(*(void *)(*(void *)v54 + 8) + 40), v53);
                      }
                      else
                      {
                        id v27 = 0;
                        uint64_t v28 = 0;
                      }
                      uint64_t v44 = v50;
                    }
                    else
                    {
                      id v27 = 0;
                      uint64_t v28 = 0;
                      uint64_t v44 = v50;
                    }

                    long long v30 = v51;
                    goto LABEL_50;
                  }
                }
                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v65 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          uint64_t v5 = v48;
          id v2 = v49;
          uint64_t v4 = a1 + 48;
          id v12 = v51;
          uint64_t v7 = &randomlySelectForRetention__logRetentionCountQueue;
        }

        ++v8;
      }
      while (v8 != v52);
      uint64_t v26 = [v2 countByEnumeratingWithState:&v59 objects:v66 count:16];
      uint64_t v52 = v26;
    }
    while (v26);
  }
  id v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v30 = *(__CFString **)(v29 + 40);
  *(void *)(v29 + 40) = 0;
LABEL_50:

  int v45 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v45)
  {
    if (v28) {
      [v45 isEqualToString:v28];
    }
  }
  else
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hasPrefix:@"/"]) {
      id v46 = @"SystemVolume";
    }
    else {
      id v46 = @"UnknownType";
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v46);
  }
}

id getRuleForSpecifier(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    unsigned int v2 = 0;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v2 > 0x1F) {
        break;
      }
      ++v2;
      uint64_t v3 = getRules(v1);

      id v1 = (id)v3;
    }
    while (v3);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v1;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

id getRules(void *a1)
{
  id v1 = a1;
  if (getRules_onceToken != -1) {
    dispatch_once(&getRules_onceToken, &__block_literal_global_112);
  }
  if (v1)
  {
    id v2 = [(id)getRules_rules objectForKeyedSubscript:v1];
  }
  else
  {
    id v2 = (id)getRules_rules;
  }
  uint64_t v3 = v2;

  return v3;
}

uint64_t shouldMaskFile(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 objectForKeyedSubscript:@"@files"];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    a2 = [v3 BOOLValue] ^ 1;
  }

  return a2;
}

id getBundleTypes(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 objectForKeyedSubscript:@"@bundles"];
  if (!v4 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), char v6 = v4, (isKindOfClass & 1) == 0)) {
    char v6 = v3;
  }
  id v7 = v6;

  return v7;
}

id getSubruleForSpecifier(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKeyedSubscript:a2];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = getRuleForSpecifier(v2);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __getLocalHomeDirectories_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    uint64_t v8 = [v4 length];
    uint64_t v7 = v8 != [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __getVolumes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    uint64_t v8 = [v4 length];
    uint64_t v7 = v8 != [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __getRules_block_invoke()
{
  dispatch_queue_t v0 = (void *)getRules_rules;
  getRules_rules = (uint64_t)&unk_1EFE25D10;
}

void sub_1A7C8FE8C(_Unwind_Exception *a1)
{
}

void sub_1A7C8FEA4(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1A7C90058);
}

void sub_1A7C8FEAC(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v10 = objc_begin_catch(exc_buf);
      char v11 = [v10 name];
      char v12 = [v11 isEqualToString:*MEMORY[0x1E4F282F8]];

      if ((v12 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(a9) = 138412290;
          *(void *)((char *)&a9 + 4) = v10;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "C4.! payload writer exception: %@", (uint8_t *)&a9, 0xCu);
        }
        objc_exception_rethrow();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v10 reason];
        LODWORD(a9) = 138543362;
        *(void *)((char *)&a9 + 4) = v15;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error while writing file: %{public}@", (uint8_t *)&a9, 0xCu);
      }
      id v16 = [v10 reason];
      xpc_dictionary_set_string(v9, "error_desc", (const char *)[v16 UTF8String]);

      xpc_dictionary_set_string(v9, "error_domain", "OSALog");
      xpc_dictionary_set_uint64(v9, "error_code", 0xAuLL);

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exc_buf);
    }
    JUMPOUT(0x1A7C8FD34);
  }
  _Unwind_Resume(exc_buf);
}

void sub_1A7C90030(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A7C90040);
  }
  _Unwind_Resume(a1);
}

void osa_scanDir(const char *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  uint64_t v8 = a4;
  uint64_t v20 = [NSString stringWithUTF8String:a1];
  char v9 = opendir(a1);
  if (v9)
  {
    id v10 = v9;
    char v11 = readdir(v9);
    if (v11)
    {
      char v12 = v11;
      do
      {
        id v13 = (void *)MEMORY[0x1AD0D8030]();
        d_name = v12->d_name;
        if (v12->d_name[0] != 46)
        {
          bzero(__str, 0x400uLL);
          snprintf(__str, 0x400uLL, "%s/%s", a1, v12->d_name);
          int d_type = v12->d_type;
          if (d_type == 4)
          {
            if ((a2 & 1) == 0 && (!v8 || v8[2](v8, a1, (uint64_t)v12->d_name))) {
              osa_scanDir(__str, a2, v7, v8);
            }
            goto LABEL_19;
          }
          if (d_type == 8)
          {
            if ((a2 & 0xC0) != 0)
            {
              id v16 = [v20 lastPathComponent];
              unsigned int v17 = ((a2 & 0x80) == 0) ^ [v16 isEqualToString:@"Retired"];

              if ((a2 & 0x200) == 0 || (v17 & 1) == 0)
              {
                if (!v17) {
                  goto LABEL_19;
                }
LABEL_18:
                ((void (**)(id, const char *, char *))v7)[2](v7, a1, d_name);
                goto LABEL_19;
              }
            }
            else if ((a2 & 0x200) == 0)
            {
              goto LABEL_18;
            }
            if (getxattr(__str, (const char *)[@"urgent" UTF8String], 0, 0, 0, 0) > 0) {
              goto LABEL_18;
            }
          }
        }
LABEL_19:
        char v12 = readdir(v10);
      }
      while (v12);
    }
    closedir(v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = __error();
    uint64_t v19 = strerror(*v18);
    *(_DWORD *)__str = 136315394;
    uint64_t v22 = a1;
    __int16 v23 = 2080;
    uint64_t v24 = v19;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to open log directory '%s': %s", (uint8_t *)__str, 0x16u);
  }
}

void sub_1A7C91FD8(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1A7C9391C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,id location,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(v71);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C94CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C94F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C9570C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t checkMCFeature(const char *a1, id *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1AD0D8030]();
  if (checkMCFeature_dylib_handle
    || (checkMCFeature_dylib_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4)) != 0)
  {
    if (!checkMCFeature_profileConnectionObj)
    {
      checkMCFeature_profileConnectionObuint64_t j = (uint64_t)objc_getClass("MCProfileConnection");
      if (!checkMCFeature_profileConnectionObj && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to find class MCProfileConnection", (uint8_t *)&v11, 2u);
      }
    }
    if (*a2) {
      goto LABEL_17;
    }
    id v5 = (id *)dlsym((void *)checkMCFeature_dylib_handle, a1);
    if (v5)
    {
      objc_storeStrong(a2, *v5);
      goto LABEL_17;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v11 = 136315138;
    char v12 = (char *)a1;
    unint64_t v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Unable to load symbol %s";
LABEL_16:
    _os_log_impl(&dword_1A7C6D000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0xCu);
    goto LABEL_17;
  }
  if (MGGetBoolAnswer() && !os_variant_is_recovery())
  {
    return 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    char v12 = dlerror();
    unint64_t v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Unable to load ManagedConfiguration dylib ('%s')";
    goto LABEL_16;
  }
LABEL_17:
  if (!checkMCFeature_profileConnectionObj || !*a2) {
    return 0;
  }
  uint64_t v8 = [(id)checkMCFeature_profileConnectionObj sharedConnection];
  BOOL v9 = [v8 effectiveBoolValueForSetting:*a2] == 1;

  return v9;
}

uint64_t isInternal()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t seedFeedbackPromptingEnabled()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  if (result)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t OSAIsACDCDevice()
{
  if (OSAIsACDCDevice_onceToken != -1) {
    dispatch_once(&OSAIsACDCDevice_onceToken, &__block_literal_global_7);
  }
  return OSAIsACDCDevice_isACDCDevice;
}

void __OSAIsACDCDevice_block_invoke()
{
  if (os_variant_is_darwinos() && MGGetSInt32Answer() == 12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v0 = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device is an ACDC compute module", v0, 2u);
    }
    OSAIsACDCDevice_isACDCDevice = 1;
  }
}

void sub_1A7C982BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A7C995CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Unwind_Resume(a1);
}

void runCrashMoverService(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Gathering non-mobile logs via crash_mover", buf, 2u);
  }
  id v2 = dispatch_get_global_queue(0, 0);
  id v3 = dispatch_group_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __runCrashMoverService_block_invoke;
  block[3] = &unk_1E5D1F5F0;
  id v4 = v1;
  id v7 = v4;
  dispatch_group_async(v3, v2, block);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v3, v5) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "crash_mover is taking too long!", buf, 2u);
  }
}

void __runCrashMoverService_block_invoke(uint64_t a1)
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0, 0);
  id v3 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_9);
    xpc_connection_resume(v3);
    v18[0] = @"Extensions";
    v18[1] = @"options";
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      uint64_t v4 = MEMORY[0x1E4F1CBF0];
    }
    v19[0] = &unk_1EFE25E80;
    v19[1] = v4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    dispatch_time_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v3, v5);
    uint64_t v7 = MEMORY[0x1AD0D88F0]();
    if (v7 == MEMORY[0x1E4F145A8])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E4F14530]);
        int v16 = 136315138;
        unsigned int v17 = string;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "crash_mover service FAILED with XPC error: %s", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_19;
    }
    if (v7 != MEMORY[0x1E4F14590])
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v8 = xpc_dictionary_get_value(v6, "Success");
    BOOL v9 = v8;
    if (v8)
    {
      BOOL value = xpc_BOOL_get_value(v8);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = "FAILED";
        if (value) {
          int v11 = "succeeded";
        }
        int v16 = 136315138;
        unsigned int v17 = v11;
        uint64_t v12 = MEMORY[0x1E4F14500];
        uint64_t v13 = "crash_mover service %s";
        uint32_t v14 = 12;
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      uint64_t v12 = MEMORY[0x1E4F14500];
      uint64_t v13 = "crash_mover service returned ambiguous response, assuming failure";
      uint32_t v14 = 2;
LABEL_17:
      _os_log_impl(&dword_1A7C6D000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v14);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "crash_mover service FAILED to connect", (uint8_t *)&v16, 2u);
  }
LABEL_20:
}

void __runCrashMoverService_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (MEMORY[0x1AD0D88F0]() == MEMORY[0x1E4F145A8]
    && v2 != (id)MEMORY[0x1E4F14528]
    && v2 != (id)MEMORY[0x1E4F14520]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14530]);
    int v7 = 136315138;
    uint64_t v8 = string;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "crash_mover service FAILED on setup: %s", (uint8_t *)&v7, 0xCu);
  }
}

void logForAppleCare(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x1AD0D8030]();
  if ([v3 count])
  {
    initR3();
    dispatch_time_t v5 = (void *)qword_1EB4D01E8;
    xpc_object_t v6 = [v3 objectAtIndexedSubscript:0];
    int v7 = openR3((uint64_t)&initR3_r3, [v5 containsObject:v6], a2);

    if ((v7 & 0x80000000) == 0)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = OSADateFormat(0, a2);
      uint64_t v10 = [v3 componentsJoinedByString:@","];
      int v11 = [v8 stringWithFormat:@"%@,%@\n", v9, v10];

      uint64_t v12 = [v11 dataUsingEncoding:4 allowLossyConversion:1];
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v12;
        write(v7, (const void *)[v14 bytes], objc_msgSend(v14, "length"));
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          logForAppleCare_cold_1(v3);
        }
      }
    }
    close(v7);
  }
}

void initR3()
{
  initR3_r3 = (int)time(0) / 86400;
  if (initR3_onceToken != -1)
  {
    dispatch_once(&initR3_onceToken, &__block_literal_global_10);
  }
}

uint64_t openR3(uint64_t a1, char a2, double a3)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v5 = 0xFFFFFFFFLL;
  int v24 = -1;
  xpc_object_t v6 = *(void **)(a1 + 16);
  if (v6)
  {
    id v8 = [v6 stringByAppendingPathComponent:@"general.log"];
    uint64_t v9 = (char *)[v8 fileSystemRepresentation];
    memset(&v20, 0, sizeof(v20));
    mode_t v10 = umask(0);
    if (lstat(v9, &v20) < 0)
    {
      if (*__error() == 2)
      {
        int R3 = createR3(a1, v9, a3, a3);
        *((_DWORD *)v22 + 6) = R3;
      }
    }
    else if ((v20.st_mode & 0xF000) == 0x8000 && v20.st_nlink == 1 && v20.st_uid == *(_DWORD *)(a1 + 4))
    {
      if (v20.st_uid) {
        int v11 = 384;
      }
      else {
        int v11 = 420;
      }
      if ((v20.st_mode & 0xFFF) == v11)
      {
        uint64_t v12 = dispatch_queue_create("com.apple.osanalytics.AppleCareSupport.open", 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __openR3_block_invoke;
        block[3] = &unk_1E5D20338;
        void block[4] = &v21;
        block[5] = v9;
        stat v16 = v20;
        double v17 = a3;
        uint64_t v18 = a1;
        char v19 = a2;
        dispatch_sync(v12, block);
      }
    }
    umask(v10);

    uint64_t v5 = *((unsigned int *)v22 + 6);
  }
  _Block_object_dispose(&v21, 8);
  return v5;
}

void sub_1A7C9AAB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t logEventForAppleCare(void *a1)
{
  id v1 = a1;
  double Current = CFAbsoluteTimeGetCurrent();
  logForAppleCare(v1, Current);

  return 0;
}

void logLineForAppleCare(uint64_t a1, uint64_t a2, double a3)
{
  id v7 = (id)[[NSString alloc] initWithUTF8String:a1];
  uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:a2];
  xpc_object_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, v5, 0);
  logForAppleCare(v6, a3);
}

void rollAppleCareLogs()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x1AD0D8030]();
  initR3();
  id v9 = 0;
  int v4 = initR3_r3;
  id v8 = (id)qword_1EB4D01E0;
  uid_t v5 = getuid();
  gid_t v6 = getgid();
  id v7 = @"/Library/Logs/AppleSupport/";

  double Current = CFAbsoluteTimeGetCurrent();
  int v2 = openR3((uint64_t)&initR3_r3, 0, Current);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  if (!v5)
  {
    int v3 = openR3((uint64_t)&v4, 0, Current);
    if ((v3 & 0x80000000) == 0) {
      close(v3);
    }
  }
  purgeR3Logs((uint64_t)&initR3_r3);
  if (!v5) {
    purgeR3Logs((uint64_t)&v4);
  }
}

void sub_1A7C9ACB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __destructor_8_s16_s24_s32((uint64_t)va);
  _Unwind_Resume(a1);
}

void purgeR3Logs(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    int v3 = (const char *)[v2 fileSystemRepresentation];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      purgeR3Logs_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
    int v11 = opendir(v3);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = readdir(v11);
      if (v13)
      {
        int v15 = v13;
        *(void *)&long long v14 = 67109634;
        long long v28 = v14;
        do
        {
          d_name = v15->d_name;
          double v17 = objc_msgSend(NSString, "stringWithUTF8String:", v15->d_name, v28);
          uint64_t v18 = [v17 rangeOfString:@"general.*\\.log" options:1024];

          if (v15->d_type == 8 && v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int value = 0;
            stat v20 = *(void **)(a1 + 16);
            uint64_t v21 = [NSString stringWithUTF8String:v15->d_name];
            id v22 = [v20 stringByAppendingPathComponent:v21];
            uint64_t v23 = (const char *)[v22 fileSystemRepresentation];

            getxattr(v23, "Day_Seq", &value, 4uLL, 0, 0);
            if (value <= *(_DWORD *)a1 - 14)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                int v24 = *(_DWORD *)a1 - value;
                if (v24 >= 365) {
                  int v24 = -1;
                }
                *(_DWORD *)stat buf = v28;
                int v31 = 14;
                __int16 v32 = 1024;
                *(_DWORD *)long long v33 = v24;
                *(_WORD *)&v33[4] = 2080;
                *(void *)&v33[6] = d_name;
                _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: purging old (limit %d vs actual %d) %s", buf, 0x18u);
              }
              unlink(v23);
            }
          }
          int v15 = readdir(v12);
        }
        while (v15);
      }
      closedir(v12);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = *__error();
      uint64_t v26 = __error();
      id v27 = strerror(*v26);
      *(_DWORD *)stat buf = 67109634;
      int v31 = v25;
      __int16 v32 = 2080;
      *(void *)long long v33 = v3;
      *(_WORD *)&v33[8] = 2080;
      *(void *)&v33[10] = v27;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] scanning '%s', %s", buf, 0x1Cu);
    }
  }
}

void __destructor_8_s16_s24_s32(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
}

void __initR3_block_invoke()
{
  qword_1EB4D01CC = 0;
  dispatch_queue_t v0 = getpwnam("mobile");
  if (v0)
  {
    qword_1EB4D01CC = *(void *)&v0->pw_uid;
    id v1 = [NSString stringWithUTF8String:v0->pw_dir];
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"/Library/Logs/AppleSupport/"];
    int v3 = *(void **)&algn_1EB4D01D4[4];
    *(void *)&algn_1EB4D01D4[4] = v2;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR unable to intialize data", v9, 2u);
  }
  endpwent();
  uint64_t v4 = +[OSASystemConfiguration sharedInstance];
  uint64_t v5 = [v4 buildVersion];
  uint64_t v6 = (void *)qword_1EB4D01E0;
  qword_1EB4D01E0 = v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EFE25E98];
  uint64_t v8 = (void *)qword_1EB4D01E8;
  qword_1EB4D01E8 = v7;
}

uint64_t createR3(uint64_t a1, char *a2, double a3, double a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v34 = a4;
  double value = a3;
  uint64_t v6 = 384;
  if (!*(_DWORD *)(a1 + 4)) {
    uint64_t v6 = 420;
  }
  uint64_t v7 = open_dprotected_np(a2, 2594, 4, 0, v6);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v29 = *__error();
      long long v30 = __error();
      int v31 = strerror(*v30);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)id v39 = v29;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = a2;
      __int16 v40 = 2080;
      uint64_t v41 = v31;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] failed to create %s, %s", buf, 0x1Cu);
    }
  }
  else
  {
    uid_t v9 = *(_DWORD *)(a1 + 4);
    if (v9) {
      fchown(v7, v9, *(_DWORD *)(a1 + 8));
    }
    uint64_t v10 = (const char *)[*(id *)(a1 + 24) UTF8String];
    if (!v10
      || (int v11 = v10, !*v10)
      || (size_t v12 = strlen(v10), fsetxattr(v8, "Version", v11, v12, 0, 0))
      || fsetxattr(v8, "Install", &value, 8uLL, 0, 0)
      || fsetxattr(v8, "Upgrade", &v34, 8uLL, 0, 0)
      || fsetxattr(v8, "Day_Seq", (const void *)a1, 4uLL, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        long long v14 = __error();
        int v15 = strerror(*v14);
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)id v39 = v13;
        *(_WORD *)&v39[4] = 2080;
        *(void *)&v39[6] = a2;
        __int16 v40 = 2080;
        uint64_t v41 = v15;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] setting xattrs on %s, %s", buf, 0x1Cu);
      }
    }
    stat v16 = (__CFString *)MGCopyAnswer();
    v36[0] = @"report";
    v36[1] = @"version";
    v37[0] = @"Device Software Diagnostic Log";
    v37[1] = &unk_1EFE25820;
    v36[2] = @"os_build";
    double v17 = +[OSASystemConfiguration sharedInstance];
    uint64_t v18 = [v17 productNameVersionBuildString];
    v37[2] = v18;
    v36[3] = @"model";
    char v19 = +[OSASystemConfiguration sharedInstance];
    uint64_t v20 = [v19 modelCode];
    uint64_t v21 = (void *)v20;
    id v22 = @"<no_sn>";
    if (v16) {
      id v22 = v16;
    }
    v37[3] = v20;
    v37[4] = v22;
    v36[4] = @"serial";
    v36[5] = @"installed";
    uint64_t v23 = OSADateFormat(0, value);
    v37[5] = v23;
    v36[6] = @"updated";
    int v24 = OSADateFormat(0, v34);
    v37[6] = v24;
    int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:7];

    id v33 = 0;
    uint64_t v26 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v25 options:0 error:&v33];
    id v27 = v33;
    id v28 = v26;
    write(v8, (const void *)[v28 bytes], objc_msgSend(v28, "length"));
    write(v8, "\n", 1uLL);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)id v39 = a2;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: new %s", buf, 0xCu);
    }
  }
  return v8;
}

void __openR3_block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (const char **)(a1 + 40);
  *(_DWORD *)(*((void *)*(v2 - 1) + 1) + 24) = open(*(const char **)(a1 + 40), 42);
  int v3 = *(_DWORD *)(*((void *)*(v2 - 1) + 1) + 24);
  if (v3 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *__error();
      int v11 = *v2;
      size_t v12 = __error();
      int v13 = strerror(*v12);
      v38.st_dev = 67109634;
      *(_DWORD *)&v38.st_mode = v10;
      LOWORD(v38.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v38.st_ino + 2) = (__darwin_ino64_t)v11;
      HIWORD(v38.st_uid) = 2080;
      *(void *)&v38.st_gid = v13;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] opening %s, %s", (uint8_t *)&v38, 0x1Cu);
    }
  }
  else
  {
    memset(&v38, 0, sizeof(v38));
    if (fstat(v3, &v38)
      && v38.st_nlink == *(unsigned __int16 *)(a1 + 54)
      && v38.st_uid == *(_DWORD *)(a1 + 64)
      && v38.st_mode == *(unsigned __int16 *)(a1 + 52)
      && v38.st_ino == *(void *)(a1 + 56)
      && v38.st_dev == *(_DWORD *)(a1 + 48))
    {
LABEL_22:
      close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
      return;
    }
    value[0] = *(_OWORD *)"<legacy>";
    memset(&value[1], 0, 48);
    unsigned int v34 = 0;
    double v32 = *(double *)(a1 + 192);
    double v33 = v32;
    ssize_t v4 = fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "Version", value, 0x3FuLL, 0, 0);
    if (v4 >= 1) {
      *((unsigned char *)value + v4) = 0;
    }
    uint64_t v5 = *(void **)(*(void *)(a1 + 200) + 24);
    uint64_t v6 = [NSString stringWithUTF8String:value];
    int v7 = [v5 isEqualToString:v6];

    fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "Day_Seq", &v34, 4uLL, 0, 0);
    fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "Install", &v33, 8uLL, 0, 0);
    if (v7) {
      fgetxattr(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "Upgrade", &v32, 8uLL, 0, 0);
    }
    int v8 = **(_DWORD **)(a1 + 200);
    BOOL v9 = v34 == v8 || v8 <= 0;
    if (!v9 || v7 != 1)
    {
      close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      long long v14 = *(void **)(*(void *)(a1 + 200) + 16);
      int v15 = objc_msgSend(NSString, "stringWithFormat:", @"general-%d-%s.log", v34, value);
      stat v16 = [v14 stringByAppendingPathComponent:v15];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        v36[0] = v16;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: rolling log -> %@", buf, 0xCu);
      }
      double v17 = (const std::__fs::filesystem::path *)*v2;
      id v18 = v16;
      char v19 = (const std::__fs::filesystem::path *)[v18 fileSystemRepresentation];
      rename(v17, v19, v20);
      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = *__error();
          uint64_t v23 = __error();
          int v24 = strerror(*v23);
          *(_DWORD *)stat buf = 67109378;
          LODWORD(v36[0]) = v22;
          WORD2(v36[0]) = 2080;
          *(void *)((char *)v36 + 6) = v24;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] rename failed, %s", buf, 0x12u);
        }
        unlink(*v2);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = createR3(*(void *)(a1 + 200), *(char **)(a1 + 40), v33, v32);
    }
    else
    {
      if (*(unsigned char *)(a1 + 208) && v38.st_size > 307200)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AppleCareSupport: WARN: limit exceeded, ignoring event", buf, 2u);
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __openR3_block_invoke_cold_1((uint64_t)v2, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__CFString *OSACPUTypeToString(uint64_t a1)
{
  uint64_t v2 = @"X86-64";
  if ((int)a1 <= 16777222)
  {
    if (a1 == 7) {
      goto LABEL_11;
    }
    if (a1 == 12)
    {
      uint64_t v2 = @"ARM";
      goto LABEL_11;
    }
  }
  else
  {
    switch(a1)
    {
      case 0x1000007:
        goto LABEL_11;
      case 0x100000C:
        uint64_t v2 = @"ARM-64";
        goto LABEL_11;
      case 0x200000C:
        uint64_t v2 = @"ARM64_32";
        goto LABEL_11;
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%08X", a1);
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  return v2;
}

uint64_t OSASafeRemoveFile(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __OSASafeRemoveFile_block_invoke;
  v4[3] = &unk_1E5D20360;
  v4[4] = &v5;
  v4[5] = a2;
  OSASafeOpen(a1, 0, 0, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A7C9CE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __OSASafeRemoveFile_block_invoke(uint64_t a1, int a2)
{
  uint64_t result = unlinkat(a2, *(const char **)(a1 + 40), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

uint64_t OSASafeRemoveFileAtURL(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  ssize_t v4 = [v3 URLByDeletingLastPathComponent];
  uint64_t v5 = +[OSASystemConfiguration sharedInstance];
  uint64_t v6 = [v4 path];
  int v7 = [v5 isAllowed:v6 forDomain:@"cleanup_paths"];

  if (v7)
  {
    char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v8 removeItemAtURL:v3 error:a2];
  }
  else
  {
    id v10 = [v3 lastPathComponent];
    uint64_t v11 = [v10 fileSystemRepresentation];

    uint64_t v12 = OSASafeRemoveFile([v4 fileSystemRepresentation], v11);
    uint64_t v9 = v12;
    if (a2 && (v12 & 1) == 0)
    {
      int v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      long long v14 = NSString;
      int v15 = __error();
      stat v16 = [v14 stringWithUTF8String:strerror(*v15)];
      v20[0] = v16;
      double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a2 = [v13 errorWithDomain:@"OSAFileOperations" code:0 userInfo:v17];

      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t OSASafeMoveItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _OWORD v6[2] = __OSASafeMoveItem_block_invoke;
  v6[3] = &unk_1E5D203B0;
  v6[4] = &v7;
  v6[5] = a3;
  v6[6] = a2;
  v6[7] = a4;
  OSASafeOpen(a1, 0, 0, v6);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_1A7C9D110(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __OSASafeMoveItem_block_invoke(uint64_t a1, int a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __OSASafeMoveItem_block_invoke_2;
  v4[3] = &unk_1E5D20388;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  int v6 = a2;
  long long v5 = *(_OWORD *)(a1 + 48);
  return OSASafeOpen(v2, 0, 0, v4);
}

uint64_t __OSASafeMoveItem_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = renameatx_np(*(_DWORD *)(a1 + 56), *(const char **)(a1 + 40), a2, *(const char **)(a1 + 48), 4u);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

uint64_t OSASafeMoveItemAtURL(void *a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a1;
  id v7 = [v6 URLByDeletingLastPathComponent];
  uint64_t v8 = [v7 fileSystemRepresentation];

  uint64_t v9 = [v6 lastPathComponent];

  id v10 = v9;
  uint64_t v11 = [v10 fileSystemRepresentation];

  id v12 = [v5 URLByDeletingLastPathComponent];
  uint64_t v13 = [v12 fileSystemRepresentation];

  long long v14 = [v5 lastPathComponent];

  id v15 = v14;
  uint64_t v16 = [v15 fileSystemRepresentation];

  uint64_t v17 = OSASafeMoveItem(v8, v11, v13, v16);
  uint64_t v18 = v17;
  if (a3 && (v17 & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v20 = NSString;
    int v21 = __error();
    int v22 = [v20 stringWithUTF8String:strerror(*v21)];
    v26[0] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a3 = [v19 errorWithDomain:@"OSAFileOperations" code:0 userInfo:v23];
  }
  return v18;
}

uint64_t OSASafeOpenWriteOnly(uint64_t a1, void *a2)
{
  return OSASafeOpen(a1, 513, 0x1A4u, a2);
}

BOOL OSASafeCreateDirectory(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = [v6 pathComponents];
  if ((unint64_t)[v8 count] < 2)
  {
    uint64_t v16 = @"Too few path components";
    goto LABEL_69;
  }
  if (![v7 createIntermediates])
  {
    id v11 = [v6 URLByDeletingLastPathComponent];
    uint64_t v17 = [v8 count];
    id v18 = [v6 URLByDeletingLastPathComponent];
    int v19 = open((const char *)[v18 fileSystemRepresentation], 537919488);

    if ((v19 & 0x80000000) == 0)
    {
      unint64_t v10 = v17 - 1;
LABEL_15:
      id v20 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v20 setUsesSignificantDigits:1];
      id v84 = v20;
      [v20 setMaximumSignificantDigits:2];
      if (v10 >= [v8 count])
      {
        uint64_t v16 = 0;
      }
      else
      {
        v80 = a4;
        v81 = v6;
        int v21 = a2;
        int v82 = v8;
        id v83 = v7;
        while (1)
        {
          id v22 = [v8 objectAtIndex:v10];
          uint64_t v23 = (const char *)[v22 fileSystemRepresentation];

          int v24 = (void *)MEMORY[0x1E4F1CB10];
          uint64_t v25 = objc_msgSend(v8, "subarrayWithRange:", 0, ++v10);
          __int16 v87 = [v24 fileURLWithPathComponents:v25];

          if (mkdirat(v19, v23, a2 & 0x1B6))
          {
            uint64_t v16 = @"Failed to create directory";
            goto LABEL_66;
          }
          int v26 = openat(v19, v23, 537919488);
          if (v26 < 0) {
            break;
          }
          int v27 = v26;
          close(v19);
          memset(&v92, 0, sizeof(v92));
          if (fstat(v27, &v92))
          {
            uint64_t v28 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = [v81 path];
              uint64_t v37 = __error();
              stat v38 = strerror(*v37);
              buf.st_dev = 138543618;
              *(void *)&buf.int st_mode = v36;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
              _os_log_error_impl(&dword_1A7C6D000, v28, OS_LOG_TYPE_ERROR, "Failed to stat %{public}@ when checking group ownership: %s", (uint8_t *)&buf, 0x16u);
            }
            int v29 = 0;
            int v30 = 0;
          }
          else
          {
            uint64_t v28 = MEMORY[0x1E4F14500];
            if (v92.st_mode == v21) {
              goto LABEL_31;
            }
            int v31 = fchmod(v27, v21);
            if (v31 == -1 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v68 = [v81 path];
              v69 = __error();
              uint64_t v70 = strerror(*v69);
              buf.st_dev = 138543618;
              *(void *)&buf.int st_mode = v68;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v70;
              _os_log_error_impl(&dword_1A7C6D000, v28, OS_LOG_TYPE_ERROR, "Failed to modify permissions while creating %{public}@: %s", (uint8_t *)&buf, 0x16u);
            }
            if (v21 != 504)
            {
LABEL_31:
              int v85 = 0;
            }
            else
            {
              double v32 = v28;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                int st_mode = v92.st_mode;
                if (v31)
                {
                  unsigned int v34 = __error();
                  id v35 = strerror(*v34);
                }
                else
                {
                  id v35 = "";
                }
                buf.st_dev = 138544386;
                *(void *)&buf.int st_mode = v87;
                WORD2(buf.st_ino) = 1024;
                *(_DWORD *)((char *)&buf.st_ino + 6) = st_mode;
                HIWORD(buf.st_uid) = 1024;
                buf.gid_t st_gid = 504;
                LOWORD(buf.st_rdev) = 1024;
                *(dev_t *)((char *)&buf.st_rdev + 2) = v31 == 0;
                *((_WORD *)&buf.st_rdev + 3) = 2082;
                buf.st_atimespec.tv_sec = (__darwin_time_t)v35;
                _os_log_impl(&dword_1A7C6D000, v28, OS_LOG_TYPE_DEFAULT, "=== Attempted change perms on new dir: %{public}@ from 0x%X to 0x%X with result %d %{public}s", (uint8_t *)&buf, 0x28u);
              }

              int v85 = 1;
            }
            uint64_t v39 = [v7 userID];
            __int16 v40 = [v7 groupID];
            stat buf = v92;
            BOOL v41 = OSASetOwnership(v27, (uint64_t)&buf, v39, v40);

            dev_t v42 = v41;
            if (!v41 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              id v65 = [v81 path];
              uint64_t v66 = __error();
              uint64_t v67 = strerror(*v66);
              buf.st_dev = 138543618;
              *(void *)&buf.int st_mode = v65;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v67;
              _os_log_error_impl(&dword_1A7C6D000, v28, OS_LOG_TYPE_ERROR, "Failed to set ownership while creating %{public}@: %s", (uint8_t *)&buf, 0x16u);
            }
            int v43 = [v7 groupID];
            int v44 = [v43 unsignedIntValue];
            gid_t st_gid = v92.st_gid;

            int v30 = 0;
            if (v44 == 250)
            {
              int v29 = v85;
              if (st_gid != 250)
              {
                id v46 = v28;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  gid_t v47 = v92.st_gid;
                  uint64_t v48 = "";
                  if ((v42 & 1) == 0)
                  {
                    id v49 = __error();
                    uint64_t v48 = strerror(*v49);
                  }
                  buf.st_dev = 138544386;
                  *(void *)&buf.int st_mode = v87;
                  WORD2(buf.st_ino) = 1024;
                  *(_DWORD *)((char *)&buf.st_ino + 6) = v47;
                  HIWORD(buf.st_uid) = 1024;
                  buf.gid_t st_gid = 250;
                  LOWORD(buf.st_rdev) = 1024;
                  *(dev_t *)((char *)&buf.st_rdev + 2) = v42;
                  *((_WORD *)&buf.st_rdev + 3) = 2082;
                  buf.st_atimespec.tv_sec = (__darwin_time_t)v48;
                  _os_log_impl(&dword_1A7C6D000, v28, OS_LOG_TYPE_DEFAULT, "=== Attempted change gid on new dir: %{public}@ from %d to _analyticsusers (%u) with result %d %{public}s", (uint8_t *)&buf, 0x28u);
                }

                int v30 = 1;
              }
              int v21 = a2;
            }
            else
            {
              int v29 = v85;
              int v21 = a2;
            }
          }
          if ([v7 fileProtectionNone]
            && fcntl(v27, 63) != 4
            && fcntl(v27, 64, 4) == -1
            && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            OSASafeCreateDirectory_cold_1(v95, v81, &v96);
          }
          if ((v29 | v30) == 1)
          {
            getprogname();
            long long v50 = OSAGetBootTime();
            if (v50)
            {
              id v51 = NSNumber;
              uint64_t v52 = [MEMORY[0x1E4F1C9C8] date];
              [v52 timeIntervalSinceDate:v50];
              id v53 = objc_msgSend(v51, "numberWithDouble:");
              uint64_t v54 = [v84 stringForObjectValue:v53];
            }
            else
            {
              uint64_t v54 = @"-1";
            }
            long long v55 = OSAGetProcessUptime();
            if (v55)
            {
              long long v56 = NSNumber;
              long long v57 = [MEMORY[0x1E4F1C9C8] date];
              [v57 timeIntervalSinceDate:v55];
              long long v58 = objc_msgSend(v56, "numberWithDouble:");
              long long v59 = [v84 stringForObjectValue:v58];
            }
            else
            {
              long long v59 = @"-1";
            }
            long long v60 = [v11 path];
            [v87 path];
            uint64_t v91 = v59;
            __int16 v89 = v88 = v60;
            int v90 = v54;
            long long v61 = v59;
            long long v62 = v54;
            id v63 = v89;
            id v64 = v60;
            AnalyticsSendEventLazy();

            uint64_t v8 = v82;
            id v7 = v83;
            int v21 = a2;
          }

          int v19 = v27;
          if (v10 >= [v8 count])
          {
            uint64_t v16 = 0;
            int v19 = v27;
            goto LABEL_67;
          }
        }
        uint64_t v16 = @"Failed to open newly created directory";
LABEL_66:

LABEL_67:
        id v6 = v81;
        a4 = v80;
      }
      close(v19);

      goto LABEL_69;
    }
LABEL_13:

    uint64_t v16 = @"Failed to find base path on which to create directories";
    goto LABEL_69;
  }
  uint64_t v9 = [v8 count];
  unint64_t v10 = v9 - 1;
  if (v9 == 1)
  {
LABEL_9:
    id v11 = 0;
    goto LABEL_13;
  }
  id v11 = 0;
  while (1)
  {
    id v12 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v13 = objc_msgSend(v8, "subarrayWithRange:", 0, v10);
    long long v14 = [v12 fileURLWithPathComponents:v13];

    id v11 = v14;
    int v15 = open((const char *)[v11 fileSystemRepresentation], 537919488);
    if ((v15 & 0x80000000) == 0)
    {
      int v19 = v15;
      goto LABEL_15;
    }
    if (*__error() != 2) {
      break;
    }
    if (!--v10)
    {

      goto LABEL_9;
    }
  }

  uint64_t v16 = @"Failed to open intermediate path";
LABEL_69:
  if (a4 && v16)
  {
    v71 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v94[0] = v16;
    v93[0] = v72;
    v93[1] = @"errno";
    id v73 = [NSNumber numberWithInt:*__error()];
    v94[1] = v73;
    v93[2] = @"errstr";
    uint64_t v74 = NSString;
    v75 = __error();
    uint64_t v76 = [v74 stringWithUTF8String:strerror(*v75)];
    v94[2] = v76;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:3];
    v78 = v77 = v8;
    *a4 = [v71 errorWithDomain:@"OSAFileOperations" code:2 userInfo:v78];

    uint64_t v8 = v77;
  }

  return v16 == 0;
}

id __OSASafeCreateDirectory_block_invoke(uint64_t a1)
{
  v22[16] = *MEMORY[0x1E4F143B8];
  v21[0] = @"progname";
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    id v3 = [NSString stringWithUTF8String:v2];
  }
  else
  {
    id v3 = @"<unknown>";
  }
  v22[0] = v3;
  v22[1] = MEMORY[0x1E4F1CC38];
  v21[1] = @"create_dir";
  void v21[2] = @"create_dir_success";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 78), v3);
  id v5 = *(__CFString **)(a1 + 32);
  id v6 = *(__CFString **)(a1 + 40);
  if (!v5) {
    id v5 = @"path sanitize failed";
  }
  id v20 = (void *)v4;
  void v22[2] = v4;
  v22[3] = v5;
  v21[3] = @"start_path";
  v21[4] = @"path";
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"path sanitize failed";
  }
  v22[4] = v7;
  v21[5] = @"original_perms";
  int v8 = *(unsigned __int8 *)(a1 + 78);
  if (*(unsigned char *)(a1 + 78))
  {
    uint64_t v9 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 76)];
  }
  else
  {
    uint64_t v9 = &unk_1EFE25898;
  }
  v22[5] = v9;
  v21[6] = @"modify_perms";
  unint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 79)];
  v22[6] = v10;
  v21[7] = @"modify_perms_success";
  id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  v22[7] = v11;
  v22[8] = &unk_1EFE258B0;
  v21[8] = @"modify_perms_value";
  v21[9] = @"original_gid";
  int v12 = *(unsigned __int8 *)(a1 + 78);
  if (*(unsigned char *)(a1 + 78))
  {
    uint64_t v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  }
  else
  {
    uint64_t v13 = &unk_1EFE25898;
  }
  v22[9] = v13;
  v21[10] = @"modify_gid";
  long long v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  v22[10] = v14;
  v21[11] = @"modify_gid_success";
  int v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 82)];
  v22[11] = v15;
  v22[12] = &unk_1EFE258C8;
  v21[12] = @"modify_gid_value";
  v21[13] = @"boot_time_appx";
  uint64_t v16 = *(void *)(a1 + 56);
  v22[13] = *(void *)(a1 + 48);
  v22[14] = v16;
  v21[14] = @"proc_uptime_appx";
  v21[15] = @"framework";
  v22[15] = @"OSAnalytics";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:16];

  if (v12) {
  if (v8)
  }

  if (v2) {
  return v17;
  }
}

void sub_1A7CA1C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

id symbolicateSpeedTracer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v37 = 0;
  stat v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = __Block_byref_object_copy__7;
  BOOL v41 = __Block_byref_object_dispose__7;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__7;
  v35[4] = __Block_byref_object_dispose__7;
  id v36 = 0;
  if ([v3 length])
  {
    id v5 = [v4 objectForKeyedSubscript:OSATransformOptionTracerURL];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      [MEMORY[0x1E4F1CB10] URLWithString:@"https://speedtracer.apple.com/api/v2/trace?detail=full"];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F28E88] requestWithURL:v7];
    [v9 setHTTPMethod:@"POST"];
    uint64_t v10 = [v4 objectForKeyedSubscript:OSATransformOptionTracerGroup];
    id v11 = (void *)v10;
    if (v10) {
      int v12 = (__CFString *)v10;
    }
    else {
      int v12 = @"osatool";
    }
    [v9 setValue:v12 forHTTPHeaderField:@"X-ST-GroupName"];
    int v29 = v8;
    int v30 = v6;
    uint64_t v13 = [MEMORY[0x1E4F28F80] processInfo];
    long long v14 = [v13 globallyUniqueString];

    int v15 = objc_opt_new();
    objc_msgSend(NSString, "stringWithFormat:", @"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n",
      v14,
      @"log_content",
      @"tmpname",
    uint64_t v16 = @"application/octet-stream");
    uint64_t v17 = [v16 dataUsingEncoding:4];
    [v15 appendData:v17];

    [v15 appendData:v3];
    id v18 = [@"\r\n" dataUsingEncoding:4];
    [v15 appendData:v18];

    int v19 = [NSString stringWithFormat:@"--%@--\r\n", v14];
    id v20 = [v19 dataUsingEncoding:4];
    [v15 appendData:v20];

    [v9 setTimeoutInterval:120.0];
    int v21 = [NSString stringWithFormat:@"multipart/form-data boundary=%@", v14];;
    [v9 setHTTPContentType:v21];

    [v9 setHTTPBody:v15];
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    uint64_t v23 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    int v24 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v23];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __symbolicateSpeedTracer_block_invoke;
    v31[3] = &unk_1E5D20428;
    double v33 = &v37;
    unsigned int v34 = v35;
    uint64_t v25 = v22;
    double v32 = v25;
    int v26 = [v24 dataTaskWithRequest:v9 completionHandler:v31];
    [v26 resume];

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v27 = (id)v38[5];
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v27;
}

void sub_1A7CA2ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void __symbolicateSpeedTracer_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v35 = OSATransformResultError;
    v36[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v10 localizedDescription];
      *(_DWORD *)stat buf = 138412290;
      *(void *)double v32 = v14;
      int v15 = MEMORY[0x1E4F14500];
      uint64_t v16 = "speedtracer error response: %@";
LABEL_4:
      _os_log_impl(&dword_1A7C6D000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v8;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [v17 statusCode];
        int v19 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(v17, "statusCode"));
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)double v32 = v18;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v19;
        __int16 v33 = 1024;
        int v34 = [v7 length];
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SpeedTracer response %d '%@' received %d bytes\n", buf, 0x18u);
      }
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v20 + 40);
    uint64_t v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&obj];
    objc_storeStrong((id *)(v20 + 40), obj);
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v24)
      {
        uint64_t v29 = OSATransformResultError;
        uint64_t v30 = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
        id v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
          *(_DWORD *)stat buf = 138412290;
          *(void *)double v32 = v14;
          int v15 = MEMORY[0x1E4F14500];
          uint64_t v16 = "failed to extract JSON data from speedtracer result: %@";
          goto LABEL_4;
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1A7CA3B54(_Unwind_Exception *a1)
{
}

uint64_t OSA_OSX_Legacy_GetUserUUID()
{
  if (OSA_OSX_Legacy_GetUserUUID___uuid) {
    return OSA_OSX_Legacy_GetUserUUID___uuid;
  }
  if (_CRGetAnonHostUUID_pred != -1) {
    dispatch_once(&_CRGetAnonHostUUID_pred, &__block_literal_global_11);
  }
  uint64_t v1 = (const void *)_CRGetAnonHostUUID___uuid;
  if (_CRGetAnonHostUUID___uuid)
  {
    CFRetain((CFTypeRef)_CRGetAnonHostUUID___uuid);
    goto LABEL_7;
  }
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPropertyListRef v5 = CFPreferencesCopyValue(@"userUUID", @"com.apple.CrashReporter", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = v5;
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(v6))
  {
    CFRelease(v6);
    goto LABEL_14;
  }
  uint64_t v1 = CFRetain(v6);
  CFRelease(v6);
  if (!v1)
  {
LABEL_14:
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v9 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    if (!v9) {
      return OSA_OSX_Legacy_GetUserUUID___uuid;
    }
    CFUUIDRef v10 = v9;
    uint64_t v1 = CFUUIDCreateString(v8, v9);
    CFRelease(v10);
    if (!v1) {
      return OSA_OSX_Legacy_GetUserUUID___uuid;
    }
    CFPreferencesSetValue(@"userUUID", v1, @"com.apple.CrashReporter", v3, v4);
    CFPreferencesSynchronize(@"com.apple.CrashReporter", v3, v4);
  }
LABEL_7:
  uint64_t v2 = 0;
  atomic_compare_exchange_strong(&OSA_OSX_Legacy_GetUserUUID___uuid, (unint64_t *)&v2, (unint64_t)v1);
  if (v2) {
    CFRelease(v1);
  }
  return OSA_OSX_Legacy_GetUserUUID___uuid;
}

CFStringRef _CRCopyAnonHostUUIDPath()
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFArrayRef v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  if (!v0) {
    return 0;
  }
  CFArrayRef v1 = v0;
  if (CFArrayGetCount(v0) <= 0)
  {
    CFArrayRef v6 = v1;
LABEL_23:
    CFRelease(v6);
    return 0;
  }
  CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, 0);
  if (CFArrayGetCount(v1) < 1) {
    goto LABEL_8;
  }
  CFIndex v3 = 0;
  while (1)
  {
    CFURLRef v4 = (const __CFURL *)CFArrayGetValueAtIndex(v1, v3);
    if (CFURLGetFileSystemRepresentation(v4, 0, &buffer[0].byte0, 1024))
    {
      memset(&v24, 0, sizeof(v24));
      if (!lstat((const char *)buffer, &v24)) {
        break;
      }
    }
    if (CFArrayGetCount(v1) <= ++v3) {
      goto LABEL_8;
    }
  }
  CFURLRef v7 = (const __CFURL *)CFRetain(v4);
  if (v7)
  {
    CFURLRef v5 = v7;
    CFRelease(v1);
  }
  else
  {
LABEL_8:
    _CRMakeDirectory(ValueAtIndex, 493, 0);
    CFURLRef v5 = (const __CFURL *)CFRetain(ValueAtIndex);
    CFRelease(v1);
    if (!v5) {
      return 0;
    }
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFURLRef v9 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, @"Application Support", 1u);
  if (!v9)
  {
LABEL_22:
    CFArrayRef v6 = v5;
    goto LABEL_23;
  }
  CFURLRef v10 = v9;
  _CRMakeDirectory(v9, 509, 0);
  CFURLRef v11 = CFURLCreateCopyAppendingPathComponent(v8, v10, @"CrashReporter", 1u);
  if (!v11)
  {
    CFRelease(v10);
    goto LABEL_22;
  }
  CFURLRef v12 = v11;
  _CRMakeDirectory(v11, 509, 1);
  CFRelease(v10);
  CFRelease(v5);
  uint64_t v13 = CRGetHostUUID___hostUUIDString;
  if (!CRGetHostUUID___hostUUIDString)
  {
    *(void *)&buffer[0].byte0 = 0;
    *(void *)&buffer[0].byte8 = 0;
    *(void *)&v24.st_dev = 0;
    v24.st_ino = 0;
    if (gethostuuid(&buffer[0].byte0, (const timespec *)&v24) == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _CRCopyAnonHostUUIDPath_cold_1();
      }
      uint64_t v13 = 0;
    }
    else
    {
      CFUUIDRef v14 = CFUUIDCreateFromUUIDBytes(v8, buffer[0]);
      if (v14)
      {
        CFUUIDRef v15 = v14;
        CFStringRef v16 = CFUUIDCreateString(v8, v14);
        CFRelease(v15);
        uint64_t v17 = 0;
        atomic_compare_exchange_strong(&CRGetHostUUID___hostUUIDString, (unint64_t *)&v17, (unint64_t)v16);
        if (v17) {
          CFRelease(v16);
        }
      }
      uint64_t v13 = CRGetHostUUID___hostUUIDString;
    }
  }
  CFStringRef v20 = CFStringCreateWithFormat(v8, 0, @"AnonymousIdentifier_%@.plist", v13);
  if (v20)
  {
    CFStringRef v21 = v20;
    CFURLRef v22 = CFURLCreateCopyAppendingPathComponent(v8, v12, v20, 0);
    if (v22)
    {
      CFURLRef v23 = v22;
      CFStringRef v18 = CFURLCopyFileSystemPath(v22, kCFURLPOSIXPathStyle);
      CFRelease(v23);
    }
    else
    {
      CFStringRef v18 = 0;
    }
    CFRelease(v21);
  }
  else
  {
    CFStringRef v18 = 0;
  }
  CFRelease(v12);
  return v18;
}

uint64_t _CRMakeDirectory(const __CFURL *a1, int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = CFURLGetFileSystemRepresentation(a1, 0, buffer, 1024);
  if (result)
  {
    memset(&v9, 0, sizeof(v9));
    uint64_t result = stat((const char *)buffer, &v9);
    if (result)
    {
      mode_t v6 = umask(0);
      mkdir((const char *)buffer, a2);
      umask(v6);
      uint64_t result = geteuid();
      if (a3)
      {
        if (!result) {
          return chown((const char *)buffer, 0xFFFFFFFF, 0x50u);
        }
      }
    }
    else if ((v9.st_mode & 0xF000) == 0x4000 && a3 != 0 && (v9.st_mode & 0x1FF) != a2)
    {
      return chmod((const char *)buffer, a2);
    }
  }
  return result;
}

id OSAGetBootTime()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)mode_t v6 = 0x1500000001;
  v5[0] = 0;
  v5[1] = 0;
  size_t v4 = 16;
  int v0 = sysctl(v6, 2u, v5, &v4, 0, 0);
  CFArrayRef v1 = 0;
  if (v0 != -1 && v5[0] != 0)
  {
    CFArrayRef v1 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v5[0]];
  }
  return v1;
}

id OSAGetProcessUptime()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)size_t v4 = 0xE00000001;
  int v5 = 1;
  pid_t v6 = getpid();
  memset(v3, 0, 512);
  size_t v2 = 648;
  if (sysctl(v4, 4u, v3, &v2, 0, 0) < 0)
  {
    int v0 = 0;
  }
  else
  {
    int v0 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(uint64_t *)&v3[0]];
  }
  return v0;
}

time_t OSADaysSinceEpoch()
{
  time_t result = time(0);
  if (result >= 0) {
    return result / 0x15180uLL;
  }
  return result;
}

BOOL OSARandomSelection(unint64_t a1, void *a2)
{
  id v3 = a2;
  size_t v4 = +[OSASystemConfiguration sharedInstance];
  int v5 = [v4 getTaskingKey:v3];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      a1 = [v5 integerValue];
    }
  }
  BOOL v6 = a1 > arc4random_uniform(0x2710u);

  return v6;
}

__CFString *OSANSDateFormat(unsigned int a1, void *a2)
{
  [a2 timeIntervalSinceReferenceDate];
  return OSADateFormat(a1, v3);
}

double OSATimeIntervalApproximate(double a1)
{
  return floor(a1 / 300.0) * 300.0;
}

void rtcsc_send_realtime(uint64_t a1, uint64_t a2, void *a3)
{
}

void rtcsc_send_base(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  v31[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  CFAllocatorRef v8 = @"osanalytics_logEr";
  switch((int)a1)
  {
    case 2001:
      stat v9 = +[OSASystemConfiguration sharedInstance];
      int v10 = [v9 appleInternal];

      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_30;
    case 2002:
      uint64_t v11 = +[OSASystemConfiguration sharedInstance];
      char v12 = [v11 appleInternal];

      if (v12)
      {
LABEL_5:
        CFAllocatorRef v8 = @"analyticsd_sub";
        if (a4) {
          goto LABEL_18;
        }
        goto LABEL_29;
      }
      goto LABEL_30;
    case 2003:
      goto LABEL_17;
    case 2004:
      CFAllocatorRef v8 = @"osanalytics_jetsam";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 2005:
      CFAllocatorRef v8 = @"osanalytics_crashes";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 2006:
      uint64_t v13 = +[OSASystemConfiguration sharedInstance];
      char v14 = [v13 appleInternal];

      if ((v14 & 1) == 0) {
        goto LABEL_30;
      }
      CFAllocatorRef v8 = @"osanalytics_monitor";
      if (a4)
      {
LABEL_18:
        id v15 = v7;
        if (rtc_internal_realtime_onceToken != -1) {
          dispatch_once(&rtc_internal_realtime_onceToken, &__block_literal_global_40);
        }
        if (objc_opt_class())
        {
          CFStringRef v16 = [NSNumber numberWithUnsignedInt:arc4random()];
          v30[0] = getkRTCReportingSessionInfoClientType();
          v31[0] = &unk_1EFE258F8;
          v30[1] = getkRTCReportingSessionInfoClientVersion();
          v31[1] = &unk_1EFE25910;
          v30[2] = getkRTCReportingSessionInfoBatchEvent();
          v31[2] = MEMORY[0x1E4F1CC28];
          v30[3] = getkRTCReportingSessionInfoSessionID();
          v31[3] = v16;
          v30[4] = getkRTCReportingSessionInfoContainsRealtimeEvents();
          void v31[4] = MEMORY[0x1E4F1CC38];
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
          v28[0] = getkRTCReportingUserInfoClientName();
          v29[0] = @"com.apple.CA";
          v28[1] = getkRTCReportingUserInfoServiceName();
          v29[1] = v8;
          CFStringRef v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
          if ([(id)rtc_internal_realtime_RTCReportingClass sendOneMessageWithSessionInfo:v17 userInfo:v18 category:a1 type:a2 payload:v15 error:0])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)id v27 = 0;
              _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "RTCReporting Realtime: sendOneMessageWithSessionInfo succeeded", v27, 2u);
            }
          }
          else
          {
            BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v19) {
              rtcsc_send_base_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
            }
          }
        }
      }
      else
      {
LABEL_29:
        rtc_internal(0, v8, a1, a2, v7);
      }
LABEL_30:

      return;
    case 2007:
      CFAllocatorRef v8 = @"osanalytics_monitor_ca_submission";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 2008:
      CFAllocatorRef v8 = @"osanalytics_monitor_hb_diff";
LABEL_17:
      if (a4) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 2009:
      CFAllocatorRef v8 = @"osanalytics_beacon";
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    default:
      goto LABEL_30;
  }
}

void rtcsc_send(uint64_t a1, uint64_t a2, void *a3)
{
}

void rtc_internal(char a1, void *a2, __int16 a3, __int16 a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  if (rtc_internal_onceToken != -1) {
    dispatch_once(&rtc_internal_onceToken, &__block_literal_global_60);
  }
  if (objc_opt_class())
  {
    uint64_t v11 = rtc_internal_rtc_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __rtc_internal_block_invoke_63;
    block[3] = &unk_1E5D20598;
    id v13 = v10;
    __int16 v15 = a3;
    __int16 v16 = a4;
    char v17 = a1;
    id v14 = v9;
    dispatch_async(v11, block);
  }
}

uint64_t OSARTCIsProcessOfInterest(void *a1)
{
  uint64_t v1 = OSARTCIsProcessOfInterest_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&OSARTCIsProcessOfInterest_onceToken, &__block_literal_global_12);
  }
  uint64_t v3 = [(id)OSARTCIsProcessOfInterest_processSet containsObject:v2];

  return v3;
}

uint64_t __OSARTCIsProcessOfInterest_block_invoke()
{
  OSARTCIsProcessOfInterest_processSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"analyticsd", @"SubmitDiagInfo", @"osanalyticshelper", @"OTACrashCopier", @"ProxiedCrashCopier", 0);
  return MEMORY[0x1F41817F8]();
}

void __rtc_internal_realtime_block_invoke()
{
  uint64_t v0 = RTCReportingLibraryCore();
  BOOL v1 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "linking RTCReporting.framework", buf, 2u);
    }
    rtc_internal_realtime_RTCReportingClass = (uint64_t)getRTCReportingClass();
  }
  else if (v1)
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "RTCReporting.framework is unavailable", v2, 2u);
  }
}

id getRTCReportingClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRTCReportingClass_softClass;
  uint64_t v7 = getRTCReportingClass_softClass;
  if (!getRTCReportingClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRTCReportingClass_block_invoke;
    v3[3] = &unk_1E5D1F8E0;
    v3[4] = &v4;
    __getRTCReportingClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A7CA6EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkRTCReportingSessionInfoClientType()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingSessionInfoClientType");
    getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoClientVersion()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingSessionInfoClientVersion");
    getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoBatchEvent()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingSessionInfoBatchEvent");
    getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoSessionID()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingSessionInfoSessionID");
    getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t getkRTCReportingSessionInfoContainsRealtimeEvents()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingSessionInfoContainsRealtimeEvents");
    getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t getkRTCReportingUserInfoClientName()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoClientNameSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingUserInfoClientName");
    getkRTCReportingUserInfoClientNameSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t getkRTCReportingUserInfoServiceName()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
  uint64_t v7 = getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoServiceNameSymbolLoc_ptr)
  {
    id v1 = (void *)RTCReportingLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kRTCReportingUserInfoServiceName");
    getkRTCReportingUserInfoServiceNameSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(void *)v0;
}

uint64_t RTCReportingLibraryCore()
{
  if (!RTCReportingLibraryCore_frameworkLibrary) {
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RTCReportingLibraryCore_frameworkLibrary;
}

uint64_t __RTCReportingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RTCReportingLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRTCReportingClass_block_invoke(uint64_t a1)
{
  RTCReportingLibrary();
  Class result = objc_getClass("RTCReporting");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRTCReportingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTCReportingClass_block_invoke_cold_1();
    return (Class)RTCReportingLibrary();
  }
  return result;
}

uint64_t RTCReportingLibrary()
{
  uint64_t v0 = RTCReportingLibraryCore();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getkRTCReportingSessionInfoClientTypeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingSessionInfoClientType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkRTCReportingSessionInfoClientVersionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingSessionInfoClientVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkRTCReportingSessionInfoBatchEventSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingSessionInfoBatchEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkRTCReportingSessionInfoSessionIDSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingSessionInfoSessionID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingSessionInfoContainsRealtimeEvents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void *__getkRTCReportingUserInfoClientNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingUserInfoClientName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingUserInfoClientNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkRTCReportingUserInfoServiceNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RTCReportingLibrary();
  Class result = dlsym(v2, "kRTCReportingUserInfoServiceName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkRTCReportingUserInfoServiceNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __rtc_internal_block_invoke()
{
  uint64_t v0 = RTCReportingLibraryCore();
  BOOL v1 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "linking RTCReporting.framework", buf, 2u);
    }
    rtc_internal_RTCReportingClass = (uint64_t)getRTCReportingClass();
    id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.OSAnalytics.RTCReporter", v2);
    uint64_t v4 = (void *)rtc_internal_rtc_queue;
    rtc_internal_rtc_queue = (uint64_t)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
    uint64_t v6 = (void *)rtc_internal_cfg_semaphore;
    rtc_internal_cfg_semaphore = (uint64_t)v5;

    uint64_t v7 = objc_opt_new();
    CFAllocatorRef v8 = (void *)rtc_internal_queued_events;
    rtc_internal_queued_events = v7;
  }
  else if (v1)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "RTCReporting.framework is unavailable", v9, 2u);
  }
}

void __rtc_internal_block_invoke_63(uint64_t a1)
{
  uint64_t v1 = a1;
  v59[3] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && (unint64_t)[(id)rtc_internal_queued_events count] <= 0x63)
  {
    id v2 = (void *)rtc_internal_queued_events;
    dispatch_queue_t v3 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v1 + 48)];
    v59[0] = v3;
    uint64_t v4 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v1 + 50)];
    uint64_t v5 = *(void *)(v1 + 32);
    v59[1] = v4;
    v59[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
    [v2 addObject:v6];
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)rtc_internal_cfg_semaphore, 0))
  {
    if (*(void *)(v1 + 32))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __rtc_internal_block_invoke_63_cold_3();
      }
    }
  }
  else
  {
    uint64_t v7 = rtc_internal_rtc_reporter;
    uint64_t v8 = [(id)rtc_internal_queued_events count];
    if (v7)
    {
      id v9 = &randomlySelectForRetention__logRetentionCountQueue;
      if (v8)
      {
        uint64_t v39 = v1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 134217984;
          uint64_t v58 = [(id)rtc_internal_queued_events count];
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "processing %zu events from queue", buf, 0xCu);
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        obuint64_t j = (id)rtc_internal_queued_events;
        uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v49 != v12) {
                objc_enumerationMutation(obj);
              }
              id v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              __int16 v15 = (void *)rtc_internal_rtc_reporter;
              __int16 v16 = [v14 objectAtIndexedSubscript:0];
              unsigned __int16 v17 = [v16 intValue];
              CFStringRef v18 = [v14 objectAtIndexedSubscript:1];
              unsigned __int16 v19 = [v18 intValue];
              uint64_t v20 = [v14 objectAtIndexedSubscript:2];
              [v15 sendMessageWithCategory:v17 type:v19 payload:v20 error:0];

              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
                __rtc_internal_block_invoke_63_cold_2(buf, v14, &v58);
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v11);
        }

        [(id)rtc_internal_queued_events removeAllObjects];
        id v9 = &randomlySelectForRetention__logRetentionCountQueue;
        rtc_internal_lastSend = dispatch_time(0, 0);
        uint64_t v1 = v39;
      }
      if (*(unsigned char *)(v1 + 52))
      {
        rtc_internal_release_pending = 0;
        dispatch_time_t v21 = v9[17];
        if (v21 <= dispatch_time(0, -10000000000))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)gid_t v47 = 0;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "releasing RTCReporting", v47, 2u);
          }
          uint64_t v22 = (void *)rtc_internal_rtc_reporter;
          rtc_internal_rtc_reporter = 0;
        }
      }
      if (rtc_internal_rtc_reporter && (rtc_internal_release_pending & 1) == 0)
      {
        rtc_internal_release_pending = 1;
        dispatch_time_t v23 = dispatch_time(v9[17], 10000000000);
        uint64_t v24 = rtc_internal_rtc_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __rtc_internal_block_invoke_65;
        block[3] = &unk_1E5D1F5F0;
        id v46 = *(id *)(v1 + 40);
        dispatch_after(v23, v24, block);
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
    }
    else if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "intializing RTCReporting...", buf, 2u);
      }
      uint64_t v25 = [NSNumber numberWithUnsignedInt:arc4random()];
      v54[0] = getkRTCReportingSessionInfoClientType();
      v55[0] = &unk_1EFE258F8;
      v54[1] = getkRTCReportingSessionInfoClientVersion();
      v55[1] = &unk_1EFE25910;
      v54[2] = getkRTCReportingSessionInfoBatchEvent();
      v55[2] = MEMORY[0x1E4F1CC38];
      v54[3] = getkRTCReportingSessionInfoSessionID();
      v55[3] = v25;
      v54[4] = getkRTCReportingSessionInfoContainsRealtimeEvents();
      v55[4] = MEMORY[0x1E4F1CC28];
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:5];
      v52[0] = getkRTCReportingUserInfoClientName();
      v53[0] = @"com.apple.CA";
      v52[1] = getkRTCReportingUserInfoServiceName();
      v53[1] = *(void *)(v1 + 40);
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
      uint64_t v28 = [objc_alloc((Class)rtc_internal_RTCReportingClass) initWithSessionInfo:v26 userInfo:v27 frameworksToCheck:0];
      uint64_t v29 = (void *)rtc_internal_rtc_reporter;
      rtc_internal_rtc_reporter = v28;

      uint64_t v30 = (void *)rtc_internal_rtc_reporter;
      if (rtc_internal_rtc_reporter)
      {
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __rtc_internal_block_invoke_66;
        v41[3] = &unk_1E5D20570;
        id v42 = v25;
        id v43 = *(id *)(v1 + 40);
        int v44 = *(_DWORD *)(v1 + 48);
        [v30 startConfigurationWithCompletionHandler:v41];
      }
      else
      {
        BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v31) {
          __rtc_internal_block_invoke_63_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
        }
        dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
      }
    }
  }
}

uint64_t __rtc_internal_block_invoke_65(uint64_t a1)
{
  return rtc_internal(1, *(void *)(a1 + 32), 0, 0, 0);
}

void __rtc_internal_block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v4 = [*(id *)(a1 + 32) intValue];
      v14[0] = 67109120;
      v14[1] = v4;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "configured RTCReporting with session id: %d", (uint8_t *)v14, 8u);
    }
    rtc_internal(0, *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50), 0);
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5) {
      __rtc_internal_block_invoke_66_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    id v13 = (void *)rtc_internal_rtc_reporter;
    rtc_internal_rtc_reporter = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A7CA8754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id OSASandboxExtensionForUserSubmissionDirectory(void *a1)
{
  id v1 = a1;
  id v2 = [@"~/Library/Logs/DiagnosticReports/" stringByExpandingTildeInPath];
  id v3 = (void *)[v2 UTF8String];

  if (v3)
  {
    uint64_t v4 = sandbox_extension_issue_file();
    if (v4)
    {
      BOOL v5 = (void *)v4;
      id v3 = [NSString stringWithUTF8String:v4];
      free(v5);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        OSASandboxExtensionForUserSubmissionDirectory_cold_1();
      }
      if (*__error() == 1)
      {
        id v7 = v1;
        AnalyticsSendEventLazy();
      }
      id v3 = 0;
    }
  }

  return v3;
}

id __OSASandboxExtensionForUserSubmissionDirectory_block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = getprogname();
  id v3 = v2;
  uint64_t v4 = *(__CFString **)(a1 + 32);
  BOOL v5 = @"<unknown>";
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = @"<unknown>";
  }
  v9[0] = @"bugType";
  v9[1] = @"progName";
  v10[0] = v6;
  if (v2)
  {
    BOOL v5 = [NSString stringWithUTF8String:v2];
  }
  v10[1] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v3) {

  }
  return v7;
}

void OSASandboxConsumeExtension(void *a1, void *a2)
{
  id v3 = a2;
  if (![a1 UTF8String])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      OSASandboxConsumeExtension_cold_1();
    }
    goto LABEL_10;
  }
  if (sandbox_extension_consume() < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      OSASandboxConsumeExtension_cold_2();
    }
LABEL_10:
    v3[2](v3);
    goto LABEL_11;
  }
  v3[2](v3);
  if ((sandbox_extension_release() & 0x80000000) != 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OSASandboxConsumeExtension_cold_3();
  }
LABEL_11:
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id OSAnalyticsHelperServiceConnection()
{
  if (OSAnalyticsHelperServiceConnection_onceToken != -1) {
    dispatch_once(&OSAnalyticsHelperServiceConnection_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)OSAnalyticsHelperServiceConnection_connection;
  return v0;
}

void __OSAnalyticsHelperServiceConnection_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0, 2uLL);
  id v1 = (void *)OSAnalyticsHelperServiceConnection_connection;
  OSAnalyticsHelperServiceConnection_connection = (uint64_t)mach_service;

  if (OSAnalyticsHelperServiceConnection_connection)
  {
    xpc_connection_set_event_handler((xpc_connection_t)OSAnalyticsHelperServiceConnection_connection, &__block_literal_global_4);
    id v2 = (_xpc_connection_s *)OSAnalyticsHelperServiceConnection_connection;
    xpc_connection_resume(v2);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446210;
    uint64_t v4 = "com.apple.osanalytics.osanalyticshelper";
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't get XPC connection to %{public}s", (uint8_t *)&v3, 0xCu);
  }
}

void __OSAnalyticsHelperServiceConnection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = v2;
  if (v2 != (id)MEMORY[0x1E4F14520]
    && MEMORY[0x1AD0D88F0](v2) == MEMORY[0x1E4F145A8]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
    int v5 = 136446466;
    uint64_t v6 = "com.apple.osanalytics.osanalyticshelper";
    __int16 v7 = 2082;
    uint64_t v8 = string;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Got xpc error message from %{public}s: %{public}s\n", (uint8_t *)&v5, 0x16u);
  }
}

uint64_t __xpc2ns_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = xpc2ns(a3);
  [v3 addObject:v4];

  return 1;
}

uint64_t mach_exception_raise(mach_port_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  int v19 = 0;
  long long v18 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v14 = 2;
  int v15 = a2;
  DWORD1(v16) = 1245184;
  DWORD2(v16) = a3;
  LODWORD(v17) = 1245184;
  *(void *)((char *)&v17 + 4) = *MEMORY[0x1E4F14068];
  HIDWORD(v17) = a4;
  if (a6 > 2) {
    return 4294966989;
  }
  int v9 = 8 * a6;
  __memcpy_chk();
  LODWORD(v1_Block_object_dispose(&STACK[0x230], 8) = a6;
  mach_port_t reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x96500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&rcv_name, 3, v9 + 68, 0x2Cu, reply_port, 0, 0);
  uint64_t v6 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name.msgh_local_port);
    return v6;
  }
  if (v11)
  {
    mig_dealloc_reply_port(rcv_name.msgh_local_port);
    return v6;
  }
  if (rcv_name.msgh_id == 71)
  {
    uint64_t v6 = 4294966988;
LABEL_19:
    mach_msg_destroy(&rcv_name);
    return v6;
  }
  if (rcv_name.msgh_id != 2505)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v6 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (rcv_name.msgh_size != 36) {
    goto LABEL_19;
  }
  if (rcv_name.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v6 = v16;
  if (v16) {
    goto LABEL_19;
  }
  return v6;
}

uint64_t mach_exception_raise_state(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  mach_port_name_t v9 = MEMORY[0x1F4188790]();
  memset(v36, 0, 480);
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  long long v35 = 0u;
  *((void *)&v35 + 1) = *MEMORY[0x1E4F14068];
  LODWORD(v36[0]) = v15;
  if (v10 <= 2)
  {
    long long v16 = v14;
    unsigned int v17 = v13;
    long long v18 = v12;
    int v19 = v11;
    unsigned int v20 = v10;
    mach_port_name_t v21 = v9;
    uint64_t v22 = 2 * v10;
    __memcpy_chk();
    DWORD1(v36[0]) = v20;
    dispatch_time_t v23 = &rcv_name[v22];
    rcv_name[v22 + 10] = *v19;
    if (v17 <= 0x510)
    {
      uint64_t v26 = (char *)(v23 - 4);
      int v27 = v22 * 4 + 4 * v17;
      memcpy(v23 + 12, v18, 4 * v17);
      *((_DWORD *)v26 + 15) = v17;
      mach_port_name_t reply_port = mig_get_reply_port();
      rcv_name[2] = v21;
      rcv_name[3] = reply_port;
      rcv_name[0] = 5395;
      *(void *)&long long v35 = 0x96600000000;
      if (MEMORY[0x1E4F14B18])
      {
        voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
        mach_port_name_t reply_port = rcv_name[3];
      }
      uint64_t v29 = mach_msg((mach_msg_header_t *)rcv_name, 3, v27 + 48, 0x1474u, reply_port, 0, 0);
      uint64_t v24 = v29;
      if ((v29 - 268435458) <= 0xE && ((1 << (v29 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(rcv_name[3]);
        return v24;
      }
      if (v29)
      {
        mig_dealloc_reply_port(rcv_name[3]);
        return v24;
      }
      if (DWORD1(v35) == 71)
      {
        uint64_t v24 = 4294966988;
      }
      else if (DWORD1(v35) == 2506)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] - 5229 <= 0xFFFFEBBE)
          {
            if (rcv_name[2]) {
              BOOL v30 = 1;
            }
            else {
              BOOL v30 = LODWORD(v36[0]) == 0;
            }
            if (!v30 && rcv_name[1] == 36) {
              uint64_t v24 = LODWORD(v36[0]);
            }
            else {
              uint64_t v24 = 4294966996;
            }
            goto LABEL_29;
          }
          if (!rcv_name[2])
          {
            uint64_t v24 = LODWORD(v36[0]);
            if (LODWORD(v36[0])) {
              goto LABEL_29;
            }
            int v32 = DWORD2(v36[0]);
            if (DWORD2(v36[0]) <= 0x510 && DWORD2(v36[0]) <= (rcv_name[1] - 44) >> 2)
            {
              size_t v33 = 4 * DWORD2(v36[0]);
              if (rcv_name[1] == 4 * DWORD2(v36[0]) + 44)
              {
                *int v19 = DWORD1(v36[0]);
                memcpy(v16, (char *)v36 + 12, v33);
                uint64_t v24 = 0;
                *a9 = v32;
                return v24;
              }
            }
          }
        }
        uint64_t v24 = 4294966996;
      }
      else
      {
        uint64_t v24 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v24;
    }
  }
  return 4294966989;
}

uint64_t mach_exception_raise_state_identity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, void *a10, _DWORD *a11)
{
  mach_port_t v11 = MEMORY[0x1F4188790]();
  uint64_t v67 = *MEMORY[0x1E4F143B8];
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
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v35 = 2;
  int v36 = v15;
  DWORD1(v37) = 1245184;
  DWORD2(v37) = v16;
  LODWORD(v3_Block_object_dispose(&STACK[0x230], 8) = 1245184;
  *(void *)((char *)&v38 + 4) = *MEMORY[0x1E4F14068];
  HIDWORD(v3_Block_object_dispose(&STACK[0x230], 8) = v17;
  if (v12 <= 2)
  {
    long long v18 = v14;
    int v19 = v13;
    unsigned int v20 = v12;
    mach_port_t v21 = v11;
    uint64_t v22 = 8 * v12;
    __memcpy_chk();
    LODWORD(v39) = v20;
    dispatch_time_t v23 = (char *)&rcv_name + v22;
    *(_DWORD *)((char *)&rcv_name + v22 + 6_Block_object_dispose(&STACK[0x230], 8) = *v19;
    if (a9 <= 0x510)
    {
      uint64_t v26 = v23 - 16;
      int v27 = v22 + 4 * a9;
      memcpy(v23 + 76, v18, 4 * a9);
      *((_DWORD *)v26 + 22) = a9;
      mach_port_t reply_port = mig_get_reply_port();
      rcv_name.msgh_remote_port = v21;
      rcv_name.msgh_local_port = reply_port;
      rcv_name.msgh_bits = -2147478253;
      *(void *)&rcv_name.msgh_voucher_port = 0x96700000000;
      if (MEMORY[0x1E4F14B18])
      {
        voucher_mach_msg_set(&rcv_name);
        mach_port_t reply_port = rcv_name.msgh_local_port;
      }
      uint64_t v29 = mach_msg(&rcv_name, 3, v27 + 76, 0x1474u, reply_port, 0, 0);
      uint64_t v24 = v29;
      if ((v29 - 268435458) <= 0xE && ((1 << (v29 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(rcv_name.msgh_local_port);
        return v24;
      }
      if (v29)
      {
        mig_dealloc_reply_port(rcv_name.msgh_local_port);
        return v24;
      }
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v24 = 4294966988;
      }
      else if (rcv_name.msgh_id == 2507)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size - 5229 <= 0xFFFFEBBE)
          {
            if (rcv_name.msgh_remote_port) {
              BOOL v30 = 1;
            }
            else {
              BOOL v30 = v37 == 0;
            }
            if (!v30 && rcv_name.msgh_size == 36) {
              uint64_t v24 = v37;
            }
            else {
              uint64_t v24 = 4294966996;
            }
            goto LABEL_29;
          }
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v24 = v37;
            if (v37) {
              goto LABEL_29;
            }
            int v32 = DWORD2(v37);
            if (DWORD2(v37) <= 0x510 && DWORD2(v37) <= (rcv_name.msgh_size - 44) >> 2)
            {
              size_t v33 = 4 * DWORD2(v37);
              if (rcv_name.msgh_size == 4 * DWORD2(v37) + 44)
              {
                *int v19 = DWORD1(v37);
                memcpy(a10, (char *)&v37 + 12, v33);
                uint64_t v24 = 0;
                *a11 = v32;
                return v24;
              }
            }
          }
        }
        uint64_t v24 = 4294966996;
      }
      else
      {
        uint64_t v24 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v24;
    }
  }
  return 4294966989;
}

uint64_t rc_sync_request(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  memset(&msg_4[16], 0, 32);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(void *)&msg_4[28] = a2;
  *(void *)&msg_4[36] = a3;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x96B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x30u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
      return v8;
    }
    if (*(_DWORD *)&msg_4[16] == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg_4[16] == 2511)
    {
      if ((msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)msg_4 == 44)
        {
          if (!*(_DWORD *)&msg_4[4])
          {
            uint64_t v8 = *(unsigned int *)&msg_4[28];
            if (!*(_DWORD *)&msg_4[28])
            {
              *a4 = *(void *)&msg_4[32];
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          if (*(_DWORD *)&msg_4[4]) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = *(_DWORD *)&msg_4[28] == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = *(unsigned int *)&msg_4[28];
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  return v8;
}

void SimulateCrash_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v1, 0xCu);
}

void SimulateCrash_cold_2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "SimulateCrash() on another process is not supported", v0, 2u);
}

uint64_t __getOSADiagnosticsReporterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getDiagnosticsReporterLaunchOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getDiagnosticsReporterLaunchOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[OSATasking applyTasking:taskId:fromBlob:](v0);
}

void matchSelector_cold_1(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = " nope";
  int v4 = 136315650;
  if (a1) {
    uint64_t v3 = "MATCH";
  }
  int v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s: %@ vs %@", (uint8_t *)&v4, 0x20u);
}

uint64_t getACAccountTypeIdentifierExchange_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __37__OSASystemConfiguration_internalKey__block_invoke_331_cold_2(v0);
}

uint64_t __getACAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[OSACrackShotReport getThermalPressureLevel](v0);
}

void __OSASanitizePath_block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v1 = [a1 componentsJoinedByString:@"\n"];
  int v2 = 138412546;
  uint64_t v3 = @"HomeDirectory";
  __int16 v4 = 2112;
  int v5 = v1;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@:\n%@", (uint8_t *)&v2, 0x16u);
}

void getVolumes_cold_1(char a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1) {
    int v2 = @"MountedVolume";
  }
  else {
    int v2 = @"NetworkVolume";
  }
  uint64_t v3 = [a2 componentsJoinedByString:@"\n"];
  int v4 = 138412546;
  int v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@:\n%@", (uint8_t *)&v4, 0x16u);
}

void __OSASanitizePath_block_invoke_47_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "found prefix in domain %@", (uint8_t *)&v2, 0xCu);
}

void __OSASanitizePath_block_invoke_47_cold_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "search for matches in '%@'", (uint8_t *)&v2, 0xCu);
}

void logForAppleCare_cold_1(void *a1)
{
  uint64_t v1 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_0_5(&dword_1A7C6D000, MEMORY[0x1E4F14500], v2, "AppleCareSupport: event \"%@\"", v3, v4, v5, v6, 2u);
}

void purgeR3Logs_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __openR3_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OSASafeOpen_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "'%{public}s' is not safe because it has at least one hard link", (uint8_t *)&v1, 0xCu);
}

void OSASafeOpen_cold_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to stat '%{public}s'", (uint8_t *)&v1, 0xCu);
}

void OSASafeOpen_cold_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to safely open '%{public}s': %{public}s", (uint8_t *)&v4, 0x16u);
}

void OSASafeCreateDirectory_cold_1(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 path];
  *(_DWORD *)a1 = 138543362;
  *a3 = v5;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to set file protection class while creating %{public}@", a1, 0xCu);
}

void _CRCopyAnonHostUUIDPath_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  int v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint64_t v5 = v2;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to determine UUID for host. Error: %d %s", (uint8_t *)v3, 0x12u);
}

void rtcsc_send_base_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getRTCReportingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __rtc_internal_block_invoke_63_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __rtc_internal_block_invoke_63_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void __rtc_internal_block_invoke_63_cold_2(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 objectAtIndexedSubscript:2];
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "sent RTCReporting %@", a1, 0xCu);
}

void __rtc_internal_block_invoke_63_cold_3()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "event queued pending RTCReporting intialization", v0, 2u);
}

void __rtc_internal_block_invoke_66_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OSASandboxExtensionForUserSubmissionDirectory_cold_1()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_2(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "Error issuing sandbox extension: %i (%s)", v2, v3, v4, v5, 2u);
}

void OSASandboxConsumeExtension_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Sandbox extension token was missing.", v0, 2u);
}

void OSASandboxConsumeExtension_cold_2()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_2(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "Failed to consume sandbox extension: %s (%i)", v2, v3, v4, v5, v6);
}

void OSASandboxConsumeExtension_cold_3()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_2(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "Failed to release sandbox extension: %s (%i)", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsNotifyTaskingAvailable()
{
  return MEMORY[0x1F4113890]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x1F40D77C0]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t CSIsNull()
{
  return MEMORY[0x1F4115608]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1F4115668]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1F41156D0]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x1F4115858]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x1F41158A8]();
}

uint64_t CSSymbolicatorGetFlagsForNListOnlyData()
{
  return MEMORY[0x1F4115928]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x1F4115998]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1F40E9290]();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x1F40C9A18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x1F40D8F38]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1F40D8F40]();
}

uint64_t _CFPreferencesGetUserIdentifierForUID()
{
  return MEMORY[0x1F40D8F78]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1F40D8FB0]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1F40C9EA8]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1F40C9EB0]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1F40C9EF0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_addrandom(unsigned __int8 *a1, int a2)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1F40CBF08]();
}

void endpwent(void)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC158](*(void *)&fd, namebuff, size, *(void *)&options);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1F40CC1B0](a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1F40CC3A8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

gid_t getgid(void)
{
  return MEMORY[0x1F40CC3D0]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x1F40CC440](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

kern_return_t host_check_multiuser_mode(host_t host, uint32_t *multiuser_mode)
{
  return MEMORY[0x1F40CC5E8](*(void *)&host, multiuser_mode);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x1F40CC628](*(void *)&host_priv, *(void *)&flavor, host_info64_out, host_info64_outCnt);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1F40CCDD8](*(void *)&a1, a2, a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1F40CD668]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1F40CDD68](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

uint64_t stackshot_capture_with_config()
{
  return MEMORY[0x1F40CE0E0]();
}

uint64_t stackshot_config_create()
{
  return MEMORY[0x1F40CE0E8]();
}

uint64_t stackshot_config_dealloc()
{
  return MEMORY[0x1F40CE0F0]();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return MEMORY[0x1F40CE0F8]();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return MEMORY[0x1F40CE100]();
}

uint64_t stackshot_config_set_flags()
{
  return MEMORY[0x1F40CE108]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1F40CE490]();
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1F40CE4D8](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1F40CE5C0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CE5E8](*(void *)&a1, a2, *(void *)&a3);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1F40CE620](a1, a2);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
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

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
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

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1F40CEDD8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1F40CEDF0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
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

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF018](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}